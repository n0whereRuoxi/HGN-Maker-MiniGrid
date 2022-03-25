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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9449 - BLOCK
      ?auto_9450 - BLOCK
      ?auto_9451 - BLOCK
      ?auto_9452 - BLOCK
    )
    :vars
    (
      ?auto_9453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9453 ?auto_9452 ) ( CLEAR ?auto_9453 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9449 ) ( ON ?auto_9450 ?auto_9449 ) ( ON ?auto_9451 ?auto_9450 ) ( ON ?auto_9452 ?auto_9451 ) ( not ( = ?auto_9449 ?auto_9450 ) ) ( not ( = ?auto_9449 ?auto_9451 ) ) ( not ( = ?auto_9449 ?auto_9452 ) ) ( not ( = ?auto_9449 ?auto_9453 ) ) ( not ( = ?auto_9450 ?auto_9451 ) ) ( not ( = ?auto_9450 ?auto_9452 ) ) ( not ( = ?auto_9450 ?auto_9453 ) ) ( not ( = ?auto_9451 ?auto_9452 ) ) ( not ( = ?auto_9451 ?auto_9453 ) ) ( not ( = ?auto_9452 ?auto_9453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9453 ?auto_9452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9455 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9455 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9456 - BLOCK
    )
    :vars
    (
      ?auto_9457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9456 ?auto_9457 ) ( CLEAR ?auto_9456 ) ( HAND-EMPTY ) ( not ( = ?auto_9456 ?auto_9457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9456 ?auto_9457 )
      ( MAKE-1PILE ?auto_9456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9461 - BLOCK
      ?auto_9462 - BLOCK
      ?auto_9463 - BLOCK
    )
    :vars
    (
      ?auto_9464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9464 ?auto_9463 ) ( CLEAR ?auto_9464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9461 ) ( ON ?auto_9462 ?auto_9461 ) ( ON ?auto_9463 ?auto_9462 ) ( not ( = ?auto_9461 ?auto_9462 ) ) ( not ( = ?auto_9461 ?auto_9463 ) ) ( not ( = ?auto_9461 ?auto_9464 ) ) ( not ( = ?auto_9462 ?auto_9463 ) ) ( not ( = ?auto_9462 ?auto_9464 ) ) ( not ( = ?auto_9463 ?auto_9464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9464 ?auto_9463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9465 - BLOCK
      ?auto_9466 - BLOCK
      ?auto_9467 - BLOCK
    )
    :vars
    (
      ?auto_9468 - BLOCK
      ?auto_9469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9468 ?auto_9467 ) ( CLEAR ?auto_9468 ) ( ON-TABLE ?auto_9465 ) ( ON ?auto_9466 ?auto_9465 ) ( ON ?auto_9467 ?auto_9466 ) ( not ( = ?auto_9465 ?auto_9466 ) ) ( not ( = ?auto_9465 ?auto_9467 ) ) ( not ( = ?auto_9465 ?auto_9468 ) ) ( not ( = ?auto_9466 ?auto_9467 ) ) ( not ( = ?auto_9466 ?auto_9468 ) ) ( not ( = ?auto_9467 ?auto_9468 ) ) ( HOLDING ?auto_9469 ) ( not ( = ?auto_9465 ?auto_9469 ) ) ( not ( = ?auto_9466 ?auto_9469 ) ) ( not ( = ?auto_9467 ?auto_9469 ) ) ( not ( = ?auto_9468 ?auto_9469 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9469 )
      ( MAKE-3PILE ?auto_9465 ?auto_9466 ?auto_9467 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9470 - BLOCK
      ?auto_9471 - BLOCK
      ?auto_9472 - BLOCK
    )
    :vars
    (
      ?auto_9474 - BLOCK
      ?auto_9473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9474 ?auto_9472 ) ( ON-TABLE ?auto_9470 ) ( ON ?auto_9471 ?auto_9470 ) ( ON ?auto_9472 ?auto_9471 ) ( not ( = ?auto_9470 ?auto_9471 ) ) ( not ( = ?auto_9470 ?auto_9472 ) ) ( not ( = ?auto_9470 ?auto_9474 ) ) ( not ( = ?auto_9471 ?auto_9472 ) ) ( not ( = ?auto_9471 ?auto_9474 ) ) ( not ( = ?auto_9472 ?auto_9474 ) ) ( not ( = ?auto_9470 ?auto_9473 ) ) ( not ( = ?auto_9471 ?auto_9473 ) ) ( not ( = ?auto_9472 ?auto_9473 ) ) ( not ( = ?auto_9474 ?auto_9473 ) ) ( ON ?auto_9473 ?auto_9474 ) ( CLEAR ?auto_9473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9470 ?auto_9471 ?auto_9472 ?auto_9474 )
      ( MAKE-3PILE ?auto_9470 ?auto_9471 ?auto_9472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9477 - BLOCK
      ?auto_9478 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9478 ) ( CLEAR ?auto_9477 ) ( ON-TABLE ?auto_9477 ) ( not ( = ?auto_9477 ?auto_9478 ) ) )
    :subtasks
    ( ( !STACK ?auto_9478 ?auto_9477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9479 - BLOCK
      ?auto_9480 - BLOCK
    )
    :vars
    (
      ?auto_9481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9479 ) ( ON-TABLE ?auto_9479 ) ( not ( = ?auto_9479 ?auto_9480 ) ) ( ON ?auto_9480 ?auto_9481 ) ( CLEAR ?auto_9480 ) ( HAND-EMPTY ) ( not ( = ?auto_9479 ?auto_9481 ) ) ( not ( = ?auto_9480 ?auto_9481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9480 ?auto_9481 )
      ( MAKE-2PILE ?auto_9479 ?auto_9480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9482 - BLOCK
      ?auto_9483 - BLOCK
    )
    :vars
    (
      ?auto_9484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9482 ?auto_9483 ) ) ( ON ?auto_9483 ?auto_9484 ) ( CLEAR ?auto_9483 ) ( not ( = ?auto_9482 ?auto_9484 ) ) ( not ( = ?auto_9483 ?auto_9484 ) ) ( HOLDING ?auto_9482 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9482 )
      ( MAKE-2PILE ?auto_9482 ?auto_9483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9485 - BLOCK
      ?auto_9486 - BLOCK
    )
    :vars
    (
      ?auto_9487 - BLOCK
      ?auto_9489 - BLOCK
      ?auto_9488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9485 ?auto_9486 ) ) ( ON ?auto_9486 ?auto_9487 ) ( not ( = ?auto_9485 ?auto_9487 ) ) ( not ( = ?auto_9486 ?auto_9487 ) ) ( ON ?auto_9485 ?auto_9486 ) ( CLEAR ?auto_9485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9489 ) ( ON ?auto_9488 ?auto_9489 ) ( ON ?auto_9487 ?auto_9488 ) ( not ( = ?auto_9489 ?auto_9488 ) ) ( not ( = ?auto_9489 ?auto_9487 ) ) ( not ( = ?auto_9489 ?auto_9486 ) ) ( not ( = ?auto_9489 ?auto_9485 ) ) ( not ( = ?auto_9488 ?auto_9487 ) ) ( not ( = ?auto_9488 ?auto_9486 ) ) ( not ( = ?auto_9488 ?auto_9485 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9489 ?auto_9488 ?auto_9487 ?auto_9486 )
      ( MAKE-2PILE ?auto_9485 ?auto_9486 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9492 - BLOCK
      ?auto_9493 - BLOCK
    )
    :vars
    (
      ?auto_9494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9494 ?auto_9493 ) ( CLEAR ?auto_9494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9492 ) ( ON ?auto_9493 ?auto_9492 ) ( not ( = ?auto_9492 ?auto_9493 ) ) ( not ( = ?auto_9492 ?auto_9494 ) ) ( not ( = ?auto_9493 ?auto_9494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9494 ?auto_9493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9495 - BLOCK
      ?auto_9496 - BLOCK
    )
    :vars
    (
      ?auto_9497 - BLOCK
      ?auto_9498 - BLOCK
      ?auto_9499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9497 ?auto_9496 ) ( CLEAR ?auto_9497 ) ( ON-TABLE ?auto_9495 ) ( ON ?auto_9496 ?auto_9495 ) ( not ( = ?auto_9495 ?auto_9496 ) ) ( not ( = ?auto_9495 ?auto_9497 ) ) ( not ( = ?auto_9496 ?auto_9497 ) ) ( HOLDING ?auto_9498 ) ( CLEAR ?auto_9499 ) ( not ( = ?auto_9495 ?auto_9498 ) ) ( not ( = ?auto_9495 ?auto_9499 ) ) ( not ( = ?auto_9496 ?auto_9498 ) ) ( not ( = ?auto_9496 ?auto_9499 ) ) ( not ( = ?auto_9497 ?auto_9498 ) ) ( not ( = ?auto_9497 ?auto_9499 ) ) ( not ( = ?auto_9498 ?auto_9499 ) ) )
    :subtasks
    ( ( !STACK ?auto_9498 ?auto_9499 )
      ( MAKE-2PILE ?auto_9495 ?auto_9496 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9500 - BLOCK
      ?auto_9501 - BLOCK
    )
    :vars
    (
      ?auto_9502 - BLOCK
      ?auto_9504 - BLOCK
      ?auto_9503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9502 ?auto_9501 ) ( ON-TABLE ?auto_9500 ) ( ON ?auto_9501 ?auto_9500 ) ( not ( = ?auto_9500 ?auto_9501 ) ) ( not ( = ?auto_9500 ?auto_9502 ) ) ( not ( = ?auto_9501 ?auto_9502 ) ) ( CLEAR ?auto_9504 ) ( not ( = ?auto_9500 ?auto_9503 ) ) ( not ( = ?auto_9500 ?auto_9504 ) ) ( not ( = ?auto_9501 ?auto_9503 ) ) ( not ( = ?auto_9501 ?auto_9504 ) ) ( not ( = ?auto_9502 ?auto_9503 ) ) ( not ( = ?auto_9502 ?auto_9504 ) ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( ON ?auto_9503 ?auto_9502 ) ( CLEAR ?auto_9503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9500 ?auto_9501 ?auto_9502 )
      ( MAKE-2PILE ?auto_9500 ?auto_9501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9505 - BLOCK
      ?auto_9506 - BLOCK
    )
    :vars
    (
      ?auto_9508 - BLOCK
      ?auto_9509 - BLOCK
      ?auto_9507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9508 ?auto_9506 ) ( ON-TABLE ?auto_9505 ) ( ON ?auto_9506 ?auto_9505 ) ( not ( = ?auto_9505 ?auto_9506 ) ) ( not ( = ?auto_9505 ?auto_9508 ) ) ( not ( = ?auto_9506 ?auto_9508 ) ) ( not ( = ?auto_9505 ?auto_9509 ) ) ( not ( = ?auto_9505 ?auto_9507 ) ) ( not ( = ?auto_9506 ?auto_9509 ) ) ( not ( = ?auto_9506 ?auto_9507 ) ) ( not ( = ?auto_9508 ?auto_9509 ) ) ( not ( = ?auto_9508 ?auto_9507 ) ) ( not ( = ?auto_9509 ?auto_9507 ) ) ( ON ?auto_9509 ?auto_9508 ) ( CLEAR ?auto_9509 ) ( HOLDING ?auto_9507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9507 )
      ( MAKE-2PILE ?auto_9505 ?auto_9506 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9510 - BLOCK
      ?auto_9511 - BLOCK
    )
    :vars
    (
      ?auto_9513 - BLOCK
      ?auto_9514 - BLOCK
      ?auto_9512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9513 ?auto_9511 ) ( ON-TABLE ?auto_9510 ) ( ON ?auto_9511 ?auto_9510 ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( not ( = ?auto_9510 ?auto_9513 ) ) ( not ( = ?auto_9511 ?auto_9513 ) ) ( not ( = ?auto_9510 ?auto_9514 ) ) ( not ( = ?auto_9510 ?auto_9512 ) ) ( not ( = ?auto_9511 ?auto_9514 ) ) ( not ( = ?auto_9511 ?auto_9512 ) ) ( not ( = ?auto_9513 ?auto_9514 ) ) ( not ( = ?auto_9513 ?auto_9512 ) ) ( not ( = ?auto_9514 ?auto_9512 ) ) ( ON ?auto_9514 ?auto_9513 ) ( ON ?auto_9512 ?auto_9514 ) ( CLEAR ?auto_9512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9510 ?auto_9511 ?auto_9513 ?auto_9514 )
      ( MAKE-2PILE ?auto_9510 ?auto_9511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9518 - BLOCK
      ?auto_9519 - BLOCK
      ?auto_9520 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9520 ) ( CLEAR ?auto_9519 ) ( ON-TABLE ?auto_9518 ) ( ON ?auto_9519 ?auto_9518 ) ( not ( = ?auto_9518 ?auto_9519 ) ) ( not ( = ?auto_9518 ?auto_9520 ) ) ( not ( = ?auto_9519 ?auto_9520 ) ) )
    :subtasks
    ( ( !STACK ?auto_9520 ?auto_9519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9521 - BLOCK
      ?auto_9522 - BLOCK
      ?auto_9523 - BLOCK
    )
    :vars
    (
      ?auto_9524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9522 ) ( ON-TABLE ?auto_9521 ) ( ON ?auto_9522 ?auto_9521 ) ( not ( = ?auto_9521 ?auto_9522 ) ) ( not ( = ?auto_9521 ?auto_9523 ) ) ( not ( = ?auto_9522 ?auto_9523 ) ) ( ON ?auto_9523 ?auto_9524 ) ( CLEAR ?auto_9523 ) ( HAND-EMPTY ) ( not ( = ?auto_9521 ?auto_9524 ) ) ( not ( = ?auto_9522 ?auto_9524 ) ) ( not ( = ?auto_9523 ?auto_9524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9523 ?auto_9524 )
      ( MAKE-3PILE ?auto_9521 ?auto_9522 ?auto_9523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9525 - BLOCK
      ?auto_9526 - BLOCK
      ?auto_9527 - BLOCK
    )
    :vars
    (
      ?auto_9528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9525 ) ( not ( = ?auto_9525 ?auto_9526 ) ) ( not ( = ?auto_9525 ?auto_9527 ) ) ( not ( = ?auto_9526 ?auto_9527 ) ) ( ON ?auto_9527 ?auto_9528 ) ( CLEAR ?auto_9527 ) ( not ( = ?auto_9525 ?auto_9528 ) ) ( not ( = ?auto_9526 ?auto_9528 ) ) ( not ( = ?auto_9527 ?auto_9528 ) ) ( HOLDING ?auto_9526 ) ( CLEAR ?auto_9525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9525 ?auto_9526 )
      ( MAKE-3PILE ?auto_9525 ?auto_9526 ?auto_9527 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9529 - BLOCK
      ?auto_9530 - BLOCK
      ?auto_9531 - BLOCK
    )
    :vars
    (
      ?auto_9532 - BLOCK
      ?auto_9533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9529 ) ( not ( = ?auto_9529 ?auto_9530 ) ) ( not ( = ?auto_9529 ?auto_9531 ) ) ( not ( = ?auto_9530 ?auto_9531 ) ) ( ON ?auto_9531 ?auto_9532 ) ( not ( = ?auto_9529 ?auto_9532 ) ) ( not ( = ?auto_9530 ?auto_9532 ) ) ( not ( = ?auto_9531 ?auto_9532 ) ) ( CLEAR ?auto_9529 ) ( ON ?auto_9530 ?auto_9531 ) ( CLEAR ?auto_9530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9533 ) ( ON ?auto_9532 ?auto_9533 ) ( not ( = ?auto_9533 ?auto_9532 ) ) ( not ( = ?auto_9533 ?auto_9531 ) ) ( not ( = ?auto_9533 ?auto_9530 ) ) ( not ( = ?auto_9529 ?auto_9533 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9533 ?auto_9532 ?auto_9531 )
      ( MAKE-3PILE ?auto_9529 ?auto_9530 ?auto_9531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9534 - BLOCK
      ?auto_9535 - BLOCK
      ?auto_9536 - BLOCK
    )
    :vars
    (
      ?auto_9537 - BLOCK
      ?auto_9538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9534 ?auto_9535 ) ) ( not ( = ?auto_9534 ?auto_9536 ) ) ( not ( = ?auto_9535 ?auto_9536 ) ) ( ON ?auto_9536 ?auto_9537 ) ( not ( = ?auto_9534 ?auto_9537 ) ) ( not ( = ?auto_9535 ?auto_9537 ) ) ( not ( = ?auto_9536 ?auto_9537 ) ) ( ON ?auto_9535 ?auto_9536 ) ( CLEAR ?auto_9535 ) ( ON-TABLE ?auto_9538 ) ( ON ?auto_9537 ?auto_9538 ) ( not ( = ?auto_9538 ?auto_9537 ) ) ( not ( = ?auto_9538 ?auto_9536 ) ) ( not ( = ?auto_9538 ?auto_9535 ) ) ( not ( = ?auto_9534 ?auto_9538 ) ) ( HOLDING ?auto_9534 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9534 )
      ( MAKE-3PILE ?auto_9534 ?auto_9535 ?auto_9536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9539 - BLOCK
      ?auto_9540 - BLOCK
      ?auto_9541 - BLOCK
    )
    :vars
    (
      ?auto_9542 - BLOCK
      ?auto_9543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9539 ?auto_9540 ) ) ( not ( = ?auto_9539 ?auto_9541 ) ) ( not ( = ?auto_9540 ?auto_9541 ) ) ( ON ?auto_9541 ?auto_9542 ) ( not ( = ?auto_9539 ?auto_9542 ) ) ( not ( = ?auto_9540 ?auto_9542 ) ) ( not ( = ?auto_9541 ?auto_9542 ) ) ( ON ?auto_9540 ?auto_9541 ) ( ON-TABLE ?auto_9543 ) ( ON ?auto_9542 ?auto_9543 ) ( not ( = ?auto_9543 ?auto_9542 ) ) ( not ( = ?auto_9543 ?auto_9541 ) ) ( not ( = ?auto_9543 ?auto_9540 ) ) ( not ( = ?auto_9539 ?auto_9543 ) ) ( ON ?auto_9539 ?auto_9540 ) ( CLEAR ?auto_9539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9543 ?auto_9542 ?auto_9541 ?auto_9540 )
      ( MAKE-3PILE ?auto_9539 ?auto_9540 ?auto_9541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9545 - BLOCK
    )
    :vars
    (
      ?auto_9546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9546 ?auto_9545 ) ( CLEAR ?auto_9546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9545 ) ( not ( = ?auto_9545 ?auto_9546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9546 ?auto_9545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9547 - BLOCK
    )
    :vars
    (
      ?auto_9548 - BLOCK
      ?auto_9549 - BLOCK
      ?auto_9550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9548 ?auto_9547 ) ( CLEAR ?auto_9548 ) ( ON-TABLE ?auto_9547 ) ( not ( = ?auto_9547 ?auto_9548 ) ) ( HOLDING ?auto_9549 ) ( CLEAR ?auto_9550 ) ( not ( = ?auto_9547 ?auto_9549 ) ) ( not ( = ?auto_9547 ?auto_9550 ) ) ( not ( = ?auto_9548 ?auto_9549 ) ) ( not ( = ?auto_9548 ?auto_9550 ) ) ( not ( = ?auto_9549 ?auto_9550 ) ) )
    :subtasks
    ( ( !STACK ?auto_9549 ?auto_9550 )
      ( MAKE-1PILE ?auto_9547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9551 - BLOCK
    )
    :vars
    (
      ?auto_9552 - BLOCK
      ?auto_9553 - BLOCK
      ?auto_9554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9552 ?auto_9551 ) ( ON-TABLE ?auto_9551 ) ( not ( = ?auto_9551 ?auto_9552 ) ) ( CLEAR ?auto_9553 ) ( not ( = ?auto_9551 ?auto_9554 ) ) ( not ( = ?auto_9551 ?auto_9553 ) ) ( not ( = ?auto_9552 ?auto_9554 ) ) ( not ( = ?auto_9552 ?auto_9553 ) ) ( not ( = ?auto_9554 ?auto_9553 ) ) ( ON ?auto_9554 ?auto_9552 ) ( CLEAR ?auto_9554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9551 ?auto_9552 )
      ( MAKE-1PILE ?auto_9551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9555 - BLOCK
    )
    :vars
    (
      ?auto_9558 - BLOCK
      ?auto_9557 - BLOCK
      ?auto_9556 - BLOCK
      ?auto_9559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9558 ?auto_9555 ) ( ON-TABLE ?auto_9555 ) ( not ( = ?auto_9555 ?auto_9558 ) ) ( not ( = ?auto_9555 ?auto_9557 ) ) ( not ( = ?auto_9555 ?auto_9556 ) ) ( not ( = ?auto_9558 ?auto_9557 ) ) ( not ( = ?auto_9558 ?auto_9556 ) ) ( not ( = ?auto_9557 ?auto_9556 ) ) ( ON ?auto_9557 ?auto_9558 ) ( CLEAR ?auto_9557 ) ( HOLDING ?auto_9556 ) ( CLEAR ?auto_9559 ) ( ON-TABLE ?auto_9559 ) ( not ( = ?auto_9559 ?auto_9556 ) ) ( not ( = ?auto_9555 ?auto_9559 ) ) ( not ( = ?auto_9558 ?auto_9559 ) ) ( not ( = ?auto_9557 ?auto_9559 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9559 ?auto_9556 )
      ( MAKE-1PILE ?auto_9555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9560 - BLOCK
    )
    :vars
    (
      ?auto_9564 - BLOCK
      ?auto_9563 - BLOCK
      ?auto_9561 - BLOCK
      ?auto_9562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9564 ?auto_9560 ) ( ON-TABLE ?auto_9560 ) ( not ( = ?auto_9560 ?auto_9564 ) ) ( not ( = ?auto_9560 ?auto_9563 ) ) ( not ( = ?auto_9560 ?auto_9561 ) ) ( not ( = ?auto_9564 ?auto_9563 ) ) ( not ( = ?auto_9564 ?auto_9561 ) ) ( not ( = ?auto_9563 ?auto_9561 ) ) ( ON ?auto_9563 ?auto_9564 ) ( CLEAR ?auto_9562 ) ( ON-TABLE ?auto_9562 ) ( not ( = ?auto_9562 ?auto_9561 ) ) ( not ( = ?auto_9560 ?auto_9562 ) ) ( not ( = ?auto_9564 ?auto_9562 ) ) ( not ( = ?auto_9563 ?auto_9562 ) ) ( ON ?auto_9561 ?auto_9563 ) ( CLEAR ?auto_9561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9560 ?auto_9564 ?auto_9563 )
      ( MAKE-1PILE ?auto_9560 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9565 - BLOCK
    )
    :vars
    (
      ?auto_9566 - BLOCK
      ?auto_9569 - BLOCK
      ?auto_9567 - BLOCK
      ?auto_9568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9566 ?auto_9565 ) ( ON-TABLE ?auto_9565 ) ( not ( = ?auto_9565 ?auto_9566 ) ) ( not ( = ?auto_9565 ?auto_9569 ) ) ( not ( = ?auto_9565 ?auto_9567 ) ) ( not ( = ?auto_9566 ?auto_9569 ) ) ( not ( = ?auto_9566 ?auto_9567 ) ) ( not ( = ?auto_9569 ?auto_9567 ) ) ( ON ?auto_9569 ?auto_9566 ) ( not ( = ?auto_9568 ?auto_9567 ) ) ( not ( = ?auto_9565 ?auto_9568 ) ) ( not ( = ?auto_9566 ?auto_9568 ) ) ( not ( = ?auto_9569 ?auto_9568 ) ) ( ON ?auto_9567 ?auto_9569 ) ( CLEAR ?auto_9567 ) ( HOLDING ?auto_9568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9568 )
      ( MAKE-1PILE ?auto_9565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9570 - BLOCK
    )
    :vars
    (
      ?auto_9572 - BLOCK
      ?auto_9571 - BLOCK
      ?auto_9574 - BLOCK
      ?auto_9573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9572 ?auto_9570 ) ( ON-TABLE ?auto_9570 ) ( not ( = ?auto_9570 ?auto_9572 ) ) ( not ( = ?auto_9570 ?auto_9571 ) ) ( not ( = ?auto_9570 ?auto_9574 ) ) ( not ( = ?auto_9572 ?auto_9571 ) ) ( not ( = ?auto_9572 ?auto_9574 ) ) ( not ( = ?auto_9571 ?auto_9574 ) ) ( ON ?auto_9571 ?auto_9572 ) ( not ( = ?auto_9573 ?auto_9574 ) ) ( not ( = ?auto_9570 ?auto_9573 ) ) ( not ( = ?auto_9572 ?auto_9573 ) ) ( not ( = ?auto_9571 ?auto_9573 ) ) ( ON ?auto_9574 ?auto_9571 ) ( ON ?auto_9573 ?auto_9574 ) ( CLEAR ?auto_9573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9570 ?auto_9572 ?auto_9571 ?auto_9574 )
      ( MAKE-1PILE ?auto_9570 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9579 - BLOCK
      ?auto_9580 - BLOCK
      ?auto_9581 - BLOCK
      ?auto_9582 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9582 ) ( CLEAR ?auto_9581 ) ( ON-TABLE ?auto_9579 ) ( ON ?auto_9580 ?auto_9579 ) ( ON ?auto_9581 ?auto_9580 ) ( not ( = ?auto_9579 ?auto_9580 ) ) ( not ( = ?auto_9579 ?auto_9581 ) ) ( not ( = ?auto_9579 ?auto_9582 ) ) ( not ( = ?auto_9580 ?auto_9581 ) ) ( not ( = ?auto_9580 ?auto_9582 ) ) ( not ( = ?auto_9581 ?auto_9582 ) ) )
    :subtasks
    ( ( !STACK ?auto_9582 ?auto_9581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9583 - BLOCK
      ?auto_9584 - BLOCK
      ?auto_9585 - BLOCK
      ?auto_9586 - BLOCK
    )
    :vars
    (
      ?auto_9587 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9585 ) ( ON-TABLE ?auto_9583 ) ( ON ?auto_9584 ?auto_9583 ) ( ON ?auto_9585 ?auto_9584 ) ( not ( = ?auto_9583 ?auto_9584 ) ) ( not ( = ?auto_9583 ?auto_9585 ) ) ( not ( = ?auto_9583 ?auto_9586 ) ) ( not ( = ?auto_9584 ?auto_9585 ) ) ( not ( = ?auto_9584 ?auto_9586 ) ) ( not ( = ?auto_9585 ?auto_9586 ) ) ( ON ?auto_9586 ?auto_9587 ) ( CLEAR ?auto_9586 ) ( HAND-EMPTY ) ( not ( = ?auto_9583 ?auto_9587 ) ) ( not ( = ?auto_9584 ?auto_9587 ) ) ( not ( = ?auto_9585 ?auto_9587 ) ) ( not ( = ?auto_9586 ?auto_9587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9586 ?auto_9587 )
      ( MAKE-4PILE ?auto_9583 ?auto_9584 ?auto_9585 ?auto_9586 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9588 - BLOCK
      ?auto_9589 - BLOCK
      ?auto_9590 - BLOCK
      ?auto_9591 - BLOCK
    )
    :vars
    (
      ?auto_9592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9588 ) ( ON ?auto_9589 ?auto_9588 ) ( not ( = ?auto_9588 ?auto_9589 ) ) ( not ( = ?auto_9588 ?auto_9590 ) ) ( not ( = ?auto_9588 ?auto_9591 ) ) ( not ( = ?auto_9589 ?auto_9590 ) ) ( not ( = ?auto_9589 ?auto_9591 ) ) ( not ( = ?auto_9590 ?auto_9591 ) ) ( ON ?auto_9591 ?auto_9592 ) ( CLEAR ?auto_9591 ) ( not ( = ?auto_9588 ?auto_9592 ) ) ( not ( = ?auto_9589 ?auto_9592 ) ) ( not ( = ?auto_9590 ?auto_9592 ) ) ( not ( = ?auto_9591 ?auto_9592 ) ) ( HOLDING ?auto_9590 ) ( CLEAR ?auto_9589 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9588 ?auto_9589 ?auto_9590 )
      ( MAKE-4PILE ?auto_9588 ?auto_9589 ?auto_9590 ?auto_9591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9593 - BLOCK
      ?auto_9594 - BLOCK
      ?auto_9595 - BLOCK
      ?auto_9596 - BLOCK
    )
    :vars
    (
      ?auto_9597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9593 ) ( ON ?auto_9594 ?auto_9593 ) ( not ( = ?auto_9593 ?auto_9594 ) ) ( not ( = ?auto_9593 ?auto_9595 ) ) ( not ( = ?auto_9593 ?auto_9596 ) ) ( not ( = ?auto_9594 ?auto_9595 ) ) ( not ( = ?auto_9594 ?auto_9596 ) ) ( not ( = ?auto_9595 ?auto_9596 ) ) ( ON ?auto_9596 ?auto_9597 ) ( not ( = ?auto_9593 ?auto_9597 ) ) ( not ( = ?auto_9594 ?auto_9597 ) ) ( not ( = ?auto_9595 ?auto_9597 ) ) ( not ( = ?auto_9596 ?auto_9597 ) ) ( CLEAR ?auto_9594 ) ( ON ?auto_9595 ?auto_9596 ) ( CLEAR ?auto_9595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9597 ?auto_9596 )
      ( MAKE-4PILE ?auto_9593 ?auto_9594 ?auto_9595 ?auto_9596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9598 - BLOCK
      ?auto_9599 - BLOCK
      ?auto_9600 - BLOCK
      ?auto_9601 - BLOCK
    )
    :vars
    (
      ?auto_9602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9598 ) ( not ( = ?auto_9598 ?auto_9599 ) ) ( not ( = ?auto_9598 ?auto_9600 ) ) ( not ( = ?auto_9598 ?auto_9601 ) ) ( not ( = ?auto_9599 ?auto_9600 ) ) ( not ( = ?auto_9599 ?auto_9601 ) ) ( not ( = ?auto_9600 ?auto_9601 ) ) ( ON ?auto_9601 ?auto_9602 ) ( not ( = ?auto_9598 ?auto_9602 ) ) ( not ( = ?auto_9599 ?auto_9602 ) ) ( not ( = ?auto_9600 ?auto_9602 ) ) ( not ( = ?auto_9601 ?auto_9602 ) ) ( ON ?auto_9600 ?auto_9601 ) ( CLEAR ?auto_9600 ) ( ON-TABLE ?auto_9602 ) ( HOLDING ?auto_9599 ) ( CLEAR ?auto_9598 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9598 ?auto_9599 )
      ( MAKE-4PILE ?auto_9598 ?auto_9599 ?auto_9600 ?auto_9601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9603 - BLOCK
      ?auto_9604 - BLOCK
      ?auto_9605 - BLOCK
      ?auto_9606 - BLOCK
    )
    :vars
    (
      ?auto_9607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9603 ) ( not ( = ?auto_9603 ?auto_9604 ) ) ( not ( = ?auto_9603 ?auto_9605 ) ) ( not ( = ?auto_9603 ?auto_9606 ) ) ( not ( = ?auto_9604 ?auto_9605 ) ) ( not ( = ?auto_9604 ?auto_9606 ) ) ( not ( = ?auto_9605 ?auto_9606 ) ) ( ON ?auto_9606 ?auto_9607 ) ( not ( = ?auto_9603 ?auto_9607 ) ) ( not ( = ?auto_9604 ?auto_9607 ) ) ( not ( = ?auto_9605 ?auto_9607 ) ) ( not ( = ?auto_9606 ?auto_9607 ) ) ( ON ?auto_9605 ?auto_9606 ) ( ON-TABLE ?auto_9607 ) ( CLEAR ?auto_9603 ) ( ON ?auto_9604 ?auto_9605 ) ( CLEAR ?auto_9604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9607 ?auto_9606 ?auto_9605 )
      ( MAKE-4PILE ?auto_9603 ?auto_9604 ?auto_9605 ?auto_9606 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9608 - BLOCK
      ?auto_9609 - BLOCK
      ?auto_9610 - BLOCK
      ?auto_9611 - BLOCK
    )
    :vars
    (
      ?auto_9612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9608 ?auto_9609 ) ) ( not ( = ?auto_9608 ?auto_9610 ) ) ( not ( = ?auto_9608 ?auto_9611 ) ) ( not ( = ?auto_9609 ?auto_9610 ) ) ( not ( = ?auto_9609 ?auto_9611 ) ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( ON ?auto_9611 ?auto_9612 ) ( not ( = ?auto_9608 ?auto_9612 ) ) ( not ( = ?auto_9609 ?auto_9612 ) ) ( not ( = ?auto_9610 ?auto_9612 ) ) ( not ( = ?auto_9611 ?auto_9612 ) ) ( ON ?auto_9610 ?auto_9611 ) ( ON-TABLE ?auto_9612 ) ( ON ?auto_9609 ?auto_9610 ) ( CLEAR ?auto_9609 ) ( HOLDING ?auto_9608 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9608 )
      ( MAKE-4PILE ?auto_9608 ?auto_9609 ?auto_9610 ?auto_9611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9613 - BLOCK
      ?auto_9614 - BLOCK
      ?auto_9615 - BLOCK
      ?auto_9616 - BLOCK
    )
    :vars
    (
      ?auto_9617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9613 ?auto_9615 ) ) ( not ( = ?auto_9613 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9616 ) ) ( ON ?auto_9616 ?auto_9617 ) ( not ( = ?auto_9613 ?auto_9617 ) ) ( not ( = ?auto_9614 ?auto_9617 ) ) ( not ( = ?auto_9615 ?auto_9617 ) ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( ON ?auto_9615 ?auto_9616 ) ( ON-TABLE ?auto_9617 ) ( ON ?auto_9614 ?auto_9615 ) ( ON ?auto_9613 ?auto_9614 ) ( CLEAR ?auto_9613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9617 ?auto_9616 ?auto_9615 ?auto_9614 )
      ( MAKE-4PILE ?auto_9613 ?auto_9614 ?auto_9615 ?auto_9616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9621 - BLOCK
      ?auto_9622 - BLOCK
      ?auto_9623 - BLOCK
    )
    :vars
    (
      ?auto_9624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9624 ?auto_9623 ) ( CLEAR ?auto_9624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9621 ) ( ON ?auto_9622 ?auto_9621 ) ( ON ?auto_9623 ?auto_9622 ) ( not ( = ?auto_9621 ?auto_9622 ) ) ( not ( = ?auto_9621 ?auto_9623 ) ) ( not ( = ?auto_9621 ?auto_9624 ) ) ( not ( = ?auto_9622 ?auto_9623 ) ) ( not ( = ?auto_9622 ?auto_9624 ) ) ( not ( = ?auto_9623 ?auto_9624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9624 ?auto_9623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9634 - BLOCK
      ?auto_9635 - BLOCK
      ?auto_9636 - BLOCK
    )
    :vars
    (
      ?auto_9637 - BLOCK
      ?auto_9638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9634 ) ( ON ?auto_9635 ?auto_9634 ) ( not ( = ?auto_9634 ?auto_9635 ) ) ( not ( = ?auto_9634 ?auto_9636 ) ) ( not ( = ?auto_9634 ?auto_9637 ) ) ( not ( = ?auto_9635 ?auto_9636 ) ) ( not ( = ?auto_9635 ?auto_9637 ) ) ( not ( = ?auto_9636 ?auto_9637 ) ) ( ON ?auto_9637 ?auto_9638 ) ( CLEAR ?auto_9637 ) ( not ( = ?auto_9634 ?auto_9638 ) ) ( not ( = ?auto_9635 ?auto_9638 ) ) ( not ( = ?auto_9636 ?auto_9638 ) ) ( not ( = ?auto_9637 ?auto_9638 ) ) ( HOLDING ?auto_9636 ) ( CLEAR ?auto_9635 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9634 ?auto_9635 ?auto_9636 ?auto_9637 )
      ( MAKE-3PILE ?auto_9634 ?auto_9635 ?auto_9636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9639 - BLOCK
      ?auto_9640 - BLOCK
      ?auto_9641 - BLOCK
    )
    :vars
    (
      ?auto_9642 - BLOCK
      ?auto_9643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9639 ) ( ON ?auto_9640 ?auto_9639 ) ( not ( = ?auto_9639 ?auto_9640 ) ) ( not ( = ?auto_9639 ?auto_9641 ) ) ( not ( = ?auto_9639 ?auto_9642 ) ) ( not ( = ?auto_9640 ?auto_9641 ) ) ( not ( = ?auto_9640 ?auto_9642 ) ) ( not ( = ?auto_9641 ?auto_9642 ) ) ( ON ?auto_9642 ?auto_9643 ) ( not ( = ?auto_9639 ?auto_9643 ) ) ( not ( = ?auto_9640 ?auto_9643 ) ) ( not ( = ?auto_9641 ?auto_9643 ) ) ( not ( = ?auto_9642 ?auto_9643 ) ) ( CLEAR ?auto_9640 ) ( ON ?auto_9641 ?auto_9642 ) ( CLEAR ?auto_9641 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9643 ?auto_9642 )
      ( MAKE-3PILE ?auto_9639 ?auto_9640 ?auto_9641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9644 - BLOCK
      ?auto_9645 - BLOCK
      ?auto_9646 - BLOCK
    )
    :vars
    (
      ?auto_9648 - BLOCK
      ?auto_9647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9644 ) ( not ( = ?auto_9644 ?auto_9645 ) ) ( not ( = ?auto_9644 ?auto_9646 ) ) ( not ( = ?auto_9644 ?auto_9648 ) ) ( not ( = ?auto_9645 ?auto_9646 ) ) ( not ( = ?auto_9645 ?auto_9648 ) ) ( not ( = ?auto_9646 ?auto_9648 ) ) ( ON ?auto_9648 ?auto_9647 ) ( not ( = ?auto_9644 ?auto_9647 ) ) ( not ( = ?auto_9645 ?auto_9647 ) ) ( not ( = ?auto_9646 ?auto_9647 ) ) ( not ( = ?auto_9648 ?auto_9647 ) ) ( ON ?auto_9646 ?auto_9648 ) ( CLEAR ?auto_9646 ) ( ON-TABLE ?auto_9647 ) ( HOLDING ?auto_9645 ) ( CLEAR ?auto_9644 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9644 ?auto_9645 )
      ( MAKE-3PILE ?auto_9644 ?auto_9645 ?auto_9646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9649 - BLOCK
      ?auto_9650 - BLOCK
      ?auto_9651 - BLOCK
    )
    :vars
    (
      ?auto_9652 - BLOCK
      ?auto_9653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9649 ) ( not ( = ?auto_9649 ?auto_9650 ) ) ( not ( = ?auto_9649 ?auto_9651 ) ) ( not ( = ?auto_9649 ?auto_9652 ) ) ( not ( = ?auto_9650 ?auto_9651 ) ) ( not ( = ?auto_9650 ?auto_9652 ) ) ( not ( = ?auto_9651 ?auto_9652 ) ) ( ON ?auto_9652 ?auto_9653 ) ( not ( = ?auto_9649 ?auto_9653 ) ) ( not ( = ?auto_9650 ?auto_9653 ) ) ( not ( = ?auto_9651 ?auto_9653 ) ) ( not ( = ?auto_9652 ?auto_9653 ) ) ( ON ?auto_9651 ?auto_9652 ) ( ON-TABLE ?auto_9653 ) ( CLEAR ?auto_9649 ) ( ON ?auto_9650 ?auto_9651 ) ( CLEAR ?auto_9650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9653 ?auto_9652 ?auto_9651 )
      ( MAKE-3PILE ?auto_9649 ?auto_9650 ?auto_9651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9654 - BLOCK
      ?auto_9655 - BLOCK
      ?auto_9656 - BLOCK
    )
    :vars
    (
      ?auto_9657 - BLOCK
      ?auto_9658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9654 ?auto_9655 ) ) ( not ( = ?auto_9654 ?auto_9656 ) ) ( not ( = ?auto_9654 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( ON ?auto_9657 ?auto_9658 ) ( not ( = ?auto_9654 ?auto_9658 ) ) ( not ( = ?auto_9655 ?auto_9658 ) ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( ON ?auto_9656 ?auto_9657 ) ( ON-TABLE ?auto_9658 ) ( ON ?auto_9655 ?auto_9656 ) ( CLEAR ?auto_9655 ) ( HOLDING ?auto_9654 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9654 )
      ( MAKE-3PILE ?auto_9654 ?auto_9655 ?auto_9656 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9659 - BLOCK
      ?auto_9660 - BLOCK
      ?auto_9661 - BLOCK
    )
    :vars
    (
      ?auto_9663 - BLOCK
      ?auto_9662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9659 ?auto_9660 ) ) ( not ( = ?auto_9659 ?auto_9661 ) ) ( not ( = ?auto_9659 ?auto_9663 ) ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( not ( = ?auto_9660 ?auto_9663 ) ) ( not ( = ?auto_9661 ?auto_9663 ) ) ( ON ?auto_9663 ?auto_9662 ) ( not ( = ?auto_9659 ?auto_9662 ) ) ( not ( = ?auto_9660 ?auto_9662 ) ) ( not ( = ?auto_9661 ?auto_9662 ) ) ( not ( = ?auto_9663 ?auto_9662 ) ) ( ON ?auto_9661 ?auto_9663 ) ( ON-TABLE ?auto_9662 ) ( ON ?auto_9660 ?auto_9661 ) ( ON ?auto_9659 ?auto_9660 ) ( CLEAR ?auto_9659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9662 ?auto_9663 ?auto_9661 ?auto_9660 )
      ( MAKE-3PILE ?auto_9659 ?auto_9660 ?auto_9661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9665 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9665 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9666 - BLOCK
    )
    :vars
    (
      ?auto_9667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9666 ?auto_9667 ) ( CLEAR ?auto_9666 ) ( HAND-EMPTY ) ( not ( = ?auto_9666 ?auto_9667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9666 ?auto_9667 )
      ( MAKE-1PILE ?auto_9666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9668 - BLOCK
    )
    :vars
    (
      ?auto_9669 - BLOCK
      ?auto_9671 - BLOCK
      ?auto_9670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9668 ?auto_9669 ) ) ( HOLDING ?auto_9668 ) ( CLEAR ?auto_9669 ) ( ON-TABLE ?auto_9671 ) ( ON ?auto_9670 ?auto_9671 ) ( ON ?auto_9669 ?auto_9670 ) ( not ( = ?auto_9671 ?auto_9670 ) ) ( not ( = ?auto_9671 ?auto_9669 ) ) ( not ( = ?auto_9671 ?auto_9668 ) ) ( not ( = ?auto_9670 ?auto_9669 ) ) ( not ( = ?auto_9670 ?auto_9668 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9671 ?auto_9670 ?auto_9669 ?auto_9668 )
      ( MAKE-1PILE ?auto_9668 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9672 - BLOCK
    )
    :vars
    (
      ?auto_9675 - BLOCK
      ?auto_9674 - BLOCK
      ?auto_9673 - BLOCK
      ?auto_9676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9672 ?auto_9675 ) ) ( CLEAR ?auto_9675 ) ( ON-TABLE ?auto_9674 ) ( ON ?auto_9673 ?auto_9674 ) ( ON ?auto_9675 ?auto_9673 ) ( not ( = ?auto_9674 ?auto_9673 ) ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( not ( = ?auto_9674 ?auto_9672 ) ) ( not ( = ?auto_9673 ?auto_9675 ) ) ( not ( = ?auto_9673 ?auto_9672 ) ) ( ON ?auto_9672 ?auto_9676 ) ( CLEAR ?auto_9672 ) ( HAND-EMPTY ) ( not ( = ?auto_9672 ?auto_9676 ) ) ( not ( = ?auto_9675 ?auto_9676 ) ) ( not ( = ?auto_9674 ?auto_9676 ) ) ( not ( = ?auto_9673 ?auto_9676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9672 ?auto_9676 )
      ( MAKE-1PILE ?auto_9672 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9677 - BLOCK
    )
    :vars
    (
      ?auto_9681 - BLOCK
      ?auto_9679 - BLOCK
      ?auto_9680 - BLOCK
      ?auto_9678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9677 ?auto_9681 ) ) ( ON-TABLE ?auto_9679 ) ( ON ?auto_9680 ?auto_9679 ) ( not ( = ?auto_9679 ?auto_9680 ) ) ( not ( = ?auto_9679 ?auto_9681 ) ) ( not ( = ?auto_9679 ?auto_9677 ) ) ( not ( = ?auto_9680 ?auto_9681 ) ) ( not ( = ?auto_9680 ?auto_9677 ) ) ( ON ?auto_9677 ?auto_9678 ) ( CLEAR ?auto_9677 ) ( not ( = ?auto_9677 ?auto_9678 ) ) ( not ( = ?auto_9681 ?auto_9678 ) ) ( not ( = ?auto_9679 ?auto_9678 ) ) ( not ( = ?auto_9680 ?auto_9678 ) ) ( HOLDING ?auto_9681 ) ( CLEAR ?auto_9680 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9679 ?auto_9680 ?auto_9681 )
      ( MAKE-1PILE ?auto_9677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9682 - BLOCK
    )
    :vars
    (
      ?auto_9683 - BLOCK
      ?auto_9684 - BLOCK
      ?auto_9686 - BLOCK
      ?auto_9685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9682 ?auto_9683 ) ) ( ON-TABLE ?auto_9684 ) ( ON ?auto_9686 ?auto_9684 ) ( not ( = ?auto_9684 ?auto_9686 ) ) ( not ( = ?auto_9684 ?auto_9683 ) ) ( not ( = ?auto_9684 ?auto_9682 ) ) ( not ( = ?auto_9686 ?auto_9683 ) ) ( not ( = ?auto_9686 ?auto_9682 ) ) ( ON ?auto_9682 ?auto_9685 ) ( not ( = ?auto_9682 ?auto_9685 ) ) ( not ( = ?auto_9683 ?auto_9685 ) ) ( not ( = ?auto_9684 ?auto_9685 ) ) ( not ( = ?auto_9686 ?auto_9685 ) ) ( CLEAR ?auto_9686 ) ( ON ?auto_9683 ?auto_9682 ) ( CLEAR ?auto_9683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9685 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9685 ?auto_9682 )
      ( MAKE-1PILE ?auto_9682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9687 - BLOCK
    )
    :vars
    (
      ?auto_9690 - BLOCK
      ?auto_9691 - BLOCK
      ?auto_9688 - BLOCK
      ?auto_9689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9687 ?auto_9690 ) ) ( ON-TABLE ?auto_9691 ) ( not ( = ?auto_9691 ?auto_9688 ) ) ( not ( = ?auto_9691 ?auto_9690 ) ) ( not ( = ?auto_9691 ?auto_9687 ) ) ( not ( = ?auto_9688 ?auto_9690 ) ) ( not ( = ?auto_9688 ?auto_9687 ) ) ( ON ?auto_9687 ?auto_9689 ) ( not ( = ?auto_9687 ?auto_9689 ) ) ( not ( = ?auto_9690 ?auto_9689 ) ) ( not ( = ?auto_9691 ?auto_9689 ) ) ( not ( = ?auto_9688 ?auto_9689 ) ) ( ON ?auto_9690 ?auto_9687 ) ( CLEAR ?auto_9690 ) ( ON-TABLE ?auto_9689 ) ( HOLDING ?auto_9688 ) ( CLEAR ?auto_9691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9691 ?auto_9688 )
      ( MAKE-1PILE ?auto_9687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9692 - BLOCK
    )
    :vars
    (
      ?auto_9695 - BLOCK
      ?auto_9694 - BLOCK
      ?auto_9693 - BLOCK
      ?auto_9696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9692 ?auto_9695 ) ) ( ON-TABLE ?auto_9694 ) ( not ( = ?auto_9694 ?auto_9693 ) ) ( not ( = ?auto_9694 ?auto_9695 ) ) ( not ( = ?auto_9694 ?auto_9692 ) ) ( not ( = ?auto_9693 ?auto_9695 ) ) ( not ( = ?auto_9693 ?auto_9692 ) ) ( ON ?auto_9692 ?auto_9696 ) ( not ( = ?auto_9692 ?auto_9696 ) ) ( not ( = ?auto_9695 ?auto_9696 ) ) ( not ( = ?auto_9694 ?auto_9696 ) ) ( not ( = ?auto_9693 ?auto_9696 ) ) ( ON ?auto_9695 ?auto_9692 ) ( ON-TABLE ?auto_9696 ) ( CLEAR ?auto_9694 ) ( ON ?auto_9693 ?auto_9695 ) ( CLEAR ?auto_9693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9696 ?auto_9692 ?auto_9695 )
      ( MAKE-1PILE ?auto_9692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9697 - BLOCK
    )
    :vars
    (
      ?auto_9700 - BLOCK
      ?auto_9698 - BLOCK
      ?auto_9701 - BLOCK
      ?auto_9699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9697 ?auto_9700 ) ) ( not ( = ?auto_9698 ?auto_9701 ) ) ( not ( = ?auto_9698 ?auto_9700 ) ) ( not ( = ?auto_9698 ?auto_9697 ) ) ( not ( = ?auto_9701 ?auto_9700 ) ) ( not ( = ?auto_9701 ?auto_9697 ) ) ( ON ?auto_9697 ?auto_9699 ) ( not ( = ?auto_9697 ?auto_9699 ) ) ( not ( = ?auto_9700 ?auto_9699 ) ) ( not ( = ?auto_9698 ?auto_9699 ) ) ( not ( = ?auto_9701 ?auto_9699 ) ) ( ON ?auto_9700 ?auto_9697 ) ( ON-TABLE ?auto_9699 ) ( ON ?auto_9701 ?auto_9700 ) ( CLEAR ?auto_9701 ) ( HOLDING ?auto_9698 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9698 )
      ( MAKE-1PILE ?auto_9697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9702 - BLOCK
    )
    :vars
    (
      ?auto_9705 - BLOCK
      ?auto_9704 - BLOCK
      ?auto_9703 - BLOCK
      ?auto_9706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9702 ?auto_9705 ) ) ( not ( = ?auto_9704 ?auto_9703 ) ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( not ( = ?auto_9704 ?auto_9702 ) ) ( not ( = ?auto_9703 ?auto_9705 ) ) ( not ( = ?auto_9703 ?auto_9702 ) ) ( ON ?auto_9702 ?auto_9706 ) ( not ( = ?auto_9702 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9703 ?auto_9706 ) ) ( ON ?auto_9705 ?auto_9702 ) ( ON-TABLE ?auto_9706 ) ( ON ?auto_9703 ?auto_9705 ) ( ON ?auto_9704 ?auto_9703 ) ( CLEAR ?auto_9704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9706 ?auto_9702 ?auto_9705 ?auto_9703 )
      ( MAKE-1PILE ?auto_9702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9709 - BLOCK
      ?auto_9710 - BLOCK
    )
    :vars
    (
      ?auto_9711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9711 ?auto_9710 ) ( CLEAR ?auto_9711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9709 ) ( ON ?auto_9710 ?auto_9709 ) ( not ( = ?auto_9709 ?auto_9710 ) ) ( not ( = ?auto_9709 ?auto_9711 ) ) ( not ( = ?auto_9710 ?auto_9711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9711 ?auto_9710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9712 - BLOCK
      ?auto_9713 - BLOCK
    )
    :vars
    (
      ?auto_9714 - BLOCK
      ?auto_9715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9714 ?auto_9713 ) ( CLEAR ?auto_9714 ) ( ON-TABLE ?auto_9712 ) ( ON ?auto_9713 ?auto_9712 ) ( not ( = ?auto_9712 ?auto_9713 ) ) ( not ( = ?auto_9712 ?auto_9714 ) ) ( not ( = ?auto_9713 ?auto_9714 ) ) ( HOLDING ?auto_9715 ) ( not ( = ?auto_9712 ?auto_9715 ) ) ( not ( = ?auto_9713 ?auto_9715 ) ) ( not ( = ?auto_9714 ?auto_9715 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_9715 )
      ( MAKE-2PILE ?auto_9712 ?auto_9713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9716 - BLOCK
      ?auto_9717 - BLOCK
    )
    :vars
    (
      ?auto_9719 - BLOCK
      ?auto_9718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9719 ?auto_9717 ) ( ON-TABLE ?auto_9716 ) ( ON ?auto_9717 ?auto_9716 ) ( not ( = ?auto_9716 ?auto_9717 ) ) ( not ( = ?auto_9716 ?auto_9719 ) ) ( not ( = ?auto_9717 ?auto_9719 ) ) ( not ( = ?auto_9716 ?auto_9718 ) ) ( not ( = ?auto_9717 ?auto_9718 ) ) ( not ( = ?auto_9719 ?auto_9718 ) ) ( ON ?auto_9718 ?auto_9719 ) ( CLEAR ?auto_9718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9716 ?auto_9717 ?auto_9719 )
      ( MAKE-2PILE ?auto_9716 ?auto_9717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9720 - BLOCK
      ?auto_9721 - BLOCK
    )
    :vars
    (
      ?auto_9723 - BLOCK
      ?auto_9722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9723 ?auto_9721 ) ( ON-TABLE ?auto_9720 ) ( ON ?auto_9721 ?auto_9720 ) ( not ( = ?auto_9720 ?auto_9721 ) ) ( not ( = ?auto_9720 ?auto_9723 ) ) ( not ( = ?auto_9721 ?auto_9723 ) ) ( not ( = ?auto_9720 ?auto_9722 ) ) ( not ( = ?auto_9721 ?auto_9722 ) ) ( not ( = ?auto_9723 ?auto_9722 ) ) ( HOLDING ?auto_9722 ) ( CLEAR ?auto_9723 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9720 ?auto_9721 ?auto_9723 ?auto_9722 )
      ( MAKE-2PILE ?auto_9720 ?auto_9721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9724 - BLOCK
      ?auto_9725 - BLOCK
    )
    :vars
    (
      ?auto_9727 - BLOCK
      ?auto_9726 - BLOCK
      ?auto_9728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9727 ?auto_9725 ) ( ON-TABLE ?auto_9724 ) ( ON ?auto_9725 ?auto_9724 ) ( not ( = ?auto_9724 ?auto_9725 ) ) ( not ( = ?auto_9724 ?auto_9727 ) ) ( not ( = ?auto_9725 ?auto_9727 ) ) ( not ( = ?auto_9724 ?auto_9726 ) ) ( not ( = ?auto_9725 ?auto_9726 ) ) ( not ( = ?auto_9727 ?auto_9726 ) ) ( CLEAR ?auto_9727 ) ( ON ?auto_9726 ?auto_9728 ) ( CLEAR ?auto_9726 ) ( HAND-EMPTY ) ( not ( = ?auto_9724 ?auto_9728 ) ) ( not ( = ?auto_9725 ?auto_9728 ) ) ( not ( = ?auto_9727 ?auto_9728 ) ) ( not ( = ?auto_9726 ?auto_9728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9726 ?auto_9728 )
      ( MAKE-2PILE ?auto_9724 ?auto_9725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9739 - BLOCK
      ?auto_9740 - BLOCK
    )
    :vars
    (
      ?auto_9742 - BLOCK
      ?auto_9743 - BLOCK
      ?auto_9741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9739 ) ( not ( = ?auto_9739 ?auto_9740 ) ) ( not ( = ?auto_9739 ?auto_9742 ) ) ( not ( = ?auto_9740 ?auto_9742 ) ) ( not ( = ?auto_9739 ?auto_9743 ) ) ( not ( = ?auto_9740 ?auto_9743 ) ) ( not ( = ?auto_9742 ?auto_9743 ) ) ( ON ?auto_9743 ?auto_9741 ) ( not ( = ?auto_9739 ?auto_9741 ) ) ( not ( = ?auto_9740 ?auto_9741 ) ) ( not ( = ?auto_9742 ?auto_9741 ) ) ( not ( = ?auto_9743 ?auto_9741 ) ) ( ON ?auto_9742 ?auto_9743 ) ( CLEAR ?auto_9742 ) ( HOLDING ?auto_9740 ) ( CLEAR ?auto_9739 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9739 ?auto_9740 ?auto_9742 )
      ( MAKE-2PILE ?auto_9739 ?auto_9740 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9744 - BLOCK
      ?auto_9745 - BLOCK
    )
    :vars
    (
      ?auto_9747 - BLOCK
      ?auto_9746 - BLOCK
      ?auto_9748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9744 ) ( not ( = ?auto_9744 ?auto_9745 ) ) ( not ( = ?auto_9744 ?auto_9747 ) ) ( not ( = ?auto_9745 ?auto_9747 ) ) ( not ( = ?auto_9744 ?auto_9746 ) ) ( not ( = ?auto_9745 ?auto_9746 ) ) ( not ( = ?auto_9747 ?auto_9746 ) ) ( ON ?auto_9746 ?auto_9748 ) ( not ( = ?auto_9744 ?auto_9748 ) ) ( not ( = ?auto_9745 ?auto_9748 ) ) ( not ( = ?auto_9747 ?auto_9748 ) ) ( not ( = ?auto_9746 ?auto_9748 ) ) ( ON ?auto_9747 ?auto_9746 ) ( CLEAR ?auto_9744 ) ( ON ?auto_9745 ?auto_9747 ) ( CLEAR ?auto_9745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9748 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9748 ?auto_9746 ?auto_9747 )
      ( MAKE-2PILE ?auto_9744 ?auto_9745 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9749 - BLOCK
      ?auto_9750 - BLOCK
    )
    :vars
    (
      ?auto_9753 - BLOCK
      ?auto_9751 - BLOCK
      ?auto_9752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9749 ?auto_9750 ) ) ( not ( = ?auto_9749 ?auto_9753 ) ) ( not ( = ?auto_9750 ?auto_9753 ) ) ( not ( = ?auto_9749 ?auto_9751 ) ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9753 ?auto_9751 ) ) ( ON ?auto_9751 ?auto_9752 ) ( not ( = ?auto_9749 ?auto_9752 ) ) ( not ( = ?auto_9750 ?auto_9752 ) ) ( not ( = ?auto_9753 ?auto_9752 ) ) ( not ( = ?auto_9751 ?auto_9752 ) ) ( ON ?auto_9753 ?auto_9751 ) ( ON ?auto_9750 ?auto_9753 ) ( CLEAR ?auto_9750 ) ( ON-TABLE ?auto_9752 ) ( HOLDING ?auto_9749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9749 )
      ( MAKE-2PILE ?auto_9749 ?auto_9750 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9754 - BLOCK
      ?auto_9755 - BLOCK
    )
    :vars
    (
      ?auto_9756 - BLOCK
      ?auto_9757 - BLOCK
      ?auto_9758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9756 ) ) ( not ( = ?auto_9755 ?auto_9756 ) ) ( not ( = ?auto_9754 ?auto_9757 ) ) ( not ( = ?auto_9755 ?auto_9757 ) ) ( not ( = ?auto_9756 ?auto_9757 ) ) ( ON ?auto_9757 ?auto_9758 ) ( not ( = ?auto_9754 ?auto_9758 ) ) ( not ( = ?auto_9755 ?auto_9758 ) ) ( not ( = ?auto_9756 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9758 ) ) ( ON ?auto_9756 ?auto_9757 ) ( ON ?auto_9755 ?auto_9756 ) ( ON-TABLE ?auto_9758 ) ( ON ?auto_9754 ?auto_9755 ) ( CLEAR ?auto_9754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9758 ?auto_9757 ?auto_9756 ?auto_9755 )
      ( MAKE-2PILE ?auto_9754 ?auto_9755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9761 - BLOCK
      ?auto_9762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9762 ) ( CLEAR ?auto_9761 ) ( ON-TABLE ?auto_9761 ) ( not ( = ?auto_9761 ?auto_9762 ) ) )
    :subtasks
    ( ( !STACK ?auto_9762 ?auto_9761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9763 - BLOCK
      ?auto_9764 - BLOCK
    )
    :vars
    (
      ?auto_9765 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9763 ) ( ON-TABLE ?auto_9763 ) ( not ( = ?auto_9763 ?auto_9764 ) ) ( ON ?auto_9764 ?auto_9765 ) ( CLEAR ?auto_9764 ) ( HAND-EMPTY ) ( not ( = ?auto_9763 ?auto_9765 ) ) ( not ( = ?auto_9764 ?auto_9765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9764 ?auto_9765 )
      ( MAKE-2PILE ?auto_9763 ?auto_9764 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9766 - BLOCK
      ?auto_9767 - BLOCK
    )
    :vars
    (
      ?auto_9768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9766 ?auto_9767 ) ) ( ON ?auto_9767 ?auto_9768 ) ( CLEAR ?auto_9767 ) ( not ( = ?auto_9766 ?auto_9768 ) ) ( not ( = ?auto_9767 ?auto_9768 ) ) ( HOLDING ?auto_9766 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9766 )
      ( MAKE-2PILE ?auto_9766 ?auto_9767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9769 - BLOCK
      ?auto_9770 - BLOCK
    )
    :vars
    (
      ?auto_9771 - BLOCK
      ?auto_9772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9769 ?auto_9770 ) ) ( ON ?auto_9770 ?auto_9771 ) ( not ( = ?auto_9769 ?auto_9771 ) ) ( not ( = ?auto_9770 ?auto_9771 ) ) ( ON ?auto_9769 ?auto_9770 ) ( CLEAR ?auto_9769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9772 ) ( ON ?auto_9771 ?auto_9772 ) ( not ( = ?auto_9772 ?auto_9771 ) ) ( not ( = ?auto_9772 ?auto_9770 ) ) ( not ( = ?auto_9772 ?auto_9769 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9772 ?auto_9771 ?auto_9770 )
      ( MAKE-2PILE ?auto_9769 ?auto_9770 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9773 - BLOCK
      ?auto_9774 - BLOCK
    )
    :vars
    (
      ?auto_9776 - BLOCK
      ?auto_9775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9773 ?auto_9774 ) ) ( ON ?auto_9774 ?auto_9776 ) ( not ( = ?auto_9773 ?auto_9776 ) ) ( not ( = ?auto_9774 ?auto_9776 ) ) ( ON-TABLE ?auto_9775 ) ( ON ?auto_9776 ?auto_9775 ) ( not ( = ?auto_9775 ?auto_9776 ) ) ( not ( = ?auto_9775 ?auto_9774 ) ) ( not ( = ?auto_9775 ?auto_9773 ) ) ( HOLDING ?auto_9773 ) ( CLEAR ?auto_9774 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9775 ?auto_9776 ?auto_9774 ?auto_9773 )
      ( MAKE-2PILE ?auto_9773 ?auto_9774 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9777 - BLOCK
      ?auto_9778 - BLOCK
    )
    :vars
    (
      ?auto_9779 - BLOCK
      ?auto_9780 - BLOCK
      ?auto_9781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9777 ?auto_9778 ) ) ( ON ?auto_9778 ?auto_9779 ) ( not ( = ?auto_9777 ?auto_9779 ) ) ( not ( = ?auto_9778 ?auto_9779 ) ) ( ON-TABLE ?auto_9780 ) ( ON ?auto_9779 ?auto_9780 ) ( not ( = ?auto_9780 ?auto_9779 ) ) ( not ( = ?auto_9780 ?auto_9778 ) ) ( not ( = ?auto_9780 ?auto_9777 ) ) ( CLEAR ?auto_9778 ) ( ON ?auto_9777 ?auto_9781 ) ( CLEAR ?auto_9777 ) ( HAND-EMPTY ) ( not ( = ?auto_9777 ?auto_9781 ) ) ( not ( = ?auto_9778 ?auto_9781 ) ) ( not ( = ?auto_9779 ?auto_9781 ) ) ( not ( = ?auto_9780 ?auto_9781 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9777 ?auto_9781 )
      ( MAKE-2PILE ?auto_9777 ?auto_9778 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9782 - BLOCK
      ?auto_9783 - BLOCK
    )
    :vars
    (
      ?auto_9784 - BLOCK
      ?auto_9786 - BLOCK
      ?auto_9785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9782 ?auto_9783 ) ) ( not ( = ?auto_9782 ?auto_9784 ) ) ( not ( = ?auto_9783 ?auto_9784 ) ) ( ON-TABLE ?auto_9786 ) ( ON ?auto_9784 ?auto_9786 ) ( not ( = ?auto_9786 ?auto_9784 ) ) ( not ( = ?auto_9786 ?auto_9783 ) ) ( not ( = ?auto_9786 ?auto_9782 ) ) ( ON ?auto_9782 ?auto_9785 ) ( CLEAR ?auto_9782 ) ( not ( = ?auto_9782 ?auto_9785 ) ) ( not ( = ?auto_9783 ?auto_9785 ) ) ( not ( = ?auto_9784 ?auto_9785 ) ) ( not ( = ?auto_9786 ?auto_9785 ) ) ( HOLDING ?auto_9783 ) ( CLEAR ?auto_9784 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9786 ?auto_9784 ?auto_9783 )
      ( MAKE-2PILE ?auto_9782 ?auto_9783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9787 - BLOCK
      ?auto_9788 - BLOCK
    )
    :vars
    (
      ?auto_9790 - BLOCK
      ?auto_9791 - BLOCK
      ?auto_9789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9787 ?auto_9788 ) ) ( not ( = ?auto_9787 ?auto_9790 ) ) ( not ( = ?auto_9788 ?auto_9790 ) ) ( ON-TABLE ?auto_9791 ) ( ON ?auto_9790 ?auto_9791 ) ( not ( = ?auto_9791 ?auto_9790 ) ) ( not ( = ?auto_9791 ?auto_9788 ) ) ( not ( = ?auto_9791 ?auto_9787 ) ) ( ON ?auto_9787 ?auto_9789 ) ( not ( = ?auto_9787 ?auto_9789 ) ) ( not ( = ?auto_9788 ?auto_9789 ) ) ( not ( = ?auto_9790 ?auto_9789 ) ) ( not ( = ?auto_9791 ?auto_9789 ) ) ( CLEAR ?auto_9790 ) ( ON ?auto_9788 ?auto_9787 ) ( CLEAR ?auto_9788 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9789 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9789 ?auto_9787 )
      ( MAKE-2PILE ?auto_9787 ?auto_9788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9792 - BLOCK
      ?auto_9793 - BLOCK
    )
    :vars
    (
      ?auto_9794 - BLOCK
      ?auto_9795 - BLOCK
      ?auto_9796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9792 ?auto_9793 ) ) ( not ( = ?auto_9792 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9794 ) ) ( ON-TABLE ?auto_9795 ) ( not ( = ?auto_9795 ?auto_9794 ) ) ( not ( = ?auto_9795 ?auto_9793 ) ) ( not ( = ?auto_9795 ?auto_9792 ) ) ( ON ?auto_9792 ?auto_9796 ) ( not ( = ?auto_9792 ?auto_9796 ) ) ( not ( = ?auto_9793 ?auto_9796 ) ) ( not ( = ?auto_9794 ?auto_9796 ) ) ( not ( = ?auto_9795 ?auto_9796 ) ) ( ON ?auto_9793 ?auto_9792 ) ( CLEAR ?auto_9793 ) ( ON-TABLE ?auto_9796 ) ( HOLDING ?auto_9794 ) ( CLEAR ?auto_9795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9795 ?auto_9794 )
      ( MAKE-2PILE ?auto_9792 ?auto_9793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9797 - BLOCK
      ?auto_9798 - BLOCK
    )
    :vars
    (
      ?auto_9800 - BLOCK
      ?auto_9799 - BLOCK
      ?auto_9801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9797 ?auto_9798 ) ) ( not ( = ?auto_9797 ?auto_9800 ) ) ( not ( = ?auto_9798 ?auto_9800 ) ) ( ON-TABLE ?auto_9799 ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( not ( = ?auto_9799 ?auto_9798 ) ) ( not ( = ?auto_9799 ?auto_9797 ) ) ( ON ?auto_9797 ?auto_9801 ) ( not ( = ?auto_9797 ?auto_9801 ) ) ( not ( = ?auto_9798 ?auto_9801 ) ) ( not ( = ?auto_9800 ?auto_9801 ) ) ( not ( = ?auto_9799 ?auto_9801 ) ) ( ON ?auto_9798 ?auto_9797 ) ( ON-TABLE ?auto_9801 ) ( CLEAR ?auto_9799 ) ( ON ?auto_9800 ?auto_9798 ) ( CLEAR ?auto_9800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9801 ?auto_9797 ?auto_9798 )
      ( MAKE-2PILE ?auto_9797 ?auto_9798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9802 - BLOCK
      ?auto_9803 - BLOCK
    )
    :vars
    (
      ?auto_9805 - BLOCK
      ?auto_9806 - BLOCK
      ?auto_9804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9802 ?auto_9803 ) ) ( not ( = ?auto_9802 ?auto_9805 ) ) ( not ( = ?auto_9803 ?auto_9805 ) ) ( not ( = ?auto_9806 ?auto_9805 ) ) ( not ( = ?auto_9806 ?auto_9803 ) ) ( not ( = ?auto_9806 ?auto_9802 ) ) ( ON ?auto_9802 ?auto_9804 ) ( not ( = ?auto_9802 ?auto_9804 ) ) ( not ( = ?auto_9803 ?auto_9804 ) ) ( not ( = ?auto_9805 ?auto_9804 ) ) ( not ( = ?auto_9806 ?auto_9804 ) ) ( ON ?auto_9803 ?auto_9802 ) ( ON-TABLE ?auto_9804 ) ( ON ?auto_9805 ?auto_9803 ) ( CLEAR ?auto_9805 ) ( HOLDING ?auto_9806 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9806 )
      ( MAKE-2PILE ?auto_9802 ?auto_9803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9807 - BLOCK
      ?auto_9808 - BLOCK
    )
    :vars
    (
      ?auto_9809 - BLOCK
      ?auto_9810 - BLOCK
      ?auto_9811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9807 ?auto_9808 ) ) ( not ( = ?auto_9807 ?auto_9809 ) ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( not ( = ?auto_9810 ?auto_9809 ) ) ( not ( = ?auto_9810 ?auto_9808 ) ) ( not ( = ?auto_9810 ?auto_9807 ) ) ( ON ?auto_9807 ?auto_9811 ) ( not ( = ?auto_9807 ?auto_9811 ) ) ( not ( = ?auto_9808 ?auto_9811 ) ) ( not ( = ?auto_9809 ?auto_9811 ) ) ( not ( = ?auto_9810 ?auto_9811 ) ) ( ON ?auto_9808 ?auto_9807 ) ( ON-TABLE ?auto_9811 ) ( ON ?auto_9809 ?auto_9808 ) ( ON ?auto_9810 ?auto_9809 ) ( CLEAR ?auto_9810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9811 ?auto_9807 ?auto_9808 ?auto_9809 )
      ( MAKE-2PILE ?auto_9807 ?auto_9808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9813 - BLOCK
    )
    :vars
    (
      ?auto_9814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9814 ?auto_9813 ) ( CLEAR ?auto_9814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9813 ) ( not ( = ?auto_9813 ?auto_9814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9814 ?auto_9813 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9815 - BLOCK
    )
    :vars
    (
      ?auto_9816 - BLOCK
      ?auto_9817 - BLOCK
      ?auto_9818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9816 ?auto_9815 ) ( CLEAR ?auto_9816 ) ( ON-TABLE ?auto_9815 ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( HOLDING ?auto_9817 ) ( CLEAR ?auto_9818 ) ( not ( = ?auto_9815 ?auto_9817 ) ) ( not ( = ?auto_9815 ?auto_9818 ) ) ( not ( = ?auto_9816 ?auto_9817 ) ) ( not ( = ?auto_9816 ?auto_9818 ) ) ( not ( = ?auto_9817 ?auto_9818 ) ) )
    :subtasks
    ( ( !STACK ?auto_9817 ?auto_9818 )
      ( MAKE-1PILE ?auto_9815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9819 - BLOCK
    )
    :vars
    (
      ?auto_9822 - BLOCK
      ?auto_9820 - BLOCK
      ?auto_9821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9822 ?auto_9819 ) ( ON-TABLE ?auto_9819 ) ( not ( = ?auto_9819 ?auto_9822 ) ) ( CLEAR ?auto_9820 ) ( not ( = ?auto_9819 ?auto_9821 ) ) ( not ( = ?auto_9819 ?auto_9820 ) ) ( not ( = ?auto_9822 ?auto_9821 ) ) ( not ( = ?auto_9822 ?auto_9820 ) ) ( not ( = ?auto_9821 ?auto_9820 ) ) ( ON ?auto_9821 ?auto_9822 ) ( CLEAR ?auto_9821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9819 ?auto_9822 )
      ( MAKE-1PILE ?auto_9819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9823 - BLOCK
    )
    :vars
    (
      ?auto_9824 - BLOCK
      ?auto_9826 - BLOCK
      ?auto_9825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9824 ?auto_9823 ) ( ON-TABLE ?auto_9823 ) ( not ( = ?auto_9823 ?auto_9824 ) ) ( not ( = ?auto_9823 ?auto_9826 ) ) ( not ( = ?auto_9823 ?auto_9825 ) ) ( not ( = ?auto_9824 ?auto_9826 ) ) ( not ( = ?auto_9824 ?auto_9825 ) ) ( not ( = ?auto_9826 ?auto_9825 ) ) ( ON ?auto_9826 ?auto_9824 ) ( CLEAR ?auto_9826 ) ( HOLDING ?auto_9825 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9825 )
      ( MAKE-1PILE ?auto_9823 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9827 - BLOCK
    )
    :vars
    (
      ?auto_9830 - BLOCK
      ?auto_9829 - BLOCK
      ?auto_9828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9830 ?auto_9827 ) ( ON-TABLE ?auto_9827 ) ( not ( = ?auto_9827 ?auto_9830 ) ) ( not ( = ?auto_9827 ?auto_9829 ) ) ( not ( = ?auto_9827 ?auto_9828 ) ) ( not ( = ?auto_9830 ?auto_9829 ) ) ( not ( = ?auto_9830 ?auto_9828 ) ) ( not ( = ?auto_9829 ?auto_9828 ) ) ( ON ?auto_9829 ?auto_9830 ) ( ON ?auto_9828 ?auto_9829 ) ( CLEAR ?auto_9828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9827 ?auto_9830 ?auto_9829 )
      ( MAKE-1PILE ?auto_9827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9831 - BLOCK
    )
    :vars
    (
      ?auto_9834 - BLOCK
      ?auto_9832 - BLOCK
      ?auto_9833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9834 ?auto_9831 ) ( ON-TABLE ?auto_9831 ) ( not ( = ?auto_9831 ?auto_9834 ) ) ( not ( = ?auto_9831 ?auto_9832 ) ) ( not ( = ?auto_9831 ?auto_9833 ) ) ( not ( = ?auto_9834 ?auto_9832 ) ) ( not ( = ?auto_9834 ?auto_9833 ) ) ( not ( = ?auto_9832 ?auto_9833 ) ) ( ON ?auto_9832 ?auto_9834 ) ( HOLDING ?auto_9833 ) ( CLEAR ?auto_9832 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9831 ?auto_9834 ?auto_9832 ?auto_9833 )
      ( MAKE-1PILE ?auto_9831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9835 - BLOCK
    )
    :vars
    (
      ?auto_9838 - BLOCK
      ?auto_9836 - BLOCK
      ?auto_9837 - BLOCK
      ?auto_9839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9838 ?auto_9835 ) ( ON-TABLE ?auto_9835 ) ( not ( = ?auto_9835 ?auto_9838 ) ) ( not ( = ?auto_9835 ?auto_9836 ) ) ( not ( = ?auto_9835 ?auto_9837 ) ) ( not ( = ?auto_9838 ?auto_9836 ) ) ( not ( = ?auto_9838 ?auto_9837 ) ) ( not ( = ?auto_9836 ?auto_9837 ) ) ( ON ?auto_9836 ?auto_9838 ) ( CLEAR ?auto_9836 ) ( ON ?auto_9837 ?auto_9839 ) ( CLEAR ?auto_9837 ) ( HAND-EMPTY ) ( not ( = ?auto_9835 ?auto_9839 ) ) ( not ( = ?auto_9838 ?auto_9839 ) ) ( not ( = ?auto_9836 ?auto_9839 ) ) ( not ( = ?auto_9837 ?auto_9839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9837 ?auto_9839 )
      ( MAKE-1PILE ?auto_9835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9840 - BLOCK
    )
    :vars
    (
      ?auto_9844 - BLOCK
      ?auto_9842 - BLOCK
      ?auto_9843 - BLOCK
      ?auto_9841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9844 ?auto_9840 ) ( ON-TABLE ?auto_9840 ) ( not ( = ?auto_9840 ?auto_9844 ) ) ( not ( = ?auto_9840 ?auto_9842 ) ) ( not ( = ?auto_9840 ?auto_9843 ) ) ( not ( = ?auto_9844 ?auto_9842 ) ) ( not ( = ?auto_9844 ?auto_9843 ) ) ( not ( = ?auto_9842 ?auto_9843 ) ) ( ON ?auto_9843 ?auto_9841 ) ( CLEAR ?auto_9843 ) ( not ( = ?auto_9840 ?auto_9841 ) ) ( not ( = ?auto_9844 ?auto_9841 ) ) ( not ( = ?auto_9842 ?auto_9841 ) ) ( not ( = ?auto_9843 ?auto_9841 ) ) ( HOLDING ?auto_9842 ) ( CLEAR ?auto_9844 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9840 ?auto_9844 ?auto_9842 )
      ( MAKE-1PILE ?auto_9840 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9845 - BLOCK
    )
    :vars
    (
      ?auto_9849 - BLOCK
      ?auto_9847 - BLOCK
      ?auto_9846 - BLOCK
      ?auto_9848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9849 ?auto_9845 ) ( ON-TABLE ?auto_9845 ) ( not ( = ?auto_9845 ?auto_9849 ) ) ( not ( = ?auto_9845 ?auto_9847 ) ) ( not ( = ?auto_9845 ?auto_9846 ) ) ( not ( = ?auto_9849 ?auto_9847 ) ) ( not ( = ?auto_9849 ?auto_9846 ) ) ( not ( = ?auto_9847 ?auto_9846 ) ) ( ON ?auto_9846 ?auto_9848 ) ( not ( = ?auto_9845 ?auto_9848 ) ) ( not ( = ?auto_9849 ?auto_9848 ) ) ( not ( = ?auto_9847 ?auto_9848 ) ) ( not ( = ?auto_9846 ?auto_9848 ) ) ( CLEAR ?auto_9849 ) ( ON ?auto_9847 ?auto_9846 ) ( CLEAR ?auto_9847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9848 ?auto_9846 )
      ( MAKE-1PILE ?auto_9845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9860 - BLOCK
    )
    :vars
    (
      ?auto_9862 - BLOCK
      ?auto_9864 - BLOCK
      ?auto_9863 - BLOCK
      ?auto_9861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9860 ?auto_9864 ) ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9862 ?auto_9864 ) ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( not ( = ?auto_9864 ?auto_9863 ) ) ( ON ?auto_9863 ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9862 ?auto_9861 ) ) ( not ( = ?auto_9864 ?auto_9861 ) ) ( not ( = ?auto_9863 ?auto_9861 ) ) ( ON ?auto_9864 ?auto_9863 ) ( ON-TABLE ?auto_9861 ) ( ON ?auto_9862 ?auto_9864 ) ( CLEAR ?auto_9862 ) ( HOLDING ?auto_9860 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9860 ?auto_9862 )
      ( MAKE-1PILE ?auto_9860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9865 - BLOCK
    )
    :vars
    (
      ?auto_9866 - BLOCK
      ?auto_9869 - BLOCK
      ?auto_9868 - BLOCK
      ?auto_9867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9865 ?auto_9866 ) ) ( not ( = ?auto_9865 ?auto_9869 ) ) ( not ( = ?auto_9865 ?auto_9868 ) ) ( not ( = ?auto_9866 ?auto_9869 ) ) ( not ( = ?auto_9866 ?auto_9868 ) ) ( not ( = ?auto_9869 ?auto_9868 ) ) ( ON ?auto_9868 ?auto_9867 ) ( not ( = ?auto_9865 ?auto_9867 ) ) ( not ( = ?auto_9866 ?auto_9867 ) ) ( not ( = ?auto_9869 ?auto_9867 ) ) ( not ( = ?auto_9868 ?auto_9867 ) ) ( ON ?auto_9869 ?auto_9868 ) ( ON-TABLE ?auto_9867 ) ( ON ?auto_9866 ?auto_9869 ) ( ON ?auto_9865 ?auto_9866 ) ( CLEAR ?auto_9865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9867 ?auto_9868 ?auto_9869 ?auto_9866 )
      ( MAKE-1PILE ?auto_9865 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9873 - BLOCK
      ?auto_9874 - BLOCK
      ?auto_9875 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9875 ) ( CLEAR ?auto_9874 ) ( ON-TABLE ?auto_9873 ) ( ON ?auto_9874 ?auto_9873 ) ( not ( = ?auto_9873 ?auto_9874 ) ) ( not ( = ?auto_9873 ?auto_9875 ) ) ( not ( = ?auto_9874 ?auto_9875 ) ) )
    :subtasks
    ( ( !STACK ?auto_9875 ?auto_9874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9876 - BLOCK
      ?auto_9877 - BLOCK
      ?auto_9878 - BLOCK
    )
    :vars
    (
      ?auto_9879 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9877 ) ( ON-TABLE ?auto_9876 ) ( ON ?auto_9877 ?auto_9876 ) ( not ( = ?auto_9876 ?auto_9877 ) ) ( not ( = ?auto_9876 ?auto_9878 ) ) ( not ( = ?auto_9877 ?auto_9878 ) ) ( ON ?auto_9878 ?auto_9879 ) ( CLEAR ?auto_9878 ) ( HAND-EMPTY ) ( not ( = ?auto_9876 ?auto_9879 ) ) ( not ( = ?auto_9877 ?auto_9879 ) ) ( not ( = ?auto_9878 ?auto_9879 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9878 ?auto_9879 )
      ( MAKE-3PILE ?auto_9876 ?auto_9877 ?auto_9878 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9880 - BLOCK
      ?auto_9881 - BLOCK
      ?auto_9882 - BLOCK
    )
    :vars
    (
      ?auto_9883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9880 ) ( not ( = ?auto_9880 ?auto_9881 ) ) ( not ( = ?auto_9880 ?auto_9882 ) ) ( not ( = ?auto_9881 ?auto_9882 ) ) ( ON ?auto_9882 ?auto_9883 ) ( CLEAR ?auto_9882 ) ( not ( = ?auto_9880 ?auto_9883 ) ) ( not ( = ?auto_9881 ?auto_9883 ) ) ( not ( = ?auto_9882 ?auto_9883 ) ) ( HOLDING ?auto_9881 ) ( CLEAR ?auto_9880 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9880 ?auto_9881 )
      ( MAKE-3PILE ?auto_9880 ?auto_9881 ?auto_9882 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9884 - BLOCK
      ?auto_9885 - BLOCK
      ?auto_9886 - BLOCK
    )
    :vars
    (
      ?auto_9887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9884 ) ( not ( = ?auto_9884 ?auto_9885 ) ) ( not ( = ?auto_9884 ?auto_9886 ) ) ( not ( = ?auto_9885 ?auto_9886 ) ) ( ON ?auto_9886 ?auto_9887 ) ( not ( = ?auto_9884 ?auto_9887 ) ) ( not ( = ?auto_9885 ?auto_9887 ) ) ( not ( = ?auto_9886 ?auto_9887 ) ) ( CLEAR ?auto_9884 ) ( ON ?auto_9885 ?auto_9886 ) ( CLEAR ?auto_9885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9887 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9887 ?auto_9886 )
      ( MAKE-3PILE ?auto_9884 ?auto_9885 ?auto_9886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9888 - BLOCK
      ?auto_9889 - BLOCK
      ?auto_9890 - BLOCK
    )
    :vars
    (
      ?auto_9891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9888 ?auto_9889 ) ) ( not ( = ?auto_9888 ?auto_9890 ) ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( ON ?auto_9890 ?auto_9891 ) ( not ( = ?auto_9888 ?auto_9891 ) ) ( not ( = ?auto_9889 ?auto_9891 ) ) ( not ( = ?auto_9890 ?auto_9891 ) ) ( ON ?auto_9889 ?auto_9890 ) ( CLEAR ?auto_9889 ) ( ON-TABLE ?auto_9891 ) ( HOLDING ?auto_9888 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9888 )
      ( MAKE-3PILE ?auto_9888 ?auto_9889 ?auto_9890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9892 - BLOCK
      ?auto_9893 - BLOCK
      ?auto_9894 - BLOCK
    )
    :vars
    (
      ?auto_9895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9892 ?auto_9893 ) ) ( not ( = ?auto_9892 ?auto_9894 ) ) ( not ( = ?auto_9893 ?auto_9894 ) ) ( ON ?auto_9894 ?auto_9895 ) ( not ( = ?auto_9892 ?auto_9895 ) ) ( not ( = ?auto_9893 ?auto_9895 ) ) ( not ( = ?auto_9894 ?auto_9895 ) ) ( ON ?auto_9893 ?auto_9894 ) ( ON-TABLE ?auto_9895 ) ( ON ?auto_9892 ?auto_9893 ) ( CLEAR ?auto_9892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9895 ?auto_9894 ?auto_9893 )
      ( MAKE-3PILE ?auto_9892 ?auto_9893 ?auto_9894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9896 - BLOCK
      ?auto_9897 - BLOCK
      ?auto_9898 - BLOCK
    )
    :vars
    (
      ?auto_9899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9896 ?auto_9897 ) ) ( not ( = ?auto_9896 ?auto_9898 ) ) ( not ( = ?auto_9897 ?auto_9898 ) ) ( ON ?auto_9898 ?auto_9899 ) ( not ( = ?auto_9896 ?auto_9899 ) ) ( not ( = ?auto_9897 ?auto_9899 ) ) ( not ( = ?auto_9898 ?auto_9899 ) ) ( ON ?auto_9897 ?auto_9898 ) ( ON-TABLE ?auto_9899 ) ( HOLDING ?auto_9896 ) ( CLEAR ?auto_9897 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9899 ?auto_9898 ?auto_9897 ?auto_9896 )
      ( MAKE-3PILE ?auto_9896 ?auto_9897 ?auto_9898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9900 - BLOCK
      ?auto_9901 - BLOCK
      ?auto_9902 - BLOCK
    )
    :vars
    (
      ?auto_9903 - BLOCK
      ?auto_9904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9900 ?auto_9901 ) ) ( not ( = ?auto_9900 ?auto_9902 ) ) ( not ( = ?auto_9901 ?auto_9902 ) ) ( ON ?auto_9902 ?auto_9903 ) ( not ( = ?auto_9900 ?auto_9903 ) ) ( not ( = ?auto_9901 ?auto_9903 ) ) ( not ( = ?auto_9902 ?auto_9903 ) ) ( ON ?auto_9901 ?auto_9902 ) ( ON-TABLE ?auto_9903 ) ( CLEAR ?auto_9901 ) ( ON ?auto_9900 ?auto_9904 ) ( CLEAR ?auto_9900 ) ( HAND-EMPTY ) ( not ( = ?auto_9900 ?auto_9904 ) ) ( not ( = ?auto_9901 ?auto_9904 ) ) ( not ( = ?auto_9902 ?auto_9904 ) ) ( not ( = ?auto_9903 ?auto_9904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9900 ?auto_9904 )
      ( MAKE-3PILE ?auto_9900 ?auto_9901 ?auto_9902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9905 - BLOCK
      ?auto_9906 - BLOCK
      ?auto_9907 - BLOCK
    )
    :vars
    (
      ?auto_9909 - BLOCK
      ?auto_9908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9905 ?auto_9906 ) ) ( not ( = ?auto_9905 ?auto_9907 ) ) ( not ( = ?auto_9906 ?auto_9907 ) ) ( ON ?auto_9907 ?auto_9909 ) ( not ( = ?auto_9905 ?auto_9909 ) ) ( not ( = ?auto_9906 ?auto_9909 ) ) ( not ( = ?auto_9907 ?auto_9909 ) ) ( ON-TABLE ?auto_9909 ) ( ON ?auto_9905 ?auto_9908 ) ( CLEAR ?auto_9905 ) ( not ( = ?auto_9905 ?auto_9908 ) ) ( not ( = ?auto_9906 ?auto_9908 ) ) ( not ( = ?auto_9907 ?auto_9908 ) ) ( not ( = ?auto_9909 ?auto_9908 ) ) ( HOLDING ?auto_9906 ) ( CLEAR ?auto_9907 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9909 ?auto_9907 ?auto_9906 )
      ( MAKE-3PILE ?auto_9905 ?auto_9906 ?auto_9907 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9910 - BLOCK
      ?auto_9911 - BLOCK
      ?auto_9912 - BLOCK
    )
    :vars
    (
      ?auto_9914 - BLOCK
      ?auto_9913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9910 ?auto_9911 ) ) ( not ( = ?auto_9910 ?auto_9912 ) ) ( not ( = ?auto_9911 ?auto_9912 ) ) ( ON ?auto_9912 ?auto_9914 ) ( not ( = ?auto_9910 ?auto_9914 ) ) ( not ( = ?auto_9911 ?auto_9914 ) ) ( not ( = ?auto_9912 ?auto_9914 ) ) ( ON-TABLE ?auto_9914 ) ( ON ?auto_9910 ?auto_9913 ) ( not ( = ?auto_9910 ?auto_9913 ) ) ( not ( = ?auto_9911 ?auto_9913 ) ) ( not ( = ?auto_9912 ?auto_9913 ) ) ( not ( = ?auto_9914 ?auto_9913 ) ) ( CLEAR ?auto_9912 ) ( ON ?auto_9911 ?auto_9910 ) ( CLEAR ?auto_9911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9913 ?auto_9910 )
      ( MAKE-3PILE ?auto_9910 ?auto_9911 ?auto_9912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9915 - BLOCK
      ?auto_9916 - BLOCK
      ?auto_9917 - BLOCK
    )
    :vars
    (
      ?auto_9919 - BLOCK
      ?auto_9918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9915 ?auto_9916 ) ) ( not ( = ?auto_9915 ?auto_9917 ) ) ( not ( = ?auto_9916 ?auto_9917 ) ) ( not ( = ?auto_9915 ?auto_9919 ) ) ( not ( = ?auto_9916 ?auto_9919 ) ) ( not ( = ?auto_9917 ?auto_9919 ) ) ( ON-TABLE ?auto_9919 ) ( ON ?auto_9915 ?auto_9918 ) ( not ( = ?auto_9915 ?auto_9918 ) ) ( not ( = ?auto_9916 ?auto_9918 ) ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( not ( = ?auto_9919 ?auto_9918 ) ) ( ON ?auto_9916 ?auto_9915 ) ( CLEAR ?auto_9916 ) ( ON-TABLE ?auto_9918 ) ( HOLDING ?auto_9917 ) ( CLEAR ?auto_9919 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9919 ?auto_9917 )
      ( MAKE-3PILE ?auto_9915 ?auto_9916 ?auto_9917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9920 - BLOCK
      ?auto_9921 - BLOCK
      ?auto_9922 - BLOCK
    )
    :vars
    (
      ?auto_9924 - BLOCK
      ?auto_9923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9920 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9922 ) ) ( not ( = ?auto_9921 ?auto_9922 ) ) ( not ( = ?auto_9920 ?auto_9924 ) ) ( not ( = ?auto_9921 ?auto_9924 ) ) ( not ( = ?auto_9922 ?auto_9924 ) ) ( ON-TABLE ?auto_9924 ) ( ON ?auto_9920 ?auto_9923 ) ( not ( = ?auto_9920 ?auto_9923 ) ) ( not ( = ?auto_9921 ?auto_9923 ) ) ( not ( = ?auto_9922 ?auto_9923 ) ) ( not ( = ?auto_9924 ?auto_9923 ) ) ( ON ?auto_9921 ?auto_9920 ) ( ON-TABLE ?auto_9923 ) ( CLEAR ?auto_9924 ) ( ON ?auto_9922 ?auto_9921 ) ( CLEAR ?auto_9922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9923 ?auto_9920 ?auto_9921 )
      ( MAKE-3PILE ?auto_9920 ?auto_9921 ?auto_9922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9925 - BLOCK
      ?auto_9926 - BLOCK
      ?auto_9927 - BLOCK
    )
    :vars
    (
      ?auto_9929 - BLOCK
      ?auto_9928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9925 ?auto_9926 ) ) ( not ( = ?auto_9925 ?auto_9927 ) ) ( not ( = ?auto_9926 ?auto_9927 ) ) ( not ( = ?auto_9925 ?auto_9929 ) ) ( not ( = ?auto_9926 ?auto_9929 ) ) ( not ( = ?auto_9927 ?auto_9929 ) ) ( ON ?auto_9925 ?auto_9928 ) ( not ( = ?auto_9925 ?auto_9928 ) ) ( not ( = ?auto_9926 ?auto_9928 ) ) ( not ( = ?auto_9927 ?auto_9928 ) ) ( not ( = ?auto_9929 ?auto_9928 ) ) ( ON ?auto_9926 ?auto_9925 ) ( ON-TABLE ?auto_9928 ) ( ON ?auto_9927 ?auto_9926 ) ( CLEAR ?auto_9927 ) ( HOLDING ?auto_9929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9929 )
      ( MAKE-3PILE ?auto_9925 ?auto_9926 ?auto_9927 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9930 - BLOCK
      ?auto_9931 - BLOCK
      ?auto_9932 - BLOCK
    )
    :vars
    (
      ?auto_9934 - BLOCK
      ?auto_9933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9930 ?auto_9931 ) ) ( not ( = ?auto_9930 ?auto_9932 ) ) ( not ( = ?auto_9931 ?auto_9932 ) ) ( not ( = ?auto_9930 ?auto_9934 ) ) ( not ( = ?auto_9931 ?auto_9934 ) ) ( not ( = ?auto_9932 ?auto_9934 ) ) ( ON ?auto_9930 ?auto_9933 ) ( not ( = ?auto_9930 ?auto_9933 ) ) ( not ( = ?auto_9931 ?auto_9933 ) ) ( not ( = ?auto_9932 ?auto_9933 ) ) ( not ( = ?auto_9934 ?auto_9933 ) ) ( ON ?auto_9931 ?auto_9930 ) ( ON-TABLE ?auto_9933 ) ( ON ?auto_9932 ?auto_9931 ) ( ON ?auto_9934 ?auto_9932 ) ( CLEAR ?auto_9934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9933 ?auto_9930 ?auto_9931 ?auto_9932 )
      ( MAKE-3PILE ?auto_9930 ?auto_9931 ?auto_9932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9939 - BLOCK
      ?auto_9940 - BLOCK
      ?auto_9941 - BLOCK
      ?auto_9942 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_9942 ) ( CLEAR ?auto_9941 ) ( ON-TABLE ?auto_9939 ) ( ON ?auto_9940 ?auto_9939 ) ( ON ?auto_9941 ?auto_9940 ) ( not ( = ?auto_9939 ?auto_9940 ) ) ( not ( = ?auto_9939 ?auto_9941 ) ) ( not ( = ?auto_9939 ?auto_9942 ) ) ( not ( = ?auto_9940 ?auto_9941 ) ) ( not ( = ?auto_9940 ?auto_9942 ) ) ( not ( = ?auto_9941 ?auto_9942 ) ) )
    :subtasks
    ( ( !STACK ?auto_9942 ?auto_9941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9943 - BLOCK
      ?auto_9944 - BLOCK
      ?auto_9945 - BLOCK
      ?auto_9946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9945 ) ( ON-TABLE ?auto_9943 ) ( ON ?auto_9944 ?auto_9943 ) ( ON ?auto_9945 ?auto_9944 ) ( not ( = ?auto_9943 ?auto_9944 ) ) ( not ( = ?auto_9943 ?auto_9945 ) ) ( not ( = ?auto_9943 ?auto_9946 ) ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( not ( = ?auto_9944 ?auto_9946 ) ) ( not ( = ?auto_9945 ?auto_9946 ) ) ( ON-TABLE ?auto_9946 ) ( CLEAR ?auto_9946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_9946 )
      ( MAKE-4PILE ?auto_9943 ?auto_9944 ?auto_9945 ?auto_9946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9947 - BLOCK
      ?auto_9948 - BLOCK
      ?auto_9949 - BLOCK
      ?auto_9950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9947 ) ( ON ?auto_9948 ?auto_9947 ) ( not ( = ?auto_9947 ?auto_9948 ) ) ( not ( = ?auto_9947 ?auto_9949 ) ) ( not ( = ?auto_9947 ?auto_9950 ) ) ( not ( = ?auto_9948 ?auto_9949 ) ) ( not ( = ?auto_9948 ?auto_9950 ) ) ( not ( = ?auto_9949 ?auto_9950 ) ) ( ON-TABLE ?auto_9950 ) ( CLEAR ?auto_9950 ) ( HOLDING ?auto_9949 ) ( CLEAR ?auto_9948 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9947 ?auto_9948 ?auto_9949 )
      ( MAKE-4PILE ?auto_9947 ?auto_9948 ?auto_9949 ?auto_9950 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9951 - BLOCK
      ?auto_9952 - BLOCK
      ?auto_9953 - BLOCK
      ?auto_9954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9951 ) ( ON ?auto_9952 ?auto_9951 ) ( not ( = ?auto_9951 ?auto_9952 ) ) ( not ( = ?auto_9951 ?auto_9953 ) ) ( not ( = ?auto_9951 ?auto_9954 ) ) ( not ( = ?auto_9952 ?auto_9953 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( ON-TABLE ?auto_9954 ) ( CLEAR ?auto_9952 ) ( ON ?auto_9953 ?auto_9954 ) ( CLEAR ?auto_9953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9954 )
      ( MAKE-4PILE ?auto_9951 ?auto_9952 ?auto_9953 ?auto_9954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9955 - BLOCK
      ?auto_9956 - BLOCK
      ?auto_9957 - BLOCK
      ?auto_9958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9955 ) ( not ( = ?auto_9955 ?auto_9956 ) ) ( not ( = ?auto_9955 ?auto_9957 ) ) ( not ( = ?auto_9955 ?auto_9958 ) ) ( not ( = ?auto_9956 ?auto_9957 ) ) ( not ( = ?auto_9956 ?auto_9958 ) ) ( not ( = ?auto_9957 ?auto_9958 ) ) ( ON-TABLE ?auto_9958 ) ( ON ?auto_9957 ?auto_9958 ) ( CLEAR ?auto_9957 ) ( HOLDING ?auto_9956 ) ( CLEAR ?auto_9955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9955 ?auto_9956 )
      ( MAKE-4PILE ?auto_9955 ?auto_9956 ?auto_9957 ?auto_9958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9959 - BLOCK
      ?auto_9960 - BLOCK
      ?auto_9961 - BLOCK
      ?auto_9962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9959 ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9961 ) ) ( not ( = ?auto_9959 ?auto_9962 ) ) ( not ( = ?auto_9960 ?auto_9961 ) ) ( not ( = ?auto_9960 ?auto_9962 ) ) ( not ( = ?auto_9961 ?auto_9962 ) ) ( ON-TABLE ?auto_9962 ) ( ON ?auto_9961 ?auto_9962 ) ( CLEAR ?auto_9959 ) ( ON ?auto_9960 ?auto_9961 ) ( CLEAR ?auto_9960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9962 ?auto_9961 )
      ( MAKE-4PILE ?auto_9959 ?auto_9960 ?auto_9961 ?auto_9962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9963 - BLOCK
      ?auto_9964 - BLOCK
      ?auto_9965 - BLOCK
      ?auto_9966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9963 ?auto_9964 ) ) ( not ( = ?auto_9963 ?auto_9965 ) ) ( not ( = ?auto_9963 ?auto_9966 ) ) ( not ( = ?auto_9964 ?auto_9965 ) ) ( not ( = ?auto_9964 ?auto_9966 ) ) ( not ( = ?auto_9965 ?auto_9966 ) ) ( ON-TABLE ?auto_9966 ) ( ON ?auto_9965 ?auto_9966 ) ( ON ?auto_9964 ?auto_9965 ) ( CLEAR ?auto_9964 ) ( HOLDING ?auto_9963 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9963 )
      ( MAKE-4PILE ?auto_9963 ?auto_9964 ?auto_9965 ?auto_9966 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9967 - BLOCK
      ?auto_9968 - BLOCK
      ?auto_9969 - BLOCK
      ?auto_9970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9967 ?auto_9968 ) ) ( not ( = ?auto_9967 ?auto_9969 ) ) ( not ( = ?auto_9967 ?auto_9970 ) ) ( not ( = ?auto_9968 ?auto_9969 ) ) ( not ( = ?auto_9968 ?auto_9970 ) ) ( not ( = ?auto_9969 ?auto_9970 ) ) ( ON-TABLE ?auto_9970 ) ( ON ?auto_9969 ?auto_9970 ) ( ON ?auto_9968 ?auto_9969 ) ( ON ?auto_9967 ?auto_9968 ) ( CLEAR ?auto_9967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9970 ?auto_9969 ?auto_9968 )
      ( MAKE-4PILE ?auto_9967 ?auto_9968 ?auto_9969 ?auto_9970 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9971 - BLOCK
      ?auto_9972 - BLOCK
      ?auto_9973 - BLOCK
      ?auto_9974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9971 ?auto_9972 ) ) ( not ( = ?auto_9971 ?auto_9973 ) ) ( not ( = ?auto_9971 ?auto_9974 ) ) ( not ( = ?auto_9972 ?auto_9973 ) ) ( not ( = ?auto_9972 ?auto_9974 ) ) ( not ( = ?auto_9973 ?auto_9974 ) ) ( ON-TABLE ?auto_9974 ) ( ON ?auto_9973 ?auto_9974 ) ( ON ?auto_9972 ?auto_9973 ) ( HOLDING ?auto_9971 ) ( CLEAR ?auto_9972 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9974 ?auto_9973 ?auto_9972 ?auto_9971 )
      ( MAKE-4PILE ?auto_9971 ?auto_9972 ?auto_9973 ?auto_9974 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9975 - BLOCK
      ?auto_9976 - BLOCK
      ?auto_9977 - BLOCK
      ?auto_9978 - BLOCK
    )
    :vars
    (
      ?auto_9979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9975 ?auto_9976 ) ) ( not ( = ?auto_9975 ?auto_9977 ) ) ( not ( = ?auto_9975 ?auto_9978 ) ) ( not ( = ?auto_9976 ?auto_9977 ) ) ( not ( = ?auto_9976 ?auto_9978 ) ) ( not ( = ?auto_9977 ?auto_9978 ) ) ( ON-TABLE ?auto_9978 ) ( ON ?auto_9977 ?auto_9978 ) ( ON ?auto_9976 ?auto_9977 ) ( CLEAR ?auto_9976 ) ( ON ?auto_9975 ?auto_9979 ) ( CLEAR ?auto_9975 ) ( HAND-EMPTY ) ( not ( = ?auto_9975 ?auto_9979 ) ) ( not ( = ?auto_9976 ?auto_9979 ) ) ( not ( = ?auto_9977 ?auto_9979 ) ) ( not ( = ?auto_9978 ?auto_9979 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9975 ?auto_9979 )
      ( MAKE-4PILE ?auto_9975 ?auto_9976 ?auto_9977 ?auto_9978 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9980 - BLOCK
      ?auto_9981 - BLOCK
      ?auto_9982 - BLOCK
      ?auto_9983 - BLOCK
    )
    :vars
    (
      ?auto_9984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9980 ?auto_9981 ) ) ( not ( = ?auto_9980 ?auto_9982 ) ) ( not ( = ?auto_9980 ?auto_9983 ) ) ( not ( = ?auto_9981 ?auto_9982 ) ) ( not ( = ?auto_9981 ?auto_9983 ) ) ( not ( = ?auto_9982 ?auto_9983 ) ) ( ON-TABLE ?auto_9983 ) ( ON ?auto_9982 ?auto_9983 ) ( ON ?auto_9980 ?auto_9984 ) ( CLEAR ?auto_9980 ) ( not ( = ?auto_9980 ?auto_9984 ) ) ( not ( = ?auto_9981 ?auto_9984 ) ) ( not ( = ?auto_9982 ?auto_9984 ) ) ( not ( = ?auto_9983 ?auto_9984 ) ) ( HOLDING ?auto_9981 ) ( CLEAR ?auto_9982 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9983 ?auto_9982 ?auto_9981 )
      ( MAKE-4PILE ?auto_9980 ?auto_9981 ?auto_9982 ?auto_9983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9985 - BLOCK
      ?auto_9986 - BLOCK
      ?auto_9987 - BLOCK
      ?auto_9988 - BLOCK
    )
    :vars
    (
      ?auto_9989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9985 ?auto_9986 ) ) ( not ( = ?auto_9985 ?auto_9987 ) ) ( not ( = ?auto_9985 ?auto_9988 ) ) ( not ( = ?auto_9986 ?auto_9987 ) ) ( not ( = ?auto_9986 ?auto_9988 ) ) ( not ( = ?auto_9987 ?auto_9988 ) ) ( ON-TABLE ?auto_9988 ) ( ON ?auto_9987 ?auto_9988 ) ( ON ?auto_9985 ?auto_9989 ) ( not ( = ?auto_9985 ?auto_9989 ) ) ( not ( = ?auto_9986 ?auto_9989 ) ) ( not ( = ?auto_9987 ?auto_9989 ) ) ( not ( = ?auto_9988 ?auto_9989 ) ) ( CLEAR ?auto_9987 ) ( ON ?auto_9986 ?auto_9985 ) ( CLEAR ?auto_9986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9989 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9989 ?auto_9985 )
      ( MAKE-4PILE ?auto_9985 ?auto_9986 ?auto_9987 ?auto_9988 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9990 - BLOCK
      ?auto_9991 - BLOCK
      ?auto_9992 - BLOCK
      ?auto_9993 - BLOCK
    )
    :vars
    (
      ?auto_9994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9990 ?auto_9991 ) ) ( not ( = ?auto_9990 ?auto_9992 ) ) ( not ( = ?auto_9990 ?auto_9993 ) ) ( not ( = ?auto_9991 ?auto_9992 ) ) ( not ( = ?auto_9991 ?auto_9993 ) ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( ON-TABLE ?auto_9993 ) ( ON ?auto_9990 ?auto_9994 ) ( not ( = ?auto_9990 ?auto_9994 ) ) ( not ( = ?auto_9991 ?auto_9994 ) ) ( not ( = ?auto_9992 ?auto_9994 ) ) ( not ( = ?auto_9993 ?auto_9994 ) ) ( ON ?auto_9991 ?auto_9990 ) ( CLEAR ?auto_9991 ) ( ON-TABLE ?auto_9994 ) ( HOLDING ?auto_9992 ) ( CLEAR ?auto_9993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9993 ?auto_9992 )
      ( MAKE-4PILE ?auto_9990 ?auto_9991 ?auto_9992 ?auto_9993 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9995 - BLOCK
      ?auto_9996 - BLOCK
      ?auto_9997 - BLOCK
      ?auto_9998 - BLOCK
    )
    :vars
    (
      ?auto_9999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9995 ?auto_9996 ) ) ( not ( = ?auto_9995 ?auto_9997 ) ) ( not ( = ?auto_9995 ?auto_9998 ) ) ( not ( = ?auto_9996 ?auto_9997 ) ) ( not ( = ?auto_9996 ?auto_9998 ) ) ( not ( = ?auto_9997 ?auto_9998 ) ) ( ON-TABLE ?auto_9998 ) ( ON ?auto_9995 ?auto_9999 ) ( not ( = ?auto_9995 ?auto_9999 ) ) ( not ( = ?auto_9996 ?auto_9999 ) ) ( not ( = ?auto_9997 ?auto_9999 ) ) ( not ( = ?auto_9998 ?auto_9999 ) ) ( ON ?auto_9996 ?auto_9995 ) ( ON-TABLE ?auto_9999 ) ( CLEAR ?auto_9998 ) ( ON ?auto_9997 ?auto_9996 ) ( CLEAR ?auto_9997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9999 ?auto_9995 ?auto_9996 )
      ( MAKE-4PILE ?auto_9995 ?auto_9996 ?auto_9997 ?auto_9998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10000 - BLOCK
      ?auto_10001 - BLOCK
      ?auto_10002 - BLOCK
      ?auto_10003 - BLOCK
    )
    :vars
    (
      ?auto_10004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10000 ?auto_10001 ) ) ( not ( = ?auto_10000 ?auto_10002 ) ) ( not ( = ?auto_10000 ?auto_10003 ) ) ( not ( = ?auto_10001 ?auto_10002 ) ) ( not ( = ?auto_10001 ?auto_10003 ) ) ( not ( = ?auto_10002 ?auto_10003 ) ) ( ON ?auto_10000 ?auto_10004 ) ( not ( = ?auto_10000 ?auto_10004 ) ) ( not ( = ?auto_10001 ?auto_10004 ) ) ( not ( = ?auto_10002 ?auto_10004 ) ) ( not ( = ?auto_10003 ?auto_10004 ) ) ( ON ?auto_10001 ?auto_10000 ) ( ON-TABLE ?auto_10004 ) ( ON ?auto_10002 ?auto_10001 ) ( CLEAR ?auto_10002 ) ( HOLDING ?auto_10003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_10003 )
      ( MAKE-4PILE ?auto_10000 ?auto_10001 ?auto_10002 ?auto_10003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_10005 - BLOCK
      ?auto_10006 - BLOCK
      ?auto_10007 - BLOCK
      ?auto_10008 - BLOCK
    )
    :vars
    (
      ?auto_10009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_10005 ?auto_10006 ) ) ( not ( = ?auto_10005 ?auto_10007 ) ) ( not ( = ?auto_10005 ?auto_10008 ) ) ( not ( = ?auto_10006 ?auto_10007 ) ) ( not ( = ?auto_10006 ?auto_10008 ) ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( ON ?auto_10005 ?auto_10009 ) ( not ( = ?auto_10005 ?auto_10009 ) ) ( not ( = ?auto_10006 ?auto_10009 ) ) ( not ( = ?auto_10007 ?auto_10009 ) ) ( not ( = ?auto_10008 ?auto_10009 ) ) ( ON ?auto_10006 ?auto_10005 ) ( ON-TABLE ?auto_10009 ) ( ON ?auto_10007 ?auto_10006 ) ( ON ?auto_10008 ?auto_10007 ) ( CLEAR ?auto_10008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_10009 ?auto_10005 ?auto_10006 ?auto_10007 )
      ( MAKE-4PILE ?auto_10005 ?auto_10006 ?auto_10007 ?auto_10008 ) )
  )

)

