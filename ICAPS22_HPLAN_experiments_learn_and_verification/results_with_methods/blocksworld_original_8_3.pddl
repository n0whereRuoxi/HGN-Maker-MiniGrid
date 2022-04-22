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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_145503 - BLOCK
      ?auto_145504 - BLOCK
      ?auto_145505 - BLOCK
      ?auto_145506 - BLOCK
      ?auto_145507 - BLOCK
      ?auto_145508 - BLOCK
      ?auto_145509 - BLOCK
      ?auto_145510 - BLOCK
    )
    :vars
    (
      ?auto_145511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145511 ?auto_145510 ) ( CLEAR ?auto_145511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145503 ) ( ON ?auto_145504 ?auto_145503 ) ( ON ?auto_145505 ?auto_145504 ) ( ON ?auto_145506 ?auto_145505 ) ( ON ?auto_145507 ?auto_145506 ) ( ON ?auto_145508 ?auto_145507 ) ( ON ?auto_145509 ?auto_145508 ) ( ON ?auto_145510 ?auto_145509 ) ( not ( = ?auto_145503 ?auto_145504 ) ) ( not ( = ?auto_145503 ?auto_145505 ) ) ( not ( = ?auto_145503 ?auto_145506 ) ) ( not ( = ?auto_145503 ?auto_145507 ) ) ( not ( = ?auto_145503 ?auto_145508 ) ) ( not ( = ?auto_145503 ?auto_145509 ) ) ( not ( = ?auto_145503 ?auto_145510 ) ) ( not ( = ?auto_145503 ?auto_145511 ) ) ( not ( = ?auto_145504 ?auto_145505 ) ) ( not ( = ?auto_145504 ?auto_145506 ) ) ( not ( = ?auto_145504 ?auto_145507 ) ) ( not ( = ?auto_145504 ?auto_145508 ) ) ( not ( = ?auto_145504 ?auto_145509 ) ) ( not ( = ?auto_145504 ?auto_145510 ) ) ( not ( = ?auto_145504 ?auto_145511 ) ) ( not ( = ?auto_145505 ?auto_145506 ) ) ( not ( = ?auto_145505 ?auto_145507 ) ) ( not ( = ?auto_145505 ?auto_145508 ) ) ( not ( = ?auto_145505 ?auto_145509 ) ) ( not ( = ?auto_145505 ?auto_145510 ) ) ( not ( = ?auto_145505 ?auto_145511 ) ) ( not ( = ?auto_145506 ?auto_145507 ) ) ( not ( = ?auto_145506 ?auto_145508 ) ) ( not ( = ?auto_145506 ?auto_145509 ) ) ( not ( = ?auto_145506 ?auto_145510 ) ) ( not ( = ?auto_145506 ?auto_145511 ) ) ( not ( = ?auto_145507 ?auto_145508 ) ) ( not ( = ?auto_145507 ?auto_145509 ) ) ( not ( = ?auto_145507 ?auto_145510 ) ) ( not ( = ?auto_145507 ?auto_145511 ) ) ( not ( = ?auto_145508 ?auto_145509 ) ) ( not ( = ?auto_145508 ?auto_145510 ) ) ( not ( = ?auto_145508 ?auto_145511 ) ) ( not ( = ?auto_145509 ?auto_145510 ) ) ( not ( = ?auto_145509 ?auto_145511 ) ) ( not ( = ?auto_145510 ?auto_145511 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145511 ?auto_145510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_145513 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_145513 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_145513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_145514 - BLOCK
    )
    :vars
    (
      ?auto_145515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145514 ?auto_145515 ) ( CLEAR ?auto_145514 ) ( HAND-EMPTY ) ( not ( = ?auto_145514 ?auto_145515 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145514 ?auto_145515 )
      ( MAKE-1PILE ?auto_145514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145523 - BLOCK
      ?auto_145524 - BLOCK
      ?auto_145525 - BLOCK
      ?auto_145526 - BLOCK
      ?auto_145527 - BLOCK
      ?auto_145528 - BLOCK
      ?auto_145529 - BLOCK
    )
    :vars
    (
      ?auto_145530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145530 ?auto_145529 ) ( CLEAR ?auto_145530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145523 ) ( ON ?auto_145524 ?auto_145523 ) ( ON ?auto_145525 ?auto_145524 ) ( ON ?auto_145526 ?auto_145525 ) ( ON ?auto_145527 ?auto_145526 ) ( ON ?auto_145528 ?auto_145527 ) ( ON ?auto_145529 ?auto_145528 ) ( not ( = ?auto_145523 ?auto_145524 ) ) ( not ( = ?auto_145523 ?auto_145525 ) ) ( not ( = ?auto_145523 ?auto_145526 ) ) ( not ( = ?auto_145523 ?auto_145527 ) ) ( not ( = ?auto_145523 ?auto_145528 ) ) ( not ( = ?auto_145523 ?auto_145529 ) ) ( not ( = ?auto_145523 ?auto_145530 ) ) ( not ( = ?auto_145524 ?auto_145525 ) ) ( not ( = ?auto_145524 ?auto_145526 ) ) ( not ( = ?auto_145524 ?auto_145527 ) ) ( not ( = ?auto_145524 ?auto_145528 ) ) ( not ( = ?auto_145524 ?auto_145529 ) ) ( not ( = ?auto_145524 ?auto_145530 ) ) ( not ( = ?auto_145525 ?auto_145526 ) ) ( not ( = ?auto_145525 ?auto_145527 ) ) ( not ( = ?auto_145525 ?auto_145528 ) ) ( not ( = ?auto_145525 ?auto_145529 ) ) ( not ( = ?auto_145525 ?auto_145530 ) ) ( not ( = ?auto_145526 ?auto_145527 ) ) ( not ( = ?auto_145526 ?auto_145528 ) ) ( not ( = ?auto_145526 ?auto_145529 ) ) ( not ( = ?auto_145526 ?auto_145530 ) ) ( not ( = ?auto_145527 ?auto_145528 ) ) ( not ( = ?auto_145527 ?auto_145529 ) ) ( not ( = ?auto_145527 ?auto_145530 ) ) ( not ( = ?auto_145528 ?auto_145529 ) ) ( not ( = ?auto_145528 ?auto_145530 ) ) ( not ( = ?auto_145529 ?auto_145530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145530 ?auto_145529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145531 - BLOCK
      ?auto_145532 - BLOCK
      ?auto_145533 - BLOCK
      ?auto_145534 - BLOCK
      ?auto_145535 - BLOCK
      ?auto_145536 - BLOCK
      ?auto_145537 - BLOCK
    )
    :vars
    (
      ?auto_145538 - BLOCK
      ?auto_145539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145538 ?auto_145537 ) ( CLEAR ?auto_145538 ) ( ON-TABLE ?auto_145531 ) ( ON ?auto_145532 ?auto_145531 ) ( ON ?auto_145533 ?auto_145532 ) ( ON ?auto_145534 ?auto_145533 ) ( ON ?auto_145535 ?auto_145534 ) ( ON ?auto_145536 ?auto_145535 ) ( ON ?auto_145537 ?auto_145536 ) ( not ( = ?auto_145531 ?auto_145532 ) ) ( not ( = ?auto_145531 ?auto_145533 ) ) ( not ( = ?auto_145531 ?auto_145534 ) ) ( not ( = ?auto_145531 ?auto_145535 ) ) ( not ( = ?auto_145531 ?auto_145536 ) ) ( not ( = ?auto_145531 ?auto_145537 ) ) ( not ( = ?auto_145531 ?auto_145538 ) ) ( not ( = ?auto_145532 ?auto_145533 ) ) ( not ( = ?auto_145532 ?auto_145534 ) ) ( not ( = ?auto_145532 ?auto_145535 ) ) ( not ( = ?auto_145532 ?auto_145536 ) ) ( not ( = ?auto_145532 ?auto_145537 ) ) ( not ( = ?auto_145532 ?auto_145538 ) ) ( not ( = ?auto_145533 ?auto_145534 ) ) ( not ( = ?auto_145533 ?auto_145535 ) ) ( not ( = ?auto_145533 ?auto_145536 ) ) ( not ( = ?auto_145533 ?auto_145537 ) ) ( not ( = ?auto_145533 ?auto_145538 ) ) ( not ( = ?auto_145534 ?auto_145535 ) ) ( not ( = ?auto_145534 ?auto_145536 ) ) ( not ( = ?auto_145534 ?auto_145537 ) ) ( not ( = ?auto_145534 ?auto_145538 ) ) ( not ( = ?auto_145535 ?auto_145536 ) ) ( not ( = ?auto_145535 ?auto_145537 ) ) ( not ( = ?auto_145535 ?auto_145538 ) ) ( not ( = ?auto_145536 ?auto_145537 ) ) ( not ( = ?auto_145536 ?auto_145538 ) ) ( not ( = ?auto_145537 ?auto_145538 ) ) ( HOLDING ?auto_145539 ) ( not ( = ?auto_145531 ?auto_145539 ) ) ( not ( = ?auto_145532 ?auto_145539 ) ) ( not ( = ?auto_145533 ?auto_145539 ) ) ( not ( = ?auto_145534 ?auto_145539 ) ) ( not ( = ?auto_145535 ?auto_145539 ) ) ( not ( = ?auto_145536 ?auto_145539 ) ) ( not ( = ?auto_145537 ?auto_145539 ) ) ( not ( = ?auto_145538 ?auto_145539 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_145539 )
      ( MAKE-7PILE ?auto_145531 ?auto_145532 ?auto_145533 ?auto_145534 ?auto_145535 ?auto_145536 ?auto_145537 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_145540 - BLOCK
      ?auto_145541 - BLOCK
      ?auto_145542 - BLOCK
      ?auto_145543 - BLOCK
      ?auto_145544 - BLOCK
      ?auto_145545 - BLOCK
      ?auto_145546 - BLOCK
    )
    :vars
    (
      ?auto_145547 - BLOCK
      ?auto_145548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145547 ?auto_145546 ) ( ON-TABLE ?auto_145540 ) ( ON ?auto_145541 ?auto_145540 ) ( ON ?auto_145542 ?auto_145541 ) ( ON ?auto_145543 ?auto_145542 ) ( ON ?auto_145544 ?auto_145543 ) ( ON ?auto_145545 ?auto_145544 ) ( ON ?auto_145546 ?auto_145545 ) ( not ( = ?auto_145540 ?auto_145541 ) ) ( not ( = ?auto_145540 ?auto_145542 ) ) ( not ( = ?auto_145540 ?auto_145543 ) ) ( not ( = ?auto_145540 ?auto_145544 ) ) ( not ( = ?auto_145540 ?auto_145545 ) ) ( not ( = ?auto_145540 ?auto_145546 ) ) ( not ( = ?auto_145540 ?auto_145547 ) ) ( not ( = ?auto_145541 ?auto_145542 ) ) ( not ( = ?auto_145541 ?auto_145543 ) ) ( not ( = ?auto_145541 ?auto_145544 ) ) ( not ( = ?auto_145541 ?auto_145545 ) ) ( not ( = ?auto_145541 ?auto_145546 ) ) ( not ( = ?auto_145541 ?auto_145547 ) ) ( not ( = ?auto_145542 ?auto_145543 ) ) ( not ( = ?auto_145542 ?auto_145544 ) ) ( not ( = ?auto_145542 ?auto_145545 ) ) ( not ( = ?auto_145542 ?auto_145546 ) ) ( not ( = ?auto_145542 ?auto_145547 ) ) ( not ( = ?auto_145543 ?auto_145544 ) ) ( not ( = ?auto_145543 ?auto_145545 ) ) ( not ( = ?auto_145543 ?auto_145546 ) ) ( not ( = ?auto_145543 ?auto_145547 ) ) ( not ( = ?auto_145544 ?auto_145545 ) ) ( not ( = ?auto_145544 ?auto_145546 ) ) ( not ( = ?auto_145544 ?auto_145547 ) ) ( not ( = ?auto_145545 ?auto_145546 ) ) ( not ( = ?auto_145545 ?auto_145547 ) ) ( not ( = ?auto_145546 ?auto_145547 ) ) ( not ( = ?auto_145540 ?auto_145548 ) ) ( not ( = ?auto_145541 ?auto_145548 ) ) ( not ( = ?auto_145542 ?auto_145548 ) ) ( not ( = ?auto_145543 ?auto_145548 ) ) ( not ( = ?auto_145544 ?auto_145548 ) ) ( not ( = ?auto_145545 ?auto_145548 ) ) ( not ( = ?auto_145546 ?auto_145548 ) ) ( not ( = ?auto_145547 ?auto_145548 ) ) ( ON ?auto_145548 ?auto_145547 ) ( CLEAR ?auto_145548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145540 ?auto_145541 ?auto_145542 ?auto_145543 ?auto_145544 ?auto_145545 ?auto_145546 ?auto_145547 )
      ( MAKE-7PILE ?auto_145540 ?auto_145541 ?auto_145542 ?auto_145543 ?auto_145544 ?auto_145545 ?auto_145546 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145551 - BLOCK
      ?auto_145552 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_145552 ) ( CLEAR ?auto_145551 ) ( ON-TABLE ?auto_145551 ) ( not ( = ?auto_145551 ?auto_145552 ) ) )
    :subtasks
    ( ( !STACK ?auto_145552 ?auto_145551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145553 - BLOCK
      ?auto_145554 - BLOCK
    )
    :vars
    (
      ?auto_145555 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145553 ) ( ON-TABLE ?auto_145553 ) ( not ( = ?auto_145553 ?auto_145554 ) ) ( ON ?auto_145554 ?auto_145555 ) ( CLEAR ?auto_145554 ) ( HAND-EMPTY ) ( not ( = ?auto_145553 ?auto_145555 ) ) ( not ( = ?auto_145554 ?auto_145555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145554 ?auto_145555 )
      ( MAKE-2PILE ?auto_145553 ?auto_145554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145556 - BLOCK
      ?auto_145557 - BLOCK
    )
    :vars
    (
      ?auto_145558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145556 ?auto_145557 ) ) ( ON ?auto_145557 ?auto_145558 ) ( CLEAR ?auto_145557 ) ( not ( = ?auto_145556 ?auto_145558 ) ) ( not ( = ?auto_145557 ?auto_145558 ) ) ( HOLDING ?auto_145556 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145556 )
      ( MAKE-2PILE ?auto_145556 ?auto_145557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_145559 - BLOCK
      ?auto_145560 - BLOCK
    )
    :vars
    (
      ?auto_145561 - BLOCK
      ?auto_145566 - BLOCK
      ?auto_145564 - BLOCK
      ?auto_145567 - BLOCK
      ?auto_145562 - BLOCK
      ?auto_145563 - BLOCK
      ?auto_145565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145559 ?auto_145560 ) ) ( ON ?auto_145560 ?auto_145561 ) ( not ( = ?auto_145559 ?auto_145561 ) ) ( not ( = ?auto_145560 ?auto_145561 ) ) ( ON ?auto_145559 ?auto_145560 ) ( CLEAR ?auto_145559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145566 ) ( ON ?auto_145564 ?auto_145566 ) ( ON ?auto_145567 ?auto_145564 ) ( ON ?auto_145562 ?auto_145567 ) ( ON ?auto_145563 ?auto_145562 ) ( ON ?auto_145565 ?auto_145563 ) ( ON ?auto_145561 ?auto_145565 ) ( not ( = ?auto_145566 ?auto_145564 ) ) ( not ( = ?auto_145566 ?auto_145567 ) ) ( not ( = ?auto_145566 ?auto_145562 ) ) ( not ( = ?auto_145566 ?auto_145563 ) ) ( not ( = ?auto_145566 ?auto_145565 ) ) ( not ( = ?auto_145566 ?auto_145561 ) ) ( not ( = ?auto_145566 ?auto_145560 ) ) ( not ( = ?auto_145566 ?auto_145559 ) ) ( not ( = ?auto_145564 ?auto_145567 ) ) ( not ( = ?auto_145564 ?auto_145562 ) ) ( not ( = ?auto_145564 ?auto_145563 ) ) ( not ( = ?auto_145564 ?auto_145565 ) ) ( not ( = ?auto_145564 ?auto_145561 ) ) ( not ( = ?auto_145564 ?auto_145560 ) ) ( not ( = ?auto_145564 ?auto_145559 ) ) ( not ( = ?auto_145567 ?auto_145562 ) ) ( not ( = ?auto_145567 ?auto_145563 ) ) ( not ( = ?auto_145567 ?auto_145565 ) ) ( not ( = ?auto_145567 ?auto_145561 ) ) ( not ( = ?auto_145567 ?auto_145560 ) ) ( not ( = ?auto_145567 ?auto_145559 ) ) ( not ( = ?auto_145562 ?auto_145563 ) ) ( not ( = ?auto_145562 ?auto_145565 ) ) ( not ( = ?auto_145562 ?auto_145561 ) ) ( not ( = ?auto_145562 ?auto_145560 ) ) ( not ( = ?auto_145562 ?auto_145559 ) ) ( not ( = ?auto_145563 ?auto_145565 ) ) ( not ( = ?auto_145563 ?auto_145561 ) ) ( not ( = ?auto_145563 ?auto_145560 ) ) ( not ( = ?auto_145563 ?auto_145559 ) ) ( not ( = ?auto_145565 ?auto_145561 ) ) ( not ( = ?auto_145565 ?auto_145560 ) ) ( not ( = ?auto_145565 ?auto_145559 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145566 ?auto_145564 ?auto_145567 ?auto_145562 ?auto_145563 ?auto_145565 ?auto_145561 ?auto_145560 )
      ( MAKE-2PILE ?auto_145559 ?auto_145560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_145574 - BLOCK
      ?auto_145575 - BLOCK
      ?auto_145576 - BLOCK
      ?auto_145577 - BLOCK
      ?auto_145578 - BLOCK
      ?auto_145579 - BLOCK
    )
    :vars
    (
      ?auto_145580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145580 ?auto_145579 ) ( CLEAR ?auto_145580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145574 ) ( ON ?auto_145575 ?auto_145574 ) ( ON ?auto_145576 ?auto_145575 ) ( ON ?auto_145577 ?auto_145576 ) ( ON ?auto_145578 ?auto_145577 ) ( ON ?auto_145579 ?auto_145578 ) ( not ( = ?auto_145574 ?auto_145575 ) ) ( not ( = ?auto_145574 ?auto_145576 ) ) ( not ( = ?auto_145574 ?auto_145577 ) ) ( not ( = ?auto_145574 ?auto_145578 ) ) ( not ( = ?auto_145574 ?auto_145579 ) ) ( not ( = ?auto_145574 ?auto_145580 ) ) ( not ( = ?auto_145575 ?auto_145576 ) ) ( not ( = ?auto_145575 ?auto_145577 ) ) ( not ( = ?auto_145575 ?auto_145578 ) ) ( not ( = ?auto_145575 ?auto_145579 ) ) ( not ( = ?auto_145575 ?auto_145580 ) ) ( not ( = ?auto_145576 ?auto_145577 ) ) ( not ( = ?auto_145576 ?auto_145578 ) ) ( not ( = ?auto_145576 ?auto_145579 ) ) ( not ( = ?auto_145576 ?auto_145580 ) ) ( not ( = ?auto_145577 ?auto_145578 ) ) ( not ( = ?auto_145577 ?auto_145579 ) ) ( not ( = ?auto_145577 ?auto_145580 ) ) ( not ( = ?auto_145578 ?auto_145579 ) ) ( not ( = ?auto_145578 ?auto_145580 ) ) ( not ( = ?auto_145579 ?auto_145580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145580 ?auto_145579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_145581 - BLOCK
      ?auto_145582 - BLOCK
      ?auto_145583 - BLOCK
      ?auto_145584 - BLOCK
      ?auto_145585 - BLOCK
      ?auto_145586 - BLOCK
    )
    :vars
    (
      ?auto_145587 - BLOCK
      ?auto_145588 - BLOCK
      ?auto_145589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145587 ?auto_145586 ) ( CLEAR ?auto_145587 ) ( ON-TABLE ?auto_145581 ) ( ON ?auto_145582 ?auto_145581 ) ( ON ?auto_145583 ?auto_145582 ) ( ON ?auto_145584 ?auto_145583 ) ( ON ?auto_145585 ?auto_145584 ) ( ON ?auto_145586 ?auto_145585 ) ( not ( = ?auto_145581 ?auto_145582 ) ) ( not ( = ?auto_145581 ?auto_145583 ) ) ( not ( = ?auto_145581 ?auto_145584 ) ) ( not ( = ?auto_145581 ?auto_145585 ) ) ( not ( = ?auto_145581 ?auto_145586 ) ) ( not ( = ?auto_145581 ?auto_145587 ) ) ( not ( = ?auto_145582 ?auto_145583 ) ) ( not ( = ?auto_145582 ?auto_145584 ) ) ( not ( = ?auto_145582 ?auto_145585 ) ) ( not ( = ?auto_145582 ?auto_145586 ) ) ( not ( = ?auto_145582 ?auto_145587 ) ) ( not ( = ?auto_145583 ?auto_145584 ) ) ( not ( = ?auto_145583 ?auto_145585 ) ) ( not ( = ?auto_145583 ?auto_145586 ) ) ( not ( = ?auto_145583 ?auto_145587 ) ) ( not ( = ?auto_145584 ?auto_145585 ) ) ( not ( = ?auto_145584 ?auto_145586 ) ) ( not ( = ?auto_145584 ?auto_145587 ) ) ( not ( = ?auto_145585 ?auto_145586 ) ) ( not ( = ?auto_145585 ?auto_145587 ) ) ( not ( = ?auto_145586 ?auto_145587 ) ) ( HOLDING ?auto_145588 ) ( CLEAR ?auto_145589 ) ( not ( = ?auto_145581 ?auto_145588 ) ) ( not ( = ?auto_145581 ?auto_145589 ) ) ( not ( = ?auto_145582 ?auto_145588 ) ) ( not ( = ?auto_145582 ?auto_145589 ) ) ( not ( = ?auto_145583 ?auto_145588 ) ) ( not ( = ?auto_145583 ?auto_145589 ) ) ( not ( = ?auto_145584 ?auto_145588 ) ) ( not ( = ?auto_145584 ?auto_145589 ) ) ( not ( = ?auto_145585 ?auto_145588 ) ) ( not ( = ?auto_145585 ?auto_145589 ) ) ( not ( = ?auto_145586 ?auto_145588 ) ) ( not ( = ?auto_145586 ?auto_145589 ) ) ( not ( = ?auto_145587 ?auto_145588 ) ) ( not ( = ?auto_145587 ?auto_145589 ) ) ( not ( = ?auto_145588 ?auto_145589 ) ) )
    :subtasks
    ( ( !STACK ?auto_145588 ?auto_145589 )
      ( MAKE-6PILE ?auto_145581 ?auto_145582 ?auto_145583 ?auto_145584 ?auto_145585 ?auto_145586 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_145590 - BLOCK
      ?auto_145591 - BLOCK
      ?auto_145592 - BLOCK
      ?auto_145593 - BLOCK
      ?auto_145594 - BLOCK
      ?auto_145595 - BLOCK
    )
    :vars
    (
      ?auto_145596 - BLOCK
      ?auto_145597 - BLOCK
      ?auto_145598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145596 ?auto_145595 ) ( ON-TABLE ?auto_145590 ) ( ON ?auto_145591 ?auto_145590 ) ( ON ?auto_145592 ?auto_145591 ) ( ON ?auto_145593 ?auto_145592 ) ( ON ?auto_145594 ?auto_145593 ) ( ON ?auto_145595 ?auto_145594 ) ( not ( = ?auto_145590 ?auto_145591 ) ) ( not ( = ?auto_145590 ?auto_145592 ) ) ( not ( = ?auto_145590 ?auto_145593 ) ) ( not ( = ?auto_145590 ?auto_145594 ) ) ( not ( = ?auto_145590 ?auto_145595 ) ) ( not ( = ?auto_145590 ?auto_145596 ) ) ( not ( = ?auto_145591 ?auto_145592 ) ) ( not ( = ?auto_145591 ?auto_145593 ) ) ( not ( = ?auto_145591 ?auto_145594 ) ) ( not ( = ?auto_145591 ?auto_145595 ) ) ( not ( = ?auto_145591 ?auto_145596 ) ) ( not ( = ?auto_145592 ?auto_145593 ) ) ( not ( = ?auto_145592 ?auto_145594 ) ) ( not ( = ?auto_145592 ?auto_145595 ) ) ( not ( = ?auto_145592 ?auto_145596 ) ) ( not ( = ?auto_145593 ?auto_145594 ) ) ( not ( = ?auto_145593 ?auto_145595 ) ) ( not ( = ?auto_145593 ?auto_145596 ) ) ( not ( = ?auto_145594 ?auto_145595 ) ) ( not ( = ?auto_145594 ?auto_145596 ) ) ( not ( = ?auto_145595 ?auto_145596 ) ) ( CLEAR ?auto_145597 ) ( not ( = ?auto_145590 ?auto_145598 ) ) ( not ( = ?auto_145590 ?auto_145597 ) ) ( not ( = ?auto_145591 ?auto_145598 ) ) ( not ( = ?auto_145591 ?auto_145597 ) ) ( not ( = ?auto_145592 ?auto_145598 ) ) ( not ( = ?auto_145592 ?auto_145597 ) ) ( not ( = ?auto_145593 ?auto_145598 ) ) ( not ( = ?auto_145593 ?auto_145597 ) ) ( not ( = ?auto_145594 ?auto_145598 ) ) ( not ( = ?auto_145594 ?auto_145597 ) ) ( not ( = ?auto_145595 ?auto_145598 ) ) ( not ( = ?auto_145595 ?auto_145597 ) ) ( not ( = ?auto_145596 ?auto_145598 ) ) ( not ( = ?auto_145596 ?auto_145597 ) ) ( not ( = ?auto_145598 ?auto_145597 ) ) ( ON ?auto_145598 ?auto_145596 ) ( CLEAR ?auto_145598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145590 ?auto_145591 ?auto_145592 ?auto_145593 ?auto_145594 ?auto_145595 ?auto_145596 )
      ( MAKE-6PILE ?auto_145590 ?auto_145591 ?auto_145592 ?auto_145593 ?auto_145594 ?auto_145595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_145599 - BLOCK
      ?auto_145600 - BLOCK
      ?auto_145601 - BLOCK
      ?auto_145602 - BLOCK
      ?auto_145603 - BLOCK
      ?auto_145604 - BLOCK
    )
    :vars
    (
      ?auto_145606 - BLOCK
      ?auto_145607 - BLOCK
      ?auto_145605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145606 ?auto_145604 ) ( ON-TABLE ?auto_145599 ) ( ON ?auto_145600 ?auto_145599 ) ( ON ?auto_145601 ?auto_145600 ) ( ON ?auto_145602 ?auto_145601 ) ( ON ?auto_145603 ?auto_145602 ) ( ON ?auto_145604 ?auto_145603 ) ( not ( = ?auto_145599 ?auto_145600 ) ) ( not ( = ?auto_145599 ?auto_145601 ) ) ( not ( = ?auto_145599 ?auto_145602 ) ) ( not ( = ?auto_145599 ?auto_145603 ) ) ( not ( = ?auto_145599 ?auto_145604 ) ) ( not ( = ?auto_145599 ?auto_145606 ) ) ( not ( = ?auto_145600 ?auto_145601 ) ) ( not ( = ?auto_145600 ?auto_145602 ) ) ( not ( = ?auto_145600 ?auto_145603 ) ) ( not ( = ?auto_145600 ?auto_145604 ) ) ( not ( = ?auto_145600 ?auto_145606 ) ) ( not ( = ?auto_145601 ?auto_145602 ) ) ( not ( = ?auto_145601 ?auto_145603 ) ) ( not ( = ?auto_145601 ?auto_145604 ) ) ( not ( = ?auto_145601 ?auto_145606 ) ) ( not ( = ?auto_145602 ?auto_145603 ) ) ( not ( = ?auto_145602 ?auto_145604 ) ) ( not ( = ?auto_145602 ?auto_145606 ) ) ( not ( = ?auto_145603 ?auto_145604 ) ) ( not ( = ?auto_145603 ?auto_145606 ) ) ( not ( = ?auto_145604 ?auto_145606 ) ) ( not ( = ?auto_145599 ?auto_145607 ) ) ( not ( = ?auto_145599 ?auto_145605 ) ) ( not ( = ?auto_145600 ?auto_145607 ) ) ( not ( = ?auto_145600 ?auto_145605 ) ) ( not ( = ?auto_145601 ?auto_145607 ) ) ( not ( = ?auto_145601 ?auto_145605 ) ) ( not ( = ?auto_145602 ?auto_145607 ) ) ( not ( = ?auto_145602 ?auto_145605 ) ) ( not ( = ?auto_145603 ?auto_145607 ) ) ( not ( = ?auto_145603 ?auto_145605 ) ) ( not ( = ?auto_145604 ?auto_145607 ) ) ( not ( = ?auto_145604 ?auto_145605 ) ) ( not ( = ?auto_145606 ?auto_145607 ) ) ( not ( = ?auto_145606 ?auto_145605 ) ) ( not ( = ?auto_145607 ?auto_145605 ) ) ( ON ?auto_145607 ?auto_145606 ) ( CLEAR ?auto_145607 ) ( HOLDING ?auto_145605 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145605 )
      ( MAKE-6PILE ?auto_145599 ?auto_145600 ?auto_145601 ?auto_145602 ?auto_145603 ?auto_145604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_145608 - BLOCK
      ?auto_145609 - BLOCK
      ?auto_145610 - BLOCK
      ?auto_145611 - BLOCK
      ?auto_145612 - BLOCK
      ?auto_145613 - BLOCK
    )
    :vars
    (
      ?auto_145614 - BLOCK
      ?auto_145615 - BLOCK
      ?auto_145616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145614 ?auto_145613 ) ( ON-TABLE ?auto_145608 ) ( ON ?auto_145609 ?auto_145608 ) ( ON ?auto_145610 ?auto_145609 ) ( ON ?auto_145611 ?auto_145610 ) ( ON ?auto_145612 ?auto_145611 ) ( ON ?auto_145613 ?auto_145612 ) ( not ( = ?auto_145608 ?auto_145609 ) ) ( not ( = ?auto_145608 ?auto_145610 ) ) ( not ( = ?auto_145608 ?auto_145611 ) ) ( not ( = ?auto_145608 ?auto_145612 ) ) ( not ( = ?auto_145608 ?auto_145613 ) ) ( not ( = ?auto_145608 ?auto_145614 ) ) ( not ( = ?auto_145609 ?auto_145610 ) ) ( not ( = ?auto_145609 ?auto_145611 ) ) ( not ( = ?auto_145609 ?auto_145612 ) ) ( not ( = ?auto_145609 ?auto_145613 ) ) ( not ( = ?auto_145609 ?auto_145614 ) ) ( not ( = ?auto_145610 ?auto_145611 ) ) ( not ( = ?auto_145610 ?auto_145612 ) ) ( not ( = ?auto_145610 ?auto_145613 ) ) ( not ( = ?auto_145610 ?auto_145614 ) ) ( not ( = ?auto_145611 ?auto_145612 ) ) ( not ( = ?auto_145611 ?auto_145613 ) ) ( not ( = ?auto_145611 ?auto_145614 ) ) ( not ( = ?auto_145612 ?auto_145613 ) ) ( not ( = ?auto_145612 ?auto_145614 ) ) ( not ( = ?auto_145613 ?auto_145614 ) ) ( not ( = ?auto_145608 ?auto_145615 ) ) ( not ( = ?auto_145608 ?auto_145616 ) ) ( not ( = ?auto_145609 ?auto_145615 ) ) ( not ( = ?auto_145609 ?auto_145616 ) ) ( not ( = ?auto_145610 ?auto_145615 ) ) ( not ( = ?auto_145610 ?auto_145616 ) ) ( not ( = ?auto_145611 ?auto_145615 ) ) ( not ( = ?auto_145611 ?auto_145616 ) ) ( not ( = ?auto_145612 ?auto_145615 ) ) ( not ( = ?auto_145612 ?auto_145616 ) ) ( not ( = ?auto_145613 ?auto_145615 ) ) ( not ( = ?auto_145613 ?auto_145616 ) ) ( not ( = ?auto_145614 ?auto_145615 ) ) ( not ( = ?auto_145614 ?auto_145616 ) ) ( not ( = ?auto_145615 ?auto_145616 ) ) ( ON ?auto_145615 ?auto_145614 ) ( ON ?auto_145616 ?auto_145615 ) ( CLEAR ?auto_145616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145608 ?auto_145609 ?auto_145610 ?auto_145611 ?auto_145612 ?auto_145613 ?auto_145614 ?auto_145615 )
      ( MAKE-6PILE ?auto_145608 ?auto_145609 ?auto_145610 ?auto_145611 ?auto_145612 ?auto_145613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145620 - BLOCK
      ?auto_145621 - BLOCK
      ?auto_145622 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_145622 ) ( CLEAR ?auto_145621 ) ( ON-TABLE ?auto_145620 ) ( ON ?auto_145621 ?auto_145620 ) ( not ( = ?auto_145620 ?auto_145621 ) ) ( not ( = ?auto_145620 ?auto_145622 ) ) ( not ( = ?auto_145621 ?auto_145622 ) ) )
    :subtasks
    ( ( !STACK ?auto_145622 ?auto_145621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145623 - BLOCK
      ?auto_145624 - BLOCK
      ?auto_145625 - BLOCK
    )
    :vars
    (
      ?auto_145626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145624 ) ( ON-TABLE ?auto_145623 ) ( ON ?auto_145624 ?auto_145623 ) ( not ( = ?auto_145623 ?auto_145624 ) ) ( not ( = ?auto_145623 ?auto_145625 ) ) ( not ( = ?auto_145624 ?auto_145625 ) ) ( ON ?auto_145625 ?auto_145626 ) ( CLEAR ?auto_145625 ) ( HAND-EMPTY ) ( not ( = ?auto_145623 ?auto_145626 ) ) ( not ( = ?auto_145624 ?auto_145626 ) ) ( not ( = ?auto_145625 ?auto_145626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145625 ?auto_145626 )
      ( MAKE-3PILE ?auto_145623 ?auto_145624 ?auto_145625 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145627 - BLOCK
      ?auto_145628 - BLOCK
      ?auto_145629 - BLOCK
    )
    :vars
    (
      ?auto_145630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145627 ) ( not ( = ?auto_145627 ?auto_145628 ) ) ( not ( = ?auto_145627 ?auto_145629 ) ) ( not ( = ?auto_145628 ?auto_145629 ) ) ( ON ?auto_145629 ?auto_145630 ) ( CLEAR ?auto_145629 ) ( not ( = ?auto_145627 ?auto_145630 ) ) ( not ( = ?auto_145628 ?auto_145630 ) ) ( not ( = ?auto_145629 ?auto_145630 ) ) ( HOLDING ?auto_145628 ) ( CLEAR ?auto_145627 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145627 ?auto_145628 )
      ( MAKE-3PILE ?auto_145627 ?auto_145628 ?auto_145629 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145631 - BLOCK
      ?auto_145632 - BLOCK
      ?auto_145633 - BLOCK
    )
    :vars
    (
      ?auto_145634 - BLOCK
      ?auto_145636 - BLOCK
      ?auto_145635 - BLOCK
      ?auto_145639 - BLOCK
      ?auto_145638 - BLOCK
      ?auto_145637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145631 ) ( not ( = ?auto_145631 ?auto_145632 ) ) ( not ( = ?auto_145631 ?auto_145633 ) ) ( not ( = ?auto_145632 ?auto_145633 ) ) ( ON ?auto_145633 ?auto_145634 ) ( not ( = ?auto_145631 ?auto_145634 ) ) ( not ( = ?auto_145632 ?auto_145634 ) ) ( not ( = ?auto_145633 ?auto_145634 ) ) ( CLEAR ?auto_145631 ) ( ON ?auto_145632 ?auto_145633 ) ( CLEAR ?auto_145632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145636 ) ( ON ?auto_145635 ?auto_145636 ) ( ON ?auto_145639 ?auto_145635 ) ( ON ?auto_145638 ?auto_145639 ) ( ON ?auto_145637 ?auto_145638 ) ( ON ?auto_145634 ?auto_145637 ) ( not ( = ?auto_145636 ?auto_145635 ) ) ( not ( = ?auto_145636 ?auto_145639 ) ) ( not ( = ?auto_145636 ?auto_145638 ) ) ( not ( = ?auto_145636 ?auto_145637 ) ) ( not ( = ?auto_145636 ?auto_145634 ) ) ( not ( = ?auto_145636 ?auto_145633 ) ) ( not ( = ?auto_145636 ?auto_145632 ) ) ( not ( = ?auto_145635 ?auto_145639 ) ) ( not ( = ?auto_145635 ?auto_145638 ) ) ( not ( = ?auto_145635 ?auto_145637 ) ) ( not ( = ?auto_145635 ?auto_145634 ) ) ( not ( = ?auto_145635 ?auto_145633 ) ) ( not ( = ?auto_145635 ?auto_145632 ) ) ( not ( = ?auto_145639 ?auto_145638 ) ) ( not ( = ?auto_145639 ?auto_145637 ) ) ( not ( = ?auto_145639 ?auto_145634 ) ) ( not ( = ?auto_145639 ?auto_145633 ) ) ( not ( = ?auto_145639 ?auto_145632 ) ) ( not ( = ?auto_145638 ?auto_145637 ) ) ( not ( = ?auto_145638 ?auto_145634 ) ) ( not ( = ?auto_145638 ?auto_145633 ) ) ( not ( = ?auto_145638 ?auto_145632 ) ) ( not ( = ?auto_145637 ?auto_145634 ) ) ( not ( = ?auto_145637 ?auto_145633 ) ) ( not ( = ?auto_145637 ?auto_145632 ) ) ( not ( = ?auto_145631 ?auto_145636 ) ) ( not ( = ?auto_145631 ?auto_145635 ) ) ( not ( = ?auto_145631 ?auto_145639 ) ) ( not ( = ?auto_145631 ?auto_145638 ) ) ( not ( = ?auto_145631 ?auto_145637 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145636 ?auto_145635 ?auto_145639 ?auto_145638 ?auto_145637 ?auto_145634 ?auto_145633 )
      ( MAKE-3PILE ?auto_145631 ?auto_145632 ?auto_145633 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145640 - BLOCK
      ?auto_145641 - BLOCK
      ?auto_145642 - BLOCK
    )
    :vars
    (
      ?auto_145648 - BLOCK
      ?auto_145647 - BLOCK
      ?auto_145645 - BLOCK
      ?auto_145646 - BLOCK
      ?auto_145644 - BLOCK
      ?auto_145643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145640 ?auto_145641 ) ) ( not ( = ?auto_145640 ?auto_145642 ) ) ( not ( = ?auto_145641 ?auto_145642 ) ) ( ON ?auto_145642 ?auto_145648 ) ( not ( = ?auto_145640 ?auto_145648 ) ) ( not ( = ?auto_145641 ?auto_145648 ) ) ( not ( = ?auto_145642 ?auto_145648 ) ) ( ON ?auto_145641 ?auto_145642 ) ( CLEAR ?auto_145641 ) ( ON-TABLE ?auto_145647 ) ( ON ?auto_145645 ?auto_145647 ) ( ON ?auto_145646 ?auto_145645 ) ( ON ?auto_145644 ?auto_145646 ) ( ON ?auto_145643 ?auto_145644 ) ( ON ?auto_145648 ?auto_145643 ) ( not ( = ?auto_145647 ?auto_145645 ) ) ( not ( = ?auto_145647 ?auto_145646 ) ) ( not ( = ?auto_145647 ?auto_145644 ) ) ( not ( = ?auto_145647 ?auto_145643 ) ) ( not ( = ?auto_145647 ?auto_145648 ) ) ( not ( = ?auto_145647 ?auto_145642 ) ) ( not ( = ?auto_145647 ?auto_145641 ) ) ( not ( = ?auto_145645 ?auto_145646 ) ) ( not ( = ?auto_145645 ?auto_145644 ) ) ( not ( = ?auto_145645 ?auto_145643 ) ) ( not ( = ?auto_145645 ?auto_145648 ) ) ( not ( = ?auto_145645 ?auto_145642 ) ) ( not ( = ?auto_145645 ?auto_145641 ) ) ( not ( = ?auto_145646 ?auto_145644 ) ) ( not ( = ?auto_145646 ?auto_145643 ) ) ( not ( = ?auto_145646 ?auto_145648 ) ) ( not ( = ?auto_145646 ?auto_145642 ) ) ( not ( = ?auto_145646 ?auto_145641 ) ) ( not ( = ?auto_145644 ?auto_145643 ) ) ( not ( = ?auto_145644 ?auto_145648 ) ) ( not ( = ?auto_145644 ?auto_145642 ) ) ( not ( = ?auto_145644 ?auto_145641 ) ) ( not ( = ?auto_145643 ?auto_145648 ) ) ( not ( = ?auto_145643 ?auto_145642 ) ) ( not ( = ?auto_145643 ?auto_145641 ) ) ( not ( = ?auto_145640 ?auto_145647 ) ) ( not ( = ?auto_145640 ?auto_145645 ) ) ( not ( = ?auto_145640 ?auto_145646 ) ) ( not ( = ?auto_145640 ?auto_145644 ) ) ( not ( = ?auto_145640 ?auto_145643 ) ) ( HOLDING ?auto_145640 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145640 )
      ( MAKE-3PILE ?auto_145640 ?auto_145641 ?auto_145642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145649 - BLOCK
      ?auto_145650 - BLOCK
      ?auto_145651 - BLOCK
    )
    :vars
    (
      ?auto_145655 - BLOCK
      ?auto_145654 - BLOCK
      ?auto_145652 - BLOCK
      ?auto_145653 - BLOCK
      ?auto_145657 - BLOCK
      ?auto_145656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145649 ?auto_145650 ) ) ( not ( = ?auto_145649 ?auto_145651 ) ) ( not ( = ?auto_145650 ?auto_145651 ) ) ( ON ?auto_145651 ?auto_145655 ) ( not ( = ?auto_145649 ?auto_145655 ) ) ( not ( = ?auto_145650 ?auto_145655 ) ) ( not ( = ?auto_145651 ?auto_145655 ) ) ( ON ?auto_145650 ?auto_145651 ) ( ON-TABLE ?auto_145654 ) ( ON ?auto_145652 ?auto_145654 ) ( ON ?auto_145653 ?auto_145652 ) ( ON ?auto_145657 ?auto_145653 ) ( ON ?auto_145656 ?auto_145657 ) ( ON ?auto_145655 ?auto_145656 ) ( not ( = ?auto_145654 ?auto_145652 ) ) ( not ( = ?auto_145654 ?auto_145653 ) ) ( not ( = ?auto_145654 ?auto_145657 ) ) ( not ( = ?auto_145654 ?auto_145656 ) ) ( not ( = ?auto_145654 ?auto_145655 ) ) ( not ( = ?auto_145654 ?auto_145651 ) ) ( not ( = ?auto_145654 ?auto_145650 ) ) ( not ( = ?auto_145652 ?auto_145653 ) ) ( not ( = ?auto_145652 ?auto_145657 ) ) ( not ( = ?auto_145652 ?auto_145656 ) ) ( not ( = ?auto_145652 ?auto_145655 ) ) ( not ( = ?auto_145652 ?auto_145651 ) ) ( not ( = ?auto_145652 ?auto_145650 ) ) ( not ( = ?auto_145653 ?auto_145657 ) ) ( not ( = ?auto_145653 ?auto_145656 ) ) ( not ( = ?auto_145653 ?auto_145655 ) ) ( not ( = ?auto_145653 ?auto_145651 ) ) ( not ( = ?auto_145653 ?auto_145650 ) ) ( not ( = ?auto_145657 ?auto_145656 ) ) ( not ( = ?auto_145657 ?auto_145655 ) ) ( not ( = ?auto_145657 ?auto_145651 ) ) ( not ( = ?auto_145657 ?auto_145650 ) ) ( not ( = ?auto_145656 ?auto_145655 ) ) ( not ( = ?auto_145656 ?auto_145651 ) ) ( not ( = ?auto_145656 ?auto_145650 ) ) ( not ( = ?auto_145649 ?auto_145654 ) ) ( not ( = ?auto_145649 ?auto_145652 ) ) ( not ( = ?auto_145649 ?auto_145653 ) ) ( not ( = ?auto_145649 ?auto_145657 ) ) ( not ( = ?auto_145649 ?auto_145656 ) ) ( ON ?auto_145649 ?auto_145650 ) ( CLEAR ?auto_145649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145654 ?auto_145652 ?auto_145653 ?auto_145657 ?auto_145656 ?auto_145655 ?auto_145651 ?auto_145650 )
      ( MAKE-3PILE ?auto_145649 ?auto_145650 ?auto_145651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145663 - BLOCK
      ?auto_145664 - BLOCK
      ?auto_145665 - BLOCK
      ?auto_145666 - BLOCK
      ?auto_145667 - BLOCK
    )
    :vars
    (
      ?auto_145668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145668 ?auto_145667 ) ( CLEAR ?auto_145668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145663 ) ( ON ?auto_145664 ?auto_145663 ) ( ON ?auto_145665 ?auto_145664 ) ( ON ?auto_145666 ?auto_145665 ) ( ON ?auto_145667 ?auto_145666 ) ( not ( = ?auto_145663 ?auto_145664 ) ) ( not ( = ?auto_145663 ?auto_145665 ) ) ( not ( = ?auto_145663 ?auto_145666 ) ) ( not ( = ?auto_145663 ?auto_145667 ) ) ( not ( = ?auto_145663 ?auto_145668 ) ) ( not ( = ?auto_145664 ?auto_145665 ) ) ( not ( = ?auto_145664 ?auto_145666 ) ) ( not ( = ?auto_145664 ?auto_145667 ) ) ( not ( = ?auto_145664 ?auto_145668 ) ) ( not ( = ?auto_145665 ?auto_145666 ) ) ( not ( = ?auto_145665 ?auto_145667 ) ) ( not ( = ?auto_145665 ?auto_145668 ) ) ( not ( = ?auto_145666 ?auto_145667 ) ) ( not ( = ?auto_145666 ?auto_145668 ) ) ( not ( = ?auto_145667 ?auto_145668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145668 ?auto_145667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145669 - BLOCK
      ?auto_145670 - BLOCK
      ?auto_145671 - BLOCK
      ?auto_145672 - BLOCK
      ?auto_145673 - BLOCK
    )
    :vars
    (
      ?auto_145674 - BLOCK
      ?auto_145675 - BLOCK
      ?auto_145676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145674 ?auto_145673 ) ( CLEAR ?auto_145674 ) ( ON-TABLE ?auto_145669 ) ( ON ?auto_145670 ?auto_145669 ) ( ON ?auto_145671 ?auto_145670 ) ( ON ?auto_145672 ?auto_145671 ) ( ON ?auto_145673 ?auto_145672 ) ( not ( = ?auto_145669 ?auto_145670 ) ) ( not ( = ?auto_145669 ?auto_145671 ) ) ( not ( = ?auto_145669 ?auto_145672 ) ) ( not ( = ?auto_145669 ?auto_145673 ) ) ( not ( = ?auto_145669 ?auto_145674 ) ) ( not ( = ?auto_145670 ?auto_145671 ) ) ( not ( = ?auto_145670 ?auto_145672 ) ) ( not ( = ?auto_145670 ?auto_145673 ) ) ( not ( = ?auto_145670 ?auto_145674 ) ) ( not ( = ?auto_145671 ?auto_145672 ) ) ( not ( = ?auto_145671 ?auto_145673 ) ) ( not ( = ?auto_145671 ?auto_145674 ) ) ( not ( = ?auto_145672 ?auto_145673 ) ) ( not ( = ?auto_145672 ?auto_145674 ) ) ( not ( = ?auto_145673 ?auto_145674 ) ) ( HOLDING ?auto_145675 ) ( CLEAR ?auto_145676 ) ( not ( = ?auto_145669 ?auto_145675 ) ) ( not ( = ?auto_145669 ?auto_145676 ) ) ( not ( = ?auto_145670 ?auto_145675 ) ) ( not ( = ?auto_145670 ?auto_145676 ) ) ( not ( = ?auto_145671 ?auto_145675 ) ) ( not ( = ?auto_145671 ?auto_145676 ) ) ( not ( = ?auto_145672 ?auto_145675 ) ) ( not ( = ?auto_145672 ?auto_145676 ) ) ( not ( = ?auto_145673 ?auto_145675 ) ) ( not ( = ?auto_145673 ?auto_145676 ) ) ( not ( = ?auto_145674 ?auto_145675 ) ) ( not ( = ?auto_145674 ?auto_145676 ) ) ( not ( = ?auto_145675 ?auto_145676 ) ) )
    :subtasks
    ( ( !STACK ?auto_145675 ?auto_145676 )
      ( MAKE-5PILE ?auto_145669 ?auto_145670 ?auto_145671 ?auto_145672 ?auto_145673 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145677 - BLOCK
      ?auto_145678 - BLOCK
      ?auto_145679 - BLOCK
      ?auto_145680 - BLOCK
      ?auto_145681 - BLOCK
    )
    :vars
    (
      ?auto_145682 - BLOCK
      ?auto_145684 - BLOCK
      ?auto_145683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145682 ?auto_145681 ) ( ON-TABLE ?auto_145677 ) ( ON ?auto_145678 ?auto_145677 ) ( ON ?auto_145679 ?auto_145678 ) ( ON ?auto_145680 ?auto_145679 ) ( ON ?auto_145681 ?auto_145680 ) ( not ( = ?auto_145677 ?auto_145678 ) ) ( not ( = ?auto_145677 ?auto_145679 ) ) ( not ( = ?auto_145677 ?auto_145680 ) ) ( not ( = ?auto_145677 ?auto_145681 ) ) ( not ( = ?auto_145677 ?auto_145682 ) ) ( not ( = ?auto_145678 ?auto_145679 ) ) ( not ( = ?auto_145678 ?auto_145680 ) ) ( not ( = ?auto_145678 ?auto_145681 ) ) ( not ( = ?auto_145678 ?auto_145682 ) ) ( not ( = ?auto_145679 ?auto_145680 ) ) ( not ( = ?auto_145679 ?auto_145681 ) ) ( not ( = ?auto_145679 ?auto_145682 ) ) ( not ( = ?auto_145680 ?auto_145681 ) ) ( not ( = ?auto_145680 ?auto_145682 ) ) ( not ( = ?auto_145681 ?auto_145682 ) ) ( CLEAR ?auto_145684 ) ( not ( = ?auto_145677 ?auto_145683 ) ) ( not ( = ?auto_145677 ?auto_145684 ) ) ( not ( = ?auto_145678 ?auto_145683 ) ) ( not ( = ?auto_145678 ?auto_145684 ) ) ( not ( = ?auto_145679 ?auto_145683 ) ) ( not ( = ?auto_145679 ?auto_145684 ) ) ( not ( = ?auto_145680 ?auto_145683 ) ) ( not ( = ?auto_145680 ?auto_145684 ) ) ( not ( = ?auto_145681 ?auto_145683 ) ) ( not ( = ?auto_145681 ?auto_145684 ) ) ( not ( = ?auto_145682 ?auto_145683 ) ) ( not ( = ?auto_145682 ?auto_145684 ) ) ( not ( = ?auto_145683 ?auto_145684 ) ) ( ON ?auto_145683 ?auto_145682 ) ( CLEAR ?auto_145683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145677 ?auto_145678 ?auto_145679 ?auto_145680 ?auto_145681 ?auto_145682 )
      ( MAKE-5PILE ?auto_145677 ?auto_145678 ?auto_145679 ?auto_145680 ?auto_145681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145685 - BLOCK
      ?auto_145686 - BLOCK
      ?auto_145687 - BLOCK
      ?auto_145688 - BLOCK
      ?auto_145689 - BLOCK
    )
    :vars
    (
      ?auto_145690 - BLOCK
      ?auto_145692 - BLOCK
      ?auto_145691 - BLOCK
      ?auto_145693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145690 ?auto_145689 ) ( ON-TABLE ?auto_145685 ) ( ON ?auto_145686 ?auto_145685 ) ( ON ?auto_145687 ?auto_145686 ) ( ON ?auto_145688 ?auto_145687 ) ( ON ?auto_145689 ?auto_145688 ) ( not ( = ?auto_145685 ?auto_145686 ) ) ( not ( = ?auto_145685 ?auto_145687 ) ) ( not ( = ?auto_145685 ?auto_145688 ) ) ( not ( = ?auto_145685 ?auto_145689 ) ) ( not ( = ?auto_145685 ?auto_145690 ) ) ( not ( = ?auto_145686 ?auto_145687 ) ) ( not ( = ?auto_145686 ?auto_145688 ) ) ( not ( = ?auto_145686 ?auto_145689 ) ) ( not ( = ?auto_145686 ?auto_145690 ) ) ( not ( = ?auto_145687 ?auto_145688 ) ) ( not ( = ?auto_145687 ?auto_145689 ) ) ( not ( = ?auto_145687 ?auto_145690 ) ) ( not ( = ?auto_145688 ?auto_145689 ) ) ( not ( = ?auto_145688 ?auto_145690 ) ) ( not ( = ?auto_145689 ?auto_145690 ) ) ( not ( = ?auto_145685 ?auto_145692 ) ) ( not ( = ?auto_145685 ?auto_145691 ) ) ( not ( = ?auto_145686 ?auto_145692 ) ) ( not ( = ?auto_145686 ?auto_145691 ) ) ( not ( = ?auto_145687 ?auto_145692 ) ) ( not ( = ?auto_145687 ?auto_145691 ) ) ( not ( = ?auto_145688 ?auto_145692 ) ) ( not ( = ?auto_145688 ?auto_145691 ) ) ( not ( = ?auto_145689 ?auto_145692 ) ) ( not ( = ?auto_145689 ?auto_145691 ) ) ( not ( = ?auto_145690 ?auto_145692 ) ) ( not ( = ?auto_145690 ?auto_145691 ) ) ( not ( = ?auto_145692 ?auto_145691 ) ) ( ON ?auto_145692 ?auto_145690 ) ( CLEAR ?auto_145692 ) ( HOLDING ?auto_145691 ) ( CLEAR ?auto_145693 ) ( ON-TABLE ?auto_145693 ) ( not ( = ?auto_145693 ?auto_145691 ) ) ( not ( = ?auto_145685 ?auto_145693 ) ) ( not ( = ?auto_145686 ?auto_145693 ) ) ( not ( = ?auto_145687 ?auto_145693 ) ) ( not ( = ?auto_145688 ?auto_145693 ) ) ( not ( = ?auto_145689 ?auto_145693 ) ) ( not ( = ?auto_145690 ?auto_145693 ) ) ( not ( = ?auto_145692 ?auto_145693 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145693 ?auto_145691 )
      ( MAKE-5PILE ?auto_145685 ?auto_145686 ?auto_145687 ?auto_145688 ?auto_145689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145694 - BLOCK
      ?auto_145695 - BLOCK
      ?auto_145696 - BLOCK
      ?auto_145697 - BLOCK
      ?auto_145698 - BLOCK
    )
    :vars
    (
      ?auto_145700 - BLOCK
      ?auto_145701 - BLOCK
      ?auto_145699 - BLOCK
      ?auto_145702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145700 ?auto_145698 ) ( ON-TABLE ?auto_145694 ) ( ON ?auto_145695 ?auto_145694 ) ( ON ?auto_145696 ?auto_145695 ) ( ON ?auto_145697 ?auto_145696 ) ( ON ?auto_145698 ?auto_145697 ) ( not ( = ?auto_145694 ?auto_145695 ) ) ( not ( = ?auto_145694 ?auto_145696 ) ) ( not ( = ?auto_145694 ?auto_145697 ) ) ( not ( = ?auto_145694 ?auto_145698 ) ) ( not ( = ?auto_145694 ?auto_145700 ) ) ( not ( = ?auto_145695 ?auto_145696 ) ) ( not ( = ?auto_145695 ?auto_145697 ) ) ( not ( = ?auto_145695 ?auto_145698 ) ) ( not ( = ?auto_145695 ?auto_145700 ) ) ( not ( = ?auto_145696 ?auto_145697 ) ) ( not ( = ?auto_145696 ?auto_145698 ) ) ( not ( = ?auto_145696 ?auto_145700 ) ) ( not ( = ?auto_145697 ?auto_145698 ) ) ( not ( = ?auto_145697 ?auto_145700 ) ) ( not ( = ?auto_145698 ?auto_145700 ) ) ( not ( = ?auto_145694 ?auto_145701 ) ) ( not ( = ?auto_145694 ?auto_145699 ) ) ( not ( = ?auto_145695 ?auto_145701 ) ) ( not ( = ?auto_145695 ?auto_145699 ) ) ( not ( = ?auto_145696 ?auto_145701 ) ) ( not ( = ?auto_145696 ?auto_145699 ) ) ( not ( = ?auto_145697 ?auto_145701 ) ) ( not ( = ?auto_145697 ?auto_145699 ) ) ( not ( = ?auto_145698 ?auto_145701 ) ) ( not ( = ?auto_145698 ?auto_145699 ) ) ( not ( = ?auto_145700 ?auto_145701 ) ) ( not ( = ?auto_145700 ?auto_145699 ) ) ( not ( = ?auto_145701 ?auto_145699 ) ) ( ON ?auto_145701 ?auto_145700 ) ( CLEAR ?auto_145702 ) ( ON-TABLE ?auto_145702 ) ( not ( = ?auto_145702 ?auto_145699 ) ) ( not ( = ?auto_145694 ?auto_145702 ) ) ( not ( = ?auto_145695 ?auto_145702 ) ) ( not ( = ?auto_145696 ?auto_145702 ) ) ( not ( = ?auto_145697 ?auto_145702 ) ) ( not ( = ?auto_145698 ?auto_145702 ) ) ( not ( = ?auto_145700 ?auto_145702 ) ) ( not ( = ?auto_145701 ?auto_145702 ) ) ( ON ?auto_145699 ?auto_145701 ) ( CLEAR ?auto_145699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145694 ?auto_145695 ?auto_145696 ?auto_145697 ?auto_145698 ?auto_145700 ?auto_145701 )
      ( MAKE-5PILE ?auto_145694 ?auto_145695 ?auto_145696 ?auto_145697 ?auto_145698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145703 - BLOCK
      ?auto_145704 - BLOCK
      ?auto_145705 - BLOCK
      ?auto_145706 - BLOCK
      ?auto_145707 - BLOCK
    )
    :vars
    (
      ?auto_145710 - BLOCK
      ?auto_145709 - BLOCK
      ?auto_145708 - BLOCK
      ?auto_145711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145710 ?auto_145707 ) ( ON-TABLE ?auto_145703 ) ( ON ?auto_145704 ?auto_145703 ) ( ON ?auto_145705 ?auto_145704 ) ( ON ?auto_145706 ?auto_145705 ) ( ON ?auto_145707 ?auto_145706 ) ( not ( = ?auto_145703 ?auto_145704 ) ) ( not ( = ?auto_145703 ?auto_145705 ) ) ( not ( = ?auto_145703 ?auto_145706 ) ) ( not ( = ?auto_145703 ?auto_145707 ) ) ( not ( = ?auto_145703 ?auto_145710 ) ) ( not ( = ?auto_145704 ?auto_145705 ) ) ( not ( = ?auto_145704 ?auto_145706 ) ) ( not ( = ?auto_145704 ?auto_145707 ) ) ( not ( = ?auto_145704 ?auto_145710 ) ) ( not ( = ?auto_145705 ?auto_145706 ) ) ( not ( = ?auto_145705 ?auto_145707 ) ) ( not ( = ?auto_145705 ?auto_145710 ) ) ( not ( = ?auto_145706 ?auto_145707 ) ) ( not ( = ?auto_145706 ?auto_145710 ) ) ( not ( = ?auto_145707 ?auto_145710 ) ) ( not ( = ?auto_145703 ?auto_145709 ) ) ( not ( = ?auto_145703 ?auto_145708 ) ) ( not ( = ?auto_145704 ?auto_145709 ) ) ( not ( = ?auto_145704 ?auto_145708 ) ) ( not ( = ?auto_145705 ?auto_145709 ) ) ( not ( = ?auto_145705 ?auto_145708 ) ) ( not ( = ?auto_145706 ?auto_145709 ) ) ( not ( = ?auto_145706 ?auto_145708 ) ) ( not ( = ?auto_145707 ?auto_145709 ) ) ( not ( = ?auto_145707 ?auto_145708 ) ) ( not ( = ?auto_145710 ?auto_145709 ) ) ( not ( = ?auto_145710 ?auto_145708 ) ) ( not ( = ?auto_145709 ?auto_145708 ) ) ( ON ?auto_145709 ?auto_145710 ) ( not ( = ?auto_145711 ?auto_145708 ) ) ( not ( = ?auto_145703 ?auto_145711 ) ) ( not ( = ?auto_145704 ?auto_145711 ) ) ( not ( = ?auto_145705 ?auto_145711 ) ) ( not ( = ?auto_145706 ?auto_145711 ) ) ( not ( = ?auto_145707 ?auto_145711 ) ) ( not ( = ?auto_145710 ?auto_145711 ) ) ( not ( = ?auto_145709 ?auto_145711 ) ) ( ON ?auto_145708 ?auto_145709 ) ( CLEAR ?auto_145708 ) ( HOLDING ?auto_145711 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145711 )
      ( MAKE-5PILE ?auto_145703 ?auto_145704 ?auto_145705 ?auto_145706 ?auto_145707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145712 - BLOCK
      ?auto_145713 - BLOCK
      ?auto_145714 - BLOCK
      ?auto_145715 - BLOCK
      ?auto_145716 - BLOCK
    )
    :vars
    (
      ?auto_145717 - BLOCK
      ?auto_145719 - BLOCK
      ?auto_145720 - BLOCK
      ?auto_145718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145717 ?auto_145716 ) ( ON-TABLE ?auto_145712 ) ( ON ?auto_145713 ?auto_145712 ) ( ON ?auto_145714 ?auto_145713 ) ( ON ?auto_145715 ?auto_145714 ) ( ON ?auto_145716 ?auto_145715 ) ( not ( = ?auto_145712 ?auto_145713 ) ) ( not ( = ?auto_145712 ?auto_145714 ) ) ( not ( = ?auto_145712 ?auto_145715 ) ) ( not ( = ?auto_145712 ?auto_145716 ) ) ( not ( = ?auto_145712 ?auto_145717 ) ) ( not ( = ?auto_145713 ?auto_145714 ) ) ( not ( = ?auto_145713 ?auto_145715 ) ) ( not ( = ?auto_145713 ?auto_145716 ) ) ( not ( = ?auto_145713 ?auto_145717 ) ) ( not ( = ?auto_145714 ?auto_145715 ) ) ( not ( = ?auto_145714 ?auto_145716 ) ) ( not ( = ?auto_145714 ?auto_145717 ) ) ( not ( = ?auto_145715 ?auto_145716 ) ) ( not ( = ?auto_145715 ?auto_145717 ) ) ( not ( = ?auto_145716 ?auto_145717 ) ) ( not ( = ?auto_145712 ?auto_145719 ) ) ( not ( = ?auto_145712 ?auto_145720 ) ) ( not ( = ?auto_145713 ?auto_145719 ) ) ( not ( = ?auto_145713 ?auto_145720 ) ) ( not ( = ?auto_145714 ?auto_145719 ) ) ( not ( = ?auto_145714 ?auto_145720 ) ) ( not ( = ?auto_145715 ?auto_145719 ) ) ( not ( = ?auto_145715 ?auto_145720 ) ) ( not ( = ?auto_145716 ?auto_145719 ) ) ( not ( = ?auto_145716 ?auto_145720 ) ) ( not ( = ?auto_145717 ?auto_145719 ) ) ( not ( = ?auto_145717 ?auto_145720 ) ) ( not ( = ?auto_145719 ?auto_145720 ) ) ( ON ?auto_145719 ?auto_145717 ) ( not ( = ?auto_145718 ?auto_145720 ) ) ( not ( = ?auto_145712 ?auto_145718 ) ) ( not ( = ?auto_145713 ?auto_145718 ) ) ( not ( = ?auto_145714 ?auto_145718 ) ) ( not ( = ?auto_145715 ?auto_145718 ) ) ( not ( = ?auto_145716 ?auto_145718 ) ) ( not ( = ?auto_145717 ?auto_145718 ) ) ( not ( = ?auto_145719 ?auto_145718 ) ) ( ON ?auto_145720 ?auto_145719 ) ( ON ?auto_145718 ?auto_145720 ) ( CLEAR ?auto_145718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145712 ?auto_145713 ?auto_145714 ?auto_145715 ?auto_145716 ?auto_145717 ?auto_145719 ?auto_145720 )
      ( MAKE-5PILE ?auto_145712 ?auto_145713 ?auto_145714 ?auto_145715 ?auto_145716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145725 - BLOCK
      ?auto_145726 - BLOCK
      ?auto_145727 - BLOCK
      ?auto_145728 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_145728 ) ( CLEAR ?auto_145727 ) ( ON-TABLE ?auto_145725 ) ( ON ?auto_145726 ?auto_145725 ) ( ON ?auto_145727 ?auto_145726 ) ( not ( = ?auto_145725 ?auto_145726 ) ) ( not ( = ?auto_145725 ?auto_145727 ) ) ( not ( = ?auto_145725 ?auto_145728 ) ) ( not ( = ?auto_145726 ?auto_145727 ) ) ( not ( = ?auto_145726 ?auto_145728 ) ) ( not ( = ?auto_145727 ?auto_145728 ) ) )
    :subtasks
    ( ( !STACK ?auto_145728 ?auto_145727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145729 - BLOCK
      ?auto_145730 - BLOCK
      ?auto_145731 - BLOCK
      ?auto_145732 - BLOCK
    )
    :vars
    (
      ?auto_145733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145731 ) ( ON-TABLE ?auto_145729 ) ( ON ?auto_145730 ?auto_145729 ) ( ON ?auto_145731 ?auto_145730 ) ( not ( = ?auto_145729 ?auto_145730 ) ) ( not ( = ?auto_145729 ?auto_145731 ) ) ( not ( = ?auto_145729 ?auto_145732 ) ) ( not ( = ?auto_145730 ?auto_145731 ) ) ( not ( = ?auto_145730 ?auto_145732 ) ) ( not ( = ?auto_145731 ?auto_145732 ) ) ( ON ?auto_145732 ?auto_145733 ) ( CLEAR ?auto_145732 ) ( HAND-EMPTY ) ( not ( = ?auto_145729 ?auto_145733 ) ) ( not ( = ?auto_145730 ?auto_145733 ) ) ( not ( = ?auto_145731 ?auto_145733 ) ) ( not ( = ?auto_145732 ?auto_145733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145732 ?auto_145733 )
      ( MAKE-4PILE ?auto_145729 ?auto_145730 ?auto_145731 ?auto_145732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145734 - BLOCK
      ?auto_145735 - BLOCK
      ?auto_145736 - BLOCK
      ?auto_145737 - BLOCK
    )
    :vars
    (
      ?auto_145738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145734 ) ( ON ?auto_145735 ?auto_145734 ) ( not ( = ?auto_145734 ?auto_145735 ) ) ( not ( = ?auto_145734 ?auto_145736 ) ) ( not ( = ?auto_145734 ?auto_145737 ) ) ( not ( = ?auto_145735 ?auto_145736 ) ) ( not ( = ?auto_145735 ?auto_145737 ) ) ( not ( = ?auto_145736 ?auto_145737 ) ) ( ON ?auto_145737 ?auto_145738 ) ( CLEAR ?auto_145737 ) ( not ( = ?auto_145734 ?auto_145738 ) ) ( not ( = ?auto_145735 ?auto_145738 ) ) ( not ( = ?auto_145736 ?auto_145738 ) ) ( not ( = ?auto_145737 ?auto_145738 ) ) ( HOLDING ?auto_145736 ) ( CLEAR ?auto_145735 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145734 ?auto_145735 ?auto_145736 )
      ( MAKE-4PILE ?auto_145734 ?auto_145735 ?auto_145736 ?auto_145737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145739 - BLOCK
      ?auto_145740 - BLOCK
      ?auto_145741 - BLOCK
      ?auto_145742 - BLOCK
    )
    :vars
    (
      ?auto_145743 - BLOCK
      ?auto_145744 - BLOCK
      ?auto_145747 - BLOCK
      ?auto_145745 - BLOCK
      ?auto_145746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145739 ) ( ON ?auto_145740 ?auto_145739 ) ( not ( = ?auto_145739 ?auto_145740 ) ) ( not ( = ?auto_145739 ?auto_145741 ) ) ( not ( = ?auto_145739 ?auto_145742 ) ) ( not ( = ?auto_145740 ?auto_145741 ) ) ( not ( = ?auto_145740 ?auto_145742 ) ) ( not ( = ?auto_145741 ?auto_145742 ) ) ( ON ?auto_145742 ?auto_145743 ) ( not ( = ?auto_145739 ?auto_145743 ) ) ( not ( = ?auto_145740 ?auto_145743 ) ) ( not ( = ?auto_145741 ?auto_145743 ) ) ( not ( = ?auto_145742 ?auto_145743 ) ) ( CLEAR ?auto_145740 ) ( ON ?auto_145741 ?auto_145742 ) ( CLEAR ?auto_145741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145744 ) ( ON ?auto_145747 ?auto_145744 ) ( ON ?auto_145745 ?auto_145747 ) ( ON ?auto_145746 ?auto_145745 ) ( ON ?auto_145743 ?auto_145746 ) ( not ( = ?auto_145744 ?auto_145747 ) ) ( not ( = ?auto_145744 ?auto_145745 ) ) ( not ( = ?auto_145744 ?auto_145746 ) ) ( not ( = ?auto_145744 ?auto_145743 ) ) ( not ( = ?auto_145744 ?auto_145742 ) ) ( not ( = ?auto_145744 ?auto_145741 ) ) ( not ( = ?auto_145747 ?auto_145745 ) ) ( not ( = ?auto_145747 ?auto_145746 ) ) ( not ( = ?auto_145747 ?auto_145743 ) ) ( not ( = ?auto_145747 ?auto_145742 ) ) ( not ( = ?auto_145747 ?auto_145741 ) ) ( not ( = ?auto_145745 ?auto_145746 ) ) ( not ( = ?auto_145745 ?auto_145743 ) ) ( not ( = ?auto_145745 ?auto_145742 ) ) ( not ( = ?auto_145745 ?auto_145741 ) ) ( not ( = ?auto_145746 ?auto_145743 ) ) ( not ( = ?auto_145746 ?auto_145742 ) ) ( not ( = ?auto_145746 ?auto_145741 ) ) ( not ( = ?auto_145739 ?auto_145744 ) ) ( not ( = ?auto_145739 ?auto_145747 ) ) ( not ( = ?auto_145739 ?auto_145745 ) ) ( not ( = ?auto_145739 ?auto_145746 ) ) ( not ( = ?auto_145740 ?auto_145744 ) ) ( not ( = ?auto_145740 ?auto_145747 ) ) ( not ( = ?auto_145740 ?auto_145745 ) ) ( not ( = ?auto_145740 ?auto_145746 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145744 ?auto_145747 ?auto_145745 ?auto_145746 ?auto_145743 ?auto_145742 )
      ( MAKE-4PILE ?auto_145739 ?auto_145740 ?auto_145741 ?auto_145742 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145748 - BLOCK
      ?auto_145749 - BLOCK
      ?auto_145750 - BLOCK
      ?auto_145751 - BLOCK
    )
    :vars
    (
      ?auto_145753 - BLOCK
      ?auto_145754 - BLOCK
      ?auto_145755 - BLOCK
      ?auto_145752 - BLOCK
      ?auto_145756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145748 ) ( not ( = ?auto_145748 ?auto_145749 ) ) ( not ( = ?auto_145748 ?auto_145750 ) ) ( not ( = ?auto_145748 ?auto_145751 ) ) ( not ( = ?auto_145749 ?auto_145750 ) ) ( not ( = ?auto_145749 ?auto_145751 ) ) ( not ( = ?auto_145750 ?auto_145751 ) ) ( ON ?auto_145751 ?auto_145753 ) ( not ( = ?auto_145748 ?auto_145753 ) ) ( not ( = ?auto_145749 ?auto_145753 ) ) ( not ( = ?auto_145750 ?auto_145753 ) ) ( not ( = ?auto_145751 ?auto_145753 ) ) ( ON ?auto_145750 ?auto_145751 ) ( CLEAR ?auto_145750 ) ( ON-TABLE ?auto_145754 ) ( ON ?auto_145755 ?auto_145754 ) ( ON ?auto_145752 ?auto_145755 ) ( ON ?auto_145756 ?auto_145752 ) ( ON ?auto_145753 ?auto_145756 ) ( not ( = ?auto_145754 ?auto_145755 ) ) ( not ( = ?auto_145754 ?auto_145752 ) ) ( not ( = ?auto_145754 ?auto_145756 ) ) ( not ( = ?auto_145754 ?auto_145753 ) ) ( not ( = ?auto_145754 ?auto_145751 ) ) ( not ( = ?auto_145754 ?auto_145750 ) ) ( not ( = ?auto_145755 ?auto_145752 ) ) ( not ( = ?auto_145755 ?auto_145756 ) ) ( not ( = ?auto_145755 ?auto_145753 ) ) ( not ( = ?auto_145755 ?auto_145751 ) ) ( not ( = ?auto_145755 ?auto_145750 ) ) ( not ( = ?auto_145752 ?auto_145756 ) ) ( not ( = ?auto_145752 ?auto_145753 ) ) ( not ( = ?auto_145752 ?auto_145751 ) ) ( not ( = ?auto_145752 ?auto_145750 ) ) ( not ( = ?auto_145756 ?auto_145753 ) ) ( not ( = ?auto_145756 ?auto_145751 ) ) ( not ( = ?auto_145756 ?auto_145750 ) ) ( not ( = ?auto_145748 ?auto_145754 ) ) ( not ( = ?auto_145748 ?auto_145755 ) ) ( not ( = ?auto_145748 ?auto_145752 ) ) ( not ( = ?auto_145748 ?auto_145756 ) ) ( not ( = ?auto_145749 ?auto_145754 ) ) ( not ( = ?auto_145749 ?auto_145755 ) ) ( not ( = ?auto_145749 ?auto_145752 ) ) ( not ( = ?auto_145749 ?auto_145756 ) ) ( HOLDING ?auto_145749 ) ( CLEAR ?auto_145748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145748 ?auto_145749 )
      ( MAKE-4PILE ?auto_145748 ?auto_145749 ?auto_145750 ?auto_145751 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145757 - BLOCK
      ?auto_145758 - BLOCK
      ?auto_145759 - BLOCK
      ?auto_145760 - BLOCK
    )
    :vars
    (
      ?auto_145761 - BLOCK
      ?auto_145763 - BLOCK
      ?auto_145762 - BLOCK
      ?auto_145765 - BLOCK
      ?auto_145764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145757 ) ( not ( = ?auto_145757 ?auto_145758 ) ) ( not ( = ?auto_145757 ?auto_145759 ) ) ( not ( = ?auto_145757 ?auto_145760 ) ) ( not ( = ?auto_145758 ?auto_145759 ) ) ( not ( = ?auto_145758 ?auto_145760 ) ) ( not ( = ?auto_145759 ?auto_145760 ) ) ( ON ?auto_145760 ?auto_145761 ) ( not ( = ?auto_145757 ?auto_145761 ) ) ( not ( = ?auto_145758 ?auto_145761 ) ) ( not ( = ?auto_145759 ?auto_145761 ) ) ( not ( = ?auto_145760 ?auto_145761 ) ) ( ON ?auto_145759 ?auto_145760 ) ( ON-TABLE ?auto_145763 ) ( ON ?auto_145762 ?auto_145763 ) ( ON ?auto_145765 ?auto_145762 ) ( ON ?auto_145764 ?auto_145765 ) ( ON ?auto_145761 ?auto_145764 ) ( not ( = ?auto_145763 ?auto_145762 ) ) ( not ( = ?auto_145763 ?auto_145765 ) ) ( not ( = ?auto_145763 ?auto_145764 ) ) ( not ( = ?auto_145763 ?auto_145761 ) ) ( not ( = ?auto_145763 ?auto_145760 ) ) ( not ( = ?auto_145763 ?auto_145759 ) ) ( not ( = ?auto_145762 ?auto_145765 ) ) ( not ( = ?auto_145762 ?auto_145764 ) ) ( not ( = ?auto_145762 ?auto_145761 ) ) ( not ( = ?auto_145762 ?auto_145760 ) ) ( not ( = ?auto_145762 ?auto_145759 ) ) ( not ( = ?auto_145765 ?auto_145764 ) ) ( not ( = ?auto_145765 ?auto_145761 ) ) ( not ( = ?auto_145765 ?auto_145760 ) ) ( not ( = ?auto_145765 ?auto_145759 ) ) ( not ( = ?auto_145764 ?auto_145761 ) ) ( not ( = ?auto_145764 ?auto_145760 ) ) ( not ( = ?auto_145764 ?auto_145759 ) ) ( not ( = ?auto_145757 ?auto_145763 ) ) ( not ( = ?auto_145757 ?auto_145762 ) ) ( not ( = ?auto_145757 ?auto_145765 ) ) ( not ( = ?auto_145757 ?auto_145764 ) ) ( not ( = ?auto_145758 ?auto_145763 ) ) ( not ( = ?auto_145758 ?auto_145762 ) ) ( not ( = ?auto_145758 ?auto_145765 ) ) ( not ( = ?auto_145758 ?auto_145764 ) ) ( CLEAR ?auto_145757 ) ( ON ?auto_145758 ?auto_145759 ) ( CLEAR ?auto_145758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145763 ?auto_145762 ?auto_145765 ?auto_145764 ?auto_145761 ?auto_145760 ?auto_145759 )
      ( MAKE-4PILE ?auto_145757 ?auto_145758 ?auto_145759 ?auto_145760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145766 - BLOCK
      ?auto_145767 - BLOCK
      ?auto_145768 - BLOCK
      ?auto_145769 - BLOCK
    )
    :vars
    (
      ?auto_145771 - BLOCK
      ?auto_145774 - BLOCK
      ?auto_145772 - BLOCK
      ?auto_145773 - BLOCK
      ?auto_145770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145766 ?auto_145767 ) ) ( not ( = ?auto_145766 ?auto_145768 ) ) ( not ( = ?auto_145766 ?auto_145769 ) ) ( not ( = ?auto_145767 ?auto_145768 ) ) ( not ( = ?auto_145767 ?auto_145769 ) ) ( not ( = ?auto_145768 ?auto_145769 ) ) ( ON ?auto_145769 ?auto_145771 ) ( not ( = ?auto_145766 ?auto_145771 ) ) ( not ( = ?auto_145767 ?auto_145771 ) ) ( not ( = ?auto_145768 ?auto_145771 ) ) ( not ( = ?auto_145769 ?auto_145771 ) ) ( ON ?auto_145768 ?auto_145769 ) ( ON-TABLE ?auto_145774 ) ( ON ?auto_145772 ?auto_145774 ) ( ON ?auto_145773 ?auto_145772 ) ( ON ?auto_145770 ?auto_145773 ) ( ON ?auto_145771 ?auto_145770 ) ( not ( = ?auto_145774 ?auto_145772 ) ) ( not ( = ?auto_145774 ?auto_145773 ) ) ( not ( = ?auto_145774 ?auto_145770 ) ) ( not ( = ?auto_145774 ?auto_145771 ) ) ( not ( = ?auto_145774 ?auto_145769 ) ) ( not ( = ?auto_145774 ?auto_145768 ) ) ( not ( = ?auto_145772 ?auto_145773 ) ) ( not ( = ?auto_145772 ?auto_145770 ) ) ( not ( = ?auto_145772 ?auto_145771 ) ) ( not ( = ?auto_145772 ?auto_145769 ) ) ( not ( = ?auto_145772 ?auto_145768 ) ) ( not ( = ?auto_145773 ?auto_145770 ) ) ( not ( = ?auto_145773 ?auto_145771 ) ) ( not ( = ?auto_145773 ?auto_145769 ) ) ( not ( = ?auto_145773 ?auto_145768 ) ) ( not ( = ?auto_145770 ?auto_145771 ) ) ( not ( = ?auto_145770 ?auto_145769 ) ) ( not ( = ?auto_145770 ?auto_145768 ) ) ( not ( = ?auto_145766 ?auto_145774 ) ) ( not ( = ?auto_145766 ?auto_145772 ) ) ( not ( = ?auto_145766 ?auto_145773 ) ) ( not ( = ?auto_145766 ?auto_145770 ) ) ( not ( = ?auto_145767 ?auto_145774 ) ) ( not ( = ?auto_145767 ?auto_145772 ) ) ( not ( = ?auto_145767 ?auto_145773 ) ) ( not ( = ?auto_145767 ?auto_145770 ) ) ( ON ?auto_145767 ?auto_145768 ) ( CLEAR ?auto_145767 ) ( HOLDING ?auto_145766 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145766 )
      ( MAKE-4PILE ?auto_145766 ?auto_145767 ?auto_145768 ?auto_145769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145775 - BLOCK
      ?auto_145776 - BLOCK
      ?auto_145777 - BLOCK
      ?auto_145778 - BLOCK
    )
    :vars
    (
      ?auto_145780 - BLOCK
      ?auto_145779 - BLOCK
      ?auto_145783 - BLOCK
      ?auto_145782 - BLOCK
      ?auto_145781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145775 ?auto_145776 ) ) ( not ( = ?auto_145775 ?auto_145777 ) ) ( not ( = ?auto_145775 ?auto_145778 ) ) ( not ( = ?auto_145776 ?auto_145777 ) ) ( not ( = ?auto_145776 ?auto_145778 ) ) ( not ( = ?auto_145777 ?auto_145778 ) ) ( ON ?auto_145778 ?auto_145780 ) ( not ( = ?auto_145775 ?auto_145780 ) ) ( not ( = ?auto_145776 ?auto_145780 ) ) ( not ( = ?auto_145777 ?auto_145780 ) ) ( not ( = ?auto_145778 ?auto_145780 ) ) ( ON ?auto_145777 ?auto_145778 ) ( ON-TABLE ?auto_145779 ) ( ON ?auto_145783 ?auto_145779 ) ( ON ?auto_145782 ?auto_145783 ) ( ON ?auto_145781 ?auto_145782 ) ( ON ?auto_145780 ?auto_145781 ) ( not ( = ?auto_145779 ?auto_145783 ) ) ( not ( = ?auto_145779 ?auto_145782 ) ) ( not ( = ?auto_145779 ?auto_145781 ) ) ( not ( = ?auto_145779 ?auto_145780 ) ) ( not ( = ?auto_145779 ?auto_145778 ) ) ( not ( = ?auto_145779 ?auto_145777 ) ) ( not ( = ?auto_145783 ?auto_145782 ) ) ( not ( = ?auto_145783 ?auto_145781 ) ) ( not ( = ?auto_145783 ?auto_145780 ) ) ( not ( = ?auto_145783 ?auto_145778 ) ) ( not ( = ?auto_145783 ?auto_145777 ) ) ( not ( = ?auto_145782 ?auto_145781 ) ) ( not ( = ?auto_145782 ?auto_145780 ) ) ( not ( = ?auto_145782 ?auto_145778 ) ) ( not ( = ?auto_145782 ?auto_145777 ) ) ( not ( = ?auto_145781 ?auto_145780 ) ) ( not ( = ?auto_145781 ?auto_145778 ) ) ( not ( = ?auto_145781 ?auto_145777 ) ) ( not ( = ?auto_145775 ?auto_145779 ) ) ( not ( = ?auto_145775 ?auto_145783 ) ) ( not ( = ?auto_145775 ?auto_145782 ) ) ( not ( = ?auto_145775 ?auto_145781 ) ) ( not ( = ?auto_145776 ?auto_145779 ) ) ( not ( = ?auto_145776 ?auto_145783 ) ) ( not ( = ?auto_145776 ?auto_145782 ) ) ( not ( = ?auto_145776 ?auto_145781 ) ) ( ON ?auto_145776 ?auto_145777 ) ( ON ?auto_145775 ?auto_145776 ) ( CLEAR ?auto_145775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145779 ?auto_145783 ?auto_145782 ?auto_145781 ?auto_145780 ?auto_145778 ?auto_145777 ?auto_145776 )
      ( MAKE-4PILE ?auto_145775 ?auto_145776 ?auto_145777 ?auto_145778 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145788 - BLOCK
      ?auto_145789 - BLOCK
      ?auto_145790 - BLOCK
      ?auto_145791 - BLOCK
    )
    :vars
    (
      ?auto_145792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145792 ?auto_145791 ) ( CLEAR ?auto_145792 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145788 ) ( ON ?auto_145789 ?auto_145788 ) ( ON ?auto_145790 ?auto_145789 ) ( ON ?auto_145791 ?auto_145790 ) ( not ( = ?auto_145788 ?auto_145789 ) ) ( not ( = ?auto_145788 ?auto_145790 ) ) ( not ( = ?auto_145788 ?auto_145791 ) ) ( not ( = ?auto_145788 ?auto_145792 ) ) ( not ( = ?auto_145789 ?auto_145790 ) ) ( not ( = ?auto_145789 ?auto_145791 ) ) ( not ( = ?auto_145789 ?auto_145792 ) ) ( not ( = ?auto_145790 ?auto_145791 ) ) ( not ( = ?auto_145790 ?auto_145792 ) ) ( not ( = ?auto_145791 ?auto_145792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145792 ?auto_145791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145793 - BLOCK
      ?auto_145794 - BLOCK
      ?auto_145795 - BLOCK
      ?auto_145796 - BLOCK
    )
    :vars
    (
      ?auto_145797 - BLOCK
      ?auto_145798 - BLOCK
      ?auto_145799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145797 ?auto_145796 ) ( CLEAR ?auto_145797 ) ( ON-TABLE ?auto_145793 ) ( ON ?auto_145794 ?auto_145793 ) ( ON ?auto_145795 ?auto_145794 ) ( ON ?auto_145796 ?auto_145795 ) ( not ( = ?auto_145793 ?auto_145794 ) ) ( not ( = ?auto_145793 ?auto_145795 ) ) ( not ( = ?auto_145793 ?auto_145796 ) ) ( not ( = ?auto_145793 ?auto_145797 ) ) ( not ( = ?auto_145794 ?auto_145795 ) ) ( not ( = ?auto_145794 ?auto_145796 ) ) ( not ( = ?auto_145794 ?auto_145797 ) ) ( not ( = ?auto_145795 ?auto_145796 ) ) ( not ( = ?auto_145795 ?auto_145797 ) ) ( not ( = ?auto_145796 ?auto_145797 ) ) ( HOLDING ?auto_145798 ) ( CLEAR ?auto_145799 ) ( not ( = ?auto_145793 ?auto_145798 ) ) ( not ( = ?auto_145793 ?auto_145799 ) ) ( not ( = ?auto_145794 ?auto_145798 ) ) ( not ( = ?auto_145794 ?auto_145799 ) ) ( not ( = ?auto_145795 ?auto_145798 ) ) ( not ( = ?auto_145795 ?auto_145799 ) ) ( not ( = ?auto_145796 ?auto_145798 ) ) ( not ( = ?auto_145796 ?auto_145799 ) ) ( not ( = ?auto_145797 ?auto_145798 ) ) ( not ( = ?auto_145797 ?auto_145799 ) ) ( not ( = ?auto_145798 ?auto_145799 ) ) )
    :subtasks
    ( ( !STACK ?auto_145798 ?auto_145799 )
      ( MAKE-4PILE ?auto_145793 ?auto_145794 ?auto_145795 ?auto_145796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145800 - BLOCK
      ?auto_145801 - BLOCK
      ?auto_145802 - BLOCK
      ?auto_145803 - BLOCK
    )
    :vars
    (
      ?auto_145806 - BLOCK
      ?auto_145804 - BLOCK
      ?auto_145805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145806 ?auto_145803 ) ( ON-TABLE ?auto_145800 ) ( ON ?auto_145801 ?auto_145800 ) ( ON ?auto_145802 ?auto_145801 ) ( ON ?auto_145803 ?auto_145802 ) ( not ( = ?auto_145800 ?auto_145801 ) ) ( not ( = ?auto_145800 ?auto_145802 ) ) ( not ( = ?auto_145800 ?auto_145803 ) ) ( not ( = ?auto_145800 ?auto_145806 ) ) ( not ( = ?auto_145801 ?auto_145802 ) ) ( not ( = ?auto_145801 ?auto_145803 ) ) ( not ( = ?auto_145801 ?auto_145806 ) ) ( not ( = ?auto_145802 ?auto_145803 ) ) ( not ( = ?auto_145802 ?auto_145806 ) ) ( not ( = ?auto_145803 ?auto_145806 ) ) ( CLEAR ?auto_145804 ) ( not ( = ?auto_145800 ?auto_145805 ) ) ( not ( = ?auto_145800 ?auto_145804 ) ) ( not ( = ?auto_145801 ?auto_145805 ) ) ( not ( = ?auto_145801 ?auto_145804 ) ) ( not ( = ?auto_145802 ?auto_145805 ) ) ( not ( = ?auto_145802 ?auto_145804 ) ) ( not ( = ?auto_145803 ?auto_145805 ) ) ( not ( = ?auto_145803 ?auto_145804 ) ) ( not ( = ?auto_145806 ?auto_145805 ) ) ( not ( = ?auto_145806 ?auto_145804 ) ) ( not ( = ?auto_145805 ?auto_145804 ) ) ( ON ?auto_145805 ?auto_145806 ) ( CLEAR ?auto_145805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145800 ?auto_145801 ?auto_145802 ?auto_145803 ?auto_145806 )
      ( MAKE-4PILE ?auto_145800 ?auto_145801 ?auto_145802 ?auto_145803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145807 - BLOCK
      ?auto_145808 - BLOCK
      ?auto_145809 - BLOCK
      ?auto_145810 - BLOCK
    )
    :vars
    (
      ?auto_145812 - BLOCK
      ?auto_145811 - BLOCK
      ?auto_145813 - BLOCK
      ?auto_145814 - BLOCK
      ?auto_145815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145812 ?auto_145810 ) ( ON-TABLE ?auto_145807 ) ( ON ?auto_145808 ?auto_145807 ) ( ON ?auto_145809 ?auto_145808 ) ( ON ?auto_145810 ?auto_145809 ) ( not ( = ?auto_145807 ?auto_145808 ) ) ( not ( = ?auto_145807 ?auto_145809 ) ) ( not ( = ?auto_145807 ?auto_145810 ) ) ( not ( = ?auto_145807 ?auto_145812 ) ) ( not ( = ?auto_145808 ?auto_145809 ) ) ( not ( = ?auto_145808 ?auto_145810 ) ) ( not ( = ?auto_145808 ?auto_145812 ) ) ( not ( = ?auto_145809 ?auto_145810 ) ) ( not ( = ?auto_145809 ?auto_145812 ) ) ( not ( = ?auto_145810 ?auto_145812 ) ) ( not ( = ?auto_145807 ?auto_145811 ) ) ( not ( = ?auto_145807 ?auto_145813 ) ) ( not ( = ?auto_145808 ?auto_145811 ) ) ( not ( = ?auto_145808 ?auto_145813 ) ) ( not ( = ?auto_145809 ?auto_145811 ) ) ( not ( = ?auto_145809 ?auto_145813 ) ) ( not ( = ?auto_145810 ?auto_145811 ) ) ( not ( = ?auto_145810 ?auto_145813 ) ) ( not ( = ?auto_145812 ?auto_145811 ) ) ( not ( = ?auto_145812 ?auto_145813 ) ) ( not ( = ?auto_145811 ?auto_145813 ) ) ( ON ?auto_145811 ?auto_145812 ) ( CLEAR ?auto_145811 ) ( HOLDING ?auto_145813 ) ( CLEAR ?auto_145814 ) ( ON-TABLE ?auto_145815 ) ( ON ?auto_145814 ?auto_145815 ) ( not ( = ?auto_145815 ?auto_145814 ) ) ( not ( = ?auto_145815 ?auto_145813 ) ) ( not ( = ?auto_145814 ?auto_145813 ) ) ( not ( = ?auto_145807 ?auto_145814 ) ) ( not ( = ?auto_145807 ?auto_145815 ) ) ( not ( = ?auto_145808 ?auto_145814 ) ) ( not ( = ?auto_145808 ?auto_145815 ) ) ( not ( = ?auto_145809 ?auto_145814 ) ) ( not ( = ?auto_145809 ?auto_145815 ) ) ( not ( = ?auto_145810 ?auto_145814 ) ) ( not ( = ?auto_145810 ?auto_145815 ) ) ( not ( = ?auto_145812 ?auto_145814 ) ) ( not ( = ?auto_145812 ?auto_145815 ) ) ( not ( = ?auto_145811 ?auto_145814 ) ) ( not ( = ?auto_145811 ?auto_145815 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145815 ?auto_145814 ?auto_145813 )
      ( MAKE-4PILE ?auto_145807 ?auto_145808 ?auto_145809 ?auto_145810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145816 - BLOCK
      ?auto_145817 - BLOCK
      ?auto_145818 - BLOCK
      ?auto_145819 - BLOCK
    )
    :vars
    (
      ?auto_145820 - BLOCK
      ?auto_145821 - BLOCK
      ?auto_145823 - BLOCK
      ?auto_145824 - BLOCK
      ?auto_145822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145820 ?auto_145819 ) ( ON-TABLE ?auto_145816 ) ( ON ?auto_145817 ?auto_145816 ) ( ON ?auto_145818 ?auto_145817 ) ( ON ?auto_145819 ?auto_145818 ) ( not ( = ?auto_145816 ?auto_145817 ) ) ( not ( = ?auto_145816 ?auto_145818 ) ) ( not ( = ?auto_145816 ?auto_145819 ) ) ( not ( = ?auto_145816 ?auto_145820 ) ) ( not ( = ?auto_145817 ?auto_145818 ) ) ( not ( = ?auto_145817 ?auto_145819 ) ) ( not ( = ?auto_145817 ?auto_145820 ) ) ( not ( = ?auto_145818 ?auto_145819 ) ) ( not ( = ?auto_145818 ?auto_145820 ) ) ( not ( = ?auto_145819 ?auto_145820 ) ) ( not ( = ?auto_145816 ?auto_145821 ) ) ( not ( = ?auto_145816 ?auto_145823 ) ) ( not ( = ?auto_145817 ?auto_145821 ) ) ( not ( = ?auto_145817 ?auto_145823 ) ) ( not ( = ?auto_145818 ?auto_145821 ) ) ( not ( = ?auto_145818 ?auto_145823 ) ) ( not ( = ?auto_145819 ?auto_145821 ) ) ( not ( = ?auto_145819 ?auto_145823 ) ) ( not ( = ?auto_145820 ?auto_145821 ) ) ( not ( = ?auto_145820 ?auto_145823 ) ) ( not ( = ?auto_145821 ?auto_145823 ) ) ( ON ?auto_145821 ?auto_145820 ) ( CLEAR ?auto_145824 ) ( ON-TABLE ?auto_145822 ) ( ON ?auto_145824 ?auto_145822 ) ( not ( = ?auto_145822 ?auto_145824 ) ) ( not ( = ?auto_145822 ?auto_145823 ) ) ( not ( = ?auto_145824 ?auto_145823 ) ) ( not ( = ?auto_145816 ?auto_145824 ) ) ( not ( = ?auto_145816 ?auto_145822 ) ) ( not ( = ?auto_145817 ?auto_145824 ) ) ( not ( = ?auto_145817 ?auto_145822 ) ) ( not ( = ?auto_145818 ?auto_145824 ) ) ( not ( = ?auto_145818 ?auto_145822 ) ) ( not ( = ?auto_145819 ?auto_145824 ) ) ( not ( = ?auto_145819 ?auto_145822 ) ) ( not ( = ?auto_145820 ?auto_145824 ) ) ( not ( = ?auto_145820 ?auto_145822 ) ) ( not ( = ?auto_145821 ?auto_145824 ) ) ( not ( = ?auto_145821 ?auto_145822 ) ) ( ON ?auto_145823 ?auto_145821 ) ( CLEAR ?auto_145823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145816 ?auto_145817 ?auto_145818 ?auto_145819 ?auto_145820 ?auto_145821 )
      ( MAKE-4PILE ?auto_145816 ?auto_145817 ?auto_145818 ?auto_145819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145825 - BLOCK
      ?auto_145826 - BLOCK
      ?auto_145827 - BLOCK
      ?auto_145828 - BLOCK
    )
    :vars
    (
      ?auto_145829 - BLOCK
      ?auto_145832 - BLOCK
      ?auto_145831 - BLOCK
      ?auto_145833 - BLOCK
      ?auto_145830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145829 ?auto_145828 ) ( ON-TABLE ?auto_145825 ) ( ON ?auto_145826 ?auto_145825 ) ( ON ?auto_145827 ?auto_145826 ) ( ON ?auto_145828 ?auto_145827 ) ( not ( = ?auto_145825 ?auto_145826 ) ) ( not ( = ?auto_145825 ?auto_145827 ) ) ( not ( = ?auto_145825 ?auto_145828 ) ) ( not ( = ?auto_145825 ?auto_145829 ) ) ( not ( = ?auto_145826 ?auto_145827 ) ) ( not ( = ?auto_145826 ?auto_145828 ) ) ( not ( = ?auto_145826 ?auto_145829 ) ) ( not ( = ?auto_145827 ?auto_145828 ) ) ( not ( = ?auto_145827 ?auto_145829 ) ) ( not ( = ?auto_145828 ?auto_145829 ) ) ( not ( = ?auto_145825 ?auto_145832 ) ) ( not ( = ?auto_145825 ?auto_145831 ) ) ( not ( = ?auto_145826 ?auto_145832 ) ) ( not ( = ?auto_145826 ?auto_145831 ) ) ( not ( = ?auto_145827 ?auto_145832 ) ) ( not ( = ?auto_145827 ?auto_145831 ) ) ( not ( = ?auto_145828 ?auto_145832 ) ) ( not ( = ?auto_145828 ?auto_145831 ) ) ( not ( = ?auto_145829 ?auto_145832 ) ) ( not ( = ?auto_145829 ?auto_145831 ) ) ( not ( = ?auto_145832 ?auto_145831 ) ) ( ON ?auto_145832 ?auto_145829 ) ( ON-TABLE ?auto_145833 ) ( not ( = ?auto_145833 ?auto_145830 ) ) ( not ( = ?auto_145833 ?auto_145831 ) ) ( not ( = ?auto_145830 ?auto_145831 ) ) ( not ( = ?auto_145825 ?auto_145830 ) ) ( not ( = ?auto_145825 ?auto_145833 ) ) ( not ( = ?auto_145826 ?auto_145830 ) ) ( not ( = ?auto_145826 ?auto_145833 ) ) ( not ( = ?auto_145827 ?auto_145830 ) ) ( not ( = ?auto_145827 ?auto_145833 ) ) ( not ( = ?auto_145828 ?auto_145830 ) ) ( not ( = ?auto_145828 ?auto_145833 ) ) ( not ( = ?auto_145829 ?auto_145830 ) ) ( not ( = ?auto_145829 ?auto_145833 ) ) ( not ( = ?auto_145832 ?auto_145830 ) ) ( not ( = ?auto_145832 ?auto_145833 ) ) ( ON ?auto_145831 ?auto_145832 ) ( CLEAR ?auto_145831 ) ( HOLDING ?auto_145830 ) ( CLEAR ?auto_145833 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145833 ?auto_145830 )
      ( MAKE-4PILE ?auto_145825 ?auto_145826 ?auto_145827 ?auto_145828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145834 - BLOCK
      ?auto_145835 - BLOCK
      ?auto_145836 - BLOCK
      ?auto_145837 - BLOCK
    )
    :vars
    (
      ?auto_145841 - BLOCK
      ?auto_145838 - BLOCK
      ?auto_145842 - BLOCK
      ?auto_145840 - BLOCK
      ?auto_145839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145841 ?auto_145837 ) ( ON-TABLE ?auto_145834 ) ( ON ?auto_145835 ?auto_145834 ) ( ON ?auto_145836 ?auto_145835 ) ( ON ?auto_145837 ?auto_145836 ) ( not ( = ?auto_145834 ?auto_145835 ) ) ( not ( = ?auto_145834 ?auto_145836 ) ) ( not ( = ?auto_145834 ?auto_145837 ) ) ( not ( = ?auto_145834 ?auto_145841 ) ) ( not ( = ?auto_145835 ?auto_145836 ) ) ( not ( = ?auto_145835 ?auto_145837 ) ) ( not ( = ?auto_145835 ?auto_145841 ) ) ( not ( = ?auto_145836 ?auto_145837 ) ) ( not ( = ?auto_145836 ?auto_145841 ) ) ( not ( = ?auto_145837 ?auto_145841 ) ) ( not ( = ?auto_145834 ?auto_145838 ) ) ( not ( = ?auto_145834 ?auto_145842 ) ) ( not ( = ?auto_145835 ?auto_145838 ) ) ( not ( = ?auto_145835 ?auto_145842 ) ) ( not ( = ?auto_145836 ?auto_145838 ) ) ( not ( = ?auto_145836 ?auto_145842 ) ) ( not ( = ?auto_145837 ?auto_145838 ) ) ( not ( = ?auto_145837 ?auto_145842 ) ) ( not ( = ?auto_145841 ?auto_145838 ) ) ( not ( = ?auto_145841 ?auto_145842 ) ) ( not ( = ?auto_145838 ?auto_145842 ) ) ( ON ?auto_145838 ?auto_145841 ) ( ON-TABLE ?auto_145840 ) ( not ( = ?auto_145840 ?auto_145839 ) ) ( not ( = ?auto_145840 ?auto_145842 ) ) ( not ( = ?auto_145839 ?auto_145842 ) ) ( not ( = ?auto_145834 ?auto_145839 ) ) ( not ( = ?auto_145834 ?auto_145840 ) ) ( not ( = ?auto_145835 ?auto_145839 ) ) ( not ( = ?auto_145835 ?auto_145840 ) ) ( not ( = ?auto_145836 ?auto_145839 ) ) ( not ( = ?auto_145836 ?auto_145840 ) ) ( not ( = ?auto_145837 ?auto_145839 ) ) ( not ( = ?auto_145837 ?auto_145840 ) ) ( not ( = ?auto_145841 ?auto_145839 ) ) ( not ( = ?auto_145841 ?auto_145840 ) ) ( not ( = ?auto_145838 ?auto_145839 ) ) ( not ( = ?auto_145838 ?auto_145840 ) ) ( ON ?auto_145842 ?auto_145838 ) ( CLEAR ?auto_145840 ) ( ON ?auto_145839 ?auto_145842 ) ( CLEAR ?auto_145839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145834 ?auto_145835 ?auto_145836 ?auto_145837 ?auto_145841 ?auto_145838 ?auto_145842 )
      ( MAKE-4PILE ?auto_145834 ?auto_145835 ?auto_145836 ?auto_145837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145843 - BLOCK
      ?auto_145844 - BLOCK
      ?auto_145845 - BLOCK
      ?auto_145846 - BLOCK
    )
    :vars
    (
      ?auto_145847 - BLOCK
      ?auto_145851 - BLOCK
      ?auto_145849 - BLOCK
      ?auto_145850 - BLOCK
      ?auto_145848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145847 ?auto_145846 ) ( ON-TABLE ?auto_145843 ) ( ON ?auto_145844 ?auto_145843 ) ( ON ?auto_145845 ?auto_145844 ) ( ON ?auto_145846 ?auto_145845 ) ( not ( = ?auto_145843 ?auto_145844 ) ) ( not ( = ?auto_145843 ?auto_145845 ) ) ( not ( = ?auto_145843 ?auto_145846 ) ) ( not ( = ?auto_145843 ?auto_145847 ) ) ( not ( = ?auto_145844 ?auto_145845 ) ) ( not ( = ?auto_145844 ?auto_145846 ) ) ( not ( = ?auto_145844 ?auto_145847 ) ) ( not ( = ?auto_145845 ?auto_145846 ) ) ( not ( = ?auto_145845 ?auto_145847 ) ) ( not ( = ?auto_145846 ?auto_145847 ) ) ( not ( = ?auto_145843 ?auto_145851 ) ) ( not ( = ?auto_145843 ?auto_145849 ) ) ( not ( = ?auto_145844 ?auto_145851 ) ) ( not ( = ?auto_145844 ?auto_145849 ) ) ( not ( = ?auto_145845 ?auto_145851 ) ) ( not ( = ?auto_145845 ?auto_145849 ) ) ( not ( = ?auto_145846 ?auto_145851 ) ) ( not ( = ?auto_145846 ?auto_145849 ) ) ( not ( = ?auto_145847 ?auto_145851 ) ) ( not ( = ?auto_145847 ?auto_145849 ) ) ( not ( = ?auto_145851 ?auto_145849 ) ) ( ON ?auto_145851 ?auto_145847 ) ( not ( = ?auto_145850 ?auto_145848 ) ) ( not ( = ?auto_145850 ?auto_145849 ) ) ( not ( = ?auto_145848 ?auto_145849 ) ) ( not ( = ?auto_145843 ?auto_145848 ) ) ( not ( = ?auto_145843 ?auto_145850 ) ) ( not ( = ?auto_145844 ?auto_145848 ) ) ( not ( = ?auto_145844 ?auto_145850 ) ) ( not ( = ?auto_145845 ?auto_145848 ) ) ( not ( = ?auto_145845 ?auto_145850 ) ) ( not ( = ?auto_145846 ?auto_145848 ) ) ( not ( = ?auto_145846 ?auto_145850 ) ) ( not ( = ?auto_145847 ?auto_145848 ) ) ( not ( = ?auto_145847 ?auto_145850 ) ) ( not ( = ?auto_145851 ?auto_145848 ) ) ( not ( = ?auto_145851 ?auto_145850 ) ) ( ON ?auto_145849 ?auto_145851 ) ( ON ?auto_145848 ?auto_145849 ) ( CLEAR ?auto_145848 ) ( HOLDING ?auto_145850 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145850 )
      ( MAKE-4PILE ?auto_145843 ?auto_145844 ?auto_145845 ?auto_145846 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_145852 - BLOCK
      ?auto_145853 - BLOCK
      ?auto_145854 - BLOCK
      ?auto_145855 - BLOCK
    )
    :vars
    (
      ?auto_145858 - BLOCK
      ?auto_145859 - BLOCK
      ?auto_145856 - BLOCK
      ?auto_145857 - BLOCK
      ?auto_145860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145858 ?auto_145855 ) ( ON-TABLE ?auto_145852 ) ( ON ?auto_145853 ?auto_145852 ) ( ON ?auto_145854 ?auto_145853 ) ( ON ?auto_145855 ?auto_145854 ) ( not ( = ?auto_145852 ?auto_145853 ) ) ( not ( = ?auto_145852 ?auto_145854 ) ) ( not ( = ?auto_145852 ?auto_145855 ) ) ( not ( = ?auto_145852 ?auto_145858 ) ) ( not ( = ?auto_145853 ?auto_145854 ) ) ( not ( = ?auto_145853 ?auto_145855 ) ) ( not ( = ?auto_145853 ?auto_145858 ) ) ( not ( = ?auto_145854 ?auto_145855 ) ) ( not ( = ?auto_145854 ?auto_145858 ) ) ( not ( = ?auto_145855 ?auto_145858 ) ) ( not ( = ?auto_145852 ?auto_145859 ) ) ( not ( = ?auto_145852 ?auto_145856 ) ) ( not ( = ?auto_145853 ?auto_145859 ) ) ( not ( = ?auto_145853 ?auto_145856 ) ) ( not ( = ?auto_145854 ?auto_145859 ) ) ( not ( = ?auto_145854 ?auto_145856 ) ) ( not ( = ?auto_145855 ?auto_145859 ) ) ( not ( = ?auto_145855 ?auto_145856 ) ) ( not ( = ?auto_145858 ?auto_145859 ) ) ( not ( = ?auto_145858 ?auto_145856 ) ) ( not ( = ?auto_145859 ?auto_145856 ) ) ( ON ?auto_145859 ?auto_145858 ) ( not ( = ?auto_145857 ?auto_145860 ) ) ( not ( = ?auto_145857 ?auto_145856 ) ) ( not ( = ?auto_145860 ?auto_145856 ) ) ( not ( = ?auto_145852 ?auto_145860 ) ) ( not ( = ?auto_145852 ?auto_145857 ) ) ( not ( = ?auto_145853 ?auto_145860 ) ) ( not ( = ?auto_145853 ?auto_145857 ) ) ( not ( = ?auto_145854 ?auto_145860 ) ) ( not ( = ?auto_145854 ?auto_145857 ) ) ( not ( = ?auto_145855 ?auto_145860 ) ) ( not ( = ?auto_145855 ?auto_145857 ) ) ( not ( = ?auto_145858 ?auto_145860 ) ) ( not ( = ?auto_145858 ?auto_145857 ) ) ( not ( = ?auto_145859 ?auto_145860 ) ) ( not ( = ?auto_145859 ?auto_145857 ) ) ( ON ?auto_145856 ?auto_145859 ) ( ON ?auto_145860 ?auto_145856 ) ( ON ?auto_145857 ?auto_145860 ) ( CLEAR ?auto_145857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145852 ?auto_145853 ?auto_145854 ?auto_145855 ?auto_145858 ?auto_145859 ?auto_145856 ?auto_145860 )
      ( MAKE-4PILE ?auto_145852 ?auto_145853 ?auto_145854 ?auto_145855 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145866 - BLOCK
      ?auto_145867 - BLOCK
      ?auto_145868 - BLOCK
      ?auto_145869 - BLOCK
      ?auto_145870 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_145870 ) ( CLEAR ?auto_145869 ) ( ON-TABLE ?auto_145866 ) ( ON ?auto_145867 ?auto_145866 ) ( ON ?auto_145868 ?auto_145867 ) ( ON ?auto_145869 ?auto_145868 ) ( not ( = ?auto_145866 ?auto_145867 ) ) ( not ( = ?auto_145866 ?auto_145868 ) ) ( not ( = ?auto_145866 ?auto_145869 ) ) ( not ( = ?auto_145866 ?auto_145870 ) ) ( not ( = ?auto_145867 ?auto_145868 ) ) ( not ( = ?auto_145867 ?auto_145869 ) ) ( not ( = ?auto_145867 ?auto_145870 ) ) ( not ( = ?auto_145868 ?auto_145869 ) ) ( not ( = ?auto_145868 ?auto_145870 ) ) ( not ( = ?auto_145869 ?auto_145870 ) ) )
    :subtasks
    ( ( !STACK ?auto_145870 ?auto_145869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145871 - BLOCK
      ?auto_145872 - BLOCK
      ?auto_145873 - BLOCK
      ?auto_145874 - BLOCK
      ?auto_145875 - BLOCK
    )
    :vars
    (
      ?auto_145876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_145874 ) ( ON-TABLE ?auto_145871 ) ( ON ?auto_145872 ?auto_145871 ) ( ON ?auto_145873 ?auto_145872 ) ( ON ?auto_145874 ?auto_145873 ) ( not ( = ?auto_145871 ?auto_145872 ) ) ( not ( = ?auto_145871 ?auto_145873 ) ) ( not ( = ?auto_145871 ?auto_145874 ) ) ( not ( = ?auto_145871 ?auto_145875 ) ) ( not ( = ?auto_145872 ?auto_145873 ) ) ( not ( = ?auto_145872 ?auto_145874 ) ) ( not ( = ?auto_145872 ?auto_145875 ) ) ( not ( = ?auto_145873 ?auto_145874 ) ) ( not ( = ?auto_145873 ?auto_145875 ) ) ( not ( = ?auto_145874 ?auto_145875 ) ) ( ON ?auto_145875 ?auto_145876 ) ( CLEAR ?auto_145875 ) ( HAND-EMPTY ) ( not ( = ?auto_145871 ?auto_145876 ) ) ( not ( = ?auto_145872 ?auto_145876 ) ) ( not ( = ?auto_145873 ?auto_145876 ) ) ( not ( = ?auto_145874 ?auto_145876 ) ) ( not ( = ?auto_145875 ?auto_145876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145875 ?auto_145876 )
      ( MAKE-5PILE ?auto_145871 ?auto_145872 ?auto_145873 ?auto_145874 ?auto_145875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145877 - BLOCK
      ?auto_145878 - BLOCK
      ?auto_145879 - BLOCK
      ?auto_145880 - BLOCK
      ?auto_145881 - BLOCK
    )
    :vars
    (
      ?auto_145882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145877 ) ( ON ?auto_145878 ?auto_145877 ) ( ON ?auto_145879 ?auto_145878 ) ( not ( = ?auto_145877 ?auto_145878 ) ) ( not ( = ?auto_145877 ?auto_145879 ) ) ( not ( = ?auto_145877 ?auto_145880 ) ) ( not ( = ?auto_145877 ?auto_145881 ) ) ( not ( = ?auto_145878 ?auto_145879 ) ) ( not ( = ?auto_145878 ?auto_145880 ) ) ( not ( = ?auto_145878 ?auto_145881 ) ) ( not ( = ?auto_145879 ?auto_145880 ) ) ( not ( = ?auto_145879 ?auto_145881 ) ) ( not ( = ?auto_145880 ?auto_145881 ) ) ( ON ?auto_145881 ?auto_145882 ) ( CLEAR ?auto_145881 ) ( not ( = ?auto_145877 ?auto_145882 ) ) ( not ( = ?auto_145878 ?auto_145882 ) ) ( not ( = ?auto_145879 ?auto_145882 ) ) ( not ( = ?auto_145880 ?auto_145882 ) ) ( not ( = ?auto_145881 ?auto_145882 ) ) ( HOLDING ?auto_145880 ) ( CLEAR ?auto_145879 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145877 ?auto_145878 ?auto_145879 ?auto_145880 )
      ( MAKE-5PILE ?auto_145877 ?auto_145878 ?auto_145879 ?auto_145880 ?auto_145881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145883 - BLOCK
      ?auto_145884 - BLOCK
      ?auto_145885 - BLOCK
      ?auto_145886 - BLOCK
      ?auto_145887 - BLOCK
    )
    :vars
    (
      ?auto_145888 - BLOCK
      ?auto_145891 - BLOCK
      ?auto_145889 - BLOCK
      ?auto_145890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145883 ) ( ON ?auto_145884 ?auto_145883 ) ( ON ?auto_145885 ?auto_145884 ) ( not ( = ?auto_145883 ?auto_145884 ) ) ( not ( = ?auto_145883 ?auto_145885 ) ) ( not ( = ?auto_145883 ?auto_145886 ) ) ( not ( = ?auto_145883 ?auto_145887 ) ) ( not ( = ?auto_145884 ?auto_145885 ) ) ( not ( = ?auto_145884 ?auto_145886 ) ) ( not ( = ?auto_145884 ?auto_145887 ) ) ( not ( = ?auto_145885 ?auto_145886 ) ) ( not ( = ?auto_145885 ?auto_145887 ) ) ( not ( = ?auto_145886 ?auto_145887 ) ) ( ON ?auto_145887 ?auto_145888 ) ( not ( = ?auto_145883 ?auto_145888 ) ) ( not ( = ?auto_145884 ?auto_145888 ) ) ( not ( = ?auto_145885 ?auto_145888 ) ) ( not ( = ?auto_145886 ?auto_145888 ) ) ( not ( = ?auto_145887 ?auto_145888 ) ) ( CLEAR ?auto_145885 ) ( ON ?auto_145886 ?auto_145887 ) ( CLEAR ?auto_145886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145891 ) ( ON ?auto_145889 ?auto_145891 ) ( ON ?auto_145890 ?auto_145889 ) ( ON ?auto_145888 ?auto_145890 ) ( not ( = ?auto_145891 ?auto_145889 ) ) ( not ( = ?auto_145891 ?auto_145890 ) ) ( not ( = ?auto_145891 ?auto_145888 ) ) ( not ( = ?auto_145891 ?auto_145887 ) ) ( not ( = ?auto_145891 ?auto_145886 ) ) ( not ( = ?auto_145889 ?auto_145890 ) ) ( not ( = ?auto_145889 ?auto_145888 ) ) ( not ( = ?auto_145889 ?auto_145887 ) ) ( not ( = ?auto_145889 ?auto_145886 ) ) ( not ( = ?auto_145890 ?auto_145888 ) ) ( not ( = ?auto_145890 ?auto_145887 ) ) ( not ( = ?auto_145890 ?auto_145886 ) ) ( not ( = ?auto_145883 ?auto_145891 ) ) ( not ( = ?auto_145883 ?auto_145889 ) ) ( not ( = ?auto_145883 ?auto_145890 ) ) ( not ( = ?auto_145884 ?auto_145891 ) ) ( not ( = ?auto_145884 ?auto_145889 ) ) ( not ( = ?auto_145884 ?auto_145890 ) ) ( not ( = ?auto_145885 ?auto_145891 ) ) ( not ( = ?auto_145885 ?auto_145889 ) ) ( not ( = ?auto_145885 ?auto_145890 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145891 ?auto_145889 ?auto_145890 ?auto_145888 ?auto_145887 )
      ( MAKE-5PILE ?auto_145883 ?auto_145884 ?auto_145885 ?auto_145886 ?auto_145887 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145892 - BLOCK
      ?auto_145893 - BLOCK
      ?auto_145894 - BLOCK
      ?auto_145895 - BLOCK
      ?auto_145896 - BLOCK
    )
    :vars
    (
      ?auto_145899 - BLOCK
      ?auto_145898 - BLOCK
      ?auto_145900 - BLOCK
      ?auto_145897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145892 ) ( ON ?auto_145893 ?auto_145892 ) ( not ( = ?auto_145892 ?auto_145893 ) ) ( not ( = ?auto_145892 ?auto_145894 ) ) ( not ( = ?auto_145892 ?auto_145895 ) ) ( not ( = ?auto_145892 ?auto_145896 ) ) ( not ( = ?auto_145893 ?auto_145894 ) ) ( not ( = ?auto_145893 ?auto_145895 ) ) ( not ( = ?auto_145893 ?auto_145896 ) ) ( not ( = ?auto_145894 ?auto_145895 ) ) ( not ( = ?auto_145894 ?auto_145896 ) ) ( not ( = ?auto_145895 ?auto_145896 ) ) ( ON ?auto_145896 ?auto_145899 ) ( not ( = ?auto_145892 ?auto_145899 ) ) ( not ( = ?auto_145893 ?auto_145899 ) ) ( not ( = ?auto_145894 ?auto_145899 ) ) ( not ( = ?auto_145895 ?auto_145899 ) ) ( not ( = ?auto_145896 ?auto_145899 ) ) ( ON ?auto_145895 ?auto_145896 ) ( CLEAR ?auto_145895 ) ( ON-TABLE ?auto_145898 ) ( ON ?auto_145900 ?auto_145898 ) ( ON ?auto_145897 ?auto_145900 ) ( ON ?auto_145899 ?auto_145897 ) ( not ( = ?auto_145898 ?auto_145900 ) ) ( not ( = ?auto_145898 ?auto_145897 ) ) ( not ( = ?auto_145898 ?auto_145899 ) ) ( not ( = ?auto_145898 ?auto_145896 ) ) ( not ( = ?auto_145898 ?auto_145895 ) ) ( not ( = ?auto_145900 ?auto_145897 ) ) ( not ( = ?auto_145900 ?auto_145899 ) ) ( not ( = ?auto_145900 ?auto_145896 ) ) ( not ( = ?auto_145900 ?auto_145895 ) ) ( not ( = ?auto_145897 ?auto_145899 ) ) ( not ( = ?auto_145897 ?auto_145896 ) ) ( not ( = ?auto_145897 ?auto_145895 ) ) ( not ( = ?auto_145892 ?auto_145898 ) ) ( not ( = ?auto_145892 ?auto_145900 ) ) ( not ( = ?auto_145892 ?auto_145897 ) ) ( not ( = ?auto_145893 ?auto_145898 ) ) ( not ( = ?auto_145893 ?auto_145900 ) ) ( not ( = ?auto_145893 ?auto_145897 ) ) ( not ( = ?auto_145894 ?auto_145898 ) ) ( not ( = ?auto_145894 ?auto_145900 ) ) ( not ( = ?auto_145894 ?auto_145897 ) ) ( HOLDING ?auto_145894 ) ( CLEAR ?auto_145893 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145892 ?auto_145893 ?auto_145894 )
      ( MAKE-5PILE ?auto_145892 ?auto_145893 ?auto_145894 ?auto_145895 ?auto_145896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145901 - BLOCK
      ?auto_145902 - BLOCK
      ?auto_145903 - BLOCK
      ?auto_145904 - BLOCK
      ?auto_145905 - BLOCK
    )
    :vars
    (
      ?auto_145907 - BLOCK
      ?auto_145906 - BLOCK
      ?auto_145908 - BLOCK
      ?auto_145909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145901 ) ( ON ?auto_145902 ?auto_145901 ) ( not ( = ?auto_145901 ?auto_145902 ) ) ( not ( = ?auto_145901 ?auto_145903 ) ) ( not ( = ?auto_145901 ?auto_145904 ) ) ( not ( = ?auto_145901 ?auto_145905 ) ) ( not ( = ?auto_145902 ?auto_145903 ) ) ( not ( = ?auto_145902 ?auto_145904 ) ) ( not ( = ?auto_145902 ?auto_145905 ) ) ( not ( = ?auto_145903 ?auto_145904 ) ) ( not ( = ?auto_145903 ?auto_145905 ) ) ( not ( = ?auto_145904 ?auto_145905 ) ) ( ON ?auto_145905 ?auto_145907 ) ( not ( = ?auto_145901 ?auto_145907 ) ) ( not ( = ?auto_145902 ?auto_145907 ) ) ( not ( = ?auto_145903 ?auto_145907 ) ) ( not ( = ?auto_145904 ?auto_145907 ) ) ( not ( = ?auto_145905 ?auto_145907 ) ) ( ON ?auto_145904 ?auto_145905 ) ( ON-TABLE ?auto_145906 ) ( ON ?auto_145908 ?auto_145906 ) ( ON ?auto_145909 ?auto_145908 ) ( ON ?auto_145907 ?auto_145909 ) ( not ( = ?auto_145906 ?auto_145908 ) ) ( not ( = ?auto_145906 ?auto_145909 ) ) ( not ( = ?auto_145906 ?auto_145907 ) ) ( not ( = ?auto_145906 ?auto_145905 ) ) ( not ( = ?auto_145906 ?auto_145904 ) ) ( not ( = ?auto_145908 ?auto_145909 ) ) ( not ( = ?auto_145908 ?auto_145907 ) ) ( not ( = ?auto_145908 ?auto_145905 ) ) ( not ( = ?auto_145908 ?auto_145904 ) ) ( not ( = ?auto_145909 ?auto_145907 ) ) ( not ( = ?auto_145909 ?auto_145905 ) ) ( not ( = ?auto_145909 ?auto_145904 ) ) ( not ( = ?auto_145901 ?auto_145906 ) ) ( not ( = ?auto_145901 ?auto_145908 ) ) ( not ( = ?auto_145901 ?auto_145909 ) ) ( not ( = ?auto_145902 ?auto_145906 ) ) ( not ( = ?auto_145902 ?auto_145908 ) ) ( not ( = ?auto_145902 ?auto_145909 ) ) ( not ( = ?auto_145903 ?auto_145906 ) ) ( not ( = ?auto_145903 ?auto_145908 ) ) ( not ( = ?auto_145903 ?auto_145909 ) ) ( CLEAR ?auto_145902 ) ( ON ?auto_145903 ?auto_145904 ) ( CLEAR ?auto_145903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145906 ?auto_145908 ?auto_145909 ?auto_145907 ?auto_145905 ?auto_145904 )
      ( MAKE-5PILE ?auto_145901 ?auto_145902 ?auto_145903 ?auto_145904 ?auto_145905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145910 - BLOCK
      ?auto_145911 - BLOCK
      ?auto_145912 - BLOCK
      ?auto_145913 - BLOCK
      ?auto_145914 - BLOCK
    )
    :vars
    (
      ?auto_145915 - BLOCK
      ?auto_145917 - BLOCK
      ?auto_145918 - BLOCK
      ?auto_145916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145910 ) ( not ( = ?auto_145910 ?auto_145911 ) ) ( not ( = ?auto_145910 ?auto_145912 ) ) ( not ( = ?auto_145910 ?auto_145913 ) ) ( not ( = ?auto_145910 ?auto_145914 ) ) ( not ( = ?auto_145911 ?auto_145912 ) ) ( not ( = ?auto_145911 ?auto_145913 ) ) ( not ( = ?auto_145911 ?auto_145914 ) ) ( not ( = ?auto_145912 ?auto_145913 ) ) ( not ( = ?auto_145912 ?auto_145914 ) ) ( not ( = ?auto_145913 ?auto_145914 ) ) ( ON ?auto_145914 ?auto_145915 ) ( not ( = ?auto_145910 ?auto_145915 ) ) ( not ( = ?auto_145911 ?auto_145915 ) ) ( not ( = ?auto_145912 ?auto_145915 ) ) ( not ( = ?auto_145913 ?auto_145915 ) ) ( not ( = ?auto_145914 ?auto_145915 ) ) ( ON ?auto_145913 ?auto_145914 ) ( ON-TABLE ?auto_145917 ) ( ON ?auto_145918 ?auto_145917 ) ( ON ?auto_145916 ?auto_145918 ) ( ON ?auto_145915 ?auto_145916 ) ( not ( = ?auto_145917 ?auto_145918 ) ) ( not ( = ?auto_145917 ?auto_145916 ) ) ( not ( = ?auto_145917 ?auto_145915 ) ) ( not ( = ?auto_145917 ?auto_145914 ) ) ( not ( = ?auto_145917 ?auto_145913 ) ) ( not ( = ?auto_145918 ?auto_145916 ) ) ( not ( = ?auto_145918 ?auto_145915 ) ) ( not ( = ?auto_145918 ?auto_145914 ) ) ( not ( = ?auto_145918 ?auto_145913 ) ) ( not ( = ?auto_145916 ?auto_145915 ) ) ( not ( = ?auto_145916 ?auto_145914 ) ) ( not ( = ?auto_145916 ?auto_145913 ) ) ( not ( = ?auto_145910 ?auto_145917 ) ) ( not ( = ?auto_145910 ?auto_145918 ) ) ( not ( = ?auto_145910 ?auto_145916 ) ) ( not ( = ?auto_145911 ?auto_145917 ) ) ( not ( = ?auto_145911 ?auto_145918 ) ) ( not ( = ?auto_145911 ?auto_145916 ) ) ( not ( = ?auto_145912 ?auto_145917 ) ) ( not ( = ?auto_145912 ?auto_145918 ) ) ( not ( = ?auto_145912 ?auto_145916 ) ) ( ON ?auto_145912 ?auto_145913 ) ( CLEAR ?auto_145912 ) ( HOLDING ?auto_145911 ) ( CLEAR ?auto_145910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_145910 ?auto_145911 )
      ( MAKE-5PILE ?auto_145910 ?auto_145911 ?auto_145912 ?auto_145913 ?auto_145914 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145919 - BLOCK
      ?auto_145920 - BLOCK
      ?auto_145921 - BLOCK
      ?auto_145922 - BLOCK
      ?auto_145923 - BLOCK
    )
    :vars
    (
      ?auto_145925 - BLOCK
      ?auto_145926 - BLOCK
      ?auto_145924 - BLOCK
      ?auto_145927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_145919 ) ( not ( = ?auto_145919 ?auto_145920 ) ) ( not ( = ?auto_145919 ?auto_145921 ) ) ( not ( = ?auto_145919 ?auto_145922 ) ) ( not ( = ?auto_145919 ?auto_145923 ) ) ( not ( = ?auto_145920 ?auto_145921 ) ) ( not ( = ?auto_145920 ?auto_145922 ) ) ( not ( = ?auto_145920 ?auto_145923 ) ) ( not ( = ?auto_145921 ?auto_145922 ) ) ( not ( = ?auto_145921 ?auto_145923 ) ) ( not ( = ?auto_145922 ?auto_145923 ) ) ( ON ?auto_145923 ?auto_145925 ) ( not ( = ?auto_145919 ?auto_145925 ) ) ( not ( = ?auto_145920 ?auto_145925 ) ) ( not ( = ?auto_145921 ?auto_145925 ) ) ( not ( = ?auto_145922 ?auto_145925 ) ) ( not ( = ?auto_145923 ?auto_145925 ) ) ( ON ?auto_145922 ?auto_145923 ) ( ON-TABLE ?auto_145926 ) ( ON ?auto_145924 ?auto_145926 ) ( ON ?auto_145927 ?auto_145924 ) ( ON ?auto_145925 ?auto_145927 ) ( not ( = ?auto_145926 ?auto_145924 ) ) ( not ( = ?auto_145926 ?auto_145927 ) ) ( not ( = ?auto_145926 ?auto_145925 ) ) ( not ( = ?auto_145926 ?auto_145923 ) ) ( not ( = ?auto_145926 ?auto_145922 ) ) ( not ( = ?auto_145924 ?auto_145927 ) ) ( not ( = ?auto_145924 ?auto_145925 ) ) ( not ( = ?auto_145924 ?auto_145923 ) ) ( not ( = ?auto_145924 ?auto_145922 ) ) ( not ( = ?auto_145927 ?auto_145925 ) ) ( not ( = ?auto_145927 ?auto_145923 ) ) ( not ( = ?auto_145927 ?auto_145922 ) ) ( not ( = ?auto_145919 ?auto_145926 ) ) ( not ( = ?auto_145919 ?auto_145924 ) ) ( not ( = ?auto_145919 ?auto_145927 ) ) ( not ( = ?auto_145920 ?auto_145926 ) ) ( not ( = ?auto_145920 ?auto_145924 ) ) ( not ( = ?auto_145920 ?auto_145927 ) ) ( not ( = ?auto_145921 ?auto_145926 ) ) ( not ( = ?auto_145921 ?auto_145924 ) ) ( not ( = ?auto_145921 ?auto_145927 ) ) ( ON ?auto_145921 ?auto_145922 ) ( CLEAR ?auto_145919 ) ( ON ?auto_145920 ?auto_145921 ) ( CLEAR ?auto_145920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_145926 ?auto_145924 ?auto_145927 ?auto_145925 ?auto_145923 ?auto_145922 ?auto_145921 )
      ( MAKE-5PILE ?auto_145919 ?auto_145920 ?auto_145921 ?auto_145922 ?auto_145923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145928 - BLOCK
      ?auto_145929 - BLOCK
      ?auto_145930 - BLOCK
      ?auto_145931 - BLOCK
      ?auto_145932 - BLOCK
    )
    :vars
    (
      ?auto_145934 - BLOCK
      ?auto_145936 - BLOCK
      ?auto_145935 - BLOCK
      ?auto_145933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145928 ?auto_145929 ) ) ( not ( = ?auto_145928 ?auto_145930 ) ) ( not ( = ?auto_145928 ?auto_145931 ) ) ( not ( = ?auto_145928 ?auto_145932 ) ) ( not ( = ?auto_145929 ?auto_145930 ) ) ( not ( = ?auto_145929 ?auto_145931 ) ) ( not ( = ?auto_145929 ?auto_145932 ) ) ( not ( = ?auto_145930 ?auto_145931 ) ) ( not ( = ?auto_145930 ?auto_145932 ) ) ( not ( = ?auto_145931 ?auto_145932 ) ) ( ON ?auto_145932 ?auto_145934 ) ( not ( = ?auto_145928 ?auto_145934 ) ) ( not ( = ?auto_145929 ?auto_145934 ) ) ( not ( = ?auto_145930 ?auto_145934 ) ) ( not ( = ?auto_145931 ?auto_145934 ) ) ( not ( = ?auto_145932 ?auto_145934 ) ) ( ON ?auto_145931 ?auto_145932 ) ( ON-TABLE ?auto_145936 ) ( ON ?auto_145935 ?auto_145936 ) ( ON ?auto_145933 ?auto_145935 ) ( ON ?auto_145934 ?auto_145933 ) ( not ( = ?auto_145936 ?auto_145935 ) ) ( not ( = ?auto_145936 ?auto_145933 ) ) ( not ( = ?auto_145936 ?auto_145934 ) ) ( not ( = ?auto_145936 ?auto_145932 ) ) ( not ( = ?auto_145936 ?auto_145931 ) ) ( not ( = ?auto_145935 ?auto_145933 ) ) ( not ( = ?auto_145935 ?auto_145934 ) ) ( not ( = ?auto_145935 ?auto_145932 ) ) ( not ( = ?auto_145935 ?auto_145931 ) ) ( not ( = ?auto_145933 ?auto_145934 ) ) ( not ( = ?auto_145933 ?auto_145932 ) ) ( not ( = ?auto_145933 ?auto_145931 ) ) ( not ( = ?auto_145928 ?auto_145936 ) ) ( not ( = ?auto_145928 ?auto_145935 ) ) ( not ( = ?auto_145928 ?auto_145933 ) ) ( not ( = ?auto_145929 ?auto_145936 ) ) ( not ( = ?auto_145929 ?auto_145935 ) ) ( not ( = ?auto_145929 ?auto_145933 ) ) ( not ( = ?auto_145930 ?auto_145936 ) ) ( not ( = ?auto_145930 ?auto_145935 ) ) ( not ( = ?auto_145930 ?auto_145933 ) ) ( ON ?auto_145930 ?auto_145931 ) ( ON ?auto_145929 ?auto_145930 ) ( CLEAR ?auto_145929 ) ( HOLDING ?auto_145928 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_145928 )
      ( MAKE-5PILE ?auto_145928 ?auto_145929 ?auto_145930 ?auto_145931 ?auto_145932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_145937 - BLOCK
      ?auto_145938 - BLOCK
      ?auto_145939 - BLOCK
      ?auto_145940 - BLOCK
      ?auto_145941 - BLOCK
    )
    :vars
    (
      ?auto_145943 - BLOCK
      ?auto_145944 - BLOCK
      ?auto_145942 - BLOCK
      ?auto_145945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_145937 ?auto_145938 ) ) ( not ( = ?auto_145937 ?auto_145939 ) ) ( not ( = ?auto_145937 ?auto_145940 ) ) ( not ( = ?auto_145937 ?auto_145941 ) ) ( not ( = ?auto_145938 ?auto_145939 ) ) ( not ( = ?auto_145938 ?auto_145940 ) ) ( not ( = ?auto_145938 ?auto_145941 ) ) ( not ( = ?auto_145939 ?auto_145940 ) ) ( not ( = ?auto_145939 ?auto_145941 ) ) ( not ( = ?auto_145940 ?auto_145941 ) ) ( ON ?auto_145941 ?auto_145943 ) ( not ( = ?auto_145937 ?auto_145943 ) ) ( not ( = ?auto_145938 ?auto_145943 ) ) ( not ( = ?auto_145939 ?auto_145943 ) ) ( not ( = ?auto_145940 ?auto_145943 ) ) ( not ( = ?auto_145941 ?auto_145943 ) ) ( ON ?auto_145940 ?auto_145941 ) ( ON-TABLE ?auto_145944 ) ( ON ?auto_145942 ?auto_145944 ) ( ON ?auto_145945 ?auto_145942 ) ( ON ?auto_145943 ?auto_145945 ) ( not ( = ?auto_145944 ?auto_145942 ) ) ( not ( = ?auto_145944 ?auto_145945 ) ) ( not ( = ?auto_145944 ?auto_145943 ) ) ( not ( = ?auto_145944 ?auto_145941 ) ) ( not ( = ?auto_145944 ?auto_145940 ) ) ( not ( = ?auto_145942 ?auto_145945 ) ) ( not ( = ?auto_145942 ?auto_145943 ) ) ( not ( = ?auto_145942 ?auto_145941 ) ) ( not ( = ?auto_145942 ?auto_145940 ) ) ( not ( = ?auto_145945 ?auto_145943 ) ) ( not ( = ?auto_145945 ?auto_145941 ) ) ( not ( = ?auto_145945 ?auto_145940 ) ) ( not ( = ?auto_145937 ?auto_145944 ) ) ( not ( = ?auto_145937 ?auto_145942 ) ) ( not ( = ?auto_145937 ?auto_145945 ) ) ( not ( = ?auto_145938 ?auto_145944 ) ) ( not ( = ?auto_145938 ?auto_145942 ) ) ( not ( = ?auto_145938 ?auto_145945 ) ) ( not ( = ?auto_145939 ?auto_145944 ) ) ( not ( = ?auto_145939 ?auto_145942 ) ) ( not ( = ?auto_145939 ?auto_145945 ) ) ( ON ?auto_145939 ?auto_145940 ) ( ON ?auto_145938 ?auto_145939 ) ( ON ?auto_145937 ?auto_145938 ) ( CLEAR ?auto_145937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_145944 ?auto_145942 ?auto_145945 ?auto_145943 ?auto_145941 ?auto_145940 ?auto_145939 ?auto_145938 )
      ( MAKE-5PILE ?auto_145937 ?auto_145938 ?auto_145939 ?auto_145940 ?auto_145941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145949 - BLOCK
      ?auto_145950 - BLOCK
      ?auto_145951 - BLOCK
    )
    :vars
    (
      ?auto_145952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145952 ?auto_145951 ) ( CLEAR ?auto_145952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_145949 ) ( ON ?auto_145950 ?auto_145949 ) ( ON ?auto_145951 ?auto_145950 ) ( not ( = ?auto_145949 ?auto_145950 ) ) ( not ( = ?auto_145949 ?auto_145951 ) ) ( not ( = ?auto_145949 ?auto_145952 ) ) ( not ( = ?auto_145950 ?auto_145951 ) ) ( not ( = ?auto_145950 ?auto_145952 ) ) ( not ( = ?auto_145951 ?auto_145952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_145952 ?auto_145951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145953 - BLOCK
      ?auto_145954 - BLOCK
      ?auto_145955 - BLOCK
    )
    :vars
    (
      ?auto_145956 - BLOCK
      ?auto_145957 - BLOCK
      ?auto_145958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145956 ?auto_145955 ) ( CLEAR ?auto_145956 ) ( ON-TABLE ?auto_145953 ) ( ON ?auto_145954 ?auto_145953 ) ( ON ?auto_145955 ?auto_145954 ) ( not ( = ?auto_145953 ?auto_145954 ) ) ( not ( = ?auto_145953 ?auto_145955 ) ) ( not ( = ?auto_145953 ?auto_145956 ) ) ( not ( = ?auto_145954 ?auto_145955 ) ) ( not ( = ?auto_145954 ?auto_145956 ) ) ( not ( = ?auto_145955 ?auto_145956 ) ) ( HOLDING ?auto_145957 ) ( CLEAR ?auto_145958 ) ( not ( = ?auto_145953 ?auto_145957 ) ) ( not ( = ?auto_145953 ?auto_145958 ) ) ( not ( = ?auto_145954 ?auto_145957 ) ) ( not ( = ?auto_145954 ?auto_145958 ) ) ( not ( = ?auto_145955 ?auto_145957 ) ) ( not ( = ?auto_145955 ?auto_145958 ) ) ( not ( = ?auto_145956 ?auto_145957 ) ) ( not ( = ?auto_145956 ?auto_145958 ) ) ( not ( = ?auto_145957 ?auto_145958 ) ) )
    :subtasks
    ( ( !STACK ?auto_145957 ?auto_145958 )
      ( MAKE-3PILE ?auto_145953 ?auto_145954 ?auto_145955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145959 - BLOCK
      ?auto_145960 - BLOCK
      ?auto_145961 - BLOCK
    )
    :vars
    (
      ?auto_145963 - BLOCK
      ?auto_145964 - BLOCK
      ?auto_145962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145963 ?auto_145961 ) ( ON-TABLE ?auto_145959 ) ( ON ?auto_145960 ?auto_145959 ) ( ON ?auto_145961 ?auto_145960 ) ( not ( = ?auto_145959 ?auto_145960 ) ) ( not ( = ?auto_145959 ?auto_145961 ) ) ( not ( = ?auto_145959 ?auto_145963 ) ) ( not ( = ?auto_145960 ?auto_145961 ) ) ( not ( = ?auto_145960 ?auto_145963 ) ) ( not ( = ?auto_145961 ?auto_145963 ) ) ( CLEAR ?auto_145964 ) ( not ( = ?auto_145959 ?auto_145962 ) ) ( not ( = ?auto_145959 ?auto_145964 ) ) ( not ( = ?auto_145960 ?auto_145962 ) ) ( not ( = ?auto_145960 ?auto_145964 ) ) ( not ( = ?auto_145961 ?auto_145962 ) ) ( not ( = ?auto_145961 ?auto_145964 ) ) ( not ( = ?auto_145963 ?auto_145962 ) ) ( not ( = ?auto_145963 ?auto_145964 ) ) ( not ( = ?auto_145962 ?auto_145964 ) ) ( ON ?auto_145962 ?auto_145963 ) ( CLEAR ?auto_145962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145959 ?auto_145960 ?auto_145961 ?auto_145963 )
      ( MAKE-3PILE ?auto_145959 ?auto_145960 ?auto_145961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145965 - BLOCK
      ?auto_145966 - BLOCK
      ?auto_145967 - BLOCK
    )
    :vars
    (
      ?auto_145969 - BLOCK
      ?auto_145970 - BLOCK
      ?auto_145968 - BLOCK
      ?auto_145973 - BLOCK
      ?auto_145971 - BLOCK
      ?auto_145972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145969 ?auto_145967 ) ( ON-TABLE ?auto_145965 ) ( ON ?auto_145966 ?auto_145965 ) ( ON ?auto_145967 ?auto_145966 ) ( not ( = ?auto_145965 ?auto_145966 ) ) ( not ( = ?auto_145965 ?auto_145967 ) ) ( not ( = ?auto_145965 ?auto_145969 ) ) ( not ( = ?auto_145966 ?auto_145967 ) ) ( not ( = ?auto_145966 ?auto_145969 ) ) ( not ( = ?auto_145967 ?auto_145969 ) ) ( not ( = ?auto_145965 ?auto_145970 ) ) ( not ( = ?auto_145965 ?auto_145968 ) ) ( not ( = ?auto_145966 ?auto_145970 ) ) ( not ( = ?auto_145966 ?auto_145968 ) ) ( not ( = ?auto_145967 ?auto_145970 ) ) ( not ( = ?auto_145967 ?auto_145968 ) ) ( not ( = ?auto_145969 ?auto_145970 ) ) ( not ( = ?auto_145969 ?auto_145968 ) ) ( not ( = ?auto_145970 ?auto_145968 ) ) ( ON ?auto_145970 ?auto_145969 ) ( CLEAR ?auto_145970 ) ( HOLDING ?auto_145968 ) ( CLEAR ?auto_145973 ) ( ON-TABLE ?auto_145971 ) ( ON ?auto_145972 ?auto_145971 ) ( ON ?auto_145973 ?auto_145972 ) ( not ( = ?auto_145971 ?auto_145972 ) ) ( not ( = ?auto_145971 ?auto_145973 ) ) ( not ( = ?auto_145971 ?auto_145968 ) ) ( not ( = ?auto_145972 ?auto_145973 ) ) ( not ( = ?auto_145972 ?auto_145968 ) ) ( not ( = ?auto_145973 ?auto_145968 ) ) ( not ( = ?auto_145965 ?auto_145973 ) ) ( not ( = ?auto_145965 ?auto_145971 ) ) ( not ( = ?auto_145965 ?auto_145972 ) ) ( not ( = ?auto_145966 ?auto_145973 ) ) ( not ( = ?auto_145966 ?auto_145971 ) ) ( not ( = ?auto_145966 ?auto_145972 ) ) ( not ( = ?auto_145967 ?auto_145973 ) ) ( not ( = ?auto_145967 ?auto_145971 ) ) ( not ( = ?auto_145967 ?auto_145972 ) ) ( not ( = ?auto_145969 ?auto_145973 ) ) ( not ( = ?auto_145969 ?auto_145971 ) ) ( not ( = ?auto_145969 ?auto_145972 ) ) ( not ( = ?auto_145970 ?auto_145973 ) ) ( not ( = ?auto_145970 ?auto_145971 ) ) ( not ( = ?auto_145970 ?auto_145972 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_145971 ?auto_145972 ?auto_145973 ?auto_145968 )
      ( MAKE-3PILE ?auto_145965 ?auto_145966 ?auto_145967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145974 - BLOCK
      ?auto_145975 - BLOCK
      ?auto_145976 - BLOCK
    )
    :vars
    (
      ?auto_145977 - BLOCK
      ?auto_145979 - BLOCK
      ?auto_145980 - BLOCK
      ?auto_145982 - BLOCK
      ?auto_145981 - BLOCK
      ?auto_145978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145977 ?auto_145976 ) ( ON-TABLE ?auto_145974 ) ( ON ?auto_145975 ?auto_145974 ) ( ON ?auto_145976 ?auto_145975 ) ( not ( = ?auto_145974 ?auto_145975 ) ) ( not ( = ?auto_145974 ?auto_145976 ) ) ( not ( = ?auto_145974 ?auto_145977 ) ) ( not ( = ?auto_145975 ?auto_145976 ) ) ( not ( = ?auto_145975 ?auto_145977 ) ) ( not ( = ?auto_145976 ?auto_145977 ) ) ( not ( = ?auto_145974 ?auto_145979 ) ) ( not ( = ?auto_145974 ?auto_145980 ) ) ( not ( = ?auto_145975 ?auto_145979 ) ) ( not ( = ?auto_145975 ?auto_145980 ) ) ( not ( = ?auto_145976 ?auto_145979 ) ) ( not ( = ?auto_145976 ?auto_145980 ) ) ( not ( = ?auto_145977 ?auto_145979 ) ) ( not ( = ?auto_145977 ?auto_145980 ) ) ( not ( = ?auto_145979 ?auto_145980 ) ) ( ON ?auto_145979 ?auto_145977 ) ( CLEAR ?auto_145982 ) ( ON-TABLE ?auto_145981 ) ( ON ?auto_145978 ?auto_145981 ) ( ON ?auto_145982 ?auto_145978 ) ( not ( = ?auto_145981 ?auto_145978 ) ) ( not ( = ?auto_145981 ?auto_145982 ) ) ( not ( = ?auto_145981 ?auto_145980 ) ) ( not ( = ?auto_145978 ?auto_145982 ) ) ( not ( = ?auto_145978 ?auto_145980 ) ) ( not ( = ?auto_145982 ?auto_145980 ) ) ( not ( = ?auto_145974 ?auto_145982 ) ) ( not ( = ?auto_145974 ?auto_145981 ) ) ( not ( = ?auto_145974 ?auto_145978 ) ) ( not ( = ?auto_145975 ?auto_145982 ) ) ( not ( = ?auto_145975 ?auto_145981 ) ) ( not ( = ?auto_145975 ?auto_145978 ) ) ( not ( = ?auto_145976 ?auto_145982 ) ) ( not ( = ?auto_145976 ?auto_145981 ) ) ( not ( = ?auto_145976 ?auto_145978 ) ) ( not ( = ?auto_145977 ?auto_145982 ) ) ( not ( = ?auto_145977 ?auto_145981 ) ) ( not ( = ?auto_145977 ?auto_145978 ) ) ( not ( = ?auto_145979 ?auto_145982 ) ) ( not ( = ?auto_145979 ?auto_145981 ) ) ( not ( = ?auto_145979 ?auto_145978 ) ) ( ON ?auto_145980 ?auto_145979 ) ( CLEAR ?auto_145980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_145974 ?auto_145975 ?auto_145976 ?auto_145977 ?auto_145979 )
      ( MAKE-3PILE ?auto_145974 ?auto_145975 ?auto_145976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145983 - BLOCK
      ?auto_145984 - BLOCK
      ?auto_145985 - BLOCK
    )
    :vars
    (
      ?auto_145991 - BLOCK
      ?auto_145987 - BLOCK
      ?auto_145989 - BLOCK
      ?auto_145986 - BLOCK
      ?auto_145988 - BLOCK
      ?auto_145990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145991 ?auto_145985 ) ( ON-TABLE ?auto_145983 ) ( ON ?auto_145984 ?auto_145983 ) ( ON ?auto_145985 ?auto_145984 ) ( not ( = ?auto_145983 ?auto_145984 ) ) ( not ( = ?auto_145983 ?auto_145985 ) ) ( not ( = ?auto_145983 ?auto_145991 ) ) ( not ( = ?auto_145984 ?auto_145985 ) ) ( not ( = ?auto_145984 ?auto_145991 ) ) ( not ( = ?auto_145985 ?auto_145991 ) ) ( not ( = ?auto_145983 ?auto_145987 ) ) ( not ( = ?auto_145983 ?auto_145989 ) ) ( not ( = ?auto_145984 ?auto_145987 ) ) ( not ( = ?auto_145984 ?auto_145989 ) ) ( not ( = ?auto_145985 ?auto_145987 ) ) ( not ( = ?auto_145985 ?auto_145989 ) ) ( not ( = ?auto_145991 ?auto_145987 ) ) ( not ( = ?auto_145991 ?auto_145989 ) ) ( not ( = ?auto_145987 ?auto_145989 ) ) ( ON ?auto_145987 ?auto_145991 ) ( ON-TABLE ?auto_145986 ) ( ON ?auto_145988 ?auto_145986 ) ( not ( = ?auto_145986 ?auto_145988 ) ) ( not ( = ?auto_145986 ?auto_145990 ) ) ( not ( = ?auto_145986 ?auto_145989 ) ) ( not ( = ?auto_145988 ?auto_145990 ) ) ( not ( = ?auto_145988 ?auto_145989 ) ) ( not ( = ?auto_145990 ?auto_145989 ) ) ( not ( = ?auto_145983 ?auto_145990 ) ) ( not ( = ?auto_145983 ?auto_145986 ) ) ( not ( = ?auto_145983 ?auto_145988 ) ) ( not ( = ?auto_145984 ?auto_145990 ) ) ( not ( = ?auto_145984 ?auto_145986 ) ) ( not ( = ?auto_145984 ?auto_145988 ) ) ( not ( = ?auto_145985 ?auto_145990 ) ) ( not ( = ?auto_145985 ?auto_145986 ) ) ( not ( = ?auto_145985 ?auto_145988 ) ) ( not ( = ?auto_145991 ?auto_145990 ) ) ( not ( = ?auto_145991 ?auto_145986 ) ) ( not ( = ?auto_145991 ?auto_145988 ) ) ( not ( = ?auto_145987 ?auto_145990 ) ) ( not ( = ?auto_145987 ?auto_145986 ) ) ( not ( = ?auto_145987 ?auto_145988 ) ) ( ON ?auto_145989 ?auto_145987 ) ( CLEAR ?auto_145989 ) ( HOLDING ?auto_145990 ) ( CLEAR ?auto_145988 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_145986 ?auto_145988 ?auto_145990 )
      ( MAKE-3PILE ?auto_145983 ?auto_145984 ?auto_145985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_145992 - BLOCK
      ?auto_145993 - BLOCK
      ?auto_145994 - BLOCK
    )
    :vars
    (
      ?auto_145999 - BLOCK
      ?auto_146000 - BLOCK
      ?auto_145997 - BLOCK
      ?auto_145996 - BLOCK
      ?auto_145998 - BLOCK
      ?auto_145995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_145999 ?auto_145994 ) ( ON-TABLE ?auto_145992 ) ( ON ?auto_145993 ?auto_145992 ) ( ON ?auto_145994 ?auto_145993 ) ( not ( = ?auto_145992 ?auto_145993 ) ) ( not ( = ?auto_145992 ?auto_145994 ) ) ( not ( = ?auto_145992 ?auto_145999 ) ) ( not ( = ?auto_145993 ?auto_145994 ) ) ( not ( = ?auto_145993 ?auto_145999 ) ) ( not ( = ?auto_145994 ?auto_145999 ) ) ( not ( = ?auto_145992 ?auto_146000 ) ) ( not ( = ?auto_145992 ?auto_145997 ) ) ( not ( = ?auto_145993 ?auto_146000 ) ) ( not ( = ?auto_145993 ?auto_145997 ) ) ( not ( = ?auto_145994 ?auto_146000 ) ) ( not ( = ?auto_145994 ?auto_145997 ) ) ( not ( = ?auto_145999 ?auto_146000 ) ) ( not ( = ?auto_145999 ?auto_145997 ) ) ( not ( = ?auto_146000 ?auto_145997 ) ) ( ON ?auto_146000 ?auto_145999 ) ( ON-TABLE ?auto_145996 ) ( ON ?auto_145998 ?auto_145996 ) ( not ( = ?auto_145996 ?auto_145998 ) ) ( not ( = ?auto_145996 ?auto_145995 ) ) ( not ( = ?auto_145996 ?auto_145997 ) ) ( not ( = ?auto_145998 ?auto_145995 ) ) ( not ( = ?auto_145998 ?auto_145997 ) ) ( not ( = ?auto_145995 ?auto_145997 ) ) ( not ( = ?auto_145992 ?auto_145995 ) ) ( not ( = ?auto_145992 ?auto_145996 ) ) ( not ( = ?auto_145992 ?auto_145998 ) ) ( not ( = ?auto_145993 ?auto_145995 ) ) ( not ( = ?auto_145993 ?auto_145996 ) ) ( not ( = ?auto_145993 ?auto_145998 ) ) ( not ( = ?auto_145994 ?auto_145995 ) ) ( not ( = ?auto_145994 ?auto_145996 ) ) ( not ( = ?auto_145994 ?auto_145998 ) ) ( not ( = ?auto_145999 ?auto_145995 ) ) ( not ( = ?auto_145999 ?auto_145996 ) ) ( not ( = ?auto_145999 ?auto_145998 ) ) ( not ( = ?auto_146000 ?auto_145995 ) ) ( not ( = ?auto_146000 ?auto_145996 ) ) ( not ( = ?auto_146000 ?auto_145998 ) ) ( ON ?auto_145997 ?auto_146000 ) ( CLEAR ?auto_145998 ) ( ON ?auto_145995 ?auto_145997 ) ( CLEAR ?auto_145995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_145992 ?auto_145993 ?auto_145994 ?auto_145999 ?auto_146000 ?auto_145997 )
      ( MAKE-3PILE ?auto_145992 ?auto_145993 ?auto_145994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_146001 - BLOCK
      ?auto_146002 - BLOCK
      ?auto_146003 - BLOCK
    )
    :vars
    (
      ?auto_146006 - BLOCK
      ?auto_146004 - BLOCK
      ?auto_146009 - BLOCK
      ?auto_146007 - BLOCK
      ?auto_146008 - BLOCK
      ?auto_146005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146006 ?auto_146003 ) ( ON-TABLE ?auto_146001 ) ( ON ?auto_146002 ?auto_146001 ) ( ON ?auto_146003 ?auto_146002 ) ( not ( = ?auto_146001 ?auto_146002 ) ) ( not ( = ?auto_146001 ?auto_146003 ) ) ( not ( = ?auto_146001 ?auto_146006 ) ) ( not ( = ?auto_146002 ?auto_146003 ) ) ( not ( = ?auto_146002 ?auto_146006 ) ) ( not ( = ?auto_146003 ?auto_146006 ) ) ( not ( = ?auto_146001 ?auto_146004 ) ) ( not ( = ?auto_146001 ?auto_146009 ) ) ( not ( = ?auto_146002 ?auto_146004 ) ) ( not ( = ?auto_146002 ?auto_146009 ) ) ( not ( = ?auto_146003 ?auto_146004 ) ) ( not ( = ?auto_146003 ?auto_146009 ) ) ( not ( = ?auto_146006 ?auto_146004 ) ) ( not ( = ?auto_146006 ?auto_146009 ) ) ( not ( = ?auto_146004 ?auto_146009 ) ) ( ON ?auto_146004 ?auto_146006 ) ( ON-TABLE ?auto_146007 ) ( not ( = ?auto_146007 ?auto_146008 ) ) ( not ( = ?auto_146007 ?auto_146005 ) ) ( not ( = ?auto_146007 ?auto_146009 ) ) ( not ( = ?auto_146008 ?auto_146005 ) ) ( not ( = ?auto_146008 ?auto_146009 ) ) ( not ( = ?auto_146005 ?auto_146009 ) ) ( not ( = ?auto_146001 ?auto_146005 ) ) ( not ( = ?auto_146001 ?auto_146007 ) ) ( not ( = ?auto_146001 ?auto_146008 ) ) ( not ( = ?auto_146002 ?auto_146005 ) ) ( not ( = ?auto_146002 ?auto_146007 ) ) ( not ( = ?auto_146002 ?auto_146008 ) ) ( not ( = ?auto_146003 ?auto_146005 ) ) ( not ( = ?auto_146003 ?auto_146007 ) ) ( not ( = ?auto_146003 ?auto_146008 ) ) ( not ( = ?auto_146006 ?auto_146005 ) ) ( not ( = ?auto_146006 ?auto_146007 ) ) ( not ( = ?auto_146006 ?auto_146008 ) ) ( not ( = ?auto_146004 ?auto_146005 ) ) ( not ( = ?auto_146004 ?auto_146007 ) ) ( not ( = ?auto_146004 ?auto_146008 ) ) ( ON ?auto_146009 ?auto_146004 ) ( ON ?auto_146005 ?auto_146009 ) ( CLEAR ?auto_146005 ) ( HOLDING ?auto_146008 ) ( CLEAR ?auto_146007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146007 ?auto_146008 )
      ( MAKE-3PILE ?auto_146001 ?auto_146002 ?auto_146003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_146010 - BLOCK
      ?auto_146011 - BLOCK
      ?auto_146012 - BLOCK
    )
    :vars
    (
      ?auto_146014 - BLOCK
      ?auto_146013 - BLOCK
      ?auto_146015 - BLOCK
      ?auto_146018 - BLOCK
      ?auto_146016 - BLOCK
      ?auto_146017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146014 ?auto_146012 ) ( ON-TABLE ?auto_146010 ) ( ON ?auto_146011 ?auto_146010 ) ( ON ?auto_146012 ?auto_146011 ) ( not ( = ?auto_146010 ?auto_146011 ) ) ( not ( = ?auto_146010 ?auto_146012 ) ) ( not ( = ?auto_146010 ?auto_146014 ) ) ( not ( = ?auto_146011 ?auto_146012 ) ) ( not ( = ?auto_146011 ?auto_146014 ) ) ( not ( = ?auto_146012 ?auto_146014 ) ) ( not ( = ?auto_146010 ?auto_146013 ) ) ( not ( = ?auto_146010 ?auto_146015 ) ) ( not ( = ?auto_146011 ?auto_146013 ) ) ( not ( = ?auto_146011 ?auto_146015 ) ) ( not ( = ?auto_146012 ?auto_146013 ) ) ( not ( = ?auto_146012 ?auto_146015 ) ) ( not ( = ?auto_146014 ?auto_146013 ) ) ( not ( = ?auto_146014 ?auto_146015 ) ) ( not ( = ?auto_146013 ?auto_146015 ) ) ( ON ?auto_146013 ?auto_146014 ) ( ON-TABLE ?auto_146018 ) ( not ( = ?auto_146018 ?auto_146016 ) ) ( not ( = ?auto_146018 ?auto_146017 ) ) ( not ( = ?auto_146018 ?auto_146015 ) ) ( not ( = ?auto_146016 ?auto_146017 ) ) ( not ( = ?auto_146016 ?auto_146015 ) ) ( not ( = ?auto_146017 ?auto_146015 ) ) ( not ( = ?auto_146010 ?auto_146017 ) ) ( not ( = ?auto_146010 ?auto_146018 ) ) ( not ( = ?auto_146010 ?auto_146016 ) ) ( not ( = ?auto_146011 ?auto_146017 ) ) ( not ( = ?auto_146011 ?auto_146018 ) ) ( not ( = ?auto_146011 ?auto_146016 ) ) ( not ( = ?auto_146012 ?auto_146017 ) ) ( not ( = ?auto_146012 ?auto_146018 ) ) ( not ( = ?auto_146012 ?auto_146016 ) ) ( not ( = ?auto_146014 ?auto_146017 ) ) ( not ( = ?auto_146014 ?auto_146018 ) ) ( not ( = ?auto_146014 ?auto_146016 ) ) ( not ( = ?auto_146013 ?auto_146017 ) ) ( not ( = ?auto_146013 ?auto_146018 ) ) ( not ( = ?auto_146013 ?auto_146016 ) ) ( ON ?auto_146015 ?auto_146013 ) ( ON ?auto_146017 ?auto_146015 ) ( CLEAR ?auto_146018 ) ( ON ?auto_146016 ?auto_146017 ) ( CLEAR ?auto_146016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146010 ?auto_146011 ?auto_146012 ?auto_146014 ?auto_146013 ?auto_146015 ?auto_146017 )
      ( MAKE-3PILE ?auto_146010 ?auto_146011 ?auto_146012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_146019 - BLOCK
      ?auto_146020 - BLOCK
      ?auto_146021 - BLOCK
    )
    :vars
    (
      ?auto_146023 - BLOCK
      ?auto_146025 - BLOCK
      ?auto_146024 - BLOCK
      ?auto_146022 - BLOCK
      ?auto_146027 - BLOCK
      ?auto_146026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146023 ?auto_146021 ) ( ON-TABLE ?auto_146019 ) ( ON ?auto_146020 ?auto_146019 ) ( ON ?auto_146021 ?auto_146020 ) ( not ( = ?auto_146019 ?auto_146020 ) ) ( not ( = ?auto_146019 ?auto_146021 ) ) ( not ( = ?auto_146019 ?auto_146023 ) ) ( not ( = ?auto_146020 ?auto_146021 ) ) ( not ( = ?auto_146020 ?auto_146023 ) ) ( not ( = ?auto_146021 ?auto_146023 ) ) ( not ( = ?auto_146019 ?auto_146025 ) ) ( not ( = ?auto_146019 ?auto_146024 ) ) ( not ( = ?auto_146020 ?auto_146025 ) ) ( not ( = ?auto_146020 ?auto_146024 ) ) ( not ( = ?auto_146021 ?auto_146025 ) ) ( not ( = ?auto_146021 ?auto_146024 ) ) ( not ( = ?auto_146023 ?auto_146025 ) ) ( not ( = ?auto_146023 ?auto_146024 ) ) ( not ( = ?auto_146025 ?auto_146024 ) ) ( ON ?auto_146025 ?auto_146023 ) ( not ( = ?auto_146022 ?auto_146027 ) ) ( not ( = ?auto_146022 ?auto_146026 ) ) ( not ( = ?auto_146022 ?auto_146024 ) ) ( not ( = ?auto_146027 ?auto_146026 ) ) ( not ( = ?auto_146027 ?auto_146024 ) ) ( not ( = ?auto_146026 ?auto_146024 ) ) ( not ( = ?auto_146019 ?auto_146026 ) ) ( not ( = ?auto_146019 ?auto_146022 ) ) ( not ( = ?auto_146019 ?auto_146027 ) ) ( not ( = ?auto_146020 ?auto_146026 ) ) ( not ( = ?auto_146020 ?auto_146022 ) ) ( not ( = ?auto_146020 ?auto_146027 ) ) ( not ( = ?auto_146021 ?auto_146026 ) ) ( not ( = ?auto_146021 ?auto_146022 ) ) ( not ( = ?auto_146021 ?auto_146027 ) ) ( not ( = ?auto_146023 ?auto_146026 ) ) ( not ( = ?auto_146023 ?auto_146022 ) ) ( not ( = ?auto_146023 ?auto_146027 ) ) ( not ( = ?auto_146025 ?auto_146026 ) ) ( not ( = ?auto_146025 ?auto_146022 ) ) ( not ( = ?auto_146025 ?auto_146027 ) ) ( ON ?auto_146024 ?auto_146025 ) ( ON ?auto_146026 ?auto_146024 ) ( ON ?auto_146027 ?auto_146026 ) ( CLEAR ?auto_146027 ) ( HOLDING ?auto_146022 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146022 )
      ( MAKE-3PILE ?auto_146019 ?auto_146020 ?auto_146021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_146028 - BLOCK
      ?auto_146029 - BLOCK
      ?auto_146030 - BLOCK
    )
    :vars
    (
      ?auto_146035 - BLOCK
      ?auto_146036 - BLOCK
      ?auto_146033 - BLOCK
      ?auto_146032 - BLOCK
      ?auto_146031 - BLOCK
      ?auto_146034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146035 ?auto_146030 ) ( ON-TABLE ?auto_146028 ) ( ON ?auto_146029 ?auto_146028 ) ( ON ?auto_146030 ?auto_146029 ) ( not ( = ?auto_146028 ?auto_146029 ) ) ( not ( = ?auto_146028 ?auto_146030 ) ) ( not ( = ?auto_146028 ?auto_146035 ) ) ( not ( = ?auto_146029 ?auto_146030 ) ) ( not ( = ?auto_146029 ?auto_146035 ) ) ( not ( = ?auto_146030 ?auto_146035 ) ) ( not ( = ?auto_146028 ?auto_146036 ) ) ( not ( = ?auto_146028 ?auto_146033 ) ) ( not ( = ?auto_146029 ?auto_146036 ) ) ( not ( = ?auto_146029 ?auto_146033 ) ) ( not ( = ?auto_146030 ?auto_146036 ) ) ( not ( = ?auto_146030 ?auto_146033 ) ) ( not ( = ?auto_146035 ?auto_146036 ) ) ( not ( = ?auto_146035 ?auto_146033 ) ) ( not ( = ?auto_146036 ?auto_146033 ) ) ( ON ?auto_146036 ?auto_146035 ) ( not ( = ?auto_146032 ?auto_146031 ) ) ( not ( = ?auto_146032 ?auto_146034 ) ) ( not ( = ?auto_146032 ?auto_146033 ) ) ( not ( = ?auto_146031 ?auto_146034 ) ) ( not ( = ?auto_146031 ?auto_146033 ) ) ( not ( = ?auto_146034 ?auto_146033 ) ) ( not ( = ?auto_146028 ?auto_146034 ) ) ( not ( = ?auto_146028 ?auto_146032 ) ) ( not ( = ?auto_146028 ?auto_146031 ) ) ( not ( = ?auto_146029 ?auto_146034 ) ) ( not ( = ?auto_146029 ?auto_146032 ) ) ( not ( = ?auto_146029 ?auto_146031 ) ) ( not ( = ?auto_146030 ?auto_146034 ) ) ( not ( = ?auto_146030 ?auto_146032 ) ) ( not ( = ?auto_146030 ?auto_146031 ) ) ( not ( = ?auto_146035 ?auto_146034 ) ) ( not ( = ?auto_146035 ?auto_146032 ) ) ( not ( = ?auto_146035 ?auto_146031 ) ) ( not ( = ?auto_146036 ?auto_146034 ) ) ( not ( = ?auto_146036 ?auto_146032 ) ) ( not ( = ?auto_146036 ?auto_146031 ) ) ( ON ?auto_146033 ?auto_146036 ) ( ON ?auto_146034 ?auto_146033 ) ( ON ?auto_146031 ?auto_146034 ) ( ON ?auto_146032 ?auto_146031 ) ( CLEAR ?auto_146032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146028 ?auto_146029 ?auto_146030 ?auto_146035 ?auto_146036 ?auto_146033 ?auto_146034 ?auto_146031 )
      ( MAKE-3PILE ?auto_146028 ?auto_146029 ?auto_146030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146043 - BLOCK
      ?auto_146044 - BLOCK
      ?auto_146045 - BLOCK
      ?auto_146046 - BLOCK
      ?auto_146047 - BLOCK
      ?auto_146048 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_146048 ) ( CLEAR ?auto_146047 ) ( ON-TABLE ?auto_146043 ) ( ON ?auto_146044 ?auto_146043 ) ( ON ?auto_146045 ?auto_146044 ) ( ON ?auto_146046 ?auto_146045 ) ( ON ?auto_146047 ?auto_146046 ) ( not ( = ?auto_146043 ?auto_146044 ) ) ( not ( = ?auto_146043 ?auto_146045 ) ) ( not ( = ?auto_146043 ?auto_146046 ) ) ( not ( = ?auto_146043 ?auto_146047 ) ) ( not ( = ?auto_146043 ?auto_146048 ) ) ( not ( = ?auto_146044 ?auto_146045 ) ) ( not ( = ?auto_146044 ?auto_146046 ) ) ( not ( = ?auto_146044 ?auto_146047 ) ) ( not ( = ?auto_146044 ?auto_146048 ) ) ( not ( = ?auto_146045 ?auto_146046 ) ) ( not ( = ?auto_146045 ?auto_146047 ) ) ( not ( = ?auto_146045 ?auto_146048 ) ) ( not ( = ?auto_146046 ?auto_146047 ) ) ( not ( = ?auto_146046 ?auto_146048 ) ) ( not ( = ?auto_146047 ?auto_146048 ) ) )
    :subtasks
    ( ( !STACK ?auto_146048 ?auto_146047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146049 - BLOCK
      ?auto_146050 - BLOCK
      ?auto_146051 - BLOCK
      ?auto_146052 - BLOCK
      ?auto_146053 - BLOCK
      ?auto_146054 - BLOCK
    )
    :vars
    (
      ?auto_146055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146053 ) ( ON-TABLE ?auto_146049 ) ( ON ?auto_146050 ?auto_146049 ) ( ON ?auto_146051 ?auto_146050 ) ( ON ?auto_146052 ?auto_146051 ) ( ON ?auto_146053 ?auto_146052 ) ( not ( = ?auto_146049 ?auto_146050 ) ) ( not ( = ?auto_146049 ?auto_146051 ) ) ( not ( = ?auto_146049 ?auto_146052 ) ) ( not ( = ?auto_146049 ?auto_146053 ) ) ( not ( = ?auto_146049 ?auto_146054 ) ) ( not ( = ?auto_146050 ?auto_146051 ) ) ( not ( = ?auto_146050 ?auto_146052 ) ) ( not ( = ?auto_146050 ?auto_146053 ) ) ( not ( = ?auto_146050 ?auto_146054 ) ) ( not ( = ?auto_146051 ?auto_146052 ) ) ( not ( = ?auto_146051 ?auto_146053 ) ) ( not ( = ?auto_146051 ?auto_146054 ) ) ( not ( = ?auto_146052 ?auto_146053 ) ) ( not ( = ?auto_146052 ?auto_146054 ) ) ( not ( = ?auto_146053 ?auto_146054 ) ) ( ON ?auto_146054 ?auto_146055 ) ( CLEAR ?auto_146054 ) ( HAND-EMPTY ) ( not ( = ?auto_146049 ?auto_146055 ) ) ( not ( = ?auto_146050 ?auto_146055 ) ) ( not ( = ?auto_146051 ?auto_146055 ) ) ( not ( = ?auto_146052 ?auto_146055 ) ) ( not ( = ?auto_146053 ?auto_146055 ) ) ( not ( = ?auto_146054 ?auto_146055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146054 ?auto_146055 )
      ( MAKE-6PILE ?auto_146049 ?auto_146050 ?auto_146051 ?auto_146052 ?auto_146053 ?auto_146054 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146056 - BLOCK
      ?auto_146057 - BLOCK
      ?auto_146058 - BLOCK
      ?auto_146059 - BLOCK
      ?auto_146060 - BLOCK
      ?auto_146061 - BLOCK
    )
    :vars
    (
      ?auto_146062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146056 ) ( ON ?auto_146057 ?auto_146056 ) ( ON ?auto_146058 ?auto_146057 ) ( ON ?auto_146059 ?auto_146058 ) ( not ( = ?auto_146056 ?auto_146057 ) ) ( not ( = ?auto_146056 ?auto_146058 ) ) ( not ( = ?auto_146056 ?auto_146059 ) ) ( not ( = ?auto_146056 ?auto_146060 ) ) ( not ( = ?auto_146056 ?auto_146061 ) ) ( not ( = ?auto_146057 ?auto_146058 ) ) ( not ( = ?auto_146057 ?auto_146059 ) ) ( not ( = ?auto_146057 ?auto_146060 ) ) ( not ( = ?auto_146057 ?auto_146061 ) ) ( not ( = ?auto_146058 ?auto_146059 ) ) ( not ( = ?auto_146058 ?auto_146060 ) ) ( not ( = ?auto_146058 ?auto_146061 ) ) ( not ( = ?auto_146059 ?auto_146060 ) ) ( not ( = ?auto_146059 ?auto_146061 ) ) ( not ( = ?auto_146060 ?auto_146061 ) ) ( ON ?auto_146061 ?auto_146062 ) ( CLEAR ?auto_146061 ) ( not ( = ?auto_146056 ?auto_146062 ) ) ( not ( = ?auto_146057 ?auto_146062 ) ) ( not ( = ?auto_146058 ?auto_146062 ) ) ( not ( = ?auto_146059 ?auto_146062 ) ) ( not ( = ?auto_146060 ?auto_146062 ) ) ( not ( = ?auto_146061 ?auto_146062 ) ) ( HOLDING ?auto_146060 ) ( CLEAR ?auto_146059 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146056 ?auto_146057 ?auto_146058 ?auto_146059 ?auto_146060 )
      ( MAKE-6PILE ?auto_146056 ?auto_146057 ?auto_146058 ?auto_146059 ?auto_146060 ?auto_146061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146063 - BLOCK
      ?auto_146064 - BLOCK
      ?auto_146065 - BLOCK
      ?auto_146066 - BLOCK
      ?auto_146067 - BLOCK
      ?auto_146068 - BLOCK
    )
    :vars
    (
      ?auto_146069 - BLOCK
      ?auto_146071 - BLOCK
      ?auto_146070 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146063 ) ( ON ?auto_146064 ?auto_146063 ) ( ON ?auto_146065 ?auto_146064 ) ( ON ?auto_146066 ?auto_146065 ) ( not ( = ?auto_146063 ?auto_146064 ) ) ( not ( = ?auto_146063 ?auto_146065 ) ) ( not ( = ?auto_146063 ?auto_146066 ) ) ( not ( = ?auto_146063 ?auto_146067 ) ) ( not ( = ?auto_146063 ?auto_146068 ) ) ( not ( = ?auto_146064 ?auto_146065 ) ) ( not ( = ?auto_146064 ?auto_146066 ) ) ( not ( = ?auto_146064 ?auto_146067 ) ) ( not ( = ?auto_146064 ?auto_146068 ) ) ( not ( = ?auto_146065 ?auto_146066 ) ) ( not ( = ?auto_146065 ?auto_146067 ) ) ( not ( = ?auto_146065 ?auto_146068 ) ) ( not ( = ?auto_146066 ?auto_146067 ) ) ( not ( = ?auto_146066 ?auto_146068 ) ) ( not ( = ?auto_146067 ?auto_146068 ) ) ( ON ?auto_146068 ?auto_146069 ) ( not ( = ?auto_146063 ?auto_146069 ) ) ( not ( = ?auto_146064 ?auto_146069 ) ) ( not ( = ?auto_146065 ?auto_146069 ) ) ( not ( = ?auto_146066 ?auto_146069 ) ) ( not ( = ?auto_146067 ?auto_146069 ) ) ( not ( = ?auto_146068 ?auto_146069 ) ) ( CLEAR ?auto_146066 ) ( ON ?auto_146067 ?auto_146068 ) ( CLEAR ?auto_146067 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146071 ) ( ON ?auto_146070 ?auto_146071 ) ( ON ?auto_146069 ?auto_146070 ) ( not ( = ?auto_146071 ?auto_146070 ) ) ( not ( = ?auto_146071 ?auto_146069 ) ) ( not ( = ?auto_146071 ?auto_146068 ) ) ( not ( = ?auto_146071 ?auto_146067 ) ) ( not ( = ?auto_146070 ?auto_146069 ) ) ( not ( = ?auto_146070 ?auto_146068 ) ) ( not ( = ?auto_146070 ?auto_146067 ) ) ( not ( = ?auto_146063 ?auto_146071 ) ) ( not ( = ?auto_146063 ?auto_146070 ) ) ( not ( = ?auto_146064 ?auto_146071 ) ) ( not ( = ?auto_146064 ?auto_146070 ) ) ( not ( = ?auto_146065 ?auto_146071 ) ) ( not ( = ?auto_146065 ?auto_146070 ) ) ( not ( = ?auto_146066 ?auto_146071 ) ) ( not ( = ?auto_146066 ?auto_146070 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146071 ?auto_146070 ?auto_146069 ?auto_146068 )
      ( MAKE-6PILE ?auto_146063 ?auto_146064 ?auto_146065 ?auto_146066 ?auto_146067 ?auto_146068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146072 - BLOCK
      ?auto_146073 - BLOCK
      ?auto_146074 - BLOCK
      ?auto_146075 - BLOCK
      ?auto_146076 - BLOCK
      ?auto_146077 - BLOCK
    )
    :vars
    (
      ?auto_146080 - BLOCK
      ?auto_146078 - BLOCK
      ?auto_146079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146072 ) ( ON ?auto_146073 ?auto_146072 ) ( ON ?auto_146074 ?auto_146073 ) ( not ( = ?auto_146072 ?auto_146073 ) ) ( not ( = ?auto_146072 ?auto_146074 ) ) ( not ( = ?auto_146072 ?auto_146075 ) ) ( not ( = ?auto_146072 ?auto_146076 ) ) ( not ( = ?auto_146072 ?auto_146077 ) ) ( not ( = ?auto_146073 ?auto_146074 ) ) ( not ( = ?auto_146073 ?auto_146075 ) ) ( not ( = ?auto_146073 ?auto_146076 ) ) ( not ( = ?auto_146073 ?auto_146077 ) ) ( not ( = ?auto_146074 ?auto_146075 ) ) ( not ( = ?auto_146074 ?auto_146076 ) ) ( not ( = ?auto_146074 ?auto_146077 ) ) ( not ( = ?auto_146075 ?auto_146076 ) ) ( not ( = ?auto_146075 ?auto_146077 ) ) ( not ( = ?auto_146076 ?auto_146077 ) ) ( ON ?auto_146077 ?auto_146080 ) ( not ( = ?auto_146072 ?auto_146080 ) ) ( not ( = ?auto_146073 ?auto_146080 ) ) ( not ( = ?auto_146074 ?auto_146080 ) ) ( not ( = ?auto_146075 ?auto_146080 ) ) ( not ( = ?auto_146076 ?auto_146080 ) ) ( not ( = ?auto_146077 ?auto_146080 ) ) ( ON ?auto_146076 ?auto_146077 ) ( CLEAR ?auto_146076 ) ( ON-TABLE ?auto_146078 ) ( ON ?auto_146079 ?auto_146078 ) ( ON ?auto_146080 ?auto_146079 ) ( not ( = ?auto_146078 ?auto_146079 ) ) ( not ( = ?auto_146078 ?auto_146080 ) ) ( not ( = ?auto_146078 ?auto_146077 ) ) ( not ( = ?auto_146078 ?auto_146076 ) ) ( not ( = ?auto_146079 ?auto_146080 ) ) ( not ( = ?auto_146079 ?auto_146077 ) ) ( not ( = ?auto_146079 ?auto_146076 ) ) ( not ( = ?auto_146072 ?auto_146078 ) ) ( not ( = ?auto_146072 ?auto_146079 ) ) ( not ( = ?auto_146073 ?auto_146078 ) ) ( not ( = ?auto_146073 ?auto_146079 ) ) ( not ( = ?auto_146074 ?auto_146078 ) ) ( not ( = ?auto_146074 ?auto_146079 ) ) ( not ( = ?auto_146075 ?auto_146078 ) ) ( not ( = ?auto_146075 ?auto_146079 ) ) ( HOLDING ?auto_146075 ) ( CLEAR ?auto_146074 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146072 ?auto_146073 ?auto_146074 ?auto_146075 )
      ( MAKE-6PILE ?auto_146072 ?auto_146073 ?auto_146074 ?auto_146075 ?auto_146076 ?auto_146077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146081 - BLOCK
      ?auto_146082 - BLOCK
      ?auto_146083 - BLOCK
      ?auto_146084 - BLOCK
      ?auto_146085 - BLOCK
      ?auto_146086 - BLOCK
    )
    :vars
    (
      ?auto_146087 - BLOCK
      ?auto_146088 - BLOCK
      ?auto_146089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146081 ) ( ON ?auto_146082 ?auto_146081 ) ( ON ?auto_146083 ?auto_146082 ) ( not ( = ?auto_146081 ?auto_146082 ) ) ( not ( = ?auto_146081 ?auto_146083 ) ) ( not ( = ?auto_146081 ?auto_146084 ) ) ( not ( = ?auto_146081 ?auto_146085 ) ) ( not ( = ?auto_146081 ?auto_146086 ) ) ( not ( = ?auto_146082 ?auto_146083 ) ) ( not ( = ?auto_146082 ?auto_146084 ) ) ( not ( = ?auto_146082 ?auto_146085 ) ) ( not ( = ?auto_146082 ?auto_146086 ) ) ( not ( = ?auto_146083 ?auto_146084 ) ) ( not ( = ?auto_146083 ?auto_146085 ) ) ( not ( = ?auto_146083 ?auto_146086 ) ) ( not ( = ?auto_146084 ?auto_146085 ) ) ( not ( = ?auto_146084 ?auto_146086 ) ) ( not ( = ?auto_146085 ?auto_146086 ) ) ( ON ?auto_146086 ?auto_146087 ) ( not ( = ?auto_146081 ?auto_146087 ) ) ( not ( = ?auto_146082 ?auto_146087 ) ) ( not ( = ?auto_146083 ?auto_146087 ) ) ( not ( = ?auto_146084 ?auto_146087 ) ) ( not ( = ?auto_146085 ?auto_146087 ) ) ( not ( = ?auto_146086 ?auto_146087 ) ) ( ON ?auto_146085 ?auto_146086 ) ( ON-TABLE ?auto_146088 ) ( ON ?auto_146089 ?auto_146088 ) ( ON ?auto_146087 ?auto_146089 ) ( not ( = ?auto_146088 ?auto_146089 ) ) ( not ( = ?auto_146088 ?auto_146087 ) ) ( not ( = ?auto_146088 ?auto_146086 ) ) ( not ( = ?auto_146088 ?auto_146085 ) ) ( not ( = ?auto_146089 ?auto_146087 ) ) ( not ( = ?auto_146089 ?auto_146086 ) ) ( not ( = ?auto_146089 ?auto_146085 ) ) ( not ( = ?auto_146081 ?auto_146088 ) ) ( not ( = ?auto_146081 ?auto_146089 ) ) ( not ( = ?auto_146082 ?auto_146088 ) ) ( not ( = ?auto_146082 ?auto_146089 ) ) ( not ( = ?auto_146083 ?auto_146088 ) ) ( not ( = ?auto_146083 ?auto_146089 ) ) ( not ( = ?auto_146084 ?auto_146088 ) ) ( not ( = ?auto_146084 ?auto_146089 ) ) ( CLEAR ?auto_146083 ) ( ON ?auto_146084 ?auto_146085 ) ( CLEAR ?auto_146084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146088 ?auto_146089 ?auto_146087 ?auto_146086 ?auto_146085 )
      ( MAKE-6PILE ?auto_146081 ?auto_146082 ?auto_146083 ?auto_146084 ?auto_146085 ?auto_146086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146090 - BLOCK
      ?auto_146091 - BLOCK
      ?auto_146092 - BLOCK
      ?auto_146093 - BLOCK
      ?auto_146094 - BLOCK
      ?auto_146095 - BLOCK
    )
    :vars
    (
      ?auto_146097 - BLOCK
      ?auto_146096 - BLOCK
      ?auto_146098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146090 ) ( ON ?auto_146091 ?auto_146090 ) ( not ( = ?auto_146090 ?auto_146091 ) ) ( not ( = ?auto_146090 ?auto_146092 ) ) ( not ( = ?auto_146090 ?auto_146093 ) ) ( not ( = ?auto_146090 ?auto_146094 ) ) ( not ( = ?auto_146090 ?auto_146095 ) ) ( not ( = ?auto_146091 ?auto_146092 ) ) ( not ( = ?auto_146091 ?auto_146093 ) ) ( not ( = ?auto_146091 ?auto_146094 ) ) ( not ( = ?auto_146091 ?auto_146095 ) ) ( not ( = ?auto_146092 ?auto_146093 ) ) ( not ( = ?auto_146092 ?auto_146094 ) ) ( not ( = ?auto_146092 ?auto_146095 ) ) ( not ( = ?auto_146093 ?auto_146094 ) ) ( not ( = ?auto_146093 ?auto_146095 ) ) ( not ( = ?auto_146094 ?auto_146095 ) ) ( ON ?auto_146095 ?auto_146097 ) ( not ( = ?auto_146090 ?auto_146097 ) ) ( not ( = ?auto_146091 ?auto_146097 ) ) ( not ( = ?auto_146092 ?auto_146097 ) ) ( not ( = ?auto_146093 ?auto_146097 ) ) ( not ( = ?auto_146094 ?auto_146097 ) ) ( not ( = ?auto_146095 ?auto_146097 ) ) ( ON ?auto_146094 ?auto_146095 ) ( ON-TABLE ?auto_146096 ) ( ON ?auto_146098 ?auto_146096 ) ( ON ?auto_146097 ?auto_146098 ) ( not ( = ?auto_146096 ?auto_146098 ) ) ( not ( = ?auto_146096 ?auto_146097 ) ) ( not ( = ?auto_146096 ?auto_146095 ) ) ( not ( = ?auto_146096 ?auto_146094 ) ) ( not ( = ?auto_146098 ?auto_146097 ) ) ( not ( = ?auto_146098 ?auto_146095 ) ) ( not ( = ?auto_146098 ?auto_146094 ) ) ( not ( = ?auto_146090 ?auto_146096 ) ) ( not ( = ?auto_146090 ?auto_146098 ) ) ( not ( = ?auto_146091 ?auto_146096 ) ) ( not ( = ?auto_146091 ?auto_146098 ) ) ( not ( = ?auto_146092 ?auto_146096 ) ) ( not ( = ?auto_146092 ?auto_146098 ) ) ( not ( = ?auto_146093 ?auto_146096 ) ) ( not ( = ?auto_146093 ?auto_146098 ) ) ( ON ?auto_146093 ?auto_146094 ) ( CLEAR ?auto_146093 ) ( HOLDING ?auto_146092 ) ( CLEAR ?auto_146091 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146090 ?auto_146091 ?auto_146092 )
      ( MAKE-6PILE ?auto_146090 ?auto_146091 ?auto_146092 ?auto_146093 ?auto_146094 ?auto_146095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146099 - BLOCK
      ?auto_146100 - BLOCK
      ?auto_146101 - BLOCK
      ?auto_146102 - BLOCK
      ?auto_146103 - BLOCK
      ?auto_146104 - BLOCK
    )
    :vars
    (
      ?auto_146105 - BLOCK
      ?auto_146107 - BLOCK
      ?auto_146106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146099 ) ( ON ?auto_146100 ?auto_146099 ) ( not ( = ?auto_146099 ?auto_146100 ) ) ( not ( = ?auto_146099 ?auto_146101 ) ) ( not ( = ?auto_146099 ?auto_146102 ) ) ( not ( = ?auto_146099 ?auto_146103 ) ) ( not ( = ?auto_146099 ?auto_146104 ) ) ( not ( = ?auto_146100 ?auto_146101 ) ) ( not ( = ?auto_146100 ?auto_146102 ) ) ( not ( = ?auto_146100 ?auto_146103 ) ) ( not ( = ?auto_146100 ?auto_146104 ) ) ( not ( = ?auto_146101 ?auto_146102 ) ) ( not ( = ?auto_146101 ?auto_146103 ) ) ( not ( = ?auto_146101 ?auto_146104 ) ) ( not ( = ?auto_146102 ?auto_146103 ) ) ( not ( = ?auto_146102 ?auto_146104 ) ) ( not ( = ?auto_146103 ?auto_146104 ) ) ( ON ?auto_146104 ?auto_146105 ) ( not ( = ?auto_146099 ?auto_146105 ) ) ( not ( = ?auto_146100 ?auto_146105 ) ) ( not ( = ?auto_146101 ?auto_146105 ) ) ( not ( = ?auto_146102 ?auto_146105 ) ) ( not ( = ?auto_146103 ?auto_146105 ) ) ( not ( = ?auto_146104 ?auto_146105 ) ) ( ON ?auto_146103 ?auto_146104 ) ( ON-TABLE ?auto_146107 ) ( ON ?auto_146106 ?auto_146107 ) ( ON ?auto_146105 ?auto_146106 ) ( not ( = ?auto_146107 ?auto_146106 ) ) ( not ( = ?auto_146107 ?auto_146105 ) ) ( not ( = ?auto_146107 ?auto_146104 ) ) ( not ( = ?auto_146107 ?auto_146103 ) ) ( not ( = ?auto_146106 ?auto_146105 ) ) ( not ( = ?auto_146106 ?auto_146104 ) ) ( not ( = ?auto_146106 ?auto_146103 ) ) ( not ( = ?auto_146099 ?auto_146107 ) ) ( not ( = ?auto_146099 ?auto_146106 ) ) ( not ( = ?auto_146100 ?auto_146107 ) ) ( not ( = ?auto_146100 ?auto_146106 ) ) ( not ( = ?auto_146101 ?auto_146107 ) ) ( not ( = ?auto_146101 ?auto_146106 ) ) ( not ( = ?auto_146102 ?auto_146107 ) ) ( not ( = ?auto_146102 ?auto_146106 ) ) ( ON ?auto_146102 ?auto_146103 ) ( CLEAR ?auto_146100 ) ( ON ?auto_146101 ?auto_146102 ) ( CLEAR ?auto_146101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146107 ?auto_146106 ?auto_146105 ?auto_146104 ?auto_146103 ?auto_146102 )
      ( MAKE-6PILE ?auto_146099 ?auto_146100 ?auto_146101 ?auto_146102 ?auto_146103 ?auto_146104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146108 - BLOCK
      ?auto_146109 - BLOCK
      ?auto_146110 - BLOCK
      ?auto_146111 - BLOCK
      ?auto_146112 - BLOCK
      ?auto_146113 - BLOCK
    )
    :vars
    (
      ?auto_146116 - BLOCK
      ?auto_146115 - BLOCK
      ?auto_146114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146108 ) ( not ( = ?auto_146108 ?auto_146109 ) ) ( not ( = ?auto_146108 ?auto_146110 ) ) ( not ( = ?auto_146108 ?auto_146111 ) ) ( not ( = ?auto_146108 ?auto_146112 ) ) ( not ( = ?auto_146108 ?auto_146113 ) ) ( not ( = ?auto_146109 ?auto_146110 ) ) ( not ( = ?auto_146109 ?auto_146111 ) ) ( not ( = ?auto_146109 ?auto_146112 ) ) ( not ( = ?auto_146109 ?auto_146113 ) ) ( not ( = ?auto_146110 ?auto_146111 ) ) ( not ( = ?auto_146110 ?auto_146112 ) ) ( not ( = ?auto_146110 ?auto_146113 ) ) ( not ( = ?auto_146111 ?auto_146112 ) ) ( not ( = ?auto_146111 ?auto_146113 ) ) ( not ( = ?auto_146112 ?auto_146113 ) ) ( ON ?auto_146113 ?auto_146116 ) ( not ( = ?auto_146108 ?auto_146116 ) ) ( not ( = ?auto_146109 ?auto_146116 ) ) ( not ( = ?auto_146110 ?auto_146116 ) ) ( not ( = ?auto_146111 ?auto_146116 ) ) ( not ( = ?auto_146112 ?auto_146116 ) ) ( not ( = ?auto_146113 ?auto_146116 ) ) ( ON ?auto_146112 ?auto_146113 ) ( ON-TABLE ?auto_146115 ) ( ON ?auto_146114 ?auto_146115 ) ( ON ?auto_146116 ?auto_146114 ) ( not ( = ?auto_146115 ?auto_146114 ) ) ( not ( = ?auto_146115 ?auto_146116 ) ) ( not ( = ?auto_146115 ?auto_146113 ) ) ( not ( = ?auto_146115 ?auto_146112 ) ) ( not ( = ?auto_146114 ?auto_146116 ) ) ( not ( = ?auto_146114 ?auto_146113 ) ) ( not ( = ?auto_146114 ?auto_146112 ) ) ( not ( = ?auto_146108 ?auto_146115 ) ) ( not ( = ?auto_146108 ?auto_146114 ) ) ( not ( = ?auto_146109 ?auto_146115 ) ) ( not ( = ?auto_146109 ?auto_146114 ) ) ( not ( = ?auto_146110 ?auto_146115 ) ) ( not ( = ?auto_146110 ?auto_146114 ) ) ( not ( = ?auto_146111 ?auto_146115 ) ) ( not ( = ?auto_146111 ?auto_146114 ) ) ( ON ?auto_146111 ?auto_146112 ) ( ON ?auto_146110 ?auto_146111 ) ( CLEAR ?auto_146110 ) ( HOLDING ?auto_146109 ) ( CLEAR ?auto_146108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146108 ?auto_146109 )
      ( MAKE-6PILE ?auto_146108 ?auto_146109 ?auto_146110 ?auto_146111 ?auto_146112 ?auto_146113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146117 - BLOCK
      ?auto_146118 - BLOCK
      ?auto_146119 - BLOCK
      ?auto_146120 - BLOCK
      ?auto_146121 - BLOCK
      ?auto_146122 - BLOCK
    )
    :vars
    (
      ?auto_146125 - BLOCK
      ?auto_146123 - BLOCK
      ?auto_146124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146117 ) ( not ( = ?auto_146117 ?auto_146118 ) ) ( not ( = ?auto_146117 ?auto_146119 ) ) ( not ( = ?auto_146117 ?auto_146120 ) ) ( not ( = ?auto_146117 ?auto_146121 ) ) ( not ( = ?auto_146117 ?auto_146122 ) ) ( not ( = ?auto_146118 ?auto_146119 ) ) ( not ( = ?auto_146118 ?auto_146120 ) ) ( not ( = ?auto_146118 ?auto_146121 ) ) ( not ( = ?auto_146118 ?auto_146122 ) ) ( not ( = ?auto_146119 ?auto_146120 ) ) ( not ( = ?auto_146119 ?auto_146121 ) ) ( not ( = ?auto_146119 ?auto_146122 ) ) ( not ( = ?auto_146120 ?auto_146121 ) ) ( not ( = ?auto_146120 ?auto_146122 ) ) ( not ( = ?auto_146121 ?auto_146122 ) ) ( ON ?auto_146122 ?auto_146125 ) ( not ( = ?auto_146117 ?auto_146125 ) ) ( not ( = ?auto_146118 ?auto_146125 ) ) ( not ( = ?auto_146119 ?auto_146125 ) ) ( not ( = ?auto_146120 ?auto_146125 ) ) ( not ( = ?auto_146121 ?auto_146125 ) ) ( not ( = ?auto_146122 ?auto_146125 ) ) ( ON ?auto_146121 ?auto_146122 ) ( ON-TABLE ?auto_146123 ) ( ON ?auto_146124 ?auto_146123 ) ( ON ?auto_146125 ?auto_146124 ) ( not ( = ?auto_146123 ?auto_146124 ) ) ( not ( = ?auto_146123 ?auto_146125 ) ) ( not ( = ?auto_146123 ?auto_146122 ) ) ( not ( = ?auto_146123 ?auto_146121 ) ) ( not ( = ?auto_146124 ?auto_146125 ) ) ( not ( = ?auto_146124 ?auto_146122 ) ) ( not ( = ?auto_146124 ?auto_146121 ) ) ( not ( = ?auto_146117 ?auto_146123 ) ) ( not ( = ?auto_146117 ?auto_146124 ) ) ( not ( = ?auto_146118 ?auto_146123 ) ) ( not ( = ?auto_146118 ?auto_146124 ) ) ( not ( = ?auto_146119 ?auto_146123 ) ) ( not ( = ?auto_146119 ?auto_146124 ) ) ( not ( = ?auto_146120 ?auto_146123 ) ) ( not ( = ?auto_146120 ?auto_146124 ) ) ( ON ?auto_146120 ?auto_146121 ) ( ON ?auto_146119 ?auto_146120 ) ( CLEAR ?auto_146117 ) ( ON ?auto_146118 ?auto_146119 ) ( CLEAR ?auto_146118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146123 ?auto_146124 ?auto_146125 ?auto_146122 ?auto_146121 ?auto_146120 ?auto_146119 )
      ( MAKE-6PILE ?auto_146117 ?auto_146118 ?auto_146119 ?auto_146120 ?auto_146121 ?auto_146122 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146126 - BLOCK
      ?auto_146127 - BLOCK
      ?auto_146128 - BLOCK
      ?auto_146129 - BLOCK
      ?auto_146130 - BLOCK
      ?auto_146131 - BLOCK
    )
    :vars
    (
      ?auto_146133 - BLOCK
      ?auto_146132 - BLOCK
      ?auto_146134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146126 ?auto_146127 ) ) ( not ( = ?auto_146126 ?auto_146128 ) ) ( not ( = ?auto_146126 ?auto_146129 ) ) ( not ( = ?auto_146126 ?auto_146130 ) ) ( not ( = ?auto_146126 ?auto_146131 ) ) ( not ( = ?auto_146127 ?auto_146128 ) ) ( not ( = ?auto_146127 ?auto_146129 ) ) ( not ( = ?auto_146127 ?auto_146130 ) ) ( not ( = ?auto_146127 ?auto_146131 ) ) ( not ( = ?auto_146128 ?auto_146129 ) ) ( not ( = ?auto_146128 ?auto_146130 ) ) ( not ( = ?auto_146128 ?auto_146131 ) ) ( not ( = ?auto_146129 ?auto_146130 ) ) ( not ( = ?auto_146129 ?auto_146131 ) ) ( not ( = ?auto_146130 ?auto_146131 ) ) ( ON ?auto_146131 ?auto_146133 ) ( not ( = ?auto_146126 ?auto_146133 ) ) ( not ( = ?auto_146127 ?auto_146133 ) ) ( not ( = ?auto_146128 ?auto_146133 ) ) ( not ( = ?auto_146129 ?auto_146133 ) ) ( not ( = ?auto_146130 ?auto_146133 ) ) ( not ( = ?auto_146131 ?auto_146133 ) ) ( ON ?auto_146130 ?auto_146131 ) ( ON-TABLE ?auto_146132 ) ( ON ?auto_146134 ?auto_146132 ) ( ON ?auto_146133 ?auto_146134 ) ( not ( = ?auto_146132 ?auto_146134 ) ) ( not ( = ?auto_146132 ?auto_146133 ) ) ( not ( = ?auto_146132 ?auto_146131 ) ) ( not ( = ?auto_146132 ?auto_146130 ) ) ( not ( = ?auto_146134 ?auto_146133 ) ) ( not ( = ?auto_146134 ?auto_146131 ) ) ( not ( = ?auto_146134 ?auto_146130 ) ) ( not ( = ?auto_146126 ?auto_146132 ) ) ( not ( = ?auto_146126 ?auto_146134 ) ) ( not ( = ?auto_146127 ?auto_146132 ) ) ( not ( = ?auto_146127 ?auto_146134 ) ) ( not ( = ?auto_146128 ?auto_146132 ) ) ( not ( = ?auto_146128 ?auto_146134 ) ) ( not ( = ?auto_146129 ?auto_146132 ) ) ( not ( = ?auto_146129 ?auto_146134 ) ) ( ON ?auto_146129 ?auto_146130 ) ( ON ?auto_146128 ?auto_146129 ) ( ON ?auto_146127 ?auto_146128 ) ( CLEAR ?auto_146127 ) ( HOLDING ?auto_146126 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146126 )
      ( MAKE-6PILE ?auto_146126 ?auto_146127 ?auto_146128 ?auto_146129 ?auto_146130 ?auto_146131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146135 - BLOCK
      ?auto_146136 - BLOCK
      ?auto_146137 - BLOCK
      ?auto_146138 - BLOCK
      ?auto_146139 - BLOCK
      ?auto_146140 - BLOCK
    )
    :vars
    (
      ?auto_146141 - BLOCK
      ?auto_146143 - BLOCK
      ?auto_146142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146135 ?auto_146136 ) ) ( not ( = ?auto_146135 ?auto_146137 ) ) ( not ( = ?auto_146135 ?auto_146138 ) ) ( not ( = ?auto_146135 ?auto_146139 ) ) ( not ( = ?auto_146135 ?auto_146140 ) ) ( not ( = ?auto_146136 ?auto_146137 ) ) ( not ( = ?auto_146136 ?auto_146138 ) ) ( not ( = ?auto_146136 ?auto_146139 ) ) ( not ( = ?auto_146136 ?auto_146140 ) ) ( not ( = ?auto_146137 ?auto_146138 ) ) ( not ( = ?auto_146137 ?auto_146139 ) ) ( not ( = ?auto_146137 ?auto_146140 ) ) ( not ( = ?auto_146138 ?auto_146139 ) ) ( not ( = ?auto_146138 ?auto_146140 ) ) ( not ( = ?auto_146139 ?auto_146140 ) ) ( ON ?auto_146140 ?auto_146141 ) ( not ( = ?auto_146135 ?auto_146141 ) ) ( not ( = ?auto_146136 ?auto_146141 ) ) ( not ( = ?auto_146137 ?auto_146141 ) ) ( not ( = ?auto_146138 ?auto_146141 ) ) ( not ( = ?auto_146139 ?auto_146141 ) ) ( not ( = ?auto_146140 ?auto_146141 ) ) ( ON ?auto_146139 ?auto_146140 ) ( ON-TABLE ?auto_146143 ) ( ON ?auto_146142 ?auto_146143 ) ( ON ?auto_146141 ?auto_146142 ) ( not ( = ?auto_146143 ?auto_146142 ) ) ( not ( = ?auto_146143 ?auto_146141 ) ) ( not ( = ?auto_146143 ?auto_146140 ) ) ( not ( = ?auto_146143 ?auto_146139 ) ) ( not ( = ?auto_146142 ?auto_146141 ) ) ( not ( = ?auto_146142 ?auto_146140 ) ) ( not ( = ?auto_146142 ?auto_146139 ) ) ( not ( = ?auto_146135 ?auto_146143 ) ) ( not ( = ?auto_146135 ?auto_146142 ) ) ( not ( = ?auto_146136 ?auto_146143 ) ) ( not ( = ?auto_146136 ?auto_146142 ) ) ( not ( = ?auto_146137 ?auto_146143 ) ) ( not ( = ?auto_146137 ?auto_146142 ) ) ( not ( = ?auto_146138 ?auto_146143 ) ) ( not ( = ?auto_146138 ?auto_146142 ) ) ( ON ?auto_146138 ?auto_146139 ) ( ON ?auto_146137 ?auto_146138 ) ( ON ?auto_146136 ?auto_146137 ) ( ON ?auto_146135 ?auto_146136 ) ( CLEAR ?auto_146135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146143 ?auto_146142 ?auto_146141 ?auto_146140 ?auto_146139 ?auto_146138 ?auto_146137 ?auto_146136 )
      ( MAKE-6PILE ?auto_146135 ?auto_146136 ?auto_146137 ?auto_146138 ?auto_146139 ?auto_146140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146146 - BLOCK
      ?auto_146147 - BLOCK
    )
    :vars
    (
      ?auto_146148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146148 ?auto_146147 ) ( CLEAR ?auto_146148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146146 ) ( ON ?auto_146147 ?auto_146146 ) ( not ( = ?auto_146146 ?auto_146147 ) ) ( not ( = ?auto_146146 ?auto_146148 ) ) ( not ( = ?auto_146147 ?auto_146148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146148 ?auto_146147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146149 - BLOCK
      ?auto_146150 - BLOCK
    )
    :vars
    (
      ?auto_146151 - BLOCK
      ?auto_146152 - BLOCK
      ?auto_146153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146151 ?auto_146150 ) ( CLEAR ?auto_146151 ) ( ON-TABLE ?auto_146149 ) ( ON ?auto_146150 ?auto_146149 ) ( not ( = ?auto_146149 ?auto_146150 ) ) ( not ( = ?auto_146149 ?auto_146151 ) ) ( not ( = ?auto_146150 ?auto_146151 ) ) ( HOLDING ?auto_146152 ) ( CLEAR ?auto_146153 ) ( not ( = ?auto_146149 ?auto_146152 ) ) ( not ( = ?auto_146149 ?auto_146153 ) ) ( not ( = ?auto_146150 ?auto_146152 ) ) ( not ( = ?auto_146150 ?auto_146153 ) ) ( not ( = ?auto_146151 ?auto_146152 ) ) ( not ( = ?auto_146151 ?auto_146153 ) ) ( not ( = ?auto_146152 ?auto_146153 ) ) )
    :subtasks
    ( ( !STACK ?auto_146152 ?auto_146153 )
      ( MAKE-2PILE ?auto_146149 ?auto_146150 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146154 - BLOCK
      ?auto_146155 - BLOCK
    )
    :vars
    (
      ?auto_146157 - BLOCK
      ?auto_146158 - BLOCK
      ?auto_146156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146157 ?auto_146155 ) ( ON-TABLE ?auto_146154 ) ( ON ?auto_146155 ?auto_146154 ) ( not ( = ?auto_146154 ?auto_146155 ) ) ( not ( = ?auto_146154 ?auto_146157 ) ) ( not ( = ?auto_146155 ?auto_146157 ) ) ( CLEAR ?auto_146158 ) ( not ( = ?auto_146154 ?auto_146156 ) ) ( not ( = ?auto_146154 ?auto_146158 ) ) ( not ( = ?auto_146155 ?auto_146156 ) ) ( not ( = ?auto_146155 ?auto_146158 ) ) ( not ( = ?auto_146157 ?auto_146156 ) ) ( not ( = ?auto_146157 ?auto_146158 ) ) ( not ( = ?auto_146156 ?auto_146158 ) ) ( ON ?auto_146156 ?auto_146157 ) ( CLEAR ?auto_146156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146154 ?auto_146155 ?auto_146157 )
      ( MAKE-2PILE ?auto_146154 ?auto_146155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146159 - BLOCK
      ?auto_146160 - BLOCK
    )
    :vars
    (
      ?auto_146163 - BLOCK
      ?auto_146162 - BLOCK
      ?auto_146161 - BLOCK
      ?auto_146165 - BLOCK
      ?auto_146164 - BLOCK
      ?auto_146167 - BLOCK
      ?auto_146166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146163 ?auto_146160 ) ( ON-TABLE ?auto_146159 ) ( ON ?auto_146160 ?auto_146159 ) ( not ( = ?auto_146159 ?auto_146160 ) ) ( not ( = ?auto_146159 ?auto_146163 ) ) ( not ( = ?auto_146160 ?auto_146163 ) ) ( not ( = ?auto_146159 ?auto_146162 ) ) ( not ( = ?auto_146159 ?auto_146161 ) ) ( not ( = ?auto_146160 ?auto_146162 ) ) ( not ( = ?auto_146160 ?auto_146161 ) ) ( not ( = ?auto_146163 ?auto_146162 ) ) ( not ( = ?auto_146163 ?auto_146161 ) ) ( not ( = ?auto_146162 ?auto_146161 ) ) ( ON ?auto_146162 ?auto_146163 ) ( CLEAR ?auto_146162 ) ( HOLDING ?auto_146161 ) ( CLEAR ?auto_146165 ) ( ON-TABLE ?auto_146164 ) ( ON ?auto_146167 ?auto_146164 ) ( ON ?auto_146166 ?auto_146167 ) ( ON ?auto_146165 ?auto_146166 ) ( not ( = ?auto_146164 ?auto_146167 ) ) ( not ( = ?auto_146164 ?auto_146166 ) ) ( not ( = ?auto_146164 ?auto_146165 ) ) ( not ( = ?auto_146164 ?auto_146161 ) ) ( not ( = ?auto_146167 ?auto_146166 ) ) ( not ( = ?auto_146167 ?auto_146165 ) ) ( not ( = ?auto_146167 ?auto_146161 ) ) ( not ( = ?auto_146166 ?auto_146165 ) ) ( not ( = ?auto_146166 ?auto_146161 ) ) ( not ( = ?auto_146165 ?auto_146161 ) ) ( not ( = ?auto_146159 ?auto_146165 ) ) ( not ( = ?auto_146159 ?auto_146164 ) ) ( not ( = ?auto_146159 ?auto_146167 ) ) ( not ( = ?auto_146159 ?auto_146166 ) ) ( not ( = ?auto_146160 ?auto_146165 ) ) ( not ( = ?auto_146160 ?auto_146164 ) ) ( not ( = ?auto_146160 ?auto_146167 ) ) ( not ( = ?auto_146160 ?auto_146166 ) ) ( not ( = ?auto_146163 ?auto_146165 ) ) ( not ( = ?auto_146163 ?auto_146164 ) ) ( not ( = ?auto_146163 ?auto_146167 ) ) ( not ( = ?auto_146163 ?auto_146166 ) ) ( not ( = ?auto_146162 ?auto_146165 ) ) ( not ( = ?auto_146162 ?auto_146164 ) ) ( not ( = ?auto_146162 ?auto_146167 ) ) ( not ( = ?auto_146162 ?auto_146166 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146164 ?auto_146167 ?auto_146166 ?auto_146165 ?auto_146161 )
      ( MAKE-2PILE ?auto_146159 ?auto_146160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146168 - BLOCK
      ?auto_146169 - BLOCK
    )
    :vars
    (
      ?auto_146175 - BLOCK
      ?auto_146172 - BLOCK
      ?auto_146173 - BLOCK
      ?auto_146171 - BLOCK
      ?auto_146174 - BLOCK
      ?auto_146170 - BLOCK
      ?auto_146176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146175 ?auto_146169 ) ( ON-TABLE ?auto_146168 ) ( ON ?auto_146169 ?auto_146168 ) ( not ( = ?auto_146168 ?auto_146169 ) ) ( not ( = ?auto_146168 ?auto_146175 ) ) ( not ( = ?auto_146169 ?auto_146175 ) ) ( not ( = ?auto_146168 ?auto_146172 ) ) ( not ( = ?auto_146168 ?auto_146173 ) ) ( not ( = ?auto_146169 ?auto_146172 ) ) ( not ( = ?auto_146169 ?auto_146173 ) ) ( not ( = ?auto_146175 ?auto_146172 ) ) ( not ( = ?auto_146175 ?auto_146173 ) ) ( not ( = ?auto_146172 ?auto_146173 ) ) ( ON ?auto_146172 ?auto_146175 ) ( CLEAR ?auto_146171 ) ( ON-TABLE ?auto_146174 ) ( ON ?auto_146170 ?auto_146174 ) ( ON ?auto_146176 ?auto_146170 ) ( ON ?auto_146171 ?auto_146176 ) ( not ( = ?auto_146174 ?auto_146170 ) ) ( not ( = ?auto_146174 ?auto_146176 ) ) ( not ( = ?auto_146174 ?auto_146171 ) ) ( not ( = ?auto_146174 ?auto_146173 ) ) ( not ( = ?auto_146170 ?auto_146176 ) ) ( not ( = ?auto_146170 ?auto_146171 ) ) ( not ( = ?auto_146170 ?auto_146173 ) ) ( not ( = ?auto_146176 ?auto_146171 ) ) ( not ( = ?auto_146176 ?auto_146173 ) ) ( not ( = ?auto_146171 ?auto_146173 ) ) ( not ( = ?auto_146168 ?auto_146171 ) ) ( not ( = ?auto_146168 ?auto_146174 ) ) ( not ( = ?auto_146168 ?auto_146170 ) ) ( not ( = ?auto_146168 ?auto_146176 ) ) ( not ( = ?auto_146169 ?auto_146171 ) ) ( not ( = ?auto_146169 ?auto_146174 ) ) ( not ( = ?auto_146169 ?auto_146170 ) ) ( not ( = ?auto_146169 ?auto_146176 ) ) ( not ( = ?auto_146175 ?auto_146171 ) ) ( not ( = ?auto_146175 ?auto_146174 ) ) ( not ( = ?auto_146175 ?auto_146170 ) ) ( not ( = ?auto_146175 ?auto_146176 ) ) ( not ( = ?auto_146172 ?auto_146171 ) ) ( not ( = ?auto_146172 ?auto_146174 ) ) ( not ( = ?auto_146172 ?auto_146170 ) ) ( not ( = ?auto_146172 ?auto_146176 ) ) ( ON ?auto_146173 ?auto_146172 ) ( CLEAR ?auto_146173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146168 ?auto_146169 ?auto_146175 ?auto_146172 )
      ( MAKE-2PILE ?auto_146168 ?auto_146169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146177 - BLOCK
      ?auto_146178 - BLOCK
    )
    :vars
    (
      ?auto_146182 - BLOCK
      ?auto_146179 - BLOCK
      ?auto_146184 - BLOCK
      ?auto_146181 - BLOCK
      ?auto_146183 - BLOCK
      ?auto_146185 - BLOCK
      ?auto_146180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146182 ?auto_146178 ) ( ON-TABLE ?auto_146177 ) ( ON ?auto_146178 ?auto_146177 ) ( not ( = ?auto_146177 ?auto_146178 ) ) ( not ( = ?auto_146177 ?auto_146182 ) ) ( not ( = ?auto_146178 ?auto_146182 ) ) ( not ( = ?auto_146177 ?auto_146179 ) ) ( not ( = ?auto_146177 ?auto_146184 ) ) ( not ( = ?auto_146178 ?auto_146179 ) ) ( not ( = ?auto_146178 ?auto_146184 ) ) ( not ( = ?auto_146182 ?auto_146179 ) ) ( not ( = ?auto_146182 ?auto_146184 ) ) ( not ( = ?auto_146179 ?auto_146184 ) ) ( ON ?auto_146179 ?auto_146182 ) ( ON-TABLE ?auto_146181 ) ( ON ?auto_146183 ?auto_146181 ) ( ON ?auto_146185 ?auto_146183 ) ( not ( = ?auto_146181 ?auto_146183 ) ) ( not ( = ?auto_146181 ?auto_146185 ) ) ( not ( = ?auto_146181 ?auto_146180 ) ) ( not ( = ?auto_146181 ?auto_146184 ) ) ( not ( = ?auto_146183 ?auto_146185 ) ) ( not ( = ?auto_146183 ?auto_146180 ) ) ( not ( = ?auto_146183 ?auto_146184 ) ) ( not ( = ?auto_146185 ?auto_146180 ) ) ( not ( = ?auto_146185 ?auto_146184 ) ) ( not ( = ?auto_146180 ?auto_146184 ) ) ( not ( = ?auto_146177 ?auto_146180 ) ) ( not ( = ?auto_146177 ?auto_146181 ) ) ( not ( = ?auto_146177 ?auto_146183 ) ) ( not ( = ?auto_146177 ?auto_146185 ) ) ( not ( = ?auto_146178 ?auto_146180 ) ) ( not ( = ?auto_146178 ?auto_146181 ) ) ( not ( = ?auto_146178 ?auto_146183 ) ) ( not ( = ?auto_146178 ?auto_146185 ) ) ( not ( = ?auto_146182 ?auto_146180 ) ) ( not ( = ?auto_146182 ?auto_146181 ) ) ( not ( = ?auto_146182 ?auto_146183 ) ) ( not ( = ?auto_146182 ?auto_146185 ) ) ( not ( = ?auto_146179 ?auto_146180 ) ) ( not ( = ?auto_146179 ?auto_146181 ) ) ( not ( = ?auto_146179 ?auto_146183 ) ) ( not ( = ?auto_146179 ?auto_146185 ) ) ( ON ?auto_146184 ?auto_146179 ) ( CLEAR ?auto_146184 ) ( HOLDING ?auto_146180 ) ( CLEAR ?auto_146185 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146181 ?auto_146183 ?auto_146185 ?auto_146180 )
      ( MAKE-2PILE ?auto_146177 ?auto_146178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146186 - BLOCK
      ?auto_146187 - BLOCK
    )
    :vars
    (
      ?auto_146193 - BLOCK
      ?auto_146188 - BLOCK
      ?auto_146189 - BLOCK
      ?auto_146192 - BLOCK
      ?auto_146190 - BLOCK
      ?auto_146194 - BLOCK
      ?auto_146191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146193 ?auto_146187 ) ( ON-TABLE ?auto_146186 ) ( ON ?auto_146187 ?auto_146186 ) ( not ( = ?auto_146186 ?auto_146187 ) ) ( not ( = ?auto_146186 ?auto_146193 ) ) ( not ( = ?auto_146187 ?auto_146193 ) ) ( not ( = ?auto_146186 ?auto_146188 ) ) ( not ( = ?auto_146186 ?auto_146189 ) ) ( not ( = ?auto_146187 ?auto_146188 ) ) ( not ( = ?auto_146187 ?auto_146189 ) ) ( not ( = ?auto_146193 ?auto_146188 ) ) ( not ( = ?auto_146193 ?auto_146189 ) ) ( not ( = ?auto_146188 ?auto_146189 ) ) ( ON ?auto_146188 ?auto_146193 ) ( ON-TABLE ?auto_146192 ) ( ON ?auto_146190 ?auto_146192 ) ( ON ?auto_146194 ?auto_146190 ) ( not ( = ?auto_146192 ?auto_146190 ) ) ( not ( = ?auto_146192 ?auto_146194 ) ) ( not ( = ?auto_146192 ?auto_146191 ) ) ( not ( = ?auto_146192 ?auto_146189 ) ) ( not ( = ?auto_146190 ?auto_146194 ) ) ( not ( = ?auto_146190 ?auto_146191 ) ) ( not ( = ?auto_146190 ?auto_146189 ) ) ( not ( = ?auto_146194 ?auto_146191 ) ) ( not ( = ?auto_146194 ?auto_146189 ) ) ( not ( = ?auto_146191 ?auto_146189 ) ) ( not ( = ?auto_146186 ?auto_146191 ) ) ( not ( = ?auto_146186 ?auto_146192 ) ) ( not ( = ?auto_146186 ?auto_146190 ) ) ( not ( = ?auto_146186 ?auto_146194 ) ) ( not ( = ?auto_146187 ?auto_146191 ) ) ( not ( = ?auto_146187 ?auto_146192 ) ) ( not ( = ?auto_146187 ?auto_146190 ) ) ( not ( = ?auto_146187 ?auto_146194 ) ) ( not ( = ?auto_146193 ?auto_146191 ) ) ( not ( = ?auto_146193 ?auto_146192 ) ) ( not ( = ?auto_146193 ?auto_146190 ) ) ( not ( = ?auto_146193 ?auto_146194 ) ) ( not ( = ?auto_146188 ?auto_146191 ) ) ( not ( = ?auto_146188 ?auto_146192 ) ) ( not ( = ?auto_146188 ?auto_146190 ) ) ( not ( = ?auto_146188 ?auto_146194 ) ) ( ON ?auto_146189 ?auto_146188 ) ( CLEAR ?auto_146194 ) ( ON ?auto_146191 ?auto_146189 ) ( CLEAR ?auto_146191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146186 ?auto_146187 ?auto_146193 ?auto_146188 ?auto_146189 )
      ( MAKE-2PILE ?auto_146186 ?auto_146187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146195 - BLOCK
      ?auto_146196 - BLOCK
    )
    :vars
    (
      ?auto_146203 - BLOCK
      ?auto_146199 - BLOCK
      ?auto_146197 - BLOCK
      ?auto_146201 - BLOCK
      ?auto_146198 - BLOCK
      ?auto_146202 - BLOCK
      ?auto_146200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146203 ?auto_146196 ) ( ON-TABLE ?auto_146195 ) ( ON ?auto_146196 ?auto_146195 ) ( not ( = ?auto_146195 ?auto_146196 ) ) ( not ( = ?auto_146195 ?auto_146203 ) ) ( not ( = ?auto_146196 ?auto_146203 ) ) ( not ( = ?auto_146195 ?auto_146199 ) ) ( not ( = ?auto_146195 ?auto_146197 ) ) ( not ( = ?auto_146196 ?auto_146199 ) ) ( not ( = ?auto_146196 ?auto_146197 ) ) ( not ( = ?auto_146203 ?auto_146199 ) ) ( not ( = ?auto_146203 ?auto_146197 ) ) ( not ( = ?auto_146199 ?auto_146197 ) ) ( ON ?auto_146199 ?auto_146203 ) ( ON-TABLE ?auto_146201 ) ( ON ?auto_146198 ?auto_146201 ) ( not ( = ?auto_146201 ?auto_146198 ) ) ( not ( = ?auto_146201 ?auto_146202 ) ) ( not ( = ?auto_146201 ?auto_146200 ) ) ( not ( = ?auto_146201 ?auto_146197 ) ) ( not ( = ?auto_146198 ?auto_146202 ) ) ( not ( = ?auto_146198 ?auto_146200 ) ) ( not ( = ?auto_146198 ?auto_146197 ) ) ( not ( = ?auto_146202 ?auto_146200 ) ) ( not ( = ?auto_146202 ?auto_146197 ) ) ( not ( = ?auto_146200 ?auto_146197 ) ) ( not ( = ?auto_146195 ?auto_146200 ) ) ( not ( = ?auto_146195 ?auto_146201 ) ) ( not ( = ?auto_146195 ?auto_146198 ) ) ( not ( = ?auto_146195 ?auto_146202 ) ) ( not ( = ?auto_146196 ?auto_146200 ) ) ( not ( = ?auto_146196 ?auto_146201 ) ) ( not ( = ?auto_146196 ?auto_146198 ) ) ( not ( = ?auto_146196 ?auto_146202 ) ) ( not ( = ?auto_146203 ?auto_146200 ) ) ( not ( = ?auto_146203 ?auto_146201 ) ) ( not ( = ?auto_146203 ?auto_146198 ) ) ( not ( = ?auto_146203 ?auto_146202 ) ) ( not ( = ?auto_146199 ?auto_146200 ) ) ( not ( = ?auto_146199 ?auto_146201 ) ) ( not ( = ?auto_146199 ?auto_146198 ) ) ( not ( = ?auto_146199 ?auto_146202 ) ) ( ON ?auto_146197 ?auto_146199 ) ( ON ?auto_146200 ?auto_146197 ) ( CLEAR ?auto_146200 ) ( HOLDING ?auto_146202 ) ( CLEAR ?auto_146198 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146201 ?auto_146198 ?auto_146202 )
      ( MAKE-2PILE ?auto_146195 ?auto_146196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146204 - BLOCK
      ?auto_146205 - BLOCK
    )
    :vars
    (
      ?auto_146212 - BLOCK
      ?auto_146206 - BLOCK
      ?auto_146211 - BLOCK
      ?auto_146208 - BLOCK
      ?auto_146209 - BLOCK
      ?auto_146207 - BLOCK
      ?auto_146210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146212 ?auto_146205 ) ( ON-TABLE ?auto_146204 ) ( ON ?auto_146205 ?auto_146204 ) ( not ( = ?auto_146204 ?auto_146205 ) ) ( not ( = ?auto_146204 ?auto_146212 ) ) ( not ( = ?auto_146205 ?auto_146212 ) ) ( not ( = ?auto_146204 ?auto_146206 ) ) ( not ( = ?auto_146204 ?auto_146211 ) ) ( not ( = ?auto_146205 ?auto_146206 ) ) ( not ( = ?auto_146205 ?auto_146211 ) ) ( not ( = ?auto_146212 ?auto_146206 ) ) ( not ( = ?auto_146212 ?auto_146211 ) ) ( not ( = ?auto_146206 ?auto_146211 ) ) ( ON ?auto_146206 ?auto_146212 ) ( ON-TABLE ?auto_146208 ) ( ON ?auto_146209 ?auto_146208 ) ( not ( = ?auto_146208 ?auto_146209 ) ) ( not ( = ?auto_146208 ?auto_146207 ) ) ( not ( = ?auto_146208 ?auto_146210 ) ) ( not ( = ?auto_146208 ?auto_146211 ) ) ( not ( = ?auto_146209 ?auto_146207 ) ) ( not ( = ?auto_146209 ?auto_146210 ) ) ( not ( = ?auto_146209 ?auto_146211 ) ) ( not ( = ?auto_146207 ?auto_146210 ) ) ( not ( = ?auto_146207 ?auto_146211 ) ) ( not ( = ?auto_146210 ?auto_146211 ) ) ( not ( = ?auto_146204 ?auto_146210 ) ) ( not ( = ?auto_146204 ?auto_146208 ) ) ( not ( = ?auto_146204 ?auto_146209 ) ) ( not ( = ?auto_146204 ?auto_146207 ) ) ( not ( = ?auto_146205 ?auto_146210 ) ) ( not ( = ?auto_146205 ?auto_146208 ) ) ( not ( = ?auto_146205 ?auto_146209 ) ) ( not ( = ?auto_146205 ?auto_146207 ) ) ( not ( = ?auto_146212 ?auto_146210 ) ) ( not ( = ?auto_146212 ?auto_146208 ) ) ( not ( = ?auto_146212 ?auto_146209 ) ) ( not ( = ?auto_146212 ?auto_146207 ) ) ( not ( = ?auto_146206 ?auto_146210 ) ) ( not ( = ?auto_146206 ?auto_146208 ) ) ( not ( = ?auto_146206 ?auto_146209 ) ) ( not ( = ?auto_146206 ?auto_146207 ) ) ( ON ?auto_146211 ?auto_146206 ) ( ON ?auto_146210 ?auto_146211 ) ( CLEAR ?auto_146209 ) ( ON ?auto_146207 ?auto_146210 ) ( CLEAR ?auto_146207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146204 ?auto_146205 ?auto_146212 ?auto_146206 ?auto_146211 ?auto_146210 )
      ( MAKE-2PILE ?auto_146204 ?auto_146205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146213 - BLOCK
      ?auto_146214 - BLOCK
    )
    :vars
    (
      ?auto_146219 - BLOCK
      ?auto_146221 - BLOCK
      ?auto_146217 - BLOCK
      ?auto_146215 - BLOCK
      ?auto_146218 - BLOCK
      ?auto_146216 - BLOCK
      ?auto_146220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146219 ?auto_146214 ) ( ON-TABLE ?auto_146213 ) ( ON ?auto_146214 ?auto_146213 ) ( not ( = ?auto_146213 ?auto_146214 ) ) ( not ( = ?auto_146213 ?auto_146219 ) ) ( not ( = ?auto_146214 ?auto_146219 ) ) ( not ( = ?auto_146213 ?auto_146221 ) ) ( not ( = ?auto_146213 ?auto_146217 ) ) ( not ( = ?auto_146214 ?auto_146221 ) ) ( not ( = ?auto_146214 ?auto_146217 ) ) ( not ( = ?auto_146219 ?auto_146221 ) ) ( not ( = ?auto_146219 ?auto_146217 ) ) ( not ( = ?auto_146221 ?auto_146217 ) ) ( ON ?auto_146221 ?auto_146219 ) ( ON-TABLE ?auto_146215 ) ( not ( = ?auto_146215 ?auto_146218 ) ) ( not ( = ?auto_146215 ?auto_146216 ) ) ( not ( = ?auto_146215 ?auto_146220 ) ) ( not ( = ?auto_146215 ?auto_146217 ) ) ( not ( = ?auto_146218 ?auto_146216 ) ) ( not ( = ?auto_146218 ?auto_146220 ) ) ( not ( = ?auto_146218 ?auto_146217 ) ) ( not ( = ?auto_146216 ?auto_146220 ) ) ( not ( = ?auto_146216 ?auto_146217 ) ) ( not ( = ?auto_146220 ?auto_146217 ) ) ( not ( = ?auto_146213 ?auto_146220 ) ) ( not ( = ?auto_146213 ?auto_146215 ) ) ( not ( = ?auto_146213 ?auto_146218 ) ) ( not ( = ?auto_146213 ?auto_146216 ) ) ( not ( = ?auto_146214 ?auto_146220 ) ) ( not ( = ?auto_146214 ?auto_146215 ) ) ( not ( = ?auto_146214 ?auto_146218 ) ) ( not ( = ?auto_146214 ?auto_146216 ) ) ( not ( = ?auto_146219 ?auto_146220 ) ) ( not ( = ?auto_146219 ?auto_146215 ) ) ( not ( = ?auto_146219 ?auto_146218 ) ) ( not ( = ?auto_146219 ?auto_146216 ) ) ( not ( = ?auto_146221 ?auto_146220 ) ) ( not ( = ?auto_146221 ?auto_146215 ) ) ( not ( = ?auto_146221 ?auto_146218 ) ) ( not ( = ?auto_146221 ?auto_146216 ) ) ( ON ?auto_146217 ?auto_146221 ) ( ON ?auto_146220 ?auto_146217 ) ( ON ?auto_146216 ?auto_146220 ) ( CLEAR ?auto_146216 ) ( HOLDING ?auto_146218 ) ( CLEAR ?auto_146215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146215 ?auto_146218 )
      ( MAKE-2PILE ?auto_146213 ?auto_146214 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146222 - BLOCK
      ?auto_146223 - BLOCK
    )
    :vars
    (
      ?auto_146226 - BLOCK
      ?auto_146227 - BLOCK
      ?auto_146229 - BLOCK
      ?auto_146230 - BLOCK
      ?auto_146224 - BLOCK
      ?auto_146228 - BLOCK
      ?auto_146225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146226 ?auto_146223 ) ( ON-TABLE ?auto_146222 ) ( ON ?auto_146223 ?auto_146222 ) ( not ( = ?auto_146222 ?auto_146223 ) ) ( not ( = ?auto_146222 ?auto_146226 ) ) ( not ( = ?auto_146223 ?auto_146226 ) ) ( not ( = ?auto_146222 ?auto_146227 ) ) ( not ( = ?auto_146222 ?auto_146229 ) ) ( not ( = ?auto_146223 ?auto_146227 ) ) ( not ( = ?auto_146223 ?auto_146229 ) ) ( not ( = ?auto_146226 ?auto_146227 ) ) ( not ( = ?auto_146226 ?auto_146229 ) ) ( not ( = ?auto_146227 ?auto_146229 ) ) ( ON ?auto_146227 ?auto_146226 ) ( ON-TABLE ?auto_146230 ) ( not ( = ?auto_146230 ?auto_146224 ) ) ( not ( = ?auto_146230 ?auto_146228 ) ) ( not ( = ?auto_146230 ?auto_146225 ) ) ( not ( = ?auto_146230 ?auto_146229 ) ) ( not ( = ?auto_146224 ?auto_146228 ) ) ( not ( = ?auto_146224 ?auto_146225 ) ) ( not ( = ?auto_146224 ?auto_146229 ) ) ( not ( = ?auto_146228 ?auto_146225 ) ) ( not ( = ?auto_146228 ?auto_146229 ) ) ( not ( = ?auto_146225 ?auto_146229 ) ) ( not ( = ?auto_146222 ?auto_146225 ) ) ( not ( = ?auto_146222 ?auto_146230 ) ) ( not ( = ?auto_146222 ?auto_146224 ) ) ( not ( = ?auto_146222 ?auto_146228 ) ) ( not ( = ?auto_146223 ?auto_146225 ) ) ( not ( = ?auto_146223 ?auto_146230 ) ) ( not ( = ?auto_146223 ?auto_146224 ) ) ( not ( = ?auto_146223 ?auto_146228 ) ) ( not ( = ?auto_146226 ?auto_146225 ) ) ( not ( = ?auto_146226 ?auto_146230 ) ) ( not ( = ?auto_146226 ?auto_146224 ) ) ( not ( = ?auto_146226 ?auto_146228 ) ) ( not ( = ?auto_146227 ?auto_146225 ) ) ( not ( = ?auto_146227 ?auto_146230 ) ) ( not ( = ?auto_146227 ?auto_146224 ) ) ( not ( = ?auto_146227 ?auto_146228 ) ) ( ON ?auto_146229 ?auto_146227 ) ( ON ?auto_146225 ?auto_146229 ) ( ON ?auto_146228 ?auto_146225 ) ( CLEAR ?auto_146230 ) ( ON ?auto_146224 ?auto_146228 ) ( CLEAR ?auto_146224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146222 ?auto_146223 ?auto_146226 ?auto_146227 ?auto_146229 ?auto_146225 ?auto_146228 )
      ( MAKE-2PILE ?auto_146222 ?auto_146223 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146231 - BLOCK
      ?auto_146232 - BLOCK
    )
    :vars
    (
      ?auto_146239 - BLOCK
      ?auto_146233 - BLOCK
      ?auto_146235 - BLOCK
      ?auto_146234 - BLOCK
      ?auto_146237 - BLOCK
      ?auto_146238 - BLOCK
      ?auto_146236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146239 ?auto_146232 ) ( ON-TABLE ?auto_146231 ) ( ON ?auto_146232 ?auto_146231 ) ( not ( = ?auto_146231 ?auto_146232 ) ) ( not ( = ?auto_146231 ?auto_146239 ) ) ( not ( = ?auto_146232 ?auto_146239 ) ) ( not ( = ?auto_146231 ?auto_146233 ) ) ( not ( = ?auto_146231 ?auto_146235 ) ) ( not ( = ?auto_146232 ?auto_146233 ) ) ( not ( = ?auto_146232 ?auto_146235 ) ) ( not ( = ?auto_146239 ?auto_146233 ) ) ( not ( = ?auto_146239 ?auto_146235 ) ) ( not ( = ?auto_146233 ?auto_146235 ) ) ( ON ?auto_146233 ?auto_146239 ) ( not ( = ?auto_146234 ?auto_146237 ) ) ( not ( = ?auto_146234 ?auto_146238 ) ) ( not ( = ?auto_146234 ?auto_146236 ) ) ( not ( = ?auto_146234 ?auto_146235 ) ) ( not ( = ?auto_146237 ?auto_146238 ) ) ( not ( = ?auto_146237 ?auto_146236 ) ) ( not ( = ?auto_146237 ?auto_146235 ) ) ( not ( = ?auto_146238 ?auto_146236 ) ) ( not ( = ?auto_146238 ?auto_146235 ) ) ( not ( = ?auto_146236 ?auto_146235 ) ) ( not ( = ?auto_146231 ?auto_146236 ) ) ( not ( = ?auto_146231 ?auto_146234 ) ) ( not ( = ?auto_146231 ?auto_146237 ) ) ( not ( = ?auto_146231 ?auto_146238 ) ) ( not ( = ?auto_146232 ?auto_146236 ) ) ( not ( = ?auto_146232 ?auto_146234 ) ) ( not ( = ?auto_146232 ?auto_146237 ) ) ( not ( = ?auto_146232 ?auto_146238 ) ) ( not ( = ?auto_146239 ?auto_146236 ) ) ( not ( = ?auto_146239 ?auto_146234 ) ) ( not ( = ?auto_146239 ?auto_146237 ) ) ( not ( = ?auto_146239 ?auto_146238 ) ) ( not ( = ?auto_146233 ?auto_146236 ) ) ( not ( = ?auto_146233 ?auto_146234 ) ) ( not ( = ?auto_146233 ?auto_146237 ) ) ( not ( = ?auto_146233 ?auto_146238 ) ) ( ON ?auto_146235 ?auto_146233 ) ( ON ?auto_146236 ?auto_146235 ) ( ON ?auto_146238 ?auto_146236 ) ( ON ?auto_146237 ?auto_146238 ) ( CLEAR ?auto_146237 ) ( HOLDING ?auto_146234 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146234 )
      ( MAKE-2PILE ?auto_146231 ?auto_146232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_146240 - BLOCK
      ?auto_146241 - BLOCK
    )
    :vars
    (
      ?auto_146246 - BLOCK
      ?auto_146245 - BLOCK
      ?auto_146248 - BLOCK
      ?auto_146244 - BLOCK
      ?auto_146247 - BLOCK
      ?auto_146242 - BLOCK
      ?auto_146243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146246 ?auto_146241 ) ( ON-TABLE ?auto_146240 ) ( ON ?auto_146241 ?auto_146240 ) ( not ( = ?auto_146240 ?auto_146241 ) ) ( not ( = ?auto_146240 ?auto_146246 ) ) ( not ( = ?auto_146241 ?auto_146246 ) ) ( not ( = ?auto_146240 ?auto_146245 ) ) ( not ( = ?auto_146240 ?auto_146248 ) ) ( not ( = ?auto_146241 ?auto_146245 ) ) ( not ( = ?auto_146241 ?auto_146248 ) ) ( not ( = ?auto_146246 ?auto_146245 ) ) ( not ( = ?auto_146246 ?auto_146248 ) ) ( not ( = ?auto_146245 ?auto_146248 ) ) ( ON ?auto_146245 ?auto_146246 ) ( not ( = ?auto_146244 ?auto_146247 ) ) ( not ( = ?auto_146244 ?auto_146242 ) ) ( not ( = ?auto_146244 ?auto_146243 ) ) ( not ( = ?auto_146244 ?auto_146248 ) ) ( not ( = ?auto_146247 ?auto_146242 ) ) ( not ( = ?auto_146247 ?auto_146243 ) ) ( not ( = ?auto_146247 ?auto_146248 ) ) ( not ( = ?auto_146242 ?auto_146243 ) ) ( not ( = ?auto_146242 ?auto_146248 ) ) ( not ( = ?auto_146243 ?auto_146248 ) ) ( not ( = ?auto_146240 ?auto_146243 ) ) ( not ( = ?auto_146240 ?auto_146244 ) ) ( not ( = ?auto_146240 ?auto_146247 ) ) ( not ( = ?auto_146240 ?auto_146242 ) ) ( not ( = ?auto_146241 ?auto_146243 ) ) ( not ( = ?auto_146241 ?auto_146244 ) ) ( not ( = ?auto_146241 ?auto_146247 ) ) ( not ( = ?auto_146241 ?auto_146242 ) ) ( not ( = ?auto_146246 ?auto_146243 ) ) ( not ( = ?auto_146246 ?auto_146244 ) ) ( not ( = ?auto_146246 ?auto_146247 ) ) ( not ( = ?auto_146246 ?auto_146242 ) ) ( not ( = ?auto_146245 ?auto_146243 ) ) ( not ( = ?auto_146245 ?auto_146244 ) ) ( not ( = ?auto_146245 ?auto_146247 ) ) ( not ( = ?auto_146245 ?auto_146242 ) ) ( ON ?auto_146248 ?auto_146245 ) ( ON ?auto_146243 ?auto_146248 ) ( ON ?auto_146242 ?auto_146243 ) ( ON ?auto_146247 ?auto_146242 ) ( ON ?auto_146244 ?auto_146247 ) ( CLEAR ?auto_146244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146240 ?auto_146241 ?auto_146246 ?auto_146245 ?auto_146248 ?auto_146243 ?auto_146242 ?auto_146247 )
      ( MAKE-2PILE ?auto_146240 ?auto_146241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146256 - BLOCK
      ?auto_146257 - BLOCK
      ?auto_146258 - BLOCK
      ?auto_146259 - BLOCK
      ?auto_146260 - BLOCK
      ?auto_146261 - BLOCK
      ?auto_146262 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_146262 ) ( CLEAR ?auto_146261 ) ( ON-TABLE ?auto_146256 ) ( ON ?auto_146257 ?auto_146256 ) ( ON ?auto_146258 ?auto_146257 ) ( ON ?auto_146259 ?auto_146258 ) ( ON ?auto_146260 ?auto_146259 ) ( ON ?auto_146261 ?auto_146260 ) ( not ( = ?auto_146256 ?auto_146257 ) ) ( not ( = ?auto_146256 ?auto_146258 ) ) ( not ( = ?auto_146256 ?auto_146259 ) ) ( not ( = ?auto_146256 ?auto_146260 ) ) ( not ( = ?auto_146256 ?auto_146261 ) ) ( not ( = ?auto_146256 ?auto_146262 ) ) ( not ( = ?auto_146257 ?auto_146258 ) ) ( not ( = ?auto_146257 ?auto_146259 ) ) ( not ( = ?auto_146257 ?auto_146260 ) ) ( not ( = ?auto_146257 ?auto_146261 ) ) ( not ( = ?auto_146257 ?auto_146262 ) ) ( not ( = ?auto_146258 ?auto_146259 ) ) ( not ( = ?auto_146258 ?auto_146260 ) ) ( not ( = ?auto_146258 ?auto_146261 ) ) ( not ( = ?auto_146258 ?auto_146262 ) ) ( not ( = ?auto_146259 ?auto_146260 ) ) ( not ( = ?auto_146259 ?auto_146261 ) ) ( not ( = ?auto_146259 ?auto_146262 ) ) ( not ( = ?auto_146260 ?auto_146261 ) ) ( not ( = ?auto_146260 ?auto_146262 ) ) ( not ( = ?auto_146261 ?auto_146262 ) ) )
    :subtasks
    ( ( !STACK ?auto_146262 ?auto_146261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146263 - BLOCK
      ?auto_146264 - BLOCK
      ?auto_146265 - BLOCK
      ?auto_146266 - BLOCK
      ?auto_146267 - BLOCK
      ?auto_146268 - BLOCK
      ?auto_146269 - BLOCK
    )
    :vars
    (
      ?auto_146270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146268 ) ( ON-TABLE ?auto_146263 ) ( ON ?auto_146264 ?auto_146263 ) ( ON ?auto_146265 ?auto_146264 ) ( ON ?auto_146266 ?auto_146265 ) ( ON ?auto_146267 ?auto_146266 ) ( ON ?auto_146268 ?auto_146267 ) ( not ( = ?auto_146263 ?auto_146264 ) ) ( not ( = ?auto_146263 ?auto_146265 ) ) ( not ( = ?auto_146263 ?auto_146266 ) ) ( not ( = ?auto_146263 ?auto_146267 ) ) ( not ( = ?auto_146263 ?auto_146268 ) ) ( not ( = ?auto_146263 ?auto_146269 ) ) ( not ( = ?auto_146264 ?auto_146265 ) ) ( not ( = ?auto_146264 ?auto_146266 ) ) ( not ( = ?auto_146264 ?auto_146267 ) ) ( not ( = ?auto_146264 ?auto_146268 ) ) ( not ( = ?auto_146264 ?auto_146269 ) ) ( not ( = ?auto_146265 ?auto_146266 ) ) ( not ( = ?auto_146265 ?auto_146267 ) ) ( not ( = ?auto_146265 ?auto_146268 ) ) ( not ( = ?auto_146265 ?auto_146269 ) ) ( not ( = ?auto_146266 ?auto_146267 ) ) ( not ( = ?auto_146266 ?auto_146268 ) ) ( not ( = ?auto_146266 ?auto_146269 ) ) ( not ( = ?auto_146267 ?auto_146268 ) ) ( not ( = ?auto_146267 ?auto_146269 ) ) ( not ( = ?auto_146268 ?auto_146269 ) ) ( ON ?auto_146269 ?auto_146270 ) ( CLEAR ?auto_146269 ) ( HAND-EMPTY ) ( not ( = ?auto_146263 ?auto_146270 ) ) ( not ( = ?auto_146264 ?auto_146270 ) ) ( not ( = ?auto_146265 ?auto_146270 ) ) ( not ( = ?auto_146266 ?auto_146270 ) ) ( not ( = ?auto_146267 ?auto_146270 ) ) ( not ( = ?auto_146268 ?auto_146270 ) ) ( not ( = ?auto_146269 ?auto_146270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146269 ?auto_146270 )
      ( MAKE-7PILE ?auto_146263 ?auto_146264 ?auto_146265 ?auto_146266 ?auto_146267 ?auto_146268 ?auto_146269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146271 - BLOCK
      ?auto_146272 - BLOCK
      ?auto_146273 - BLOCK
      ?auto_146274 - BLOCK
      ?auto_146275 - BLOCK
      ?auto_146276 - BLOCK
      ?auto_146277 - BLOCK
    )
    :vars
    (
      ?auto_146278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146271 ) ( ON ?auto_146272 ?auto_146271 ) ( ON ?auto_146273 ?auto_146272 ) ( ON ?auto_146274 ?auto_146273 ) ( ON ?auto_146275 ?auto_146274 ) ( not ( = ?auto_146271 ?auto_146272 ) ) ( not ( = ?auto_146271 ?auto_146273 ) ) ( not ( = ?auto_146271 ?auto_146274 ) ) ( not ( = ?auto_146271 ?auto_146275 ) ) ( not ( = ?auto_146271 ?auto_146276 ) ) ( not ( = ?auto_146271 ?auto_146277 ) ) ( not ( = ?auto_146272 ?auto_146273 ) ) ( not ( = ?auto_146272 ?auto_146274 ) ) ( not ( = ?auto_146272 ?auto_146275 ) ) ( not ( = ?auto_146272 ?auto_146276 ) ) ( not ( = ?auto_146272 ?auto_146277 ) ) ( not ( = ?auto_146273 ?auto_146274 ) ) ( not ( = ?auto_146273 ?auto_146275 ) ) ( not ( = ?auto_146273 ?auto_146276 ) ) ( not ( = ?auto_146273 ?auto_146277 ) ) ( not ( = ?auto_146274 ?auto_146275 ) ) ( not ( = ?auto_146274 ?auto_146276 ) ) ( not ( = ?auto_146274 ?auto_146277 ) ) ( not ( = ?auto_146275 ?auto_146276 ) ) ( not ( = ?auto_146275 ?auto_146277 ) ) ( not ( = ?auto_146276 ?auto_146277 ) ) ( ON ?auto_146277 ?auto_146278 ) ( CLEAR ?auto_146277 ) ( not ( = ?auto_146271 ?auto_146278 ) ) ( not ( = ?auto_146272 ?auto_146278 ) ) ( not ( = ?auto_146273 ?auto_146278 ) ) ( not ( = ?auto_146274 ?auto_146278 ) ) ( not ( = ?auto_146275 ?auto_146278 ) ) ( not ( = ?auto_146276 ?auto_146278 ) ) ( not ( = ?auto_146277 ?auto_146278 ) ) ( HOLDING ?auto_146276 ) ( CLEAR ?auto_146275 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146271 ?auto_146272 ?auto_146273 ?auto_146274 ?auto_146275 ?auto_146276 )
      ( MAKE-7PILE ?auto_146271 ?auto_146272 ?auto_146273 ?auto_146274 ?auto_146275 ?auto_146276 ?auto_146277 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146279 - BLOCK
      ?auto_146280 - BLOCK
      ?auto_146281 - BLOCK
      ?auto_146282 - BLOCK
      ?auto_146283 - BLOCK
      ?auto_146284 - BLOCK
      ?auto_146285 - BLOCK
    )
    :vars
    (
      ?auto_146286 - BLOCK
      ?auto_146287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146279 ) ( ON ?auto_146280 ?auto_146279 ) ( ON ?auto_146281 ?auto_146280 ) ( ON ?auto_146282 ?auto_146281 ) ( ON ?auto_146283 ?auto_146282 ) ( not ( = ?auto_146279 ?auto_146280 ) ) ( not ( = ?auto_146279 ?auto_146281 ) ) ( not ( = ?auto_146279 ?auto_146282 ) ) ( not ( = ?auto_146279 ?auto_146283 ) ) ( not ( = ?auto_146279 ?auto_146284 ) ) ( not ( = ?auto_146279 ?auto_146285 ) ) ( not ( = ?auto_146280 ?auto_146281 ) ) ( not ( = ?auto_146280 ?auto_146282 ) ) ( not ( = ?auto_146280 ?auto_146283 ) ) ( not ( = ?auto_146280 ?auto_146284 ) ) ( not ( = ?auto_146280 ?auto_146285 ) ) ( not ( = ?auto_146281 ?auto_146282 ) ) ( not ( = ?auto_146281 ?auto_146283 ) ) ( not ( = ?auto_146281 ?auto_146284 ) ) ( not ( = ?auto_146281 ?auto_146285 ) ) ( not ( = ?auto_146282 ?auto_146283 ) ) ( not ( = ?auto_146282 ?auto_146284 ) ) ( not ( = ?auto_146282 ?auto_146285 ) ) ( not ( = ?auto_146283 ?auto_146284 ) ) ( not ( = ?auto_146283 ?auto_146285 ) ) ( not ( = ?auto_146284 ?auto_146285 ) ) ( ON ?auto_146285 ?auto_146286 ) ( not ( = ?auto_146279 ?auto_146286 ) ) ( not ( = ?auto_146280 ?auto_146286 ) ) ( not ( = ?auto_146281 ?auto_146286 ) ) ( not ( = ?auto_146282 ?auto_146286 ) ) ( not ( = ?auto_146283 ?auto_146286 ) ) ( not ( = ?auto_146284 ?auto_146286 ) ) ( not ( = ?auto_146285 ?auto_146286 ) ) ( CLEAR ?auto_146283 ) ( ON ?auto_146284 ?auto_146285 ) ( CLEAR ?auto_146284 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146287 ) ( ON ?auto_146286 ?auto_146287 ) ( not ( = ?auto_146287 ?auto_146286 ) ) ( not ( = ?auto_146287 ?auto_146285 ) ) ( not ( = ?auto_146287 ?auto_146284 ) ) ( not ( = ?auto_146279 ?auto_146287 ) ) ( not ( = ?auto_146280 ?auto_146287 ) ) ( not ( = ?auto_146281 ?auto_146287 ) ) ( not ( = ?auto_146282 ?auto_146287 ) ) ( not ( = ?auto_146283 ?auto_146287 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146287 ?auto_146286 ?auto_146285 )
      ( MAKE-7PILE ?auto_146279 ?auto_146280 ?auto_146281 ?auto_146282 ?auto_146283 ?auto_146284 ?auto_146285 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146288 - BLOCK
      ?auto_146289 - BLOCK
      ?auto_146290 - BLOCK
      ?auto_146291 - BLOCK
      ?auto_146292 - BLOCK
      ?auto_146293 - BLOCK
      ?auto_146294 - BLOCK
    )
    :vars
    (
      ?auto_146296 - BLOCK
      ?auto_146295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146288 ) ( ON ?auto_146289 ?auto_146288 ) ( ON ?auto_146290 ?auto_146289 ) ( ON ?auto_146291 ?auto_146290 ) ( not ( = ?auto_146288 ?auto_146289 ) ) ( not ( = ?auto_146288 ?auto_146290 ) ) ( not ( = ?auto_146288 ?auto_146291 ) ) ( not ( = ?auto_146288 ?auto_146292 ) ) ( not ( = ?auto_146288 ?auto_146293 ) ) ( not ( = ?auto_146288 ?auto_146294 ) ) ( not ( = ?auto_146289 ?auto_146290 ) ) ( not ( = ?auto_146289 ?auto_146291 ) ) ( not ( = ?auto_146289 ?auto_146292 ) ) ( not ( = ?auto_146289 ?auto_146293 ) ) ( not ( = ?auto_146289 ?auto_146294 ) ) ( not ( = ?auto_146290 ?auto_146291 ) ) ( not ( = ?auto_146290 ?auto_146292 ) ) ( not ( = ?auto_146290 ?auto_146293 ) ) ( not ( = ?auto_146290 ?auto_146294 ) ) ( not ( = ?auto_146291 ?auto_146292 ) ) ( not ( = ?auto_146291 ?auto_146293 ) ) ( not ( = ?auto_146291 ?auto_146294 ) ) ( not ( = ?auto_146292 ?auto_146293 ) ) ( not ( = ?auto_146292 ?auto_146294 ) ) ( not ( = ?auto_146293 ?auto_146294 ) ) ( ON ?auto_146294 ?auto_146296 ) ( not ( = ?auto_146288 ?auto_146296 ) ) ( not ( = ?auto_146289 ?auto_146296 ) ) ( not ( = ?auto_146290 ?auto_146296 ) ) ( not ( = ?auto_146291 ?auto_146296 ) ) ( not ( = ?auto_146292 ?auto_146296 ) ) ( not ( = ?auto_146293 ?auto_146296 ) ) ( not ( = ?auto_146294 ?auto_146296 ) ) ( ON ?auto_146293 ?auto_146294 ) ( CLEAR ?auto_146293 ) ( ON-TABLE ?auto_146295 ) ( ON ?auto_146296 ?auto_146295 ) ( not ( = ?auto_146295 ?auto_146296 ) ) ( not ( = ?auto_146295 ?auto_146294 ) ) ( not ( = ?auto_146295 ?auto_146293 ) ) ( not ( = ?auto_146288 ?auto_146295 ) ) ( not ( = ?auto_146289 ?auto_146295 ) ) ( not ( = ?auto_146290 ?auto_146295 ) ) ( not ( = ?auto_146291 ?auto_146295 ) ) ( not ( = ?auto_146292 ?auto_146295 ) ) ( HOLDING ?auto_146292 ) ( CLEAR ?auto_146291 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146288 ?auto_146289 ?auto_146290 ?auto_146291 ?auto_146292 )
      ( MAKE-7PILE ?auto_146288 ?auto_146289 ?auto_146290 ?auto_146291 ?auto_146292 ?auto_146293 ?auto_146294 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146297 - BLOCK
      ?auto_146298 - BLOCK
      ?auto_146299 - BLOCK
      ?auto_146300 - BLOCK
      ?auto_146301 - BLOCK
      ?auto_146302 - BLOCK
      ?auto_146303 - BLOCK
    )
    :vars
    (
      ?auto_146304 - BLOCK
      ?auto_146305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146297 ) ( ON ?auto_146298 ?auto_146297 ) ( ON ?auto_146299 ?auto_146298 ) ( ON ?auto_146300 ?auto_146299 ) ( not ( = ?auto_146297 ?auto_146298 ) ) ( not ( = ?auto_146297 ?auto_146299 ) ) ( not ( = ?auto_146297 ?auto_146300 ) ) ( not ( = ?auto_146297 ?auto_146301 ) ) ( not ( = ?auto_146297 ?auto_146302 ) ) ( not ( = ?auto_146297 ?auto_146303 ) ) ( not ( = ?auto_146298 ?auto_146299 ) ) ( not ( = ?auto_146298 ?auto_146300 ) ) ( not ( = ?auto_146298 ?auto_146301 ) ) ( not ( = ?auto_146298 ?auto_146302 ) ) ( not ( = ?auto_146298 ?auto_146303 ) ) ( not ( = ?auto_146299 ?auto_146300 ) ) ( not ( = ?auto_146299 ?auto_146301 ) ) ( not ( = ?auto_146299 ?auto_146302 ) ) ( not ( = ?auto_146299 ?auto_146303 ) ) ( not ( = ?auto_146300 ?auto_146301 ) ) ( not ( = ?auto_146300 ?auto_146302 ) ) ( not ( = ?auto_146300 ?auto_146303 ) ) ( not ( = ?auto_146301 ?auto_146302 ) ) ( not ( = ?auto_146301 ?auto_146303 ) ) ( not ( = ?auto_146302 ?auto_146303 ) ) ( ON ?auto_146303 ?auto_146304 ) ( not ( = ?auto_146297 ?auto_146304 ) ) ( not ( = ?auto_146298 ?auto_146304 ) ) ( not ( = ?auto_146299 ?auto_146304 ) ) ( not ( = ?auto_146300 ?auto_146304 ) ) ( not ( = ?auto_146301 ?auto_146304 ) ) ( not ( = ?auto_146302 ?auto_146304 ) ) ( not ( = ?auto_146303 ?auto_146304 ) ) ( ON ?auto_146302 ?auto_146303 ) ( ON-TABLE ?auto_146305 ) ( ON ?auto_146304 ?auto_146305 ) ( not ( = ?auto_146305 ?auto_146304 ) ) ( not ( = ?auto_146305 ?auto_146303 ) ) ( not ( = ?auto_146305 ?auto_146302 ) ) ( not ( = ?auto_146297 ?auto_146305 ) ) ( not ( = ?auto_146298 ?auto_146305 ) ) ( not ( = ?auto_146299 ?auto_146305 ) ) ( not ( = ?auto_146300 ?auto_146305 ) ) ( not ( = ?auto_146301 ?auto_146305 ) ) ( CLEAR ?auto_146300 ) ( ON ?auto_146301 ?auto_146302 ) ( CLEAR ?auto_146301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146305 ?auto_146304 ?auto_146303 ?auto_146302 )
      ( MAKE-7PILE ?auto_146297 ?auto_146298 ?auto_146299 ?auto_146300 ?auto_146301 ?auto_146302 ?auto_146303 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146306 - BLOCK
      ?auto_146307 - BLOCK
      ?auto_146308 - BLOCK
      ?auto_146309 - BLOCK
      ?auto_146310 - BLOCK
      ?auto_146311 - BLOCK
      ?auto_146312 - BLOCK
    )
    :vars
    (
      ?auto_146314 - BLOCK
      ?auto_146313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146306 ) ( ON ?auto_146307 ?auto_146306 ) ( ON ?auto_146308 ?auto_146307 ) ( not ( = ?auto_146306 ?auto_146307 ) ) ( not ( = ?auto_146306 ?auto_146308 ) ) ( not ( = ?auto_146306 ?auto_146309 ) ) ( not ( = ?auto_146306 ?auto_146310 ) ) ( not ( = ?auto_146306 ?auto_146311 ) ) ( not ( = ?auto_146306 ?auto_146312 ) ) ( not ( = ?auto_146307 ?auto_146308 ) ) ( not ( = ?auto_146307 ?auto_146309 ) ) ( not ( = ?auto_146307 ?auto_146310 ) ) ( not ( = ?auto_146307 ?auto_146311 ) ) ( not ( = ?auto_146307 ?auto_146312 ) ) ( not ( = ?auto_146308 ?auto_146309 ) ) ( not ( = ?auto_146308 ?auto_146310 ) ) ( not ( = ?auto_146308 ?auto_146311 ) ) ( not ( = ?auto_146308 ?auto_146312 ) ) ( not ( = ?auto_146309 ?auto_146310 ) ) ( not ( = ?auto_146309 ?auto_146311 ) ) ( not ( = ?auto_146309 ?auto_146312 ) ) ( not ( = ?auto_146310 ?auto_146311 ) ) ( not ( = ?auto_146310 ?auto_146312 ) ) ( not ( = ?auto_146311 ?auto_146312 ) ) ( ON ?auto_146312 ?auto_146314 ) ( not ( = ?auto_146306 ?auto_146314 ) ) ( not ( = ?auto_146307 ?auto_146314 ) ) ( not ( = ?auto_146308 ?auto_146314 ) ) ( not ( = ?auto_146309 ?auto_146314 ) ) ( not ( = ?auto_146310 ?auto_146314 ) ) ( not ( = ?auto_146311 ?auto_146314 ) ) ( not ( = ?auto_146312 ?auto_146314 ) ) ( ON ?auto_146311 ?auto_146312 ) ( ON-TABLE ?auto_146313 ) ( ON ?auto_146314 ?auto_146313 ) ( not ( = ?auto_146313 ?auto_146314 ) ) ( not ( = ?auto_146313 ?auto_146312 ) ) ( not ( = ?auto_146313 ?auto_146311 ) ) ( not ( = ?auto_146306 ?auto_146313 ) ) ( not ( = ?auto_146307 ?auto_146313 ) ) ( not ( = ?auto_146308 ?auto_146313 ) ) ( not ( = ?auto_146309 ?auto_146313 ) ) ( not ( = ?auto_146310 ?auto_146313 ) ) ( ON ?auto_146310 ?auto_146311 ) ( CLEAR ?auto_146310 ) ( HOLDING ?auto_146309 ) ( CLEAR ?auto_146308 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146306 ?auto_146307 ?auto_146308 ?auto_146309 )
      ( MAKE-7PILE ?auto_146306 ?auto_146307 ?auto_146308 ?auto_146309 ?auto_146310 ?auto_146311 ?auto_146312 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146315 - BLOCK
      ?auto_146316 - BLOCK
      ?auto_146317 - BLOCK
      ?auto_146318 - BLOCK
      ?auto_146319 - BLOCK
      ?auto_146320 - BLOCK
      ?auto_146321 - BLOCK
    )
    :vars
    (
      ?auto_146322 - BLOCK
      ?auto_146323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146315 ) ( ON ?auto_146316 ?auto_146315 ) ( ON ?auto_146317 ?auto_146316 ) ( not ( = ?auto_146315 ?auto_146316 ) ) ( not ( = ?auto_146315 ?auto_146317 ) ) ( not ( = ?auto_146315 ?auto_146318 ) ) ( not ( = ?auto_146315 ?auto_146319 ) ) ( not ( = ?auto_146315 ?auto_146320 ) ) ( not ( = ?auto_146315 ?auto_146321 ) ) ( not ( = ?auto_146316 ?auto_146317 ) ) ( not ( = ?auto_146316 ?auto_146318 ) ) ( not ( = ?auto_146316 ?auto_146319 ) ) ( not ( = ?auto_146316 ?auto_146320 ) ) ( not ( = ?auto_146316 ?auto_146321 ) ) ( not ( = ?auto_146317 ?auto_146318 ) ) ( not ( = ?auto_146317 ?auto_146319 ) ) ( not ( = ?auto_146317 ?auto_146320 ) ) ( not ( = ?auto_146317 ?auto_146321 ) ) ( not ( = ?auto_146318 ?auto_146319 ) ) ( not ( = ?auto_146318 ?auto_146320 ) ) ( not ( = ?auto_146318 ?auto_146321 ) ) ( not ( = ?auto_146319 ?auto_146320 ) ) ( not ( = ?auto_146319 ?auto_146321 ) ) ( not ( = ?auto_146320 ?auto_146321 ) ) ( ON ?auto_146321 ?auto_146322 ) ( not ( = ?auto_146315 ?auto_146322 ) ) ( not ( = ?auto_146316 ?auto_146322 ) ) ( not ( = ?auto_146317 ?auto_146322 ) ) ( not ( = ?auto_146318 ?auto_146322 ) ) ( not ( = ?auto_146319 ?auto_146322 ) ) ( not ( = ?auto_146320 ?auto_146322 ) ) ( not ( = ?auto_146321 ?auto_146322 ) ) ( ON ?auto_146320 ?auto_146321 ) ( ON-TABLE ?auto_146323 ) ( ON ?auto_146322 ?auto_146323 ) ( not ( = ?auto_146323 ?auto_146322 ) ) ( not ( = ?auto_146323 ?auto_146321 ) ) ( not ( = ?auto_146323 ?auto_146320 ) ) ( not ( = ?auto_146315 ?auto_146323 ) ) ( not ( = ?auto_146316 ?auto_146323 ) ) ( not ( = ?auto_146317 ?auto_146323 ) ) ( not ( = ?auto_146318 ?auto_146323 ) ) ( not ( = ?auto_146319 ?auto_146323 ) ) ( ON ?auto_146319 ?auto_146320 ) ( CLEAR ?auto_146317 ) ( ON ?auto_146318 ?auto_146319 ) ( CLEAR ?auto_146318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146323 ?auto_146322 ?auto_146321 ?auto_146320 ?auto_146319 )
      ( MAKE-7PILE ?auto_146315 ?auto_146316 ?auto_146317 ?auto_146318 ?auto_146319 ?auto_146320 ?auto_146321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146324 - BLOCK
      ?auto_146325 - BLOCK
      ?auto_146326 - BLOCK
      ?auto_146327 - BLOCK
      ?auto_146328 - BLOCK
      ?auto_146329 - BLOCK
      ?auto_146330 - BLOCK
    )
    :vars
    (
      ?auto_146331 - BLOCK
      ?auto_146332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146324 ) ( ON ?auto_146325 ?auto_146324 ) ( not ( = ?auto_146324 ?auto_146325 ) ) ( not ( = ?auto_146324 ?auto_146326 ) ) ( not ( = ?auto_146324 ?auto_146327 ) ) ( not ( = ?auto_146324 ?auto_146328 ) ) ( not ( = ?auto_146324 ?auto_146329 ) ) ( not ( = ?auto_146324 ?auto_146330 ) ) ( not ( = ?auto_146325 ?auto_146326 ) ) ( not ( = ?auto_146325 ?auto_146327 ) ) ( not ( = ?auto_146325 ?auto_146328 ) ) ( not ( = ?auto_146325 ?auto_146329 ) ) ( not ( = ?auto_146325 ?auto_146330 ) ) ( not ( = ?auto_146326 ?auto_146327 ) ) ( not ( = ?auto_146326 ?auto_146328 ) ) ( not ( = ?auto_146326 ?auto_146329 ) ) ( not ( = ?auto_146326 ?auto_146330 ) ) ( not ( = ?auto_146327 ?auto_146328 ) ) ( not ( = ?auto_146327 ?auto_146329 ) ) ( not ( = ?auto_146327 ?auto_146330 ) ) ( not ( = ?auto_146328 ?auto_146329 ) ) ( not ( = ?auto_146328 ?auto_146330 ) ) ( not ( = ?auto_146329 ?auto_146330 ) ) ( ON ?auto_146330 ?auto_146331 ) ( not ( = ?auto_146324 ?auto_146331 ) ) ( not ( = ?auto_146325 ?auto_146331 ) ) ( not ( = ?auto_146326 ?auto_146331 ) ) ( not ( = ?auto_146327 ?auto_146331 ) ) ( not ( = ?auto_146328 ?auto_146331 ) ) ( not ( = ?auto_146329 ?auto_146331 ) ) ( not ( = ?auto_146330 ?auto_146331 ) ) ( ON ?auto_146329 ?auto_146330 ) ( ON-TABLE ?auto_146332 ) ( ON ?auto_146331 ?auto_146332 ) ( not ( = ?auto_146332 ?auto_146331 ) ) ( not ( = ?auto_146332 ?auto_146330 ) ) ( not ( = ?auto_146332 ?auto_146329 ) ) ( not ( = ?auto_146324 ?auto_146332 ) ) ( not ( = ?auto_146325 ?auto_146332 ) ) ( not ( = ?auto_146326 ?auto_146332 ) ) ( not ( = ?auto_146327 ?auto_146332 ) ) ( not ( = ?auto_146328 ?auto_146332 ) ) ( ON ?auto_146328 ?auto_146329 ) ( ON ?auto_146327 ?auto_146328 ) ( CLEAR ?auto_146327 ) ( HOLDING ?auto_146326 ) ( CLEAR ?auto_146325 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146324 ?auto_146325 ?auto_146326 )
      ( MAKE-7PILE ?auto_146324 ?auto_146325 ?auto_146326 ?auto_146327 ?auto_146328 ?auto_146329 ?auto_146330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146333 - BLOCK
      ?auto_146334 - BLOCK
      ?auto_146335 - BLOCK
      ?auto_146336 - BLOCK
      ?auto_146337 - BLOCK
      ?auto_146338 - BLOCK
      ?auto_146339 - BLOCK
    )
    :vars
    (
      ?auto_146340 - BLOCK
      ?auto_146341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146333 ) ( ON ?auto_146334 ?auto_146333 ) ( not ( = ?auto_146333 ?auto_146334 ) ) ( not ( = ?auto_146333 ?auto_146335 ) ) ( not ( = ?auto_146333 ?auto_146336 ) ) ( not ( = ?auto_146333 ?auto_146337 ) ) ( not ( = ?auto_146333 ?auto_146338 ) ) ( not ( = ?auto_146333 ?auto_146339 ) ) ( not ( = ?auto_146334 ?auto_146335 ) ) ( not ( = ?auto_146334 ?auto_146336 ) ) ( not ( = ?auto_146334 ?auto_146337 ) ) ( not ( = ?auto_146334 ?auto_146338 ) ) ( not ( = ?auto_146334 ?auto_146339 ) ) ( not ( = ?auto_146335 ?auto_146336 ) ) ( not ( = ?auto_146335 ?auto_146337 ) ) ( not ( = ?auto_146335 ?auto_146338 ) ) ( not ( = ?auto_146335 ?auto_146339 ) ) ( not ( = ?auto_146336 ?auto_146337 ) ) ( not ( = ?auto_146336 ?auto_146338 ) ) ( not ( = ?auto_146336 ?auto_146339 ) ) ( not ( = ?auto_146337 ?auto_146338 ) ) ( not ( = ?auto_146337 ?auto_146339 ) ) ( not ( = ?auto_146338 ?auto_146339 ) ) ( ON ?auto_146339 ?auto_146340 ) ( not ( = ?auto_146333 ?auto_146340 ) ) ( not ( = ?auto_146334 ?auto_146340 ) ) ( not ( = ?auto_146335 ?auto_146340 ) ) ( not ( = ?auto_146336 ?auto_146340 ) ) ( not ( = ?auto_146337 ?auto_146340 ) ) ( not ( = ?auto_146338 ?auto_146340 ) ) ( not ( = ?auto_146339 ?auto_146340 ) ) ( ON ?auto_146338 ?auto_146339 ) ( ON-TABLE ?auto_146341 ) ( ON ?auto_146340 ?auto_146341 ) ( not ( = ?auto_146341 ?auto_146340 ) ) ( not ( = ?auto_146341 ?auto_146339 ) ) ( not ( = ?auto_146341 ?auto_146338 ) ) ( not ( = ?auto_146333 ?auto_146341 ) ) ( not ( = ?auto_146334 ?auto_146341 ) ) ( not ( = ?auto_146335 ?auto_146341 ) ) ( not ( = ?auto_146336 ?auto_146341 ) ) ( not ( = ?auto_146337 ?auto_146341 ) ) ( ON ?auto_146337 ?auto_146338 ) ( ON ?auto_146336 ?auto_146337 ) ( CLEAR ?auto_146334 ) ( ON ?auto_146335 ?auto_146336 ) ( CLEAR ?auto_146335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146341 ?auto_146340 ?auto_146339 ?auto_146338 ?auto_146337 ?auto_146336 )
      ( MAKE-7PILE ?auto_146333 ?auto_146334 ?auto_146335 ?auto_146336 ?auto_146337 ?auto_146338 ?auto_146339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146342 - BLOCK
      ?auto_146343 - BLOCK
      ?auto_146344 - BLOCK
      ?auto_146345 - BLOCK
      ?auto_146346 - BLOCK
      ?auto_146347 - BLOCK
      ?auto_146348 - BLOCK
    )
    :vars
    (
      ?auto_146349 - BLOCK
      ?auto_146350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146342 ) ( not ( = ?auto_146342 ?auto_146343 ) ) ( not ( = ?auto_146342 ?auto_146344 ) ) ( not ( = ?auto_146342 ?auto_146345 ) ) ( not ( = ?auto_146342 ?auto_146346 ) ) ( not ( = ?auto_146342 ?auto_146347 ) ) ( not ( = ?auto_146342 ?auto_146348 ) ) ( not ( = ?auto_146343 ?auto_146344 ) ) ( not ( = ?auto_146343 ?auto_146345 ) ) ( not ( = ?auto_146343 ?auto_146346 ) ) ( not ( = ?auto_146343 ?auto_146347 ) ) ( not ( = ?auto_146343 ?auto_146348 ) ) ( not ( = ?auto_146344 ?auto_146345 ) ) ( not ( = ?auto_146344 ?auto_146346 ) ) ( not ( = ?auto_146344 ?auto_146347 ) ) ( not ( = ?auto_146344 ?auto_146348 ) ) ( not ( = ?auto_146345 ?auto_146346 ) ) ( not ( = ?auto_146345 ?auto_146347 ) ) ( not ( = ?auto_146345 ?auto_146348 ) ) ( not ( = ?auto_146346 ?auto_146347 ) ) ( not ( = ?auto_146346 ?auto_146348 ) ) ( not ( = ?auto_146347 ?auto_146348 ) ) ( ON ?auto_146348 ?auto_146349 ) ( not ( = ?auto_146342 ?auto_146349 ) ) ( not ( = ?auto_146343 ?auto_146349 ) ) ( not ( = ?auto_146344 ?auto_146349 ) ) ( not ( = ?auto_146345 ?auto_146349 ) ) ( not ( = ?auto_146346 ?auto_146349 ) ) ( not ( = ?auto_146347 ?auto_146349 ) ) ( not ( = ?auto_146348 ?auto_146349 ) ) ( ON ?auto_146347 ?auto_146348 ) ( ON-TABLE ?auto_146350 ) ( ON ?auto_146349 ?auto_146350 ) ( not ( = ?auto_146350 ?auto_146349 ) ) ( not ( = ?auto_146350 ?auto_146348 ) ) ( not ( = ?auto_146350 ?auto_146347 ) ) ( not ( = ?auto_146342 ?auto_146350 ) ) ( not ( = ?auto_146343 ?auto_146350 ) ) ( not ( = ?auto_146344 ?auto_146350 ) ) ( not ( = ?auto_146345 ?auto_146350 ) ) ( not ( = ?auto_146346 ?auto_146350 ) ) ( ON ?auto_146346 ?auto_146347 ) ( ON ?auto_146345 ?auto_146346 ) ( ON ?auto_146344 ?auto_146345 ) ( CLEAR ?auto_146344 ) ( HOLDING ?auto_146343 ) ( CLEAR ?auto_146342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146342 ?auto_146343 )
      ( MAKE-7PILE ?auto_146342 ?auto_146343 ?auto_146344 ?auto_146345 ?auto_146346 ?auto_146347 ?auto_146348 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146351 - BLOCK
      ?auto_146352 - BLOCK
      ?auto_146353 - BLOCK
      ?auto_146354 - BLOCK
      ?auto_146355 - BLOCK
      ?auto_146356 - BLOCK
      ?auto_146357 - BLOCK
    )
    :vars
    (
      ?auto_146359 - BLOCK
      ?auto_146358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146351 ) ( not ( = ?auto_146351 ?auto_146352 ) ) ( not ( = ?auto_146351 ?auto_146353 ) ) ( not ( = ?auto_146351 ?auto_146354 ) ) ( not ( = ?auto_146351 ?auto_146355 ) ) ( not ( = ?auto_146351 ?auto_146356 ) ) ( not ( = ?auto_146351 ?auto_146357 ) ) ( not ( = ?auto_146352 ?auto_146353 ) ) ( not ( = ?auto_146352 ?auto_146354 ) ) ( not ( = ?auto_146352 ?auto_146355 ) ) ( not ( = ?auto_146352 ?auto_146356 ) ) ( not ( = ?auto_146352 ?auto_146357 ) ) ( not ( = ?auto_146353 ?auto_146354 ) ) ( not ( = ?auto_146353 ?auto_146355 ) ) ( not ( = ?auto_146353 ?auto_146356 ) ) ( not ( = ?auto_146353 ?auto_146357 ) ) ( not ( = ?auto_146354 ?auto_146355 ) ) ( not ( = ?auto_146354 ?auto_146356 ) ) ( not ( = ?auto_146354 ?auto_146357 ) ) ( not ( = ?auto_146355 ?auto_146356 ) ) ( not ( = ?auto_146355 ?auto_146357 ) ) ( not ( = ?auto_146356 ?auto_146357 ) ) ( ON ?auto_146357 ?auto_146359 ) ( not ( = ?auto_146351 ?auto_146359 ) ) ( not ( = ?auto_146352 ?auto_146359 ) ) ( not ( = ?auto_146353 ?auto_146359 ) ) ( not ( = ?auto_146354 ?auto_146359 ) ) ( not ( = ?auto_146355 ?auto_146359 ) ) ( not ( = ?auto_146356 ?auto_146359 ) ) ( not ( = ?auto_146357 ?auto_146359 ) ) ( ON ?auto_146356 ?auto_146357 ) ( ON-TABLE ?auto_146358 ) ( ON ?auto_146359 ?auto_146358 ) ( not ( = ?auto_146358 ?auto_146359 ) ) ( not ( = ?auto_146358 ?auto_146357 ) ) ( not ( = ?auto_146358 ?auto_146356 ) ) ( not ( = ?auto_146351 ?auto_146358 ) ) ( not ( = ?auto_146352 ?auto_146358 ) ) ( not ( = ?auto_146353 ?auto_146358 ) ) ( not ( = ?auto_146354 ?auto_146358 ) ) ( not ( = ?auto_146355 ?auto_146358 ) ) ( ON ?auto_146355 ?auto_146356 ) ( ON ?auto_146354 ?auto_146355 ) ( ON ?auto_146353 ?auto_146354 ) ( CLEAR ?auto_146351 ) ( ON ?auto_146352 ?auto_146353 ) ( CLEAR ?auto_146352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146358 ?auto_146359 ?auto_146357 ?auto_146356 ?auto_146355 ?auto_146354 ?auto_146353 )
      ( MAKE-7PILE ?auto_146351 ?auto_146352 ?auto_146353 ?auto_146354 ?auto_146355 ?auto_146356 ?auto_146357 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146360 - BLOCK
      ?auto_146361 - BLOCK
      ?auto_146362 - BLOCK
      ?auto_146363 - BLOCK
      ?auto_146364 - BLOCK
      ?auto_146365 - BLOCK
      ?auto_146366 - BLOCK
    )
    :vars
    (
      ?auto_146368 - BLOCK
      ?auto_146367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146360 ?auto_146361 ) ) ( not ( = ?auto_146360 ?auto_146362 ) ) ( not ( = ?auto_146360 ?auto_146363 ) ) ( not ( = ?auto_146360 ?auto_146364 ) ) ( not ( = ?auto_146360 ?auto_146365 ) ) ( not ( = ?auto_146360 ?auto_146366 ) ) ( not ( = ?auto_146361 ?auto_146362 ) ) ( not ( = ?auto_146361 ?auto_146363 ) ) ( not ( = ?auto_146361 ?auto_146364 ) ) ( not ( = ?auto_146361 ?auto_146365 ) ) ( not ( = ?auto_146361 ?auto_146366 ) ) ( not ( = ?auto_146362 ?auto_146363 ) ) ( not ( = ?auto_146362 ?auto_146364 ) ) ( not ( = ?auto_146362 ?auto_146365 ) ) ( not ( = ?auto_146362 ?auto_146366 ) ) ( not ( = ?auto_146363 ?auto_146364 ) ) ( not ( = ?auto_146363 ?auto_146365 ) ) ( not ( = ?auto_146363 ?auto_146366 ) ) ( not ( = ?auto_146364 ?auto_146365 ) ) ( not ( = ?auto_146364 ?auto_146366 ) ) ( not ( = ?auto_146365 ?auto_146366 ) ) ( ON ?auto_146366 ?auto_146368 ) ( not ( = ?auto_146360 ?auto_146368 ) ) ( not ( = ?auto_146361 ?auto_146368 ) ) ( not ( = ?auto_146362 ?auto_146368 ) ) ( not ( = ?auto_146363 ?auto_146368 ) ) ( not ( = ?auto_146364 ?auto_146368 ) ) ( not ( = ?auto_146365 ?auto_146368 ) ) ( not ( = ?auto_146366 ?auto_146368 ) ) ( ON ?auto_146365 ?auto_146366 ) ( ON-TABLE ?auto_146367 ) ( ON ?auto_146368 ?auto_146367 ) ( not ( = ?auto_146367 ?auto_146368 ) ) ( not ( = ?auto_146367 ?auto_146366 ) ) ( not ( = ?auto_146367 ?auto_146365 ) ) ( not ( = ?auto_146360 ?auto_146367 ) ) ( not ( = ?auto_146361 ?auto_146367 ) ) ( not ( = ?auto_146362 ?auto_146367 ) ) ( not ( = ?auto_146363 ?auto_146367 ) ) ( not ( = ?auto_146364 ?auto_146367 ) ) ( ON ?auto_146364 ?auto_146365 ) ( ON ?auto_146363 ?auto_146364 ) ( ON ?auto_146362 ?auto_146363 ) ( ON ?auto_146361 ?auto_146362 ) ( CLEAR ?auto_146361 ) ( HOLDING ?auto_146360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146360 )
      ( MAKE-7PILE ?auto_146360 ?auto_146361 ?auto_146362 ?auto_146363 ?auto_146364 ?auto_146365 ?auto_146366 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146369 - BLOCK
      ?auto_146370 - BLOCK
      ?auto_146371 - BLOCK
      ?auto_146372 - BLOCK
      ?auto_146373 - BLOCK
      ?auto_146374 - BLOCK
      ?auto_146375 - BLOCK
    )
    :vars
    (
      ?auto_146377 - BLOCK
      ?auto_146376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146369 ?auto_146370 ) ) ( not ( = ?auto_146369 ?auto_146371 ) ) ( not ( = ?auto_146369 ?auto_146372 ) ) ( not ( = ?auto_146369 ?auto_146373 ) ) ( not ( = ?auto_146369 ?auto_146374 ) ) ( not ( = ?auto_146369 ?auto_146375 ) ) ( not ( = ?auto_146370 ?auto_146371 ) ) ( not ( = ?auto_146370 ?auto_146372 ) ) ( not ( = ?auto_146370 ?auto_146373 ) ) ( not ( = ?auto_146370 ?auto_146374 ) ) ( not ( = ?auto_146370 ?auto_146375 ) ) ( not ( = ?auto_146371 ?auto_146372 ) ) ( not ( = ?auto_146371 ?auto_146373 ) ) ( not ( = ?auto_146371 ?auto_146374 ) ) ( not ( = ?auto_146371 ?auto_146375 ) ) ( not ( = ?auto_146372 ?auto_146373 ) ) ( not ( = ?auto_146372 ?auto_146374 ) ) ( not ( = ?auto_146372 ?auto_146375 ) ) ( not ( = ?auto_146373 ?auto_146374 ) ) ( not ( = ?auto_146373 ?auto_146375 ) ) ( not ( = ?auto_146374 ?auto_146375 ) ) ( ON ?auto_146375 ?auto_146377 ) ( not ( = ?auto_146369 ?auto_146377 ) ) ( not ( = ?auto_146370 ?auto_146377 ) ) ( not ( = ?auto_146371 ?auto_146377 ) ) ( not ( = ?auto_146372 ?auto_146377 ) ) ( not ( = ?auto_146373 ?auto_146377 ) ) ( not ( = ?auto_146374 ?auto_146377 ) ) ( not ( = ?auto_146375 ?auto_146377 ) ) ( ON ?auto_146374 ?auto_146375 ) ( ON-TABLE ?auto_146376 ) ( ON ?auto_146377 ?auto_146376 ) ( not ( = ?auto_146376 ?auto_146377 ) ) ( not ( = ?auto_146376 ?auto_146375 ) ) ( not ( = ?auto_146376 ?auto_146374 ) ) ( not ( = ?auto_146369 ?auto_146376 ) ) ( not ( = ?auto_146370 ?auto_146376 ) ) ( not ( = ?auto_146371 ?auto_146376 ) ) ( not ( = ?auto_146372 ?auto_146376 ) ) ( not ( = ?auto_146373 ?auto_146376 ) ) ( ON ?auto_146373 ?auto_146374 ) ( ON ?auto_146372 ?auto_146373 ) ( ON ?auto_146371 ?auto_146372 ) ( ON ?auto_146370 ?auto_146371 ) ( ON ?auto_146369 ?auto_146370 ) ( CLEAR ?auto_146369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146376 ?auto_146377 ?auto_146375 ?auto_146374 ?auto_146373 ?auto_146372 ?auto_146371 ?auto_146370 )
      ( MAKE-7PILE ?auto_146369 ?auto_146370 ?auto_146371 ?auto_146372 ?auto_146373 ?auto_146374 ?auto_146375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146379 - BLOCK
    )
    :vars
    (
      ?auto_146380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146380 ?auto_146379 ) ( CLEAR ?auto_146380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146379 ) ( not ( = ?auto_146379 ?auto_146380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146380 ?auto_146379 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146381 - BLOCK
    )
    :vars
    (
      ?auto_146382 - BLOCK
      ?auto_146383 - BLOCK
      ?auto_146384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146382 ?auto_146381 ) ( CLEAR ?auto_146382 ) ( ON-TABLE ?auto_146381 ) ( not ( = ?auto_146381 ?auto_146382 ) ) ( HOLDING ?auto_146383 ) ( CLEAR ?auto_146384 ) ( not ( = ?auto_146381 ?auto_146383 ) ) ( not ( = ?auto_146381 ?auto_146384 ) ) ( not ( = ?auto_146382 ?auto_146383 ) ) ( not ( = ?auto_146382 ?auto_146384 ) ) ( not ( = ?auto_146383 ?auto_146384 ) ) )
    :subtasks
    ( ( !STACK ?auto_146383 ?auto_146384 )
      ( MAKE-1PILE ?auto_146381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146385 - BLOCK
    )
    :vars
    (
      ?auto_146387 - BLOCK
      ?auto_146386 - BLOCK
      ?auto_146388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146387 ?auto_146385 ) ( ON-TABLE ?auto_146385 ) ( not ( = ?auto_146385 ?auto_146387 ) ) ( CLEAR ?auto_146386 ) ( not ( = ?auto_146385 ?auto_146388 ) ) ( not ( = ?auto_146385 ?auto_146386 ) ) ( not ( = ?auto_146387 ?auto_146388 ) ) ( not ( = ?auto_146387 ?auto_146386 ) ) ( not ( = ?auto_146388 ?auto_146386 ) ) ( ON ?auto_146388 ?auto_146387 ) ( CLEAR ?auto_146388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146385 ?auto_146387 )
      ( MAKE-1PILE ?auto_146385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146389 - BLOCK
    )
    :vars
    (
      ?auto_146390 - BLOCK
      ?auto_146391 - BLOCK
      ?auto_146392 - BLOCK
      ?auto_146393 - BLOCK
      ?auto_146396 - BLOCK
      ?auto_146397 - BLOCK
      ?auto_146395 - BLOCK
      ?auto_146394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146390 ?auto_146389 ) ( ON-TABLE ?auto_146389 ) ( not ( = ?auto_146389 ?auto_146390 ) ) ( not ( = ?auto_146389 ?auto_146391 ) ) ( not ( = ?auto_146389 ?auto_146392 ) ) ( not ( = ?auto_146390 ?auto_146391 ) ) ( not ( = ?auto_146390 ?auto_146392 ) ) ( not ( = ?auto_146391 ?auto_146392 ) ) ( ON ?auto_146391 ?auto_146390 ) ( CLEAR ?auto_146391 ) ( HOLDING ?auto_146392 ) ( CLEAR ?auto_146393 ) ( ON-TABLE ?auto_146396 ) ( ON ?auto_146397 ?auto_146396 ) ( ON ?auto_146395 ?auto_146397 ) ( ON ?auto_146394 ?auto_146395 ) ( ON ?auto_146393 ?auto_146394 ) ( not ( = ?auto_146396 ?auto_146397 ) ) ( not ( = ?auto_146396 ?auto_146395 ) ) ( not ( = ?auto_146396 ?auto_146394 ) ) ( not ( = ?auto_146396 ?auto_146393 ) ) ( not ( = ?auto_146396 ?auto_146392 ) ) ( not ( = ?auto_146397 ?auto_146395 ) ) ( not ( = ?auto_146397 ?auto_146394 ) ) ( not ( = ?auto_146397 ?auto_146393 ) ) ( not ( = ?auto_146397 ?auto_146392 ) ) ( not ( = ?auto_146395 ?auto_146394 ) ) ( not ( = ?auto_146395 ?auto_146393 ) ) ( not ( = ?auto_146395 ?auto_146392 ) ) ( not ( = ?auto_146394 ?auto_146393 ) ) ( not ( = ?auto_146394 ?auto_146392 ) ) ( not ( = ?auto_146393 ?auto_146392 ) ) ( not ( = ?auto_146389 ?auto_146393 ) ) ( not ( = ?auto_146389 ?auto_146396 ) ) ( not ( = ?auto_146389 ?auto_146397 ) ) ( not ( = ?auto_146389 ?auto_146395 ) ) ( not ( = ?auto_146389 ?auto_146394 ) ) ( not ( = ?auto_146390 ?auto_146393 ) ) ( not ( = ?auto_146390 ?auto_146396 ) ) ( not ( = ?auto_146390 ?auto_146397 ) ) ( not ( = ?auto_146390 ?auto_146395 ) ) ( not ( = ?auto_146390 ?auto_146394 ) ) ( not ( = ?auto_146391 ?auto_146393 ) ) ( not ( = ?auto_146391 ?auto_146396 ) ) ( not ( = ?auto_146391 ?auto_146397 ) ) ( not ( = ?auto_146391 ?auto_146395 ) ) ( not ( = ?auto_146391 ?auto_146394 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146396 ?auto_146397 ?auto_146395 ?auto_146394 ?auto_146393 ?auto_146392 )
      ( MAKE-1PILE ?auto_146389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146398 - BLOCK
    )
    :vars
    (
      ?auto_146405 - BLOCK
      ?auto_146403 - BLOCK
      ?auto_146404 - BLOCK
      ?auto_146402 - BLOCK
      ?auto_146399 - BLOCK
      ?auto_146400 - BLOCK
      ?auto_146406 - BLOCK
      ?auto_146401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146405 ?auto_146398 ) ( ON-TABLE ?auto_146398 ) ( not ( = ?auto_146398 ?auto_146405 ) ) ( not ( = ?auto_146398 ?auto_146403 ) ) ( not ( = ?auto_146398 ?auto_146404 ) ) ( not ( = ?auto_146405 ?auto_146403 ) ) ( not ( = ?auto_146405 ?auto_146404 ) ) ( not ( = ?auto_146403 ?auto_146404 ) ) ( ON ?auto_146403 ?auto_146405 ) ( CLEAR ?auto_146402 ) ( ON-TABLE ?auto_146399 ) ( ON ?auto_146400 ?auto_146399 ) ( ON ?auto_146406 ?auto_146400 ) ( ON ?auto_146401 ?auto_146406 ) ( ON ?auto_146402 ?auto_146401 ) ( not ( = ?auto_146399 ?auto_146400 ) ) ( not ( = ?auto_146399 ?auto_146406 ) ) ( not ( = ?auto_146399 ?auto_146401 ) ) ( not ( = ?auto_146399 ?auto_146402 ) ) ( not ( = ?auto_146399 ?auto_146404 ) ) ( not ( = ?auto_146400 ?auto_146406 ) ) ( not ( = ?auto_146400 ?auto_146401 ) ) ( not ( = ?auto_146400 ?auto_146402 ) ) ( not ( = ?auto_146400 ?auto_146404 ) ) ( not ( = ?auto_146406 ?auto_146401 ) ) ( not ( = ?auto_146406 ?auto_146402 ) ) ( not ( = ?auto_146406 ?auto_146404 ) ) ( not ( = ?auto_146401 ?auto_146402 ) ) ( not ( = ?auto_146401 ?auto_146404 ) ) ( not ( = ?auto_146402 ?auto_146404 ) ) ( not ( = ?auto_146398 ?auto_146402 ) ) ( not ( = ?auto_146398 ?auto_146399 ) ) ( not ( = ?auto_146398 ?auto_146400 ) ) ( not ( = ?auto_146398 ?auto_146406 ) ) ( not ( = ?auto_146398 ?auto_146401 ) ) ( not ( = ?auto_146405 ?auto_146402 ) ) ( not ( = ?auto_146405 ?auto_146399 ) ) ( not ( = ?auto_146405 ?auto_146400 ) ) ( not ( = ?auto_146405 ?auto_146406 ) ) ( not ( = ?auto_146405 ?auto_146401 ) ) ( not ( = ?auto_146403 ?auto_146402 ) ) ( not ( = ?auto_146403 ?auto_146399 ) ) ( not ( = ?auto_146403 ?auto_146400 ) ) ( not ( = ?auto_146403 ?auto_146406 ) ) ( not ( = ?auto_146403 ?auto_146401 ) ) ( ON ?auto_146404 ?auto_146403 ) ( CLEAR ?auto_146404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146398 ?auto_146405 ?auto_146403 )
      ( MAKE-1PILE ?auto_146398 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146407 - BLOCK
    )
    :vars
    (
      ?auto_146415 - BLOCK
      ?auto_146413 - BLOCK
      ?auto_146410 - BLOCK
      ?auto_146412 - BLOCK
      ?auto_146411 - BLOCK
      ?auto_146414 - BLOCK
      ?auto_146408 - BLOCK
      ?auto_146409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146415 ?auto_146407 ) ( ON-TABLE ?auto_146407 ) ( not ( = ?auto_146407 ?auto_146415 ) ) ( not ( = ?auto_146407 ?auto_146413 ) ) ( not ( = ?auto_146407 ?auto_146410 ) ) ( not ( = ?auto_146415 ?auto_146413 ) ) ( not ( = ?auto_146415 ?auto_146410 ) ) ( not ( = ?auto_146413 ?auto_146410 ) ) ( ON ?auto_146413 ?auto_146415 ) ( ON-TABLE ?auto_146412 ) ( ON ?auto_146411 ?auto_146412 ) ( ON ?auto_146414 ?auto_146411 ) ( ON ?auto_146408 ?auto_146414 ) ( not ( = ?auto_146412 ?auto_146411 ) ) ( not ( = ?auto_146412 ?auto_146414 ) ) ( not ( = ?auto_146412 ?auto_146408 ) ) ( not ( = ?auto_146412 ?auto_146409 ) ) ( not ( = ?auto_146412 ?auto_146410 ) ) ( not ( = ?auto_146411 ?auto_146414 ) ) ( not ( = ?auto_146411 ?auto_146408 ) ) ( not ( = ?auto_146411 ?auto_146409 ) ) ( not ( = ?auto_146411 ?auto_146410 ) ) ( not ( = ?auto_146414 ?auto_146408 ) ) ( not ( = ?auto_146414 ?auto_146409 ) ) ( not ( = ?auto_146414 ?auto_146410 ) ) ( not ( = ?auto_146408 ?auto_146409 ) ) ( not ( = ?auto_146408 ?auto_146410 ) ) ( not ( = ?auto_146409 ?auto_146410 ) ) ( not ( = ?auto_146407 ?auto_146409 ) ) ( not ( = ?auto_146407 ?auto_146412 ) ) ( not ( = ?auto_146407 ?auto_146411 ) ) ( not ( = ?auto_146407 ?auto_146414 ) ) ( not ( = ?auto_146407 ?auto_146408 ) ) ( not ( = ?auto_146415 ?auto_146409 ) ) ( not ( = ?auto_146415 ?auto_146412 ) ) ( not ( = ?auto_146415 ?auto_146411 ) ) ( not ( = ?auto_146415 ?auto_146414 ) ) ( not ( = ?auto_146415 ?auto_146408 ) ) ( not ( = ?auto_146413 ?auto_146409 ) ) ( not ( = ?auto_146413 ?auto_146412 ) ) ( not ( = ?auto_146413 ?auto_146411 ) ) ( not ( = ?auto_146413 ?auto_146414 ) ) ( not ( = ?auto_146413 ?auto_146408 ) ) ( ON ?auto_146410 ?auto_146413 ) ( CLEAR ?auto_146410 ) ( HOLDING ?auto_146409 ) ( CLEAR ?auto_146408 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146412 ?auto_146411 ?auto_146414 ?auto_146408 ?auto_146409 )
      ( MAKE-1PILE ?auto_146407 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146416 - BLOCK
    )
    :vars
    (
      ?auto_146417 - BLOCK
      ?auto_146420 - BLOCK
      ?auto_146419 - BLOCK
      ?auto_146422 - BLOCK
      ?auto_146424 - BLOCK
      ?auto_146421 - BLOCK
      ?auto_146418 - BLOCK
      ?auto_146423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146417 ?auto_146416 ) ( ON-TABLE ?auto_146416 ) ( not ( = ?auto_146416 ?auto_146417 ) ) ( not ( = ?auto_146416 ?auto_146420 ) ) ( not ( = ?auto_146416 ?auto_146419 ) ) ( not ( = ?auto_146417 ?auto_146420 ) ) ( not ( = ?auto_146417 ?auto_146419 ) ) ( not ( = ?auto_146420 ?auto_146419 ) ) ( ON ?auto_146420 ?auto_146417 ) ( ON-TABLE ?auto_146422 ) ( ON ?auto_146424 ?auto_146422 ) ( ON ?auto_146421 ?auto_146424 ) ( ON ?auto_146418 ?auto_146421 ) ( not ( = ?auto_146422 ?auto_146424 ) ) ( not ( = ?auto_146422 ?auto_146421 ) ) ( not ( = ?auto_146422 ?auto_146418 ) ) ( not ( = ?auto_146422 ?auto_146423 ) ) ( not ( = ?auto_146422 ?auto_146419 ) ) ( not ( = ?auto_146424 ?auto_146421 ) ) ( not ( = ?auto_146424 ?auto_146418 ) ) ( not ( = ?auto_146424 ?auto_146423 ) ) ( not ( = ?auto_146424 ?auto_146419 ) ) ( not ( = ?auto_146421 ?auto_146418 ) ) ( not ( = ?auto_146421 ?auto_146423 ) ) ( not ( = ?auto_146421 ?auto_146419 ) ) ( not ( = ?auto_146418 ?auto_146423 ) ) ( not ( = ?auto_146418 ?auto_146419 ) ) ( not ( = ?auto_146423 ?auto_146419 ) ) ( not ( = ?auto_146416 ?auto_146423 ) ) ( not ( = ?auto_146416 ?auto_146422 ) ) ( not ( = ?auto_146416 ?auto_146424 ) ) ( not ( = ?auto_146416 ?auto_146421 ) ) ( not ( = ?auto_146416 ?auto_146418 ) ) ( not ( = ?auto_146417 ?auto_146423 ) ) ( not ( = ?auto_146417 ?auto_146422 ) ) ( not ( = ?auto_146417 ?auto_146424 ) ) ( not ( = ?auto_146417 ?auto_146421 ) ) ( not ( = ?auto_146417 ?auto_146418 ) ) ( not ( = ?auto_146420 ?auto_146423 ) ) ( not ( = ?auto_146420 ?auto_146422 ) ) ( not ( = ?auto_146420 ?auto_146424 ) ) ( not ( = ?auto_146420 ?auto_146421 ) ) ( not ( = ?auto_146420 ?auto_146418 ) ) ( ON ?auto_146419 ?auto_146420 ) ( CLEAR ?auto_146418 ) ( ON ?auto_146423 ?auto_146419 ) ( CLEAR ?auto_146423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146416 ?auto_146417 ?auto_146420 ?auto_146419 )
      ( MAKE-1PILE ?auto_146416 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146425 - BLOCK
    )
    :vars
    (
      ?auto_146426 - BLOCK
      ?auto_146429 - BLOCK
      ?auto_146431 - BLOCK
      ?auto_146428 - BLOCK
      ?auto_146433 - BLOCK
      ?auto_146432 - BLOCK
      ?auto_146427 - BLOCK
      ?auto_146430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146426 ?auto_146425 ) ( ON-TABLE ?auto_146425 ) ( not ( = ?auto_146425 ?auto_146426 ) ) ( not ( = ?auto_146425 ?auto_146429 ) ) ( not ( = ?auto_146425 ?auto_146431 ) ) ( not ( = ?auto_146426 ?auto_146429 ) ) ( not ( = ?auto_146426 ?auto_146431 ) ) ( not ( = ?auto_146429 ?auto_146431 ) ) ( ON ?auto_146429 ?auto_146426 ) ( ON-TABLE ?auto_146428 ) ( ON ?auto_146433 ?auto_146428 ) ( ON ?auto_146432 ?auto_146433 ) ( not ( = ?auto_146428 ?auto_146433 ) ) ( not ( = ?auto_146428 ?auto_146432 ) ) ( not ( = ?auto_146428 ?auto_146427 ) ) ( not ( = ?auto_146428 ?auto_146430 ) ) ( not ( = ?auto_146428 ?auto_146431 ) ) ( not ( = ?auto_146433 ?auto_146432 ) ) ( not ( = ?auto_146433 ?auto_146427 ) ) ( not ( = ?auto_146433 ?auto_146430 ) ) ( not ( = ?auto_146433 ?auto_146431 ) ) ( not ( = ?auto_146432 ?auto_146427 ) ) ( not ( = ?auto_146432 ?auto_146430 ) ) ( not ( = ?auto_146432 ?auto_146431 ) ) ( not ( = ?auto_146427 ?auto_146430 ) ) ( not ( = ?auto_146427 ?auto_146431 ) ) ( not ( = ?auto_146430 ?auto_146431 ) ) ( not ( = ?auto_146425 ?auto_146430 ) ) ( not ( = ?auto_146425 ?auto_146428 ) ) ( not ( = ?auto_146425 ?auto_146433 ) ) ( not ( = ?auto_146425 ?auto_146432 ) ) ( not ( = ?auto_146425 ?auto_146427 ) ) ( not ( = ?auto_146426 ?auto_146430 ) ) ( not ( = ?auto_146426 ?auto_146428 ) ) ( not ( = ?auto_146426 ?auto_146433 ) ) ( not ( = ?auto_146426 ?auto_146432 ) ) ( not ( = ?auto_146426 ?auto_146427 ) ) ( not ( = ?auto_146429 ?auto_146430 ) ) ( not ( = ?auto_146429 ?auto_146428 ) ) ( not ( = ?auto_146429 ?auto_146433 ) ) ( not ( = ?auto_146429 ?auto_146432 ) ) ( not ( = ?auto_146429 ?auto_146427 ) ) ( ON ?auto_146431 ?auto_146429 ) ( ON ?auto_146430 ?auto_146431 ) ( CLEAR ?auto_146430 ) ( HOLDING ?auto_146427 ) ( CLEAR ?auto_146432 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146428 ?auto_146433 ?auto_146432 ?auto_146427 )
      ( MAKE-1PILE ?auto_146425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146434 - BLOCK
    )
    :vars
    (
      ?auto_146438 - BLOCK
      ?auto_146435 - BLOCK
      ?auto_146437 - BLOCK
      ?auto_146439 - BLOCK
      ?auto_146442 - BLOCK
      ?auto_146441 - BLOCK
      ?auto_146440 - BLOCK
      ?auto_146436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146438 ?auto_146434 ) ( ON-TABLE ?auto_146434 ) ( not ( = ?auto_146434 ?auto_146438 ) ) ( not ( = ?auto_146434 ?auto_146435 ) ) ( not ( = ?auto_146434 ?auto_146437 ) ) ( not ( = ?auto_146438 ?auto_146435 ) ) ( not ( = ?auto_146438 ?auto_146437 ) ) ( not ( = ?auto_146435 ?auto_146437 ) ) ( ON ?auto_146435 ?auto_146438 ) ( ON-TABLE ?auto_146439 ) ( ON ?auto_146442 ?auto_146439 ) ( ON ?auto_146441 ?auto_146442 ) ( not ( = ?auto_146439 ?auto_146442 ) ) ( not ( = ?auto_146439 ?auto_146441 ) ) ( not ( = ?auto_146439 ?auto_146440 ) ) ( not ( = ?auto_146439 ?auto_146436 ) ) ( not ( = ?auto_146439 ?auto_146437 ) ) ( not ( = ?auto_146442 ?auto_146441 ) ) ( not ( = ?auto_146442 ?auto_146440 ) ) ( not ( = ?auto_146442 ?auto_146436 ) ) ( not ( = ?auto_146442 ?auto_146437 ) ) ( not ( = ?auto_146441 ?auto_146440 ) ) ( not ( = ?auto_146441 ?auto_146436 ) ) ( not ( = ?auto_146441 ?auto_146437 ) ) ( not ( = ?auto_146440 ?auto_146436 ) ) ( not ( = ?auto_146440 ?auto_146437 ) ) ( not ( = ?auto_146436 ?auto_146437 ) ) ( not ( = ?auto_146434 ?auto_146436 ) ) ( not ( = ?auto_146434 ?auto_146439 ) ) ( not ( = ?auto_146434 ?auto_146442 ) ) ( not ( = ?auto_146434 ?auto_146441 ) ) ( not ( = ?auto_146434 ?auto_146440 ) ) ( not ( = ?auto_146438 ?auto_146436 ) ) ( not ( = ?auto_146438 ?auto_146439 ) ) ( not ( = ?auto_146438 ?auto_146442 ) ) ( not ( = ?auto_146438 ?auto_146441 ) ) ( not ( = ?auto_146438 ?auto_146440 ) ) ( not ( = ?auto_146435 ?auto_146436 ) ) ( not ( = ?auto_146435 ?auto_146439 ) ) ( not ( = ?auto_146435 ?auto_146442 ) ) ( not ( = ?auto_146435 ?auto_146441 ) ) ( not ( = ?auto_146435 ?auto_146440 ) ) ( ON ?auto_146437 ?auto_146435 ) ( ON ?auto_146436 ?auto_146437 ) ( CLEAR ?auto_146441 ) ( ON ?auto_146440 ?auto_146436 ) ( CLEAR ?auto_146440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146434 ?auto_146438 ?auto_146435 ?auto_146437 ?auto_146436 )
      ( MAKE-1PILE ?auto_146434 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146443 - BLOCK
    )
    :vars
    (
      ?auto_146446 - BLOCK
      ?auto_146444 - BLOCK
      ?auto_146445 - BLOCK
      ?auto_146448 - BLOCK
      ?auto_146451 - BLOCK
      ?auto_146450 - BLOCK
      ?auto_146447 - BLOCK
      ?auto_146449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146446 ?auto_146443 ) ( ON-TABLE ?auto_146443 ) ( not ( = ?auto_146443 ?auto_146446 ) ) ( not ( = ?auto_146443 ?auto_146444 ) ) ( not ( = ?auto_146443 ?auto_146445 ) ) ( not ( = ?auto_146446 ?auto_146444 ) ) ( not ( = ?auto_146446 ?auto_146445 ) ) ( not ( = ?auto_146444 ?auto_146445 ) ) ( ON ?auto_146444 ?auto_146446 ) ( ON-TABLE ?auto_146448 ) ( ON ?auto_146451 ?auto_146448 ) ( not ( = ?auto_146448 ?auto_146451 ) ) ( not ( = ?auto_146448 ?auto_146450 ) ) ( not ( = ?auto_146448 ?auto_146447 ) ) ( not ( = ?auto_146448 ?auto_146449 ) ) ( not ( = ?auto_146448 ?auto_146445 ) ) ( not ( = ?auto_146451 ?auto_146450 ) ) ( not ( = ?auto_146451 ?auto_146447 ) ) ( not ( = ?auto_146451 ?auto_146449 ) ) ( not ( = ?auto_146451 ?auto_146445 ) ) ( not ( = ?auto_146450 ?auto_146447 ) ) ( not ( = ?auto_146450 ?auto_146449 ) ) ( not ( = ?auto_146450 ?auto_146445 ) ) ( not ( = ?auto_146447 ?auto_146449 ) ) ( not ( = ?auto_146447 ?auto_146445 ) ) ( not ( = ?auto_146449 ?auto_146445 ) ) ( not ( = ?auto_146443 ?auto_146449 ) ) ( not ( = ?auto_146443 ?auto_146448 ) ) ( not ( = ?auto_146443 ?auto_146451 ) ) ( not ( = ?auto_146443 ?auto_146450 ) ) ( not ( = ?auto_146443 ?auto_146447 ) ) ( not ( = ?auto_146446 ?auto_146449 ) ) ( not ( = ?auto_146446 ?auto_146448 ) ) ( not ( = ?auto_146446 ?auto_146451 ) ) ( not ( = ?auto_146446 ?auto_146450 ) ) ( not ( = ?auto_146446 ?auto_146447 ) ) ( not ( = ?auto_146444 ?auto_146449 ) ) ( not ( = ?auto_146444 ?auto_146448 ) ) ( not ( = ?auto_146444 ?auto_146451 ) ) ( not ( = ?auto_146444 ?auto_146450 ) ) ( not ( = ?auto_146444 ?auto_146447 ) ) ( ON ?auto_146445 ?auto_146444 ) ( ON ?auto_146449 ?auto_146445 ) ( ON ?auto_146447 ?auto_146449 ) ( CLEAR ?auto_146447 ) ( HOLDING ?auto_146450 ) ( CLEAR ?auto_146451 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146448 ?auto_146451 ?auto_146450 )
      ( MAKE-1PILE ?auto_146443 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146452 - BLOCK
    )
    :vars
    (
      ?auto_146460 - BLOCK
      ?auto_146453 - BLOCK
      ?auto_146454 - BLOCK
      ?auto_146455 - BLOCK
      ?auto_146457 - BLOCK
      ?auto_146456 - BLOCK
      ?auto_146459 - BLOCK
      ?auto_146458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146460 ?auto_146452 ) ( ON-TABLE ?auto_146452 ) ( not ( = ?auto_146452 ?auto_146460 ) ) ( not ( = ?auto_146452 ?auto_146453 ) ) ( not ( = ?auto_146452 ?auto_146454 ) ) ( not ( = ?auto_146460 ?auto_146453 ) ) ( not ( = ?auto_146460 ?auto_146454 ) ) ( not ( = ?auto_146453 ?auto_146454 ) ) ( ON ?auto_146453 ?auto_146460 ) ( ON-TABLE ?auto_146455 ) ( ON ?auto_146457 ?auto_146455 ) ( not ( = ?auto_146455 ?auto_146457 ) ) ( not ( = ?auto_146455 ?auto_146456 ) ) ( not ( = ?auto_146455 ?auto_146459 ) ) ( not ( = ?auto_146455 ?auto_146458 ) ) ( not ( = ?auto_146455 ?auto_146454 ) ) ( not ( = ?auto_146457 ?auto_146456 ) ) ( not ( = ?auto_146457 ?auto_146459 ) ) ( not ( = ?auto_146457 ?auto_146458 ) ) ( not ( = ?auto_146457 ?auto_146454 ) ) ( not ( = ?auto_146456 ?auto_146459 ) ) ( not ( = ?auto_146456 ?auto_146458 ) ) ( not ( = ?auto_146456 ?auto_146454 ) ) ( not ( = ?auto_146459 ?auto_146458 ) ) ( not ( = ?auto_146459 ?auto_146454 ) ) ( not ( = ?auto_146458 ?auto_146454 ) ) ( not ( = ?auto_146452 ?auto_146458 ) ) ( not ( = ?auto_146452 ?auto_146455 ) ) ( not ( = ?auto_146452 ?auto_146457 ) ) ( not ( = ?auto_146452 ?auto_146456 ) ) ( not ( = ?auto_146452 ?auto_146459 ) ) ( not ( = ?auto_146460 ?auto_146458 ) ) ( not ( = ?auto_146460 ?auto_146455 ) ) ( not ( = ?auto_146460 ?auto_146457 ) ) ( not ( = ?auto_146460 ?auto_146456 ) ) ( not ( = ?auto_146460 ?auto_146459 ) ) ( not ( = ?auto_146453 ?auto_146458 ) ) ( not ( = ?auto_146453 ?auto_146455 ) ) ( not ( = ?auto_146453 ?auto_146457 ) ) ( not ( = ?auto_146453 ?auto_146456 ) ) ( not ( = ?auto_146453 ?auto_146459 ) ) ( ON ?auto_146454 ?auto_146453 ) ( ON ?auto_146458 ?auto_146454 ) ( ON ?auto_146459 ?auto_146458 ) ( CLEAR ?auto_146457 ) ( ON ?auto_146456 ?auto_146459 ) ( CLEAR ?auto_146456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146452 ?auto_146460 ?auto_146453 ?auto_146454 ?auto_146458 ?auto_146459 )
      ( MAKE-1PILE ?auto_146452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146461 - BLOCK
    )
    :vars
    (
      ?auto_146463 - BLOCK
      ?auto_146467 - BLOCK
      ?auto_146468 - BLOCK
      ?auto_146469 - BLOCK
      ?auto_146464 - BLOCK
      ?auto_146466 - BLOCK
      ?auto_146465 - BLOCK
      ?auto_146462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146463 ?auto_146461 ) ( ON-TABLE ?auto_146461 ) ( not ( = ?auto_146461 ?auto_146463 ) ) ( not ( = ?auto_146461 ?auto_146467 ) ) ( not ( = ?auto_146461 ?auto_146468 ) ) ( not ( = ?auto_146463 ?auto_146467 ) ) ( not ( = ?auto_146463 ?auto_146468 ) ) ( not ( = ?auto_146467 ?auto_146468 ) ) ( ON ?auto_146467 ?auto_146463 ) ( ON-TABLE ?auto_146469 ) ( not ( = ?auto_146469 ?auto_146464 ) ) ( not ( = ?auto_146469 ?auto_146466 ) ) ( not ( = ?auto_146469 ?auto_146465 ) ) ( not ( = ?auto_146469 ?auto_146462 ) ) ( not ( = ?auto_146469 ?auto_146468 ) ) ( not ( = ?auto_146464 ?auto_146466 ) ) ( not ( = ?auto_146464 ?auto_146465 ) ) ( not ( = ?auto_146464 ?auto_146462 ) ) ( not ( = ?auto_146464 ?auto_146468 ) ) ( not ( = ?auto_146466 ?auto_146465 ) ) ( not ( = ?auto_146466 ?auto_146462 ) ) ( not ( = ?auto_146466 ?auto_146468 ) ) ( not ( = ?auto_146465 ?auto_146462 ) ) ( not ( = ?auto_146465 ?auto_146468 ) ) ( not ( = ?auto_146462 ?auto_146468 ) ) ( not ( = ?auto_146461 ?auto_146462 ) ) ( not ( = ?auto_146461 ?auto_146469 ) ) ( not ( = ?auto_146461 ?auto_146464 ) ) ( not ( = ?auto_146461 ?auto_146466 ) ) ( not ( = ?auto_146461 ?auto_146465 ) ) ( not ( = ?auto_146463 ?auto_146462 ) ) ( not ( = ?auto_146463 ?auto_146469 ) ) ( not ( = ?auto_146463 ?auto_146464 ) ) ( not ( = ?auto_146463 ?auto_146466 ) ) ( not ( = ?auto_146463 ?auto_146465 ) ) ( not ( = ?auto_146467 ?auto_146462 ) ) ( not ( = ?auto_146467 ?auto_146469 ) ) ( not ( = ?auto_146467 ?auto_146464 ) ) ( not ( = ?auto_146467 ?auto_146466 ) ) ( not ( = ?auto_146467 ?auto_146465 ) ) ( ON ?auto_146468 ?auto_146467 ) ( ON ?auto_146462 ?auto_146468 ) ( ON ?auto_146465 ?auto_146462 ) ( ON ?auto_146466 ?auto_146465 ) ( CLEAR ?auto_146466 ) ( HOLDING ?auto_146464 ) ( CLEAR ?auto_146469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146469 ?auto_146464 )
      ( MAKE-1PILE ?auto_146461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146470 - BLOCK
    )
    :vars
    (
      ?auto_146478 - BLOCK
      ?auto_146473 - BLOCK
      ?auto_146474 - BLOCK
      ?auto_146471 - BLOCK
      ?auto_146475 - BLOCK
      ?auto_146476 - BLOCK
      ?auto_146477 - BLOCK
      ?auto_146472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146478 ?auto_146470 ) ( ON-TABLE ?auto_146470 ) ( not ( = ?auto_146470 ?auto_146478 ) ) ( not ( = ?auto_146470 ?auto_146473 ) ) ( not ( = ?auto_146470 ?auto_146474 ) ) ( not ( = ?auto_146478 ?auto_146473 ) ) ( not ( = ?auto_146478 ?auto_146474 ) ) ( not ( = ?auto_146473 ?auto_146474 ) ) ( ON ?auto_146473 ?auto_146478 ) ( ON-TABLE ?auto_146471 ) ( not ( = ?auto_146471 ?auto_146475 ) ) ( not ( = ?auto_146471 ?auto_146476 ) ) ( not ( = ?auto_146471 ?auto_146477 ) ) ( not ( = ?auto_146471 ?auto_146472 ) ) ( not ( = ?auto_146471 ?auto_146474 ) ) ( not ( = ?auto_146475 ?auto_146476 ) ) ( not ( = ?auto_146475 ?auto_146477 ) ) ( not ( = ?auto_146475 ?auto_146472 ) ) ( not ( = ?auto_146475 ?auto_146474 ) ) ( not ( = ?auto_146476 ?auto_146477 ) ) ( not ( = ?auto_146476 ?auto_146472 ) ) ( not ( = ?auto_146476 ?auto_146474 ) ) ( not ( = ?auto_146477 ?auto_146472 ) ) ( not ( = ?auto_146477 ?auto_146474 ) ) ( not ( = ?auto_146472 ?auto_146474 ) ) ( not ( = ?auto_146470 ?auto_146472 ) ) ( not ( = ?auto_146470 ?auto_146471 ) ) ( not ( = ?auto_146470 ?auto_146475 ) ) ( not ( = ?auto_146470 ?auto_146476 ) ) ( not ( = ?auto_146470 ?auto_146477 ) ) ( not ( = ?auto_146478 ?auto_146472 ) ) ( not ( = ?auto_146478 ?auto_146471 ) ) ( not ( = ?auto_146478 ?auto_146475 ) ) ( not ( = ?auto_146478 ?auto_146476 ) ) ( not ( = ?auto_146478 ?auto_146477 ) ) ( not ( = ?auto_146473 ?auto_146472 ) ) ( not ( = ?auto_146473 ?auto_146471 ) ) ( not ( = ?auto_146473 ?auto_146475 ) ) ( not ( = ?auto_146473 ?auto_146476 ) ) ( not ( = ?auto_146473 ?auto_146477 ) ) ( ON ?auto_146474 ?auto_146473 ) ( ON ?auto_146472 ?auto_146474 ) ( ON ?auto_146477 ?auto_146472 ) ( ON ?auto_146476 ?auto_146477 ) ( CLEAR ?auto_146471 ) ( ON ?auto_146475 ?auto_146476 ) ( CLEAR ?auto_146475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146470 ?auto_146478 ?auto_146473 ?auto_146474 ?auto_146472 ?auto_146477 ?auto_146476 )
      ( MAKE-1PILE ?auto_146470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146479 - BLOCK
    )
    :vars
    (
      ?auto_146480 - BLOCK
      ?auto_146487 - BLOCK
      ?auto_146484 - BLOCK
      ?auto_146483 - BLOCK
      ?auto_146482 - BLOCK
      ?auto_146486 - BLOCK
      ?auto_146481 - BLOCK
      ?auto_146485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146480 ?auto_146479 ) ( ON-TABLE ?auto_146479 ) ( not ( = ?auto_146479 ?auto_146480 ) ) ( not ( = ?auto_146479 ?auto_146487 ) ) ( not ( = ?auto_146479 ?auto_146484 ) ) ( not ( = ?auto_146480 ?auto_146487 ) ) ( not ( = ?auto_146480 ?auto_146484 ) ) ( not ( = ?auto_146487 ?auto_146484 ) ) ( ON ?auto_146487 ?auto_146480 ) ( not ( = ?auto_146483 ?auto_146482 ) ) ( not ( = ?auto_146483 ?auto_146486 ) ) ( not ( = ?auto_146483 ?auto_146481 ) ) ( not ( = ?auto_146483 ?auto_146485 ) ) ( not ( = ?auto_146483 ?auto_146484 ) ) ( not ( = ?auto_146482 ?auto_146486 ) ) ( not ( = ?auto_146482 ?auto_146481 ) ) ( not ( = ?auto_146482 ?auto_146485 ) ) ( not ( = ?auto_146482 ?auto_146484 ) ) ( not ( = ?auto_146486 ?auto_146481 ) ) ( not ( = ?auto_146486 ?auto_146485 ) ) ( not ( = ?auto_146486 ?auto_146484 ) ) ( not ( = ?auto_146481 ?auto_146485 ) ) ( not ( = ?auto_146481 ?auto_146484 ) ) ( not ( = ?auto_146485 ?auto_146484 ) ) ( not ( = ?auto_146479 ?auto_146485 ) ) ( not ( = ?auto_146479 ?auto_146483 ) ) ( not ( = ?auto_146479 ?auto_146482 ) ) ( not ( = ?auto_146479 ?auto_146486 ) ) ( not ( = ?auto_146479 ?auto_146481 ) ) ( not ( = ?auto_146480 ?auto_146485 ) ) ( not ( = ?auto_146480 ?auto_146483 ) ) ( not ( = ?auto_146480 ?auto_146482 ) ) ( not ( = ?auto_146480 ?auto_146486 ) ) ( not ( = ?auto_146480 ?auto_146481 ) ) ( not ( = ?auto_146487 ?auto_146485 ) ) ( not ( = ?auto_146487 ?auto_146483 ) ) ( not ( = ?auto_146487 ?auto_146482 ) ) ( not ( = ?auto_146487 ?auto_146486 ) ) ( not ( = ?auto_146487 ?auto_146481 ) ) ( ON ?auto_146484 ?auto_146487 ) ( ON ?auto_146485 ?auto_146484 ) ( ON ?auto_146481 ?auto_146485 ) ( ON ?auto_146486 ?auto_146481 ) ( ON ?auto_146482 ?auto_146486 ) ( CLEAR ?auto_146482 ) ( HOLDING ?auto_146483 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146483 )
      ( MAKE-1PILE ?auto_146479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146488 - BLOCK
    )
    :vars
    (
      ?auto_146491 - BLOCK
      ?auto_146494 - BLOCK
      ?auto_146495 - BLOCK
      ?auto_146492 - BLOCK
      ?auto_146493 - BLOCK
      ?auto_146489 - BLOCK
      ?auto_146496 - BLOCK
      ?auto_146490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146491 ?auto_146488 ) ( ON-TABLE ?auto_146488 ) ( not ( = ?auto_146488 ?auto_146491 ) ) ( not ( = ?auto_146488 ?auto_146494 ) ) ( not ( = ?auto_146488 ?auto_146495 ) ) ( not ( = ?auto_146491 ?auto_146494 ) ) ( not ( = ?auto_146491 ?auto_146495 ) ) ( not ( = ?auto_146494 ?auto_146495 ) ) ( ON ?auto_146494 ?auto_146491 ) ( not ( = ?auto_146492 ?auto_146493 ) ) ( not ( = ?auto_146492 ?auto_146489 ) ) ( not ( = ?auto_146492 ?auto_146496 ) ) ( not ( = ?auto_146492 ?auto_146490 ) ) ( not ( = ?auto_146492 ?auto_146495 ) ) ( not ( = ?auto_146493 ?auto_146489 ) ) ( not ( = ?auto_146493 ?auto_146496 ) ) ( not ( = ?auto_146493 ?auto_146490 ) ) ( not ( = ?auto_146493 ?auto_146495 ) ) ( not ( = ?auto_146489 ?auto_146496 ) ) ( not ( = ?auto_146489 ?auto_146490 ) ) ( not ( = ?auto_146489 ?auto_146495 ) ) ( not ( = ?auto_146496 ?auto_146490 ) ) ( not ( = ?auto_146496 ?auto_146495 ) ) ( not ( = ?auto_146490 ?auto_146495 ) ) ( not ( = ?auto_146488 ?auto_146490 ) ) ( not ( = ?auto_146488 ?auto_146492 ) ) ( not ( = ?auto_146488 ?auto_146493 ) ) ( not ( = ?auto_146488 ?auto_146489 ) ) ( not ( = ?auto_146488 ?auto_146496 ) ) ( not ( = ?auto_146491 ?auto_146490 ) ) ( not ( = ?auto_146491 ?auto_146492 ) ) ( not ( = ?auto_146491 ?auto_146493 ) ) ( not ( = ?auto_146491 ?auto_146489 ) ) ( not ( = ?auto_146491 ?auto_146496 ) ) ( not ( = ?auto_146494 ?auto_146490 ) ) ( not ( = ?auto_146494 ?auto_146492 ) ) ( not ( = ?auto_146494 ?auto_146493 ) ) ( not ( = ?auto_146494 ?auto_146489 ) ) ( not ( = ?auto_146494 ?auto_146496 ) ) ( ON ?auto_146495 ?auto_146494 ) ( ON ?auto_146490 ?auto_146495 ) ( ON ?auto_146496 ?auto_146490 ) ( ON ?auto_146489 ?auto_146496 ) ( ON ?auto_146493 ?auto_146489 ) ( ON ?auto_146492 ?auto_146493 ) ( CLEAR ?auto_146492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146488 ?auto_146491 ?auto_146494 ?auto_146495 ?auto_146490 ?auto_146496 ?auto_146489 ?auto_146493 )
      ( MAKE-1PILE ?auto_146488 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146505 - BLOCK
      ?auto_146506 - BLOCK
      ?auto_146507 - BLOCK
      ?auto_146508 - BLOCK
      ?auto_146509 - BLOCK
      ?auto_146510 - BLOCK
      ?auto_146511 - BLOCK
      ?auto_146512 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_146512 ) ( CLEAR ?auto_146511 ) ( ON-TABLE ?auto_146505 ) ( ON ?auto_146506 ?auto_146505 ) ( ON ?auto_146507 ?auto_146506 ) ( ON ?auto_146508 ?auto_146507 ) ( ON ?auto_146509 ?auto_146508 ) ( ON ?auto_146510 ?auto_146509 ) ( ON ?auto_146511 ?auto_146510 ) ( not ( = ?auto_146505 ?auto_146506 ) ) ( not ( = ?auto_146505 ?auto_146507 ) ) ( not ( = ?auto_146505 ?auto_146508 ) ) ( not ( = ?auto_146505 ?auto_146509 ) ) ( not ( = ?auto_146505 ?auto_146510 ) ) ( not ( = ?auto_146505 ?auto_146511 ) ) ( not ( = ?auto_146505 ?auto_146512 ) ) ( not ( = ?auto_146506 ?auto_146507 ) ) ( not ( = ?auto_146506 ?auto_146508 ) ) ( not ( = ?auto_146506 ?auto_146509 ) ) ( not ( = ?auto_146506 ?auto_146510 ) ) ( not ( = ?auto_146506 ?auto_146511 ) ) ( not ( = ?auto_146506 ?auto_146512 ) ) ( not ( = ?auto_146507 ?auto_146508 ) ) ( not ( = ?auto_146507 ?auto_146509 ) ) ( not ( = ?auto_146507 ?auto_146510 ) ) ( not ( = ?auto_146507 ?auto_146511 ) ) ( not ( = ?auto_146507 ?auto_146512 ) ) ( not ( = ?auto_146508 ?auto_146509 ) ) ( not ( = ?auto_146508 ?auto_146510 ) ) ( not ( = ?auto_146508 ?auto_146511 ) ) ( not ( = ?auto_146508 ?auto_146512 ) ) ( not ( = ?auto_146509 ?auto_146510 ) ) ( not ( = ?auto_146509 ?auto_146511 ) ) ( not ( = ?auto_146509 ?auto_146512 ) ) ( not ( = ?auto_146510 ?auto_146511 ) ) ( not ( = ?auto_146510 ?auto_146512 ) ) ( not ( = ?auto_146511 ?auto_146512 ) ) )
    :subtasks
    ( ( !STACK ?auto_146512 ?auto_146511 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146513 - BLOCK
      ?auto_146514 - BLOCK
      ?auto_146515 - BLOCK
      ?auto_146516 - BLOCK
      ?auto_146517 - BLOCK
      ?auto_146518 - BLOCK
      ?auto_146519 - BLOCK
      ?auto_146520 - BLOCK
    )
    :vars
    (
      ?auto_146521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_146519 ) ( ON-TABLE ?auto_146513 ) ( ON ?auto_146514 ?auto_146513 ) ( ON ?auto_146515 ?auto_146514 ) ( ON ?auto_146516 ?auto_146515 ) ( ON ?auto_146517 ?auto_146516 ) ( ON ?auto_146518 ?auto_146517 ) ( ON ?auto_146519 ?auto_146518 ) ( not ( = ?auto_146513 ?auto_146514 ) ) ( not ( = ?auto_146513 ?auto_146515 ) ) ( not ( = ?auto_146513 ?auto_146516 ) ) ( not ( = ?auto_146513 ?auto_146517 ) ) ( not ( = ?auto_146513 ?auto_146518 ) ) ( not ( = ?auto_146513 ?auto_146519 ) ) ( not ( = ?auto_146513 ?auto_146520 ) ) ( not ( = ?auto_146514 ?auto_146515 ) ) ( not ( = ?auto_146514 ?auto_146516 ) ) ( not ( = ?auto_146514 ?auto_146517 ) ) ( not ( = ?auto_146514 ?auto_146518 ) ) ( not ( = ?auto_146514 ?auto_146519 ) ) ( not ( = ?auto_146514 ?auto_146520 ) ) ( not ( = ?auto_146515 ?auto_146516 ) ) ( not ( = ?auto_146515 ?auto_146517 ) ) ( not ( = ?auto_146515 ?auto_146518 ) ) ( not ( = ?auto_146515 ?auto_146519 ) ) ( not ( = ?auto_146515 ?auto_146520 ) ) ( not ( = ?auto_146516 ?auto_146517 ) ) ( not ( = ?auto_146516 ?auto_146518 ) ) ( not ( = ?auto_146516 ?auto_146519 ) ) ( not ( = ?auto_146516 ?auto_146520 ) ) ( not ( = ?auto_146517 ?auto_146518 ) ) ( not ( = ?auto_146517 ?auto_146519 ) ) ( not ( = ?auto_146517 ?auto_146520 ) ) ( not ( = ?auto_146518 ?auto_146519 ) ) ( not ( = ?auto_146518 ?auto_146520 ) ) ( not ( = ?auto_146519 ?auto_146520 ) ) ( ON ?auto_146520 ?auto_146521 ) ( CLEAR ?auto_146520 ) ( HAND-EMPTY ) ( not ( = ?auto_146513 ?auto_146521 ) ) ( not ( = ?auto_146514 ?auto_146521 ) ) ( not ( = ?auto_146515 ?auto_146521 ) ) ( not ( = ?auto_146516 ?auto_146521 ) ) ( not ( = ?auto_146517 ?auto_146521 ) ) ( not ( = ?auto_146518 ?auto_146521 ) ) ( not ( = ?auto_146519 ?auto_146521 ) ) ( not ( = ?auto_146520 ?auto_146521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146520 ?auto_146521 )
      ( MAKE-8PILE ?auto_146513 ?auto_146514 ?auto_146515 ?auto_146516 ?auto_146517 ?auto_146518 ?auto_146519 ?auto_146520 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146522 - BLOCK
      ?auto_146523 - BLOCK
      ?auto_146524 - BLOCK
      ?auto_146525 - BLOCK
      ?auto_146526 - BLOCK
      ?auto_146527 - BLOCK
      ?auto_146528 - BLOCK
      ?auto_146529 - BLOCK
    )
    :vars
    (
      ?auto_146530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146522 ) ( ON ?auto_146523 ?auto_146522 ) ( ON ?auto_146524 ?auto_146523 ) ( ON ?auto_146525 ?auto_146524 ) ( ON ?auto_146526 ?auto_146525 ) ( ON ?auto_146527 ?auto_146526 ) ( not ( = ?auto_146522 ?auto_146523 ) ) ( not ( = ?auto_146522 ?auto_146524 ) ) ( not ( = ?auto_146522 ?auto_146525 ) ) ( not ( = ?auto_146522 ?auto_146526 ) ) ( not ( = ?auto_146522 ?auto_146527 ) ) ( not ( = ?auto_146522 ?auto_146528 ) ) ( not ( = ?auto_146522 ?auto_146529 ) ) ( not ( = ?auto_146523 ?auto_146524 ) ) ( not ( = ?auto_146523 ?auto_146525 ) ) ( not ( = ?auto_146523 ?auto_146526 ) ) ( not ( = ?auto_146523 ?auto_146527 ) ) ( not ( = ?auto_146523 ?auto_146528 ) ) ( not ( = ?auto_146523 ?auto_146529 ) ) ( not ( = ?auto_146524 ?auto_146525 ) ) ( not ( = ?auto_146524 ?auto_146526 ) ) ( not ( = ?auto_146524 ?auto_146527 ) ) ( not ( = ?auto_146524 ?auto_146528 ) ) ( not ( = ?auto_146524 ?auto_146529 ) ) ( not ( = ?auto_146525 ?auto_146526 ) ) ( not ( = ?auto_146525 ?auto_146527 ) ) ( not ( = ?auto_146525 ?auto_146528 ) ) ( not ( = ?auto_146525 ?auto_146529 ) ) ( not ( = ?auto_146526 ?auto_146527 ) ) ( not ( = ?auto_146526 ?auto_146528 ) ) ( not ( = ?auto_146526 ?auto_146529 ) ) ( not ( = ?auto_146527 ?auto_146528 ) ) ( not ( = ?auto_146527 ?auto_146529 ) ) ( not ( = ?auto_146528 ?auto_146529 ) ) ( ON ?auto_146529 ?auto_146530 ) ( CLEAR ?auto_146529 ) ( not ( = ?auto_146522 ?auto_146530 ) ) ( not ( = ?auto_146523 ?auto_146530 ) ) ( not ( = ?auto_146524 ?auto_146530 ) ) ( not ( = ?auto_146525 ?auto_146530 ) ) ( not ( = ?auto_146526 ?auto_146530 ) ) ( not ( = ?auto_146527 ?auto_146530 ) ) ( not ( = ?auto_146528 ?auto_146530 ) ) ( not ( = ?auto_146529 ?auto_146530 ) ) ( HOLDING ?auto_146528 ) ( CLEAR ?auto_146527 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146522 ?auto_146523 ?auto_146524 ?auto_146525 ?auto_146526 ?auto_146527 ?auto_146528 )
      ( MAKE-8PILE ?auto_146522 ?auto_146523 ?auto_146524 ?auto_146525 ?auto_146526 ?auto_146527 ?auto_146528 ?auto_146529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146531 - BLOCK
      ?auto_146532 - BLOCK
      ?auto_146533 - BLOCK
      ?auto_146534 - BLOCK
      ?auto_146535 - BLOCK
      ?auto_146536 - BLOCK
      ?auto_146537 - BLOCK
      ?auto_146538 - BLOCK
    )
    :vars
    (
      ?auto_146539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146531 ) ( ON ?auto_146532 ?auto_146531 ) ( ON ?auto_146533 ?auto_146532 ) ( ON ?auto_146534 ?auto_146533 ) ( ON ?auto_146535 ?auto_146534 ) ( ON ?auto_146536 ?auto_146535 ) ( not ( = ?auto_146531 ?auto_146532 ) ) ( not ( = ?auto_146531 ?auto_146533 ) ) ( not ( = ?auto_146531 ?auto_146534 ) ) ( not ( = ?auto_146531 ?auto_146535 ) ) ( not ( = ?auto_146531 ?auto_146536 ) ) ( not ( = ?auto_146531 ?auto_146537 ) ) ( not ( = ?auto_146531 ?auto_146538 ) ) ( not ( = ?auto_146532 ?auto_146533 ) ) ( not ( = ?auto_146532 ?auto_146534 ) ) ( not ( = ?auto_146532 ?auto_146535 ) ) ( not ( = ?auto_146532 ?auto_146536 ) ) ( not ( = ?auto_146532 ?auto_146537 ) ) ( not ( = ?auto_146532 ?auto_146538 ) ) ( not ( = ?auto_146533 ?auto_146534 ) ) ( not ( = ?auto_146533 ?auto_146535 ) ) ( not ( = ?auto_146533 ?auto_146536 ) ) ( not ( = ?auto_146533 ?auto_146537 ) ) ( not ( = ?auto_146533 ?auto_146538 ) ) ( not ( = ?auto_146534 ?auto_146535 ) ) ( not ( = ?auto_146534 ?auto_146536 ) ) ( not ( = ?auto_146534 ?auto_146537 ) ) ( not ( = ?auto_146534 ?auto_146538 ) ) ( not ( = ?auto_146535 ?auto_146536 ) ) ( not ( = ?auto_146535 ?auto_146537 ) ) ( not ( = ?auto_146535 ?auto_146538 ) ) ( not ( = ?auto_146536 ?auto_146537 ) ) ( not ( = ?auto_146536 ?auto_146538 ) ) ( not ( = ?auto_146537 ?auto_146538 ) ) ( ON ?auto_146538 ?auto_146539 ) ( not ( = ?auto_146531 ?auto_146539 ) ) ( not ( = ?auto_146532 ?auto_146539 ) ) ( not ( = ?auto_146533 ?auto_146539 ) ) ( not ( = ?auto_146534 ?auto_146539 ) ) ( not ( = ?auto_146535 ?auto_146539 ) ) ( not ( = ?auto_146536 ?auto_146539 ) ) ( not ( = ?auto_146537 ?auto_146539 ) ) ( not ( = ?auto_146538 ?auto_146539 ) ) ( CLEAR ?auto_146536 ) ( ON ?auto_146537 ?auto_146538 ) ( CLEAR ?auto_146537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146539 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146539 ?auto_146538 )
      ( MAKE-8PILE ?auto_146531 ?auto_146532 ?auto_146533 ?auto_146534 ?auto_146535 ?auto_146536 ?auto_146537 ?auto_146538 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146540 - BLOCK
      ?auto_146541 - BLOCK
      ?auto_146542 - BLOCK
      ?auto_146543 - BLOCK
      ?auto_146544 - BLOCK
      ?auto_146545 - BLOCK
      ?auto_146546 - BLOCK
      ?auto_146547 - BLOCK
    )
    :vars
    (
      ?auto_146548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146540 ) ( ON ?auto_146541 ?auto_146540 ) ( ON ?auto_146542 ?auto_146541 ) ( ON ?auto_146543 ?auto_146542 ) ( ON ?auto_146544 ?auto_146543 ) ( not ( = ?auto_146540 ?auto_146541 ) ) ( not ( = ?auto_146540 ?auto_146542 ) ) ( not ( = ?auto_146540 ?auto_146543 ) ) ( not ( = ?auto_146540 ?auto_146544 ) ) ( not ( = ?auto_146540 ?auto_146545 ) ) ( not ( = ?auto_146540 ?auto_146546 ) ) ( not ( = ?auto_146540 ?auto_146547 ) ) ( not ( = ?auto_146541 ?auto_146542 ) ) ( not ( = ?auto_146541 ?auto_146543 ) ) ( not ( = ?auto_146541 ?auto_146544 ) ) ( not ( = ?auto_146541 ?auto_146545 ) ) ( not ( = ?auto_146541 ?auto_146546 ) ) ( not ( = ?auto_146541 ?auto_146547 ) ) ( not ( = ?auto_146542 ?auto_146543 ) ) ( not ( = ?auto_146542 ?auto_146544 ) ) ( not ( = ?auto_146542 ?auto_146545 ) ) ( not ( = ?auto_146542 ?auto_146546 ) ) ( not ( = ?auto_146542 ?auto_146547 ) ) ( not ( = ?auto_146543 ?auto_146544 ) ) ( not ( = ?auto_146543 ?auto_146545 ) ) ( not ( = ?auto_146543 ?auto_146546 ) ) ( not ( = ?auto_146543 ?auto_146547 ) ) ( not ( = ?auto_146544 ?auto_146545 ) ) ( not ( = ?auto_146544 ?auto_146546 ) ) ( not ( = ?auto_146544 ?auto_146547 ) ) ( not ( = ?auto_146545 ?auto_146546 ) ) ( not ( = ?auto_146545 ?auto_146547 ) ) ( not ( = ?auto_146546 ?auto_146547 ) ) ( ON ?auto_146547 ?auto_146548 ) ( not ( = ?auto_146540 ?auto_146548 ) ) ( not ( = ?auto_146541 ?auto_146548 ) ) ( not ( = ?auto_146542 ?auto_146548 ) ) ( not ( = ?auto_146543 ?auto_146548 ) ) ( not ( = ?auto_146544 ?auto_146548 ) ) ( not ( = ?auto_146545 ?auto_146548 ) ) ( not ( = ?auto_146546 ?auto_146548 ) ) ( not ( = ?auto_146547 ?auto_146548 ) ) ( ON ?auto_146546 ?auto_146547 ) ( CLEAR ?auto_146546 ) ( ON-TABLE ?auto_146548 ) ( HOLDING ?auto_146545 ) ( CLEAR ?auto_146544 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146540 ?auto_146541 ?auto_146542 ?auto_146543 ?auto_146544 ?auto_146545 )
      ( MAKE-8PILE ?auto_146540 ?auto_146541 ?auto_146542 ?auto_146543 ?auto_146544 ?auto_146545 ?auto_146546 ?auto_146547 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146549 - BLOCK
      ?auto_146550 - BLOCK
      ?auto_146551 - BLOCK
      ?auto_146552 - BLOCK
      ?auto_146553 - BLOCK
      ?auto_146554 - BLOCK
      ?auto_146555 - BLOCK
      ?auto_146556 - BLOCK
    )
    :vars
    (
      ?auto_146557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146549 ) ( ON ?auto_146550 ?auto_146549 ) ( ON ?auto_146551 ?auto_146550 ) ( ON ?auto_146552 ?auto_146551 ) ( ON ?auto_146553 ?auto_146552 ) ( not ( = ?auto_146549 ?auto_146550 ) ) ( not ( = ?auto_146549 ?auto_146551 ) ) ( not ( = ?auto_146549 ?auto_146552 ) ) ( not ( = ?auto_146549 ?auto_146553 ) ) ( not ( = ?auto_146549 ?auto_146554 ) ) ( not ( = ?auto_146549 ?auto_146555 ) ) ( not ( = ?auto_146549 ?auto_146556 ) ) ( not ( = ?auto_146550 ?auto_146551 ) ) ( not ( = ?auto_146550 ?auto_146552 ) ) ( not ( = ?auto_146550 ?auto_146553 ) ) ( not ( = ?auto_146550 ?auto_146554 ) ) ( not ( = ?auto_146550 ?auto_146555 ) ) ( not ( = ?auto_146550 ?auto_146556 ) ) ( not ( = ?auto_146551 ?auto_146552 ) ) ( not ( = ?auto_146551 ?auto_146553 ) ) ( not ( = ?auto_146551 ?auto_146554 ) ) ( not ( = ?auto_146551 ?auto_146555 ) ) ( not ( = ?auto_146551 ?auto_146556 ) ) ( not ( = ?auto_146552 ?auto_146553 ) ) ( not ( = ?auto_146552 ?auto_146554 ) ) ( not ( = ?auto_146552 ?auto_146555 ) ) ( not ( = ?auto_146552 ?auto_146556 ) ) ( not ( = ?auto_146553 ?auto_146554 ) ) ( not ( = ?auto_146553 ?auto_146555 ) ) ( not ( = ?auto_146553 ?auto_146556 ) ) ( not ( = ?auto_146554 ?auto_146555 ) ) ( not ( = ?auto_146554 ?auto_146556 ) ) ( not ( = ?auto_146555 ?auto_146556 ) ) ( ON ?auto_146556 ?auto_146557 ) ( not ( = ?auto_146549 ?auto_146557 ) ) ( not ( = ?auto_146550 ?auto_146557 ) ) ( not ( = ?auto_146551 ?auto_146557 ) ) ( not ( = ?auto_146552 ?auto_146557 ) ) ( not ( = ?auto_146553 ?auto_146557 ) ) ( not ( = ?auto_146554 ?auto_146557 ) ) ( not ( = ?auto_146555 ?auto_146557 ) ) ( not ( = ?auto_146556 ?auto_146557 ) ) ( ON ?auto_146555 ?auto_146556 ) ( ON-TABLE ?auto_146557 ) ( CLEAR ?auto_146553 ) ( ON ?auto_146554 ?auto_146555 ) ( CLEAR ?auto_146554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146557 ?auto_146556 ?auto_146555 )
      ( MAKE-8PILE ?auto_146549 ?auto_146550 ?auto_146551 ?auto_146552 ?auto_146553 ?auto_146554 ?auto_146555 ?auto_146556 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146558 - BLOCK
      ?auto_146559 - BLOCK
      ?auto_146560 - BLOCK
      ?auto_146561 - BLOCK
      ?auto_146562 - BLOCK
      ?auto_146563 - BLOCK
      ?auto_146564 - BLOCK
      ?auto_146565 - BLOCK
    )
    :vars
    (
      ?auto_146566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146558 ) ( ON ?auto_146559 ?auto_146558 ) ( ON ?auto_146560 ?auto_146559 ) ( ON ?auto_146561 ?auto_146560 ) ( not ( = ?auto_146558 ?auto_146559 ) ) ( not ( = ?auto_146558 ?auto_146560 ) ) ( not ( = ?auto_146558 ?auto_146561 ) ) ( not ( = ?auto_146558 ?auto_146562 ) ) ( not ( = ?auto_146558 ?auto_146563 ) ) ( not ( = ?auto_146558 ?auto_146564 ) ) ( not ( = ?auto_146558 ?auto_146565 ) ) ( not ( = ?auto_146559 ?auto_146560 ) ) ( not ( = ?auto_146559 ?auto_146561 ) ) ( not ( = ?auto_146559 ?auto_146562 ) ) ( not ( = ?auto_146559 ?auto_146563 ) ) ( not ( = ?auto_146559 ?auto_146564 ) ) ( not ( = ?auto_146559 ?auto_146565 ) ) ( not ( = ?auto_146560 ?auto_146561 ) ) ( not ( = ?auto_146560 ?auto_146562 ) ) ( not ( = ?auto_146560 ?auto_146563 ) ) ( not ( = ?auto_146560 ?auto_146564 ) ) ( not ( = ?auto_146560 ?auto_146565 ) ) ( not ( = ?auto_146561 ?auto_146562 ) ) ( not ( = ?auto_146561 ?auto_146563 ) ) ( not ( = ?auto_146561 ?auto_146564 ) ) ( not ( = ?auto_146561 ?auto_146565 ) ) ( not ( = ?auto_146562 ?auto_146563 ) ) ( not ( = ?auto_146562 ?auto_146564 ) ) ( not ( = ?auto_146562 ?auto_146565 ) ) ( not ( = ?auto_146563 ?auto_146564 ) ) ( not ( = ?auto_146563 ?auto_146565 ) ) ( not ( = ?auto_146564 ?auto_146565 ) ) ( ON ?auto_146565 ?auto_146566 ) ( not ( = ?auto_146558 ?auto_146566 ) ) ( not ( = ?auto_146559 ?auto_146566 ) ) ( not ( = ?auto_146560 ?auto_146566 ) ) ( not ( = ?auto_146561 ?auto_146566 ) ) ( not ( = ?auto_146562 ?auto_146566 ) ) ( not ( = ?auto_146563 ?auto_146566 ) ) ( not ( = ?auto_146564 ?auto_146566 ) ) ( not ( = ?auto_146565 ?auto_146566 ) ) ( ON ?auto_146564 ?auto_146565 ) ( ON-TABLE ?auto_146566 ) ( ON ?auto_146563 ?auto_146564 ) ( CLEAR ?auto_146563 ) ( HOLDING ?auto_146562 ) ( CLEAR ?auto_146561 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146558 ?auto_146559 ?auto_146560 ?auto_146561 ?auto_146562 )
      ( MAKE-8PILE ?auto_146558 ?auto_146559 ?auto_146560 ?auto_146561 ?auto_146562 ?auto_146563 ?auto_146564 ?auto_146565 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146567 - BLOCK
      ?auto_146568 - BLOCK
      ?auto_146569 - BLOCK
      ?auto_146570 - BLOCK
      ?auto_146571 - BLOCK
      ?auto_146572 - BLOCK
      ?auto_146573 - BLOCK
      ?auto_146574 - BLOCK
    )
    :vars
    (
      ?auto_146575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146567 ) ( ON ?auto_146568 ?auto_146567 ) ( ON ?auto_146569 ?auto_146568 ) ( ON ?auto_146570 ?auto_146569 ) ( not ( = ?auto_146567 ?auto_146568 ) ) ( not ( = ?auto_146567 ?auto_146569 ) ) ( not ( = ?auto_146567 ?auto_146570 ) ) ( not ( = ?auto_146567 ?auto_146571 ) ) ( not ( = ?auto_146567 ?auto_146572 ) ) ( not ( = ?auto_146567 ?auto_146573 ) ) ( not ( = ?auto_146567 ?auto_146574 ) ) ( not ( = ?auto_146568 ?auto_146569 ) ) ( not ( = ?auto_146568 ?auto_146570 ) ) ( not ( = ?auto_146568 ?auto_146571 ) ) ( not ( = ?auto_146568 ?auto_146572 ) ) ( not ( = ?auto_146568 ?auto_146573 ) ) ( not ( = ?auto_146568 ?auto_146574 ) ) ( not ( = ?auto_146569 ?auto_146570 ) ) ( not ( = ?auto_146569 ?auto_146571 ) ) ( not ( = ?auto_146569 ?auto_146572 ) ) ( not ( = ?auto_146569 ?auto_146573 ) ) ( not ( = ?auto_146569 ?auto_146574 ) ) ( not ( = ?auto_146570 ?auto_146571 ) ) ( not ( = ?auto_146570 ?auto_146572 ) ) ( not ( = ?auto_146570 ?auto_146573 ) ) ( not ( = ?auto_146570 ?auto_146574 ) ) ( not ( = ?auto_146571 ?auto_146572 ) ) ( not ( = ?auto_146571 ?auto_146573 ) ) ( not ( = ?auto_146571 ?auto_146574 ) ) ( not ( = ?auto_146572 ?auto_146573 ) ) ( not ( = ?auto_146572 ?auto_146574 ) ) ( not ( = ?auto_146573 ?auto_146574 ) ) ( ON ?auto_146574 ?auto_146575 ) ( not ( = ?auto_146567 ?auto_146575 ) ) ( not ( = ?auto_146568 ?auto_146575 ) ) ( not ( = ?auto_146569 ?auto_146575 ) ) ( not ( = ?auto_146570 ?auto_146575 ) ) ( not ( = ?auto_146571 ?auto_146575 ) ) ( not ( = ?auto_146572 ?auto_146575 ) ) ( not ( = ?auto_146573 ?auto_146575 ) ) ( not ( = ?auto_146574 ?auto_146575 ) ) ( ON ?auto_146573 ?auto_146574 ) ( ON-TABLE ?auto_146575 ) ( ON ?auto_146572 ?auto_146573 ) ( CLEAR ?auto_146570 ) ( ON ?auto_146571 ?auto_146572 ) ( CLEAR ?auto_146571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146575 ?auto_146574 ?auto_146573 ?auto_146572 )
      ( MAKE-8PILE ?auto_146567 ?auto_146568 ?auto_146569 ?auto_146570 ?auto_146571 ?auto_146572 ?auto_146573 ?auto_146574 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146576 - BLOCK
      ?auto_146577 - BLOCK
      ?auto_146578 - BLOCK
      ?auto_146579 - BLOCK
      ?auto_146580 - BLOCK
      ?auto_146581 - BLOCK
      ?auto_146582 - BLOCK
      ?auto_146583 - BLOCK
    )
    :vars
    (
      ?auto_146584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146576 ) ( ON ?auto_146577 ?auto_146576 ) ( ON ?auto_146578 ?auto_146577 ) ( not ( = ?auto_146576 ?auto_146577 ) ) ( not ( = ?auto_146576 ?auto_146578 ) ) ( not ( = ?auto_146576 ?auto_146579 ) ) ( not ( = ?auto_146576 ?auto_146580 ) ) ( not ( = ?auto_146576 ?auto_146581 ) ) ( not ( = ?auto_146576 ?auto_146582 ) ) ( not ( = ?auto_146576 ?auto_146583 ) ) ( not ( = ?auto_146577 ?auto_146578 ) ) ( not ( = ?auto_146577 ?auto_146579 ) ) ( not ( = ?auto_146577 ?auto_146580 ) ) ( not ( = ?auto_146577 ?auto_146581 ) ) ( not ( = ?auto_146577 ?auto_146582 ) ) ( not ( = ?auto_146577 ?auto_146583 ) ) ( not ( = ?auto_146578 ?auto_146579 ) ) ( not ( = ?auto_146578 ?auto_146580 ) ) ( not ( = ?auto_146578 ?auto_146581 ) ) ( not ( = ?auto_146578 ?auto_146582 ) ) ( not ( = ?auto_146578 ?auto_146583 ) ) ( not ( = ?auto_146579 ?auto_146580 ) ) ( not ( = ?auto_146579 ?auto_146581 ) ) ( not ( = ?auto_146579 ?auto_146582 ) ) ( not ( = ?auto_146579 ?auto_146583 ) ) ( not ( = ?auto_146580 ?auto_146581 ) ) ( not ( = ?auto_146580 ?auto_146582 ) ) ( not ( = ?auto_146580 ?auto_146583 ) ) ( not ( = ?auto_146581 ?auto_146582 ) ) ( not ( = ?auto_146581 ?auto_146583 ) ) ( not ( = ?auto_146582 ?auto_146583 ) ) ( ON ?auto_146583 ?auto_146584 ) ( not ( = ?auto_146576 ?auto_146584 ) ) ( not ( = ?auto_146577 ?auto_146584 ) ) ( not ( = ?auto_146578 ?auto_146584 ) ) ( not ( = ?auto_146579 ?auto_146584 ) ) ( not ( = ?auto_146580 ?auto_146584 ) ) ( not ( = ?auto_146581 ?auto_146584 ) ) ( not ( = ?auto_146582 ?auto_146584 ) ) ( not ( = ?auto_146583 ?auto_146584 ) ) ( ON ?auto_146582 ?auto_146583 ) ( ON-TABLE ?auto_146584 ) ( ON ?auto_146581 ?auto_146582 ) ( ON ?auto_146580 ?auto_146581 ) ( CLEAR ?auto_146580 ) ( HOLDING ?auto_146579 ) ( CLEAR ?auto_146578 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146576 ?auto_146577 ?auto_146578 ?auto_146579 )
      ( MAKE-8PILE ?auto_146576 ?auto_146577 ?auto_146578 ?auto_146579 ?auto_146580 ?auto_146581 ?auto_146582 ?auto_146583 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146585 - BLOCK
      ?auto_146586 - BLOCK
      ?auto_146587 - BLOCK
      ?auto_146588 - BLOCK
      ?auto_146589 - BLOCK
      ?auto_146590 - BLOCK
      ?auto_146591 - BLOCK
      ?auto_146592 - BLOCK
    )
    :vars
    (
      ?auto_146593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146585 ) ( ON ?auto_146586 ?auto_146585 ) ( ON ?auto_146587 ?auto_146586 ) ( not ( = ?auto_146585 ?auto_146586 ) ) ( not ( = ?auto_146585 ?auto_146587 ) ) ( not ( = ?auto_146585 ?auto_146588 ) ) ( not ( = ?auto_146585 ?auto_146589 ) ) ( not ( = ?auto_146585 ?auto_146590 ) ) ( not ( = ?auto_146585 ?auto_146591 ) ) ( not ( = ?auto_146585 ?auto_146592 ) ) ( not ( = ?auto_146586 ?auto_146587 ) ) ( not ( = ?auto_146586 ?auto_146588 ) ) ( not ( = ?auto_146586 ?auto_146589 ) ) ( not ( = ?auto_146586 ?auto_146590 ) ) ( not ( = ?auto_146586 ?auto_146591 ) ) ( not ( = ?auto_146586 ?auto_146592 ) ) ( not ( = ?auto_146587 ?auto_146588 ) ) ( not ( = ?auto_146587 ?auto_146589 ) ) ( not ( = ?auto_146587 ?auto_146590 ) ) ( not ( = ?auto_146587 ?auto_146591 ) ) ( not ( = ?auto_146587 ?auto_146592 ) ) ( not ( = ?auto_146588 ?auto_146589 ) ) ( not ( = ?auto_146588 ?auto_146590 ) ) ( not ( = ?auto_146588 ?auto_146591 ) ) ( not ( = ?auto_146588 ?auto_146592 ) ) ( not ( = ?auto_146589 ?auto_146590 ) ) ( not ( = ?auto_146589 ?auto_146591 ) ) ( not ( = ?auto_146589 ?auto_146592 ) ) ( not ( = ?auto_146590 ?auto_146591 ) ) ( not ( = ?auto_146590 ?auto_146592 ) ) ( not ( = ?auto_146591 ?auto_146592 ) ) ( ON ?auto_146592 ?auto_146593 ) ( not ( = ?auto_146585 ?auto_146593 ) ) ( not ( = ?auto_146586 ?auto_146593 ) ) ( not ( = ?auto_146587 ?auto_146593 ) ) ( not ( = ?auto_146588 ?auto_146593 ) ) ( not ( = ?auto_146589 ?auto_146593 ) ) ( not ( = ?auto_146590 ?auto_146593 ) ) ( not ( = ?auto_146591 ?auto_146593 ) ) ( not ( = ?auto_146592 ?auto_146593 ) ) ( ON ?auto_146591 ?auto_146592 ) ( ON-TABLE ?auto_146593 ) ( ON ?auto_146590 ?auto_146591 ) ( ON ?auto_146589 ?auto_146590 ) ( CLEAR ?auto_146587 ) ( ON ?auto_146588 ?auto_146589 ) ( CLEAR ?auto_146588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146593 ?auto_146592 ?auto_146591 ?auto_146590 ?auto_146589 )
      ( MAKE-8PILE ?auto_146585 ?auto_146586 ?auto_146587 ?auto_146588 ?auto_146589 ?auto_146590 ?auto_146591 ?auto_146592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146594 - BLOCK
      ?auto_146595 - BLOCK
      ?auto_146596 - BLOCK
      ?auto_146597 - BLOCK
      ?auto_146598 - BLOCK
      ?auto_146599 - BLOCK
      ?auto_146600 - BLOCK
      ?auto_146601 - BLOCK
    )
    :vars
    (
      ?auto_146602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146594 ) ( ON ?auto_146595 ?auto_146594 ) ( not ( = ?auto_146594 ?auto_146595 ) ) ( not ( = ?auto_146594 ?auto_146596 ) ) ( not ( = ?auto_146594 ?auto_146597 ) ) ( not ( = ?auto_146594 ?auto_146598 ) ) ( not ( = ?auto_146594 ?auto_146599 ) ) ( not ( = ?auto_146594 ?auto_146600 ) ) ( not ( = ?auto_146594 ?auto_146601 ) ) ( not ( = ?auto_146595 ?auto_146596 ) ) ( not ( = ?auto_146595 ?auto_146597 ) ) ( not ( = ?auto_146595 ?auto_146598 ) ) ( not ( = ?auto_146595 ?auto_146599 ) ) ( not ( = ?auto_146595 ?auto_146600 ) ) ( not ( = ?auto_146595 ?auto_146601 ) ) ( not ( = ?auto_146596 ?auto_146597 ) ) ( not ( = ?auto_146596 ?auto_146598 ) ) ( not ( = ?auto_146596 ?auto_146599 ) ) ( not ( = ?auto_146596 ?auto_146600 ) ) ( not ( = ?auto_146596 ?auto_146601 ) ) ( not ( = ?auto_146597 ?auto_146598 ) ) ( not ( = ?auto_146597 ?auto_146599 ) ) ( not ( = ?auto_146597 ?auto_146600 ) ) ( not ( = ?auto_146597 ?auto_146601 ) ) ( not ( = ?auto_146598 ?auto_146599 ) ) ( not ( = ?auto_146598 ?auto_146600 ) ) ( not ( = ?auto_146598 ?auto_146601 ) ) ( not ( = ?auto_146599 ?auto_146600 ) ) ( not ( = ?auto_146599 ?auto_146601 ) ) ( not ( = ?auto_146600 ?auto_146601 ) ) ( ON ?auto_146601 ?auto_146602 ) ( not ( = ?auto_146594 ?auto_146602 ) ) ( not ( = ?auto_146595 ?auto_146602 ) ) ( not ( = ?auto_146596 ?auto_146602 ) ) ( not ( = ?auto_146597 ?auto_146602 ) ) ( not ( = ?auto_146598 ?auto_146602 ) ) ( not ( = ?auto_146599 ?auto_146602 ) ) ( not ( = ?auto_146600 ?auto_146602 ) ) ( not ( = ?auto_146601 ?auto_146602 ) ) ( ON ?auto_146600 ?auto_146601 ) ( ON-TABLE ?auto_146602 ) ( ON ?auto_146599 ?auto_146600 ) ( ON ?auto_146598 ?auto_146599 ) ( ON ?auto_146597 ?auto_146598 ) ( CLEAR ?auto_146597 ) ( HOLDING ?auto_146596 ) ( CLEAR ?auto_146595 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146594 ?auto_146595 ?auto_146596 )
      ( MAKE-8PILE ?auto_146594 ?auto_146595 ?auto_146596 ?auto_146597 ?auto_146598 ?auto_146599 ?auto_146600 ?auto_146601 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146603 - BLOCK
      ?auto_146604 - BLOCK
      ?auto_146605 - BLOCK
      ?auto_146606 - BLOCK
      ?auto_146607 - BLOCK
      ?auto_146608 - BLOCK
      ?auto_146609 - BLOCK
      ?auto_146610 - BLOCK
    )
    :vars
    (
      ?auto_146611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146603 ) ( ON ?auto_146604 ?auto_146603 ) ( not ( = ?auto_146603 ?auto_146604 ) ) ( not ( = ?auto_146603 ?auto_146605 ) ) ( not ( = ?auto_146603 ?auto_146606 ) ) ( not ( = ?auto_146603 ?auto_146607 ) ) ( not ( = ?auto_146603 ?auto_146608 ) ) ( not ( = ?auto_146603 ?auto_146609 ) ) ( not ( = ?auto_146603 ?auto_146610 ) ) ( not ( = ?auto_146604 ?auto_146605 ) ) ( not ( = ?auto_146604 ?auto_146606 ) ) ( not ( = ?auto_146604 ?auto_146607 ) ) ( not ( = ?auto_146604 ?auto_146608 ) ) ( not ( = ?auto_146604 ?auto_146609 ) ) ( not ( = ?auto_146604 ?auto_146610 ) ) ( not ( = ?auto_146605 ?auto_146606 ) ) ( not ( = ?auto_146605 ?auto_146607 ) ) ( not ( = ?auto_146605 ?auto_146608 ) ) ( not ( = ?auto_146605 ?auto_146609 ) ) ( not ( = ?auto_146605 ?auto_146610 ) ) ( not ( = ?auto_146606 ?auto_146607 ) ) ( not ( = ?auto_146606 ?auto_146608 ) ) ( not ( = ?auto_146606 ?auto_146609 ) ) ( not ( = ?auto_146606 ?auto_146610 ) ) ( not ( = ?auto_146607 ?auto_146608 ) ) ( not ( = ?auto_146607 ?auto_146609 ) ) ( not ( = ?auto_146607 ?auto_146610 ) ) ( not ( = ?auto_146608 ?auto_146609 ) ) ( not ( = ?auto_146608 ?auto_146610 ) ) ( not ( = ?auto_146609 ?auto_146610 ) ) ( ON ?auto_146610 ?auto_146611 ) ( not ( = ?auto_146603 ?auto_146611 ) ) ( not ( = ?auto_146604 ?auto_146611 ) ) ( not ( = ?auto_146605 ?auto_146611 ) ) ( not ( = ?auto_146606 ?auto_146611 ) ) ( not ( = ?auto_146607 ?auto_146611 ) ) ( not ( = ?auto_146608 ?auto_146611 ) ) ( not ( = ?auto_146609 ?auto_146611 ) ) ( not ( = ?auto_146610 ?auto_146611 ) ) ( ON ?auto_146609 ?auto_146610 ) ( ON-TABLE ?auto_146611 ) ( ON ?auto_146608 ?auto_146609 ) ( ON ?auto_146607 ?auto_146608 ) ( ON ?auto_146606 ?auto_146607 ) ( CLEAR ?auto_146604 ) ( ON ?auto_146605 ?auto_146606 ) ( CLEAR ?auto_146605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146611 ?auto_146610 ?auto_146609 ?auto_146608 ?auto_146607 ?auto_146606 )
      ( MAKE-8PILE ?auto_146603 ?auto_146604 ?auto_146605 ?auto_146606 ?auto_146607 ?auto_146608 ?auto_146609 ?auto_146610 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146612 - BLOCK
      ?auto_146613 - BLOCK
      ?auto_146614 - BLOCK
      ?auto_146615 - BLOCK
      ?auto_146616 - BLOCK
      ?auto_146617 - BLOCK
      ?auto_146618 - BLOCK
      ?auto_146619 - BLOCK
    )
    :vars
    (
      ?auto_146620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146612 ) ( not ( = ?auto_146612 ?auto_146613 ) ) ( not ( = ?auto_146612 ?auto_146614 ) ) ( not ( = ?auto_146612 ?auto_146615 ) ) ( not ( = ?auto_146612 ?auto_146616 ) ) ( not ( = ?auto_146612 ?auto_146617 ) ) ( not ( = ?auto_146612 ?auto_146618 ) ) ( not ( = ?auto_146612 ?auto_146619 ) ) ( not ( = ?auto_146613 ?auto_146614 ) ) ( not ( = ?auto_146613 ?auto_146615 ) ) ( not ( = ?auto_146613 ?auto_146616 ) ) ( not ( = ?auto_146613 ?auto_146617 ) ) ( not ( = ?auto_146613 ?auto_146618 ) ) ( not ( = ?auto_146613 ?auto_146619 ) ) ( not ( = ?auto_146614 ?auto_146615 ) ) ( not ( = ?auto_146614 ?auto_146616 ) ) ( not ( = ?auto_146614 ?auto_146617 ) ) ( not ( = ?auto_146614 ?auto_146618 ) ) ( not ( = ?auto_146614 ?auto_146619 ) ) ( not ( = ?auto_146615 ?auto_146616 ) ) ( not ( = ?auto_146615 ?auto_146617 ) ) ( not ( = ?auto_146615 ?auto_146618 ) ) ( not ( = ?auto_146615 ?auto_146619 ) ) ( not ( = ?auto_146616 ?auto_146617 ) ) ( not ( = ?auto_146616 ?auto_146618 ) ) ( not ( = ?auto_146616 ?auto_146619 ) ) ( not ( = ?auto_146617 ?auto_146618 ) ) ( not ( = ?auto_146617 ?auto_146619 ) ) ( not ( = ?auto_146618 ?auto_146619 ) ) ( ON ?auto_146619 ?auto_146620 ) ( not ( = ?auto_146612 ?auto_146620 ) ) ( not ( = ?auto_146613 ?auto_146620 ) ) ( not ( = ?auto_146614 ?auto_146620 ) ) ( not ( = ?auto_146615 ?auto_146620 ) ) ( not ( = ?auto_146616 ?auto_146620 ) ) ( not ( = ?auto_146617 ?auto_146620 ) ) ( not ( = ?auto_146618 ?auto_146620 ) ) ( not ( = ?auto_146619 ?auto_146620 ) ) ( ON ?auto_146618 ?auto_146619 ) ( ON-TABLE ?auto_146620 ) ( ON ?auto_146617 ?auto_146618 ) ( ON ?auto_146616 ?auto_146617 ) ( ON ?auto_146615 ?auto_146616 ) ( ON ?auto_146614 ?auto_146615 ) ( CLEAR ?auto_146614 ) ( HOLDING ?auto_146613 ) ( CLEAR ?auto_146612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146612 ?auto_146613 )
      ( MAKE-8PILE ?auto_146612 ?auto_146613 ?auto_146614 ?auto_146615 ?auto_146616 ?auto_146617 ?auto_146618 ?auto_146619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146621 - BLOCK
      ?auto_146622 - BLOCK
      ?auto_146623 - BLOCK
      ?auto_146624 - BLOCK
      ?auto_146625 - BLOCK
      ?auto_146626 - BLOCK
      ?auto_146627 - BLOCK
      ?auto_146628 - BLOCK
    )
    :vars
    (
      ?auto_146629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146621 ) ( not ( = ?auto_146621 ?auto_146622 ) ) ( not ( = ?auto_146621 ?auto_146623 ) ) ( not ( = ?auto_146621 ?auto_146624 ) ) ( not ( = ?auto_146621 ?auto_146625 ) ) ( not ( = ?auto_146621 ?auto_146626 ) ) ( not ( = ?auto_146621 ?auto_146627 ) ) ( not ( = ?auto_146621 ?auto_146628 ) ) ( not ( = ?auto_146622 ?auto_146623 ) ) ( not ( = ?auto_146622 ?auto_146624 ) ) ( not ( = ?auto_146622 ?auto_146625 ) ) ( not ( = ?auto_146622 ?auto_146626 ) ) ( not ( = ?auto_146622 ?auto_146627 ) ) ( not ( = ?auto_146622 ?auto_146628 ) ) ( not ( = ?auto_146623 ?auto_146624 ) ) ( not ( = ?auto_146623 ?auto_146625 ) ) ( not ( = ?auto_146623 ?auto_146626 ) ) ( not ( = ?auto_146623 ?auto_146627 ) ) ( not ( = ?auto_146623 ?auto_146628 ) ) ( not ( = ?auto_146624 ?auto_146625 ) ) ( not ( = ?auto_146624 ?auto_146626 ) ) ( not ( = ?auto_146624 ?auto_146627 ) ) ( not ( = ?auto_146624 ?auto_146628 ) ) ( not ( = ?auto_146625 ?auto_146626 ) ) ( not ( = ?auto_146625 ?auto_146627 ) ) ( not ( = ?auto_146625 ?auto_146628 ) ) ( not ( = ?auto_146626 ?auto_146627 ) ) ( not ( = ?auto_146626 ?auto_146628 ) ) ( not ( = ?auto_146627 ?auto_146628 ) ) ( ON ?auto_146628 ?auto_146629 ) ( not ( = ?auto_146621 ?auto_146629 ) ) ( not ( = ?auto_146622 ?auto_146629 ) ) ( not ( = ?auto_146623 ?auto_146629 ) ) ( not ( = ?auto_146624 ?auto_146629 ) ) ( not ( = ?auto_146625 ?auto_146629 ) ) ( not ( = ?auto_146626 ?auto_146629 ) ) ( not ( = ?auto_146627 ?auto_146629 ) ) ( not ( = ?auto_146628 ?auto_146629 ) ) ( ON ?auto_146627 ?auto_146628 ) ( ON-TABLE ?auto_146629 ) ( ON ?auto_146626 ?auto_146627 ) ( ON ?auto_146625 ?auto_146626 ) ( ON ?auto_146624 ?auto_146625 ) ( ON ?auto_146623 ?auto_146624 ) ( CLEAR ?auto_146621 ) ( ON ?auto_146622 ?auto_146623 ) ( CLEAR ?auto_146622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146629 ?auto_146628 ?auto_146627 ?auto_146626 ?auto_146625 ?auto_146624 ?auto_146623 )
      ( MAKE-8PILE ?auto_146621 ?auto_146622 ?auto_146623 ?auto_146624 ?auto_146625 ?auto_146626 ?auto_146627 ?auto_146628 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146630 - BLOCK
      ?auto_146631 - BLOCK
      ?auto_146632 - BLOCK
      ?auto_146633 - BLOCK
      ?auto_146634 - BLOCK
      ?auto_146635 - BLOCK
      ?auto_146636 - BLOCK
      ?auto_146637 - BLOCK
    )
    :vars
    (
      ?auto_146638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146630 ?auto_146631 ) ) ( not ( = ?auto_146630 ?auto_146632 ) ) ( not ( = ?auto_146630 ?auto_146633 ) ) ( not ( = ?auto_146630 ?auto_146634 ) ) ( not ( = ?auto_146630 ?auto_146635 ) ) ( not ( = ?auto_146630 ?auto_146636 ) ) ( not ( = ?auto_146630 ?auto_146637 ) ) ( not ( = ?auto_146631 ?auto_146632 ) ) ( not ( = ?auto_146631 ?auto_146633 ) ) ( not ( = ?auto_146631 ?auto_146634 ) ) ( not ( = ?auto_146631 ?auto_146635 ) ) ( not ( = ?auto_146631 ?auto_146636 ) ) ( not ( = ?auto_146631 ?auto_146637 ) ) ( not ( = ?auto_146632 ?auto_146633 ) ) ( not ( = ?auto_146632 ?auto_146634 ) ) ( not ( = ?auto_146632 ?auto_146635 ) ) ( not ( = ?auto_146632 ?auto_146636 ) ) ( not ( = ?auto_146632 ?auto_146637 ) ) ( not ( = ?auto_146633 ?auto_146634 ) ) ( not ( = ?auto_146633 ?auto_146635 ) ) ( not ( = ?auto_146633 ?auto_146636 ) ) ( not ( = ?auto_146633 ?auto_146637 ) ) ( not ( = ?auto_146634 ?auto_146635 ) ) ( not ( = ?auto_146634 ?auto_146636 ) ) ( not ( = ?auto_146634 ?auto_146637 ) ) ( not ( = ?auto_146635 ?auto_146636 ) ) ( not ( = ?auto_146635 ?auto_146637 ) ) ( not ( = ?auto_146636 ?auto_146637 ) ) ( ON ?auto_146637 ?auto_146638 ) ( not ( = ?auto_146630 ?auto_146638 ) ) ( not ( = ?auto_146631 ?auto_146638 ) ) ( not ( = ?auto_146632 ?auto_146638 ) ) ( not ( = ?auto_146633 ?auto_146638 ) ) ( not ( = ?auto_146634 ?auto_146638 ) ) ( not ( = ?auto_146635 ?auto_146638 ) ) ( not ( = ?auto_146636 ?auto_146638 ) ) ( not ( = ?auto_146637 ?auto_146638 ) ) ( ON ?auto_146636 ?auto_146637 ) ( ON-TABLE ?auto_146638 ) ( ON ?auto_146635 ?auto_146636 ) ( ON ?auto_146634 ?auto_146635 ) ( ON ?auto_146633 ?auto_146634 ) ( ON ?auto_146632 ?auto_146633 ) ( ON ?auto_146631 ?auto_146632 ) ( CLEAR ?auto_146631 ) ( HOLDING ?auto_146630 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146630 )
      ( MAKE-8PILE ?auto_146630 ?auto_146631 ?auto_146632 ?auto_146633 ?auto_146634 ?auto_146635 ?auto_146636 ?auto_146637 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_146639 - BLOCK
      ?auto_146640 - BLOCK
      ?auto_146641 - BLOCK
      ?auto_146642 - BLOCK
      ?auto_146643 - BLOCK
      ?auto_146644 - BLOCK
      ?auto_146645 - BLOCK
      ?auto_146646 - BLOCK
    )
    :vars
    (
      ?auto_146647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146639 ?auto_146640 ) ) ( not ( = ?auto_146639 ?auto_146641 ) ) ( not ( = ?auto_146639 ?auto_146642 ) ) ( not ( = ?auto_146639 ?auto_146643 ) ) ( not ( = ?auto_146639 ?auto_146644 ) ) ( not ( = ?auto_146639 ?auto_146645 ) ) ( not ( = ?auto_146639 ?auto_146646 ) ) ( not ( = ?auto_146640 ?auto_146641 ) ) ( not ( = ?auto_146640 ?auto_146642 ) ) ( not ( = ?auto_146640 ?auto_146643 ) ) ( not ( = ?auto_146640 ?auto_146644 ) ) ( not ( = ?auto_146640 ?auto_146645 ) ) ( not ( = ?auto_146640 ?auto_146646 ) ) ( not ( = ?auto_146641 ?auto_146642 ) ) ( not ( = ?auto_146641 ?auto_146643 ) ) ( not ( = ?auto_146641 ?auto_146644 ) ) ( not ( = ?auto_146641 ?auto_146645 ) ) ( not ( = ?auto_146641 ?auto_146646 ) ) ( not ( = ?auto_146642 ?auto_146643 ) ) ( not ( = ?auto_146642 ?auto_146644 ) ) ( not ( = ?auto_146642 ?auto_146645 ) ) ( not ( = ?auto_146642 ?auto_146646 ) ) ( not ( = ?auto_146643 ?auto_146644 ) ) ( not ( = ?auto_146643 ?auto_146645 ) ) ( not ( = ?auto_146643 ?auto_146646 ) ) ( not ( = ?auto_146644 ?auto_146645 ) ) ( not ( = ?auto_146644 ?auto_146646 ) ) ( not ( = ?auto_146645 ?auto_146646 ) ) ( ON ?auto_146646 ?auto_146647 ) ( not ( = ?auto_146639 ?auto_146647 ) ) ( not ( = ?auto_146640 ?auto_146647 ) ) ( not ( = ?auto_146641 ?auto_146647 ) ) ( not ( = ?auto_146642 ?auto_146647 ) ) ( not ( = ?auto_146643 ?auto_146647 ) ) ( not ( = ?auto_146644 ?auto_146647 ) ) ( not ( = ?auto_146645 ?auto_146647 ) ) ( not ( = ?auto_146646 ?auto_146647 ) ) ( ON ?auto_146645 ?auto_146646 ) ( ON-TABLE ?auto_146647 ) ( ON ?auto_146644 ?auto_146645 ) ( ON ?auto_146643 ?auto_146644 ) ( ON ?auto_146642 ?auto_146643 ) ( ON ?auto_146641 ?auto_146642 ) ( ON ?auto_146640 ?auto_146641 ) ( ON ?auto_146639 ?auto_146640 ) ( CLEAR ?auto_146639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146647 ?auto_146646 ?auto_146645 ?auto_146644 ?auto_146643 ?auto_146642 ?auto_146641 ?auto_146640 )
      ( MAKE-8PILE ?auto_146639 ?auto_146640 ?auto_146641 ?auto_146642 ?auto_146643 ?auto_146644 ?auto_146645 ?auto_146646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146655 - BLOCK
      ?auto_146656 - BLOCK
      ?auto_146657 - BLOCK
      ?auto_146658 - BLOCK
      ?auto_146659 - BLOCK
      ?auto_146660 - BLOCK
      ?auto_146661 - BLOCK
    )
    :vars
    (
      ?auto_146662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146662 ?auto_146661 ) ( CLEAR ?auto_146662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146655 ) ( ON ?auto_146656 ?auto_146655 ) ( ON ?auto_146657 ?auto_146656 ) ( ON ?auto_146658 ?auto_146657 ) ( ON ?auto_146659 ?auto_146658 ) ( ON ?auto_146660 ?auto_146659 ) ( ON ?auto_146661 ?auto_146660 ) ( not ( = ?auto_146655 ?auto_146656 ) ) ( not ( = ?auto_146655 ?auto_146657 ) ) ( not ( = ?auto_146655 ?auto_146658 ) ) ( not ( = ?auto_146655 ?auto_146659 ) ) ( not ( = ?auto_146655 ?auto_146660 ) ) ( not ( = ?auto_146655 ?auto_146661 ) ) ( not ( = ?auto_146655 ?auto_146662 ) ) ( not ( = ?auto_146656 ?auto_146657 ) ) ( not ( = ?auto_146656 ?auto_146658 ) ) ( not ( = ?auto_146656 ?auto_146659 ) ) ( not ( = ?auto_146656 ?auto_146660 ) ) ( not ( = ?auto_146656 ?auto_146661 ) ) ( not ( = ?auto_146656 ?auto_146662 ) ) ( not ( = ?auto_146657 ?auto_146658 ) ) ( not ( = ?auto_146657 ?auto_146659 ) ) ( not ( = ?auto_146657 ?auto_146660 ) ) ( not ( = ?auto_146657 ?auto_146661 ) ) ( not ( = ?auto_146657 ?auto_146662 ) ) ( not ( = ?auto_146658 ?auto_146659 ) ) ( not ( = ?auto_146658 ?auto_146660 ) ) ( not ( = ?auto_146658 ?auto_146661 ) ) ( not ( = ?auto_146658 ?auto_146662 ) ) ( not ( = ?auto_146659 ?auto_146660 ) ) ( not ( = ?auto_146659 ?auto_146661 ) ) ( not ( = ?auto_146659 ?auto_146662 ) ) ( not ( = ?auto_146660 ?auto_146661 ) ) ( not ( = ?auto_146660 ?auto_146662 ) ) ( not ( = ?auto_146661 ?auto_146662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146662 ?auto_146661 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146680 - BLOCK
      ?auto_146681 - BLOCK
      ?auto_146682 - BLOCK
      ?auto_146683 - BLOCK
      ?auto_146684 - BLOCK
      ?auto_146685 - BLOCK
      ?auto_146686 - BLOCK
    )
    :vars
    (
      ?auto_146687 - BLOCK
      ?auto_146688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146680 ) ( ON ?auto_146681 ?auto_146680 ) ( ON ?auto_146682 ?auto_146681 ) ( ON ?auto_146683 ?auto_146682 ) ( ON ?auto_146684 ?auto_146683 ) ( ON ?auto_146685 ?auto_146684 ) ( not ( = ?auto_146680 ?auto_146681 ) ) ( not ( = ?auto_146680 ?auto_146682 ) ) ( not ( = ?auto_146680 ?auto_146683 ) ) ( not ( = ?auto_146680 ?auto_146684 ) ) ( not ( = ?auto_146680 ?auto_146685 ) ) ( not ( = ?auto_146680 ?auto_146686 ) ) ( not ( = ?auto_146680 ?auto_146687 ) ) ( not ( = ?auto_146681 ?auto_146682 ) ) ( not ( = ?auto_146681 ?auto_146683 ) ) ( not ( = ?auto_146681 ?auto_146684 ) ) ( not ( = ?auto_146681 ?auto_146685 ) ) ( not ( = ?auto_146681 ?auto_146686 ) ) ( not ( = ?auto_146681 ?auto_146687 ) ) ( not ( = ?auto_146682 ?auto_146683 ) ) ( not ( = ?auto_146682 ?auto_146684 ) ) ( not ( = ?auto_146682 ?auto_146685 ) ) ( not ( = ?auto_146682 ?auto_146686 ) ) ( not ( = ?auto_146682 ?auto_146687 ) ) ( not ( = ?auto_146683 ?auto_146684 ) ) ( not ( = ?auto_146683 ?auto_146685 ) ) ( not ( = ?auto_146683 ?auto_146686 ) ) ( not ( = ?auto_146683 ?auto_146687 ) ) ( not ( = ?auto_146684 ?auto_146685 ) ) ( not ( = ?auto_146684 ?auto_146686 ) ) ( not ( = ?auto_146684 ?auto_146687 ) ) ( not ( = ?auto_146685 ?auto_146686 ) ) ( not ( = ?auto_146685 ?auto_146687 ) ) ( not ( = ?auto_146686 ?auto_146687 ) ) ( ON ?auto_146687 ?auto_146688 ) ( CLEAR ?auto_146687 ) ( not ( = ?auto_146680 ?auto_146688 ) ) ( not ( = ?auto_146681 ?auto_146688 ) ) ( not ( = ?auto_146682 ?auto_146688 ) ) ( not ( = ?auto_146683 ?auto_146688 ) ) ( not ( = ?auto_146684 ?auto_146688 ) ) ( not ( = ?auto_146685 ?auto_146688 ) ) ( not ( = ?auto_146686 ?auto_146688 ) ) ( not ( = ?auto_146687 ?auto_146688 ) ) ( HOLDING ?auto_146686 ) ( CLEAR ?auto_146685 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146680 ?auto_146681 ?auto_146682 ?auto_146683 ?auto_146684 ?auto_146685 ?auto_146686 ?auto_146687 )
      ( MAKE-7PILE ?auto_146680 ?auto_146681 ?auto_146682 ?auto_146683 ?auto_146684 ?auto_146685 ?auto_146686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146689 - BLOCK
      ?auto_146690 - BLOCK
      ?auto_146691 - BLOCK
      ?auto_146692 - BLOCK
      ?auto_146693 - BLOCK
      ?auto_146694 - BLOCK
      ?auto_146695 - BLOCK
    )
    :vars
    (
      ?auto_146696 - BLOCK
      ?auto_146697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146689 ) ( ON ?auto_146690 ?auto_146689 ) ( ON ?auto_146691 ?auto_146690 ) ( ON ?auto_146692 ?auto_146691 ) ( ON ?auto_146693 ?auto_146692 ) ( ON ?auto_146694 ?auto_146693 ) ( not ( = ?auto_146689 ?auto_146690 ) ) ( not ( = ?auto_146689 ?auto_146691 ) ) ( not ( = ?auto_146689 ?auto_146692 ) ) ( not ( = ?auto_146689 ?auto_146693 ) ) ( not ( = ?auto_146689 ?auto_146694 ) ) ( not ( = ?auto_146689 ?auto_146695 ) ) ( not ( = ?auto_146689 ?auto_146696 ) ) ( not ( = ?auto_146690 ?auto_146691 ) ) ( not ( = ?auto_146690 ?auto_146692 ) ) ( not ( = ?auto_146690 ?auto_146693 ) ) ( not ( = ?auto_146690 ?auto_146694 ) ) ( not ( = ?auto_146690 ?auto_146695 ) ) ( not ( = ?auto_146690 ?auto_146696 ) ) ( not ( = ?auto_146691 ?auto_146692 ) ) ( not ( = ?auto_146691 ?auto_146693 ) ) ( not ( = ?auto_146691 ?auto_146694 ) ) ( not ( = ?auto_146691 ?auto_146695 ) ) ( not ( = ?auto_146691 ?auto_146696 ) ) ( not ( = ?auto_146692 ?auto_146693 ) ) ( not ( = ?auto_146692 ?auto_146694 ) ) ( not ( = ?auto_146692 ?auto_146695 ) ) ( not ( = ?auto_146692 ?auto_146696 ) ) ( not ( = ?auto_146693 ?auto_146694 ) ) ( not ( = ?auto_146693 ?auto_146695 ) ) ( not ( = ?auto_146693 ?auto_146696 ) ) ( not ( = ?auto_146694 ?auto_146695 ) ) ( not ( = ?auto_146694 ?auto_146696 ) ) ( not ( = ?auto_146695 ?auto_146696 ) ) ( ON ?auto_146696 ?auto_146697 ) ( not ( = ?auto_146689 ?auto_146697 ) ) ( not ( = ?auto_146690 ?auto_146697 ) ) ( not ( = ?auto_146691 ?auto_146697 ) ) ( not ( = ?auto_146692 ?auto_146697 ) ) ( not ( = ?auto_146693 ?auto_146697 ) ) ( not ( = ?auto_146694 ?auto_146697 ) ) ( not ( = ?auto_146695 ?auto_146697 ) ) ( not ( = ?auto_146696 ?auto_146697 ) ) ( CLEAR ?auto_146694 ) ( ON ?auto_146695 ?auto_146696 ) ( CLEAR ?auto_146695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146697 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146697 ?auto_146696 )
      ( MAKE-7PILE ?auto_146689 ?auto_146690 ?auto_146691 ?auto_146692 ?auto_146693 ?auto_146694 ?auto_146695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146698 - BLOCK
      ?auto_146699 - BLOCK
      ?auto_146700 - BLOCK
      ?auto_146701 - BLOCK
      ?auto_146702 - BLOCK
      ?auto_146703 - BLOCK
      ?auto_146704 - BLOCK
    )
    :vars
    (
      ?auto_146706 - BLOCK
      ?auto_146705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146698 ) ( ON ?auto_146699 ?auto_146698 ) ( ON ?auto_146700 ?auto_146699 ) ( ON ?auto_146701 ?auto_146700 ) ( ON ?auto_146702 ?auto_146701 ) ( not ( = ?auto_146698 ?auto_146699 ) ) ( not ( = ?auto_146698 ?auto_146700 ) ) ( not ( = ?auto_146698 ?auto_146701 ) ) ( not ( = ?auto_146698 ?auto_146702 ) ) ( not ( = ?auto_146698 ?auto_146703 ) ) ( not ( = ?auto_146698 ?auto_146704 ) ) ( not ( = ?auto_146698 ?auto_146706 ) ) ( not ( = ?auto_146699 ?auto_146700 ) ) ( not ( = ?auto_146699 ?auto_146701 ) ) ( not ( = ?auto_146699 ?auto_146702 ) ) ( not ( = ?auto_146699 ?auto_146703 ) ) ( not ( = ?auto_146699 ?auto_146704 ) ) ( not ( = ?auto_146699 ?auto_146706 ) ) ( not ( = ?auto_146700 ?auto_146701 ) ) ( not ( = ?auto_146700 ?auto_146702 ) ) ( not ( = ?auto_146700 ?auto_146703 ) ) ( not ( = ?auto_146700 ?auto_146704 ) ) ( not ( = ?auto_146700 ?auto_146706 ) ) ( not ( = ?auto_146701 ?auto_146702 ) ) ( not ( = ?auto_146701 ?auto_146703 ) ) ( not ( = ?auto_146701 ?auto_146704 ) ) ( not ( = ?auto_146701 ?auto_146706 ) ) ( not ( = ?auto_146702 ?auto_146703 ) ) ( not ( = ?auto_146702 ?auto_146704 ) ) ( not ( = ?auto_146702 ?auto_146706 ) ) ( not ( = ?auto_146703 ?auto_146704 ) ) ( not ( = ?auto_146703 ?auto_146706 ) ) ( not ( = ?auto_146704 ?auto_146706 ) ) ( ON ?auto_146706 ?auto_146705 ) ( not ( = ?auto_146698 ?auto_146705 ) ) ( not ( = ?auto_146699 ?auto_146705 ) ) ( not ( = ?auto_146700 ?auto_146705 ) ) ( not ( = ?auto_146701 ?auto_146705 ) ) ( not ( = ?auto_146702 ?auto_146705 ) ) ( not ( = ?auto_146703 ?auto_146705 ) ) ( not ( = ?auto_146704 ?auto_146705 ) ) ( not ( = ?auto_146706 ?auto_146705 ) ) ( ON ?auto_146704 ?auto_146706 ) ( CLEAR ?auto_146704 ) ( ON-TABLE ?auto_146705 ) ( HOLDING ?auto_146703 ) ( CLEAR ?auto_146702 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146698 ?auto_146699 ?auto_146700 ?auto_146701 ?auto_146702 ?auto_146703 )
      ( MAKE-7PILE ?auto_146698 ?auto_146699 ?auto_146700 ?auto_146701 ?auto_146702 ?auto_146703 ?auto_146704 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146707 - BLOCK
      ?auto_146708 - BLOCK
      ?auto_146709 - BLOCK
      ?auto_146710 - BLOCK
      ?auto_146711 - BLOCK
      ?auto_146712 - BLOCK
      ?auto_146713 - BLOCK
    )
    :vars
    (
      ?auto_146714 - BLOCK
      ?auto_146715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146707 ) ( ON ?auto_146708 ?auto_146707 ) ( ON ?auto_146709 ?auto_146708 ) ( ON ?auto_146710 ?auto_146709 ) ( ON ?auto_146711 ?auto_146710 ) ( not ( = ?auto_146707 ?auto_146708 ) ) ( not ( = ?auto_146707 ?auto_146709 ) ) ( not ( = ?auto_146707 ?auto_146710 ) ) ( not ( = ?auto_146707 ?auto_146711 ) ) ( not ( = ?auto_146707 ?auto_146712 ) ) ( not ( = ?auto_146707 ?auto_146713 ) ) ( not ( = ?auto_146707 ?auto_146714 ) ) ( not ( = ?auto_146708 ?auto_146709 ) ) ( not ( = ?auto_146708 ?auto_146710 ) ) ( not ( = ?auto_146708 ?auto_146711 ) ) ( not ( = ?auto_146708 ?auto_146712 ) ) ( not ( = ?auto_146708 ?auto_146713 ) ) ( not ( = ?auto_146708 ?auto_146714 ) ) ( not ( = ?auto_146709 ?auto_146710 ) ) ( not ( = ?auto_146709 ?auto_146711 ) ) ( not ( = ?auto_146709 ?auto_146712 ) ) ( not ( = ?auto_146709 ?auto_146713 ) ) ( not ( = ?auto_146709 ?auto_146714 ) ) ( not ( = ?auto_146710 ?auto_146711 ) ) ( not ( = ?auto_146710 ?auto_146712 ) ) ( not ( = ?auto_146710 ?auto_146713 ) ) ( not ( = ?auto_146710 ?auto_146714 ) ) ( not ( = ?auto_146711 ?auto_146712 ) ) ( not ( = ?auto_146711 ?auto_146713 ) ) ( not ( = ?auto_146711 ?auto_146714 ) ) ( not ( = ?auto_146712 ?auto_146713 ) ) ( not ( = ?auto_146712 ?auto_146714 ) ) ( not ( = ?auto_146713 ?auto_146714 ) ) ( ON ?auto_146714 ?auto_146715 ) ( not ( = ?auto_146707 ?auto_146715 ) ) ( not ( = ?auto_146708 ?auto_146715 ) ) ( not ( = ?auto_146709 ?auto_146715 ) ) ( not ( = ?auto_146710 ?auto_146715 ) ) ( not ( = ?auto_146711 ?auto_146715 ) ) ( not ( = ?auto_146712 ?auto_146715 ) ) ( not ( = ?auto_146713 ?auto_146715 ) ) ( not ( = ?auto_146714 ?auto_146715 ) ) ( ON ?auto_146713 ?auto_146714 ) ( ON-TABLE ?auto_146715 ) ( CLEAR ?auto_146711 ) ( ON ?auto_146712 ?auto_146713 ) ( CLEAR ?auto_146712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146715 ?auto_146714 ?auto_146713 )
      ( MAKE-7PILE ?auto_146707 ?auto_146708 ?auto_146709 ?auto_146710 ?auto_146711 ?auto_146712 ?auto_146713 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146716 - BLOCK
      ?auto_146717 - BLOCK
      ?auto_146718 - BLOCK
      ?auto_146719 - BLOCK
      ?auto_146720 - BLOCK
      ?auto_146721 - BLOCK
      ?auto_146722 - BLOCK
    )
    :vars
    (
      ?auto_146723 - BLOCK
      ?auto_146724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146716 ) ( ON ?auto_146717 ?auto_146716 ) ( ON ?auto_146718 ?auto_146717 ) ( ON ?auto_146719 ?auto_146718 ) ( not ( = ?auto_146716 ?auto_146717 ) ) ( not ( = ?auto_146716 ?auto_146718 ) ) ( not ( = ?auto_146716 ?auto_146719 ) ) ( not ( = ?auto_146716 ?auto_146720 ) ) ( not ( = ?auto_146716 ?auto_146721 ) ) ( not ( = ?auto_146716 ?auto_146722 ) ) ( not ( = ?auto_146716 ?auto_146723 ) ) ( not ( = ?auto_146717 ?auto_146718 ) ) ( not ( = ?auto_146717 ?auto_146719 ) ) ( not ( = ?auto_146717 ?auto_146720 ) ) ( not ( = ?auto_146717 ?auto_146721 ) ) ( not ( = ?auto_146717 ?auto_146722 ) ) ( not ( = ?auto_146717 ?auto_146723 ) ) ( not ( = ?auto_146718 ?auto_146719 ) ) ( not ( = ?auto_146718 ?auto_146720 ) ) ( not ( = ?auto_146718 ?auto_146721 ) ) ( not ( = ?auto_146718 ?auto_146722 ) ) ( not ( = ?auto_146718 ?auto_146723 ) ) ( not ( = ?auto_146719 ?auto_146720 ) ) ( not ( = ?auto_146719 ?auto_146721 ) ) ( not ( = ?auto_146719 ?auto_146722 ) ) ( not ( = ?auto_146719 ?auto_146723 ) ) ( not ( = ?auto_146720 ?auto_146721 ) ) ( not ( = ?auto_146720 ?auto_146722 ) ) ( not ( = ?auto_146720 ?auto_146723 ) ) ( not ( = ?auto_146721 ?auto_146722 ) ) ( not ( = ?auto_146721 ?auto_146723 ) ) ( not ( = ?auto_146722 ?auto_146723 ) ) ( ON ?auto_146723 ?auto_146724 ) ( not ( = ?auto_146716 ?auto_146724 ) ) ( not ( = ?auto_146717 ?auto_146724 ) ) ( not ( = ?auto_146718 ?auto_146724 ) ) ( not ( = ?auto_146719 ?auto_146724 ) ) ( not ( = ?auto_146720 ?auto_146724 ) ) ( not ( = ?auto_146721 ?auto_146724 ) ) ( not ( = ?auto_146722 ?auto_146724 ) ) ( not ( = ?auto_146723 ?auto_146724 ) ) ( ON ?auto_146722 ?auto_146723 ) ( ON-TABLE ?auto_146724 ) ( ON ?auto_146721 ?auto_146722 ) ( CLEAR ?auto_146721 ) ( HOLDING ?auto_146720 ) ( CLEAR ?auto_146719 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146716 ?auto_146717 ?auto_146718 ?auto_146719 ?auto_146720 )
      ( MAKE-7PILE ?auto_146716 ?auto_146717 ?auto_146718 ?auto_146719 ?auto_146720 ?auto_146721 ?auto_146722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146725 - BLOCK
      ?auto_146726 - BLOCK
      ?auto_146727 - BLOCK
      ?auto_146728 - BLOCK
      ?auto_146729 - BLOCK
      ?auto_146730 - BLOCK
      ?auto_146731 - BLOCK
    )
    :vars
    (
      ?auto_146732 - BLOCK
      ?auto_146733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146725 ) ( ON ?auto_146726 ?auto_146725 ) ( ON ?auto_146727 ?auto_146726 ) ( ON ?auto_146728 ?auto_146727 ) ( not ( = ?auto_146725 ?auto_146726 ) ) ( not ( = ?auto_146725 ?auto_146727 ) ) ( not ( = ?auto_146725 ?auto_146728 ) ) ( not ( = ?auto_146725 ?auto_146729 ) ) ( not ( = ?auto_146725 ?auto_146730 ) ) ( not ( = ?auto_146725 ?auto_146731 ) ) ( not ( = ?auto_146725 ?auto_146732 ) ) ( not ( = ?auto_146726 ?auto_146727 ) ) ( not ( = ?auto_146726 ?auto_146728 ) ) ( not ( = ?auto_146726 ?auto_146729 ) ) ( not ( = ?auto_146726 ?auto_146730 ) ) ( not ( = ?auto_146726 ?auto_146731 ) ) ( not ( = ?auto_146726 ?auto_146732 ) ) ( not ( = ?auto_146727 ?auto_146728 ) ) ( not ( = ?auto_146727 ?auto_146729 ) ) ( not ( = ?auto_146727 ?auto_146730 ) ) ( not ( = ?auto_146727 ?auto_146731 ) ) ( not ( = ?auto_146727 ?auto_146732 ) ) ( not ( = ?auto_146728 ?auto_146729 ) ) ( not ( = ?auto_146728 ?auto_146730 ) ) ( not ( = ?auto_146728 ?auto_146731 ) ) ( not ( = ?auto_146728 ?auto_146732 ) ) ( not ( = ?auto_146729 ?auto_146730 ) ) ( not ( = ?auto_146729 ?auto_146731 ) ) ( not ( = ?auto_146729 ?auto_146732 ) ) ( not ( = ?auto_146730 ?auto_146731 ) ) ( not ( = ?auto_146730 ?auto_146732 ) ) ( not ( = ?auto_146731 ?auto_146732 ) ) ( ON ?auto_146732 ?auto_146733 ) ( not ( = ?auto_146725 ?auto_146733 ) ) ( not ( = ?auto_146726 ?auto_146733 ) ) ( not ( = ?auto_146727 ?auto_146733 ) ) ( not ( = ?auto_146728 ?auto_146733 ) ) ( not ( = ?auto_146729 ?auto_146733 ) ) ( not ( = ?auto_146730 ?auto_146733 ) ) ( not ( = ?auto_146731 ?auto_146733 ) ) ( not ( = ?auto_146732 ?auto_146733 ) ) ( ON ?auto_146731 ?auto_146732 ) ( ON-TABLE ?auto_146733 ) ( ON ?auto_146730 ?auto_146731 ) ( CLEAR ?auto_146728 ) ( ON ?auto_146729 ?auto_146730 ) ( CLEAR ?auto_146729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146733 ?auto_146732 ?auto_146731 ?auto_146730 )
      ( MAKE-7PILE ?auto_146725 ?auto_146726 ?auto_146727 ?auto_146728 ?auto_146729 ?auto_146730 ?auto_146731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146734 - BLOCK
      ?auto_146735 - BLOCK
      ?auto_146736 - BLOCK
      ?auto_146737 - BLOCK
      ?auto_146738 - BLOCK
      ?auto_146739 - BLOCK
      ?auto_146740 - BLOCK
    )
    :vars
    (
      ?auto_146741 - BLOCK
      ?auto_146742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146734 ) ( ON ?auto_146735 ?auto_146734 ) ( ON ?auto_146736 ?auto_146735 ) ( not ( = ?auto_146734 ?auto_146735 ) ) ( not ( = ?auto_146734 ?auto_146736 ) ) ( not ( = ?auto_146734 ?auto_146737 ) ) ( not ( = ?auto_146734 ?auto_146738 ) ) ( not ( = ?auto_146734 ?auto_146739 ) ) ( not ( = ?auto_146734 ?auto_146740 ) ) ( not ( = ?auto_146734 ?auto_146741 ) ) ( not ( = ?auto_146735 ?auto_146736 ) ) ( not ( = ?auto_146735 ?auto_146737 ) ) ( not ( = ?auto_146735 ?auto_146738 ) ) ( not ( = ?auto_146735 ?auto_146739 ) ) ( not ( = ?auto_146735 ?auto_146740 ) ) ( not ( = ?auto_146735 ?auto_146741 ) ) ( not ( = ?auto_146736 ?auto_146737 ) ) ( not ( = ?auto_146736 ?auto_146738 ) ) ( not ( = ?auto_146736 ?auto_146739 ) ) ( not ( = ?auto_146736 ?auto_146740 ) ) ( not ( = ?auto_146736 ?auto_146741 ) ) ( not ( = ?auto_146737 ?auto_146738 ) ) ( not ( = ?auto_146737 ?auto_146739 ) ) ( not ( = ?auto_146737 ?auto_146740 ) ) ( not ( = ?auto_146737 ?auto_146741 ) ) ( not ( = ?auto_146738 ?auto_146739 ) ) ( not ( = ?auto_146738 ?auto_146740 ) ) ( not ( = ?auto_146738 ?auto_146741 ) ) ( not ( = ?auto_146739 ?auto_146740 ) ) ( not ( = ?auto_146739 ?auto_146741 ) ) ( not ( = ?auto_146740 ?auto_146741 ) ) ( ON ?auto_146741 ?auto_146742 ) ( not ( = ?auto_146734 ?auto_146742 ) ) ( not ( = ?auto_146735 ?auto_146742 ) ) ( not ( = ?auto_146736 ?auto_146742 ) ) ( not ( = ?auto_146737 ?auto_146742 ) ) ( not ( = ?auto_146738 ?auto_146742 ) ) ( not ( = ?auto_146739 ?auto_146742 ) ) ( not ( = ?auto_146740 ?auto_146742 ) ) ( not ( = ?auto_146741 ?auto_146742 ) ) ( ON ?auto_146740 ?auto_146741 ) ( ON-TABLE ?auto_146742 ) ( ON ?auto_146739 ?auto_146740 ) ( ON ?auto_146738 ?auto_146739 ) ( CLEAR ?auto_146738 ) ( HOLDING ?auto_146737 ) ( CLEAR ?auto_146736 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146734 ?auto_146735 ?auto_146736 ?auto_146737 )
      ( MAKE-7PILE ?auto_146734 ?auto_146735 ?auto_146736 ?auto_146737 ?auto_146738 ?auto_146739 ?auto_146740 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146743 - BLOCK
      ?auto_146744 - BLOCK
      ?auto_146745 - BLOCK
      ?auto_146746 - BLOCK
      ?auto_146747 - BLOCK
      ?auto_146748 - BLOCK
      ?auto_146749 - BLOCK
    )
    :vars
    (
      ?auto_146750 - BLOCK
      ?auto_146751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146743 ) ( ON ?auto_146744 ?auto_146743 ) ( ON ?auto_146745 ?auto_146744 ) ( not ( = ?auto_146743 ?auto_146744 ) ) ( not ( = ?auto_146743 ?auto_146745 ) ) ( not ( = ?auto_146743 ?auto_146746 ) ) ( not ( = ?auto_146743 ?auto_146747 ) ) ( not ( = ?auto_146743 ?auto_146748 ) ) ( not ( = ?auto_146743 ?auto_146749 ) ) ( not ( = ?auto_146743 ?auto_146750 ) ) ( not ( = ?auto_146744 ?auto_146745 ) ) ( not ( = ?auto_146744 ?auto_146746 ) ) ( not ( = ?auto_146744 ?auto_146747 ) ) ( not ( = ?auto_146744 ?auto_146748 ) ) ( not ( = ?auto_146744 ?auto_146749 ) ) ( not ( = ?auto_146744 ?auto_146750 ) ) ( not ( = ?auto_146745 ?auto_146746 ) ) ( not ( = ?auto_146745 ?auto_146747 ) ) ( not ( = ?auto_146745 ?auto_146748 ) ) ( not ( = ?auto_146745 ?auto_146749 ) ) ( not ( = ?auto_146745 ?auto_146750 ) ) ( not ( = ?auto_146746 ?auto_146747 ) ) ( not ( = ?auto_146746 ?auto_146748 ) ) ( not ( = ?auto_146746 ?auto_146749 ) ) ( not ( = ?auto_146746 ?auto_146750 ) ) ( not ( = ?auto_146747 ?auto_146748 ) ) ( not ( = ?auto_146747 ?auto_146749 ) ) ( not ( = ?auto_146747 ?auto_146750 ) ) ( not ( = ?auto_146748 ?auto_146749 ) ) ( not ( = ?auto_146748 ?auto_146750 ) ) ( not ( = ?auto_146749 ?auto_146750 ) ) ( ON ?auto_146750 ?auto_146751 ) ( not ( = ?auto_146743 ?auto_146751 ) ) ( not ( = ?auto_146744 ?auto_146751 ) ) ( not ( = ?auto_146745 ?auto_146751 ) ) ( not ( = ?auto_146746 ?auto_146751 ) ) ( not ( = ?auto_146747 ?auto_146751 ) ) ( not ( = ?auto_146748 ?auto_146751 ) ) ( not ( = ?auto_146749 ?auto_146751 ) ) ( not ( = ?auto_146750 ?auto_146751 ) ) ( ON ?auto_146749 ?auto_146750 ) ( ON-TABLE ?auto_146751 ) ( ON ?auto_146748 ?auto_146749 ) ( ON ?auto_146747 ?auto_146748 ) ( CLEAR ?auto_146745 ) ( ON ?auto_146746 ?auto_146747 ) ( CLEAR ?auto_146746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146751 ?auto_146750 ?auto_146749 ?auto_146748 ?auto_146747 )
      ( MAKE-7PILE ?auto_146743 ?auto_146744 ?auto_146745 ?auto_146746 ?auto_146747 ?auto_146748 ?auto_146749 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146752 - BLOCK
      ?auto_146753 - BLOCK
      ?auto_146754 - BLOCK
      ?auto_146755 - BLOCK
      ?auto_146756 - BLOCK
      ?auto_146757 - BLOCK
      ?auto_146758 - BLOCK
    )
    :vars
    (
      ?auto_146759 - BLOCK
      ?auto_146760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146752 ) ( ON ?auto_146753 ?auto_146752 ) ( not ( = ?auto_146752 ?auto_146753 ) ) ( not ( = ?auto_146752 ?auto_146754 ) ) ( not ( = ?auto_146752 ?auto_146755 ) ) ( not ( = ?auto_146752 ?auto_146756 ) ) ( not ( = ?auto_146752 ?auto_146757 ) ) ( not ( = ?auto_146752 ?auto_146758 ) ) ( not ( = ?auto_146752 ?auto_146759 ) ) ( not ( = ?auto_146753 ?auto_146754 ) ) ( not ( = ?auto_146753 ?auto_146755 ) ) ( not ( = ?auto_146753 ?auto_146756 ) ) ( not ( = ?auto_146753 ?auto_146757 ) ) ( not ( = ?auto_146753 ?auto_146758 ) ) ( not ( = ?auto_146753 ?auto_146759 ) ) ( not ( = ?auto_146754 ?auto_146755 ) ) ( not ( = ?auto_146754 ?auto_146756 ) ) ( not ( = ?auto_146754 ?auto_146757 ) ) ( not ( = ?auto_146754 ?auto_146758 ) ) ( not ( = ?auto_146754 ?auto_146759 ) ) ( not ( = ?auto_146755 ?auto_146756 ) ) ( not ( = ?auto_146755 ?auto_146757 ) ) ( not ( = ?auto_146755 ?auto_146758 ) ) ( not ( = ?auto_146755 ?auto_146759 ) ) ( not ( = ?auto_146756 ?auto_146757 ) ) ( not ( = ?auto_146756 ?auto_146758 ) ) ( not ( = ?auto_146756 ?auto_146759 ) ) ( not ( = ?auto_146757 ?auto_146758 ) ) ( not ( = ?auto_146757 ?auto_146759 ) ) ( not ( = ?auto_146758 ?auto_146759 ) ) ( ON ?auto_146759 ?auto_146760 ) ( not ( = ?auto_146752 ?auto_146760 ) ) ( not ( = ?auto_146753 ?auto_146760 ) ) ( not ( = ?auto_146754 ?auto_146760 ) ) ( not ( = ?auto_146755 ?auto_146760 ) ) ( not ( = ?auto_146756 ?auto_146760 ) ) ( not ( = ?auto_146757 ?auto_146760 ) ) ( not ( = ?auto_146758 ?auto_146760 ) ) ( not ( = ?auto_146759 ?auto_146760 ) ) ( ON ?auto_146758 ?auto_146759 ) ( ON-TABLE ?auto_146760 ) ( ON ?auto_146757 ?auto_146758 ) ( ON ?auto_146756 ?auto_146757 ) ( ON ?auto_146755 ?auto_146756 ) ( CLEAR ?auto_146755 ) ( HOLDING ?auto_146754 ) ( CLEAR ?auto_146753 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146752 ?auto_146753 ?auto_146754 )
      ( MAKE-7PILE ?auto_146752 ?auto_146753 ?auto_146754 ?auto_146755 ?auto_146756 ?auto_146757 ?auto_146758 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146761 - BLOCK
      ?auto_146762 - BLOCK
      ?auto_146763 - BLOCK
      ?auto_146764 - BLOCK
      ?auto_146765 - BLOCK
      ?auto_146766 - BLOCK
      ?auto_146767 - BLOCK
    )
    :vars
    (
      ?auto_146768 - BLOCK
      ?auto_146769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146761 ) ( ON ?auto_146762 ?auto_146761 ) ( not ( = ?auto_146761 ?auto_146762 ) ) ( not ( = ?auto_146761 ?auto_146763 ) ) ( not ( = ?auto_146761 ?auto_146764 ) ) ( not ( = ?auto_146761 ?auto_146765 ) ) ( not ( = ?auto_146761 ?auto_146766 ) ) ( not ( = ?auto_146761 ?auto_146767 ) ) ( not ( = ?auto_146761 ?auto_146768 ) ) ( not ( = ?auto_146762 ?auto_146763 ) ) ( not ( = ?auto_146762 ?auto_146764 ) ) ( not ( = ?auto_146762 ?auto_146765 ) ) ( not ( = ?auto_146762 ?auto_146766 ) ) ( not ( = ?auto_146762 ?auto_146767 ) ) ( not ( = ?auto_146762 ?auto_146768 ) ) ( not ( = ?auto_146763 ?auto_146764 ) ) ( not ( = ?auto_146763 ?auto_146765 ) ) ( not ( = ?auto_146763 ?auto_146766 ) ) ( not ( = ?auto_146763 ?auto_146767 ) ) ( not ( = ?auto_146763 ?auto_146768 ) ) ( not ( = ?auto_146764 ?auto_146765 ) ) ( not ( = ?auto_146764 ?auto_146766 ) ) ( not ( = ?auto_146764 ?auto_146767 ) ) ( not ( = ?auto_146764 ?auto_146768 ) ) ( not ( = ?auto_146765 ?auto_146766 ) ) ( not ( = ?auto_146765 ?auto_146767 ) ) ( not ( = ?auto_146765 ?auto_146768 ) ) ( not ( = ?auto_146766 ?auto_146767 ) ) ( not ( = ?auto_146766 ?auto_146768 ) ) ( not ( = ?auto_146767 ?auto_146768 ) ) ( ON ?auto_146768 ?auto_146769 ) ( not ( = ?auto_146761 ?auto_146769 ) ) ( not ( = ?auto_146762 ?auto_146769 ) ) ( not ( = ?auto_146763 ?auto_146769 ) ) ( not ( = ?auto_146764 ?auto_146769 ) ) ( not ( = ?auto_146765 ?auto_146769 ) ) ( not ( = ?auto_146766 ?auto_146769 ) ) ( not ( = ?auto_146767 ?auto_146769 ) ) ( not ( = ?auto_146768 ?auto_146769 ) ) ( ON ?auto_146767 ?auto_146768 ) ( ON-TABLE ?auto_146769 ) ( ON ?auto_146766 ?auto_146767 ) ( ON ?auto_146765 ?auto_146766 ) ( ON ?auto_146764 ?auto_146765 ) ( CLEAR ?auto_146762 ) ( ON ?auto_146763 ?auto_146764 ) ( CLEAR ?auto_146763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146769 ?auto_146768 ?auto_146767 ?auto_146766 ?auto_146765 ?auto_146764 )
      ( MAKE-7PILE ?auto_146761 ?auto_146762 ?auto_146763 ?auto_146764 ?auto_146765 ?auto_146766 ?auto_146767 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146770 - BLOCK
      ?auto_146771 - BLOCK
      ?auto_146772 - BLOCK
      ?auto_146773 - BLOCK
      ?auto_146774 - BLOCK
      ?auto_146775 - BLOCK
      ?auto_146776 - BLOCK
    )
    :vars
    (
      ?auto_146778 - BLOCK
      ?auto_146777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146770 ) ( not ( = ?auto_146770 ?auto_146771 ) ) ( not ( = ?auto_146770 ?auto_146772 ) ) ( not ( = ?auto_146770 ?auto_146773 ) ) ( not ( = ?auto_146770 ?auto_146774 ) ) ( not ( = ?auto_146770 ?auto_146775 ) ) ( not ( = ?auto_146770 ?auto_146776 ) ) ( not ( = ?auto_146770 ?auto_146778 ) ) ( not ( = ?auto_146771 ?auto_146772 ) ) ( not ( = ?auto_146771 ?auto_146773 ) ) ( not ( = ?auto_146771 ?auto_146774 ) ) ( not ( = ?auto_146771 ?auto_146775 ) ) ( not ( = ?auto_146771 ?auto_146776 ) ) ( not ( = ?auto_146771 ?auto_146778 ) ) ( not ( = ?auto_146772 ?auto_146773 ) ) ( not ( = ?auto_146772 ?auto_146774 ) ) ( not ( = ?auto_146772 ?auto_146775 ) ) ( not ( = ?auto_146772 ?auto_146776 ) ) ( not ( = ?auto_146772 ?auto_146778 ) ) ( not ( = ?auto_146773 ?auto_146774 ) ) ( not ( = ?auto_146773 ?auto_146775 ) ) ( not ( = ?auto_146773 ?auto_146776 ) ) ( not ( = ?auto_146773 ?auto_146778 ) ) ( not ( = ?auto_146774 ?auto_146775 ) ) ( not ( = ?auto_146774 ?auto_146776 ) ) ( not ( = ?auto_146774 ?auto_146778 ) ) ( not ( = ?auto_146775 ?auto_146776 ) ) ( not ( = ?auto_146775 ?auto_146778 ) ) ( not ( = ?auto_146776 ?auto_146778 ) ) ( ON ?auto_146778 ?auto_146777 ) ( not ( = ?auto_146770 ?auto_146777 ) ) ( not ( = ?auto_146771 ?auto_146777 ) ) ( not ( = ?auto_146772 ?auto_146777 ) ) ( not ( = ?auto_146773 ?auto_146777 ) ) ( not ( = ?auto_146774 ?auto_146777 ) ) ( not ( = ?auto_146775 ?auto_146777 ) ) ( not ( = ?auto_146776 ?auto_146777 ) ) ( not ( = ?auto_146778 ?auto_146777 ) ) ( ON ?auto_146776 ?auto_146778 ) ( ON-TABLE ?auto_146777 ) ( ON ?auto_146775 ?auto_146776 ) ( ON ?auto_146774 ?auto_146775 ) ( ON ?auto_146773 ?auto_146774 ) ( ON ?auto_146772 ?auto_146773 ) ( CLEAR ?auto_146772 ) ( HOLDING ?auto_146771 ) ( CLEAR ?auto_146770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146770 ?auto_146771 )
      ( MAKE-7PILE ?auto_146770 ?auto_146771 ?auto_146772 ?auto_146773 ?auto_146774 ?auto_146775 ?auto_146776 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146779 - BLOCK
      ?auto_146780 - BLOCK
      ?auto_146781 - BLOCK
      ?auto_146782 - BLOCK
      ?auto_146783 - BLOCK
      ?auto_146784 - BLOCK
      ?auto_146785 - BLOCK
    )
    :vars
    (
      ?auto_146787 - BLOCK
      ?auto_146786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_146779 ) ( not ( = ?auto_146779 ?auto_146780 ) ) ( not ( = ?auto_146779 ?auto_146781 ) ) ( not ( = ?auto_146779 ?auto_146782 ) ) ( not ( = ?auto_146779 ?auto_146783 ) ) ( not ( = ?auto_146779 ?auto_146784 ) ) ( not ( = ?auto_146779 ?auto_146785 ) ) ( not ( = ?auto_146779 ?auto_146787 ) ) ( not ( = ?auto_146780 ?auto_146781 ) ) ( not ( = ?auto_146780 ?auto_146782 ) ) ( not ( = ?auto_146780 ?auto_146783 ) ) ( not ( = ?auto_146780 ?auto_146784 ) ) ( not ( = ?auto_146780 ?auto_146785 ) ) ( not ( = ?auto_146780 ?auto_146787 ) ) ( not ( = ?auto_146781 ?auto_146782 ) ) ( not ( = ?auto_146781 ?auto_146783 ) ) ( not ( = ?auto_146781 ?auto_146784 ) ) ( not ( = ?auto_146781 ?auto_146785 ) ) ( not ( = ?auto_146781 ?auto_146787 ) ) ( not ( = ?auto_146782 ?auto_146783 ) ) ( not ( = ?auto_146782 ?auto_146784 ) ) ( not ( = ?auto_146782 ?auto_146785 ) ) ( not ( = ?auto_146782 ?auto_146787 ) ) ( not ( = ?auto_146783 ?auto_146784 ) ) ( not ( = ?auto_146783 ?auto_146785 ) ) ( not ( = ?auto_146783 ?auto_146787 ) ) ( not ( = ?auto_146784 ?auto_146785 ) ) ( not ( = ?auto_146784 ?auto_146787 ) ) ( not ( = ?auto_146785 ?auto_146787 ) ) ( ON ?auto_146787 ?auto_146786 ) ( not ( = ?auto_146779 ?auto_146786 ) ) ( not ( = ?auto_146780 ?auto_146786 ) ) ( not ( = ?auto_146781 ?auto_146786 ) ) ( not ( = ?auto_146782 ?auto_146786 ) ) ( not ( = ?auto_146783 ?auto_146786 ) ) ( not ( = ?auto_146784 ?auto_146786 ) ) ( not ( = ?auto_146785 ?auto_146786 ) ) ( not ( = ?auto_146787 ?auto_146786 ) ) ( ON ?auto_146785 ?auto_146787 ) ( ON-TABLE ?auto_146786 ) ( ON ?auto_146784 ?auto_146785 ) ( ON ?auto_146783 ?auto_146784 ) ( ON ?auto_146782 ?auto_146783 ) ( ON ?auto_146781 ?auto_146782 ) ( CLEAR ?auto_146779 ) ( ON ?auto_146780 ?auto_146781 ) ( CLEAR ?auto_146780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146786 ?auto_146787 ?auto_146785 ?auto_146784 ?auto_146783 ?auto_146782 ?auto_146781 )
      ( MAKE-7PILE ?auto_146779 ?auto_146780 ?auto_146781 ?auto_146782 ?auto_146783 ?auto_146784 ?auto_146785 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146788 - BLOCK
      ?auto_146789 - BLOCK
      ?auto_146790 - BLOCK
      ?auto_146791 - BLOCK
      ?auto_146792 - BLOCK
      ?auto_146793 - BLOCK
      ?auto_146794 - BLOCK
    )
    :vars
    (
      ?auto_146795 - BLOCK
      ?auto_146796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146788 ?auto_146789 ) ) ( not ( = ?auto_146788 ?auto_146790 ) ) ( not ( = ?auto_146788 ?auto_146791 ) ) ( not ( = ?auto_146788 ?auto_146792 ) ) ( not ( = ?auto_146788 ?auto_146793 ) ) ( not ( = ?auto_146788 ?auto_146794 ) ) ( not ( = ?auto_146788 ?auto_146795 ) ) ( not ( = ?auto_146789 ?auto_146790 ) ) ( not ( = ?auto_146789 ?auto_146791 ) ) ( not ( = ?auto_146789 ?auto_146792 ) ) ( not ( = ?auto_146789 ?auto_146793 ) ) ( not ( = ?auto_146789 ?auto_146794 ) ) ( not ( = ?auto_146789 ?auto_146795 ) ) ( not ( = ?auto_146790 ?auto_146791 ) ) ( not ( = ?auto_146790 ?auto_146792 ) ) ( not ( = ?auto_146790 ?auto_146793 ) ) ( not ( = ?auto_146790 ?auto_146794 ) ) ( not ( = ?auto_146790 ?auto_146795 ) ) ( not ( = ?auto_146791 ?auto_146792 ) ) ( not ( = ?auto_146791 ?auto_146793 ) ) ( not ( = ?auto_146791 ?auto_146794 ) ) ( not ( = ?auto_146791 ?auto_146795 ) ) ( not ( = ?auto_146792 ?auto_146793 ) ) ( not ( = ?auto_146792 ?auto_146794 ) ) ( not ( = ?auto_146792 ?auto_146795 ) ) ( not ( = ?auto_146793 ?auto_146794 ) ) ( not ( = ?auto_146793 ?auto_146795 ) ) ( not ( = ?auto_146794 ?auto_146795 ) ) ( ON ?auto_146795 ?auto_146796 ) ( not ( = ?auto_146788 ?auto_146796 ) ) ( not ( = ?auto_146789 ?auto_146796 ) ) ( not ( = ?auto_146790 ?auto_146796 ) ) ( not ( = ?auto_146791 ?auto_146796 ) ) ( not ( = ?auto_146792 ?auto_146796 ) ) ( not ( = ?auto_146793 ?auto_146796 ) ) ( not ( = ?auto_146794 ?auto_146796 ) ) ( not ( = ?auto_146795 ?auto_146796 ) ) ( ON ?auto_146794 ?auto_146795 ) ( ON-TABLE ?auto_146796 ) ( ON ?auto_146793 ?auto_146794 ) ( ON ?auto_146792 ?auto_146793 ) ( ON ?auto_146791 ?auto_146792 ) ( ON ?auto_146790 ?auto_146791 ) ( ON ?auto_146789 ?auto_146790 ) ( CLEAR ?auto_146789 ) ( HOLDING ?auto_146788 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146788 )
      ( MAKE-7PILE ?auto_146788 ?auto_146789 ?auto_146790 ?auto_146791 ?auto_146792 ?auto_146793 ?auto_146794 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_146797 - BLOCK
      ?auto_146798 - BLOCK
      ?auto_146799 - BLOCK
      ?auto_146800 - BLOCK
      ?auto_146801 - BLOCK
      ?auto_146802 - BLOCK
      ?auto_146803 - BLOCK
    )
    :vars
    (
      ?auto_146805 - BLOCK
      ?auto_146804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146797 ?auto_146798 ) ) ( not ( = ?auto_146797 ?auto_146799 ) ) ( not ( = ?auto_146797 ?auto_146800 ) ) ( not ( = ?auto_146797 ?auto_146801 ) ) ( not ( = ?auto_146797 ?auto_146802 ) ) ( not ( = ?auto_146797 ?auto_146803 ) ) ( not ( = ?auto_146797 ?auto_146805 ) ) ( not ( = ?auto_146798 ?auto_146799 ) ) ( not ( = ?auto_146798 ?auto_146800 ) ) ( not ( = ?auto_146798 ?auto_146801 ) ) ( not ( = ?auto_146798 ?auto_146802 ) ) ( not ( = ?auto_146798 ?auto_146803 ) ) ( not ( = ?auto_146798 ?auto_146805 ) ) ( not ( = ?auto_146799 ?auto_146800 ) ) ( not ( = ?auto_146799 ?auto_146801 ) ) ( not ( = ?auto_146799 ?auto_146802 ) ) ( not ( = ?auto_146799 ?auto_146803 ) ) ( not ( = ?auto_146799 ?auto_146805 ) ) ( not ( = ?auto_146800 ?auto_146801 ) ) ( not ( = ?auto_146800 ?auto_146802 ) ) ( not ( = ?auto_146800 ?auto_146803 ) ) ( not ( = ?auto_146800 ?auto_146805 ) ) ( not ( = ?auto_146801 ?auto_146802 ) ) ( not ( = ?auto_146801 ?auto_146803 ) ) ( not ( = ?auto_146801 ?auto_146805 ) ) ( not ( = ?auto_146802 ?auto_146803 ) ) ( not ( = ?auto_146802 ?auto_146805 ) ) ( not ( = ?auto_146803 ?auto_146805 ) ) ( ON ?auto_146805 ?auto_146804 ) ( not ( = ?auto_146797 ?auto_146804 ) ) ( not ( = ?auto_146798 ?auto_146804 ) ) ( not ( = ?auto_146799 ?auto_146804 ) ) ( not ( = ?auto_146800 ?auto_146804 ) ) ( not ( = ?auto_146801 ?auto_146804 ) ) ( not ( = ?auto_146802 ?auto_146804 ) ) ( not ( = ?auto_146803 ?auto_146804 ) ) ( not ( = ?auto_146805 ?auto_146804 ) ) ( ON ?auto_146803 ?auto_146805 ) ( ON-TABLE ?auto_146804 ) ( ON ?auto_146802 ?auto_146803 ) ( ON ?auto_146801 ?auto_146802 ) ( ON ?auto_146800 ?auto_146801 ) ( ON ?auto_146799 ?auto_146800 ) ( ON ?auto_146798 ?auto_146799 ) ( ON ?auto_146797 ?auto_146798 ) ( CLEAR ?auto_146797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146804 ?auto_146805 ?auto_146803 ?auto_146802 ?auto_146801 ?auto_146800 ?auto_146799 ?auto_146798 )
      ( MAKE-7PILE ?auto_146797 ?auto_146798 ?auto_146799 ?auto_146800 ?auto_146801 ?auto_146802 ?auto_146803 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146807 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_146807 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_146807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146808 - BLOCK
    )
    :vars
    (
      ?auto_146809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146808 ?auto_146809 ) ( CLEAR ?auto_146808 ) ( HAND-EMPTY ) ( not ( = ?auto_146808 ?auto_146809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146808 ?auto_146809 )
      ( MAKE-1PILE ?auto_146808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146810 - BLOCK
    )
    :vars
    (
      ?auto_146811 - BLOCK
      ?auto_146814 - BLOCK
      ?auto_146815 - BLOCK
      ?auto_146816 - BLOCK
      ?auto_146817 - BLOCK
      ?auto_146812 - BLOCK
      ?auto_146813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146810 ?auto_146811 ) ) ( HOLDING ?auto_146810 ) ( CLEAR ?auto_146811 ) ( ON-TABLE ?auto_146814 ) ( ON ?auto_146815 ?auto_146814 ) ( ON ?auto_146816 ?auto_146815 ) ( ON ?auto_146817 ?auto_146816 ) ( ON ?auto_146812 ?auto_146817 ) ( ON ?auto_146813 ?auto_146812 ) ( ON ?auto_146811 ?auto_146813 ) ( not ( = ?auto_146814 ?auto_146815 ) ) ( not ( = ?auto_146814 ?auto_146816 ) ) ( not ( = ?auto_146814 ?auto_146817 ) ) ( not ( = ?auto_146814 ?auto_146812 ) ) ( not ( = ?auto_146814 ?auto_146813 ) ) ( not ( = ?auto_146814 ?auto_146811 ) ) ( not ( = ?auto_146814 ?auto_146810 ) ) ( not ( = ?auto_146815 ?auto_146816 ) ) ( not ( = ?auto_146815 ?auto_146817 ) ) ( not ( = ?auto_146815 ?auto_146812 ) ) ( not ( = ?auto_146815 ?auto_146813 ) ) ( not ( = ?auto_146815 ?auto_146811 ) ) ( not ( = ?auto_146815 ?auto_146810 ) ) ( not ( = ?auto_146816 ?auto_146817 ) ) ( not ( = ?auto_146816 ?auto_146812 ) ) ( not ( = ?auto_146816 ?auto_146813 ) ) ( not ( = ?auto_146816 ?auto_146811 ) ) ( not ( = ?auto_146816 ?auto_146810 ) ) ( not ( = ?auto_146817 ?auto_146812 ) ) ( not ( = ?auto_146817 ?auto_146813 ) ) ( not ( = ?auto_146817 ?auto_146811 ) ) ( not ( = ?auto_146817 ?auto_146810 ) ) ( not ( = ?auto_146812 ?auto_146813 ) ) ( not ( = ?auto_146812 ?auto_146811 ) ) ( not ( = ?auto_146812 ?auto_146810 ) ) ( not ( = ?auto_146813 ?auto_146811 ) ) ( not ( = ?auto_146813 ?auto_146810 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146814 ?auto_146815 ?auto_146816 ?auto_146817 ?auto_146812 ?auto_146813 ?auto_146811 ?auto_146810 )
      ( MAKE-1PILE ?auto_146810 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146818 - BLOCK
    )
    :vars
    (
      ?auto_146821 - BLOCK
      ?auto_146825 - BLOCK
      ?auto_146819 - BLOCK
      ?auto_146824 - BLOCK
      ?auto_146820 - BLOCK
      ?auto_146823 - BLOCK
      ?auto_146822 - BLOCK
      ?auto_146826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146818 ?auto_146821 ) ) ( CLEAR ?auto_146821 ) ( ON-TABLE ?auto_146825 ) ( ON ?auto_146819 ?auto_146825 ) ( ON ?auto_146824 ?auto_146819 ) ( ON ?auto_146820 ?auto_146824 ) ( ON ?auto_146823 ?auto_146820 ) ( ON ?auto_146822 ?auto_146823 ) ( ON ?auto_146821 ?auto_146822 ) ( not ( = ?auto_146825 ?auto_146819 ) ) ( not ( = ?auto_146825 ?auto_146824 ) ) ( not ( = ?auto_146825 ?auto_146820 ) ) ( not ( = ?auto_146825 ?auto_146823 ) ) ( not ( = ?auto_146825 ?auto_146822 ) ) ( not ( = ?auto_146825 ?auto_146821 ) ) ( not ( = ?auto_146825 ?auto_146818 ) ) ( not ( = ?auto_146819 ?auto_146824 ) ) ( not ( = ?auto_146819 ?auto_146820 ) ) ( not ( = ?auto_146819 ?auto_146823 ) ) ( not ( = ?auto_146819 ?auto_146822 ) ) ( not ( = ?auto_146819 ?auto_146821 ) ) ( not ( = ?auto_146819 ?auto_146818 ) ) ( not ( = ?auto_146824 ?auto_146820 ) ) ( not ( = ?auto_146824 ?auto_146823 ) ) ( not ( = ?auto_146824 ?auto_146822 ) ) ( not ( = ?auto_146824 ?auto_146821 ) ) ( not ( = ?auto_146824 ?auto_146818 ) ) ( not ( = ?auto_146820 ?auto_146823 ) ) ( not ( = ?auto_146820 ?auto_146822 ) ) ( not ( = ?auto_146820 ?auto_146821 ) ) ( not ( = ?auto_146820 ?auto_146818 ) ) ( not ( = ?auto_146823 ?auto_146822 ) ) ( not ( = ?auto_146823 ?auto_146821 ) ) ( not ( = ?auto_146823 ?auto_146818 ) ) ( not ( = ?auto_146822 ?auto_146821 ) ) ( not ( = ?auto_146822 ?auto_146818 ) ) ( ON ?auto_146818 ?auto_146826 ) ( CLEAR ?auto_146818 ) ( HAND-EMPTY ) ( not ( = ?auto_146818 ?auto_146826 ) ) ( not ( = ?auto_146821 ?auto_146826 ) ) ( not ( = ?auto_146825 ?auto_146826 ) ) ( not ( = ?auto_146819 ?auto_146826 ) ) ( not ( = ?auto_146824 ?auto_146826 ) ) ( not ( = ?auto_146820 ?auto_146826 ) ) ( not ( = ?auto_146823 ?auto_146826 ) ) ( not ( = ?auto_146822 ?auto_146826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146818 ?auto_146826 )
      ( MAKE-1PILE ?auto_146818 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146827 - BLOCK
    )
    :vars
    (
      ?auto_146830 - BLOCK
      ?auto_146833 - BLOCK
      ?auto_146834 - BLOCK
      ?auto_146828 - BLOCK
      ?auto_146835 - BLOCK
      ?auto_146832 - BLOCK
      ?auto_146831 - BLOCK
      ?auto_146829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146827 ?auto_146830 ) ) ( ON-TABLE ?auto_146833 ) ( ON ?auto_146834 ?auto_146833 ) ( ON ?auto_146828 ?auto_146834 ) ( ON ?auto_146835 ?auto_146828 ) ( ON ?auto_146832 ?auto_146835 ) ( ON ?auto_146831 ?auto_146832 ) ( not ( = ?auto_146833 ?auto_146834 ) ) ( not ( = ?auto_146833 ?auto_146828 ) ) ( not ( = ?auto_146833 ?auto_146835 ) ) ( not ( = ?auto_146833 ?auto_146832 ) ) ( not ( = ?auto_146833 ?auto_146831 ) ) ( not ( = ?auto_146833 ?auto_146830 ) ) ( not ( = ?auto_146833 ?auto_146827 ) ) ( not ( = ?auto_146834 ?auto_146828 ) ) ( not ( = ?auto_146834 ?auto_146835 ) ) ( not ( = ?auto_146834 ?auto_146832 ) ) ( not ( = ?auto_146834 ?auto_146831 ) ) ( not ( = ?auto_146834 ?auto_146830 ) ) ( not ( = ?auto_146834 ?auto_146827 ) ) ( not ( = ?auto_146828 ?auto_146835 ) ) ( not ( = ?auto_146828 ?auto_146832 ) ) ( not ( = ?auto_146828 ?auto_146831 ) ) ( not ( = ?auto_146828 ?auto_146830 ) ) ( not ( = ?auto_146828 ?auto_146827 ) ) ( not ( = ?auto_146835 ?auto_146832 ) ) ( not ( = ?auto_146835 ?auto_146831 ) ) ( not ( = ?auto_146835 ?auto_146830 ) ) ( not ( = ?auto_146835 ?auto_146827 ) ) ( not ( = ?auto_146832 ?auto_146831 ) ) ( not ( = ?auto_146832 ?auto_146830 ) ) ( not ( = ?auto_146832 ?auto_146827 ) ) ( not ( = ?auto_146831 ?auto_146830 ) ) ( not ( = ?auto_146831 ?auto_146827 ) ) ( ON ?auto_146827 ?auto_146829 ) ( CLEAR ?auto_146827 ) ( not ( = ?auto_146827 ?auto_146829 ) ) ( not ( = ?auto_146830 ?auto_146829 ) ) ( not ( = ?auto_146833 ?auto_146829 ) ) ( not ( = ?auto_146834 ?auto_146829 ) ) ( not ( = ?auto_146828 ?auto_146829 ) ) ( not ( = ?auto_146835 ?auto_146829 ) ) ( not ( = ?auto_146832 ?auto_146829 ) ) ( not ( = ?auto_146831 ?auto_146829 ) ) ( HOLDING ?auto_146830 ) ( CLEAR ?auto_146831 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146833 ?auto_146834 ?auto_146828 ?auto_146835 ?auto_146832 ?auto_146831 ?auto_146830 )
      ( MAKE-1PILE ?auto_146827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146836 - BLOCK
    )
    :vars
    (
      ?auto_146842 - BLOCK
      ?auto_146844 - BLOCK
      ?auto_146841 - BLOCK
      ?auto_146839 - BLOCK
      ?auto_146840 - BLOCK
      ?auto_146843 - BLOCK
      ?auto_146838 - BLOCK
      ?auto_146837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146836 ?auto_146842 ) ) ( ON-TABLE ?auto_146844 ) ( ON ?auto_146841 ?auto_146844 ) ( ON ?auto_146839 ?auto_146841 ) ( ON ?auto_146840 ?auto_146839 ) ( ON ?auto_146843 ?auto_146840 ) ( ON ?auto_146838 ?auto_146843 ) ( not ( = ?auto_146844 ?auto_146841 ) ) ( not ( = ?auto_146844 ?auto_146839 ) ) ( not ( = ?auto_146844 ?auto_146840 ) ) ( not ( = ?auto_146844 ?auto_146843 ) ) ( not ( = ?auto_146844 ?auto_146838 ) ) ( not ( = ?auto_146844 ?auto_146842 ) ) ( not ( = ?auto_146844 ?auto_146836 ) ) ( not ( = ?auto_146841 ?auto_146839 ) ) ( not ( = ?auto_146841 ?auto_146840 ) ) ( not ( = ?auto_146841 ?auto_146843 ) ) ( not ( = ?auto_146841 ?auto_146838 ) ) ( not ( = ?auto_146841 ?auto_146842 ) ) ( not ( = ?auto_146841 ?auto_146836 ) ) ( not ( = ?auto_146839 ?auto_146840 ) ) ( not ( = ?auto_146839 ?auto_146843 ) ) ( not ( = ?auto_146839 ?auto_146838 ) ) ( not ( = ?auto_146839 ?auto_146842 ) ) ( not ( = ?auto_146839 ?auto_146836 ) ) ( not ( = ?auto_146840 ?auto_146843 ) ) ( not ( = ?auto_146840 ?auto_146838 ) ) ( not ( = ?auto_146840 ?auto_146842 ) ) ( not ( = ?auto_146840 ?auto_146836 ) ) ( not ( = ?auto_146843 ?auto_146838 ) ) ( not ( = ?auto_146843 ?auto_146842 ) ) ( not ( = ?auto_146843 ?auto_146836 ) ) ( not ( = ?auto_146838 ?auto_146842 ) ) ( not ( = ?auto_146838 ?auto_146836 ) ) ( ON ?auto_146836 ?auto_146837 ) ( not ( = ?auto_146836 ?auto_146837 ) ) ( not ( = ?auto_146842 ?auto_146837 ) ) ( not ( = ?auto_146844 ?auto_146837 ) ) ( not ( = ?auto_146841 ?auto_146837 ) ) ( not ( = ?auto_146839 ?auto_146837 ) ) ( not ( = ?auto_146840 ?auto_146837 ) ) ( not ( = ?auto_146843 ?auto_146837 ) ) ( not ( = ?auto_146838 ?auto_146837 ) ) ( CLEAR ?auto_146838 ) ( ON ?auto_146842 ?auto_146836 ) ( CLEAR ?auto_146842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146837 ?auto_146836 )
      ( MAKE-1PILE ?auto_146836 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146845 - BLOCK
    )
    :vars
    (
      ?auto_146846 - BLOCK
      ?auto_146853 - BLOCK
      ?auto_146851 - BLOCK
      ?auto_146849 - BLOCK
      ?auto_146852 - BLOCK
      ?auto_146850 - BLOCK
      ?auto_146848 - BLOCK
      ?auto_146847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146845 ?auto_146846 ) ) ( ON-TABLE ?auto_146853 ) ( ON ?auto_146851 ?auto_146853 ) ( ON ?auto_146849 ?auto_146851 ) ( ON ?auto_146852 ?auto_146849 ) ( ON ?auto_146850 ?auto_146852 ) ( not ( = ?auto_146853 ?auto_146851 ) ) ( not ( = ?auto_146853 ?auto_146849 ) ) ( not ( = ?auto_146853 ?auto_146852 ) ) ( not ( = ?auto_146853 ?auto_146850 ) ) ( not ( = ?auto_146853 ?auto_146848 ) ) ( not ( = ?auto_146853 ?auto_146846 ) ) ( not ( = ?auto_146853 ?auto_146845 ) ) ( not ( = ?auto_146851 ?auto_146849 ) ) ( not ( = ?auto_146851 ?auto_146852 ) ) ( not ( = ?auto_146851 ?auto_146850 ) ) ( not ( = ?auto_146851 ?auto_146848 ) ) ( not ( = ?auto_146851 ?auto_146846 ) ) ( not ( = ?auto_146851 ?auto_146845 ) ) ( not ( = ?auto_146849 ?auto_146852 ) ) ( not ( = ?auto_146849 ?auto_146850 ) ) ( not ( = ?auto_146849 ?auto_146848 ) ) ( not ( = ?auto_146849 ?auto_146846 ) ) ( not ( = ?auto_146849 ?auto_146845 ) ) ( not ( = ?auto_146852 ?auto_146850 ) ) ( not ( = ?auto_146852 ?auto_146848 ) ) ( not ( = ?auto_146852 ?auto_146846 ) ) ( not ( = ?auto_146852 ?auto_146845 ) ) ( not ( = ?auto_146850 ?auto_146848 ) ) ( not ( = ?auto_146850 ?auto_146846 ) ) ( not ( = ?auto_146850 ?auto_146845 ) ) ( not ( = ?auto_146848 ?auto_146846 ) ) ( not ( = ?auto_146848 ?auto_146845 ) ) ( ON ?auto_146845 ?auto_146847 ) ( not ( = ?auto_146845 ?auto_146847 ) ) ( not ( = ?auto_146846 ?auto_146847 ) ) ( not ( = ?auto_146853 ?auto_146847 ) ) ( not ( = ?auto_146851 ?auto_146847 ) ) ( not ( = ?auto_146849 ?auto_146847 ) ) ( not ( = ?auto_146852 ?auto_146847 ) ) ( not ( = ?auto_146850 ?auto_146847 ) ) ( not ( = ?auto_146848 ?auto_146847 ) ) ( ON ?auto_146846 ?auto_146845 ) ( CLEAR ?auto_146846 ) ( ON-TABLE ?auto_146847 ) ( HOLDING ?auto_146848 ) ( CLEAR ?auto_146850 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146853 ?auto_146851 ?auto_146849 ?auto_146852 ?auto_146850 ?auto_146848 )
      ( MAKE-1PILE ?auto_146845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146854 - BLOCK
    )
    :vars
    (
      ?auto_146858 - BLOCK
      ?auto_146859 - BLOCK
      ?auto_146860 - BLOCK
      ?auto_146861 - BLOCK
      ?auto_146855 - BLOCK
      ?auto_146856 - BLOCK
      ?auto_146862 - BLOCK
      ?auto_146857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146854 ?auto_146858 ) ) ( ON-TABLE ?auto_146859 ) ( ON ?auto_146860 ?auto_146859 ) ( ON ?auto_146861 ?auto_146860 ) ( ON ?auto_146855 ?auto_146861 ) ( ON ?auto_146856 ?auto_146855 ) ( not ( = ?auto_146859 ?auto_146860 ) ) ( not ( = ?auto_146859 ?auto_146861 ) ) ( not ( = ?auto_146859 ?auto_146855 ) ) ( not ( = ?auto_146859 ?auto_146856 ) ) ( not ( = ?auto_146859 ?auto_146862 ) ) ( not ( = ?auto_146859 ?auto_146858 ) ) ( not ( = ?auto_146859 ?auto_146854 ) ) ( not ( = ?auto_146860 ?auto_146861 ) ) ( not ( = ?auto_146860 ?auto_146855 ) ) ( not ( = ?auto_146860 ?auto_146856 ) ) ( not ( = ?auto_146860 ?auto_146862 ) ) ( not ( = ?auto_146860 ?auto_146858 ) ) ( not ( = ?auto_146860 ?auto_146854 ) ) ( not ( = ?auto_146861 ?auto_146855 ) ) ( not ( = ?auto_146861 ?auto_146856 ) ) ( not ( = ?auto_146861 ?auto_146862 ) ) ( not ( = ?auto_146861 ?auto_146858 ) ) ( not ( = ?auto_146861 ?auto_146854 ) ) ( not ( = ?auto_146855 ?auto_146856 ) ) ( not ( = ?auto_146855 ?auto_146862 ) ) ( not ( = ?auto_146855 ?auto_146858 ) ) ( not ( = ?auto_146855 ?auto_146854 ) ) ( not ( = ?auto_146856 ?auto_146862 ) ) ( not ( = ?auto_146856 ?auto_146858 ) ) ( not ( = ?auto_146856 ?auto_146854 ) ) ( not ( = ?auto_146862 ?auto_146858 ) ) ( not ( = ?auto_146862 ?auto_146854 ) ) ( ON ?auto_146854 ?auto_146857 ) ( not ( = ?auto_146854 ?auto_146857 ) ) ( not ( = ?auto_146858 ?auto_146857 ) ) ( not ( = ?auto_146859 ?auto_146857 ) ) ( not ( = ?auto_146860 ?auto_146857 ) ) ( not ( = ?auto_146861 ?auto_146857 ) ) ( not ( = ?auto_146855 ?auto_146857 ) ) ( not ( = ?auto_146856 ?auto_146857 ) ) ( not ( = ?auto_146862 ?auto_146857 ) ) ( ON ?auto_146858 ?auto_146854 ) ( ON-TABLE ?auto_146857 ) ( CLEAR ?auto_146856 ) ( ON ?auto_146862 ?auto_146858 ) ( CLEAR ?auto_146862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146857 ?auto_146854 ?auto_146858 )
      ( MAKE-1PILE ?auto_146854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146863 - BLOCK
    )
    :vars
    (
      ?auto_146868 - BLOCK
      ?auto_146864 - BLOCK
      ?auto_146866 - BLOCK
      ?auto_146869 - BLOCK
      ?auto_146867 - BLOCK
      ?auto_146870 - BLOCK
      ?auto_146865 - BLOCK
      ?auto_146871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146863 ?auto_146868 ) ) ( ON-TABLE ?auto_146864 ) ( ON ?auto_146866 ?auto_146864 ) ( ON ?auto_146869 ?auto_146866 ) ( ON ?auto_146867 ?auto_146869 ) ( not ( = ?auto_146864 ?auto_146866 ) ) ( not ( = ?auto_146864 ?auto_146869 ) ) ( not ( = ?auto_146864 ?auto_146867 ) ) ( not ( = ?auto_146864 ?auto_146870 ) ) ( not ( = ?auto_146864 ?auto_146865 ) ) ( not ( = ?auto_146864 ?auto_146868 ) ) ( not ( = ?auto_146864 ?auto_146863 ) ) ( not ( = ?auto_146866 ?auto_146869 ) ) ( not ( = ?auto_146866 ?auto_146867 ) ) ( not ( = ?auto_146866 ?auto_146870 ) ) ( not ( = ?auto_146866 ?auto_146865 ) ) ( not ( = ?auto_146866 ?auto_146868 ) ) ( not ( = ?auto_146866 ?auto_146863 ) ) ( not ( = ?auto_146869 ?auto_146867 ) ) ( not ( = ?auto_146869 ?auto_146870 ) ) ( not ( = ?auto_146869 ?auto_146865 ) ) ( not ( = ?auto_146869 ?auto_146868 ) ) ( not ( = ?auto_146869 ?auto_146863 ) ) ( not ( = ?auto_146867 ?auto_146870 ) ) ( not ( = ?auto_146867 ?auto_146865 ) ) ( not ( = ?auto_146867 ?auto_146868 ) ) ( not ( = ?auto_146867 ?auto_146863 ) ) ( not ( = ?auto_146870 ?auto_146865 ) ) ( not ( = ?auto_146870 ?auto_146868 ) ) ( not ( = ?auto_146870 ?auto_146863 ) ) ( not ( = ?auto_146865 ?auto_146868 ) ) ( not ( = ?auto_146865 ?auto_146863 ) ) ( ON ?auto_146863 ?auto_146871 ) ( not ( = ?auto_146863 ?auto_146871 ) ) ( not ( = ?auto_146868 ?auto_146871 ) ) ( not ( = ?auto_146864 ?auto_146871 ) ) ( not ( = ?auto_146866 ?auto_146871 ) ) ( not ( = ?auto_146869 ?auto_146871 ) ) ( not ( = ?auto_146867 ?auto_146871 ) ) ( not ( = ?auto_146870 ?auto_146871 ) ) ( not ( = ?auto_146865 ?auto_146871 ) ) ( ON ?auto_146868 ?auto_146863 ) ( ON-TABLE ?auto_146871 ) ( ON ?auto_146865 ?auto_146868 ) ( CLEAR ?auto_146865 ) ( HOLDING ?auto_146870 ) ( CLEAR ?auto_146867 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146864 ?auto_146866 ?auto_146869 ?auto_146867 ?auto_146870 )
      ( MAKE-1PILE ?auto_146863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146872 - BLOCK
    )
    :vars
    (
      ?auto_146873 - BLOCK
      ?auto_146875 - BLOCK
      ?auto_146877 - BLOCK
      ?auto_146874 - BLOCK
      ?auto_146876 - BLOCK
      ?auto_146880 - BLOCK
      ?auto_146879 - BLOCK
      ?auto_146878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146872 ?auto_146873 ) ) ( ON-TABLE ?auto_146875 ) ( ON ?auto_146877 ?auto_146875 ) ( ON ?auto_146874 ?auto_146877 ) ( ON ?auto_146876 ?auto_146874 ) ( not ( = ?auto_146875 ?auto_146877 ) ) ( not ( = ?auto_146875 ?auto_146874 ) ) ( not ( = ?auto_146875 ?auto_146876 ) ) ( not ( = ?auto_146875 ?auto_146880 ) ) ( not ( = ?auto_146875 ?auto_146879 ) ) ( not ( = ?auto_146875 ?auto_146873 ) ) ( not ( = ?auto_146875 ?auto_146872 ) ) ( not ( = ?auto_146877 ?auto_146874 ) ) ( not ( = ?auto_146877 ?auto_146876 ) ) ( not ( = ?auto_146877 ?auto_146880 ) ) ( not ( = ?auto_146877 ?auto_146879 ) ) ( not ( = ?auto_146877 ?auto_146873 ) ) ( not ( = ?auto_146877 ?auto_146872 ) ) ( not ( = ?auto_146874 ?auto_146876 ) ) ( not ( = ?auto_146874 ?auto_146880 ) ) ( not ( = ?auto_146874 ?auto_146879 ) ) ( not ( = ?auto_146874 ?auto_146873 ) ) ( not ( = ?auto_146874 ?auto_146872 ) ) ( not ( = ?auto_146876 ?auto_146880 ) ) ( not ( = ?auto_146876 ?auto_146879 ) ) ( not ( = ?auto_146876 ?auto_146873 ) ) ( not ( = ?auto_146876 ?auto_146872 ) ) ( not ( = ?auto_146880 ?auto_146879 ) ) ( not ( = ?auto_146880 ?auto_146873 ) ) ( not ( = ?auto_146880 ?auto_146872 ) ) ( not ( = ?auto_146879 ?auto_146873 ) ) ( not ( = ?auto_146879 ?auto_146872 ) ) ( ON ?auto_146872 ?auto_146878 ) ( not ( = ?auto_146872 ?auto_146878 ) ) ( not ( = ?auto_146873 ?auto_146878 ) ) ( not ( = ?auto_146875 ?auto_146878 ) ) ( not ( = ?auto_146877 ?auto_146878 ) ) ( not ( = ?auto_146874 ?auto_146878 ) ) ( not ( = ?auto_146876 ?auto_146878 ) ) ( not ( = ?auto_146880 ?auto_146878 ) ) ( not ( = ?auto_146879 ?auto_146878 ) ) ( ON ?auto_146873 ?auto_146872 ) ( ON-TABLE ?auto_146878 ) ( ON ?auto_146879 ?auto_146873 ) ( CLEAR ?auto_146876 ) ( ON ?auto_146880 ?auto_146879 ) ( CLEAR ?auto_146880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146878 ?auto_146872 ?auto_146873 ?auto_146879 )
      ( MAKE-1PILE ?auto_146872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146881 - BLOCK
    )
    :vars
    (
      ?auto_146889 - BLOCK
      ?auto_146888 - BLOCK
      ?auto_146882 - BLOCK
      ?auto_146883 - BLOCK
      ?auto_146886 - BLOCK
      ?auto_146885 - BLOCK
      ?auto_146887 - BLOCK
      ?auto_146884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146881 ?auto_146889 ) ) ( ON-TABLE ?auto_146888 ) ( ON ?auto_146882 ?auto_146888 ) ( ON ?auto_146883 ?auto_146882 ) ( not ( = ?auto_146888 ?auto_146882 ) ) ( not ( = ?auto_146888 ?auto_146883 ) ) ( not ( = ?auto_146888 ?auto_146886 ) ) ( not ( = ?auto_146888 ?auto_146885 ) ) ( not ( = ?auto_146888 ?auto_146887 ) ) ( not ( = ?auto_146888 ?auto_146889 ) ) ( not ( = ?auto_146888 ?auto_146881 ) ) ( not ( = ?auto_146882 ?auto_146883 ) ) ( not ( = ?auto_146882 ?auto_146886 ) ) ( not ( = ?auto_146882 ?auto_146885 ) ) ( not ( = ?auto_146882 ?auto_146887 ) ) ( not ( = ?auto_146882 ?auto_146889 ) ) ( not ( = ?auto_146882 ?auto_146881 ) ) ( not ( = ?auto_146883 ?auto_146886 ) ) ( not ( = ?auto_146883 ?auto_146885 ) ) ( not ( = ?auto_146883 ?auto_146887 ) ) ( not ( = ?auto_146883 ?auto_146889 ) ) ( not ( = ?auto_146883 ?auto_146881 ) ) ( not ( = ?auto_146886 ?auto_146885 ) ) ( not ( = ?auto_146886 ?auto_146887 ) ) ( not ( = ?auto_146886 ?auto_146889 ) ) ( not ( = ?auto_146886 ?auto_146881 ) ) ( not ( = ?auto_146885 ?auto_146887 ) ) ( not ( = ?auto_146885 ?auto_146889 ) ) ( not ( = ?auto_146885 ?auto_146881 ) ) ( not ( = ?auto_146887 ?auto_146889 ) ) ( not ( = ?auto_146887 ?auto_146881 ) ) ( ON ?auto_146881 ?auto_146884 ) ( not ( = ?auto_146881 ?auto_146884 ) ) ( not ( = ?auto_146889 ?auto_146884 ) ) ( not ( = ?auto_146888 ?auto_146884 ) ) ( not ( = ?auto_146882 ?auto_146884 ) ) ( not ( = ?auto_146883 ?auto_146884 ) ) ( not ( = ?auto_146886 ?auto_146884 ) ) ( not ( = ?auto_146885 ?auto_146884 ) ) ( not ( = ?auto_146887 ?auto_146884 ) ) ( ON ?auto_146889 ?auto_146881 ) ( ON-TABLE ?auto_146884 ) ( ON ?auto_146887 ?auto_146889 ) ( ON ?auto_146885 ?auto_146887 ) ( CLEAR ?auto_146885 ) ( HOLDING ?auto_146886 ) ( CLEAR ?auto_146883 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_146888 ?auto_146882 ?auto_146883 ?auto_146886 )
      ( MAKE-1PILE ?auto_146881 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146890 - BLOCK
    )
    :vars
    (
      ?auto_146891 - BLOCK
      ?auto_146892 - BLOCK
      ?auto_146898 - BLOCK
      ?auto_146894 - BLOCK
      ?auto_146895 - BLOCK
      ?auto_146893 - BLOCK
      ?auto_146896 - BLOCK
      ?auto_146897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146890 ?auto_146891 ) ) ( ON-TABLE ?auto_146892 ) ( ON ?auto_146898 ?auto_146892 ) ( ON ?auto_146894 ?auto_146898 ) ( not ( = ?auto_146892 ?auto_146898 ) ) ( not ( = ?auto_146892 ?auto_146894 ) ) ( not ( = ?auto_146892 ?auto_146895 ) ) ( not ( = ?auto_146892 ?auto_146893 ) ) ( not ( = ?auto_146892 ?auto_146896 ) ) ( not ( = ?auto_146892 ?auto_146891 ) ) ( not ( = ?auto_146892 ?auto_146890 ) ) ( not ( = ?auto_146898 ?auto_146894 ) ) ( not ( = ?auto_146898 ?auto_146895 ) ) ( not ( = ?auto_146898 ?auto_146893 ) ) ( not ( = ?auto_146898 ?auto_146896 ) ) ( not ( = ?auto_146898 ?auto_146891 ) ) ( not ( = ?auto_146898 ?auto_146890 ) ) ( not ( = ?auto_146894 ?auto_146895 ) ) ( not ( = ?auto_146894 ?auto_146893 ) ) ( not ( = ?auto_146894 ?auto_146896 ) ) ( not ( = ?auto_146894 ?auto_146891 ) ) ( not ( = ?auto_146894 ?auto_146890 ) ) ( not ( = ?auto_146895 ?auto_146893 ) ) ( not ( = ?auto_146895 ?auto_146896 ) ) ( not ( = ?auto_146895 ?auto_146891 ) ) ( not ( = ?auto_146895 ?auto_146890 ) ) ( not ( = ?auto_146893 ?auto_146896 ) ) ( not ( = ?auto_146893 ?auto_146891 ) ) ( not ( = ?auto_146893 ?auto_146890 ) ) ( not ( = ?auto_146896 ?auto_146891 ) ) ( not ( = ?auto_146896 ?auto_146890 ) ) ( ON ?auto_146890 ?auto_146897 ) ( not ( = ?auto_146890 ?auto_146897 ) ) ( not ( = ?auto_146891 ?auto_146897 ) ) ( not ( = ?auto_146892 ?auto_146897 ) ) ( not ( = ?auto_146898 ?auto_146897 ) ) ( not ( = ?auto_146894 ?auto_146897 ) ) ( not ( = ?auto_146895 ?auto_146897 ) ) ( not ( = ?auto_146893 ?auto_146897 ) ) ( not ( = ?auto_146896 ?auto_146897 ) ) ( ON ?auto_146891 ?auto_146890 ) ( ON-TABLE ?auto_146897 ) ( ON ?auto_146896 ?auto_146891 ) ( ON ?auto_146893 ?auto_146896 ) ( CLEAR ?auto_146894 ) ( ON ?auto_146895 ?auto_146893 ) ( CLEAR ?auto_146895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_146897 ?auto_146890 ?auto_146891 ?auto_146896 ?auto_146893 )
      ( MAKE-1PILE ?auto_146890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146899 - BLOCK
    )
    :vars
    (
      ?auto_146903 - BLOCK
      ?auto_146904 - BLOCK
      ?auto_146905 - BLOCK
      ?auto_146907 - BLOCK
      ?auto_146906 - BLOCK
      ?auto_146902 - BLOCK
      ?auto_146900 - BLOCK
      ?auto_146901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146899 ?auto_146903 ) ) ( ON-TABLE ?auto_146904 ) ( ON ?auto_146905 ?auto_146904 ) ( not ( = ?auto_146904 ?auto_146905 ) ) ( not ( = ?auto_146904 ?auto_146907 ) ) ( not ( = ?auto_146904 ?auto_146906 ) ) ( not ( = ?auto_146904 ?auto_146902 ) ) ( not ( = ?auto_146904 ?auto_146900 ) ) ( not ( = ?auto_146904 ?auto_146903 ) ) ( not ( = ?auto_146904 ?auto_146899 ) ) ( not ( = ?auto_146905 ?auto_146907 ) ) ( not ( = ?auto_146905 ?auto_146906 ) ) ( not ( = ?auto_146905 ?auto_146902 ) ) ( not ( = ?auto_146905 ?auto_146900 ) ) ( not ( = ?auto_146905 ?auto_146903 ) ) ( not ( = ?auto_146905 ?auto_146899 ) ) ( not ( = ?auto_146907 ?auto_146906 ) ) ( not ( = ?auto_146907 ?auto_146902 ) ) ( not ( = ?auto_146907 ?auto_146900 ) ) ( not ( = ?auto_146907 ?auto_146903 ) ) ( not ( = ?auto_146907 ?auto_146899 ) ) ( not ( = ?auto_146906 ?auto_146902 ) ) ( not ( = ?auto_146906 ?auto_146900 ) ) ( not ( = ?auto_146906 ?auto_146903 ) ) ( not ( = ?auto_146906 ?auto_146899 ) ) ( not ( = ?auto_146902 ?auto_146900 ) ) ( not ( = ?auto_146902 ?auto_146903 ) ) ( not ( = ?auto_146902 ?auto_146899 ) ) ( not ( = ?auto_146900 ?auto_146903 ) ) ( not ( = ?auto_146900 ?auto_146899 ) ) ( ON ?auto_146899 ?auto_146901 ) ( not ( = ?auto_146899 ?auto_146901 ) ) ( not ( = ?auto_146903 ?auto_146901 ) ) ( not ( = ?auto_146904 ?auto_146901 ) ) ( not ( = ?auto_146905 ?auto_146901 ) ) ( not ( = ?auto_146907 ?auto_146901 ) ) ( not ( = ?auto_146906 ?auto_146901 ) ) ( not ( = ?auto_146902 ?auto_146901 ) ) ( not ( = ?auto_146900 ?auto_146901 ) ) ( ON ?auto_146903 ?auto_146899 ) ( ON-TABLE ?auto_146901 ) ( ON ?auto_146900 ?auto_146903 ) ( ON ?auto_146902 ?auto_146900 ) ( ON ?auto_146906 ?auto_146902 ) ( CLEAR ?auto_146906 ) ( HOLDING ?auto_146907 ) ( CLEAR ?auto_146905 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_146904 ?auto_146905 ?auto_146907 )
      ( MAKE-1PILE ?auto_146899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146908 - BLOCK
    )
    :vars
    (
      ?auto_146909 - BLOCK
      ?auto_146912 - BLOCK
      ?auto_146914 - BLOCK
      ?auto_146910 - BLOCK
      ?auto_146915 - BLOCK
      ?auto_146913 - BLOCK
      ?auto_146916 - BLOCK
      ?auto_146911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146908 ?auto_146909 ) ) ( ON-TABLE ?auto_146912 ) ( ON ?auto_146914 ?auto_146912 ) ( not ( = ?auto_146912 ?auto_146914 ) ) ( not ( = ?auto_146912 ?auto_146910 ) ) ( not ( = ?auto_146912 ?auto_146915 ) ) ( not ( = ?auto_146912 ?auto_146913 ) ) ( not ( = ?auto_146912 ?auto_146916 ) ) ( not ( = ?auto_146912 ?auto_146909 ) ) ( not ( = ?auto_146912 ?auto_146908 ) ) ( not ( = ?auto_146914 ?auto_146910 ) ) ( not ( = ?auto_146914 ?auto_146915 ) ) ( not ( = ?auto_146914 ?auto_146913 ) ) ( not ( = ?auto_146914 ?auto_146916 ) ) ( not ( = ?auto_146914 ?auto_146909 ) ) ( not ( = ?auto_146914 ?auto_146908 ) ) ( not ( = ?auto_146910 ?auto_146915 ) ) ( not ( = ?auto_146910 ?auto_146913 ) ) ( not ( = ?auto_146910 ?auto_146916 ) ) ( not ( = ?auto_146910 ?auto_146909 ) ) ( not ( = ?auto_146910 ?auto_146908 ) ) ( not ( = ?auto_146915 ?auto_146913 ) ) ( not ( = ?auto_146915 ?auto_146916 ) ) ( not ( = ?auto_146915 ?auto_146909 ) ) ( not ( = ?auto_146915 ?auto_146908 ) ) ( not ( = ?auto_146913 ?auto_146916 ) ) ( not ( = ?auto_146913 ?auto_146909 ) ) ( not ( = ?auto_146913 ?auto_146908 ) ) ( not ( = ?auto_146916 ?auto_146909 ) ) ( not ( = ?auto_146916 ?auto_146908 ) ) ( ON ?auto_146908 ?auto_146911 ) ( not ( = ?auto_146908 ?auto_146911 ) ) ( not ( = ?auto_146909 ?auto_146911 ) ) ( not ( = ?auto_146912 ?auto_146911 ) ) ( not ( = ?auto_146914 ?auto_146911 ) ) ( not ( = ?auto_146910 ?auto_146911 ) ) ( not ( = ?auto_146915 ?auto_146911 ) ) ( not ( = ?auto_146913 ?auto_146911 ) ) ( not ( = ?auto_146916 ?auto_146911 ) ) ( ON ?auto_146909 ?auto_146908 ) ( ON-TABLE ?auto_146911 ) ( ON ?auto_146916 ?auto_146909 ) ( ON ?auto_146913 ?auto_146916 ) ( ON ?auto_146915 ?auto_146913 ) ( CLEAR ?auto_146914 ) ( ON ?auto_146910 ?auto_146915 ) ( CLEAR ?auto_146910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_146911 ?auto_146908 ?auto_146909 ?auto_146916 ?auto_146913 ?auto_146915 )
      ( MAKE-1PILE ?auto_146908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146917 - BLOCK
    )
    :vars
    (
      ?auto_146923 - BLOCK
      ?auto_146922 - BLOCK
      ?auto_146925 - BLOCK
      ?auto_146924 - BLOCK
      ?auto_146918 - BLOCK
      ?auto_146920 - BLOCK
      ?auto_146921 - BLOCK
      ?auto_146919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146917 ?auto_146923 ) ) ( ON-TABLE ?auto_146922 ) ( not ( = ?auto_146922 ?auto_146925 ) ) ( not ( = ?auto_146922 ?auto_146924 ) ) ( not ( = ?auto_146922 ?auto_146918 ) ) ( not ( = ?auto_146922 ?auto_146920 ) ) ( not ( = ?auto_146922 ?auto_146921 ) ) ( not ( = ?auto_146922 ?auto_146923 ) ) ( not ( = ?auto_146922 ?auto_146917 ) ) ( not ( = ?auto_146925 ?auto_146924 ) ) ( not ( = ?auto_146925 ?auto_146918 ) ) ( not ( = ?auto_146925 ?auto_146920 ) ) ( not ( = ?auto_146925 ?auto_146921 ) ) ( not ( = ?auto_146925 ?auto_146923 ) ) ( not ( = ?auto_146925 ?auto_146917 ) ) ( not ( = ?auto_146924 ?auto_146918 ) ) ( not ( = ?auto_146924 ?auto_146920 ) ) ( not ( = ?auto_146924 ?auto_146921 ) ) ( not ( = ?auto_146924 ?auto_146923 ) ) ( not ( = ?auto_146924 ?auto_146917 ) ) ( not ( = ?auto_146918 ?auto_146920 ) ) ( not ( = ?auto_146918 ?auto_146921 ) ) ( not ( = ?auto_146918 ?auto_146923 ) ) ( not ( = ?auto_146918 ?auto_146917 ) ) ( not ( = ?auto_146920 ?auto_146921 ) ) ( not ( = ?auto_146920 ?auto_146923 ) ) ( not ( = ?auto_146920 ?auto_146917 ) ) ( not ( = ?auto_146921 ?auto_146923 ) ) ( not ( = ?auto_146921 ?auto_146917 ) ) ( ON ?auto_146917 ?auto_146919 ) ( not ( = ?auto_146917 ?auto_146919 ) ) ( not ( = ?auto_146923 ?auto_146919 ) ) ( not ( = ?auto_146922 ?auto_146919 ) ) ( not ( = ?auto_146925 ?auto_146919 ) ) ( not ( = ?auto_146924 ?auto_146919 ) ) ( not ( = ?auto_146918 ?auto_146919 ) ) ( not ( = ?auto_146920 ?auto_146919 ) ) ( not ( = ?auto_146921 ?auto_146919 ) ) ( ON ?auto_146923 ?auto_146917 ) ( ON-TABLE ?auto_146919 ) ( ON ?auto_146921 ?auto_146923 ) ( ON ?auto_146920 ?auto_146921 ) ( ON ?auto_146918 ?auto_146920 ) ( ON ?auto_146924 ?auto_146918 ) ( CLEAR ?auto_146924 ) ( HOLDING ?auto_146925 ) ( CLEAR ?auto_146922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_146922 ?auto_146925 )
      ( MAKE-1PILE ?auto_146917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146926 - BLOCK
    )
    :vars
    (
      ?auto_146931 - BLOCK
      ?auto_146930 - BLOCK
      ?auto_146933 - BLOCK
      ?auto_146929 - BLOCK
      ?auto_146927 - BLOCK
      ?auto_146932 - BLOCK
      ?auto_146934 - BLOCK
      ?auto_146928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146926 ?auto_146931 ) ) ( ON-TABLE ?auto_146930 ) ( not ( = ?auto_146930 ?auto_146933 ) ) ( not ( = ?auto_146930 ?auto_146929 ) ) ( not ( = ?auto_146930 ?auto_146927 ) ) ( not ( = ?auto_146930 ?auto_146932 ) ) ( not ( = ?auto_146930 ?auto_146934 ) ) ( not ( = ?auto_146930 ?auto_146931 ) ) ( not ( = ?auto_146930 ?auto_146926 ) ) ( not ( = ?auto_146933 ?auto_146929 ) ) ( not ( = ?auto_146933 ?auto_146927 ) ) ( not ( = ?auto_146933 ?auto_146932 ) ) ( not ( = ?auto_146933 ?auto_146934 ) ) ( not ( = ?auto_146933 ?auto_146931 ) ) ( not ( = ?auto_146933 ?auto_146926 ) ) ( not ( = ?auto_146929 ?auto_146927 ) ) ( not ( = ?auto_146929 ?auto_146932 ) ) ( not ( = ?auto_146929 ?auto_146934 ) ) ( not ( = ?auto_146929 ?auto_146931 ) ) ( not ( = ?auto_146929 ?auto_146926 ) ) ( not ( = ?auto_146927 ?auto_146932 ) ) ( not ( = ?auto_146927 ?auto_146934 ) ) ( not ( = ?auto_146927 ?auto_146931 ) ) ( not ( = ?auto_146927 ?auto_146926 ) ) ( not ( = ?auto_146932 ?auto_146934 ) ) ( not ( = ?auto_146932 ?auto_146931 ) ) ( not ( = ?auto_146932 ?auto_146926 ) ) ( not ( = ?auto_146934 ?auto_146931 ) ) ( not ( = ?auto_146934 ?auto_146926 ) ) ( ON ?auto_146926 ?auto_146928 ) ( not ( = ?auto_146926 ?auto_146928 ) ) ( not ( = ?auto_146931 ?auto_146928 ) ) ( not ( = ?auto_146930 ?auto_146928 ) ) ( not ( = ?auto_146933 ?auto_146928 ) ) ( not ( = ?auto_146929 ?auto_146928 ) ) ( not ( = ?auto_146927 ?auto_146928 ) ) ( not ( = ?auto_146932 ?auto_146928 ) ) ( not ( = ?auto_146934 ?auto_146928 ) ) ( ON ?auto_146931 ?auto_146926 ) ( ON-TABLE ?auto_146928 ) ( ON ?auto_146934 ?auto_146931 ) ( ON ?auto_146932 ?auto_146934 ) ( ON ?auto_146927 ?auto_146932 ) ( ON ?auto_146929 ?auto_146927 ) ( CLEAR ?auto_146930 ) ( ON ?auto_146933 ?auto_146929 ) ( CLEAR ?auto_146933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146928 ?auto_146926 ?auto_146931 ?auto_146934 ?auto_146932 ?auto_146927 ?auto_146929 )
      ( MAKE-1PILE ?auto_146926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146935 - BLOCK
    )
    :vars
    (
      ?auto_146938 - BLOCK
      ?auto_146942 - BLOCK
      ?auto_146941 - BLOCK
      ?auto_146940 - BLOCK
      ?auto_146939 - BLOCK
      ?auto_146936 - BLOCK
      ?auto_146943 - BLOCK
      ?auto_146937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146935 ?auto_146938 ) ) ( not ( = ?auto_146942 ?auto_146941 ) ) ( not ( = ?auto_146942 ?auto_146940 ) ) ( not ( = ?auto_146942 ?auto_146939 ) ) ( not ( = ?auto_146942 ?auto_146936 ) ) ( not ( = ?auto_146942 ?auto_146943 ) ) ( not ( = ?auto_146942 ?auto_146938 ) ) ( not ( = ?auto_146942 ?auto_146935 ) ) ( not ( = ?auto_146941 ?auto_146940 ) ) ( not ( = ?auto_146941 ?auto_146939 ) ) ( not ( = ?auto_146941 ?auto_146936 ) ) ( not ( = ?auto_146941 ?auto_146943 ) ) ( not ( = ?auto_146941 ?auto_146938 ) ) ( not ( = ?auto_146941 ?auto_146935 ) ) ( not ( = ?auto_146940 ?auto_146939 ) ) ( not ( = ?auto_146940 ?auto_146936 ) ) ( not ( = ?auto_146940 ?auto_146943 ) ) ( not ( = ?auto_146940 ?auto_146938 ) ) ( not ( = ?auto_146940 ?auto_146935 ) ) ( not ( = ?auto_146939 ?auto_146936 ) ) ( not ( = ?auto_146939 ?auto_146943 ) ) ( not ( = ?auto_146939 ?auto_146938 ) ) ( not ( = ?auto_146939 ?auto_146935 ) ) ( not ( = ?auto_146936 ?auto_146943 ) ) ( not ( = ?auto_146936 ?auto_146938 ) ) ( not ( = ?auto_146936 ?auto_146935 ) ) ( not ( = ?auto_146943 ?auto_146938 ) ) ( not ( = ?auto_146943 ?auto_146935 ) ) ( ON ?auto_146935 ?auto_146937 ) ( not ( = ?auto_146935 ?auto_146937 ) ) ( not ( = ?auto_146938 ?auto_146937 ) ) ( not ( = ?auto_146942 ?auto_146937 ) ) ( not ( = ?auto_146941 ?auto_146937 ) ) ( not ( = ?auto_146940 ?auto_146937 ) ) ( not ( = ?auto_146939 ?auto_146937 ) ) ( not ( = ?auto_146936 ?auto_146937 ) ) ( not ( = ?auto_146943 ?auto_146937 ) ) ( ON ?auto_146938 ?auto_146935 ) ( ON-TABLE ?auto_146937 ) ( ON ?auto_146943 ?auto_146938 ) ( ON ?auto_146936 ?auto_146943 ) ( ON ?auto_146939 ?auto_146936 ) ( ON ?auto_146940 ?auto_146939 ) ( ON ?auto_146941 ?auto_146940 ) ( CLEAR ?auto_146941 ) ( HOLDING ?auto_146942 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_146942 )
      ( MAKE-1PILE ?auto_146935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_146944 - BLOCK
    )
    :vars
    (
      ?auto_146952 - BLOCK
      ?auto_146949 - BLOCK
      ?auto_146945 - BLOCK
      ?auto_146948 - BLOCK
      ?auto_146946 - BLOCK
      ?auto_146950 - BLOCK
      ?auto_146947 - BLOCK
      ?auto_146951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_146944 ?auto_146952 ) ) ( not ( = ?auto_146949 ?auto_146945 ) ) ( not ( = ?auto_146949 ?auto_146948 ) ) ( not ( = ?auto_146949 ?auto_146946 ) ) ( not ( = ?auto_146949 ?auto_146950 ) ) ( not ( = ?auto_146949 ?auto_146947 ) ) ( not ( = ?auto_146949 ?auto_146952 ) ) ( not ( = ?auto_146949 ?auto_146944 ) ) ( not ( = ?auto_146945 ?auto_146948 ) ) ( not ( = ?auto_146945 ?auto_146946 ) ) ( not ( = ?auto_146945 ?auto_146950 ) ) ( not ( = ?auto_146945 ?auto_146947 ) ) ( not ( = ?auto_146945 ?auto_146952 ) ) ( not ( = ?auto_146945 ?auto_146944 ) ) ( not ( = ?auto_146948 ?auto_146946 ) ) ( not ( = ?auto_146948 ?auto_146950 ) ) ( not ( = ?auto_146948 ?auto_146947 ) ) ( not ( = ?auto_146948 ?auto_146952 ) ) ( not ( = ?auto_146948 ?auto_146944 ) ) ( not ( = ?auto_146946 ?auto_146950 ) ) ( not ( = ?auto_146946 ?auto_146947 ) ) ( not ( = ?auto_146946 ?auto_146952 ) ) ( not ( = ?auto_146946 ?auto_146944 ) ) ( not ( = ?auto_146950 ?auto_146947 ) ) ( not ( = ?auto_146950 ?auto_146952 ) ) ( not ( = ?auto_146950 ?auto_146944 ) ) ( not ( = ?auto_146947 ?auto_146952 ) ) ( not ( = ?auto_146947 ?auto_146944 ) ) ( ON ?auto_146944 ?auto_146951 ) ( not ( = ?auto_146944 ?auto_146951 ) ) ( not ( = ?auto_146952 ?auto_146951 ) ) ( not ( = ?auto_146949 ?auto_146951 ) ) ( not ( = ?auto_146945 ?auto_146951 ) ) ( not ( = ?auto_146948 ?auto_146951 ) ) ( not ( = ?auto_146946 ?auto_146951 ) ) ( not ( = ?auto_146950 ?auto_146951 ) ) ( not ( = ?auto_146947 ?auto_146951 ) ) ( ON ?auto_146952 ?auto_146944 ) ( ON-TABLE ?auto_146951 ) ( ON ?auto_146947 ?auto_146952 ) ( ON ?auto_146950 ?auto_146947 ) ( ON ?auto_146946 ?auto_146950 ) ( ON ?auto_146948 ?auto_146946 ) ( ON ?auto_146945 ?auto_146948 ) ( ON ?auto_146949 ?auto_146945 ) ( CLEAR ?auto_146949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146951 ?auto_146944 ?auto_146952 ?auto_146947 ?auto_146950 ?auto_146946 ?auto_146948 ?auto_146945 )
      ( MAKE-1PILE ?auto_146944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146959 - BLOCK
      ?auto_146960 - BLOCK
      ?auto_146961 - BLOCK
      ?auto_146962 - BLOCK
      ?auto_146963 - BLOCK
      ?auto_146964 - BLOCK
    )
    :vars
    (
      ?auto_146965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146965 ?auto_146964 ) ( CLEAR ?auto_146965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_146959 ) ( ON ?auto_146960 ?auto_146959 ) ( ON ?auto_146961 ?auto_146960 ) ( ON ?auto_146962 ?auto_146961 ) ( ON ?auto_146963 ?auto_146962 ) ( ON ?auto_146964 ?auto_146963 ) ( not ( = ?auto_146959 ?auto_146960 ) ) ( not ( = ?auto_146959 ?auto_146961 ) ) ( not ( = ?auto_146959 ?auto_146962 ) ) ( not ( = ?auto_146959 ?auto_146963 ) ) ( not ( = ?auto_146959 ?auto_146964 ) ) ( not ( = ?auto_146959 ?auto_146965 ) ) ( not ( = ?auto_146960 ?auto_146961 ) ) ( not ( = ?auto_146960 ?auto_146962 ) ) ( not ( = ?auto_146960 ?auto_146963 ) ) ( not ( = ?auto_146960 ?auto_146964 ) ) ( not ( = ?auto_146960 ?auto_146965 ) ) ( not ( = ?auto_146961 ?auto_146962 ) ) ( not ( = ?auto_146961 ?auto_146963 ) ) ( not ( = ?auto_146961 ?auto_146964 ) ) ( not ( = ?auto_146961 ?auto_146965 ) ) ( not ( = ?auto_146962 ?auto_146963 ) ) ( not ( = ?auto_146962 ?auto_146964 ) ) ( not ( = ?auto_146962 ?auto_146965 ) ) ( not ( = ?auto_146963 ?auto_146964 ) ) ( not ( = ?auto_146963 ?auto_146965 ) ) ( not ( = ?auto_146964 ?auto_146965 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146965 ?auto_146964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146966 - BLOCK
      ?auto_146967 - BLOCK
      ?auto_146968 - BLOCK
      ?auto_146969 - BLOCK
      ?auto_146970 - BLOCK
      ?auto_146971 - BLOCK
    )
    :vars
    (
      ?auto_146972 - BLOCK
      ?auto_146973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146972 ?auto_146971 ) ( CLEAR ?auto_146972 ) ( ON-TABLE ?auto_146966 ) ( ON ?auto_146967 ?auto_146966 ) ( ON ?auto_146968 ?auto_146967 ) ( ON ?auto_146969 ?auto_146968 ) ( ON ?auto_146970 ?auto_146969 ) ( ON ?auto_146971 ?auto_146970 ) ( not ( = ?auto_146966 ?auto_146967 ) ) ( not ( = ?auto_146966 ?auto_146968 ) ) ( not ( = ?auto_146966 ?auto_146969 ) ) ( not ( = ?auto_146966 ?auto_146970 ) ) ( not ( = ?auto_146966 ?auto_146971 ) ) ( not ( = ?auto_146966 ?auto_146972 ) ) ( not ( = ?auto_146967 ?auto_146968 ) ) ( not ( = ?auto_146967 ?auto_146969 ) ) ( not ( = ?auto_146967 ?auto_146970 ) ) ( not ( = ?auto_146967 ?auto_146971 ) ) ( not ( = ?auto_146967 ?auto_146972 ) ) ( not ( = ?auto_146968 ?auto_146969 ) ) ( not ( = ?auto_146968 ?auto_146970 ) ) ( not ( = ?auto_146968 ?auto_146971 ) ) ( not ( = ?auto_146968 ?auto_146972 ) ) ( not ( = ?auto_146969 ?auto_146970 ) ) ( not ( = ?auto_146969 ?auto_146971 ) ) ( not ( = ?auto_146969 ?auto_146972 ) ) ( not ( = ?auto_146970 ?auto_146971 ) ) ( not ( = ?auto_146970 ?auto_146972 ) ) ( not ( = ?auto_146971 ?auto_146972 ) ) ( HOLDING ?auto_146973 ) ( not ( = ?auto_146966 ?auto_146973 ) ) ( not ( = ?auto_146967 ?auto_146973 ) ) ( not ( = ?auto_146968 ?auto_146973 ) ) ( not ( = ?auto_146969 ?auto_146973 ) ) ( not ( = ?auto_146970 ?auto_146973 ) ) ( not ( = ?auto_146971 ?auto_146973 ) ) ( not ( = ?auto_146972 ?auto_146973 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_146973 )
      ( MAKE-6PILE ?auto_146966 ?auto_146967 ?auto_146968 ?auto_146969 ?auto_146970 ?auto_146971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146974 - BLOCK
      ?auto_146975 - BLOCK
      ?auto_146976 - BLOCK
      ?auto_146977 - BLOCK
      ?auto_146978 - BLOCK
      ?auto_146979 - BLOCK
    )
    :vars
    (
      ?auto_146981 - BLOCK
      ?auto_146980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146981 ?auto_146979 ) ( ON-TABLE ?auto_146974 ) ( ON ?auto_146975 ?auto_146974 ) ( ON ?auto_146976 ?auto_146975 ) ( ON ?auto_146977 ?auto_146976 ) ( ON ?auto_146978 ?auto_146977 ) ( ON ?auto_146979 ?auto_146978 ) ( not ( = ?auto_146974 ?auto_146975 ) ) ( not ( = ?auto_146974 ?auto_146976 ) ) ( not ( = ?auto_146974 ?auto_146977 ) ) ( not ( = ?auto_146974 ?auto_146978 ) ) ( not ( = ?auto_146974 ?auto_146979 ) ) ( not ( = ?auto_146974 ?auto_146981 ) ) ( not ( = ?auto_146975 ?auto_146976 ) ) ( not ( = ?auto_146975 ?auto_146977 ) ) ( not ( = ?auto_146975 ?auto_146978 ) ) ( not ( = ?auto_146975 ?auto_146979 ) ) ( not ( = ?auto_146975 ?auto_146981 ) ) ( not ( = ?auto_146976 ?auto_146977 ) ) ( not ( = ?auto_146976 ?auto_146978 ) ) ( not ( = ?auto_146976 ?auto_146979 ) ) ( not ( = ?auto_146976 ?auto_146981 ) ) ( not ( = ?auto_146977 ?auto_146978 ) ) ( not ( = ?auto_146977 ?auto_146979 ) ) ( not ( = ?auto_146977 ?auto_146981 ) ) ( not ( = ?auto_146978 ?auto_146979 ) ) ( not ( = ?auto_146978 ?auto_146981 ) ) ( not ( = ?auto_146979 ?auto_146981 ) ) ( not ( = ?auto_146974 ?auto_146980 ) ) ( not ( = ?auto_146975 ?auto_146980 ) ) ( not ( = ?auto_146976 ?auto_146980 ) ) ( not ( = ?auto_146977 ?auto_146980 ) ) ( not ( = ?auto_146978 ?auto_146980 ) ) ( not ( = ?auto_146979 ?auto_146980 ) ) ( not ( = ?auto_146981 ?auto_146980 ) ) ( ON ?auto_146980 ?auto_146981 ) ( CLEAR ?auto_146980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_146974 ?auto_146975 ?auto_146976 ?auto_146977 ?auto_146978 ?auto_146979 ?auto_146981 )
      ( MAKE-6PILE ?auto_146974 ?auto_146975 ?auto_146976 ?auto_146977 ?auto_146978 ?auto_146979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146982 - BLOCK
      ?auto_146983 - BLOCK
      ?auto_146984 - BLOCK
      ?auto_146985 - BLOCK
      ?auto_146986 - BLOCK
      ?auto_146987 - BLOCK
    )
    :vars
    (
      ?auto_146989 - BLOCK
      ?auto_146988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146989 ?auto_146987 ) ( ON-TABLE ?auto_146982 ) ( ON ?auto_146983 ?auto_146982 ) ( ON ?auto_146984 ?auto_146983 ) ( ON ?auto_146985 ?auto_146984 ) ( ON ?auto_146986 ?auto_146985 ) ( ON ?auto_146987 ?auto_146986 ) ( not ( = ?auto_146982 ?auto_146983 ) ) ( not ( = ?auto_146982 ?auto_146984 ) ) ( not ( = ?auto_146982 ?auto_146985 ) ) ( not ( = ?auto_146982 ?auto_146986 ) ) ( not ( = ?auto_146982 ?auto_146987 ) ) ( not ( = ?auto_146982 ?auto_146989 ) ) ( not ( = ?auto_146983 ?auto_146984 ) ) ( not ( = ?auto_146983 ?auto_146985 ) ) ( not ( = ?auto_146983 ?auto_146986 ) ) ( not ( = ?auto_146983 ?auto_146987 ) ) ( not ( = ?auto_146983 ?auto_146989 ) ) ( not ( = ?auto_146984 ?auto_146985 ) ) ( not ( = ?auto_146984 ?auto_146986 ) ) ( not ( = ?auto_146984 ?auto_146987 ) ) ( not ( = ?auto_146984 ?auto_146989 ) ) ( not ( = ?auto_146985 ?auto_146986 ) ) ( not ( = ?auto_146985 ?auto_146987 ) ) ( not ( = ?auto_146985 ?auto_146989 ) ) ( not ( = ?auto_146986 ?auto_146987 ) ) ( not ( = ?auto_146986 ?auto_146989 ) ) ( not ( = ?auto_146987 ?auto_146989 ) ) ( not ( = ?auto_146982 ?auto_146988 ) ) ( not ( = ?auto_146983 ?auto_146988 ) ) ( not ( = ?auto_146984 ?auto_146988 ) ) ( not ( = ?auto_146985 ?auto_146988 ) ) ( not ( = ?auto_146986 ?auto_146988 ) ) ( not ( = ?auto_146987 ?auto_146988 ) ) ( not ( = ?auto_146989 ?auto_146988 ) ) ( HOLDING ?auto_146988 ) ( CLEAR ?auto_146989 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_146982 ?auto_146983 ?auto_146984 ?auto_146985 ?auto_146986 ?auto_146987 ?auto_146989 ?auto_146988 )
      ( MAKE-6PILE ?auto_146982 ?auto_146983 ?auto_146984 ?auto_146985 ?auto_146986 ?auto_146987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_146990 - BLOCK
      ?auto_146991 - BLOCK
      ?auto_146992 - BLOCK
      ?auto_146993 - BLOCK
      ?auto_146994 - BLOCK
      ?auto_146995 - BLOCK
    )
    :vars
    (
      ?auto_146997 - BLOCK
      ?auto_146996 - BLOCK
      ?auto_146998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_146997 ?auto_146995 ) ( ON-TABLE ?auto_146990 ) ( ON ?auto_146991 ?auto_146990 ) ( ON ?auto_146992 ?auto_146991 ) ( ON ?auto_146993 ?auto_146992 ) ( ON ?auto_146994 ?auto_146993 ) ( ON ?auto_146995 ?auto_146994 ) ( not ( = ?auto_146990 ?auto_146991 ) ) ( not ( = ?auto_146990 ?auto_146992 ) ) ( not ( = ?auto_146990 ?auto_146993 ) ) ( not ( = ?auto_146990 ?auto_146994 ) ) ( not ( = ?auto_146990 ?auto_146995 ) ) ( not ( = ?auto_146990 ?auto_146997 ) ) ( not ( = ?auto_146991 ?auto_146992 ) ) ( not ( = ?auto_146991 ?auto_146993 ) ) ( not ( = ?auto_146991 ?auto_146994 ) ) ( not ( = ?auto_146991 ?auto_146995 ) ) ( not ( = ?auto_146991 ?auto_146997 ) ) ( not ( = ?auto_146992 ?auto_146993 ) ) ( not ( = ?auto_146992 ?auto_146994 ) ) ( not ( = ?auto_146992 ?auto_146995 ) ) ( not ( = ?auto_146992 ?auto_146997 ) ) ( not ( = ?auto_146993 ?auto_146994 ) ) ( not ( = ?auto_146993 ?auto_146995 ) ) ( not ( = ?auto_146993 ?auto_146997 ) ) ( not ( = ?auto_146994 ?auto_146995 ) ) ( not ( = ?auto_146994 ?auto_146997 ) ) ( not ( = ?auto_146995 ?auto_146997 ) ) ( not ( = ?auto_146990 ?auto_146996 ) ) ( not ( = ?auto_146991 ?auto_146996 ) ) ( not ( = ?auto_146992 ?auto_146996 ) ) ( not ( = ?auto_146993 ?auto_146996 ) ) ( not ( = ?auto_146994 ?auto_146996 ) ) ( not ( = ?auto_146995 ?auto_146996 ) ) ( not ( = ?auto_146997 ?auto_146996 ) ) ( CLEAR ?auto_146997 ) ( ON ?auto_146996 ?auto_146998 ) ( CLEAR ?auto_146996 ) ( HAND-EMPTY ) ( not ( = ?auto_146990 ?auto_146998 ) ) ( not ( = ?auto_146991 ?auto_146998 ) ) ( not ( = ?auto_146992 ?auto_146998 ) ) ( not ( = ?auto_146993 ?auto_146998 ) ) ( not ( = ?auto_146994 ?auto_146998 ) ) ( not ( = ?auto_146995 ?auto_146998 ) ) ( not ( = ?auto_146997 ?auto_146998 ) ) ( not ( = ?auto_146996 ?auto_146998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_146996 ?auto_146998 )
      ( MAKE-6PILE ?auto_146990 ?auto_146991 ?auto_146992 ?auto_146993 ?auto_146994 ?auto_146995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147017 - BLOCK
      ?auto_147018 - BLOCK
      ?auto_147019 - BLOCK
      ?auto_147020 - BLOCK
      ?auto_147021 - BLOCK
      ?auto_147022 - BLOCK
    )
    :vars
    (
      ?auto_147024 - BLOCK
      ?auto_147025 - BLOCK
      ?auto_147023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147017 ) ( ON ?auto_147018 ?auto_147017 ) ( ON ?auto_147019 ?auto_147018 ) ( ON ?auto_147020 ?auto_147019 ) ( ON ?auto_147021 ?auto_147020 ) ( not ( = ?auto_147017 ?auto_147018 ) ) ( not ( = ?auto_147017 ?auto_147019 ) ) ( not ( = ?auto_147017 ?auto_147020 ) ) ( not ( = ?auto_147017 ?auto_147021 ) ) ( not ( = ?auto_147017 ?auto_147022 ) ) ( not ( = ?auto_147017 ?auto_147024 ) ) ( not ( = ?auto_147018 ?auto_147019 ) ) ( not ( = ?auto_147018 ?auto_147020 ) ) ( not ( = ?auto_147018 ?auto_147021 ) ) ( not ( = ?auto_147018 ?auto_147022 ) ) ( not ( = ?auto_147018 ?auto_147024 ) ) ( not ( = ?auto_147019 ?auto_147020 ) ) ( not ( = ?auto_147019 ?auto_147021 ) ) ( not ( = ?auto_147019 ?auto_147022 ) ) ( not ( = ?auto_147019 ?auto_147024 ) ) ( not ( = ?auto_147020 ?auto_147021 ) ) ( not ( = ?auto_147020 ?auto_147022 ) ) ( not ( = ?auto_147020 ?auto_147024 ) ) ( not ( = ?auto_147021 ?auto_147022 ) ) ( not ( = ?auto_147021 ?auto_147024 ) ) ( not ( = ?auto_147022 ?auto_147024 ) ) ( not ( = ?auto_147017 ?auto_147025 ) ) ( not ( = ?auto_147018 ?auto_147025 ) ) ( not ( = ?auto_147019 ?auto_147025 ) ) ( not ( = ?auto_147020 ?auto_147025 ) ) ( not ( = ?auto_147021 ?auto_147025 ) ) ( not ( = ?auto_147022 ?auto_147025 ) ) ( not ( = ?auto_147024 ?auto_147025 ) ) ( ON ?auto_147025 ?auto_147023 ) ( not ( = ?auto_147017 ?auto_147023 ) ) ( not ( = ?auto_147018 ?auto_147023 ) ) ( not ( = ?auto_147019 ?auto_147023 ) ) ( not ( = ?auto_147020 ?auto_147023 ) ) ( not ( = ?auto_147021 ?auto_147023 ) ) ( not ( = ?auto_147022 ?auto_147023 ) ) ( not ( = ?auto_147024 ?auto_147023 ) ) ( not ( = ?auto_147025 ?auto_147023 ) ) ( ON ?auto_147024 ?auto_147025 ) ( CLEAR ?auto_147024 ) ( HOLDING ?auto_147022 ) ( CLEAR ?auto_147021 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147017 ?auto_147018 ?auto_147019 ?auto_147020 ?auto_147021 ?auto_147022 ?auto_147024 )
      ( MAKE-6PILE ?auto_147017 ?auto_147018 ?auto_147019 ?auto_147020 ?auto_147021 ?auto_147022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147026 - BLOCK
      ?auto_147027 - BLOCK
      ?auto_147028 - BLOCK
      ?auto_147029 - BLOCK
      ?auto_147030 - BLOCK
      ?auto_147031 - BLOCK
    )
    :vars
    (
      ?auto_147033 - BLOCK
      ?auto_147032 - BLOCK
      ?auto_147034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147026 ) ( ON ?auto_147027 ?auto_147026 ) ( ON ?auto_147028 ?auto_147027 ) ( ON ?auto_147029 ?auto_147028 ) ( ON ?auto_147030 ?auto_147029 ) ( not ( = ?auto_147026 ?auto_147027 ) ) ( not ( = ?auto_147026 ?auto_147028 ) ) ( not ( = ?auto_147026 ?auto_147029 ) ) ( not ( = ?auto_147026 ?auto_147030 ) ) ( not ( = ?auto_147026 ?auto_147031 ) ) ( not ( = ?auto_147026 ?auto_147033 ) ) ( not ( = ?auto_147027 ?auto_147028 ) ) ( not ( = ?auto_147027 ?auto_147029 ) ) ( not ( = ?auto_147027 ?auto_147030 ) ) ( not ( = ?auto_147027 ?auto_147031 ) ) ( not ( = ?auto_147027 ?auto_147033 ) ) ( not ( = ?auto_147028 ?auto_147029 ) ) ( not ( = ?auto_147028 ?auto_147030 ) ) ( not ( = ?auto_147028 ?auto_147031 ) ) ( not ( = ?auto_147028 ?auto_147033 ) ) ( not ( = ?auto_147029 ?auto_147030 ) ) ( not ( = ?auto_147029 ?auto_147031 ) ) ( not ( = ?auto_147029 ?auto_147033 ) ) ( not ( = ?auto_147030 ?auto_147031 ) ) ( not ( = ?auto_147030 ?auto_147033 ) ) ( not ( = ?auto_147031 ?auto_147033 ) ) ( not ( = ?auto_147026 ?auto_147032 ) ) ( not ( = ?auto_147027 ?auto_147032 ) ) ( not ( = ?auto_147028 ?auto_147032 ) ) ( not ( = ?auto_147029 ?auto_147032 ) ) ( not ( = ?auto_147030 ?auto_147032 ) ) ( not ( = ?auto_147031 ?auto_147032 ) ) ( not ( = ?auto_147033 ?auto_147032 ) ) ( ON ?auto_147032 ?auto_147034 ) ( not ( = ?auto_147026 ?auto_147034 ) ) ( not ( = ?auto_147027 ?auto_147034 ) ) ( not ( = ?auto_147028 ?auto_147034 ) ) ( not ( = ?auto_147029 ?auto_147034 ) ) ( not ( = ?auto_147030 ?auto_147034 ) ) ( not ( = ?auto_147031 ?auto_147034 ) ) ( not ( = ?auto_147033 ?auto_147034 ) ) ( not ( = ?auto_147032 ?auto_147034 ) ) ( ON ?auto_147033 ?auto_147032 ) ( CLEAR ?auto_147030 ) ( ON ?auto_147031 ?auto_147033 ) ( CLEAR ?auto_147031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147034 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147034 ?auto_147032 ?auto_147033 )
      ( MAKE-6PILE ?auto_147026 ?auto_147027 ?auto_147028 ?auto_147029 ?auto_147030 ?auto_147031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147035 - BLOCK
      ?auto_147036 - BLOCK
      ?auto_147037 - BLOCK
      ?auto_147038 - BLOCK
      ?auto_147039 - BLOCK
      ?auto_147040 - BLOCK
    )
    :vars
    (
      ?auto_147042 - BLOCK
      ?auto_147043 - BLOCK
      ?auto_147041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147035 ) ( ON ?auto_147036 ?auto_147035 ) ( ON ?auto_147037 ?auto_147036 ) ( ON ?auto_147038 ?auto_147037 ) ( not ( = ?auto_147035 ?auto_147036 ) ) ( not ( = ?auto_147035 ?auto_147037 ) ) ( not ( = ?auto_147035 ?auto_147038 ) ) ( not ( = ?auto_147035 ?auto_147039 ) ) ( not ( = ?auto_147035 ?auto_147040 ) ) ( not ( = ?auto_147035 ?auto_147042 ) ) ( not ( = ?auto_147036 ?auto_147037 ) ) ( not ( = ?auto_147036 ?auto_147038 ) ) ( not ( = ?auto_147036 ?auto_147039 ) ) ( not ( = ?auto_147036 ?auto_147040 ) ) ( not ( = ?auto_147036 ?auto_147042 ) ) ( not ( = ?auto_147037 ?auto_147038 ) ) ( not ( = ?auto_147037 ?auto_147039 ) ) ( not ( = ?auto_147037 ?auto_147040 ) ) ( not ( = ?auto_147037 ?auto_147042 ) ) ( not ( = ?auto_147038 ?auto_147039 ) ) ( not ( = ?auto_147038 ?auto_147040 ) ) ( not ( = ?auto_147038 ?auto_147042 ) ) ( not ( = ?auto_147039 ?auto_147040 ) ) ( not ( = ?auto_147039 ?auto_147042 ) ) ( not ( = ?auto_147040 ?auto_147042 ) ) ( not ( = ?auto_147035 ?auto_147043 ) ) ( not ( = ?auto_147036 ?auto_147043 ) ) ( not ( = ?auto_147037 ?auto_147043 ) ) ( not ( = ?auto_147038 ?auto_147043 ) ) ( not ( = ?auto_147039 ?auto_147043 ) ) ( not ( = ?auto_147040 ?auto_147043 ) ) ( not ( = ?auto_147042 ?auto_147043 ) ) ( ON ?auto_147043 ?auto_147041 ) ( not ( = ?auto_147035 ?auto_147041 ) ) ( not ( = ?auto_147036 ?auto_147041 ) ) ( not ( = ?auto_147037 ?auto_147041 ) ) ( not ( = ?auto_147038 ?auto_147041 ) ) ( not ( = ?auto_147039 ?auto_147041 ) ) ( not ( = ?auto_147040 ?auto_147041 ) ) ( not ( = ?auto_147042 ?auto_147041 ) ) ( not ( = ?auto_147043 ?auto_147041 ) ) ( ON ?auto_147042 ?auto_147043 ) ( ON ?auto_147040 ?auto_147042 ) ( CLEAR ?auto_147040 ) ( ON-TABLE ?auto_147041 ) ( HOLDING ?auto_147039 ) ( CLEAR ?auto_147038 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147035 ?auto_147036 ?auto_147037 ?auto_147038 ?auto_147039 )
      ( MAKE-6PILE ?auto_147035 ?auto_147036 ?auto_147037 ?auto_147038 ?auto_147039 ?auto_147040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147044 - BLOCK
      ?auto_147045 - BLOCK
      ?auto_147046 - BLOCK
      ?auto_147047 - BLOCK
      ?auto_147048 - BLOCK
      ?auto_147049 - BLOCK
    )
    :vars
    (
      ?auto_147050 - BLOCK
      ?auto_147051 - BLOCK
      ?auto_147052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147044 ) ( ON ?auto_147045 ?auto_147044 ) ( ON ?auto_147046 ?auto_147045 ) ( ON ?auto_147047 ?auto_147046 ) ( not ( = ?auto_147044 ?auto_147045 ) ) ( not ( = ?auto_147044 ?auto_147046 ) ) ( not ( = ?auto_147044 ?auto_147047 ) ) ( not ( = ?auto_147044 ?auto_147048 ) ) ( not ( = ?auto_147044 ?auto_147049 ) ) ( not ( = ?auto_147044 ?auto_147050 ) ) ( not ( = ?auto_147045 ?auto_147046 ) ) ( not ( = ?auto_147045 ?auto_147047 ) ) ( not ( = ?auto_147045 ?auto_147048 ) ) ( not ( = ?auto_147045 ?auto_147049 ) ) ( not ( = ?auto_147045 ?auto_147050 ) ) ( not ( = ?auto_147046 ?auto_147047 ) ) ( not ( = ?auto_147046 ?auto_147048 ) ) ( not ( = ?auto_147046 ?auto_147049 ) ) ( not ( = ?auto_147046 ?auto_147050 ) ) ( not ( = ?auto_147047 ?auto_147048 ) ) ( not ( = ?auto_147047 ?auto_147049 ) ) ( not ( = ?auto_147047 ?auto_147050 ) ) ( not ( = ?auto_147048 ?auto_147049 ) ) ( not ( = ?auto_147048 ?auto_147050 ) ) ( not ( = ?auto_147049 ?auto_147050 ) ) ( not ( = ?auto_147044 ?auto_147051 ) ) ( not ( = ?auto_147045 ?auto_147051 ) ) ( not ( = ?auto_147046 ?auto_147051 ) ) ( not ( = ?auto_147047 ?auto_147051 ) ) ( not ( = ?auto_147048 ?auto_147051 ) ) ( not ( = ?auto_147049 ?auto_147051 ) ) ( not ( = ?auto_147050 ?auto_147051 ) ) ( ON ?auto_147051 ?auto_147052 ) ( not ( = ?auto_147044 ?auto_147052 ) ) ( not ( = ?auto_147045 ?auto_147052 ) ) ( not ( = ?auto_147046 ?auto_147052 ) ) ( not ( = ?auto_147047 ?auto_147052 ) ) ( not ( = ?auto_147048 ?auto_147052 ) ) ( not ( = ?auto_147049 ?auto_147052 ) ) ( not ( = ?auto_147050 ?auto_147052 ) ) ( not ( = ?auto_147051 ?auto_147052 ) ) ( ON ?auto_147050 ?auto_147051 ) ( ON ?auto_147049 ?auto_147050 ) ( ON-TABLE ?auto_147052 ) ( CLEAR ?auto_147047 ) ( ON ?auto_147048 ?auto_147049 ) ( CLEAR ?auto_147048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147052 ?auto_147051 ?auto_147050 ?auto_147049 )
      ( MAKE-6PILE ?auto_147044 ?auto_147045 ?auto_147046 ?auto_147047 ?auto_147048 ?auto_147049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147053 - BLOCK
      ?auto_147054 - BLOCK
      ?auto_147055 - BLOCK
      ?auto_147056 - BLOCK
      ?auto_147057 - BLOCK
      ?auto_147058 - BLOCK
    )
    :vars
    (
      ?auto_147061 - BLOCK
      ?auto_147059 - BLOCK
      ?auto_147060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147053 ) ( ON ?auto_147054 ?auto_147053 ) ( ON ?auto_147055 ?auto_147054 ) ( not ( = ?auto_147053 ?auto_147054 ) ) ( not ( = ?auto_147053 ?auto_147055 ) ) ( not ( = ?auto_147053 ?auto_147056 ) ) ( not ( = ?auto_147053 ?auto_147057 ) ) ( not ( = ?auto_147053 ?auto_147058 ) ) ( not ( = ?auto_147053 ?auto_147061 ) ) ( not ( = ?auto_147054 ?auto_147055 ) ) ( not ( = ?auto_147054 ?auto_147056 ) ) ( not ( = ?auto_147054 ?auto_147057 ) ) ( not ( = ?auto_147054 ?auto_147058 ) ) ( not ( = ?auto_147054 ?auto_147061 ) ) ( not ( = ?auto_147055 ?auto_147056 ) ) ( not ( = ?auto_147055 ?auto_147057 ) ) ( not ( = ?auto_147055 ?auto_147058 ) ) ( not ( = ?auto_147055 ?auto_147061 ) ) ( not ( = ?auto_147056 ?auto_147057 ) ) ( not ( = ?auto_147056 ?auto_147058 ) ) ( not ( = ?auto_147056 ?auto_147061 ) ) ( not ( = ?auto_147057 ?auto_147058 ) ) ( not ( = ?auto_147057 ?auto_147061 ) ) ( not ( = ?auto_147058 ?auto_147061 ) ) ( not ( = ?auto_147053 ?auto_147059 ) ) ( not ( = ?auto_147054 ?auto_147059 ) ) ( not ( = ?auto_147055 ?auto_147059 ) ) ( not ( = ?auto_147056 ?auto_147059 ) ) ( not ( = ?auto_147057 ?auto_147059 ) ) ( not ( = ?auto_147058 ?auto_147059 ) ) ( not ( = ?auto_147061 ?auto_147059 ) ) ( ON ?auto_147059 ?auto_147060 ) ( not ( = ?auto_147053 ?auto_147060 ) ) ( not ( = ?auto_147054 ?auto_147060 ) ) ( not ( = ?auto_147055 ?auto_147060 ) ) ( not ( = ?auto_147056 ?auto_147060 ) ) ( not ( = ?auto_147057 ?auto_147060 ) ) ( not ( = ?auto_147058 ?auto_147060 ) ) ( not ( = ?auto_147061 ?auto_147060 ) ) ( not ( = ?auto_147059 ?auto_147060 ) ) ( ON ?auto_147061 ?auto_147059 ) ( ON ?auto_147058 ?auto_147061 ) ( ON-TABLE ?auto_147060 ) ( ON ?auto_147057 ?auto_147058 ) ( CLEAR ?auto_147057 ) ( HOLDING ?auto_147056 ) ( CLEAR ?auto_147055 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147053 ?auto_147054 ?auto_147055 ?auto_147056 )
      ( MAKE-6PILE ?auto_147053 ?auto_147054 ?auto_147055 ?auto_147056 ?auto_147057 ?auto_147058 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147062 - BLOCK
      ?auto_147063 - BLOCK
      ?auto_147064 - BLOCK
      ?auto_147065 - BLOCK
      ?auto_147066 - BLOCK
      ?auto_147067 - BLOCK
    )
    :vars
    (
      ?auto_147068 - BLOCK
      ?auto_147069 - BLOCK
      ?auto_147070 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147062 ) ( ON ?auto_147063 ?auto_147062 ) ( ON ?auto_147064 ?auto_147063 ) ( not ( = ?auto_147062 ?auto_147063 ) ) ( not ( = ?auto_147062 ?auto_147064 ) ) ( not ( = ?auto_147062 ?auto_147065 ) ) ( not ( = ?auto_147062 ?auto_147066 ) ) ( not ( = ?auto_147062 ?auto_147067 ) ) ( not ( = ?auto_147062 ?auto_147068 ) ) ( not ( = ?auto_147063 ?auto_147064 ) ) ( not ( = ?auto_147063 ?auto_147065 ) ) ( not ( = ?auto_147063 ?auto_147066 ) ) ( not ( = ?auto_147063 ?auto_147067 ) ) ( not ( = ?auto_147063 ?auto_147068 ) ) ( not ( = ?auto_147064 ?auto_147065 ) ) ( not ( = ?auto_147064 ?auto_147066 ) ) ( not ( = ?auto_147064 ?auto_147067 ) ) ( not ( = ?auto_147064 ?auto_147068 ) ) ( not ( = ?auto_147065 ?auto_147066 ) ) ( not ( = ?auto_147065 ?auto_147067 ) ) ( not ( = ?auto_147065 ?auto_147068 ) ) ( not ( = ?auto_147066 ?auto_147067 ) ) ( not ( = ?auto_147066 ?auto_147068 ) ) ( not ( = ?auto_147067 ?auto_147068 ) ) ( not ( = ?auto_147062 ?auto_147069 ) ) ( not ( = ?auto_147063 ?auto_147069 ) ) ( not ( = ?auto_147064 ?auto_147069 ) ) ( not ( = ?auto_147065 ?auto_147069 ) ) ( not ( = ?auto_147066 ?auto_147069 ) ) ( not ( = ?auto_147067 ?auto_147069 ) ) ( not ( = ?auto_147068 ?auto_147069 ) ) ( ON ?auto_147069 ?auto_147070 ) ( not ( = ?auto_147062 ?auto_147070 ) ) ( not ( = ?auto_147063 ?auto_147070 ) ) ( not ( = ?auto_147064 ?auto_147070 ) ) ( not ( = ?auto_147065 ?auto_147070 ) ) ( not ( = ?auto_147066 ?auto_147070 ) ) ( not ( = ?auto_147067 ?auto_147070 ) ) ( not ( = ?auto_147068 ?auto_147070 ) ) ( not ( = ?auto_147069 ?auto_147070 ) ) ( ON ?auto_147068 ?auto_147069 ) ( ON ?auto_147067 ?auto_147068 ) ( ON-TABLE ?auto_147070 ) ( ON ?auto_147066 ?auto_147067 ) ( CLEAR ?auto_147064 ) ( ON ?auto_147065 ?auto_147066 ) ( CLEAR ?auto_147065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147070 ?auto_147069 ?auto_147068 ?auto_147067 ?auto_147066 )
      ( MAKE-6PILE ?auto_147062 ?auto_147063 ?auto_147064 ?auto_147065 ?auto_147066 ?auto_147067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147071 - BLOCK
      ?auto_147072 - BLOCK
      ?auto_147073 - BLOCK
      ?auto_147074 - BLOCK
      ?auto_147075 - BLOCK
      ?auto_147076 - BLOCK
    )
    :vars
    (
      ?auto_147078 - BLOCK
      ?auto_147077 - BLOCK
      ?auto_147079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147071 ) ( ON ?auto_147072 ?auto_147071 ) ( not ( = ?auto_147071 ?auto_147072 ) ) ( not ( = ?auto_147071 ?auto_147073 ) ) ( not ( = ?auto_147071 ?auto_147074 ) ) ( not ( = ?auto_147071 ?auto_147075 ) ) ( not ( = ?auto_147071 ?auto_147076 ) ) ( not ( = ?auto_147071 ?auto_147078 ) ) ( not ( = ?auto_147072 ?auto_147073 ) ) ( not ( = ?auto_147072 ?auto_147074 ) ) ( not ( = ?auto_147072 ?auto_147075 ) ) ( not ( = ?auto_147072 ?auto_147076 ) ) ( not ( = ?auto_147072 ?auto_147078 ) ) ( not ( = ?auto_147073 ?auto_147074 ) ) ( not ( = ?auto_147073 ?auto_147075 ) ) ( not ( = ?auto_147073 ?auto_147076 ) ) ( not ( = ?auto_147073 ?auto_147078 ) ) ( not ( = ?auto_147074 ?auto_147075 ) ) ( not ( = ?auto_147074 ?auto_147076 ) ) ( not ( = ?auto_147074 ?auto_147078 ) ) ( not ( = ?auto_147075 ?auto_147076 ) ) ( not ( = ?auto_147075 ?auto_147078 ) ) ( not ( = ?auto_147076 ?auto_147078 ) ) ( not ( = ?auto_147071 ?auto_147077 ) ) ( not ( = ?auto_147072 ?auto_147077 ) ) ( not ( = ?auto_147073 ?auto_147077 ) ) ( not ( = ?auto_147074 ?auto_147077 ) ) ( not ( = ?auto_147075 ?auto_147077 ) ) ( not ( = ?auto_147076 ?auto_147077 ) ) ( not ( = ?auto_147078 ?auto_147077 ) ) ( ON ?auto_147077 ?auto_147079 ) ( not ( = ?auto_147071 ?auto_147079 ) ) ( not ( = ?auto_147072 ?auto_147079 ) ) ( not ( = ?auto_147073 ?auto_147079 ) ) ( not ( = ?auto_147074 ?auto_147079 ) ) ( not ( = ?auto_147075 ?auto_147079 ) ) ( not ( = ?auto_147076 ?auto_147079 ) ) ( not ( = ?auto_147078 ?auto_147079 ) ) ( not ( = ?auto_147077 ?auto_147079 ) ) ( ON ?auto_147078 ?auto_147077 ) ( ON ?auto_147076 ?auto_147078 ) ( ON-TABLE ?auto_147079 ) ( ON ?auto_147075 ?auto_147076 ) ( ON ?auto_147074 ?auto_147075 ) ( CLEAR ?auto_147074 ) ( HOLDING ?auto_147073 ) ( CLEAR ?auto_147072 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147071 ?auto_147072 ?auto_147073 )
      ( MAKE-6PILE ?auto_147071 ?auto_147072 ?auto_147073 ?auto_147074 ?auto_147075 ?auto_147076 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147080 - BLOCK
      ?auto_147081 - BLOCK
      ?auto_147082 - BLOCK
      ?auto_147083 - BLOCK
      ?auto_147084 - BLOCK
      ?auto_147085 - BLOCK
    )
    :vars
    (
      ?auto_147087 - BLOCK
      ?auto_147088 - BLOCK
      ?auto_147086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147080 ) ( ON ?auto_147081 ?auto_147080 ) ( not ( = ?auto_147080 ?auto_147081 ) ) ( not ( = ?auto_147080 ?auto_147082 ) ) ( not ( = ?auto_147080 ?auto_147083 ) ) ( not ( = ?auto_147080 ?auto_147084 ) ) ( not ( = ?auto_147080 ?auto_147085 ) ) ( not ( = ?auto_147080 ?auto_147087 ) ) ( not ( = ?auto_147081 ?auto_147082 ) ) ( not ( = ?auto_147081 ?auto_147083 ) ) ( not ( = ?auto_147081 ?auto_147084 ) ) ( not ( = ?auto_147081 ?auto_147085 ) ) ( not ( = ?auto_147081 ?auto_147087 ) ) ( not ( = ?auto_147082 ?auto_147083 ) ) ( not ( = ?auto_147082 ?auto_147084 ) ) ( not ( = ?auto_147082 ?auto_147085 ) ) ( not ( = ?auto_147082 ?auto_147087 ) ) ( not ( = ?auto_147083 ?auto_147084 ) ) ( not ( = ?auto_147083 ?auto_147085 ) ) ( not ( = ?auto_147083 ?auto_147087 ) ) ( not ( = ?auto_147084 ?auto_147085 ) ) ( not ( = ?auto_147084 ?auto_147087 ) ) ( not ( = ?auto_147085 ?auto_147087 ) ) ( not ( = ?auto_147080 ?auto_147088 ) ) ( not ( = ?auto_147081 ?auto_147088 ) ) ( not ( = ?auto_147082 ?auto_147088 ) ) ( not ( = ?auto_147083 ?auto_147088 ) ) ( not ( = ?auto_147084 ?auto_147088 ) ) ( not ( = ?auto_147085 ?auto_147088 ) ) ( not ( = ?auto_147087 ?auto_147088 ) ) ( ON ?auto_147088 ?auto_147086 ) ( not ( = ?auto_147080 ?auto_147086 ) ) ( not ( = ?auto_147081 ?auto_147086 ) ) ( not ( = ?auto_147082 ?auto_147086 ) ) ( not ( = ?auto_147083 ?auto_147086 ) ) ( not ( = ?auto_147084 ?auto_147086 ) ) ( not ( = ?auto_147085 ?auto_147086 ) ) ( not ( = ?auto_147087 ?auto_147086 ) ) ( not ( = ?auto_147088 ?auto_147086 ) ) ( ON ?auto_147087 ?auto_147088 ) ( ON ?auto_147085 ?auto_147087 ) ( ON-TABLE ?auto_147086 ) ( ON ?auto_147084 ?auto_147085 ) ( ON ?auto_147083 ?auto_147084 ) ( CLEAR ?auto_147081 ) ( ON ?auto_147082 ?auto_147083 ) ( CLEAR ?auto_147082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147086 ?auto_147088 ?auto_147087 ?auto_147085 ?auto_147084 ?auto_147083 )
      ( MAKE-6PILE ?auto_147080 ?auto_147081 ?auto_147082 ?auto_147083 ?auto_147084 ?auto_147085 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147089 - BLOCK
      ?auto_147090 - BLOCK
      ?auto_147091 - BLOCK
      ?auto_147092 - BLOCK
      ?auto_147093 - BLOCK
      ?auto_147094 - BLOCK
    )
    :vars
    (
      ?auto_147095 - BLOCK
      ?auto_147097 - BLOCK
      ?auto_147096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147089 ) ( not ( = ?auto_147089 ?auto_147090 ) ) ( not ( = ?auto_147089 ?auto_147091 ) ) ( not ( = ?auto_147089 ?auto_147092 ) ) ( not ( = ?auto_147089 ?auto_147093 ) ) ( not ( = ?auto_147089 ?auto_147094 ) ) ( not ( = ?auto_147089 ?auto_147095 ) ) ( not ( = ?auto_147090 ?auto_147091 ) ) ( not ( = ?auto_147090 ?auto_147092 ) ) ( not ( = ?auto_147090 ?auto_147093 ) ) ( not ( = ?auto_147090 ?auto_147094 ) ) ( not ( = ?auto_147090 ?auto_147095 ) ) ( not ( = ?auto_147091 ?auto_147092 ) ) ( not ( = ?auto_147091 ?auto_147093 ) ) ( not ( = ?auto_147091 ?auto_147094 ) ) ( not ( = ?auto_147091 ?auto_147095 ) ) ( not ( = ?auto_147092 ?auto_147093 ) ) ( not ( = ?auto_147092 ?auto_147094 ) ) ( not ( = ?auto_147092 ?auto_147095 ) ) ( not ( = ?auto_147093 ?auto_147094 ) ) ( not ( = ?auto_147093 ?auto_147095 ) ) ( not ( = ?auto_147094 ?auto_147095 ) ) ( not ( = ?auto_147089 ?auto_147097 ) ) ( not ( = ?auto_147090 ?auto_147097 ) ) ( not ( = ?auto_147091 ?auto_147097 ) ) ( not ( = ?auto_147092 ?auto_147097 ) ) ( not ( = ?auto_147093 ?auto_147097 ) ) ( not ( = ?auto_147094 ?auto_147097 ) ) ( not ( = ?auto_147095 ?auto_147097 ) ) ( ON ?auto_147097 ?auto_147096 ) ( not ( = ?auto_147089 ?auto_147096 ) ) ( not ( = ?auto_147090 ?auto_147096 ) ) ( not ( = ?auto_147091 ?auto_147096 ) ) ( not ( = ?auto_147092 ?auto_147096 ) ) ( not ( = ?auto_147093 ?auto_147096 ) ) ( not ( = ?auto_147094 ?auto_147096 ) ) ( not ( = ?auto_147095 ?auto_147096 ) ) ( not ( = ?auto_147097 ?auto_147096 ) ) ( ON ?auto_147095 ?auto_147097 ) ( ON ?auto_147094 ?auto_147095 ) ( ON-TABLE ?auto_147096 ) ( ON ?auto_147093 ?auto_147094 ) ( ON ?auto_147092 ?auto_147093 ) ( ON ?auto_147091 ?auto_147092 ) ( CLEAR ?auto_147091 ) ( HOLDING ?auto_147090 ) ( CLEAR ?auto_147089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147089 ?auto_147090 )
      ( MAKE-6PILE ?auto_147089 ?auto_147090 ?auto_147091 ?auto_147092 ?auto_147093 ?auto_147094 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147098 - BLOCK
      ?auto_147099 - BLOCK
      ?auto_147100 - BLOCK
      ?auto_147101 - BLOCK
      ?auto_147102 - BLOCK
      ?auto_147103 - BLOCK
    )
    :vars
    (
      ?auto_147106 - BLOCK
      ?auto_147104 - BLOCK
      ?auto_147105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147098 ) ( not ( = ?auto_147098 ?auto_147099 ) ) ( not ( = ?auto_147098 ?auto_147100 ) ) ( not ( = ?auto_147098 ?auto_147101 ) ) ( not ( = ?auto_147098 ?auto_147102 ) ) ( not ( = ?auto_147098 ?auto_147103 ) ) ( not ( = ?auto_147098 ?auto_147106 ) ) ( not ( = ?auto_147099 ?auto_147100 ) ) ( not ( = ?auto_147099 ?auto_147101 ) ) ( not ( = ?auto_147099 ?auto_147102 ) ) ( not ( = ?auto_147099 ?auto_147103 ) ) ( not ( = ?auto_147099 ?auto_147106 ) ) ( not ( = ?auto_147100 ?auto_147101 ) ) ( not ( = ?auto_147100 ?auto_147102 ) ) ( not ( = ?auto_147100 ?auto_147103 ) ) ( not ( = ?auto_147100 ?auto_147106 ) ) ( not ( = ?auto_147101 ?auto_147102 ) ) ( not ( = ?auto_147101 ?auto_147103 ) ) ( not ( = ?auto_147101 ?auto_147106 ) ) ( not ( = ?auto_147102 ?auto_147103 ) ) ( not ( = ?auto_147102 ?auto_147106 ) ) ( not ( = ?auto_147103 ?auto_147106 ) ) ( not ( = ?auto_147098 ?auto_147104 ) ) ( not ( = ?auto_147099 ?auto_147104 ) ) ( not ( = ?auto_147100 ?auto_147104 ) ) ( not ( = ?auto_147101 ?auto_147104 ) ) ( not ( = ?auto_147102 ?auto_147104 ) ) ( not ( = ?auto_147103 ?auto_147104 ) ) ( not ( = ?auto_147106 ?auto_147104 ) ) ( ON ?auto_147104 ?auto_147105 ) ( not ( = ?auto_147098 ?auto_147105 ) ) ( not ( = ?auto_147099 ?auto_147105 ) ) ( not ( = ?auto_147100 ?auto_147105 ) ) ( not ( = ?auto_147101 ?auto_147105 ) ) ( not ( = ?auto_147102 ?auto_147105 ) ) ( not ( = ?auto_147103 ?auto_147105 ) ) ( not ( = ?auto_147106 ?auto_147105 ) ) ( not ( = ?auto_147104 ?auto_147105 ) ) ( ON ?auto_147106 ?auto_147104 ) ( ON ?auto_147103 ?auto_147106 ) ( ON-TABLE ?auto_147105 ) ( ON ?auto_147102 ?auto_147103 ) ( ON ?auto_147101 ?auto_147102 ) ( ON ?auto_147100 ?auto_147101 ) ( CLEAR ?auto_147098 ) ( ON ?auto_147099 ?auto_147100 ) ( CLEAR ?auto_147099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147105 ?auto_147104 ?auto_147106 ?auto_147103 ?auto_147102 ?auto_147101 ?auto_147100 )
      ( MAKE-6PILE ?auto_147098 ?auto_147099 ?auto_147100 ?auto_147101 ?auto_147102 ?auto_147103 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147107 - BLOCK
      ?auto_147108 - BLOCK
      ?auto_147109 - BLOCK
      ?auto_147110 - BLOCK
      ?auto_147111 - BLOCK
      ?auto_147112 - BLOCK
    )
    :vars
    (
      ?auto_147115 - BLOCK
      ?auto_147113 - BLOCK
      ?auto_147114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147107 ?auto_147108 ) ) ( not ( = ?auto_147107 ?auto_147109 ) ) ( not ( = ?auto_147107 ?auto_147110 ) ) ( not ( = ?auto_147107 ?auto_147111 ) ) ( not ( = ?auto_147107 ?auto_147112 ) ) ( not ( = ?auto_147107 ?auto_147115 ) ) ( not ( = ?auto_147108 ?auto_147109 ) ) ( not ( = ?auto_147108 ?auto_147110 ) ) ( not ( = ?auto_147108 ?auto_147111 ) ) ( not ( = ?auto_147108 ?auto_147112 ) ) ( not ( = ?auto_147108 ?auto_147115 ) ) ( not ( = ?auto_147109 ?auto_147110 ) ) ( not ( = ?auto_147109 ?auto_147111 ) ) ( not ( = ?auto_147109 ?auto_147112 ) ) ( not ( = ?auto_147109 ?auto_147115 ) ) ( not ( = ?auto_147110 ?auto_147111 ) ) ( not ( = ?auto_147110 ?auto_147112 ) ) ( not ( = ?auto_147110 ?auto_147115 ) ) ( not ( = ?auto_147111 ?auto_147112 ) ) ( not ( = ?auto_147111 ?auto_147115 ) ) ( not ( = ?auto_147112 ?auto_147115 ) ) ( not ( = ?auto_147107 ?auto_147113 ) ) ( not ( = ?auto_147108 ?auto_147113 ) ) ( not ( = ?auto_147109 ?auto_147113 ) ) ( not ( = ?auto_147110 ?auto_147113 ) ) ( not ( = ?auto_147111 ?auto_147113 ) ) ( not ( = ?auto_147112 ?auto_147113 ) ) ( not ( = ?auto_147115 ?auto_147113 ) ) ( ON ?auto_147113 ?auto_147114 ) ( not ( = ?auto_147107 ?auto_147114 ) ) ( not ( = ?auto_147108 ?auto_147114 ) ) ( not ( = ?auto_147109 ?auto_147114 ) ) ( not ( = ?auto_147110 ?auto_147114 ) ) ( not ( = ?auto_147111 ?auto_147114 ) ) ( not ( = ?auto_147112 ?auto_147114 ) ) ( not ( = ?auto_147115 ?auto_147114 ) ) ( not ( = ?auto_147113 ?auto_147114 ) ) ( ON ?auto_147115 ?auto_147113 ) ( ON ?auto_147112 ?auto_147115 ) ( ON-TABLE ?auto_147114 ) ( ON ?auto_147111 ?auto_147112 ) ( ON ?auto_147110 ?auto_147111 ) ( ON ?auto_147109 ?auto_147110 ) ( ON ?auto_147108 ?auto_147109 ) ( CLEAR ?auto_147108 ) ( HOLDING ?auto_147107 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147107 )
      ( MAKE-6PILE ?auto_147107 ?auto_147108 ?auto_147109 ?auto_147110 ?auto_147111 ?auto_147112 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_147116 - BLOCK
      ?auto_147117 - BLOCK
      ?auto_147118 - BLOCK
      ?auto_147119 - BLOCK
      ?auto_147120 - BLOCK
      ?auto_147121 - BLOCK
    )
    :vars
    (
      ?auto_147123 - BLOCK
      ?auto_147124 - BLOCK
      ?auto_147122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147116 ?auto_147117 ) ) ( not ( = ?auto_147116 ?auto_147118 ) ) ( not ( = ?auto_147116 ?auto_147119 ) ) ( not ( = ?auto_147116 ?auto_147120 ) ) ( not ( = ?auto_147116 ?auto_147121 ) ) ( not ( = ?auto_147116 ?auto_147123 ) ) ( not ( = ?auto_147117 ?auto_147118 ) ) ( not ( = ?auto_147117 ?auto_147119 ) ) ( not ( = ?auto_147117 ?auto_147120 ) ) ( not ( = ?auto_147117 ?auto_147121 ) ) ( not ( = ?auto_147117 ?auto_147123 ) ) ( not ( = ?auto_147118 ?auto_147119 ) ) ( not ( = ?auto_147118 ?auto_147120 ) ) ( not ( = ?auto_147118 ?auto_147121 ) ) ( not ( = ?auto_147118 ?auto_147123 ) ) ( not ( = ?auto_147119 ?auto_147120 ) ) ( not ( = ?auto_147119 ?auto_147121 ) ) ( not ( = ?auto_147119 ?auto_147123 ) ) ( not ( = ?auto_147120 ?auto_147121 ) ) ( not ( = ?auto_147120 ?auto_147123 ) ) ( not ( = ?auto_147121 ?auto_147123 ) ) ( not ( = ?auto_147116 ?auto_147124 ) ) ( not ( = ?auto_147117 ?auto_147124 ) ) ( not ( = ?auto_147118 ?auto_147124 ) ) ( not ( = ?auto_147119 ?auto_147124 ) ) ( not ( = ?auto_147120 ?auto_147124 ) ) ( not ( = ?auto_147121 ?auto_147124 ) ) ( not ( = ?auto_147123 ?auto_147124 ) ) ( ON ?auto_147124 ?auto_147122 ) ( not ( = ?auto_147116 ?auto_147122 ) ) ( not ( = ?auto_147117 ?auto_147122 ) ) ( not ( = ?auto_147118 ?auto_147122 ) ) ( not ( = ?auto_147119 ?auto_147122 ) ) ( not ( = ?auto_147120 ?auto_147122 ) ) ( not ( = ?auto_147121 ?auto_147122 ) ) ( not ( = ?auto_147123 ?auto_147122 ) ) ( not ( = ?auto_147124 ?auto_147122 ) ) ( ON ?auto_147123 ?auto_147124 ) ( ON ?auto_147121 ?auto_147123 ) ( ON-TABLE ?auto_147122 ) ( ON ?auto_147120 ?auto_147121 ) ( ON ?auto_147119 ?auto_147120 ) ( ON ?auto_147118 ?auto_147119 ) ( ON ?auto_147117 ?auto_147118 ) ( ON ?auto_147116 ?auto_147117 ) ( CLEAR ?auto_147116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147122 ?auto_147124 ?auto_147123 ?auto_147121 ?auto_147120 ?auto_147119 ?auto_147118 ?auto_147117 )
      ( MAKE-6PILE ?auto_147116 ?auto_147117 ?auto_147118 ?auto_147119 ?auto_147120 ?auto_147121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147127 - BLOCK
      ?auto_147128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147128 ) ( CLEAR ?auto_147127 ) ( ON-TABLE ?auto_147127 ) ( not ( = ?auto_147127 ?auto_147128 ) ) )
    :subtasks
    ( ( !STACK ?auto_147128 ?auto_147127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147129 - BLOCK
      ?auto_147130 - BLOCK
    )
    :vars
    (
      ?auto_147131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147129 ) ( ON-TABLE ?auto_147129 ) ( not ( = ?auto_147129 ?auto_147130 ) ) ( ON ?auto_147130 ?auto_147131 ) ( CLEAR ?auto_147130 ) ( HAND-EMPTY ) ( not ( = ?auto_147129 ?auto_147131 ) ) ( not ( = ?auto_147130 ?auto_147131 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147130 ?auto_147131 )
      ( MAKE-2PILE ?auto_147129 ?auto_147130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147132 - BLOCK
      ?auto_147133 - BLOCK
    )
    :vars
    (
      ?auto_147134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147132 ?auto_147133 ) ) ( ON ?auto_147133 ?auto_147134 ) ( CLEAR ?auto_147133 ) ( not ( = ?auto_147132 ?auto_147134 ) ) ( not ( = ?auto_147133 ?auto_147134 ) ) ( HOLDING ?auto_147132 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147132 )
      ( MAKE-2PILE ?auto_147132 ?auto_147133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147135 - BLOCK
      ?auto_147136 - BLOCK
    )
    :vars
    (
      ?auto_147137 - BLOCK
      ?auto_147141 - BLOCK
      ?auto_147142 - BLOCK
      ?auto_147140 - BLOCK
      ?auto_147138 - BLOCK
      ?auto_147139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147135 ?auto_147136 ) ) ( ON ?auto_147136 ?auto_147137 ) ( not ( = ?auto_147135 ?auto_147137 ) ) ( not ( = ?auto_147136 ?auto_147137 ) ) ( ON ?auto_147135 ?auto_147136 ) ( CLEAR ?auto_147135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147141 ) ( ON ?auto_147142 ?auto_147141 ) ( ON ?auto_147140 ?auto_147142 ) ( ON ?auto_147138 ?auto_147140 ) ( ON ?auto_147139 ?auto_147138 ) ( ON ?auto_147137 ?auto_147139 ) ( not ( = ?auto_147141 ?auto_147142 ) ) ( not ( = ?auto_147141 ?auto_147140 ) ) ( not ( = ?auto_147141 ?auto_147138 ) ) ( not ( = ?auto_147141 ?auto_147139 ) ) ( not ( = ?auto_147141 ?auto_147137 ) ) ( not ( = ?auto_147141 ?auto_147136 ) ) ( not ( = ?auto_147141 ?auto_147135 ) ) ( not ( = ?auto_147142 ?auto_147140 ) ) ( not ( = ?auto_147142 ?auto_147138 ) ) ( not ( = ?auto_147142 ?auto_147139 ) ) ( not ( = ?auto_147142 ?auto_147137 ) ) ( not ( = ?auto_147142 ?auto_147136 ) ) ( not ( = ?auto_147142 ?auto_147135 ) ) ( not ( = ?auto_147140 ?auto_147138 ) ) ( not ( = ?auto_147140 ?auto_147139 ) ) ( not ( = ?auto_147140 ?auto_147137 ) ) ( not ( = ?auto_147140 ?auto_147136 ) ) ( not ( = ?auto_147140 ?auto_147135 ) ) ( not ( = ?auto_147138 ?auto_147139 ) ) ( not ( = ?auto_147138 ?auto_147137 ) ) ( not ( = ?auto_147138 ?auto_147136 ) ) ( not ( = ?auto_147138 ?auto_147135 ) ) ( not ( = ?auto_147139 ?auto_147137 ) ) ( not ( = ?auto_147139 ?auto_147136 ) ) ( not ( = ?auto_147139 ?auto_147135 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147141 ?auto_147142 ?auto_147140 ?auto_147138 ?auto_147139 ?auto_147137 ?auto_147136 )
      ( MAKE-2PILE ?auto_147135 ?auto_147136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147143 - BLOCK
      ?auto_147144 - BLOCK
    )
    :vars
    (
      ?auto_147148 - BLOCK
      ?auto_147147 - BLOCK
      ?auto_147146 - BLOCK
      ?auto_147150 - BLOCK
      ?auto_147145 - BLOCK
      ?auto_147149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147143 ?auto_147144 ) ) ( ON ?auto_147144 ?auto_147148 ) ( not ( = ?auto_147143 ?auto_147148 ) ) ( not ( = ?auto_147144 ?auto_147148 ) ) ( ON-TABLE ?auto_147147 ) ( ON ?auto_147146 ?auto_147147 ) ( ON ?auto_147150 ?auto_147146 ) ( ON ?auto_147145 ?auto_147150 ) ( ON ?auto_147149 ?auto_147145 ) ( ON ?auto_147148 ?auto_147149 ) ( not ( = ?auto_147147 ?auto_147146 ) ) ( not ( = ?auto_147147 ?auto_147150 ) ) ( not ( = ?auto_147147 ?auto_147145 ) ) ( not ( = ?auto_147147 ?auto_147149 ) ) ( not ( = ?auto_147147 ?auto_147148 ) ) ( not ( = ?auto_147147 ?auto_147144 ) ) ( not ( = ?auto_147147 ?auto_147143 ) ) ( not ( = ?auto_147146 ?auto_147150 ) ) ( not ( = ?auto_147146 ?auto_147145 ) ) ( not ( = ?auto_147146 ?auto_147149 ) ) ( not ( = ?auto_147146 ?auto_147148 ) ) ( not ( = ?auto_147146 ?auto_147144 ) ) ( not ( = ?auto_147146 ?auto_147143 ) ) ( not ( = ?auto_147150 ?auto_147145 ) ) ( not ( = ?auto_147150 ?auto_147149 ) ) ( not ( = ?auto_147150 ?auto_147148 ) ) ( not ( = ?auto_147150 ?auto_147144 ) ) ( not ( = ?auto_147150 ?auto_147143 ) ) ( not ( = ?auto_147145 ?auto_147149 ) ) ( not ( = ?auto_147145 ?auto_147148 ) ) ( not ( = ?auto_147145 ?auto_147144 ) ) ( not ( = ?auto_147145 ?auto_147143 ) ) ( not ( = ?auto_147149 ?auto_147148 ) ) ( not ( = ?auto_147149 ?auto_147144 ) ) ( not ( = ?auto_147149 ?auto_147143 ) ) ( HOLDING ?auto_147143 ) ( CLEAR ?auto_147144 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147147 ?auto_147146 ?auto_147150 ?auto_147145 ?auto_147149 ?auto_147148 ?auto_147144 ?auto_147143 )
      ( MAKE-2PILE ?auto_147143 ?auto_147144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147151 - BLOCK
      ?auto_147152 - BLOCK
    )
    :vars
    (
      ?auto_147153 - BLOCK
      ?auto_147154 - BLOCK
      ?auto_147155 - BLOCK
      ?auto_147156 - BLOCK
      ?auto_147158 - BLOCK
      ?auto_147157 - BLOCK
      ?auto_147159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147151 ?auto_147152 ) ) ( ON ?auto_147152 ?auto_147153 ) ( not ( = ?auto_147151 ?auto_147153 ) ) ( not ( = ?auto_147152 ?auto_147153 ) ) ( ON-TABLE ?auto_147154 ) ( ON ?auto_147155 ?auto_147154 ) ( ON ?auto_147156 ?auto_147155 ) ( ON ?auto_147158 ?auto_147156 ) ( ON ?auto_147157 ?auto_147158 ) ( ON ?auto_147153 ?auto_147157 ) ( not ( = ?auto_147154 ?auto_147155 ) ) ( not ( = ?auto_147154 ?auto_147156 ) ) ( not ( = ?auto_147154 ?auto_147158 ) ) ( not ( = ?auto_147154 ?auto_147157 ) ) ( not ( = ?auto_147154 ?auto_147153 ) ) ( not ( = ?auto_147154 ?auto_147152 ) ) ( not ( = ?auto_147154 ?auto_147151 ) ) ( not ( = ?auto_147155 ?auto_147156 ) ) ( not ( = ?auto_147155 ?auto_147158 ) ) ( not ( = ?auto_147155 ?auto_147157 ) ) ( not ( = ?auto_147155 ?auto_147153 ) ) ( not ( = ?auto_147155 ?auto_147152 ) ) ( not ( = ?auto_147155 ?auto_147151 ) ) ( not ( = ?auto_147156 ?auto_147158 ) ) ( not ( = ?auto_147156 ?auto_147157 ) ) ( not ( = ?auto_147156 ?auto_147153 ) ) ( not ( = ?auto_147156 ?auto_147152 ) ) ( not ( = ?auto_147156 ?auto_147151 ) ) ( not ( = ?auto_147158 ?auto_147157 ) ) ( not ( = ?auto_147158 ?auto_147153 ) ) ( not ( = ?auto_147158 ?auto_147152 ) ) ( not ( = ?auto_147158 ?auto_147151 ) ) ( not ( = ?auto_147157 ?auto_147153 ) ) ( not ( = ?auto_147157 ?auto_147152 ) ) ( not ( = ?auto_147157 ?auto_147151 ) ) ( CLEAR ?auto_147152 ) ( ON ?auto_147151 ?auto_147159 ) ( CLEAR ?auto_147151 ) ( HAND-EMPTY ) ( not ( = ?auto_147151 ?auto_147159 ) ) ( not ( = ?auto_147152 ?auto_147159 ) ) ( not ( = ?auto_147153 ?auto_147159 ) ) ( not ( = ?auto_147154 ?auto_147159 ) ) ( not ( = ?auto_147155 ?auto_147159 ) ) ( not ( = ?auto_147156 ?auto_147159 ) ) ( not ( = ?auto_147158 ?auto_147159 ) ) ( not ( = ?auto_147157 ?auto_147159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147151 ?auto_147159 )
      ( MAKE-2PILE ?auto_147151 ?auto_147152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147160 - BLOCK
      ?auto_147161 - BLOCK
    )
    :vars
    (
      ?auto_147164 - BLOCK
      ?auto_147167 - BLOCK
      ?auto_147165 - BLOCK
      ?auto_147163 - BLOCK
      ?auto_147166 - BLOCK
      ?auto_147168 - BLOCK
      ?auto_147162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147160 ?auto_147161 ) ) ( not ( = ?auto_147160 ?auto_147164 ) ) ( not ( = ?auto_147161 ?auto_147164 ) ) ( ON-TABLE ?auto_147167 ) ( ON ?auto_147165 ?auto_147167 ) ( ON ?auto_147163 ?auto_147165 ) ( ON ?auto_147166 ?auto_147163 ) ( ON ?auto_147168 ?auto_147166 ) ( ON ?auto_147164 ?auto_147168 ) ( not ( = ?auto_147167 ?auto_147165 ) ) ( not ( = ?auto_147167 ?auto_147163 ) ) ( not ( = ?auto_147167 ?auto_147166 ) ) ( not ( = ?auto_147167 ?auto_147168 ) ) ( not ( = ?auto_147167 ?auto_147164 ) ) ( not ( = ?auto_147167 ?auto_147161 ) ) ( not ( = ?auto_147167 ?auto_147160 ) ) ( not ( = ?auto_147165 ?auto_147163 ) ) ( not ( = ?auto_147165 ?auto_147166 ) ) ( not ( = ?auto_147165 ?auto_147168 ) ) ( not ( = ?auto_147165 ?auto_147164 ) ) ( not ( = ?auto_147165 ?auto_147161 ) ) ( not ( = ?auto_147165 ?auto_147160 ) ) ( not ( = ?auto_147163 ?auto_147166 ) ) ( not ( = ?auto_147163 ?auto_147168 ) ) ( not ( = ?auto_147163 ?auto_147164 ) ) ( not ( = ?auto_147163 ?auto_147161 ) ) ( not ( = ?auto_147163 ?auto_147160 ) ) ( not ( = ?auto_147166 ?auto_147168 ) ) ( not ( = ?auto_147166 ?auto_147164 ) ) ( not ( = ?auto_147166 ?auto_147161 ) ) ( not ( = ?auto_147166 ?auto_147160 ) ) ( not ( = ?auto_147168 ?auto_147164 ) ) ( not ( = ?auto_147168 ?auto_147161 ) ) ( not ( = ?auto_147168 ?auto_147160 ) ) ( ON ?auto_147160 ?auto_147162 ) ( CLEAR ?auto_147160 ) ( not ( = ?auto_147160 ?auto_147162 ) ) ( not ( = ?auto_147161 ?auto_147162 ) ) ( not ( = ?auto_147164 ?auto_147162 ) ) ( not ( = ?auto_147167 ?auto_147162 ) ) ( not ( = ?auto_147165 ?auto_147162 ) ) ( not ( = ?auto_147163 ?auto_147162 ) ) ( not ( = ?auto_147166 ?auto_147162 ) ) ( not ( = ?auto_147168 ?auto_147162 ) ) ( HOLDING ?auto_147161 ) ( CLEAR ?auto_147164 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147167 ?auto_147165 ?auto_147163 ?auto_147166 ?auto_147168 ?auto_147164 ?auto_147161 )
      ( MAKE-2PILE ?auto_147160 ?auto_147161 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147169 - BLOCK
      ?auto_147170 - BLOCK
    )
    :vars
    (
      ?auto_147171 - BLOCK
      ?auto_147173 - BLOCK
      ?auto_147175 - BLOCK
      ?auto_147177 - BLOCK
      ?auto_147172 - BLOCK
      ?auto_147176 - BLOCK
      ?auto_147174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147169 ?auto_147170 ) ) ( not ( = ?auto_147169 ?auto_147171 ) ) ( not ( = ?auto_147170 ?auto_147171 ) ) ( ON-TABLE ?auto_147173 ) ( ON ?auto_147175 ?auto_147173 ) ( ON ?auto_147177 ?auto_147175 ) ( ON ?auto_147172 ?auto_147177 ) ( ON ?auto_147176 ?auto_147172 ) ( ON ?auto_147171 ?auto_147176 ) ( not ( = ?auto_147173 ?auto_147175 ) ) ( not ( = ?auto_147173 ?auto_147177 ) ) ( not ( = ?auto_147173 ?auto_147172 ) ) ( not ( = ?auto_147173 ?auto_147176 ) ) ( not ( = ?auto_147173 ?auto_147171 ) ) ( not ( = ?auto_147173 ?auto_147170 ) ) ( not ( = ?auto_147173 ?auto_147169 ) ) ( not ( = ?auto_147175 ?auto_147177 ) ) ( not ( = ?auto_147175 ?auto_147172 ) ) ( not ( = ?auto_147175 ?auto_147176 ) ) ( not ( = ?auto_147175 ?auto_147171 ) ) ( not ( = ?auto_147175 ?auto_147170 ) ) ( not ( = ?auto_147175 ?auto_147169 ) ) ( not ( = ?auto_147177 ?auto_147172 ) ) ( not ( = ?auto_147177 ?auto_147176 ) ) ( not ( = ?auto_147177 ?auto_147171 ) ) ( not ( = ?auto_147177 ?auto_147170 ) ) ( not ( = ?auto_147177 ?auto_147169 ) ) ( not ( = ?auto_147172 ?auto_147176 ) ) ( not ( = ?auto_147172 ?auto_147171 ) ) ( not ( = ?auto_147172 ?auto_147170 ) ) ( not ( = ?auto_147172 ?auto_147169 ) ) ( not ( = ?auto_147176 ?auto_147171 ) ) ( not ( = ?auto_147176 ?auto_147170 ) ) ( not ( = ?auto_147176 ?auto_147169 ) ) ( ON ?auto_147169 ?auto_147174 ) ( not ( = ?auto_147169 ?auto_147174 ) ) ( not ( = ?auto_147170 ?auto_147174 ) ) ( not ( = ?auto_147171 ?auto_147174 ) ) ( not ( = ?auto_147173 ?auto_147174 ) ) ( not ( = ?auto_147175 ?auto_147174 ) ) ( not ( = ?auto_147177 ?auto_147174 ) ) ( not ( = ?auto_147172 ?auto_147174 ) ) ( not ( = ?auto_147176 ?auto_147174 ) ) ( CLEAR ?auto_147171 ) ( ON ?auto_147170 ?auto_147169 ) ( CLEAR ?auto_147170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147174 ?auto_147169 )
      ( MAKE-2PILE ?auto_147169 ?auto_147170 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147178 - BLOCK
      ?auto_147179 - BLOCK
    )
    :vars
    (
      ?auto_147182 - BLOCK
      ?auto_147181 - BLOCK
      ?auto_147185 - BLOCK
      ?auto_147183 - BLOCK
      ?auto_147186 - BLOCK
      ?auto_147184 - BLOCK
      ?auto_147180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147178 ?auto_147179 ) ) ( not ( = ?auto_147178 ?auto_147182 ) ) ( not ( = ?auto_147179 ?auto_147182 ) ) ( ON-TABLE ?auto_147181 ) ( ON ?auto_147185 ?auto_147181 ) ( ON ?auto_147183 ?auto_147185 ) ( ON ?auto_147186 ?auto_147183 ) ( ON ?auto_147184 ?auto_147186 ) ( not ( = ?auto_147181 ?auto_147185 ) ) ( not ( = ?auto_147181 ?auto_147183 ) ) ( not ( = ?auto_147181 ?auto_147186 ) ) ( not ( = ?auto_147181 ?auto_147184 ) ) ( not ( = ?auto_147181 ?auto_147182 ) ) ( not ( = ?auto_147181 ?auto_147179 ) ) ( not ( = ?auto_147181 ?auto_147178 ) ) ( not ( = ?auto_147185 ?auto_147183 ) ) ( not ( = ?auto_147185 ?auto_147186 ) ) ( not ( = ?auto_147185 ?auto_147184 ) ) ( not ( = ?auto_147185 ?auto_147182 ) ) ( not ( = ?auto_147185 ?auto_147179 ) ) ( not ( = ?auto_147185 ?auto_147178 ) ) ( not ( = ?auto_147183 ?auto_147186 ) ) ( not ( = ?auto_147183 ?auto_147184 ) ) ( not ( = ?auto_147183 ?auto_147182 ) ) ( not ( = ?auto_147183 ?auto_147179 ) ) ( not ( = ?auto_147183 ?auto_147178 ) ) ( not ( = ?auto_147186 ?auto_147184 ) ) ( not ( = ?auto_147186 ?auto_147182 ) ) ( not ( = ?auto_147186 ?auto_147179 ) ) ( not ( = ?auto_147186 ?auto_147178 ) ) ( not ( = ?auto_147184 ?auto_147182 ) ) ( not ( = ?auto_147184 ?auto_147179 ) ) ( not ( = ?auto_147184 ?auto_147178 ) ) ( ON ?auto_147178 ?auto_147180 ) ( not ( = ?auto_147178 ?auto_147180 ) ) ( not ( = ?auto_147179 ?auto_147180 ) ) ( not ( = ?auto_147182 ?auto_147180 ) ) ( not ( = ?auto_147181 ?auto_147180 ) ) ( not ( = ?auto_147185 ?auto_147180 ) ) ( not ( = ?auto_147183 ?auto_147180 ) ) ( not ( = ?auto_147186 ?auto_147180 ) ) ( not ( = ?auto_147184 ?auto_147180 ) ) ( ON ?auto_147179 ?auto_147178 ) ( CLEAR ?auto_147179 ) ( ON-TABLE ?auto_147180 ) ( HOLDING ?auto_147182 ) ( CLEAR ?auto_147184 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147181 ?auto_147185 ?auto_147183 ?auto_147186 ?auto_147184 ?auto_147182 )
      ( MAKE-2PILE ?auto_147178 ?auto_147179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147187 - BLOCK
      ?auto_147188 - BLOCK
    )
    :vars
    (
      ?auto_147193 - BLOCK
      ?auto_147195 - BLOCK
      ?auto_147191 - BLOCK
      ?auto_147190 - BLOCK
      ?auto_147189 - BLOCK
      ?auto_147194 - BLOCK
      ?auto_147192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147187 ?auto_147188 ) ) ( not ( = ?auto_147187 ?auto_147193 ) ) ( not ( = ?auto_147188 ?auto_147193 ) ) ( ON-TABLE ?auto_147195 ) ( ON ?auto_147191 ?auto_147195 ) ( ON ?auto_147190 ?auto_147191 ) ( ON ?auto_147189 ?auto_147190 ) ( ON ?auto_147194 ?auto_147189 ) ( not ( = ?auto_147195 ?auto_147191 ) ) ( not ( = ?auto_147195 ?auto_147190 ) ) ( not ( = ?auto_147195 ?auto_147189 ) ) ( not ( = ?auto_147195 ?auto_147194 ) ) ( not ( = ?auto_147195 ?auto_147193 ) ) ( not ( = ?auto_147195 ?auto_147188 ) ) ( not ( = ?auto_147195 ?auto_147187 ) ) ( not ( = ?auto_147191 ?auto_147190 ) ) ( not ( = ?auto_147191 ?auto_147189 ) ) ( not ( = ?auto_147191 ?auto_147194 ) ) ( not ( = ?auto_147191 ?auto_147193 ) ) ( not ( = ?auto_147191 ?auto_147188 ) ) ( not ( = ?auto_147191 ?auto_147187 ) ) ( not ( = ?auto_147190 ?auto_147189 ) ) ( not ( = ?auto_147190 ?auto_147194 ) ) ( not ( = ?auto_147190 ?auto_147193 ) ) ( not ( = ?auto_147190 ?auto_147188 ) ) ( not ( = ?auto_147190 ?auto_147187 ) ) ( not ( = ?auto_147189 ?auto_147194 ) ) ( not ( = ?auto_147189 ?auto_147193 ) ) ( not ( = ?auto_147189 ?auto_147188 ) ) ( not ( = ?auto_147189 ?auto_147187 ) ) ( not ( = ?auto_147194 ?auto_147193 ) ) ( not ( = ?auto_147194 ?auto_147188 ) ) ( not ( = ?auto_147194 ?auto_147187 ) ) ( ON ?auto_147187 ?auto_147192 ) ( not ( = ?auto_147187 ?auto_147192 ) ) ( not ( = ?auto_147188 ?auto_147192 ) ) ( not ( = ?auto_147193 ?auto_147192 ) ) ( not ( = ?auto_147195 ?auto_147192 ) ) ( not ( = ?auto_147191 ?auto_147192 ) ) ( not ( = ?auto_147190 ?auto_147192 ) ) ( not ( = ?auto_147189 ?auto_147192 ) ) ( not ( = ?auto_147194 ?auto_147192 ) ) ( ON ?auto_147188 ?auto_147187 ) ( ON-TABLE ?auto_147192 ) ( CLEAR ?auto_147194 ) ( ON ?auto_147193 ?auto_147188 ) ( CLEAR ?auto_147193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147192 ?auto_147187 ?auto_147188 )
      ( MAKE-2PILE ?auto_147187 ?auto_147188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147196 - BLOCK
      ?auto_147197 - BLOCK
    )
    :vars
    (
      ?auto_147198 - BLOCK
      ?auto_147201 - BLOCK
      ?auto_147200 - BLOCK
      ?auto_147202 - BLOCK
      ?auto_147203 - BLOCK
      ?auto_147204 - BLOCK
      ?auto_147199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147196 ?auto_147197 ) ) ( not ( = ?auto_147196 ?auto_147198 ) ) ( not ( = ?auto_147197 ?auto_147198 ) ) ( ON-TABLE ?auto_147201 ) ( ON ?auto_147200 ?auto_147201 ) ( ON ?auto_147202 ?auto_147200 ) ( ON ?auto_147203 ?auto_147202 ) ( not ( = ?auto_147201 ?auto_147200 ) ) ( not ( = ?auto_147201 ?auto_147202 ) ) ( not ( = ?auto_147201 ?auto_147203 ) ) ( not ( = ?auto_147201 ?auto_147204 ) ) ( not ( = ?auto_147201 ?auto_147198 ) ) ( not ( = ?auto_147201 ?auto_147197 ) ) ( not ( = ?auto_147201 ?auto_147196 ) ) ( not ( = ?auto_147200 ?auto_147202 ) ) ( not ( = ?auto_147200 ?auto_147203 ) ) ( not ( = ?auto_147200 ?auto_147204 ) ) ( not ( = ?auto_147200 ?auto_147198 ) ) ( not ( = ?auto_147200 ?auto_147197 ) ) ( not ( = ?auto_147200 ?auto_147196 ) ) ( not ( = ?auto_147202 ?auto_147203 ) ) ( not ( = ?auto_147202 ?auto_147204 ) ) ( not ( = ?auto_147202 ?auto_147198 ) ) ( not ( = ?auto_147202 ?auto_147197 ) ) ( not ( = ?auto_147202 ?auto_147196 ) ) ( not ( = ?auto_147203 ?auto_147204 ) ) ( not ( = ?auto_147203 ?auto_147198 ) ) ( not ( = ?auto_147203 ?auto_147197 ) ) ( not ( = ?auto_147203 ?auto_147196 ) ) ( not ( = ?auto_147204 ?auto_147198 ) ) ( not ( = ?auto_147204 ?auto_147197 ) ) ( not ( = ?auto_147204 ?auto_147196 ) ) ( ON ?auto_147196 ?auto_147199 ) ( not ( = ?auto_147196 ?auto_147199 ) ) ( not ( = ?auto_147197 ?auto_147199 ) ) ( not ( = ?auto_147198 ?auto_147199 ) ) ( not ( = ?auto_147201 ?auto_147199 ) ) ( not ( = ?auto_147200 ?auto_147199 ) ) ( not ( = ?auto_147202 ?auto_147199 ) ) ( not ( = ?auto_147203 ?auto_147199 ) ) ( not ( = ?auto_147204 ?auto_147199 ) ) ( ON ?auto_147197 ?auto_147196 ) ( ON-TABLE ?auto_147199 ) ( ON ?auto_147198 ?auto_147197 ) ( CLEAR ?auto_147198 ) ( HOLDING ?auto_147204 ) ( CLEAR ?auto_147203 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147201 ?auto_147200 ?auto_147202 ?auto_147203 ?auto_147204 )
      ( MAKE-2PILE ?auto_147196 ?auto_147197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147205 - BLOCK
      ?auto_147206 - BLOCK
    )
    :vars
    (
      ?auto_147212 - BLOCK
      ?auto_147210 - BLOCK
      ?auto_147213 - BLOCK
      ?auto_147211 - BLOCK
      ?auto_147208 - BLOCK
      ?auto_147209 - BLOCK
      ?auto_147207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147205 ?auto_147206 ) ) ( not ( = ?auto_147205 ?auto_147212 ) ) ( not ( = ?auto_147206 ?auto_147212 ) ) ( ON-TABLE ?auto_147210 ) ( ON ?auto_147213 ?auto_147210 ) ( ON ?auto_147211 ?auto_147213 ) ( ON ?auto_147208 ?auto_147211 ) ( not ( = ?auto_147210 ?auto_147213 ) ) ( not ( = ?auto_147210 ?auto_147211 ) ) ( not ( = ?auto_147210 ?auto_147208 ) ) ( not ( = ?auto_147210 ?auto_147209 ) ) ( not ( = ?auto_147210 ?auto_147212 ) ) ( not ( = ?auto_147210 ?auto_147206 ) ) ( not ( = ?auto_147210 ?auto_147205 ) ) ( not ( = ?auto_147213 ?auto_147211 ) ) ( not ( = ?auto_147213 ?auto_147208 ) ) ( not ( = ?auto_147213 ?auto_147209 ) ) ( not ( = ?auto_147213 ?auto_147212 ) ) ( not ( = ?auto_147213 ?auto_147206 ) ) ( not ( = ?auto_147213 ?auto_147205 ) ) ( not ( = ?auto_147211 ?auto_147208 ) ) ( not ( = ?auto_147211 ?auto_147209 ) ) ( not ( = ?auto_147211 ?auto_147212 ) ) ( not ( = ?auto_147211 ?auto_147206 ) ) ( not ( = ?auto_147211 ?auto_147205 ) ) ( not ( = ?auto_147208 ?auto_147209 ) ) ( not ( = ?auto_147208 ?auto_147212 ) ) ( not ( = ?auto_147208 ?auto_147206 ) ) ( not ( = ?auto_147208 ?auto_147205 ) ) ( not ( = ?auto_147209 ?auto_147212 ) ) ( not ( = ?auto_147209 ?auto_147206 ) ) ( not ( = ?auto_147209 ?auto_147205 ) ) ( ON ?auto_147205 ?auto_147207 ) ( not ( = ?auto_147205 ?auto_147207 ) ) ( not ( = ?auto_147206 ?auto_147207 ) ) ( not ( = ?auto_147212 ?auto_147207 ) ) ( not ( = ?auto_147210 ?auto_147207 ) ) ( not ( = ?auto_147213 ?auto_147207 ) ) ( not ( = ?auto_147211 ?auto_147207 ) ) ( not ( = ?auto_147208 ?auto_147207 ) ) ( not ( = ?auto_147209 ?auto_147207 ) ) ( ON ?auto_147206 ?auto_147205 ) ( ON-TABLE ?auto_147207 ) ( ON ?auto_147212 ?auto_147206 ) ( CLEAR ?auto_147208 ) ( ON ?auto_147209 ?auto_147212 ) ( CLEAR ?auto_147209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147207 ?auto_147205 ?auto_147206 ?auto_147212 )
      ( MAKE-2PILE ?auto_147205 ?auto_147206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147214 - BLOCK
      ?auto_147215 - BLOCK
    )
    :vars
    (
      ?auto_147220 - BLOCK
      ?auto_147217 - BLOCK
      ?auto_147216 - BLOCK
      ?auto_147221 - BLOCK
      ?auto_147222 - BLOCK
      ?auto_147218 - BLOCK
      ?auto_147219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147214 ?auto_147215 ) ) ( not ( = ?auto_147214 ?auto_147220 ) ) ( not ( = ?auto_147215 ?auto_147220 ) ) ( ON-TABLE ?auto_147217 ) ( ON ?auto_147216 ?auto_147217 ) ( ON ?auto_147221 ?auto_147216 ) ( not ( = ?auto_147217 ?auto_147216 ) ) ( not ( = ?auto_147217 ?auto_147221 ) ) ( not ( = ?auto_147217 ?auto_147222 ) ) ( not ( = ?auto_147217 ?auto_147218 ) ) ( not ( = ?auto_147217 ?auto_147220 ) ) ( not ( = ?auto_147217 ?auto_147215 ) ) ( not ( = ?auto_147217 ?auto_147214 ) ) ( not ( = ?auto_147216 ?auto_147221 ) ) ( not ( = ?auto_147216 ?auto_147222 ) ) ( not ( = ?auto_147216 ?auto_147218 ) ) ( not ( = ?auto_147216 ?auto_147220 ) ) ( not ( = ?auto_147216 ?auto_147215 ) ) ( not ( = ?auto_147216 ?auto_147214 ) ) ( not ( = ?auto_147221 ?auto_147222 ) ) ( not ( = ?auto_147221 ?auto_147218 ) ) ( not ( = ?auto_147221 ?auto_147220 ) ) ( not ( = ?auto_147221 ?auto_147215 ) ) ( not ( = ?auto_147221 ?auto_147214 ) ) ( not ( = ?auto_147222 ?auto_147218 ) ) ( not ( = ?auto_147222 ?auto_147220 ) ) ( not ( = ?auto_147222 ?auto_147215 ) ) ( not ( = ?auto_147222 ?auto_147214 ) ) ( not ( = ?auto_147218 ?auto_147220 ) ) ( not ( = ?auto_147218 ?auto_147215 ) ) ( not ( = ?auto_147218 ?auto_147214 ) ) ( ON ?auto_147214 ?auto_147219 ) ( not ( = ?auto_147214 ?auto_147219 ) ) ( not ( = ?auto_147215 ?auto_147219 ) ) ( not ( = ?auto_147220 ?auto_147219 ) ) ( not ( = ?auto_147217 ?auto_147219 ) ) ( not ( = ?auto_147216 ?auto_147219 ) ) ( not ( = ?auto_147221 ?auto_147219 ) ) ( not ( = ?auto_147222 ?auto_147219 ) ) ( not ( = ?auto_147218 ?auto_147219 ) ) ( ON ?auto_147215 ?auto_147214 ) ( ON-TABLE ?auto_147219 ) ( ON ?auto_147220 ?auto_147215 ) ( ON ?auto_147218 ?auto_147220 ) ( CLEAR ?auto_147218 ) ( HOLDING ?auto_147222 ) ( CLEAR ?auto_147221 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147217 ?auto_147216 ?auto_147221 ?auto_147222 )
      ( MAKE-2PILE ?auto_147214 ?auto_147215 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147223 - BLOCK
      ?auto_147224 - BLOCK
    )
    :vars
    (
      ?auto_147228 - BLOCK
      ?auto_147225 - BLOCK
      ?auto_147227 - BLOCK
      ?auto_147229 - BLOCK
      ?auto_147231 - BLOCK
      ?auto_147226 - BLOCK
      ?auto_147230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147223 ?auto_147224 ) ) ( not ( = ?auto_147223 ?auto_147228 ) ) ( not ( = ?auto_147224 ?auto_147228 ) ) ( ON-TABLE ?auto_147225 ) ( ON ?auto_147227 ?auto_147225 ) ( ON ?auto_147229 ?auto_147227 ) ( not ( = ?auto_147225 ?auto_147227 ) ) ( not ( = ?auto_147225 ?auto_147229 ) ) ( not ( = ?auto_147225 ?auto_147231 ) ) ( not ( = ?auto_147225 ?auto_147226 ) ) ( not ( = ?auto_147225 ?auto_147228 ) ) ( not ( = ?auto_147225 ?auto_147224 ) ) ( not ( = ?auto_147225 ?auto_147223 ) ) ( not ( = ?auto_147227 ?auto_147229 ) ) ( not ( = ?auto_147227 ?auto_147231 ) ) ( not ( = ?auto_147227 ?auto_147226 ) ) ( not ( = ?auto_147227 ?auto_147228 ) ) ( not ( = ?auto_147227 ?auto_147224 ) ) ( not ( = ?auto_147227 ?auto_147223 ) ) ( not ( = ?auto_147229 ?auto_147231 ) ) ( not ( = ?auto_147229 ?auto_147226 ) ) ( not ( = ?auto_147229 ?auto_147228 ) ) ( not ( = ?auto_147229 ?auto_147224 ) ) ( not ( = ?auto_147229 ?auto_147223 ) ) ( not ( = ?auto_147231 ?auto_147226 ) ) ( not ( = ?auto_147231 ?auto_147228 ) ) ( not ( = ?auto_147231 ?auto_147224 ) ) ( not ( = ?auto_147231 ?auto_147223 ) ) ( not ( = ?auto_147226 ?auto_147228 ) ) ( not ( = ?auto_147226 ?auto_147224 ) ) ( not ( = ?auto_147226 ?auto_147223 ) ) ( ON ?auto_147223 ?auto_147230 ) ( not ( = ?auto_147223 ?auto_147230 ) ) ( not ( = ?auto_147224 ?auto_147230 ) ) ( not ( = ?auto_147228 ?auto_147230 ) ) ( not ( = ?auto_147225 ?auto_147230 ) ) ( not ( = ?auto_147227 ?auto_147230 ) ) ( not ( = ?auto_147229 ?auto_147230 ) ) ( not ( = ?auto_147231 ?auto_147230 ) ) ( not ( = ?auto_147226 ?auto_147230 ) ) ( ON ?auto_147224 ?auto_147223 ) ( ON-TABLE ?auto_147230 ) ( ON ?auto_147228 ?auto_147224 ) ( ON ?auto_147226 ?auto_147228 ) ( CLEAR ?auto_147229 ) ( ON ?auto_147231 ?auto_147226 ) ( CLEAR ?auto_147231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147230 ?auto_147223 ?auto_147224 ?auto_147228 ?auto_147226 )
      ( MAKE-2PILE ?auto_147223 ?auto_147224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147232 - BLOCK
      ?auto_147233 - BLOCK
    )
    :vars
    (
      ?auto_147237 - BLOCK
      ?auto_147235 - BLOCK
      ?auto_147238 - BLOCK
      ?auto_147240 - BLOCK
      ?auto_147239 - BLOCK
      ?auto_147234 - BLOCK
      ?auto_147236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147232 ?auto_147233 ) ) ( not ( = ?auto_147232 ?auto_147237 ) ) ( not ( = ?auto_147233 ?auto_147237 ) ) ( ON-TABLE ?auto_147235 ) ( ON ?auto_147238 ?auto_147235 ) ( not ( = ?auto_147235 ?auto_147238 ) ) ( not ( = ?auto_147235 ?auto_147240 ) ) ( not ( = ?auto_147235 ?auto_147239 ) ) ( not ( = ?auto_147235 ?auto_147234 ) ) ( not ( = ?auto_147235 ?auto_147237 ) ) ( not ( = ?auto_147235 ?auto_147233 ) ) ( not ( = ?auto_147235 ?auto_147232 ) ) ( not ( = ?auto_147238 ?auto_147240 ) ) ( not ( = ?auto_147238 ?auto_147239 ) ) ( not ( = ?auto_147238 ?auto_147234 ) ) ( not ( = ?auto_147238 ?auto_147237 ) ) ( not ( = ?auto_147238 ?auto_147233 ) ) ( not ( = ?auto_147238 ?auto_147232 ) ) ( not ( = ?auto_147240 ?auto_147239 ) ) ( not ( = ?auto_147240 ?auto_147234 ) ) ( not ( = ?auto_147240 ?auto_147237 ) ) ( not ( = ?auto_147240 ?auto_147233 ) ) ( not ( = ?auto_147240 ?auto_147232 ) ) ( not ( = ?auto_147239 ?auto_147234 ) ) ( not ( = ?auto_147239 ?auto_147237 ) ) ( not ( = ?auto_147239 ?auto_147233 ) ) ( not ( = ?auto_147239 ?auto_147232 ) ) ( not ( = ?auto_147234 ?auto_147237 ) ) ( not ( = ?auto_147234 ?auto_147233 ) ) ( not ( = ?auto_147234 ?auto_147232 ) ) ( ON ?auto_147232 ?auto_147236 ) ( not ( = ?auto_147232 ?auto_147236 ) ) ( not ( = ?auto_147233 ?auto_147236 ) ) ( not ( = ?auto_147237 ?auto_147236 ) ) ( not ( = ?auto_147235 ?auto_147236 ) ) ( not ( = ?auto_147238 ?auto_147236 ) ) ( not ( = ?auto_147240 ?auto_147236 ) ) ( not ( = ?auto_147239 ?auto_147236 ) ) ( not ( = ?auto_147234 ?auto_147236 ) ) ( ON ?auto_147233 ?auto_147232 ) ( ON-TABLE ?auto_147236 ) ( ON ?auto_147237 ?auto_147233 ) ( ON ?auto_147234 ?auto_147237 ) ( ON ?auto_147239 ?auto_147234 ) ( CLEAR ?auto_147239 ) ( HOLDING ?auto_147240 ) ( CLEAR ?auto_147238 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147235 ?auto_147238 ?auto_147240 )
      ( MAKE-2PILE ?auto_147232 ?auto_147233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147241 - BLOCK
      ?auto_147242 - BLOCK
    )
    :vars
    (
      ?auto_147249 - BLOCK
      ?auto_147245 - BLOCK
      ?auto_147246 - BLOCK
      ?auto_147248 - BLOCK
      ?auto_147247 - BLOCK
      ?auto_147243 - BLOCK
      ?auto_147244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147241 ?auto_147242 ) ) ( not ( = ?auto_147241 ?auto_147249 ) ) ( not ( = ?auto_147242 ?auto_147249 ) ) ( ON-TABLE ?auto_147245 ) ( ON ?auto_147246 ?auto_147245 ) ( not ( = ?auto_147245 ?auto_147246 ) ) ( not ( = ?auto_147245 ?auto_147248 ) ) ( not ( = ?auto_147245 ?auto_147247 ) ) ( not ( = ?auto_147245 ?auto_147243 ) ) ( not ( = ?auto_147245 ?auto_147249 ) ) ( not ( = ?auto_147245 ?auto_147242 ) ) ( not ( = ?auto_147245 ?auto_147241 ) ) ( not ( = ?auto_147246 ?auto_147248 ) ) ( not ( = ?auto_147246 ?auto_147247 ) ) ( not ( = ?auto_147246 ?auto_147243 ) ) ( not ( = ?auto_147246 ?auto_147249 ) ) ( not ( = ?auto_147246 ?auto_147242 ) ) ( not ( = ?auto_147246 ?auto_147241 ) ) ( not ( = ?auto_147248 ?auto_147247 ) ) ( not ( = ?auto_147248 ?auto_147243 ) ) ( not ( = ?auto_147248 ?auto_147249 ) ) ( not ( = ?auto_147248 ?auto_147242 ) ) ( not ( = ?auto_147248 ?auto_147241 ) ) ( not ( = ?auto_147247 ?auto_147243 ) ) ( not ( = ?auto_147247 ?auto_147249 ) ) ( not ( = ?auto_147247 ?auto_147242 ) ) ( not ( = ?auto_147247 ?auto_147241 ) ) ( not ( = ?auto_147243 ?auto_147249 ) ) ( not ( = ?auto_147243 ?auto_147242 ) ) ( not ( = ?auto_147243 ?auto_147241 ) ) ( ON ?auto_147241 ?auto_147244 ) ( not ( = ?auto_147241 ?auto_147244 ) ) ( not ( = ?auto_147242 ?auto_147244 ) ) ( not ( = ?auto_147249 ?auto_147244 ) ) ( not ( = ?auto_147245 ?auto_147244 ) ) ( not ( = ?auto_147246 ?auto_147244 ) ) ( not ( = ?auto_147248 ?auto_147244 ) ) ( not ( = ?auto_147247 ?auto_147244 ) ) ( not ( = ?auto_147243 ?auto_147244 ) ) ( ON ?auto_147242 ?auto_147241 ) ( ON-TABLE ?auto_147244 ) ( ON ?auto_147249 ?auto_147242 ) ( ON ?auto_147243 ?auto_147249 ) ( ON ?auto_147247 ?auto_147243 ) ( CLEAR ?auto_147246 ) ( ON ?auto_147248 ?auto_147247 ) ( CLEAR ?auto_147248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147244 ?auto_147241 ?auto_147242 ?auto_147249 ?auto_147243 ?auto_147247 )
      ( MAKE-2PILE ?auto_147241 ?auto_147242 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147250 - BLOCK
      ?auto_147251 - BLOCK
    )
    :vars
    (
      ?auto_147253 - BLOCK
      ?auto_147256 - BLOCK
      ?auto_147257 - BLOCK
      ?auto_147254 - BLOCK
      ?auto_147252 - BLOCK
      ?auto_147258 - BLOCK
      ?auto_147255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147250 ?auto_147251 ) ) ( not ( = ?auto_147250 ?auto_147253 ) ) ( not ( = ?auto_147251 ?auto_147253 ) ) ( ON-TABLE ?auto_147256 ) ( not ( = ?auto_147256 ?auto_147257 ) ) ( not ( = ?auto_147256 ?auto_147254 ) ) ( not ( = ?auto_147256 ?auto_147252 ) ) ( not ( = ?auto_147256 ?auto_147258 ) ) ( not ( = ?auto_147256 ?auto_147253 ) ) ( not ( = ?auto_147256 ?auto_147251 ) ) ( not ( = ?auto_147256 ?auto_147250 ) ) ( not ( = ?auto_147257 ?auto_147254 ) ) ( not ( = ?auto_147257 ?auto_147252 ) ) ( not ( = ?auto_147257 ?auto_147258 ) ) ( not ( = ?auto_147257 ?auto_147253 ) ) ( not ( = ?auto_147257 ?auto_147251 ) ) ( not ( = ?auto_147257 ?auto_147250 ) ) ( not ( = ?auto_147254 ?auto_147252 ) ) ( not ( = ?auto_147254 ?auto_147258 ) ) ( not ( = ?auto_147254 ?auto_147253 ) ) ( not ( = ?auto_147254 ?auto_147251 ) ) ( not ( = ?auto_147254 ?auto_147250 ) ) ( not ( = ?auto_147252 ?auto_147258 ) ) ( not ( = ?auto_147252 ?auto_147253 ) ) ( not ( = ?auto_147252 ?auto_147251 ) ) ( not ( = ?auto_147252 ?auto_147250 ) ) ( not ( = ?auto_147258 ?auto_147253 ) ) ( not ( = ?auto_147258 ?auto_147251 ) ) ( not ( = ?auto_147258 ?auto_147250 ) ) ( ON ?auto_147250 ?auto_147255 ) ( not ( = ?auto_147250 ?auto_147255 ) ) ( not ( = ?auto_147251 ?auto_147255 ) ) ( not ( = ?auto_147253 ?auto_147255 ) ) ( not ( = ?auto_147256 ?auto_147255 ) ) ( not ( = ?auto_147257 ?auto_147255 ) ) ( not ( = ?auto_147254 ?auto_147255 ) ) ( not ( = ?auto_147252 ?auto_147255 ) ) ( not ( = ?auto_147258 ?auto_147255 ) ) ( ON ?auto_147251 ?auto_147250 ) ( ON-TABLE ?auto_147255 ) ( ON ?auto_147253 ?auto_147251 ) ( ON ?auto_147258 ?auto_147253 ) ( ON ?auto_147252 ?auto_147258 ) ( ON ?auto_147254 ?auto_147252 ) ( CLEAR ?auto_147254 ) ( HOLDING ?auto_147257 ) ( CLEAR ?auto_147256 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147256 ?auto_147257 )
      ( MAKE-2PILE ?auto_147250 ?auto_147251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147259 - BLOCK
      ?auto_147260 - BLOCK
    )
    :vars
    (
      ?auto_147261 - BLOCK
      ?auto_147265 - BLOCK
      ?auto_147262 - BLOCK
      ?auto_147264 - BLOCK
      ?auto_147263 - BLOCK
      ?auto_147267 - BLOCK
      ?auto_147266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147259 ?auto_147260 ) ) ( not ( = ?auto_147259 ?auto_147261 ) ) ( not ( = ?auto_147260 ?auto_147261 ) ) ( ON-TABLE ?auto_147265 ) ( not ( = ?auto_147265 ?auto_147262 ) ) ( not ( = ?auto_147265 ?auto_147264 ) ) ( not ( = ?auto_147265 ?auto_147263 ) ) ( not ( = ?auto_147265 ?auto_147267 ) ) ( not ( = ?auto_147265 ?auto_147261 ) ) ( not ( = ?auto_147265 ?auto_147260 ) ) ( not ( = ?auto_147265 ?auto_147259 ) ) ( not ( = ?auto_147262 ?auto_147264 ) ) ( not ( = ?auto_147262 ?auto_147263 ) ) ( not ( = ?auto_147262 ?auto_147267 ) ) ( not ( = ?auto_147262 ?auto_147261 ) ) ( not ( = ?auto_147262 ?auto_147260 ) ) ( not ( = ?auto_147262 ?auto_147259 ) ) ( not ( = ?auto_147264 ?auto_147263 ) ) ( not ( = ?auto_147264 ?auto_147267 ) ) ( not ( = ?auto_147264 ?auto_147261 ) ) ( not ( = ?auto_147264 ?auto_147260 ) ) ( not ( = ?auto_147264 ?auto_147259 ) ) ( not ( = ?auto_147263 ?auto_147267 ) ) ( not ( = ?auto_147263 ?auto_147261 ) ) ( not ( = ?auto_147263 ?auto_147260 ) ) ( not ( = ?auto_147263 ?auto_147259 ) ) ( not ( = ?auto_147267 ?auto_147261 ) ) ( not ( = ?auto_147267 ?auto_147260 ) ) ( not ( = ?auto_147267 ?auto_147259 ) ) ( ON ?auto_147259 ?auto_147266 ) ( not ( = ?auto_147259 ?auto_147266 ) ) ( not ( = ?auto_147260 ?auto_147266 ) ) ( not ( = ?auto_147261 ?auto_147266 ) ) ( not ( = ?auto_147265 ?auto_147266 ) ) ( not ( = ?auto_147262 ?auto_147266 ) ) ( not ( = ?auto_147264 ?auto_147266 ) ) ( not ( = ?auto_147263 ?auto_147266 ) ) ( not ( = ?auto_147267 ?auto_147266 ) ) ( ON ?auto_147260 ?auto_147259 ) ( ON-TABLE ?auto_147266 ) ( ON ?auto_147261 ?auto_147260 ) ( ON ?auto_147267 ?auto_147261 ) ( ON ?auto_147263 ?auto_147267 ) ( ON ?auto_147264 ?auto_147263 ) ( CLEAR ?auto_147265 ) ( ON ?auto_147262 ?auto_147264 ) ( CLEAR ?auto_147262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147266 ?auto_147259 ?auto_147260 ?auto_147261 ?auto_147267 ?auto_147263 ?auto_147264 )
      ( MAKE-2PILE ?auto_147259 ?auto_147260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147268 - BLOCK
      ?auto_147269 - BLOCK
    )
    :vars
    (
      ?auto_147274 - BLOCK
      ?auto_147271 - BLOCK
      ?auto_147273 - BLOCK
      ?auto_147272 - BLOCK
      ?auto_147276 - BLOCK
      ?auto_147275 - BLOCK
      ?auto_147270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147268 ?auto_147269 ) ) ( not ( = ?auto_147268 ?auto_147274 ) ) ( not ( = ?auto_147269 ?auto_147274 ) ) ( not ( = ?auto_147271 ?auto_147273 ) ) ( not ( = ?auto_147271 ?auto_147272 ) ) ( not ( = ?auto_147271 ?auto_147276 ) ) ( not ( = ?auto_147271 ?auto_147275 ) ) ( not ( = ?auto_147271 ?auto_147274 ) ) ( not ( = ?auto_147271 ?auto_147269 ) ) ( not ( = ?auto_147271 ?auto_147268 ) ) ( not ( = ?auto_147273 ?auto_147272 ) ) ( not ( = ?auto_147273 ?auto_147276 ) ) ( not ( = ?auto_147273 ?auto_147275 ) ) ( not ( = ?auto_147273 ?auto_147274 ) ) ( not ( = ?auto_147273 ?auto_147269 ) ) ( not ( = ?auto_147273 ?auto_147268 ) ) ( not ( = ?auto_147272 ?auto_147276 ) ) ( not ( = ?auto_147272 ?auto_147275 ) ) ( not ( = ?auto_147272 ?auto_147274 ) ) ( not ( = ?auto_147272 ?auto_147269 ) ) ( not ( = ?auto_147272 ?auto_147268 ) ) ( not ( = ?auto_147276 ?auto_147275 ) ) ( not ( = ?auto_147276 ?auto_147274 ) ) ( not ( = ?auto_147276 ?auto_147269 ) ) ( not ( = ?auto_147276 ?auto_147268 ) ) ( not ( = ?auto_147275 ?auto_147274 ) ) ( not ( = ?auto_147275 ?auto_147269 ) ) ( not ( = ?auto_147275 ?auto_147268 ) ) ( ON ?auto_147268 ?auto_147270 ) ( not ( = ?auto_147268 ?auto_147270 ) ) ( not ( = ?auto_147269 ?auto_147270 ) ) ( not ( = ?auto_147274 ?auto_147270 ) ) ( not ( = ?auto_147271 ?auto_147270 ) ) ( not ( = ?auto_147273 ?auto_147270 ) ) ( not ( = ?auto_147272 ?auto_147270 ) ) ( not ( = ?auto_147276 ?auto_147270 ) ) ( not ( = ?auto_147275 ?auto_147270 ) ) ( ON ?auto_147269 ?auto_147268 ) ( ON-TABLE ?auto_147270 ) ( ON ?auto_147274 ?auto_147269 ) ( ON ?auto_147275 ?auto_147274 ) ( ON ?auto_147276 ?auto_147275 ) ( ON ?auto_147272 ?auto_147276 ) ( ON ?auto_147273 ?auto_147272 ) ( CLEAR ?auto_147273 ) ( HOLDING ?auto_147271 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147271 )
      ( MAKE-2PILE ?auto_147268 ?auto_147269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147277 - BLOCK
      ?auto_147278 - BLOCK
    )
    :vars
    (
      ?auto_147281 - BLOCK
      ?auto_147282 - BLOCK
      ?auto_147285 - BLOCK
      ?auto_147283 - BLOCK
      ?auto_147280 - BLOCK
      ?auto_147284 - BLOCK
      ?auto_147279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147277 ?auto_147278 ) ) ( not ( = ?auto_147277 ?auto_147281 ) ) ( not ( = ?auto_147278 ?auto_147281 ) ) ( not ( = ?auto_147282 ?auto_147285 ) ) ( not ( = ?auto_147282 ?auto_147283 ) ) ( not ( = ?auto_147282 ?auto_147280 ) ) ( not ( = ?auto_147282 ?auto_147284 ) ) ( not ( = ?auto_147282 ?auto_147281 ) ) ( not ( = ?auto_147282 ?auto_147278 ) ) ( not ( = ?auto_147282 ?auto_147277 ) ) ( not ( = ?auto_147285 ?auto_147283 ) ) ( not ( = ?auto_147285 ?auto_147280 ) ) ( not ( = ?auto_147285 ?auto_147284 ) ) ( not ( = ?auto_147285 ?auto_147281 ) ) ( not ( = ?auto_147285 ?auto_147278 ) ) ( not ( = ?auto_147285 ?auto_147277 ) ) ( not ( = ?auto_147283 ?auto_147280 ) ) ( not ( = ?auto_147283 ?auto_147284 ) ) ( not ( = ?auto_147283 ?auto_147281 ) ) ( not ( = ?auto_147283 ?auto_147278 ) ) ( not ( = ?auto_147283 ?auto_147277 ) ) ( not ( = ?auto_147280 ?auto_147284 ) ) ( not ( = ?auto_147280 ?auto_147281 ) ) ( not ( = ?auto_147280 ?auto_147278 ) ) ( not ( = ?auto_147280 ?auto_147277 ) ) ( not ( = ?auto_147284 ?auto_147281 ) ) ( not ( = ?auto_147284 ?auto_147278 ) ) ( not ( = ?auto_147284 ?auto_147277 ) ) ( ON ?auto_147277 ?auto_147279 ) ( not ( = ?auto_147277 ?auto_147279 ) ) ( not ( = ?auto_147278 ?auto_147279 ) ) ( not ( = ?auto_147281 ?auto_147279 ) ) ( not ( = ?auto_147282 ?auto_147279 ) ) ( not ( = ?auto_147285 ?auto_147279 ) ) ( not ( = ?auto_147283 ?auto_147279 ) ) ( not ( = ?auto_147280 ?auto_147279 ) ) ( not ( = ?auto_147284 ?auto_147279 ) ) ( ON ?auto_147278 ?auto_147277 ) ( ON-TABLE ?auto_147279 ) ( ON ?auto_147281 ?auto_147278 ) ( ON ?auto_147284 ?auto_147281 ) ( ON ?auto_147280 ?auto_147284 ) ( ON ?auto_147283 ?auto_147280 ) ( ON ?auto_147285 ?auto_147283 ) ( ON ?auto_147282 ?auto_147285 ) ( CLEAR ?auto_147282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147279 ?auto_147277 ?auto_147278 ?auto_147281 ?auto_147284 ?auto_147280 ?auto_147283 ?auto_147285 )
      ( MAKE-2PILE ?auto_147277 ?auto_147278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147291 - BLOCK
      ?auto_147292 - BLOCK
      ?auto_147293 - BLOCK
      ?auto_147294 - BLOCK
      ?auto_147295 - BLOCK
    )
    :vars
    (
      ?auto_147296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147296 ?auto_147295 ) ( CLEAR ?auto_147296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147291 ) ( ON ?auto_147292 ?auto_147291 ) ( ON ?auto_147293 ?auto_147292 ) ( ON ?auto_147294 ?auto_147293 ) ( ON ?auto_147295 ?auto_147294 ) ( not ( = ?auto_147291 ?auto_147292 ) ) ( not ( = ?auto_147291 ?auto_147293 ) ) ( not ( = ?auto_147291 ?auto_147294 ) ) ( not ( = ?auto_147291 ?auto_147295 ) ) ( not ( = ?auto_147291 ?auto_147296 ) ) ( not ( = ?auto_147292 ?auto_147293 ) ) ( not ( = ?auto_147292 ?auto_147294 ) ) ( not ( = ?auto_147292 ?auto_147295 ) ) ( not ( = ?auto_147292 ?auto_147296 ) ) ( not ( = ?auto_147293 ?auto_147294 ) ) ( not ( = ?auto_147293 ?auto_147295 ) ) ( not ( = ?auto_147293 ?auto_147296 ) ) ( not ( = ?auto_147294 ?auto_147295 ) ) ( not ( = ?auto_147294 ?auto_147296 ) ) ( not ( = ?auto_147295 ?auto_147296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147296 ?auto_147295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147297 - BLOCK
      ?auto_147298 - BLOCK
      ?auto_147299 - BLOCK
      ?auto_147300 - BLOCK
      ?auto_147301 - BLOCK
    )
    :vars
    (
      ?auto_147302 - BLOCK
      ?auto_147303 - BLOCK
      ?auto_147304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147302 ?auto_147301 ) ( CLEAR ?auto_147302 ) ( ON-TABLE ?auto_147297 ) ( ON ?auto_147298 ?auto_147297 ) ( ON ?auto_147299 ?auto_147298 ) ( ON ?auto_147300 ?auto_147299 ) ( ON ?auto_147301 ?auto_147300 ) ( not ( = ?auto_147297 ?auto_147298 ) ) ( not ( = ?auto_147297 ?auto_147299 ) ) ( not ( = ?auto_147297 ?auto_147300 ) ) ( not ( = ?auto_147297 ?auto_147301 ) ) ( not ( = ?auto_147297 ?auto_147302 ) ) ( not ( = ?auto_147298 ?auto_147299 ) ) ( not ( = ?auto_147298 ?auto_147300 ) ) ( not ( = ?auto_147298 ?auto_147301 ) ) ( not ( = ?auto_147298 ?auto_147302 ) ) ( not ( = ?auto_147299 ?auto_147300 ) ) ( not ( = ?auto_147299 ?auto_147301 ) ) ( not ( = ?auto_147299 ?auto_147302 ) ) ( not ( = ?auto_147300 ?auto_147301 ) ) ( not ( = ?auto_147300 ?auto_147302 ) ) ( not ( = ?auto_147301 ?auto_147302 ) ) ( HOLDING ?auto_147303 ) ( CLEAR ?auto_147304 ) ( not ( = ?auto_147297 ?auto_147303 ) ) ( not ( = ?auto_147297 ?auto_147304 ) ) ( not ( = ?auto_147298 ?auto_147303 ) ) ( not ( = ?auto_147298 ?auto_147304 ) ) ( not ( = ?auto_147299 ?auto_147303 ) ) ( not ( = ?auto_147299 ?auto_147304 ) ) ( not ( = ?auto_147300 ?auto_147303 ) ) ( not ( = ?auto_147300 ?auto_147304 ) ) ( not ( = ?auto_147301 ?auto_147303 ) ) ( not ( = ?auto_147301 ?auto_147304 ) ) ( not ( = ?auto_147302 ?auto_147303 ) ) ( not ( = ?auto_147302 ?auto_147304 ) ) ( not ( = ?auto_147303 ?auto_147304 ) ) )
    :subtasks
    ( ( !STACK ?auto_147303 ?auto_147304 )
      ( MAKE-5PILE ?auto_147297 ?auto_147298 ?auto_147299 ?auto_147300 ?auto_147301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147305 - BLOCK
      ?auto_147306 - BLOCK
      ?auto_147307 - BLOCK
      ?auto_147308 - BLOCK
      ?auto_147309 - BLOCK
    )
    :vars
    (
      ?auto_147312 - BLOCK
      ?auto_147311 - BLOCK
      ?auto_147310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147312 ?auto_147309 ) ( ON-TABLE ?auto_147305 ) ( ON ?auto_147306 ?auto_147305 ) ( ON ?auto_147307 ?auto_147306 ) ( ON ?auto_147308 ?auto_147307 ) ( ON ?auto_147309 ?auto_147308 ) ( not ( = ?auto_147305 ?auto_147306 ) ) ( not ( = ?auto_147305 ?auto_147307 ) ) ( not ( = ?auto_147305 ?auto_147308 ) ) ( not ( = ?auto_147305 ?auto_147309 ) ) ( not ( = ?auto_147305 ?auto_147312 ) ) ( not ( = ?auto_147306 ?auto_147307 ) ) ( not ( = ?auto_147306 ?auto_147308 ) ) ( not ( = ?auto_147306 ?auto_147309 ) ) ( not ( = ?auto_147306 ?auto_147312 ) ) ( not ( = ?auto_147307 ?auto_147308 ) ) ( not ( = ?auto_147307 ?auto_147309 ) ) ( not ( = ?auto_147307 ?auto_147312 ) ) ( not ( = ?auto_147308 ?auto_147309 ) ) ( not ( = ?auto_147308 ?auto_147312 ) ) ( not ( = ?auto_147309 ?auto_147312 ) ) ( CLEAR ?auto_147311 ) ( not ( = ?auto_147305 ?auto_147310 ) ) ( not ( = ?auto_147305 ?auto_147311 ) ) ( not ( = ?auto_147306 ?auto_147310 ) ) ( not ( = ?auto_147306 ?auto_147311 ) ) ( not ( = ?auto_147307 ?auto_147310 ) ) ( not ( = ?auto_147307 ?auto_147311 ) ) ( not ( = ?auto_147308 ?auto_147310 ) ) ( not ( = ?auto_147308 ?auto_147311 ) ) ( not ( = ?auto_147309 ?auto_147310 ) ) ( not ( = ?auto_147309 ?auto_147311 ) ) ( not ( = ?auto_147312 ?auto_147310 ) ) ( not ( = ?auto_147312 ?auto_147311 ) ) ( not ( = ?auto_147310 ?auto_147311 ) ) ( ON ?auto_147310 ?auto_147312 ) ( CLEAR ?auto_147310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147305 ?auto_147306 ?auto_147307 ?auto_147308 ?auto_147309 ?auto_147312 )
      ( MAKE-5PILE ?auto_147305 ?auto_147306 ?auto_147307 ?auto_147308 ?auto_147309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147313 - BLOCK
      ?auto_147314 - BLOCK
      ?auto_147315 - BLOCK
      ?auto_147316 - BLOCK
      ?auto_147317 - BLOCK
    )
    :vars
    (
      ?auto_147319 - BLOCK
      ?auto_147320 - BLOCK
      ?auto_147318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147319 ?auto_147317 ) ( ON-TABLE ?auto_147313 ) ( ON ?auto_147314 ?auto_147313 ) ( ON ?auto_147315 ?auto_147314 ) ( ON ?auto_147316 ?auto_147315 ) ( ON ?auto_147317 ?auto_147316 ) ( not ( = ?auto_147313 ?auto_147314 ) ) ( not ( = ?auto_147313 ?auto_147315 ) ) ( not ( = ?auto_147313 ?auto_147316 ) ) ( not ( = ?auto_147313 ?auto_147317 ) ) ( not ( = ?auto_147313 ?auto_147319 ) ) ( not ( = ?auto_147314 ?auto_147315 ) ) ( not ( = ?auto_147314 ?auto_147316 ) ) ( not ( = ?auto_147314 ?auto_147317 ) ) ( not ( = ?auto_147314 ?auto_147319 ) ) ( not ( = ?auto_147315 ?auto_147316 ) ) ( not ( = ?auto_147315 ?auto_147317 ) ) ( not ( = ?auto_147315 ?auto_147319 ) ) ( not ( = ?auto_147316 ?auto_147317 ) ) ( not ( = ?auto_147316 ?auto_147319 ) ) ( not ( = ?auto_147317 ?auto_147319 ) ) ( not ( = ?auto_147313 ?auto_147320 ) ) ( not ( = ?auto_147313 ?auto_147318 ) ) ( not ( = ?auto_147314 ?auto_147320 ) ) ( not ( = ?auto_147314 ?auto_147318 ) ) ( not ( = ?auto_147315 ?auto_147320 ) ) ( not ( = ?auto_147315 ?auto_147318 ) ) ( not ( = ?auto_147316 ?auto_147320 ) ) ( not ( = ?auto_147316 ?auto_147318 ) ) ( not ( = ?auto_147317 ?auto_147320 ) ) ( not ( = ?auto_147317 ?auto_147318 ) ) ( not ( = ?auto_147319 ?auto_147320 ) ) ( not ( = ?auto_147319 ?auto_147318 ) ) ( not ( = ?auto_147320 ?auto_147318 ) ) ( ON ?auto_147320 ?auto_147319 ) ( CLEAR ?auto_147320 ) ( HOLDING ?auto_147318 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147318 )
      ( MAKE-5PILE ?auto_147313 ?auto_147314 ?auto_147315 ?auto_147316 ?auto_147317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147321 - BLOCK
      ?auto_147322 - BLOCK
      ?auto_147323 - BLOCK
      ?auto_147324 - BLOCK
      ?auto_147325 - BLOCK
    )
    :vars
    (
      ?auto_147327 - BLOCK
      ?auto_147328 - BLOCK
      ?auto_147326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147327 ?auto_147325 ) ( ON-TABLE ?auto_147321 ) ( ON ?auto_147322 ?auto_147321 ) ( ON ?auto_147323 ?auto_147322 ) ( ON ?auto_147324 ?auto_147323 ) ( ON ?auto_147325 ?auto_147324 ) ( not ( = ?auto_147321 ?auto_147322 ) ) ( not ( = ?auto_147321 ?auto_147323 ) ) ( not ( = ?auto_147321 ?auto_147324 ) ) ( not ( = ?auto_147321 ?auto_147325 ) ) ( not ( = ?auto_147321 ?auto_147327 ) ) ( not ( = ?auto_147322 ?auto_147323 ) ) ( not ( = ?auto_147322 ?auto_147324 ) ) ( not ( = ?auto_147322 ?auto_147325 ) ) ( not ( = ?auto_147322 ?auto_147327 ) ) ( not ( = ?auto_147323 ?auto_147324 ) ) ( not ( = ?auto_147323 ?auto_147325 ) ) ( not ( = ?auto_147323 ?auto_147327 ) ) ( not ( = ?auto_147324 ?auto_147325 ) ) ( not ( = ?auto_147324 ?auto_147327 ) ) ( not ( = ?auto_147325 ?auto_147327 ) ) ( not ( = ?auto_147321 ?auto_147328 ) ) ( not ( = ?auto_147321 ?auto_147326 ) ) ( not ( = ?auto_147322 ?auto_147328 ) ) ( not ( = ?auto_147322 ?auto_147326 ) ) ( not ( = ?auto_147323 ?auto_147328 ) ) ( not ( = ?auto_147323 ?auto_147326 ) ) ( not ( = ?auto_147324 ?auto_147328 ) ) ( not ( = ?auto_147324 ?auto_147326 ) ) ( not ( = ?auto_147325 ?auto_147328 ) ) ( not ( = ?auto_147325 ?auto_147326 ) ) ( not ( = ?auto_147327 ?auto_147328 ) ) ( not ( = ?auto_147327 ?auto_147326 ) ) ( not ( = ?auto_147328 ?auto_147326 ) ) ( ON ?auto_147328 ?auto_147327 ) ( ON ?auto_147326 ?auto_147328 ) ( CLEAR ?auto_147326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147321 ?auto_147322 ?auto_147323 ?auto_147324 ?auto_147325 ?auto_147327 ?auto_147328 )
      ( MAKE-5PILE ?auto_147321 ?auto_147322 ?auto_147323 ?auto_147324 ?auto_147325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147329 - BLOCK
      ?auto_147330 - BLOCK
      ?auto_147331 - BLOCK
      ?auto_147332 - BLOCK
      ?auto_147333 - BLOCK
    )
    :vars
    (
      ?auto_147334 - BLOCK
      ?auto_147336 - BLOCK
      ?auto_147335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147334 ?auto_147333 ) ( ON-TABLE ?auto_147329 ) ( ON ?auto_147330 ?auto_147329 ) ( ON ?auto_147331 ?auto_147330 ) ( ON ?auto_147332 ?auto_147331 ) ( ON ?auto_147333 ?auto_147332 ) ( not ( = ?auto_147329 ?auto_147330 ) ) ( not ( = ?auto_147329 ?auto_147331 ) ) ( not ( = ?auto_147329 ?auto_147332 ) ) ( not ( = ?auto_147329 ?auto_147333 ) ) ( not ( = ?auto_147329 ?auto_147334 ) ) ( not ( = ?auto_147330 ?auto_147331 ) ) ( not ( = ?auto_147330 ?auto_147332 ) ) ( not ( = ?auto_147330 ?auto_147333 ) ) ( not ( = ?auto_147330 ?auto_147334 ) ) ( not ( = ?auto_147331 ?auto_147332 ) ) ( not ( = ?auto_147331 ?auto_147333 ) ) ( not ( = ?auto_147331 ?auto_147334 ) ) ( not ( = ?auto_147332 ?auto_147333 ) ) ( not ( = ?auto_147332 ?auto_147334 ) ) ( not ( = ?auto_147333 ?auto_147334 ) ) ( not ( = ?auto_147329 ?auto_147336 ) ) ( not ( = ?auto_147329 ?auto_147335 ) ) ( not ( = ?auto_147330 ?auto_147336 ) ) ( not ( = ?auto_147330 ?auto_147335 ) ) ( not ( = ?auto_147331 ?auto_147336 ) ) ( not ( = ?auto_147331 ?auto_147335 ) ) ( not ( = ?auto_147332 ?auto_147336 ) ) ( not ( = ?auto_147332 ?auto_147335 ) ) ( not ( = ?auto_147333 ?auto_147336 ) ) ( not ( = ?auto_147333 ?auto_147335 ) ) ( not ( = ?auto_147334 ?auto_147336 ) ) ( not ( = ?auto_147334 ?auto_147335 ) ) ( not ( = ?auto_147336 ?auto_147335 ) ) ( ON ?auto_147336 ?auto_147334 ) ( HOLDING ?auto_147335 ) ( CLEAR ?auto_147336 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147329 ?auto_147330 ?auto_147331 ?auto_147332 ?auto_147333 ?auto_147334 ?auto_147336 ?auto_147335 )
      ( MAKE-5PILE ?auto_147329 ?auto_147330 ?auto_147331 ?auto_147332 ?auto_147333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147337 - BLOCK
      ?auto_147338 - BLOCK
      ?auto_147339 - BLOCK
      ?auto_147340 - BLOCK
      ?auto_147341 - BLOCK
    )
    :vars
    (
      ?auto_147343 - BLOCK
      ?auto_147342 - BLOCK
      ?auto_147344 - BLOCK
      ?auto_147345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147343 ?auto_147341 ) ( ON-TABLE ?auto_147337 ) ( ON ?auto_147338 ?auto_147337 ) ( ON ?auto_147339 ?auto_147338 ) ( ON ?auto_147340 ?auto_147339 ) ( ON ?auto_147341 ?auto_147340 ) ( not ( = ?auto_147337 ?auto_147338 ) ) ( not ( = ?auto_147337 ?auto_147339 ) ) ( not ( = ?auto_147337 ?auto_147340 ) ) ( not ( = ?auto_147337 ?auto_147341 ) ) ( not ( = ?auto_147337 ?auto_147343 ) ) ( not ( = ?auto_147338 ?auto_147339 ) ) ( not ( = ?auto_147338 ?auto_147340 ) ) ( not ( = ?auto_147338 ?auto_147341 ) ) ( not ( = ?auto_147338 ?auto_147343 ) ) ( not ( = ?auto_147339 ?auto_147340 ) ) ( not ( = ?auto_147339 ?auto_147341 ) ) ( not ( = ?auto_147339 ?auto_147343 ) ) ( not ( = ?auto_147340 ?auto_147341 ) ) ( not ( = ?auto_147340 ?auto_147343 ) ) ( not ( = ?auto_147341 ?auto_147343 ) ) ( not ( = ?auto_147337 ?auto_147342 ) ) ( not ( = ?auto_147337 ?auto_147344 ) ) ( not ( = ?auto_147338 ?auto_147342 ) ) ( not ( = ?auto_147338 ?auto_147344 ) ) ( not ( = ?auto_147339 ?auto_147342 ) ) ( not ( = ?auto_147339 ?auto_147344 ) ) ( not ( = ?auto_147340 ?auto_147342 ) ) ( not ( = ?auto_147340 ?auto_147344 ) ) ( not ( = ?auto_147341 ?auto_147342 ) ) ( not ( = ?auto_147341 ?auto_147344 ) ) ( not ( = ?auto_147343 ?auto_147342 ) ) ( not ( = ?auto_147343 ?auto_147344 ) ) ( not ( = ?auto_147342 ?auto_147344 ) ) ( ON ?auto_147342 ?auto_147343 ) ( CLEAR ?auto_147342 ) ( ON ?auto_147344 ?auto_147345 ) ( CLEAR ?auto_147344 ) ( HAND-EMPTY ) ( not ( = ?auto_147337 ?auto_147345 ) ) ( not ( = ?auto_147338 ?auto_147345 ) ) ( not ( = ?auto_147339 ?auto_147345 ) ) ( not ( = ?auto_147340 ?auto_147345 ) ) ( not ( = ?auto_147341 ?auto_147345 ) ) ( not ( = ?auto_147343 ?auto_147345 ) ) ( not ( = ?auto_147342 ?auto_147345 ) ) ( not ( = ?auto_147344 ?auto_147345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147344 ?auto_147345 )
      ( MAKE-5PILE ?auto_147337 ?auto_147338 ?auto_147339 ?auto_147340 ?auto_147341 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147346 - BLOCK
      ?auto_147347 - BLOCK
      ?auto_147348 - BLOCK
      ?auto_147349 - BLOCK
      ?auto_147350 - BLOCK
    )
    :vars
    (
      ?auto_147352 - BLOCK
      ?auto_147354 - BLOCK
      ?auto_147351 - BLOCK
      ?auto_147353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147352 ?auto_147350 ) ( ON-TABLE ?auto_147346 ) ( ON ?auto_147347 ?auto_147346 ) ( ON ?auto_147348 ?auto_147347 ) ( ON ?auto_147349 ?auto_147348 ) ( ON ?auto_147350 ?auto_147349 ) ( not ( = ?auto_147346 ?auto_147347 ) ) ( not ( = ?auto_147346 ?auto_147348 ) ) ( not ( = ?auto_147346 ?auto_147349 ) ) ( not ( = ?auto_147346 ?auto_147350 ) ) ( not ( = ?auto_147346 ?auto_147352 ) ) ( not ( = ?auto_147347 ?auto_147348 ) ) ( not ( = ?auto_147347 ?auto_147349 ) ) ( not ( = ?auto_147347 ?auto_147350 ) ) ( not ( = ?auto_147347 ?auto_147352 ) ) ( not ( = ?auto_147348 ?auto_147349 ) ) ( not ( = ?auto_147348 ?auto_147350 ) ) ( not ( = ?auto_147348 ?auto_147352 ) ) ( not ( = ?auto_147349 ?auto_147350 ) ) ( not ( = ?auto_147349 ?auto_147352 ) ) ( not ( = ?auto_147350 ?auto_147352 ) ) ( not ( = ?auto_147346 ?auto_147354 ) ) ( not ( = ?auto_147346 ?auto_147351 ) ) ( not ( = ?auto_147347 ?auto_147354 ) ) ( not ( = ?auto_147347 ?auto_147351 ) ) ( not ( = ?auto_147348 ?auto_147354 ) ) ( not ( = ?auto_147348 ?auto_147351 ) ) ( not ( = ?auto_147349 ?auto_147354 ) ) ( not ( = ?auto_147349 ?auto_147351 ) ) ( not ( = ?auto_147350 ?auto_147354 ) ) ( not ( = ?auto_147350 ?auto_147351 ) ) ( not ( = ?auto_147352 ?auto_147354 ) ) ( not ( = ?auto_147352 ?auto_147351 ) ) ( not ( = ?auto_147354 ?auto_147351 ) ) ( ON ?auto_147351 ?auto_147353 ) ( CLEAR ?auto_147351 ) ( not ( = ?auto_147346 ?auto_147353 ) ) ( not ( = ?auto_147347 ?auto_147353 ) ) ( not ( = ?auto_147348 ?auto_147353 ) ) ( not ( = ?auto_147349 ?auto_147353 ) ) ( not ( = ?auto_147350 ?auto_147353 ) ) ( not ( = ?auto_147352 ?auto_147353 ) ) ( not ( = ?auto_147354 ?auto_147353 ) ) ( not ( = ?auto_147351 ?auto_147353 ) ) ( HOLDING ?auto_147354 ) ( CLEAR ?auto_147352 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147346 ?auto_147347 ?auto_147348 ?auto_147349 ?auto_147350 ?auto_147352 ?auto_147354 )
      ( MAKE-5PILE ?auto_147346 ?auto_147347 ?auto_147348 ?auto_147349 ?auto_147350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147355 - BLOCK
      ?auto_147356 - BLOCK
      ?auto_147357 - BLOCK
      ?auto_147358 - BLOCK
      ?auto_147359 - BLOCK
    )
    :vars
    (
      ?auto_147362 - BLOCK
      ?auto_147361 - BLOCK
      ?auto_147360 - BLOCK
      ?auto_147363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147362 ?auto_147359 ) ( ON-TABLE ?auto_147355 ) ( ON ?auto_147356 ?auto_147355 ) ( ON ?auto_147357 ?auto_147356 ) ( ON ?auto_147358 ?auto_147357 ) ( ON ?auto_147359 ?auto_147358 ) ( not ( = ?auto_147355 ?auto_147356 ) ) ( not ( = ?auto_147355 ?auto_147357 ) ) ( not ( = ?auto_147355 ?auto_147358 ) ) ( not ( = ?auto_147355 ?auto_147359 ) ) ( not ( = ?auto_147355 ?auto_147362 ) ) ( not ( = ?auto_147356 ?auto_147357 ) ) ( not ( = ?auto_147356 ?auto_147358 ) ) ( not ( = ?auto_147356 ?auto_147359 ) ) ( not ( = ?auto_147356 ?auto_147362 ) ) ( not ( = ?auto_147357 ?auto_147358 ) ) ( not ( = ?auto_147357 ?auto_147359 ) ) ( not ( = ?auto_147357 ?auto_147362 ) ) ( not ( = ?auto_147358 ?auto_147359 ) ) ( not ( = ?auto_147358 ?auto_147362 ) ) ( not ( = ?auto_147359 ?auto_147362 ) ) ( not ( = ?auto_147355 ?auto_147361 ) ) ( not ( = ?auto_147355 ?auto_147360 ) ) ( not ( = ?auto_147356 ?auto_147361 ) ) ( not ( = ?auto_147356 ?auto_147360 ) ) ( not ( = ?auto_147357 ?auto_147361 ) ) ( not ( = ?auto_147357 ?auto_147360 ) ) ( not ( = ?auto_147358 ?auto_147361 ) ) ( not ( = ?auto_147358 ?auto_147360 ) ) ( not ( = ?auto_147359 ?auto_147361 ) ) ( not ( = ?auto_147359 ?auto_147360 ) ) ( not ( = ?auto_147362 ?auto_147361 ) ) ( not ( = ?auto_147362 ?auto_147360 ) ) ( not ( = ?auto_147361 ?auto_147360 ) ) ( ON ?auto_147360 ?auto_147363 ) ( not ( = ?auto_147355 ?auto_147363 ) ) ( not ( = ?auto_147356 ?auto_147363 ) ) ( not ( = ?auto_147357 ?auto_147363 ) ) ( not ( = ?auto_147358 ?auto_147363 ) ) ( not ( = ?auto_147359 ?auto_147363 ) ) ( not ( = ?auto_147362 ?auto_147363 ) ) ( not ( = ?auto_147361 ?auto_147363 ) ) ( not ( = ?auto_147360 ?auto_147363 ) ) ( CLEAR ?auto_147362 ) ( ON ?auto_147361 ?auto_147360 ) ( CLEAR ?auto_147361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147363 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147363 ?auto_147360 )
      ( MAKE-5PILE ?auto_147355 ?auto_147356 ?auto_147357 ?auto_147358 ?auto_147359 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147382 - BLOCK
      ?auto_147383 - BLOCK
      ?auto_147384 - BLOCK
      ?auto_147385 - BLOCK
      ?auto_147386 - BLOCK
    )
    :vars
    (
      ?auto_147388 - BLOCK
      ?auto_147390 - BLOCK
      ?auto_147387 - BLOCK
      ?auto_147389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147382 ) ( ON ?auto_147383 ?auto_147382 ) ( ON ?auto_147384 ?auto_147383 ) ( ON ?auto_147385 ?auto_147384 ) ( not ( = ?auto_147382 ?auto_147383 ) ) ( not ( = ?auto_147382 ?auto_147384 ) ) ( not ( = ?auto_147382 ?auto_147385 ) ) ( not ( = ?auto_147382 ?auto_147386 ) ) ( not ( = ?auto_147382 ?auto_147388 ) ) ( not ( = ?auto_147383 ?auto_147384 ) ) ( not ( = ?auto_147383 ?auto_147385 ) ) ( not ( = ?auto_147383 ?auto_147386 ) ) ( not ( = ?auto_147383 ?auto_147388 ) ) ( not ( = ?auto_147384 ?auto_147385 ) ) ( not ( = ?auto_147384 ?auto_147386 ) ) ( not ( = ?auto_147384 ?auto_147388 ) ) ( not ( = ?auto_147385 ?auto_147386 ) ) ( not ( = ?auto_147385 ?auto_147388 ) ) ( not ( = ?auto_147386 ?auto_147388 ) ) ( not ( = ?auto_147382 ?auto_147390 ) ) ( not ( = ?auto_147382 ?auto_147387 ) ) ( not ( = ?auto_147383 ?auto_147390 ) ) ( not ( = ?auto_147383 ?auto_147387 ) ) ( not ( = ?auto_147384 ?auto_147390 ) ) ( not ( = ?auto_147384 ?auto_147387 ) ) ( not ( = ?auto_147385 ?auto_147390 ) ) ( not ( = ?auto_147385 ?auto_147387 ) ) ( not ( = ?auto_147386 ?auto_147390 ) ) ( not ( = ?auto_147386 ?auto_147387 ) ) ( not ( = ?auto_147388 ?auto_147390 ) ) ( not ( = ?auto_147388 ?auto_147387 ) ) ( not ( = ?auto_147390 ?auto_147387 ) ) ( ON ?auto_147387 ?auto_147389 ) ( not ( = ?auto_147382 ?auto_147389 ) ) ( not ( = ?auto_147383 ?auto_147389 ) ) ( not ( = ?auto_147384 ?auto_147389 ) ) ( not ( = ?auto_147385 ?auto_147389 ) ) ( not ( = ?auto_147386 ?auto_147389 ) ) ( not ( = ?auto_147388 ?auto_147389 ) ) ( not ( = ?auto_147390 ?auto_147389 ) ) ( not ( = ?auto_147387 ?auto_147389 ) ) ( ON ?auto_147390 ?auto_147387 ) ( ON-TABLE ?auto_147389 ) ( ON ?auto_147388 ?auto_147390 ) ( CLEAR ?auto_147388 ) ( HOLDING ?auto_147386 ) ( CLEAR ?auto_147385 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147382 ?auto_147383 ?auto_147384 ?auto_147385 ?auto_147386 ?auto_147388 )
      ( MAKE-5PILE ?auto_147382 ?auto_147383 ?auto_147384 ?auto_147385 ?auto_147386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147391 - BLOCK
      ?auto_147392 - BLOCK
      ?auto_147393 - BLOCK
      ?auto_147394 - BLOCK
      ?auto_147395 - BLOCK
    )
    :vars
    (
      ?auto_147397 - BLOCK
      ?auto_147399 - BLOCK
      ?auto_147396 - BLOCK
      ?auto_147398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147391 ) ( ON ?auto_147392 ?auto_147391 ) ( ON ?auto_147393 ?auto_147392 ) ( ON ?auto_147394 ?auto_147393 ) ( not ( = ?auto_147391 ?auto_147392 ) ) ( not ( = ?auto_147391 ?auto_147393 ) ) ( not ( = ?auto_147391 ?auto_147394 ) ) ( not ( = ?auto_147391 ?auto_147395 ) ) ( not ( = ?auto_147391 ?auto_147397 ) ) ( not ( = ?auto_147392 ?auto_147393 ) ) ( not ( = ?auto_147392 ?auto_147394 ) ) ( not ( = ?auto_147392 ?auto_147395 ) ) ( not ( = ?auto_147392 ?auto_147397 ) ) ( not ( = ?auto_147393 ?auto_147394 ) ) ( not ( = ?auto_147393 ?auto_147395 ) ) ( not ( = ?auto_147393 ?auto_147397 ) ) ( not ( = ?auto_147394 ?auto_147395 ) ) ( not ( = ?auto_147394 ?auto_147397 ) ) ( not ( = ?auto_147395 ?auto_147397 ) ) ( not ( = ?auto_147391 ?auto_147399 ) ) ( not ( = ?auto_147391 ?auto_147396 ) ) ( not ( = ?auto_147392 ?auto_147399 ) ) ( not ( = ?auto_147392 ?auto_147396 ) ) ( not ( = ?auto_147393 ?auto_147399 ) ) ( not ( = ?auto_147393 ?auto_147396 ) ) ( not ( = ?auto_147394 ?auto_147399 ) ) ( not ( = ?auto_147394 ?auto_147396 ) ) ( not ( = ?auto_147395 ?auto_147399 ) ) ( not ( = ?auto_147395 ?auto_147396 ) ) ( not ( = ?auto_147397 ?auto_147399 ) ) ( not ( = ?auto_147397 ?auto_147396 ) ) ( not ( = ?auto_147399 ?auto_147396 ) ) ( ON ?auto_147396 ?auto_147398 ) ( not ( = ?auto_147391 ?auto_147398 ) ) ( not ( = ?auto_147392 ?auto_147398 ) ) ( not ( = ?auto_147393 ?auto_147398 ) ) ( not ( = ?auto_147394 ?auto_147398 ) ) ( not ( = ?auto_147395 ?auto_147398 ) ) ( not ( = ?auto_147397 ?auto_147398 ) ) ( not ( = ?auto_147399 ?auto_147398 ) ) ( not ( = ?auto_147396 ?auto_147398 ) ) ( ON ?auto_147399 ?auto_147396 ) ( ON-TABLE ?auto_147398 ) ( ON ?auto_147397 ?auto_147399 ) ( CLEAR ?auto_147394 ) ( ON ?auto_147395 ?auto_147397 ) ( CLEAR ?auto_147395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147398 ?auto_147396 ?auto_147399 ?auto_147397 )
      ( MAKE-5PILE ?auto_147391 ?auto_147392 ?auto_147393 ?auto_147394 ?auto_147395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147400 - BLOCK
      ?auto_147401 - BLOCK
      ?auto_147402 - BLOCK
      ?auto_147403 - BLOCK
      ?auto_147404 - BLOCK
    )
    :vars
    (
      ?auto_147408 - BLOCK
      ?auto_147405 - BLOCK
      ?auto_147406 - BLOCK
      ?auto_147407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147400 ) ( ON ?auto_147401 ?auto_147400 ) ( ON ?auto_147402 ?auto_147401 ) ( not ( = ?auto_147400 ?auto_147401 ) ) ( not ( = ?auto_147400 ?auto_147402 ) ) ( not ( = ?auto_147400 ?auto_147403 ) ) ( not ( = ?auto_147400 ?auto_147404 ) ) ( not ( = ?auto_147400 ?auto_147408 ) ) ( not ( = ?auto_147401 ?auto_147402 ) ) ( not ( = ?auto_147401 ?auto_147403 ) ) ( not ( = ?auto_147401 ?auto_147404 ) ) ( not ( = ?auto_147401 ?auto_147408 ) ) ( not ( = ?auto_147402 ?auto_147403 ) ) ( not ( = ?auto_147402 ?auto_147404 ) ) ( not ( = ?auto_147402 ?auto_147408 ) ) ( not ( = ?auto_147403 ?auto_147404 ) ) ( not ( = ?auto_147403 ?auto_147408 ) ) ( not ( = ?auto_147404 ?auto_147408 ) ) ( not ( = ?auto_147400 ?auto_147405 ) ) ( not ( = ?auto_147400 ?auto_147406 ) ) ( not ( = ?auto_147401 ?auto_147405 ) ) ( not ( = ?auto_147401 ?auto_147406 ) ) ( not ( = ?auto_147402 ?auto_147405 ) ) ( not ( = ?auto_147402 ?auto_147406 ) ) ( not ( = ?auto_147403 ?auto_147405 ) ) ( not ( = ?auto_147403 ?auto_147406 ) ) ( not ( = ?auto_147404 ?auto_147405 ) ) ( not ( = ?auto_147404 ?auto_147406 ) ) ( not ( = ?auto_147408 ?auto_147405 ) ) ( not ( = ?auto_147408 ?auto_147406 ) ) ( not ( = ?auto_147405 ?auto_147406 ) ) ( ON ?auto_147406 ?auto_147407 ) ( not ( = ?auto_147400 ?auto_147407 ) ) ( not ( = ?auto_147401 ?auto_147407 ) ) ( not ( = ?auto_147402 ?auto_147407 ) ) ( not ( = ?auto_147403 ?auto_147407 ) ) ( not ( = ?auto_147404 ?auto_147407 ) ) ( not ( = ?auto_147408 ?auto_147407 ) ) ( not ( = ?auto_147405 ?auto_147407 ) ) ( not ( = ?auto_147406 ?auto_147407 ) ) ( ON ?auto_147405 ?auto_147406 ) ( ON-TABLE ?auto_147407 ) ( ON ?auto_147408 ?auto_147405 ) ( ON ?auto_147404 ?auto_147408 ) ( CLEAR ?auto_147404 ) ( HOLDING ?auto_147403 ) ( CLEAR ?auto_147402 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147400 ?auto_147401 ?auto_147402 ?auto_147403 )
      ( MAKE-5PILE ?auto_147400 ?auto_147401 ?auto_147402 ?auto_147403 ?auto_147404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147409 - BLOCK
      ?auto_147410 - BLOCK
      ?auto_147411 - BLOCK
      ?auto_147412 - BLOCK
      ?auto_147413 - BLOCK
    )
    :vars
    (
      ?auto_147414 - BLOCK
      ?auto_147416 - BLOCK
      ?auto_147417 - BLOCK
      ?auto_147415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147409 ) ( ON ?auto_147410 ?auto_147409 ) ( ON ?auto_147411 ?auto_147410 ) ( not ( = ?auto_147409 ?auto_147410 ) ) ( not ( = ?auto_147409 ?auto_147411 ) ) ( not ( = ?auto_147409 ?auto_147412 ) ) ( not ( = ?auto_147409 ?auto_147413 ) ) ( not ( = ?auto_147409 ?auto_147414 ) ) ( not ( = ?auto_147410 ?auto_147411 ) ) ( not ( = ?auto_147410 ?auto_147412 ) ) ( not ( = ?auto_147410 ?auto_147413 ) ) ( not ( = ?auto_147410 ?auto_147414 ) ) ( not ( = ?auto_147411 ?auto_147412 ) ) ( not ( = ?auto_147411 ?auto_147413 ) ) ( not ( = ?auto_147411 ?auto_147414 ) ) ( not ( = ?auto_147412 ?auto_147413 ) ) ( not ( = ?auto_147412 ?auto_147414 ) ) ( not ( = ?auto_147413 ?auto_147414 ) ) ( not ( = ?auto_147409 ?auto_147416 ) ) ( not ( = ?auto_147409 ?auto_147417 ) ) ( not ( = ?auto_147410 ?auto_147416 ) ) ( not ( = ?auto_147410 ?auto_147417 ) ) ( not ( = ?auto_147411 ?auto_147416 ) ) ( not ( = ?auto_147411 ?auto_147417 ) ) ( not ( = ?auto_147412 ?auto_147416 ) ) ( not ( = ?auto_147412 ?auto_147417 ) ) ( not ( = ?auto_147413 ?auto_147416 ) ) ( not ( = ?auto_147413 ?auto_147417 ) ) ( not ( = ?auto_147414 ?auto_147416 ) ) ( not ( = ?auto_147414 ?auto_147417 ) ) ( not ( = ?auto_147416 ?auto_147417 ) ) ( ON ?auto_147417 ?auto_147415 ) ( not ( = ?auto_147409 ?auto_147415 ) ) ( not ( = ?auto_147410 ?auto_147415 ) ) ( not ( = ?auto_147411 ?auto_147415 ) ) ( not ( = ?auto_147412 ?auto_147415 ) ) ( not ( = ?auto_147413 ?auto_147415 ) ) ( not ( = ?auto_147414 ?auto_147415 ) ) ( not ( = ?auto_147416 ?auto_147415 ) ) ( not ( = ?auto_147417 ?auto_147415 ) ) ( ON ?auto_147416 ?auto_147417 ) ( ON-TABLE ?auto_147415 ) ( ON ?auto_147414 ?auto_147416 ) ( ON ?auto_147413 ?auto_147414 ) ( CLEAR ?auto_147411 ) ( ON ?auto_147412 ?auto_147413 ) ( CLEAR ?auto_147412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147415 ?auto_147417 ?auto_147416 ?auto_147414 ?auto_147413 )
      ( MAKE-5PILE ?auto_147409 ?auto_147410 ?auto_147411 ?auto_147412 ?auto_147413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147418 - BLOCK
      ?auto_147419 - BLOCK
      ?auto_147420 - BLOCK
      ?auto_147421 - BLOCK
      ?auto_147422 - BLOCK
    )
    :vars
    (
      ?auto_147423 - BLOCK
      ?auto_147424 - BLOCK
      ?auto_147425 - BLOCK
      ?auto_147426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147418 ) ( ON ?auto_147419 ?auto_147418 ) ( not ( = ?auto_147418 ?auto_147419 ) ) ( not ( = ?auto_147418 ?auto_147420 ) ) ( not ( = ?auto_147418 ?auto_147421 ) ) ( not ( = ?auto_147418 ?auto_147422 ) ) ( not ( = ?auto_147418 ?auto_147423 ) ) ( not ( = ?auto_147419 ?auto_147420 ) ) ( not ( = ?auto_147419 ?auto_147421 ) ) ( not ( = ?auto_147419 ?auto_147422 ) ) ( not ( = ?auto_147419 ?auto_147423 ) ) ( not ( = ?auto_147420 ?auto_147421 ) ) ( not ( = ?auto_147420 ?auto_147422 ) ) ( not ( = ?auto_147420 ?auto_147423 ) ) ( not ( = ?auto_147421 ?auto_147422 ) ) ( not ( = ?auto_147421 ?auto_147423 ) ) ( not ( = ?auto_147422 ?auto_147423 ) ) ( not ( = ?auto_147418 ?auto_147424 ) ) ( not ( = ?auto_147418 ?auto_147425 ) ) ( not ( = ?auto_147419 ?auto_147424 ) ) ( not ( = ?auto_147419 ?auto_147425 ) ) ( not ( = ?auto_147420 ?auto_147424 ) ) ( not ( = ?auto_147420 ?auto_147425 ) ) ( not ( = ?auto_147421 ?auto_147424 ) ) ( not ( = ?auto_147421 ?auto_147425 ) ) ( not ( = ?auto_147422 ?auto_147424 ) ) ( not ( = ?auto_147422 ?auto_147425 ) ) ( not ( = ?auto_147423 ?auto_147424 ) ) ( not ( = ?auto_147423 ?auto_147425 ) ) ( not ( = ?auto_147424 ?auto_147425 ) ) ( ON ?auto_147425 ?auto_147426 ) ( not ( = ?auto_147418 ?auto_147426 ) ) ( not ( = ?auto_147419 ?auto_147426 ) ) ( not ( = ?auto_147420 ?auto_147426 ) ) ( not ( = ?auto_147421 ?auto_147426 ) ) ( not ( = ?auto_147422 ?auto_147426 ) ) ( not ( = ?auto_147423 ?auto_147426 ) ) ( not ( = ?auto_147424 ?auto_147426 ) ) ( not ( = ?auto_147425 ?auto_147426 ) ) ( ON ?auto_147424 ?auto_147425 ) ( ON-TABLE ?auto_147426 ) ( ON ?auto_147423 ?auto_147424 ) ( ON ?auto_147422 ?auto_147423 ) ( ON ?auto_147421 ?auto_147422 ) ( CLEAR ?auto_147421 ) ( HOLDING ?auto_147420 ) ( CLEAR ?auto_147419 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147418 ?auto_147419 ?auto_147420 )
      ( MAKE-5PILE ?auto_147418 ?auto_147419 ?auto_147420 ?auto_147421 ?auto_147422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147427 - BLOCK
      ?auto_147428 - BLOCK
      ?auto_147429 - BLOCK
      ?auto_147430 - BLOCK
      ?auto_147431 - BLOCK
    )
    :vars
    (
      ?auto_147435 - BLOCK
      ?auto_147433 - BLOCK
      ?auto_147432 - BLOCK
      ?auto_147434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147427 ) ( ON ?auto_147428 ?auto_147427 ) ( not ( = ?auto_147427 ?auto_147428 ) ) ( not ( = ?auto_147427 ?auto_147429 ) ) ( not ( = ?auto_147427 ?auto_147430 ) ) ( not ( = ?auto_147427 ?auto_147431 ) ) ( not ( = ?auto_147427 ?auto_147435 ) ) ( not ( = ?auto_147428 ?auto_147429 ) ) ( not ( = ?auto_147428 ?auto_147430 ) ) ( not ( = ?auto_147428 ?auto_147431 ) ) ( not ( = ?auto_147428 ?auto_147435 ) ) ( not ( = ?auto_147429 ?auto_147430 ) ) ( not ( = ?auto_147429 ?auto_147431 ) ) ( not ( = ?auto_147429 ?auto_147435 ) ) ( not ( = ?auto_147430 ?auto_147431 ) ) ( not ( = ?auto_147430 ?auto_147435 ) ) ( not ( = ?auto_147431 ?auto_147435 ) ) ( not ( = ?auto_147427 ?auto_147433 ) ) ( not ( = ?auto_147427 ?auto_147432 ) ) ( not ( = ?auto_147428 ?auto_147433 ) ) ( not ( = ?auto_147428 ?auto_147432 ) ) ( not ( = ?auto_147429 ?auto_147433 ) ) ( not ( = ?auto_147429 ?auto_147432 ) ) ( not ( = ?auto_147430 ?auto_147433 ) ) ( not ( = ?auto_147430 ?auto_147432 ) ) ( not ( = ?auto_147431 ?auto_147433 ) ) ( not ( = ?auto_147431 ?auto_147432 ) ) ( not ( = ?auto_147435 ?auto_147433 ) ) ( not ( = ?auto_147435 ?auto_147432 ) ) ( not ( = ?auto_147433 ?auto_147432 ) ) ( ON ?auto_147432 ?auto_147434 ) ( not ( = ?auto_147427 ?auto_147434 ) ) ( not ( = ?auto_147428 ?auto_147434 ) ) ( not ( = ?auto_147429 ?auto_147434 ) ) ( not ( = ?auto_147430 ?auto_147434 ) ) ( not ( = ?auto_147431 ?auto_147434 ) ) ( not ( = ?auto_147435 ?auto_147434 ) ) ( not ( = ?auto_147433 ?auto_147434 ) ) ( not ( = ?auto_147432 ?auto_147434 ) ) ( ON ?auto_147433 ?auto_147432 ) ( ON-TABLE ?auto_147434 ) ( ON ?auto_147435 ?auto_147433 ) ( ON ?auto_147431 ?auto_147435 ) ( ON ?auto_147430 ?auto_147431 ) ( CLEAR ?auto_147428 ) ( ON ?auto_147429 ?auto_147430 ) ( CLEAR ?auto_147429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147434 ?auto_147432 ?auto_147433 ?auto_147435 ?auto_147431 ?auto_147430 )
      ( MAKE-5PILE ?auto_147427 ?auto_147428 ?auto_147429 ?auto_147430 ?auto_147431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147436 - BLOCK
      ?auto_147437 - BLOCK
      ?auto_147438 - BLOCK
      ?auto_147439 - BLOCK
      ?auto_147440 - BLOCK
    )
    :vars
    (
      ?auto_147444 - BLOCK
      ?auto_147443 - BLOCK
      ?auto_147441 - BLOCK
      ?auto_147442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147436 ) ( not ( = ?auto_147436 ?auto_147437 ) ) ( not ( = ?auto_147436 ?auto_147438 ) ) ( not ( = ?auto_147436 ?auto_147439 ) ) ( not ( = ?auto_147436 ?auto_147440 ) ) ( not ( = ?auto_147436 ?auto_147444 ) ) ( not ( = ?auto_147437 ?auto_147438 ) ) ( not ( = ?auto_147437 ?auto_147439 ) ) ( not ( = ?auto_147437 ?auto_147440 ) ) ( not ( = ?auto_147437 ?auto_147444 ) ) ( not ( = ?auto_147438 ?auto_147439 ) ) ( not ( = ?auto_147438 ?auto_147440 ) ) ( not ( = ?auto_147438 ?auto_147444 ) ) ( not ( = ?auto_147439 ?auto_147440 ) ) ( not ( = ?auto_147439 ?auto_147444 ) ) ( not ( = ?auto_147440 ?auto_147444 ) ) ( not ( = ?auto_147436 ?auto_147443 ) ) ( not ( = ?auto_147436 ?auto_147441 ) ) ( not ( = ?auto_147437 ?auto_147443 ) ) ( not ( = ?auto_147437 ?auto_147441 ) ) ( not ( = ?auto_147438 ?auto_147443 ) ) ( not ( = ?auto_147438 ?auto_147441 ) ) ( not ( = ?auto_147439 ?auto_147443 ) ) ( not ( = ?auto_147439 ?auto_147441 ) ) ( not ( = ?auto_147440 ?auto_147443 ) ) ( not ( = ?auto_147440 ?auto_147441 ) ) ( not ( = ?auto_147444 ?auto_147443 ) ) ( not ( = ?auto_147444 ?auto_147441 ) ) ( not ( = ?auto_147443 ?auto_147441 ) ) ( ON ?auto_147441 ?auto_147442 ) ( not ( = ?auto_147436 ?auto_147442 ) ) ( not ( = ?auto_147437 ?auto_147442 ) ) ( not ( = ?auto_147438 ?auto_147442 ) ) ( not ( = ?auto_147439 ?auto_147442 ) ) ( not ( = ?auto_147440 ?auto_147442 ) ) ( not ( = ?auto_147444 ?auto_147442 ) ) ( not ( = ?auto_147443 ?auto_147442 ) ) ( not ( = ?auto_147441 ?auto_147442 ) ) ( ON ?auto_147443 ?auto_147441 ) ( ON-TABLE ?auto_147442 ) ( ON ?auto_147444 ?auto_147443 ) ( ON ?auto_147440 ?auto_147444 ) ( ON ?auto_147439 ?auto_147440 ) ( ON ?auto_147438 ?auto_147439 ) ( CLEAR ?auto_147438 ) ( HOLDING ?auto_147437 ) ( CLEAR ?auto_147436 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147436 ?auto_147437 )
      ( MAKE-5PILE ?auto_147436 ?auto_147437 ?auto_147438 ?auto_147439 ?auto_147440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147445 - BLOCK
      ?auto_147446 - BLOCK
      ?auto_147447 - BLOCK
      ?auto_147448 - BLOCK
      ?auto_147449 - BLOCK
    )
    :vars
    (
      ?auto_147451 - BLOCK
      ?auto_147450 - BLOCK
      ?auto_147453 - BLOCK
      ?auto_147452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147445 ) ( not ( = ?auto_147445 ?auto_147446 ) ) ( not ( = ?auto_147445 ?auto_147447 ) ) ( not ( = ?auto_147445 ?auto_147448 ) ) ( not ( = ?auto_147445 ?auto_147449 ) ) ( not ( = ?auto_147445 ?auto_147451 ) ) ( not ( = ?auto_147446 ?auto_147447 ) ) ( not ( = ?auto_147446 ?auto_147448 ) ) ( not ( = ?auto_147446 ?auto_147449 ) ) ( not ( = ?auto_147446 ?auto_147451 ) ) ( not ( = ?auto_147447 ?auto_147448 ) ) ( not ( = ?auto_147447 ?auto_147449 ) ) ( not ( = ?auto_147447 ?auto_147451 ) ) ( not ( = ?auto_147448 ?auto_147449 ) ) ( not ( = ?auto_147448 ?auto_147451 ) ) ( not ( = ?auto_147449 ?auto_147451 ) ) ( not ( = ?auto_147445 ?auto_147450 ) ) ( not ( = ?auto_147445 ?auto_147453 ) ) ( not ( = ?auto_147446 ?auto_147450 ) ) ( not ( = ?auto_147446 ?auto_147453 ) ) ( not ( = ?auto_147447 ?auto_147450 ) ) ( not ( = ?auto_147447 ?auto_147453 ) ) ( not ( = ?auto_147448 ?auto_147450 ) ) ( not ( = ?auto_147448 ?auto_147453 ) ) ( not ( = ?auto_147449 ?auto_147450 ) ) ( not ( = ?auto_147449 ?auto_147453 ) ) ( not ( = ?auto_147451 ?auto_147450 ) ) ( not ( = ?auto_147451 ?auto_147453 ) ) ( not ( = ?auto_147450 ?auto_147453 ) ) ( ON ?auto_147453 ?auto_147452 ) ( not ( = ?auto_147445 ?auto_147452 ) ) ( not ( = ?auto_147446 ?auto_147452 ) ) ( not ( = ?auto_147447 ?auto_147452 ) ) ( not ( = ?auto_147448 ?auto_147452 ) ) ( not ( = ?auto_147449 ?auto_147452 ) ) ( not ( = ?auto_147451 ?auto_147452 ) ) ( not ( = ?auto_147450 ?auto_147452 ) ) ( not ( = ?auto_147453 ?auto_147452 ) ) ( ON ?auto_147450 ?auto_147453 ) ( ON-TABLE ?auto_147452 ) ( ON ?auto_147451 ?auto_147450 ) ( ON ?auto_147449 ?auto_147451 ) ( ON ?auto_147448 ?auto_147449 ) ( ON ?auto_147447 ?auto_147448 ) ( CLEAR ?auto_147445 ) ( ON ?auto_147446 ?auto_147447 ) ( CLEAR ?auto_147446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147452 ?auto_147453 ?auto_147450 ?auto_147451 ?auto_147449 ?auto_147448 ?auto_147447 )
      ( MAKE-5PILE ?auto_147445 ?auto_147446 ?auto_147447 ?auto_147448 ?auto_147449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147454 - BLOCK
      ?auto_147455 - BLOCK
      ?auto_147456 - BLOCK
      ?auto_147457 - BLOCK
      ?auto_147458 - BLOCK
    )
    :vars
    (
      ?auto_147462 - BLOCK
      ?auto_147461 - BLOCK
      ?auto_147460 - BLOCK
      ?auto_147459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147454 ?auto_147455 ) ) ( not ( = ?auto_147454 ?auto_147456 ) ) ( not ( = ?auto_147454 ?auto_147457 ) ) ( not ( = ?auto_147454 ?auto_147458 ) ) ( not ( = ?auto_147454 ?auto_147462 ) ) ( not ( = ?auto_147455 ?auto_147456 ) ) ( not ( = ?auto_147455 ?auto_147457 ) ) ( not ( = ?auto_147455 ?auto_147458 ) ) ( not ( = ?auto_147455 ?auto_147462 ) ) ( not ( = ?auto_147456 ?auto_147457 ) ) ( not ( = ?auto_147456 ?auto_147458 ) ) ( not ( = ?auto_147456 ?auto_147462 ) ) ( not ( = ?auto_147457 ?auto_147458 ) ) ( not ( = ?auto_147457 ?auto_147462 ) ) ( not ( = ?auto_147458 ?auto_147462 ) ) ( not ( = ?auto_147454 ?auto_147461 ) ) ( not ( = ?auto_147454 ?auto_147460 ) ) ( not ( = ?auto_147455 ?auto_147461 ) ) ( not ( = ?auto_147455 ?auto_147460 ) ) ( not ( = ?auto_147456 ?auto_147461 ) ) ( not ( = ?auto_147456 ?auto_147460 ) ) ( not ( = ?auto_147457 ?auto_147461 ) ) ( not ( = ?auto_147457 ?auto_147460 ) ) ( not ( = ?auto_147458 ?auto_147461 ) ) ( not ( = ?auto_147458 ?auto_147460 ) ) ( not ( = ?auto_147462 ?auto_147461 ) ) ( not ( = ?auto_147462 ?auto_147460 ) ) ( not ( = ?auto_147461 ?auto_147460 ) ) ( ON ?auto_147460 ?auto_147459 ) ( not ( = ?auto_147454 ?auto_147459 ) ) ( not ( = ?auto_147455 ?auto_147459 ) ) ( not ( = ?auto_147456 ?auto_147459 ) ) ( not ( = ?auto_147457 ?auto_147459 ) ) ( not ( = ?auto_147458 ?auto_147459 ) ) ( not ( = ?auto_147462 ?auto_147459 ) ) ( not ( = ?auto_147461 ?auto_147459 ) ) ( not ( = ?auto_147460 ?auto_147459 ) ) ( ON ?auto_147461 ?auto_147460 ) ( ON-TABLE ?auto_147459 ) ( ON ?auto_147462 ?auto_147461 ) ( ON ?auto_147458 ?auto_147462 ) ( ON ?auto_147457 ?auto_147458 ) ( ON ?auto_147456 ?auto_147457 ) ( ON ?auto_147455 ?auto_147456 ) ( CLEAR ?auto_147455 ) ( HOLDING ?auto_147454 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147454 )
      ( MAKE-5PILE ?auto_147454 ?auto_147455 ?auto_147456 ?auto_147457 ?auto_147458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_147463 - BLOCK
      ?auto_147464 - BLOCK
      ?auto_147465 - BLOCK
      ?auto_147466 - BLOCK
      ?auto_147467 - BLOCK
    )
    :vars
    (
      ?auto_147469 - BLOCK
      ?auto_147468 - BLOCK
      ?auto_147471 - BLOCK
      ?auto_147470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147463 ?auto_147464 ) ) ( not ( = ?auto_147463 ?auto_147465 ) ) ( not ( = ?auto_147463 ?auto_147466 ) ) ( not ( = ?auto_147463 ?auto_147467 ) ) ( not ( = ?auto_147463 ?auto_147469 ) ) ( not ( = ?auto_147464 ?auto_147465 ) ) ( not ( = ?auto_147464 ?auto_147466 ) ) ( not ( = ?auto_147464 ?auto_147467 ) ) ( not ( = ?auto_147464 ?auto_147469 ) ) ( not ( = ?auto_147465 ?auto_147466 ) ) ( not ( = ?auto_147465 ?auto_147467 ) ) ( not ( = ?auto_147465 ?auto_147469 ) ) ( not ( = ?auto_147466 ?auto_147467 ) ) ( not ( = ?auto_147466 ?auto_147469 ) ) ( not ( = ?auto_147467 ?auto_147469 ) ) ( not ( = ?auto_147463 ?auto_147468 ) ) ( not ( = ?auto_147463 ?auto_147471 ) ) ( not ( = ?auto_147464 ?auto_147468 ) ) ( not ( = ?auto_147464 ?auto_147471 ) ) ( not ( = ?auto_147465 ?auto_147468 ) ) ( not ( = ?auto_147465 ?auto_147471 ) ) ( not ( = ?auto_147466 ?auto_147468 ) ) ( not ( = ?auto_147466 ?auto_147471 ) ) ( not ( = ?auto_147467 ?auto_147468 ) ) ( not ( = ?auto_147467 ?auto_147471 ) ) ( not ( = ?auto_147469 ?auto_147468 ) ) ( not ( = ?auto_147469 ?auto_147471 ) ) ( not ( = ?auto_147468 ?auto_147471 ) ) ( ON ?auto_147471 ?auto_147470 ) ( not ( = ?auto_147463 ?auto_147470 ) ) ( not ( = ?auto_147464 ?auto_147470 ) ) ( not ( = ?auto_147465 ?auto_147470 ) ) ( not ( = ?auto_147466 ?auto_147470 ) ) ( not ( = ?auto_147467 ?auto_147470 ) ) ( not ( = ?auto_147469 ?auto_147470 ) ) ( not ( = ?auto_147468 ?auto_147470 ) ) ( not ( = ?auto_147471 ?auto_147470 ) ) ( ON ?auto_147468 ?auto_147471 ) ( ON-TABLE ?auto_147470 ) ( ON ?auto_147469 ?auto_147468 ) ( ON ?auto_147467 ?auto_147469 ) ( ON ?auto_147466 ?auto_147467 ) ( ON ?auto_147465 ?auto_147466 ) ( ON ?auto_147464 ?auto_147465 ) ( ON ?auto_147463 ?auto_147464 ) ( CLEAR ?auto_147463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147470 ?auto_147471 ?auto_147468 ?auto_147469 ?auto_147467 ?auto_147466 ?auto_147465 ?auto_147464 )
      ( MAKE-5PILE ?auto_147463 ?auto_147464 ?auto_147465 ?auto_147466 ?auto_147467 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147475 - BLOCK
      ?auto_147476 - BLOCK
      ?auto_147477 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147477 ) ( CLEAR ?auto_147476 ) ( ON-TABLE ?auto_147475 ) ( ON ?auto_147476 ?auto_147475 ) ( not ( = ?auto_147475 ?auto_147476 ) ) ( not ( = ?auto_147475 ?auto_147477 ) ) ( not ( = ?auto_147476 ?auto_147477 ) ) )
    :subtasks
    ( ( !STACK ?auto_147477 ?auto_147476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147478 - BLOCK
      ?auto_147479 - BLOCK
      ?auto_147480 - BLOCK
    )
    :vars
    (
      ?auto_147481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147479 ) ( ON-TABLE ?auto_147478 ) ( ON ?auto_147479 ?auto_147478 ) ( not ( = ?auto_147478 ?auto_147479 ) ) ( not ( = ?auto_147478 ?auto_147480 ) ) ( not ( = ?auto_147479 ?auto_147480 ) ) ( ON ?auto_147480 ?auto_147481 ) ( CLEAR ?auto_147480 ) ( HAND-EMPTY ) ( not ( = ?auto_147478 ?auto_147481 ) ) ( not ( = ?auto_147479 ?auto_147481 ) ) ( not ( = ?auto_147480 ?auto_147481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147480 ?auto_147481 )
      ( MAKE-3PILE ?auto_147478 ?auto_147479 ?auto_147480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147482 - BLOCK
      ?auto_147483 - BLOCK
      ?auto_147484 - BLOCK
    )
    :vars
    (
      ?auto_147485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147482 ) ( not ( = ?auto_147482 ?auto_147483 ) ) ( not ( = ?auto_147482 ?auto_147484 ) ) ( not ( = ?auto_147483 ?auto_147484 ) ) ( ON ?auto_147484 ?auto_147485 ) ( CLEAR ?auto_147484 ) ( not ( = ?auto_147482 ?auto_147485 ) ) ( not ( = ?auto_147483 ?auto_147485 ) ) ( not ( = ?auto_147484 ?auto_147485 ) ) ( HOLDING ?auto_147483 ) ( CLEAR ?auto_147482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147482 ?auto_147483 )
      ( MAKE-3PILE ?auto_147482 ?auto_147483 ?auto_147484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147486 - BLOCK
      ?auto_147487 - BLOCK
      ?auto_147488 - BLOCK
    )
    :vars
    (
      ?auto_147489 - BLOCK
      ?auto_147491 - BLOCK
      ?auto_147490 - BLOCK
      ?auto_147492 - BLOCK
      ?auto_147493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147486 ) ( not ( = ?auto_147486 ?auto_147487 ) ) ( not ( = ?auto_147486 ?auto_147488 ) ) ( not ( = ?auto_147487 ?auto_147488 ) ) ( ON ?auto_147488 ?auto_147489 ) ( not ( = ?auto_147486 ?auto_147489 ) ) ( not ( = ?auto_147487 ?auto_147489 ) ) ( not ( = ?auto_147488 ?auto_147489 ) ) ( CLEAR ?auto_147486 ) ( ON ?auto_147487 ?auto_147488 ) ( CLEAR ?auto_147487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147491 ) ( ON ?auto_147490 ?auto_147491 ) ( ON ?auto_147492 ?auto_147490 ) ( ON ?auto_147493 ?auto_147492 ) ( ON ?auto_147489 ?auto_147493 ) ( not ( = ?auto_147491 ?auto_147490 ) ) ( not ( = ?auto_147491 ?auto_147492 ) ) ( not ( = ?auto_147491 ?auto_147493 ) ) ( not ( = ?auto_147491 ?auto_147489 ) ) ( not ( = ?auto_147491 ?auto_147488 ) ) ( not ( = ?auto_147491 ?auto_147487 ) ) ( not ( = ?auto_147490 ?auto_147492 ) ) ( not ( = ?auto_147490 ?auto_147493 ) ) ( not ( = ?auto_147490 ?auto_147489 ) ) ( not ( = ?auto_147490 ?auto_147488 ) ) ( not ( = ?auto_147490 ?auto_147487 ) ) ( not ( = ?auto_147492 ?auto_147493 ) ) ( not ( = ?auto_147492 ?auto_147489 ) ) ( not ( = ?auto_147492 ?auto_147488 ) ) ( not ( = ?auto_147492 ?auto_147487 ) ) ( not ( = ?auto_147493 ?auto_147489 ) ) ( not ( = ?auto_147493 ?auto_147488 ) ) ( not ( = ?auto_147493 ?auto_147487 ) ) ( not ( = ?auto_147486 ?auto_147491 ) ) ( not ( = ?auto_147486 ?auto_147490 ) ) ( not ( = ?auto_147486 ?auto_147492 ) ) ( not ( = ?auto_147486 ?auto_147493 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147491 ?auto_147490 ?auto_147492 ?auto_147493 ?auto_147489 ?auto_147488 )
      ( MAKE-3PILE ?auto_147486 ?auto_147487 ?auto_147488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147494 - BLOCK
      ?auto_147495 - BLOCK
      ?auto_147496 - BLOCK
    )
    :vars
    (
      ?auto_147501 - BLOCK
      ?auto_147500 - BLOCK
      ?auto_147498 - BLOCK
      ?auto_147499 - BLOCK
      ?auto_147497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147494 ?auto_147495 ) ) ( not ( = ?auto_147494 ?auto_147496 ) ) ( not ( = ?auto_147495 ?auto_147496 ) ) ( ON ?auto_147496 ?auto_147501 ) ( not ( = ?auto_147494 ?auto_147501 ) ) ( not ( = ?auto_147495 ?auto_147501 ) ) ( not ( = ?auto_147496 ?auto_147501 ) ) ( ON ?auto_147495 ?auto_147496 ) ( CLEAR ?auto_147495 ) ( ON-TABLE ?auto_147500 ) ( ON ?auto_147498 ?auto_147500 ) ( ON ?auto_147499 ?auto_147498 ) ( ON ?auto_147497 ?auto_147499 ) ( ON ?auto_147501 ?auto_147497 ) ( not ( = ?auto_147500 ?auto_147498 ) ) ( not ( = ?auto_147500 ?auto_147499 ) ) ( not ( = ?auto_147500 ?auto_147497 ) ) ( not ( = ?auto_147500 ?auto_147501 ) ) ( not ( = ?auto_147500 ?auto_147496 ) ) ( not ( = ?auto_147500 ?auto_147495 ) ) ( not ( = ?auto_147498 ?auto_147499 ) ) ( not ( = ?auto_147498 ?auto_147497 ) ) ( not ( = ?auto_147498 ?auto_147501 ) ) ( not ( = ?auto_147498 ?auto_147496 ) ) ( not ( = ?auto_147498 ?auto_147495 ) ) ( not ( = ?auto_147499 ?auto_147497 ) ) ( not ( = ?auto_147499 ?auto_147501 ) ) ( not ( = ?auto_147499 ?auto_147496 ) ) ( not ( = ?auto_147499 ?auto_147495 ) ) ( not ( = ?auto_147497 ?auto_147501 ) ) ( not ( = ?auto_147497 ?auto_147496 ) ) ( not ( = ?auto_147497 ?auto_147495 ) ) ( not ( = ?auto_147494 ?auto_147500 ) ) ( not ( = ?auto_147494 ?auto_147498 ) ) ( not ( = ?auto_147494 ?auto_147499 ) ) ( not ( = ?auto_147494 ?auto_147497 ) ) ( HOLDING ?auto_147494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147494 )
      ( MAKE-3PILE ?auto_147494 ?auto_147495 ?auto_147496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147502 - BLOCK
      ?auto_147503 - BLOCK
      ?auto_147504 - BLOCK
    )
    :vars
    (
      ?auto_147505 - BLOCK
      ?auto_147507 - BLOCK
      ?auto_147508 - BLOCK
      ?auto_147506 - BLOCK
      ?auto_147509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147502 ?auto_147503 ) ) ( not ( = ?auto_147502 ?auto_147504 ) ) ( not ( = ?auto_147503 ?auto_147504 ) ) ( ON ?auto_147504 ?auto_147505 ) ( not ( = ?auto_147502 ?auto_147505 ) ) ( not ( = ?auto_147503 ?auto_147505 ) ) ( not ( = ?auto_147504 ?auto_147505 ) ) ( ON ?auto_147503 ?auto_147504 ) ( ON-TABLE ?auto_147507 ) ( ON ?auto_147508 ?auto_147507 ) ( ON ?auto_147506 ?auto_147508 ) ( ON ?auto_147509 ?auto_147506 ) ( ON ?auto_147505 ?auto_147509 ) ( not ( = ?auto_147507 ?auto_147508 ) ) ( not ( = ?auto_147507 ?auto_147506 ) ) ( not ( = ?auto_147507 ?auto_147509 ) ) ( not ( = ?auto_147507 ?auto_147505 ) ) ( not ( = ?auto_147507 ?auto_147504 ) ) ( not ( = ?auto_147507 ?auto_147503 ) ) ( not ( = ?auto_147508 ?auto_147506 ) ) ( not ( = ?auto_147508 ?auto_147509 ) ) ( not ( = ?auto_147508 ?auto_147505 ) ) ( not ( = ?auto_147508 ?auto_147504 ) ) ( not ( = ?auto_147508 ?auto_147503 ) ) ( not ( = ?auto_147506 ?auto_147509 ) ) ( not ( = ?auto_147506 ?auto_147505 ) ) ( not ( = ?auto_147506 ?auto_147504 ) ) ( not ( = ?auto_147506 ?auto_147503 ) ) ( not ( = ?auto_147509 ?auto_147505 ) ) ( not ( = ?auto_147509 ?auto_147504 ) ) ( not ( = ?auto_147509 ?auto_147503 ) ) ( not ( = ?auto_147502 ?auto_147507 ) ) ( not ( = ?auto_147502 ?auto_147508 ) ) ( not ( = ?auto_147502 ?auto_147506 ) ) ( not ( = ?auto_147502 ?auto_147509 ) ) ( ON ?auto_147502 ?auto_147503 ) ( CLEAR ?auto_147502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147507 ?auto_147508 ?auto_147506 ?auto_147509 ?auto_147505 ?auto_147504 ?auto_147503 )
      ( MAKE-3PILE ?auto_147502 ?auto_147503 ?auto_147504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147510 - BLOCK
      ?auto_147511 - BLOCK
      ?auto_147512 - BLOCK
    )
    :vars
    (
      ?auto_147515 - BLOCK
      ?auto_147514 - BLOCK
      ?auto_147516 - BLOCK
      ?auto_147517 - BLOCK
      ?auto_147513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147510 ?auto_147511 ) ) ( not ( = ?auto_147510 ?auto_147512 ) ) ( not ( = ?auto_147511 ?auto_147512 ) ) ( ON ?auto_147512 ?auto_147515 ) ( not ( = ?auto_147510 ?auto_147515 ) ) ( not ( = ?auto_147511 ?auto_147515 ) ) ( not ( = ?auto_147512 ?auto_147515 ) ) ( ON ?auto_147511 ?auto_147512 ) ( ON-TABLE ?auto_147514 ) ( ON ?auto_147516 ?auto_147514 ) ( ON ?auto_147517 ?auto_147516 ) ( ON ?auto_147513 ?auto_147517 ) ( ON ?auto_147515 ?auto_147513 ) ( not ( = ?auto_147514 ?auto_147516 ) ) ( not ( = ?auto_147514 ?auto_147517 ) ) ( not ( = ?auto_147514 ?auto_147513 ) ) ( not ( = ?auto_147514 ?auto_147515 ) ) ( not ( = ?auto_147514 ?auto_147512 ) ) ( not ( = ?auto_147514 ?auto_147511 ) ) ( not ( = ?auto_147516 ?auto_147517 ) ) ( not ( = ?auto_147516 ?auto_147513 ) ) ( not ( = ?auto_147516 ?auto_147515 ) ) ( not ( = ?auto_147516 ?auto_147512 ) ) ( not ( = ?auto_147516 ?auto_147511 ) ) ( not ( = ?auto_147517 ?auto_147513 ) ) ( not ( = ?auto_147517 ?auto_147515 ) ) ( not ( = ?auto_147517 ?auto_147512 ) ) ( not ( = ?auto_147517 ?auto_147511 ) ) ( not ( = ?auto_147513 ?auto_147515 ) ) ( not ( = ?auto_147513 ?auto_147512 ) ) ( not ( = ?auto_147513 ?auto_147511 ) ) ( not ( = ?auto_147510 ?auto_147514 ) ) ( not ( = ?auto_147510 ?auto_147516 ) ) ( not ( = ?auto_147510 ?auto_147517 ) ) ( not ( = ?auto_147510 ?auto_147513 ) ) ( HOLDING ?auto_147510 ) ( CLEAR ?auto_147511 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147514 ?auto_147516 ?auto_147517 ?auto_147513 ?auto_147515 ?auto_147512 ?auto_147511 ?auto_147510 )
      ( MAKE-3PILE ?auto_147510 ?auto_147511 ?auto_147512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147518 - BLOCK
      ?auto_147519 - BLOCK
      ?auto_147520 - BLOCK
    )
    :vars
    (
      ?auto_147524 - BLOCK
      ?auto_147522 - BLOCK
      ?auto_147521 - BLOCK
      ?auto_147525 - BLOCK
      ?auto_147523 - BLOCK
      ?auto_147526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147518 ?auto_147519 ) ) ( not ( = ?auto_147518 ?auto_147520 ) ) ( not ( = ?auto_147519 ?auto_147520 ) ) ( ON ?auto_147520 ?auto_147524 ) ( not ( = ?auto_147518 ?auto_147524 ) ) ( not ( = ?auto_147519 ?auto_147524 ) ) ( not ( = ?auto_147520 ?auto_147524 ) ) ( ON ?auto_147519 ?auto_147520 ) ( ON-TABLE ?auto_147522 ) ( ON ?auto_147521 ?auto_147522 ) ( ON ?auto_147525 ?auto_147521 ) ( ON ?auto_147523 ?auto_147525 ) ( ON ?auto_147524 ?auto_147523 ) ( not ( = ?auto_147522 ?auto_147521 ) ) ( not ( = ?auto_147522 ?auto_147525 ) ) ( not ( = ?auto_147522 ?auto_147523 ) ) ( not ( = ?auto_147522 ?auto_147524 ) ) ( not ( = ?auto_147522 ?auto_147520 ) ) ( not ( = ?auto_147522 ?auto_147519 ) ) ( not ( = ?auto_147521 ?auto_147525 ) ) ( not ( = ?auto_147521 ?auto_147523 ) ) ( not ( = ?auto_147521 ?auto_147524 ) ) ( not ( = ?auto_147521 ?auto_147520 ) ) ( not ( = ?auto_147521 ?auto_147519 ) ) ( not ( = ?auto_147525 ?auto_147523 ) ) ( not ( = ?auto_147525 ?auto_147524 ) ) ( not ( = ?auto_147525 ?auto_147520 ) ) ( not ( = ?auto_147525 ?auto_147519 ) ) ( not ( = ?auto_147523 ?auto_147524 ) ) ( not ( = ?auto_147523 ?auto_147520 ) ) ( not ( = ?auto_147523 ?auto_147519 ) ) ( not ( = ?auto_147518 ?auto_147522 ) ) ( not ( = ?auto_147518 ?auto_147521 ) ) ( not ( = ?auto_147518 ?auto_147525 ) ) ( not ( = ?auto_147518 ?auto_147523 ) ) ( CLEAR ?auto_147519 ) ( ON ?auto_147518 ?auto_147526 ) ( CLEAR ?auto_147518 ) ( HAND-EMPTY ) ( not ( = ?auto_147518 ?auto_147526 ) ) ( not ( = ?auto_147519 ?auto_147526 ) ) ( not ( = ?auto_147520 ?auto_147526 ) ) ( not ( = ?auto_147524 ?auto_147526 ) ) ( not ( = ?auto_147522 ?auto_147526 ) ) ( not ( = ?auto_147521 ?auto_147526 ) ) ( not ( = ?auto_147525 ?auto_147526 ) ) ( not ( = ?auto_147523 ?auto_147526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147518 ?auto_147526 )
      ( MAKE-3PILE ?auto_147518 ?auto_147519 ?auto_147520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147527 - BLOCK
      ?auto_147528 - BLOCK
      ?auto_147529 - BLOCK
    )
    :vars
    (
      ?auto_147535 - BLOCK
      ?auto_147533 - BLOCK
      ?auto_147530 - BLOCK
      ?auto_147531 - BLOCK
      ?auto_147534 - BLOCK
      ?auto_147532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147527 ?auto_147528 ) ) ( not ( = ?auto_147527 ?auto_147529 ) ) ( not ( = ?auto_147528 ?auto_147529 ) ) ( ON ?auto_147529 ?auto_147535 ) ( not ( = ?auto_147527 ?auto_147535 ) ) ( not ( = ?auto_147528 ?auto_147535 ) ) ( not ( = ?auto_147529 ?auto_147535 ) ) ( ON-TABLE ?auto_147533 ) ( ON ?auto_147530 ?auto_147533 ) ( ON ?auto_147531 ?auto_147530 ) ( ON ?auto_147534 ?auto_147531 ) ( ON ?auto_147535 ?auto_147534 ) ( not ( = ?auto_147533 ?auto_147530 ) ) ( not ( = ?auto_147533 ?auto_147531 ) ) ( not ( = ?auto_147533 ?auto_147534 ) ) ( not ( = ?auto_147533 ?auto_147535 ) ) ( not ( = ?auto_147533 ?auto_147529 ) ) ( not ( = ?auto_147533 ?auto_147528 ) ) ( not ( = ?auto_147530 ?auto_147531 ) ) ( not ( = ?auto_147530 ?auto_147534 ) ) ( not ( = ?auto_147530 ?auto_147535 ) ) ( not ( = ?auto_147530 ?auto_147529 ) ) ( not ( = ?auto_147530 ?auto_147528 ) ) ( not ( = ?auto_147531 ?auto_147534 ) ) ( not ( = ?auto_147531 ?auto_147535 ) ) ( not ( = ?auto_147531 ?auto_147529 ) ) ( not ( = ?auto_147531 ?auto_147528 ) ) ( not ( = ?auto_147534 ?auto_147535 ) ) ( not ( = ?auto_147534 ?auto_147529 ) ) ( not ( = ?auto_147534 ?auto_147528 ) ) ( not ( = ?auto_147527 ?auto_147533 ) ) ( not ( = ?auto_147527 ?auto_147530 ) ) ( not ( = ?auto_147527 ?auto_147531 ) ) ( not ( = ?auto_147527 ?auto_147534 ) ) ( ON ?auto_147527 ?auto_147532 ) ( CLEAR ?auto_147527 ) ( not ( = ?auto_147527 ?auto_147532 ) ) ( not ( = ?auto_147528 ?auto_147532 ) ) ( not ( = ?auto_147529 ?auto_147532 ) ) ( not ( = ?auto_147535 ?auto_147532 ) ) ( not ( = ?auto_147533 ?auto_147532 ) ) ( not ( = ?auto_147530 ?auto_147532 ) ) ( not ( = ?auto_147531 ?auto_147532 ) ) ( not ( = ?auto_147534 ?auto_147532 ) ) ( HOLDING ?auto_147528 ) ( CLEAR ?auto_147529 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147533 ?auto_147530 ?auto_147531 ?auto_147534 ?auto_147535 ?auto_147529 ?auto_147528 )
      ( MAKE-3PILE ?auto_147527 ?auto_147528 ?auto_147529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147536 - BLOCK
      ?auto_147537 - BLOCK
      ?auto_147538 - BLOCK
    )
    :vars
    (
      ?auto_147541 - BLOCK
      ?auto_147544 - BLOCK
      ?auto_147542 - BLOCK
      ?auto_147539 - BLOCK
      ?auto_147543 - BLOCK
      ?auto_147540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147536 ?auto_147537 ) ) ( not ( = ?auto_147536 ?auto_147538 ) ) ( not ( = ?auto_147537 ?auto_147538 ) ) ( ON ?auto_147538 ?auto_147541 ) ( not ( = ?auto_147536 ?auto_147541 ) ) ( not ( = ?auto_147537 ?auto_147541 ) ) ( not ( = ?auto_147538 ?auto_147541 ) ) ( ON-TABLE ?auto_147544 ) ( ON ?auto_147542 ?auto_147544 ) ( ON ?auto_147539 ?auto_147542 ) ( ON ?auto_147543 ?auto_147539 ) ( ON ?auto_147541 ?auto_147543 ) ( not ( = ?auto_147544 ?auto_147542 ) ) ( not ( = ?auto_147544 ?auto_147539 ) ) ( not ( = ?auto_147544 ?auto_147543 ) ) ( not ( = ?auto_147544 ?auto_147541 ) ) ( not ( = ?auto_147544 ?auto_147538 ) ) ( not ( = ?auto_147544 ?auto_147537 ) ) ( not ( = ?auto_147542 ?auto_147539 ) ) ( not ( = ?auto_147542 ?auto_147543 ) ) ( not ( = ?auto_147542 ?auto_147541 ) ) ( not ( = ?auto_147542 ?auto_147538 ) ) ( not ( = ?auto_147542 ?auto_147537 ) ) ( not ( = ?auto_147539 ?auto_147543 ) ) ( not ( = ?auto_147539 ?auto_147541 ) ) ( not ( = ?auto_147539 ?auto_147538 ) ) ( not ( = ?auto_147539 ?auto_147537 ) ) ( not ( = ?auto_147543 ?auto_147541 ) ) ( not ( = ?auto_147543 ?auto_147538 ) ) ( not ( = ?auto_147543 ?auto_147537 ) ) ( not ( = ?auto_147536 ?auto_147544 ) ) ( not ( = ?auto_147536 ?auto_147542 ) ) ( not ( = ?auto_147536 ?auto_147539 ) ) ( not ( = ?auto_147536 ?auto_147543 ) ) ( ON ?auto_147536 ?auto_147540 ) ( not ( = ?auto_147536 ?auto_147540 ) ) ( not ( = ?auto_147537 ?auto_147540 ) ) ( not ( = ?auto_147538 ?auto_147540 ) ) ( not ( = ?auto_147541 ?auto_147540 ) ) ( not ( = ?auto_147544 ?auto_147540 ) ) ( not ( = ?auto_147542 ?auto_147540 ) ) ( not ( = ?auto_147539 ?auto_147540 ) ) ( not ( = ?auto_147543 ?auto_147540 ) ) ( CLEAR ?auto_147538 ) ( ON ?auto_147537 ?auto_147536 ) ( CLEAR ?auto_147537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147540 ?auto_147536 )
      ( MAKE-3PILE ?auto_147536 ?auto_147537 ?auto_147538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147545 - BLOCK
      ?auto_147546 - BLOCK
      ?auto_147547 - BLOCK
    )
    :vars
    (
      ?auto_147550 - BLOCK
      ?auto_147549 - BLOCK
      ?auto_147548 - BLOCK
      ?auto_147553 - BLOCK
      ?auto_147551 - BLOCK
      ?auto_147552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147545 ?auto_147546 ) ) ( not ( = ?auto_147545 ?auto_147547 ) ) ( not ( = ?auto_147546 ?auto_147547 ) ) ( not ( = ?auto_147545 ?auto_147550 ) ) ( not ( = ?auto_147546 ?auto_147550 ) ) ( not ( = ?auto_147547 ?auto_147550 ) ) ( ON-TABLE ?auto_147549 ) ( ON ?auto_147548 ?auto_147549 ) ( ON ?auto_147553 ?auto_147548 ) ( ON ?auto_147551 ?auto_147553 ) ( ON ?auto_147550 ?auto_147551 ) ( not ( = ?auto_147549 ?auto_147548 ) ) ( not ( = ?auto_147549 ?auto_147553 ) ) ( not ( = ?auto_147549 ?auto_147551 ) ) ( not ( = ?auto_147549 ?auto_147550 ) ) ( not ( = ?auto_147549 ?auto_147547 ) ) ( not ( = ?auto_147549 ?auto_147546 ) ) ( not ( = ?auto_147548 ?auto_147553 ) ) ( not ( = ?auto_147548 ?auto_147551 ) ) ( not ( = ?auto_147548 ?auto_147550 ) ) ( not ( = ?auto_147548 ?auto_147547 ) ) ( not ( = ?auto_147548 ?auto_147546 ) ) ( not ( = ?auto_147553 ?auto_147551 ) ) ( not ( = ?auto_147553 ?auto_147550 ) ) ( not ( = ?auto_147553 ?auto_147547 ) ) ( not ( = ?auto_147553 ?auto_147546 ) ) ( not ( = ?auto_147551 ?auto_147550 ) ) ( not ( = ?auto_147551 ?auto_147547 ) ) ( not ( = ?auto_147551 ?auto_147546 ) ) ( not ( = ?auto_147545 ?auto_147549 ) ) ( not ( = ?auto_147545 ?auto_147548 ) ) ( not ( = ?auto_147545 ?auto_147553 ) ) ( not ( = ?auto_147545 ?auto_147551 ) ) ( ON ?auto_147545 ?auto_147552 ) ( not ( = ?auto_147545 ?auto_147552 ) ) ( not ( = ?auto_147546 ?auto_147552 ) ) ( not ( = ?auto_147547 ?auto_147552 ) ) ( not ( = ?auto_147550 ?auto_147552 ) ) ( not ( = ?auto_147549 ?auto_147552 ) ) ( not ( = ?auto_147548 ?auto_147552 ) ) ( not ( = ?auto_147553 ?auto_147552 ) ) ( not ( = ?auto_147551 ?auto_147552 ) ) ( ON ?auto_147546 ?auto_147545 ) ( CLEAR ?auto_147546 ) ( ON-TABLE ?auto_147552 ) ( HOLDING ?auto_147547 ) ( CLEAR ?auto_147550 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147549 ?auto_147548 ?auto_147553 ?auto_147551 ?auto_147550 ?auto_147547 )
      ( MAKE-3PILE ?auto_147545 ?auto_147546 ?auto_147547 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147554 - BLOCK
      ?auto_147555 - BLOCK
      ?auto_147556 - BLOCK
    )
    :vars
    (
      ?auto_147557 - BLOCK
      ?auto_147560 - BLOCK
      ?auto_147561 - BLOCK
      ?auto_147558 - BLOCK
      ?auto_147562 - BLOCK
      ?auto_147559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147554 ?auto_147555 ) ) ( not ( = ?auto_147554 ?auto_147556 ) ) ( not ( = ?auto_147555 ?auto_147556 ) ) ( not ( = ?auto_147554 ?auto_147557 ) ) ( not ( = ?auto_147555 ?auto_147557 ) ) ( not ( = ?auto_147556 ?auto_147557 ) ) ( ON-TABLE ?auto_147560 ) ( ON ?auto_147561 ?auto_147560 ) ( ON ?auto_147558 ?auto_147561 ) ( ON ?auto_147562 ?auto_147558 ) ( ON ?auto_147557 ?auto_147562 ) ( not ( = ?auto_147560 ?auto_147561 ) ) ( not ( = ?auto_147560 ?auto_147558 ) ) ( not ( = ?auto_147560 ?auto_147562 ) ) ( not ( = ?auto_147560 ?auto_147557 ) ) ( not ( = ?auto_147560 ?auto_147556 ) ) ( not ( = ?auto_147560 ?auto_147555 ) ) ( not ( = ?auto_147561 ?auto_147558 ) ) ( not ( = ?auto_147561 ?auto_147562 ) ) ( not ( = ?auto_147561 ?auto_147557 ) ) ( not ( = ?auto_147561 ?auto_147556 ) ) ( not ( = ?auto_147561 ?auto_147555 ) ) ( not ( = ?auto_147558 ?auto_147562 ) ) ( not ( = ?auto_147558 ?auto_147557 ) ) ( not ( = ?auto_147558 ?auto_147556 ) ) ( not ( = ?auto_147558 ?auto_147555 ) ) ( not ( = ?auto_147562 ?auto_147557 ) ) ( not ( = ?auto_147562 ?auto_147556 ) ) ( not ( = ?auto_147562 ?auto_147555 ) ) ( not ( = ?auto_147554 ?auto_147560 ) ) ( not ( = ?auto_147554 ?auto_147561 ) ) ( not ( = ?auto_147554 ?auto_147558 ) ) ( not ( = ?auto_147554 ?auto_147562 ) ) ( ON ?auto_147554 ?auto_147559 ) ( not ( = ?auto_147554 ?auto_147559 ) ) ( not ( = ?auto_147555 ?auto_147559 ) ) ( not ( = ?auto_147556 ?auto_147559 ) ) ( not ( = ?auto_147557 ?auto_147559 ) ) ( not ( = ?auto_147560 ?auto_147559 ) ) ( not ( = ?auto_147561 ?auto_147559 ) ) ( not ( = ?auto_147558 ?auto_147559 ) ) ( not ( = ?auto_147562 ?auto_147559 ) ) ( ON ?auto_147555 ?auto_147554 ) ( ON-TABLE ?auto_147559 ) ( CLEAR ?auto_147557 ) ( ON ?auto_147556 ?auto_147555 ) ( CLEAR ?auto_147556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147559 ?auto_147554 ?auto_147555 )
      ( MAKE-3PILE ?auto_147554 ?auto_147555 ?auto_147556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147563 - BLOCK
      ?auto_147564 - BLOCK
      ?auto_147565 - BLOCK
    )
    :vars
    (
      ?auto_147570 - BLOCK
      ?auto_147568 - BLOCK
      ?auto_147566 - BLOCK
      ?auto_147567 - BLOCK
      ?auto_147571 - BLOCK
      ?auto_147569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147563 ?auto_147564 ) ) ( not ( = ?auto_147563 ?auto_147565 ) ) ( not ( = ?auto_147564 ?auto_147565 ) ) ( not ( = ?auto_147563 ?auto_147570 ) ) ( not ( = ?auto_147564 ?auto_147570 ) ) ( not ( = ?auto_147565 ?auto_147570 ) ) ( ON-TABLE ?auto_147568 ) ( ON ?auto_147566 ?auto_147568 ) ( ON ?auto_147567 ?auto_147566 ) ( ON ?auto_147571 ?auto_147567 ) ( not ( = ?auto_147568 ?auto_147566 ) ) ( not ( = ?auto_147568 ?auto_147567 ) ) ( not ( = ?auto_147568 ?auto_147571 ) ) ( not ( = ?auto_147568 ?auto_147570 ) ) ( not ( = ?auto_147568 ?auto_147565 ) ) ( not ( = ?auto_147568 ?auto_147564 ) ) ( not ( = ?auto_147566 ?auto_147567 ) ) ( not ( = ?auto_147566 ?auto_147571 ) ) ( not ( = ?auto_147566 ?auto_147570 ) ) ( not ( = ?auto_147566 ?auto_147565 ) ) ( not ( = ?auto_147566 ?auto_147564 ) ) ( not ( = ?auto_147567 ?auto_147571 ) ) ( not ( = ?auto_147567 ?auto_147570 ) ) ( not ( = ?auto_147567 ?auto_147565 ) ) ( not ( = ?auto_147567 ?auto_147564 ) ) ( not ( = ?auto_147571 ?auto_147570 ) ) ( not ( = ?auto_147571 ?auto_147565 ) ) ( not ( = ?auto_147571 ?auto_147564 ) ) ( not ( = ?auto_147563 ?auto_147568 ) ) ( not ( = ?auto_147563 ?auto_147566 ) ) ( not ( = ?auto_147563 ?auto_147567 ) ) ( not ( = ?auto_147563 ?auto_147571 ) ) ( ON ?auto_147563 ?auto_147569 ) ( not ( = ?auto_147563 ?auto_147569 ) ) ( not ( = ?auto_147564 ?auto_147569 ) ) ( not ( = ?auto_147565 ?auto_147569 ) ) ( not ( = ?auto_147570 ?auto_147569 ) ) ( not ( = ?auto_147568 ?auto_147569 ) ) ( not ( = ?auto_147566 ?auto_147569 ) ) ( not ( = ?auto_147567 ?auto_147569 ) ) ( not ( = ?auto_147571 ?auto_147569 ) ) ( ON ?auto_147564 ?auto_147563 ) ( ON-TABLE ?auto_147569 ) ( ON ?auto_147565 ?auto_147564 ) ( CLEAR ?auto_147565 ) ( HOLDING ?auto_147570 ) ( CLEAR ?auto_147571 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147568 ?auto_147566 ?auto_147567 ?auto_147571 ?auto_147570 )
      ( MAKE-3PILE ?auto_147563 ?auto_147564 ?auto_147565 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147572 - BLOCK
      ?auto_147573 - BLOCK
      ?auto_147574 - BLOCK
    )
    :vars
    (
      ?auto_147577 - BLOCK
      ?auto_147576 - BLOCK
      ?auto_147579 - BLOCK
      ?auto_147578 - BLOCK
      ?auto_147580 - BLOCK
      ?auto_147575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147572 ?auto_147573 ) ) ( not ( = ?auto_147572 ?auto_147574 ) ) ( not ( = ?auto_147573 ?auto_147574 ) ) ( not ( = ?auto_147572 ?auto_147577 ) ) ( not ( = ?auto_147573 ?auto_147577 ) ) ( not ( = ?auto_147574 ?auto_147577 ) ) ( ON-TABLE ?auto_147576 ) ( ON ?auto_147579 ?auto_147576 ) ( ON ?auto_147578 ?auto_147579 ) ( ON ?auto_147580 ?auto_147578 ) ( not ( = ?auto_147576 ?auto_147579 ) ) ( not ( = ?auto_147576 ?auto_147578 ) ) ( not ( = ?auto_147576 ?auto_147580 ) ) ( not ( = ?auto_147576 ?auto_147577 ) ) ( not ( = ?auto_147576 ?auto_147574 ) ) ( not ( = ?auto_147576 ?auto_147573 ) ) ( not ( = ?auto_147579 ?auto_147578 ) ) ( not ( = ?auto_147579 ?auto_147580 ) ) ( not ( = ?auto_147579 ?auto_147577 ) ) ( not ( = ?auto_147579 ?auto_147574 ) ) ( not ( = ?auto_147579 ?auto_147573 ) ) ( not ( = ?auto_147578 ?auto_147580 ) ) ( not ( = ?auto_147578 ?auto_147577 ) ) ( not ( = ?auto_147578 ?auto_147574 ) ) ( not ( = ?auto_147578 ?auto_147573 ) ) ( not ( = ?auto_147580 ?auto_147577 ) ) ( not ( = ?auto_147580 ?auto_147574 ) ) ( not ( = ?auto_147580 ?auto_147573 ) ) ( not ( = ?auto_147572 ?auto_147576 ) ) ( not ( = ?auto_147572 ?auto_147579 ) ) ( not ( = ?auto_147572 ?auto_147578 ) ) ( not ( = ?auto_147572 ?auto_147580 ) ) ( ON ?auto_147572 ?auto_147575 ) ( not ( = ?auto_147572 ?auto_147575 ) ) ( not ( = ?auto_147573 ?auto_147575 ) ) ( not ( = ?auto_147574 ?auto_147575 ) ) ( not ( = ?auto_147577 ?auto_147575 ) ) ( not ( = ?auto_147576 ?auto_147575 ) ) ( not ( = ?auto_147579 ?auto_147575 ) ) ( not ( = ?auto_147578 ?auto_147575 ) ) ( not ( = ?auto_147580 ?auto_147575 ) ) ( ON ?auto_147573 ?auto_147572 ) ( ON-TABLE ?auto_147575 ) ( ON ?auto_147574 ?auto_147573 ) ( CLEAR ?auto_147580 ) ( ON ?auto_147577 ?auto_147574 ) ( CLEAR ?auto_147577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147575 ?auto_147572 ?auto_147573 ?auto_147574 )
      ( MAKE-3PILE ?auto_147572 ?auto_147573 ?auto_147574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147581 - BLOCK
      ?auto_147582 - BLOCK
      ?auto_147583 - BLOCK
    )
    :vars
    (
      ?auto_147588 - BLOCK
      ?auto_147584 - BLOCK
      ?auto_147585 - BLOCK
      ?auto_147587 - BLOCK
      ?auto_147589 - BLOCK
      ?auto_147586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147581 ?auto_147582 ) ) ( not ( = ?auto_147581 ?auto_147583 ) ) ( not ( = ?auto_147582 ?auto_147583 ) ) ( not ( = ?auto_147581 ?auto_147588 ) ) ( not ( = ?auto_147582 ?auto_147588 ) ) ( not ( = ?auto_147583 ?auto_147588 ) ) ( ON-TABLE ?auto_147584 ) ( ON ?auto_147585 ?auto_147584 ) ( ON ?auto_147587 ?auto_147585 ) ( not ( = ?auto_147584 ?auto_147585 ) ) ( not ( = ?auto_147584 ?auto_147587 ) ) ( not ( = ?auto_147584 ?auto_147589 ) ) ( not ( = ?auto_147584 ?auto_147588 ) ) ( not ( = ?auto_147584 ?auto_147583 ) ) ( not ( = ?auto_147584 ?auto_147582 ) ) ( not ( = ?auto_147585 ?auto_147587 ) ) ( not ( = ?auto_147585 ?auto_147589 ) ) ( not ( = ?auto_147585 ?auto_147588 ) ) ( not ( = ?auto_147585 ?auto_147583 ) ) ( not ( = ?auto_147585 ?auto_147582 ) ) ( not ( = ?auto_147587 ?auto_147589 ) ) ( not ( = ?auto_147587 ?auto_147588 ) ) ( not ( = ?auto_147587 ?auto_147583 ) ) ( not ( = ?auto_147587 ?auto_147582 ) ) ( not ( = ?auto_147589 ?auto_147588 ) ) ( not ( = ?auto_147589 ?auto_147583 ) ) ( not ( = ?auto_147589 ?auto_147582 ) ) ( not ( = ?auto_147581 ?auto_147584 ) ) ( not ( = ?auto_147581 ?auto_147585 ) ) ( not ( = ?auto_147581 ?auto_147587 ) ) ( not ( = ?auto_147581 ?auto_147589 ) ) ( ON ?auto_147581 ?auto_147586 ) ( not ( = ?auto_147581 ?auto_147586 ) ) ( not ( = ?auto_147582 ?auto_147586 ) ) ( not ( = ?auto_147583 ?auto_147586 ) ) ( not ( = ?auto_147588 ?auto_147586 ) ) ( not ( = ?auto_147584 ?auto_147586 ) ) ( not ( = ?auto_147585 ?auto_147586 ) ) ( not ( = ?auto_147587 ?auto_147586 ) ) ( not ( = ?auto_147589 ?auto_147586 ) ) ( ON ?auto_147582 ?auto_147581 ) ( ON-TABLE ?auto_147586 ) ( ON ?auto_147583 ?auto_147582 ) ( ON ?auto_147588 ?auto_147583 ) ( CLEAR ?auto_147588 ) ( HOLDING ?auto_147589 ) ( CLEAR ?auto_147587 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147584 ?auto_147585 ?auto_147587 ?auto_147589 )
      ( MAKE-3PILE ?auto_147581 ?auto_147582 ?auto_147583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147590 - BLOCK
      ?auto_147591 - BLOCK
      ?auto_147592 - BLOCK
    )
    :vars
    (
      ?auto_147596 - BLOCK
      ?auto_147597 - BLOCK
      ?auto_147594 - BLOCK
      ?auto_147598 - BLOCK
      ?auto_147595 - BLOCK
      ?auto_147593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147590 ?auto_147591 ) ) ( not ( = ?auto_147590 ?auto_147592 ) ) ( not ( = ?auto_147591 ?auto_147592 ) ) ( not ( = ?auto_147590 ?auto_147596 ) ) ( not ( = ?auto_147591 ?auto_147596 ) ) ( not ( = ?auto_147592 ?auto_147596 ) ) ( ON-TABLE ?auto_147597 ) ( ON ?auto_147594 ?auto_147597 ) ( ON ?auto_147598 ?auto_147594 ) ( not ( = ?auto_147597 ?auto_147594 ) ) ( not ( = ?auto_147597 ?auto_147598 ) ) ( not ( = ?auto_147597 ?auto_147595 ) ) ( not ( = ?auto_147597 ?auto_147596 ) ) ( not ( = ?auto_147597 ?auto_147592 ) ) ( not ( = ?auto_147597 ?auto_147591 ) ) ( not ( = ?auto_147594 ?auto_147598 ) ) ( not ( = ?auto_147594 ?auto_147595 ) ) ( not ( = ?auto_147594 ?auto_147596 ) ) ( not ( = ?auto_147594 ?auto_147592 ) ) ( not ( = ?auto_147594 ?auto_147591 ) ) ( not ( = ?auto_147598 ?auto_147595 ) ) ( not ( = ?auto_147598 ?auto_147596 ) ) ( not ( = ?auto_147598 ?auto_147592 ) ) ( not ( = ?auto_147598 ?auto_147591 ) ) ( not ( = ?auto_147595 ?auto_147596 ) ) ( not ( = ?auto_147595 ?auto_147592 ) ) ( not ( = ?auto_147595 ?auto_147591 ) ) ( not ( = ?auto_147590 ?auto_147597 ) ) ( not ( = ?auto_147590 ?auto_147594 ) ) ( not ( = ?auto_147590 ?auto_147598 ) ) ( not ( = ?auto_147590 ?auto_147595 ) ) ( ON ?auto_147590 ?auto_147593 ) ( not ( = ?auto_147590 ?auto_147593 ) ) ( not ( = ?auto_147591 ?auto_147593 ) ) ( not ( = ?auto_147592 ?auto_147593 ) ) ( not ( = ?auto_147596 ?auto_147593 ) ) ( not ( = ?auto_147597 ?auto_147593 ) ) ( not ( = ?auto_147594 ?auto_147593 ) ) ( not ( = ?auto_147598 ?auto_147593 ) ) ( not ( = ?auto_147595 ?auto_147593 ) ) ( ON ?auto_147591 ?auto_147590 ) ( ON-TABLE ?auto_147593 ) ( ON ?auto_147592 ?auto_147591 ) ( ON ?auto_147596 ?auto_147592 ) ( CLEAR ?auto_147598 ) ( ON ?auto_147595 ?auto_147596 ) ( CLEAR ?auto_147595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147593 ?auto_147590 ?auto_147591 ?auto_147592 ?auto_147596 )
      ( MAKE-3PILE ?auto_147590 ?auto_147591 ?auto_147592 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147599 - BLOCK
      ?auto_147600 - BLOCK
      ?auto_147601 - BLOCK
    )
    :vars
    (
      ?auto_147605 - BLOCK
      ?auto_147607 - BLOCK
      ?auto_147604 - BLOCK
      ?auto_147602 - BLOCK
      ?auto_147606 - BLOCK
      ?auto_147603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147599 ?auto_147600 ) ) ( not ( = ?auto_147599 ?auto_147601 ) ) ( not ( = ?auto_147600 ?auto_147601 ) ) ( not ( = ?auto_147599 ?auto_147605 ) ) ( not ( = ?auto_147600 ?auto_147605 ) ) ( not ( = ?auto_147601 ?auto_147605 ) ) ( ON-TABLE ?auto_147607 ) ( ON ?auto_147604 ?auto_147607 ) ( not ( = ?auto_147607 ?auto_147604 ) ) ( not ( = ?auto_147607 ?auto_147602 ) ) ( not ( = ?auto_147607 ?auto_147606 ) ) ( not ( = ?auto_147607 ?auto_147605 ) ) ( not ( = ?auto_147607 ?auto_147601 ) ) ( not ( = ?auto_147607 ?auto_147600 ) ) ( not ( = ?auto_147604 ?auto_147602 ) ) ( not ( = ?auto_147604 ?auto_147606 ) ) ( not ( = ?auto_147604 ?auto_147605 ) ) ( not ( = ?auto_147604 ?auto_147601 ) ) ( not ( = ?auto_147604 ?auto_147600 ) ) ( not ( = ?auto_147602 ?auto_147606 ) ) ( not ( = ?auto_147602 ?auto_147605 ) ) ( not ( = ?auto_147602 ?auto_147601 ) ) ( not ( = ?auto_147602 ?auto_147600 ) ) ( not ( = ?auto_147606 ?auto_147605 ) ) ( not ( = ?auto_147606 ?auto_147601 ) ) ( not ( = ?auto_147606 ?auto_147600 ) ) ( not ( = ?auto_147599 ?auto_147607 ) ) ( not ( = ?auto_147599 ?auto_147604 ) ) ( not ( = ?auto_147599 ?auto_147602 ) ) ( not ( = ?auto_147599 ?auto_147606 ) ) ( ON ?auto_147599 ?auto_147603 ) ( not ( = ?auto_147599 ?auto_147603 ) ) ( not ( = ?auto_147600 ?auto_147603 ) ) ( not ( = ?auto_147601 ?auto_147603 ) ) ( not ( = ?auto_147605 ?auto_147603 ) ) ( not ( = ?auto_147607 ?auto_147603 ) ) ( not ( = ?auto_147604 ?auto_147603 ) ) ( not ( = ?auto_147602 ?auto_147603 ) ) ( not ( = ?auto_147606 ?auto_147603 ) ) ( ON ?auto_147600 ?auto_147599 ) ( ON-TABLE ?auto_147603 ) ( ON ?auto_147601 ?auto_147600 ) ( ON ?auto_147605 ?auto_147601 ) ( ON ?auto_147606 ?auto_147605 ) ( CLEAR ?auto_147606 ) ( HOLDING ?auto_147602 ) ( CLEAR ?auto_147604 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147607 ?auto_147604 ?auto_147602 )
      ( MAKE-3PILE ?auto_147599 ?auto_147600 ?auto_147601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147608 - BLOCK
      ?auto_147609 - BLOCK
      ?auto_147610 - BLOCK
    )
    :vars
    (
      ?auto_147615 - BLOCK
      ?auto_147611 - BLOCK
      ?auto_147616 - BLOCK
      ?auto_147613 - BLOCK
      ?auto_147614 - BLOCK
      ?auto_147612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147608 ?auto_147609 ) ) ( not ( = ?auto_147608 ?auto_147610 ) ) ( not ( = ?auto_147609 ?auto_147610 ) ) ( not ( = ?auto_147608 ?auto_147615 ) ) ( not ( = ?auto_147609 ?auto_147615 ) ) ( not ( = ?auto_147610 ?auto_147615 ) ) ( ON-TABLE ?auto_147611 ) ( ON ?auto_147616 ?auto_147611 ) ( not ( = ?auto_147611 ?auto_147616 ) ) ( not ( = ?auto_147611 ?auto_147613 ) ) ( not ( = ?auto_147611 ?auto_147614 ) ) ( not ( = ?auto_147611 ?auto_147615 ) ) ( not ( = ?auto_147611 ?auto_147610 ) ) ( not ( = ?auto_147611 ?auto_147609 ) ) ( not ( = ?auto_147616 ?auto_147613 ) ) ( not ( = ?auto_147616 ?auto_147614 ) ) ( not ( = ?auto_147616 ?auto_147615 ) ) ( not ( = ?auto_147616 ?auto_147610 ) ) ( not ( = ?auto_147616 ?auto_147609 ) ) ( not ( = ?auto_147613 ?auto_147614 ) ) ( not ( = ?auto_147613 ?auto_147615 ) ) ( not ( = ?auto_147613 ?auto_147610 ) ) ( not ( = ?auto_147613 ?auto_147609 ) ) ( not ( = ?auto_147614 ?auto_147615 ) ) ( not ( = ?auto_147614 ?auto_147610 ) ) ( not ( = ?auto_147614 ?auto_147609 ) ) ( not ( = ?auto_147608 ?auto_147611 ) ) ( not ( = ?auto_147608 ?auto_147616 ) ) ( not ( = ?auto_147608 ?auto_147613 ) ) ( not ( = ?auto_147608 ?auto_147614 ) ) ( ON ?auto_147608 ?auto_147612 ) ( not ( = ?auto_147608 ?auto_147612 ) ) ( not ( = ?auto_147609 ?auto_147612 ) ) ( not ( = ?auto_147610 ?auto_147612 ) ) ( not ( = ?auto_147615 ?auto_147612 ) ) ( not ( = ?auto_147611 ?auto_147612 ) ) ( not ( = ?auto_147616 ?auto_147612 ) ) ( not ( = ?auto_147613 ?auto_147612 ) ) ( not ( = ?auto_147614 ?auto_147612 ) ) ( ON ?auto_147609 ?auto_147608 ) ( ON-TABLE ?auto_147612 ) ( ON ?auto_147610 ?auto_147609 ) ( ON ?auto_147615 ?auto_147610 ) ( ON ?auto_147614 ?auto_147615 ) ( CLEAR ?auto_147616 ) ( ON ?auto_147613 ?auto_147614 ) ( CLEAR ?auto_147613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147612 ?auto_147608 ?auto_147609 ?auto_147610 ?auto_147615 ?auto_147614 )
      ( MAKE-3PILE ?auto_147608 ?auto_147609 ?auto_147610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147617 - BLOCK
      ?auto_147618 - BLOCK
      ?auto_147619 - BLOCK
    )
    :vars
    (
      ?auto_147625 - BLOCK
      ?auto_147620 - BLOCK
      ?auto_147621 - BLOCK
      ?auto_147622 - BLOCK
      ?auto_147624 - BLOCK
      ?auto_147623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147617 ?auto_147618 ) ) ( not ( = ?auto_147617 ?auto_147619 ) ) ( not ( = ?auto_147618 ?auto_147619 ) ) ( not ( = ?auto_147617 ?auto_147625 ) ) ( not ( = ?auto_147618 ?auto_147625 ) ) ( not ( = ?auto_147619 ?auto_147625 ) ) ( ON-TABLE ?auto_147620 ) ( not ( = ?auto_147620 ?auto_147621 ) ) ( not ( = ?auto_147620 ?auto_147622 ) ) ( not ( = ?auto_147620 ?auto_147624 ) ) ( not ( = ?auto_147620 ?auto_147625 ) ) ( not ( = ?auto_147620 ?auto_147619 ) ) ( not ( = ?auto_147620 ?auto_147618 ) ) ( not ( = ?auto_147621 ?auto_147622 ) ) ( not ( = ?auto_147621 ?auto_147624 ) ) ( not ( = ?auto_147621 ?auto_147625 ) ) ( not ( = ?auto_147621 ?auto_147619 ) ) ( not ( = ?auto_147621 ?auto_147618 ) ) ( not ( = ?auto_147622 ?auto_147624 ) ) ( not ( = ?auto_147622 ?auto_147625 ) ) ( not ( = ?auto_147622 ?auto_147619 ) ) ( not ( = ?auto_147622 ?auto_147618 ) ) ( not ( = ?auto_147624 ?auto_147625 ) ) ( not ( = ?auto_147624 ?auto_147619 ) ) ( not ( = ?auto_147624 ?auto_147618 ) ) ( not ( = ?auto_147617 ?auto_147620 ) ) ( not ( = ?auto_147617 ?auto_147621 ) ) ( not ( = ?auto_147617 ?auto_147622 ) ) ( not ( = ?auto_147617 ?auto_147624 ) ) ( ON ?auto_147617 ?auto_147623 ) ( not ( = ?auto_147617 ?auto_147623 ) ) ( not ( = ?auto_147618 ?auto_147623 ) ) ( not ( = ?auto_147619 ?auto_147623 ) ) ( not ( = ?auto_147625 ?auto_147623 ) ) ( not ( = ?auto_147620 ?auto_147623 ) ) ( not ( = ?auto_147621 ?auto_147623 ) ) ( not ( = ?auto_147622 ?auto_147623 ) ) ( not ( = ?auto_147624 ?auto_147623 ) ) ( ON ?auto_147618 ?auto_147617 ) ( ON-TABLE ?auto_147623 ) ( ON ?auto_147619 ?auto_147618 ) ( ON ?auto_147625 ?auto_147619 ) ( ON ?auto_147624 ?auto_147625 ) ( ON ?auto_147622 ?auto_147624 ) ( CLEAR ?auto_147622 ) ( HOLDING ?auto_147621 ) ( CLEAR ?auto_147620 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147620 ?auto_147621 )
      ( MAKE-3PILE ?auto_147617 ?auto_147618 ?auto_147619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147626 - BLOCK
      ?auto_147627 - BLOCK
      ?auto_147628 - BLOCK
    )
    :vars
    (
      ?auto_147630 - BLOCK
      ?auto_147633 - BLOCK
      ?auto_147629 - BLOCK
      ?auto_147634 - BLOCK
      ?auto_147632 - BLOCK
      ?auto_147631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147626 ?auto_147627 ) ) ( not ( = ?auto_147626 ?auto_147628 ) ) ( not ( = ?auto_147627 ?auto_147628 ) ) ( not ( = ?auto_147626 ?auto_147630 ) ) ( not ( = ?auto_147627 ?auto_147630 ) ) ( not ( = ?auto_147628 ?auto_147630 ) ) ( ON-TABLE ?auto_147633 ) ( not ( = ?auto_147633 ?auto_147629 ) ) ( not ( = ?auto_147633 ?auto_147634 ) ) ( not ( = ?auto_147633 ?auto_147632 ) ) ( not ( = ?auto_147633 ?auto_147630 ) ) ( not ( = ?auto_147633 ?auto_147628 ) ) ( not ( = ?auto_147633 ?auto_147627 ) ) ( not ( = ?auto_147629 ?auto_147634 ) ) ( not ( = ?auto_147629 ?auto_147632 ) ) ( not ( = ?auto_147629 ?auto_147630 ) ) ( not ( = ?auto_147629 ?auto_147628 ) ) ( not ( = ?auto_147629 ?auto_147627 ) ) ( not ( = ?auto_147634 ?auto_147632 ) ) ( not ( = ?auto_147634 ?auto_147630 ) ) ( not ( = ?auto_147634 ?auto_147628 ) ) ( not ( = ?auto_147634 ?auto_147627 ) ) ( not ( = ?auto_147632 ?auto_147630 ) ) ( not ( = ?auto_147632 ?auto_147628 ) ) ( not ( = ?auto_147632 ?auto_147627 ) ) ( not ( = ?auto_147626 ?auto_147633 ) ) ( not ( = ?auto_147626 ?auto_147629 ) ) ( not ( = ?auto_147626 ?auto_147634 ) ) ( not ( = ?auto_147626 ?auto_147632 ) ) ( ON ?auto_147626 ?auto_147631 ) ( not ( = ?auto_147626 ?auto_147631 ) ) ( not ( = ?auto_147627 ?auto_147631 ) ) ( not ( = ?auto_147628 ?auto_147631 ) ) ( not ( = ?auto_147630 ?auto_147631 ) ) ( not ( = ?auto_147633 ?auto_147631 ) ) ( not ( = ?auto_147629 ?auto_147631 ) ) ( not ( = ?auto_147634 ?auto_147631 ) ) ( not ( = ?auto_147632 ?auto_147631 ) ) ( ON ?auto_147627 ?auto_147626 ) ( ON-TABLE ?auto_147631 ) ( ON ?auto_147628 ?auto_147627 ) ( ON ?auto_147630 ?auto_147628 ) ( ON ?auto_147632 ?auto_147630 ) ( ON ?auto_147634 ?auto_147632 ) ( CLEAR ?auto_147633 ) ( ON ?auto_147629 ?auto_147634 ) ( CLEAR ?auto_147629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147631 ?auto_147626 ?auto_147627 ?auto_147628 ?auto_147630 ?auto_147632 ?auto_147634 )
      ( MAKE-3PILE ?auto_147626 ?auto_147627 ?auto_147628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147635 - BLOCK
      ?auto_147636 - BLOCK
      ?auto_147637 - BLOCK
    )
    :vars
    (
      ?auto_147643 - BLOCK
      ?auto_147639 - BLOCK
      ?auto_147640 - BLOCK
      ?auto_147642 - BLOCK
      ?auto_147641 - BLOCK
      ?auto_147638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147635 ?auto_147636 ) ) ( not ( = ?auto_147635 ?auto_147637 ) ) ( not ( = ?auto_147636 ?auto_147637 ) ) ( not ( = ?auto_147635 ?auto_147643 ) ) ( not ( = ?auto_147636 ?auto_147643 ) ) ( not ( = ?auto_147637 ?auto_147643 ) ) ( not ( = ?auto_147639 ?auto_147640 ) ) ( not ( = ?auto_147639 ?auto_147642 ) ) ( not ( = ?auto_147639 ?auto_147641 ) ) ( not ( = ?auto_147639 ?auto_147643 ) ) ( not ( = ?auto_147639 ?auto_147637 ) ) ( not ( = ?auto_147639 ?auto_147636 ) ) ( not ( = ?auto_147640 ?auto_147642 ) ) ( not ( = ?auto_147640 ?auto_147641 ) ) ( not ( = ?auto_147640 ?auto_147643 ) ) ( not ( = ?auto_147640 ?auto_147637 ) ) ( not ( = ?auto_147640 ?auto_147636 ) ) ( not ( = ?auto_147642 ?auto_147641 ) ) ( not ( = ?auto_147642 ?auto_147643 ) ) ( not ( = ?auto_147642 ?auto_147637 ) ) ( not ( = ?auto_147642 ?auto_147636 ) ) ( not ( = ?auto_147641 ?auto_147643 ) ) ( not ( = ?auto_147641 ?auto_147637 ) ) ( not ( = ?auto_147641 ?auto_147636 ) ) ( not ( = ?auto_147635 ?auto_147639 ) ) ( not ( = ?auto_147635 ?auto_147640 ) ) ( not ( = ?auto_147635 ?auto_147642 ) ) ( not ( = ?auto_147635 ?auto_147641 ) ) ( ON ?auto_147635 ?auto_147638 ) ( not ( = ?auto_147635 ?auto_147638 ) ) ( not ( = ?auto_147636 ?auto_147638 ) ) ( not ( = ?auto_147637 ?auto_147638 ) ) ( not ( = ?auto_147643 ?auto_147638 ) ) ( not ( = ?auto_147639 ?auto_147638 ) ) ( not ( = ?auto_147640 ?auto_147638 ) ) ( not ( = ?auto_147642 ?auto_147638 ) ) ( not ( = ?auto_147641 ?auto_147638 ) ) ( ON ?auto_147636 ?auto_147635 ) ( ON-TABLE ?auto_147638 ) ( ON ?auto_147637 ?auto_147636 ) ( ON ?auto_147643 ?auto_147637 ) ( ON ?auto_147641 ?auto_147643 ) ( ON ?auto_147642 ?auto_147641 ) ( ON ?auto_147640 ?auto_147642 ) ( CLEAR ?auto_147640 ) ( HOLDING ?auto_147639 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147639 )
      ( MAKE-3PILE ?auto_147635 ?auto_147636 ?auto_147637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147644 - BLOCK
      ?auto_147645 - BLOCK
      ?auto_147646 - BLOCK
    )
    :vars
    (
      ?auto_147649 - BLOCK
      ?auto_147651 - BLOCK
      ?auto_147652 - BLOCK
      ?auto_147650 - BLOCK
      ?auto_147647 - BLOCK
      ?auto_147648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147644 ?auto_147645 ) ) ( not ( = ?auto_147644 ?auto_147646 ) ) ( not ( = ?auto_147645 ?auto_147646 ) ) ( not ( = ?auto_147644 ?auto_147649 ) ) ( not ( = ?auto_147645 ?auto_147649 ) ) ( not ( = ?auto_147646 ?auto_147649 ) ) ( not ( = ?auto_147651 ?auto_147652 ) ) ( not ( = ?auto_147651 ?auto_147650 ) ) ( not ( = ?auto_147651 ?auto_147647 ) ) ( not ( = ?auto_147651 ?auto_147649 ) ) ( not ( = ?auto_147651 ?auto_147646 ) ) ( not ( = ?auto_147651 ?auto_147645 ) ) ( not ( = ?auto_147652 ?auto_147650 ) ) ( not ( = ?auto_147652 ?auto_147647 ) ) ( not ( = ?auto_147652 ?auto_147649 ) ) ( not ( = ?auto_147652 ?auto_147646 ) ) ( not ( = ?auto_147652 ?auto_147645 ) ) ( not ( = ?auto_147650 ?auto_147647 ) ) ( not ( = ?auto_147650 ?auto_147649 ) ) ( not ( = ?auto_147650 ?auto_147646 ) ) ( not ( = ?auto_147650 ?auto_147645 ) ) ( not ( = ?auto_147647 ?auto_147649 ) ) ( not ( = ?auto_147647 ?auto_147646 ) ) ( not ( = ?auto_147647 ?auto_147645 ) ) ( not ( = ?auto_147644 ?auto_147651 ) ) ( not ( = ?auto_147644 ?auto_147652 ) ) ( not ( = ?auto_147644 ?auto_147650 ) ) ( not ( = ?auto_147644 ?auto_147647 ) ) ( ON ?auto_147644 ?auto_147648 ) ( not ( = ?auto_147644 ?auto_147648 ) ) ( not ( = ?auto_147645 ?auto_147648 ) ) ( not ( = ?auto_147646 ?auto_147648 ) ) ( not ( = ?auto_147649 ?auto_147648 ) ) ( not ( = ?auto_147651 ?auto_147648 ) ) ( not ( = ?auto_147652 ?auto_147648 ) ) ( not ( = ?auto_147650 ?auto_147648 ) ) ( not ( = ?auto_147647 ?auto_147648 ) ) ( ON ?auto_147645 ?auto_147644 ) ( ON-TABLE ?auto_147648 ) ( ON ?auto_147646 ?auto_147645 ) ( ON ?auto_147649 ?auto_147646 ) ( ON ?auto_147647 ?auto_147649 ) ( ON ?auto_147650 ?auto_147647 ) ( ON ?auto_147652 ?auto_147650 ) ( ON ?auto_147651 ?auto_147652 ) ( CLEAR ?auto_147651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147648 ?auto_147644 ?auto_147645 ?auto_147646 ?auto_147649 ?auto_147647 ?auto_147650 ?auto_147652 )
      ( MAKE-3PILE ?auto_147644 ?auto_147645 ?auto_147646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147657 - BLOCK
      ?auto_147658 - BLOCK
      ?auto_147659 - BLOCK
      ?auto_147660 - BLOCK
    )
    :vars
    (
      ?auto_147661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147661 ?auto_147660 ) ( CLEAR ?auto_147661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147657 ) ( ON ?auto_147658 ?auto_147657 ) ( ON ?auto_147659 ?auto_147658 ) ( ON ?auto_147660 ?auto_147659 ) ( not ( = ?auto_147657 ?auto_147658 ) ) ( not ( = ?auto_147657 ?auto_147659 ) ) ( not ( = ?auto_147657 ?auto_147660 ) ) ( not ( = ?auto_147657 ?auto_147661 ) ) ( not ( = ?auto_147658 ?auto_147659 ) ) ( not ( = ?auto_147658 ?auto_147660 ) ) ( not ( = ?auto_147658 ?auto_147661 ) ) ( not ( = ?auto_147659 ?auto_147660 ) ) ( not ( = ?auto_147659 ?auto_147661 ) ) ( not ( = ?auto_147660 ?auto_147661 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147661 ?auto_147660 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147662 - BLOCK
      ?auto_147663 - BLOCK
      ?auto_147664 - BLOCK
      ?auto_147665 - BLOCK
    )
    :vars
    (
      ?auto_147666 - BLOCK
      ?auto_147667 - BLOCK
      ?auto_147668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147666 ?auto_147665 ) ( CLEAR ?auto_147666 ) ( ON-TABLE ?auto_147662 ) ( ON ?auto_147663 ?auto_147662 ) ( ON ?auto_147664 ?auto_147663 ) ( ON ?auto_147665 ?auto_147664 ) ( not ( = ?auto_147662 ?auto_147663 ) ) ( not ( = ?auto_147662 ?auto_147664 ) ) ( not ( = ?auto_147662 ?auto_147665 ) ) ( not ( = ?auto_147662 ?auto_147666 ) ) ( not ( = ?auto_147663 ?auto_147664 ) ) ( not ( = ?auto_147663 ?auto_147665 ) ) ( not ( = ?auto_147663 ?auto_147666 ) ) ( not ( = ?auto_147664 ?auto_147665 ) ) ( not ( = ?auto_147664 ?auto_147666 ) ) ( not ( = ?auto_147665 ?auto_147666 ) ) ( HOLDING ?auto_147667 ) ( CLEAR ?auto_147668 ) ( not ( = ?auto_147662 ?auto_147667 ) ) ( not ( = ?auto_147662 ?auto_147668 ) ) ( not ( = ?auto_147663 ?auto_147667 ) ) ( not ( = ?auto_147663 ?auto_147668 ) ) ( not ( = ?auto_147664 ?auto_147667 ) ) ( not ( = ?auto_147664 ?auto_147668 ) ) ( not ( = ?auto_147665 ?auto_147667 ) ) ( not ( = ?auto_147665 ?auto_147668 ) ) ( not ( = ?auto_147666 ?auto_147667 ) ) ( not ( = ?auto_147666 ?auto_147668 ) ) ( not ( = ?auto_147667 ?auto_147668 ) ) )
    :subtasks
    ( ( !STACK ?auto_147667 ?auto_147668 )
      ( MAKE-4PILE ?auto_147662 ?auto_147663 ?auto_147664 ?auto_147665 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147669 - BLOCK
      ?auto_147670 - BLOCK
      ?auto_147671 - BLOCK
      ?auto_147672 - BLOCK
    )
    :vars
    (
      ?auto_147675 - BLOCK
      ?auto_147673 - BLOCK
      ?auto_147674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147675 ?auto_147672 ) ( ON-TABLE ?auto_147669 ) ( ON ?auto_147670 ?auto_147669 ) ( ON ?auto_147671 ?auto_147670 ) ( ON ?auto_147672 ?auto_147671 ) ( not ( = ?auto_147669 ?auto_147670 ) ) ( not ( = ?auto_147669 ?auto_147671 ) ) ( not ( = ?auto_147669 ?auto_147672 ) ) ( not ( = ?auto_147669 ?auto_147675 ) ) ( not ( = ?auto_147670 ?auto_147671 ) ) ( not ( = ?auto_147670 ?auto_147672 ) ) ( not ( = ?auto_147670 ?auto_147675 ) ) ( not ( = ?auto_147671 ?auto_147672 ) ) ( not ( = ?auto_147671 ?auto_147675 ) ) ( not ( = ?auto_147672 ?auto_147675 ) ) ( CLEAR ?auto_147673 ) ( not ( = ?auto_147669 ?auto_147674 ) ) ( not ( = ?auto_147669 ?auto_147673 ) ) ( not ( = ?auto_147670 ?auto_147674 ) ) ( not ( = ?auto_147670 ?auto_147673 ) ) ( not ( = ?auto_147671 ?auto_147674 ) ) ( not ( = ?auto_147671 ?auto_147673 ) ) ( not ( = ?auto_147672 ?auto_147674 ) ) ( not ( = ?auto_147672 ?auto_147673 ) ) ( not ( = ?auto_147675 ?auto_147674 ) ) ( not ( = ?auto_147675 ?auto_147673 ) ) ( not ( = ?auto_147674 ?auto_147673 ) ) ( ON ?auto_147674 ?auto_147675 ) ( CLEAR ?auto_147674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147669 ?auto_147670 ?auto_147671 ?auto_147672 ?auto_147675 )
      ( MAKE-4PILE ?auto_147669 ?auto_147670 ?auto_147671 ?auto_147672 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147676 - BLOCK
      ?auto_147677 - BLOCK
      ?auto_147678 - BLOCK
      ?auto_147679 - BLOCK
    )
    :vars
    (
      ?auto_147682 - BLOCK
      ?auto_147680 - BLOCK
      ?auto_147681 - BLOCK
      ?auto_147683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147682 ?auto_147679 ) ( ON-TABLE ?auto_147676 ) ( ON ?auto_147677 ?auto_147676 ) ( ON ?auto_147678 ?auto_147677 ) ( ON ?auto_147679 ?auto_147678 ) ( not ( = ?auto_147676 ?auto_147677 ) ) ( not ( = ?auto_147676 ?auto_147678 ) ) ( not ( = ?auto_147676 ?auto_147679 ) ) ( not ( = ?auto_147676 ?auto_147682 ) ) ( not ( = ?auto_147677 ?auto_147678 ) ) ( not ( = ?auto_147677 ?auto_147679 ) ) ( not ( = ?auto_147677 ?auto_147682 ) ) ( not ( = ?auto_147678 ?auto_147679 ) ) ( not ( = ?auto_147678 ?auto_147682 ) ) ( not ( = ?auto_147679 ?auto_147682 ) ) ( not ( = ?auto_147676 ?auto_147680 ) ) ( not ( = ?auto_147676 ?auto_147681 ) ) ( not ( = ?auto_147677 ?auto_147680 ) ) ( not ( = ?auto_147677 ?auto_147681 ) ) ( not ( = ?auto_147678 ?auto_147680 ) ) ( not ( = ?auto_147678 ?auto_147681 ) ) ( not ( = ?auto_147679 ?auto_147680 ) ) ( not ( = ?auto_147679 ?auto_147681 ) ) ( not ( = ?auto_147682 ?auto_147680 ) ) ( not ( = ?auto_147682 ?auto_147681 ) ) ( not ( = ?auto_147680 ?auto_147681 ) ) ( ON ?auto_147680 ?auto_147682 ) ( CLEAR ?auto_147680 ) ( HOLDING ?auto_147681 ) ( CLEAR ?auto_147683 ) ( ON-TABLE ?auto_147683 ) ( not ( = ?auto_147683 ?auto_147681 ) ) ( not ( = ?auto_147676 ?auto_147683 ) ) ( not ( = ?auto_147677 ?auto_147683 ) ) ( not ( = ?auto_147678 ?auto_147683 ) ) ( not ( = ?auto_147679 ?auto_147683 ) ) ( not ( = ?auto_147682 ?auto_147683 ) ) ( not ( = ?auto_147680 ?auto_147683 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147683 ?auto_147681 )
      ( MAKE-4PILE ?auto_147676 ?auto_147677 ?auto_147678 ?auto_147679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147684 - BLOCK
      ?auto_147685 - BLOCK
      ?auto_147686 - BLOCK
      ?auto_147687 - BLOCK
    )
    :vars
    (
      ?auto_147690 - BLOCK
      ?auto_147688 - BLOCK
      ?auto_147689 - BLOCK
      ?auto_147691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147690 ?auto_147687 ) ( ON-TABLE ?auto_147684 ) ( ON ?auto_147685 ?auto_147684 ) ( ON ?auto_147686 ?auto_147685 ) ( ON ?auto_147687 ?auto_147686 ) ( not ( = ?auto_147684 ?auto_147685 ) ) ( not ( = ?auto_147684 ?auto_147686 ) ) ( not ( = ?auto_147684 ?auto_147687 ) ) ( not ( = ?auto_147684 ?auto_147690 ) ) ( not ( = ?auto_147685 ?auto_147686 ) ) ( not ( = ?auto_147685 ?auto_147687 ) ) ( not ( = ?auto_147685 ?auto_147690 ) ) ( not ( = ?auto_147686 ?auto_147687 ) ) ( not ( = ?auto_147686 ?auto_147690 ) ) ( not ( = ?auto_147687 ?auto_147690 ) ) ( not ( = ?auto_147684 ?auto_147688 ) ) ( not ( = ?auto_147684 ?auto_147689 ) ) ( not ( = ?auto_147685 ?auto_147688 ) ) ( not ( = ?auto_147685 ?auto_147689 ) ) ( not ( = ?auto_147686 ?auto_147688 ) ) ( not ( = ?auto_147686 ?auto_147689 ) ) ( not ( = ?auto_147687 ?auto_147688 ) ) ( not ( = ?auto_147687 ?auto_147689 ) ) ( not ( = ?auto_147690 ?auto_147688 ) ) ( not ( = ?auto_147690 ?auto_147689 ) ) ( not ( = ?auto_147688 ?auto_147689 ) ) ( ON ?auto_147688 ?auto_147690 ) ( CLEAR ?auto_147691 ) ( ON-TABLE ?auto_147691 ) ( not ( = ?auto_147691 ?auto_147689 ) ) ( not ( = ?auto_147684 ?auto_147691 ) ) ( not ( = ?auto_147685 ?auto_147691 ) ) ( not ( = ?auto_147686 ?auto_147691 ) ) ( not ( = ?auto_147687 ?auto_147691 ) ) ( not ( = ?auto_147690 ?auto_147691 ) ) ( not ( = ?auto_147688 ?auto_147691 ) ) ( ON ?auto_147689 ?auto_147688 ) ( CLEAR ?auto_147689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147684 ?auto_147685 ?auto_147686 ?auto_147687 ?auto_147690 ?auto_147688 )
      ( MAKE-4PILE ?auto_147684 ?auto_147685 ?auto_147686 ?auto_147687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147692 - BLOCK
      ?auto_147693 - BLOCK
      ?auto_147694 - BLOCK
      ?auto_147695 - BLOCK
    )
    :vars
    (
      ?auto_147697 - BLOCK
      ?auto_147699 - BLOCK
      ?auto_147698 - BLOCK
      ?auto_147696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147697 ?auto_147695 ) ( ON-TABLE ?auto_147692 ) ( ON ?auto_147693 ?auto_147692 ) ( ON ?auto_147694 ?auto_147693 ) ( ON ?auto_147695 ?auto_147694 ) ( not ( = ?auto_147692 ?auto_147693 ) ) ( not ( = ?auto_147692 ?auto_147694 ) ) ( not ( = ?auto_147692 ?auto_147695 ) ) ( not ( = ?auto_147692 ?auto_147697 ) ) ( not ( = ?auto_147693 ?auto_147694 ) ) ( not ( = ?auto_147693 ?auto_147695 ) ) ( not ( = ?auto_147693 ?auto_147697 ) ) ( not ( = ?auto_147694 ?auto_147695 ) ) ( not ( = ?auto_147694 ?auto_147697 ) ) ( not ( = ?auto_147695 ?auto_147697 ) ) ( not ( = ?auto_147692 ?auto_147699 ) ) ( not ( = ?auto_147692 ?auto_147698 ) ) ( not ( = ?auto_147693 ?auto_147699 ) ) ( not ( = ?auto_147693 ?auto_147698 ) ) ( not ( = ?auto_147694 ?auto_147699 ) ) ( not ( = ?auto_147694 ?auto_147698 ) ) ( not ( = ?auto_147695 ?auto_147699 ) ) ( not ( = ?auto_147695 ?auto_147698 ) ) ( not ( = ?auto_147697 ?auto_147699 ) ) ( not ( = ?auto_147697 ?auto_147698 ) ) ( not ( = ?auto_147699 ?auto_147698 ) ) ( ON ?auto_147699 ?auto_147697 ) ( not ( = ?auto_147696 ?auto_147698 ) ) ( not ( = ?auto_147692 ?auto_147696 ) ) ( not ( = ?auto_147693 ?auto_147696 ) ) ( not ( = ?auto_147694 ?auto_147696 ) ) ( not ( = ?auto_147695 ?auto_147696 ) ) ( not ( = ?auto_147697 ?auto_147696 ) ) ( not ( = ?auto_147699 ?auto_147696 ) ) ( ON ?auto_147698 ?auto_147699 ) ( CLEAR ?auto_147698 ) ( HOLDING ?auto_147696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147696 )
      ( MAKE-4PILE ?auto_147692 ?auto_147693 ?auto_147694 ?auto_147695 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147700 - BLOCK
      ?auto_147701 - BLOCK
      ?auto_147702 - BLOCK
      ?auto_147703 - BLOCK
    )
    :vars
    (
      ?auto_147705 - BLOCK
      ?auto_147704 - BLOCK
      ?auto_147707 - BLOCK
      ?auto_147706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147705 ?auto_147703 ) ( ON-TABLE ?auto_147700 ) ( ON ?auto_147701 ?auto_147700 ) ( ON ?auto_147702 ?auto_147701 ) ( ON ?auto_147703 ?auto_147702 ) ( not ( = ?auto_147700 ?auto_147701 ) ) ( not ( = ?auto_147700 ?auto_147702 ) ) ( not ( = ?auto_147700 ?auto_147703 ) ) ( not ( = ?auto_147700 ?auto_147705 ) ) ( not ( = ?auto_147701 ?auto_147702 ) ) ( not ( = ?auto_147701 ?auto_147703 ) ) ( not ( = ?auto_147701 ?auto_147705 ) ) ( not ( = ?auto_147702 ?auto_147703 ) ) ( not ( = ?auto_147702 ?auto_147705 ) ) ( not ( = ?auto_147703 ?auto_147705 ) ) ( not ( = ?auto_147700 ?auto_147704 ) ) ( not ( = ?auto_147700 ?auto_147707 ) ) ( not ( = ?auto_147701 ?auto_147704 ) ) ( not ( = ?auto_147701 ?auto_147707 ) ) ( not ( = ?auto_147702 ?auto_147704 ) ) ( not ( = ?auto_147702 ?auto_147707 ) ) ( not ( = ?auto_147703 ?auto_147704 ) ) ( not ( = ?auto_147703 ?auto_147707 ) ) ( not ( = ?auto_147705 ?auto_147704 ) ) ( not ( = ?auto_147705 ?auto_147707 ) ) ( not ( = ?auto_147704 ?auto_147707 ) ) ( ON ?auto_147704 ?auto_147705 ) ( not ( = ?auto_147706 ?auto_147707 ) ) ( not ( = ?auto_147700 ?auto_147706 ) ) ( not ( = ?auto_147701 ?auto_147706 ) ) ( not ( = ?auto_147702 ?auto_147706 ) ) ( not ( = ?auto_147703 ?auto_147706 ) ) ( not ( = ?auto_147705 ?auto_147706 ) ) ( not ( = ?auto_147704 ?auto_147706 ) ) ( ON ?auto_147707 ?auto_147704 ) ( ON ?auto_147706 ?auto_147707 ) ( CLEAR ?auto_147706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147700 ?auto_147701 ?auto_147702 ?auto_147703 ?auto_147705 ?auto_147704 ?auto_147707 )
      ( MAKE-4PILE ?auto_147700 ?auto_147701 ?auto_147702 ?auto_147703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147708 - BLOCK
      ?auto_147709 - BLOCK
      ?auto_147710 - BLOCK
      ?auto_147711 - BLOCK
    )
    :vars
    (
      ?auto_147712 - BLOCK
      ?auto_147715 - BLOCK
      ?auto_147714 - BLOCK
      ?auto_147713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147712 ?auto_147711 ) ( ON-TABLE ?auto_147708 ) ( ON ?auto_147709 ?auto_147708 ) ( ON ?auto_147710 ?auto_147709 ) ( ON ?auto_147711 ?auto_147710 ) ( not ( = ?auto_147708 ?auto_147709 ) ) ( not ( = ?auto_147708 ?auto_147710 ) ) ( not ( = ?auto_147708 ?auto_147711 ) ) ( not ( = ?auto_147708 ?auto_147712 ) ) ( not ( = ?auto_147709 ?auto_147710 ) ) ( not ( = ?auto_147709 ?auto_147711 ) ) ( not ( = ?auto_147709 ?auto_147712 ) ) ( not ( = ?auto_147710 ?auto_147711 ) ) ( not ( = ?auto_147710 ?auto_147712 ) ) ( not ( = ?auto_147711 ?auto_147712 ) ) ( not ( = ?auto_147708 ?auto_147715 ) ) ( not ( = ?auto_147708 ?auto_147714 ) ) ( not ( = ?auto_147709 ?auto_147715 ) ) ( not ( = ?auto_147709 ?auto_147714 ) ) ( not ( = ?auto_147710 ?auto_147715 ) ) ( not ( = ?auto_147710 ?auto_147714 ) ) ( not ( = ?auto_147711 ?auto_147715 ) ) ( not ( = ?auto_147711 ?auto_147714 ) ) ( not ( = ?auto_147712 ?auto_147715 ) ) ( not ( = ?auto_147712 ?auto_147714 ) ) ( not ( = ?auto_147715 ?auto_147714 ) ) ( ON ?auto_147715 ?auto_147712 ) ( not ( = ?auto_147713 ?auto_147714 ) ) ( not ( = ?auto_147708 ?auto_147713 ) ) ( not ( = ?auto_147709 ?auto_147713 ) ) ( not ( = ?auto_147710 ?auto_147713 ) ) ( not ( = ?auto_147711 ?auto_147713 ) ) ( not ( = ?auto_147712 ?auto_147713 ) ) ( not ( = ?auto_147715 ?auto_147713 ) ) ( ON ?auto_147714 ?auto_147715 ) ( HOLDING ?auto_147713 ) ( CLEAR ?auto_147714 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147708 ?auto_147709 ?auto_147710 ?auto_147711 ?auto_147712 ?auto_147715 ?auto_147714 ?auto_147713 )
      ( MAKE-4PILE ?auto_147708 ?auto_147709 ?auto_147710 ?auto_147711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147716 - BLOCK
      ?auto_147717 - BLOCK
      ?auto_147718 - BLOCK
      ?auto_147719 - BLOCK
    )
    :vars
    (
      ?auto_147722 - BLOCK
      ?auto_147721 - BLOCK
      ?auto_147723 - BLOCK
      ?auto_147720 - BLOCK
      ?auto_147724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147722 ?auto_147719 ) ( ON-TABLE ?auto_147716 ) ( ON ?auto_147717 ?auto_147716 ) ( ON ?auto_147718 ?auto_147717 ) ( ON ?auto_147719 ?auto_147718 ) ( not ( = ?auto_147716 ?auto_147717 ) ) ( not ( = ?auto_147716 ?auto_147718 ) ) ( not ( = ?auto_147716 ?auto_147719 ) ) ( not ( = ?auto_147716 ?auto_147722 ) ) ( not ( = ?auto_147717 ?auto_147718 ) ) ( not ( = ?auto_147717 ?auto_147719 ) ) ( not ( = ?auto_147717 ?auto_147722 ) ) ( not ( = ?auto_147718 ?auto_147719 ) ) ( not ( = ?auto_147718 ?auto_147722 ) ) ( not ( = ?auto_147719 ?auto_147722 ) ) ( not ( = ?auto_147716 ?auto_147721 ) ) ( not ( = ?auto_147716 ?auto_147723 ) ) ( not ( = ?auto_147717 ?auto_147721 ) ) ( not ( = ?auto_147717 ?auto_147723 ) ) ( not ( = ?auto_147718 ?auto_147721 ) ) ( not ( = ?auto_147718 ?auto_147723 ) ) ( not ( = ?auto_147719 ?auto_147721 ) ) ( not ( = ?auto_147719 ?auto_147723 ) ) ( not ( = ?auto_147722 ?auto_147721 ) ) ( not ( = ?auto_147722 ?auto_147723 ) ) ( not ( = ?auto_147721 ?auto_147723 ) ) ( ON ?auto_147721 ?auto_147722 ) ( not ( = ?auto_147720 ?auto_147723 ) ) ( not ( = ?auto_147716 ?auto_147720 ) ) ( not ( = ?auto_147717 ?auto_147720 ) ) ( not ( = ?auto_147718 ?auto_147720 ) ) ( not ( = ?auto_147719 ?auto_147720 ) ) ( not ( = ?auto_147722 ?auto_147720 ) ) ( not ( = ?auto_147721 ?auto_147720 ) ) ( ON ?auto_147723 ?auto_147721 ) ( CLEAR ?auto_147723 ) ( ON ?auto_147720 ?auto_147724 ) ( CLEAR ?auto_147720 ) ( HAND-EMPTY ) ( not ( = ?auto_147716 ?auto_147724 ) ) ( not ( = ?auto_147717 ?auto_147724 ) ) ( not ( = ?auto_147718 ?auto_147724 ) ) ( not ( = ?auto_147719 ?auto_147724 ) ) ( not ( = ?auto_147722 ?auto_147724 ) ) ( not ( = ?auto_147721 ?auto_147724 ) ) ( not ( = ?auto_147723 ?auto_147724 ) ) ( not ( = ?auto_147720 ?auto_147724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147720 ?auto_147724 )
      ( MAKE-4PILE ?auto_147716 ?auto_147717 ?auto_147718 ?auto_147719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147725 - BLOCK
      ?auto_147726 - BLOCK
      ?auto_147727 - BLOCK
      ?auto_147728 - BLOCK
    )
    :vars
    (
      ?auto_147730 - BLOCK
      ?auto_147732 - BLOCK
      ?auto_147731 - BLOCK
      ?auto_147733 - BLOCK
      ?auto_147729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147730 ?auto_147728 ) ( ON-TABLE ?auto_147725 ) ( ON ?auto_147726 ?auto_147725 ) ( ON ?auto_147727 ?auto_147726 ) ( ON ?auto_147728 ?auto_147727 ) ( not ( = ?auto_147725 ?auto_147726 ) ) ( not ( = ?auto_147725 ?auto_147727 ) ) ( not ( = ?auto_147725 ?auto_147728 ) ) ( not ( = ?auto_147725 ?auto_147730 ) ) ( not ( = ?auto_147726 ?auto_147727 ) ) ( not ( = ?auto_147726 ?auto_147728 ) ) ( not ( = ?auto_147726 ?auto_147730 ) ) ( not ( = ?auto_147727 ?auto_147728 ) ) ( not ( = ?auto_147727 ?auto_147730 ) ) ( not ( = ?auto_147728 ?auto_147730 ) ) ( not ( = ?auto_147725 ?auto_147732 ) ) ( not ( = ?auto_147725 ?auto_147731 ) ) ( not ( = ?auto_147726 ?auto_147732 ) ) ( not ( = ?auto_147726 ?auto_147731 ) ) ( not ( = ?auto_147727 ?auto_147732 ) ) ( not ( = ?auto_147727 ?auto_147731 ) ) ( not ( = ?auto_147728 ?auto_147732 ) ) ( not ( = ?auto_147728 ?auto_147731 ) ) ( not ( = ?auto_147730 ?auto_147732 ) ) ( not ( = ?auto_147730 ?auto_147731 ) ) ( not ( = ?auto_147732 ?auto_147731 ) ) ( ON ?auto_147732 ?auto_147730 ) ( not ( = ?auto_147733 ?auto_147731 ) ) ( not ( = ?auto_147725 ?auto_147733 ) ) ( not ( = ?auto_147726 ?auto_147733 ) ) ( not ( = ?auto_147727 ?auto_147733 ) ) ( not ( = ?auto_147728 ?auto_147733 ) ) ( not ( = ?auto_147730 ?auto_147733 ) ) ( not ( = ?auto_147732 ?auto_147733 ) ) ( ON ?auto_147733 ?auto_147729 ) ( CLEAR ?auto_147733 ) ( not ( = ?auto_147725 ?auto_147729 ) ) ( not ( = ?auto_147726 ?auto_147729 ) ) ( not ( = ?auto_147727 ?auto_147729 ) ) ( not ( = ?auto_147728 ?auto_147729 ) ) ( not ( = ?auto_147730 ?auto_147729 ) ) ( not ( = ?auto_147732 ?auto_147729 ) ) ( not ( = ?auto_147731 ?auto_147729 ) ) ( not ( = ?auto_147733 ?auto_147729 ) ) ( HOLDING ?auto_147731 ) ( CLEAR ?auto_147732 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147725 ?auto_147726 ?auto_147727 ?auto_147728 ?auto_147730 ?auto_147732 ?auto_147731 )
      ( MAKE-4PILE ?auto_147725 ?auto_147726 ?auto_147727 ?auto_147728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147734 - BLOCK
      ?auto_147735 - BLOCK
      ?auto_147736 - BLOCK
      ?auto_147737 - BLOCK
    )
    :vars
    (
      ?auto_147738 - BLOCK
      ?auto_147742 - BLOCK
      ?auto_147739 - BLOCK
      ?auto_147740 - BLOCK
      ?auto_147741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147738 ?auto_147737 ) ( ON-TABLE ?auto_147734 ) ( ON ?auto_147735 ?auto_147734 ) ( ON ?auto_147736 ?auto_147735 ) ( ON ?auto_147737 ?auto_147736 ) ( not ( = ?auto_147734 ?auto_147735 ) ) ( not ( = ?auto_147734 ?auto_147736 ) ) ( not ( = ?auto_147734 ?auto_147737 ) ) ( not ( = ?auto_147734 ?auto_147738 ) ) ( not ( = ?auto_147735 ?auto_147736 ) ) ( not ( = ?auto_147735 ?auto_147737 ) ) ( not ( = ?auto_147735 ?auto_147738 ) ) ( not ( = ?auto_147736 ?auto_147737 ) ) ( not ( = ?auto_147736 ?auto_147738 ) ) ( not ( = ?auto_147737 ?auto_147738 ) ) ( not ( = ?auto_147734 ?auto_147742 ) ) ( not ( = ?auto_147734 ?auto_147739 ) ) ( not ( = ?auto_147735 ?auto_147742 ) ) ( not ( = ?auto_147735 ?auto_147739 ) ) ( not ( = ?auto_147736 ?auto_147742 ) ) ( not ( = ?auto_147736 ?auto_147739 ) ) ( not ( = ?auto_147737 ?auto_147742 ) ) ( not ( = ?auto_147737 ?auto_147739 ) ) ( not ( = ?auto_147738 ?auto_147742 ) ) ( not ( = ?auto_147738 ?auto_147739 ) ) ( not ( = ?auto_147742 ?auto_147739 ) ) ( ON ?auto_147742 ?auto_147738 ) ( not ( = ?auto_147740 ?auto_147739 ) ) ( not ( = ?auto_147734 ?auto_147740 ) ) ( not ( = ?auto_147735 ?auto_147740 ) ) ( not ( = ?auto_147736 ?auto_147740 ) ) ( not ( = ?auto_147737 ?auto_147740 ) ) ( not ( = ?auto_147738 ?auto_147740 ) ) ( not ( = ?auto_147742 ?auto_147740 ) ) ( ON ?auto_147740 ?auto_147741 ) ( not ( = ?auto_147734 ?auto_147741 ) ) ( not ( = ?auto_147735 ?auto_147741 ) ) ( not ( = ?auto_147736 ?auto_147741 ) ) ( not ( = ?auto_147737 ?auto_147741 ) ) ( not ( = ?auto_147738 ?auto_147741 ) ) ( not ( = ?auto_147742 ?auto_147741 ) ) ( not ( = ?auto_147739 ?auto_147741 ) ) ( not ( = ?auto_147740 ?auto_147741 ) ) ( CLEAR ?auto_147742 ) ( ON ?auto_147739 ?auto_147740 ) ( CLEAR ?auto_147739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147741 ?auto_147740 )
      ( MAKE-4PILE ?auto_147734 ?auto_147735 ?auto_147736 ?auto_147737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147743 - BLOCK
      ?auto_147744 - BLOCK
      ?auto_147745 - BLOCK
      ?auto_147746 - BLOCK
    )
    :vars
    (
      ?auto_147751 - BLOCK
      ?auto_147750 - BLOCK
      ?auto_147748 - BLOCK
      ?auto_147749 - BLOCK
      ?auto_147747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147751 ?auto_147746 ) ( ON-TABLE ?auto_147743 ) ( ON ?auto_147744 ?auto_147743 ) ( ON ?auto_147745 ?auto_147744 ) ( ON ?auto_147746 ?auto_147745 ) ( not ( = ?auto_147743 ?auto_147744 ) ) ( not ( = ?auto_147743 ?auto_147745 ) ) ( not ( = ?auto_147743 ?auto_147746 ) ) ( not ( = ?auto_147743 ?auto_147751 ) ) ( not ( = ?auto_147744 ?auto_147745 ) ) ( not ( = ?auto_147744 ?auto_147746 ) ) ( not ( = ?auto_147744 ?auto_147751 ) ) ( not ( = ?auto_147745 ?auto_147746 ) ) ( not ( = ?auto_147745 ?auto_147751 ) ) ( not ( = ?auto_147746 ?auto_147751 ) ) ( not ( = ?auto_147743 ?auto_147750 ) ) ( not ( = ?auto_147743 ?auto_147748 ) ) ( not ( = ?auto_147744 ?auto_147750 ) ) ( not ( = ?auto_147744 ?auto_147748 ) ) ( not ( = ?auto_147745 ?auto_147750 ) ) ( not ( = ?auto_147745 ?auto_147748 ) ) ( not ( = ?auto_147746 ?auto_147750 ) ) ( not ( = ?auto_147746 ?auto_147748 ) ) ( not ( = ?auto_147751 ?auto_147750 ) ) ( not ( = ?auto_147751 ?auto_147748 ) ) ( not ( = ?auto_147750 ?auto_147748 ) ) ( not ( = ?auto_147749 ?auto_147748 ) ) ( not ( = ?auto_147743 ?auto_147749 ) ) ( not ( = ?auto_147744 ?auto_147749 ) ) ( not ( = ?auto_147745 ?auto_147749 ) ) ( not ( = ?auto_147746 ?auto_147749 ) ) ( not ( = ?auto_147751 ?auto_147749 ) ) ( not ( = ?auto_147750 ?auto_147749 ) ) ( ON ?auto_147749 ?auto_147747 ) ( not ( = ?auto_147743 ?auto_147747 ) ) ( not ( = ?auto_147744 ?auto_147747 ) ) ( not ( = ?auto_147745 ?auto_147747 ) ) ( not ( = ?auto_147746 ?auto_147747 ) ) ( not ( = ?auto_147751 ?auto_147747 ) ) ( not ( = ?auto_147750 ?auto_147747 ) ) ( not ( = ?auto_147748 ?auto_147747 ) ) ( not ( = ?auto_147749 ?auto_147747 ) ) ( ON ?auto_147748 ?auto_147749 ) ( CLEAR ?auto_147748 ) ( ON-TABLE ?auto_147747 ) ( HOLDING ?auto_147750 ) ( CLEAR ?auto_147751 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147743 ?auto_147744 ?auto_147745 ?auto_147746 ?auto_147751 ?auto_147750 )
      ( MAKE-4PILE ?auto_147743 ?auto_147744 ?auto_147745 ?auto_147746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147752 - BLOCK
      ?auto_147753 - BLOCK
      ?auto_147754 - BLOCK
      ?auto_147755 - BLOCK
    )
    :vars
    (
      ?auto_147756 - BLOCK
      ?auto_147757 - BLOCK
      ?auto_147759 - BLOCK
      ?auto_147758 - BLOCK
      ?auto_147760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147756 ?auto_147755 ) ( ON-TABLE ?auto_147752 ) ( ON ?auto_147753 ?auto_147752 ) ( ON ?auto_147754 ?auto_147753 ) ( ON ?auto_147755 ?auto_147754 ) ( not ( = ?auto_147752 ?auto_147753 ) ) ( not ( = ?auto_147752 ?auto_147754 ) ) ( not ( = ?auto_147752 ?auto_147755 ) ) ( not ( = ?auto_147752 ?auto_147756 ) ) ( not ( = ?auto_147753 ?auto_147754 ) ) ( not ( = ?auto_147753 ?auto_147755 ) ) ( not ( = ?auto_147753 ?auto_147756 ) ) ( not ( = ?auto_147754 ?auto_147755 ) ) ( not ( = ?auto_147754 ?auto_147756 ) ) ( not ( = ?auto_147755 ?auto_147756 ) ) ( not ( = ?auto_147752 ?auto_147757 ) ) ( not ( = ?auto_147752 ?auto_147759 ) ) ( not ( = ?auto_147753 ?auto_147757 ) ) ( not ( = ?auto_147753 ?auto_147759 ) ) ( not ( = ?auto_147754 ?auto_147757 ) ) ( not ( = ?auto_147754 ?auto_147759 ) ) ( not ( = ?auto_147755 ?auto_147757 ) ) ( not ( = ?auto_147755 ?auto_147759 ) ) ( not ( = ?auto_147756 ?auto_147757 ) ) ( not ( = ?auto_147756 ?auto_147759 ) ) ( not ( = ?auto_147757 ?auto_147759 ) ) ( not ( = ?auto_147758 ?auto_147759 ) ) ( not ( = ?auto_147752 ?auto_147758 ) ) ( not ( = ?auto_147753 ?auto_147758 ) ) ( not ( = ?auto_147754 ?auto_147758 ) ) ( not ( = ?auto_147755 ?auto_147758 ) ) ( not ( = ?auto_147756 ?auto_147758 ) ) ( not ( = ?auto_147757 ?auto_147758 ) ) ( ON ?auto_147758 ?auto_147760 ) ( not ( = ?auto_147752 ?auto_147760 ) ) ( not ( = ?auto_147753 ?auto_147760 ) ) ( not ( = ?auto_147754 ?auto_147760 ) ) ( not ( = ?auto_147755 ?auto_147760 ) ) ( not ( = ?auto_147756 ?auto_147760 ) ) ( not ( = ?auto_147757 ?auto_147760 ) ) ( not ( = ?auto_147759 ?auto_147760 ) ) ( not ( = ?auto_147758 ?auto_147760 ) ) ( ON ?auto_147759 ?auto_147758 ) ( ON-TABLE ?auto_147760 ) ( CLEAR ?auto_147756 ) ( ON ?auto_147757 ?auto_147759 ) ( CLEAR ?auto_147757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147760 ?auto_147758 ?auto_147759 )
      ( MAKE-4PILE ?auto_147752 ?auto_147753 ?auto_147754 ?auto_147755 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147779 - BLOCK
      ?auto_147780 - BLOCK
      ?auto_147781 - BLOCK
      ?auto_147782 - BLOCK
    )
    :vars
    (
      ?auto_147784 - BLOCK
      ?auto_147785 - BLOCK
      ?auto_147783 - BLOCK
      ?auto_147787 - BLOCK
      ?auto_147786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147779 ) ( ON ?auto_147780 ?auto_147779 ) ( ON ?auto_147781 ?auto_147780 ) ( not ( = ?auto_147779 ?auto_147780 ) ) ( not ( = ?auto_147779 ?auto_147781 ) ) ( not ( = ?auto_147779 ?auto_147782 ) ) ( not ( = ?auto_147779 ?auto_147784 ) ) ( not ( = ?auto_147780 ?auto_147781 ) ) ( not ( = ?auto_147780 ?auto_147782 ) ) ( not ( = ?auto_147780 ?auto_147784 ) ) ( not ( = ?auto_147781 ?auto_147782 ) ) ( not ( = ?auto_147781 ?auto_147784 ) ) ( not ( = ?auto_147782 ?auto_147784 ) ) ( not ( = ?auto_147779 ?auto_147785 ) ) ( not ( = ?auto_147779 ?auto_147783 ) ) ( not ( = ?auto_147780 ?auto_147785 ) ) ( not ( = ?auto_147780 ?auto_147783 ) ) ( not ( = ?auto_147781 ?auto_147785 ) ) ( not ( = ?auto_147781 ?auto_147783 ) ) ( not ( = ?auto_147782 ?auto_147785 ) ) ( not ( = ?auto_147782 ?auto_147783 ) ) ( not ( = ?auto_147784 ?auto_147785 ) ) ( not ( = ?auto_147784 ?auto_147783 ) ) ( not ( = ?auto_147785 ?auto_147783 ) ) ( not ( = ?auto_147787 ?auto_147783 ) ) ( not ( = ?auto_147779 ?auto_147787 ) ) ( not ( = ?auto_147780 ?auto_147787 ) ) ( not ( = ?auto_147781 ?auto_147787 ) ) ( not ( = ?auto_147782 ?auto_147787 ) ) ( not ( = ?auto_147784 ?auto_147787 ) ) ( not ( = ?auto_147785 ?auto_147787 ) ) ( ON ?auto_147787 ?auto_147786 ) ( not ( = ?auto_147779 ?auto_147786 ) ) ( not ( = ?auto_147780 ?auto_147786 ) ) ( not ( = ?auto_147781 ?auto_147786 ) ) ( not ( = ?auto_147782 ?auto_147786 ) ) ( not ( = ?auto_147784 ?auto_147786 ) ) ( not ( = ?auto_147785 ?auto_147786 ) ) ( not ( = ?auto_147783 ?auto_147786 ) ) ( not ( = ?auto_147787 ?auto_147786 ) ) ( ON ?auto_147783 ?auto_147787 ) ( ON-TABLE ?auto_147786 ) ( ON ?auto_147785 ?auto_147783 ) ( ON ?auto_147784 ?auto_147785 ) ( CLEAR ?auto_147784 ) ( HOLDING ?auto_147782 ) ( CLEAR ?auto_147781 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147779 ?auto_147780 ?auto_147781 ?auto_147782 ?auto_147784 )
      ( MAKE-4PILE ?auto_147779 ?auto_147780 ?auto_147781 ?auto_147782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147788 - BLOCK
      ?auto_147789 - BLOCK
      ?auto_147790 - BLOCK
      ?auto_147791 - BLOCK
    )
    :vars
    (
      ?auto_147793 - BLOCK
      ?auto_147795 - BLOCK
      ?auto_147792 - BLOCK
      ?auto_147794 - BLOCK
      ?auto_147796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147788 ) ( ON ?auto_147789 ?auto_147788 ) ( ON ?auto_147790 ?auto_147789 ) ( not ( = ?auto_147788 ?auto_147789 ) ) ( not ( = ?auto_147788 ?auto_147790 ) ) ( not ( = ?auto_147788 ?auto_147791 ) ) ( not ( = ?auto_147788 ?auto_147793 ) ) ( not ( = ?auto_147789 ?auto_147790 ) ) ( not ( = ?auto_147789 ?auto_147791 ) ) ( not ( = ?auto_147789 ?auto_147793 ) ) ( not ( = ?auto_147790 ?auto_147791 ) ) ( not ( = ?auto_147790 ?auto_147793 ) ) ( not ( = ?auto_147791 ?auto_147793 ) ) ( not ( = ?auto_147788 ?auto_147795 ) ) ( not ( = ?auto_147788 ?auto_147792 ) ) ( not ( = ?auto_147789 ?auto_147795 ) ) ( not ( = ?auto_147789 ?auto_147792 ) ) ( not ( = ?auto_147790 ?auto_147795 ) ) ( not ( = ?auto_147790 ?auto_147792 ) ) ( not ( = ?auto_147791 ?auto_147795 ) ) ( not ( = ?auto_147791 ?auto_147792 ) ) ( not ( = ?auto_147793 ?auto_147795 ) ) ( not ( = ?auto_147793 ?auto_147792 ) ) ( not ( = ?auto_147795 ?auto_147792 ) ) ( not ( = ?auto_147794 ?auto_147792 ) ) ( not ( = ?auto_147788 ?auto_147794 ) ) ( not ( = ?auto_147789 ?auto_147794 ) ) ( not ( = ?auto_147790 ?auto_147794 ) ) ( not ( = ?auto_147791 ?auto_147794 ) ) ( not ( = ?auto_147793 ?auto_147794 ) ) ( not ( = ?auto_147795 ?auto_147794 ) ) ( ON ?auto_147794 ?auto_147796 ) ( not ( = ?auto_147788 ?auto_147796 ) ) ( not ( = ?auto_147789 ?auto_147796 ) ) ( not ( = ?auto_147790 ?auto_147796 ) ) ( not ( = ?auto_147791 ?auto_147796 ) ) ( not ( = ?auto_147793 ?auto_147796 ) ) ( not ( = ?auto_147795 ?auto_147796 ) ) ( not ( = ?auto_147792 ?auto_147796 ) ) ( not ( = ?auto_147794 ?auto_147796 ) ) ( ON ?auto_147792 ?auto_147794 ) ( ON-TABLE ?auto_147796 ) ( ON ?auto_147795 ?auto_147792 ) ( ON ?auto_147793 ?auto_147795 ) ( CLEAR ?auto_147790 ) ( ON ?auto_147791 ?auto_147793 ) ( CLEAR ?auto_147791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147796 ?auto_147794 ?auto_147792 ?auto_147795 ?auto_147793 )
      ( MAKE-4PILE ?auto_147788 ?auto_147789 ?auto_147790 ?auto_147791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147797 - BLOCK
      ?auto_147798 - BLOCK
      ?auto_147799 - BLOCK
      ?auto_147800 - BLOCK
    )
    :vars
    (
      ?auto_147804 - BLOCK
      ?auto_147805 - BLOCK
      ?auto_147801 - BLOCK
      ?auto_147803 - BLOCK
      ?auto_147802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147797 ) ( ON ?auto_147798 ?auto_147797 ) ( not ( = ?auto_147797 ?auto_147798 ) ) ( not ( = ?auto_147797 ?auto_147799 ) ) ( not ( = ?auto_147797 ?auto_147800 ) ) ( not ( = ?auto_147797 ?auto_147804 ) ) ( not ( = ?auto_147798 ?auto_147799 ) ) ( not ( = ?auto_147798 ?auto_147800 ) ) ( not ( = ?auto_147798 ?auto_147804 ) ) ( not ( = ?auto_147799 ?auto_147800 ) ) ( not ( = ?auto_147799 ?auto_147804 ) ) ( not ( = ?auto_147800 ?auto_147804 ) ) ( not ( = ?auto_147797 ?auto_147805 ) ) ( not ( = ?auto_147797 ?auto_147801 ) ) ( not ( = ?auto_147798 ?auto_147805 ) ) ( not ( = ?auto_147798 ?auto_147801 ) ) ( not ( = ?auto_147799 ?auto_147805 ) ) ( not ( = ?auto_147799 ?auto_147801 ) ) ( not ( = ?auto_147800 ?auto_147805 ) ) ( not ( = ?auto_147800 ?auto_147801 ) ) ( not ( = ?auto_147804 ?auto_147805 ) ) ( not ( = ?auto_147804 ?auto_147801 ) ) ( not ( = ?auto_147805 ?auto_147801 ) ) ( not ( = ?auto_147803 ?auto_147801 ) ) ( not ( = ?auto_147797 ?auto_147803 ) ) ( not ( = ?auto_147798 ?auto_147803 ) ) ( not ( = ?auto_147799 ?auto_147803 ) ) ( not ( = ?auto_147800 ?auto_147803 ) ) ( not ( = ?auto_147804 ?auto_147803 ) ) ( not ( = ?auto_147805 ?auto_147803 ) ) ( ON ?auto_147803 ?auto_147802 ) ( not ( = ?auto_147797 ?auto_147802 ) ) ( not ( = ?auto_147798 ?auto_147802 ) ) ( not ( = ?auto_147799 ?auto_147802 ) ) ( not ( = ?auto_147800 ?auto_147802 ) ) ( not ( = ?auto_147804 ?auto_147802 ) ) ( not ( = ?auto_147805 ?auto_147802 ) ) ( not ( = ?auto_147801 ?auto_147802 ) ) ( not ( = ?auto_147803 ?auto_147802 ) ) ( ON ?auto_147801 ?auto_147803 ) ( ON-TABLE ?auto_147802 ) ( ON ?auto_147805 ?auto_147801 ) ( ON ?auto_147804 ?auto_147805 ) ( ON ?auto_147800 ?auto_147804 ) ( CLEAR ?auto_147800 ) ( HOLDING ?auto_147799 ) ( CLEAR ?auto_147798 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147797 ?auto_147798 ?auto_147799 )
      ( MAKE-4PILE ?auto_147797 ?auto_147798 ?auto_147799 ?auto_147800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147806 - BLOCK
      ?auto_147807 - BLOCK
      ?auto_147808 - BLOCK
      ?auto_147809 - BLOCK
    )
    :vars
    (
      ?auto_147812 - BLOCK
      ?auto_147810 - BLOCK
      ?auto_147813 - BLOCK
      ?auto_147811 - BLOCK
      ?auto_147814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147806 ) ( ON ?auto_147807 ?auto_147806 ) ( not ( = ?auto_147806 ?auto_147807 ) ) ( not ( = ?auto_147806 ?auto_147808 ) ) ( not ( = ?auto_147806 ?auto_147809 ) ) ( not ( = ?auto_147806 ?auto_147812 ) ) ( not ( = ?auto_147807 ?auto_147808 ) ) ( not ( = ?auto_147807 ?auto_147809 ) ) ( not ( = ?auto_147807 ?auto_147812 ) ) ( not ( = ?auto_147808 ?auto_147809 ) ) ( not ( = ?auto_147808 ?auto_147812 ) ) ( not ( = ?auto_147809 ?auto_147812 ) ) ( not ( = ?auto_147806 ?auto_147810 ) ) ( not ( = ?auto_147806 ?auto_147813 ) ) ( not ( = ?auto_147807 ?auto_147810 ) ) ( not ( = ?auto_147807 ?auto_147813 ) ) ( not ( = ?auto_147808 ?auto_147810 ) ) ( not ( = ?auto_147808 ?auto_147813 ) ) ( not ( = ?auto_147809 ?auto_147810 ) ) ( not ( = ?auto_147809 ?auto_147813 ) ) ( not ( = ?auto_147812 ?auto_147810 ) ) ( not ( = ?auto_147812 ?auto_147813 ) ) ( not ( = ?auto_147810 ?auto_147813 ) ) ( not ( = ?auto_147811 ?auto_147813 ) ) ( not ( = ?auto_147806 ?auto_147811 ) ) ( not ( = ?auto_147807 ?auto_147811 ) ) ( not ( = ?auto_147808 ?auto_147811 ) ) ( not ( = ?auto_147809 ?auto_147811 ) ) ( not ( = ?auto_147812 ?auto_147811 ) ) ( not ( = ?auto_147810 ?auto_147811 ) ) ( ON ?auto_147811 ?auto_147814 ) ( not ( = ?auto_147806 ?auto_147814 ) ) ( not ( = ?auto_147807 ?auto_147814 ) ) ( not ( = ?auto_147808 ?auto_147814 ) ) ( not ( = ?auto_147809 ?auto_147814 ) ) ( not ( = ?auto_147812 ?auto_147814 ) ) ( not ( = ?auto_147810 ?auto_147814 ) ) ( not ( = ?auto_147813 ?auto_147814 ) ) ( not ( = ?auto_147811 ?auto_147814 ) ) ( ON ?auto_147813 ?auto_147811 ) ( ON-TABLE ?auto_147814 ) ( ON ?auto_147810 ?auto_147813 ) ( ON ?auto_147812 ?auto_147810 ) ( ON ?auto_147809 ?auto_147812 ) ( CLEAR ?auto_147807 ) ( ON ?auto_147808 ?auto_147809 ) ( CLEAR ?auto_147808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147814 ?auto_147811 ?auto_147813 ?auto_147810 ?auto_147812 ?auto_147809 )
      ( MAKE-4PILE ?auto_147806 ?auto_147807 ?auto_147808 ?auto_147809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147815 - BLOCK
      ?auto_147816 - BLOCK
      ?auto_147817 - BLOCK
      ?auto_147818 - BLOCK
    )
    :vars
    (
      ?auto_147822 - BLOCK
      ?auto_147820 - BLOCK
      ?auto_147823 - BLOCK
      ?auto_147819 - BLOCK
      ?auto_147821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147815 ) ( not ( = ?auto_147815 ?auto_147816 ) ) ( not ( = ?auto_147815 ?auto_147817 ) ) ( not ( = ?auto_147815 ?auto_147818 ) ) ( not ( = ?auto_147815 ?auto_147822 ) ) ( not ( = ?auto_147816 ?auto_147817 ) ) ( not ( = ?auto_147816 ?auto_147818 ) ) ( not ( = ?auto_147816 ?auto_147822 ) ) ( not ( = ?auto_147817 ?auto_147818 ) ) ( not ( = ?auto_147817 ?auto_147822 ) ) ( not ( = ?auto_147818 ?auto_147822 ) ) ( not ( = ?auto_147815 ?auto_147820 ) ) ( not ( = ?auto_147815 ?auto_147823 ) ) ( not ( = ?auto_147816 ?auto_147820 ) ) ( not ( = ?auto_147816 ?auto_147823 ) ) ( not ( = ?auto_147817 ?auto_147820 ) ) ( not ( = ?auto_147817 ?auto_147823 ) ) ( not ( = ?auto_147818 ?auto_147820 ) ) ( not ( = ?auto_147818 ?auto_147823 ) ) ( not ( = ?auto_147822 ?auto_147820 ) ) ( not ( = ?auto_147822 ?auto_147823 ) ) ( not ( = ?auto_147820 ?auto_147823 ) ) ( not ( = ?auto_147819 ?auto_147823 ) ) ( not ( = ?auto_147815 ?auto_147819 ) ) ( not ( = ?auto_147816 ?auto_147819 ) ) ( not ( = ?auto_147817 ?auto_147819 ) ) ( not ( = ?auto_147818 ?auto_147819 ) ) ( not ( = ?auto_147822 ?auto_147819 ) ) ( not ( = ?auto_147820 ?auto_147819 ) ) ( ON ?auto_147819 ?auto_147821 ) ( not ( = ?auto_147815 ?auto_147821 ) ) ( not ( = ?auto_147816 ?auto_147821 ) ) ( not ( = ?auto_147817 ?auto_147821 ) ) ( not ( = ?auto_147818 ?auto_147821 ) ) ( not ( = ?auto_147822 ?auto_147821 ) ) ( not ( = ?auto_147820 ?auto_147821 ) ) ( not ( = ?auto_147823 ?auto_147821 ) ) ( not ( = ?auto_147819 ?auto_147821 ) ) ( ON ?auto_147823 ?auto_147819 ) ( ON-TABLE ?auto_147821 ) ( ON ?auto_147820 ?auto_147823 ) ( ON ?auto_147822 ?auto_147820 ) ( ON ?auto_147818 ?auto_147822 ) ( ON ?auto_147817 ?auto_147818 ) ( CLEAR ?auto_147817 ) ( HOLDING ?auto_147816 ) ( CLEAR ?auto_147815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147815 ?auto_147816 )
      ( MAKE-4PILE ?auto_147815 ?auto_147816 ?auto_147817 ?auto_147818 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147824 - BLOCK
      ?auto_147825 - BLOCK
      ?auto_147826 - BLOCK
      ?auto_147827 - BLOCK
    )
    :vars
    (
      ?auto_147828 - BLOCK
      ?auto_147831 - BLOCK
      ?auto_147829 - BLOCK
      ?auto_147830 - BLOCK
      ?auto_147832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147824 ) ( not ( = ?auto_147824 ?auto_147825 ) ) ( not ( = ?auto_147824 ?auto_147826 ) ) ( not ( = ?auto_147824 ?auto_147827 ) ) ( not ( = ?auto_147824 ?auto_147828 ) ) ( not ( = ?auto_147825 ?auto_147826 ) ) ( not ( = ?auto_147825 ?auto_147827 ) ) ( not ( = ?auto_147825 ?auto_147828 ) ) ( not ( = ?auto_147826 ?auto_147827 ) ) ( not ( = ?auto_147826 ?auto_147828 ) ) ( not ( = ?auto_147827 ?auto_147828 ) ) ( not ( = ?auto_147824 ?auto_147831 ) ) ( not ( = ?auto_147824 ?auto_147829 ) ) ( not ( = ?auto_147825 ?auto_147831 ) ) ( not ( = ?auto_147825 ?auto_147829 ) ) ( not ( = ?auto_147826 ?auto_147831 ) ) ( not ( = ?auto_147826 ?auto_147829 ) ) ( not ( = ?auto_147827 ?auto_147831 ) ) ( not ( = ?auto_147827 ?auto_147829 ) ) ( not ( = ?auto_147828 ?auto_147831 ) ) ( not ( = ?auto_147828 ?auto_147829 ) ) ( not ( = ?auto_147831 ?auto_147829 ) ) ( not ( = ?auto_147830 ?auto_147829 ) ) ( not ( = ?auto_147824 ?auto_147830 ) ) ( not ( = ?auto_147825 ?auto_147830 ) ) ( not ( = ?auto_147826 ?auto_147830 ) ) ( not ( = ?auto_147827 ?auto_147830 ) ) ( not ( = ?auto_147828 ?auto_147830 ) ) ( not ( = ?auto_147831 ?auto_147830 ) ) ( ON ?auto_147830 ?auto_147832 ) ( not ( = ?auto_147824 ?auto_147832 ) ) ( not ( = ?auto_147825 ?auto_147832 ) ) ( not ( = ?auto_147826 ?auto_147832 ) ) ( not ( = ?auto_147827 ?auto_147832 ) ) ( not ( = ?auto_147828 ?auto_147832 ) ) ( not ( = ?auto_147831 ?auto_147832 ) ) ( not ( = ?auto_147829 ?auto_147832 ) ) ( not ( = ?auto_147830 ?auto_147832 ) ) ( ON ?auto_147829 ?auto_147830 ) ( ON-TABLE ?auto_147832 ) ( ON ?auto_147831 ?auto_147829 ) ( ON ?auto_147828 ?auto_147831 ) ( ON ?auto_147827 ?auto_147828 ) ( ON ?auto_147826 ?auto_147827 ) ( CLEAR ?auto_147824 ) ( ON ?auto_147825 ?auto_147826 ) ( CLEAR ?auto_147825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147832 ?auto_147830 ?auto_147829 ?auto_147831 ?auto_147828 ?auto_147827 ?auto_147826 )
      ( MAKE-4PILE ?auto_147824 ?auto_147825 ?auto_147826 ?auto_147827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147833 - BLOCK
      ?auto_147834 - BLOCK
      ?auto_147835 - BLOCK
      ?auto_147836 - BLOCK
    )
    :vars
    (
      ?auto_147839 - BLOCK
      ?auto_147838 - BLOCK
      ?auto_147837 - BLOCK
      ?auto_147841 - BLOCK
      ?auto_147840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147833 ?auto_147834 ) ) ( not ( = ?auto_147833 ?auto_147835 ) ) ( not ( = ?auto_147833 ?auto_147836 ) ) ( not ( = ?auto_147833 ?auto_147839 ) ) ( not ( = ?auto_147834 ?auto_147835 ) ) ( not ( = ?auto_147834 ?auto_147836 ) ) ( not ( = ?auto_147834 ?auto_147839 ) ) ( not ( = ?auto_147835 ?auto_147836 ) ) ( not ( = ?auto_147835 ?auto_147839 ) ) ( not ( = ?auto_147836 ?auto_147839 ) ) ( not ( = ?auto_147833 ?auto_147838 ) ) ( not ( = ?auto_147833 ?auto_147837 ) ) ( not ( = ?auto_147834 ?auto_147838 ) ) ( not ( = ?auto_147834 ?auto_147837 ) ) ( not ( = ?auto_147835 ?auto_147838 ) ) ( not ( = ?auto_147835 ?auto_147837 ) ) ( not ( = ?auto_147836 ?auto_147838 ) ) ( not ( = ?auto_147836 ?auto_147837 ) ) ( not ( = ?auto_147839 ?auto_147838 ) ) ( not ( = ?auto_147839 ?auto_147837 ) ) ( not ( = ?auto_147838 ?auto_147837 ) ) ( not ( = ?auto_147841 ?auto_147837 ) ) ( not ( = ?auto_147833 ?auto_147841 ) ) ( not ( = ?auto_147834 ?auto_147841 ) ) ( not ( = ?auto_147835 ?auto_147841 ) ) ( not ( = ?auto_147836 ?auto_147841 ) ) ( not ( = ?auto_147839 ?auto_147841 ) ) ( not ( = ?auto_147838 ?auto_147841 ) ) ( ON ?auto_147841 ?auto_147840 ) ( not ( = ?auto_147833 ?auto_147840 ) ) ( not ( = ?auto_147834 ?auto_147840 ) ) ( not ( = ?auto_147835 ?auto_147840 ) ) ( not ( = ?auto_147836 ?auto_147840 ) ) ( not ( = ?auto_147839 ?auto_147840 ) ) ( not ( = ?auto_147838 ?auto_147840 ) ) ( not ( = ?auto_147837 ?auto_147840 ) ) ( not ( = ?auto_147841 ?auto_147840 ) ) ( ON ?auto_147837 ?auto_147841 ) ( ON-TABLE ?auto_147840 ) ( ON ?auto_147838 ?auto_147837 ) ( ON ?auto_147839 ?auto_147838 ) ( ON ?auto_147836 ?auto_147839 ) ( ON ?auto_147835 ?auto_147836 ) ( ON ?auto_147834 ?auto_147835 ) ( CLEAR ?auto_147834 ) ( HOLDING ?auto_147833 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147833 )
      ( MAKE-4PILE ?auto_147833 ?auto_147834 ?auto_147835 ?auto_147836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147842 - BLOCK
      ?auto_147843 - BLOCK
      ?auto_147844 - BLOCK
      ?auto_147845 - BLOCK
    )
    :vars
    (
      ?auto_147849 - BLOCK
      ?auto_147846 - BLOCK
      ?auto_147848 - BLOCK
      ?auto_147847 - BLOCK
      ?auto_147850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147842 ?auto_147843 ) ) ( not ( = ?auto_147842 ?auto_147844 ) ) ( not ( = ?auto_147842 ?auto_147845 ) ) ( not ( = ?auto_147842 ?auto_147849 ) ) ( not ( = ?auto_147843 ?auto_147844 ) ) ( not ( = ?auto_147843 ?auto_147845 ) ) ( not ( = ?auto_147843 ?auto_147849 ) ) ( not ( = ?auto_147844 ?auto_147845 ) ) ( not ( = ?auto_147844 ?auto_147849 ) ) ( not ( = ?auto_147845 ?auto_147849 ) ) ( not ( = ?auto_147842 ?auto_147846 ) ) ( not ( = ?auto_147842 ?auto_147848 ) ) ( not ( = ?auto_147843 ?auto_147846 ) ) ( not ( = ?auto_147843 ?auto_147848 ) ) ( not ( = ?auto_147844 ?auto_147846 ) ) ( not ( = ?auto_147844 ?auto_147848 ) ) ( not ( = ?auto_147845 ?auto_147846 ) ) ( not ( = ?auto_147845 ?auto_147848 ) ) ( not ( = ?auto_147849 ?auto_147846 ) ) ( not ( = ?auto_147849 ?auto_147848 ) ) ( not ( = ?auto_147846 ?auto_147848 ) ) ( not ( = ?auto_147847 ?auto_147848 ) ) ( not ( = ?auto_147842 ?auto_147847 ) ) ( not ( = ?auto_147843 ?auto_147847 ) ) ( not ( = ?auto_147844 ?auto_147847 ) ) ( not ( = ?auto_147845 ?auto_147847 ) ) ( not ( = ?auto_147849 ?auto_147847 ) ) ( not ( = ?auto_147846 ?auto_147847 ) ) ( ON ?auto_147847 ?auto_147850 ) ( not ( = ?auto_147842 ?auto_147850 ) ) ( not ( = ?auto_147843 ?auto_147850 ) ) ( not ( = ?auto_147844 ?auto_147850 ) ) ( not ( = ?auto_147845 ?auto_147850 ) ) ( not ( = ?auto_147849 ?auto_147850 ) ) ( not ( = ?auto_147846 ?auto_147850 ) ) ( not ( = ?auto_147848 ?auto_147850 ) ) ( not ( = ?auto_147847 ?auto_147850 ) ) ( ON ?auto_147848 ?auto_147847 ) ( ON-TABLE ?auto_147850 ) ( ON ?auto_147846 ?auto_147848 ) ( ON ?auto_147849 ?auto_147846 ) ( ON ?auto_147845 ?auto_147849 ) ( ON ?auto_147844 ?auto_147845 ) ( ON ?auto_147843 ?auto_147844 ) ( ON ?auto_147842 ?auto_147843 ) ( CLEAR ?auto_147842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147850 ?auto_147847 ?auto_147848 ?auto_147846 ?auto_147849 ?auto_147845 ?auto_147844 ?auto_147843 )
      ( MAKE-4PILE ?auto_147842 ?auto_147843 ?auto_147844 ?auto_147845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147855 - BLOCK
      ?auto_147856 - BLOCK
      ?auto_147857 - BLOCK
      ?auto_147858 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_147858 ) ( CLEAR ?auto_147857 ) ( ON-TABLE ?auto_147855 ) ( ON ?auto_147856 ?auto_147855 ) ( ON ?auto_147857 ?auto_147856 ) ( not ( = ?auto_147855 ?auto_147856 ) ) ( not ( = ?auto_147855 ?auto_147857 ) ) ( not ( = ?auto_147855 ?auto_147858 ) ) ( not ( = ?auto_147856 ?auto_147857 ) ) ( not ( = ?auto_147856 ?auto_147858 ) ) ( not ( = ?auto_147857 ?auto_147858 ) ) )
    :subtasks
    ( ( !STACK ?auto_147858 ?auto_147857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147859 - BLOCK
      ?auto_147860 - BLOCK
      ?auto_147861 - BLOCK
      ?auto_147862 - BLOCK
    )
    :vars
    (
      ?auto_147863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147861 ) ( ON-TABLE ?auto_147859 ) ( ON ?auto_147860 ?auto_147859 ) ( ON ?auto_147861 ?auto_147860 ) ( not ( = ?auto_147859 ?auto_147860 ) ) ( not ( = ?auto_147859 ?auto_147861 ) ) ( not ( = ?auto_147859 ?auto_147862 ) ) ( not ( = ?auto_147860 ?auto_147861 ) ) ( not ( = ?auto_147860 ?auto_147862 ) ) ( not ( = ?auto_147861 ?auto_147862 ) ) ( ON ?auto_147862 ?auto_147863 ) ( CLEAR ?auto_147862 ) ( HAND-EMPTY ) ( not ( = ?auto_147859 ?auto_147863 ) ) ( not ( = ?auto_147860 ?auto_147863 ) ) ( not ( = ?auto_147861 ?auto_147863 ) ) ( not ( = ?auto_147862 ?auto_147863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147862 ?auto_147863 )
      ( MAKE-4PILE ?auto_147859 ?auto_147860 ?auto_147861 ?auto_147862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147864 - BLOCK
      ?auto_147865 - BLOCK
      ?auto_147866 - BLOCK
      ?auto_147867 - BLOCK
    )
    :vars
    (
      ?auto_147868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147864 ) ( ON ?auto_147865 ?auto_147864 ) ( not ( = ?auto_147864 ?auto_147865 ) ) ( not ( = ?auto_147864 ?auto_147866 ) ) ( not ( = ?auto_147864 ?auto_147867 ) ) ( not ( = ?auto_147865 ?auto_147866 ) ) ( not ( = ?auto_147865 ?auto_147867 ) ) ( not ( = ?auto_147866 ?auto_147867 ) ) ( ON ?auto_147867 ?auto_147868 ) ( CLEAR ?auto_147867 ) ( not ( = ?auto_147864 ?auto_147868 ) ) ( not ( = ?auto_147865 ?auto_147868 ) ) ( not ( = ?auto_147866 ?auto_147868 ) ) ( not ( = ?auto_147867 ?auto_147868 ) ) ( HOLDING ?auto_147866 ) ( CLEAR ?auto_147865 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147864 ?auto_147865 ?auto_147866 )
      ( MAKE-4PILE ?auto_147864 ?auto_147865 ?auto_147866 ?auto_147867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147869 - BLOCK
      ?auto_147870 - BLOCK
      ?auto_147871 - BLOCK
      ?auto_147872 - BLOCK
    )
    :vars
    (
      ?auto_147873 - BLOCK
      ?auto_147876 - BLOCK
      ?auto_147875 - BLOCK
      ?auto_147874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147869 ) ( ON ?auto_147870 ?auto_147869 ) ( not ( = ?auto_147869 ?auto_147870 ) ) ( not ( = ?auto_147869 ?auto_147871 ) ) ( not ( = ?auto_147869 ?auto_147872 ) ) ( not ( = ?auto_147870 ?auto_147871 ) ) ( not ( = ?auto_147870 ?auto_147872 ) ) ( not ( = ?auto_147871 ?auto_147872 ) ) ( ON ?auto_147872 ?auto_147873 ) ( not ( = ?auto_147869 ?auto_147873 ) ) ( not ( = ?auto_147870 ?auto_147873 ) ) ( not ( = ?auto_147871 ?auto_147873 ) ) ( not ( = ?auto_147872 ?auto_147873 ) ) ( CLEAR ?auto_147870 ) ( ON ?auto_147871 ?auto_147872 ) ( CLEAR ?auto_147871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147876 ) ( ON ?auto_147875 ?auto_147876 ) ( ON ?auto_147874 ?auto_147875 ) ( ON ?auto_147873 ?auto_147874 ) ( not ( = ?auto_147876 ?auto_147875 ) ) ( not ( = ?auto_147876 ?auto_147874 ) ) ( not ( = ?auto_147876 ?auto_147873 ) ) ( not ( = ?auto_147876 ?auto_147872 ) ) ( not ( = ?auto_147876 ?auto_147871 ) ) ( not ( = ?auto_147875 ?auto_147874 ) ) ( not ( = ?auto_147875 ?auto_147873 ) ) ( not ( = ?auto_147875 ?auto_147872 ) ) ( not ( = ?auto_147875 ?auto_147871 ) ) ( not ( = ?auto_147874 ?auto_147873 ) ) ( not ( = ?auto_147874 ?auto_147872 ) ) ( not ( = ?auto_147874 ?auto_147871 ) ) ( not ( = ?auto_147869 ?auto_147876 ) ) ( not ( = ?auto_147869 ?auto_147875 ) ) ( not ( = ?auto_147869 ?auto_147874 ) ) ( not ( = ?auto_147870 ?auto_147876 ) ) ( not ( = ?auto_147870 ?auto_147875 ) ) ( not ( = ?auto_147870 ?auto_147874 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147876 ?auto_147875 ?auto_147874 ?auto_147873 ?auto_147872 )
      ( MAKE-4PILE ?auto_147869 ?auto_147870 ?auto_147871 ?auto_147872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147877 - BLOCK
      ?auto_147878 - BLOCK
      ?auto_147879 - BLOCK
      ?auto_147880 - BLOCK
    )
    :vars
    (
      ?auto_147884 - BLOCK
      ?auto_147883 - BLOCK
      ?auto_147882 - BLOCK
      ?auto_147881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147877 ) ( not ( = ?auto_147877 ?auto_147878 ) ) ( not ( = ?auto_147877 ?auto_147879 ) ) ( not ( = ?auto_147877 ?auto_147880 ) ) ( not ( = ?auto_147878 ?auto_147879 ) ) ( not ( = ?auto_147878 ?auto_147880 ) ) ( not ( = ?auto_147879 ?auto_147880 ) ) ( ON ?auto_147880 ?auto_147884 ) ( not ( = ?auto_147877 ?auto_147884 ) ) ( not ( = ?auto_147878 ?auto_147884 ) ) ( not ( = ?auto_147879 ?auto_147884 ) ) ( not ( = ?auto_147880 ?auto_147884 ) ) ( ON ?auto_147879 ?auto_147880 ) ( CLEAR ?auto_147879 ) ( ON-TABLE ?auto_147883 ) ( ON ?auto_147882 ?auto_147883 ) ( ON ?auto_147881 ?auto_147882 ) ( ON ?auto_147884 ?auto_147881 ) ( not ( = ?auto_147883 ?auto_147882 ) ) ( not ( = ?auto_147883 ?auto_147881 ) ) ( not ( = ?auto_147883 ?auto_147884 ) ) ( not ( = ?auto_147883 ?auto_147880 ) ) ( not ( = ?auto_147883 ?auto_147879 ) ) ( not ( = ?auto_147882 ?auto_147881 ) ) ( not ( = ?auto_147882 ?auto_147884 ) ) ( not ( = ?auto_147882 ?auto_147880 ) ) ( not ( = ?auto_147882 ?auto_147879 ) ) ( not ( = ?auto_147881 ?auto_147884 ) ) ( not ( = ?auto_147881 ?auto_147880 ) ) ( not ( = ?auto_147881 ?auto_147879 ) ) ( not ( = ?auto_147877 ?auto_147883 ) ) ( not ( = ?auto_147877 ?auto_147882 ) ) ( not ( = ?auto_147877 ?auto_147881 ) ) ( not ( = ?auto_147878 ?auto_147883 ) ) ( not ( = ?auto_147878 ?auto_147882 ) ) ( not ( = ?auto_147878 ?auto_147881 ) ) ( HOLDING ?auto_147878 ) ( CLEAR ?auto_147877 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147877 ?auto_147878 )
      ( MAKE-4PILE ?auto_147877 ?auto_147878 ?auto_147879 ?auto_147880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147885 - BLOCK
      ?auto_147886 - BLOCK
      ?auto_147887 - BLOCK
      ?auto_147888 - BLOCK
    )
    :vars
    (
      ?auto_147889 - BLOCK
      ?auto_147890 - BLOCK
      ?auto_147891 - BLOCK
      ?auto_147892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_147885 ) ( not ( = ?auto_147885 ?auto_147886 ) ) ( not ( = ?auto_147885 ?auto_147887 ) ) ( not ( = ?auto_147885 ?auto_147888 ) ) ( not ( = ?auto_147886 ?auto_147887 ) ) ( not ( = ?auto_147886 ?auto_147888 ) ) ( not ( = ?auto_147887 ?auto_147888 ) ) ( ON ?auto_147888 ?auto_147889 ) ( not ( = ?auto_147885 ?auto_147889 ) ) ( not ( = ?auto_147886 ?auto_147889 ) ) ( not ( = ?auto_147887 ?auto_147889 ) ) ( not ( = ?auto_147888 ?auto_147889 ) ) ( ON ?auto_147887 ?auto_147888 ) ( ON-TABLE ?auto_147890 ) ( ON ?auto_147891 ?auto_147890 ) ( ON ?auto_147892 ?auto_147891 ) ( ON ?auto_147889 ?auto_147892 ) ( not ( = ?auto_147890 ?auto_147891 ) ) ( not ( = ?auto_147890 ?auto_147892 ) ) ( not ( = ?auto_147890 ?auto_147889 ) ) ( not ( = ?auto_147890 ?auto_147888 ) ) ( not ( = ?auto_147890 ?auto_147887 ) ) ( not ( = ?auto_147891 ?auto_147892 ) ) ( not ( = ?auto_147891 ?auto_147889 ) ) ( not ( = ?auto_147891 ?auto_147888 ) ) ( not ( = ?auto_147891 ?auto_147887 ) ) ( not ( = ?auto_147892 ?auto_147889 ) ) ( not ( = ?auto_147892 ?auto_147888 ) ) ( not ( = ?auto_147892 ?auto_147887 ) ) ( not ( = ?auto_147885 ?auto_147890 ) ) ( not ( = ?auto_147885 ?auto_147891 ) ) ( not ( = ?auto_147885 ?auto_147892 ) ) ( not ( = ?auto_147886 ?auto_147890 ) ) ( not ( = ?auto_147886 ?auto_147891 ) ) ( not ( = ?auto_147886 ?auto_147892 ) ) ( CLEAR ?auto_147885 ) ( ON ?auto_147886 ?auto_147887 ) ( CLEAR ?auto_147886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147890 ?auto_147891 ?auto_147892 ?auto_147889 ?auto_147888 ?auto_147887 )
      ( MAKE-4PILE ?auto_147885 ?auto_147886 ?auto_147887 ?auto_147888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147893 - BLOCK
      ?auto_147894 - BLOCK
      ?auto_147895 - BLOCK
      ?auto_147896 - BLOCK
    )
    :vars
    (
      ?auto_147899 - BLOCK
      ?auto_147898 - BLOCK
      ?auto_147897 - BLOCK
      ?auto_147900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147893 ?auto_147894 ) ) ( not ( = ?auto_147893 ?auto_147895 ) ) ( not ( = ?auto_147893 ?auto_147896 ) ) ( not ( = ?auto_147894 ?auto_147895 ) ) ( not ( = ?auto_147894 ?auto_147896 ) ) ( not ( = ?auto_147895 ?auto_147896 ) ) ( ON ?auto_147896 ?auto_147899 ) ( not ( = ?auto_147893 ?auto_147899 ) ) ( not ( = ?auto_147894 ?auto_147899 ) ) ( not ( = ?auto_147895 ?auto_147899 ) ) ( not ( = ?auto_147896 ?auto_147899 ) ) ( ON ?auto_147895 ?auto_147896 ) ( ON-TABLE ?auto_147898 ) ( ON ?auto_147897 ?auto_147898 ) ( ON ?auto_147900 ?auto_147897 ) ( ON ?auto_147899 ?auto_147900 ) ( not ( = ?auto_147898 ?auto_147897 ) ) ( not ( = ?auto_147898 ?auto_147900 ) ) ( not ( = ?auto_147898 ?auto_147899 ) ) ( not ( = ?auto_147898 ?auto_147896 ) ) ( not ( = ?auto_147898 ?auto_147895 ) ) ( not ( = ?auto_147897 ?auto_147900 ) ) ( not ( = ?auto_147897 ?auto_147899 ) ) ( not ( = ?auto_147897 ?auto_147896 ) ) ( not ( = ?auto_147897 ?auto_147895 ) ) ( not ( = ?auto_147900 ?auto_147899 ) ) ( not ( = ?auto_147900 ?auto_147896 ) ) ( not ( = ?auto_147900 ?auto_147895 ) ) ( not ( = ?auto_147893 ?auto_147898 ) ) ( not ( = ?auto_147893 ?auto_147897 ) ) ( not ( = ?auto_147893 ?auto_147900 ) ) ( not ( = ?auto_147894 ?auto_147898 ) ) ( not ( = ?auto_147894 ?auto_147897 ) ) ( not ( = ?auto_147894 ?auto_147900 ) ) ( ON ?auto_147894 ?auto_147895 ) ( CLEAR ?auto_147894 ) ( HOLDING ?auto_147893 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147893 )
      ( MAKE-4PILE ?auto_147893 ?auto_147894 ?auto_147895 ?auto_147896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147901 - BLOCK
      ?auto_147902 - BLOCK
      ?auto_147903 - BLOCK
      ?auto_147904 - BLOCK
    )
    :vars
    (
      ?auto_147908 - BLOCK
      ?auto_147907 - BLOCK
      ?auto_147906 - BLOCK
      ?auto_147905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147901 ?auto_147902 ) ) ( not ( = ?auto_147901 ?auto_147903 ) ) ( not ( = ?auto_147901 ?auto_147904 ) ) ( not ( = ?auto_147902 ?auto_147903 ) ) ( not ( = ?auto_147902 ?auto_147904 ) ) ( not ( = ?auto_147903 ?auto_147904 ) ) ( ON ?auto_147904 ?auto_147908 ) ( not ( = ?auto_147901 ?auto_147908 ) ) ( not ( = ?auto_147902 ?auto_147908 ) ) ( not ( = ?auto_147903 ?auto_147908 ) ) ( not ( = ?auto_147904 ?auto_147908 ) ) ( ON ?auto_147903 ?auto_147904 ) ( ON-TABLE ?auto_147907 ) ( ON ?auto_147906 ?auto_147907 ) ( ON ?auto_147905 ?auto_147906 ) ( ON ?auto_147908 ?auto_147905 ) ( not ( = ?auto_147907 ?auto_147906 ) ) ( not ( = ?auto_147907 ?auto_147905 ) ) ( not ( = ?auto_147907 ?auto_147908 ) ) ( not ( = ?auto_147907 ?auto_147904 ) ) ( not ( = ?auto_147907 ?auto_147903 ) ) ( not ( = ?auto_147906 ?auto_147905 ) ) ( not ( = ?auto_147906 ?auto_147908 ) ) ( not ( = ?auto_147906 ?auto_147904 ) ) ( not ( = ?auto_147906 ?auto_147903 ) ) ( not ( = ?auto_147905 ?auto_147908 ) ) ( not ( = ?auto_147905 ?auto_147904 ) ) ( not ( = ?auto_147905 ?auto_147903 ) ) ( not ( = ?auto_147901 ?auto_147907 ) ) ( not ( = ?auto_147901 ?auto_147906 ) ) ( not ( = ?auto_147901 ?auto_147905 ) ) ( not ( = ?auto_147902 ?auto_147907 ) ) ( not ( = ?auto_147902 ?auto_147906 ) ) ( not ( = ?auto_147902 ?auto_147905 ) ) ( ON ?auto_147902 ?auto_147903 ) ( ON ?auto_147901 ?auto_147902 ) ( CLEAR ?auto_147901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147907 ?auto_147906 ?auto_147905 ?auto_147908 ?auto_147904 ?auto_147903 ?auto_147902 )
      ( MAKE-4PILE ?auto_147901 ?auto_147902 ?auto_147903 ?auto_147904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147909 - BLOCK
      ?auto_147910 - BLOCK
      ?auto_147911 - BLOCK
      ?auto_147912 - BLOCK
    )
    :vars
    (
      ?auto_147916 - BLOCK
      ?auto_147913 - BLOCK
      ?auto_147914 - BLOCK
      ?auto_147915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147909 ?auto_147910 ) ) ( not ( = ?auto_147909 ?auto_147911 ) ) ( not ( = ?auto_147909 ?auto_147912 ) ) ( not ( = ?auto_147910 ?auto_147911 ) ) ( not ( = ?auto_147910 ?auto_147912 ) ) ( not ( = ?auto_147911 ?auto_147912 ) ) ( ON ?auto_147912 ?auto_147916 ) ( not ( = ?auto_147909 ?auto_147916 ) ) ( not ( = ?auto_147910 ?auto_147916 ) ) ( not ( = ?auto_147911 ?auto_147916 ) ) ( not ( = ?auto_147912 ?auto_147916 ) ) ( ON ?auto_147911 ?auto_147912 ) ( ON-TABLE ?auto_147913 ) ( ON ?auto_147914 ?auto_147913 ) ( ON ?auto_147915 ?auto_147914 ) ( ON ?auto_147916 ?auto_147915 ) ( not ( = ?auto_147913 ?auto_147914 ) ) ( not ( = ?auto_147913 ?auto_147915 ) ) ( not ( = ?auto_147913 ?auto_147916 ) ) ( not ( = ?auto_147913 ?auto_147912 ) ) ( not ( = ?auto_147913 ?auto_147911 ) ) ( not ( = ?auto_147914 ?auto_147915 ) ) ( not ( = ?auto_147914 ?auto_147916 ) ) ( not ( = ?auto_147914 ?auto_147912 ) ) ( not ( = ?auto_147914 ?auto_147911 ) ) ( not ( = ?auto_147915 ?auto_147916 ) ) ( not ( = ?auto_147915 ?auto_147912 ) ) ( not ( = ?auto_147915 ?auto_147911 ) ) ( not ( = ?auto_147909 ?auto_147913 ) ) ( not ( = ?auto_147909 ?auto_147914 ) ) ( not ( = ?auto_147909 ?auto_147915 ) ) ( not ( = ?auto_147910 ?auto_147913 ) ) ( not ( = ?auto_147910 ?auto_147914 ) ) ( not ( = ?auto_147910 ?auto_147915 ) ) ( ON ?auto_147910 ?auto_147911 ) ( HOLDING ?auto_147909 ) ( CLEAR ?auto_147910 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_147913 ?auto_147914 ?auto_147915 ?auto_147916 ?auto_147912 ?auto_147911 ?auto_147910 ?auto_147909 )
      ( MAKE-4PILE ?auto_147909 ?auto_147910 ?auto_147911 ?auto_147912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147917 - BLOCK
      ?auto_147918 - BLOCK
      ?auto_147919 - BLOCK
      ?auto_147920 - BLOCK
    )
    :vars
    (
      ?auto_147921 - BLOCK
      ?auto_147924 - BLOCK
      ?auto_147923 - BLOCK
      ?auto_147922 - BLOCK
      ?auto_147925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147917 ?auto_147918 ) ) ( not ( = ?auto_147917 ?auto_147919 ) ) ( not ( = ?auto_147917 ?auto_147920 ) ) ( not ( = ?auto_147918 ?auto_147919 ) ) ( not ( = ?auto_147918 ?auto_147920 ) ) ( not ( = ?auto_147919 ?auto_147920 ) ) ( ON ?auto_147920 ?auto_147921 ) ( not ( = ?auto_147917 ?auto_147921 ) ) ( not ( = ?auto_147918 ?auto_147921 ) ) ( not ( = ?auto_147919 ?auto_147921 ) ) ( not ( = ?auto_147920 ?auto_147921 ) ) ( ON ?auto_147919 ?auto_147920 ) ( ON-TABLE ?auto_147924 ) ( ON ?auto_147923 ?auto_147924 ) ( ON ?auto_147922 ?auto_147923 ) ( ON ?auto_147921 ?auto_147922 ) ( not ( = ?auto_147924 ?auto_147923 ) ) ( not ( = ?auto_147924 ?auto_147922 ) ) ( not ( = ?auto_147924 ?auto_147921 ) ) ( not ( = ?auto_147924 ?auto_147920 ) ) ( not ( = ?auto_147924 ?auto_147919 ) ) ( not ( = ?auto_147923 ?auto_147922 ) ) ( not ( = ?auto_147923 ?auto_147921 ) ) ( not ( = ?auto_147923 ?auto_147920 ) ) ( not ( = ?auto_147923 ?auto_147919 ) ) ( not ( = ?auto_147922 ?auto_147921 ) ) ( not ( = ?auto_147922 ?auto_147920 ) ) ( not ( = ?auto_147922 ?auto_147919 ) ) ( not ( = ?auto_147917 ?auto_147924 ) ) ( not ( = ?auto_147917 ?auto_147923 ) ) ( not ( = ?auto_147917 ?auto_147922 ) ) ( not ( = ?auto_147918 ?auto_147924 ) ) ( not ( = ?auto_147918 ?auto_147923 ) ) ( not ( = ?auto_147918 ?auto_147922 ) ) ( ON ?auto_147918 ?auto_147919 ) ( CLEAR ?auto_147918 ) ( ON ?auto_147917 ?auto_147925 ) ( CLEAR ?auto_147917 ) ( HAND-EMPTY ) ( not ( = ?auto_147917 ?auto_147925 ) ) ( not ( = ?auto_147918 ?auto_147925 ) ) ( not ( = ?auto_147919 ?auto_147925 ) ) ( not ( = ?auto_147920 ?auto_147925 ) ) ( not ( = ?auto_147921 ?auto_147925 ) ) ( not ( = ?auto_147924 ?auto_147925 ) ) ( not ( = ?auto_147923 ?auto_147925 ) ) ( not ( = ?auto_147922 ?auto_147925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147917 ?auto_147925 )
      ( MAKE-4PILE ?auto_147917 ?auto_147918 ?auto_147919 ?auto_147920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147926 - BLOCK
      ?auto_147927 - BLOCK
      ?auto_147928 - BLOCK
      ?auto_147929 - BLOCK
    )
    :vars
    (
      ?auto_147934 - BLOCK
      ?auto_147933 - BLOCK
      ?auto_147932 - BLOCK
      ?auto_147931 - BLOCK
      ?auto_147930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147926 ?auto_147927 ) ) ( not ( = ?auto_147926 ?auto_147928 ) ) ( not ( = ?auto_147926 ?auto_147929 ) ) ( not ( = ?auto_147927 ?auto_147928 ) ) ( not ( = ?auto_147927 ?auto_147929 ) ) ( not ( = ?auto_147928 ?auto_147929 ) ) ( ON ?auto_147929 ?auto_147934 ) ( not ( = ?auto_147926 ?auto_147934 ) ) ( not ( = ?auto_147927 ?auto_147934 ) ) ( not ( = ?auto_147928 ?auto_147934 ) ) ( not ( = ?auto_147929 ?auto_147934 ) ) ( ON ?auto_147928 ?auto_147929 ) ( ON-TABLE ?auto_147933 ) ( ON ?auto_147932 ?auto_147933 ) ( ON ?auto_147931 ?auto_147932 ) ( ON ?auto_147934 ?auto_147931 ) ( not ( = ?auto_147933 ?auto_147932 ) ) ( not ( = ?auto_147933 ?auto_147931 ) ) ( not ( = ?auto_147933 ?auto_147934 ) ) ( not ( = ?auto_147933 ?auto_147929 ) ) ( not ( = ?auto_147933 ?auto_147928 ) ) ( not ( = ?auto_147932 ?auto_147931 ) ) ( not ( = ?auto_147932 ?auto_147934 ) ) ( not ( = ?auto_147932 ?auto_147929 ) ) ( not ( = ?auto_147932 ?auto_147928 ) ) ( not ( = ?auto_147931 ?auto_147934 ) ) ( not ( = ?auto_147931 ?auto_147929 ) ) ( not ( = ?auto_147931 ?auto_147928 ) ) ( not ( = ?auto_147926 ?auto_147933 ) ) ( not ( = ?auto_147926 ?auto_147932 ) ) ( not ( = ?auto_147926 ?auto_147931 ) ) ( not ( = ?auto_147927 ?auto_147933 ) ) ( not ( = ?auto_147927 ?auto_147932 ) ) ( not ( = ?auto_147927 ?auto_147931 ) ) ( ON ?auto_147926 ?auto_147930 ) ( CLEAR ?auto_147926 ) ( not ( = ?auto_147926 ?auto_147930 ) ) ( not ( = ?auto_147927 ?auto_147930 ) ) ( not ( = ?auto_147928 ?auto_147930 ) ) ( not ( = ?auto_147929 ?auto_147930 ) ) ( not ( = ?auto_147934 ?auto_147930 ) ) ( not ( = ?auto_147933 ?auto_147930 ) ) ( not ( = ?auto_147932 ?auto_147930 ) ) ( not ( = ?auto_147931 ?auto_147930 ) ) ( HOLDING ?auto_147927 ) ( CLEAR ?auto_147928 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_147933 ?auto_147932 ?auto_147931 ?auto_147934 ?auto_147929 ?auto_147928 ?auto_147927 )
      ( MAKE-4PILE ?auto_147926 ?auto_147927 ?auto_147928 ?auto_147929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147935 - BLOCK
      ?auto_147936 - BLOCK
      ?auto_147937 - BLOCK
      ?auto_147938 - BLOCK
    )
    :vars
    (
      ?auto_147943 - BLOCK
      ?auto_147941 - BLOCK
      ?auto_147942 - BLOCK
      ?auto_147939 - BLOCK
      ?auto_147940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147935 ?auto_147936 ) ) ( not ( = ?auto_147935 ?auto_147937 ) ) ( not ( = ?auto_147935 ?auto_147938 ) ) ( not ( = ?auto_147936 ?auto_147937 ) ) ( not ( = ?auto_147936 ?auto_147938 ) ) ( not ( = ?auto_147937 ?auto_147938 ) ) ( ON ?auto_147938 ?auto_147943 ) ( not ( = ?auto_147935 ?auto_147943 ) ) ( not ( = ?auto_147936 ?auto_147943 ) ) ( not ( = ?auto_147937 ?auto_147943 ) ) ( not ( = ?auto_147938 ?auto_147943 ) ) ( ON ?auto_147937 ?auto_147938 ) ( ON-TABLE ?auto_147941 ) ( ON ?auto_147942 ?auto_147941 ) ( ON ?auto_147939 ?auto_147942 ) ( ON ?auto_147943 ?auto_147939 ) ( not ( = ?auto_147941 ?auto_147942 ) ) ( not ( = ?auto_147941 ?auto_147939 ) ) ( not ( = ?auto_147941 ?auto_147943 ) ) ( not ( = ?auto_147941 ?auto_147938 ) ) ( not ( = ?auto_147941 ?auto_147937 ) ) ( not ( = ?auto_147942 ?auto_147939 ) ) ( not ( = ?auto_147942 ?auto_147943 ) ) ( not ( = ?auto_147942 ?auto_147938 ) ) ( not ( = ?auto_147942 ?auto_147937 ) ) ( not ( = ?auto_147939 ?auto_147943 ) ) ( not ( = ?auto_147939 ?auto_147938 ) ) ( not ( = ?auto_147939 ?auto_147937 ) ) ( not ( = ?auto_147935 ?auto_147941 ) ) ( not ( = ?auto_147935 ?auto_147942 ) ) ( not ( = ?auto_147935 ?auto_147939 ) ) ( not ( = ?auto_147936 ?auto_147941 ) ) ( not ( = ?auto_147936 ?auto_147942 ) ) ( not ( = ?auto_147936 ?auto_147939 ) ) ( ON ?auto_147935 ?auto_147940 ) ( not ( = ?auto_147935 ?auto_147940 ) ) ( not ( = ?auto_147936 ?auto_147940 ) ) ( not ( = ?auto_147937 ?auto_147940 ) ) ( not ( = ?auto_147938 ?auto_147940 ) ) ( not ( = ?auto_147943 ?auto_147940 ) ) ( not ( = ?auto_147941 ?auto_147940 ) ) ( not ( = ?auto_147942 ?auto_147940 ) ) ( not ( = ?auto_147939 ?auto_147940 ) ) ( CLEAR ?auto_147937 ) ( ON ?auto_147936 ?auto_147935 ) ( CLEAR ?auto_147936 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147940 ?auto_147935 )
      ( MAKE-4PILE ?auto_147935 ?auto_147936 ?auto_147937 ?auto_147938 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147944 - BLOCK
      ?auto_147945 - BLOCK
      ?auto_147946 - BLOCK
      ?auto_147947 - BLOCK
    )
    :vars
    (
      ?auto_147950 - BLOCK
      ?auto_147952 - BLOCK
      ?auto_147948 - BLOCK
      ?auto_147949 - BLOCK
      ?auto_147951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147944 ?auto_147945 ) ) ( not ( = ?auto_147944 ?auto_147946 ) ) ( not ( = ?auto_147944 ?auto_147947 ) ) ( not ( = ?auto_147945 ?auto_147946 ) ) ( not ( = ?auto_147945 ?auto_147947 ) ) ( not ( = ?auto_147946 ?auto_147947 ) ) ( ON ?auto_147947 ?auto_147950 ) ( not ( = ?auto_147944 ?auto_147950 ) ) ( not ( = ?auto_147945 ?auto_147950 ) ) ( not ( = ?auto_147946 ?auto_147950 ) ) ( not ( = ?auto_147947 ?auto_147950 ) ) ( ON-TABLE ?auto_147952 ) ( ON ?auto_147948 ?auto_147952 ) ( ON ?auto_147949 ?auto_147948 ) ( ON ?auto_147950 ?auto_147949 ) ( not ( = ?auto_147952 ?auto_147948 ) ) ( not ( = ?auto_147952 ?auto_147949 ) ) ( not ( = ?auto_147952 ?auto_147950 ) ) ( not ( = ?auto_147952 ?auto_147947 ) ) ( not ( = ?auto_147952 ?auto_147946 ) ) ( not ( = ?auto_147948 ?auto_147949 ) ) ( not ( = ?auto_147948 ?auto_147950 ) ) ( not ( = ?auto_147948 ?auto_147947 ) ) ( not ( = ?auto_147948 ?auto_147946 ) ) ( not ( = ?auto_147949 ?auto_147950 ) ) ( not ( = ?auto_147949 ?auto_147947 ) ) ( not ( = ?auto_147949 ?auto_147946 ) ) ( not ( = ?auto_147944 ?auto_147952 ) ) ( not ( = ?auto_147944 ?auto_147948 ) ) ( not ( = ?auto_147944 ?auto_147949 ) ) ( not ( = ?auto_147945 ?auto_147952 ) ) ( not ( = ?auto_147945 ?auto_147948 ) ) ( not ( = ?auto_147945 ?auto_147949 ) ) ( ON ?auto_147944 ?auto_147951 ) ( not ( = ?auto_147944 ?auto_147951 ) ) ( not ( = ?auto_147945 ?auto_147951 ) ) ( not ( = ?auto_147946 ?auto_147951 ) ) ( not ( = ?auto_147947 ?auto_147951 ) ) ( not ( = ?auto_147950 ?auto_147951 ) ) ( not ( = ?auto_147952 ?auto_147951 ) ) ( not ( = ?auto_147948 ?auto_147951 ) ) ( not ( = ?auto_147949 ?auto_147951 ) ) ( ON ?auto_147945 ?auto_147944 ) ( CLEAR ?auto_147945 ) ( ON-TABLE ?auto_147951 ) ( HOLDING ?auto_147946 ) ( CLEAR ?auto_147947 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_147952 ?auto_147948 ?auto_147949 ?auto_147950 ?auto_147947 ?auto_147946 )
      ( MAKE-4PILE ?auto_147944 ?auto_147945 ?auto_147946 ?auto_147947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147953 - BLOCK
      ?auto_147954 - BLOCK
      ?auto_147955 - BLOCK
      ?auto_147956 - BLOCK
    )
    :vars
    (
      ?auto_147960 - BLOCK
      ?auto_147959 - BLOCK
      ?auto_147961 - BLOCK
      ?auto_147957 - BLOCK
      ?auto_147958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147953 ?auto_147954 ) ) ( not ( = ?auto_147953 ?auto_147955 ) ) ( not ( = ?auto_147953 ?auto_147956 ) ) ( not ( = ?auto_147954 ?auto_147955 ) ) ( not ( = ?auto_147954 ?auto_147956 ) ) ( not ( = ?auto_147955 ?auto_147956 ) ) ( ON ?auto_147956 ?auto_147960 ) ( not ( = ?auto_147953 ?auto_147960 ) ) ( not ( = ?auto_147954 ?auto_147960 ) ) ( not ( = ?auto_147955 ?auto_147960 ) ) ( not ( = ?auto_147956 ?auto_147960 ) ) ( ON-TABLE ?auto_147959 ) ( ON ?auto_147961 ?auto_147959 ) ( ON ?auto_147957 ?auto_147961 ) ( ON ?auto_147960 ?auto_147957 ) ( not ( = ?auto_147959 ?auto_147961 ) ) ( not ( = ?auto_147959 ?auto_147957 ) ) ( not ( = ?auto_147959 ?auto_147960 ) ) ( not ( = ?auto_147959 ?auto_147956 ) ) ( not ( = ?auto_147959 ?auto_147955 ) ) ( not ( = ?auto_147961 ?auto_147957 ) ) ( not ( = ?auto_147961 ?auto_147960 ) ) ( not ( = ?auto_147961 ?auto_147956 ) ) ( not ( = ?auto_147961 ?auto_147955 ) ) ( not ( = ?auto_147957 ?auto_147960 ) ) ( not ( = ?auto_147957 ?auto_147956 ) ) ( not ( = ?auto_147957 ?auto_147955 ) ) ( not ( = ?auto_147953 ?auto_147959 ) ) ( not ( = ?auto_147953 ?auto_147961 ) ) ( not ( = ?auto_147953 ?auto_147957 ) ) ( not ( = ?auto_147954 ?auto_147959 ) ) ( not ( = ?auto_147954 ?auto_147961 ) ) ( not ( = ?auto_147954 ?auto_147957 ) ) ( ON ?auto_147953 ?auto_147958 ) ( not ( = ?auto_147953 ?auto_147958 ) ) ( not ( = ?auto_147954 ?auto_147958 ) ) ( not ( = ?auto_147955 ?auto_147958 ) ) ( not ( = ?auto_147956 ?auto_147958 ) ) ( not ( = ?auto_147960 ?auto_147958 ) ) ( not ( = ?auto_147959 ?auto_147958 ) ) ( not ( = ?auto_147961 ?auto_147958 ) ) ( not ( = ?auto_147957 ?auto_147958 ) ) ( ON ?auto_147954 ?auto_147953 ) ( ON-TABLE ?auto_147958 ) ( CLEAR ?auto_147956 ) ( ON ?auto_147955 ?auto_147954 ) ( CLEAR ?auto_147955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_147958 ?auto_147953 ?auto_147954 )
      ( MAKE-4PILE ?auto_147953 ?auto_147954 ?auto_147955 ?auto_147956 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147962 - BLOCK
      ?auto_147963 - BLOCK
      ?auto_147964 - BLOCK
      ?auto_147965 - BLOCK
    )
    :vars
    (
      ?auto_147969 - BLOCK
      ?auto_147970 - BLOCK
      ?auto_147968 - BLOCK
      ?auto_147966 - BLOCK
      ?auto_147967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147962 ?auto_147963 ) ) ( not ( = ?auto_147962 ?auto_147964 ) ) ( not ( = ?auto_147962 ?auto_147965 ) ) ( not ( = ?auto_147963 ?auto_147964 ) ) ( not ( = ?auto_147963 ?auto_147965 ) ) ( not ( = ?auto_147964 ?auto_147965 ) ) ( not ( = ?auto_147962 ?auto_147969 ) ) ( not ( = ?auto_147963 ?auto_147969 ) ) ( not ( = ?auto_147964 ?auto_147969 ) ) ( not ( = ?auto_147965 ?auto_147969 ) ) ( ON-TABLE ?auto_147970 ) ( ON ?auto_147968 ?auto_147970 ) ( ON ?auto_147966 ?auto_147968 ) ( ON ?auto_147969 ?auto_147966 ) ( not ( = ?auto_147970 ?auto_147968 ) ) ( not ( = ?auto_147970 ?auto_147966 ) ) ( not ( = ?auto_147970 ?auto_147969 ) ) ( not ( = ?auto_147970 ?auto_147965 ) ) ( not ( = ?auto_147970 ?auto_147964 ) ) ( not ( = ?auto_147968 ?auto_147966 ) ) ( not ( = ?auto_147968 ?auto_147969 ) ) ( not ( = ?auto_147968 ?auto_147965 ) ) ( not ( = ?auto_147968 ?auto_147964 ) ) ( not ( = ?auto_147966 ?auto_147969 ) ) ( not ( = ?auto_147966 ?auto_147965 ) ) ( not ( = ?auto_147966 ?auto_147964 ) ) ( not ( = ?auto_147962 ?auto_147970 ) ) ( not ( = ?auto_147962 ?auto_147968 ) ) ( not ( = ?auto_147962 ?auto_147966 ) ) ( not ( = ?auto_147963 ?auto_147970 ) ) ( not ( = ?auto_147963 ?auto_147968 ) ) ( not ( = ?auto_147963 ?auto_147966 ) ) ( ON ?auto_147962 ?auto_147967 ) ( not ( = ?auto_147962 ?auto_147967 ) ) ( not ( = ?auto_147963 ?auto_147967 ) ) ( not ( = ?auto_147964 ?auto_147967 ) ) ( not ( = ?auto_147965 ?auto_147967 ) ) ( not ( = ?auto_147969 ?auto_147967 ) ) ( not ( = ?auto_147970 ?auto_147967 ) ) ( not ( = ?auto_147968 ?auto_147967 ) ) ( not ( = ?auto_147966 ?auto_147967 ) ) ( ON ?auto_147963 ?auto_147962 ) ( ON-TABLE ?auto_147967 ) ( ON ?auto_147964 ?auto_147963 ) ( CLEAR ?auto_147964 ) ( HOLDING ?auto_147965 ) ( CLEAR ?auto_147969 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147970 ?auto_147968 ?auto_147966 ?auto_147969 ?auto_147965 )
      ( MAKE-4PILE ?auto_147962 ?auto_147963 ?auto_147964 ?auto_147965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147971 - BLOCK
      ?auto_147972 - BLOCK
      ?auto_147973 - BLOCK
      ?auto_147974 - BLOCK
    )
    :vars
    (
      ?auto_147979 - BLOCK
      ?auto_147975 - BLOCK
      ?auto_147977 - BLOCK
      ?auto_147978 - BLOCK
      ?auto_147976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147971 ?auto_147972 ) ) ( not ( = ?auto_147971 ?auto_147973 ) ) ( not ( = ?auto_147971 ?auto_147974 ) ) ( not ( = ?auto_147972 ?auto_147973 ) ) ( not ( = ?auto_147972 ?auto_147974 ) ) ( not ( = ?auto_147973 ?auto_147974 ) ) ( not ( = ?auto_147971 ?auto_147979 ) ) ( not ( = ?auto_147972 ?auto_147979 ) ) ( not ( = ?auto_147973 ?auto_147979 ) ) ( not ( = ?auto_147974 ?auto_147979 ) ) ( ON-TABLE ?auto_147975 ) ( ON ?auto_147977 ?auto_147975 ) ( ON ?auto_147978 ?auto_147977 ) ( ON ?auto_147979 ?auto_147978 ) ( not ( = ?auto_147975 ?auto_147977 ) ) ( not ( = ?auto_147975 ?auto_147978 ) ) ( not ( = ?auto_147975 ?auto_147979 ) ) ( not ( = ?auto_147975 ?auto_147974 ) ) ( not ( = ?auto_147975 ?auto_147973 ) ) ( not ( = ?auto_147977 ?auto_147978 ) ) ( not ( = ?auto_147977 ?auto_147979 ) ) ( not ( = ?auto_147977 ?auto_147974 ) ) ( not ( = ?auto_147977 ?auto_147973 ) ) ( not ( = ?auto_147978 ?auto_147979 ) ) ( not ( = ?auto_147978 ?auto_147974 ) ) ( not ( = ?auto_147978 ?auto_147973 ) ) ( not ( = ?auto_147971 ?auto_147975 ) ) ( not ( = ?auto_147971 ?auto_147977 ) ) ( not ( = ?auto_147971 ?auto_147978 ) ) ( not ( = ?auto_147972 ?auto_147975 ) ) ( not ( = ?auto_147972 ?auto_147977 ) ) ( not ( = ?auto_147972 ?auto_147978 ) ) ( ON ?auto_147971 ?auto_147976 ) ( not ( = ?auto_147971 ?auto_147976 ) ) ( not ( = ?auto_147972 ?auto_147976 ) ) ( not ( = ?auto_147973 ?auto_147976 ) ) ( not ( = ?auto_147974 ?auto_147976 ) ) ( not ( = ?auto_147979 ?auto_147976 ) ) ( not ( = ?auto_147975 ?auto_147976 ) ) ( not ( = ?auto_147977 ?auto_147976 ) ) ( not ( = ?auto_147978 ?auto_147976 ) ) ( ON ?auto_147972 ?auto_147971 ) ( ON-TABLE ?auto_147976 ) ( ON ?auto_147973 ?auto_147972 ) ( CLEAR ?auto_147979 ) ( ON ?auto_147974 ?auto_147973 ) ( CLEAR ?auto_147974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147976 ?auto_147971 ?auto_147972 ?auto_147973 )
      ( MAKE-4PILE ?auto_147971 ?auto_147972 ?auto_147973 ?auto_147974 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147980 - BLOCK
      ?auto_147981 - BLOCK
      ?auto_147982 - BLOCK
      ?auto_147983 - BLOCK
    )
    :vars
    (
      ?auto_147987 - BLOCK
      ?auto_147984 - BLOCK
      ?auto_147988 - BLOCK
      ?auto_147986 - BLOCK
      ?auto_147985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147980 ?auto_147981 ) ) ( not ( = ?auto_147980 ?auto_147982 ) ) ( not ( = ?auto_147980 ?auto_147983 ) ) ( not ( = ?auto_147981 ?auto_147982 ) ) ( not ( = ?auto_147981 ?auto_147983 ) ) ( not ( = ?auto_147982 ?auto_147983 ) ) ( not ( = ?auto_147980 ?auto_147987 ) ) ( not ( = ?auto_147981 ?auto_147987 ) ) ( not ( = ?auto_147982 ?auto_147987 ) ) ( not ( = ?auto_147983 ?auto_147987 ) ) ( ON-TABLE ?auto_147984 ) ( ON ?auto_147988 ?auto_147984 ) ( ON ?auto_147986 ?auto_147988 ) ( not ( = ?auto_147984 ?auto_147988 ) ) ( not ( = ?auto_147984 ?auto_147986 ) ) ( not ( = ?auto_147984 ?auto_147987 ) ) ( not ( = ?auto_147984 ?auto_147983 ) ) ( not ( = ?auto_147984 ?auto_147982 ) ) ( not ( = ?auto_147988 ?auto_147986 ) ) ( not ( = ?auto_147988 ?auto_147987 ) ) ( not ( = ?auto_147988 ?auto_147983 ) ) ( not ( = ?auto_147988 ?auto_147982 ) ) ( not ( = ?auto_147986 ?auto_147987 ) ) ( not ( = ?auto_147986 ?auto_147983 ) ) ( not ( = ?auto_147986 ?auto_147982 ) ) ( not ( = ?auto_147980 ?auto_147984 ) ) ( not ( = ?auto_147980 ?auto_147988 ) ) ( not ( = ?auto_147980 ?auto_147986 ) ) ( not ( = ?auto_147981 ?auto_147984 ) ) ( not ( = ?auto_147981 ?auto_147988 ) ) ( not ( = ?auto_147981 ?auto_147986 ) ) ( ON ?auto_147980 ?auto_147985 ) ( not ( = ?auto_147980 ?auto_147985 ) ) ( not ( = ?auto_147981 ?auto_147985 ) ) ( not ( = ?auto_147982 ?auto_147985 ) ) ( not ( = ?auto_147983 ?auto_147985 ) ) ( not ( = ?auto_147987 ?auto_147985 ) ) ( not ( = ?auto_147984 ?auto_147985 ) ) ( not ( = ?auto_147988 ?auto_147985 ) ) ( not ( = ?auto_147986 ?auto_147985 ) ) ( ON ?auto_147981 ?auto_147980 ) ( ON-TABLE ?auto_147985 ) ( ON ?auto_147982 ?auto_147981 ) ( ON ?auto_147983 ?auto_147982 ) ( CLEAR ?auto_147983 ) ( HOLDING ?auto_147987 ) ( CLEAR ?auto_147986 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_147984 ?auto_147988 ?auto_147986 ?auto_147987 )
      ( MAKE-4PILE ?auto_147980 ?auto_147981 ?auto_147982 ?auto_147983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147989 - BLOCK
      ?auto_147990 - BLOCK
      ?auto_147991 - BLOCK
      ?auto_147992 - BLOCK
    )
    :vars
    (
      ?auto_147997 - BLOCK
      ?auto_147994 - BLOCK
      ?auto_147996 - BLOCK
      ?auto_147993 - BLOCK
      ?auto_147995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147989 ?auto_147990 ) ) ( not ( = ?auto_147989 ?auto_147991 ) ) ( not ( = ?auto_147989 ?auto_147992 ) ) ( not ( = ?auto_147990 ?auto_147991 ) ) ( not ( = ?auto_147990 ?auto_147992 ) ) ( not ( = ?auto_147991 ?auto_147992 ) ) ( not ( = ?auto_147989 ?auto_147997 ) ) ( not ( = ?auto_147990 ?auto_147997 ) ) ( not ( = ?auto_147991 ?auto_147997 ) ) ( not ( = ?auto_147992 ?auto_147997 ) ) ( ON-TABLE ?auto_147994 ) ( ON ?auto_147996 ?auto_147994 ) ( ON ?auto_147993 ?auto_147996 ) ( not ( = ?auto_147994 ?auto_147996 ) ) ( not ( = ?auto_147994 ?auto_147993 ) ) ( not ( = ?auto_147994 ?auto_147997 ) ) ( not ( = ?auto_147994 ?auto_147992 ) ) ( not ( = ?auto_147994 ?auto_147991 ) ) ( not ( = ?auto_147996 ?auto_147993 ) ) ( not ( = ?auto_147996 ?auto_147997 ) ) ( not ( = ?auto_147996 ?auto_147992 ) ) ( not ( = ?auto_147996 ?auto_147991 ) ) ( not ( = ?auto_147993 ?auto_147997 ) ) ( not ( = ?auto_147993 ?auto_147992 ) ) ( not ( = ?auto_147993 ?auto_147991 ) ) ( not ( = ?auto_147989 ?auto_147994 ) ) ( not ( = ?auto_147989 ?auto_147996 ) ) ( not ( = ?auto_147989 ?auto_147993 ) ) ( not ( = ?auto_147990 ?auto_147994 ) ) ( not ( = ?auto_147990 ?auto_147996 ) ) ( not ( = ?auto_147990 ?auto_147993 ) ) ( ON ?auto_147989 ?auto_147995 ) ( not ( = ?auto_147989 ?auto_147995 ) ) ( not ( = ?auto_147990 ?auto_147995 ) ) ( not ( = ?auto_147991 ?auto_147995 ) ) ( not ( = ?auto_147992 ?auto_147995 ) ) ( not ( = ?auto_147997 ?auto_147995 ) ) ( not ( = ?auto_147994 ?auto_147995 ) ) ( not ( = ?auto_147996 ?auto_147995 ) ) ( not ( = ?auto_147993 ?auto_147995 ) ) ( ON ?auto_147990 ?auto_147989 ) ( ON-TABLE ?auto_147995 ) ( ON ?auto_147991 ?auto_147990 ) ( ON ?auto_147992 ?auto_147991 ) ( CLEAR ?auto_147993 ) ( ON ?auto_147997 ?auto_147992 ) ( CLEAR ?auto_147997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_147995 ?auto_147989 ?auto_147990 ?auto_147991 ?auto_147992 )
      ( MAKE-4PILE ?auto_147989 ?auto_147990 ?auto_147991 ?auto_147992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_147998 - BLOCK
      ?auto_147999 - BLOCK
      ?auto_148000 - BLOCK
      ?auto_148001 - BLOCK
    )
    :vars
    (
      ?auto_148006 - BLOCK
      ?auto_148002 - BLOCK
      ?auto_148005 - BLOCK
      ?auto_148003 - BLOCK
      ?auto_148004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_147998 ?auto_147999 ) ) ( not ( = ?auto_147998 ?auto_148000 ) ) ( not ( = ?auto_147998 ?auto_148001 ) ) ( not ( = ?auto_147999 ?auto_148000 ) ) ( not ( = ?auto_147999 ?auto_148001 ) ) ( not ( = ?auto_148000 ?auto_148001 ) ) ( not ( = ?auto_147998 ?auto_148006 ) ) ( not ( = ?auto_147999 ?auto_148006 ) ) ( not ( = ?auto_148000 ?auto_148006 ) ) ( not ( = ?auto_148001 ?auto_148006 ) ) ( ON-TABLE ?auto_148002 ) ( ON ?auto_148005 ?auto_148002 ) ( not ( = ?auto_148002 ?auto_148005 ) ) ( not ( = ?auto_148002 ?auto_148003 ) ) ( not ( = ?auto_148002 ?auto_148006 ) ) ( not ( = ?auto_148002 ?auto_148001 ) ) ( not ( = ?auto_148002 ?auto_148000 ) ) ( not ( = ?auto_148005 ?auto_148003 ) ) ( not ( = ?auto_148005 ?auto_148006 ) ) ( not ( = ?auto_148005 ?auto_148001 ) ) ( not ( = ?auto_148005 ?auto_148000 ) ) ( not ( = ?auto_148003 ?auto_148006 ) ) ( not ( = ?auto_148003 ?auto_148001 ) ) ( not ( = ?auto_148003 ?auto_148000 ) ) ( not ( = ?auto_147998 ?auto_148002 ) ) ( not ( = ?auto_147998 ?auto_148005 ) ) ( not ( = ?auto_147998 ?auto_148003 ) ) ( not ( = ?auto_147999 ?auto_148002 ) ) ( not ( = ?auto_147999 ?auto_148005 ) ) ( not ( = ?auto_147999 ?auto_148003 ) ) ( ON ?auto_147998 ?auto_148004 ) ( not ( = ?auto_147998 ?auto_148004 ) ) ( not ( = ?auto_147999 ?auto_148004 ) ) ( not ( = ?auto_148000 ?auto_148004 ) ) ( not ( = ?auto_148001 ?auto_148004 ) ) ( not ( = ?auto_148006 ?auto_148004 ) ) ( not ( = ?auto_148002 ?auto_148004 ) ) ( not ( = ?auto_148005 ?auto_148004 ) ) ( not ( = ?auto_148003 ?auto_148004 ) ) ( ON ?auto_147999 ?auto_147998 ) ( ON-TABLE ?auto_148004 ) ( ON ?auto_148000 ?auto_147999 ) ( ON ?auto_148001 ?auto_148000 ) ( ON ?auto_148006 ?auto_148001 ) ( CLEAR ?auto_148006 ) ( HOLDING ?auto_148003 ) ( CLEAR ?auto_148005 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148002 ?auto_148005 ?auto_148003 )
      ( MAKE-4PILE ?auto_147998 ?auto_147999 ?auto_148000 ?auto_148001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148007 - BLOCK
      ?auto_148008 - BLOCK
      ?auto_148009 - BLOCK
      ?auto_148010 - BLOCK
    )
    :vars
    (
      ?auto_148011 - BLOCK
      ?auto_148015 - BLOCK
      ?auto_148013 - BLOCK
      ?auto_148014 - BLOCK
      ?auto_148012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148007 ?auto_148008 ) ) ( not ( = ?auto_148007 ?auto_148009 ) ) ( not ( = ?auto_148007 ?auto_148010 ) ) ( not ( = ?auto_148008 ?auto_148009 ) ) ( not ( = ?auto_148008 ?auto_148010 ) ) ( not ( = ?auto_148009 ?auto_148010 ) ) ( not ( = ?auto_148007 ?auto_148011 ) ) ( not ( = ?auto_148008 ?auto_148011 ) ) ( not ( = ?auto_148009 ?auto_148011 ) ) ( not ( = ?auto_148010 ?auto_148011 ) ) ( ON-TABLE ?auto_148015 ) ( ON ?auto_148013 ?auto_148015 ) ( not ( = ?auto_148015 ?auto_148013 ) ) ( not ( = ?auto_148015 ?auto_148014 ) ) ( not ( = ?auto_148015 ?auto_148011 ) ) ( not ( = ?auto_148015 ?auto_148010 ) ) ( not ( = ?auto_148015 ?auto_148009 ) ) ( not ( = ?auto_148013 ?auto_148014 ) ) ( not ( = ?auto_148013 ?auto_148011 ) ) ( not ( = ?auto_148013 ?auto_148010 ) ) ( not ( = ?auto_148013 ?auto_148009 ) ) ( not ( = ?auto_148014 ?auto_148011 ) ) ( not ( = ?auto_148014 ?auto_148010 ) ) ( not ( = ?auto_148014 ?auto_148009 ) ) ( not ( = ?auto_148007 ?auto_148015 ) ) ( not ( = ?auto_148007 ?auto_148013 ) ) ( not ( = ?auto_148007 ?auto_148014 ) ) ( not ( = ?auto_148008 ?auto_148015 ) ) ( not ( = ?auto_148008 ?auto_148013 ) ) ( not ( = ?auto_148008 ?auto_148014 ) ) ( ON ?auto_148007 ?auto_148012 ) ( not ( = ?auto_148007 ?auto_148012 ) ) ( not ( = ?auto_148008 ?auto_148012 ) ) ( not ( = ?auto_148009 ?auto_148012 ) ) ( not ( = ?auto_148010 ?auto_148012 ) ) ( not ( = ?auto_148011 ?auto_148012 ) ) ( not ( = ?auto_148015 ?auto_148012 ) ) ( not ( = ?auto_148013 ?auto_148012 ) ) ( not ( = ?auto_148014 ?auto_148012 ) ) ( ON ?auto_148008 ?auto_148007 ) ( ON-TABLE ?auto_148012 ) ( ON ?auto_148009 ?auto_148008 ) ( ON ?auto_148010 ?auto_148009 ) ( ON ?auto_148011 ?auto_148010 ) ( CLEAR ?auto_148013 ) ( ON ?auto_148014 ?auto_148011 ) ( CLEAR ?auto_148014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148012 ?auto_148007 ?auto_148008 ?auto_148009 ?auto_148010 ?auto_148011 )
      ( MAKE-4PILE ?auto_148007 ?auto_148008 ?auto_148009 ?auto_148010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148016 - BLOCK
      ?auto_148017 - BLOCK
      ?auto_148018 - BLOCK
      ?auto_148019 - BLOCK
    )
    :vars
    (
      ?auto_148022 - BLOCK
      ?auto_148021 - BLOCK
      ?auto_148023 - BLOCK
      ?auto_148024 - BLOCK
      ?auto_148020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148016 ?auto_148017 ) ) ( not ( = ?auto_148016 ?auto_148018 ) ) ( not ( = ?auto_148016 ?auto_148019 ) ) ( not ( = ?auto_148017 ?auto_148018 ) ) ( not ( = ?auto_148017 ?auto_148019 ) ) ( not ( = ?auto_148018 ?auto_148019 ) ) ( not ( = ?auto_148016 ?auto_148022 ) ) ( not ( = ?auto_148017 ?auto_148022 ) ) ( not ( = ?auto_148018 ?auto_148022 ) ) ( not ( = ?auto_148019 ?auto_148022 ) ) ( ON-TABLE ?auto_148021 ) ( not ( = ?auto_148021 ?auto_148023 ) ) ( not ( = ?auto_148021 ?auto_148024 ) ) ( not ( = ?auto_148021 ?auto_148022 ) ) ( not ( = ?auto_148021 ?auto_148019 ) ) ( not ( = ?auto_148021 ?auto_148018 ) ) ( not ( = ?auto_148023 ?auto_148024 ) ) ( not ( = ?auto_148023 ?auto_148022 ) ) ( not ( = ?auto_148023 ?auto_148019 ) ) ( not ( = ?auto_148023 ?auto_148018 ) ) ( not ( = ?auto_148024 ?auto_148022 ) ) ( not ( = ?auto_148024 ?auto_148019 ) ) ( not ( = ?auto_148024 ?auto_148018 ) ) ( not ( = ?auto_148016 ?auto_148021 ) ) ( not ( = ?auto_148016 ?auto_148023 ) ) ( not ( = ?auto_148016 ?auto_148024 ) ) ( not ( = ?auto_148017 ?auto_148021 ) ) ( not ( = ?auto_148017 ?auto_148023 ) ) ( not ( = ?auto_148017 ?auto_148024 ) ) ( ON ?auto_148016 ?auto_148020 ) ( not ( = ?auto_148016 ?auto_148020 ) ) ( not ( = ?auto_148017 ?auto_148020 ) ) ( not ( = ?auto_148018 ?auto_148020 ) ) ( not ( = ?auto_148019 ?auto_148020 ) ) ( not ( = ?auto_148022 ?auto_148020 ) ) ( not ( = ?auto_148021 ?auto_148020 ) ) ( not ( = ?auto_148023 ?auto_148020 ) ) ( not ( = ?auto_148024 ?auto_148020 ) ) ( ON ?auto_148017 ?auto_148016 ) ( ON-TABLE ?auto_148020 ) ( ON ?auto_148018 ?auto_148017 ) ( ON ?auto_148019 ?auto_148018 ) ( ON ?auto_148022 ?auto_148019 ) ( ON ?auto_148024 ?auto_148022 ) ( CLEAR ?auto_148024 ) ( HOLDING ?auto_148023 ) ( CLEAR ?auto_148021 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148021 ?auto_148023 )
      ( MAKE-4PILE ?auto_148016 ?auto_148017 ?auto_148018 ?auto_148019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148025 - BLOCK
      ?auto_148026 - BLOCK
      ?auto_148027 - BLOCK
      ?auto_148028 - BLOCK
    )
    :vars
    (
      ?auto_148030 - BLOCK
      ?auto_148029 - BLOCK
      ?auto_148033 - BLOCK
      ?auto_148032 - BLOCK
      ?auto_148031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148025 ?auto_148026 ) ) ( not ( = ?auto_148025 ?auto_148027 ) ) ( not ( = ?auto_148025 ?auto_148028 ) ) ( not ( = ?auto_148026 ?auto_148027 ) ) ( not ( = ?auto_148026 ?auto_148028 ) ) ( not ( = ?auto_148027 ?auto_148028 ) ) ( not ( = ?auto_148025 ?auto_148030 ) ) ( not ( = ?auto_148026 ?auto_148030 ) ) ( not ( = ?auto_148027 ?auto_148030 ) ) ( not ( = ?auto_148028 ?auto_148030 ) ) ( ON-TABLE ?auto_148029 ) ( not ( = ?auto_148029 ?auto_148033 ) ) ( not ( = ?auto_148029 ?auto_148032 ) ) ( not ( = ?auto_148029 ?auto_148030 ) ) ( not ( = ?auto_148029 ?auto_148028 ) ) ( not ( = ?auto_148029 ?auto_148027 ) ) ( not ( = ?auto_148033 ?auto_148032 ) ) ( not ( = ?auto_148033 ?auto_148030 ) ) ( not ( = ?auto_148033 ?auto_148028 ) ) ( not ( = ?auto_148033 ?auto_148027 ) ) ( not ( = ?auto_148032 ?auto_148030 ) ) ( not ( = ?auto_148032 ?auto_148028 ) ) ( not ( = ?auto_148032 ?auto_148027 ) ) ( not ( = ?auto_148025 ?auto_148029 ) ) ( not ( = ?auto_148025 ?auto_148033 ) ) ( not ( = ?auto_148025 ?auto_148032 ) ) ( not ( = ?auto_148026 ?auto_148029 ) ) ( not ( = ?auto_148026 ?auto_148033 ) ) ( not ( = ?auto_148026 ?auto_148032 ) ) ( ON ?auto_148025 ?auto_148031 ) ( not ( = ?auto_148025 ?auto_148031 ) ) ( not ( = ?auto_148026 ?auto_148031 ) ) ( not ( = ?auto_148027 ?auto_148031 ) ) ( not ( = ?auto_148028 ?auto_148031 ) ) ( not ( = ?auto_148030 ?auto_148031 ) ) ( not ( = ?auto_148029 ?auto_148031 ) ) ( not ( = ?auto_148033 ?auto_148031 ) ) ( not ( = ?auto_148032 ?auto_148031 ) ) ( ON ?auto_148026 ?auto_148025 ) ( ON-TABLE ?auto_148031 ) ( ON ?auto_148027 ?auto_148026 ) ( ON ?auto_148028 ?auto_148027 ) ( ON ?auto_148030 ?auto_148028 ) ( ON ?auto_148032 ?auto_148030 ) ( CLEAR ?auto_148029 ) ( ON ?auto_148033 ?auto_148032 ) ( CLEAR ?auto_148033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148031 ?auto_148025 ?auto_148026 ?auto_148027 ?auto_148028 ?auto_148030 ?auto_148032 )
      ( MAKE-4PILE ?auto_148025 ?auto_148026 ?auto_148027 ?auto_148028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148034 - BLOCK
      ?auto_148035 - BLOCK
      ?auto_148036 - BLOCK
      ?auto_148037 - BLOCK
    )
    :vars
    (
      ?auto_148041 - BLOCK
      ?auto_148038 - BLOCK
      ?auto_148039 - BLOCK
      ?auto_148042 - BLOCK
      ?auto_148040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148034 ?auto_148035 ) ) ( not ( = ?auto_148034 ?auto_148036 ) ) ( not ( = ?auto_148034 ?auto_148037 ) ) ( not ( = ?auto_148035 ?auto_148036 ) ) ( not ( = ?auto_148035 ?auto_148037 ) ) ( not ( = ?auto_148036 ?auto_148037 ) ) ( not ( = ?auto_148034 ?auto_148041 ) ) ( not ( = ?auto_148035 ?auto_148041 ) ) ( not ( = ?auto_148036 ?auto_148041 ) ) ( not ( = ?auto_148037 ?auto_148041 ) ) ( not ( = ?auto_148038 ?auto_148039 ) ) ( not ( = ?auto_148038 ?auto_148042 ) ) ( not ( = ?auto_148038 ?auto_148041 ) ) ( not ( = ?auto_148038 ?auto_148037 ) ) ( not ( = ?auto_148038 ?auto_148036 ) ) ( not ( = ?auto_148039 ?auto_148042 ) ) ( not ( = ?auto_148039 ?auto_148041 ) ) ( not ( = ?auto_148039 ?auto_148037 ) ) ( not ( = ?auto_148039 ?auto_148036 ) ) ( not ( = ?auto_148042 ?auto_148041 ) ) ( not ( = ?auto_148042 ?auto_148037 ) ) ( not ( = ?auto_148042 ?auto_148036 ) ) ( not ( = ?auto_148034 ?auto_148038 ) ) ( not ( = ?auto_148034 ?auto_148039 ) ) ( not ( = ?auto_148034 ?auto_148042 ) ) ( not ( = ?auto_148035 ?auto_148038 ) ) ( not ( = ?auto_148035 ?auto_148039 ) ) ( not ( = ?auto_148035 ?auto_148042 ) ) ( ON ?auto_148034 ?auto_148040 ) ( not ( = ?auto_148034 ?auto_148040 ) ) ( not ( = ?auto_148035 ?auto_148040 ) ) ( not ( = ?auto_148036 ?auto_148040 ) ) ( not ( = ?auto_148037 ?auto_148040 ) ) ( not ( = ?auto_148041 ?auto_148040 ) ) ( not ( = ?auto_148038 ?auto_148040 ) ) ( not ( = ?auto_148039 ?auto_148040 ) ) ( not ( = ?auto_148042 ?auto_148040 ) ) ( ON ?auto_148035 ?auto_148034 ) ( ON-TABLE ?auto_148040 ) ( ON ?auto_148036 ?auto_148035 ) ( ON ?auto_148037 ?auto_148036 ) ( ON ?auto_148041 ?auto_148037 ) ( ON ?auto_148042 ?auto_148041 ) ( ON ?auto_148039 ?auto_148042 ) ( CLEAR ?auto_148039 ) ( HOLDING ?auto_148038 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148038 )
      ( MAKE-4PILE ?auto_148034 ?auto_148035 ?auto_148036 ?auto_148037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148043 - BLOCK
      ?auto_148044 - BLOCK
      ?auto_148045 - BLOCK
      ?auto_148046 - BLOCK
    )
    :vars
    (
      ?auto_148050 - BLOCK
      ?auto_148051 - BLOCK
      ?auto_148047 - BLOCK
      ?auto_148048 - BLOCK
      ?auto_148049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148043 ?auto_148044 ) ) ( not ( = ?auto_148043 ?auto_148045 ) ) ( not ( = ?auto_148043 ?auto_148046 ) ) ( not ( = ?auto_148044 ?auto_148045 ) ) ( not ( = ?auto_148044 ?auto_148046 ) ) ( not ( = ?auto_148045 ?auto_148046 ) ) ( not ( = ?auto_148043 ?auto_148050 ) ) ( not ( = ?auto_148044 ?auto_148050 ) ) ( not ( = ?auto_148045 ?auto_148050 ) ) ( not ( = ?auto_148046 ?auto_148050 ) ) ( not ( = ?auto_148051 ?auto_148047 ) ) ( not ( = ?auto_148051 ?auto_148048 ) ) ( not ( = ?auto_148051 ?auto_148050 ) ) ( not ( = ?auto_148051 ?auto_148046 ) ) ( not ( = ?auto_148051 ?auto_148045 ) ) ( not ( = ?auto_148047 ?auto_148048 ) ) ( not ( = ?auto_148047 ?auto_148050 ) ) ( not ( = ?auto_148047 ?auto_148046 ) ) ( not ( = ?auto_148047 ?auto_148045 ) ) ( not ( = ?auto_148048 ?auto_148050 ) ) ( not ( = ?auto_148048 ?auto_148046 ) ) ( not ( = ?auto_148048 ?auto_148045 ) ) ( not ( = ?auto_148043 ?auto_148051 ) ) ( not ( = ?auto_148043 ?auto_148047 ) ) ( not ( = ?auto_148043 ?auto_148048 ) ) ( not ( = ?auto_148044 ?auto_148051 ) ) ( not ( = ?auto_148044 ?auto_148047 ) ) ( not ( = ?auto_148044 ?auto_148048 ) ) ( ON ?auto_148043 ?auto_148049 ) ( not ( = ?auto_148043 ?auto_148049 ) ) ( not ( = ?auto_148044 ?auto_148049 ) ) ( not ( = ?auto_148045 ?auto_148049 ) ) ( not ( = ?auto_148046 ?auto_148049 ) ) ( not ( = ?auto_148050 ?auto_148049 ) ) ( not ( = ?auto_148051 ?auto_148049 ) ) ( not ( = ?auto_148047 ?auto_148049 ) ) ( not ( = ?auto_148048 ?auto_148049 ) ) ( ON ?auto_148044 ?auto_148043 ) ( ON-TABLE ?auto_148049 ) ( ON ?auto_148045 ?auto_148044 ) ( ON ?auto_148046 ?auto_148045 ) ( ON ?auto_148050 ?auto_148046 ) ( ON ?auto_148048 ?auto_148050 ) ( ON ?auto_148047 ?auto_148048 ) ( ON ?auto_148051 ?auto_148047 ) ( CLEAR ?auto_148051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148049 ?auto_148043 ?auto_148044 ?auto_148045 ?auto_148046 ?auto_148050 ?auto_148048 ?auto_148047 )
      ( MAKE-4PILE ?auto_148043 ?auto_148044 ?auto_148045 ?auto_148046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148055 - BLOCK
      ?auto_148056 - BLOCK
      ?auto_148057 - BLOCK
    )
    :vars
    (
      ?auto_148058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148058 ?auto_148057 ) ( CLEAR ?auto_148058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148055 ) ( ON ?auto_148056 ?auto_148055 ) ( ON ?auto_148057 ?auto_148056 ) ( not ( = ?auto_148055 ?auto_148056 ) ) ( not ( = ?auto_148055 ?auto_148057 ) ) ( not ( = ?auto_148055 ?auto_148058 ) ) ( not ( = ?auto_148056 ?auto_148057 ) ) ( not ( = ?auto_148056 ?auto_148058 ) ) ( not ( = ?auto_148057 ?auto_148058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148058 ?auto_148057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148059 - BLOCK
      ?auto_148060 - BLOCK
      ?auto_148061 - BLOCK
    )
    :vars
    (
      ?auto_148062 - BLOCK
      ?auto_148063 - BLOCK
      ?auto_148064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148062 ?auto_148061 ) ( CLEAR ?auto_148062 ) ( ON-TABLE ?auto_148059 ) ( ON ?auto_148060 ?auto_148059 ) ( ON ?auto_148061 ?auto_148060 ) ( not ( = ?auto_148059 ?auto_148060 ) ) ( not ( = ?auto_148059 ?auto_148061 ) ) ( not ( = ?auto_148059 ?auto_148062 ) ) ( not ( = ?auto_148060 ?auto_148061 ) ) ( not ( = ?auto_148060 ?auto_148062 ) ) ( not ( = ?auto_148061 ?auto_148062 ) ) ( HOLDING ?auto_148063 ) ( CLEAR ?auto_148064 ) ( not ( = ?auto_148059 ?auto_148063 ) ) ( not ( = ?auto_148059 ?auto_148064 ) ) ( not ( = ?auto_148060 ?auto_148063 ) ) ( not ( = ?auto_148060 ?auto_148064 ) ) ( not ( = ?auto_148061 ?auto_148063 ) ) ( not ( = ?auto_148061 ?auto_148064 ) ) ( not ( = ?auto_148062 ?auto_148063 ) ) ( not ( = ?auto_148062 ?auto_148064 ) ) ( not ( = ?auto_148063 ?auto_148064 ) ) )
    :subtasks
    ( ( !STACK ?auto_148063 ?auto_148064 )
      ( MAKE-3PILE ?auto_148059 ?auto_148060 ?auto_148061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148065 - BLOCK
      ?auto_148066 - BLOCK
      ?auto_148067 - BLOCK
    )
    :vars
    (
      ?auto_148068 - BLOCK
      ?auto_148070 - BLOCK
      ?auto_148069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148068 ?auto_148067 ) ( ON-TABLE ?auto_148065 ) ( ON ?auto_148066 ?auto_148065 ) ( ON ?auto_148067 ?auto_148066 ) ( not ( = ?auto_148065 ?auto_148066 ) ) ( not ( = ?auto_148065 ?auto_148067 ) ) ( not ( = ?auto_148065 ?auto_148068 ) ) ( not ( = ?auto_148066 ?auto_148067 ) ) ( not ( = ?auto_148066 ?auto_148068 ) ) ( not ( = ?auto_148067 ?auto_148068 ) ) ( CLEAR ?auto_148070 ) ( not ( = ?auto_148065 ?auto_148069 ) ) ( not ( = ?auto_148065 ?auto_148070 ) ) ( not ( = ?auto_148066 ?auto_148069 ) ) ( not ( = ?auto_148066 ?auto_148070 ) ) ( not ( = ?auto_148067 ?auto_148069 ) ) ( not ( = ?auto_148067 ?auto_148070 ) ) ( not ( = ?auto_148068 ?auto_148069 ) ) ( not ( = ?auto_148068 ?auto_148070 ) ) ( not ( = ?auto_148069 ?auto_148070 ) ) ( ON ?auto_148069 ?auto_148068 ) ( CLEAR ?auto_148069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148065 ?auto_148066 ?auto_148067 ?auto_148068 )
      ( MAKE-3PILE ?auto_148065 ?auto_148066 ?auto_148067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148071 - BLOCK
      ?auto_148072 - BLOCK
      ?auto_148073 - BLOCK
    )
    :vars
    (
      ?auto_148075 - BLOCK
      ?auto_148074 - BLOCK
      ?auto_148076 - BLOCK
      ?auto_148077 - BLOCK
      ?auto_148078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148075 ?auto_148073 ) ( ON-TABLE ?auto_148071 ) ( ON ?auto_148072 ?auto_148071 ) ( ON ?auto_148073 ?auto_148072 ) ( not ( = ?auto_148071 ?auto_148072 ) ) ( not ( = ?auto_148071 ?auto_148073 ) ) ( not ( = ?auto_148071 ?auto_148075 ) ) ( not ( = ?auto_148072 ?auto_148073 ) ) ( not ( = ?auto_148072 ?auto_148075 ) ) ( not ( = ?auto_148073 ?auto_148075 ) ) ( not ( = ?auto_148071 ?auto_148074 ) ) ( not ( = ?auto_148071 ?auto_148076 ) ) ( not ( = ?auto_148072 ?auto_148074 ) ) ( not ( = ?auto_148072 ?auto_148076 ) ) ( not ( = ?auto_148073 ?auto_148074 ) ) ( not ( = ?auto_148073 ?auto_148076 ) ) ( not ( = ?auto_148075 ?auto_148074 ) ) ( not ( = ?auto_148075 ?auto_148076 ) ) ( not ( = ?auto_148074 ?auto_148076 ) ) ( ON ?auto_148074 ?auto_148075 ) ( CLEAR ?auto_148074 ) ( HOLDING ?auto_148076 ) ( CLEAR ?auto_148077 ) ( ON-TABLE ?auto_148078 ) ( ON ?auto_148077 ?auto_148078 ) ( not ( = ?auto_148078 ?auto_148077 ) ) ( not ( = ?auto_148078 ?auto_148076 ) ) ( not ( = ?auto_148077 ?auto_148076 ) ) ( not ( = ?auto_148071 ?auto_148077 ) ) ( not ( = ?auto_148071 ?auto_148078 ) ) ( not ( = ?auto_148072 ?auto_148077 ) ) ( not ( = ?auto_148072 ?auto_148078 ) ) ( not ( = ?auto_148073 ?auto_148077 ) ) ( not ( = ?auto_148073 ?auto_148078 ) ) ( not ( = ?auto_148075 ?auto_148077 ) ) ( not ( = ?auto_148075 ?auto_148078 ) ) ( not ( = ?auto_148074 ?auto_148077 ) ) ( not ( = ?auto_148074 ?auto_148078 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148078 ?auto_148077 ?auto_148076 )
      ( MAKE-3PILE ?auto_148071 ?auto_148072 ?auto_148073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148079 - BLOCK
      ?auto_148080 - BLOCK
      ?auto_148081 - BLOCK
    )
    :vars
    (
      ?auto_148083 - BLOCK
      ?auto_148084 - BLOCK
      ?auto_148082 - BLOCK
      ?auto_148086 - BLOCK
      ?auto_148085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148083 ?auto_148081 ) ( ON-TABLE ?auto_148079 ) ( ON ?auto_148080 ?auto_148079 ) ( ON ?auto_148081 ?auto_148080 ) ( not ( = ?auto_148079 ?auto_148080 ) ) ( not ( = ?auto_148079 ?auto_148081 ) ) ( not ( = ?auto_148079 ?auto_148083 ) ) ( not ( = ?auto_148080 ?auto_148081 ) ) ( not ( = ?auto_148080 ?auto_148083 ) ) ( not ( = ?auto_148081 ?auto_148083 ) ) ( not ( = ?auto_148079 ?auto_148084 ) ) ( not ( = ?auto_148079 ?auto_148082 ) ) ( not ( = ?auto_148080 ?auto_148084 ) ) ( not ( = ?auto_148080 ?auto_148082 ) ) ( not ( = ?auto_148081 ?auto_148084 ) ) ( not ( = ?auto_148081 ?auto_148082 ) ) ( not ( = ?auto_148083 ?auto_148084 ) ) ( not ( = ?auto_148083 ?auto_148082 ) ) ( not ( = ?auto_148084 ?auto_148082 ) ) ( ON ?auto_148084 ?auto_148083 ) ( CLEAR ?auto_148086 ) ( ON-TABLE ?auto_148085 ) ( ON ?auto_148086 ?auto_148085 ) ( not ( = ?auto_148085 ?auto_148086 ) ) ( not ( = ?auto_148085 ?auto_148082 ) ) ( not ( = ?auto_148086 ?auto_148082 ) ) ( not ( = ?auto_148079 ?auto_148086 ) ) ( not ( = ?auto_148079 ?auto_148085 ) ) ( not ( = ?auto_148080 ?auto_148086 ) ) ( not ( = ?auto_148080 ?auto_148085 ) ) ( not ( = ?auto_148081 ?auto_148086 ) ) ( not ( = ?auto_148081 ?auto_148085 ) ) ( not ( = ?auto_148083 ?auto_148086 ) ) ( not ( = ?auto_148083 ?auto_148085 ) ) ( not ( = ?auto_148084 ?auto_148086 ) ) ( not ( = ?auto_148084 ?auto_148085 ) ) ( ON ?auto_148082 ?auto_148084 ) ( CLEAR ?auto_148082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148079 ?auto_148080 ?auto_148081 ?auto_148083 ?auto_148084 )
      ( MAKE-3PILE ?auto_148079 ?auto_148080 ?auto_148081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148087 - BLOCK
      ?auto_148088 - BLOCK
      ?auto_148089 - BLOCK
    )
    :vars
    (
      ?auto_148093 - BLOCK
      ?auto_148092 - BLOCK
      ?auto_148091 - BLOCK
      ?auto_148090 - BLOCK
      ?auto_148094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148093 ?auto_148089 ) ( ON-TABLE ?auto_148087 ) ( ON ?auto_148088 ?auto_148087 ) ( ON ?auto_148089 ?auto_148088 ) ( not ( = ?auto_148087 ?auto_148088 ) ) ( not ( = ?auto_148087 ?auto_148089 ) ) ( not ( = ?auto_148087 ?auto_148093 ) ) ( not ( = ?auto_148088 ?auto_148089 ) ) ( not ( = ?auto_148088 ?auto_148093 ) ) ( not ( = ?auto_148089 ?auto_148093 ) ) ( not ( = ?auto_148087 ?auto_148092 ) ) ( not ( = ?auto_148087 ?auto_148091 ) ) ( not ( = ?auto_148088 ?auto_148092 ) ) ( not ( = ?auto_148088 ?auto_148091 ) ) ( not ( = ?auto_148089 ?auto_148092 ) ) ( not ( = ?auto_148089 ?auto_148091 ) ) ( not ( = ?auto_148093 ?auto_148092 ) ) ( not ( = ?auto_148093 ?auto_148091 ) ) ( not ( = ?auto_148092 ?auto_148091 ) ) ( ON ?auto_148092 ?auto_148093 ) ( ON-TABLE ?auto_148090 ) ( not ( = ?auto_148090 ?auto_148094 ) ) ( not ( = ?auto_148090 ?auto_148091 ) ) ( not ( = ?auto_148094 ?auto_148091 ) ) ( not ( = ?auto_148087 ?auto_148094 ) ) ( not ( = ?auto_148087 ?auto_148090 ) ) ( not ( = ?auto_148088 ?auto_148094 ) ) ( not ( = ?auto_148088 ?auto_148090 ) ) ( not ( = ?auto_148089 ?auto_148094 ) ) ( not ( = ?auto_148089 ?auto_148090 ) ) ( not ( = ?auto_148093 ?auto_148094 ) ) ( not ( = ?auto_148093 ?auto_148090 ) ) ( not ( = ?auto_148092 ?auto_148094 ) ) ( not ( = ?auto_148092 ?auto_148090 ) ) ( ON ?auto_148091 ?auto_148092 ) ( CLEAR ?auto_148091 ) ( HOLDING ?auto_148094 ) ( CLEAR ?auto_148090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148090 ?auto_148094 )
      ( MAKE-3PILE ?auto_148087 ?auto_148088 ?auto_148089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148095 - BLOCK
      ?auto_148096 - BLOCK
      ?auto_148097 - BLOCK
    )
    :vars
    (
      ?auto_148101 - BLOCK
      ?auto_148102 - BLOCK
      ?auto_148099 - BLOCK
      ?auto_148098 - BLOCK
      ?auto_148100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148101 ?auto_148097 ) ( ON-TABLE ?auto_148095 ) ( ON ?auto_148096 ?auto_148095 ) ( ON ?auto_148097 ?auto_148096 ) ( not ( = ?auto_148095 ?auto_148096 ) ) ( not ( = ?auto_148095 ?auto_148097 ) ) ( not ( = ?auto_148095 ?auto_148101 ) ) ( not ( = ?auto_148096 ?auto_148097 ) ) ( not ( = ?auto_148096 ?auto_148101 ) ) ( not ( = ?auto_148097 ?auto_148101 ) ) ( not ( = ?auto_148095 ?auto_148102 ) ) ( not ( = ?auto_148095 ?auto_148099 ) ) ( not ( = ?auto_148096 ?auto_148102 ) ) ( not ( = ?auto_148096 ?auto_148099 ) ) ( not ( = ?auto_148097 ?auto_148102 ) ) ( not ( = ?auto_148097 ?auto_148099 ) ) ( not ( = ?auto_148101 ?auto_148102 ) ) ( not ( = ?auto_148101 ?auto_148099 ) ) ( not ( = ?auto_148102 ?auto_148099 ) ) ( ON ?auto_148102 ?auto_148101 ) ( ON-TABLE ?auto_148098 ) ( not ( = ?auto_148098 ?auto_148100 ) ) ( not ( = ?auto_148098 ?auto_148099 ) ) ( not ( = ?auto_148100 ?auto_148099 ) ) ( not ( = ?auto_148095 ?auto_148100 ) ) ( not ( = ?auto_148095 ?auto_148098 ) ) ( not ( = ?auto_148096 ?auto_148100 ) ) ( not ( = ?auto_148096 ?auto_148098 ) ) ( not ( = ?auto_148097 ?auto_148100 ) ) ( not ( = ?auto_148097 ?auto_148098 ) ) ( not ( = ?auto_148101 ?auto_148100 ) ) ( not ( = ?auto_148101 ?auto_148098 ) ) ( not ( = ?auto_148102 ?auto_148100 ) ) ( not ( = ?auto_148102 ?auto_148098 ) ) ( ON ?auto_148099 ?auto_148102 ) ( CLEAR ?auto_148098 ) ( ON ?auto_148100 ?auto_148099 ) ( CLEAR ?auto_148100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148095 ?auto_148096 ?auto_148097 ?auto_148101 ?auto_148102 ?auto_148099 )
      ( MAKE-3PILE ?auto_148095 ?auto_148096 ?auto_148097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148103 - BLOCK
      ?auto_148104 - BLOCK
      ?auto_148105 - BLOCK
    )
    :vars
    (
      ?auto_148106 - BLOCK
      ?auto_148108 - BLOCK
      ?auto_148110 - BLOCK
      ?auto_148109 - BLOCK
      ?auto_148107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148106 ?auto_148105 ) ( ON-TABLE ?auto_148103 ) ( ON ?auto_148104 ?auto_148103 ) ( ON ?auto_148105 ?auto_148104 ) ( not ( = ?auto_148103 ?auto_148104 ) ) ( not ( = ?auto_148103 ?auto_148105 ) ) ( not ( = ?auto_148103 ?auto_148106 ) ) ( not ( = ?auto_148104 ?auto_148105 ) ) ( not ( = ?auto_148104 ?auto_148106 ) ) ( not ( = ?auto_148105 ?auto_148106 ) ) ( not ( = ?auto_148103 ?auto_148108 ) ) ( not ( = ?auto_148103 ?auto_148110 ) ) ( not ( = ?auto_148104 ?auto_148108 ) ) ( not ( = ?auto_148104 ?auto_148110 ) ) ( not ( = ?auto_148105 ?auto_148108 ) ) ( not ( = ?auto_148105 ?auto_148110 ) ) ( not ( = ?auto_148106 ?auto_148108 ) ) ( not ( = ?auto_148106 ?auto_148110 ) ) ( not ( = ?auto_148108 ?auto_148110 ) ) ( ON ?auto_148108 ?auto_148106 ) ( not ( = ?auto_148109 ?auto_148107 ) ) ( not ( = ?auto_148109 ?auto_148110 ) ) ( not ( = ?auto_148107 ?auto_148110 ) ) ( not ( = ?auto_148103 ?auto_148107 ) ) ( not ( = ?auto_148103 ?auto_148109 ) ) ( not ( = ?auto_148104 ?auto_148107 ) ) ( not ( = ?auto_148104 ?auto_148109 ) ) ( not ( = ?auto_148105 ?auto_148107 ) ) ( not ( = ?auto_148105 ?auto_148109 ) ) ( not ( = ?auto_148106 ?auto_148107 ) ) ( not ( = ?auto_148106 ?auto_148109 ) ) ( not ( = ?auto_148108 ?auto_148107 ) ) ( not ( = ?auto_148108 ?auto_148109 ) ) ( ON ?auto_148110 ?auto_148108 ) ( ON ?auto_148107 ?auto_148110 ) ( CLEAR ?auto_148107 ) ( HOLDING ?auto_148109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148109 )
      ( MAKE-3PILE ?auto_148103 ?auto_148104 ?auto_148105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148111 - BLOCK
      ?auto_148112 - BLOCK
      ?auto_148113 - BLOCK
    )
    :vars
    (
      ?auto_148117 - BLOCK
      ?auto_148114 - BLOCK
      ?auto_148118 - BLOCK
      ?auto_148116 - BLOCK
      ?auto_148115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148117 ?auto_148113 ) ( ON-TABLE ?auto_148111 ) ( ON ?auto_148112 ?auto_148111 ) ( ON ?auto_148113 ?auto_148112 ) ( not ( = ?auto_148111 ?auto_148112 ) ) ( not ( = ?auto_148111 ?auto_148113 ) ) ( not ( = ?auto_148111 ?auto_148117 ) ) ( not ( = ?auto_148112 ?auto_148113 ) ) ( not ( = ?auto_148112 ?auto_148117 ) ) ( not ( = ?auto_148113 ?auto_148117 ) ) ( not ( = ?auto_148111 ?auto_148114 ) ) ( not ( = ?auto_148111 ?auto_148118 ) ) ( not ( = ?auto_148112 ?auto_148114 ) ) ( not ( = ?auto_148112 ?auto_148118 ) ) ( not ( = ?auto_148113 ?auto_148114 ) ) ( not ( = ?auto_148113 ?auto_148118 ) ) ( not ( = ?auto_148117 ?auto_148114 ) ) ( not ( = ?auto_148117 ?auto_148118 ) ) ( not ( = ?auto_148114 ?auto_148118 ) ) ( ON ?auto_148114 ?auto_148117 ) ( not ( = ?auto_148116 ?auto_148115 ) ) ( not ( = ?auto_148116 ?auto_148118 ) ) ( not ( = ?auto_148115 ?auto_148118 ) ) ( not ( = ?auto_148111 ?auto_148115 ) ) ( not ( = ?auto_148111 ?auto_148116 ) ) ( not ( = ?auto_148112 ?auto_148115 ) ) ( not ( = ?auto_148112 ?auto_148116 ) ) ( not ( = ?auto_148113 ?auto_148115 ) ) ( not ( = ?auto_148113 ?auto_148116 ) ) ( not ( = ?auto_148117 ?auto_148115 ) ) ( not ( = ?auto_148117 ?auto_148116 ) ) ( not ( = ?auto_148114 ?auto_148115 ) ) ( not ( = ?auto_148114 ?auto_148116 ) ) ( ON ?auto_148118 ?auto_148114 ) ( ON ?auto_148115 ?auto_148118 ) ( ON ?auto_148116 ?auto_148115 ) ( CLEAR ?auto_148116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148111 ?auto_148112 ?auto_148113 ?auto_148117 ?auto_148114 ?auto_148118 ?auto_148115 )
      ( MAKE-3PILE ?auto_148111 ?auto_148112 ?auto_148113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148119 - BLOCK
      ?auto_148120 - BLOCK
      ?auto_148121 - BLOCK
    )
    :vars
    (
      ?auto_148125 - BLOCK
      ?auto_148123 - BLOCK
      ?auto_148122 - BLOCK
      ?auto_148126 - BLOCK
      ?auto_148124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148125 ?auto_148121 ) ( ON-TABLE ?auto_148119 ) ( ON ?auto_148120 ?auto_148119 ) ( ON ?auto_148121 ?auto_148120 ) ( not ( = ?auto_148119 ?auto_148120 ) ) ( not ( = ?auto_148119 ?auto_148121 ) ) ( not ( = ?auto_148119 ?auto_148125 ) ) ( not ( = ?auto_148120 ?auto_148121 ) ) ( not ( = ?auto_148120 ?auto_148125 ) ) ( not ( = ?auto_148121 ?auto_148125 ) ) ( not ( = ?auto_148119 ?auto_148123 ) ) ( not ( = ?auto_148119 ?auto_148122 ) ) ( not ( = ?auto_148120 ?auto_148123 ) ) ( not ( = ?auto_148120 ?auto_148122 ) ) ( not ( = ?auto_148121 ?auto_148123 ) ) ( not ( = ?auto_148121 ?auto_148122 ) ) ( not ( = ?auto_148125 ?auto_148123 ) ) ( not ( = ?auto_148125 ?auto_148122 ) ) ( not ( = ?auto_148123 ?auto_148122 ) ) ( ON ?auto_148123 ?auto_148125 ) ( not ( = ?auto_148126 ?auto_148124 ) ) ( not ( = ?auto_148126 ?auto_148122 ) ) ( not ( = ?auto_148124 ?auto_148122 ) ) ( not ( = ?auto_148119 ?auto_148124 ) ) ( not ( = ?auto_148119 ?auto_148126 ) ) ( not ( = ?auto_148120 ?auto_148124 ) ) ( not ( = ?auto_148120 ?auto_148126 ) ) ( not ( = ?auto_148121 ?auto_148124 ) ) ( not ( = ?auto_148121 ?auto_148126 ) ) ( not ( = ?auto_148125 ?auto_148124 ) ) ( not ( = ?auto_148125 ?auto_148126 ) ) ( not ( = ?auto_148123 ?auto_148124 ) ) ( not ( = ?auto_148123 ?auto_148126 ) ) ( ON ?auto_148122 ?auto_148123 ) ( ON ?auto_148124 ?auto_148122 ) ( HOLDING ?auto_148126 ) ( CLEAR ?auto_148124 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148119 ?auto_148120 ?auto_148121 ?auto_148125 ?auto_148123 ?auto_148122 ?auto_148124 ?auto_148126 )
      ( MAKE-3PILE ?auto_148119 ?auto_148120 ?auto_148121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148127 - BLOCK
      ?auto_148128 - BLOCK
      ?auto_148129 - BLOCK
    )
    :vars
    (
      ?auto_148131 - BLOCK
      ?auto_148132 - BLOCK
      ?auto_148134 - BLOCK
      ?auto_148130 - BLOCK
      ?auto_148133 - BLOCK
      ?auto_148135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148131 ?auto_148129 ) ( ON-TABLE ?auto_148127 ) ( ON ?auto_148128 ?auto_148127 ) ( ON ?auto_148129 ?auto_148128 ) ( not ( = ?auto_148127 ?auto_148128 ) ) ( not ( = ?auto_148127 ?auto_148129 ) ) ( not ( = ?auto_148127 ?auto_148131 ) ) ( not ( = ?auto_148128 ?auto_148129 ) ) ( not ( = ?auto_148128 ?auto_148131 ) ) ( not ( = ?auto_148129 ?auto_148131 ) ) ( not ( = ?auto_148127 ?auto_148132 ) ) ( not ( = ?auto_148127 ?auto_148134 ) ) ( not ( = ?auto_148128 ?auto_148132 ) ) ( not ( = ?auto_148128 ?auto_148134 ) ) ( not ( = ?auto_148129 ?auto_148132 ) ) ( not ( = ?auto_148129 ?auto_148134 ) ) ( not ( = ?auto_148131 ?auto_148132 ) ) ( not ( = ?auto_148131 ?auto_148134 ) ) ( not ( = ?auto_148132 ?auto_148134 ) ) ( ON ?auto_148132 ?auto_148131 ) ( not ( = ?auto_148130 ?auto_148133 ) ) ( not ( = ?auto_148130 ?auto_148134 ) ) ( not ( = ?auto_148133 ?auto_148134 ) ) ( not ( = ?auto_148127 ?auto_148133 ) ) ( not ( = ?auto_148127 ?auto_148130 ) ) ( not ( = ?auto_148128 ?auto_148133 ) ) ( not ( = ?auto_148128 ?auto_148130 ) ) ( not ( = ?auto_148129 ?auto_148133 ) ) ( not ( = ?auto_148129 ?auto_148130 ) ) ( not ( = ?auto_148131 ?auto_148133 ) ) ( not ( = ?auto_148131 ?auto_148130 ) ) ( not ( = ?auto_148132 ?auto_148133 ) ) ( not ( = ?auto_148132 ?auto_148130 ) ) ( ON ?auto_148134 ?auto_148132 ) ( ON ?auto_148133 ?auto_148134 ) ( CLEAR ?auto_148133 ) ( ON ?auto_148130 ?auto_148135 ) ( CLEAR ?auto_148130 ) ( HAND-EMPTY ) ( not ( = ?auto_148127 ?auto_148135 ) ) ( not ( = ?auto_148128 ?auto_148135 ) ) ( not ( = ?auto_148129 ?auto_148135 ) ) ( not ( = ?auto_148131 ?auto_148135 ) ) ( not ( = ?auto_148132 ?auto_148135 ) ) ( not ( = ?auto_148134 ?auto_148135 ) ) ( not ( = ?auto_148130 ?auto_148135 ) ) ( not ( = ?auto_148133 ?auto_148135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148130 ?auto_148135 )
      ( MAKE-3PILE ?auto_148127 ?auto_148128 ?auto_148129 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148136 - BLOCK
      ?auto_148137 - BLOCK
      ?auto_148138 - BLOCK
    )
    :vars
    (
      ?auto_148140 - BLOCK
      ?auto_148141 - BLOCK
      ?auto_148142 - BLOCK
      ?auto_148139 - BLOCK
      ?auto_148143 - BLOCK
      ?auto_148144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148140 ?auto_148138 ) ( ON-TABLE ?auto_148136 ) ( ON ?auto_148137 ?auto_148136 ) ( ON ?auto_148138 ?auto_148137 ) ( not ( = ?auto_148136 ?auto_148137 ) ) ( not ( = ?auto_148136 ?auto_148138 ) ) ( not ( = ?auto_148136 ?auto_148140 ) ) ( not ( = ?auto_148137 ?auto_148138 ) ) ( not ( = ?auto_148137 ?auto_148140 ) ) ( not ( = ?auto_148138 ?auto_148140 ) ) ( not ( = ?auto_148136 ?auto_148141 ) ) ( not ( = ?auto_148136 ?auto_148142 ) ) ( not ( = ?auto_148137 ?auto_148141 ) ) ( not ( = ?auto_148137 ?auto_148142 ) ) ( not ( = ?auto_148138 ?auto_148141 ) ) ( not ( = ?auto_148138 ?auto_148142 ) ) ( not ( = ?auto_148140 ?auto_148141 ) ) ( not ( = ?auto_148140 ?auto_148142 ) ) ( not ( = ?auto_148141 ?auto_148142 ) ) ( ON ?auto_148141 ?auto_148140 ) ( not ( = ?auto_148139 ?auto_148143 ) ) ( not ( = ?auto_148139 ?auto_148142 ) ) ( not ( = ?auto_148143 ?auto_148142 ) ) ( not ( = ?auto_148136 ?auto_148143 ) ) ( not ( = ?auto_148136 ?auto_148139 ) ) ( not ( = ?auto_148137 ?auto_148143 ) ) ( not ( = ?auto_148137 ?auto_148139 ) ) ( not ( = ?auto_148138 ?auto_148143 ) ) ( not ( = ?auto_148138 ?auto_148139 ) ) ( not ( = ?auto_148140 ?auto_148143 ) ) ( not ( = ?auto_148140 ?auto_148139 ) ) ( not ( = ?auto_148141 ?auto_148143 ) ) ( not ( = ?auto_148141 ?auto_148139 ) ) ( ON ?auto_148142 ?auto_148141 ) ( ON ?auto_148139 ?auto_148144 ) ( CLEAR ?auto_148139 ) ( not ( = ?auto_148136 ?auto_148144 ) ) ( not ( = ?auto_148137 ?auto_148144 ) ) ( not ( = ?auto_148138 ?auto_148144 ) ) ( not ( = ?auto_148140 ?auto_148144 ) ) ( not ( = ?auto_148141 ?auto_148144 ) ) ( not ( = ?auto_148142 ?auto_148144 ) ) ( not ( = ?auto_148139 ?auto_148144 ) ) ( not ( = ?auto_148143 ?auto_148144 ) ) ( HOLDING ?auto_148143 ) ( CLEAR ?auto_148142 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148136 ?auto_148137 ?auto_148138 ?auto_148140 ?auto_148141 ?auto_148142 ?auto_148143 )
      ( MAKE-3PILE ?auto_148136 ?auto_148137 ?auto_148138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148145 - BLOCK
      ?auto_148146 - BLOCK
      ?auto_148147 - BLOCK
    )
    :vars
    (
      ?auto_148153 - BLOCK
      ?auto_148152 - BLOCK
      ?auto_148150 - BLOCK
      ?auto_148148 - BLOCK
      ?auto_148149 - BLOCK
      ?auto_148151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148153 ?auto_148147 ) ( ON-TABLE ?auto_148145 ) ( ON ?auto_148146 ?auto_148145 ) ( ON ?auto_148147 ?auto_148146 ) ( not ( = ?auto_148145 ?auto_148146 ) ) ( not ( = ?auto_148145 ?auto_148147 ) ) ( not ( = ?auto_148145 ?auto_148153 ) ) ( not ( = ?auto_148146 ?auto_148147 ) ) ( not ( = ?auto_148146 ?auto_148153 ) ) ( not ( = ?auto_148147 ?auto_148153 ) ) ( not ( = ?auto_148145 ?auto_148152 ) ) ( not ( = ?auto_148145 ?auto_148150 ) ) ( not ( = ?auto_148146 ?auto_148152 ) ) ( not ( = ?auto_148146 ?auto_148150 ) ) ( not ( = ?auto_148147 ?auto_148152 ) ) ( not ( = ?auto_148147 ?auto_148150 ) ) ( not ( = ?auto_148153 ?auto_148152 ) ) ( not ( = ?auto_148153 ?auto_148150 ) ) ( not ( = ?auto_148152 ?auto_148150 ) ) ( ON ?auto_148152 ?auto_148153 ) ( not ( = ?auto_148148 ?auto_148149 ) ) ( not ( = ?auto_148148 ?auto_148150 ) ) ( not ( = ?auto_148149 ?auto_148150 ) ) ( not ( = ?auto_148145 ?auto_148149 ) ) ( not ( = ?auto_148145 ?auto_148148 ) ) ( not ( = ?auto_148146 ?auto_148149 ) ) ( not ( = ?auto_148146 ?auto_148148 ) ) ( not ( = ?auto_148147 ?auto_148149 ) ) ( not ( = ?auto_148147 ?auto_148148 ) ) ( not ( = ?auto_148153 ?auto_148149 ) ) ( not ( = ?auto_148153 ?auto_148148 ) ) ( not ( = ?auto_148152 ?auto_148149 ) ) ( not ( = ?auto_148152 ?auto_148148 ) ) ( ON ?auto_148150 ?auto_148152 ) ( ON ?auto_148148 ?auto_148151 ) ( not ( = ?auto_148145 ?auto_148151 ) ) ( not ( = ?auto_148146 ?auto_148151 ) ) ( not ( = ?auto_148147 ?auto_148151 ) ) ( not ( = ?auto_148153 ?auto_148151 ) ) ( not ( = ?auto_148152 ?auto_148151 ) ) ( not ( = ?auto_148150 ?auto_148151 ) ) ( not ( = ?auto_148148 ?auto_148151 ) ) ( not ( = ?auto_148149 ?auto_148151 ) ) ( CLEAR ?auto_148150 ) ( ON ?auto_148149 ?auto_148148 ) ( CLEAR ?auto_148149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148151 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148151 ?auto_148148 )
      ( MAKE-3PILE ?auto_148145 ?auto_148146 ?auto_148147 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148154 - BLOCK
      ?auto_148155 - BLOCK
      ?auto_148156 - BLOCK
    )
    :vars
    (
      ?auto_148162 - BLOCK
      ?auto_148157 - BLOCK
      ?auto_148161 - BLOCK
      ?auto_148160 - BLOCK
      ?auto_148159 - BLOCK
      ?auto_148158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148162 ?auto_148156 ) ( ON-TABLE ?auto_148154 ) ( ON ?auto_148155 ?auto_148154 ) ( ON ?auto_148156 ?auto_148155 ) ( not ( = ?auto_148154 ?auto_148155 ) ) ( not ( = ?auto_148154 ?auto_148156 ) ) ( not ( = ?auto_148154 ?auto_148162 ) ) ( not ( = ?auto_148155 ?auto_148156 ) ) ( not ( = ?auto_148155 ?auto_148162 ) ) ( not ( = ?auto_148156 ?auto_148162 ) ) ( not ( = ?auto_148154 ?auto_148157 ) ) ( not ( = ?auto_148154 ?auto_148161 ) ) ( not ( = ?auto_148155 ?auto_148157 ) ) ( not ( = ?auto_148155 ?auto_148161 ) ) ( not ( = ?auto_148156 ?auto_148157 ) ) ( not ( = ?auto_148156 ?auto_148161 ) ) ( not ( = ?auto_148162 ?auto_148157 ) ) ( not ( = ?auto_148162 ?auto_148161 ) ) ( not ( = ?auto_148157 ?auto_148161 ) ) ( ON ?auto_148157 ?auto_148162 ) ( not ( = ?auto_148160 ?auto_148159 ) ) ( not ( = ?auto_148160 ?auto_148161 ) ) ( not ( = ?auto_148159 ?auto_148161 ) ) ( not ( = ?auto_148154 ?auto_148159 ) ) ( not ( = ?auto_148154 ?auto_148160 ) ) ( not ( = ?auto_148155 ?auto_148159 ) ) ( not ( = ?auto_148155 ?auto_148160 ) ) ( not ( = ?auto_148156 ?auto_148159 ) ) ( not ( = ?auto_148156 ?auto_148160 ) ) ( not ( = ?auto_148162 ?auto_148159 ) ) ( not ( = ?auto_148162 ?auto_148160 ) ) ( not ( = ?auto_148157 ?auto_148159 ) ) ( not ( = ?auto_148157 ?auto_148160 ) ) ( ON ?auto_148160 ?auto_148158 ) ( not ( = ?auto_148154 ?auto_148158 ) ) ( not ( = ?auto_148155 ?auto_148158 ) ) ( not ( = ?auto_148156 ?auto_148158 ) ) ( not ( = ?auto_148162 ?auto_148158 ) ) ( not ( = ?auto_148157 ?auto_148158 ) ) ( not ( = ?auto_148161 ?auto_148158 ) ) ( not ( = ?auto_148160 ?auto_148158 ) ) ( not ( = ?auto_148159 ?auto_148158 ) ) ( ON ?auto_148159 ?auto_148160 ) ( CLEAR ?auto_148159 ) ( ON-TABLE ?auto_148158 ) ( HOLDING ?auto_148161 ) ( CLEAR ?auto_148157 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148154 ?auto_148155 ?auto_148156 ?auto_148162 ?auto_148157 ?auto_148161 )
      ( MAKE-3PILE ?auto_148154 ?auto_148155 ?auto_148156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148163 - BLOCK
      ?auto_148164 - BLOCK
      ?auto_148165 - BLOCK
    )
    :vars
    (
      ?auto_148167 - BLOCK
      ?auto_148169 - BLOCK
      ?auto_148170 - BLOCK
      ?auto_148166 - BLOCK
      ?auto_148168 - BLOCK
      ?auto_148171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148167 ?auto_148165 ) ( ON-TABLE ?auto_148163 ) ( ON ?auto_148164 ?auto_148163 ) ( ON ?auto_148165 ?auto_148164 ) ( not ( = ?auto_148163 ?auto_148164 ) ) ( not ( = ?auto_148163 ?auto_148165 ) ) ( not ( = ?auto_148163 ?auto_148167 ) ) ( not ( = ?auto_148164 ?auto_148165 ) ) ( not ( = ?auto_148164 ?auto_148167 ) ) ( not ( = ?auto_148165 ?auto_148167 ) ) ( not ( = ?auto_148163 ?auto_148169 ) ) ( not ( = ?auto_148163 ?auto_148170 ) ) ( not ( = ?auto_148164 ?auto_148169 ) ) ( not ( = ?auto_148164 ?auto_148170 ) ) ( not ( = ?auto_148165 ?auto_148169 ) ) ( not ( = ?auto_148165 ?auto_148170 ) ) ( not ( = ?auto_148167 ?auto_148169 ) ) ( not ( = ?auto_148167 ?auto_148170 ) ) ( not ( = ?auto_148169 ?auto_148170 ) ) ( ON ?auto_148169 ?auto_148167 ) ( not ( = ?auto_148166 ?auto_148168 ) ) ( not ( = ?auto_148166 ?auto_148170 ) ) ( not ( = ?auto_148168 ?auto_148170 ) ) ( not ( = ?auto_148163 ?auto_148168 ) ) ( not ( = ?auto_148163 ?auto_148166 ) ) ( not ( = ?auto_148164 ?auto_148168 ) ) ( not ( = ?auto_148164 ?auto_148166 ) ) ( not ( = ?auto_148165 ?auto_148168 ) ) ( not ( = ?auto_148165 ?auto_148166 ) ) ( not ( = ?auto_148167 ?auto_148168 ) ) ( not ( = ?auto_148167 ?auto_148166 ) ) ( not ( = ?auto_148169 ?auto_148168 ) ) ( not ( = ?auto_148169 ?auto_148166 ) ) ( ON ?auto_148166 ?auto_148171 ) ( not ( = ?auto_148163 ?auto_148171 ) ) ( not ( = ?auto_148164 ?auto_148171 ) ) ( not ( = ?auto_148165 ?auto_148171 ) ) ( not ( = ?auto_148167 ?auto_148171 ) ) ( not ( = ?auto_148169 ?auto_148171 ) ) ( not ( = ?auto_148170 ?auto_148171 ) ) ( not ( = ?auto_148166 ?auto_148171 ) ) ( not ( = ?auto_148168 ?auto_148171 ) ) ( ON ?auto_148168 ?auto_148166 ) ( ON-TABLE ?auto_148171 ) ( CLEAR ?auto_148169 ) ( ON ?auto_148170 ?auto_148168 ) ( CLEAR ?auto_148170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148171 ?auto_148166 ?auto_148168 )
      ( MAKE-3PILE ?auto_148163 ?auto_148164 ?auto_148165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148172 - BLOCK
      ?auto_148173 - BLOCK
      ?auto_148174 - BLOCK
    )
    :vars
    (
      ?auto_148180 - BLOCK
      ?auto_148177 - BLOCK
      ?auto_148175 - BLOCK
      ?auto_148178 - BLOCK
      ?auto_148176 - BLOCK
      ?auto_148179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148180 ?auto_148174 ) ( ON-TABLE ?auto_148172 ) ( ON ?auto_148173 ?auto_148172 ) ( ON ?auto_148174 ?auto_148173 ) ( not ( = ?auto_148172 ?auto_148173 ) ) ( not ( = ?auto_148172 ?auto_148174 ) ) ( not ( = ?auto_148172 ?auto_148180 ) ) ( not ( = ?auto_148173 ?auto_148174 ) ) ( not ( = ?auto_148173 ?auto_148180 ) ) ( not ( = ?auto_148174 ?auto_148180 ) ) ( not ( = ?auto_148172 ?auto_148177 ) ) ( not ( = ?auto_148172 ?auto_148175 ) ) ( not ( = ?auto_148173 ?auto_148177 ) ) ( not ( = ?auto_148173 ?auto_148175 ) ) ( not ( = ?auto_148174 ?auto_148177 ) ) ( not ( = ?auto_148174 ?auto_148175 ) ) ( not ( = ?auto_148180 ?auto_148177 ) ) ( not ( = ?auto_148180 ?auto_148175 ) ) ( not ( = ?auto_148177 ?auto_148175 ) ) ( not ( = ?auto_148178 ?auto_148176 ) ) ( not ( = ?auto_148178 ?auto_148175 ) ) ( not ( = ?auto_148176 ?auto_148175 ) ) ( not ( = ?auto_148172 ?auto_148176 ) ) ( not ( = ?auto_148172 ?auto_148178 ) ) ( not ( = ?auto_148173 ?auto_148176 ) ) ( not ( = ?auto_148173 ?auto_148178 ) ) ( not ( = ?auto_148174 ?auto_148176 ) ) ( not ( = ?auto_148174 ?auto_148178 ) ) ( not ( = ?auto_148180 ?auto_148176 ) ) ( not ( = ?auto_148180 ?auto_148178 ) ) ( not ( = ?auto_148177 ?auto_148176 ) ) ( not ( = ?auto_148177 ?auto_148178 ) ) ( ON ?auto_148178 ?auto_148179 ) ( not ( = ?auto_148172 ?auto_148179 ) ) ( not ( = ?auto_148173 ?auto_148179 ) ) ( not ( = ?auto_148174 ?auto_148179 ) ) ( not ( = ?auto_148180 ?auto_148179 ) ) ( not ( = ?auto_148177 ?auto_148179 ) ) ( not ( = ?auto_148175 ?auto_148179 ) ) ( not ( = ?auto_148178 ?auto_148179 ) ) ( not ( = ?auto_148176 ?auto_148179 ) ) ( ON ?auto_148176 ?auto_148178 ) ( ON-TABLE ?auto_148179 ) ( ON ?auto_148175 ?auto_148176 ) ( CLEAR ?auto_148175 ) ( HOLDING ?auto_148177 ) ( CLEAR ?auto_148180 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148172 ?auto_148173 ?auto_148174 ?auto_148180 ?auto_148177 )
      ( MAKE-3PILE ?auto_148172 ?auto_148173 ?auto_148174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148181 - BLOCK
      ?auto_148182 - BLOCK
      ?auto_148183 - BLOCK
    )
    :vars
    (
      ?auto_148189 - BLOCK
      ?auto_148187 - BLOCK
      ?auto_148186 - BLOCK
      ?auto_148184 - BLOCK
      ?auto_148185 - BLOCK
      ?auto_148188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148189 ?auto_148183 ) ( ON-TABLE ?auto_148181 ) ( ON ?auto_148182 ?auto_148181 ) ( ON ?auto_148183 ?auto_148182 ) ( not ( = ?auto_148181 ?auto_148182 ) ) ( not ( = ?auto_148181 ?auto_148183 ) ) ( not ( = ?auto_148181 ?auto_148189 ) ) ( not ( = ?auto_148182 ?auto_148183 ) ) ( not ( = ?auto_148182 ?auto_148189 ) ) ( not ( = ?auto_148183 ?auto_148189 ) ) ( not ( = ?auto_148181 ?auto_148187 ) ) ( not ( = ?auto_148181 ?auto_148186 ) ) ( not ( = ?auto_148182 ?auto_148187 ) ) ( not ( = ?auto_148182 ?auto_148186 ) ) ( not ( = ?auto_148183 ?auto_148187 ) ) ( not ( = ?auto_148183 ?auto_148186 ) ) ( not ( = ?auto_148189 ?auto_148187 ) ) ( not ( = ?auto_148189 ?auto_148186 ) ) ( not ( = ?auto_148187 ?auto_148186 ) ) ( not ( = ?auto_148184 ?auto_148185 ) ) ( not ( = ?auto_148184 ?auto_148186 ) ) ( not ( = ?auto_148185 ?auto_148186 ) ) ( not ( = ?auto_148181 ?auto_148185 ) ) ( not ( = ?auto_148181 ?auto_148184 ) ) ( not ( = ?auto_148182 ?auto_148185 ) ) ( not ( = ?auto_148182 ?auto_148184 ) ) ( not ( = ?auto_148183 ?auto_148185 ) ) ( not ( = ?auto_148183 ?auto_148184 ) ) ( not ( = ?auto_148189 ?auto_148185 ) ) ( not ( = ?auto_148189 ?auto_148184 ) ) ( not ( = ?auto_148187 ?auto_148185 ) ) ( not ( = ?auto_148187 ?auto_148184 ) ) ( ON ?auto_148184 ?auto_148188 ) ( not ( = ?auto_148181 ?auto_148188 ) ) ( not ( = ?auto_148182 ?auto_148188 ) ) ( not ( = ?auto_148183 ?auto_148188 ) ) ( not ( = ?auto_148189 ?auto_148188 ) ) ( not ( = ?auto_148187 ?auto_148188 ) ) ( not ( = ?auto_148186 ?auto_148188 ) ) ( not ( = ?auto_148184 ?auto_148188 ) ) ( not ( = ?auto_148185 ?auto_148188 ) ) ( ON ?auto_148185 ?auto_148184 ) ( ON-TABLE ?auto_148188 ) ( ON ?auto_148186 ?auto_148185 ) ( CLEAR ?auto_148189 ) ( ON ?auto_148187 ?auto_148186 ) ( CLEAR ?auto_148187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148188 ?auto_148184 ?auto_148185 ?auto_148186 )
      ( MAKE-3PILE ?auto_148181 ?auto_148182 ?auto_148183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148208 - BLOCK
      ?auto_148209 - BLOCK
      ?auto_148210 - BLOCK
    )
    :vars
    (
      ?auto_148214 - BLOCK
      ?auto_148211 - BLOCK
      ?auto_148215 - BLOCK
      ?auto_148213 - BLOCK
      ?auto_148212 - BLOCK
      ?auto_148216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148208 ) ( ON ?auto_148209 ?auto_148208 ) ( not ( = ?auto_148208 ?auto_148209 ) ) ( not ( = ?auto_148208 ?auto_148210 ) ) ( not ( = ?auto_148208 ?auto_148214 ) ) ( not ( = ?auto_148209 ?auto_148210 ) ) ( not ( = ?auto_148209 ?auto_148214 ) ) ( not ( = ?auto_148210 ?auto_148214 ) ) ( not ( = ?auto_148208 ?auto_148211 ) ) ( not ( = ?auto_148208 ?auto_148215 ) ) ( not ( = ?auto_148209 ?auto_148211 ) ) ( not ( = ?auto_148209 ?auto_148215 ) ) ( not ( = ?auto_148210 ?auto_148211 ) ) ( not ( = ?auto_148210 ?auto_148215 ) ) ( not ( = ?auto_148214 ?auto_148211 ) ) ( not ( = ?auto_148214 ?auto_148215 ) ) ( not ( = ?auto_148211 ?auto_148215 ) ) ( not ( = ?auto_148213 ?auto_148212 ) ) ( not ( = ?auto_148213 ?auto_148215 ) ) ( not ( = ?auto_148212 ?auto_148215 ) ) ( not ( = ?auto_148208 ?auto_148212 ) ) ( not ( = ?auto_148208 ?auto_148213 ) ) ( not ( = ?auto_148209 ?auto_148212 ) ) ( not ( = ?auto_148209 ?auto_148213 ) ) ( not ( = ?auto_148210 ?auto_148212 ) ) ( not ( = ?auto_148210 ?auto_148213 ) ) ( not ( = ?auto_148214 ?auto_148212 ) ) ( not ( = ?auto_148214 ?auto_148213 ) ) ( not ( = ?auto_148211 ?auto_148212 ) ) ( not ( = ?auto_148211 ?auto_148213 ) ) ( ON ?auto_148213 ?auto_148216 ) ( not ( = ?auto_148208 ?auto_148216 ) ) ( not ( = ?auto_148209 ?auto_148216 ) ) ( not ( = ?auto_148210 ?auto_148216 ) ) ( not ( = ?auto_148214 ?auto_148216 ) ) ( not ( = ?auto_148211 ?auto_148216 ) ) ( not ( = ?auto_148215 ?auto_148216 ) ) ( not ( = ?auto_148213 ?auto_148216 ) ) ( not ( = ?auto_148212 ?auto_148216 ) ) ( ON ?auto_148212 ?auto_148213 ) ( ON-TABLE ?auto_148216 ) ( ON ?auto_148215 ?auto_148212 ) ( ON ?auto_148211 ?auto_148215 ) ( ON ?auto_148214 ?auto_148211 ) ( CLEAR ?auto_148214 ) ( HOLDING ?auto_148210 ) ( CLEAR ?auto_148209 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148208 ?auto_148209 ?auto_148210 ?auto_148214 )
      ( MAKE-3PILE ?auto_148208 ?auto_148209 ?auto_148210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148217 - BLOCK
      ?auto_148218 - BLOCK
      ?auto_148219 - BLOCK
    )
    :vars
    (
      ?auto_148221 - BLOCK
      ?auto_148223 - BLOCK
      ?auto_148225 - BLOCK
      ?auto_148220 - BLOCK
      ?auto_148222 - BLOCK
      ?auto_148224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148217 ) ( ON ?auto_148218 ?auto_148217 ) ( not ( = ?auto_148217 ?auto_148218 ) ) ( not ( = ?auto_148217 ?auto_148219 ) ) ( not ( = ?auto_148217 ?auto_148221 ) ) ( not ( = ?auto_148218 ?auto_148219 ) ) ( not ( = ?auto_148218 ?auto_148221 ) ) ( not ( = ?auto_148219 ?auto_148221 ) ) ( not ( = ?auto_148217 ?auto_148223 ) ) ( not ( = ?auto_148217 ?auto_148225 ) ) ( not ( = ?auto_148218 ?auto_148223 ) ) ( not ( = ?auto_148218 ?auto_148225 ) ) ( not ( = ?auto_148219 ?auto_148223 ) ) ( not ( = ?auto_148219 ?auto_148225 ) ) ( not ( = ?auto_148221 ?auto_148223 ) ) ( not ( = ?auto_148221 ?auto_148225 ) ) ( not ( = ?auto_148223 ?auto_148225 ) ) ( not ( = ?auto_148220 ?auto_148222 ) ) ( not ( = ?auto_148220 ?auto_148225 ) ) ( not ( = ?auto_148222 ?auto_148225 ) ) ( not ( = ?auto_148217 ?auto_148222 ) ) ( not ( = ?auto_148217 ?auto_148220 ) ) ( not ( = ?auto_148218 ?auto_148222 ) ) ( not ( = ?auto_148218 ?auto_148220 ) ) ( not ( = ?auto_148219 ?auto_148222 ) ) ( not ( = ?auto_148219 ?auto_148220 ) ) ( not ( = ?auto_148221 ?auto_148222 ) ) ( not ( = ?auto_148221 ?auto_148220 ) ) ( not ( = ?auto_148223 ?auto_148222 ) ) ( not ( = ?auto_148223 ?auto_148220 ) ) ( ON ?auto_148220 ?auto_148224 ) ( not ( = ?auto_148217 ?auto_148224 ) ) ( not ( = ?auto_148218 ?auto_148224 ) ) ( not ( = ?auto_148219 ?auto_148224 ) ) ( not ( = ?auto_148221 ?auto_148224 ) ) ( not ( = ?auto_148223 ?auto_148224 ) ) ( not ( = ?auto_148225 ?auto_148224 ) ) ( not ( = ?auto_148220 ?auto_148224 ) ) ( not ( = ?auto_148222 ?auto_148224 ) ) ( ON ?auto_148222 ?auto_148220 ) ( ON-TABLE ?auto_148224 ) ( ON ?auto_148225 ?auto_148222 ) ( ON ?auto_148223 ?auto_148225 ) ( ON ?auto_148221 ?auto_148223 ) ( CLEAR ?auto_148218 ) ( ON ?auto_148219 ?auto_148221 ) ( CLEAR ?auto_148219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148224 ?auto_148220 ?auto_148222 ?auto_148225 ?auto_148223 ?auto_148221 )
      ( MAKE-3PILE ?auto_148217 ?auto_148218 ?auto_148219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148226 - BLOCK
      ?auto_148227 - BLOCK
      ?auto_148228 - BLOCK
    )
    :vars
    (
      ?auto_148233 - BLOCK
      ?auto_148234 - BLOCK
      ?auto_148230 - BLOCK
      ?auto_148229 - BLOCK
      ?auto_148231 - BLOCK
      ?auto_148232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148226 ) ( not ( = ?auto_148226 ?auto_148227 ) ) ( not ( = ?auto_148226 ?auto_148228 ) ) ( not ( = ?auto_148226 ?auto_148233 ) ) ( not ( = ?auto_148227 ?auto_148228 ) ) ( not ( = ?auto_148227 ?auto_148233 ) ) ( not ( = ?auto_148228 ?auto_148233 ) ) ( not ( = ?auto_148226 ?auto_148234 ) ) ( not ( = ?auto_148226 ?auto_148230 ) ) ( not ( = ?auto_148227 ?auto_148234 ) ) ( not ( = ?auto_148227 ?auto_148230 ) ) ( not ( = ?auto_148228 ?auto_148234 ) ) ( not ( = ?auto_148228 ?auto_148230 ) ) ( not ( = ?auto_148233 ?auto_148234 ) ) ( not ( = ?auto_148233 ?auto_148230 ) ) ( not ( = ?auto_148234 ?auto_148230 ) ) ( not ( = ?auto_148229 ?auto_148231 ) ) ( not ( = ?auto_148229 ?auto_148230 ) ) ( not ( = ?auto_148231 ?auto_148230 ) ) ( not ( = ?auto_148226 ?auto_148231 ) ) ( not ( = ?auto_148226 ?auto_148229 ) ) ( not ( = ?auto_148227 ?auto_148231 ) ) ( not ( = ?auto_148227 ?auto_148229 ) ) ( not ( = ?auto_148228 ?auto_148231 ) ) ( not ( = ?auto_148228 ?auto_148229 ) ) ( not ( = ?auto_148233 ?auto_148231 ) ) ( not ( = ?auto_148233 ?auto_148229 ) ) ( not ( = ?auto_148234 ?auto_148231 ) ) ( not ( = ?auto_148234 ?auto_148229 ) ) ( ON ?auto_148229 ?auto_148232 ) ( not ( = ?auto_148226 ?auto_148232 ) ) ( not ( = ?auto_148227 ?auto_148232 ) ) ( not ( = ?auto_148228 ?auto_148232 ) ) ( not ( = ?auto_148233 ?auto_148232 ) ) ( not ( = ?auto_148234 ?auto_148232 ) ) ( not ( = ?auto_148230 ?auto_148232 ) ) ( not ( = ?auto_148229 ?auto_148232 ) ) ( not ( = ?auto_148231 ?auto_148232 ) ) ( ON ?auto_148231 ?auto_148229 ) ( ON-TABLE ?auto_148232 ) ( ON ?auto_148230 ?auto_148231 ) ( ON ?auto_148234 ?auto_148230 ) ( ON ?auto_148233 ?auto_148234 ) ( ON ?auto_148228 ?auto_148233 ) ( CLEAR ?auto_148228 ) ( HOLDING ?auto_148227 ) ( CLEAR ?auto_148226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148226 ?auto_148227 )
      ( MAKE-3PILE ?auto_148226 ?auto_148227 ?auto_148228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148235 - BLOCK
      ?auto_148236 - BLOCK
      ?auto_148237 - BLOCK
    )
    :vars
    (
      ?auto_148239 - BLOCK
      ?auto_148238 - BLOCK
      ?auto_148243 - BLOCK
      ?auto_148242 - BLOCK
      ?auto_148240 - BLOCK
      ?auto_148241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148235 ) ( not ( = ?auto_148235 ?auto_148236 ) ) ( not ( = ?auto_148235 ?auto_148237 ) ) ( not ( = ?auto_148235 ?auto_148239 ) ) ( not ( = ?auto_148236 ?auto_148237 ) ) ( not ( = ?auto_148236 ?auto_148239 ) ) ( not ( = ?auto_148237 ?auto_148239 ) ) ( not ( = ?auto_148235 ?auto_148238 ) ) ( not ( = ?auto_148235 ?auto_148243 ) ) ( not ( = ?auto_148236 ?auto_148238 ) ) ( not ( = ?auto_148236 ?auto_148243 ) ) ( not ( = ?auto_148237 ?auto_148238 ) ) ( not ( = ?auto_148237 ?auto_148243 ) ) ( not ( = ?auto_148239 ?auto_148238 ) ) ( not ( = ?auto_148239 ?auto_148243 ) ) ( not ( = ?auto_148238 ?auto_148243 ) ) ( not ( = ?auto_148242 ?auto_148240 ) ) ( not ( = ?auto_148242 ?auto_148243 ) ) ( not ( = ?auto_148240 ?auto_148243 ) ) ( not ( = ?auto_148235 ?auto_148240 ) ) ( not ( = ?auto_148235 ?auto_148242 ) ) ( not ( = ?auto_148236 ?auto_148240 ) ) ( not ( = ?auto_148236 ?auto_148242 ) ) ( not ( = ?auto_148237 ?auto_148240 ) ) ( not ( = ?auto_148237 ?auto_148242 ) ) ( not ( = ?auto_148239 ?auto_148240 ) ) ( not ( = ?auto_148239 ?auto_148242 ) ) ( not ( = ?auto_148238 ?auto_148240 ) ) ( not ( = ?auto_148238 ?auto_148242 ) ) ( ON ?auto_148242 ?auto_148241 ) ( not ( = ?auto_148235 ?auto_148241 ) ) ( not ( = ?auto_148236 ?auto_148241 ) ) ( not ( = ?auto_148237 ?auto_148241 ) ) ( not ( = ?auto_148239 ?auto_148241 ) ) ( not ( = ?auto_148238 ?auto_148241 ) ) ( not ( = ?auto_148243 ?auto_148241 ) ) ( not ( = ?auto_148242 ?auto_148241 ) ) ( not ( = ?auto_148240 ?auto_148241 ) ) ( ON ?auto_148240 ?auto_148242 ) ( ON-TABLE ?auto_148241 ) ( ON ?auto_148243 ?auto_148240 ) ( ON ?auto_148238 ?auto_148243 ) ( ON ?auto_148239 ?auto_148238 ) ( ON ?auto_148237 ?auto_148239 ) ( CLEAR ?auto_148235 ) ( ON ?auto_148236 ?auto_148237 ) ( CLEAR ?auto_148236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148241 ?auto_148242 ?auto_148240 ?auto_148243 ?auto_148238 ?auto_148239 ?auto_148237 )
      ( MAKE-3PILE ?auto_148235 ?auto_148236 ?auto_148237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148244 - BLOCK
      ?auto_148245 - BLOCK
      ?auto_148246 - BLOCK
    )
    :vars
    (
      ?auto_148247 - BLOCK
      ?auto_148248 - BLOCK
      ?auto_148249 - BLOCK
      ?auto_148252 - BLOCK
      ?auto_148251 - BLOCK
      ?auto_148250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148244 ?auto_148245 ) ) ( not ( = ?auto_148244 ?auto_148246 ) ) ( not ( = ?auto_148244 ?auto_148247 ) ) ( not ( = ?auto_148245 ?auto_148246 ) ) ( not ( = ?auto_148245 ?auto_148247 ) ) ( not ( = ?auto_148246 ?auto_148247 ) ) ( not ( = ?auto_148244 ?auto_148248 ) ) ( not ( = ?auto_148244 ?auto_148249 ) ) ( not ( = ?auto_148245 ?auto_148248 ) ) ( not ( = ?auto_148245 ?auto_148249 ) ) ( not ( = ?auto_148246 ?auto_148248 ) ) ( not ( = ?auto_148246 ?auto_148249 ) ) ( not ( = ?auto_148247 ?auto_148248 ) ) ( not ( = ?auto_148247 ?auto_148249 ) ) ( not ( = ?auto_148248 ?auto_148249 ) ) ( not ( = ?auto_148252 ?auto_148251 ) ) ( not ( = ?auto_148252 ?auto_148249 ) ) ( not ( = ?auto_148251 ?auto_148249 ) ) ( not ( = ?auto_148244 ?auto_148251 ) ) ( not ( = ?auto_148244 ?auto_148252 ) ) ( not ( = ?auto_148245 ?auto_148251 ) ) ( not ( = ?auto_148245 ?auto_148252 ) ) ( not ( = ?auto_148246 ?auto_148251 ) ) ( not ( = ?auto_148246 ?auto_148252 ) ) ( not ( = ?auto_148247 ?auto_148251 ) ) ( not ( = ?auto_148247 ?auto_148252 ) ) ( not ( = ?auto_148248 ?auto_148251 ) ) ( not ( = ?auto_148248 ?auto_148252 ) ) ( ON ?auto_148252 ?auto_148250 ) ( not ( = ?auto_148244 ?auto_148250 ) ) ( not ( = ?auto_148245 ?auto_148250 ) ) ( not ( = ?auto_148246 ?auto_148250 ) ) ( not ( = ?auto_148247 ?auto_148250 ) ) ( not ( = ?auto_148248 ?auto_148250 ) ) ( not ( = ?auto_148249 ?auto_148250 ) ) ( not ( = ?auto_148252 ?auto_148250 ) ) ( not ( = ?auto_148251 ?auto_148250 ) ) ( ON ?auto_148251 ?auto_148252 ) ( ON-TABLE ?auto_148250 ) ( ON ?auto_148249 ?auto_148251 ) ( ON ?auto_148248 ?auto_148249 ) ( ON ?auto_148247 ?auto_148248 ) ( ON ?auto_148246 ?auto_148247 ) ( ON ?auto_148245 ?auto_148246 ) ( CLEAR ?auto_148245 ) ( HOLDING ?auto_148244 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148244 )
      ( MAKE-3PILE ?auto_148244 ?auto_148245 ?auto_148246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_148253 - BLOCK
      ?auto_148254 - BLOCK
      ?auto_148255 - BLOCK
    )
    :vars
    (
      ?auto_148259 - BLOCK
      ?auto_148257 - BLOCK
      ?auto_148258 - BLOCK
      ?auto_148261 - BLOCK
      ?auto_148256 - BLOCK
      ?auto_148260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148253 ?auto_148254 ) ) ( not ( = ?auto_148253 ?auto_148255 ) ) ( not ( = ?auto_148253 ?auto_148259 ) ) ( not ( = ?auto_148254 ?auto_148255 ) ) ( not ( = ?auto_148254 ?auto_148259 ) ) ( not ( = ?auto_148255 ?auto_148259 ) ) ( not ( = ?auto_148253 ?auto_148257 ) ) ( not ( = ?auto_148253 ?auto_148258 ) ) ( not ( = ?auto_148254 ?auto_148257 ) ) ( not ( = ?auto_148254 ?auto_148258 ) ) ( not ( = ?auto_148255 ?auto_148257 ) ) ( not ( = ?auto_148255 ?auto_148258 ) ) ( not ( = ?auto_148259 ?auto_148257 ) ) ( not ( = ?auto_148259 ?auto_148258 ) ) ( not ( = ?auto_148257 ?auto_148258 ) ) ( not ( = ?auto_148261 ?auto_148256 ) ) ( not ( = ?auto_148261 ?auto_148258 ) ) ( not ( = ?auto_148256 ?auto_148258 ) ) ( not ( = ?auto_148253 ?auto_148256 ) ) ( not ( = ?auto_148253 ?auto_148261 ) ) ( not ( = ?auto_148254 ?auto_148256 ) ) ( not ( = ?auto_148254 ?auto_148261 ) ) ( not ( = ?auto_148255 ?auto_148256 ) ) ( not ( = ?auto_148255 ?auto_148261 ) ) ( not ( = ?auto_148259 ?auto_148256 ) ) ( not ( = ?auto_148259 ?auto_148261 ) ) ( not ( = ?auto_148257 ?auto_148256 ) ) ( not ( = ?auto_148257 ?auto_148261 ) ) ( ON ?auto_148261 ?auto_148260 ) ( not ( = ?auto_148253 ?auto_148260 ) ) ( not ( = ?auto_148254 ?auto_148260 ) ) ( not ( = ?auto_148255 ?auto_148260 ) ) ( not ( = ?auto_148259 ?auto_148260 ) ) ( not ( = ?auto_148257 ?auto_148260 ) ) ( not ( = ?auto_148258 ?auto_148260 ) ) ( not ( = ?auto_148261 ?auto_148260 ) ) ( not ( = ?auto_148256 ?auto_148260 ) ) ( ON ?auto_148256 ?auto_148261 ) ( ON-TABLE ?auto_148260 ) ( ON ?auto_148258 ?auto_148256 ) ( ON ?auto_148257 ?auto_148258 ) ( ON ?auto_148259 ?auto_148257 ) ( ON ?auto_148255 ?auto_148259 ) ( ON ?auto_148254 ?auto_148255 ) ( ON ?auto_148253 ?auto_148254 ) ( CLEAR ?auto_148253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148260 ?auto_148261 ?auto_148256 ?auto_148258 ?auto_148257 ?auto_148259 ?auto_148255 ?auto_148254 )
      ( MAKE-3PILE ?auto_148253 ?auto_148254 ?auto_148255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148267 - BLOCK
      ?auto_148268 - BLOCK
      ?auto_148269 - BLOCK
      ?auto_148270 - BLOCK
      ?auto_148271 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_148271 ) ( CLEAR ?auto_148270 ) ( ON-TABLE ?auto_148267 ) ( ON ?auto_148268 ?auto_148267 ) ( ON ?auto_148269 ?auto_148268 ) ( ON ?auto_148270 ?auto_148269 ) ( not ( = ?auto_148267 ?auto_148268 ) ) ( not ( = ?auto_148267 ?auto_148269 ) ) ( not ( = ?auto_148267 ?auto_148270 ) ) ( not ( = ?auto_148267 ?auto_148271 ) ) ( not ( = ?auto_148268 ?auto_148269 ) ) ( not ( = ?auto_148268 ?auto_148270 ) ) ( not ( = ?auto_148268 ?auto_148271 ) ) ( not ( = ?auto_148269 ?auto_148270 ) ) ( not ( = ?auto_148269 ?auto_148271 ) ) ( not ( = ?auto_148270 ?auto_148271 ) ) )
    :subtasks
    ( ( !STACK ?auto_148271 ?auto_148270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148272 - BLOCK
      ?auto_148273 - BLOCK
      ?auto_148274 - BLOCK
      ?auto_148275 - BLOCK
      ?auto_148276 - BLOCK
    )
    :vars
    (
      ?auto_148277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148275 ) ( ON-TABLE ?auto_148272 ) ( ON ?auto_148273 ?auto_148272 ) ( ON ?auto_148274 ?auto_148273 ) ( ON ?auto_148275 ?auto_148274 ) ( not ( = ?auto_148272 ?auto_148273 ) ) ( not ( = ?auto_148272 ?auto_148274 ) ) ( not ( = ?auto_148272 ?auto_148275 ) ) ( not ( = ?auto_148272 ?auto_148276 ) ) ( not ( = ?auto_148273 ?auto_148274 ) ) ( not ( = ?auto_148273 ?auto_148275 ) ) ( not ( = ?auto_148273 ?auto_148276 ) ) ( not ( = ?auto_148274 ?auto_148275 ) ) ( not ( = ?auto_148274 ?auto_148276 ) ) ( not ( = ?auto_148275 ?auto_148276 ) ) ( ON ?auto_148276 ?auto_148277 ) ( CLEAR ?auto_148276 ) ( HAND-EMPTY ) ( not ( = ?auto_148272 ?auto_148277 ) ) ( not ( = ?auto_148273 ?auto_148277 ) ) ( not ( = ?auto_148274 ?auto_148277 ) ) ( not ( = ?auto_148275 ?auto_148277 ) ) ( not ( = ?auto_148276 ?auto_148277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148276 ?auto_148277 )
      ( MAKE-5PILE ?auto_148272 ?auto_148273 ?auto_148274 ?auto_148275 ?auto_148276 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148278 - BLOCK
      ?auto_148279 - BLOCK
      ?auto_148280 - BLOCK
      ?auto_148281 - BLOCK
      ?auto_148282 - BLOCK
    )
    :vars
    (
      ?auto_148283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148278 ) ( ON ?auto_148279 ?auto_148278 ) ( ON ?auto_148280 ?auto_148279 ) ( not ( = ?auto_148278 ?auto_148279 ) ) ( not ( = ?auto_148278 ?auto_148280 ) ) ( not ( = ?auto_148278 ?auto_148281 ) ) ( not ( = ?auto_148278 ?auto_148282 ) ) ( not ( = ?auto_148279 ?auto_148280 ) ) ( not ( = ?auto_148279 ?auto_148281 ) ) ( not ( = ?auto_148279 ?auto_148282 ) ) ( not ( = ?auto_148280 ?auto_148281 ) ) ( not ( = ?auto_148280 ?auto_148282 ) ) ( not ( = ?auto_148281 ?auto_148282 ) ) ( ON ?auto_148282 ?auto_148283 ) ( CLEAR ?auto_148282 ) ( not ( = ?auto_148278 ?auto_148283 ) ) ( not ( = ?auto_148279 ?auto_148283 ) ) ( not ( = ?auto_148280 ?auto_148283 ) ) ( not ( = ?auto_148281 ?auto_148283 ) ) ( not ( = ?auto_148282 ?auto_148283 ) ) ( HOLDING ?auto_148281 ) ( CLEAR ?auto_148280 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148278 ?auto_148279 ?auto_148280 ?auto_148281 )
      ( MAKE-5PILE ?auto_148278 ?auto_148279 ?auto_148280 ?auto_148281 ?auto_148282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148284 - BLOCK
      ?auto_148285 - BLOCK
      ?auto_148286 - BLOCK
      ?auto_148287 - BLOCK
      ?auto_148288 - BLOCK
    )
    :vars
    (
      ?auto_148289 - BLOCK
      ?auto_148290 - BLOCK
      ?auto_148291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148284 ) ( ON ?auto_148285 ?auto_148284 ) ( ON ?auto_148286 ?auto_148285 ) ( not ( = ?auto_148284 ?auto_148285 ) ) ( not ( = ?auto_148284 ?auto_148286 ) ) ( not ( = ?auto_148284 ?auto_148287 ) ) ( not ( = ?auto_148284 ?auto_148288 ) ) ( not ( = ?auto_148285 ?auto_148286 ) ) ( not ( = ?auto_148285 ?auto_148287 ) ) ( not ( = ?auto_148285 ?auto_148288 ) ) ( not ( = ?auto_148286 ?auto_148287 ) ) ( not ( = ?auto_148286 ?auto_148288 ) ) ( not ( = ?auto_148287 ?auto_148288 ) ) ( ON ?auto_148288 ?auto_148289 ) ( not ( = ?auto_148284 ?auto_148289 ) ) ( not ( = ?auto_148285 ?auto_148289 ) ) ( not ( = ?auto_148286 ?auto_148289 ) ) ( not ( = ?auto_148287 ?auto_148289 ) ) ( not ( = ?auto_148288 ?auto_148289 ) ) ( CLEAR ?auto_148286 ) ( ON ?auto_148287 ?auto_148288 ) ( CLEAR ?auto_148287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148290 ) ( ON ?auto_148291 ?auto_148290 ) ( ON ?auto_148289 ?auto_148291 ) ( not ( = ?auto_148290 ?auto_148291 ) ) ( not ( = ?auto_148290 ?auto_148289 ) ) ( not ( = ?auto_148290 ?auto_148288 ) ) ( not ( = ?auto_148290 ?auto_148287 ) ) ( not ( = ?auto_148291 ?auto_148289 ) ) ( not ( = ?auto_148291 ?auto_148288 ) ) ( not ( = ?auto_148291 ?auto_148287 ) ) ( not ( = ?auto_148284 ?auto_148290 ) ) ( not ( = ?auto_148284 ?auto_148291 ) ) ( not ( = ?auto_148285 ?auto_148290 ) ) ( not ( = ?auto_148285 ?auto_148291 ) ) ( not ( = ?auto_148286 ?auto_148290 ) ) ( not ( = ?auto_148286 ?auto_148291 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148290 ?auto_148291 ?auto_148289 ?auto_148288 )
      ( MAKE-5PILE ?auto_148284 ?auto_148285 ?auto_148286 ?auto_148287 ?auto_148288 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148292 - BLOCK
      ?auto_148293 - BLOCK
      ?auto_148294 - BLOCK
      ?auto_148295 - BLOCK
      ?auto_148296 - BLOCK
    )
    :vars
    (
      ?auto_148299 - BLOCK
      ?auto_148298 - BLOCK
      ?auto_148297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148292 ) ( ON ?auto_148293 ?auto_148292 ) ( not ( = ?auto_148292 ?auto_148293 ) ) ( not ( = ?auto_148292 ?auto_148294 ) ) ( not ( = ?auto_148292 ?auto_148295 ) ) ( not ( = ?auto_148292 ?auto_148296 ) ) ( not ( = ?auto_148293 ?auto_148294 ) ) ( not ( = ?auto_148293 ?auto_148295 ) ) ( not ( = ?auto_148293 ?auto_148296 ) ) ( not ( = ?auto_148294 ?auto_148295 ) ) ( not ( = ?auto_148294 ?auto_148296 ) ) ( not ( = ?auto_148295 ?auto_148296 ) ) ( ON ?auto_148296 ?auto_148299 ) ( not ( = ?auto_148292 ?auto_148299 ) ) ( not ( = ?auto_148293 ?auto_148299 ) ) ( not ( = ?auto_148294 ?auto_148299 ) ) ( not ( = ?auto_148295 ?auto_148299 ) ) ( not ( = ?auto_148296 ?auto_148299 ) ) ( ON ?auto_148295 ?auto_148296 ) ( CLEAR ?auto_148295 ) ( ON-TABLE ?auto_148298 ) ( ON ?auto_148297 ?auto_148298 ) ( ON ?auto_148299 ?auto_148297 ) ( not ( = ?auto_148298 ?auto_148297 ) ) ( not ( = ?auto_148298 ?auto_148299 ) ) ( not ( = ?auto_148298 ?auto_148296 ) ) ( not ( = ?auto_148298 ?auto_148295 ) ) ( not ( = ?auto_148297 ?auto_148299 ) ) ( not ( = ?auto_148297 ?auto_148296 ) ) ( not ( = ?auto_148297 ?auto_148295 ) ) ( not ( = ?auto_148292 ?auto_148298 ) ) ( not ( = ?auto_148292 ?auto_148297 ) ) ( not ( = ?auto_148293 ?auto_148298 ) ) ( not ( = ?auto_148293 ?auto_148297 ) ) ( not ( = ?auto_148294 ?auto_148298 ) ) ( not ( = ?auto_148294 ?auto_148297 ) ) ( HOLDING ?auto_148294 ) ( CLEAR ?auto_148293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148292 ?auto_148293 ?auto_148294 )
      ( MAKE-5PILE ?auto_148292 ?auto_148293 ?auto_148294 ?auto_148295 ?auto_148296 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148300 - BLOCK
      ?auto_148301 - BLOCK
      ?auto_148302 - BLOCK
      ?auto_148303 - BLOCK
      ?auto_148304 - BLOCK
    )
    :vars
    (
      ?auto_148307 - BLOCK
      ?auto_148306 - BLOCK
      ?auto_148305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148300 ) ( ON ?auto_148301 ?auto_148300 ) ( not ( = ?auto_148300 ?auto_148301 ) ) ( not ( = ?auto_148300 ?auto_148302 ) ) ( not ( = ?auto_148300 ?auto_148303 ) ) ( not ( = ?auto_148300 ?auto_148304 ) ) ( not ( = ?auto_148301 ?auto_148302 ) ) ( not ( = ?auto_148301 ?auto_148303 ) ) ( not ( = ?auto_148301 ?auto_148304 ) ) ( not ( = ?auto_148302 ?auto_148303 ) ) ( not ( = ?auto_148302 ?auto_148304 ) ) ( not ( = ?auto_148303 ?auto_148304 ) ) ( ON ?auto_148304 ?auto_148307 ) ( not ( = ?auto_148300 ?auto_148307 ) ) ( not ( = ?auto_148301 ?auto_148307 ) ) ( not ( = ?auto_148302 ?auto_148307 ) ) ( not ( = ?auto_148303 ?auto_148307 ) ) ( not ( = ?auto_148304 ?auto_148307 ) ) ( ON ?auto_148303 ?auto_148304 ) ( ON-TABLE ?auto_148306 ) ( ON ?auto_148305 ?auto_148306 ) ( ON ?auto_148307 ?auto_148305 ) ( not ( = ?auto_148306 ?auto_148305 ) ) ( not ( = ?auto_148306 ?auto_148307 ) ) ( not ( = ?auto_148306 ?auto_148304 ) ) ( not ( = ?auto_148306 ?auto_148303 ) ) ( not ( = ?auto_148305 ?auto_148307 ) ) ( not ( = ?auto_148305 ?auto_148304 ) ) ( not ( = ?auto_148305 ?auto_148303 ) ) ( not ( = ?auto_148300 ?auto_148306 ) ) ( not ( = ?auto_148300 ?auto_148305 ) ) ( not ( = ?auto_148301 ?auto_148306 ) ) ( not ( = ?auto_148301 ?auto_148305 ) ) ( not ( = ?auto_148302 ?auto_148306 ) ) ( not ( = ?auto_148302 ?auto_148305 ) ) ( CLEAR ?auto_148301 ) ( ON ?auto_148302 ?auto_148303 ) ( CLEAR ?auto_148302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148306 ?auto_148305 ?auto_148307 ?auto_148304 ?auto_148303 )
      ( MAKE-5PILE ?auto_148300 ?auto_148301 ?auto_148302 ?auto_148303 ?auto_148304 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148308 - BLOCK
      ?auto_148309 - BLOCK
      ?auto_148310 - BLOCK
      ?auto_148311 - BLOCK
      ?auto_148312 - BLOCK
    )
    :vars
    (
      ?auto_148313 - BLOCK
      ?auto_148315 - BLOCK
      ?auto_148314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148308 ) ( not ( = ?auto_148308 ?auto_148309 ) ) ( not ( = ?auto_148308 ?auto_148310 ) ) ( not ( = ?auto_148308 ?auto_148311 ) ) ( not ( = ?auto_148308 ?auto_148312 ) ) ( not ( = ?auto_148309 ?auto_148310 ) ) ( not ( = ?auto_148309 ?auto_148311 ) ) ( not ( = ?auto_148309 ?auto_148312 ) ) ( not ( = ?auto_148310 ?auto_148311 ) ) ( not ( = ?auto_148310 ?auto_148312 ) ) ( not ( = ?auto_148311 ?auto_148312 ) ) ( ON ?auto_148312 ?auto_148313 ) ( not ( = ?auto_148308 ?auto_148313 ) ) ( not ( = ?auto_148309 ?auto_148313 ) ) ( not ( = ?auto_148310 ?auto_148313 ) ) ( not ( = ?auto_148311 ?auto_148313 ) ) ( not ( = ?auto_148312 ?auto_148313 ) ) ( ON ?auto_148311 ?auto_148312 ) ( ON-TABLE ?auto_148315 ) ( ON ?auto_148314 ?auto_148315 ) ( ON ?auto_148313 ?auto_148314 ) ( not ( = ?auto_148315 ?auto_148314 ) ) ( not ( = ?auto_148315 ?auto_148313 ) ) ( not ( = ?auto_148315 ?auto_148312 ) ) ( not ( = ?auto_148315 ?auto_148311 ) ) ( not ( = ?auto_148314 ?auto_148313 ) ) ( not ( = ?auto_148314 ?auto_148312 ) ) ( not ( = ?auto_148314 ?auto_148311 ) ) ( not ( = ?auto_148308 ?auto_148315 ) ) ( not ( = ?auto_148308 ?auto_148314 ) ) ( not ( = ?auto_148309 ?auto_148315 ) ) ( not ( = ?auto_148309 ?auto_148314 ) ) ( not ( = ?auto_148310 ?auto_148315 ) ) ( not ( = ?auto_148310 ?auto_148314 ) ) ( ON ?auto_148310 ?auto_148311 ) ( CLEAR ?auto_148310 ) ( HOLDING ?auto_148309 ) ( CLEAR ?auto_148308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148308 ?auto_148309 )
      ( MAKE-5PILE ?auto_148308 ?auto_148309 ?auto_148310 ?auto_148311 ?auto_148312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148316 - BLOCK
      ?auto_148317 - BLOCK
      ?auto_148318 - BLOCK
      ?auto_148319 - BLOCK
      ?auto_148320 - BLOCK
    )
    :vars
    (
      ?auto_148322 - BLOCK
      ?auto_148321 - BLOCK
      ?auto_148323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148316 ) ( not ( = ?auto_148316 ?auto_148317 ) ) ( not ( = ?auto_148316 ?auto_148318 ) ) ( not ( = ?auto_148316 ?auto_148319 ) ) ( not ( = ?auto_148316 ?auto_148320 ) ) ( not ( = ?auto_148317 ?auto_148318 ) ) ( not ( = ?auto_148317 ?auto_148319 ) ) ( not ( = ?auto_148317 ?auto_148320 ) ) ( not ( = ?auto_148318 ?auto_148319 ) ) ( not ( = ?auto_148318 ?auto_148320 ) ) ( not ( = ?auto_148319 ?auto_148320 ) ) ( ON ?auto_148320 ?auto_148322 ) ( not ( = ?auto_148316 ?auto_148322 ) ) ( not ( = ?auto_148317 ?auto_148322 ) ) ( not ( = ?auto_148318 ?auto_148322 ) ) ( not ( = ?auto_148319 ?auto_148322 ) ) ( not ( = ?auto_148320 ?auto_148322 ) ) ( ON ?auto_148319 ?auto_148320 ) ( ON-TABLE ?auto_148321 ) ( ON ?auto_148323 ?auto_148321 ) ( ON ?auto_148322 ?auto_148323 ) ( not ( = ?auto_148321 ?auto_148323 ) ) ( not ( = ?auto_148321 ?auto_148322 ) ) ( not ( = ?auto_148321 ?auto_148320 ) ) ( not ( = ?auto_148321 ?auto_148319 ) ) ( not ( = ?auto_148323 ?auto_148322 ) ) ( not ( = ?auto_148323 ?auto_148320 ) ) ( not ( = ?auto_148323 ?auto_148319 ) ) ( not ( = ?auto_148316 ?auto_148321 ) ) ( not ( = ?auto_148316 ?auto_148323 ) ) ( not ( = ?auto_148317 ?auto_148321 ) ) ( not ( = ?auto_148317 ?auto_148323 ) ) ( not ( = ?auto_148318 ?auto_148321 ) ) ( not ( = ?auto_148318 ?auto_148323 ) ) ( ON ?auto_148318 ?auto_148319 ) ( CLEAR ?auto_148316 ) ( ON ?auto_148317 ?auto_148318 ) ( CLEAR ?auto_148317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148321 ?auto_148323 ?auto_148322 ?auto_148320 ?auto_148319 ?auto_148318 )
      ( MAKE-5PILE ?auto_148316 ?auto_148317 ?auto_148318 ?auto_148319 ?auto_148320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148324 - BLOCK
      ?auto_148325 - BLOCK
      ?auto_148326 - BLOCK
      ?auto_148327 - BLOCK
      ?auto_148328 - BLOCK
    )
    :vars
    (
      ?auto_148331 - BLOCK
      ?auto_148329 - BLOCK
      ?auto_148330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148324 ?auto_148325 ) ) ( not ( = ?auto_148324 ?auto_148326 ) ) ( not ( = ?auto_148324 ?auto_148327 ) ) ( not ( = ?auto_148324 ?auto_148328 ) ) ( not ( = ?auto_148325 ?auto_148326 ) ) ( not ( = ?auto_148325 ?auto_148327 ) ) ( not ( = ?auto_148325 ?auto_148328 ) ) ( not ( = ?auto_148326 ?auto_148327 ) ) ( not ( = ?auto_148326 ?auto_148328 ) ) ( not ( = ?auto_148327 ?auto_148328 ) ) ( ON ?auto_148328 ?auto_148331 ) ( not ( = ?auto_148324 ?auto_148331 ) ) ( not ( = ?auto_148325 ?auto_148331 ) ) ( not ( = ?auto_148326 ?auto_148331 ) ) ( not ( = ?auto_148327 ?auto_148331 ) ) ( not ( = ?auto_148328 ?auto_148331 ) ) ( ON ?auto_148327 ?auto_148328 ) ( ON-TABLE ?auto_148329 ) ( ON ?auto_148330 ?auto_148329 ) ( ON ?auto_148331 ?auto_148330 ) ( not ( = ?auto_148329 ?auto_148330 ) ) ( not ( = ?auto_148329 ?auto_148331 ) ) ( not ( = ?auto_148329 ?auto_148328 ) ) ( not ( = ?auto_148329 ?auto_148327 ) ) ( not ( = ?auto_148330 ?auto_148331 ) ) ( not ( = ?auto_148330 ?auto_148328 ) ) ( not ( = ?auto_148330 ?auto_148327 ) ) ( not ( = ?auto_148324 ?auto_148329 ) ) ( not ( = ?auto_148324 ?auto_148330 ) ) ( not ( = ?auto_148325 ?auto_148329 ) ) ( not ( = ?auto_148325 ?auto_148330 ) ) ( not ( = ?auto_148326 ?auto_148329 ) ) ( not ( = ?auto_148326 ?auto_148330 ) ) ( ON ?auto_148326 ?auto_148327 ) ( ON ?auto_148325 ?auto_148326 ) ( CLEAR ?auto_148325 ) ( HOLDING ?auto_148324 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148324 )
      ( MAKE-5PILE ?auto_148324 ?auto_148325 ?auto_148326 ?auto_148327 ?auto_148328 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148332 - BLOCK
      ?auto_148333 - BLOCK
      ?auto_148334 - BLOCK
      ?auto_148335 - BLOCK
      ?auto_148336 - BLOCK
    )
    :vars
    (
      ?auto_148339 - BLOCK
      ?auto_148337 - BLOCK
      ?auto_148338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148332 ?auto_148333 ) ) ( not ( = ?auto_148332 ?auto_148334 ) ) ( not ( = ?auto_148332 ?auto_148335 ) ) ( not ( = ?auto_148332 ?auto_148336 ) ) ( not ( = ?auto_148333 ?auto_148334 ) ) ( not ( = ?auto_148333 ?auto_148335 ) ) ( not ( = ?auto_148333 ?auto_148336 ) ) ( not ( = ?auto_148334 ?auto_148335 ) ) ( not ( = ?auto_148334 ?auto_148336 ) ) ( not ( = ?auto_148335 ?auto_148336 ) ) ( ON ?auto_148336 ?auto_148339 ) ( not ( = ?auto_148332 ?auto_148339 ) ) ( not ( = ?auto_148333 ?auto_148339 ) ) ( not ( = ?auto_148334 ?auto_148339 ) ) ( not ( = ?auto_148335 ?auto_148339 ) ) ( not ( = ?auto_148336 ?auto_148339 ) ) ( ON ?auto_148335 ?auto_148336 ) ( ON-TABLE ?auto_148337 ) ( ON ?auto_148338 ?auto_148337 ) ( ON ?auto_148339 ?auto_148338 ) ( not ( = ?auto_148337 ?auto_148338 ) ) ( not ( = ?auto_148337 ?auto_148339 ) ) ( not ( = ?auto_148337 ?auto_148336 ) ) ( not ( = ?auto_148337 ?auto_148335 ) ) ( not ( = ?auto_148338 ?auto_148339 ) ) ( not ( = ?auto_148338 ?auto_148336 ) ) ( not ( = ?auto_148338 ?auto_148335 ) ) ( not ( = ?auto_148332 ?auto_148337 ) ) ( not ( = ?auto_148332 ?auto_148338 ) ) ( not ( = ?auto_148333 ?auto_148337 ) ) ( not ( = ?auto_148333 ?auto_148338 ) ) ( not ( = ?auto_148334 ?auto_148337 ) ) ( not ( = ?auto_148334 ?auto_148338 ) ) ( ON ?auto_148334 ?auto_148335 ) ( ON ?auto_148333 ?auto_148334 ) ( ON ?auto_148332 ?auto_148333 ) ( CLEAR ?auto_148332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148337 ?auto_148338 ?auto_148339 ?auto_148336 ?auto_148335 ?auto_148334 ?auto_148333 )
      ( MAKE-5PILE ?auto_148332 ?auto_148333 ?auto_148334 ?auto_148335 ?auto_148336 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148340 - BLOCK
      ?auto_148341 - BLOCK
      ?auto_148342 - BLOCK
      ?auto_148343 - BLOCK
      ?auto_148344 - BLOCK
    )
    :vars
    (
      ?auto_148345 - BLOCK
      ?auto_148346 - BLOCK
      ?auto_148347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148340 ?auto_148341 ) ) ( not ( = ?auto_148340 ?auto_148342 ) ) ( not ( = ?auto_148340 ?auto_148343 ) ) ( not ( = ?auto_148340 ?auto_148344 ) ) ( not ( = ?auto_148341 ?auto_148342 ) ) ( not ( = ?auto_148341 ?auto_148343 ) ) ( not ( = ?auto_148341 ?auto_148344 ) ) ( not ( = ?auto_148342 ?auto_148343 ) ) ( not ( = ?auto_148342 ?auto_148344 ) ) ( not ( = ?auto_148343 ?auto_148344 ) ) ( ON ?auto_148344 ?auto_148345 ) ( not ( = ?auto_148340 ?auto_148345 ) ) ( not ( = ?auto_148341 ?auto_148345 ) ) ( not ( = ?auto_148342 ?auto_148345 ) ) ( not ( = ?auto_148343 ?auto_148345 ) ) ( not ( = ?auto_148344 ?auto_148345 ) ) ( ON ?auto_148343 ?auto_148344 ) ( ON-TABLE ?auto_148346 ) ( ON ?auto_148347 ?auto_148346 ) ( ON ?auto_148345 ?auto_148347 ) ( not ( = ?auto_148346 ?auto_148347 ) ) ( not ( = ?auto_148346 ?auto_148345 ) ) ( not ( = ?auto_148346 ?auto_148344 ) ) ( not ( = ?auto_148346 ?auto_148343 ) ) ( not ( = ?auto_148347 ?auto_148345 ) ) ( not ( = ?auto_148347 ?auto_148344 ) ) ( not ( = ?auto_148347 ?auto_148343 ) ) ( not ( = ?auto_148340 ?auto_148346 ) ) ( not ( = ?auto_148340 ?auto_148347 ) ) ( not ( = ?auto_148341 ?auto_148346 ) ) ( not ( = ?auto_148341 ?auto_148347 ) ) ( not ( = ?auto_148342 ?auto_148346 ) ) ( not ( = ?auto_148342 ?auto_148347 ) ) ( ON ?auto_148342 ?auto_148343 ) ( ON ?auto_148341 ?auto_148342 ) ( HOLDING ?auto_148340 ) ( CLEAR ?auto_148341 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148346 ?auto_148347 ?auto_148345 ?auto_148344 ?auto_148343 ?auto_148342 ?auto_148341 ?auto_148340 )
      ( MAKE-5PILE ?auto_148340 ?auto_148341 ?auto_148342 ?auto_148343 ?auto_148344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148348 - BLOCK
      ?auto_148349 - BLOCK
      ?auto_148350 - BLOCK
      ?auto_148351 - BLOCK
      ?auto_148352 - BLOCK
    )
    :vars
    (
      ?auto_148355 - BLOCK
      ?auto_148353 - BLOCK
      ?auto_148354 - BLOCK
      ?auto_148356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148348 ?auto_148349 ) ) ( not ( = ?auto_148348 ?auto_148350 ) ) ( not ( = ?auto_148348 ?auto_148351 ) ) ( not ( = ?auto_148348 ?auto_148352 ) ) ( not ( = ?auto_148349 ?auto_148350 ) ) ( not ( = ?auto_148349 ?auto_148351 ) ) ( not ( = ?auto_148349 ?auto_148352 ) ) ( not ( = ?auto_148350 ?auto_148351 ) ) ( not ( = ?auto_148350 ?auto_148352 ) ) ( not ( = ?auto_148351 ?auto_148352 ) ) ( ON ?auto_148352 ?auto_148355 ) ( not ( = ?auto_148348 ?auto_148355 ) ) ( not ( = ?auto_148349 ?auto_148355 ) ) ( not ( = ?auto_148350 ?auto_148355 ) ) ( not ( = ?auto_148351 ?auto_148355 ) ) ( not ( = ?auto_148352 ?auto_148355 ) ) ( ON ?auto_148351 ?auto_148352 ) ( ON-TABLE ?auto_148353 ) ( ON ?auto_148354 ?auto_148353 ) ( ON ?auto_148355 ?auto_148354 ) ( not ( = ?auto_148353 ?auto_148354 ) ) ( not ( = ?auto_148353 ?auto_148355 ) ) ( not ( = ?auto_148353 ?auto_148352 ) ) ( not ( = ?auto_148353 ?auto_148351 ) ) ( not ( = ?auto_148354 ?auto_148355 ) ) ( not ( = ?auto_148354 ?auto_148352 ) ) ( not ( = ?auto_148354 ?auto_148351 ) ) ( not ( = ?auto_148348 ?auto_148353 ) ) ( not ( = ?auto_148348 ?auto_148354 ) ) ( not ( = ?auto_148349 ?auto_148353 ) ) ( not ( = ?auto_148349 ?auto_148354 ) ) ( not ( = ?auto_148350 ?auto_148353 ) ) ( not ( = ?auto_148350 ?auto_148354 ) ) ( ON ?auto_148350 ?auto_148351 ) ( ON ?auto_148349 ?auto_148350 ) ( CLEAR ?auto_148349 ) ( ON ?auto_148348 ?auto_148356 ) ( CLEAR ?auto_148348 ) ( HAND-EMPTY ) ( not ( = ?auto_148348 ?auto_148356 ) ) ( not ( = ?auto_148349 ?auto_148356 ) ) ( not ( = ?auto_148350 ?auto_148356 ) ) ( not ( = ?auto_148351 ?auto_148356 ) ) ( not ( = ?auto_148352 ?auto_148356 ) ) ( not ( = ?auto_148355 ?auto_148356 ) ) ( not ( = ?auto_148353 ?auto_148356 ) ) ( not ( = ?auto_148354 ?auto_148356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148348 ?auto_148356 )
      ( MAKE-5PILE ?auto_148348 ?auto_148349 ?auto_148350 ?auto_148351 ?auto_148352 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148357 - BLOCK
      ?auto_148358 - BLOCK
      ?auto_148359 - BLOCK
      ?auto_148360 - BLOCK
      ?auto_148361 - BLOCK
    )
    :vars
    (
      ?auto_148362 - BLOCK
      ?auto_148363 - BLOCK
      ?auto_148364 - BLOCK
      ?auto_148365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148357 ?auto_148358 ) ) ( not ( = ?auto_148357 ?auto_148359 ) ) ( not ( = ?auto_148357 ?auto_148360 ) ) ( not ( = ?auto_148357 ?auto_148361 ) ) ( not ( = ?auto_148358 ?auto_148359 ) ) ( not ( = ?auto_148358 ?auto_148360 ) ) ( not ( = ?auto_148358 ?auto_148361 ) ) ( not ( = ?auto_148359 ?auto_148360 ) ) ( not ( = ?auto_148359 ?auto_148361 ) ) ( not ( = ?auto_148360 ?auto_148361 ) ) ( ON ?auto_148361 ?auto_148362 ) ( not ( = ?auto_148357 ?auto_148362 ) ) ( not ( = ?auto_148358 ?auto_148362 ) ) ( not ( = ?auto_148359 ?auto_148362 ) ) ( not ( = ?auto_148360 ?auto_148362 ) ) ( not ( = ?auto_148361 ?auto_148362 ) ) ( ON ?auto_148360 ?auto_148361 ) ( ON-TABLE ?auto_148363 ) ( ON ?auto_148364 ?auto_148363 ) ( ON ?auto_148362 ?auto_148364 ) ( not ( = ?auto_148363 ?auto_148364 ) ) ( not ( = ?auto_148363 ?auto_148362 ) ) ( not ( = ?auto_148363 ?auto_148361 ) ) ( not ( = ?auto_148363 ?auto_148360 ) ) ( not ( = ?auto_148364 ?auto_148362 ) ) ( not ( = ?auto_148364 ?auto_148361 ) ) ( not ( = ?auto_148364 ?auto_148360 ) ) ( not ( = ?auto_148357 ?auto_148363 ) ) ( not ( = ?auto_148357 ?auto_148364 ) ) ( not ( = ?auto_148358 ?auto_148363 ) ) ( not ( = ?auto_148358 ?auto_148364 ) ) ( not ( = ?auto_148359 ?auto_148363 ) ) ( not ( = ?auto_148359 ?auto_148364 ) ) ( ON ?auto_148359 ?auto_148360 ) ( ON ?auto_148357 ?auto_148365 ) ( CLEAR ?auto_148357 ) ( not ( = ?auto_148357 ?auto_148365 ) ) ( not ( = ?auto_148358 ?auto_148365 ) ) ( not ( = ?auto_148359 ?auto_148365 ) ) ( not ( = ?auto_148360 ?auto_148365 ) ) ( not ( = ?auto_148361 ?auto_148365 ) ) ( not ( = ?auto_148362 ?auto_148365 ) ) ( not ( = ?auto_148363 ?auto_148365 ) ) ( not ( = ?auto_148364 ?auto_148365 ) ) ( HOLDING ?auto_148358 ) ( CLEAR ?auto_148359 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148363 ?auto_148364 ?auto_148362 ?auto_148361 ?auto_148360 ?auto_148359 ?auto_148358 )
      ( MAKE-5PILE ?auto_148357 ?auto_148358 ?auto_148359 ?auto_148360 ?auto_148361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148366 - BLOCK
      ?auto_148367 - BLOCK
      ?auto_148368 - BLOCK
      ?auto_148369 - BLOCK
      ?auto_148370 - BLOCK
    )
    :vars
    (
      ?auto_148374 - BLOCK
      ?auto_148373 - BLOCK
      ?auto_148372 - BLOCK
      ?auto_148371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148366 ?auto_148367 ) ) ( not ( = ?auto_148366 ?auto_148368 ) ) ( not ( = ?auto_148366 ?auto_148369 ) ) ( not ( = ?auto_148366 ?auto_148370 ) ) ( not ( = ?auto_148367 ?auto_148368 ) ) ( not ( = ?auto_148367 ?auto_148369 ) ) ( not ( = ?auto_148367 ?auto_148370 ) ) ( not ( = ?auto_148368 ?auto_148369 ) ) ( not ( = ?auto_148368 ?auto_148370 ) ) ( not ( = ?auto_148369 ?auto_148370 ) ) ( ON ?auto_148370 ?auto_148374 ) ( not ( = ?auto_148366 ?auto_148374 ) ) ( not ( = ?auto_148367 ?auto_148374 ) ) ( not ( = ?auto_148368 ?auto_148374 ) ) ( not ( = ?auto_148369 ?auto_148374 ) ) ( not ( = ?auto_148370 ?auto_148374 ) ) ( ON ?auto_148369 ?auto_148370 ) ( ON-TABLE ?auto_148373 ) ( ON ?auto_148372 ?auto_148373 ) ( ON ?auto_148374 ?auto_148372 ) ( not ( = ?auto_148373 ?auto_148372 ) ) ( not ( = ?auto_148373 ?auto_148374 ) ) ( not ( = ?auto_148373 ?auto_148370 ) ) ( not ( = ?auto_148373 ?auto_148369 ) ) ( not ( = ?auto_148372 ?auto_148374 ) ) ( not ( = ?auto_148372 ?auto_148370 ) ) ( not ( = ?auto_148372 ?auto_148369 ) ) ( not ( = ?auto_148366 ?auto_148373 ) ) ( not ( = ?auto_148366 ?auto_148372 ) ) ( not ( = ?auto_148367 ?auto_148373 ) ) ( not ( = ?auto_148367 ?auto_148372 ) ) ( not ( = ?auto_148368 ?auto_148373 ) ) ( not ( = ?auto_148368 ?auto_148372 ) ) ( ON ?auto_148368 ?auto_148369 ) ( ON ?auto_148366 ?auto_148371 ) ( not ( = ?auto_148366 ?auto_148371 ) ) ( not ( = ?auto_148367 ?auto_148371 ) ) ( not ( = ?auto_148368 ?auto_148371 ) ) ( not ( = ?auto_148369 ?auto_148371 ) ) ( not ( = ?auto_148370 ?auto_148371 ) ) ( not ( = ?auto_148374 ?auto_148371 ) ) ( not ( = ?auto_148373 ?auto_148371 ) ) ( not ( = ?auto_148372 ?auto_148371 ) ) ( CLEAR ?auto_148368 ) ( ON ?auto_148367 ?auto_148366 ) ( CLEAR ?auto_148367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148371 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148371 ?auto_148366 )
      ( MAKE-5PILE ?auto_148366 ?auto_148367 ?auto_148368 ?auto_148369 ?auto_148370 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148375 - BLOCK
      ?auto_148376 - BLOCK
      ?auto_148377 - BLOCK
      ?auto_148378 - BLOCK
      ?auto_148379 - BLOCK
    )
    :vars
    (
      ?auto_148382 - BLOCK
      ?auto_148380 - BLOCK
      ?auto_148381 - BLOCK
      ?auto_148383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148375 ?auto_148376 ) ) ( not ( = ?auto_148375 ?auto_148377 ) ) ( not ( = ?auto_148375 ?auto_148378 ) ) ( not ( = ?auto_148375 ?auto_148379 ) ) ( not ( = ?auto_148376 ?auto_148377 ) ) ( not ( = ?auto_148376 ?auto_148378 ) ) ( not ( = ?auto_148376 ?auto_148379 ) ) ( not ( = ?auto_148377 ?auto_148378 ) ) ( not ( = ?auto_148377 ?auto_148379 ) ) ( not ( = ?auto_148378 ?auto_148379 ) ) ( ON ?auto_148379 ?auto_148382 ) ( not ( = ?auto_148375 ?auto_148382 ) ) ( not ( = ?auto_148376 ?auto_148382 ) ) ( not ( = ?auto_148377 ?auto_148382 ) ) ( not ( = ?auto_148378 ?auto_148382 ) ) ( not ( = ?auto_148379 ?auto_148382 ) ) ( ON ?auto_148378 ?auto_148379 ) ( ON-TABLE ?auto_148380 ) ( ON ?auto_148381 ?auto_148380 ) ( ON ?auto_148382 ?auto_148381 ) ( not ( = ?auto_148380 ?auto_148381 ) ) ( not ( = ?auto_148380 ?auto_148382 ) ) ( not ( = ?auto_148380 ?auto_148379 ) ) ( not ( = ?auto_148380 ?auto_148378 ) ) ( not ( = ?auto_148381 ?auto_148382 ) ) ( not ( = ?auto_148381 ?auto_148379 ) ) ( not ( = ?auto_148381 ?auto_148378 ) ) ( not ( = ?auto_148375 ?auto_148380 ) ) ( not ( = ?auto_148375 ?auto_148381 ) ) ( not ( = ?auto_148376 ?auto_148380 ) ) ( not ( = ?auto_148376 ?auto_148381 ) ) ( not ( = ?auto_148377 ?auto_148380 ) ) ( not ( = ?auto_148377 ?auto_148381 ) ) ( ON ?auto_148375 ?auto_148383 ) ( not ( = ?auto_148375 ?auto_148383 ) ) ( not ( = ?auto_148376 ?auto_148383 ) ) ( not ( = ?auto_148377 ?auto_148383 ) ) ( not ( = ?auto_148378 ?auto_148383 ) ) ( not ( = ?auto_148379 ?auto_148383 ) ) ( not ( = ?auto_148382 ?auto_148383 ) ) ( not ( = ?auto_148380 ?auto_148383 ) ) ( not ( = ?auto_148381 ?auto_148383 ) ) ( ON ?auto_148376 ?auto_148375 ) ( CLEAR ?auto_148376 ) ( ON-TABLE ?auto_148383 ) ( HOLDING ?auto_148377 ) ( CLEAR ?auto_148378 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148380 ?auto_148381 ?auto_148382 ?auto_148379 ?auto_148378 ?auto_148377 )
      ( MAKE-5PILE ?auto_148375 ?auto_148376 ?auto_148377 ?auto_148378 ?auto_148379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148384 - BLOCK
      ?auto_148385 - BLOCK
      ?auto_148386 - BLOCK
      ?auto_148387 - BLOCK
      ?auto_148388 - BLOCK
    )
    :vars
    (
      ?auto_148389 - BLOCK
      ?auto_148391 - BLOCK
      ?auto_148392 - BLOCK
      ?auto_148390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148384 ?auto_148385 ) ) ( not ( = ?auto_148384 ?auto_148386 ) ) ( not ( = ?auto_148384 ?auto_148387 ) ) ( not ( = ?auto_148384 ?auto_148388 ) ) ( not ( = ?auto_148385 ?auto_148386 ) ) ( not ( = ?auto_148385 ?auto_148387 ) ) ( not ( = ?auto_148385 ?auto_148388 ) ) ( not ( = ?auto_148386 ?auto_148387 ) ) ( not ( = ?auto_148386 ?auto_148388 ) ) ( not ( = ?auto_148387 ?auto_148388 ) ) ( ON ?auto_148388 ?auto_148389 ) ( not ( = ?auto_148384 ?auto_148389 ) ) ( not ( = ?auto_148385 ?auto_148389 ) ) ( not ( = ?auto_148386 ?auto_148389 ) ) ( not ( = ?auto_148387 ?auto_148389 ) ) ( not ( = ?auto_148388 ?auto_148389 ) ) ( ON ?auto_148387 ?auto_148388 ) ( ON-TABLE ?auto_148391 ) ( ON ?auto_148392 ?auto_148391 ) ( ON ?auto_148389 ?auto_148392 ) ( not ( = ?auto_148391 ?auto_148392 ) ) ( not ( = ?auto_148391 ?auto_148389 ) ) ( not ( = ?auto_148391 ?auto_148388 ) ) ( not ( = ?auto_148391 ?auto_148387 ) ) ( not ( = ?auto_148392 ?auto_148389 ) ) ( not ( = ?auto_148392 ?auto_148388 ) ) ( not ( = ?auto_148392 ?auto_148387 ) ) ( not ( = ?auto_148384 ?auto_148391 ) ) ( not ( = ?auto_148384 ?auto_148392 ) ) ( not ( = ?auto_148385 ?auto_148391 ) ) ( not ( = ?auto_148385 ?auto_148392 ) ) ( not ( = ?auto_148386 ?auto_148391 ) ) ( not ( = ?auto_148386 ?auto_148392 ) ) ( ON ?auto_148384 ?auto_148390 ) ( not ( = ?auto_148384 ?auto_148390 ) ) ( not ( = ?auto_148385 ?auto_148390 ) ) ( not ( = ?auto_148386 ?auto_148390 ) ) ( not ( = ?auto_148387 ?auto_148390 ) ) ( not ( = ?auto_148388 ?auto_148390 ) ) ( not ( = ?auto_148389 ?auto_148390 ) ) ( not ( = ?auto_148391 ?auto_148390 ) ) ( not ( = ?auto_148392 ?auto_148390 ) ) ( ON ?auto_148385 ?auto_148384 ) ( ON-TABLE ?auto_148390 ) ( CLEAR ?auto_148387 ) ( ON ?auto_148386 ?auto_148385 ) ( CLEAR ?auto_148386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148390 ?auto_148384 ?auto_148385 )
      ( MAKE-5PILE ?auto_148384 ?auto_148385 ?auto_148386 ?auto_148387 ?auto_148388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148393 - BLOCK
      ?auto_148394 - BLOCK
      ?auto_148395 - BLOCK
      ?auto_148396 - BLOCK
      ?auto_148397 - BLOCK
    )
    :vars
    (
      ?auto_148401 - BLOCK
      ?auto_148399 - BLOCK
      ?auto_148398 - BLOCK
      ?auto_148400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148393 ?auto_148394 ) ) ( not ( = ?auto_148393 ?auto_148395 ) ) ( not ( = ?auto_148393 ?auto_148396 ) ) ( not ( = ?auto_148393 ?auto_148397 ) ) ( not ( = ?auto_148394 ?auto_148395 ) ) ( not ( = ?auto_148394 ?auto_148396 ) ) ( not ( = ?auto_148394 ?auto_148397 ) ) ( not ( = ?auto_148395 ?auto_148396 ) ) ( not ( = ?auto_148395 ?auto_148397 ) ) ( not ( = ?auto_148396 ?auto_148397 ) ) ( ON ?auto_148397 ?auto_148401 ) ( not ( = ?auto_148393 ?auto_148401 ) ) ( not ( = ?auto_148394 ?auto_148401 ) ) ( not ( = ?auto_148395 ?auto_148401 ) ) ( not ( = ?auto_148396 ?auto_148401 ) ) ( not ( = ?auto_148397 ?auto_148401 ) ) ( ON-TABLE ?auto_148399 ) ( ON ?auto_148398 ?auto_148399 ) ( ON ?auto_148401 ?auto_148398 ) ( not ( = ?auto_148399 ?auto_148398 ) ) ( not ( = ?auto_148399 ?auto_148401 ) ) ( not ( = ?auto_148399 ?auto_148397 ) ) ( not ( = ?auto_148399 ?auto_148396 ) ) ( not ( = ?auto_148398 ?auto_148401 ) ) ( not ( = ?auto_148398 ?auto_148397 ) ) ( not ( = ?auto_148398 ?auto_148396 ) ) ( not ( = ?auto_148393 ?auto_148399 ) ) ( not ( = ?auto_148393 ?auto_148398 ) ) ( not ( = ?auto_148394 ?auto_148399 ) ) ( not ( = ?auto_148394 ?auto_148398 ) ) ( not ( = ?auto_148395 ?auto_148399 ) ) ( not ( = ?auto_148395 ?auto_148398 ) ) ( ON ?auto_148393 ?auto_148400 ) ( not ( = ?auto_148393 ?auto_148400 ) ) ( not ( = ?auto_148394 ?auto_148400 ) ) ( not ( = ?auto_148395 ?auto_148400 ) ) ( not ( = ?auto_148396 ?auto_148400 ) ) ( not ( = ?auto_148397 ?auto_148400 ) ) ( not ( = ?auto_148401 ?auto_148400 ) ) ( not ( = ?auto_148399 ?auto_148400 ) ) ( not ( = ?auto_148398 ?auto_148400 ) ) ( ON ?auto_148394 ?auto_148393 ) ( ON-TABLE ?auto_148400 ) ( ON ?auto_148395 ?auto_148394 ) ( CLEAR ?auto_148395 ) ( HOLDING ?auto_148396 ) ( CLEAR ?auto_148397 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148399 ?auto_148398 ?auto_148401 ?auto_148397 ?auto_148396 )
      ( MAKE-5PILE ?auto_148393 ?auto_148394 ?auto_148395 ?auto_148396 ?auto_148397 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148402 - BLOCK
      ?auto_148403 - BLOCK
      ?auto_148404 - BLOCK
      ?auto_148405 - BLOCK
      ?auto_148406 - BLOCK
    )
    :vars
    (
      ?auto_148408 - BLOCK
      ?auto_148407 - BLOCK
      ?auto_148410 - BLOCK
      ?auto_148409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148402 ?auto_148403 ) ) ( not ( = ?auto_148402 ?auto_148404 ) ) ( not ( = ?auto_148402 ?auto_148405 ) ) ( not ( = ?auto_148402 ?auto_148406 ) ) ( not ( = ?auto_148403 ?auto_148404 ) ) ( not ( = ?auto_148403 ?auto_148405 ) ) ( not ( = ?auto_148403 ?auto_148406 ) ) ( not ( = ?auto_148404 ?auto_148405 ) ) ( not ( = ?auto_148404 ?auto_148406 ) ) ( not ( = ?auto_148405 ?auto_148406 ) ) ( ON ?auto_148406 ?auto_148408 ) ( not ( = ?auto_148402 ?auto_148408 ) ) ( not ( = ?auto_148403 ?auto_148408 ) ) ( not ( = ?auto_148404 ?auto_148408 ) ) ( not ( = ?auto_148405 ?auto_148408 ) ) ( not ( = ?auto_148406 ?auto_148408 ) ) ( ON-TABLE ?auto_148407 ) ( ON ?auto_148410 ?auto_148407 ) ( ON ?auto_148408 ?auto_148410 ) ( not ( = ?auto_148407 ?auto_148410 ) ) ( not ( = ?auto_148407 ?auto_148408 ) ) ( not ( = ?auto_148407 ?auto_148406 ) ) ( not ( = ?auto_148407 ?auto_148405 ) ) ( not ( = ?auto_148410 ?auto_148408 ) ) ( not ( = ?auto_148410 ?auto_148406 ) ) ( not ( = ?auto_148410 ?auto_148405 ) ) ( not ( = ?auto_148402 ?auto_148407 ) ) ( not ( = ?auto_148402 ?auto_148410 ) ) ( not ( = ?auto_148403 ?auto_148407 ) ) ( not ( = ?auto_148403 ?auto_148410 ) ) ( not ( = ?auto_148404 ?auto_148407 ) ) ( not ( = ?auto_148404 ?auto_148410 ) ) ( ON ?auto_148402 ?auto_148409 ) ( not ( = ?auto_148402 ?auto_148409 ) ) ( not ( = ?auto_148403 ?auto_148409 ) ) ( not ( = ?auto_148404 ?auto_148409 ) ) ( not ( = ?auto_148405 ?auto_148409 ) ) ( not ( = ?auto_148406 ?auto_148409 ) ) ( not ( = ?auto_148408 ?auto_148409 ) ) ( not ( = ?auto_148407 ?auto_148409 ) ) ( not ( = ?auto_148410 ?auto_148409 ) ) ( ON ?auto_148403 ?auto_148402 ) ( ON-TABLE ?auto_148409 ) ( ON ?auto_148404 ?auto_148403 ) ( CLEAR ?auto_148406 ) ( ON ?auto_148405 ?auto_148404 ) ( CLEAR ?auto_148405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148409 ?auto_148402 ?auto_148403 ?auto_148404 )
      ( MAKE-5PILE ?auto_148402 ?auto_148403 ?auto_148404 ?auto_148405 ?auto_148406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148411 - BLOCK
      ?auto_148412 - BLOCK
      ?auto_148413 - BLOCK
      ?auto_148414 - BLOCK
      ?auto_148415 - BLOCK
    )
    :vars
    (
      ?auto_148417 - BLOCK
      ?auto_148416 - BLOCK
      ?auto_148418 - BLOCK
      ?auto_148419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148411 ?auto_148412 ) ) ( not ( = ?auto_148411 ?auto_148413 ) ) ( not ( = ?auto_148411 ?auto_148414 ) ) ( not ( = ?auto_148411 ?auto_148415 ) ) ( not ( = ?auto_148412 ?auto_148413 ) ) ( not ( = ?auto_148412 ?auto_148414 ) ) ( not ( = ?auto_148412 ?auto_148415 ) ) ( not ( = ?auto_148413 ?auto_148414 ) ) ( not ( = ?auto_148413 ?auto_148415 ) ) ( not ( = ?auto_148414 ?auto_148415 ) ) ( not ( = ?auto_148411 ?auto_148417 ) ) ( not ( = ?auto_148412 ?auto_148417 ) ) ( not ( = ?auto_148413 ?auto_148417 ) ) ( not ( = ?auto_148414 ?auto_148417 ) ) ( not ( = ?auto_148415 ?auto_148417 ) ) ( ON-TABLE ?auto_148416 ) ( ON ?auto_148418 ?auto_148416 ) ( ON ?auto_148417 ?auto_148418 ) ( not ( = ?auto_148416 ?auto_148418 ) ) ( not ( = ?auto_148416 ?auto_148417 ) ) ( not ( = ?auto_148416 ?auto_148415 ) ) ( not ( = ?auto_148416 ?auto_148414 ) ) ( not ( = ?auto_148418 ?auto_148417 ) ) ( not ( = ?auto_148418 ?auto_148415 ) ) ( not ( = ?auto_148418 ?auto_148414 ) ) ( not ( = ?auto_148411 ?auto_148416 ) ) ( not ( = ?auto_148411 ?auto_148418 ) ) ( not ( = ?auto_148412 ?auto_148416 ) ) ( not ( = ?auto_148412 ?auto_148418 ) ) ( not ( = ?auto_148413 ?auto_148416 ) ) ( not ( = ?auto_148413 ?auto_148418 ) ) ( ON ?auto_148411 ?auto_148419 ) ( not ( = ?auto_148411 ?auto_148419 ) ) ( not ( = ?auto_148412 ?auto_148419 ) ) ( not ( = ?auto_148413 ?auto_148419 ) ) ( not ( = ?auto_148414 ?auto_148419 ) ) ( not ( = ?auto_148415 ?auto_148419 ) ) ( not ( = ?auto_148417 ?auto_148419 ) ) ( not ( = ?auto_148416 ?auto_148419 ) ) ( not ( = ?auto_148418 ?auto_148419 ) ) ( ON ?auto_148412 ?auto_148411 ) ( ON-TABLE ?auto_148419 ) ( ON ?auto_148413 ?auto_148412 ) ( ON ?auto_148414 ?auto_148413 ) ( CLEAR ?auto_148414 ) ( HOLDING ?auto_148415 ) ( CLEAR ?auto_148417 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148416 ?auto_148418 ?auto_148417 ?auto_148415 )
      ( MAKE-5PILE ?auto_148411 ?auto_148412 ?auto_148413 ?auto_148414 ?auto_148415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148420 - BLOCK
      ?auto_148421 - BLOCK
      ?auto_148422 - BLOCK
      ?auto_148423 - BLOCK
      ?auto_148424 - BLOCK
    )
    :vars
    (
      ?auto_148427 - BLOCK
      ?auto_148425 - BLOCK
      ?auto_148428 - BLOCK
      ?auto_148426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148420 ?auto_148421 ) ) ( not ( = ?auto_148420 ?auto_148422 ) ) ( not ( = ?auto_148420 ?auto_148423 ) ) ( not ( = ?auto_148420 ?auto_148424 ) ) ( not ( = ?auto_148421 ?auto_148422 ) ) ( not ( = ?auto_148421 ?auto_148423 ) ) ( not ( = ?auto_148421 ?auto_148424 ) ) ( not ( = ?auto_148422 ?auto_148423 ) ) ( not ( = ?auto_148422 ?auto_148424 ) ) ( not ( = ?auto_148423 ?auto_148424 ) ) ( not ( = ?auto_148420 ?auto_148427 ) ) ( not ( = ?auto_148421 ?auto_148427 ) ) ( not ( = ?auto_148422 ?auto_148427 ) ) ( not ( = ?auto_148423 ?auto_148427 ) ) ( not ( = ?auto_148424 ?auto_148427 ) ) ( ON-TABLE ?auto_148425 ) ( ON ?auto_148428 ?auto_148425 ) ( ON ?auto_148427 ?auto_148428 ) ( not ( = ?auto_148425 ?auto_148428 ) ) ( not ( = ?auto_148425 ?auto_148427 ) ) ( not ( = ?auto_148425 ?auto_148424 ) ) ( not ( = ?auto_148425 ?auto_148423 ) ) ( not ( = ?auto_148428 ?auto_148427 ) ) ( not ( = ?auto_148428 ?auto_148424 ) ) ( not ( = ?auto_148428 ?auto_148423 ) ) ( not ( = ?auto_148420 ?auto_148425 ) ) ( not ( = ?auto_148420 ?auto_148428 ) ) ( not ( = ?auto_148421 ?auto_148425 ) ) ( not ( = ?auto_148421 ?auto_148428 ) ) ( not ( = ?auto_148422 ?auto_148425 ) ) ( not ( = ?auto_148422 ?auto_148428 ) ) ( ON ?auto_148420 ?auto_148426 ) ( not ( = ?auto_148420 ?auto_148426 ) ) ( not ( = ?auto_148421 ?auto_148426 ) ) ( not ( = ?auto_148422 ?auto_148426 ) ) ( not ( = ?auto_148423 ?auto_148426 ) ) ( not ( = ?auto_148424 ?auto_148426 ) ) ( not ( = ?auto_148427 ?auto_148426 ) ) ( not ( = ?auto_148425 ?auto_148426 ) ) ( not ( = ?auto_148428 ?auto_148426 ) ) ( ON ?auto_148421 ?auto_148420 ) ( ON-TABLE ?auto_148426 ) ( ON ?auto_148422 ?auto_148421 ) ( ON ?auto_148423 ?auto_148422 ) ( CLEAR ?auto_148427 ) ( ON ?auto_148424 ?auto_148423 ) ( CLEAR ?auto_148424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148426 ?auto_148420 ?auto_148421 ?auto_148422 ?auto_148423 )
      ( MAKE-5PILE ?auto_148420 ?auto_148421 ?auto_148422 ?auto_148423 ?auto_148424 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148429 - BLOCK
      ?auto_148430 - BLOCK
      ?auto_148431 - BLOCK
      ?auto_148432 - BLOCK
      ?auto_148433 - BLOCK
    )
    :vars
    (
      ?auto_148437 - BLOCK
      ?auto_148436 - BLOCK
      ?auto_148435 - BLOCK
      ?auto_148434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148429 ?auto_148430 ) ) ( not ( = ?auto_148429 ?auto_148431 ) ) ( not ( = ?auto_148429 ?auto_148432 ) ) ( not ( = ?auto_148429 ?auto_148433 ) ) ( not ( = ?auto_148430 ?auto_148431 ) ) ( not ( = ?auto_148430 ?auto_148432 ) ) ( not ( = ?auto_148430 ?auto_148433 ) ) ( not ( = ?auto_148431 ?auto_148432 ) ) ( not ( = ?auto_148431 ?auto_148433 ) ) ( not ( = ?auto_148432 ?auto_148433 ) ) ( not ( = ?auto_148429 ?auto_148437 ) ) ( not ( = ?auto_148430 ?auto_148437 ) ) ( not ( = ?auto_148431 ?auto_148437 ) ) ( not ( = ?auto_148432 ?auto_148437 ) ) ( not ( = ?auto_148433 ?auto_148437 ) ) ( ON-TABLE ?auto_148436 ) ( ON ?auto_148435 ?auto_148436 ) ( not ( = ?auto_148436 ?auto_148435 ) ) ( not ( = ?auto_148436 ?auto_148437 ) ) ( not ( = ?auto_148436 ?auto_148433 ) ) ( not ( = ?auto_148436 ?auto_148432 ) ) ( not ( = ?auto_148435 ?auto_148437 ) ) ( not ( = ?auto_148435 ?auto_148433 ) ) ( not ( = ?auto_148435 ?auto_148432 ) ) ( not ( = ?auto_148429 ?auto_148436 ) ) ( not ( = ?auto_148429 ?auto_148435 ) ) ( not ( = ?auto_148430 ?auto_148436 ) ) ( not ( = ?auto_148430 ?auto_148435 ) ) ( not ( = ?auto_148431 ?auto_148436 ) ) ( not ( = ?auto_148431 ?auto_148435 ) ) ( ON ?auto_148429 ?auto_148434 ) ( not ( = ?auto_148429 ?auto_148434 ) ) ( not ( = ?auto_148430 ?auto_148434 ) ) ( not ( = ?auto_148431 ?auto_148434 ) ) ( not ( = ?auto_148432 ?auto_148434 ) ) ( not ( = ?auto_148433 ?auto_148434 ) ) ( not ( = ?auto_148437 ?auto_148434 ) ) ( not ( = ?auto_148436 ?auto_148434 ) ) ( not ( = ?auto_148435 ?auto_148434 ) ) ( ON ?auto_148430 ?auto_148429 ) ( ON-TABLE ?auto_148434 ) ( ON ?auto_148431 ?auto_148430 ) ( ON ?auto_148432 ?auto_148431 ) ( ON ?auto_148433 ?auto_148432 ) ( CLEAR ?auto_148433 ) ( HOLDING ?auto_148437 ) ( CLEAR ?auto_148435 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148436 ?auto_148435 ?auto_148437 )
      ( MAKE-5PILE ?auto_148429 ?auto_148430 ?auto_148431 ?auto_148432 ?auto_148433 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148438 - BLOCK
      ?auto_148439 - BLOCK
      ?auto_148440 - BLOCK
      ?auto_148441 - BLOCK
      ?auto_148442 - BLOCK
    )
    :vars
    (
      ?auto_148443 - BLOCK
      ?auto_148445 - BLOCK
      ?auto_148444 - BLOCK
      ?auto_148446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148438 ?auto_148439 ) ) ( not ( = ?auto_148438 ?auto_148440 ) ) ( not ( = ?auto_148438 ?auto_148441 ) ) ( not ( = ?auto_148438 ?auto_148442 ) ) ( not ( = ?auto_148439 ?auto_148440 ) ) ( not ( = ?auto_148439 ?auto_148441 ) ) ( not ( = ?auto_148439 ?auto_148442 ) ) ( not ( = ?auto_148440 ?auto_148441 ) ) ( not ( = ?auto_148440 ?auto_148442 ) ) ( not ( = ?auto_148441 ?auto_148442 ) ) ( not ( = ?auto_148438 ?auto_148443 ) ) ( not ( = ?auto_148439 ?auto_148443 ) ) ( not ( = ?auto_148440 ?auto_148443 ) ) ( not ( = ?auto_148441 ?auto_148443 ) ) ( not ( = ?auto_148442 ?auto_148443 ) ) ( ON-TABLE ?auto_148445 ) ( ON ?auto_148444 ?auto_148445 ) ( not ( = ?auto_148445 ?auto_148444 ) ) ( not ( = ?auto_148445 ?auto_148443 ) ) ( not ( = ?auto_148445 ?auto_148442 ) ) ( not ( = ?auto_148445 ?auto_148441 ) ) ( not ( = ?auto_148444 ?auto_148443 ) ) ( not ( = ?auto_148444 ?auto_148442 ) ) ( not ( = ?auto_148444 ?auto_148441 ) ) ( not ( = ?auto_148438 ?auto_148445 ) ) ( not ( = ?auto_148438 ?auto_148444 ) ) ( not ( = ?auto_148439 ?auto_148445 ) ) ( not ( = ?auto_148439 ?auto_148444 ) ) ( not ( = ?auto_148440 ?auto_148445 ) ) ( not ( = ?auto_148440 ?auto_148444 ) ) ( ON ?auto_148438 ?auto_148446 ) ( not ( = ?auto_148438 ?auto_148446 ) ) ( not ( = ?auto_148439 ?auto_148446 ) ) ( not ( = ?auto_148440 ?auto_148446 ) ) ( not ( = ?auto_148441 ?auto_148446 ) ) ( not ( = ?auto_148442 ?auto_148446 ) ) ( not ( = ?auto_148443 ?auto_148446 ) ) ( not ( = ?auto_148445 ?auto_148446 ) ) ( not ( = ?auto_148444 ?auto_148446 ) ) ( ON ?auto_148439 ?auto_148438 ) ( ON-TABLE ?auto_148446 ) ( ON ?auto_148440 ?auto_148439 ) ( ON ?auto_148441 ?auto_148440 ) ( ON ?auto_148442 ?auto_148441 ) ( CLEAR ?auto_148444 ) ( ON ?auto_148443 ?auto_148442 ) ( CLEAR ?auto_148443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148446 ?auto_148438 ?auto_148439 ?auto_148440 ?auto_148441 ?auto_148442 )
      ( MAKE-5PILE ?auto_148438 ?auto_148439 ?auto_148440 ?auto_148441 ?auto_148442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148447 - BLOCK
      ?auto_148448 - BLOCK
      ?auto_148449 - BLOCK
      ?auto_148450 - BLOCK
      ?auto_148451 - BLOCK
    )
    :vars
    (
      ?auto_148454 - BLOCK
      ?auto_148452 - BLOCK
      ?auto_148453 - BLOCK
      ?auto_148455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148447 ?auto_148448 ) ) ( not ( = ?auto_148447 ?auto_148449 ) ) ( not ( = ?auto_148447 ?auto_148450 ) ) ( not ( = ?auto_148447 ?auto_148451 ) ) ( not ( = ?auto_148448 ?auto_148449 ) ) ( not ( = ?auto_148448 ?auto_148450 ) ) ( not ( = ?auto_148448 ?auto_148451 ) ) ( not ( = ?auto_148449 ?auto_148450 ) ) ( not ( = ?auto_148449 ?auto_148451 ) ) ( not ( = ?auto_148450 ?auto_148451 ) ) ( not ( = ?auto_148447 ?auto_148454 ) ) ( not ( = ?auto_148448 ?auto_148454 ) ) ( not ( = ?auto_148449 ?auto_148454 ) ) ( not ( = ?auto_148450 ?auto_148454 ) ) ( not ( = ?auto_148451 ?auto_148454 ) ) ( ON-TABLE ?auto_148452 ) ( not ( = ?auto_148452 ?auto_148453 ) ) ( not ( = ?auto_148452 ?auto_148454 ) ) ( not ( = ?auto_148452 ?auto_148451 ) ) ( not ( = ?auto_148452 ?auto_148450 ) ) ( not ( = ?auto_148453 ?auto_148454 ) ) ( not ( = ?auto_148453 ?auto_148451 ) ) ( not ( = ?auto_148453 ?auto_148450 ) ) ( not ( = ?auto_148447 ?auto_148452 ) ) ( not ( = ?auto_148447 ?auto_148453 ) ) ( not ( = ?auto_148448 ?auto_148452 ) ) ( not ( = ?auto_148448 ?auto_148453 ) ) ( not ( = ?auto_148449 ?auto_148452 ) ) ( not ( = ?auto_148449 ?auto_148453 ) ) ( ON ?auto_148447 ?auto_148455 ) ( not ( = ?auto_148447 ?auto_148455 ) ) ( not ( = ?auto_148448 ?auto_148455 ) ) ( not ( = ?auto_148449 ?auto_148455 ) ) ( not ( = ?auto_148450 ?auto_148455 ) ) ( not ( = ?auto_148451 ?auto_148455 ) ) ( not ( = ?auto_148454 ?auto_148455 ) ) ( not ( = ?auto_148452 ?auto_148455 ) ) ( not ( = ?auto_148453 ?auto_148455 ) ) ( ON ?auto_148448 ?auto_148447 ) ( ON-TABLE ?auto_148455 ) ( ON ?auto_148449 ?auto_148448 ) ( ON ?auto_148450 ?auto_148449 ) ( ON ?auto_148451 ?auto_148450 ) ( ON ?auto_148454 ?auto_148451 ) ( CLEAR ?auto_148454 ) ( HOLDING ?auto_148453 ) ( CLEAR ?auto_148452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148452 ?auto_148453 )
      ( MAKE-5PILE ?auto_148447 ?auto_148448 ?auto_148449 ?auto_148450 ?auto_148451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148456 - BLOCK
      ?auto_148457 - BLOCK
      ?auto_148458 - BLOCK
      ?auto_148459 - BLOCK
      ?auto_148460 - BLOCK
    )
    :vars
    (
      ?auto_148461 - BLOCK
      ?auto_148463 - BLOCK
      ?auto_148462 - BLOCK
      ?auto_148464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148456 ?auto_148457 ) ) ( not ( = ?auto_148456 ?auto_148458 ) ) ( not ( = ?auto_148456 ?auto_148459 ) ) ( not ( = ?auto_148456 ?auto_148460 ) ) ( not ( = ?auto_148457 ?auto_148458 ) ) ( not ( = ?auto_148457 ?auto_148459 ) ) ( not ( = ?auto_148457 ?auto_148460 ) ) ( not ( = ?auto_148458 ?auto_148459 ) ) ( not ( = ?auto_148458 ?auto_148460 ) ) ( not ( = ?auto_148459 ?auto_148460 ) ) ( not ( = ?auto_148456 ?auto_148461 ) ) ( not ( = ?auto_148457 ?auto_148461 ) ) ( not ( = ?auto_148458 ?auto_148461 ) ) ( not ( = ?auto_148459 ?auto_148461 ) ) ( not ( = ?auto_148460 ?auto_148461 ) ) ( ON-TABLE ?auto_148463 ) ( not ( = ?auto_148463 ?auto_148462 ) ) ( not ( = ?auto_148463 ?auto_148461 ) ) ( not ( = ?auto_148463 ?auto_148460 ) ) ( not ( = ?auto_148463 ?auto_148459 ) ) ( not ( = ?auto_148462 ?auto_148461 ) ) ( not ( = ?auto_148462 ?auto_148460 ) ) ( not ( = ?auto_148462 ?auto_148459 ) ) ( not ( = ?auto_148456 ?auto_148463 ) ) ( not ( = ?auto_148456 ?auto_148462 ) ) ( not ( = ?auto_148457 ?auto_148463 ) ) ( not ( = ?auto_148457 ?auto_148462 ) ) ( not ( = ?auto_148458 ?auto_148463 ) ) ( not ( = ?auto_148458 ?auto_148462 ) ) ( ON ?auto_148456 ?auto_148464 ) ( not ( = ?auto_148456 ?auto_148464 ) ) ( not ( = ?auto_148457 ?auto_148464 ) ) ( not ( = ?auto_148458 ?auto_148464 ) ) ( not ( = ?auto_148459 ?auto_148464 ) ) ( not ( = ?auto_148460 ?auto_148464 ) ) ( not ( = ?auto_148461 ?auto_148464 ) ) ( not ( = ?auto_148463 ?auto_148464 ) ) ( not ( = ?auto_148462 ?auto_148464 ) ) ( ON ?auto_148457 ?auto_148456 ) ( ON-TABLE ?auto_148464 ) ( ON ?auto_148458 ?auto_148457 ) ( ON ?auto_148459 ?auto_148458 ) ( ON ?auto_148460 ?auto_148459 ) ( ON ?auto_148461 ?auto_148460 ) ( CLEAR ?auto_148463 ) ( ON ?auto_148462 ?auto_148461 ) ( CLEAR ?auto_148462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148464 ?auto_148456 ?auto_148457 ?auto_148458 ?auto_148459 ?auto_148460 ?auto_148461 )
      ( MAKE-5PILE ?auto_148456 ?auto_148457 ?auto_148458 ?auto_148459 ?auto_148460 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148465 - BLOCK
      ?auto_148466 - BLOCK
      ?auto_148467 - BLOCK
      ?auto_148468 - BLOCK
      ?auto_148469 - BLOCK
    )
    :vars
    (
      ?auto_148472 - BLOCK
      ?auto_148470 - BLOCK
      ?auto_148471 - BLOCK
      ?auto_148473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148465 ?auto_148466 ) ) ( not ( = ?auto_148465 ?auto_148467 ) ) ( not ( = ?auto_148465 ?auto_148468 ) ) ( not ( = ?auto_148465 ?auto_148469 ) ) ( not ( = ?auto_148466 ?auto_148467 ) ) ( not ( = ?auto_148466 ?auto_148468 ) ) ( not ( = ?auto_148466 ?auto_148469 ) ) ( not ( = ?auto_148467 ?auto_148468 ) ) ( not ( = ?auto_148467 ?auto_148469 ) ) ( not ( = ?auto_148468 ?auto_148469 ) ) ( not ( = ?auto_148465 ?auto_148472 ) ) ( not ( = ?auto_148466 ?auto_148472 ) ) ( not ( = ?auto_148467 ?auto_148472 ) ) ( not ( = ?auto_148468 ?auto_148472 ) ) ( not ( = ?auto_148469 ?auto_148472 ) ) ( not ( = ?auto_148470 ?auto_148471 ) ) ( not ( = ?auto_148470 ?auto_148472 ) ) ( not ( = ?auto_148470 ?auto_148469 ) ) ( not ( = ?auto_148470 ?auto_148468 ) ) ( not ( = ?auto_148471 ?auto_148472 ) ) ( not ( = ?auto_148471 ?auto_148469 ) ) ( not ( = ?auto_148471 ?auto_148468 ) ) ( not ( = ?auto_148465 ?auto_148470 ) ) ( not ( = ?auto_148465 ?auto_148471 ) ) ( not ( = ?auto_148466 ?auto_148470 ) ) ( not ( = ?auto_148466 ?auto_148471 ) ) ( not ( = ?auto_148467 ?auto_148470 ) ) ( not ( = ?auto_148467 ?auto_148471 ) ) ( ON ?auto_148465 ?auto_148473 ) ( not ( = ?auto_148465 ?auto_148473 ) ) ( not ( = ?auto_148466 ?auto_148473 ) ) ( not ( = ?auto_148467 ?auto_148473 ) ) ( not ( = ?auto_148468 ?auto_148473 ) ) ( not ( = ?auto_148469 ?auto_148473 ) ) ( not ( = ?auto_148472 ?auto_148473 ) ) ( not ( = ?auto_148470 ?auto_148473 ) ) ( not ( = ?auto_148471 ?auto_148473 ) ) ( ON ?auto_148466 ?auto_148465 ) ( ON-TABLE ?auto_148473 ) ( ON ?auto_148467 ?auto_148466 ) ( ON ?auto_148468 ?auto_148467 ) ( ON ?auto_148469 ?auto_148468 ) ( ON ?auto_148472 ?auto_148469 ) ( ON ?auto_148471 ?auto_148472 ) ( CLEAR ?auto_148471 ) ( HOLDING ?auto_148470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148470 )
      ( MAKE-5PILE ?auto_148465 ?auto_148466 ?auto_148467 ?auto_148468 ?auto_148469 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148474 - BLOCK
      ?auto_148475 - BLOCK
      ?auto_148476 - BLOCK
      ?auto_148477 - BLOCK
      ?auto_148478 - BLOCK
    )
    :vars
    (
      ?auto_148480 - BLOCK
      ?auto_148482 - BLOCK
      ?auto_148481 - BLOCK
      ?auto_148479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148474 ?auto_148475 ) ) ( not ( = ?auto_148474 ?auto_148476 ) ) ( not ( = ?auto_148474 ?auto_148477 ) ) ( not ( = ?auto_148474 ?auto_148478 ) ) ( not ( = ?auto_148475 ?auto_148476 ) ) ( not ( = ?auto_148475 ?auto_148477 ) ) ( not ( = ?auto_148475 ?auto_148478 ) ) ( not ( = ?auto_148476 ?auto_148477 ) ) ( not ( = ?auto_148476 ?auto_148478 ) ) ( not ( = ?auto_148477 ?auto_148478 ) ) ( not ( = ?auto_148474 ?auto_148480 ) ) ( not ( = ?auto_148475 ?auto_148480 ) ) ( not ( = ?auto_148476 ?auto_148480 ) ) ( not ( = ?auto_148477 ?auto_148480 ) ) ( not ( = ?auto_148478 ?auto_148480 ) ) ( not ( = ?auto_148482 ?auto_148481 ) ) ( not ( = ?auto_148482 ?auto_148480 ) ) ( not ( = ?auto_148482 ?auto_148478 ) ) ( not ( = ?auto_148482 ?auto_148477 ) ) ( not ( = ?auto_148481 ?auto_148480 ) ) ( not ( = ?auto_148481 ?auto_148478 ) ) ( not ( = ?auto_148481 ?auto_148477 ) ) ( not ( = ?auto_148474 ?auto_148482 ) ) ( not ( = ?auto_148474 ?auto_148481 ) ) ( not ( = ?auto_148475 ?auto_148482 ) ) ( not ( = ?auto_148475 ?auto_148481 ) ) ( not ( = ?auto_148476 ?auto_148482 ) ) ( not ( = ?auto_148476 ?auto_148481 ) ) ( ON ?auto_148474 ?auto_148479 ) ( not ( = ?auto_148474 ?auto_148479 ) ) ( not ( = ?auto_148475 ?auto_148479 ) ) ( not ( = ?auto_148476 ?auto_148479 ) ) ( not ( = ?auto_148477 ?auto_148479 ) ) ( not ( = ?auto_148478 ?auto_148479 ) ) ( not ( = ?auto_148480 ?auto_148479 ) ) ( not ( = ?auto_148482 ?auto_148479 ) ) ( not ( = ?auto_148481 ?auto_148479 ) ) ( ON ?auto_148475 ?auto_148474 ) ( ON-TABLE ?auto_148479 ) ( ON ?auto_148476 ?auto_148475 ) ( ON ?auto_148477 ?auto_148476 ) ( ON ?auto_148478 ?auto_148477 ) ( ON ?auto_148480 ?auto_148478 ) ( ON ?auto_148481 ?auto_148480 ) ( ON ?auto_148482 ?auto_148481 ) ( CLEAR ?auto_148482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148479 ?auto_148474 ?auto_148475 ?auto_148476 ?auto_148477 ?auto_148478 ?auto_148480 ?auto_148481 )
      ( MAKE-5PILE ?auto_148474 ?auto_148475 ?auto_148476 ?auto_148477 ?auto_148478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148485 - BLOCK
      ?auto_148486 - BLOCK
    )
    :vars
    (
      ?auto_148487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148487 ?auto_148486 ) ( CLEAR ?auto_148487 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148485 ) ( ON ?auto_148486 ?auto_148485 ) ( not ( = ?auto_148485 ?auto_148486 ) ) ( not ( = ?auto_148485 ?auto_148487 ) ) ( not ( = ?auto_148486 ?auto_148487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148487 ?auto_148486 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148488 - BLOCK
      ?auto_148489 - BLOCK
    )
    :vars
    (
      ?auto_148490 - BLOCK
      ?auto_148491 - BLOCK
      ?auto_148492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148490 ?auto_148489 ) ( CLEAR ?auto_148490 ) ( ON-TABLE ?auto_148488 ) ( ON ?auto_148489 ?auto_148488 ) ( not ( = ?auto_148488 ?auto_148489 ) ) ( not ( = ?auto_148488 ?auto_148490 ) ) ( not ( = ?auto_148489 ?auto_148490 ) ) ( HOLDING ?auto_148491 ) ( CLEAR ?auto_148492 ) ( not ( = ?auto_148488 ?auto_148491 ) ) ( not ( = ?auto_148488 ?auto_148492 ) ) ( not ( = ?auto_148489 ?auto_148491 ) ) ( not ( = ?auto_148489 ?auto_148492 ) ) ( not ( = ?auto_148490 ?auto_148491 ) ) ( not ( = ?auto_148490 ?auto_148492 ) ) ( not ( = ?auto_148491 ?auto_148492 ) ) )
    :subtasks
    ( ( !STACK ?auto_148491 ?auto_148492 )
      ( MAKE-2PILE ?auto_148488 ?auto_148489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148493 - BLOCK
      ?auto_148494 - BLOCK
    )
    :vars
    (
      ?auto_148495 - BLOCK
      ?auto_148497 - BLOCK
      ?auto_148496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148495 ?auto_148494 ) ( ON-TABLE ?auto_148493 ) ( ON ?auto_148494 ?auto_148493 ) ( not ( = ?auto_148493 ?auto_148494 ) ) ( not ( = ?auto_148493 ?auto_148495 ) ) ( not ( = ?auto_148494 ?auto_148495 ) ) ( CLEAR ?auto_148497 ) ( not ( = ?auto_148493 ?auto_148496 ) ) ( not ( = ?auto_148493 ?auto_148497 ) ) ( not ( = ?auto_148494 ?auto_148496 ) ) ( not ( = ?auto_148494 ?auto_148497 ) ) ( not ( = ?auto_148495 ?auto_148496 ) ) ( not ( = ?auto_148495 ?auto_148497 ) ) ( not ( = ?auto_148496 ?auto_148497 ) ) ( ON ?auto_148496 ?auto_148495 ) ( CLEAR ?auto_148496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148493 ?auto_148494 ?auto_148495 )
      ( MAKE-2PILE ?auto_148493 ?auto_148494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148498 - BLOCK
      ?auto_148499 - BLOCK
    )
    :vars
    (
      ?auto_148502 - BLOCK
      ?auto_148500 - BLOCK
      ?auto_148501 - BLOCK
      ?auto_148504 - BLOCK
      ?auto_148505 - BLOCK
      ?auto_148503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148502 ?auto_148499 ) ( ON-TABLE ?auto_148498 ) ( ON ?auto_148499 ?auto_148498 ) ( not ( = ?auto_148498 ?auto_148499 ) ) ( not ( = ?auto_148498 ?auto_148502 ) ) ( not ( = ?auto_148499 ?auto_148502 ) ) ( not ( = ?auto_148498 ?auto_148500 ) ) ( not ( = ?auto_148498 ?auto_148501 ) ) ( not ( = ?auto_148499 ?auto_148500 ) ) ( not ( = ?auto_148499 ?auto_148501 ) ) ( not ( = ?auto_148502 ?auto_148500 ) ) ( not ( = ?auto_148502 ?auto_148501 ) ) ( not ( = ?auto_148500 ?auto_148501 ) ) ( ON ?auto_148500 ?auto_148502 ) ( CLEAR ?auto_148500 ) ( HOLDING ?auto_148501 ) ( CLEAR ?auto_148504 ) ( ON-TABLE ?auto_148505 ) ( ON ?auto_148503 ?auto_148505 ) ( ON ?auto_148504 ?auto_148503 ) ( not ( = ?auto_148505 ?auto_148503 ) ) ( not ( = ?auto_148505 ?auto_148504 ) ) ( not ( = ?auto_148505 ?auto_148501 ) ) ( not ( = ?auto_148503 ?auto_148504 ) ) ( not ( = ?auto_148503 ?auto_148501 ) ) ( not ( = ?auto_148504 ?auto_148501 ) ) ( not ( = ?auto_148498 ?auto_148504 ) ) ( not ( = ?auto_148498 ?auto_148505 ) ) ( not ( = ?auto_148498 ?auto_148503 ) ) ( not ( = ?auto_148499 ?auto_148504 ) ) ( not ( = ?auto_148499 ?auto_148505 ) ) ( not ( = ?auto_148499 ?auto_148503 ) ) ( not ( = ?auto_148502 ?auto_148504 ) ) ( not ( = ?auto_148502 ?auto_148505 ) ) ( not ( = ?auto_148502 ?auto_148503 ) ) ( not ( = ?auto_148500 ?auto_148504 ) ) ( not ( = ?auto_148500 ?auto_148505 ) ) ( not ( = ?auto_148500 ?auto_148503 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148505 ?auto_148503 ?auto_148504 ?auto_148501 )
      ( MAKE-2PILE ?auto_148498 ?auto_148499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148506 - BLOCK
      ?auto_148507 - BLOCK
    )
    :vars
    (
      ?auto_148509 - BLOCK
      ?auto_148508 - BLOCK
      ?auto_148512 - BLOCK
      ?auto_148510 - BLOCK
      ?auto_148513 - BLOCK
      ?auto_148511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148509 ?auto_148507 ) ( ON-TABLE ?auto_148506 ) ( ON ?auto_148507 ?auto_148506 ) ( not ( = ?auto_148506 ?auto_148507 ) ) ( not ( = ?auto_148506 ?auto_148509 ) ) ( not ( = ?auto_148507 ?auto_148509 ) ) ( not ( = ?auto_148506 ?auto_148508 ) ) ( not ( = ?auto_148506 ?auto_148512 ) ) ( not ( = ?auto_148507 ?auto_148508 ) ) ( not ( = ?auto_148507 ?auto_148512 ) ) ( not ( = ?auto_148509 ?auto_148508 ) ) ( not ( = ?auto_148509 ?auto_148512 ) ) ( not ( = ?auto_148508 ?auto_148512 ) ) ( ON ?auto_148508 ?auto_148509 ) ( CLEAR ?auto_148510 ) ( ON-TABLE ?auto_148513 ) ( ON ?auto_148511 ?auto_148513 ) ( ON ?auto_148510 ?auto_148511 ) ( not ( = ?auto_148513 ?auto_148511 ) ) ( not ( = ?auto_148513 ?auto_148510 ) ) ( not ( = ?auto_148513 ?auto_148512 ) ) ( not ( = ?auto_148511 ?auto_148510 ) ) ( not ( = ?auto_148511 ?auto_148512 ) ) ( not ( = ?auto_148510 ?auto_148512 ) ) ( not ( = ?auto_148506 ?auto_148510 ) ) ( not ( = ?auto_148506 ?auto_148513 ) ) ( not ( = ?auto_148506 ?auto_148511 ) ) ( not ( = ?auto_148507 ?auto_148510 ) ) ( not ( = ?auto_148507 ?auto_148513 ) ) ( not ( = ?auto_148507 ?auto_148511 ) ) ( not ( = ?auto_148509 ?auto_148510 ) ) ( not ( = ?auto_148509 ?auto_148513 ) ) ( not ( = ?auto_148509 ?auto_148511 ) ) ( not ( = ?auto_148508 ?auto_148510 ) ) ( not ( = ?auto_148508 ?auto_148513 ) ) ( not ( = ?auto_148508 ?auto_148511 ) ) ( ON ?auto_148512 ?auto_148508 ) ( CLEAR ?auto_148512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148506 ?auto_148507 ?auto_148509 ?auto_148508 )
      ( MAKE-2PILE ?auto_148506 ?auto_148507 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148514 - BLOCK
      ?auto_148515 - BLOCK
    )
    :vars
    (
      ?auto_148517 - BLOCK
      ?auto_148520 - BLOCK
      ?auto_148518 - BLOCK
      ?auto_148521 - BLOCK
      ?auto_148519 - BLOCK
      ?auto_148516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148517 ?auto_148515 ) ( ON-TABLE ?auto_148514 ) ( ON ?auto_148515 ?auto_148514 ) ( not ( = ?auto_148514 ?auto_148515 ) ) ( not ( = ?auto_148514 ?auto_148517 ) ) ( not ( = ?auto_148515 ?auto_148517 ) ) ( not ( = ?auto_148514 ?auto_148520 ) ) ( not ( = ?auto_148514 ?auto_148518 ) ) ( not ( = ?auto_148515 ?auto_148520 ) ) ( not ( = ?auto_148515 ?auto_148518 ) ) ( not ( = ?auto_148517 ?auto_148520 ) ) ( not ( = ?auto_148517 ?auto_148518 ) ) ( not ( = ?auto_148520 ?auto_148518 ) ) ( ON ?auto_148520 ?auto_148517 ) ( ON-TABLE ?auto_148521 ) ( ON ?auto_148519 ?auto_148521 ) ( not ( = ?auto_148521 ?auto_148519 ) ) ( not ( = ?auto_148521 ?auto_148516 ) ) ( not ( = ?auto_148521 ?auto_148518 ) ) ( not ( = ?auto_148519 ?auto_148516 ) ) ( not ( = ?auto_148519 ?auto_148518 ) ) ( not ( = ?auto_148516 ?auto_148518 ) ) ( not ( = ?auto_148514 ?auto_148516 ) ) ( not ( = ?auto_148514 ?auto_148521 ) ) ( not ( = ?auto_148514 ?auto_148519 ) ) ( not ( = ?auto_148515 ?auto_148516 ) ) ( not ( = ?auto_148515 ?auto_148521 ) ) ( not ( = ?auto_148515 ?auto_148519 ) ) ( not ( = ?auto_148517 ?auto_148516 ) ) ( not ( = ?auto_148517 ?auto_148521 ) ) ( not ( = ?auto_148517 ?auto_148519 ) ) ( not ( = ?auto_148520 ?auto_148516 ) ) ( not ( = ?auto_148520 ?auto_148521 ) ) ( not ( = ?auto_148520 ?auto_148519 ) ) ( ON ?auto_148518 ?auto_148520 ) ( CLEAR ?auto_148518 ) ( HOLDING ?auto_148516 ) ( CLEAR ?auto_148519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148521 ?auto_148519 ?auto_148516 )
      ( MAKE-2PILE ?auto_148514 ?auto_148515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148522 - BLOCK
      ?auto_148523 - BLOCK
    )
    :vars
    (
      ?auto_148527 - BLOCK
      ?auto_148529 - BLOCK
      ?auto_148528 - BLOCK
      ?auto_148525 - BLOCK
      ?auto_148524 - BLOCK
      ?auto_148526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148527 ?auto_148523 ) ( ON-TABLE ?auto_148522 ) ( ON ?auto_148523 ?auto_148522 ) ( not ( = ?auto_148522 ?auto_148523 ) ) ( not ( = ?auto_148522 ?auto_148527 ) ) ( not ( = ?auto_148523 ?auto_148527 ) ) ( not ( = ?auto_148522 ?auto_148529 ) ) ( not ( = ?auto_148522 ?auto_148528 ) ) ( not ( = ?auto_148523 ?auto_148529 ) ) ( not ( = ?auto_148523 ?auto_148528 ) ) ( not ( = ?auto_148527 ?auto_148529 ) ) ( not ( = ?auto_148527 ?auto_148528 ) ) ( not ( = ?auto_148529 ?auto_148528 ) ) ( ON ?auto_148529 ?auto_148527 ) ( ON-TABLE ?auto_148525 ) ( ON ?auto_148524 ?auto_148525 ) ( not ( = ?auto_148525 ?auto_148524 ) ) ( not ( = ?auto_148525 ?auto_148526 ) ) ( not ( = ?auto_148525 ?auto_148528 ) ) ( not ( = ?auto_148524 ?auto_148526 ) ) ( not ( = ?auto_148524 ?auto_148528 ) ) ( not ( = ?auto_148526 ?auto_148528 ) ) ( not ( = ?auto_148522 ?auto_148526 ) ) ( not ( = ?auto_148522 ?auto_148525 ) ) ( not ( = ?auto_148522 ?auto_148524 ) ) ( not ( = ?auto_148523 ?auto_148526 ) ) ( not ( = ?auto_148523 ?auto_148525 ) ) ( not ( = ?auto_148523 ?auto_148524 ) ) ( not ( = ?auto_148527 ?auto_148526 ) ) ( not ( = ?auto_148527 ?auto_148525 ) ) ( not ( = ?auto_148527 ?auto_148524 ) ) ( not ( = ?auto_148529 ?auto_148526 ) ) ( not ( = ?auto_148529 ?auto_148525 ) ) ( not ( = ?auto_148529 ?auto_148524 ) ) ( ON ?auto_148528 ?auto_148529 ) ( CLEAR ?auto_148524 ) ( ON ?auto_148526 ?auto_148528 ) ( CLEAR ?auto_148526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148522 ?auto_148523 ?auto_148527 ?auto_148529 ?auto_148528 )
      ( MAKE-2PILE ?auto_148522 ?auto_148523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148530 - BLOCK
      ?auto_148531 - BLOCK
    )
    :vars
    (
      ?auto_148532 - BLOCK
      ?auto_148534 - BLOCK
      ?auto_148535 - BLOCK
      ?auto_148536 - BLOCK
      ?auto_148533 - BLOCK
      ?auto_148537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148532 ?auto_148531 ) ( ON-TABLE ?auto_148530 ) ( ON ?auto_148531 ?auto_148530 ) ( not ( = ?auto_148530 ?auto_148531 ) ) ( not ( = ?auto_148530 ?auto_148532 ) ) ( not ( = ?auto_148531 ?auto_148532 ) ) ( not ( = ?auto_148530 ?auto_148534 ) ) ( not ( = ?auto_148530 ?auto_148535 ) ) ( not ( = ?auto_148531 ?auto_148534 ) ) ( not ( = ?auto_148531 ?auto_148535 ) ) ( not ( = ?auto_148532 ?auto_148534 ) ) ( not ( = ?auto_148532 ?auto_148535 ) ) ( not ( = ?auto_148534 ?auto_148535 ) ) ( ON ?auto_148534 ?auto_148532 ) ( ON-TABLE ?auto_148536 ) ( not ( = ?auto_148536 ?auto_148533 ) ) ( not ( = ?auto_148536 ?auto_148537 ) ) ( not ( = ?auto_148536 ?auto_148535 ) ) ( not ( = ?auto_148533 ?auto_148537 ) ) ( not ( = ?auto_148533 ?auto_148535 ) ) ( not ( = ?auto_148537 ?auto_148535 ) ) ( not ( = ?auto_148530 ?auto_148537 ) ) ( not ( = ?auto_148530 ?auto_148536 ) ) ( not ( = ?auto_148530 ?auto_148533 ) ) ( not ( = ?auto_148531 ?auto_148537 ) ) ( not ( = ?auto_148531 ?auto_148536 ) ) ( not ( = ?auto_148531 ?auto_148533 ) ) ( not ( = ?auto_148532 ?auto_148537 ) ) ( not ( = ?auto_148532 ?auto_148536 ) ) ( not ( = ?auto_148532 ?auto_148533 ) ) ( not ( = ?auto_148534 ?auto_148537 ) ) ( not ( = ?auto_148534 ?auto_148536 ) ) ( not ( = ?auto_148534 ?auto_148533 ) ) ( ON ?auto_148535 ?auto_148534 ) ( ON ?auto_148537 ?auto_148535 ) ( CLEAR ?auto_148537 ) ( HOLDING ?auto_148533 ) ( CLEAR ?auto_148536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148536 ?auto_148533 )
      ( MAKE-2PILE ?auto_148530 ?auto_148531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148538 - BLOCK
      ?auto_148539 - BLOCK
    )
    :vars
    (
      ?auto_148542 - BLOCK
      ?auto_148545 - BLOCK
      ?auto_148544 - BLOCK
      ?auto_148543 - BLOCK
      ?auto_148541 - BLOCK
      ?auto_148540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148542 ?auto_148539 ) ( ON-TABLE ?auto_148538 ) ( ON ?auto_148539 ?auto_148538 ) ( not ( = ?auto_148538 ?auto_148539 ) ) ( not ( = ?auto_148538 ?auto_148542 ) ) ( not ( = ?auto_148539 ?auto_148542 ) ) ( not ( = ?auto_148538 ?auto_148545 ) ) ( not ( = ?auto_148538 ?auto_148544 ) ) ( not ( = ?auto_148539 ?auto_148545 ) ) ( not ( = ?auto_148539 ?auto_148544 ) ) ( not ( = ?auto_148542 ?auto_148545 ) ) ( not ( = ?auto_148542 ?auto_148544 ) ) ( not ( = ?auto_148545 ?auto_148544 ) ) ( ON ?auto_148545 ?auto_148542 ) ( ON-TABLE ?auto_148543 ) ( not ( = ?auto_148543 ?auto_148541 ) ) ( not ( = ?auto_148543 ?auto_148540 ) ) ( not ( = ?auto_148543 ?auto_148544 ) ) ( not ( = ?auto_148541 ?auto_148540 ) ) ( not ( = ?auto_148541 ?auto_148544 ) ) ( not ( = ?auto_148540 ?auto_148544 ) ) ( not ( = ?auto_148538 ?auto_148540 ) ) ( not ( = ?auto_148538 ?auto_148543 ) ) ( not ( = ?auto_148538 ?auto_148541 ) ) ( not ( = ?auto_148539 ?auto_148540 ) ) ( not ( = ?auto_148539 ?auto_148543 ) ) ( not ( = ?auto_148539 ?auto_148541 ) ) ( not ( = ?auto_148542 ?auto_148540 ) ) ( not ( = ?auto_148542 ?auto_148543 ) ) ( not ( = ?auto_148542 ?auto_148541 ) ) ( not ( = ?auto_148545 ?auto_148540 ) ) ( not ( = ?auto_148545 ?auto_148543 ) ) ( not ( = ?auto_148545 ?auto_148541 ) ) ( ON ?auto_148544 ?auto_148545 ) ( ON ?auto_148540 ?auto_148544 ) ( CLEAR ?auto_148543 ) ( ON ?auto_148541 ?auto_148540 ) ( CLEAR ?auto_148541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148538 ?auto_148539 ?auto_148542 ?auto_148545 ?auto_148544 ?auto_148540 )
      ( MAKE-2PILE ?auto_148538 ?auto_148539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148546 - BLOCK
      ?auto_148547 - BLOCK
    )
    :vars
    (
      ?auto_148548 - BLOCK
      ?auto_148550 - BLOCK
      ?auto_148549 - BLOCK
      ?auto_148553 - BLOCK
      ?auto_148551 - BLOCK
      ?auto_148552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148548 ?auto_148547 ) ( ON-TABLE ?auto_148546 ) ( ON ?auto_148547 ?auto_148546 ) ( not ( = ?auto_148546 ?auto_148547 ) ) ( not ( = ?auto_148546 ?auto_148548 ) ) ( not ( = ?auto_148547 ?auto_148548 ) ) ( not ( = ?auto_148546 ?auto_148550 ) ) ( not ( = ?auto_148546 ?auto_148549 ) ) ( not ( = ?auto_148547 ?auto_148550 ) ) ( not ( = ?auto_148547 ?auto_148549 ) ) ( not ( = ?auto_148548 ?auto_148550 ) ) ( not ( = ?auto_148548 ?auto_148549 ) ) ( not ( = ?auto_148550 ?auto_148549 ) ) ( ON ?auto_148550 ?auto_148548 ) ( not ( = ?auto_148553 ?auto_148551 ) ) ( not ( = ?auto_148553 ?auto_148552 ) ) ( not ( = ?auto_148553 ?auto_148549 ) ) ( not ( = ?auto_148551 ?auto_148552 ) ) ( not ( = ?auto_148551 ?auto_148549 ) ) ( not ( = ?auto_148552 ?auto_148549 ) ) ( not ( = ?auto_148546 ?auto_148552 ) ) ( not ( = ?auto_148546 ?auto_148553 ) ) ( not ( = ?auto_148546 ?auto_148551 ) ) ( not ( = ?auto_148547 ?auto_148552 ) ) ( not ( = ?auto_148547 ?auto_148553 ) ) ( not ( = ?auto_148547 ?auto_148551 ) ) ( not ( = ?auto_148548 ?auto_148552 ) ) ( not ( = ?auto_148548 ?auto_148553 ) ) ( not ( = ?auto_148548 ?auto_148551 ) ) ( not ( = ?auto_148550 ?auto_148552 ) ) ( not ( = ?auto_148550 ?auto_148553 ) ) ( not ( = ?auto_148550 ?auto_148551 ) ) ( ON ?auto_148549 ?auto_148550 ) ( ON ?auto_148552 ?auto_148549 ) ( ON ?auto_148551 ?auto_148552 ) ( CLEAR ?auto_148551 ) ( HOLDING ?auto_148553 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148553 )
      ( MAKE-2PILE ?auto_148546 ?auto_148547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148554 - BLOCK
      ?auto_148555 - BLOCK
    )
    :vars
    (
      ?auto_148559 - BLOCK
      ?auto_148557 - BLOCK
      ?auto_148558 - BLOCK
      ?auto_148561 - BLOCK
      ?auto_148556 - BLOCK
      ?auto_148560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148559 ?auto_148555 ) ( ON-TABLE ?auto_148554 ) ( ON ?auto_148555 ?auto_148554 ) ( not ( = ?auto_148554 ?auto_148555 ) ) ( not ( = ?auto_148554 ?auto_148559 ) ) ( not ( = ?auto_148555 ?auto_148559 ) ) ( not ( = ?auto_148554 ?auto_148557 ) ) ( not ( = ?auto_148554 ?auto_148558 ) ) ( not ( = ?auto_148555 ?auto_148557 ) ) ( not ( = ?auto_148555 ?auto_148558 ) ) ( not ( = ?auto_148559 ?auto_148557 ) ) ( not ( = ?auto_148559 ?auto_148558 ) ) ( not ( = ?auto_148557 ?auto_148558 ) ) ( ON ?auto_148557 ?auto_148559 ) ( not ( = ?auto_148561 ?auto_148556 ) ) ( not ( = ?auto_148561 ?auto_148560 ) ) ( not ( = ?auto_148561 ?auto_148558 ) ) ( not ( = ?auto_148556 ?auto_148560 ) ) ( not ( = ?auto_148556 ?auto_148558 ) ) ( not ( = ?auto_148560 ?auto_148558 ) ) ( not ( = ?auto_148554 ?auto_148560 ) ) ( not ( = ?auto_148554 ?auto_148561 ) ) ( not ( = ?auto_148554 ?auto_148556 ) ) ( not ( = ?auto_148555 ?auto_148560 ) ) ( not ( = ?auto_148555 ?auto_148561 ) ) ( not ( = ?auto_148555 ?auto_148556 ) ) ( not ( = ?auto_148559 ?auto_148560 ) ) ( not ( = ?auto_148559 ?auto_148561 ) ) ( not ( = ?auto_148559 ?auto_148556 ) ) ( not ( = ?auto_148557 ?auto_148560 ) ) ( not ( = ?auto_148557 ?auto_148561 ) ) ( not ( = ?auto_148557 ?auto_148556 ) ) ( ON ?auto_148558 ?auto_148557 ) ( ON ?auto_148560 ?auto_148558 ) ( ON ?auto_148556 ?auto_148560 ) ( ON ?auto_148561 ?auto_148556 ) ( CLEAR ?auto_148561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148554 ?auto_148555 ?auto_148559 ?auto_148557 ?auto_148558 ?auto_148560 ?auto_148556 )
      ( MAKE-2PILE ?auto_148554 ?auto_148555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148562 - BLOCK
      ?auto_148563 - BLOCK
    )
    :vars
    (
      ?auto_148568 - BLOCK
      ?auto_148567 - BLOCK
      ?auto_148564 - BLOCK
      ?auto_148569 - BLOCK
      ?auto_148566 - BLOCK
      ?auto_148565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148568 ?auto_148563 ) ( ON-TABLE ?auto_148562 ) ( ON ?auto_148563 ?auto_148562 ) ( not ( = ?auto_148562 ?auto_148563 ) ) ( not ( = ?auto_148562 ?auto_148568 ) ) ( not ( = ?auto_148563 ?auto_148568 ) ) ( not ( = ?auto_148562 ?auto_148567 ) ) ( not ( = ?auto_148562 ?auto_148564 ) ) ( not ( = ?auto_148563 ?auto_148567 ) ) ( not ( = ?auto_148563 ?auto_148564 ) ) ( not ( = ?auto_148568 ?auto_148567 ) ) ( not ( = ?auto_148568 ?auto_148564 ) ) ( not ( = ?auto_148567 ?auto_148564 ) ) ( ON ?auto_148567 ?auto_148568 ) ( not ( = ?auto_148569 ?auto_148566 ) ) ( not ( = ?auto_148569 ?auto_148565 ) ) ( not ( = ?auto_148569 ?auto_148564 ) ) ( not ( = ?auto_148566 ?auto_148565 ) ) ( not ( = ?auto_148566 ?auto_148564 ) ) ( not ( = ?auto_148565 ?auto_148564 ) ) ( not ( = ?auto_148562 ?auto_148565 ) ) ( not ( = ?auto_148562 ?auto_148569 ) ) ( not ( = ?auto_148562 ?auto_148566 ) ) ( not ( = ?auto_148563 ?auto_148565 ) ) ( not ( = ?auto_148563 ?auto_148569 ) ) ( not ( = ?auto_148563 ?auto_148566 ) ) ( not ( = ?auto_148568 ?auto_148565 ) ) ( not ( = ?auto_148568 ?auto_148569 ) ) ( not ( = ?auto_148568 ?auto_148566 ) ) ( not ( = ?auto_148567 ?auto_148565 ) ) ( not ( = ?auto_148567 ?auto_148569 ) ) ( not ( = ?auto_148567 ?auto_148566 ) ) ( ON ?auto_148564 ?auto_148567 ) ( ON ?auto_148565 ?auto_148564 ) ( ON ?auto_148566 ?auto_148565 ) ( HOLDING ?auto_148569 ) ( CLEAR ?auto_148566 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148562 ?auto_148563 ?auto_148568 ?auto_148567 ?auto_148564 ?auto_148565 ?auto_148566 ?auto_148569 )
      ( MAKE-2PILE ?auto_148562 ?auto_148563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148570 - BLOCK
      ?auto_148571 - BLOCK
    )
    :vars
    (
      ?auto_148572 - BLOCK
      ?auto_148576 - BLOCK
      ?auto_148573 - BLOCK
      ?auto_148574 - BLOCK
      ?auto_148575 - BLOCK
      ?auto_148577 - BLOCK
      ?auto_148578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148572 ?auto_148571 ) ( ON-TABLE ?auto_148570 ) ( ON ?auto_148571 ?auto_148570 ) ( not ( = ?auto_148570 ?auto_148571 ) ) ( not ( = ?auto_148570 ?auto_148572 ) ) ( not ( = ?auto_148571 ?auto_148572 ) ) ( not ( = ?auto_148570 ?auto_148576 ) ) ( not ( = ?auto_148570 ?auto_148573 ) ) ( not ( = ?auto_148571 ?auto_148576 ) ) ( not ( = ?auto_148571 ?auto_148573 ) ) ( not ( = ?auto_148572 ?auto_148576 ) ) ( not ( = ?auto_148572 ?auto_148573 ) ) ( not ( = ?auto_148576 ?auto_148573 ) ) ( ON ?auto_148576 ?auto_148572 ) ( not ( = ?auto_148574 ?auto_148575 ) ) ( not ( = ?auto_148574 ?auto_148577 ) ) ( not ( = ?auto_148574 ?auto_148573 ) ) ( not ( = ?auto_148575 ?auto_148577 ) ) ( not ( = ?auto_148575 ?auto_148573 ) ) ( not ( = ?auto_148577 ?auto_148573 ) ) ( not ( = ?auto_148570 ?auto_148577 ) ) ( not ( = ?auto_148570 ?auto_148574 ) ) ( not ( = ?auto_148570 ?auto_148575 ) ) ( not ( = ?auto_148571 ?auto_148577 ) ) ( not ( = ?auto_148571 ?auto_148574 ) ) ( not ( = ?auto_148571 ?auto_148575 ) ) ( not ( = ?auto_148572 ?auto_148577 ) ) ( not ( = ?auto_148572 ?auto_148574 ) ) ( not ( = ?auto_148572 ?auto_148575 ) ) ( not ( = ?auto_148576 ?auto_148577 ) ) ( not ( = ?auto_148576 ?auto_148574 ) ) ( not ( = ?auto_148576 ?auto_148575 ) ) ( ON ?auto_148573 ?auto_148576 ) ( ON ?auto_148577 ?auto_148573 ) ( ON ?auto_148575 ?auto_148577 ) ( CLEAR ?auto_148575 ) ( ON ?auto_148574 ?auto_148578 ) ( CLEAR ?auto_148574 ) ( HAND-EMPTY ) ( not ( = ?auto_148570 ?auto_148578 ) ) ( not ( = ?auto_148571 ?auto_148578 ) ) ( not ( = ?auto_148572 ?auto_148578 ) ) ( not ( = ?auto_148576 ?auto_148578 ) ) ( not ( = ?auto_148573 ?auto_148578 ) ) ( not ( = ?auto_148574 ?auto_148578 ) ) ( not ( = ?auto_148575 ?auto_148578 ) ) ( not ( = ?auto_148577 ?auto_148578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148574 ?auto_148578 )
      ( MAKE-2PILE ?auto_148570 ?auto_148571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148579 - BLOCK
      ?auto_148580 - BLOCK
    )
    :vars
    (
      ?auto_148582 - BLOCK
      ?auto_148585 - BLOCK
      ?auto_148581 - BLOCK
      ?auto_148583 - BLOCK
      ?auto_148587 - BLOCK
      ?auto_148584 - BLOCK
      ?auto_148586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148582 ?auto_148580 ) ( ON-TABLE ?auto_148579 ) ( ON ?auto_148580 ?auto_148579 ) ( not ( = ?auto_148579 ?auto_148580 ) ) ( not ( = ?auto_148579 ?auto_148582 ) ) ( not ( = ?auto_148580 ?auto_148582 ) ) ( not ( = ?auto_148579 ?auto_148585 ) ) ( not ( = ?auto_148579 ?auto_148581 ) ) ( not ( = ?auto_148580 ?auto_148585 ) ) ( not ( = ?auto_148580 ?auto_148581 ) ) ( not ( = ?auto_148582 ?auto_148585 ) ) ( not ( = ?auto_148582 ?auto_148581 ) ) ( not ( = ?auto_148585 ?auto_148581 ) ) ( ON ?auto_148585 ?auto_148582 ) ( not ( = ?auto_148583 ?auto_148587 ) ) ( not ( = ?auto_148583 ?auto_148584 ) ) ( not ( = ?auto_148583 ?auto_148581 ) ) ( not ( = ?auto_148587 ?auto_148584 ) ) ( not ( = ?auto_148587 ?auto_148581 ) ) ( not ( = ?auto_148584 ?auto_148581 ) ) ( not ( = ?auto_148579 ?auto_148584 ) ) ( not ( = ?auto_148579 ?auto_148583 ) ) ( not ( = ?auto_148579 ?auto_148587 ) ) ( not ( = ?auto_148580 ?auto_148584 ) ) ( not ( = ?auto_148580 ?auto_148583 ) ) ( not ( = ?auto_148580 ?auto_148587 ) ) ( not ( = ?auto_148582 ?auto_148584 ) ) ( not ( = ?auto_148582 ?auto_148583 ) ) ( not ( = ?auto_148582 ?auto_148587 ) ) ( not ( = ?auto_148585 ?auto_148584 ) ) ( not ( = ?auto_148585 ?auto_148583 ) ) ( not ( = ?auto_148585 ?auto_148587 ) ) ( ON ?auto_148581 ?auto_148585 ) ( ON ?auto_148584 ?auto_148581 ) ( ON ?auto_148583 ?auto_148586 ) ( CLEAR ?auto_148583 ) ( not ( = ?auto_148579 ?auto_148586 ) ) ( not ( = ?auto_148580 ?auto_148586 ) ) ( not ( = ?auto_148582 ?auto_148586 ) ) ( not ( = ?auto_148585 ?auto_148586 ) ) ( not ( = ?auto_148581 ?auto_148586 ) ) ( not ( = ?auto_148583 ?auto_148586 ) ) ( not ( = ?auto_148587 ?auto_148586 ) ) ( not ( = ?auto_148584 ?auto_148586 ) ) ( HOLDING ?auto_148587 ) ( CLEAR ?auto_148584 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148579 ?auto_148580 ?auto_148582 ?auto_148585 ?auto_148581 ?auto_148584 ?auto_148587 )
      ( MAKE-2PILE ?auto_148579 ?auto_148580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148588 - BLOCK
      ?auto_148589 - BLOCK
    )
    :vars
    (
      ?auto_148593 - BLOCK
      ?auto_148594 - BLOCK
      ?auto_148596 - BLOCK
      ?auto_148592 - BLOCK
      ?auto_148595 - BLOCK
      ?auto_148591 - BLOCK
      ?auto_148590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148593 ?auto_148589 ) ( ON-TABLE ?auto_148588 ) ( ON ?auto_148589 ?auto_148588 ) ( not ( = ?auto_148588 ?auto_148589 ) ) ( not ( = ?auto_148588 ?auto_148593 ) ) ( not ( = ?auto_148589 ?auto_148593 ) ) ( not ( = ?auto_148588 ?auto_148594 ) ) ( not ( = ?auto_148588 ?auto_148596 ) ) ( not ( = ?auto_148589 ?auto_148594 ) ) ( not ( = ?auto_148589 ?auto_148596 ) ) ( not ( = ?auto_148593 ?auto_148594 ) ) ( not ( = ?auto_148593 ?auto_148596 ) ) ( not ( = ?auto_148594 ?auto_148596 ) ) ( ON ?auto_148594 ?auto_148593 ) ( not ( = ?auto_148592 ?auto_148595 ) ) ( not ( = ?auto_148592 ?auto_148591 ) ) ( not ( = ?auto_148592 ?auto_148596 ) ) ( not ( = ?auto_148595 ?auto_148591 ) ) ( not ( = ?auto_148595 ?auto_148596 ) ) ( not ( = ?auto_148591 ?auto_148596 ) ) ( not ( = ?auto_148588 ?auto_148591 ) ) ( not ( = ?auto_148588 ?auto_148592 ) ) ( not ( = ?auto_148588 ?auto_148595 ) ) ( not ( = ?auto_148589 ?auto_148591 ) ) ( not ( = ?auto_148589 ?auto_148592 ) ) ( not ( = ?auto_148589 ?auto_148595 ) ) ( not ( = ?auto_148593 ?auto_148591 ) ) ( not ( = ?auto_148593 ?auto_148592 ) ) ( not ( = ?auto_148593 ?auto_148595 ) ) ( not ( = ?auto_148594 ?auto_148591 ) ) ( not ( = ?auto_148594 ?auto_148592 ) ) ( not ( = ?auto_148594 ?auto_148595 ) ) ( ON ?auto_148596 ?auto_148594 ) ( ON ?auto_148591 ?auto_148596 ) ( ON ?auto_148592 ?auto_148590 ) ( not ( = ?auto_148588 ?auto_148590 ) ) ( not ( = ?auto_148589 ?auto_148590 ) ) ( not ( = ?auto_148593 ?auto_148590 ) ) ( not ( = ?auto_148594 ?auto_148590 ) ) ( not ( = ?auto_148596 ?auto_148590 ) ) ( not ( = ?auto_148592 ?auto_148590 ) ) ( not ( = ?auto_148595 ?auto_148590 ) ) ( not ( = ?auto_148591 ?auto_148590 ) ) ( CLEAR ?auto_148591 ) ( ON ?auto_148595 ?auto_148592 ) ( CLEAR ?auto_148595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148590 ?auto_148592 )
      ( MAKE-2PILE ?auto_148588 ?auto_148589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148597 - BLOCK
      ?auto_148598 - BLOCK
    )
    :vars
    (
      ?auto_148599 - BLOCK
      ?auto_148604 - BLOCK
      ?auto_148601 - BLOCK
      ?auto_148602 - BLOCK
      ?auto_148605 - BLOCK
      ?auto_148600 - BLOCK
      ?auto_148603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148599 ?auto_148598 ) ( ON-TABLE ?auto_148597 ) ( ON ?auto_148598 ?auto_148597 ) ( not ( = ?auto_148597 ?auto_148598 ) ) ( not ( = ?auto_148597 ?auto_148599 ) ) ( not ( = ?auto_148598 ?auto_148599 ) ) ( not ( = ?auto_148597 ?auto_148604 ) ) ( not ( = ?auto_148597 ?auto_148601 ) ) ( not ( = ?auto_148598 ?auto_148604 ) ) ( not ( = ?auto_148598 ?auto_148601 ) ) ( not ( = ?auto_148599 ?auto_148604 ) ) ( not ( = ?auto_148599 ?auto_148601 ) ) ( not ( = ?auto_148604 ?auto_148601 ) ) ( ON ?auto_148604 ?auto_148599 ) ( not ( = ?auto_148602 ?auto_148605 ) ) ( not ( = ?auto_148602 ?auto_148600 ) ) ( not ( = ?auto_148602 ?auto_148601 ) ) ( not ( = ?auto_148605 ?auto_148600 ) ) ( not ( = ?auto_148605 ?auto_148601 ) ) ( not ( = ?auto_148600 ?auto_148601 ) ) ( not ( = ?auto_148597 ?auto_148600 ) ) ( not ( = ?auto_148597 ?auto_148602 ) ) ( not ( = ?auto_148597 ?auto_148605 ) ) ( not ( = ?auto_148598 ?auto_148600 ) ) ( not ( = ?auto_148598 ?auto_148602 ) ) ( not ( = ?auto_148598 ?auto_148605 ) ) ( not ( = ?auto_148599 ?auto_148600 ) ) ( not ( = ?auto_148599 ?auto_148602 ) ) ( not ( = ?auto_148599 ?auto_148605 ) ) ( not ( = ?auto_148604 ?auto_148600 ) ) ( not ( = ?auto_148604 ?auto_148602 ) ) ( not ( = ?auto_148604 ?auto_148605 ) ) ( ON ?auto_148601 ?auto_148604 ) ( ON ?auto_148602 ?auto_148603 ) ( not ( = ?auto_148597 ?auto_148603 ) ) ( not ( = ?auto_148598 ?auto_148603 ) ) ( not ( = ?auto_148599 ?auto_148603 ) ) ( not ( = ?auto_148604 ?auto_148603 ) ) ( not ( = ?auto_148601 ?auto_148603 ) ) ( not ( = ?auto_148602 ?auto_148603 ) ) ( not ( = ?auto_148605 ?auto_148603 ) ) ( not ( = ?auto_148600 ?auto_148603 ) ) ( ON ?auto_148605 ?auto_148602 ) ( CLEAR ?auto_148605 ) ( ON-TABLE ?auto_148603 ) ( HOLDING ?auto_148600 ) ( CLEAR ?auto_148601 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148597 ?auto_148598 ?auto_148599 ?auto_148604 ?auto_148601 ?auto_148600 )
      ( MAKE-2PILE ?auto_148597 ?auto_148598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148606 - BLOCK
      ?auto_148607 - BLOCK
    )
    :vars
    (
      ?auto_148612 - BLOCK
      ?auto_148610 - BLOCK
      ?auto_148613 - BLOCK
      ?auto_148608 - BLOCK
      ?auto_148611 - BLOCK
      ?auto_148614 - BLOCK
      ?auto_148609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148612 ?auto_148607 ) ( ON-TABLE ?auto_148606 ) ( ON ?auto_148607 ?auto_148606 ) ( not ( = ?auto_148606 ?auto_148607 ) ) ( not ( = ?auto_148606 ?auto_148612 ) ) ( not ( = ?auto_148607 ?auto_148612 ) ) ( not ( = ?auto_148606 ?auto_148610 ) ) ( not ( = ?auto_148606 ?auto_148613 ) ) ( not ( = ?auto_148607 ?auto_148610 ) ) ( not ( = ?auto_148607 ?auto_148613 ) ) ( not ( = ?auto_148612 ?auto_148610 ) ) ( not ( = ?auto_148612 ?auto_148613 ) ) ( not ( = ?auto_148610 ?auto_148613 ) ) ( ON ?auto_148610 ?auto_148612 ) ( not ( = ?auto_148608 ?auto_148611 ) ) ( not ( = ?auto_148608 ?auto_148614 ) ) ( not ( = ?auto_148608 ?auto_148613 ) ) ( not ( = ?auto_148611 ?auto_148614 ) ) ( not ( = ?auto_148611 ?auto_148613 ) ) ( not ( = ?auto_148614 ?auto_148613 ) ) ( not ( = ?auto_148606 ?auto_148614 ) ) ( not ( = ?auto_148606 ?auto_148608 ) ) ( not ( = ?auto_148606 ?auto_148611 ) ) ( not ( = ?auto_148607 ?auto_148614 ) ) ( not ( = ?auto_148607 ?auto_148608 ) ) ( not ( = ?auto_148607 ?auto_148611 ) ) ( not ( = ?auto_148612 ?auto_148614 ) ) ( not ( = ?auto_148612 ?auto_148608 ) ) ( not ( = ?auto_148612 ?auto_148611 ) ) ( not ( = ?auto_148610 ?auto_148614 ) ) ( not ( = ?auto_148610 ?auto_148608 ) ) ( not ( = ?auto_148610 ?auto_148611 ) ) ( ON ?auto_148613 ?auto_148610 ) ( ON ?auto_148608 ?auto_148609 ) ( not ( = ?auto_148606 ?auto_148609 ) ) ( not ( = ?auto_148607 ?auto_148609 ) ) ( not ( = ?auto_148612 ?auto_148609 ) ) ( not ( = ?auto_148610 ?auto_148609 ) ) ( not ( = ?auto_148613 ?auto_148609 ) ) ( not ( = ?auto_148608 ?auto_148609 ) ) ( not ( = ?auto_148611 ?auto_148609 ) ) ( not ( = ?auto_148614 ?auto_148609 ) ) ( ON ?auto_148611 ?auto_148608 ) ( ON-TABLE ?auto_148609 ) ( CLEAR ?auto_148613 ) ( ON ?auto_148614 ?auto_148611 ) ( CLEAR ?auto_148614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148609 ?auto_148608 ?auto_148611 )
      ( MAKE-2PILE ?auto_148606 ?auto_148607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148615 - BLOCK
      ?auto_148616 - BLOCK
    )
    :vars
    (
      ?auto_148619 - BLOCK
      ?auto_148621 - BLOCK
      ?auto_148618 - BLOCK
      ?auto_148623 - BLOCK
      ?auto_148622 - BLOCK
      ?auto_148620 - BLOCK
      ?auto_148617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148619 ?auto_148616 ) ( ON-TABLE ?auto_148615 ) ( ON ?auto_148616 ?auto_148615 ) ( not ( = ?auto_148615 ?auto_148616 ) ) ( not ( = ?auto_148615 ?auto_148619 ) ) ( not ( = ?auto_148616 ?auto_148619 ) ) ( not ( = ?auto_148615 ?auto_148621 ) ) ( not ( = ?auto_148615 ?auto_148618 ) ) ( not ( = ?auto_148616 ?auto_148621 ) ) ( not ( = ?auto_148616 ?auto_148618 ) ) ( not ( = ?auto_148619 ?auto_148621 ) ) ( not ( = ?auto_148619 ?auto_148618 ) ) ( not ( = ?auto_148621 ?auto_148618 ) ) ( ON ?auto_148621 ?auto_148619 ) ( not ( = ?auto_148623 ?auto_148622 ) ) ( not ( = ?auto_148623 ?auto_148620 ) ) ( not ( = ?auto_148623 ?auto_148618 ) ) ( not ( = ?auto_148622 ?auto_148620 ) ) ( not ( = ?auto_148622 ?auto_148618 ) ) ( not ( = ?auto_148620 ?auto_148618 ) ) ( not ( = ?auto_148615 ?auto_148620 ) ) ( not ( = ?auto_148615 ?auto_148623 ) ) ( not ( = ?auto_148615 ?auto_148622 ) ) ( not ( = ?auto_148616 ?auto_148620 ) ) ( not ( = ?auto_148616 ?auto_148623 ) ) ( not ( = ?auto_148616 ?auto_148622 ) ) ( not ( = ?auto_148619 ?auto_148620 ) ) ( not ( = ?auto_148619 ?auto_148623 ) ) ( not ( = ?auto_148619 ?auto_148622 ) ) ( not ( = ?auto_148621 ?auto_148620 ) ) ( not ( = ?auto_148621 ?auto_148623 ) ) ( not ( = ?auto_148621 ?auto_148622 ) ) ( ON ?auto_148623 ?auto_148617 ) ( not ( = ?auto_148615 ?auto_148617 ) ) ( not ( = ?auto_148616 ?auto_148617 ) ) ( not ( = ?auto_148619 ?auto_148617 ) ) ( not ( = ?auto_148621 ?auto_148617 ) ) ( not ( = ?auto_148618 ?auto_148617 ) ) ( not ( = ?auto_148623 ?auto_148617 ) ) ( not ( = ?auto_148622 ?auto_148617 ) ) ( not ( = ?auto_148620 ?auto_148617 ) ) ( ON ?auto_148622 ?auto_148623 ) ( ON-TABLE ?auto_148617 ) ( ON ?auto_148620 ?auto_148622 ) ( CLEAR ?auto_148620 ) ( HOLDING ?auto_148618 ) ( CLEAR ?auto_148621 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148615 ?auto_148616 ?auto_148619 ?auto_148621 ?auto_148618 )
      ( MAKE-2PILE ?auto_148615 ?auto_148616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148624 - BLOCK
      ?auto_148625 - BLOCK
    )
    :vars
    (
      ?auto_148628 - BLOCK
      ?auto_148631 - BLOCK
      ?auto_148630 - BLOCK
      ?auto_148626 - BLOCK
      ?auto_148632 - BLOCK
      ?auto_148629 - BLOCK
      ?auto_148627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148628 ?auto_148625 ) ( ON-TABLE ?auto_148624 ) ( ON ?auto_148625 ?auto_148624 ) ( not ( = ?auto_148624 ?auto_148625 ) ) ( not ( = ?auto_148624 ?auto_148628 ) ) ( not ( = ?auto_148625 ?auto_148628 ) ) ( not ( = ?auto_148624 ?auto_148631 ) ) ( not ( = ?auto_148624 ?auto_148630 ) ) ( not ( = ?auto_148625 ?auto_148631 ) ) ( not ( = ?auto_148625 ?auto_148630 ) ) ( not ( = ?auto_148628 ?auto_148631 ) ) ( not ( = ?auto_148628 ?auto_148630 ) ) ( not ( = ?auto_148631 ?auto_148630 ) ) ( ON ?auto_148631 ?auto_148628 ) ( not ( = ?auto_148626 ?auto_148632 ) ) ( not ( = ?auto_148626 ?auto_148629 ) ) ( not ( = ?auto_148626 ?auto_148630 ) ) ( not ( = ?auto_148632 ?auto_148629 ) ) ( not ( = ?auto_148632 ?auto_148630 ) ) ( not ( = ?auto_148629 ?auto_148630 ) ) ( not ( = ?auto_148624 ?auto_148629 ) ) ( not ( = ?auto_148624 ?auto_148626 ) ) ( not ( = ?auto_148624 ?auto_148632 ) ) ( not ( = ?auto_148625 ?auto_148629 ) ) ( not ( = ?auto_148625 ?auto_148626 ) ) ( not ( = ?auto_148625 ?auto_148632 ) ) ( not ( = ?auto_148628 ?auto_148629 ) ) ( not ( = ?auto_148628 ?auto_148626 ) ) ( not ( = ?auto_148628 ?auto_148632 ) ) ( not ( = ?auto_148631 ?auto_148629 ) ) ( not ( = ?auto_148631 ?auto_148626 ) ) ( not ( = ?auto_148631 ?auto_148632 ) ) ( ON ?auto_148626 ?auto_148627 ) ( not ( = ?auto_148624 ?auto_148627 ) ) ( not ( = ?auto_148625 ?auto_148627 ) ) ( not ( = ?auto_148628 ?auto_148627 ) ) ( not ( = ?auto_148631 ?auto_148627 ) ) ( not ( = ?auto_148630 ?auto_148627 ) ) ( not ( = ?auto_148626 ?auto_148627 ) ) ( not ( = ?auto_148632 ?auto_148627 ) ) ( not ( = ?auto_148629 ?auto_148627 ) ) ( ON ?auto_148632 ?auto_148626 ) ( ON-TABLE ?auto_148627 ) ( ON ?auto_148629 ?auto_148632 ) ( CLEAR ?auto_148631 ) ( ON ?auto_148630 ?auto_148629 ) ( CLEAR ?auto_148630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148627 ?auto_148626 ?auto_148632 ?auto_148629 )
      ( MAKE-2PILE ?auto_148624 ?auto_148625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148633 - BLOCK
      ?auto_148634 - BLOCK
    )
    :vars
    (
      ?auto_148635 - BLOCK
      ?auto_148640 - BLOCK
      ?auto_148639 - BLOCK
      ?auto_148638 - BLOCK
      ?auto_148637 - BLOCK
      ?auto_148641 - BLOCK
      ?auto_148636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148635 ?auto_148634 ) ( ON-TABLE ?auto_148633 ) ( ON ?auto_148634 ?auto_148633 ) ( not ( = ?auto_148633 ?auto_148634 ) ) ( not ( = ?auto_148633 ?auto_148635 ) ) ( not ( = ?auto_148634 ?auto_148635 ) ) ( not ( = ?auto_148633 ?auto_148640 ) ) ( not ( = ?auto_148633 ?auto_148639 ) ) ( not ( = ?auto_148634 ?auto_148640 ) ) ( not ( = ?auto_148634 ?auto_148639 ) ) ( not ( = ?auto_148635 ?auto_148640 ) ) ( not ( = ?auto_148635 ?auto_148639 ) ) ( not ( = ?auto_148640 ?auto_148639 ) ) ( not ( = ?auto_148638 ?auto_148637 ) ) ( not ( = ?auto_148638 ?auto_148641 ) ) ( not ( = ?auto_148638 ?auto_148639 ) ) ( not ( = ?auto_148637 ?auto_148641 ) ) ( not ( = ?auto_148637 ?auto_148639 ) ) ( not ( = ?auto_148641 ?auto_148639 ) ) ( not ( = ?auto_148633 ?auto_148641 ) ) ( not ( = ?auto_148633 ?auto_148638 ) ) ( not ( = ?auto_148633 ?auto_148637 ) ) ( not ( = ?auto_148634 ?auto_148641 ) ) ( not ( = ?auto_148634 ?auto_148638 ) ) ( not ( = ?auto_148634 ?auto_148637 ) ) ( not ( = ?auto_148635 ?auto_148641 ) ) ( not ( = ?auto_148635 ?auto_148638 ) ) ( not ( = ?auto_148635 ?auto_148637 ) ) ( not ( = ?auto_148640 ?auto_148641 ) ) ( not ( = ?auto_148640 ?auto_148638 ) ) ( not ( = ?auto_148640 ?auto_148637 ) ) ( ON ?auto_148638 ?auto_148636 ) ( not ( = ?auto_148633 ?auto_148636 ) ) ( not ( = ?auto_148634 ?auto_148636 ) ) ( not ( = ?auto_148635 ?auto_148636 ) ) ( not ( = ?auto_148640 ?auto_148636 ) ) ( not ( = ?auto_148639 ?auto_148636 ) ) ( not ( = ?auto_148638 ?auto_148636 ) ) ( not ( = ?auto_148637 ?auto_148636 ) ) ( not ( = ?auto_148641 ?auto_148636 ) ) ( ON ?auto_148637 ?auto_148638 ) ( ON-TABLE ?auto_148636 ) ( ON ?auto_148641 ?auto_148637 ) ( ON ?auto_148639 ?auto_148641 ) ( CLEAR ?auto_148639 ) ( HOLDING ?auto_148640 ) ( CLEAR ?auto_148635 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148633 ?auto_148634 ?auto_148635 ?auto_148640 )
      ( MAKE-2PILE ?auto_148633 ?auto_148634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148642 - BLOCK
      ?auto_148643 - BLOCK
    )
    :vars
    (
      ?auto_148645 - BLOCK
      ?auto_148644 - BLOCK
      ?auto_148647 - BLOCK
      ?auto_148650 - BLOCK
      ?auto_148649 - BLOCK
      ?auto_148646 - BLOCK
      ?auto_148648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148645 ?auto_148643 ) ( ON-TABLE ?auto_148642 ) ( ON ?auto_148643 ?auto_148642 ) ( not ( = ?auto_148642 ?auto_148643 ) ) ( not ( = ?auto_148642 ?auto_148645 ) ) ( not ( = ?auto_148643 ?auto_148645 ) ) ( not ( = ?auto_148642 ?auto_148644 ) ) ( not ( = ?auto_148642 ?auto_148647 ) ) ( not ( = ?auto_148643 ?auto_148644 ) ) ( not ( = ?auto_148643 ?auto_148647 ) ) ( not ( = ?auto_148645 ?auto_148644 ) ) ( not ( = ?auto_148645 ?auto_148647 ) ) ( not ( = ?auto_148644 ?auto_148647 ) ) ( not ( = ?auto_148650 ?auto_148649 ) ) ( not ( = ?auto_148650 ?auto_148646 ) ) ( not ( = ?auto_148650 ?auto_148647 ) ) ( not ( = ?auto_148649 ?auto_148646 ) ) ( not ( = ?auto_148649 ?auto_148647 ) ) ( not ( = ?auto_148646 ?auto_148647 ) ) ( not ( = ?auto_148642 ?auto_148646 ) ) ( not ( = ?auto_148642 ?auto_148650 ) ) ( not ( = ?auto_148642 ?auto_148649 ) ) ( not ( = ?auto_148643 ?auto_148646 ) ) ( not ( = ?auto_148643 ?auto_148650 ) ) ( not ( = ?auto_148643 ?auto_148649 ) ) ( not ( = ?auto_148645 ?auto_148646 ) ) ( not ( = ?auto_148645 ?auto_148650 ) ) ( not ( = ?auto_148645 ?auto_148649 ) ) ( not ( = ?auto_148644 ?auto_148646 ) ) ( not ( = ?auto_148644 ?auto_148650 ) ) ( not ( = ?auto_148644 ?auto_148649 ) ) ( ON ?auto_148650 ?auto_148648 ) ( not ( = ?auto_148642 ?auto_148648 ) ) ( not ( = ?auto_148643 ?auto_148648 ) ) ( not ( = ?auto_148645 ?auto_148648 ) ) ( not ( = ?auto_148644 ?auto_148648 ) ) ( not ( = ?auto_148647 ?auto_148648 ) ) ( not ( = ?auto_148650 ?auto_148648 ) ) ( not ( = ?auto_148649 ?auto_148648 ) ) ( not ( = ?auto_148646 ?auto_148648 ) ) ( ON ?auto_148649 ?auto_148650 ) ( ON-TABLE ?auto_148648 ) ( ON ?auto_148646 ?auto_148649 ) ( ON ?auto_148647 ?auto_148646 ) ( CLEAR ?auto_148645 ) ( ON ?auto_148644 ?auto_148647 ) ( CLEAR ?auto_148644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148648 ?auto_148650 ?auto_148649 ?auto_148646 ?auto_148647 )
      ( MAKE-2PILE ?auto_148642 ?auto_148643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148669 - BLOCK
      ?auto_148670 - BLOCK
    )
    :vars
    (
      ?auto_148672 - BLOCK
      ?auto_148674 - BLOCK
      ?auto_148677 - BLOCK
      ?auto_148673 - BLOCK
      ?auto_148676 - BLOCK
      ?auto_148671 - BLOCK
      ?auto_148675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148669 ) ( not ( = ?auto_148669 ?auto_148670 ) ) ( not ( = ?auto_148669 ?auto_148672 ) ) ( not ( = ?auto_148670 ?auto_148672 ) ) ( not ( = ?auto_148669 ?auto_148674 ) ) ( not ( = ?auto_148669 ?auto_148677 ) ) ( not ( = ?auto_148670 ?auto_148674 ) ) ( not ( = ?auto_148670 ?auto_148677 ) ) ( not ( = ?auto_148672 ?auto_148674 ) ) ( not ( = ?auto_148672 ?auto_148677 ) ) ( not ( = ?auto_148674 ?auto_148677 ) ) ( not ( = ?auto_148673 ?auto_148676 ) ) ( not ( = ?auto_148673 ?auto_148671 ) ) ( not ( = ?auto_148673 ?auto_148677 ) ) ( not ( = ?auto_148676 ?auto_148671 ) ) ( not ( = ?auto_148676 ?auto_148677 ) ) ( not ( = ?auto_148671 ?auto_148677 ) ) ( not ( = ?auto_148669 ?auto_148671 ) ) ( not ( = ?auto_148669 ?auto_148673 ) ) ( not ( = ?auto_148669 ?auto_148676 ) ) ( not ( = ?auto_148670 ?auto_148671 ) ) ( not ( = ?auto_148670 ?auto_148673 ) ) ( not ( = ?auto_148670 ?auto_148676 ) ) ( not ( = ?auto_148672 ?auto_148671 ) ) ( not ( = ?auto_148672 ?auto_148673 ) ) ( not ( = ?auto_148672 ?auto_148676 ) ) ( not ( = ?auto_148674 ?auto_148671 ) ) ( not ( = ?auto_148674 ?auto_148673 ) ) ( not ( = ?auto_148674 ?auto_148676 ) ) ( ON ?auto_148673 ?auto_148675 ) ( not ( = ?auto_148669 ?auto_148675 ) ) ( not ( = ?auto_148670 ?auto_148675 ) ) ( not ( = ?auto_148672 ?auto_148675 ) ) ( not ( = ?auto_148674 ?auto_148675 ) ) ( not ( = ?auto_148677 ?auto_148675 ) ) ( not ( = ?auto_148673 ?auto_148675 ) ) ( not ( = ?auto_148676 ?auto_148675 ) ) ( not ( = ?auto_148671 ?auto_148675 ) ) ( ON ?auto_148676 ?auto_148673 ) ( ON-TABLE ?auto_148675 ) ( ON ?auto_148671 ?auto_148676 ) ( ON ?auto_148677 ?auto_148671 ) ( ON ?auto_148674 ?auto_148677 ) ( ON ?auto_148672 ?auto_148674 ) ( CLEAR ?auto_148672 ) ( HOLDING ?auto_148670 ) ( CLEAR ?auto_148669 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148669 ?auto_148670 ?auto_148672 )
      ( MAKE-2PILE ?auto_148669 ?auto_148670 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148678 - BLOCK
      ?auto_148679 - BLOCK
    )
    :vars
    (
      ?auto_148684 - BLOCK
      ?auto_148681 - BLOCK
      ?auto_148685 - BLOCK
      ?auto_148682 - BLOCK
      ?auto_148680 - BLOCK
      ?auto_148683 - BLOCK
      ?auto_148686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148678 ) ( not ( = ?auto_148678 ?auto_148679 ) ) ( not ( = ?auto_148678 ?auto_148684 ) ) ( not ( = ?auto_148679 ?auto_148684 ) ) ( not ( = ?auto_148678 ?auto_148681 ) ) ( not ( = ?auto_148678 ?auto_148685 ) ) ( not ( = ?auto_148679 ?auto_148681 ) ) ( not ( = ?auto_148679 ?auto_148685 ) ) ( not ( = ?auto_148684 ?auto_148681 ) ) ( not ( = ?auto_148684 ?auto_148685 ) ) ( not ( = ?auto_148681 ?auto_148685 ) ) ( not ( = ?auto_148682 ?auto_148680 ) ) ( not ( = ?auto_148682 ?auto_148683 ) ) ( not ( = ?auto_148682 ?auto_148685 ) ) ( not ( = ?auto_148680 ?auto_148683 ) ) ( not ( = ?auto_148680 ?auto_148685 ) ) ( not ( = ?auto_148683 ?auto_148685 ) ) ( not ( = ?auto_148678 ?auto_148683 ) ) ( not ( = ?auto_148678 ?auto_148682 ) ) ( not ( = ?auto_148678 ?auto_148680 ) ) ( not ( = ?auto_148679 ?auto_148683 ) ) ( not ( = ?auto_148679 ?auto_148682 ) ) ( not ( = ?auto_148679 ?auto_148680 ) ) ( not ( = ?auto_148684 ?auto_148683 ) ) ( not ( = ?auto_148684 ?auto_148682 ) ) ( not ( = ?auto_148684 ?auto_148680 ) ) ( not ( = ?auto_148681 ?auto_148683 ) ) ( not ( = ?auto_148681 ?auto_148682 ) ) ( not ( = ?auto_148681 ?auto_148680 ) ) ( ON ?auto_148682 ?auto_148686 ) ( not ( = ?auto_148678 ?auto_148686 ) ) ( not ( = ?auto_148679 ?auto_148686 ) ) ( not ( = ?auto_148684 ?auto_148686 ) ) ( not ( = ?auto_148681 ?auto_148686 ) ) ( not ( = ?auto_148685 ?auto_148686 ) ) ( not ( = ?auto_148682 ?auto_148686 ) ) ( not ( = ?auto_148680 ?auto_148686 ) ) ( not ( = ?auto_148683 ?auto_148686 ) ) ( ON ?auto_148680 ?auto_148682 ) ( ON-TABLE ?auto_148686 ) ( ON ?auto_148683 ?auto_148680 ) ( ON ?auto_148685 ?auto_148683 ) ( ON ?auto_148681 ?auto_148685 ) ( ON ?auto_148684 ?auto_148681 ) ( CLEAR ?auto_148678 ) ( ON ?auto_148679 ?auto_148684 ) ( CLEAR ?auto_148679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148686 ?auto_148682 ?auto_148680 ?auto_148683 ?auto_148685 ?auto_148681 ?auto_148684 )
      ( MAKE-2PILE ?auto_148678 ?auto_148679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148687 - BLOCK
      ?auto_148688 - BLOCK
    )
    :vars
    (
      ?auto_148690 - BLOCK
      ?auto_148692 - BLOCK
      ?auto_148691 - BLOCK
      ?auto_148693 - BLOCK
      ?auto_148694 - BLOCK
      ?auto_148695 - BLOCK
      ?auto_148689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148687 ?auto_148688 ) ) ( not ( = ?auto_148687 ?auto_148690 ) ) ( not ( = ?auto_148688 ?auto_148690 ) ) ( not ( = ?auto_148687 ?auto_148692 ) ) ( not ( = ?auto_148687 ?auto_148691 ) ) ( not ( = ?auto_148688 ?auto_148692 ) ) ( not ( = ?auto_148688 ?auto_148691 ) ) ( not ( = ?auto_148690 ?auto_148692 ) ) ( not ( = ?auto_148690 ?auto_148691 ) ) ( not ( = ?auto_148692 ?auto_148691 ) ) ( not ( = ?auto_148693 ?auto_148694 ) ) ( not ( = ?auto_148693 ?auto_148695 ) ) ( not ( = ?auto_148693 ?auto_148691 ) ) ( not ( = ?auto_148694 ?auto_148695 ) ) ( not ( = ?auto_148694 ?auto_148691 ) ) ( not ( = ?auto_148695 ?auto_148691 ) ) ( not ( = ?auto_148687 ?auto_148695 ) ) ( not ( = ?auto_148687 ?auto_148693 ) ) ( not ( = ?auto_148687 ?auto_148694 ) ) ( not ( = ?auto_148688 ?auto_148695 ) ) ( not ( = ?auto_148688 ?auto_148693 ) ) ( not ( = ?auto_148688 ?auto_148694 ) ) ( not ( = ?auto_148690 ?auto_148695 ) ) ( not ( = ?auto_148690 ?auto_148693 ) ) ( not ( = ?auto_148690 ?auto_148694 ) ) ( not ( = ?auto_148692 ?auto_148695 ) ) ( not ( = ?auto_148692 ?auto_148693 ) ) ( not ( = ?auto_148692 ?auto_148694 ) ) ( ON ?auto_148693 ?auto_148689 ) ( not ( = ?auto_148687 ?auto_148689 ) ) ( not ( = ?auto_148688 ?auto_148689 ) ) ( not ( = ?auto_148690 ?auto_148689 ) ) ( not ( = ?auto_148692 ?auto_148689 ) ) ( not ( = ?auto_148691 ?auto_148689 ) ) ( not ( = ?auto_148693 ?auto_148689 ) ) ( not ( = ?auto_148694 ?auto_148689 ) ) ( not ( = ?auto_148695 ?auto_148689 ) ) ( ON ?auto_148694 ?auto_148693 ) ( ON-TABLE ?auto_148689 ) ( ON ?auto_148695 ?auto_148694 ) ( ON ?auto_148691 ?auto_148695 ) ( ON ?auto_148692 ?auto_148691 ) ( ON ?auto_148690 ?auto_148692 ) ( ON ?auto_148688 ?auto_148690 ) ( CLEAR ?auto_148688 ) ( HOLDING ?auto_148687 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148687 )
      ( MAKE-2PILE ?auto_148687 ?auto_148688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_148696 - BLOCK
      ?auto_148697 - BLOCK
    )
    :vars
    (
      ?auto_148699 - BLOCK
      ?auto_148702 - BLOCK
      ?auto_148701 - BLOCK
      ?auto_148703 - BLOCK
      ?auto_148700 - BLOCK
      ?auto_148698 - BLOCK
      ?auto_148704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148696 ?auto_148697 ) ) ( not ( = ?auto_148696 ?auto_148699 ) ) ( not ( = ?auto_148697 ?auto_148699 ) ) ( not ( = ?auto_148696 ?auto_148702 ) ) ( not ( = ?auto_148696 ?auto_148701 ) ) ( not ( = ?auto_148697 ?auto_148702 ) ) ( not ( = ?auto_148697 ?auto_148701 ) ) ( not ( = ?auto_148699 ?auto_148702 ) ) ( not ( = ?auto_148699 ?auto_148701 ) ) ( not ( = ?auto_148702 ?auto_148701 ) ) ( not ( = ?auto_148703 ?auto_148700 ) ) ( not ( = ?auto_148703 ?auto_148698 ) ) ( not ( = ?auto_148703 ?auto_148701 ) ) ( not ( = ?auto_148700 ?auto_148698 ) ) ( not ( = ?auto_148700 ?auto_148701 ) ) ( not ( = ?auto_148698 ?auto_148701 ) ) ( not ( = ?auto_148696 ?auto_148698 ) ) ( not ( = ?auto_148696 ?auto_148703 ) ) ( not ( = ?auto_148696 ?auto_148700 ) ) ( not ( = ?auto_148697 ?auto_148698 ) ) ( not ( = ?auto_148697 ?auto_148703 ) ) ( not ( = ?auto_148697 ?auto_148700 ) ) ( not ( = ?auto_148699 ?auto_148698 ) ) ( not ( = ?auto_148699 ?auto_148703 ) ) ( not ( = ?auto_148699 ?auto_148700 ) ) ( not ( = ?auto_148702 ?auto_148698 ) ) ( not ( = ?auto_148702 ?auto_148703 ) ) ( not ( = ?auto_148702 ?auto_148700 ) ) ( ON ?auto_148703 ?auto_148704 ) ( not ( = ?auto_148696 ?auto_148704 ) ) ( not ( = ?auto_148697 ?auto_148704 ) ) ( not ( = ?auto_148699 ?auto_148704 ) ) ( not ( = ?auto_148702 ?auto_148704 ) ) ( not ( = ?auto_148701 ?auto_148704 ) ) ( not ( = ?auto_148703 ?auto_148704 ) ) ( not ( = ?auto_148700 ?auto_148704 ) ) ( not ( = ?auto_148698 ?auto_148704 ) ) ( ON ?auto_148700 ?auto_148703 ) ( ON-TABLE ?auto_148704 ) ( ON ?auto_148698 ?auto_148700 ) ( ON ?auto_148701 ?auto_148698 ) ( ON ?auto_148702 ?auto_148701 ) ( ON ?auto_148699 ?auto_148702 ) ( ON ?auto_148697 ?auto_148699 ) ( ON ?auto_148696 ?auto_148697 ) ( CLEAR ?auto_148696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148704 ?auto_148703 ?auto_148700 ?auto_148698 ?auto_148701 ?auto_148702 ?auto_148699 ?auto_148697 )
      ( MAKE-2PILE ?auto_148696 ?auto_148697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148711 - BLOCK
      ?auto_148712 - BLOCK
      ?auto_148713 - BLOCK
      ?auto_148714 - BLOCK
      ?auto_148715 - BLOCK
      ?auto_148716 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_148716 ) ( CLEAR ?auto_148715 ) ( ON-TABLE ?auto_148711 ) ( ON ?auto_148712 ?auto_148711 ) ( ON ?auto_148713 ?auto_148712 ) ( ON ?auto_148714 ?auto_148713 ) ( ON ?auto_148715 ?auto_148714 ) ( not ( = ?auto_148711 ?auto_148712 ) ) ( not ( = ?auto_148711 ?auto_148713 ) ) ( not ( = ?auto_148711 ?auto_148714 ) ) ( not ( = ?auto_148711 ?auto_148715 ) ) ( not ( = ?auto_148711 ?auto_148716 ) ) ( not ( = ?auto_148712 ?auto_148713 ) ) ( not ( = ?auto_148712 ?auto_148714 ) ) ( not ( = ?auto_148712 ?auto_148715 ) ) ( not ( = ?auto_148712 ?auto_148716 ) ) ( not ( = ?auto_148713 ?auto_148714 ) ) ( not ( = ?auto_148713 ?auto_148715 ) ) ( not ( = ?auto_148713 ?auto_148716 ) ) ( not ( = ?auto_148714 ?auto_148715 ) ) ( not ( = ?auto_148714 ?auto_148716 ) ) ( not ( = ?auto_148715 ?auto_148716 ) ) )
    :subtasks
    ( ( !STACK ?auto_148716 ?auto_148715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148717 - BLOCK
      ?auto_148718 - BLOCK
      ?auto_148719 - BLOCK
      ?auto_148720 - BLOCK
      ?auto_148721 - BLOCK
      ?auto_148722 - BLOCK
    )
    :vars
    (
      ?auto_148723 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148721 ) ( ON-TABLE ?auto_148717 ) ( ON ?auto_148718 ?auto_148717 ) ( ON ?auto_148719 ?auto_148718 ) ( ON ?auto_148720 ?auto_148719 ) ( ON ?auto_148721 ?auto_148720 ) ( not ( = ?auto_148717 ?auto_148718 ) ) ( not ( = ?auto_148717 ?auto_148719 ) ) ( not ( = ?auto_148717 ?auto_148720 ) ) ( not ( = ?auto_148717 ?auto_148721 ) ) ( not ( = ?auto_148717 ?auto_148722 ) ) ( not ( = ?auto_148718 ?auto_148719 ) ) ( not ( = ?auto_148718 ?auto_148720 ) ) ( not ( = ?auto_148718 ?auto_148721 ) ) ( not ( = ?auto_148718 ?auto_148722 ) ) ( not ( = ?auto_148719 ?auto_148720 ) ) ( not ( = ?auto_148719 ?auto_148721 ) ) ( not ( = ?auto_148719 ?auto_148722 ) ) ( not ( = ?auto_148720 ?auto_148721 ) ) ( not ( = ?auto_148720 ?auto_148722 ) ) ( not ( = ?auto_148721 ?auto_148722 ) ) ( ON ?auto_148722 ?auto_148723 ) ( CLEAR ?auto_148722 ) ( HAND-EMPTY ) ( not ( = ?auto_148717 ?auto_148723 ) ) ( not ( = ?auto_148718 ?auto_148723 ) ) ( not ( = ?auto_148719 ?auto_148723 ) ) ( not ( = ?auto_148720 ?auto_148723 ) ) ( not ( = ?auto_148721 ?auto_148723 ) ) ( not ( = ?auto_148722 ?auto_148723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148722 ?auto_148723 )
      ( MAKE-6PILE ?auto_148717 ?auto_148718 ?auto_148719 ?auto_148720 ?auto_148721 ?auto_148722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148724 - BLOCK
      ?auto_148725 - BLOCK
      ?auto_148726 - BLOCK
      ?auto_148727 - BLOCK
      ?auto_148728 - BLOCK
      ?auto_148729 - BLOCK
    )
    :vars
    (
      ?auto_148730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148724 ) ( ON ?auto_148725 ?auto_148724 ) ( ON ?auto_148726 ?auto_148725 ) ( ON ?auto_148727 ?auto_148726 ) ( not ( = ?auto_148724 ?auto_148725 ) ) ( not ( = ?auto_148724 ?auto_148726 ) ) ( not ( = ?auto_148724 ?auto_148727 ) ) ( not ( = ?auto_148724 ?auto_148728 ) ) ( not ( = ?auto_148724 ?auto_148729 ) ) ( not ( = ?auto_148725 ?auto_148726 ) ) ( not ( = ?auto_148725 ?auto_148727 ) ) ( not ( = ?auto_148725 ?auto_148728 ) ) ( not ( = ?auto_148725 ?auto_148729 ) ) ( not ( = ?auto_148726 ?auto_148727 ) ) ( not ( = ?auto_148726 ?auto_148728 ) ) ( not ( = ?auto_148726 ?auto_148729 ) ) ( not ( = ?auto_148727 ?auto_148728 ) ) ( not ( = ?auto_148727 ?auto_148729 ) ) ( not ( = ?auto_148728 ?auto_148729 ) ) ( ON ?auto_148729 ?auto_148730 ) ( CLEAR ?auto_148729 ) ( not ( = ?auto_148724 ?auto_148730 ) ) ( not ( = ?auto_148725 ?auto_148730 ) ) ( not ( = ?auto_148726 ?auto_148730 ) ) ( not ( = ?auto_148727 ?auto_148730 ) ) ( not ( = ?auto_148728 ?auto_148730 ) ) ( not ( = ?auto_148729 ?auto_148730 ) ) ( HOLDING ?auto_148728 ) ( CLEAR ?auto_148727 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148724 ?auto_148725 ?auto_148726 ?auto_148727 ?auto_148728 )
      ( MAKE-6PILE ?auto_148724 ?auto_148725 ?auto_148726 ?auto_148727 ?auto_148728 ?auto_148729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148731 - BLOCK
      ?auto_148732 - BLOCK
      ?auto_148733 - BLOCK
      ?auto_148734 - BLOCK
      ?auto_148735 - BLOCK
      ?auto_148736 - BLOCK
    )
    :vars
    (
      ?auto_148737 - BLOCK
      ?auto_148738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148731 ) ( ON ?auto_148732 ?auto_148731 ) ( ON ?auto_148733 ?auto_148732 ) ( ON ?auto_148734 ?auto_148733 ) ( not ( = ?auto_148731 ?auto_148732 ) ) ( not ( = ?auto_148731 ?auto_148733 ) ) ( not ( = ?auto_148731 ?auto_148734 ) ) ( not ( = ?auto_148731 ?auto_148735 ) ) ( not ( = ?auto_148731 ?auto_148736 ) ) ( not ( = ?auto_148732 ?auto_148733 ) ) ( not ( = ?auto_148732 ?auto_148734 ) ) ( not ( = ?auto_148732 ?auto_148735 ) ) ( not ( = ?auto_148732 ?auto_148736 ) ) ( not ( = ?auto_148733 ?auto_148734 ) ) ( not ( = ?auto_148733 ?auto_148735 ) ) ( not ( = ?auto_148733 ?auto_148736 ) ) ( not ( = ?auto_148734 ?auto_148735 ) ) ( not ( = ?auto_148734 ?auto_148736 ) ) ( not ( = ?auto_148735 ?auto_148736 ) ) ( ON ?auto_148736 ?auto_148737 ) ( not ( = ?auto_148731 ?auto_148737 ) ) ( not ( = ?auto_148732 ?auto_148737 ) ) ( not ( = ?auto_148733 ?auto_148737 ) ) ( not ( = ?auto_148734 ?auto_148737 ) ) ( not ( = ?auto_148735 ?auto_148737 ) ) ( not ( = ?auto_148736 ?auto_148737 ) ) ( CLEAR ?auto_148734 ) ( ON ?auto_148735 ?auto_148736 ) ( CLEAR ?auto_148735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148738 ) ( ON ?auto_148737 ?auto_148738 ) ( not ( = ?auto_148738 ?auto_148737 ) ) ( not ( = ?auto_148738 ?auto_148736 ) ) ( not ( = ?auto_148738 ?auto_148735 ) ) ( not ( = ?auto_148731 ?auto_148738 ) ) ( not ( = ?auto_148732 ?auto_148738 ) ) ( not ( = ?auto_148733 ?auto_148738 ) ) ( not ( = ?auto_148734 ?auto_148738 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148738 ?auto_148737 ?auto_148736 )
      ( MAKE-6PILE ?auto_148731 ?auto_148732 ?auto_148733 ?auto_148734 ?auto_148735 ?auto_148736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148739 - BLOCK
      ?auto_148740 - BLOCK
      ?auto_148741 - BLOCK
      ?auto_148742 - BLOCK
      ?auto_148743 - BLOCK
      ?auto_148744 - BLOCK
    )
    :vars
    (
      ?auto_148745 - BLOCK
      ?auto_148746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148739 ) ( ON ?auto_148740 ?auto_148739 ) ( ON ?auto_148741 ?auto_148740 ) ( not ( = ?auto_148739 ?auto_148740 ) ) ( not ( = ?auto_148739 ?auto_148741 ) ) ( not ( = ?auto_148739 ?auto_148742 ) ) ( not ( = ?auto_148739 ?auto_148743 ) ) ( not ( = ?auto_148739 ?auto_148744 ) ) ( not ( = ?auto_148740 ?auto_148741 ) ) ( not ( = ?auto_148740 ?auto_148742 ) ) ( not ( = ?auto_148740 ?auto_148743 ) ) ( not ( = ?auto_148740 ?auto_148744 ) ) ( not ( = ?auto_148741 ?auto_148742 ) ) ( not ( = ?auto_148741 ?auto_148743 ) ) ( not ( = ?auto_148741 ?auto_148744 ) ) ( not ( = ?auto_148742 ?auto_148743 ) ) ( not ( = ?auto_148742 ?auto_148744 ) ) ( not ( = ?auto_148743 ?auto_148744 ) ) ( ON ?auto_148744 ?auto_148745 ) ( not ( = ?auto_148739 ?auto_148745 ) ) ( not ( = ?auto_148740 ?auto_148745 ) ) ( not ( = ?auto_148741 ?auto_148745 ) ) ( not ( = ?auto_148742 ?auto_148745 ) ) ( not ( = ?auto_148743 ?auto_148745 ) ) ( not ( = ?auto_148744 ?auto_148745 ) ) ( ON ?auto_148743 ?auto_148744 ) ( CLEAR ?auto_148743 ) ( ON-TABLE ?auto_148746 ) ( ON ?auto_148745 ?auto_148746 ) ( not ( = ?auto_148746 ?auto_148745 ) ) ( not ( = ?auto_148746 ?auto_148744 ) ) ( not ( = ?auto_148746 ?auto_148743 ) ) ( not ( = ?auto_148739 ?auto_148746 ) ) ( not ( = ?auto_148740 ?auto_148746 ) ) ( not ( = ?auto_148741 ?auto_148746 ) ) ( not ( = ?auto_148742 ?auto_148746 ) ) ( HOLDING ?auto_148742 ) ( CLEAR ?auto_148741 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148739 ?auto_148740 ?auto_148741 ?auto_148742 )
      ( MAKE-6PILE ?auto_148739 ?auto_148740 ?auto_148741 ?auto_148742 ?auto_148743 ?auto_148744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148747 - BLOCK
      ?auto_148748 - BLOCK
      ?auto_148749 - BLOCK
      ?auto_148750 - BLOCK
      ?auto_148751 - BLOCK
      ?auto_148752 - BLOCK
    )
    :vars
    (
      ?auto_148754 - BLOCK
      ?auto_148753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148747 ) ( ON ?auto_148748 ?auto_148747 ) ( ON ?auto_148749 ?auto_148748 ) ( not ( = ?auto_148747 ?auto_148748 ) ) ( not ( = ?auto_148747 ?auto_148749 ) ) ( not ( = ?auto_148747 ?auto_148750 ) ) ( not ( = ?auto_148747 ?auto_148751 ) ) ( not ( = ?auto_148747 ?auto_148752 ) ) ( not ( = ?auto_148748 ?auto_148749 ) ) ( not ( = ?auto_148748 ?auto_148750 ) ) ( not ( = ?auto_148748 ?auto_148751 ) ) ( not ( = ?auto_148748 ?auto_148752 ) ) ( not ( = ?auto_148749 ?auto_148750 ) ) ( not ( = ?auto_148749 ?auto_148751 ) ) ( not ( = ?auto_148749 ?auto_148752 ) ) ( not ( = ?auto_148750 ?auto_148751 ) ) ( not ( = ?auto_148750 ?auto_148752 ) ) ( not ( = ?auto_148751 ?auto_148752 ) ) ( ON ?auto_148752 ?auto_148754 ) ( not ( = ?auto_148747 ?auto_148754 ) ) ( not ( = ?auto_148748 ?auto_148754 ) ) ( not ( = ?auto_148749 ?auto_148754 ) ) ( not ( = ?auto_148750 ?auto_148754 ) ) ( not ( = ?auto_148751 ?auto_148754 ) ) ( not ( = ?auto_148752 ?auto_148754 ) ) ( ON ?auto_148751 ?auto_148752 ) ( ON-TABLE ?auto_148753 ) ( ON ?auto_148754 ?auto_148753 ) ( not ( = ?auto_148753 ?auto_148754 ) ) ( not ( = ?auto_148753 ?auto_148752 ) ) ( not ( = ?auto_148753 ?auto_148751 ) ) ( not ( = ?auto_148747 ?auto_148753 ) ) ( not ( = ?auto_148748 ?auto_148753 ) ) ( not ( = ?auto_148749 ?auto_148753 ) ) ( not ( = ?auto_148750 ?auto_148753 ) ) ( CLEAR ?auto_148749 ) ( ON ?auto_148750 ?auto_148751 ) ( CLEAR ?auto_148750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148753 ?auto_148754 ?auto_148752 ?auto_148751 )
      ( MAKE-6PILE ?auto_148747 ?auto_148748 ?auto_148749 ?auto_148750 ?auto_148751 ?auto_148752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148755 - BLOCK
      ?auto_148756 - BLOCK
      ?auto_148757 - BLOCK
      ?auto_148758 - BLOCK
      ?auto_148759 - BLOCK
      ?auto_148760 - BLOCK
    )
    :vars
    (
      ?auto_148761 - BLOCK
      ?auto_148762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148755 ) ( ON ?auto_148756 ?auto_148755 ) ( not ( = ?auto_148755 ?auto_148756 ) ) ( not ( = ?auto_148755 ?auto_148757 ) ) ( not ( = ?auto_148755 ?auto_148758 ) ) ( not ( = ?auto_148755 ?auto_148759 ) ) ( not ( = ?auto_148755 ?auto_148760 ) ) ( not ( = ?auto_148756 ?auto_148757 ) ) ( not ( = ?auto_148756 ?auto_148758 ) ) ( not ( = ?auto_148756 ?auto_148759 ) ) ( not ( = ?auto_148756 ?auto_148760 ) ) ( not ( = ?auto_148757 ?auto_148758 ) ) ( not ( = ?auto_148757 ?auto_148759 ) ) ( not ( = ?auto_148757 ?auto_148760 ) ) ( not ( = ?auto_148758 ?auto_148759 ) ) ( not ( = ?auto_148758 ?auto_148760 ) ) ( not ( = ?auto_148759 ?auto_148760 ) ) ( ON ?auto_148760 ?auto_148761 ) ( not ( = ?auto_148755 ?auto_148761 ) ) ( not ( = ?auto_148756 ?auto_148761 ) ) ( not ( = ?auto_148757 ?auto_148761 ) ) ( not ( = ?auto_148758 ?auto_148761 ) ) ( not ( = ?auto_148759 ?auto_148761 ) ) ( not ( = ?auto_148760 ?auto_148761 ) ) ( ON ?auto_148759 ?auto_148760 ) ( ON-TABLE ?auto_148762 ) ( ON ?auto_148761 ?auto_148762 ) ( not ( = ?auto_148762 ?auto_148761 ) ) ( not ( = ?auto_148762 ?auto_148760 ) ) ( not ( = ?auto_148762 ?auto_148759 ) ) ( not ( = ?auto_148755 ?auto_148762 ) ) ( not ( = ?auto_148756 ?auto_148762 ) ) ( not ( = ?auto_148757 ?auto_148762 ) ) ( not ( = ?auto_148758 ?auto_148762 ) ) ( ON ?auto_148758 ?auto_148759 ) ( CLEAR ?auto_148758 ) ( HOLDING ?auto_148757 ) ( CLEAR ?auto_148756 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148755 ?auto_148756 ?auto_148757 )
      ( MAKE-6PILE ?auto_148755 ?auto_148756 ?auto_148757 ?auto_148758 ?auto_148759 ?auto_148760 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148763 - BLOCK
      ?auto_148764 - BLOCK
      ?auto_148765 - BLOCK
      ?auto_148766 - BLOCK
      ?auto_148767 - BLOCK
      ?auto_148768 - BLOCK
    )
    :vars
    (
      ?auto_148770 - BLOCK
      ?auto_148769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148763 ) ( ON ?auto_148764 ?auto_148763 ) ( not ( = ?auto_148763 ?auto_148764 ) ) ( not ( = ?auto_148763 ?auto_148765 ) ) ( not ( = ?auto_148763 ?auto_148766 ) ) ( not ( = ?auto_148763 ?auto_148767 ) ) ( not ( = ?auto_148763 ?auto_148768 ) ) ( not ( = ?auto_148764 ?auto_148765 ) ) ( not ( = ?auto_148764 ?auto_148766 ) ) ( not ( = ?auto_148764 ?auto_148767 ) ) ( not ( = ?auto_148764 ?auto_148768 ) ) ( not ( = ?auto_148765 ?auto_148766 ) ) ( not ( = ?auto_148765 ?auto_148767 ) ) ( not ( = ?auto_148765 ?auto_148768 ) ) ( not ( = ?auto_148766 ?auto_148767 ) ) ( not ( = ?auto_148766 ?auto_148768 ) ) ( not ( = ?auto_148767 ?auto_148768 ) ) ( ON ?auto_148768 ?auto_148770 ) ( not ( = ?auto_148763 ?auto_148770 ) ) ( not ( = ?auto_148764 ?auto_148770 ) ) ( not ( = ?auto_148765 ?auto_148770 ) ) ( not ( = ?auto_148766 ?auto_148770 ) ) ( not ( = ?auto_148767 ?auto_148770 ) ) ( not ( = ?auto_148768 ?auto_148770 ) ) ( ON ?auto_148767 ?auto_148768 ) ( ON-TABLE ?auto_148769 ) ( ON ?auto_148770 ?auto_148769 ) ( not ( = ?auto_148769 ?auto_148770 ) ) ( not ( = ?auto_148769 ?auto_148768 ) ) ( not ( = ?auto_148769 ?auto_148767 ) ) ( not ( = ?auto_148763 ?auto_148769 ) ) ( not ( = ?auto_148764 ?auto_148769 ) ) ( not ( = ?auto_148765 ?auto_148769 ) ) ( not ( = ?auto_148766 ?auto_148769 ) ) ( ON ?auto_148766 ?auto_148767 ) ( CLEAR ?auto_148764 ) ( ON ?auto_148765 ?auto_148766 ) ( CLEAR ?auto_148765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148769 ?auto_148770 ?auto_148768 ?auto_148767 ?auto_148766 )
      ( MAKE-6PILE ?auto_148763 ?auto_148764 ?auto_148765 ?auto_148766 ?auto_148767 ?auto_148768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148771 - BLOCK
      ?auto_148772 - BLOCK
      ?auto_148773 - BLOCK
      ?auto_148774 - BLOCK
      ?auto_148775 - BLOCK
      ?auto_148776 - BLOCK
    )
    :vars
    (
      ?auto_148778 - BLOCK
      ?auto_148777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148771 ) ( not ( = ?auto_148771 ?auto_148772 ) ) ( not ( = ?auto_148771 ?auto_148773 ) ) ( not ( = ?auto_148771 ?auto_148774 ) ) ( not ( = ?auto_148771 ?auto_148775 ) ) ( not ( = ?auto_148771 ?auto_148776 ) ) ( not ( = ?auto_148772 ?auto_148773 ) ) ( not ( = ?auto_148772 ?auto_148774 ) ) ( not ( = ?auto_148772 ?auto_148775 ) ) ( not ( = ?auto_148772 ?auto_148776 ) ) ( not ( = ?auto_148773 ?auto_148774 ) ) ( not ( = ?auto_148773 ?auto_148775 ) ) ( not ( = ?auto_148773 ?auto_148776 ) ) ( not ( = ?auto_148774 ?auto_148775 ) ) ( not ( = ?auto_148774 ?auto_148776 ) ) ( not ( = ?auto_148775 ?auto_148776 ) ) ( ON ?auto_148776 ?auto_148778 ) ( not ( = ?auto_148771 ?auto_148778 ) ) ( not ( = ?auto_148772 ?auto_148778 ) ) ( not ( = ?auto_148773 ?auto_148778 ) ) ( not ( = ?auto_148774 ?auto_148778 ) ) ( not ( = ?auto_148775 ?auto_148778 ) ) ( not ( = ?auto_148776 ?auto_148778 ) ) ( ON ?auto_148775 ?auto_148776 ) ( ON-TABLE ?auto_148777 ) ( ON ?auto_148778 ?auto_148777 ) ( not ( = ?auto_148777 ?auto_148778 ) ) ( not ( = ?auto_148777 ?auto_148776 ) ) ( not ( = ?auto_148777 ?auto_148775 ) ) ( not ( = ?auto_148771 ?auto_148777 ) ) ( not ( = ?auto_148772 ?auto_148777 ) ) ( not ( = ?auto_148773 ?auto_148777 ) ) ( not ( = ?auto_148774 ?auto_148777 ) ) ( ON ?auto_148774 ?auto_148775 ) ( ON ?auto_148773 ?auto_148774 ) ( CLEAR ?auto_148773 ) ( HOLDING ?auto_148772 ) ( CLEAR ?auto_148771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148771 ?auto_148772 )
      ( MAKE-6PILE ?auto_148771 ?auto_148772 ?auto_148773 ?auto_148774 ?auto_148775 ?auto_148776 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148779 - BLOCK
      ?auto_148780 - BLOCK
      ?auto_148781 - BLOCK
      ?auto_148782 - BLOCK
      ?auto_148783 - BLOCK
      ?auto_148784 - BLOCK
    )
    :vars
    (
      ?auto_148786 - BLOCK
      ?auto_148785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_148779 ) ( not ( = ?auto_148779 ?auto_148780 ) ) ( not ( = ?auto_148779 ?auto_148781 ) ) ( not ( = ?auto_148779 ?auto_148782 ) ) ( not ( = ?auto_148779 ?auto_148783 ) ) ( not ( = ?auto_148779 ?auto_148784 ) ) ( not ( = ?auto_148780 ?auto_148781 ) ) ( not ( = ?auto_148780 ?auto_148782 ) ) ( not ( = ?auto_148780 ?auto_148783 ) ) ( not ( = ?auto_148780 ?auto_148784 ) ) ( not ( = ?auto_148781 ?auto_148782 ) ) ( not ( = ?auto_148781 ?auto_148783 ) ) ( not ( = ?auto_148781 ?auto_148784 ) ) ( not ( = ?auto_148782 ?auto_148783 ) ) ( not ( = ?auto_148782 ?auto_148784 ) ) ( not ( = ?auto_148783 ?auto_148784 ) ) ( ON ?auto_148784 ?auto_148786 ) ( not ( = ?auto_148779 ?auto_148786 ) ) ( not ( = ?auto_148780 ?auto_148786 ) ) ( not ( = ?auto_148781 ?auto_148786 ) ) ( not ( = ?auto_148782 ?auto_148786 ) ) ( not ( = ?auto_148783 ?auto_148786 ) ) ( not ( = ?auto_148784 ?auto_148786 ) ) ( ON ?auto_148783 ?auto_148784 ) ( ON-TABLE ?auto_148785 ) ( ON ?auto_148786 ?auto_148785 ) ( not ( = ?auto_148785 ?auto_148786 ) ) ( not ( = ?auto_148785 ?auto_148784 ) ) ( not ( = ?auto_148785 ?auto_148783 ) ) ( not ( = ?auto_148779 ?auto_148785 ) ) ( not ( = ?auto_148780 ?auto_148785 ) ) ( not ( = ?auto_148781 ?auto_148785 ) ) ( not ( = ?auto_148782 ?auto_148785 ) ) ( ON ?auto_148782 ?auto_148783 ) ( ON ?auto_148781 ?auto_148782 ) ( CLEAR ?auto_148779 ) ( ON ?auto_148780 ?auto_148781 ) ( CLEAR ?auto_148780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148785 ?auto_148786 ?auto_148784 ?auto_148783 ?auto_148782 ?auto_148781 )
      ( MAKE-6PILE ?auto_148779 ?auto_148780 ?auto_148781 ?auto_148782 ?auto_148783 ?auto_148784 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148787 - BLOCK
      ?auto_148788 - BLOCK
      ?auto_148789 - BLOCK
      ?auto_148790 - BLOCK
      ?auto_148791 - BLOCK
      ?auto_148792 - BLOCK
    )
    :vars
    (
      ?auto_148794 - BLOCK
      ?auto_148793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148787 ?auto_148788 ) ) ( not ( = ?auto_148787 ?auto_148789 ) ) ( not ( = ?auto_148787 ?auto_148790 ) ) ( not ( = ?auto_148787 ?auto_148791 ) ) ( not ( = ?auto_148787 ?auto_148792 ) ) ( not ( = ?auto_148788 ?auto_148789 ) ) ( not ( = ?auto_148788 ?auto_148790 ) ) ( not ( = ?auto_148788 ?auto_148791 ) ) ( not ( = ?auto_148788 ?auto_148792 ) ) ( not ( = ?auto_148789 ?auto_148790 ) ) ( not ( = ?auto_148789 ?auto_148791 ) ) ( not ( = ?auto_148789 ?auto_148792 ) ) ( not ( = ?auto_148790 ?auto_148791 ) ) ( not ( = ?auto_148790 ?auto_148792 ) ) ( not ( = ?auto_148791 ?auto_148792 ) ) ( ON ?auto_148792 ?auto_148794 ) ( not ( = ?auto_148787 ?auto_148794 ) ) ( not ( = ?auto_148788 ?auto_148794 ) ) ( not ( = ?auto_148789 ?auto_148794 ) ) ( not ( = ?auto_148790 ?auto_148794 ) ) ( not ( = ?auto_148791 ?auto_148794 ) ) ( not ( = ?auto_148792 ?auto_148794 ) ) ( ON ?auto_148791 ?auto_148792 ) ( ON-TABLE ?auto_148793 ) ( ON ?auto_148794 ?auto_148793 ) ( not ( = ?auto_148793 ?auto_148794 ) ) ( not ( = ?auto_148793 ?auto_148792 ) ) ( not ( = ?auto_148793 ?auto_148791 ) ) ( not ( = ?auto_148787 ?auto_148793 ) ) ( not ( = ?auto_148788 ?auto_148793 ) ) ( not ( = ?auto_148789 ?auto_148793 ) ) ( not ( = ?auto_148790 ?auto_148793 ) ) ( ON ?auto_148790 ?auto_148791 ) ( ON ?auto_148789 ?auto_148790 ) ( ON ?auto_148788 ?auto_148789 ) ( CLEAR ?auto_148788 ) ( HOLDING ?auto_148787 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148787 )
      ( MAKE-6PILE ?auto_148787 ?auto_148788 ?auto_148789 ?auto_148790 ?auto_148791 ?auto_148792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148795 - BLOCK
      ?auto_148796 - BLOCK
      ?auto_148797 - BLOCK
      ?auto_148798 - BLOCK
      ?auto_148799 - BLOCK
      ?auto_148800 - BLOCK
    )
    :vars
    (
      ?auto_148802 - BLOCK
      ?auto_148801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148795 ?auto_148796 ) ) ( not ( = ?auto_148795 ?auto_148797 ) ) ( not ( = ?auto_148795 ?auto_148798 ) ) ( not ( = ?auto_148795 ?auto_148799 ) ) ( not ( = ?auto_148795 ?auto_148800 ) ) ( not ( = ?auto_148796 ?auto_148797 ) ) ( not ( = ?auto_148796 ?auto_148798 ) ) ( not ( = ?auto_148796 ?auto_148799 ) ) ( not ( = ?auto_148796 ?auto_148800 ) ) ( not ( = ?auto_148797 ?auto_148798 ) ) ( not ( = ?auto_148797 ?auto_148799 ) ) ( not ( = ?auto_148797 ?auto_148800 ) ) ( not ( = ?auto_148798 ?auto_148799 ) ) ( not ( = ?auto_148798 ?auto_148800 ) ) ( not ( = ?auto_148799 ?auto_148800 ) ) ( ON ?auto_148800 ?auto_148802 ) ( not ( = ?auto_148795 ?auto_148802 ) ) ( not ( = ?auto_148796 ?auto_148802 ) ) ( not ( = ?auto_148797 ?auto_148802 ) ) ( not ( = ?auto_148798 ?auto_148802 ) ) ( not ( = ?auto_148799 ?auto_148802 ) ) ( not ( = ?auto_148800 ?auto_148802 ) ) ( ON ?auto_148799 ?auto_148800 ) ( ON-TABLE ?auto_148801 ) ( ON ?auto_148802 ?auto_148801 ) ( not ( = ?auto_148801 ?auto_148802 ) ) ( not ( = ?auto_148801 ?auto_148800 ) ) ( not ( = ?auto_148801 ?auto_148799 ) ) ( not ( = ?auto_148795 ?auto_148801 ) ) ( not ( = ?auto_148796 ?auto_148801 ) ) ( not ( = ?auto_148797 ?auto_148801 ) ) ( not ( = ?auto_148798 ?auto_148801 ) ) ( ON ?auto_148798 ?auto_148799 ) ( ON ?auto_148797 ?auto_148798 ) ( ON ?auto_148796 ?auto_148797 ) ( ON ?auto_148795 ?auto_148796 ) ( CLEAR ?auto_148795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148801 ?auto_148802 ?auto_148800 ?auto_148799 ?auto_148798 ?auto_148797 ?auto_148796 )
      ( MAKE-6PILE ?auto_148795 ?auto_148796 ?auto_148797 ?auto_148798 ?auto_148799 ?auto_148800 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148803 - BLOCK
      ?auto_148804 - BLOCK
      ?auto_148805 - BLOCK
      ?auto_148806 - BLOCK
      ?auto_148807 - BLOCK
      ?auto_148808 - BLOCK
    )
    :vars
    (
      ?auto_148809 - BLOCK
      ?auto_148810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148803 ?auto_148804 ) ) ( not ( = ?auto_148803 ?auto_148805 ) ) ( not ( = ?auto_148803 ?auto_148806 ) ) ( not ( = ?auto_148803 ?auto_148807 ) ) ( not ( = ?auto_148803 ?auto_148808 ) ) ( not ( = ?auto_148804 ?auto_148805 ) ) ( not ( = ?auto_148804 ?auto_148806 ) ) ( not ( = ?auto_148804 ?auto_148807 ) ) ( not ( = ?auto_148804 ?auto_148808 ) ) ( not ( = ?auto_148805 ?auto_148806 ) ) ( not ( = ?auto_148805 ?auto_148807 ) ) ( not ( = ?auto_148805 ?auto_148808 ) ) ( not ( = ?auto_148806 ?auto_148807 ) ) ( not ( = ?auto_148806 ?auto_148808 ) ) ( not ( = ?auto_148807 ?auto_148808 ) ) ( ON ?auto_148808 ?auto_148809 ) ( not ( = ?auto_148803 ?auto_148809 ) ) ( not ( = ?auto_148804 ?auto_148809 ) ) ( not ( = ?auto_148805 ?auto_148809 ) ) ( not ( = ?auto_148806 ?auto_148809 ) ) ( not ( = ?auto_148807 ?auto_148809 ) ) ( not ( = ?auto_148808 ?auto_148809 ) ) ( ON ?auto_148807 ?auto_148808 ) ( ON-TABLE ?auto_148810 ) ( ON ?auto_148809 ?auto_148810 ) ( not ( = ?auto_148810 ?auto_148809 ) ) ( not ( = ?auto_148810 ?auto_148808 ) ) ( not ( = ?auto_148810 ?auto_148807 ) ) ( not ( = ?auto_148803 ?auto_148810 ) ) ( not ( = ?auto_148804 ?auto_148810 ) ) ( not ( = ?auto_148805 ?auto_148810 ) ) ( not ( = ?auto_148806 ?auto_148810 ) ) ( ON ?auto_148806 ?auto_148807 ) ( ON ?auto_148805 ?auto_148806 ) ( ON ?auto_148804 ?auto_148805 ) ( HOLDING ?auto_148803 ) ( CLEAR ?auto_148804 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148810 ?auto_148809 ?auto_148808 ?auto_148807 ?auto_148806 ?auto_148805 ?auto_148804 ?auto_148803 )
      ( MAKE-6PILE ?auto_148803 ?auto_148804 ?auto_148805 ?auto_148806 ?auto_148807 ?auto_148808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148811 - BLOCK
      ?auto_148812 - BLOCK
      ?auto_148813 - BLOCK
      ?auto_148814 - BLOCK
      ?auto_148815 - BLOCK
      ?auto_148816 - BLOCK
    )
    :vars
    (
      ?auto_148818 - BLOCK
      ?auto_148817 - BLOCK
      ?auto_148819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148811 ?auto_148812 ) ) ( not ( = ?auto_148811 ?auto_148813 ) ) ( not ( = ?auto_148811 ?auto_148814 ) ) ( not ( = ?auto_148811 ?auto_148815 ) ) ( not ( = ?auto_148811 ?auto_148816 ) ) ( not ( = ?auto_148812 ?auto_148813 ) ) ( not ( = ?auto_148812 ?auto_148814 ) ) ( not ( = ?auto_148812 ?auto_148815 ) ) ( not ( = ?auto_148812 ?auto_148816 ) ) ( not ( = ?auto_148813 ?auto_148814 ) ) ( not ( = ?auto_148813 ?auto_148815 ) ) ( not ( = ?auto_148813 ?auto_148816 ) ) ( not ( = ?auto_148814 ?auto_148815 ) ) ( not ( = ?auto_148814 ?auto_148816 ) ) ( not ( = ?auto_148815 ?auto_148816 ) ) ( ON ?auto_148816 ?auto_148818 ) ( not ( = ?auto_148811 ?auto_148818 ) ) ( not ( = ?auto_148812 ?auto_148818 ) ) ( not ( = ?auto_148813 ?auto_148818 ) ) ( not ( = ?auto_148814 ?auto_148818 ) ) ( not ( = ?auto_148815 ?auto_148818 ) ) ( not ( = ?auto_148816 ?auto_148818 ) ) ( ON ?auto_148815 ?auto_148816 ) ( ON-TABLE ?auto_148817 ) ( ON ?auto_148818 ?auto_148817 ) ( not ( = ?auto_148817 ?auto_148818 ) ) ( not ( = ?auto_148817 ?auto_148816 ) ) ( not ( = ?auto_148817 ?auto_148815 ) ) ( not ( = ?auto_148811 ?auto_148817 ) ) ( not ( = ?auto_148812 ?auto_148817 ) ) ( not ( = ?auto_148813 ?auto_148817 ) ) ( not ( = ?auto_148814 ?auto_148817 ) ) ( ON ?auto_148814 ?auto_148815 ) ( ON ?auto_148813 ?auto_148814 ) ( ON ?auto_148812 ?auto_148813 ) ( CLEAR ?auto_148812 ) ( ON ?auto_148811 ?auto_148819 ) ( CLEAR ?auto_148811 ) ( HAND-EMPTY ) ( not ( = ?auto_148811 ?auto_148819 ) ) ( not ( = ?auto_148812 ?auto_148819 ) ) ( not ( = ?auto_148813 ?auto_148819 ) ) ( not ( = ?auto_148814 ?auto_148819 ) ) ( not ( = ?auto_148815 ?auto_148819 ) ) ( not ( = ?auto_148816 ?auto_148819 ) ) ( not ( = ?auto_148818 ?auto_148819 ) ) ( not ( = ?auto_148817 ?auto_148819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148811 ?auto_148819 )
      ( MAKE-6PILE ?auto_148811 ?auto_148812 ?auto_148813 ?auto_148814 ?auto_148815 ?auto_148816 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148820 - BLOCK
      ?auto_148821 - BLOCK
      ?auto_148822 - BLOCK
      ?auto_148823 - BLOCK
      ?auto_148824 - BLOCK
      ?auto_148825 - BLOCK
    )
    :vars
    (
      ?auto_148828 - BLOCK
      ?auto_148827 - BLOCK
      ?auto_148826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148820 ?auto_148821 ) ) ( not ( = ?auto_148820 ?auto_148822 ) ) ( not ( = ?auto_148820 ?auto_148823 ) ) ( not ( = ?auto_148820 ?auto_148824 ) ) ( not ( = ?auto_148820 ?auto_148825 ) ) ( not ( = ?auto_148821 ?auto_148822 ) ) ( not ( = ?auto_148821 ?auto_148823 ) ) ( not ( = ?auto_148821 ?auto_148824 ) ) ( not ( = ?auto_148821 ?auto_148825 ) ) ( not ( = ?auto_148822 ?auto_148823 ) ) ( not ( = ?auto_148822 ?auto_148824 ) ) ( not ( = ?auto_148822 ?auto_148825 ) ) ( not ( = ?auto_148823 ?auto_148824 ) ) ( not ( = ?auto_148823 ?auto_148825 ) ) ( not ( = ?auto_148824 ?auto_148825 ) ) ( ON ?auto_148825 ?auto_148828 ) ( not ( = ?auto_148820 ?auto_148828 ) ) ( not ( = ?auto_148821 ?auto_148828 ) ) ( not ( = ?auto_148822 ?auto_148828 ) ) ( not ( = ?auto_148823 ?auto_148828 ) ) ( not ( = ?auto_148824 ?auto_148828 ) ) ( not ( = ?auto_148825 ?auto_148828 ) ) ( ON ?auto_148824 ?auto_148825 ) ( ON-TABLE ?auto_148827 ) ( ON ?auto_148828 ?auto_148827 ) ( not ( = ?auto_148827 ?auto_148828 ) ) ( not ( = ?auto_148827 ?auto_148825 ) ) ( not ( = ?auto_148827 ?auto_148824 ) ) ( not ( = ?auto_148820 ?auto_148827 ) ) ( not ( = ?auto_148821 ?auto_148827 ) ) ( not ( = ?auto_148822 ?auto_148827 ) ) ( not ( = ?auto_148823 ?auto_148827 ) ) ( ON ?auto_148823 ?auto_148824 ) ( ON ?auto_148822 ?auto_148823 ) ( ON ?auto_148820 ?auto_148826 ) ( CLEAR ?auto_148820 ) ( not ( = ?auto_148820 ?auto_148826 ) ) ( not ( = ?auto_148821 ?auto_148826 ) ) ( not ( = ?auto_148822 ?auto_148826 ) ) ( not ( = ?auto_148823 ?auto_148826 ) ) ( not ( = ?auto_148824 ?auto_148826 ) ) ( not ( = ?auto_148825 ?auto_148826 ) ) ( not ( = ?auto_148828 ?auto_148826 ) ) ( not ( = ?auto_148827 ?auto_148826 ) ) ( HOLDING ?auto_148821 ) ( CLEAR ?auto_148822 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148827 ?auto_148828 ?auto_148825 ?auto_148824 ?auto_148823 ?auto_148822 ?auto_148821 )
      ( MAKE-6PILE ?auto_148820 ?auto_148821 ?auto_148822 ?auto_148823 ?auto_148824 ?auto_148825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148829 - BLOCK
      ?auto_148830 - BLOCK
      ?auto_148831 - BLOCK
      ?auto_148832 - BLOCK
      ?auto_148833 - BLOCK
      ?auto_148834 - BLOCK
    )
    :vars
    (
      ?auto_148835 - BLOCK
      ?auto_148837 - BLOCK
      ?auto_148836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148829 ?auto_148830 ) ) ( not ( = ?auto_148829 ?auto_148831 ) ) ( not ( = ?auto_148829 ?auto_148832 ) ) ( not ( = ?auto_148829 ?auto_148833 ) ) ( not ( = ?auto_148829 ?auto_148834 ) ) ( not ( = ?auto_148830 ?auto_148831 ) ) ( not ( = ?auto_148830 ?auto_148832 ) ) ( not ( = ?auto_148830 ?auto_148833 ) ) ( not ( = ?auto_148830 ?auto_148834 ) ) ( not ( = ?auto_148831 ?auto_148832 ) ) ( not ( = ?auto_148831 ?auto_148833 ) ) ( not ( = ?auto_148831 ?auto_148834 ) ) ( not ( = ?auto_148832 ?auto_148833 ) ) ( not ( = ?auto_148832 ?auto_148834 ) ) ( not ( = ?auto_148833 ?auto_148834 ) ) ( ON ?auto_148834 ?auto_148835 ) ( not ( = ?auto_148829 ?auto_148835 ) ) ( not ( = ?auto_148830 ?auto_148835 ) ) ( not ( = ?auto_148831 ?auto_148835 ) ) ( not ( = ?auto_148832 ?auto_148835 ) ) ( not ( = ?auto_148833 ?auto_148835 ) ) ( not ( = ?auto_148834 ?auto_148835 ) ) ( ON ?auto_148833 ?auto_148834 ) ( ON-TABLE ?auto_148837 ) ( ON ?auto_148835 ?auto_148837 ) ( not ( = ?auto_148837 ?auto_148835 ) ) ( not ( = ?auto_148837 ?auto_148834 ) ) ( not ( = ?auto_148837 ?auto_148833 ) ) ( not ( = ?auto_148829 ?auto_148837 ) ) ( not ( = ?auto_148830 ?auto_148837 ) ) ( not ( = ?auto_148831 ?auto_148837 ) ) ( not ( = ?auto_148832 ?auto_148837 ) ) ( ON ?auto_148832 ?auto_148833 ) ( ON ?auto_148831 ?auto_148832 ) ( ON ?auto_148829 ?auto_148836 ) ( not ( = ?auto_148829 ?auto_148836 ) ) ( not ( = ?auto_148830 ?auto_148836 ) ) ( not ( = ?auto_148831 ?auto_148836 ) ) ( not ( = ?auto_148832 ?auto_148836 ) ) ( not ( = ?auto_148833 ?auto_148836 ) ) ( not ( = ?auto_148834 ?auto_148836 ) ) ( not ( = ?auto_148835 ?auto_148836 ) ) ( not ( = ?auto_148837 ?auto_148836 ) ) ( CLEAR ?auto_148831 ) ( ON ?auto_148830 ?auto_148829 ) ( CLEAR ?auto_148830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148836 ?auto_148829 )
      ( MAKE-6PILE ?auto_148829 ?auto_148830 ?auto_148831 ?auto_148832 ?auto_148833 ?auto_148834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148838 - BLOCK
      ?auto_148839 - BLOCK
      ?auto_148840 - BLOCK
      ?auto_148841 - BLOCK
      ?auto_148842 - BLOCK
      ?auto_148843 - BLOCK
    )
    :vars
    (
      ?auto_148845 - BLOCK
      ?auto_148844 - BLOCK
      ?auto_148846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148838 ?auto_148839 ) ) ( not ( = ?auto_148838 ?auto_148840 ) ) ( not ( = ?auto_148838 ?auto_148841 ) ) ( not ( = ?auto_148838 ?auto_148842 ) ) ( not ( = ?auto_148838 ?auto_148843 ) ) ( not ( = ?auto_148839 ?auto_148840 ) ) ( not ( = ?auto_148839 ?auto_148841 ) ) ( not ( = ?auto_148839 ?auto_148842 ) ) ( not ( = ?auto_148839 ?auto_148843 ) ) ( not ( = ?auto_148840 ?auto_148841 ) ) ( not ( = ?auto_148840 ?auto_148842 ) ) ( not ( = ?auto_148840 ?auto_148843 ) ) ( not ( = ?auto_148841 ?auto_148842 ) ) ( not ( = ?auto_148841 ?auto_148843 ) ) ( not ( = ?auto_148842 ?auto_148843 ) ) ( ON ?auto_148843 ?auto_148845 ) ( not ( = ?auto_148838 ?auto_148845 ) ) ( not ( = ?auto_148839 ?auto_148845 ) ) ( not ( = ?auto_148840 ?auto_148845 ) ) ( not ( = ?auto_148841 ?auto_148845 ) ) ( not ( = ?auto_148842 ?auto_148845 ) ) ( not ( = ?auto_148843 ?auto_148845 ) ) ( ON ?auto_148842 ?auto_148843 ) ( ON-TABLE ?auto_148844 ) ( ON ?auto_148845 ?auto_148844 ) ( not ( = ?auto_148844 ?auto_148845 ) ) ( not ( = ?auto_148844 ?auto_148843 ) ) ( not ( = ?auto_148844 ?auto_148842 ) ) ( not ( = ?auto_148838 ?auto_148844 ) ) ( not ( = ?auto_148839 ?auto_148844 ) ) ( not ( = ?auto_148840 ?auto_148844 ) ) ( not ( = ?auto_148841 ?auto_148844 ) ) ( ON ?auto_148841 ?auto_148842 ) ( ON ?auto_148838 ?auto_148846 ) ( not ( = ?auto_148838 ?auto_148846 ) ) ( not ( = ?auto_148839 ?auto_148846 ) ) ( not ( = ?auto_148840 ?auto_148846 ) ) ( not ( = ?auto_148841 ?auto_148846 ) ) ( not ( = ?auto_148842 ?auto_148846 ) ) ( not ( = ?auto_148843 ?auto_148846 ) ) ( not ( = ?auto_148845 ?auto_148846 ) ) ( not ( = ?auto_148844 ?auto_148846 ) ) ( ON ?auto_148839 ?auto_148838 ) ( CLEAR ?auto_148839 ) ( ON-TABLE ?auto_148846 ) ( HOLDING ?auto_148840 ) ( CLEAR ?auto_148841 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148844 ?auto_148845 ?auto_148843 ?auto_148842 ?auto_148841 ?auto_148840 )
      ( MAKE-6PILE ?auto_148838 ?auto_148839 ?auto_148840 ?auto_148841 ?auto_148842 ?auto_148843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148847 - BLOCK
      ?auto_148848 - BLOCK
      ?auto_148849 - BLOCK
      ?auto_148850 - BLOCK
      ?auto_148851 - BLOCK
      ?auto_148852 - BLOCK
    )
    :vars
    (
      ?auto_148853 - BLOCK
      ?auto_148854 - BLOCK
      ?auto_148855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148847 ?auto_148848 ) ) ( not ( = ?auto_148847 ?auto_148849 ) ) ( not ( = ?auto_148847 ?auto_148850 ) ) ( not ( = ?auto_148847 ?auto_148851 ) ) ( not ( = ?auto_148847 ?auto_148852 ) ) ( not ( = ?auto_148848 ?auto_148849 ) ) ( not ( = ?auto_148848 ?auto_148850 ) ) ( not ( = ?auto_148848 ?auto_148851 ) ) ( not ( = ?auto_148848 ?auto_148852 ) ) ( not ( = ?auto_148849 ?auto_148850 ) ) ( not ( = ?auto_148849 ?auto_148851 ) ) ( not ( = ?auto_148849 ?auto_148852 ) ) ( not ( = ?auto_148850 ?auto_148851 ) ) ( not ( = ?auto_148850 ?auto_148852 ) ) ( not ( = ?auto_148851 ?auto_148852 ) ) ( ON ?auto_148852 ?auto_148853 ) ( not ( = ?auto_148847 ?auto_148853 ) ) ( not ( = ?auto_148848 ?auto_148853 ) ) ( not ( = ?auto_148849 ?auto_148853 ) ) ( not ( = ?auto_148850 ?auto_148853 ) ) ( not ( = ?auto_148851 ?auto_148853 ) ) ( not ( = ?auto_148852 ?auto_148853 ) ) ( ON ?auto_148851 ?auto_148852 ) ( ON-TABLE ?auto_148854 ) ( ON ?auto_148853 ?auto_148854 ) ( not ( = ?auto_148854 ?auto_148853 ) ) ( not ( = ?auto_148854 ?auto_148852 ) ) ( not ( = ?auto_148854 ?auto_148851 ) ) ( not ( = ?auto_148847 ?auto_148854 ) ) ( not ( = ?auto_148848 ?auto_148854 ) ) ( not ( = ?auto_148849 ?auto_148854 ) ) ( not ( = ?auto_148850 ?auto_148854 ) ) ( ON ?auto_148850 ?auto_148851 ) ( ON ?auto_148847 ?auto_148855 ) ( not ( = ?auto_148847 ?auto_148855 ) ) ( not ( = ?auto_148848 ?auto_148855 ) ) ( not ( = ?auto_148849 ?auto_148855 ) ) ( not ( = ?auto_148850 ?auto_148855 ) ) ( not ( = ?auto_148851 ?auto_148855 ) ) ( not ( = ?auto_148852 ?auto_148855 ) ) ( not ( = ?auto_148853 ?auto_148855 ) ) ( not ( = ?auto_148854 ?auto_148855 ) ) ( ON ?auto_148848 ?auto_148847 ) ( ON-TABLE ?auto_148855 ) ( CLEAR ?auto_148850 ) ( ON ?auto_148849 ?auto_148848 ) ( CLEAR ?auto_148849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148855 ?auto_148847 ?auto_148848 )
      ( MAKE-6PILE ?auto_148847 ?auto_148848 ?auto_148849 ?auto_148850 ?auto_148851 ?auto_148852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148856 - BLOCK
      ?auto_148857 - BLOCK
      ?auto_148858 - BLOCK
      ?auto_148859 - BLOCK
      ?auto_148860 - BLOCK
      ?auto_148861 - BLOCK
    )
    :vars
    (
      ?auto_148862 - BLOCK
      ?auto_148863 - BLOCK
      ?auto_148864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148856 ?auto_148857 ) ) ( not ( = ?auto_148856 ?auto_148858 ) ) ( not ( = ?auto_148856 ?auto_148859 ) ) ( not ( = ?auto_148856 ?auto_148860 ) ) ( not ( = ?auto_148856 ?auto_148861 ) ) ( not ( = ?auto_148857 ?auto_148858 ) ) ( not ( = ?auto_148857 ?auto_148859 ) ) ( not ( = ?auto_148857 ?auto_148860 ) ) ( not ( = ?auto_148857 ?auto_148861 ) ) ( not ( = ?auto_148858 ?auto_148859 ) ) ( not ( = ?auto_148858 ?auto_148860 ) ) ( not ( = ?auto_148858 ?auto_148861 ) ) ( not ( = ?auto_148859 ?auto_148860 ) ) ( not ( = ?auto_148859 ?auto_148861 ) ) ( not ( = ?auto_148860 ?auto_148861 ) ) ( ON ?auto_148861 ?auto_148862 ) ( not ( = ?auto_148856 ?auto_148862 ) ) ( not ( = ?auto_148857 ?auto_148862 ) ) ( not ( = ?auto_148858 ?auto_148862 ) ) ( not ( = ?auto_148859 ?auto_148862 ) ) ( not ( = ?auto_148860 ?auto_148862 ) ) ( not ( = ?auto_148861 ?auto_148862 ) ) ( ON ?auto_148860 ?auto_148861 ) ( ON-TABLE ?auto_148863 ) ( ON ?auto_148862 ?auto_148863 ) ( not ( = ?auto_148863 ?auto_148862 ) ) ( not ( = ?auto_148863 ?auto_148861 ) ) ( not ( = ?auto_148863 ?auto_148860 ) ) ( not ( = ?auto_148856 ?auto_148863 ) ) ( not ( = ?auto_148857 ?auto_148863 ) ) ( not ( = ?auto_148858 ?auto_148863 ) ) ( not ( = ?auto_148859 ?auto_148863 ) ) ( ON ?auto_148856 ?auto_148864 ) ( not ( = ?auto_148856 ?auto_148864 ) ) ( not ( = ?auto_148857 ?auto_148864 ) ) ( not ( = ?auto_148858 ?auto_148864 ) ) ( not ( = ?auto_148859 ?auto_148864 ) ) ( not ( = ?auto_148860 ?auto_148864 ) ) ( not ( = ?auto_148861 ?auto_148864 ) ) ( not ( = ?auto_148862 ?auto_148864 ) ) ( not ( = ?auto_148863 ?auto_148864 ) ) ( ON ?auto_148857 ?auto_148856 ) ( ON-TABLE ?auto_148864 ) ( ON ?auto_148858 ?auto_148857 ) ( CLEAR ?auto_148858 ) ( HOLDING ?auto_148859 ) ( CLEAR ?auto_148860 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148863 ?auto_148862 ?auto_148861 ?auto_148860 ?auto_148859 )
      ( MAKE-6PILE ?auto_148856 ?auto_148857 ?auto_148858 ?auto_148859 ?auto_148860 ?auto_148861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148865 - BLOCK
      ?auto_148866 - BLOCK
      ?auto_148867 - BLOCK
      ?auto_148868 - BLOCK
      ?auto_148869 - BLOCK
      ?auto_148870 - BLOCK
    )
    :vars
    (
      ?auto_148871 - BLOCK
      ?auto_148872 - BLOCK
      ?auto_148873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148865 ?auto_148866 ) ) ( not ( = ?auto_148865 ?auto_148867 ) ) ( not ( = ?auto_148865 ?auto_148868 ) ) ( not ( = ?auto_148865 ?auto_148869 ) ) ( not ( = ?auto_148865 ?auto_148870 ) ) ( not ( = ?auto_148866 ?auto_148867 ) ) ( not ( = ?auto_148866 ?auto_148868 ) ) ( not ( = ?auto_148866 ?auto_148869 ) ) ( not ( = ?auto_148866 ?auto_148870 ) ) ( not ( = ?auto_148867 ?auto_148868 ) ) ( not ( = ?auto_148867 ?auto_148869 ) ) ( not ( = ?auto_148867 ?auto_148870 ) ) ( not ( = ?auto_148868 ?auto_148869 ) ) ( not ( = ?auto_148868 ?auto_148870 ) ) ( not ( = ?auto_148869 ?auto_148870 ) ) ( ON ?auto_148870 ?auto_148871 ) ( not ( = ?auto_148865 ?auto_148871 ) ) ( not ( = ?auto_148866 ?auto_148871 ) ) ( not ( = ?auto_148867 ?auto_148871 ) ) ( not ( = ?auto_148868 ?auto_148871 ) ) ( not ( = ?auto_148869 ?auto_148871 ) ) ( not ( = ?auto_148870 ?auto_148871 ) ) ( ON ?auto_148869 ?auto_148870 ) ( ON-TABLE ?auto_148872 ) ( ON ?auto_148871 ?auto_148872 ) ( not ( = ?auto_148872 ?auto_148871 ) ) ( not ( = ?auto_148872 ?auto_148870 ) ) ( not ( = ?auto_148872 ?auto_148869 ) ) ( not ( = ?auto_148865 ?auto_148872 ) ) ( not ( = ?auto_148866 ?auto_148872 ) ) ( not ( = ?auto_148867 ?auto_148872 ) ) ( not ( = ?auto_148868 ?auto_148872 ) ) ( ON ?auto_148865 ?auto_148873 ) ( not ( = ?auto_148865 ?auto_148873 ) ) ( not ( = ?auto_148866 ?auto_148873 ) ) ( not ( = ?auto_148867 ?auto_148873 ) ) ( not ( = ?auto_148868 ?auto_148873 ) ) ( not ( = ?auto_148869 ?auto_148873 ) ) ( not ( = ?auto_148870 ?auto_148873 ) ) ( not ( = ?auto_148871 ?auto_148873 ) ) ( not ( = ?auto_148872 ?auto_148873 ) ) ( ON ?auto_148866 ?auto_148865 ) ( ON-TABLE ?auto_148873 ) ( ON ?auto_148867 ?auto_148866 ) ( CLEAR ?auto_148869 ) ( ON ?auto_148868 ?auto_148867 ) ( CLEAR ?auto_148868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148873 ?auto_148865 ?auto_148866 ?auto_148867 )
      ( MAKE-6PILE ?auto_148865 ?auto_148866 ?auto_148867 ?auto_148868 ?auto_148869 ?auto_148870 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148874 - BLOCK
      ?auto_148875 - BLOCK
      ?auto_148876 - BLOCK
      ?auto_148877 - BLOCK
      ?auto_148878 - BLOCK
      ?auto_148879 - BLOCK
    )
    :vars
    (
      ?auto_148882 - BLOCK
      ?auto_148881 - BLOCK
      ?auto_148880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148874 ?auto_148875 ) ) ( not ( = ?auto_148874 ?auto_148876 ) ) ( not ( = ?auto_148874 ?auto_148877 ) ) ( not ( = ?auto_148874 ?auto_148878 ) ) ( not ( = ?auto_148874 ?auto_148879 ) ) ( not ( = ?auto_148875 ?auto_148876 ) ) ( not ( = ?auto_148875 ?auto_148877 ) ) ( not ( = ?auto_148875 ?auto_148878 ) ) ( not ( = ?auto_148875 ?auto_148879 ) ) ( not ( = ?auto_148876 ?auto_148877 ) ) ( not ( = ?auto_148876 ?auto_148878 ) ) ( not ( = ?auto_148876 ?auto_148879 ) ) ( not ( = ?auto_148877 ?auto_148878 ) ) ( not ( = ?auto_148877 ?auto_148879 ) ) ( not ( = ?auto_148878 ?auto_148879 ) ) ( ON ?auto_148879 ?auto_148882 ) ( not ( = ?auto_148874 ?auto_148882 ) ) ( not ( = ?auto_148875 ?auto_148882 ) ) ( not ( = ?auto_148876 ?auto_148882 ) ) ( not ( = ?auto_148877 ?auto_148882 ) ) ( not ( = ?auto_148878 ?auto_148882 ) ) ( not ( = ?auto_148879 ?auto_148882 ) ) ( ON-TABLE ?auto_148881 ) ( ON ?auto_148882 ?auto_148881 ) ( not ( = ?auto_148881 ?auto_148882 ) ) ( not ( = ?auto_148881 ?auto_148879 ) ) ( not ( = ?auto_148881 ?auto_148878 ) ) ( not ( = ?auto_148874 ?auto_148881 ) ) ( not ( = ?auto_148875 ?auto_148881 ) ) ( not ( = ?auto_148876 ?auto_148881 ) ) ( not ( = ?auto_148877 ?auto_148881 ) ) ( ON ?auto_148874 ?auto_148880 ) ( not ( = ?auto_148874 ?auto_148880 ) ) ( not ( = ?auto_148875 ?auto_148880 ) ) ( not ( = ?auto_148876 ?auto_148880 ) ) ( not ( = ?auto_148877 ?auto_148880 ) ) ( not ( = ?auto_148878 ?auto_148880 ) ) ( not ( = ?auto_148879 ?auto_148880 ) ) ( not ( = ?auto_148882 ?auto_148880 ) ) ( not ( = ?auto_148881 ?auto_148880 ) ) ( ON ?auto_148875 ?auto_148874 ) ( ON-TABLE ?auto_148880 ) ( ON ?auto_148876 ?auto_148875 ) ( ON ?auto_148877 ?auto_148876 ) ( CLEAR ?auto_148877 ) ( HOLDING ?auto_148878 ) ( CLEAR ?auto_148879 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148881 ?auto_148882 ?auto_148879 ?auto_148878 )
      ( MAKE-6PILE ?auto_148874 ?auto_148875 ?auto_148876 ?auto_148877 ?auto_148878 ?auto_148879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148883 - BLOCK
      ?auto_148884 - BLOCK
      ?auto_148885 - BLOCK
      ?auto_148886 - BLOCK
      ?auto_148887 - BLOCK
      ?auto_148888 - BLOCK
    )
    :vars
    (
      ?auto_148889 - BLOCK
      ?auto_148891 - BLOCK
      ?auto_148890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148883 ?auto_148884 ) ) ( not ( = ?auto_148883 ?auto_148885 ) ) ( not ( = ?auto_148883 ?auto_148886 ) ) ( not ( = ?auto_148883 ?auto_148887 ) ) ( not ( = ?auto_148883 ?auto_148888 ) ) ( not ( = ?auto_148884 ?auto_148885 ) ) ( not ( = ?auto_148884 ?auto_148886 ) ) ( not ( = ?auto_148884 ?auto_148887 ) ) ( not ( = ?auto_148884 ?auto_148888 ) ) ( not ( = ?auto_148885 ?auto_148886 ) ) ( not ( = ?auto_148885 ?auto_148887 ) ) ( not ( = ?auto_148885 ?auto_148888 ) ) ( not ( = ?auto_148886 ?auto_148887 ) ) ( not ( = ?auto_148886 ?auto_148888 ) ) ( not ( = ?auto_148887 ?auto_148888 ) ) ( ON ?auto_148888 ?auto_148889 ) ( not ( = ?auto_148883 ?auto_148889 ) ) ( not ( = ?auto_148884 ?auto_148889 ) ) ( not ( = ?auto_148885 ?auto_148889 ) ) ( not ( = ?auto_148886 ?auto_148889 ) ) ( not ( = ?auto_148887 ?auto_148889 ) ) ( not ( = ?auto_148888 ?auto_148889 ) ) ( ON-TABLE ?auto_148891 ) ( ON ?auto_148889 ?auto_148891 ) ( not ( = ?auto_148891 ?auto_148889 ) ) ( not ( = ?auto_148891 ?auto_148888 ) ) ( not ( = ?auto_148891 ?auto_148887 ) ) ( not ( = ?auto_148883 ?auto_148891 ) ) ( not ( = ?auto_148884 ?auto_148891 ) ) ( not ( = ?auto_148885 ?auto_148891 ) ) ( not ( = ?auto_148886 ?auto_148891 ) ) ( ON ?auto_148883 ?auto_148890 ) ( not ( = ?auto_148883 ?auto_148890 ) ) ( not ( = ?auto_148884 ?auto_148890 ) ) ( not ( = ?auto_148885 ?auto_148890 ) ) ( not ( = ?auto_148886 ?auto_148890 ) ) ( not ( = ?auto_148887 ?auto_148890 ) ) ( not ( = ?auto_148888 ?auto_148890 ) ) ( not ( = ?auto_148889 ?auto_148890 ) ) ( not ( = ?auto_148891 ?auto_148890 ) ) ( ON ?auto_148884 ?auto_148883 ) ( ON-TABLE ?auto_148890 ) ( ON ?auto_148885 ?auto_148884 ) ( ON ?auto_148886 ?auto_148885 ) ( CLEAR ?auto_148888 ) ( ON ?auto_148887 ?auto_148886 ) ( CLEAR ?auto_148887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148890 ?auto_148883 ?auto_148884 ?auto_148885 ?auto_148886 )
      ( MAKE-6PILE ?auto_148883 ?auto_148884 ?auto_148885 ?auto_148886 ?auto_148887 ?auto_148888 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148892 - BLOCK
      ?auto_148893 - BLOCK
      ?auto_148894 - BLOCK
      ?auto_148895 - BLOCK
      ?auto_148896 - BLOCK
      ?auto_148897 - BLOCK
    )
    :vars
    (
      ?auto_148899 - BLOCK
      ?auto_148900 - BLOCK
      ?auto_148898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148892 ?auto_148893 ) ) ( not ( = ?auto_148892 ?auto_148894 ) ) ( not ( = ?auto_148892 ?auto_148895 ) ) ( not ( = ?auto_148892 ?auto_148896 ) ) ( not ( = ?auto_148892 ?auto_148897 ) ) ( not ( = ?auto_148893 ?auto_148894 ) ) ( not ( = ?auto_148893 ?auto_148895 ) ) ( not ( = ?auto_148893 ?auto_148896 ) ) ( not ( = ?auto_148893 ?auto_148897 ) ) ( not ( = ?auto_148894 ?auto_148895 ) ) ( not ( = ?auto_148894 ?auto_148896 ) ) ( not ( = ?auto_148894 ?auto_148897 ) ) ( not ( = ?auto_148895 ?auto_148896 ) ) ( not ( = ?auto_148895 ?auto_148897 ) ) ( not ( = ?auto_148896 ?auto_148897 ) ) ( not ( = ?auto_148892 ?auto_148899 ) ) ( not ( = ?auto_148893 ?auto_148899 ) ) ( not ( = ?auto_148894 ?auto_148899 ) ) ( not ( = ?auto_148895 ?auto_148899 ) ) ( not ( = ?auto_148896 ?auto_148899 ) ) ( not ( = ?auto_148897 ?auto_148899 ) ) ( ON-TABLE ?auto_148900 ) ( ON ?auto_148899 ?auto_148900 ) ( not ( = ?auto_148900 ?auto_148899 ) ) ( not ( = ?auto_148900 ?auto_148897 ) ) ( not ( = ?auto_148900 ?auto_148896 ) ) ( not ( = ?auto_148892 ?auto_148900 ) ) ( not ( = ?auto_148893 ?auto_148900 ) ) ( not ( = ?auto_148894 ?auto_148900 ) ) ( not ( = ?auto_148895 ?auto_148900 ) ) ( ON ?auto_148892 ?auto_148898 ) ( not ( = ?auto_148892 ?auto_148898 ) ) ( not ( = ?auto_148893 ?auto_148898 ) ) ( not ( = ?auto_148894 ?auto_148898 ) ) ( not ( = ?auto_148895 ?auto_148898 ) ) ( not ( = ?auto_148896 ?auto_148898 ) ) ( not ( = ?auto_148897 ?auto_148898 ) ) ( not ( = ?auto_148899 ?auto_148898 ) ) ( not ( = ?auto_148900 ?auto_148898 ) ) ( ON ?auto_148893 ?auto_148892 ) ( ON-TABLE ?auto_148898 ) ( ON ?auto_148894 ?auto_148893 ) ( ON ?auto_148895 ?auto_148894 ) ( ON ?auto_148896 ?auto_148895 ) ( CLEAR ?auto_148896 ) ( HOLDING ?auto_148897 ) ( CLEAR ?auto_148899 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148900 ?auto_148899 ?auto_148897 )
      ( MAKE-6PILE ?auto_148892 ?auto_148893 ?auto_148894 ?auto_148895 ?auto_148896 ?auto_148897 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148901 - BLOCK
      ?auto_148902 - BLOCK
      ?auto_148903 - BLOCK
      ?auto_148904 - BLOCK
      ?auto_148905 - BLOCK
      ?auto_148906 - BLOCK
    )
    :vars
    (
      ?auto_148907 - BLOCK
      ?auto_148908 - BLOCK
      ?auto_148909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148901 ?auto_148902 ) ) ( not ( = ?auto_148901 ?auto_148903 ) ) ( not ( = ?auto_148901 ?auto_148904 ) ) ( not ( = ?auto_148901 ?auto_148905 ) ) ( not ( = ?auto_148901 ?auto_148906 ) ) ( not ( = ?auto_148902 ?auto_148903 ) ) ( not ( = ?auto_148902 ?auto_148904 ) ) ( not ( = ?auto_148902 ?auto_148905 ) ) ( not ( = ?auto_148902 ?auto_148906 ) ) ( not ( = ?auto_148903 ?auto_148904 ) ) ( not ( = ?auto_148903 ?auto_148905 ) ) ( not ( = ?auto_148903 ?auto_148906 ) ) ( not ( = ?auto_148904 ?auto_148905 ) ) ( not ( = ?auto_148904 ?auto_148906 ) ) ( not ( = ?auto_148905 ?auto_148906 ) ) ( not ( = ?auto_148901 ?auto_148907 ) ) ( not ( = ?auto_148902 ?auto_148907 ) ) ( not ( = ?auto_148903 ?auto_148907 ) ) ( not ( = ?auto_148904 ?auto_148907 ) ) ( not ( = ?auto_148905 ?auto_148907 ) ) ( not ( = ?auto_148906 ?auto_148907 ) ) ( ON-TABLE ?auto_148908 ) ( ON ?auto_148907 ?auto_148908 ) ( not ( = ?auto_148908 ?auto_148907 ) ) ( not ( = ?auto_148908 ?auto_148906 ) ) ( not ( = ?auto_148908 ?auto_148905 ) ) ( not ( = ?auto_148901 ?auto_148908 ) ) ( not ( = ?auto_148902 ?auto_148908 ) ) ( not ( = ?auto_148903 ?auto_148908 ) ) ( not ( = ?auto_148904 ?auto_148908 ) ) ( ON ?auto_148901 ?auto_148909 ) ( not ( = ?auto_148901 ?auto_148909 ) ) ( not ( = ?auto_148902 ?auto_148909 ) ) ( not ( = ?auto_148903 ?auto_148909 ) ) ( not ( = ?auto_148904 ?auto_148909 ) ) ( not ( = ?auto_148905 ?auto_148909 ) ) ( not ( = ?auto_148906 ?auto_148909 ) ) ( not ( = ?auto_148907 ?auto_148909 ) ) ( not ( = ?auto_148908 ?auto_148909 ) ) ( ON ?auto_148902 ?auto_148901 ) ( ON-TABLE ?auto_148909 ) ( ON ?auto_148903 ?auto_148902 ) ( ON ?auto_148904 ?auto_148903 ) ( ON ?auto_148905 ?auto_148904 ) ( CLEAR ?auto_148907 ) ( ON ?auto_148906 ?auto_148905 ) ( CLEAR ?auto_148906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148909 ?auto_148901 ?auto_148902 ?auto_148903 ?auto_148904 ?auto_148905 )
      ( MAKE-6PILE ?auto_148901 ?auto_148902 ?auto_148903 ?auto_148904 ?auto_148905 ?auto_148906 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148910 - BLOCK
      ?auto_148911 - BLOCK
      ?auto_148912 - BLOCK
      ?auto_148913 - BLOCK
      ?auto_148914 - BLOCK
      ?auto_148915 - BLOCK
    )
    :vars
    (
      ?auto_148918 - BLOCK
      ?auto_148917 - BLOCK
      ?auto_148916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148910 ?auto_148911 ) ) ( not ( = ?auto_148910 ?auto_148912 ) ) ( not ( = ?auto_148910 ?auto_148913 ) ) ( not ( = ?auto_148910 ?auto_148914 ) ) ( not ( = ?auto_148910 ?auto_148915 ) ) ( not ( = ?auto_148911 ?auto_148912 ) ) ( not ( = ?auto_148911 ?auto_148913 ) ) ( not ( = ?auto_148911 ?auto_148914 ) ) ( not ( = ?auto_148911 ?auto_148915 ) ) ( not ( = ?auto_148912 ?auto_148913 ) ) ( not ( = ?auto_148912 ?auto_148914 ) ) ( not ( = ?auto_148912 ?auto_148915 ) ) ( not ( = ?auto_148913 ?auto_148914 ) ) ( not ( = ?auto_148913 ?auto_148915 ) ) ( not ( = ?auto_148914 ?auto_148915 ) ) ( not ( = ?auto_148910 ?auto_148918 ) ) ( not ( = ?auto_148911 ?auto_148918 ) ) ( not ( = ?auto_148912 ?auto_148918 ) ) ( not ( = ?auto_148913 ?auto_148918 ) ) ( not ( = ?auto_148914 ?auto_148918 ) ) ( not ( = ?auto_148915 ?auto_148918 ) ) ( ON-TABLE ?auto_148917 ) ( not ( = ?auto_148917 ?auto_148918 ) ) ( not ( = ?auto_148917 ?auto_148915 ) ) ( not ( = ?auto_148917 ?auto_148914 ) ) ( not ( = ?auto_148910 ?auto_148917 ) ) ( not ( = ?auto_148911 ?auto_148917 ) ) ( not ( = ?auto_148912 ?auto_148917 ) ) ( not ( = ?auto_148913 ?auto_148917 ) ) ( ON ?auto_148910 ?auto_148916 ) ( not ( = ?auto_148910 ?auto_148916 ) ) ( not ( = ?auto_148911 ?auto_148916 ) ) ( not ( = ?auto_148912 ?auto_148916 ) ) ( not ( = ?auto_148913 ?auto_148916 ) ) ( not ( = ?auto_148914 ?auto_148916 ) ) ( not ( = ?auto_148915 ?auto_148916 ) ) ( not ( = ?auto_148918 ?auto_148916 ) ) ( not ( = ?auto_148917 ?auto_148916 ) ) ( ON ?auto_148911 ?auto_148910 ) ( ON-TABLE ?auto_148916 ) ( ON ?auto_148912 ?auto_148911 ) ( ON ?auto_148913 ?auto_148912 ) ( ON ?auto_148914 ?auto_148913 ) ( ON ?auto_148915 ?auto_148914 ) ( CLEAR ?auto_148915 ) ( HOLDING ?auto_148918 ) ( CLEAR ?auto_148917 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148917 ?auto_148918 )
      ( MAKE-6PILE ?auto_148910 ?auto_148911 ?auto_148912 ?auto_148913 ?auto_148914 ?auto_148915 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148919 - BLOCK
      ?auto_148920 - BLOCK
      ?auto_148921 - BLOCK
      ?auto_148922 - BLOCK
      ?auto_148923 - BLOCK
      ?auto_148924 - BLOCK
    )
    :vars
    (
      ?auto_148926 - BLOCK
      ?auto_148927 - BLOCK
      ?auto_148925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148919 ?auto_148920 ) ) ( not ( = ?auto_148919 ?auto_148921 ) ) ( not ( = ?auto_148919 ?auto_148922 ) ) ( not ( = ?auto_148919 ?auto_148923 ) ) ( not ( = ?auto_148919 ?auto_148924 ) ) ( not ( = ?auto_148920 ?auto_148921 ) ) ( not ( = ?auto_148920 ?auto_148922 ) ) ( not ( = ?auto_148920 ?auto_148923 ) ) ( not ( = ?auto_148920 ?auto_148924 ) ) ( not ( = ?auto_148921 ?auto_148922 ) ) ( not ( = ?auto_148921 ?auto_148923 ) ) ( not ( = ?auto_148921 ?auto_148924 ) ) ( not ( = ?auto_148922 ?auto_148923 ) ) ( not ( = ?auto_148922 ?auto_148924 ) ) ( not ( = ?auto_148923 ?auto_148924 ) ) ( not ( = ?auto_148919 ?auto_148926 ) ) ( not ( = ?auto_148920 ?auto_148926 ) ) ( not ( = ?auto_148921 ?auto_148926 ) ) ( not ( = ?auto_148922 ?auto_148926 ) ) ( not ( = ?auto_148923 ?auto_148926 ) ) ( not ( = ?auto_148924 ?auto_148926 ) ) ( ON-TABLE ?auto_148927 ) ( not ( = ?auto_148927 ?auto_148926 ) ) ( not ( = ?auto_148927 ?auto_148924 ) ) ( not ( = ?auto_148927 ?auto_148923 ) ) ( not ( = ?auto_148919 ?auto_148927 ) ) ( not ( = ?auto_148920 ?auto_148927 ) ) ( not ( = ?auto_148921 ?auto_148927 ) ) ( not ( = ?auto_148922 ?auto_148927 ) ) ( ON ?auto_148919 ?auto_148925 ) ( not ( = ?auto_148919 ?auto_148925 ) ) ( not ( = ?auto_148920 ?auto_148925 ) ) ( not ( = ?auto_148921 ?auto_148925 ) ) ( not ( = ?auto_148922 ?auto_148925 ) ) ( not ( = ?auto_148923 ?auto_148925 ) ) ( not ( = ?auto_148924 ?auto_148925 ) ) ( not ( = ?auto_148926 ?auto_148925 ) ) ( not ( = ?auto_148927 ?auto_148925 ) ) ( ON ?auto_148920 ?auto_148919 ) ( ON-TABLE ?auto_148925 ) ( ON ?auto_148921 ?auto_148920 ) ( ON ?auto_148922 ?auto_148921 ) ( ON ?auto_148923 ?auto_148922 ) ( ON ?auto_148924 ?auto_148923 ) ( CLEAR ?auto_148927 ) ( ON ?auto_148926 ?auto_148924 ) ( CLEAR ?auto_148926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148925 ?auto_148919 ?auto_148920 ?auto_148921 ?auto_148922 ?auto_148923 ?auto_148924 )
      ( MAKE-6PILE ?auto_148919 ?auto_148920 ?auto_148921 ?auto_148922 ?auto_148923 ?auto_148924 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148928 - BLOCK
      ?auto_148929 - BLOCK
      ?auto_148930 - BLOCK
      ?auto_148931 - BLOCK
      ?auto_148932 - BLOCK
      ?auto_148933 - BLOCK
    )
    :vars
    (
      ?auto_148935 - BLOCK
      ?auto_148936 - BLOCK
      ?auto_148934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148928 ?auto_148929 ) ) ( not ( = ?auto_148928 ?auto_148930 ) ) ( not ( = ?auto_148928 ?auto_148931 ) ) ( not ( = ?auto_148928 ?auto_148932 ) ) ( not ( = ?auto_148928 ?auto_148933 ) ) ( not ( = ?auto_148929 ?auto_148930 ) ) ( not ( = ?auto_148929 ?auto_148931 ) ) ( not ( = ?auto_148929 ?auto_148932 ) ) ( not ( = ?auto_148929 ?auto_148933 ) ) ( not ( = ?auto_148930 ?auto_148931 ) ) ( not ( = ?auto_148930 ?auto_148932 ) ) ( not ( = ?auto_148930 ?auto_148933 ) ) ( not ( = ?auto_148931 ?auto_148932 ) ) ( not ( = ?auto_148931 ?auto_148933 ) ) ( not ( = ?auto_148932 ?auto_148933 ) ) ( not ( = ?auto_148928 ?auto_148935 ) ) ( not ( = ?auto_148929 ?auto_148935 ) ) ( not ( = ?auto_148930 ?auto_148935 ) ) ( not ( = ?auto_148931 ?auto_148935 ) ) ( not ( = ?auto_148932 ?auto_148935 ) ) ( not ( = ?auto_148933 ?auto_148935 ) ) ( not ( = ?auto_148936 ?auto_148935 ) ) ( not ( = ?auto_148936 ?auto_148933 ) ) ( not ( = ?auto_148936 ?auto_148932 ) ) ( not ( = ?auto_148928 ?auto_148936 ) ) ( not ( = ?auto_148929 ?auto_148936 ) ) ( not ( = ?auto_148930 ?auto_148936 ) ) ( not ( = ?auto_148931 ?auto_148936 ) ) ( ON ?auto_148928 ?auto_148934 ) ( not ( = ?auto_148928 ?auto_148934 ) ) ( not ( = ?auto_148929 ?auto_148934 ) ) ( not ( = ?auto_148930 ?auto_148934 ) ) ( not ( = ?auto_148931 ?auto_148934 ) ) ( not ( = ?auto_148932 ?auto_148934 ) ) ( not ( = ?auto_148933 ?auto_148934 ) ) ( not ( = ?auto_148935 ?auto_148934 ) ) ( not ( = ?auto_148936 ?auto_148934 ) ) ( ON ?auto_148929 ?auto_148928 ) ( ON-TABLE ?auto_148934 ) ( ON ?auto_148930 ?auto_148929 ) ( ON ?auto_148931 ?auto_148930 ) ( ON ?auto_148932 ?auto_148931 ) ( ON ?auto_148933 ?auto_148932 ) ( ON ?auto_148935 ?auto_148933 ) ( CLEAR ?auto_148935 ) ( HOLDING ?auto_148936 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148936 )
      ( MAKE-6PILE ?auto_148928 ?auto_148929 ?auto_148930 ?auto_148931 ?auto_148932 ?auto_148933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148937 - BLOCK
      ?auto_148938 - BLOCK
      ?auto_148939 - BLOCK
      ?auto_148940 - BLOCK
      ?auto_148941 - BLOCK
      ?auto_148942 - BLOCK
    )
    :vars
    (
      ?auto_148945 - BLOCK
      ?auto_148944 - BLOCK
      ?auto_148943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_148937 ?auto_148938 ) ) ( not ( = ?auto_148937 ?auto_148939 ) ) ( not ( = ?auto_148937 ?auto_148940 ) ) ( not ( = ?auto_148937 ?auto_148941 ) ) ( not ( = ?auto_148937 ?auto_148942 ) ) ( not ( = ?auto_148938 ?auto_148939 ) ) ( not ( = ?auto_148938 ?auto_148940 ) ) ( not ( = ?auto_148938 ?auto_148941 ) ) ( not ( = ?auto_148938 ?auto_148942 ) ) ( not ( = ?auto_148939 ?auto_148940 ) ) ( not ( = ?auto_148939 ?auto_148941 ) ) ( not ( = ?auto_148939 ?auto_148942 ) ) ( not ( = ?auto_148940 ?auto_148941 ) ) ( not ( = ?auto_148940 ?auto_148942 ) ) ( not ( = ?auto_148941 ?auto_148942 ) ) ( not ( = ?auto_148937 ?auto_148945 ) ) ( not ( = ?auto_148938 ?auto_148945 ) ) ( not ( = ?auto_148939 ?auto_148945 ) ) ( not ( = ?auto_148940 ?auto_148945 ) ) ( not ( = ?auto_148941 ?auto_148945 ) ) ( not ( = ?auto_148942 ?auto_148945 ) ) ( not ( = ?auto_148944 ?auto_148945 ) ) ( not ( = ?auto_148944 ?auto_148942 ) ) ( not ( = ?auto_148944 ?auto_148941 ) ) ( not ( = ?auto_148937 ?auto_148944 ) ) ( not ( = ?auto_148938 ?auto_148944 ) ) ( not ( = ?auto_148939 ?auto_148944 ) ) ( not ( = ?auto_148940 ?auto_148944 ) ) ( ON ?auto_148937 ?auto_148943 ) ( not ( = ?auto_148937 ?auto_148943 ) ) ( not ( = ?auto_148938 ?auto_148943 ) ) ( not ( = ?auto_148939 ?auto_148943 ) ) ( not ( = ?auto_148940 ?auto_148943 ) ) ( not ( = ?auto_148941 ?auto_148943 ) ) ( not ( = ?auto_148942 ?auto_148943 ) ) ( not ( = ?auto_148945 ?auto_148943 ) ) ( not ( = ?auto_148944 ?auto_148943 ) ) ( ON ?auto_148938 ?auto_148937 ) ( ON-TABLE ?auto_148943 ) ( ON ?auto_148939 ?auto_148938 ) ( ON ?auto_148940 ?auto_148939 ) ( ON ?auto_148941 ?auto_148940 ) ( ON ?auto_148942 ?auto_148941 ) ( ON ?auto_148945 ?auto_148942 ) ( ON ?auto_148944 ?auto_148945 ) ( CLEAR ?auto_148944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148943 ?auto_148937 ?auto_148938 ?auto_148939 ?auto_148940 ?auto_148941 ?auto_148942 ?auto_148945 )
      ( MAKE-6PILE ?auto_148937 ?auto_148938 ?auto_148939 ?auto_148940 ?auto_148941 ?auto_148942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148947 - BLOCK
    )
    :vars
    (
      ?auto_148948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148948 ?auto_148947 ) ( CLEAR ?auto_148948 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148947 ) ( not ( = ?auto_148947 ?auto_148948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148948 ?auto_148947 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148949 - BLOCK
    )
    :vars
    (
      ?auto_148950 - BLOCK
      ?auto_148951 - BLOCK
      ?auto_148952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148950 ?auto_148949 ) ( CLEAR ?auto_148950 ) ( ON-TABLE ?auto_148949 ) ( not ( = ?auto_148949 ?auto_148950 ) ) ( HOLDING ?auto_148951 ) ( CLEAR ?auto_148952 ) ( not ( = ?auto_148949 ?auto_148951 ) ) ( not ( = ?auto_148949 ?auto_148952 ) ) ( not ( = ?auto_148950 ?auto_148951 ) ) ( not ( = ?auto_148950 ?auto_148952 ) ) ( not ( = ?auto_148951 ?auto_148952 ) ) )
    :subtasks
    ( ( !STACK ?auto_148951 ?auto_148952 )
      ( MAKE-1PILE ?auto_148949 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148953 - BLOCK
    )
    :vars
    (
      ?auto_148956 - BLOCK
      ?auto_148954 - BLOCK
      ?auto_148955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148956 ?auto_148953 ) ( ON-TABLE ?auto_148953 ) ( not ( = ?auto_148953 ?auto_148956 ) ) ( CLEAR ?auto_148954 ) ( not ( = ?auto_148953 ?auto_148955 ) ) ( not ( = ?auto_148953 ?auto_148954 ) ) ( not ( = ?auto_148956 ?auto_148955 ) ) ( not ( = ?auto_148956 ?auto_148954 ) ) ( not ( = ?auto_148955 ?auto_148954 ) ) ( ON ?auto_148955 ?auto_148956 ) ( CLEAR ?auto_148955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148953 ?auto_148956 )
      ( MAKE-1PILE ?auto_148953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148957 - BLOCK
    )
    :vars
    (
      ?auto_148958 - BLOCK
      ?auto_148959 - BLOCK
      ?auto_148960 - BLOCK
      ?auto_148962 - BLOCK
      ?auto_148963 - BLOCK
      ?auto_148964 - BLOCK
      ?auto_148961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148958 ?auto_148957 ) ( ON-TABLE ?auto_148957 ) ( not ( = ?auto_148957 ?auto_148958 ) ) ( not ( = ?auto_148957 ?auto_148959 ) ) ( not ( = ?auto_148957 ?auto_148960 ) ) ( not ( = ?auto_148958 ?auto_148959 ) ) ( not ( = ?auto_148958 ?auto_148960 ) ) ( not ( = ?auto_148959 ?auto_148960 ) ) ( ON ?auto_148959 ?auto_148958 ) ( CLEAR ?auto_148959 ) ( HOLDING ?auto_148960 ) ( CLEAR ?auto_148962 ) ( ON-TABLE ?auto_148963 ) ( ON ?auto_148964 ?auto_148963 ) ( ON ?auto_148961 ?auto_148964 ) ( ON ?auto_148962 ?auto_148961 ) ( not ( = ?auto_148963 ?auto_148964 ) ) ( not ( = ?auto_148963 ?auto_148961 ) ) ( not ( = ?auto_148963 ?auto_148962 ) ) ( not ( = ?auto_148963 ?auto_148960 ) ) ( not ( = ?auto_148964 ?auto_148961 ) ) ( not ( = ?auto_148964 ?auto_148962 ) ) ( not ( = ?auto_148964 ?auto_148960 ) ) ( not ( = ?auto_148961 ?auto_148962 ) ) ( not ( = ?auto_148961 ?auto_148960 ) ) ( not ( = ?auto_148962 ?auto_148960 ) ) ( not ( = ?auto_148957 ?auto_148962 ) ) ( not ( = ?auto_148957 ?auto_148963 ) ) ( not ( = ?auto_148957 ?auto_148964 ) ) ( not ( = ?auto_148957 ?auto_148961 ) ) ( not ( = ?auto_148958 ?auto_148962 ) ) ( not ( = ?auto_148958 ?auto_148963 ) ) ( not ( = ?auto_148958 ?auto_148964 ) ) ( not ( = ?auto_148958 ?auto_148961 ) ) ( not ( = ?auto_148959 ?auto_148962 ) ) ( not ( = ?auto_148959 ?auto_148963 ) ) ( not ( = ?auto_148959 ?auto_148964 ) ) ( not ( = ?auto_148959 ?auto_148961 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148963 ?auto_148964 ?auto_148961 ?auto_148962 ?auto_148960 )
      ( MAKE-1PILE ?auto_148957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148965 - BLOCK
    )
    :vars
    (
      ?auto_148970 - BLOCK
      ?auto_148972 - BLOCK
      ?auto_148971 - BLOCK
      ?auto_148968 - BLOCK
      ?auto_148966 - BLOCK
      ?auto_148969 - BLOCK
      ?auto_148967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148970 ?auto_148965 ) ( ON-TABLE ?auto_148965 ) ( not ( = ?auto_148965 ?auto_148970 ) ) ( not ( = ?auto_148965 ?auto_148972 ) ) ( not ( = ?auto_148965 ?auto_148971 ) ) ( not ( = ?auto_148970 ?auto_148972 ) ) ( not ( = ?auto_148970 ?auto_148971 ) ) ( not ( = ?auto_148972 ?auto_148971 ) ) ( ON ?auto_148972 ?auto_148970 ) ( CLEAR ?auto_148968 ) ( ON-TABLE ?auto_148966 ) ( ON ?auto_148969 ?auto_148966 ) ( ON ?auto_148967 ?auto_148969 ) ( ON ?auto_148968 ?auto_148967 ) ( not ( = ?auto_148966 ?auto_148969 ) ) ( not ( = ?auto_148966 ?auto_148967 ) ) ( not ( = ?auto_148966 ?auto_148968 ) ) ( not ( = ?auto_148966 ?auto_148971 ) ) ( not ( = ?auto_148969 ?auto_148967 ) ) ( not ( = ?auto_148969 ?auto_148968 ) ) ( not ( = ?auto_148969 ?auto_148971 ) ) ( not ( = ?auto_148967 ?auto_148968 ) ) ( not ( = ?auto_148967 ?auto_148971 ) ) ( not ( = ?auto_148968 ?auto_148971 ) ) ( not ( = ?auto_148965 ?auto_148968 ) ) ( not ( = ?auto_148965 ?auto_148966 ) ) ( not ( = ?auto_148965 ?auto_148969 ) ) ( not ( = ?auto_148965 ?auto_148967 ) ) ( not ( = ?auto_148970 ?auto_148968 ) ) ( not ( = ?auto_148970 ?auto_148966 ) ) ( not ( = ?auto_148970 ?auto_148969 ) ) ( not ( = ?auto_148970 ?auto_148967 ) ) ( not ( = ?auto_148972 ?auto_148968 ) ) ( not ( = ?auto_148972 ?auto_148966 ) ) ( not ( = ?auto_148972 ?auto_148969 ) ) ( not ( = ?auto_148972 ?auto_148967 ) ) ( ON ?auto_148971 ?auto_148972 ) ( CLEAR ?auto_148971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148965 ?auto_148970 ?auto_148972 )
      ( MAKE-1PILE ?auto_148965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148973 - BLOCK
    )
    :vars
    (
      ?auto_148979 - BLOCK
      ?auto_148976 - BLOCK
      ?auto_148975 - BLOCK
      ?auto_148977 - BLOCK
      ?auto_148978 - BLOCK
      ?auto_148974 - BLOCK
      ?auto_148980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148979 ?auto_148973 ) ( ON-TABLE ?auto_148973 ) ( not ( = ?auto_148973 ?auto_148979 ) ) ( not ( = ?auto_148973 ?auto_148976 ) ) ( not ( = ?auto_148973 ?auto_148975 ) ) ( not ( = ?auto_148979 ?auto_148976 ) ) ( not ( = ?auto_148979 ?auto_148975 ) ) ( not ( = ?auto_148976 ?auto_148975 ) ) ( ON ?auto_148976 ?auto_148979 ) ( ON-TABLE ?auto_148977 ) ( ON ?auto_148978 ?auto_148977 ) ( ON ?auto_148974 ?auto_148978 ) ( not ( = ?auto_148977 ?auto_148978 ) ) ( not ( = ?auto_148977 ?auto_148974 ) ) ( not ( = ?auto_148977 ?auto_148980 ) ) ( not ( = ?auto_148977 ?auto_148975 ) ) ( not ( = ?auto_148978 ?auto_148974 ) ) ( not ( = ?auto_148978 ?auto_148980 ) ) ( not ( = ?auto_148978 ?auto_148975 ) ) ( not ( = ?auto_148974 ?auto_148980 ) ) ( not ( = ?auto_148974 ?auto_148975 ) ) ( not ( = ?auto_148980 ?auto_148975 ) ) ( not ( = ?auto_148973 ?auto_148980 ) ) ( not ( = ?auto_148973 ?auto_148977 ) ) ( not ( = ?auto_148973 ?auto_148978 ) ) ( not ( = ?auto_148973 ?auto_148974 ) ) ( not ( = ?auto_148979 ?auto_148980 ) ) ( not ( = ?auto_148979 ?auto_148977 ) ) ( not ( = ?auto_148979 ?auto_148978 ) ) ( not ( = ?auto_148979 ?auto_148974 ) ) ( not ( = ?auto_148976 ?auto_148980 ) ) ( not ( = ?auto_148976 ?auto_148977 ) ) ( not ( = ?auto_148976 ?auto_148978 ) ) ( not ( = ?auto_148976 ?auto_148974 ) ) ( ON ?auto_148975 ?auto_148976 ) ( CLEAR ?auto_148975 ) ( HOLDING ?auto_148980 ) ( CLEAR ?auto_148974 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148977 ?auto_148978 ?auto_148974 ?auto_148980 )
      ( MAKE-1PILE ?auto_148973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148981 - BLOCK
    )
    :vars
    (
      ?auto_148984 - BLOCK
      ?auto_148985 - BLOCK
      ?auto_148988 - BLOCK
      ?auto_148986 - BLOCK
      ?auto_148982 - BLOCK
      ?auto_148987 - BLOCK
      ?auto_148983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148984 ?auto_148981 ) ( ON-TABLE ?auto_148981 ) ( not ( = ?auto_148981 ?auto_148984 ) ) ( not ( = ?auto_148981 ?auto_148985 ) ) ( not ( = ?auto_148981 ?auto_148988 ) ) ( not ( = ?auto_148984 ?auto_148985 ) ) ( not ( = ?auto_148984 ?auto_148988 ) ) ( not ( = ?auto_148985 ?auto_148988 ) ) ( ON ?auto_148985 ?auto_148984 ) ( ON-TABLE ?auto_148986 ) ( ON ?auto_148982 ?auto_148986 ) ( ON ?auto_148987 ?auto_148982 ) ( not ( = ?auto_148986 ?auto_148982 ) ) ( not ( = ?auto_148986 ?auto_148987 ) ) ( not ( = ?auto_148986 ?auto_148983 ) ) ( not ( = ?auto_148986 ?auto_148988 ) ) ( not ( = ?auto_148982 ?auto_148987 ) ) ( not ( = ?auto_148982 ?auto_148983 ) ) ( not ( = ?auto_148982 ?auto_148988 ) ) ( not ( = ?auto_148987 ?auto_148983 ) ) ( not ( = ?auto_148987 ?auto_148988 ) ) ( not ( = ?auto_148983 ?auto_148988 ) ) ( not ( = ?auto_148981 ?auto_148983 ) ) ( not ( = ?auto_148981 ?auto_148986 ) ) ( not ( = ?auto_148981 ?auto_148982 ) ) ( not ( = ?auto_148981 ?auto_148987 ) ) ( not ( = ?auto_148984 ?auto_148983 ) ) ( not ( = ?auto_148984 ?auto_148986 ) ) ( not ( = ?auto_148984 ?auto_148982 ) ) ( not ( = ?auto_148984 ?auto_148987 ) ) ( not ( = ?auto_148985 ?auto_148983 ) ) ( not ( = ?auto_148985 ?auto_148986 ) ) ( not ( = ?auto_148985 ?auto_148982 ) ) ( not ( = ?auto_148985 ?auto_148987 ) ) ( ON ?auto_148988 ?auto_148985 ) ( CLEAR ?auto_148987 ) ( ON ?auto_148983 ?auto_148988 ) ( CLEAR ?auto_148983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148981 ?auto_148984 ?auto_148985 ?auto_148988 )
      ( MAKE-1PILE ?auto_148981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148989 - BLOCK
    )
    :vars
    (
      ?auto_148993 - BLOCK
      ?auto_148991 - BLOCK
      ?auto_148995 - BLOCK
      ?auto_148994 - BLOCK
      ?auto_148996 - BLOCK
      ?auto_148992 - BLOCK
      ?auto_148990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148993 ?auto_148989 ) ( ON-TABLE ?auto_148989 ) ( not ( = ?auto_148989 ?auto_148993 ) ) ( not ( = ?auto_148989 ?auto_148991 ) ) ( not ( = ?auto_148989 ?auto_148995 ) ) ( not ( = ?auto_148993 ?auto_148991 ) ) ( not ( = ?auto_148993 ?auto_148995 ) ) ( not ( = ?auto_148991 ?auto_148995 ) ) ( ON ?auto_148991 ?auto_148993 ) ( ON-TABLE ?auto_148994 ) ( ON ?auto_148996 ?auto_148994 ) ( not ( = ?auto_148994 ?auto_148996 ) ) ( not ( = ?auto_148994 ?auto_148992 ) ) ( not ( = ?auto_148994 ?auto_148990 ) ) ( not ( = ?auto_148994 ?auto_148995 ) ) ( not ( = ?auto_148996 ?auto_148992 ) ) ( not ( = ?auto_148996 ?auto_148990 ) ) ( not ( = ?auto_148996 ?auto_148995 ) ) ( not ( = ?auto_148992 ?auto_148990 ) ) ( not ( = ?auto_148992 ?auto_148995 ) ) ( not ( = ?auto_148990 ?auto_148995 ) ) ( not ( = ?auto_148989 ?auto_148990 ) ) ( not ( = ?auto_148989 ?auto_148994 ) ) ( not ( = ?auto_148989 ?auto_148996 ) ) ( not ( = ?auto_148989 ?auto_148992 ) ) ( not ( = ?auto_148993 ?auto_148990 ) ) ( not ( = ?auto_148993 ?auto_148994 ) ) ( not ( = ?auto_148993 ?auto_148996 ) ) ( not ( = ?auto_148993 ?auto_148992 ) ) ( not ( = ?auto_148991 ?auto_148990 ) ) ( not ( = ?auto_148991 ?auto_148994 ) ) ( not ( = ?auto_148991 ?auto_148996 ) ) ( not ( = ?auto_148991 ?auto_148992 ) ) ( ON ?auto_148995 ?auto_148991 ) ( ON ?auto_148990 ?auto_148995 ) ( CLEAR ?auto_148990 ) ( HOLDING ?auto_148992 ) ( CLEAR ?auto_148996 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148994 ?auto_148996 ?auto_148992 )
      ( MAKE-1PILE ?auto_148989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_148997 - BLOCK
    )
    :vars
    (
      ?auto_148999 - BLOCK
      ?auto_149004 - BLOCK
      ?auto_149001 - BLOCK
      ?auto_149003 - BLOCK
      ?auto_149000 - BLOCK
      ?auto_148998 - BLOCK
      ?auto_149002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148999 ?auto_148997 ) ( ON-TABLE ?auto_148997 ) ( not ( = ?auto_148997 ?auto_148999 ) ) ( not ( = ?auto_148997 ?auto_149004 ) ) ( not ( = ?auto_148997 ?auto_149001 ) ) ( not ( = ?auto_148999 ?auto_149004 ) ) ( not ( = ?auto_148999 ?auto_149001 ) ) ( not ( = ?auto_149004 ?auto_149001 ) ) ( ON ?auto_149004 ?auto_148999 ) ( ON-TABLE ?auto_149003 ) ( ON ?auto_149000 ?auto_149003 ) ( not ( = ?auto_149003 ?auto_149000 ) ) ( not ( = ?auto_149003 ?auto_148998 ) ) ( not ( = ?auto_149003 ?auto_149002 ) ) ( not ( = ?auto_149003 ?auto_149001 ) ) ( not ( = ?auto_149000 ?auto_148998 ) ) ( not ( = ?auto_149000 ?auto_149002 ) ) ( not ( = ?auto_149000 ?auto_149001 ) ) ( not ( = ?auto_148998 ?auto_149002 ) ) ( not ( = ?auto_148998 ?auto_149001 ) ) ( not ( = ?auto_149002 ?auto_149001 ) ) ( not ( = ?auto_148997 ?auto_149002 ) ) ( not ( = ?auto_148997 ?auto_149003 ) ) ( not ( = ?auto_148997 ?auto_149000 ) ) ( not ( = ?auto_148997 ?auto_148998 ) ) ( not ( = ?auto_148999 ?auto_149002 ) ) ( not ( = ?auto_148999 ?auto_149003 ) ) ( not ( = ?auto_148999 ?auto_149000 ) ) ( not ( = ?auto_148999 ?auto_148998 ) ) ( not ( = ?auto_149004 ?auto_149002 ) ) ( not ( = ?auto_149004 ?auto_149003 ) ) ( not ( = ?auto_149004 ?auto_149000 ) ) ( not ( = ?auto_149004 ?auto_148998 ) ) ( ON ?auto_149001 ?auto_149004 ) ( ON ?auto_149002 ?auto_149001 ) ( CLEAR ?auto_149000 ) ( ON ?auto_148998 ?auto_149002 ) ( CLEAR ?auto_148998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148997 ?auto_148999 ?auto_149004 ?auto_149001 ?auto_149002 )
      ( MAKE-1PILE ?auto_148997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149005 - BLOCK
    )
    :vars
    (
      ?auto_149006 - BLOCK
      ?auto_149007 - BLOCK
      ?auto_149010 - BLOCK
      ?auto_149012 - BLOCK
      ?auto_149008 - BLOCK
      ?auto_149011 - BLOCK
      ?auto_149009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149006 ?auto_149005 ) ( ON-TABLE ?auto_149005 ) ( not ( = ?auto_149005 ?auto_149006 ) ) ( not ( = ?auto_149005 ?auto_149007 ) ) ( not ( = ?auto_149005 ?auto_149010 ) ) ( not ( = ?auto_149006 ?auto_149007 ) ) ( not ( = ?auto_149006 ?auto_149010 ) ) ( not ( = ?auto_149007 ?auto_149010 ) ) ( ON ?auto_149007 ?auto_149006 ) ( ON-TABLE ?auto_149012 ) ( not ( = ?auto_149012 ?auto_149008 ) ) ( not ( = ?auto_149012 ?auto_149011 ) ) ( not ( = ?auto_149012 ?auto_149009 ) ) ( not ( = ?auto_149012 ?auto_149010 ) ) ( not ( = ?auto_149008 ?auto_149011 ) ) ( not ( = ?auto_149008 ?auto_149009 ) ) ( not ( = ?auto_149008 ?auto_149010 ) ) ( not ( = ?auto_149011 ?auto_149009 ) ) ( not ( = ?auto_149011 ?auto_149010 ) ) ( not ( = ?auto_149009 ?auto_149010 ) ) ( not ( = ?auto_149005 ?auto_149009 ) ) ( not ( = ?auto_149005 ?auto_149012 ) ) ( not ( = ?auto_149005 ?auto_149008 ) ) ( not ( = ?auto_149005 ?auto_149011 ) ) ( not ( = ?auto_149006 ?auto_149009 ) ) ( not ( = ?auto_149006 ?auto_149012 ) ) ( not ( = ?auto_149006 ?auto_149008 ) ) ( not ( = ?auto_149006 ?auto_149011 ) ) ( not ( = ?auto_149007 ?auto_149009 ) ) ( not ( = ?auto_149007 ?auto_149012 ) ) ( not ( = ?auto_149007 ?auto_149008 ) ) ( not ( = ?auto_149007 ?auto_149011 ) ) ( ON ?auto_149010 ?auto_149007 ) ( ON ?auto_149009 ?auto_149010 ) ( ON ?auto_149011 ?auto_149009 ) ( CLEAR ?auto_149011 ) ( HOLDING ?auto_149008 ) ( CLEAR ?auto_149012 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149012 ?auto_149008 )
      ( MAKE-1PILE ?auto_149005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149013 - BLOCK
    )
    :vars
    (
      ?auto_149017 - BLOCK
      ?auto_149014 - BLOCK
      ?auto_149020 - BLOCK
      ?auto_149019 - BLOCK
      ?auto_149016 - BLOCK
      ?auto_149018 - BLOCK
      ?auto_149015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149017 ?auto_149013 ) ( ON-TABLE ?auto_149013 ) ( not ( = ?auto_149013 ?auto_149017 ) ) ( not ( = ?auto_149013 ?auto_149014 ) ) ( not ( = ?auto_149013 ?auto_149020 ) ) ( not ( = ?auto_149017 ?auto_149014 ) ) ( not ( = ?auto_149017 ?auto_149020 ) ) ( not ( = ?auto_149014 ?auto_149020 ) ) ( ON ?auto_149014 ?auto_149017 ) ( ON-TABLE ?auto_149019 ) ( not ( = ?auto_149019 ?auto_149016 ) ) ( not ( = ?auto_149019 ?auto_149018 ) ) ( not ( = ?auto_149019 ?auto_149015 ) ) ( not ( = ?auto_149019 ?auto_149020 ) ) ( not ( = ?auto_149016 ?auto_149018 ) ) ( not ( = ?auto_149016 ?auto_149015 ) ) ( not ( = ?auto_149016 ?auto_149020 ) ) ( not ( = ?auto_149018 ?auto_149015 ) ) ( not ( = ?auto_149018 ?auto_149020 ) ) ( not ( = ?auto_149015 ?auto_149020 ) ) ( not ( = ?auto_149013 ?auto_149015 ) ) ( not ( = ?auto_149013 ?auto_149019 ) ) ( not ( = ?auto_149013 ?auto_149016 ) ) ( not ( = ?auto_149013 ?auto_149018 ) ) ( not ( = ?auto_149017 ?auto_149015 ) ) ( not ( = ?auto_149017 ?auto_149019 ) ) ( not ( = ?auto_149017 ?auto_149016 ) ) ( not ( = ?auto_149017 ?auto_149018 ) ) ( not ( = ?auto_149014 ?auto_149015 ) ) ( not ( = ?auto_149014 ?auto_149019 ) ) ( not ( = ?auto_149014 ?auto_149016 ) ) ( not ( = ?auto_149014 ?auto_149018 ) ) ( ON ?auto_149020 ?auto_149014 ) ( ON ?auto_149015 ?auto_149020 ) ( ON ?auto_149018 ?auto_149015 ) ( CLEAR ?auto_149019 ) ( ON ?auto_149016 ?auto_149018 ) ( CLEAR ?auto_149016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149013 ?auto_149017 ?auto_149014 ?auto_149020 ?auto_149015 ?auto_149018 )
      ( MAKE-1PILE ?auto_149013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149021 - BLOCK
    )
    :vars
    (
      ?auto_149022 - BLOCK
      ?auto_149023 - BLOCK
      ?auto_149028 - BLOCK
      ?auto_149026 - BLOCK
      ?auto_149027 - BLOCK
      ?auto_149025 - BLOCK
      ?auto_149024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149022 ?auto_149021 ) ( ON-TABLE ?auto_149021 ) ( not ( = ?auto_149021 ?auto_149022 ) ) ( not ( = ?auto_149021 ?auto_149023 ) ) ( not ( = ?auto_149021 ?auto_149028 ) ) ( not ( = ?auto_149022 ?auto_149023 ) ) ( not ( = ?auto_149022 ?auto_149028 ) ) ( not ( = ?auto_149023 ?auto_149028 ) ) ( ON ?auto_149023 ?auto_149022 ) ( not ( = ?auto_149026 ?auto_149027 ) ) ( not ( = ?auto_149026 ?auto_149025 ) ) ( not ( = ?auto_149026 ?auto_149024 ) ) ( not ( = ?auto_149026 ?auto_149028 ) ) ( not ( = ?auto_149027 ?auto_149025 ) ) ( not ( = ?auto_149027 ?auto_149024 ) ) ( not ( = ?auto_149027 ?auto_149028 ) ) ( not ( = ?auto_149025 ?auto_149024 ) ) ( not ( = ?auto_149025 ?auto_149028 ) ) ( not ( = ?auto_149024 ?auto_149028 ) ) ( not ( = ?auto_149021 ?auto_149024 ) ) ( not ( = ?auto_149021 ?auto_149026 ) ) ( not ( = ?auto_149021 ?auto_149027 ) ) ( not ( = ?auto_149021 ?auto_149025 ) ) ( not ( = ?auto_149022 ?auto_149024 ) ) ( not ( = ?auto_149022 ?auto_149026 ) ) ( not ( = ?auto_149022 ?auto_149027 ) ) ( not ( = ?auto_149022 ?auto_149025 ) ) ( not ( = ?auto_149023 ?auto_149024 ) ) ( not ( = ?auto_149023 ?auto_149026 ) ) ( not ( = ?auto_149023 ?auto_149027 ) ) ( not ( = ?auto_149023 ?auto_149025 ) ) ( ON ?auto_149028 ?auto_149023 ) ( ON ?auto_149024 ?auto_149028 ) ( ON ?auto_149025 ?auto_149024 ) ( ON ?auto_149027 ?auto_149025 ) ( CLEAR ?auto_149027 ) ( HOLDING ?auto_149026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149026 )
      ( MAKE-1PILE ?auto_149021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149029 - BLOCK
    )
    :vars
    (
      ?auto_149034 - BLOCK
      ?auto_149036 - BLOCK
      ?auto_149030 - BLOCK
      ?auto_149035 - BLOCK
      ?auto_149033 - BLOCK
      ?auto_149032 - BLOCK
      ?auto_149031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149034 ?auto_149029 ) ( ON-TABLE ?auto_149029 ) ( not ( = ?auto_149029 ?auto_149034 ) ) ( not ( = ?auto_149029 ?auto_149036 ) ) ( not ( = ?auto_149029 ?auto_149030 ) ) ( not ( = ?auto_149034 ?auto_149036 ) ) ( not ( = ?auto_149034 ?auto_149030 ) ) ( not ( = ?auto_149036 ?auto_149030 ) ) ( ON ?auto_149036 ?auto_149034 ) ( not ( = ?auto_149035 ?auto_149033 ) ) ( not ( = ?auto_149035 ?auto_149032 ) ) ( not ( = ?auto_149035 ?auto_149031 ) ) ( not ( = ?auto_149035 ?auto_149030 ) ) ( not ( = ?auto_149033 ?auto_149032 ) ) ( not ( = ?auto_149033 ?auto_149031 ) ) ( not ( = ?auto_149033 ?auto_149030 ) ) ( not ( = ?auto_149032 ?auto_149031 ) ) ( not ( = ?auto_149032 ?auto_149030 ) ) ( not ( = ?auto_149031 ?auto_149030 ) ) ( not ( = ?auto_149029 ?auto_149031 ) ) ( not ( = ?auto_149029 ?auto_149035 ) ) ( not ( = ?auto_149029 ?auto_149033 ) ) ( not ( = ?auto_149029 ?auto_149032 ) ) ( not ( = ?auto_149034 ?auto_149031 ) ) ( not ( = ?auto_149034 ?auto_149035 ) ) ( not ( = ?auto_149034 ?auto_149033 ) ) ( not ( = ?auto_149034 ?auto_149032 ) ) ( not ( = ?auto_149036 ?auto_149031 ) ) ( not ( = ?auto_149036 ?auto_149035 ) ) ( not ( = ?auto_149036 ?auto_149033 ) ) ( not ( = ?auto_149036 ?auto_149032 ) ) ( ON ?auto_149030 ?auto_149036 ) ( ON ?auto_149031 ?auto_149030 ) ( ON ?auto_149032 ?auto_149031 ) ( ON ?auto_149033 ?auto_149032 ) ( ON ?auto_149035 ?auto_149033 ) ( CLEAR ?auto_149035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149029 ?auto_149034 ?auto_149036 ?auto_149030 ?auto_149031 ?auto_149032 ?auto_149033 )
      ( MAKE-1PILE ?auto_149029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149037 - BLOCK
    )
    :vars
    (
      ?auto_149044 - BLOCK
      ?auto_149039 - BLOCK
      ?auto_149043 - BLOCK
      ?auto_149040 - BLOCK
      ?auto_149042 - BLOCK
      ?auto_149038 - BLOCK
      ?auto_149041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149044 ?auto_149037 ) ( ON-TABLE ?auto_149037 ) ( not ( = ?auto_149037 ?auto_149044 ) ) ( not ( = ?auto_149037 ?auto_149039 ) ) ( not ( = ?auto_149037 ?auto_149043 ) ) ( not ( = ?auto_149044 ?auto_149039 ) ) ( not ( = ?auto_149044 ?auto_149043 ) ) ( not ( = ?auto_149039 ?auto_149043 ) ) ( ON ?auto_149039 ?auto_149044 ) ( not ( = ?auto_149040 ?auto_149042 ) ) ( not ( = ?auto_149040 ?auto_149038 ) ) ( not ( = ?auto_149040 ?auto_149041 ) ) ( not ( = ?auto_149040 ?auto_149043 ) ) ( not ( = ?auto_149042 ?auto_149038 ) ) ( not ( = ?auto_149042 ?auto_149041 ) ) ( not ( = ?auto_149042 ?auto_149043 ) ) ( not ( = ?auto_149038 ?auto_149041 ) ) ( not ( = ?auto_149038 ?auto_149043 ) ) ( not ( = ?auto_149041 ?auto_149043 ) ) ( not ( = ?auto_149037 ?auto_149041 ) ) ( not ( = ?auto_149037 ?auto_149040 ) ) ( not ( = ?auto_149037 ?auto_149042 ) ) ( not ( = ?auto_149037 ?auto_149038 ) ) ( not ( = ?auto_149044 ?auto_149041 ) ) ( not ( = ?auto_149044 ?auto_149040 ) ) ( not ( = ?auto_149044 ?auto_149042 ) ) ( not ( = ?auto_149044 ?auto_149038 ) ) ( not ( = ?auto_149039 ?auto_149041 ) ) ( not ( = ?auto_149039 ?auto_149040 ) ) ( not ( = ?auto_149039 ?auto_149042 ) ) ( not ( = ?auto_149039 ?auto_149038 ) ) ( ON ?auto_149043 ?auto_149039 ) ( ON ?auto_149041 ?auto_149043 ) ( ON ?auto_149038 ?auto_149041 ) ( ON ?auto_149042 ?auto_149038 ) ( HOLDING ?auto_149040 ) ( CLEAR ?auto_149042 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149037 ?auto_149044 ?auto_149039 ?auto_149043 ?auto_149041 ?auto_149038 ?auto_149042 ?auto_149040 )
      ( MAKE-1PILE ?auto_149037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149045 - BLOCK
    )
    :vars
    (
      ?auto_149050 - BLOCK
      ?auto_149046 - BLOCK
      ?auto_149052 - BLOCK
      ?auto_149047 - BLOCK
      ?auto_149051 - BLOCK
      ?auto_149048 - BLOCK
      ?auto_149049 - BLOCK
      ?auto_149053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149050 ?auto_149045 ) ( ON-TABLE ?auto_149045 ) ( not ( = ?auto_149045 ?auto_149050 ) ) ( not ( = ?auto_149045 ?auto_149046 ) ) ( not ( = ?auto_149045 ?auto_149052 ) ) ( not ( = ?auto_149050 ?auto_149046 ) ) ( not ( = ?auto_149050 ?auto_149052 ) ) ( not ( = ?auto_149046 ?auto_149052 ) ) ( ON ?auto_149046 ?auto_149050 ) ( not ( = ?auto_149047 ?auto_149051 ) ) ( not ( = ?auto_149047 ?auto_149048 ) ) ( not ( = ?auto_149047 ?auto_149049 ) ) ( not ( = ?auto_149047 ?auto_149052 ) ) ( not ( = ?auto_149051 ?auto_149048 ) ) ( not ( = ?auto_149051 ?auto_149049 ) ) ( not ( = ?auto_149051 ?auto_149052 ) ) ( not ( = ?auto_149048 ?auto_149049 ) ) ( not ( = ?auto_149048 ?auto_149052 ) ) ( not ( = ?auto_149049 ?auto_149052 ) ) ( not ( = ?auto_149045 ?auto_149049 ) ) ( not ( = ?auto_149045 ?auto_149047 ) ) ( not ( = ?auto_149045 ?auto_149051 ) ) ( not ( = ?auto_149045 ?auto_149048 ) ) ( not ( = ?auto_149050 ?auto_149049 ) ) ( not ( = ?auto_149050 ?auto_149047 ) ) ( not ( = ?auto_149050 ?auto_149051 ) ) ( not ( = ?auto_149050 ?auto_149048 ) ) ( not ( = ?auto_149046 ?auto_149049 ) ) ( not ( = ?auto_149046 ?auto_149047 ) ) ( not ( = ?auto_149046 ?auto_149051 ) ) ( not ( = ?auto_149046 ?auto_149048 ) ) ( ON ?auto_149052 ?auto_149046 ) ( ON ?auto_149049 ?auto_149052 ) ( ON ?auto_149048 ?auto_149049 ) ( ON ?auto_149051 ?auto_149048 ) ( CLEAR ?auto_149051 ) ( ON ?auto_149047 ?auto_149053 ) ( CLEAR ?auto_149047 ) ( HAND-EMPTY ) ( not ( = ?auto_149045 ?auto_149053 ) ) ( not ( = ?auto_149050 ?auto_149053 ) ) ( not ( = ?auto_149046 ?auto_149053 ) ) ( not ( = ?auto_149052 ?auto_149053 ) ) ( not ( = ?auto_149047 ?auto_149053 ) ) ( not ( = ?auto_149051 ?auto_149053 ) ) ( not ( = ?auto_149048 ?auto_149053 ) ) ( not ( = ?auto_149049 ?auto_149053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149047 ?auto_149053 )
      ( MAKE-1PILE ?auto_149045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149054 - BLOCK
    )
    :vars
    (
      ?auto_149061 - BLOCK
      ?auto_149062 - BLOCK
      ?auto_149055 - BLOCK
      ?auto_149060 - BLOCK
      ?auto_149057 - BLOCK
      ?auto_149059 - BLOCK
      ?auto_149058 - BLOCK
      ?auto_149056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149061 ?auto_149054 ) ( ON-TABLE ?auto_149054 ) ( not ( = ?auto_149054 ?auto_149061 ) ) ( not ( = ?auto_149054 ?auto_149062 ) ) ( not ( = ?auto_149054 ?auto_149055 ) ) ( not ( = ?auto_149061 ?auto_149062 ) ) ( not ( = ?auto_149061 ?auto_149055 ) ) ( not ( = ?auto_149062 ?auto_149055 ) ) ( ON ?auto_149062 ?auto_149061 ) ( not ( = ?auto_149060 ?auto_149057 ) ) ( not ( = ?auto_149060 ?auto_149059 ) ) ( not ( = ?auto_149060 ?auto_149058 ) ) ( not ( = ?auto_149060 ?auto_149055 ) ) ( not ( = ?auto_149057 ?auto_149059 ) ) ( not ( = ?auto_149057 ?auto_149058 ) ) ( not ( = ?auto_149057 ?auto_149055 ) ) ( not ( = ?auto_149059 ?auto_149058 ) ) ( not ( = ?auto_149059 ?auto_149055 ) ) ( not ( = ?auto_149058 ?auto_149055 ) ) ( not ( = ?auto_149054 ?auto_149058 ) ) ( not ( = ?auto_149054 ?auto_149060 ) ) ( not ( = ?auto_149054 ?auto_149057 ) ) ( not ( = ?auto_149054 ?auto_149059 ) ) ( not ( = ?auto_149061 ?auto_149058 ) ) ( not ( = ?auto_149061 ?auto_149060 ) ) ( not ( = ?auto_149061 ?auto_149057 ) ) ( not ( = ?auto_149061 ?auto_149059 ) ) ( not ( = ?auto_149062 ?auto_149058 ) ) ( not ( = ?auto_149062 ?auto_149060 ) ) ( not ( = ?auto_149062 ?auto_149057 ) ) ( not ( = ?auto_149062 ?auto_149059 ) ) ( ON ?auto_149055 ?auto_149062 ) ( ON ?auto_149058 ?auto_149055 ) ( ON ?auto_149059 ?auto_149058 ) ( ON ?auto_149060 ?auto_149056 ) ( CLEAR ?auto_149060 ) ( not ( = ?auto_149054 ?auto_149056 ) ) ( not ( = ?auto_149061 ?auto_149056 ) ) ( not ( = ?auto_149062 ?auto_149056 ) ) ( not ( = ?auto_149055 ?auto_149056 ) ) ( not ( = ?auto_149060 ?auto_149056 ) ) ( not ( = ?auto_149057 ?auto_149056 ) ) ( not ( = ?auto_149059 ?auto_149056 ) ) ( not ( = ?auto_149058 ?auto_149056 ) ) ( HOLDING ?auto_149057 ) ( CLEAR ?auto_149059 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149054 ?auto_149061 ?auto_149062 ?auto_149055 ?auto_149058 ?auto_149059 ?auto_149057 )
      ( MAKE-1PILE ?auto_149054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149063 - BLOCK
    )
    :vars
    (
      ?auto_149067 - BLOCK
      ?auto_149070 - BLOCK
      ?auto_149064 - BLOCK
      ?auto_149065 - BLOCK
      ?auto_149068 - BLOCK
      ?auto_149071 - BLOCK
      ?auto_149069 - BLOCK
      ?auto_149066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149067 ?auto_149063 ) ( ON-TABLE ?auto_149063 ) ( not ( = ?auto_149063 ?auto_149067 ) ) ( not ( = ?auto_149063 ?auto_149070 ) ) ( not ( = ?auto_149063 ?auto_149064 ) ) ( not ( = ?auto_149067 ?auto_149070 ) ) ( not ( = ?auto_149067 ?auto_149064 ) ) ( not ( = ?auto_149070 ?auto_149064 ) ) ( ON ?auto_149070 ?auto_149067 ) ( not ( = ?auto_149065 ?auto_149068 ) ) ( not ( = ?auto_149065 ?auto_149071 ) ) ( not ( = ?auto_149065 ?auto_149069 ) ) ( not ( = ?auto_149065 ?auto_149064 ) ) ( not ( = ?auto_149068 ?auto_149071 ) ) ( not ( = ?auto_149068 ?auto_149069 ) ) ( not ( = ?auto_149068 ?auto_149064 ) ) ( not ( = ?auto_149071 ?auto_149069 ) ) ( not ( = ?auto_149071 ?auto_149064 ) ) ( not ( = ?auto_149069 ?auto_149064 ) ) ( not ( = ?auto_149063 ?auto_149069 ) ) ( not ( = ?auto_149063 ?auto_149065 ) ) ( not ( = ?auto_149063 ?auto_149068 ) ) ( not ( = ?auto_149063 ?auto_149071 ) ) ( not ( = ?auto_149067 ?auto_149069 ) ) ( not ( = ?auto_149067 ?auto_149065 ) ) ( not ( = ?auto_149067 ?auto_149068 ) ) ( not ( = ?auto_149067 ?auto_149071 ) ) ( not ( = ?auto_149070 ?auto_149069 ) ) ( not ( = ?auto_149070 ?auto_149065 ) ) ( not ( = ?auto_149070 ?auto_149068 ) ) ( not ( = ?auto_149070 ?auto_149071 ) ) ( ON ?auto_149064 ?auto_149070 ) ( ON ?auto_149069 ?auto_149064 ) ( ON ?auto_149071 ?auto_149069 ) ( ON ?auto_149065 ?auto_149066 ) ( not ( = ?auto_149063 ?auto_149066 ) ) ( not ( = ?auto_149067 ?auto_149066 ) ) ( not ( = ?auto_149070 ?auto_149066 ) ) ( not ( = ?auto_149064 ?auto_149066 ) ) ( not ( = ?auto_149065 ?auto_149066 ) ) ( not ( = ?auto_149068 ?auto_149066 ) ) ( not ( = ?auto_149071 ?auto_149066 ) ) ( not ( = ?auto_149069 ?auto_149066 ) ) ( CLEAR ?auto_149071 ) ( ON ?auto_149068 ?auto_149065 ) ( CLEAR ?auto_149068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149066 ?auto_149065 )
      ( MAKE-1PILE ?auto_149063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149072 - BLOCK
    )
    :vars
    (
      ?auto_149080 - BLOCK
      ?auto_149078 - BLOCK
      ?auto_149074 - BLOCK
      ?auto_149073 - BLOCK
      ?auto_149075 - BLOCK
      ?auto_149076 - BLOCK
      ?auto_149079 - BLOCK
      ?auto_149077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149080 ?auto_149072 ) ( ON-TABLE ?auto_149072 ) ( not ( = ?auto_149072 ?auto_149080 ) ) ( not ( = ?auto_149072 ?auto_149078 ) ) ( not ( = ?auto_149072 ?auto_149074 ) ) ( not ( = ?auto_149080 ?auto_149078 ) ) ( not ( = ?auto_149080 ?auto_149074 ) ) ( not ( = ?auto_149078 ?auto_149074 ) ) ( ON ?auto_149078 ?auto_149080 ) ( not ( = ?auto_149073 ?auto_149075 ) ) ( not ( = ?auto_149073 ?auto_149076 ) ) ( not ( = ?auto_149073 ?auto_149079 ) ) ( not ( = ?auto_149073 ?auto_149074 ) ) ( not ( = ?auto_149075 ?auto_149076 ) ) ( not ( = ?auto_149075 ?auto_149079 ) ) ( not ( = ?auto_149075 ?auto_149074 ) ) ( not ( = ?auto_149076 ?auto_149079 ) ) ( not ( = ?auto_149076 ?auto_149074 ) ) ( not ( = ?auto_149079 ?auto_149074 ) ) ( not ( = ?auto_149072 ?auto_149079 ) ) ( not ( = ?auto_149072 ?auto_149073 ) ) ( not ( = ?auto_149072 ?auto_149075 ) ) ( not ( = ?auto_149072 ?auto_149076 ) ) ( not ( = ?auto_149080 ?auto_149079 ) ) ( not ( = ?auto_149080 ?auto_149073 ) ) ( not ( = ?auto_149080 ?auto_149075 ) ) ( not ( = ?auto_149080 ?auto_149076 ) ) ( not ( = ?auto_149078 ?auto_149079 ) ) ( not ( = ?auto_149078 ?auto_149073 ) ) ( not ( = ?auto_149078 ?auto_149075 ) ) ( not ( = ?auto_149078 ?auto_149076 ) ) ( ON ?auto_149074 ?auto_149078 ) ( ON ?auto_149079 ?auto_149074 ) ( ON ?auto_149073 ?auto_149077 ) ( not ( = ?auto_149072 ?auto_149077 ) ) ( not ( = ?auto_149080 ?auto_149077 ) ) ( not ( = ?auto_149078 ?auto_149077 ) ) ( not ( = ?auto_149074 ?auto_149077 ) ) ( not ( = ?auto_149073 ?auto_149077 ) ) ( not ( = ?auto_149075 ?auto_149077 ) ) ( not ( = ?auto_149076 ?auto_149077 ) ) ( not ( = ?auto_149079 ?auto_149077 ) ) ( ON ?auto_149075 ?auto_149073 ) ( CLEAR ?auto_149075 ) ( ON-TABLE ?auto_149077 ) ( HOLDING ?auto_149076 ) ( CLEAR ?auto_149079 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149072 ?auto_149080 ?auto_149078 ?auto_149074 ?auto_149079 ?auto_149076 )
      ( MAKE-1PILE ?auto_149072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149081 - BLOCK
    )
    :vars
    (
      ?auto_149084 - BLOCK
      ?auto_149089 - BLOCK
      ?auto_149082 - BLOCK
      ?auto_149086 - BLOCK
      ?auto_149083 - BLOCK
      ?auto_149085 - BLOCK
      ?auto_149087 - BLOCK
      ?auto_149088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149084 ?auto_149081 ) ( ON-TABLE ?auto_149081 ) ( not ( = ?auto_149081 ?auto_149084 ) ) ( not ( = ?auto_149081 ?auto_149089 ) ) ( not ( = ?auto_149081 ?auto_149082 ) ) ( not ( = ?auto_149084 ?auto_149089 ) ) ( not ( = ?auto_149084 ?auto_149082 ) ) ( not ( = ?auto_149089 ?auto_149082 ) ) ( ON ?auto_149089 ?auto_149084 ) ( not ( = ?auto_149086 ?auto_149083 ) ) ( not ( = ?auto_149086 ?auto_149085 ) ) ( not ( = ?auto_149086 ?auto_149087 ) ) ( not ( = ?auto_149086 ?auto_149082 ) ) ( not ( = ?auto_149083 ?auto_149085 ) ) ( not ( = ?auto_149083 ?auto_149087 ) ) ( not ( = ?auto_149083 ?auto_149082 ) ) ( not ( = ?auto_149085 ?auto_149087 ) ) ( not ( = ?auto_149085 ?auto_149082 ) ) ( not ( = ?auto_149087 ?auto_149082 ) ) ( not ( = ?auto_149081 ?auto_149087 ) ) ( not ( = ?auto_149081 ?auto_149086 ) ) ( not ( = ?auto_149081 ?auto_149083 ) ) ( not ( = ?auto_149081 ?auto_149085 ) ) ( not ( = ?auto_149084 ?auto_149087 ) ) ( not ( = ?auto_149084 ?auto_149086 ) ) ( not ( = ?auto_149084 ?auto_149083 ) ) ( not ( = ?auto_149084 ?auto_149085 ) ) ( not ( = ?auto_149089 ?auto_149087 ) ) ( not ( = ?auto_149089 ?auto_149086 ) ) ( not ( = ?auto_149089 ?auto_149083 ) ) ( not ( = ?auto_149089 ?auto_149085 ) ) ( ON ?auto_149082 ?auto_149089 ) ( ON ?auto_149087 ?auto_149082 ) ( ON ?auto_149086 ?auto_149088 ) ( not ( = ?auto_149081 ?auto_149088 ) ) ( not ( = ?auto_149084 ?auto_149088 ) ) ( not ( = ?auto_149089 ?auto_149088 ) ) ( not ( = ?auto_149082 ?auto_149088 ) ) ( not ( = ?auto_149086 ?auto_149088 ) ) ( not ( = ?auto_149083 ?auto_149088 ) ) ( not ( = ?auto_149085 ?auto_149088 ) ) ( not ( = ?auto_149087 ?auto_149088 ) ) ( ON ?auto_149083 ?auto_149086 ) ( ON-TABLE ?auto_149088 ) ( CLEAR ?auto_149087 ) ( ON ?auto_149085 ?auto_149083 ) ( CLEAR ?auto_149085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149088 ?auto_149086 ?auto_149083 )
      ( MAKE-1PILE ?auto_149081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149090 - BLOCK
    )
    :vars
    (
      ?auto_149097 - BLOCK
      ?auto_149098 - BLOCK
      ?auto_149092 - BLOCK
      ?auto_149095 - BLOCK
      ?auto_149096 - BLOCK
      ?auto_149094 - BLOCK
      ?auto_149091 - BLOCK
      ?auto_149093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149097 ?auto_149090 ) ( ON-TABLE ?auto_149090 ) ( not ( = ?auto_149090 ?auto_149097 ) ) ( not ( = ?auto_149090 ?auto_149098 ) ) ( not ( = ?auto_149090 ?auto_149092 ) ) ( not ( = ?auto_149097 ?auto_149098 ) ) ( not ( = ?auto_149097 ?auto_149092 ) ) ( not ( = ?auto_149098 ?auto_149092 ) ) ( ON ?auto_149098 ?auto_149097 ) ( not ( = ?auto_149095 ?auto_149096 ) ) ( not ( = ?auto_149095 ?auto_149094 ) ) ( not ( = ?auto_149095 ?auto_149091 ) ) ( not ( = ?auto_149095 ?auto_149092 ) ) ( not ( = ?auto_149096 ?auto_149094 ) ) ( not ( = ?auto_149096 ?auto_149091 ) ) ( not ( = ?auto_149096 ?auto_149092 ) ) ( not ( = ?auto_149094 ?auto_149091 ) ) ( not ( = ?auto_149094 ?auto_149092 ) ) ( not ( = ?auto_149091 ?auto_149092 ) ) ( not ( = ?auto_149090 ?auto_149091 ) ) ( not ( = ?auto_149090 ?auto_149095 ) ) ( not ( = ?auto_149090 ?auto_149096 ) ) ( not ( = ?auto_149090 ?auto_149094 ) ) ( not ( = ?auto_149097 ?auto_149091 ) ) ( not ( = ?auto_149097 ?auto_149095 ) ) ( not ( = ?auto_149097 ?auto_149096 ) ) ( not ( = ?auto_149097 ?auto_149094 ) ) ( not ( = ?auto_149098 ?auto_149091 ) ) ( not ( = ?auto_149098 ?auto_149095 ) ) ( not ( = ?auto_149098 ?auto_149096 ) ) ( not ( = ?auto_149098 ?auto_149094 ) ) ( ON ?auto_149092 ?auto_149098 ) ( ON ?auto_149095 ?auto_149093 ) ( not ( = ?auto_149090 ?auto_149093 ) ) ( not ( = ?auto_149097 ?auto_149093 ) ) ( not ( = ?auto_149098 ?auto_149093 ) ) ( not ( = ?auto_149092 ?auto_149093 ) ) ( not ( = ?auto_149095 ?auto_149093 ) ) ( not ( = ?auto_149096 ?auto_149093 ) ) ( not ( = ?auto_149094 ?auto_149093 ) ) ( not ( = ?auto_149091 ?auto_149093 ) ) ( ON ?auto_149096 ?auto_149095 ) ( ON-TABLE ?auto_149093 ) ( ON ?auto_149094 ?auto_149096 ) ( CLEAR ?auto_149094 ) ( HOLDING ?auto_149091 ) ( CLEAR ?auto_149092 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149090 ?auto_149097 ?auto_149098 ?auto_149092 ?auto_149091 )
      ( MAKE-1PILE ?auto_149090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149099 - BLOCK
    )
    :vars
    (
      ?auto_149103 - BLOCK
      ?auto_149106 - BLOCK
      ?auto_149102 - BLOCK
      ?auto_149107 - BLOCK
      ?auto_149101 - BLOCK
      ?auto_149105 - BLOCK
      ?auto_149100 - BLOCK
      ?auto_149104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149103 ?auto_149099 ) ( ON-TABLE ?auto_149099 ) ( not ( = ?auto_149099 ?auto_149103 ) ) ( not ( = ?auto_149099 ?auto_149106 ) ) ( not ( = ?auto_149099 ?auto_149102 ) ) ( not ( = ?auto_149103 ?auto_149106 ) ) ( not ( = ?auto_149103 ?auto_149102 ) ) ( not ( = ?auto_149106 ?auto_149102 ) ) ( ON ?auto_149106 ?auto_149103 ) ( not ( = ?auto_149107 ?auto_149101 ) ) ( not ( = ?auto_149107 ?auto_149105 ) ) ( not ( = ?auto_149107 ?auto_149100 ) ) ( not ( = ?auto_149107 ?auto_149102 ) ) ( not ( = ?auto_149101 ?auto_149105 ) ) ( not ( = ?auto_149101 ?auto_149100 ) ) ( not ( = ?auto_149101 ?auto_149102 ) ) ( not ( = ?auto_149105 ?auto_149100 ) ) ( not ( = ?auto_149105 ?auto_149102 ) ) ( not ( = ?auto_149100 ?auto_149102 ) ) ( not ( = ?auto_149099 ?auto_149100 ) ) ( not ( = ?auto_149099 ?auto_149107 ) ) ( not ( = ?auto_149099 ?auto_149101 ) ) ( not ( = ?auto_149099 ?auto_149105 ) ) ( not ( = ?auto_149103 ?auto_149100 ) ) ( not ( = ?auto_149103 ?auto_149107 ) ) ( not ( = ?auto_149103 ?auto_149101 ) ) ( not ( = ?auto_149103 ?auto_149105 ) ) ( not ( = ?auto_149106 ?auto_149100 ) ) ( not ( = ?auto_149106 ?auto_149107 ) ) ( not ( = ?auto_149106 ?auto_149101 ) ) ( not ( = ?auto_149106 ?auto_149105 ) ) ( ON ?auto_149102 ?auto_149106 ) ( ON ?auto_149107 ?auto_149104 ) ( not ( = ?auto_149099 ?auto_149104 ) ) ( not ( = ?auto_149103 ?auto_149104 ) ) ( not ( = ?auto_149106 ?auto_149104 ) ) ( not ( = ?auto_149102 ?auto_149104 ) ) ( not ( = ?auto_149107 ?auto_149104 ) ) ( not ( = ?auto_149101 ?auto_149104 ) ) ( not ( = ?auto_149105 ?auto_149104 ) ) ( not ( = ?auto_149100 ?auto_149104 ) ) ( ON ?auto_149101 ?auto_149107 ) ( ON-TABLE ?auto_149104 ) ( ON ?auto_149105 ?auto_149101 ) ( CLEAR ?auto_149102 ) ( ON ?auto_149100 ?auto_149105 ) ( CLEAR ?auto_149100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149104 ?auto_149107 ?auto_149101 ?auto_149105 )
      ( MAKE-1PILE ?auto_149099 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149108 - BLOCK
    )
    :vars
    (
      ?auto_149114 - BLOCK
      ?auto_149109 - BLOCK
      ?auto_149113 - BLOCK
      ?auto_149112 - BLOCK
      ?auto_149110 - BLOCK
      ?auto_149111 - BLOCK
      ?auto_149115 - BLOCK
      ?auto_149116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149114 ?auto_149108 ) ( ON-TABLE ?auto_149108 ) ( not ( = ?auto_149108 ?auto_149114 ) ) ( not ( = ?auto_149108 ?auto_149109 ) ) ( not ( = ?auto_149108 ?auto_149113 ) ) ( not ( = ?auto_149114 ?auto_149109 ) ) ( not ( = ?auto_149114 ?auto_149113 ) ) ( not ( = ?auto_149109 ?auto_149113 ) ) ( ON ?auto_149109 ?auto_149114 ) ( not ( = ?auto_149112 ?auto_149110 ) ) ( not ( = ?auto_149112 ?auto_149111 ) ) ( not ( = ?auto_149112 ?auto_149115 ) ) ( not ( = ?auto_149112 ?auto_149113 ) ) ( not ( = ?auto_149110 ?auto_149111 ) ) ( not ( = ?auto_149110 ?auto_149115 ) ) ( not ( = ?auto_149110 ?auto_149113 ) ) ( not ( = ?auto_149111 ?auto_149115 ) ) ( not ( = ?auto_149111 ?auto_149113 ) ) ( not ( = ?auto_149115 ?auto_149113 ) ) ( not ( = ?auto_149108 ?auto_149115 ) ) ( not ( = ?auto_149108 ?auto_149112 ) ) ( not ( = ?auto_149108 ?auto_149110 ) ) ( not ( = ?auto_149108 ?auto_149111 ) ) ( not ( = ?auto_149114 ?auto_149115 ) ) ( not ( = ?auto_149114 ?auto_149112 ) ) ( not ( = ?auto_149114 ?auto_149110 ) ) ( not ( = ?auto_149114 ?auto_149111 ) ) ( not ( = ?auto_149109 ?auto_149115 ) ) ( not ( = ?auto_149109 ?auto_149112 ) ) ( not ( = ?auto_149109 ?auto_149110 ) ) ( not ( = ?auto_149109 ?auto_149111 ) ) ( ON ?auto_149112 ?auto_149116 ) ( not ( = ?auto_149108 ?auto_149116 ) ) ( not ( = ?auto_149114 ?auto_149116 ) ) ( not ( = ?auto_149109 ?auto_149116 ) ) ( not ( = ?auto_149113 ?auto_149116 ) ) ( not ( = ?auto_149112 ?auto_149116 ) ) ( not ( = ?auto_149110 ?auto_149116 ) ) ( not ( = ?auto_149111 ?auto_149116 ) ) ( not ( = ?auto_149115 ?auto_149116 ) ) ( ON ?auto_149110 ?auto_149112 ) ( ON-TABLE ?auto_149116 ) ( ON ?auto_149111 ?auto_149110 ) ( ON ?auto_149115 ?auto_149111 ) ( CLEAR ?auto_149115 ) ( HOLDING ?auto_149113 ) ( CLEAR ?auto_149109 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149108 ?auto_149114 ?auto_149109 ?auto_149113 )
      ( MAKE-1PILE ?auto_149108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149117 - BLOCK
    )
    :vars
    (
      ?auto_149120 - BLOCK
      ?auto_149123 - BLOCK
      ?auto_149125 - BLOCK
      ?auto_149118 - BLOCK
      ?auto_149122 - BLOCK
      ?auto_149124 - BLOCK
      ?auto_149119 - BLOCK
      ?auto_149121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149120 ?auto_149117 ) ( ON-TABLE ?auto_149117 ) ( not ( = ?auto_149117 ?auto_149120 ) ) ( not ( = ?auto_149117 ?auto_149123 ) ) ( not ( = ?auto_149117 ?auto_149125 ) ) ( not ( = ?auto_149120 ?auto_149123 ) ) ( not ( = ?auto_149120 ?auto_149125 ) ) ( not ( = ?auto_149123 ?auto_149125 ) ) ( ON ?auto_149123 ?auto_149120 ) ( not ( = ?auto_149118 ?auto_149122 ) ) ( not ( = ?auto_149118 ?auto_149124 ) ) ( not ( = ?auto_149118 ?auto_149119 ) ) ( not ( = ?auto_149118 ?auto_149125 ) ) ( not ( = ?auto_149122 ?auto_149124 ) ) ( not ( = ?auto_149122 ?auto_149119 ) ) ( not ( = ?auto_149122 ?auto_149125 ) ) ( not ( = ?auto_149124 ?auto_149119 ) ) ( not ( = ?auto_149124 ?auto_149125 ) ) ( not ( = ?auto_149119 ?auto_149125 ) ) ( not ( = ?auto_149117 ?auto_149119 ) ) ( not ( = ?auto_149117 ?auto_149118 ) ) ( not ( = ?auto_149117 ?auto_149122 ) ) ( not ( = ?auto_149117 ?auto_149124 ) ) ( not ( = ?auto_149120 ?auto_149119 ) ) ( not ( = ?auto_149120 ?auto_149118 ) ) ( not ( = ?auto_149120 ?auto_149122 ) ) ( not ( = ?auto_149120 ?auto_149124 ) ) ( not ( = ?auto_149123 ?auto_149119 ) ) ( not ( = ?auto_149123 ?auto_149118 ) ) ( not ( = ?auto_149123 ?auto_149122 ) ) ( not ( = ?auto_149123 ?auto_149124 ) ) ( ON ?auto_149118 ?auto_149121 ) ( not ( = ?auto_149117 ?auto_149121 ) ) ( not ( = ?auto_149120 ?auto_149121 ) ) ( not ( = ?auto_149123 ?auto_149121 ) ) ( not ( = ?auto_149125 ?auto_149121 ) ) ( not ( = ?auto_149118 ?auto_149121 ) ) ( not ( = ?auto_149122 ?auto_149121 ) ) ( not ( = ?auto_149124 ?auto_149121 ) ) ( not ( = ?auto_149119 ?auto_149121 ) ) ( ON ?auto_149122 ?auto_149118 ) ( ON-TABLE ?auto_149121 ) ( ON ?auto_149124 ?auto_149122 ) ( ON ?auto_149119 ?auto_149124 ) ( CLEAR ?auto_149123 ) ( ON ?auto_149125 ?auto_149119 ) ( CLEAR ?auto_149125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149121 ?auto_149118 ?auto_149122 ?auto_149124 ?auto_149119 )
      ( MAKE-1PILE ?auto_149117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149126 - BLOCK
    )
    :vars
    (
      ?auto_149129 - BLOCK
      ?auto_149134 - BLOCK
      ?auto_149131 - BLOCK
      ?auto_149133 - BLOCK
      ?auto_149132 - BLOCK
      ?auto_149127 - BLOCK
      ?auto_149130 - BLOCK
      ?auto_149128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149129 ?auto_149126 ) ( ON-TABLE ?auto_149126 ) ( not ( = ?auto_149126 ?auto_149129 ) ) ( not ( = ?auto_149126 ?auto_149134 ) ) ( not ( = ?auto_149126 ?auto_149131 ) ) ( not ( = ?auto_149129 ?auto_149134 ) ) ( not ( = ?auto_149129 ?auto_149131 ) ) ( not ( = ?auto_149134 ?auto_149131 ) ) ( not ( = ?auto_149133 ?auto_149132 ) ) ( not ( = ?auto_149133 ?auto_149127 ) ) ( not ( = ?auto_149133 ?auto_149130 ) ) ( not ( = ?auto_149133 ?auto_149131 ) ) ( not ( = ?auto_149132 ?auto_149127 ) ) ( not ( = ?auto_149132 ?auto_149130 ) ) ( not ( = ?auto_149132 ?auto_149131 ) ) ( not ( = ?auto_149127 ?auto_149130 ) ) ( not ( = ?auto_149127 ?auto_149131 ) ) ( not ( = ?auto_149130 ?auto_149131 ) ) ( not ( = ?auto_149126 ?auto_149130 ) ) ( not ( = ?auto_149126 ?auto_149133 ) ) ( not ( = ?auto_149126 ?auto_149132 ) ) ( not ( = ?auto_149126 ?auto_149127 ) ) ( not ( = ?auto_149129 ?auto_149130 ) ) ( not ( = ?auto_149129 ?auto_149133 ) ) ( not ( = ?auto_149129 ?auto_149132 ) ) ( not ( = ?auto_149129 ?auto_149127 ) ) ( not ( = ?auto_149134 ?auto_149130 ) ) ( not ( = ?auto_149134 ?auto_149133 ) ) ( not ( = ?auto_149134 ?auto_149132 ) ) ( not ( = ?auto_149134 ?auto_149127 ) ) ( ON ?auto_149133 ?auto_149128 ) ( not ( = ?auto_149126 ?auto_149128 ) ) ( not ( = ?auto_149129 ?auto_149128 ) ) ( not ( = ?auto_149134 ?auto_149128 ) ) ( not ( = ?auto_149131 ?auto_149128 ) ) ( not ( = ?auto_149133 ?auto_149128 ) ) ( not ( = ?auto_149132 ?auto_149128 ) ) ( not ( = ?auto_149127 ?auto_149128 ) ) ( not ( = ?auto_149130 ?auto_149128 ) ) ( ON ?auto_149132 ?auto_149133 ) ( ON-TABLE ?auto_149128 ) ( ON ?auto_149127 ?auto_149132 ) ( ON ?auto_149130 ?auto_149127 ) ( ON ?auto_149131 ?auto_149130 ) ( CLEAR ?auto_149131 ) ( HOLDING ?auto_149134 ) ( CLEAR ?auto_149129 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149126 ?auto_149129 ?auto_149134 )
      ( MAKE-1PILE ?auto_149126 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149135 - BLOCK
    )
    :vars
    (
      ?auto_149139 - BLOCK
      ?auto_149137 - BLOCK
      ?auto_149143 - BLOCK
      ?auto_149140 - BLOCK
      ?auto_149136 - BLOCK
      ?auto_149138 - BLOCK
      ?auto_149142 - BLOCK
      ?auto_149141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149139 ?auto_149135 ) ( ON-TABLE ?auto_149135 ) ( not ( = ?auto_149135 ?auto_149139 ) ) ( not ( = ?auto_149135 ?auto_149137 ) ) ( not ( = ?auto_149135 ?auto_149143 ) ) ( not ( = ?auto_149139 ?auto_149137 ) ) ( not ( = ?auto_149139 ?auto_149143 ) ) ( not ( = ?auto_149137 ?auto_149143 ) ) ( not ( = ?auto_149140 ?auto_149136 ) ) ( not ( = ?auto_149140 ?auto_149138 ) ) ( not ( = ?auto_149140 ?auto_149142 ) ) ( not ( = ?auto_149140 ?auto_149143 ) ) ( not ( = ?auto_149136 ?auto_149138 ) ) ( not ( = ?auto_149136 ?auto_149142 ) ) ( not ( = ?auto_149136 ?auto_149143 ) ) ( not ( = ?auto_149138 ?auto_149142 ) ) ( not ( = ?auto_149138 ?auto_149143 ) ) ( not ( = ?auto_149142 ?auto_149143 ) ) ( not ( = ?auto_149135 ?auto_149142 ) ) ( not ( = ?auto_149135 ?auto_149140 ) ) ( not ( = ?auto_149135 ?auto_149136 ) ) ( not ( = ?auto_149135 ?auto_149138 ) ) ( not ( = ?auto_149139 ?auto_149142 ) ) ( not ( = ?auto_149139 ?auto_149140 ) ) ( not ( = ?auto_149139 ?auto_149136 ) ) ( not ( = ?auto_149139 ?auto_149138 ) ) ( not ( = ?auto_149137 ?auto_149142 ) ) ( not ( = ?auto_149137 ?auto_149140 ) ) ( not ( = ?auto_149137 ?auto_149136 ) ) ( not ( = ?auto_149137 ?auto_149138 ) ) ( ON ?auto_149140 ?auto_149141 ) ( not ( = ?auto_149135 ?auto_149141 ) ) ( not ( = ?auto_149139 ?auto_149141 ) ) ( not ( = ?auto_149137 ?auto_149141 ) ) ( not ( = ?auto_149143 ?auto_149141 ) ) ( not ( = ?auto_149140 ?auto_149141 ) ) ( not ( = ?auto_149136 ?auto_149141 ) ) ( not ( = ?auto_149138 ?auto_149141 ) ) ( not ( = ?auto_149142 ?auto_149141 ) ) ( ON ?auto_149136 ?auto_149140 ) ( ON-TABLE ?auto_149141 ) ( ON ?auto_149138 ?auto_149136 ) ( ON ?auto_149142 ?auto_149138 ) ( ON ?auto_149143 ?auto_149142 ) ( CLEAR ?auto_149139 ) ( ON ?auto_149137 ?auto_149143 ) ( CLEAR ?auto_149137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149141 ?auto_149140 ?auto_149136 ?auto_149138 ?auto_149142 ?auto_149143 )
      ( MAKE-1PILE ?auto_149135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149162 - BLOCK
    )
    :vars
    (
      ?auto_149169 - BLOCK
      ?auto_149170 - BLOCK
      ?auto_149167 - BLOCK
      ?auto_149168 - BLOCK
      ?auto_149165 - BLOCK
      ?auto_149166 - BLOCK
      ?auto_149163 - BLOCK
      ?auto_149164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149162 ?auto_149169 ) ) ( not ( = ?auto_149162 ?auto_149170 ) ) ( not ( = ?auto_149162 ?auto_149167 ) ) ( not ( = ?auto_149169 ?auto_149170 ) ) ( not ( = ?auto_149169 ?auto_149167 ) ) ( not ( = ?auto_149170 ?auto_149167 ) ) ( not ( = ?auto_149168 ?auto_149165 ) ) ( not ( = ?auto_149168 ?auto_149166 ) ) ( not ( = ?auto_149168 ?auto_149163 ) ) ( not ( = ?auto_149168 ?auto_149167 ) ) ( not ( = ?auto_149165 ?auto_149166 ) ) ( not ( = ?auto_149165 ?auto_149163 ) ) ( not ( = ?auto_149165 ?auto_149167 ) ) ( not ( = ?auto_149166 ?auto_149163 ) ) ( not ( = ?auto_149166 ?auto_149167 ) ) ( not ( = ?auto_149163 ?auto_149167 ) ) ( not ( = ?auto_149162 ?auto_149163 ) ) ( not ( = ?auto_149162 ?auto_149168 ) ) ( not ( = ?auto_149162 ?auto_149165 ) ) ( not ( = ?auto_149162 ?auto_149166 ) ) ( not ( = ?auto_149169 ?auto_149163 ) ) ( not ( = ?auto_149169 ?auto_149168 ) ) ( not ( = ?auto_149169 ?auto_149165 ) ) ( not ( = ?auto_149169 ?auto_149166 ) ) ( not ( = ?auto_149170 ?auto_149163 ) ) ( not ( = ?auto_149170 ?auto_149168 ) ) ( not ( = ?auto_149170 ?auto_149165 ) ) ( not ( = ?auto_149170 ?auto_149166 ) ) ( ON ?auto_149168 ?auto_149164 ) ( not ( = ?auto_149162 ?auto_149164 ) ) ( not ( = ?auto_149169 ?auto_149164 ) ) ( not ( = ?auto_149170 ?auto_149164 ) ) ( not ( = ?auto_149167 ?auto_149164 ) ) ( not ( = ?auto_149168 ?auto_149164 ) ) ( not ( = ?auto_149165 ?auto_149164 ) ) ( not ( = ?auto_149166 ?auto_149164 ) ) ( not ( = ?auto_149163 ?auto_149164 ) ) ( ON ?auto_149165 ?auto_149168 ) ( ON-TABLE ?auto_149164 ) ( ON ?auto_149166 ?auto_149165 ) ( ON ?auto_149163 ?auto_149166 ) ( ON ?auto_149167 ?auto_149163 ) ( ON ?auto_149170 ?auto_149167 ) ( ON ?auto_149169 ?auto_149170 ) ( CLEAR ?auto_149169 ) ( HOLDING ?auto_149162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149162 ?auto_149169 )
      ( MAKE-1PILE ?auto_149162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_149171 - BLOCK
    )
    :vars
    (
      ?auto_149176 - BLOCK
      ?auto_149174 - BLOCK
      ?auto_149173 - BLOCK
      ?auto_149172 - BLOCK
      ?auto_149179 - BLOCK
      ?auto_149175 - BLOCK
      ?auto_149178 - BLOCK
      ?auto_149177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149171 ?auto_149176 ) ) ( not ( = ?auto_149171 ?auto_149174 ) ) ( not ( = ?auto_149171 ?auto_149173 ) ) ( not ( = ?auto_149176 ?auto_149174 ) ) ( not ( = ?auto_149176 ?auto_149173 ) ) ( not ( = ?auto_149174 ?auto_149173 ) ) ( not ( = ?auto_149172 ?auto_149179 ) ) ( not ( = ?auto_149172 ?auto_149175 ) ) ( not ( = ?auto_149172 ?auto_149178 ) ) ( not ( = ?auto_149172 ?auto_149173 ) ) ( not ( = ?auto_149179 ?auto_149175 ) ) ( not ( = ?auto_149179 ?auto_149178 ) ) ( not ( = ?auto_149179 ?auto_149173 ) ) ( not ( = ?auto_149175 ?auto_149178 ) ) ( not ( = ?auto_149175 ?auto_149173 ) ) ( not ( = ?auto_149178 ?auto_149173 ) ) ( not ( = ?auto_149171 ?auto_149178 ) ) ( not ( = ?auto_149171 ?auto_149172 ) ) ( not ( = ?auto_149171 ?auto_149179 ) ) ( not ( = ?auto_149171 ?auto_149175 ) ) ( not ( = ?auto_149176 ?auto_149178 ) ) ( not ( = ?auto_149176 ?auto_149172 ) ) ( not ( = ?auto_149176 ?auto_149179 ) ) ( not ( = ?auto_149176 ?auto_149175 ) ) ( not ( = ?auto_149174 ?auto_149178 ) ) ( not ( = ?auto_149174 ?auto_149172 ) ) ( not ( = ?auto_149174 ?auto_149179 ) ) ( not ( = ?auto_149174 ?auto_149175 ) ) ( ON ?auto_149172 ?auto_149177 ) ( not ( = ?auto_149171 ?auto_149177 ) ) ( not ( = ?auto_149176 ?auto_149177 ) ) ( not ( = ?auto_149174 ?auto_149177 ) ) ( not ( = ?auto_149173 ?auto_149177 ) ) ( not ( = ?auto_149172 ?auto_149177 ) ) ( not ( = ?auto_149179 ?auto_149177 ) ) ( not ( = ?auto_149175 ?auto_149177 ) ) ( not ( = ?auto_149178 ?auto_149177 ) ) ( ON ?auto_149179 ?auto_149172 ) ( ON-TABLE ?auto_149177 ) ( ON ?auto_149175 ?auto_149179 ) ( ON ?auto_149178 ?auto_149175 ) ( ON ?auto_149173 ?auto_149178 ) ( ON ?auto_149174 ?auto_149173 ) ( ON ?auto_149176 ?auto_149174 ) ( ON ?auto_149171 ?auto_149176 ) ( CLEAR ?auto_149171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149177 ?auto_149172 ?auto_149179 ?auto_149175 ?auto_149178 ?auto_149173 ?auto_149174 ?auto_149176 )
      ( MAKE-1PILE ?auto_149171 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149187 - BLOCK
      ?auto_149188 - BLOCK
      ?auto_149189 - BLOCK
      ?auto_149190 - BLOCK
      ?auto_149191 - BLOCK
      ?auto_149192 - BLOCK
      ?auto_149193 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_149193 ) ( CLEAR ?auto_149192 ) ( ON-TABLE ?auto_149187 ) ( ON ?auto_149188 ?auto_149187 ) ( ON ?auto_149189 ?auto_149188 ) ( ON ?auto_149190 ?auto_149189 ) ( ON ?auto_149191 ?auto_149190 ) ( ON ?auto_149192 ?auto_149191 ) ( not ( = ?auto_149187 ?auto_149188 ) ) ( not ( = ?auto_149187 ?auto_149189 ) ) ( not ( = ?auto_149187 ?auto_149190 ) ) ( not ( = ?auto_149187 ?auto_149191 ) ) ( not ( = ?auto_149187 ?auto_149192 ) ) ( not ( = ?auto_149187 ?auto_149193 ) ) ( not ( = ?auto_149188 ?auto_149189 ) ) ( not ( = ?auto_149188 ?auto_149190 ) ) ( not ( = ?auto_149188 ?auto_149191 ) ) ( not ( = ?auto_149188 ?auto_149192 ) ) ( not ( = ?auto_149188 ?auto_149193 ) ) ( not ( = ?auto_149189 ?auto_149190 ) ) ( not ( = ?auto_149189 ?auto_149191 ) ) ( not ( = ?auto_149189 ?auto_149192 ) ) ( not ( = ?auto_149189 ?auto_149193 ) ) ( not ( = ?auto_149190 ?auto_149191 ) ) ( not ( = ?auto_149190 ?auto_149192 ) ) ( not ( = ?auto_149190 ?auto_149193 ) ) ( not ( = ?auto_149191 ?auto_149192 ) ) ( not ( = ?auto_149191 ?auto_149193 ) ) ( not ( = ?auto_149192 ?auto_149193 ) ) )
    :subtasks
    ( ( !STACK ?auto_149193 ?auto_149192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149194 - BLOCK
      ?auto_149195 - BLOCK
      ?auto_149196 - BLOCK
      ?auto_149197 - BLOCK
      ?auto_149198 - BLOCK
      ?auto_149199 - BLOCK
      ?auto_149200 - BLOCK
    )
    :vars
    (
      ?auto_149201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149199 ) ( ON-TABLE ?auto_149194 ) ( ON ?auto_149195 ?auto_149194 ) ( ON ?auto_149196 ?auto_149195 ) ( ON ?auto_149197 ?auto_149196 ) ( ON ?auto_149198 ?auto_149197 ) ( ON ?auto_149199 ?auto_149198 ) ( not ( = ?auto_149194 ?auto_149195 ) ) ( not ( = ?auto_149194 ?auto_149196 ) ) ( not ( = ?auto_149194 ?auto_149197 ) ) ( not ( = ?auto_149194 ?auto_149198 ) ) ( not ( = ?auto_149194 ?auto_149199 ) ) ( not ( = ?auto_149194 ?auto_149200 ) ) ( not ( = ?auto_149195 ?auto_149196 ) ) ( not ( = ?auto_149195 ?auto_149197 ) ) ( not ( = ?auto_149195 ?auto_149198 ) ) ( not ( = ?auto_149195 ?auto_149199 ) ) ( not ( = ?auto_149195 ?auto_149200 ) ) ( not ( = ?auto_149196 ?auto_149197 ) ) ( not ( = ?auto_149196 ?auto_149198 ) ) ( not ( = ?auto_149196 ?auto_149199 ) ) ( not ( = ?auto_149196 ?auto_149200 ) ) ( not ( = ?auto_149197 ?auto_149198 ) ) ( not ( = ?auto_149197 ?auto_149199 ) ) ( not ( = ?auto_149197 ?auto_149200 ) ) ( not ( = ?auto_149198 ?auto_149199 ) ) ( not ( = ?auto_149198 ?auto_149200 ) ) ( not ( = ?auto_149199 ?auto_149200 ) ) ( ON ?auto_149200 ?auto_149201 ) ( CLEAR ?auto_149200 ) ( HAND-EMPTY ) ( not ( = ?auto_149194 ?auto_149201 ) ) ( not ( = ?auto_149195 ?auto_149201 ) ) ( not ( = ?auto_149196 ?auto_149201 ) ) ( not ( = ?auto_149197 ?auto_149201 ) ) ( not ( = ?auto_149198 ?auto_149201 ) ) ( not ( = ?auto_149199 ?auto_149201 ) ) ( not ( = ?auto_149200 ?auto_149201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149200 ?auto_149201 )
      ( MAKE-7PILE ?auto_149194 ?auto_149195 ?auto_149196 ?auto_149197 ?auto_149198 ?auto_149199 ?auto_149200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149202 - BLOCK
      ?auto_149203 - BLOCK
      ?auto_149204 - BLOCK
      ?auto_149205 - BLOCK
      ?auto_149206 - BLOCK
      ?auto_149207 - BLOCK
      ?auto_149208 - BLOCK
    )
    :vars
    (
      ?auto_149209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149202 ) ( ON ?auto_149203 ?auto_149202 ) ( ON ?auto_149204 ?auto_149203 ) ( ON ?auto_149205 ?auto_149204 ) ( ON ?auto_149206 ?auto_149205 ) ( not ( = ?auto_149202 ?auto_149203 ) ) ( not ( = ?auto_149202 ?auto_149204 ) ) ( not ( = ?auto_149202 ?auto_149205 ) ) ( not ( = ?auto_149202 ?auto_149206 ) ) ( not ( = ?auto_149202 ?auto_149207 ) ) ( not ( = ?auto_149202 ?auto_149208 ) ) ( not ( = ?auto_149203 ?auto_149204 ) ) ( not ( = ?auto_149203 ?auto_149205 ) ) ( not ( = ?auto_149203 ?auto_149206 ) ) ( not ( = ?auto_149203 ?auto_149207 ) ) ( not ( = ?auto_149203 ?auto_149208 ) ) ( not ( = ?auto_149204 ?auto_149205 ) ) ( not ( = ?auto_149204 ?auto_149206 ) ) ( not ( = ?auto_149204 ?auto_149207 ) ) ( not ( = ?auto_149204 ?auto_149208 ) ) ( not ( = ?auto_149205 ?auto_149206 ) ) ( not ( = ?auto_149205 ?auto_149207 ) ) ( not ( = ?auto_149205 ?auto_149208 ) ) ( not ( = ?auto_149206 ?auto_149207 ) ) ( not ( = ?auto_149206 ?auto_149208 ) ) ( not ( = ?auto_149207 ?auto_149208 ) ) ( ON ?auto_149208 ?auto_149209 ) ( CLEAR ?auto_149208 ) ( not ( = ?auto_149202 ?auto_149209 ) ) ( not ( = ?auto_149203 ?auto_149209 ) ) ( not ( = ?auto_149204 ?auto_149209 ) ) ( not ( = ?auto_149205 ?auto_149209 ) ) ( not ( = ?auto_149206 ?auto_149209 ) ) ( not ( = ?auto_149207 ?auto_149209 ) ) ( not ( = ?auto_149208 ?auto_149209 ) ) ( HOLDING ?auto_149207 ) ( CLEAR ?auto_149206 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149202 ?auto_149203 ?auto_149204 ?auto_149205 ?auto_149206 ?auto_149207 )
      ( MAKE-7PILE ?auto_149202 ?auto_149203 ?auto_149204 ?auto_149205 ?auto_149206 ?auto_149207 ?auto_149208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149210 - BLOCK
      ?auto_149211 - BLOCK
      ?auto_149212 - BLOCK
      ?auto_149213 - BLOCK
      ?auto_149214 - BLOCK
      ?auto_149215 - BLOCK
      ?auto_149216 - BLOCK
    )
    :vars
    (
      ?auto_149217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149210 ) ( ON ?auto_149211 ?auto_149210 ) ( ON ?auto_149212 ?auto_149211 ) ( ON ?auto_149213 ?auto_149212 ) ( ON ?auto_149214 ?auto_149213 ) ( not ( = ?auto_149210 ?auto_149211 ) ) ( not ( = ?auto_149210 ?auto_149212 ) ) ( not ( = ?auto_149210 ?auto_149213 ) ) ( not ( = ?auto_149210 ?auto_149214 ) ) ( not ( = ?auto_149210 ?auto_149215 ) ) ( not ( = ?auto_149210 ?auto_149216 ) ) ( not ( = ?auto_149211 ?auto_149212 ) ) ( not ( = ?auto_149211 ?auto_149213 ) ) ( not ( = ?auto_149211 ?auto_149214 ) ) ( not ( = ?auto_149211 ?auto_149215 ) ) ( not ( = ?auto_149211 ?auto_149216 ) ) ( not ( = ?auto_149212 ?auto_149213 ) ) ( not ( = ?auto_149212 ?auto_149214 ) ) ( not ( = ?auto_149212 ?auto_149215 ) ) ( not ( = ?auto_149212 ?auto_149216 ) ) ( not ( = ?auto_149213 ?auto_149214 ) ) ( not ( = ?auto_149213 ?auto_149215 ) ) ( not ( = ?auto_149213 ?auto_149216 ) ) ( not ( = ?auto_149214 ?auto_149215 ) ) ( not ( = ?auto_149214 ?auto_149216 ) ) ( not ( = ?auto_149215 ?auto_149216 ) ) ( ON ?auto_149216 ?auto_149217 ) ( not ( = ?auto_149210 ?auto_149217 ) ) ( not ( = ?auto_149211 ?auto_149217 ) ) ( not ( = ?auto_149212 ?auto_149217 ) ) ( not ( = ?auto_149213 ?auto_149217 ) ) ( not ( = ?auto_149214 ?auto_149217 ) ) ( not ( = ?auto_149215 ?auto_149217 ) ) ( not ( = ?auto_149216 ?auto_149217 ) ) ( CLEAR ?auto_149214 ) ( ON ?auto_149215 ?auto_149216 ) ( CLEAR ?auto_149215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149217 ?auto_149216 )
      ( MAKE-7PILE ?auto_149210 ?auto_149211 ?auto_149212 ?auto_149213 ?auto_149214 ?auto_149215 ?auto_149216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149218 - BLOCK
      ?auto_149219 - BLOCK
      ?auto_149220 - BLOCK
      ?auto_149221 - BLOCK
      ?auto_149222 - BLOCK
      ?auto_149223 - BLOCK
      ?auto_149224 - BLOCK
    )
    :vars
    (
      ?auto_149225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149218 ) ( ON ?auto_149219 ?auto_149218 ) ( ON ?auto_149220 ?auto_149219 ) ( ON ?auto_149221 ?auto_149220 ) ( not ( = ?auto_149218 ?auto_149219 ) ) ( not ( = ?auto_149218 ?auto_149220 ) ) ( not ( = ?auto_149218 ?auto_149221 ) ) ( not ( = ?auto_149218 ?auto_149222 ) ) ( not ( = ?auto_149218 ?auto_149223 ) ) ( not ( = ?auto_149218 ?auto_149224 ) ) ( not ( = ?auto_149219 ?auto_149220 ) ) ( not ( = ?auto_149219 ?auto_149221 ) ) ( not ( = ?auto_149219 ?auto_149222 ) ) ( not ( = ?auto_149219 ?auto_149223 ) ) ( not ( = ?auto_149219 ?auto_149224 ) ) ( not ( = ?auto_149220 ?auto_149221 ) ) ( not ( = ?auto_149220 ?auto_149222 ) ) ( not ( = ?auto_149220 ?auto_149223 ) ) ( not ( = ?auto_149220 ?auto_149224 ) ) ( not ( = ?auto_149221 ?auto_149222 ) ) ( not ( = ?auto_149221 ?auto_149223 ) ) ( not ( = ?auto_149221 ?auto_149224 ) ) ( not ( = ?auto_149222 ?auto_149223 ) ) ( not ( = ?auto_149222 ?auto_149224 ) ) ( not ( = ?auto_149223 ?auto_149224 ) ) ( ON ?auto_149224 ?auto_149225 ) ( not ( = ?auto_149218 ?auto_149225 ) ) ( not ( = ?auto_149219 ?auto_149225 ) ) ( not ( = ?auto_149220 ?auto_149225 ) ) ( not ( = ?auto_149221 ?auto_149225 ) ) ( not ( = ?auto_149222 ?auto_149225 ) ) ( not ( = ?auto_149223 ?auto_149225 ) ) ( not ( = ?auto_149224 ?auto_149225 ) ) ( ON ?auto_149223 ?auto_149224 ) ( CLEAR ?auto_149223 ) ( ON-TABLE ?auto_149225 ) ( HOLDING ?auto_149222 ) ( CLEAR ?auto_149221 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149218 ?auto_149219 ?auto_149220 ?auto_149221 ?auto_149222 )
      ( MAKE-7PILE ?auto_149218 ?auto_149219 ?auto_149220 ?auto_149221 ?auto_149222 ?auto_149223 ?auto_149224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149226 - BLOCK
      ?auto_149227 - BLOCK
      ?auto_149228 - BLOCK
      ?auto_149229 - BLOCK
      ?auto_149230 - BLOCK
      ?auto_149231 - BLOCK
      ?auto_149232 - BLOCK
    )
    :vars
    (
      ?auto_149233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149226 ) ( ON ?auto_149227 ?auto_149226 ) ( ON ?auto_149228 ?auto_149227 ) ( ON ?auto_149229 ?auto_149228 ) ( not ( = ?auto_149226 ?auto_149227 ) ) ( not ( = ?auto_149226 ?auto_149228 ) ) ( not ( = ?auto_149226 ?auto_149229 ) ) ( not ( = ?auto_149226 ?auto_149230 ) ) ( not ( = ?auto_149226 ?auto_149231 ) ) ( not ( = ?auto_149226 ?auto_149232 ) ) ( not ( = ?auto_149227 ?auto_149228 ) ) ( not ( = ?auto_149227 ?auto_149229 ) ) ( not ( = ?auto_149227 ?auto_149230 ) ) ( not ( = ?auto_149227 ?auto_149231 ) ) ( not ( = ?auto_149227 ?auto_149232 ) ) ( not ( = ?auto_149228 ?auto_149229 ) ) ( not ( = ?auto_149228 ?auto_149230 ) ) ( not ( = ?auto_149228 ?auto_149231 ) ) ( not ( = ?auto_149228 ?auto_149232 ) ) ( not ( = ?auto_149229 ?auto_149230 ) ) ( not ( = ?auto_149229 ?auto_149231 ) ) ( not ( = ?auto_149229 ?auto_149232 ) ) ( not ( = ?auto_149230 ?auto_149231 ) ) ( not ( = ?auto_149230 ?auto_149232 ) ) ( not ( = ?auto_149231 ?auto_149232 ) ) ( ON ?auto_149232 ?auto_149233 ) ( not ( = ?auto_149226 ?auto_149233 ) ) ( not ( = ?auto_149227 ?auto_149233 ) ) ( not ( = ?auto_149228 ?auto_149233 ) ) ( not ( = ?auto_149229 ?auto_149233 ) ) ( not ( = ?auto_149230 ?auto_149233 ) ) ( not ( = ?auto_149231 ?auto_149233 ) ) ( not ( = ?auto_149232 ?auto_149233 ) ) ( ON ?auto_149231 ?auto_149232 ) ( ON-TABLE ?auto_149233 ) ( CLEAR ?auto_149229 ) ( ON ?auto_149230 ?auto_149231 ) ( CLEAR ?auto_149230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149233 ?auto_149232 ?auto_149231 )
      ( MAKE-7PILE ?auto_149226 ?auto_149227 ?auto_149228 ?auto_149229 ?auto_149230 ?auto_149231 ?auto_149232 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149234 - BLOCK
      ?auto_149235 - BLOCK
      ?auto_149236 - BLOCK
      ?auto_149237 - BLOCK
      ?auto_149238 - BLOCK
      ?auto_149239 - BLOCK
      ?auto_149240 - BLOCK
    )
    :vars
    (
      ?auto_149241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149234 ) ( ON ?auto_149235 ?auto_149234 ) ( ON ?auto_149236 ?auto_149235 ) ( not ( = ?auto_149234 ?auto_149235 ) ) ( not ( = ?auto_149234 ?auto_149236 ) ) ( not ( = ?auto_149234 ?auto_149237 ) ) ( not ( = ?auto_149234 ?auto_149238 ) ) ( not ( = ?auto_149234 ?auto_149239 ) ) ( not ( = ?auto_149234 ?auto_149240 ) ) ( not ( = ?auto_149235 ?auto_149236 ) ) ( not ( = ?auto_149235 ?auto_149237 ) ) ( not ( = ?auto_149235 ?auto_149238 ) ) ( not ( = ?auto_149235 ?auto_149239 ) ) ( not ( = ?auto_149235 ?auto_149240 ) ) ( not ( = ?auto_149236 ?auto_149237 ) ) ( not ( = ?auto_149236 ?auto_149238 ) ) ( not ( = ?auto_149236 ?auto_149239 ) ) ( not ( = ?auto_149236 ?auto_149240 ) ) ( not ( = ?auto_149237 ?auto_149238 ) ) ( not ( = ?auto_149237 ?auto_149239 ) ) ( not ( = ?auto_149237 ?auto_149240 ) ) ( not ( = ?auto_149238 ?auto_149239 ) ) ( not ( = ?auto_149238 ?auto_149240 ) ) ( not ( = ?auto_149239 ?auto_149240 ) ) ( ON ?auto_149240 ?auto_149241 ) ( not ( = ?auto_149234 ?auto_149241 ) ) ( not ( = ?auto_149235 ?auto_149241 ) ) ( not ( = ?auto_149236 ?auto_149241 ) ) ( not ( = ?auto_149237 ?auto_149241 ) ) ( not ( = ?auto_149238 ?auto_149241 ) ) ( not ( = ?auto_149239 ?auto_149241 ) ) ( not ( = ?auto_149240 ?auto_149241 ) ) ( ON ?auto_149239 ?auto_149240 ) ( ON-TABLE ?auto_149241 ) ( ON ?auto_149238 ?auto_149239 ) ( CLEAR ?auto_149238 ) ( HOLDING ?auto_149237 ) ( CLEAR ?auto_149236 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149234 ?auto_149235 ?auto_149236 ?auto_149237 )
      ( MAKE-7PILE ?auto_149234 ?auto_149235 ?auto_149236 ?auto_149237 ?auto_149238 ?auto_149239 ?auto_149240 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149242 - BLOCK
      ?auto_149243 - BLOCK
      ?auto_149244 - BLOCK
      ?auto_149245 - BLOCK
      ?auto_149246 - BLOCK
      ?auto_149247 - BLOCK
      ?auto_149248 - BLOCK
    )
    :vars
    (
      ?auto_149249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149242 ) ( ON ?auto_149243 ?auto_149242 ) ( ON ?auto_149244 ?auto_149243 ) ( not ( = ?auto_149242 ?auto_149243 ) ) ( not ( = ?auto_149242 ?auto_149244 ) ) ( not ( = ?auto_149242 ?auto_149245 ) ) ( not ( = ?auto_149242 ?auto_149246 ) ) ( not ( = ?auto_149242 ?auto_149247 ) ) ( not ( = ?auto_149242 ?auto_149248 ) ) ( not ( = ?auto_149243 ?auto_149244 ) ) ( not ( = ?auto_149243 ?auto_149245 ) ) ( not ( = ?auto_149243 ?auto_149246 ) ) ( not ( = ?auto_149243 ?auto_149247 ) ) ( not ( = ?auto_149243 ?auto_149248 ) ) ( not ( = ?auto_149244 ?auto_149245 ) ) ( not ( = ?auto_149244 ?auto_149246 ) ) ( not ( = ?auto_149244 ?auto_149247 ) ) ( not ( = ?auto_149244 ?auto_149248 ) ) ( not ( = ?auto_149245 ?auto_149246 ) ) ( not ( = ?auto_149245 ?auto_149247 ) ) ( not ( = ?auto_149245 ?auto_149248 ) ) ( not ( = ?auto_149246 ?auto_149247 ) ) ( not ( = ?auto_149246 ?auto_149248 ) ) ( not ( = ?auto_149247 ?auto_149248 ) ) ( ON ?auto_149248 ?auto_149249 ) ( not ( = ?auto_149242 ?auto_149249 ) ) ( not ( = ?auto_149243 ?auto_149249 ) ) ( not ( = ?auto_149244 ?auto_149249 ) ) ( not ( = ?auto_149245 ?auto_149249 ) ) ( not ( = ?auto_149246 ?auto_149249 ) ) ( not ( = ?auto_149247 ?auto_149249 ) ) ( not ( = ?auto_149248 ?auto_149249 ) ) ( ON ?auto_149247 ?auto_149248 ) ( ON-TABLE ?auto_149249 ) ( ON ?auto_149246 ?auto_149247 ) ( CLEAR ?auto_149244 ) ( ON ?auto_149245 ?auto_149246 ) ( CLEAR ?auto_149245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149249 ?auto_149248 ?auto_149247 ?auto_149246 )
      ( MAKE-7PILE ?auto_149242 ?auto_149243 ?auto_149244 ?auto_149245 ?auto_149246 ?auto_149247 ?auto_149248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149250 - BLOCK
      ?auto_149251 - BLOCK
      ?auto_149252 - BLOCK
      ?auto_149253 - BLOCK
      ?auto_149254 - BLOCK
      ?auto_149255 - BLOCK
      ?auto_149256 - BLOCK
    )
    :vars
    (
      ?auto_149257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149250 ) ( ON ?auto_149251 ?auto_149250 ) ( not ( = ?auto_149250 ?auto_149251 ) ) ( not ( = ?auto_149250 ?auto_149252 ) ) ( not ( = ?auto_149250 ?auto_149253 ) ) ( not ( = ?auto_149250 ?auto_149254 ) ) ( not ( = ?auto_149250 ?auto_149255 ) ) ( not ( = ?auto_149250 ?auto_149256 ) ) ( not ( = ?auto_149251 ?auto_149252 ) ) ( not ( = ?auto_149251 ?auto_149253 ) ) ( not ( = ?auto_149251 ?auto_149254 ) ) ( not ( = ?auto_149251 ?auto_149255 ) ) ( not ( = ?auto_149251 ?auto_149256 ) ) ( not ( = ?auto_149252 ?auto_149253 ) ) ( not ( = ?auto_149252 ?auto_149254 ) ) ( not ( = ?auto_149252 ?auto_149255 ) ) ( not ( = ?auto_149252 ?auto_149256 ) ) ( not ( = ?auto_149253 ?auto_149254 ) ) ( not ( = ?auto_149253 ?auto_149255 ) ) ( not ( = ?auto_149253 ?auto_149256 ) ) ( not ( = ?auto_149254 ?auto_149255 ) ) ( not ( = ?auto_149254 ?auto_149256 ) ) ( not ( = ?auto_149255 ?auto_149256 ) ) ( ON ?auto_149256 ?auto_149257 ) ( not ( = ?auto_149250 ?auto_149257 ) ) ( not ( = ?auto_149251 ?auto_149257 ) ) ( not ( = ?auto_149252 ?auto_149257 ) ) ( not ( = ?auto_149253 ?auto_149257 ) ) ( not ( = ?auto_149254 ?auto_149257 ) ) ( not ( = ?auto_149255 ?auto_149257 ) ) ( not ( = ?auto_149256 ?auto_149257 ) ) ( ON ?auto_149255 ?auto_149256 ) ( ON-TABLE ?auto_149257 ) ( ON ?auto_149254 ?auto_149255 ) ( ON ?auto_149253 ?auto_149254 ) ( CLEAR ?auto_149253 ) ( HOLDING ?auto_149252 ) ( CLEAR ?auto_149251 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149250 ?auto_149251 ?auto_149252 )
      ( MAKE-7PILE ?auto_149250 ?auto_149251 ?auto_149252 ?auto_149253 ?auto_149254 ?auto_149255 ?auto_149256 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149258 - BLOCK
      ?auto_149259 - BLOCK
      ?auto_149260 - BLOCK
      ?auto_149261 - BLOCK
      ?auto_149262 - BLOCK
      ?auto_149263 - BLOCK
      ?auto_149264 - BLOCK
    )
    :vars
    (
      ?auto_149265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149258 ) ( ON ?auto_149259 ?auto_149258 ) ( not ( = ?auto_149258 ?auto_149259 ) ) ( not ( = ?auto_149258 ?auto_149260 ) ) ( not ( = ?auto_149258 ?auto_149261 ) ) ( not ( = ?auto_149258 ?auto_149262 ) ) ( not ( = ?auto_149258 ?auto_149263 ) ) ( not ( = ?auto_149258 ?auto_149264 ) ) ( not ( = ?auto_149259 ?auto_149260 ) ) ( not ( = ?auto_149259 ?auto_149261 ) ) ( not ( = ?auto_149259 ?auto_149262 ) ) ( not ( = ?auto_149259 ?auto_149263 ) ) ( not ( = ?auto_149259 ?auto_149264 ) ) ( not ( = ?auto_149260 ?auto_149261 ) ) ( not ( = ?auto_149260 ?auto_149262 ) ) ( not ( = ?auto_149260 ?auto_149263 ) ) ( not ( = ?auto_149260 ?auto_149264 ) ) ( not ( = ?auto_149261 ?auto_149262 ) ) ( not ( = ?auto_149261 ?auto_149263 ) ) ( not ( = ?auto_149261 ?auto_149264 ) ) ( not ( = ?auto_149262 ?auto_149263 ) ) ( not ( = ?auto_149262 ?auto_149264 ) ) ( not ( = ?auto_149263 ?auto_149264 ) ) ( ON ?auto_149264 ?auto_149265 ) ( not ( = ?auto_149258 ?auto_149265 ) ) ( not ( = ?auto_149259 ?auto_149265 ) ) ( not ( = ?auto_149260 ?auto_149265 ) ) ( not ( = ?auto_149261 ?auto_149265 ) ) ( not ( = ?auto_149262 ?auto_149265 ) ) ( not ( = ?auto_149263 ?auto_149265 ) ) ( not ( = ?auto_149264 ?auto_149265 ) ) ( ON ?auto_149263 ?auto_149264 ) ( ON-TABLE ?auto_149265 ) ( ON ?auto_149262 ?auto_149263 ) ( ON ?auto_149261 ?auto_149262 ) ( CLEAR ?auto_149259 ) ( ON ?auto_149260 ?auto_149261 ) ( CLEAR ?auto_149260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149265 ?auto_149264 ?auto_149263 ?auto_149262 ?auto_149261 )
      ( MAKE-7PILE ?auto_149258 ?auto_149259 ?auto_149260 ?auto_149261 ?auto_149262 ?auto_149263 ?auto_149264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149266 - BLOCK
      ?auto_149267 - BLOCK
      ?auto_149268 - BLOCK
      ?auto_149269 - BLOCK
      ?auto_149270 - BLOCK
      ?auto_149271 - BLOCK
      ?auto_149272 - BLOCK
    )
    :vars
    (
      ?auto_149273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149266 ) ( not ( = ?auto_149266 ?auto_149267 ) ) ( not ( = ?auto_149266 ?auto_149268 ) ) ( not ( = ?auto_149266 ?auto_149269 ) ) ( not ( = ?auto_149266 ?auto_149270 ) ) ( not ( = ?auto_149266 ?auto_149271 ) ) ( not ( = ?auto_149266 ?auto_149272 ) ) ( not ( = ?auto_149267 ?auto_149268 ) ) ( not ( = ?auto_149267 ?auto_149269 ) ) ( not ( = ?auto_149267 ?auto_149270 ) ) ( not ( = ?auto_149267 ?auto_149271 ) ) ( not ( = ?auto_149267 ?auto_149272 ) ) ( not ( = ?auto_149268 ?auto_149269 ) ) ( not ( = ?auto_149268 ?auto_149270 ) ) ( not ( = ?auto_149268 ?auto_149271 ) ) ( not ( = ?auto_149268 ?auto_149272 ) ) ( not ( = ?auto_149269 ?auto_149270 ) ) ( not ( = ?auto_149269 ?auto_149271 ) ) ( not ( = ?auto_149269 ?auto_149272 ) ) ( not ( = ?auto_149270 ?auto_149271 ) ) ( not ( = ?auto_149270 ?auto_149272 ) ) ( not ( = ?auto_149271 ?auto_149272 ) ) ( ON ?auto_149272 ?auto_149273 ) ( not ( = ?auto_149266 ?auto_149273 ) ) ( not ( = ?auto_149267 ?auto_149273 ) ) ( not ( = ?auto_149268 ?auto_149273 ) ) ( not ( = ?auto_149269 ?auto_149273 ) ) ( not ( = ?auto_149270 ?auto_149273 ) ) ( not ( = ?auto_149271 ?auto_149273 ) ) ( not ( = ?auto_149272 ?auto_149273 ) ) ( ON ?auto_149271 ?auto_149272 ) ( ON-TABLE ?auto_149273 ) ( ON ?auto_149270 ?auto_149271 ) ( ON ?auto_149269 ?auto_149270 ) ( ON ?auto_149268 ?auto_149269 ) ( CLEAR ?auto_149268 ) ( HOLDING ?auto_149267 ) ( CLEAR ?auto_149266 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149266 ?auto_149267 )
      ( MAKE-7PILE ?auto_149266 ?auto_149267 ?auto_149268 ?auto_149269 ?auto_149270 ?auto_149271 ?auto_149272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149274 - BLOCK
      ?auto_149275 - BLOCK
      ?auto_149276 - BLOCK
      ?auto_149277 - BLOCK
      ?auto_149278 - BLOCK
      ?auto_149279 - BLOCK
      ?auto_149280 - BLOCK
    )
    :vars
    (
      ?auto_149281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149274 ) ( not ( = ?auto_149274 ?auto_149275 ) ) ( not ( = ?auto_149274 ?auto_149276 ) ) ( not ( = ?auto_149274 ?auto_149277 ) ) ( not ( = ?auto_149274 ?auto_149278 ) ) ( not ( = ?auto_149274 ?auto_149279 ) ) ( not ( = ?auto_149274 ?auto_149280 ) ) ( not ( = ?auto_149275 ?auto_149276 ) ) ( not ( = ?auto_149275 ?auto_149277 ) ) ( not ( = ?auto_149275 ?auto_149278 ) ) ( not ( = ?auto_149275 ?auto_149279 ) ) ( not ( = ?auto_149275 ?auto_149280 ) ) ( not ( = ?auto_149276 ?auto_149277 ) ) ( not ( = ?auto_149276 ?auto_149278 ) ) ( not ( = ?auto_149276 ?auto_149279 ) ) ( not ( = ?auto_149276 ?auto_149280 ) ) ( not ( = ?auto_149277 ?auto_149278 ) ) ( not ( = ?auto_149277 ?auto_149279 ) ) ( not ( = ?auto_149277 ?auto_149280 ) ) ( not ( = ?auto_149278 ?auto_149279 ) ) ( not ( = ?auto_149278 ?auto_149280 ) ) ( not ( = ?auto_149279 ?auto_149280 ) ) ( ON ?auto_149280 ?auto_149281 ) ( not ( = ?auto_149274 ?auto_149281 ) ) ( not ( = ?auto_149275 ?auto_149281 ) ) ( not ( = ?auto_149276 ?auto_149281 ) ) ( not ( = ?auto_149277 ?auto_149281 ) ) ( not ( = ?auto_149278 ?auto_149281 ) ) ( not ( = ?auto_149279 ?auto_149281 ) ) ( not ( = ?auto_149280 ?auto_149281 ) ) ( ON ?auto_149279 ?auto_149280 ) ( ON-TABLE ?auto_149281 ) ( ON ?auto_149278 ?auto_149279 ) ( ON ?auto_149277 ?auto_149278 ) ( ON ?auto_149276 ?auto_149277 ) ( CLEAR ?auto_149274 ) ( ON ?auto_149275 ?auto_149276 ) ( CLEAR ?auto_149275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149281 ?auto_149280 ?auto_149279 ?auto_149278 ?auto_149277 ?auto_149276 )
      ( MAKE-7PILE ?auto_149274 ?auto_149275 ?auto_149276 ?auto_149277 ?auto_149278 ?auto_149279 ?auto_149280 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149282 - BLOCK
      ?auto_149283 - BLOCK
      ?auto_149284 - BLOCK
      ?auto_149285 - BLOCK
      ?auto_149286 - BLOCK
      ?auto_149287 - BLOCK
      ?auto_149288 - BLOCK
    )
    :vars
    (
      ?auto_149289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149282 ?auto_149283 ) ) ( not ( = ?auto_149282 ?auto_149284 ) ) ( not ( = ?auto_149282 ?auto_149285 ) ) ( not ( = ?auto_149282 ?auto_149286 ) ) ( not ( = ?auto_149282 ?auto_149287 ) ) ( not ( = ?auto_149282 ?auto_149288 ) ) ( not ( = ?auto_149283 ?auto_149284 ) ) ( not ( = ?auto_149283 ?auto_149285 ) ) ( not ( = ?auto_149283 ?auto_149286 ) ) ( not ( = ?auto_149283 ?auto_149287 ) ) ( not ( = ?auto_149283 ?auto_149288 ) ) ( not ( = ?auto_149284 ?auto_149285 ) ) ( not ( = ?auto_149284 ?auto_149286 ) ) ( not ( = ?auto_149284 ?auto_149287 ) ) ( not ( = ?auto_149284 ?auto_149288 ) ) ( not ( = ?auto_149285 ?auto_149286 ) ) ( not ( = ?auto_149285 ?auto_149287 ) ) ( not ( = ?auto_149285 ?auto_149288 ) ) ( not ( = ?auto_149286 ?auto_149287 ) ) ( not ( = ?auto_149286 ?auto_149288 ) ) ( not ( = ?auto_149287 ?auto_149288 ) ) ( ON ?auto_149288 ?auto_149289 ) ( not ( = ?auto_149282 ?auto_149289 ) ) ( not ( = ?auto_149283 ?auto_149289 ) ) ( not ( = ?auto_149284 ?auto_149289 ) ) ( not ( = ?auto_149285 ?auto_149289 ) ) ( not ( = ?auto_149286 ?auto_149289 ) ) ( not ( = ?auto_149287 ?auto_149289 ) ) ( not ( = ?auto_149288 ?auto_149289 ) ) ( ON ?auto_149287 ?auto_149288 ) ( ON-TABLE ?auto_149289 ) ( ON ?auto_149286 ?auto_149287 ) ( ON ?auto_149285 ?auto_149286 ) ( ON ?auto_149284 ?auto_149285 ) ( ON ?auto_149283 ?auto_149284 ) ( CLEAR ?auto_149283 ) ( HOLDING ?auto_149282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149282 )
      ( MAKE-7PILE ?auto_149282 ?auto_149283 ?auto_149284 ?auto_149285 ?auto_149286 ?auto_149287 ?auto_149288 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149290 - BLOCK
      ?auto_149291 - BLOCK
      ?auto_149292 - BLOCK
      ?auto_149293 - BLOCK
      ?auto_149294 - BLOCK
      ?auto_149295 - BLOCK
      ?auto_149296 - BLOCK
    )
    :vars
    (
      ?auto_149297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149290 ?auto_149291 ) ) ( not ( = ?auto_149290 ?auto_149292 ) ) ( not ( = ?auto_149290 ?auto_149293 ) ) ( not ( = ?auto_149290 ?auto_149294 ) ) ( not ( = ?auto_149290 ?auto_149295 ) ) ( not ( = ?auto_149290 ?auto_149296 ) ) ( not ( = ?auto_149291 ?auto_149292 ) ) ( not ( = ?auto_149291 ?auto_149293 ) ) ( not ( = ?auto_149291 ?auto_149294 ) ) ( not ( = ?auto_149291 ?auto_149295 ) ) ( not ( = ?auto_149291 ?auto_149296 ) ) ( not ( = ?auto_149292 ?auto_149293 ) ) ( not ( = ?auto_149292 ?auto_149294 ) ) ( not ( = ?auto_149292 ?auto_149295 ) ) ( not ( = ?auto_149292 ?auto_149296 ) ) ( not ( = ?auto_149293 ?auto_149294 ) ) ( not ( = ?auto_149293 ?auto_149295 ) ) ( not ( = ?auto_149293 ?auto_149296 ) ) ( not ( = ?auto_149294 ?auto_149295 ) ) ( not ( = ?auto_149294 ?auto_149296 ) ) ( not ( = ?auto_149295 ?auto_149296 ) ) ( ON ?auto_149296 ?auto_149297 ) ( not ( = ?auto_149290 ?auto_149297 ) ) ( not ( = ?auto_149291 ?auto_149297 ) ) ( not ( = ?auto_149292 ?auto_149297 ) ) ( not ( = ?auto_149293 ?auto_149297 ) ) ( not ( = ?auto_149294 ?auto_149297 ) ) ( not ( = ?auto_149295 ?auto_149297 ) ) ( not ( = ?auto_149296 ?auto_149297 ) ) ( ON ?auto_149295 ?auto_149296 ) ( ON-TABLE ?auto_149297 ) ( ON ?auto_149294 ?auto_149295 ) ( ON ?auto_149293 ?auto_149294 ) ( ON ?auto_149292 ?auto_149293 ) ( ON ?auto_149291 ?auto_149292 ) ( ON ?auto_149290 ?auto_149291 ) ( CLEAR ?auto_149290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149297 ?auto_149296 ?auto_149295 ?auto_149294 ?auto_149293 ?auto_149292 ?auto_149291 )
      ( MAKE-7PILE ?auto_149290 ?auto_149291 ?auto_149292 ?auto_149293 ?auto_149294 ?auto_149295 ?auto_149296 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149298 - BLOCK
      ?auto_149299 - BLOCK
      ?auto_149300 - BLOCK
      ?auto_149301 - BLOCK
      ?auto_149302 - BLOCK
      ?auto_149303 - BLOCK
      ?auto_149304 - BLOCK
    )
    :vars
    (
      ?auto_149305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149298 ?auto_149299 ) ) ( not ( = ?auto_149298 ?auto_149300 ) ) ( not ( = ?auto_149298 ?auto_149301 ) ) ( not ( = ?auto_149298 ?auto_149302 ) ) ( not ( = ?auto_149298 ?auto_149303 ) ) ( not ( = ?auto_149298 ?auto_149304 ) ) ( not ( = ?auto_149299 ?auto_149300 ) ) ( not ( = ?auto_149299 ?auto_149301 ) ) ( not ( = ?auto_149299 ?auto_149302 ) ) ( not ( = ?auto_149299 ?auto_149303 ) ) ( not ( = ?auto_149299 ?auto_149304 ) ) ( not ( = ?auto_149300 ?auto_149301 ) ) ( not ( = ?auto_149300 ?auto_149302 ) ) ( not ( = ?auto_149300 ?auto_149303 ) ) ( not ( = ?auto_149300 ?auto_149304 ) ) ( not ( = ?auto_149301 ?auto_149302 ) ) ( not ( = ?auto_149301 ?auto_149303 ) ) ( not ( = ?auto_149301 ?auto_149304 ) ) ( not ( = ?auto_149302 ?auto_149303 ) ) ( not ( = ?auto_149302 ?auto_149304 ) ) ( not ( = ?auto_149303 ?auto_149304 ) ) ( ON ?auto_149304 ?auto_149305 ) ( not ( = ?auto_149298 ?auto_149305 ) ) ( not ( = ?auto_149299 ?auto_149305 ) ) ( not ( = ?auto_149300 ?auto_149305 ) ) ( not ( = ?auto_149301 ?auto_149305 ) ) ( not ( = ?auto_149302 ?auto_149305 ) ) ( not ( = ?auto_149303 ?auto_149305 ) ) ( not ( = ?auto_149304 ?auto_149305 ) ) ( ON ?auto_149303 ?auto_149304 ) ( ON-TABLE ?auto_149305 ) ( ON ?auto_149302 ?auto_149303 ) ( ON ?auto_149301 ?auto_149302 ) ( ON ?auto_149300 ?auto_149301 ) ( ON ?auto_149299 ?auto_149300 ) ( HOLDING ?auto_149298 ) ( CLEAR ?auto_149299 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149305 ?auto_149304 ?auto_149303 ?auto_149302 ?auto_149301 ?auto_149300 ?auto_149299 ?auto_149298 )
      ( MAKE-7PILE ?auto_149298 ?auto_149299 ?auto_149300 ?auto_149301 ?auto_149302 ?auto_149303 ?auto_149304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149306 - BLOCK
      ?auto_149307 - BLOCK
      ?auto_149308 - BLOCK
      ?auto_149309 - BLOCK
      ?auto_149310 - BLOCK
      ?auto_149311 - BLOCK
      ?auto_149312 - BLOCK
    )
    :vars
    (
      ?auto_149313 - BLOCK
      ?auto_149314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149306 ?auto_149307 ) ) ( not ( = ?auto_149306 ?auto_149308 ) ) ( not ( = ?auto_149306 ?auto_149309 ) ) ( not ( = ?auto_149306 ?auto_149310 ) ) ( not ( = ?auto_149306 ?auto_149311 ) ) ( not ( = ?auto_149306 ?auto_149312 ) ) ( not ( = ?auto_149307 ?auto_149308 ) ) ( not ( = ?auto_149307 ?auto_149309 ) ) ( not ( = ?auto_149307 ?auto_149310 ) ) ( not ( = ?auto_149307 ?auto_149311 ) ) ( not ( = ?auto_149307 ?auto_149312 ) ) ( not ( = ?auto_149308 ?auto_149309 ) ) ( not ( = ?auto_149308 ?auto_149310 ) ) ( not ( = ?auto_149308 ?auto_149311 ) ) ( not ( = ?auto_149308 ?auto_149312 ) ) ( not ( = ?auto_149309 ?auto_149310 ) ) ( not ( = ?auto_149309 ?auto_149311 ) ) ( not ( = ?auto_149309 ?auto_149312 ) ) ( not ( = ?auto_149310 ?auto_149311 ) ) ( not ( = ?auto_149310 ?auto_149312 ) ) ( not ( = ?auto_149311 ?auto_149312 ) ) ( ON ?auto_149312 ?auto_149313 ) ( not ( = ?auto_149306 ?auto_149313 ) ) ( not ( = ?auto_149307 ?auto_149313 ) ) ( not ( = ?auto_149308 ?auto_149313 ) ) ( not ( = ?auto_149309 ?auto_149313 ) ) ( not ( = ?auto_149310 ?auto_149313 ) ) ( not ( = ?auto_149311 ?auto_149313 ) ) ( not ( = ?auto_149312 ?auto_149313 ) ) ( ON ?auto_149311 ?auto_149312 ) ( ON-TABLE ?auto_149313 ) ( ON ?auto_149310 ?auto_149311 ) ( ON ?auto_149309 ?auto_149310 ) ( ON ?auto_149308 ?auto_149309 ) ( ON ?auto_149307 ?auto_149308 ) ( CLEAR ?auto_149307 ) ( ON ?auto_149306 ?auto_149314 ) ( CLEAR ?auto_149306 ) ( HAND-EMPTY ) ( not ( = ?auto_149306 ?auto_149314 ) ) ( not ( = ?auto_149307 ?auto_149314 ) ) ( not ( = ?auto_149308 ?auto_149314 ) ) ( not ( = ?auto_149309 ?auto_149314 ) ) ( not ( = ?auto_149310 ?auto_149314 ) ) ( not ( = ?auto_149311 ?auto_149314 ) ) ( not ( = ?auto_149312 ?auto_149314 ) ) ( not ( = ?auto_149313 ?auto_149314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149306 ?auto_149314 )
      ( MAKE-7PILE ?auto_149306 ?auto_149307 ?auto_149308 ?auto_149309 ?auto_149310 ?auto_149311 ?auto_149312 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149315 - BLOCK
      ?auto_149316 - BLOCK
      ?auto_149317 - BLOCK
      ?auto_149318 - BLOCK
      ?auto_149319 - BLOCK
      ?auto_149320 - BLOCK
      ?auto_149321 - BLOCK
    )
    :vars
    (
      ?auto_149323 - BLOCK
      ?auto_149322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149315 ?auto_149316 ) ) ( not ( = ?auto_149315 ?auto_149317 ) ) ( not ( = ?auto_149315 ?auto_149318 ) ) ( not ( = ?auto_149315 ?auto_149319 ) ) ( not ( = ?auto_149315 ?auto_149320 ) ) ( not ( = ?auto_149315 ?auto_149321 ) ) ( not ( = ?auto_149316 ?auto_149317 ) ) ( not ( = ?auto_149316 ?auto_149318 ) ) ( not ( = ?auto_149316 ?auto_149319 ) ) ( not ( = ?auto_149316 ?auto_149320 ) ) ( not ( = ?auto_149316 ?auto_149321 ) ) ( not ( = ?auto_149317 ?auto_149318 ) ) ( not ( = ?auto_149317 ?auto_149319 ) ) ( not ( = ?auto_149317 ?auto_149320 ) ) ( not ( = ?auto_149317 ?auto_149321 ) ) ( not ( = ?auto_149318 ?auto_149319 ) ) ( not ( = ?auto_149318 ?auto_149320 ) ) ( not ( = ?auto_149318 ?auto_149321 ) ) ( not ( = ?auto_149319 ?auto_149320 ) ) ( not ( = ?auto_149319 ?auto_149321 ) ) ( not ( = ?auto_149320 ?auto_149321 ) ) ( ON ?auto_149321 ?auto_149323 ) ( not ( = ?auto_149315 ?auto_149323 ) ) ( not ( = ?auto_149316 ?auto_149323 ) ) ( not ( = ?auto_149317 ?auto_149323 ) ) ( not ( = ?auto_149318 ?auto_149323 ) ) ( not ( = ?auto_149319 ?auto_149323 ) ) ( not ( = ?auto_149320 ?auto_149323 ) ) ( not ( = ?auto_149321 ?auto_149323 ) ) ( ON ?auto_149320 ?auto_149321 ) ( ON-TABLE ?auto_149323 ) ( ON ?auto_149319 ?auto_149320 ) ( ON ?auto_149318 ?auto_149319 ) ( ON ?auto_149317 ?auto_149318 ) ( ON ?auto_149315 ?auto_149322 ) ( CLEAR ?auto_149315 ) ( not ( = ?auto_149315 ?auto_149322 ) ) ( not ( = ?auto_149316 ?auto_149322 ) ) ( not ( = ?auto_149317 ?auto_149322 ) ) ( not ( = ?auto_149318 ?auto_149322 ) ) ( not ( = ?auto_149319 ?auto_149322 ) ) ( not ( = ?auto_149320 ?auto_149322 ) ) ( not ( = ?auto_149321 ?auto_149322 ) ) ( not ( = ?auto_149323 ?auto_149322 ) ) ( HOLDING ?auto_149316 ) ( CLEAR ?auto_149317 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149323 ?auto_149321 ?auto_149320 ?auto_149319 ?auto_149318 ?auto_149317 ?auto_149316 )
      ( MAKE-7PILE ?auto_149315 ?auto_149316 ?auto_149317 ?auto_149318 ?auto_149319 ?auto_149320 ?auto_149321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149324 - BLOCK
      ?auto_149325 - BLOCK
      ?auto_149326 - BLOCK
      ?auto_149327 - BLOCK
      ?auto_149328 - BLOCK
      ?auto_149329 - BLOCK
      ?auto_149330 - BLOCK
    )
    :vars
    (
      ?auto_149331 - BLOCK
      ?auto_149332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149324 ?auto_149325 ) ) ( not ( = ?auto_149324 ?auto_149326 ) ) ( not ( = ?auto_149324 ?auto_149327 ) ) ( not ( = ?auto_149324 ?auto_149328 ) ) ( not ( = ?auto_149324 ?auto_149329 ) ) ( not ( = ?auto_149324 ?auto_149330 ) ) ( not ( = ?auto_149325 ?auto_149326 ) ) ( not ( = ?auto_149325 ?auto_149327 ) ) ( not ( = ?auto_149325 ?auto_149328 ) ) ( not ( = ?auto_149325 ?auto_149329 ) ) ( not ( = ?auto_149325 ?auto_149330 ) ) ( not ( = ?auto_149326 ?auto_149327 ) ) ( not ( = ?auto_149326 ?auto_149328 ) ) ( not ( = ?auto_149326 ?auto_149329 ) ) ( not ( = ?auto_149326 ?auto_149330 ) ) ( not ( = ?auto_149327 ?auto_149328 ) ) ( not ( = ?auto_149327 ?auto_149329 ) ) ( not ( = ?auto_149327 ?auto_149330 ) ) ( not ( = ?auto_149328 ?auto_149329 ) ) ( not ( = ?auto_149328 ?auto_149330 ) ) ( not ( = ?auto_149329 ?auto_149330 ) ) ( ON ?auto_149330 ?auto_149331 ) ( not ( = ?auto_149324 ?auto_149331 ) ) ( not ( = ?auto_149325 ?auto_149331 ) ) ( not ( = ?auto_149326 ?auto_149331 ) ) ( not ( = ?auto_149327 ?auto_149331 ) ) ( not ( = ?auto_149328 ?auto_149331 ) ) ( not ( = ?auto_149329 ?auto_149331 ) ) ( not ( = ?auto_149330 ?auto_149331 ) ) ( ON ?auto_149329 ?auto_149330 ) ( ON-TABLE ?auto_149331 ) ( ON ?auto_149328 ?auto_149329 ) ( ON ?auto_149327 ?auto_149328 ) ( ON ?auto_149326 ?auto_149327 ) ( ON ?auto_149324 ?auto_149332 ) ( not ( = ?auto_149324 ?auto_149332 ) ) ( not ( = ?auto_149325 ?auto_149332 ) ) ( not ( = ?auto_149326 ?auto_149332 ) ) ( not ( = ?auto_149327 ?auto_149332 ) ) ( not ( = ?auto_149328 ?auto_149332 ) ) ( not ( = ?auto_149329 ?auto_149332 ) ) ( not ( = ?auto_149330 ?auto_149332 ) ) ( not ( = ?auto_149331 ?auto_149332 ) ) ( CLEAR ?auto_149326 ) ( ON ?auto_149325 ?auto_149324 ) ( CLEAR ?auto_149325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149332 ?auto_149324 )
      ( MAKE-7PILE ?auto_149324 ?auto_149325 ?auto_149326 ?auto_149327 ?auto_149328 ?auto_149329 ?auto_149330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149333 - BLOCK
      ?auto_149334 - BLOCK
      ?auto_149335 - BLOCK
      ?auto_149336 - BLOCK
      ?auto_149337 - BLOCK
      ?auto_149338 - BLOCK
      ?auto_149339 - BLOCK
    )
    :vars
    (
      ?auto_149341 - BLOCK
      ?auto_149340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149333 ?auto_149334 ) ) ( not ( = ?auto_149333 ?auto_149335 ) ) ( not ( = ?auto_149333 ?auto_149336 ) ) ( not ( = ?auto_149333 ?auto_149337 ) ) ( not ( = ?auto_149333 ?auto_149338 ) ) ( not ( = ?auto_149333 ?auto_149339 ) ) ( not ( = ?auto_149334 ?auto_149335 ) ) ( not ( = ?auto_149334 ?auto_149336 ) ) ( not ( = ?auto_149334 ?auto_149337 ) ) ( not ( = ?auto_149334 ?auto_149338 ) ) ( not ( = ?auto_149334 ?auto_149339 ) ) ( not ( = ?auto_149335 ?auto_149336 ) ) ( not ( = ?auto_149335 ?auto_149337 ) ) ( not ( = ?auto_149335 ?auto_149338 ) ) ( not ( = ?auto_149335 ?auto_149339 ) ) ( not ( = ?auto_149336 ?auto_149337 ) ) ( not ( = ?auto_149336 ?auto_149338 ) ) ( not ( = ?auto_149336 ?auto_149339 ) ) ( not ( = ?auto_149337 ?auto_149338 ) ) ( not ( = ?auto_149337 ?auto_149339 ) ) ( not ( = ?auto_149338 ?auto_149339 ) ) ( ON ?auto_149339 ?auto_149341 ) ( not ( = ?auto_149333 ?auto_149341 ) ) ( not ( = ?auto_149334 ?auto_149341 ) ) ( not ( = ?auto_149335 ?auto_149341 ) ) ( not ( = ?auto_149336 ?auto_149341 ) ) ( not ( = ?auto_149337 ?auto_149341 ) ) ( not ( = ?auto_149338 ?auto_149341 ) ) ( not ( = ?auto_149339 ?auto_149341 ) ) ( ON ?auto_149338 ?auto_149339 ) ( ON-TABLE ?auto_149341 ) ( ON ?auto_149337 ?auto_149338 ) ( ON ?auto_149336 ?auto_149337 ) ( ON ?auto_149333 ?auto_149340 ) ( not ( = ?auto_149333 ?auto_149340 ) ) ( not ( = ?auto_149334 ?auto_149340 ) ) ( not ( = ?auto_149335 ?auto_149340 ) ) ( not ( = ?auto_149336 ?auto_149340 ) ) ( not ( = ?auto_149337 ?auto_149340 ) ) ( not ( = ?auto_149338 ?auto_149340 ) ) ( not ( = ?auto_149339 ?auto_149340 ) ) ( not ( = ?auto_149341 ?auto_149340 ) ) ( ON ?auto_149334 ?auto_149333 ) ( CLEAR ?auto_149334 ) ( ON-TABLE ?auto_149340 ) ( HOLDING ?auto_149335 ) ( CLEAR ?auto_149336 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149341 ?auto_149339 ?auto_149338 ?auto_149337 ?auto_149336 ?auto_149335 )
      ( MAKE-7PILE ?auto_149333 ?auto_149334 ?auto_149335 ?auto_149336 ?auto_149337 ?auto_149338 ?auto_149339 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149342 - BLOCK
      ?auto_149343 - BLOCK
      ?auto_149344 - BLOCK
      ?auto_149345 - BLOCK
      ?auto_149346 - BLOCK
      ?auto_149347 - BLOCK
      ?auto_149348 - BLOCK
    )
    :vars
    (
      ?auto_149349 - BLOCK
      ?auto_149350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149342 ?auto_149343 ) ) ( not ( = ?auto_149342 ?auto_149344 ) ) ( not ( = ?auto_149342 ?auto_149345 ) ) ( not ( = ?auto_149342 ?auto_149346 ) ) ( not ( = ?auto_149342 ?auto_149347 ) ) ( not ( = ?auto_149342 ?auto_149348 ) ) ( not ( = ?auto_149343 ?auto_149344 ) ) ( not ( = ?auto_149343 ?auto_149345 ) ) ( not ( = ?auto_149343 ?auto_149346 ) ) ( not ( = ?auto_149343 ?auto_149347 ) ) ( not ( = ?auto_149343 ?auto_149348 ) ) ( not ( = ?auto_149344 ?auto_149345 ) ) ( not ( = ?auto_149344 ?auto_149346 ) ) ( not ( = ?auto_149344 ?auto_149347 ) ) ( not ( = ?auto_149344 ?auto_149348 ) ) ( not ( = ?auto_149345 ?auto_149346 ) ) ( not ( = ?auto_149345 ?auto_149347 ) ) ( not ( = ?auto_149345 ?auto_149348 ) ) ( not ( = ?auto_149346 ?auto_149347 ) ) ( not ( = ?auto_149346 ?auto_149348 ) ) ( not ( = ?auto_149347 ?auto_149348 ) ) ( ON ?auto_149348 ?auto_149349 ) ( not ( = ?auto_149342 ?auto_149349 ) ) ( not ( = ?auto_149343 ?auto_149349 ) ) ( not ( = ?auto_149344 ?auto_149349 ) ) ( not ( = ?auto_149345 ?auto_149349 ) ) ( not ( = ?auto_149346 ?auto_149349 ) ) ( not ( = ?auto_149347 ?auto_149349 ) ) ( not ( = ?auto_149348 ?auto_149349 ) ) ( ON ?auto_149347 ?auto_149348 ) ( ON-TABLE ?auto_149349 ) ( ON ?auto_149346 ?auto_149347 ) ( ON ?auto_149345 ?auto_149346 ) ( ON ?auto_149342 ?auto_149350 ) ( not ( = ?auto_149342 ?auto_149350 ) ) ( not ( = ?auto_149343 ?auto_149350 ) ) ( not ( = ?auto_149344 ?auto_149350 ) ) ( not ( = ?auto_149345 ?auto_149350 ) ) ( not ( = ?auto_149346 ?auto_149350 ) ) ( not ( = ?auto_149347 ?auto_149350 ) ) ( not ( = ?auto_149348 ?auto_149350 ) ) ( not ( = ?auto_149349 ?auto_149350 ) ) ( ON ?auto_149343 ?auto_149342 ) ( ON-TABLE ?auto_149350 ) ( CLEAR ?auto_149345 ) ( ON ?auto_149344 ?auto_149343 ) ( CLEAR ?auto_149344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149350 ?auto_149342 ?auto_149343 )
      ( MAKE-7PILE ?auto_149342 ?auto_149343 ?auto_149344 ?auto_149345 ?auto_149346 ?auto_149347 ?auto_149348 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149351 - BLOCK
      ?auto_149352 - BLOCK
      ?auto_149353 - BLOCK
      ?auto_149354 - BLOCK
      ?auto_149355 - BLOCK
      ?auto_149356 - BLOCK
      ?auto_149357 - BLOCK
    )
    :vars
    (
      ?auto_149359 - BLOCK
      ?auto_149358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149351 ?auto_149352 ) ) ( not ( = ?auto_149351 ?auto_149353 ) ) ( not ( = ?auto_149351 ?auto_149354 ) ) ( not ( = ?auto_149351 ?auto_149355 ) ) ( not ( = ?auto_149351 ?auto_149356 ) ) ( not ( = ?auto_149351 ?auto_149357 ) ) ( not ( = ?auto_149352 ?auto_149353 ) ) ( not ( = ?auto_149352 ?auto_149354 ) ) ( not ( = ?auto_149352 ?auto_149355 ) ) ( not ( = ?auto_149352 ?auto_149356 ) ) ( not ( = ?auto_149352 ?auto_149357 ) ) ( not ( = ?auto_149353 ?auto_149354 ) ) ( not ( = ?auto_149353 ?auto_149355 ) ) ( not ( = ?auto_149353 ?auto_149356 ) ) ( not ( = ?auto_149353 ?auto_149357 ) ) ( not ( = ?auto_149354 ?auto_149355 ) ) ( not ( = ?auto_149354 ?auto_149356 ) ) ( not ( = ?auto_149354 ?auto_149357 ) ) ( not ( = ?auto_149355 ?auto_149356 ) ) ( not ( = ?auto_149355 ?auto_149357 ) ) ( not ( = ?auto_149356 ?auto_149357 ) ) ( ON ?auto_149357 ?auto_149359 ) ( not ( = ?auto_149351 ?auto_149359 ) ) ( not ( = ?auto_149352 ?auto_149359 ) ) ( not ( = ?auto_149353 ?auto_149359 ) ) ( not ( = ?auto_149354 ?auto_149359 ) ) ( not ( = ?auto_149355 ?auto_149359 ) ) ( not ( = ?auto_149356 ?auto_149359 ) ) ( not ( = ?auto_149357 ?auto_149359 ) ) ( ON ?auto_149356 ?auto_149357 ) ( ON-TABLE ?auto_149359 ) ( ON ?auto_149355 ?auto_149356 ) ( ON ?auto_149351 ?auto_149358 ) ( not ( = ?auto_149351 ?auto_149358 ) ) ( not ( = ?auto_149352 ?auto_149358 ) ) ( not ( = ?auto_149353 ?auto_149358 ) ) ( not ( = ?auto_149354 ?auto_149358 ) ) ( not ( = ?auto_149355 ?auto_149358 ) ) ( not ( = ?auto_149356 ?auto_149358 ) ) ( not ( = ?auto_149357 ?auto_149358 ) ) ( not ( = ?auto_149359 ?auto_149358 ) ) ( ON ?auto_149352 ?auto_149351 ) ( ON-TABLE ?auto_149358 ) ( ON ?auto_149353 ?auto_149352 ) ( CLEAR ?auto_149353 ) ( HOLDING ?auto_149354 ) ( CLEAR ?auto_149355 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149359 ?auto_149357 ?auto_149356 ?auto_149355 ?auto_149354 )
      ( MAKE-7PILE ?auto_149351 ?auto_149352 ?auto_149353 ?auto_149354 ?auto_149355 ?auto_149356 ?auto_149357 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149360 - BLOCK
      ?auto_149361 - BLOCK
      ?auto_149362 - BLOCK
      ?auto_149363 - BLOCK
      ?auto_149364 - BLOCK
      ?auto_149365 - BLOCK
      ?auto_149366 - BLOCK
    )
    :vars
    (
      ?auto_149367 - BLOCK
      ?auto_149368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149360 ?auto_149361 ) ) ( not ( = ?auto_149360 ?auto_149362 ) ) ( not ( = ?auto_149360 ?auto_149363 ) ) ( not ( = ?auto_149360 ?auto_149364 ) ) ( not ( = ?auto_149360 ?auto_149365 ) ) ( not ( = ?auto_149360 ?auto_149366 ) ) ( not ( = ?auto_149361 ?auto_149362 ) ) ( not ( = ?auto_149361 ?auto_149363 ) ) ( not ( = ?auto_149361 ?auto_149364 ) ) ( not ( = ?auto_149361 ?auto_149365 ) ) ( not ( = ?auto_149361 ?auto_149366 ) ) ( not ( = ?auto_149362 ?auto_149363 ) ) ( not ( = ?auto_149362 ?auto_149364 ) ) ( not ( = ?auto_149362 ?auto_149365 ) ) ( not ( = ?auto_149362 ?auto_149366 ) ) ( not ( = ?auto_149363 ?auto_149364 ) ) ( not ( = ?auto_149363 ?auto_149365 ) ) ( not ( = ?auto_149363 ?auto_149366 ) ) ( not ( = ?auto_149364 ?auto_149365 ) ) ( not ( = ?auto_149364 ?auto_149366 ) ) ( not ( = ?auto_149365 ?auto_149366 ) ) ( ON ?auto_149366 ?auto_149367 ) ( not ( = ?auto_149360 ?auto_149367 ) ) ( not ( = ?auto_149361 ?auto_149367 ) ) ( not ( = ?auto_149362 ?auto_149367 ) ) ( not ( = ?auto_149363 ?auto_149367 ) ) ( not ( = ?auto_149364 ?auto_149367 ) ) ( not ( = ?auto_149365 ?auto_149367 ) ) ( not ( = ?auto_149366 ?auto_149367 ) ) ( ON ?auto_149365 ?auto_149366 ) ( ON-TABLE ?auto_149367 ) ( ON ?auto_149364 ?auto_149365 ) ( ON ?auto_149360 ?auto_149368 ) ( not ( = ?auto_149360 ?auto_149368 ) ) ( not ( = ?auto_149361 ?auto_149368 ) ) ( not ( = ?auto_149362 ?auto_149368 ) ) ( not ( = ?auto_149363 ?auto_149368 ) ) ( not ( = ?auto_149364 ?auto_149368 ) ) ( not ( = ?auto_149365 ?auto_149368 ) ) ( not ( = ?auto_149366 ?auto_149368 ) ) ( not ( = ?auto_149367 ?auto_149368 ) ) ( ON ?auto_149361 ?auto_149360 ) ( ON-TABLE ?auto_149368 ) ( ON ?auto_149362 ?auto_149361 ) ( CLEAR ?auto_149364 ) ( ON ?auto_149363 ?auto_149362 ) ( CLEAR ?auto_149363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149368 ?auto_149360 ?auto_149361 ?auto_149362 )
      ( MAKE-7PILE ?auto_149360 ?auto_149361 ?auto_149362 ?auto_149363 ?auto_149364 ?auto_149365 ?auto_149366 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149369 - BLOCK
      ?auto_149370 - BLOCK
      ?auto_149371 - BLOCK
      ?auto_149372 - BLOCK
      ?auto_149373 - BLOCK
      ?auto_149374 - BLOCK
      ?auto_149375 - BLOCK
    )
    :vars
    (
      ?auto_149377 - BLOCK
      ?auto_149376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149369 ?auto_149370 ) ) ( not ( = ?auto_149369 ?auto_149371 ) ) ( not ( = ?auto_149369 ?auto_149372 ) ) ( not ( = ?auto_149369 ?auto_149373 ) ) ( not ( = ?auto_149369 ?auto_149374 ) ) ( not ( = ?auto_149369 ?auto_149375 ) ) ( not ( = ?auto_149370 ?auto_149371 ) ) ( not ( = ?auto_149370 ?auto_149372 ) ) ( not ( = ?auto_149370 ?auto_149373 ) ) ( not ( = ?auto_149370 ?auto_149374 ) ) ( not ( = ?auto_149370 ?auto_149375 ) ) ( not ( = ?auto_149371 ?auto_149372 ) ) ( not ( = ?auto_149371 ?auto_149373 ) ) ( not ( = ?auto_149371 ?auto_149374 ) ) ( not ( = ?auto_149371 ?auto_149375 ) ) ( not ( = ?auto_149372 ?auto_149373 ) ) ( not ( = ?auto_149372 ?auto_149374 ) ) ( not ( = ?auto_149372 ?auto_149375 ) ) ( not ( = ?auto_149373 ?auto_149374 ) ) ( not ( = ?auto_149373 ?auto_149375 ) ) ( not ( = ?auto_149374 ?auto_149375 ) ) ( ON ?auto_149375 ?auto_149377 ) ( not ( = ?auto_149369 ?auto_149377 ) ) ( not ( = ?auto_149370 ?auto_149377 ) ) ( not ( = ?auto_149371 ?auto_149377 ) ) ( not ( = ?auto_149372 ?auto_149377 ) ) ( not ( = ?auto_149373 ?auto_149377 ) ) ( not ( = ?auto_149374 ?auto_149377 ) ) ( not ( = ?auto_149375 ?auto_149377 ) ) ( ON ?auto_149374 ?auto_149375 ) ( ON-TABLE ?auto_149377 ) ( ON ?auto_149369 ?auto_149376 ) ( not ( = ?auto_149369 ?auto_149376 ) ) ( not ( = ?auto_149370 ?auto_149376 ) ) ( not ( = ?auto_149371 ?auto_149376 ) ) ( not ( = ?auto_149372 ?auto_149376 ) ) ( not ( = ?auto_149373 ?auto_149376 ) ) ( not ( = ?auto_149374 ?auto_149376 ) ) ( not ( = ?auto_149375 ?auto_149376 ) ) ( not ( = ?auto_149377 ?auto_149376 ) ) ( ON ?auto_149370 ?auto_149369 ) ( ON-TABLE ?auto_149376 ) ( ON ?auto_149371 ?auto_149370 ) ( ON ?auto_149372 ?auto_149371 ) ( CLEAR ?auto_149372 ) ( HOLDING ?auto_149373 ) ( CLEAR ?auto_149374 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149377 ?auto_149375 ?auto_149374 ?auto_149373 )
      ( MAKE-7PILE ?auto_149369 ?auto_149370 ?auto_149371 ?auto_149372 ?auto_149373 ?auto_149374 ?auto_149375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149378 - BLOCK
      ?auto_149379 - BLOCK
      ?auto_149380 - BLOCK
      ?auto_149381 - BLOCK
      ?auto_149382 - BLOCK
      ?auto_149383 - BLOCK
      ?auto_149384 - BLOCK
    )
    :vars
    (
      ?auto_149385 - BLOCK
      ?auto_149386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149378 ?auto_149379 ) ) ( not ( = ?auto_149378 ?auto_149380 ) ) ( not ( = ?auto_149378 ?auto_149381 ) ) ( not ( = ?auto_149378 ?auto_149382 ) ) ( not ( = ?auto_149378 ?auto_149383 ) ) ( not ( = ?auto_149378 ?auto_149384 ) ) ( not ( = ?auto_149379 ?auto_149380 ) ) ( not ( = ?auto_149379 ?auto_149381 ) ) ( not ( = ?auto_149379 ?auto_149382 ) ) ( not ( = ?auto_149379 ?auto_149383 ) ) ( not ( = ?auto_149379 ?auto_149384 ) ) ( not ( = ?auto_149380 ?auto_149381 ) ) ( not ( = ?auto_149380 ?auto_149382 ) ) ( not ( = ?auto_149380 ?auto_149383 ) ) ( not ( = ?auto_149380 ?auto_149384 ) ) ( not ( = ?auto_149381 ?auto_149382 ) ) ( not ( = ?auto_149381 ?auto_149383 ) ) ( not ( = ?auto_149381 ?auto_149384 ) ) ( not ( = ?auto_149382 ?auto_149383 ) ) ( not ( = ?auto_149382 ?auto_149384 ) ) ( not ( = ?auto_149383 ?auto_149384 ) ) ( ON ?auto_149384 ?auto_149385 ) ( not ( = ?auto_149378 ?auto_149385 ) ) ( not ( = ?auto_149379 ?auto_149385 ) ) ( not ( = ?auto_149380 ?auto_149385 ) ) ( not ( = ?auto_149381 ?auto_149385 ) ) ( not ( = ?auto_149382 ?auto_149385 ) ) ( not ( = ?auto_149383 ?auto_149385 ) ) ( not ( = ?auto_149384 ?auto_149385 ) ) ( ON ?auto_149383 ?auto_149384 ) ( ON-TABLE ?auto_149385 ) ( ON ?auto_149378 ?auto_149386 ) ( not ( = ?auto_149378 ?auto_149386 ) ) ( not ( = ?auto_149379 ?auto_149386 ) ) ( not ( = ?auto_149380 ?auto_149386 ) ) ( not ( = ?auto_149381 ?auto_149386 ) ) ( not ( = ?auto_149382 ?auto_149386 ) ) ( not ( = ?auto_149383 ?auto_149386 ) ) ( not ( = ?auto_149384 ?auto_149386 ) ) ( not ( = ?auto_149385 ?auto_149386 ) ) ( ON ?auto_149379 ?auto_149378 ) ( ON-TABLE ?auto_149386 ) ( ON ?auto_149380 ?auto_149379 ) ( ON ?auto_149381 ?auto_149380 ) ( CLEAR ?auto_149383 ) ( ON ?auto_149382 ?auto_149381 ) ( CLEAR ?auto_149382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149386 ?auto_149378 ?auto_149379 ?auto_149380 ?auto_149381 )
      ( MAKE-7PILE ?auto_149378 ?auto_149379 ?auto_149380 ?auto_149381 ?auto_149382 ?auto_149383 ?auto_149384 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149387 - BLOCK
      ?auto_149388 - BLOCK
      ?auto_149389 - BLOCK
      ?auto_149390 - BLOCK
      ?auto_149391 - BLOCK
      ?auto_149392 - BLOCK
      ?auto_149393 - BLOCK
    )
    :vars
    (
      ?auto_149394 - BLOCK
      ?auto_149395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149387 ?auto_149388 ) ) ( not ( = ?auto_149387 ?auto_149389 ) ) ( not ( = ?auto_149387 ?auto_149390 ) ) ( not ( = ?auto_149387 ?auto_149391 ) ) ( not ( = ?auto_149387 ?auto_149392 ) ) ( not ( = ?auto_149387 ?auto_149393 ) ) ( not ( = ?auto_149388 ?auto_149389 ) ) ( not ( = ?auto_149388 ?auto_149390 ) ) ( not ( = ?auto_149388 ?auto_149391 ) ) ( not ( = ?auto_149388 ?auto_149392 ) ) ( not ( = ?auto_149388 ?auto_149393 ) ) ( not ( = ?auto_149389 ?auto_149390 ) ) ( not ( = ?auto_149389 ?auto_149391 ) ) ( not ( = ?auto_149389 ?auto_149392 ) ) ( not ( = ?auto_149389 ?auto_149393 ) ) ( not ( = ?auto_149390 ?auto_149391 ) ) ( not ( = ?auto_149390 ?auto_149392 ) ) ( not ( = ?auto_149390 ?auto_149393 ) ) ( not ( = ?auto_149391 ?auto_149392 ) ) ( not ( = ?auto_149391 ?auto_149393 ) ) ( not ( = ?auto_149392 ?auto_149393 ) ) ( ON ?auto_149393 ?auto_149394 ) ( not ( = ?auto_149387 ?auto_149394 ) ) ( not ( = ?auto_149388 ?auto_149394 ) ) ( not ( = ?auto_149389 ?auto_149394 ) ) ( not ( = ?auto_149390 ?auto_149394 ) ) ( not ( = ?auto_149391 ?auto_149394 ) ) ( not ( = ?auto_149392 ?auto_149394 ) ) ( not ( = ?auto_149393 ?auto_149394 ) ) ( ON-TABLE ?auto_149394 ) ( ON ?auto_149387 ?auto_149395 ) ( not ( = ?auto_149387 ?auto_149395 ) ) ( not ( = ?auto_149388 ?auto_149395 ) ) ( not ( = ?auto_149389 ?auto_149395 ) ) ( not ( = ?auto_149390 ?auto_149395 ) ) ( not ( = ?auto_149391 ?auto_149395 ) ) ( not ( = ?auto_149392 ?auto_149395 ) ) ( not ( = ?auto_149393 ?auto_149395 ) ) ( not ( = ?auto_149394 ?auto_149395 ) ) ( ON ?auto_149388 ?auto_149387 ) ( ON-TABLE ?auto_149395 ) ( ON ?auto_149389 ?auto_149388 ) ( ON ?auto_149390 ?auto_149389 ) ( ON ?auto_149391 ?auto_149390 ) ( CLEAR ?auto_149391 ) ( HOLDING ?auto_149392 ) ( CLEAR ?auto_149393 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149394 ?auto_149393 ?auto_149392 )
      ( MAKE-7PILE ?auto_149387 ?auto_149388 ?auto_149389 ?auto_149390 ?auto_149391 ?auto_149392 ?auto_149393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149396 - BLOCK
      ?auto_149397 - BLOCK
      ?auto_149398 - BLOCK
      ?auto_149399 - BLOCK
      ?auto_149400 - BLOCK
      ?auto_149401 - BLOCK
      ?auto_149402 - BLOCK
    )
    :vars
    (
      ?auto_149403 - BLOCK
      ?auto_149404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149396 ?auto_149397 ) ) ( not ( = ?auto_149396 ?auto_149398 ) ) ( not ( = ?auto_149396 ?auto_149399 ) ) ( not ( = ?auto_149396 ?auto_149400 ) ) ( not ( = ?auto_149396 ?auto_149401 ) ) ( not ( = ?auto_149396 ?auto_149402 ) ) ( not ( = ?auto_149397 ?auto_149398 ) ) ( not ( = ?auto_149397 ?auto_149399 ) ) ( not ( = ?auto_149397 ?auto_149400 ) ) ( not ( = ?auto_149397 ?auto_149401 ) ) ( not ( = ?auto_149397 ?auto_149402 ) ) ( not ( = ?auto_149398 ?auto_149399 ) ) ( not ( = ?auto_149398 ?auto_149400 ) ) ( not ( = ?auto_149398 ?auto_149401 ) ) ( not ( = ?auto_149398 ?auto_149402 ) ) ( not ( = ?auto_149399 ?auto_149400 ) ) ( not ( = ?auto_149399 ?auto_149401 ) ) ( not ( = ?auto_149399 ?auto_149402 ) ) ( not ( = ?auto_149400 ?auto_149401 ) ) ( not ( = ?auto_149400 ?auto_149402 ) ) ( not ( = ?auto_149401 ?auto_149402 ) ) ( ON ?auto_149402 ?auto_149403 ) ( not ( = ?auto_149396 ?auto_149403 ) ) ( not ( = ?auto_149397 ?auto_149403 ) ) ( not ( = ?auto_149398 ?auto_149403 ) ) ( not ( = ?auto_149399 ?auto_149403 ) ) ( not ( = ?auto_149400 ?auto_149403 ) ) ( not ( = ?auto_149401 ?auto_149403 ) ) ( not ( = ?auto_149402 ?auto_149403 ) ) ( ON-TABLE ?auto_149403 ) ( ON ?auto_149396 ?auto_149404 ) ( not ( = ?auto_149396 ?auto_149404 ) ) ( not ( = ?auto_149397 ?auto_149404 ) ) ( not ( = ?auto_149398 ?auto_149404 ) ) ( not ( = ?auto_149399 ?auto_149404 ) ) ( not ( = ?auto_149400 ?auto_149404 ) ) ( not ( = ?auto_149401 ?auto_149404 ) ) ( not ( = ?auto_149402 ?auto_149404 ) ) ( not ( = ?auto_149403 ?auto_149404 ) ) ( ON ?auto_149397 ?auto_149396 ) ( ON-TABLE ?auto_149404 ) ( ON ?auto_149398 ?auto_149397 ) ( ON ?auto_149399 ?auto_149398 ) ( ON ?auto_149400 ?auto_149399 ) ( CLEAR ?auto_149402 ) ( ON ?auto_149401 ?auto_149400 ) ( CLEAR ?auto_149401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149404 ?auto_149396 ?auto_149397 ?auto_149398 ?auto_149399 ?auto_149400 )
      ( MAKE-7PILE ?auto_149396 ?auto_149397 ?auto_149398 ?auto_149399 ?auto_149400 ?auto_149401 ?auto_149402 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149405 - BLOCK
      ?auto_149406 - BLOCK
      ?auto_149407 - BLOCK
      ?auto_149408 - BLOCK
      ?auto_149409 - BLOCK
      ?auto_149410 - BLOCK
      ?auto_149411 - BLOCK
    )
    :vars
    (
      ?auto_149413 - BLOCK
      ?auto_149412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149405 ?auto_149406 ) ) ( not ( = ?auto_149405 ?auto_149407 ) ) ( not ( = ?auto_149405 ?auto_149408 ) ) ( not ( = ?auto_149405 ?auto_149409 ) ) ( not ( = ?auto_149405 ?auto_149410 ) ) ( not ( = ?auto_149405 ?auto_149411 ) ) ( not ( = ?auto_149406 ?auto_149407 ) ) ( not ( = ?auto_149406 ?auto_149408 ) ) ( not ( = ?auto_149406 ?auto_149409 ) ) ( not ( = ?auto_149406 ?auto_149410 ) ) ( not ( = ?auto_149406 ?auto_149411 ) ) ( not ( = ?auto_149407 ?auto_149408 ) ) ( not ( = ?auto_149407 ?auto_149409 ) ) ( not ( = ?auto_149407 ?auto_149410 ) ) ( not ( = ?auto_149407 ?auto_149411 ) ) ( not ( = ?auto_149408 ?auto_149409 ) ) ( not ( = ?auto_149408 ?auto_149410 ) ) ( not ( = ?auto_149408 ?auto_149411 ) ) ( not ( = ?auto_149409 ?auto_149410 ) ) ( not ( = ?auto_149409 ?auto_149411 ) ) ( not ( = ?auto_149410 ?auto_149411 ) ) ( not ( = ?auto_149405 ?auto_149413 ) ) ( not ( = ?auto_149406 ?auto_149413 ) ) ( not ( = ?auto_149407 ?auto_149413 ) ) ( not ( = ?auto_149408 ?auto_149413 ) ) ( not ( = ?auto_149409 ?auto_149413 ) ) ( not ( = ?auto_149410 ?auto_149413 ) ) ( not ( = ?auto_149411 ?auto_149413 ) ) ( ON-TABLE ?auto_149413 ) ( ON ?auto_149405 ?auto_149412 ) ( not ( = ?auto_149405 ?auto_149412 ) ) ( not ( = ?auto_149406 ?auto_149412 ) ) ( not ( = ?auto_149407 ?auto_149412 ) ) ( not ( = ?auto_149408 ?auto_149412 ) ) ( not ( = ?auto_149409 ?auto_149412 ) ) ( not ( = ?auto_149410 ?auto_149412 ) ) ( not ( = ?auto_149411 ?auto_149412 ) ) ( not ( = ?auto_149413 ?auto_149412 ) ) ( ON ?auto_149406 ?auto_149405 ) ( ON-TABLE ?auto_149412 ) ( ON ?auto_149407 ?auto_149406 ) ( ON ?auto_149408 ?auto_149407 ) ( ON ?auto_149409 ?auto_149408 ) ( ON ?auto_149410 ?auto_149409 ) ( CLEAR ?auto_149410 ) ( HOLDING ?auto_149411 ) ( CLEAR ?auto_149413 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149413 ?auto_149411 )
      ( MAKE-7PILE ?auto_149405 ?auto_149406 ?auto_149407 ?auto_149408 ?auto_149409 ?auto_149410 ?auto_149411 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149414 - BLOCK
      ?auto_149415 - BLOCK
      ?auto_149416 - BLOCK
      ?auto_149417 - BLOCK
      ?auto_149418 - BLOCK
      ?auto_149419 - BLOCK
      ?auto_149420 - BLOCK
    )
    :vars
    (
      ?auto_149422 - BLOCK
      ?auto_149421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149414 ?auto_149415 ) ) ( not ( = ?auto_149414 ?auto_149416 ) ) ( not ( = ?auto_149414 ?auto_149417 ) ) ( not ( = ?auto_149414 ?auto_149418 ) ) ( not ( = ?auto_149414 ?auto_149419 ) ) ( not ( = ?auto_149414 ?auto_149420 ) ) ( not ( = ?auto_149415 ?auto_149416 ) ) ( not ( = ?auto_149415 ?auto_149417 ) ) ( not ( = ?auto_149415 ?auto_149418 ) ) ( not ( = ?auto_149415 ?auto_149419 ) ) ( not ( = ?auto_149415 ?auto_149420 ) ) ( not ( = ?auto_149416 ?auto_149417 ) ) ( not ( = ?auto_149416 ?auto_149418 ) ) ( not ( = ?auto_149416 ?auto_149419 ) ) ( not ( = ?auto_149416 ?auto_149420 ) ) ( not ( = ?auto_149417 ?auto_149418 ) ) ( not ( = ?auto_149417 ?auto_149419 ) ) ( not ( = ?auto_149417 ?auto_149420 ) ) ( not ( = ?auto_149418 ?auto_149419 ) ) ( not ( = ?auto_149418 ?auto_149420 ) ) ( not ( = ?auto_149419 ?auto_149420 ) ) ( not ( = ?auto_149414 ?auto_149422 ) ) ( not ( = ?auto_149415 ?auto_149422 ) ) ( not ( = ?auto_149416 ?auto_149422 ) ) ( not ( = ?auto_149417 ?auto_149422 ) ) ( not ( = ?auto_149418 ?auto_149422 ) ) ( not ( = ?auto_149419 ?auto_149422 ) ) ( not ( = ?auto_149420 ?auto_149422 ) ) ( ON-TABLE ?auto_149422 ) ( ON ?auto_149414 ?auto_149421 ) ( not ( = ?auto_149414 ?auto_149421 ) ) ( not ( = ?auto_149415 ?auto_149421 ) ) ( not ( = ?auto_149416 ?auto_149421 ) ) ( not ( = ?auto_149417 ?auto_149421 ) ) ( not ( = ?auto_149418 ?auto_149421 ) ) ( not ( = ?auto_149419 ?auto_149421 ) ) ( not ( = ?auto_149420 ?auto_149421 ) ) ( not ( = ?auto_149422 ?auto_149421 ) ) ( ON ?auto_149415 ?auto_149414 ) ( ON-TABLE ?auto_149421 ) ( ON ?auto_149416 ?auto_149415 ) ( ON ?auto_149417 ?auto_149416 ) ( ON ?auto_149418 ?auto_149417 ) ( ON ?auto_149419 ?auto_149418 ) ( CLEAR ?auto_149422 ) ( ON ?auto_149420 ?auto_149419 ) ( CLEAR ?auto_149420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149421 ?auto_149414 ?auto_149415 ?auto_149416 ?auto_149417 ?auto_149418 ?auto_149419 )
      ( MAKE-7PILE ?auto_149414 ?auto_149415 ?auto_149416 ?auto_149417 ?auto_149418 ?auto_149419 ?auto_149420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149423 - BLOCK
      ?auto_149424 - BLOCK
      ?auto_149425 - BLOCK
      ?auto_149426 - BLOCK
      ?auto_149427 - BLOCK
      ?auto_149428 - BLOCK
      ?auto_149429 - BLOCK
    )
    :vars
    (
      ?auto_149431 - BLOCK
      ?auto_149430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149423 ?auto_149424 ) ) ( not ( = ?auto_149423 ?auto_149425 ) ) ( not ( = ?auto_149423 ?auto_149426 ) ) ( not ( = ?auto_149423 ?auto_149427 ) ) ( not ( = ?auto_149423 ?auto_149428 ) ) ( not ( = ?auto_149423 ?auto_149429 ) ) ( not ( = ?auto_149424 ?auto_149425 ) ) ( not ( = ?auto_149424 ?auto_149426 ) ) ( not ( = ?auto_149424 ?auto_149427 ) ) ( not ( = ?auto_149424 ?auto_149428 ) ) ( not ( = ?auto_149424 ?auto_149429 ) ) ( not ( = ?auto_149425 ?auto_149426 ) ) ( not ( = ?auto_149425 ?auto_149427 ) ) ( not ( = ?auto_149425 ?auto_149428 ) ) ( not ( = ?auto_149425 ?auto_149429 ) ) ( not ( = ?auto_149426 ?auto_149427 ) ) ( not ( = ?auto_149426 ?auto_149428 ) ) ( not ( = ?auto_149426 ?auto_149429 ) ) ( not ( = ?auto_149427 ?auto_149428 ) ) ( not ( = ?auto_149427 ?auto_149429 ) ) ( not ( = ?auto_149428 ?auto_149429 ) ) ( not ( = ?auto_149423 ?auto_149431 ) ) ( not ( = ?auto_149424 ?auto_149431 ) ) ( not ( = ?auto_149425 ?auto_149431 ) ) ( not ( = ?auto_149426 ?auto_149431 ) ) ( not ( = ?auto_149427 ?auto_149431 ) ) ( not ( = ?auto_149428 ?auto_149431 ) ) ( not ( = ?auto_149429 ?auto_149431 ) ) ( ON ?auto_149423 ?auto_149430 ) ( not ( = ?auto_149423 ?auto_149430 ) ) ( not ( = ?auto_149424 ?auto_149430 ) ) ( not ( = ?auto_149425 ?auto_149430 ) ) ( not ( = ?auto_149426 ?auto_149430 ) ) ( not ( = ?auto_149427 ?auto_149430 ) ) ( not ( = ?auto_149428 ?auto_149430 ) ) ( not ( = ?auto_149429 ?auto_149430 ) ) ( not ( = ?auto_149431 ?auto_149430 ) ) ( ON ?auto_149424 ?auto_149423 ) ( ON-TABLE ?auto_149430 ) ( ON ?auto_149425 ?auto_149424 ) ( ON ?auto_149426 ?auto_149425 ) ( ON ?auto_149427 ?auto_149426 ) ( ON ?auto_149428 ?auto_149427 ) ( ON ?auto_149429 ?auto_149428 ) ( CLEAR ?auto_149429 ) ( HOLDING ?auto_149431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149431 )
      ( MAKE-7PILE ?auto_149423 ?auto_149424 ?auto_149425 ?auto_149426 ?auto_149427 ?auto_149428 ?auto_149429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_149432 - BLOCK
      ?auto_149433 - BLOCK
      ?auto_149434 - BLOCK
      ?auto_149435 - BLOCK
      ?auto_149436 - BLOCK
      ?auto_149437 - BLOCK
      ?auto_149438 - BLOCK
    )
    :vars
    (
      ?auto_149440 - BLOCK
      ?auto_149439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149432 ?auto_149433 ) ) ( not ( = ?auto_149432 ?auto_149434 ) ) ( not ( = ?auto_149432 ?auto_149435 ) ) ( not ( = ?auto_149432 ?auto_149436 ) ) ( not ( = ?auto_149432 ?auto_149437 ) ) ( not ( = ?auto_149432 ?auto_149438 ) ) ( not ( = ?auto_149433 ?auto_149434 ) ) ( not ( = ?auto_149433 ?auto_149435 ) ) ( not ( = ?auto_149433 ?auto_149436 ) ) ( not ( = ?auto_149433 ?auto_149437 ) ) ( not ( = ?auto_149433 ?auto_149438 ) ) ( not ( = ?auto_149434 ?auto_149435 ) ) ( not ( = ?auto_149434 ?auto_149436 ) ) ( not ( = ?auto_149434 ?auto_149437 ) ) ( not ( = ?auto_149434 ?auto_149438 ) ) ( not ( = ?auto_149435 ?auto_149436 ) ) ( not ( = ?auto_149435 ?auto_149437 ) ) ( not ( = ?auto_149435 ?auto_149438 ) ) ( not ( = ?auto_149436 ?auto_149437 ) ) ( not ( = ?auto_149436 ?auto_149438 ) ) ( not ( = ?auto_149437 ?auto_149438 ) ) ( not ( = ?auto_149432 ?auto_149440 ) ) ( not ( = ?auto_149433 ?auto_149440 ) ) ( not ( = ?auto_149434 ?auto_149440 ) ) ( not ( = ?auto_149435 ?auto_149440 ) ) ( not ( = ?auto_149436 ?auto_149440 ) ) ( not ( = ?auto_149437 ?auto_149440 ) ) ( not ( = ?auto_149438 ?auto_149440 ) ) ( ON ?auto_149432 ?auto_149439 ) ( not ( = ?auto_149432 ?auto_149439 ) ) ( not ( = ?auto_149433 ?auto_149439 ) ) ( not ( = ?auto_149434 ?auto_149439 ) ) ( not ( = ?auto_149435 ?auto_149439 ) ) ( not ( = ?auto_149436 ?auto_149439 ) ) ( not ( = ?auto_149437 ?auto_149439 ) ) ( not ( = ?auto_149438 ?auto_149439 ) ) ( not ( = ?auto_149440 ?auto_149439 ) ) ( ON ?auto_149433 ?auto_149432 ) ( ON-TABLE ?auto_149439 ) ( ON ?auto_149434 ?auto_149433 ) ( ON ?auto_149435 ?auto_149434 ) ( ON ?auto_149436 ?auto_149435 ) ( ON ?auto_149437 ?auto_149436 ) ( ON ?auto_149438 ?auto_149437 ) ( ON ?auto_149440 ?auto_149438 ) ( CLEAR ?auto_149440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149439 ?auto_149432 ?auto_149433 ?auto_149434 ?auto_149435 ?auto_149436 ?auto_149437 ?auto_149438 )
      ( MAKE-7PILE ?auto_149432 ?auto_149433 ?auto_149434 ?auto_149435 ?auto_149436 ?auto_149437 ?auto_149438 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149449 - BLOCK
      ?auto_149450 - BLOCK
      ?auto_149451 - BLOCK
      ?auto_149452 - BLOCK
      ?auto_149453 - BLOCK
      ?auto_149454 - BLOCK
      ?auto_149455 - BLOCK
      ?auto_149456 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_149456 ) ( CLEAR ?auto_149455 ) ( ON-TABLE ?auto_149449 ) ( ON ?auto_149450 ?auto_149449 ) ( ON ?auto_149451 ?auto_149450 ) ( ON ?auto_149452 ?auto_149451 ) ( ON ?auto_149453 ?auto_149452 ) ( ON ?auto_149454 ?auto_149453 ) ( ON ?auto_149455 ?auto_149454 ) ( not ( = ?auto_149449 ?auto_149450 ) ) ( not ( = ?auto_149449 ?auto_149451 ) ) ( not ( = ?auto_149449 ?auto_149452 ) ) ( not ( = ?auto_149449 ?auto_149453 ) ) ( not ( = ?auto_149449 ?auto_149454 ) ) ( not ( = ?auto_149449 ?auto_149455 ) ) ( not ( = ?auto_149449 ?auto_149456 ) ) ( not ( = ?auto_149450 ?auto_149451 ) ) ( not ( = ?auto_149450 ?auto_149452 ) ) ( not ( = ?auto_149450 ?auto_149453 ) ) ( not ( = ?auto_149450 ?auto_149454 ) ) ( not ( = ?auto_149450 ?auto_149455 ) ) ( not ( = ?auto_149450 ?auto_149456 ) ) ( not ( = ?auto_149451 ?auto_149452 ) ) ( not ( = ?auto_149451 ?auto_149453 ) ) ( not ( = ?auto_149451 ?auto_149454 ) ) ( not ( = ?auto_149451 ?auto_149455 ) ) ( not ( = ?auto_149451 ?auto_149456 ) ) ( not ( = ?auto_149452 ?auto_149453 ) ) ( not ( = ?auto_149452 ?auto_149454 ) ) ( not ( = ?auto_149452 ?auto_149455 ) ) ( not ( = ?auto_149452 ?auto_149456 ) ) ( not ( = ?auto_149453 ?auto_149454 ) ) ( not ( = ?auto_149453 ?auto_149455 ) ) ( not ( = ?auto_149453 ?auto_149456 ) ) ( not ( = ?auto_149454 ?auto_149455 ) ) ( not ( = ?auto_149454 ?auto_149456 ) ) ( not ( = ?auto_149455 ?auto_149456 ) ) )
    :subtasks
    ( ( !STACK ?auto_149456 ?auto_149455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149457 - BLOCK
      ?auto_149458 - BLOCK
      ?auto_149459 - BLOCK
      ?auto_149460 - BLOCK
      ?auto_149461 - BLOCK
      ?auto_149462 - BLOCK
      ?auto_149463 - BLOCK
      ?auto_149464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149463 ) ( ON-TABLE ?auto_149457 ) ( ON ?auto_149458 ?auto_149457 ) ( ON ?auto_149459 ?auto_149458 ) ( ON ?auto_149460 ?auto_149459 ) ( ON ?auto_149461 ?auto_149460 ) ( ON ?auto_149462 ?auto_149461 ) ( ON ?auto_149463 ?auto_149462 ) ( not ( = ?auto_149457 ?auto_149458 ) ) ( not ( = ?auto_149457 ?auto_149459 ) ) ( not ( = ?auto_149457 ?auto_149460 ) ) ( not ( = ?auto_149457 ?auto_149461 ) ) ( not ( = ?auto_149457 ?auto_149462 ) ) ( not ( = ?auto_149457 ?auto_149463 ) ) ( not ( = ?auto_149457 ?auto_149464 ) ) ( not ( = ?auto_149458 ?auto_149459 ) ) ( not ( = ?auto_149458 ?auto_149460 ) ) ( not ( = ?auto_149458 ?auto_149461 ) ) ( not ( = ?auto_149458 ?auto_149462 ) ) ( not ( = ?auto_149458 ?auto_149463 ) ) ( not ( = ?auto_149458 ?auto_149464 ) ) ( not ( = ?auto_149459 ?auto_149460 ) ) ( not ( = ?auto_149459 ?auto_149461 ) ) ( not ( = ?auto_149459 ?auto_149462 ) ) ( not ( = ?auto_149459 ?auto_149463 ) ) ( not ( = ?auto_149459 ?auto_149464 ) ) ( not ( = ?auto_149460 ?auto_149461 ) ) ( not ( = ?auto_149460 ?auto_149462 ) ) ( not ( = ?auto_149460 ?auto_149463 ) ) ( not ( = ?auto_149460 ?auto_149464 ) ) ( not ( = ?auto_149461 ?auto_149462 ) ) ( not ( = ?auto_149461 ?auto_149463 ) ) ( not ( = ?auto_149461 ?auto_149464 ) ) ( not ( = ?auto_149462 ?auto_149463 ) ) ( not ( = ?auto_149462 ?auto_149464 ) ) ( not ( = ?auto_149463 ?auto_149464 ) ) ( ON-TABLE ?auto_149464 ) ( CLEAR ?auto_149464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_149464 )
      ( MAKE-8PILE ?auto_149457 ?auto_149458 ?auto_149459 ?auto_149460 ?auto_149461 ?auto_149462 ?auto_149463 ?auto_149464 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149465 - BLOCK
      ?auto_149466 - BLOCK
      ?auto_149467 - BLOCK
      ?auto_149468 - BLOCK
      ?auto_149469 - BLOCK
      ?auto_149470 - BLOCK
      ?auto_149471 - BLOCK
      ?auto_149472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149465 ) ( ON ?auto_149466 ?auto_149465 ) ( ON ?auto_149467 ?auto_149466 ) ( ON ?auto_149468 ?auto_149467 ) ( ON ?auto_149469 ?auto_149468 ) ( ON ?auto_149470 ?auto_149469 ) ( not ( = ?auto_149465 ?auto_149466 ) ) ( not ( = ?auto_149465 ?auto_149467 ) ) ( not ( = ?auto_149465 ?auto_149468 ) ) ( not ( = ?auto_149465 ?auto_149469 ) ) ( not ( = ?auto_149465 ?auto_149470 ) ) ( not ( = ?auto_149465 ?auto_149471 ) ) ( not ( = ?auto_149465 ?auto_149472 ) ) ( not ( = ?auto_149466 ?auto_149467 ) ) ( not ( = ?auto_149466 ?auto_149468 ) ) ( not ( = ?auto_149466 ?auto_149469 ) ) ( not ( = ?auto_149466 ?auto_149470 ) ) ( not ( = ?auto_149466 ?auto_149471 ) ) ( not ( = ?auto_149466 ?auto_149472 ) ) ( not ( = ?auto_149467 ?auto_149468 ) ) ( not ( = ?auto_149467 ?auto_149469 ) ) ( not ( = ?auto_149467 ?auto_149470 ) ) ( not ( = ?auto_149467 ?auto_149471 ) ) ( not ( = ?auto_149467 ?auto_149472 ) ) ( not ( = ?auto_149468 ?auto_149469 ) ) ( not ( = ?auto_149468 ?auto_149470 ) ) ( not ( = ?auto_149468 ?auto_149471 ) ) ( not ( = ?auto_149468 ?auto_149472 ) ) ( not ( = ?auto_149469 ?auto_149470 ) ) ( not ( = ?auto_149469 ?auto_149471 ) ) ( not ( = ?auto_149469 ?auto_149472 ) ) ( not ( = ?auto_149470 ?auto_149471 ) ) ( not ( = ?auto_149470 ?auto_149472 ) ) ( not ( = ?auto_149471 ?auto_149472 ) ) ( ON-TABLE ?auto_149472 ) ( CLEAR ?auto_149472 ) ( HOLDING ?auto_149471 ) ( CLEAR ?auto_149470 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149465 ?auto_149466 ?auto_149467 ?auto_149468 ?auto_149469 ?auto_149470 ?auto_149471 )
      ( MAKE-8PILE ?auto_149465 ?auto_149466 ?auto_149467 ?auto_149468 ?auto_149469 ?auto_149470 ?auto_149471 ?auto_149472 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149473 - BLOCK
      ?auto_149474 - BLOCK
      ?auto_149475 - BLOCK
      ?auto_149476 - BLOCK
      ?auto_149477 - BLOCK
      ?auto_149478 - BLOCK
      ?auto_149479 - BLOCK
      ?auto_149480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149473 ) ( ON ?auto_149474 ?auto_149473 ) ( ON ?auto_149475 ?auto_149474 ) ( ON ?auto_149476 ?auto_149475 ) ( ON ?auto_149477 ?auto_149476 ) ( ON ?auto_149478 ?auto_149477 ) ( not ( = ?auto_149473 ?auto_149474 ) ) ( not ( = ?auto_149473 ?auto_149475 ) ) ( not ( = ?auto_149473 ?auto_149476 ) ) ( not ( = ?auto_149473 ?auto_149477 ) ) ( not ( = ?auto_149473 ?auto_149478 ) ) ( not ( = ?auto_149473 ?auto_149479 ) ) ( not ( = ?auto_149473 ?auto_149480 ) ) ( not ( = ?auto_149474 ?auto_149475 ) ) ( not ( = ?auto_149474 ?auto_149476 ) ) ( not ( = ?auto_149474 ?auto_149477 ) ) ( not ( = ?auto_149474 ?auto_149478 ) ) ( not ( = ?auto_149474 ?auto_149479 ) ) ( not ( = ?auto_149474 ?auto_149480 ) ) ( not ( = ?auto_149475 ?auto_149476 ) ) ( not ( = ?auto_149475 ?auto_149477 ) ) ( not ( = ?auto_149475 ?auto_149478 ) ) ( not ( = ?auto_149475 ?auto_149479 ) ) ( not ( = ?auto_149475 ?auto_149480 ) ) ( not ( = ?auto_149476 ?auto_149477 ) ) ( not ( = ?auto_149476 ?auto_149478 ) ) ( not ( = ?auto_149476 ?auto_149479 ) ) ( not ( = ?auto_149476 ?auto_149480 ) ) ( not ( = ?auto_149477 ?auto_149478 ) ) ( not ( = ?auto_149477 ?auto_149479 ) ) ( not ( = ?auto_149477 ?auto_149480 ) ) ( not ( = ?auto_149478 ?auto_149479 ) ) ( not ( = ?auto_149478 ?auto_149480 ) ) ( not ( = ?auto_149479 ?auto_149480 ) ) ( ON-TABLE ?auto_149480 ) ( CLEAR ?auto_149478 ) ( ON ?auto_149479 ?auto_149480 ) ( CLEAR ?auto_149479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149480 )
      ( MAKE-8PILE ?auto_149473 ?auto_149474 ?auto_149475 ?auto_149476 ?auto_149477 ?auto_149478 ?auto_149479 ?auto_149480 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149481 - BLOCK
      ?auto_149482 - BLOCK
      ?auto_149483 - BLOCK
      ?auto_149484 - BLOCK
      ?auto_149485 - BLOCK
      ?auto_149486 - BLOCK
      ?auto_149487 - BLOCK
      ?auto_149488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149481 ) ( ON ?auto_149482 ?auto_149481 ) ( ON ?auto_149483 ?auto_149482 ) ( ON ?auto_149484 ?auto_149483 ) ( ON ?auto_149485 ?auto_149484 ) ( not ( = ?auto_149481 ?auto_149482 ) ) ( not ( = ?auto_149481 ?auto_149483 ) ) ( not ( = ?auto_149481 ?auto_149484 ) ) ( not ( = ?auto_149481 ?auto_149485 ) ) ( not ( = ?auto_149481 ?auto_149486 ) ) ( not ( = ?auto_149481 ?auto_149487 ) ) ( not ( = ?auto_149481 ?auto_149488 ) ) ( not ( = ?auto_149482 ?auto_149483 ) ) ( not ( = ?auto_149482 ?auto_149484 ) ) ( not ( = ?auto_149482 ?auto_149485 ) ) ( not ( = ?auto_149482 ?auto_149486 ) ) ( not ( = ?auto_149482 ?auto_149487 ) ) ( not ( = ?auto_149482 ?auto_149488 ) ) ( not ( = ?auto_149483 ?auto_149484 ) ) ( not ( = ?auto_149483 ?auto_149485 ) ) ( not ( = ?auto_149483 ?auto_149486 ) ) ( not ( = ?auto_149483 ?auto_149487 ) ) ( not ( = ?auto_149483 ?auto_149488 ) ) ( not ( = ?auto_149484 ?auto_149485 ) ) ( not ( = ?auto_149484 ?auto_149486 ) ) ( not ( = ?auto_149484 ?auto_149487 ) ) ( not ( = ?auto_149484 ?auto_149488 ) ) ( not ( = ?auto_149485 ?auto_149486 ) ) ( not ( = ?auto_149485 ?auto_149487 ) ) ( not ( = ?auto_149485 ?auto_149488 ) ) ( not ( = ?auto_149486 ?auto_149487 ) ) ( not ( = ?auto_149486 ?auto_149488 ) ) ( not ( = ?auto_149487 ?auto_149488 ) ) ( ON-TABLE ?auto_149488 ) ( ON ?auto_149487 ?auto_149488 ) ( CLEAR ?auto_149487 ) ( HOLDING ?auto_149486 ) ( CLEAR ?auto_149485 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149481 ?auto_149482 ?auto_149483 ?auto_149484 ?auto_149485 ?auto_149486 )
      ( MAKE-8PILE ?auto_149481 ?auto_149482 ?auto_149483 ?auto_149484 ?auto_149485 ?auto_149486 ?auto_149487 ?auto_149488 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149489 - BLOCK
      ?auto_149490 - BLOCK
      ?auto_149491 - BLOCK
      ?auto_149492 - BLOCK
      ?auto_149493 - BLOCK
      ?auto_149494 - BLOCK
      ?auto_149495 - BLOCK
      ?auto_149496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149489 ) ( ON ?auto_149490 ?auto_149489 ) ( ON ?auto_149491 ?auto_149490 ) ( ON ?auto_149492 ?auto_149491 ) ( ON ?auto_149493 ?auto_149492 ) ( not ( = ?auto_149489 ?auto_149490 ) ) ( not ( = ?auto_149489 ?auto_149491 ) ) ( not ( = ?auto_149489 ?auto_149492 ) ) ( not ( = ?auto_149489 ?auto_149493 ) ) ( not ( = ?auto_149489 ?auto_149494 ) ) ( not ( = ?auto_149489 ?auto_149495 ) ) ( not ( = ?auto_149489 ?auto_149496 ) ) ( not ( = ?auto_149490 ?auto_149491 ) ) ( not ( = ?auto_149490 ?auto_149492 ) ) ( not ( = ?auto_149490 ?auto_149493 ) ) ( not ( = ?auto_149490 ?auto_149494 ) ) ( not ( = ?auto_149490 ?auto_149495 ) ) ( not ( = ?auto_149490 ?auto_149496 ) ) ( not ( = ?auto_149491 ?auto_149492 ) ) ( not ( = ?auto_149491 ?auto_149493 ) ) ( not ( = ?auto_149491 ?auto_149494 ) ) ( not ( = ?auto_149491 ?auto_149495 ) ) ( not ( = ?auto_149491 ?auto_149496 ) ) ( not ( = ?auto_149492 ?auto_149493 ) ) ( not ( = ?auto_149492 ?auto_149494 ) ) ( not ( = ?auto_149492 ?auto_149495 ) ) ( not ( = ?auto_149492 ?auto_149496 ) ) ( not ( = ?auto_149493 ?auto_149494 ) ) ( not ( = ?auto_149493 ?auto_149495 ) ) ( not ( = ?auto_149493 ?auto_149496 ) ) ( not ( = ?auto_149494 ?auto_149495 ) ) ( not ( = ?auto_149494 ?auto_149496 ) ) ( not ( = ?auto_149495 ?auto_149496 ) ) ( ON-TABLE ?auto_149496 ) ( ON ?auto_149495 ?auto_149496 ) ( CLEAR ?auto_149493 ) ( ON ?auto_149494 ?auto_149495 ) ( CLEAR ?auto_149494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149496 ?auto_149495 )
      ( MAKE-8PILE ?auto_149489 ?auto_149490 ?auto_149491 ?auto_149492 ?auto_149493 ?auto_149494 ?auto_149495 ?auto_149496 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149497 - BLOCK
      ?auto_149498 - BLOCK
      ?auto_149499 - BLOCK
      ?auto_149500 - BLOCK
      ?auto_149501 - BLOCK
      ?auto_149502 - BLOCK
      ?auto_149503 - BLOCK
      ?auto_149504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149497 ) ( ON ?auto_149498 ?auto_149497 ) ( ON ?auto_149499 ?auto_149498 ) ( ON ?auto_149500 ?auto_149499 ) ( not ( = ?auto_149497 ?auto_149498 ) ) ( not ( = ?auto_149497 ?auto_149499 ) ) ( not ( = ?auto_149497 ?auto_149500 ) ) ( not ( = ?auto_149497 ?auto_149501 ) ) ( not ( = ?auto_149497 ?auto_149502 ) ) ( not ( = ?auto_149497 ?auto_149503 ) ) ( not ( = ?auto_149497 ?auto_149504 ) ) ( not ( = ?auto_149498 ?auto_149499 ) ) ( not ( = ?auto_149498 ?auto_149500 ) ) ( not ( = ?auto_149498 ?auto_149501 ) ) ( not ( = ?auto_149498 ?auto_149502 ) ) ( not ( = ?auto_149498 ?auto_149503 ) ) ( not ( = ?auto_149498 ?auto_149504 ) ) ( not ( = ?auto_149499 ?auto_149500 ) ) ( not ( = ?auto_149499 ?auto_149501 ) ) ( not ( = ?auto_149499 ?auto_149502 ) ) ( not ( = ?auto_149499 ?auto_149503 ) ) ( not ( = ?auto_149499 ?auto_149504 ) ) ( not ( = ?auto_149500 ?auto_149501 ) ) ( not ( = ?auto_149500 ?auto_149502 ) ) ( not ( = ?auto_149500 ?auto_149503 ) ) ( not ( = ?auto_149500 ?auto_149504 ) ) ( not ( = ?auto_149501 ?auto_149502 ) ) ( not ( = ?auto_149501 ?auto_149503 ) ) ( not ( = ?auto_149501 ?auto_149504 ) ) ( not ( = ?auto_149502 ?auto_149503 ) ) ( not ( = ?auto_149502 ?auto_149504 ) ) ( not ( = ?auto_149503 ?auto_149504 ) ) ( ON-TABLE ?auto_149504 ) ( ON ?auto_149503 ?auto_149504 ) ( ON ?auto_149502 ?auto_149503 ) ( CLEAR ?auto_149502 ) ( HOLDING ?auto_149501 ) ( CLEAR ?auto_149500 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149497 ?auto_149498 ?auto_149499 ?auto_149500 ?auto_149501 )
      ( MAKE-8PILE ?auto_149497 ?auto_149498 ?auto_149499 ?auto_149500 ?auto_149501 ?auto_149502 ?auto_149503 ?auto_149504 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149505 - BLOCK
      ?auto_149506 - BLOCK
      ?auto_149507 - BLOCK
      ?auto_149508 - BLOCK
      ?auto_149509 - BLOCK
      ?auto_149510 - BLOCK
      ?auto_149511 - BLOCK
      ?auto_149512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149505 ) ( ON ?auto_149506 ?auto_149505 ) ( ON ?auto_149507 ?auto_149506 ) ( ON ?auto_149508 ?auto_149507 ) ( not ( = ?auto_149505 ?auto_149506 ) ) ( not ( = ?auto_149505 ?auto_149507 ) ) ( not ( = ?auto_149505 ?auto_149508 ) ) ( not ( = ?auto_149505 ?auto_149509 ) ) ( not ( = ?auto_149505 ?auto_149510 ) ) ( not ( = ?auto_149505 ?auto_149511 ) ) ( not ( = ?auto_149505 ?auto_149512 ) ) ( not ( = ?auto_149506 ?auto_149507 ) ) ( not ( = ?auto_149506 ?auto_149508 ) ) ( not ( = ?auto_149506 ?auto_149509 ) ) ( not ( = ?auto_149506 ?auto_149510 ) ) ( not ( = ?auto_149506 ?auto_149511 ) ) ( not ( = ?auto_149506 ?auto_149512 ) ) ( not ( = ?auto_149507 ?auto_149508 ) ) ( not ( = ?auto_149507 ?auto_149509 ) ) ( not ( = ?auto_149507 ?auto_149510 ) ) ( not ( = ?auto_149507 ?auto_149511 ) ) ( not ( = ?auto_149507 ?auto_149512 ) ) ( not ( = ?auto_149508 ?auto_149509 ) ) ( not ( = ?auto_149508 ?auto_149510 ) ) ( not ( = ?auto_149508 ?auto_149511 ) ) ( not ( = ?auto_149508 ?auto_149512 ) ) ( not ( = ?auto_149509 ?auto_149510 ) ) ( not ( = ?auto_149509 ?auto_149511 ) ) ( not ( = ?auto_149509 ?auto_149512 ) ) ( not ( = ?auto_149510 ?auto_149511 ) ) ( not ( = ?auto_149510 ?auto_149512 ) ) ( not ( = ?auto_149511 ?auto_149512 ) ) ( ON-TABLE ?auto_149512 ) ( ON ?auto_149511 ?auto_149512 ) ( ON ?auto_149510 ?auto_149511 ) ( CLEAR ?auto_149508 ) ( ON ?auto_149509 ?auto_149510 ) ( CLEAR ?auto_149509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149512 ?auto_149511 ?auto_149510 )
      ( MAKE-8PILE ?auto_149505 ?auto_149506 ?auto_149507 ?auto_149508 ?auto_149509 ?auto_149510 ?auto_149511 ?auto_149512 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149513 - BLOCK
      ?auto_149514 - BLOCK
      ?auto_149515 - BLOCK
      ?auto_149516 - BLOCK
      ?auto_149517 - BLOCK
      ?auto_149518 - BLOCK
      ?auto_149519 - BLOCK
      ?auto_149520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149513 ) ( ON ?auto_149514 ?auto_149513 ) ( ON ?auto_149515 ?auto_149514 ) ( not ( = ?auto_149513 ?auto_149514 ) ) ( not ( = ?auto_149513 ?auto_149515 ) ) ( not ( = ?auto_149513 ?auto_149516 ) ) ( not ( = ?auto_149513 ?auto_149517 ) ) ( not ( = ?auto_149513 ?auto_149518 ) ) ( not ( = ?auto_149513 ?auto_149519 ) ) ( not ( = ?auto_149513 ?auto_149520 ) ) ( not ( = ?auto_149514 ?auto_149515 ) ) ( not ( = ?auto_149514 ?auto_149516 ) ) ( not ( = ?auto_149514 ?auto_149517 ) ) ( not ( = ?auto_149514 ?auto_149518 ) ) ( not ( = ?auto_149514 ?auto_149519 ) ) ( not ( = ?auto_149514 ?auto_149520 ) ) ( not ( = ?auto_149515 ?auto_149516 ) ) ( not ( = ?auto_149515 ?auto_149517 ) ) ( not ( = ?auto_149515 ?auto_149518 ) ) ( not ( = ?auto_149515 ?auto_149519 ) ) ( not ( = ?auto_149515 ?auto_149520 ) ) ( not ( = ?auto_149516 ?auto_149517 ) ) ( not ( = ?auto_149516 ?auto_149518 ) ) ( not ( = ?auto_149516 ?auto_149519 ) ) ( not ( = ?auto_149516 ?auto_149520 ) ) ( not ( = ?auto_149517 ?auto_149518 ) ) ( not ( = ?auto_149517 ?auto_149519 ) ) ( not ( = ?auto_149517 ?auto_149520 ) ) ( not ( = ?auto_149518 ?auto_149519 ) ) ( not ( = ?auto_149518 ?auto_149520 ) ) ( not ( = ?auto_149519 ?auto_149520 ) ) ( ON-TABLE ?auto_149520 ) ( ON ?auto_149519 ?auto_149520 ) ( ON ?auto_149518 ?auto_149519 ) ( ON ?auto_149517 ?auto_149518 ) ( CLEAR ?auto_149517 ) ( HOLDING ?auto_149516 ) ( CLEAR ?auto_149515 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149513 ?auto_149514 ?auto_149515 ?auto_149516 )
      ( MAKE-8PILE ?auto_149513 ?auto_149514 ?auto_149515 ?auto_149516 ?auto_149517 ?auto_149518 ?auto_149519 ?auto_149520 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149521 - BLOCK
      ?auto_149522 - BLOCK
      ?auto_149523 - BLOCK
      ?auto_149524 - BLOCK
      ?auto_149525 - BLOCK
      ?auto_149526 - BLOCK
      ?auto_149527 - BLOCK
      ?auto_149528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149521 ) ( ON ?auto_149522 ?auto_149521 ) ( ON ?auto_149523 ?auto_149522 ) ( not ( = ?auto_149521 ?auto_149522 ) ) ( not ( = ?auto_149521 ?auto_149523 ) ) ( not ( = ?auto_149521 ?auto_149524 ) ) ( not ( = ?auto_149521 ?auto_149525 ) ) ( not ( = ?auto_149521 ?auto_149526 ) ) ( not ( = ?auto_149521 ?auto_149527 ) ) ( not ( = ?auto_149521 ?auto_149528 ) ) ( not ( = ?auto_149522 ?auto_149523 ) ) ( not ( = ?auto_149522 ?auto_149524 ) ) ( not ( = ?auto_149522 ?auto_149525 ) ) ( not ( = ?auto_149522 ?auto_149526 ) ) ( not ( = ?auto_149522 ?auto_149527 ) ) ( not ( = ?auto_149522 ?auto_149528 ) ) ( not ( = ?auto_149523 ?auto_149524 ) ) ( not ( = ?auto_149523 ?auto_149525 ) ) ( not ( = ?auto_149523 ?auto_149526 ) ) ( not ( = ?auto_149523 ?auto_149527 ) ) ( not ( = ?auto_149523 ?auto_149528 ) ) ( not ( = ?auto_149524 ?auto_149525 ) ) ( not ( = ?auto_149524 ?auto_149526 ) ) ( not ( = ?auto_149524 ?auto_149527 ) ) ( not ( = ?auto_149524 ?auto_149528 ) ) ( not ( = ?auto_149525 ?auto_149526 ) ) ( not ( = ?auto_149525 ?auto_149527 ) ) ( not ( = ?auto_149525 ?auto_149528 ) ) ( not ( = ?auto_149526 ?auto_149527 ) ) ( not ( = ?auto_149526 ?auto_149528 ) ) ( not ( = ?auto_149527 ?auto_149528 ) ) ( ON-TABLE ?auto_149528 ) ( ON ?auto_149527 ?auto_149528 ) ( ON ?auto_149526 ?auto_149527 ) ( ON ?auto_149525 ?auto_149526 ) ( CLEAR ?auto_149523 ) ( ON ?auto_149524 ?auto_149525 ) ( CLEAR ?auto_149524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149528 ?auto_149527 ?auto_149526 ?auto_149525 )
      ( MAKE-8PILE ?auto_149521 ?auto_149522 ?auto_149523 ?auto_149524 ?auto_149525 ?auto_149526 ?auto_149527 ?auto_149528 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149529 - BLOCK
      ?auto_149530 - BLOCK
      ?auto_149531 - BLOCK
      ?auto_149532 - BLOCK
      ?auto_149533 - BLOCK
      ?auto_149534 - BLOCK
      ?auto_149535 - BLOCK
      ?auto_149536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149529 ) ( ON ?auto_149530 ?auto_149529 ) ( not ( = ?auto_149529 ?auto_149530 ) ) ( not ( = ?auto_149529 ?auto_149531 ) ) ( not ( = ?auto_149529 ?auto_149532 ) ) ( not ( = ?auto_149529 ?auto_149533 ) ) ( not ( = ?auto_149529 ?auto_149534 ) ) ( not ( = ?auto_149529 ?auto_149535 ) ) ( not ( = ?auto_149529 ?auto_149536 ) ) ( not ( = ?auto_149530 ?auto_149531 ) ) ( not ( = ?auto_149530 ?auto_149532 ) ) ( not ( = ?auto_149530 ?auto_149533 ) ) ( not ( = ?auto_149530 ?auto_149534 ) ) ( not ( = ?auto_149530 ?auto_149535 ) ) ( not ( = ?auto_149530 ?auto_149536 ) ) ( not ( = ?auto_149531 ?auto_149532 ) ) ( not ( = ?auto_149531 ?auto_149533 ) ) ( not ( = ?auto_149531 ?auto_149534 ) ) ( not ( = ?auto_149531 ?auto_149535 ) ) ( not ( = ?auto_149531 ?auto_149536 ) ) ( not ( = ?auto_149532 ?auto_149533 ) ) ( not ( = ?auto_149532 ?auto_149534 ) ) ( not ( = ?auto_149532 ?auto_149535 ) ) ( not ( = ?auto_149532 ?auto_149536 ) ) ( not ( = ?auto_149533 ?auto_149534 ) ) ( not ( = ?auto_149533 ?auto_149535 ) ) ( not ( = ?auto_149533 ?auto_149536 ) ) ( not ( = ?auto_149534 ?auto_149535 ) ) ( not ( = ?auto_149534 ?auto_149536 ) ) ( not ( = ?auto_149535 ?auto_149536 ) ) ( ON-TABLE ?auto_149536 ) ( ON ?auto_149535 ?auto_149536 ) ( ON ?auto_149534 ?auto_149535 ) ( ON ?auto_149533 ?auto_149534 ) ( ON ?auto_149532 ?auto_149533 ) ( CLEAR ?auto_149532 ) ( HOLDING ?auto_149531 ) ( CLEAR ?auto_149530 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149529 ?auto_149530 ?auto_149531 )
      ( MAKE-8PILE ?auto_149529 ?auto_149530 ?auto_149531 ?auto_149532 ?auto_149533 ?auto_149534 ?auto_149535 ?auto_149536 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149537 - BLOCK
      ?auto_149538 - BLOCK
      ?auto_149539 - BLOCK
      ?auto_149540 - BLOCK
      ?auto_149541 - BLOCK
      ?auto_149542 - BLOCK
      ?auto_149543 - BLOCK
      ?auto_149544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149537 ) ( ON ?auto_149538 ?auto_149537 ) ( not ( = ?auto_149537 ?auto_149538 ) ) ( not ( = ?auto_149537 ?auto_149539 ) ) ( not ( = ?auto_149537 ?auto_149540 ) ) ( not ( = ?auto_149537 ?auto_149541 ) ) ( not ( = ?auto_149537 ?auto_149542 ) ) ( not ( = ?auto_149537 ?auto_149543 ) ) ( not ( = ?auto_149537 ?auto_149544 ) ) ( not ( = ?auto_149538 ?auto_149539 ) ) ( not ( = ?auto_149538 ?auto_149540 ) ) ( not ( = ?auto_149538 ?auto_149541 ) ) ( not ( = ?auto_149538 ?auto_149542 ) ) ( not ( = ?auto_149538 ?auto_149543 ) ) ( not ( = ?auto_149538 ?auto_149544 ) ) ( not ( = ?auto_149539 ?auto_149540 ) ) ( not ( = ?auto_149539 ?auto_149541 ) ) ( not ( = ?auto_149539 ?auto_149542 ) ) ( not ( = ?auto_149539 ?auto_149543 ) ) ( not ( = ?auto_149539 ?auto_149544 ) ) ( not ( = ?auto_149540 ?auto_149541 ) ) ( not ( = ?auto_149540 ?auto_149542 ) ) ( not ( = ?auto_149540 ?auto_149543 ) ) ( not ( = ?auto_149540 ?auto_149544 ) ) ( not ( = ?auto_149541 ?auto_149542 ) ) ( not ( = ?auto_149541 ?auto_149543 ) ) ( not ( = ?auto_149541 ?auto_149544 ) ) ( not ( = ?auto_149542 ?auto_149543 ) ) ( not ( = ?auto_149542 ?auto_149544 ) ) ( not ( = ?auto_149543 ?auto_149544 ) ) ( ON-TABLE ?auto_149544 ) ( ON ?auto_149543 ?auto_149544 ) ( ON ?auto_149542 ?auto_149543 ) ( ON ?auto_149541 ?auto_149542 ) ( ON ?auto_149540 ?auto_149541 ) ( CLEAR ?auto_149538 ) ( ON ?auto_149539 ?auto_149540 ) ( CLEAR ?auto_149539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149544 ?auto_149543 ?auto_149542 ?auto_149541 ?auto_149540 )
      ( MAKE-8PILE ?auto_149537 ?auto_149538 ?auto_149539 ?auto_149540 ?auto_149541 ?auto_149542 ?auto_149543 ?auto_149544 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149545 - BLOCK
      ?auto_149546 - BLOCK
      ?auto_149547 - BLOCK
      ?auto_149548 - BLOCK
      ?auto_149549 - BLOCK
      ?auto_149550 - BLOCK
      ?auto_149551 - BLOCK
      ?auto_149552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149545 ) ( not ( = ?auto_149545 ?auto_149546 ) ) ( not ( = ?auto_149545 ?auto_149547 ) ) ( not ( = ?auto_149545 ?auto_149548 ) ) ( not ( = ?auto_149545 ?auto_149549 ) ) ( not ( = ?auto_149545 ?auto_149550 ) ) ( not ( = ?auto_149545 ?auto_149551 ) ) ( not ( = ?auto_149545 ?auto_149552 ) ) ( not ( = ?auto_149546 ?auto_149547 ) ) ( not ( = ?auto_149546 ?auto_149548 ) ) ( not ( = ?auto_149546 ?auto_149549 ) ) ( not ( = ?auto_149546 ?auto_149550 ) ) ( not ( = ?auto_149546 ?auto_149551 ) ) ( not ( = ?auto_149546 ?auto_149552 ) ) ( not ( = ?auto_149547 ?auto_149548 ) ) ( not ( = ?auto_149547 ?auto_149549 ) ) ( not ( = ?auto_149547 ?auto_149550 ) ) ( not ( = ?auto_149547 ?auto_149551 ) ) ( not ( = ?auto_149547 ?auto_149552 ) ) ( not ( = ?auto_149548 ?auto_149549 ) ) ( not ( = ?auto_149548 ?auto_149550 ) ) ( not ( = ?auto_149548 ?auto_149551 ) ) ( not ( = ?auto_149548 ?auto_149552 ) ) ( not ( = ?auto_149549 ?auto_149550 ) ) ( not ( = ?auto_149549 ?auto_149551 ) ) ( not ( = ?auto_149549 ?auto_149552 ) ) ( not ( = ?auto_149550 ?auto_149551 ) ) ( not ( = ?auto_149550 ?auto_149552 ) ) ( not ( = ?auto_149551 ?auto_149552 ) ) ( ON-TABLE ?auto_149552 ) ( ON ?auto_149551 ?auto_149552 ) ( ON ?auto_149550 ?auto_149551 ) ( ON ?auto_149549 ?auto_149550 ) ( ON ?auto_149548 ?auto_149549 ) ( ON ?auto_149547 ?auto_149548 ) ( CLEAR ?auto_149547 ) ( HOLDING ?auto_149546 ) ( CLEAR ?auto_149545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149545 ?auto_149546 )
      ( MAKE-8PILE ?auto_149545 ?auto_149546 ?auto_149547 ?auto_149548 ?auto_149549 ?auto_149550 ?auto_149551 ?auto_149552 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149553 - BLOCK
      ?auto_149554 - BLOCK
      ?auto_149555 - BLOCK
      ?auto_149556 - BLOCK
      ?auto_149557 - BLOCK
      ?auto_149558 - BLOCK
      ?auto_149559 - BLOCK
      ?auto_149560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149553 ) ( not ( = ?auto_149553 ?auto_149554 ) ) ( not ( = ?auto_149553 ?auto_149555 ) ) ( not ( = ?auto_149553 ?auto_149556 ) ) ( not ( = ?auto_149553 ?auto_149557 ) ) ( not ( = ?auto_149553 ?auto_149558 ) ) ( not ( = ?auto_149553 ?auto_149559 ) ) ( not ( = ?auto_149553 ?auto_149560 ) ) ( not ( = ?auto_149554 ?auto_149555 ) ) ( not ( = ?auto_149554 ?auto_149556 ) ) ( not ( = ?auto_149554 ?auto_149557 ) ) ( not ( = ?auto_149554 ?auto_149558 ) ) ( not ( = ?auto_149554 ?auto_149559 ) ) ( not ( = ?auto_149554 ?auto_149560 ) ) ( not ( = ?auto_149555 ?auto_149556 ) ) ( not ( = ?auto_149555 ?auto_149557 ) ) ( not ( = ?auto_149555 ?auto_149558 ) ) ( not ( = ?auto_149555 ?auto_149559 ) ) ( not ( = ?auto_149555 ?auto_149560 ) ) ( not ( = ?auto_149556 ?auto_149557 ) ) ( not ( = ?auto_149556 ?auto_149558 ) ) ( not ( = ?auto_149556 ?auto_149559 ) ) ( not ( = ?auto_149556 ?auto_149560 ) ) ( not ( = ?auto_149557 ?auto_149558 ) ) ( not ( = ?auto_149557 ?auto_149559 ) ) ( not ( = ?auto_149557 ?auto_149560 ) ) ( not ( = ?auto_149558 ?auto_149559 ) ) ( not ( = ?auto_149558 ?auto_149560 ) ) ( not ( = ?auto_149559 ?auto_149560 ) ) ( ON-TABLE ?auto_149560 ) ( ON ?auto_149559 ?auto_149560 ) ( ON ?auto_149558 ?auto_149559 ) ( ON ?auto_149557 ?auto_149558 ) ( ON ?auto_149556 ?auto_149557 ) ( ON ?auto_149555 ?auto_149556 ) ( CLEAR ?auto_149553 ) ( ON ?auto_149554 ?auto_149555 ) ( CLEAR ?auto_149554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149560 ?auto_149559 ?auto_149558 ?auto_149557 ?auto_149556 ?auto_149555 )
      ( MAKE-8PILE ?auto_149553 ?auto_149554 ?auto_149555 ?auto_149556 ?auto_149557 ?auto_149558 ?auto_149559 ?auto_149560 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149561 - BLOCK
      ?auto_149562 - BLOCK
      ?auto_149563 - BLOCK
      ?auto_149564 - BLOCK
      ?auto_149565 - BLOCK
      ?auto_149566 - BLOCK
      ?auto_149567 - BLOCK
      ?auto_149568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149561 ?auto_149562 ) ) ( not ( = ?auto_149561 ?auto_149563 ) ) ( not ( = ?auto_149561 ?auto_149564 ) ) ( not ( = ?auto_149561 ?auto_149565 ) ) ( not ( = ?auto_149561 ?auto_149566 ) ) ( not ( = ?auto_149561 ?auto_149567 ) ) ( not ( = ?auto_149561 ?auto_149568 ) ) ( not ( = ?auto_149562 ?auto_149563 ) ) ( not ( = ?auto_149562 ?auto_149564 ) ) ( not ( = ?auto_149562 ?auto_149565 ) ) ( not ( = ?auto_149562 ?auto_149566 ) ) ( not ( = ?auto_149562 ?auto_149567 ) ) ( not ( = ?auto_149562 ?auto_149568 ) ) ( not ( = ?auto_149563 ?auto_149564 ) ) ( not ( = ?auto_149563 ?auto_149565 ) ) ( not ( = ?auto_149563 ?auto_149566 ) ) ( not ( = ?auto_149563 ?auto_149567 ) ) ( not ( = ?auto_149563 ?auto_149568 ) ) ( not ( = ?auto_149564 ?auto_149565 ) ) ( not ( = ?auto_149564 ?auto_149566 ) ) ( not ( = ?auto_149564 ?auto_149567 ) ) ( not ( = ?auto_149564 ?auto_149568 ) ) ( not ( = ?auto_149565 ?auto_149566 ) ) ( not ( = ?auto_149565 ?auto_149567 ) ) ( not ( = ?auto_149565 ?auto_149568 ) ) ( not ( = ?auto_149566 ?auto_149567 ) ) ( not ( = ?auto_149566 ?auto_149568 ) ) ( not ( = ?auto_149567 ?auto_149568 ) ) ( ON-TABLE ?auto_149568 ) ( ON ?auto_149567 ?auto_149568 ) ( ON ?auto_149566 ?auto_149567 ) ( ON ?auto_149565 ?auto_149566 ) ( ON ?auto_149564 ?auto_149565 ) ( ON ?auto_149563 ?auto_149564 ) ( ON ?auto_149562 ?auto_149563 ) ( CLEAR ?auto_149562 ) ( HOLDING ?auto_149561 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149561 )
      ( MAKE-8PILE ?auto_149561 ?auto_149562 ?auto_149563 ?auto_149564 ?auto_149565 ?auto_149566 ?auto_149567 ?auto_149568 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149569 - BLOCK
      ?auto_149570 - BLOCK
      ?auto_149571 - BLOCK
      ?auto_149572 - BLOCK
      ?auto_149573 - BLOCK
      ?auto_149574 - BLOCK
      ?auto_149575 - BLOCK
      ?auto_149576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149569 ?auto_149570 ) ) ( not ( = ?auto_149569 ?auto_149571 ) ) ( not ( = ?auto_149569 ?auto_149572 ) ) ( not ( = ?auto_149569 ?auto_149573 ) ) ( not ( = ?auto_149569 ?auto_149574 ) ) ( not ( = ?auto_149569 ?auto_149575 ) ) ( not ( = ?auto_149569 ?auto_149576 ) ) ( not ( = ?auto_149570 ?auto_149571 ) ) ( not ( = ?auto_149570 ?auto_149572 ) ) ( not ( = ?auto_149570 ?auto_149573 ) ) ( not ( = ?auto_149570 ?auto_149574 ) ) ( not ( = ?auto_149570 ?auto_149575 ) ) ( not ( = ?auto_149570 ?auto_149576 ) ) ( not ( = ?auto_149571 ?auto_149572 ) ) ( not ( = ?auto_149571 ?auto_149573 ) ) ( not ( = ?auto_149571 ?auto_149574 ) ) ( not ( = ?auto_149571 ?auto_149575 ) ) ( not ( = ?auto_149571 ?auto_149576 ) ) ( not ( = ?auto_149572 ?auto_149573 ) ) ( not ( = ?auto_149572 ?auto_149574 ) ) ( not ( = ?auto_149572 ?auto_149575 ) ) ( not ( = ?auto_149572 ?auto_149576 ) ) ( not ( = ?auto_149573 ?auto_149574 ) ) ( not ( = ?auto_149573 ?auto_149575 ) ) ( not ( = ?auto_149573 ?auto_149576 ) ) ( not ( = ?auto_149574 ?auto_149575 ) ) ( not ( = ?auto_149574 ?auto_149576 ) ) ( not ( = ?auto_149575 ?auto_149576 ) ) ( ON-TABLE ?auto_149576 ) ( ON ?auto_149575 ?auto_149576 ) ( ON ?auto_149574 ?auto_149575 ) ( ON ?auto_149573 ?auto_149574 ) ( ON ?auto_149572 ?auto_149573 ) ( ON ?auto_149571 ?auto_149572 ) ( ON ?auto_149570 ?auto_149571 ) ( ON ?auto_149569 ?auto_149570 ) ( CLEAR ?auto_149569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149576 ?auto_149575 ?auto_149574 ?auto_149573 ?auto_149572 ?auto_149571 ?auto_149570 )
      ( MAKE-8PILE ?auto_149569 ?auto_149570 ?auto_149571 ?auto_149572 ?auto_149573 ?auto_149574 ?auto_149575 ?auto_149576 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149577 - BLOCK
      ?auto_149578 - BLOCK
      ?auto_149579 - BLOCK
      ?auto_149580 - BLOCK
      ?auto_149581 - BLOCK
      ?auto_149582 - BLOCK
      ?auto_149583 - BLOCK
      ?auto_149584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149577 ?auto_149578 ) ) ( not ( = ?auto_149577 ?auto_149579 ) ) ( not ( = ?auto_149577 ?auto_149580 ) ) ( not ( = ?auto_149577 ?auto_149581 ) ) ( not ( = ?auto_149577 ?auto_149582 ) ) ( not ( = ?auto_149577 ?auto_149583 ) ) ( not ( = ?auto_149577 ?auto_149584 ) ) ( not ( = ?auto_149578 ?auto_149579 ) ) ( not ( = ?auto_149578 ?auto_149580 ) ) ( not ( = ?auto_149578 ?auto_149581 ) ) ( not ( = ?auto_149578 ?auto_149582 ) ) ( not ( = ?auto_149578 ?auto_149583 ) ) ( not ( = ?auto_149578 ?auto_149584 ) ) ( not ( = ?auto_149579 ?auto_149580 ) ) ( not ( = ?auto_149579 ?auto_149581 ) ) ( not ( = ?auto_149579 ?auto_149582 ) ) ( not ( = ?auto_149579 ?auto_149583 ) ) ( not ( = ?auto_149579 ?auto_149584 ) ) ( not ( = ?auto_149580 ?auto_149581 ) ) ( not ( = ?auto_149580 ?auto_149582 ) ) ( not ( = ?auto_149580 ?auto_149583 ) ) ( not ( = ?auto_149580 ?auto_149584 ) ) ( not ( = ?auto_149581 ?auto_149582 ) ) ( not ( = ?auto_149581 ?auto_149583 ) ) ( not ( = ?auto_149581 ?auto_149584 ) ) ( not ( = ?auto_149582 ?auto_149583 ) ) ( not ( = ?auto_149582 ?auto_149584 ) ) ( not ( = ?auto_149583 ?auto_149584 ) ) ( ON-TABLE ?auto_149584 ) ( ON ?auto_149583 ?auto_149584 ) ( ON ?auto_149582 ?auto_149583 ) ( ON ?auto_149581 ?auto_149582 ) ( ON ?auto_149580 ?auto_149581 ) ( ON ?auto_149579 ?auto_149580 ) ( ON ?auto_149578 ?auto_149579 ) ( HOLDING ?auto_149577 ) ( CLEAR ?auto_149578 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149584 ?auto_149583 ?auto_149582 ?auto_149581 ?auto_149580 ?auto_149579 ?auto_149578 ?auto_149577 )
      ( MAKE-8PILE ?auto_149577 ?auto_149578 ?auto_149579 ?auto_149580 ?auto_149581 ?auto_149582 ?auto_149583 ?auto_149584 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149585 - BLOCK
      ?auto_149586 - BLOCK
      ?auto_149587 - BLOCK
      ?auto_149588 - BLOCK
      ?auto_149589 - BLOCK
      ?auto_149590 - BLOCK
      ?auto_149591 - BLOCK
      ?auto_149592 - BLOCK
    )
    :vars
    (
      ?auto_149593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149585 ?auto_149586 ) ) ( not ( = ?auto_149585 ?auto_149587 ) ) ( not ( = ?auto_149585 ?auto_149588 ) ) ( not ( = ?auto_149585 ?auto_149589 ) ) ( not ( = ?auto_149585 ?auto_149590 ) ) ( not ( = ?auto_149585 ?auto_149591 ) ) ( not ( = ?auto_149585 ?auto_149592 ) ) ( not ( = ?auto_149586 ?auto_149587 ) ) ( not ( = ?auto_149586 ?auto_149588 ) ) ( not ( = ?auto_149586 ?auto_149589 ) ) ( not ( = ?auto_149586 ?auto_149590 ) ) ( not ( = ?auto_149586 ?auto_149591 ) ) ( not ( = ?auto_149586 ?auto_149592 ) ) ( not ( = ?auto_149587 ?auto_149588 ) ) ( not ( = ?auto_149587 ?auto_149589 ) ) ( not ( = ?auto_149587 ?auto_149590 ) ) ( not ( = ?auto_149587 ?auto_149591 ) ) ( not ( = ?auto_149587 ?auto_149592 ) ) ( not ( = ?auto_149588 ?auto_149589 ) ) ( not ( = ?auto_149588 ?auto_149590 ) ) ( not ( = ?auto_149588 ?auto_149591 ) ) ( not ( = ?auto_149588 ?auto_149592 ) ) ( not ( = ?auto_149589 ?auto_149590 ) ) ( not ( = ?auto_149589 ?auto_149591 ) ) ( not ( = ?auto_149589 ?auto_149592 ) ) ( not ( = ?auto_149590 ?auto_149591 ) ) ( not ( = ?auto_149590 ?auto_149592 ) ) ( not ( = ?auto_149591 ?auto_149592 ) ) ( ON-TABLE ?auto_149592 ) ( ON ?auto_149591 ?auto_149592 ) ( ON ?auto_149590 ?auto_149591 ) ( ON ?auto_149589 ?auto_149590 ) ( ON ?auto_149588 ?auto_149589 ) ( ON ?auto_149587 ?auto_149588 ) ( ON ?auto_149586 ?auto_149587 ) ( CLEAR ?auto_149586 ) ( ON ?auto_149585 ?auto_149593 ) ( CLEAR ?auto_149585 ) ( HAND-EMPTY ) ( not ( = ?auto_149585 ?auto_149593 ) ) ( not ( = ?auto_149586 ?auto_149593 ) ) ( not ( = ?auto_149587 ?auto_149593 ) ) ( not ( = ?auto_149588 ?auto_149593 ) ) ( not ( = ?auto_149589 ?auto_149593 ) ) ( not ( = ?auto_149590 ?auto_149593 ) ) ( not ( = ?auto_149591 ?auto_149593 ) ) ( not ( = ?auto_149592 ?auto_149593 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149585 ?auto_149593 )
      ( MAKE-8PILE ?auto_149585 ?auto_149586 ?auto_149587 ?auto_149588 ?auto_149589 ?auto_149590 ?auto_149591 ?auto_149592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149594 - BLOCK
      ?auto_149595 - BLOCK
      ?auto_149596 - BLOCK
      ?auto_149597 - BLOCK
      ?auto_149598 - BLOCK
      ?auto_149599 - BLOCK
      ?auto_149600 - BLOCK
      ?auto_149601 - BLOCK
    )
    :vars
    (
      ?auto_149602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149594 ?auto_149595 ) ) ( not ( = ?auto_149594 ?auto_149596 ) ) ( not ( = ?auto_149594 ?auto_149597 ) ) ( not ( = ?auto_149594 ?auto_149598 ) ) ( not ( = ?auto_149594 ?auto_149599 ) ) ( not ( = ?auto_149594 ?auto_149600 ) ) ( not ( = ?auto_149594 ?auto_149601 ) ) ( not ( = ?auto_149595 ?auto_149596 ) ) ( not ( = ?auto_149595 ?auto_149597 ) ) ( not ( = ?auto_149595 ?auto_149598 ) ) ( not ( = ?auto_149595 ?auto_149599 ) ) ( not ( = ?auto_149595 ?auto_149600 ) ) ( not ( = ?auto_149595 ?auto_149601 ) ) ( not ( = ?auto_149596 ?auto_149597 ) ) ( not ( = ?auto_149596 ?auto_149598 ) ) ( not ( = ?auto_149596 ?auto_149599 ) ) ( not ( = ?auto_149596 ?auto_149600 ) ) ( not ( = ?auto_149596 ?auto_149601 ) ) ( not ( = ?auto_149597 ?auto_149598 ) ) ( not ( = ?auto_149597 ?auto_149599 ) ) ( not ( = ?auto_149597 ?auto_149600 ) ) ( not ( = ?auto_149597 ?auto_149601 ) ) ( not ( = ?auto_149598 ?auto_149599 ) ) ( not ( = ?auto_149598 ?auto_149600 ) ) ( not ( = ?auto_149598 ?auto_149601 ) ) ( not ( = ?auto_149599 ?auto_149600 ) ) ( not ( = ?auto_149599 ?auto_149601 ) ) ( not ( = ?auto_149600 ?auto_149601 ) ) ( ON-TABLE ?auto_149601 ) ( ON ?auto_149600 ?auto_149601 ) ( ON ?auto_149599 ?auto_149600 ) ( ON ?auto_149598 ?auto_149599 ) ( ON ?auto_149597 ?auto_149598 ) ( ON ?auto_149596 ?auto_149597 ) ( ON ?auto_149594 ?auto_149602 ) ( CLEAR ?auto_149594 ) ( not ( = ?auto_149594 ?auto_149602 ) ) ( not ( = ?auto_149595 ?auto_149602 ) ) ( not ( = ?auto_149596 ?auto_149602 ) ) ( not ( = ?auto_149597 ?auto_149602 ) ) ( not ( = ?auto_149598 ?auto_149602 ) ) ( not ( = ?auto_149599 ?auto_149602 ) ) ( not ( = ?auto_149600 ?auto_149602 ) ) ( not ( = ?auto_149601 ?auto_149602 ) ) ( HOLDING ?auto_149595 ) ( CLEAR ?auto_149596 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149601 ?auto_149600 ?auto_149599 ?auto_149598 ?auto_149597 ?auto_149596 ?auto_149595 )
      ( MAKE-8PILE ?auto_149594 ?auto_149595 ?auto_149596 ?auto_149597 ?auto_149598 ?auto_149599 ?auto_149600 ?auto_149601 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149603 - BLOCK
      ?auto_149604 - BLOCK
      ?auto_149605 - BLOCK
      ?auto_149606 - BLOCK
      ?auto_149607 - BLOCK
      ?auto_149608 - BLOCK
      ?auto_149609 - BLOCK
      ?auto_149610 - BLOCK
    )
    :vars
    (
      ?auto_149611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149603 ?auto_149604 ) ) ( not ( = ?auto_149603 ?auto_149605 ) ) ( not ( = ?auto_149603 ?auto_149606 ) ) ( not ( = ?auto_149603 ?auto_149607 ) ) ( not ( = ?auto_149603 ?auto_149608 ) ) ( not ( = ?auto_149603 ?auto_149609 ) ) ( not ( = ?auto_149603 ?auto_149610 ) ) ( not ( = ?auto_149604 ?auto_149605 ) ) ( not ( = ?auto_149604 ?auto_149606 ) ) ( not ( = ?auto_149604 ?auto_149607 ) ) ( not ( = ?auto_149604 ?auto_149608 ) ) ( not ( = ?auto_149604 ?auto_149609 ) ) ( not ( = ?auto_149604 ?auto_149610 ) ) ( not ( = ?auto_149605 ?auto_149606 ) ) ( not ( = ?auto_149605 ?auto_149607 ) ) ( not ( = ?auto_149605 ?auto_149608 ) ) ( not ( = ?auto_149605 ?auto_149609 ) ) ( not ( = ?auto_149605 ?auto_149610 ) ) ( not ( = ?auto_149606 ?auto_149607 ) ) ( not ( = ?auto_149606 ?auto_149608 ) ) ( not ( = ?auto_149606 ?auto_149609 ) ) ( not ( = ?auto_149606 ?auto_149610 ) ) ( not ( = ?auto_149607 ?auto_149608 ) ) ( not ( = ?auto_149607 ?auto_149609 ) ) ( not ( = ?auto_149607 ?auto_149610 ) ) ( not ( = ?auto_149608 ?auto_149609 ) ) ( not ( = ?auto_149608 ?auto_149610 ) ) ( not ( = ?auto_149609 ?auto_149610 ) ) ( ON-TABLE ?auto_149610 ) ( ON ?auto_149609 ?auto_149610 ) ( ON ?auto_149608 ?auto_149609 ) ( ON ?auto_149607 ?auto_149608 ) ( ON ?auto_149606 ?auto_149607 ) ( ON ?auto_149605 ?auto_149606 ) ( ON ?auto_149603 ?auto_149611 ) ( not ( = ?auto_149603 ?auto_149611 ) ) ( not ( = ?auto_149604 ?auto_149611 ) ) ( not ( = ?auto_149605 ?auto_149611 ) ) ( not ( = ?auto_149606 ?auto_149611 ) ) ( not ( = ?auto_149607 ?auto_149611 ) ) ( not ( = ?auto_149608 ?auto_149611 ) ) ( not ( = ?auto_149609 ?auto_149611 ) ) ( not ( = ?auto_149610 ?auto_149611 ) ) ( CLEAR ?auto_149605 ) ( ON ?auto_149604 ?auto_149603 ) ( CLEAR ?auto_149604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149611 ?auto_149603 )
      ( MAKE-8PILE ?auto_149603 ?auto_149604 ?auto_149605 ?auto_149606 ?auto_149607 ?auto_149608 ?auto_149609 ?auto_149610 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149612 - BLOCK
      ?auto_149613 - BLOCK
      ?auto_149614 - BLOCK
      ?auto_149615 - BLOCK
      ?auto_149616 - BLOCK
      ?auto_149617 - BLOCK
      ?auto_149618 - BLOCK
      ?auto_149619 - BLOCK
    )
    :vars
    (
      ?auto_149620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149612 ?auto_149613 ) ) ( not ( = ?auto_149612 ?auto_149614 ) ) ( not ( = ?auto_149612 ?auto_149615 ) ) ( not ( = ?auto_149612 ?auto_149616 ) ) ( not ( = ?auto_149612 ?auto_149617 ) ) ( not ( = ?auto_149612 ?auto_149618 ) ) ( not ( = ?auto_149612 ?auto_149619 ) ) ( not ( = ?auto_149613 ?auto_149614 ) ) ( not ( = ?auto_149613 ?auto_149615 ) ) ( not ( = ?auto_149613 ?auto_149616 ) ) ( not ( = ?auto_149613 ?auto_149617 ) ) ( not ( = ?auto_149613 ?auto_149618 ) ) ( not ( = ?auto_149613 ?auto_149619 ) ) ( not ( = ?auto_149614 ?auto_149615 ) ) ( not ( = ?auto_149614 ?auto_149616 ) ) ( not ( = ?auto_149614 ?auto_149617 ) ) ( not ( = ?auto_149614 ?auto_149618 ) ) ( not ( = ?auto_149614 ?auto_149619 ) ) ( not ( = ?auto_149615 ?auto_149616 ) ) ( not ( = ?auto_149615 ?auto_149617 ) ) ( not ( = ?auto_149615 ?auto_149618 ) ) ( not ( = ?auto_149615 ?auto_149619 ) ) ( not ( = ?auto_149616 ?auto_149617 ) ) ( not ( = ?auto_149616 ?auto_149618 ) ) ( not ( = ?auto_149616 ?auto_149619 ) ) ( not ( = ?auto_149617 ?auto_149618 ) ) ( not ( = ?auto_149617 ?auto_149619 ) ) ( not ( = ?auto_149618 ?auto_149619 ) ) ( ON-TABLE ?auto_149619 ) ( ON ?auto_149618 ?auto_149619 ) ( ON ?auto_149617 ?auto_149618 ) ( ON ?auto_149616 ?auto_149617 ) ( ON ?auto_149615 ?auto_149616 ) ( ON ?auto_149612 ?auto_149620 ) ( not ( = ?auto_149612 ?auto_149620 ) ) ( not ( = ?auto_149613 ?auto_149620 ) ) ( not ( = ?auto_149614 ?auto_149620 ) ) ( not ( = ?auto_149615 ?auto_149620 ) ) ( not ( = ?auto_149616 ?auto_149620 ) ) ( not ( = ?auto_149617 ?auto_149620 ) ) ( not ( = ?auto_149618 ?auto_149620 ) ) ( not ( = ?auto_149619 ?auto_149620 ) ) ( ON ?auto_149613 ?auto_149612 ) ( CLEAR ?auto_149613 ) ( ON-TABLE ?auto_149620 ) ( HOLDING ?auto_149614 ) ( CLEAR ?auto_149615 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149619 ?auto_149618 ?auto_149617 ?auto_149616 ?auto_149615 ?auto_149614 )
      ( MAKE-8PILE ?auto_149612 ?auto_149613 ?auto_149614 ?auto_149615 ?auto_149616 ?auto_149617 ?auto_149618 ?auto_149619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149621 - BLOCK
      ?auto_149622 - BLOCK
      ?auto_149623 - BLOCK
      ?auto_149624 - BLOCK
      ?auto_149625 - BLOCK
      ?auto_149626 - BLOCK
      ?auto_149627 - BLOCK
      ?auto_149628 - BLOCK
    )
    :vars
    (
      ?auto_149629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149621 ?auto_149622 ) ) ( not ( = ?auto_149621 ?auto_149623 ) ) ( not ( = ?auto_149621 ?auto_149624 ) ) ( not ( = ?auto_149621 ?auto_149625 ) ) ( not ( = ?auto_149621 ?auto_149626 ) ) ( not ( = ?auto_149621 ?auto_149627 ) ) ( not ( = ?auto_149621 ?auto_149628 ) ) ( not ( = ?auto_149622 ?auto_149623 ) ) ( not ( = ?auto_149622 ?auto_149624 ) ) ( not ( = ?auto_149622 ?auto_149625 ) ) ( not ( = ?auto_149622 ?auto_149626 ) ) ( not ( = ?auto_149622 ?auto_149627 ) ) ( not ( = ?auto_149622 ?auto_149628 ) ) ( not ( = ?auto_149623 ?auto_149624 ) ) ( not ( = ?auto_149623 ?auto_149625 ) ) ( not ( = ?auto_149623 ?auto_149626 ) ) ( not ( = ?auto_149623 ?auto_149627 ) ) ( not ( = ?auto_149623 ?auto_149628 ) ) ( not ( = ?auto_149624 ?auto_149625 ) ) ( not ( = ?auto_149624 ?auto_149626 ) ) ( not ( = ?auto_149624 ?auto_149627 ) ) ( not ( = ?auto_149624 ?auto_149628 ) ) ( not ( = ?auto_149625 ?auto_149626 ) ) ( not ( = ?auto_149625 ?auto_149627 ) ) ( not ( = ?auto_149625 ?auto_149628 ) ) ( not ( = ?auto_149626 ?auto_149627 ) ) ( not ( = ?auto_149626 ?auto_149628 ) ) ( not ( = ?auto_149627 ?auto_149628 ) ) ( ON-TABLE ?auto_149628 ) ( ON ?auto_149627 ?auto_149628 ) ( ON ?auto_149626 ?auto_149627 ) ( ON ?auto_149625 ?auto_149626 ) ( ON ?auto_149624 ?auto_149625 ) ( ON ?auto_149621 ?auto_149629 ) ( not ( = ?auto_149621 ?auto_149629 ) ) ( not ( = ?auto_149622 ?auto_149629 ) ) ( not ( = ?auto_149623 ?auto_149629 ) ) ( not ( = ?auto_149624 ?auto_149629 ) ) ( not ( = ?auto_149625 ?auto_149629 ) ) ( not ( = ?auto_149626 ?auto_149629 ) ) ( not ( = ?auto_149627 ?auto_149629 ) ) ( not ( = ?auto_149628 ?auto_149629 ) ) ( ON ?auto_149622 ?auto_149621 ) ( ON-TABLE ?auto_149629 ) ( CLEAR ?auto_149624 ) ( ON ?auto_149623 ?auto_149622 ) ( CLEAR ?auto_149623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149629 ?auto_149621 ?auto_149622 )
      ( MAKE-8PILE ?auto_149621 ?auto_149622 ?auto_149623 ?auto_149624 ?auto_149625 ?auto_149626 ?auto_149627 ?auto_149628 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149630 - BLOCK
      ?auto_149631 - BLOCK
      ?auto_149632 - BLOCK
      ?auto_149633 - BLOCK
      ?auto_149634 - BLOCK
      ?auto_149635 - BLOCK
      ?auto_149636 - BLOCK
      ?auto_149637 - BLOCK
    )
    :vars
    (
      ?auto_149638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149630 ?auto_149631 ) ) ( not ( = ?auto_149630 ?auto_149632 ) ) ( not ( = ?auto_149630 ?auto_149633 ) ) ( not ( = ?auto_149630 ?auto_149634 ) ) ( not ( = ?auto_149630 ?auto_149635 ) ) ( not ( = ?auto_149630 ?auto_149636 ) ) ( not ( = ?auto_149630 ?auto_149637 ) ) ( not ( = ?auto_149631 ?auto_149632 ) ) ( not ( = ?auto_149631 ?auto_149633 ) ) ( not ( = ?auto_149631 ?auto_149634 ) ) ( not ( = ?auto_149631 ?auto_149635 ) ) ( not ( = ?auto_149631 ?auto_149636 ) ) ( not ( = ?auto_149631 ?auto_149637 ) ) ( not ( = ?auto_149632 ?auto_149633 ) ) ( not ( = ?auto_149632 ?auto_149634 ) ) ( not ( = ?auto_149632 ?auto_149635 ) ) ( not ( = ?auto_149632 ?auto_149636 ) ) ( not ( = ?auto_149632 ?auto_149637 ) ) ( not ( = ?auto_149633 ?auto_149634 ) ) ( not ( = ?auto_149633 ?auto_149635 ) ) ( not ( = ?auto_149633 ?auto_149636 ) ) ( not ( = ?auto_149633 ?auto_149637 ) ) ( not ( = ?auto_149634 ?auto_149635 ) ) ( not ( = ?auto_149634 ?auto_149636 ) ) ( not ( = ?auto_149634 ?auto_149637 ) ) ( not ( = ?auto_149635 ?auto_149636 ) ) ( not ( = ?auto_149635 ?auto_149637 ) ) ( not ( = ?auto_149636 ?auto_149637 ) ) ( ON-TABLE ?auto_149637 ) ( ON ?auto_149636 ?auto_149637 ) ( ON ?auto_149635 ?auto_149636 ) ( ON ?auto_149634 ?auto_149635 ) ( ON ?auto_149630 ?auto_149638 ) ( not ( = ?auto_149630 ?auto_149638 ) ) ( not ( = ?auto_149631 ?auto_149638 ) ) ( not ( = ?auto_149632 ?auto_149638 ) ) ( not ( = ?auto_149633 ?auto_149638 ) ) ( not ( = ?auto_149634 ?auto_149638 ) ) ( not ( = ?auto_149635 ?auto_149638 ) ) ( not ( = ?auto_149636 ?auto_149638 ) ) ( not ( = ?auto_149637 ?auto_149638 ) ) ( ON ?auto_149631 ?auto_149630 ) ( ON-TABLE ?auto_149638 ) ( ON ?auto_149632 ?auto_149631 ) ( CLEAR ?auto_149632 ) ( HOLDING ?auto_149633 ) ( CLEAR ?auto_149634 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149637 ?auto_149636 ?auto_149635 ?auto_149634 ?auto_149633 )
      ( MAKE-8PILE ?auto_149630 ?auto_149631 ?auto_149632 ?auto_149633 ?auto_149634 ?auto_149635 ?auto_149636 ?auto_149637 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149639 - BLOCK
      ?auto_149640 - BLOCK
      ?auto_149641 - BLOCK
      ?auto_149642 - BLOCK
      ?auto_149643 - BLOCK
      ?auto_149644 - BLOCK
      ?auto_149645 - BLOCK
      ?auto_149646 - BLOCK
    )
    :vars
    (
      ?auto_149647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149639 ?auto_149640 ) ) ( not ( = ?auto_149639 ?auto_149641 ) ) ( not ( = ?auto_149639 ?auto_149642 ) ) ( not ( = ?auto_149639 ?auto_149643 ) ) ( not ( = ?auto_149639 ?auto_149644 ) ) ( not ( = ?auto_149639 ?auto_149645 ) ) ( not ( = ?auto_149639 ?auto_149646 ) ) ( not ( = ?auto_149640 ?auto_149641 ) ) ( not ( = ?auto_149640 ?auto_149642 ) ) ( not ( = ?auto_149640 ?auto_149643 ) ) ( not ( = ?auto_149640 ?auto_149644 ) ) ( not ( = ?auto_149640 ?auto_149645 ) ) ( not ( = ?auto_149640 ?auto_149646 ) ) ( not ( = ?auto_149641 ?auto_149642 ) ) ( not ( = ?auto_149641 ?auto_149643 ) ) ( not ( = ?auto_149641 ?auto_149644 ) ) ( not ( = ?auto_149641 ?auto_149645 ) ) ( not ( = ?auto_149641 ?auto_149646 ) ) ( not ( = ?auto_149642 ?auto_149643 ) ) ( not ( = ?auto_149642 ?auto_149644 ) ) ( not ( = ?auto_149642 ?auto_149645 ) ) ( not ( = ?auto_149642 ?auto_149646 ) ) ( not ( = ?auto_149643 ?auto_149644 ) ) ( not ( = ?auto_149643 ?auto_149645 ) ) ( not ( = ?auto_149643 ?auto_149646 ) ) ( not ( = ?auto_149644 ?auto_149645 ) ) ( not ( = ?auto_149644 ?auto_149646 ) ) ( not ( = ?auto_149645 ?auto_149646 ) ) ( ON-TABLE ?auto_149646 ) ( ON ?auto_149645 ?auto_149646 ) ( ON ?auto_149644 ?auto_149645 ) ( ON ?auto_149643 ?auto_149644 ) ( ON ?auto_149639 ?auto_149647 ) ( not ( = ?auto_149639 ?auto_149647 ) ) ( not ( = ?auto_149640 ?auto_149647 ) ) ( not ( = ?auto_149641 ?auto_149647 ) ) ( not ( = ?auto_149642 ?auto_149647 ) ) ( not ( = ?auto_149643 ?auto_149647 ) ) ( not ( = ?auto_149644 ?auto_149647 ) ) ( not ( = ?auto_149645 ?auto_149647 ) ) ( not ( = ?auto_149646 ?auto_149647 ) ) ( ON ?auto_149640 ?auto_149639 ) ( ON-TABLE ?auto_149647 ) ( ON ?auto_149641 ?auto_149640 ) ( CLEAR ?auto_149643 ) ( ON ?auto_149642 ?auto_149641 ) ( CLEAR ?auto_149642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149647 ?auto_149639 ?auto_149640 ?auto_149641 )
      ( MAKE-8PILE ?auto_149639 ?auto_149640 ?auto_149641 ?auto_149642 ?auto_149643 ?auto_149644 ?auto_149645 ?auto_149646 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149648 - BLOCK
      ?auto_149649 - BLOCK
      ?auto_149650 - BLOCK
      ?auto_149651 - BLOCK
      ?auto_149652 - BLOCK
      ?auto_149653 - BLOCK
      ?auto_149654 - BLOCK
      ?auto_149655 - BLOCK
    )
    :vars
    (
      ?auto_149656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149648 ?auto_149649 ) ) ( not ( = ?auto_149648 ?auto_149650 ) ) ( not ( = ?auto_149648 ?auto_149651 ) ) ( not ( = ?auto_149648 ?auto_149652 ) ) ( not ( = ?auto_149648 ?auto_149653 ) ) ( not ( = ?auto_149648 ?auto_149654 ) ) ( not ( = ?auto_149648 ?auto_149655 ) ) ( not ( = ?auto_149649 ?auto_149650 ) ) ( not ( = ?auto_149649 ?auto_149651 ) ) ( not ( = ?auto_149649 ?auto_149652 ) ) ( not ( = ?auto_149649 ?auto_149653 ) ) ( not ( = ?auto_149649 ?auto_149654 ) ) ( not ( = ?auto_149649 ?auto_149655 ) ) ( not ( = ?auto_149650 ?auto_149651 ) ) ( not ( = ?auto_149650 ?auto_149652 ) ) ( not ( = ?auto_149650 ?auto_149653 ) ) ( not ( = ?auto_149650 ?auto_149654 ) ) ( not ( = ?auto_149650 ?auto_149655 ) ) ( not ( = ?auto_149651 ?auto_149652 ) ) ( not ( = ?auto_149651 ?auto_149653 ) ) ( not ( = ?auto_149651 ?auto_149654 ) ) ( not ( = ?auto_149651 ?auto_149655 ) ) ( not ( = ?auto_149652 ?auto_149653 ) ) ( not ( = ?auto_149652 ?auto_149654 ) ) ( not ( = ?auto_149652 ?auto_149655 ) ) ( not ( = ?auto_149653 ?auto_149654 ) ) ( not ( = ?auto_149653 ?auto_149655 ) ) ( not ( = ?auto_149654 ?auto_149655 ) ) ( ON-TABLE ?auto_149655 ) ( ON ?auto_149654 ?auto_149655 ) ( ON ?auto_149653 ?auto_149654 ) ( ON ?auto_149648 ?auto_149656 ) ( not ( = ?auto_149648 ?auto_149656 ) ) ( not ( = ?auto_149649 ?auto_149656 ) ) ( not ( = ?auto_149650 ?auto_149656 ) ) ( not ( = ?auto_149651 ?auto_149656 ) ) ( not ( = ?auto_149652 ?auto_149656 ) ) ( not ( = ?auto_149653 ?auto_149656 ) ) ( not ( = ?auto_149654 ?auto_149656 ) ) ( not ( = ?auto_149655 ?auto_149656 ) ) ( ON ?auto_149649 ?auto_149648 ) ( ON-TABLE ?auto_149656 ) ( ON ?auto_149650 ?auto_149649 ) ( ON ?auto_149651 ?auto_149650 ) ( CLEAR ?auto_149651 ) ( HOLDING ?auto_149652 ) ( CLEAR ?auto_149653 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149655 ?auto_149654 ?auto_149653 ?auto_149652 )
      ( MAKE-8PILE ?auto_149648 ?auto_149649 ?auto_149650 ?auto_149651 ?auto_149652 ?auto_149653 ?auto_149654 ?auto_149655 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149657 - BLOCK
      ?auto_149658 - BLOCK
      ?auto_149659 - BLOCK
      ?auto_149660 - BLOCK
      ?auto_149661 - BLOCK
      ?auto_149662 - BLOCK
      ?auto_149663 - BLOCK
      ?auto_149664 - BLOCK
    )
    :vars
    (
      ?auto_149665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149657 ?auto_149658 ) ) ( not ( = ?auto_149657 ?auto_149659 ) ) ( not ( = ?auto_149657 ?auto_149660 ) ) ( not ( = ?auto_149657 ?auto_149661 ) ) ( not ( = ?auto_149657 ?auto_149662 ) ) ( not ( = ?auto_149657 ?auto_149663 ) ) ( not ( = ?auto_149657 ?auto_149664 ) ) ( not ( = ?auto_149658 ?auto_149659 ) ) ( not ( = ?auto_149658 ?auto_149660 ) ) ( not ( = ?auto_149658 ?auto_149661 ) ) ( not ( = ?auto_149658 ?auto_149662 ) ) ( not ( = ?auto_149658 ?auto_149663 ) ) ( not ( = ?auto_149658 ?auto_149664 ) ) ( not ( = ?auto_149659 ?auto_149660 ) ) ( not ( = ?auto_149659 ?auto_149661 ) ) ( not ( = ?auto_149659 ?auto_149662 ) ) ( not ( = ?auto_149659 ?auto_149663 ) ) ( not ( = ?auto_149659 ?auto_149664 ) ) ( not ( = ?auto_149660 ?auto_149661 ) ) ( not ( = ?auto_149660 ?auto_149662 ) ) ( not ( = ?auto_149660 ?auto_149663 ) ) ( not ( = ?auto_149660 ?auto_149664 ) ) ( not ( = ?auto_149661 ?auto_149662 ) ) ( not ( = ?auto_149661 ?auto_149663 ) ) ( not ( = ?auto_149661 ?auto_149664 ) ) ( not ( = ?auto_149662 ?auto_149663 ) ) ( not ( = ?auto_149662 ?auto_149664 ) ) ( not ( = ?auto_149663 ?auto_149664 ) ) ( ON-TABLE ?auto_149664 ) ( ON ?auto_149663 ?auto_149664 ) ( ON ?auto_149662 ?auto_149663 ) ( ON ?auto_149657 ?auto_149665 ) ( not ( = ?auto_149657 ?auto_149665 ) ) ( not ( = ?auto_149658 ?auto_149665 ) ) ( not ( = ?auto_149659 ?auto_149665 ) ) ( not ( = ?auto_149660 ?auto_149665 ) ) ( not ( = ?auto_149661 ?auto_149665 ) ) ( not ( = ?auto_149662 ?auto_149665 ) ) ( not ( = ?auto_149663 ?auto_149665 ) ) ( not ( = ?auto_149664 ?auto_149665 ) ) ( ON ?auto_149658 ?auto_149657 ) ( ON-TABLE ?auto_149665 ) ( ON ?auto_149659 ?auto_149658 ) ( ON ?auto_149660 ?auto_149659 ) ( CLEAR ?auto_149662 ) ( ON ?auto_149661 ?auto_149660 ) ( CLEAR ?auto_149661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149665 ?auto_149657 ?auto_149658 ?auto_149659 ?auto_149660 )
      ( MAKE-8PILE ?auto_149657 ?auto_149658 ?auto_149659 ?auto_149660 ?auto_149661 ?auto_149662 ?auto_149663 ?auto_149664 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149666 - BLOCK
      ?auto_149667 - BLOCK
      ?auto_149668 - BLOCK
      ?auto_149669 - BLOCK
      ?auto_149670 - BLOCK
      ?auto_149671 - BLOCK
      ?auto_149672 - BLOCK
      ?auto_149673 - BLOCK
    )
    :vars
    (
      ?auto_149674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149666 ?auto_149667 ) ) ( not ( = ?auto_149666 ?auto_149668 ) ) ( not ( = ?auto_149666 ?auto_149669 ) ) ( not ( = ?auto_149666 ?auto_149670 ) ) ( not ( = ?auto_149666 ?auto_149671 ) ) ( not ( = ?auto_149666 ?auto_149672 ) ) ( not ( = ?auto_149666 ?auto_149673 ) ) ( not ( = ?auto_149667 ?auto_149668 ) ) ( not ( = ?auto_149667 ?auto_149669 ) ) ( not ( = ?auto_149667 ?auto_149670 ) ) ( not ( = ?auto_149667 ?auto_149671 ) ) ( not ( = ?auto_149667 ?auto_149672 ) ) ( not ( = ?auto_149667 ?auto_149673 ) ) ( not ( = ?auto_149668 ?auto_149669 ) ) ( not ( = ?auto_149668 ?auto_149670 ) ) ( not ( = ?auto_149668 ?auto_149671 ) ) ( not ( = ?auto_149668 ?auto_149672 ) ) ( not ( = ?auto_149668 ?auto_149673 ) ) ( not ( = ?auto_149669 ?auto_149670 ) ) ( not ( = ?auto_149669 ?auto_149671 ) ) ( not ( = ?auto_149669 ?auto_149672 ) ) ( not ( = ?auto_149669 ?auto_149673 ) ) ( not ( = ?auto_149670 ?auto_149671 ) ) ( not ( = ?auto_149670 ?auto_149672 ) ) ( not ( = ?auto_149670 ?auto_149673 ) ) ( not ( = ?auto_149671 ?auto_149672 ) ) ( not ( = ?auto_149671 ?auto_149673 ) ) ( not ( = ?auto_149672 ?auto_149673 ) ) ( ON-TABLE ?auto_149673 ) ( ON ?auto_149672 ?auto_149673 ) ( ON ?auto_149666 ?auto_149674 ) ( not ( = ?auto_149666 ?auto_149674 ) ) ( not ( = ?auto_149667 ?auto_149674 ) ) ( not ( = ?auto_149668 ?auto_149674 ) ) ( not ( = ?auto_149669 ?auto_149674 ) ) ( not ( = ?auto_149670 ?auto_149674 ) ) ( not ( = ?auto_149671 ?auto_149674 ) ) ( not ( = ?auto_149672 ?auto_149674 ) ) ( not ( = ?auto_149673 ?auto_149674 ) ) ( ON ?auto_149667 ?auto_149666 ) ( ON-TABLE ?auto_149674 ) ( ON ?auto_149668 ?auto_149667 ) ( ON ?auto_149669 ?auto_149668 ) ( ON ?auto_149670 ?auto_149669 ) ( CLEAR ?auto_149670 ) ( HOLDING ?auto_149671 ) ( CLEAR ?auto_149672 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149673 ?auto_149672 ?auto_149671 )
      ( MAKE-8PILE ?auto_149666 ?auto_149667 ?auto_149668 ?auto_149669 ?auto_149670 ?auto_149671 ?auto_149672 ?auto_149673 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149675 - BLOCK
      ?auto_149676 - BLOCK
      ?auto_149677 - BLOCK
      ?auto_149678 - BLOCK
      ?auto_149679 - BLOCK
      ?auto_149680 - BLOCK
      ?auto_149681 - BLOCK
      ?auto_149682 - BLOCK
    )
    :vars
    (
      ?auto_149683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149675 ?auto_149676 ) ) ( not ( = ?auto_149675 ?auto_149677 ) ) ( not ( = ?auto_149675 ?auto_149678 ) ) ( not ( = ?auto_149675 ?auto_149679 ) ) ( not ( = ?auto_149675 ?auto_149680 ) ) ( not ( = ?auto_149675 ?auto_149681 ) ) ( not ( = ?auto_149675 ?auto_149682 ) ) ( not ( = ?auto_149676 ?auto_149677 ) ) ( not ( = ?auto_149676 ?auto_149678 ) ) ( not ( = ?auto_149676 ?auto_149679 ) ) ( not ( = ?auto_149676 ?auto_149680 ) ) ( not ( = ?auto_149676 ?auto_149681 ) ) ( not ( = ?auto_149676 ?auto_149682 ) ) ( not ( = ?auto_149677 ?auto_149678 ) ) ( not ( = ?auto_149677 ?auto_149679 ) ) ( not ( = ?auto_149677 ?auto_149680 ) ) ( not ( = ?auto_149677 ?auto_149681 ) ) ( not ( = ?auto_149677 ?auto_149682 ) ) ( not ( = ?auto_149678 ?auto_149679 ) ) ( not ( = ?auto_149678 ?auto_149680 ) ) ( not ( = ?auto_149678 ?auto_149681 ) ) ( not ( = ?auto_149678 ?auto_149682 ) ) ( not ( = ?auto_149679 ?auto_149680 ) ) ( not ( = ?auto_149679 ?auto_149681 ) ) ( not ( = ?auto_149679 ?auto_149682 ) ) ( not ( = ?auto_149680 ?auto_149681 ) ) ( not ( = ?auto_149680 ?auto_149682 ) ) ( not ( = ?auto_149681 ?auto_149682 ) ) ( ON-TABLE ?auto_149682 ) ( ON ?auto_149681 ?auto_149682 ) ( ON ?auto_149675 ?auto_149683 ) ( not ( = ?auto_149675 ?auto_149683 ) ) ( not ( = ?auto_149676 ?auto_149683 ) ) ( not ( = ?auto_149677 ?auto_149683 ) ) ( not ( = ?auto_149678 ?auto_149683 ) ) ( not ( = ?auto_149679 ?auto_149683 ) ) ( not ( = ?auto_149680 ?auto_149683 ) ) ( not ( = ?auto_149681 ?auto_149683 ) ) ( not ( = ?auto_149682 ?auto_149683 ) ) ( ON ?auto_149676 ?auto_149675 ) ( ON-TABLE ?auto_149683 ) ( ON ?auto_149677 ?auto_149676 ) ( ON ?auto_149678 ?auto_149677 ) ( ON ?auto_149679 ?auto_149678 ) ( CLEAR ?auto_149681 ) ( ON ?auto_149680 ?auto_149679 ) ( CLEAR ?auto_149680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149683 ?auto_149675 ?auto_149676 ?auto_149677 ?auto_149678 ?auto_149679 )
      ( MAKE-8PILE ?auto_149675 ?auto_149676 ?auto_149677 ?auto_149678 ?auto_149679 ?auto_149680 ?auto_149681 ?auto_149682 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149684 - BLOCK
      ?auto_149685 - BLOCK
      ?auto_149686 - BLOCK
      ?auto_149687 - BLOCK
      ?auto_149688 - BLOCK
      ?auto_149689 - BLOCK
      ?auto_149690 - BLOCK
      ?auto_149691 - BLOCK
    )
    :vars
    (
      ?auto_149692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149684 ?auto_149685 ) ) ( not ( = ?auto_149684 ?auto_149686 ) ) ( not ( = ?auto_149684 ?auto_149687 ) ) ( not ( = ?auto_149684 ?auto_149688 ) ) ( not ( = ?auto_149684 ?auto_149689 ) ) ( not ( = ?auto_149684 ?auto_149690 ) ) ( not ( = ?auto_149684 ?auto_149691 ) ) ( not ( = ?auto_149685 ?auto_149686 ) ) ( not ( = ?auto_149685 ?auto_149687 ) ) ( not ( = ?auto_149685 ?auto_149688 ) ) ( not ( = ?auto_149685 ?auto_149689 ) ) ( not ( = ?auto_149685 ?auto_149690 ) ) ( not ( = ?auto_149685 ?auto_149691 ) ) ( not ( = ?auto_149686 ?auto_149687 ) ) ( not ( = ?auto_149686 ?auto_149688 ) ) ( not ( = ?auto_149686 ?auto_149689 ) ) ( not ( = ?auto_149686 ?auto_149690 ) ) ( not ( = ?auto_149686 ?auto_149691 ) ) ( not ( = ?auto_149687 ?auto_149688 ) ) ( not ( = ?auto_149687 ?auto_149689 ) ) ( not ( = ?auto_149687 ?auto_149690 ) ) ( not ( = ?auto_149687 ?auto_149691 ) ) ( not ( = ?auto_149688 ?auto_149689 ) ) ( not ( = ?auto_149688 ?auto_149690 ) ) ( not ( = ?auto_149688 ?auto_149691 ) ) ( not ( = ?auto_149689 ?auto_149690 ) ) ( not ( = ?auto_149689 ?auto_149691 ) ) ( not ( = ?auto_149690 ?auto_149691 ) ) ( ON-TABLE ?auto_149691 ) ( ON ?auto_149684 ?auto_149692 ) ( not ( = ?auto_149684 ?auto_149692 ) ) ( not ( = ?auto_149685 ?auto_149692 ) ) ( not ( = ?auto_149686 ?auto_149692 ) ) ( not ( = ?auto_149687 ?auto_149692 ) ) ( not ( = ?auto_149688 ?auto_149692 ) ) ( not ( = ?auto_149689 ?auto_149692 ) ) ( not ( = ?auto_149690 ?auto_149692 ) ) ( not ( = ?auto_149691 ?auto_149692 ) ) ( ON ?auto_149685 ?auto_149684 ) ( ON-TABLE ?auto_149692 ) ( ON ?auto_149686 ?auto_149685 ) ( ON ?auto_149687 ?auto_149686 ) ( ON ?auto_149688 ?auto_149687 ) ( ON ?auto_149689 ?auto_149688 ) ( CLEAR ?auto_149689 ) ( HOLDING ?auto_149690 ) ( CLEAR ?auto_149691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149691 ?auto_149690 )
      ( MAKE-8PILE ?auto_149684 ?auto_149685 ?auto_149686 ?auto_149687 ?auto_149688 ?auto_149689 ?auto_149690 ?auto_149691 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149693 - BLOCK
      ?auto_149694 - BLOCK
      ?auto_149695 - BLOCK
      ?auto_149696 - BLOCK
      ?auto_149697 - BLOCK
      ?auto_149698 - BLOCK
      ?auto_149699 - BLOCK
      ?auto_149700 - BLOCK
    )
    :vars
    (
      ?auto_149701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149693 ?auto_149694 ) ) ( not ( = ?auto_149693 ?auto_149695 ) ) ( not ( = ?auto_149693 ?auto_149696 ) ) ( not ( = ?auto_149693 ?auto_149697 ) ) ( not ( = ?auto_149693 ?auto_149698 ) ) ( not ( = ?auto_149693 ?auto_149699 ) ) ( not ( = ?auto_149693 ?auto_149700 ) ) ( not ( = ?auto_149694 ?auto_149695 ) ) ( not ( = ?auto_149694 ?auto_149696 ) ) ( not ( = ?auto_149694 ?auto_149697 ) ) ( not ( = ?auto_149694 ?auto_149698 ) ) ( not ( = ?auto_149694 ?auto_149699 ) ) ( not ( = ?auto_149694 ?auto_149700 ) ) ( not ( = ?auto_149695 ?auto_149696 ) ) ( not ( = ?auto_149695 ?auto_149697 ) ) ( not ( = ?auto_149695 ?auto_149698 ) ) ( not ( = ?auto_149695 ?auto_149699 ) ) ( not ( = ?auto_149695 ?auto_149700 ) ) ( not ( = ?auto_149696 ?auto_149697 ) ) ( not ( = ?auto_149696 ?auto_149698 ) ) ( not ( = ?auto_149696 ?auto_149699 ) ) ( not ( = ?auto_149696 ?auto_149700 ) ) ( not ( = ?auto_149697 ?auto_149698 ) ) ( not ( = ?auto_149697 ?auto_149699 ) ) ( not ( = ?auto_149697 ?auto_149700 ) ) ( not ( = ?auto_149698 ?auto_149699 ) ) ( not ( = ?auto_149698 ?auto_149700 ) ) ( not ( = ?auto_149699 ?auto_149700 ) ) ( ON-TABLE ?auto_149700 ) ( ON ?auto_149693 ?auto_149701 ) ( not ( = ?auto_149693 ?auto_149701 ) ) ( not ( = ?auto_149694 ?auto_149701 ) ) ( not ( = ?auto_149695 ?auto_149701 ) ) ( not ( = ?auto_149696 ?auto_149701 ) ) ( not ( = ?auto_149697 ?auto_149701 ) ) ( not ( = ?auto_149698 ?auto_149701 ) ) ( not ( = ?auto_149699 ?auto_149701 ) ) ( not ( = ?auto_149700 ?auto_149701 ) ) ( ON ?auto_149694 ?auto_149693 ) ( ON-TABLE ?auto_149701 ) ( ON ?auto_149695 ?auto_149694 ) ( ON ?auto_149696 ?auto_149695 ) ( ON ?auto_149697 ?auto_149696 ) ( ON ?auto_149698 ?auto_149697 ) ( CLEAR ?auto_149700 ) ( ON ?auto_149699 ?auto_149698 ) ( CLEAR ?auto_149699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149701 ?auto_149693 ?auto_149694 ?auto_149695 ?auto_149696 ?auto_149697 ?auto_149698 )
      ( MAKE-8PILE ?auto_149693 ?auto_149694 ?auto_149695 ?auto_149696 ?auto_149697 ?auto_149698 ?auto_149699 ?auto_149700 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149702 - BLOCK
      ?auto_149703 - BLOCK
      ?auto_149704 - BLOCK
      ?auto_149705 - BLOCK
      ?auto_149706 - BLOCK
      ?auto_149707 - BLOCK
      ?auto_149708 - BLOCK
      ?auto_149709 - BLOCK
    )
    :vars
    (
      ?auto_149710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149702 ?auto_149703 ) ) ( not ( = ?auto_149702 ?auto_149704 ) ) ( not ( = ?auto_149702 ?auto_149705 ) ) ( not ( = ?auto_149702 ?auto_149706 ) ) ( not ( = ?auto_149702 ?auto_149707 ) ) ( not ( = ?auto_149702 ?auto_149708 ) ) ( not ( = ?auto_149702 ?auto_149709 ) ) ( not ( = ?auto_149703 ?auto_149704 ) ) ( not ( = ?auto_149703 ?auto_149705 ) ) ( not ( = ?auto_149703 ?auto_149706 ) ) ( not ( = ?auto_149703 ?auto_149707 ) ) ( not ( = ?auto_149703 ?auto_149708 ) ) ( not ( = ?auto_149703 ?auto_149709 ) ) ( not ( = ?auto_149704 ?auto_149705 ) ) ( not ( = ?auto_149704 ?auto_149706 ) ) ( not ( = ?auto_149704 ?auto_149707 ) ) ( not ( = ?auto_149704 ?auto_149708 ) ) ( not ( = ?auto_149704 ?auto_149709 ) ) ( not ( = ?auto_149705 ?auto_149706 ) ) ( not ( = ?auto_149705 ?auto_149707 ) ) ( not ( = ?auto_149705 ?auto_149708 ) ) ( not ( = ?auto_149705 ?auto_149709 ) ) ( not ( = ?auto_149706 ?auto_149707 ) ) ( not ( = ?auto_149706 ?auto_149708 ) ) ( not ( = ?auto_149706 ?auto_149709 ) ) ( not ( = ?auto_149707 ?auto_149708 ) ) ( not ( = ?auto_149707 ?auto_149709 ) ) ( not ( = ?auto_149708 ?auto_149709 ) ) ( ON ?auto_149702 ?auto_149710 ) ( not ( = ?auto_149702 ?auto_149710 ) ) ( not ( = ?auto_149703 ?auto_149710 ) ) ( not ( = ?auto_149704 ?auto_149710 ) ) ( not ( = ?auto_149705 ?auto_149710 ) ) ( not ( = ?auto_149706 ?auto_149710 ) ) ( not ( = ?auto_149707 ?auto_149710 ) ) ( not ( = ?auto_149708 ?auto_149710 ) ) ( not ( = ?auto_149709 ?auto_149710 ) ) ( ON ?auto_149703 ?auto_149702 ) ( ON-TABLE ?auto_149710 ) ( ON ?auto_149704 ?auto_149703 ) ( ON ?auto_149705 ?auto_149704 ) ( ON ?auto_149706 ?auto_149705 ) ( ON ?auto_149707 ?auto_149706 ) ( ON ?auto_149708 ?auto_149707 ) ( CLEAR ?auto_149708 ) ( HOLDING ?auto_149709 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149709 )
      ( MAKE-8PILE ?auto_149702 ?auto_149703 ?auto_149704 ?auto_149705 ?auto_149706 ?auto_149707 ?auto_149708 ?auto_149709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_149711 - BLOCK
      ?auto_149712 - BLOCK
      ?auto_149713 - BLOCK
      ?auto_149714 - BLOCK
      ?auto_149715 - BLOCK
      ?auto_149716 - BLOCK
      ?auto_149717 - BLOCK
      ?auto_149718 - BLOCK
    )
    :vars
    (
      ?auto_149719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_149711 ?auto_149712 ) ) ( not ( = ?auto_149711 ?auto_149713 ) ) ( not ( = ?auto_149711 ?auto_149714 ) ) ( not ( = ?auto_149711 ?auto_149715 ) ) ( not ( = ?auto_149711 ?auto_149716 ) ) ( not ( = ?auto_149711 ?auto_149717 ) ) ( not ( = ?auto_149711 ?auto_149718 ) ) ( not ( = ?auto_149712 ?auto_149713 ) ) ( not ( = ?auto_149712 ?auto_149714 ) ) ( not ( = ?auto_149712 ?auto_149715 ) ) ( not ( = ?auto_149712 ?auto_149716 ) ) ( not ( = ?auto_149712 ?auto_149717 ) ) ( not ( = ?auto_149712 ?auto_149718 ) ) ( not ( = ?auto_149713 ?auto_149714 ) ) ( not ( = ?auto_149713 ?auto_149715 ) ) ( not ( = ?auto_149713 ?auto_149716 ) ) ( not ( = ?auto_149713 ?auto_149717 ) ) ( not ( = ?auto_149713 ?auto_149718 ) ) ( not ( = ?auto_149714 ?auto_149715 ) ) ( not ( = ?auto_149714 ?auto_149716 ) ) ( not ( = ?auto_149714 ?auto_149717 ) ) ( not ( = ?auto_149714 ?auto_149718 ) ) ( not ( = ?auto_149715 ?auto_149716 ) ) ( not ( = ?auto_149715 ?auto_149717 ) ) ( not ( = ?auto_149715 ?auto_149718 ) ) ( not ( = ?auto_149716 ?auto_149717 ) ) ( not ( = ?auto_149716 ?auto_149718 ) ) ( not ( = ?auto_149717 ?auto_149718 ) ) ( ON ?auto_149711 ?auto_149719 ) ( not ( = ?auto_149711 ?auto_149719 ) ) ( not ( = ?auto_149712 ?auto_149719 ) ) ( not ( = ?auto_149713 ?auto_149719 ) ) ( not ( = ?auto_149714 ?auto_149719 ) ) ( not ( = ?auto_149715 ?auto_149719 ) ) ( not ( = ?auto_149716 ?auto_149719 ) ) ( not ( = ?auto_149717 ?auto_149719 ) ) ( not ( = ?auto_149718 ?auto_149719 ) ) ( ON ?auto_149712 ?auto_149711 ) ( ON-TABLE ?auto_149719 ) ( ON ?auto_149713 ?auto_149712 ) ( ON ?auto_149714 ?auto_149713 ) ( ON ?auto_149715 ?auto_149714 ) ( ON ?auto_149716 ?auto_149715 ) ( ON ?auto_149717 ?auto_149716 ) ( ON ?auto_149718 ?auto_149717 ) ( CLEAR ?auto_149718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149719 ?auto_149711 ?auto_149712 ?auto_149713 ?auto_149714 ?auto_149715 ?auto_149716 ?auto_149717 )
      ( MAKE-8PILE ?auto_149711 ?auto_149712 ?auto_149713 ?auto_149714 ?auto_149715 ?auto_149716 ?auto_149717 ?auto_149718 ) )
  )

)

