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
      ?auto_98436 - BLOCK
    )
    :vars
    (
      ?auto_98437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98436 ?auto_98437 ) ( CLEAR ?auto_98436 ) ( HAND-EMPTY ) ( not ( = ?auto_98436 ?auto_98437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98436 ?auto_98437 )
      ( !PUTDOWN ?auto_98436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98439 - BLOCK
    )
    :vars
    (
      ?auto_98440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98439 ?auto_98440 ) ( CLEAR ?auto_98439 ) ( HAND-EMPTY ) ( not ( = ?auto_98439 ?auto_98440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98439 ?auto_98440 )
      ( !PUTDOWN ?auto_98439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98443 - BLOCK
      ?auto_98444 - BLOCK
    )
    :vars
    (
      ?auto_98445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98443 ) ( ON ?auto_98444 ?auto_98445 ) ( CLEAR ?auto_98444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98443 ) ( not ( = ?auto_98443 ?auto_98444 ) ) ( not ( = ?auto_98443 ?auto_98445 ) ) ( not ( = ?auto_98444 ?auto_98445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98444 ?auto_98445 )
      ( !STACK ?auto_98444 ?auto_98443 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98448 - BLOCK
      ?auto_98449 - BLOCK
    )
    :vars
    (
      ?auto_98450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98448 ) ( ON ?auto_98449 ?auto_98450 ) ( CLEAR ?auto_98449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98448 ) ( not ( = ?auto_98448 ?auto_98449 ) ) ( not ( = ?auto_98448 ?auto_98450 ) ) ( not ( = ?auto_98449 ?auto_98450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98449 ?auto_98450 )
      ( !STACK ?auto_98449 ?auto_98448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98453 - BLOCK
      ?auto_98454 - BLOCK
    )
    :vars
    (
      ?auto_98455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98454 ?auto_98455 ) ( not ( = ?auto_98453 ?auto_98454 ) ) ( not ( = ?auto_98453 ?auto_98455 ) ) ( not ( = ?auto_98454 ?auto_98455 ) ) ( ON ?auto_98453 ?auto_98454 ) ( CLEAR ?auto_98453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98453 )
      ( MAKE-2PILE ?auto_98453 ?auto_98454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98458 - BLOCK
      ?auto_98459 - BLOCK
    )
    :vars
    (
      ?auto_98460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98459 ?auto_98460 ) ( not ( = ?auto_98458 ?auto_98459 ) ) ( not ( = ?auto_98458 ?auto_98460 ) ) ( not ( = ?auto_98459 ?auto_98460 ) ) ( ON ?auto_98458 ?auto_98459 ) ( CLEAR ?auto_98458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98458 )
      ( MAKE-2PILE ?auto_98458 ?auto_98459 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98464 - BLOCK
      ?auto_98465 - BLOCK
      ?auto_98466 - BLOCK
    )
    :vars
    (
      ?auto_98467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98465 ) ( ON ?auto_98466 ?auto_98467 ) ( CLEAR ?auto_98466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98464 ) ( ON ?auto_98465 ?auto_98464 ) ( not ( = ?auto_98464 ?auto_98465 ) ) ( not ( = ?auto_98464 ?auto_98466 ) ) ( not ( = ?auto_98464 ?auto_98467 ) ) ( not ( = ?auto_98465 ?auto_98466 ) ) ( not ( = ?auto_98465 ?auto_98467 ) ) ( not ( = ?auto_98466 ?auto_98467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98466 ?auto_98467 )
      ( !STACK ?auto_98466 ?auto_98465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98471 - BLOCK
      ?auto_98472 - BLOCK
      ?auto_98473 - BLOCK
    )
    :vars
    (
      ?auto_98474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98472 ) ( ON ?auto_98473 ?auto_98474 ) ( CLEAR ?auto_98473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98471 ) ( ON ?auto_98472 ?auto_98471 ) ( not ( = ?auto_98471 ?auto_98472 ) ) ( not ( = ?auto_98471 ?auto_98473 ) ) ( not ( = ?auto_98471 ?auto_98474 ) ) ( not ( = ?auto_98472 ?auto_98473 ) ) ( not ( = ?auto_98472 ?auto_98474 ) ) ( not ( = ?auto_98473 ?auto_98474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98473 ?auto_98474 )
      ( !STACK ?auto_98473 ?auto_98472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98478 - BLOCK
      ?auto_98479 - BLOCK
      ?auto_98480 - BLOCK
    )
    :vars
    (
      ?auto_98481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98480 ?auto_98481 ) ( ON-TABLE ?auto_98478 ) ( not ( = ?auto_98478 ?auto_98479 ) ) ( not ( = ?auto_98478 ?auto_98480 ) ) ( not ( = ?auto_98478 ?auto_98481 ) ) ( not ( = ?auto_98479 ?auto_98480 ) ) ( not ( = ?auto_98479 ?auto_98481 ) ) ( not ( = ?auto_98480 ?auto_98481 ) ) ( CLEAR ?auto_98478 ) ( ON ?auto_98479 ?auto_98480 ) ( CLEAR ?auto_98479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98478 ?auto_98479 )
      ( MAKE-3PILE ?auto_98478 ?auto_98479 ?auto_98480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98485 - BLOCK
      ?auto_98486 - BLOCK
      ?auto_98487 - BLOCK
    )
    :vars
    (
      ?auto_98488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98487 ?auto_98488 ) ( ON-TABLE ?auto_98485 ) ( not ( = ?auto_98485 ?auto_98486 ) ) ( not ( = ?auto_98485 ?auto_98487 ) ) ( not ( = ?auto_98485 ?auto_98488 ) ) ( not ( = ?auto_98486 ?auto_98487 ) ) ( not ( = ?auto_98486 ?auto_98488 ) ) ( not ( = ?auto_98487 ?auto_98488 ) ) ( CLEAR ?auto_98485 ) ( ON ?auto_98486 ?auto_98487 ) ( CLEAR ?auto_98486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98485 ?auto_98486 )
      ( MAKE-3PILE ?auto_98485 ?auto_98486 ?auto_98487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98492 - BLOCK
      ?auto_98493 - BLOCK
      ?auto_98494 - BLOCK
    )
    :vars
    (
      ?auto_98495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98494 ?auto_98495 ) ( not ( = ?auto_98492 ?auto_98493 ) ) ( not ( = ?auto_98492 ?auto_98494 ) ) ( not ( = ?auto_98492 ?auto_98495 ) ) ( not ( = ?auto_98493 ?auto_98494 ) ) ( not ( = ?auto_98493 ?auto_98495 ) ) ( not ( = ?auto_98494 ?auto_98495 ) ) ( ON ?auto_98493 ?auto_98494 ) ( ON ?auto_98492 ?auto_98493 ) ( CLEAR ?auto_98492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98492 )
      ( MAKE-3PILE ?auto_98492 ?auto_98493 ?auto_98494 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98499 - BLOCK
      ?auto_98500 - BLOCK
      ?auto_98501 - BLOCK
    )
    :vars
    (
      ?auto_98502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98501 ?auto_98502 ) ( not ( = ?auto_98499 ?auto_98500 ) ) ( not ( = ?auto_98499 ?auto_98501 ) ) ( not ( = ?auto_98499 ?auto_98502 ) ) ( not ( = ?auto_98500 ?auto_98501 ) ) ( not ( = ?auto_98500 ?auto_98502 ) ) ( not ( = ?auto_98501 ?auto_98502 ) ) ( ON ?auto_98500 ?auto_98501 ) ( ON ?auto_98499 ?auto_98500 ) ( CLEAR ?auto_98499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98499 )
      ( MAKE-3PILE ?auto_98499 ?auto_98500 ?auto_98501 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98507 - BLOCK
      ?auto_98508 - BLOCK
      ?auto_98509 - BLOCK
      ?auto_98510 - BLOCK
    )
    :vars
    (
      ?auto_98511 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98509 ) ( ON ?auto_98510 ?auto_98511 ) ( CLEAR ?auto_98510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98507 ) ( ON ?auto_98508 ?auto_98507 ) ( ON ?auto_98509 ?auto_98508 ) ( not ( = ?auto_98507 ?auto_98508 ) ) ( not ( = ?auto_98507 ?auto_98509 ) ) ( not ( = ?auto_98507 ?auto_98510 ) ) ( not ( = ?auto_98507 ?auto_98511 ) ) ( not ( = ?auto_98508 ?auto_98509 ) ) ( not ( = ?auto_98508 ?auto_98510 ) ) ( not ( = ?auto_98508 ?auto_98511 ) ) ( not ( = ?auto_98509 ?auto_98510 ) ) ( not ( = ?auto_98509 ?auto_98511 ) ) ( not ( = ?auto_98510 ?auto_98511 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98510 ?auto_98511 )
      ( !STACK ?auto_98510 ?auto_98509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98516 - BLOCK
      ?auto_98517 - BLOCK
      ?auto_98518 - BLOCK
      ?auto_98519 - BLOCK
    )
    :vars
    (
      ?auto_98520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98518 ) ( ON ?auto_98519 ?auto_98520 ) ( CLEAR ?auto_98519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98516 ) ( ON ?auto_98517 ?auto_98516 ) ( ON ?auto_98518 ?auto_98517 ) ( not ( = ?auto_98516 ?auto_98517 ) ) ( not ( = ?auto_98516 ?auto_98518 ) ) ( not ( = ?auto_98516 ?auto_98519 ) ) ( not ( = ?auto_98516 ?auto_98520 ) ) ( not ( = ?auto_98517 ?auto_98518 ) ) ( not ( = ?auto_98517 ?auto_98519 ) ) ( not ( = ?auto_98517 ?auto_98520 ) ) ( not ( = ?auto_98518 ?auto_98519 ) ) ( not ( = ?auto_98518 ?auto_98520 ) ) ( not ( = ?auto_98519 ?auto_98520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98519 ?auto_98520 )
      ( !STACK ?auto_98519 ?auto_98518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98525 - BLOCK
      ?auto_98526 - BLOCK
      ?auto_98527 - BLOCK
      ?auto_98528 - BLOCK
    )
    :vars
    (
      ?auto_98529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98528 ?auto_98529 ) ( ON-TABLE ?auto_98525 ) ( ON ?auto_98526 ?auto_98525 ) ( not ( = ?auto_98525 ?auto_98526 ) ) ( not ( = ?auto_98525 ?auto_98527 ) ) ( not ( = ?auto_98525 ?auto_98528 ) ) ( not ( = ?auto_98525 ?auto_98529 ) ) ( not ( = ?auto_98526 ?auto_98527 ) ) ( not ( = ?auto_98526 ?auto_98528 ) ) ( not ( = ?auto_98526 ?auto_98529 ) ) ( not ( = ?auto_98527 ?auto_98528 ) ) ( not ( = ?auto_98527 ?auto_98529 ) ) ( not ( = ?auto_98528 ?auto_98529 ) ) ( CLEAR ?auto_98526 ) ( ON ?auto_98527 ?auto_98528 ) ( CLEAR ?auto_98527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98525 ?auto_98526 ?auto_98527 )
      ( MAKE-4PILE ?auto_98525 ?auto_98526 ?auto_98527 ?auto_98528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98534 - BLOCK
      ?auto_98535 - BLOCK
      ?auto_98536 - BLOCK
      ?auto_98537 - BLOCK
    )
    :vars
    (
      ?auto_98538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98537 ?auto_98538 ) ( ON-TABLE ?auto_98534 ) ( ON ?auto_98535 ?auto_98534 ) ( not ( = ?auto_98534 ?auto_98535 ) ) ( not ( = ?auto_98534 ?auto_98536 ) ) ( not ( = ?auto_98534 ?auto_98537 ) ) ( not ( = ?auto_98534 ?auto_98538 ) ) ( not ( = ?auto_98535 ?auto_98536 ) ) ( not ( = ?auto_98535 ?auto_98537 ) ) ( not ( = ?auto_98535 ?auto_98538 ) ) ( not ( = ?auto_98536 ?auto_98537 ) ) ( not ( = ?auto_98536 ?auto_98538 ) ) ( not ( = ?auto_98537 ?auto_98538 ) ) ( CLEAR ?auto_98535 ) ( ON ?auto_98536 ?auto_98537 ) ( CLEAR ?auto_98536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98534 ?auto_98535 ?auto_98536 )
      ( MAKE-4PILE ?auto_98534 ?auto_98535 ?auto_98536 ?auto_98537 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98543 - BLOCK
      ?auto_98544 - BLOCK
      ?auto_98545 - BLOCK
      ?auto_98546 - BLOCK
    )
    :vars
    (
      ?auto_98547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98546 ?auto_98547 ) ( ON-TABLE ?auto_98543 ) ( not ( = ?auto_98543 ?auto_98544 ) ) ( not ( = ?auto_98543 ?auto_98545 ) ) ( not ( = ?auto_98543 ?auto_98546 ) ) ( not ( = ?auto_98543 ?auto_98547 ) ) ( not ( = ?auto_98544 ?auto_98545 ) ) ( not ( = ?auto_98544 ?auto_98546 ) ) ( not ( = ?auto_98544 ?auto_98547 ) ) ( not ( = ?auto_98545 ?auto_98546 ) ) ( not ( = ?auto_98545 ?auto_98547 ) ) ( not ( = ?auto_98546 ?auto_98547 ) ) ( ON ?auto_98545 ?auto_98546 ) ( CLEAR ?auto_98543 ) ( ON ?auto_98544 ?auto_98545 ) ( CLEAR ?auto_98544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98543 ?auto_98544 )
      ( MAKE-4PILE ?auto_98543 ?auto_98544 ?auto_98545 ?auto_98546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98552 - BLOCK
      ?auto_98553 - BLOCK
      ?auto_98554 - BLOCK
      ?auto_98555 - BLOCK
    )
    :vars
    (
      ?auto_98556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98555 ?auto_98556 ) ( ON-TABLE ?auto_98552 ) ( not ( = ?auto_98552 ?auto_98553 ) ) ( not ( = ?auto_98552 ?auto_98554 ) ) ( not ( = ?auto_98552 ?auto_98555 ) ) ( not ( = ?auto_98552 ?auto_98556 ) ) ( not ( = ?auto_98553 ?auto_98554 ) ) ( not ( = ?auto_98553 ?auto_98555 ) ) ( not ( = ?auto_98553 ?auto_98556 ) ) ( not ( = ?auto_98554 ?auto_98555 ) ) ( not ( = ?auto_98554 ?auto_98556 ) ) ( not ( = ?auto_98555 ?auto_98556 ) ) ( ON ?auto_98554 ?auto_98555 ) ( CLEAR ?auto_98552 ) ( ON ?auto_98553 ?auto_98554 ) ( CLEAR ?auto_98553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98552 ?auto_98553 )
      ( MAKE-4PILE ?auto_98552 ?auto_98553 ?auto_98554 ?auto_98555 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98561 - BLOCK
      ?auto_98562 - BLOCK
      ?auto_98563 - BLOCK
      ?auto_98564 - BLOCK
    )
    :vars
    (
      ?auto_98565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98564 ?auto_98565 ) ( not ( = ?auto_98561 ?auto_98562 ) ) ( not ( = ?auto_98561 ?auto_98563 ) ) ( not ( = ?auto_98561 ?auto_98564 ) ) ( not ( = ?auto_98561 ?auto_98565 ) ) ( not ( = ?auto_98562 ?auto_98563 ) ) ( not ( = ?auto_98562 ?auto_98564 ) ) ( not ( = ?auto_98562 ?auto_98565 ) ) ( not ( = ?auto_98563 ?auto_98564 ) ) ( not ( = ?auto_98563 ?auto_98565 ) ) ( not ( = ?auto_98564 ?auto_98565 ) ) ( ON ?auto_98563 ?auto_98564 ) ( ON ?auto_98562 ?auto_98563 ) ( ON ?auto_98561 ?auto_98562 ) ( CLEAR ?auto_98561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98561 )
      ( MAKE-4PILE ?auto_98561 ?auto_98562 ?auto_98563 ?auto_98564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98570 - BLOCK
      ?auto_98571 - BLOCK
      ?auto_98572 - BLOCK
      ?auto_98573 - BLOCK
    )
    :vars
    (
      ?auto_98574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98573 ?auto_98574 ) ( not ( = ?auto_98570 ?auto_98571 ) ) ( not ( = ?auto_98570 ?auto_98572 ) ) ( not ( = ?auto_98570 ?auto_98573 ) ) ( not ( = ?auto_98570 ?auto_98574 ) ) ( not ( = ?auto_98571 ?auto_98572 ) ) ( not ( = ?auto_98571 ?auto_98573 ) ) ( not ( = ?auto_98571 ?auto_98574 ) ) ( not ( = ?auto_98572 ?auto_98573 ) ) ( not ( = ?auto_98572 ?auto_98574 ) ) ( not ( = ?auto_98573 ?auto_98574 ) ) ( ON ?auto_98572 ?auto_98573 ) ( ON ?auto_98571 ?auto_98572 ) ( ON ?auto_98570 ?auto_98571 ) ( CLEAR ?auto_98570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98570 )
      ( MAKE-4PILE ?auto_98570 ?auto_98571 ?auto_98572 ?auto_98573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98580 - BLOCK
      ?auto_98581 - BLOCK
      ?auto_98582 - BLOCK
      ?auto_98583 - BLOCK
      ?auto_98584 - BLOCK
    )
    :vars
    (
      ?auto_98585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98583 ) ( ON ?auto_98584 ?auto_98585 ) ( CLEAR ?auto_98584 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98580 ) ( ON ?auto_98581 ?auto_98580 ) ( ON ?auto_98582 ?auto_98581 ) ( ON ?auto_98583 ?auto_98582 ) ( not ( = ?auto_98580 ?auto_98581 ) ) ( not ( = ?auto_98580 ?auto_98582 ) ) ( not ( = ?auto_98580 ?auto_98583 ) ) ( not ( = ?auto_98580 ?auto_98584 ) ) ( not ( = ?auto_98580 ?auto_98585 ) ) ( not ( = ?auto_98581 ?auto_98582 ) ) ( not ( = ?auto_98581 ?auto_98583 ) ) ( not ( = ?auto_98581 ?auto_98584 ) ) ( not ( = ?auto_98581 ?auto_98585 ) ) ( not ( = ?auto_98582 ?auto_98583 ) ) ( not ( = ?auto_98582 ?auto_98584 ) ) ( not ( = ?auto_98582 ?auto_98585 ) ) ( not ( = ?auto_98583 ?auto_98584 ) ) ( not ( = ?auto_98583 ?auto_98585 ) ) ( not ( = ?auto_98584 ?auto_98585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98584 ?auto_98585 )
      ( !STACK ?auto_98584 ?auto_98583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98591 - BLOCK
      ?auto_98592 - BLOCK
      ?auto_98593 - BLOCK
      ?auto_98594 - BLOCK
      ?auto_98595 - BLOCK
    )
    :vars
    (
      ?auto_98596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98594 ) ( ON ?auto_98595 ?auto_98596 ) ( CLEAR ?auto_98595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98591 ) ( ON ?auto_98592 ?auto_98591 ) ( ON ?auto_98593 ?auto_98592 ) ( ON ?auto_98594 ?auto_98593 ) ( not ( = ?auto_98591 ?auto_98592 ) ) ( not ( = ?auto_98591 ?auto_98593 ) ) ( not ( = ?auto_98591 ?auto_98594 ) ) ( not ( = ?auto_98591 ?auto_98595 ) ) ( not ( = ?auto_98591 ?auto_98596 ) ) ( not ( = ?auto_98592 ?auto_98593 ) ) ( not ( = ?auto_98592 ?auto_98594 ) ) ( not ( = ?auto_98592 ?auto_98595 ) ) ( not ( = ?auto_98592 ?auto_98596 ) ) ( not ( = ?auto_98593 ?auto_98594 ) ) ( not ( = ?auto_98593 ?auto_98595 ) ) ( not ( = ?auto_98593 ?auto_98596 ) ) ( not ( = ?auto_98594 ?auto_98595 ) ) ( not ( = ?auto_98594 ?auto_98596 ) ) ( not ( = ?auto_98595 ?auto_98596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98595 ?auto_98596 )
      ( !STACK ?auto_98595 ?auto_98594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98602 - BLOCK
      ?auto_98603 - BLOCK
      ?auto_98604 - BLOCK
      ?auto_98605 - BLOCK
      ?auto_98606 - BLOCK
    )
    :vars
    (
      ?auto_98607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98606 ?auto_98607 ) ( ON-TABLE ?auto_98602 ) ( ON ?auto_98603 ?auto_98602 ) ( ON ?auto_98604 ?auto_98603 ) ( not ( = ?auto_98602 ?auto_98603 ) ) ( not ( = ?auto_98602 ?auto_98604 ) ) ( not ( = ?auto_98602 ?auto_98605 ) ) ( not ( = ?auto_98602 ?auto_98606 ) ) ( not ( = ?auto_98602 ?auto_98607 ) ) ( not ( = ?auto_98603 ?auto_98604 ) ) ( not ( = ?auto_98603 ?auto_98605 ) ) ( not ( = ?auto_98603 ?auto_98606 ) ) ( not ( = ?auto_98603 ?auto_98607 ) ) ( not ( = ?auto_98604 ?auto_98605 ) ) ( not ( = ?auto_98604 ?auto_98606 ) ) ( not ( = ?auto_98604 ?auto_98607 ) ) ( not ( = ?auto_98605 ?auto_98606 ) ) ( not ( = ?auto_98605 ?auto_98607 ) ) ( not ( = ?auto_98606 ?auto_98607 ) ) ( CLEAR ?auto_98604 ) ( ON ?auto_98605 ?auto_98606 ) ( CLEAR ?auto_98605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98602 ?auto_98603 ?auto_98604 ?auto_98605 )
      ( MAKE-5PILE ?auto_98602 ?auto_98603 ?auto_98604 ?auto_98605 ?auto_98606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98613 - BLOCK
      ?auto_98614 - BLOCK
      ?auto_98615 - BLOCK
      ?auto_98616 - BLOCK
      ?auto_98617 - BLOCK
    )
    :vars
    (
      ?auto_98618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98617 ?auto_98618 ) ( ON-TABLE ?auto_98613 ) ( ON ?auto_98614 ?auto_98613 ) ( ON ?auto_98615 ?auto_98614 ) ( not ( = ?auto_98613 ?auto_98614 ) ) ( not ( = ?auto_98613 ?auto_98615 ) ) ( not ( = ?auto_98613 ?auto_98616 ) ) ( not ( = ?auto_98613 ?auto_98617 ) ) ( not ( = ?auto_98613 ?auto_98618 ) ) ( not ( = ?auto_98614 ?auto_98615 ) ) ( not ( = ?auto_98614 ?auto_98616 ) ) ( not ( = ?auto_98614 ?auto_98617 ) ) ( not ( = ?auto_98614 ?auto_98618 ) ) ( not ( = ?auto_98615 ?auto_98616 ) ) ( not ( = ?auto_98615 ?auto_98617 ) ) ( not ( = ?auto_98615 ?auto_98618 ) ) ( not ( = ?auto_98616 ?auto_98617 ) ) ( not ( = ?auto_98616 ?auto_98618 ) ) ( not ( = ?auto_98617 ?auto_98618 ) ) ( CLEAR ?auto_98615 ) ( ON ?auto_98616 ?auto_98617 ) ( CLEAR ?auto_98616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98613 ?auto_98614 ?auto_98615 ?auto_98616 )
      ( MAKE-5PILE ?auto_98613 ?auto_98614 ?auto_98615 ?auto_98616 ?auto_98617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98624 - BLOCK
      ?auto_98625 - BLOCK
      ?auto_98626 - BLOCK
      ?auto_98627 - BLOCK
      ?auto_98628 - BLOCK
    )
    :vars
    (
      ?auto_98629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98628 ?auto_98629 ) ( ON-TABLE ?auto_98624 ) ( ON ?auto_98625 ?auto_98624 ) ( not ( = ?auto_98624 ?auto_98625 ) ) ( not ( = ?auto_98624 ?auto_98626 ) ) ( not ( = ?auto_98624 ?auto_98627 ) ) ( not ( = ?auto_98624 ?auto_98628 ) ) ( not ( = ?auto_98624 ?auto_98629 ) ) ( not ( = ?auto_98625 ?auto_98626 ) ) ( not ( = ?auto_98625 ?auto_98627 ) ) ( not ( = ?auto_98625 ?auto_98628 ) ) ( not ( = ?auto_98625 ?auto_98629 ) ) ( not ( = ?auto_98626 ?auto_98627 ) ) ( not ( = ?auto_98626 ?auto_98628 ) ) ( not ( = ?auto_98626 ?auto_98629 ) ) ( not ( = ?auto_98627 ?auto_98628 ) ) ( not ( = ?auto_98627 ?auto_98629 ) ) ( not ( = ?auto_98628 ?auto_98629 ) ) ( ON ?auto_98627 ?auto_98628 ) ( CLEAR ?auto_98625 ) ( ON ?auto_98626 ?auto_98627 ) ( CLEAR ?auto_98626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98624 ?auto_98625 ?auto_98626 )
      ( MAKE-5PILE ?auto_98624 ?auto_98625 ?auto_98626 ?auto_98627 ?auto_98628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98635 - BLOCK
      ?auto_98636 - BLOCK
      ?auto_98637 - BLOCK
      ?auto_98638 - BLOCK
      ?auto_98639 - BLOCK
    )
    :vars
    (
      ?auto_98640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98639 ?auto_98640 ) ( ON-TABLE ?auto_98635 ) ( ON ?auto_98636 ?auto_98635 ) ( not ( = ?auto_98635 ?auto_98636 ) ) ( not ( = ?auto_98635 ?auto_98637 ) ) ( not ( = ?auto_98635 ?auto_98638 ) ) ( not ( = ?auto_98635 ?auto_98639 ) ) ( not ( = ?auto_98635 ?auto_98640 ) ) ( not ( = ?auto_98636 ?auto_98637 ) ) ( not ( = ?auto_98636 ?auto_98638 ) ) ( not ( = ?auto_98636 ?auto_98639 ) ) ( not ( = ?auto_98636 ?auto_98640 ) ) ( not ( = ?auto_98637 ?auto_98638 ) ) ( not ( = ?auto_98637 ?auto_98639 ) ) ( not ( = ?auto_98637 ?auto_98640 ) ) ( not ( = ?auto_98638 ?auto_98639 ) ) ( not ( = ?auto_98638 ?auto_98640 ) ) ( not ( = ?auto_98639 ?auto_98640 ) ) ( ON ?auto_98638 ?auto_98639 ) ( CLEAR ?auto_98636 ) ( ON ?auto_98637 ?auto_98638 ) ( CLEAR ?auto_98637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98635 ?auto_98636 ?auto_98637 )
      ( MAKE-5PILE ?auto_98635 ?auto_98636 ?auto_98637 ?auto_98638 ?auto_98639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98646 - BLOCK
      ?auto_98647 - BLOCK
      ?auto_98648 - BLOCK
      ?auto_98649 - BLOCK
      ?auto_98650 - BLOCK
    )
    :vars
    (
      ?auto_98651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98650 ?auto_98651 ) ( ON-TABLE ?auto_98646 ) ( not ( = ?auto_98646 ?auto_98647 ) ) ( not ( = ?auto_98646 ?auto_98648 ) ) ( not ( = ?auto_98646 ?auto_98649 ) ) ( not ( = ?auto_98646 ?auto_98650 ) ) ( not ( = ?auto_98646 ?auto_98651 ) ) ( not ( = ?auto_98647 ?auto_98648 ) ) ( not ( = ?auto_98647 ?auto_98649 ) ) ( not ( = ?auto_98647 ?auto_98650 ) ) ( not ( = ?auto_98647 ?auto_98651 ) ) ( not ( = ?auto_98648 ?auto_98649 ) ) ( not ( = ?auto_98648 ?auto_98650 ) ) ( not ( = ?auto_98648 ?auto_98651 ) ) ( not ( = ?auto_98649 ?auto_98650 ) ) ( not ( = ?auto_98649 ?auto_98651 ) ) ( not ( = ?auto_98650 ?auto_98651 ) ) ( ON ?auto_98649 ?auto_98650 ) ( ON ?auto_98648 ?auto_98649 ) ( CLEAR ?auto_98646 ) ( ON ?auto_98647 ?auto_98648 ) ( CLEAR ?auto_98647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98646 ?auto_98647 )
      ( MAKE-5PILE ?auto_98646 ?auto_98647 ?auto_98648 ?auto_98649 ?auto_98650 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98657 - BLOCK
      ?auto_98658 - BLOCK
      ?auto_98659 - BLOCK
      ?auto_98660 - BLOCK
      ?auto_98661 - BLOCK
    )
    :vars
    (
      ?auto_98662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98661 ?auto_98662 ) ( ON-TABLE ?auto_98657 ) ( not ( = ?auto_98657 ?auto_98658 ) ) ( not ( = ?auto_98657 ?auto_98659 ) ) ( not ( = ?auto_98657 ?auto_98660 ) ) ( not ( = ?auto_98657 ?auto_98661 ) ) ( not ( = ?auto_98657 ?auto_98662 ) ) ( not ( = ?auto_98658 ?auto_98659 ) ) ( not ( = ?auto_98658 ?auto_98660 ) ) ( not ( = ?auto_98658 ?auto_98661 ) ) ( not ( = ?auto_98658 ?auto_98662 ) ) ( not ( = ?auto_98659 ?auto_98660 ) ) ( not ( = ?auto_98659 ?auto_98661 ) ) ( not ( = ?auto_98659 ?auto_98662 ) ) ( not ( = ?auto_98660 ?auto_98661 ) ) ( not ( = ?auto_98660 ?auto_98662 ) ) ( not ( = ?auto_98661 ?auto_98662 ) ) ( ON ?auto_98660 ?auto_98661 ) ( ON ?auto_98659 ?auto_98660 ) ( CLEAR ?auto_98657 ) ( ON ?auto_98658 ?auto_98659 ) ( CLEAR ?auto_98658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98657 ?auto_98658 )
      ( MAKE-5PILE ?auto_98657 ?auto_98658 ?auto_98659 ?auto_98660 ?auto_98661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98668 - BLOCK
      ?auto_98669 - BLOCK
      ?auto_98670 - BLOCK
      ?auto_98671 - BLOCK
      ?auto_98672 - BLOCK
    )
    :vars
    (
      ?auto_98673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98672 ?auto_98673 ) ( not ( = ?auto_98668 ?auto_98669 ) ) ( not ( = ?auto_98668 ?auto_98670 ) ) ( not ( = ?auto_98668 ?auto_98671 ) ) ( not ( = ?auto_98668 ?auto_98672 ) ) ( not ( = ?auto_98668 ?auto_98673 ) ) ( not ( = ?auto_98669 ?auto_98670 ) ) ( not ( = ?auto_98669 ?auto_98671 ) ) ( not ( = ?auto_98669 ?auto_98672 ) ) ( not ( = ?auto_98669 ?auto_98673 ) ) ( not ( = ?auto_98670 ?auto_98671 ) ) ( not ( = ?auto_98670 ?auto_98672 ) ) ( not ( = ?auto_98670 ?auto_98673 ) ) ( not ( = ?auto_98671 ?auto_98672 ) ) ( not ( = ?auto_98671 ?auto_98673 ) ) ( not ( = ?auto_98672 ?auto_98673 ) ) ( ON ?auto_98671 ?auto_98672 ) ( ON ?auto_98670 ?auto_98671 ) ( ON ?auto_98669 ?auto_98670 ) ( ON ?auto_98668 ?auto_98669 ) ( CLEAR ?auto_98668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98668 )
      ( MAKE-5PILE ?auto_98668 ?auto_98669 ?auto_98670 ?auto_98671 ?auto_98672 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98679 - BLOCK
      ?auto_98680 - BLOCK
      ?auto_98681 - BLOCK
      ?auto_98682 - BLOCK
      ?auto_98683 - BLOCK
    )
    :vars
    (
      ?auto_98684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98683 ?auto_98684 ) ( not ( = ?auto_98679 ?auto_98680 ) ) ( not ( = ?auto_98679 ?auto_98681 ) ) ( not ( = ?auto_98679 ?auto_98682 ) ) ( not ( = ?auto_98679 ?auto_98683 ) ) ( not ( = ?auto_98679 ?auto_98684 ) ) ( not ( = ?auto_98680 ?auto_98681 ) ) ( not ( = ?auto_98680 ?auto_98682 ) ) ( not ( = ?auto_98680 ?auto_98683 ) ) ( not ( = ?auto_98680 ?auto_98684 ) ) ( not ( = ?auto_98681 ?auto_98682 ) ) ( not ( = ?auto_98681 ?auto_98683 ) ) ( not ( = ?auto_98681 ?auto_98684 ) ) ( not ( = ?auto_98682 ?auto_98683 ) ) ( not ( = ?auto_98682 ?auto_98684 ) ) ( not ( = ?auto_98683 ?auto_98684 ) ) ( ON ?auto_98682 ?auto_98683 ) ( ON ?auto_98681 ?auto_98682 ) ( ON ?auto_98680 ?auto_98681 ) ( ON ?auto_98679 ?auto_98680 ) ( CLEAR ?auto_98679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98679 )
      ( MAKE-5PILE ?auto_98679 ?auto_98680 ?auto_98681 ?auto_98682 ?auto_98683 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98691 - BLOCK
      ?auto_98692 - BLOCK
      ?auto_98693 - BLOCK
      ?auto_98694 - BLOCK
      ?auto_98695 - BLOCK
      ?auto_98696 - BLOCK
    )
    :vars
    (
      ?auto_98697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98695 ) ( ON ?auto_98696 ?auto_98697 ) ( CLEAR ?auto_98696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98691 ) ( ON ?auto_98692 ?auto_98691 ) ( ON ?auto_98693 ?auto_98692 ) ( ON ?auto_98694 ?auto_98693 ) ( ON ?auto_98695 ?auto_98694 ) ( not ( = ?auto_98691 ?auto_98692 ) ) ( not ( = ?auto_98691 ?auto_98693 ) ) ( not ( = ?auto_98691 ?auto_98694 ) ) ( not ( = ?auto_98691 ?auto_98695 ) ) ( not ( = ?auto_98691 ?auto_98696 ) ) ( not ( = ?auto_98691 ?auto_98697 ) ) ( not ( = ?auto_98692 ?auto_98693 ) ) ( not ( = ?auto_98692 ?auto_98694 ) ) ( not ( = ?auto_98692 ?auto_98695 ) ) ( not ( = ?auto_98692 ?auto_98696 ) ) ( not ( = ?auto_98692 ?auto_98697 ) ) ( not ( = ?auto_98693 ?auto_98694 ) ) ( not ( = ?auto_98693 ?auto_98695 ) ) ( not ( = ?auto_98693 ?auto_98696 ) ) ( not ( = ?auto_98693 ?auto_98697 ) ) ( not ( = ?auto_98694 ?auto_98695 ) ) ( not ( = ?auto_98694 ?auto_98696 ) ) ( not ( = ?auto_98694 ?auto_98697 ) ) ( not ( = ?auto_98695 ?auto_98696 ) ) ( not ( = ?auto_98695 ?auto_98697 ) ) ( not ( = ?auto_98696 ?auto_98697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98696 ?auto_98697 )
      ( !STACK ?auto_98696 ?auto_98695 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98704 - BLOCK
      ?auto_98705 - BLOCK
      ?auto_98706 - BLOCK
      ?auto_98707 - BLOCK
      ?auto_98708 - BLOCK
      ?auto_98709 - BLOCK
    )
    :vars
    (
      ?auto_98710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98708 ) ( ON ?auto_98709 ?auto_98710 ) ( CLEAR ?auto_98709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98704 ) ( ON ?auto_98705 ?auto_98704 ) ( ON ?auto_98706 ?auto_98705 ) ( ON ?auto_98707 ?auto_98706 ) ( ON ?auto_98708 ?auto_98707 ) ( not ( = ?auto_98704 ?auto_98705 ) ) ( not ( = ?auto_98704 ?auto_98706 ) ) ( not ( = ?auto_98704 ?auto_98707 ) ) ( not ( = ?auto_98704 ?auto_98708 ) ) ( not ( = ?auto_98704 ?auto_98709 ) ) ( not ( = ?auto_98704 ?auto_98710 ) ) ( not ( = ?auto_98705 ?auto_98706 ) ) ( not ( = ?auto_98705 ?auto_98707 ) ) ( not ( = ?auto_98705 ?auto_98708 ) ) ( not ( = ?auto_98705 ?auto_98709 ) ) ( not ( = ?auto_98705 ?auto_98710 ) ) ( not ( = ?auto_98706 ?auto_98707 ) ) ( not ( = ?auto_98706 ?auto_98708 ) ) ( not ( = ?auto_98706 ?auto_98709 ) ) ( not ( = ?auto_98706 ?auto_98710 ) ) ( not ( = ?auto_98707 ?auto_98708 ) ) ( not ( = ?auto_98707 ?auto_98709 ) ) ( not ( = ?auto_98707 ?auto_98710 ) ) ( not ( = ?auto_98708 ?auto_98709 ) ) ( not ( = ?auto_98708 ?auto_98710 ) ) ( not ( = ?auto_98709 ?auto_98710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98709 ?auto_98710 )
      ( !STACK ?auto_98709 ?auto_98708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98717 - BLOCK
      ?auto_98718 - BLOCK
      ?auto_98719 - BLOCK
      ?auto_98720 - BLOCK
      ?auto_98721 - BLOCK
      ?auto_98722 - BLOCK
    )
    :vars
    (
      ?auto_98723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98722 ?auto_98723 ) ( ON-TABLE ?auto_98717 ) ( ON ?auto_98718 ?auto_98717 ) ( ON ?auto_98719 ?auto_98718 ) ( ON ?auto_98720 ?auto_98719 ) ( not ( = ?auto_98717 ?auto_98718 ) ) ( not ( = ?auto_98717 ?auto_98719 ) ) ( not ( = ?auto_98717 ?auto_98720 ) ) ( not ( = ?auto_98717 ?auto_98721 ) ) ( not ( = ?auto_98717 ?auto_98722 ) ) ( not ( = ?auto_98717 ?auto_98723 ) ) ( not ( = ?auto_98718 ?auto_98719 ) ) ( not ( = ?auto_98718 ?auto_98720 ) ) ( not ( = ?auto_98718 ?auto_98721 ) ) ( not ( = ?auto_98718 ?auto_98722 ) ) ( not ( = ?auto_98718 ?auto_98723 ) ) ( not ( = ?auto_98719 ?auto_98720 ) ) ( not ( = ?auto_98719 ?auto_98721 ) ) ( not ( = ?auto_98719 ?auto_98722 ) ) ( not ( = ?auto_98719 ?auto_98723 ) ) ( not ( = ?auto_98720 ?auto_98721 ) ) ( not ( = ?auto_98720 ?auto_98722 ) ) ( not ( = ?auto_98720 ?auto_98723 ) ) ( not ( = ?auto_98721 ?auto_98722 ) ) ( not ( = ?auto_98721 ?auto_98723 ) ) ( not ( = ?auto_98722 ?auto_98723 ) ) ( CLEAR ?auto_98720 ) ( ON ?auto_98721 ?auto_98722 ) ( CLEAR ?auto_98721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98717 ?auto_98718 ?auto_98719 ?auto_98720 ?auto_98721 )
      ( MAKE-6PILE ?auto_98717 ?auto_98718 ?auto_98719 ?auto_98720 ?auto_98721 ?auto_98722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98730 - BLOCK
      ?auto_98731 - BLOCK
      ?auto_98732 - BLOCK
      ?auto_98733 - BLOCK
      ?auto_98734 - BLOCK
      ?auto_98735 - BLOCK
    )
    :vars
    (
      ?auto_98736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98735 ?auto_98736 ) ( ON-TABLE ?auto_98730 ) ( ON ?auto_98731 ?auto_98730 ) ( ON ?auto_98732 ?auto_98731 ) ( ON ?auto_98733 ?auto_98732 ) ( not ( = ?auto_98730 ?auto_98731 ) ) ( not ( = ?auto_98730 ?auto_98732 ) ) ( not ( = ?auto_98730 ?auto_98733 ) ) ( not ( = ?auto_98730 ?auto_98734 ) ) ( not ( = ?auto_98730 ?auto_98735 ) ) ( not ( = ?auto_98730 ?auto_98736 ) ) ( not ( = ?auto_98731 ?auto_98732 ) ) ( not ( = ?auto_98731 ?auto_98733 ) ) ( not ( = ?auto_98731 ?auto_98734 ) ) ( not ( = ?auto_98731 ?auto_98735 ) ) ( not ( = ?auto_98731 ?auto_98736 ) ) ( not ( = ?auto_98732 ?auto_98733 ) ) ( not ( = ?auto_98732 ?auto_98734 ) ) ( not ( = ?auto_98732 ?auto_98735 ) ) ( not ( = ?auto_98732 ?auto_98736 ) ) ( not ( = ?auto_98733 ?auto_98734 ) ) ( not ( = ?auto_98733 ?auto_98735 ) ) ( not ( = ?auto_98733 ?auto_98736 ) ) ( not ( = ?auto_98734 ?auto_98735 ) ) ( not ( = ?auto_98734 ?auto_98736 ) ) ( not ( = ?auto_98735 ?auto_98736 ) ) ( CLEAR ?auto_98733 ) ( ON ?auto_98734 ?auto_98735 ) ( CLEAR ?auto_98734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98730 ?auto_98731 ?auto_98732 ?auto_98733 ?auto_98734 )
      ( MAKE-6PILE ?auto_98730 ?auto_98731 ?auto_98732 ?auto_98733 ?auto_98734 ?auto_98735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98743 - BLOCK
      ?auto_98744 - BLOCK
      ?auto_98745 - BLOCK
      ?auto_98746 - BLOCK
      ?auto_98747 - BLOCK
      ?auto_98748 - BLOCK
    )
    :vars
    (
      ?auto_98749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98748 ?auto_98749 ) ( ON-TABLE ?auto_98743 ) ( ON ?auto_98744 ?auto_98743 ) ( ON ?auto_98745 ?auto_98744 ) ( not ( = ?auto_98743 ?auto_98744 ) ) ( not ( = ?auto_98743 ?auto_98745 ) ) ( not ( = ?auto_98743 ?auto_98746 ) ) ( not ( = ?auto_98743 ?auto_98747 ) ) ( not ( = ?auto_98743 ?auto_98748 ) ) ( not ( = ?auto_98743 ?auto_98749 ) ) ( not ( = ?auto_98744 ?auto_98745 ) ) ( not ( = ?auto_98744 ?auto_98746 ) ) ( not ( = ?auto_98744 ?auto_98747 ) ) ( not ( = ?auto_98744 ?auto_98748 ) ) ( not ( = ?auto_98744 ?auto_98749 ) ) ( not ( = ?auto_98745 ?auto_98746 ) ) ( not ( = ?auto_98745 ?auto_98747 ) ) ( not ( = ?auto_98745 ?auto_98748 ) ) ( not ( = ?auto_98745 ?auto_98749 ) ) ( not ( = ?auto_98746 ?auto_98747 ) ) ( not ( = ?auto_98746 ?auto_98748 ) ) ( not ( = ?auto_98746 ?auto_98749 ) ) ( not ( = ?auto_98747 ?auto_98748 ) ) ( not ( = ?auto_98747 ?auto_98749 ) ) ( not ( = ?auto_98748 ?auto_98749 ) ) ( ON ?auto_98747 ?auto_98748 ) ( CLEAR ?auto_98745 ) ( ON ?auto_98746 ?auto_98747 ) ( CLEAR ?auto_98746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98743 ?auto_98744 ?auto_98745 ?auto_98746 )
      ( MAKE-6PILE ?auto_98743 ?auto_98744 ?auto_98745 ?auto_98746 ?auto_98747 ?auto_98748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98756 - BLOCK
      ?auto_98757 - BLOCK
      ?auto_98758 - BLOCK
      ?auto_98759 - BLOCK
      ?auto_98760 - BLOCK
      ?auto_98761 - BLOCK
    )
    :vars
    (
      ?auto_98762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98761 ?auto_98762 ) ( ON-TABLE ?auto_98756 ) ( ON ?auto_98757 ?auto_98756 ) ( ON ?auto_98758 ?auto_98757 ) ( not ( = ?auto_98756 ?auto_98757 ) ) ( not ( = ?auto_98756 ?auto_98758 ) ) ( not ( = ?auto_98756 ?auto_98759 ) ) ( not ( = ?auto_98756 ?auto_98760 ) ) ( not ( = ?auto_98756 ?auto_98761 ) ) ( not ( = ?auto_98756 ?auto_98762 ) ) ( not ( = ?auto_98757 ?auto_98758 ) ) ( not ( = ?auto_98757 ?auto_98759 ) ) ( not ( = ?auto_98757 ?auto_98760 ) ) ( not ( = ?auto_98757 ?auto_98761 ) ) ( not ( = ?auto_98757 ?auto_98762 ) ) ( not ( = ?auto_98758 ?auto_98759 ) ) ( not ( = ?auto_98758 ?auto_98760 ) ) ( not ( = ?auto_98758 ?auto_98761 ) ) ( not ( = ?auto_98758 ?auto_98762 ) ) ( not ( = ?auto_98759 ?auto_98760 ) ) ( not ( = ?auto_98759 ?auto_98761 ) ) ( not ( = ?auto_98759 ?auto_98762 ) ) ( not ( = ?auto_98760 ?auto_98761 ) ) ( not ( = ?auto_98760 ?auto_98762 ) ) ( not ( = ?auto_98761 ?auto_98762 ) ) ( ON ?auto_98760 ?auto_98761 ) ( CLEAR ?auto_98758 ) ( ON ?auto_98759 ?auto_98760 ) ( CLEAR ?auto_98759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98756 ?auto_98757 ?auto_98758 ?auto_98759 )
      ( MAKE-6PILE ?auto_98756 ?auto_98757 ?auto_98758 ?auto_98759 ?auto_98760 ?auto_98761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98769 - BLOCK
      ?auto_98770 - BLOCK
      ?auto_98771 - BLOCK
      ?auto_98772 - BLOCK
      ?auto_98773 - BLOCK
      ?auto_98774 - BLOCK
    )
    :vars
    (
      ?auto_98775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98774 ?auto_98775 ) ( ON-TABLE ?auto_98769 ) ( ON ?auto_98770 ?auto_98769 ) ( not ( = ?auto_98769 ?auto_98770 ) ) ( not ( = ?auto_98769 ?auto_98771 ) ) ( not ( = ?auto_98769 ?auto_98772 ) ) ( not ( = ?auto_98769 ?auto_98773 ) ) ( not ( = ?auto_98769 ?auto_98774 ) ) ( not ( = ?auto_98769 ?auto_98775 ) ) ( not ( = ?auto_98770 ?auto_98771 ) ) ( not ( = ?auto_98770 ?auto_98772 ) ) ( not ( = ?auto_98770 ?auto_98773 ) ) ( not ( = ?auto_98770 ?auto_98774 ) ) ( not ( = ?auto_98770 ?auto_98775 ) ) ( not ( = ?auto_98771 ?auto_98772 ) ) ( not ( = ?auto_98771 ?auto_98773 ) ) ( not ( = ?auto_98771 ?auto_98774 ) ) ( not ( = ?auto_98771 ?auto_98775 ) ) ( not ( = ?auto_98772 ?auto_98773 ) ) ( not ( = ?auto_98772 ?auto_98774 ) ) ( not ( = ?auto_98772 ?auto_98775 ) ) ( not ( = ?auto_98773 ?auto_98774 ) ) ( not ( = ?auto_98773 ?auto_98775 ) ) ( not ( = ?auto_98774 ?auto_98775 ) ) ( ON ?auto_98773 ?auto_98774 ) ( ON ?auto_98772 ?auto_98773 ) ( CLEAR ?auto_98770 ) ( ON ?auto_98771 ?auto_98772 ) ( CLEAR ?auto_98771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98769 ?auto_98770 ?auto_98771 )
      ( MAKE-6PILE ?auto_98769 ?auto_98770 ?auto_98771 ?auto_98772 ?auto_98773 ?auto_98774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98782 - BLOCK
      ?auto_98783 - BLOCK
      ?auto_98784 - BLOCK
      ?auto_98785 - BLOCK
      ?auto_98786 - BLOCK
      ?auto_98787 - BLOCK
    )
    :vars
    (
      ?auto_98788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98787 ?auto_98788 ) ( ON-TABLE ?auto_98782 ) ( ON ?auto_98783 ?auto_98782 ) ( not ( = ?auto_98782 ?auto_98783 ) ) ( not ( = ?auto_98782 ?auto_98784 ) ) ( not ( = ?auto_98782 ?auto_98785 ) ) ( not ( = ?auto_98782 ?auto_98786 ) ) ( not ( = ?auto_98782 ?auto_98787 ) ) ( not ( = ?auto_98782 ?auto_98788 ) ) ( not ( = ?auto_98783 ?auto_98784 ) ) ( not ( = ?auto_98783 ?auto_98785 ) ) ( not ( = ?auto_98783 ?auto_98786 ) ) ( not ( = ?auto_98783 ?auto_98787 ) ) ( not ( = ?auto_98783 ?auto_98788 ) ) ( not ( = ?auto_98784 ?auto_98785 ) ) ( not ( = ?auto_98784 ?auto_98786 ) ) ( not ( = ?auto_98784 ?auto_98787 ) ) ( not ( = ?auto_98784 ?auto_98788 ) ) ( not ( = ?auto_98785 ?auto_98786 ) ) ( not ( = ?auto_98785 ?auto_98787 ) ) ( not ( = ?auto_98785 ?auto_98788 ) ) ( not ( = ?auto_98786 ?auto_98787 ) ) ( not ( = ?auto_98786 ?auto_98788 ) ) ( not ( = ?auto_98787 ?auto_98788 ) ) ( ON ?auto_98786 ?auto_98787 ) ( ON ?auto_98785 ?auto_98786 ) ( CLEAR ?auto_98783 ) ( ON ?auto_98784 ?auto_98785 ) ( CLEAR ?auto_98784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98782 ?auto_98783 ?auto_98784 )
      ( MAKE-6PILE ?auto_98782 ?auto_98783 ?auto_98784 ?auto_98785 ?auto_98786 ?auto_98787 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98795 - BLOCK
      ?auto_98796 - BLOCK
      ?auto_98797 - BLOCK
      ?auto_98798 - BLOCK
      ?auto_98799 - BLOCK
      ?auto_98800 - BLOCK
    )
    :vars
    (
      ?auto_98801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98800 ?auto_98801 ) ( ON-TABLE ?auto_98795 ) ( not ( = ?auto_98795 ?auto_98796 ) ) ( not ( = ?auto_98795 ?auto_98797 ) ) ( not ( = ?auto_98795 ?auto_98798 ) ) ( not ( = ?auto_98795 ?auto_98799 ) ) ( not ( = ?auto_98795 ?auto_98800 ) ) ( not ( = ?auto_98795 ?auto_98801 ) ) ( not ( = ?auto_98796 ?auto_98797 ) ) ( not ( = ?auto_98796 ?auto_98798 ) ) ( not ( = ?auto_98796 ?auto_98799 ) ) ( not ( = ?auto_98796 ?auto_98800 ) ) ( not ( = ?auto_98796 ?auto_98801 ) ) ( not ( = ?auto_98797 ?auto_98798 ) ) ( not ( = ?auto_98797 ?auto_98799 ) ) ( not ( = ?auto_98797 ?auto_98800 ) ) ( not ( = ?auto_98797 ?auto_98801 ) ) ( not ( = ?auto_98798 ?auto_98799 ) ) ( not ( = ?auto_98798 ?auto_98800 ) ) ( not ( = ?auto_98798 ?auto_98801 ) ) ( not ( = ?auto_98799 ?auto_98800 ) ) ( not ( = ?auto_98799 ?auto_98801 ) ) ( not ( = ?auto_98800 ?auto_98801 ) ) ( ON ?auto_98799 ?auto_98800 ) ( ON ?auto_98798 ?auto_98799 ) ( ON ?auto_98797 ?auto_98798 ) ( CLEAR ?auto_98795 ) ( ON ?auto_98796 ?auto_98797 ) ( CLEAR ?auto_98796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98795 ?auto_98796 )
      ( MAKE-6PILE ?auto_98795 ?auto_98796 ?auto_98797 ?auto_98798 ?auto_98799 ?auto_98800 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98808 - BLOCK
      ?auto_98809 - BLOCK
      ?auto_98810 - BLOCK
      ?auto_98811 - BLOCK
      ?auto_98812 - BLOCK
      ?auto_98813 - BLOCK
    )
    :vars
    (
      ?auto_98814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98813 ?auto_98814 ) ( ON-TABLE ?auto_98808 ) ( not ( = ?auto_98808 ?auto_98809 ) ) ( not ( = ?auto_98808 ?auto_98810 ) ) ( not ( = ?auto_98808 ?auto_98811 ) ) ( not ( = ?auto_98808 ?auto_98812 ) ) ( not ( = ?auto_98808 ?auto_98813 ) ) ( not ( = ?auto_98808 ?auto_98814 ) ) ( not ( = ?auto_98809 ?auto_98810 ) ) ( not ( = ?auto_98809 ?auto_98811 ) ) ( not ( = ?auto_98809 ?auto_98812 ) ) ( not ( = ?auto_98809 ?auto_98813 ) ) ( not ( = ?auto_98809 ?auto_98814 ) ) ( not ( = ?auto_98810 ?auto_98811 ) ) ( not ( = ?auto_98810 ?auto_98812 ) ) ( not ( = ?auto_98810 ?auto_98813 ) ) ( not ( = ?auto_98810 ?auto_98814 ) ) ( not ( = ?auto_98811 ?auto_98812 ) ) ( not ( = ?auto_98811 ?auto_98813 ) ) ( not ( = ?auto_98811 ?auto_98814 ) ) ( not ( = ?auto_98812 ?auto_98813 ) ) ( not ( = ?auto_98812 ?auto_98814 ) ) ( not ( = ?auto_98813 ?auto_98814 ) ) ( ON ?auto_98812 ?auto_98813 ) ( ON ?auto_98811 ?auto_98812 ) ( ON ?auto_98810 ?auto_98811 ) ( CLEAR ?auto_98808 ) ( ON ?auto_98809 ?auto_98810 ) ( CLEAR ?auto_98809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98808 ?auto_98809 )
      ( MAKE-6PILE ?auto_98808 ?auto_98809 ?auto_98810 ?auto_98811 ?auto_98812 ?auto_98813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98821 - BLOCK
      ?auto_98822 - BLOCK
      ?auto_98823 - BLOCK
      ?auto_98824 - BLOCK
      ?auto_98825 - BLOCK
      ?auto_98826 - BLOCK
    )
    :vars
    (
      ?auto_98827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98826 ?auto_98827 ) ( not ( = ?auto_98821 ?auto_98822 ) ) ( not ( = ?auto_98821 ?auto_98823 ) ) ( not ( = ?auto_98821 ?auto_98824 ) ) ( not ( = ?auto_98821 ?auto_98825 ) ) ( not ( = ?auto_98821 ?auto_98826 ) ) ( not ( = ?auto_98821 ?auto_98827 ) ) ( not ( = ?auto_98822 ?auto_98823 ) ) ( not ( = ?auto_98822 ?auto_98824 ) ) ( not ( = ?auto_98822 ?auto_98825 ) ) ( not ( = ?auto_98822 ?auto_98826 ) ) ( not ( = ?auto_98822 ?auto_98827 ) ) ( not ( = ?auto_98823 ?auto_98824 ) ) ( not ( = ?auto_98823 ?auto_98825 ) ) ( not ( = ?auto_98823 ?auto_98826 ) ) ( not ( = ?auto_98823 ?auto_98827 ) ) ( not ( = ?auto_98824 ?auto_98825 ) ) ( not ( = ?auto_98824 ?auto_98826 ) ) ( not ( = ?auto_98824 ?auto_98827 ) ) ( not ( = ?auto_98825 ?auto_98826 ) ) ( not ( = ?auto_98825 ?auto_98827 ) ) ( not ( = ?auto_98826 ?auto_98827 ) ) ( ON ?auto_98825 ?auto_98826 ) ( ON ?auto_98824 ?auto_98825 ) ( ON ?auto_98823 ?auto_98824 ) ( ON ?auto_98822 ?auto_98823 ) ( ON ?auto_98821 ?auto_98822 ) ( CLEAR ?auto_98821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98821 )
      ( MAKE-6PILE ?auto_98821 ?auto_98822 ?auto_98823 ?auto_98824 ?auto_98825 ?auto_98826 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98834 - BLOCK
      ?auto_98835 - BLOCK
      ?auto_98836 - BLOCK
      ?auto_98837 - BLOCK
      ?auto_98838 - BLOCK
      ?auto_98839 - BLOCK
    )
    :vars
    (
      ?auto_98840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98839 ?auto_98840 ) ( not ( = ?auto_98834 ?auto_98835 ) ) ( not ( = ?auto_98834 ?auto_98836 ) ) ( not ( = ?auto_98834 ?auto_98837 ) ) ( not ( = ?auto_98834 ?auto_98838 ) ) ( not ( = ?auto_98834 ?auto_98839 ) ) ( not ( = ?auto_98834 ?auto_98840 ) ) ( not ( = ?auto_98835 ?auto_98836 ) ) ( not ( = ?auto_98835 ?auto_98837 ) ) ( not ( = ?auto_98835 ?auto_98838 ) ) ( not ( = ?auto_98835 ?auto_98839 ) ) ( not ( = ?auto_98835 ?auto_98840 ) ) ( not ( = ?auto_98836 ?auto_98837 ) ) ( not ( = ?auto_98836 ?auto_98838 ) ) ( not ( = ?auto_98836 ?auto_98839 ) ) ( not ( = ?auto_98836 ?auto_98840 ) ) ( not ( = ?auto_98837 ?auto_98838 ) ) ( not ( = ?auto_98837 ?auto_98839 ) ) ( not ( = ?auto_98837 ?auto_98840 ) ) ( not ( = ?auto_98838 ?auto_98839 ) ) ( not ( = ?auto_98838 ?auto_98840 ) ) ( not ( = ?auto_98839 ?auto_98840 ) ) ( ON ?auto_98838 ?auto_98839 ) ( ON ?auto_98837 ?auto_98838 ) ( ON ?auto_98836 ?auto_98837 ) ( ON ?auto_98835 ?auto_98836 ) ( ON ?auto_98834 ?auto_98835 ) ( CLEAR ?auto_98834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98834 )
      ( MAKE-6PILE ?auto_98834 ?auto_98835 ?auto_98836 ?auto_98837 ?auto_98838 ?auto_98839 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98848 - BLOCK
      ?auto_98849 - BLOCK
      ?auto_98850 - BLOCK
      ?auto_98851 - BLOCK
      ?auto_98852 - BLOCK
      ?auto_98853 - BLOCK
      ?auto_98854 - BLOCK
    )
    :vars
    (
      ?auto_98855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98853 ) ( ON ?auto_98854 ?auto_98855 ) ( CLEAR ?auto_98854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98848 ) ( ON ?auto_98849 ?auto_98848 ) ( ON ?auto_98850 ?auto_98849 ) ( ON ?auto_98851 ?auto_98850 ) ( ON ?auto_98852 ?auto_98851 ) ( ON ?auto_98853 ?auto_98852 ) ( not ( = ?auto_98848 ?auto_98849 ) ) ( not ( = ?auto_98848 ?auto_98850 ) ) ( not ( = ?auto_98848 ?auto_98851 ) ) ( not ( = ?auto_98848 ?auto_98852 ) ) ( not ( = ?auto_98848 ?auto_98853 ) ) ( not ( = ?auto_98848 ?auto_98854 ) ) ( not ( = ?auto_98848 ?auto_98855 ) ) ( not ( = ?auto_98849 ?auto_98850 ) ) ( not ( = ?auto_98849 ?auto_98851 ) ) ( not ( = ?auto_98849 ?auto_98852 ) ) ( not ( = ?auto_98849 ?auto_98853 ) ) ( not ( = ?auto_98849 ?auto_98854 ) ) ( not ( = ?auto_98849 ?auto_98855 ) ) ( not ( = ?auto_98850 ?auto_98851 ) ) ( not ( = ?auto_98850 ?auto_98852 ) ) ( not ( = ?auto_98850 ?auto_98853 ) ) ( not ( = ?auto_98850 ?auto_98854 ) ) ( not ( = ?auto_98850 ?auto_98855 ) ) ( not ( = ?auto_98851 ?auto_98852 ) ) ( not ( = ?auto_98851 ?auto_98853 ) ) ( not ( = ?auto_98851 ?auto_98854 ) ) ( not ( = ?auto_98851 ?auto_98855 ) ) ( not ( = ?auto_98852 ?auto_98853 ) ) ( not ( = ?auto_98852 ?auto_98854 ) ) ( not ( = ?auto_98852 ?auto_98855 ) ) ( not ( = ?auto_98853 ?auto_98854 ) ) ( not ( = ?auto_98853 ?auto_98855 ) ) ( not ( = ?auto_98854 ?auto_98855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98854 ?auto_98855 )
      ( !STACK ?auto_98854 ?auto_98853 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98863 - BLOCK
      ?auto_98864 - BLOCK
      ?auto_98865 - BLOCK
      ?auto_98866 - BLOCK
      ?auto_98867 - BLOCK
      ?auto_98868 - BLOCK
      ?auto_98869 - BLOCK
    )
    :vars
    (
      ?auto_98870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98868 ) ( ON ?auto_98869 ?auto_98870 ) ( CLEAR ?auto_98869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98863 ) ( ON ?auto_98864 ?auto_98863 ) ( ON ?auto_98865 ?auto_98864 ) ( ON ?auto_98866 ?auto_98865 ) ( ON ?auto_98867 ?auto_98866 ) ( ON ?auto_98868 ?auto_98867 ) ( not ( = ?auto_98863 ?auto_98864 ) ) ( not ( = ?auto_98863 ?auto_98865 ) ) ( not ( = ?auto_98863 ?auto_98866 ) ) ( not ( = ?auto_98863 ?auto_98867 ) ) ( not ( = ?auto_98863 ?auto_98868 ) ) ( not ( = ?auto_98863 ?auto_98869 ) ) ( not ( = ?auto_98863 ?auto_98870 ) ) ( not ( = ?auto_98864 ?auto_98865 ) ) ( not ( = ?auto_98864 ?auto_98866 ) ) ( not ( = ?auto_98864 ?auto_98867 ) ) ( not ( = ?auto_98864 ?auto_98868 ) ) ( not ( = ?auto_98864 ?auto_98869 ) ) ( not ( = ?auto_98864 ?auto_98870 ) ) ( not ( = ?auto_98865 ?auto_98866 ) ) ( not ( = ?auto_98865 ?auto_98867 ) ) ( not ( = ?auto_98865 ?auto_98868 ) ) ( not ( = ?auto_98865 ?auto_98869 ) ) ( not ( = ?auto_98865 ?auto_98870 ) ) ( not ( = ?auto_98866 ?auto_98867 ) ) ( not ( = ?auto_98866 ?auto_98868 ) ) ( not ( = ?auto_98866 ?auto_98869 ) ) ( not ( = ?auto_98866 ?auto_98870 ) ) ( not ( = ?auto_98867 ?auto_98868 ) ) ( not ( = ?auto_98867 ?auto_98869 ) ) ( not ( = ?auto_98867 ?auto_98870 ) ) ( not ( = ?auto_98868 ?auto_98869 ) ) ( not ( = ?auto_98868 ?auto_98870 ) ) ( not ( = ?auto_98869 ?auto_98870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98869 ?auto_98870 )
      ( !STACK ?auto_98869 ?auto_98868 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98878 - BLOCK
      ?auto_98879 - BLOCK
      ?auto_98880 - BLOCK
      ?auto_98881 - BLOCK
      ?auto_98882 - BLOCK
      ?auto_98883 - BLOCK
      ?auto_98884 - BLOCK
    )
    :vars
    (
      ?auto_98885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98884 ?auto_98885 ) ( ON-TABLE ?auto_98878 ) ( ON ?auto_98879 ?auto_98878 ) ( ON ?auto_98880 ?auto_98879 ) ( ON ?auto_98881 ?auto_98880 ) ( ON ?auto_98882 ?auto_98881 ) ( not ( = ?auto_98878 ?auto_98879 ) ) ( not ( = ?auto_98878 ?auto_98880 ) ) ( not ( = ?auto_98878 ?auto_98881 ) ) ( not ( = ?auto_98878 ?auto_98882 ) ) ( not ( = ?auto_98878 ?auto_98883 ) ) ( not ( = ?auto_98878 ?auto_98884 ) ) ( not ( = ?auto_98878 ?auto_98885 ) ) ( not ( = ?auto_98879 ?auto_98880 ) ) ( not ( = ?auto_98879 ?auto_98881 ) ) ( not ( = ?auto_98879 ?auto_98882 ) ) ( not ( = ?auto_98879 ?auto_98883 ) ) ( not ( = ?auto_98879 ?auto_98884 ) ) ( not ( = ?auto_98879 ?auto_98885 ) ) ( not ( = ?auto_98880 ?auto_98881 ) ) ( not ( = ?auto_98880 ?auto_98882 ) ) ( not ( = ?auto_98880 ?auto_98883 ) ) ( not ( = ?auto_98880 ?auto_98884 ) ) ( not ( = ?auto_98880 ?auto_98885 ) ) ( not ( = ?auto_98881 ?auto_98882 ) ) ( not ( = ?auto_98881 ?auto_98883 ) ) ( not ( = ?auto_98881 ?auto_98884 ) ) ( not ( = ?auto_98881 ?auto_98885 ) ) ( not ( = ?auto_98882 ?auto_98883 ) ) ( not ( = ?auto_98882 ?auto_98884 ) ) ( not ( = ?auto_98882 ?auto_98885 ) ) ( not ( = ?auto_98883 ?auto_98884 ) ) ( not ( = ?auto_98883 ?auto_98885 ) ) ( not ( = ?auto_98884 ?auto_98885 ) ) ( CLEAR ?auto_98882 ) ( ON ?auto_98883 ?auto_98884 ) ( CLEAR ?auto_98883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98878 ?auto_98879 ?auto_98880 ?auto_98881 ?auto_98882 ?auto_98883 )
      ( MAKE-7PILE ?auto_98878 ?auto_98879 ?auto_98880 ?auto_98881 ?auto_98882 ?auto_98883 ?auto_98884 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98893 - BLOCK
      ?auto_98894 - BLOCK
      ?auto_98895 - BLOCK
      ?auto_98896 - BLOCK
      ?auto_98897 - BLOCK
      ?auto_98898 - BLOCK
      ?auto_98899 - BLOCK
    )
    :vars
    (
      ?auto_98900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98899 ?auto_98900 ) ( ON-TABLE ?auto_98893 ) ( ON ?auto_98894 ?auto_98893 ) ( ON ?auto_98895 ?auto_98894 ) ( ON ?auto_98896 ?auto_98895 ) ( ON ?auto_98897 ?auto_98896 ) ( not ( = ?auto_98893 ?auto_98894 ) ) ( not ( = ?auto_98893 ?auto_98895 ) ) ( not ( = ?auto_98893 ?auto_98896 ) ) ( not ( = ?auto_98893 ?auto_98897 ) ) ( not ( = ?auto_98893 ?auto_98898 ) ) ( not ( = ?auto_98893 ?auto_98899 ) ) ( not ( = ?auto_98893 ?auto_98900 ) ) ( not ( = ?auto_98894 ?auto_98895 ) ) ( not ( = ?auto_98894 ?auto_98896 ) ) ( not ( = ?auto_98894 ?auto_98897 ) ) ( not ( = ?auto_98894 ?auto_98898 ) ) ( not ( = ?auto_98894 ?auto_98899 ) ) ( not ( = ?auto_98894 ?auto_98900 ) ) ( not ( = ?auto_98895 ?auto_98896 ) ) ( not ( = ?auto_98895 ?auto_98897 ) ) ( not ( = ?auto_98895 ?auto_98898 ) ) ( not ( = ?auto_98895 ?auto_98899 ) ) ( not ( = ?auto_98895 ?auto_98900 ) ) ( not ( = ?auto_98896 ?auto_98897 ) ) ( not ( = ?auto_98896 ?auto_98898 ) ) ( not ( = ?auto_98896 ?auto_98899 ) ) ( not ( = ?auto_98896 ?auto_98900 ) ) ( not ( = ?auto_98897 ?auto_98898 ) ) ( not ( = ?auto_98897 ?auto_98899 ) ) ( not ( = ?auto_98897 ?auto_98900 ) ) ( not ( = ?auto_98898 ?auto_98899 ) ) ( not ( = ?auto_98898 ?auto_98900 ) ) ( not ( = ?auto_98899 ?auto_98900 ) ) ( CLEAR ?auto_98897 ) ( ON ?auto_98898 ?auto_98899 ) ( CLEAR ?auto_98898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98893 ?auto_98894 ?auto_98895 ?auto_98896 ?auto_98897 ?auto_98898 )
      ( MAKE-7PILE ?auto_98893 ?auto_98894 ?auto_98895 ?auto_98896 ?auto_98897 ?auto_98898 ?auto_98899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98908 - BLOCK
      ?auto_98909 - BLOCK
      ?auto_98910 - BLOCK
      ?auto_98911 - BLOCK
      ?auto_98912 - BLOCK
      ?auto_98913 - BLOCK
      ?auto_98914 - BLOCK
    )
    :vars
    (
      ?auto_98915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98914 ?auto_98915 ) ( ON-TABLE ?auto_98908 ) ( ON ?auto_98909 ?auto_98908 ) ( ON ?auto_98910 ?auto_98909 ) ( ON ?auto_98911 ?auto_98910 ) ( not ( = ?auto_98908 ?auto_98909 ) ) ( not ( = ?auto_98908 ?auto_98910 ) ) ( not ( = ?auto_98908 ?auto_98911 ) ) ( not ( = ?auto_98908 ?auto_98912 ) ) ( not ( = ?auto_98908 ?auto_98913 ) ) ( not ( = ?auto_98908 ?auto_98914 ) ) ( not ( = ?auto_98908 ?auto_98915 ) ) ( not ( = ?auto_98909 ?auto_98910 ) ) ( not ( = ?auto_98909 ?auto_98911 ) ) ( not ( = ?auto_98909 ?auto_98912 ) ) ( not ( = ?auto_98909 ?auto_98913 ) ) ( not ( = ?auto_98909 ?auto_98914 ) ) ( not ( = ?auto_98909 ?auto_98915 ) ) ( not ( = ?auto_98910 ?auto_98911 ) ) ( not ( = ?auto_98910 ?auto_98912 ) ) ( not ( = ?auto_98910 ?auto_98913 ) ) ( not ( = ?auto_98910 ?auto_98914 ) ) ( not ( = ?auto_98910 ?auto_98915 ) ) ( not ( = ?auto_98911 ?auto_98912 ) ) ( not ( = ?auto_98911 ?auto_98913 ) ) ( not ( = ?auto_98911 ?auto_98914 ) ) ( not ( = ?auto_98911 ?auto_98915 ) ) ( not ( = ?auto_98912 ?auto_98913 ) ) ( not ( = ?auto_98912 ?auto_98914 ) ) ( not ( = ?auto_98912 ?auto_98915 ) ) ( not ( = ?auto_98913 ?auto_98914 ) ) ( not ( = ?auto_98913 ?auto_98915 ) ) ( not ( = ?auto_98914 ?auto_98915 ) ) ( ON ?auto_98913 ?auto_98914 ) ( CLEAR ?auto_98911 ) ( ON ?auto_98912 ?auto_98913 ) ( CLEAR ?auto_98912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98908 ?auto_98909 ?auto_98910 ?auto_98911 ?auto_98912 )
      ( MAKE-7PILE ?auto_98908 ?auto_98909 ?auto_98910 ?auto_98911 ?auto_98912 ?auto_98913 ?auto_98914 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98923 - BLOCK
      ?auto_98924 - BLOCK
      ?auto_98925 - BLOCK
      ?auto_98926 - BLOCK
      ?auto_98927 - BLOCK
      ?auto_98928 - BLOCK
      ?auto_98929 - BLOCK
    )
    :vars
    (
      ?auto_98930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98929 ?auto_98930 ) ( ON-TABLE ?auto_98923 ) ( ON ?auto_98924 ?auto_98923 ) ( ON ?auto_98925 ?auto_98924 ) ( ON ?auto_98926 ?auto_98925 ) ( not ( = ?auto_98923 ?auto_98924 ) ) ( not ( = ?auto_98923 ?auto_98925 ) ) ( not ( = ?auto_98923 ?auto_98926 ) ) ( not ( = ?auto_98923 ?auto_98927 ) ) ( not ( = ?auto_98923 ?auto_98928 ) ) ( not ( = ?auto_98923 ?auto_98929 ) ) ( not ( = ?auto_98923 ?auto_98930 ) ) ( not ( = ?auto_98924 ?auto_98925 ) ) ( not ( = ?auto_98924 ?auto_98926 ) ) ( not ( = ?auto_98924 ?auto_98927 ) ) ( not ( = ?auto_98924 ?auto_98928 ) ) ( not ( = ?auto_98924 ?auto_98929 ) ) ( not ( = ?auto_98924 ?auto_98930 ) ) ( not ( = ?auto_98925 ?auto_98926 ) ) ( not ( = ?auto_98925 ?auto_98927 ) ) ( not ( = ?auto_98925 ?auto_98928 ) ) ( not ( = ?auto_98925 ?auto_98929 ) ) ( not ( = ?auto_98925 ?auto_98930 ) ) ( not ( = ?auto_98926 ?auto_98927 ) ) ( not ( = ?auto_98926 ?auto_98928 ) ) ( not ( = ?auto_98926 ?auto_98929 ) ) ( not ( = ?auto_98926 ?auto_98930 ) ) ( not ( = ?auto_98927 ?auto_98928 ) ) ( not ( = ?auto_98927 ?auto_98929 ) ) ( not ( = ?auto_98927 ?auto_98930 ) ) ( not ( = ?auto_98928 ?auto_98929 ) ) ( not ( = ?auto_98928 ?auto_98930 ) ) ( not ( = ?auto_98929 ?auto_98930 ) ) ( ON ?auto_98928 ?auto_98929 ) ( CLEAR ?auto_98926 ) ( ON ?auto_98927 ?auto_98928 ) ( CLEAR ?auto_98927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98923 ?auto_98924 ?auto_98925 ?auto_98926 ?auto_98927 )
      ( MAKE-7PILE ?auto_98923 ?auto_98924 ?auto_98925 ?auto_98926 ?auto_98927 ?auto_98928 ?auto_98929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98938 - BLOCK
      ?auto_98939 - BLOCK
      ?auto_98940 - BLOCK
      ?auto_98941 - BLOCK
      ?auto_98942 - BLOCK
      ?auto_98943 - BLOCK
      ?auto_98944 - BLOCK
    )
    :vars
    (
      ?auto_98945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98944 ?auto_98945 ) ( ON-TABLE ?auto_98938 ) ( ON ?auto_98939 ?auto_98938 ) ( ON ?auto_98940 ?auto_98939 ) ( not ( = ?auto_98938 ?auto_98939 ) ) ( not ( = ?auto_98938 ?auto_98940 ) ) ( not ( = ?auto_98938 ?auto_98941 ) ) ( not ( = ?auto_98938 ?auto_98942 ) ) ( not ( = ?auto_98938 ?auto_98943 ) ) ( not ( = ?auto_98938 ?auto_98944 ) ) ( not ( = ?auto_98938 ?auto_98945 ) ) ( not ( = ?auto_98939 ?auto_98940 ) ) ( not ( = ?auto_98939 ?auto_98941 ) ) ( not ( = ?auto_98939 ?auto_98942 ) ) ( not ( = ?auto_98939 ?auto_98943 ) ) ( not ( = ?auto_98939 ?auto_98944 ) ) ( not ( = ?auto_98939 ?auto_98945 ) ) ( not ( = ?auto_98940 ?auto_98941 ) ) ( not ( = ?auto_98940 ?auto_98942 ) ) ( not ( = ?auto_98940 ?auto_98943 ) ) ( not ( = ?auto_98940 ?auto_98944 ) ) ( not ( = ?auto_98940 ?auto_98945 ) ) ( not ( = ?auto_98941 ?auto_98942 ) ) ( not ( = ?auto_98941 ?auto_98943 ) ) ( not ( = ?auto_98941 ?auto_98944 ) ) ( not ( = ?auto_98941 ?auto_98945 ) ) ( not ( = ?auto_98942 ?auto_98943 ) ) ( not ( = ?auto_98942 ?auto_98944 ) ) ( not ( = ?auto_98942 ?auto_98945 ) ) ( not ( = ?auto_98943 ?auto_98944 ) ) ( not ( = ?auto_98943 ?auto_98945 ) ) ( not ( = ?auto_98944 ?auto_98945 ) ) ( ON ?auto_98943 ?auto_98944 ) ( ON ?auto_98942 ?auto_98943 ) ( CLEAR ?auto_98940 ) ( ON ?auto_98941 ?auto_98942 ) ( CLEAR ?auto_98941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98938 ?auto_98939 ?auto_98940 ?auto_98941 )
      ( MAKE-7PILE ?auto_98938 ?auto_98939 ?auto_98940 ?auto_98941 ?auto_98942 ?auto_98943 ?auto_98944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98953 - BLOCK
      ?auto_98954 - BLOCK
      ?auto_98955 - BLOCK
      ?auto_98956 - BLOCK
      ?auto_98957 - BLOCK
      ?auto_98958 - BLOCK
      ?auto_98959 - BLOCK
    )
    :vars
    (
      ?auto_98960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98959 ?auto_98960 ) ( ON-TABLE ?auto_98953 ) ( ON ?auto_98954 ?auto_98953 ) ( ON ?auto_98955 ?auto_98954 ) ( not ( = ?auto_98953 ?auto_98954 ) ) ( not ( = ?auto_98953 ?auto_98955 ) ) ( not ( = ?auto_98953 ?auto_98956 ) ) ( not ( = ?auto_98953 ?auto_98957 ) ) ( not ( = ?auto_98953 ?auto_98958 ) ) ( not ( = ?auto_98953 ?auto_98959 ) ) ( not ( = ?auto_98953 ?auto_98960 ) ) ( not ( = ?auto_98954 ?auto_98955 ) ) ( not ( = ?auto_98954 ?auto_98956 ) ) ( not ( = ?auto_98954 ?auto_98957 ) ) ( not ( = ?auto_98954 ?auto_98958 ) ) ( not ( = ?auto_98954 ?auto_98959 ) ) ( not ( = ?auto_98954 ?auto_98960 ) ) ( not ( = ?auto_98955 ?auto_98956 ) ) ( not ( = ?auto_98955 ?auto_98957 ) ) ( not ( = ?auto_98955 ?auto_98958 ) ) ( not ( = ?auto_98955 ?auto_98959 ) ) ( not ( = ?auto_98955 ?auto_98960 ) ) ( not ( = ?auto_98956 ?auto_98957 ) ) ( not ( = ?auto_98956 ?auto_98958 ) ) ( not ( = ?auto_98956 ?auto_98959 ) ) ( not ( = ?auto_98956 ?auto_98960 ) ) ( not ( = ?auto_98957 ?auto_98958 ) ) ( not ( = ?auto_98957 ?auto_98959 ) ) ( not ( = ?auto_98957 ?auto_98960 ) ) ( not ( = ?auto_98958 ?auto_98959 ) ) ( not ( = ?auto_98958 ?auto_98960 ) ) ( not ( = ?auto_98959 ?auto_98960 ) ) ( ON ?auto_98958 ?auto_98959 ) ( ON ?auto_98957 ?auto_98958 ) ( CLEAR ?auto_98955 ) ( ON ?auto_98956 ?auto_98957 ) ( CLEAR ?auto_98956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98953 ?auto_98954 ?auto_98955 ?auto_98956 )
      ( MAKE-7PILE ?auto_98953 ?auto_98954 ?auto_98955 ?auto_98956 ?auto_98957 ?auto_98958 ?auto_98959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98968 - BLOCK
      ?auto_98969 - BLOCK
      ?auto_98970 - BLOCK
      ?auto_98971 - BLOCK
      ?auto_98972 - BLOCK
      ?auto_98973 - BLOCK
      ?auto_98974 - BLOCK
    )
    :vars
    (
      ?auto_98975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98974 ?auto_98975 ) ( ON-TABLE ?auto_98968 ) ( ON ?auto_98969 ?auto_98968 ) ( not ( = ?auto_98968 ?auto_98969 ) ) ( not ( = ?auto_98968 ?auto_98970 ) ) ( not ( = ?auto_98968 ?auto_98971 ) ) ( not ( = ?auto_98968 ?auto_98972 ) ) ( not ( = ?auto_98968 ?auto_98973 ) ) ( not ( = ?auto_98968 ?auto_98974 ) ) ( not ( = ?auto_98968 ?auto_98975 ) ) ( not ( = ?auto_98969 ?auto_98970 ) ) ( not ( = ?auto_98969 ?auto_98971 ) ) ( not ( = ?auto_98969 ?auto_98972 ) ) ( not ( = ?auto_98969 ?auto_98973 ) ) ( not ( = ?auto_98969 ?auto_98974 ) ) ( not ( = ?auto_98969 ?auto_98975 ) ) ( not ( = ?auto_98970 ?auto_98971 ) ) ( not ( = ?auto_98970 ?auto_98972 ) ) ( not ( = ?auto_98970 ?auto_98973 ) ) ( not ( = ?auto_98970 ?auto_98974 ) ) ( not ( = ?auto_98970 ?auto_98975 ) ) ( not ( = ?auto_98971 ?auto_98972 ) ) ( not ( = ?auto_98971 ?auto_98973 ) ) ( not ( = ?auto_98971 ?auto_98974 ) ) ( not ( = ?auto_98971 ?auto_98975 ) ) ( not ( = ?auto_98972 ?auto_98973 ) ) ( not ( = ?auto_98972 ?auto_98974 ) ) ( not ( = ?auto_98972 ?auto_98975 ) ) ( not ( = ?auto_98973 ?auto_98974 ) ) ( not ( = ?auto_98973 ?auto_98975 ) ) ( not ( = ?auto_98974 ?auto_98975 ) ) ( ON ?auto_98973 ?auto_98974 ) ( ON ?auto_98972 ?auto_98973 ) ( ON ?auto_98971 ?auto_98972 ) ( CLEAR ?auto_98969 ) ( ON ?auto_98970 ?auto_98971 ) ( CLEAR ?auto_98970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98968 ?auto_98969 ?auto_98970 )
      ( MAKE-7PILE ?auto_98968 ?auto_98969 ?auto_98970 ?auto_98971 ?auto_98972 ?auto_98973 ?auto_98974 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98983 - BLOCK
      ?auto_98984 - BLOCK
      ?auto_98985 - BLOCK
      ?auto_98986 - BLOCK
      ?auto_98987 - BLOCK
      ?auto_98988 - BLOCK
      ?auto_98989 - BLOCK
    )
    :vars
    (
      ?auto_98990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98989 ?auto_98990 ) ( ON-TABLE ?auto_98983 ) ( ON ?auto_98984 ?auto_98983 ) ( not ( = ?auto_98983 ?auto_98984 ) ) ( not ( = ?auto_98983 ?auto_98985 ) ) ( not ( = ?auto_98983 ?auto_98986 ) ) ( not ( = ?auto_98983 ?auto_98987 ) ) ( not ( = ?auto_98983 ?auto_98988 ) ) ( not ( = ?auto_98983 ?auto_98989 ) ) ( not ( = ?auto_98983 ?auto_98990 ) ) ( not ( = ?auto_98984 ?auto_98985 ) ) ( not ( = ?auto_98984 ?auto_98986 ) ) ( not ( = ?auto_98984 ?auto_98987 ) ) ( not ( = ?auto_98984 ?auto_98988 ) ) ( not ( = ?auto_98984 ?auto_98989 ) ) ( not ( = ?auto_98984 ?auto_98990 ) ) ( not ( = ?auto_98985 ?auto_98986 ) ) ( not ( = ?auto_98985 ?auto_98987 ) ) ( not ( = ?auto_98985 ?auto_98988 ) ) ( not ( = ?auto_98985 ?auto_98989 ) ) ( not ( = ?auto_98985 ?auto_98990 ) ) ( not ( = ?auto_98986 ?auto_98987 ) ) ( not ( = ?auto_98986 ?auto_98988 ) ) ( not ( = ?auto_98986 ?auto_98989 ) ) ( not ( = ?auto_98986 ?auto_98990 ) ) ( not ( = ?auto_98987 ?auto_98988 ) ) ( not ( = ?auto_98987 ?auto_98989 ) ) ( not ( = ?auto_98987 ?auto_98990 ) ) ( not ( = ?auto_98988 ?auto_98989 ) ) ( not ( = ?auto_98988 ?auto_98990 ) ) ( not ( = ?auto_98989 ?auto_98990 ) ) ( ON ?auto_98988 ?auto_98989 ) ( ON ?auto_98987 ?auto_98988 ) ( ON ?auto_98986 ?auto_98987 ) ( CLEAR ?auto_98984 ) ( ON ?auto_98985 ?auto_98986 ) ( CLEAR ?auto_98985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98983 ?auto_98984 ?auto_98985 )
      ( MAKE-7PILE ?auto_98983 ?auto_98984 ?auto_98985 ?auto_98986 ?auto_98987 ?auto_98988 ?auto_98989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98998 - BLOCK
      ?auto_98999 - BLOCK
      ?auto_99000 - BLOCK
      ?auto_99001 - BLOCK
      ?auto_99002 - BLOCK
      ?auto_99003 - BLOCK
      ?auto_99004 - BLOCK
    )
    :vars
    (
      ?auto_99005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99004 ?auto_99005 ) ( ON-TABLE ?auto_98998 ) ( not ( = ?auto_98998 ?auto_98999 ) ) ( not ( = ?auto_98998 ?auto_99000 ) ) ( not ( = ?auto_98998 ?auto_99001 ) ) ( not ( = ?auto_98998 ?auto_99002 ) ) ( not ( = ?auto_98998 ?auto_99003 ) ) ( not ( = ?auto_98998 ?auto_99004 ) ) ( not ( = ?auto_98998 ?auto_99005 ) ) ( not ( = ?auto_98999 ?auto_99000 ) ) ( not ( = ?auto_98999 ?auto_99001 ) ) ( not ( = ?auto_98999 ?auto_99002 ) ) ( not ( = ?auto_98999 ?auto_99003 ) ) ( not ( = ?auto_98999 ?auto_99004 ) ) ( not ( = ?auto_98999 ?auto_99005 ) ) ( not ( = ?auto_99000 ?auto_99001 ) ) ( not ( = ?auto_99000 ?auto_99002 ) ) ( not ( = ?auto_99000 ?auto_99003 ) ) ( not ( = ?auto_99000 ?auto_99004 ) ) ( not ( = ?auto_99000 ?auto_99005 ) ) ( not ( = ?auto_99001 ?auto_99002 ) ) ( not ( = ?auto_99001 ?auto_99003 ) ) ( not ( = ?auto_99001 ?auto_99004 ) ) ( not ( = ?auto_99001 ?auto_99005 ) ) ( not ( = ?auto_99002 ?auto_99003 ) ) ( not ( = ?auto_99002 ?auto_99004 ) ) ( not ( = ?auto_99002 ?auto_99005 ) ) ( not ( = ?auto_99003 ?auto_99004 ) ) ( not ( = ?auto_99003 ?auto_99005 ) ) ( not ( = ?auto_99004 ?auto_99005 ) ) ( ON ?auto_99003 ?auto_99004 ) ( ON ?auto_99002 ?auto_99003 ) ( ON ?auto_99001 ?auto_99002 ) ( ON ?auto_99000 ?auto_99001 ) ( CLEAR ?auto_98998 ) ( ON ?auto_98999 ?auto_99000 ) ( CLEAR ?auto_98999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98998 ?auto_98999 )
      ( MAKE-7PILE ?auto_98998 ?auto_98999 ?auto_99000 ?auto_99001 ?auto_99002 ?auto_99003 ?auto_99004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99013 - BLOCK
      ?auto_99014 - BLOCK
      ?auto_99015 - BLOCK
      ?auto_99016 - BLOCK
      ?auto_99017 - BLOCK
      ?auto_99018 - BLOCK
      ?auto_99019 - BLOCK
    )
    :vars
    (
      ?auto_99020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99019 ?auto_99020 ) ( ON-TABLE ?auto_99013 ) ( not ( = ?auto_99013 ?auto_99014 ) ) ( not ( = ?auto_99013 ?auto_99015 ) ) ( not ( = ?auto_99013 ?auto_99016 ) ) ( not ( = ?auto_99013 ?auto_99017 ) ) ( not ( = ?auto_99013 ?auto_99018 ) ) ( not ( = ?auto_99013 ?auto_99019 ) ) ( not ( = ?auto_99013 ?auto_99020 ) ) ( not ( = ?auto_99014 ?auto_99015 ) ) ( not ( = ?auto_99014 ?auto_99016 ) ) ( not ( = ?auto_99014 ?auto_99017 ) ) ( not ( = ?auto_99014 ?auto_99018 ) ) ( not ( = ?auto_99014 ?auto_99019 ) ) ( not ( = ?auto_99014 ?auto_99020 ) ) ( not ( = ?auto_99015 ?auto_99016 ) ) ( not ( = ?auto_99015 ?auto_99017 ) ) ( not ( = ?auto_99015 ?auto_99018 ) ) ( not ( = ?auto_99015 ?auto_99019 ) ) ( not ( = ?auto_99015 ?auto_99020 ) ) ( not ( = ?auto_99016 ?auto_99017 ) ) ( not ( = ?auto_99016 ?auto_99018 ) ) ( not ( = ?auto_99016 ?auto_99019 ) ) ( not ( = ?auto_99016 ?auto_99020 ) ) ( not ( = ?auto_99017 ?auto_99018 ) ) ( not ( = ?auto_99017 ?auto_99019 ) ) ( not ( = ?auto_99017 ?auto_99020 ) ) ( not ( = ?auto_99018 ?auto_99019 ) ) ( not ( = ?auto_99018 ?auto_99020 ) ) ( not ( = ?auto_99019 ?auto_99020 ) ) ( ON ?auto_99018 ?auto_99019 ) ( ON ?auto_99017 ?auto_99018 ) ( ON ?auto_99016 ?auto_99017 ) ( ON ?auto_99015 ?auto_99016 ) ( CLEAR ?auto_99013 ) ( ON ?auto_99014 ?auto_99015 ) ( CLEAR ?auto_99014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99013 ?auto_99014 )
      ( MAKE-7PILE ?auto_99013 ?auto_99014 ?auto_99015 ?auto_99016 ?auto_99017 ?auto_99018 ?auto_99019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99028 - BLOCK
      ?auto_99029 - BLOCK
      ?auto_99030 - BLOCK
      ?auto_99031 - BLOCK
      ?auto_99032 - BLOCK
      ?auto_99033 - BLOCK
      ?auto_99034 - BLOCK
    )
    :vars
    (
      ?auto_99035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99034 ?auto_99035 ) ( not ( = ?auto_99028 ?auto_99029 ) ) ( not ( = ?auto_99028 ?auto_99030 ) ) ( not ( = ?auto_99028 ?auto_99031 ) ) ( not ( = ?auto_99028 ?auto_99032 ) ) ( not ( = ?auto_99028 ?auto_99033 ) ) ( not ( = ?auto_99028 ?auto_99034 ) ) ( not ( = ?auto_99028 ?auto_99035 ) ) ( not ( = ?auto_99029 ?auto_99030 ) ) ( not ( = ?auto_99029 ?auto_99031 ) ) ( not ( = ?auto_99029 ?auto_99032 ) ) ( not ( = ?auto_99029 ?auto_99033 ) ) ( not ( = ?auto_99029 ?auto_99034 ) ) ( not ( = ?auto_99029 ?auto_99035 ) ) ( not ( = ?auto_99030 ?auto_99031 ) ) ( not ( = ?auto_99030 ?auto_99032 ) ) ( not ( = ?auto_99030 ?auto_99033 ) ) ( not ( = ?auto_99030 ?auto_99034 ) ) ( not ( = ?auto_99030 ?auto_99035 ) ) ( not ( = ?auto_99031 ?auto_99032 ) ) ( not ( = ?auto_99031 ?auto_99033 ) ) ( not ( = ?auto_99031 ?auto_99034 ) ) ( not ( = ?auto_99031 ?auto_99035 ) ) ( not ( = ?auto_99032 ?auto_99033 ) ) ( not ( = ?auto_99032 ?auto_99034 ) ) ( not ( = ?auto_99032 ?auto_99035 ) ) ( not ( = ?auto_99033 ?auto_99034 ) ) ( not ( = ?auto_99033 ?auto_99035 ) ) ( not ( = ?auto_99034 ?auto_99035 ) ) ( ON ?auto_99033 ?auto_99034 ) ( ON ?auto_99032 ?auto_99033 ) ( ON ?auto_99031 ?auto_99032 ) ( ON ?auto_99030 ?auto_99031 ) ( ON ?auto_99029 ?auto_99030 ) ( ON ?auto_99028 ?auto_99029 ) ( CLEAR ?auto_99028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99028 )
      ( MAKE-7PILE ?auto_99028 ?auto_99029 ?auto_99030 ?auto_99031 ?auto_99032 ?auto_99033 ?auto_99034 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99043 - BLOCK
      ?auto_99044 - BLOCK
      ?auto_99045 - BLOCK
      ?auto_99046 - BLOCK
      ?auto_99047 - BLOCK
      ?auto_99048 - BLOCK
      ?auto_99049 - BLOCK
    )
    :vars
    (
      ?auto_99050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99049 ?auto_99050 ) ( not ( = ?auto_99043 ?auto_99044 ) ) ( not ( = ?auto_99043 ?auto_99045 ) ) ( not ( = ?auto_99043 ?auto_99046 ) ) ( not ( = ?auto_99043 ?auto_99047 ) ) ( not ( = ?auto_99043 ?auto_99048 ) ) ( not ( = ?auto_99043 ?auto_99049 ) ) ( not ( = ?auto_99043 ?auto_99050 ) ) ( not ( = ?auto_99044 ?auto_99045 ) ) ( not ( = ?auto_99044 ?auto_99046 ) ) ( not ( = ?auto_99044 ?auto_99047 ) ) ( not ( = ?auto_99044 ?auto_99048 ) ) ( not ( = ?auto_99044 ?auto_99049 ) ) ( not ( = ?auto_99044 ?auto_99050 ) ) ( not ( = ?auto_99045 ?auto_99046 ) ) ( not ( = ?auto_99045 ?auto_99047 ) ) ( not ( = ?auto_99045 ?auto_99048 ) ) ( not ( = ?auto_99045 ?auto_99049 ) ) ( not ( = ?auto_99045 ?auto_99050 ) ) ( not ( = ?auto_99046 ?auto_99047 ) ) ( not ( = ?auto_99046 ?auto_99048 ) ) ( not ( = ?auto_99046 ?auto_99049 ) ) ( not ( = ?auto_99046 ?auto_99050 ) ) ( not ( = ?auto_99047 ?auto_99048 ) ) ( not ( = ?auto_99047 ?auto_99049 ) ) ( not ( = ?auto_99047 ?auto_99050 ) ) ( not ( = ?auto_99048 ?auto_99049 ) ) ( not ( = ?auto_99048 ?auto_99050 ) ) ( not ( = ?auto_99049 ?auto_99050 ) ) ( ON ?auto_99048 ?auto_99049 ) ( ON ?auto_99047 ?auto_99048 ) ( ON ?auto_99046 ?auto_99047 ) ( ON ?auto_99045 ?auto_99046 ) ( ON ?auto_99044 ?auto_99045 ) ( ON ?auto_99043 ?auto_99044 ) ( CLEAR ?auto_99043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99043 )
      ( MAKE-7PILE ?auto_99043 ?auto_99044 ?auto_99045 ?auto_99046 ?auto_99047 ?auto_99048 ?auto_99049 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99059 - BLOCK
      ?auto_99060 - BLOCK
      ?auto_99061 - BLOCK
      ?auto_99062 - BLOCK
      ?auto_99063 - BLOCK
      ?auto_99064 - BLOCK
      ?auto_99065 - BLOCK
      ?auto_99066 - BLOCK
    )
    :vars
    (
      ?auto_99067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99065 ) ( ON ?auto_99066 ?auto_99067 ) ( CLEAR ?auto_99066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99059 ) ( ON ?auto_99060 ?auto_99059 ) ( ON ?auto_99061 ?auto_99060 ) ( ON ?auto_99062 ?auto_99061 ) ( ON ?auto_99063 ?auto_99062 ) ( ON ?auto_99064 ?auto_99063 ) ( ON ?auto_99065 ?auto_99064 ) ( not ( = ?auto_99059 ?auto_99060 ) ) ( not ( = ?auto_99059 ?auto_99061 ) ) ( not ( = ?auto_99059 ?auto_99062 ) ) ( not ( = ?auto_99059 ?auto_99063 ) ) ( not ( = ?auto_99059 ?auto_99064 ) ) ( not ( = ?auto_99059 ?auto_99065 ) ) ( not ( = ?auto_99059 ?auto_99066 ) ) ( not ( = ?auto_99059 ?auto_99067 ) ) ( not ( = ?auto_99060 ?auto_99061 ) ) ( not ( = ?auto_99060 ?auto_99062 ) ) ( not ( = ?auto_99060 ?auto_99063 ) ) ( not ( = ?auto_99060 ?auto_99064 ) ) ( not ( = ?auto_99060 ?auto_99065 ) ) ( not ( = ?auto_99060 ?auto_99066 ) ) ( not ( = ?auto_99060 ?auto_99067 ) ) ( not ( = ?auto_99061 ?auto_99062 ) ) ( not ( = ?auto_99061 ?auto_99063 ) ) ( not ( = ?auto_99061 ?auto_99064 ) ) ( not ( = ?auto_99061 ?auto_99065 ) ) ( not ( = ?auto_99061 ?auto_99066 ) ) ( not ( = ?auto_99061 ?auto_99067 ) ) ( not ( = ?auto_99062 ?auto_99063 ) ) ( not ( = ?auto_99062 ?auto_99064 ) ) ( not ( = ?auto_99062 ?auto_99065 ) ) ( not ( = ?auto_99062 ?auto_99066 ) ) ( not ( = ?auto_99062 ?auto_99067 ) ) ( not ( = ?auto_99063 ?auto_99064 ) ) ( not ( = ?auto_99063 ?auto_99065 ) ) ( not ( = ?auto_99063 ?auto_99066 ) ) ( not ( = ?auto_99063 ?auto_99067 ) ) ( not ( = ?auto_99064 ?auto_99065 ) ) ( not ( = ?auto_99064 ?auto_99066 ) ) ( not ( = ?auto_99064 ?auto_99067 ) ) ( not ( = ?auto_99065 ?auto_99066 ) ) ( not ( = ?auto_99065 ?auto_99067 ) ) ( not ( = ?auto_99066 ?auto_99067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99066 ?auto_99067 )
      ( !STACK ?auto_99066 ?auto_99065 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99076 - BLOCK
      ?auto_99077 - BLOCK
      ?auto_99078 - BLOCK
      ?auto_99079 - BLOCK
      ?auto_99080 - BLOCK
      ?auto_99081 - BLOCK
      ?auto_99082 - BLOCK
      ?auto_99083 - BLOCK
    )
    :vars
    (
      ?auto_99084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99082 ) ( ON ?auto_99083 ?auto_99084 ) ( CLEAR ?auto_99083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99076 ) ( ON ?auto_99077 ?auto_99076 ) ( ON ?auto_99078 ?auto_99077 ) ( ON ?auto_99079 ?auto_99078 ) ( ON ?auto_99080 ?auto_99079 ) ( ON ?auto_99081 ?auto_99080 ) ( ON ?auto_99082 ?auto_99081 ) ( not ( = ?auto_99076 ?auto_99077 ) ) ( not ( = ?auto_99076 ?auto_99078 ) ) ( not ( = ?auto_99076 ?auto_99079 ) ) ( not ( = ?auto_99076 ?auto_99080 ) ) ( not ( = ?auto_99076 ?auto_99081 ) ) ( not ( = ?auto_99076 ?auto_99082 ) ) ( not ( = ?auto_99076 ?auto_99083 ) ) ( not ( = ?auto_99076 ?auto_99084 ) ) ( not ( = ?auto_99077 ?auto_99078 ) ) ( not ( = ?auto_99077 ?auto_99079 ) ) ( not ( = ?auto_99077 ?auto_99080 ) ) ( not ( = ?auto_99077 ?auto_99081 ) ) ( not ( = ?auto_99077 ?auto_99082 ) ) ( not ( = ?auto_99077 ?auto_99083 ) ) ( not ( = ?auto_99077 ?auto_99084 ) ) ( not ( = ?auto_99078 ?auto_99079 ) ) ( not ( = ?auto_99078 ?auto_99080 ) ) ( not ( = ?auto_99078 ?auto_99081 ) ) ( not ( = ?auto_99078 ?auto_99082 ) ) ( not ( = ?auto_99078 ?auto_99083 ) ) ( not ( = ?auto_99078 ?auto_99084 ) ) ( not ( = ?auto_99079 ?auto_99080 ) ) ( not ( = ?auto_99079 ?auto_99081 ) ) ( not ( = ?auto_99079 ?auto_99082 ) ) ( not ( = ?auto_99079 ?auto_99083 ) ) ( not ( = ?auto_99079 ?auto_99084 ) ) ( not ( = ?auto_99080 ?auto_99081 ) ) ( not ( = ?auto_99080 ?auto_99082 ) ) ( not ( = ?auto_99080 ?auto_99083 ) ) ( not ( = ?auto_99080 ?auto_99084 ) ) ( not ( = ?auto_99081 ?auto_99082 ) ) ( not ( = ?auto_99081 ?auto_99083 ) ) ( not ( = ?auto_99081 ?auto_99084 ) ) ( not ( = ?auto_99082 ?auto_99083 ) ) ( not ( = ?auto_99082 ?auto_99084 ) ) ( not ( = ?auto_99083 ?auto_99084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99083 ?auto_99084 )
      ( !STACK ?auto_99083 ?auto_99082 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99093 - BLOCK
      ?auto_99094 - BLOCK
      ?auto_99095 - BLOCK
      ?auto_99096 - BLOCK
      ?auto_99097 - BLOCK
      ?auto_99098 - BLOCK
      ?auto_99099 - BLOCK
      ?auto_99100 - BLOCK
    )
    :vars
    (
      ?auto_99101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99100 ?auto_99101 ) ( ON-TABLE ?auto_99093 ) ( ON ?auto_99094 ?auto_99093 ) ( ON ?auto_99095 ?auto_99094 ) ( ON ?auto_99096 ?auto_99095 ) ( ON ?auto_99097 ?auto_99096 ) ( ON ?auto_99098 ?auto_99097 ) ( not ( = ?auto_99093 ?auto_99094 ) ) ( not ( = ?auto_99093 ?auto_99095 ) ) ( not ( = ?auto_99093 ?auto_99096 ) ) ( not ( = ?auto_99093 ?auto_99097 ) ) ( not ( = ?auto_99093 ?auto_99098 ) ) ( not ( = ?auto_99093 ?auto_99099 ) ) ( not ( = ?auto_99093 ?auto_99100 ) ) ( not ( = ?auto_99093 ?auto_99101 ) ) ( not ( = ?auto_99094 ?auto_99095 ) ) ( not ( = ?auto_99094 ?auto_99096 ) ) ( not ( = ?auto_99094 ?auto_99097 ) ) ( not ( = ?auto_99094 ?auto_99098 ) ) ( not ( = ?auto_99094 ?auto_99099 ) ) ( not ( = ?auto_99094 ?auto_99100 ) ) ( not ( = ?auto_99094 ?auto_99101 ) ) ( not ( = ?auto_99095 ?auto_99096 ) ) ( not ( = ?auto_99095 ?auto_99097 ) ) ( not ( = ?auto_99095 ?auto_99098 ) ) ( not ( = ?auto_99095 ?auto_99099 ) ) ( not ( = ?auto_99095 ?auto_99100 ) ) ( not ( = ?auto_99095 ?auto_99101 ) ) ( not ( = ?auto_99096 ?auto_99097 ) ) ( not ( = ?auto_99096 ?auto_99098 ) ) ( not ( = ?auto_99096 ?auto_99099 ) ) ( not ( = ?auto_99096 ?auto_99100 ) ) ( not ( = ?auto_99096 ?auto_99101 ) ) ( not ( = ?auto_99097 ?auto_99098 ) ) ( not ( = ?auto_99097 ?auto_99099 ) ) ( not ( = ?auto_99097 ?auto_99100 ) ) ( not ( = ?auto_99097 ?auto_99101 ) ) ( not ( = ?auto_99098 ?auto_99099 ) ) ( not ( = ?auto_99098 ?auto_99100 ) ) ( not ( = ?auto_99098 ?auto_99101 ) ) ( not ( = ?auto_99099 ?auto_99100 ) ) ( not ( = ?auto_99099 ?auto_99101 ) ) ( not ( = ?auto_99100 ?auto_99101 ) ) ( CLEAR ?auto_99098 ) ( ON ?auto_99099 ?auto_99100 ) ( CLEAR ?auto_99099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99093 ?auto_99094 ?auto_99095 ?auto_99096 ?auto_99097 ?auto_99098 ?auto_99099 )
      ( MAKE-8PILE ?auto_99093 ?auto_99094 ?auto_99095 ?auto_99096 ?auto_99097 ?auto_99098 ?auto_99099 ?auto_99100 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99110 - BLOCK
      ?auto_99111 - BLOCK
      ?auto_99112 - BLOCK
      ?auto_99113 - BLOCK
      ?auto_99114 - BLOCK
      ?auto_99115 - BLOCK
      ?auto_99116 - BLOCK
      ?auto_99117 - BLOCK
    )
    :vars
    (
      ?auto_99118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99117 ?auto_99118 ) ( ON-TABLE ?auto_99110 ) ( ON ?auto_99111 ?auto_99110 ) ( ON ?auto_99112 ?auto_99111 ) ( ON ?auto_99113 ?auto_99112 ) ( ON ?auto_99114 ?auto_99113 ) ( ON ?auto_99115 ?auto_99114 ) ( not ( = ?auto_99110 ?auto_99111 ) ) ( not ( = ?auto_99110 ?auto_99112 ) ) ( not ( = ?auto_99110 ?auto_99113 ) ) ( not ( = ?auto_99110 ?auto_99114 ) ) ( not ( = ?auto_99110 ?auto_99115 ) ) ( not ( = ?auto_99110 ?auto_99116 ) ) ( not ( = ?auto_99110 ?auto_99117 ) ) ( not ( = ?auto_99110 ?auto_99118 ) ) ( not ( = ?auto_99111 ?auto_99112 ) ) ( not ( = ?auto_99111 ?auto_99113 ) ) ( not ( = ?auto_99111 ?auto_99114 ) ) ( not ( = ?auto_99111 ?auto_99115 ) ) ( not ( = ?auto_99111 ?auto_99116 ) ) ( not ( = ?auto_99111 ?auto_99117 ) ) ( not ( = ?auto_99111 ?auto_99118 ) ) ( not ( = ?auto_99112 ?auto_99113 ) ) ( not ( = ?auto_99112 ?auto_99114 ) ) ( not ( = ?auto_99112 ?auto_99115 ) ) ( not ( = ?auto_99112 ?auto_99116 ) ) ( not ( = ?auto_99112 ?auto_99117 ) ) ( not ( = ?auto_99112 ?auto_99118 ) ) ( not ( = ?auto_99113 ?auto_99114 ) ) ( not ( = ?auto_99113 ?auto_99115 ) ) ( not ( = ?auto_99113 ?auto_99116 ) ) ( not ( = ?auto_99113 ?auto_99117 ) ) ( not ( = ?auto_99113 ?auto_99118 ) ) ( not ( = ?auto_99114 ?auto_99115 ) ) ( not ( = ?auto_99114 ?auto_99116 ) ) ( not ( = ?auto_99114 ?auto_99117 ) ) ( not ( = ?auto_99114 ?auto_99118 ) ) ( not ( = ?auto_99115 ?auto_99116 ) ) ( not ( = ?auto_99115 ?auto_99117 ) ) ( not ( = ?auto_99115 ?auto_99118 ) ) ( not ( = ?auto_99116 ?auto_99117 ) ) ( not ( = ?auto_99116 ?auto_99118 ) ) ( not ( = ?auto_99117 ?auto_99118 ) ) ( CLEAR ?auto_99115 ) ( ON ?auto_99116 ?auto_99117 ) ( CLEAR ?auto_99116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99110 ?auto_99111 ?auto_99112 ?auto_99113 ?auto_99114 ?auto_99115 ?auto_99116 )
      ( MAKE-8PILE ?auto_99110 ?auto_99111 ?auto_99112 ?auto_99113 ?auto_99114 ?auto_99115 ?auto_99116 ?auto_99117 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99127 - BLOCK
      ?auto_99128 - BLOCK
      ?auto_99129 - BLOCK
      ?auto_99130 - BLOCK
      ?auto_99131 - BLOCK
      ?auto_99132 - BLOCK
      ?auto_99133 - BLOCK
      ?auto_99134 - BLOCK
    )
    :vars
    (
      ?auto_99135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99134 ?auto_99135 ) ( ON-TABLE ?auto_99127 ) ( ON ?auto_99128 ?auto_99127 ) ( ON ?auto_99129 ?auto_99128 ) ( ON ?auto_99130 ?auto_99129 ) ( ON ?auto_99131 ?auto_99130 ) ( not ( = ?auto_99127 ?auto_99128 ) ) ( not ( = ?auto_99127 ?auto_99129 ) ) ( not ( = ?auto_99127 ?auto_99130 ) ) ( not ( = ?auto_99127 ?auto_99131 ) ) ( not ( = ?auto_99127 ?auto_99132 ) ) ( not ( = ?auto_99127 ?auto_99133 ) ) ( not ( = ?auto_99127 ?auto_99134 ) ) ( not ( = ?auto_99127 ?auto_99135 ) ) ( not ( = ?auto_99128 ?auto_99129 ) ) ( not ( = ?auto_99128 ?auto_99130 ) ) ( not ( = ?auto_99128 ?auto_99131 ) ) ( not ( = ?auto_99128 ?auto_99132 ) ) ( not ( = ?auto_99128 ?auto_99133 ) ) ( not ( = ?auto_99128 ?auto_99134 ) ) ( not ( = ?auto_99128 ?auto_99135 ) ) ( not ( = ?auto_99129 ?auto_99130 ) ) ( not ( = ?auto_99129 ?auto_99131 ) ) ( not ( = ?auto_99129 ?auto_99132 ) ) ( not ( = ?auto_99129 ?auto_99133 ) ) ( not ( = ?auto_99129 ?auto_99134 ) ) ( not ( = ?auto_99129 ?auto_99135 ) ) ( not ( = ?auto_99130 ?auto_99131 ) ) ( not ( = ?auto_99130 ?auto_99132 ) ) ( not ( = ?auto_99130 ?auto_99133 ) ) ( not ( = ?auto_99130 ?auto_99134 ) ) ( not ( = ?auto_99130 ?auto_99135 ) ) ( not ( = ?auto_99131 ?auto_99132 ) ) ( not ( = ?auto_99131 ?auto_99133 ) ) ( not ( = ?auto_99131 ?auto_99134 ) ) ( not ( = ?auto_99131 ?auto_99135 ) ) ( not ( = ?auto_99132 ?auto_99133 ) ) ( not ( = ?auto_99132 ?auto_99134 ) ) ( not ( = ?auto_99132 ?auto_99135 ) ) ( not ( = ?auto_99133 ?auto_99134 ) ) ( not ( = ?auto_99133 ?auto_99135 ) ) ( not ( = ?auto_99134 ?auto_99135 ) ) ( ON ?auto_99133 ?auto_99134 ) ( CLEAR ?auto_99131 ) ( ON ?auto_99132 ?auto_99133 ) ( CLEAR ?auto_99132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99127 ?auto_99128 ?auto_99129 ?auto_99130 ?auto_99131 ?auto_99132 )
      ( MAKE-8PILE ?auto_99127 ?auto_99128 ?auto_99129 ?auto_99130 ?auto_99131 ?auto_99132 ?auto_99133 ?auto_99134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99144 - BLOCK
      ?auto_99145 - BLOCK
      ?auto_99146 - BLOCK
      ?auto_99147 - BLOCK
      ?auto_99148 - BLOCK
      ?auto_99149 - BLOCK
      ?auto_99150 - BLOCK
      ?auto_99151 - BLOCK
    )
    :vars
    (
      ?auto_99152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99151 ?auto_99152 ) ( ON-TABLE ?auto_99144 ) ( ON ?auto_99145 ?auto_99144 ) ( ON ?auto_99146 ?auto_99145 ) ( ON ?auto_99147 ?auto_99146 ) ( ON ?auto_99148 ?auto_99147 ) ( not ( = ?auto_99144 ?auto_99145 ) ) ( not ( = ?auto_99144 ?auto_99146 ) ) ( not ( = ?auto_99144 ?auto_99147 ) ) ( not ( = ?auto_99144 ?auto_99148 ) ) ( not ( = ?auto_99144 ?auto_99149 ) ) ( not ( = ?auto_99144 ?auto_99150 ) ) ( not ( = ?auto_99144 ?auto_99151 ) ) ( not ( = ?auto_99144 ?auto_99152 ) ) ( not ( = ?auto_99145 ?auto_99146 ) ) ( not ( = ?auto_99145 ?auto_99147 ) ) ( not ( = ?auto_99145 ?auto_99148 ) ) ( not ( = ?auto_99145 ?auto_99149 ) ) ( not ( = ?auto_99145 ?auto_99150 ) ) ( not ( = ?auto_99145 ?auto_99151 ) ) ( not ( = ?auto_99145 ?auto_99152 ) ) ( not ( = ?auto_99146 ?auto_99147 ) ) ( not ( = ?auto_99146 ?auto_99148 ) ) ( not ( = ?auto_99146 ?auto_99149 ) ) ( not ( = ?auto_99146 ?auto_99150 ) ) ( not ( = ?auto_99146 ?auto_99151 ) ) ( not ( = ?auto_99146 ?auto_99152 ) ) ( not ( = ?auto_99147 ?auto_99148 ) ) ( not ( = ?auto_99147 ?auto_99149 ) ) ( not ( = ?auto_99147 ?auto_99150 ) ) ( not ( = ?auto_99147 ?auto_99151 ) ) ( not ( = ?auto_99147 ?auto_99152 ) ) ( not ( = ?auto_99148 ?auto_99149 ) ) ( not ( = ?auto_99148 ?auto_99150 ) ) ( not ( = ?auto_99148 ?auto_99151 ) ) ( not ( = ?auto_99148 ?auto_99152 ) ) ( not ( = ?auto_99149 ?auto_99150 ) ) ( not ( = ?auto_99149 ?auto_99151 ) ) ( not ( = ?auto_99149 ?auto_99152 ) ) ( not ( = ?auto_99150 ?auto_99151 ) ) ( not ( = ?auto_99150 ?auto_99152 ) ) ( not ( = ?auto_99151 ?auto_99152 ) ) ( ON ?auto_99150 ?auto_99151 ) ( CLEAR ?auto_99148 ) ( ON ?auto_99149 ?auto_99150 ) ( CLEAR ?auto_99149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99144 ?auto_99145 ?auto_99146 ?auto_99147 ?auto_99148 ?auto_99149 )
      ( MAKE-8PILE ?auto_99144 ?auto_99145 ?auto_99146 ?auto_99147 ?auto_99148 ?auto_99149 ?auto_99150 ?auto_99151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99161 - BLOCK
      ?auto_99162 - BLOCK
      ?auto_99163 - BLOCK
      ?auto_99164 - BLOCK
      ?auto_99165 - BLOCK
      ?auto_99166 - BLOCK
      ?auto_99167 - BLOCK
      ?auto_99168 - BLOCK
    )
    :vars
    (
      ?auto_99169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99168 ?auto_99169 ) ( ON-TABLE ?auto_99161 ) ( ON ?auto_99162 ?auto_99161 ) ( ON ?auto_99163 ?auto_99162 ) ( ON ?auto_99164 ?auto_99163 ) ( not ( = ?auto_99161 ?auto_99162 ) ) ( not ( = ?auto_99161 ?auto_99163 ) ) ( not ( = ?auto_99161 ?auto_99164 ) ) ( not ( = ?auto_99161 ?auto_99165 ) ) ( not ( = ?auto_99161 ?auto_99166 ) ) ( not ( = ?auto_99161 ?auto_99167 ) ) ( not ( = ?auto_99161 ?auto_99168 ) ) ( not ( = ?auto_99161 ?auto_99169 ) ) ( not ( = ?auto_99162 ?auto_99163 ) ) ( not ( = ?auto_99162 ?auto_99164 ) ) ( not ( = ?auto_99162 ?auto_99165 ) ) ( not ( = ?auto_99162 ?auto_99166 ) ) ( not ( = ?auto_99162 ?auto_99167 ) ) ( not ( = ?auto_99162 ?auto_99168 ) ) ( not ( = ?auto_99162 ?auto_99169 ) ) ( not ( = ?auto_99163 ?auto_99164 ) ) ( not ( = ?auto_99163 ?auto_99165 ) ) ( not ( = ?auto_99163 ?auto_99166 ) ) ( not ( = ?auto_99163 ?auto_99167 ) ) ( not ( = ?auto_99163 ?auto_99168 ) ) ( not ( = ?auto_99163 ?auto_99169 ) ) ( not ( = ?auto_99164 ?auto_99165 ) ) ( not ( = ?auto_99164 ?auto_99166 ) ) ( not ( = ?auto_99164 ?auto_99167 ) ) ( not ( = ?auto_99164 ?auto_99168 ) ) ( not ( = ?auto_99164 ?auto_99169 ) ) ( not ( = ?auto_99165 ?auto_99166 ) ) ( not ( = ?auto_99165 ?auto_99167 ) ) ( not ( = ?auto_99165 ?auto_99168 ) ) ( not ( = ?auto_99165 ?auto_99169 ) ) ( not ( = ?auto_99166 ?auto_99167 ) ) ( not ( = ?auto_99166 ?auto_99168 ) ) ( not ( = ?auto_99166 ?auto_99169 ) ) ( not ( = ?auto_99167 ?auto_99168 ) ) ( not ( = ?auto_99167 ?auto_99169 ) ) ( not ( = ?auto_99168 ?auto_99169 ) ) ( ON ?auto_99167 ?auto_99168 ) ( ON ?auto_99166 ?auto_99167 ) ( CLEAR ?auto_99164 ) ( ON ?auto_99165 ?auto_99166 ) ( CLEAR ?auto_99165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99161 ?auto_99162 ?auto_99163 ?auto_99164 ?auto_99165 )
      ( MAKE-8PILE ?auto_99161 ?auto_99162 ?auto_99163 ?auto_99164 ?auto_99165 ?auto_99166 ?auto_99167 ?auto_99168 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99178 - BLOCK
      ?auto_99179 - BLOCK
      ?auto_99180 - BLOCK
      ?auto_99181 - BLOCK
      ?auto_99182 - BLOCK
      ?auto_99183 - BLOCK
      ?auto_99184 - BLOCK
      ?auto_99185 - BLOCK
    )
    :vars
    (
      ?auto_99186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99185 ?auto_99186 ) ( ON-TABLE ?auto_99178 ) ( ON ?auto_99179 ?auto_99178 ) ( ON ?auto_99180 ?auto_99179 ) ( ON ?auto_99181 ?auto_99180 ) ( not ( = ?auto_99178 ?auto_99179 ) ) ( not ( = ?auto_99178 ?auto_99180 ) ) ( not ( = ?auto_99178 ?auto_99181 ) ) ( not ( = ?auto_99178 ?auto_99182 ) ) ( not ( = ?auto_99178 ?auto_99183 ) ) ( not ( = ?auto_99178 ?auto_99184 ) ) ( not ( = ?auto_99178 ?auto_99185 ) ) ( not ( = ?auto_99178 ?auto_99186 ) ) ( not ( = ?auto_99179 ?auto_99180 ) ) ( not ( = ?auto_99179 ?auto_99181 ) ) ( not ( = ?auto_99179 ?auto_99182 ) ) ( not ( = ?auto_99179 ?auto_99183 ) ) ( not ( = ?auto_99179 ?auto_99184 ) ) ( not ( = ?auto_99179 ?auto_99185 ) ) ( not ( = ?auto_99179 ?auto_99186 ) ) ( not ( = ?auto_99180 ?auto_99181 ) ) ( not ( = ?auto_99180 ?auto_99182 ) ) ( not ( = ?auto_99180 ?auto_99183 ) ) ( not ( = ?auto_99180 ?auto_99184 ) ) ( not ( = ?auto_99180 ?auto_99185 ) ) ( not ( = ?auto_99180 ?auto_99186 ) ) ( not ( = ?auto_99181 ?auto_99182 ) ) ( not ( = ?auto_99181 ?auto_99183 ) ) ( not ( = ?auto_99181 ?auto_99184 ) ) ( not ( = ?auto_99181 ?auto_99185 ) ) ( not ( = ?auto_99181 ?auto_99186 ) ) ( not ( = ?auto_99182 ?auto_99183 ) ) ( not ( = ?auto_99182 ?auto_99184 ) ) ( not ( = ?auto_99182 ?auto_99185 ) ) ( not ( = ?auto_99182 ?auto_99186 ) ) ( not ( = ?auto_99183 ?auto_99184 ) ) ( not ( = ?auto_99183 ?auto_99185 ) ) ( not ( = ?auto_99183 ?auto_99186 ) ) ( not ( = ?auto_99184 ?auto_99185 ) ) ( not ( = ?auto_99184 ?auto_99186 ) ) ( not ( = ?auto_99185 ?auto_99186 ) ) ( ON ?auto_99184 ?auto_99185 ) ( ON ?auto_99183 ?auto_99184 ) ( CLEAR ?auto_99181 ) ( ON ?auto_99182 ?auto_99183 ) ( CLEAR ?auto_99182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99178 ?auto_99179 ?auto_99180 ?auto_99181 ?auto_99182 )
      ( MAKE-8PILE ?auto_99178 ?auto_99179 ?auto_99180 ?auto_99181 ?auto_99182 ?auto_99183 ?auto_99184 ?auto_99185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99195 - BLOCK
      ?auto_99196 - BLOCK
      ?auto_99197 - BLOCK
      ?auto_99198 - BLOCK
      ?auto_99199 - BLOCK
      ?auto_99200 - BLOCK
      ?auto_99201 - BLOCK
      ?auto_99202 - BLOCK
    )
    :vars
    (
      ?auto_99203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99202 ?auto_99203 ) ( ON-TABLE ?auto_99195 ) ( ON ?auto_99196 ?auto_99195 ) ( ON ?auto_99197 ?auto_99196 ) ( not ( = ?auto_99195 ?auto_99196 ) ) ( not ( = ?auto_99195 ?auto_99197 ) ) ( not ( = ?auto_99195 ?auto_99198 ) ) ( not ( = ?auto_99195 ?auto_99199 ) ) ( not ( = ?auto_99195 ?auto_99200 ) ) ( not ( = ?auto_99195 ?auto_99201 ) ) ( not ( = ?auto_99195 ?auto_99202 ) ) ( not ( = ?auto_99195 ?auto_99203 ) ) ( not ( = ?auto_99196 ?auto_99197 ) ) ( not ( = ?auto_99196 ?auto_99198 ) ) ( not ( = ?auto_99196 ?auto_99199 ) ) ( not ( = ?auto_99196 ?auto_99200 ) ) ( not ( = ?auto_99196 ?auto_99201 ) ) ( not ( = ?auto_99196 ?auto_99202 ) ) ( not ( = ?auto_99196 ?auto_99203 ) ) ( not ( = ?auto_99197 ?auto_99198 ) ) ( not ( = ?auto_99197 ?auto_99199 ) ) ( not ( = ?auto_99197 ?auto_99200 ) ) ( not ( = ?auto_99197 ?auto_99201 ) ) ( not ( = ?auto_99197 ?auto_99202 ) ) ( not ( = ?auto_99197 ?auto_99203 ) ) ( not ( = ?auto_99198 ?auto_99199 ) ) ( not ( = ?auto_99198 ?auto_99200 ) ) ( not ( = ?auto_99198 ?auto_99201 ) ) ( not ( = ?auto_99198 ?auto_99202 ) ) ( not ( = ?auto_99198 ?auto_99203 ) ) ( not ( = ?auto_99199 ?auto_99200 ) ) ( not ( = ?auto_99199 ?auto_99201 ) ) ( not ( = ?auto_99199 ?auto_99202 ) ) ( not ( = ?auto_99199 ?auto_99203 ) ) ( not ( = ?auto_99200 ?auto_99201 ) ) ( not ( = ?auto_99200 ?auto_99202 ) ) ( not ( = ?auto_99200 ?auto_99203 ) ) ( not ( = ?auto_99201 ?auto_99202 ) ) ( not ( = ?auto_99201 ?auto_99203 ) ) ( not ( = ?auto_99202 ?auto_99203 ) ) ( ON ?auto_99201 ?auto_99202 ) ( ON ?auto_99200 ?auto_99201 ) ( ON ?auto_99199 ?auto_99200 ) ( CLEAR ?auto_99197 ) ( ON ?auto_99198 ?auto_99199 ) ( CLEAR ?auto_99198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99195 ?auto_99196 ?auto_99197 ?auto_99198 )
      ( MAKE-8PILE ?auto_99195 ?auto_99196 ?auto_99197 ?auto_99198 ?auto_99199 ?auto_99200 ?auto_99201 ?auto_99202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99212 - BLOCK
      ?auto_99213 - BLOCK
      ?auto_99214 - BLOCK
      ?auto_99215 - BLOCK
      ?auto_99216 - BLOCK
      ?auto_99217 - BLOCK
      ?auto_99218 - BLOCK
      ?auto_99219 - BLOCK
    )
    :vars
    (
      ?auto_99220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99219 ?auto_99220 ) ( ON-TABLE ?auto_99212 ) ( ON ?auto_99213 ?auto_99212 ) ( ON ?auto_99214 ?auto_99213 ) ( not ( = ?auto_99212 ?auto_99213 ) ) ( not ( = ?auto_99212 ?auto_99214 ) ) ( not ( = ?auto_99212 ?auto_99215 ) ) ( not ( = ?auto_99212 ?auto_99216 ) ) ( not ( = ?auto_99212 ?auto_99217 ) ) ( not ( = ?auto_99212 ?auto_99218 ) ) ( not ( = ?auto_99212 ?auto_99219 ) ) ( not ( = ?auto_99212 ?auto_99220 ) ) ( not ( = ?auto_99213 ?auto_99214 ) ) ( not ( = ?auto_99213 ?auto_99215 ) ) ( not ( = ?auto_99213 ?auto_99216 ) ) ( not ( = ?auto_99213 ?auto_99217 ) ) ( not ( = ?auto_99213 ?auto_99218 ) ) ( not ( = ?auto_99213 ?auto_99219 ) ) ( not ( = ?auto_99213 ?auto_99220 ) ) ( not ( = ?auto_99214 ?auto_99215 ) ) ( not ( = ?auto_99214 ?auto_99216 ) ) ( not ( = ?auto_99214 ?auto_99217 ) ) ( not ( = ?auto_99214 ?auto_99218 ) ) ( not ( = ?auto_99214 ?auto_99219 ) ) ( not ( = ?auto_99214 ?auto_99220 ) ) ( not ( = ?auto_99215 ?auto_99216 ) ) ( not ( = ?auto_99215 ?auto_99217 ) ) ( not ( = ?auto_99215 ?auto_99218 ) ) ( not ( = ?auto_99215 ?auto_99219 ) ) ( not ( = ?auto_99215 ?auto_99220 ) ) ( not ( = ?auto_99216 ?auto_99217 ) ) ( not ( = ?auto_99216 ?auto_99218 ) ) ( not ( = ?auto_99216 ?auto_99219 ) ) ( not ( = ?auto_99216 ?auto_99220 ) ) ( not ( = ?auto_99217 ?auto_99218 ) ) ( not ( = ?auto_99217 ?auto_99219 ) ) ( not ( = ?auto_99217 ?auto_99220 ) ) ( not ( = ?auto_99218 ?auto_99219 ) ) ( not ( = ?auto_99218 ?auto_99220 ) ) ( not ( = ?auto_99219 ?auto_99220 ) ) ( ON ?auto_99218 ?auto_99219 ) ( ON ?auto_99217 ?auto_99218 ) ( ON ?auto_99216 ?auto_99217 ) ( CLEAR ?auto_99214 ) ( ON ?auto_99215 ?auto_99216 ) ( CLEAR ?auto_99215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99212 ?auto_99213 ?auto_99214 ?auto_99215 )
      ( MAKE-8PILE ?auto_99212 ?auto_99213 ?auto_99214 ?auto_99215 ?auto_99216 ?auto_99217 ?auto_99218 ?auto_99219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99229 - BLOCK
      ?auto_99230 - BLOCK
      ?auto_99231 - BLOCK
      ?auto_99232 - BLOCK
      ?auto_99233 - BLOCK
      ?auto_99234 - BLOCK
      ?auto_99235 - BLOCK
      ?auto_99236 - BLOCK
    )
    :vars
    (
      ?auto_99237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99236 ?auto_99237 ) ( ON-TABLE ?auto_99229 ) ( ON ?auto_99230 ?auto_99229 ) ( not ( = ?auto_99229 ?auto_99230 ) ) ( not ( = ?auto_99229 ?auto_99231 ) ) ( not ( = ?auto_99229 ?auto_99232 ) ) ( not ( = ?auto_99229 ?auto_99233 ) ) ( not ( = ?auto_99229 ?auto_99234 ) ) ( not ( = ?auto_99229 ?auto_99235 ) ) ( not ( = ?auto_99229 ?auto_99236 ) ) ( not ( = ?auto_99229 ?auto_99237 ) ) ( not ( = ?auto_99230 ?auto_99231 ) ) ( not ( = ?auto_99230 ?auto_99232 ) ) ( not ( = ?auto_99230 ?auto_99233 ) ) ( not ( = ?auto_99230 ?auto_99234 ) ) ( not ( = ?auto_99230 ?auto_99235 ) ) ( not ( = ?auto_99230 ?auto_99236 ) ) ( not ( = ?auto_99230 ?auto_99237 ) ) ( not ( = ?auto_99231 ?auto_99232 ) ) ( not ( = ?auto_99231 ?auto_99233 ) ) ( not ( = ?auto_99231 ?auto_99234 ) ) ( not ( = ?auto_99231 ?auto_99235 ) ) ( not ( = ?auto_99231 ?auto_99236 ) ) ( not ( = ?auto_99231 ?auto_99237 ) ) ( not ( = ?auto_99232 ?auto_99233 ) ) ( not ( = ?auto_99232 ?auto_99234 ) ) ( not ( = ?auto_99232 ?auto_99235 ) ) ( not ( = ?auto_99232 ?auto_99236 ) ) ( not ( = ?auto_99232 ?auto_99237 ) ) ( not ( = ?auto_99233 ?auto_99234 ) ) ( not ( = ?auto_99233 ?auto_99235 ) ) ( not ( = ?auto_99233 ?auto_99236 ) ) ( not ( = ?auto_99233 ?auto_99237 ) ) ( not ( = ?auto_99234 ?auto_99235 ) ) ( not ( = ?auto_99234 ?auto_99236 ) ) ( not ( = ?auto_99234 ?auto_99237 ) ) ( not ( = ?auto_99235 ?auto_99236 ) ) ( not ( = ?auto_99235 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99237 ) ) ( ON ?auto_99235 ?auto_99236 ) ( ON ?auto_99234 ?auto_99235 ) ( ON ?auto_99233 ?auto_99234 ) ( ON ?auto_99232 ?auto_99233 ) ( CLEAR ?auto_99230 ) ( ON ?auto_99231 ?auto_99232 ) ( CLEAR ?auto_99231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99229 ?auto_99230 ?auto_99231 )
      ( MAKE-8PILE ?auto_99229 ?auto_99230 ?auto_99231 ?auto_99232 ?auto_99233 ?auto_99234 ?auto_99235 ?auto_99236 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99246 - BLOCK
      ?auto_99247 - BLOCK
      ?auto_99248 - BLOCK
      ?auto_99249 - BLOCK
      ?auto_99250 - BLOCK
      ?auto_99251 - BLOCK
      ?auto_99252 - BLOCK
      ?auto_99253 - BLOCK
    )
    :vars
    (
      ?auto_99254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99253 ?auto_99254 ) ( ON-TABLE ?auto_99246 ) ( ON ?auto_99247 ?auto_99246 ) ( not ( = ?auto_99246 ?auto_99247 ) ) ( not ( = ?auto_99246 ?auto_99248 ) ) ( not ( = ?auto_99246 ?auto_99249 ) ) ( not ( = ?auto_99246 ?auto_99250 ) ) ( not ( = ?auto_99246 ?auto_99251 ) ) ( not ( = ?auto_99246 ?auto_99252 ) ) ( not ( = ?auto_99246 ?auto_99253 ) ) ( not ( = ?auto_99246 ?auto_99254 ) ) ( not ( = ?auto_99247 ?auto_99248 ) ) ( not ( = ?auto_99247 ?auto_99249 ) ) ( not ( = ?auto_99247 ?auto_99250 ) ) ( not ( = ?auto_99247 ?auto_99251 ) ) ( not ( = ?auto_99247 ?auto_99252 ) ) ( not ( = ?auto_99247 ?auto_99253 ) ) ( not ( = ?auto_99247 ?auto_99254 ) ) ( not ( = ?auto_99248 ?auto_99249 ) ) ( not ( = ?auto_99248 ?auto_99250 ) ) ( not ( = ?auto_99248 ?auto_99251 ) ) ( not ( = ?auto_99248 ?auto_99252 ) ) ( not ( = ?auto_99248 ?auto_99253 ) ) ( not ( = ?auto_99248 ?auto_99254 ) ) ( not ( = ?auto_99249 ?auto_99250 ) ) ( not ( = ?auto_99249 ?auto_99251 ) ) ( not ( = ?auto_99249 ?auto_99252 ) ) ( not ( = ?auto_99249 ?auto_99253 ) ) ( not ( = ?auto_99249 ?auto_99254 ) ) ( not ( = ?auto_99250 ?auto_99251 ) ) ( not ( = ?auto_99250 ?auto_99252 ) ) ( not ( = ?auto_99250 ?auto_99253 ) ) ( not ( = ?auto_99250 ?auto_99254 ) ) ( not ( = ?auto_99251 ?auto_99252 ) ) ( not ( = ?auto_99251 ?auto_99253 ) ) ( not ( = ?auto_99251 ?auto_99254 ) ) ( not ( = ?auto_99252 ?auto_99253 ) ) ( not ( = ?auto_99252 ?auto_99254 ) ) ( not ( = ?auto_99253 ?auto_99254 ) ) ( ON ?auto_99252 ?auto_99253 ) ( ON ?auto_99251 ?auto_99252 ) ( ON ?auto_99250 ?auto_99251 ) ( ON ?auto_99249 ?auto_99250 ) ( CLEAR ?auto_99247 ) ( ON ?auto_99248 ?auto_99249 ) ( CLEAR ?auto_99248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99246 ?auto_99247 ?auto_99248 )
      ( MAKE-8PILE ?auto_99246 ?auto_99247 ?auto_99248 ?auto_99249 ?auto_99250 ?auto_99251 ?auto_99252 ?auto_99253 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99263 - BLOCK
      ?auto_99264 - BLOCK
      ?auto_99265 - BLOCK
      ?auto_99266 - BLOCK
      ?auto_99267 - BLOCK
      ?auto_99268 - BLOCK
      ?auto_99269 - BLOCK
      ?auto_99270 - BLOCK
    )
    :vars
    (
      ?auto_99271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99270 ?auto_99271 ) ( ON-TABLE ?auto_99263 ) ( not ( = ?auto_99263 ?auto_99264 ) ) ( not ( = ?auto_99263 ?auto_99265 ) ) ( not ( = ?auto_99263 ?auto_99266 ) ) ( not ( = ?auto_99263 ?auto_99267 ) ) ( not ( = ?auto_99263 ?auto_99268 ) ) ( not ( = ?auto_99263 ?auto_99269 ) ) ( not ( = ?auto_99263 ?auto_99270 ) ) ( not ( = ?auto_99263 ?auto_99271 ) ) ( not ( = ?auto_99264 ?auto_99265 ) ) ( not ( = ?auto_99264 ?auto_99266 ) ) ( not ( = ?auto_99264 ?auto_99267 ) ) ( not ( = ?auto_99264 ?auto_99268 ) ) ( not ( = ?auto_99264 ?auto_99269 ) ) ( not ( = ?auto_99264 ?auto_99270 ) ) ( not ( = ?auto_99264 ?auto_99271 ) ) ( not ( = ?auto_99265 ?auto_99266 ) ) ( not ( = ?auto_99265 ?auto_99267 ) ) ( not ( = ?auto_99265 ?auto_99268 ) ) ( not ( = ?auto_99265 ?auto_99269 ) ) ( not ( = ?auto_99265 ?auto_99270 ) ) ( not ( = ?auto_99265 ?auto_99271 ) ) ( not ( = ?auto_99266 ?auto_99267 ) ) ( not ( = ?auto_99266 ?auto_99268 ) ) ( not ( = ?auto_99266 ?auto_99269 ) ) ( not ( = ?auto_99266 ?auto_99270 ) ) ( not ( = ?auto_99266 ?auto_99271 ) ) ( not ( = ?auto_99267 ?auto_99268 ) ) ( not ( = ?auto_99267 ?auto_99269 ) ) ( not ( = ?auto_99267 ?auto_99270 ) ) ( not ( = ?auto_99267 ?auto_99271 ) ) ( not ( = ?auto_99268 ?auto_99269 ) ) ( not ( = ?auto_99268 ?auto_99270 ) ) ( not ( = ?auto_99268 ?auto_99271 ) ) ( not ( = ?auto_99269 ?auto_99270 ) ) ( not ( = ?auto_99269 ?auto_99271 ) ) ( not ( = ?auto_99270 ?auto_99271 ) ) ( ON ?auto_99269 ?auto_99270 ) ( ON ?auto_99268 ?auto_99269 ) ( ON ?auto_99267 ?auto_99268 ) ( ON ?auto_99266 ?auto_99267 ) ( ON ?auto_99265 ?auto_99266 ) ( CLEAR ?auto_99263 ) ( ON ?auto_99264 ?auto_99265 ) ( CLEAR ?auto_99264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99263 ?auto_99264 )
      ( MAKE-8PILE ?auto_99263 ?auto_99264 ?auto_99265 ?auto_99266 ?auto_99267 ?auto_99268 ?auto_99269 ?auto_99270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99280 - BLOCK
      ?auto_99281 - BLOCK
      ?auto_99282 - BLOCK
      ?auto_99283 - BLOCK
      ?auto_99284 - BLOCK
      ?auto_99285 - BLOCK
      ?auto_99286 - BLOCK
      ?auto_99287 - BLOCK
    )
    :vars
    (
      ?auto_99288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99287 ?auto_99288 ) ( ON-TABLE ?auto_99280 ) ( not ( = ?auto_99280 ?auto_99281 ) ) ( not ( = ?auto_99280 ?auto_99282 ) ) ( not ( = ?auto_99280 ?auto_99283 ) ) ( not ( = ?auto_99280 ?auto_99284 ) ) ( not ( = ?auto_99280 ?auto_99285 ) ) ( not ( = ?auto_99280 ?auto_99286 ) ) ( not ( = ?auto_99280 ?auto_99287 ) ) ( not ( = ?auto_99280 ?auto_99288 ) ) ( not ( = ?auto_99281 ?auto_99282 ) ) ( not ( = ?auto_99281 ?auto_99283 ) ) ( not ( = ?auto_99281 ?auto_99284 ) ) ( not ( = ?auto_99281 ?auto_99285 ) ) ( not ( = ?auto_99281 ?auto_99286 ) ) ( not ( = ?auto_99281 ?auto_99287 ) ) ( not ( = ?auto_99281 ?auto_99288 ) ) ( not ( = ?auto_99282 ?auto_99283 ) ) ( not ( = ?auto_99282 ?auto_99284 ) ) ( not ( = ?auto_99282 ?auto_99285 ) ) ( not ( = ?auto_99282 ?auto_99286 ) ) ( not ( = ?auto_99282 ?auto_99287 ) ) ( not ( = ?auto_99282 ?auto_99288 ) ) ( not ( = ?auto_99283 ?auto_99284 ) ) ( not ( = ?auto_99283 ?auto_99285 ) ) ( not ( = ?auto_99283 ?auto_99286 ) ) ( not ( = ?auto_99283 ?auto_99287 ) ) ( not ( = ?auto_99283 ?auto_99288 ) ) ( not ( = ?auto_99284 ?auto_99285 ) ) ( not ( = ?auto_99284 ?auto_99286 ) ) ( not ( = ?auto_99284 ?auto_99287 ) ) ( not ( = ?auto_99284 ?auto_99288 ) ) ( not ( = ?auto_99285 ?auto_99286 ) ) ( not ( = ?auto_99285 ?auto_99287 ) ) ( not ( = ?auto_99285 ?auto_99288 ) ) ( not ( = ?auto_99286 ?auto_99287 ) ) ( not ( = ?auto_99286 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( ON ?auto_99286 ?auto_99287 ) ( ON ?auto_99285 ?auto_99286 ) ( ON ?auto_99284 ?auto_99285 ) ( ON ?auto_99283 ?auto_99284 ) ( ON ?auto_99282 ?auto_99283 ) ( CLEAR ?auto_99280 ) ( ON ?auto_99281 ?auto_99282 ) ( CLEAR ?auto_99281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99280 ?auto_99281 )
      ( MAKE-8PILE ?auto_99280 ?auto_99281 ?auto_99282 ?auto_99283 ?auto_99284 ?auto_99285 ?auto_99286 ?auto_99287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99297 - BLOCK
      ?auto_99298 - BLOCK
      ?auto_99299 - BLOCK
      ?auto_99300 - BLOCK
      ?auto_99301 - BLOCK
      ?auto_99302 - BLOCK
      ?auto_99303 - BLOCK
      ?auto_99304 - BLOCK
    )
    :vars
    (
      ?auto_99305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99304 ?auto_99305 ) ( not ( = ?auto_99297 ?auto_99298 ) ) ( not ( = ?auto_99297 ?auto_99299 ) ) ( not ( = ?auto_99297 ?auto_99300 ) ) ( not ( = ?auto_99297 ?auto_99301 ) ) ( not ( = ?auto_99297 ?auto_99302 ) ) ( not ( = ?auto_99297 ?auto_99303 ) ) ( not ( = ?auto_99297 ?auto_99304 ) ) ( not ( = ?auto_99297 ?auto_99305 ) ) ( not ( = ?auto_99298 ?auto_99299 ) ) ( not ( = ?auto_99298 ?auto_99300 ) ) ( not ( = ?auto_99298 ?auto_99301 ) ) ( not ( = ?auto_99298 ?auto_99302 ) ) ( not ( = ?auto_99298 ?auto_99303 ) ) ( not ( = ?auto_99298 ?auto_99304 ) ) ( not ( = ?auto_99298 ?auto_99305 ) ) ( not ( = ?auto_99299 ?auto_99300 ) ) ( not ( = ?auto_99299 ?auto_99301 ) ) ( not ( = ?auto_99299 ?auto_99302 ) ) ( not ( = ?auto_99299 ?auto_99303 ) ) ( not ( = ?auto_99299 ?auto_99304 ) ) ( not ( = ?auto_99299 ?auto_99305 ) ) ( not ( = ?auto_99300 ?auto_99301 ) ) ( not ( = ?auto_99300 ?auto_99302 ) ) ( not ( = ?auto_99300 ?auto_99303 ) ) ( not ( = ?auto_99300 ?auto_99304 ) ) ( not ( = ?auto_99300 ?auto_99305 ) ) ( not ( = ?auto_99301 ?auto_99302 ) ) ( not ( = ?auto_99301 ?auto_99303 ) ) ( not ( = ?auto_99301 ?auto_99304 ) ) ( not ( = ?auto_99301 ?auto_99305 ) ) ( not ( = ?auto_99302 ?auto_99303 ) ) ( not ( = ?auto_99302 ?auto_99304 ) ) ( not ( = ?auto_99302 ?auto_99305 ) ) ( not ( = ?auto_99303 ?auto_99304 ) ) ( not ( = ?auto_99303 ?auto_99305 ) ) ( not ( = ?auto_99304 ?auto_99305 ) ) ( ON ?auto_99303 ?auto_99304 ) ( ON ?auto_99302 ?auto_99303 ) ( ON ?auto_99301 ?auto_99302 ) ( ON ?auto_99300 ?auto_99301 ) ( ON ?auto_99299 ?auto_99300 ) ( ON ?auto_99298 ?auto_99299 ) ( ON ?auto_99297 ?auto_99298 ) ( CLEAR ?auto_99297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99297 )
      ( MAKE-8PILE ?auto_99297 ?auto_99298 ?auto_99299 ?auto_99300 ?auto_99301 ?auto_99302 ?auto_99303 ?auto_99304 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_99314 - BLOCK
      ?auto_99315 - BLOCK
      ?auto_99316 - BLOCK
      ?auto_99317 - BLOCK
      ?auto_99318 - BLOCK
      ?auto_99319 - BLOCK
      ?auto_99320 - BLOCK
      ?auto_99321 - BLOCK
    )
    :vars
    (
      ?auto_99322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99321 ?auto_99322 ) ( not ( = ?auto_99314 ?auto_99315 ) ) ( not ( = ?auto_99314 ?auto_99316 ) ) ( not ( = ?auto_99314 ?auto_99317 ) ) ( not ( = ?auto_99314 ?auto_99318 ) ) ( not ( = ?auto_99314 ?auto_99319 ) ) ( not ( = ?auto_99314 ?auto_99320 ) ) ( not ( = ?auto_99314 ?auto_99321 ) ) ( not ( = ?auto_99314 ?auto_99322 ) ) ( not ( = ?auto_99315 ?auto_99316 ) ) ( not ( = ?auto_99315 ?auto_99317 ) ) ( not ( = ?auto_99315 ?auto_99318 ) ) ( not ( = ?auto_99315 ?auto_99319 ) ) ( not ( = ?auto_99315 ?auto_99320 ) ) ( not ( = ?auto_99315 ?auto_99321 ) ) ( not ( = ?auto_99315 ?auto_99322 ) ) ( not ( = ?auto_99316 ?auto_99317 ) ) ( not ( = ?auto_99316 ?auto_99318 ) ) ( not ( = ?auto_99316 ?auto_99319 ) ) ( not ( = ?auto_99316 ?auto_99320 ) ) ( not ( = ?auto_99316 ?auto_99321 ) ) ( not ( = ?auto_99316 ?auto_99322 ) ) ( not ( = ?auto_99317 ?auto_99318 ) ) ( not ( = ?auto_99317 ?auto_99319 ) ) ( not ( = ?auto_99317 ?auto_99320 ) ) ( not ( = ?auto_99317 ?auto_99321 ) ) ( not ( = ?auto_99317 ?auto_99322 ) ) ( not ( = ?auto_99318 ?auto_99319 ) ) ( not ( = ?auto_99318 ?auto_99320 ) ) ( not ( = ?auto_99318 ?auto_99321 ) ) ( not ( = ?auto_99318 ?auto_99322 ) ) ( not ( = ?auto_99319 ?auto_99320 ) ) ( not ( = ?auto_99319 ?auto_99321 ) ) ( not ( = ?auto_99319 ?auto_99322 ) ) ( not ( = ?auto_99320 ?auto_99321 ) ) ( not ( = ?auto_99320 ?auto_99322 ) ) ( not ( = ?auto_99321 ?auto_99322 ) ) ( ON ?auto_99320 ?auto_99321 ) ( ON ?auto_99319 ?auto_99320 ) ( ON ?auto_99318 ?auto_99319 ) ( ON ?auto_99317 ?auto_99318 ) ( ON ?auto_99316 ?auto_99317 ) ( ON ?auto_99315 ?auto_99316 ) ( ON ?auto_99314 ?auto_99315 ) ( CLEAR ?auto_99314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99314 )
      ( MAKE-8PILE ?auto_99314 ?auto_99315 ?auto_99316 ?auto_99317 ?auto_99318 ?auto_99319 ?auto_99320 ?auto_99321 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99332 - BLOCK
      ?auto_99333 - BLOCK
      ?auto_99334 - BLOCK
      ?auto_99335 - BLOCK
      ?auto_99336 - BLOCK
      ?auto_99337 - BLOCK
      ?auto_99338 - BLOCK
      ?auto_99339 - BLOCK
      ?auto_99340 - BLOCK
    )
    :vars
    (
      ?auto_99341 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99339 ) ( ON ?auto_99340 ?auto_99341 ) ( CLEAR ?auto_99340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99332 ) ( ON ?auto_99333 ?auto_99332 ) ( ON ?auto_99334 ?auto_99333 ) ( ON ?auto_99335 ?auto_99334 ) ( ON ?auto_99336 ?auto_99335 ) ( ON ?auto_99337 ?auto_99336 ) ( ON ?auto_99338 ?auto_99337 ) ( ON ?auto_99339 ?auto_99338 ) ( not ( = ?auto_99332 ?auto_99333 ) ) ( not ( = ?auto_99332 ?auto_99334 ) ) ( not ( = ?auto_99332 ?auto_99335 ) ) ( not ( = ?auto_99332 ?auto_99336 ) ) ( not ( = ?auto_99332 ?auto_99337 ) ) ( not ( = ?auto_99332 ?auto_99338 ) ) ( not ( = ?auto_99332 ?auto_99339 ) ) ( not ( = ?auto_99332 ?auto_99340 ) ) ( not ( = ?auto_99332 ?auto_99341 ) ) ( not ( = ?auto_99333 ?auto_99334 ) ) ( not ( = ?auto_99333 ?auto_99335 ) ) ( not ( = ?auto_99333 ?auto_99336 ) ) ( not ( = ?auto_99333 ?auto_99337 ) ) ( not ( = ?auto_99333 ?auto_99338 ) ) ( not ( = ?auto_99333 ?auto_99339 ) ) ( not ( = ?auto_99333 ?auto_99340 ) ) ( not ( = ?auto_99333 ?auto_99341 ) ) ( not ( = ?auto_99334 ?auto_99335 ) ) ( not ( = ?auto_99334 ?auto_99336 ) ) ( not ( = ?auto_99334 ?auto_99337 ) ) ( not ( = ?auto_99334 ?auto_99338 ) ) ( not ( = ?auto_99334 ?auto_99339 ) ) ( not ( = ?auto_99334 ?auto_99340 ) ) ( not ( = ?auto_99334 ?auto_99341 ) ) ( not ( = ?auto_99335 ?auto_99336 ) ) ( not ( = ?auto_99335 ?auto_99337 ) ) ( not ( = ?auto_99335 ?auto_99338 ) ) ( not ( = ?auto_99335 ?auto_99339 ) ) ( not ( = ?auto_99335 ?auto_99340 ) ) ( not ( = ?auto_99335 ?auto_99341 ) ) ( not ( = ?auto_99336 ?auto_99337 ) ) ( not ( = ?auto_99336 ?auto_99338 ) ) ( not ( = ?auto_99336 ?auto_99339 ) ) ( not ( = ?auto_99336 ?auto_99340 ) ) ( not ( = ?auto_99336 ?auto_99341 ) ) ( not ( = ?auto_99337 ?auto_99338 ) ) ( not ( = ?auto_99337 ?auto_99339 ) ) ( not ( = ?auto_99337 ?auto_99340 ) ) ( not ( = ?auto_99337 ?auto_99341 ) ) ( not ( = ?auto_99338 ?auto_99339 ) ) ( not ( = ?auto_99338 ?auto_99340 ) ) ( not ( = ?auto_99338 ?auto_99341 ) ) ( not ( = ?auto_99339 ?auto_99340 ) ) ( not ( = ?auto_99339 ?auto_99341 ) ) ( not ( = ?auto_99340 ?auto_99341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99340 ?auto_99341 )
      ( !STACK ?auto_99340 ?auto_99339 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99351 - BLOCK
      ?auto_99352 - BLOCK
      ?auto_99353 - BLOCK
      ?auto_99354 - BLOCK
      ?auto_99355 - BLOCK
      ?auto_99356 - BLOCK
      ?auto_99357 - BLOCK
      ?auto_99358 - BLOCK
      ?auto_99359 - BLOCK
    )
    :vars
    (
      ?auto_99360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99358 ) ( ON ?auto_99359 ?auto_99360 ) ( CLEAR ?auto_99359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99351 ) ( ON ?auto_99352 ?auto_99351 ) ( ON ?auto_99353 ?auto_99352 ) ( ON ?auto_99354 ?auto_99353 ) ( ON ?auto_99355 ?auto_99354 ) ( ON ?auto_99356 ?auto_99355 ) ( ON ?auto_99357 ?auto_99356 ) ( ON ?auto_99358 ?auto_99357 ) ( not ( = ?auto_99351 ?auto_99352 ) ) ( not ( = ?auto_99351 ?auto_99353 ) ) ( not ( = ?auto_99351 ?auto_99354 ) ) ( not ( = ?auto_99351 ?auto_99355 ) ) ( not ( = ?auto_99351 ?auto_99356 ) ) ( not ( = ?auto_99351 ?auto_99357 ) ) ( not ( = ?auto_99351 ?auto_99358 ) ) ( not ( = ?auto_99351 ?auto_99359 ) ) ( not ( = ?auto_99351 ?auto_99360 ) ) ( not ( = ?auto_99352 ?auto_99353 ) ) ( not ( = ?auto_99352 ?auto_99354 ) ) ( not ( = ?auto_99352 ?auto_99355 ) ) ( not ( = ?auto_99352 ?auto_99356 ) ) ( not ( = ?auto_99352 ?auto_99357 ) ) ( not ( = ?auto_99352 ?auto_99358 ) ) ( not ( = ?auto_99352 ?auto_99359 ) ) ( not ( = ?auto_99352 ?auto_99360 ) ) ( not ( = ?auto_99353 ?auto_99354 ) ) ( not ( = ?auto_99353 ?auto_99355 ) ) ( not ( = ?auto_99353 ?auto_99356 ) ) ( not ( = ?auto_99353 ?auto_99357 ) ) ( not ( = ?auto_99353 ?auto_99358 ) ) ( not ( = ?auto_99353 ?auto_99359 ) ) ( not ( = ?auto_99353 ?auto_99360 ) ) ( not ( = ?auto_99354 ?auto_99355 ) ) ( not ( = ?auto_99354 ?auto_99356 ) ) ( not ( = ?auto_99354 ?auto_99357 ) ) ( not ( = ?auto_99354 ?auto_99358 ) ) ( not ( = ?auto_99354 ?auto_99359 ) ) ( not ( = ?auto_99354 ?auto_99360 ) ) ( not ( = ?auto_99355 ?auto_99356 ) ) ( not ( = ?auto_99355 ?auto_99357 ) ) ( not ( = ?auto_99355 ?auto_99358 ) ) ( not ( = ?auto_99355 ?auto_99359 ) ) ( not ( = ?auto_99355 ?auto_99360 ) ) ( not ( = ?auto_99356 ?auto_99357 ) ) ( not ( = ?auto_99356 ?auto_99358 ) ) ( not ( = ?auto_99356 ?auto_99359 ) ) ( not ( = ?auto_99356 ?auto_99360 ) ) ( not ( = ?auto_99357 ?auto_99358 ) ) ( not ( = ?auto_99357 ?auto_99359 ) ) ( not ( = ?auto_99357 ?auto_99360 ) ) ( not ( = ?auto_99358 ?auto_99359 ) ) ( not ( = ?auto_99358 ?auto_99360 ) ) ( not ( = ?auto_99359 ?auto_99360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99359 ?auto_99360 )
      ( !STACK ?auto_99359 ?auto_99358 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99370 - BLOCK
      ?auto_99371 - BLOCK
      ?auto_99372 - BLOCK
      ?auto_99373 - BLOCK
      ?auto_99374 - BLOCK
      ?auto_99375 - BLOCK
      ?auto_99376 - BLOCK
      ?auto_99377 - BLOCK
      ?auto_99378 - BLOCK
    )
    :vars
    (
      ?auto_99379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99378 ?auto_99379 ) ( ON-TABLE ?auto_99370 ) ( ON ?auto_99371 ?auto_99370 ) ( ON ?auto_99372 ?auto_99371 ) ( ON ?auto_99373 ?auto_99372 ) ( ON ?auto_99374 ?auto_99373 ) ( ON ?auto_99375 ?auto_99374 ) ( ON ?auto_99376 ?auto_99375 ) ( not ( = ?auto_99370 ?auto_99371 ) ) ( not ( = ?auto_99370 ?auto_99372 ) ) ( not ( = ?auto_99370 ?auto_99373 ) ) ( not ( = ?auto_99370 ?auto_99374 ) ) ( not ( = ?auto_99370 ?auto_99375 ) ) ( not ( = ?auto_99370 ?auto_99376 ) ) ( not ( = ?auto_99370 ?auto_99377 ) ) ( not ( = ?auto_99370 ?auto_99378 ) ) ( not ( = ?auto_99370 ?auto_99379 ) ) ( not ( = ?auto_99371 ?auto_99372 ) ) ( not ( = ?auto_99371 ?auto_99373 ) ) ( not ( = ?auto_99371 ?auto_99374 ) ) ( not ( = ?auto_99371 ?auto_99375 ) ) ( not ( = ?auto_99371 ?auto_99376 ) ) ( not ( = ?auto_99371 ?auto_99377 ) ) ( not ( = ?auto_99371 ?auto_99378 ) ) ( not ( = ?auto_99371 ?auto_99379 ) ) ( not ( = ?auto_99372 ?auto_99373 ) ) ( not ( = ?auto_99372 ?auto_99374 ) ) ( not ( = ?auto_99372 ?auto_99375 ) ) ( not ( = ?auto_99372 ?auto_99376 ) ) ( not ( = ?auto_99372 ?auto_99377 ) ) ( not ( = ?auto_99372 ?auto_99378 ) ) ( not ( = ?auto_99372 ?auto_99379 ) ) ( not ( = ?auto_99373 ?auto_99374 ) ) ( not ( = ?auto_99373 ?auto_99375 ) ) ( not ( = ?auto_99373 ?auto_99376 ) ) ( not ( = ?auto_99373 ?auto_99377 ) ) ( not ( = ?auto_99373 ?auto_99378 ) ) ( not ( = ?auto_99373 ?auto_99379 ) ) ( not ( = ?auto_99374 ?auto_99375 ) ) ( not ( = ?auto_99374 ?auto_99376 ) ) ( not ( = ?auto_99374 ?auto_99377 ) ) ( not ( = ?auto_99374 ?auto_99378 ) ) ( not ( = ?auto_99374 ?auto_99379 ) ) ( not ( = ?auto_99375 ?auto_99376 ) ) ( not ( = ?auto_99375 ?auto_99377 ) ) ( not ( = ?auto_99375 ?auto_99378 ) ) ( not ( = ?auto_99375 ?auto_99379 ) ) ( not ( = ?auto_99376 ?auto_99377 ) ) ( not ( = ?auto_99376 ?auto_99378 ) ) ( not ( = ?auto_99376 ?auto_99379 ) ) ( not ( = ?auto_99377 ?auto_99378 ) ) ( not ( = ?auto_99377 ?auto_99379 ) ) ( not ( = ?auto_99378 ?auto_99379 ) ) ( CLEAR ?auto_99376 ) ( ON ?auto_99377 ?auto_99378 ) ( CLEAR ?auto_99377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_99370 ?auto_99371 ?auto_99372 ?auto_99373 ?auto_99374 ?auto_99375 ?auto_99376 ?auto_99377 )
      ( MAKE-9PILE ?auto_99370 ?auto_99371 ?auto_99372 ?auto_99373 ?auto_99374 ?auto_99375 ?auto_99376 ?auto_99377 ?auto_99378 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99389 - BLOCK
      ?auto_99390 - BLOCK
      ?auto_99391 - BLOCK
      ?auto_99392 - BLOCK
      ?auto_99393 - BLOCK
      ?auto_99394 - BLOCK
      ?auto_99395 - BLOCK
      ?auto_99396 - BLOCK
      ?auto_99397 - BLOCK
    )
    :vars
    (
      ?auto_99398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99397 ?auto_99398 ) ( ON-TABLE ?auto_99389 ) ( ON ?auto_99390 ?auto_99389 ) ( ON ?auto_99391 ?auto_99390 ) ( ON ?auto_99392 ?auto_99391 ) ( ON ?auto_99393 ?auto_99392 ) ( ON ?auto_99394 ?auto_99393 ) ( ON ?auto_99395 ?auto_99394 ) ( not ( = ?auto_99389 ?auto_99390 ) ) ( not ( = ?auto_99389 ?auto_99391 ) ) ( not ( = ?auto_99389 ?auto_99392 ) ) ( not ( = ?auto_99389 ?auto_99393 ) ) ( not ( = ?auto_99389 ?auto_99394 ) ) ( not ( = ?auto_99389 ?auto_99395 ) ) ( not ( = ?auto_99389 ?auto_99396 ) ) ( not ( = ?auto_99389 ?auto_99397 ) ) ( not ( = ?auto_99389 ?auto_99398 ) ) ( not ( = ?auto_99390 ?auto_99391 ) ) ( not ( = ?auto_99390 ?auto_99392 ) ) ( not ( = ?auto_99390 ?auto_99393 ) ) ( not ( = ?auto_99390 ?auto_99394 ) ) ( not ( = ?auto_99390 ?auto_99395 ) ) ( not ( = ?auto_99390 ?auto_99396 ) ) ( not ( = ?auto_99390 ?auto_99397 ) ) ( not ( = ?auto_99390 ?auto_99398 ) ) ( not ( = ?auto_99391 ?auto_99392 ) ) ( not ( = ?auto_99391 ?auto_99393 ) ) ( not ( = ?auto_99391 ?auto_99394 ) ) ( not ( = ?auto_99391 ?auto_99395 ) ) ( not ( = ?auto_99391 ?auto_99396 ) ) ( not ( = ?auto_99391 ?auto_99397 ) ) ( not ( = ?auto_99391 ?auto_99398 ) ) ( not ( = ?auto_99392 ?auto_99393 ) ) ( not ( = ?auto_99392 ?auto_99394 ) ) ( not ( = ?auto_99392 ?auto_99395 ) ) ( not ( = ?auto_99392 ?auto_99396 ) ) ( not ( = ?auto_99392 ?auto_99397 ) ) ( not ( = ?auto_99392 ?auto_99398 ) ) ( not ( = ?auto_99393 ?auto_99394 ) ) ( not ( = ?auto_99393 ?auto_99395 ) ) ( not ( = ?auto_99393 ?auto_99396 ) ) ( not ( = ?auto_99393 ?auto_99397 ) ) ( not ( = ?auto_99393 ?auto_99398 ) ) ( not ( = ?auto_99394 ?auto_99395 ) ) ( not ( = ?auto_99394 ?auto_99396 ) ) ( not ( = ?auto_99394 ?auto_99397 ) ) ( not ( = ?auto_99394 ?auto_99398 ) ) ( not ( = ?auto_99395 ?auto_99396 ) ) ( not ( = ?auto_99395 ?auto_99397 ) ) ( not ( = ?auto_99395 ?auto_99398 ) ) ( not ( = ?auto_99396 ?auto_99397 ) ) ( not ( = ?auto_99396 ?auto_99398 ) ) ( not ( = ?auto_99397 ?auto_99398 ) ) ( CLEAR ?auto_99395 ) ( ON ?auto_99396 ?auto_99397 ) ( CLEAR ?auto_99396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_99389 ?auto_99390 ?auto_99391 ?auto_99392 ?auto_99393 ?auto_99394 ?auto_99395 ?auto_99396 )
      ( MAKE-9PILE ?auto_99389 ?auto_99390 ?auto_99391 ?auto_99392 ?auto_99393 ?auto_99394 ?auto_99395 ?auto_99396 ?auto_99397 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99408 - BLOCK
      ?auto_99409 - BLOCK
      ?auto_99410 - BLOCK
      ?auto_99411 - BLOCK
      ?auto_99412 - BLOCK
      ?auto_99413 - BLOCK
      ?auto_99414 - BLOCK
      ?auto_99415 - BLOCK
      ?auto_99416 - BLOCK
    )
    :vars
    (
      ?auto_99417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99416 ?auto_99417 ) ( ON-TABLE ?auto_99408 ) ( ON ?auto_99409 ?auto_99408 ) ( ON ?auto_99410 ?auto_99409 ) ( ON ?auto_99411 ?auto_99410 ) ( ON ?auto_99412 ?auto_99411 ) ( ON ?auto_99413 ?auto_99412 ) ( not ( = ?auto_99408 ?auto_99409 ) ) ( not ( = ?auto_99408 ?auto_99410 ) ) ( not ( = ?auto_99408 ?auto_99411 ) ) ( not ( = ?auto_99408 ?auto_99412 ) ) ( not ( = ?auto_99408 ?auto_99413 ) ) ( not ( = ?auto_99408 ?auto_99414 ) ) ( not ( = ?auto_99408 ?auto_99415 ) ) ( not ( = ?auto_99408 ?auto_99416 ) ) ( not ( = ?auto_99408 ?auto_99417 ) ) ( not ( = ?auto_99409 ?auto_99410 ) ) ( not ( = ?auto_99409 ?auto_99411 ) ) ( not ( = ?auto_99409 ?auto_99412 ) ) ( not ( = ?auto_99409 ?auto_99413 ) ) ( not ( = ?auto_99409 ?auto_99414 ) ) ( not ( = ?auto_99409 ?auto_99415 ) ) ( not ( = ?auto_99409 ?auto_99416 ) ) ( not ( = ?auto_99409 ?auto_99417 ) ) ( not ( = ?auto_99410 ?auto_99411 ) ) ( not ( = ?auto_99410 ?auto_99412 ) ) ( not ( = ?auto_99410 ?auto_99413 ) ) ( not ( = ?auto_99410 ?auto_99414 ) ) ( not ( = ?auto_99410 ?auto_99415 ) ) ( not ( = ?auto_99410 ?auto_99416 ) ) ( not ( = ?auto_99410 ?auto_99417 ) ) ( not ( = ?auto_99411 ?auto_99412 ) ) ( not ( = ?auto_99411 ?auto_99413 ) ) ( not ( = ?auto_99411 ?auto_99414 ) ) ( not ( = ?auto_99411 ?auto_99415 ) ) ( not ( = ?auto_99411 ?auto_99416 ) ) ( not ( = ?auto_99411 ?auto_99417 ) ) ( not ( = ?auto_99412 ?auto_99413 ) ) ( not ( = ?auto_99412 ?auto_99414 ) ) ( not ( = ?auto_99412 ?auto_99415 ) ) ( not ( = ?auto_99412 ?auto_99416 ) ) ( not ( = ?auto_99412 ?auto_99417 ) ) ( not ( = ?auto_99413 ?auto_99414 ) ) ( not ( = ?auto_99413 ?auto_99415 ) ) ( not ( = ?auto_99413 ?auto_99416 ) ) ( not ( = ?auto_99413 ?auto_99417 ) ) ( not ( = ?auto_99414 ?auto_99415 ) ) ( not ( = ?auto_99414 ?auto_99416 ) ) ( not ( = ?auto_99414 ?auto_99417 ) ) ( not ( = ?auto_99415 ?auto_99416 ) ) ( not ( = ?auto_99415 ?auto_99417 ) ) ( not ( = ?auto_99416 ?auto_99417 ) ) ( ON ?auto_99415 ?auto_99416 ) ( CLEAR ?auto_99413 ) ( ON ?auto_99414 ?auto_99415 ) ( CLEAR ?auto_99414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99408 ?auto_99409 ?auto_99410 ?auto_99411 ?auto_99412 ?auto_99413 ?auto_99414 )
      ( MAKE-9PILE ?auto_99408 ?auto_99409 ?auto_99410 ?auto_99411 ?auto_99412 ?auto_99413 ?auto_99414 ?auto_99415 ?auto_99416 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99427 - BLOCK
      ?auto_99428 - BLOCK
      ?auto_99429 - BLOCK
      ?auto_99430 - BLOCK
      ?auto_99431 - BLOCK
      ?auto_99432 - BLOCK
      ?auto_99433 - BLOCK
      ?auto_99434 - BLOCK
      ?auto_99435 - BLOCK
    )
    :vars
    (
      ?auto_99436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99435 ?auto_99436 ) ( ON-TABLE ?auto_99427 ) ( ON ?auto_99428 ?auto_99427 ) ( ON ?auto_99429 ?auto_99428 ) ( ON ?auto_99430 ?auto_99429 ) ( ON ?auto_99431 ?auto_99430 ) ( ON ?auto_99432 ?auto_99431 ) ( not ( = ?auto_99427 ?auto_99428 ) ) ( not ( = ?auto_99427 ?auto_99429 ) ) ( not ( = ?auto_99427 ?auto_99430 ) ) ( not ( = ?auto_99427 ?auto_99431 ) ) ( not ( = ?auto_99427 ?auto_99432 ) ) ( not ( = ?auto_99427 ?auto_99433 ) ) ( not ( = ?auto_99427 ?auto_99434 ) ) ( not ( = ?auto_99427 ?auto_99435 ) ) ( not ( = ?auto_99427 ?auto_99436 ) ) ( not ( = ?auto_99428 ?auto_99429 ) ) ( not ( = ?auto_99428 ?auto_99430 ) ) ( not ( = ?auto_99428 ?auto_99431 ) ) ( not ( = ?auto_99428 ?auto_99432 ) ) ( not ( = ?auto_99428 ?auto_99433 ) ) ( not ( = ?auto_99428 ?auto_99434 ) ) ( not ( = ?auto_99428 ?auto_99435 ) ) ( not ( = ?auto_99428 ?auto_99436 ) ) ( not ( = ?auto_99429 ?auto_99430 ) ) ( not ( = ?auto_99429 ?auto_99431 ) ) ( not ( = ?auto_99429 ?auto_99432 ) ) ( not ( = ?auto_99429 ?auto_99433 ) ) ( not ( = ?auto_99429 ?auto_99434 ) ) ( not ( = ?auto_99429 ?auto_99435 ) ) ( not ( = ?auto_99429 ?auto_99436 ) ) ( not ( = ?auto_99430 ?auto_99431 ) ) ( not ( = ?auto_99430 ?auto_99432 ) ) ( not ( = ?auto_99430 ?auto_99433 ) ) ( not ( = ?auto_99430 ?auto_99434 ) ) ( not ( = ?auto_99430 ?auto_99435 ) ) ( not ( = ?auto_99430 ?auto_99436 ) ) ( not ( = ?auto_99431 ?auto_99432 ) ) ( not ( = ?auto_99431 ?auto_99433 ) ) ( not ( = ?auto_99431 ?auto_99434 ) ) ( not ( = ?auto_99431 ?auto_99435 ) ) ( not ( = ?auto_99431 ?auto_99436 ) ) ( not ( = ?auto_99432 ?auto_99433 ) ) ( not ( = ?auto_99432 ?auto_99434 ) ) ( not ( = ?auto_99432 ?auto_99435 ) ) ( not ( = ?auto_99432 ?auto_99436 ) ) ( not ( = ?auto_99433 ?auto_99434 ) ) ( not ( = ?auto_99433 ?auto_99435 ) ) ( not ( = ?auto_99433 ?auto_99436 ) ) ( not ( = ?auto_99434 ?auto_99435 ) ) ( not ( = ?auto_99434 ?auto_99436 ) ) ( not ( = ?auto_99435 ?auto_99436 ) ) ( ON ?auto_99434 ?auto_99435 ) ( CLEAR ?auto_99432 ) ( ON ?auto_99433 ?auto_99434 ) ( CLEAR ?auto_99433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99427 ?auto_99428 ?auto_99429 ?auto_99430 ?auto_99431 ?auto_99432 ?auto_99433 )
      ( MAKE-9PILE ?auto_99427 ?auto_99428 ?auto_99429 ?auto_99430 ?auto_99431 ?auto_99432 ?auto_99433 ?auto_99434 ?auto_99435 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99446 - BLOCK
      ?auto_99447 - BLOCK
      ?auto_99448 - BLOCK
      ?auto_99449 - BLOCK
      ?auto_99450 - BLOCK
      ?auto_99451 - BLOCK
      ?auto_99452 - BLOCK
      ?auto_99453 - BLOCK
      ?auto_99454 - BLOCK
    )
    :vars
    (
      ?auto_99455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99454 ?auto_99455 ) ( ON-TABLE ?auto_99446 ) ( ON ?auto_99447 ?auto_99446 ) ( ON ?auto_99448 ?auto_99447 ) ( ON ?auto_99449 ?auto_99448 ) ( ON ?auto_99450 ?auto_99449 ) ( not ( = ?auto_99446 ?auto_99447 ) ) ( not ( = ?auto_99446 ?auto_99448 ) ) ( not ( = ?auto_99446 ?auto_99449 ) ) ( not ( = ?auto_99446 ?auto_99450 ) ) ( not ( = ?auto_99446 ?auto_99451 ) ) ( not ( = ?auto_99446 ?auto_99452 ) ) ( not ( = ?auto_99446 ?auto_99453 ) ) ( not ( = ?auto_99446 ?auto_99454 ) ) ( not ( = ?auto_99446 ?auto_99455 ) ) ( not ( = ?auto_99447 ?auto_99448 ) ) ( not ( = ?auto_99447 ?auto_99449 ) ) ( not ( = ?auto_99447 ?auto_99450 ) ) ( not ( = ?auto_99447 ?auto_99451 ) ) ( not ( = ?auto_99447 ?auto_99452 ) ) ( not ( = ?auto_99447 ?auto_99453 ) ) ( not ( = ?auto_99447 ?auto_99454 ) ) ( not ( = ?auto_99447 ?auto_99455 ) ) ( not ( = ?auto_99448 ?auto_99449 ) ) ( not ( = ?auto_99448 ?auto_99450 ) ) ( not ( = ?auto_99448 ?auto_99451 ) ) ( not ( = ?auto_99448 ?auto_99452 ) ) ( not ( = ?auto_99448 ?auto_99453 ) ) ( not ( = ?auto_99448 ?auto_99454 ) ) ( not ( = ?auto_99448 ?auto_99455 ) ) ( not ( = ?auto_99449 ?auto_99450 ) ) ( not ( = ?auto_99449 ?auto_99451 ) ) ( not ( = ?auto_99449 ?auto_99452 ) ) ( not ( = ?auto_99449 ?auto_99453 ) ) ( not ( = ?auto_99449 ?auto_99454 ) ) ( not ( = ?auto_99449 ?auto_99455 ) ) ( not ( = ?auto_99450 ?auto_99451 ) ) ( not ( = ?auto_99450 ?auto_99452 ) ) ( not ( = ?auto_99450 ?auto_99453 ) ) ( not ( = ?auto_99450 ?auto_99454 ) ) ( not ( = ?auto_99450 ?auto_99455 ) ) ( not ( = ?auto_99451 ?auto_99452 ) ) ( not ( = ?auto_99451 ?auto_99453 ) ) ( not ( = ?auto_99451 ?auto_99454 ) ) ( not ( = ?auto_99451 ?auto_99455 ) ) ( not ( = ?auto_99452 ?auto_99453 ) ) ( not ( = ?auto_99452 ?auto_99454 ) ) ( not ( = ?auto_99452 ?auto_99455 ) ) ( not ( = ?auto_99453 ?auto_99454 ) ) ( not ( = ?auto_99453 ?auto_99455 ) ) ( not ( = ?auto_99454 ?auto_99455 ) ) ( ON ?auto_99453 ?auto_99454 ) ( ON ?auto_99452 ?auto_99453 ) ( CLEAR ?auto_99450 ) ( ON ?auto_99451 ?auto_99452 ) ( CLEAR ?auto_99451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99446 ?auto_99447 ?auto_99448 ?auto_99449 ?auto_99450 ?auto_99451 )
      ( MAKE-9PILE ?auto_99446 ?auto_99447 ?auto_99448 ?auto_99449 ?auto_99450 ?auto_99451 ?auto_99452 ?auto_99453 ?auto_99454 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99465 - BLOCK
      ?auto_99466 - BLOCK
      ?auto_99467 - BLOCK
      ?auto_99468 - BLOCK
      ?auto_99469 - BLOCK
      ?auto_99470 - BLOCK
      ?auto_99471 - BLOCK
      ?auto_99472 - BLOCK
      ?auto_99473 - BLOCK
    )
    :vars
    (
      ?auto_99474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99473 ?auto_99474 ) ( ON-TABLE ?auto_99465 ) ( ON ?auto_99466 ?auto_99465 ) ( ON ?auto_99467 ?auto_99466 ) ( ON ?auto_99468 ?auto_99467 ) ( ON ?auto_99469 ?auto_99468 ) ( not ( = ?auto_99465 ?auto_99466 ) ) ( not ( = ?auto_99465 ?auto_99467 ) ) ( not ( = ?auto_99465 ?auto_99468 ) ) ( not ( = ?auto_99465 ?auto_99469 ) ) ( not ( = ?auto_99465 ?auto_99470 ) ) ( not ( = ?auto_99465 ?auto_99471 ) ) ( not ( = ?auto_99465 ?auto_99472 ) ) ( not ( = ?auto_99465 ?auto_99473 ) ) ( not ( = ?auto_99465 ?auto_99474 ) ) ( not ( = ?auto_99466 ?auto_99467 ) ) ( not ( = ?auto_99466 ?auto_99468 ) ) ( not ( = ?auto_99466 ?auto_99469 ) ) ( not ( = ?auto_99466 ?auto_99470 ) ) ( not ( = ?auto_99466 ?auto_99471 ) ) ( not ( = ?auto_99466 ?auto_99472 ) ) ( not ( = ?auto_99466 ?auto_99473 ) ) ( not ( = ?auto_99466 ?auto_99474 ) ) ( not ( = ?auto_99467 ?auto_99468 ) ) ( not ( = ?auto_99467 ?auto_99469 ) ) ( not ( = ?auto_99467 ?auto_99470 ) ) ( not ( = ?auto_99467 ?auto_99471 ) ) ( not ( = ?auto_99467 ?auto_99472 ) ) ( not ( = ?auto_99467 ?auto_99473 ) ) ( not ( = ?auto_99467 ?auto_99474 ) ) ( not ( = ?auto_99468 ?auto_99469 ) ) ( not ( = ?auto_99468 ?auto_99470 ) ) ( not ( = ?auto_99468 ?auto_99471 ) ) ( not ( = ?auto_99468 ?auto_99472 ) ) ( not ( = ?auto_99468 ?auto_99473 ) ) ( not ( = ?auto_99468 ?auto_99474 ) ) ( not ( = ?auto_99469 ?auto_99470 ) ) ( not ( = ?auto_99469 ?auto_99471 ) ) ( not ( = ?auto_99469 ?auto_99472 ) ) ( not ( = ?auto_99469 ?auto_99473 ) ) ( not ( = ?auto_99469 ?auto_99474 ) ) ( not ( = ?auto_99470 ?auto_99471 ) ) ( not ( = ?auto_99470 ?auto_99472 ) ) ( not ( = ?auto_99470 ?auto_99473 ) ) ( not ( = ?auto_99470 ?auto_99474 ) ) ( not ( = ?auto_99471 ?auto_99472 ) ) ( not ( = ?auto_99471 ?auto_99473 ) ) ( not ( = ?auto_99471 ?auto_99474 ) ) ( not ( = ?auto_99472 ?auto_99473 ) ) ( not ( = ?auto_99472 ?auto_99474 ) ) ( not ( = ?auto_99473 ?auto_99474 ) ) ( ON ?auto_99472 ?auto_99473 ) ( ON ?auto_99471 ?auto_99472 ) ( CLEAR ?auto_99469 ) ( ON ?auto_99470 ?auto_99471 ) ( CLEAR ?auto_99470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99465 ?auto_99466 ?auto_99467 ?auto_99468 ?auto_99469 ?auto_99470 )
      ( MAKE-9PILE ?auto_99465 ?auto_99466 ?auto_99467 ?auto_99468 ?auto_99469 ?auto_99470 ?auto_99471 ?auto_99472 ?auto_99473 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99484 - BLOCK
      ?auto_99485 - BLOCK
      ?auto_99486 - BLOCK
      ?auto_99487 - BLOCK
      ?auto_99488 - BLOCK
      ?auto_99489 - BLOCK
      ?auto_99490 - BLOCK
      ?auto_99491 - BLOCK
      ?auto_99492 - BLOCK
    )
    :vars
    (
      ?auto_99493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99492 ?auto_99493 ) ( ON-TABLE ?auto_99484 ) ( ON ?auto_99485 ?auto_99484 ) ( ON ?auto_99486 ?auto_99485 ) ( ON ?auto_99487 ?auto_99486 ) ( not ( = ?auto_99484 ?auto_99485 ) ) ( not ( = ?auto_99484 ?auto_99486 ) ) ( not ( = ?auto_99484 ?auto_99487 ) ) ( not ( = ?auto_99484 ?auto_99488 ) ) ( not ( = ?auto_99484 ?auto_99489 ) ) ( not ( = ?auto_99484 ?auto_99490 ) ) ( not ( = ?auto_99484 ?auto_99491 ) ) ( not ( = ?auto_99484 ?auto_99492 ) ) ( not ( = ?auto_99484 ?auto_99493 ) ) ( not ( = ?auto_99485 ?auto_99486 ) ) ( not ( = ?auto_99485 ?auto_99487 ) ) ( not ( = ?auto_99485 ?auto_99488 ) ) ( not ( = ?auto_99485 ?auto_99489 ) ) ( not ( = ?auto_99485 ?auto_99490 ) ) ( not ( = ?auto_99485 ?auto_99491 ) ) ( not ( = ?auto_99485 ?auto_99492 ) ) ( not ( = ?auto_99485 ?auto_99493 ) ) ( not ( = ?auto_99486 ?auto_99487 ) ) ( not ( = ?auto_99486 ?auto_99488 ) ) ( not ( = ?auto_99486 ?auto_99489 ) ) ( not ( = ?auto_99486 ?auto_99490 ) ) ( not ( = ?auto_99486 ?auto_99491 ) ) ( not ( = ?auto_99486 ?auto_99492 ) ) ( not ( = ?auto_99486 ?auto_99493 ) ) ( not ( = ?auto_99487 ?auto_99488 ) ) ( not ( = ?auto_99487 ?auto_99489 ) ) ( not ( = ?auto_99487 ?auto_99490 ) ) ( not ( = ?auto_99487 ?auto_99491 ) ) ( not ( = ?auto_99487 ?auto_99492 ) ) ( not ( = ?auto_99487 ?auto_99493 ) ) ( not ( = ?auto_99488 ?auto_99489 ) ) ( not ( = ?auto_99488 ?auto_99490 ) ) ( not ( = ?auto_99488 ?auto_99491 ) ) ( not ( = ?auto_99488 ?auto_99492 ) ) ( not ( = ?auto_99488 ?auto_99493 ) ) ( not ( = ?auto_99489 ?auto_99490 ) ) ( not ( = ?auto_99489 ?auto_99491 ) ) ( not ( = ?auto_99489 ?auto_99492 ) ) ( not ( = ?auto_99489 ?auto_99493 ) ) ( not ( = ?auto_99490 ?auto_99491 ) ) ( not ( = ?auto_99490 ?auto_99492 ) ) ( not ( = ?auto_99490 ?auto_99493 ) ) ( not ( = ?auto_99491 ?auto_99492 ) ) ( not ( = ?auto_99491 ?auto_99493 ) ) ( not ( = ?auto_99492 ?auto_99493 ) ) ( ON ?auto_99491 ?auto_99492 ) ( ON ?auto_99490 ?auto_99491 ) ( ON ?auto_99489 ?auto_99490 ) ( CLEAR ?auto_99487 ) ( ON ?auto_99488 ?auto_99489 ) ( CLEAR ?auto_99488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99484 ?auto_99485 ?auto_99486 ?auto_99487 ?auto_99488 )
      ( MAKE-9PILE ?auto_99484 ?auto_99485 ?auto_99486 ?auto_99487 ?auto_99488 ?auto_99489 ?auto_99490 ?auto_99491 ?auto_99492 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99503 - BLOCK
      ?auto_99504 - BLOCK
      ?auto_99505 - BLOCK
      ?auto_99506 - BLOCK
      ?auto_99507 - BLOCK
      ?auto_99508 - BLOCK
      ?auto_99509 - BLOCK
      ?auto_99510 - BLOCK
      ?auto_99511 - BLOCK
    )
    :vars
    (
      ?auto_99512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99511 ?auto_99512 ) ( ON-TABLE ?auto_99503 ) ( ON ?auto_99504 ?auto_99503 ) ( ON ?auto_99505 ?auto_99504 ) ( ON ?auto_99506 ?auto_99505 ) ( not ( = ?auto_99503 ?auto_99504 ) ) ( not ( = ?auto_99503 ?auto_99505 ) ) ( not ( = ?auto_99503 ?auto_99506 ) ) ( not ( = ?auto_99503 ?auto_99507 ) ) ( not ( = ?auto_99503 ?auto_99508 ) ) ( not ( = ?auto_99503 ?auto_99509 ) ) ( not ( = ?auto_99503 ?auto_99510 ) ) ( not ( = ?auto_99503 ?auto_99511 ) ) ( not ( = ?auto_99503 ?auto_99512 ) ) ( not ( = ?auto_99504 ?auto_99505 ) ) ( not ( = ?auto_99504 ?auto_99506 ) ) ( not ( = ?auto_99504 ?auto_99507 ) ) ( not ( = ?auto_99504 ?auto_99508 ) ) ( not ( = ?auto_99504 ?auto_99509 ) ) ( not ( = ?auto_99504 ?auto_99510 ) ) ( not ( = ?auto_99504 ?auto_99511 ) ) ( not ( = ?auto_99504 ?auto_99512 ) ) ( not ( = ?auto_99505 ?auto_99506 ) ) ( not ( = ?auto_99505 ?auto_99507 ) ) ( not ( = ?auto_99505 ?auto_99508 ) ) ( not ( = ?auto_99505 ?auto_99509 ) ) ( not ( = ?auto_99505 ?auto_99510 ) ) ( not ( = ?auto_99505 ?auto_99511 ) ) ( not ( = ?auto_99505 ?auto_99512 ) ) ( not ( = ?auto_99506 ?auto_99507 ) ) ( not ( = ?auto_99506 ?auto_99508 ) ) ( not ( = ?auto_99506 ?auto_99509 ) ) ( not ( = ?auto_99506 ?auto_99510 ) ) ( not ( = ?auto_99506 ?auto_99511 ) ) ( not ( = ?auto_99506 ?auto_99512 ) ) ( not ( = ?auto_99507 ?auto_99508 ) ) ( not ( = ?auto_99507 ?auto_99509 ) ) ( not ( = ?auto_99507 ?auto_99510 ) ) ( not ( = ?auto_99507 ?auto_99511 ) ) ( not ( = ?auto_99507 ?auto_99512 ) ) ( not ( = ?auto_99508 ?auto_99509 ) ) ( not ( = ?auto_99508 ?auto_99510 ) ) ( not ( = ?auto_99508 ?auto_99511 ) ) ( not ( = ?auto_99508 ?auto_99512 ) ) ( not ( = ?auto_99509 ?auto_99510 ) ) ( not ( = ?auto_99509 ?auto_99511 ) ) ( not ( = ?auto_99509 ?auto_99512 ) ) ( not ( = ?auto_99510 ?auto_99511 ) ) ( not ( = ?auto_99510 ?auto_99512 ) ) ( not ( = ?auto_99511 ?auto_99512 ) ) ( ON ?auto_99510 ?auto_99511 ) ( ON ?auto_99509 ?auto_99510 ) ( ON ?auto_99508 ?auto_99509 ) ( CLEAR ?auto_99506 ) ( ON ?auto_99507 ?auto_99508 ) ( CLEAR ?auto_99507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99503 ?auto_99504 ?auto_99505 ?auto_99506 ?auto_99507 )
      ( MAKE-9PILE ?auto_99503 ?auto_99504 ?auto_99505 ?auto_99506 ?auto_99507 ?auto_99508 ?auto_99509 ?auto_99510 ?auto_99511 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99522 - BLOCK
      ?auto_99523 - BLOCK
      ?auto_99524 - BLOCK
      ?auto_99525 - BLOCK
      ?auto_99526 - BLOCK
      ?auto_99527 - BLOCK
      ?auto_99528 - BLOCK
      ?auto_99529 - BLOCK
      ?auto_99530 - BLOCK
    )
    :vars
    (
      ?auto_99531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99530 ?auto_99531 ) ( ON-TABLE ?auto_99522 ) ( ON ?auto_99523 ?auto_99522 ) ( ON ?auto_99524 ?auto_99523 ) ( not ( = ?auto_99522 ?auto_99523 ) ) ( not ( = ?auto_99522 ?auto_99524 ) ) ( not ( = ?auto_99522 ?auto_99525 ) ) ( not ( = ?auto_99522 ?auto_99526 ) ) ( not ( = ?auto_99522 ?auto_99527 ) ) ( not ( = ?auto_99522 ?auto_99528 ) ) ( not ( = ?auto_99522 ?auto_99529 ) ) ( not ( = ?auto_99522 ?auto_99530 ) ) ( not ( = ?auto_99522 ?auto_99531 ) ) ( not ( = ?auto_99523 ?auto_99524 ) ) ( not ( = ?auto_99523 ?auto_99525 ) ) ( not ( = ?auto_99523 ?auto_99526 ) ) ( not ( = ?auto_99523 ?auto_99527 ) ) ( not ( = ?auto_99523 ?auto_99528 ) ) ( not ( = ?auto_99523 ?auto_99529 ) ) ( not ( = ?auto_99523 ?auto_99530 ) ) ( not ( = ?auto_99523 ?auto_99531 ) ) ( not ( = ?auto_99524 ?auto_99525 ) ) ( not ( = ?auto_99524 ?auto_99526 ) ) ( not ( = ?auto_99524 ?auto_99527 ) ) ( not ( = ?auto_99524 ?auto_99528 ) ) ( not ( = ?auto_99524 ?auto_99529 ) ) ( not ( = ?auto_99524 ?auto_99530 ) ) ( not ( = ?auto_99524 ?auto_99531 ) ) ( not ( = ?auto_99525 ?auto_99526 ) ) ( not ( = ?auto_99525 ?auto_99527 ) ) ( not ( = ?auto_99525 ?auto_99528 ) ) ( not ( = ?auto_99525 ?auto_99529 ) ) ( not ( = ?auto_99525 ?auto_99530 ) ) ( not ( = ?auto_99525 ?auto_99531 ) ) ( not ( = ?auto_99526 ?auto_99527 ) ) ( not ( = ?auto_99526 ?auto_99528 ) ) ( not ( = ?auto_99526 ?auto_99529 ) ) ( not ( = ?auto_99526 ?auto_99530 ) ) ( not ( = ?auto_99526 ?auto_99531 ) ) ( not ( = ?auto_99527 ?auto_99528 ) ) ( not ( = ?auto_99527 ?auto_99529 ) ) ( not ( = ?auto_99527 ?auto_99530 ) ) ( not ( = ?auto_99527 ?auto_99531 ) ) ( not ( = ?auto_99528 ?auto_99529 ) ) ( not ( = ?auto_99528 ?auto_99530 ) ) ( not ( = ?auto_99528 ?auto_99531 ) ) ( not ( = ?auto_99529 ?auto_99530 ) ) ( not ( = ?auto_99529 ?auto_99531 ) ) ( not ( = ?auto_99530 ?auto_99531 ) ) ( ON ?auto_99529 ?auto_99530 ) ( ON ?auto_99528 ?auto_99529 ) ( ON ?auto_99527 ?auto_99528 ) ( ON ?auto_99526 ?auto_99527 ) ( CLEAR ?auto_99524 ) ( ON ?auto_99525 ?auto_99526 ) ( CLEAR ?auto_99525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99522 ?auto_99523 ?auto_99524 ?auto_99525 )
      ( MAKE-9PILE ?auto_99522 ?auto_99523 ?auto_99524 ?auto_99525 ?auto_99526 ?auto_99527 ?auto_99528 ?auto_99529 ?auto_99530 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99541 - BLOCK
      ?auto_99542 - BLOCK
      ?auto_99543 - BLOCK
      ?auto_99544 - BLOCK
      ?auto_99545 - BLOCK
      ?auto_99546 - BLOCK
      ?auto_99547 - BLOCK
      ?auto_99548 - BLOCK
      ?auto_99549 - BLOCK
    )
    :vars
    (
      ?auto_99550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99549 ?auto_99550 ) ( ON-TABLE ?auto_99541 ) ( ON ?auto_99542 ?auto_99541 ) ( ON ?auto_99543 ?auto_99542 ) ( not ( = ?auto_99541 ?auto_99542 ) ) ( not ( = ?auto_99541 ?auto_99543 ) ) ( not ( = ?auto_99541 ?auto_99544 ) ) ( not ( = ?auto_99541 ?auto_99545 ) ) ( not ( = ?auto_99541 ?auto_99546 ) ) ( not ( = ?auto_99541 ?auto_99547 ) ) ( not ( = ?auto_99541 ?auto_99548 ) ) ( not ( = ?auto_99541 ?auto_99549 ) ) ( not ( = ?auto_99541 ?auto_99550 ) ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) ( not ( = ?auto_99542 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99546 ) ) ( not ( = ?auto_99542 ?auto_99547 ) ) ( not ( = ?auto_99542 ?auto_99548 ) ) ( not ( = ?auto_99542 ?auto_99549 ) ) ( not ( = ?auto_99542 ?auto_99550 ) ) ( not ( = ?auto_99543 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99545 ) ) ( not ( = ?auto_99543 ?auto_99546 ) ) ( not ( = ?auto_99543 ?auto_99547 ) ) ( not ( = ?auto_99543 ?auto_99548 ) ) ( not ( = ?auto_99543 ?auto_99549 ) ) ( not ( = ?auto_99543 ?auto_99550 ) ) ( not ( = ?auto_99544 ?auto_99545 ) ) ( not ( = ?auto_99544 ?auto_99546 ) ) ( not ( = ?auto_99544 ?auto_99547 ) ) ( not ( = ?auto_99544 ?auto_99548 ) ) ( not ( = ?auto_99544 ?auto_99549 ) ) ( not ( = ?auto_99544 ?auto_99550 ) ) ( not ( = ?auto_99545 ?auto_99546 ) ) ( not ( = ?auto_99545 ?auto_99547 ) ) ( not ( = ?auto_99545 ?auto_99548 ) ) ( not ( = ?auto_99545 ?auto_99549 ) ) ( not ( = ?auto_99545 ?auto_99550 ) ) ( not ( = ?auto_99546 ?auto_99547 ) ) ( not ( = ?auto_99546 ?auto_99548 ) ) ( not ( = ?auto_99546 ?auto_99549 ) ) ( not ( = ?auto_99546 ?auto_99550 ) ) ( not ( = ?auto_99547 ?auto_99548 ) ) ( not ( = ?auto_99547 ?auto_99549 ) ) ( not ( = ?auto_99547 ?auto_99550 ) ) ( not ( = ?auto_99548 ?auto_99549 ) ) ( not ( = ?auto_99548 ?auto_99550 ) ) ( not ( = ?auto_99549 ?auto_99550 ) ) ( ON ?auto_99548 ?auto_99549 ) ( ON ?auto_99547 ?auto_99548 ) ( ON ?auto_99546 ?auto_99547 ) ( ON ?auto_99545 ?auto_99546 ) ( CLEAR ?auto_99543 ) ( ON ?auto_99544 ?auto_99545 ) ( CLEAR ?auto_99544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99541 ?auto_99542 ?auto_99543 ?auto_99544 )
      ( MAKE-9PILE ?auto_99541 ?auto_99542 ?auto_99543 ?auto_99544 ?auto_99545 ?auto_99546 ?auto_99547 ?auto_99548 ?auto_99549 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99560 - BLOCK
      ?auto_99561 - BLOCK
      ?auto_99562 - BLOCK
      ?auto_99563 - BLOCK
      ?auto_99564 - BLOCK
      ?auto_99565 - BLOCK
      ?auto_99566 - BLOCK
      ?auto_99567 - BLOCK
      ?auto_99568 - BLOCK
    )
    :vars
    (
      ?auto_99569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99568 ?auto_99569 ) ( ON-TABLE ?auto_99560 ) ( ON ?auto_99561 ?auto_99560 ) ( not ( = ?auto_99560 ?auto_99561 ) ) ( not ( = ?auto_99560 ?auto_99562 ) ) ( not ( = ?auto_99560 ?auto_99563 ) ) ( not ( = ?auto_99560 ?auto_99564 ) ) ( not ( = ?auto_99560 ?auto_99565 ) ) ( not ( = ?auto_99560 ?auto_99566 ) ) ( not ( = ?auto_99560 ?auto_99567 ) ) ( not ( = ?auto_99560 ?auto_99568 ) ) ( not ( = ?auto_99560 ?auto_99569 ) ) ( not ( = ?auto_99561 ?auto_99562 ) ) ( not ( = ?auto_99561 ?auto_99563 ) ) ( not ( = ?auto_99561 ?auto_99564 ) ) ( not ( = ?auto_99561 ?auto_99565 ) ) ( not ( = ?auto_99561 ?auto_99566 ) ) ( not ( = ?auto_99561 ?auto_99567 ) ) ( not ( = ?auto_99561 ?auto_99568 ) ) ( not ( = ?auto_99561 ?auto_99569 ) ) ( not ( = ?auto_99562 ?auto_99563 ) ) ( not ( = ?auto_99562 ?auto_99564 ) ) ( not ( = ?auto_99562 ?auto_99565 ) ) ( not ( = ?auto_99562 ?auto_99566 ) ) ( not ( = ?auto_99562 ?auto_99567 ) ) ( not ( = ?auto_99562 ?auto_99568 ) ) ( not ( = ?auto_99562 ?auto_99569 ) ) ( not ( = ?auto_99563 ?auto_99564 ) ) ( not ( = ?auto_99563 ?auto_99565 ) ) ( not ( = ?auto_99563 ?auto_99566 ) ) ( not ( = ?auto_99563 ?auto_99567 ) ) ( not ( = ?auto_99563 ?auto_99568 ) ) ( not ( = ?auto_99563 ?auto_99569 ) ) ( not ( = ?auto_99564 ?auto_99565 ) ) ( not ( = ?auto_99564 ?auto_99566 ) ) ( not ( = ?auto_99564 ?auto_99567 ) ) ( not ( = ?auto_99564 ?auto_99568 ) ) ( not ( = ?auto_99564 ?auto_99569 ) ) ( not ( = ?auto_99565 ?auto_99566 ) ) ( not ( = ?auto_99565 ?auto_99567 ) ) ( not ( = ?auto_99565 ?auto_99568 ) ) ( not ( = ?auto_99565 ?auto_99569 ) ) ( not ( = ?auto_99566 ?auto_99567 ) ) ( not ( = ?auto_99566 ?auto_99568 ) ) ( not ( = ?auto_99566 ?auto_99569 ) ) ( not ( = ?auto_99567 ?auto_99568 ) ) ( not ( = ?auto_99567 ?auto_99569 ) ) ( not ( = ?auto_99568 ?auto_99569 ) ) ( ON ?auto_99567 ?auto_99568 ) ( ON ?auto_99566 ?auto_99567 ) ( ON ?auto_99565 ?auto_99566 ) ( ON ?auto_99564 ?auto_99565 ) ( ON ?auto_99563 ?auto_99564 ) ( CLEAR ?auto_99561 ) ( ON ?auto_99562 ?auto_99563 ) ( CLEAR ?auto_99562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99560 ?auto_99561 ?auto_99562 )
      ( MAKE-9PILE ?auto_99560 ?auto_99561 ?auto_99562 ?auto_99563 ?auto_99564 ?auto_99565 ?auto_99566 ?auto_99567 ?auto_99568 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99579 - BLOCK
      ?auto_99580 - BLOCK
      ?auto_99581 - BLOCK
      ?auto_99582 - BLOCK
      ?auto_99583 - BLOCK
      ?auto_99584 - BLOCK
      ?auto_99585 - BLOCK
      ?auto_99586 - BLOCK
      ?auto_99587 - BLOCK
    )
    :vars
    (
      ?auto_99588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99587 ?auto_99588 ) ( ON-TABLE ?auto_99579 ) ( ON ?auto_99580 ?auto_99579 ) ( not ( = ?auto_99579 ?auto_99580 ) ) ( not ( = ?auto_99579 ?auto_99581 ) ) ( not ( = ?auto_99579 ?auto_99582 ) ) ( not ( = ?auto_99579 ?auto_99583 ) ) ( not ( = ?auto_99579 ?auto_99584 ) ) ( not ( = ?auto_99579 ?auto_99585 ) ) ( not ( = ?auto_99579 ?auto_99586 ) ) ( not ( = ?auto_99579 ?auto_99587 ) ) ( not ( = ?auto_99579 ?auto_99588 ) ) ( not ( = ?auto_99580 ?auto_99581 ) ) ( not ( = ?auto_99580 ?auto_99582 ) ) ( not ( = ?auto_99580 ?auto_99583 ) ) ( not ( = ?auto_99580 ?auto_99584 ) ) ( not ( = ?auto_99580 ?auto_99585 ) ) ( not ( = ?auto_99580 ?auto_99586 ) ) ( not ( = ?auto_99580 ?auto_99587 ) ) ( not ( = ?auto_99580 ?auto_99588 ) ) ( not ( = ?auto_99581 ?auto_99582 ) ) ( not ( = ?auto_99581 ?auto_99583 ) ) ( not ( = ?auto_99581 ?auto_99584 ) ) ( not ( = ?auto_99581 ?auto_99585 ) ) ( not ( = ?auto_99581 ?auto_99586 ) ) ( not ( = ?auto_99581 ?auto_99587 ) ) ( not ( = ?auto_99581 ?auto_99588 ) ) ( not ( = ?auto_99582 ?auto_99583 ) ) ( not ( = ?auto_99582 ?auto_99584 ) ) ( not ( = ?auto_99582 ?auto_99585 ) ) ( not ( = ?auto_99582 ?auto_99586 ) ) ( not ( = ?auto_99582 ?auto_99587 ) ) ( not ( = ?auto_99582 ?auto_99588 ) ) ( not ( = ?auto_99583 ?auto_99584 ) ) ( not ( = ?auto_99583 ?auto_99585 ) ) ( not ( = ?auto_99583 ?auto_99586 ) ) ( not ( = ?auto_99583 ?auto_99587 ) ) ( not ( = ?auto_99583 ?auto_99588 ) ) ( not ( = ?auto_99584 ?auto_99585 ) ) ( not ( = ?auto_99584 ?auto_99586 ) ) ( not ( = ?auto_99584 ?auto_99587 ) ) ( not ( = ?auto_99584 ?auto_99588 ) ) ( not ( = ?auto_99585 ?auto_99586 ) ) ( not ( = ?auto_99585 ?auto_99587 ) ) ( not ( = ?auto_99585 ?auto_99588 ) ) ( not ( = ?auto_99586 ?auto_99587 ) ) ( not ( = ?auto_99586 ?auto_99588 ) ) ( not ( = ?auto_99587 ?auto_99588 ) ) ( ON ?auto_99586 ?auto_99587 ) ( ON ?auto_99585 ?auto_99586 ) ( ON ?auto_99584 ?auto_99585 ) ( ON ?auto_99583 ?auto_99584 ) ( ON ?auto_99582 ?auto_99583 ) ( CLEAR ?auto_99580 ) ( ON ?auto_99581 ?auto_99582 ) ( CLEAR ?auto_99581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99579 ?auto_99580 ?auto_99581 )
      ( MAKE-9PILE ?auto_99579 ?auto_99580 ?auto_99581 ?auto_99582 ?auto_99583 ?auto_99584 ?auto_99585 ?auto_99586 ?auto_99587 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99598 - BLOCK
      ?auto_99599 - BLOCK
      ?auto_99600 - BLOCK
      ?auto_99601 - BLOCK
      ?auto_99602 - BLOCK
      ?auto_99603 - BLOCK
      ?auto_99604 - BLOCK
      ?auto_99605 - BLOCK
      ?auto_99606 - BLOCK
    )
    :vars
    (
      ?auto_99607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99606 ?auto_99607 ) ( ON-TABLE ?auto_99598 ) ( not ( = ?auto_99598 ?auto_99599 ) ) ( not ( = ?auto_99598 ?auto_99600 ) ) ( not ( = ?auto_99598 ?auto_99601 ) ) ( not ( = ?auto_99598 ?auto_99602 ) ) ( not ( = ?auto_99598 ?auto_99603 ) ) ( not ( = ?auto_99598 ?auto_99604 ) ) ( not ( = ?auto_99598 ?auto_99605 ) ) ( not ( = ?auto_99598 ?auto_99606 ) ) ( not ( = ?auto_99598 ?auto_99607 ) ) ( not ( = ?auto_99599 ?auto_99600 ) ) ( not ( = ?auto_99599 ?auto_99601 ) ) ( not ( = ?auto_99599 ?auto_99602 ) ) ( not ( = ?auto_99599 ?auto_99603 ) ) ( not ( = ?auto_99599 ?auto_99604 ) ) ( not ( = ?auto_99599 ?auto_99605 ) ) ( not ( = ?auto_99599 ?auto_99606 ) ) ( not ( = ?auto_99599 ?auto_99607 ) ) ( not ( = ?auto_99600 ?auto_99601 ) ) ( not ( = ?auto_99600 ?auto_99602 ) ) ( not ( = ?auto_99600 ?auto_99603 ) ) ( not ( = ?auto_99600 ?auto_99604 ) ) ( not ( = ?auto_99600 ?auto_99605 ) ) ( not ( = ?auto_99600 ?auto_99606 ) ) ( not ( = ?auto_99600 ?auto_99607 ) ) ( not ( = ?auto_99601 ?auto_99602 ) ) ( not ( = ?auto_99601 ?auto_99603 ) ) ( not ( = ?auto_99601 ?auto_99604 ) ) ( not ( = ?auto_99601 ?auto_99605 ) ) ( not ( = ?auto_99601 ?auto_99606 ) ) ( not ( = ?auto_99601 ?auto_99607 ) ) ( not ( = ?auto_99602 ?auto_99603 ) ) ( not ( = ?auto_99602 ?auto_99604 ) ) ( not ( = ?auto_99602 ?auto_99605 ) ) ( not ( = ?auto_99602 ?auto_99606 ) ) ( not ( = ?auto_99602 ?auto_99607 ) ) ( not ( = ?auto_99603 ?auto_99604 ) ) ( not ( = ?auto_99603 ?auto_99605 ) ) ( not ( = ?auto_99603 ?auto_99606 ) ) ( not ( = ?auto_99603 ?auto_99607 ) ) ( not ( = ?auto_99604 ?auto_99605 ) ) ( not ( = ?auto_99604 ?auto_99606 ) ) ( not ( = ?auto_99604 ?auto_99607 ) ) ( not ( = ?auto_99605 ?auto_99606 ) ) ( not ( = ?auto_99605 ?auto_99607 ) ) ( not ( = ?auto_99606 ?auto_99607 ) ) ( ON ?auto_99605 ?auto_99606 ) ( ON ?auto_99604 ?auto_99605 ) ( ON ?auto_99603 ?auto_99604 ) ( ON ?auto_99602 ?auto_99603 ) ( ON ?auto_99601 ?auto_99602 ) ( ON ?auto_99600 ?auto_99601 ) ( CLEAR ?auto_99598 ) ( ON ?auto_99599 ?auto_99600 ) ( CLEAR ?auto_99599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99598 ?auto_99599 )
      ( MAKE-9PILE ?auto_99598 ?auto_99599 ?auto_99600 ?auto_99601 ?auto_99602 ?auto_99603 ?auto_99604 ?auto_99605 ?auto_99606 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99617 - BLOCK
      ?auto_99618 - BLOCK
      ?auto_99619 - BLOCK
      ?auto_99620 - BLOCK
      ?auto_99621 - BLOCK
      ?auto_99622 - BLOCK
      ?auto_99623 - BLOCK
      ?auto_99624 - BLOCK
      ?auto_99625 - BLOCK
    )
    :vars
    (
      ?auto_99626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99625 ?auto_99626 ) ( ON-TABLE ?auto_99617 ) ( not ( = ?auto_99617 ?auto_99618 ) ) ( not ( = ?auto_99617 ?auto_99619 ) ) ( not ( = ?auto_99617 ?auto_99620 ) ) ( not ( = ?auto_99617 ?auto_99621 ) ) ( not ( = ?auto_99617 ?auto_99622 ) ) ( not ( = ?auto_99617 ?auto_99623 ) ) ( not ( = ?auto_99617 ?auto_99624 ) ) ( not ( = ?auto_99617 ?auto_99625 ) ) ( not ( = ?auto_99617 ?auto_99626 ) ) ( not ( = ?auto_99618 ?auto_99619 ) ) ( not ( = ?auto_99618 ?auto_99620 ) ) ( not ( = ?auto_99618 ?auto_99621 ) ) ( not ( = ?auto_99618 ?auto_99622 ) ) ( not ( = ?auto_99618 ?auto_99623 ) ) ( not ( = ?auto_99618 ?auto_99624 ) ) ( not ( = ?auto_99618 ?auto_99625 ) ) ( not ( = ?auto_99618 ?auto_99626 ) ) ( not ( = ?auto_99619 ?auto_99620 ) ) ( not ( = ?auto_99619 ?auto_99621 ) ) ( not ( = ?auto_99619 ?auto_99622 ) ) ( not ( = ?auto_99619 ?auto_99623 ) ) ( not ( = ?auto_99619 ?auto_99624 ) ) ( not ( = ?auto_99619 ?auto_99625 ) ) ( not ( = ?auto_99619 ?auto_99626 ) ) ( not ( = ?auto_99620 ?auto_99621 ) ) ( not ( = ?auto_99620 ?auto_99622 ) ) ( not ( = ?auto_99620 ?auto_99623 ) ) ( not ( = ?auto_99620 ?auto_99624 ) ) ( not ( = ?auto_99620 ?auto_99625 ) ) ( not ( = ?auto_99620 ?auto_99626 ) ) ( not ( = ?auto_99621 ?auto_99622 ) ) ( not ( = ?auto_99621 ?auto_99623 ) ) ( not ( = ?auto_99621 ?auto_99624 ) ) ( not ( = ?auto_99621 ?auto_99625 ) ) ( not ( = ?auto_99621 ?auto_99626 ) ) ( not ( = ?auto_99622 ?auto_99623 ) ) ( not ( = ?auto_99622 ?auto_99624 ) ) ( not ( = ?auto_99622 ?auto_99625 ) ) ( not ( = ?auto_99622 ?auto_99626 ) ) ( not ( = ?auto_99623 ?auto_99624 ) ) ( not ( = ?auto_99623 ?auto_99625 ) ) ( not ( = ?auto_99623 ?auto_99626 ) ) ( not ( = ?auto_99624 ?auto_99625 ) ) ( not ( = ?auto_99624 ?auto_99626 ) ) ( not ( = ?auto_99625 ?auto_99626 ) ) ( ON ?auto_99624 ?auto_99625 ) ( ON ?auto_99623 ?auto_99624 ) ( ON ?auto_99622 ?auto_99623 ) ( ON ?auto_99621 ?auto_99622 ) ( ON ?auto_99620 ?auto_99621 ) ( ON ?auto_99619 ?auto_99620 ) ( CLEAR ?auto_99617 ) ( ON ?auto_99618 ?auto_99619 ) ( CLEAR ?auto_99618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99617 ?auto_99618 )
      ( MAKE-9PILE ?auto_99617 ?auto_99618 ?auto_99619 ?auto_99620 ?auto_99621 ?auto_99622 ?auto_99623 ?auto_99624 ?auto_99625 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99636 - BLOCK
      ?auto_99637 - BLOCK
      ?auto_99638 - BLOCK
      ?auto_99639 - BLOCK
      ?auto_99640 - BLOCK
      ?auto_99641 - BLOCK
      ?auto_99642 - BLOCK
      ?auto_99643 - BLOCK
      ?auto_99644 - BLOCK
    )
    :vars
    (
      ?auto_99645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99644 ?auto_99645 ) ( not ( = ?auto_99636 ?auto_99637 ) ) ( not ( = ?auto_99636 ?auto_99638 ) ) ( not ( = ?auto_99636 ?auto_99639 ) ) ( not ( = ?auto_99636 ?auto_99640 ) ) ( not ( = ?auto_99636 ?auto_99641 ) ) ( not ( = ?auto_99636 ?auto_99642 ) ) ( not ( = ?auto_99636 ?auto_99643 ) ) ( not ( = ?auto_99636 ?auto_99644 ) ) ( not ( = ?auto_99636 ?auto_99645 ) ) ( not ( = ?auto_99637 ?auto_99638 ) ) ( not ( = ?auto_99637 ?auto_99639 ) ) ( not ( = ?auto_99637 ?auto_99640 ) ) ( not ( = ?auto_99637 ?auto_99641 ) ) ( not ( = ?auto_99637 ?auto_99642 ) ) ( not ( = ?auto_99637 ?auto_99643 ) ) ( not ( = ?auto_99637 ?auto_99644 ) ) ( not ( = ?auto_99637 ?auto_99645 ) ) ( not ( = ?auto_99638 ?auto_99639 ) ) ( not ( = ?auto_99638 ?auto_99640 ) ) ( not ( = ?auto_99638 ?auto_99641 ) ) ( not ( = ?auto_99638 ?auto_99642 ) ) ( not ( = ?auto_99638 ?auto_99643 ) ) ( not ( = ?auto_99638 ?auto_99644 ) ) ( not ( = ?auto_99638 ?auto_99645 ) ) ( not ( = ?auto_99639 ?auto_99640 ) ) ( not ( = ?auto_99639 ?auto_99641 ) ) ( not ( = ?auto_99639 ?auto_99642 ) ) ( not ( = ?auto_99639 ?auto_99643 ) ) ( not ( = ?auto_99639 ?auto_99644 ) ) ( not ( = ?auto_99639 ?auto_99645 ) ) ( not ( = ?auto_99640 ?auto_99641 ) ) ( not ( = ?auto_99640 ?auto_99642 ) ) ( not ( = ?auto_99640 ?auto_99643 ) ) ( not ( = ?auto_99640 ?auto_99644 ) ) ( not ( = ?auto_99640 ?auto_99645 ) ) ( not ( = ?auto_99641 ?auto_99642 ) ) ( not ( = ?auto_99641 ?auto_99643 ) ) ( not ( = ?auto_99641 ?auto_99644 ) ) ( not ( = ?auto_99641 ?auto_99645 ) ) ( not ( = ?auto_99642 ?auto_99643 ) ) ( not ( = ?auto_99642 ?auto_99644 ) ) ( not ( = ?auto_99642 ?auto_99645 ) ) ( not ( = ?auto_99643 ?auto_99644 ) ) ( not ( = ?auto_99643 ?auto_99645 ) ) ( not ( = ?auto_99644 ?auto_99645 ) ) ( ON ?auto_99643 ?auto_99644 ) ( ON ?auto_99642 ?auto_99643 ) ( ON ?auto_99641 ?auto_99642 ) ( ON ?auto_99640 ?auto_99641 ) ( ON ?auto_99639 ?auto_99640 ) ( ON ?auto_99638 ?auto_99639 ) ( ON ?auto_99637 ?auto_99638 ) ( ON ?auto_99636 ?auto_99637 ) ( CLEAR ?auto_99636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99636 )
      ( MAKE-9PILE ?auto_99636 ?auto_99637 ?auto_99638 ?auto_99639 ?auto_99640 ?auto_99641 ?auto_99642 ?auto_99643 ?auto_99644 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_99655 - BLOCK
      ?auto_99656 - BLOCK
      ?auto_99657 - BLOCK
      ?auto_99658 - BLOCK
      ?auto_99659 - BLOCK
      ?auto_99660 - BLOCK
      ?auto_99661 - BLOCK
      ?auto_99662 - BLOCK
      ?auto_99663 - BLOCK
    )
    :vars
    (
      ?auto_99664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99663 ?auto_99664 ) ( not ( = ?auto_99655 ?auto_99656 ) ) ( not ( = ?auto_99655 ?auto_99657 ) ) ( not ( = ?auto_99655 ?auto_99658 ) ) ( not ( = ?auto_99655 ?auto_99659 ) ) ( not ( = ?auto_99655 ?auto_99660 ) ) ( not ( = ?auto_99655 ?auto_99661 ) ) ( not ( = ?auto_99655 ?auto_99662 ) ) ( not ( = ?auto_99655 ?auto_99663 ) ) ( not ( = ?auto_99655 ?auto_99664 ) ) ( not ( = ?auto_99656 ?auto_99657 ) ) ( not ( = ?auto_99656 ?auto_99658 ) ) ( not ( = ?auto_99656 ?auto_99659 ) ) ( not ( = ?auto_99656 ?auto_99660 ) ) ( not ( = ?auto_99656 ?auto_99661 ) ) ( not ( = ?auto_99656 ?auto_99662 ) ) ( not ( = ?auto_99656 ?auto_99663 ) ) ( not ( = ?auto_99656 ?auto_99664 ) ) ( not ( = ?auto_99657 ?auto_99658 ) ) ( not ( = ?auto_99657 ?auto_99659 ) ) ( not ( = ?auto_99657 ?auto_99660 ) ) ( not ( = ?auto_99657 ?auto_99661 ) ) ( not ( = ?auto_99657 ?auto_99662 ) ) ( not ( = ?auto_99657 ?auto_99663 ) ) ( not ( = ?auto_99657 ?auto_99664 ) ) ( not ( = ?auto_99658 ?auto_99659 ) ) ( not ( = ?auto_99658 ?auto_99660 ) ) ( not ( = ?auto_99658 ?auto_99661 ) ) ( not ( = ?auto_99658 ?auto_99662 ) ) ( not ( = ?auto_99658 ?auto_99663 ) ) ( not ( = ?auto_99658 ?auto_99664 ) ) ( not ( = ?auto_99659 ?auto_99660 ) ) ( not ( = ?auto_99659 ?auto_99661 ) ) ( not ( = ?auto_99659 ?auto_99662 ) ) ( not ( = ?auto_99659 ?auto_99663 ) ) ( not ( = ?auto_99659 ?auto_99664 ) ) ( not ( = ?auto_99660 ?auto_99661 ) ) ( not ( = ?auto_99660 ?auto_99662 ) ) ( not ( = ?auto_99660 ?auto_99663 ) ) ( not ( = ?auto_99660 ?auto_99664 ) ) ( not ( = ?auto_99661 ?auto_99662 ) ) ( not ( = ?auto_99661 ?auto_99663 ) ) ( not ( = ?auto_99661 ?auto_99664 ) ) ( not ( = ?auto_99662 ?auto_99663 ) ) ( not ( = ?auto_99662 ?auto_99664 ) ) ( not ( = ?auto_99663 ?auto_99664 ) ) ( ON ?auto_99662 ?auto_99663 ) ( ON ?auto_99661 ?auto_99662 ) ( ON ?auto_99660 ?auto_99661 ) ( ON ?auto_99659 ?auto_99660 ) ( ON ?auto_99658 ?auto_99659 ) ( ON ?auto_99657 ?auto_99658 ) ( ON ?auto_99656 ?auto_99657 ) ( ON ?auto_99655 ?auto_99656 ) ( CLEAR ?auto_99655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99655 )
      ( MAKE-9PILE ?auto_99655 ?auto_99656 ?auto_99657 ?auto_99658 ?auto_99659 ?auto_99660 ?auto_99661 ?auto_99662 ?auto_99663 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99675 - BLOCK
      ?auto_99676 - BLOCK
      ?auto_99677 - BLOCK
      ?auto_99678 - BLOCK
      ?auto_99679 - BLOCK
      ?auto_99680 - BLOCK
      ?auto_99681 - BLOCK
      ?auto_99682 - BLOCK
      ?auto_99683 - BLOCK
      ?auto_99684 - BLOCK
    )
    :vars
    (
      ?auto_99685 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99683 ) ( ON ?auto_99684 ?auto_99685 ) ( CLEAR ?auto_99684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99675 ) ( ON ?auto_99676 ?auto_99675 ) ( ON ?auto_99677 ?auto_99676 ) ( ON ?auto_99678 ?auto_99677 ) ( ON ?auto_99679 ?auto_99678 ) ( ON ?auto_99680 ?auto_99679 ) ( ON ?auto_99681 ?auto_99680 ) ( ON ?auto_99682 ?auto_99681 ) ( ON ?auto_99683 ?auto_99682 ) ( not ( = ?auto_99675 ?auto_99676 ) ) ( not ( = ?auto_99675 ?auto_99677 ) ) ( not ( = ?auto_99675 ?auto_99678 ) ) ( not ( = ?auto_99675 ?auto_99679 ) ) ( not ( = ?auto_99675 ?auto_99680 ) ) ( not ( = ?auto_99675 ?auto_99681 ) ) ( not ( = ?auto_99675 ?auto_99682 ) ) ( not ( = ?auto_99675 ?auto_99683 ) ) ( not ( = ?auto_99675 ?auto_99684 ) ) ( not ( = ?auto_99675 ?auto_99685 ) ) ( not ( = ?auto_99676 ?auto_99677 ) ) ( not ( = ?auto_99676 ?auto_99678 ) ) ( not ( = ?auto_99676 ?auto_99679 ) ) ( not ( = ?auto_99676 ?auto_99680 ) ) ( not ( = ?auto_99676 ?auto_99681 ) ) ( not ( = ?auto_99676 ?auto_99682 ) ) ( not ( = ?auto_99676 ?auto_99683 ) ) ( not ( = ?auto_99676 ?auto_99684 ) ) ( not ( = ?auto_99676 ?auto_99685 ) ) ( not ( = ?auto_99677 ?auto_99678 ) ) ( not ( = ?auto_99677 ?auto_99679 ) ) ( not ( = ?auto_99677 ?auto_99680 ) ) ( not ( = ?auto_99677 ?auto_99681 ) ) ( not ( = ?auto_99677 ?auto_99682 ) ) ( not ( = ?auto_99677 ?auto_99683 ) ) ( not ( = ?auto_99677 ?auto_99684 ) ) ( not ( = ?auto_99677 ?auto_99685 ) ) ( not ( = ?auto_99678 ?auto_99679 ) ) ( not ( = ?auto_99678 ?auto_99680 ) ) ( not ( = ?auto_99678 ?auto_99681 ) ) ( not ( = ?auto_99678 ?auto_99682 ) ) ( not ( = ?auto_99678 ?auto_99683 ) ) ( not ( = ?auto_99678 ?auto_99684 ) ) ( not ( = ?auto_99678 ?auto_99685 ) ) ( not ( = ?auto_99679 ?auto_99680 ) ) ( not ( = ?auto_99679 ?auto_99681 ) ) ( not ( = ?auto_99679 ?auto_99682 ) ) ( not ( = ?auto_99679 ?auto_99683 ) ) ( not ( = ?auto_99679 ?auto_99684 ) ) ( not ( = ?auto_99679 ?auto_99685 ) ) ( not ( = ?auto_99680 ?auto_99681 ) ) ( not ( = ?auto_99680 ?auto_99682 ) ) ( not ( = ?auto_99680 ?auto_99683 ) ) ( not ( = ?auto_99680 ?auto_99684 ) ) ( not ( = ?auto_99680 ?auto_99685 ) ) ( not ( = ?auto_99681 ?auto_99682 ) ) ( not ( = ?auto_99681 ?auto_99683 ) ) ( not ( = ?auto_99681 ?auto_99684 ) ) ( not ( = ?auto_99681 ?auto_99685 ) ) ( not ( = ?auto_99682 ?auto_99683 ) ) ( not ( = ?auto_99682 ?auto_99684 ) ) ( not ( = ?auto_99682 ?auto_99685 ) ) ( not ( = ?auto_99683 ?auto_99684 ) ) ( not ( = ?auto_99683 ?auto_99685 ) ) ( not ( = ?auto_99684 ?auto_99685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99684 ?auto_99685 )
      ( !STACK ?auto_99684 ?auto_99683 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99696 - BLOCK
      ?auto_99697 - BLOCK
      ?auto_99698 - BLOCK
      ?auto_99699 - BLOCK
      ?auto_99700 - BLOCK
      ?auto_99701 - BLOCK
      ?auto_99702 - BLOCK
      ?auto_99703 - BLOCK
      ?auto_99704 - BLOCK
      ?auto_99705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99704 ) ( ON-TABLE ?auto_99705 ) ( CLEAR ?auto_99705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99696 ) ( ON ?auto_99697 ?auto_99696 ) ( ON ?auto_99698 ?auto_99697 ) ( ON ?auto_99699 ?auto_99698 ) ( ON ?auto_99700 ?auto_99699 ) ( ON ?auto_99701 ?auto_99700 ) ( ON ?auto_99702 ?auto_99701 ) ( ON ?auto_99703 ?auto_99702 ) ( ON ?auto_99704 ?auto_99703 ) ( not ( = ?auto_99696 ?auto_99697 ) ) ( not ( = ?auto_99696 ?auto_99698 ) ) ( not ( = ?auto_99696 ?auto_99699 ) ) ( not ( = ?auto_99696 ?auto_99700 ) ) ( not ( = ?auto_99696 ?auto_99701 ) ) ( not ( = ?auto_99696 ?auto_99702 ) ) ( not ( = ?auto_99696 ?auto_99703 ) ) ( not ( = ?auto_99696 ?auto_99704 ) ) ( not ( = ?auto_99696 ?auto_99705 ) ) ( not ( = ?auto_99697 ?auto_99698 ) ) ( not ( = ?auto_99697 ?auto_99699 ) ) ( not ( = ?auto_99697 ?auto_99700 ) ) ( not ( = ?auto_99697 ?auto_99701 ) ) ( not ( = ?auto_99697 ?auto_99702 ) ) ( not ( = ?auto_99697 ?auto_99703 ) ) ( not ( = ?auto_99697 ?auto_99704 ) ) ( not ( = ?auto_99697 ?auto_99705 ) ) ( not ( = ?auto_99698 ?auto_99699 ) ) ( not ( = ?auto_99698 ?auto_99700 ) ) ( not ( = ?auto_99698 ?auto_99701 ) ) ( not ( = ?auto_99698 ?auto_99702 ) ) ( not ( = ?auto_99698 ?auto_99703 ) ) ( not ( = ?auto_99698 ?auto_99704 ) ) ( not ( = ?auto_99698 ?auto_99705 ) ) ( not ( = ?auto_99699 ?auto_99700 ) ) ( not ( = ?auto_99699 ?auto_99701 ) ) ( not ( = ?auto_99699 ?auto_99702 ) ) ( not ( = ?auto_99699 ?auto_99703 ) ) ( not ( = ?auto_99699 ?auto_99704 ) ) ( not ( = ?auto_99699 ?auto_99705 ) ) ( not ( = ?auto_99700 ?auto_99701 ) ) ( not ( = ?auto_99700 ?auto_99702 ) ) ( not ( = ?auto_99700 ?auto_99703 ) ) ( not ( = ?auto_99700 ?auto_99704 ) ) ( not ( = ?auto_99700 ?auto_99705 ) ) ( not ( = ?auto_99701 ?auto_99702 ) ) ( not ( = ?auto_99701 ?auto_99703 ) ) ( not ( = ?auto_99701 ?auto_99704 ) ) ( not ( = ?auto_99701 ?auto_99705 ) ) ( not ( = ?auto_99702 ?auto_99703 ) ) ( not ( = ?auto_99702 ?auto_99704 ) ) ( not ( = ?auto_99702 ?auto_99705 ) ) ( not ( = ?auto_99703 ?auto_99704 ) ) ( not ( = ?auto_99703 ?auto_99705 ) ) ( not ( = ?auto_99704 ?auto_99705 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_99705 )
      ( !STACK ?auto_99705 ?auto_99704 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99716 - BLOCK
      ?auto_99717 - BLOCK
      ?auto_99718 - BLOCK
      ?auto_99719 - BLOCK
      ?auto_99720 - BLOCK
      ?auto_99721 - BLOCK
      ?auto_99722 - BLOCK
      ?auto_99723 - BLOCK
      ?auto_99724 - BLOCK
      ?auto_99725 - BLOCK
    )
    :vars
    (
      ?auto_99726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99725 ?auto_99726 ) ( ON-TABLE ?auto_99716 ) ( ON ?auto_99717 ?auto_99716 ) ( ON ?auto_99718 ?auto_99717 ) ( ON ?auto_99719 ?auto_99718 ) ( ON ?auto_99720 ?auto_99719 ) ( ON ?auto_99721 ?auto_99720 ) ( ON ?auto_99722 ?auto_99721 ) ( ON ?auto_99723 ?auto_99722 ) ( not ( = ?auto_99716 ?auto_99717 ) ) ( not ( = ?auto_99716 ?auto_99718 ) ) ( not ( = ?auto_99716 ?auto_99719 ) ) ( not ( = ?auto_99716 ?auto_99720 ) ) ( not ( = ?auto_99716 ?auto_99721 ) ) ( not ( = ?auto_99716 ?auto_99722 ) ) ( not ( = ?auto_99716 ?auto_99723 ) ) ( not ( = ?auto_99716 ?auto_99724 ) ) ( not ( = ?auto_99716 ?auto_99725 ) ) ( not ( = ?auto_99716 ?auto_99726 ) ) ( not ( = ?auto_99717 ?auto_99718 ) ) ( not ( = ?auto_99717 ?auto_99719 ) ) ( not ( = ?auto_99717 ?auto_99720 ) ) ( not ( = ?auto_99717 ?auto_99721 ) ) ( not ( = ?auto_99717 ?auto_99722 ) ) ( not ( = ?auto_99717 ?auto_99723 ) ) ( not ( = ?auto_99717 ?auto_99724 ) ) ( not ( = ?auto_99717 ?auto_99725 ) ) ( not ( = ?auto_99717 ?auto_99726 ) ) ( not ( = ?auto_99718 ?auto_99719 ) ) ( not ( = ?auto_99718 ?auto_99720 ) ) ( not ( = ?auto_99718 ?auto_99721 ) ) ( not ( = ?auto_99718 ?auto_99722 ) ) ( not ( = ?auto_99718 ?auto_99723 ) ) ( not ( = ?auto_99718 ?auto_99724 ) ) ( not ( = ?auto_99718 ?auto_99725 ) ) ( not ( = ?auto_99718 ?auto_99726 ) ) ( not ( = ?auto_99719 ?auto_99720 ) ) ( not ( = ?auto_99719 ?auto_99721 ) ) ( not ( = ?auto_99719 ?auto_99722 ) ) ( not ( = ?auto_99719 ?auto_99723 ) ) ( not ( = ?auto_99719 ?auto_99724 ) ) ( not ( = ?auto_99719 ?auto_99725 ) ) ( not ( = ?auto_99719 ?auto_99726 ) ) ( not ( = ?auto_99720 ?auto_99721 ) ) ( not ( = ?auto_99720 ?auto_99722 ) ) ( not ( = ?auto_99720 ?auto_99723 ) ) ( not ( = ?auto_99720 ?auto_99724 ) ) ( not ( = ?auto_99720 ?auto_99725 ) ) ( not ( = ?auto_99720 ?auto_99726 ) ) ( not ( = ?auto_99721 ?auto_99722 ) ) ( not ( = ?auto_99721 ?auto_99723 ) ) ( not ( = ?auto_99721 ?auto_99724 ) ) ( not ( = ?auto_99721 ?auto_99725 ) ) ( not ( = ?auto_99721 ?auto_99726 ) ) ( not ( = ?auto_99722 ?auto_99723 ) ) ( not ( = ?auto_99722 ?auto_99724 ) ) ( not ( = ?auto_99722 ?auto_99725 ) ) ( not ( = ?auto_99722 ?auto_99726 ) ) ( not ( = ?auto_99723 ?auto_99724 ) ) ( not ( = ?auto_99723 ?auto_99725 ) ) ( not ( = ?auto_99723 ?auto_99726 ) ) ( not ( = ?auto_99724 ?auto_99725 ) ) ( not ( = ?auto_99724 ?auto_99726 ) ) ( not ( = ?auto_99725 ?auto_99726 ) ) ( CLEAR ?auto_99723 ) ( ON ?auto_99724 ?auto_99725 ) ( CLEAR ?auto_99724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_99716 ?auto_99717 ?auto_99718 ?auto_99719 ?auto_99720 ?auto_99721 ?auto_99722 ?auto_99723 ?auto_99724 )
      ( MAKE-10PILE ?auto_99716 ?auto_99717 ?auto_99718 ?auto_99719 ?auto_99720 ?auto_99721 ?auto_99722 ?auto_99723 ?auto_99724 ?auto_99725 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99737 - BLOCK
      ?auto_99738 - BLOCK
      ?auto_99739 - BLOCK
      ?auto_99740 - BLOCK
      ?auto_99741 - BLOCK
      ?auto_99742 - BLOCK
      ?auto_99743 - BLOCK
      ?auto_99744 - BLOCK
      ?auto_99745 - BLOCK
      ?auto_99746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99746 ) ( ON-TABLE ?auto_99737 ) ( ON ?auto_99738 ?auto_99737 ) ( ON ?auto_99739 ?auto_99738 ) ( ON ?auto_99740 ?auto_99739 ) ( ON ?auto_99741 ?auto_99740 ) ( ON ?auto_99742 ?auto_99741 ) ( ON ?auto_99743 ?auto_99742 ) ( ON ?auto_99744 ?auto_99743 ) ( not ( = ?auto_99737 ?auto_99738 ) ) ( not ( = ?auto_99737 ?auto_99739 ) ) ( not ( = ?auto_99737 ?auto_99740 ) ) ( not ( = ?auto_99737 ?auto_99741 ) ) ( not ( = ?auto_99737 ?auto_99742 ) ) ( not ( = ?auto_99737 ?auto_99743 ) ) ( not ( = ?auto_99737 ?auto_99744 ) ) ( not ( = ?auto_99737 ?auto_99745 ) ) ( not ( = ?auto_99737 ?auto_99746 ) ) ( not ( = ?auto_99738 ?auto_99739 ) ) ( not ( = ?auto_99738 ?auto_99740 ) ) ( not ( = ?auto_99738 ?auto_99741 ) ) ( not ( = ?auto_99738 ?auto_99742 ) ) ( not ( = ?auto_99738 ?auto_99743 ) ) ( not ( = ?auto_99738 ?auto_99744 ) ) ( not ( = ?auto_99738 ?auto_99745 ) ) ( not ( = ?auto_99738 ?auto_99746 ) ) ( not ( = ?auto_99739 ?auto_99740 ) ) ( not ( = ?auto_99739 ?auto_99741 ) ) ( not ( = ?auto_99739 ?auto_99742 ) ) ( not ( = ?auto_99739 ?auto_99743 ) ) ( not ( = ?auto_99739 ?auto_99744 ) ) ( not ( = ?auto_99739 ?auto_99745 ) ) ( not ( = ?auto_99739 ?auto_99746 ) ) ( not ( = ?auto_99740 ?auto_99741 ) ) ( not ( = ?auto_99740 ?auto_99742 ) ) ( not ( = ?auto_99740 ?auto_99743 ) ) ( not ( = ?auto_99740 ?auto_99744 ) ) ( not ( = ?auto_99740 ?auto_99745 ) ) ( not ( = ?auto_99740 ?auto_99746 ) ) ( not ( = ?auto_99741 ?auto_99742 ) ) ( not ( = ?auto_99741 ?auto_99743 ) ) ( not ( = ?auto_99741 ?auto_99744 ) ) ( not ( = ?auto_99741 ?auto_99745 ) ) ( not ( = ?auto_99741 ?auto_99746 ) ) ( not ( = ?auto_99742 ?auto_99743 ) ) ( not ( = ?auto_99742 ?auto_99744 ) ) ( not ( = ?auto_99742 ?auto_99745 ) ) ( not ( = ?auto_99742 ?auto_99746 ) ) ( not ( = ?auto_99743 ?auto_99744 ) ) ( not ( = ?auto_99743 ?auto_99745 ) ) ( not ( = ?auto_99743 ?auto_99746 ) ) ( not ( = ?auto_99744 ?auto_99745 ) ) ( not ( = ?auto_99744 ?auto_99746 ) ) ( not ( = ?auto_99745 ?auto_99746 ) ) ( CLEAR ?auto_99744 ) ( ON ?auto_99745 ?auto_99746 ) ( CLEAR ?auto_99745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_99737 ?auto_99738 ?auto_99739 ?auto_99740 ?auto_99741 ?auto_99742 ?auto_99743 ?auto_99744 ?auto_99745 )
      ( MAKE-10PILE ?auto_99737 ?auto_99738 ?auto_99739 ?auto_99740 ?auto_99741 ?auto_99742 ?auto_99743 ?auto_99744 ?auto_99745 ?auto_99746 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99757 - BLOCK
      ?auto_99758 - BLOCK
      ?auto_99759 - BLOCK
      ?auto_99760 - BLOCK
      ?auto_99761 - BLOCK
      ?auto_99762 - BLOCK
      ?auto_99763 - BLOCK
      ?auto_99764 - BLOCK
      ?auto_99765 - BLOCK
      ?auto_99766 - BLOCK
    )
    :vars
    (
      ?auto_99767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99766 ?auto_99767 ) ( ON-TABLE ?auto_99757 ) ( ON ?auto_99758 ?auto_99757 ) ( ON ?auto_99759 ?auto_99758 ) ( ON ?auto_99760 ?auto_99759 ) ( ON ?auto_99761 ?auto_99760 ) ( ON ?auto_99762 ?auto_99761 ) ( ON ?auto_99763 ?auto_99762 ) ( not ( = ?auto_99757 ?auto_99758 ) ) ( not ( = ?auto_99757 ?auto_99759 ) ) ( not ( = ?auto_99757 ?auto_99760 ) ) ( not ( = ?auto_99757 ?auto_99761 ) ) ( not ( = ?auto_99757 ?auto_99762 ) ) ( not ( = ?auto_99757 ?auto_99763 ) ) ( not ( = ?auto_99757 ?auto_99764 ) ) ( not ( = ?auto_99757 ?auto_99765 ) ) ( not ( = ?auto_99757 ?auto_99766 ) ) ( not ( = ?auto_99757 ?auto_99767 ) ) ( not ( = ?auto_99758 ?auto_99759 ) ) ( not ( = ?auto_99758 ?auto_99760 ) ) ( not ( = ?auto_99758 ?auto_99761 ) ) ( not ( = ?auto_99758 ?auto_99762 ) ) ( not ( = ?auto_99758 ?auto_99763 ) ) ( not ( = ?auto_99758 ?auto_99764 ) ) ( not ( = ?auto_99758 ?auto_99765 ) ) ( not ( = ?auto_99758 ?auto_99766 ) ) ( not ( = ?auto_99758 ?auto_99767 ) ) ( not ( = ?auto_99759 ?auto_99760 ) ) ( not ( = ?auto_99759 ?auto_99761 ) ) ( not ( = ?auto_99759 ?auto_99762 ) ) ( not ( = ?auto_99759 ?auto_99763 ) ) ( not ( = ?auto_99759 ?auto_99764 ) ) ( not ( = ?auto_99759 ?auto_99765 ) ) ( not ( = ?auto_99759 ?auto_99766 ) ) ( not ( = ?auto_99759 ?auto_99767 ) ) ( not ( = ?auto_99760 ?auto_99761 ) ) ( not ( = ?auto_99760 ?auto_99762 ) ) ( not ( = ?auto_99760 ?auto_99763 ) ) ( not ( = ?auto_99760 ?auto_99764 ) ) ( not ( = ?auto_99760 ?auto_99765 ) ) ( not ( = ?auto_99760 ?auto_99766 ) ) ( not ( = ?auto_99760 ?auto_99767 ) ) ( not ( = ?auto_99761 ?auto_99762 ) ) ( not ( = ?auto_99761 ?auto_99763 ) ) ( not ( = ?auto_99761 ?auto_99764 ) ) ( not ( = ?auto_99761 ?auto_99765 ) ) ( not ( = ?auto_99761 ?auto_99766 ) ) ( not ( = ?auto_99761 ?auto_99767 ) ) ( not ( = ?auto_99762 ?auto_99763 ) ) ( not ( = ?auto_99762 ?auto_99764 ) ) ( not ( = ?auto_99762 ?auto_99765 ) ) ( not ( = ?auto_99762 ?auto_99766 ) ) ( not ( = ?auto_99762 ?auto_99767 ) ) ( not ( = ?auto_99763 ?auto_99764 ) ) ( not ( = ?auto_99763 ?auto_99765 ) ) ( not ( = ?auto_99763 ?auto_99766 ) ) ( not ( = ?auto_99763 ?auto_99767 ) ) ( not ( = ?auto_99764 ?auto_99765 ) ) ( not ( = ?auto_99764 ?auto_99766 ) ) ( not ( = ?auto_99764 ?auto_99767 ) ) ( not ( = ?auto_99765 ?auto_99766 ) ) ( not ( = ?auto_99765 ?auto_99767 ) ) ( not ( = ?auto_99766 ?auto_99767 ) ) ( ON ?auto_99765 ?auto_99766 ) ( CLEAR ?auto_99763 ) ( ON ?auto_99764 ?auto_99765 ) ( CLEAR ?auto_99764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_99757 ?auto_99758 ?auto_99759 ?auto_99760 ?auto_99761 ?auto_99762 ?auto_99763 ?auto_99764 )
      ( MAKE-10PILE ?auto_99757 ?auto_99758 ?auto_99759 ?auto_99760 ?auto_99761 ?auto_99762 ?auto_99763 ?auto_99764 ?auto_99765 ?auto_99766 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99778 - BLOCK
      ?auto_99779 - BLOCK
      ?auto_99780 - BLOCK
      ?auto_99781 - BLOCK
      ?auto_99782 - BLOCK
      ?auto_99783 - BLOCK
      ?auto_99784 - BLOCK
      ?auto_99785 - BLOCK
      ?auto_99786 - BLOCK
      ?auto_99787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99787 ) ( ON-TABLE ?auto_99778 ) ( ON ?auto_99779 ?auto_99778 ) ( ON ?auto_99780 ?auto_99779 ) ( ON ?auto_99781 ?auto_99780 ) ( ON ?auto_99782 ?auto_99781 ) ( ON ?auto_99783 ?auto_99782 ) ( ON ?auto_99784 ?auto_99783 ) ( not ( = ?auto_99778 ?auto_99779 ) ) ( not ( = ?auto_99778 ?auto_99780 ) ) ( not ( = ?auto_99778 ?auto_99781 ) ) ( not ( = ?auto_99778 ?auto_99782 ) ) ( not ( = ?auto_99778 ?auto_99783 ) ) ( not ( = ?auto_99778 ?auto_99784 ) ) ( not ( = ?auto_99778 ?auto_99785 ) ) ( not ( = ?auto_99778 ?auto_99786 ) ) ( not ( = ?auto_99778 ?auto_99787 ) ) ( not ( = ?auto_99779 ?auto_99780 ) ) ( not ( = ?auto_99779 ?auto_99781 ) ) ( not ( = ?auto_99779 ?auto_99782 ) ) ( not ( = ?auto_99779 ?auto_99783 ) ) ( not ( = ?auto_99779 ?auto_99784 ) ) ( not ( = ?auto_99779 ?auto_99785 ) ) ( not ( = ?auto_99779 ?auto_99786 ) ) ( not ( = ?auto_99779 ?auto_99787 ) ) ( not ( = ?auto_99780 ?auto_99781 ) ) ( not ( = ?auto_99780 ?auto_99782 ) ) ( not ( = ?auto_99780 ?auto_99783 ) ) ( not ( = ?auto_99780 ?auto_99784 ) ) ( not ( = ?auto_99780 ?auto_99785 ) ) ( not ( = ?auto_99780 ?auto_99786 ) ) ( not ( = ?auto_99780 ?auto_99787 ) ) ( not ( = ?auto_99781 ?auto_99782 ) ) ( not ( = ?auto_99781 ?auto_99783 ) ) ( not ( = ?auto_99781 ?auto_99784 ) ) ( not ( = ?auto_99781 ?auto_99785 ) ) ( not ( = ?auto_99781 ?auto_99786 ) ) ( not ( = ?auto_99781 ?auto_99787 ) ) ( not ( = ?auto_99782 ?auto_99783 ) ) ( not ( = ?auto_99782 ?auto_99784 ) ) ( not ( = ?auto_99782 ?auto_99785 ) ) ( not ( = ?auto_99782 ?auto_99786 ) ) ( not ( = ?auto_99782 ?auto_99787 ) ) ( not ( = ?auto_99783 ?auto_99784 ) ) ( not ( = ?auto_99783 ?auto_99785 ) ) ( not ( = ?auto_99783 ?auto_99786 ) ) ( not ( = ?auto_99783 ?auto_99787 ) ) ( not ( = ?auto_99784 ?auto_99785 ) ) ( not ( = ?auto_99784 ?auto_99786 ) ) ( not ( = ?auto_99784 ?auto_99787 ) ) ( not ( = ?auto_99785 ?auto_99786 ) ) ( not ( = ?auto_99785 ?auto_99787 ) ) ( not ( = ?auto_99786 ?auto_99787 ) ) ( ON ?auto_99786 ?auto_99787 ) ( CLEAR ?auto_99784 ) ( ON ?auto_99785 ?auto_99786 ) ( CLEAR ?auto_99785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_99778 ?auto_99779 ?auto_99780 ?auto_99781 ?auto_99782 ?auto_99783 ?auto_99784 ?auto_99785 )
      ( MAKE-10PILE ?auto_99778 ?auto_99779 ?auto_99780 ?auto_99781 ?auto_99782 ?auto_99783 ?auto_99784 ?auto_99785 ?auto_99786 ?auto_99787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99798 - BLOCK
      ?auto_99799 - BLOCK
      ?auto_99800 - BLOCK
      ?auto_99801 - BLOCK
      ?auto_99802 - BLOCK
      ?auto_99803 - BLOCK
      ?auto_99804 - BLOCK
      ?auto_99805 - BLOCK
      ?auto_99806 - BLOCK
      ?auto_99807 - BLOCK
    )
    :vars
    (
      ?auto_99808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99807 ?auto_99808 ) ( ON-TABLE ?auto_99798 ) ( ON ?auto_99799 ?auto_99798 ) ( ON ?auto_99800 ?auto_99799 ) ( ON ?auto_99801 ?auto_99800 ) ( ON ?auto_99802 ?auto_99801 ) ( ON ?auto_99803 ?auto_99802 ) ( not ( = ?auto_99798 ?auto_99799 ) ) ( not ( = ?auto_99798 ?auto_99800 ) ) ( not ( = ?auto_99798 ?auto_99801 ) ) ( not ( = ?auto_99798 ?auto_99802 ) ) ( not ( = ?auto_99798 ?auto_99803 ) ) ( not ( = ?auto_99798 ?auto_99804 ) ) ( not ( = ?auto_99798 ?auto_99805 ) ) ( not ( = ?auto_99798 ?auto_99806 ) ) ( not ( = ?auto_99798 ?auto_99807 ) ) ( not ( = ?auto_99798 ?auto_99808 ) ) ( not ( = ?auto_99799 ?auto_99800 ) ) ( not ( = ?auto_99799 ?auto_99801 ) ) ( not ( = ?auto_99799 ?auto_99802 ) ) ( not ( = ?auto_99799 ?auto_99803 ) ) ( not ( = ?auto_99799 ?auto_99804 ) ) ( not ( = ?auto_99799 ?auto_99805 ) ) ( not ( = ?auto_99799 ?auto_99806 ) ) ( not ( = ?auto_99799 ?auto_99807 ) ) ( not ( = ?auto_99799 ?auto_99808 ) ) ( not ( = ?auto_99800 ?auto_99801 ) ) ( not ( = ?auto_99800 ?auto_99802 ) ) ( not ( = ?auto_99800 ?auto_99803 ) ) ( not ( = ?auto_99800 ?auto_99804 ) ) ( not ( = ?auto_99800 ?auto_99805 ) ) ( not ( = ?auto_99800 ?auto_99806 ) ) ( not ( = ?auto_99800 ?auto_99807 ) ) ( not ( = ?auto_99800 ?auto_99808 ) ) ( not ( = ?auto_99801 ?auto_99802 ) ) ( not ( = ?auto_99801 ?auto_99803 ) ) ( not ( = ?auto_99801 ?auto_99804 ) ) ( not ( = ?auto_99801 ?auto_99805 ) ) ( not ( = ?auto_99801 ?auto_99806 ) ) ( not ( = ?auto_99801 ?auto_99807 ) ) ( not ( = ?auto_99801 ?auto_99808 ) ) ( not ( = ?auto_99802 ?auto_99803 ) ) ( not ( = ?auto_99802 ?auto_99804 ) ) ( not ( = ?auto_99802 ?auto_99805 ) ) ( not ( = ?auto_99802 ?auto_99806 ) ) ( not ( = ?auto_99802 ?auto_99807 ) ) ( not ( = ?auto_99802 ?auto_99808 ) ) ( not ( = ?auto_99803 ?auto_99804 ) ) ( not ( = ?auto_99803 ?auto_99805 ) ) ( not ( = ?auto_99803 ?auto_99806 ) ) ( not ( = ?auto_99803 ?auto_99807 ) ) ( not ( = ?auto_99803 ?auto_99808 ) ) ( not ( = ?auto_99804 ?auto_99805 ) ) ( not ( = ?auto_99804 ?auto_99806 ) ) ( not ( = ?auto_99804 ?auto_99807 ) ) ( not ( = ?auto_99804 ?auto_99808 ) ) ( not ( = ?auto_99805 ?auto_99806 ) ) ( not ( = ?auto_99805 ?auto_99807 ) ) ( not ( = ?auto_99805 ?auto_99808 ) ) ( not ( = ?auto_99806 ?auto_99807 ) ) ( not ( = ?auto_99806 ?auto_99808 ) ) ( not ( = ?auto_99807 ?auto_99808 ) ) ( ON ?auto_99806 ?auto_99807 ) ( ON ?auto_99805 ?auto_99806 ) ( CLEAR ?auto_99803 ) ( ON ?auto_99804 ?auto_99805 ) ( CLEAR ?auto_99804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99798 ?auto_99799 ?auto_99800 ?auto_99801 ?auto_99802 ?auto_99803 ?auto_99804 )
      ( MAKE-10PILE ?auto_99798 ?auto_99799 ?auto_99800 ?auto_99801 ?auto_99802 ?auto_99803 ?auto_99804 ?auto_99805 ?auto_99806 ?auto_99807 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99819 - BLOCK
      ?auto_99820 - BLOCK
      ?auto_99821 - BLOCK
      ?auto_99822 - BLOCK
      ?auto_99823 - BLOCK
      ?auto_99824 - BLOCK
      ?auto_99825 - BLOCK
      ?auto_99826 - BLOCK
      ?auto_99827 - BLOCK
      ?auto_99828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99828 ) ( ON-TABLE ?auto_99819 ) ( ON ?auto_99820 ?auto_99819 ) ( ON ?auto_99821 ?auto_99820 ) ( ON ?auto_99822 ?auto_99821 ) ( ON ?auto_99823 ?auto_99822 ) ( ON ?auto_99824 ?auto_99823 ) ( not ( = ?auto_99819 ?auto_99820 ) ) ( not ( = ?auto_99819 ?auto_99821 ) ) ( not ( = ?auto_99819 ?auto_99822 ) ) ( not ( = ?auto_99819 ?auto_99823 ) ) ( not ( = ?auto_99819 ?auto_99824 ) ) ( not ( = ?auto_99819 ?auto_99825 ) ) ( not ( = ?auto_99819 ?auto_99826 ) ) ( not ( = ?auto_99819 ?auto_99827 ) ) ( not ( = ?auto_99819 ?auto_99828 ) ) ( not ( = ?auto_99820 ?auto_99821 ) ) ( not ( = ?auto_99820 ?auto_99822 ) ) ( not ( = ?auto_99820 ?auto_99823 ) ) ( not ( = ?auto_99820 ?auto_99824 ) ) ( not ( = ?auto_99820 ?auto_99825 ) ) ( not ( = ?auto_99820 ?auto_99826 ) ) ( not ( = ?auto_99820 ?auto_99827 ) ) ( not ( = ?auto_99820 ?auto_99828 ) ) ( not ( = ?auto_99821 ?auto_99822 ) ) ( not ( = ?auto_99821 ?auto_99823 ) ) ( not ( = ?auto_99821 ?auto_99824 ) ) ( not ( = ?auto_99821 ?auto_99825 ) ) ( not ( = ?auto_99821 ?auto_99826 ) ) ( not ( = ?auto_99821 ?auto_99827 ) ) ( not ( = ?auto_99821 ?auto_99828 ) ) ( not ( = ?auto_99822 ?auto_99823 ) ) ( not ( = ?auto_99822 ?auto_99824 ) ) ( not ( = ?auto_99822 ?auto_99825 ) ) ( not ( = ?auto_99822 ?auto_99826 ) ) ( not ( = ?auto_99822 ?auto_99827 ) ) ( not ( = ?auto_99822 ?auto_99828 ) ) ( not ( = ?auto_99823 ?auto_99824 ) ) ( not ( = ?auto_99823 ?auto_99825 ) ) ( not ( = ?auto_99823 ?auto_99826 ) ) ( not ( = ?auto_99823 ?auto_99827 ) ) ( not ( = ?auto_99823 ?auto_99828 ) ) ( not ( = ?auto_99824 ?auto_99825 ) ) ( not ( = ?auto_99824 ?auto_99826 ) ) ( not ( = ?auto_99824 ?auto_99827 ) ) ( not ( = ?auto_99824 ?auto_99828 ) ) ( not ( = ?auto_99825 ?auto_99826 ) ) ( not ( = ?auto_99825 ?auto_99827 ) ) ( not ( = ?auto_99825 ?auto_99828 ) ) ( not ( = ?auto_99826 ?auto_99827 ) ) ( not ( = ?auto_99826 ?auto_99828 ) ) ( not ( = ?auto_99827 ?auto_99828 ) ) ( ON ?auto_99827 ?auto_99828 ) ( ON ?auto_99826 ?auto_99827 ) ( CLEAR ?auto_99824 ) ( ON ?auto_99825 ?auto_99826 ) ( CLEAR ?auto_99825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99819 ?auto_99820 ?auto_99821 ?auto_99822 ?auto_99823 ?auto_99824 ?auto_99825 )
      ( MAKE-10PILE ?auto_99819 ?auto_99820 ?auto_99821 ?auto_99822 ?auto_99823 ?auto_99824 ?auto_99825 ?auto_99826 ?auto_99827 ?auto_99828 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99839 - BLOCK
      ?auto_99840 - BLOCK
      ?auto_99841 - BLOCK
      ?auto_99842 - BLOCK
      ?auto_99843 - BLOCK
      ?auto_99844 - BLOCK
      ?auto_99845 - BLOCK
      ?auto_99846 - BLOCK
      ?auto_99847 - BLOCK
      ?auto_99848 - BLOCK
    )
    :vars
    (
      ?auto_99849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99848 ?auto_99849 ) ( ON-TABLE ?auto_99839 ) ( ON ?auto_99840 ?auto_99839 ) ( ON ?auto_99841 ?auto_99840 ) ( ON ?auto_99842 ?auto_99841 ) ( ON ?auto_99843 ?auto_99842 ) ( not ( = ?auto_99839 ?auto_99840 ) ) ( not ( = ?auto_99839 ?auto_99841 ) ) ( not ( = ?auto_99839 ?auto_99842 ) ) ( not ( = ?auto_99839 ?auto_99843 ) ) ( not ( = ?auto_99839 ?auto_99844 ) ) ( not ( = ?auto_99839 ?auto_99845 ) ) ( not ( = ?auto_99839 ?auto_99846 ) ) ( not ( = ?auto_99839 ?auto_99847 ) ) ( not ( = ?auto_99839 ?auto_99848 ) ) ( not ( = ?auto_99839 ?auto_99849 ) ) ( not ( = ?auto_99840 ?auto_99841 ) ) ( not ( = ?auto_99840 ?auto_99842 ) ) ( not ( = ?auto_99840 ?auto_99843 ) ) ( not ( = ?auto_99840 ?auto_99844 ) ) ( not ( = ?auto_99840 ?auto_99845 ) ) ( not ( = ?auto_99840 ?auto_99846 ) ) ( not ( = ?auto_99840 ?auto_99847 ) ) ( not ( = ?auto_99840 ?auto_99848 ) ) ( not ( = ?auto_99840 ?auto_99849 ) ) ( not ( = ?auto_99841 ?auto_99842 ) ) ( not ( = ?auto_99841 ?auto_99843 ) ) ( not ( = ?auto_99841 ?auto_99844 ) ) ( not ( = ?auto_99841 ?auto_99845 ) ) ( not ( = ?auto_99841 ?auto_99846 ) ) ( not ( = ?auto_99841 ?auto_99847 ) ) ( not ( = ?auto_99841 ?auto_99848 ) ) ( not ( = ?auto_99841 ?auto_99849 ) ) ( not ( = ?auto_99842 ?auto_99843 ) ) ( not ( = ?auto_99842 ?auto_99844 ) ) ( not ( = ?auto_99842 ?auto_99845 ) ) ( not ( = ?auto_99842 ?auto_99846 ) ) ( not ( = ?auto_99842 ?auto_99847 ) ) ( not ( = ?auto_99842 ?auto_99848 ) ) ( not ( = ?auto_99842 ?auto_99849 ) ) ( not ( = ?auto_99843 ?auto_99844 ) ) ( not ( = ?auto_99843 ?auto_99845 ) ) ( not ( = ?auto_99843 ?auto_99846 ) ) ( not ( = ?auto_99843 ?auto_99847 ) ) ( not ( = ?auto_99843 ?auto_99848 ) ) ( not ( = ?auto_99843 ?auto_99849 ) ) ( not ( = ?auto_99844 ?auto_99845 ) ) ( not ( = ?auto_99844 ?auto_99846 ) ) ( not ( = ?auto_99844 ?auto_99847 ) ) ( not ( = ?auto_99844 ?auto_99848 ) ) ( not ( = ?auto_99844 ?auto_99849 ) ) ( not ( = ?auto_99845 ?auto_99846 ) ) ( not ( = ?auto_99845 ?auto_99847 ) ) ( not ( = ?auto_99845 ?auto_99848 ) ) ( not ( = ?auto_99845 ?auto_99849 ) ) ( not ( = ?auto_99846 ?auto_99847 ) ) ( not ( = ?auto_99846 ?auto_99848 ) ) ( not ( = ?auto_99846 ?auto_99849 ) ) ( not ( = ?auto_99847 ?auto_99848 ) ) ( not ( = ?auto_99847 ?auto_99849 ) ) ( not ( = ?auto_99848 ?auto_99849 ) ) ( ON ?auto_99847 ?auto_99848 ) ( ON ?auto_99846 ?auto_99847 ) ( ON ?auto_99845 ?auto_99846 ) ( CLEAR ?auto_99843 ) ( ON ?auto_99844 ?auto_99845 ) ( CLEAR ?auto_99844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99839 ?auto_99840 ?auto_99841 ?auto_99842 ?auto_99843 ?auto_99844 )
      ( MAKE-10PILE ?auto_99839 ?auto_99840 ?auto_99841 ?auto_99842 ?auto_99843 ?auto_99844 ?auto_99845 ?auto_99846 ?auto_99847 ?auto_99848 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99860 - BLOCK
      ?auto_99861 - BLOCK
      ?auto_99862 - BLOCK
      ?auto_99863 - BLOCK
      ?auto_99864 - BLOCK
      ?auto_99865 - BLOCK
      ?auto_99866 - BLOCK
      ?auto_99867 - BLOCK
      ?auto_99868 - BLOCK
      ?auto_99869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99869 ) ( ON-TABLE ?auto_99860 ) ( ON ?auto_99861 ?auto_99860 ) ( ON ?auto_99862 ?auto_99861 ) ( ON ?auto_99863 ?auto_99862 ) ( ON ?auto_99864 ?auto_99863 ) ( not ( = ?auto_99860 ?auto_99861 ) ) ( not ( = ?auto_99860 ?auto_99862 ) ) ( not ( = ?auto_99860 ?auto_99863 ) ) ( not ( = ?auto_99860 ?auto_99864 ) ) ( not ( = ?auto_99860 ?auto_99865 ) ) ( not ( = ?auto_99860 ?auto_99866 ) ) ( not ( = ?auto_99860 ?auto_99867 ) ) ( not ( = ?auto_99860 ?auto_99868 ) ) ( not ( = ?auto_99860 ?auto_99869 ) ) ( not ( = ?auto_99861 ?auto_99862 ) ) ( not ( = ?auto_99861 ?auto_99863 ) ) ( not ( = ?auto_99861 ?auto_99864 ) ) ( not ( = ?auto_99861 ?auto_99865 ) ) ( not ( = ?auto_99861 ?auto_99866 ) ) ( not ( = ?auto_99861 ?auto_99867 ) ) ( not ( = ?auto_99861 ?auto_99868 ) ) ( not ( = ?auto_99861 ?auto_99869 ) ) ( not ( = ?auto_99862 ?auto_99863 ) ) ( not ( = ?auto_99862 ?auto_99864 ) ) ( not ( = ?auto_99862 ?auto_99865 ) ) ( not ( = ?auto_99862 ?auto_99866 ) ) ( not ( = ?auto_99862 ?auto_99867 ) ) ( not ( = ?auto_99862 ?auto_99868 ) ) ( not ( = ?auto_99862 ?auto_99869 ) ) ( not ( = ?auto_99863 ?auto_99864 ) ) ( not ( = ?auto_99863 ?auto_99865 ) ) ( not ( = ?auto_99863 ?auto_99866 ) ) ( not ( = ?auto_99863 ?auto_99867 ) ) ( not ( = ?auto_99863 ?auto_99868 ) ) ( not ( = ?auto_99863 ?auto_99869 ) ) ( not ( = ?auto_99864 ?auto_99865 ) ) ( not ( = ?auto_99864 ?auto_99866 ) ) ( not ( = ?auto_99864 ?auto_99867 ) ) ( not ( = ?auto_99864 ?auto_99868 ) ) ( not ( = ?auto_99864 ?auto_99869 ) ) ( not ( = ?auto_99865 ?auto_99866 ) ) ( not ( = ?auto_99865 ?auto_99867 ) ) ( not ( = ?auto_99865 ?auto_99868 ) ) ( not ( = ?auto_99865 ?auto_99869 ) ) ( not ( = ?auto_99866 ?auto_99867 ) ) ( not ( = ?auto_99866 ?auto_99868 ) ) ( not ( = ?auto_99866 ?auto_99869 ) ) ( not ( = ?auto_99867 ?auto_99868 ) ) ( not ( = ?auto_99867 ?auto_99869 ) ) ( not ( = ?auto_99868 ?auto_99869 ) ) ( ON ?auto_99868 ?auto_99869 ) ( ON ?auto_99867 ?auto_99868 ) ( ON ?auto_99866 ?auto_99867 ) ( CLEAR ?auto_99864 ) ( ON ?auto_99865 ?auto_99866 ) ( CLEAR ?auto_99865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99860 ?auto_99861 ?auto_99862 ?auto_99863 ?auto_99864 ?auto_99865 )
      ( MAKE-10PILE ?auto_99860 ?auto_99861 ?auto_99862 ?auto_99863 ?auto_99864 ?auto_99865 ?auto_99866 ?auto_99867 ?auto_99868 ?auto_99869 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99880 - BLOCK
      ?auto_99881 - BLOCK
      ?auto_99882 - BLOCK
      ?auto_99883 - BLOCK
      ?auto_99884 - BLOCK
      ?auto_99885 - BLOCK
      ?auto_99886 - BLOCK
      ?auto_99887 - BLOCK
      ?auto_99888 - BLOCK
      ?auto_99889 - BLOCK
    )
    :vars
    (
      ?auto_99890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99889 ?auto_99890 ) ( ON-TABLE ?auto_99880 ) ( ON ?auto_99881 ?auto_99880 ) ( ON ?auto_99882 ?auto_99881 ) ( ON ?auto_99883 ?auto_99882 ) ( not ( = ?auto_99880 ?auto_99881 ) ) ( not ( = ?auto_99880 ?auto_99882 ) ) ( not ( = ?auto_99880 ?auto_99883 ) ) ( not ( = ?auto_99880 ?auto_99884 ) ) ( not ( = ?auto_99880 ?auto_99885 ) ) ( not ( = ?auto_99880 ?auto_99886 ) ) ( not ( = ?auto_99880 ?auto_99887 ) ) ( not ( = ?auto_99880 ?auto_99888 ) ) ( not ( = ?auto_99880 ?auto_99889 ) ) ( not ( = ?auto_99880 ?auto_99890 ) ) ( not ( = ?auto_99881 ?auto_99882 ) ) ( not ( = ?auto_99881 ?auto_99883 ) ) ( not ( = ?auto_99881 ?auto_99884 ) ) ( not ( = ?auto_99881 ?auto_99885 ) ) ( not ( = ?auto_99881 ?auto_99886 ) ) ( not ( = ?auto_99881 ?auto_99887 ) ) ( not ( = ?auto_99881 ?auto_99888 ) ) ( not ( = ?auto_99881 ?auto_99889 ) ) ( not ( = ?auto_99881 ?auto_99890 ) ) ( not ( = ?auto_99882 ?auto_99883 ) ) ( not ( = ?auto_99882 ?auto_99884 ) ) ( not ( = ?auto_99882 ?auto_99885 ) ) ( not ( = ?auto_99882 ?auto_99886 ) ) ( not ( = ?auto_99882 ?auto_99887 ) ) ( not ( = ?auto_99882 ?auto_99888 ) ) ( not ( = ?auto_99882 ?auto_99889 ) ) ( not ( = ?auto_99882 ?auto_99890 ) ) ( not ( = ?auto_99883 ?auto_99884 ) ) ( not ( = ?auto_99883 ?auto_99885 ) ) ( not ( = ?auto_99883 ?auto_99886 ) ) ( not ( = ?auto_99883 ?auto_99887 ) ) ( not ( = ?auto_99883 ?auto_99888 ) ) ( not ( = ?auto_99883 ?auto_99889 ) ) ( not ( = ?auto_99883 ?auto_99890 ) ) ( not ( = ?auto_99884 ?auto_99885 ) ) ( not ( = ?auto_99884 ?auto_99886 ) ) ( not ( = ?auto_99884 ?auto_99887 ) ) ( not ( = ?auto_99884 ?auto_99888 ) ) ( not ( = ?auto_99884 ?auto_99889 ) ) ( not ( = ?auto_99884 ?auto_99890 ) ) ( not ( = ?auto_99885 ?auto_99886 ) ) ( not ( = ?auto_99885 ?auto_99887 ) ) ( not ( = ?auto_99885 ?auto_99888 ) ) ( not ( = ?auto_99885 ?auto_99889 ) ) ( not ( = ?auto_99885 ?auto_99890 ) ) ( not ( = ?auto_99886 ?auto_99887 ) ) ( not ( = ?auto_99886 ?auto_99888 ) ) ( not ( = ?auto_99886 ?auto_99889 ) ) ( not ( = ?auto_99886 ?auto_99890 ) ) ( not ( = ?auto_99887 ?auto_99888 ) ) ( not ( = ?auto_99887 ?auto_99889 ) ) ( not ( = ?auto_99887 ?auto_99890 ) ) ( not ( = ?auto_99888 ?auto_99889 ) ) ( not ( = ?auto_99888 ?auto_99890 ) ) ( not ( = ?auto_99889 ?auto_99890 ) ) ( ON ?auto_99888 ?auto_99889 ) ( ON ?auto_99887 ?auto_99888 ) ( ON ?auto_99886 ?auto_99887 ) ( ON ?auto_99885 ?auto_99886 ) ( CLEAR ?auto_99883 ) ( ON ?auto_99884 ?auto_99885 ) ( CLEAR ?auto_99884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99880 ?auto_99881 ?auto_99882 ?auto_99883 ?auto_99884 )
      ( MAKE-10PILE ?auto_99880 ?auto_99881 ?auto_99882 ?auto_99883 ?auto_99884 ?auto_99885 ?auto_99886 ?auto_99887 ?auto_99888 ?auto_99889 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99901 - BLOCK
      ?auto_99902 - BLOCK
      ?auto_99903 - BLOCK
      ?auto_99904 - BLOCK
      ?auto_99905 - BLOCK
      ?auto_99906 - BLOCK
      ?auto_99907 - BLOCK
      ?auto_99908 - BLOCK
      ?auto_99909 - BLOCK
      ?auto_99910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99910 ) ( ON-TABLE ?auto_99901 ) ( ON ?auto_99902 ?auto_99901 ) ( ON ?auto_99903 ?auto_99902 ) ( ON ?auto_99904 ?auto_99903 ) ( not ( = ?auto_99901 ?auto_99902 ) ) ( not ( = ?auto_99901 ?auto_99903 ) ) ( not ( = ?auto_99901 ?auto_99904 ) ) ( not ( = ?auto_99901 ?auto_99905 ) ) ( not ( = ?auto_99901 ?auto_99906 ) ) ( not ( = ?auto_99901 ?auto_99907 ) ) ( not ( = ?auto_99901 ?auto_99908 ) ) ( not ( = ?auto_99901 ?auto_99909 ) ) ( not ( = ?auto_99901 ?auto_99910 ) ) ( not ( = ?auto_99902 ?auto_99903 ) ) ( not ( = ?auto_99902 ?auto_99904 ) ) ( not ( = ?auto_99902 ?auto_99905 ) ) ( not ( = ?auto_99902 ?auto_99906 ) ) ( not ( = ?auto_99902 ?auto_99907 ) ) ( not ( = ?auto_99902 ?auto_99908 ) ) ( not ( = ?auto_99902 ?auto_99909 ) ) ( not ( = ?auto_99902 ?auto_99910 ) ) ( not ( = ?auto_99903 ?auto_99904 ) ) ( not ( = ?auto_99903 ?auto_99905 ) ) ( not ( = ?auto_99903 ?auto_99906 ) ) ( not ( = ?auto_99903 ?auto_99907 ) ) ( not ( = ?auto_99903 ?auto_99908 ) ) ( not ( = ?auto_99903 ?auto_99909 ) ) ( not ( = ?auto_99903 ?auto_99910 ) ) ( not ( = ?auto_99904 ?auto_99905 ) ) ( not ( = ?auto_99904 ?auto_99906 ) ) ( not ( = ?auto_99904 ?auto_99907 ) ) ( not ( = ?auto_99904 ?auto_99908 ) ) ( not ( = ?auto_99904 ?auto_99909 ) ) ( not ( = ?auto_99904 ?auto_99910 ) ) ( not ( = ?auto_99905 ?auto_99906 ) ) ( not ( = ?auto_99905 ?auto_99907 ) ) ( not ( = ?auto_99905 ?auto_99908 ) ) ( not ( = ?auto_99905 ?auto_99909 ) ) ( not ( = ?auto_99905 ?auto_99910 ) ) ( not ( = ?auto_99906 ?auto_99907 ) ) ( not ( = ?auto_99906 ?auto_99908 ) ) ( not ( = ?auto_99906 ?auto_99909 ) ) ( not ( = ?auto_99906 ?auto_99910 ) ) ( not ( = ?auto_99907 ?auto_99908 ) ) ( not ( = ?auto_99907 ?auto_99909 ) ) ( not ( = ?auto_99907 ?auto_99910 ) ) ( not ( = ?auto_99908 ?auto_99909 ) ) ( not ( = ?auto_99908 ?auto_99910 ) ) ( not ( = ?auto_99909 ?auto_99910 ) ) ( ON ?auto_99909 ?auto_99910 ) ( ON ?auto_99908 ?auto_99909 ) ( ON ?auto_99907 ?auto_99908 ) ( ON ?auto_99906 ?auto_99907 ) ( CLEAR ?auto_99904 ) ( ON ?auto_99905 ?auto_99906 ) ( CLEAR ?auto_99905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99901 ?auto_99902 ?auto_99903 ?auto_99904 ?auto_99905 )
      ( MAKE-10PILE ?auto_99901 ?auto_99902 ?auto_99903 ?auto_99904 ?auto_99905 ?auto_99906 ?auto_99907 ?auto_99908 ?auto_99909 ?auto_99910 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99921 - BLOCK
      ?auto_99922 - BLOCK
      ?auto_99923 - BLOCK
      ?auto_99924 - BLOCK
      ?auto_99925 - BLOCK
      ?auto_99926 - BLOCK
      ?auto_99927 - BLOCK
      ?auto_99928 - BLOCK
      ?auto_99929 - BLOCK
      ?auto_99930 - BLOCK
    )
    :vars
    (
      ?auto_99931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99930 ?auto_99931 ) ( ON-TABLE ?auto_99921 ) ( ON ?auto_99922 ?auto_99921 ) ( ON ?auto_99923 ?auto_99922 ) ( not ( = ?auto_99921 ?auto_99922 ) ) ( not ( = ?auto_99921 ?auto_99923 ) ) ( not ( = ?auto_99921 ?auto_99924 ) ) ( not ( = ?auto_99921 ?auto_99925 ) ) ( not ( = ?auto_99921 ?auto_99926 ) ) ( not ( = ?auto_99921 ?auto_99927 ) ) ( not ( = ?auto_99921 ?auto_99928 ) ) ( not ( = ?auto_99921 ?auto_99929 ) ) ( not ( = ?auto_99921 ?auto_99930 ) ) ( not ( = ?auto_99921 ?auto_99931 ) ) ( not ( = ?auto_99922 ?auto_99923 ) ) ( not ( = ?auto_99922 ?auto_99924 ) ) ( not ( = ?auto_99922 ?auto_99925 ) ) ( not ( = ?auto_99922 ?auto_99926 ) ) ( not ( = ?auto_99922 ?auto_99927 ) ) ( not ( = ?auto_99922 ?auto_99928 ) ) ( not ( = ?auto_99922 ?auto_99929 ) ) ( not ( = ?auto_99922 ?auto_99930 ) ) ( not ( = ?auto_99922 ?auto_99931 ) ) ( not ( = ?auto_99923 ?auto_99924 ) ) ( not ( = ?auto_99923 ?auto_99925 ) ) ( not ( = ?auto_99923 ?auto_99926 ) ) ( not ( = ?auto_99923 ?auto_99927 ) ) ( not ( = ?auto_99923 ?auto_99928 ) ) ( not ( = ?auto_99923 ?auto_99929 ) ) ( not ( = ?auto_99923 ?auto_99930 ) ) ( not ( = ?auto_99923 ?auto_99931 ) ) ( not ( = ?auto_99924 ?auto_99925 ) ) ( not ( = ?auto_99924 ?auto_99926 ) ) ( not ( = ?auto_99924 ?auto_99927 ) ) ( not ( = ?auto_99924 ?auto_99928 ) ) ( not ( = ?auto_99924 ?auto_99929 ) ) ( not ( = ?auto_99924 ?auto_99930 ) ) ( not ( = ?auto_99924 ?auto_99931 ) ) ( not ( = ?auto_99925 ?auto_99926 ) ) ( not ( = ?auto_99925 ?auto_99927 ) ) ( not ( = ?auto_99925 ?auto_99928 ) ) ( not ( = ?auto_99925 ?auto_99929 ) ) ( not ( = ?auto_99925 ?auto_99930 ) ) ( not ( = ?auto_99925 ?auto_99931 ) ) ( not ( = ?auto_99926 ?auto_99927 ) ) ( not ( = ?auto_99926 ?auto_99928 ) ) ( not ( = ?auto_99926 ?auto_99929 ) ) ( not ( = ?auto_99926 ?auto_99930 ) ) ( not ( = ?auto_99926 ?auto_99931 ) ) ( not ( = ?auto_99927 ?auto_99928 ) ) ( not ( = ?auto_99927 ?auto_99929 ) ) ( not ( = ?auto_99927 ?auto_99930 ) ) ( not ( = ?auto_99927 ?auto_99931 ) ) ( not ( = ?auto_99928 ?auto_99929 ) ) ( not ( = ?auto_99928 ?auto_99930 ) ) ( not ( = ?auto_99928 ?auto_99931 ) ) ( not ( = ?auto_99929 ?auto_99930 ) ) ( not ( = ?auto_99929 ?auto_99931 ) ) ( not ( = ?auto_99930 ?auto_99931 ) ) ( ON ?auto_99929 ?auto_99930 ) ( ON ?auto_99928 ?auto_99929 ) ( ON ?auto_99927 ?auto_99928 ) ( ON ?auto_99926 ?auto_99927 ) ( ON ?auto_99925 ?auto_99926 ) ( CLEAR ?auto_99923 ) ( ON ?auto_99924 ?auto_99925 ) ( CLEAR ?auto_99924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99921 ?auto_99922 ?auto_99923 ?auto_99924 )
      ( MAKE-10PILE ?auto_99921 ?auto_99922 ?auto_99923 ?auto_99924 ?auto_99925 ?auto_99926 ?auto_99927 ?auto_99928 ?auto_99929 ?auto_99930 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99942 - BLOCK
      ?auto_99943 - BLOCK
      ?auto_99944 - BLOCK
      ?auto_99945 - BLOCK
      ?auto_99946 - BLOCK
      ?auto_99947 - BLOCK
      ?auto_99948 - BLOCK
      ?auto_99949 - BLOCK
      ?auto_99950 - BLOCK
      ?auto_99951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99951 ) ( ON-TABLE ?auto_99942 ) ( ON ?auto_99943 ?auto_99942 ) ( ON ?auto_99944 ?auto_99943 ) ( not ( = ?auto_99942 ?auto_99943 ) ) ( not ( = ?auto_99942 ?auto_99944 ) ) ( not ( = ?auto_99942 ?auto_99945 ) ) ( not ( = ?auto_99942 ?auto_99946 ) ) ( not ( = ?auto_99942 ?auto_99947 ) ) ( not ( = ?auto_99942 ?auto_99948 ) ) ( not ( = ?auto_99942 ?auto_99949 ) ) ( not ( = ?auto_99942 ?auto_99950 ) ) ( not ( = ?auto_99942 ?auto_99951 ) ) ( not ( = ?auto_99943 ?auto_99944 ) ) ( not ( = ?auto_99943 ?auto_99945 ) ) ( not ( = ?auto_99943 ?auto_99946 ) ) ( not ( = ?auto_99943 ?auto_99947 ) ) ( not ( = ?auto_99943 ?auto_99948 ) ) ( not ( = ?auto_99943 ?auto_99949 ) ) ( not ( = ?auto_99943 ?auto_99950 ) ) ( not ( = ?auto_99943 ?auto_99951 ) ) ( not ( = ?auto_99944 ?auto_99945 ) ) ( not ( = ?auto_99944 ?auto_99946 ) ) ( not ( = ?auto_99944 ?auto_99947 ) ) ( not ( = ?auto_99944 ?auto_99948 ) ) ( not ( = ?auto_99944 ?auto_99949 ) ) ( not ( = ?auto_99944 ?auto_99950 ) ) ( not ( = ?auto_99944 ?auto_99951 ) ) ( not ( = ?auto_99945 ?auto_99946 ) ) ( not ( = ?auto_99945 ?auto_99947 ) ) ( not ( = ?auto_99945 ?auto_99948 ) ) ( not ( = ?auto_99945 ?auto_99949 ) ) ( not ( = ?auto_99945 ?auto_99950 ) ) ( not ( = ?auto_99945 ?auto_99951 ) ) ( not ( = ?auto_99946 ?auto_99947 ) ) ( not ( = ?auto_99946 ?auto_99948 ) ) ( not ( = ?auto_99946 ?auto_99949 ) ) ( not ( = ?auto_99946 ?auto_99950 ) ) ( not ( = ?auto_99946 ?auto_99951 ) ) ( not ( = ?auto_99947 ?auto_99948 ) ) ( not ( = ?auto_99947 ?auto_99949 ) ) ( not ( = ?auto_99947 ?auto_99950 ) ) ( not ( = ?auto_99947 ?auto_99951 ) ) ( not ( = ?auto_99948 ?auto_99949 ) ) ( not ( = ?auto_99948 ?auto_99950 ) ) ( not ( = ?auto_99948 ?auto_99951 ) ) ( not ( = ?auto_99949 ?auto_99950 ) ) ( not ( = ?auto_99949 ?auto_99951 ) ) ( not ( = ?auto_99950 ?auto_99951 ) ) ( ON ?auto_99950 ?auto_99951 ) ( ON ?auto_99949 ?auto_99950 ) ( ON ?auto_99948 ?auto_99949 ) ( ON ?auto_99947 ?auto_99948 ) ( ON ?auto_99946 ?auto_99947 ) ( CLEAR ?auto_99944 ) ( ON ?auto_99945 ?auto_99946 ) ( CLEAR ?auto_99945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99942 ?auto_99943 ?auto_99944 ?auto_99945 )
      ( MAKE-10PILE ?auto_99942 ?auto_99943 ?auto_99944 ?auto_99945 ?auto_99946 ?auto_99947 ?auto_99948 ?auto_99949 ?auto_99950 ?auto_99951 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99962 - BLOCK
      ?auto_99963 - BLOCK
      ?auto_99964 - BLOCK
      ?auto_99965 - BLOCK
      ?auto_99966 - BLOCK
      ?auto_99967 - BLOCK
      ?auto_99968 - BLOCK
      ?auto_99969 - BLOCK
      ?auto_99970 - BLOCK
      ?auto_99971 - BLOCK
    )
    :vars
    (
      ?auto_99972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_99971 ?auto_99972 ) ( ON-TABLE ?auto_99962 ) ( ON ?auto_99963 ?auto_99962 ) ( not ( = ?auto_99962 ?auto_99963 ) ) ( not ( = ?auto_99962 ?auto_99964 ) ) ( not ( = ?auto_99962 ?auto_99965 ) ) ( not ( = ?auto_99962 ?auto_99966 ) ) ( not ( = ?auto_99962 ?auto_99967 ) ) ( not ( = ?auto_99962 ?auto_99968 ) ) ( not ( = ?auto_99962 ?auto_99969 ) ) ( not ( = ?auto_99962 ?auto_99970 ) ) ( not ( = ?auto_99962 ?auto_99971 ) ) ( not ( = ?auto_99962 ?auto_99972 ) ) ( not ( = ?auto_99963 ?auto_99964 ) ) ( not ( = ?auto_99963 ?auto_99965 ) ) ( not ( = ?auto_99963 ?auto_99966 ) ) ( not ( = ?auto_99963 ?auto_99967 ) ) ( not ( = ?auto_99963 ?auto_99968 ) ) ( not ( = ?auto_99963 ?auto_99969 ) ) ( not ( = ?auto_99963 ?auto_99970 ) ) ( not ( = ?auto_99963 ?auto_99971 ) ) ( not ( = ?auto_99963 ?auto_99972 ) ) ( not ( = ?auto_99964 ?auto_99965 ) ) ( not ( = ?auto_99964 ?auto_99966 ) ) ( not ( = ?auto_99964 ?auto_99967 ) ) ( not ( = ?auto_99964 ?auto_99968 ) ) ( not ( = ?auto_99964 ?auto_99969 ) ) ( not ( = ?auto_99964 ?auto_99970 ) ) ( not ( = ?auto_99964 ?auto_99971 ) ) ( not ( = ?auto_99964 ?auto_99972 ) ) ( not ( = ?auto_99965 ?auto_99966 ) ) ( not ( = ?auto_99965 ?auto_99967 ) ) ( not ( = ?auto_99965 ?auto_99968 ) ) ( not ( = ?auto_99965 ?auto_99969 ) ) ( not ( = ?auto_99965 ?auto_99970 ) ) ( not ( = ?auto_99965 ?auto_99971 ) ) ( not ( = ?auto_99965 ?auto_99972 ) ) ( not ( = ?auto_99966 ?auto_99967 ) ) ( not ( = ?auto_99966 ?auto_99968 ) ) ( not ( = ?auto_99966 ?auto_99969 ) ) ( not ( = ?auto_99966 ?auto_99970 ) ) ( not ( = ?auto_99966 ?auto_99971 ) ) ( not ( = ?auto_99966 ?auto_99972 ) ) ( not ( = ?auto_99967 ?auto_99968 ) ) ( not ( = ?auto_99967 ?auto_99969 ) ) ( not ( = ?auto_99967 ?auto_99970 ) ) ( not ( = ?auto_99967 ?auto_99971 ) ) ( not ( = ?auto_99967 ?auto_99972 ) ) ( not ( = ?auto_99968 ?auto_99969 ) ) ( not ( = ?auto_99968 ?auto_99970 ) ) ( not ( = ?auto_99968 ?auto_99971 ) ) ( not ( = ?auto_99968 ?auto_99972 ) ) ( not ( = ?auto_99969 ?auto_99970 ) ) ( not ( = ?auto_99969 ?auto_99971 ) ) ( not ( = ?auto_99969 ?auto_99972 ) ) ( not ( = ?auto_99970 ?auto_99971 ) ) ( not ( = ?auto_99970 ?auto_99972 ) ) ( not ( = ?auto_99971 ?auto_99972 ) ) ( ON ?auto_99970 ?auto_99971 ) ( ON ?auto_99969 ?auto_99970 ) ( ON ?auto_99968 ?auto_99969 ) ( ON ?auto_99967 ?auto_99968 ) ( ON ?auto_99966 ?auto_99967 ) ( ON ?auto_99965 ?auto_99966 ) ( CLEAR ?auto_99963 ) ( ON ?auto_99964 ?auto_99965 ) ( CLEAR ?auto_99964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99962 ?auto_99963 ?auto_99964 )
      ( MAKE-10PILE ?auto_99962 ?auto_99963 ?auto_99964 ?auto_99965 ?auto_99966 ?auto_99967 ?auto_99968 ?auto_99969 ?auto_99970 ?auto_99971 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_99983 - BLOCK
      ?auto_99984 - BLOCK
      ?auto_99985 - BLOCK
      ?auto_99986 - BLOCK
      ?auto_99987 - BLOCK
      ?auto_99988 - BLOCK
      ?auto_99989 - BLOCK
      ?auto_99990 - BLOCK
      ?auto_99991 - BLOCK
      ?auto_99992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99992 ) ( ON-TABLE ?auto_99983 ) ( ON ?auto_99984 ?auto_99983 ) ( not ( = ?auto_99983 ?auto_99984 ) ) ( not ( = ?auto_99983 ?auto_99985 ) ) ( not ( = ?auto_99983 ?auto_99986 ) ) ( not ( = ?auto_99983 ?auto_99987 ) ) ( not ( = ?auto_99983 ?auto_99988 ) ) ( not ( = ?auto_99983 ?auto_99989 ) ) ( not ( = ?auto_99983 ?auto_99990 ) ) ( not ( = ?auto_99983 ?auto_99991 ) ) ( not ( = ?auto_99983 ?auto_99992 ) ) ( not ( = ?auto_99984 ?auto_99985 ) ) ( not ( = ?auto_99984 ?auto_99986 ) ) ( not ( = ?auto_99984 ?auto_99987 ) ) ( not ( = ?auto_99984 ?auto_99988 ) ) ( not ( = ?auto_99984 ?auto_99989 ) ) ( not ( = ?auto_99984 ?auto_99990 ) ) ( not ( = ?auto_99984 ?auto_99991 ) ) ( not ( = ?auto_99984 ?auto_99992 ) ) ( not ( = ?auto_99985 ?auto_99986 ) ) ( not ( = ?auto_99985 ?auto_99987 ) ) ( not ( = ?auto_99985 ?auto_99988 ) ) ( not ( = ?auto_99985 ?auto_99989 ) ) ( not ( = ?auto_99985 ?auto_99990 ) ) ( not ( = ?auto_99985 ?auto_99991 ) ) ( not ( = ?auto_99985 ?auto_99992 ) ) ( not ( = ?auto_99986 ?auto_99987 ) ) ( not ( = ?auto_99986 ?auto_99988 ) ) ( not ( = ?auto_99986 ?auto_99989 ) ) ( not ( = ?auto_99986 ?auto_99990 ) ) ( not ( = ?auto_99986 ?auto_99991 ) ) ( not ( = ?auto_99986 ?auto_99992 ) ) ( not ( = ?auto_99987 ?auto_99988 ) ) ( not ( = ?auto_99987 ?auto_99989 ) ) ( not ( = ?auto_99987 ?auto_99990 ) ) ( not ( = ?auto_99987 ?auto_99991 ) ) ( not ( = ?auto_99987 ?auto_99992 ) ) ( not ( = ?auto_99988 ?auto_99989 ) ) ( not ( = ?auto_99988 ?auto_99990 ) ) ( not ( = ?auto_99988 ?auto_99991 ) ) ( not ( = ?auto_99988 ?auto_99992 ) ) ( not ( = ?auto_99989 ?auto_99990 ) ) ( not ( = ?auto_99989 ?auto_99991 ) ) ( not ( = ?auto_99989 ?auto_99992 ) ) ( not ( = ?auto_99990 ?auto_99991 ) ) ( not ( = ?auto_99990 ?auto_99992 ) ) ( not ( = ?auto_99991 ?auto_99992 ) ) ( ON ?auto_99991 ?auto_99992 ) ( ON ?auto_99990 ?auto_99991 ) ( ON ?auto_99989 ?auto_99990 ) ( ON ?auto_99988 ?auto_99989 ) ( ON ?auto_99987 ?auto_99988 ) ( ON ?auto_99986 ?auto_99987 ) ( CLEAR ?auto_99984 ) ( ON ?auto_99985 ?auto_99986 ) ( CLEAR ?auto_99985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99983 ?auto_99984 ?auto_99985 )
      ( MAKE-10PILE ?auto_99983 ?auto_99984 ?auto_99985 ?auto_99986 ?auto_99987 ?auto_99988 ?auto_99989 ?auto_99990 ?auto_99991 ?auto_99992 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_100003 - BLOCK
      ?auto_100004 - BLOCK
      ?auto_100005 - BLOCK
      ?auto_100006 - BLOCK
      ?auto_100007 - BLOCK
      ?auto_100008 - BLOCK
      ?auto_100009 - BLOCK
      ?auto_100010 - BLOCK
      ?auto_100011 - BLOCK
      ?auto_100012 - BLOCK
    )
    :vars
    (
      ?auto_100013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100012 ?auto_100013 ) ( ON-TABLE ?auto_100003 ) ( not ( = ?auto_100003 ?auto_100004 ) ) ( not ( = ?auto_100003 ?auto_100005 ) ) ( not ( = ?auto_100003 ?auto_100006 ) ) ( not ( = ?auto_100003 ?auto_100007 ) ) ( not ( = ?auto_100003 ?auto_100008 ) ) ( not ( = ?auto_100003 ?auto_100009 ) ) ( not ( = ?auto_100003 ?auto_100010 ) ) ( not ( = ?auto_100003 ?auto_100011 ) ) ( not ( = ?auto_100003 ?auto_100012 ) ) ( not ( = ?auto_100003 ?auto_100013 ) ) ( not ( = ?auto_100004 ?auto_100005 ) ) ( not ( = ?auto_100004 ?auto_100006 ) ) ( not ( = ?auto_100004 ?auto_100007 ) ) ( not ( = ?auto_100004 ?auto_100008 ) ) ( not ( = ?auto_100004 ?auto_100009 ) ) ( not ( = ?auto_100004 ?auto_100010 ) ) ( not ( = ?auto_100004 ?auto_100011 ) ) ( not ( = ?auto_100004 ?auto_100012 ) ) ( not ( = ?auto_100004 ?auto_100013 ) ) ( not ( = ?auto_100005 ?auto_100006 ) ) ( not ( = ?auto_100005 ?auto_100007 ) ) ( not ( = ?auto_100005 ?auto_100008 ) ) ( not ( = ?auto_100005 ?auto_100009 ) ) ( not ( = ?auto_100005 ?auto_100010 ) ) ( not ( = ?auto_100005 ?auto_100011 ) ) ( not ( = ?auto_100005 ?auto_100012 ) ) ( not ( = ?auto_100005 ?auto_100013 ) ) ( not ( = ?auto_100006 ?auto_100007 ) ) ( not ( = ?auto_100006 ?auto_100008 ) ) ( not ( = ?auto_100006 ?auto_100009 ) ) ( not ( = ?auto_100006 ?auto_100010 ) ) ( not ( = ?auto_100006 ?auto_100011 ) ) ( not ( = ?auto_100006 ?auto_100012 ) ) ( not ( = ?auto_100006 ?auto_100013 ) ) ( not ( = ?auto_100007 ?auto_100008 ) ) ( not ( = ?auto_100007 ?auto_100009 ) ) ( not ( = ?auto_100007 ?auto_100010 ) ) ( not ( = ?auto_100007 ?auto_100011 ) ) ( not ( = ?auto_100007 ?auto_100012 ) ) ( not ( = ?auto_100007 ?auto_100013 ) ) ( not ( = ?auto_100008 ?auto_100009 ) ) ( not ( = ?auto_100008 ?auto_100010 ) ) ( not ( = ?auto_100008 ?auto_100011 ) ) ( not ( = ?auto_100008 ?auto_100012 ) ) ( not ( = ?auto_100008 ?auto_100013 ) ) ( not ( = ?auto_100009 ?auto_100010 ) ) ( not ( = ?auto_100009 ?auto_100011 ) ) ( not ( = ?auto_100009 ?auto_100012 ) ) ( not ( = ?auto_100009 ?auto_100013 ) ) ( not ( = ?auto_100010 ?auto_100011 ) ) ( not ( = ?auto_100010 ?auto_100012 ) ) ( not ( = ?auto_100010 ?auto_100013 ) ) ( not ( = ?auto_100011 ?auto_100012 ) ) ( not ( = ?auto_100011 ?auto_100013 ) ) ( not ( = ?auto_100012 ?auto_100013 ) ) ( ON ?auto_100011 ?auto_100012 ) ( ON ?auto_100010 ?auto_100011 ) ( ON ?auto_100009 ?auto_100010 ) ( ON ?auto_100008 ?auto_100009 ) ( ON ?auto_100007 ?auto_100008 ) ( ON ?auto_100006 ?auto_100007 ) ( ON ?auto_100005 ?auto_100006 ) ( CLEAR ?auto_100003 ) ( ON ?auto_100004 ?auto_100005 ) ( CLEAR ?auto_100004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100003 ?auto_100004 )
      ( MAKE-10PILE ?auto_100003 ?auto_100004 ?auto_100005 ?auto_100006 ?auto_100007 ?auto_100008 ?auto_100009 ?auto_100010 ?auto_100011 ?auto_100012 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_100024 - BLOCK
      ?auto_100025 - BLOCK
      ?auto_100026 - BLOCK
      ?auto_100027 - BLOCK
      ?auto_100028 - BLOCK
      ?auto_100029 - BLOCK
      ?auto_100030 - BLOCK
      ?auto_100031 - BLOCK
      ?auto_100032 - BLOCK
      ?auto_100033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100033 ) ( ON-TABLE ?auto_100024 ) ( not ( = ?auto_100024 ?auto_100025 ) ) ( not ( = ?auto_100024 ?auto_100026 ) ) ( not ( = ?auto_100024 ?auto_100027 ) ) ( not ( = ?auto_100024 ?auto_100028 ) ) ( not ( = ?auto_100024 ?auto_100029 ) ) ( not ( = ?auto_100024 ?auto_100030 ) ) ( not ( = ?auto_100024 ?auto_100031 ) ) ( not ( = ?auto_100024 ?auto_100032 ) ) ( not ( = ?auto_100024 ?auto_100033 ) ) ( not ( = ?auto_100025 ?auto_100026 ) ) ( not ( = ?auto_100025 ?auto_100027 ) ) ( not ( = ?auto_100025 ?auto_100028 ) ) ( not ( = ?auto_100025 ?auto_100029 ) ) ( not ( = ?auto_100025 ?auto_100030 ) ) ( not ( = ?auto_100025 ?auto_100031 ) ) ( not ( = ?auto_100025 ?auto_100032 ) ) ( not ( = ?auto_100025 ?auto_100033 ) ) ( not ( = ?auto_100026 ?auto_100027 ) ) ( not ( = ?auto_100026 ?auto_100028 ) ) ( not ( = ?auto_100026 ?auto_100029 ) ) ( not ( = ?auto_100026 ?auto_100030 ) ) ( not ( = ?auto_100026 ?auto_100031 ) ) ( not ( = ?auto_100026 ?auto_100032 ) ) ( not ( = ?auto_100026 ?auto_100033 ) ) ( not ( = ?auto_100027 ?auto_100028 ) ) ( not ( = ?auto_100027 ?auto_100029 ) ) ( not ( = ?auto_100027 ?auto_100030 ) ) ( not ( = ?auto_100027 ?auto_100031 ) ) ( not ( = ?auto_100027 ?auto_100032 ) ) ( not ( = ?auto_100027 ?auto_100033 ) ) ( not ( = ?auto_100028 ?auto_100029 ) ) ( not ( = ?auto_100028 ?auto_100030 ) ) ( not ( = ?auto_100028 ?auto_100031 ) ) ( not ( = ?auto_100028 ?auto_100032 ) ) ( not ( = ?auto_100028 ?auto_100033 ) ) ( not ( = ?auto_100029 ?auto_100030 ) ) ( not ( = ?auto_100029 ?auto_100031 ) ) ( not ( = ?auto_100029 ?auto_100032 ) ) ( not ( = ?auto_100029 ?auto_100033 ) ) ( not ( = ?auto_100030 ?auto_100031 ) ) ( not ( = ?auto_100030 ?auto_100032 ) ) ( not ( = ?auto_100030 ?auto_100033 ) ) ( not ( = ?auto_100031 ?auto_100032 ) ) ( not ( = ?auto_100031 ?auto_100033 ) ) ( not ( = ?auto_100032 ?auto_100033 ) ) ( ON ?auto_100032 ?auto_100033 ) ( ON ?auto_100031 ?auto_100032 ) ( ON ?auto_100030 ?auto_100031 ) ( ON ?auto_100029 ?auto_100030 ) ( ON ?auto_100028 ?auto_100029 ) ( ON ?auto_100027 ?auto_100028 ) ( ON ?auto_100026 ?auto_100027 ) ( CLEAR ?auto_100024 ) ( ON ?auto_100025 ?auto_100026 ) ( CLEAR ?auto_100025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_100024 ?auto_100025 )
      ( MAKE-10PILE ?auto_100024 ?auto_100025 ?auto_100026 ?auto_100027 ?auto_100028 ?auto_100029 ?auto_100030 ?auto_100031 ?auto_100032 ?auto_100033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_100044 - BLOCK
      ?auto_100045 - BLOCK
      ?auto_100046 - BLOCK
      ?auto_100047 - BLOCK
      ?auto_100048 - BLOCK
      ?auto_100049 - BLOCK
      ?auto_100050 - BLOCK
      ?auto_100051 - BLOCK
      ?auto_100052 - BLOCK
      ?auto_100053 - BLOCK
    )
    :vars
    (
      ?auto_100054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_100053 ?auto_100054 ) ( not ( = ?auto_100044 ?auto_100045 ) ) ( not ( = ?auto_100044 ?auto_100046 ) ) ( not ( = ?auto_100044 ?auto_100047 ) ) ( not ( = ?auto_100044 ?auto_100048 ) ) ( not ( = ?auto_100044 ?auto_100049 ) ) ( not ( = ?auto_100044 ?auto_100050 ) ) ( not ( = ?auto_100044 ?auto_100051 ) ) ( not ( = ?auto_100044 ?auto_100052 ) ) ( not ( = ?auto_100044 ?auto_100053 ) ) ( not ( = ?auto_100044 ?auto_100054 ) ) ( not ( = ?auto_100045 ?auto_100046 ) ) ( not ( = ?auto_100045 ?auto_100047 ) ) ( not ( = ?auto_100045 ?auto_100048 ) ) ( not ( = ?auto_100045 ?auto_100049 ) ) ( not ( = ?auto_100045 ?auto_100050 ) ) ( not ( = ?auto_100045 ?auto_100051 ) ) ( not ( = ?auto_100045 ?auto_100052 ) ) ( not ( = ?auto_100045 ?auto_100053 ) ) ( not ( = ?auto_100045 ?auto_100054 ) ) ( not ( = ?auto_100046 ?auto_100047 ) ) ( not ( = ?auto_100046 ?auto_100048 ) ) ( not ( = ?auto_100046 ?auto_100049 ) ) ( not ( = ?auto_100046 ?auto_100050 ) ) ( not ( = ?auto_100046 ?auto_100051 ) ) ( not ( = ?auto_100046 ?auto_100052 ) ) ( not ( = ?auto_100046 ?auto_100053 ) ) ( not ( = ?auto_100046 ?auto_100054 ) ) ( not ( = ?auto_100047 ?auto_100048 ) ) ( not ( = ?auto_100047 ?auto_100049 ) ) ( not ( = ?auto_100047 ?auto_100050 ) ) ( not ( = ?auto_100047 ?auto_100051 ) ) ( not ( = ?auto_100047 ?auto_100052 ) ) ( not ( = ?auto_100047 ?auto_100053 ) ) ( not ( = ?auto_100047 ?auto_100054 ) ) ( not ( = ?auto_100048 ?auto_100049 ) ) ( not ( = ?auto_100048 ?auto_100050 ) ) ( not ( = ?auto_100048 ?auto_100051 ) ) ( not ( = ?auto_100048 ?auto_100052 ) ) ( not ( = ?auto_100048 ?auto_100053 ) ) ( not ( = ?auto_100048 ?auto_100054 ) ) ( not ( = ?auto_100049 ?auto_100050 ) ) ( not ( = ?auto_100049 ?auto_100051 ) ) ( not ( = ?auto_100049 ?auto_100052 ) ) ( not ( = ?auto_100049 ?auto_100053 ) ) ( not ( = ?auto_100049 ?auto_100054 ) ) ( not ( = ?auto_100050 ?auto_100051 ) ) ( not ( = ?auto_100050 ?auto_100052 ) ) ( not ( = ?auto_100050 ?auto_100053 ) ) ( not ( = ?auto_100050 ?auto_100054 ) ) ( not ( = ?auto_100051 ?auto_100052 ) ) ( not ( = ?auto_100051 ?auto_100053 ) ) ( not ( = ?auto_100051 ?auto_100054 ) ) ( not ( = ?auto_100052 ?auto_100053 ) ) ( not ( = ?auto_100052 ?auto_100054 ) ) ( not ( = ?auto_100053 ?auto_100054 ) ) ( ON ?auto_100052 ?auto_100053 ) ( ON ?auto_100051 ?auto_100052 ) ( ON ?auto_100050 ?auto_100051 ) ( ON ?auto_100049 ?auto_100050 ) ( ON ?auto_100048 ?auto_100049 ) ( ON ?auto_100047 ?auto_100048 ) ( ON ?auto_100046 ?auto_100047 ) ( ON ?auto_100045 ?auto_100046 ) ( ON ?auto_100044 ?auto_100045 ) ( CLEAR ?auto_100044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100044 )
      ( MAKE-10PILE ?auto_100044 ?auto_100045 ?auto_100046 ?auto_100047 ?auto_100048 ?auto_100049 ?auto_100050 ?auto_100051 ?auto_100052 ?auto_100053 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_100065 - BLOCK
      ?auto_100066 - BLOCK
      ?auto_100067 - BLOCK
      ?auto_100068 - BLOCK
      ?auto_100069 - BLOCK
      ?auto_100070 - BLOCK
      ?auto_100071 - BLOCK
      ?auto_100072 - BLOCK
      ?auto_100073 - BLOCK
      ?auto_100074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_100074 ) ( not ( = ?auto_100065 ?auto_100066 ) ) ( not ( = ?auto_100065 ?auto_100067 ) ) ( not ( = ?auto_100065 ?auto_100068 ) ) ( not ( = ?auto_100065 ?auto_100069 ) ) ( not ( = ?auto_100065 ?auto_100070 ) ) ( not ( = ?auto_100065 ?auto_100071 ) ) ( not ( = ?auto_100065 ?auto_100072 ) ) ( not ( = ?auto_100065 ?auto_100073 ) ) ( not ( = ?auto_100065 ?auto_100074 ) ) ( not ( = ?auto_100066 ?auto_100067 ) ) ( not ( = ?auto_100066 ?auto_100068 ) ) ( not ( = ?auto_100066 ?auto_100069 ) ) ( not ( = ?auto_100066 ?auto_100070 ) ) ( not ( = ?auto_100066 ?auto_100071 ) ) ( not ( = ?auto_100066 ?auto_100072 ) ) ( not ( = ?auto_100066 ?auto_100073 ) ) ( not ( = ?auto_100066 ?auto_100074 ) ) ( not ( = ?auto_100067 ?auto_100068 ) ) ( not ( = ?auto_100067 ?auto_100069 ) ) ( not ( = ?auto_100067 ?auto_100070 ) ) ( not ( = ?auto_100067 ?auto_100071 ) ) ( not ( = ?auto_100067 ?auto_100072 ) ) ( not ( = ?auto_100067 ?auto_100073 ) ) ( not ( = ?auto_100067 ?auto_100074 ) ) ( not ( = ?auto_100068 ?auto_100069 ) ) ( not ( = ?auto_100068 ?auto_100070 ) ) ( not ( = ?auto_100068 ?auto_100071 ) ) ( not ( = ?auto_100068 ?auto_100072 ) ) ( not ( = ?auto_100068 ?auto_100073 ) ) ( not ( = ?auto_100068 ?auto_100074 ) ) ( not ( = ?auto_100069 ?auto_100070 ) ) ( not ( = ?auto_100069 ?auto_100071 ) ) ( not ( = ?auto_100069 ?auto_100072 ) ) ( not ( = ?auto_100069 ?auto_100073 ) ) ( not ( = ?auto_100069 ?auto_100074 ) ) ( not ( = ?auto_100070 ?auto_100071 ) ) ( not ( = ?auto_100070 ?auto_100072 ) ) ( not ( = ?auto_100070 ?auto_100073 ) ) ( not ( = ?auto_100070 ?auto_100074 ) ) ( not ( = ?auto_100071 ?auto_100072 ) ) ( not ( = ?auto_100071 ?auto_100073 ) ) ( not ( = ?auto_100071 ?auto_100074 ) ) ( not ( = ?auto_100072 ?auto_100073 ) ) ( not ( = ?auto_100072 ?auto_100074 ) ) ( not ( = ?auto_100073 ?auto_100074 ) ) ( ON ?auto_100073 ?auto_100074 ) ( ON ?auto_100072 ?auto_100073 ) ( ON ?auto_100071 ?auto_100072 ) ( ON ?auto_100070 ?auto_100071 ) ( ON ?auto_100069 ?auto_100070 ) ( ON ?auto_100068 ?auto_100069 ) ( ON ?auto_100067 ?auto_100068 ) ( ON ?auto_100066 ?auto_100067 ) ( ON ?auto_100065 ?auto_100066 ) ( CLEAR ?auto_100065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_100065 )
      ( MAKE-10PILE ?auto_100065 ?auto_100066 ?auto_100067 ?auto_100068 ?auto_100069 ?auto_100070 ?auto_100071 ?auto_100072 ?auto_100073 ?auto_100074 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_100085 - BLOCK
      ?auto_100086 - BLOCK
      ?auto_100087 - BLOCK
      ?auto_100088 - BLOCK
      ?auto_100089 - BLOCK
      ?auto_100090 - BLOCK
      ?auto_100091 - BLOCK
      ?auto_100092 - BLOCK
      ?auto_100093 - BLOCK
      ?auto_100094 - BLOCK
    )
    :vars
    (
      ?auto_100095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_100085 ?auto_100086 ) ) ( not ( = ?auto_100085 ?auto_100087 ) ) ( not ( = ?auto_100085 ?auto_100088 ) ) ( not ( = ?auto_100085 ?auto_100089 ) ) ( not ( = ?auto_100085 ?auto_100090 ) ) ( not ( = ?auto_100085 ?auto_100091 ) ) ( not ( = ?auto_100085 ?auto_100092 ) ) ( not ( = ?auto_100085 ?auto_100093 ) ) ( not ( = ?auto_100085 ?auto_100094 ) ) ( not ( = ?auto_100086 ?auto_100087 ) ) ( not ( = ?auto_100086 ?auto_100088 ) ) ( not ( = ?auto_100086 ?auto_100089 ) ) ( not ( = ?auto_100086 ?auto_100090 ) ) ( not ( = ?auto_100086 ?auto_100091 ) ) ( not ( = ?auto_100086 ?auto_100092 ) ) ( not ( = ?auto_100086 ?auto_100093 ) ) ( not ( = ?auto_100086 ?auto_100094 ) ) ( not ( = ?auto_100087 ?auto_100088 ) ) ( not ( = ?auto_100087 ?auto_100089 ) ) ( not ( = ?auto_100087 ?auto_100090 ) ) ( not ( = ?auto_100087 ?auto_100091 ) ) ( not ( = ?auto_100087 ?auto_100092 ) ) ( not ( = ?auto_100087 ?auto_100093 ) ) ( not ( = ?auto_100087 ?auto_100094 ) ) ( not ( = ?auto_100088 ?auto_100089 ) ) ( not ( = ?auto_100088 ?auto_100090 ) ) ( not ( = ?auto_100088 ?auto_100091 ) ) ( not ( = ?auto_100088 ?auto_100092 ) ) ( not ( = ?auto_100088 ?auto_100093 ) ) ( not ( = ?auto_100088 ?auto_100094 ) ) ( not ( = ?auto_100089 ?auto_100090 ) ) ( not ( = ?auto_100089 ?auto_100091 ) ) ( not ( = ?auto_100089 ?auto_100092 ) ) ( not ( = ?auto_100089 ?auto_100093 ) ) ( not ( = ?auto_100089 ?auto_100094 ) ) ( not ( = ?auto_100090 ?auto_100091 ) ) ( not ( = ?auto_100090 ?auto_100092 ) ) ( not ( = ?auto_100090 ?auto_100093 ) ) ( not ( = ?auto_100090 ?auto_100094 ) ) ( not ( = ?auto_100091 ?auto_100092 ) ) ( not ( = ?auto_100091 ?auto_100093 ) ) ( not ( = ?auto_100091 ?auto_100094 ) ) ( not ( = ?auto_100092 ?auto_100093 ) ) ( not ( = ?auto_100092 ?auto_100094 ) ) ( not ( = ?auto_100093 ?auto_100094 ) ) ( ON ?auto_100085 ?auto_100095 ) ( not ( = ?auto_100094 ?auto_100095 ) ) ( not ( = ?auto_100093 ?auto_100095 ) ) ( not ( = ?auto_100092 ?auto_100095 ) ) ( not ( = ?auto_100091 ?auto_100095 ) ) ( not ( = ?auto_100090 ?auto_100095 ) ) ( not ( = ?auto_100089 ?auto_100095 ) ) ( not ( = ?auto_100088 ?auto_100095 ) ) ( not ( = ?auto_100087 ?auto_100095 ) ) ( not ( = ?auto_100086 ?auto_100095 ) ) ( not ( = ?auto_100085 ?auto_100095 ) ) ( ON ?auto_100086 ?auto_100085 ) ( ON ?auto_100087 ?auto_100086 ) ( ON ?auto_100088 ?auto_100087 ) ( ON ?auto_100089 ?auto_100088 ) ( ON ?auto_100090 ?auto_100089 ) ( ON ?auto_100091 ?auto_100090 ) ( ON ?auto_100092 ?auto_100091 ) ( ON ?auto_100093 ?auto_100092 ) ( ON ?auto_100094 ?auto_100093 ) ( CLEAR ?auto_100094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_100094 ?auto_100093 ?auto_100092 ?auto_100091 ?auto_100090 ?auto_100089 ?auto_100088 ?auto_100087 ?auto_100086 ?auto_100085 )
      ( MAKE-10PILE ?auto_100085 ?auto_100086 ?auto_100087 ?auto_100088 ?auto_100089 ?auto_100090 ?auto_100091 ?auto_100092 ?auto_100093 ?auto_100094 ) )
  )

)

