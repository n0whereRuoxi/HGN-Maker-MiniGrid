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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76535 - BLOCK
      ?auto_76536 - BLOCK
      ?auto_76537 - BLOCK
      ?auto_76538 - BLOCK
      ?auto_76539 - BLOCK
      ?auto_76540 - BLOCK
      ?auto_76541 - BLOCK
    )
    :vars
    (
      ?auto_76542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76542 ?auto_76541 ) ( CLEAR ?auto_76542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76535 ) ( ON ?auto_76536 ?auto_76535 ) ( ON ?auto_76537 ?auto_76536 ) ( ON ?auto_76538 ?auto_76537 ) ( ON ?auto_76539 ?auto_76538 ) ( ON ?auto_76540 ?auto_76539 ) ( ON ?auto_76541 ?auto_76540 ) ( not ( = ?auto_76535 ?auto_76536 ) ) ( not ( = ?auto_76535 ?auto_76537 ) ) ( not ( = ?auto_76535 ?auto_76538 ) ) ( not ( = ?auto_76535 ?auto_76539 ) ) ( not ( = ?auto_76535 ?auto_76540 ) ) ( not ( = ?auto_76535 ?auto_76541 ) ) ( not ( = ?auto_76535 ?auto_76542 ) ) ( not ( = ?auto_76536 ?auto_76537 ) ) ( not ( = ?auto_76536 ?auto_76538 ) ) ( not ( = ?auto_76536 ?auto_76539 ) ) ( not ( = ?auto_76536 ?auto_76540 ) ) ( not ( = ?auto_76536 ?auto_76541 ) ) ( not ( = ?auto_76536 ?auto_76542 ) ) ( not ( = ?auto_76537 ?auto_76538 ) ) ( not ( = ?auto_76537 ?auto_76539 ) ) ( not ( = ?auto_76537 ?auto_76540 ) ) ( not ( = ?auto_76537 ?auto_76541 ) ) ( not ( = ?auto_76537 ?auto_76542 ) ) ( not ( = ?auto_76538 ?auto_76539 ) ) ( not ( = ?auto_76538 ?auto_76540 ) ) ( not ( = ?auto_76538 ?auto_76541 ) ) ( not ( = ?auto_76538 ?auto_76542 ) ) ( not ( = ?auto_76539 ?auto_76540 ) ) ( not ( = ?auto_76539 ?auto_76541 ) ) ( not ( = ?auto_76539 ?auto_76542 ) ) ( not ( = ?auto_76540 ?auto_76541 ) ) ( not ( = ?auto_76540 ?auto_76542 ) ) ( not ( = ?auto_76541 ?auto_76542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76542 ?auto_76541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76544 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76544 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_76544 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76545 - BLOCK
    )
    :vars
    (
      ?auto_76546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76545 ?auto_76546 ) ( CLEAR ?auto_76545 ) ( HAND-EMPTY ) ( not ( = ?auto_76545 ?auto_76546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76545 ?auto_76546 )
      ( MAKE-1PILE ?auto_76545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76553 - BLOCK
      ?auto_76554 - BLOCK
      ?auto_76555 - BLOCK
      ?auto_76556 - BLOCK
      ?auto_76557 - BLOCK
      ?auto_76558 - BLOCK
    )
    :vars
    (
      ?auto_76559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76559 ?auto_76558 ) ( CLEAR ?auto_76559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76553 ) ( ON ?auto_76554 ?auto_76553 ) ( ON ?auto_76555 ?auto_76554 ) ( ON ?auto_76556 ?auto_76555 ) ( ON ?auto_76557 ?auto_76556 ) ( ON ?auto_76558 ?auto_76557 ) ( not ( = ?auto_76553 ?auto_76554 ) ) ( not ( = ?auto_76553 ?auto_76555 ) ) ( not ( = ?auto_76553 ?auto_76556 ) ) ( not ( = ?auto_76553 ?auto_76557 ) ) ( not ( = ?auto_76553 ?auto_76558 ) ) ( not ( = ?auto_76553 ?auto_76559 ) ) ( not ( = ?auto_76554 ?auto_76555 ) ) ( not ( = ?auto_76554 ?auto_76556 ) ) ( not ( = ?auto_76554 ?auto_76557 ) ) ( not ( = ?auto_76554 ?auto_76558 ) ) ( not ( = ?auto_76554 ?auto_76559 ) ) ( not ( = ?auto_76555 ?auto_76556 ) ) ( not ( = ?auto_76555 ?auto_76557 ) ) ( not ( = ?auto_76555 ?auto_76558 ) ) ( not ( = ?auto_76555 ?auto_76559 ) ) ( not ( = ?auto_76556 ?auto_76557 ) ) ( not ( = ?auto_76556 ?auto_76558 ) ) ( not ( = ?auto_76556 ?auto_76559 ) ) ( not ( = ?auto_76557 ?auto_76558 ) ) ( not ( = ?auto_76557 ?auto_76559 ) ) ( not ( = ?auto_76558 ?auto_76559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76559 ?auto_76558 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76560 - BLOCK
      ?auto_76561 - BLOCK
      ?auto_76562 - BLOCK
      ?auto_76563 - BLOCK
      ?auto_76564 - BLOCK
      ?auto_76565 - BLOCK
    )
    :vars
    (
      ?auto_76566 - BLOCK
      ?auto_76567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76566 ?auto_76565 ) ( CLEAR ?auto_76566 ) ( ON-TABLE ?auto_76560 ) ( ON ?auto_76561 ?auto_76560 ) ( ON ?auto_76562 ?auto_76561 ) ( ON ?auto_76563 ?auto_76562 ) ( ON ?auto_76564 ?auto_76563 ) ( ON ?auto_76565 ?auto_76564 ) ( not ( = ?auto_76560 ?auto_76561 ) ) ( not ( = ?auto_76560 ?auto_76562 ) ) ( not ( = ?auto_76560 ?auto_76563 ) ) ( not ( = ?auto_76560 ?auto_76564 ) ) ( not ( = ?auto_76560 ?auto_76565 ) ) ( not ( = ?auto_76560 ?auto_76566 ) ) ( not ( = ?auto_76561 ?auto_76562 ) ) ( not ( = ?auto_76561 ?auto_76563 ) ) ( not ( = ?auto_76561 ?auto_76564 ) ) ( not ( = ?auto_76561 ?auto_76565 ) ) ( not ( = ?auto_76561 ?auto_76566 ) ) ( not ( = ?auto_76562 ?auto_76563 ) ) ( not ( = ?auto_76562 ?auto_76564 ) ) ( not ( = ?auto_76562 ?auto_76565 ) ) ( not ( = ?auto_76562 ?auto_76566 ) ) ( not ( = ?auto_76563 ?auto_76564 ) ) ( not ( = ?auto_76563 ?auto_76565 ) ) ( not ( = ?auto_76563 ?auto_76566 ) ) ( not ( = ?auto_76564 ?auto_76565 ) ) ( not ( = ?auto_76564 ?auto_76566 ) ) ( not ( = ?auto_76565 ?auto_76566 ) ) ( HOLDING ?auto_76567 ) ( not ( = ?auto_76560 ?auto_76567 ) ) ( not ( = ?auto_76561 ?auto_76567 ) ) ( not ( = ?auto_76562 ?auto_76567 ) ) ( not ( = ?auto_76563 ?auto_76567 ) ) ( not ( = ?auto_76564 ?auto_76567 ) ) ( not ( = ?auto_76565 ?auto_76567 ) ) ( not ( = ?auto_76566 ?auto_76567 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_76567 )
      ( MAKE-6PILE ?auto_76560 ?auto_76561 ?auto_76562 ?auto_76563 ?auto_76564 ?auto_76565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76568 - BLOCK
      ?auto_76569 - BLOCK
      ?auto_76570 - BLOCK
      ?auto_76571 - BLOCK
      ?auto_76572 - BLOCK
      ?auto_76573 - BLOCK
    )
    :vars
    (
      ?auto_76574 - BLOCK
      ?auto_76575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76574 ?auto_76573 ) ( ON-TABLE ?auto_76568 ) ( ON ?auto_76569 ?auto_76568 ) ( ON ?auto_76570 ?auto_76569 ) ( ON ?auto_76571 ?auto_76570 ) ( ON ?auto_76572 ?auto_76571 ) ( ON ?auto_76573 ?auto_76572 ) ( not ( = ?auto_76568 ?auto_76569 ) ) ( not ( = ?auto_76568 ?auto_76570 ) ) ( not ( = ?auto_76568 ?auto_76571 ) ) ( not ( = ?auto_76568 ?auto_76572 ) ) ( not ( = ?auto_76568 ?auto_76573 ) ) ( not ( = ?auto_76568 ?auto_76574 ) ) ( not ( = ?auto_76569 ?auto_76570 ) ) ( not ( = ?auto_76569 ?auto_76571 ) ) ( not ( = ?auto_76569 ?auto_76572 ) ) ( not ( = ?auto_76569 ?auto_76573 ) ) ( not ( = ?auto_76569 ?auto_76574 ) ) ( not ( = ?auto_76570 ?auto_76571 ) ) ( not ( = ?auto_76570 ?auto_76572 ) ) ( not ( = ?auto_76570 ?auto_76573 ) ) ( not ( = ?auto_76570 ?auto_76574 ) ) ( not ( = ?auto_76571 ?auto_76572 ) ) ( not ( = ?auto_76571 ?auto_76573 ) ) ( not ( = ?auto_76571 ?auto_76574 ) ) ( not ( = ?auto_76572 ?auto_76573 ) ) ( not ( = ?auto_76572 ?auto_76574 ) ) ( not ( = ?auto_76573 ?auto_76574 ) ) ( not ( = ?auto_76568 ?auto_76575 ) ) ( not ( = ?auto_76569 ?auto_76575 ) ) ( not ( = ?auto_76570 ?auto_76575 ) ) ( not ( = ?auto_76571 ?auto_76575 ) ) ( not ( = ?auto_76572 ?auto_76575 ) ) ( not ( = ?auto_76573 ?auto_76575 ) ) ( not ( = ?auto_76574 ?auto_76575 ) ) ( ON ?auto_76575 ?auto_76574 ) ( CLEAR ?auto_76575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76568 ?auto_76569 ?auto_76570 ?auto_76571 ?auto_76572 ?auto_76573 ?auto_76574 )
      ( MAKE-6PILE ?auto_76568 ?auto_76569 ?auto_76570 ?auto_76571 ?auto_76572 ?auto_76573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76578 - BLOCK
      ?auto_76579 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76579 ) ( CLEAR ?auto_76578 ) ( ON-TABLE ?auto_76578 ) ( not ( = ?auto_76578 ?auto_76579 ) ) )
    :subtasks
    ( ( !STACK ?auto_76579 ?auto_76578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76580 - BLOCK
      ?auto_76581 - BLOCK
    )
    :vars
    (
      ?auto_76582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76580 ) ( ON-TABLE ?auto_76580 ) ( not ( = ?auto_76580 ?auto_76581 ) ) ( ON ?auto_76581 ?auto_76582 ) ( CLEAR ?auto_76581 ) ( HAND-EMPTY ) ( not ( = ?auto_76580 ?auto_76582 ) ) ( not ( = ?auto_76581 ?auto_76582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76581 ?auto_76582 )
      ( MAKE-2PILE ?auto_76580 ?auto_76581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76583 - BLOCK
      ?auto_76584 - BLOCK
    )
    :vars
    (
      ?auto_76585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76583 ?auto_76584 ) ) ( ON ?auto_76584 ?auto_76585 ) ( CLEAR ?auto_76584 ) ( not ( = ?auto_76583 ?auto_76585 ) ) ( not ( = ?auto_76584 ?auto_76585 ) ) ( HOLDING ?auto_76583 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76583 )
      ( MAKE-2PILE ?auto_76583 ?auto_76584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76586 - BLOCK
      ?auto_76587 - BLOCK
    )
    :vars
    (
      ?auto_76588 - BLOCK
      ?auto_76590 - BLOCK
      ?auto_76591 - BLOCK
      ?auto_76592 - BLOCK
      ?auto_76589 - BLOCK
      ?auto_76593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76586 ?auto_76587 ) ) ( ON ?auto_76587 ?auto_76588 ) ( not ( = ?auto_76586 ?auto_76588 ) ) ( not ( = ?auto_76587 ?auto_76588 ) ) ( ON ?auto_76586 ?auto_76587 ) ( CLEAR ?auto_76586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76590 ) ( ON ?auto_76591 ?auto_76590 ) ( ON ?auto_76592 ?auto_76591 ) ( ON ?auto_76589 ?auto_76592 ) ( ON ?auto_76593 ?auto_76589 ) ( ON ?auto_76588 ?auto_76593 ) ( not ( = ?auto_76590 ?auto_76591 ) ) ( not ( = ?auto_76590 ?auto_76592 ) ) ( not ( = ?auto_76590 ?auto_76589 ) ) ( not ( = ?auto_76590 ?auto_76593 ) ) ( not ( = ?auto_76590 ?auto_76588 ) ) ( not ( = ?auto_76590 ?auto_76587 ) ) ( not ( = ?auto_76590 ?auto_76586 ) ) ( not ( = ?auto_76591 ?auto_76592 ) ) ( not ( = ?auto_76591 ?auto_76589 ) ) ( not ( = ?auto_76591 ?auto_76593 ) ) ( not ( = ?auto_76591 ?auto_76588 ) ) ( not ( = ?auto_76591 ?auto_76587 ) ) ( not ( = ?auto_76591 ?auto_76586 ) ) ( not ( = ?auto_76592 ?auto_76589 ) ) ( not ( = ?auto_76592 ?auto_76593 ) ) ( not ( = ?auto_76592 ?auto_76588 ) ) ( not ( = ?auto_76592 ?auto_76587 ) ) ( not ( = ?auto_76592 ?auto_76586 ) ) ( not ( = ?auto_76589 ?auto_76593 ) ) ( not ( = ?auto_76589 ?auto_76588 ) ) ( not ( = ?auto_76589 ?auto_76587 ) ) ( not ( = ?auto_76589 ?auto_76586 ) ) ( not ( = ?auto_76593 ?auto_76588 ) ) ( not ( = ?auto_76593 ?auto_76587 ) ) ( not ( = ?auto_76593 ?auto_76586 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76590 ?auto_76591 ?auto_76592 ?auto_76589 ?auto_76593 ?auto_76588 ?auto_76587 )
      ( MAKE-2PILE ?auto_76586 ?auto_76587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76599 - BLOCK
      ?auto_76600 - BLOCK
      ?auto_76601 - BLOCK
      ?auto_76602 - BLOCK
      ?auto_76603 - BLOCK
    )
    :vars
    (
      ?auto_76604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76604 ?auto_76603 ) ( CLEAR ?auto_76604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76599 ) ( ON ?auto_76600 ?auto_76599 ) ( ON ?auto_76601 ?auto_76600 ) ( ON ?auto_76602 ?auto_76601 ) ( ON ?auto_76603 ?auto_76602 ) ( not ( = ?auto_76599 ?auto_76600 ) ) ( not ( = ?auto_76599 ?auto_76601 ) ) ( not ( = ?auto_76599 ?auto_76602 ) ) ( not ( = ?auto_76599 ?auto_76603 ) ) ( not ( = ?auto_76599 ?auto_76604 ) ) ( not ( = ?auto_76600 ?auto_76601 ) ) ( not ( = ?auto_76600 ?auto_76602 ) ) ( not ( = ?auto_76600 ?auto_76603 ) ) ( not ( = ?auto_76600 ?auto_76604 ) ) ( not ( = ?auto_76601 ?auto_76602 ) ) ( not ( = ?auto_76601 ?auto_76603 ) ) ( not ( = ?auto_76601 ?auto_76604 ) ) ( not ( = ?auto_76602 ?auto_76603 ) ) ( not ( = ?auto_76602 ?auto_76604 ) ) ( not ( = ?auto_76603 ?auto_76604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76604 ?auto_76603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76605 - BLOCK
      ?auto_76606 - BLOCK
      ?auto_76607 - BLOCK
      ?auto_76608 - BLOCK
      ?auto_76609 - BLOCK
    )
    :vars
    (
      ?auto_76610 - BLOCK
      ?auto_76611 - BLOCK
      ?auto_76612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76610 ?auto_76609 ) ( CLEAR ?auto_76610 ) ( ON-TABLE ?auto_76605 ) ( ON ?auto_76606 ?auto_76605 ) ( ON ?auto_76607 ?auto_76606 ) ( ON ?auto_76608 ?auto_76607 ) ( ON ?auto_76609 ?auto_76608 ) ( not ( = ?auto_76605 ?auto_76606 ) ) ( not ( = ?auto_76605 ?auto_76607 ) ) ( not ( = ?auto_76605 ?auto_76608 ) ) ( not ( = ?auto_76605 ?auto_76609 ) ) ( not ( = ?auto_76605 ?auto_76610 ) ) ( not ( = ?auto_76606 ?auto_76607 ) ) ( not ( = ?auto_76606 ?auto_76608 ) ) ( not ( = ?auto_76606 ?auto_76609 ) ) ( not ( = ?auto_76606 ?auto_76610 ) ) ( not ( = ?auto_76607 ?auto_76608 ) ) ( not ( = ?auto_76607 ?auto_76609 ) ) ( not ( = ?auto_76607 ?auto_76610 ) ) ( not ( = ?auto_76608 ?auto_76609 ) ) ( not ( = ?auto_76608 ?auto_76610 ) ) ( not ( = ?auto_76609 ?auto_76610 ) ) ( HOLDING ?auto_76611 ) ( CLEAR ?auto_76612 ) ( not ( = ?auto_76605 ?auto_76611 ) ) ( not ( = ?auto_76605 ?auto_76612 ) ) ( not ( = ?auto_76606 ?auto_76611 ) ) ( not ( = ?auto_76606 ?auto_76612 ) ) ( not ( = ?auto_76607 ?auto_76611 ) ) ( not ( = ?auto_76607 ?auto_76612 ) ) ( not ( = ?auto_76608 ?auto_76611 ) ) ( not ( = ?auto_76608 ?auto_76612 ) ) ( not ( = ?auto_76609 ?auto_76611 ) ) ( not ( = ?auto_76609 ?auto_76612 ) ) ( not ( = ?auto_76610 ?auto_76611 ) ) ( not ( = ?auto_76610 ?auto_76612 ) ) ( not ( = ?auto_76611 ?auto_76612 ) ) )
    :subtasks
    ( ( !STACK ?auto_76611 ?auto_76612 )
      ( MAKE-5PILE ?auto_76605 ?auto_76606 ?auto_76607 ?auto_76608 ?auto_76609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77531 - BLOCK
      ?auto_77532 - BLOCK
      ?auto_77533 - BLOCK
      ?auto_77534 - BLOCK
      ?auto_77535 - BLOCK
    )
    :vars
    (
      ?auto_77537 - BLOCK
      ?auto_77536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77537 ?auto_77535 ) ( ON-TABLE ?auto_77531 ) ( ON ?auto_77532 ?auto_77531 ) ( ON ?auto_77533 ?auto_77532 ) ( ON ?auto_77534 ?auto_77533 ) ( ON ?auto_77535 ?auto_77534 ) ( not ( = ?auto_77531 ?auto_77532 ) ) ( not ( = ?auto_77531 ?auto_77533 ) ) ( not ( = ?auto_77531 ?auto_77534 ) ) ( not ( = ?auto_77531 ?auto_77535 ) ) ( not ( = ?auto_77531 ?auto_77537 ) ) ( not ( = ?auto_77532 ?auto_77533 ) ) ( not ( = ?auto_77532 ?auto_77534 ) ) ( not ( = ?auto_77532 ?auto_77535 ) ) ( not ( = ?auto_77532 ?auto_77537 ) ) ( not ( = ?auto_77533 ?auto_77534 ) ) ( not ( = ?auto_77533 ?auto_77535 ) ) ( not ( = ?auto_77533 ?auto_77537 ) ) ( not ( = ?auto_77534 ?auto_77535 ) ) ( not ( = ?auto_77534 ?auto_77537 ) ) ( not ( = ?auto_77535 ?auto_77537 ) ) ( not ( = ?auto_77531 ?auto_77536 ) ) ( not ( = ?auto_77532 ?auto_77536 ) ) ( not ( = ?auto_77533 ?auto_77536 ) ) ( not ( = ?auto_77534 ?auto_77536 ) ) ( not ( = ?auto_77535 ?auto_77536 ) ) ( not ( = ?auto_77537 ?auto_77536 ) ) ( ON ?auto_77536 ?auto_77537 ) ( CLEAR ?auto_77536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77531 ?auto_77532 ?auto_77533 ?auto_77534 ?auto_77535 ?auto_77537 )
      ( MAKE-5PILE ?auto_77531 ?auto_77532 ?auto_77533 ?auto_77534 ?auto_77535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76621 - BLOCK
      ?auto_76622 - BLOCK
      ?auto_76623 - BLOCK
      ?auto_76624 - BLOCK
      ?auto_76625 - BLOCK
    )
    :vars
    (
      ?auto_76627 - BLOCK
      ?auto_76628 - BLOCK
      ?auto_76626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76627 ?auto_76625 ) ( ON-TABLE ?auto_76621 ) ( ON ?auto_76622 ?auto_76621 ) ( ON ?auto_76623 ?auto_76622 ) ( ON ?auto_76624 ?auto_76623 ) ( ON ?auto_76625 ?auto_76624 ) ( not ( = ?auto_76621 ?auto_76622 ) ) ( not ( = ?auto_76621 ?auto_76623 ) ) ( not ( = ?auto_76621 ?auto_76624 ) ) ( not ( = ?auto_76621 ?auto_76625 ) ) ( not ( = ?auto_76621 ?auto_76627 ) ) ( not ( = ?auto_76622 ?auto_76623 ) ) ( not ( = ?auto_76622 ?auto_76624 ) ) ( not ( = ?auto_76622 ?auto_76625 ) ) ( not ( = ?auto_76622 ?auto_76627 ) ) ( not ( = ?auto_76623 ?auto_76624 ) ) ( not ( = ?auto_76623 ?auto_76625 ) ) ( not ( = ?auto_76623 ?auto_76627 ) ) ( not ( = ?auto_76624 ?auto_76625 ) ) ( not ( = ?auto_76624 ?auto_76627 ) ) ( not ( = ?auto_76625 ?auto_76627 ) ) ( not ( = ?auto_76621 ?auto_76628 ) ) ( not ( = ?auto_76621 ?auto_76626 ) ) ( not ( = ?auto_76622 ?auto_76628 ) ) ( not ( = ?auto_76622 ?auto_76626 ) ) ( not ( = ?auto_76623 ?auto_76628 ) ) ( not ( = ?auto_76623 ?auto_76626 ) ) ( not ( = ?auto_76624 ?auto_76628 ) ) ( not ( = ?auto_76624 ?auto_76626 ) ) ( not ( = ?auto_76625 ?auto_76628 ) ) ( not ( = ?auto_76625 ?auto_76626 ) ) ( not ( = ?auto_76627 ?auto_76628 ) ) ( not ( = ?auto_76627 ?auto_76626 ) ) ( not ( = ?auto_76628 ?auto_76626 ) ) ( ON ?auto_76628 ?auto_76627 ) ( CLEAR ?auto_76628 ) ( HOLDING ?auto_76626 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76626 )
      ( MAKE-5PILE ?auto_76621 ?auto_76622 ?auto_76623 ?auto_76624 ?auto_76625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76629 - BLOCK
      ?auto_76630 - BLOCK
      ?auto_76631 - BLOCK
      ?auto_76632 - BLOCK
      ?auto_76633 - BLOCK
    )
    :vars
    (
      ?auto_76634 - BLOCK
      ?auto_76636 - BLOCK
      ?auto_76635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76634 ?auto_76633 ) ( ON-TABLE ?auto_76629 ) ( ON ?auto_76630 ?auto_76629 ) ( ON ?auto_76631 ?auto_76630 ) ( ON ?auto_76632 ?auto_76631 ) ( ON ?auto_76633 ?auto_76632 ) ( not ( = ?auto_76629 ?auto_76630 ) ) ( not ( = ?auto_76629 ?auto_76631 ) ) ( not ( = ?auto_76629 ?auto_76632 ) ) ( not ( = ?auto_76629 ?auto_76633 ) ) ( not ( = ?auto_76629 ?auto_76634 ) ) ( not ( = ?auto_76630 ?auto_76631 ) ) ( not ( = ?auto_76630 ?auto_76632 ) ) ( not ( = ?auto_76630 ?auto_76633 ) ) ( not ( = ?auto_76630 ?auto_76634 ) ) ( not ( = ?auto_76631 ?auto_76632 ) ) ( not ( = ?auto_76631 ?auto_76633 ) ) ( not ( = ?auto_76631 ?auto_76634 ) ) ( not ( = ?auto_76632 ?auto_76633 ) ) ( not ( = ?auto_76632 ?auto_76634 ) ) ( not ( = ?auto_76633 ?auto_76634 ) ) ( not ( = ?auto_76629 ?auto_76636 ) ) ( not ( = ?auto_76629 ?auto_76635 ) ) ( not ( = ?auto_76630 ?auto_76636 ) ) ( not ( = ?auto_76630 ?auto_76635 ) ) ( not ( = ?auto_76631 ?auto_76636 ) ) ( not ( = ?auto_76631 ?auto_76635 ) ) ( not ( = ?auto_76632 ?auto_76636 ) ) ( not ( = ?auto_76632 ?auto_76635 ) ) ( not ( = ?auto_76633 ?auto_76636 ) ) ( not ( = ?auto_76633 ?auto_76635 ) ) ( not ( = ?auto_76634 ?auto_76636 ) ) ( not ( = ?auto_76634 ?auto_76635 ) ) ( not ( = ?auto_76636 ?auto_76635 ) ) ( ON ?auto_76636 ?auto_76634 ) ( ON ?auto_76635 ?auto_76636 ) ( CLEAR ?auto_76635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76629 ?auto_76630 ?auto_76631 ?auto_76632 ?auto_76633 ?auto_76634 ?auto_76636 )
      ( MAKE-5PILE ?auto_76629 ?auto_76630 ?auto_76631 ?auto_76632 ?auto_76633 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76640 - BLOCK
      ?auto_76641 - BLOCK
      ?auto_76642 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76642 ) ( CLEAR ?auto_76641 ) ( ON-TABLE ?auto_76640 ) ( ON ?auto_76641 ?auto_76640 ) ( not ( = ?auto_76640 ?auto_76641 ) ) ( not ( = ?auto_76640 ?auto_76642 ) ) ( not ( = ?auto_76641 ?auto_76642 ) ) )
    :subtasks
    ( ( !STACK ?auto_76642 ?auto_76641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76643 - BLOCK
      ?auto_76644 - BLOCK
      ?auto_76645 - BLOCK
    )
    :vars
    (
      ?auto_76646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76644 ) ( ON-TABLE ?auto_76643 ) ( ON ?auto_76644 ?auto_76643 ) ( not ( = ?auto_76643 ?auto_76644 ) ) ( not ( = ?auto_76643 ?auto_76645 ) ) ( not ( = ?auto_76644 ?auto_76645 ) ) ( ON ?auto_76645 ?auto_76646 ) ( CLEAR ?auto_76645 ) ( HAND-EMPTY ) ( not ( = ?auto_76643 ?auto_76646 ) ) ( not ( = ?auto_76644 ?auto_76646 ) ) ( not ( = ?auto_76645 ?auto_76646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76645 ?auto_76646 )
      ( MAKE-3PILE ?auto_76643 ?auto_76644 ?auto_76645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76647 - BLOCK
      ?auto_76648 - BLOCK
      ?auto_76649 - BLOCK
    )
    :vars
    (
      ?auto_76650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76647 ) ( not ( = ?auto_76647 ?auto_76648 ) ) ( not ( = ?auto_76647 ?auto_76649 ) ) ( not ( = ?auto_76648 ?auto_76649 ) ) ( ON ?auto_76649 ?auto_76650 ) ( CLEAR ?auto_76649 ) ( not ( = ?auto_76647 ?auto_76650 ) ) ( not ( = ?auto_76648 ?auto_76650 ) ) ( not ( = ?auto_76649 ?auto_76650 ) ) ( HOLDING ?auto_76648 ) ( CLEAR ?auto_76647 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76647 ?auto_76648 )
      ( MAKE-3PILE ?auto_76647 ?auto_76648 ?auto_76649 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76651 - BLOCK
      ?auto_76652 - BLOCK
      ?auto_76653 - BLOCK
    )
    :vars
    (
      ?auto_76654 - BLOCK
      ?auto_76658 - BLOCK
      ?auto_76655 - BLOCK
      ?auto_76656 - BLOCK
      ?auto_76657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76651 ) ( not ( = ?auto_76651 ?auto_76652 ) ) ( not ( = ?auto_76651 ?auto_76653 ) ) ( not ( = ?auto_76652 ?auto_76653 ) ) ( ON ?auto_76653 ?auto_76654 ) ( not ( = ?auto_76651 ?auto_76654 ) ) ( not ( = ?auto_76652 ?auto_76654 ) ) ( not ( = ?auto_76653 ?auto_76654 ) ) ( CLEAR ?auto_76651 ) ( ON ?auto_76652 ?auto_76653 ) ( CLEAR ?auto_76652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76658 ) ( ON ?auto_76655 ?auto_76658 ) ( ON ?auto_76656 ?auto_76655 ) ( ON ?auto_76657 ?auto_76656 ) ( ON ?auto_76654 ?auto_76657 ) ( not ( = ?auto_76658 ?auto_76655 ) ) ( not ( = ?auto_76658 ?auto_76656 ) ) ( not ( = ?auto_76658 ?auto_76657 ) ) ( not ( = ?auto_76658 ?auto_76654 ) ) ( not ( = ?auto_76658 ?auto_76653 ) ) ( not ( = ?auto_76658 ?auto_76652 ) ) ( not ( = ?auto_76655 ?auto_76656 ) ) ( not ( = ?auto_76655 ?auto_76657 ) ) ( not ( = ?auto_76655 ?auto_76654 ) ) ( not ( = ?auto_76655 ?auto_76653 ) ) ( not ( = ?auto_76655 ?auto_76652 ) ) ( not ( = ?auto_76656 ?auto_76657 ) ) ( not ( = ?auto_76656 ?auto_76654 ) ) ( not ( = ?auto_76656 ?auto_76653 ) ) ( not ( = ?auto_76656 ?auto_76652 ) ) ( not ( = ?auto_76657 ?auto_76654 ) ) ( not ( = ?auto_76657 ?auto_76653 ) ) ( not ( = ?auto_76657 ?auto_76652 ) ) ( not ( = ?auto_76651 ?auto_76658 ) ) ( not ( = ?auto_76651 ?auto_76655 ) ) ( not ( = ?auto_76651 ?auto_76656 ) ) ( not ( = ?auto_76651 ?auto_76657 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76658 ?auto_76655 ?auto_76656 ?auto_76657 ?auto_76654 ?auto_76653 )
      ( MAKE-3PILE ?auto_76651 ?auto_76652 ?auto_76653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76659 - BLOCK
      ?auto_76660 - BLOCK
      ?auto_76661 - BLOCK
    )
    :vars
    (
      ?auto_76662 - BLOCK
      ?auto_76664 - BLOCK
      ?auto_76663 - BLOCK
      ?auto_76665 - BLOCK
      ?auto_76666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76659 ?auto_76660 ) ) ( not ( = ?auto_76659 ?auto_76661 ) ) ( not ( = ?auto_76660 ?auto_76661 ) ) ( ON ?auto_76661 ?auto_76662 ) ( not ( = ?auto_76659 ?auto_76662 ) ) ( not ( = ?auto_76660 ?auto_76662 ) ) ( not ( = ?auto_76661 ?auto_76662 ) ) ( ON ?auto_76660 ?auto_76661 ) ( CLEAR ?auto_76660 ) ( ON-TABLE ?auto_76664 ) ( ON ?auto_76663 ?auto_76664 ) ( ON ?auto_76665 ?auto_76663 ) ( ON ?auto_76666 ?auto_76665 ) ( ON ?auto_76662 ?auto_76666 ) ( not ( = ?auto_76664 ?auto_76663 ) ) ( not ( = ?auto_76664 ?auto_76665 ) ) ( not ( = ?auto_76664 ?auto_76666 ) ) ( not ( = ?auto_76664 ?auto_76662 ) ) ( not ( = ?auto_76664 ?auto_76661 ) ) ( not ( = ?auto_76664 ?auto_76660 ) ) ( not ( = ?auto_76663 ?auto_76665 ) ) ( not ( = ?auto_76663 ?auto_76666 ) ) ( not ( = ?auto_76663 ?auto_76662 ) ) ( not ( = ?auto_76663 ?auto_76661 ) ) ( not ( = ?auto_76663 ?auto_76660 ) ) ( not ( = ?auto_76665 ?auto_76666 ) ) ( not ( = ?auto_76665 ?auto_76662 ) ) ( not ( = ?auto_76665 ?auto_76661 ) ) ( not ( = ?auto_76665 ?auto_76660 ) ) ( not ( = ?auto_76666 ?auto_76662 ) ) ( not ( = ?auto_76666 ?auto_76661 ) ) ( not ( = ?auto_76666 ?auto_76660 ) ) ( not ( = ?auto_76659 ?auto_76664 ) ) ( not ( = ?auto_76659 ?auto_76663 ) ) ( not ( = ?auto_76659 ?auto_76665 ) ) ( not ( = ?auto_76659 ?auto_76666 ) ) ( HOLDING ?auto_76659 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76659 )
      ( MAKE-3PILE ?auto_76659 ?auto_76660 ?auto_76661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76667 - BLOCK
      ?auto_76668 - BLOCK
      ?auto_76669 - BLOCK
    )
    :vars
    (
      ?auto_76670 - BLOCK
      ?auto_76671 - BLOCK
      ?auto_76672 - BLOCK
      ?auto_76674 - BLOCK
      ?auto_76673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76667 ?auto_76668 ) ) ( not ( = ?auto_76667 ?auto_76669 ) ) ( not ( = ?auto_76668 ?auto_76669 ) ) ( ON ?auto_76669 ?auto_76670 ) ( not ( = ?auto_76667 ?auto_76670 ) ) ( not ( = ?auto_76668 ?auto_76670 ) ) ( not ( = ?auto_76669 ?auto_76670 ) ) ( ON ?auto_76668 ?auto_76669 ) ( ON-TABLE ?auto_76671 ) ( ON ?auto_76672 ?auto_76671 ) ( ON ?auto_76674 ?auto_76672 ) ( ON ?auto_76673 ?auto_76674 ) ( ON ?auto_76670 ?auto_76673 ) ( not ( = ?auto_76671 ?auto_76672 ) ) ( not ( = ?auto_76671 ?auto_76674 ) ) ( not ( = ?auto_76671 ?auto_76673 ) ) ( not ( = ?auto_76671 ?auto_76670 ) ) ( not ( = ?auto_76671 ?auto_76669 ) ) ( not ( = ?auto_76671 ?auto_76668 ) ) ( not ( = ?auto_76672 ?auto_76674 ) ) ( not ( = ?auto_76672 ?auto_76673 ) ) ( not ( = ?auto_76672 ?auto_76670 ) ) ( not ( = ?auto_76672 ?auto_76669 ) ) ( not ( = ?auto_76672 ?auto_76668 ) ) ( not ( = ?auto_76674 ?auto_76673 ) ) ( not ( = ?auto_76674 ?auto_76670 ) ) ( not ( = ?auto_76674 ?auto_76669 ) ) ( not ( = ?auto_76674 ?auto_76668 ) ) ( not ( = ?auto_76673 ?auto_76670 ) ) ( not ( = ?auto_76673 ?auto_76669 ) ) ( not ( = ?auto_76673 ?auto_76668 ) ) ( not ( = ?auto_76667 ?auto_76671 ) ) ( not ( = ?auto_76667 ?auto_76672 ) ) ( not ( = ?auto_76667 ?auto_76674 ) ) ( not ( = ?auto_76667 ?auto_76673 ) ) ( ON ?auto_76667 ?auto_76668 ) ( CLEAR ?auto_76667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76671 ?auto_76672 ?auto_76674 ?auto_76673 ?auto_76670 ?auto_76669 ?auto_76668 )
      ( MAKE-3PILE ?auto_76667 ?auto_76668 ?auto_76669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76679 - BLOCK
      ?auto_76680 - BLOCK
      ?auto_76681 - BLOCK
      ?auto_76682 - BLOCK
    )
    :vars
    (
      ?auto_76683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76683 ?auto_76682 ) ( CLEAR ?auto_76683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76679 ) ( ON ?auto_76680 ?auto_76679 ) ( ON ?auto_76681 ?auto_76680 ) ( ON ?auto_76682 ?auto_76681 ) ( not ( = ?auto_76679 ?auto_76680 ) ) ( not ( = ?auto_76679 ?auto_76681 ) ) ( not ( = ?auto_76679 ?auto_76682 ) ) ( not ( = ?auto_76679 ?auto_76683 ) ) ( not ( = ?auto_76680 ?auto_76681 ) ) ( not ( = ?auto_76680 ?auto_76682 ) ) ( not ( = ?auto_76680 ?auto_76683 ) ) ( not ( = ?auto_76681 ?auto_76682 ) ) ( not ( = ?auto_76681 ?auto_76683 ) ) ( not ( = ?auto_76682 ?auto_76683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76683 ?auto_76682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76684 - BLOCK
      ?auto_76685 - BLOCK
      ?auto_76686 - BLOCK
      ?auto_76687 - BLOCK
    )
    :vars
    (
      ?auto_76688 - BLOCK
      ?auto_76689 - BLOCK
      ?auto_76690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76688 ?auto_76687 ) ( CLEAR ?auto_76688 ) ( ON-TABLE ?auto_76684 ) ( ON ?auto_76685 ?auto_76684 ) ( ON ?auto_76686 ?auto_76685 ) ( ON ?auto_76687 ?auto_76686 ) ( not ( = ?auto_76684 ?auto_76685 ) ) ( not ( = ?auto_76684 ?auto_76686 ) ) ( not ( = ?auto_76684 ?auto_76687 ) ) ( not ( = ?auto_76684 ?auto_76688 ) ) ( not ( = ?auto_76685 ?auto_76686 ) ) ( not ( = ?auto_76685 ?auto_76687 ) ) ( not ( = ?auto_76685 ?auto_76688 ) ) ( not ( = ?auto_76686 ?auto_76687 ) ) ( not ( = ?auto_76686 ?auto_76688 ) ) ( not ( = ?auto_76687 ?auto_76688 ) ) ( HOLDING ?auto_76689 ) ( CLEAR ?auto_76690 ) ( not ( = ?auto_76684 ?auto_76689 ) ) ( not ( = ?auto_76684 ?auto_76690 ) ) ( not ( = ?auto_76685 ?auto_76689 ) ) ( not ( = ?auto_76685 ?auto_76690 ) ) ( not ( = ?auto_76686 ?auto_76689 ) ) ( not ( = ?auto_76686 ?auto_76690 ) ) ( not ( = ?auto_76687 ?auto_76689 ) ) ( not ( = ?auto_76687 ?auto_76690 ) ) ( not ( = ?auto_76688 ?auto_76689 ) ) ( not ( = ?auto_76688 ?auto_76690 ) ) ( not ( = ?auto_76689 ?auto_76690 ) ) )
    :subtasks
    ( ( !STACK ?auto_76689 ?auto_76690 )
      ( MAKE-4PILE ?auto_76684 ?auto_76685 ?auto_76686 ?auto_76687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76691 - BLOCK
      ?auto_76692 - BLOCK
      ?auto_76693 - BLOCK
      ?auto_76694 - BLOCK
    )
    :vars
    (
      ?auto_76695 - BLOCK
      ?auto_76697 - BLOCK
      ?auto_76696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76695 ?auto_76694 ) ( ON-TABLE ?auto_76691 ) ( ON ?auto_76692 ?auto_76691 ) ( ON ?auto_76693 ?auto_76692 ) ( ON ?auto_76694 ?auto_76693 ) ( not ( = ?auto_76691 ?auto_76692 ) ) ( not ( = ?auto_76691 ?auto_76693 ) ) ( not ( = ?auto_76691 ?auto_76694 ) ) ( not ( = ?auto_76691 ?auto_76695 ) ) ( not ( = ?auto_76692 ?auto_76693 ) ) ( not ( = ?auto_76692 ?auto_76694 ) ) ( not ( = ?auto_76692 ?auto_76695 ) ) ( not ( = ?auto_76693 ?auto_76694 ) ) ( not ( = ?auto_76693 ?auto_76695 ) ) ( not ( = ?auto_76694 ?auto_76695 ) ) ( CLEAR ?auto_76697 ) ( not ( = ?auto_76691 ?auto_76696 ) ) ( not ( = ?auto_76691 ?auto_76697 ) ) ( not ( = ?auto_76692 ?auto_76696 ) ) ( not ( = ?auto_76692 ?auto_76697 ) ) ( not ( = ?auto_76693 ?auto_76696 ) ) ( not ( = ?auto_76693 ?auto_76697 ) ) ( not ( = ?auto_76694 ?auto_76696 ) ) ( not ( = ?auto_76694 ?auto_76697 ) ) ( not ( = ?auto_76695 ?auto_76696 ) ) ( not ( = ?auto_76695 ?auto_76697 ) ) ( not ( = ?auto_76696 ?auto_76697 ) ) ( ON ?auto_76696 ?auto_76695 ) ( CLEAR ?auto_76696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76691 ?auto_76692 ?auto_76693 ?auto_76694 ?auto_76695 )
      ( MAKE-4PILE ?auto_76691 ?auto_76692 ?auto_76693 ?auto_76694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76698 - BLOCK
      ?auto_76699 - BLOCK
      ?auto_76700 - BLOCK
      ?auto_76701 - BLOCK
    )
    :vars
    (
      ?auto_76702 - BLOCK
      ?auto_76703 - BLOCK
      ?auto_76704 - BLOCK
      ?auto_76705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76702 ?auto_76701 ) ( ON-TABLE ?auto_76698 ) ( ON ?auto_76699 ?auto_76698 ) ( ON ?auto_76700 ?auto_76699 ) ( ON ?auto_76701 ?auto_76700 ) ( not ( = ?auto_76698 ?auto_76699 ) ) ( not ( = ?auto_76698 ?auto_76700 ) ) ( not ( = ?auto_76698 ?auto_76701 ) ) ( not ( = ?auto_76698 ?auto_76702 ) ) ( not ( = ?auto_76699 ?auto_76700 ) ) ( not ( = ?auto_76699 ?auto_76701 ) ) ( not ( = ?auto_76699 ?auto_76702 ) ) ( not ( = ?auto_76700 ?auto_76701 ) ) ( not ( = ?auto_76700 ?auto_76702 ) ) ( not ( = ?auto_76701 ?auto_76702 ) ) ( not ( = ?auto_76698 ?auto_76703 ) ) ( not ( = ?auto_76698 ?auto_76704 ) ) ( not ( = ?auto_76699 ?auto_76703 ) ) ( not ( = ?auto_76699 ?auto_76704 ) ) ( not ( = ?auto_76700 ?auto_76703 ) ) ( not ( = ?auto_76700 ?auto_76704 ) ) ( not ( = ?auto_76701 ?auto_76703 ) ) ( not ( = ?auto_76701 ?auto_76704 ) ) ( not ( = ?auto_76702 ?auto_76703 ) ) ( not ( = ?auto_76702 ?auto_76704 ) ) ( not ( = ?auto_76703 ?auto_76704 ) ) ( ON ?auto_76703 ?auto_76702 ) ( CLEAR ?auto_76703 ) ( HOLDING ?auto_76704 ) ( CLEAR ?auto_76705 ) ( ON-TABLE ?auto_76705 ) ( not ( = ?auto_76705 ?auto_76704 ) ) ( not ( = ?auto_76698 ?auto_76705 ) ) ( not ( = ?auto_76699 ?auto_76705 ) ) ( not ( = ?auto_76700 ?auto_76705 ) ) ( not ( = ?auto_76701 ?auto_76705 ) ) ( not ( = ?auto_76702 ?auto_76705 ) ) ( not ( = ?auto_76703 ?auto_76705 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76705 ?auto_76704 )
      ( MAKE-4PILE ?auto_76698 ?auto_76699 ?auto_76700 ?auto_76701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77760 - BLOCK
      ?auto_77761 - BLOCK
      ?auto_77762 - BLOCK
      ?auto_77763 - BLOCK
    )
    :vars
    (
      ?auto_77766 - BLOCK
      ?auto_77764 - BLOCK
      ?auto_77765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77766 ?auto_77763 ) ( ON-TABLE ?auto_77760 ) ( ON ?auto_77761 ?auto_77760 ) ( ON ?auto_77762 ?auto_77761 ) ( ON ?auto_77763 ?auto_77762 ) ( not ( = ?auto_77760 ?auto_77761 ) ) ( not ( = ?auto_77760 ?auto_77762 ) ) ( not ( = ?auto_77760 ?auto_77763 ) ) ( not ( = ?auto_77760 ?auto_77766 ) ) ( not ( = ?auto_77761 ?auto_77762 ) ) ( not ( = ?auto_77761 ?auto_77763 ) ) ( not ( = ?auto_77761 ?auto_77766 ) ) ( not ( = ?auto_77762 ?auto_77763 ) ) ( not ( = ?auto_77762 ?auto_77766 ) ) ( not ( = ?auto_77763 ?auto_77766 ) ) ( not ( = ?auto_77760 ?auto_77764 ) ) ( not ( = ?auto_77760 ?auto_77765 ) ) ( not ( = ?auto_77761 ?auto_77764 ) ) ( not ( = ?auto_77761 ?auto_77765 ) ) ( not ( = ?auto_77762 ?auto_77764 ) ) ( not ( = ?auto_77762 ?auto_77765 ) ) ( not ( = ?auto_77763 ?auto_77764 ) ) ( not ( = ?auto_77763 ?auto_77765 ) ) ( not ( = ?auto_77766 ?auto_77764 ) ) ( not ( = ?auto_77766 ?auto_77765 ) ) ( not ( = ?auto_77764 ?auto_77765 ) ) ( ON ?auto_77764 ?auto_77766 ) ( ON ?auto_77765 ?auto_77764 ) ( CLEAR ?auto_77765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77760 ?auto_77761 ?auto_77762 ?auto_77763 ?auto_77766 ?auto_77764 )
      ( MAKE-4PILE ?auto_77760 ?auto_77761 ?auto_77762 ?auto_77763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76714 - BLOCK
      ?auto_76715 - BLOCK
      ?auto_76716 - BLOCK
      ?auto_76717 - BLOCK
    )
    :vars
    (
      ?auto_76721 - BLOCK
      ?auto_76720 - BLOCK
      ?auto_76719 - BLOCK
      ?auto_76718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76721 ?auto_76717 ) ( ON-TABLE ?auto_76714 ) ( ON ?auto_76715 ?auto_76714 ) ( ON ?auto_76716 ?auto_76715 ) ( ON ?auto_76717 ?auto_76716 ) ( not ( = ?auto_76714 ?auto_76715 ) ) ( not ( = ?auto_76714 ?auto_76716 ) ) ( not ( = ?auto_76714 ?auto_76717 ) ) ( not ( = ?auto_76714 ?auto_76721 ) ) ( not ( = ?auto_76715 ?auto_76716 ) ) ( not ( = ?auto_76715 ?auto_76717 ) ) ( not ( = ?auto_76715 ?auto_76721 ) ) ( not ( = ?auto_76716 ?auto_76717 ) ) ( not ( = ?auto_76716 ?auto_76721 ) ) ( not ( = ?auto_76717 ?auto_76721 ) ) ( not ( = ?auto_76714 ?auto_76720 ) ) ( not ( = ?auto_76714 ?auto_76719 ) ) ( not ( = ?auto_76715 ?auto_76720 ) ) ( not ( = ?auto_76715 ?auto_76719 ) ) ( not ( = ?auto_76716 ?auto_76720 ) ) ( not ( = ?auto_76716 ?auto_76719 ) ) ( not ( = ?auto_76717 ?auto_76720 ) ) ( not ( = ?auto_76717 ?auto_76719 ) ) ( not ( = ?auto_76721 ?auto_76720 ) ) ( not ( = ?auto_76721 ?auto_76719 ) ) ( not ( = ?auto_76720 ?auto_76719 ) ) ( ON ?auto_76720 ?auto_76721 ) ( not ( = ?auto_76718 ?auto_76719 ) ) ( not ( = ?auto_76714 ?auto_76718 ) ) ( not ( = ?auto_76715 ?auto_76718 ) ) ( not ( = ?auto_76716 ?auto_76718 ) ) ( not ( = ?auto_76717 ?auto_76718 ) ) ( not ( = ?auto_76721 ?auto_76718 ) ) ( not ( = ?auto_76720 ?auto_76718 ) ) ( ON ?auto_76719 ?auto_76720 ) ( CLEAR ?auto_76719 ) ( HOLDING ?auto_76718 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76718 )
      ( MAKE-4PILE ?auto_76714 ?auto_76715 ?auto_76716 ?auto_76717 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76722 - BLOCK
      ?auto_76723 - BLOCK
      ?auto_76724 - BLOCK
      ?auto_76725 - BLOCK
    )
    :vars
    (
      ?auto_76727 - BLOCK
      ?auto_76729 - BLOCK
      ?auto_76726 - BLOCK
      ?auto_76728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76727 ?auto_76725 ) ( ON-TABLE ?auto_76722 ) ( ON ?auto_76723 ?auto_76722 ) ( ON ?auto_76724 ?auto_76723 ) ( ON ?auto_76725 ?auto_76724 ) ( not ( = ?auto_76722 ?auto_76723 ) ) ( not ( = ?auto_76722 ?auto_76724 ) ) ( not ( = ?auto_76722 ?auto_76725 ) ) ( not ( = ?auto_76722 ?auto_76727 ) ) ( not ( = ?auto_76723 ?auto_76724 ) ) ( not ( = ?auto_76723 ?auto_76725 ) ) ( not ( = ?auto_76723 ?auto_76727 ) ) ( not ( = ?auto_76724 ?auto_76725 ) ) ( not ( = ?auto_76724 ?auto_76727 ) ) ( not ( = ?auto_76725 ?auto_76727 ) ) ( not ( = ?auto_76722 ?auto_76729 ) ) ( not ( = ?auto_76722 ?auto_76726 ) ) ( not ( = ?auto_76723 ?auto_76729 ) ) ( not ( = ?auto_76723 ?auto_76726 ) ) ( not ( = ?auto_76724 ?auto_76729 ) ) ( not ( = ?auto_76724 ?auto_76726 ) ) ( not ( = ?auto_76725 ?auto_76729 ) ) ( not ( = ?auto_76725 ?auto_76726 ) ) ( not ( = ?auto_76727 ?auto_76729 ) ) ( not ( = ?auto_76727 ?auto_76726 ) ) ( not ( = ?auto_76729 ?auto_76726 ) ) ( ON ?auto_76729 ?auto_76727 ) ( not ( = ?auto_76728 ?auto_76726 ) ) ( not ( = ?auto_76722 ?auto_76728 ) ) ( not ( = ?auto_76723 ?auto_76728 ) ) ( not ( = ?auto_76724 ?auto_76728 ) ) ( not ( = ?auto_76725 ?auto_76728 ) ) ( not ( = ?auto_76727 ?auto_76728 ) ) ( not ( = ?auto_76729 ?auto_76728 ) ) ( ON ?auto_76726 ?auto_76729 ) ( ON ?auto_76728 ?auto_76726 ) ( CLEAR ?auto_76728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76722 ?auto_76723 ?auto_76724 ?auto_76725 ?auto_76727 ?auto_76729 ?auto_76726 )
      ( MAKE-4PILE ?auto_76722 ?auto_76723 ?auto_76724 ?auto_76725 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76734 - BLOCK
      ?auto_76735 - BLOCK
      ?auto_76736 - BLOCK
      ?auto_76737 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76737 ) ( CLEAR ?auto_76736 ) ( ON-TABLE ?auto_76734 ) ( ON ?auto_76735 ?auto_76734 ) ( ON ?auto_76736 ?auto_76735 ) ( not ( = ?auto_76734 ?auto_76735 ) ) ( not ( = ?auto_76734 ?auto_76736 ) ) ( not ( = ?auto_76734 ?auto_76737 ) ) ( not ( = ?auto_76735 ?auto_76736 ) ) ( not ( = ?auto_76735 ?auto_76737 ) ) ( not ( = ?auto_76736 ?auto_76737 ) ) )
    :subtasks
    ( ( !STACK ?auto_76737 ?auto_76736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76738 - BLOCK
      ?auto_76739 - BLOCK
      ?auto_76740 - BLOCK
      ?auto_76741 - BLOCK
    )
    :vars
    (
      ?auto_76742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76740 ) ( ON-TABLE ?auto_76738 ) ( ON ?auto_76739 ?auto_76738 ) ( ON ?auto_76740 ?auto_76739 ) ( not ( = ?auto_76738 ?auto_76739 ) ) ( not ( = ?auto_76738 ?auto_76740 ) ) ( not ( = ?auto_76738 ?auto_76741 ) ) ( not ( = ?auto_76739 ?auto_76740 ) ) ( not ( = ?auto_76739 ?auto_76741 ) ) ( not ( = ?auto_76740 ?auto_76741 ) ) ( ON ?auto_76741 ?auto_76742 ) ( CLEAR ?auto_76741 ) ( HAND-EMPTY ) ( not ( = ?auto_76738 ?auto_76742 ) ) ( not ( = ?auto_76739 ?auto_76742 ) ) ( not ( = ?auto_76740 ?auto_76742 ) ) ( not ( = ?auto_76741 ?auto_76742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76741 ?auto_76742 )
      ( MAKE-4PILE ?auto_76738 ?auto_76739 ?auto_76740 ?auto_76741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76743 - BLOCK
      ?auto_76744 - BLOCK
      ?auto_76745 - BLOCK
      ?auto_76746 - BLOCK
    )
    :vars
    (
      ?auto_76747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76743 ) ( ON ?auto_76744 ?auto_76743 ) ( not ( = ?auto_76743 ?auto_76744 ) ) ( not ( = ?auto_76743 ?auto_76745 ) ) ( not ( = ?auto_76743 ?auto_76746 ) ) ( not ( = ?auto_76744 ?auto_76745 ) ) ( not ( = ?auto_76744 ?auto_76746 ) ) ( not ( = ?auto_76745 ?auto_76746 ) ) ( ON ?auto_76746 ?auto_76747 ) ( CLEAR ?auto_76746 ) ( not ( = ?auto_76743 ?auto_76747 ) ) ( not ( = ?auto_76744 ?auto_76747 ) ) ( not ( = ?auto_76745 ?auto_76747 ) ) ( not ( = ?auto_76746 ?auto_76747 ) ) ( HOLDING ?auto_76745 ) ( CLEAR ?auto_76744 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76743 ?auto_76744 ?auto_76745 )
      ( MAKE-4PILE ?auto_76743 ?auto_76744 ?auto_76745 ?auto_76746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76748 - BLOCK
      ?auto_76749 - BLOCK
      ?auto_76750 - BLOCK
      ?auto_76751 - BLOCK
    )
    :vars
    (
      ?auto_76752 - BLOCK
      ?auto_76754 - BLOCK
      ?auto_76755 - BLOCK
      ?auto_76753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76748 ) ( ON ?auto_76749 ?auto_76748 ) ( not ( = ?auto_76748 ?auto_76749 ) ) ( not ( = ?auto_76748 ?auto_76750 ) ) ( not ( = ?auto_76748 ?auto_76751 ) ) ( not ( = ?auto_76749 ?auto_76750 ) ) ( not ( = ?auto_76749 ?auto_76751 ) ) ( not ( = ?auto_76750 ?auto_76751 ) ) ( ON ?auto_76751 ?auto_76752 ) ( not ( = ?auto_76748 ?auto_76752 ) ) ( not ( = ?auto_76749 ?auto_76752 ) ) ( not ( = ?auto_76750 ?auto_76752 ) ) ( not ( = ?auto_76751 ?auto_76752 ) ) ( CLEAR ?auto_76749 ) ( ON ?auto_76750 ?auto_76751 ) ( CLEAR ?auto_76750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76754 ) ( ON ?auto_76755 ?auto_76754 ) ( ON ?auto_76753 ?auto_76755 ) ( ON ?auto_76752 ?auto_76753 ) ( not ( = ?auto_76754 ?auto_76755 ) ) ( not ( = ?auto_76754 ?auto_76753 ) ) ( not ( = ?auto_76754 ?auto_76752 ) ) ( not ( = ?auto_76754 ?auto_76751 ) ) ( not ( = ?auto_76754 ?auto_76750 ) ) ( not ( = ?auto_76755 ?auto_76753 ) ) ( not ( = ?auto_76755 ?auto_76752 ) ) ( not ( = ?auto_76755 ?auto_76751 ) ) ( not ( = ?auto_76755 ?auto_76750 ) ) ( not ( = ?auto_76753 ?auto_76752 ) ) ( not ( = ?auto_76753 ?auto_76751 ) ) ( not ( = ?auto_76753 ?auto_76750 ) ) ( not ( = ?auto_76748 ?auto_76754 ) ) ( not ( = ?auto_76748 ?auto_76755 ) ) ( not ( = ?auto_76748 ?auto_76753 ) ) ( not ( = ?auto_76749 ?auto_76754 ) ) ( not ( = ?auto_76749 ?auto_76755 ) ) ( not ( = ?auto_76749 ?auto_76753 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76754 ?auto_76755 ?auto_76753 ?auto_76752 ?auto_76751 )
      ( MAKE-4PILE ?auto_76748 ?auto_76749 ?auto_76750 ?auto_76751 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76756 - BLOCK
      ?auto_76757 - BLOCK
      ?auto_76758 - BLOCK
      ?auto_76759 - BLOCK
    )
    :vars
    (
      ?auto_76763 - BLOCK
      ?auto_76762 - BLOCK
      ?auto_76761 - BLOCK
      ?auto_76760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76756 ) ( not ( = ?auto_76756 ?auto_76757 ) ) ( not ( = ?auto_76756 ?auto_76758 ) ) ( not ( = ?auto_76756 ?auto_76759 ) ) ( not ( = ?auto_76757 ?auto_76758 ) ) ( not ( = ?auto_76757 ?auto_76759 ) ) ( not ( = ?auto_76758 ?auto_76759 ) ) ( ON ?auto_76759 ?auto_76763 ) ( not ( = ?auto_76756 ?auto_76763 ) ) ( not ( = ?auto_76757 ?auto_76763 ) ) ( not ( = ?auto_76758 ?auto_76763 ) ) ( not ( = ?auto_76759 ?auto_76763 ) ) ( ON ?auto_76758 ?auto_76759 ) ( CLEAR ?auto_76758 ) ( ON-TABLE ?auto_76762 ) ( ON ?auto_76761 ?auto_76762 ) ( ON ?auto_76760 ?auto_76761 ) ( ON ?auto_76763 ?auto_76760 ) ( not ( = ?auto_76762 ?auto_76761 ) ) ( not ( = ?auto_76762 ?auto_76760 ) ) ( not ( = ?auto_76762 ?auto_76763 ) ) ( not ( = ?auto_76762 ?auto_76759 ) ) ( not ( = ?auto_76762 ?auto_76758 ) ) ( not ( = ?auto_76761 ?auto_76760 ) ) ( not ( = ?auto_76761 ?auto_76763 ) ) ( not ( = ?auto_76761 ?auto_76759 ) ) ( not ( = ?auto_76761 ?auto_76758 ) ) ( not ( = ?auto_76760 ?auto_76763 ) ) ( not ( = ?auto_76760 ?auto_76759 ) ) ( not ( = ?auto_76760 ?auto_76758 ) ) ( not ( = ?auto_76756 ?auto_76762 ) ) ( not ( = ?auto_76756 ?auto_76761 ) ) ( not ( = ?auto_76756 ?auto_76760 ) ) ( not ( = ?auto_76757 ?auto_76762 ) ) ( not ( = ?auto_76757 ?auto_76761 ) ) ( not ( = ?auto_76757 ?auto_76760 ) ) ( HOLDING ?auto_76757 ) ( CLEAR ?auto_76756 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76756 ?auto_76757 )
      ( MAKE-4PILE ?auto_76756 ?auto_76757 ?auto_76758 ?auto_76759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76764 - BLOCK
      ?auto_76765 - BLOCK
      ?auto_76766 - BLOCK
      ?auto_76767 - BLOCK
    )
    :vars
    (
      ?auto_76768 - BLOCK
      ?auto_76771 - BLOCK
      ?auto_76770 - BLOCK
      ?auto_76769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76764 ) ( not ( = ?auto_76764 ?auto_76765 ) ) ( not ( = ?auto_76764 ?auto_76766 ) ) ( not ( = ?auto_76764 ?auto_76767 ) ) ( not ( = ?auto_76765 ?auto_76766 ) ) ( not ( = ?auto_76765 ?auto_76767 ) ) ( not ( = ?auto_76766 ?auto_76767 ) ) ( ON ?auto_76767 ?auto_76768 ) ( not ( = ?auto_76764 ?auto_76768 ) ) ( not ( = ?auto_76765 ?auto_76768 ) ) ( not ( = ?auto_76766 ?auto_76768 ) ) ( not ( = ?auto_76767 ?auto_76768 ) ) ( ON ?auto_76766 ?auto_76767 ) ( ON-TABLE ?auto_76771 ) ( ON ?auto_76770 ?auto_76771 ) ( ON ?auto_76769 ?auto_76770 ) ( ON ?auto_76768 ?auto_76769 ) ( not ( = ?auto_76771 ?auto_76770 ) ) ( not ( = ?auto_76771 ?auto_76769 ) ) ( not ( = ?auto_76771 ?auto_76768 ) ) ( not ( = ?auto_76771 ?auto_76767 ) ) ( not ( = ?auto_76771 ?auto_76766 ) ) ( not ( = ?auto_76770 ?auto_76769 ) ) ( not ( = ?auto_76770 ?auto_76768 ) ) ( not ( = ?auto_76770 ?auto_76767 ) ) ( not ( = ?auto_76770 ?auto_76766 ) ) ( not ( = ?auto_76769 ?auto_76768 ) ) ( not ( = ?auto_76769 ?auto_76767 ) ) ( not ( = ?auto_76769 ?auto_76766 ) ) ( not ( = ?auto_76764 ?auto_76771 ) ) ( not ( = ?auto_76764 ?auto_76770 ) ) ( not ( = ?auto_76764 ?auto_76769 ) ) ( not ( = ?auto_76765 ?auto_76771 ) ) ( not ( = ?auto_76765 ?auto_76770 ) ) ( not ( = ?auto_76765 ?auto_76769 ) ) ( CLEAR ?auto_76764 ) ( ON ?auto_76765 ?auto_76766 ) ( CLEAR ?auto_76765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76771 ?auto_76770 ?auto_76769 ?auto_76768 ?auto_76767 ?auto_76766 )
      ( MAKE-4PILE ?auto_76764 ?auto_76765 ?auto_76766 ?auto_76767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76772 - BLOCK
      ?auto_76773 - BLOCK
      ?auto_76774 - BLOCK
      ?auto_76775 - BLOCK
    )
    :vars
    (
      ?auto_76778 - BLOCK
      ?auto_76777 - BLOCK
      ?auto_76776 - BLOCK
      ?auto_76779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76772 ?auto_76773 ) ) ( not ( = ?auto_76772 ?auto_76774 ) ) ( not ( = ?auto_76772 ?auto_76775 ) ) ( not ( = ?auto_76773 ?auto_76774 ) ) ( not ( = ?auto_76773 ?auto_76775 ) ) ( not ( = ?auto_76774 ?auto_76775 ) ) ( ON ?auto_76775 ?auto_76778 ) ( not ( = ?auto_76772 ?auto_76778 ) ) ( not ( = ?auto_76773 ?auto_76778 ) ) ( not ( = ?auto_76774 ?auto_76778 ) ) ( not ( = ?auto_76775 ?auto_76778 ) ) ( ON ?auto_76774 ?auto_76775 ) ( ON-TABLE ?auto_76777 ) ( ON ?auto_76776 ?auto_76777 ) ( ON ?auto_76779 ?auto_76776 ) ( ON ?auto_76778 ?auto_76779 ) ( not ( = ?auto_76777 ?auto_76776 ) ) ( not ( = ?auto_76777 ?auto_76779 ) ) ( not ( = ?auto_76777 ?auto_76778 ) ) ( not ( = ?auto_76777 ?auto_76775 ) ) ( not ( = ?auto_76777 ?auto_76774 ) ) ( not ( = ?auto_76776 ?auto_76779 ) ) ( not ( = ?auto_76776 ?auto_76778 ) ) ( not ( = ?auto_76776 ?auto_76775 ) ) ( not ( = ?auto_76776 ?auto_76774 ) ) ( not ( = ?auto_76779 ?auto_76778 ) ) ( not ( = ?auto_76779 ?auto_76775 ) ) ( not ( = ?auto_76779 ?auto_76774 ) ) ( not ( = ?auto_76772 ?auto_76777 ) ) ( not ( = ?auto_76772 ?auto_76776 ) ) ( not ( = ?auto_76772 ?auto_76779 ) ) ( not ( = ?auto_76773 ?auto_76777 ) ) ( not ( = ?auto_76773 ?auto_76776 ) ) ( not ( = ?auto_76773 ?auto_76779 ) ) ( ON ?auto_76773 ?auto_76774 ) ( CLEAR ?auto_76773 ) ( HOLDING ?auto_76772 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76772 )
      ( MAKE-4PILE ?auto_76772 ?auto_76773 ?auto_76774 ?auto_76775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76780 - BLOCK
      ?auto_76781 - BLOCK
      ?auto_76782 - BLOCK
      ?auto_76783 - BLOCK
    )
    :vars
    (
      ?auto_76784 - BLOCK
      ?auto_76787 - BLOCK
      ?auto_76786 - BLOCK
      ?auto_76785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76780 ?auto_76781 ) ) ( not ( = ?auto_76780 ?auto_76782 ) ) ( not ( = ?auto_76780 ?auto_76783 ) ) ( not ( = ?auto_76781 ?auto_76782 ) ) ( not ( = ?auto_76781 ?auto_76783 ) ) ( not ( = ?auto_76782 ?auto_76783 ) ) ( ON ?auto_76783 ?auto_76784 ) ( not ( = ?auto_76780 ?auto_76784 ) ) ( not ( = ?auto_76781 ?auto_76784 ) ) ( not ( = ?auto_76782 ?auto_76784 ) ) ( not ( = ?auto_76783 ?auto_76784 ) ) ( ON ?auto_76782 ?auto_76783 ) ( ON-TABLE ?auto_76787 ) ( ON ?auto_76786 ?auto_76787 ) ( ON ?auto_76785 ?auto_76786 ) ( ON ?auto_76784 ?auto_76785 ) ( not ( = ?auto_76787 ?auto_76786 ) ) ( not ( = ?auto_76787 ?auto_76785 ) ) ( not ( = ?auto_76787 ?auto_76784 ) ) ( not ( = ?auto_76787 ?auto_76783 ) ) ( not ( = ?auto_76787 ?auto_76782 ) ) ( not ( = ?auto_76786 ?auto_76785 ) ) ( not ( = ?auto_76786 ?auto_76784 ) ) ( not ( = ?auto_76786 ?auto_76783 ) ) ( not ( = ?auto_76786 ?auto_76782 ) ) ( not ( = ?auto_76785 ?auto_76784 ) ) ( not ( = ?auto_76785 ?auto_76783 ) ) ( not ( = ?auto_76785 ?auto_76782 ) ) ( not ( = ?auto_76780 ?auto_76787 ) ) ( not ( = ?auto_76780 ?auto_76786 ) ) ( not ( = ?auto_76780 ?auto_76785 ) ) ( not ( = ?auto_76781 ?auto_76787 ) ) ( not ( = ?auto_76781 ?auto_76786 ) ) ( not ( = ?auto_76781 ?auto_76785 ) ) ( ON ?auto_76781 ?auto_76782 ) ( ON ?auto_76780 ?auto_76781 ) ( CLEAR ?auto_76780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76787 ?auto_76786 ?auto_76785 ?auto_76784 ?auto_76783 ?auto_76782 ?auto_76781 )
      ( MAKE-4PILE ?auto_76780 ?auto_76781 ?auto_76782 ?auto_76783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76791 - BLOCK
      ?auto_76792 - BLOCK
      ?auto_76793 - BLOCK
    )
    :vars
    (
      ?auto_76794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76794 ?auto_76793 ) ( CLEAR ?auto_76794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76791 ) ( ON ?auto_76792 ?auto_76791 ) ( ON ?auto_76793 ?auto_76792 ) ( not ( = ?auto_76791 ?auto_76792 ) ) ( not ( = ?auto_76791 ?auto_76793 ) ) ( not ( = ?auto_76791 ?auto_76794 ) ) ( not ( = ?auto_76792 ?auto_76793 ) ) ( not ( = ?auto_76792 ?auto_76794 ) ) ( not ( = ?auto_76793 ?auto_76794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76794 ?auto_76793 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76795 - BLOCK
      ?auto_76796 - BLOCK
      ?auto_76797 - BLOCK
    )
    :vars
    (
      ?auto_76798 - BLOCK
      ?auto_76799 - BLOCK
      ?auto_76800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76798 ?auto_76797 ) ( CLEAR ?auto_76798 ) ( ON-TABLE ?auto_76795 ) ( ON ?auto_76796 ?auto_76795 ) ( ON ?auto_76797 ?auto_76796 ) ( not ( = ?auto_76795 ?auto_76796 ) ) ( not ( = ?auto_76795 ?auto_76797 ) ) ( not ( = ?auto_76795 ?auto_76798 ) ) ( not ( = ?auto_76796 ?auto_76797 ) ) ( not ( = ?auto_76796 ?auto_76798 ) ) ( not ( = ?auto_76797 ?auto_76798 ) ) ( HOLDING ?auto_76799 ) ( CLEAR ?auto_76800 ) ( not ( = ?auto_76795 ?auto_76799 ) ) ( not ( = ?auto_76795 ?auto_76800 ) ) ( not ( = ?auto_76796 ?auto_76799 ) ) ( not ( = ?auto_76796 ?auto_76800 ) ) ( not ( = ?auto_76797 ?auto_76799 ) ) ( not ( = ?auto_76797 ?auto_76800 ) ) ( not ( = ?auto_76798 ?auto_76799 ) ) ( not ( = ?auto_76798 ?auto_76800 ) ) ( not ( = ?auto_76799 ?auto_76800 ) ) )
    :subtasks
    ( ( !STACK ?auto_76799 ?auto_76800 )
      ( MAKE-3PILE ?auto_76795 ?auto_76796 ?auto_76797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76801 - BLOCK
      ?auto_76802 - BLOCK
      ?auto_76803 - BLOCK
    )
    :vars
    (
      ?auto_76806 - BLOCK
      ?auto_76804 - BLOCK
      ?auto_76805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76806 ?auto_76803 ) ( ON-TABLE ?auto_76801 ) ( ON ?auto_76802 ?auto_76801 ) ( ON ?auto_76803 ?auto_76802 ) ( not ( = ?auto_76801 ?auto_76802 ) ) ( not ( = ?auto_76801 ?auto_76803 ) ) ( not ( = ?auto_76801 ?auto_76806 ) ) ( not ( = ?auto_76802 ?auto_76803 ) ) ( not ( = ?auto_76802 ?auto_76806 ) ) ( not ( = ?auto_76803 ?auto_76806 ) ) ( CLEAR ?auto_76804 ) ( not ( = ?auto_76801 ?auto_76805 ) ) ( not ( = ?auto_76801 ?auto_76804 ) ) ( not ( = ?auto_76802 ?auto_76805 ) ) ( not ( = ?auto_76802 ?auto_76804 ) ) ( not ( = ?auto_76803 ?auto_76805 ) ) ( not ( = ?auto_76803 ?auto_76804 ) ) ( not ( = ?auto_76806 ?auto_76805 ) ) ( not ( = ?auto_76806 ?auto_76804 ) ) ( not ( = ?auto_76805 ?auto_76804 ) ) ( ON ?auto_76805 ?auto_76806 ) ( CLEAR ?auto_76805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76801 ?auto_76802 ?auto_76803 ?auto_76806 )
      ( MAKE-3PILE ?auto_76801 ?auto_76802 ?auto_76803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76807 - BLOCK
      ?auto_76808 - BLOCK
      ?auto_76809 - BLOCK
    )
    :vars
    (
      ?auto_76811 - BLOCK
      ?auto_76812 - BLOCK
      ?auto_76810 - BLOCK
      ?auto_76814 - BLOCK
      ?auto_76813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76811 ?auto_76809 ) ( ON-TABLE ?auto_76807 ) ( ON ?auto_76808 ?auto_76807 ) ( ON ?auto_76809 ?auto_76808 ) ( not ( = ?auto_76807 ?auto_76808 ) ) ( not ( = ?auto_76807 ?auto_76809 ) ) ( not ( = ?auto_76807 ?auto_76811 ) ) ( not ( = ?auto_76808 ?auto_76809 ) ) ( not ( = ?auto_76808 ?auto_76811 ) ) ( not ( = ?auto_76809 ?auto_76811 ) ) ( not ( = ?auto_76807 ?auto_76812 ) ) ( not ( = ?auto_76807 ?auto_76810 ) ) ( not ( = ?auto_76808 ?auto_76812 ) ) ( not ( = ?auto_76808 ?auto_76810 ) ) ( not ( = ?auto_76809 ?auto_76812 ) ) ( not ( = ?auto_76809 ?auto_76810 ) ) ( not ( = ?auto_76811 ?auto_76812 ) ) ( not ( = ?auto_76811 ?auto_76810 ) ) ( not ( = ?auto_76812 ?auto_76810 ) ) ( ON ?auto_76812 ?auto_76811 ) ( CLEAR ?auto_76812 ) ( HOLDING ?auto_76810 ) ( CLEAR ?auto_76814 ) ( ON-TABLE ?auto_76813 ) ( ON ?auto_76814 ?auto_76813 ) ( not ( = ?auto_76813 ?auto_76814 ) ) ( not ( = ?auto_76813 ?auto_76810 ) ) ( not ( = ?auto_76814 ?auto_76810 ) ) ( not ( = ?auto_76807 ?auto_76814 ) ) ( not ( = ?auto_76807 ?auto_76813 ) ) ( not ( = ?auto_76808 ?auto_76814 ) ) ( not ( = ?auto_76808 ?auto_76813 ) ) ( not ( = ?auto_76809 ?auto_76814 ) ) ( not ( = ?auto_76809 ?auto_76813 ) ) ( not ( = ?auto_76811 ?auto_76814 ) ) ( not ( = ?auto_76811 ?auto_76813 ) ) ( not ( = ?auto_76812 ?auto_76814 ) ) ( not ( = ?auto_76812 ?auto_76813 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76813 ?auto_76814 ?auto_76810 )
      ( MAKE-3PILE ?auto_76807 ?auto_76808 ?auto_76809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76815 - BLOCK
      ?auto_76816 - BLOCK
      ?auto_76817 - BLOCK
    )
    :vars
    (
      ?auto_76821 - BLOCK
      ?auto_76819 - BLOCK
      ?auto_76820 - BLOCK
      ?auto_76822 - BLOCK
      ?auto_76818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76821 ?auto_76817 ) ( ON-TABLE ?auto_76815 ) ( ON ?auto_76816 ?auto_76815 ) ( ON ?auto_76817 ?auto_76816 ) ( not ( = ?auto_76815 ?auto_76816 ) ) ( not ( = ?auto_76815 ?auto_76817 ) ) ( not ( = ?auto_76815 ?auto_76821 ) ) ( not ( = ?auto_76816 ?auto_76817 ) ) ( not ( = ?auto_76816 ?auto_76821 ) ) ( not ( = ?auto_76817 ?auto_76821 ) ) ( not ( = ?auto_76815 ?auto_76819 ) ) ( not ( = ?auto_76815 ?auto_76820 ) ) ( not ( = ?auto_76816 ?auto_76819 ) ) ( not ( = ?auto_76816 ?auto_76820 ) ) ( not ( = ?auto_76817 ?auto_76819 ) ) ( not ( = ?auto_76817 ?auto_76820 ) ) ( not ( = ?auto_76821 ?auto_76819 ) ) ( not ( = ?auto_76821 ?auto_76820 ) ) ( not ( = ?auto_76819 ?auto_76820 ) ) ( ON ?auto_76819 ?auto_76821 ) ( CLEAR ?auto_76822 ) ( ON-TABLE ?auto_76818 ) ( ON ?auto_76822 ?auto_76818 ) ( not ( = ?auto_76818 ?auto_76822 ) ) ( not ( = ?auto_76818 ?auto_76820 ) ) ( not ( = ?auto_76822 ?auto_76820 ) ) ( not ( = ?auto_76815 ?auto_76822 ) ) ( not ( = ?auto_76815 ?auto_76818 ) ) ( not ( = ?auto_76816 ?auto_76822 ) ) ( not ( = ?auto_76816 ?auto_76818 ) ) ( not ( = ?auto_76817 ?auto_76822 ) ) ( not ( = ?auto_76817 ?auto_76818 ) ) ( not ( = ?auto_76821 ?auto_76822 ) ) ( not ( = ?auto_76821 ?auto_76818 ) ) ( not ( = ?auto_76819 ?auto_76822 ) ) ( not ( = ?auto_76819 ?auto_76818 ) ) ( ON ?auto_76820 ?auto_76819 ) ( CLEAR ?auto_76820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76815 ?auto_76816 ?auto_76817 ?auto_76821 ?auto_76819 )
      ( MAKE-3PILE ?auto_76815 ?auto_76816 ?auto_76817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76823 - BLOCK
      ?auto_76824 - BLOCK
      ?auto_76825 - BLOCK
    )
    :vars
    (
      ?auto_76826 - BLOCK
      ?auto_76828 - BLOCK
      ?auto_76830 - BLOCK
      ?auto_76827 - BLOCK
      ?auto_76829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76826 ?auto_76825 ) ( ON-TABLE ?auto_76823 ) ( ON ?auto_76824 ?auto_76823 ) ( ON ?auto_76825 ?auto_76824 ) ( not ( = ?auto_76823 ?auto_76824 ) ) ( not ( = ?auto_76823 ?auto_76825 ) ) ( not ( = ?auto_76823 ?auto_76826 ) ) ( not ( = ?auto_76824 ?auto_76825 ) ) ( not ( = ?auto_76824 ?auto_76826 ) ) ( not ( = ?auto_76825 ?auto_76826 ) ) ( not ( = ?auto_76823 ?auto_76828 ) ) ( not ( = ?auto_76823 ?auto_76830 ) ) ( not ( = ?auto_76824 ?auto_76828 ) ) ( not ( = ?auto_76824 ?auto_76830 ) ) ( not ( = ?auto_76825 ?auto_76828 ) ) ( not ( = ?auto_76825 ?auto_76830 ) ) ( not ( = ?auto_76826 ?auto_76828 ) ) ( not ( = ?auto_76826 ?auto_76830 ) ) ( not ( = ?auto_76828 ?auto_76830 ) ) ( ON ?auto_76828 ?auto_76826 ) ( ON-TABLE ?auto_76827 ) ( not ( = ?auto_76827 ?auto_76829 ) ) ( not ( = ?auto_76827 ?auto_76830 ) ) ( not ( = ?auto_76829 ?auto_76830 ) ) ( not ( = ?auto_76823 ?auto_76829 ) ) ( not ( = ?auto_76823 ?auto_76827 ) ) ( not ( = ?auto_76824 ?auto_76829 ) ) ( not ( = ?auto_76824 ?auto_76827 ) ) ( not ( = ?auto_76825 ?auto_76829 ) ) ( not ( = ?auto_76825 ?auto_76827 ) ) ( not ( = ?auto_76826 ?auto_76829 ) ) ( not ( = ?auto_76826 ?auto_76827 ) ) ( not ( = ?auto_76828 ?auto_76829 ) ) ( not ( = ?auto_76828 ?auto_76827 ) ) ( ON ?auto_76830 ?auto_76828 ) ( CLEAR ?auto_76830 ) ( HOLDING ?auto_76829 ) ( CLEAR ?auto_76827 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76827 ?auto_76829 )
      ( MAKE-3PILE ?auto_76823 ?auto_76824 ?auto_76825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78008 - BLOCK
      ?auto_78009 - BLOCK
      ?auto_78010 - BLOCK
    )
    :vars
    (
      ?auto_78012 - BLOCK
      ?auto_78013 - BLOCK
      ?auto_78014 - BLOCK
      ?auto_78011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78012 ?auto_78010 ) ( ON-TABLE ?auto_78008 ) ( ON ?auto_78009 ?auto_78008 ) ( ON ?auto_78010 ?auto_78009 ) ( not ( = ?auto_78008 ?auto_78009 ) ) ( not ( = ?auto_78008 ?auto_78010 ) ) ( not ( = ?auto_78008 ?auto_78012 ) ) ( not ( = ?auto_78009 ?auto_78010 ) ) ( not ( = ?auto_78009 ?auto_78012 ) ) ( not ( = ?auto_78010 ?auto_78012 ) ) ( not ( = ?auto_78008 ?auto_78013 ) ) ( not ( = ?auto_78008 ?auto_78014 ) ) ( not ( = ?auto_78009 ?auto_78013 ) ) ( not ( = ?auto_78009 ?auto_78014 ) ) ( not ( = ?auto_78010 ?auto_78013 ) ) ( not ( = ?auto_78010 ?auto_78014 ) ) ( not ( = ?auto_78012 ?auto_78013 ) ) ( not ( = ?auto_78012 ?auto_78014 ) ) ( not ( = ?auto_78013 ?auto_78014 ) ) ( ON ?auto_78013 ?auto_78012 ) ( not ( = ?auto_78011 ?auto_78014 ) ) ( not ( = ?auto_78008 ?auto_78011 ) ) ( not ( = ?auto_78009 ?auto_78011 ) ) ( not ( = ?auto_78010 ?auto_78011 ) ) ( not ( = ?auto_78012 ?auto_78011 ) ) ( not ( = ?auto_78013 ?auto_78011 ) ) ( ON ?auto_78014 ?auto_78013 ) ( ON ?auto_78011 ?auto_78014 ) ( CLEAR ?auto_78011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78008 ?auto_78009 ?auto_78010 ?auto_78012 ?auto_78013 ?auto_78014 )
      ( MAKE-3PILE ?auto_78008 ?auto_78009 ?auto_78010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76839 - BLOCK
      ?auto_76840 - BLOCK
      ?auto_76841 - BLOCK
    )
    :vars
    (
      ?auto_76844 - BLOCK
      ?auto_76843 - BLOCK
      ?auto_76846 - BLOCK
      ?auto_76842 - BLOCK
      ?auto_76845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76844 ?auto_76841 ) ( ON-TABLE ?auto_76839 ) ( ON ?auto_76840 ?auto_76839 ) ( ON ?auto_76841 ?auto_76840 ) ( not ( = ?auto_76839 ?auto_76840 ) ) ( not ( = ?auto_76839 ?auto_76841 ) ) ( not ( = ?auto_76839 ?auto_76844 ) ) ( not ( = ?auto_76840 ?auto_76841 ) ) ( not ( = ?auto_76840 ?auto_76844 ) ) ( not ( = ?auto_76841 ?auto_76844 ) ) ( not ( = ?auto_76839 ?auto_76843 ) ) ( not ( = ?auto_76839 ?auto_76846 ) ) ( not ( = ?auto_76840 ?auto_76843 ) ) ( not ( = ?auto_76840 ?auto_76846 ) ) ( not ( = ?auto_76841 ?auto_76843 ) ) ( not ( = ?auto_76841 ?auto_76846 ) ) ( not ( = ?auto_76844 ?auto_76843 ) ) ( not ( = ?auto_76844 ?auto_76846 ) ) ( not ( = ?auto_76843 ?auto_76846 ) ) ( ON ?auto_76843 ?auto_76844 ) ( not ( = ?auto_76842 ?auto_76845 ) ) ( not ( = ?auto_76842 ?auto_76846 ) ) ( not ( = ?auto_76845 ?auto_76846 ) ) ( not ( = ?auto_76839 ?auto_76845 ) ) ( not ( = ?auto_76839 ?auto_76842 ) ) ( not ( = ?auto_76840 ?auto_76845 ) ) ( not ( = ?auto_76840 ?auto_76842 ) ) ( not ( = ?auto_76841 ?auto_76845 ) ) ( not ( = ?auto_76841 ?auto_76842 ) ) ( not ( = ?auto_76844 ?auto_76845 ) ) ( not ( = ?auto_76844 ?auto_76842 ) ) ( not ( = ?auto_76843 ?auto_76845 ) ) ( not ( = ?auto_76843 ?auto_76842 ) ) ( ON ?auto_76846 ?auto_76843 ) ( ON ?auto_76845 ?auto_76846 ) ( CLEAR ?auto_76845 ) ( HOLDING ?auto_76842 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76842 )
      ( MAKE-3PILE ?auto_76839 ?auto_76840 ?auto_76841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76847 - BLOCK
      ?auto_76848 - BLOCK
      ?auto_76849 - BLOCK
    )
    :vars
    (
      ?auto_76851 - BLOCK
      ?auto_76852 - BLOCK
      ?auto_76850 - BLOCK
      ?auto_76854 - BLOCK
      ?auto_76853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76851 ?auto_76849 ) ( ON-TABLE ?auto_76847 ) ( ON ?auto_76848 ?auto_76847 ) ( ON ?auto_76849 ?auto_76848 ) ( not ( = ?auto_76847 ?auto_76848 ) ) ( not ( = ?auto_76847 ?auto_76849 ) ) ( not ( = ?auto_76847 ?auto_76851 ) ) ( not ( = ?auto_76848 ?auto_76849 ) ) ( not ( = ?auto_76848 ?auto_76851 ) ) ( not ( = ?auto_76849 ?auto_76851 ) ) ( not ( = ?auto_76847 ?auto_76852 ) ) ( not ( = ?auto_76847 ?auto_76850 ) ) ( not ( = ?auto_76848 ?auto_76852 ) ) ( not ( = ?auto_76848 ?auto_76850 ) ) ( not ( = ?auto_76849 ?auto_76852 ) ) ( not ( = ?auto_76849 ?auto_76850 ) ) ( not ( = ?auto_76851 ?auto_76852 ) ) ( not ( = ?auto_76851 ?auto_76850 ) ) ( not ( = ?auto_76852 ?auto_76850 ) ) ( ON ?auto_76852 ?auto_76851 ) ( not ( = ?auto_76854 ?auto_76853 ) ) ( not ( = ?auto_76854 ?auto_76850 ) ) ( not ( = ?auto_76853 ?auto_76850 ) ) ( not ( = ?auto_76847 ?auto_76853 ) ) ( not ( = ?auto_76847 ?auto_76854 ) ) ( not ( = ?auto_76848 ?auto_76853 ) ) ( not ( = ?auto_76848 ?auto_76854 ) ) ( not ( = ?auto_76849 ?auto_76853 ) ) ( not ( = ?auto_76849 ?auto_76854 ) ) ( not ( = ?auto_76851 ?auto_76853 ) ) ( not ( = ?auto_76851 ?auto_76854 ) ) ( not ( = ?auto_76852 ?auto_76853 ) ) ( not ( = ?auto_76852 ?auto_76854 ) ) ( ON ?auto_76850 ?auto_76852 ) ( ON ?auto_76853 ?auto_76850 ) ( ON ?auto_76854 ?auto_76853 ) ( CLEAR ?auto_76854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76847 ?auto_76848 ?auto_76849 ?auto_76851 ?auto_76852 ?auto_76850 ?auto_76853 )
      ( MAKE-3PILE ?auto_76847 ?auto_76848 ?auto_76849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76860 - BLOCK
      ?auto_76861 - BLOCK
      ?auto_76862 - BLOCK
      ?auto_76863 - BLOCK
      ?auto_76864 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76864 ) ( CLEAR ?auto_76863 ) ( ON-TABLE ?auto_76860 ) ( ON ?auto_76861 ?auto_76860 ) ( ON ?auto_76862 ?auto_76861 ) ( ON ?auto_76863 ?auto_76862 ) ( not ( = ?auto_76860 ?auto_76861 ) ) ( not ( = ?auto_76860 ?auto_76862 ) ) ( not ( = ?auto_76860 ?auto_76863 ) ) ( not ( = ?auto_76860 ?auto_76864 ) ) ( not ( = ?auto_76861 ?auto_76862 ) ) ( not ( = ?auto_76861 ?auto_76863 ) ) ( not ( = ?auto_76861 ?auto_76864 ) ) ( not ( = ?auto_76862 ?auto_76863 ) ) ( not ( = ?auto_76862 ?auto_76864 ) ) ( not ( = ?auto_76863 ?auto_76864 ) ) )
    :subtasks
    ( ( !STACK ?auto_76864 ?auto_76863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76865 - BLOCK
      ?auto_76866 - BLOCK
      ?auto_76867 - BLOCK
      ?auto_76868 - BLOCK
      ?auto_76869 - BLOCK
    )
    :vars
    (
      ?auto_76870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76868 ) ( ON-TABLE ?auto_76865 ) ( ON ?auto_76866 ?auto_76865 ) ( ON ?auto_76867 ?auto_76866 ) ( ON ?auto_76868 ?auto_76867 ) ( not ( = ?auto_76865 ?auto_76866 ) ) ( not ( = ?auto_76865 ?auto_76867 ) ) ( not ( = ?auto_76865 ?auto_76868 ) ) ( not ( = ?auto_76865 ?auto_76869 ) ) ( not ( = ?auto_76866 ?auto_76867 ) ) ( not ( = ?auto_76866 ?auto_76868 ) ) ( not ( = ?auto_76866 ?auto_76869 ) ) ( not ( = ?auto_76867 ?auto_76868 ) ) ( not ( = ?auto_76867 ?auto_76869 ) ) ( not ( = ?auto_76868 ?auto_76869 ) ) ( ON ?auto_76869 ?auto_76870 ) ( CLEAR ?auto_76869 ) ( HAND-EMPTY ) ( not ( = ?auto_76865 ?auto_76870 ) ) ( not ( = ?auto_76866 ?auto_76870 ) ) ( not ( = ?auto_76867 ?auto_76870 ) ) ( not ( = ?auto_76868 ?auto_76870 ) ) ( not ( = ?auto_76869 ?auto_76870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76869 ?auto_76870 )
      ( MAKE-5PILE ?auto_76865 ?auto_76866 ?auto_76867 ?auto_76868 ?auto_76869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76871 - BLOCK
      ?auto_76872 - BLOCK
      ?auto_76873 - BLOCK
      ?auto_76874 - BLOCK
      ?auto_76875 - BLOCK
    )
    :vars
    (
      ?auto_76876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76871 ) ( ON ?auto_76872 ?auto_76871 ) ( ON ?auto_76873 ?auto_76872 ) ( not ( = ?auto_76871 ?auto_76872 ) ) ( not ( = ?auto_76871 ?auto_76873 ) ) ( not ( = ?auto_76871 ?auto_76874 ) ) ( not ( = ?auto_76871 ?auto_76875 ) ) ( not ( = ?auto_76872 ?auto_76873 ) ) ( not ( = ?auto_76872 ?auto_76874 ) ) ( not ( = ?auto_76872 ?auto_76875 ) ) ( not ( = ?auto_76873 ?auto_76874 ) ) ( not ( = ?auto_76873 ?auto_76875 ) ) ( not ( = ?auto_76874 ?auto_76875 ) ) ( ON ?auto_76875 ?auto_76876 ) ( CLEAR ?auto_76875 ) ( not ( = ?auto_76871 ?auto_76876 ) ) ( not ( = ?auto_76872 ?auto_76876 ) ) ( not ( = ?auto_76873 ?auto_76876 ) ) ( not ( = ?auto_76874 ?auto_76876 ) ) ( not ( = ?auto_76875 ?auto_76876 ) ) ( HOLDING ?auto_76874 ) ( CLEAR ?auto_76873 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76871 ?auto_76872 ?auto_76873 ?auto_76874 )
      ( MAKE-5PILE ?auto_76871 ?auto_76872 ?auto_76873 ?auto_76874 ?auto_76875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76877 - BLOCK
      ?auto_76878 - BLOCK
      ?auto_76879 - BLOCK
      ?auto_76880 - BLOCK
      ?auto_76881 - BLOCK
    )
    :vars
    (
      ?auto_76882 - BLOCK
      ?auto_76884 - BLOCK
      ?auto_76883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76877 ) ( ON ?auto_76878 ?auto_76877 ) ( ON ?auto_76879 ?auto_76878 ) ( not ( = ?auto_76877 ?auto_76878 ) ) ( not ( = ?auto_76877 ?auto_76879 ) ) ( not ( = ?auto_76877 ?auto_76880 ) ) ( not ( = ?auto_76877 ?auto_76881 ) ) ( not ( = ?auto_76878 ?auto_76879 ) ) ( not ( = ?auto_76878 ?auto_76880 ) ) ( not ( = ?auto_76878 ?auto_76881 ) ) ( not ( = ?auto_76879 ?auto_76880 ) ) ( not ( = ?auto_76879 ?auto_76881 ) ) ( not ( = ?auto_76880 ?auto_76881 ) ) ( ON ?auto_76881 ?auto_76882 ) ( not ( = ?auto_76877 ?auto_76882 ) ) ( not ( = ?auto_76878 ?auto_76882 ) ) ( not ( = ?auto_76879 ?auto_76882 ) ) ( not ( = ?auto_76880 ?auto_76882 ) ) ( not ( = ?auto_76881 ?auto_76882 ) ) ( CLEAR ?auto_76879 ) ( ON ?auto_76880 ?auto_76881 ) ( CLEAR ?auto_76880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76884 ) ( ON ?auto_76883 ?auto_76884 ) ( ON ?auto_76882 ?auto_76883 ) ( not ( = ?auto_76884 ?auto_76883 ) ) ( not ( = ?auto_76884 ?auto_76882 ) ) ( not ( = ?auto_76884 ?auto_76881 ) ) ( not ( = ?auto_76884 ?auto_76880 ) ) ( not ( = ?auto_76883 ?auto_76882 ) ) ( not ( = ?auto_76883 ?auto_76881 ) ) ( not ( = ?auto_76883 ?auto_76880 ) ) ( not ( = ?auto_76877 ?auto_76884 ) ) ( not ( = ?auto_76877 ?auto_76883 ) ) ( not ( = ?auto_76878 ?auto_76884 ) ) ( not ( = ?auto_76878 ?auto_76883 ) ) ( not ( = ?auto_76879 ?auto_76884 ) ) ( not ( = ?auto_76879 ?auto_76883 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76884 ?auto_76883 ?auto_76882 ?auto_76881 )
      ( MAKE-5PILE ?auto_76877 ?auto_76878 ?auto_76879 ?auto_76880 ?auto_76881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76885 - BLOCK
      ?auto_76886 - BLOCK
      ?auto_76887 - BLOCK
      ?auto_76888 - BLOCK
      ?auto_76889 - BLOCK
    )
    :vars
    (
      ?auto_76891 - BLOCK
      ?auto_76890 - BLOCK
      ?auto_76892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76885 ) ( ON ?auto_76886 ?auto_76885 ) ( not ( = ?auto_76885 ?auto_76886 ) ) ( not ( = ?auto_76885 ?auto_76887 ) ) ( not ( = ?auto_76885 ?auto_76888 ) ) ( not ( = ?auto_76885 ?auto_76889 ) ) ( not ( = ?auto_76886 ?auto_76887 ) ) ( not ( = ?auto_76886 ?auto_76888 ) ) ( not ( = ?auto_76886 ?auto_76889 ) ) ( not ( = ?auto_76887 ?auto_76888 ) ) ( not ( = ?auto_76887 ?auto_76889 ) ) ( not ( = ?auto_76888 ?auto_76889 ) ) ( ON ?auto_76889 ?auto_76891 ) ( not ( = ?auto_76885 ?auto_76891 ) ) ( not ( = ?auto_76886 ?auto_76891 ) ) ( not ( = ?auto_76887 ?auto_76891 ) ) ( not ( = ?auto_76888 ?auto_76891 ) ) ( not ( = ?auto_76889 ?auto_76891 ) ) ( ON ?auto_76888 ?auto_76889 ) ( CLEAR ?auto_76888 ) ( ON-TABLE ?auto_76890 ) ( ON ?auto_76892 ?auto_76890 ) ( ON ?auto_76891 ?auto_76892 ) ( not ( = ?auto_76890 ?auto_76892 ) ) ( not ( = ?auto_76890 ?auto_76891 ) ) ( not ( = ?auto_76890 ?auto_76889 ) ) ( not ( = ?auto_76890 ?auto_76888 ) ) ( not ( = ?auto_76892 ?auto_76891 ) ) ( not ( = ?auto_76892 ?auto_76889 ) ) ( not ( = ?auto_76892 ?auto_76888 ) ) ( not ( = ?auto_76885 ?auto_76890 ) ) ( not ( = ?auto_76885 ?auto_76892 ) ) ( not ( = ?auto_76886 ?auto_76890 ) ) ( not ( = ?auto_76886 ?auto_76892 ) ) ( not ( = ?auto_76887 ?auto_76890 ) ) ( not ( = ?auto_76887 ?auto_76892 ) ) ( HOLDING ?auto_76887 ) ( CLEAR ?auto_76886 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76885 ?auto_76886 ?auto_76887 )
      ( MAKE-5PILE ?auto_76885 ?auto_76886 ?auto_76887 ?auto_76888 ?auto_76889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76893 - BLOCK
      ?auto_76894 - BLOCK
      ?auto_76895 - BLOCK
      ?auto_76896 - BLOCK
      ?auto_76897 - BLOCK
    )
    :vars
    (
      ?auto_76898 - BLOCK
      ?auto_76900 - BLOCK
      ?auto_76899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76893 ) ( ON ?auto_76894 ?auto_76893 ) ( not ( = ?auto_76893 ?auto_76894 ) ) ( not ( = ?auto_76893 ?auto_76895 ) ) ( not ( = ?auto_76893 ?auto_76896 ) ) ( not ( = ?auto_76893 ?auto_76897 ) ) ( not ( = ?auto_76894 ?auto_76895 ) ) ( not ( = ?auto_76894 ?auto_76896 ) ) ( not ( = ?auto_76894 ?auto_76897 ) ) ( not ( = ?auto_76895 ?auto_76896 ) ) ( not ( = ?auto_76895 ?auto_76897 ) ) ( not ( = ?auto_76896 ?auto_76897 ) ) ( ON ?auto_76897 ?auto_76898 ) ( not ( = ?auto_76893 ?auto_76898 ) ) ( not ( = ?auto_76894 ?auto_76898 ) ) ( not ( = ?auto_76895 ?auto_76898 ) ) ( not ( = ?auto_76896 ?auto_76898 ) ) ( not ( = ?auto_76897 ?auto_76898 ) ) ( ON ?auto_76896 ?auto_76897 ) ( ON-TABLE ?auto_76900 ) ( ON ?auto_76899 ?auto_76900 ) ( ON ?auto_76898 ?auto_76899 ) ( not ( = ?auto_76900 ?auto_76899 ) ) ( not ( = ?auto_76900 ?auto_76898 ) ) ( not ( = ?auto_76900 ?auto_76897 ) ) ( not ( = ?auto_76900 ?auto_76896 ) ) ( not ( = ?auto_76899 ?auto_76898 ) ) ( not ( = ?auto_76899 ?auto_76897 ) ) ( not ( = ?auto_76899 ?auto_76896 ) ) ( not ( = ?auto_76893 ?auto_76900 ) ) ( not ( = ?auto_76893 ?auto_76899 ) ) ( not ( = ?auto_76894 ?auto_76900 ) ) ( not ( = ?auto_76894 ?auto_76899 ) ) ( not ( = ?auto_76895 ?auto_76900 ) ) ( not ( = ?auto_76895 ?auto_76899 ) ) ( CLEAR ?auto_76894 ) ( ON ?auto_76895 ?auto_76896 ) ( CLEAR ?auto_76895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76900 ?auto_76899 ?auto_76898 ?auto_76897 ?auto_76896 )
      ( MAKE-5PILE ?auto_76893 ?auto_76894 ?auto_76895 ?auto_76896 ?auto_76897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76901 - BLOCK
      ?auto_76902 - BLOCK
      ?auto_76903 - BLOCK
      ?auto_76904 - BLOCK
      ?auto_76905 - BLOCK
    )
    :vars
    (
      ?auto_76906 - BLOCK
      ?auto_76908 - BLOCK
      ?auto_76907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76901 ) ( not ( = ?auto_76901 ?auto_76902 ) ) ( not ( = ?auto_76901 ?auto_76903 ) ) ( not ( = ?auto_76901 ?auto_76904 ) ) ( not ( = ?auto_76901 ?auto_76905 ) ) ( not ( = ?auto_76902 ?auto_76903 ) ) ( not ( = ?auto_76902 ?auto_76904 ) ) ( not ( = ?auto_76902 ?auto_76905 ) ) ( not ( = ?auto_76903 ?auto_76904 ) ) ( not ( = ?auto_76903 ?auto_76905 ) ) ( not ( = ?auto_76904 ?auto_76905 ) ) ( ON ?auto_76905 ?auto_76906 ) ( not ( = ?auto_76901 ?auto_76906 ) ) ( not ( = ?auto_76902 ?auto_76906 ) ) ( not ( = ?auto_76903 ?auto_76906 ) ) ( not ( = ?auto_76904 ?auto_76906 ) ) ( not ( = ?auto_76905 ?auto_76906 ) ) ( ON ?auto_76904 ?auto_76905 ) ( ON-TABLE ?auto_76908 ) ( ON ?auto_76907 ?auto_76908 ) ( ON ?auto_76906 ?auto_76907 ) ( not ( = ?auto_76908 ?auto_76907 ) ) ( not ( = ?auto_76908 ?auto_76906 ) ) ( not ( = ?auto_76908 ?auto_76905 ) ) ( not ( = ?auto_76908 ?auto_76904 ) ) ( not ( = ?auto_76907 ?auto_76906 ) ) ( not ( = ?auto_76907 ?auto_76905 ) ) ( not ( = ?auto_76907 ?auto_76904 ) ) ( not ( = ?auto_76901 ?auto_76908 ) ) ( not ( = ?auto_76901 ?auto_76907 ) ) ( not ( = ?auto_76902 ?auto_76908 ) ) ( not ( = ?auto_76902 ?auto_76907 ) ) ( not ( = ?auto_76903 ?auto_76908 ) ) ( not ( = ?auto_76903 ?auto_76907 ) ) ( ON ?auto_76903 ?auto_76904 ) ( CLEAR ?auto_76903 ) ( HOLDING ?auto_76902 ) ( CLEAR ?auto_76901 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76901 ?auto_76902 )
      ( MAKE-5PILE ?auto_76901 ?auto_76902 ?auto_76903 ?auto_76904 ?auto_76905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76909 - BLOCK
      ?auto_76910 - BLOCK
      ?auto_76911 - BLOCK
      ?auto_76912 - BLOCK
      ?auto_76913 - BLOCK
    )
    :vars
    (
      ?auto_76916 - BLOCK
      ?auto_76914 - BLOCK
      ?auto_76915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76909 ) ( not ( = ?auto_76909 ?auto_76910 ) ) ( not ( = ?auto_76909 ?auto_76911 ) ) ( not ( = ?auto_76909 ?auto_76912 ) ) ( not ( = ?auto_76909 ?auto_76913 ) ) ( not ( = ?auto_76910 ?auto_76911 ) ) ( not ( = ?auto_76910 ?auto_76912 ) ) ( not ( = ?auto_76910 ?auto_76913 ) ) ( not ( = ?auto_76911 ?auto_76912 ) ) ( not ( = ?auto_76911 ?auto_76913 ) ) ( not ( = ?auto_76912 ?auto_76913 ) ) ( ON ?auto_76913 ?auto_76916 ) ( not ( = ?auto_76909 ?auto_76916 ) ) ( not ( = ?auto_76910 ?auto_76916 ) ) ( not ( = ?auto_76911 ?auto_76916 ) ) ( not ( = ?auto_76912 ?auto_76916 ) ) ( not ( = ?auto_76913 ?auto_76916 ) ) ( ON ?auto_76912 ?auto_76913 ) ( ON-TABLE ?auto_76914 ) ( ON ?auto_76915 ?auto_76914 ) ( ON ?auto_76916 ?auto_76915 ) ( not ( = ?auto_76914 ?auto_76915 ) ) ( not ( = ?auto_76914 ?auto_76916 ) ) ( not ( = ?auto_76914 ?auto_76913 ) ) ( not ( = ?auto_76914 ?auto_76912 ) ) ( not ( = ?auto_76915 ?auto_76916 ) ) ( not ( = ?auto_76915 ?auto_76913 ) ) ( not ( = ?auto_76915 ?auto_76912 ) ) ( not ( = ?auto_76909 ?auto_76914 ) ) ( not ( = ?auto_76909 ?auto_76915 ) ) ( not ( = ?auto_76910 ?auto_76914 ) ) ( not ( = ?auto_76910 ?auto_76915 ) ) ( not ( = ?auto_76911 ?auto_76914 ) ) ( not ( = ?auto_76911 ?auto_76915 ) ) ( ON ?auto_76911 ?auto_76912 ) ( CLEAR ?auto_76909 ) ( ON ?auto_76910 ?auto_76911 ) ( CLEAR ?auto_76910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76914 ?auto_76915 ?auto_76916 ?auto_76913 ?auto_76912 ?auto_76911 )
      ( MAKE-5PILE ?auto_76909 ?auto_76910 ?auto_76911 ?auto_76912 ?auto_76913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76917 - BLOCK
      ?auto_76918 - BLOCK
      ?auto_76919 - BLOCK
      ?auto_76920 - BLOCK
      ?auto_76921 - BLOCK
    )
    :vars
    (
      ?auto_76923 - BLOCK
      ?auto_76924 - BLOCK
      ?auto_76922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76917 ?auto_76918 ) ) ( not ( = ?auto_76917 ?auto_76919 ) ) ( not ( = ?auto_76917 ?auto_76920 ) ) ( not ( = ?auto_76917 ?auto_76921 ) ) ( not ( = ?auto_76918 ?auto_76919 ) ) ( not ( = ?auto_76918 ?auto_76920 ) ) ( not ( = ?auto_76918 ?auto_76921 ) ) ( not ( = ?auto_76919 ?auto_76920 ) ) ( not ( = ?auto_76919 ?auto_76921 ) ) ( not ( = ?auto_76920 ?auto_76921 ) ) ( ON ?auto_76921 ?auto_76923 ) ( not ( = ?auto_76917 ?auto_76923 ) ) ( not ( = ?auto_76918 ?auto_76923 ) ) ( not ( = ?auto_76919 ?auto_76923 ) ) ( not ( = ?auto_76920 ?auto_76923 ) ) ( not ( = ?auto_76921 ?auto_76923 ) ) ( ON ?auto_76920 ?auto_76921 ) ( ON-TABLE ?auto_76924 ) ( ON ?auto_76922 ?auto_76924 ) ( ON ?auto_76923 ?auto_76922 ) ( not ( = ?auto_76924 ?auto_76922 ) ) ( not ( = ?auto_76924 ?auto_76923 ) ) ( not ( = ?auto_76924 ?auto_76921 ) ) ( not ( = ?auto_76924 ?auto_76920 ) ) ( not ( = ?auto_76922 ?auto_76923 ) ) ( not ( = ?auto_76922 ?auto_76921 ) ) ( not ( = ?auto_76922 ?auto_76920 ) ) ( not ( = ?auto_76917 ?auto_76924 ) ) ( not ( = ?auto_76917 ?auto_76922 ) ) ( not ( = ?auto_76918 ?auto_76924 ) ) ( not ( = ?auto_76918 ?auto_76922 ) ) ( not ( = ?auto_76919 ?auto_76924 ) ) ( not ( = ?auto_76919 ?auto_76922 ) ) ( ON ?auto_76919 ?auto_76920 ) ( ON ?auto_76918 ?auto_76919 ) ( CLEAR ?auto_76918 ) ( HOLDING ?auto_76917 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76917 )
      ( MAKE-5PILE ?auto_76917 ?auto_76918 ?auto_76919 ?auto_76920 ?auto_76921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76925 - BLOCK
      ?auto_76926 - BLOCK
      ?auto_76927 - BLOCK
      ?auto_76928 - BLOCK
      ?auto_76929 - BLOCK
    )
    :vars
    (
      ?auto_76932 - BLOCK
      ?auto_76930 - BLOCK
      ?auto_76931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76925 ?auto_76926 ) ) ( not ( = ?auto_76925 ?auto_76927 ) ) ( not ( = ?auto_76925 ?auto_76928 ) ) ( not ( = ?auto_76925 ?auto_76929 ) ) ( not ( = ?auto_76926 ?auto_76927 ) ) ( not ( = ?auto_76926 ?auto_76928 ) ) ( not ( = ?auto_76926 ?auto_76929 ) ) ( not ( = ?auto_76927 ?auto_76928 ) ) ( not ( = ?auto_76927 ?auto_76929 ) ) ( not ( = ?auto_76928 ?auto_76929 ) ) ( ON ?auto_76929 ?auto_76932 ) ( not ( = ?auto_76925 ?auto_76932 ) ) ( not ( = ?auto_76926 ?auto_76932 ) ) ( not ( = ?auto_76927 ?auto_76932 ) ) ( not ( = ?auto_76928 ?auto_76932 ) ) ( not ( = ?auto_76929 ?auto_76932 ) ) ( ON ?auto_76928 ?auto_76929 ) ( ON-TABLE ?auto_76930 ) ( ON ?auto_76931 ?auto_76930 ) ( ON ?auto_76932 ?auto_76931 ) ( not ( = ?auto_76930 ?auto_76931 ) ) ( not ( = ?auto_76930 ?auto_76932 ) ) ( not ( = ?auto_76930 ?auto_76929 ) ) ( not ( = ?auto_76930 ?auto_76928 ) ) ( not ( = ?auto_76931 ?auto_76932 ) ) ( not ( = ?auto_76931 ?auto_76929 ) ) ( not ( = ?auto_76931 ?auto_76928 ) ) ( not ( = ?auto_76925 ?auto_76930 ) ) ( not ( = ?auto_76925 ?auto_76931 ) ) ( not ( = ?auto_76926 ?auto_76930 ) ) ( not ( = ?auto_76926 ?auto_76931 ) ) ( not ( = ?auto_76927 ?auto_76930 ) ) ( not ( = ?auto_76927 ?auto_76931 ) ) ( ON ?auto_76927 ?auto_76928 ) ( ON ?auto_76926 ?auto_76927 ) ( ON ?auto_76925 ?auto_76926 ) ( CLEAR ?auto_76925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76930 ?auto_76931 ?auto_76932 ?auto_76929 ?auto_76928 ?auto_76927 ?auto_76926 )
      ( MAKE-5PILE ?auto_76925 ?auto_76926 ?auto_76927 ?auto_76928 ?auto_76929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76935 - BLOCK
      ?auto_76936 - BLOCK
    )
    :vars
    (
      ?auto_76937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76937 ?auto_76936 ) ( CLEAR ?auto_76937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76935 ) ( ON ?auto_76936 ?auto_76935 ) ( not ( = ?auto_76935 ?auto_76936 ) ) ( not ( = ?auto_76935 ?auto_76937 ) ) ( not ( = ?auto_76936 ?auto_76937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76937 ?auto_76936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76938 - BLOCK
      ?auto_76939 - BLOCK
    )
    :vars
    (
      ?auto_76940 - BLOCK
      ?auto_76941 - BLOCK
      ?auto_76942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76940 ?auto_76939 ) ( CLEAR ?auto_76940 ) ( ON-TABLE ?auto_76938 ) ( ON ?auto_76939 ?auto_76938 ) ( not ( = ?auto_76938 ?auto_76939 ) ) ( not ( = ?auto_76938 ?auto_76940 ) ) ( not ( = ?auto_76939 ?auto_76940 ) ) ( HOLDING ?auto_76941 ) ( CLEAR ?auto_76942 ) ( not ( = ?auto_76938 ?auto_76941 ) ) ( not ( = ?auto_76938 ?auto_76942 ) ) ( not ( = ?auto_76939 ?auto_76941 ) ) ( not ( = ?auto_76939 ?auto_76942 ) ) ( not ( = ?auto_76940 ?auto_76941 ) ) ( not ( = ?auto_76940 ?auto_76942 ) ) ( not ( = ?auto_76941 ?auto_76942 ) ) )
    :subtasks
    ( ( !STACK ?auto_76941 ?auto_76942 )
      ( MAKE-2PILE ?auto_76938 ?auto_76939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76943 - BLOCK
      ?auto_76944 - BLOCK
    )
    :vars
    (
      ?auto_76945 - BLOCK
      ?auto_76946 - BLOCK
      ?auto_76947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76945 ?auto_76944 ) ( ON-TABLE ?auto_76943 ) ( ON ?auto_76944 ?auto_76943 ) ( not ( = ?auto_76943 ?auto_76944 ) ) ( not ( = ?auto_76943 ?auto_76945 ) ) ( not ( = ?auto_76944 ?auto_76945 ) ) ( CLEAR ?auto_76946 ) ( not ( = ?auto_76943 ?auto_76947 ) ) ( not ( = ?auto_76943 ?auto_76946 ) ) ( not ( = ?auto_76944 ?auto_76947 ) ) ( not ( = ?auto_76944 ?auto_76946 ) ) ( not ( = ?auto_76945 ?auto_76947 ) ) ( not ( = ?auto_76945 ?auto_76946 ) ) ( not ( = ?auto_76947 ?auto_76946 ) ) ( ON ?auto_76947 ?auto_76945 ) ( CLEAR ?auto_76947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76943 ?auto_76944 ?auto_76945 )
      ( MAKE-2PILE ?auto_76943 ?auto_76944 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76948 - BLOCK
      ?auto_76949 - BLOCK
    )
    :vars
    (
      ?auto_76952 - BLOCK
      ?auto_76951 - BLOCK
      ?auto_76950 - BLOCK
      ?auto_76954 - BLOCK
      ?auto_76955 - BLOCK
      ?auto_76953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76952 ?auto_76949 ) ( ON-TABLE ?auto_76948 ) ( ON ?auto_76949 ?auto_76948 ) ( not ( = ?auto_76948 ?auto_76949 ) ) ( not ( = ?auto_76948 ?auto_76952 ) ) ( not ( = ?auto_76949 ?auto_76952 ) ) ( not ( = ?auto_76948 ?auto_76951 ) ) ( not ( = ?auto_76948 ?auto_76950 ) ) ( not ( = ?auto_76949 ?auto_76951 ) ) ( not ( = ?auto_76949 ?auto_76950 ) ) ( not ( = ?auto_76952 ?auto_76951 ) ) ( not ( = ?auto_76952 ?auto_76950 ) ) ( not ( = ?auto_76951 ?auto_76950 ) ) ( ON ?auto_76951 ?auto_76952 ) ( CLEAR ?auto_76951 ) ( HOLDING ?auto_76950 ) ( CLEAR ?auto_76954 ) ( ON-TABLE ?auto_76955 ) ( ON ?auto_76953 ?auto_76955 ) ( ON ?auto_76954 ?auto_76953 ) ( not ( = ?auto_76955 ?auto_76953 ) ) ( not ( = ?auto_76955 ?auto_76954 ) ) ( not ( = ?auto_76955 ?auto_76950 ) ) ( not ( = ?auto_76953 ?auto_76954 ) ) ( not ( = ?auto_76953 ?auto_76950 ) ) ( not ( = ?auto_76954 ?auto_76950 ) ) ( not ( = ?auto_76948 ?auto_76954 ) ) ( not ( = ?auto_76948 ?auto_76955 ) ) ( not ( = ?auto_76948 ?auto_76953 ) ) ( not ( = ?auto_76949 ?auto_76954 ) ) ( not ( = ?auto_76949 ?auto_76955 ) ) ( not ( = ?auto_76949 ?auto_76953 ) ) ( not ( = ?auto_76952 ?auto_76954 ) ) ( not ( = ?auto_76952 ?auto_76955 ) ) ( not ( = ?auto_76952 ?auto_76953 ) ) ( not ( = ?auto_76951 ?auto_76954 ) ) ( not ( = ?auto_76951 ?auto_76955 ) ) ( not ( = ?auto_76951 ?auto_76953 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76955 ?auto_76953 ?auto_76954 ?auto_76950 )
      ( MAKE-2PILE ?auto_76948 ?auto_76949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76956 - BLOCK
      ?auto_76957 - BLOCK
    )
    :vars
    (
      ?auto_76961 - BLOCK
      ?auto_76959 - BLOCK
      ?auto_76963 - BLOCK
      ?auto_76962 - BLOCK
      ?auto_76960 - BLOCK
      ?auto_76958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76961 ?auto_76957 ) ( ON-TABLE ?auto_76956 ) ( ON ?auto_76957 ?auto_76956 ) ( not ( = ?auto_76956 ?auto_76957 ) ) ( not ( = ?auto_76956 ?auto_76961 ) ) ( not ( = ?auto_76957 ?auto_76961 ) ) ( not ( = ?auto_76956 ?auto_76959 ) ) ( not ( = ?auto_76956 ?auto_76963 ) ) ( not ( = ?auto_76957 ?auto_76959 ) ) ( not ( = ?auto_76957 ?auto_76963 ) ) ( not ( = ?auto_76961 ?auto_76959 ) ) ( not ( = ?auto_76961 ?auto_76963 ) ) ( not ( = ?auto_76959 ?auto_76963 ) ) ( ON ?auto_76959 ?auto_76961 ) ( CLEAR ?auto_76962 ) ( ON-TABLE ?auto_76960 ) ( ON ?auto_76958 ?auto_76960 ) ( ON ?auto_76962 ?auto_76958 ) ( not ( = ?auto_76960 ?auto_76958 ) ) ( not ( = ?auto_76960 ?auto_76962 ) ) ( not ( = ?auto_76960 ?auto_76963 ) ) ( not ( = ?auto_76958 ?auto_76962 ) ) ( not ( = ?auto_76958 ?auto_76963 ) ) ( not ( = ?auto_76962 ?auto_76963 ) ) ( not ( = ?auto_76956 ?auto_76962 ) ) ( not ( = ?auto_76956 ?auto_76960 ) ) ( not ( = ?auto_76956 ?auto_76958 ) ) ( not ( = ?auto_76957 ?auto_76962 ) ) ( not ( = ?auto_76957 ?auto_76960 ) ) ( not ( = ?auto_76957 ?auto_76958 ) ) ( not ( = ?auto_76961 ?auto_76962 ) ) ( not ( = ?auto_76961 ?auto_76960 ) ) ( not ( = ?auto_76961 ?auto_76958 ) ) ( not ( = ?auto_76959 ?auto_76962 ) ) ( not ( = ?auto_76959 ?auto_76960 ) ) ( not ( = ?auto_76959 ?auto_76958 ) ) ( ON ?auto_76963 ?auto_76959 ) ( CLEAR ?auto_76963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76956 ?auto_76957 ?auto_76961 ?auto_76959 )
      ( MAKE-2PILE ?auto_76956 ?auto_76957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76964 - BLOCK
      ?auto_76965 - BLOCK
    )
    :vars
    (
      ?auto_76966 - BLOCK
      ?auto_76969 - BLOCK
      ?auto_76968 - BLOCK
      ?auto_76970 - BLOCK
      ?auto_76971 - BLOCK
      ?auto_76967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76966 ?auto_76965 ) ( ON-TABLE ?auto_76964 ) ( ON ?auto_76965 ?auto_76964 ) ( not ( = ?auto_76964 ?auto_76965 ) ) ( not ( = ?auto_76964 ?auto_76966 ) ) ( not ( = ?auto_76965 ?auto_76966 ) ) ( not ( = ?auto_76964 ?auto_76969 ) ) ( not ( = ?auto_76964 ?auto_76968 ) ) ( not ( = ?auto_76965 ?auto_76969 ) ) ( not ( = ?auto_76965 ?auto_76968 ) ) ( not ( = ?auto_76966 ?auto_76969 ) ) ( not ( = ?auto_76966 ?auto_76968 ) ) ( not ( = ?auto_76969 ?auto_76968 ) ) ( ON ?auto_76969 ?auto_76966 ) ( ON-TABLE ?auto_76970 ) ( ON ?auto_76971 ?auto_76970 ) ( not ( = ?auto_76970 ?auto_76971 ) ) ( not ( = ?auto_76970 ?auto_76967 ) ) ( not ( = ?auto_76970 ?auto_76968 ) ) ( not ( = ?auto_76971 ?auto_76967 ) ) ( not ( = ?auto_76971 ?auto_76968 ) ) ( not ( = ?auto_76967 ?auto_76968 ) ) ( not ( = ?auto_76964 ?auto_76967 ) ) ( not ( = ?auto_76964 ?auto_76970 ) ) ( not ( = ?auto_76964 ?auto_76971 ) ) ( not ( = ?auto_76965 ?auto_76967 ) ) ( not ( = ?auto_76965 ?auto_76970 ) ) ( not ( = ?auto_76965 ?auto_76971 ) ) ( not ( = ?auto_76966 ?auto_76967 ) ) ( not ( = ?auto_76966 ?auto_76970 ) ) ( not ( = ?auto_76966 ?auto_76971 ) ) ( not ( = ?auto_76969 ?auto_76967 ) ) ( not ( = ?auto_76969 ?auto_76970 ) ) ( not ( = ?auto_76969 ?auto_76971 ) ) ( ON ?auto_76968 ?auto_76969 ) ( CLEAR ?auto_76968 ) ( HOLDING ?auto_76967 ) ( CLEAR ?auto_76971 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76970 ?auto_76971 ?auto_76967 )
      ( MAKE-2PILE ?auto_76964 ?auto_76965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76972 - BLOCK
      ?auto_76973 - BLOCK
    )
    :vars
    (
      ?auto_76977 - BLOCK
      ?auto_76976 - BLOCK
      ?auto_76979 - BLOCK
      ?auto_76978 - BLOCK
      ?auto_76974 - BLOCK
      ?auto_76975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76977 ?auto_76973 ) ( ON-TABLE ?auto_76972 ) ( ON ?auto_76973 ?auto_76972 ) ( not ( = ?auto_76972 ?auto_76973 ) ) ( not ( = ?auto_76972 ?auto_76977 ) ) ( not ( = ?auto_76973 ?auto_76977 ) ) ( not ( = ?auto_76972 ?auto_76976 ) ) ( not ( = ?auto_76972 ?auto_76979 ) ) ( not ( = ?auto_76973 ?auto_76976 ) ) ( not ( = ?auto_76973 ?auto_76979 ) ) ( not ( = ?auto_76977 ?auto_76976 ) ) ( not ( = ?auto_76977 ?auto_76979 ) ) ( not ( = ?auto_76976 ?auto_76979 ) ) ( ON ?auto_76976 ?auto_76977 ) ( ON-TABLE ?auto_76978 ) ( ON ?auto_76974 ?auto_76978 ) ( not ( = ?auto_76978 ?auto_76974 ) ) ( not ( = ?auto_76978 ?auto_76975 ) ) ( not ( = ?auto_76978 ?auto_76979 ) ) ( not ( = ?auto_76974 ?auto_76975 ) ) ( not ( = ?auto_76974 ?auto_76979 ) ) ( not ( = ?auto_76975 ?auto_76979 ) ) ( not ( = ?auto_76972 ?auto_76975 ) ) ( not ( = ?auto_76972 ?auto_76978 ) ) ( not ( = ?auto_76972 ?auto_76974 ) ) ( not ( = ?auto_76973 ?auto_76975 ) ) ( not ( = ?auto_76973 ?auto_76978 ) ) ( not ( = ?auto_76973 ?auto_76974 ) ) ( not ( = ?auto_76977 ?auto_76975 ) ) ( not ( = ?auto_76977 ?auto_76978 ) ) ( not ( = ?auto_76977 ?auto_76974 ) ) ( not ( = ?auto_76976 ?auto_76975 ) ) ( not ( = ?auto_76976 ?auto_76978 ) ) ( not ( = ?auto_76976 ?auto_76974 ) ) ( ON ?auto_76979 ?auto_76976 ) ( CLEAR ?auto_76974 ) ( ON ?auto_76975 ?auto_76979 ) ( CLEAR ?auto_76975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76972 ?auto_76973 ?auto_76977 ?auto_76976 ?auto_76979 )
      ( MAKE-2PILE ?auto_76972 ?auto_76973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76980 - BLOCK
      ?auto_76981 - BLOCK
    )
    :vars
    (
      ?auto_76985 - BLOCK
      ?auto_76984 - BLOCK
      ?auto_76983 - BLOCK
      ?auto_76987 - BLOCK
      ?auto_76982 - BLOCK
      ?auto_76986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76985 ?auto_76981 ) ( ON-TABLE ?auto_76980 ) ( ON ?auto_76981 ?auto_76980 ) ( not ( = ?auto_76980 ?auto_76981 ) ) ( not ( = ?auto_76980 ?auto_76985 ) ) ( not ( = ?auto_76981 ?auto_76985 ) ) ( not ( = ?auto_76980 ?auto_76984 ) ) ( not ( = ?auto_76980 ?auto_76983 ) ) ( not ( = ?auto_76981 ?auto_76984 ) ) ( not ( = ?auto_76981 ?auto_76983 ) ) ( not ( = ?auto_76985 ?auto_76984 ) ) ( not ( = ?auto_76985 ?auto_76983 ) ) ( not ( = ?auto_76984 ?auto_76983 ) ) ( ON ?auto_76984 ?auto_76985 ) ( ON-TABLE ?auto_76987 ) ( not ( = ?auto_76987 ?auto_76982 ) ) ( not ( = ?auto_76987 ?auto_76986 ) ) ( not ( = ?auto_76987 ?auto_76983 ) ) ( not ( = ?auto_76982 ?auto_76986 ) ) ( not ( = ?auto_76982 ?auto_76983 ) ) ( not ( = ?auto_76986 ?auto_76983 ) ) ( not ( = ?auto_76980 ?auto_76986 ) ) ( not ( = ?auto_76980 ?auto_76987 ) ) ( not ( = ?auto_76980 ?auto_76982 ) ) ( not ( = ?auto_76981 ?auto_76986 ) ) ( not ( = ?auto_76981 ?auto_76987 ) ) ( not ( = ?auto_76981 ?auto_76982 ) ) ( not ( = ?auto_76985 ?auto_76986 ) ) ( not ( = ?auto_76985 ?auto_76987 ) ) ( not ( = ?auto_76985 ?auto_76982 ) ) ( not ( = ?auto_76984 ?auto_76986 ) ) ( not ( = ?auto_76984 ?auto_76987 ) ) ( not ( = ?auto_76984 ?auto_76982 ) ) ( ON ?auto_76983 ?auto_76984 ) ( ON ?auto_76986 ?auto_76983 ) ( CLEAR ?auto_76986 ) ( HOLDING ?auto_76982 ) ( CLEAR ?auto_76987 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76987 ?auto_76982 )
      ( MAKE-2PILE ?auto_76980 ?auto_76981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78281 - BLOCK
      ?auto_78282 - BLOCK
    )
    :vars
    (
      ?auto_78287 - BLOCK
      ?auto_78286 - BLOCK
      ?auto_78284 - BLOCK
      ?auto_78285 - BLOCK
      ?auto_78283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78287 ?auto_78282 ) ( ON-TABLE ?auto_78281 ) ( ON ?auto_78282 ?auto_78281 ) ( not ( = ?auto_78281 ?auto_78282 ) ) ( not ( = ?auto_78281 ?auto_78287 ) ) ( not ( = ?auto_78282 ?auto_78287 ) ) ( not ( = ?auto_78281 ?auto_78286 ) ) ( not ( = ?auto_78281 ?auto_78284 ) ) ( not ( = ?auto_78282 ?auto_78286 ) ) ( not ( = ?auto_78282 ?auto_78284 ) ) ( not ( = ?auto_78287 ?auto_78286 ) ) ( not ( = ?auto_78287 ?auto_78284 ) ) ( not ( = ?auto_78286 ?auto_78284 ) ) ( ON ?auto_78286 ?auto_78287 ) ( not ( = ?auto_78285 ?auto_78283 ) ) ( not ( = ?auto_78285 ?auto_78284 ) ) ( not ( = ?auto_78283 ?auto_78284 ) ) ( not ( = ?auto_78281 ?auto_78283 ) ) ( not ( = ?auto_78281 ?auto_78285 ) ) ( not ( = ?auto_78282 ?auto_78283 ) ) ( not ( = ?auto_78282 ?auto_78285 ) ) ( not ( = ?auto_78287 ?auto_78283 ) ) ( not ( = ?auto_78287 ?auto_78285 ) ) ( not ( = ?auto_78286 ?auto_78283 ) ) ( not ( = ?auto_78286 ?auto_78285 ) ) ( ON ?auto_78284 ?auto_78286 ) ( ON ?auto_78283 ?auto_78284 ) ( ON ?auto_78285 ?auto_78283 ) ( CLEAR ?auto_78285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78281 ?auto_78282 ?auto_78287 ?auto_78286 ?auto_78284 ?auto_78283 )
      ( MAKE-2PILE ?auto_78281 ?auto_78282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76996 - BLOCK
      ?auto_76997 - BLOCK
    )
    :vars
    (
      ?auto_77001 - BLOCK
      ?auto_76998 - BLOCK
      ?auto_76999 - BLOCK
      ?auto_77002 - BLOCK
      ?auto_77000 - BLOCK
      ?auto_77003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77001 ?auto_76997 ) ( ON-TABLE ?auto_76996 ) ( ON ?auto_76997 ?auto_76996 ) ( not ( = ?auto_76996 ?auto_76997 ) ) ( not ( = ?auto_76996 ?auto_77001 ) ) ( not ( = ?auto_76997 ?auto_77001 ) ) ( not ( = ?auto_76996 ?auto_76998 ) ) ( not ( = ?auto_76996 ?auto_76999 ) ) ( not ( = ?auto_76997 ?auto_76998 ) ) ( not ( = ?auto_76997 ?auto_76999 ) ) ( not ( = ?auto_77001 ?auto_76998 ) ) ( not ( = ?auto_77001 ?auto_76999 ) ) ( not ( = ?auto_76998 ?auto_76999 ) ) ( ON ?auto_76998 ?auto_77001 ) ( not ( = ?auto_77002 ?auto_77000 ) ) ( not ( = ?auto_77002 ?auto_77003 ) ) ( not ( = ?auto_77002 ?auto_76999 ) ) ( not ( = ?auto_77000 ?auto_77003 ) ) ( not ( = ?auto_77000 ?auto_76999 ) ) ( not ( = ?auto_77003 ?auto_76999 ) ) ( not ( = ?auto_76996 ?auto_77003 ) ) ( not ( = ?auto_76996 ?auto_77002 ) ) ( not ( = ?auto_76996 ?auto_77000 ) ) ( not ( = ?auto_76997 ?auto_77003 ) ) ( not ( = ?auto_76997 ?auto_77002 ) ) ( not ( = ?auto_76997 ?auto_77000 ) ) ( not ( = ?auto_77001 ?auto_77003 ) ) ( not ( = ?auto_77001 ?auto_77002 ) ) ( not ( = ?auto_77001 ?auto_77000 ) ) ( not ( = ?auto_76998 ?auto_77003 ) ) ( not ( = ?auto_76998 ?auto_77002 ) ) ( not ( = ?auto_76998 ?auto_77000 ) ) ( ON ?auto_76999 ?auto_76998 ) ( ON ?auto_77003 ?auto_76999 ) ( ON ?auto_77000 ?auto_77003 ) ( CLEAR ?auto_77000 ) ( HOLDING ?auto_77002 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77002 )
      ( MAKE-2PILE ?auto_76996 ?auto_76997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77004 - BLOCK
      ?auto_77005 - BLOCK
    )
    :vars
    (
      ?auto_77008 - BLOCK
      ?auto_77007 - BLOCK
      ?auto_77006 - BLOCK
      ?auto_77011 - BLOCK
      ?auto_77010 - BLOCK
      ?auto_77009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77008 ?auto_77005 ) ( ON-TABLE ?auto_77004 ) ( ON ?auto_77005 ?auto_77004 ) ( not ( = ?auto_77004 ?auto_77005 ) ) ( not ( = ?auto_77004 ?auto_77008 ) ) ( not ( = ?auto_77005 ?auto_77008 ) ) ( not ( = ?auto_77004 ?auto_77007 ) ) ( not ( = ?auto_77004 ?auto_77006 ) ) ( not ( = ?auto_77005 ?auto_77007 ) ) ( not ( = ?auto_77005 ?auto_77006 ) ) ( not ( = ?auto_77008 ?auto_77007 ) ) ( not ( = ?auto_77008 ?auto_77006 ) ) ( not ( = ?auto_77007 ?auto_77006 ) ) ( ON ?auto_77007 ?auto_77008 ) ( not ( = ?auto_77011 ?auto_77010 ) ) ( not ( = ?auto_77011 ?auto_77009 ) ) ( not ( = ?auto_77011 ?auto_77006 ) ) ( not ( = ?auto_77010 ?auto_77009 ) ) ( not ( = ?auto_77010 ?auto_77006 ) ) ( not ( = ?auto_77009 ?auto_77006 ) ) ( not ( = ?auto_77004 ?auto_77009 ) ) ( not ( = ?auto_77004 ?auto_77011 ) ) ( not ( = ?auto_77004 ?auto_77010 ) ) ( not ( = ?auto_77005 ?auto_77009 ) ) ( not ( = ?auto_77005 ?auto_77011 ) ) ( not ( = ?auto_77005 ?auto_77010 ) ) ( not ( = ?auto_77008 ?auto_77009 ) ) ( not ( = ?auto_77008 ?auto_77011 ) ) ( not ( = ?auto_77008 ?auto_77010 ) ) ( not ( = ?auto_77007 ?auto_77009 ) ) ( not ( = ?auto_77007 ?auto_77011 ) ) ( not ( = ?auto_77007 ?auto_77010 ) ) ( ON ?auto_77006 ?auto_77007 ) ( ON ?auto_77009 ?auto_77006 ) ( ON ?auto_77010 ?auto_77009 ) ( ON ?auto_77011 ?auto_77010 ) ( CLEAR ?auto_77011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77004 ?auto_77005 ?auto_77008 ?auto_77007 ?auto_77006 ?auto_77009 ?auto_77010 )
      ( MAKE-2PILE ?auto_77004 ?auto_77005 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77018 - BLOCK
      ?auto_77019 - BLOCK
      ?auto_77020 - BLOCK
      ?auto_77021 - BLOCK
      ?auto_77022 - BLOCK
      ?auto_77023 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_77023 ) ( CLEAR ?auto_77022 ) ( ON-TABLE ?auto_77018 ) ( ON ?auto_77019 ?auto_77018 ) ( ON ?auto_77020 ?auto_77019 ) ( ON ?auto_77021 ?auto_77020 ) ( ON ?auto_77022 ?auto_77021 ) ( not ( = ?auto_77018 ?auto_77019 ) ) ( not ( = ?auto_77018 ?auto_77020 ) ) ( not ( = ?auto_77018 ?auto_77021 ) ) ( not ( = ?auto_77018 ?auto_77022 ) ) ( not ( = ?auto_77018 ?auto_77023 ) ) ( not ( = ?auto_77019 ?auto_77020 ) ) ( not ( = ?auto_77019 ?auto_77021 ) ) ( not ( = ?auto_77019 ?auto_77022 ) ) ( not ( = ?auto_77019 ?auto_77023 ) ) ( not ( = ?auto_77020 ?auto_77021 ) ) ( not ( = ?auto_77020 ?auto_77022 ) ) ( not ( = ?auto_77020 ?auto_77023 ) ) ( not ( = ?auto_77021 ?auto_77022 ) ) ( not ( = ?auto_77021 ?auto_77023 ) ) ( not ( = ?auto_77022 ?auto_77023 ) ) )
    :subtasks
    ( ( !STACK ?auto_77023 ?auto_77022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77024 - BLOCK
      ?auto_77025 - BLOCK
      ?auto_77026 - BLOCK
      ?auto_77027 - BLOCK
      ?auto_77028 - BLOCK
      ?auto_77029 - BLOCK
    )
    :vars
    (
      ?auto_77030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77028 ) ( ON-TABLE ?auto_77024 ) ( ON ?auto_77025 ?auto_77024 ) ( ON ?auto_77026 ?auto_77025 ) ( ON ?auto_77027 ?auto_77026 ) ( ON ?auto_77028 ?auto_77027 ) ( not ( = ?auto_77024 ?auto_77025 ) ) ( not ( = ?auto_77024 ?auto_77026 ) ) ( not ( = ?auto_77024 ?auto_77027 ) ) ( not ( = ?auto_77024 ?auto_77028 ) ) ( not ( = ?auto_77024 ?auto_77029 ) ) ( not ( = ?auto_77025 ?auto_77026 ) ) ( not ( = ?auto_77025 ?auto_77027 ) ) ( not ( = ?auto_77025 ?auto_77028 ) ) ( not ( = ?auto_77025 ?auto_77029 ) ) ( not ( = ?auto_77026 ?auto_77027 ) ) ( not ( = ?auto_77026 ?auto_77028 ) ) ( not ( = ?auto_77026 ?auto_77029 ) ) ( not ( = ?auto_77027 ?auto_77028 ) ) ( not ( = ?auto_77027 ?auto_77029 ) ) ( not ( = ?auto_77028 ?auto_77029 ) ) ( ON ?auto_77029 ?auto_77030 ) ( CLEAR ?auto_77029 ) ( HAND-EMPTY ) ( not ( = ?auto_77024 ?auto_77030 ) ) ( not ( = ?auto_77025 ?auto_77030 ) ) ( not ( = ?auto_77026 ?auto_77030 ) ) ( not ( = ?auto_77027 ?auto_77030 ) ) ( not ( = ?auto_77028 ?auto_77030 ) ) ( not ( = ?auto_77029 ?auto_77030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77029 ?auto_77030 )
      ( MAKE-6PILE ?auto_77024 ?auto_77025 ?auto_77026 ?auto_77027 ?auto_77028 ?auto_77029 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77031 - BLOCK
      ?auto_77032 - BLOCK
      ?auto_77033 - BLOCK
      ?auto_77034 - BLOCK
      ?auto_77035 - BLOCK
      ?auto_77036 - BLOCK
    )
    :vars
    (
      ?auto_77037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77031 ) ( ON ?auto_77032 ?auto_77031 ) ( ON ?auto_77033 ?auto_77032 ) ( ON ?auto_77034 ?auto_77033 ) ( not ( = ?auto_77031 ?auto_77032 ) ) ( not ( = ?auto_77031 ?auto_77033 ) ) ( not ( = ?auto_77031 ?auto_77034 ) ) ( not ( = ?auto_77031 ?auto_77035 ) ) ( not ( = ?auto_77031 ?auto_77036 ) ) ( not ( = ?auto_77032 ?auto_77033 ) ) ( not ( = ?auto_77032 ?auto_77034 ) ) ( not ( = ?auto_77032 ?auto_77035 ) ) ( not ( = ?auto_77032 ?auto_77036 ) ) ( not ( = ?auto_77033 ?auto_77034 ) ) ( not ( = ?auto_77033 ?auto_77035 ) ) ( not ( = ?auto_77033 ?auto_77036 ) ) ( not ( = ?auto_77034 ?auto_77035 ) ) ( not ( = ?auto_77034 ?auto_77036 ) ) ( not ( = ?auto_77035 ?auto_77036 ) ) ( ON ?auto_77036 ?auto_77037 ) ( CLEAR ?auto_77036 ) ( not ( = ?auto_77031 ?auto_77037 ) ) ( not ( = ?auto_77032 ?auto_77037 ) ) ( not ( = ?auto_77033 ?auto_77037 ) ) ( not ( = ?auto_77034 ?auto_77037 ) ) ( not ( = ?auto_77035 ?auto_77037 ) ) ( not ( = ?auto_77036 ?auto_77037 ) ) ( HOLDING ?auto_77035 ) ( CLEAR ?auto_77034 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77031 ?auto_77032 ?auto_77033 ?auto_77034 ?auto_77035 )
      ( MAKE-6PILE ?auto_77031 ?auto_77032 ?auto_77033 ?auto_77034 ?auto_77035 ?auto_77036 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77038 - BLOCK
      ?auto_77039 - BLOCK
      ?auto_77040 - BLOCK
      ?auto_77041 - BLOCK
      ?auto_77042 - BLOCK
      ?auto_77043 - BLOCK
    )
    :vars
    (
      ?auto_77044 - BLOCK
      ?auto_77045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77038 ) ( ON ?auto_77039 ?auto_77038 ) ( ON ?auto_77040 ?auto_77039 ) ( ON ?auto_77041 ?auto_77040 ) ( not ( = ?auto_77038 ?auto_77039 ) ) ( not ( = ?auto_77038 ?auto_77040 ) ) ( not ( = ?auto_77038 ?auto_77041 ) ) ( not ( = ?auto_77038 ?auto_77042 ) ) ( not ( = ?auto_77038 ?auto_77043 ) ) ( not ( = ?auto_77039 ?auto_77040 ) ) ( not ( = ?auto_77039 ?auto_77041 ) ) ( not ( = ?auto_77039 ?auto_77042 ) ) ( not ( = ?auto_77039 ?auto_77043 ) ) ( not ( = ?auto_77040 ?auto_77041 ) ) ( not ( = ?auto_77040 ?auto_77042 ) ) ( not ( = ?auto_77040 ?auto_77043 ) ) ( not ( = ?auto_77041 ?auto_77042 ) ) ( not ( = ?auto_77041 ?auto_77043 ) ) ( not ( = ?auto_77042 ?auto_77043 ) ) ( ON ?auto_77043 ?auto_77044 ) ( not ( = ?auto_77038 ?auto_77044 ) ) ( not ( = ?auto_77039 ?auto_77044 ) ) ( not ( = ?auto_77040 ?auto_77044 ) ) ( not ( = ?auto_77041 ?auto_77044 ) ) ( not ( = ?auto_77042 ?auto_77044 ) ) ( not ( = ?auto_77043 ?auto_77044 ) ) ( CLEAR ?auto_77041 ) ( ON ?auto_77042 ?auto_77043 ) ( CLEAR ?auto_77042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77045 ) ( ON ?auto_77044 ?auto_77045 ) ( not ( = ?auto_77045 ?auto_77044 ) ) ( not ( = ?auto_77045 ?auto_77043 ) ) ( not ( = ?auto_77045 ?auto_77042 ) ) ( not ( = ?auto_77038 ?auto_77045 ) ) ( not ( = ?auto_77039 ?auto_77045 ) ) ( not ( = ?auto_77040 ?auto_77045 ) ) ( not ( = ?auto_77041 ?auto_77045 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77045 ?auto_77044 ?auto_77043 )
      ( MAKE-6PILE ?auto_77038 ?auto_77039 ?auto_77040 ?auto_77041 ?auto_77042 ?auto_77043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77046 - BLOCK
      ?auto_77047 - BLOCK
      ?auto_77048 - BLOCK
      ?auto_77049 - BLOCK
      ?auto_77050 - BLOCK
      ?auto_77051 - BLOCK
    )
    :vars
    (
      ?auto_77052 - BLOCK
      ?auto_77053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77046 ) ( ON ?auto_77047 ?auto_77046 ) ( ON ?auto_77048 ?auto_77047 ) ( not ( = ?auto_77046 ?auto_77047 ) ) ( not ( = ?auto_77046 ?auto_77048 ) ) ( not ( = ?auto_77046 ?auto_77049 ) ) ( not ( = ?auto_77046 ?auto_77050 ) ) ( not ( = ?auto_77046 ?auto_77051 ) ) ( not ( = ?auto_77047 ?auto_77048 ) ) ( not ( = ?auto_77047 ?auto_77049 ) ) ( not ( = ?auto_77047 ?auto_77050 ) ) ( not ( = ?auto_77047 ?auto_77051 ) ) ( not ( = ?auto_77048 ?auto_77049 ) ) ( not ( = ?auto_77048 ?auto_77050 ) ) ( not ( = ?auto_77048 ?auto_77051 ) ) ( not ( = ?auto_77049 ?auto_77050 ) ) ( not ( = ?auto_77049 ?auto_77051 ) ) ( not ( = ?auto_77050 ?auto_77051 ) ) ( ON ?auto_77051 ?auto_77052 ) ( not ( = ?auto_77046 ?auto_77052 ) ) ( not ( = ?auto_77047 ?auto_77052 ) ) ( not ( = ?auto_77048 ?auto_77052 ) ) ( not ( = ?auto_77049 ?auto_77052 ) ) ( not ( = ?auto_77050 ?auto_77052 ) ) ( not ( = ?auto_77051 ?auto_77052 ) ) ( ON ?auto_77050 ?auto_77051 ) ( CLEAR ?auto_77050 ) ( ON-TABLE ?auto_77053 ) ( ON ?auto_77052 ?auto_77053 ) ( not ( = ?auto_77053 ?auto_77052 ) ) ( not ( = ?auto_77053 ?auto_77051 ) ) ( not ( = ?auto_77053 ?auto_77050 ) ) ( not ( = ?auto_77046 ?auto_77053 ) ) ( not ( = ?auto_77047 ?auto_77053 ) ) ( not ( = ?auto_77048 ?auto_77053 ) ) ( not ( = ?auto_77049 ?auto_77053 ) ) ( HOLDING ?auto_77049 ) ( CLEAR ?auto_77048 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77046 ?auto_77047 ?auto_77048 ?auto_77049 )
      ( MAKE-6PILE ?auto_77046 ?auto_77047 ?auto_77048 ?auto_77049 ?auto_77050 ?auto_77051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77054 - BLOCK
      ?auto_77055 - BLOCK
      ?auto_77056 - BLOCK
      ?auto_77057 - BLOCK
      ?auto_77058 - BLOCK
      ?auto_77059 - BLOCK
    )
    :vars
    (
      ?auto_77060 - BLOCK
      ?auto_77061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77054 ) ( ON ?auto_77055 ?auto_77054 ) ( ON ?auto_77056 ?auto_77055 ) ( not ( = ?auto_77054 ?auto_77055 ) ) ( not ( = ?auto_77054 ?auto_77056 ) ) ( not ( = ?auto_77054 ?auto_77057 ) ) ( not ( = ?auto_77054 ?auto_77058 ) ) ( not ( = ?auto_77054 ?auto_77059 ) ) ( not ( = ?auto_77055 ?auto_77056 ) ) ( not ( = ?auto_77055 ?auto_77057 ) ) ( not ( = ?auto_77055 ?auto_77058 ) ) ( not ( = ?auto_77055 ?auto_77059 ) ) ( not ( = ?auto_77056 ?auto_77057 ) ) ( not ( = ?auto_77056 ?auto_77058 ) ) ( not ( = ?auto_77056 ?auto_77059 ) ) ( not ( = ?auto_77057 ?auto_77058 ) ) ( not ( = ?auto_77057 ?auto_77059 ) ) ( not ( = ?auto_77058 ?auto_77059 ) ) ( ON ?auto_77059 ?auto_77060 ) ( not ( = ?auto_77054 ?auto_77060 ) ) ( not ( = ?auto_77055 ?auto_77060 ) ) ( not ( = ?auto_77056 ?auto_77060 ) ) ( not ( = ?auto_77057 ?auto_77060 ) ) ( not ( = ?auto_77058 ?auto_77060 ) ) ( not ( = ?auto_77059 ?auto_77060 ) ) ( ON ?auto_77058 ?auto_77059 ) ( ON-TABLE ?auto_77061 ) ( ON ?auto_77060 ?auto_77061 ) ( not ( = ?auto_77061 ?auto_77060 ) ) ( not ( = ?auto_77061 ?auto_77059 ) ) ( not ( = ?auto_77061 ?auto_77058 ) ) ( not ( = ?auto_77054 ?auto_77061 ) ) ( not ( = ?auto_77055 ?auto_77061 ) ) ( not ( = ?auto_77056 ?auto_77061 ) ) ( not ( = ?auto_77057 ?auto_77061 ) ) ( CLEAR ?auto_77056 ) ( ON ?auto_77057 ?auto_77058 ) ( CLEAR ?auto_77057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77061 ?auto_77060 ?auto_77059 ?auto_77058 )
      ( MAKE-6PILE ?auto_77054 ?auto_77055 ?auto_77056 ?auto_77057 ?auto_77058 ?auto_77059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77062 - BLOCK
      ?auto_77063 - BLOCK
      ?auto_77064 - BLOCK
      ?auto_77065 - BLOCK
      ?auto_77066 - BLOCK
      ?auto_77067 - BLOCK
    )
    :vars
    (
      ?auto_77068 - BLOCK
      ?auto_77069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77062 ) ( ON ?auto_77063 ?auto_77062 ) ( not ( = ?auto_77062 ?auto_77063 ) ) ( not ( = ?auto_77062 ?auto_77064 ) ) ( not ( = ?auto_77062 ?auto_77065 ) ) ( not ( = ?auto_77062 ?auto_77066 ) ) ( not ( = ?auto_77062 ?auto_77067 ) ) ( not ( = ?auto_77063 ?auto_77064 ) ) ( not ( = ?auto_77063 ?auto_77065 ) ) ( not ( = ?auto_77063 ?auto_77066 ) ) ( not ( = ?auto_77063 ?auto_77067 ) ) ( not ( = ?auto_77064 ?auto_77065 ) ) ( not ( = ?auto_77064 ?auto_77066 ) ) ( not ( = ?auto_77064 ?auto_77067 ) ) ( not ( = ?auto_77065 ?auto_77066 ) ) ( not ( = ?auto_77065 ?auto_77067 ) ) ( not ( = ?auto_77066 ?auto_77067 ) ) ( ON ?auto_77067 ?auto_77068 ) ( not ( = ?auto_77062 ?auto_77068 ) ) ( not ( = ?auto_77063 ?auto_77068 ) ) ( not ( = ?auto_77064 ?auto_77068 ) ) ( not ( = ?auto_77065 ?auto_77068 ) ) ( not ( = ?auto_77066 ?auto_77068 ) ) ( not ( = ?auto_77067 ?auto_77068 ) ) ( ON ?auto_77066 ?auto_77067 ) ( ON-TABLE ?auto_77069 ) ( ON ?auto_77068 ?auto_77069 ) ( not ( = ?auto_77069 ?auto_77068 ) ) ( not ( = ?auto_77069 ?auto_77067 ) ) ( not ( = ?auto_77069 ?auto_77066 ) ) ( not ( = ?auto_77062 ?auto_77069 ) ) ( not ( = ?auto_77063 ?auto_77069 ) ) ( not ( = ?auto_77064 ?auto_77069 ) ) ( not ( = ?auto_77065 ?auto_77069 ) ) ( ON ?auto_77065 ?auto_77066 ) ( CLEAR ?auto_77065 ) ( HOLDING ?auto_77064 ) ( CLEAR ?auto_77063 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77062 ?auto_77063 ?auto_77064 )
      ( MAKE-6PILE ?auto_77062 ?auto_77063 ?auto_77064 ?auto_77065 ?auto_77066 ?auto_77067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77070 - BLOCK
      ?auto_77071 - BLOCK
      ?auto_77072 - BLOCK
      ?auto_77073 - BLOCK
      ?auto_77074 - BLOCK
      ?auto_77075 - BLOCK
    )
    :vars
    (
      ?auto_77077 - BLOCK
      ?auto_77076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77070 ) ( ON ?auto_77071 ?auto_77070 ) ( not ( = ?auto_77070 ?auto_77071 ) ) ( not ( = ?auto_77070 ?auto_77072 ) ) ( not ( = ?auto_77070 ?auto_77073 ) ) ( not ( = ?auto_77070 ?auto_77074 ) ) ( not ( = ?auto_77070 ?auto_77075 ) ) ( not ( = ?auto_77071 ?auto_77072 ) ) ( not ( = ?auto_77071 ?auto_77073 ) ) ( not ( = ?auto_77071 ?auto_77074 ) ) ( not ( = ?auto_77071 ?auto_77075 ) ) ( not ( = ?auto_77072 ?auto_77073 ) ) ( not ( = ?auto_77072 ?auto_77074 ) ) ( not ( = ?auto_77072 ?auto_77075 ) ) ( not ( = ?auto_77073 ?auto_77074 ) ) ( not ( = ?auto_77073 ?auto_77075 ) ) ( not ( = ?auto_77074 ?auto_77075 ) ) ( ON ?auto_77075 ?auto_77077 ) ( not ( = ?auto_77070 ?auto_77077 ) ) ( not ( = ?auto_77071 ?auto_77077 ) ) ( not ( = ?auto_77072 ?auto_77077 ) ) ( not ( = ?auto_77073 ?auto_77077 ) ) ( not ( = ?auto_77074 ?auto_77077 ) ) ( not ( = ?auto_77075 ?auto_77077 ) ) ( ON ?auto_77074 ?auto_77075 ) ( ON-TABLE ?auto_77076 ) ( ON ?auto_77077 ?auto_77076 ) ( not ( = ?auto_77076 ?auto_77077 ) ) ( not ( = ?auto_77076 ?auto_77075 ) ) ( not ( = ?auto_77076 ?auto_77074 ) ) ( not ( = ?auto_77070 ?auto_77076 ) ) ( not ( = ?auto_77071 ?auto_77076 ) ) ( not ( = ?auto_77072 ?auto_77076 ) ) ( not ( = ?auto_77073 ?auto_77076 ) ) ( ON ?auto_77073 ?auto_77074 ) ( CLEAR ?auto_77071 ) ( ON ?auto_77072 ?auto_77073 ) ( CLEAR ?auto_77072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77076 ?auto_77077 ?auto_77075 ?auto_77074 ?auto_77073 )
      ( MAKE-6PILE ?auto_77070 ?auto_77071 ?auto_77072 ?auto_77073 ?auto_77074 ?auto_77075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77078 - BLOCK
      ?auto_77079 - BLOCK
      ?auto_77080 - BLOCK
      ?auto_77081 - BLOCK
      ?auto_77082 - BLOCK
      ?auto_77083 - BLOCK
    )
    :vars
    (
      ?auto_77084 - BLOCK
      ?auto_77085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77078 ) ( not ( = ?auto_77078 ?auto_77079 ) ) ( not ( = ?auto_77078 ?auto_77080 ) ) ( not ( = ?auto_77078 ?auto_77081 ) ) ( not ( = ?auto_77078 ?auto_77082 ) ) ( not ( = ?auto_77078 ?auto_77083 ) ) ( not ( = ?auto_77079 ?auto_77080 ) ) ( not ( = ?auto_77079 ?auto_77081 ) ) ( not ( = ?auto_77079 ?auto_77082 ) ) ( not ( = ?auto_77079 ?auto_77083 ) ) ( not ( = ?auto_77080 ?auto_77081 ) ) ( not ( = ?auto_77080 ?auto_77082 ) ) ( not ( = ?auto_77080 ?auto_77083 ) ) ( not ( = ?auto_77081 ?auto_77082 ) ) ( not ( = ?auto_77081 ?auto_77083 ) ) ( not ( = ?auto_77082 ?auto_77083 ) ) ( ON ?auto_77083 ?auto_77084 ) ( not ( = ?auto_77078 ?auto_77084 ) ) ( not ( = ?auto_77079 ?auto_77084 ) ) ( not ( = ?auto_77080 ?auto_77084 ) ) ( not ( = ?auto_77081 ?auto_77084 ) ) ( not ( = ?auto_77082 ?auto_77084 ) ) ( not ( = ?auto_77083 ?auto_77084 ) ) ( ON ?auto_77082 ?auto_77083 ) ( ON-TABLE ?auto_77085 ) ( ON ?auto_77084 ?auto_77085 ) ( not ( = ?auto_77085 ?auto_77084 ) ) ( not ( = ?auto_77085 ?auto_77083 ) ) ( not ( = ?auto_77085 ?auto_77082 ) ) ( not ( = ?auto_77078 ?auto_77085 ) ) ( not ( = ?auto_77079 ?auto_77085 ) ) ( not ( = ?auto_77080 ?auto_77085 ) ) ( not ( = ?auto_77081 ?auto_77085 ) ) ( ON ?auto_77081 ?auto_77082 ) ( ON ?auto_77080 ?auto_77081 ) ( CLEAR ?auto_77080 ) ( HOLDING ?auto_77079 ) ( CLEAR ?auto_77078 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77078 ?auto_77079 )
      ( MAKE-6PILE ?auto_77078 ?auto_77079 ?auto_77080 ?auto_77081 ?auto_77082 ?auto_77083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77086 - BLOCK
      ?auto_77087 - BLOCK
      ?auto_77088 - BLOCK
      ?auto_77089 - BLOCK
      ?auto_77090 - BLOCK
      ?auto_77091 - BLOCK
    )
    :vars
    (
      ?auto_77093 - BLOCK
      ?auto_77092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77086 ) ( not ( = ?auto_77086 ?auto_77087 ) ) ( not ( = ?auto_77086 ?auto_77088 ) ) ( not ( = ?auto_77086 ?auto_77089 ) ) ( not ( = ?auto_77086 ?auto_77090 ) ) ( not ( = ?auto_77086 ?auto_77091 ) ) ( not ( = ?auto_77087 ?auto_77088 ) ) ( not ( = ?auto_77087 ?auto_77089 ) ) ( not ( = ?auto_77087 ?auto_77090 ) ) ( not ( = ?auto_77087 ?auto_77091 ) ) ( not ( = ?auto_77088 ?auto_77089 ) ) ( not ( = ?auto_77088 ?auto_77090 ) ) ( not ( = ?auto_77088 ?auto_77091 ) ) ( not ( = ?auto_77089 ?auto_77090 ) ) ( not ( = ?auto_77089 ?auto_77091 ) ) ( not ( = ?auto_77090 ?auto_77091 ) ) ( ON ?auto_77091 ?auto_77093 ) ( not ( = ?auto_77086 ?auto_77093 ) ) ( not ( = ?auto_77087 ?auto_77093 ) ) ( not ( = ?auto_77088 ?auto_77093 ) ) ( not ( = ?auto_77089 ?auto_77093 ) ) ( not ( = ?auto_77090 ?auto_77093 ) ) ( not ( = ?auto_77091 ?auto_77093 ) ) ( ON ?auto_77090 ?auto_77091 ) ( ON-TABLE ?auto_77092 ) ( ON ?auto_77093 ?auto_77092 ) ( not ( = ?auto_77092 ?auto_77093 ) ) ( not ( = ?auto_77092 ?auto_77091 ) ) ( not ( = ?auto_77092 ?auto_77090 ) ) ( not ( = ?auto_77086 ?auto_77092 ) ) ( not ( = ?auto_77087 ?auto_77092 ) ) ( not ( = ?auto_77088 ?auto_77092 ) ) ( not ( = ?auto_77089 ?auto_77092 ) ) ( ON ?auto_77089 ?auto_77090 ) ( ON ?auto_77088 ?auto_77089 ) ( CLEAR ?auto_77086 ) ( ON ?auto_77087 ?auto_77088 ) ( CLEAR ?auto_77087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77092 ?auto_77093 ?auto_77091 ?auto_77090 ?auto_77089 ?auto_77088 )
      ( MAKE-6PILE ?auto_77086 ?auto_77087 ?auto_77088 ?auto_77089 ?auto_77090 ?auto_77091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77094 - BLOCK
      ?auto_77095 - BLOCK
      ?auto_77096 - BLOCK
      ?auto_77097 - BLOCK
      ?auto_77098 - BLOCK
      ?auto_77099 - BLOCK
    )
    :vars
    (
      ?auto_77100 - BLOCK
      ?auto_77101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77094 ?auto_77095 ) ) ( not ( = ?auto_77094 ?auto_77096 ) ) ( not ( = ?auto_77094 ?auto_77097 ) ) ( not ( = ?auto_77094 ?auto_77098 ) ) ( not ( = ?auto_77094 ?auto_77099 ) ) ( not ( = ?auto_77095 ?auto_77096 ) ) ( not ( = ?auto_77095 ?auto_77097 ) ) ( not ( = ?auto_77095 ?auto_77098 ) ) ( not ( = ?auto_77095 ?auto_77099 ) ) ( not ( = ?auto_77096 ?auto_77097 ) ) ( not ( = ?auto_77096 ?auto_77098 ) ) ( not ( = ?auto_77096 ?auto_77099 ) ) ( not ( = ?auto_77097 ?auto_77098 ) ) ( not ( = ?auto_77097 ?auto_77099 ) ) ( not ( = ?auto_77098 ?auto_77099 ) ) ( ON ?auto_77099 ?auto_77100 ) ( not ( = ?auto_77094 ?auto_77100 ) ) ( not ( = ?auto_77095 ?auto_77100 ) ) ( not ( = ?auto_77096 ?auto_77100 ) ) ( not ( = ?auto_77097 ?auto_77100 ) ) ( not ( = ?auto_77098 ?auto_77100 ) ) ( not ( = ?auto_77099 ?auto_77100 ) ) ( ON ?auto_77098 ?auto_77099 ) ( ON-TABLE ?auto_77101 ) ( ON ?auto_77100 ?auto_77101 ) ( not ( = ?auto_77101 ?auto_77100 ) ) ( not ( = ?auto_77101 ?auto_77099 ) ) ( not ( = ?auto_77101 ?auto_77098 ) ) ( not ( = ?auto_77094 ?auto_77101 ) ) ( not ( = ?auto_77095 ?auto_77101 ) ) ( not ( = ?auto_77096 ?auto_77101 ) ) ( not ( = ?auto_77097 ?auto_77101 ) ) ( ON ?auto_77097 ?auto_77098 ) ( ON ?auto_77096 ?auto_77097 ) ( ON ?auto_77095 ?auto_77096 ) ( CLEAR ?auto_77095 ) ( HOLDING ?auto_77094 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77094 )
      ( MAKE-6PILE ?auto_77094 ?auto_77095 ?auto_77096 ?auto_77097 ?auto_77098 ?auto_77099 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77102 - BLOCK
      ?auto_77103 - BLOCK
      ?auto_77104 - BLOCK
      ?auto_77105 - BLOCK
      ?auto_77106 - BLOCK
      ?auto_77107 - BLOCK
    )
    :vars
    (
      ?auto_77108 - BLOCK
      ?auto_77109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77102 ?auto_77103 ) ) ( not ( = ?auto_77102 ?auto_77104 ) ) ( not ( = ?auto_77102 ?auto_77105 ) ) ( not ( = ?auto_77102 ?auto_77106 ) ) ( not ( = ?auto_77102 ?auto_77107 ) ) ( not ( = ?auto_77103 ?auto_77104 ) ) ( not ( = ?auto_77103 ?auto_77105 ) ) ( not ( = ?auto_77103 ?auto_77106 ) ) ( not ( = ?auto_77103 ?auto_77107 ) ) ( not ( = ?auto_77104 ?auto_77105 ) ) ( not ( = ?auto_77104 ?auto_77106 ) ) ( not ( = ?auto_77104 ?auto_77107 ) ) ( not ( = ?auto_77105 ?auto_77106 ) ) ( not ( = ?auto_77105 ?auto_77107 ) ) ( not ( = ?auto_77106 ?auto_77107 ) ) ( ON ?auto_77107 ?auto_77108 ) ( not ( = ?auto_77102 ?auto_77108 ) ) ( not ( = ?auto_77103 ?auto_77108 ) ) ( not ( = ?auto_77104 ?auto_77108 ) ) ( not ( = ?auto_77105 ?auto_77108 ) ) ( not ( = ?auto_77106 ?auto_77108 ) ) ( not ( = ?auto_77107 ?auto_77108 ) ) ( ON ?auto_77106 ?auto_77107 ) ( ON-TABLE ?auto_77109 ) ( ON ?auto_77108 ?auto_77109 ) ( not ( = ?auto_77109 ?auto_77108 ) ) ( not ( = ?auto_77109 ?auto_77107 ) ) ( not ( = ?auto_77109 ?auto_77106 ) ) ( not ( = ?auto_77102 ?auto_77109 ) ) ( not ( = ?auto_77103 ?auto_77109 ) ) ( not ( = ?auto_77104 ?auto_77109 ) ) ( not ( = ?auto_77105 ?auto_77109 ) ) ( ON ?auto_77105 ?auto_77106 ) ( ON ?auto_77104 ?auto_77105 ) ( ON ?auto_77103 ?auto_77104 ) ( ON ?auto_77102 ?auto_77103 ) ( CLEAR ?auto_77102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77109 ?auto_77108 ?auto_77107 ?auto_77106 ?auto_77105 ?auto_77104 ?auto_77103 )
      ( MAKE-6PILE ?auto_77102 ?auto_77103 ?auto_77104 ?auto_77105 ?auto_77106 ?auto_77107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77111 - BLOCK
    )
    :vars
    (
      ?auto_77112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77112 ?auto_77111 ) ( CLEAR ?auto_77112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77111 ) ( not ( = ?auto_77111 ?auto_77112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77112 ?auto_77111 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77113 - BLOCK
    )
    :vars
    (
      ?auto_77114 - BLOCK
      ?auto_77115 - BLOCK
      ?auto_77116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77114 ?auto_77113 ) ( CLEAR ?auto_77114 ) ( ON-TABLE ?auto_77113 ) ( not ( = ?auto_77113 ?auto_77114 ) ) ( HOLDING ?auto_77115 ) ( CLEAR ?auto_77116 ) ( not ( = ?auto_77113 ?auto_77115 ) ) ( not ( = ?auto_77113 ?auto_77116 ) ) ( not ( = ?auto_77114 ?auto_77115 ) ) ( not ( = ?auto_77114 ?auto_77116 ) ) ( not ( = ?auto_77115 ?auto_77116 ) ) )
    :subtasks
    ( ( !STACK ?auto_77115 ?auto_77116 )
      ( MAKE-1PILE ?auto_77113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77117 - BLOCK
    )
    :vars
    (
      ?auto_77118 - BLOCK
      ?auto_77120 - BLOCK
      ?auto_77119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77118 ?auto_77117 ) ( ON-TABLE ?auto_77117 ) ( not ( = ?auto_77117 ?auto_77118 ) ) ( CLEAR ?auto_77120 ) ( not ( = ?auto_77117 ?auto_77119 ) ) ( not ( = ?auto_77117 ?auto_77120 ) ) ( not ( = ?auto_77118 ?auto_77119 ) ) ( not ( = ?auto_77118 ?auto_77120 ) ) ( not ( = ?auto_77119 ?auto_77120 ) ) ( ON ?auto_77119 ?auto_77118 ) ( CLEAR ?auto_77119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77117 ?auto_77118 )
      ( MAKE-1PILE ?auto_77117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77121 - BLOCK
    )
    :vars
    (
      ?auto_77123 - BLOCK
      ?auto_77122 - BLOCK
      ?auto_77124 - BLOCK
      ?auto_77125 - BLOCK
      ?auto_77128 - BLOCK
      ?auto_77127 - BLOCK
      ?auto_77126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77123 ?auto_77121 ) ( ON-TABLE ?auto_77121 ) ( not ( = ?auto_77121 ?auto_77123 ) ) ( not ( = ?auto_77121 ?auto_77122 ) ) ( not ( = ?auto_77121 ?auto_77124 ) ) ( not ( = ?auto_77123 ?auto_77122 ) ) ( not ( = ?auto_77123 ?auto_77124 ) ) ( not ( = ?auto_77122 ?auto_77124 ) ) ( ON ?auto_77122 ?auto_77123 ) ( CLEAR ?auto_77122 ) ( HOLDING ?auto_77124 ) ( CLEAR ?auto_77125 ) ( ON-TABLE ?auto_77128 ) ( ON ?auto_77127 ?auto_77128 ) ( ON ?auto_77126 ?auto_77127 ) ( ON ?auto_77125 ?auto_77126 ) ( not ( = ?auto_77128 ?auto_77127 ) ) ( not ( = ?auto_77128 ?auto_77126 ) ) ( not ( = ?auto_77128 ?auto_77125 ) ) ( not ( = ?auto_77128 ?auto_77124 ) ) ( not ( = ?auto_77127 ?auto_77126 ) ) ( not ( = ?auto_77127 ?auto_77125 ) ) ( not ( = ?auto_77127 ?auto_77124 ) ) ( not ( = ?auto_77126 ?auto_77125 ) ) ( not ( = ?auto_77126 ?auto_77124 ) ) ( not ( = ?auto_77125 ?auto_77124 ) ) ( not ( = ?auto_77121 ?auto_77125 ) ) ( not ( = ?auto_77121 ?auto_77128 ) ) ( not ( = ?auto_77121 ?auto_77127 ) ) ( not ( = ?auto_77121 ?auto_77126 ) ) ( not ( = ?auto_77123 ?auto_77125 ) ) ( not ( = ?auto_77123 ?auto_77128 ) ) ( not ( = ?auto_77123 ?auto_77127 ) ) ( not ( = ?auto_77123 ?auto_77126 ) ) ( not ( = ?auto_77122 ?auto_77125 ) ) ( not ( = ?auto_77122 ?auto_77128 ) ) ( not ( = ?auto_77122 ?auto_77127 ) ) ( not ( = ?auto_77122 ?auto_77126 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77128 ?auto_77127 ?auto_77126 ?auto_77125 ?auto_77124 )
      ( MAKE-1PILE ?auto_77121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77129 - BLOCK
    )
    :vars
    (
      ?auto_77134 - BLOCK
      ?auto_77131 - BLOCK
      ?auto_77136 - BLOCK
      ?auto_77135 - BLOCK
      ?auto_77132 - BLOCK
      ?auto_77130 - BLOCK
      ?auto_77133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77134 ?auto_77129 ) ( ON-TABLE ?auto_77129 ) ( not ( = ?auto_77129 ?auto_77134 ) ) ( not ( = ?auto_77129 ?auto_77131 ) ) ( not ( = ?auto_77129 ?auto_77136 ) ) ( not ( = ?auto_77134 ?auto_77131 ) ) ( not ( = ?auto_77134 ?auto_77136 ) ) ( not ( = ?auto_77131 ?auto_77136 ) ) ( ON ?auto_77131 ?auto_77134 ) ( CLEAR ?auto_77135 ) ( ON-TABLE ?auto_77132 ) ( ON ?auto_77130 ?auto_77132 ) ( ON ?auto_77133 ?auto_77130 ) ( ON ?auto_77135 ?auto_77133 ) ( not ( = ?auto_77132 ?auto_77130 ) ) ( not ( = ?auto_77132 ?auto_77133 ) ) ( not ( = ?auto_77132 ?auto_77135 ) ) ( not ( = ?auto_77132 ?auto_77136 ) ) ( not ( = ?auto_77130 ?auto_77133 ) ) ( not ( = ?auto_77130 ?auto_77135 ) ) ( not ( = ?auto_77130 ?auto_77136 ) ) ( not ( = ?auto_77133 ?auto_77135 ) ) ( not ( = ?auto_77133 ?auto_77136 ) ) ( not ( = ?auto_77135 ?auto_77136 ) ) ( not ( = ?auto_77129 ?auto_77135 ) ) ( not ( = ?auto_77129 ?auto_77132 ) ) ( not ( = ?auto_77129 ?auto_77130 ) ) ( not ( = ?auto_77129 ?auto_77133 ) ) ( not ( = ?auto_77134 ?auto_77135 ) ) ( not ( = ?auto_77134 ?auto_77132 ) ) ( not ( = ?auto_77134 ?auto_77130 ) ) ( not ( = ?auto_77134 ?auto_77133 ) ) ( not ( = ?auto_77131 ?auto_77135 ) ) ( not ( = ?auto_77131 ?auto_77132 ) ) ( not ( = ?auto_77131 ?auto_77130 ) ) ( not ( = ?auto_77131 ?auto_77133 ) ) ( ON ?auto_77136 ?auto_77131 ) ( CLEAR ?auto_77136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77129 ?auto_77134 ?auto_77131 )
      ( MAKE-1PILE ?auto_77129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77137 - BLOCK
    )
    :vars
    (
      ?auto_77142 - BLOCK
      ?auto_77138 - BLOCK
      ?auto_77140 - BLOCK
      ?auto_77141 - BLOCK
      ?auto_77144 - BLOCK
      ?auto_77139 - BLOCK
      ?auto_77143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77142 ?auto_77137 ) ( ON-TABLE ?auto_77137 ) ( not ( = ?auto_77137 ?auto_77142 ) ) ( not ( = ?auto_77137 ?auto_77138 ) ) ( not ( = ?auto_77137 ?auto_77140 ) ) ( not ( = ?auto_77142 ?auto_77138 ) ) ( not ( = ?auto_77142 ?auto_77140 ) ) ( not ( = ?auto_77138 ?auto_77140 ) ) ( ON ?auto_77138 ?auto_77142 ) ( ON-TABLE ?auto_77141 ) ( ON ?auto_77144 ?auto_77141 ) ( ON ?auto_77139 ?auto_77144 ) ( not ( = ?auto_77141 ?auto_77144 ) ) ( not ( = ?auto_77141 ?auto_77139 ) ) ( not ( = ?auto_77141 ?auto_77143 ) ) ( not ( = ?auto_77141 ?auto_77140 ) ) ( not ( = ?auto_77144 ?auto_77139 ) ) ( not ( = ?auto_77144 ?auto_77143 ) ) ( not ( = ?auto_77144 ?auto_77140 ) ) ( not ( = ?auto_77139 ?auto_77143 ) ) ( not ( = ?auto_77139 ?auto_77140 ) ) ( not ( = ?auto_77143 ?auto_77140 ) ) ( not ( = ?auto_77137 ?auto_77143 ) ) ( not ( = ?auto_77137 ?auto_77141 ) ) ( not ( = ?auto_77137 ?auto_77144 ) ) ( not ( = ?auto_77137 ?auto_77139 ) ) ( not ( = ?auto_77142 ?auto_77143 ) ) ( not ( = ?auto_77142 ?auto_77141 ) ) ( not ( = ?auto_77142 ?auto_77144 ) ) ( not ( = ?auto_77142 ?auto_77139 ) ) ( not ( = ?auto_77138 ?auto_77143 ) ) ( not ( = ?auto_77138 ?auto_77141 ) ) ( not ( = ?auto_77138 ?auto_77144 ) ) ( not ( = ?auto_77138 ?auto_77139 ) ) ( ON ?auto_77140 ?auto_77138 ) ( CLEAR ?auto_77140 ) ( HOLDING ?auto_77143 ) ( CLEAR ?auto_77139 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77141 ?auto_77144 ?auto_77139 ?auto_77143 )
      ( MAKE-1PILE ?auto_77137 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77145 - BLOCK
    )
    :vars
    (
      ?auto_77152 - BLOCK
      ?auto_77150 - BLOCK
      ?auto_77147 - BLOCK
      ?auto_77149 - BLOCK
      ?auto_77151 - BLOCK
      ?auto_77148 - BLOCK
      ?auto_77146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77152 ?auto_77145 ) ( ON-TABLE ?auto_77145 ) ( not ( = ?auto_77145 ?auto_77152 ) ) ( not ( = ?auto_77145 ?auto_77150 ) ) ( not ( = ?auto_77145 ?auto_77147 ) ) ( not ( = ?auto_77152 ?auto_77150 ) ) ( not ( = ?auto_77152 ?auto_77147 ) ) ( not ( = ?auto_77150 ?auto_77147 ) ) ( ON ?auto_77150 ?auto_77152 ) ( ON-TABLE ?auto_77149 ) ( ON ?auto_77151 ?auto_77149 ) ( ON ?auto_77148 ?auto_77151 ) ( not ( = ?auto_77149 ?auto_77151 ) ) ( not ( = ?auto_77149 ?auto_77148 ) ) ( not ( = ?auto_77149 ?auto_77146 ) ) ( not ( = ?auto_77149 ?auto_77147 ) ) ( not ( = ?auto_77151 ?auto_77148 ) ) ( not ( = ?auto_77151 ?auto_77146 ) ) ( not ( = ?auto_77151 ?auto_77147 ) ) ( not ( = ?auto_77148 ?auto_77146 ) ) ( not ( = ?auto_77148 ?auto_77147 ) ) ( not ( = ?auto_77146 ?auto_77147 ) ) ( not ( = ?auto_77145 ?auto_77146 ) ) ( not ( = ?auto_77145 ?auto_77149 ) ) ( not ( = ?auto_77145 ?auto_77151 ) ) ( not ( = ?auto_77145 ?auto_77148 ) ) ( not ( = ?auto_77152 ?auto_77146 ) ) ( not ( = ?auto_77152 ?auto_77149 ) ) ( not ( = ?auto_77152 ?auto_77151 ) ) ( not ( = ?auto_77152 ?auto_77148 ) ) ( not ( = ?auto_77150 ?auto_77146 ) ) ( not ( = ?auto_77150 ?auto_77149 ) ) ( not ( = ?auto_77150 ?auto_77151 ) ) ( not ( = ?auto_77150 ?auto_77148 ) ) ( ON ?auto_77147 ?auto_77150 ) ( CLEAR ?auto_77148 ) ( ON ?auto_77146 ?auto_77147 ) ( CLEAR ?auto_77146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77145 ?auto_77152 ?auto_77150 ?auto_77147 )
      ( MAKE-1PILE ?auto_77145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77153 - BLOCK
    )
    :vars
    (
      ?auto_77154 - BLOCK
      ?auto_77160 - BLOCK
      ?auto_77157 - BLOCK
      ?auto_77155 - BLOCK
      ?auto_77159 - BLOCK
      ?auto_77158 - BLOCK
      ?auto_77156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77154 ?auto_77153 ) ( ON-TABLE ?auto_77153 ) ( not ( = ?auto_77153 ?auto_77154 ) ) ( not ( = ?auto_77153 ?auto_77160 ) ) ( not ( = ?auto_77153 ?auto_77157 ) ) ( not ( = ?auto_77154 ?auto_77160 ) ) ( not ( = ?auto_77154 ?auto_77157 ) ) ( not ( = ?auto_77160 ?auto_77157 ) ) ( ON ?auto_77160 ?auto_77154 ) ( ON-TABLE ?auto_77155 ) ( ON ?auto_77159 ?auto_77155 ) ( not ( = ?auto_77155 ?auto_77159 ) ) ( not ( = ?auto_77155 ?auto_77158 ) ) ( not ( = ?auto_77155 ?auto_77156 ) ) ( not ( = ?auto_77155 ?auto_77157 ) ) ( not ( = ?auto_77159 ?auto_77158 ) ) ( not ( = ?auto_77159 ?auto_77156 ) ) ( not ( = ?auto_77159 ?auto_77157 ) ) ( not ( = ?auto_77158 ?auto_77156 ) ) ( not ( = ?auto_77158 ?auto_77157 ) ) ( not ( = ?auto_77156 ?auto_77157 ) ) ( not ( = ?auto_77153 ?auto_77156 ) ) ( not ( = ?auto_77153 ?auto_77155 ) ) ( not ( = ?auto_77153 ?auto_77159 ) ) ( not ( = ?auto_77153 ?auto_77158 ) ) ( not ( = ?auto_77154 ?auto_77156 ) ) ( not ( = ?auto_77154 ?auto_77155 ) ) ( not ( = ?auto_77154 ?auto_77159 ) ) ( not ( = ?auto_77154 ?auto_77158 ) ) ( not ( = ?auto_77160 ?auto_77156 ) ) ( not ( = ?auto_77160 ?auto_77155 ) ) ( not ( = ?auto_77160 ?auto_77159 ) ) ( not ( = ?auto_77160 ?auto_77158 ) ) ( ON ?auto_77157 ?auto_77160 ) ( ON ?auto_77156 ?auto_77157 ) ( CLEAR ?auto_77156 ) ( HOLDING ?auto_77158 ) ( CLEAR ?auto_77159 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77155 ?auto_77159 ?auto_77158 )
      ( MAKE-1PILE ?auto_77153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77161 - BLOCK
    )
    :vars
    (
      ?auto_77167 - BLOCK
      ?auto_77163 - BLOCK
      ?auto_77166 - BLOCK
      ?auto_77165 - BLOCK
      ?auto_77162 - BLOCK
      ?auto_77164 - BLOCK
      ?auto_77168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77167 ?auto_77161 ) ( ON-TABLE ?auto_77161 ) ( not ( = ?auto_77161 ?auto_77167 ) ) ( not ( = ?auto_77161 ?auto_77163 ) ) ( not ( = ?auto_77161 ?auto_77166 ) ) ( not ( = ?auto_77167 ?auto_77163 ) ) ( not ( = ?auto_77167 ?auto_77166 ) ) ( not ( = ?auto_77163 ?auto_77166 ) ) ( ON ?auto_77163 ?auto_77167 ) ( ON-TABLE ?auto_77165 ) ( ON ?auto_77162 ?auto_77165 ) ( not ( = ?auto_77165 ?auto_77162 ) ) ( not ( = ?auto_77165 ?auto_77164 ) ) ( not ( = ?auto_77165 ?auto_77168 ) ) ( not ( = ?auto_77165 ?auto_77166 ) ) ( not ( = ?auto_77162 ?auto_77164 ) ) ( not ( = ?auto_77162 ?auto_77168 ) ) ( not ( = ?auto_77162 ?auto_77166 ) ) ( not ( = ?auto_77164 ?auto_77168 ) ) ( not ( = ?auto_77164 ?auto_77166 ) ) ( not ( = ?auto_77168 ?auto_77166 ) ) ( not ( = ?auto_77161 ?auto_77168 ) ) ( not ( = ?auto_77161 ?auto_77165 ) ) ( not ( = ?auto_77161 ?auto_77162 ) ) ( not ( = ?auto_77161 ?auto_77164 ) ) ( not ( = ?auto_77167 ?auto_77168 ) ) ( not ( = ?auto_77167 ?auto_77165 ) ) ( not ( = ?auto_77167 ?auto_77162 ) ) ( not ( = ?auto_77167 ?auto_77164 ) ) ( not ( = ?auto_77163 ?auto_77168 ) ) ( not ( = ?auto_77163 ?auto_77165 ) ) ( not ( = ?auto_77163 ?auto_77162 ) ) ( not ( = ?auto_77163 ?auto_77164 ) ) ( ON ?auto_77166 ?auto_77163 ) ( ON ?auto_77168 ?auto_77166 ) ( CLEAR ?auto_77162 ) ( ON ?auto_77164 ?auto_77168 ) ( CLEAR ?auto_77164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77161 ?auto_77167 ?auto_77163 ?auto_77166 ?auto_77168 )
      ( MAKE-1PILE ?auto_77161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77169 - BLOCK
    )
    :vars
    (
      ?auto_77173 - BLOCK
      ?auto_77174 - BLOCK
      ?auto_77172 - BLOCK
      ?auto_77170 - BLOCK
      ?auto_77171 - BLOCK
      ?auto_77175 - BLOCK
      ?auto_77176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77173 ?auto_77169 ) ( ON-TABLE ?auto_77169 ) ( not ( = ?auto_77169 ?auto_77173 ) ) ( not ( = ?auto_77169 ?auto_77174 ) ) ( not ( = ?auto_77169 ?auto_77172 ) ) ( not ( = ?auto_77173 ?auto_77174 ) ) ( not ( = ?auto_77173 ?auto_77172 ) ) ( not ( = ?auto_77174 ?auto_77172 ) ) ( ON ?auto_77174 ?auto_77173 ) ( ON-TABLE ?auto_77170 ) ( not ( = ?auto_77170 ?auto_77171 ) ) ( not ( = ?auto_77170 ?auto_77175 ) ) ( not ( = ?auto_77170 ?auto_77176 ) ) ( not ( = ?auto_77170 ?auto_77172 ) ) ( not ( = ?auto_77171 ?auto_77175 ) ) ( not ( = ?auto_77171 ?auto_77176 ) ) ( not ( = ?auto_77171 ?auto_77172 ) ) ( not ( = ?auto_77175 ?auto_77176 ) ) ( not ( = ?auto_77175 ?auto_77172 ) ) ( not ( = ?auto_77176 ?auto_77172 ) ) ( not ( = ?auto_77169 ?auto_77176 ) ) ( not ( = ?auto_77169 ?auto_77170 ) ) ( not ( = ?auto_77169 ?auto_77171 ) ) ( not ( = ?auto_77169 ?auto_77175 ) ) ( not ( = ?auto_77173 ?auto_77176 ) ) ( not ( = ?auto_77173 ?auto_77170 ) ) ( not ( = ?auto_77173 ?auto_77171 ) ) ( not ( = ?auto_77173 ?auto_77175 ) ) ( not ( = ?auto_77174 ?auto_77176 ) ) ( not ( = ?auto_77174 ?auto_77170 ) ) ( not ( = ?auto_77174 ?auto_77171 ) ) ( not ( = ?auto_77174 ?auto_77175 ) ) ( ON ?auto_77172 ?auto_77174 ) ( ON ?auto_77176 ?auto_77172 ) ( ON ?auto_77175 ?auto_77176 ) ( CLEAR ?auto_77175 ) ( HOLDING ?auto_77171 ) ( CLEAR ?auto_77170 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77170 ?auto_77171 )
      ( MAKE-1PILE ?auto_77169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78583 - BLOCK
    )
    :vars
    (
      ?auto_78587 - BLOCK
      ?auto_78586 - BLOCK
      ?auto_78588 - BLOCK
      ?auto_78585 - BLOCK
      ?auto_78589 - BLOCK
      ?auto_78584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78587 ?auto_78583 ) ( ON-TABLE ?auto_78583 ) ( not ( = ?auto_78583 ?auto_78587 ) ) ( not ( = ?auto_78583 ?auto_78586 ) ) ( not ( = ?auto_78583 ?auto_78588 ) ) ( not ( = ?auto_78587 ?auto_78586 ) ) ( not ( = ?auto_78587 ?auto_78588 ) ) ( not ( = ?auto_78586 ?auto_78588 ) ) ( ON ?auto_78586 ?auto_78587 ) ( not ( = ?auto_78585 ?auto_78589 ) ) ( not ( = ?auto_78585 ?auto_78584 ) ) ( not ( = ?auto_78585 ?auto_78588 ) ) ( not ( = ?auto_78589 ?auto_78584 ) ) ( not ( = ?auto_78589 ?auto_78588 ) ) ( not ( = ?auto_78584 ?auto_78588 ) ) ( not ( = ?auto_78583 ?auto_78584 ) ) ( not ( = ?auto_78583 ?auto_78585 ) ) ( not ( = ?auto_78583 ?auto_78589 ) ) ( not ( = ?auto_78587 ?auto_78584 ) ) ( not ( = ?auto_78587 ?auto_78585 ) ) ( not ( = ?auto_78587 ?auto_78589 ) ) ( not ( = ?auto_78586 ?auto_78584 ) ) ( not ( = ?auto_78586 ?auto_78585 ) ) ( not ( = ?auto_78586 ?auto_78589 ) ) ( ON ?auto_78588 ?auto_78586 ) ( ON ?auto_78584 ?auto_78588 ) ( ON ?auto_78589 ?auto_78584 ) ( ON ?auto_78585 ?auto_78589 ) ( CLEAR ?auto_78585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78583 ?auto_78587 ?auto_78586 ?auto_78588 ?auto_78584 ?auto_78589 )
      ( MAKE-1PILE ?auto_78583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77185 - BLOCK
    )
    :vars
    (
      ?auto_77192 - BLOCK
      ?auto_77190 - BLOCK
      ?auto_77187 - BLOCK
      ?auto_77191 - BLOCK
      ?auto_77189 - BLOCK
      ?auto_77186 - BLOCK
      ?auto_77188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77192 ?auto_77185 ) ( ON-TABLE ?auto_77185 ) ( not ( = ?auto_77185 ?auto_77192 ) ) ( not ( = ?auto_77185 ?auto_77190 ) ) ( not ( = ?auto_77185 ?auto_77187 ) ) ( not ( = ?auto_77192 ?auto_77190 ) ) ( not ( = ?auto_77192 ?auto_77187 ) ) ( not ( = ?auto_77190 ?auto_77187 ) ) ( ON ?auto_77190 ?auto_77192 ) ( not ( = ?auto_77191 ?auto_77189 ) ) ( not ( = ?auto_77191 ?auto_77186 ) ) ( not ( = ?auto_77191 ?auto_77188 ) ) ( not ( = ?auto_77191 ?auto_77187 ) ) ( not ( = ?auto_77189 ?auto_77186 ) ) ( not ( = ?auto_77189 ?auto_77188 ) ) ( not ( = ?auto_77189 ?auto_77187 ) ) ( not ( = ?auto_77186 ?auto_77188 ) ) ( not ( = ?auto_77186 ?auto_77187 ) ) ( not ( = ?auto_77188 ?auto_77187 ) ) ( not ( = ?auto_77185 ?auto_77188 ) ) ( not ( = ?auto_77185 ?auto_77191 ) ) ( not ( = ?auto_77185 ?auto_77189 ) ) ( not ( = ?auto_77185 ?auto_77186 ) ) ( not ( = ?auto_77192 ?auto_77188 ) ) ( not ( = ?auto_77192 ?auto_77191 ) ) ( not ( = ?auto_77192 ?auto_77189 ) ) ( not ( = ?auto_77192 ?auto_77186 ) ) ( not ( = ?auto_77190 ?auto_77188 ) ) ( not ( = ?auto_77190 ?auto_77191 ) ) ( not ( = ?auto_77190 ?auto_77189 ) ) ( not ( = ?auto_77190 ?auto_77186 ) ) ( ON ?auto_77187 ?auto_77190 ) ( ON ?auto_77188 ?auto_77187 ) ( ON ?auto_77186 ?auto_77188 ) ( ON ?auto_77189 ?auto_77186 ) ( CLEAR ?auto_77189 ) ( HOLDING ?auto_77191 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77191 )
      ( MAKE-1PILE ?auto_77185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77193 - BLOCK
    )
    :vars
    (
      ?auto_77194 - BLOCK
      ?auto_77198 - BLOCK
      ?auto_77195 - BLOCK
      ?auto_77196 - BLOCK
      ?auto_77197 - BLOCK
      ?auto_77199 - BLOCK
      ?auto_77200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77194 ?auto_77193 ) ( ON-TABLE ?auto_77193 ) ( not ( = ?auto_77193 ?auto_77194 ) ) ( not ( = ?auto_77193 ?auto_77198 ) ) ( not ( = ?auto_77193 ?auto_77195 ) ) ( not ( = ?auto_77194 ?auto_77198 ) ) ( not ( = ?auto_77194 ?auto_77195 ) ) ( not ( = ?auto_77198 ?auto_77195 ) ) ( ON ?auto_77198 ?auto_77194 ) ( not ( = ?auto_77196 ?auto_77197 ) ) ( not ( = ?auto_77196 ?auto_77199 ) ) ( not ( = ?auto_77196 ?auto_77200 ) ) ( not ( = ?auto_77196 ?auto_77195 ) ) ( not ( = ?auto_77197 ?auto_77199 ) ) ( not ( = ?auto_77197 ?auto_77200 ) ) ( not ( = ?auto_77197 ?auto_77195 ) ) ( not ( = ?auto_77199 ?auto_77200 ) ) ( not ( = ?auto_77199 ?auto_77195 ) ) ( not ( = ?auto_77200 ?auto_77195 ) ) ( not ( = ?auto_77193 ?auto_77200 ) ) ( not ( = ?auto_77193 ?auto_77196 ) ) ( not ( = ?auto_77193 ?auto_77197 ) ) ( not ( = ?auto_77193 ?auto_77199 ) ) ( not ( = ?auto_77194 ?auto_77200 ) ) ( not ( = ?auto_77194 ?auto_77196 ) ) ( not ( = ?auto_77194 ?auto_77197 ) ) ( not ( = ?auto_77194 ?auto_77199 ) ) ( not ( = ?auto_77198 ?auto_77200 ) ) ( not ( = ?auto_77198 ?auto_77196 ) ) ( not ( = ?auto_77198 ?auto_77197 ) ) ( not ( = ?auto_77198 ?auto_77199 ) ) ( ON ?auto_77195 ?auto_77198 ) ( ON ?auto_77200 ?auto_77195 ) ( ON ?auto_77199 ?auto_77200 ) ( ON ?auto_77197 ?auto_77199 ) ( ON ?auto_77196 ?auto_77197 ) ( CLEAR ?auto_77196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77193 ?auto_77194 ?auto_77198 ?auto_77195 ?auto_77200 ?auto_77199 ?auto_77197 )
      ( MAKE-1PILE ?auto_77193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77208 - BLOCK
      ?auto_77209 - BLOCK
      ?auto_77210 - BLOCK
      ?auto_77211 - BLOCK
      ?auto_77212 - BLOCK
      ?auto_77213 - BLOCK
      ?auto_77214 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_77214 ) ( CLEAR ?auto_77213 ) ( ON-TABLE ?auto_77208 ) ( ON ?auto_77209 ?auto_77208 ) ( ON ?auto_77210 ?auto_77209 ) ( ON ?auto_77211 ?auto_77210 ) ( ON ?auto_77212 ?auto_77211 ) ( ON ?auto_77213 ?auto_77212 ) ( not ( = ?auto_77208 ?auto_77209 ) ) ( not ( = ?auto_77208 ?auto_77210 ) ) ( not ( = ?auto_77208 ?auto_77211 ) ) ( not ( = ?auto_77208 ?auto_77212 ) ) ( not ( = ?auto_77208 ?auto_77213 ) ) ( not ( = ?auto_77208 ?auto_77214 ) ) ( not ( = ?auto_77209 ?auto_77210 ) ) ( not ( = ?auto_77209 ?auto_77211 ) ) ( not ( = ?auto_77209 ?auto_77212 ) ) ( not ( = ?auto_77209 ?auto_77213 ) ) ( not ( = ?auto_77209 ?auto_77214 ) ) ( not ( = ?auto_77210 ?auto_77211 ) ) ( not ( = ?auto_77210 ?auto_77212 ) ) ( not ( = ?auto_77210 ?auto_77213 ) ) ( not ( = ?auto_77210 ?auto_77214 ) ) ( not ( = ?auto_77211 ?auto_77212 ) ) ( not ( = ?auto_77211 ?auto_77213 ) ) ( not ( = ?auto_77211 ?auto_77214 ) ) ( not ( = ?auto_77212 ?auto_77213 ) ) ( not ( = ?auto_77212 ?auto_77214 ) ) ( not ( = ?auto_77213 ?auto_77214 ) ) )
    :subtasks
    ( ( !STACK ?auto_77214 ?auto_77213 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77215 - BLOCK
      ?auto_77216 - BLOCK
      ?auto_77217 - BLOCK
      ?auto_77218 - BLOCK
      ?auto_77219 - BLOCK
      ?auto_77220 - BLOCK
      ?auto_77221 - BLOCK
    )
    :vars
    (
      ?auto_77222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77220 ) ( ON-TABLE ?auto_77215 ) ( ON ?auto_77216 ?auto_77215 ) ( ON ?auto_77217 ?auto_77216 ) ( ON ?auto_77218 ?auto_77217 ) ( ON ?auto_77219 ?auto_77218 ) ( ON ?auto_77220 ?auto_77219 ) ( not ( = ?auto_77215 ?auto_77216 ) ) ( not ( = ?auto_77215 ?auto_77217 ) ) ( not ( = ?auto_77215 ?auto_77218 ) ) ( not ( = ?auto_77215 ?auto_77219 ) ) ( not ( = ?auto_77215 ?auto_77220 ) ) ( not ( = ?auto_77215 ?auto_77221 ) ) ( not ( = ?auto_77216 ?auto_77217 ) ) ( not ( = ?auto_77216 ?auto_77218 ) ) ( not ( = ?auto_77216 ?auto_77219 ) ) ( not ( = ?auto_77216 ?auto_77220 ) ) ( not ( = ?auto_77216 ?auto_77221 ) ) ( not ( = ?auto_77217 ?auto_77218 ) ) ( not ( = ?auto_77217 ?auto_77219 ) ) ( not ( = ?auto_77217 ?auto_77220 ) ) ( not ( = ?auto_77217 ?auto_77221 ) ) ( not ( = ?auto_77218 ?auto_77219 ) ) ( not ( = ?auto_77218 ?auto_77220 ) ) ( not ( = ?auto_77218 ?auto_77221 ) ) ( not ( = ?auto_77219 ?auto_77220 ) ) ( not ( = ?auto_77219 ?auto_77221 ) ) ( not ( = ?auto_77220 ?auto_77221 ) ) ( ON ?auto_77221 ?auto_77222 ) ( CLEAR ?auto_77221 ) ( HAND-EMPTY ) ( not ( = ?auto_77215 ?auto_77222 ) ) ( not ( = ?auto_77216 ?auto_77222 ) ) ( not ( = ?auto_77217 ?auto_77222 ) ) ( not ( = ?auto_77218 ?auto_77222 ) ) ( not ( = ?auto_77219 ?auto_77222 ) ) ( not ( = ?auto_77220 ?auto_77222 ) ) ( not ( = ?auto_77221 ?auto_77222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77221 ?auto_77222 )
      ( MAKE-7PILE ?auto_77215 ?auto_77216 ?auto_77217 ?auto_77218 ?auto_77219 ?auto_77220 ?auto_77221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77223 - BLOCK
      ?auto_77224 - BLOCK
      ?auto_77225 - BLOCK
      ?auto_77226 - BLOCK
      ?auto_77227 - BLOCK
      ?auto_77228 - BLOCK
      ?auto_77229 - BLOCK
    )
    :vars
    (
      ?auto_77230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77223 ) ( ON ?auto_77224 ?auto_77223 ) ( ON ?auto_77225 ?auto_77224 ) ( ON ?auto_77226 ?auto_77225 ) ( ON ?auto_77227 ?auto_77226 ) ( not ( = ?auto_77223 ?auto_77224 ) ) ( not ( = ?auto_77223 ?auto_77225 ) ) ( not ( = ?auto_77223 ?auto_77226 ) ) ( not ( = ?auto_77223 ?auto_77227 ) ) ( not ( = ?auto_77223 ?auto_77228 ) ) ( not ( = ?auto_77223 ?auto_77229 ) ) ( not ( = ?auto_77224 ?auto_77225 ) ) ( not ( = ?auto_77224 ?auto_77226 ) ) ( not ( = ?auto_77224 ?auto_77227 ) ) ( not ( = ?auto_77224 ?auto_77228 ) ) ( not ( = ?auto_77224 ?auto_77229 ) ) ( not ( = ?auto_77225 ?auto_77226 ) ) ( not ( = ?auto_77225 ?auto_77227 ) ) ( not ( = ?auto_77225 ?auto_77228 ) ) ( not ( = ?auto_77225 ?auto_77229 ) ) ( not ( = ?auto_77226 ?auto_77227 ) ) ( not ( = ?auto_77226 ?auto_77228 ) ) ( not ( = ?auto_77226 ?auto_77229 ) ) ( not ( = ?auto_77227 ?auto_77228 ) ) ( not ( = ?auto_77227 ?auto_77229 ) ) ( not ( = ?auto_77228 ?auto_77229 ) ) ( ON ?auto_77229 ?auto_77230 ) ( CLEAR ?auto_77229 ) ( not ( = ?auto_77223 ?auto_77230 ) ) ( not ( = ?auto_77224 ?auto_77230 ) ) ( not ( = ?auto_77225 ?auto_77230 ) ) ( not ( = ?auto_77226 ?auto_77230 ) ) ( not ( = ?auto_77227 ?auto_77230 ) ) ( not ( = ?auto_77228 ?auto_77230 ) ) ( not ( = ?auto_77229 ?auto_77230 ) ) ( HOLDING ?auto_77228 ) ( CLEAR ?auto_77227 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77223 ?auto_77224 ?auto_77225 ?auto_77226 ?auto_77227 ?auto_77228 )
      ( MAKE-7PILE ?auto_77223 ?auto_77224 ?auto_77225 ?auto_77226 ?auto_77227 ?auto_77228 ?auto_77229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77231 - BLOCK
      ?auto_77232 - BLOCK
      ?auto_77233 - BLOCK
      ?auto_77234 - BLOCK
      ?auto_77235 - BLOCK
      ?auto_77236 - BLOCK
      ?auto_77237 - BLOCK
    )
    :vars
    (
      ?auto_77238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77231 ) ( ON ?auto_77232 ?auto_77231 ) ( ON ?auto_77233 ?auto_77232 ) ( ON ?auto_77234 ?auto_77233 ) ( ON ?auto_77235 ?auto_77234 ) ( not ( = ?auto_77231 ?auto_77232 ) ) ( not ( = ?auto_77231 ?auto_77233 ) ) ( not ( = ?auto_77231 ?auto_77234 ) ) ( not ( = ?auto_77231 ?auto_77235 ) ) ( not ( = ?auto_77231 ?auto_77236 ) ) ( not ( = ?auto_77231 ?auto_77237 ) ) ( not ( = ?auto_77232 ?auto_77233 ) ) ( not ( = ?auto_77232 ?auto_77234 ) ) ( not ( = ?auto_77232 ?auto_77235 ) ) ( not ( = ?auto_77232 ?auto_77236 ) ) ( not ( = ?auto_77232 ?auto_77237 ) ) ( not ( = ?auto_77233 ?auto_77234 ) ) ( not ( = ?auto_77233 ?auto_77235 ) ) ( not ( = ?auto_77233 ?auto_77236 ) ) ( not ( = ?auto_77233 ?auto_77237 ) ) ( not ( = ?auto_77234 ?auto_77235 ) ) ( not ( = ?auto_77234 ?auto_77236 ) ) ( not ( = ?auto_77234 ?auto_77237 ) ) ( not ( = ?auto_77235 ?auto_77236 ) ) ( not ( = ?auto_77235 ?auto_77237 ) ) ( not ( = ?auto_77236 ?auto_77237 ) ) ( ON ?auto_77237 ?auto_77238 ) ( not ( = ?auto_77231 ?auto_77238 ) ) ( not ( = ?auto_77232 ?auto_77238 ) ) ( not ( = ?auto_77233 ?auto_77238 ) ) ( not ( = ?auto_77234 ?auto_77238 ) ) ( not ( = ?auto_77235 ?auto_77238 ) ) ( not ( = ?auto_77236 ?auto_77238 ) ) ( not ( = ?auto_77237 ?auto_77238 ) ) ( CLEAR ?auto_77235 ) ( ON ?auto_77236 ?auto_77237 ) ( CLEAR ?auto_77236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77238 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77238 ?auto_77237 )
      ( MAKE-7PILE ?auto_77231 ?auto_77232 ?auto_77233 ?auto_77234 ?auto_77235 ?auto_77236 ?auto_77237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77239 - BLOCK
      ?auto_77240 - BLOCK
      ?auto_77241 - BLOCK
      ?auto_77242 - BLOCK
      ?auto_77243 - BLOCK
      ?auto_77244 - BLOCK
      ?auto_77245 - BLOCK
    )
    :vars
    (
      ?auto_77246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77239 ) ( ON ?auto_77240 ?auto_77239 ) ( ON ?auto_77241 ?auto_77240 ) ( ON ?auto_77242 ?auto_77241 ) ( not ( = ?auto_77239 ?auto_77240 ) ) ( not ( = ?auto_77239 ?auto_77241 ) ) ( not ( = ?auto_77239 ?auto_77242 ) ) ( not ( = ?auto_77239 ?auto_77243 ) ) ( not ( = ?auto_77239 ?auto_77244 ) ) ( not ( = ?auto_77239 ?auto_77245 ) ) ( not ( = ?auto_77240 ?auto_77241 ) ) ( not ( = ?auto_77240 ?auto_77242 ) ) ( not ( = ?auto_77240 ?auto_77243 ) ) ( not ( = ?auto_77240 ?auto_77244 ) ) ( not ( = ?auto_77240 ?auto_77245 ) ) ( not ( = ?auto_77241 ?auto_77242 ) ) ( not ( = ?auto_77241 ?auto_77243 ) ) ( not ( = ?auto_77241 ?auto_77244 ) ) ( not ( = ?auto_77241 ?auto_77245 ) ) ( not ( = ?auto_77242 ?auto_77243 ) ) ( not ( = ?auto_77242 ?auto_77244 ) ) ( not ( = ?auto_77242 ?auto_77245 ) ) ( not ( = ?auto_77243 ?auto_77244 ) ) ( not ( = ?auto_77243 ?auto_77245 ) ) ( not ( = ?auto_77244 ?auto_77245 ) ) ( ON ?auto_77245 ?auto_77246 ) ( not ( = ?auto_77239 ?auto_77246 ) ) ( not ( = ?auto_77240 ?auto_77246 ) ) ( not ( = ?auto_77241 ?auto_77246 ) ) ( not ( = ?auto_77242 ?auto_77246 ) ) ( not ( = ?auto_77243 ?auto_77246 ) ) ( not ( = ?auto_77244 ?auto_77246 ) ) ( not ( = ?auto_77245 ?auto_77246 ) ) ( ON ?auto_77244 ?auto_77245 ) ( CLEAR ?auto_77244 ) ( ON-TABLE ?auto_77246 ) ( HOLDING ?auto_77243 ) ( CLEAR ?auto_77242 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77239 ?auto_77240 ?auto_77241 ?auto_77242 ?auto_77243 )
      ( MAKE-7PILE ?auto_77239 ?auto_77240 ?auto_77241 ?auto_77242 ?auto_77243 ?auto_77244 ?auto_77245 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77247 - BLOCK
      ?auto_77248 - BLOCK
      ?auto_77249 - BLOCK
      ?auto_77250 - BLOCK
      ?auto_77251 - BLOCK
      ?auto_77252 - BLOCK
      ?auto_77253 - BLOCK
    )
    :vars
    (
      ?auto_77254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77247 ) ( ON ?auto_77248 ?auto_77247 ) ( ON ?auto_77249 ?auto_77248 ) ( ON ?auto_77250 ?auto_77249 ) ( not ( = ?auto_77247 ?auto_77248 ) ) ( not ( = ?auto_77247 ?auto_77249 ) ) ( not ( = ?auto_77247 ?auto_77250 ) ) ( not ( = ?auto_77247 ?auto_77251 ) ) ( not ( = ?auto_77247 ?auto_77252 ) ) ( not ( = ?auto_77247 ?auto_77253 ) ) ( not ( = ?auto_77248 ?auto_77249 ) ) ( not ( = ?auto_77248 ?auto_77250 ) ) ( not ( = ?auto_77248 ?auto_77251 ) ) ( not ( = ?auto_77248 ?auto_77252 ) ) ( not ( = ?auto_77248 ?auto_77253 ) ) ( not ( = ?auto_77249 ?auto_77250 ) ) ( not ( = ?auto_77249 ?auto_77251 ) ) ( not ( = ?auto_77249 ?auto_77252 ) ) ( not ( = ?auto_77249 ?auto_77253 ) ) ( not ( = ?auto_77250 ?auto_77251 ) ) ( not ( = ?auto_77250 ?auto_77252 ) ) ( not ( = ?auto_77250 ?auto_77253 ) ) ( not ( = ?auto_77251 ?auto_77252 ) ) ( not ( = ?auto_77251 ?auto_77253 ) ) ( not ( = ?auto_77252 ?auto_77253 ) ) ( ON ?auto_77253 ?auto_77254 ) ( not ( = ?auto_77247 ?auto_77254 ) ) ( not ( = ?auto_77248 ?auto_77254 ) ) ( not ( = ?auto_77249 ?auto_77254 ) ) ( not ( = ?auto_77250 ?auto_77254 ) ) ( not ( = ?auto_77251 ?auto_77254 ) ) ( not ( = ?auto_77252 ?auto_77254 ) ) ( not ( = ?auto_77253 ?auto_77254 ) ) ( ON ?auto_77252 ?auto_77253 ) ( ON-TABLE ?auto_77254 ) ( CLEAR ?auto_77250 ) ( ON ?auto_77251 ?auto_77252 ) ( CLEAR ?auto_77251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77254 ?auto_77253 ?auto_77252 )
      ( MAKE-7PILE ?auto_77247 ?auto_77248 ?auto_77249 ?auto_77250 ?auto_77251 ?auto_77252 ?auto_77253 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77255 - BLOCK
      ?auto_77256 - BLOCK
      ?auto_77257 - BLOCK
      ?auto_77258 - BLOCK
      ?auto_77259 - BLOCK
      ?auto_77260 - BLOCK
      ?auto_77261 - BLOCK
    )
    :vars
    (
      ?auto_77262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77255 ) ( ON ?auto_77256 ?auto_77255 ) ( ON ?auto_77257 ?auto_77256 ) ( not ( = ?auto_77255 ?auto_77256 ) ) ( not ( = ?auto_77255 ?auto_77257 ) ) ( not ( = ?auto_77255 ?auto_77258 ) ) ( not ( = ?auto_77255 ?auto_77259 ) ) ( not ( = ?auto_77255 ?auto_77260 ) ) ( not ( = ?auto_77255 ?auto_77261 ) ) ( not ( = ?auto_77256 ?auto_77257 ) ) ( not ( = ?auto_77256 ?auto_77258 ) ) ( not ( = ?auto_77256 ?auto_77259 ) ) ( not ( = ?auto_77256 ?auto_77260 ) ) ( not ( = ?auto_77256 ?auto_77261 ) ) ( not ( = ?auto_77257 ?auto_77258 ) ) ( not ( = ?auto_77257 ?auto_77259 ) ) ( not ( = ?auto_77257 ?auto_77260 ) ) ( not ( = ?auto_77257 ?auto_77261 ) ) ( not ( = ?auto_77258 ?auto_77259 ) ) ( not ( = ?auto_77258 ?auto_77260 ) ) ( not ( = ?auto_77258 ?auto_77261 ) ) ( not ( = ?auto_77259 ?auto_77260 ) ) ( not ( = ?auto_77259 ?auto_77261 ) ) ( not ( = ?auto_77260 ?auto_77261 ) ) ( ON ?auto_77261 ?auto_77262 ) ( not ( = ?auto_77255 ?auto_77262 ) ) ( not ( = ?auto_77256 ?auto_77262 ) ) ( not ( = ?auto_77257 ?auto_77262 ) ) ( not ( = ?auto_77258 ?auto_77262 ) ) ( not ( = ?auto_77259 ?auto_77262 ) ) ( not ( = ?auto_77260 ?auto_77262 ) ) ( not ( = ?auto_77261 ?auto_77262 ) ) ( ON ?auto_77260 ?auto_77261 ) ( ON-TABLE ?auto_77262 ) ( ON ?auto_77259 ?auto_77260 ) ( CLEAR ?auto_77259 ) ( HOLDING ?auto_77258 ) ( CLEAR ?auto_77257 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77255 ?auto_77256 ?auto_77257 ?auto_77258 )
      ( MAKE-7PILE ?auto_77255 ?auto_77256 ?auto_77257 ?auto_77258 ?auto_77259 ?auto_77260 ?auto_77261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77263 - BLOCK
      ?auto_77264 - BLOCK
      ?auto_77265 - BLOCK
      ?auto_77266 - BLOCK
      ?auto_77267 - BLOCK
      ?auto_77268 - BLOCK
      ?auto_77269 - BLOCK
    )
    :vars
    (
      ?auto_77270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77263 ) ( ON ?auto_77264 ?auto_77263 ) ( ON ?auto_77265 ?auto_77264 ) ( not ( = ?auto_77263 ?auto_77264 ) ) ( not ( = ?auto_77263 ?auto_77265 ) ) ( not ( = ?auto_77263 ?auto_77266 ) ) ( not ( = ?auto_77263 ?auto_77267 ) ) ( not ( = ?auto_77263 ?auto_77268 ) ) ( not ( = ?auto_77263 ?auto_77269 ) ) ( not ( = ?auto_77264 ?auto_77265 ) ) ( not ( = ?auto_77264 ?auto_77266 ) ) ( not ( = ?auto_77264 ?auto_77267 ) ) ( not ( = ?auto_77264 ?auto_77268 ) ) ( not ( = ?auto_77264 ?auto_77269 ) ) ( not ( = ?auto_77265 ?auto_77266 ) ) ( not ( = ?auto_77265 ?auto_77267 ) ) ( not ( = ?auto_77265 ?auto_77268 ) ) ( not ( = ?auto_77265 ?auto_77269 ) ) ( not ( = ?auto_77266 ?auto_77267 ) ) ( not ( = ?auto_77266 ?auto_77268 ) ) ( not ( = ?auto_77266 ?auto_77269 ) ) ( not ( = ?auto_77267 ?auto_77268 ) ) ( not ( = ?auto_77267 ?auto_77269 ) ) ( not ( = ?auto_77268 ?auto_77269 ) ) ( ON ?auto_77269 ?auto_77270 ) ( not ( = ?auto_77263 ?auto_77270 ) ) ( not ( = ?auto_77264 ?auto_77270 ) ) ( not ( = ?auto_77265 ?auto_77270 ) ) ( not ( = ?auto_77266 ?auto_77270 ) ) ( not ( = ?auto_77267 ?auto_77270 ) ) ( not ( = ?auto_77268 ?auto_77270 ) ) ( not ( = ?auto_77269 ?auto_77270 ) ) ( ON ?auto_77268 ?auto_77269 ) ( ON-TABLE ?auto_77270 ) ( ON ?auto_77267 ?auto_77268 ) ( CLEAR ?auto_77265 ) ( ON ?auto_77266 ?auto_77267 ) ( CLEAR ?auto_77266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77270 ?auto_77269 ?auto_77268 ?auto_77267 )
      ( MAKE-7PILE ?auto_77263 ?auto_77264 ?auto_77265 ?auto_77266 ?auto_77267 ?auto_77268 ?auto_77269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77271 - BLOCK
      ?auto_77272 - BLOCK
      ?auto_77273 - BLOCK
      ?auto_77274 - BLOCK
      ?auto_77275 - BLOCK
      ?auto_77276 - BLOCK
      ?auto_77277 - BLOCK
    )
    :vars
    (
      ?auto_77278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77271 ) ( ON ?auto_77272 ?auto_77271 ) ( not ( = ?auto_77271 ?auto_77272 ) ) ( not ( = ?auto_77271 ?auto_77273 ) ) ( not ( = ?auto_77271 ?auto_77274 ) ) ( not ( = ?auto_77271 ?auto_77275 ) ) ( not ( = ?auto_77271 ?auto_77276 ) ) ( not ( = ?auto_77271 ?auto_77277 ) ) ( not ( = ?auto_77272 ?auto_77273 ) ) ( not ( = ?auto_77272 ?auto_77274 ) ) ( not ( = ?auto_77272 ?auto_77275 ) ) ( not ( = ?auto_77272 ?auto_77276 ) ) ( not ( = ?auto_77272 ?auto_77277 ) ) ( not ( = ?auto_77273 ?auto_77274 ) ) ( not ( = ?auto_77273 ?auto_77275 ) ) ( not ( = ?auto_77273 ?auto_77276 ) ) ( not ( = ?auto_77273 ?auto_77277 ) ) ( not ( = ?auto_77274 ?auto_77275 ) ) ( not ( = ?auto_77274 ?auto_77276 ) ) ( not ( = ?auto_77274 ?auto_77277 ) ) ( not ( = ?auto_77275 ?auto_77276 ) ) ( not ( = ?auto_77275 ?auto_77277 ) ) ( not ( = ?auto_77276 ?auto_77277 ) ) ( ON ?auto_77277 ?auto_77278 ) ( not ( = ?auto_77271 ?auto_77278 ) ) ( not ( = ?auto_77272 ?auto_77278 ) ) ( not ( = ?auto_77273 ?auto_77278 ) ) ( not ( = ?auto_77274 ?auto_77278 ) ) ( not ( = ?auto_77275 ?auto_77278 ) ) ( not ( = ?auto_77276 ?auto_77278 ) ) ( not ( = ?auto_77277 ?auto_77278 ) ) ( ON ?auto_77276 ?auto_77277 ) ( ON-TABLE ?auto_77278 ) ( ON ?auto_77275 ?auto_77276 ) ( ON ?auto_77274 ?auto_77275 ) ( CLEAR ?auto_77274 ) ( HOLDING ?auto_77273 ) ( CLEAR ?auto_77272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77271 ?auto_77272 ?auto_77273 )
      ( MAKE-7PILE ?auto_77271 ?auto_77272 ?auto_77273 ?auto_77274 ?auto_77275 ?auto_77276 ?auto_77277 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77279 - BLOCK
      ?auto_77280 - BLOCK
      ?auto_77281 - BLOCK
      ?auto_77282 - BLOCK
      ?auto_77283 - BLOCK
      ?auto_77284 - BLOCK
      ?auto_77285 - BLOCK
    )
    :vars
    (
      ?auto_77286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77279 ) ( ON ?auto_77280 ?auto_77279 ) ( not ( = ?auto_77279 ?auto_77280 ) ) ( not ( = ?auto_77279 ?auto_77281 ) ) ( not ( = ?auto_77279 ?auto_77282 ) ) ( not ( = ?auto_77279 ?auto_77283 ) ) ( not ( = ?auto_77279 ?auto_77284 ) ) ( not ( = ?auto_77279 ?auto_77285 ) ) ( not ( = ?auto_77280 ?auto_77281 ) ) ( not ( = ?auto_77280 ?auto_77282 ) ) ( not ( = ?auto_77280 ?auto_77283 ) ) ( not ( = ?auto_77280 ?auto_77284 ) ) ( not ( = ?auto_77280 ?auto_77285 ) ) ( not ( = ?auto_77281 ?auto_77282 ) ) ( not ( = ?auto_77281 ?auto_77283 ) ) ( not ( = ?auto_77281 ?auto_77284 ) ) ( not ( = ?auto_77281 ?auto_77285 ) ) ( not ( = ?auto_77282 ?auto_77283 ) ) ( not ( = ?auto_77282 ?auto_77284 ) ) ( not ( = ?auto_77282 ?auto_77285 ) ) ( not ( = ?auto_77283 ?auto_77284 ) ) ( not ( = ?auto_77283 ?auto_77285 ) ) ( not ( = ?auto_77284 ?auto_77285 ) ) ( ON ?auto_77285 ?auto_77286 ) ( not ( = ?auto_77279 ?auto_77286 ) ) ( not ( = ?auto_77280 ?auto_77286 ) ) ( not ( = ?auto_77281 ?auto_77286 ) ) ( not ( = ?auto_77282 ?auto_77286 ) ) ( not ( = ?auto_77283 ?auto_77286 ) ) ( not ( = ?auto_77284 ?auto_77286 ) ) ( not ( = ?auto_77285 ?auto_77286 ) ) ( ON ?auto_77284 ?auto_77285 ) ( ON-TABLE ?auto_77286 ) ( ON ?auto_77283 ?auto_77284 ) ( ON ?auto_77282 ?auto_77283 ) ( CLEAR ?auto_77280 ) ( ON ?auto_77281 ?auto_77282 ) ( CLEAR ?auto_77281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77286 ?auto_77285 ?auto_77284 ?auto_77283 ?auto_77282 )
      ( MAKE-7PILE ?auto_77279 ?auto_77280 ?auto_77281 ?auto_77282 ?auto_77283 ?auto_77284 ?auto_77285 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77287 - BLOCK
      ?auto_77288 - BLOCK
      ?auto_77289 - BLOCK
      ?auto_77290 - BLOCK
      ?auto_77291 - BLOCK
      ?auto_77292 - BLOCK
      ?auto_77293 - BLOCK
    )
    :vars
    (
      ?auto_77294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77287 ) ( not ( = ?auto_77287 ?auto_77288 ) ) ( not ( = ?auto_77287 ?auto_77289 ) ) ( not ( = ?auto_77287 ?auto_77290 ) ) ( not ( = ?auto_77287 ?auto_77291 ) ) ( not ( = ?auto_77287 ?auto_77292 ) ) ( not ( = ?auto_77287 ?auto_77293 ) ) ( not ( = ?auto_77288 ?auto_77289 ) ) ( not ( = ?auto_77288 ?auto_77290 ) ) ( not ( = ?auto_77288 ?auto_77291 ) ) ( not ( = ?auto_77288 ?auto_77292 ) ) ( not ( = ?auto_77288 ?auto_77293 ) ) ( not ( = ?auto_77289 ?auto_77290 ) ) ( not ( = ?auto_77289 ?auto_77291 ) ) ( not ( = ?auto_77289 ?auto_77292 ) ) ( not ( = ?auto_77289 ?auto_77293 ) ) ( not ( = ?auto_77290 ?auto_77291 ) ) ( not ( = ?auto_77290 ?auto_77292 ) ) ( not ( = ?auto_77290 ?auto_77293 ) ) ( not ( = ?auto_77291 ?auto_77292 ) ) ( not ( = ?auto_77291 ?auto_77293 ) ) ( not ( = ?auto_77292 ?auto_77293 ) ) ( ON ?auto_77293 ?auto_77294 ) ( not ( = ?auto_77287 ?auto_77294 ) ) ( not ( = ?auto_77288 ?auto_77294 ) ) ( not ( = ?auto_77289 ?auto_77294 ) ) ( not ( = ?auto_77290 ?auto_77294 ) ) ( not ( = ?auto_77291 ?auto_77294 ) ) ( not ( = ?auto_77292 ?auto_77294 ) ) ( not ( = ?auto_77293 ?auto_77294 ) ) ( ON ?auto_77292 ?auto_77293 ) ( ON-TABLE ?auto_77294 ) ( ON ?auto_77291 ?auto_77292 ) ( ON ?auto_77290 ?auto_77291 ) ( ON ?auto_77289 ?auto_77290 ) ( CLEAR ?auto_77289 ) ( HOLDING ?auto_77288 ) ( CLEAR ?auto_77287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77287 ?auto_77288 )
      ( MAKE-7PILE ?auto_77287 ?auto_77288 ?auto_77289 ?auto_77290 ?auto_77291 ?auto_77292 ?auto_77293 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77295 - BLOCK
      ?auto_77296 - BLOCK
      ?auto_77297 - BLOCK
      ?auto_77298 - BLOCK
      ?auto_77299 - BLOCK
      ?auto_77300 - BLOCK
      ?auto_77301 - BLOCK
    )
    :vars
    (
      ?auto_77302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77295 ) ( not ( = ?auto_77295 ?auto_77296 ) ) ( not ( = ?auto_77295 ?auto_77297 ) ) ( not ( = ?auto_77295 ?auto_77298 ) ) ( not ( = ?auto_77295 ?auto_77299 ) ) ( not ( = ?auto_77295 ?auto_77300 ) ) ( not ( = ?auto_77295 ?auto_77301 ) ) ( not ( = ?auto_77296 ?auto_77297 ) ) ( not ( = ?auto_77296 ?auto_77298 ) ) ( not ( = ?auto_77296 ?auto_77299 ) ) ( not ( = ?auto_77296 ?auto_77300 ) ) ( not ( = ?auto_77296 ?auto_77301 ) ) ( not ( = ?auto_77297 ?auto_77298 ) ) ( not ( = ?auto_77297 ?auto_77299 ) ) ( not ( = ?auto_77297 ?auto_77300 ) ) ( not ( = ?auto_77297 ?auto_77301 ) ) ( not ( = ?auto_77298 ?auto_77299 ) ) ( not ( = ?auto_77298 ?auto_77300 ) ) ( not ( = ?auto_77298 ?auto_77301 ) ) ( not ( = ?auto_77299 ?auto_77300 ) ) ( not ( = ?auto_77299 ?auto_77301 ) ) ( not ( = ?auto_77300 ?auto_77301 ) ) ( ON ?auto_77301 ?auto_77302 ) ( not ( = ?auto_77295 ?auto_77302 ) ) ( not ( = ?auto_77296 ?auto_77302 ) ) ( not ( = ?auto_77297 ?auto_77302 ) ) ( not ( = ?auto_77298 ?auto_77302 ) ) ( not ( = ?auto_77299 ?auto_77302 ) ) ( not ( = ?auto_77300 ?auto_77302 ) ) ( not ( = ?auto_77301 ?auto_77302 ) ) ( ON ?auto_77300 ?auto_77301 ) ( ON-TABLE ?auto_77302 ) ( ON ?auto_77299 ?auto_77300 ) ( ON ?auto_77298 ?auto_77299 ) ( ON ?auto_77297 ?auto_77298 ) ( CLEAR ?auto_77295 ) ( ON ?auto_77296 ?auto_77297 ) ( CLEAR ?auto_77296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77302 ?auto_77301 ?auto_77300 ?auto_77299 ?auto_77298 ?auto_77297 )
      ( MAKE-7PILE ?auto_77295 ?auto_77296 ?auto_77297 ?auto_77298 ?auto_77299 ?auto_77300 ?auto_77301 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77303 - BLOCK
      ?auto_77304 - BLOCK
      ?auto_77305 - BLOCK
      ?auto_77306 - BLOCK
      ?auto_77307 - BLOCK
      ?auto_77308 - BLOCK
      ?auto_77309 - BLOCK
    )
    :vars
    (
      ?auto_77310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77303 ?auto_77304 ) ) ( not ( = ?auto_77303 ?auto_77305 ) ) ( not ( = ?auto_77303 ?auto_77306 ) ) ( not ( = ?auto_77303 ?auto_77307 ) ) ( not ( = ?auto_77303 ?auto_77308 ) ) ( not ( = ?auto_77303 ?auto_77309 ) ) ( not ( = ?auto_77304 ?auto_77305 ) ) ( not ( = ?auto_77304 ?auto_77306 ) ) ( not ( = ?auto_77304 ?auto_77307 ) ) ( not ( = ?auto_77304 ?auto_77308 ) ) ( not ( = ?auto_77304 ?auto_77309 ) ) ( not ( = ?auto_77305 ?auto_77306 ) ) ( not ( = ?auto_77305 ?auto_77307 ) ) ( not ( = ?auto_77305 ?auto_77308 ) ) ( not ( = ?auto_77305 ?auto_77309 ) ) ( not ( = ?auto_77306 ?auto_77307 ) ) ( not ( = ?auto_77306 ?auto_77308 ) ) ( not ( = ?auto_77306 ?auto_77309 ) ) ( not ( = ?auto_77307 ?auto_77308 ) ) ( not ( = ?auto_77307 ?auto_77309 ) ) ( not ( = ?auto_77308 ?auto_77309 ) ) ( ON ?auto_77309 ?auto_77310 ) ( not ( = ?auto_77303 ?auto_77310 ) ) ( not ( = ?auto_77304 ?auto_77310 ) ) ( not ( = ?auto_77305 ?auto_77310 ) ) ( not ( = ?auto_77306 ?auto_77310 ) ) ( not ( = ?auto_77307 ?auto_77310 ) ) ( not ( = ?auto_77308 ?auto_77310 ) ) ( not ( = ?auto_77309 ?auto_77310 ) ) ( ON ?auto_77308 ?auto_77309 ) ( ON-TABLE ?auto_77310 ) ( ON ?auto_77307 ?auto_77308 ) ( ON ?auto_77306 ?auto_77307 ) ( ON ?auto_77305 ?auto_77306 ) ( ON ?auto_77304 ?auto_77305 ) ( CLEAR ?auto_77304 ) ( HOLDING ?auto_77303 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77303 )
      ( MAKE-7PILE ?auto_77303 ?auto_77304 ?auto_77305 ?auto_77306 ?auto_77307 ?auto_77308 ?auto_77309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77311 - BLOCK
      ?auto_77312 - BLOCK
      ?auto_77313 - BLOCK
      ?auto_77314 - BLOCK
      ?auto_77315 - BLOCK
      ?auto_77316 - BLOCK
      ?auto_77317 - BLOCK
    )
    :vars
    (
      ?auto_77318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77311 ?auto_77312 ) ) ( not ( = ?auto_77311 ?auto_77313 ) ) ( not ( = ?auto_77311 ?auto_77314 ) ) ( not ( = ?auto_77311 ?auto_77315 ) ) ( not ( = ?auto_77311 ?auto_77316 ) ) ( not ( = ?auto_77311 ?auto_77317 ) ) ( not ( = ?auto_77312 ?auto_77313 ) ) ( not ( = ?auto_77312 ?auto_77314 ) ) ( not ( = ?auto_77312 ?auto_77315 ) ) ( not ( = ?auto_77312 ?auto_77316 ) ) ( not ( = ?auto_77312 ?auto_77317 ) ) ( not ( = ?auto_77313 ?auto_77314 ) ) ( not ( = ?auto_77313 ?auto_77315 ) ) ( not ( = ?auto_77313 ?auto_77316 ) ) ( not ( = ?auto_77313 ?auto_77317 ) ) ( not ( = ?auto_77314 ?auto_77315 ) ) ( not ( = ?auto_77314 ?auto_77316 ) ) ( not ( = ?auto_77314 ?auto_77317 ) ) ( not ( = ?auto_77315 ?auto_77316 ) ) ( not ( = ?auto_77315 ?auto_77317 ) ) ( not ( = ?auto_77316 ?auto_77317 ) ) ( ON ?auto_77317 ?auto_77318 ) ( not ( = ?auto_77311 ?auto_77318 ) ) ( not ( = ?auto_77312 ?auto_77318 ) ) ( not ( = ?auto_77313 ?auto_77318 ) ) ( not ( = ?auto_77314 ?auto_77318 ) ) ( not ( = ?auto_77315 ?auto_77318 ) ) ( not ( = ?auto_77316 ?auto_77318 ) ) ( not ( = ?auto_77317 ?auto_77318 ) ) ( ON ?auto_77316 ?auto_77317 ) ( ON-TABLE ?auto_77318 ) ( ON ?auto_77315 ?auto_77316 ) ( ON ?auto_77314 ?auto_77315 ) ( ON ?auto_77313 ?auto_77314 ) ( ON ?auto_77312 ?auto_77313 ) ( ON ?auto_77311 ?auto_77312 ) ( CLEAR ?auto_77311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77318 ?auto_77317 ?auto_77316 ?auto_77315 ?auto_77314 ?auto_77313 ?auto_77312 )
      ( MAKE-7PILE ?auto_77311 ?auto_77312 ?auto_77313 ?auto_77314 ?auto_77315 ?auto_77316 ?auto_77317 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77425 - BLOCK
    )
    :vars
    (
      ?auto_77426 - BLOCK
      ?auto_77427 - BLOCK
      ?auto_77428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77425 ?auto_77426 ) ( CLEAR ?auto_77425 ) ( not ( = ?auto_77425 ?auto_77426 ) ) ( HOLDING ?auto_77427 ) ( CLEAR ?auto_77428 ) ( not ( = ?auto_77425 ?auto_77427 ) ) ( not ( = ?auto_77425 ?auto_77428 ) ) ( not ( = ?auto_77426 ?auto_77427 ) ) ( not ( = ?auto_77426 ?auto_77428 ) ) ( not ( = ?auto_77427 ?auto_77428 ) ) )
    :subtasks
    ( ( !STACK ?auto_77427 ?auto_77428 )
      ( MAKE-1PILE ?auto_77425 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77429 - BLOCK
    )
    :vars
    (
      ?auto_77432 - BLOCK
      ?auto_77430 - BLOCK
      ?auto_77431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77429 ?auto_77432 ) ( not ( = ?auto_77429 ?auto_77432 ) ) ( CLEAR ?auto_77430 ) ( not ( = ?auto_77429 ?auto_77431 ) ) ( not ( = ?auto_77429 ?auto_77430 ) ) ( not ( = ?auto_77432 ?auto_77431 ) ) ( not ( = ?auto_77432 ?auto_77430 ) ) ( not ( = ?auto_77431 ?auto_77430 ) ) ( ON ?auto_77431 ?auto_77429 ) ( CLEAR ?auto_77431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77432 ?auto_77429 )
      ( MAKE-1PILE ?auto_77429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77433 - BLOCK
    )
    :vars
    (
      ?auto_77436 - BLOCK
      ?auto_77435 - BLOCK
      ?auto_77434 - BLOCK
      ?auto_77437 - BLOCK
      ?auto_77440 - BLOCK
      ?auto_77439 - BLOCK
      ?auto_77438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77433 ?auto_77436 ) ( not ( = ?auto_77433 ?auto_77436 ) ) ( not ( = ?auto_77433 ?auto_77435 ) ) ( not ( = ?auto_77433 ?auto_77434 ) ) ( not ( = ?auto_77436 ?auto_77435 ) ) ( not ( = ?auto_77436 ?auto_77434 ) ) ( not ( = ?auto_77435 ?auto_77434 ) ) ( ON ?auto_77435 ?auto_77433 ) ( CLEAR ?auto_77435 ) ( ON-TABLE ?auto_77436 ) ( HOLDING ?auto_77434 ) ( CLEAR ?auto_77437 ) ( ON-TABLE ?auto_77440 ) ( ON ?auto_77439 ?auto_77440 ) ( ON ?auto_77438 ?auto_77439 ) ( ON ?auto_77437 ?auto_77438 ) ( not ( = ?auto_77440 ?auto_77439 ) ) ( not ( = ?auto_77440 ?auto_77438 ) ) ( not ( = ?auto_77440 ?auto_77437 ) ) ( not ( = ?auto_77440 ?auto_77434 ) ) ( not ( = ?auto_77439 ?auto_77438 ) ) ( not ( = ?auto_77439 ?auto_77437 ) ) ( not ( = ?auto_77439 ?auto_77434 ) ) ( not ( = ?auto_77438 ?auto_77437 ) ) ( not ( = ?auto_77438 ?auto_77434 ) ) ( not ( = ?auto_77437 ?auto_77434 ) ) ( not ( = ?auto_77433 ?auto_77437 ) ) ( not ( = ?auto_77433 ?auto_77440 ) ) ( not ( = ?auto_77433 ?auto_77439 ) ) ( not ( = ?auto_77433 ?auto_77438 ) ) ( not ( = ?auto_77436 ?auto_77437 ) ) ( not ( = ?auto_77436 ?auto_77440 ) ) ( not ( = ?auto_77436 ?auto_77439 ) ) ( not ( = ?auto_77436 ?auto_77438 ) ) ( not ( = ?auto_77435 ?auto_77437 ) ) ( not ( = ?auto_77435 ?auto_77440 ) ) ( not ( = ?auto_77435 ?auto_77439 ) ) ( not ( = ?auto_77435 ?auto_77438 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77440 ?auto_77439 ?auto_77438 ?auto_77437 ?auto_77434 )
      ( MAKE-1PILE ?auto_77433 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77441 - BLOCK
    )
    :vars
    (
      ?auto_77446 - BLOCK
      ?auto_77445 - BLOCK
      ?auto_77447 - BLOCK
      ?auto_77444 - BLOCK
      ?auto_77448 - BLOCK
      ?auto_77443 - BLOCK
      ?auto_77442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77441 ?auto_77446 ) ( not ( = ?auto_77441 ?auto_77446 ) ) ( not ( = ?auto_77441 ?auto_77445 ) ) ( not ( = ?auto_77441 ?auto_77447 ) ) ( not ( = ?auto_77446 ?auto_77445 ) ) ( not ( = ?auto_77446 ?auto_77447 ) ) ( not ( = ?auto_77445 ?auto_77447 ) ) ( ON ?auto_77445 ?auto_77441 ) ( ON-TABLE ?auto_77446 ) ( CLEAR ?auto_77444 ) ( ON-TABLE ?auto_77448 ) ( ON ?auto_77443 ?auto_77448 ) ( ON ?auto_77442 ?auto_77443 ) ( ON ?auto_77444 ?auto_77442 ) ( not ( = ?auto_77448 ?auto_77443 ) ) ( not ( = ?auto_77448 ?auto_77442 ) ) ( not ( = ?auto_77448 ?auto_77444 ) ) ( not ( = ?auto_77448 ?auto_77447 ) ) ( not ( = ?auto_77443 ?auto_77442 ) ) ( not ( = ?auto_77443 ?auto_77444 ) ) ( not ( = ?auto_77443 ?auto_77447 ) ) ( not ( = ?auto_77442 ?auto_77444 ) ) ( not ( = ?auto_77442 ?auto_77447 ) ) ( not ( = ?auto_77444 ?auto_77447 ) ) ( not ( = ?auto_77441 ?auto_77444 ) ) ( not ( = ?auto_77441 ?auto_77448 ) ) ( not ( = ?auto_77441 ?auto_77443 ) ) ( not ( = ?auto_77441 ?auto_77442 ) ) ( not ( = ?auto_77446 ?auto_77444 ) ) ( not ( = ?auto_77446 ?auto_77448 ) ) ( not ( = ?auto_77446 ?auto_77443 ) ) ( not ( = ?auto_77446 ?auto_77442 ) ) ( not ( = ?auto_77445 ?auto_77444 ) ) ( not ( = ?auto_77445 ?auto_77448 ) ) ( not ( = ?auto_77445 ?auto_77443 ) ) ( not ( = ?auto_77445 ?auto_77442 ) ) ( ON ?auto_77447 ?auto_77445 ) ( CLEAR ?auto_77447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77446 ?auto_77441 ?auto_77445 )
      ( MAKE-1PILE ?auto_77441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77449 - BLOCK
    )
    :vars
    (
      ?auto_77455 - BLOCK
      ?auto_77453 - BLOCK
      ?auto_77454 - BLOCK
      ?auto_77452 - BLOCK
      ?auto_77456 - BLOCK
      ?auto_77451 - BLOCK
      ?auto_77450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77449 ?auto_77455 ) ( not ( = ?auto_77449 ?auto_77455 ) ) ( not ( = ?auto_77449 ?auto_77453 ) ) ( not ( = ?auto_77449 ?auto_77454 ) ) ( not ( = ?auto_77455 ?auto_77453 ) ) ( not ( = ?auto_77455 ?auto_77454 ) ) ( not ( = ?auto_77453 ?auto_77454 ) ) ( ON ?auto_77453 ?auto_77449 ) ( ON-TABLE ?auto_77455 ) ( ON-TABLE ?auto_77452 ) ( ON ?auto_77456 ?auto_77452 ) ( ON ?auto_77451 ?auto_77456 ) ( not ( = ?auto_77452 ?auto_77456 ) ) ( not ( = ?auto_77452 ?auto_77451 ) ) ( not ( = ?auto_77452 ?auto_77450 ) ) ( not ( = ?auto_77452 ?auto_77454 ) ) ( not ( = ?auto_77456 ?auto_77451 ) ) ( not ( = ?auto_77456 ?auto_77450 ) ) ( not ( = ?auto_77456 ?auto_77454 ) ) ( not ( = ?auto_77451 ?auto_77450 ) ) ( not ( = ?auto_77451 ?auto_77454 ) ) ( not ( = ?auto_77450 ?auto_77454 ) ) ( not ( = ?auto_77449 ?auto_77450 ) ) ( not ( = ?auto_77449 ?auto_77452 ) ) ( not ( = ?auto_77449 ?auto_77456 ) ) ( not ( = ?auto_77449 ?auto_77451 ) ) ( not ( = ?auto_77455 ?auto_77450 ) ) ( not ( = ?auto_77455 ?auto_77452 ) ) ( not ( = ?auto_77455 ?auto_77456 ) ) ( not ( = ?auto_77455 ?auto_77451 ) ) ( not ( = ?auto_77453 ?auto_77450 ) ) ( not ( = ?auto_77453 ?auto_77452 ) ) ( not ( = ?auto_77453 ?auto_77456 ) ) ( not ( = ?auto_77453 ?auto_77451 ) ) ( ON ?auto_77454 ?auto_77453 ) ( CLEAR ?auto_77454 ) ( HOLDING ?auto_77450 ) ( CLEAR ?auto_77451 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77452 ?auto_77456 ?auto_77451 ?auto_77450 )
      ( MAKE-1PILE ?auto_77449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77457 - BLOCK
    )
    :vars
    (
      ?auto_77463 - BLOCK
      ?auto_77460 - BLOCK
      ?auto_77464 - BLOCK
      ?auto_77458 - BLOCK
      ?auto_77459 - BLOCK
      ?auto_77462 - BLOCK
      ?auto_77461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77457 ?auto_77463 ) ( not ( = ?auto_77457 ?auto_77463 ) ) ( not ( = ?auto_77457 ?auto_77460 ) ) ( not ( = ?auto_77457 ?auto_77464 ) ) ( not ( = ?auto_77463 ?auto_77460 ) ) ( not ( = ?auto_77463 ?auto_77464 ) ) ( not ( = ?auto_77460 ?auto_77464 ) ) ( ON ?auto_77460 ?auto_77457 ) ( ON-TABLE ?auto_77463 ) ( ON-TABLE ?auto_77458 ) ( ON ?auto_77459 ?auto_77458 ) ( ON ?auto_77462 ?auto_77459 ) ( not ( = ?auto_77458 ?auto_77459 ) ) ( not ( = ?auto_77458 ?auto_77462 ) ) ( not ( = ?auto_77458 ?auto_77461 ) ) ( not ( = ?auto_77458 ?auto_77464 ) ) ( not ( = ?auto_77459 ?auto_77462 ) ) ( not ( = ?auto_77459 ?auto_77461 ) ) ( not ( = ?auto_77459 ?auto_77464 ) ) ( not ( = ?auto_77462 ?auto_77461 ) ) ( not ( = ?auto_77462 ?auto_77464 ) ) ( not ( = ?auto_77461 ?auto_77464 ) ) ( not ( = ?auto_77457 ?auto_77461 ) ) ( not ( = ?auto_77457 ?auto_77458 ) ) ( not ( = ?auto_77457 ?auto_77459 ) ) ( not ( = ?auto_77457 ?auto_77462 ) ) ( not ( = ?auto_77463 ?auto_77461 ) ) ( not ( = ?auto_77463 ?auto_77458 ) ) ( not ( = ?auto_77463 ?auto_77459 ) ) ( not ( = ?auto_77463 ?auto_77462 ) ) ( not ( = ?auto_77460 ?auto_77461 ) ) ( not ( = ?auto_77460 ?auto_77458 ) ) ( not ( = ?auto_77460 ?auto_77459 ) ) ( not ( = ?auto_77460 ?auto_77462 ) ) ( ON ?auto_77464 ?auto_77460 ) ( CLEAR ?auto_77462 ) ( ON ?auto_77461 ?auto_77464 ) ( CLEAR ?auto_77461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77463 ?auto_77457 ?auto_77460 ?auto_77464 )
      ( MAKE-1PILE ?auto_77457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77465 - BLOCK
    )
    :vars
    (
      ?auto_77472 - BLOCK
      ?auto_77469 - BLOCK
      ?auto_77468 - BLOCK
      ?auto_77467 - BLOCK
      ?auto_77471 - BLOCK
      ?auto_77470 - BLOCK
      ?auto_77466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77465 ?auto_77472 ) ( not ( = ?auto_77465 ?auto_77472 ) ) ( not ( = ?auto_77465 ?auto_77469 ) ) ( not ( = ?auto_77465 ?auto_77468 ) ) ( not ( = ?auto_77472 ?auto_77469 ) ) ( not ( = ?auto_77472 ?auto_77468 ) ) ( not ( = ?auto_77469 ?auto_77468 ) ) ( ON ?auto_77469 ?auto_77465 ) ( ON-TABLE ?auto_77472 ) ( ON-TABLE ?auto_77467 ) ( ON ?auto_77471 ?auto_77467 ) ( not ( = ?auto_77467 ?auto_77471 ) ) ( not ( = ?auto_77467 ?auto_77470 ) ) ( not ( = ?auto_77467 ?auto_77466 ) ) ( not ( = ?auto_77467 ?auto_77468 ) ) ( not ( = ?auto_77471 ?auto_77470 ) ) ( not ( = ?auto_77471 ?auto_77466 ) ) ( not ( = ?auto_77471 ?auto_77468 ) ) ( not ( = ?auto_77470 ?auto_77466 ) ) ( not ( = ?auto_77470 ?auto_77468 ) ) ( not ( = ?auto_77466 ?auto_77468 ) ) ( not ( = ?auto_77465 ?auto_77466 ) ) ( not ( = ?auto_77465 ?auto_77467 ) ) ( not ( = ?auto_77465 ?auto_77471 ) ) ( not ( = ?auto_77465 ?auto_77470 ) ) ( not ( = ?auto_77472 ?auto_77466 ) ) ( not ( = ?auto_77472 ?auto_77467 ) ) ( not ( = ?auto_77472 ?auto_77471 ) ) ( not ( = ?auto_77472 ?auto_77470 ) ) ( not ( = ?auto_77469 ?auto_77466 ) ) ( not ( = ?auto_77469 ?auto_77467 ) ) ( not ( = ?auto_77469 ?auto_77471 ) ) ( not ( = ?auto_77469 ?auto_77470 ) ) ( ON ?auto_77468 ?auto_77469 ) ( ON ?auto_77466 ?auto_77468 ) ( CLEAR ?auto_77466 ) ( HOLDING ?auto_77470 ) ( CLEAR ?auto_77471 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77467 ?auto_77471 ?auto_77470 )
      ( MAKE-1PILE ?auto_77465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77473 - BLOCK
    )
    :vars
    (
      ?auto_77480 - BLOCK
      ?auto_77476 - BLOCK
      ?auto_77477 - BLOCK
      ?auto_77474 - BLOCK
      ?auto_77479 - BLOCK
      ?auto_77478 - BLOCK
      ?auto_77475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77473 ?auto_77480 ) ( not ( = ?auto_77473 ?auto_77480 ) ) ( not ( = ?auto_77473 ?auto_77476 ) ) ( not ( = ?auto_77473 ?auto_77477 ) ) ( not ( = ?auto_77480 ?auto_77476 ) ) ( not ( = ?auto_77480 ?auto_77477 ) ) ( not ( = ?auto_77476 ?auto_77477 ) ) ( ON ?auto_77476 ?auto_77473 ) ( ON-TABLE ?auto_77480 ) ( ON-TABLE ?auto_77474 ) ( ON ?auto_77479 ?auto_77474 ) ( not ( = ?auto_77474 ?auto_77479 ) ) ( not ( = ?auto_77474 ?auto_77478 ) ) ( not ( = ?auto_77474 ?auto_77475 ) ) ( not ( = ?auto_77474 ?auto_77477 ) ) ( not ( = ?auto_77479 ?auto_77478 ) ) ( not ( = ?auto_77479 ?auto_77475 ) ) ( not ( = ?auto_77479 ?auto_77477 ) ) ( not ( = ?auto_77478 ?auto_77475 ) ) ( not ( = ?auto_77478 ?auto_77477 ) ) ( not ( = ?auto_77475 ?auto_77477 ) ) ( not ( = ?auto_77473 ?auto_77475 ) ) ( not ( = ?auto_77473 ?auto_77474 ) ) ( not ( = ?auto_77473 ?auto_77479 ) ) ( not ( = ?auto_77473 ?auto_77478 ) ) ( not ( = ?auto_77480 ?auto_77475 ) ) ( not ( = ?auto_77480 ?auto_77474 ) ) ( not ( = ?auto_77480 ?auto_77479 ) ) ( not ( = ?auto_77480 ?auto_77478 ) ) ( not ( = ?auto_77476 ?auto_77475 ) ) ( not ( = ?auto_77476 ?auto_77474 ) ) ( not ( = ?auto_77476 ?auto_77479 ) ) ( not ( = ?auto_77476 ?auto_77478 ) ) ( ON ?auto_77477 ?auto_77476 ) ( ON ?auto_77475 ?auto_77477 ) ( CLEAR ?auto_77479 ) ( ON ?auto_77478 ?auto_77475 ) ( CLEAR ?auto_77478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77480 ?auto_77473 ?auto_77476 ?auto_77477 ?auto_77475 )
      ( MAKE-1PILE ?auto_77473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77481 - BLOCK
    )
    :vars
    (
      ?auto_77487 - BLOCK
      ?auto_77486 - BLOCK
      ?auto_77482 - BLOCK
      ?auto_77484 - BLOCK
      ?auto_77488 - BLOCK
      ?auto_77485 - BLOCK
      ?auto_77483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77481 ?auto_77487 ) ( not ( = ?auto_77481 ?auto_77487 ) ) ( not ( = ?auto_77481 ?auto_77486 ) ) ( not ( = ?auto_77481 ?auto_77482 ) ) ( not ( = ?auto_77487 ?auto_77486 ) ) ( not ( = ?auto_77487 ?auto_77482 ) ) ( not ( = ?auto_77486 ?auto_77482 ) ) ( ON ?auto_77486 ?auto_77481 ) ( ON-TABLE ?auto_77487 ) ( ON-TABLE ?auto_77484 ) ( not ( = ?auto_77484 ?auto_77488 ) ) ( not ( = ?auto_77484 ?auto_77485 ) ) ( not ( = ?auto_77484 ?auto_77483 ) ) ( not ( = ?auto_77484 ?auto_77482 ) ) ( not ( = ?auto_77488 ?auto_77485 ) ) ( not ( = ?auto_77488 ?auto_77483 ) ) ( not ( = ?auto_77488 ?auto_77482 ) ) ( not ( = ?auto_77485 ?auto_77483 ) ) ( not ( = ?auto_77485 ?auto_77482 ) ) ( not ( = ?auto_77483 ?auto_77482 ) ) ( not ( = ?auto_77481 ?auto_77483 ) ) ( not ( = ?auto_77481 ?auto_77484 ) ) ( not ( = ?auto_77481 ?auto_77488 ) ) ( not ( = ?auto_77481 ?auto_77485 ) ) ( not ( = ?auto_77487 ?auto_77483 ) ) ( not ( = ?auto_77487 ?auto_77484 ) ) ( not ( = ?auto_77487 ?auto_77488 ) ) ( not ( = ?auto_77487 ?auto_77485 ) ) ( not ( = ?auto_77486 ?auto_77483 ) ) ( not ( = ?auto_77486 ?auto_77484 ) ) ( not ( = ?auto_77486 ?auto_77488 ) ) ( not ( = ?auto_77486 ?auto_77485 ) ) ( ON ?auto_77482 ?auto_77486 ) ( ON ?auto_77483 ?auto_77482 ) ( ON ?auto_77485 ?auto_77483 ) ( CLEAR ?auto_77485 ) ( HOLDING ?auto_77488 ) ( CLEAR ?auto_77484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77484 ?auto_77488 )
      ( MAKE-1PILE ?auto_77481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77489 - BLOCK
    )
    :vars
    (
      ?auto_77494 - BLOCK
      ?auto_77491 - BLOCK
      ?auto_77495 - BLOCK
      ?auto_77493 - BLOCK
      ?auto_77492 - BLOCK
      ?auto_77496 - BLOCK
      ?auto_77490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77489 ?auto_77494 ) ( not ( = ?auto_77489 ?auto_77494 ) ) ( not ( = ?auto_77489 ?auto_77491 ) ) ( not ( = ?auto_77489 ?auto_77495 ) ) ( not ( = ?auto_77494 ?auto_77491 ) ) ( not ( = ?auto_77494 ?auto_77495 ) ) ( not ( = ?auto_77491 ?auto_77495 ) ) ( ON ?auto_77491 ?auto_77489 ) ( ON-TABLE ?auto_77494 ) ( ON-TABLE ?auto_77493 ) ( not ( = ?auto_77493 ?auto_77492 ) ) ( not ( = ?auto_77493 ?auto_77496 ) ) ( not ( = ?auto_77493 ?auto_77490 ) ) ( not ( = ?auto_77493 ?auto_77495 ) ) ( not ( = ?auto_77492 ?auto_77496 ) ) ( not ( = ?auto_77492 ?auto_77490 ) ) ( not ( = ?auto_77492 ?auto_77495 ) ) ( not ( = ?auto_77496 ?auto_77490 ) ) ( not ( = ?auto_77496 ?auto_77495 ) ) ( not ( = ?auto_77490 ?auto_77495 ) ) ( not ( = ?auto_77489 ?auto_77490 ) ) ( not ( = ?auto_77489 ?auto_77493 ) ) ( not ( = ?auto_77489 ?auto_77492 ) ) ( not ( = ?auto_77489 ?auto_77496 ) ) ( not ( = ?auto_77494 ?auto_77490 ) ) ( not ( = ?auto_77494 ?auto_77493 ) ) ( not ( = ?auto_77494 ?auto_77492 ) ) ( not ( = ?auto_77494 ?auto_77496 ) ) ( not ( = ?auto_77491 ?auto_77490 ) ) ( not ( = ?auto_77491 ?auto_77493 ) ) ( not ( = ?auto_77491 ?auto_77492 ) ) ( not ( = ?auto_77491 ?auto_77496 ) ) ( ON ?auto_77495 ?auto_77491 ) ( ON ?auto_77490 ?auto_77495 ) ( ON ?auto_77496 ?auto_77490 ) ( CLEAR ?auto_77493 ) ( ON ?auto_77492 ?auto_77496 ) ( CLEAR ?auto_77492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77494 ?auto_77489 ?auto_77491 ?auto_77495 ?auto_77490 ?auto_77496 )
      ( MAKE-1PILE ?auto_77489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77497 - BLOCK
    )
    :vars
    (
      ?auto_77501 - BLOCK
      ?auto_77502 - BLOCK
      ?auto_77498 - BLOCK
      ?auto_77499 - BLOCK
      ?auto_77500 - BLOCK
      ?auto_77503 - BLOCK
      ?auto_77504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77497 ?auto_77501 ) ( not ( = ?auto_77497 ?auto_77501 ) ) ( not ( = ?auto_77497 ?auto_77502 ) ) ( not ( = ?auto_77497 ?auto_77498 ) ) ( not ( = ?auto_77501 ?auto_77502 ) ) ( not ( = ?auto_77501 ?auto_77498 ) ) ( not ( = ?auto_77502 ?auto_77498 ) ) ( ON ?auto_77502 ?auto_77497 ) ( ON-TABLE ?auto_77501 ) ( not ( = ?auto_77499 ?auto_77500 ) ) ( not ( = ?auto_77499 ?auto_77503 ) ) ( not ( = ?auto_77499 ?auto_77504 ) ) ( not ( = ?auto_77499 ?auto_77498 ) ) ( not ( = ?auto_77500 ?auto_77503 ) ) ( not ( = ?auto_77500 ?auto_77504 ) ) ( not ( = ?auto_77500 ?auto_77498 ) ) ( not ( = ?auto_77503 ?auto_77504 ) ) ( not ( = ?auto_77503 ?auto_77498 ) ) ( not ( = ?auto_77504 ?auto_77498 ) ) ( not ( = ?auto_77497 ?auto_77504 ) ) ( not ( = ?auto_77497 ?auto_77499 ) ) ( not ( = ?auto_77497 ?auto_77500 ) ) ( not ( = ?auto_77497 ?auto_77503 ) ) ( not ( = ?auto_77501 ?auto_77504 ) ) ( not ( = ?auto_77501 ?auto_77499 ) ) ( not ( = ?auto_77501 ?auto_77500 ) ) ( not ( = ?auto_77501 ?auto_77503 ) ) ( not ( = ?auto_77502 ?auto_77504 ) ) ( not ( = ?auto_77502 ?auto_77499 ) ) ( not ( = ?auto_77502 ?auto_77500 ) ) ( not ( = ?auto_77502 ?auto_77503 ) ) ( ON ?auto_77498 ?auto_77502 ) ( ON ?auto_77504 ?auto_77498 ) ( ON ?auto_77503 ?auto_77504 ) ( ON ?auto_77500 ?auto_77503 ) ( CLEAR ?auto_77500 ) ( HOLDING ?auto_77499 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77499 )
      ( MAKE-1PILE ?auto_77497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_77505 - BLOCK
    )
    :vars
    (
      ?auto_77507 - BLOCK
      ?auto_77508 - BLOCK
      ?auto_77510 - BLOCK
      ?auto_77512 - BLOCK
      ?auto_77511 - BLOCK
      ?auto_77506 - BLOCK
      ?auto_77509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77505 ?auto_77507 ) ( not ( = ?auto_77505 ?auto_77507 ) ) ( not ( = ?auto_77505 ?auto_77508 ) ) ( not ( = ?auto_77505 ?auto_77510 ) ) ( not ( = ?auto_77507 ?auto_77508 ) ) ( not ( = ?auto_77507 ?auto_77510 ) ) ( not ( = ?auto_77508 ?auto_77510 ) ) ( ON ?auto_77508 ?auto_77505 ) ( ON-TABLE ?auto_77507 ) ( not ( = ?auto_77512 ?auto_77511 ) ) ( not ( = ?auto_77512 ?auto_77506 ) ) ( not ( = ?auto_77512 ?auto_77509 ) ) ( not ( = ?auto_77512 ?auto_77510 ) ) ( not ( = ?auto_77511 ?auto_77506 ) ) ( not ( = ?auto_77511 ?auto_77509 ) ) ( not ( = ?auto_77511 ?auto_77510 ) ) ( not ( = ?auto_77506 ?auto_77509 ) ) ( not ( = ?auto_77506 ?auto_77510 ) ) ( not ( = ?auto_77509 ?auto_77510 ) ) ( not ( = ?auto_77505 ?auto_77509 ) ) ( not ( = ?auto_77505 ?auto_77512 ) ) ( not ( = ?auto_77505 ?auto_77511 ) ) ( not ( = ?auto_77505 ?auto_77506 ) ) ( not ( = ?auto_77507 ?auto_77509 ) ) ( not ( = ?auto_77507 ?auto_77512 ) ) ( not ( = ?auto_77507 ?auto_77511 ) ) ( not ( = ?auto_77507 ?auto_77506 ) ) ( not ( = ?auto_77508 ?auto_77509 ) ) ( not ( = ?auto_77508 ?auto_77512 ) ) ( not ( = ?auto_77508 ?auto_77511 ) ) ( not ( = ?auto_77508 ?auto_77506 ) ) ( ON ?auto_77510 ?auto_77508 ) ( ON ?auto_77509 ?auto_77510 ) ( ON ?auto_77506 ?auto_77509 ) ( ON ?auto_77511 ?auto_77506 ) ( ON ?auto_77512 ?auto_77511 ) ( CLEAR ?auto_77512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77507 ?auto_77505 ?auto_77508 ?auto_77510 ?auto_77509 ?auto_77506 ?auto_77511 )
      ( MAKE-1PILE ?auto_77505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77524 - BLOCK
      ?auto_77525 - BLOCK
      ?auto_77526 - BLOCK
      ?auto_77527 - BLOCK
      ?auto_77528 - BLOCK
    )
    :vars
    (
      ?auto_77529 - BLOCK
      ?auto_77530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77529 ?auto_77528 ) ( CLEAR ?auto_77529 ) ( ON-TABLE ?auto_77524 ) ( ON ?auto_77525 ?auto_77524 ) ( ON ?auto_77526 ?auto_77525 ) ( ON ?auto_77527 ?auto_77526 ) ( ON ?auto_77528 ?auto_77527 ) ( not ( = ?auto_77524 ?auto_77525 ) ) ( not ( = ?auto_77524 ?auto_77526 ) ) ( not ( = ?auto_77524 ?auto_77527 ) ) ( not ( = ?auto_77524 ?auto_77528 ) ) ( not ( = ?auto_77524 ?auto_77529 ) ) ( not ( = ?auto_77525 ?auto_77526 ) ) ( not ( = ?auto_77525 ?auto_77527 ) ) ( not ( = ?auto_77525 ?auto_77528 ) ) ( not ( = ?auto_77525 ?auto_77529 ) ) ( not ( = ?auto_77526 ?auto_77527 ) ) ( not ( = ?auto_77526 ?auto_77528 ) ) ( not ( = ?auto_77526 ?auto_77529 ) ) ( not ( = ?auto_77527 ?auto_77528 ) ) ( not ( = ?auto_77527 ?auto_77529 ) ) ( not ( = ?auto_77528 ?auto_77529 ) ) ( HOLDING ?auto_77530 ) ( not ( = ?auto_77524 ?auto_77530 ) ) ( not ( = ?auto_77525 ?auto_77530 ) ) ( not ( = ?auto_77526 ?auto_77530 ) ) ( not ( = ?auto_77527 ?auto_77530 ) ) ( not ( = ?auto_77528 ?auto_77530 ) ) ( not ( = ?auto_77529 ?auto_77530 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_77530 )
      ( MAKE-5PILE ?auto_77524 ?auto_77525 ?auto_77526 ?auto_77527 ?auto_77528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77621 - BLOCK
      ?auto_77622 - BLOCK
    )
    :vars
    (
      ?auto_77623 - BLOCK
      ?auto_77626 - BLOCK
      ?auto_77624 - BLOCK
      ?auto_77625 - BLOCK
      ?auto_77627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77621 ?auto_77622 ) ) ( ON ?auto_77622 ?auto_77623 ) ( not ( = ?auto_77621 ?auto_77623 ) ) ( not ( = ?auto_77622 ?auto_77623 ) ) ( ON ?auto_77621 ?auto_77622 ) ( CLEAR ?auto_77621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77626 ) ( ON ?auto_77624 ?auto_77626 ) ( ON ?auto_77625 ?auto_77624 ) ( ON ?auto_77627 ?auto_77625 ) ( ON ?auto_77623 ?auto_77627 ) ( not ( = ?auto_77626 ?auto_77624 ) ) ( not ( = ?auto_77626 ?auto_77625 ) ) ( not ( = ?auto_77626 ?auto_77627 ) ) ( not ( = ?auto_77626 ?auto_77623 ) ) ( not ( = ?auto_77626 ?auto_77622 ) ) ( not ( = ?auto_77626 ?auto_77621 ) ) ( not ( = ?auto_77624 ?auto_77625 ) ) ( not ( = ?auto_77624 ?auto_77627 ) ) ( not ( = ?auto_77624 ?auto_77623 ) ) ( not ( = ?auto_77624 ?auto_77622 ) ) ( not ( = ?auto_77624 ?auto_77621 ) ) ( not ( = ?auto_77625 ?auto_77627 ) ) ( not ( = ?auto_77625 ?auto_77623 ) ) ( not ( = ?auto_77625 ?auto_77622 ) ) ( not ( = ?auto_77625 ?auto_77621 ) ) ( not ( = ?auto_77627 ?auto_77623 ) ) ( not ( = ?auto_77627 ?auto_77622 ) ) ( not ( = ?auto_77627 ?auto_77621 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77626 ?auto_77624 ?auto_77625 ?auto_77627 ?auto_77623 ?auto_77622 )
      ( MAKE-2PILE ?auto_77621 ?auto_77622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77630 - BLOCK
      ?auto_77631 - BLOCK
    )
    :vars
    (
      ?auto_77632 - BLOCK
      ?auto_77633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77630 ?auto_77631 ) ) ( ON ?auto_77631 ?auto_77632 ) ( CLEAR ?auto_77631 ) ( not ( = ?auto_77630 ?auto_77632 ) ) ( not ( = ?auto_77631 ?auto_77632 ) ) ( ON ?auto_77630 ?auto_77633 ) ( CLEAR ?auto_77630 ) ( HAND-EMPTY ) ( not ( = ?auto_77630 ?auto_77633 ) ) ( not ( = ?auto_77631 ?auto_77633 ) ) ( not ( = ?auto_77632 ?auto_77633 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77630 ?auto_77633 )
      ( MAKE-2PILE ?auto_77630 ?auto_77631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77634 - BLOCK
      ?auto_77635 - BLOCK
    )
    :vars
    (
      ?auto_77637 - BLOCK
      ?auto_77636 - BLOCK
      ?auto_77641 - BLOCK
      ?auto_77638 - BLOCK
      ?auto_77639 - BLOCK
      ?auto_77640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77634 ?auto_77635 ) ) ( not ( = ?auto_77634 ?auto_77637 ) ) ( not ( = ?auto_77635 ?auto_77637 ) ) ( ON ?auto_77634 ?auto_77636 ) ( CLEAR ?auto_77634 ) ( not ( = ?auto_77634 ?auto_77636 ) ) ( not ( = ?auto_77635 ?auto_77636 ) ) ( not ( = ?auto_77637 ?auto_77636 ) ) ( HOLDING ?auto_77635 ) ( CLEAR ?auto_77637 ) ( ON-TABLE ?auto_77641 ) ( ON ?auto_77638 ?auto_77641 ) ( ON ?auto_77639 ?auto_77638 ) ( ON ?auto_77640 ?auto_77639 ) ( ON ?auto_77637 ?auto_77640 ) ( not ( = ?auto_77641 ?auto_77638 ) ) ( not ( = ?auto_77641 ?auto_77639 ) ) ( not ( = ?auto_77641 ?auto_77640 ) ) ( not ( = ?auto_77641 ?auto_77637 ) ) ( not ( = ?auto_77641 ?auto_77635 ) ) ( not ( = ?auto_77638 ?auto_77639 ) ) ( not ( = ?auto_77638 ?auto_77640 ) ) ( not ( = ?auto_77638 ?auto_77637 ) ) ( not ( = ?auto_77638 ?auto_77635 ) ) ( not ( = ?auto_77639 ?auto_77640 ) ) ( not ( = ?auto_77639 ?auto_77637 ) ) ( not ( = ?auto_77639 ?auto_77635 ) ) ( not ( = ?auto_77640 ?auto_77637 ) ) ( not ( = ?auto_77640 ?auto_77635 ) ) ( not ( = ?auto_77634 ?auto_77641 ) ) ( not ( = ?auto_77634 ?auto_77638 ) ) ( not ( = ?auto_77634 ?auto_77639 ) ) ( not ( = ?auto_77634 ?auto_77640 ) ) ( not ( = ?auto_77636 ?auto_77641 ) ) ( not ( = ?auto_77636 ?auto_77638 ) ) ( not ( = ?auto_77636 ?auto_77639 ) ) ( not ( = ?auto_77636 ?auto_77640 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77641 ?auto_77638 ?auto_77639 ?auto_77640 ?auto_77637 ?auto_77635 )
      ( MAKE-2PILE ?auto_77634 ?auto_77635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77642 - BLOCK
      ?auto_77643 - BLOCK
    )
    :vars
    (
      ?auto_77646 - BLOCK
      ?auto_77644 - BLOCK
      ?auto_77648 - BLOCK
      ?auto_77649 - BLOCK
      ?auto_77645 - BLOCK
      ?auto_77647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77642 ?auto_77643 ) ) ( not ( = ?auto_77642 ?auto_77646 ) ) ( not ( = ?auto_77643 ?auto_77646 ) ) ( ON ?auto_77642 ?auto_77644 ) ( not ( = ?auto_77642 ?auto_77644 ) ) ( not ( = ?auto_77643 ?auto_77644 ) ) ( not ( = ?auto_77646 ?auto_77644 ) ) ( CLEAR ?auto_77646 ) ( ON-TABLE ?auto_77648 ) ( ON ?auto_77649 ?auto_77648 ) ( ON ?auto_77645 ?auto_77649 ) ( ON ?auto_77647 ?auto_77645 ) ( ON ?auto_77646 ?auto_77647 ) ( not ( = ?auto_77648 ?auto_77649 ) ) ( not ( = ?auto_77648 ?auto_77645 ) ) ( not ( = ?auto_77648 ?auto_77647 ) ) ( not ( = ?auto_77648 ?auto_77646 ) ) ( not ( = ?auto_77648 ?auto_77643 ) ) ( not ( = ?auto_77649 ?auto_77645 ) ) ( not ( = ?auto_77649 ?auto_77647 ) ) ( not ( = ?auto_77649 ?auto_77646 ) ) ( not ( = ?auto_77649 ?auto_77643 ) ) ( not ( = ?auto_77645 ?auto_77647 ) ) ( not ( = ?auto_77645 ?auto_77646 ) ) ( not ( = ?auto_77645 ?auto_77643 ) ) ( not ( = ?auto_77647 ?auto_77646 ) ) ( not ( = ?auto_77647 ?auto_77643 ) ) ( not ( = ?auto_77642 ?auto_77648 ) ) ( not ( = ?auto_77642 ?auto_77649 ) ) ( not ( = ?auto_77642 ?auto_77645 ) ) ( not ( = ?auto_77642 ?auto_77647 ) ) ( not ( = ?auto_77644 ?auto_77648 ) ) ( not ( = ?auto_77644 ?auto_77649 ) ) ( not ( = ?auto_77644 ?auto_77645 ) ) ( not ( = ?auto_77644 ?auto_77647 ) ) ( ON ?auto_77643 ?auto_77642 ) ( CLEAR ?auto_77643 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77644 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77644 ?auto_77642 )
      ( MAKE-2PILE ?auto_77642 ?auto_77643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77650 - BLOCK
      ?auto_77651 - BLOCK
    )
    :vars
    (
      ?auto_77654 - BLOCK
      ?auto_77653 - BLOCK
      ?auto_77657 - BLOCK
      ?auto_77652 - BLOCK
      ?auto_77656 - BLOCK
      ?auto_77655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77650 ?auto_77651 ) ) ( not ( = ?auto_77650 ?auto_77654 ) ) ( not ( = ?auto_77651 ?auto_77654 ) ) ( ON ?auto_77650 ?auto_77653 ) ( not ( = ?auto_77650 ?auto_77653 ) ) ( not ( = ?auto_77651 ?auto_77653 ) ) ( not ( = ?auto_77654 ?auto_77653 ) ) ( ON-TABLE ?auto_77657 ) ( ON ?auto_77652 ?auto_77657 ) ( ON ?auto_77656 ?auto_77652 ) ( ON ?auto_77655 ?auto_77656 ) ( not ( = ?auto_77657 ?auto_77652 ) ) ( not ( = ?auto_77657 ?auto_77656 ) ) ( not ( = ?auto_77657 ?auto_77655 ) ) ( not ( = ?auto_77657 ?auto_77654 ) ) ( not ( = ?auto_77657 ?auto_77651 ) ) ( not ( = ?auto_77652 ?auto_77656 ) ) ( not ( = ?auto_77652 ?auto_77655 ) ) ( not ( = ?auto_77652 ?auto_77654 ) ) ( not ( = ?auto_77652 ?auto_77651 ) ) ( not ( = ?auto_77656 ?auto_77655 ) ) ( not ( = ?auto_77656 ?auto_77654 ) ) ( not ( = ?auto_77656 ?auto_77651 ) ) ( not ( = ?auto_77655 ?auto_77654 ) ) ( not ( = ?auto_77655 ?auto_77651 ) ) ( not ( = ?auto_77650 ?auto_77657 ) ) ( not ( = ?auto_77650 ?auto_77652 ) ) ( not ( = ?auto_77650 ?auto_77656 ) ) ( not ( = ?auto_77650 ?auto_77655 ) ) ( not ( = ?auto_77653 ?auto_77657 ) ) ( not ( = ?auto_77653 ?auto_77652 ) ) ( not ( = ?auto_77653 ?auto_77656 ) ) ( not ( = ?auto_77653 ?auto_77655 ) ) ( ON ?auto_77651 ?auto_77650 ) ( CLEAR ?auto_77651 ) ( ON-TABLE ?auto_77653 ) ( HOLDING ?auto_77654 ) ( CLEAR ?auto_77655 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77657 ?auto_77652 ?auto_77656 ?auto_77655 ?auto_77654 )
      ( MAKE-2PILE ?auto_77650 ?auto_77651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77658 - BLOCK
      ?auto_77659 - BLOCK
    )
    :vars
    (
      ?auto_77663 - BLOCK
      ?auto_77665 - BLOCK
      ?auto_77660 - BLOCK
      ?auto_77661 - BLOCK
      ?auto_77664 - BLOCK
      ?auto_77662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77658 ?auto_77659 ) ) ( not ( = ?auto_77658 ?auto_77663 ) ) ( not ( = ?auto_77659 ?auto_77663 ) ) ( ON ?auto_77658 ?auto_77665 ) ( not ( = ?auto_77658 ?auto_77665 ) ) ( not ( = ?auto_77659 ?auto_77665 ) ) ( not ( = ?auto_77663 ?auto_77665 ) ) ( ON-TABLE ?auto_77660 ) ( ON ?auto_77661 ?auto_77660 ) ( ON ?auto_77664 ?auto_77661 ) ( ON ?auto_77662 ?auto_77664 ) ( not ( = ?auto_77660 ?auto_77661 ) ) ( not ( = ?auto_77660 ?auto_77664 ) ) ( not ( = ?auto_77660 ?auto_77662 ) ) ( not ( = ?auto_77660 ?auto_77663 ) ) ( not ( = ?auto_77660 ?auto_77659 ) ) ( not ( = ?auto_77661 ?auto_77664 ) ) ( not ( = ?auto_77661 ?auto_77662 ) ) ( not ( = ?auto_77661 ?auto_77663 ) ) ( not ( = ?auto_77661 ?auto_77659 ) ) ( not ( = ?auto_77664 ?auto_77662 ) ) ( not ( = ?auto_77664 ?auto_77663 ) ) ( not ( = ?auto_77664 ?auto_77659 ) ) ( not ( = ?auto_77662 ?auto_77663 ) ) ( not ( = ?auto_77662 ?auto_77659 ) ) ( not ( = ?auto_77658 ?auto_77660 ) ) ( not ( = ?auto_77658 ?auto_77661 ) ) ( not ( = ?auto_77658 ?auto_77664 ) ) ( not ( = ?auto_77658 ?auto_77662 ) ) ( not ( = ?auto_77665 ?auto_77660 ) ) ( not ( = ?auto_77665 ?auto_77661 ) ) ( not ( = ?auto_77665 ?auto_77664 ) ) ( not ( = ?auto_77665 ?auto_77662 ) ) ( ON ?auto_77659 ?auto_77658 ) ( ON-TABLE ?auto_77665 ) ( CLEAR ?auto_77662 ) ( ON ?auto_77663 ?auto_77659 ) ( CLEAR ?auto_77663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77665 ?auto_77658 ?auto_77659 )
      ( MAKE-2PILE ?auto_77658 ?auto_77659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77666 - BLOCK
      ?auto_77667 - BLOCK
    )
    :vars
    (
      ?auto_77671 - BLOCK
      ?auto_77673 - BLOCK
      ?auto_77672 - BLOCK
      ?auto_77670 - BLOCK
      ?auto_77669 - BLOCK
      ?auto_77668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77666 ?auto_77667 ) ) ( not ( = ?auto_77666 ?auto_77671 ) ) ( not ( = ?auto_77667 ?auto_77671 ) ) ( ON ?auto_77666 ?auto_77673 ) ( not ( = ?auto_77666 ?auto_77673 ) ) ( not ( = ?auto_77667 ?auto_77673 ) ) ( not ( = ?auto_77671 ?auto_77673 ) ) ( ON-TABLE ?auto_77672 ) ( ON ?auto_77670 ?auto_77672 ) ( ON ?auto_77669 ?auto_77670 ) ( not ( = ?auto_77672 ?auto_77670 ) ) ( not ( = ?auto_77672 ?auto_77669 ) ) ( not ( = ?auto_77672 ?auto_77668 ) ) ( not ( = ?auto_77672 ?auto_77671 ) ) ( not ( = ?auto_77672 ?auto_77667 ) ) ( not ( = ?auto_77670 ?auto_77669 ) ) ( not ( = ?auto_77670 ?auto_77668 ) ) ( not ( = ?auto_77670 ?auto_77671 ) ) ( not ( = ?auto_77670 ?auto_77667 ) ) ( not ( = ?auto_77669 ?auto_77668 ) ) ( not ( = ?auto_77669 ?auto_77671 ) ) ( not ( = ?auto_77669 ?auto_77667 ) ) ( not ( = ?auto_77668 ?auto_77671 ) ) ( not ( = ?auto_77668 ?auto_77667 ) ) ( not ( = ?auto_77666 ?auto_77672 ) ) ( not ( = ?auto_77666 ?auto_77670 ) ) ( not ( = ?auto_77666 ?auto_77669 ) ) ( not ( = ?auto_77666 ?auto_77668 ) ) ( not ( = ?auto_77673 ?auto_77672 ) ) ( not ( = ?auto_77673 ?auto_77670 ) ) ( not ( = ?auto_77673 ?auto_77669 ) ) ( not ( = ?auto_77673 ?auto_77668 ) ) ( ON ?auto_77667 ?auto_77666 ) ( ON-TABLE ?auto_77673 ) ( ON ?auto_77671 ?auto_77667 ) ( CLEAR ?auto_77671 ) ( HOLDING ?auto_77668 ) ( CLEAR ?auto_77669 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77672 ?auto_77670 ?auto_77669 ?auto_77668 )
      ( MAKE-2PILE ?auto_77666 ?auto_77667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77674 - BLOCK
      ?auto_77675 - BLOCK
    )
    :vars
    (
      ?auto_77676 - BLOCK
      ?auto_77680 - BLOCK
      ?auto_77679 - BLOCK
      ?auto_77681 - BLOCK
      ?auto_77677 - BLOCK
      ?auto_77678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77674 ?auto_77675 ) ) ( not ( = ?auto_77674 ?auto_77676 ) ) ( not ( = ?auto_77675 ?auto_77676 ) ) ( ON ?auto_77674 ?auto_77680 ) ( not ( = ?auto_77674 ?auto_77680 ) ) ( not ( = ?auto_77675 ?auto_77680 ) ) ( not ( = ?auto_77676 ?auto_77680 ) ) ( ON-TABLE ?auto_77679 ) ( ON ?auto_77681 ?auto_77679 ) ( ON ?auto_77677 ?auto_77681 ) ( not ( = ?auto_77679 ?auto_77681 ) ) ( not ( = ?auto_77679 ?auto_77677 ) ) ( not ( = ?auto_77679 ?auto_77678 ) ) ( not ( = ?auto_77679 ?auto_77676 ) ) ( not ( = ?auto_77679 ?auto_77675 ) ) ( not ( = ?auto_77681 ?auto_77677 ) ) ( not ( = ?auto_77681 ?auto_77678 ) ) ( not ( = ?auto_77681 ?auto_77676 ) ) ( not ( = ?auto_77681 ?auto_77675 ) ) ( not ( = ?auto_77677 ?auto_77678 ) ) ( not ( = ?auto_77677 ?auto_77676 ) ) ( not ( = ?auto_77677 ?auto_77675 ) ) ( not ( = ?auto_77678 ?auto_77676 ) ) ( not ( = ?auto_77678 ?auto_77675 ) ) ( not ( = ?auto_77674 ?auto_77679 ) ) ( not ( = ?auto_77674 ?auto_77681 ) ) ( not ( = ?auto_77674 ?auto_77677 ) ) ( not ( = ?auto_77674 ?auto_77678 ) ) ( not ( = ?auto_77680 ?auto_77679 ) ) ( not ( = ?auto_77680 ?auto_77681 ) ) ( not ( = ?auto_77680 ?auto_77677 ) ) ( not ( = ?auto_77680 ?auto_77678 ) ) ( ON ?auto_77675 ?auto_77674 ) ( ON-TABLE ?auto_77680 ) ( ON ?auto_77676 ?auto_77675 ) ( CLEAR ?auto_77677 ) ( ON ?auto_77678 ?auto_77676 ) ( CLEAR ?auto_77678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77680 ?auto_77674 ?auto_77675 ?auto_77676 )
      ( MAKE-2PILE ?auto_77674 ?auto_77675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77682 - BLOCK
      ?auto_77683 - BLOCK
    )
    :vars
    (
      ?auto_77688 - BLOCK
      ?auto_77684 - BLOCK
      ?auto_77686 - BLOCK
      ?auto_77687 - BLOCK
      ?auto_77685 - BLOCK
      ?auto_77689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77682 ?auto_77683 ) ) ( not ( = ?auto_77682 ?auto_77688 ) ) ( not ( = ?auto_77683 ?auto_77688 ) ) ( ON ?auto_77682 ?auto_77684 ) ( not ( = ?auto_77682 ?auto_77684 ) ) ( not ( = ?auto_77683 ?auto_77684 ) ) ( not ( = ?auto_77688 ?auto_77684 ) ) ( ON-TABLE ?auto_77686 ) ( ON ?auto_77687 ?auto_77686 ) ( not ( = ?auto_77686 ?auto_77687 ) ) ( not ( = ?auto_77686 ?auto_77685 ) ) ( not ( = ?auto_77686 ?auto_77689 ) ) ( not ( = ?auto_77686 ?auto_77688 ) ) ( not ( = ?auto_77686 ?auto_77683 ) ) ( not ( = ?auto_77687 ?auto_77685 ) ) ( not ( = ?auto_77687 ?auto_77689 ) ) ( not ( = ?auto_77687 ?auto_77688 ) ) ( not ( = ?auto_77687 ?auto_77683 ) ) ( not ( = ?auto_77685 ?auto_77689 ) ) ( not ( = ?auto_77685 ?auto_77688 ) ) ( not ( = ?auto_77685 ?auto_77683 ) ) ( not ( = ?auto_77689 ?auto_77688 ) ) ( not ( = ?auto_77689 ?auto_77683 ) ) ( not ( = ?auto_77682 ?auto_77686 ) ) ( not ( = ?auto_77682 ?auto_77687 ) ) ( not ( = ?auto_77682 ?auto_77685 ) ) ( not ( = ?auto_77682 ?auto_77689 ) ) ( not ( = ?auto_77684 ?auto_77686 ) ) ( not ( = ?auto_77684 ?auto_77687 ) ) ( not ( = ?auto_77684 ?auto_77685 ) ) ( not ( = ?auto_77684 ?auto_77689 ) ) ( ON ?auto_77683 ?auto_77682 ) ( ON-TABLE ?auto_77684 ) ( ON ?auto_77688 ?auto_77683 ) ( ON ?auto_77689 ?auto_77688 ) ( CLEAR ?auto_77689 ) ( HOLDING ?auto_77685 ) ( CLEAR ?auto_77687 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77686 ?auto_77687 ?auto_77685 )
      ( MAKE-2PILE ?auto_77682 ?auto_77683 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77690 - BLOCK
      ?auto_77691 - BLOCK
    )
    :vars
    (
      ?auto_77694 - BLOCK
      ?auto_77697 - BLOCK
      ?auto_77692 - BLOCK
      ?auto_77695 - BLOCK
      ?auto_77696 - BLOCK
      ?auto_77693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77690 ?auto_77691 ) ) ( not ( = ?auto_77690 ?auto_77694 ) ) ( not ( = ?auto_77691 ?auto_77694 ) ) ( ON ?auto_77690 ?auto_77697 ) ( not ( = ?auto_77690 ?auto_77697 ) ) ( not ( = ?auto_77691 ?auto_77697 ) ) ( not ( = ?auto_77694 ?auto_77697 ) ) ( ON-TABLE ?auto_77692 ) ( ON ?auto_77695 ?auto_77692 ) ( not ( = ?auto_77692 ?auto_77695 ) ) ( not ( = ?auto_77692 ?auto_77696 ) ) ( not ( = ?auto_77692 ?auto_77693 ) ) ( not ( = ?auto_77692 ?auto_77694 ) ) ( not ( = ?auto_77692 ?auto_77691 ) ) ( not ( = ?auto_77695 ?auto_77696 ) ) ( not ( = ?auto_77695 ?auto_77693 ) ) ( not ( = ?auto_77695 ?auto_77694 ) ) ( not ( = ?auto_77695 ?auto_77691 ) ) ( not ( = ?auto_77696 ?auto_77693 ) ) ( not ( = ?auto_77696 ?auto_77694 ) ) ( not ( = ?auto_77696 ?auto_77691 ) ) ( not ( = ?auto_77693 ?auto_77694 ) ) ( not ( = ?auto_77693 ?auto_77691 ) ) ( not ( = ?auto_77690 ?auto_77692 ) ) ( not ( = ?auto_77690 ?auto_77695 ) ) ( not ( = ?auto_77690 ?auto_77696 ) ) ( not ( = ?auto_77690 ?auto_77693 ) ) ( not ( = ?auto_77697 ?auto_77692 ) ) ( not ( = ?auto_77697 ?auto_77695 ) ) ( not ( = ?auto_77697 ?auto_77696 ) ) ( not ( = ?auto_77697 ?auto_77693 ) ) ( ON ?auto_77691 ?auto_77690 ) ( ON-TABLE ?auto_77697 ) ( ON ?auto_77694 ?auto_77691 ) ( ON ?auto_77693 ?auto_77694 ) ( CLEAR ?auto_77695 ) ( ON ?auto_77696 ?auto_77693 ) ( CLEAR ?auto_77696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77697 ?auto_77690 ?auto_77691 ?auto_77694 ?auto_77693 )
      ( MAKE-2PILE ?auto_77690 ?auto_77691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77698 - BLOCK
      ?auto_77699 - BLOCK
    )
    :vars
    (
      ?auto_77702 - BLOCK
      ?auto_77703 - BLOCK
      ?auto_77704 - BLOCK
      ?auto_77701 - BLOCK
      ?auto_77705 - BLOCK
      ?auto_77700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77698 ?auto_77699 ) ) ( not ( = ?auto_77698 ?auto_77702 ) ) ( not ( = ?auto_77699 ?auto_77702 ) ) ( ON ?auto_77698 ?auto_77703 ) ( not ( = ?auto_77698 ?auto_77703 ) ) ( not ( = ?auto_77699 ?auto_77703 ) ) ( not ( = ?auto_77702 ?auto_77703 ) ) ( ON-TABLE ?auto_77704 ) ( not ( = ?auto_77704 ?auto_77701 ) ) ( not ( = ?auto_77704 ?auto_77705 ) ) ( not ( = ?auto_77704 ?auto_77700 ) ) ( not ( = ?auto_77704 ?auto_77702 ) ) ( not ( = ?auto_77704 ?auto_77699 ) ) ( not ( = ?auto_77701 ?auto_77705 ) ) ( not ( = ?auto_77701 ?auto_77700 ) ) ( not ( = ?auto_77701 ?auto_77702 ) ) ( not ( = ?auto_77701 ?auto_77699 ) ) ( not ( = ?auto_77705 ?auto_77700 ) ) ( not ( = ?auto_77705 ?auto_77702 ) ) ( not ( = ?auto_77705 ?auto_77699 ) ) ( not ( = ?auto_77700 ?auto_77702 ) ) ( not ( = ?auto_77700 ?auto_77699 ) ) ( not ( = ?auto_77698 ?auto_77704 ) ) ( not ( = ?auto_77698 ?auto_77701 ) ) ( not ( = ?auto_77698 ?auto_77705 ) ) ( not ( = ?auto_77698 ?auto_77700 ) ) ( not ( = ?auto_77703 ?auto_77704 ) ) ( not ( = ?auto_77703 ?auto_77701 ) ) ( not ( = ?auto_77703 ?auto_77705 ) ) ( not ( = ?auto_77703 ?auto_77700 ) ) ( ON ?auto_77699 ?auto_77698 ) ( ON-TABLE ?auto_77703 ) ( ON ?auto_77702 ?auto_77699 ) ( ON ?auto_77700 ?auto_77702 ) ( ON ?auto_77705 ?auto_77700 ) ( CLEAR ?auto_77705 ) ( HOLDING ?auto_77701 ) ( CLEAR ?auto_77704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77704 ?auto_77701 )
      ( MAKE-2PILE ?auto_77698 ?auto_77699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77706 - BLOCK
      ?auto_77707 - BLOCK
    )
    :vars
    (
      ?auto_77708 - BLOCK
      ?auto_77709 - BLOCK
      ?auto_77710 - BLOCK
      ?auto_77711 - BLOCK
      ?auto_77712 - BLOCK
      ?auto_77713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77706 ?auto_77707 ) ) ( not ( = ?auto_77706 ?auto_77708 ) ) ( not ( = ?auto_77707 ?auto_77708 ) ) ( ON ?auto_77706 ?auto_77709 ) ( not ( = ?auto_77706 ?auto_77709 ) ) ( not ( = ?auto_77707 ?auto_77709 ) ) ( not ( = ?auto_77708 ?auto_77709 ) ) ( ON-TABLE ?auto_77710 ) ( not ( = ?auto_77710 ?auto_77711 ) ) ( not ( = ?auto_77710 ?auto_77712 ) ) ( not ( = ?auto_77710 ?auto_77713 ) ) ( not ( = ?auto_77710 ?auto_77708 ) ) ( not ( = ?auto_77710 ?auto_77707 ) ) ( not ( = ?auto_77711 ?auto_77712 ) ) ( not ( = ?auto_77711 ?auto_77713 ) ) ( not ( = ?auto_77711 ?auto_77708 ) ) ( not ( = ?auto_77711 ?auto_77707 ) ) ( not ( = ?auto_77712 ?auto_77713 ) ) ( not ( = ?auto_77712 ?auto_77708 ) ) ( not ( = ?auto_77712 ?auto_77707 ) ) ( not ( = ?auto_77713 ?auto_77708 ) ) ( not ( = ?auto_77713 ?auto_77707 ) ) ( not ( = ?auto_77706 ?auto_77710 ) ) ( not ( = ?auto_77706 ?auto_77711 ) ) ( not ( = ?auto_77706 ?auto_77712 ) ) ( not ( = ?auto_77706 ?auto_77713 ) ) ( not ( = ?auto_77709 ?auto_77710 ) ) ( not ( = ?auto_77709 ?auto_77711 ) ) ( not ( = ?auto_77709 ?auto_77712 ) ) ( not ( = ?auto_77709 ?auto_77713 ) ) ( ON ?auto_77707 ?auto_77706 ) ( ON-TABLE ?auto_77709 ) ( ON ?auto_77708 ?auto_77707 ) ( ON ?auto_77713 ?auto_77708 ) ( ON ?auto_77712 ?auto_77713 ) ( CLEAR ?auto_77710 ) ( ON ?auto_77711 ?auto_77712 ) ( CLEAR ?auto_77711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77709 ?auto_77706 ?auto_77707 ?auto_77708 ?auto_77713 ?auto_77712 )
      ( MAKE-2PILE ?auto_77706 ?auto_77707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77714 - BLOCK
      ?auto_77715 - BLOCK
    )
    :vars
    (
      ?auto_77716 - BLOCK
      ?auto_77718 - BLOCK
      ?auto_77717 - BLOCK
      ?auto_77720 - BLOCK
      ?auto_77721 - BLOCK
      ?auto_77719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77714 ?auto_77715 ) ) ( not ( = ?auto_77714 ?auto_77716 ) ) ( not ( = ?auto_77715 ?auto_77716 ) ) ( ON ?auto_77714 ?auto_77718 ) ( not ( = ?auto_77714 ?auto_77718 ) ) ( not ( = ?auto_77715 ?auto_77718 ) ) ( not ( = ?auto_77716 ?auto_77718 ) ) ( not ( = ?auto_77717 ?auto_77720 ) ) ( not ( = ?auto_77717 ?auto_77721 ) ) ( not ( = ?auto_77717 ?auto_77719 ) ) ( not ( = ?auto_77717 ?auto_77716 ) ) ( not ( = ?auto_77717 ?auto_77715 ) ) ( not ( = ?auto_77720 ?auto_77721 ) ) ( not ( = ?auto_77720 ?auto_77719 ) ) ( not ( = ?auto_77720 ?auto_77716 ) ) ( not ( = ?auto_77720 ?auto_77715 ) ) ( not ( = ?auto_77721 ?auto_77719 ) ) ( not ( = ?auto_77721 ?auto_77716 ) ) ( not ( = ?auto_77721 ?auto_77715 ) ) ( not ( = ?auto_77719 ?auto_77716 ) ) ( not ( = ?auto_77719 ?auto_77715 ) ) ( not ( = ?auto_77714 ?auto_77717 ) ) ( not ( = ?auto_77714 ?auto_77720 ) ) ( not ( = ?auto_77714 ?auto_77721 ) ) ( not ( = ?auto_77714 ?auto_77719 ) ) ( not ( = ?auto_77718 ?auto_77717 ) ) ( not ( = ?auto_77718 ?auto_77720 ) ) ( not ( = ?auto_77718 ?auto_77721 ) ) ( not ( = ?auto_77718 ?auto_77719 ) ) ( ON ?auto_77715 ?auto_77714 ) ( ON-TABLE ?auto_77718 ) ( ON ?auto_77716 ?auto_77715 ) ( ON ?auto_77719 ?auto_77716 ) ( ON ?auto_77721 ?auto_77719 ) ( ON ?auto_77720 ?auto_77721 ) ( CLEAR ?auto_77720 ) ( HOLDING ?auto_77717 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77717 )
      ( MAKE-2PILE ?auto_77714 ?auto_77715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77722 - BLOCK
      ?auto_77723 - BLOCK
    )
    :vars
    (
      ?auto_77729 - BLOCK
      ?auto_77724 - BLOCK
      ?auto_77727 - BLOCK
      ?auto_77725 - BLOCK
      ?auto_77728 - BLOCK
      ?auto_77726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77722 ?auto_77723 ) ) ( not ( = ?auto_77722 ?auto_77729 ) ) ( not ( = ?auto_77723 ?auto_77729 ) ) ( ON ?auto_77722 ?auto_77724 ) ( not ( = ?auto_77722 ?auto_77724 ) ) ( not ( = ?auto_77723 ?auto_77724 ) ) ( not ( = ?auto_77729 ?auto_77724 ) ) ( not ( = ?auto_77727 ?auto_77725 ) ) ( not ( = ?auto_77727 ?auto_77728 ) ) ( not ( = ?auto_77727 ?auto_77726 ) ) ( not ( = ?auto_77727 ?auto_77729 ) ) ( not ( = ?auto_77727 ?auto_77723 ) ) ( not ( = ?auto_77725 ?auto_77728 ) ) ( not ( = ?auto_77725 ?auto_77726 ) ) ( not ( = ?auto_77725 ?auto_77729 ) ) ( not ( = ?auto_77725 ?auto_77723 ) ) ( not ( = ?auto_77728 ?auto_77726 ) ) ( not ( = ?auto_77728 ?auto_77729 ) ) ( not ( = ?auto_77728 ?auto_77723 ) ) ( not ( = ?auto_77726 ?auto_77729 ) ) ( not ( = ?auto_77726 ?auto_77723 ) ) ( not ( = ?auto_77722 ?auto_77727 ) ) ( not ( = ?auto_77722 ?auto_77725 ) ) ( not ( = ?auto_77722 ?auto_77728 ) ) ( not ( = ?auto_77722 ?auto_77726 ) ) ( not ( = ?auto_77724 ?auto_77727 ) ) ( not ( = ?auto_77724 ?auto_77725 ) ) ( not ( = ?auto_77724 ?auto_77728 ) ) ( not ( = ?auto_77724 ?auto_77726 ) ) ( ON ?auto_77723 ?auto_77722 ) ( ON-TABLE ?auto_77724 ) ( ON ?auto_77729 ?auto_77723 ) ( ON ?auto_77726 ?auto_77729 ) ( ON ?auto_77728 ?auto_77726 ) ( ON ?auto_77725 ?auto_77728 ) ( ON ?auto_77727 ?auto_77725 ) ( CLEAR ?auto_77727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77724 ?auto_77722 ?auto_77723 ?auto_77729 ?auto_77726 ?auto_77728 ?auto_77725 )
      ( MAKE-2PILE ?auto_77722 ?auto_77723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77753 - BLOCK
      ?auto_77754 - BLOCK
      ?auto_77755 - BLOCK
      ?auto_77756 - BLOCK
    )
    :vars
    (
      ?auto_77757 - BLOCK
      ?auto_77759 - BLOCK
      ?auto_77758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77757 ?auto_77756 ) ( ON-TABLE ?auto_77753 ) ( ON ?auto_77754 ?auto_77753 ) ( ON ?auto_77755 ?auto_77754 ) ( ON ?auto_77756 ?auto_77755 ) ( not ( = ?auto_77753 ?auto_77754 ) ) ( not ( = ?auto_77753 ?auto_77755 ) ) ( not ( = ?auto_77753 ?auto_77756 ) ) ( not ( = ?auto_77753 ?auto_77757 ) ) ( not ( = ?auto_77754 ?auto_77755 ) ) ( not ( = ?auto_77754 ?auto_77756 ) ) ( not ( = ?auto_77754 ?auto_77757 ) ) ( not ( = ?auto_77755 ?auto_77756 ) ) ( not ( = ?auto_77755 ?auto_77757 ) ) ( not ( = ?auto_77756 ?auto_77757 ) ) ( not ( = ?auto_77753 ?auto_77759 ) ) ( not ( = ?auto_77753 ?auto_77758 ) ) ( not ( = ?auto_77754 ?auto_77759 ) ) ( not ( = ?auto_77754 ?auto_77758 ) ) ( not ( = ?auto_77755 ?auto_77759 ) ) ( not ( = ?auto_77755 ?auto_77758 ) ) ( not ( = ?auto_77756 ?auto_77759 ) ) ( not ( = ?auto_77756 ?auto_77758 ) ) ( not ( = ?auto_77757 ?auto_77759 ) ) ( not ( = ?auto_77757 ?auto_77758 ) ) ( not ( = ?auto_77759 ?auto_77758 ) ) ( ON ?auto_77759 ?auto_77757 ) ( CLEAR ?auto_77759 ) ( HOLDING ?auto_77758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77758 )
      ( MAKE-4PILE ?auto_77753 ?auto_77754 ?auto_77755 ?auto_77756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77840 - BLOCK
      ?auto_77841 - BLOCK
      ?auto_77842 - BLOCK
    )
    :vars
    (
      ?auto_77843 - BLOCK
      ?auto_77845 - BLOCK
      ?auto_77844 - BLOCK
      ?auto_77846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77840 ) ( not ( = ?auto_77840 ?auto_77841 ) ) ( not ( = ?auto_77840 ?auto_77842 ) ) ( not ( = ?auto_77841 ?auto_77842 ) ) ( ON ?auto_77842 ?auto_77843 ) ( not ( = ?auto_77840 ?auto_77843 ) ) ( not ( = ?auto_77841 ?auto_77843 ) ) ( not ( = ?auto_77842 ?auto_77843 ) ) ( CLEAR ?auto_77840 ) ( ON ?auto_77841 ?auto_77842 ) ( CLEAR ?auto_77841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77845 ) ( ON ?auto_77844 ?auto_77845 ) ( ON ?auto_77846 ?auto_77844 ) ( ON ?auto_77843 ?auto_77846 ) ( not ( = ?auto_77845 ?auto_77844 ) ) ( not ( = ?auto_77845 ?auto_77846 ) ) ( not ( = ?auto_77845 ?auto_77843 ) ) ( not ( = ?auto_77845 ?auto_77842 ) ) ( not ( = ?auto_77845 ?auto_77841 ) ) ( not ( = ?auto_77844 ?auto_77846 ) ) ( not ( = ?auto_77844 ?auto_77843 ) ) ( not ( = ?auto_77844 ?auto_77842 ) ) ( not ( = ?auto_77844 ?auto_77841 ) ) ( not ( = ?auto_77846 ?auto_77843 ) ) ( not ( = ?auto_77846 ?auto_77842 ) ) ( not ( = ?auto_77846 ?auto_77841 ) ) ( not ( = ?auto_77840 ?auto_77845 ) ) ( not ( = ?auto_77840 ?auto_77844 ) ) ( not ( = ?auto_77840 ?auto_77846 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77845 ?auto_77844 ?auto_77846 ?auto_77843 ?auto_77842 )
      ( MAKE-3PILE ?auto_77840 ?auto_77841 ?auto_77842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77847 - BLOCK
      ?auto_77848 - BLOCK
      ?auto_77849 - BLOCK
    )
    :vars
    (
      ?auto_77850 - BLOCK
      ?auto_77852 - BLOCK
      ?auto_77853 - BLOCK
      ?auto_77851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77847 ?auto_77848 ) ) ( not ( = ?auto_77847 ?auto_77849 ) ) ( not ( = ?auto_77848 ?auto_77849 ) ) ( ON ?auto_77849 ?auto_77850 ) ( not ( = ?auto_77847 ?auto_77850 ) ) ( not ( = ?auto_77848 ?auto_77850 ) ) ( not ( = ?auto_77849 ?auto_77850 ) ) ( ON ?auto_77848 ?auto_77849 ) ( CLEAR ?auto_77848 ) ( ON-TABLE ?auto_77852 ) ( ON ?auto_77853 ?auto_77852 ) ( ON ?auto_77851 ?auto_77853 ) ( ON ?auto_77850 ?auto_77851 ) ( not ( = ?auto_77852 ?auto_77853 ) ) ( not ( = ?auto_77852 ?auto_77851 ) ) ( not ( = ?auto_77852 ?auto_77850 ) ) ( not ( = ?auto_77852 ?auto_77849 ) ) ( not ( = ?auto_77852 ?auto_77848 ) ) ( not ( = ?auto_77853 ?auto_77851 ) ) ( not ( = ?auto_77853 ?auto_77850 ) ) ( not ( = ?auto_77853 ?auto_77849 ) ) ( not ( = ?auto_77853 ?auto_77848 ) ) ( not ( = ?auto_77851 ?auto_77850 ) ) ( not ( = ?auto_77851 ?auto_77849 ) ) ( not ( = ?auto_77851 ?auto_77848 ) ) ( not ( = ?auto_77847 ?auto_77852 ) ) ( not ( = ?auto_77847 ?auto_77853 ) ) ( not ( = ?auto_77847 ?auto_77851 ) ) ( HOLDING ?auto_77847 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77847 )
      ( MAKE-3PILE ?auto_77847 ?auto_77848 ?auto_77849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77854 - BLOCK
      ?auto_77855 - BLOCK
      ?auto_77856 - BLOCK
    )
    :vars
    (
      ?auto_77857 - BLOCK
      ?auto_77858 - BLOCK
      ?auto_77860 - BLOCK
      ?auto_77859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77854 ?auto_77855 ) ) ( not ( = ?auto_77854 ?auto_77856 ) ) ( not ( = ?auto_77855 ?auto_77856 ) ) ( ON ?auto_77856 ?auto_77857 ) ( not ( = ?auto_77854 ?auto_77857 ) ) ( not ( = ?auto_77855 ?auto_77857 ) ) ( not ( = ?auto_77856 ?auto_77857 ) ) ( ON ?auto_77855 ?auto_77856 ) ( ON-TABLE ?auto_77858 ) ( ON ?auto_77860 ?auto_77858 ) ( ON ?auto_77859 ?auto_77860 ) ( ON ?auto_77857 ?auto_77859 ) ( not ( = ?auto_77858 ?auto_77860 ) ) ( not ( = ?auto_77858 ?auto_77859 ) ) ( not ( = ?auto_77858 ?auto_77857 ) ) ( not ( = ?auto_77858 ?auto_77856 ) ) ( not ( = ?auto_77858 ?auto_77855 ) ) ( not ( = ?auto_77860 ?auto_77859 ) ) ( not ( = ?auto_77860 ?auto_77857 ) ) ( not ( = ?auto_77860 ?auto_77856 ) ) ( not ( = ?auto_77860 ?auto_77855 ) ) ( not ( = ?auto_77859 ?auto_77857 ) ) ( not ( = ?auto_77859 ?auto_77856 ) ) ( not ( = ?auto_77859 ?auto_77855 ) ) ( not ( = ?auto_77854 ?auto_77858 ) ) ( not ( = ?auto_77854 ?auto_77860 ) ) ( not ( = ?auto_77854 ?auto_77859 ) ) ( ON ?auto_77854 ?auto_77855 ) ( CLEAR ?auto_77854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77858 ?auto_77860 ?auto_77859 ?auto_77857 ?auto_77856 ?auto_77855 )
      ( MAKE-3PILE ?auto_77854 ?auto_77855 ?auto_77856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77864 - BLOCK
      ?auto_77865 - BLOCK
      ?auto_77866 - BLOCK
    )
    :vars
    (
      ?auto_77869 - BLOCK
      ?auto_77870 - BLOCK
      ?auto_77867 - BLOCK
      ?auto_77868 - BLOCK
      ?auto_77871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77864 ?auto_77865 ) ) ( not ( = ?auto_77864 ?auto_77866 ) ) ( not ( = ?auto_77865 ?auto_77866 ) ) ( ON ?auto_77866 ?auto_77869 ) ( not ( = ?auto_77864 ?auto_77869 ) ) ( not ( = ?auto_77865 ?auto_77869 ) ) ( not ( = ?auto_77866 ?auto_77869 ) ) ( ON ?auto_77865 ?auto_77866 ) ( CLEAR ?auto_77865 ) ( ON-TABLE ?auto_77870 ) ( ON ?auto_77867 ?auto_77870 ) ( ON ?auto_77868 ?auto_77867 ) ( ON ?auto_77869 ?auto_77868 ) ( not ( = ?auto_77870 ?auto_77867 ) ) ( not ( = ?auto_77870 ?auto_77868 ) ) ( not ( = ?auto_77870 ?auto_77869 ) ) ( not ( = ?auto_77870 ?auto_77866 ) ) ( not ( = ?auto_77870 ?auto_77865 ) ) ( not ( = ?auto_77867 ?auto_77868 ) ) ( not ( = ?auto_77867 ?auto_77869 ) ) ( not ( = ?auto_77867 ?auto_77866 ) ) ( not ( = ?auto_77867 ?auto_77865 ) ) ( not ( = ?auto_77868 ?auto_77869 ) ) ( not ( = ?auto_77868 ?auto_77866 ) ) ( not ( = ?auto_77868 ?auto_77865 ) ) ( not ( = ?auto_77864 ?auto_77870 ) ) ( not ( = ?auto_77864 ?auto_77867 ) ) ( not ( = ?auto_77864 ?auto_77868 ) ) ( ON ?auto_77864 ?auto_77871 ) ( CLEAR ?auto_77864 ) ( HAND-EMPTY ) ( not ( = ?auto_77864 ?auto_77871 ) ) ( not ( = ?auto_77865 ?auto_77871 ) ) ( not ( = ?auto_77866 ?auto_77871 ) ) ( not ( = ?auto_77869 ?auto_77871 ) ) ( not ( = ?auto_77870 ?auto_77871 ) ) ( not ( = ?auto_77867 ?auto_77871 ) ) ( not ( = ?auto_77868 ?auto_77871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77864 ?auto_77871 )
      ( MAKE-3PILE ?auto_77864 ?auto_77865 ?auto_77866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77872 - BLOCK
      ?auto_77873 - BLOCK
      ?auto_77874 - BLOCK
    )
    :vars
    (
      ?auto_77878 - BLOCK
      ?auto_77876 - BLOCK
      ?auto_77875 - BLOCK
      ?auto_77877 - BLOCK
      ?auto_77879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77872 ?auto_77873 ) ) ( not ( = ?auto_77872 ?auto_77874 ) ) ( not ( = ?auto_77873 ?auto_77874 ) ) ( ON ?auto_77874 ?auto_77878 ) ( not ( = ?auto_77872 ?auto_77878 ) ) ( not ( = ?auto_77873 ?auto_77878 ) ) ( not ( = ?auto_77874 ?auto_77878 ) ) ( ON-TABLE ?auto_77876 ) ( ON ?auto_77875 ?auto_77876 ) ( ON ?auto_77877 ?auto_77875 ) ( ON ?auto_77878 ?auto_77877 ) ( not ( = ?auto_77876 ?auto_77875 ) ) ( not ( = ?auto_77876 ?auto_77877 ) ) ( not ( = ?auto_77876 ?auto_77878 ) ) ( not ( = ?auto_77876 ?auto_77874 ) ) ( not ( = ?auto_77876 ?auto_77873 ) ) ( not ( = ?auto_77875 ?auto_77877 ) ) ( not ( = ?auto_77875 ?auto_77878 ) ) ( not ( = ?auto_77875 ?auto_77874 ) ) ( not ( = ?auto_77875 ?auto_77873 ) ) ( not ( = ?auto_77877 ?auto_77878 ) ) ( not ( = ?auto_77877 ?auto_77874 ) ) ( not ( = ?auto_77877 ?auto_77873 ) ) ( not ( = ?auto_77872 ?auto_77876 ) ) ( not ( = ?auto_77872 ?auto_77875 ) ) ( not ( = ?auto_77872 ?auto_77877 ) ) ( ON ?auto_77872 ?auto_77879 ) ( CLEAR ?auto_77872 ) ( not ( = ?auto_77872 ?auto_77879 ) ) ( not ( = ?auto_77873 ?auto_77879 ) ) ( not ( = ?auto_77874 ?auto_77879 ) ) ( not ( = ?auto_77878 ?auto_77879 ) ) ( not ( = ?auto_77876 ?auto_77879 ) ) ( not ( = ?auto_77875 ?auto_77879 ) ) ( not ( = ?auto_77877 ?auto_77879 ) ) ( HOLDING ?auto_77873 ) ( CLEAR ?auto_77874 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77876 ?auto_77875 ?auto_77877 ?auto_77878 ?auto_77874 ?auto_77873 )
      ( MAKE-3PILE ?auto_77872 ?auto_77873 ?auto_77874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77880 - BLOCK
      ?auto_77881 - BLOCK
      ?auto_77882 - BLOCK
    )
    :vars
    (
      ?auto_77885 - BLOCK
      ?auto_77886 - BLOCK
      ?auto_77884 - BLOCK
      ?auto_77883 - BLOCK
      ?auto_77887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77880 ?auto_77881 ) ) ( not ( = ?auto_77880 ?auto_77882 ) ) ( not ( = ?auto_77881 ?auto_77882 ) ) ( ON ?auto_77882 ?auto_77885 ) ( not ( = ?auto_77880 ?auto_77885 ) ) ( not ( = ?auto_77881 ?auto_77885 ) ) ( not ( = ?auto_77882 ?auto_77885 ) ) ( ON-TABLE ?auto_77886 ) ( ON ?auto_77884 ?auto_77886 ) ( ON ?auto_77883 ?auto_77884 ) ( ON ?auto_77885 ?auto_77883 ) ( not ( = ?auto_77886 ?auto_77884 ) ) ( not ( = ?auto_77886 ?auto_77883 ) ) ( not ( = ?auto_77886 ?auto_77885 ) ) ( not ( = ?auto_77886 ?auto_77882 ) ) ( not ( = ?auto_77886 ?auto_77881 ) ) ( not ( = ?auto_77884 ?auto_77883 ) ) ( not ( = ?auto_77884 ?auto_77885 ) ) ( not ( = ?auto_77884 ?auto_77882 ) ) ( not ( = ?auto_77884 ?auto_77881 ) ) ( not ( = ?auto_77883 ?auto_77885 ) ) ( not ( = ?auto_77883 ?auto_77882 ) ) ( not ( = ?auto_77883 ?auto_77881 ) ) ( not ( = ?auto_77880 ?auto_77886 ) ) ( not ( = ?auto_77880 ?auto_77884 ) ) ( not ( = ?auto_77880 ?auto_77883 ) ) ( ON ?auto_77880 ?auto_77887 ) ( not ( = ?auto_77880 ?auto_77887 ) ) ( not ( = ?auto_77881 ?auto_77887 ) ) ( not ( = ?auto_77882 ?auto_77887 ) ) ( not ( = ?auto_77885 ?auto_77887 ) ) ( not ( = ?auto_77886 ?auto_77887 ) ) ( not ( = ?auto_77884 ?auto_77887 ) ) ( not ( = ?auto_77883 ?auto_77887 ) ) ( CLEAR ?auto_77882 ) ( ON ?auto_77881 ?auto_77880 ) ( CLEAR ?auto_77881 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77887 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77887 ?auto_77880 )
      ( MAKE-3PILE ?auto_77880 ?auto_77881 ?auto_77882 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77888 - BLOCK
      ?auto_77889 - BLOCK
      ?auto_77890 - BLOCK
    )
    :vars
    (
      ?auto_77891 - BLOCK
      ?auto_77895 - BLOCK
      ?auto_77894 - BLOCK
      ?auto_77893 - BLOCK
      ?auto_77892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77888 ?auto_77889 ) ) ( not ( = ?auto_77888 ?auto_77890 ) ) ( not ( = ?auto_77889 ?auto_77890 ) ) ( not ( = ?auto_77888 ?auto_77891 ) ) ( not ( = ?auto_77889 ?auto_77891 ) ) ( not ( = ?auto_77890 ?auto_77891 ) ) ( ON-TABLE ?auto_77895 ) ( ON ?auto_77894 ?auto_77895 ) ( ON ?auto_77893 ?auto_77894 ) ( ON ?auto_77891 ?auto_77893 ) ( not ( = ?auto_77895 ?auto_77894 ) ) ( not ( = ?auto_77895 ?auto_77893 ) ) ( not ( = ?auto_77895 ?auto_77891 ) ) ( not ( = ?auto_77895 ?auto_77890 ) ) ( not ( = ?auto_77895 ?auto_77889 ) ) ( not ( = ?auto_77894 ?auto_77893 ) ) ( not ( = ?auto_77894 ?auto_77891 ) ) ( not ( = ?auto_77894 ?auto_77890 ) ) ( not ( = ?auto_77894 ?auto_77889 ) ) ( not ( = ?auto_77893 ?auto_77891 ) ) ( not ( = ?auto_77893 ?auto_77890 ) ) ( not ( = ?auto_77893 ?auto_77889 ) ) ( not ( = ?auto_77888 ?auto_77895 ) ) ( not ( = ?auto_77888 ?auto_77894 ) ) ( not ( = ?auto_77888 ?auto_77893 ) ) ( ON ?auto_77888 ?auto_77892 ) ( not ( = ?auto_77888 ?auto_77892 ) ) ( not ( = ?auto_77889 ?auto_77892 ) ) ( not ( = ?auto_77890 ?auto_77892 ) ) ( not ( = ?auto_77891 ?auto_77892 ) ) ( not ( = ?auto_77895 ?auto_77892 ) ) ( not ( = ?auto_77894 ?auto_77892 ) ) ( not ( = ?auto_77893 ?auto_77892 ) ) ( ON ?auto_77889 ?auto_77888 ) ( CLEAR ?auto_77889 ) ( ON-TABLE ?auto_77892 ) ( HOLDING ?auto_77890 ) ( CLEAR ?auto_77891 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77895 ?auto_77894 ?auto_77893 ?auto_77891 ?auto_77890 )
      ( MAKE-3PILE ?auto_77888 ?auto_77889 ?auto_77890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77896 - BLOCK
      ?auto_77897 - BLOCK
      ?auto_77898 - BLOCK
    )
    :vars
    (
      ?auto_77901 - BLOCK
      ?auto_77899 - BLOCK
      ?auto_77902 - BLOCK
      ?auto_77903 - BLOCK
      ?auto_77900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77896 ?auto_77897 ) ) ( not ( = ?auto_77896 ?auto_77898 ) ) ( not ( = ?auto_77897 ?auto_77898 ) ) ( not ( = ?auto_77896 ?auto_77901 ) ) ( not ( = ?auto_77897 ?auto_77901 ) ) ( not ( = ?auto_77898 ?auto_77901 ) ) ( ON-TABLE ?auto_77899 ) ( ON ?auto_77902 ?auto_77899 ) ( ON ?auto_77903 ?auto_77902 ) ( ON ?auto_77901 ?auto_77903 ) ( not ( = ?auto_77899 ?auto_77902 ) ) ( not ( = ?auto_77899 ?auto_77903 ) ) ( not ( = ?auto_77899 ?auto_77901 ) ) ( not ( = ?auto_77899 ?auto_77898 ) ) ( not ( = ?auto_77899 ?auto_77897 ) ) ( not ( = ?auto_77902 ?auto_77903 ) ) ( not ( = ?auto_77902 ?auto_77901 ) ) ( not ( = ?auto_77902 ?auto_77898 ) ) ( not ( = ?auto_77902 ?auto_77897 ) ) ( not ( = ?auto_77903 ?auto_77901 ) ) ( not ( = ?auto_77903 ?auto_77898 ) ) ( not ( = ?auto_77903 ?auto_77897 ) ) ( not ( = ?auto_77896 ?auto_77899 ) ) ( not ( = ?auto_77896 ?auto_77902 ) ) ( not ( = ?auto_77896 ?auto_77903 ) ) ( ON ?auto_77896 ?auto_77900 ) ( not ( = ?auto_77896 ?auto_77900 ) ) ( not ( = ?auto_77897 ?auto_77900 ) ) ( not ( = ?auto_77898 ?auto_77900 ) ) ( not ( = ?auto_77901 ?auto_77900 ) ) ( not ( = ?auto_77899 ?auto_77900 ) ) ( not ( = ?auto_77902 ?auto_77900 ) ) ( not ( = ?auto_77903 ?auto_77900 ) ) ( ON ?auto_77897 ?auto_77896 ) ( ON-TABLE ?auto_77900 ) ( CLEAR ?auto_77901 ) ( ON ?auto_77898 ?auto_77897 ) ( CLEAR ?auto_77898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77900 ?auto_77896 ?auto_77897 )
      ( MAKE-3PILE ?auto_77896 ?auto_77897 ?auto_77898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77904 - BLOCK
      ?auto_77905 - BLOCK
      ?auto_77906 - BLOCK
    )
    :vars
    (
      ?auto_77908 - BLOCK
      ?auto_77909 - BLOCK
      ?auto_77910 - BLOCK
      ?auto_77911 - BLOCK
      ?auto_77907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77904 ?auto_77905 ) ) ( not ( = ?auto_77904 ?auto_77906 ) ) ( not ( = ?auto_77905 ?auto_77906 ) ) ( not ( = ?auto_77904 ?auto_77908 ) ) ( not ( = ?auto_77905 ?auto_77908 ) ) ( not ( = ?auto_77906 ?auto_77908 ) ) ( ON-TABLE ?auto_77909 ) ( ON ?auto_77910 ?auto_77909 ) ( ON ?auto_77911 ?auto_77910 ) ( not ( = ?auto_77909 ?auto_77910 ) ) ( not ( = ?auto_77909 ?auto_77911 ) ) ( not ( = ?auto_77909 ?auto_77908 ) ) ( not ( = ?auto_77909 ?auto_77906 ) ) ( not ( = ?auto_77909 ?auto_77905 ) ) ( not ( = ?auto_77910 ?auto_77911 ) ) ( not ( = ?auto_77910 ?auto_77908 ) ) ( not ( = ?auto_77910 ?auto_77906 ) ) ( not ( = ?auto_77910 ?auto_77905 ) ) ( not ( = ?auto_77911 ?auto_77908 ) ) ( not ( = ?auto_77911 ?auto_77906 ) ) ( not ( = ?auto_77911 ?auto_77905 ) ) ( not ( = ?auto_77904 ?auto_77909 ) ) ( not ( = ?auto_77904 ?auto_77910 ) ) ( not ( = ?auto_77904 ?auto_77911 ) ) ( ON ?auto_77904 ?auto_77907 ) ( not ( = ?auto_77904 ?auto_77907 ) ) ( not ( = ?auto_77905 ?auto_77907 ) ) ( not ( = ?auto_77906 ?auto_77907 ) ) ( not ( = ?auto_77908 ?auto_77907 ) ) ( not ( = ?auto_77909 ?auto_77907 ) ) ( not ( = ?auto_77910 ?auto_77907 ) ) ( not ( = ?auto_77911 ?auto_77907 ) ) ( ON ?auto_77905 ?auto_77904 ) ( ON-TABLE ?auto_77907 ) ( ON ?auto_77906 ?auto_77905 ) ( CLEAR ?auto_77906 ) ( HOLDING ?auto_77908 ) ( CLEAR ?auto_77911 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77909 ?auto_77910 ?auto_77911 ?auto_77908 )
      ( MAKE-3PILE ?auto_77904 ?auto_77905 ?auto_77906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77912 - BLOCK
      ?auto_77913 - BLOCK
      ?auto_77914 - BLOCK
    )
    :vars
    (
      ?auto_77919 - BLOCK
      ?auto_77918 - BLOCK
      ?auto_77917 - BLOCK
      ?auto_77915 - BLOCK
      ?auto_77916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77912 ?auto_77913 ) ) ( not ( = ?auto_77912 ?auto_77914 ) ) ( not ( = ?auto_77913 ?auto_77914 ) ) ( not ( = ?auto_77912 ?auto_77919 ) ) ( not ( = ?auto_77913 ?auto_77919 ) ) ( not ( = ?auto_77914 ?auto_77919 ) ) ( ON-TABLE ?auto_77918 ) ( ON ?auto_77917 ?auto_77918 ) ( ON ?auto_77915 ?auto_77917 ) ( not ( = ?auto_77918 ?auto_77917 ) ) ( not ( = ?auto_77918 ?auto_77915 ) ) ( not ( = ?auto_77918 ?auto_77919 ) ) ( not ( = ?auto_77918 ?auto_77914 ) ) ( not ( = ?auto_77918 ?auto_77913 ) ) ( not ( = ?auto_77917 ?auto_77915 ) ) ( not ( = ?auto_77917 ?auto_77919 ) ) ( not ( = ?auto_77917 ?auto_77914 ) ) ( not ( = ?auto_77917 ?auto_77913 ) ) ( not ( = ?auto_77915 ?auto_77919 ) ) ( not ( = ?auto_77915 ?auto_77914 ) ) ( not ( = ?auto_77915 ?auto_77913 ) ) ( not ( = ?auto_77912 ?auto_77918 ) ) ( not ( = ?auto_77912 ?auto_77917 ) ) ( not ( = ?auto_77912 ?auto_77915 ) ) ( ON ?auto_77912 ?auto_77916 ) ( not ( = ?auto_77912 ?auto_77916 ) ) ( not ( = ?auto_77913 ?auto_77916 ) ) ( not ( = ?auto_77914 ?auto_77916 ) ) ( not ( = ?auto_77919 ?auto_77916 ) ) ( not ( = ?auto_77918 ?auto_77916 ) ) ( not ( = ?auto_77917 ?auto_77916 ) ) ( not ( = ?auto_77915 ?auto_77916 ) ) ( ON ?auto_77913 ?auto_77912 ) ( ON-TABLE ?auto_77916 ) ( ON ?auto_77914 ?auto_77913 ) ( CLEAR ?auto_77915 ) ( ON ?auto_77919 ?auto_77914 ) ( CLEAR ?auto_77919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77916 ?auto_77912 ?auto_77913 ?auto_77914 )
      ( MAKE-3PILE ?auto_77912 ?auto_77913 ?auto_77914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77920 - BLOCK
      ?auto_77921 - BLOCK
      ?auto_77922 - BLOCK
    )
    :vars
    (
      ?auto_77927 - BLOCK
      ?auto_77926 - BLOCK
      ?auto_77924 - BLOCK
      ?auto_77923 - BLOCK
      ?auto_77925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77920 ?auto_77921 ) ) ( not ( = ?auto_77920 ?auto_77922 ) ) ( not ( = ?auto_77921 ?auto_77922 ) ) ( not ( = ?auto_77920 ?auto_77927 ) ) ( not ( = ?auto_77921 ?auto_77927 ) ) ( not ( = ?auto_77922 ?auto_77927 ) ) ( ON-TABLE ?auto_77926 ) ( ON ?auto_77924 ?auto_77926 ) ( not ( = ?auto_77926 ?auto_77924 ) ) ( not ( = ?auto_77926 ?auto_77923 ) ) ( not ( = ?auto_77926 ?auto_77927 ) ) ( not ( = ?auto_77926 ?auto_77922 ) ) ( not ( = ?auto_77926 ?auto_77921 ) ) ( not ( = ?auto_77924 ?auto_77923 ) ) ( not ( = ?auto_77924 ?auto_77927 ) ) ( not ( = ?auto_77924 ?auto_77922 ) ) ( not ( = ?auto_77924 ?auto_77921 ) ) ( not ( = ?auto_77923 ?auto_77927 ) ) ( not ( = ?auto_77923 ?auto_77922 ) ) ( not ( = ?auto_77923 ?auto_77921 ) ) ( not ( = ?auto_77920 ?auto_77926 ) ) ( not ( = ?auto_77920 ?auto_77924 ) ) ( not ( = ?auto_77920 ?auto_77923 ) ) ( ON ?auto_77920 ?auto_77925 ) ( not ( = ?auto_77920 ?auto_77925 ) ) ( not ( = ?auto_77921 ?auto_77925 ) ) ( not ( = ?auto_77922 ?auto_77925 ) ) ( not ( = ?auto_77927 ?auto_77925 ) ) ( not ( = ?auto_77926 ?auto_77925 ) ) ( not ( = ?auto_77924 ?auto_77925 ) ) ( not ( = ?auto_77923 ?auto_77925 ) ) ( ON ?auto_77921 ?auto_77920 ) ( ON-TABLE ?auto_77925 ) ( ON ?auto_77922 ?auto_77921 ) ( ON ?auto_77927 ?auto_77922 ) ( CLEAR ?auto_77927 ) ( HOLDING ?auto_77923 ) ( CLEAR ?auto_77924 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77926 ?auto_77924 ?auto_77923 )
      ( MAKE-3PILE ?auto_77920 ?auto_77921 ?auto_77922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77928 - BLOCK
      ?auto_77929 - BLOCK
      ?auto_77930 - BLOCK
    )
    :vars
    (
      ?auto_77931 - BLOCK
      ?auto_77932 - BLOCK
      ?auto_77933 - BLOCK
      ?auto_77934 - BLOCK
      ?auto_77935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77928 ?auto_77929 ) ) ( not ( = ?auto_77928 ?auto_77930 ) ) ( not ( = ?auto_77929 ?auto_77930 ) ) ( not ( = ?auto_77928 ?auto_77931 ) ) ( not ( = ?auto_77929 ?auto_77931 ) ) ( not ( = ?auto_77930 ?auto_77931 ) ) ( ON-TABLE ?auto_77932 ) ( ON ?auto_77933 ?auto_77932 ) ( not ( = ?auto_77932 ?auto_77933 ) ) ( not ( = ?auto_77932 ?auto_77934 ) ) ( not ( = ?auto_77932 ?auto_77931 ) ) ( not ( = ?auto_77932 ?auto_77930 ) ) ( not ( = ?auto_77932 ?auto_77929 ) ) ( not ( = ?auto_77933 ?auto_77934 ) ) ( not ( = ?auto_77933 ?auto_77931 ) ) ( not ( = ?auto_77933 ?auto_77930 ) ) ( not ( = ?auto_77933 ?auto_77929 ) ) ( not ( = ?auto_77934 ?auto_77931 ) ) ( not ( = ?auto_77934 ?auto_77930 ) ) ( not ( = ?auto_77934 ?auto_77929 ) ) ( not ( = ?auto_77928 ?auto_77932 ) ) ( not ( = ?auto_77928 ?auto_77933 ) ) ( not ( = ?auto_77928 ?auto_77934 ) ) ( ON ?auto_77928 ?auto_77935 ) ( not ( = ?auto_77928 ?auto_77935 ) ) ( not ( = ?auto_77929 ?auto_77935 ) ) ( not ( = ?auto_77930 ?auto_77935 ) ) ( not ( = ?auto_77931 ?auto_77935 ) ) ( not ( = ?auto_77932 ?auto_77935 ) ) ( not ( = ?auto_77933 ?auto_77935 ) ) ( not ( = ?auto_77934 ?auto_77935 ) ) ( ON ?auto_77929 ?auto_77928 ) ( ON-TABLE ?auto_77935 ) ( ON ?auto_77930 ?auto_77929 ) ( ON ?auto_77931 ?auto_77930 ) ( CLEAR ?auto_77933 ) ( ON ?auto_77934 ?auto_77931 ) ( CLEAR ?auto_77934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77935 ?auto_77928 ?auto_77929 ?auto_77930 ?auto_77931 )
      ( MAKE-3PILE ?auto_77928 ?auto_77929 ?auto_77930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77936 - BLOCK
      ?auto_77937 - BLOCK
      ?auto_77938 - BLOCK
    )
    :vars
    (
      ?auto_77942 - BLOCK
      ?auto_77939 - BLOCK
      ?auto_77940 - BLOCK
      ?auto_77941 - BLOCK
      ?auto_77943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77936 ?auto_77937 ) ) ( not ( = ?auto_77936 ?auto_77938 ) ) ( not ( = ?auto_77937 ?auto_77938 ) ) ( not ( = ?auto_77936 ?auto_77942 ) ) ( not ( = ?auto_77937 ?auto_77942 ) ) ( not ( = ?auto_77938 ?auto_77942 ) ) ( ON-TABLE ?auto_77939 ) ( not ( = ?auto_77939 ?auto_77940 ) ) ( not ( = ?auto_77939 ?auto_77941 ) ) ( not ( = ?auto_77939 ?auto_77942 ) ) ( not ( = ?auto_77939 ?auto_77938 ) ) ( not ( = ?auto_77939 ?auto_77937 ) ) ( not ( = ?auto_77940 ?auto_77941 ) ) ( not ( = ?auto_77940 ?auto_77942 ) ) ( not ( = ?auto_77940 ?auto_77938 ) ) ( not ( = ?auto_77940 ?auto_77937 ) ) ( not ( = ?auto_77941 ?auto_77942 ) ) ( not ( = ?auto_77941 ?auto_77938 ) ) ( not ( = ?auto_77941 ?auto_77937 ) ) ( not ( = ?auto_77936 ?auto_77939 ) ) ( not ( = ?auto_77936 ?auto_77940 ) ) ( not ( = ?auto_77936 ?auto_77941 ) ) ( ON ?auto_77936 ?auto_77943 ) ( not ( = ?auto_77936 ?auto_77943 ) ) ( not ( = ?auto_77937 ?auto_77943 ) ) ( not ( = ?auto_77938 ?auto_77943 ) ) ( not ( = ?auto_77942 ?auto_77943 ) ) ( not ( = ?auto_77939 ?auto_77943 ) ) ( not ( = ?auto_77940 ?auto_77943 ) ) ( not ( = ?auto_77941 ?auto_77943 ) ) ( ON ?auto_77937 ?auto_77936 ) ( ON-TABLE ?auto_77943 ) ( ON ?auto_77938 ?auto_77937 ) ( ON ?auto_77942 ?auto_77938 ) ( ON ?auto_77941 ?auto_77942 ) ( CLEAR ?auto_77941 ) ( HOLDING ?auto_77940 ) ( CLEAR ?auto_77939 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77939 ?auto_77940 )
      ( MAKE-3PILE ?auto_77936 ?auto_77937 ?auto_77938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77944 - BLOCK
      ?auto_77945 - BLOCK
      ?auto_77946 - BLOCK
    )
    :vars
    (
      ?auto_77947 - BLOCK
      ?auto_77949 - BLOCK
      ?auto_77951 - BLOCK
      ?auto_77948 - BLOCK
      ?auto_77950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77944 ?auto_77945 ) ) ( not ( = ?auto_77944 ?auto_77946 ) ) ( not ( = ?auto_77945 ?auto_77946 ) ) ( not ( = ?auto_77944 ?auto_77947 ) ) ( not ( = ?auto_77945 ?auto_77947 ) ) ( not ( = ?auto_77946 ?auto_77947 ) ) ( ON-TABLE ?auto_77949 ) ( not ( = ?auto_77949 ?auto_77951 ) ) ( not ( = ?auto_77949 ?auto_77948 ) ) ( not ( = ?auto_77949 ?auto_77947 ) ) ( not ( = ?auto_77949 ?auto_77946 ) ) ( not ( = ?auto_77949 ?auto_77945 ) ) ( not ( = ?auto_77951 ?auto_77948 ) ) ( not ( = ?auto_77951 ?auto_77947 ) ) ( not ( = ?auto_77951 ?auto_77946 ) ) ( not ( = ?auto_77951 ?auto_77945 ) ) ( not ( = ?auto_77948 ?auto_77947 ) ) ( not ( = ?auto_77948 ?auto_77946 ) ) ( not ( = ?auto_77948 ?auto_77945 ) ) ( not ( = ?auto_77944 ?auto_77949 ) ) ( not ( = ?auto_77944 ?auto_77951 ) ) ( not ( = ?auto_77944 ?auto_77948 ) ) ( ON ?auto_77944 ?auto_77950 ) ( not ( = ?auto_77944 ?auto_77950 ) ) ( not ( = ?auto_77945 ?auto_77950 ) ) ( not ( = ?auto_77946 ?auto_77950 ) ) ( not ( = ?auto_77947 ?auto_77950 ) ) ( not ( = ?auto_77949 ?auto_77950 ) ) ( not ( = ?auto_77951 ?auto_77950 ) ) ( not ( = ?auto_77948 ?auto_77950 ) ) ( ON ?auto_77945 ?auto_77944 ) ( ON-TABLE ?auto_77950 ) ( ON ?auto_77946 ?auto_77945 ) ( ON ?auto_77947 ?auto_77946 ) ( ON ?auto_77948 ?auto_77947 ) ( CLEAR ?auto_77949 ) ( ON ?auto_77951 ?auto_77948 ) ( CLEAR ?auto_77951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77950 ?auto_77944 ?auto_77945 ?auto_77946 ?auto_77947 ?auto_77948 )
      ( MAKE-3PILE ?auto_77944 ?auto_77945 ?auto_77946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77952 - BLOCK
      ?auto_77953 - BLOCK
      ?auto_77954 - BLOCK
    )
    :vars
    (
      ?auto_77958 - BLOCK
      ?auto_77959 - BLOCK
      ?auto_77956 - BLOCK
      ?auto_77955 - BLOCK
      ?auto_77957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77952 ?auto_77953 ) ) ( not ( = ?auto_77952 ?auto_77954 ) ) ( not ( = ?auto_77953 ?auto_77954 ) ) ( not ( = ?auto_77952 ?auto_77958 ) ) ( not ( = ?auto_77953 ?auto_77958 ) ) ( not ( = ?auto_77954 ?auto_77958 ) ) ( not ( = ?auto_77959 ?auto_77956 ) ) ( not ( = ?auto_77959 ?auto_77955 ) ) ( not ( = ?auto_77959 ?auto_77958 ) ) ( not ( = ?auto_77959 ?auto_77954 ) ) ( not ( = ?auto_77959 ?auto_77953 ) ) ( not ( = ?auto_77956 ?auto_77955 ) ) ( not ( = ?auto_77956 ?auto_77958 ) ) ( not ( = ?auto_77956 ?auto_77954 ) ) ( not ( = ?auto_77956 ?auto_77953 ) ) ( not ( = ?auto_77955 ?auto_77958 ) ) ( not ( = ?auto_77955 ?auto_77954 ) ) ( not ( = ?auto_77955 ?auto_77953 ) ) ( not ( = ?auto_77952 ?auto_77959 ) ) ( not ( = ?auto_77952 ?auto_77956 ) ) ( not ( = ?auto_77952 ?auto_77955 ) ) ( ON ?auto_77952 ?auto_77957 ) ( not ( = ?auto_77952 ?auto_77957 ) ) ( not ( = ?auto_77953 ?auto_77957 ) ) ( not ( = ?auto_77954 ?auto_77957 ) ) ( not ( = ?auto_77958 ?auto_77957 ) ) ( not ( = ?auto_77959 ?auto_77957 ) ) ( not ( = ?auto_77956 ?auto_77957 ) ) ( not ( = ?auto_77955 ?auto_77957 ) ) ( ON ?auto_77953 ?auto_77952 ) ( ON-TABLE ?auto_77957 ) ( ON ?auto_77954 ?auto_77953 ) ( ON ?auto_77958 ?auto_77954 ) ( ON ?auto_77955 ?auto_77958 ) ( ON ?auto_77956 ?auto_77955 ) ( CLEAR ?auto_77956 ) ( HOLDING ?auto_77959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77959 )
      ( MAKE-3PILE ?auto_77952 ?auto_77953 ?auto_77954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77960 - BLOCK
      ?auto_77961 - BLOCK
      ?auto_77962 - BLOCK
    )
    :vars
    (
      ?auto_77967 - BLOCK
      ?auto_77964 - BLOCK
      ?auto_77965 - BLOCK
      ?auto_77963 - BLOCK
      ?auto_77966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77960 ?auto_77961 ) ) ( not ( = ?auto_77960 ?auto_77962 ) ) ( not ( = ?auto_77961 ?auto_77962 ) ) ( not ( = ?auto_77960 ?auto_77967 ) ) ( not ( = ?auto_77961 ?auto_77967 ) ) ( not ( = ?auto_77962 ?auto_77967 ) ) ( not ( = ?auto_77964 ?auto_77965 ) ) ( not ( = ?auto_77964 ?auto_77963 ) ) ( not ( = ?auto_77964 ?auto_77967 ) ) ( not ( = ?auto_77964 ?auto_77962 ) ) ( not ( = ?auto_77964 ?auto_77961 ) ) ( not ( = ?auto_77965 ?auto_77963 ) ) ( not ( = ?auto_77965 ?auto_77967 ) ) ( not ( = ?auto_77965 ?auto_77962 ) ) ( not ( = ?auto_77965 ?auto_77961 ) ) ( not ( = ?auto_77963 ?auto_77967 ) ) ( not ( = ?auto_77963 ?auto_77962 ) ) ( not ( = ?auto_77963 ?auto_77961 ) ) ( not ( = ?auto_77960 ?auto_77964 ) ) ( not ( = ?auto_77960 ?auto_77965 ) ) ( not ( = ?auto_77960 ?auto_77963 ) ) ( ON ?auto_77960 ?auto_77966 ) ( not ( = ?auto_77960 ?auto_77966 ) ) ( not ( = ?auto_77961 ?auto_77966 ) ) ( not ( = ?auto_77962 ?auto_77966 ) ) ( not ( = ?auto_77967 ?auto_77966 ) ) ( not ( = ?auto_77964 ?auto_77966 ) ) ( not ( = ?auto_77965 ?auto_77966 ) ) ( not ( = ?auto_77963 ?auto_77966 ) ) ( ON ?auto_77961 ?auto_77960 ) ( ON-TABLE ?auto_77966 ) ( ON ?auto_77962 ?auto_77961 ) ( ON ?auto_77967 ?auto_77962 ) ( ON ?auto_77963 ?auto_77967 ) ( ON ?auto_77965 ?auto_77963 ) ( ON ?auto_77964 ?auto_77965 ) ( CLEAR ?auto_77964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77966 ?auto_77960 ?auto_77961 ?auto_77962 ?auto_77967 ?auto_77963 ?auto_77965 )
      ( MAKE-3PILE ?auto_77960 ?auto_77961 ?auto_77962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77987 - BLOCK
      ?auto_77988 - BLOCK
      ?auto_77989 - BLOCK
    )
    :vars
    (
      ?auto_77990 - BLOCK
      ?auto_77992 - BLOCK
      ?auto_77991 - BLOCK
      ?auto_77993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77990 ?auto_77989 ) ( ON-TABLE ?auto_77987 ) ( ON ?auto_77988 ?auto_77987 ) ( ON ?auto_77989 ?auto_77988 ) ( not ( = ?auto_77987 ?auto_77988 ) ) ( not ( = ?auto_77987 ?auto_77989 ) ) ( not ( = ?auto_77987 ?auto_77990 ) ) ( not ( = ?auto_77988 ?auto_77989 ) ) ( not ( = ?auto_77988 ?auto_77990 ) ) ( not ( = ?auto_77989 ?auto_77990 ) ) ( not ( = ?auto_77987 ?auto_77992 ) ) ( not ( = ?auto_77987 ?auto_77991 ) ) ( not ( = ?auto_77988 ?auto_77992 ) ) ( not ( = ?auto_77988 ?auto_77991 ) ) ( not ( = ?auto_77989 ?auto_77992 ) ) ( not ( = ?auto_77989 ?auto_77991 ) ) ( not ( = ?auto_77990 ?auto_77992 ) ) ( not ( = ?auto_77990 ?auto_77991 ) ) ( not ( = ?auto_77992 ?auto_77991 ) ) ( ON ?auto_77992 ?auto_77990 ) ( CLEAR ?auto_77992 ) ( HOLDING ?auto_77991 ) ( CLEAR ?auto_77993 ) ( ON-TABLE ?auto_77993 ) ( not ( = ?auto_77993 ?auto_77991 ) ) ( not ( = ?auto_77987 ?auto_77993 ) ) ( not ( = ?auto_77988 ?auto_77993 ) ) ( not ( = ?auto_77989 ?auto_77993 ) ) ( not ( = ?auto_77990 ?auto_77993 ) ) ( not ( = ?auto_77992 ?auto_77993 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77993 ?auto_77991 )
      ( MAKE-3PILE ?auto_77987 ?auto_77988 ?auto_77989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77994 - BLOCK
      ?auto_77995 - BLOCK
      ?auto_77996 - BLOCK
    )
    :vars
    (
      ?auto_77999 - BLOCK
      ?auto_77998 - BLOCK
      ?auto_78000 - BLOCK
      ?auto_77997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77999 ?auto_77996 ) ( ON-TABLE ?auto_77994 ) ( ON ?auto_77995 ?auto_77994 ) ( ON ?auto_77996 ?auto_77995 ) ( not ( = ?auto_77994 ?auto_77995 ) ) ( not ( = ?auto_77994 ?auto_77996 ) ) ( not ( = ?auto_77994 ?auto_77999 ) ) ( not ( = ?auto_77995 ?auto_77996 ) ) ( not ( = ?auto_77995 ?auto_77999 ) ) ( not ( = ?auto_77996 ?auto_77999 ) ) ( not ( = ?auto_77994 ?auto_77998 ) ) ( not ( = ?auto_77994 ?auto_78000 ) ) ( not ( = ?auto_77995 ?auto_77998 ) ) ( not ( = ?auto_77995 ?auto_78000 ) ) ( not ( = ?auto_77996 ?auto_77998 ) ) ( not ( = ?auto_77996 ?auto_78000 ) ) ( not ( = ?auto_77999 ?auto_77998 ) ) ( not ( = ?auto_77999 ?auto_78000 ) ) ( not ( = ?auto_77998 ?auto_78000 ) ) ( ON ?auto_77998 ?auto_77999 ) ( CLEAR ?auto_77997 ) ( ON-TABLE ?auto_77997 ) ( not ( = ?auto_77997 ?auto_78000 ) ) ( not ( = ?auto_77994 ?auto_77997 ) ) ( not ( = ?auto_77995 ?auto_77997 ) ) ( not ( = ?auto_77996 ?auto_77997 ) ) ( not ( = ?auto_77999 ?auto_77997 ) ) ( not ( = ?auto_77998 ?auto_77997 ) ) ( ON ?auto_78000 ?auto_77998 ) ( CLEAR ?auto_78000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77994 ?auto_77995 ?auto_77996 ?auto_77999 ?auto_77998 )
      ( MAKE-3PILE ?auto_77994 ?auto_77995 ?auto_77996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78001 - BLOCK
      ?auto_78002 - BLOCK
      ?auto_78003 - BLOCK
    )
    :vars
    (
      ?auto_78006 - BLOCK
      ?auto_78004 - BLOCK
      ?auto_78005 - BLOCK
      ?auto_78007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78006 ?auto_78003 ) ( ON-TABLE ?auto_78001 ) ( ON ?auto_78002 ?auto_78001 ) ( ON ?auto_78003 ?auto_78002 ) ( not ( = ?auto_78001 ?auto_78002 ) ) ( not ( = ?auto_78001 ?auto_78003 ) ) ( not ( = ?auto_78001 ?auto_78006 ) ) ( not ( = ?auto_78002 ?auto_78003 ) ) ( not ( = ?auto_78002 ?auto_78006 ) ) ( not ( = ?auto_78003 ?auto_78006 ) ) ( not ( = ?auto_78001 ?auto_78004 ) ) ( not ( = ?auto_78001 ?auto_78005 ) ) ( not ( = ?auto_78002 ?auto_78004 ) ) ( not ( = ?auto_78002 ?auto_78005 ) ) ( not ( = ?auto_78003 ?auto_78004 ) ) ( not ( = ?auto_78003 ?auto_78005 ) ) ( not ( = ?auto_78006 ?auto_78004 ) ) ( not ( = ?auto_78006 ?auto_78005 ) ) ( not ( = ?auto_78004 ?auto_78005 ) ) ( ON ?auto_78004 ?auto_78006 ) ( not ( = ?auto_78007 ?auto_78005 ) ) ( not ( = ?auto_78001 ?auto_78007 ) ) ( not ( = ?auto_78002 ?auto_78007 ) ) ( not ( = ?auto_78003 ?auto_78007 ) ) ( not ( = ?auto_78006 ?auto_78007 ) ) ( not ( = ?auto_78004 ?auto_78007 ) ) ( ON ?auto_78005 ?auto_78004 ) ( CLEAR ?auto_78005 ) ( HOLDING ?auto_78007 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78007 )
      ( MAKE-3PILE ?auto_78001 ?auto_78002 ?auto_78003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78018 - BLOCK
      ?auto_78019 - BLOCK
      ?auto_78020 - BLOCK
    )
    :vars
    (
      ?auto_78023 - BLOCK
      ?auto_78021 - BLOCK
      ?auto_78024 - BLOCK
      ?auto_78022 - BLOCK
      ?auto_78025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78023 ?auto_78020 ) ( ON-TABLE ?auto_78018 ) ( ON ?auto_78019 ?auto_78018 ) ( ON ?auto_78020 ?auto_78019 ) ( not ( = ?auto_78018 ?auto_78019 ) ) ( not ( = ?auto_78018 ?auto_78020 ) ) ( not ( = ?auto_78018 ?auto_78023 ) ) ( not ( = ?auto_78019 ?auto_78020 ) ) ( not ( = ?auto_78019 ?auto_78023 ) ) ( not ( = ?auto_78020 ?auto_78023 ) ) ( not ( = ?auto_78018 ?auto_78021 ) ) ( not ( = ?auto_78018 ?auto_78024 ) ) ( not ( = ?auto_78019 ?auto_78021 ) ) ( not ( = ?auto_78019 ?auto_78024 ) ) ( not ( = ?auto_78020 ?auto_78021 ) ) ( not ( = ?auto_78020 ?auto_78024 ) ) ( not ( = ?auto_78023 ?auto_78021 ) ) ( not ( = ?auto_78023 ?auto_78024 ) ) ( not ( = ?auto_78021 ?auto_78024 ) ) ( ON ?auto_78021 ?auto_78023 ) ( not ( = ?auto_78022 ?auto_78024 ) ) ( not ( = ?auto_78018 ?auto_78022 ) ) ( not ( = ?auto_78019 ?auto_78022 ) ) ( not ( = ?auto_78020 ?auto_78022 ) ) ( not ( = ?auto_78023 ?auto_78022 ) ) ( not ( = ?auto_78021 ?auto_78022 ) ) ( ON ?auto_78024 ?auto_78021 ) ( CLEAR ?auto_78024 ) ( ON ?auto_78022 ?auto_78025 ) ( CLEAR ?auto_78022 ) ( HAND-EMPTY ) ( not ( = ?auto_78018 ?auto_78025 ) ) ( not ( = ?auto_78019 ?auto_78025 ) ) ( not ( = ?auto_78020 ?auto_78025 ) ) ( not ( = ?auto_78023 ?auto_78025 ) ) ( not ( = ?auto_78021 ?auto_78025 ) ) ( not ( = ?auto_78024 ?auto_78025 ) ) ( not ( = ?auto_78022 ?auto_78025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78022 ?auto_78025 )
      ( MAKE-3PILE ?auto_78018 ?auto_78019 ?auto_78020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78026 - BLOCK
      ?auto_78027 - BLOCK
      ?auto_78028 - BLOCK
    )
    :vars
    (
      ?auto_78029 - BLOCK
      ?auto_78031 - BLOCK
      ?auto_78032 - BLOCK
      ?auto_78033 - BLOCK
      ?auto_78030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78029 ?auto_78028 ) ( ON-TABLE ?auto_78026 ) ( ON ?auto_78027 ?auto_78026 ) ( ON ?auto_78028 ?auto_78027 ) ( not ( = ?auto_78026 ?auto_78027 ) ) ( not ( = ?auto_78026 ?auto_78028 ) ) ( not ( = ?auto_78026 ?auto_78029 ) ) ( not ( = ?auto_78027 ?auto_78028 ) ) ( not ( = ?auto_78027 ?auto_78029 ) ) ( not ( = ?auto_78028 ?auto_78029 ) ) ( not ( = ?auto_78026 ?auto_78031 ) ) ( not ( = ?auto_78026 ?auto_78032 ) ) ( not ( = ?auto_78027 ?auto_78031 ) ) ( not ( = ?auto_78027 ?auto_78032 ) ) ( not ( = ?auto_78028 ?auto_78031 ) ) ( not ( = ?auto_78028 ?auto_78032 ) ) ( not ( = ?auto_78029 ?auto_78031 ) ) ( not ( = ?auto_78029 ?auto_78032 ) ) ( not ( = ?auto_78031 ?auto_78032 ) ) ( ON ?auto_78031 ?auto_78029 ) ( not ( = ?auto_78033 ?auto_78032 ) ) ( not ( = ?auto_78026 ?auto_78033 ) ) ( not ( = ?auto_78027 ?auto_78033 ) ) ( not ( = ?auto_78028 ?auto_78033 ) ) ( not ( = ?auto_78029 ?auto_78033 ) ) ( not ( = ?auto_78031 ?auto_78033 ) ) ( ON ?auto_78033 ?auto_78030 ) ( CLEAR ?auto_78033 ) ( not ( = ?auto_78026 ?auto_78030 ) ) ( not ( = ?auto_78027 ?auto_78030 ) ) ( not ( = ?auto_78028 ?auto_78030 ) ) ( not ( = ?auto_78029 ?auto_78030 ) ) ( not ( = ?auto_78031 ?auto_78030 ) ) ( not ( = ?auto_78032 ?auto_78030 ) ) ( not ( = ?auto_78033 ?auto_78030 ) ) ( HOLDING ?auto_78032 ) ( CLEAR ?auto_78031 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78026 ?auto_78027 ?auto_78028 ?auto_78029 ?auto_78031 ?auto_78032 )
      ( MAKE-3PILE ?auto_78026 ?auto_78027 ?auto_78028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78088 - BLOCK
      ?auto_78089 - BLOCK
      ?auto_78090 - BLOCK
      ?auto_78091 - BLOCK
    )
    :vars
    (
      ?auto_78092 - BLOCK
      ?auto_78093 - BLOCK
      ?auto_78094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78088 ) ( ON ?auto_78089 ?auto_78088 ) ( not ( = ?auto_78088 ?auto_78089 ) ) ( not ( = ?auto_78088 ?auto_78090 ) ) ( not ( = ?auto_78088 ?auto_78091 ) ) ( not ( = ?auto_78089 ?auto_78090 ) ) ( not ( = ?auto_78089 ?auto_78091 ) ) ( not ( = ?auto_78090 ?auto_78091 ) ) ( ON ?auto_78091 ?auto_78092 ) ( not ( = ?auto_78088 ?auto_78092 ) ) ( not ( = ?auto_78089 ?auto_78092 ) ) ( not ( = ?auto_78090 ?auto_78092 ) ) ( not ( = ?auto_78091 ?auto_78092 ) ) ( CLEAR ?auto_78089 ) ( ON ?auto_78090 ?auto_78091 ) ( CLEAR ?auto_78090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78093 ) ( ON ?auto_78094 ?auto_78093 ) ( ON ?auto_78092 ?auto_78094 ) ( not ( = ?auto_78093 ?auto_78094 ) ) ( not ( = ?auto_78093 ?auto_78092 ) ) ( not ( = ?auto_78093 ?auto_78091 ) ) ( not ( = ?auto_78093 ?auto_78090 ) ) ( not ( = ?auto_78094 ?auto_78092 ) ) ( not ( = ?auto_78094 ?auto_78091 ) ) ( not ( = ?auto_78094 ?auto_78090 ) ) ( not ( = ?auto_78088 ?auto_78093 ) ) ( not ( = ?auto_78088 ?auto_78094 ) ) ( not ( = ?auto_78089 ?auto_78093 ) ) ( not ( = ?auto_78089 ?auto_78094 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78093 ?auto_78094 ?auto_78092 ?auto_78091 )
      ( MAKE-4PILE ?auto_78088 ?auto_78089 ?auto_78090 ?auto_78091 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78095 - BLOCK
      ?auto_78096 - BLOCK
      ?auto_78097 - BLOCK
      ?auto_78098 - BLOCK
    )
    :vars
    (
      ?auto_78099 - BLOCK
      ?auto_78101 - BLOCK
      ?auto_78100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78095 ) ( not ( = ?auto_78095 ?auto_78096 ) ) ( not ( = ?auto_78095 ?auto_78097 ) ) ( not ( = ?auto_78095 ?auto_78098 ) ) ( not ( = ?auto_78096 ?auto_78097 ) ) ( not ( = ?auto_78096 ?auto_78098 ) ) ( not ( = ?auto_78097 ?auto_78098 ) ) ( ON ?auto_78098 ?auto_78099 ) ( not ( = ?auto_78095 ?auto_78099 ) ) ( not ( = ?auto_78096 ?auto_78099 ) ) ( not ( = ?auto_78097 ?auto_78099 ) ) ( not ( = ?auto_78098 ?auto_78099 ) ) ( ON ?auto_78097 ?auto_78098 ) ( CLEAR ?auto_78097 ) ( ON-TABLE ?auto_78101 ) ( ON ?auto_78100 ?auto_78101 ) ( ON ?auto_78099 ?auto_78100 ) ( not ( = ?auto_78101 ?auto_78100 ) ) ( not ( = ?auto_78101 ?auto_78099 ) ) ( not ( = ?auto_78101 ?auto_78098 ) ) ( not ( = ?auto_78101 ?auto_78097 ) ) ( not ( = ?auto_78100 ?auto_78099 ) ) ( not ( = ?auto_78100 ?auto_78098 ) ) ( not ( = ?auto_78100 ?auto_78097 ) ) ( not ( = ?auto_78095 ?auto_78101 ) ) ( not ( = ?auto_78095 ?auto_78100 ) ) ( not ( = ?auto_78096 ?auto_78101 ) ) ( not ( = ?auto_78096 ?auto_78100 ) ) ( HOLDING ?auto_78096 ) ( CLEAR ?auto_78095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78095 ?auto_78096 )
      ( MAKE-4PILE ?auto_78095 ?auto_78096 ?auto_78097 ?auto_78098 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78102 - BLOCK
      ?auto_78103 - BLOCK
      ?auto_78104 - BLOCK
      ?auto_78105 - BLOCK
    )
    :vars
    (
      ?auto_78106 - BLOCK
      ?auto_78107 - BLOCK
      ?auto_78108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78102 ) ( not ( = ?auto_78102 ?auto_78103 ) ) ( not ( = ?auto_78102 ?auto_78104 ) ) ( not ( = ?auto_78102 ?auto_78105 ) ) ( not ( = ?auto_78103 ?auto_78104 ) ) ( not ( = ?auto_78103 ?auto_78105 ) ) ( not ( = ?auto_78104 ?auto_78105 ) ) ( ON ?auto_78105 ?auto_78106 ) ( not ( = ?auto_78102 ?auto_78106 ) ) ( not ( = ?auto_78103 ?auto_78106 ) ) ( not ( = ?auto_78104 ?auto_78106 ) ) ( not ( = ?auto_78105 ?auto_78106 ) ) ( ON ?auto_78104 ?auto_78105 ) ( ON-TABLE ?auto_78107 ) ( ON ?auto_78108 ?auto_78107 ) ( ON ?auto_78106 ?auto_78108 ) ( not ( = ?auto_78107 ?auto_78108 ) ) ( not ( = ?auto_78107 ?auto_78106 ) ) ( not ( = ?auto_78107 ?auto_78105 ) ) ( not ( = ?auto_78107 ?auto_78104 ) ) ( not ( = ?auto_78108 ?auto_78106 ) ) ( not ( = ?auto_78108 ?auto_78105 ) ) ( not ( = ?auto_78108 ?auto_78104 ) ) ( not ( = ?auto_78102 ?auto_78107 ) ) ( not ( = ?auto_78102 ?auto_78108 ) ) ( not ( = ?auto_78103 ?auto_78107 ) ) ( not ( = ?auto_78103 ?auto_78108 ) ) ( CLEAR ?auto_78102 ) ( ON ?auto_78103 ?auto_78104 ) ( CLEAR ?auto_78103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78107 ?auto_78108 ?auto_78106 ?auto_78105 ?auto_78104 )
      ( MAKE-4PILE ?auto_78102 ?auto_78103 ?auto_78104 ?auto_78105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78109 - BLOCK
      ?auto_78110 - BLOCK
      ?auto_78111 - BLOCK
      ?auto_78112 - BLOCK
    )
    :vars
    (
      ?auto_78114 - BLOCK
      ?auto_78113 - BLOCK
      ?auto_78115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78109 ?auto_78110 ) ) ( not ( = ?auto_78109 ?auto_78111 ) ) ( not ( = ?auto_78109 ?auto_78112 ) ) ( not ( = ?auto_78110 ?auto_78111 ) ) ( not ( = ?auto_78110 ?auto_78112 ) ) ( not ( = ?auto_78111 ?auto_78112 ) ) ( ON ?auto_78112 ?auto_78114 ) ( not ( = ?auto_78109 ?auto_78114 ) ) ( not ( = ?auto_78110 ?auto_78114 ) ) ( not ( = ?auto_78111 ?auto_78114 ) ) ( not ( = ?auto_78112 ?auto_78114 ) ) ( ON ?auto_78111 ?auto_78112 ) ( ON-TABLE ?auto_78113 ) ( ON ?auto_78115 ?auto_78113 ) ( ON ?auto_78114 ?auto_78115 ) ( not ( = ?auto_78113 ?auto_78115 ) ) ( not ( = ?auto_78113 ?auto_78114 ) ) ( not ( = ?auto_78113 ?auto_78112 ) ) ( not ( = ?auto_78113 ?auto_78111 ) ) ( not ( = ?auto_78115 ?auto_78114 ) ) ( not ( = ?auto_78115 ?auto_78112 ) ) ( not ( = ?auto_78115 ?auto_78111 ) ) ( not ( = ?auto_78109 ?auto_78113 ) ) ( not ( = ?auto_78109 ?auto_78115 ) ) ( not ( = ?auto_78110 ?auto_78113 ) ) ( not ( = ?auto_78110 ?auto_78115 ) ) ( ON ?auto_78110 ?auto_78111 ) ( CLEAR ?auto_78110 ) ( HOLDING ?auto_78109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78109 )
      ( MAKE-4PILE ?auto_78109 ?auto_78110 ?auto_78111 ?auto_78112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78116 - BLOCK
      ?auto_78117 - BLOCK
      ?auto_78118 - BLOCK
      ?auto_78119 - BLOCK
    )
    :vars
    (
      ?auto_78121 - BLOCK
      ?auto_78122 - BLOCK
      ?auto_78120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78116 ?auto_78117 ) ) ( not ( = ?auto_78116 ?auto_78118 ) ) ( not ( = ?auto_78116 ?auto_78119 ) ) ( not ( = ?auto_78117 ?auto_78118 ) ) ( not ( = ?auto_78117 ?auto_78119 ) ) ( not ( = ?auto_78118 ?auto_78119 ) ) ( ON ?auto_78119 ?auto_78121 ) ( not ( = ?auto_78116 ?auto_78121 ) ) ( not ( = ?auto_78117 ?auto_78121 ) ) ( not ( = ?auto_78118 ?auto_78121 ) ) ( not ( = ?auto_78119 ?auto_78121 ) ) ( ON ?auto_78118 ?auto_78119 ) ( ON-TABLE ?auto_78122 ) ( ON ?auto_78120 ?auto_78122 ) ( ON ?auto_78121 ?auto_78120 ) ( not ( = ?auto_78122 ?auto_78120 ) ) ( not ( = ?auto_78122 ?auto_78121 ) ) ( not ( = ?auto_78122 ?auto_78119 ) ) ( not ( = ?auto_78122 ?auto_78118 ) ) ( not ( = ?auto_78120 ?auto_78121 ) ) ( not ( = ?auto_78120 ?auto_78119 ) ) ( not ( = ?auto_78120 ?auto_78118 ) ) ( not ( = ?auto_78116 ?auto_78122 ) ) ( not ( = ?auto_78116 ?auto_78120 ) ) ( not ( = ?auto_78117 ?auto_78122 ) ) ( not ( = ?auto_78117 ?auto_78120 ) ) ( ON ?auto_78117 ?auto_78118 ) ( ON ?auto_78116 ?auto_78117 ) ( CLEAR ?auto_78116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78122 ?auto_78120 ?auto_78121 ?auto_78119 ?auto_78118 ?auto_78117 )
      ( MAKE-4PILE ?auto_78116 ?auto_78117 ?auto_78118 ?auto_78119 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78127 - BLOCK
      ?auto_78128 - BLOCK
      ?auto_78129 - BLOCK
      ?auto_78130 - BLOCK
    )
    :vars
    (
      ?auto_78133 - BLOCK
      ?auto_78131 - BLOCK
      ?auto_78132 - BLOCK
      ?auto_78134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78127 ?auto_78128 ) ) ( not ( = ?auto_78127 ?auto_78129 ) ) ( not ( = ?auto_78127 ?auto_78130 ) ) ( not ( = ?auto_78128 ?auto_78129 ) ) ( not ( = ?auto_78128 ?auto_78130 ) ) ( not ( = ?auto_78129 ?auto_78130 ) ) ( ON ?auto_78130 ?auto_78133 ) ( not ( = ?auto_78127 ?auto_78133 ) ) ( not ( = ?auto_78128 ?auto_78133 ) ) ( not ( = ?auto_78129 ?auto_78133 ) ) ( not ( = ?auto_78130 ?auto_78133 ) ) ( ON ?auto_78129 ?auto_78130 ) ( ON-TABLE ?auto_78131 ) ( ON ?auto_78132 ?auto_78131 ) ( ON ?auto_78133 ?auto_78132 ) ( not ( = ?auto_78131 ?auto_78132 ) ) ( not ( = ?auto_78131 ?auto_78133 ) ) ( not ( = ?auto_78131 ?auto_78130 ) ) ( not ( = ?auto_78131 ?auto_78129 ) ) ( not ( = ?auto_78132 ?auto_78133 ) ) ( not ( = ?auto_78132 ?auto_78130 ) ) ( not ( = ?auto_78132 ?auto_78129 ) ) ( not ( = ?auto_78127 ?auto_78131 ) ) ( not ( = ?auto_78127 ?auto_78132 ) ) ( not ( = ?auto_78128 ?auto_78131 ) ) ( not ( = ?auto_78128 ?auto_78132 ) ) ( ON ?auto_78128 ?auto_78129 ) ( CLEAR ?auto_78128 ) ( ON ?auto_78127 ?auto_78134 ) ( CLEAR ?auto_78127 ) ( HAND-EMPTY ) ( not ( = ?auto_78127 ?auto_78134 ) ) ( not ( = ?auto_78128 ?auto_78134 ) ) ( not ( = ?auto_78129 ?auto_78134 ) ) ( not ( = ?auto_78130 ?auto_78134 ) ) ( not ( = ?auto_78133 ?auto_78134 ) ) ( not ( = ?auto_78131 ?auto_78134 ) ) ( not ( = ?auto_78132 ?auto_78134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78127 ?auto_78134 )
      ( MAKE-4PILE ?auto_78127 ?auto_78128 ?auto_78129 ?auto_78130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78135 - BLOCK
      ?auto_78136 - BLOCK
      ?auto_78137 - BLOCK
      ?auto_78138 - BLOCK
    )
    :vars
    (
      ?auto_78140 - BLOCK
      ?auto_78139 - BLOCK
      ?auto_78141 - BLOCK
      ?auto_78142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78135 ?auto_78136 ) ) ( not ( = ?auto_78135 ?auto_78137 ) ) ( not ( = ?auto_78135 ?auto_78138 ) ) ( not ( = ?auto_78136 ?auto_78137 ) ) ( not ( = ?auto_78136 ?auto_78138 ) ) ( not ( = ?auto_78137 ?auto_78138 ) ) ( ON ?auto_78138 ?auto_78140 ) ( not ( = ?auto_78135 ?auto_78140 ) ) ( not ( = ?auto_78136 ?auto_78140 ) ) ( not ( = ?auto_78137 ?auto_78140 ) ) ( not ( = ?auto_78138 ?auto_78140 ) ) ( ON ?auto_78137 ?auto_78138 ) ( ON-TABLE ?auto_78139 ) ( ON ?auto_78141 ?auto_78139 ) ( ON ?auto_78140 ?auto_78141 ) ( not ( = ?auto_78139 ?auto_78141 ) ) ( not ( = ?auto_78139 ?auto_78140 ) ) ( not ( = ?auto_78139 ?auto_78138 ) ) ( not ( = ?auto_78139 ?auto_78137 ) ) ( not ( = ?auto_78141 ?auto_78140 ) ) ( not ( = ?auto_78141 ?auto_78138 ) ) ( not ( = ?auto_78141 ?auto_78137 ) ) ( not ( = ?auto_78135 ?auto_78139 ) ) ( not ( = ?auto_78135 ?auto_78141 ) ) ( not ( = ?auto_78136 ?auto_78139 ) ) ( not ( = ?auto_78136 ?auto_78141 ) ) ( ON ?auto_78135 ?auto_78142 ) ( CLEAR ?auto_78135 ) ( not ( = ?auto_78135 ?auto_78142 ) ) ( not ( = ?auto_78136 ?auto_78142 ) ) ( not ( = ?auto_78137 ?auto_78142 ) ) ( not ( = ?auto_78138 ?auto_78142 ) ) ( not ( = ?auto_78140 ?auto_78142 ) ) ( not ( = ?auto_78139 ?auto_78142 ) ) ( not ( = ?auto_78141 ?auto_78142 ) ) ( HOLDING ?auto_78136 ) ( CLEAR ?auto_78137 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78139 ?auto_78141 ?auto_78140 ?auto_78138 ?auto_78137 ?auto_78136 )
      ( MAKE-4PILE ?auto_78135 ?auto_78136 ?auto_78137 ?auto_78138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78143 - BLOCK
      ?auto_78144 - BLOCK
      ?auto_78145 - BLOCK
      ?auto_78146 - BLOCK
    )
    :vars
    (
      ?auto_78149 - BLOCK
      ?auto_78147 - BLOCK
      ?auto_78150 - BLOCK
      ?auto_78148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78143 ?auto_78144 ) ) ( not ( = ?auto_78143 ?auto_78145 ) ) ( not ( = ?auto_78143 ?auto_78146 ) ) ( not ( = ?auto_78144 ?auto_78145 ) ) ( not ( = ?auto_78144 ?auto_78146 ) ) ( not ( = ?auto_78145 ?auto_78146 ) ) ( ON ?auto_78146 ?auto_78149 ) ( not ( = ?auto_78143 ?auto_78149 ) ) ( not ( = ?auto_78144 ?auto_78149 ) ) ( not ( = ?auto_78145 ?auto_78149 ) ) ( not ( = ?auto_78146 ?auto_78149 ) ) ( ON ?auto_78145 ?auto_78146 ) ( ON-TABLE ?auto_78147 ) ( ON ?auto_78150 ?auto_78147 ) ( ON ?auto_78149 ?auto_78150 ) ( not ( = ?auto_78147 ?auto_78150 ) ) ( not ( = ?auto_78147 ?auto_78149 ) ) ( not ( = ?auto_78147 ?auto_78146 ) ) ( not ( = ?auto_78147 ?auto_78145 ) ) ( not ( = ?auto_78150 ?auto_78149 ) ) ( not ( = ?auto_78150 ?auto_78146 ) ) ( not ( = ?auto_78150 ?auto_78145 ) ) ( not ( = ?auto_78143 ?auto_78147 ) ) ( not ( = ?auto_78143 ?auto_78150 ) ) ( not ( = ?auto_78144 ?auto_78147 ) ) ( not ( = ?auto_78144 ?auto_78150 ) ) ( ON ?auto_78143 ?auto_78148 ) ( not ( = ?auto_78143 ?auto_78148 ) ) ( not ( = ?auto_78144 ?auto_78148 ) ) ( not ( = ?auto_78145 ?auto_78148 ) ) ( not ( = ?auto_78146 ?auto_78148 ) ) ( not ( = ?auto_78149 ?auto_78148 ) ) ( not ( = ?auto_78147 ?auto_78148 ) ) ( not ( = ?auto_78150 ?auto_78148 ) ) ( CLEAR ?auto_78145 ) ( ON ?auto_78144 ?auto_78143 ) ( CLEAR ?auto_78144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78148 ?auto_78143 )
      ( MAKE-4PILE ?auto_78143 ?auto_78144 ?auto_78145 ?auto_78146 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78151 - BLOCK
      ?auto_78152 - BLOCK
      ?auto_78153 - BLOCK
      ?auto_78154 - BLOCK
    )
    :vars
    (
      ?auto_78155 - BLOCK
      ?auto_78156 - BLOCK
      ?auto_78157 - BLOCK
      ?auto_78158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78151 ?auto_78152 ) ) ( not ( = ?auto_78151 ?auto_78153 ) ) ( not ( = ?auto_78151 ?auto_78154 ) ) ( not ( = ?auto_78152 ?auto_78153 ) ) ( not ( = ?auto_78152 ?auto_78154 ) ) ( not ( = ?auto_78153 ?auto_78154 ) ) ( ON ?auto_78154 ?auto_78155 ) ( not ( = ?auto_78151 ?auto_78155 ) ) ( not ( = ?auto_78152 ?auto_78155 ) ) ( not ( = ?auto_78153 ?auto_78155 ) ) ( not ( = ?auto_78154 ?auto_78155 ) ) ( ON-TABLE ?auto_78156 ) ( ON ?auto_78157 ?auto_78156 ) ( ON ?auto_78155 ?auto_78157 ) ( not ( = ?auto_78156 ?auto_78157 ) ) ( not ( = ?auto_78156 ?auto_78155 ) ) ( not ( = ?auto_78156 ?auto_78154 ) ) ( not ( = ?auto_78156 ?auto_78153 ) ) ( not ( = ?auto_78157 ?auto_78155 ) ) ( not ( = ?auto_78157 ?auto_78154 ) ) ( not ( = ?auto_78157 ?auto_78153 ) ) ( not ( = ?auto_78151 ?auto_78156 ) ) ( not ( = ?auto_78151 ?auto_78157 ) ) ( not ( = ?auto_78152 ?auto_78156 ) ) ( not ( = ?auto_78152 ?auto_78157 ) ) ( ON ?auto_78151 ?auto_78158 ) ( not ( = ?auto_78151 ?auto_78158 ) ) ( not ( = ?auto_78152 ?auto_78158 ) ) ( not ( = ?auto_78153 ?auto_78158 ) ) ( not ( = ?auto_78154 ?auto_78158 ) ) ( not ( = ?auto_78155 ?auto_78158 ) ) ( not ( = ?auto_78156 ?auto_78158 ) ) ( not ( = ?auto_78157 ?auto_78158 ) ) ( ON ?auto_78152 ?auto_78151 ) ( CLEAR ?auto_78152 ) ( ON-TABLE ?auto_78158 ) ( HOLDING ?auto_78153 ) ( CLEAR ?auto_78154 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78156 ?auto_78157 ?auto_78155 ?auto_78154 ?auto_78153 )
      ( MAKE-4PILE ?auto_78151 ?auto_78152 ?auto_78153 ?auto_78154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78159 - BLOCK
      ?auto_78160 - BLOCK
      ?auto_78161 - BLOCK
      ?auto_78162 - BLOCK
    )
    :vars
    (
      ?auto_78164 - BLOCK
      ?auto_78165 - BLOCK
      ?auto_78163 - BLOCK
      ?auto_78166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78159 ?auto_78160 ) ) ( not ( = ?auto_78159 ?auto_78161 ) ) ( not ( = ?auto_78159 ?auto_78162 ) ) ( not ( = ?auto_78160 ?auto_78161 ) ) ( not ( = ?auto_78160 ?auto_78162 ) ) ( not ( = ?auto_78161 ?auto_78162 ) ) ( ON ?auto_78162 ?auto_78164 ) ( not ( = ?auto_78159 ?auto_78164 ) ) ( not ( = ?auto_78160 ?auto_78164 ) ) ( not ( = ?auto_78161 ?auto_78164 ) ) ( not ( = ?auto_78162 ?auto_78164 ) ) ( ON-TABLE ?auto_78165 ) ( ON ?auto_78163 ?auto_78165 ) ( ON ?auto_78164 ?auto_78163 ) ( not ( = ?auto_78165 ?auto_78163 ) ) ( not ( = ?auto_78165 ?auto_78164 ) ) ( not ( = ?auto_78165 ?auto_78162 ) ) ( not ( = ?auto_78165 ?auto_78161 ) ) ( not ( = ?auto_78163 ?auto_78164 ) ) ( not ( = ?auto_78163 ?auto_78162 ) ) ( not ( = ?auto_78163 ?auto_78161 ) ) ( not ( = ?auto_78159 ?auto_78165 ) ) ( not ( = ?auto_78159 ?auto_78163 ) ) ( not ( = ?auto_78160 ?auto_78165 ) ) ( not ( = ?auto_78160 ?auto_78163 ) ) ( ON ?auto_78159 ?auto_78166 ) ( not ( = ?auto_78159 ?auto_78166 ) ) ( not ( = ?auto_78160 ?auto_78166 ) ) ( not ( = ?auto_78161 ?auto_78166 ) ) ( not ( = ?auto_78162 ?auto_78166 ) ) ( not ( = ?auto_78164 ?auto_78166 ) ) ( not ( = ?auto_78165 ?auto_78166 ) ) ( not ( = ?auto_78163 ?auto_78166 ) ) ( ON ?auto_78160 ?auto_78159 ) ( ON-TABLE ?auto_78166 ) ( CLEAR ?auto_78162 ) ( ON ?auto_78161 ?auto_78160 ) ( CLEAR ?auto_78161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78166 ?auto_78159 ?auto_78160 )
      ( MAKE-4PILE ?auto_78159 ?auto_78160 ?auto_78161 ?auto_78162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78167 - BLOCK
      ?auto_78168 - BLOCK
      ?auto_78169 - BLOCK
      ?auto_78170 - BLOCK
    )
    :vars
    (
      ?auto_78174 - BLOCK
      ?auto_78172 - BLOCK
      ?auto_78173 - BLOCK
      ?auto_78171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78167 ?auto_78168 ) ) ( not ( = ?auto_78167 ?auto_78169 ) ) ( not ( = ?auto_78167 ?auto_78170 ) ) ( not ( = ?auto_78168 ?auto_78169 ) ) ( not ( = ?auto_78168 ?auto_78170 ) ) ( not ( = ?auto_78169 ?auto_78170 ) ) ( not ( = ?auto_78167 ?auto_78174 ) ) ( not ( = ?auto_78168 ?auto_78174 ) ) ( not ( = ?auto_78169 ?auto_78174 ) ) ( not ( = ?auto_78170 ?auto_78174 ) ) ( ON-TABLE ?auto_78172 ) ( ON ?auto_78173 ?auto_78172 ) ( ON ?auto_78174 ?auto_78173 ) ( not ( = ?auto_78172 ?auto_78173 ) ) ( not ( = ?auto_78172 ?auto_78174 ) ) ( not ( = ?auto_78172 ?auto_78170 ) ) ( not ( = ?auto_78172 ?auto_78169 ) ) ( not ( = ?auto_78173 ?auto_78174 ) ) ( not ( = ?auto_78173 ?auto_78170 ) ) ( not ( = ?auto_78173 ?auto_78169 ) ) ( not ( = ?auto_78167 ?auto_78172 ) ) ( not ( = ?auto_78167 ?auto_78173 ) ) ( not ( = ?auto_78168 ?auto_78172 ) ) ( not ( = ?auto_78168 ?auto_78173 ) ) ( ON ?auto_78167 ?auto_78171 ) ( not ( = ?auto_78167 ?auto_78171 ) ) ( not ( = ?auto_78168 ?auto_78171 ) ) ( not ( = ?auto_78169 ?auto_78171 ) ) ( not ( = ?auto_78170 ?auto_78171 ) ) ( not ( = ?auto_78174 ?auto_78171 ) ) ( not ( = ?auto_78172 ?auto_78171 ) ) ( not ( = ?auto_78173 ?auto_78171 ) ) ( ON ?auto_78168 ?auto_78167 ) ( ON-TABLE ?auto_78171 ) ( ON ?auto_78169 ?auto_78168 ) ( CLEAR ?auto_78169 ) ( HOLDING ?auto_78170 ) ( CLEAR ?auto_78174 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78172 ?auto_78173 ?auto_78174 ?auto_78170 )
      ( MAKE-4PILE ?auto_78167 ?auto_78168 ?auto_78169 ?auto_78170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78175 - BLOCK
      ?auto_78176 - BLOCK
      ?auto_78177 - BLOCK
      ?auto_78178 - BLOCK
    )
    :vars
    (
      ?auto_78182 - BLOCK
      ?auto_78181 - BLOCK
      ?auto_78180 - BLOCK
      ?auto_78179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78175 ?auto_78176 ) ) ( not ( = ?auto_78175 ?auto_78177 ) ) ( not ( = ?auto_78175 ?auto_78178 ) ) ( not ( = ?auto_78176 ?auto_78177 ) ) ( not ( = ?auto_78176 ?auto_78178 ) ) ( not ( = ?auto_78177 ?auto_78178 ) ) ( not ( = ?auto_78175 ?auto_78182 ) ) ( not ( = ?auto_78176 ?auto_78182 ) ) ( not ( = ?auto_78177 ?auto_78182 ) ) ( not ( = ?auto_78178 ?auto_78182 ) ) ( ON-TABLE ?auto_78181 ) ( ON ?auto_78180 ?auto_78181 ) ( ON ?auto_78182 ?auto_78180 ) ( not ( = ?auto_78181 ?auto_78180 ) ) ( not ( = ?auto_78181 ?auto_78182 ) ) ( not ( = ?auto_78181 ?auto_78178 ) ) ( not ( = ?auto_78181 ?auto_78177 ) ) ( not ( = ?auto_78180 ?auto_78182 ) ) ( not ( = ?auto_78180 ?auto_78178 ) ) ( not ( = ?auto_78180 ?auto_78177 ) ) ( not ( = ?auto_78175 ?auto_78181 ) ) ( not ( = ?auto_78175 ?auto_78180 ) ) ( not ( = ?auto_78176 ?auto_78181 ) ) ( not ( = ?auto_78176 ?auto_78180 ) ) ( ON ?auto_78175 ?auto_78179 ) ( not ( = ?auto_78175 ?auto_78179 ) ) ( not ( = ?auto_78176 ?auto_78179 ) ) ( not ( = ?auto_78177 ?auto_78179 ) ) ( not ( = ?auto_78178 ?auto_78179 ) ) ( not ( = ?auto_78182 ?auto_78179 ) ) ( not ( = ?auto_78181 ?auto_78179 ) ) ( not ( = ?auto_78180 ?auto_78179 ) ) ( ON ?auto_78176 ?auto_78175 ) ( ON-TABLE ?auto_78179 ) ( ON ?auto_78177 ?auto_78176 ) ( CLEAR ?auto_78182 ) ( ON ?auto_78178 ?auto_78177 ) ( CLEAR ?auto_78178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78179 ?auto_78175 ?auto_78176 ?auto_78177 )
      ( MAKE-4PILE ?auto_78175 ?auto_78176 ?auto_78177 ?auto_78178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78183 - BLOCK
      ?auto_78184 - BLOCK
      ?auto_78185 - BLOCK
      ?auto_78186 - BLOCK
    )
    :vars
    (
      ?auto_78190 - BLOCK
      ?auto_78187 - BLOCK
      ?auto_78189 - BLOCK
      ?auto_78188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78183 ?auto_78184 ) ) ( not ( = ?auto_78183 ?auto_78185 ) ) ( not ( = ?auto_78183 ?auto_78186 ) ) ( not ( = ?auto_78184 ?auto_78185 ) ) ( not ( = ?auto_78184 ?auto_78186 ) ) ( not ( = ?auto_78185 ?auto_78186 ) ) ( not ( = ?auto_78183 ?auto_78190 ) ) ( not ( = ?auto_78184 ?auto_78190 ) ) ( not ( = ?auto_78185 ?auto_78190 ) ) ( not ( = ?auto_78186 ?auto_78190 ) ) ( ON-TABLE ?auto_78187 ) ( ON ?auto_78189 ?auto_78187 ) ( not ( = ?auto_78187 ?auto_78189 ) ) ( not ( = ?auto_78187 ?auto_78190 ) ) ( not ( = ?auto_78187 ?auto_78186 ) ) ( not ( = ?auto_78187 ?auto_78185 ) ) ( not ( = ?auto_78189 ?auto_78190 ) ) ( not ( = ?auto_78189 ?auto_78186 ) ) ( not ( = ?auto_78189 ?auto_78185 ) ) ( not ( = ?auto_78183 ?auto_78187 ) ) ( not ( = ?auto_78183 ?auto_78189 ) ) ( not ( = ?auto_78184 ?auto_78187 ) ) ( not ( = ?auto_78184 ?auto_78189 ) ) ( ON ?auto_78183 ?auto_78188 ) ( not ( = ?auto_78183 ?auto_78188 ) ) ( not ( = ?auto_78184 ?auto_78188 ) ) ( not ( = ?auto_78185 ?auto_78188 ) ) ( not ( = ?auto_78186 ?auto_78188 ) ) ( not ( = ?auto_78190 ?auto_78188 ) ) ( not ( = ?auto_78187 ?auto_78188 ) ) ( not ( = ?auto_78189 ?auto_78188 ) ) ( ON ?auto_78184 ?auto_78183 ) ( ON-TABLE ?auto_78188 ) ( ON ?auto_78185 ?auto_78184 ) ( ON ?auto_78186 ?auto_78185 ) ( CLEAR ?auto_78186 ) ( HOLDING ?auto_78190 ) ( CLEAR ?auto_78189 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78187 ?auto_78189 ?auto_78190 )
      ( MAKE-4PILE ?auto_78183 ?auto_78184 ?auto_78185 ?auto_78186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78191 - BLOCK
      ?auto_78192 - BLOCK
      ?auto_78193 - BLOCK
      ?auto_78194 - BLOCK
    )
    :vars
    (
      ?auto_78197 - BLOCK
      ?auto_78195 - BLOCK
      ?auto_78198 - BLOCK
      ?auto_78196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78191 ?auto_78192 ) ) ( not ( = ?auto_78191 ?auto_78193 ) ) ( not ( = ?auto_78191 ?auto_78194 ) ) ( not ( = ?auto_78192 ?auto_78193 ) ) ( not ( = ?auto_78192 ?auto_78194 ) ) ( not ( = ?auto_78193 ?auto_78194 ) ) ( not ( = ?auto_78191 ?auto_78197 ) ) ( not ( = ?auto_78192 ?auto_78197 ) ) ( not ( = ?auto_78193 ?auto_78197 ) ) ( not ( = ?auto_78194 ?auto_78197 ) ) ( ON-TABLE ?auto_78195 ) ( ON ?auto_78198 ?auto_78195 ) ( not ( = ?auto_78195 ?auto_78198 ) ) ( not ( = ?auto_78195 ?auto_78197 ) ) ( not ( = ?auto_78195 ?auto_78194 ) ) ( not ( = ?auto_78195 ?auto_78193 ) ) ( not ( = ?auto_78198 ?auto_78197 ) ) ( not ( = ?auto_78198 ?auto_78194 ) ) ( not ( = ?auto_78198 ?auto_78193 ) ) ( not ( = ?auto_78191 ?auto_78195 ) ) ( not ( = ?auto_78191 ?auto_78198 ) ) ( not ( = ?auto_78192 ?auto_78195 ) ) ( not ( = ?auto_78192 ?auto_78198 ) ) ( ON ?auto_78191 ?auto_78196 ) ( not ( = ?auto_78191 ?auto_78196 ) ) ( not ( = ?auto_78192 ?auto_78196 ) ) ( not ( = ?auto_78193 ?auto_78196 ) ) ( not ( = ?auto_78194 ?auto_78196 ) ) ( not ( = ?auto_78197 ?auto_78196 ) ) ( not ( = ?auto_78195 ?auto_78196 ) ) ( not ( = ?auto_78198 ?auto_78196 ) ) ( ON ?auto_78192 ?auto_78191 ) ( ON-TABLE ?auto_78196 ) ( ON ?auto_78193 ?auto_78192 ) ( ON ?auto_78194 ?auto_78193 ) ( CLEAR ?auto_78198 ) ( ON ?auto_78197 ?auto_78194 ) ( CLEAR ?auto_78197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78196 ?auto_78191 ?auto_78192 ?auto_78193 ?auto_78194 )
      ( MAKE-4PILE ?auto_78191 ?auto_78192 ?auto_78193 ?auto_78194 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78199 - BLOCK
      ?auto_78200 - BLOCK
      ?auto_78201 - BLOCK
      ?auto_78202 - BLOCK
    )
    :vars
    (
      ?auto_78204 - BLOCK
      ?auto_78206 - BLOCK
      ?auto_78205 - BLOCK
      ?auto_78203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78199 ?auto_78200 ) ) ( not ( = ?auto_78199 ?auto_78201 ) ) ( not ( = ?auto_78199 ?auto_78202 ) ) ( not ( = ?auto_78200 ?auto_78201 ) ) ( not ( = ?auto_78200 ?auto_78202 ) ) ( not ( = ?auto_78201 ?auto_78202 ) ) ( not ( = ?auto_78199 ?auto_78204 ) ) ( not ( = ?auto_78200 ?auto_78204 ) ) ( not ( = ?auto_78201 ?auto_78204 ) ) ( not ( = ?auto_78202 ?auto_78204 ) ) ( ON-TABLE ?auto_78206 ) ( not ( = ?auto_78206 ?auto_78205 ) ) ( not ( = ?auto_78206 ?auto_78204 ) ) ( not ( = ?auto_78206 ?auto_78202 ) ) ( not ( = ?auto_78206 ?auto_78201 ) ) ( not ( = ?auto_78205 ?auto_78204 ) ) ( not ( = ?auto_78205 ?auto_78202 ) ) ( not ( = ?auto_78205 ?auto_78201 ) ) ( not ( = ?auto_78199 ?auto_78206 ) ) ( not ( = ?auto_78199 ?auto_78205 ) ) ( not ( = ?auto_78200 ?auto_78206 ) ) ( not ( = ?auto_78200 ?auto_78205 ) ) ( ON ?auto_78199 ?auto_78203 ) ( not ( = ?auto_78199 ?auto_78203 ) ) ( not ( = ?auto_78200 ?auto_78203 ) ) ( not ( = ?auto_78201 ?auto_78203 ) ) ( not ( = ?auto_78202 ?auto_78203 ) ) ( not ( = ?auto_78204 ?auto_78203 ) ) ( not ( = ?auto_78206 ?auto_78203 ) ) ( not ( = ?auto_78205 ?auto_78203 ) ) ( ON ?auto_78200 ?auto_78199 ) ( ON-TABLE ?auto_78203 ) ( ON ?auto_78201 ?auto_78200 ) ( ON ?auto_78202 ?auto_78201 ) ( ON ?auto_78204 ?auto_78202 ) ( CLEAR ?auto_78204 ) ( HOLDING ?auto_78205 ) ( CLEAR ?auto_78206 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78206 ?auto_78205 )
      ( MAKE-4PILE ?auto_78199 ?auto_78200 ?auto_78201 ?auto_78202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78207 - BLOCK
      ?auto_78208 - BLOCK
      ?auto_78209 - BLOCK
      ?auto_78210 - BLOCK
    )
    :vars
    (
      ?auto_78211 - BLOCK
      ?auto_78212 - BLOCK
      ?auto_78214 - BLOCK
      ?auto_78213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78207 ?auto_78208 ) ) ( not ( = ?auto_78207 ?auto_78209 ) ) ( not ( = ?auto_78207 ?auto_78210 ) ) ( not ( = ?auto_78208 ?auto_78209 ) ) ( not ( = ?auto_78208 ?auto_78210 ) ) ( not ( = ?auto_78209 ?auto_78210 ) ) ( not ( = ?auto_78207 ?auto_78211 ) ) ( not ( = ?auto_78208 ?auto_78211 ) ) ( not ( = ?auto_78209 ?auto_78211 ) ) ( not ( = ?auto_78210 ?auto_78211 ) ) ( ON-TABLE ?auto_78212 ) ( not ( = ?auto_78212 ?auto_78214 ) ) ( not ( = ?auto_78212 ?auto_78211 ) ) ( not ( = ?auto_78212 ?auto_78210 ) ) ( not ( = ?auto_78212 ?auto_78209 ) ) ( not ( = ?auto_78214 ?auto_78211 ) ) ( not ( = ?auto_78214 ?auto_78210 ) ) ( not ( = ?auto_78214 ?auto_78209 ) ) ( not ( = ?auto_78207 ?auto_78212 ) ) ( not ( = ?auto_78207 ?auto_78214 ) ) ( not ( = ?auto_78208 ?auto_78212 ) ) ( not ( = ?auto_78208 ?auto_78214 ) ) ( ON ?auto_78207 ?auto_78213 ) ( not ( = ?auto_78207 ?auto_78213 ) ) ( not ( = ?auto_78208 ?auto_78213 ) ) ( not ( = ?auto_78209 ?auto_78213 ) ) ( not ( = ?auto_78210 ?auto_78213 ) ) ( not ( = ?auto_78211 ?auto_78213 ) ) ( not ( = ?auto_78212 ?auto_78213 ) ) ( not ( = ?auto_78214 ?auto_78213 ) ) ( ON ?auto_78208 ?auto_78207 ) ( ON-TABLE ?auto_78213 ) ( ON ?auto_78209 ?auto_78208 ) ( ON ?auto_78210 ?auto_78209 ) ( ON ?auto_78211 ?auto_78210 ) ( CLEAR ?auto_78212 ) ( ON ?auto_78214 ?auto_78211 ) ( CLEAR ?auto_78214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78213 ?auto_78207 ?auto_78208 ?auto_78209 ?auto_78210 ?auto_78211 )
      ( MAKE-4PILE ?auto_78207 ?auto_78208 ?auto_78209 ?auto_78210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78215 - BLOCK
      ?auto_78216 - BLOCK
      ?auto_78217 - BLOCK
      ?auto_78218 - BLOCK
    )
    :vars
    (
      ?auto_78222 - BLOCK
      ?auto_78220 - BLOCK
      ?auto_78219 - BLOCK
      ?auto_78221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78215 ?auto_78216 ) ) ( not ( = ?auto_78215 ?auto_78217 ) ) ( not ( = ?auto_78215 ?auto_78218 ) ) ( not ( = ?auto_78216 ?auto_78217 ) ) ( not ( = ?auto_78216 ?auto_78218 ) ) ( not ( = ?auto_78217 ?auto_78218 ) ) ( not ( = ?auto_78215 ?auto_78222 ) ) ( not ( = ?auto_78216 ?auto_78222 ) ) ( not ( = ?auto_78217 ?auto_78222 ) ) ( not ( = ?auto_78218 ?auto_78222 ) ) ( not ( = ?auto_78220 ?auto_78219 ) ) ( not ( = ?auto_78220 ?auto_78222 ) ) ( not ( = ?auto_78220 ?auto_78218 ) ) ( not ( = ?auto_78220 ?auto_78217 ) ) ( not ( = ?auto_78219 ?auto_78222 ) ) ( not ( = ?auto_78219 ?auto_78218 ) ) ( not ( = ?auto_78219 ?auto_78217 ) ) ( not ( = ?auto_78215 ?auto_78220 ) ) ( not ( = ?auto_78215 ?auto_78219 ) ) ( not ( = ?auto_78216 ?auto_78220 ) ) ( not ( = ?auto_78216 ?auto_78219 ) ) ( ON ?auto_78215 ?auto_78221 ) ( not ( = ?auto_78215 ?auto_78221 ) ) ( not ( = ?auto_78216 ?auto_78221 ) ) ( not ( = ?auto_78217 ?auto_78221 ) ) ( not ( = ?auto_78218 ?auto_78221 ) ) ( not ( = ?auto_78222 ?auto_78221 ) ) ( not ( = ?auto_78220 ?auto_78221 ) ) ( not ( = ?auto_78219 ?auto_78221 ) ) ( ON ?auto_78216 ?auto_78215 ) ( ON-TABLE ?auto_78221 ) ( ON ?auto_78217 ?auto_78216 ) ( ON ?auto_78218 ?auto_78217 ) ( ON ?auto_78222 ?auto_78218 ) ( ON ?auto_78219 ?auto_78222 ) ( CLEAR ?auto_78219 ) ( HOLDING ?auto_78220 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78220 )
      ( MAKE-4PILE ?auto_78215 ?auto_78216 ?auto_78217 ?auto_78218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78223 - BLOCK
      ?auto_78224 - BLOCK
      ?auto_78225 - BLOCK
      ?auto_78226 - BLOCK
    )
    :vars
    (
      ?auto_78230 - BLOCK
      ?auto_78228 - BLOCK
      ?auto_78229 - BLOCK
      ?auto_78227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78223 ?auto_78224 ) ) ( not ( = ?auto_78223 ?auto_78225 ) ) ( not ( = ?auto_78223 ?auto_78226 ) ) ( not ( = ?auto_78224 ?auto_78225 ) ) ( not ( = ?auto_78224 ?auto_78226 ) ) ( not ( = ?auto_78225 ?auto_78226 ) ) ( not ( = ?auto_78223 ?auto_78230 ) ) ( not ( = ?auto_78224 ?auto_78230 ) ) ( not ( = ?auto_78225 ?auto_78230 ) ) ( not ( = ?auto_78226 ?auto_78230 ) ) ( not ( = ?auto_78228 ?auto_78229 ) ) ( not ( = ?auto_78228 ?auto_78230 ) ) ( not ( = ?auto_78228 ?auto_78226 ) ) ( not ( = ?auto_78228 ?auto_78225 ) ) ( not ( = ?auto_78229 ?auto_78230 ) ) ( not ( = ?auto_78229 ?auto_78226 ) ) ( not ( = ?auto_78229 ?auto_78225 ) ) ( not ( = ?auto_78223 ?auto_78228 ) ) ( not ( = ?auto_78223 ?auto_78229 ) ) ( not ( = ?auto_78224 ?auto_78228 ) ) ( not ( = ?auto_78224 ?auto_78229 ) ) ( ON ?auto_78223 ?auto_78227 ) ( not ( = ?auto_78223 ?auto_78227 ) ) ( not ( = ?auto_78224 ?auto_78227 ) ) ( not ( = ?auto_78225 ?auto_78227 ) ) ( not ( = ?auto_78226 ?auto_78227 ) ) ( not ( = ?auto_78230 ?auto_78227 ) ) ( not ( = ?auto_78228 ?auto_78227 ) ) ( not ( = ?auto_78229 ?auto_78227 ) ) ( ON ?auto_78224 ?auto_78223 ) ( ON-TABLE ?auto_78227 ) ( ON ?auto_78225 ?auto_78224 ) ( ON ?auto_78226 ?auto_78225 ) ( ON ?auto_78230 ?auto_78226 ) ( ON ?auto_78229 ?auto_78230 ) ( ON ?auto_78228 ?auto_78229 ) ( CLEAR ?auto_78228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78227 ?auto_78223 ?auto_78224 ?auto_78225 ?auto_78226 ?auto_78230 ?auto_78229 )
      ( MAKE-4PILE ?auto_78223 ?auto_78224 ?auto_78225 ?auto_78226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78246 - BLOCK
      ?auto_78247 - BLOCK
    )
    :vars
    (
      ?auto_78249 - BLOCK
      ?auto_78250 - BLOCK
      ?auto_78248 - BLOCK
      ?auto_78251 - BLOCK
      ?auto_78252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78249 ?auto_78247 ) ( ON-TABLE ?auto_78246 ) ( ON ?auto_78247 ?auto_78246 ) ( not ( = ?auto_78246 ?auto_78247 ) ) ( not ( = ?auto_78246 ?auto_78249 ) ) ( not ( = ?auto_78247 ?auto_78249 ) ) ( not ( = ?auto_78246 ?auto_78250 ) ) ( not ( = ?auto_78246 ?auto_78248 ) ) ( not ( = ?auto_78247 ?auto_78250 ) ) ( not ( = ?auto_78247 ?auto_78248 ) ) ( not ( = ?auto_78249 ?auto_78250 ) ) ( not ( = ?auto_78249 ?auto_78248 ) ) ( not ( = ?auto_78250 ?auto_78248 ) ) ( ON ?auto_78250 ?auto_78249 ) ( CLEAR ?auto_78250 ) ( HOLDING ?auto_78248 ) ( CLEAR ?auto_78251 ) ( ON-TABLE ?auto_78252 ) ( ON ?auto_78251 ?auto_78252 ) ( not ( = ?auto_78252 ?auto_78251 ) ) ( not ( = ?auto_78252 ?auto_78248 ) ) ( not ( = ?auto_78251 ?auto_78248 ) ) ( not ( = ?auto_78246 ?auto_78251 ) ) ( not ( = ?auto_78246 ?auto_78252 ) ) ( not ( = ?auto_78247 ?auto_78251 ) ) ( not ( = ?auto_78247 ?auto_78252 ) ) ( not ( = ?auto_78249 ?auto_78251 ) ) ( not ( = ?auto_78249 ?auto_78252 ) ) ( not ( = ?auto_78250 ?auto_78251 ) ) ( not ( = ?auto_78250 ?auto_78252 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78252 ?auto_78251 ?auto_78248 )
      ( MAKE-2PILE ?auto_78246 ?auto_78247 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78253 - BLOCK
      ?auto_78254 - BLOCK
    )
    :vars
    (
      ?auto_78258 - BLOCK
      ?auto_78255 - BLOCK
      ?auto_78257 - BLOCK
      ?auto_78256 - BLOCK
      ?auto_78259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78258 ?auto_78254 ) ( ON-TABLE ?auto_78253 ) ( ON ?auto_78254 ?auto_78253 ) ( not ( = ?auto_78253 ?auto_78254 ) ) ( not ( = ?auto_78253 ?auto_78258 ) ) ( not ( = ?auto_78254 ?auto_78258 ) ) ( not ( = ?auto_78253 ?auto_78255 ) ) ( not ( = ?auto_78253 ?auto_78257 ) ) ( not ( = ?auto_78254 ?auto_78255 ) ) ( not ( = ?auto_78254 ?auto_78257 ) ) ( not ( = ?auto_78258 ?auto_78255 ) ) ( not ( = ?auto_78258 ?auto_78257 ) ) ( not ( = ?auto_78255 ?auto_78257 ) ) ( ON ?auto_78255 ?auto_78258 ) ( CLEAR ?auto_78256 ) ( ON-TABLE ?auto_78259 ) ( ON ?auto_78256 ?auto_78259 ) ( not ( = ?auto_78259 ?auto_78256 ) ) ( not ( = ?auto_78259 ?auto_78257 ) ) ( not ( = ?auto_78256 ?auto_78257 ) ) ( not ( = ?auto_78253 ?auto_78256 ) ) ( not ( = ?auto_78253 ?auto_78259 ) ) ( not ( = ?auto_78254 ?auto_78256 ) ) ( not ( = ?auto_78254 ?auto_78259 ) ) ( not ( = ?auto_78258 ?auto_78256 ) ) ( not ( = ?auto_78258 ?auto_78259 ) ) ( not ( = ?auto_78255 ?auto_78256 ) ) ( not ( = ?auto_78255 ?auto_78259 ) ) ( ON ?auto_78257 ?auto_78255 ) ( CLEAR ?auto_78257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78253 ?auto_78254 ?auto_78258 ?auto_78255 )
      ( MAKE-2PILE ?auto_78253 ?auto_78254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78260 - BLOCK
      ?auto_78261 - BLOCK
    )
    :vars
    (
      ?auto_78266 - BLOCK
      ?auto_78263 - BLOCK
      ?auto_78265 - BLOCK
      ?auto_78262 - BLOCK
      ?auto_78264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78266 ?auto_78261 ) ( ON-TABLE ?auto_78260 ) ( ON ?auto_78261 ?auto_78260 ) ( not ( = ?auto_78260 ?auto_78261 ) ) ( not ( = ?auto_78260 ?auto_78266 ) ) ( not ( = ?auto_78261 ?auto_78266 ) ) ( not ( = ?auto_78260 ?auto_78263 ) ) ( not ( = ?auto_78260 ?auto_78265 ) ) ( not ( = ?auto_78261 ?auto_78263 ) ) ( not ( = ?auto_78261 ?auto_78265 ) ) ( not ( = ?auto_78266 ?auto_78263 ) ) ( not ( = ?auto_78266 ?auto_78265 ) ) ( not ( = ?auto_78263 ?auto_78265 ) ) ( ON ?auto_78263 ?auto_78266 ) ( ON-TABLE ?auto_78262 ) ( not ( = ?auto_78262 ?auto_78264 ) ) ( not ( = ?auto_78262 ?auto_78265 ) ) ( not ( = ?auto_78264 ?auto_78265 ) ) ( not ( = ?auto_78260 ?auto_78264 ) ) ( not ( = ?auto_78260 ?auto_78262 ) ) ( not ( = ?auto_78261 ?auto_78264 ) ) ( not ( = ?auto_78261 ?auto_78262 ) ) ( not ( = ?auto_78266 ?auto_78264 ) ) ( not ( = ?auto_78266 ?auto_78262 ) ) ( not ( = ?auto_78263 ?auto_78264 ) ) ( not ( = ?auto_78263 ?auto_78262 ) ) ( ON ?auto_78265 ?auto_78263 ) ( CLEAR ?auto_78265 ) ( HOLDING ?auto_78264 ) ( CLEAR ?auto_78262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78262 ?auto_78264 )
      ( MAKE-2PILE ?auto_78260 ?auto_78261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78267 - BLOCK
      ?auto_78268 - BLOCK
    )
    :vars
    (
      ?auto_78272 - BLOCK
      ?auto_78269 - BLOCK
      ?auto_78273 - BLOCK
      ?auto_78271 - BLOCK
      ?auto_78270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78272 ?auto_78268 ) ( ON-TABLE ?auto_78267 ) ( ON ?auto_78268 ?auto_78267 ) ( not ( = ?auto_78267 ?auto_78268 ) ) ( not ( = ?auto_78267 ?auto_78272 ) ) ( not ( = ?auto_78268 ?auto_78272 ) ) ( not ( = ?auto_78267 ?auto_78269 ) ) ( not ( = ?auto_78267 ?auto_78273 ) ) ( not ( = ?auto_78268 ?auto_78269 ) ) ( not ( = ?auto_78268 ?auto_78273 ) ) ( not ( = ?auto_78272 ?auto_78269 ) ) ( not ( = ?auto_78272 ?auto_78273 ) ) ( not ( = ?auto_78269 ?auto_78273 ) ) ( ON ?auto_78269 ?auto_78272 ) ( ON-TABLE ?auto_78271 ) ( not ( = ?auto_78271 ?auto_78270 ) ) ( not ( = ?auto_78271 ?auto_78273 ) ) ( not ( = ?auto_78270 ?auto_78273 ) ) ( not ( = ?auto_78267 ?auto_78270 ) ) ( not ( = ?auto_78267 ?auto_78271 ) ) ( not ( = ?auto_78268 ?auto_78270 ) ) ( not ( = ?auto_78268 ?auto_78271 ) ) ( not ( = ?auto_78272 ?auto_78270 ) ) ( not ( = ?auto_78272 ?auto_78271 ) ) ( not ( = ?auto_78269 ?auto_78270 ) ) ( not ( = ?auto_78269 ?auto_78271 ) ) ( ON ?auto_78273 ?auto_78269 ) ( CLEAR ?auto_78271 ) ( ON ?auto_78270 ?auto_78273 ) ( CLEAR ?auto_78270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78267 ?auto_78268 ?auto_78272 ?auto_78269 ?auto_78273 )
      ( MAKE-2PILE ?auto_78267 ?auto_78268 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78274 - BLOCK
      ?auto_78275 - BLOCK
    )
    :vars
    (
      ?auto_78277 - BLOCK
      ?auto_78279 - BLOCK
      ?auto_78280 - BLOCK
      ?auto_78278 - BLOCK
      ?auto_78276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78277 ?auto_78275 ) ( ON-TABLE ?auto_78274 ) ( ON ?auto_78275 ?auto_78274 ) ( not ( = ?auto_78274 ?auto_78275 ) ) ( not ( = ?auto_78274 ?auto_78277 ) ) ( not ( = ?auto_78275 ?auto_78277 ) ) ( not ( = ?auto_78274 ?auto_78279 ) ) ( not ( = ?auto_78274 ?auto_78280 ) ) ( not ( = ?auto_78275 ?auto_78279 ) ) ( not ( = ?auto_78275 ?auto_78280 ) ) ( not ( = ?auto_78277 ?auto_78279 ) ) ( not ( = ?auto_78277 ?auto_78280 ) ) ( not ( = ?auto_78279 ?auto_78280 ) ) ( ON ?auto_78279 ?auto_78277 ) ( not ( = ?auto_78278 ?auto_78276 ) ) ( not ( = ?auto_78278 ?auto_78280 ) ) ( not ( = ?auto_78276 ?auto_78280 ) ) ( not ( = ?auto_78274 ?auto_78276 ) ) ( not ( = ?auto_78274 ?auto_78278 ) ) ( not ( = ?auto_78275 ?auto_78276 ) ) ( not ( = ?auto_78275 ?auto_78278 ) ) ( not ( = ?auto_78277 ?auto_78276 ) ) ( not ( = ?auto_78277 ?auto_78278 ) ) ( not ( = ?auto_78279 ?auto_78276 ) ) ( not ( = ?auto_78279 ?auto_78278 ) ) ( ON ?auto_78280 ?auto_78279 ) ( ON ?auto_78276 ?auto_78280 ) ( CLEAR ?auto_78276 ) ( HOLDING ?auto_78278 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78278 )
      ( MAKE-2PILE ?auto_78274 ?auto_78275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78290 - BLOCK
      ?auto_78291 - BLOCK
    )
    :vars
    (
      ?auto_78292 - BLOCK
      ?auto_78294 - BLOCK
      ?auto_78295 - BLOCK
      ?auto_78293 - BLOCK
      ?auto_78296 - BLOCK
      ?auto_78297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78292 ?auto_78291 ) ( ON-TABLE ?auto_78290 ) ( ON ?auto_78291 ?auto_78290 ) ( not ( = ?auto_78290 ?auto_78291 ) ) ( not ( = ?auto_78290 ?auto_78292 ) ) ( not ( = ?auto_78291 ?auto_78292 ) ) ( not ( = ?auto_78290 ?auto_78294 ) ) ( not ( = ?auto_78290 ?auto_78295 ) ) ( not ( = ?auto_78291 ?auto_78294 ) ) ( not ( = ?auto_78291 ?auto_78295 ) ) ( not ( = ?auto_78292 ?auto_78294 ) ) ( not ( = ?auto_78292 ?auto_78295 ) ) ( not ( = ?auto_78294 ?auto_78295 ) ) ( ON ?auto_78294 ?auto_78292 ) ( not ( = ?auto_78293 ?auto_78296 ) ) ( not ( = ?auto_78293 ?auto_78295 ) ) ( not ( = ?auto_78296 ?auto_78295 ) ) ( not ( = ?auto_78290 ?auto_78296 ) ) ( not ( = ?auto_78290 ?auto_78293 ) ) ( not ( = ?auto_78291 ?auto_78296 ) ) ( not ( = ?auto_78291 ?auto_78293 ) ) ( not ( = ?auto_78292 ?auto_78296 ) ) ( not ( = ?auto_78292 ?auto_78293 ) ) ( not ( = ?auto_78294 ?auto_78296 ) ) ( not ( = ?auto_78294 ?auto_78293 ) ) ( ON ?auto_78295 ?auto_78294 ) ( ON ?auto_78296 ?auto_78295 ) ( CLEAR ?auto_78296 ) ( ON ?auto_78293 ?auto_78297 ) ( CLEAR ?auto_78293 ) ( HAND-EMPTY ) ( not ( = ?auto_78290 ?auto_78297 ) ) ( not ( = ?auto_78291 ?auto_78297 ) ) ( not ( = ?auto_78292 ?auto_78297 ) ) ( not ( = ?auto_78294 ?auto_78297 ) ) ( not ( = ?auto_78295 ?auto_78297 ) ) ( not ( = ?auto_78293 ?auto_78297 ) ) ( not ( = ?auto_78296 ?auto_78297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78293 ?auto_78297 )
      ( MAKE-2PILE ?auto_78290 ?auto_78291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78298 - BLOCK
      ?auto_78299 - BLOCK
    )
    :vars
    (
      ?auto_78303 - BLOCK
      ?auto_78305 - BLOCK
      ?auto_78301 - BLOCK
      ?auto_78302 - BLOCK
      ?auto_78300 - BLOCK
      ?auto_78304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78303 ?auto_78299 ) ( ON-TABLE ?auto_78298 ) ( ON ?auto_78299 ?auto_78298 ) ( not ( = ?auto_78298 ?auto_78299 ) ) ( not ( = ?auto_78298 ?auto_78303 ) ) ( not ( = ?auto_78299 ?auto_78303 ) ) ( not ( = ?auto_78298 ?auto_78305 ) ) ( not ( = ?auto_78298 ?auto_78301 ) ) ( not ( = ?auto_78299 ?auto_78305 ) ) ( not ( = ?auto_78299 ?auto_78301 ) ) ( not ( = ?auto_78303 ?auto_78305 ) ) ( not ( = ?auto_78303 ?auto_78301 ) ) ( not ( = ?auto_78305 ?auto_78301 ) ) ( ON ?auto_78305 ?auto_78303 ) ( not ( = ?auto_78302 ?auto_78300 ) ) ( not ( = ?auto_78302 ?auto_78301 ) ) ( not ( = ?auto_78300 ?auto_78301 ) ) ( not ( = ?auto_78298 ?auto_78300 ) ) ( not ( = ?auto_78298 ?auto_78302 ) ) ( not ( = ?auto_78299 ?auto_78300 ) ) ( not ( = ?auto_78299 ?auto_78302 ) ) ( not ( = ?auto_78303 ?auto_78300 ) ) ( not ( = ?auto_78303 ?auto_78302 ) ) ( not ( = ?auto_78305 ?auto_78300 ) ) ( not ( = ?auto_78305 ?auto_78302 ) ) ( ON ?auto_78301 ?auto_78305 ) ( ON ?auto_78302 ?auto_78304 ) ( CLEAR ?auto_78302 ) ( not ( = ?auto_78298 ?auto_78304 ) ) ( not ( = ?auto_78299 ?auto_78304 ) ) ( not ( = ?auto_78303 ?auto_78304 ) ) ( not ( = ?auto_78305 ?auto_78304 ) ) ( not ( = ?auto_78301 ?auto_78304 ) ) ( not ( = ?auto_78302 ?auto_78304 ) ) ( not ( = ?auto_78300 ?auto_78304 ) ) ( HOLDING ?auto_78300 ) ( CLEAR ?auto_78301 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78298 ?auto_78299 ?auto_78303 ?auto_78305 ?auto_78301 ?auto_78300 )
      ( MAKE-2PILE ?auto_78298 ?auto_78299 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78306 - BLOCK
      ?auto_78307 - BLOCK
    )
    :vars
    (
      ?auto_78313 - BLOCK
      ?auto_78312 - BLOCK
      ?auto_78310 - BLOCK
      ?auto_78308 - BLOCK
      ?auto_78311 - BLOCK
      ?auto_78309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78313 ?auto_78307 ) ( ON-TABLE ?auto_78306 ) ( ON ?auto_78307 ?auto_78306 ) ( not ( = ?auto_78306 ?auto_78307 ) ) ( not ( = ?auto_78306 ?auto_78313 ) ) ( not ( = ?auto_78307 ?auto_78313 ) ) ( not ( = ?auto_78306 ?auto_78312 ) ) ( not ( = ?auto_78306 ?auto_78310 ) ) ( not ( = ?auto_78307 ?auto_78312 ) ) ( not ( = ?auto_78307 ?auto_78310 ) ) ( not ( = ?auto_78313 ?auto_78312 ) ) ( not ( = ?auto_78313 ?auto_78310 ) ) ( not ( = ?auto_78312 ?auto_78310 ) ) ( ON ?auto_78312 ?auto_78313 ) ( not ( = ?auto_78308 ?auto_78311 ) ) ( not ( = ?auto_78308 ?auto_78310 ) ) ( not ( = ?auto_78311 ?auto_78310 ) ) ( not ( = ?auto_78306 ?auto_78311 ) ) ( not ( = ?auto_78306 ?auto_78308 ) ) ( not ( = ?auto_78307 ?auto_78311 ) ) ( not ( = ?auto_78307 ?auto_78308 ) ) ( not ( = ?auto_78313 ?auto_78311 ) ) ( not ( = ?auto_78313 ?auto_78308 ) ) ( not ( = ?auto_78312 ?auto_78311 ) ) ( not ( = ?auto_78312 ?auto_78308 ) ) ( ON ?auto_78310 ?auto_78312 ) ( ON ?auto_78308 ?auto_78309 ) ( not ( = ?auto_78306 ?auto_78309 ) ) ( not ( = ?auto_78307 ?auto_78309 ) ) ( not ( = ?auto_78313 ?auto_78309 ) ) ( not ( = ?auto_78312 ?auto_78309 ) ) ( not ( = ?auto_78310 ?auto_78309 ) ) ( not ( = ?auto_78308 ?auto_78309 ) ) ( not ( = ?auto_78311 ?auto_78309 ) ) ( CLEAR ?auto_78310 ) ( ON ?auto_78311 ?auto_78308 ) ( CLEAR ?auto_78311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78309 ?auto_78308 )
      ( MAKE-2PILE ?auto_78306 ?auto_78307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78314 - BLOCK
      ?auto_78315 - BLOCK
    )
    :vars
    (
      ?auto_78321 - BLOCK
      ?auto_78317 - BLOCK
      ?auto_78320 - BLOCK
      ?auto_78318 - BLOCK
      ?auto_78316 - BLOCK
      ?auto_78319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78321 ?auto_78315 ) ( ON-TABLE ?auto_78314 ) ( ON ?auto_78315 ?auto_78314 ) ( not ( = ?auto_78314 ?auto_78315 ) ) ( not ( = ?auto_78314 ?auto_78321 ) ) ( not ( = ?auto_78315 ?auto_78321 ) ) ( not ( = ?auto_78314 ?auto_78317 ) ) ( not ( = ?auto_78314 ?auto_78320 ) ) ( not ( = ?auto_78315 ?auto_78317 ) ) ( not ( = ?auto_78315 ?auto_78320 ) ) ( not ( = ?auto_78321 ?auto_78317 ) ) ( not ( = ?auto_78321 ?auto_78320 ) ) ( not ( = ?auto_78317 ?auto_78320 ) ) ( ON ?auto_78317 ?auto_78321 ) ( not ( = ?auto_78318 ?auto_78316 ) ) ( not ( = ?auto_78318 ?auto_78320 ) ) ( not ( = ?auto_78316 ?auto_78320 ) ) ( not ( = ?auto_78314 ?auto_78316 ) ) ( not ( = ?auto_78314 ?auto_78318 ) ) ( not ( = ?auto_78315 ?auto_78316 ) ) ( not ( = ?auto_78315 ?auto_78318 ) ) ( not ( = ?auto_78321 ?auto_78316 ) ) ( not ( = ?auto_78321 ?auto_78318 ) ) ( not ( = ?auto_78317 ?auto_78316 ) ) ( not ( = ?auto_78317 ?auto_78318 ) ) ( ON ?auto_78318 ?auto_78319 ) ( not ( = ?auto_78314 ?auto_78319 ) ) ( not ( = ?auto_78315 ?auto_78319 ) ) ( not ( = ?auto_78321 ?auto_78319 ) ) ( not ( = ?auto_78317 ?auto_78319 ) ) ( not ( = ?auto_78320 ?auto_78319 ) ) ( not ( = ?auto_78318 ?auto_78319 ) ) ( not ( = ?auto_78316 ?auto_78319 ) ) ( ON ?auto_78316 ?auto_78318 ) ( CLEAR ?auto_78316 ) ( ON-TABLE ?auto_78319 ) ( HOLDING ?auto_78320 ) ( CLEAR ?auto_78317 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78314 ?auto_78315 ?auto_78321 ?auto_78317 ?auto_78320 )
      ( MAKE-2PILE ?auto_78314 ?auto_78315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78365 - BLOCK
      ?auto_78366 - BLOCK
      ?auto_78367 - BLOCK
      ?auto_78368 - BLOCK
      ?auto_78369 - BLOCK
    )
    :vars
    (
      ?auto_78370 - BLOCK
      ?auto_78371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78365 ) ( ON ?auto_78366 ?auto_78365 ) ( ON ?auto_78367 ?auto_78366 ) ( not ( = ?auto_78365 ?auto_78366 ) ) ( not ( = ?auto_78365 ?auto_78367 ) ) ( not ( = ?auto_78365 ?auto_78368 ) ) ( not ( = ?auto_78365 ?auto_78369 ) ) ( not ( = ?auto_78366 ?auto_78367 ) ) ( not ( = ?auto_78366 ?auto_78368 ) ) ( not ( = ?auto_78366 ?auto_78369 ) ) ( not ( = ?auto_78367 ?auto_78368 ) ) ( not ( = ?auto_78367 ?auto_78369 ) ) ( not ( = ?auto_78368 ?auto_78369 ) ) ( ON ?auto_78369 ?auto_78370 ) ( not ( = ?auto_78365 ?auto_78370 ) ) ( not ( = ?auto_78366 ?auto_78370 ) ) ( not ( = ?auto_78367 ?auto_78370 ) ) ( not ( = ?auto_78368 ?auto_78370 ) ) ( not ( = ?auto_78369 ?auto_78370 ) ) ( CLEAR ?auto_78367 ) ( ON ?auto_78368 ?auto_78369 ) ( CLEAR ?auto_78368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78371 ) ( ON ?auto_78370 ?auto_78371 ) ( not ( = ?auto_78371 ?auto_78370 ) ) ( not ( = ?auto_78371 ?auto_78369 ) ) ( not ( = ?auto_78371 ?auto_78368 ) ) ( not ( = ?auto_78365 ?auto_78371 ) ) ( not ( = ?auto_78366 ?auto_78371 ) ) ( not ( = ?auto_78367 ?auto_78371 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78371 ?auto_78370 ?auto_78369 )
      ( MAKE-5PILE ?auto_78365 ?auto_78366 ?auto_78367 ?auto_78368 ?auto_78369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78372 - BLOCK
      ?auto_78373 - BLOCK
      ?auto_78374 - BLOCK
      ?auto_78375 - BLOCK
      ?auto_78376 - BLOCK
    )
    :vars
    (
      ?auto_78378 - BLOCK
      ?auto_78377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78372 ) ( ON ?auto_78373 ?auto_78372 ) ( not ( = ?auto_78372 ?auto_78373 ) ) ( not ( = ?auto_78372 ?auto_78374 ) ) ( not ( = ?auto_78372 ?auto_78375 ) ) ( not ( = ?auto_78372 ?auto_78376 ) ) ( not ( = ?auto_78373 ?auto_78374 ) ) ( not ( = ?auto_78373 ?auto_78375 ) ) ( not ( = ?auto_78373 ?auto_78376 ) ) ( not ( = ?auto_78374 ?auto_78375 ) ) ( not ( = ?auto_78374 ?auto_78376 ) ) ( not ( = ?auto_78375 ?auto_78376 ) ) ( ON ?auto_78376 ?auto_78378 ) ( not ( = ?auto_78372 ?auto_78378 ) ) ( not ( = ?auto_78373 ?auto_78378 ) ) ( not ( = ?auto_78374 ?auto_78378 ) ) ( not ( = ?auto_78375 ?auto_78378 ) ) ( not ( = ?auto_78376 ?auto_78378 ) ) ( ON ?auto_78375 ?auto_78376 ) ( CLEAR ?auto_78375 ) ( ON-TABLE ?auto_78377 ) ( ON ?auto_78378 ?auto_78377 ) ( not ( = ?auto_78377 ?auto_78378 ) ) ( not ( = ?auto_78377 ?auto_78376 ) ) ( not ( = ?auto_78377 ?auto_78375 ) ) ( not ( = ?auto_78372 ?auto_78377 ) ) ( not ( = ?auto_78373 ?auto_78377 ) ) ( not ( = ?auto_78374 ?auto_78377 ) ) ( HOLDING ?auto_78374 ) ( CLEAR ?auto_78373 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78372 ?auto_78373 ?auto_78374 )
      ( MAKE-5PILE ?auto_78372 ?auto_78373 ?auto_78374 ?auto_78375 ?auto_78376 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78379 - BLOCK
      ?auto_78380 - BLOCK
      ?auto_78381 - BLOCK
      ?auto_78382 - BLOCK
      ?auto_78383 - BLOCK
    )
    :vars
    (
      ?auto_78384 - BLOCK
      ?auto_78385 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78379 ) ( ON ?auto_78380 ?auto_78379 ) ( not ( = ?auto_78379 ?auto_78380 ) ) ( not ( = ?auto_78379 ?auto_78381 ) ) ( not ( = ?auto_78379 ?auto_78382 ) ) ( not ( = ?auto_78379 ?auto_78383 ) ) ( not ( = ?auto_78380 ?auto_78381 ) ) ( not ( = ?auto_78380 ?auto_78382 ) ) ( not ( = ?auto_78380 ?auto_78383 ) ) ( not ( = ?auto_78381 ?auto_78382 ) ) ( not ( = ?auto_78381 ?auto_78383 ) ) ( not ( = ?auto_78382 ?auto_78383 ) ) ( ON ?auto_78383 ?auto_78384 ) ( not ( = ?auto_78379 ?auto_78384 ) ) ( not ( = ?auto_78380 ?auto_78384 ) ) ( not ( = ?auto_78381 ?auto_78384 ) ) ( not ( = ?auto_78382 ?auto_78384 ) ) ( not ( = ?auto_78383 ?auto_78384 ) ) ( ON ?auto_78382 ?auto_78383 ) ( ON-TABLE ?auto_78385 ) ( ON ?auto_78384 ?auto_78385 ) ( not ( = ?auto_78385 ?auto_78384 ) ) ( not ( = ?auto_78385 ?auto_78383 ) ) ( not ( = ?auto_78385 ?auto_78382 ) ) ( not ( = ?auto_78379 ?auto_78385 ) ) ( not ( = ?auto_78380 ?auto_78385 ) ) ( not ( = ?auto_78381 ?auto_78385 ) ) ( CLEAR ?auto_78380 ) ( ON ?auto_78381 ?auto_78382 ) ( CLEAR ?auto_78381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78385 ?auto_78384 ?auto_78383 ?auto_78382 )
      ( MAKE-5PILE ?auto_78379 ?auto_78380 ?auto_78381 ?auto_78382 ?auto_78383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78386 - BLOCK
      ?auto_78387 - BLOCK
      ?auto_78388 - BLOCK
      ?auto_78389 - BLOCK
      ?auto_78390 - BLOCK
    )
    :vars
    (
      ?auto_78391 - BLOCK
      ?auto_78392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78386 ) ( not ( = ?auto_78386 ?auto_78387 ) ) ( not ( = ?auto_78386 ?auto_78388 ) ) ( not ( = ?auto_78386 ?auto_78389 ) ) ( not ( = ?auto_78386 ?auto_78390 ) ) ( not ( = ?auto_78387 ?auto_78388 ) ) ( not ( = ?auto_78387 ?auto_78389 ) ) ( not ( = ?auto_78387 ?auto_78390 ) ) ( not ( = ?auto_78388 ?auto_78389 ) ) ( not ( = ?auto_78388 ?auto_78390 ) ) ( not ( = ?auto_78389 ?auto_78390 ) ) ( ON ?auto_78390 ?auto_78391 ) ( not ( = ?auto_78386 ?auto_78391 ) ) ( not ( = ?auto_78387 ?auto_78391 ) ) ( not ( = ?auto_78388 ?auto_78391 ) ) ( not ( = ?auto_78389 ?auto_78391 ) ) ( not ( = ?auto_78390 ?auto_78391 ) ) ( ON ?auto_78389 ?auto_78390 ) ( ON-TABLE ?auto_78392 ) ( ON ?auto_78391 ?auto_78392 ) ( not ( = ?auto_78392 ?auto_78391 ) ) ( not ( = ?auto_78392 ?auto_78390 ) ) ( not ( = ?auto_78392 ?auto_78389 ) ) ( not ( = ?auto_78386 ?auto_78392 ) ) ( not ( = ?auto_78387 ?auto_78392 ) ) ( not ( = ?auto_78388 ?auto_78392 ) ) ( ON ?auto_78388 ?auto_78389 ) ( CLEAR ?auto_78388 ) ( HOLDING ?auto_78387 ) ( CLEAR ?auto_78386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78386 ?auto_78387 )
      ( MAKE-5PILE ?auto_78386 ?auto_78387 ?auto_78388 ?auto_78389 ?auto_78390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78393 - BLOCK
      ?auto_78394 - BLOCK
      ?auto_78395 - BLOCK
      ?auto_78396 - BLOCK
      ?auto_78397 - BLOCK
    )
    :vars
    (
      ?auto_78399 - BLOCK
      ?auto_78398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78393 ) ( not ( = ?auto_78393 ?auto_78394 ) ) ( not ( = ?auto_78393 ?auto_78395 ) ) ( not ( = ?auto_78393 ?auto_78396 ) ) ( not ( = ?auto_78393 ?auto_78397 ) ) ( not ( = ?auto_78394 ?auto_78395 ) ) ( not ( = ?auto_78394 ?auto_78396 ) ) ( not ( = ?auto_78394 ?auto_78397 ) ) ( not ( = ?auto_78395 ?auto_78396 ) ) ( not ( = ?auto_78395 ?auto_78397 ) ) ( not ( = ?auto_78396 ?auto_78397 ) ) ( ON ?auto_78397 ?auto_78399 ) ( not ( = ?auto_78393 ?auto_78399 ) ) ( not ( = ?auto_78394 ?auto_78399 ) ) ( not ( = ?auto_78395 ?auto_78399 ) ) ( not ( = ?auto_78396 ?auto_78399 ) ) ( not ( = ?auto_78397 ?auto_78399 ) ) ( ON ?auto_78396 ?auto_78397 ) ( ON-TABLE ?auto_78398 ) ( ON ?auto_78399 ?auto_78398 ) ( not ( = ?auto_78398 ?auto_78399 ) ) ( not ( = ?auto_78398 ?auto_78397 ) ) ( not ( = ?auto_78398 ?auto_78396 ) ) ( not ( = ?auto_78393 ?auto_78398 ) ) ( not ( = ?auto_78394 ?auto_78398 ) ) ( not ( = ?auto_78395 ?auto_78398 ) ) ( ON ?auto_78395 ?auto_78396 ) ( CLEAR ?auto_78393 ) ( ON ?auto_78394 ?auto_78395 ) ( CLEAR ?auto_78394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78398 ?auto_78399 ?auto_78397 ?auto_78396 ?auto_78395 )
      ( MAKE-5PILE ?auto_78393 ?auto_78394 ?auto_78395 ?auto_78396 ?auto_78397 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78400 - BLOCK
      ?auto_78401 - BLOCK
      ?auto_78402 - BLOCK
      ?auto_78403 - BLOCK
      ?auto_78404 - BLOCK
    )
    :vars
    (
      ?auto_78405 - BLOCK
      ?auto_78406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78400 ?auto_78401 ) ) ( not ( = ?auto_78400 ?auto_78402 ) ) ( not ( = ?auto_78400 ?auto_78403 ) ) ( not ( = ?auto_78400 ?auto_78404 ) ) ( not ( = ?auto_78401 ?auto_78402 ) ) ( not ( = ?auto_78401 ?auto_78403 ) ) ( not ( = ?auto_78401 ?auto_78404 ) ) ( not ( = ?auto_78402 ?auto_78403 ) ) ( not ( = ?auto_78402 ?auto_78404 ) ) ( not ( = ?auto_78403 ?auto_78404 ) ) ( ON ?auto_78404 ?auto_78405 ) ( not ( = ?auto_78400 ?auto_78405 ) ) ( not ( = ?auto_78401 ?auto_78405 ) ) ( not ( = ?auto_78402 ?auto_78405 ) ) ( not ( = ?auto_78403 ?auto_78405 ) ) ( not ( = ?auto_78404 ?auto_78405 ) ) ( ON ?auto_78403 ?auto_78404 ) ( ON-TABLE ?auto_78406 ) ( ON ?auto_78405 ?auto_78406 ) ( not ( = ?auto_78406 ?auto_78405 ) ) ( not ( = ?auto_78406 ?auto_78404 ) ) ( not ( = ?auto_78406 ?auto_78403 ) ) ( not ( = ?auto_78400 ?auto_78406 ) ) ( not ( = ?auto_78401 ?auto_78406 ) ) ( not ( = ?auto_78402 ?auto_78406 ) ) ( ON ?auto_78402 ?auto_78403 ) ( ON ?auto_78401 ?auto_78402 ) ( CLEAR ?auto_78401 ) ( HOLDING ?auto_78400 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78400 )
      ( MAKE-5PILE ?auto_78400 ?auto_78401 ?auto_78402 ?auto_78403 ?auto_78404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78407 - BLOCK
      ?auto_78408 - BLOCK
      ?auto_78409 - BLOCK
      ?auto_78410 - BLOCK
      ?auto_78411 - BLOCK
    )
    :vars
    (
      ?auto_78413 - BLOCK
      ?auto_78412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78407 ?auto_78408 ) ) ( not ( = ?auto_78407 ?auto_78409 ) ) ( not ( = ?auto_78407 ?auto_78410 ) ) ( not ( = ?auto_78407 ?auto_78411 ) ) ( not ( = ?auto_78408 ?auto_78409 ) ) ( not ( = ?auto_78408 ?auto_78410 ) ) ( not ( = ?auto_78408 ?auto_78411 ) ) ( not ( = ?auto_78409 ?auto_78410 ) ) ( not ( = ?auto_78409 ?auto_78411 ) ) ( not ( = ?auto_78410 ?auto_78411 ) ) ( ON ?auto_78411 ?auto_78413 ) ( not ( = ?auto_78407 ?auto_78413 ) ) ( not ( = ?auto_78408 ?auto_78413 ) ) ( not ( = ?auto_78409 ?auto_78413 ) ) ( not ( = ?auto_78410 ?auto_78413 ) ) ( not ( = ?auto_78411 ?auto_78413 ) ) ( ON ?auto_78410 ?auto_78411 ) ( ON-TABLE ?auto_78412 ) ( ON ?auto_78413 ?auto_78412 ) ( not ( = ?auto_78412 ?auto_78413 ) ) ( not ( = ?auto_78412 ?auto_78411 ) ) ( not ( = ?auto_78412 ?auto_78410 ) ) ( not ( = ?auto_78407 ?auto_78412 ) ) ( not ( = ?auto_78408 ?auto_78412 ) ) ( not ( = ?auto_78409 ?auto_78412 ) ) ( ON ?auto_78409 ?auto_78410 ) ( ON ?auto_78408 ?auto_78409 ) ( ON ?auto_78407 ?auto_78408 ) ( CLEAR ?auto_78407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78412 ?auto_78413 ?auto_78411 ?auto_78410 ?auto_78409 ?auto_78408 )
      ( MAKE-5PILE ?auto_78407 ?auto_78408 ?auto_78409 ?auto_78410 ?auto_78411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78419 - BLOCK
      ?auto_78420 - BLOCK
      ?auto_78421 - BLOCK
      ?auto_78422 - BLOCK
      ?auto_78423 - BLOCK
    )
    :vars
    (
      ?auto_78425 - BLOCK
      ?auto_78424 - BLOCK
      ?auto_78426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78419 ?auto_78420 ) ) ( not ( = ?auto_78419 ?auto_78421 ) ) ( not ( = ?auto_78419 ?auto_78422 ) ) ( not ( = ?auto_78419 ?auto_78423 ) ) ( not ( = ?auto_78420 ?auto_78421 ) ) ( not ( = ?auto_78420 ?auto_78422 ) ) ( not ( = ?auto_78420 ?auto_78423 ) ) ( not ( = ?auto_78421 ?auto_78422 ) ) ( not ( = ?auto_78421 ?auto_78423 ) ) ( not ( = ?auto_78422 ?auto_78423 ) ) ( ON ?auto_78423 ?auto_78425 ) ( not ( = ?auto_78419 ?auto_78425 ) ) ( not ( = ?auto_78420 ?auto_78425 ) ) ( not ( = ?auto_78421 ?auto_78425 ) ) ( not ( = ?auto_78422 ?auto_78425 ) ) ( not ( = ?auto_78423 ?auto_78425 ) ) ( ON ?auto_78422 ?auto_78423 ) ( ON-TABLE ?auto_78424 ) ( ON ?auto_78425 ?auto_78424 ) ( not ( = ?auto_78424 ?auto_78425 ) ) ( not ( = ?auto_78424 ?auto_78423 ) ) ( not ( = ?auto_78424 ?auto_78422 ) ) ( not ( = ?auto_78419 ?auto_78424 ) ) ( not ( = ?auto_78420 ?auto_78424 ) ) ( not ( = ?auto_78421 ?auto_78424 ) ) ( ON ?auto_78421 ?auto_78422 ) ( ON ?auto_78420 ?auto_78421 ) ( CLEAR ?auto_78420 ) ( ON ?auto_78419 ?auto_78426 ) ( CLEAR ?auto_78419 ) ( HAND-EMPTY ) ( not ( = ?auto_78419 ?auto_78426 ) ) ( not ( = ?auto_78420 ?auto_78426 ) ) ( not ( = ?auto_78421 ?auto_78426 ) ) ( not ( = ?auto_78422 ?auto_78426 ) ) ( not ( = ?auto_78423 ?auto_78426 ) ) ( not ( = ?auto_78425 ?auto_78426 ) ) ( not ( = ?auto_78424 ?auto_78426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78419 ?auto_78426 )
      ( MAKE-5PILE ?auto_78419 ?auto_78420 ?auto_78421 ?auto_78422 ?auto_78423 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78427 - BLOCK
      ?auto_78428 - BLOCK
      ?auto_78429 - BLOCK
      ?auto_78430 - BLOCK
      ?auto_78431 - BLOCK
    )
    :vars
    (
      ?auto_78433 - BLOCK
      ?auto_78434 - BLOCK
      ?auto_78432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78427 ?auto_78428 ) ) ( not ( = ?auto_78427 ?auto_78429 ) ) ( not ( = ?auto_78427 ?auto_78430 ) ) ( not ( = ?auto_78427 ?auto_78431 ) ) ( not ( = ?auto_78428 ?auto_78429 ) ) ( not ( = ?auto_78428 ?auto_78430 ) ) ( not ( = ?auto_78428 ?auto_78431 ) ) ( not ( = ?auto_78429 ?auto_78430 ) ) ( not ( = ?auto_78429 ?auto_78431 ) ) ( not ( = ?auto_78430 ?auto_78431 ) ) ( ON ?auto_78431 ?auto_78433 ) ( not ( = ?auto_78427 ?auto_78433 ) ) ( not ( = ?auto_78428 ?auto_78433 ) ) ( not ( = ?auto_78429 ?auto_78433 ) ) ( not ( = ?auto_78430 ?auto_78433 ) ) ( not ( = ?auto_78431 ?auto_78433 ) ) ( ON ?auto_78430 ?auto_78431 ) ( ON-TABLE ?auto_78434 ) ( ON ?auto_78433 ?auto_78434 ) ( not ( = ?auto_78434 ?auto_78433 ) ) ( not ( = ?auto_78434 ?auto_78431 ) ) ( not ( = ?auto_78434 ?auto_78430 ) ) ( not ( = ?auto_78427 ?auto_78434 ) ) ( not ( = ?auto_78428 ?auto_78434 ) ) ( not ( = ?auto_78429 ?auto_78434 ) ) ( ON ?auto_78429 ?auto_78430 ) ( ON ?auto_78427 ?auto_78432 ) ( CLEAR ?auto_78427 ) ( not ( = ?auto_78427 ?auto_78432 ) ) ( not ( = ?auto_78428 ?auto_78432 ) ) ( not ( = ?auto_78429 ?auto_78432 ) ) ( not ( = ?auto_78430 ?auto_78432 ) ) ( not ( = ?auto_78431 ?auto_78432 ) ) ( not ( = ?auto_78433 ?auto_78432 ) ) ( not ( = ?auto_78434 ?auto_78432 ) ) ( HOLDING ?auto_78428 ) ( CLEAR ?auto_78429 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78434 ?auto_78433 ?auto_78431 ?auto_78430 ?auto_78429 ?auto_78428 )
      ( MAKE-5PILE ?auto_78427 ?auto_78428 ?auto_78429 ?auto_78430 ?auto_78431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78435 - BLOCK
      ?auto_78436 - BLOCK
      ?auto_78437 - BLOCK
      ?auto_78438 - BLOCK
      ?auto_78439 - BLOCK
    )
    :vars
    (
      ?auto_78440 - BLOCK
      ?auto_78442 - BLOCK
      ?auto_78441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78435 ?auto_78436 ) ) ( not ( = ?auto_78435 ?auto_78437 ) ) ( not ( = ?auto_78435 ?auto_78438 ) ) ( not ( = ?auto_78435 ?auto_78439 ) ) ( not ( = ?auto_78436 ?auto_78437 ) ) ( not ( = ?auto_78436 ?auto_78438 ) ) ( not ( = ?auto_78436 ?auto_78439 ) ) ( not ( = ?auto_78437 ?auto_78438 ) ) ( not ( = ?auto_78437 ?auto_78439 ) ) ( not ( = ?auto_78438 ?auto_78439 ) ) ( ON ?auto_78439 ?auto_78440 ) ( not ( = ?auto_78435 ?auto_78440 ) ) ( not ( = ?auto_78436 ?auto_78440 ) ) ( not ( = ?auto_78437 ?auto_78440 ) ) ( not ( = ?auto_78438 ?auto_78440 ) ) ( not ( = ?auto_78439 ?auto_78440 ) ) ( ON ?auto_78438 ?auto_78439 ) ( ON-TABLE ?auto_78442 ) ( ON ?auto_78440 ?auto_78442 ) ( not ( = ?auto_78442 ?auto_78440 ) ) ( not ( = ?auto_78442 ?auto_78439 ) ) ( not ( = ?auto_78442 ?auto_78438 ) ) ( not ( = ?auto_78435 ?auto_78442 ) ) ( not ( = ?auto_78436 ?auto_78442 ) ) ( not ( = ?auto_78437 ?auto_78442 ) ) ( ON ?auto_78437 ?auto_78438 ) ( ON ?auto_78435 ?auto_78441 ) ( not ( = ?auto_78435 ?auto_78441 ) ) ( not ( = ?auto_78436 ?auto_78441 ) ) ( not ( = ?auto_78437 ?auto_78441 ) ) ( not ( = ?auto_78438 ?auto_78441 ) ) ( not ( = ?auto_78439 ?auto_78441 ) ) ( not ( = ?auto_78440 ?auto_78441 ) ) ( not ( = ?auto_78442 ?auto_78441 ) ) ( CLEAR ?auto_78437 ) ( ON ?auto_78436 ?auto_78435 ) ( CLEAR ?auto_78436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78441 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78441 ?auto_78435 )
      ( MAKE-5PILE ?auto_78435 ?auto_78436 ?auto_78437 ?auto_78438 ?auto_78439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78443 - BLOCK
      ?auto_78444 - BLOCK
      ?auto_78445 - BLOCK
      ?auto_78446 - BLOCK
      ?auto_78447 - BLOCK
    )
    :vars
    (
      ?auto_78449 - BLOCK
      ?auto_78448 - BLOCK
      ?auto_78450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78443 ?auto_78444 ) ) ( not ( = ?auto_78443 ?auto_78445 ) ) ( not ( = ?auto_78443 ?auto_78446 ) ) ( not ( = ?auto_78443 ?auto_78447 ) ) ( not ( = ?auto_78444 ?auto_78445 ) ) ( not ( = ?auto_78444 ?auto_78446 ) ) ( not ( = ?auto_78444 ?auto_78447 ) ) ( not ( = ?auto_78445 ?auto_78446 ) ) ( not ( = ?auto_78445 ?auto_78447 ) ) ( not ( = ?auto_78446 ?auto_78447 ) ) ( ON ?auto_78447 ?auto_78449 ) ( not ( = ?auto_78443 ?auto_78449 ) ) ( not ( = ?auto_78444 ?auto_78449 ) ) ( not ( = ?auto_78445 ?auto_78449 ) ) ( not ( = ?auto_78446 ?auto_78449 ) ) ( not ( = ?auto_78447 ?auto_78449 ) ) ( ON ?auto_78446 ?auto_78447 ) ( ON-TABLE ?auto_78448 ) ( ON ?auto_78449 ?auto_78448 ) ( not ( = ?auto_78448 ?auto_78449 ) ) ( not ( = ?auto_78448 ?auto_78447 ) ) ( not ( = ?auto_78448 ?auto_78446 ) ) ( not ( = ?auto_78443 ?auto_78448 ) ) ( not ( = ?auto_78444 ?auto_78448 ) ) ( not ( = ?auto_78445 ?auto_78448 ) ) ( ON ?auto_78443 ?auto_78450 ) ( not ( = ?auto_78443 ?auto_78450 ) ) ( not ( = ?auto_78444 ?auto_78450 ) ) ( not ( = ?auto_78445 ?auto_78450 ) ) ( not ( = ?auto_78446 ?auto_78450 ) ) ( not ( = ?auto_78447 ?auto_78450 ) ) ( not ( = ?auto_78449 ?auto_78450 ) ) ( not ( = ?auto_78448 ?auto_78450 ) ) ( ON ?auto_78444 ?auto_78443 ) ( CLEAR ?auto_78444 ) ( ON-TABLE ?auto_78450 ) ( HOLDING ?auto_78445 ) ( CLEAR ?auto_78446 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78448 ?auto_78449 ?auto_78447 ?auto_78446 ?auto_78445 )
      ( MAKE-5PILE ?auto_78443 ?auto_78444 ?auto_78445 ?auto_78446 ?auto_78447 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78451 - BLOCK
      ?auto_78452 - BLOCK
      ?auto_78453 - BLOCK
      ?auto_78454 - BLOCK
      ?auto_78455 - BLOCK
    )
    :vars
    (
      ?auto_78458 - BLOCK
      ?auto_78456 - BLOCK
      ?auto_78457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78451 ?auto_78452 ) ) ( not ( = ?auto_78451 ?auto_78453 ) ) ( not ( = ?auto_78451 ?auto_78454 ) ) ( not ( = ?auto_78451 ?auto_78455 ) ) ( not ( = ?auto_78452 ?auto_78453 ) ) ( not ( = ?auto_78452 ?auto_78454 ) ) ( not ( = ?auto_78452 ?auto_78455 ) ) ( not ( = ?auto_78453 ?auto_78454 ) ) ( not ( = ?auto_78453 ?auto_78455 ) ) ( not ( = ?auto_78454 ?auto_78455 ) ) ( ON ?auto_78455 ?auto_78458 ) ( not ( = ?auto_78451 ?auto_78458 ) ) ( not ( = ?auto_78452 ?auto_78458 ) ) ( not ( = ?auto_78453 ?auto_78458 ) ) ( not ( = ?auto_78454 ?auto_78458 ) ) ( not ( = ?auto_78455 ?auto_78458 ) ) ( ON ?auto_78454 ?auto_78455 ) ( ON-TABLE ?auto_78456 ) ( ON ?auto_78458 ?auto_78456 ) ( not ( = ?auto_78456 ?auto_78458 ) ) ( not ( = ?auto_78456 ?auto_78455 ) ) ( not ( = ?auto_78456 ?auto_78454 ) ) ( not ( = ?auto_78451 ?auto_78456 ) ) ( not ( = ?auto_78452 ?auto_78456 ) ) ( not ( = ?auto_78453 ?auto_78456 ) ) ( ON ?auto_78451 ?auto_78457 ) ( not ( = ?auto_78451 ?auto_78457 ) ) ( not ( = ?auto_78452 ?auto_78457 ) ) ( not ( = ?auto_78453 ?auto_78457 ) ) ( not ( = ?auto_78454 ?auto_78457 ) ) ( not ( = ?auto_78455 ?auto_78457 ) ) ( not ( = ?auto_78458 ?auto_78457 ) ) ( not ( = ?auto_78456 ?auto_78457 ) ) ( ON ?auto_78452 ?auto_78451 ) ( ON-TABLE ?auto_78457 ) ( CLEAR ?auto_78454 ) ( ON ?auto_78453 ?auto_78452 ) ( CLEAR ?auto_78453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78457 ?auto_78451 ?auto_78452 )
      ( MAKE-5PILE ?auto_78451 ?auto_78452 ?auto_78453 ?auto_78454 ?auto_78455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78459 - BLOCK
      ?auto_78460 - BLOCK
      ?auto_78461 - BLOCK
      ?auto_78462 - BLOCK
      ?auto_78463 - BLOCK
    )
    :vars
    (
      ?auto_78464 - BLOCK
      ?auto_78465 - BLOCK
      ?auto_78466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78459 ?auto_78460 ) ) ( not ( = ?auto_78459 ?auto_78461 ) ) ( not ( = ?auto_78459 ?auto_78462 ) ) ( not ( = ?auto_78459 ?auto_78463 ) ) ( not ( = ?auto_78460 ?auto_78461 ) ) ( not ( = ?auto_78460 ?auto_78462 ) ) ( not ( = ?auto_78460 ?auto_78463 ) ) ( not ( = ?auto_78461 ?auto_78462 ) ) ( not ( = ?auto_78461 ?auto_78463 ) ) ( not ( = ?auto_78462 ?auto_78463 ) ) ( ON ?auto_78463 ?auto_78464 ) ( not ( = ?auto_78459 ?auto_78464 ) ) ( not ( = ?auto_78460 ?auto_78464 ) ) ( not ( = ?auto_78461 ?auto_78464 ) ) ( not ( = ?auto_78462 ?auto_78464 ) ) ( not ( = ?auto_78463 ?auto_78464 ) ) ( ON-TABLE ?auto_78465 ) ( ON ?auto_78464 ?auto_78465 ) ( not ( = ?auto_78465 ?auto_78464 ) ) ( not ( = ?auto_78465 ?auto_78463 ) ) ( not ( = ?auto_78465 ?auto_78462 ) ) ( not ( = ?auto_78459 ?auto_78465 ) ) ( not ( = ?auto_78460 ?auto_78465 ) ) ( not ( = ?auto_78461 ?auto_78465 ) ) ( ON ?auto_78459 ?auto_78466 ) ( not ( = ?auto_78459 ?auto_78466 ) ) ( not ( = ?auto_78460 ?auto_78466 ) ) ( not ( = ?auto_78461 ?auto_78466 ) ) ( not ( = ?auto_78462 ?auto_78466 ) ) ( not ( = ?auto_78463 ?auto_78466 ) ) ( not ( = ?auto_78464 ?auto_78466 ) ) ( not ( = ?auto_78465 ?auto_78466 ) ) ( ON ?auto_78460 ?auto_78459 ) ( ON-TABLE ?auto_78466 ) ( ON ?auto_78461 ?auto_78460 ) ( CLEAR ?auto_78461 ) ( HOLDING ?auto_78462 ) ( CLEAR ?auto_78463 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78465 ?auto_78464 ?auto_78463 ?auto_78462 )
      ( MAKE-5PILE ?auto_78459 ?auto_78460 ?auto_78461 ?auto_78462 ?auto_78463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78467 - BLOCK
      ?auto_78468 - BLOCK
      ?auto_78469 - BLOCK
      ?auto_78470 - BLOCK
      ?auto_78471 - BLOCK
    )
    :vars
    (
      ?auto_78473 - BLOCK
      ?auto_78474 - BLOCK
      ?auto_78472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78467 ?auto_78468 ) ) ( not ( = ?auto_78467 ?auto_78469 ) ) ( not ( = ?auto_78467 ?auto_78470 ) ) ( not ( = ?auto_78467 ?auto_78471 ) ) ( not ( = ?auto_78468 ?auto_78469 ) ) ( not ( = ?auto_78468 ?auto_78470 ) ) ( not ( = ?auto_78468 ?auto_78471 ) ) ( not ( = ?auto_78469 ?auto_78470 ) ) ( not ( = ?auto_78469 ?auto_78471 ) ) ( not ( = ?auto_78470 ?auto_78471 ) ) ( ON ?auto_78471 ?auto_78473 ) ( not ( = ?auto_78467 ?auto_78473 ) ) ( not ( = ?auto_78468 ?auto_78473 ) ) ( not ( = ?auto_78469 ?auto_78473 ) ) ( not ( = ?auto_78470 ?auto_78473 ) ) ( not ( = ?auto_78471 ?auto_78473 ) ) ( ON-TABLE ?auto_78474 ) ( ON ?auto_78473 ?auto_78474 ) ( not ( = ?auto_78474 ?auto_78473 ) ) ( not ( = ?auto_78474 ?auto_78471 ) ) ( not ( = ?auto_78474 ?auto_78470 ) ) ( not ( = ?auto_78467 ?auto_78474 ) ) ( not ( = ?auto_78468 ?auto_78474 ) ) ( not ( = ?auto_78469 ?auto_78474 ) ) ( ON ?auto_78467 ?auto_78472 ) ( not ( = ?auto_78467 ?auto_78472 ) ) ( not ( = ?auto_78468 ?auto_78472 ) ) ( not ( = ?auto_78469 ?auto_78472 ) ) ( not ( = ?auto_78470 ?auto_78472 ) ) ( not ( = ?auto_78471 ?auto_78472 ) ) ( not ( = ?auto_78473 ?auto_78472 ) ) ( not ( = ?auto_78474 ?auto_78472 ) ) ( ON ?auto_78468 ?auto_78467 ) ( ON-TABLE ?auto_78472 ) ( ON ?auto_78469 ?auto_78468 ) ( CLEAR ?auto_78471 ) ( ON ?auto_78470 ?auto_78469 ) ( CLEAR ?auto_78470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78472 ?auto_78467 ?auto_78468 ?auto_78469 )
      ( MAKE-5PILE ?auto_78467 ?auto_78468 ?auto_78469 ?auto_78470 ?auto_78471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78475 - BLOCK
      ?auto_78476 - BLOCK
      ?auto_78477 - BLOCK
      ?auto_78478 - BLOCK
      ?auto_78479 - BLOCK
    )
    :vars
    (
      ?auto_78481 - BLOCK
      ?auto_78482 - BLOCK
      ?auto_78480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78475 ?auto_78476 ) ) ( not ( = ?auto_78475 ?auto_78477 ) ) ( not ( = ?auto_78475 ?auto_78478 ) ) ( not ( = ?auto_78475 ?auto_78479 ) ) ( not ( = ?auto_78476 ?auto_78477 ) ) ( not ( = ?auto_78476 ?auto_78478 ) ) ( not ( = ?auto_78476 ?auto_78479 ) ) ( not ( = ?auto_78477 ?auto_78478 ) ) ( not ( = ?auto_78477 ?auto_78479 ) ) ( not ( = ?auto_78478 ?auto_78479 ) ) ( not ( = ?auto_78475 ?auto_78481 ) ) ( not ( = ?auto_78476 ?auto_78481 ) ) ( not ( = ?auto_78477 ?auto_78481 ) ) ( not ( = ?auto_78478 ?auto_78481 ) ) ( not ( = ?auto_78479 ?auto_78481 ) ) ( ON-TABLE ?auto_78482 ) ( ON ?auto_78481 ?auto_78482 ) ( not ( = ?auto_78482 ?auto_78481 ) ) ( not ( = ?auto_78482 ?auto_78479 ) ) ( not ( = ?auto_78482 ?auto_78478 ) ) ( not ( = ?auto_78475 ?auto_78482 ) ) ( not ( = ?auto_78476 ?auto_78482 ) ) ( not ( = ?auto_78477 ?auto_78482 ) ) ( ON ?auto_78475 ?auto_78480 ) ( not ( = ?auto_78475 ?auto_78480 ) ) ( not ( = ?auto_78476 ?auto_78480 ) ) ( not ( = ?auto_78477 ?auto_78480 ) ) ( not ( = ?auto_78478 ?auto_78480 ) ) ( not ( = ?auto_78479 ?auto_78480 ) ) ( not ( = ?auto_78481 ?auto_78480 ) ) ( not ( = ?auto_78482 ?auto_78480 ) ) ( ON ?auto_78476 ?auto_78475 ) ( ON-TABLE ?auto_78480 ) ( ON ?auto_78477 ?auto_78476 ) ( ON ?auto_78478 ?auto_78477 ) ( CLEAR ?auto_78478 ) ( HOLDING ?auto_78479 ) ( CLEAR ?auto_78481 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78482 ?auto_78481 ?auto_78479 )
      ( MAKE-5PILE ?auto_78475 ?auto_78476 ?auto_78477 ?auto_78478 ?auto_78479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78483 - BLOCK
      ?auto_78484 - BLOCK
      ?auto_78485 - BLOCK
      ?auto_78486 - BLOCK
      ?auto_78487 - BLOCK
    )
    :vars
    (
      ?auto_78488 - BLOCK
      ?auto_78490 - BLOCK
      ?auto_78489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78483 ?auto_78484 ) ) ( not ( = ?auto_78483 ?auto_78485 ) ) ( not ( = ?auto_78483 ?auto_78486 ) ) ( not ( = ?auto_78483 ?auto_78487 ) ) ( not ( = ?auto_78484 ?auto_78485 ) ) ( not ( = ?auto_78484 ?auto_78486 ) ) ( not ( = ?auto_78484 ?auto_78487 ) ) ( not ( = ?auto_78485 ?auto_78486 ) ) ( not ( = ?auto_78485 ?auto_78487 ) ) ( not ( = ?auto_78486 ?auto_78487 ) ) ( not ( = ?auto_78483 ?auto_78488 ) ) ( not ( = ?auto_78484 ?auto_78488 ) ) ( not ( = ?auto_78485 ?auto_78488 ) ) ( not ( = ?auto_78486 ?auto_78488 ) ) ( not ( = ?auto_78487 ?auto_78488 ) ) ( ON-TABLE ?auto_78490 ) ( ON ?auto_78488 ?auto_78490 ) ( not ( = ?auto_78490 ?auto_78488 ) ) ( not ( = ?auto_78490 ?auto_78487 ) ) ( not ( = ?auto_78490 ?auto_78486 ) ) ( not ( = ?auto_78483 ?auto_78490 ) ) ( not ( = ?auto_78484 ?auto_78490 ) ) ( not ( = ?auto_78485 ?auto_78490 ) ) ( ON ?auto_78483 ?auto_78489 ) ( not ( = ?auto_78483 ?auto_78489 ) ) ( not ( = ?auto_78484 ?auto_78489 ) ) ( not ( = ?auto_78485 ?auto_78489 ) ) ( not ( = ?auto_78486 ?auto_78489 ) ) ( not ( = ?auto_78487 ?auto_78489 ) ) ( not ( = ?auto_78488 ?auto_78489 ) ) ( not ( = ?auto_78490 ?auto_78489 ) ) ( ON ?auto_78484 ?auto_78483 ) ( ON-TABLE ?auto_78489 ) ( ON ?auto_78485 ?auto_78484 ) ( ON ?auto_78486 ?auto_78485 ) ( CLEAR ?auto_78488 ) ( ON ?auto_78487 ?auto_78486 ) ( CLEAR ?auto_78487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78489 ?auto_78483 ?auto_78484 ?auto_78485 ?auto_78486 )
      ( MAKE-5PILE ?auto_78483 ?auto_78484 ?auto_78485 ?auto_78486 ?auto_78487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78491 - BLOCK
      ?auto_78492 - BLOCK
      ?auto_78493 - BLOCK
      ?auto_78494 - BLOCK
      ?auto_78495 - BLOCK
    )
    :vars
    (
      ?auto_78496 - BLOCK
      ?auto_78497 - BLOCK
      ?auto_78498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78491 ?auto_78492 ) ) ( not ( = ?auto_78491 ?auto_78493 ) ) ( not ( = ?auto_78491 ?auto_78494 ) ) ( not ( = ?auto_78491 ?auto_78495 ) ) ( not ( = ?auto_78492 ?auto_78493 ) ) ( not ( = ?auto_78492 ?auto_78494 ) ) ( not ( = ?auto_78492 ?auto_78495 ) ) ( not ( = ?auto_78493 ?auto_78494 ) ) ( not ( = ?auto_78493 ?auto_78495 ) ) ( not ( = ?auto_78494 ?auto_78495 ) ) ( not ( = ?auto_78491 ?auto_78496 ) ) ( not ( = ?auto_78492 ?auto_78496 ) ) ( not ( = ?auto_78493 ?auto_78496 ) ) ( not ( = ?auto_78494 ?auto_78496 ) ) ( not ( = ?auto_78495 ?auto_78496 ) ) ( ON-TABLE ?auto_78497 ) ( not ( = ?auto_78497 ?auto_78496 ) ) ( not ( = ?auto_78497 ?auto_78495 ) ) ( not ( = ?auto_78497 ?auto_78494 ) ) ( not ( = ?auto_78491 ?auto_78497 ) ) ( not ( = ?auto_78492 ?auto_78497 ) ) ( not ( = ?auto_78493 ?auto_78497 ) ) ( ON ?auto_78491 ?auto_78498 ) ( not ( = ?auto_78491 ?auto_78498 ) ) ( not ( = ?auto_78492 ?auto_78498 ) ) ( not ( = ?auto_78493 ?auto_78498 ) ) ( not ( = ?auto_78494 ?auto_78498 ) ) ( not ( = ?auto_78495 ?auto_78498 ) ) ( not ( = ?auto_78496 ?auto_78498 ) ) ( not ( = ?auto_78497 ?auto_78498 ) ) ( ON ?auto_78492 ?auto_78491 ) ( ON-TABLE ?auto_78498 ) ( ON ?auto_78493 ?auto_78492 ) ( ON ?auto_78494 ?auto_78493 ) ( ON ?auto_78495 ?auto_78494 ) ( CLEAR ?auto_78495 ) ( HOLDING ?auto_78496 ) ( CLEAR ?auto_78497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78497 ?auto_78496 )
      ( MAKE-5PILE ?auto_78491 ?auto_78492 ?auto_78493 ?auto_78494 ?auto_78495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78499 - BLOCK
      ?auto_78500 - BLOCK
      ?auto_78501 - BLOCK
      ?auto_78502 - BLOCK
      ?auto_78503 - BLOCK
    )
    :vars
    (
      ?auto_78504 - BLOCK
      ?auto_78506 - BLOCK
      ?auto_78505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78499 ?auto_78500 ) ) ( not ( = ?auto_78499 ?auto_78501 ) ) ( not ( = ?auto_78499 ?auto_78502 ) ) ( not ( = ?auto_78499 ?auto_78503 ) ) ( not ( = ?auto_78500 ?auto_78501 ) ) ( not ( = ?auto_78500 ?auto_78502 ) ) ( not ( = ?auto_78500 ?auto_78503 ) ) ( not ( = ?auto_78501 ?auto_78502 ) ) ( not ( = ?auto_78501 ?auto_78503 ) ) ( not ( = ?auto_78502 ?auto_78503 ) ) ( not ( = ?auto_78499 ?auto_78504 ) ) ( not ( = ?auto_78500 ?auto_78504 ) ) ( not ( = ?auto_78501 ?auto_78504 ) ) ( not ( = ?auto_78502 ?auto_78504 ) ) ( not ( = ?auto_78503 ?auto_78504 ) ) ( ON-TABLE ?auto_78506 ) ( not ( = ?auto_78506 ?auto_78504 ) ) ( not ( = ?auto_78506 ?auto_78503 ) ) ( not ( = ?auto_78506 ?auto_78502 ) ) ( not ( = ?auto_78499 ?auto_78506 ) ) ( not ( = ?auto_78500 ?auto_78506 ) ) ( not ( = ?auto_78501 ?auto_78506 ) ) ( ON ?auto_78499 ?auto_78505 ) ( not ( = ?auto_78499 ?auto_78505 ) ) ( not ( = ?auto_78500 ?auto_78505 ) ) ( not ( = ?auto_78501 ?auto_78505 ) ) ( not ( = ?auto_78502 ?auto_78505 ) ) ( not ( = ?auto_78503 ?auto_78505 ) ) ( not ( = ?auto_78504 ?auto_78505 ) ) ( not ( = ?auto_78506 ?auto_78505 ) ) ( ON ?auto_78500 ?auto_78499 ) ( ON-TABLE ?auto_78505 ) ( ON ?auto_78501 ?auto_78500 ) ( ON ?auto_78502 ?auto_78501 ) ( ON ?auto_78503 ?auto_78502 ) ( CLEAR ?auto_78506 ) ( ON ?auto_78504 ?auto_78503 ) ( CLEAR ?auto_78504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78505 ?auto_78499 ?auto_78500 ?auto_78501 ?auto_78502 ?auto_78503 )
      ( MAKE-5PILE ?auto_78499 ?auto_78500 ?auto_78501 ?auto_78502 ?auto_78503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78507 - BLOCK
      ?auto_78508 - BLOCK
      ?auto_78509 - BLOCK
      ?auto_78510 - BLOCK
      ?auto_78511 - BLOCK
    )
    :vars
    (
      ?auto_78514 - BLOCK
      ?auto_78513 - BLOCK
      ?auto_78512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78507 ?auto_78508 ) ) ( not ( = ?auto_78507 ?auto_78509 ) ) ( not ( = ?auto_78507 ?auto_78510 ) ) ( not ( = ?auto_78507 ?auto_78511 ) ) ( not ( = ?auto_78508 ?auto_78509 ) ) ( not ( = ?auto_78508 ?auto_78510 ) ) ( not ( = ?auto_78508 ?auto_78511 ) ) ( not ( = ?auto_78509 ?auto_78510 ) ) ( not ( = ?auto_78509 ?auto_78511 ) ) ( not ( = ?auto_78510 ?auto_78511 ) ) ( not ( = ?auto_78507 ?auto_78514 ) ) ( not ( = ?auto_78508 ?auto_78514 ) ) ( not ( = ?auto_78509 ?auto_78514 ) ) ( not ( = ?auto_78510 ?auto_78514 ) ) ( not ( = ?auto_78511 ?auto_78514 ) ) ( not ( = ?auto_78513 ?auto_78514 ) ) ( not ( = ?auto_78513 ?auto_78511 ) ) ( not ( = ?auto_78513 ?auto_78510 ) ) ( not ( = ?auto_78507 ?auto_78513 ) ) ( not ( = ?auto_78508 ?auto_78513 ) ) ( not ( = ?auto_78509 ?auto_78513 ) ) ( ON ?auto_78507 ?auto_78512 ) ( not ( = ?auto_78507 ?auto_78512 ) ) ( not ( = ?auto_78508 ?auto_78512 ) ) ( not ( = ?auto_78509 ?auto_78512 ) ) ( not ( = ?auto_78510 ?auto_78512 ) ) ( not ( = ?auto_78511 ?auto_78512 ) ) ( not ( = ?auto_78514 ?auto_78512 ) ) ( not ( = ?auto_78513 ?auto_78512 ) ) ( ON ?auto_78508 ?auto_78507 ) ( ON-TABLE ?auto_78512 ) ( ON ?auto_78509 ?auto_78508 ) ( ON ?auto_78510 ?auto_78509 ) ( ON ?auto_78511 ?auto_78510 ) ( ON ?auto_78514 ?auto_78511 ) ( CLEAR ?auto_78514 ) ( HOLDING ?auto_78513 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78513 )
      ( MAKE-5PILE ?auto_78507 ?auto_78508 ?auto_78509 ?auto_78510 ?auto_78511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78515 - BLOCK
      ?auto_78516 - BLOCK
      ?auto_78517 - BLOCK
      ?auto_78518 - BLOCK
      ?auto_78519 - BLOCK
    )
    :vars
    (
      ?auto_78522 - BLOCK
      ?auto_78521 - BLOCK
      ?auto_78520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78515 ?auto_78516 ) ) ( not ( = ?auto_78515 ?auto_78517 ) ) ( not ( = ?auto_78515 ?auto_78518 ) ) ( not ( = ?auto_78515 ?auto_78519 ) ) ( not ( = ?auto_78516 ?auto_78517 ) ) ( not ( = ?auto_78516 ?auto_78518 ) ) ( not ( = ?auto_78516 ?auto_78519 ) ) ( not ( = ?auto_78517 ?auto_78518 ) ) ( not ( = ?auto_78517 ?auto_78519 ) ) ( not ( = ?auto_78518 ?auto_78519 ) ) ( not ( = ?auto_78515 ?auto_78522 ) ) ( not ( = ?auto_78516 ?auto_78522 ) ) ( not ( = ?auto_78517 ?auto_78522 ) ) ( not ( = ?auto_78518 ?auto_78522 ) ) ( not ( = ?auto_78519 ?auto_78522 ) ) ( not ( = ?auto_78521 ?auto_78522 ) ) ( not ( = ?auto_78521 ?auto_78519 ) ) ( not ( = ?auto_78521 ?auto_78518 ) ) ( not ( = ?auto_78515 ?auto_78521 ) ) ( not ( = ?auto_78516 ?auto_78521 ) ) ( not ( = ?auto_78517 ?auto_78521 ) ) ( ON ?auto_78515 ?auto_78520 ) ( not ( = ?auto_78515 ?auto_78520 ) ) ( not ( = ?auto_78516 ?auto_78520 ) ) ( not ( = ?auto_78517 ?auto_78520 ) ) ( not ( = ?auto_78518 ?auto_78520 ) ) ( not ( = ?auto_78519 ?auto_78520 ) ) ( not ( = ?auto_78522 ?auto_78520 ) ) ( not ( = ?auto_78521 ?auto_78520 ) ) ( ON ?auto_78516 ?auto_78515 ) ( ON-TABLE ?auto_78520 ) ( ON ?auto_78517 ?auto_78516 ) ( ON ?auto_78518 ?auto_78517 ) ( ON ?auto_78519 ?auto_78518 ) ( ON ?auto_78522 ?auto_78519 ) ( ON ?auto_78521 ?auto_78522 ) ( CLEAR ?auto_78521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78520 ?auto_78515 ?auto_78516 ?auto_78517 ?auto_78518 ?auto_78519 ?auto_78522 )
      ( MAKE-5PILE ?auto_78515 ?auto_78516 ?auto_78517 ?auto_78518 ?auto_78519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78534 - BLOCK
    )
    :vars
    (
      ?auto_78537 - BLOCK
      ?auto_78536 - BLOCK
      ?auto_78535 - BLOCK
      ?auto_78539 - BLOCK
      ?auto_78540 - BLOCK
      ?auto_78538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78537 ?auto_78534 ) ( ON-TABLE ?auto_78534 ) ( not ( = ?auto_78534 ?auto_78537 ) ) ( not ( = ?auto_78534 ?auto_78536 ) ) ( not ( = ?auto_78534 ?auto_78535 ) ) ( not ( = ?auto_78537 ?auto_78536 ) ) ( not ( = ?auto_78537 ?auto_78535 ) ) ( not ( = ?auto_78536 ?auto_78535 ) ) ( ON ?auto_78536 ?auto_78537 ) ( CLEAR ?auto_78536 ) ( HOLDING ?auto_78535 ) ( CLEAR ?auto_78539 ) ( ON-TABLE ?auto_78540 ) ( ON ?auto_78538 ?auto_78540 ) ( ON ?auto_78539 ?auto_78538 ) ( not ( = ?auto_78540 ?auto_78538 ) ) ( not ( = ?auto_78540 ?auto_78539 ) ) ( not ( = ?auto_78540 ?auto_78535 ) ) ( not ( = ?auto_78538 ?auto_78539 ) ) ( not ( = ?auto_78538 ?auto_78535 ) ) ( not ( = ?auto_78539 ?auto_78535 ) ) ( not ( = ?auto_78534 ?auto_78539 ) ) ( not ( = ?auto_78534 ?auto_78540 ) ) ( not ( = ?auto_78534 ?auto_78538 ) ) ( not ( = ?auto_78537 ?auto_78539 ) ) ( not ( = ?auto_78537 ?auto_78540 ) ) ( not ( = ?auto_78537 ?auto_78538 ) ) ( not ( = ?auto_78536 ?auto_78539 ) ) ( not ( = ?auto_78536 ?auto_78540 ) ) ( not ( = ?auto_78536 ?auto_78538 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78540 ?auto_78538 ?auto_78539 ?auto_78535 )
      ( MAKE-1PILE ?auto_78534 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78541 - BLOCK
    )
    :vars
    (
      ?auto_78547 - BLOCK
      ?auto_78546 - BLOCK
      ?auto_78545 - BLOCK
      ?auto_78542 - BLOCK
      ?auto_78543 - BLOCK
      ?auto_78544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78547 ?auto_78541 ) ( ON-TABLE ?auto_78541 ) ( not ( = ?auto_78541 ?auto_78547 ) ) ( not ( = ?auto_78541 ?auto_78546 ) ) ( not ( = ?auto_78541 ?auto_78545 ) ) ( not ( = ?auto_78547 ?auto_78546 ) ) ( not ( = ?auto_78547 ?auto_78545 ) ) ( not ( = ?auto_78546 ?auto_78545 ) ) ( ON ?auto_78546 ?auto_78547 ) ( CLEAR ?auto_78542 ) ( ON-TABLE ?auto_78543 ) ( ON ?auto_78544 ?auto_78543 ) ( ON ?auto_78542 ?auto_78544 ) ( not ( = ?auto_78543 ?auto_78544 ) ) ( not ( = ?auto_78543 ?auto_78542 ) ) ( not ( = ?auto_78543 ?auto_78545 ) ) ( not ( = ?auto_78544 ?auto_78542 ) ) ( not ( = ?auto_78544 ?auto_78545 ) ) ( not ( = ?auto_78542 ?auto_78545 ) ) ( not ( = ?auto_78541 ?auto_78542 ) ) ( not ( = ?auto_78541 ?auto_78543 ) ) ( not ( = ?auto_78541 ?auto_78544 ) ) ( not ( = ?auto_78547 ?auto_78542 ) ) ( not ( = ?auto_78547 ?auto_78543 ) ) ( not ( = ?auto_78547 ?auto_78544 ) ) ( not ( = ?auto_78546 ?auto_78542 ) ) ( not ( = ?auto_78546 ?auto_78543 ) ) ( not ( = ?auto_78546 ?auto_78544 ) ) ( ON ?auto_78545 ?auto_78546 ) ( CLEAR ?auto_78545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78541 ?auto_78547 ?auto_78546 )
      ( MAKE-1PILE ?auto_78541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78548 - BLOCK
    )
    :vars
    (
      ?auto_78553 - BLOCK
      ?auto_78551 - BLOCK
      ?auto_78552 - BLOCK
      ?auto_78550 - BLOCK
      ?auto_78549 - BLOCK
      ?auto_78554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78553 ?auto_78548 ) ( ON-TABLE ?auto_78548 ) ( not ( = ?auto_78548 ?auto_78553 ) ) ( not ( = ?auto_78548 ?auto_78551 ) ) ( not ( = ?auto_78548 ?auto_78552 ) ) ( not ( = ?auto_78553 ?auto_78551 ) ) ( not ( = ?auto_78553 ?auto_78552 ) ) ( not ( = ?auto_78551 ?auto_78552 ) ) ( ON ?auto_78551 ?auto_78553 ) ( ON-TABLE ?auto_78550 ) ( ON ?auto_78549 ?auto_78550 ) ( not ( = ?auto_78550 ?auto_78549 ) ) ( not ( = ?auto_78550 ?auto_78554 ) ) ( not ( = ?auto_78550 ?auto_78552 ) ) ( not ( = ?auto_78549 ?auto_78554 ) ) ( not ( = ?auto_78549 ?auto_78552 ) ) ( not ( = ?auto_78554 ?auto_78552 ) ) ( not ( = ?auto_78548 ?auto_78554 ) ) ( not ( = ?auto_78548 ?auto_78550 ) ) ( not ( = ?auto_78548 ?auto_78549 ) ) ( not ( = ?auto_78553 ?auto_78554 ) ) ( not ( = ?auto_78553 ?auto_78550 ) ) ( not ( = ?auto_78553 ?auto_78549 ) ) ( not ( = ?auto_78551 ?auto_78554 ) ) ( not ( = ?auto_78551 ?auto_78550 ) ) ( not ( = ?auto_78551 ?auto_78549 ) ) ( ON ?auto_78552 ?auto_78551 ) ( CLEAR ?auto_78552 ) ( HOLDING ?auto_78554 ) ( CLEAR ?auto_78549 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78550 ?auto_78549 ?auto_78554 )
      ( MAKE-1PILE ?auto_78548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78555 - BLOCK
    )
    :vars
    (
      ?auto_78559 - BLOCK
      ?auto_78557 - BLOCK
      ?auto_78558 - BLOCK
      ?auto_78561 - BLOCK
      ?auto_78560 - BLOCK
      ?auto_78556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78559 ?auto_78555 ) ( ON-TABLE ?auto_78555 ) ( not ( = ?auto_78555 ?auto_78559 ) ) ( not ( = ?auto_78555 ?auto_78557 ) ) ( not ( = ?auto_78555 ?auto_78558 ) ) ( not ( = ?auto_78559 ?auto_78557 ) ) ( not ( = ?auto_78559 ?auto_78558 ) ) ( not ( = ?auto_78557 ?auto_78558 ) ) ( ON ?auto_78557 ?auto_78559 ) ( ON-TABLE ?auto_78561 ) ( ON ?auto_78560 ?auto_78561 ) ( not ( = ?auto_78561 ?auto_78560 ) ) ( not ( = ?auto_78561 ?auto_78556 ) ) ( not ( = ?auto_78561 ?auto_78558 ) ) ( not ( = ?auto_78560 ?auto_78556 ) ) ( not ( = ?auto_78560 ?auto_78558 ) ) ( not ( = ?auto_78556 ?auto_78558 ) ) ( not ( = ?auto_78555 ?auto_78556 ) ) ( not ( = ?auto_78555 ?auto_78561 ) ) ( not ( = ?auto_78555 ?auto_78560 ) ) ( not ( = ?auto_78559 ?auto_78556 ) ) ( not ( = ?auto_78559 ?auto_78561 ) ) ( not ( = ?auto_78559 ?auto_78560 ) ) ( not ( = ?auto_78557 ?auto_78556 ) ) ( not ( = ?auto_78557 ?auto_78561 ) ) ( not ( = ?auto_78557 ?auto_78560 ) ) ( ON ?auto_78558 ?auto_78557 ) ( CLEAR ?auto_78560 ) ( ON ?auto_78556 ?auto_78558 ) ( CLEAR ?auto_78556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78555 ?auto_78559 ?auto_78557 ?auto_78558 )
      ( MAKE-1PILE ?auto_78555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78562 - BLOCK
    )
    :vars
    (
      ?auto_78564 - BLOCK
      ?auto_78568 - BLOCK
      ?auto_78563 - BLOCK
      ?auto_78565 - BLOCK
      ?auto_78567 - BLOCK
      ?auto_78566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78564 ?auto_78562 ) ( ON-TABLE ?auto_78562 ) ( not ( = ?auto_78562 ?auto_78564 ) ) ( not ( = ?auto_78562 ?auto_78568 ) ) ( not ( = ?auto_78562 ?auto_78563 ) ) ( not ( = ?auto_78564 ?auto_78568 ) ) ( not ( = ?auto_78564 ?auto_78563 ) ) ( not ( = ?auto_78568 ?auto_78563 ) ) ( ON ?auto_78568 ?auto_78564 ) ( ON-TABLE ?auto_78565 ) ( not ( = ?auto_78565 ?auto_78567 ) ) ( not ( = ?auto_78565 ?auto_78566 ) ) ( not ( = ?auto_78565 ?auto_78563 ) ) ( not ( = ?auto_78567 ?auto_78566 ) ) ( not ( = ?auto_78567 ?auto_78563 ) ) ( not ( = ?auto_78566 ?auto_78563 ) ) ( not ( = ?auto_78562 ?auto_78566 ) ) ( not ( = ?auto_78562 ?auto_78565 ) ) ( not ( = ?auto_78562 ?auto_78567 ) ) ( not ( = ?auto_78564 ?auto_78566 ) ) ( not ( = ?auto_78564 ?auto_78565 ) ) ( not ( = ?auto_78564 ?auto_78567 ) ) ( not ( = ?auto_78568 ?auto_78566 ) ) ( not ( = ?auto_78568 ?auto_78565 ) ) ( not ( = ?auto_78568 ?auto_78567 ) ) ( ON ?auto_78563 ?auto_78568 ) ( ON ?auto_78566 ?auto_78563 ) ( CLEAR ?auto_78566 ) ( HOLDING ?auto_78567 ) ( CLEAR ?auto_78565 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78565 ?auto_78567 )
      ( MAKE-1PILE ?auto_78562 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78569 - BLOCK
    )
    :vars
    (
      ?auto_78575 - BLOCK
      ?auto_78571 - BLOCK
      ?auto_78570 - BLOCK
      ?auto_78573 - BLOCK
      ?auto_78572 - BLOCK
      ?auto_78574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78575 ?auto_78569 ) ( ON-TABLE ?auto_78569 ) ( not ( = ?auto_78569 ?auto_78575 ) ) ( not ( = ?auto_78569 ?auto_78571 ) ) ( not ( = ?auto_78569 ?auto_78570 ) ) ( not ( = ?auto_78575 ?auto_78571 ) ) ( not ( = ?auto_78575 ?auto_78570 ) ) ( not ( = ?auto_78571 ?auto_78570 ) ) ( ON ?auto_78571 ?auto_78575 ) ( ON-TABLE ?auto_78573 ) ( not ( = ?auto_78573 ?auto_78572 ) ) ( not ( = ?auto_78573 ?auto_78574 ) ) ( not ( = ?auto_78573 ?auto_78570 ) ) ( not ( = ?auto_78572 ?auto_78574 ) ) ( not ( = ?auto_78572 ?auto_78570 ) ) ( not ( = ?auto_78574 ?auto_78570 ) ) ( not ( = ?auto_78569 ?auto_78574 ) ) ( not ( = ?auto_78569 ?auto_78573 ) ) ( not ( = ?auto_78569 ?auto_78572 ) ) ( not ( = ?auto_78575 ?auto_78574 ) ) ( not ( = ?auto_78575 ?auto_78573 ) ) ( not ( = ?auto_78575 ?auto_78572 ) ) ( not ( = ?auto_78571 ?auto_78574 ) ) ( not ( = ?auto_78571 ?auto_78573 ) ) ( not ( = ?auto_78571 ?auto_78572 ) ) ( ON ?auto_78570 ?auto_78571 ) ( ON ?auto_78574 ?auto_78570 ) ( CLEAR ?auto_78573 ) ( ON ?auto_78572 ?auto_78574 ) ( CLEAR ?auto_78572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78569 ?auto_78575 ?auto_78571 ?auto_78570 ?auto_78574 )
      ( MAKE-1PILE ?auto_78569 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78576 - BLOCK
    )
    :vars
    (
      ?auto_78582 - BLOCK
      ?auto_78581 - BLOCK
      ?auto_78577 - BLOCK
      ?auto_78580 - BLOCK
      ?auto_78579 - BLOCK
      ?auto_78578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78582 ?auto_78576 ) ( ON-TABLE ?auto_78576 ) ( not ( = ?auto_78576 ?auto_78582 ) ) ( not ( = ?auto_78576 ?auto_78581 ) ) ( not ( = ?auto_78576 ?auto_78577 ) ) ( not ( = ?auto_78582 ?auto_78581 ) ) ( not ( = ?auto_78582 ?auto_78577 ) ) ( not ( = ?auto_78581 ?auto_78577 ) ) ( ON ?auto_78581 ?auto_78582 ) ( not ( = ?auto_78580 ?auto_78579 ) ) ( not ( = ?auto_78580 ?auto_78578 ) ) ( not ( = ?auto_78580 ?auto_78577 ) ) ( not ( = ?auto_78579 ?auto_78578 ) ) ( not ( = ?auto_78579 ?auto_78577 ) ) ( not ( = ?auto_78578 ?auto_78577 ) ) ( not ( = ?auto_78576 ?auto_78578 ) ) ( not ( = ?auto_78576 ?auto_78580 ) ) ( not ( = ?auto_78576 ?auto_78579 ) ) ( not ( = ?auto_78582 ?auto_78578 ) ) ( not ( = ?auto_78582 ?auto_78580 ) ) ( not ( = ?auto_78582 ?auto_78579 ) ) ( not ( = ?auto_78581 ?auto_78578 ) ) ( not ( = ?auto_78581 ?auto_78580 ) ) ( not ( = ?auto_78581 ?auto_78579 ) ) ( ON ?auto_78577 ?auto_78581 ) ( ON ?auto_78578 ?auto_78577 ) ( ON ?auto_78579 ?auto_78578 ) ( CLEAR ?auto_78579 ) ( HOLDING ?auto_78580 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78580 )
      ( MAKE-1PILE ?auto_78576 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78591 - BLOCK
    )
    :vars
    (
      ?auto_78594 - BLOCK
      ?auto_78592 - BLOCK
      ?auto_78596 - BLOCK
      ?auto_78595 - BLOCK
      ?auto_78597 - BLOCK
      ?auto_78593 - BLOCK
      ?auto_78598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78594 ?auto_78591 ) ( ON-TABLE ?auto_78591 ) ( not ( = ?auto_78591 ?auto_78594 ) ) ( not ( = ?auto_78591 ?auto_78592 ) ) ( not ( = ?auto_78591 ?auto_78596 ) ) ( not ( = ?auto_78594 ?auto_78592 ) ) ( not ( = ?auto_78594 ?auto_78596 ) ) ( not ( = ?auto_78592 ?auto_78596 ) ) ( ON ?auto_78592 ?auto_78594 ) ( not ( = ?auto_78595 ?auto_78597 ) ) ( not ( = ?auto_78595 ?auto_78593 ) ) ( not ( = ?auto_78595 ?auto_78596 ) ) ( not ( = ?auto_78597 ?auto_78593 ) ) ( not ( = ?auto_78597 ?auto_78596 ) ) ( not ( = ?auto_78593 ?auto_78596 ) ) ( not ( = ?auto_78591 ?auto_78593 ) ) ( not ( = ?auto_78591 ?auto_78595 ) ) ( not ( = ?auto_78591 ?auto_78597 ) ) ( not ( = ?auto_78594 ?auto_78593 ) ) ( not ( = ?auto_78594 ?auto_78595 ) ) ( not ( = ?auto_78594 ?auto_78597 ) ) ( not ( = ?auto_78592 ?auto_78593 ) ) ( not ( = ?auto_78592 ?auto_78595 ) ) ( not ( = ?auto_78592 ?auto_78597 ) ) ( ON ?auto_78596 ?auto_78592 ) ( ON ?auto_78593 ?auto_78596 ) ( ON ?auto_78597 ?auto_78593 ) ( CLEAR ?auto_78597 ) ( ON ?auto_78595 ?auto_78598 ) ( CLEAR ?auto_78595 ) ( HAND-EMPTY ) ( not ( = ?auto_78591 ?auto_78598 ) ) ( not ( = ?auto_78594 ?auto_78598 ) ) ( not ( = ?auto_78592 ?auto_78598 ) ) ( not ( = ?auto_78596 ?auto_78598 ) ) ( not ( = ?auto_78595 ?auto_78598 ) ) ( not ( = ?auto_78597 ?auto_78598 ) ) ( not ( = ?auto_78593 ?auto_78598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78595 ?auto_78598 )
      ( MAKE-1PILE ?auto_78591 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78599 - BLOCK
    )
    :vars
    (
      ?auto_78603 - BLOCK
      ?auto_78606 - BLOCK
      ?auto_78605 - BLOCK
      ?auto_78600 - BLOCK
      ?auto_78601 - BLOCK
      ?auto_78604 - BLOCK
      ?auto_78602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78603 ?auto_78599 ) ( ON-TABLE ?auto_78599 ) ( not ( = ?auto_78599 ?auto_78603 ) ) ( not ( = ?auto_78599 ?auto_78606 ) ) ( not ( = ?auto_78599 ?auto_78605 ) ) ( not ( = ?auto_78603 ?auto_78606 ) ) ( not ( = ?auto_78603 ?auto_78605 ) ) ( not ( = ?auto_78606 ?auto_78605 ) ) ( ON ?auto_78606 ?auto_78603 ) ( not ( = ?auto_78600 ?auto_78601 ) ) ( not ( = ?auto_78600 ?auto_78604 ) ) ( not ( = ?auto_78600 ?auto_78605 ) ) ( not ( = ?auto_78601 ?auto_78604 ) ) ( not ( = ?auto_78601 ?auto_78605 ) ) ( not ( = ?auto_78604 ?auto_78605 ) ) ( not ( = ?auto_78599 ?auto_78604 ) ) ( not ( = ?auto_78599 ?auto_78600 ) ) ( not ( = ?auto_78599 ?auto_78601 ) ) ( not ( = ?auto_78603 ?auto_78604 ) ) ( not ( = ?auto_78603 ?auto_78600 ) ) ( not ( = ?auto_78603 ?auto_78601 ) ) ( not ( = ?auto_78606 ?auto_78604 ) ) ( not ( = ?auto_78606 ?auto_78600 ) ) ( not ( = ?auto_78606 ?auto_78601 ) ) ( ON ?auto_78605 ?auto_78606 ) ( ON ?auto_78604 ?auto_78605 ) ( ON ?auto_78600 ?auto_78602 ) ( CLEAR ?auto_78600 ) ( not ( = ?auto_78599 ?auto_78602 ) ) ( not ( = ?auto_78603 ?auto_78602 ) ) ( not ( = ?auto_78606 ?auto_78602 ) ) ( not ( = ?auto_78605 ?auto_78602 ) ) ( not ( = ?auto_78600 ?auto_78602 ) ) ( not ( = ?auto_78601 ?auto_78602 ) ) ( not ( = ?auto_78604 ?auto_78602 ) ) ( HOLDING ?auto_78601 ) ( CLEAR ?auto_78604 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78599 ?auto_78603 ?auto_78606 ?auto_78605 ?auto_78604 ?auto_78601 )
      ( MAKE-1PILE ?auto_78599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78607 - BLOCK
    )
    :vars
    (
      ?auto_78608 - BLOCK
      ?auto_78614 - BLOCK
      ?auto_78609 - BLOCK
      ?auto_78611 - BLOCK
      ?auto_78610 - BLOCK
      ?auto_78613 - BLOCK
      ?auto_78612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78608 ?auto_78607 ) ( ON-TABLE ?auto_78607 ) ( not ( = ?auto_78607 ?auto_78608 ) ) ( not ( = ?auto_78607 ?auto_78614 ) ) ( not ( = ?auto_78607 ?auto_78609 ) ) ( not ( = ?auto_78608 ?auto_78614 ) ) ( not ( = ?auto_78608 ?auto_78609 ) ) ( not ( = ?auto_78614 ?auto_78609 ) ) ( ON ?auto_78614 ?auto_78608 ) ( not ( = ?auto_78611 ?auto_78610 ) ) ( not ( = ?auto_78611 ?auto_78613 ) ) ( not ( = ?auto_78611 ?auto_78609 ) ) ( not ( = ?auto_78610 ?auto_78613 ) ) ( not ( = ?auto_78610 ?auto_78609 ) ) ( not ( = ?auto_78613 ?auto_78609 ) ) ( not ( = ?auto_78607 ?auto_78613 ) ) ( not ( = ?auto_78607 ?auto_78611 ) ) ( not ( = ?auto_78607 ?auto_78610 ) ) ( not ( = ?auto_78608 ?auto_78613 ) ) ( not ( = ?auto_78608 ?auto_78611 ) ) ( not ( = ?auto_78608 ?auto_78610 ) ) ( not ( = ?auto_78614 ?auto_78613 ) ) ( not ( = ?auto_78614 ?auto_78611 ) ) ( not ( = ?auto_78614 ?auto_78610 ) ) ( ON ?auto_78609 ?auto_78614 ) ( ON ?auto_78613 ?auto_78609 ) ( ON ?auto_78611 ?auto_78612 ) ( not ( = ?auto_78607 ?auto_78612 ) ) ( not ( = ?auto_78608 ?auto_78612 ) ) ( not ( = ?auto_78614 ?auto_78612 ) ) ( not ( = ?auto_78609 ?auto_78612 ) ) ( not ( = ?auto_78611 ?auto_78612 ) ) ( not ( = ?auto_78610 ?auto_78612 ) ) ( not ( = ?auto_78613 ?auto_78612 ) ) ( CLEAR ?auto_78613 ) ( ON ?auto_78610 ?auto_78611 ) ( CLEAR ?auto_78610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78612 ?auto_78611 )
      ( MAKE-1PILE ?auto_78607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78615 - BLOCK
    )
    :vars
    (
      ?auto_78618 - BLOCK
      ?auto_78617 - BLOCK
      ?auto_78616 - BLOCK
      ?auto_78620 - BLOCK
      ?auto_78622 - BLOCK
      ?auto_78619 - BLOCK
      ?auto_78621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78618 ?auto_78615 ) ( ON-TABLE ?auto_78615 ) ( not ( = ?auto_78615 ?auto_78618 ) ) ( not ( = ?auto_78615 ?auto_78617 ) ) ( not ( = ?auto_78615 ?auto_78616 ) ) ( not ( = ?auto_78618 ?auto_78617 ) ) ( not ( = ?auto_78618 ?auto_78616 ) ) ( not ( = ?auto_78617 ?auto_78616 ) ) ( ON ?auto_78617 ?auto_78618 ) ( not ( = ?auto_78620 ?auto_78622 ) ) ( not ( = ?auto_78620 ?auto_78619 ) ) ( not ( = ?auto_78620 ?auto_78616 ) ) ( not ( = ?auto_78622 ?auto_78619 ) ) ( not ( = ?auto_78622 ?auto_78616 ) ) ( not ( = ?auto_78619 ?auto_78616 ) ) ( not ( = ?auto_78615 ?auto_78619 ) ) ( not ( = ?auto_78615 ?auto_78620 ) ) ( not ( = ?auto_78615 ?auto_78622 ) ) ( not ( = ?auto_78618 ?auto_78619 ) ) ( not ( = ?auto_78618 ?auto_78620 ) ) ( not ( = ?auto_78618 ?auto_78622 ) ) ( not ( = ?auto_78617 ?auto_78619 ) ) ( not ( = ?auto_78617 ?auto_78620 ) ) ( not ( = ?auto_78617 ?auto_78622 ) ) ( ON ?auto_78616 ?auto_78617 ) ( ON ?auto_78620 ?auto_78621 ) ( not ( = ?auto_78615 ?auto_78621 ) ) ( not ( = ?auto_78618 ?auto_78621 ) ) ( not ( = ?auto_78617 ?auto_78621 ) ) ( not ( = ?auto_78616 ?auto_78621 ) ) ( not ( = ?auto_78620 ?auto_78621 ) ) ( not ( = ?auto_78622 ?auto_78621 ) ) ( not ( = ?auto_78619 ?auto_78621 ) ) ( ON ?auto_78622 ?auto_78620 ) ( CLEAR ?auto_78622 ) ( ON-TABLE ?auto_78621 ) ( HOLDING ?auto_78619 ) ( CLEAR ?auto_78616 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78615 ?auto_78618 ?auto_78617 ?auto_78616 ?auto_78619 )
      ( MAKE-1PILE ?auto_78615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78661 - BLOCK
      ?auto_78662 - BLOCK
      ?auto_78663 - BLOCK
      ?auto_78664 - BLOCK
      ?auto_78665 - BLOCK
      ?auto_78666 - BLOCK
    )
    :vars
    (
      ?auto_78667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78661 ) ( ON ?auto_78662 ?auto_78661 ) ( ON ?auto_78663 ?auto_78662 ) ( ON ?auto_78664 ?auto_78663 ) ( not ( = ?auto_78661 ?auto_78662 ) ) ( not ( = ?auto_78661 ?auto_78663 ) ) ( not ( = ?auto_78661 ?auto_78664 ) ) ( not ( = ?auto_78661 ?auto_78665 ) ) ( not ( = ?auto_78661 ?auto_78666 ) ) ( not ( = ?auto_78662 ?auto_78663 ) ) ( not ( = ?auto_78662 ?auto_78664 ) ) ( not ( = ?auto_78662 ?auto_78665 ) ) ( not ( = ?auto_78662 ?auto_78666 ) ) ( not ( = ?auto_78663 ?auto_78664 ) ) ( not ( = ?auto_78663 ?auto_78665 ) ) ( not ( = ?auto_78663 ?auto_78666 ) ) ( not ( = ?auto_78664 ?auto_78665 ) ) ( not ( = ?auto_78664 ?auto_78666 ) ) ( not ( = ?auto_78665 ?auto_78666 ) ) ( ON ?auto_78666 ?auto_78667 ) ( not ( = ?auto_78661 ?auto_78667 ) ) ( not ( = ?auto_78662 ?auto_78667 ) ) ( not ( = ?auto_78663 ?auto_78667 ) ) ( not ( = ?auto_78664 ?auto_78667 ) ) ( not ( = ?auto_78665 ?auto_78667 ) ) ( not ( = ?auto_78666 ?auto_78667 ) ) ( CLEAR ?auto_78664 ) ( ON ?auto_78665 ?auto_78666 ) ( CLEAR ?auto_78665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78667 ?auto_78666 )
      ( MAKE-6PILE ?auto_78661 ?auto_78662 ?auto_78663 ?auto_78664 ?auto_78665 ?auto_78666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78668 - BLOCK
      ?auto_78669 - BLOCK
      ?auto_78670 - BLOCK
      ?auto_78671 - BLOCK
      ?auto_78672 - BLOCK
      ?auto_78673 - BLOCK
    )
    :vars
    (
      ?auto_78674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78668 ) ( ON ?auto_78669 ?auto_78668 ) ( ON ?auto_78670 ?auto_78669 ) ( not ( = ?auto_78668 ?auto_78669 ) ) ( not ( = ?auto_78668 ?auto_78670 ) ) ( not ( = ?auto_78668 ?auto_78671 ) ) ( not ( = ?auto_78668 ?auto_78672 ) ) ( not ( = ?auto_78668 ?auto_78673 ) ) ( not ( = ?auto_78669 ?auto_78670 ) ) ( not ( = ?auto_78669 ?auto_78671 ) ) ( not ( = ?auto_78669 ?auto_78672 ) ) ( not ( = ?auto_78669 ?auto_78673 ) ) ( not ( = ?auto_78670 ?auto_78671 ) ) ( not ( = ?auto_78670 ?auto_78672 ) ) ( not ( = ?auto_78670 ?auto_78673 ) ) ( not ( = ?auto_78671 ?auto_78672 ) ) ( not ( = ?auto_78671 ?auto_78673 ) ) ( not ( = ?auto_78672 ?auto_78673 ) ) ( ON ?auto_78673 ?auto_78674 ) ( not ( = ?auto_78668 ?auto_78674 ) ) ( not ( = ?auto_78669 ?auto_78674 ) ) ( not ( = ?auto_78670 ?auto_78674 ) ) ( not ( = ?auto_78671 ?auto_78674 ) ) ( not ( = ?auto_78672 ?auto_78674 ) ) ( not ( = ?auto_78673 ?auto_78674 ) ) ( ON ?auto_78672 ?auto_78673 ) ( CLEAR ?auto_78672 ) ( ON-TABLE ?auto_78674 ) ( HOLDING ?auto_78671 ) ( CLEAR ?auto_78670 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78668 ?auto_78669 ?auto_78670 ?auto_78671 )
      ( MAKE-6PILE ?auto_78668 ?auto_78669 ?auto_78670 ?auto_78671 ?auto_78672 ?auto_78673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78675 - BLOCK
      ?auto_78676 - BLOCK
      ?auto_78677 - BLOCK
      ?auto_78678 - BLOCK
      ?auto_78679 - BLOCK
      ?auto_78680 - BLOCK
    )
    :vars
    (
      ?auto_78681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78675 ) ( ON ?auto_78676 ?auto_78675 ) ( ON ?auto_78677 ?auto_78676 ) ( not ( = ?auto_78675 ?auto_78676 ) ) ( not ( = ?auto_78675 ?auto_78677 ) ) ( not ( = ?auto_78675 ?auto_78678 ) ) ( not ( = ?auto_78675 ?auto_78679 ) ) ( not ( = ?auto_78675 ?auto_78680 ) ) ( not ( = ?auto_78676 ?auto_78677 ) ) ( not ( = ?auto_78676 ?auto_78678 ) ) ( not ( = ?auto_78676 ?auto_78679 ) ) ( not ( = ?auto_78676 ?auto_78680 ) ) ( not ( = ?auto_78677 ?auto_78678 ) ) ( not ( = ?auto_78677 ?auto_78679 ) ) ( not ( = ?auto_78677 ?auto_78680 ) ) ( not ( = ?auto_78678 ?auto_78679 ) ) ( not ( = ?auto_78678 ?auto_78680 ) ) ( not ( = ?auto_78679 ?auto_78680 ) ) ( ON ?auto_78680 ?auto_78681 ) ( not ( = ?auto_78675 ?auto_78681 ) ) ( not ( = ?auto_78676 ?auto_78681 ) ) ( not ( = ?auto_78677 ?auto_78681 ) ) ( not ( = ?auto_78678 ?auto_78681 ) ) ( not ( = ?auto_78679 ?auto_78681 ) ) ( not ( = ?auto_78680 ?auto_78681 ) ) ( ON ?auto_78679 ?auto_78680 ) ( ON-TABLE ?auto_78681 ) ( CLEAR ?auto_78677 ) ( ON ?auto_78678 ?auto_78679 ) ( CLEAR ?auto_78678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78681 ?auto_78680 ?auto_78679 )
      ( MAKE-6PILE ?auto_78675 ?auto_78676 ?auto_78677 ?auto_78678 ?auto_78679 ?auto_78680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78682 - BLOCK
      ?auto_78683 - BLOCK
      ?auto_78684 - BLOCK
      ?auto_78685 - BLOCK
      ?auto_78686 - BLOCK
      ?auto_78687 - BLOCK
    )
    :vars
    (
      ?auto_78688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78682 ) ( ON ?auto_78683 ?auto_78682 ) ( not ( = ?auto_78682 ?auto_78683 ) ) ( not ( = ?auto_78682 ?auto_78684 ) ) ( not ( = ?auto_78682 ?auto_78685 ) ) ( not ( = ?auto_78682 ?auto_78686 ) ) ( not ( = ?auto_78682 ?auto_78687 ) ) ( not ( = ?auto_78683 ?auto_78684 ) ) ( not ( = ?auto_78683 ?auto_78685 ) ) ( not ( = ?auto_78683 ?auto_78686 ) ) ( not ( = ?auto_78683 ?auto_78687 ) ) ( not ( = ?auto_78684 ?auto_78685 ) ) ( not ( = ?auto_78684 ?auto_78686 ) ) ( not ( = ?auto_78684 ?auto_78687 ) ) ( not ( = ?auto_78685 ?auto_78686 ) ) ( not ( = ?auto_78685 ?auto_78687 ) ) ( not ( = ?auto_78686 ?auto_78687 ) ) ( ON ?auto_78687 ?auto_78688 ) ( not ( = ?auto_78682 ?auto_78688 ) ) ( not ( = ?auto_78683 ?auto_78688 ) ) ( not ( = ?auto_78684 ?auto_78688 ) ) ( not ( = ?auto_78685 ?auto_78688 ) ) ( not ( = ?auto_78686 ?auto_78688 ) ) ( not ( = ?auto_78687 ?auto_78688 ) ) ( ON ?auto_78686 ?auto_78687 ) ( ON-TABLE ?auto_78688 ) ( ON ?auto_78685 ?auto_78686 ) ( CLEAR ?auto_78685 ) ( HOLDING ?auto_78684 ) ( CLEAR ?auto_78683 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78682 ?auto_78683 ?auto_78684 )
      ( MAKE-6PILE ?auto_78682 ?auto_78683 ?auto_78684 ?auto_78685 ?auto_78686 ?auto_78687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78689 - BLOCK
      ?auto_78690 - BLOCK
      ?auto_78691 - BLOCK
      ?auto_78692 - BLOCK
      ?auto_78693 - BLOCK
      ?auto_78694 - BLOCK
    )
    :vars
    (
      ?auto_78695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78689 ) ( ON ?auto_78690 ?auto_78689 ) ( not ( = ?auto_78689 ?auto_78690 ) ) ( not ( = ?auto_78689 ?auto_78691 ) ) ( not ( = ?auto_78689 ?auto_78692 ) ) ( not ( = ?auto_78689 ?auto_78693 ) ) ( not ( = ?auto_78689 ?auto_78694 ) ) ( not ( = ?auto_78690 ?auto_78691 ) ) ( not ( = ?auto_78690 ?auto_78692 ) ) ( not ( = ?auto_78690 ?auto_78693 ) ) ( not ( = ?auto_78690 ?auto_78694 ) ) ( not ( = ?auto_78691 ?auto_78692 ) ) ( not ( = ?auto_78691 ?auto_78693 ) ) ( not ( = ?auto_78691 ?auto_78694 ) ) ( not ( = ?auto_78692 ?auto_78693 ) ) ( not ( = ?auto_78692 ?auto_78694 ) ) ( not ( = ?auto_78693 ?auto_78694 ) ) ( ON ?auto_78694 ?auto_78695 ) ( not ( = ?auto_78689 ?auto_78695 ) ) ( not ( = ?auto_78690 ?auto_78695 ) ) ( not ( = ?auto_78691 ?auto_78695 ) ) ( not ( = ?auto_78692 ?auto_78695 ) ) ( not ( = ?auto_78693 ?auto_78695 ) ) ( not ( = ?auto_78694 ?auto_78695 ) ) ( ON ?auto_78693 ?auto_78694 ) ( ON-TABLE ?auto_78695 ) ( ON ?auto_78692 ?auto_78693 ) ( CLEAR ?auto_78690 ) ( ON ?auto_78691 ?auto_78692 ) ( CLEAR ?auto_78691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78695 ?auto_78694 ?auto_78693 ?auto_78692 )
      ( MAKE-6PILE ?auto_78689 ?auto_78690 ?auto_78691 ?auto_78692 ?auto_78693 ?auto_78694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78696 - BLOCK
      ?auto_78697 - BLOCK
      ?auto_78698 - BLOCK
      ?auto_78699 - BLOCK
      ?auto_78700 - BLOCK
      ?auto_78701 - BLOCK
    )
    :vars
    (
      ?auto_78702 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78696 ) ( not ( = ?auto_78696 ?auto_78697 ) ) ( not ( = ?auto_78696 ?auto_78698 ) ) ( not ( = ?auto_78696 ?auto_78699 ) ) ( not ( = ?auto_78696 ?auto_78700 ) ) ( not ( = ?auto_78696 ?auto_78701 ) ) ( not ( = ?auto_78697 ?auto_78698 ) ) ( not ( = ?auto_78697 ?auto_78699 ) ) ( not ( = ?auto_78697 ?auto_78700 ) ) ( not ( = ?auto_78697 ?auto_78701 ) ) ( not ( = ?auto_78698 ?auto_78699 ) ) ( not ( = ?auto_78698 ?auto_78700 ) ) ( not ( = ?auto_78698 ?auto_78701 ) ) ( not ( = ?auto_78699 ?auto_78700 ) ) ( not ( = ?auto_78699 ?auto_78701 ) ) ( not ( = ?auto_78700 ?auto_78701 ) ) ( ON ?auto_78701 ?auto_78702 ) ( not ( = ?auto_78696 ?auto_78702 ) ) ( not ( = ?auto_78697 ?auto_78702 ) ) ( not ( = ?auto_78698 ?auto_78702 ) ) ( not ( = ?auto_78699 ?auto_78702 ) ) ( not ( = ?auto_78700 ?auto_78702 ) ) ( not ( = ?auto_78701 ?auto_78702 ) ) ( ON ?auto_78700 ?auto_78701 ) ( ON-TABLE ?auto_78702 ) ( ON ?auto_78699 ?auto_78700 ) ( ON ?auto_78698 ?auto_78699 ) ( CLEAR ?auto_78698 ) ( HOLDING ?auto_78697 ) ( CLEAR ?auto_78696 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78696 ?auto_78697 )
      ( MAKE-6PILE ?auto_78696 ?auto_78697 ?auto_78698 ?auto_78699 ?auto_78700 ?auto_78701 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78703 - BLOCK
      ?auto_78704 - BLOCK
      ?auto_78705 - BLOCK
      ?auto_78706 - BLOCK
      ?auto_78707 - BLOCK
      ?auto_78708 - BLOCK
    )
    :vars
    (
      ?auto_78709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78703 ) ( not ( = ?auto_78703 ?auto_78704 ) ) ( not ( = ?auto_78703 ?auto_78705 ) ) ( not ( = ?auto_78703 ?auto_78706 ) ) ( not ( = ?auto_78703 ?auto_78707 ) ) ( not ( = ?auto_78703 ?auto_78708 ) ) ( not ( = ?auto_78704 ?auto_78705 ) ) ( not ( = ?auto_78704 ?auto_78706 ) ) ( not ( = ?auto_78704 ?auto_78707 ) ) ( not ( = ?auto_78704 ?auto_78708 ) ) ( not ( = ?auto_78705 ?auto_78706 ) ) ( not ( = ?auto_78705 ?auto_78707 ) ) ( not ( = ?auto_78705 ?auto_78708 ) ) ( not ( = ?auto_78706 ?auto_78707 ) ) ( not ( = ?auto_78706 ?auto_78708 ) ) ( not ( = ?auto_78707 ?auto_78708 ) ) ( ON ?auto_78708 ?auto_78709 ) ( not ( = ?auto_78703 ?auto_78709 ) ) ( not ( = ?auto_78704 ?auto_78709 ) ) ( not ( = ?auto_78705 ?auto_78709 ) ) ( not ( = ?auto_78706 ?auto_78709 ) ) ( not ( = ?auto_78707 ?auto_78709 ) ) ( not ( = ?auto_78708 ?auto_78709 ) ) ( ON ?auto_78707 ?auto_78708 ) ( ON-TABLE ?auto_78709 ) ( ON ?auto_78706 ?auto_78707 ) ( ON ?auto_78705 ?auto_78706 ) ( CLEAR ?auto_78703 ) ( ON ?auto_78704 ?auto_78705 ) ( CLEAR ?auto_78704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78709 ?auto_78708 ?auto_78707 ?auto_78706 ?auto_78705 )
      ( MAKE-6PILE ?auto_78703 ?auto_78704 ?auto_78705 ?auto_78706 ?auto_78707 ?auto_78708 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78710 - BLOCK
      ?auto_78711 - BLOCK
      ?auto_78712 - BLOCK
      ?auto_78713 - BLOCK
      ?auto_78714 - BLOCK
      ?auto_78715 - BLOCK
    )
    :vars
    (
      ?auto_78716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78710 ?auto_78711 ) ) ( not ( = ?auto_78710 ?auto_78712 ) ) ( not ( = ?auto_78710 ?auto_78713 ) ) ( not ( = ?auto_78710 ?auto_78714 ) ) ( not ( = ?auto_78710 ?auto_78715 ) ) ( not ( = ?auto_78711 ?auto_78712 ) ) ( not ( = ?auto_78711 ?auto_78713 ) ) ( not ( = ?auto_78711 ?auto_78714 ) ) ( not ( = ?auto_78711 ?auto_78715 ) ) ( not ( = ?auto_78712 ?auto_78713 ) ) ( not ( = ?auto_78712 ?auto_78714 ) ) ( not ( = ?auto_78712 ?auto_78715 ) ) ( not ( = ?auto_78713 ?auto_78714 ) ) ( not ( = ?auto_78713 ?auto_78715 ) ) ( not ( = ?auto_78714 ?auto_78715 ) ) ( ON ?auto_78715 ?auto_78716 ) ( not ( = ?auto_78710 ?auto_78716 ) ) ( not ( = ?auto_78711 ?auto_78716 ) ) ( not ( = ?auto_78712 ?auto_78716 ) ) ( not ( = ?auto_78713 ?auto_78716 ) ) ( not ( = ?auto_78714 ?auto_78716 ) ) ( not ( = ?auto_78715 ?auto_78716 ) ) ( ON ?auto_78714 ?auto_78715 ) ( ON-TABLE ?auto_78716 ) ( ON ?auto_78713 ?auto_78714 ) ( ON ?auto_78712 ?auto_78713 ) ( ON ?auto_78711 ?auto_78712 ) ( CLEAR ?auto_78711 ) ( HOLDING ?auto_78710 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78710 )
      ( MAKE-6PILE ?auto_78710 ?auto_78711 ?auto_78712 ?auto_78713 ?auto_78714 ?auto_78715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78717 - BLOCK
      ?auto_78718 - BLOCK
      ?auto_78719 - BLOCK
      ?auto_78720 - BLOCK
      ?auto_78721 - BLOCK
      ?auto_78722 - BLOCK
    )
    :vars
    (
      ?auto_78723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78717 ?auto_78718 ) ) ( not ( = ?auto_78717 ?auto_78719 ) ) ( not ( = ?auto_78717 ?auto_78720 ) ) ( not ( = ?auto_78717 ?auto_78721 ) ) ( not ( = ?auto_78717 ?auto_78722 ) ) ( not ( = ?auto_78718 ?auto_78719 ) ) ( not ( = ?auto_78718 ?auto_78720 ) ) ( not ( = ?auto_78718 ?auto_78721 ) ) ( not ( = ?auto_78718 ?auto_78722 ) ) ( not ( = ?auto_78719 ?auto_78720 ) ) ( not ( = ?auto_78719 ?auto_78721 ) ) ( not ( = ?auto_78719 ?auto_78722 ) ) ( not ( = ?auto_78720 ?auto_78721 ) ) ( not ( = ?auto_78720 ?auto_78722 ) ) ( not ( = ?auto_78721 ?auto_78722 ) ) ( ON ?auto_78722 ?auto_78723 ) ( not ( = ?auto_78717 ?auto_78723 ) ) ( not ( = ?auto_78718 ?auto_78723 ) ) ( not ( = ?auto_78719 ?auto_78723 ) ) ( not ( = ?auto_78720 ?auto_78723 ) ) ( not ( = ?auto_78721 ?auto_78723 ) ) ( not ( = ?auto_78722 ?auto_78723 ) ) ( ON ?auto_78721 ?auto_78722 ) ( ON-TABLE ?auto_78723 ) ( ON ?auto_78720 ?auto_78721 ) ( ON ?auto_78719 ?auto_78720 ) ( ON ?auto_78718 ?auto_78719 ) ( ON ?auto_78717 ?auto_78718 ) ( CLEAR ?auto_78717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78723 ?auto_78722 ?auto_78721 ?auto_78720 ?auto_78719 ?auto_78718 )
      ( MAKE-6PILE ?auto_78717 ?auto_78718 ?auto_78719 ?auto_78720 ?auto_78721 ?auto_78722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78730 - BLOCK
      ?auto_78731 - BLOCK
      ?auto_78732 - BLOCK
      ?auto_78733 - BLOCK
      ?auto_78734 - BLOCK
      ?auto_78735 - BLOCK
    )
    :vars
    (
      ?auto_78736 - BLOCK
      ?auto_78737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78730 ?auto_78731 ) ) ( not ( = ?auto_78730 ?auto_78732 ) ) ( not ( = ?auto_78730 ?auto_78733 ) ) ( not ( = ?auto_78730 ?auto_78734 ) ) ( not ( = ?auto_78730 ?auto_78735 ) ) ( not ( = ?auto_78731 ?auto_78732 ) ) ( not ( = ?auto_78731 ?auto_78733 ) ) ( not ( = ?auto_78731 ?auto_78734 ) ) ( not ( = ?auto_78731 ?auto_78735 ) ) ( not ( = ?auto_78732 ?auto_78733 ) ) ( not ( = ?auto_78732 ?auto_78734 ) ) ( not ( = ?auto_78732 ?auto_78735 ) ) ( not ( = ?auto_78733 ?auto_78734 ) ) ( not ( = ?auto_78733 ?auto_78735 ) ) ( not ( = ?auto_78734 ?auto_78735 ) ) ( ON ?auto_78735 ?auto_78736 ) ( not ( = ?auto_78730 ?auto_78736 ) ) ( not ( = ?auto_78731 ?auto_78736 ) ) ( not ( = ?auto_78732 ?auto_78736 ) ) ( not ( = ?auto_78733 ?auto_78736 ) ) ( not ( = ?auto_78734 ?auto_78736 ) ) ( not ( = ?auto_78735 ?auto_78736 ) ) ( ON ?auto_78734 ?auto_78735 ) ( ON-TABLE ?auto_78736 ) ( ON ?auto_78733 ?auto_78734 ) ( ON ?auto_78732 ?auto_78733 ) ( ON ?auto_78731 ?auto_78732 ) ( CLEAR ?auto_78731 ) ( ON ?auto_78730 ?auto_78737 ) ( CLEAR ?auto_78730 ) ( HAND-EMPTY ) ( not ( = ?auto_78730 ?auto_78737 ) ) ( not ( = ?auto_78731 ?auto_78737 ) ) ( not ( = ?auto_78732 ?auto_78737 ) ) ( not ( = ?auto_78733 ?auto_78737 ) ) ( not ( = ?auto_78734 ?auto_78737 ) ) ( not ( = ?auto_78735 ?auto_78737 ) ) ( not ( = ?auto_78736 ?auto_78737 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78730 ?auto_78737 )
      ( MAKE-6PILE ?auto_78730 ?auto_78731 ?auto_78732 ?auto_78733 ?auto_78734 ?auto_78735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78738 - BLOCK
      ?auto_78739 - BLOCK
      ?auto_78740 - BLOCK
      ?auto_78741 - BLOCK
      ?auto_78742 - BLOCK
      ?auto_78743 - BLOCK
    )
    :vars
    (
      ?auto_78745 - BLOCK
      ?auto_78744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78738 ?auto_78739 ) ) ( not ( = ?auto_78738 ?auto_78740 ) ) ( not ( = ?auto_78738 ?auto_78741 ) ) ( not ( = ?auto_78738 ?auto_78742 ) ) ( not ( = ?auto_78738 ?auto_78743 ) ) ( not ( = ?auto_78739 ?auto_78740 ) ) ( not ( = ?auto_78739 ?auto_78741 ) ) ( not ( = ?auto_78739 ?auto_78742 ) ) ( not ( = ?auto_78739 ?auto_78743 ) ) ( not ( = ?auto_78740 ?auto_78741 ) ) ( not ( = ?auto_78740 ?auto_78742 ) ) ( not ( = ?auto_78740 ?auto_78743 ) ) ( not ( = ?auto_78741 ?auto_78742 ) ) ( not ( = ?auto_78741 ?auto_78743 ) ) ( not ( = ?auto_78742 ?auto_78743 ) ) ( ON ?auto_78743 ?auto_78745 ) ( not ( = ?auto_78738 ?auto_78745 ) ) ( not ( = ?auto_78739 ?auto_78745 ) ) ( not ( = ?auto_78740 ?auto_78745 ) ) ( not ( = ?auto_78741 ?auto_78745 ) ) ( not ( = ?auto_78742 ?auto_78745 ) ) ( not ( = ?auto_78743 ?auto_78745 ) ) ( ON ?auto_78742 ?auto_78743 ) ( ON-TABLE ?auto_78745 ) ( ON ?auto_78741 ?auto_78742 ) ( ON ?auto_78740 ?auto_78741 ) ( ON ?auto_78738 ?auto_78744 ) ( CLEAR ?auto_78738 ) ( not ( = ?auto_78738 ?auto_78744 ) ) ( not ( = ?auto_78739 ?auto_78744 ) ) ( not ( = ?auto_78740 ?auto_78744 ) ) ( not ( = ?auto_78741 ?auto_78744 ) ) ( not ( = ?auto_78742 ?auto_78744 ) ) ( not ( = ?auto_78743 ?auto_78744 ) ) ( not ( = ?auto_78745 ?auto_78744 ) ) ( HOLDING ?auto_78739 ) ( CLEAR ?auto_78740 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78745 ?auto_78743 ?auto_78742 ?auto_78741 ?auto_78740 ?auto_78739 )
      ( MAKE-6PILE ?auto_78738 ?auto_78739 ?auto_78740 ?auto_78741 ?auto_78742 ?auto_78743 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78746 - BLOCK
      ?auto_78747 - BLOCK
      ?auto_78748 - BLOCK
      ?auto_78749 - BLOCK
      ?auto_78750 - BLOCK
      ?auto_78751 - BLOCK
    )
    :vars
    (
      ?auto_78753 - BLOCK
      ?auto_78752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78746 ?auto_78747 ) ) ( not ( = ?auto_78746 ?auto_78748 ) ) ( not ( = ?auto_78746 ?auto_78749 ) ) ( not ( = ?auto_78746 ?auto_78750 ) ) ( not ( = ?auto_78746 ?auto_78751 ) ) ( not ( = ?auto_78747 ?auto_78748 ) ) ( not ( = ?auto_78747 ?auto_78749 ) ) ( not ( = ?auto_78747 ?auto_78750 ) ) ( not ( = ?auto_78747 ?auto_78751 ) ) ( not ( = ?auto_78748 ?auto_78749 ) ) ( not ( = ?auto_78748 ?auto_78750 ) ) ( not ( = ?auto_78748 ?auto_78751 ) ) ( not ( = ?auto_78749 ?auto_78750 ) ) ( not ( = ?auto_78749 ?auto_78751 ) ) ( not ( = ?auto_78750 ?auto_78751 ) ) ( ON ?auto_78751 ?auto_78753 ) ( not ( = ?auto_78746 ?auto_78753 ) ) ( not ( = ?auto_78747 ?auto_78753 ) ) ( not ( = ?auto_78748 ?auto_78753 ) ) ( not ( = ?auto_78749 ?auto_78753 ) ) ( not ( = ?auto_78750 ?auto_78753 ) ) ( not ( = ?auto_78751 ?auto_78753 ) ) ( ON ?auto_78750 ?auto_78751 ) ( ON-TABLE ?auto_78753 ) ( ON ?auto_78749 ?auto_78750 ) ( ON ?auto_78748 ?auto_78749 ) ( ON ?auto_78746 ?auto_78752 ) ( not ( = ?auto_78746 ?auto_78752 ) ) ( not ( = ?auto_78747 ?auto_78752 ) ) ( not ( = ?auto_78748 ?auto_78752 ) ) ( not ( = ?auto_78749 ?auto_78752 ) ) ( not ( = ?auto_78750 ?auto_78752 ) ) ( not ( = ?auto_78751 ?auto_78752 ) ) ( not ( = ?auto_78753 ?auto_78752 ) ) ( CLEAR ?auto_78748 ) ( ON ?auto_78747 ?auto_78746 ) ( CLEAR ?auto_78747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78752 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78752 ?auto_78746 )
      ( MAKE-6PILE ?auto_78746 ?auto_78747 ?auto_78748 ?auto_78749 ?auto_78750 ?auto_78751 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78754 - BLOCK
      ?auto_78755 - BLOCK
      ?auto_78756 - BLOCK
      ?auto_78757 - BLOCK
      ?auto_78758 - BLOCK
      ?auto_78759 - BLOCK
    )
    :vars
    (
      ?auto_78760 - BLOCK
      ?auto_78761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78754 ?auto_78755 ) ) ( not ( = ?auto_78754 ?auto_78756 ) ) ( not ( = ?auto_78754 ?auto_78757 ) ) ( not ( = ?auto_78754 ?auto_78758 ) ) ( not ( = ?auto_78754 ?auto_78759 ) ) ( not ( = ?auto_78755 ?auto_78756 ) ) ( not ( = ?auto_78755 ?auto_78757 ) ) ( not ( = ?auto_78755 ?auto_78758 ) ) ( not ( = ?auto_78755 ?auto_78759 ) ) ( not ( = ?auto_78756 ?auto_78757 ) ) ( not ( = ?auto_78756 ?auto_78758 ) ) ( not ( = ?auto_78756 ?auto_78759 ) ) ( not ( = ?auto_78757 ?auto_78758 ) ) ( not ( = ?auto_78757 ?auto_78759 ) ) ( not ( = ?auto_78758 ?auto_78759 ) ) ( ON ?auto_78759 ?auto_78760 ) ( not ( = ?auto_78754 ?auto_78760 ) ) ( not ( = ?auto_78755 ?auto_78760 ) ) ( not ( = ?auto_78756 ?auto_78760 ) ) ( not ( = ?auto_78757 ?auto_78760 ) ) ( not ( = ?auto_78758 ?auto_78760 ) ) ( not ( = ?auto_78759 ?auto_78760 ) ) ( ON ?auto_78758 ?auto_78759 ) ( ON-TABLE ?auto_78760 ) ( ON ?auto_78757 ?auto_78758 ) ( ON ?auto_78754 ?auto_78761 ) ( not ( = ?auto_78754 ?auto_78761 ) ) ( not ( = ?auto_78755 ?auto_78761 ) ) ( not ( = ?auto_78756 ?auto_78761 ) ) ( not ( = ?auto_78757 ?auto_78761 ) ) ( not ( = ?auto_78758 ?auto_78761 ) ) ( not ( = ?auto_78759 ?auto_78761 ) ) ( not ( = ?auto_78760 ?auto_78761 ) ) ( ON ?auto_78755 ?auto_78754 ) ( CLEAR ?auto_78755 ) ( ON-TABLE ?auto_78761 ) ( HOLDING ?auto_78756 ) ( CLEAR ?auto_78757 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78760 ?auto_78759 ?auto_78758 ?auto_78757 ?auto_78756 )
      ( MAKE-6PILE ?auto_78754 ?auto_78755 ?auto_78756 ?auto_78757 ?auto_78758 ?auto_78759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78762 - BLOCK
      ?auto_78763 - BLOCK
      ?auto_78764 - BLOCK
      ?auto_78765 - BLOCK
      ?auto_78766 - BLOCK
      ?auto_78767 - BLOCK
    )
    :vars
    (
      ?auto_78769 - BLOCK
      ?auto_78768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78762 ?auto_78763 ) ) ( not ( = ?auto_78762 ?auto_78764 ) ) ( not ( = ?auto_78762 ?auto_78765 ) ) ( not ( = ?auto_78762 ?auto_78766 ) ) ( not ( = ?auto_78762 ?auto_78767 ) ) ( not ( = ?auto_78763 ?auto_78764 ) ) ( not ( = ?auto_78763 ?auto_78765 ) ) ( not ( = ?auto_78763 ?auto_78766 ) ) ( not ( = ?auto_78763 ?auto_78767 ) ) ( not ( = ?auto_78764 ?auto_78765 ) ) ( not ( = ?auto_78764 ?auto_78766 ) ) ( not ( = ?auto_78764 ?auto_78767 ) ) ( not ( = ?auto_78765 ?auto_78766 ) ) ( not ( = ?auto_78765 ?auto_78767 ) ) ( not ( = ?auto_78766 ?auto_78767 ) ) ( ON ?auto_78767 ?auto_78769 ) ( not ( = ?auto_78762 ?auto_78769 ) ) ( not ( = ?auto_78763 ?auto_78769 ) ) ( not ( = ?auto_78764 ?auto_78769 ) ) ( not ( = ?auto_78765 ?auto_78769 ) ) ( not ( = ?auto_78766 ?auto_78769 ) ) ( not ( = ?auto_78767 ?auto_78769 ) ) ( ON ?auto_78766 ?auto_78767 ) ( ON-TABLE ?auto_78769 ) ( ON ?auto_78765 ?auto_78766 ) ( ON ?auto_78762 ?auto_78768 ) ( not ( = ?auto_78762 ?auto_78768 ) ) ( not ( = ?auto_78763 ?auto_78768 ) ) ( not ( = ?auto_78764 ?auto_78768 ) ) ( not ( = ?auto_78765 ?auto_78768 ) ) ( not ( = ?auto_78766 ?auto_78768 ) ) ( not ( = ?auto_78767 ?auto_78768 ) ) ( not ( = ?auto_78769 ?auto_78768 ) ) ( ON ?auto_78763 ?auto_78762 ) ( ON-TABLE ?auto_78768 ) ( CLEAR ?auto_78765 ) ( ON ?auto_78764 ?auto_78763 ) ( CLEAR ?auto_78764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78768 ?auto_78762 ?auto_78763 )
      ( MAKE-6PILE ?auto_78762 ?auto_78763 ?auto_78764 ?auto_78765 ?auto_78766 ?auto_78767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78770 - BLOCK
      ?auto_78771 - BLOCK
      ?auto_78772 - BLOCK
      ?auto_78773 - BLOCK
      ?auto_78774 - BLOCK
      ?auto_78775 - BLOCK
    )
    :vars
    (
      ?auto_78777 - BLOCK
      ?auto_78776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78770 ?auto_78771 ) ) ( not ( = ?auto_78770 ?auto_78772 ) ) ( not ( = ?auto_78770 ?auto_78773 ) ) ( not ( = ?auto_78770 ?auto_78774 ) ) ( not ( = ?auto_78770 ?auto_78775 ) ) ( not ( = ?auto_78771 ?auto_78772 ) ) ( not ( = ?auto_78771 ?auto_78773 ) ) ( not ( = ?auto_78771 ?auto_78774 ) ) ( not ( = ?auto_78771 ?auto_78775 ) ) ( not ( = ?auto_78772 ?auto_78773 ) ) ( not ( = ?auto_78772 ?auto_78774 ) ) ( not ( = ?auto_78772 ?auto_78775 ) ) ( not ( = ?auto_78773 ?auto_78774 ) ) ( not ( = ?auto_78773 ?auto_78775 ) ) ( not ( = ?auto_78774 ?auto_78775 ) ) ( ON ?auto_78775 ?auto_78777 ) ( not ( = ?auto_78770 ?auto_78777 ) ) ( not ( = ?auto_78771 ?auto_78777 ) ) ( not ( = ?auto_78772 ?auto_78777 ) ) ( not ( = ?auto_78773 ?auto_78777 ) ) ( not ( = ?auto_78774 ?auto_78777 ) ) ( not ( = ?auto_78775 ?auto_78777 ) ) ( ON ?auto_78774 ?auto_78775 ) ( ON-TABLE ?auto_78777 ) ( ON ?auto_78770 ?auto_78776 ) ( not ( = ?auto_78770 ?auto_78776 ) ) ( not ( = ?auto_78771 ?auto_78776 ) ) ( not ( = ?auto_78772 ?auto_78776 ) ) ( not ( = ?auto_78773 ?auto_78776 ) ) ( not ( = ?auto_78774 ?auto_78776 ) ) ( not ( = ?auto_78775 ?auto_78776 ) ) ( not ( = ?auto_78777 ?auto_78776 ) ) ( ON ?auto_78771 ?auto_78770 ) ( ON-TABLE ?auto_78776 ) ( ON ?auto_78772 ?auto_78771 ) ( CLEAR ?auto_78772 ) ( HOLDING ?auto_78773 ) ( CLEAR ?auto_78774 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78777 ?auto_78775 ?auto_78774 ?auto_78773 )
      ( MAKE-6PILE ?auto_78770 ?auto_78771 ?auto_78772 ?auto_78773 ?auto_78774 ?auto_78775 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78778 - BLOCK
      ?auto_78779 - BLOCK
      ?auto_78780 - BLOCK
      ?auto_78781 - BLOCK
      ?auto_78782 - BLOCK
      ?auto_78783 - BLOCK
    )
    :vars
    (
      ?auto_78785 - BLOCK
      ?auto_78784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78778 ?auto_78779 ) ) ( not ( = ?auto_78778 ?auto_78780 ) ) ( not ( = ?auto_78778 ?auto_78781 ) ) ( not ( = ?auto_78778 ?auto_78782 ) ) ( not ( = ?auto_78778 ?auto_78783 ) ) ( not ( = ?auto_78779 ?auto_78780 ) ) ( not ( = ?auto_78779 ?auto_78781 ) ) ( not ( = ?auto_78779 ?auto_78782 ) ) ( not ( = ?auto_78779 ?auto_78783 ) ) ( not ( = ?auto_78780 ?auto_78781 ) ) ( not ( = ?auto_78780 ?auto_78782 ) ) ( not ( = ?auto_78780 ?auto_78783 ) ) ( not ( = ?auto_78781 ?auto_78782 ) ) ( not ( = ?auto_78781 ?auto_78783 ) ) ( not ( = ?auto_78782 ?auto_78783 ) ) ( ON ?auto_78783 ?auto_78785 ) ( not ( = ?auto_78778 ?auto_78785 ) ) ( not ( = ?auto_78779 ?auto_78785 ) ) ( not ( = ?auto_78780 ?auto_78785 ) ) ( not ( = ?auto_78781 ?auto_78785 ) ) ( not ( = ?auto_78782 ?auto_78785 ) ) ( not ( = ?auto_78783 ?auto_78785 ) ) ( ON ?auto_78782 ?auto_78783 ) ( ON-TABLE ?auto_78785 ) ( ON ?auto_78778 ?auto_78784 ) ( not ( = ?auto_78778 ?auto_78784 ) ) ( not ( = ?auto_78779 ?auto_78784 ) ) ( not ( = ?auto_78780 ?auto_78784 ) ) ( not ( = ?auto_78781 ?auto_78784 ) ) ( not ( = ?auto_78782 ?auto_78784 ) ) ( not ( = ?auto_78783 ?auto_78784 ) ) ( not ( = ?auto_78785 ?auto_78784 ) ) ( ON ?auto_78779 ?auto_78778 ) ( ON-TABLE ?auto_78784 ) ( ON ?auto_78780 ?auto_78779 ) ( CLEAR ?auto_78782 ) ( ON ?auto_78781 ?auto_78780 ) ( CLEAR ?auto_78781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78784 ?auto_78778 ?auto_78779 ?auto_78780 )
      ( MAKE-6PILE ?auto_78778 ?auto_78779 ?auto_78780 ?auto_78781 ?auto_78782 ?auto_78783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78786 - BLOCK
      ?auto_78787 - BLOCK
      ?auto_78788 - BLOCK
      ?auto_78789 - BLOCK
      ?auto_78790 - BLOCK
      ?auto_78791 - BLOCK
    )
    :vars
    (
      ?auto_78793 - BLOCK
      ?auto_78792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78786 ?auto_78787 ) ) ( not ( = ?auto_78786 ?auto_78788 ) ) ( not ( = ?auto_78786 ?auto_78789 ) ) ( not ( = ?auto_78786 ?auto_78790 ) ) ( not ( = ?auto_78786 ?auto_78791 ) ) ( not ( = ?auto_78787 ?auto_78788 ) ) ( not ( = ?auto_78787 ?auto_78789 ) ) ( not ( = ?auto_78787 ?auto_78790 ) ) ( not ( = ?auto_78787 ?auto_78791 ) ) ( not ( = ?auto_78788 ?auto_78789 ) ) ( not ( = ?auto_78788 ?auto_78790 ) ) ( not ( = ?auto_78788 ?auto_78791 ) ) ( not ( = ?auto_78789 ?auto_78790 ) ) ( not ( = ?auto_78789 ?auto_78791 ) ) ( not ( = ?auto_78790 ?auto_78791 ) ) ( ON ?auto_78791 ?auto_78793 ) ( not ( = ?auto_78786 ?auto_78793 ) ) ( not ( = ?auto_78787 ?auto_78793 ) ) ( not ( = ?auto_78788 ?auto_78793 ) ) ( not ( = ?auto_78789 ?auto_78793 ) ) ( not ( = ?auto_78790 ?auto_78793 ) ) ( not ( = ?auto_78791 ?auto_78793 ) ) ( ON-TABLE ?auto_78793 ) ( ON ?auto_78786 ?auto_78792 ) ( not ( = ?auto_78786 ?auto_78792 ) ) ( not ( = ?auto_78787 ?auto_78792 ) ) ( not ( = ?auto_78788 ?auto_78792 ) ) ( not ( = ?auto_78789 ?auto_78792 ) ) ( not ( = ?auto_78790 ?auto_78792 ) ) ( not ( = ?auto_78791 ?auto_78792 ) ) ( not ( = ?auto_78793 ?auto_78792 ) ) ( ON ?auto_78787 ?auto_78786 ) ( ON-TABLE ?auto_78792 ) ( ON ?auto_78788 ?auto_78787 ) ( ON ?auto_78789 ?auto_78788 ) ( CLEAR ?auto_78789 ) ( HOLDING ?auto_78790 ) ( CLEAR ?auto_78791 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78793 ?auto_78791 ?auto_78790 )
      ( MAKE-6PILE ?auto_78786 ?auto_78787 ?auto_78788 ?auto_78789 ?auto_78790 ?auto_78791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78794 - BLOCK
      ?auto_78795 - BLOCK
      ?auto_78796 - BLOCK
      ?auto_78797 - BLOCK
      ?auto_78798 - BLOCK
      ?auto_78799 - BLOCK
    )
    :vars
    (
      ?auto_78800 - BLOCK
      ?auto_78801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78794 ?auto_78795 ) ) ( not ( = ?auto_78794 ?auto_78796 ) ) ( not ( = ?auto_78794 ?auto_78797 ) ) ( not ( = ?auto_78794 ?auto_78798 ) ) ( not ( = ?auto_78794 ?auto_78799 ) ) ( not ( = ?auto_78795 ?auto_78796 ) ) ( not ( = ?auto_78795 ?auto_78797 ) ) ( not ( = ?auto_78795 ?auto_78798 ) ) ( not ( = ?auto_78795 ?auto_78799 ) ) ( not ( = ?auto_78796 ?auto_78797 ) ) ( not ( = ?auto_78796 ?auto_78798 ) ) ( not ( = ?auto_78796 ?auto_78799 ) ) ( not ( = ?auto_78797 ?auto_78798 ) ) ( not ( = ?auto_78797 ?auto_78799 ) ) ( not ( = ?auto_78798 ?auto_78799 ) ) ( ON ?auto_78799 ?auto_78800 ) ( not ( = ?auto_78794 ?auto_78800 ) ) ( not ( = ?auto_78795 ?auto_78800 ) ) ( not ( = ?auto_78796 ?auto_78800 ) ) ( not ( = ?auto_78797 ?auto_78800 ) ) ( not ( = ?auto_78798 ?auto_78800 ) ) ( not ( = ?auto_78799 ?auto_78800 ) ) ( ON-TABLE ?auto_78800 ) ( ON ?auto_78794 ?auto_78801 ) ( not ( = ?auto_78794 ?auto_78801 ) ) ( not ( = ?auto_78795 ?auto_78801 ) ) ( not ( = ?auto_78796 ?auto_78801 ) ) ( not ( = ?auto_78797 ?auto_78801 ) ) ( not ( = ?auto_78798 ?auto_78801 ) ) ( not ( = ?auto_78799 ?auto_78801 ) ) ( not ( = ?auto_78800 ?auto_78801 ) ) ( ON ?auto_78795 ?auto_78794 ) ( ON-TABLE ?auto_78801 ) ( ON ?auto_78796 ?auto_78795 ) ( ON ?auto_78797 ?auto_78796 ) ( CLEAR ?auto_78799 ) ( ON ?auto_78798 ?auto_78797 ) ( CLEAR ?auto_78798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78801 ?auto_78794 ?auto_78795 ?auto_78796 ?auto_78797 )
      ( MAKE-6PILE ?auto_78794 ?auto_78795 ?auto_78796 ?auto_78797 ?auto_78798 ?auto_78799 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78802 - BLOCK
      ?auto_78803 - BLOCK
      ?auto_78804 - BLOCK
      ?auto_78805 - BLOCK
      ?auto_78806 - BLOCK
      ?auto_78807 - BLOCK
    )
    :vars
    (
      ?auto_78808 - BLOCK
      ?auto_78809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78802 ?auto_78803 ) ) ( not ( = ?auto_78802 ?auto_78804 ) ) ( not ( = ?auto_78802 ?auto_78805 ) ) ( not ( = ?auto_78802 ?auto_78806 ) ) ( not ( = ?auto_78802 ?auto_78807 ) ) ( not ( = ?auto_78803 ?auto_78804 ) ) ( not ( = ?auto_78803 ?auto_78805 ) ) ( not ( = ?auto_78803 ?auto_78806 ) ) ( not ( = ?auto_78803 ?auto_78807 ) ) ( not ( = ?auto_78804 ?auto_78805 ) ) ( not ( = ?auto_78804 ?auto_78806 ) ) ( not ( = ?auto_78804 ?auto_78807 ) ) ( not ( = ?auto_78805 ?auto_78806 ) ) ( not ( = ?auto_78805 ?auto_78807 ) ) ( not ( = ?auto_78806 ?auto_78807 ) ) ( not ( = ?auto_78802 ?auto_78808 ) ) ( not ( = ?auto_78803 ?auto_78808 ) ) ( not ( = ?auto_78804 ?auto_78808 ) ) ( not ( = ?auto_78805 ?auto_78808 ) ) ( not ( = ?auto_78806 ?auto_78808 ) ) ( not ( = ?auto_78807 ?auto_78808 ) ) ( ON-TABLE ?auto_78808 ) ( ON ?auto_78802 ?auto_78809 ) ( not ( = ?auto_78802 ?auto_78809 ) ) ( not ( = ?auto_78803 ?auto_78809 ) ) ( not ( = ?auto_78804 ?auto_78809 ) ) ( not ( = ?auto_78805 ?auto_78809 ) ) ( not ( = ?auto_78806 ?auto_78809 ) ) ( not ( = ?auto_78807 ?auto_78809 ) ) ( not ( = ?auto_78808 ?auto_78809 ) ) ( ON ?auto_78803 ?auto_78802 ) ( ON-TABLE ?auto_78809 ) ( ON ?auto_78804 ?auto_78803 ) ( ON ?auto_78805 ?auto_78804 ) ( ON ?auto_78806 ?auto_78805 ) ( CLEAR ?auto_78806 ) ( HOLDING ?auto_78807 ) ( CLEAR ?auto_78808 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78808 ?auto_78807 )
      ( MAKE-6PILE ?auto_78802 ?auto_78803 ?auto_78804 ?auto_78805 ?auto_78806 ?auto_78807 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78810 - BLOCK
      ?auto_78811 - BLOCK
      ?auto_78812 - BLOCK
      ?auto_78813 - BLOCK
      ?auto_78814 - BLOCK
      ?auto_78815 - BLOCK
    )
    :vars
    (
      ?auto_78817 - BLOCK
      ?auto_78816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78810 ?auto_78811 ) ) ( not ( = ?auto_78810 ?auto_78812 ) ) ( not ( = ?auto_78810 ?auto_78813 ) ) ( not ( = ?auto_78810 ?auto_78814 ) ) ( not ( = ?auto_78810 ?auto_78815 ) ) ( not ( = ?auto_78811 ?auto_78812 ) ) ( not ( = ?auto_78811 ?auto_78813 ) ) ( not ( = ?auto_78811 ?auto_78814 ) ) ( not ( = ?auto_78811 ?auto_78815 ) ) ( not ( = ?auto_78812 ?auto_78813 ) ) ( not ( = ?auto_78812 ?auto_78814 ) ) ( not ( = ?auto_78812 ?auto_78815 ) ) ( not ( = ?auto_78813 ?auto_78814 ) ) ( not ( = ?auto_78813 ?auto_78815 ) ) ( not ( = ?auto_78814 ?auto_78815 ) ) ( not ( = ?auto_78810 ?auto_78817 ) ) ( not ( = ?auto_78811 ?auto_78817 ) ) ( not ( = ?auto_78812 ?auto_78817 ) ) ( not ( = ?auto_78813 ?auto_78817 ) ) ( not ( = ?auto_78814 ?auto_78817 ) ) ( not ( = ?auto_78815 ?auto_78817 ) ) ( ON-TABLE ?auto_78817 ) ( ON ?auto_78810 ?auto_78816 ) ( not ( = ?auto_78810 ?auto_78816 ) ) ( not ( = ?auto_78811 ?auto_78816 ) ) ( not ( = ?auto_78812 ?auto_78816 ) ) ( not ( = ?auto_78813 ?auto_78816 ) ) ( not ( = ?auto_78814 ?auto_78816 ) ) ( not ( = ?auto_78815 ?auto_78816 ) ) ( not ( = ?auto_78817 ?auto_78816 ) ) ( ON ?auto_78811 ?auto_78810 ) ( ON-TABLE ?auto_78816 ) ( ON ?auto_78812 ?auto_78811 ) ( ON ?auto_78813 ?auto_78812 ) ( ON ?auto_78814 ?auto_78813 ) ( CLEAR ?auto_78817 ) ( ON ?auto_78815 ?auto_78814 ) ( CLEAR ?auto_78815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78816 ?auto_78810 ?auto_78811 ?auto_78812 ?auto_78813 ?auto_78814 )
      ( MAKE-6PILE ?auto_78810 ?auto_78811 ?auto_78812 ?auto_78813 ?auto_78814 ?auto_78815 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78818 - BLOCK
      ?auto_78819 - BLOCK
      ?auto_78820 - BLOCK
      ?auto_78821 - BLOCK
      ?auto_78822 - BLOCK
      ?auto_78823 - BLOCK
    )
    :vars
    (
      ?auto_78824 - BLOCK
      ?auto_78825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78818 ?auto_78819 ) ) ( not ( = ?auto_78818 ?auto_78820 ) ) ( not ( = ?auto_78818 ?auto_78821 ) ) ( not ( = ?auto_78818 ?auto_78822 ) ) ( not ( = ?auto_78818 ?auto_78823 ) ) ( not ( = ?auto_78819 ?auto_78820 ) ) ( not ( = ?auto_78819 ?auto_78821 ) ) ( not ( = ?auto_78819 ?auto_78822 ) ) ( not ( = ?auto_78819 ?auto_78823 ) ) ( not ( = ?auto_78820 ?auto_78821 ) ) ( not ( = ?auto_78820 ?auto_78822 ) ) ( not ( = ?auto_78820 ?auto_78823 ) ) ( not ( = ?auto_78821 ?auto_78822 ) ) ( not ( = ?auto_78821 ?auto_78823 ) ) ( not ( = ?auto_78822 ?auto_78823 ) ) ( not ( = ?auto_78818 ?auto_78824 ) ) ( not ( = ?auto_78819 ?auto_78824 ) ) ( not ( = ?auto_78820 ?auto_78824 ) ) ( not ( = ?auto_78821 ?auto_78824 ) ) ( not ( = ?auto_78822 ?auto_78824 ) ) ( not ( = ?auto_78823 ?auto_78824 ) ) ( ON ?auto_78818 ?auto_78825 ) ( not ( = ?auto_78818 ?auto_78825 ) ) ( not ( = ?auto_78819 ?auto_78825 ) ) ( not ( = ?auto_78820 ?auto_78825 ) ) ( not ( = ?auto_78821 ?auto_78825 ) ) ( not ( = ?auto_78822 ?auto_78825 ) ) ( not ( = ?auto_78823 ?auto_78825 ) ) ( not ( = ?auto_78824 ?auto_78825 ) ) ( ON ?auto_78819 ?auto_78818 ) ( ON-TABLE ?auto_78825 ) ( ON ?auto_78820 ?auto_78819 ) ( ON ?auto_78821 ?auto_78820 ) ( ON ?auto_78822 ?auto_78821 ) ( ON ?auto_78823 ?auto_78822 ) ( CLEAR ?auto_78823 ) ( HOLDING ?auto_78824 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78824 )
      ( MAKE-6PILE ?auto_78818 ?auto_78819 ?auto_78820 ?auto_78821 ?auto_78822 ?auto_78823 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78826 - BLOCK
      ?auto_78827 - BLOCK
      ?auto_78828 - BLOCK
      ?auto_78829 - BLOCK
      ?auto_78830 - BLOCK
      ?auto_78831 - BLOCK
    )
    :vars
    (
      ?auto_78833 - BLOCK
      ?auto_78832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78826 ?auto_78827 ) ) ( not ( = ?auto_78826 ?auto_78828 ) ) ( not ( = ?auto_78826 ?auto_78829 ) ) ( not ( = ?auto_78826 ?auto_78830 ) ) ( not ( = ?auto_78826 ?auto_78831 ) ) ( not ( = ?auto_78827 ?auto_78828 ) ) ( not ( = ?auto_78827 ?auto_78829 ) ) ( not ( = ?auto_78827 ?auto_78830 ) ) ( not ( = ?auto_78827 ?auto_78831 ) ) ( not ( = ?auto_78828 ?auto_78829 ) ) ( not ( = ?auto_78828 ?auto_78830 ) ) ( not ( = ?auto_78828 ?auto_78831 ) ) ( not ( = ?auto_78829 ?auto_78830 ) ) ( not ( = ?auto_78829 ?auto_78831 ) ) ( not ( = ?auto_78830 ?auto_78831 ) ) ( not ( = ?auto_78826 ?auto_78833 ) ) ( not ( = ?auto_78827 ?auto_78833 ) ) ( not ( = ?auto_78828 ?auto_78833 ) ) ( not ( = ?auto_78829 ?auto_78833 ) ) ( not ( = ?auto_78830 ?auto_78833 ) ) ( not ( = ?auto_78831 ?auto_78833 ) ) ( ON ?auto_78826 ?auto_78832 ) ( not ( = ?auto_78826 ?auto_78832 ) ) ( not ( = ?auto_78827 ?auto_78832 ) ) ( not ( = ?auto_78828 ?auto_78832 ) ) ( not ( = ?auto_78829 ?auto_78832 ) ) ( not ( = ?auto_78830 ?auto_78832 ) ) ( not ( = ?auto_78831 ?auto_78832 ) ) ( not ( = ?auto_78833 ?auto_78832 ) ) ( ON ?auto_78827 ?auto_78826 ) ( ON-TABLE ?auto_78832 ) ( ON ?auto_78828 ?auto_78827 ) ( ON ?auto_78829 ?auto_78828 ) ( ON ?auto_78830 ?auto_78829 ) ( ON ?auto_78831 ?auto_78830 ) ( ON ?auto_78833 ?auto_78831 ) ( CLEAR ?auto_78833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78832 ?auto_78826 ?auto_78827 ?auto_78828 ?auto_78829 ?auto_78830 ?auto_78831 )
      ( MAKE-6PILE ?auto_78826 ?auto_78827 ?auto_78828 ?auto_78829 ?auto_78830 ?auto_78831 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78848 - BLOCK
      ?auto_78849 - BLOCK
      ?auto_78850 - BLOCK
      ?auto_78851 - BLOCK
      ?auto_78852 - BLOCK
      ?auto_78853 - BLOCK
      ?auto_78854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78853 ) ( ON-TABLE ?auto_78848 ) ( ON ?auto_78849 ?auto_78848 ) ( ON ?auto_78850 ?auto_78849 ) ( ON ?auto_78851 ?auto_78850 ) ( ON ?auto_78852 ?auto_78851 ) ( ON ?auto_78853 ?auto_78852 ) ( not ( = ?auto_78848 ?auto_78849 ) ) ( not ( = ?auto_78848 ?auto_78850 ) ) ( not ( = ?auto_78848 ?auto_78851 ) ) ( not ( = ?auto_78848 ?auto_78852 ) ) ( not ( = ?auto_78848 ?auto_78853 ) ) ( not ( = ?auto_78848 ?auto_78854 ) ) ( not ( = ?auto_78849 ?auto_78850 ) ) ( not ( = ?auto_78849 ?auto_78851 ) ) ( not ( = ?auto_78849 ?auto_78852 ) ) ( not ( = ?auto_78849 ?auto_78853 ) ) ( not ( = ?auto_78849 ?auto_78854 ) ) ( not ( = ?auto_78850 ?auto_78851 ) ) ( not ( = ?auto_78850 ?auto_78852 ) ) ( not ( = ?auto_78850 ?auto_78853 ) ) ( not ( = ?auto_78850 ?auto_78854 ) ) ( not ( = ?auto_78851 ?auto_78852 ) ) ( not ( = ?auto_78851 ?auto_78853 ) ) ( not ( = ?auto_78851 ?auto_78854 ) ) ( not ( = ?auto_78852 ?auto_78853 ) ) ( not ( = ?auto_78852 ?auto_78854 ) ) ( not ( = ?auto_78853 ?auto_78854 ) ) ( ON-TABLE ?auto_78854 ) ( CLEAR ?auto_78854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_78854 )
      ( MAKE-7PILE ?auto_78848 ?auto_78849 ?auto_78850 ?auto_78851 ?auto_78852 ?auto_78853 ?auto_78854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78855 - BLOCK
      ?auto_78856 - BLOCK
      ?auto_78857 - BLOCK
      ?auto_78858 - BLOCK
      ?auto_78859 - BLOCK
      ?auto_78860 - BLOCK
      ?auto_78861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78855 ) ( ON ?auto_78856 ?auto_78855 ) ( ON ?auto_78857 ?auto_78856 ) ( ON ?auto_78858 ?auto_78857 ) ( ON ?auto_78859 ?auto_78858 ) ( not ( = ?auto_78855 ?auto_78856 ) ) ( not ( = ?auto_78855 ?auto_78857 ) ) ( not ( = ?auto_78855 ?auto_78858 ) ) ( not ( = ?auto_78855 ?auto_78859 ) ) ( not ( = ?auto_78855 ?auto_78860 ) ) ( not ( = ?auto_78855 ?auto_78861 ) ) ( not ( = ?auto_78856 ?auto_78857 ) ) ( not ( = ?auto_78856 ?auto_78858 ) ) ( not ( = ?auto_78856 ?auto_78859 ) ) ( not ( = ?auto_78856 ?auto_78860 ) ) ( not ( = ?auto_78856 ?auto_78861 ) ) ( not ( = ?auto_78857 ?auto_78858 ) ) ( not ( = ?auto_78857 ?auto_78859 ) ) ( not ( = ?auto_78857 ?auto_78860 ) ) ( not ( = ?auto_78857 ?auto_78861 ) ) ( not ( = ?auto_78858 ?auto_78859 ) ) ( not ( = ?auto_78858 ?auto_78860 ) ) ( not ( = ?auto_78858 ?auto_78861 ) ) ( not ( = ?auto_78859 ?auto_78860 ) ) ( not ( = ?auto_78859 ?auto_78861 ) ) ( not ( = ?auto_78860 ?auto_78861 ) ) ( ON-TABLE ?auto_78861 ) ( CLEAR ?auto_78861 ) ( HOLDING ?auto_78860 ) ( CLEAR ?auto_78859 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78855 ?auto_78856 ?auto_78857 ?auto_78858 ?auto_78859 ?auto_78860 )
      ( MAKE-7PILE ?auto_78855 ?auto_78856 ?auto_78857 ?auto_78858 ?auto_78859 ?auto_78860 ?auto_78861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78862 - BLOCK
      ?auto_78863 - BLOCK
      ?auto_78864 - BLOCK
      ?auto_78865 - BLOCK
      ?auto_78866 - BLOCK
      ?auto_78867 - BLOCK
      ?auto_78868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78862 ) ( ON ?auto_78863 ?auto_78862 ) ( ON ?auto_78864 ?auto_78863 ) ( ON ?auto_78865 ?auto_78864 ) ( ON ?auto_78866 ?auto_78865 ) ( not ( = ?auto_78862 ?auto_78863 ) ) ( not ( = ?auto_78862 ?auto_78864 ) ) ( not ( = ?auto_78862 ?auto_78865 ) ) ( not ( = ?auto_78862 ?auto_78866 ) ) ( not ( = ?auto_78862 ?auto_78867 ) ) ( not ( = ?auto_78862 ?auto_78868 ) ) ( not ( = ?auto_78863 ?auto_78864 ) ) ( not ( = ?auto_78863 ?auto_78865 ) ) ( not ( = ?auto_78863 ?auto_78866 ) ) ( not ( = ?auto_78863 ?auto_78867 ) ) ( not ( = ?auto_78863 ?auto_78868 ) ) ( not ( = ?auto_78864 ?auto_78865 ) ) ( not ( = ?auto_78864 ?auto_78866 ) ) ( not ( = ?auto_78864 ?auto_78867 ) ) ( not ( = ?auto_78864 ?auto_78868 ) ) ( not ( = ?auto_78865 ?auto_78866 ) ) ( not ( = ?auto_78865 ?auto_78867 ) ) ( not ( = ?auto_78865 ?auto_78868 ) ) ( not ( = ?auto_78866 ?auto_78867 ) ) ( not ( = ?auto_78866 ?auto_78868 ) ) ( not ( = ?auto_78867 ?auto_78868 ) ) ( ON-TABLE ?auto_78868 ) ( CLEAR ?auto_78866 ) ( ON ?auto_78867 ?auto_78868 ) ( CLEAR ?auto_78867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78868 )
      ( MAKE-7PILE ?auto_78862 ?auto_78863 ?auto_78864 ?auto_78865 ?auto_78866 ?auto_78867 ?auto_78868 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78869 - BLOCK
      ?auto_78870 - BLOCK
      ?auto_78871 - BLOCK
      ?auto_78872 - BLOCK
      ?auto_78873 - BLOCK
      ?auto_78874 - BLOCK
      ?auto_78875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78869 ) ( ON ?auto_78870 ?auto_78869 ) ( ON ?auto_78871 ?auto_78870 ) ( ON ?auto_78872 ?auto_78871 ) ( not ( = ?auto_78869 ?auto_78870 ) ) ( not ( = ?auto_78869 ?auto_78871 ) ) ( not ( = ?auto_78869 ?auto_78872 ) ) ( not ( = ?auto_78869 ?auto_78873 ) ) ( not ( = ?auto_78869 ?auto_78874 ) ) ( not ( = ?auto_78869 ?auto_78875 ) ) ( not ( = ?auto_78870 ?auto_78871 ) ) ( not ( = ?auto_78870 ?auto_78872 ) ) ( not ( = ?auto_78870 ?auto_78873 ) ) ( not ( = ?auto_78870 ?auto_78874 ) ) ( not ( = ?auto_78870 ?auto_78875 ) ) ( not ( = ?auto_78871 ?auto_78872 ) ) ( not ( = ?auto_78871 ?auto_78873 ) ) ( not ( = ?auto_78871 ?auto_78874 ) ) ( not ( = ?auto_78871 ?auto_78875 ) ) ( not ( = ?auto_78872 ?auto_78873 ) ) ( not ( = ?auto_78872 ?auto_78874 ) ) ( not ( = ?auto_78872 ?auto_78875 ) ) ( not ( = ?auto_78873 ?auto_78874 ) ) ( not ( = ?auto_78873 ?auto_78875 ) ) ( not ( = ?auto_78874 ?auto_78875 ) ) ( ON-TABLE ?auto_78875 ) ( ON ?auto_78874 ?auto_78875 ) ( CLEAR ?auto_78874 ) ( HOLDING ?auto_78873 ) ( CLEAR ?auto_78872 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78869 ?auto_78870 ?auto_78871 ?auto_78872 ?auto_78873 )
      ( MAKE-7PILE ?auto_78869 ?auto_78870 ?auto_78871 ?auto_78872 ?auto_78873 ?auto_78874 ?auto_78875 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78876 - BLOCK
      ?auto_78877 - BLOCK
      ?auto_78878 - BLOCK
      ?auto_78879 - BLOCK
      ?auto_78880 - BLOCK
      ?auto_78881 - BLOCK
      ?auto_78882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78876 ) ( ON ?auto_78877 ?auto_78876 ) ( ON ?auto_78878 ?auto_78877 ) ( ON ?auto_78879 ?auto_78878 ) ( not ( = ?auto_78876 ?auto_78877 ) ) ( not ( = ?auto_78876 ?auto_78878 ) ) ( not ( = ?auto_78876 ?auto_78879 ) ) ( not ( = ?auto_78876 ?auto_78880 ) ) ( not ( = ?auto_78876 ?auto_78881 ) ) ( not ( = ?auto_78876 ?auto_78882 ) ) ( not ( = ?auto_78877 ?auto_78878 ) ) ( not ( = ?auto_78877 ?auto_78879 ) ) ( not ( = ?auto_78877 ?auto_78880 ) ) ( not ( = ?auto_78877 ?auto_78881 ) ) ( not ( = ?auto_78877 ?auto_78882 ) ) ( not ( = ?auto_78878 ?auto_78879 ) ) ( not ( = ?auto_78878 ?auto_78880 ) ) ( not ( = ?auto_78878 ?auto_78881 ) ) ( not ( = ?auto_78878 ?auto_78882 ) ) ( not ( = ?auto_78879 ?auto_78880 ) ) ( not ( = ?auto_78879 ?auto_78881 ) ) ( not ( = ?auto_78879 ?auto_78882 ) ) ( not ( = ?auto_78880 ?auto_78881 ) ) ( not ( = ?auto_78880 ?auto_78882 ) ) ( not ( = ?auto_78881 ?auto_78882 ) ) ( ON-TABLE ?auto_78882 ) ( ON ?auto_78881 ?auto_78882 ) ( CLEAR ?auto_78879 ) ( ON ?auto_78880 ?auto_78881 ) ( CLEAR ?auto_78880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78882 ?auto_78881 )
      ( MAKE-7PILE ?auto_78876 ?auto_78877 ?auto_78878 ?auto_78879 ?auto_78880 ?auto_78881 ?auto_78882 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78883 - BLOCK
      ?auto_78884 - BLOCK
      ?auto_78885 - BLOCK
      ?auto_78886 - BLOCK
      ?auto_78887 - BLOCK
      ?auto_78888 - BLOCK
      ?auto_78889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78883 ) ( ON ?auto_78884 ?auto_78883 ) ( ON ?auto_78885 ?auto_78884 ) ( not ( = ?auto_78883 ?auto_78884 ) ) ( not ( = ?auto_78883 ?auto_78885 ) ) ( not ( = ?auto_78883 ?auto_78886 ) ) ( not ( = ?auto_78883 ?auto_78887 ) ) ( not ( = ?auto_78883 ?auto_78888 ) ) ( not ( = ?auto_78883 ?auto_78889 ) ) ( not ( = ?auto_78884 ?auto_78885 ) ) ( not ( = ?auto_78884 ?auto_78886 ) ) ( not ( = ?auto_78884 ?auto_78887 ) ) ( not ( = ?auto_78884 ?auto_78888 ) ) ( not ( = ?auto_78884 ?auto_78889 ) ) ( not ( = ?auto_78885 ?auto_78886 ) ) ( not ( = ?auto_78885 ?auto_78887 ) ) ( not ( = ?auto_78885 ?auto_78888 ) ) ( not ( = ?auto_78885 ?auto_78889 ) ) ( not ( = ?auto_78886 ?auto_78887 ) ) ( not ( = ?auto_78886 ?auto_78888 ) ) ( not ( = ?auto_78886 ?auto_78889 ) ) ( not ( = ?auto_78887 ?auto_78888 ) ) ( not ( = ?auto_78887 ?auto_78889 ) ) ( not ( = ?auto_78888 ?auto_78889 ) ) ( ON-TABLE ?auto_78889 ) ( ON ?auto_78888 ?auto_78889 ) ( ON ?auto_78887 ?auto_78888 ) ( CLEAR ?auto_78887 ) ( HOLDING ?auto_78886 ) ( CLEAR ?auto_78885 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78883 ?auto_78884 ?auto_78885 ?auto_78886 )
      ( MAKE-7PILE ?auto_78883 ?auto_78884 ?auto_78885 ?auto_78886 ?auto_78887 ?auto_78888 ?auto_78889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78890 - BLOCK
      ?auto_78891 - BLOCK
      ?auto_78892 - BLOCK
      ?auto_78893 - BLOCK
      ?auto_78894 - BLOCK
      ?auto_78895 - BLOCK
      ?auto_78896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78890 ) ( ON ?auto_78891 ?auto_78890 ) ( ON ?auto_78892 ?auto_78891 ) ( not ( = ?auto_78890 ?auto_78891 ) ) ( not ( = ?auto_78890 ?auto_78892 ) ) ( not ( = ?auto_78890 ?auto_78893 ) ) ( not ( = ?auto_78890 ?auto_78894 ) ) ( not ( = ?auto_78890 ?auto_78895 ) ) ( not ( = ?auto_78890 ?auto_78896 ) ) ( not ( = ?auto_78891 ?auto_78892 ) ) ( not ( = ?auto_78891 ?auto_78893 ) ) ( not ( = ?auto_78891 ?auto_78894 ) ) ( not ( = ?auto_78891 ?auto_78895 ) ) ( not ( = ?auto_78891 ?auto_78896 ) ) ( not ( = ?auto_78892 ?auto_78893 ) ) ( not ( = ?auto_78892 ?auto_78894 ) ) ( not ( = ?auto_78892 ?auto_78895 ) ) ( not ( = ?auto_78892 ?auto_78896 ) ) ( not ( = ?auto_78893 ?auto_78894 ) ) ( not ( = ?auto_78893 ?auto_78895 ) ) ( not ( = ?auto_78893 ?auto_78896 ) ) ( not ( = ?auto_78894 ?auto_78895 ) ) ( not ( = ?auto_78894 ?auto_78896 ) ) ( not ( = ?auto_78895 ?auto_78896 ) ) ( ON-TABLE ?auto_78896 ) ( ON ?auto_78895 ?auto_78896 ) ( ON ?auto_78894 ?auto_78895 ) ( CLEAR ?auto_78892 ) ( ON ?auto_78893 ?auto_78894 ) ( CLEAR ?auto_78893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78896 ?auto_78895 ?auto_78894 )
      ( MAKE-7PILE ?auto_78890 ?auto_78891 ?auto_78892 ?auto_78893 ?auto_78894 ?auto_78895 ?auto_78896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78897 - BLOCK
      ?auto_78898 - BLOCK
      ?auto_78899 - BLOCK
      ?auto_78900 - BLOCK
      ?auto_78901 - BLOCK
      ?auto_78902 - BLOCK
      ?auto_78903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78897 ) ( ON ?auto_78898 ?auto_78897 ) ( not ( = ?auto_78897 ?auto_78898 ) ) ( not ( = ?auto_78897 ?auto_78899 ) ) ( not ( = ?auto_78897 ?auto_78900 ) ) ( not ( = ?auto_78897 ?auto_78901 ) ) ( not ( = ?auto_78897 ?auto_78902 ) ) ( not ( = ?auto_78897 ?auto_78903 ) ) ( not ( = ?auto_78898 ?auto_78899 ) ) ( not ( = ?auto_78898 ?auto_78900 ) ) ( not ( = ?auto_78898 ?auto_78901 ) ) ( not ( = ?auto_78898 ?auto_78902 ) ) ( not ( = ?auto_78898 ?auto_78903 ) ) ( not ( = ?auto_78899 ?auto_78900 ) ) ( not ( = ?auto_78899 ?auto_78901 ) ) ( not ( = ?auto_78899 ?auto_78902 ) ) ( not ( = ?auto_78899 ?auto_78903 ) ) ( not ( = ?auto_78900 ?auto_78901 ) ) ( not ( = ?auto_78900 ?auto_78902 ) ) ( not ( = ?auto_78900 ?auto_78903 ) ) ( not ( = ?auto_78901 ?auto_78902 ) ) ( not ( = ?auto_78901 ?auto_78903 ) ) ( not ( = ?auto_78902 ?auto_78903 ) ) ( ON-TABLE ?auto_78903 ) ( ON ?auto_78902 ?auto_78903 ) ( ON ?auto_78901 ?auto_78902 ) ( ON ?auto_78900 ?auto_78901 ) ( CLEAR ?auto_78900 ) ( HOLDING ?auto_78899 ) ( CLEAR ?auto_78898 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78897 ?auto_78898 ?auto_78899 )
      ( MAKE-7PILE ?auto_78897 ?auto_78898 ?auto_78899 ?auto_78900 ?auto_78901 ?auto_78902 ?auto_78903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78904 - BLOCK
      ?auto_78905 - BLOCK
      ?auto_78906 - BLOCK
      ?auto_78907 - BLOCK
      ?auto_78908 - BLOCK
      ?auto_78909 - BLOCK
      ?auto_78910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78904 ) ( ON ?auto_78905 ?auto_78904 ) ( not ( = ?auto_78904 ?auto_78905 ) ) ( not ( = ?auto_78904 ?auto_78906 ) ) ( not ( = ?auto_78904 ?auto_78907 ) ) ( not ( = ?auto_78904 ?auto_78908 ) ) ( not ( = ?auto_78904 ?auto_78909 ) ) ( not ( = ?auto_78904 ?auto_78910 ) ) ( not ( = ?auto_78905 ?auto_78906 ) ) ( not ( = ?auto_78905 ?auto_78907 ) ) ( not ( = ?auto_78905 ?auto_78908 ) ) ( not ( = ?auto_78905 ?auto_78909 ) ) ( not ( = ?auto_78905 ?auto_78910 ) ) ( not ( = ?auto_78906 ?auto_78907 ) ) ( not ( = ?auto_78906 ?auto_78908 ) ) ( not ( = ?auto_78906 ?auto_78909 ) ) ( not ( = ?auto_78906 ?auto_78910 ) ) ( not ( = ?auto_78907 ?auto_78908 ) ) ( not ( = ?auto_78907 ?auto_78909 ) ) ( not ( = ?auto_78907 ?auto_78910 ) ) ( not ( = ?auto_78908 ?auto_78909 ) ) ( not ( = ?auto_78908 ?auto_78910 ) ) ( not ( = ?auto_78909 ?auto_78910 ) ) ( ON-TABLE ?auto_78910 ) ( ON ?auto_78909 ?auto_78910 ) ( ON ?auto_78908 ?auto_78909 ) ( ON ?auto_78907 ?auto_78908 ) ( CLEAR ?auto_78905 ) ( ON ?auto_78906 ?auto_78907 ) ( CLEAR ?auto_78906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78910 ?auto_78909 ?auto_78908 ?auto_78907 )
      ( MAKE-7PILE ?auto_78904 ?auto_78905 ?auto_78906 ?auto_78907 ?auto_78908 ?auto_78909 ?auto_78910 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78911 - BLOCK
      ?auto_78912 - BLOCK
      ?auto_78913 - BLOCK
      ?auto_78914 - BLOCK
      ?auto_78915 - BLOCK
      ?auto_78916 - BLOCK
      ?auto_78917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78911 ) ( not ( = ?auto_78911 ?auto_78912 ) ) ( not ( = ?auto_78911 ?auto_78913 ) ) ( not ( = ?auto_78911 ?auto_78914 ) ) ( not ( = ?auto_78911 ?auto_78915 ) ) ( not ( = ?auto_78911 ?auto_78916 ) ) ( not ( = ?auto_78911 ?auto_78917 ) ) ( not ( = ?auto_78912 ?auto_78913 ) ) ( not ( = ?auto_78912 ?auto_78914 ) ) ( not ( = ?auto_78912 ?auto_78915 ) ) ( not ( = ?auto_78912 ?auto_78916 ) ) ( not ( = ?auto_78912 ?auto_78917 ) ) ( not ( = ?auto_78913 ?auto_78914 ) ) ( not ( = ?auto_78913 ?auto_78915 ) ) ( not ( = ?auto_78913 ?auto_78916 ) ) ( not ( = ?auto_78913 ?auto_78917 ) ) ( not ( = ?auto_78914 ?auto_78915 ) ) ( not ( = ?auto_78914 ?auto_78916 ) ) ( not ( = ?auto_78914 ?auto_78917 ) ) ( not ( = ?auto_78915 ?auto_78916 ) ) ( not ( = ?auto_78915 ?auto_78917 ) ) ( not ( = ?auto_78916 ?auto_78917 ) ) ( ON-TABLE ?auto_78917 ) ( ON ?auto_78916 ?auto_78917 ) ( ON ?auto_78915 ?auto_78916 ) ( ON ?auto_78914 ?auto_78915 ) ( ON ?auto_78913 ?auto_78914 ) ( CLEAR ?auto_78913 ) ( HOLDING ?auto_78912 ) ( CLEAR ?auto_78911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78911 ?auto_78912 )
      ( MAKE-7PILE ?auto_78911 ?auto_78912 ?auto_78913 ?auto_78914 ?auto_78915 ?auto_78916 ?auto_78917 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78918 - BLOCK
      ?auto_78919 - BLOCK
      ?auto_78920 - BLOCK
      ?auto_78921 - BLOCK
      ?auto_78922 - BLOCK
      ?auto_78923 - BLOCK
      ?auto_78924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78918 ) ( not ( = ?auto_78918 ?auto_78919 ) ) ( not ( = ?auto_78918 ?auto_78920 ) ) ( not ( = ?auto_78918 ?auto_78921 ) ) ( not ( = ?auto_78918 ?auto_78922 ) ) ( not ( = ?auto_78918 ?auto_78923 ) ) ( not ( = ?auto_78918 ?auto_78924 ) ) ( not ( = ?auto_78919 ?auto_78920 ) ) ( not ( = ?auto_78919 ?auto_78921 ) ) ( not ( = ?auto_78919 ?auto_78922 ) ) ( not ( = ?auto_78919 ?auto_78923 ) ) ( not ( = ?auto_78919 ?auto_78924 ) ) ( not ( = ?auto_78920 ?auto_78921 ) ) ( not ( = ?auto_78920 ?auto_78922 ) ) ( not ( = ?auto_78920 ?auto_78923 ) ) ( not ( = ?auto_78920 ?auto_78924 ) ) ( not ( = ?auto_78921 ?auto_78922 ) ) ( not ( = ?auto_78921 ?auto_78923 ) ) ( not ( = ?auto_78921 ?auto_78924 ) ) ( not ( = ?auto_78922 ?auto_78923 ) ) ( not ( = ?auto_78922 ?auto_78924 ) ) ( not ( = ?auto_78923 ?auto_78924 ) ) ( ON-TABLE ?auto_78924 ) ( ON ?auto_78923 ?auto_78924 ) ( ON ?auto_78922 ?auto_78923 ) ( ON ?auto_78921 ?auto_78922 ) ( ON ?auto_78920 ?auto_78921 ) ( CLEAR ?auto_78918 ) ( ON ?auto_78919 ?auto_78920 ) ( CLEAR ?auto_78919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78924 ?auto_78923 ?auto_78922 ?auto_78921 ?auto_78920 )
      ( MAKE-7PILE ?auto_78918 ?auto_78919 ?auto_78920 ?auto_78921 ?auto_78922 ?auto_78923 ?auto_78924 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78925 - BLOCK
      ?auto_78926 - BLOCK
      ?auto_78927 - BLOCK
      ?auto_78928 - BLOCK
      ?auto_78929 - BLOCK
      ?auto_78930 - BLOCK
      ?auto_78931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78925 ?auto_78926 ) ) ( not ( = ?auto_78925 ?auto_78927 ) ) ( not ( = ?auto_78925 ?auto_78928 ) ) ( not ( = ?auto_78925 ?auto_78929 ) ) ( not ( = ?auto_78925 ?auto_78930 ) ) ( not ( = ?auto_78925 ?auto_78931 ) ) ( not ( = ?auto_78926 ?auto_78927 ) ) ( not ( = ?auto_78926 ?auto_78928 ) ) ( not ( = ?auto_78926 ?auto_78929 ) ) ( not ( = ?auto_78926 ?auto_78930 ) ) ( not ( = ?auto_78926 ?auto_78931 ) ) ( not ( = ?auto_78927 ?auto_78928 ) ) ( not ( = ?auto_78927 ?auto_78929 ) ) ( not ( = ?auto_78927 ?auto_78930 ) ) ( not ( = ?auto_78927 ?auto_78931 ) ) ( not ( = ?auto_78928 ?auto_78929 ) ) ( not ( = ?auto_78928 ?auto_78930 ) ) ( not ( = ?auto_78928 ?auto_78931 ) ) ( not ( = ?auto_78929 ?auto_78930 ) ) ( not ( = ?auto_78929 ?auto_78931 ) ) ( not ( = ?auto_78930 ?auto_78931 ) ) ( ON-TABLE ?auto_78931 ) ( ON ?auto_78930 ?auto_78931 ) ( ON ?auto_78929 ?auto_78930 ) ( ON ?auto_78928 ?auto_78929 ) ( ON ?auto_78927 ?auto_78928 ) ( ON ?auto_78926 ?auto_78927 ) ( CLEAR ?auto_78926 ) ( HOLDING ?auto_78925 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78925 )
      ( MAKE-7PILE ?auto_78925 ?auto_78926 ?auto_78927 ?auto_78928 ?auto_78929 ?auto_78930 ?auto_78931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78932 - BLOCK
      ?auto_78933 - BLOCK
      ?auto_78934 - BLOCK
      ?auto_78935 - BLOCK
      ?auto_78936 - BLOCK
      ?auto_78937 - BLOCK
      ?auto_78938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78932 ?auto_78933 ) ) ( not ( = ?auto_78932 ?auto_78934 ) ) ( not ( = ?auto_78932 ?auto_78935 ) ) ( not ( = ?auto_78932 ?auto_78936 ) ) ( not ( = ?auto_78932 ?auto_78937 ) ) ( not ( = ?auto_78932 ?auto_78938 ) ) ( not ( = ?auto_78933 ?auto_78934 ) ) ( not ( = ?auto_78933 ?auto_78935 ) ) ( not ( = ?auto_78933 ?auto_78936 ) ) ( not ( = ?auto_78933 ?auto_78937 ) ) ( not ( = ?auto_78933 ?auto_78938 ) ) ( not ( = ?auto_78934 ?auto_78935 ) ) ( not ( = ?auto_78934 ?auto_78936 ) ) ( not ( = ?auto_78934 ?auto_78937 ) ) ( not ( = ?auto_78934 ?auto_78938 ) ) ( not ( = ?auto_78935 ?auto_78936 ) ) ( not ( = ?auto_78935 ?auto_78937 ) ) ( not ( = ?auto_78935 ?auto_78938 ) ) ( not ( = ?auto_78936 ?auto_78937 ) ) ( not ( = ?auto_78936 ?auto_78938 ) ) ( not ( = ?auto_78937 ?auto_78938 ) ) ( ON-TABLE ?auto_78938 ) ( ON ?auto_78937 ?auto_78938 ) ( ON ?auto_78936 ?auto_78937 ) ( ON ?auto_78935 ?auto_78936 ) ( ON ?auto_78934 ?auto_78935 ) ( ON ?auto_78933 ?auto_78934 ) ( ON ?auto_78932 ?auto_78933 ) ( CLEAR ?auto_78932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78938 ?auto_78937 ?auto_78936 ?auto_78935 ?auto_78934 ?auto_78933 )
      ( MAKE-7PILE ?auto_78932 ?auto_78933 ?auto_78934 ?auto_78935 ?auto_78936 ?auto_78937 ?auto_78938 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78946 - BLOCK
      ?auto_78947 - BLOCK
      ?auto_78948 - BLOCK
      ?auto_78949 - BLOCK
      ?auto_78950 - BLOCK
      ?auto_78951 - BLOCK
      ?auto_78952 - BLOCK
    )
    :vars
    (
      ?auto_78953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78946 ?auto_78947 ) ) ( not ( = ?auto_78946 ?auto_78948 ) ) ( not ( = ?auto_78946 ?auto_78949 ) ) ( not ( = ?auto_78946 ?auto_78950 ) ) ( not ( = ?auto_78946 ?auto_78951 ) ) ( not ( = ?auto_78946 ?auto_78952 ) ) ( not ( = ?auto_78947 ?auto_78948 ) ) ( not ( = ?auto_78947 ?auto_78949 ) ) ( not ( = ?auto_78947 ?auto_78950 ) ) ( not ( = ?auto_78947 ?auto_78951 ) ) ( not ( = ?auto_78947 ?auto_78952 ) ) ( not ( = ?auto_78948 ?auto_78949 ) ) ( not ( = ?auto_78948 ?auto_78950 ) ) ( not ( = ?auto_78948 ?auto_78951 ) ) ( not ( = ?auto_78948 ?auto_78952 ) ) ( not ( = ?auto_78949 ?auto_78950 ) ) ( not ( = ?auto_78949 ?auto_78951 ) ) ( not ( = ?auto_78949 ?auto_78952 ) ) ( not ( = ?auto_78950 ?auto_78951 ) ) ( not ( = ?auto_78950 ?auto_78952 ) ) ( not ( = ?auto_78951 ?auto_78952 ) ) ( ON-TABLE ?auto_78952 ) ( ON ?auto_78951 ?auto_78952 ) ( ON ?auto_78950 ?auto_78951 ) ( ON ?auto_78949 ?auto_78950 ) ( ON ?auto_78948 ?auto_78949 ) ( ON ?auto_78947 ?auto_78948 ) ( CLEAR ?auto_78947 ) ( ON ?auto_78946 ?auto_78953 ) ( CLEAR ?auto_78946 ) ( HAND-EMPTY ) ( not ( = ?auto_78946 ?auto_78953 ) ) ( not ( = ?auto_78947 ?auto_78953 ) ) ( not ( = ?auto_78948 ?auto_78953 ) ) ( not ( = ?auto_78949 ?auto_78953 ) ) ( not ( = ?auto_78950 ?auto_78953 ) ) ( not ( = ?auto_78951 ?auto_78953 ) ) ( not ( = ?auto_78952 ?auto_78953 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78946 ?auto_78953 )
      ( MAKE-7PILE ?auto_78946 ?auto_78947 ?auto_78948 ?auto_78949 ?auto_78950 ?auto_78951 ?auto_78952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78954 - BLOCK
      ?auto_78955 - BLOCK
      ?auto_78956 - BLOCK
      ?auto_78957 - BLOCK
      ?auto_78958 - BLOCK
      ?auto_78959 - BLOCK
      ?auto_78960 - BLOCK
    )
    :vars
    (
      ?auto_78961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78954 ?auto_78955 ) ) ( not ( = ?auto_78954 ?auto_78956 ) ) ( not ( = ?auto_78954 ?auto_78957 ) ) ( not ( = ?auto_78954 ?auto_78958 ) ) ( not ( = ?auto_78954 ?auto_78959 ) ) ( not ( = ?auto_78954 ?auto_78960 ) ) ( not ( = ?auto_78955 ?auto_78956 ) ) ( not ( = ?auto_78955 ?auto_78957 ) ) ( not ( = ?auto_78955 ?auto_78958 ) ) ( not ( = ?auto_78955 ?auto_78959 ) ) ( not ( = ?auto_78955 ?auto_78960 ) ) ( not ( = ?auto_78956 ?auto_78957 ) ) ( not ( = ?auto_78956 ?auto_78958 ) ) ( not ( = ?auto_78956 ?auto_78959 ) ) ( not ( = ?auto_78956 ?auto_78960 ) ) ( not ( = ?auto_78957 ?auto_78958 ) ) ( not ( = ?auto_78957 ?auto_78959 ) ) ( not ( = ?auto_78957 ?auto_78960 ) ) ( not ( = ?auto_78958 ?auto_78959 ) ) ( not ( = ?auto_78958 ?auto_78960 ) ) ( not ( = ?auto_78959 ?auto_78960 ) ) ( ON-TABLE ?auto_78960 ) ( ON ?auto_78959 ?auto_78960 ) ( ON ?auto_78958 ?auto_78959 ) ( ON ?auto_78957 ?auto_78958 ) ( ON ?auto_78956 ?auto_78957 ) ( ON ?auto_78954 ?auto_78961 ) ( CLEAR ?auto_78954 ) ( not ( = ?auto_78954 ?auto_78961 ) ) ( not ( = ?auto_78955 ?auto_78961 ) ) ( not ( = ?auto_78956 ?auto_78961 ) ) ( not ( = ?auto_78957 ?auto_78961 ) ) ( not ( = ?auto_78958 ?auto_78961 ) ) ( not ( = ?auto_78959 ?auto_78961 ) ) ( not ( = ?auto_78960 ?auto_78961 ) ) ( HOLDING ?auto_78955 ) ( CLEAR ?auto_78956 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78960 ?auto_78959 ?auto_78958 ?auto_78957 ?auto_78956 ?auto_78955 )
      ( MAKE-7PILE ?auto_78954 ?auto_78955 ?auto_78956 ?auto_78957 ?auto_78958 ?auto_78959 ?auto_78960 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78962 - BLOCK
      ?auto_78963 - BLOCK
      ?auto_78964 - BLOCK
      ?auto_78965 - BLOCK
      ?auto_78966 - BLOCK
      ?auto_78967 - BLOCK
      ?auto_78968 - BLOCK
    )
    :vars
    (
      ?auto_78969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78962 ?auto_78963 ) ) ( not ( = ?auto_78962 ?auto_78964 ) ) ( not ( = ?auto_78962 ?auto_78965 ) ) ( not ( = ?auto_78962 ?auto_78966 ) ) ( not ( = ?auto_78962 ?auto_78967 ) ) ( not ( = ?auto_78962 ?auto_78968 ) ) ( not ( = ?auto_78963 ?auto_78964 ) ) ( not ( = ?auto_78963 ?auto_78965 ) ) ( not ( = ?auto_78963 ?auto_78966 ) ) ( not ( = ?auto_78963 ?auto_78967 ) ) ( not ( = ?auto_78963 ?auto_78968 ) ) ( not ( = ?auto_78964 ?auto_78965 ) ) ( not ( = ?auto_78964 ?auto_78966 ) ) ( not ( = ?auto_78964 ?auto_78967 ) ) ( not ( = ?auto_78964 ?auto_78968 ) ) ( not ( = ?auto_78965 ?auto_78966 ) ) ( not ( = ?auto_78965 ?auto_78967 ) ) ( not ( = ?auto_78965 ?auto_78968 ) ) ( not ( = ?auto_78966 ?auto_78967 ) ) ( not ( = ?auto_78966 ?auto_78968 ) ) ( not ( = ?auto_78967 ?auto_78968 ) ) ( ON-TABLE ?auto_78968 ) ( ON ?auto_78967 ?auto_78968 ) ( ON ?auto_78966 ?auto_78967 ) ( ON ?auto_78965 ?auto_78966 ) ( ON ?auto_78964 ?auto_78965 ) ( ON ?auto_78962 ?auto_78969 ) ( not ( = ?auto_78962 ?auto_78969 ) ) ( not ( = ?auto_78963 ?auto_78969 ) ) ( not ( = ?auto_78964 ?auto_78969 ) ) ( not ( = ?auto_78965 ?auto_78969 ) ) ( not ( = ?auto_78966 ?auto_78969 ) ) ( not ( = ?auto_78967 ?auto_78969 ) ) ( not ( = ?auto_78968 ?auto_78969 ) ) ( CLEAR ?auto_78964 ) ( ON ?auto_78963 ?auto_78962 ) ( CLEAR ?auto_78963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78969 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78969 ?auto_78962 )
      ( MAKE-7PILE ?auto_78962 ?auto_78963 ?auto_78964 ?auto_78965 ?auto_78966 ?auto_78967 ?auto_78968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78970 - BLOCK
      ?auto_78971 - BLOCK
      ?auto_78972 - BLOCK
      ?auto_78973 - BLOCK
      ?auto_78974 - BLOCK
      ?auto_78975 - BLOCK
      ?auto_78976 - BLOCK
    )
    :vars
    (
      ?auto_78977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78970 ?auto_78971 ) ) ( not ( = ?auto_78970 ?auto_78972 ) ) ( not ( = ?auto_78970 ?auto_78973 ) ) ( not ( = ?auto_78970 ?auto_78974 ) ) ( not ( = ?auto_78970 ?auto_78975 ) ) ( not ( = ?auto_78970 ?auto_78976 ) ) ( not ( = ?auto_78971 ?auto_78972 ) ) ( not ( = ?auto_78971 ?auto_78973 ) ) ( not ( = ?auto_78971 ?auto_78974 ) ) ( not ( = ?auto_78971 ?auto_78975 ) ) ( not ( = ?auto_78971 ?auto_78976 ) ) ( not ( = ?auto_78972 ?auto_78973 ) ) ( not ( = ?auto_78972 ?auto_78974 ) ) ( not ( = ?auto_78972 ?auto_78975 ) ) ( not ( = ?auto_78972 ?auto_78976 ) ) ( not ( = ?auto_78973 ?auto_78974 ) ) ( not ( = ?auto_78973 ?auto_78975 ) ) ( not ( = ?auto_78973 ?auto_78976 ) ) ( not ( = ?auto_78974 ?auto_78975 ) ) ( not ( = ?auto_78974 ?auto_78976 ) ) ( not ( = ?auto_78975 ?auto_78976 ) ) ( ON-TABLE ?auto_78976 ) ( ON ?auto_78975 ?auto_78976 ) ( ON ?auto_78974 ?auto_78975 ) ( ON ?auto_78973 ?auto_78974 ) ( ON ?auto_78970 ?auto_78977 ) ( not ( = ?auto_78970 ?auto_78977 ) ) ( not ( = ?auto_78971 ?auto_78977 ) ) ( not ( = ?auto_78972 ?auto_78977 ) ) ( not ( = ?auto_78973 ?auto_78977 ) ) ( not ( = ?auto_78974 ?auto_78977 ) ) ( not ( = ?auto_78975 ?auto_78977 ) ) ( not ( = ?auto_78976 ?auto_78977 ) ) ( ON ?auto_78971 ?auto_78970 ) ( CLEAR ?auto_78971 ) ( ON-TABLE ?auto_78977 ) ( HOLDING ?auto_78972 ) ( CLEAR ?auto_78973 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78976 ?auto_78975 ?auto_78974 ?auto_78973 ?auto_78972 )
      ( MAKE-7PILE ?auto_78970 ?auto_78971 ?auto_78972 ?auto_78973 ?auto_78974 ?auto_78975 ?auto_78976 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78978 - BLOCK
      ?auto_78979 - BLOCK
      ?auto_78980 - BLOCK
      ?auto_78981 - BLOCK
      ?auto_78982 - BLOCK
      ?auto_78983 - BLOCK
      ?auto_78984 - BLOCK
    )
    :vars
    (
      ?auto_78985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78978 ?auto_78979 ) ) ( not ( = ?auto_78978 ?auto_78980 ) ) ( not ( = ?auto_78978 ?auto_78981 ) ) ( not ( = ?auto_78978 ?auto_78982 ) ) ( not ( = ?auto_78978 ?auto_78983 ) ) ( not ( = ?auto_78978 ?auto_78984 ) ) ( not ( = ?auto_78979 ?auto_78980 ) ) ( not ( = ?auto_78979 ?auto_78981 ) ) ( not ( = ?auto_78979 ?auto_78982 ) ) ( not ( = ?auto_78979 ?auto_78983 ) ) ( not ( = ?auto_78979 ?auto_78984 ) ) ( not ( = ?auto_78980 ?auto_78981 ) ) ( not ( = ?auto_78980 ?auto_78982 ) ) ( not ( = ?auto_78980 ?auto_78983 ) ) ( not ( = ?auto_78980 ?auto_78984 ) ) ( not ( = ?auto_78981 ?auto_78982 ) ) ( not ( = ?auto_78981 ?auto_78983 ) ) ( not ( = ?auto_78981 ?auto_78984 ) ) ( not ( = ?auto_78982 ?auto_78983 ) ) ( not ( = ?auto_78982 ?auto_78984 ) ) ( not ( = ?auto_78983 ?auto_78984 ) ) ( ON-TABLE ?auto_78984 ) ( ON ?auto_78983 ?auto_78984 ) ( ON ?auto_78982 ?auto_78983 ) ( ON ?auto_78981 ?auto_78982 ) ( ON ?auto_78978 ?auto_78985 ) ( not ( = ?auto_78978 ?auto_78985 ) ) ( not ( = ?auto_78979 ?auto_78985 ) ) ( not ( = ?auto_78980 ?auto_78985 ) ) ( not ( = ?auto_78981 ?auto_78985 ) ) ( not ( = ?auto_78982 ?auto_78985 ) ) ( not ( = ?auto_78983 ?auto_78985 ) ) ( not ( = ?auto_78984 ?auto_78985 ) ) ( ON ?auto_78979 ?auto_78978 ) ( ON-TABLE ?auto_78985 ) ( CLEAR ?auto_78981 ) ( ON ?auto_78980 ?auto_78979 ) ( CLEAR ?auto_78980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78985 ?auto_78978 ?auto_78979 )
      ( MAKE-7PILE ?auto_78978 ?auto_78979 ?auto_78980 ?auto_78981 ?auto_78982 ?auto_78983 ?auto_78984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78986 - BLOCK
      ?auto_78987 - BLOCK
      ?auto_78988 - BLOCK
      ?auto_78989 - BLOCK
      ?auto_78990 - BLOCK
      ?auto_78991 - BLOCK
      ?auto_78992 - BLOCK
    )
    :vars
    (
      ?auto_78993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78986 ?auto_78987 ) ) ( not ( = ?auto_78986 ?auto_78988 ) ) ( not ( = ?auto_78986 ?auto_78989 ) ) ( not ( = ?auto_78986 ?auto_78990 ) ) ( not ( = ?auto_78986 ?auto_78991 ) ) ( not ( = ?auto_78986 ?auto_78992 ) ) ( not ( = ?auto_78987 ?auto_78988 ) ) ( not ( = ?auto_78987 ?auto_78989 ) ) ( not ( = ?auto_78987 ?auto_78990 ) ) ( not ( = ?auto_78987 ?auto_78991 ) ) ( not ( = ?auto_78987 ?auto_78992 ) ) ( not ( = ?auto_78988 ?auto_78989 ) ) ( not ( = ?auto_78988 ?auto_78990 ) ) ( not ( = ?auto_78988 ?auto_78991 ) ) ( not ( = ?auto_78988 ?auto_78992 ) ) ( not ( = ?auto_78989 ?auto_78990 ) ) ( not ( = ?auto_78989 ?auto_78991 ) ) ( not ( = ?auto_78989 ?auto_78992 ) ) ( not ( = ?auto_78990 ?auto_78991 ) ) ( not ( = ?auto_78990 ?auto_78992 ) ) ( not ( = ?auto_78991 ?auto_78992 ) ) ( ON-TABLE ?auto_78992 ) ( ON ?auto_78991 ?auto_78992 ) ( ON ?auto_78990 ?auto_78991 ) ( ON ?auto_78986 ?auto_78993 ) ( not ( = ?auto_78986 ?auto_78993 ) ) ( not ( = ?auto_78987 ?auto_78993 ) ) ( not ( = ?auto_78988 ?auto_78993 ) ) ( not ( = ?auto_78989 ?auto_78993 ) ) ( not ( = ?auto_78990 ?auto_78993 ) ) ( not ( = ?auto_78991 ?auto_78993 ) ) ( not ( = ?auto_78992 ?auto_78993 ) ) ( ON ?auto_78987 ?auto_78986 ) ( ON-TABLE ?auto_78993 ) ( ON ?auto_78988 ?auto_78987 ) ( CLEAR ?auto_78988 ) ( HOLDING ?auto_78989 ) ( CLEAR ?auto_78990 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78992 ?auto_78991 ?auto_78990 ?auto_78989 )
      ( MAKE-7PILE ?auto_78986 ?auto_78987 ?auto_78988 ?auto_78989 ?auto_78990 ?auto_78991 ?auto_78992 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78994 - BLOCK
      ?auto_78995 - BLOCK
      ?auto_78996 - BLOCK
      ?auto_78997 - BLOCK
      ?auto_78998 - BLOCK
      ?auto_78999 - BLOCK
      ?auto_79000 - BLOCK
    )
    :vars
    (
      ?auto_79001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78994 ?auto_78995 ) ) ( not ( = ?auto_78994 ?auto_78996 ) ) ( not ( = ?auto_78994 ?auto_78997 ) ) ( not ( = ?auto_78994 ?auto_78998 ) ) ( not ( = ?auto_78994 ?auto_78999 ) ) ( not ( = ?auto_78994 ?auto_79000 ) ) ( not ( = ?auto_78995 ?auto_78996 ) ) ( not ( = ?auto_78995 ?auto_78997 ) ) ( not ( = ?auto_78995 ?auto_78998 ) ) ( not ( = ?auto_78995 ?auto_78999 ) ) ( not ( = ?auto_78995 ?auto_79000 ) ) ( not ( = ?auto_78996 ?auto_78997 ) ) ( not ( = ?auto_78996 ?auto_78998 ) ) ( not ( = ?auto_78996 ?auto_78999 ) ) ( not ( = ?auto_78996 ?auto_79000 ) ) ( not ( = ?auto_78997 ?auto_78998 ) ) ( not ( = ?auto_78997 ?auto_78999 ) ) ( not ( = ?auto_78997 ?auto_79000 ) ) ( not ( = ?auto_78998 ?auto_78999 ) ) ( not ( = ?auto_78998 ?auto_79000 ) ) ( not ( = ?auto_78999 ?auto_79000 ) ) ( ON-TABLE ?auto_79000 ) ( ON ?auto_78999 ?auto_79000 ) ( ON ?auto_78998 ?auto_78999 ) ( ON ?auto_78994 ?auto_79001 ) ( not ( = ?auto_78994 ?auto_79001 ) ) ( not ( = ?auto_78995 ?auto_79001 ) ) ( not ( = ?auto_78996 ?auto_79001 ) ) ( not ( = ?auto_78997 ?auto_79001 ) ) ( not ( = ?auto_78998 ?auto_79001 ) ) ( not ( = ?auto_78999 ?auto_79001 ) ) ( not ( = ?auto_79000 ?auto_79001 ) ) ( ON ?auto_78995 ?auto_78994 ) ( ON-TABLE ?auto_79001 ) ( ON ?auto_78996 ?auto_78995 ) ( CLEAR ?auto_78998 ) ( ON ?auto_78997 ?auto_78996 ) ( CLEAR ?auto_78997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79001 ?auto_78994 ?auto_78995 ?auto_78996 )
      ( MAKE-7PILE ?auto_78994 ?auto_78995 ?auto_78996 ?auto_78997 ?auto_78998 ?auto_78999 ?auto_79000 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79002 - BLOCK
      ?auto_79003 - BLOCK
      ?auto_79004 - BLOCK
      ?auto_79005 - BLOCK
      ?auto_79006 - BLOCK
      ?auto_79007 - BLOCK
      ?auto_79008 - BLOCK
    )
    :vars
    (
      ?auto_79009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79002 ?auto_79003 ) ) ( not ( = ?auto_79002 ?auto_79004 ) ) ( not ( = ?auto_79002 ?auto_79005 ) ) ( not ( = ?auto_79002 ?auto_79006 ) ) ( not ( = ?auto_79002 ?auto_79007 ) ) ( not ( = ?auto_79002 ?auto_79008 ) ) ( not ( = ?auto_79003 ?auto_79004 ) ) ( not ( = ?auto_79003 ?auto_79005 ) ) ( not ( = ?auto_79003 ?auto_79006 ) ) ( not ( = ?auto_79003 ?auto_79007 ) ) ( not ( = ?auto_79003 ?auto_79008 ) ) ( not ( = ?auto_79004 ?auto_79005 ) ) ( not ( = ?auto_79004 ?auto_79006 ) ) ( not ( = ?auto_79004 ?auto_79007 ) ) ( not ( = ?auto_79004 ?auto_79008 ) ) ( not ( = ?auto_79005 ?auto_79006 ) ) ( not ( = ?auto_79005 ?auto_79007 ) ) ( not ( = ?auto_79005 ?auto_79008 ) ) ( not ( = ?auto_79006 ?auto_79007 ) ) ( not ( = ?auto_79006 ?auto_79008 ) ) ( not ( = ?auto_79007 ?auto_79008 ) ) ( ON-TABLE ?auto_79008 ) ( ON ?auto_79007 ?auto_79008 ) ( ON ?auto_79002 ?auto_79009 ) ( not ( = ?auto_79002 ?auto_79009 ) ) ( not ( = ?auto_79003 ?auto_79009 ) ) ( not ( = ?auto_79004 ?auto_79009 ) ) ( not ( = ?auto_79005 ?auto_79009 ) ) ( not ( = ?auto_79006 ?auto_79009 ) ) ( not ( = ?auto_79007 ?auto_79009 ) ) ( not ( = ?auto_79008 ?auto_79009 ) ) ( ON ?auto_79003 ?auto_79002 ) ( ON-TABLE ?auto_79009 ) ( ON ?auto_79004 ?auto_79003 ) ( ON ?auto_79005 ?auto_79004 ) ( CLEAR ?auto_79005 ) ( HOLDING ?auto_79006 ) ( CLEAR ?auto_79007 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79008 ?auto_79007 ?auto_79006 )
      ( MAKE-7PILE ?auto_79002 ?auto_79003 ?auto_79004 ?auto_79005 ?auto_79006 ?auto_79007 ?auto_79008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79010 - BLOCK
      ?auto_79011 - BLOCK
      ?auto_79012 - BLOCK
      ?auto_79013 - BLOCK
      ?auto_79014 - BLOCK
      ?auto_79015 - BLOCK
      ?auto_79016 - BLOCK
    )
    :vars
    (
      ?auto_79017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79010 ?auto_79011 ) ) ( not ( = ?auto_79010 ?auto_79012 ) ) ( not ( = ?auto_79010 ?auto_79013 ) ) ( not ( = ?auto_79010 ?auto_79014 ) ) ( not ( = ?auto_79010 ?auto_79015 ) ) ( not ( = ?auto_79010 ?auto_79016 ) ) ( not ( = ?auto_79011 ?auto_79012 ) ) ( not ( = ?auto_79011 ?auto_79013 ) ) ( not ( = ?auto_79011 ?auto_79014 ) ) ( not ( = ?auto_79011 ?auto_79015 ) ) ( not ( = ?auto_79011 ?auto_79016 ) ) ( not ( = ?auto_79012 ?auto_79013 ) ) ( not ( = ?auto_79012 ?auto_79014 ) ) ( not ( = ?auto_79012 ?auto_79015 ) ) ( not ( = ?auto_79012 ?auto_79016 ) ) ( not ( = ?auto_79013 ?auto_79014 ) ) ( not ( = ?auto_79013 ?auto_79015 ) ) ( not ( = ?auto_79013 ?auto_79016 ) ) ( not ( = ?auto_79014 ?auto_79015 ) ) ( not ( = ?auto_79014 ?auto_79016 ) ) ( not ( = ?auto_79015 ?auto_79016 ) ) ( ON-TABLE ?auto_79016 ) ( ON ?auto_79015 ?auto_79016 ) ( ON ?auto_79010 ?auto_79017 ) ( not ( = ?auto_79010 ?auto_79017 ) ) ( not ( = ?auto_79011 ?auto_79017 ) ) ( not ( = ?auto_79012 ?auto_79017 ) ) ( not ( = ?auto_79013 ?auto_79017 ) ) ( not ( = ?auto_79014 ?auto_79017 ) ) ( not ( = ?auto_79015 ?auto_79017 ) ) ( not ( = ?auto_79016 ?auto_79017 ) ) ( ON ?auto_79011 ?auto_79010 ) ( ON-TABLE ?auto_79017 ) ( ON ?auto_79012 ?auto_79011 ) ( ON ?auto_79013 ?auto_79012 ) ( CLEAR ?auto_79015 ) ( ON ?auto_79014 ?auto_79013 ) ( CLEAR ?auto_79014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79017 ?auto_79010 ?auto_79011 ?auto_79012 ?auto_79013 )
      ( MAKE-7PILE ?auto_79010 ?auto_79011 ?auto_79012 ?auto_79013 ?auto_79014 ?auto_79015 ?auto_79016 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79018 - BLOCK
      ?auto_79019 - BLOCK
      ?auto_79020 - BLOCK
      ?auto_79021 - BLOCK
      ?auto_79022 - BLOCK
      ?auto_79023 - BLOCK
      ?auto_79024 - BLOCK
    )
    :vars
    (
      ?auto_79025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79018 ?auto_79019 ) ) ( not ( = ?auto_79018 ?auto_79020 ) ) ( not ( = ?auto_79018 ?auto_79021 ) ) ( not ( = ?auto_79018 ?auto_79022 ) ) ( not ( = ?auto_79018 ?auto_79023 ) ) ( not ( = ?auto_79018 ?auto_79024 ) ) ( not ( = ?auto_79019 ?auto_79020 ) ) ( not ( = ?auto_79019 ?auto_79021 ) ) ( not ( = ?auto_79019 ?auto_79022 ) ) ( not ( = ?auto_79019 ?auto_79023 ) ) ( not ( = ?auto_79019 ?auto_79024 ) ) ( not ( = ?auto_79020 ?auto_79021 ) ) ( not ( = ?auto_79020 ?auto_79022 ) ) ( not ( = ?auto_79020 ?auto_79023 ) ) ( not ( = ?auto_79020 ?auto_79024 ) ) ( not ( = ?auto_79021 ?auto_79022 ) ) ( not ( = ?auto_79021 ?auto_79023 ) ) ( not ( = ?auto_79021 ?auto_79024 ) ) ( not ( = ?auto_79022 ?auto_79023 ) ) ( not ( = ?auto_79022 ?auto_79024 ) ) ( not ( = ?auto_79023 ?auto_79024 ) ) ( ON-TABLE ?auto_79024 ) ( ON ?auto_79018 ?auto_79025 ) ( not ( = ?auto_79018 ?auto_79025 ) ) ( not ( = ?auto_79019 ?auto_79025 ) ) ( not ( = ?auto_79020 ?auto_79025 ) ) ( not ( = ?auto_79021 ?auto_79025 ) ) ( not ( = ?auto_79022 ?auto_79025 ) ) ( not ( = ?auto_79023 ?auto_79025 ) ) ( not ( = ?auto_79024 ?auto_79025 ) ) ( ON ?auto_79019 ?auto_79018 ) ( ON-TABLE ?auto_79025 ) ( ON ?auto_79020 ?auto_79019 ) ( ON ?auto_79021 ?auto_79020 ) ( ON ?auto_79022 ?auto_79021 ) ( CLEAR ?auto_79022 ) ( HOLDING ?auto_79023 ) ( CLEAR ?auto_79024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79024 ?auto_79023 )
      ( MAKE-7PILE ?auto_79018 ?auto_79019 ?auto_79020 ?auto_79021 ?auto_79022 ?auto_79023 ?auto_79024 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79026 - BLOCK
      ?auto_79027 - BLOCK
      ?auto_79028 - BLOCK
      ?auto_79029 - BLOCK
      ?auto_79030 - BLOCK
      ?auto_79031 - BLOCK
      ?auto_79032 - BLOCK
    )
    :vars
    (
      ?auto_79033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79026 ?auto_79027 ) ) ( not ( = ?auto_79026 ?auto_79028 ) ) ( not ( = ?auto_79026 ?auto_79029 ) ) ( not ( = ?auto_79026 ?auto_79030 ) ) ( not ( = ?auto_79026 ?auto_79031 ) ) ( not ( = ?auto_79026 ?auto_79032 ) ) ( not ( = ?auto_79027 ?auto_79028 ) ) ( not ( = ?auto_79027 ?auto_79029 ) ) ( not ( = ?auto_79027 ?auto_79030 ) ) ( not ( = ?auto_79027 ?auto_79031 ) ) ( not ( = ?auto_79027 ?auto_79032 ) ) ( not ( = ?auto_79028 ?auto_79029 ) ) ( not ( = ?auto_79028 ?auto_79030 ) ) ( not ( = ?auto_79028 ?auto_79031 ) ) ( not ( = ?auto_79028 ?auto_79032 ) ) ( not ( = ?auto_79029 ?auto_79030 ) ) ( not ( = ?auto_79029 ?auto_79031 ) ) ( not ( = ?auto_79029 ?auto_79032 ) ) ( not ( = ?auto_79030 ?auto_79031 ) ) ( not ( = ?auto_79030 ?auto_79032 ) ) ( not ( = ?auto_79031 ?auto_79032 ) ) ( ON-TABLE ?auto_79032 ) ( ON ?auto_79026 ?auto_79033 ) ( not ( = ?auto_79026 ?auto_79033 ) ) ( not ( = ?auto_79027 ?auto_79033 ) ) ( not ( = ?auto_79028 ?auto_79033 ) ) ( not ( = ?auto_79029 ?auto_79033 ) ) ( not ( = ?auto_79030 ?auto_79033 ) ) ( not ( = ?auto_79031 ?auto_79033 ) ) ( not ( = ?auto_79032 ?auto_79033 ) ) ( ON ?auto_79027 ?auto_79026 ) ( ON-TABLE ?auto_79033 ) ( ON ?auto_79028 ?auto_79027 ) ( ON ?auto_79029 ?auto_79028 ) ( ON ?auto_79030 ?auto_79029 ) ( CLEAR ?auto_79032 ) ( ON ?auto_79031 ?auto_79030 ) ( CLEAR ?auto_79031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79033 ?auto_79026 ?auto_79027 ?auto_79028 ?auto_79029 ?auto_79030 )
      ( MAKE-7PILE ?auto_79026 ?auto_79027 ?auto_79028 ?auto_79029 ?auto_79030 ?auto_79031 ?auto_79032 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79034 - BLOCK
      ?auto_79035 - BLOCK
      ?auto_79036 - BLOCK
      ?auto_79037 - BLOCK
      ?auto_79038 - BLOCK
      ?auto_79039 - BLOCK
      ?auto_79040 - BLOCK
    )
    :vars
    (
      ?auto_79041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79034 ?auto_79035 ) ) ( not ( = ?auto_79034 ?auto_79036 ) ) ( not ( = ?auto_79034 ?auto_79037 ) ) ( not ( = ?auto_79034 ?auto_79038 ) ) ( not ( = ?auto_79034 ?auto_79039 ) ) ( not ( = ?auto_79034 ?auto_79040 ) ) ( not ( = ?auto_79035 ?auto_79036 ) ) ( not ( = ?auto_79035 ?auto_79037 ) ) ( not ( = ?auto_79035 ?auto_79038 ) ) ( not ( = ?auto_79035 ?auto_79039 ) ) ( not ( = ?auto_79035 ?auto_79040 ) ) ( not ( = ?auto_79036 ?auto_79037 ) ) ( not ( = ?auto_79036 ?auto_79038 ) ) ( not ( = ?auto_79036 ?auto_79039 ) ) ( not ( = ?auto_79036 ?auto_79040 ) ) ( not ( = ?auto_79037 ?auto_79038 ) ) ( not ( = ?auto_79037 ?auto_79039 ) ) ( not ( = ?auto_79037 ?auto_79040 ) ) ( not ( = ?auto_79038 ?auto_79039 ) ) ( not ( = ?auto_79038 ?auto_79040 ) ) ( not ( = ?auto_79039 ?auto_79040 ) ) ( ON ?auto_79034 ?auto_79041 ) ( not ( = ?auto_79034 ?auto_79041 ) ) ( not ( = ?auto_79035 ?auto_79041 ) ) ( not ( = ?auto_79036 ?auto_79041 ) ) ( not ( = ?auto_79037 ?auto_79041 ) ) ( not ( = ?auto_79038 ?auto_79041 ) ) ( not ( = ?auto_79039 ?auto_79041 ) ) ( not ( = ?auto_79040 ?auto_79041 ) ) ( ON ?auto_79035 ?auto_79034 ) ( ON-TABLE ?auto_79041 ) ( ON ?auto_79036 ?auto_79035 ) ( ON ?auto_79037 ?auto_79036 ) ( ON ?auto_79038 ?auto_79037 ) ( ON ?auto_79039 ?auto_79038 ) ( CLEAR ?auto_79039 ) ( HOLDING ?auto_79040 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79040 )
      ( MAKE-7PILE ?auto_79034 ?auto_79035 ?auto_79036 ?auto_79037 ?auto_79038 ?auto_79039 ?auto_79040 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79042 - BLOCK
      ?auto_79043 - BLOCK
      ?auto_79044 - BLOCK
      ?auto_79045 - BLOCK
      ?auto_79046 - BLOCK
      ?auto_79047 - BLOCK
      ?auto_79048 - BLOCK
    )
    :vars
    (
      ?auto_79049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79042 ?auto_79043 ) ) ( not ( = ?auto_79042 ?auto_79044 ) ) ( not ( = ?auto_79042 ?auto_79045 ) ) ( not ( = ?auto_79042 ?auto_79046 ) ) ( not ( = ?auto_79042 ?auto_79047 ) ) ( not ( = ?auto_79042 ?auto_79048 ) ) ( not ( = ?auto_79043 ?auto_79044 ) ) ( not ( = ?auto_79043 ?auto_79045 ) ) ( not ( = ?auto_79043 ?auto_79046 ) ) ( not ( = ?auto_79043 ?auto_79047 ) ) ( not ( = ?auto_79043 ?auto_79048 ) ) ( not ( = ?auto_79044 ?auto_79045 ) ) ( not ( = ?auto_79044 ?auto_79046 ) ) ( not ( = ?auto_79044 ?auto_79047 ) ) ( not ( = ?auto_79044 ?auto_79048 ) ) ( not ( = ?auto_79045 ?auto_79046 ) ) ( not ( = ?auto_79045 ?auto_79047 ) ) ( not ( = ?auto_79045 ?auto_79048 ) ) ( not ( = ?auto_79046 ?auto_79047 ) ) ( not ( = ?auto_79046 ?auto_79048 ) ) ( not ( = ?auto_79047 ?auto_79048 ) ) ( ON ?auto_79042 ?auto_79049 ) ( not ( = ?auto_79042 ?auto_79049 ) ) ( not ( = ?auto_79043 ?auto_79049 ) ) ( not ( = ?auto_79044 ?auto_79049 ) ) ( not ( = ?auto_79045 ?auto_79049 ) ) ( not ( = ?auto_79046 ?auto_79049 ) ) ( not ( = ?auto_79047 ?auto_79049 ) ) ( not ( = ?auto_79048 ?auto_79049 ) ) ( ON ?auto_79043 ?auto_79042 ) ( ON-TABLE ?auto_79049 ) ( ON ?auto_79044 ?auto_79043 ) ( ON ?auto_79045 ?auto_79044 ) ( ON ?auto_79046 ?auto_79045 ) ( ON ?auto_79047 ?auto_79046 ) ( ON ?auto_79048 ?auto_79047 ) ( CLEAR ?auto_79048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79049 ?auto_79042 ?auto_79043 ?auto_79044 ?auto_79045 ?auto_79046 ?auto_79047 )
      ( MAKE-7PILE ?auto_79042 ?auto_79043 ?auto_79044 ?auto_79045 ?auto_79046 ?auto_79047 ?auto_79048 ) )
  )

)

