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
      ?auto_6416 - BLOCK
      ?auto_6417 - BLOCK
      ?auto_6418 - BLOCK
      ?auto_6419 - BLOCK
    )
    :vars
    (
      ?auto_6420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6420 ?auto_6419 ) ( CLEAR ?auto_6420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6416 ) ( ON ?auto_6417 ?auto_6416 ) ( ON ?auto_6418 ?auto_6417 ) ( ON ?auto_6419 ?auto_6418 ) ( not ( = ?auto_6416 ?auto_6417 ) ) ( not ( = ?auto_6416 ?auto_6418 ) ) ( not ( = ?auto_6416 ?auto_6419 ) ) ( not ( = ?auto_6416 ?auto_6420 ) ) ( not ( = ?auto_6417 ?auto_6418 ) ) ( not ( = ?auto_6417 ?auto_6419 ) ) ( not ( = ?auto_6417 ?auto_6420 ) ) ( not ( = ?auto_6418 ?auto_6419 ) ) ( not ( = ?auto_6418 ?auto_6420 ) ) ( not ( = ?auto_6419 ?auto_6420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6420 ?auto_6419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6422 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6422 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6423 - BLOCK
    )
    :vars
    (
      ?auto_6424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6423 ?auto_6424 ) ( CLEAR ?auto_6423 ) ( HAND-EMPTY ) ( not ( = ?auto_6423 ?auto_6424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6423 ?auto_6424 )
      ( MAKE-1PILE ?auto_6423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6428 - BLOCK
      ?auto_6429 - BLOCK
      ?auto_6430 - BLOCK
    )
    :vars
    (
      ?auto_6431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6431 ?auto_6430 ) ( CLEAR ?auto_6431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6428 ) ( ON ?auto_6429 ?auto_6428 ) ( ON ?auto_6430 ?auto_6429 ) ( not ( = ?auto_6428 ?auto_6429 ) ) ( not ( = ?auto_6428 ?auto_6430 ) ) ( not ( = ?auto_6428 ?auto_6431 ) ) ( not ( = ?auto_6429 ?auto_6430 ) ) ( not ( = ?auto_6429 ?auto_6431 ) ) ( not ( = ?auto_6430 ?auto_6431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6431 ?auto_6430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6432 - BLOCK
      ?auto_6433 - BLOCK
      ?auto_6434 - BLOCK
    )
    :vars
    (
      ?auto_6435 - BLOCK
      ?auto_6436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6435 ?auto_6434 ) ( CLEAR ?auto_6435 ) ( ON-TABLE ?auto_6432 ) ( ON ?auto_6433 ?auto_6432 ) ( ON ?auto_6434 ?auto_6433 ) ( not ( = ?auto_6432 ?auto_6433 ) ) ( not ( = ?auto_6432 ?auto_6434 ) ) ( not ( = ?auto_6432 ?auto_6435 ) ) ( not ( = ?auto_6433 ?auto_6434 ) ) ( not ( = ?auto_6433 ?auto_6435 ) ) ( not ( = ?auto_6434 ?auto_6435 ) ) ( HOLDING ?auto_6436 ) ( not ( = ?auto_6432 ?auto_6436 ) ) ( not ( = ?auto_6433 ?auto_6436 ) ) ( not ( = ?auto_6434 ?auto_6436 ) ) ( not ( = ?auto_6435 ?auto_6436 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6436 )
      ( MAKE-3PILE ?auto_6432 ?auto_6433 ?auto_6434 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6437 - BLOCK
      ?auto_6438 - BLOCK
      ?auto_6439 - BLOCK
    )
    :vars
    (
      ?auto_6441 - BLOCK
      ?auto_6440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6441 ?auto_6439 ) ( ON-TABLE ?auto_6437 ) ( ON ?auto_6438 ?auto_6437 ) ( ON ?auto_6439 ?auto_6438 ) ( not ( = ?auto_6437 ?auto_6438 ) ) ( not ( = ?auto_6437 ?auto_6439 ) ) ( not ( = ?auto_6437 ?auto_6441 ) ) ( not ( = ?auto_6438 ?auto_6439 ) ) ( not ( = ?auto_6438 ?auto_6441 ) ) ( not ( = ?auto_6439 ?auto_6441 ) ) ( not ( = ?auto_6437 ?auto_6440 ) ) ( not ( = ?auto_6438 ?auto_6440 ) ) ( not ( = ?auto_6439 ?auto_6440 ) ) ( not ( = ?auto_6441 ?auto_6440 ) ) ( ON ?auto_6440 ?auto_6441 ) ( CLEAR ?auto_6440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6437 ?auto_6438 ?auto_6439 ?auto_6441 )
      ( MAKE-3PILE ?auto_6437 ?auto_6438 ?auto_6439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6444 - BLOCK
      ?auto_6445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6445 ) ( CLEAR ?auto_6444 ) ( ON-TABLE ?auto_6444 ) ( not ( = ?auto_6444 ?auto_6445 ) ) )
    :subtasks
    ( ( !STACK ?auto_6445 ?auto_6444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6446 - BLOCK
      ?auto_6447 - BLOCK
    )
    :vars
    (
      ?auto_6448 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6446 ) ( ON-TABLE ?auto_6446 ) ( not ( = ?auto_6446 ?auto_6447 ) ) ( ON ?auto_6447 ?auto_6448 ) ( CLEAR ?auto_6447 ) ( HAND-EMPTY ) ( not ( = ?auto_6446 ?auto_6448 ) ) ( not ( = ?auto_6447 ?auto_6448 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6447 ?auto_6448 )
      ( MAKE-2PILE ?auto_6446 ?auto_6447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6449 - BLOCK
      ?auto_6450 - BLOCK
    )
    :vars
    (
      ?auto_6451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6449 ?auto_6450 ) ) ( ON ?auto_6450 ?auto_6451 ) ( CLEAR ?auto_6450 ) ( not ( = ?auto_6449 ?auto_6451 ) ) ( not ( = ?auto_6450 ?auto_6451 ) ) ( HOLDING ?auto_6449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6449 )
      ( MAKE-2PILE ?auto_6449 ?auto_6450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6452 - BLOCK
      ?auto_6453 - BLOCK
    )
    :vars
    (
      ?auto_6454 - BLOCK
      ?auto_6456 - BLOCK
      ?auto_6455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6452 ?auto_6453 ) ) ( ON ?auto_6453 ?auto_6454 ) ( not ( = ?auto_6452 ?auto_6454 ) ) ( not ( = ?auto_6453 ?auto_6454 ) ) ( ON ?auto_6452 ?auto_6453 ) ( CLEAR ?auto_6452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6456 ) ( ON ?auto_6455 ?auto_6456 ) ( ON ?auto_6454 ?auto_6455 ) ( not ( = ?auto_6456 ?auto_6455 ) ) ( not ( = ?auto_6456 ?auto_6454 ) ) ( not ( = ?auto_6456 ?auto_6453 ) ) ( not ( = ?auto_6456 ?auto_6452 ) ) ( not ( = ?auto_6455 ?auto_6454 ) ) ( not ( = ?auto_6455 ?auto_6453 ) ) ( not ( = ?auto_6455 ?auto_6452 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6456 ?auto_6455 ?auto_6454 ?auto_6453 )
      ( MAKE-2PILE ?auto_6452 ?auto_6453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6459 - BLOCK
      ?auto_6460 - BLOCK
    )
    :vars
    (
      ?auto_6461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6461 ?auto_6460 ) ( CLEAR ?auto_6461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6459 ) ( ON ?auto_6460 ?auto_6459 ) ( not ( = ?auto_6459 ?auto_6460 ) ) ( not ( = ?auto_6459 ?auto_6461 ) ) ( not ( = ?auto_6460 ?auto_6461 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6461 ?auto_6460 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6462 - BLOCK
      ?auto_6463 - BLOCK
    )
    :vars
    (
      ?auto_6464 - BLOCK
      ?auto_6465 - BLOCK
      ?auto_6466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6464 ?auto_6463 ) ( CLEAR ?auto_6464 ) ( ON-TABLE ?auto_6462 ) ( ON ?auto_6463 ?auto_6462 ) ( not ( = ?auto_6462 ?auto_6463 ) ) ( not ( = ?auto_6462 ?auto_6464 ) ) ( not ( = ?auto_6463 ?auto_6464 ) ) ( HOLDING ?auto_6465 ) ( CLEAR ?auto_6466 ) ( not ( = ?auto_6462 ?auto_6465 ) ) ( not ( = ?auto_6462 ?auto_6466 ) ) ( not ( = ?auto_6463 ?auto_6465 ) ) ( not ( = ?auto_6463 ?auto_6466 ) ) ( not ( = ?auto_6464 ?auto_6465 ) ) ( not ( = ?auto_6464 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6466 ) ) )
    :subtasks
    ( ( !STACK ?auto_6465 ?auto_6466 )
      ( MAKE-2PILE ?auto_6462 ?auto_6463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6662 - BLOCK
      ?auto_6663 - BLOCK
    )
    :vars
    (
      ?auto_6664 - BLOCK
      ?auto_6665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6664 ?auto_6663 ) ( ON-TABLE ?auto_6662 ) ( ON ?auto_6663 ?auto_6662 ) ( not ( = ?auto_6662 ?auto_6663 ) ) ( not ( = ?auto_6662 ?auto_6664 ) ) ( not ( = ?auto_6663 ?auto_6664 ) ) ( not ( = ?auto_6662 ?auto_6665 ) ) ( not ( = ?auto_6663 ?auto_6665 ) ) ( not ( = ?auto_6664 ?auto_6665 ) ) ( ON ?auto_6665 ?auto_6664 ) ( CLEAR ?auto_6665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6662 ?auto_6663 ?auto_6664 )
      ( MAKE-2PILE ?auto_6662 ?auto_6663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6472 - BLOCK
      ?auto_6473 - BLOCK
    )
    :vars
    (
      ?auto_6476 - BLOCK
      ?auto_6474 - BLOCK
      ?auto_6475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6476 ?auto_6473 ) ( ON-TABLE ?auto_6472 ) ( ON ?auto_6473 ?auto_6472 ) ( not ( = ?auto_6472 ?auto_6473 ) ) ( not ( = ?auto_6472 ?auto_6476 ) ) ( not ( = ?auto_6473 ?auto_6476 ) ) ( not ( = ?auto_6472 ?auto_6474 ) ) ( not ( = ?auto_6472 ?auto_6475 ) ) ( not ( = ?auto_6473 ?auto_6474 ) ) ( not ( = ?auto_6473 ?auto_6475 ) ) ( not ( = ?auto_6476 ?auto_6474 ) ) ( not ( = ?auto_6476 ?auto_6475 ) ) ( not ( = ?auto_6474 ?auto_6475 ) ) ( ON ?auto_6474 ?auto_6476 ) ( CLEAR ?auto_6474 ) ( HOLDING ?auto_6475 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6475 )
      ( MAKE-2PILE ?auto_6472 ?auto_6473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6477 - BLOCK
      ?auto_6478 - BLOCK
    )
    :vars
    (
      ?auto_6481 - BLOCK
      ?auto_6479 - BLOCK
      ?auto_6480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6481 ?auto_6478 ) ( ON-TABLE ?auto_6477 ) ( ON ?auto_6478 ?auto_6477 ) ( not ( = ?auto_6477 ?auto_6478 ) ) ( not ( = ?auto_6477 ?auto_6481 ) ) ( not ( = ?auto_6478 ?auto_6481 ) ) ( not ( = ?auto_6477 ?auto_6479 ) ) ( not ( = ?auto_6477 ?auto_6480 ) ) ( not ( = ?auto_6478 ?auto_6479 ) ) ( not ( = ?auto_6478 ?auto_6480 ) ) ( not ( = ?auto_6481 ?auto_6479 ) ) ( not ( = ?auto_6481 ?auto_6480 ) ) ( not ( = ?auto_6479 ?auto_6480 ) ) ( ON ?auto_6479 ?auto_6481 ) ( ON ?auto_6480 ?auto_6479 ) ( CLEAR ?auto_6480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6477 ?auto_6478 ?auto_6481 ?auto_6479 )
      ( MAKE-2PILE ?auto_6477 ?auto_6478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6485 - BLOCK
      ?auto_6486 - BLOCK
      ?auto_6487 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6487 ) ( CLEAR ?auto_6486 ) ( ON-TABLE ?auto_6485 ) ( ON ?auto_6486 ?auto_6485 ) ( not ( = ?auto_6485 ?auto_6486 ) ) ( not ( = ?auto_6485 ?auto_6487 ) ) ( not ( = ?auto_6486 ?auto_6487 ) ) )
    :subtasks
    ( ( !STACK ?auto_6487 ?auto_6486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6488 - BLOCK
      ?auto_6489 - BLOCK
      ?auto_6490 - BLOCK
    )
    :vars
    (
      ?auto_6491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6489 ) ( ON-TABLE ?auto_6488 ) ( ON ?auto_6489 ?auto_6488 ) ( not ( = ?auto_6488 ?auto_6489 ) ) ( not ( = ?auto_6488 ?auto_6490 ) ) ( not ( = ?auto_6489 ?auto_6490 ) ) ( ON ?auto_6490 ?auto_6491 ) ( CLEAR ?auto_6490 ) ( HAND-EMPTY ) ( not ( = ?auto_6488 ?auto_6491 ) ) ( not ( = ?auto_6489 ?auto_6491 ) ) ( not ( = ?auto_6490 ?auto_6491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6490 ?auto_6491 )
      ( MAKE-3PILE ?auto_6488 ?auto_6489 ?auto_6490 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6492 - BLOCK
      ?auto_6493 - BLOCK
      ?auto_6494 - BLOCK
    )
    :vars
    (
      ?auto_6495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6492 ) ( not ( = ?auto_6492 ?auto_6493 ) ) ( not ( = ?auto_6492 ?auto_6494 ) ) ( not ( = ?auto_6493 ?auto_6494 ) ) ( ON ?auto_6494 ?auto_6495 ) ( CLEAR ?auto_6494 ) ( not ( = ?auto_6492 ?auto_6495 ) ) ( not ( = ?auto_6493 ?auto_6495 ) ) ( not ( = ?auto_6494 ?auto_6495 ) ) ( HOLDING ?auto_6493 ) ( CLEAR ?auto_6492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6492 ?auto_6493 )
      ( MAKE-3PILE ?auto_6492 ?auto_6493 ?auto_6494 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6496 - BLOCK
      ?auto_6497 - BLOCK
      ?auto_6498 - BLOCK
    )
    :vars
    (
      ?auto_6499 - BLOCK
      ?auto_6500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6496 ) ( not ( = ?auto_6496 ?auto_6497 ) ) ( not ( = ?auto_6496 ?auto_6498 ) ) ( not ( = ?auto_6497 ?auto_6498 ) ) ( ON ?auto_6498 ?auto_6499 ) ( not ( = ?auto_6496 ?auto_6499 ) ) ( not ( = ?auto_6497 ?auto_6499 ) ) ( not ( = ?auto_6498 ?auto_6499 ) ) ( CLEAR ?auto_6496 ) ( ON ?auto_6497 ?auto_6498 ) ( CLEAR ?auto_6497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6500 ) ( ON ?auto_6499 ?auto_6500 ) ( not ( = ?auto_6500 ?auto_6499 ) ) ( not ( = ?auto_6500 ?auto_6498 ) ) ( not ( = ?auto_6500 ?auto_6497 ) ) ( not ( = ?auto_6496 ?auto_6500 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6500 ?auto_6499 ?auto_6498 )
      ( MAKE-3PILE ?auto_6496 ?auto_6497 ?auto_6498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6501 - BLOCK
      ?auto_6502 - BLOCK
      ?auto_6503 - BLOCK
    )
    :vars
    (
      ?auto_6504 - BLOCK
      ?auto_6505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6501 ?auto_6502 ) ) ( not ( = ?auto_6501 ?auto_6503 ) ) ( not ( = ?auto_6502 ?auto_6503 ) ) ( ON ?auto_6503 ?auto_6504 ) ( not ( = ?auto_6501 ?auto_6504 ) ) ( not ( = ?auto_6502 ?auto_6504 ) ) ( not ( = ?auto_6503 ?auto_6504 ) ) ( ON ?auto_6502 ?auto_6503 ) ( CLEAR ?auto_6502 ) ( ON-TABLE ?auto_6505 ) ( ON ?auto_6504 ?auto_6505 ) ( not ( = ?auto_6505 ?auto_6504 ) ) ( not ( = ?auto_6505 ?auto_6503 ) ) ( not ( = ?auto_6505 ?auto_6502 ) ) ( not ( = ?auto_6501 ?auto_6505 ) ) ( HOLDING ?auto_6501 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6501 )
      ( MAKE-3PILE ?auto_6501 ?auto_6502 ?auto_6503 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6506 - BLOCK
      ?auto_6507 - BLOCK
      ?auto_6508 - BLOCK
    )
    :vars
    (
      ?auto_6510 - BLOCK
      ?auto_6509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6506 ?auto_6507 ) ) ( not ( = ?auto_6506 ?auto_6508 ) ) ( not ( = ?auto_6507 ?auto_6508 ) ) ( ON ?auto_6508 ?auto_6510 ) ( not ( = ?auto_6506 ?auto_6510 ) ) ( not ( = ?auto_6507 ?auto_6510 ) ) ( not ( = ?auto_6508 ?auto_6510 ) ) ( ON ?auto_6507 ?auto_6508 ) ( ON-TABLE ?auto_6509 ) ( ON ?auto_6510 ?auto_6509 ) ( not ( = ?auto_6509 ?auto_6510 ) ) ( not ( = ?auto_6509 ?auto_6508 ) ) ( not ( = ?auto_6509 ?auto_6507 ) ) ( not ( = ?auto_6506 ?auto_6509 ) ) ( ON ?auto_6506 ?auto_6507 ) ( CLEAR ?auto_6506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6509 ?auto_6510 ?auto_6508 ?auto_6507 )
      ( MAKE-3PILE ?auto_6506 ?auto_6507 ?auto_6508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6512 - BLOCK
    )
    :vars
    (
      ?auto_6513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6513 ?auto_6512 ) ( CLEAR ?auto_6513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6512 ) ( not ( = ?auto_6512 ?auto_6513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6513 ?auto_6512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6514 - BLOCK
    )
    :vars
    (
      ?auto_6515 - BLOCK
      ?auto_6516 - BLOCK
      ?auto_6517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6515 ?auto_6514 ) ( CLEAR ?auto_6515 ) ( ON-TABLE ?auto_6514 ) ( not ( = ?auto_6514 ?auto_6515 ) ) ( HOLDING ?auto_6516 ) ( CLEAR ?auto_6517 ) ( not ( = ?auto_6514 ?auto_6516 ) ) ( not ( = ?auto_6514 ?auto_6517 ) ) ( not ( = ?auto_6515 ?auto_6516 ) ) ( not ( = ?auto_6515 ?auto_6517 ) ) ( not ( = ?auto_6516 ?auto_6517 ) ) )
    :subtasks
    ( ( !STACK ?auto_6516 ?auto_6517 )
      ( MAKE-1PILE ?auto_6514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6518 - BLOCK
    )
    :vars
    (
      ?auto_6519 - BLOCK
      ?auto_6521 - BLOCK
      ?auto_6520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6519 ?auto_6518 ) ( ON-TABLE ?auto_6518 ) ( not ( = ?auto_6518 ?auto_6519 ) ) ( CLEAR ?auto_6521 ) ( not ( = ?auto_6518 ?auto_6520 ) ) ( not ( = ?auto_6518 ?auto_6521 ) ) ( not ( = ?auto_6519 ?auto_6520 ) ) ( not ( = ?auto_6519 ?auto_6521 ) ) ( not ( = ?auto_6520 ?auto_6521 ) ) ( ON ?auto_6520 ?auto_6519 ) ( CLEAR ?auto_6520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6518 ?auto_6519 )
      ( MAKE-1PILE ?auto_6518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6522 - BLOCK
    )
    :vars
    (
      ?auto_6524 - BLOCK
      ?auto_6525 - BLOCK
      ?auto_6523 - BLOCK
      ?auto_6526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6524 ?auto_6522 ) ( ON-TABLE ?auto_6522 ) ( not ( = ?auto_6522 ?auto_6524 ) ) ( not ( = ?auto_6522 ?auto_6525 ) ) ( not ( = ?auto_6522 ?auto_6523 ) ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( not ( = ?auto_6524 ?auto_6523 ) ) ( not ( = ?auto_6525 ?auto_6523 ) ) ( ON ?auto_6525 ?auto_6524 ) ( CLEAR ?auto_6525 ) ( HOLDING ?auto_6523 ) ( CLEAR ?auto_6526 ) ( ON-TABLE ?auto_6526 ) ( not ( = ?auto_6526 ?auto_6523 ) ) ( not ( = ?auto_6522 ?auto_6526 ) ) ( not ( = ?auto_6524 ?auto_6526 ) ) ( not ( = ?auto_6525 ?auto_6526 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6526 ?auto_6523 )
      ( MAKE-1PILE ?auto_6522 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6750 - BLOCK
    )
    :vars
    (
      ?auto_6751 - BLOCK
      ?auto_6752 - BLOCK
      ?auto_6753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6751 ?auto_6750 ) ( ON-TABLE ?auto_6750 ) ( not ( = ?auto_6750 ?auto_6751 ) ) ( not ( = ?auto_6750 ?auto_6752 ) ) ( not ( = ?auto_6750 ?auto_6753 ) ) ( not ( = ?auto_6751 ?auto_6752 ) ) ( not ( = ?auto_6751 ?auto_6753 ) ) ( not ( = ?auto_6752 ?auto_6753 ) ) ( ON ?auto_6752 ?auto_6751 ) ( ON ?auto_6753 ?auto_6752 ) ( CLEAR ?auto_6753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6750 ?auto_6751 ?auto_6752 )
      ( MAKE-1PILE ?auto_6750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6532 - BLOCK
    )
    :vars
    (
      ?auto_6536 - BLOCK
      ?auto_6533 - BLOCK
      ?auto_6535 - BLOCK
      ?auto_6534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6536 ?auto_6532 ) ( ON-TABLE ?auto_6532 ) ( not ( = ?auto_6532 ?auto_6536 ) ) ( not ( = ?auto_6532 ?auto_6533 ) ) ( not ( = ?auto_6532 ?auto_6535 ) ) ( not ( = ?auto_6536 ?auto_6533 ) ) ( not ( = ?auto_6536 ?auto_6535 ) ) ( not ( = ?auto_6533 ?auto_6535 ) ) ( ON ?auto_6533 ?auto_6536 ) ( not ( = ?auto_6534 ?auto_6535 ) ) ( not ( = ?auto_6532 ?auto_6534 ) ) ( not ( = ?auto_6536 ?auto_6534 ) ) ( not ( = ?auto_6533 ?auto_6534 ) ) ( ON ?auto_6535 ?auto_6533 ) ( CLEAR ?auto_6535 ) ( HOLDING ?auto_6534 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6534 )
      ( MAKE-1PILE ?auto_6532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6537 - BLOCK
    )
    :vars
    (
      ?auto_6540 - BLOCK
      ?auto_6538 - BLOCK
      ?auto_6539 - BLOCK
      ?auto_6541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6540 ?auto_6537 ) ( ON-TABLE ?auto_6537 ) ( not ( = ?auto_6537 ?auto_6540 ) ) ( not ( = ?auto_6537 ?auto_6538 ) ) ( not ( = ?auto_6537 ?auto_6539 ) ) ( not ( = ?auto_6540 ?auto_6538 ) ) ( not ( = ?auto_6540 ?auto_6539 ) ) ( not ( = ?auto_6538 ?auto_6539 ) ) ( ON ?auto_6538 ?auto_6540 ) ( not ( = ?auto_6541 ?auto_6539 ) ) ( not ( = ?auto_6537 ?auto_6541 ) ) ( not ( = ?auto_6540 ?auto_6541 ) ) ( not ( = ?auto_6538 ?auto_6541 ) ) ( ON ?auto_6539 ?auto_6538 ) ( ON ?auto_6541 ?auto_6539 ) ( CLEAR ?auto_6541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6537 ?auto_6540 ?auto_6538 ?auto_6539 )
      ( MAKE-1PILE ?auto_6537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6546 - BLOCK
      ?auto_6547 - BLOCK
      ?auto_6548 - BLOCK
      ?auto_6549 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6549 ) ( CLEAR ?auto_6548 ) ( ON-TABLE ?auto_6546 ) ( ON ?auto_6547 ?auto_6546 ) ( ON ?auto_6548 ?auto_6547 ) ( not ( = ?auto_6546 ?auto_6547 ) ) ( not ( = ?auto_6546 ?auto_6548 ) ) ( not ( = ?auto_6546 ?auto_6549 ) ) ( not ( = ?auto_6547 ?auto_6548 ) ) ( not ( = ?auto_6547 ?auto_6549 ) ) ( not ( = ?auto_6548 ?auto_6549 ) ) )
    :subtasks
    ( ( !STACK ?auto_6549 ?auto_6548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6550 - BLOCK
      ?auto_6551 - BLOCK
      ?auto_6552 - BLOCK
      ?auto_6553 - BLOCK
    )
    :vars
    (
      ?auto_6554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6552 ) ( ON-TABLE ?auto_6550 ) ( ON ?auto_6551 ?auto_6550 ) ( ON ?auto_6552 ?auto_6551 ) ( not ( = ?auto_6550 ?auto_6551 ) ) ( not ( = ?auto_6550 ?auto_6552 ) ) ( not ( = ?auto_6550 ?auto_6553 ) ) ( not ( = ?auto_6551 ?auto_6552 ) ) ( not ( = ?auto_6551 ?auto_6553 ) ) ( not ( = ?auto_6552 ?auto_6553 ) ) ( ON ?auto_6553 ?auto_6554 ) ( CLEAR ?auto_6553 ) ( HAND-EMPTY ) ( not ( = ?auto_6550 ?auto_6554 ) ) ( not ( = ?auto_6551 ?auto_6554 ) ) ( not ( = ?auto_6552 ?auto_6554 ) ) ( not ( = ?auto_6553 ?auto_6554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6553 ?auto_6554 )
      ( MAKE-4PILE ?auto_6550 ?auto_6551 ?auto_6552 ?auto_6553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6555 - BLOCK
      ?auto_6556 - BLOCK
      ?auto_6557 - BLOCK
      ?auto_6558 - BLOCK
    )
    :vars
    (
      ?auto_6559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6555 ) ( ON ?auto_6556 ?auto_6555 ) ( not ( = ?auto_6555 ?auto_6556 ) ) ( not ( = ?auto_6555 ?auto_6557 ) ) ( not ( = ?auto_6555 ?auto_6558 ) ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( not ( = ?auto_6556 ?auto_6558 ) ) ( not ( = ?auto_6557 ?auto_6558 ) ) ( ON ?auto_6558 ?auto_6559 ) ( CLEAR ?auto_6558 ) ( not ( = ?auto_6555 ?auto_6559 ) ) ( not ( = ?auto_6556 ?auto_6559 ) ) ( not ( = ?auto_6557 ?auto_6559 ) ) ( not ( = ?auto_6558 ?auto_6559 ) ) ( HOLDING ?auto_6557 ) ( CLEAR ?auto_6556 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6555 ?auto_6556 ?auto_6557 )
      ( MAKE-4PILE ?auto_6555 ?auto_6556 ?auto_6557 ?auto_6558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6560 - BLOCK
      ?auto_6561 - BLOCK
      ?auto_6562 - BLOCK
      ?auto_6563 - BLOCK
    )
    :vars
    (
      ?auto_6564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6560 ) ( ON ?auto_6561 ?auto_6560 ) ( not ( = ?auto_6560 ?auto_6561 ) ) ( not ( = ?auto_6560 ?auto_6562 ) ) ( not ( = ?auto_6560 ?auto_6563 ) ) ( not ( = ?auto_6561 ?auto_6562 ) ) ( not ( = ?auto_6561 ?auto_6563 ) ) ( not ( = ?auto_6562 ?auto_6563 ) ) ( ON ?auto_6563 ?auto_6564 ) ( not ( = ?auto_6560 ?auto_6564 ) ) ( not ( = ?auto_6561 ?auto_6564 ) ) ( not ( = ?auto_6562 ?auto_6564 ) ) ( not ( = ?auto_6563 ?auto_6564 ) ) ( CLEAR ?auto_6561 ) ( ON ?auto_6562 ?auto_6563 ) ( CLEAR ?auto_6562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6564 ?auto_6563 )
      ( MAKE-4PILE ?auto_6560 ?auto_6561 ?auto_6562 ?auto_6563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6565 - BLOCK
      ?auto_6566 - BLOCK
      ?auto_6567 - BLOCK
      ?auto_6568 - BLOCK
    )
    :vars
    (
      ?auto_6569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6565 ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( not ( = ?auto_6565 ?auto_6567 ) ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( ON ?auto_6568 ?auto_6569 ) ( not ( = ?auto_6565 ?auto_6569 ) ) ( not ( = ?auto_6566 ?auto_6569 ) ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( ON ?auto_6567 ?auto_6568 ) ( CLEAR ?auto_6567 ) ( ON-TABLE ?auto_6569 ) ( HOLDING ?auto_6566 ) ( CLEAR ?auto_6565 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6565 ?auto_6566 )
      ( MAKE-4PILE ?auto_6565 ?auto_6566 ?auto_6567 ?auto_6568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6570 - BLOCK
      ?auto_6571 - BLOCK
      ?auto_6572 - BLOCK
      ?auto_6573 - BLOCK
    )
    :vars
    (
      ?auto_6574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6570 ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( not ( = ?auto_6570 ?auto_6573 ) ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( not ( = ?auto_6571 ?auto_6573 ) ) ( not ( = ?auto_6572 ?auto_6573 ) ) ( ON ?auto_6573 ?auto_6574 ) ( not ( = ?auto_6570 ?auto_6574 ) ) ( not ( = ?auto_6571 ?auto_6574 ) ) ( not ( = ?auto_6572 ?auto_6574 ) ) ( not ( = ?auto_6573 ?auto_6574 ) ) ( ON ?auto_6572 ?auto_6573 ) ( ON-TABLE ?auto_6574 ) ( CLEAR ?auto_6570 ) ( ON ?auto_6571 ?auto_6572 ) ( CLEAR ?auto_6571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6574 ?auto_6573 ?auto_6572 )
      ( MAKE-4PILE ?auto_6570 ?auto_6571 ?auto_6572 ?auto_6573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6575 - BLOCK
      ?auto_6576 - BLOCK
      ?auto_6577 - BLOCK
      ?auto_6578 - BLOCK
    )
    :vars
    (
      ?auto_6579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6575 ?auto_6576 ) ) ( not ( = ?auto_6575 ?auto_6577 ) ) ( not ( = ?auto_6575 ?auto_6578 ) ) ( not ( = ?auto_6576 ?auto_6577 ) ) ( not ( = ?auto_6576 ?auto_6578 ) ) ( not ( = ?auto_6577 ?auto_6578 ) ) ( ON ?auto_6578 ?auto_6579 ) ( not ( = ?auto_6575 ?auto_6579 ) ) ( not ( = ?auto_6576 ?auto_6579 ) ) ( not ( = ?auto_6577 ?auto_6579 ) ) ( not ( = ?auto_6578 ?auto_6579 ) ) ( ON ?auto_6577 ?auto_6578 ) ( ON-TABLE ?auto_6579 ) ( ON ?auto_6576 ?auto_6577 ) ( CLEAR ?auto_6576 ) ( HOLDING ?auto_6575 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6575 )
      ( MAKE-4PILE ?auto_6575 ?auto_6576 ?auto_6577 ?auto_6578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6580 - BLOCK
      ?auto_6581 - BLOCK
      ?auto_6582 - BLOCK
      ?auto_6583 - BLOCK
    )
    :vars
    (
      ?auto_6584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6580 ?auto_6581 ) ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( not ( = ?auto_6580 ?auto_6583 ) ) ( not ( = ?auto_6581 ?auto_6582 ) ) ( not ( = ?auto_6581 ?auto_6583 ) ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( ON ?auto_6583 ?auto_6584 ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( not ( = ?auto_6581 ?auto_6584 ) ) ( not ( = ?auto_6582 ?auto_6584 ) ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( ON ?auto_6582 ?auto_6583 ) ( ON-TABLE ?auto_6584 ) ( ON ?auto_6581 ?auto_6582 ) ( ON ?auto_6580 ?auto_6581 ) ( CLEAR ?auto_6580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6584 ?auto_6583 ?auto_6582 ?auto_6581 )
      ( MAKE-4PILE ?auto_6580 ?auto_6581 ?auto_6582 ?auto_6583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6625 - BLOCK
    )
    :vars
    (
      ?auto_6626 - BLOCK
      ?auto_6627 - BLOCK
      ?auto_6628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6625 ?auto_6626 ) ( CLEAR ?auto_6625 ) ( not ( = ?auto_6625 ?auto_6626 ) ) ( HOLDING ?auto_6627 ) ( CLEAR ?auto_6628 ) ( not ( = ?auto_6625 ?auto_6627 ) ) ( not ( = ?auto_6625 ?auto_6628 ) ) ( not ( = ?auto_6626 ?auto_6627 ) ) ( not ( = ?auto_6626 ?auto_6628 ) ) ( not ( = ?auto_6627 ?auto_6628 ) ) )
    :subtasks
    ( ( !STACK ?auto_6627 ?auto_6628 )
      ( MAKE-1PILE ?auto_6625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6629 - BLOCK
    )
    :vars
    (
      ?auto_6630 - BLOCK
      ?auto_6632 - BLOCK
      ?auto_6631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6629 ?auto_6630 ) ( not ( = ?auto_6629 ?auto_6630 ) ) ( CLEAR ?auto_6632 ) ( not ( = ?auto_6629 ?auto_6631 ) ) ( not ( = ?auto_6629 ?auto_6632 ) ) ( not ( = ?auto_6630 ?auto_6631 ) ) ( not ( = ?auto_6630 ?auto_6632 ) ) ( not ( = ?auto_6631 ?auto_6632 ) ) ( ON ?auto_6631 ?auto_6629 ) ( CLEAR ?auto_6631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6630 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6630 ?auto_6629 )
      ( MAKE-1PILE ?auto_6629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6633 - BLOCK
    )
    :vars
    (
      ?auto_6634 - BLOCK
      ?auto_6635 - BLOCK
      ?auto_6636 - BLOCK
      ?auto_6637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6633 ?auto_6634 ) ( not ( = ?auto_6633 ?auto_6634 ) ) ( not ( = ?auto_6633 ?auto_6635 ) ) ( not ( = ?auto_6633 ?auto_6636 ) ) ( not ( = ?auto_6634 ?auto_6635 ) ) ( not ( = ?auto_6634 ?auto_6636 ) ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( ON ?auto_6635 ?auto_6633 ) ( CLEAR ?auto_6635 ) ( ON-TABLE ?auto_6634 ) ( HOLDING ?auto_6636 ) ( CLEAR ?auto_6637 ) ( ON-TABLE ?auto_6637 ) ( not ( = ?auto_6637 ?auto_6636 ) ) ( not ( = ?auto_6633 ?auto_6637 ) ) ( not ( = ?auto_6634 ?auto_6637 ) ) ( not ( = ?auto_6635 ?auto_6637 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6637 ?auto_6636 )
      ( MAKE-1PILE ?auto_6633 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6638 - BLOCK
    )
    :vars
    (
      ?auto_6639 - BLOCK
      ?auto_6642 - BLOCK
      ?auto_6640 - BLOCK
      ?auto_6641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6638 ?auto_6639 ) ( not ( = ?auto_6638 ?auto_6639 ) ) ( not ( = ?auto_6638 ?auto_6642 ) ) ( not ( = ?auto_6638 ?auto_6640 ) ) ( not ( = ?auto_6639 ?auto_6642 ) ) ( not ( = ?auto_6639 ?auto_6640 ) ) ( not ( = ?auto_6642 ?auto_6640 ) ) ( ON ?auto_6642 ?auto_6638 ) ( ON-TABLE ?auto_6639 ) ( CLEAR ?auto_6641 ) ( ON-TABLE ?auto_6641 ) ( not ( = ?auto_6641 ?auto_6640 ) ) ( not ( = ?auto_6638 ?auto_6641 ) ) ( not ( = ?auto_6639 ?auto_6641 ) ) ( not ( = ?auto_6642 ?auto_6641 ) ) ( ON ?auto_6640 ?auto_6642 ) ( CLEAR ?auto_6640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6639 ?auto_6638 ?auto_6642 )
      ( MAKE-1PILE ?auto_6638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6643 - BLOCK
    )
    :vars
    (
      ?auto_6644 - BLOCK
      ?auto_6645 - BLOCK
      ?auto_6646 - BLOCK
      ?auto_6647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6643 ?auto_6644 ) ( not ( = ?auto_6643 ?auto_6644 ) ) ( not ( = ?auto_6643 ?auto_6645 ) ) ( not ( = ?auto_6643 ?auto_6646 ) ) ( not ( = ?auto_6644 ?auto_6645 ) ) ( not ( = ?auto_6644 ?auto_6646 ) ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( ON ?auto_6645 ?auto_6643 ) ( ON-TABLE ?auto_6644 ) ( not ( = ?auto_6647 ?auto_6646 ) ) ( not ( = ?auto_6643 ?auto_6647 ) ) ( not ( = ?auto_6644 ?auto_6647 ) ) ( not ( = ?auto_6645 ?auto_6647 ) ) ( ON ?auto_6646 ?auto_6645 ) ( CLEAR ?auto_6646 ) ( HOLDING ?auto_6647 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6647 )
      ( MAKE-1PILE ?auto_6643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6648 - BLOCK
    )
    :vars
    (
      ?auto_6649 - BLOCK
      ?auto_6651 - BLOCK
      ?auto_6650 - BLOCK
      ?auto_6652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6648 ?auto_6649 ) ( not ( = ?auto_6648 ?auto_6649 ) ) ( not ( = ?auto_6648 ?auto_6651 ) ) ( not ( = ?auto_6648 ?auto_6650 ) ) ( not ( = ?auto_6649 ?auto_6651 ) ) ( not ( = ?auto_6649 ?auto_6650 ) ) ( not ( = ?auto_6651 ?auto_6650 ) ) ( ON ?auto_6651 ?auto_6648 ) ( ON-TABLE ?auto_6649 ) ( not ( = ?auto_6652 ?auto_6650 ) ) ( not ( = ?auto_6648 ?auto_6652 ) ) ( not ( = ?auto_6649 ?auto_6652 ) ) ( not ( = ?auto_6651 ?auto_6652 ) ) ( ON ?auto_6650 ?auto_6651 ) ( ON ?auto_6652 ?auto_6650 ) ( CLEAR ?auto_6652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6649 ?auto_6648 ?auto_6651 ?auto_6650 )
      ( MAKE-1PILE ?auto_6648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6658 - BLOCK
      ?auto_6659 - BLOCK
    )
    :vars
    (
      ?auto_6660 - BLOCK
      ?auto_6661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6660 ?auto_6659 ) ( CLEAR ?auto_6660 ) ( ON-TABLE ?auto_6658 ) ( ON ?auto_6659 ?auto_6658 ) ( not ( = ?auto_6658 ?auto_6659 ) ) ( not ( = ?auto_6658 ?auto_6660 ) ) ( not ( = ?auto_6659 ?auto_6660 ) ) ( HOLDING ?auto_6661 ) ( not ( = ?auto_6658 ?auto_6661 ) ) ( not ( = ?auto_6659 ?auto_6661 ) ) ( not ( = ?auto_6660 ?auto_6661 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6661 )
      ( MAKE-2PILE ?auto_6658 ?auto_6659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6695 - BLOCK
      ?auto_6696 - BLOCK
    )
    :vars
    (
      ?auto_6697 - BLOCK
      ?auto_6698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6695 ?auto_6696 ) ) ( ON ?auto_6696 ?auto_6697 ) ( not ( = ?auto_6695 ?auto_6697 ) ) ( not ( = ?auto_6696 ?auto_6697 ) ) ( ON ?auto_6695 ?auto_6696 ) ( CLEAR ?auto_6695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6698 ) ( ON ?auto_6697 ?auto_6698 ) ( not ( = ?auto_6698 ?auto_6697 ) ) ( not ( = ?auto_6698 ?auto_6696 ) ) ( not ( = ?auto_6698 ?auto_6695 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6698 ?auto_6697 ?auto_6696 )
      ( MAKE-2PILE ?auto_6695 ?auto_6696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6701 - BLOCK
      ?auto_6702 - BLOCK
    )
    :vars
    (
      ?auto_6703 - BLOCK
      ?auto_6704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6701 ?auto_6702 ) ) ( ON ?auto_6702 ?auto_6703 ) ( CLEAR ?auto_6702 ) ( not ( = ?auto_6701 ?auto_6703 ) ) ( not ( = ?auto_6702 ?auto_6703 ) ) ( ON ?auto_6701 ?auto_6704 ) ( CLEAR ?auto_6701 ) ( HAND-EMPTY ) ( not ( = ?auto_6701 ?auto_6704 ) ) ( not ( = ?auto_6702 ?auto_6704 ) ) ( not ( = ?auto_6703 ?auto_6704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6701 ?auto_6704 )
      ( MAKE-2PILE ?auto_6701 ?auto_6702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6705 - BLOCK
      ?auto_6706 - BLOCK
    )
    :vars
    (
      ?auto_6708 - BLOCK
      ?auto_6707 - BLOCK
      ?auto_6709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6705 ?auto_6706 ) ) ( not ( = ?auto_6705 ?auto_6708 ) ) ( not ( = ?auto_6706 ?auto_6708 ) ) ( ON ?auto_6705 ?auto_6707 ) ( CLEAR ?auto_6705 ) ( not ( = ?auto_6705 ?auto_6707 ) ) ( not ( = ?auto_6706 ?auto_6707 ) ) ( not ( = ?auto_6708 ?auto_6707 ) ) ( HOLDING ?auto_6706 ) ( CLEAR ?auto_6708 ) ( ON-TABLE ?auto_6709 ) ( ON ?auto_6708 ?auto_6709 ) ( not ( = ?auto_6709 ?auto_6708 ) ) ( not ( = ?auto_6709 ?auto_6706 ) ) ( not ( = ?auto_6705 ?auto_6709 ) ) ( not ( = ?auto_6707 ?auto_6709 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6709 ?auto_6708 ?auto_6706 )
      ( MAKE-2PILE ?auto_6705 ?auto_6706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6710 - BLOCK
      ?auto_6711 - BLOCK
    )
    :vars
    (
      ?auto_6713 - BLOCK
      ?auto_6712 - BLOCK
      ?auto_6714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6710 ?auto_6711 ) ) ( not ( = ?auto_6710 ?auto_6713 ) ) ( not ( = ?auto_6711 ?auto_6713 ) ) ( ON ?auto_6710 ?auto_6712 ) ( not ( = ?auto_6710 ?auto_6712 ) ) ( not ( = ?auto_6711 ?auto_6712 ) ) ( not ( = ?auto_6713 ?auto_6712 ) ) ( CLEAR ?auto_6713 ) ( ON-TABLE ?auto_6714 ) ( ON ?auto_6713 ?auto_6714 ) ( not ( = ?auto_6714 ?auto_6713 ) ) ( not ( = ?auto_6714 ?auto_6711 ) ) ( not ( = ?auto_6710 ?auto_6714 ) ) ( not ( = ?auto_6712 ?auto_6714 ) ) ( ON ?auto_6711 ?auto_6710 ) ( CLEAR ?auto_6711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6712 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6712 ?auto_6710 )
      ( MAKE-2PILE ?auto_6710 ?auto_6711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6715 - BLOCK
      ?auto_6716 - BLOCK
    )
    :vars
    (
      ?auto_6719 - BLOCK
      ?auto_6718 - BLOCK
      ?auto_6717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6715 ?auto_6716 ) ) ( not ( = ?auto_6715 ?auto_6719 ) ) ( not ( = ?auto_6716 ?auto_6719 ) ) ( ON ?auto_6715 ?auto_6718 ) ( not ( = ?auto_6715 ?auto_6718 ) ) ( not ( = ?auto_6716 ?auto_6718 ) ) ( not ( = ?auto_6719 ?auto_6718 ) ) ( ON-TABLE ?auto_6717 ) ( not ( = ?auto_6717 ?auto_6719 ) ) ( not ( = ?auto_6717 ?auto_6716 ) ) ( not ( = ?auto_6715 ?auto_6717 ) ) ( not ( = ?auto_6718 ?auto_6717 ) ) ( ON ?auto_6716 ?auto_6715 ) ( CLEAR ?auto_6716 ) ( ON-TABLE ?auto_6718 ) ( HOLDING ?auto_6719 ) ( CLEAR ?auto_6717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6717 ?auto_6719 )
      ( MAKE-2PILE ?auto_6715 ?auto_6716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6720 - BLOCK
      ?auto_6721 - BLOCK
    )
    :vars
    (
      ?auto_6723 - BLOCK
      ?auto_6724 - BLOCK
      ?auto_6722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6720 ?auto_6721 ) ) ( not ( = ?auto_6720 ?auto_6723 ) ) ( not ( = ?auto_6721 ?auto_6723 ) ) ( ON ?auto_6720 ?auto_6724 ) ( not ( = ?auto_6720 ?auto_6724 ) ) ( not ( = ?auto_6721 ?auto_6724 ) ) ( not ( = ?auto_6723 ?auto_6724 ) ) ( ON-TABLE ?auto_6722 ) ( not ( = ?auto_6722 ?auto_6723 ) ) ( not ( = ?auto_6722 ?auto_6721 ) ) ( not ( = ?auto_6720 ?auto_6722 ) ) ( not ( = ?auto_6724 ?auto_6722 ) ) ( ON ?auto_6721 ?auto_6720 ) ( ON-TABLE ?auto_6724 ) ( CLEAR ?auto_6722 ) ( ON ?auto_6723 ?auto_6721 ) ( CLEAR ?auto_6723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6724 ?auto_6720 ?auto_6721 )
      ( MAKE-2PILE ?auto_6720 ?auto_6721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6725 - BLOCK
      ?auto_6726 - BLOCK
    )
    :vars
    (
      ?auto_6728 - BLOCK
      ?auto_6729 - BLOCK
      ?auto_6727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6725 ?auto_6726 ) ) ( not ( = ?auto_6725 ?auto_6728 ) ) ( not ( = ?auto_6726 ?auto_6728 ) ) ( ON ?auto_6725 ?auto_6729 ) ( not ( = ?auto_6725 ?auto_6729 ) ) ( not ( = ?auto_6726 ?auto_6729 ) ) ( not ( = ?auto_6728 ?auto_6729 ) ) ( not ( = ?auto_6727 ?auto_6728 ) ) ( not ( = ?auto_6727 ?auto_6726 ) ) ( not ( = ?auto_6725 ?auto_6727 ) ) ( not ( = ?auto_6729 ?auto_6727 ) ) ( ON ?auto_6726 ?auto_6725 ) ( ON-TABLE ?auto_6729 ) ( ON ?auto_6728 ?auto_6726 ) ( CLEAR ?auto_6728 ) ( HOLDING ?auto_6727 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6727 )
      ( MAKE-2PILE ?auto_6725 ?auto_6726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6730 - BLOCK
      ?auto_6731 - BLOCK
    )
    :vars
    (
      ?auto_6733 - BLOCK
      ?auto_6734 - BLOCK
      ?auto_6732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6733 ) ) ( not ( = ?auto_6731 ?auto_6733 ) ) ( ON ?auto_6730 ?auto_6734 ) ( not ( = ?auto_6730 ?auto_6734 ) ) ( not ( = ?auto_6731 ?auto_6734 ) ) ( not ( = ?auto_6733 ?auto_6734 ) ) ( not ( = ?auto_6732 ?auto_6733 ) ) ( not ( = ?auto_6732 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6732 ) ) ( not ( = ?auto_6734 ?auto_6732 ) ) ( ON ?auto_6731 ?auto_6730 ) ( ON-TABLE ?auto_6734 ) ( ON ?auto_6733 ?auto_6731 ) ( ON ?auto_6732 ?auto_6733 ) ( CLEAR ?auto_6732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6734 ?auto_6730 ?auto_6731 ?auto_6733 )
      ( MAKE-2PILE ?auto_6730 ?auto_6731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6746 - BLOCK
    )
    :vars
    (
      ?auto_6748 - BLOCK
      ?auto_6749 - BLOCK
      ?auto_6747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6748 ?auto_6746 ) ( ON-TABLE ?auto_6746 ) ( not ( = ?auto_6746 ?auto_6748 ) ) ( not ( = ?auto_6746 ?auto_6749 ) ) ( not ( = ?auto_6746 ?auto_6747 ) ) ( not ( = ?auto_6748 ?auto_6749 ) ) ( not ( = ?auto_6748 ?auto_6747 ) ) ( not ( = ?auto_6749 ?auto_6747 ) ) ( ON ?auto_6749 ?auto_6748 ) ( CLEAR ?auto_6749 ) ( HOLDING ?auto_6747 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6747 )
      ( MAKE-1PILE ?auto_6746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6779 - BLOCK
      ?auto_6780 - BLOCK
      ?auto_6781 - BLOCK
    )
    :vars
    (
      ?auto_6782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6779 ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( not ( = ?auto_6780 ?auto_6781 ) ) ( ON ?auto_6781 ?auto_6782 ) ( not ( = ?auto_6779 ?auto_6782 ) ) ( not ( = ?auto_6780 ?auto_6782 ) ) ( not ( = ?auto_6781 ?auto_6782 ) ) ( CLEAR ?auto_6779 ) ( ON ?auto_6780 ?auto_6781 ) ( CLEAR ?auto_6780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6782 ?auto_6781 )
      ( MAKE-3PILE ?auto_6779 ?auto_6780 ?auto_6781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6783 - BLOCK
      ?auto_6784 - BLOCK
      ?auto_6785 - BLOCK
    )
    :vars
    (
      ?auto_6786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6783 ?auto_6784 ) ) ( not ( = ?auto_6783 ?auto_6785 ) ) ( not ( = ?auto_6784 ?auto_6785 ) ) ( ON ?auto_6785 ?auto_6786 ) ( not ( = ?auto_6783 ?auto_6786 ) ) ( not ( = ?auto_6784 ?auto_6786 ) ) ( not ( = ?auto_6785 ?auto_6786 ) ) ( ON ?auto_6784 ?auto_6785 ) ( CLEAR ?auto_6784 ) ( ON-TABLE ?auto_6786 ) ( HOLDING ?auto_6783 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6783 )
      ( MAKE-3PILE ?auto_6783 ?auto_6784 ?auto_6785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6787 - BLOCK
      ?auto_6788 - BLOCK
      ?auto_6789 - BLOCK
    )
    :vars
    (
      ?auto_6790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6787 ?auto_6788 ) ) ( not ( = ?auto_6787 ?auto_6789 ) ) ( not ( = ?auto_6788 ?auto_6789 ) ) ( ON ?auto_6789 ?auto_6790 ) ( not ( = ?auto_6787 ?auto_6790 ) ) ( not ( = ?auto_6788 ?auto_6790 ) ) ( not ( = ?auto_6789 ?auto_6790 ) ) ( ON ?auto_6788 ?auto_6789 ) ( ON-TABLE ?auto_6790 ) ( ON ?auto_6787 ?auto_6788 ) ( CLEAR ?auto_6787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6790 ?auto_6789 ?auto_6788 )
      ( MAKE-3PILE ?auto_6787 ?auto_6788 ?auto_6789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6794 - BLOCK
      ?auto_6795 - BLOCK
      ?auto_6796 - BLOCK
    )
    :vars
    (
      ?auto_6797 - BLOCK
      ?auto_6798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6794 ?auto_6795 ) ) ( not ( = ?auto_6794 ?auto_6796 ) ) ( not ( = ?auto_6795 ?auto_6796 ) ) ( ON ?auto_6796 ?auto_6797 ) ( not ( = ?auto_6794 ?auto_6797 ) ) ( not ( = ?auto_6795 ?auto_6797 ) ) ( not ( = ?auto_6796 ?auto_6797 ) ) ( ON ?auto_6795 ?auto_6796 ) ( CLEAR ?auto_6795 ) ( ON-TABLE ?auto_6797 ) ( ON ?auto_6794 ?auto_6798 ) ( CLEAR ?auto_6794 ) ( HAND-EMPTY ) ( not ( = ?auto_6794 ?auto_6798 ) ) ( not ( = ?auto_6795 ?auto_6798 ) ) ( not ( = ?auto_6796 ?auto_6798 ) ) ( not ( = ?auto_6797 ?auto_6798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6794 ?auto_6798 )
      ( MAKE-3PILE ?auto_6794 ?auto_6795 ?auto_6796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6799 - BLOCK
      ?auto_6800 - BLOCK
      ?auto_6801 - BLOCK
    )
    :vars
    (
      ?auto_6803 - BLOCK
      ?auto_6802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6799 ?auto_6800 ) ) ( not ( = ?auto_6799 ?auto_6801 ) ) ( not ( = ?auto_6800 ?auto_6801 ) ) ( ON ?auto_6801 ?auto_6803 ) ( not ( = ?auto_6799 ?auto_6803 ) ) ( not ( = ?auto_6800 ?auto_6803 ) ) ( not ( = ?auto_6801 ?auto_6803 ) ) ( ON-TABLE ?auto_6803 ) ( ON ?auto_6799 ?auto_6802 ) ( CLEAR ?auto_6799 ) ( not ( = ?auto_6799 ?auto_6802 ) ) ( not ( = ?auto_6800 ?auto_6802 ) ) ( not ( = ?auto_6801 ?auto_6802 ) ) ( not ( = ?auto_6803 ?auto_6802 ) ) ( HOLDING ?auto_6800 ) ( CLEAR ?auto_6801 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6803 ?auto_6801 ?auto_6800 )
      ( MAKE-3PILE ?auto_6799 ?auto_6800 ?auto_6801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6804 - BLOCK
      ?auto_6805 - BLOCK
      ?auto_6806 - BLOCK
    )
    :vars
    (
      ?auto_6808 - BLOCK
      ?auto_6807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6804 ?auto_6805 ) ) ( not ( = ?auto_6804 ?auto_6806 ) ) ( not ( = ?auto_6805 ?auto_6806 ) ) ( ON ?auto_6806 ?auto_6808 ) ( not ( = ?auto_6804 ?auto_6808 ) ) ( not ( = ?auto_6805 ?auto_6808 ) ) ( not ( = ?auto_6806 ?auto_6808 ) ) ( ON-TABLE ?auto_6808 ) ( ON ?auto_6804 ?auto_6807 ) ( not ( = ?auto_6804 ?auto_6807 ) ) ( not ( = ?auto_6805 ?auto_6807 ) ) ( not ( = ?auto_6806 ?auto_6807 ) ) ( not ( = ?auto_6808 ?auto_6807 ) ) ( CLEAR ?auto_6806 ) ( ON ?auto_6805 ?auto_6804 ) ( CLEAR ?auto_6805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6807 ?auto_6804 )
      ( MAKE-3PILE ?auto_6804 ?auto_6805 ?auto_6806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6809 - BLOCK
      ?auto_6810 - BLOCK
      ?auto_6811 - BLOCK
    )
    :vars
    (
      ?auto_6812 - BLOCK
      ?auto_6813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6809 ?auto_6810 ) ) ( not ( = ?auto_6809 ?auto_6811 ) ) ( not ( = ?auto_6810 ?auto_6811 ) ) ( not ( = ?auto_6809 ?auto_6812 ) ) ( not ( = ?auto_6810 ?auto_6812 ) ) ( not ( = ?auto_6811 ?auto_6812 ) ) ( ON-TABLE ?auto_6812 ) ( ON ?auto_6809 ?auto_6813 ) ( not ( = ?auto_6809 ?auto_6813 ) ) ( not ( = ?auto_6810 ?auto_6813 ) ) ( not ( = ?auto_6811 ?auto_6813 ) ) ( not ( = ?auto_6812 ?auto_6813 ) ) ( ON ?auto_6810 ?auto_6809 ) ( CLEAR ?auto_6810 ) ( ON-TABLE ?auto_6813 ) ( HOLDING ?auto_6811 ) ( CLEAR ?auto_6812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6812 ?auto_6811 )
      ( MAKE-3PILE ?auto_6809 ?auto_6810 ?auto_6811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6814 - BLOCK
      ?auto_6815 - BLOCK
      ?auto_6816 - BLOCK
    )
    :vars
    (
      ?auto_6817 - BLOCK
      ?auto_6818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6814 ?auto_6815 ) ) ( not ( = ?auto_6814 ?auto_6816 ) ) ( not ( = ?auto_6815 ?auto_6816 ) ) ( not ( = ?auto_6814 ?auto_6817 ) ) ( not ( = ?auto_6815 ?auto_6817 ) ) ( not ( = ?auto_6816 ?auto_6817 ) ) ( ON-TABLE ?auto_6817 ) ( ON ?auto_6814 ?auto_6818 ) ( not ( = ?auto_6814 ?auto_6818 ) ) ( not ( = ?auto_6815 ?auto_6818 ) ) ( not ( = ?auto_6816 ?auto_6818 ) ) ( not ( = ?auto_6817 ?auto_6818 ) ) ( ON ?auto_6815 ?auto_6814 ) ( ON-TABLE ?auto_6818 ) ( CLEAR ?auto_6817 ) ( ON ?auto_6816 ?auto_6815 ) ( CLEAR ?auto_6816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6818 ?auto_6814 ?auto_6815 )
      ( MAKE-3PILE ?auto_6814 ?auto_6815 ?auto_6816 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6819 - BLOCK
      ?auto_6820 - BLOCK
      ?auto_6821 - BLOCK
    )
    :vars
    (
      ?auto_6822 - BLOCK
      ?auto_6823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6819 ?auto_6820 ) ) ( not ( = ?auto_6819 ?auto_6821 ) ) ( not ( = ?auto_6820 ?auto_6821 ) ) ( not ( = ?auto_6819 ?auto_6822 ) ) ( not ( = ?auto_6820 ?auto_6822 ) ) ( not ( = ?auto_6821 ?auto_6822 ) ) ( ON ?auto_6819 ?auto_6823 ) ( not ( = ?auto_6819 ?auto_6823 ) ) ( not ( = ?auto_6820 ?auto_6823 ) ) ( not ( = ?auto_6821 ?auto_6823 ) ) ( not ( = ?auto_6822 ?auto_6823 ) ) ( ON ?auto_6820 ?auto_6819 ) ( ON-TABLE ?auto_6823 ) ( ON ?auto_6821 ?auto_6820 ) ( CLEAR ?auto_6821 ) ( HOLDING ?auto_6822 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6822 )
      ( MAKE-3PILE ?auto_6819 ?auto_6820 ?auto_6821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6824 - BLOCK
      ?auto_6825 - BLOCK
      ?auto_6826 - BLOCK
    )
    :vars
    (
      ?auto_6827 - BLOCK
      ?auto_6828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6824 ?auto_6825 ) ) ( not ( = ?auto_6824 ?auto_6826 ) ) ( not ( = ?auto_6825 ?auto_6826 ) ) ( not ( = ?auto_6824 ?auto_6827 ) ) ( not ( = ?auto_6825 ?auto_6827 ) ) ( not ( = ?auto_6826 ?auto_6827 ) ) ( ON ?auto_6824 ?auto_6828 ) ( not ( = ?auto_6824 ?auto_6828 ) ) ( not ( = ?auto_6825 ?auto_6828 ) ) ( not ( = ?auto_6826 ?auto_6828 ) ) ( not ( = ?auto_6827 ?auto_6828 ) ) ( ON ?auto_6825 ?auto_6824 ) ( ON-TABLE ?auto_6828 ) ( ON ?auto_6826 ?auto_6825 ) ( ON ?auto_6827 ?auto_6826 ) ( CLEAR ?auto_6827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6828 ?auto_6824 ?auto_6825 ?auto_6826 )
      ( MAKE-3PILE ?auto_6824 ?auto_6825 ?auto_6826 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6837 - BLOCK
      ?auto_6838 - BLOCK
      ?auto_6839 - BLOCK
      ?auto_6840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6839 ) ( ON-TABLE ?auto_6837 ) ( ON ?auto_6838 ?auto_6837 ) ( ON ?auto_6839 ?auto_6838 ) ( not ( = ?auto_6837 ?auto_6838 ) ) ( not ( = ?auto_6837 ?auto_6839 ) ) ( not ( = ?auto_6837 ?auto_6840 ) ) ( not ( = ?auto_6838 ?auto_6839 ) ) ( not ( = ?auto_6838 ?auto_6840 ) ) ( not ( = ?auto_6839 ?auto_6840 ) ) ( ON-TABLE ?auto_6840 ) ( CLEAR ?auto_6840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_6840 )
      ( MAKE-4PILE ?auto_6837 ?auto_6838 ?auto_6839 ?auto_6840 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6841 - BLOCK
      ?auto_6842 - BLOCK
      ?auto_6843 - BLOCK
      ?auto_6844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6841 ) ( ON ?auto_6842 ?auto_6841 ) ( not ( = ?auto_6841 ?auto_6842 ) ) ( not ( = ?auto_6841 ?auto_6843 ) ) ( not ( = ?auto_6841 ?auto_6844 ) ) ( not ( = ?auto_6842 ?auto_6843 ) ) ( not ( = ?auto_6842 ?auto_6844 ) ) ( not ( = ?auto_6843 ?auto_6844 ) ) ( ON-TABLE ?auto_6844 ) ( CLEAR ?auto_6844 ) ( HOLDING ?auto_6843 ) ( CLEAR ?auto_6842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6841 ?auto_6842 ?auto_6843 )
      ( MAKE-4PILE ?auto_6841 ?auto_6842 ?auto_6843 ?auto_6844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6845 - BLOCK
      ?auto_6846 - BLOCK
      ?auto_6847 - BLOCK
      ?auto_6848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6845 ) ( ON ?auto_6846 ?auto_6845 ) ( not ( = ?auto_6845 ?auto_6846 ) ) ( not ( = ?auto_6845 ?auto_6847 ) ) ( not ( = ?auto_6845 ?auto_6848 ) ) ( not ( = ?auto_6846 ?auto_6847 ) ) ( not ( = ?auto_6846 ?auto_6848 ) ) ( not ( = ?auto_6847 ?auto_6848 ) ) ( ON-TABLE ?auto_6848 ) ( CLEAR ?auto_6846 ) ( ON ?auto_6847 ?auto_6848 ) ( CLEAR ?auto_6847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6848 )
      ( MAKE-4PILE ?auto_6845 ?auto_6846 ?auto_6847 ?auto_6848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6849 - BLOCK
      ?auto_6850 - BLOCK
      ?auto_6851 - BLOCK
      ?auto_6852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6849 ) ( not ( = ?auto_6849 ?auto_6850 ) ) ( not ( = ?auto_6849 ?auto_6851 ) ) ( not ( = ?auto_6849 ?auto_6852 ) ) ( not ( = ?auto_6850 ?auto_6851 ) ) ( not ( = ?auto_6850 ?auto_6852 ) ) ( not ( = ?auto_6851 ?auto_6852 ) ) ( ON-TABLE ?auto_6852 ) ( ON ?auto_6851 ?auto_6852 ) ( CLEAR ?auto_6851 ) ( HOLDING ?auto_6850 ) ( CLEAR ?auto_6849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6849 ?auto_6850 )
      ( MAKE-4PILE ?auto_6849 ?auto_6850 ?auto_6851 ?auto_6852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6853 - BLOCK
      ?auto_6854 - BLOCK
      ?auto_6855 - BLOCK
      ?auto_6856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6853 ) ( not ( = ?auto_6853 ?auto_6854 ) ) ( not ( = ?auto_6853 ?auto_6855 ) ) ( not ( = ?auto_6853 ?auto_6856 ) ) ( not ( = ?auto_6854 ?auto_6855 ) ) ( not ( = ?auto_6854 ?auto_6856 ) ) ( not ( = ?auto_6855 ?auto_6856 ) ) ( ON-TABLE ?auto_6856 ) ( ON ?auto_6855 ?auto_6856 ) ( CLEAR ?auto_6853 ) ( ON ?auto_6854 ?auto_6855 ) ( CLEAR ?auto_6854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6856 ?auto_6855 )
      ( MAKE-4PILE ?auto_6853 ?auto_6854 ?auto_6855 ?auto_6856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6857 - BLOCK
      ?auto_6858 - BLOCK
      ?auto_6859 - BLOCK
      ?auto_6860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6857 ?auto_6858 ) ) ( not ( = ?auto_6857 ?auto_6859 ) ) ( not ( = ?auto_6857 ?auto_6860 ) ) ( not ( = ?auto_6858 ?auto_6859 ) ) ( not ( = ?auto_6858 ?auto_6860 ) ) ( not ( = ?auto_6859 ?auto_6860 ) ) ( ON-TABLE ?auto_6860 ) ( ON ?auto_6859 ?auto_6860 ) ( ON ?auto_6858 ?auto_6859 ) ( CLEAR ?auto_6858 ) ( HOLDING ?auto_6857 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6857 )
      ( MAKE-4PILE ?auto_6857 ?auto_6858 ?auto_6859 ?auto_6860 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6861 - BLOCK
      ?auto_6862 - BLOCK
      ?auto_6863 - BLOCK
      ?auto_6864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6861 ?auto_6862 ) ) ( not ( = ?auto_6861 ?auto_6863 ) ) ( not ( = ?auto_6861 ?auto_6864 ) ) ( not ( = ?auto_6862 ?auto_6863 ) ) ( not ( = ?auto_6862 ?auto_6864 ) ) ( not ( = ?auto_6863 ?auto_6864 ) ) ( ON-TABLE ?auto_6864 ) ( ON ?auto_6863 ?auto_6864 ) ( ON ?auto_6862 ?auto_6863 ) ( ON ?auto_6861 ?auto_6862 ) ( CLEAR ?auto_6861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6864 ?auto_6863 ?auto_6862 )
      ( MAKE-4PILE ?auto_6861 ?auto_6862 ?auto_6863 ?auto_6864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6869 - BLOCK
      ?auto_6870 - BLOCK
      ?auto_6871 - BLOCK
      ?auto_6872 - BLOCK
    )
    :vars
    (
      ?auto_6873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6869 ?auto_6870 ) ) ( not ( = ?auto_6869 ?auto_6871 ) ) ( not ( = ?auto_6869 ?auto_6872 ) ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6870 ?auto_6872 ) ) ( not ( = ?auto_6871 ?auto_6872 ) ) ( ON-TABLE ?auto_6872 ) ( ON ?auto_6871 ?auto_6872 ) ( ON ?auto_6870 ?auto_6871 ) ( CLEAR ?auto_6870 ) ( ON ?auto_6869 ?auto_6873 ) ( CLEAR ?auto_6869 ) ( HAND-EMPTY ) ( not ( = ?auto_6869 ?auto_6873 ) ) ( not ( = ?auto_6870 ?auto_6873 ) ) ( not ( = ?auto_6871 ?auto_6873 ) ) ( not ( = ?auto_6872 ?auto_6873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6869 ?auto_6873 )
      ( MAKE-4PILE ?auto_6869 ?auto_6870 ?auto_6871 ?auto_6872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6874 - BLOCK
      ?auto_6875 - BLOCK
      ?auto_6876 - BLOCK
      ?auto_6877 - BLOCK
    )
    :vars
    (
      ?auto_6878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6874 ?auto_6875 ) ) ( not ( = ?auto_6874 ?auto_6876 ) ) ( not ( = ?auto_6874 ?auto_6877 ) ) ( not ( = ?auto_6875 ?auto_6876 ) ) ( not ( = ?auto_6875 ?auto_6877 ) ) ( not ( = ?auto_6876 ?auto_6877 ) ) ( ON-TABLE ?auto_6877 ) ( ON ?auto_6876 ?auto_6877 ) ( ON ?auto_6874 ?auto_6878 ) ( CLEAR ?auto_6874 ) ( not ( = ?auto_6874 ?auto_6878 ) ) ( not ( = ?auto_6875 ?auto_6878 ) ) ( not ( = ?auto_6876 ?auto_6878 ) ) ( not ( = ?auto_6877 ?auto_6878 ) ) ( HOLDING ?auto_6875 ) ( CLEAR ?auto_6876 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6877 ?auto_6876 ?auto_6875 )
      ( MAKE-4PILE ?auto_6874 ?auto_6875 ?auto_6876 ?auto_6877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6879 - BLOCK
      ?auto_6880 - BLOCK
      ?auto_6881 - BLOCK
      ?auto_6882 - BLOCK
    )
    :vars
    (
      ?auto_6883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6879 ?auto_6880 ) ) ( not ( = ?auto_6879 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6882 ) ) ( not ( = ?auto_6880 ?auto_6881 ) ) ( not ( = ?auto_6880 ?auto_6882 ) ) ( not ( = ?auto_6881 ?auto_6882 ) ) ( ON-TABLE ?auto_6882 ) ( ON ?auto_6881 ?auto_6882 ) ( ON ?auto_6879 ?auto_6883 ) ( not ( = ?auto_6879 ?auto_6883 ) ) ( not ( = ?auto_6880 ?auto_6883 ) ) ( not ( = ?auto_6881 ?auto_6883 ) ) ( not ( = ?auto_6882 ?auto_6883 ) ) ( CLEAR ?auto_6881 ) ( ON ?auto_6880 ?auto_6879 ) ( CLEAR ?auto_6880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6883 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6883 ?auto_6879 )
      ( MAKE-4PILE ?auto_6879 ?auto_6880 ?auto_6881 ?auto_6882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6884 - BLOCK
      ?auto_6885 - BLOCK
      ?auto_6886 - BLOCK
      ?auto_6887 - BLOCK
    )
    :vars
    (
      ?auto_6888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6884 ?auto_6885 ) ) ( not ( = ?auto_6884 ?auto_6886 ) ) ( not ( = ?auto_6884 ?auto_6887 ) ) ( not ( = ?auto_6885 ?auto_6886 ) ) ( not ( = ?auto_6885 ?auto_6887 ) ) ( not ( = ?auto_6886 ?auto_6887 ) ) ( ON-TABLE ?auto_6887 ) ( ON ?auto_6884 ?auto_6888 ) ( not ( = ?auto_6884 ?auto_6888 ) ) ( not ( = ?auto_6885 ?auto_6888 ) ) ( not ( = ?auto_6886 ?auto_6888 ) ) ( not ( = ?auto_6887 ?auto_6888 ) ) ( ON ?auto_6885 ?auto_6884 ) ( CLEAR ?auto_6885 ) ( ON-TABLE ?auto_6888 ) ( HOLDING ?auto_6886 ) ( CLEAR ?auto_6887 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6887 ?auto_6886 )
      ( MAKE-4PILE ?auto_6884 ?auto_6885 ?auto_6886 ?auto_6887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6889 - BLOCK
      ?auto_6890 - BLOCK
      ?auto_6891 - BLOCK
      ?auto_6892 - BLOCK
    )
    :vars
    (
      ?auto_6893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6889 ?auto_6890 ) ) ( not ( = ?auto_6889 ?auto_6891 ) ) ( not ( = ?auto_6889 ?auto_6892 ) ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6892 ) ) ( not ( = ?auto_6891 ?auto_6892 ) ) ( ON-TABLE ?auto_6892 ) ( ON ?auto_6889 ?auto_6893 ) ( not ( = ?auto_6889 ?auto_6893 ) ) ( not ( = ?auto_6890 ?auto_6893 ) ) ( not ( = ?auto_6891 ?auto_6893 ) ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( ON ?auto_6890 ?auto_6889 ) ( ON-TABLE ?auto_6893 ) ( CLEAR ?auto_6892 ) ( ON ?auto_6891 ?auto_6890 ) ( CLEAR ?auto_6891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6893 ?auto_6889 ?auto_6890 )
      ( MAKE-4PILE ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6894 - BLOCK
      ?auto_6895 - BLOCK
      ?auto_6896 - BLOCK
      ?auto_6897 - BLOCK
    )
    :vars
    (
      ?auto_6898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6894 ?auto_6895 ) ) ( not ( = ?auto_6894 ?auto_6896 ) ) ( not ( = ?auto_6894 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6896 ) ) ( not ( = ?auto_6895 ?auto_6897 ) ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( ON ?auto_6894 ?auto_6898 ) ( not ( = ?auto_6894 ?auto_6898 ) ) ( not ( = ?auto_6895 ?auto_6898 ) ) ( not ( = ?auto_6896 ?auto_6898 ) ) ( not ( = ?auto_6897 ?auto_6898 ) ) ( ON ?auto_6895 ?auto_6894 ) ( ON-TABLE ?auto_6898 ) ( ON ?auto_6896 ?auto_6895 ) ( CLEAR ?auto_6896 ) ( HOLDING ?auto_6897 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6897 )
      ( MAKE-4PILE ?auto_6894 ?auto_6895 ?auto_6896 ?auto_6897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6899 - BLOCK
      ?auto_6900 - BLOCK
      ?auto_6901 - BLOCK
      ?auto_6902 - BLOCK
    )
    :vars
    (
      ?auto_6903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6899 ?auto_6900 ) ) ( not ( = ?auto_6899 ?auto_6901 ) ) ( not ( = ?auto_6899 ?auto_6902 ) ) ( not ( = ?auto_6900 ?auto_6901 ) ) ( not ( = ?auto_6900 ?auto_6902 ) ) ( not ( = ?auto_6901 ?auto_6902 ) ) ( ON ?auto_6899 ?auto_6903 ) ( not ( = ?auto_6899 ?auto_6903 ) ) ( not ( = ?auto_6900 ?auto_6903 ) ) ( not ( = ?auto_6901 ?auto_6903 ) ) ( not ( = ?auto_6902 ?auto_6903 ) ) ( ON ?auto_6900 ?auto_6899 ) ( ON-TABLE ?auto_6903 ) ( ON ?auto_6901 ?auto_6900 ) ( ON ?auto_6902 ?auto_6901 ) ( CLEAR ?auto_6902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6903 ?auto_6899 ?auto_6900 ?auto_6901 )
      ( MAKE-4PILE ?auto_6899 ?auto_6900 ?auto_6901 ?auto_6902 ) )
  )

)

