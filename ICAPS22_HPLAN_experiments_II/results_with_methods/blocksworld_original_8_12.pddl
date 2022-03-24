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
      ?auto_183528 - BLOCK
      ?auto_183529 - BLOCK
      ?auto_183530 - BLOCK
      ?auto_183531 - BLOCK
      ?auto_183532 - BLOCK
      ?auto_183533 - BLOCK
      ?auto_183534 - BLOCK
      ?auto_183535 - BLOCK
    )
    :vars
    (
      ?auto_183536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183536 ?auto_183535 ) ( CLEAR ?auto_183536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183528 ) ( ON ?auto_183529 ?auto_183528 ) ( ON ?auto_183530 ?auto_183529 ) ( ON ?auto_183531 ?auto_183530 ) ( ON ?auto_183532 ?auto_183531 ) ( ON ?auto_183533 ?auto_183532 ) ( ON ?auto_183534 ?auto_183533 ) ( ON ?auto_183535 ?auto_183534 ) ( not ( = ?auto_183528 ?auto_183529 ) ) ( not ( = ?auto_183528 ?auto_183530 ) ) ( not ( = ?auto_183528 ?auto_183531 ) ) ( not ( = ?auto_183528 ?auto_183532 ) ) ( not ( = ?auto_183528 ?auto_183533 ) ) ( not ( = ?auto_183528 ?auto_183534 ) ) ( not ( = ?auto_183528 ?auto_183535 ) ) ( not ( = ?auto_183528 ?auto_183536 ) ) ( not ( = ?auto_183529 ?auto_183530 ) ) ( not ( = ?auto_183529 ?auto_183531 ) ) ( not ( = ?auto_183529 ?auto_183532 ) ) ( not ( = ?auto_183529 ?auto_183533 ) ) ( not ( = ?auto_183529 ?auto_183534 ) ) ( not ( = ?auto_183529 ?auto_183535 ) ) ( not ( = ?auto_183529 ?auto_183536 ) ) ( not ( = ?auto_183530 ?auto_183531 ) ) ( not ( = ?auto_183530 ?auto_183532 ) ) ( not ( = ?auto_183530 ?auto_183533 ) ) ( not ( = ?auto_183530 ?auto_183534 ) ) ( not ( = ?auto_183530 ?auto_183535 ) ) ( not ( = ?auto_183530 ?auto_183536 ) ) ( not ( = ?auto_183531 ?auto_183532 ) ) ( not ( = ?auto_183531 ?auto_183533 ) ) ( not ( = ?auto_183531 ?auto_183534 ) ) ( not ( = ?auto_183531 ?auto_183535 ) ) ( not ( = ?auto_183531 ?auto_183536 ) ) ( not ( = ?auto_183532 ?auto_183533 ) ) ( not ( = ?auto_183532 ?auto_183534 ) ) ( not ( = ?auto_183532 ?auto_183535 ) ) ( not ( = ?auto_183532 ?auto_183536 ) ) ( not ( = ?auto_183533 ?auto_183534 ) ) ( not ( = ?auto_183533 ?auto_183535 ) ) ( not ( = ?auto_183533 ?auto_183536 ) ) ( not ( = ?auto_183534 ?auto_183535 ) ) ( not ( = ?auto_183534 ?auto_183536 ) ) ( not ( = ?auto_183535 ?auto_183536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183536 ?auto_183535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183538 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_183538 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_183538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_183539 - BLOCK
    )
    :vars
    (
      ?auto_183540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183539 ?auto_183540 ) ( CLEAR ?auto_183539 ) ( HAND-EMPTY ) ( not ( = ?auto_183539 ?auto_183540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183539 ?auto_183540 )
      ( MAKE-1PILE ?auto_183539 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183548 - BLOCK
      ?auto_183549 - BLOCK
      ?auto_183550 - BLOCK
      ?auto_183551 - BLOCK
      ?auto_183552 - BLOCK
      ?auto_183553 - BLOCK
      ?auto_183554 - BLOCK
    )
    :vars
    (
      ?auto_183555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183555 ?auto_183554 ) ( CLEAR ?auto_183555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183548 ) ( ON ?auto_183549 ?auto_183548 ) ( ON ?auto_183550 ?auto_183549 ) ( ON ?auto_183551 ?auto_183550 ) ( ON ?auto_183552 ?auto_183551 ) ( ON ?auto_183553 ?auto_183552 ) ( ON ?auto_183554 ?auto_183553 ) ( not ( = ?auto_183548 ?auto_183549 ) ) ( not ( = ?auto_183548 ?auto_183550 ) ) ( not ( = ?auto_183548 ?auto_183551 ) ) ( not ( = ?auto_183548 ?auto_183552 ) ) ( not ( = ?auto_183548 ?auto_183553 ) ) ( not ( = ?auto_183548 ?auto_183554 ) ) ( not ( = ?auto_183548 ?auto_183555 ) ) ( not ( = ?auto_183549 ?auto_183550 ) ) ( not ( = ?auto_183549 ?auto_183551 ) ) ( not ( = ?auto_183549 ?auto_183552 ) ) ( not ( = ?auto_183549 ?auto_183553 ) ) ( not ( = ?auto_183549 ?auto_183554 ) ) ( not ( = ?auto_183549 ?auto_183555 ) ) ( not ( = ?auto_183550 ?auto_183551 ) ) ( not ( = ?auto_183550 ?auto_183552 ) ) ( not ( = ?auto_183550 ?auto_183553 ) ) ( not ( = ?auto_183550 ?auto_183554 ) ) ( not ( = ?auto_183550 ?auto_183555 ) ) ( not ( = ?auto_183551 ?auto_183552 ) ) ( not ( = ?auto_183551 ?auto_183553 ) ) ( not ( = ?auto_183551 ?auto_183554 ) ) ( not ( = ?auto_183551 ?auto_183555 ) ) ( not ( = ?auto_183552 ?auto_183553 ) ) ( not ( = ?auto_183552 ?auto_183554 ) ) ( not ( = ?auto_183552 ?auto_183555 ) ) ( not ( = ?auto_183553 ?auto_183554 ) ) ( not ( = ?auto_183553 ?auto_183555 ) ) ( not ( = ?auto_183554 ?auto_183555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183555 ?auto_183554 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183556 - BLOCK
      ?auto_183557 - BLOCK
      ?auto_183558 - BLOCK
      ?auto_183559 - BLOCK
      ?auto_183560 - BLOCK
      ?auto_183561 - BLOCK
      ?auto_183562 - BLOCK
    )
    :vars
    (
      ?auto_183563 - BLOCK
      ?auto_183564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183563 ?auto_183562 ) ( CLEAR ?auto_183563 ) ( ON-TABLE ?auto_183556 ) ( ON ?auto_183557 ?auto_183556 ) ( ON ?auto_183558 ?auto_183557 ) ( ON ?auto_183559 ?auto_183558 ) ( ON ?auto_183560 ?auto_183559 ) ( ON ?auto_183561 ?auto_183560 ) ( ON ?auto_183562 ?auto_183561 ) ( not ( = ?auto_183556 ?auto_183557 ) ) ( not ( = ?auto_183556 ?auto_183558 ) ) ( not ( = ?auto_183556 ?auto_183559 ) ) ( not ( = ?auto_183556 ?auto_183560 ) ) ( not ( = ?auto_183556 ?auto_183561 ) ) ( not ( = ?auto_183556 ?auto_183562 ) ) ( not ( = ?auto_183556 ?auto_183563 ) ) ( not ( = ?auto_183557 ?auto_183558 ) ) ( not ( = ?auto_183557 ?auto_183559 ) ) ( not ( = ?auto_183557 ?auto_183560 ) ) ( not ( = ?auto_183557 ?auto_183561 ) ) ( not ( = ?auto_183557 ?auto_183562 ) ) ( not ( = ?auto_183557 ?auto_183563 ) ) ( not ( = ?auto_183558 ?auto_183559 ) ) ( not ( = ?auto_183558 ?auto_183560 ) ) ( not ( = ?auto_183558 ?auto_183561 ) ) ( not ( = ?auto_183558 ?auto_183562 ) ) ( not ( = ?auto_183558 ?auto_183563 ) ) ( not ( = ?auto_183559 ?auto_183560 ) ) ( not ( = ?auto_183559 ?auto_183561 ) ) ( not ( = ?auto_183559 ?auto_183562 ) ) ( not ( = ?auto_183559 ?auto_183563 ) ) ( not ( = ?auto_183560 ?auto_183561 ) ) ( not ( = ?auto_183560 ?auto_183562 ) ) ( not ( = ?auto_183560 ?auto_183563 ) ) ( not ( = ?auto_183561 ?auto_183562 ) ) ( not ( = ?auto_183561 ?auto_183563 ) ) ( not ( = ?auto_183562 ?auto_183563 ) ) ( HOLDING ?auto_183564 ) ( not ( = ?auto_183556 ?auto_183564 ) ) ( not ( = ?auto_183557 ?auto_183564 ) ) ( not ( = ?auto_183558 ?auto_183564 ) ) ( not ( = ?auto_183559 ?auto_183564 ) ) ( not ( = ?auto_183560 ?auto_183564 ) ) ( not ( = ?auto_183561 ?auto_183564 ) ) ( not ( = ?auto_183562 ?auto_183564 ) ) ( not ( = ?auto_183563 ?auto_183564 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_183564 )
      ( MAKE-7PILE ?auto_183556 ?auto_183557 ?auto_183558 ?auto_183559 ?auto_183560 ?auto_183561 ?auto_183562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_183565 - BLOCK
      ?auto_183566 - BLOCK
      ?auto_183567 - BLOCK
      ?auto_183568 - BLOCK
      ?auto_183569 - BLOCK
      ?auto_183570 - BLOCK
      ?auto_183571 - BLOCK
    )
    :vars
    (
      ?auto_183573 - BLOCK
      ?auto_183572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183573 ?auto_183571 ) ( ON-TABLE ?auto_183565 ) ( ON ?auto_183566 ?auto_183565 ) ( ON ?auto_183567 ?auto_183566 ) ( ON ?auto_183568 ?auto_183567 ) ( ON ?auto_183569 ?auto_183568 ) ( ON ?auto_183570 ?auto_183569 ) ( ON ?auto_183571 ?auto_183570 ) ( not ( = ?auto_183565 ?auto_183566 ) ) ( not ( = ?auto_183565 ?auto_183567 ) ) ( not ( = ?auto_183565 ?auto_183568 ) ) ( not ( = ?auto_183565 ?auto_183569 ) ) ( not ( = ?auto_183565 ?auto_183570 ) ) ( not ( = ?auto_183565 ?auto_183571 ) ) ( not ( = ?auto_183565 ?auto_183573 ) ) ( not ( = ?auto_183566 ?auto_183567 ) ) ( not ( = ?auto_183566 ?auto_183568 ) ) ( not ( = ?auto_183566 ?auto_183569 ) ) ( not ( = ?auto_183566 ?auto_183570 ) ) ( not ( = ?auto_183566 ?auto_183571 ) ) ( not ( = ?auto_183566 ?auto_183573 ) ) ( not ( = ?auto_183567 ?auto_183568 ) ) ( not ( = ?auto_183567 ?auto_183569 ) ) ( not ( = ?auto_183567 ?auto_183570 ) ) ( not ( = ?auto_183567 ?auto_183571 ) ) ( not ( = ?auto_183567 ?auto_183573 ) ) ( not ( = ?auto_183568 ?auto_183569 ) ) ( not ( = ?auto_183568 ?auto_183570 ) ) ( not ( = ?auto_183568 ?auto_183571 ) ) ( not ( = ?auto_183568 ?auto_183573 ) ) ( not ( = ?auto_183569 ?auto_183570 ) ) ( not ( = ?auto_183569 ?auto_183571 ) ) ( not ( = ?auto_183569 ?auto_183573 ) ) ( not ( = ?auto_183570 ?auto_183571 ) ) ( not ( = ?auto_183570 ?auto_183573 ) ) ( not ( = ?auto_183571 ?auto_183573 ) ) ( not ( = ?auto_183565 ?auto_183572 ) ) ( not ( = ?auto_183566 ?auto_183572 ) ) ( not ( = ?auto_183567 ?auto_183572 ) ) ( not ( = ?auto_183568 ?auto_183572 ) ) ( not ( = ?auto_183569 ?auto_183572 ) ) ( not ( = ?auto_183570 ?auto_183572 ) ) ( not ( = ?auto_183571 ?auto_183572 ) ) ( not ( = ?auto_183573 ?auto_183572 ) ) ( ON ?auto_183572 ?auto_183573 ) ( CLEAR ?auto_183572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183565 ?auto_183566 ?auto_183567 ?auto_183568 ?auto_183569 ?auto_183570 ?auto_183571 ?auto_183573 )
      ( MAKE-7PILE ?auto_183565 ?auto_183566 ?auto_183567 ?auto_183568 ?auto_183569 ?auto_183570 ?auto_183571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183576 - BLOCK
      ?auto_183577 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_183577 ) ( CLEAR ?auto_183576 ) ( ON-TABLE ?auto_183576 ) ( not ( = ?auto_183576 ?auto_183577 ) ) )
    :subtasks
    ( ( !STACK ?auto_183577 ?auto_183576 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183578 - BLOCK
      ?auto_183579 - BLOCK
    )
    :vars
    (
      ?auto_183580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183578 ) ( ON-TABLE ?auto_183578 ) ( not ( = ?auto_183578 ?auto_183579 ) ) ( ON ?auto_183579 ?auto_183580 ) ( CLEAR ?auto_183579 ) ( HAND-EMPTY ) ( not ( = ?auto_183578 ?auto_183580 ) ) ( not ( = ?auto_183579 ?auto_183580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183579 ?auto_183580 )
      ( MAKE-2PILE ?auto_183578 ?auto_183579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183581 - BLOCK
      ?auto_183582 - BLOCK
    )
    :vars
    (
      ?auto_183583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183581 ?auto_183582 ) ) ( ON ?auto_183582 ?auto_183583 ) ( CLEAR ?auto_183582 ) ( not ( = ?auto_183581 ?auto_183583 ) ) ( not ( = ?auto_183582 ?auto_183583 ) ) ( HOLDING ?auto_183581 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183581 )
      ( MAKE-2PILE ?auto_183581 ?auto_183582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_183584 - BLOCK
      ?auto_183585 - BLOCK
    )
    :vars
    (
      ?auto_183586 - BLOCK
      ?auto_183588 - BLOCK
      ?auto_183591 - BLOCK
      ?auto_183587 - BLOCK
      ?auto_183589 - BLOCK
      ?auto_183590 - BLOCK
      ?auto_183592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183584 ?auto_183585 ) ) ( ON ?auto_183585 ?auto_183586 ) ( not ( = ?auto_183584 ?auto_183586 ) ) ( not ( = ?auto_183585 ?auto_183586 ) ) ( ON ?auto_183584 ?auto_183585 ) ( CLEAR ?auto_183584 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183588 ) ( ON ?auto_183591 ?auto_183588 ) ( ON ?auto_183587 ?auto_183591 ) ( ON ?auto_183589 ?auto_183587 ) ( ON ?auto_183590 ?auto_183589 ) ( ON ?auto_183592 ?auto_183590 ) ( ON ?auto_183586 ?auto_183592 ) ( not ( = ?auto_183588 ?auto_183591 ) ) ( not ( = ?auto_183588 ?auto_183587 ) ) ( not ( = ?auto_183588 ?auto_183589 ) ) ( not ( = ?auto_183588 ?auto_183590 ) ) ( not ( = ?auto_183588 ?auto_183592 ) ) ( not ( = ?auto_183588 ?auto_183586 ) ) ( not ( = ?auto_183588 ?auto_183585 ) ) ( not ( = ?auto_183588 ?auto_183584 ) ) ( not ( = ?auto_183591 ?auto_183587 ) ) ( not ( = ?auto_183591 ?auto_183589 ) ) ( not ( = ?auto_183591 ?auto_183590 ) ) ( not ( = ?auto_183591 ?auto_183592 ) ) ( not ( = ?auto_183591 ?auto_183586 ) ) ( not ( = ?auto_183591 ?auto_183585 ) ) ( not ( = ?auto_183591 ?auto_183584 ) ) ( not ( = ?auto_183587 ?auto_183589 ) ) ( not ( = ?auto_183587 ?auto_183590 ) ) ( not ( = ?auto_183587 ?auto_183592 ) ) ( not ( = ?auto_183587 ?auto_183586 ) ) ( not ( = ?auto_183587 ?auto_183585 ) ) ( not ( = ?auto_183587 ?auto_183584 ) ) ( not ( = ?auto_183589 ?auto_183590 ) ) ( not ( = ?auto_183589 ?auto_183592 ) ) ( not ( = ?auto_183589 ?auto_183586 ) ) ( not ( = ?auto_183589 ?auto_183585 ) ) ( not ( = ?auto_183589 ?auto_183584 ) ) ( not ( = ?auto_183590 ?auto_183592 ) ) ( not ( = ?auto_183590 ?auto_183586 ) ) ( not ( = ?auto_183590 ?auto_183585 ) ) ( not ( = ?auto_183590 ?auto_183584 ) ) ( not ( = ?auto_183592 ?auto_183586 ) ) ( not ( = ?auto_183592 ?auto_183585 ) ) ( not ( = ?auto_183592 ?auto_183584 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183588 ?auto_183591 ?auto_183587 ?auto_183589 ?auto_183590 ?auto_183592 ?auto_183586 ?auto_183585 )
      ( MAKE-2PILE ?auto_183584 ?auto_183585 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183599 - BLOCK
      ?auto_183600 - BLOCK
      ?auto_183601 - BLOCK
      ?auto_183602 - BLOCK
      ?auto_183603 - BLOCK
      ?auto_183604 - BLOCK
    )
    :vars
    (
      ?auto_183605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183605 ?auto_183604 ) ( CLEAR ?auto_183605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183599 ) ( ON ?auto_183600 ?auto_183599 ) ( ON ?auto_183601 ?auto_183600 ) ( ON ?auto_183602 ?auto_183601 ) ( ON ?auto_183603 ?auto_183602 ) ( ON ?auto_183604 ?auto_183603 ) ( not ( = ?auto_183599 ?auto_183600 ) ) ( not ( = ?auto_183599 ?auto_183601 ) ) ( not ( = ?auto_183599 ?auto_183602 ) ) ( not ( = ?auto_183599 ?auto_183603 ) ) ( not ( = ?auto_183599 ?auto_183604 ) ) ( not ( = ?auto_183599 ?auto_183605 ) ) ( not ( = ?auto_183600 ?auto_183601 ) ) ( not ( = ?auto_183600 ?auto_183602 ) ) ( not ( = ?auto_183600 ?auto_183603 ) ) ( not ( = ?auto_183600 ?auto_183604 ) ) ( not ( = ?auto_183600 ?auto_183605 ) ) ( not ( = ?auto_183601 ?auto_183602 ) ) ( not ( = ?auto_183601 ?auto_183603 ) ) ( not ( = ?auto_183601 ?auto_183604 ) ) ( not ( = ?auto_183601 ?auto_183605 ) ) ( not ( = ?auto_183602 ?auto_183603 ) ) ( not ( = ?auto_183602 ?auto_183604 ) ) ( not ( = ?auto_183602 ?auto_183605 ) ) ( not ( = ?auto_183603 ?auto_183604 ) ) ( not ( = ?auto_183603 ?auto_183605 ) ) ( not ( = ?auto_183604 ?auto_183605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183605 ?auto_183604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183606 - BLOCK
      ?auto_183607 - BLOCK
      ?auto_183608 - BLOCK
      ?auto_183609 - BLOCK
      ?auto_183610 - BLOCK
      ?auto_183611 - BLOCK
    )
    :vars
    (
      ?auto_183612 - BLOCK
      ?auto_183613 - BLOCK
      ?auto_183614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183612 ?auto_183611 ) ( CLEAR ?auto_183612 ) ( ON-TABLE ?auto_183606 ) ( ON ?auto_183607 ?auto_183606 ) ( ON ?auto_183608 ?auto_183607 ) ( ON ?auto_183609 ?auto_183608 ) ( ON ?auto_183610 ?auto_183609 ) ( ON ?auto_183611 ?auto_183610 ) ( not ( = ?auto_183606 ?auto_183607 ) ) ( not ( = ?auto_183606 ?auto_183608 ) ) ( not ( = ?auto_183606 ?auto_183609 ) ) ( not ( = ?auto_183606 ?auto_183610 ) ) ( not ( = ?auto_183606 ?auto_183611 ) ) ( not ( = ?auto_183606 ?auto_183612 ) ) ( not ( = ?auto_183607 ?auto_183608 ) ) ( not ( = ?auto_183607 ?auto_183609 ) ) ( not ( = ?auto_183607 ?auto_183610 ) ) ( not ( = ?auto_183607 ?auto_183611 ) ) ( not ( = ?auto_183607 ?auto_183612 ) ) ( not ( = ?auto_183608 ?auto_183609 ) ) ( not ( = ?auto_183608 ?auto_183610 ) ) ( not ( = ?auto_183608 ?auto_183611 ) ) ( not ( = ?auto_183608 ?auto_183612 ) ) ( not ( = ?auto_183609 ?auto_183610 ) ) ( not ( = ?auto_183609 ?auto_183611 ) ) ( not ( = ?auto_183609 ?auto_183612 ) ) ( not ( = ?auto_183610 ?auto_183611 ) ) ( not ( = ?auto_183610 ?auto_183612 ) ) ( not ( = ?auto_183611 ?auto_183612 ) ) ( HOLDING ?auto_183613 ) ( CLEAR ?auto_183614 ) ( not ( = ?auto_183606 ?auto_183613 ) ) ( not ( = ?auto_183606 ?auto_183614 ) ) ( not ( = ?auto_183607 ?auto_183613 ) ) ( not ( = ?auto_183607 ?auto_183614 ) ) ( not ( = ?auto_183608 ?auto_183613 ) ) ( not ( = ?auto_183608 ?auto_183614 ) ) ( not ( = ?auto_183609 ?auto_183613 ) ) ( not ( = ?auto_183609 ?auto_183614 ) ) ( not ( = ?auto_183610 ?auto_183613 ) ) ( not ( = ?auto_183610 ?auto_183614 ) ) ( not ( = ?auto_183611 ?auto_183613 ) ) ( not ( = ?auto_183611 ?auto_183614 ) ) ( not ( = ?auto_183612 ?auto_183613 ) ) ( not ( = ?auto_183612 ?auto_183614 ) ) ( not ( = ?auto_183613 ?auto_183614 ) ) )
    :subtasks
    ( ( !STACK ?auto_183613 ?auto_183614 )
      ( MAKE-6PILE ?auto_183606 ?auto_183607 ?auto_183608 ?auto_183609 ?auto_183610 ?auto_183611 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183615 - BLOCK
      ?auto_183616 - BLOCK
      ?auto_183617 - BLOCK
      ?auto_183618 - BLOCK
      ?auto_183619 - BLOCK
      ?auto_183620 - BLOCK
    )
    :vars
    (
      ?auto_183623 - BLOCK
      ?auto_183621 - BLOCK
      ?auto_183622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183623 ?auto_183620 ) ( ON-TABLE ?auto_183615 ) ( ON ?auto_183616 ?auto_183615 ) ( ON ?auto_183617 ?auto_183616 ) ( ON ?auto_183618 ?auto_183617 ) ( ON ?auto_183619 ?auto_183618 ) ( ON ?auto_183620 ?auto_183619 ) ( not ( = ?auto_183615 ?auto_183616 ) ) ( not ( = ?auto_183615 ?auto_183617 ) ) ( not ( = ?auto_183615 ?auto_183618 ) ) ( not ( = ?auto_183615 ?auto_183619 ) ) ( not ( = ?auto_183615 ?auto_183620 ) ) ( not ( = ?auto_183615 ?auto_183623 ) ) ( not ( = ?auto_183616 ?auto_183617 ) ) ( not ( = ?auto_183616 ?auto_183618 ) ) ( not ( = ?auto_183616 ?auto_183619 ) ) ( not ( = ?auto_183616 ?auto_183620 ) ) ( not ( = ?auto_183616 ?auto_183623 ) ) ( not ( = ?auto_183617 ?auto_183618 ) ) ( not ( = ?auto_183617 ?auto_183619 ) ) ( not ( = ?auto_183617 ?auto_183620 ) ) ( not ( = ?auto_183617 ?auto_183623 ) ) ( not ( = ?auto_183618 ?auto_183619 ) ) ( not ( = ?auto_183618 ?auto_183620 ) ) ( not ( = ?auto_183618 ?auto_183623 ) ) ( not ( = ?auto_183619 ?auto_183620 ) ) ( not ( = ?auto_183619 ?auto_183623 ) ) ( not ( = ?auto_183620 ?auto_183623 ) ) ( CLEAR ?auto_183621 ) ( not ( = ?auto_183615 ?auto_183622 ) ) ( not ( = ?auto_183615 ?auto_183621 ) ) ( not ( = ?auto_183616 ?auto_183622 ) ) ( not ( = ?auto_183616 ?auto_183621 ) ) ( not ( = ?auto_183617 ?auto_183622 ) ) ( not ( = ?auto_183617 ?auto_183621 ) ) ( not ( = ?auto_183618 ?auto_183622 ) ) ( not ( = ?auto_183618 ?auto_183621 ) ) ( not ( = ?auto_183619 ?auto_183622 ) ) ( not ( = ?auto_183619 ?auto_183621 ) ) ( not ( = ?auto_183620 ?auto_183622 ) ) ( not ( = ?auto_183620 ?auto_183621 ) ) ( not ( = ?auto_183623 ?auto_183622 ) ) ( not ( = ?auto_183623 ?auto_183621 ) ) ( not ( = ?auto_183622 ?auto_183621 ) ) ( ON ?auto_183622 ?auto_183623 ) ( CLEAR ?auto_183622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183615 ?auto_183616 ?auto_183617 ?auto_183618 ?auto_183619 ?auto_183620 ?auto_183623 )
      ( MAKE-6PILE ?auto_183615 ?auto_183616 ?auto_183617 ?auto_183618 ?auto_183619 ?auto_183620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183624 - BLOCK
      ?auto_183625 - BLOCK
      ?auto_183626 - BLOCK
      ?auto_183627 - BLOCK
      ?auto_183628 - BLOCK
      ?auto_183629 - BLOCK
    )
    :vars
    (
      ?auto_183631 - BLOCK
      ?auto_183632 - BLOCK
      ?auto_183630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183631 ?auto_183629 ) ( ON-TABLE ?auto_183624 ) ( ON ?auto_183625 ?auto_183624 ) ( ON ?auto_183626 ?auto_183625 ) ( ON ?auto_183627 ?auto_183626 ) ( ON ?auto_183628 ?auto_183627 ) ( ON ?auto_183629 ?auto_183628 ) ( not ( = ?auto_183624 ?auto_183625 ) ) ( not ( = ?auto_183624 ?auto_183626 ) ) ( not ( = ?auto_183624 ?auto_183627 ) ) ( not ( = ?auto_183624 ?auto_183628 ) ) ( not ( = ?auto_183624 ?auto_183629 ) ) ( not ( = ?auto_183624 ?auto_183631 ) ) ( not ( = ?auto_183625 ?auto_183626 ) ) ( not ( = ?auto_183625 ?auto_183627 ) ) ( not ( = ?auto_183625 ?auto_183628 ) ) ( not ( = ?auto_183625 ?auto_183629 ) ) ( not ( = ?auto_183625 ?auto_183631 ) ) ( not ( = ?auto_183626 ?auto_183627 ) ) ( not ( = ?auto_183626 ?auto_183628 ) ) ( not ( = ?auto_183626 ?auto_183629 ) ) ( not ( = ?auto_183626 ?auto_183631 ) ) ( not ( = ?auto_183627 ?auto_183628 ) ) ( not ( = ?auto_183627 ?auto_183629 ) ) ( not ( = ?auto_183627 ?auto_183631 ) ) ( not ( = ?auto_183628 ?auto_183629 ) ) ( not ( = ?auto_183628 ?auto_183631 ) ) ( not ( = ?auto_183629 ?auto_183631 ) ) ( not ( = ?auto_183624 ?auto_183632 ) ) ( not ( = ?auto_183624 ?auto_183630 ) ) ( not ( = ?auto_183625 ?auto_183632 ) ) ( not ( = ?auto_183625 ?auto_183630 ) ) ( not ( = ?auto_183626 ?auto_183632 ) ) ( not ( = ?auto_183626 ?auto_183630 ) ) ( not ( = ?auto_183627 ?auto_183632 ) ) ( not ( = ?auto_183627 ?auto_183630 ) ) ( not ( = ?auto_183628 ?auto_183632 ) ) ( not ( = ?auto_183628 ?auto_183630 ) ) ( not ( = ?auto_183629 ?auto_183632 ) ) ( not ( = ?auto_183629 ?auto_183630 ) ) ( not ( = ?auto_183631 ?auto_183632 ) ) ( not ( = ?auto_183631 ?auto_183630 ) ) ( not ( = ?auto_183632 ?auto_183630 ) ) ( ON ?auto_183632 ?auto_183631 ) ( CLEAR ?auto_183632 ) ( HOLDING ?auto_183630 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183630 )
      ( MAKE-6PILE ?auto_183624 ?auto_183625 ?auto_183626 ?auto_183627 ?auto_183628 ?auto_183629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_183633 - BLOCK
      ?auto_183634 - BLOCK
      ?auto_183635 - BLOCK
      ?auto_183636 - BLOCK
      ?auto_183637 - BLOCK
      ?auto_183638 - BLOCK
    )
    :vars
    (
      ?auto_183640 - BLOCK
      ?auto_183639 - BLOCK
      ?auto_183641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183640 ?auto_183638 ) ( ON-TABLE ?auto_183633 ) ( ON ?auto_183634 ?auto_183633 ) ( ON ?auto_183635 ?auto_183634 ) ( ON ?auto_183636 ?auto_183635 ) ( ON ?auto_183637 ?auto_183636 ) ( ON ?auto_183638 ?auto_183637 ) ( not ( = ?auto_183633 ?auto_183634 ) ) ( not ( = ?auto_183633 ?auto_183635 ) ) ( not ( = ?auto_183633 ?auto_183636 ) ) ( not ( = ?auto_183633 ?auto_183637 ) ) ( not ( = ?auto_183633 ?auto_183638 ) ) ( not ( = ?auto_183633 ?auto_183640 ) ) ( not ( = ?auto_183634 ?auto_183635 ) ) ( not ( = ?auto_183634 ?auto_183636 ) ) ( not ( = ?auto_183634 ?auto_183637 ) ) ( not ( = ?auto_183634 ?auto_183638 ) ) ( not ( = ?auto_183634 ?auto_183640 ) ) ( not ( = ?auto_183635 ?auto_183636 ) ) ( not ( = ?auto_183635 ?auto_183637 ) ) ( not ( = ?auto_183635 ?auto_183638 ) ) ( not ( = ?auto_183635 ?auto_183640 ) ) ( not ( = ?auto_183636 ?auto_183637 ) ) ( not ( = ?auto_183636 ?auto_183638 ) ) ( not ( = ?auto_183636 ?auto_183640 ) ) ( not ( = ?auto_183637 ?auto_183638 ) ) ( not ( = ?auto_183637 ?auto_183640 ) ) ( not ( = ?auto_183638 ?auto_183640 ) ) ( not ( = ?auto_183633 ?auto_183639 ) ) ( not ( = ?auto_183633 ?auto_183641 ) ) ( not ( = ?auto_183634 ?auto_183639 ) ) ( not ( = ?auto_183634 ?auto_183641 ) ) ( not ( = ?auto_183635 ?auto_183639 ) ) ( not ( = ?auto_183635 ?auto_183641 ) ) ( not ( = ?auto_183636 ?auto_183639 ) ) ( not ( = ?auto_183636 ?auto_183641 ) ) ( not ( = ?auto_183637 ?auto_183639 ) ) ( not ( = ?auto_183637 ?auto_183641 ) ) ( not ( = ?auto_183638 ?auto_183639 ) ) ( not ( = ?auto_183638 ?auto_183641 ) ) ( not ( = ?auto_183640 ?auto_183639 ) ) ( not ( = ?auto_183640 ?auto_183641 ) ) ( not ( = ?auto_183639 ?auto_183641 ) ) ( ON ?auto_183639 ?auto_183640 ) ( ON ?auto_183641 ?auto_183639 ) ( CLEAR ?auto_183641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183633 ?auto_183634 ?auto_183635 ?auto_183636 ?auto_183637 ?auto_183638 ?auto_183640 ?auto_183639 )
      ( MAKE-6PILE ?auto_183633 ?auto_183634 ?auto_183635 ?auto_183636 ?auto_183637 ?auto_183638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183645 - BLOCK
      ?auto_183646 - BLOCK
      ?auto_183647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_183647 ) ( CLEAR ?auto_183646 ) ( ON-TABLE ?auto_183645 ) ( ON ?auto_183646 ?auto_183645 ) ( not ( = ?auto_183645 ?auto_183646 ) ) ( not ( = ?auto_183645 ?auto_183647 ) ) ( not ( = ?auto_183646 ?auto_183647 ) ) )
    :subtasks
    ( ( !STACK ?auto_183647 ?auto_183646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183648 - BLOCK
      ?auto_183649 - BLOCK
      ?auto_183650 - BLOCK
    )
    :vars
    (
      ?auto_183651 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183649 ) ( ON-TABLE ?auto_183648 ) ( ON ?auto_183649 ?auto_183648 ) ( not ( = ?auto_183648 ?auto_183649 ) ) ( not ( = ?auto_183648 ?auto_183650 ) ) ( not ( = ?auto_183649 ?auto_183650 ) ) ( ON ?auto_183650 ?auto_183651 ) ( CLEAR ?auto_183650 ) ( HAND-EMPTY ) ( not ( = ?auto_183648 ?auto_183651 ) ) ( not ( = ?auto_183649 ?auto_183651 ) ) ( not ( = ?auto_183650 ?auto_183651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183650 ?auto_183651 )
      ( MAKE-3PILE ?auto_183648 ?auto_183649 ?auto_183650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183652 - BLOCK
      ?auto_183653 - BLOCK
      ?auto_183654 - BLOCK
    )
    :vars
    (
      ?auto_183655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183652 ) ( not ( = ?auto_183652 ?auto_183653 ) ) ( not ( = ?auto_183652 ?auto_183654 ) ) ( not ( = ?auto_183653 ?auto_183654 ) ) ( ON ?auto_183654 ?auto_183655 ) ( CLEAR ?auto_183654 ) ( not ( = ?auto_183652 ?auto_183655 ) ) ( not ( = ?auto_183653 ?auto_183655 ) ) ( not ( = ?auto_183654 ?auto_183655 ) ) ( HOLDING ?auto_183653 ) ( CLEAR ?auto_183652 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183652 ?auto_183653 )
      ( MAKE-3PILE ?auto_183652 ?auto_183653 ?auto_183654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183656 - BLOCK
      ?auto_183657 - BLOCK
      ?auto_183658 - BLOCK
    )
    :vars
    (
      ?auto_183659 - BLOCK
      ?auto_183663 - BLOCK
      ?auto_183664 - BLOCK
      ?auto_183661 - BLOCK
      ?auto_183660 - BLOCK
      ?auto_183662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183656 ) ( not ( = ?auto_183656 ?auto_183657 ) ) ( not ( = ?auto_183656 ?auto_183658 ) ) ( not ( = ?auto_183657 ?auto_183658 ) ) ( ON ?auto_183658 ?auto_183659 ) ( not ( = ?auto_183656 ?auto_183659 ) ) ( not ( = ?auto_183657 ?auto_183659 ) ) ( not ( = ?auto_183658 ?auto_183659 ) ) ( CLEAR ?auto_183656 ) ( ON ?auto_183657 ?auto_183658 ) ( CLEAR ?auto_183657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183663 ) ( ON ?auto_183664 ?auto_183663 ) ( ON ?auto_183661 ?auto_183664 ) ( ON ?auto_183660 ?auto_183661 ) ( ON ?auto_183662 ?auto_183660 ) ( ON ?auto_183659 ?auto_183662 ) ( not ( = ?auto_183663 ?auto_183664 ) ) ( not ( = ?auto_183663 ?auto_183661 ) ) ( not ( = ?auto_183663 ?auto_183660 ) ) ( not ( = ?auto_183663 ?auto_183662 ) ) ( not ( = ?auto_183663 ?auto_183659 ) ) ( not ( = ?auto_183663 ?auto_183658 ) ) ( not ( = ?auto_183663 ?auto_183657 ) ) ( not ( = ?auto_183664 ?auto_183661 ) ) ( not ( = ?auto_183664 ?auto_183660 ) ) ( not ( = ?auto_183664 ?auto_183662 ) ) ( not ( = ?auto_183664 ?auto_183659 ) ) ( not ( = ?auto_183664 ?auto_183658 ) ) ( not ( = ?auto_183664 ?auto_183657 ) ) ( not ( = ?auto_183661 ?auto_183660 ) ) ( not ( = ?auto_183661 ?auto_183662 ) ) ( not ( = ?auto_183661 ?auto_183659 ) ) ( not ( = ?auto_183661 ?auto_183658 ) ) ( not ( = ?auto_183661 ?auto_183657 ) ) ( not ( = ?auto_183660 ?auto_183662 ) ) ( not ( = ?auto_183660 ?auto_183659 ) ) ( not ( = ?auto_183660 ?auto_183658 ) ) ( not ( = ?auto_183660 ?auto_183657 ) ) ( not ( = ?auto_183662 ?auto_183659 ) ) ( not ( = ?auto_183662 ?auto_183658 ) ) ( not ( = ?auto_183662 ?auto_183657 ) ) ( not ( = ?auto_183656 ?auto_183663 ) ) ( not ( = ?auto_183656 ?auto_183664 ) ) ( not ( = ?auto_183656 ?auto_183661 ) ) ( not ( = ?auto_183656 ?auto_183660 ) ) ( not ( = ?auto_183656 ?auto_183662 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183663 ?auto_183664 ?auto_183661 ?auto_183660 ?auto_183662 ?auto_183659 ?auto_183658 )
      ( MAKE-3PILE ?auto_183656 ?auto_183657 ?auto_183658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183665 - BLOCK
      ?auto_183666 - BLOCK
      ?auto_183667 - BLOCK
    )
    :vars
    (
      ?auto_183669 - BLOCK
      ?auto_183672 - BLOCK
      ?auto_183670 - BLOCK
      ?auto_183673 - BLOCK
      ?auto_183671 - BLOCK
      ?auto_183668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183665 ?auto_183666 ) ) ( not ( = ?auto_183665 ?auto_183667 ) ) ( not ( = ?auto_183666 ?auto_183667 ) ) ( ON ?auto_183667 ?auto_183669 ) ( not ( = ?auto_183665 ?auto_183669 ) ) ( not ( = ?auto_183666 ?auto_183669 ) ) ( not ( = ?auto_183667 ?auto_183669 ) ) ( ON ?auto_183666 ?auto_183667 ) ( CLEAR ?auto_183666 ) ( ON-TABLE ?auto_183672 ) ( ON ?auto_183670 ?auto_183672 ) ( ON ?auto_183673 ?auto_183670 ) ( ON ?auto_183671 ?auto_183673 ) ( ON ?auto_183668 ?auto_183671 ) ( ON ?auto_183669 ?auto_183668 ) ( not ( = ?auto_183672 ?auto_183670 ) ) ( not ( = ?auto_183672 ?auto_183673 ) ) ( not ( = ?auto_183672 ?auto_183671 ) ) ( not ( = ?auto_183672 ?auto_183668 ) ) ( not ( = ?auto_183672 ?auto_183669 ) ) ( not ( = ?auto_183672 ?auto_183667 ) ) ( not ( = ?auto_183672 ?auto_183666 ) ) ( not ( = ?auto_183670 ?auto_183673 ) ) ( not ( = ?auto_183670 ?auto_183671 ) ) ( not ( = ?auto_183670 ?auto_183668 ) ) ( not ( = ?auto_183670 ?auto_183669 ) ) ( not ( = ?auto_183670 ?auto_183667 ) ) ( not ( = ?auto_183670 ?auto_183666 ) ) ( not ( = ?auto_183673 ?auto_183671 ) ) ( not ( = ?auto_183673 ?auto_183668 ) ) ( not ( = ?auto_183673 ?auto_183669 ) ) ( not ( = ?auto_183673 ?auto_183667 ) ) ( not ( = ?auto_183673 ?auto_183666 ) ) ( not ( = ?auto_183671 ?auto_183668 ) ) ( not ( = ?auto_183671 ?auto_183669 ) ) ( not ( = ?auto_183671 ?auto_183667 ) ) ( not ( = ?auto_183671 ?auto_183666 ) ) ( not ( = ?auto_183668 ?auto_183669 ) ) ( not ( = ?auto_183668 ?auto_183667 ) ) ( not ( = ?auto_183668 ?auto_183666 ) ) ( not ( = ?auto_183665 ?auto_183672 ) ) ( not ( = ?auto_183665 ?auto_183670 ) ) ( not ( = ?auto_183665 ?auto_183673 ) ) ( not ( = ?auto_183665 ?auto_183671 ) ) ( not ( = ?auto_183665 ?auto_183668 ) ) ( HOLDING ?auto_183665 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183665 )
      ( MAKE-3PILE ?auto_183665 ?auto_183666 ?auto_183667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183674 - BLOCK
      ?auto_183675 - BLOCK
      ?auto_183676 - BLOCK
    )
    :vars
    (
      ?auto_183679 - BLOCK
      ?auto_183680 - BLOCK
      ?auto_183678 - BLOCK
      ?auto_183682 - BLOCK
      ?auto_183677 - BLOCK
      ?auto_183681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183674 ?auto_183675 ) ) ( not ( = ?auto_183674 ?auto_183676 ) ) ( not ( = ?auto_183675 ?auto_183676 ) ) ( ON ?auto_183676 ?auto_183679 ) ( not ( = ?auto_183674 ?auto_183679 ) ) ( not ( = ?auto_183675 ?auto_183679 ) ) ( not ( = ?auto_183676 ?auto_183679 ) ) ( ON ?auto_183675 ?auto_183676 ) ( ON-TABLE ?auto_183680 ) ( ON ?auto_183678 ?auto_183680 ) ( ON ?auto_183682 ?auto_183678 ) ( ON ?auto_183677 ?auto_183682 ) ( ON ?auto_183681 ?auto_183677 ) ( ON ?auto_183679 ?auto_183681 ) ( not ( = ?auto_183680 ?auto_183678 ) ) ( not ( = ?auto_183680 ?auto_183682 ) ) ( not ( = ?auto_183680 ?auto_183677 ) ) ( not ( = ?auto_183680 ?auto_183681 ) ) ( not ( = ?auto_183680 ?auto_183679 ) ) ( not ( = ?auto_183680 ?auto_183676 ) ) ( not ( = ?auto_183680 ?auto_183675 ) ) ( not ( = ?auto_183678 ?auto_183682 ) ) ( not ( = ?auto_183678 ?auto_183677 ) ) ( not ( = ?auto_183678 ?auto_183681 ) ) ( not ( = ?auto_183678 ?auto_183679 ) ) ( not ( = ?auto_183678 ?auto_183676 ) ) ( not ( = ?auto_183678 ?auto_183675 ) ) ( not ( = ?auto_183682 ?auto_183677 ) ) ( not ( = ?auto_183682 ?auto_183681 ) ) ( not ( = ?auto_183682 ?auto_183679 ) ) ( not ( = ?auto_183682 ?auto_183676 ) ) ( not ( = ?auto_183682 ?auto_183675 ) ) ( not ( = ?auto_183677 ?auto_183681 ) ) ( not ( = ?auto_183677 ?auto_183679 ) ) ( not ( = ?auto_183677 ?auto_183676 ) ) ( not ( = ?auto_183677 ?auto_183675 ) ) ( not ( = ?auto_183681 ?auto_183679 ) ) ( not ( = ?auto_183681 ?auto_183676 ) ) ( not ( = ?auto_183681 ?auto_183675 ) ) ( not ( = ?auto_183674 ?auto_183680 ) ) ( not ( = ?auto_183674 ?auto_183678 ) ) ( not ( = ?auto_183674 ?auto_183682 ) ) ( not ( = ?auto_183674 ?auto_183677 ) ) ( not ( = ?auto_183674 ?auto_183681 ) ) ( ON ?auto_183674 ?auto_183675 ) ( CLEAR ?auto_183674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183680 ?auto_183678 ?auto_183682 ?auto_183677 ?auto_183681 ?auto_183679 ?auto_183676 ?auto_183675 )
      ( MAKE-3PILE ?auto_183674 ?auto_183675 ?auto_183676 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183688 - BLOCK
      ?auto_183689 - BLOCK
      ?auto_183690 - BLOCK
      ?auto_183691 - BLOCK
      ?auto_183692 - BLOCK
    )
    :vars
    (
      ?auto_183693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183693 ?auto_183692 ) ( CLEAR ?auto_183693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183688 ) ( ON ?auto_183689 ?auto_183688 ) ( ON ?auto_183690 ?auto_183689 ) ( ON ?auto_183691 ?auto_183690 ) ( ON ?auto_183692 ?auto_183691 ) ( not ( = ?auto_183688 ?auto_183689 ) ) ( not ( = ?auto_183688 ?auto_183690 ) ) ( not ( = ?auto_183688 ?auto_183691 ) ) ( not ( = ?auto_183688 ?auto_183692 ) ) ( not ( = ?auto_183688 ?auto_183693 ) ) ( not ( = ?auto_183689 ?auto_183690 ) ) ( not ( = ?auto_183689 ?auto_183691 ) ) ( not ( = ?auto_183689 ?auto_183692 ) ) ( not ( = ?auto_183689 ?auto_183693 ) ) ( not ( = ?auto_183690 ?auto_183691 ) ) ( not ( = ?auto_183690 ?auto_183692 ) ) ( not ( = ?auto_183690 ?auto_183693 ) ) ( not ( = ?auto_183691 ?auto_183692 ) ) ( not ( = ?auto_183691 ?auto_183693 ) ) ( not ( = ?auto_183692 ?auto_183693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183693 ?auto_183692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183694 - BLOCK
      ?auto_183695 - BLOCK
      ?auto_183696 - BLOCK
      ?auto_183697 - BLOCK
      ?auto_183698 - BLOCK
    )
    :vars
    (
      ?auto_183699 - BLOCK
      ?auto_183700 - BLOCK
      ?auto_183701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183699 ?auto_183698 ) ( CLEAR ?auto_183699 ) ( ON-TABLE ?auto_183694 ) ( ON ?auto_183695 ?auto_183694 ) ( ON ?auto_183696 ?auto_183695 ) ( ON ?auto_183697 ?auto_183696 ) ( ON ?auto_183698 ?auto_183697 ) ( not ( = ?auto_183694 ?auto_183695 ) ) ( not ( = ?auto_183694 ?auto_183696 ) ) ( not ( = ?auto_183694 ?auto_183697 ) ) ( not ( = ?auto_183694 ?auto_183698 ) ) ( not ( = ?auto_183694 ?auto_183699 ) ) ( not ( = ?auto_183695 ?auto_183696 ) ) ( not ( = ?auto_183695 ?auto_183697 ) ) ( not ( = ?auto_183695 ?auto_183698 ) ) ( not ( = ?auto_183695 ?auto_183699 ) ) ( not ( = ?auto_183696 ?auto_183697 ) ) ( not ( = ?auto_183696 ?auto_183698 ) ) ( not ( = ?auto_183696 ?auto_183699 ) ) ( not ( = ?auto_183697 ?auto_183698 ) ) ( not ( = ?auto_183697 ?auto_183699 ) ) ( not ( = ?auto_183698 ?auto_183699 ) ) ( HOLDING ?auto_183700 ) ( CLEAR ?auto_183701 ) ( not ( = ?auto_183694 ?auto_183700 ) ) ( not ( = ?auto_183694 ?auto_183701 ) ) ( not ( = ?auto_183695 ?auto_183700 ) ) ( not ( = ?auto_183695 ?auto_183701 ) ) ( not ( = ?auto_183696 ?auto_183700 ) ) ( not ( = ?auto_183696 ?auto_183701 ) ) ( not ( = ?auto_183697 ?auto_183700 ) ) ( not ( = ?auto_183697 ?auto_183701 ) ) ( not ( = ?auto_183698 ?auto_183700 ) ) ( not ( = ?auto_183698 ?auto_183701 ) ) ( not ( = ?auto_183699 ?auto_183700 ) ) ( not ( = ?auto_183699 ?auto_183701 ) ) ( not ( = ?auto_183700 ?auto_183701 ) ) )
    :subtasks
    ( ( !STACK ?auto_183700 ?auto_183701 )
      ( MAKE-5PILE ?auto_183694 ?auto_183695 ?auto_183696 ?auto_183697 ?auto_183698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183702 - BLOCK
      ?auto_183703 - BLOCK
      ?auto_183704 - BLOCK
      ?auto_183705 - BLOCK
      ?auto_183706 - BLOCK
    )
    :vars
    (
      ?auto_183709 - BLOCK
      ?auto_183708 - BLOCK
      ?auto_183707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183709 ?auto_183706 ) ( ON-TABLE ?auto_183702 ) ( ON ?auto_183703 ?auto_183702 ) ( ON ?auto_183704 ?auto_183703 ) ( ON ?auto_183705 ?auto_183704 ) ( ON ?auto_183706 ?auto_183705 ) ( not ( = ?auto_183702 ?auto_183703 ) ) ( not ( = ?auto_183702 ?auto_183704 ) ) ( not ( = ?auto_183702 ?auto_183705 ) ) ( not ( = ?auto_183702 ?auto_183706 ) ) ( not ( = ?auto_183702 ?auto_183709 ) ) ( not ( = ?auto_183703 ?auto_183704 ) ) ( not ( = ?auto_183703 ?auto_183705 ) ) ( not ( = ?auto_183703 ?auto_183706 ) ) ( not ( = ?auto_183703 ?auto_183709 ) ) ( not ( = ?auto_183704 ?auto_183705 ) ) ( not ( = ?auto_183704 ?auto_183706 ) ) ( not ( = ?auto_183704 ?auto_183709 ) ) ( not ( = ?auto_183705 ?auto_183706 ) ) ( not ( = ?auto_183705 ?auto_183709 ) ) ( not ( = ?auto_183706 ?auto_183709 ) ) ( CLEAR ?auto_183708 ) ( not ( = ?auto_183702 ?auto_183707 ) ) ( not ( = ?auto_183702 ?auto_183708 ) ) ( not ( = ?auto_183703 ?auto_183707 ) ) ( not ( = ?auto_183703 ?auto_183708 ) ) ( not ( = ?auto_183704 ?auto_183707 ) ) ( not ( = ?auto_183704 ?auto_183708 ) ) ( not ( = ?auto_183705 ?auto_183707 ) ) ( not ( = ?auto_183705 ?auto_183708 ) ) ( not ( = ?auto_183706 ?auto_183707 ) ) ( not ( = ?auto_183706 ?auto_183708 ) ) ( not ( = ?auto_183709 ?auto_183707 ) ) ( not ( = ?auto_183709 ?auto_183708 ) ) ( not ( = ?auto_183707 ?auto_183708 ) ) ( ON ?auto_183707 ?auto_183709 ) ( CLEAR ?auto_183707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183702 ?auto_183703 ?auto_183704 ?auto_183705 ?auto_183706 ?auto_183709 )
      ( MAKE-5PILE ?auto_183702 ?auto_183703 ?auto_183704 ?auto_183705 ?auto_183706 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183710 - BLOCK
      ?auto_183711 - BLOCK
      ?auto_183712 - BLOCK
      ?auto_183713 - BLOCK
      ?auto_183714 - BLOCK
    )
    :vars
    (
      ?auto_183716 - BLOCK
      ?auto_183715 - BLOCK
      ?auto_183717 - BLOCK
      ?auto_183718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183716 ?auto_183714 ) ( ON-TABLE ?auto_183710 ) ( ON ?auto_183711 ?auto_183710 ) ( ON ?auto_183712 ?auto_183711 ) ( ON ?auto_183713 ?auto_183712 ) ( ON ?auto_183714 ?auto_183713 ) ( not ( = ?auto_183710 ?auto_183711 ) ) ( not ( = ?auto_183710 ?auto_183712 ) ) ( not ( = ?auto_183710 ?auto_183713 ) ) ( not ( = ?auto_183710 ?auto_183714 ) ) ( not ( = ?auto_183710 ?auto_183716 ) ) ( not ( = ?auto_183711 ?auto_183712 ) ) ( not ( = ?auto_183711 ?auto_183713 ) ) ( not ( = ?auto_183711 ?auto_183714 ) ) ( not ( = ?auto_183711 ?auto_183716 ) ) ( not ( = ?auto_183712 ?auto_183713 ) ) ( not ( = ?auto_183712 ?auto_183714 ) ) ( not ( = ?auto_183712 ?auto_183716 ) ) ( not ( = ?auto_183713 ?auto_183714 ) ) ( not ( = ?auto_183713 ?auto_183716 ) ) ( not ( = ?auto_183714 ?auto_183716 ) ) ( not ( = ?auto_183710 ?auto_183715 ) ) ( not ( = ?auto_183710 ?auto_183717 ) ) ( not ( = ?auto_183711 ?auto_183715 ) ) ( not ( = ?auto_183711 ?auto_183717 ) ) ( not ( = ?auto_183712 ?auto_183715 ) ) ( not ( = ?auto_183712 ?auto_183717 ) ) ( not ( = ?auto_183713 ?auto_183715 ) ) ( not ( = ?auto_183713 ?auto_183717 ) ) ( not ( = ?auto_183714 ?auto_183715 ) ) ( not ( = ?auto_183714 ?auto_183717 ) ) ( not ( = ?auto_183716 ?auto_183715 ) ) ( not ( = ?auto_183716 ?auto_183717 ) ) ( not ( = ?auto_183715 ?auto_183717 ) ) ( ON ?auto_183715 ?auto_183716 ) ( CLEAR ?auto_183715 ) ( HOLDING ?auto_183717 ) ( CLEAR ?auto_183718 ) ( ON-TABLE ?auto_183718 ) ( not ( = ?auto_183718 ?auto_183717 ) ) ( not ( = ?auto_183710 ?auto_183718 ) ) ( not ( = ?auto_183711 ?auto_183718 ) ) ( not ( = ?auto_183712 ?auto_183718 ) ) ( not ( = ?auto_183713 ?auto_183718 ) ) ( not ( = ?auto_183714 ?auto_183718 ) ) ( not ( = ?auto_183716 ?auto_183718 ) ) ( not ( = ?auto_183715 ?auto_183718 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183718 ?auto_183717 )
      ( MAKE-5PILE ?auto_183710 ?auto_183711 ?auto_183712 ?auto_183713 ?auto_183714 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183719 - BLOCK
      ?auto_183720 - BLOCK
      ?auto_183721 - BLOCK
      ?auto_183722 - BLOCK
      ?auto_183723 - BLOCK
    )
    :vars
    (
      ?auto_183727 - BLOCK
      ?auto_183726 - BLOCK
      ?auto_183725 - BLOCK
      ?auto_183724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183727 ?auto_183723 ) ( ON-TABLE ?auto_183719 ) ( ON ?auto_183720 ?auto_183719 ) ( ON ?auto_183721 ?auto_183720 ) ( ON ?auto_183722 ?auto_183721 ) ( ON ?auto_183723 ?auto_183722 ) ( not ( = ?auto_183719 ?auto_183720 ) ) ( not ( = ?auto_183719 ?auto_183721 ) ) ( not ( = ?auto_183719 ?auto_183722 ) ) ( not ( = ?auto_183719 ?auto_183723 ) ) ( not ( = ?auto_183719 ?auto_183727 ) ) ( not ( = ?auto_183720 ?auto_183721 ) ) ( not ( = ?auto_183720 ?auto_183722 ) ) ( not ( = ?auto_183720 ?auto_183723 ) ) ( not ( = ?auto_183720 ?auto_183727 ) ) ( not ( = ?auto_183721 ?auto_183722 ) ) ( not ( = ?auto_183721 ?auto_183723 ) ) ( not ( = ?auto_183721 ?auto_183727 ) ) ( not ( = ?auto_183722 ?auto_183723 ) ) ( not ( = ?auto_183722 ?auto_183727 ) ) ( not ( = ?auto_183723 ?auto_183727 ) ) ( not ( = ?auto_183719 ?auto_183726 ) ) ( not ( = ?auto_183719 ?auto_183725 ) ) ( not ( = ?auto_183720 ?auto_183726 ) ) ( not ( = ?auto_183720 ?auto_183725 ) ) ( not ( = ?auto_183721 ?auto_183726 ) ) ( not ( = ?auto_183721 ?auto_183725 ) ) ( not ( = ?auto_183722 ?auto_183726 ) ) ( not ( = ?auto_183722 ?auto_183725 ) ) ( not ( = ?auto_183723 ?auto_183726 ) ) ( not ( = ?auto_183723 ?auto_183725 ) ) ( not ( = ?auto_183727 ?auto_183726 ) ) ( not ( = ?auto_183727 ?auto_183725 ) ) ( not ( = ?auto_183726 ?auto_183725 ) ) ( ON ?auto_183726 ?auto_183727 ) ( CLEAR ?auto_183724 ) ( ON-TABLE ?auto_183724 ) ( not ( = ?auto_183724 ?auto_183725 ) ) ( not ( = ?auto_183719 ?auto_183724 ) ) ( not ( = ?auto_183720 ?auto_183724 ) ) ( not ( = ?auto_183721 ?auto_183724 ) ) ( not ( = ?auto_183722 ?auto_183724 ) ) ( not ( = ?auto_183723 ?auto_183724 ) ) ( not ( = ?auto_183727 ?auto_183724 ) ) ( not ( = ?auto_183726 ?auto_183724 ) ) ( ON ?auto_183725 ?auto_183726 ) ( CLEAR ?auto_183725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183719 ?auto_183720 ?auto_183721 ?auto_183722 ?auto_183723 ?auto_183727 ?auto_183726 )
      ( MAKE-5PILE ?auto_183719 ?auto_183720 ?auto_183721 ?auto_183722 ?auto_183723 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183728 - BLOCK
      ?auto_183729 - BLOCK
      ?auto_183730 - BLOCK
      ?auto_183731 - BLOCK
      ?auto_183732 - BLOCK
    )
    :vars
    (
      ?auto_183736 - BLOCK
      ?auto_183735 - BLOCK
      ?auto_183733 - BLOCK
      ?auto_183734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183736 ?auto_183732 ) ( ON-TABLE ?auto_183728 ) ( ON ?auto_183729 ?auto_183728 ) ( ON ?auto_183730 ?auto_183729 ) ( ON ?auto_183731 ?auto_183730 ) ( ON ?auto_183732 ?auto_183731 ) ( not ( = ?auto_183728 ?auto_183729 ) ) ( not ( = ?auto_183728 ?auto_183730 ) ) ( not ( = ?auto_183728 ?auto_183731 ) ) ( not ( = ?auto_183728 ?auto_183732 ) ) ( not ( = ?auto_183728 ?auto_183736 ) ) ( not ( = ?auto_183729 ?auto_183730 ) ) ( not ( = ?auto_183729 ?auto_183731 ) ) ( not ( = ?auto_183729 ?auto_183732 ) ) ( not ( = ?auto_183729 ?auto_183736 ) ) ( not ( = ?auto_183730 ?auto_183731 ) ) ( not ( = ?auto_183730 ?auto_183732 ) ) ( not ( = ?auto_183730 ?auto_183736 ) ) ( not ( = ?auto_183731 ?auto_183732 ) ) ( not ( = ?auto_183731 ?auto_183736 ) ) ( not ( = ?auto_183732 ?auto_183736 ) ) ( not ( = ?auto_183728 ?auto_183735 ) ) ( not ( = ?auto_183728 ?auto_183733 ) ) ( not ( = ?auto_183729 ?auto_183735 ) ) ( not ( = ?auto_183729 ?auto_183733 ) ) ( not ( = ?auto_183730 ?auto_183735 ) ) ( not ( = ?auto_183730 ?auto_183733 ) ) ( not ( = ?auto_183731 ?auto_183735 ) ) ( not ( = ?auto_183731 ?auto_183733 ) ) ( not ( = ?auto_183732 ?auto_183735 ) ) ( not ( = ?auto_183732 ?auto_183733 ) ) ( not ( = ?auto_183736 ?auto_183735 ) ) ( not ( = ?auto_183736 ?auto_183733 ) ) ( not ( = ?auto_183735 ?auto_183733 ) ) ( ON ?auto_183735 ?auto_183736 ) ( not ( = ?auto_183734 ?auto_183733 ) ) ( not ( = ?auto_183728 ?auto_183734 ) ) ( not ( = ?auto_183729 ?auto_183734 ) ) ( not ( = ?auto_183730 ?auto_183734 ) ) ( not ( = ?auto_183731 ?auto_183734 ) ) ( not ( = ?auto_183732 ?auto_183734 ) ) ( not ( = ?auto_183736 ?auto_183734 ) ) ( not ( = ?auto_183735 ?auto_183734 ) ) ( ON ?auto_183733 ?auto_183735 ) ( CLEAR ?auto_183733 ) ( HOLDING ?auto_183734 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183734 )
      ( MAKE-5PILE ?auto_183728 ?auto_183729 ?auto_183730 ?auto_183731 ?auto_183732 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183737 - BLOCK
      ?auto_183738 - BLOCK
      ?auto_183739 - BLOCK
      ?auto_183740 - BLOCK
      ?auto_183741 - BLOCK
    )
    :vars
    (
      ?auto_183742 - BLOCK
      ?auto_183743 - BLOCK
      ?auto_183744 - BLOCK
      ?auto_183745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183742 ?auto_183741 ) ( ON-TABLE ?auto_183737 ) ( ON ?auto_183738 ?auto_183737 ) ( ON ?auto_183739 ?auto_183738 ) ( ON ?auto_183740 ?auto_183739 ) ( ON ?auto_183741 ?auto_183740 ) ( not ( = ?auto_183737 ?auto_183738 ) ) ( not ( = ?auto_183737 ?auto_183739 ) ) ( not ( = ?auto_183737 ?auto_183740 ) ) ( not ( = ?auto_183737 ?auto_183741 ) ) ( not ( = ?auto_183737 ?auto_183742 ) ) ( not ( = ?auto_183738 ?auto_183739 ) ) ( not ( = ?auto_183738 ?auto_183740 ) ) ( not ( = ?auto_183738 ?auto_183741 ) ) ( not ( = ?auto_183738 ?auto_183742 ) ) ( not ( = ?auto_183739 ?auto_183740 ) ) ( not ( = ?auto_183739 ?auto_183741 ) ) ( not ( = ?auto_183739 ?auto_183742 ) ) ( not ( = ?auto_183740 ?auto_183741 ) ) ( not ( = ?auto_183740 ?auto_183742 ) ) ( not ( = ?auto_183741 ?auto_183742 ) ) ( not ( = ?auto_183737 ?auto_183743 ) ) ( not ( = ?auto_183737 ?auto_183744 ) ) ( not ( = ?auto_183738 ?auto_183743 ) ) ( not ( = ?auto_183738 ?auto_183744 ) ) ( not ( = ?auto_183739 ?auto_183743 ) ) ( not ( = ?auto_183739 ?auto_183744 ) ) ( not ( = ?auto_183740 ?auto_183743 ) ) ( not ( = ?auto_183740 ?auto_183744 ) ) ( not ( = ?auto_183741 ?auto_183743 ) ) ( not ( = ?auto_183741 ?auto_183744 ) ) ( not ( = ?auto_183742 ?auto_183743 ) ) ( not ( = ?auto_183742 ?auto_183744 ) ) ( not ( = ?auto_183743 ?auto_183744 ) ) ( ON ?auto_183743 ?auto_183742 ) ( not ( = ?auto_183745 ?auto_183744 ) ) ( not ( = ?auto_183737 ?auto_183745 ) ) ( not ( = ?auto_183738 ?auto_183745 ) ) ( not ( = ?auto_183739 ?auto_183745 ) ) ( not ( = ?auto_183740 ?auto_183745 ) ) ( not ( = ?auto_183741 ?auto_183745 ) ) ( not ( = ?auto_183742 ?auto_183745 ) ) ( not ( = ?auto_183743 ?auto_183745 ) ) ( ON ?auto_183744 ?auto_183743 ) ( ON ?auto_183745 ?auto_183744 ) ( CLEAR ?auto_183745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183737 ?auto_183738 ?auto_183739 ?auto_183740 ?auto_183741 ?auto_183742 ?auto_183743 ?auto_183744 )
      ( MAKE-5PILE ?auto_183737 ?auto_183738 ?auto_183739 ?auto_183740 ?auto_183741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183750 - BLOCK
      ?auto_183751 - BLOCK
      ?auto_183752 - BLOCK
      ?auto_183753 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_183753 ) ( CLEAR ?auto_183752 ) ( ON-TABLE ?auto_183750 ) ( ON ?auto_183751 ?auto_183750 ) ( ON ?auto_183752 ?auto_183751 ) ( not ( = ?auto_183750 ?auto_183751 ) ) ( not ( = ?auto_183750 ?auto_183752 ) ) ( not ( = ?auto_183750 ?auto_183753 ) ) ( not ( = ?auto_183751 ?auto_183752 ) ) ( not ( = ?auto_183751 ?auto_183753 ) ) ( not ( = ?auto_183752 ?auto_183753 ) ) )
    :subtasks
    ( ( !STACK ?auto_183753 ?auto_183752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183754 - BLOCK
      ?auto_183755 - BLOCK
      ?auto_183756 - BLOCK
      ?auto_183757 - BLOCK
    )
    :vars
    (
      ?auto_183758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183756 ) ( ON-TABLE ?auto_183754 ) ( ON ?auto_183755 ?auto_183754 ) ( ON ?auto_183756 ?auto_183755 ) ( not ( = ?auto_183754 ?auto_183755 ) ) ( not ( = ?auto_183754 ?auto_183756 ) ) ( not ( = ?auto_183754 ?auto_183757 ) ) ( not ( = ?auto_183755 ?auto_183756 ) ) ( not ( = ?auto_183755 ?auto_183757 ) ) ( not ( = ?auto_183756 ?auto_183757 ) ) ( ON ?auto_183757 ?auto_183758 ) ( CLEAR ?auto_183757 ) ( HAND-EMPTY ) ( not ( = ?auto_183754 ?auto_183758 ) ) ( not ( = ?auto_183755 ?auto_183758 ) ) ( not ( = ?auto_183756 ?auto_183758 ) ) ( not ( = ?auto_183757 ?auto_183758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183757 ?auto_183758 )
      ( MAKE-4PILE ?auto_183754 ?auto_183755 ?auto_183756 ?auto_183757 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183759 - BLOCK
      ?auto_183760 - BLOCK
      ?auto_183761 - BLOCK
      ?auto_183762 - BLOCK
    )
    :vars
    (
      ?auto_183763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183759 ) ( ON ?auto_183760 ?auto_183759 ) ( not ( = ?auto_183759 ?auto_183760 ) ) ( not ( = ?auto_183759 ?auto_183761 ) ) ( not ( = ?auto_183759 ?auto_183762 ) ) ( not ( = ?auto_183760 ?auto_183761 ) ) ( not ( = ?auto_183760 ?auto_183762 ) ) ( not ( = ?auto_183761 ?auto_183762 ) ) ( ON ?auto_183762 ?auto_183763 ) ( CLEAR ?auto_183762 ) ( not ( = ?auto_183759 ?auto_183763 ) ) ( not ( = ?auto_183760 ?auto_183763 ) ) ( not ( = ?auto_183761 ?auto_183763 ) ) ( not ( = ?auto_183762 ?auto_183763 ) ) ( HOLDING ?auto_183761 ) ( CLEAR ?auto_183760 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183759 ?auto_183760 ?auto_183761 )
      ( MAKE-4PILE ?auto_183759 ?auto_183760 ?auto_183761 ?auto_183762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183764 - BLOCK
      ?auto_183765 - BLOCK
      ?auto_183766 - BLOCK
      ?auto_183767 - BLOCK
    )
    :vars
    (
      ?auto_183768 - BLOCK
      ?auto_183772 - BLOCK
      ?auto_183769 - BLOCK
      ?auto_183771 - BLOCK
      ?auto_183770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183764 ) ( ON ?auto_183765 ?auto_183764 ) ( not ( = ?auto_183764 ?auto_183765 ) ) ( not ( = ?auto_183764 ?auto_183766 ) ) ( not ( = ?auto_183764 ?auto_183767 ) ) ( not ( = ?auto_183765 ?auto_183766 ) ) ( not ( = ?auto_183765 ?auto_183767 ) ) ( not ( = ?auto_183766 ?auto_183767 ) ) ( ON ?auto_183767 ?auto_183768 ) ( not ( = ?auto_183764 ?auto_183768 ) ) ( not ( = ?auto_183765 ?auto_183768 ) ) ( not ( = ?auto_183766 ?auto_183768 ) ) ( not ( = ?auto_183767 ?auto_183768 ) ) ( CLEAR ?auto_183765 ) ( ON ?auto_183766 ?auto_183767 ) ( CLEAR ?auto_183766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183772 ) ( ON ?auto_183769 ?auto_183772 ) ( ON ?auto_183771 ?auto_183769 ) ( ON ?auto_183770 ?auto_183771 ) ( ON ?auto_183768 ?auto_183770 ) ( not ( = ?auto_183772 ?auto_183769 ) ) ( not ( = ?auto_183772 ?auto_183771 ) ) ( not ( = ?auto_183772 ?auto_183770 ) ) ( not ( = ?auto_183772 ?auto_183768 ) ) ( not ( = ?auto_183772 ?auto_183767 ) ) ( not ( = ?auto_183772 ?auto_183766 ) ) ( not ( = ?auto_183769 ?auto_183771 ) ) ( not ( = ?auto_183769 ?auto_183770 ) ) ( not ( = ?auto_183769 ?auto_183768 ) ) ( not ( = ?auto_183769 ?auto_183767 ) ) ( not ( = ?auto_183769 ?auto_183766 ) ) ( not ( = ?auto_183771 ?auto_183770 ) ) ( not ( = ?auto_183771 ?auto_183768 ) ) ( not ( = ?auto_183771 ?auto_183767 ) ) ( not ( = ?auto_183771 ?auto_183766 ) ) ( not ( = ?auto_183770 ?auto_183768 ) ) ( not ( = ?auto_183770 ?auto_183767 ) ) ( not ( = ?auto_183770 ?auto_183766 ) ) ( not ( = ?auto_183764 ?auto_183772 ) ) ( not ( = ?auto_183764 ?auto_183769 ) ) ( not ( = ?auto_183764 ?auto_183771 ) ) ( not ( = ?auto_183764 ?auto_183770 ) ) ( not ( = ?auto_183765 ?auto_183772 ) ) ( not ( = ?auto_183765 ?auto_183769 ) ) ( not ( = ?auto_183765 ?auto_183771 ) ) ( not ( = ?auto_183765 ?auto_183770 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183772 ?auto_183769 ?auto_183771 ?auto_183770 ?auto_183768 ?auto_183767 )
      ( MAKE-4PILE ?auto_183764 ?auto_183765 ?auto_183766 ?auto_183767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183773 - BLOCK
      ?auto_183774 - BLOCK
      ?auto_183775 - BLOCK
      ?auto_183776 - BLOCK
    )
    :vars
    (
      ?auto_183778 - BLOCK
      ?auto_183779 - BLOCK
      ?auto_183781 - BLOCK
      ?auto_183780 - BLOCK
      ?auto_183777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183773 ) ( not ( = ?auto_183773 ?auto_183774 ) ) ( not ( = ?auto_183773 ?auto_183775 ) ) ( not ( = ?auto_183773 ?auto_183776 ) ) ( not ( = ?auto_183774 ?auto_183775 ) ) ( not ( = ?auto_183774 ?auto_183776 ) ) ( not ( = ?auto_183775 ?auto_183776 ) ) ( ON ?auto_183776 ?auto_183778 ) ( not ( = ?auto_183773 ?auto_183778 ) ) ( not ( = ?auto_183774 ?auto_183778 ) ) ( not ( = ?auto_183775 ?auto_183778 ) ) ( not ( = ?auto_183776 ?auto_183778 ) ) ( ON ?auto_183775 ?auto_183776 ) ( CLEAR ?auto_183775 ) ( ON-TABLE ?auto_183779 ) ( ON ?auto_183781 ?auto_183779 ) ( ON ?auto_183780 ?auto_183781 ) ( ON ?auto_183777 ?auto_183780 ) ( ON ?auto_183778 ?auto_183777 ) ( not ( = ?auto_183779 ?auto_183781 ) ) ( not ( = ?auto_183779 ?auto_183780 ) ) ( not ( = ?auto_183779 ?auto_183777 ) ) ( not ( = ?auto_183779 ?auto_183778 ) ) ( not ( = ?auto_183779 ?auto_183776 ) ) ( not ( = ?auto_183779 ?auto_183775 ) ) ( not ( = ?auto_183781 ?auto_183780 ) ) ( not ( = ?auto_183781 ?auto_183777 ) ) ( not ( = ?auto_183781 ?auto_183778 ) ) ( not ( = ?auto_183781 ?auto_183776 ) ) ( not ( = ?auto_183781 ?auto_183775 ) ) ( not ( = ?auto_183780 ?auto_183777 ) ) ( not ( = ?auto_183780 ?auto_183778 ) ) ( not ( = ?auto_183780 ?auto_183776 ) ) ( not ( = ?auto_183780 ?auto_183775 ) ) ( not ( = ?auto_183777 ?auto_183778 ) ) ( not ( = ?auto_183777 ?auto_183776 ) ) ( not ( = ?auto_183777 ?auto_183775 ) ) ( not ( = ?auto_183773 ?auto_183779 ) ) ( not ( = ?auto_183773 ?auto_183781 ) ) ( not ( = ?auto_183773 ?auto_183780 ) ) ( not ( = ?auto_183773 ?auto_183777 ) ) ( not ( = ?auto_183774 ?auto_183779 ) ) ( not ( = ?auto_183774 ?auto_183781 ) ) ( not ( = ?auto_183774 ?auto_183780 ) ) ( not ( = ?auto_183774 ?auto_183777 ) ) ( HOLDING ?auto_183774 ) ( CLEAR ?auto_183773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183773 ?auto_183774 )
      ( MAKE-4PILE ?auto_183773 ?auto_183774 ?auto_183775 ?auto_183776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183782 - BLOCK
      ?auto_183783 - BLOCK
      ?auto_183784 - BLOCK
      ?auto_183785 - BLOCK
    )
    :vars
    (
      ?auto_183786 - BLOCK
      ?auto_183789 - BLOCK
      ?auto_183790 - BLOCK
      ?auto_183787 - BLOCK
      ?auto_183788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183782 ) ( not ( = ?auto_183782 ?auto_183783 ) ) ( not ( = ?auto_183782 ?auto_183784 ) ) ( not ( = ?auto_183782 ?auto_183785 ) ) ( not ( = ?auto_183783 ?auto_183784 ) ) ( not ( = ?auto_183783 ?auto_183785 ) ) ( not ( = ?auto_183784 ?auto_183785 ) ) ( ON ?auto_183785 ?auto_183786 ) ( not ( = ?auto_183782 ?auto_183786 ) ) ( not ( = ?auto_183783 ?auto_183786 ) ) ( not ( = ?auto_183784 ?auto_183786 ) ) ( not ( = ?auto_183785 ?auto_183786 ) ) ( ON ?auto_183784 ?auto_183785 ) ( ON-TABLE ?auto_183789 ) ( ON ?auto_183790 ?auto_183789 ) ( ON ?auto_183787 ?auto_183790 ) ( ON ?auto_183788 ?auto_183787 ) ( ON ?auto_183786 ?auto_183788 ) ( not ( = ?auto_183789 ?auto_183790 ) ) ( not ( = ?auto_183789 ?auto_183787 ) ) ( not ( = ?auto_183789 ?auto_183788 ) ) ( not ( = ?auto_183789 ?auto_183786 ) ) ( not ( = ?auto_183789 ?auto_183785 ) ) ( not ( = ?auto_183789 ?auto_183784 ) ) ( not ( = ?auto_183790 ?auto_183787 ) ) ( not ( = ?auto_183790 ?auto_183788 ) ) ( not ( = ?auto_183790 ?auto_183786 ) ) ( not ( = ?auto_183790 ?auto_183785 ) ) ( not ( = ?auto_183790 ?auto_183784 ) ) ( not ( = ?auto_183787 ?auto_183788 ) ) ( not ( = ?auto_183787 ?auto_183786 ) ) ( not ( = ?auto_183787 ?auto_183785 ) ) ( not ( = ?auto_183787 ?auto_183784 ) ) ( not ( = ?auto_183788 ?auto_183786 ) ) ( not ( = ?auto_183788 ?auto_183785 ) ) ( not ( = ?auto_183788 ?auto_183784 ) ) ( not ( = ?auto_183782 ?auto_183789 ) ) ( not ( = ?auto_183782 ?auto_183790 ) ) ( not ( = ?auto_183782 ?auto_183787 ) ) ( not ( = ?auto_183782 ?auto_183788 ) ) ( not ( = ?auto_183783 ?auto_183789 ) ) ( not ( = ?auto_183783 ?auto_183790 ) ) ( not ( = ?auto_183783 ?auto_183787 ) ) ( not ( = ?auto_183783 ?auto_183788 ) ) ( CLEAR ?auto_183782 ) ( ON ?auto_183783 ?auto_183784 ) ( CLEAR ?auto_183783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183789 ?auto_183790 ?auto_183787 ?auto_183788 ?auto_183786 ?auto_183785 ?auto_183784 )
      ( MAKE-4PILE ?auto_183782 ?auto_183783 ?auto_183784 ?auto_183785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183791 - BLOCK
      ?auto_183792 - BLOCK
      ?auto_183793 - BLOCK
      ?auto_183794 - BLOCK
    )
    :vars
    (
      ?auto_183798 - BLOCK
      ?auto_183795 - BLOCK
      ?auto_183799 - BLOCK
      ?auto_183797 - BLOCK
      ?auto_183796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183791 ?auto_183792 ) ) ( not ( = ?auto_183791 ?auto_183793 ) ) ( not ( = ?auto_183791 ?auto_183794 ) ) ( not ( = ?auto_183792 ?auto_183793 ) ) ( not ( = ?auto_183792 ?auto_183794 ) ) ( not ( = ?auto_183793 ?auto_183794 ) ) ( ON ?auto_183794 ?auto_183798 ) ( not ( = ?auto_183791 ?auto_183798 ) ) ( not ( = ?auto_183792 ?auto_183798 ) ) ( not ( = ?auto_183793 ?auto_183798 ) ) ( not ( = ?auto_183794 ?auto_183798 ) ) ( ON ?auto_183793 ?auto_183794 ) ( ON-TABLE ?auto_183795 ) ( ON ?auto_183799 ?auto_183795 ) ( ON ?auto_183797 ?auto_183799 ) ( ON ?auto_183796 ?auto_183797 ) ( ON ?auto_183798 ?auto_183796 ) ( not ( = ?auto_183795 ?auto_183799 ) ) ( not ( = ?auto_183795 ?auto_183797 ) ) ( not ( = ?auto_183795 ?auto_183796 ) ) ( not ( = ?auto_183795 ?auto_183798 ) ) ( not ( = ?auto_183795 ?auto_183794 ) ) ( not ( = ?auto_183795 ?auto_183793 ) ) ( not ( = ?auto_183799 ?auto_183797 ) ) ( not ( = ?auto_183799 ?auto_183796 ) ) ( not ( = ?auto_183799 ?auto_183798 ) ) ( not ( = ?auto_183799 ?auto_183794 ) ) ( not ( = ?auto_183799 ?auto_183793 ) ) ( not ( = ?auto_183797 ?auto_183796 ) ) ( not ( = ?auto_183797 ?auto_183798 ) ) ( not ( = ?auto_183797 ?auto_183794 ) ) ( not ( = ?auto_183797 ?auto_183793 ) ) ( not ( = ?auto_183796 ?auto_183798 ) ) ( not ( = ?auto_183796 ?auto_183794 ) ) ( not ( = ?auto_183796 ?auto_183793 ) ) ( not ( = ?auto_183791 ?auto_183795 ) ) ( not ( = ?auto_183791 ?auto_183799 ) ) ( not ( = ?auto_183791 ?auto_183797 ) ) ( not ( = ?auto_183791 ?auto_183796 ) ) ( not ( = ?auto_183792 ?auto_183795 ) ) ( not ( = ?auto_183792 ?auto_183799 ) ) ( not ( = ?auto_183792 ?auto_183797 ) ) ( not ( = ?auto_183792 ?auto_183796 ) ) ( ON ?auto_183792 ?auto_183793 ) ( CLEAR ?auto_183792 ) ( HOLDING ?auto_183791 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183791 )
      ( MAKE-4PILE ?auto_183791 ?auto_183792 ?auto_183793 ?auto_183794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183800 - BLOCK
      ?auto_183801 - BLOCK
      ?auto_183802 - BLOCK
      ?auto_183803 - BLOCK
    )
    :vars
    (
      ?auto_183806 - BLOCK
      ?auto_183807 - BLOCK
      ?auto_183808 - BLOCK
      ?auto_183804 - BLOCK
      ?auto_183805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183800 ?auto_183801 ) ) ( not ( = ?auto_183800 ?auto_183802 ) ) ( not ( = ?auto_183800 ?auto_183803 ) ) ( not ( = ?auto_183801 ?auto_183802 ) ) ( not ( = ?auto_183801 ?auto_183803 ) ) ( not ( = ?auto_183802 ?auto_183803 ) ) ( ON ?auto_183803 ?auto_183806 ) ( not ( = ?auto_183800 ?auto_183806 ) ) ( not ( = ?auto_183801 ?auto_183806 ) ) ( not ( = ?auto_183802 ?auto_183806 ) ) ( not ( = ?auto_183803 ?auto_183806 ) ) ( ON ?auto_183802 ?auto_183803 ) ( ON-TABLE ?auto_183807 ) ( ON ?auto_183808 ?auto_183807 ) ( ON ?auto_183804 ?auto_183808 ) ( ON ?auto_183805 ?auto_183804 ) ( ON ?auto_183806 ?auto_183805 ) ( not ( = ?auto_183807 ?auto_183808 ) ) ( not ( = ?auto_183807 ?auto_183804 ) ) ( not ( = ?auto_183807 ?auto_183805 ) ) ( not ( = ?auto_183807 ?auto_183806 ) ) ( not ( = ?auto_183807 ?auto_183803 ) ) ( not ( = ?auto_183807 ?auto_183802 ) ) ( not ( = ?auto_183808 ?auto_183804 ) ) ( not ( = ?auto_183808 ?auto_183805 ) ) ( not ( = ?auto_183808 ?auto_183806 ) ) ( not ( = ?auto_183808 ?auto_183803 ) ) ( not ( = ?auto_183808 ?auto_183802 ) ) ( not ( = ?auto_183804 ?auto_183805 ) ) ( not ( = ?auto_183804 ?auto_183806 ) ) ( not ( = ?auto_183804 ?auto_183803 ) ) ( not ( = ?auto_183804 ?auto_183802 ) ) ( not ( = ?auto_183805 ?auto_183806 ) ) ( not ( = ?auto_183805 ?auto_183803 ) ) ( not ( = ?auto_183805 ?auto_183802 ) ) ( not ( = ?auto_183800 ?auto_183807 ) ) ( not ( = ?auto_183800 ?auto_183808 ) ) ( not ( = ?auto_183800 ?auto_183804 ) ) ( not ( = ?auto_183800 ?auto_183805 ) ) ( not ( = ?auto_183801 ?auto_183807 ) ) ( not ( = ?auto_183801 ?auto_183808 ) ) ( not ( = ?auto_183801 ?auto_183804 ) ) ( not ( = ?auto_183801 ?auto_183805 ) ) ( ON ?auto_183801 ?auto_183802 ) ( ON ?auto_183800 ?auto_183801 ) ( CLEAR ?auto_183800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183807 ?auto_183808 ?auto_183804 ?auto_183805 ?auto_183806 ?auto_183803 ?auto_183802 ?auto_183801 )
      ( MAKE-4PILE ?auto_183800 ?auto_183801 ?auto_183802 ?auto_183803 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183813 - BLOCK
      ?auto_183814 - BLOCK
      ?auto_183815 - BLOCK
      ?auto_183816 - BLOCK
    )
    :vars
    (
      ?auto_183817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183817 ?auto_183816 ) ( CLEAR ?auto_183817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183813 ) ( ON ?auto_183814 ?auto_183813 ) ( ON ?auto_183815 ?auto_183814 ) ( ON ?auto_183816 ?auto_183815 ) ( not ( = ?auto_183813 ?auto_183814 ) ) ( not ( = ?auto_183813 ?auto_183815 ) ) ( not ( = ?auto_183813 ?auto_183816 ) ) ( not ( = ?auto_183813 ?auto_183817 ) ) ( not ( = ?auto_183814 ?auto_183815 ) ) ( not ( = ?auto_183814 ?auto_183816 ) ) ( not ( = ?auto_183814 ?auto_183817 ) ) ( not ( = ?auto_183815 ?auto_183816 ) ) ( not ( = ?auto_183815 ?auto_183817 ) ) ( not ( = ?auto_183816 ?auto_183817 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183817 ?auto_183816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183818 - BLOCK
      ?auto_183819 - BLOCK
      ?auto_183820 - BLOCK
      ?auto_183821 - BLOCK
    )
    :vars
    (
      ?auto_183822 - BLOCK
      ?auto_183823 - BLOCK
      ?auto_183824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183822 ?auto_183821 ) ( CLEAR ?auto_183822 ) ( ON-TABLE ?auto_183818 ) ( ON ?auto_183819 ?auto_183818 ) ( ON ?auto_183820 ?auto_183819 ) ( ON ?auto_183821 ?auto_183820 ) ( not ( = ?auto_183818 ?auto_183819 ) ) ( not ( = ?auto_183818 ?auto_183820 ) ) ( not ( = ?auto_183818 ?auto_183821 ) ) ( not ( = ?auto_183818 ?auto_183822 ) ) ( not ( = ?auto_183819 ?auto_183820 ) ) ( not ( = ?auto_183819 ?auto_183821 ) ) ( not ( = ?auto_183819 ?auto_183822 ) ) ( not ( = ?auto_183820 ?auto_183821 ) ) ( not ( = ?auto_183820 ?auto_183822 ) ) ( not ( = ?auto_183821 ?auto_183822 ) ) ( HOLDING ?auto_183823 ) ( CLEAR ?auto_183824 ) ( not ( = ?auto_183818 ?auto_183823 ) ) ( not ( = ?auto_183818 ?auto_183824 ) ) ( not ( = ?auto_183819 ?auto_183823 ) ) ( not ( = ?auto_183819 ?auto_183824 ) ) ( not ( = ?auto_183820 ?auto_183823 ) ) ( not ( = ?auto_183820 ?auto_183824 ) ) ( not ( = ?auto_183821 ?auto_183823 ) ) ( not ( = ?auto_183821 ?auto_183824 ) ) ( not ( = ?auto_183822 ?auto_183823 ) ) ( not ( = ?auto_183822 ?auto_183824 ) ) ( not ( = ?auto_183823 ?auto_183824 ) ) )
    :subtasks
    ( ( !STACK ?auto_183823 ?auto_183824 )
      ( MAKE-4PILE ?auto_183818 ?auto_183819 ?auto_183820 ?auto_183821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183825 - BLOCK
      ?auto_183826 - BLOCK
      ?auto_183827 - BLOCK
      ?auto_183828 - BLOCK
    )
    :vars
    (
      ?auto_183829 - BLOCK
      ?auto_183830 - BLOCK
      ?auto_183831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183829 ?auto_183828 ) ( ON-TABLE ?auto_183825 ) ( ON ?auto_183826 ?auto_183825 ) ( ON ?auto_183827 ?auto_183826 ) ( ON ?auto_183828 ?auto_183827 ) ( not ( = ?auto_183825 ?auto_183826 ) ) ( not ( = ?auto_183825 ?auto_183827 ) ) ( not ( = ?auto_183825 ?auto_183828 ) ) ( not ( = ?auto_183825 ?auto_183829 ) ) ( not ( = ?auto_183826 ?auto_183827 ) ) ( not ( = ?auto_183826 ?auto_183828 ) ) ( not ( = ?auto_183826 ?auto_183829 ) ) ( not ( = ?auto_183827 ?auto_183828 ) ) ( not ( = ?auto_183827 ?auto_183829 ) ) ( not ( = ?auto_183828 ?auto_183829 ) ) ( CLEAR ?auto_183830 ) ( not ( = ?auto_183825 ?auto_183831 ) ) ( not ( = ?auto_183825 ?auto_183830 ) ) ( not ( = ?auto_183826 ?auto_183831 ) ) ( not ( = ?auto_183826 ?auto_183830 ) ) ( not ( = ?auto_183827 ?auto_183831 ) ) ( not ( = ?auto_183827 ?auto_183830 ) ) ( not ( = ?auto_183828 ?auto_183831 ) ) ( not ( = ?auto_183828 ?auto_183830 ) ) ( not ( = ?auto_183829 ?auto_183831 ) ) ( not ( = ?auto_183829 ?auto_183830 ) ) ( not ( = ?auto_183831 ?auto_183830 ) ) ( ON ?auto_183831 ?auto_183829 ) ( CLEAR ?auto_183831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183825 ?auto_183826 ?auto_183827 ?auto_183828 ?auto_183829 )
      ( MAKE-4PILE ?auto_183825 ?auto_183826 ?auto_183827 ?auto_183828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183832 - BLOCK
      ?auto_183833 - BLOCK
      ?auto_183834 - BLOCK
      ?auto_183835 - BLOCK
    )
    :vars
    (
      ?auto_183838 - BLOCK
      ?auto_183837 - BLOCK
      ?auto_183836 - BLOCK
      ?auto_183839 - BLOCK
      ?auto_183840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183838 ?auto_183835 ) ( ON-TABLE ?auto_183832 ) ( ON ?auto_183833 ?auto_183832 ) ( ON ?auto_183834 ?auto_183833 ) ( ON ?auto_183835 ?auto_183834 ) ( not ( = ?auto_183832 ?auto_183833 ) ) ( not ( = ?auto_183832 ?auto_183834 ) ) ( not ( = ?auto_183832 ?auto_183835 ) ) ( not ( = ?auto_183832 ?auto_183838 ) ) ( not ( = ?auto_183833 ?auto_183834 ) ) ( not ( = ?auto_183833 ?auto_183835 ) ) ( not ( = ?auto_183833 ?auto_183838 ) ) ( not ( = ?auto_183834 ?auto_183835 ) ) ( not ( = ?auto_183834 ?auto_183838 ) ) ( not ( = ?auto_183835 ?auto_183838 ) ) ( not ( = ?auto_183832 ?auto_183837 ) ) ( not ( = ?auto_183832 ?auto_183836 ) ) ( not ( = ?auto_183833 ?auto_183837 ) ) ( not ( = ?auto_183833 ?auto_183836 ) ) ( not ( = ?auto_183834 ?auto_183837 ) ) ( not ( = ?auto_183834 ?auto_183836 ) ) ( not ( = ?auto_183835 ?auto_183837 ) ) ( not ( = ?auto_183835 ?auto_183836 ) ) ( not ( = ?auto_183838 ?auto_183837 ) ) ( not ( = ?auto_183838 ?auto_183836 ) ) ( not ( = ?auto_183837 ?auto_183836 ) ) ( ON ?auto_183837 ?auto_183838 ) ( CLEAR ?auto_183837 ) ( HOLDING ?auto_183836 ) ( CLEAR ?auto_183839 ) ( ON-TABLE ?auto_183840 ) ( ON ?auto_183839 ?auto_183840 ) ( not ( = ?auto_183840 ?auto_183839 ) ) ( not ( = ?auto_183840 ?auto_183836 ) ) ( not ( = ?auto_183839 ?auto_183836 ) ) ( not ( = ?auto_183832 ?auto_183839 ) ) ( not ( = ?auto_183832 ?auto_183840 ) ) ( not ( = ?auto_183833 ?auto_183839 ) ) ( not ( = ?auto_183833 ?auto_183840 ) ) ( not ( = ?auto_183834 ?auto_183839 ) ) ( not ( = ?auto_183834 ?auto_183840 ) ) ( not ( = ?auto_183835 ?auto_183839 ) ) ( not ( = ?auto_183835 ?auto_183840 ) ) ( not ( = ?auto_183838 ?auto_183839 ) ) ( not ( = ?auto_183838 ?auto_183840 ) ) ( not ( = ?auto_183837 ?auto_183839 ) ) ( not ( = ?auto_183837 ?auto_183840 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183840 ?auto_183839 ?auto_183836 )
      ( MAKE-4PILE ?auto_183832 ?auto_183833 ?auto_183834 ?auto_183835 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183841 - BLOCK
      ?auto_183842 - BLOCK
      ?auto_183843 - BLOCK
      ?auto_183844 - BLOCK
    )
    :vars
    (
      ?auto_183849 - BLOCK
      ?auto_183847 - BLOCK
      ?auto_183846 - BLOCK
      ?auto_183848 - BLOCK
      ?auto_183845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183849 ?auto_183844 ) ( ON-TABLE ?auto_183841 ) ( ON ?auto_183842 ?auto_183841 ) ( ON ?auto_183843 ?auto_183842 ) ( ON ?auto_183844 ?auto_183843 ) ( not ( = ?auto_183841 ?auto_183842 ) ) ( not ( = ?auto_183841 ?auto_183843 ) ) ( not ( = ?auto_183841 ?auto_183844 ) ) ( not ( = ?auto_183841 ?auto_183849 ) ) ( not ( = ?auto_183842 ?auto_183843 ) ) ( not ( = ?auto_183842 ?auto_183844 ) ) ( not ( = ?auto_183842 ?auto_183849 ) ) ( not ( = ?auto_183843 ?auto_183844 ) ) ( not ( = ?auto_183843 ?auto_183849 ) ) ( not ( = ?auto_183844 ?auto_183849 ) ) ( not ( = ?auto_183841 ?auto_183847 ) ) ( not ( = ?auto_183841 ?auto_183846 ) ) ( not ( = ?auto_183842 ?auto_183847 ) ) ( not ( = ?auto_183842 ?auto_183846 ) ) ( not ( = ?auto_183843 ?auto_183847 ) ) ( not ( = ?auto_183843 ?auto_183846 ) ) ( not ( = ?auto_183844 ?auto_183847 ) ) ( not ( = ?auto_183844 ?auto_183846 ) ) ( not ( = ?auto_183849 ?auto_183847 ) ) ( not ( = ?auto_183849 ?auto_183846 ) ) ( not ( = ?auto_183847 ?auto_183846 ) ) ( ON ?auto_183847 ?auto_183849 ) ( CLEAR ?auto_183848 ) ( ON-TABLE ?auto_183845 ) ( ON ?auto_183848 ?auto_183845 ) ( not ( = ?auto_183845 ?auto_183848 ) ) ( not ( = ?auto_183845 ?auto_183846 ) ) ( not ( = ?auto_183848 ?auto_183846 ) ) ( not ( = ?auto_183841 ?auto_183848 ) ) ( not ( = ?auto_183841 ?auto_183845 ) ) ( not ( = ?auto_183842 ?auto_183848 ) ) ( not ( = ?auto_183842 ?auto_183845 ) ) ( not ( = ?auto_183843 ?auto_183848 ) ) ( not ( = ?auto_183843 ?auto_183845 ) ) ( not ( = ?auto_183844 ?auto_183848 ) ) ( not ( = ?auto_183844 ?auto_183845 ) ) ( not ( = ?auto_183849 ?auto_183848 ) ) ( not ( = ?auto_183849 ?auto_183845 ) ) ( not ( = ?auto_183847 ?auto_183848 ) ) ( not ( = ?auto_183847 ?auto_183845 ) ) ( ON ?auto_183846 ?auto_183847 ) ( CLEAR ?auto_183846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183841 ?auto_183842 ?auto_183843 ?auto_183844 ?auto_183849 ?auto_183847 )
      ( MAKE-4PILE ?auto_183841 ?auto_183842 ?auto_183843 ?auto_183844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183850 - BLOCK
      ?auto_183851 - BLOCK
      ?auto_183852 - BLOCK
      ?auto_183853 - BLOCK
    )
    :vars
    (
      ?auto_183854 - BLOCK
      ?auto_183855 - BLOCK
      ?auto_183856 - BLOCK
      ?auto_183858 - BLOCK
      ?auto_183857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183854 ?auto_183853 ) ( ON-TABLE ?auto_183850 ) ( ON ?auto_183851 ?auto_183850 ) ( ON ?auto_183852 ?auto_183851 ) ( ON ?auto_183853 ?auto_183852 ) ( not ( = ?auto_183850 ?auto_183851 ) ) ( not ( = ?auto_183850 ?auto_183852 ) ) ( not ( = ?auto_183850 ?auto_183853 ) ) ( not ( = ?auto_183850 ?auto_183854 ) ) ( not ( = ?auto_183851 ?auto_183852 ) ) ( not ( = ?auto_183851 ?auto_183853 ) ) ( not ( = ?auto_183851 ?auto_183854 ) ) ( not ( = ?auto_183852 ?auto_183853 ) ) ( not ( = ?auto_183852 ?auto_183854 ) ) ( not ( = ?auto_183853 ?auto_183854 ) ) ( not ( = ?auto_183850 ?auto_183855 ) ) ( not ( = ?auto_183850 ?auto_183856 ) ) ( not ( = ?auto_183851 ?auto_183855 ) ) ( not ( = ?auto_183851 ?auto_183856 ) ) ( not ( = ?auto_183852 ?auto_183855 ) ) ( not ( = ?auto_183852 ?auto_183856 ) ) ( not ( = ?auto_183853 ?auto_183855 ) ) ( not ( = ?auto_183853 ?auto_183856 ) ) ( not ( = ?auto_183854 ?auto_183855 ) ) ( not ( = ?auto_183854 ?auto_183856 ) ) ( not ( = ?auto_183855 ?auto_183856 ) ) ( ON ?auto_183855 ?auto_183854 ) ( ON-TABLE ?auto_183858 ) ( not ( = ?auto_183858 ?auto_183857 ) ) ( not ( = ?auto_183858 ?auto_183856 ) ) ( not ( = ?auto_183857 ?auto_183856 ) ) ( not ( = ?auto_183850 ?auto_183857 ) ) ( not ( = ?auto_183850 ?auto_183858 ) ) ( not ( = ?auto_183851 ?auto_183857 ) ) ( not ( = ?auto_183851 ?auto_183858 ) ) ( not ( = ?auto_183852 ?auto_183857 ) ) ( not ( = ?auto_183852 ?auto_183858 ) ) ( not ( = ?auto_183853 ?auto_183857 ) ) ( not ( = ?auto_183853 ?auto_183858 ) ) ( not ( = ?auto_183854 ?auto_183857 ) ) ( not ( = ?auto_183854 ?auto_183858 ) ) ( not ( = ?auto_183855 ?auto_183857 ) ) ( not ( = ?auto_183855 ?auto_183858 ) ) ( ON ?auto_183856 ?auto_183855 ) ( CLEAR ?auto_183856 ) ( HOLDING ?auto_183857 ) ( CLEAR ?auto_183858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183858 ?auto_183857 )
      ( MAKE-4PILE ?auto_183850 ?auto_183851 ?auto_183852 ?auto_183853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183859 - BLOCK
      ?auto_183860 - BLOCK
      ?auto_183861 - BLOCK
      ?auto_183862 - BLOCK
    )
    :vars
    (
      ?auto_183863 - BLOCK
      ?auto_183864 - BLOCK
      ?auto_183867 - BLOCK
      ?auto_183865 - BLOCK
      ?auto_183866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183863 ?auto_183862 ) ( ON-TABLE ?auto_183859 ) ( ON ?auto_183860 ?auto_183859 ) ( ON ?auto_183861 ?auto_183860 ) ( ON ?auto_183862 ?auto_183861 ) ( not ( = ?auto_183859 ?auto_183860 ) ) ( not ( = ?auto_183859 ?auto_183861 ) ) ( not ( = ?auto_183859 ?auto_183862 ) ) ( not ( = ?auto_183859 ?auto_183863 ) ) ( not ( = ?auto_183860 ?auto_183861 ) ) ( not ( = ?auto_183860 ?auto_183862 ) ) ( not ( = ?auto_183860 ?auto_183863 ) ) ( not ( = ?auto_183861 ?auto_183862 ) ) ( not ( = ?auto_183861 ?auto_183863 ) ) ( not ( = ?auto_183862 ?auto_183863 ) ) ( not ( = ?auto_183859 ?auto_183864 ) ) ( not ( = ?auto_183859 ?auto_183867 ) ) ( not ( = ?auto_183860 ?auto_183864 ) ) ( not ( = ?auto_183860 ?auto_183867 ) ) ( not ( = ?auto_183861 ?auto_183864 ) ) ( not ( = ?auto_183861 ?auto_183867 ) ) ( not ( = ?auto_183862 ?auto_183864 ) ) ( not ( = ?auto_183862 ?auto_183867 ) ) ( not ( = ?auto_183863 ?auto_183864 ) ) ( not ( = ?auto_183863 ?auto_183867 ) ) ( not ( = ?auto_183864 ?auto_183867 ) ) ( ON ?auto_183864 ?auto_183863 ) ( ON-TABLE ?auto_183865 ) ( not ( = ?auto_183865 ?auto_183866 ) ) ( not ( = ?auto_183865 ?auto_183867 ) ) ( not ( = ?auto_183866 ?auto_183867 ) ) ( not ( = ?auto_183859 ?auto_183866 ) ) ( not ( = ?auto_183859 ?auto_183865 ) ) ( not ( = ?auto_183860 ?auto_183866 ) ) ( not ( = ?auto_183860 ?auto_183865 ) ) ( not ( = ?auto_183861 ?auto_183866 ) ) ( not ( = ?auto_183861 ?auto_183865 ) ) ( not ( = ?auto_183862 ?auto_183866 ) ) ( not ( = ?auto_183862 ?auto_183865 ) ) ( not ( = ?auto_183863 ?auto_183866 ) ) ( not ( = ?auto_183863 ?auto_183865 ) ) ( not ( = ?auto_183864 ?auto_183866 ) ) ( not ( = ?auto_183864 ?auto_183865 ) ) ( ON ?auto_183867 ?auto_183864 ) ( CLEAR ?auto_183865 ) ( ON ?auto_183866 ?auto_183867 ) ( CLEAR ?auto_183866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183859 ?auto_183860 ?auto_183861 ?auto_183862 ?auto_183863 ?auto_183864 ?auto_183867 )
      ( MAKE-4PILE ?auto_183859 ?auto_183860 ?auto_183861 ?auto_183862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183868 - BLOCK
      ?auto_183869 - BLOCK
      ?auto_183870 - BLOCK
      ?auto_183871 - BLOCK
    )
    :vars
    (
      ?auto_183876 - BLOCK
      ?auto_183874 - BLOCK
      ?auto_183873 - BLOCK
      ?auto_183872 - BLOCK
      ?auto_183875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183876 ?auto_183871 ) ( ON-TABLE ?auto_183868 ) ( ON ?auto_183869 ?auto_183868 ) ( ON ?auto_183870 ?auto_183869 ) ( ON ?auto_183871 ?auto_183870 ) ( not ( = ?auto_183868 ?auto_183869 ) ) ( not ( = ?auto_183868 ?auto_183870 ) ) ( not ( = ?auto_183868 ?auto_183871 ) ) ( not ( = ?auto_183868 ?auto_183876 ) ) ( not ( = ?auto_183869 ?auto_183870 ) ) ( not ( = ?auto_183869 ?auto_183871 ) ) ( not ( = ?auto_183869 ?auto_183876 ) ) ( not ( = ?auto_183870 ?auto_183871 ) ) ( not ( = ?auto_183870 ?auto_183876 ) ) ( not ( = ?auto_183871 ?auto_183876 ) ) ( not ( = ?auto_183868 ?auto_183874 ) ) ( not ( = ?auto_183868 ?auto_183873 ) ) ( not ( = ?auto_183869 ?auto_183874 ) ) ( not ( = ?auto_183869 ?auto_183873 ) ) ( not ( = ?auto_183870 ?auto_183874 ) ) ( not ( = ?auto_183870 ?auto_183873 ) ) ( not ( = ?auto_183871 ?auto_183874 ) ) ( not ( = ?auto_183871 ?auto_183873 ) ) ( not ( = ?auto_183876 ?auto_183874 ) ) ( not ( = ?auto_183876 ?auto_183873 ) ) ( not ( = ?auto_183874 ?auto_183873 ) ) ( ON ?auto_183874 ?auto_183876 ) ( not ( = ?auto_183872 ?auto_183875 ) ) ( not ( = ?auto_183872 ?auto_183873 ) ) ( not ( = ?auto_183875 ?auto_183873 ) ) ( not ( = ?auto_183868 ?auto_183875 ) ) ( not ( = ?auto_183868 ?auto_183872 ) ) ( not ( = ?auto_183869 ?auto_183875 ) ) ( not ( = ?auto_183869 ?auto_183872 ) ) ( not ( = ?auto_183870 ?auto_183875 ) ) ( not ( = ?auto_183870 ?auto_183872 ) ) ( not ( = ?auto_183871 ?auto_183875 ) ) ( not ( = ?auto_183871 ?auto_183872 ) ) ( not ( = ?auto_183876 ?auto_183875 ) ) ( not ( = ?auto_183876 ?auto_183872 ) ) ( not ( = ?auto_183874 ?auto_183875 ) ) ( not ( = ?auto_183874 ?auto_183872 ) ) ( ON ?auto_183873 ?auto_183874 ) ( ON ?auto_183875 ?auto_183873 ) ( CLEAR ?auto_183875 ) ( HOLDING ?auto_183872 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183872 )
      ( MAKE-4PILE ?auto_183868 ?auto_183869 ?auto_183870 ?auto_183871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_183877 - BLOCK
      ?auto_183878 - BLOCK
      ?auto_183879 - BLOCK
      ?auto_183880 - BLOCK
    )
    :vars
    (
      ?auto_183885 - BLOCK
      ?auto_183881 - BLOCK
      ?auto_183882 - BLOCK
      ?auto_183883 - BLOCK
      ?auto_183884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183885 ?auto_183880 ) ( ON-TABLE ?auto_183877 ) ( ON ?auto_183878 ?auto_183877 ) ( ON ?auto_183879 ?auto_183878 ) ( ON ?auto_183880 ?auto_183879 ) ( not ( = ?auto_183877 ?auto_183878 ) ) ( not ( = ?auto_183877 ?auto_183879 ) ) ( not ( = ?auto_183877 ?auto_183880 ) ) ( not ( = ?auto_183877 ?auto_183885 ) ) ( not ( = ?auto_183878 ?auto_183879 ) ) ( not ( = ?auto_183878 ?auto_183880 ) ) ( not ( = ?auto_183878 ?auto_183885 ) ) ( not ( = ?auto_183879 ?auto_183880 ) ) ( not ( = ?auto_183879 ?auto_183885 ) ) ( not ( = ?auto_183880 ?auto_183885 ) ) ( not ( = ?auto_183877 ?auto_183881 ) ) ( not ( = ?auto_183877 ?auto_183882 ) ) ( not ( = ?auto_183878 ?auto_183881 ) ) ( not ( = ?auto_183878 ?auto_183882 ) ) ( not ( = ?auto_183879 ?auto_183881 ) ) ( not ( = ?auto_183879 ?auto_183882 ) ) ( not ( = ?auto_183880 ?auto_183881 ) ) ( not ( = ?auto_183880 ?auto_183882 ) ) ( not ( = ?auto_183885 ?auto_183881 ) ) ( not ( = ?auto_183885 ?auto_183882 ) ) ( not ( = ?auto_183881 ?auto_183882 ) ) ( ON ?auto_183881 ?auto_183885 ) ( not ( = ?auto_183883 ?auto_183884 ) ) ( not ( = ?auto_183883 ?auto_183882 ) ) ( not ( = ?auto_183884 ?auto_183882 ) ) ( not ( = ?auto_183877 ?auto_183884 ) ) ( not ( = ?auto_183877 ?auto_183883 ) ) ( not ( = ?auto_183878 ?auto_183884 ) ) ( not ( = ?auto_183878 ?auto_183883 ) ) ( not ( = ?auto_183879 ?auto_183884 ) ) ( not ( = ?auto_183879 ?auto_183883 ) ) ( not ( = ?auto_183880 ?auto_183884 ) ) ( not ( = ?auto_183880 ?auto_183883 ) ) ( not ( = ?auto_183885 ?auto_183884 ) ) ( not ( = ?auto_183885 ?auto_183883 ) ) ( not ( = ?auto_183881 ?auto_183884 ) ) ( not ( = ?auto_183881 ?auto_183883 ) ) ( ON ?auto_183882 ?auto_183881 ) ( ON ?auto_183884 ?auto_183882 ) ( ON ?auto_183883 ?auto_183884 ) ( CLEAR ?auto_183883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183877 ?auto_183878 ?auto_183879 ?auto_183880 ?auto_183885 ?auto_183881 ?auto_183882 ?auto_183884 )
      ( MAKE-4PILE ?auto_183877 ?auto_183878 ?auto_183879 ?auto_183880 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183891 - BLOCK
      ?auto_183892 - BLOCK
      ?auto_183893 - BLOCK
      ?auto_183894 - BLOCK
      ?auto_183895 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_183895 ) ( CLEAR ?auto_183894 ) ( ON-TABLE ?auto_183891 ) ( ON ?auto_183892 ?auto_183891 ) ( ON ?auto_183893 ?auto_183892 ) ( ON ?auto_183894 ?auto_183893 ) ( not ( = ?auto_183891 ?auto_183892 ) ) ( not ( = ?auto_183891 ?auto_183893 ) ) ( not ( = ?auto_183891 ?auto_183894 ) ) ( not ( = ?auto_183891 ?auto_183895 ) ) ( not ( = ?auto_183892 ?auto_183893 ) ) ( not ( = ?auto_183892 ?auto_183894 ) ) ( not ( = ?auto_183892 ?auto_183895 ) ) ( not ( = ?auto_183893 ?auto_183894 ) ) ( not ( = ?auto_183893 ?auto_183895 ) ) ( not ( = ?auto_183894 ?auto_183895 ) ) )
    :subtasks
    ( ( !STACK ?auto_183895 ?auto_183894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183896 - BLOCK
      ?auto_183897 - BLOCK
      ?auto_183898 - BLOCK
      ?auto_183899 - BLOCK
      ?auto_183900 - BLOCK
    )
    :vars
    (
      ?auto_183901 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_183899 ) ( ON-TABLE ?auto_183896 ) ( ON ?auto_183897 ?auto_183896 ) ( ON ?auto_183898 ?auto_183897 ) ( ON ?auto_183899 ?auto_183898 ) ( not ( = ?auto_183896 ?auto_183897 ) ) ( not ( = ?auto_183896 ?auto_183898 ) ) ( not ( = ?auto_183896 ?auto_183899 ) ) ( not ( = ?auto_183896 ?auto_183900 ) ) ( not ( = ?auto_183897 ?auto_183898 ) ) ( not ( = ?auto_183897 ?auto_183899 ) ) ( not ( = ?auto_183897 ?auto_183900 ) ) ( not ( = ?auto_183898 ?auto_183899 ) ) ( not ( = ?auto_183898 ?auto_183900 ) ) ( not ( = ?auto_183899 ?auto_183900 ) ) ( ON ?auto_183900 ?auto_183901 ) ( CLEAR ?auto_183900 ) ( HAND-EMPTY ) ( not ( = ?auto_183896 ?auto_183901 ) ) ( not ( = ?auto_183897 ?auto_183901 ) ) ( not ( = ?auto_183898 ?auto_183901 ) ) ( not ( = ?auto_183899 ?auto_183901 ) ) ( not ( = ?auto_183900 ?auto_183901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183900 ?auto_183901 )
      ( MAKE-5PILE ?auto_183896 ?auto_183897 ?auto_183898 ?auto_183899 ?auto_183900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183902 - BLOCK
      ?auto_183903 - BLOCK
      ?auto_183904 - BLOCK
      ?auto_183905 - BLOCK
      ?auto_183906 - BLOCK
    )
    :vars
    (
      ?auto_183907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183902 ) ( ON ?auto_183903 ?auto_183902 ) ( ON ?auto_183904 ?auto_183903 ) ( not ( = ?auto_183902 ?auto_183903 ) ) ( not ( = ?auto_183902 ?auto_183904 ) ) ( not ( = ?auto_183902 ?auto_183905 ) ) ( not ( = ?auto_183902 ?auto_183906 ) ) ( not ( = ?auto_183903 ?auto_183904 ) ) ( not ( = ?auto_183903 ?auto_183905 ) ) ( not ( = ?auto_183903 ?auto_183906 ) ) ( not ( = ?auto_183904 ?auto_183905 ) ) ( not ( = ?auto_183904 ?auto_183906 ) ) ( not ( = ?auto_183905 ?auto_183906 ) ) ( ON ?auto_183906 ?auto_183907 ) ( CLEAR ?auto_183906 ) ( not ( = ?auto_183902 ?auto_183907 ) ) ( not ( = ?auto_183903 ?auto_183907 ) ) ( not ( = ?auto_183904 ?auto_183907 ) ) ( not ( = ?auto_183905 ?auto_183907 ) ) ( not ( = ?auto_183906 ?auto_183907 ) ) ( HOLDING ?auto_183905 ) ( CLEAR ?auto_183904 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183902 ?auto_183903 ?auto_183904 ?auto_183905 )
      ( MAKE-5PILE ?auto_183902 ?auto_183903 ?auto_183904 ?auto_183905 ?auto_183906 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183908 - BLOCK
      ?auto_183909 - BLOCK
      ?auto_183910 - BLOCK
      ?auto_183911 - BLOCK
      ?auto_183912 - BLOCK
    )
    :vars
    (
      ?auto_183913 - BLOCK
      ?auto_183914 - BLOCK
      ?auto_183915 - BLOCK
      ?auto_183916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183908 ) ( ON ?auto_183909 ?auto_183908 ) ( ON ?auto_183910 ?auto_183909 ) ( not ( = ?auto_183908 ?auto_183909 ) ) ( not ( = ?auto_183908 ?auto_183910 ) ) ( not ( = ?auto_183908 ?auto_183911 ) ) ( not ( = ?auto_183908 ?auto_183912 ) ) ( not ( = ?auto_183909 ?auto_183910 ) ) ( not ( = ?auto_183909 ?auto_183911 ) ) ( not ( = ?auto_183909 ?auto_183912 ) ) ( not ( = ?auto_183910 ?auto_183911 ) ) ( not ( = ?auto_183910 ?auto_183912 ) ) ( not ( = ?auto_183911 ?auto_183912 ) ) ( ON ?auto_183912 ?auto_183913 ) ( not ( = ?auto_183908 ?auto_183913 ) ) ( not ( = ?auto_183909 ?auto_183913 ) ) ( not ( = ?auto_183910 ?auto_183913 ) ) ( not ( = ?auto_183911 ?auto_183913 ) ) ( not ( = ?auto_183912 ?auto_183913 ) ) ( CLEAR ?auto_183910 ) ( ON ?auto_183911 ?auto_183912 ) ( CLEAR ?auto_183911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183914 ) ( ON ?auto_183915 ?auto_183914 ) ( ON ?auto_183916 ?auto_183915 ) ( ON ?auto_183913 ?auto_183916 ) ( not ( = ?auto_183914 ?auto_183915 ) ) ( not ( = ?auto_183914 ?auto_183916 ) ) ( not ( = ?auto_183914 ?auto_183913 ) ) ( not ( = ?auto_183914 ?auto_183912 ) ) ( not ( = ?auto_183914 ?auto_183911 ) ) ( not ( = ?auto_183915 ?auto_183916 ) ) ( not ( = ?auto_183915 ?auto_183913 ) ) ( not ( = ?auto_183915 ?auto_183912 ) ) ( not ( = ?auto_183915 ?auto_183911 ) ) ( not ( = ?auto_183916 ?auto_183913 ) ) ( not ( = ?auto_183916 ?auto_183912 ) ) ( not ( = ?auto_183916 ?auto_183911 ) ) ( not ( = ?auto_183908 ?auto_183914 ) ) ( not ( = ?auto_183908 ?auto_183915 ) ) ( not ( = ?auto_183908 ?auto_183916 ) ) ( not ( = ?auto_183909 ?auto_183914 ) ) ( not ( = ?auto_183909 ?auto_183915 ) ) ( not ( = ?auto_183909 ?auto_183916 ) ) ( not ( = ?auto_183910 ?auto_183914 ) ) ( not ( = ?auto_183910 ?auto_183915 ) ) ( not ( = ?auto_183910 ?auto_183916 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183914 ?auto_183915 ?auto_183916 ?auto_183913 ?auto_183912 )
      ( MAKE-5PILE ?auto_183908 ?auto_183909 ?auto_183910 ?auto_183911 ?auto_183912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183917 - BLOCK
      ?auto_183918 - BLOCK
      ?auto_183919 - BLOCK
      ?auto_183920 - BLOCK
      ?auto_183921 - BLOCK
    )
    :vars
    (
      ?auto_183924 - BLOCK
      ?auto_183923 - BLOCK
      ?auto_183922 - BLOCK
      ?auto_183925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183917 ) ( ON ?auto_183918 ?auto_183917 ) ( not ( = ?auto_183917 ?auto_183918 ) ) ( not ( = ?auto_183917 ?auto_183919 ) ) ( not ( = ?auto_183917 ?auto_183920 ) ) ( not ( = ?auto_183917 ?auto_183921 ) ) ( not ( = ?auto_183918 ?auto_183919 ) ) ( not ( = ?auto_183918 ?auto_183920 ) ) ( not ( = ?auto_183918 ?auto_183921 ) ) ( not ( = ?auto_183919 ?auto_183920 ) ) ( not ( = ?auto_183919 ?auto_183921 ) ) ( not ( = ?auto_183920 ?auto_183921 ) ) ( ON ?auto_183921 ?auto_183924 ) ( not ( = ?auto_183917 ?auto_183924 ) ) ( not ( = ?auto_183918 ?auto_183924 ) ) ( not ( = ?auto_183919 ?auto_183924 ) ) ( not ( = ?auto_183920 ?auto_183924 ) ) ( not ( = ?auto_183921 ?auto_183924 ) ) ( ON ?auto_183920 ?auto_183921 ) ( CLEAR ?auto_183920 ) ( ON-TABLE ?auto_183923 ) ( ON ?auto_183922 ?auto_183923 ) ( ON ?auto_183925 ?auto_183922 ) ( ON ?auto_183924 ?auto_183925 ) ( not ( = ?auto_183923 ?auto_183922 ) ) ( not ( = ?auto_183923 ?auto_183925 ) ) ( not ( = ?auto_183923 ?auto_183924 ) ) ( not ( = ?auto_183923 ?auto_183921 ) ) ( not ( = ?auto_183923 ?auto_183920 ) ) ( not ( = ?auto_183922 ?auto_183925 ) ) ( not ( = ?auto_183922 ?auto_183924 ) ) ( not ( = ?auto_183922 ?auto_183921 ) ) ( not ( = ?auto_183922 ?auto_183920 ) ) ( not ( = ?auto_183925 ?auto_183924 ) ) ( not ( = ?auto_183925 ?auto_183921 ) ) ( not ( = ?auto_183925 ?auto_183920 ) ) ( not ( = ?auto_183917 ?auto_183923 ) ) ( not ( = ?auto_183917 ?auto_183922 ) ) ( not ( = ?auto_183917 ?auto_183925 ) ) ( not ( = ?auto_183918 ?auto_183923 ) ) ( not ( = ?auto_183918 ?auto_183922 ) ) ( not ( = ?auto_183918 ?auto_183925 ) ) ( not ( = ?auto_183919 ?auto_183923 ) ) ( not ( = ?auto_183919 ?auto_183922 ) ) ( not ( = ?auto_183919 ?auto_183925 ) ) ( HOLDING ?auto_183919 ) ( CLEAR ?auto_183918 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_183917 ?auto_183918 ?auto_183919 )
      ( MAKE-5PILE ?auto_183917 ?auto_183918 ?auto_183919 ?auto_183920 ?auto_183921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183926 - BLOCK
      ?auto_183927 - BLOCK
      ?auto_183928 - BLOCK
      ?auto_183929 - BLOCK
      ?auto_183930 - BLOCK
    )
    :vars
    (
      ?auto_183932 - BLOCK
      ?auto_183931 - BLOCK
      ?auto_183934 - BLOCK
      ?auto_183933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183926 ) ( ON ?auto_183927 ?auto_183926 ) ( not ( = ?auto_183926 ?auto_183927 ) ) ( not ( = ?auto_183926 ?auto_183928 ) ) ( not ( = ?auto_183926 ?auto_183929 ) ) ( not ( = ?auto_183926 ?auto_183930 ) ) ( not ( = ?auto_183927 ?auto_183928 ) ) ( not ( = ?auto_183927 ?auto_183929 ) ) ( not ( = ?auto_183927 ?auto_183930 ) ) ( not ( = ?auto_183928 ?auto_183929 ) ) ( not ( = ?auto_183928 ?auto_183930 ) ) ( not ( = ?auto_183929 ?auto_183930 ) ) ( ON ?auto_183930 ?auto_183932 ) ( not ( = ?auto_183926 ?auto_183932 ) ) ( not ( = ?auto_183927 ?auto_183932 ) ) ( not ( = ?auto_183928 ?auto_183932 ) ) ( not ( = ?auto_183929 ?auto_183932 ) ) ( not ( = ?auto_183930 ?auto_183932 ) ) ( ON ?auto_183929 ?auto_183930 ) ( ON-TABLE ?auto_183931 ) ( ON ?auto_183934 ?auto_183931 ) ( ON ?auto_183933 ?auto_183934 ) ( ON ?auto_183932 ?auto_183933 ) ( not ( = ?auto_183931 ?auto_183934 ) ) ( not ( = ?auto_183931 ?auto_183933 ) ) ( not ( = ?auto_183931 ?auto_183932 ) ) ( not ( = ?auto_183931 ?auto_183930 ) ) ( not ( = ?auto_183931 ?auto_183929 ) ) ( not ( = ?auto_183934 ?auto_183933 ) ) ( not ( = ?auto_183934 ?auto_183932 ) ) ( not ( = ?auto_183934 ?auto_183930 ) ) ( not ( = ?auto_183934 ?auto_183929 ) ) ( not ( = ?auto_183933 ?auto_183932 ) ) ( not ( = ?auto_183933 ?auto_183930 ) ) ( not ( = ?auto_183933 ?auto_183929 ) ) ( not ( = ?auto_183926 ?auto_183931 ) ) ( not ( = ?auto_183926 ?auto_183934 ) ) ( not ( = ?auto_183926 ?auto_183933 ) ) ( not ( = ?auto_183927 ?auto_183931 ) ) ( not ( = ?auto_183927 ?auto_183934 ) ) ( not ( = ?auto_183927 ?auto_183933 ) ) ( not ( = ?auto_183928 ?auto_183931 ) ) ( not ( = ?auto_183928 ?auto_183934 ) ) ( not ( = ?auto_183928 ?auto_183933 ) ) ( CLEAR ?auto_183927 ) ( ON ?auto_183928 ?auto_183929 ) ( CLEAR ?auto_183928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_183931 ?auto_183934 ?auto_183933 ?auto_183932 ?auto_183930 ?auto_183929 )
      ( MAKE-5PILE ?auto_183926 ?auto_183927 ?auto_183928 ?auto_183929 ?auto_183930 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183935 - BLOCK
      ?auto_183936 - BLOCK
      ?auto_183937 - BLOCK
      ?auto_183938 - BLOCK
      ?auto_183939 - BLOCK
    )
    :vars
    (
      ?auto_183942 - BLOCK
      ?auto_183943 - BLOCK
      ?auto_183940 - BLOCK
      ?auto_183941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183935 ) ( not ( = ?auto_183935 ?auto_183936 ) ) ( not ( = ?auto_183935 ?auto_183937 ) ) ( not ( = ?auto_183935 ?auto_183938 ) ) ( not ( = ?auto_183935 ?auto_183939 ) ) ( not ( = ?auto_183936 ?auto_183937 ) ) ( not ( = ?auto_183936 ?auto_183938 ) ) ( not ( = ?auto_183936 ?auto_183939 ) ) ( not ( = ?auto_183937 ?auto_183938 ) ) ( not ( = ?auto_183937 ?auto_183939 ) ) ( not ( = ?auto_183938 ?auto_183939 ) ) ( ON ?auto_183939 ?auto_183942 ) ( not ( = ?auto_183935 ?auto_183942 ) ) ( not ( = ?auto_183936 ?auto_183942 ) ) ( not ( = ?auto_183937 ?auto_183942 ) ) ( not ( = ?auto_183938 ?auto_183942 ) ) ( not ( = ?auto_183939 ?auto_183942 ) ) ( ON ?auto_183938 ?auto_183939 ) ( ON-TABLE ?auto_183943 ) ( ON ?auto_183940 ?auto_183943 ) ( ON ?auto_183941 ?auto_183940 ) ( ON ?auto_183942 ?auto_183941 ) ( not ( = ?auto_183943 ?auto_183940 ) ) ( not ( = ?auto_183943 ?auto_183941 ) ) ( not ( = ?auto_183943 ?auto_183942 ) ) ( not ( = ?auto_183943 ?auto_183939 ) ) ( not ( = ?auto_183943 ?auto_183938 ) ) ( not ( = ?auto_183940 ?auto_183941 ) ) ( not ( = ?auto_183940 ?auto_183942 ) ) ( not ( = ?auto_183940 ?auto_183939 ) ) ( not ( = ?auto_183940 ?auto_183938 ) ) ( not ( = ?auto_183941 ?auto_183942 ) ) ( not ( = ?auto_183941 ?auto_183939 ) ) ( not ( = ?auto_183941 ?auto_183938 ) ) ( not ( = ?auto_183935 ?auto_183943 ) ) ( not ( = ?auto_183935 ?auto_183940 ) ) ( not ( = ?auto_183935 ?auto_183941 ) ) ( not ( = ?auto_183936 ?auto_183943 ) ) ( not ( = ?auto_183936 ?auto_183940 ) ) ( not ( = ?auto_183936 ?auto_183941 ) ) ( not ( = ?auto_183937 ?auto_183943 ) ) ( not ( = ?auto_183937 ?auto_183940 ) ) ( not ( = ?auto_183937 ?auto_183941 ) ) ( ON ?auto_183937 ?auto_183938 ) ( CLEAR ?auto_183937 ) ( HOLDING ?auto_183936 ) ( CLEAR ?auto_183935 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_183935 ?auto_183936 )
      ( MAKE-5PILE ?auto_183935 ?auto_183936 ?auto_183937 ?auto_183938 ?auto_183939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183944 - BLOCK
      ?auto_183945 - BLOCK
      ?auto_183946 - BLOCK
      ?auto_183947 - BLOCK
      ?auto_183948 - BLOCK
    )
    :vars
    (
      ?auto_183949 - BLOCK
      ?auto_183950 - BLOCK
      ?auto_183952 - BLOCK
      ?auto_183951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_183944 ) ( not ( = ?auto_183944 ?auto_183945 ) ) ( not ( = ?auto_183944 ?auto_183946 ) ) ( not ( = ?auto_183944 ?auto_183947 ) ) ( not ( = ?auto_183944 ?auto_183948 ) ) ( not ( = ?auto_183945 ?auto_183946 ) ) ( not ( = ?auto_183945 ?auto_183947 ) ) ( not ( = ?auto_183945 ?auto_183948 ) ) ( not ( = ?auto_183946 ?auto_183947 ) ) ( not ( = ?auto_183946 ?auto_183948 ) ) ( not ( = ?auto_183947 ?auto_183948 ) ) ( ON ?auto_183948 ?auto_183949 ) ( not ( = ?auto_183944 ?auto_183949 ) ) ( not ( = ?auto_183945 ?auto_183949 ) ) ( not ( = ?auto_183946 ?auto_183949 ) ) ( not ( = ?auto_183947 ?auto_183949 ) ) ( not ( = ?auto_183948 ?auto_183949 ) ) ( ON ?auto_183947 ?auto_183948 ) ( ON-TABLE ?auto_183950 ) ( ON ?auto_183952 ?auto_183950 ) ( ON ?auto_183951 ?auto_183952 ) ( ON ?auto_183949 ?auto_183951 ) ( not ( = ?auto_183950 ?auto_183952 ) ) ( not ( = ?auto_183950 ?auto_183951 ) ) ( not ( = ?auto_183950 ?auto_183949 ) ) ( not ( = ?auto_183950 ?auto_183948 ) ) ( not ( = ?auto_183950 ?auto_183947 ) ) ( not ( = ?auto_183952 ?auto_183951 ) ) ( not ( = ?auto_183952 ?auto_183949 ) ) ( not ( = ?auto_183952 ?auto_183948 ) ) ( not ( = ?auto_183952 ?auto_183947 ) ) ( not ( = ?auto_183951 ?auto_183949 ) ) ( not ( = ?auto_183951 ?auto_183948 ) ) ( not ( = ?auto_183951 ?auto_183947 ) ) ( not ( = ?auto_183944 ?auto_183950 ) ) ( not ( = ?auto_183944 ?auto_183952 ) ) ( not ( = ?auto_183944 ?auto_183951 ) ) ( not ( = ?auto_183945 ?auto_183950 ) ) ( not ( = ?auto_183945 ?auto_183952 ) ) ( not ( = ?auto_183945 ?auto_183951 ) ) ( not ( = ?auto_183946 ?auto_183950 ) ) ( not ( = ?auto_183946 ?auto_183952 ) ) ( not ( = ?auto_183946 ?auto_183951 ) ) ( ON ?auto_183946 ?auto_183947 ) ( CLEAR ?auto_183944 ) ( ON ?auto_183945 ?auto_183946 ) ( CLEAR ?auto_183945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_183950 ?auto_183952 ?auto_183951 ?auto_183949 ?auto_183948 ?auto_183947 ?auto_183946 )
      ( MAKE-5PILE ?auto_183944 ?auto_183945 ?auto_183946 ?auto_183947 ?auto_183948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183953 - BLOCK
      ?auto_183954 - BLOCK
      ?auto_183955 - BLOCK
      ?auto_183956 - BLOCK
      ?auto_183957 - BLOCK
    )
    :vars
    (
      ?auto_183961 - BLOCK
      ?auto_183959 - BLOCK
      ?auto_183960 - BLOCK
      ?auto_183958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183953 ?auto_183954 ) ) ( not ( = ?auto_183953 ?auto_183955 ) ) ( not ( = ?auto_183953 ?auto_183956 ) ) ( not ( = ?auto_183953 ?auto_183957 ) ) ( not ( = ?auto_183954 ?auto_183955 ) ) ( not ( = ?auto_183954 ?auto_183956 ) ) ( not ( = ?auto_183954 ?auto_183957 ) ) ( not ( = ?auto_183955 ?auto_183956 ) ) ( not ( = ?auto_183955 ?auto_183957 ) ) ( not ( = ?auto_183956 ?auto_183957 ) ) ( ON ?auto_183957 ?auto_183961 ) ( not ( = ?auto_183953 ?auto_183961 ) ) ( not ( = ?auto_183954 ?auto_183961 ) ) ( not ( = ?auto_183955 ?auto_183961 ) ) ( not ( = ?auto_183956 ?auto_183961 ) ) ( not ( = ?auto_183957 ?auto_183961 ) ) ( ON ?auto_183956 ?auto_183957 ) ( ON-TABLE ?auto_183959 ) ( ON ?auto_183960 ?auto_183959 ) ( ON ?auto_183958 ?auto_183960 ) ( ON ?auto_183961 ?auto_183958 ) ( not ( = ?auto_183959 ?auto_183960 ) ) ( not ( = ?auto_183959 ?auto_183958 ) ) ( not ( = ?auto_183959 ?auto_183961 ) ) ( not ( = ?auto_183959 ?auto_183957 ) ) ( not ( = ?auto_183959 ?auto_183956 ) ) ( not ( = ?auto_183960 ?auto_183958 ) ) ( not ( = ?auto_183960 ?auto_183961 ) ) ( not ( = ?auto_183960 ?auto_183957 ) ) ( not ( = ?auto_183960 ?auto_183956 ) ) ( not ( = ?auto_183958 ?auto_183961 ) ) ( not ( = ?auto_183958 ?auto_183957 ) ) ( not ( = ?auto_183958 ?auto_183956 ) ) ( not ( = ?auto_183953 ?auto_183959 ) ) ( not ( = ?auto_183953 ?auto_183960 ) ) ( not ( = ?auto_183953 ?auto_183958 ) ) ( not ( = ?auto_183954 ?auto_183959 ) ) ( not ( = ?auto_183954 ?auto_183960 ) ) ( not ( = ?auto_183954 ?auto_183958 ) ) ( not ( = ?auto_183955 ?auto_183959 ) ) ( not ( = ?auto_183955 ?auto_183960 ) ) ( not ( = ?auto_183955 ?auto_183958 ) ) ( ON ?auto_183955 ?auto_183956 ) ( ON ?auto_183954 ?auto_183955 ) ( CLEAR ?auto_183954 ) ( HOLDING ?auto_183953 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_183953 )
      ( MAKE-5PILE ?auto_183953 ?auto_183954 ?auto_183955 ?auto_183956 ?auto_183957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_183962 - BLOCK
      ?auto_183963 - BLOCK
      ?auto_183964 - BLOCK
      ?auto_183965 - BLOCK
      ?auto_183966 - BLOCK
    )
    :vars
    (
      ?auto_183969 - BLOCK
      ?auto_183968 - BLOCK
      ?auto_183970 - BLOCK
      ?auto_183967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_183962 ?auto_183963 ) ) ( not ( = ?auto_183962 ?auto_183964 ) ) ( not ( = ?auto_183962 ?auto_183965 ) ) ( not ( = ?auto_183962 ?auto_183966 ) ) ( not ( = ?auto_183963 ?auto_183964 ) ) ( not ( = ?auto_183963 ?auto_183965 ) ) ( not ( = ?auto_183963 ?auto_183966 ) ) ( not ( = ?auto_183964 ?auto_183965 ) ) ( not ( = ?auto_183964 ?auto_183966 ) ) ( not ( = ?auto_183965 ?auto_183966 ) ) ( ON ?auto_183966 ?auto_183969 ) ( not ( = ?auto_183962 ?auto_183969 ) ) ( not ( = ?auto_183963 ?auto_183969 ) ) ( not ( = ?auto_183964 ?auto_183969 ) ) ( not ( = ?auto_183965 ?auto_183969 ) ) ( not ( = ?auto_183966 ?auto_183969 ) ) ( ON ?auto_183965 ?auto_183966 ) ( ON-TABLE ?auto_183968 ) ( ON ?auto_183970 ?auto_183968 ) ( ON ?auto_183967 ?auto_183970 ) ( ON ?auto_183969 ?auto_183967 ) ( not ( = ?auto_183968 ?auto_183970 ) ) ( not ( = ?auto_183968 ?auto_183967 ) ) ( not ( = ?auto_183968 ?auto_183969 ) ) ( not ( = ?auto_183968 ?auto_183966 ) ) ( not ( = ?auto_183968 ?auto_183965 ) ) ( not ( = ?auto_183970 ?auto_183967 ) ) ( not ( = ?auto_183970 ?auto_183969 ) ) ( not ( = ?auto_183970 ?auto_183966 ) ) ( not ( = ?auto_183970 ?auto_183965 ) ) ( not ( = ?auto_183967 ?auto_183969 ) ) ( not ( = ?auto_183967 ?auto_183966 ) ) ( not ( = ?auto_183967 ?auto_183965 ) ) ( not ( = ?auto_183962 ?auto_183968 ) ) ( not ( = ?auto_183962 ?auto_183970 ) ) ( not ( = ?auto_183962 ?auto_183967 ) ) ( not ( = ?auto_183963 ?auto_183968 ) ) ( not ( = ?auto_183963 ?auto_183970 ) ) ( not ( = ?auto_183963 ?auto_183967 ) ) ( not ( = ?auto_183964 ?auto_183968 ) ) ( not ( = ?auto_183964 ?auto_183970 ) ) ( not ( = ?auto_183964 ?auto_183967 ) ) ( ON ?auto_183964 ?auto_183965 ) ( ON ?auto_183963 ?auto_183964 ) ( ON ?auto_183962 ?auto_183963 ) ( CLEAR ?auto_183962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_183968 ?auto_183970 ?auto_183967 ?auto_183969 ?auto_183966 ?auto_183965 ?auto_183964 ?auto_183963 )
      ( MAKE-5PILE ?auto_183962 ?auto_183963 ?auto_183964 ?auto_183965 ?auto_183966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183974 - BLOCK
      ?auto_183975 - BLOCK
      ?auto_183976 - BLOCK
    )
    :vars
    (
      ?auto_183977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183977 ?auto_183976 ) ( CLEAR ?auto_183977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_183974 ) ( ON ?auto_183975 ?auto_183974 ) ( ON ?auto_183976 ?auto_183975 ) ( not ( = ?auto_183974 ?auto_183975 ) ) ( not ( = ?auto_183974 ?auto_183976 ) ) ( not ( = ?auto_183974 ?auto_183977 ) ) ( not ( = ?auto_183975 ?auto_183976 ) ) ( not ( = ?auto_183975 ?auto_183977 ) ) ( not ( = ?auto_183976 ?auto_183977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_183977 ?auto_183976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183978 - BLOCK
      ?auto_183979 - BLOCK
      ?auto_183980 - BLOCK
    )
    :vars
    (
      ?auto_183981 - BLOCK
      ?auto_183982 - BLOCK
      ?auto_183983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183981 ?auto_183980 ) ( CLEAR ?auto_183981 ) ( ON-TABLE ?auto_183978 ) ( ON ?auto_183979 ?auto_183978 ) ( ON ?auto_183980 ?auto_183979 ) ( not ( = ?auto_183978 ?auto_183979 ) ) ( not ( = ?auto_183978 ?auto_183980 ) ) ( not ( = ?auto_183978 ?auto_183981 ) ) ( not ( = ?auto_183979 ?auto_183980 ) ) ( not ( = ?auto_183979 ?auto_183981 ) ) ( not ( = ?auto_183980 ?auto_183981 ) ) ( HOLDING ?auto_183982 ) ( CLEAR ?auto_183983 ) ( not ( = ?auto_183978 ?auto_183982 ) ) ( not ( = ?auto_183978 ?auto_183983 ) ) ( not ( = ?auto_183979 ?auto_183982 ) ) ( not ( = ?auto_183979 ?auto_183983 ) ) ( not ( = ?auto_183980 ?auto_183982 ) ) ( not ( = ?auto_183980 ?auto_183983 ) ) ( not ( = ?auto_183981 ?auto_183982 ) ) ( not ( = ?auto_183981 ?auto_183983 ) ) ( not ( = ?auto_183982 ?auto_183983 ) ) )
    :subtasks
    ( ( !STACK ?auto_183982 ?auto_183983 )
      ( MAKE-3PILE ?auto_183978 ?auto_183979 ?auto_183980 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183984 - BLOCK
      ?auto_183985 - BLOCK
      ?auto_183986 - BLOCK
    )
    :vars
    (
      ?auto_183987 - BLOCK
      ?auto_183989 - BLOCK
      ?auto_183988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183987 ?auto_183986 ) ( ON-TABLE ?auto_183984 ) ( ON ?auto_183985 ?auto_183984 ) ( ON ?auto_183986 ?auto_183985 ) ( not ( = ?auto_183984 ?auto_183985 ) ) ( not ( = ?auto_183984 ?auto_183986 ) ) ( not ( = ?auto_183984 ?auto_183987 ) ) ( not ( = ?auto_183985 ?auto_183986 ) ) ( not ( = ?auto_183985 ?auto_183987 ) ) ( not ( = ?auto_183986 ?auto_183987 ) ) ( CLEAR ?auto_183989 ) ( not ( = ?auto_183984 ?auto_183988 ) ) ( not ( = ?auto_183984 ?auto_183989 ) ) ( not ( = ?auto_183985 ?auto_183988 ) ) ( not ( = ?auto_183985 ?auto_183989 ) ) ( not ( = ?auto_183986 ?auto_183988 ) ) ( not ( = ?auto_183986 ?auto_183989 ) ) ( not ( = ?auto_183987 ?auto_183988 ) ) ( not ( = ?auto_183987 ?auto_183989 ) ) ( not ( = ?auto_183988 ?auto_183989 ) ) ( ON ?auto_183988 ?auto_183987 ) ( CLEAR ?auto_183988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183984 ?auto_183985 ?auto_183986 ?auto_183987 )
      ( MAKE-3PILE ?auto_183984 ?auto_183985 ?auto_183986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183990 - BLOCK
      ?auto_183991 - BLOCK
      ?auto_183992 - BLOCK
    )
    :vars
    (
      ?auto_183994 - BLOCK
      ?auto_183995 - BLOCK
      ?auto_183993 - BLOCK
      ?auto_183996 - BLOCK
      ?auto_183998 - BLOCK
      ?auto_183997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_183994 ?auto_183992 ) ( ON-TABLE ?auto_183990 ) ( ON ?auto_183991 ?auto_183990 ) ( ON ?auto_183992 ?auto_183991 ) ( not ( = ?auto_183990 ?auto_183991 ) ) ( not ( = ?auto_183990 ?auto_183992 ) ) ( not ( = ?auto_183990 ?auto_183994 ) ) ( not ( = ?auto_183991 ?auto_183992 ) ) ( not ( = ?auto_183991 ?auto_183994 ) ) ( not ( = ?auto_183992 ?auto_183994 ) ) ( not ( = ?auto_183990 ?auto_183995 ) ) ( not ( = ?auto_183990 ?auto_183993 ) ) ( not ( = ?auto_183991 ?auto_183995 ) ) ( not ( = ?auto_183991 ?auto_183993 ) ) ( not ( = ?auto_183992 ?auto_183995 ) ) ( not ( = ?auto_183992 ?auto_183993 ) ) ( not ( = ?auto_183994 ?auto_183995 ) ) ( not ( = ?auto_183994 ?auto_183993 ) ) ( not ( = ?auto_183995 ?auto_183993 ) ) ( ON ?auto_183995 ?auto_183994 ) ( CLEAR ?auto_183995 ) ( HOLDING ?auto_183993 ) ( CLEAR ?auto_183996 ) ( ON-TABLE ?auto_183998 ) ( ON ?auto_183997 ?auto_183998 ) ( ON ?auto_183996 ?auto_183997 ) ( not ( = ?auto_183998 ?auto_183997 ) ) ( not ( = ?auto_183998 ?auto_183996 ) ) ( not ( = ?auto_183998 ?auto_183993 ) ) ( not ( = ?auto_183997 ?auto_183996 ) ) ( not ( = ?auto_183997 ?auto_183993 ) ) ( not ( = ?auto_183996 ?auto_183993 ) ) ( not ( = ?auto_183990 ?auto_183996 ) ) ( not ( = ?auto_183990 ?auto_183998 ) ) ( not ( = ?auto_183990 ?auto_183997 ) ) ( not ( = ?auto_183991 ?auto_183996 ) ) ( not ( = ?auto_183991 ?auto_183998 ) ) ( not ( = ?auto_183991 ?auto_183997 ) ) ( not ( = ?auto_183992 ?auto_183996 ) ) ( not ( = ?auto_183992 ?auto_183998 ) ) ( not ( = ?auto_183992 ?auto_183997 ) ) ( not ( = ?auto_183994 ?auto_183996 ) ) ( not ( = ?auto_183994 ?auto_183998 ) ) ( not ( = ?auto_183994 ?auto_183997 ) ) ( not ( = ?auto_183995 ?auto_183996 ) ) ( not ( = ?auto_183995 ?auto_183998 ) ) ( not ( = ?auto_183995 ?auto_183997 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_183998 ?auto_183997 ?auto_183996 ?auto_183993 )
      ( MAKE-3PILE ?auto_183990 ?auto_183991 ?auto_183992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_183999 - BLOCK
      ?auto_184000 - BLOCK
      ?auto_184001 - BLOCK
    )
    :vars
    (
      ?auto_184003 - BLOCK
      ?auto_184002 - BLOCK
      ?auto_184005 - BLOCK
      ?auto_184007 - BLOCK
      ?auto_184006 - BLOCK
      ?auto_184004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184003 ?auto_184001 ) ( ON-TABLE ?auto_183999 ) ( ON ?auto_184000 ?auto_183999 ) ( ON ?auto_184001 ?auto_184000 ) ( not ( = ?auto_183999 ?auto_184000 ) ) ( not ( = ?auto_183999 ?auto_184001 ) ) ( not ( = ?auto_183999 ?auto_184003 ) ) ( not ( = ?auto_184000 ?auto_184001 ) ) ( not ( = ?auto_184000 ?auto_184003 ) ) ( not ( = ?auto_184001 ?auto_184003 ) ) ( not ( = ?auto_183999 ?auto_184002 ) ) ( not ( = ?auto_183999 ?auto_184005 ) ) ( not ( = ?auto_184000 ?auto_184002 ) ) ( not ( = ?auto_184000 ?auto_184005 ) ) ( not ( = ?auto_184001 ?auto_184002 ) ) ( not ( = ?auto_184001 ?auto_184005 ) ) ( not ( = ?auto_184003 ?auto_184002 ) ) ( not ( = ?auto_184003 ?auto_184005 ) ) ( not ( = ?auto_184002 ?auto_184005 ) ) ( ON ?auto_184002 ?auto_184003 ) ( CLEAR ?auto_184007 ) ( ON-TABLE ?auto_184006 ) ( ON ?auto_184004 ?auto_184006 ) ( ON ?auto_184007 ?auto_184004 ) ( not ( = ?auto_184006 ?auto_184004 ) ) ( not ( = ?auto_184006 ?auto_184007 ) ) ( not ( = ?auto_184006 ?auto_184005 ) ) ( not ( = ?auto_184004 ?auto_184007 ) ) ( not ( = ?auto_184004 ?auto_184005 ) ) ( not ( = ?auto_184007 ?auto_184005 ) ) ( not ( = ?auto_183999 ?auto_184007 ) ) ( not ( = ?auto_183999 ?auto_184006 ) ) ( not ( = ?auto_183999 ?auto_184004 ) ) ( not ( = ?auto_184000 ?auto_184007 ) ) ( not ( = ?auto_184000 ?auto_184006 ) ) ( not ( = ?auto_184000 ?auto_184004 ) ) ( not ( = ?auto_184001 ?auto_184007 ) ) ( not ( = ?auto_184001 ?auto_184006 ) ) ( not ( = ?auto_184001 ?auto_184004 ) ) ( not ( = ?auto_184003 ?auto_184007 ) ) ( not ( = ?auto_184003 ?auto_184006 ) ) ( not ( = ?auto_184003 ?auto_184004 ) ) ( not ( = ?auto_184002 ?auto_184007 ) ) ( not ( = ?auto_184002 ?auto_184006 ) ) ( not ( = ?auto_184002 ?auto_184004 ) ) ( ON ?auto_184005 ?auto_184002 ) ( CLEAR ?auto_184005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_183999 ?auto_184000 ?auto_184001 ?auto_184003 ?auto_184002 )
      ( MAKE-3PILE ?auto_183999 ?auto_184000 ?auto_184001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184008 - BLOCK
      ?auto_184009 - BLOCK
      ?auto_184010 - BLOCK
    )
    :vars
    (
      ?auto_184013 - BLOCK
      ?auto_184015 - BLOCK
      ?auto_184016 - BLOCK
      ?auto_184011 - BLOCK
      ?auto_184014 - BLOCK
      ?auto_184012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184013 ?auto_184010 ) ( ON-TABLE ?auto_184008 ) ( ON ?auto_184009 ?auto_184008 ) ( ON ?auto_184010 ?auto_184009 ) ( not ( = ?auto_184008 ?auto_184009 ) ) ( not ( = ?auto_184008 ?auto_184010 ) ) ( not ( = ?auto_184008 ?auto_184013 ) ) ( not ( = ?auto_184009 ?auto_184010 ) ) ( not ( = ?auto_184009 ?auto_184013 ) ) ( not ( = ?auto_184010 ?auto_184013 ) ) ( not ( = ?auto_184008 ?auto_184015 ) ) ( not ( = ?auto_184008 ?auto_184016 ) ) ( not ( = ?auto_184009 ?auto_184015 ) ) ( not ( = ?auto_184009 ?auto_184016 ) ) ( not ( = ?auto_184010 ?auto_184015 ) ) ( not ( = ?auto_184010 ?auto_184016 ) ) ( not ( = ?auto_184013 ?auto_184015 ) ) ( not ( = ?auto_184013 ?auto_184016 ) ) ( not ( = ?auto_184015 ?auto_184016 ) ) ( ON ?auto_184015 ?auto_184013 ) ( ON-TABLE ?auto_184011 ) ( ON ?auto_184014 ?auto_184011 ) ( not ( = ?auto_184011 ?auto_184014 ) ) ( not ( = ?auto_184011 ?auto_184012 ) ) ( not ( = ?auto_184011 ?auto_184016 ) ) ( not ( = ?auto_184014 ?auto_184012 ) ) ( not ( = ?auto_184014 ?auto_184016 ) ) ( not ( = ?auto_184012 ?auto_184016 ) ) ( not ( = ?auto_184008 ?auto_184012 ) ) ( not ( = ?auto_184008 ?auto_184011 ) ) ( not ( = ?auto_184008 ?auto_184014 ) ) ( not ( = ?auto_184009 ?auto_184012 ) ) ( not ( = ?auto_184009 ?auto_184011 ) ) ( not ( = ?auto_184009 ?auto_184014 ) ) ( not ( = ?auto_184010 ?auto_184012 ) ) ( not ( = ?auto_184010 ?auto_184011 ) ) ( not ( = ?auto_184010 ?auto_184014 ) ) ( not ( = ?auto_184013 ?auto_184012 ) ) ( not ( = ?auto_184013 ?auto_184011 ) ) ( not ( = ?auto_184013 ?auto_184014 ) ) ( not ( = ?auto_184015 ?auto_184012 ) ) ( not ( = ?auto_184015 ?auto_184011 ) ) ( not ( = ?auto_184015 ?auto_184014 ) ) ( ON ?auto_184016 ?auto_184015 ) ( CLEAR ?auto_184016 ) ( HOLDING ?auto_184012 ) ( CLEAR ?auto_184014 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184011 ?auto_184014 ?auto_184012 )
      ( MAKE-3PILE ?auto_184008 ?auto_184009 ?auto_184010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184017 - BLOCK
      ?auto_184018 - BLOCK
      ?auto_184019 - BLOCK
    )
    :vars
    (
      ?auto_184024 - BLOCK
      ?auto_184020 - BLOCK
      ?auto_184022 - BLOCK
      ?auto_184023 - BLOCK
      ?auto_184021 - BLOCK
      ?auto_184025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184024 ?auto_184019 ) ( ON-TABLE ?auto_184017 ) ( ON ?auto_184018 ?auto_184017 ) ( ON ?auto_184019 ?auto_184018 ) ( not ( = ?auto_184017 ?auto_184018 ) ) ( not ( = ?auto_184017 ?auto_184019 ) ) ( not ( = ?auto_184017 ?auto_184024 ) ) ( not ( = ?auto_184018 ?auto_184019 ) ) ( not ( = ?auto_184018 ?auto_184024 ) ) ( not ( = ?auto_184019 ?auto_184024 ) ) ( not ( = ?auto_184017 ?auto_184020 ) ) ( not ( = ?auto_184017 ?auto_184022 ) ) ( not ( = ?auto_184018 ?auto_184020 ) ) ( not ( = ?auto_184018 ?auto_184022 ) ) ( not ( = ?auto_184019 ?auto_184020 ) ) ( not ( = ?auto_184019 ?auto_184022 ) ) ( not ( = ?auto_184024 ?auto_184020 ) ) ( not ( = ?auto_184024 ?auto_184022 ) ) ( not ( = ?auto_184020 ?auto_184022 ) ) ( ON ?auto_184020 ?auto_184024 ) ( ON-TABLE ?auto_184023 ) ( ON ?auto_184021 ?auto_184023 ) ( not ( = ?auto_184023 ?auto_184021 ) ) ( not ( = ?auto_184023 ?auto_184025 ) ) ( not ( = ?auto_184023 ?auto_184022 ) ) ( not ( = ?auto_184021 ?auto_184025 ) ) ( not ( = ?auto_184021 ?auto_184022 ) ) ( not ( = ?auto_184025 ?auto_184022 ) ) ( not ( = ?auto_184017 ?auto_184025 ) ) ( not ( = ?auto_184017 ?auto_184023 ) ) ( not ( = ?auto_184017 ?auto_184021 ) ) ( not ( = ?auto_184018 ?auto_184025 ) ) ( not ( = ?auto_184018 ?auto_184023 ) ) ( not ( = ?auto_184018 ?auto_184021 ) ) ( not ( = ?auto_184019 ?auto_184025 ) ) ( not ( = ?auto_184019 ?auto_184023 ) ) ( not ( = ?auto_184019 ?auto_184021 ) ) ( not ( = ?auto_184024 ?auto_184025 ) ) ( not ( = ?auto_184024 ?auto_184023 ) ) ( not ( = ?auto_184024 ?auto_184021 ) ) ( not ( = ?auto_184020 ?auto_184025 ) ) ( not ( = ?auto_184020 ?auto_184023 ) ) ( not ( = ?auto_184020 ?auto_184021 ) ) ( ON ?auto_184022 ?auto_184020 ) ( CLEAR ?auto_184021 ) ( ON ?auto_184025 ?auto_184022 ) ( CLEAR ?auto_184025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184017 ?auto_184018 ?auto_184019 ?auto_184024 ?auto_184020 ?auto_184022 )
      ( MAKE-3PILE ?auto_184017 ?auto_184018 ?auto_184019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184026 - BLOCK
      ?auto_184027 - BLOCK
      ?auto_184028 - BLOCK
    )
    :vars
    (
      ?auto_184033 - BLOCK
      ?auto_184032 - BLOCK
      ?auto_184029 - BLOCK
      ?auto_184034 - BLOCK
      ?auto_184031 - BLOCK
      ?auto_184030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184033 ?auto_184028 ) ( ON-TABLE ?auto_184026 ) ( ON ?auto_184027 ?auto_184026 ) ( ON ?auto_184028 ?auto_184027 ) ( not ( = ?auto_184026 ?auto_184027 ) ) ( not ( = ?auto_184026 ?auto_184028 ) ) ( not ( = ?auto_184026 ?auto_184033 ) ) ( not ( = ?auto_184027 ?auto_184028 ) ) ( not ( = ?auto_184027 ?auto_184033 ) ) ( not ( = ?auto_184028 ?auto_184033 ) ) ( not ( = ?auto_184026 ?auto_184032 ) ) ( not ( = ?auto_184026 ?auto_184029 ) ) ( not ( = ?auto_184027 ?auto_184032 ) ) ( not ( = ?auto_184027 ?auto_184029 ) ) ( not ( = ?auto_184028 ?auto_184032 ) ) ( not ( = ?auto_184028 ?auto_184029 ) ) ( not ( = ?auto_184033 ?auto_184032 ) ) ( not ( = ?auto_184033 ?auto_184029 ) ) ( not ( = ?auto_184032 ?auto_184029 ) ) ( ON ?auto_184032 ?auto_184033 ) ( ON-TABLE ?auto_184034 ) ( not ( = ?auto_184034 ?auto_184031 ) ) ( not ( = ?auto_184034 ?auto_184030 ) ) ( not ( = ?auto_184034 ?auto_184029 ) ) ( not ( = ?auto_184031 ?auto_184030 ) ) ( not ( = ?auto_184031 ?auto_184029 ) ) ( not ( = ?auto_184030 ?auto_184029 ) ) ( not ( = ?auto_184026 ?auto_184030 ) ) ( not ( = ?auto_184026 ?auto_184034 ) ) ( not ( = ?auto_184026 ?auto_184031 ) ) ( not ( = ?auto_184027 ?auto_184030 ) ) ( not ( = ?auto_184027 ?auto_184034 ) ) ( not ( = ?auto_184027 ?auto_184031 ) ) ( not ( = ?auto_184028 ?auto_184030 ) ) ( not ( = ?auto_184028 ?auto_184034 ) ) ( not ( = ?auto_184028 ?auto_184031 ) ) ( not ( = ?auto_184033 ?auto_184030 ) ) ( not ( = ?auto_184033 ?auto_184034 ) ) ( not ( = ?auto_184033 ?auto_184031 ) ) ( not ( = ?auto_184032 ?auto_184030 ) ) ( not ( = ?auto_184032 ?auto_184034 ) ) ( not ( = ?auto_184032 ?auto_184031 ) ) ( ON ?auto_184029 ?auto_184032 ) ( ON ?auto_184030 ?auto_184029 ) ( CLEAR ?auto_184030 ) ( HOLDING ?auto_184031 ) ( CLEAR ?auto_184034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184034 ?auto_184031 )
      ( MAKE-3PILE ?auto_184026 ?auto_184027 ?auto_184028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184035 - BLOCK
      ?auto_184036 - BLOCK
      ?auto_184037 - BLOCK
    )
    :vars
    (
      ?auto_184038 - BLOCK
      ?auto_184043 - BLOCK
      ?auto_184039 - BLOCK
      ?auto_184041 - BLOCK
      ?auto_184040 - BLOCK
      ?auto_184042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184038 ?auto_184037 ) ( ON-TABLE ?auto_184035 ) ( ON ?auto_184036 ?auto_184035 ) ( ON ?auto_184037 ?auto_184036 ) ( not ( = ?auto_184035 ?auto_184036 ) ) ( not ( = ?auto_184035 ?auto_184037 ) ) ( not ( = ?auto_184035 ?auto_184038 ) ) ( not ( = ?auto_184036 ?auto_184037 ) ) ( not ( = ?auto_184036 ?auto_184038 ) ) ( not ( = ?auto_184037 ?auto_184038 ) ) ( not ( = ?auto_184035 ?auto_184043 ) ) ( not ( = ?auto_184035 ?auto_184039 ) ) ( not ( = ?auto_184036 ?auto_184043 ) ) ( not ( = ?auto_184036 ?auto_184039 ) ) ( not ( = ?auto_184037 ?auto_184043 ) ) ( not ( = ?auto_184037 ?auto_184039 ) ) ( not ( = ?auto_184038 ?auto_184043 ) ) ( not ( = ?auto_184038 ?auto_184039 ) ) ( not ( = ?auto_184043 ?auto_184039 ) ) ( ON ?auto_184043 ?auto_184038 ) ( ON-TABLE ?auto_184041 ) ( not ( = ?auto_184041 ?auto_184040 ) ) ( not ( = ?auto_184041 ?auto_184042 ) ) ( not ( = ?auto_184041 ?auto_184039 ) ) ( not ( = ?auto_184040 ?auto_184042 ) ) ( not ( = ?auto_184040 ?auto_184039 ) ) ( not ( = ?auto_184042 ?auto_184039 ) ) ( not ( = ?auto_184035 ?auto_184042 ) ) ( not ( = ?auto_184035 ?auto_184041 ) ) ( not ( = ?auto_184035 ?auto_184040 ) ) ( not ( = ?auto_184036 ?auto_184042 ) ) ( not ( = ?auto_184036 ?auto_184041 ) ) ( not ( = ?auto_184036 ?auto_184040 ) ) ( not ( = ?auto_184037 ?auto_184042 ) ) ( not ( = ?auto_184037 ?auto_184041 ) ) ( not ( = ?auto_184037 ?auto_184040 ) ) ( not ( = ?auto_184038 ?auto_184042 ) ) ( not ( = ?auto_184038 ?auto_184041 ) ) ( not ( = ?auto_184038 ?auto_184040 ) ) ( not ( = ?auto_184043 ?auto_184042 ) ) ( not ( = ?auto_184043 ?auto_184041 ) ) ( not ( = ?auto_184043 ?auto_184040 ) ) ( ON ?auto_184039 ?auto_184043 ) ( ON ?auto_184042 ?auto_184039 ) ( CLEAR ?auto_184041 ) ( ON ?auto_184040 ?auto_184042 ) ( CLEAR ?auto_184040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184035 ?auto_184036 ?auto_184037 ?auto_184038 ?auto_184043 ?auto_184039 ?auto_184042 )
      ( MAKE-3PILE ?auto_184035 ?auto_184036 ?auto_184037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184044 - BLOCK
      ?auto_184045 - BLOCK
      ?auto_184046 - BLOCK
    )
    :vars
    (
      ?auto_184049 - BLOCK
      ?auto_184052 - BLOCK
      ?auto_184047 - BLOCK
      ?auto_184048 - BLOCK
      ?auto_184050 - BLOCK
      ?auto_184051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184049 ?auto_184046 ) ( ON-TABLE ?auto_184044 ) ( ON ?auto_184045 ?auto_184044 ) ( ON ?auto_184046 ?auto_184045 ) ( not ( = ?auto_184044 ?auto_184045 ) ) ( not ( = ?auto_184044 ?auto_184046 ) ) ( not ( = ?auto_184044 ?auto_184049 ) ) ( not ( = ?auto_184045 ?auto_184046 ) ) ( not ( = ?auto_184045 ?auto_184049 ) ) ( not ( = ?auto_184046 ?auto_184049 ) ) ( not ( = ?auto_184044 ?auto_184052 ) ) ( not ( = ?auto_184044 ?auto_184047 ) ) ( not ( = ?auto_184045 ?auto_184052 ) ) ( not ( = ?auto_184045 ?auto_184047 ) ) ( not ( = ?auto_184046 ?auto_184052 ) ) ( not ( = ?auto_184046 ?auto_184047 ) ) ( not ( = ?auto_184049 ?auto_184052 ) ) ( not ( = ?auto_184049 ?auto_184047 ) ) ( not ( = ?auto_184052 ?auto_184047 ) ) ( ON ?auto_184052 ?auto_184049 ) ( not ( = ?auto_184048 ?auto_184050 ) ) ( not ( = ?auto_184048 ?auto_184051 ) ) ( not ( = ?auto_184048 ?auto_184047 ) ) ( not ( = ?auto_184050 ?auto_184051 ) ) ( not ( = ?auto_184050 ?auto_184047 ) ) ( not ( = ?auto_184051 ?auto_184047 ) ) ( not ( = ?auto_184044 ?auto_184051 ) ) ( not ( = ?auto_184044 ?auto_184048 ) ) ( not ( = ?auto_184044 ?auto_184050 ) ) ( not ( = ?auto_184045 ?auto_184051 ) ) ( not ( = ?auto_184045 ?auto_184048 ) ) ( not ( = ?auto_184045 ?auto_184050 ) ) ( not ( = ?auto_184046 ?auto_184051 ) ) ( not ( = ?auto_184046 ?auto_184048 ) ) ( not ( = ?auto_184046 ?auto_184050 ) ) ( not ( = ?auto_184049 ?auto_184051 ) ) ( not ( = ?auto_184049 ?auto_184048 ) ) ( not ( = ?auto_184049 ?auto_184050 ) ) ( not ( = ?auto_184052 ?auto_184051 ) ) ( not ( = ?auto_184052 ?auto_184048 ) ) ( not ( = ?auto_184052 ?auto_184050 ) ) ( ON ?auto_184047 ?auto_184052 ) ( ON ?auto_184051 ?auto_184047 ) ( ON ?auto_184050 ?auto_184051 ) ( CLEAR ?auto_184050 ) ( HOLDING ?auto_184048 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184048 )
      ( MAKE-3PILE ?auto_184044 ?auto_184045 ?auto_184046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184053 - BLOCK
      ?auto_184054 - BLOCK
      ?auto_184055 - BLOCK
    )
    :vars
    (
      ?auto_184060 - BLOCK
      ?auto_184058 - BLOCK
      ?auto_184057 - BLOCK
      ?auto_184061 - BLOCK
      ?auto_184059 - BLOCK
      ?auto_184056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184060 ?auto_184055 ) ( ON-TABLE ?auto_184053 ) ( ON ?auto_184054 ?auto_184053 ) ( ON ?auto_184055 ?auto_184054 ) ( not ( = ?auto_184053 ?auto_184054 ) ) ( not ( = ?auto_184053 ?auto_184055 ) ) ( not ( = ?auto_184053 ?auto_184060 ) ) ( not ( = ?auto_184054 ?auto_184055 ) ) ( not ( = ?auto_184054 ?auto_184060 ) ) ( not ( = ?auto_184055 ?auto_184060 ) ) ( not ( = ?auto_184053 ?auto_184058 ) ) ( not ( = ?auto_184053 ?auto_184057 ) ) ( not ( = ?auto_184054 ?auto_184058 ) ) ( not ( = ?auto_184054 ?auto_184057 ) ) ( not ( = ?auto_184055 ?auto_184058 ) ) ( not ( = ?auto_184055 ?auto_184057 ) ) ( not ( = ?auto_184060 ?auto_184058 ) ) ( not ( = ?auto_184060 ?auto_184057 ) ) ( not ( = ?auto_184058 ?auto_184057 ) ) ( ON ?auto_184058 ?auto_184060 ) ( not ( = ?auto_184061 ?auto_184059 ) ) ( not ( = ?auto_184061 ?auto_184056 ) ) ( not ( = ?auto_184061 ?auto_184057 ) ) ( not ( = ?auto_184059 ?auto_184056 ) ) ( not ( = ?auto_184059 ?auto_184057 ) ) ( not ( = ?auto_184056 ?auto_184057 ) ) ( not ( = ?auto_184053 ?auto_184056 ) ) ( not ( = ?auto_184053 ?auto_184061 ) ) ( not ( = ?auto_184053 ?auto_184059 ) ) ( not ( = ?auto_184054 ?auto_184056 ) ) ( not ( = ?auto_184054 ?auto_184061 ) ) ( not ( = ?auto_184054 ?auto_184059 ) ) ( not ( = ?auto_184055 ?auto_184056 ) ) ( not ( = ?auto_184055 ?auto_184061 ) ) ( not ( = ?auto_184055 ?auto_184059 ) ) ( not ( = ?auto_184060 ?auto_184056 ) ) ( not ( = ?auto_184060 ?auto_184061 ) ) ( not ( = ?auto_184060 ?auto_184059 ) ) ( not ( = ?auto_184058 ?auto_184056 ) ) ( not ( = ?auto_184058 ?auto_184061 ) ) ( not ( = ?auto_184058 ?auto_184059 ) ) ( ON ?auto_184057 ?auto_184058 ) ( ON ?auto_184056 ?auto_184057 ) ( ON ?auto_184059 ?auto_184056 ) ( ON ?auto_184061 ?auto_184059 ) ( CLEAR ?auto_184061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184053 ?auto_184054 ?auto_184055 ?auto_184060 ?auto_184058 ?auto_184057 ?auto_184056 ?auto_184059 )
      ( MAKE-3PILE ?auto_184053 ?auto_184054 ?auto_184055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184068 - BLOCK
      ?auto_184069 - BLOCK
      ?auto_184070 - BLOCK
      ?auto_184071 - BLOCK
      ?auto_184072 - BLOCK
      ?auto_184073 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184073 ) ( CLEAR ?auto_184072 ) ( ON-TABLE ?auto_184068 ) ( ON ?auto_184069 ?auto_184068 ) ( ON ?auto_184070 ?auto_184069 ) ( ON ?auto_184071 ?auto_184070 ) ( ON ?auto_184072 ?auto_184071 ) ( not ( = ?auto_184068 ?auto_184069 ) ) ( not ( = ?auto_184068 ?auto_184070 ) ) ( not ( = ?auto_184068 ?auto_184071 ) ) ( not ( = ?auto_184068 ?auto_184072 ) ) ( not ( = ?auto_184068 ?auto_184073 ) ) ( not ( = ?auto_184069 ?auto_184070 ) ) ( not ( = ?auto_184069 ?auto_184071 ) ) ( not ( = ?auto_184069 ?auto_184072 ) ) ( not ( = ?auto_184069 ?auto_184073 ) ) ( not ( = ?auto_184070 ?auto_184071 ) ) ( not ( = ?auto_184070 ?auto_184072 ) ) ( not ( = ?auto_184070 ?auto_184073 ) ) ( not ( = ?auto_184071 ?auto_184072 ) ) ( not ( = ?auto_184071 ?auto_184073 ) ) ( not ( = ?auto_184072 ?auto_184073 ) ) )
    :subtasks
    ( ( !STACK ?auto_184073 ?auto_184072 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184074 - BLOCK
      ?auto_184075 - BLOCK
      ?auto_184076 - BLOCK
      ?auto_184077 - BLOCK
      ?auto_184078 - BLOCK
      ?auto_184079 - BLOCK
    )
    :vars
    (
      ?auto_184080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184078 ) ( ON-TABLE ?auto_184074 ) ( ON ?auto_184075 ?auto_184074 ) ( ON ?auto_184076 ?auto_184075 ) ( ON ?auto_184077 ?auto_184076 ) ( ON ?auto_184078 ?auto_184077 ) ( not ( = ?auto_184074 ?auto_184075 ) ) ( not ( = ?auto_184074 ?auto_184076 ) ) ( not ( = ?auto_184074 ?auto_184077 ) ) ( not ( = ?auto_184074 ?auto_184078 ) ) ( not ( = ?auto_184074 ?auto_184079 ) ) ( not ( = ?auto_184075 ?auto_184076 ) ) ( not ( = ?auto_184075 ?auto_184077 ) ) ( not ( = ?auto_184075 ?auto_184078 ) ) ( not ( = ?auto_184075 ?auto_184079 ) ) ( not ( = ?auto_184076 ?auto_184077 ) ) ( not ( = ?auto_184076 ?auto_184078 ) ) ( not ( = ?auto_184076 ?auto_184079 ) ) ( not ( = ?auto_184077 ?auto_184078 ) ) ( not ( = ?auto_184077 ?auto_184079 ) ) ( not ( = ?auto_184078 ?auto_184079 ) ) ( ON ?auto_184079 ?auto_184080 ) ( CLEAR ?auto_184079 ) ( HAND-EMPTY ) ( not ( = ?auto_184074 ?auto_184080 ) ) ( not ( = ?auto_184075 ?auto_184080 ) ) ( not ( = ?auto_184076 ?auto_184080 ) ) ( not ( = ?auto_184077 ?auto_184080 ) ) ( not ( = ?auto_184078 ?auto_184080 ) ) ( not ( = ?auto_184079 ?auto_184080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184079 ?auto_184080 )
      ( MAKE-6PILE ?auto_184074 ?auto_184075 ?auto_184076 ?auto_184077 ?auto_184078 ?auto_184079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184081 - BLOCK
      ?auto_184082 - BLOCK
      ?auto_184083 - BLOCK
      ?auto_184084 - BLOCK
      ?auto_184085 - BLOCK
      ?auto_184086 - BLOCK
    )
    :vars
    (
      ?auto_184087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184081 ) ( ON ?auto_184082 ?auto_184081 ) ( ON ?auto_184083 ?auto_184082 ) ( ON ?auto_184084 ?auto_184083 ) ( not ( = ?auto_184081 ?auto_184082 ) ) ( not ( = ?auto_184081 ?auto_184083 ) ) ( not ( = ?auto_184081 ?auto_184084 ) ) ( not ( = ?auto_184081 ?auto_184085 ) ) ( not ( = ?auto_184081 ?auto_184086 ) ) ( not ( = ?auto_184082 ?auto_184083 ) ) ( not ( = ?auto_184082 ?auto_184084 ) ) ( not ( = ?auto_184082 ?auto_184085 ) ) ( not ( = ?auto_184082 ?auto_184086 ) ) ( not ( = ?auto_184083 ?auto_184084 ) ) ( not ( = ?auto_184083 ?auto_184085 ) ) ( not ( = ?auto_184083 ?auto_184086 ) ) ( not ( = ?auto_184084 ?auto_184085 ) ) ( not ( = ?auto_184084 ?auto_184086 ) ) ( not ( = ?auto_184085 ?auto_184086 ) ) ( ON ?auto_184086 ?auto_184087 ) ( CLEAR ?auto_184086 ) ( not ( = ?auto_184081 ?auto_184087 ) ) ( not ( = ?auto_184082 ?auto_184087 ) ) ( not ( = ?auto_184083 ?auto_184087 ) ) ( not ( = ?auto_184084 ?auto_184087 ) ) ( not ( = ?auto_184085 ?auto_184087 ) ) ( not ( = ?auto_184086 ?auto_184087 ) ) ( HOLDING ?auto_184085 ) ( CLEAR ?auto_184084 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184081 ?auto_184082 ?auto_184083 ?auto_184084 ?auto_184085 )
      ( MAKE-6PILE ?auto_184081 ?auto_184082 ?auto_184083 ?auto_184084 ?auto_184085 ?auto_184086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184088 - BLOCK
      ?auto_184089 - BLOCK
      ?auto_184090 - BLOCK
      ?auto_184091 - BLOCK
      ?auto_184092 - BLOCK
      ?auto_184093 - BLOCK
    )
    :vars
    (
      ?auto_184094 - BLOCK
      ?auto_184095 - BLOCK
      ?auto_184096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184088 ) ( ON ?auto_184089 ?auto_184088 ) ( ON ?auto_184090 ?auto_184089 ) ( ON ?auto_184091 ?auto_184090 ) ( not ( = ?auto_184088 ?auto_184089 ) ) ( not ( = ?auto_184088 ?auto_184090 ) ) ( not ( = ?auto_184088 ?auto_184091 ) ) ( not ( = ?auto_184088 ?auto_184092 ) ) ( not ( = ?auto_184088 ?auto_184093 ) ) ( not ( = ?auto_184089 ?auto_184090 ) ) ( not ( = ?auto_184089 ?auto_184091 ) ) ( not ( = ?auto_184089 ?auto_184092 ) ) ( not ( = ?auto_184089 ?auto_184093 ) ) ( not ( = ?auto_184090 ?auto_184091 ) ) ( not ( = ?auto_184090 ?auto_184092 ) ) ( not ( = ?auto_184090 ?auto_184093 ) ) ( not ( = ?auto_184091 ?auto_184092 ) ) ( not ( = ?auto_184091 ?auto_184093 ) ) ( not ( = ?auto_184092 ?auto_184093 ) ) ( ON ?auto_184093 ?auto_184094 ) ( not ( = ?auto_184088 ?auto_184094 ) ) ( not ( = ?auto_184089 ?auto_184094 ) ) ( not ( = ?auto_184090 ?auto_184094 ) ) ( not ( = ?auto_184091 ?auto_184094 ) ) ( not ( = ?auto_184092 ?auto_184094 ) ) ( not ( = ?auto_184093 ?auto_184094 ) ) ( CLEAR ?auto_184091 ) ( ON ?auto_184092 ?auto_184093 ) ( CLEAR ?auto_184092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184095 ) ( ON ?auto_184096 ?auto_184095 ) ( ON ?auto_184094 ?auto_184096 ) ( not ( = ?auto_184095 ?auto_184096 ) ) ( not ( = ?auto_184095 ?auto_184094 ) ) ( not ( = ?auto_184095 ?auto_184093 ) ) ( not ( = ?auto_184095 ?auto_184092 ) ) ( not ( = ?auto_184096 ?auto_184094 ) ) ( not ( = ?auto_184096 ?auto_184093 ) ) ( not ( = ?auto_184096 ?auto_184092 ) ) ( not ( = ?auto_184088 ?auto_184095 ) ) ( not ( = ?auto_184088 ?auto_184096 ) ) ( not ( = ?auto_184089 ?auto_184095 ) ) ( not ( = ?auto_184089 ?auto_184096 ) ) ( not ( = ?auto_184090 ?auto_184095 ) ) ( not ( = ?auto_184090 ?auto_184096 ) ) ( not ( = ?auto_184091 ?auto_184095 ) ) ( not ( = ?auto_184091 ?auto_184096 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184095 ?auto_184096 ?auto_184094 ?auto_184093 )
      ( MAKE-6PILE ?auto_184088 ?auto_184089 ?auto_184090 ?auto_184091 ?auto_184092 ?auto_184093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184097 - BLOCK
      ?auto_184098 - BLOCK
      ?auto_184099 - BLOCK
      ?auto_184100 - BLOCK
      ?auto_184101 - BLOCK
      ?auto_184102 - BLOCK
    )
    :vars
    (
      ?auto_184104 - BLOCK
      ?auto_184103 - BLOCK
      ?auto_184105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184097 ) ( ON ?auto_184098 ?auto_184097 ) ( ON ?auto_184099 ?auto_184098 ) ( not ( = ?auto_184097 ?auto_184098 ) ) ( not ( = ?auto_184097 ?auto_184099 ) ) ( not ( = ?auto_184097 ?auto_184100 ) ) ( not ( = ?auto_184097 ?auto_184101 ) ) ( not ( = ?auto_184097 ?auto_184102 ) ) ( not ( = ?auto_184098 ?auto_184099 ) ) ( not ( = ?auto_184098 ?auto_184100 ) ) ( not ( = ?auto_184098 ?auto_184101 ) ) ( not ( = ?auto_184098 ?auto_184102 ) ) ( not ( = ?auto_184099 ?auto_184100 ) ) ( not ( = ?auto_184099 ?auto_184101 ) ) ( not ( = ?auto_184099 ?auto_184102 ) ) ( not ( = ?auto_184100 ?auto_184101 ) ) ( not ( = ?auto_184100 ?auto_184102 ) ) ( not ( = ?auto_184101 ?auto_184102 ) ) ( ON ?auto_184102 ?auto_184104 ) ( not ( = ?auto_184097 ?auto_184104 ) ) ( not ( = ?auto_184098 ?auto_184104 ) ) ( not ( = ?auto_184099 ?auto_184104 ) ) ( not ( = ?auto_184100 ?auto_184104 ) ) ( not ( = ?auto_184101 ?auto_184104 ) ) ( not ( = ?auto_184102 ?auto_184104 ) ) ( ON ?auto_184101 ?auto_184102 ) ( CLEAR ?auto_184101 ) ( ON-TABLE ?auto_184103 ) ( ON ?auto_184105 ?auto_184103 ) ( ON ?auto_184104 ?auto_184105 ) ( not ( = ?auto_184103 ?auto_184105 ) ) ( not ( = ?auto_184103 ?auto_184104 ) ) ( not ( = ?auto_184103 ?auto_184102 ) ) ( not ( = ?auto_184103 ?auto_184101 ) ) ( not ( = ?auto_184105 ?auto_184104 ) ) ( not ( = ?auto_184105 ?auto_184102 ) ) ( not ( = ?auto_184105 ?auto_184101 ) ) ( not ( = ?auto_184097 ?auto_184103 ) ) ( not ( = ?auto_184097 ?auto_184105 ) ) ( not ( = ?auto_184098 ?auto_184103 ) ) ( not ( = ?auto_184098 ?auto_184105 ) ) ( not ( = ?auto_184099 ?auto_184103 ) ) ( not ( = ?auto_184099 ?auto_184105 ) ) ( not ( = ?auto_184100 ?auto_184103 ) ) ( not ( = ?auto_184100 ?auto_184105 ) ) ( HOLDING ?auto_184100 ) ( CLEAR ?auto_184099 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184097 ?auto_184098 ?auto_184099 ?auto_184100 )
      ( MAKE-6PILE ?auto_184097 ?auto_184098 ?auto_184099 ?auto_184100 ?auto_184101 ?auto_184102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184106 - BLOCK
      ?auto_184107 - BLOCK
      ?auto_184108 - BLOCK
      ?auto_184109 - BLOCK
      ?auto_184110 - BLOCK
      ?auto_184111 - BLOCK
    )
    :vars
    (
      ?auto_184114 - BLOCK
      ?auto_184113 - BLOCK
      ?auto_184112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184106 ) ( ON ?auto_184107 ?auto_184106 ) ( ON ?auto_184108 ?auto_184107 ) ( not ( = ?auto_184106 ?auto_184107 ) ) ( not ( = ?auto_184106 ?auto_184108 ) ) ( not ( = ?auto_184106 ?auto_184109 ) ) ( not ( = ?auto_184106 ?auto_184110 ) ) ( not ( = ?auto_184106 ?auto_184111 ) ) ( not ( = ?auto_184107 ?auto_184108 ) ) ( not ( = ?auto_184107 ?auto_184109 ) ) ( not ( = ?auto_184107 ?auto_184110 ) ) ( not ( = ?auto_184107 ?auto_184111 ) ) ( not ( = ?auto_184108 ?auto_184109 ) ) ( not ( = ?auto_184108 ?auto_184110 ) ) ( not ( = ?auto_184108 ?auto_184111 ) ) ( not ( = ?auto_184109 ?auto_184110 ) ) ( not ( = ?auto_184109 ?auto_184111 ) ) ( not ( = ?auto_184110 ?auto_184111 ) ) ( ON ?auto_184111 ?auto_184114 ) ( not ( = ?auto_184106 ?auto_184114 ) ) ( not ( = ?auto_184107 ?auto_184114 ) ) ( not ( = ?auto_184108 ?auto_184114 ) ) ( not ( = ?auto_184109 ?auto_184114 ) ) ( not ( = ?auto_184110 ?auto_184114 ) ) ( not ( = ?auto_184111 ?auto_184114 ) ) ( ON ?auto_184110 ?auto_184111 ) ( ON-TABLE ?auto_184113 ) ( ON ?auto_184112 ?auto_184113 ) ( ON ?auto_184114 ?auto_184112 ) ( not ( = ?auto_184113 ?auto_184112 ) ) ( not ( = ?auto_184113 ?auto_184114 ) ) ( not ( = ?auto_184113 ?auto_184111 ) ) ( not ( = ?auto_184113 ?auto_184110 ) ) ( not ( = ?auto_184112 ?auto_184114 ) ) ( not ( = ?auto_184112 ?auto_184111 ) ) ( not ( = ?auto_184112 ?auto_184110 ) ) ( not ( = ?auto_184106 ?auto_184113 ) ) ( not ( = ?auto_184106 ?auto_184112 ) ) ( not ( = ?auto_184107 ?auto_184113 ) ) ( not ( = ?auto_184107 ?auto_184112 ) ) ( not ( = ?auto_184108 ?auto_184113 ) ) ( not ( = ?auto_184108 ?auto_184112 ) ) ( not ( = ?auto_184109 ?auto_184113 ) ) ( not ( = ?auto_184109 ?auto_184112 ) ) ( CLEAR ?auto_184108 ) ( ON ?auto_184109 ?auto_184110 ) ( CLEAR ?auto_184109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184113 ?auto_184112 ?auto_184114 ?auto_184111 ?auto_184110 )
      ( MAKE-6PILE ?auto_184106 ?auto_184107 ?auto_184108 ?auto_184109 ?auto_184110 ?auto_184111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184115 - BLOCK
      ?auto_184116 - BLOCK
      ?auto_184117 - BLOCK
      ?auto_184118 - BLOCK
      ?auto_184119 - BLOCK
      ?auto_184120 - BLOCK
    )
    :vars
    (
      ?auto_184123 - BLOCK
      ?auto_184121 - BLOCK
      ?auto_184122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184115 ) ( ON ?auto_184116 ?auto_184115 ) ( not ( = ?auto_184115 ?auto_184116 ) ) ( not ( = ?auto_184115 ?auto_184117 ) ) ( not ( = ?auto_184115 ?auto_184118 ) ) ( not ( = ?auto_184115 ?auto_184119 ) ) ( not ( = ?auto_184115 ?auto_184120 ) ) ( not ( = ?auto_184116 ?auto_184117 ) ) ( not ( = ?auto_184116 ?auto_184118 ) ) ( not ( = ?auto_184116 ?auto_184119 ) ) ( not ( = ?auto_184116 ?auto_184120 ) ) ( not ( = ?auto_184117 ?auto_184118 ) ) ( not ( = ?auto_184117 ?auto_184119 ) ) ( not ( = ?auto_184117 ?auto_184120 ) ) ( not ( = ?auto_184118 ?auto_184119 ) ) ( not ( = ?auto_184118 ?auto_184120 ) ) ( not ( = ?auto_184119 ?auto_184120 ) ) ( ON ?auto_184120 ?auto_184123 ) ( not ( = ?auto_184115 ?auto_184123 ) ) ( not ( = ?auto_184116 ?auto_184123 ) ) ( not ( = ?auto_184117 ?auto_184123 ) ) ( not ( = ?auto_184118 ?auto_184123 ) ) ( not ( = ?auto_184119 ?auto_184123 ) ) ( not ( = ?auto_184120 ?auto_184123 ) ) ( ON ?auto_184119 ?auto_184120 ) ( ON-TABLE ?auto_184121 ) ( ON ?auto_184122 ?auto_184121 ) ( ON ?auto_184123 ?auto_184122 ) ( not ( = ?auto_184121 ?auto_184122 ) ) ( not ( = ?auto_184121 ?auto_184123 ) ) ( not ( = ?auto_184121 ?auto_184120 ) ) ( not ( = ?auto_184121 ?auto_184119 ) ) ( not ( = ?auto_184122 ?auto_184123 ) ) ( not ( = ?auto_184122 ?auto_184120 ) ) ( not ( = ?auto_184122 ?auto_184119 ) ) ( not ( = ?auto_184115 ?auto_184121 ) ) ( not ( = ?auto_184115 ?auto_184122 ) ) ( not ( = ?auto_184116 ?auto_184121 ) ) ( not ( = ?auto_184116 ?auto_184122 ) ) ( not ( = ?auto_184117 ?auto_184121 ) ) ( not ( = ?auto_184117 ?auto_184122 ) ) ( not ( = ?auto_184118 ?auto_184121 ) ) ( not ( = ?auto_184118 ?auto_184122 ) ) ( ON ?auto_184118 ?auto_184119 ) ( CLEAR ?auto_184118 ) ( HOLDING ?auto_184117 ) ( CLEAR ?auto_184116 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184115 ?auto_184116 ?auto_184117 )
      ( MAKE-6PILE ?auto_184115 ?auto_184116 ?auto_184117 ?auto_184118 ?auto_184119 ?auto_184120 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184124 - BLOCK
      ?auto_184125 - BLOCK
      ?auto_184126 - BLOCK
      ?auto_184127 - BLOCK
      ?auto_184128 - BLOCK
      ?auto_184129 - BLOCK
    )
    :vars
    (
      ?auto_184130 - BLOCK
      ?auto_184131 - BLOCK
      ?auto_184132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184124 ) ( ON ?auto_184125 ?auto_184124 ) ( not ( = ?auto_184124 ?auto_184125 ) ) ( not ( = ?auto_184124 ?auto_184126 ) ) ( not ( = ?auto_184124 ?auto_184127 ) ) ( not ( = ?auto_184124 ?auto_184128 ) ) ( not ( = ?auto_184124 ?auto_184129 ) ) ( not ( = ?auto_184125 ?auto_184126 ) ) ( not ( = ?auto_184125 ?auto_184127 ) ) ( not ( = ?auto_184125 ?auto_184128 ) ) ( not ( = ?auto_184125 ?auto_184129 ) ) ( not ( = ?auto_184126 ?auto_184127 ) ) ( not ( = ?auto_184126 ?auto_184128 ) ) ( not ( = ?auto_184126 ?auto_184129 ) ) ( not ( = ?auto_184127 ?auto_184128 ) ) ( not ( = ?auto_184127 ?auto_184129 ) ) ( not ( = ?auto_184128 ?auto_184129 ) ) ( ON ?auto_184129 ?auto_184130 ) ( not ( = ?auto_184124 ?auto_184130 ) ) ( not ( = ?auto_184125 ?auto_184130 ) ) ( not ( = ?auto_184126 ?auto_184130 ) ) ( not ( = ?auto_184127 ?auto_184130 ) ) ( not ( = ?auto_184128 ?auto_184130 ) ) ( not ( = ?auto_184129 ?auto_184130 ) ) ( ON ?auto_184128 ?auto_184129 ) ( ON-TABLE ?auto_184131 ) ( ON ?auto_184132 ?auto_184131 ) ( ON ?auto_184130 ?auto_184132 ) ( not ( = ?auto_184131 ?auto_184132 ) ) ( not ( = ?auto_184131 ?auto_184130 ) ) ( not ( = ?auto_184131 ?auto_184129 ) ) ( not ( = ?auto_184131 ?auto_184128 ) ) ( not ( = ?auto_184132 ?auto_184130 ) ) ( not ( = ?auto_184132 ?auto_184129 ) ) ( not ( = ?auto_184132 ?auto_184128 ) ) ( not ( = ?auto_184124 ?auto_184131 ) ) ( not ( = ?auto_184124 ?auto_184132 ) ) ( not ( = ?auto_184125 ?auto_184131 ) ) ( not ( = ?auto_184125 ?auto_184132 ) ) ( not ( = ?auto_184126 ?auto_184131 ) ) ( not ( = ?auto_184126 ?auto_184132 ) ) ( not ( = ?auto_184127 ?auto_184131 ) ) ( not ( = ?auto_184127 ?auto_184132 ) ) ( ON ?auto_184127 ?auto_184128 ) ( CLEAR ?auto_184125 ) ( ON ?auto_184126 ?auto_184127 ) ( CLEAR ?auto_184126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184131 ?auto_184132 ?auto_184130 ?auto_184129 ?auto_184128 ?auto_184127 )
      ( MAKE-6PILE ?auto_184124 ?auto_184125 ?auto_184126 ?auto_184127 ?auto_184128 ?auto_184129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184133 - BLOCK
      ?auto_184134 - BLOCK
      ?auto_184135 - BLOCK
      ?auto_184136 - BLOCK
      ?auto_184137 - BLOCK
      ?auto_184138 - BLOCK
    )
    :vars
    (
      ?auto_184139 - BLOCK
      ?auto_184140 - BLOCK
      ?auto_184141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184133 ) ( not ( = ?auto_184133 ?auto_184134 ) ) ( not ( = ?auto_184133 ?auto_184135 ) ) ( not ( = ?auto_184133 ?auto_184136 ) ) ( not ( = ?auto_184133 ?auto_184137 ) ) ( not ( = ?auto_184133 ?auto_184138 ) ) ( not ( = ?auto_184134 ?auto_184135 ) ) ( not ( = ?auto_184134 ?auto_184136 ) ) ( not ( = ?auto_184134 ?auto_184137 ) ) ( not ( = ?auto_184134 ?auto_184138 ) ) ( not ( = ?auto_184135 ?auto_184136 ) ) ( not ( = ?auto_184135 ?auto_184137 ) ) ( not ( = ?auto_184135 ?auto_184138 ) ) ( not ( = ?auto_184136 ?auto_184137 ) ) ( not ( = ?auto_184136 ?auto_184138 ) ) ( not ( = ?auto_184137 ?auto_184138 ) ) ( ON ?auto_184138 ?auto_184139 ) ( not ( = ?auto_184133 ?auto_184139 ) ) ( not ( = ?auto_184134 ?auto_184139 ) ) ( not ( = ?auto_184135 ?auto_184139 ) ) ( not ( = ?auto_184136 ?auto_184139 ) ) ( not ( = ?auto_184137 ?auto_184139 ) ) ( not ( = ?auto_184138 ?auto_184139 ) ) ( ON ?auto_184137 ?auto_184138 ) ( ON-TABLE ?auto_184140 ) ( ON ?auto_184141 ?auto_184140 ) ( ON ?auto_184139 ?auto_184141 ) ( not ( = ?auto_184140 ?auto_184141 ) ) ( not ( = ?auto_184140 ?auto_184139 ) ) ( not ( = ?auto_184140 ?auto_184138 ) ) ( not ( = ?auto_184140 ?auto_184137 ) ) ( not ( = ?auto_184141 ?auto_184139 ) ) ( not ( = ?auto_184141 ?auto_184138 ) ) ( not ( = ?auto_184141 ?auto_184137 ) ) ( not ( = ?auto_184133 ?auto_184140 ) ) ( not ( = ?auto_184133 ?auto_184141 ) ) ( not ( = ?auto_184134 ?auto_184140 ) ) ( not ( = ?auto_184134 ?auto_184141 ) ) ( not ( = ?auto_184135 ?auto_184140 ) ) ( not ( = ?auto_184135 ?auto_184141 ) ) ( not ( = ?auto_184136 ?auto_184140 ) ) ( not ( = ?auto_184136 ?auto_184141 ) ) ( ON ?auto_184136 ?auto_184137 ) ( ON ?auto_184135 ?auto_184136 ) ( CLEAR ?auto_184135 ) ( HOLDING ?auto_184134 ) ( CLEAR ?auto_184133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184133 ?auto_184134 )
      ( MAKE-6PILE ?auto_184133 ?auto_184134 ?auto_184135 ?auto_184136 ?auto_184137 ?auto_184138 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184142 - BLOCK
      ?auto_184143 - BLOCK
      ?auto_184144 - BLOCK
      ?auto_184145 - BLOCK
      ?auto_184146 - BLOCK
      ?auto_184147 - BLOCK
    )
    :vars
    (
      ?auto_184148 - BLOCK
      ?auto_184149 - BLOCK
      ?auto_184150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184142 ) ( not ( = ?auto_184142 ?auto_184143 ) ) ( not ( = ?auto_184142 ?auto_184144 ) ) ( not ( = ?auto_184142 ?auto_184145 ) ) ( not ( = ?auto_184142 ?auto_184146 ) ) ( not ( = ?auto_184142 ?auto_184147 ) ) ( not ( = ?auto_184143 ?auto_184144 ) ) ( not ( = ?auto_184143 ?auto_184145 ) ) ( not ( = ?auto_184143 ?auto_184146 ) ) ( not ( = ?auto_184143 ?auto_184147 ) ) ( not ( = ?auto_184144 ?auto_184145 ) ) ( not ( = ?auto_184144 ?auto_184146 ) ) ( not ( = ?auto_184144 ?auto_184147 ) ) ( not ( = ?auto_184145 ?auto_184146 ) ) ( not ( = ?auto_184145 ?auto_184147 ) ) ( not ( = ?auto_184146 ?auto_184147 ) ) ( ON ?auto_184147 ?auto_184148 ) ( not ( = ?auto_184142 ?auto_184148 ) ) ( not ( = ?auto_184143 ?auto_184148 ) ) ( not ( = ?auto_184144 ?auto_184148 ) ) ( not ( = ?auto_184145 ?auto_184148 ) ) ( not ( = ?auto_184146 ?auto_184148 ) ) ( not ( = ?auto_184147 ?auto_184148 ) ) ( ON ?auto_184146 ?auto_184147 ) ( ON-TABLE ?auto_184149 ) ( ON ?auto_184150 ?auto_184149 ) ( ON ?auto_184148 ?auto_184150 ) ( not ( = ?auto_184149 ?auto_184150 ) ) ( not ( = ?auto_184149 ?auto_184148 ) ) ( not ( = ?auto_184149 ?auto_184147 ) ) ( not ( = ?auto_184149 ?auto_184146 ) ) ( not ( = ?auto_184150 ?auto_184148 ) ) ( not ( = ?auto_184150 ?auto_184147 ) ) ( not ( = ?auto_184150 ?auto_184146 ) ) ( not ( = ?auto_184142 ?auto_184149 ) ) ( not ( = ?auto_184142 ?auto_184150 ) ) ( not ( = ?auto_184143 ?auto_184149 ) ) ( not ( = ?auto_184143 ?auto_184150 ) ) ( not ( = ?auto_184144 ?auto_184149 ) ) ( not ( = ?auto_184144 ?auto_184150 ) ) ( not ( = ?auto_184145 ?auto_184149 ) ) ( not ( = ?auto_184145 ?auto_184150 ) ) ( ON ?auto_184145 ?auto_184146 ) ( ON ?auto_184144 ?auto_184145 ) ( CLEAR ?auto_184142 ) ( ON ?auto_184143 ?auto_184144 ) ( CLEAR ?auto_184143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184149 ?auto_184150 ?auto_184148 ?auto_184147 ?auto_184146 ?auto_184145 ?auto_184144 )
      ( MAKE-6PILE ?auto_184142 ?auto_184143 ?auto_184144 ?auto_184145 ?auto_184146 ?auto_184147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184151 - BLOCK
      ?auto_184152 - BLOCK
      ?auto_184153 - BLOCK
      ?auto_184154 - BLOCK
      ?auto_184155 - BLOCK
      ?auto_184156 - BLOCK
    )
    :vars
    (
      ?auto_184157 - BLOCK
      ?auto_184159 - BLOCK
      ?auto_184158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184151 ?auto_184152 ) ) ( not ( = ?auto_184151 ?auto_184153 ) ) ( not ( = ?auto_184151 ?auto_184154 ) ) ( not ( = ?auto_184151 ?auto_184155 ) ) ( not ( = ?auto_184151 ?auto_184156 ) ) ( not ( = ?auto_184152 ?auto_184153 ) ) ( not ( = ?auto_184152 ?auto_184154 ) ) ( not ( = ?auto_184152 ?auto_184155 ) ) ( not ( = ?auto_184152 ?auto_184156 ) ) ( not ( = ?auto_184153 ?auto_184154 ) ) ( not ( = ?auto_184153 ?auto_184155 ) ) ( not ( = ?auto_184153 ?auto_184156 ) ) ( not ( = ?auto_184154 ?auto_184155 ) ) ( not ( = ?auto_184154 ?auto_184156 ) ) ( not ( = ?auto_184155 ?auto_184156 ) ) ( ON ?auto_184156 ?auto_184157 ) ( not ( = ?auto_184151 ?auto_184157 ) ) ( not ( = ?auto_184152 ?auto_184157 ) ) ( not ( = ?auto_184153 ?auto_184157 ) ) ( not ( = ?auto_184154 ?auto_184157 ) ) ( not ( = ?auto_184155 ?auto_184157 ) ) ( not ( = ?auto_184156 ?auto_184157 ) ) ( ON ?auto_184155 ?auto_184156 ) ( ON-TABLE ?auto_184159 ) ( ON ?auto_184158 ?auto_184159 ) ( ON ?auto_184157 ?auto_184158 ) ( not ( = ?auto_184159 ?auto_184158 ) ) ( not ( = ?auto_184159 ?auto_184157 ) ) ( not ( = ?auto_184159 ?auto_184156 ) ) ( not ( = ?auto_184159 ?auto_184155 ) ) ( not ( = ?auto_184158 ?auto_184157 ) ) ( not ( = ?auto_184158 ?auto_184156 ) ) ( not ( = ?auto_184158 ?auto_184155 ) ) ( not ( = ?auto_184151 ?auto_184159 ) ) ( not ( = ?auto_184151 ?auto_184158 ) ) ( not ( = ?auto_184152 ?auto_184159 ) ) ( not ( = ?auto_184152 ?auto_184158 ) ) ( not ( = ?auto_184153 ?auto_184159 ) ) ( not ( = ?auto_184153 ?auto_184158 ) ) ( not ( = ?auto_184154 ?auto_184159 ) ) ( not ( = ?auto_184154 ?auto_184158 ) ) ( ON ?auto_184154 ?auto_184155 ) ( ON ?auto_184153 ?auto_184154 ) ( ON ?auto_184152 ?auto_184153 ) ( CLEAR ?auto_184152 ) ( HOLDING ?auto_184151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184151 )
      ( MAKE-6PILE ?auto_184151 ?auto_184152 ?auto_184153 ?auto_184154 ?auto_184155 ?auto_184156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184160 - BLOCK
      ?auto_184161 - BLOCK
      ?auto_184162 - BLOCK
      ?auto_184163 - BLOCK
      ?auto_184164 - BLOCK
      ?auto_184165 - BLOCK
    )
    :vars
    (
      ?auto_184168 - BLOCK
      ?auto_184167 - BLOCK
      ?auto_184166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184160 ?auto_184161 ) ) ( not ( = ?auto_184160 ?auto_184162 ) ) ( not ( = ?auto_184160 ?auto_184163 ) ) ( not ( = ?auto_184160 ?auto_184164 ) ) ( not ( = ?auto_184160 ?auto_184165 ) ) ( not ( = ?auto_184161 ?auto_184162 ) ) ( not ( = ?auto_184161 ?auto_184163 ) ) ( not ( = ?auto_184161 ?auto_184164 ) ) ( not ( = ?auto_184161 ?auto_184165 ) ) ( not ( = ?auto_184162 ?auto_184163 ) ) ( not ( = ?auto_184162 ?auto_184164 ) ) ( not ( = ?auto_184162 ?auto_184165 ) ) ( not ( = ?auto_184163 ?auto_184164 ) ) ( not ( = ?auto_184163 ?auto_184165 ) ) ( not ( = ?auto_184164 ?auto_184165 ) ) ( ON ?auto_184165 ?auto_184168 ) ( not ( = ?auto_184160 ?auto_184168 ) ) ( not ( = ?auto_184161 ?auto_184168 ) ) ( not ( = ?auto_184162 ?auto_184168 ) ) ( not ( = ?auto_184163 ?auto_184168 ) ) ( not ( = ?auto_184164 ?auto_184168 ) ) ( not ( = ?auto_184165 ?auto_184168 ) ) ( ON ?auto_184164 ?auto_184165 ) ( ON-TABLE ?auto_184167 ) ( ON ?auto_184166 ?auto_184167 ) ( ON ?auto_184168 ?auto_184166 ) ( not ( = ?auto_184167 ?auto_184166 ) ) ( not ( = ?auto_184167 ?auto_184168 ) ) ( not ( = ?auto_184167 ?auto_184165 ) ) ( not ( = ?auto_184167 ?auto_184164 ) ) ( not ( = ?auto_184166 ?auto_184168 ) ) ( not ( = ?auto_184166 ?auto_184165 ) ) ( not ( = ?auto_184166 ?auto_184164 ) ) ( not ( = ?auto_184160 ?auto_184167 ) ) ( not ( = ?auto_184160 ?auto_184166 ) ) ( not ( = ?auto_184161 ?auto_184167 ) ) ( not ( = ?auto_184161 ?auto_184166 ) ) ( not ( = ?auto_184162 ?auto_184167 ) ) ( not ( = ?auto_184162 ?auto_184166 ) ) ( not ( = ?auto_184163 ?auto_184167 ) ) ( not ( = ?auto_184163 ?auto_184166 ) ) ( ON ?auto_184163 ?auto_184164 ) ( ON ?auto_184162 ?auto_184163 ) ( ON ?auto_184161 ?auto_184162 ) ( ON ?auto_184160 ?auto_184161 ) ( CLEAR ?auto_184160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184167 ?auto_184166 ?auto_184168 ?auto_184165 ?auto_184164 ?auto_184163 ?auto_184162 ?auto_184161 )
      ( MAKE-6PILE ?auto_184160 ?auto_184161 ?auto_184162 ?auto_184163 ?auto_184164 ?auto_184165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184171 - BLOCK
      ?auto_184172 - BLOCK
    )
    :vars
    (
      ?auto_184173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184173 ?auto_184172 ) ( CLEAR ?auto_184173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184171 ) ( ON ?auto_184172 ?auto_184171 ) ( not ( = ?auto_184171 ?auto_184172 ) ) ( not ( = ?auto_184171 ?auto_184173 ) ) ( not ( = ?auto_184172 ?auto_184173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184173 ?auto_184172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184174 - BLOCK
      ?auto_184175 - BLOCK
    )
    :vars
    (
      ?auto_184176 - BLOCK
      ?auto_184177 - BLOCK
      ?auto_184178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184176 ?auto_184175 ) ( CLEAR ?auto_184176 ) ( ON-TABLE ?auto_184174 ) ( ON ?auto_184175 ?auto_184174 ) ( not ( = ?auto_184174 ?auto_184175 ) ) ( not ( = ?auto_184174 ?auto_184176 ) ) ( not ( = ?auto_184175 ?auto_184176 ) ) ( HOLDING ?auto_184177 ) ( CLEAR ?auto_184178 ) ( not ( = ?auto_184174 ?auto_184177 ) ) ( not ( = ?auto_184174 ?auto_184178 ) ) ( not ( = ?auto_184175 ?auto_184177 ) ) ( not ( = ?auto_184175 ?auto_184178 ) ) ( not ( = ?auto_184176 ?auto_184177 ) ) ( not ( = ?auto_184176 ?auto_184178 ) ) ( not ( = ?auto_184177 ?auto_184178 ) ) )
    :subtasks
    ( ( !STACK ?auto_184177 ?auto_184178 )
      ( MAKE-2PILE ?auto_184174 ?auto_184175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184179 - BLOCK
      ?auto_184180 - BLOCK
    )
    :vars
    (
      ?auto_184181 - BLOCK
      ?auto_184183 - BLOCK
      ?auto_184182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184181 ?auto_184180 ) ( ON-TABLE ?auto_184179 ) ( ON ?auto_184180 ?auto_184179 ) ( not ( = ?auto_184179 ?auto_184180 ) ) ( not ( = ?auto_184179 ?auto_184181 ) ) ( not ( = ?auto_184180 ?auto_184181 ) ) ( CLEAR ?auto_184183 ) ( not ( = ?auto_184179 ?auto_184182 ) ) ( not ( = ?auto_184179 ?auto_184183 ) ) ( not ( = ?auto_184180 ?auto_184182 ) ) ( not ( = ?auto_184180 ?auto_184183 ) ) ( not ( = ?auto_184181 ?auto_184182 ) ) ( not ( = ?auto_184181 ?auto_184183 ) ) ( not ( = ?auto_184182 ?auto_184183 ) ) ( ON ?auto_184182 ?auto_184181 ) ( CLEAR ?auto_184182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184179 ?auto_184180 ?auto_184181 )
      ( MAKE-2PILE ?auto_184179 ?auto_184180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184184 - BLOCK
      ?auto_184185 - BLOCK
    )
    :vars
    (
      ?auto_184187 - BLOCK
      ?auto_184188 - BLOCK
      ?auto_184186 - BLOCK
      ?auto_184192 - BLOCK
      ?auto_184190 - BLOCK
      ?auto_184189 - BLOCK
      ?auto_184191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184187 ?auto_184185 ) ( ON-TABLE ?auto_184184 ) ( ON ?auto_184185 ?auto_184184 ) ( not ( = ?auto_184184 ?auto_184185 ) ) ( not ( = ?auto_184184 ?auto_184187 ) ) ( not ( = ?auto_184185 ?auto_184187 ) ) ( not ( = ?auto_184184 ?auto_184188 ) ) ( not ( = ?auto_184184 ?auto_184186 ) ) ( not ( = ?auto_184185 ?auto_184188 ) ) ( not ( = ?auto_184185 ?auto_184186 ) ) ( not ( = ?auto_184187 ?auto_184188 ) ) ( not ( = ?auto_184187 ?auto_184186 ) ) ( not ( = ?auto_184188 ?auto_184186 ) ) ( ON ?auto_184188 ?auto_184187 ) ( CLEAR ?auto_184188 ) ( HOLDING ?auto_184186 ) ( CLEAR ?auto_184192 ) ( ON-TABLE ?auto_184190 ) ( ON ?auto_184189 ?auto_184190 ) ( ON ?auto_184191 ?auto_184189 ) ( ON ?auto_184192 ?auto_184191 ) ( not ( = ?auto_184190 ?auto_184189 ) ) ( not ( = ?auto_184190 ?auto_184191 ) ) ( not ( = ?auto_184190 ?auto_184192 ) ) ( not ( = ?auto_184190 ?auto_184186 ) ) ( not ( = ?auto_184189 ?auto_184191 ) ) ( not ( = ?auto_184189 ?auto_184192 ) ) ( not ( = ?auto_184189 ?auto_184186 ) ) ( not ( = ?auto_184191 ?auto_184192 ) ) ( not ( = ?auto_184191 ?auto_184186 ) ) ( not ( = ?auto_184192 ?auto_184186 ) ) ( not ( = ?auto_184184 ?auto_184192 ) ) ( not ( = ?auto_184184 ?auto_184190 ) ) ( not ( = ?auto_184184 ?auto_184189 ) ) ( not ( = ?auto_184184 ?auto_184191 ) ) ( not ( = ?auto_184185 ?auto_184192 ) ) ( not ( = ?auto_184185 ?auto_184190 ) ) ( not ( = ?auto_184185 ?auto_184189 ) ) ( not ( = ?auto_184185 ?auto_184191 ) ) ( not ( = ?auto_184187 ?auto_184192 ) ) ( not ( = ?auto_184187 ?auto_184190 ) ) ( not ( = ?auto_184187 ?auto_184189 ) ) ( not ( = ?auto_184187 ?auto_184191 ) ) ( not ( = ?auto_184188 ?auto_184192 ) ) ( not ( = ?auto_184188 ?auto_184190 ) ) ( not ( = ?auto_184188 ?auto_184189 ) ) ( not ( = ?auto_184188 ?auto_184191 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184190 ?auto_184189 ?auto_184191 ?auto_184192 ?auto_184186 )
      ( MAKE-2PILE ?auto_184184 ?auto_184185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184193 - BLOCK
      ?auto_184194 - BLOCK
    )
    :vars
    (
      ?auto_184195 - BLOCK
      ?auto_184197 - BLOCK
      ?auto_184200 - BLOCK
      ?auto_184201 - BLOCK
      ?auto_184196 - BLOCK
      ?auto_184199 - BLOCK
      ?auto_184198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184195 ?auto_184194 ) ( ON-TABLE ?auto_184193 ) ( ON ?auto_184194 ?auto_184193 ) ( not ( = ?auto_184193 ?auto_184194 ) ) ( not ( = ?auto_184193 ?auto_184195 ) ) ( not ( = ?auto_184194 ?auto_184195 ) ) ( not ( = ?auto_184193 ?auto_184197 ) ) ( not ( = ?auto_184193 ?auto_184200 ) ) ( not ( = ?auto_184194 ?auto_184197 ) ) ( not ( = ?auto_184194 ?auto_184200 ) ) ( not ( = ?auto_184195 ?auto_184197 ) ) ( not ( = ?auto_184195 ?auto_184200 ) ) ( not ( = ?auto_184197 ?auto_184200 ) ) ( ON ?auto_184197 ?auto_184195 ) ( CLEAR ?auto_184201 ) ( ON-TABLE ?auto_184196 ) ( ON ?auto_184199 ?auto_184196 ) ( ON ?auto_184198 ?auto_184199 ) ( ON ?auto_184201 ?auto_184198 ) ( not ( = ?auto_184196 ?auto_184199 ) ) ( not ( = ?auto_184196 ?auto_184198 ) ) ( not ( = ?auto_184196 ?auto_184201 ) ) ( not ( = ?auto_184196 ?auto_184200 ) ) ( not ( = ?auto_184199 ?auto_184198 ) ) ( not ( = ?auto_184199 ?auto_184201 ) ) ( not ( = ?auto_184199 ?auto_184200 ) ) ( not ( = ?auto_184198 ?auto_184201 ) ) ( not ( = ?auto_184198 ?auto_184200 ) ) ( not ( = ?auto_184201 ?auto_184200 ) ) ( not ( = ?auto_184193 ?auto_184201 ) ) ( not ( = ?auto_184193 ?auto_184196 ) ) ( not ( = ?auto_184193 ?auto_184199 ) ) ( not ( = ?auto_184193 ?auto_184198 ) ) ( not ( = ?auto_184194 ?auto_184201 ) ) ( not ( = ?auto_184194 ?auto_184196 ) ) ( not ( = ?auto_184194 ?auto_184199 ) ) ( not ( = ?auto_184194 ?auto_184198 ) ) ( not ( = ?auto_184195 ?auto_184201 ) ) ( not ( = ?auto_184195 ?auto_184196 ) ) ( not ( = ?auto_184195 ?auto_184199 ) ) ( not ( = ?auto_184195 ?auto_184198 ) ) ( not ( = ?auto_184197 ?auto_184201 ) ) ( not ( = ?auto_184197 ?auto_184196 ) ) ( not ( = ?auto_184197 ?auto_184199 ) ) ( not ( = ?auto_184197 ?auto_184198 ) ) ( ON ?auto_184200 ?auto_184197 ) ( CLEAR ?auto_184200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184193 ?auto_184194 ?auto_184195 ?auto_184197 )
      ( MAKE-2PILE ?auto_184193 ?auto_184194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184202 - BLOCK
      ?auto_184203 - BLOCK
    )
    :vars
    (
      ?auto_184207 - BLOCK
      ?auto_184208 - BLOCK
      ?auto_184206 - BLOCK
      ?auto_184205 - BLOCK
      ?auto_184209 - BLOCK
      ?auto_184204 - BLOCK
      ?auto_184210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184207 ?auto_184203 ) ( ON-TABLE ?auto_184202 ) ( ON ?auto_184203 ?auto_184202 ) ( not ( = ?auto_184202 ?auto_184203 ) ) ( not ( = ?auto_184202 ?auto_184207 ) ) ( not ( = ?auto_184203 ?auto_184207 ) ) ( not ( = ?auto_184202 ?auto_184208 ) ) ( not ( = ?auto_184202 ?auto_184206 ) ) ( not ( = ?auto_184203 ?auto_184208 ) ) ( not ( = ?auto_184203 ?auto_184206 ) ) ( not ( = ?auto_184207 ?auto_184208 ) ) ( not ( = ?auto_184207 ?auto_184206 ) ) ( not ( = ?auto_184208 ?auto_184206 ) ) ( ON ?auto_184208 ?auto_184207 ) ( ON-TABLE ?auto_184205 ) ( ON ?auto_184209 ?auto_184205 ) ( ON ?auto_184204 ?auto_184209 ) ( not ( = ?auto_184205 ?auto_184209 ) ) ( not ( = ?auto_184205 ?auto_184204 ) ) ( not ( = ?auto_184205 ?auto_184210 ) ) ( not ( = ?auto_184205 ?auto_184206 ) ) ( not ( = ?auto_184209 ?auto_184204 ) ) ( not ( = ?auto_184209 ?auto_184210 ) ) ( not ( = ?auto_184209 ?auto_184206 ) ) ( not ( = ?auto_184204 ?auto_184210 ) ) ( not ( = ?auto_184204 ?auto_184206 ) ) ( not ( = ?auto_184210 ?auto_184206 ) ) ( not ( = ?auto_184202 ?auto_184210 ) ) ( not ( = ?auto_184202 ?auto_184205 ) ) ( not ( = ?auto_184202 ?auto_184209 ) ) ( not ( = ?auto_184202 ?auto_184204 ) ) ( not ( = ?auto_184203 ?auto_184210 ) ) ( not ( = ?auto_184203 ?auto_184205 ) ) ( not ( = ?auto_184203 ?auto_184209 ) ) ( not ( = ?auto_184203 ?auto_184204 ) ) ( not ( = ?auto_184207 ?auto_184210 ) ) ( not ( = ?auto_184207 ?auto_184205 ) ) ( not ( = ?auto_184207 ?auto_184209 ) ) ( not ( = ?auto_184207 ?auto_184204 ) ) ( not ( = ?auto_184208 ?auto_184210 ) ) ( not ( = ?auto_184208 ?auto_184205 ) ) ( not ( = ?auto_184208 ?auto_184209 ) ) ( not ( = ?auto_184208 ?auto_184204 ) ) ( ON ?auto_184206 ?auto_184208 ) ( CLEAR ?auto_184206 ) ( HOLDING ?auto_184210 ) ( CLEAR ?auto_184204 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184205 ?auto_184209 ?auto_184204 ?auto_184210 )
      ( MAKE-2PILE ?auto_184202 ?auto_184203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184211 - BLOCK
      ?auto_184212 - BLOCK
    )
    :vars
    (
      ?auto_184219 - BLOCK
      ?auto_184216 - BLOCK
      ?auto_184213 - BLOCK
      ?auto_184217 - BLOCK
      ?auto_184218 - BLOCK
      ?auto_184214 - BLOCK
      ?auto_184215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184219 ?auto_184212 ) ( ON-TABLE ?auto_184211 ) ( ON ?auto_184212 ?auto_184211 ) ( not ( = ?auto_184211 ?auto_184212 ) ) ( not ( = ?auto_184211 ?auto_184219 ) ) ( not ( = ?auto_184212 ?auto_184219 ) ) ( not ( = ?auto_184211 ?auto_184216 ) ) ( not ( = ?auto_184211 ?auto_184213 ) ) ( not ( = ?auto_184212 ?auto_184216 ) ) ( not ( = ?auto_184212 ?auto_184213 ) ) ( not ( = ?auto_184219 ?auto_184216 ) ) ( not ( = ?auto_184219 ?auto_184213 ) ) ( not ( = ?auto_184216 ?auto_184213 ) ) ( ON ?auto_184216 ?auto_184219 ) ( ON-TABLE ?auto_184217 ) ( ON ?auto_184218 ?auto_184217 ) ( ON ?auto_184214 ?auto_184218 ) ( not ( = ?auto_184217 ?auto_184218 ) ) ( not ( = ?auto_184217 ?auto_184214 ) ) ( not ( = ?auto_184217 ?auto_184215 ) ) ( not ( = ?auto_184217 ?auto_184213 ) ) ( not ( = ?auto_184218 ?auto_184214 ) ) ( not ( = ?auto_184218 ?auto_184215 ) ) ( not ( = ?auto_184218 ?auto_184213 ) ) ( not ( = ?auto_184214 ?auto_184215 ) ) ( not ( = ?auto_184214 ?auto_184213 ) ) ( not ( = ?auto_184215 ?auto_184213 ) ) ( not ( = ?auto_184211 ?auto_184215 ) ) ( not ( = ?auto_184211 ?auto_184217 ) ) ( not ( = ?auto_184211 ?auto_184218 ) ) ( not ( = ?auto_184211 ?auto_184214 ) ) ( not ( = ?auto_184212 ?auto_184215 ) ) ( not ( = ?auto_184212 ?auto_184217 ) ) ( not ( = ?auto_184212 ?auto_184218 ) ) ( not ( = ?auto_184212 ?auto_184214 ) ) ( not ( = ?auto_184219 ?auto_184215 ) ) ( not ( = ?auto_184219 ?auto_184217 ) ) ( not ( = ?auto_184219 ?auto_184218 ) ) ( not ( = ?auto_184219 ?auto_184214 ) ) ( not ( = ?auto_184216 ?auto_184215 ) ) ( not ( = ?auto_184216 ?auto_184217 ) ) ( not ( = ?auto_184216 ?auto_184218 ) ) ( not ( = ?auto_184216 ?auto_184214 ) ) ( ON ?auto_184213 ?auto_184216 ) ( CLEAR ?auto_184214 ) ( ON ?auto_184215 ?auto_184213 ) ( CLEAR ?auto_184215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184211 ?auto_184212 ?auto_184219 ?auto_184216 ?auto_184213 )
      ( MAKE-2PILE ?auto_184211 ?auto_184212 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184220 - BLOCK
      ?auto_184221 - BLOCK
    )
    :vars
    (
      ?auto_184223 - BLOCK
      ?auto_184228 - BLOCK
      ?auto_184226 - BLOCK
      ?auto_184227 - BLOCK
      ?auto_184225 - BLOCK
      ?auto_184224 - BLOCK
      ?auto_184222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184223 ?auto_184221 ) ( ON-TABLE ?auto_184220 ) ( ON ?auto_184221 ?auto_184220 ) ( not ( = ?auto_184220 ?auto_184221 ) ) ( not ( = ?auto_184220 ?auto_184223 ) ) ( not ( = ?auto_184221 ?auto_184223 ) ) ( not ( = ?auto_184220 ?auto_184228 ) ) ( not ( = ?auto_184220 ?auto_184226 ) ) ( not ( = ?auto_184221 ?auto_184228 ) ) ( not ( = ?auto_184221 ?auto_184226 ) ) ( not ( = ?auto_184223 ?auto_184228 ) ) ( not ( = ?auto_184223 ?auto_184226 ) ) ( not ( = ?auto_184228 ?auto_184226 ) ) ( ON ?auto_184228 ?auto_184223 ) ( ON-TABLE ?auto_184227 ) ( ON ?auto_184225 ?auto_184227 ) ( not ( = ?auto_184227 ?auto_184225 ) ) ( not ( = ?auto_184227 ?auto_184224 ) ) ( not ( = ?auto_184227 ?auto_184222 ) ) ( not ( = ?auto_184227 ?auto_184226 ) ) ( not ( = ?auto_184225 ?auto_184224 ) ) ( not ( = ?auto_184225 ?auto_184222 ) ) ( not ( = ?auto_184225 ?auto_184226 ) ) ( not ( = ?auto_184224 ?auto_184222 ) ) ( not ( = ?auto_184224 ?auto_184226 ) ) ( not ( = ?auto_184222 ?auto_184226 ) ) ( not ( = ?auto_184220 ?auto_184222 ) ) ( not ( = ?auto_184220 ?auto_184227 ) ) ( not ( = ?auto_184220 ?auto_184225 ) ) ( not ( = ?auto_184220 ?auto_184224 ) ) ( not ( = ?auto_184221 ?auto_184222 ) ) ( not ( = ?auto_184221 ?auto_184227 ) ) ( not ( = ?auto_184221 ?auto_184225 ) ) ( not ( = ?auto_184221 ?auto_184224 ) ) ( not ( = ?auto_184223 ?auto_184222 ) ) ( not ( = ?auto_184223 ?auto_184227 ) ) ( not ( = ?auto_184223 ?auto_184225 ) ) ( not ( = ?auto_184223 ?auto_184224 ) ) ( not ( = ?auto_184228 ?auto_184222 ) ) ( not ( = ?auto_184228 ?auto_184227 ) ) ( not ( = ?auto_184228 ?auto_184225 ) ) ( not ( = ?auto_184228 ?auto_184224 ) ) ( ON ?auto_184226 ?auto_184228 ) ( ON ?auto_184222 ?auto_184226 ) ( CLEAR ?auto_184222 ) ( HOLDING ?auto_184224 ) ( CLEAR ?auto_184225 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184227 ?auto_184225 ?auto_184224 )
      ( MAKE-2PILE ?auto_184220 ?auto_184221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184229 - BLOCK
      ?auto_184230 - BLOCK
    )
    :vars
    (
      ?auto_184235 - BLOCK
      ?auto_184236 - BLOCK
      ?auto_184234 - BLOCK
      ?auto_184231 - BLOCK
      ?auto_184232 - BLOCK
      ?auto_184233 - BLOCK
      ?auto_184237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184235 ?auto_184230 ) ( ON-TABLE ?auto_184229 ) ( ON ?auto_184230 ?auto_184229 ) ( not ( = ?auto_184229 ?auto_184230 ) ) ( not ( = ?auto_184229 ?auto_184235 ) ) ( not ( = ?auto_184230 ?auto_184235 ) ) ( not ( = ?auto_184229 ?auto_184236 ) ) ( not ( = ?auto_184229 ?auto_184234 ) ) ( not ( = ?auto_184230 ?auto_184236 ) ) ( not ( = ?auto_184230 ?auto_184234 ) ) ( not ( = ?auto_184235 ?auto_184236 ) ) ( not ( = ?auto_184235 ?auto_184234 ) ) ( not ( = ?auto_184236 ?auto_184234 ) ) ( ON ?auto_184236 ?auto_184235 ) ( ON-TABLE ?auto_184231 ) ( ON ?auto_184232 ?auto_184231 ) ( not ( = ?auto_184231 ?auto_184232 ) ) ( not ( = ?auto_184231 ?auto_184233 ) ) ( not ( = ?auto_184231 ?auto_184237 ) ) ( not ( = ?auto_184231 ?auto_184234 ) ) ( not ( = ?auto_184232 ?auto_184233 ) ) ( not ( = ?auto_184232 ?auto_184237 ) ) ( not ( = ?auto_184232 ?auto_184234 ) ) ( not ( = ?auto_184233 ?auto_184237 ) ) ( not ( = ?auto_184233 ?auto_184234 ) ) ( not ( = ?auto_184237 ?auto_184234 ) ) ( not ( = ?auto_184229 ?auto_184237 ) ) ( not ( = ?auto_184229 ?auto_184231 ) ) ( not ( = ?auto_184229 ?auto_184232 ) ) ( not ( = ?auto_184229 ?auto_184233 ) ) ( not ( = ?auto_184230 ?auto_184237 ) ) ( not ( = ?auto_184230 ?auto_184231 ) ) ( not ( = ?auto_184230 ?auto_184232 ) ) ( not ( = ?auto_184230 ?auto_184233 ) ) ( not ( = ?auto_184235 ?auto_184237 ) ) ( not ( = ?auto_184235 ?auto_184231 ) ) ( not ( = ?auto_184235 ?auto_184232 ) ) ( not ( = ?auto_184235 ?auto_184233 ) ) ( not ( = ?auto_184236 ?auto_184237 ) ) ( not ( = ?auto_184236 ?auto_184231 ) ) ( not ( = ?auto_184236 ?auto_184232 ) ) ( not ( = ?auto_184236 ?auto_184233 ) ) ( ON ?auto_184234 ?auto_184236 ) ( ON ?auto_184237 ?auto_184234 ) ( CLEAR ?auto_184232 ) ( ON ?auto_184233 ?auto_184237 ) ( CLEAR ?auto_184233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184229 ?auto_184230 ?auto_184235 ?auto_184236 ?auto_184234 ?auto_184237 )
      ( MAKE-2PILE ?auto_184229 ?auto_184230 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184238 - BLOCK
      ?auto_184239 - BLOCK
    )
    :vars
    (
      ?auto_184240 - BLOCK
      ?auto_184243 - BLOCK
      ?auto_184241 - BLOCK
      ?auto_184246 - BLOCK
      ?auto_184245 - BLOCK
      ?auto_184242 - BLOCK
      ?auto_184244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184240 ?auto_184239 ) ( ON-TABLE ?auto_184238 ) ( ON ?auto_184239 ?auto_184238 ) ( not ( = ?auto_184238 ?auto_184239 ) ) ( not ( = ?auto_184238 ?auto_184240 ) ) ( not ( = ?auto_184239 ?auto_184240 ) ) ( not ( = ?auto_184238 ?auto_184243 ) ) ( not ( = ?auto_184238 ?auto_184241 ) ) ( not ( = ?auto_184239 ?auto_184243 ) ) ( not ( = ?auto_184239 ?auto_184241 ) ) ( not ( = ?auto_184240 ?auto_184243 ) ) ( not ( = ?auto_184240 ?auto_184241 ) ) ( not ( = ?auto_184243 ?auto_184241 ) ) ( ON ?auto_184243 ?auto_184240 ) ( ON-TABLE ?auto_184246 ) ( not ( = ?auto_184246 ?auto_184245 ) ) ( not ( = ?auto_184246 ?auto_184242 ) ) ( not ( = ?auto_184246 ?auto_184244 ) ) ( not ( = ?auto_184246 ?auto_184241 ) ) ( not ( = ?auto_184245 ?auto_184242 ) ) ( not ( = ?auto_184245 ?auto_184244 ) ) ( not ( = ?auto_184245 ?auto_184241 ) ) ( not ( = ?auto_184242 ?auto_184244 ) ) ( not ( = ?auto_184242 ?auto_184241 ) ) ( not ( = ?auto_184244 ?auto_184241 ) ) ( not ( = ?auto_184238 ?auto_184244 ) ) ( not ( = ?auto_184238 ?auto_184246 ) ) ( not ( = ?auto_184238 ?auto_184245 ) ) ( not ( = ?auto_184238 ?auto_184242 ) ) ( not ( = ?auto_184239 ?auto_184244 ) ) ( not ( = ?auto_184239 ?auto_184246 ) ) ( not ( = ?auto_184239 ?auto_184245 ) ) ( not ( = ?auto_184239 ?auto_184242 ) ) ( not ( = ?auto_184240 ?auto_184244 ) ) ( not ( = ?auto_184240 ?auto_184246 ) ) ( not ( = ?auto_184240 ?auto_184245 ) ) ( not ( = ?auto_184240 ?auto_184242 ) ) ( not ( = ?auto_184243 ?auto_184244 ) ) ( not ( = ?auto_184243 ?auto_184246 ) ) ( not ( = ?auto_184243 ?auto_184245 ) ) ( not ( = ?auto_184243 ?auto_184242 ) ) ( ON ?auto_184241 ?auto_184243 ) ( ON ?auto_184244 ?auto_184241 ) ( ON ?auto_184242 ?auto_184244 ) ( CLEAR ?auto_184242 ) ( HOLDING ?auto_184245 ) ( CLEAR ?auto_184246 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184246 ?auto_184245 )
      ( MAKE-2PILE ?auto_184238 ?auto_184239 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184247 - BLOCK
      ?auto_184248 - BLOCK
    )
    :vars
    (
      ?auto_184249 - BLOCK
      ?auto_184251 - BLOCK
      ?auto_184253 - BLOCK
      ?auto_184255 - BLOCK
      ?auto_184254 - BLOCK
      ?auto_184252 - BLOCK
      ?auto_184250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184249 ?auto_184248 ) ( ON-TABLE ?auto_184247 ) ( ON ?auto_184248 ?auto_184247 ) ( not ( = ?auto_184247 ?auto_184248 ) ) ( not ( = ?auto_184247 ?auto_184249 ) ) ( not ( = ?auto_184248 ?auto_184249 ) ) ( not ( = ?auto_184247 ?auto_184251 ) ) ( not ( = ?auto_184247 ?auto_184253 ) ) ( not ( = ?auto_184248 ?auto_184251 ) ) ( not ( = ?auto_184248 ?auto_184253 ) ) ( not ( = ?auto_184249 ?auto_184251 ) ) ( not ( = ?auto_184249 ?auto_184253 ) ) ( not ( = ?auto_184251 ?auto_184253 ) ) ( ON ?auto_184251 ?auto_184249 ) ( ON-TABLE ?auto_184255 ) ( not ( = ?auto_184255 ?auto_184254 ) ) ( not ( = ?auto_184255 ?auto_184252 ) ) ( not ( = ?auto_184255 ?auto_184250 ) ) ( not ( = ?auto_184255 ?auto_184253 ) ) ( not ( = ?auto_184254 ?auto_184252 ) ) ( not ( = ?auto_184254 ?auto_184250 ) ) ( not ( = ?auto_184254 ?auto_184253 ) ) ( not ( = ?auto_184252 ?auto_184250 ) ) ( not ( = ?auto_184252 ?auto_184253 ) ) ( not ( = ?auto_184250 ?auto_184253 ) ) ( not ( = ?auto_184247 ?auto_184250 ) ) ( not ( = ?auto_184247 ?auto_184255 ) ) ( not ( = ?auto_184247 ?auto_184254 ) ) ( not ( = ?auto_184247 ?auto_184252 ) ) ( not ( = ?auto_184248 ?auto_184250 ) ) ( not ( = ?auto_184248 ?auto_184255 ) ) ( not ( = ?auto_184248 ?auto_184254 ) ) ( not ( = ?auto_184248 ?auto_184252 ) ) ( not ( = ?auto_184249 ?auto_184250 ) ) ( not ( = ?auto_184249 ?auto_184255 ) ) ( not ( = ?auto_184249 ?auto_184254 ) ) ( not ( = ?auto_184249 ?auto_184252 ) ) ( not ( = ?auto_184251 ?auto_184250 ) ) ( not ( = ?auto_184251 ?auto_184255 ) ) ( not ( = ?auto_184251 ?auto_184254 ) ) ( not ( = ?auto_184251 ?auto_184252 ) ) ( ON ?auto_184253 ?auto_184251 ) ( ON ?auto_184250 ?auto_184253 ) ( ON ?auto_184252 ?auto_184250 ) ( CLEAR ?auto_184255 ) ( ON ?auto_184254 ?auto_184252 ) ( CLEAR ?auto_184254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184247 ?auto_184248 ?auto_184249 ?auto_184251 ?auto_184253 ?auto_184250 ?auto_184252 )
      ( MAKE-2PILE ?auto_184247 ?auto_184248 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184256 - BLOCK
      ?auto_184257 - BLOCK
    )
    :vars
    (
      ?auto_184264 - BLOCK
      ?auto_184259 - BLOCK
      ?auto_184263 - BLOCK
      ?auto_184260 - BLOCK
      ?auto_184262 - BLOCK
      ?auto_184261 - BLOCK
      ?auto_184258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184264 ?auto_184257 ) ( ON-TABLE ?auto_184256 ) ( ON ?auto_184257 ?auto_184256 ) ( not ( = ?auto_184256 ?auto_184257 ) ) ( not ( = ?auto_184256 ?auto_184264 ) ) ( not ( = ?auto_184257 ?auto_184264 ) ) ( not ( = ?auto_184256 ?auto_184259 ) ) ( not ( = ?auto_184256 ?auto_184263 ) ) ( not ( = ?auto_184257 ?auto_184259 ) ) ( not ( = ?auto_184257 ?auto_184263 ) ) ( not ( = ?auto_184264 ?auto_184259 ) ) ( not ( = ?auto_184264 ?auto_184263 ) ) ( not ( = ?auto_184259 ?auto_184263 ) ) ( ON ?auto_184259 ?auto_184264 ) ( not ( = ?auto_184260 ?auto_184262 ) ) ( not ( = ?auto_184260 ?auto_184261 ) ) ( not ( = ?auto_184260 ?auto_184258 ) ) ( not ( = ?auto_184260 ?auto_184263 ) ) ( not ( = ?auto_184262 ?auto_184261 ) ) ( not ( = ?auto_184262 ?auto_184258 ) ) ( not ( = ?auto_184262 ?auto_184263 ) ) ( not ( = ?auto_184261 ?auto_184258 ) ) ( not ( = ?auto_184261 ?auto_184263 ) ) ( not ( = ?auto_184258 ?auto_184263 ) ) ( not ( = ?auto_184256 ?auto_184258 ) ) ( not ( = ?auto_184256 ?auto_184260 ) ) ( not ( = ?auto_184256 ?auto_184262 ) ) ( not ( = ?auto_184256 ?auto_184261 ) ) ( not ( = ?auto_184257 ?auto_184258 ) ) ( not ( = ?auto_184257 ?auto_184260 ) ) ( not ( = ?auto_184257 ?auto_184262 ) ) ( not ( = ?auto_184257 ?auto_184261 ) ) ( not ( = ?auto_184264 ?auto_184258 ) ) ( not ( = ?auto_184264 ?auto_184260 ) ) ( not ( = ?auto_184264 ?auto_184262 ) ) ( not ( = ?auto_184264 ?auto_184261 ) ) ( not ( = ?auto_184259 ?auto_184258 ) ) ( not ( = ?auto_184259 ?auto_184260 ) ) ( not ( = ?auto_184259 ?auto_184262 ) ) ( not ( = ?auto_184259 ?auto_184261 ) ) ( ON ?auto_184263 ?auto_184259 ) ( ON ?auto_184258 ?auto_184263 ) ( ON ?auto_184261 ?auto_184258 ) ( ON ?auto_184262 ?auto_184261 ) ( CLEAR ?auto_184262 ) ( HOLDING ?auto_184260 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184260 )
      ( MAKE-2PILE ?auto_184256 ?auto_184257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184265 - BLOCK
      ?auto_184266 - BLOCK
    )
    :vars
    (
      ?auto_184272 - BLOCK
      ?auto_184269 - BLOCK
      ?auto_184273 - BLOCK
      ?auto_184268 - BLOCK
      ?auto_184267 - BLOCK
      ?auto_184271 - BLOCK
      ?auto_184270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184272 ?auto_184266 ) ( ON-TABLE ?auto_184265 ) ( ON ?auto_184266 ?auto_184265 ) ( not ( = ?auto_184265 ?auto_184266 ) ) ( not ( = ?auto_184265 ?auto_184272 ) ) ( not ( = ?auto_184266 ?auto_184272 ) ) ( not ( = ?auto_184265 ?auto_184269 ) ) ( not ( = ?auto_184265 ?auto_184273 ) ) ( not ( = ?auto_184266 ?auto_184269 ) ) ( not ( = ?auto_184266 ?auto_184273 ) ) ( not ( = ?auto_184272 ?auto_184269 ) ) ( not ( = ?auto_184272 ?auto_184273 ) ) ( not ( = ?auto_184269 ?auto_184273 ) ) ( ON ?auto_184269 ?auto_184272 ) ( not ( = ?auto_184268 ?auto_184267 ) ) ( not ( = ?auto_184268 ?auto_184271 ) ) ( not ( = ?auto_184268 ?auto_184270 ) ) ( not ( = ?auto_184268 ?auto_184273 ) ) ( not ( = ?auto_184267 ?auto_184271 ) ) ( not ( = ?auto_184267 ?auto_184270 ) ) ( not ( = ?auto_184267 ?auto_184273 ) ) ( not ( = ?auto_184271 ?auto_184270 ) ) ( not ( = ?auto_184271 ?auto_184273 ) ) ( not ( = ?auto_184270 ?auto_184273 ) ) ( not ( = ?auto_184265 ?auto_184270 ) ) ( not ( = ?auto_184265 ?auto_184268 ) ) ( not ( = ?auto_184265 ?auto_184267 ) ) ( not ( = ?auto_184265 ?auto_184271 ) ) ( not ( = ?auto_184266 ?auto_184270 ) ) ( not ( = ?auto_184266 ?auto_184268 ) ) ( not ( = ?auto_184266 ?auto_184267 ) ) ( not ( = ?auto_184266 ?auto_184271 ) ) ( not ( = ?auto_184272 ?auto_184270 ) ) ( not ( = ?auto_184272 ?auto_184268 ) ) ( not ( = ?auto_184272 ?auto_184267 ) ) ( not ( = ?auto_184272 ?auto_184271 ) ) ( not ( = ?auto_184269 ?auto_184270 ) ) ( not ( = ?auto_184269 ?auto_184268 ) ) ( not ( = ?auto_184269 ?auto_184267 ) ) ( not ( = ?auto_184269 ?auto_184271 ) ) ( ON ?auto_184273 ?auto_184269 ) ( ON ?auto_184270 ?auto_184273 ) ( ON ?auto_184271 ?auto_184270 ) ( ON ?auto_184267 ?auto_184271 ) ( ON ?auto_184268 ?auto_184267 ) ( CLEAR ?auto_184268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184265 ?auto_184266 ?auto_184272 ?auto_184269 ?auto_184273 ?auto_184270 ?auto_184271 ?auto_184267 )
      ( MAKE-2PILE ?auto_184265 ?auto_184266 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184281 - BLOCK
      ?auto_184282 - BLOCK
      ?auto_184283 - BLOCK
      ?auto_184284 - BLOCK
      ?auto_184285 - BLOCK
      ?auto_184286 - BLOCK
      ?auto_184287 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184287 ) ( CLEAR ?auto_184286 ) ( ON-TABLE ?auto_184281 ) ( ON ?auto_184282 ?auto_184281 ) ( ON ?auto_184283 ?auto_184282 ) ( ON ?auto_184284 ?auto_184283 ) ( ON ?auto_184285 ?auto_184284 ) ( ON ?auto_184286 ?auto_184285 ) ( not ( = ?auto_184281 ?auto_184282 ) ) ( not ( = ?auto_184281 ?auto_184283 ) ) ( not ( = ?auto_184281 ?auto_184284 ) ) ( not ( = ?auto_184281 ?auto_184285 ) ) ( not ( = ?auto_184281 ?auto_184286 ) ) ( not ( = ?auto_184281 ?auto_184287 ) ) ( not ( = ?auto_184282 ?auto_184283 ) ) ( not ( = ?auto_184282 ?auto_184284 ) ) ( not ( = ?auto_184282 ?auto_184285 ) ) ( not ( = ?auto_184282 ?auto_184286 ) ) ( not ( = ?auto_184282 ?auto_184287 ) ) ( not ( = ?auto_184283 ?auto_184284 ) ) ( not ( = ?auto_184283 ?auto_184285 ) ) ( not ( = ?auto_184283 ?auto_184286 ) ) ( not ( = ?auto_184283 ?auto_184287 ) ) ( not ( = ?auto_184284 ?auto_184285 ) ) ( not ( = ?auto_184284 ?auto_184286 ) ) ( not ( = ?auto_184284 ?auto_184287 ) ) ( not ( = ?auto_184285 ?auto_184286 ) ) ( not ( = ?auto_184285 ?auto_184287 ) ) ( not ( = ?auto_184286 ?auto_184287 ) ) )
    :subtasks
    ( ( !STACK ?auto_184287 ?auto_184286 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184288 - BLOCK
      ?auto_184289 - BLOCK
      ?auto_184290 - BLOCK
      ?auto_184291 - BLOCK
      ?auto_184292 - BLOCK
      ?auto_184293 - BLOCK
      ?auto_184294 - BLOCK
    )
    :vars
    (
      ?auto_184295 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184293 ) ( ON-TABLE ?auto_184288 ) ( ON ?auto_184289 ?auto_184288 ) ( ON ?auto_184290 ?auto_184289 ) ( ON ?auto_184291 ?auto_184290 ) ( ON ?auto_184292 ?auto_184291 ) ( ON ?auto_184293 ?auto_184292 ) ( not ( = ?auto_184288 ?auto_184289 ) ) ( not ( = ?auto_184288 ?auto_184290 ) ) ( not ( = ?auto_184288 ?auto_184291 ) ) ( not ( = ?auto_184288 ?auto_184292 ) ) ( not ( = ?auto_184288 ?auto_184293 ) ) ( not ( = ?auto_184288 ?auto_184294 ) ) ( not ( = ?auto_184289 ?auto_184290 ) ) ( not ( = ?auto_184289 ?auto_184291 ) ) ( not ( = ?auto_184289 ?auto_184292 ) ) ( not ( = ?auto_184289 ?auto_184293 ) ) ( not ( = ?auto_184289 ?auto_184294 ) ) ( not ( = ?auto_184290 ?auto_184291 ) ) ( not ( = ?auto_184290 ?auto_184292 ) ) ( not ( = ?auto_184290 ?auto_184293 ) ) ( not ( = ?auto_184290 ?auto_184294 ) ) ( not ( = ?auto_184291 ?auto_184292 ) ) ( not ( = ?auto_184291 ?auto_184293 ) ) ( not ( = ?auto_184291 ?auto_184294 ) ) ( not ( = ?auto_184292 ?auto_184293 ) ) ( not ( = ?auto_184292 ?auto_184294 ) ) ( not ( = ?auto_184293 ?auto_184294 ) ) ( ON ?auto_184294 ?auto_184295 ) ( CLEAR ?auto_184294 ) ( HAND-EMPTY ) ( not ( = ?auto_184288 ?auto_184295 ) ) ( not ( = ?auto_184289 ?auto_184295 ) ) ( not ( = ?auto_184290 ?auto_184295 ) ) ( not ( = ?auto_184291 ?auto_184295 ) ) ( not ( = ?auto_184292 ?auto_184295 ) ) ( not ( = ?auto_184293 ?auto_184295 ) ) ( not ( = ?auto_184294 ?auto_184295 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184294 ?auto_184295 )
      ( MAKE-7PILE ?auto_184288 ?auto_184289 ?auto_184290 ?auto_184291 ?auto_184292 ?auto_184293 ?auto_184294 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184296 - BLOCK
      ?auto_184297 - BLOCK
      ?auto_184298 - BLOCK
      ?auto_184299 - BLOCK
      ?auto_184300 - BLOCK
      ?auto_184301 - BLOCK
      ?auto_184302 - BLOCK
    )
    :vars
    (
      ?auto_184303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184296 ) ( ON ?auto_184297 ?auto_184296 ) ( ON ?auto_184298 ?auto_184297 ) ( ON ?auto_184299 ?auto_184298 ) ( ON ?auto_184300 ?auto_184299 ) ( not ( = ?auto_184296 ?auto_184297 ) ) ( not ( = ?auto_184296 ?auto_184298 ) ) ( not ( = ?auto_184296 ?auto_184299 ) ) ( not ( = ?auto_184296 ?auto_184300 ) ) ( not ( = ?auto_184296 ?auto_184301 ) ) ( not ( = ?auto_184296 ?auto_184302 ) ) ( not ( = ?auto_184297 ?auto_184298 ) ) ( not ( = ?auto_184297 ?auto_184299 ) ) ( not ( = ?auto_184297 ?auto_184300 ) ) ( not ( = ?auto_184297 ?auto_184301 ) ) ( not ( = ?auto_184297 ?auto_184302 ) ) ( not ( = ?auto_184298 ?auto_184299 ) ) ( not ( = ?auto_184298 ?auto_184300 ) ) ( not ( = ?auto_184298 ?auto_184301 ) ) ( not ( = ?auto_184298 ?auto_184302 ) ) ( not ( = ?auto_184299 ?auto_184300 ) ) ( not ( = ?auto_184299 ?auto_184301 ) ) ( not ( = ?auto_184299 ?auto_184302 ) ) ( not ( = ?auto_184300 ?auto_184301 ) ) ( not ( = ?auto_184300 ?auto_184302 ) ) ( not ( = ?auto_184301 ?auto_184302 ) ) ( ON ?auto_184302 ?auto_184303 ) ( CLEAR ?auto_184302 ) ( not ( = ?auto_184296 ?auto_184303 ) ) ( not ( = ?auto_184297 ?auto_184303 ) ) ( not ( = ?auto_184298 ?auto_184303 ) ) ( not ( = ?auto_184299 ?auto_184303 ) ) ( not ( = ?auto_184300 ?auto_184303 ) ) ( not ( = ?auto_184301 ?auto_184303 ) ) ( not ( = ?auto_184302 ?auto_184303 ) ) ( HOLDING ?auto_184301 ) ( CLEAR ?auto_184300 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184296 ?auto_184297 ?auto_184298 ?auto_184299 ?auto_184300 ?auto_184301 )
      ( MAKE-7PILE ?auto_184296 ?auto_184297 ?auto_184298 ?auto_184299 ?auto_184300 ?auto_184301 ?auto_184302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184304 - BLOCK
      ?auto_184305 - BLOCK
      ?auto_184306 - BLOCK
      ?auto_184307 - BLOCK
      ?auto_184308 - BLOCK
      ?auto_184309 - BLOCK
      ?auto_184310 - BLOCK
    )
    :vars
    (
      ?auto_184311 - BLOCK
      ?auto_184312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184304 ) ( ON ?auto_184305 ?auto_184304 ) ( ON ?auto_184306 ?auto_184305 ) ( ON ?auto_184307 ?auto_184306 ) ( ON ?auto_184308 ?auto_184307 ) ( not ( = ?auto_184304 ?auto_184305 ) ) ( not ( = ?auto_184304 ?auto_184306 ) ) ( not ( = ?auto_184304 ?auto_184307 ) ) ( not ( = ?auto_184304 ?auto_184308 ) ) ( not ( = ?auto_184304 ?auto_184309 ) ) ( not ( = ?auto_184304 ?auto_184310 ) ) ( not ( = ?auto_184305 ?auto_184306 ) ) ( not ( = ?auto_184305 ?auto_184307 ) ) ( not ( = ?auto_184305 ?auto_184308 ) ) ( not ( = ?auto_184305 ?auto_184309 ) ) ( not ( = ?auto_184305 ?auto_184310 ) ) ( not ( = ?auto_184306 ?auto_184307 ) ) ( not ( = ?auto_184306 ?auto_184308 ) ) ( not ( = ?auto_184306 ?auto_184309 ) ) ( not ( = ?auto_184306 ?auto_184310 ) ) ( not ( = ?auto_184307 ?auto_184308 ) ) ( not ( = ?auto_184307 ?auto_184309 ) ) ( not ( = ?auto_184307 ?auto_184310 ) ) ( not ( = ?auto_184308 ?auto_184309 ) ) ( not ( = ?auto_184308 ?auto_184310 ) ) ( not ( = ?auto_184309 ?auto_184310 ) ) ( ON ?auto_184310 ?auto_184311 ) ( not ( = ?auto_184304 ?auto_184311 ) ) ( not ( = ?auto_184305 ?auto_184311 ) ) ( not ( = ?auto_184306 ?auto_184311 ) ) ( not ( = ?auto_184307 ?auto_184311 ) ) ( not ( = ?auto_184308 ?auto_184311 ) ) ( not ( = ?auto_184309 ?auto_184311 ) ) ( not ( = ?auto_184310 ?auto_184311 ) ) ( CLEAR ?auto_184308 ) ( ON ?auto_184309 ?auto_184310 ) ( CLEAR ?auto_184309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184312 ) ( ON ?auto_184311 ?auto_184312 ) ( not ( = ?auto_184312 ?auto_184311 ) ) ( not ( = ?auto_184312 ?auto_184310 ) ) ( not ( = ?auto_184312 ?auto_184309 ) ) ( not ( = ?auto_184304 ?auto_184312 ) ) ( not ( = ?auto_184305 ?auto_184312 ) ) ( not ( = ?auto_184306 ?auto_184312 ) ) ( not ( = ?auto_184307 ?auto_184312 ) ) ( not ( = ?auto_184308 ?auto_184312 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184312 ?auto_184311 ?auto_184310 )
      ( MAKE-7PILE ?auto_184304 ?auto_184305 ?auto_184306 ?auto_184307 ?auto_184308 ?auto_184309 ?auto_184310 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184313 - BLOCK
      ?auto_184314 - BLOCK
      ?auto_184315 - BLOCK
      ?auto_184316 - BLOCK
      ?auto_184317 - BLOCK
      ?auto_184318 - BLOCK
      ?auto_184319 - BLOCK
    )
    :vars
    (
      ?auto_184321 - BLOCK
      ?auto_184320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184313 ) ( ON ?auto_184314 ?auto_184313 ) ( ON ?auto_184315 ?auto_184314 ) ( ON ?auto_184316 ?auto_184315 ) ( not ( = ?auto_184313 ?auto_184314 ) ) ( not ( = ?auto_184313 ?auto_184315 ) ) ( not ( = ?auto_184313 ?auto_184316 ) ) ( not ( = ?auto_184313 ?auto_184317 ) ) ( not ( = ?auto_184313 ?auto_184318 ) ) ( not ( = ?auto_184313 ?auto_184319 ) ) ( not ( = ?auto_184314 ?auto_184315 ) ) ( not ( = ?auto_184314 ?auto_184316 ) ) ( not ( = ?auto_184314 ?auto_184317 ) ) ( not ( = ?auto_184314 ?auto_184318 ) ) ( not ( = ?auto_184314 ?auto_184319 ) ) ( not ( = ?auto_184315 ?auto_184316 ) ) ( not ( = ?auto_184315 ?auto_184317 ) ) ( not ( = ?auto_184315 ?auto_184318 ) ) ( not ( = ?auto_184315 ?auto_184319 ) ) ( not ( = ?auto_184316 ?auto_184317 ) ) ( not ( = ?auto_184316 ?auto_184318 ) ) ( not ( = ?auto_184316 ?auto_184319 ) ) ( not ( = ?auto_184317 ?auto_184318 ) ) ( not ( = ?auto_184317 ?auto_184319 ) ) ( not ( = ?auto_184318 ?auto_184319 ) ) ( ON ?auto_184319 ?auto_184321 ) ( not ( = ?auto_184313 ?auto_184321 ) ) ( not ( = ?auto_184314 ?auto_184321 ) ) ( not ( = ?auto_184315 ?auto_184321 ) ) ( not ( = ?auto_184316 ?auto_184321 ) ) ( not ( = ?auto_184317 ?auto_184321 ) ) ( not ( = ?auto_184318 ?auto_184321 ) ) ( not ( = ?auto_184319 ?auto_184321 ) ) ( ON ?auto_184318 ?auto_184319 ) ( CLEAR ?auto_184318 ) ( ON-TABLE ?auto_184320 ) ( ON ?auto_184321 ?auto_184320 ) ( not ( = ?auto_184320 ?auto_184321 ) ) ( not ( = ?auto_184320 ?auto_184319 ) ) ( not ( = ?auto_184320 ?auto_184318 ) ) ( not ( = ?auto_184313 ?auto_184320 ) ) ( not ( = ?auto_184314 ?auto_184320 ) ) ( not ( = ?auto_184315 ?auto_184320 ) ) ( not ( = ?auto_184316 ?auto_184320 ) ) ( not ( = ?auto_184317 ?auto_184320 ) ) ( HOLDING ?auto_184317 ) ( CLEAR ?auto_184316 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184313 ?auto_184314 ?auto_184315 ?auto_184316 ?auto_184317 )
      ( MAKE-7PILE ?auto_184313 ?auto_184314 ?auto_184315 ?auto_184316 ?auto_184317 ?auto_184318 ?auto_184319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184322 - BLOCK
      ?auto_184323 - BLOCK
      ?auto_184324 - BLOCK
      ?auto_184325 - BLOCK
      ?auto_184326 - BLOCK
      ?auto_184327 - BLOCK
      ?auto_184328 - BLOCK
    )
    :vars
    (
      ?auto_184330 - BLOCK
      ?auto_184329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184322 ) ( ON ?auto_184323 ?auto_184322 ) ( ON ?auto_184324 ?auto_184323 ) ( ON ?auto_184325 ?auto_184324 ) ( not ( = ?auto_184322 ?auto_184323 ) ) ( not ( = ?auto_184322 ?auto_184324 ) ) ( not ( = ?auto_184322 ?auto_184325 ) ) ( not ( = ?auto_184322 ?auto_184326 ) ) ( not ( = ?auto_184322 ?auto_184327 ) ) ( not ( = ?auto_184322 ?auto_184328 ) ) ( not ( = ?auto_184323 ?auto_184324 ) ) ( not ( = ?auto_184323 ?auto_184325 ) ) ( not ( = ?auto_184323 ?auto_184326 ) ) ( not ( = ?auto_184323 ?auto_184327 ) ) ( not ( = ?auto_184323 ?auto_184328 ) ) ( not ( = ?auto_184324 ?auto_184325 ) ) ( not ( = ?auto_184324 ?auto_184326 ) ) ( not ( = ?auto_184324 ?auto_184327 ) ) ( not ( = ?auto_184324 ?auto_184328 ) ) ( not ( = ?auto_184325 ?auto_184326 ) ) ( not ( = ?auto_184325 ?auto_184327 ) ) ( not ( = ?auto_184325 ?auto_184328 ) ) ( not ( = ?auto_184326 ?auto_184327 ) ) ( not ( = ?auto_184326 ?auto_184328 ) ) ( not ( = ?auto_184327 ?auto_184328 ) ) ( ON ?auto_184328 ?auto_184330 ) ( not ( = ?auto_184322 ?auto_184330 ) ) ( not ( = ?auto_184323 ?auto_184330 ) ) ( not ( = ?auto_184324 ?auto_184330 ) ) ( not ( = ?auto_184325 ?auto_184330 ) ) ( not ( = ?auto_184326 ?auto_184330 ) ) ( not ( = ?auto_184327 ?auto_184330 ) ) ( not ( = ?auto_184328 ?auto_184330 ) ) ( ON ?auto_184327 ?auto_184328 ) ( ON-TABLE ?auto_184329 ) ( ON ?auto_184330 ?auto_184329 ) ( not ( = ?auto_184329 ?auto_184330 ) ) ( not ( = ?auto_184329 ?auto_184328 ) ) ( not ( = ?auto_184329 ?auto_184327 ) ) ( not ( = ?auto_184322 ?auto_184329 ) ) ( not ( = ?auto_184323 ?auto_184329 ) ) ( not ( = ?auto_184324 ?auto_184329 ) ) ( not ( = ?auto_184325 ?auto_184329 ) ) ( not ( = ?auto_184326 ?auto_184329 ) ) ( CLEAR ?auto_184325 ) ( ON ?auto_184326 ?auto_184327 ) ( CLEAR ?auto_184326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184329 ?auto_184330 ?auto_184328 ?auto_184327 )
      ( MAKE-7PILE ?auto_184322 ?auto_184323 ?auto_184324 ?auto_184325 ?auto_184326 ?auto_184327 ?auto_184328 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184331 - BLOCK
      ?auto_184332 - BLOCK
      ?auto_184333 - BLOCK
      ?auto_184334 - BLOCK
      ?auto_184335 - BLOCK
      ?auto_184336 - BLOCK
      ?auto_184337 - BLOCK
    )
    :vars
    (
      ?auto_184339 - BLOCK
      ?auto_184338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184331 ) ( ON ?auto_184332 ?auto_184331 ) ( ON ?auto_184333 ?auto_184332 ) ( not ( = ?auto_184331 ?auto_184332 ) ) ( not ( = ?auto_184331 ?auto_184333 ) ) ( not ( = ?auto_184331 ?auto_184334 ) ) ( not ( = ?auto_184331 ?auto_184335 ) ) ( not ( = ?auto_184331 ?auto_184336 ) ) ( not ( = ?auto_184331 ?auto_184337 ) ) ( not ( = ?auto_184332 ?auto_184333 ) ) ( not ( = ?auto_184332 ?auto_184334 ) ) ( not ( = ?auto_184332 ?auto_184335 ) ) ( not ( = ?auto_184332 ?auto_184336 ) ) ( not ( = ?auto_184332 ?auto_184337 ) ) ( not ( = ?auto_184333 ?auto_184334 ) ) ( not ( = ?auto_184333 ?auto_184335 ) ) ( not ( = ?auto_184333 ?auto_184336 ) ) ( not ( = ?auto_184333 ?auto_184337 ) ) ( not ( = ?auto_184334 ?auto_184335 ) ) ( not ( = ?auto_184334 ?auto_184336 ) ) ( not ( = ?auto_184334 ?auto_184337 ) ) ( not ( = ?auto_184335 ?auto_184336 ) ) ( not ( = ?auto_184335 ?auto_184337 ) ) ( not ( = ?auto_184336 ?auto_184337 ) ) ( ON ?auto_184337 ?auto_184339 ) ( not ( = ?auto_184331 ?auto_184339 ) ) ( not ( = ?auto_184332 ?auto_184339 ) ) ( not ( = ?auto_184333 ?auto_184339 ) ) ( not ( = ?auto_184334 ?auto_184339 ) ) ( not ( = ?auto_184335 ?auto_184339 ) ) ( not ( = ?auto_184336 ?auto_184339 ) ) ( not ( = ?auto_184337 ?auto_184339 ) ) ( ON ?auto_184336 ?auto_184337 ) ( ON-TABLE ?auto_184338 ) ( ON ?auto_184339 ?auto_184338 ) ( not ( = ?auto_184338 ?auto_184339 ) ) ( not ( = ?auto_184338 ?auto_184337 ) ) ( not ( = ?auto_184338 ?auto_184336 ) ) ( not ( = ?auto_184331 ?auto_184338 ) ) ( not ( = ?auto_184332 ?auto_184338 ) ) ( not ( = ?auto_184333 ?auto_184338 ) ) ( not ( = ?auto_184334 ?auto_184338 ) ) ( not ( = ?auto_184335 ?auto_184338 ) ) ( ON ?auto_184335 ?auto_184336 ) ( CLEAR ?auto_184335 ) ( HOLDING ?auto_184334 ) ( CLEAR ?auto_184333 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184331 ?auto_184332 ?auto_184333 ?auto_184334 )
      ( MAKE-7PILE ?auto_184331 ?auto_184332 ?auto_184333 ?auto_184334 ?auto_184335 ?auto_184336 ?auto_184337 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184340 - BLOCK
      ?auto_184341 - BLOCK
      ?auto_184342 - BLOCK
      ?auto_184343 - BLOCK
      ?auto_184344 - BLOCK
      ?auto_184345 - BLOCK
      ?auto_184346 - BLOCK
    )
    :vars
    (
      ?auto_184348 - BLOCK
      ?auto_184347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184340 ) ( ON ?auto_184341 ?auto_184340 ) ( ON ?auto_184342 ?auto_184341 ) ( not ( = ?auto_184340 ?auto_184341 ) ) ( not ( = ?auto_184340 ?auto_184342 ) ) ( not ( = ?auto_184340 ?auto_184343 ) ) ( not ( = ?auto_184340 ?auto_184344 ) ) ( not ( = ?auto_184340 ?auto_184345 ) ) ( not ( = ?auto_184340 ?auto_184346 ) ) ( not ( = ?auto_184341 ?auto_184342 ) ) ( not ( = ?auto_184341 ?auto_184343 ) ) ( not ( = ?auto_184341 ?auto_184344 ) ) ( not ( = ?auto_184341 ?auto_184345 ) ) ( not ( = ?auto_184341 ?auto_184346 ) ) ( not ( = ?auto_184342 ?auto_184343 ) ) ( not ( = ?auto_184342 ?auto_184344 ) ) ( not ( = ?auto_184342 ?auto_184345 ) ) ( not ( = ?auto_184342 ?auto_184346 ) ) ( not ( = ?auto_184343 ?auto_184344 ) ) ( not ( = ?auto_184343 ?auto_184345 ) ) ( not ( = ?auto_184343 ?auto_184346 ) ) ( not ( = ?auto_184344 ?auto_184345 ) ) ( not ( = ?auto_184344 ?auto_184346 ) ) ( not ( = ?auto_184345 ?auto_184346 ) ) ( ON ?auto_184346 ?auto_184348 ) ( not ( = ?auto_184340 ?auto_184348 ) ) ( not ( = ?auto_184341 ?auto_184348 ) ) ( not ( = ?auto_184342 ?auto_184348 ) ) ( not ( = ?auto_184343 ?auto_184348 ) ) ( not ( = ?auto_184344 ?auto_184348 ) ) ( not ( = ?auto_184345 ?auto_184348 ) ) ( not ( = ?auto_184346 ?auto_184348 ) ) ( ON ?auto_184345 ?auto_184346 ) ( ON-TABLE ?auto_184347 ) ( ON ?auto_184348 ?auto_184347 ) ( not ( = ?auto_184347 ?auto_184348 ) ) ( not ( = ?auto_184347 ?auto_184346 ) ) ( not ( = ?auto_184347 ?auto_184345 ) ) ( not ( = ?auto_184340 ?auto_184347 ) ) ( not ( = ?auto_184341 ?auto_184347 ) ) ( not ( = ?auto_184342 ?auto_184347 ) ) ( not ( = ?auto_184343 ?auto_184347 ) ) ( not ( = ?auto_184344 ?auto_184347 ) ) ( ON ?auto_184344 ?auto_184345 ) ( CLEAR ?auto_184342 ) ( ON ?auto_184343 ?auto_184344 ) ( CLEAR ?auto_184343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184347 ?auto_184348 ?auto_184346 ?auto_184345 ?auto_184344 )
      ( MAKE-7PILE ?auto_184340 ?auto_184341 ?auto_184342 ?auto_184343 ?auto_184344 ?auto_184345 ?auto_184346 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184349 - BLOCK
      ?auto_184350 - BLOCK
      ?auto_184351 - BLOCK
      ?auto_184352 - BLOCK
      ?auto_184353 - BLOCK
      ?auto_184354 - BLOCK
      ?auto_184355 - BLOCK
    )
    :vars
    (
      ?auto_184357 - BLOCK
      ?auto_184356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184349 ) ( ON ?auto_184350 ?auto_184349 ) ( not ( = ?auto_184349 ?auto_184350 ) ) ( not ( = ?auto_184349 ?auto_184351 ) ) ( not ( = ?auto_184349 ?auto_184352 ) ) ( not ( = ?auto_184349 ?auto_184353 ) ) ( not ( = ?auto_184349 ?auto_184354 ) ) ( not ( = ?auto_184349 ?auto_184355 ) ) ( not ( = ?auto_184350 ?auto_184351 ) ) ( not ( = ?auto_184350 ?auto_184352 ) ) ( not ( = ?auto_184350 ?auto_184353 ) ) ( not ( = ?auto_184350 ?auto_184354 ) ) ( not ( = ?auto_184350 ?auto_184355 ) ) ( not ( = ?auto_184351 ?auto_184352 ) ) ( not ( = ?auto_184351 ?auto_184353 ) ) ( not ( = ?auto_184351 ?auto_184354 ) ) ( not ( = ?auto_184351 ?auto_184355 ) ) ( not ( = ?auto_184352 ?auto_184353 ) ) ( not ( = ?auto_184352 ?auto_184354 ) ) ( not ( = ?auto_184352 ?auto_184355 ) ) ( not ( = ?auto_184353 ?auto_184354 ) ) ( not ( = ?auto_184353 ?auto_184355 ) ) ( not ( = ?auto_184354 ?auto_184355 ) ) ( ON ?auto_184355 ?auto_184357 ) ( not ( = ?auto_184349 ?auto_184357 ) ) ( not ( = ?auto_184350 ?auto_184357 ) ) ( not ( = ?auto_184351 ?auto_184357 ) ) ( not ( = ?auto_184352 ?auto_184357 ) ) ( not ( = ?auto_184353 ?auto_184357 ) ) ( not ( = ?auto_184354 ?auto_184357 ) ) ( not ( = ?auto_184355 ?auto_184357 ) ) ( ON ?auto_184354 ?auto_184355 ) ( ON-TABLE ?auto_184356 ) ( ON ?auto_184357 ?auto_184356 ) ( not ( = ?auto_184356 ?auto_184357 ) ) ( not ( = ?auto_184356 ?auto_184355 ) ) ( not ( = ?auto_184356 ?auto_184354 ) ) ( not ( = ?auto_184349 ?auto_184356 ) ) ( not ( = ?auto_184350 ?auto_184356 ) ) ( not ( = ?auto_184351 ?auto_184356 ) ) ( not ( = ?auto_184352 ?auto_184356 ) ) ( not ( = ?auto_184353 ?auto_184356 ) ) ( ON ?auto_184353 ?auto_184354 ) ( ON ?auto_184352 ?auto_184353 ) ( CLEAR ?auto_184352 ) ( HOLDING ?auto_184351 ) ( CLEAR ?auto_184350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184349 ?auto_184350 ?auto_184351 )
      ( MAKE-7PILE ?auto_184349 ?auto_184350 ?auto_184351 ?auto_184352 ?auto_184353 ?auto_184354 ?auto_184355 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184358 - BLOCK
      ?auto_184359 - BLOCK
      ?auto_184360 - BLOCK
      ?auto_184361 - BLOCK
      ?auto_184362 - BLOCK
      ?auto_184363 - BLOCK
      ?auto_184364 - BLOCK
    )
    :vars
    (
      ?auto_184365 - BLOCK
      ?auto_184366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184358 ) ( ON ?auto_184359 ?auto_184358 ) ( not ( = ?auto_184358 ?auto_184359 ) ) ( not ( = ?auto_184358 ?auto_184360 ) ) ( not ( = ?auto_184358 ?auto_184361 ) ) ( not ( = ?auto_184358 ?auto_184362 ) ) ( not ( = ?auto_184358 ?auto_184363 ) ) ( not ( = ?auto_184358 ?auto_184364 ) ) ( not ( = ?auto_184359 ?auto_184360 ) ) ( not ( = ?auto_184359 ?auto_184361 ) ) ( not ( = ?auto_184359 ?auto_184362 ) ) ( not ( = ?auto_184359 ?auto_184363 ) ) ( not ( = ?auto_184359 ?auto_184364 ) ) ( not ( = ?auto_184360 ?auto_184361 ) ) ( not ( = ?auto_184360 ?auto_184362 ) ) ( not ( = ?auto_184360 ?auto_184363 ) ) ( not ( = ?auto_184360 ?auto_184364 ) ) ( not ( = ?auto_184361 ?auto_184362 ) ) ( not ( = ?auto_184361 ?auto_184363 ) ) ( not ( = ?auto_184361 ?auto_184364 ) ) ( not ( = ?auto_184362 ?auto_184363 ) ) ( not ( = ?auto_184362 ?auto_184364 ) ) ( not ( = ?auto_184363 ?auto_184364 ) ) ( ON ?auto_184364 ?auto_184365 ) ( not ( = ?auto_184358 ?auto_184365 ) ) ( not ( = ?auto_184359 ?auto_184365 ) ) ( not ( = ?auto_184360 ?auto_184365 ) ) ( not ( = ?auto_184361 ?auto_184365 ) ) ( not ( = ?auto_184362 ?auto_184365 ) ) ( not ( = ?auto_184363 ?auto_184365 ) ) ( not ( = ?auto_184364 ?auto_184365 ) ) ( ON ?auto_184363 ?auto_184364 ) ( ON-TABLE ?auto_184366 ) ( ON ?auto_184365 ?auto_184366 ) ( not ( = ?auto_184366 ?auto_184365 ) ) ( not ( = ?auto_184366 ?auto_184364 ) ) ( not ( = ?auto_184366 ?auto_184363 ) ) ( not ( = ?auto_184358 ?auto_184366 ) ) ( not ( = ?auto_184359 ?auto_184366 ) ) ( not ( = ?auto_184360 ?auto_184366 ) ) ( not ( = ?auto_184361 ?auto_184366 ) ) ( not ( = ?auto_184362 ?auto_184366 ) ) ( ON ?auto_184362 ?auto_184363 ) ( ON ?auto_184361 ?auto_184362 ) ( CLEAR ?auto_184359 ) ( ON ?auto_184360 ?auto_184361 ) ( CLEAR ?auto_184360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184366 ?auto_184365 ?auto_184364 ?auto_184363 ?auto_184362 ?auto_184361 )
      ( MAKE-7PILE ?auto_184358 ?auto_184359 ?auto_184360 ?auto_184361 ?auto_184362 ?auto_184363 ?auto_184364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184367 - BLOCK
      ?auto_184368 - BLOCK
      ?auto_184369 - BLOCK
      ?auto_184370 - BLOCK
      ?auto_184371 - BLOCK
      ?auto_184372 - BLOCK
      ?auto_184373 - BLOCK
    )
    :vars
    (
      ?auto_184374 - BLOCK
      ?auto_184375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184367 ) ( not ( = ?auto_184367 ?auto_184368 ) ) ( not ( = ?auto_184367 ?auto_184369 ) ) ( not ( = ?auto_184367 ?auto_184370 ) ) ( not ( = ?auto_184367 ?auto_184371 ) ) ( not ( = ?auto_184367 ?auto_184372 ) ) ( not ( = ?auto_184367 ?auto_184373 ) ) ( not ( = ?auto_184368 ?auto_184369 ) ) ( not ( = ?auto_184368 ?auto_184370 ) ) ( not ( = ?auto_184368 ?auto_184371 ) ) ( not ( = ?auto_184368 ?auto_184372 ) ) ( not ( = ?auto_184368 ?auto_184373 ) ) ( not ( = ?auto_184369 ?auto_184370 ) ) ( not ( = ?auto_184369 ?auto_184371 ) ) ( not ( = ?auto_184369 ?auto_184372 ) ) ( not ( = ?auto_184369 ?auto_184373 ) ) ( not ( = ?auto_184370 ?auto_184371 ) ) ( not ( = ?auto_184370 ?auto_184372 ) ) ( not ( = ?auto_184370 ?auto_184373 ) ) ( not ( = ?auto_184371 ?auto_184372 ) ) ( not ( = ?auto_184371 ?auto_184373 ) ) ( not ( = ?auto_184372 ?auto_184373 ) ) ( ON ?auto_184373 ?auto_184374 ) ( not ( = ?auto_184367 ?auto_184374 ) ) ( not ( = ?auto_184368 ?auto_184374 ) ) ( not ( = ?auto_184369 ?auto_184374 ) ) ( not ( = ?auto_184370 ?auto_184374 ) ) ( not ( = ?auto_184371 ?auto_184374 ) ) ( not ( = ?auto_184372 ?auto_184374 ) ) ( not ( = ?auto_184373 ?auto_184374 ) ) ( ON ?auto_184372 ?auto_184373 ) ( ON-TABLE ?auto_184375 ) ( ON ?auto_184374 ?auto_184375 ) ( not ( = ?auto_184375 ?auto_184374 ) ) ( not ( = ?auto_184375 ?auto_184373 ) ) ( not ( = ?auto_184375 ?auto_184372 ) ) ( not ( = ?auto_184367 ?auto_184375 ) ) ( not ( = ?auto_184368 ?auto_184375 ) ) ( not ( = ?auto_184369 ?auto_184375 ) ) ( not ( = ?auto_184370 ?auto_184375 ) ) ( not ( = ?auto_184371 ?auto_184375 ) ) ( ON ?auto_184371 ?auto_184372 ) ( ON ?auto_184370 ?auto_184371 ) ( ON ?auto_184369 ?auto_184370 ) ( CLEAR ?auto_184369 ) ( HOLDING ?auto_184368 ) ( CLEAR ?auto_184367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184367 ?auto_184368 )
      ( MAKE-7PILE ?auto_184367 ?auto_184368 ?auto_184369 ?auto_184370 ?auto_184371 ?auto_184372 ?auto_184373 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184376 - BLOCK
      ?auto_184377 - BLOCK
      ?auto_184378 - BLOCK
      ?auto_184379 - BLOCK
      ?auto_184380 - BLOCK
      ?auto_184381 - BLOCK
      ?auto_184382 - BLOCK
    )
    :vars
    (
      ?auto_184384 - BLOCK
      ?auto_184383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184376 ) ( not ( = ?auto_184376 ?auto_184377 ) ) ( not ( = ?auto_184376 ?auto_184378 ) ) ( not ( = ?auto_184376 ?auto_184379 ) ) ( not ( = ?auto_184376 ?auto_184380 ) ) ( not ( = ?auto_184376 ?auto_184381 ) ) ( not ( = ?auto_184376 ?auto_184382 ) ) ( not ( = ?auto_184377 ?auto_184378 ) ) ( not ( = ?auto_184377 ?auto_184379 ) ) ( not ( = ?auto_184377 ?auto_184380 ) ) ( not ( = ?auto_184377 ?auto_184381 ) ) ( not ( = ?auto_184377 ?auto_184382 ) ) ( not ( = ?auto_184378 ?auto_184379 ) ) ( not ( = ?auto_184378 ?auto_184380 ) ) ( not ( = ?auto_184378 ?auto_184381 ) ) ( not ( = ?auto_184378 ?auto_184382 ) ) ( not ( = ?auto_184379 ?auto_184380 ) ) ( not ( = ?auto_184379 ?auto_184381 ) ) ( not ( = ?auto_184379 ?auto_184382 ) ) ( not ( = ?auto_184380 ?auto_184381 ) ) ( not ( = ?auto_184380 ?auto_184382 ) ) ( not ( = ?auto_184381 ?auto_184382 ) ) ( ON ?auto_184382 ?auto_184384 ) ( not ( = ?auto_184376 ?auto_184384 ) ) ( not ( = ?auto_184377 ?auto_184384 ) ) ( not ( = ?auto_184378 ?auto_184384 ) ) ( not ( = ?auto_184379 ?auto_184384 ) ) ( not ( = ?auto_184380 ?auto_184384 ) ) ( not ( = ?auto_184381 ?auto_184384 ) ) ( not ( = ?auto_184382 ?auto_184384 ) ) ( ON ?auto_184381 ?auto_184382 ) ( ON-TABLE ?auto_184383 ) ( ON ?auto_184384 ?auto_184383 ) ( not ( = ?auto_184383 ?auto_184384 ) ) ( not ( = ?auto_184383 ?auto_184382 ) ) ( not ( = ?auto_184383 ?auto_184381 ) ) ( not ( = ?auto_184376 ?auto_184383 ) ) ( not ( = ?auto_184377 ?auto_184383 ) ) ( not ( = ?auto_184378 ?auto_184383 ) ) ( not ( = ?auto_184379 ?auto_184383 ) ) ( not ( = ?auto_184380 ?auto_184383 ) ) ( ON ?auto_184380 ?auto_184381 ) ( ON ?auto_184379 ?auto_184380 ) ( ON ?auto_184378 ?auto_184379 ) ( CLEAR ?auto_184376 ) ( ON ?auto_184377 ?auto_184378 ) ( CLEAR ?auto_184377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184383 ?auto_184384 ?auto_184382 ?auto_184381 ?auto_184380 ?auto_184379 ?auto_184378 )
      ( MAKE-7PILE ?auto_184376 ?auto_184377 ?auto_184378 ?auto_184379 ?auto_184380 ?auto_184381 ?auto_184382 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184385 - BLOCK
      ?auto_184386 - BLOCK
      ?auto_184387 - BLOCK
      ?auto_184388 - BLOCK
      ?auto_184389 - BLOCK
      ?auto_184390 - BLOCK
      ?auto_184391 - BLOCK
    )
    :vars
    (
      ?auto_184393 - BLOCK
      ?auto_184392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184385 ?auto_184386 ) ) ( not ( = ?auto_184385 ?auto_184387 ) ) ( not ( = ?auto_184385 ?auto_184388 ) ) ( not ( = ?auto_184385 ?auto_184389 ) ) ( not ( = ?auto_184385 ?auto_184390 ) ) ( not ( = ?auto_184385 ?auto_184391 ) ) ( not ( = ?auto_184386 ?auto_184387 ) ) ( not ( = ?auto_184386 ?auto_184388 ) ) ( not ( = ?auto_184386 ?auto_184389 ) ) ( not ( = ?auto_184386 ?auto_184390 ) ) ( not ( = ?auto_184386 ?auto_184391 ) ) ( not ( = ?auto_184387 ?auto_184388 ) ) ( not ( = ?auto_184387 ?auto_184389 ) ) ( not ( = ?auto_184387 ?auto_184390 ) ) ( not ( = ?auto_184387 ?auto_184391 ) ) ( not ( = ?auto_184388 ?auto_184389 ) ) ( not ( = ?auto_184388 ?auto_184390 ) ) ( not ( = ?auto_184388 ?auto_184391 ) ) ( not ( = ?auto_184389 ?auto_184390 ) ) ( not ( = ?auto_184389 ?auto_184391 ) ) ( not ( = ?auto_184390 ?auto_184391 ) ) ( ON ?auto_184391 ?auto_184393 ) ( not ( = ?auto_184385 ?auto_184393 ) ) ( not ( = ?auto_184386 ?auto_184393 ) ) ( not ( = ?auto_184387 ?auto_184393 ) ) ( not ( = ?auto_184388 ?auto_184393 ) ) ( not ( = ?auto_184389 ?auto_184393 ) ) ( not ( = ?auto_184390 ?auto_184393 ) ) ( not ( = ?auto_184391 ?auto_184393 ) ) ( ON ?auto_184390 ?auto_184391 ) ( ON-TABLE ?auto_184392 ) ( ON ?auto_184393 ?auto_184392 ) ( not ( = ?auto_184392 ?auto_184393 ) ) ( not ( = ?auto_184392 ?auto_184391 ) ) ( not ( = ?auto_184392 ?auto_184390 ) ) ( not ( = ?auto_184385 ?auto_184392 ) ) ( not ( = ?auto_184386 ?auto_184392 ) ) ( not ( = ?auto_184387 ?auto_184392 ) ) ( not ( = ?auto_184388 ?auto_184392 ) ) ( not ( = ?auto_184389 ?auto_184392 ) ) ( ON ?auto_184389 ?auto_184390 ) ( ON ?auto_184388 ?auto_184389 ) ( ON ?auto_184387 ?auto_184388 ) ( ON ?auto_184386 ?auto_184387 ) ( CLEAR ?auto_184386 ) ( HOLDING ?auto_184385 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184385 )
      ( MAKE-7PILE ?auto_184385 ?auto_184386 ?auto_184387 ?auto_184388 ?auto_184389 ?auto_184390 ?auto_184391 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184394 - BLOCK
      ?auto_184395 - BLOCK
      ?auto_184396 - BLOCK
      ?auto_184397 - BLOCK
      ?auto_184398 - BLOCK
      ?auto_184399 - BLOCK
      ?auto_184400 - BLOCK
    )
    :vars
    (
      ?auto_184401 - BLOCK
      ?auto_184402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184394 ?auto_184395 ) ) ( not ( = ?auto_184394 ?auto_184396 ) ) ( not ( = ?auto_184394 ?auto_184397 ) ) ( not ( = ?auto_184394 ?auto_184398 ) ) ( not ( = ?auto_184394 ?auto_184399 ) ) ( not ( = ?auto_184394 ?auto_184400 ) ) ( not ( = ?auto_184395 ?auto_184396 ) ) ( not ( = ?auto_184395 ?auto_184397 ) ) ( not ( = ?auto_184395 ?auto_184398 ) ) ( not ( = ?auto_184395 ?auto_184399 ) ) ( not ( = ?auto_184395 ?auto_184400 ) ) ( not ( = ?auto_184396 ?auto_184397 ) ) ( not ( = ?auto_184396 ?auto_184398 ) ) ( not ( = ?auto_184396 ?auto_184399 ) ) ( not ( = ?auto_184396 ?auto_184400 ) ) ( not ( = ?auto_184397 ?auto_184398 ) ) ( not ( = ?auto_184397 ?auto_184399 ) ) ( not ( = ?auto_184397 ?auto_184400 ) ) ( not ( = ?auto_184398 ?auto_184399 ) ) ( not ( = ?auto_184398 ?auto_184400 ) ) ( not ( = ?auto_184399 ?auto_184400 ) ) ( ON ?auto_184400 ?auto_184401 ) ( not ( = ?auto_184394 ?auto_184401 ) ) ( not ( = ?auto_184395 ?auto_184401 ) ) ( not ( = ?auto_184396 ?auto_184401 ) ) ( not ( = ?auto_184397 ?auto_184401 ) ) ( not ( = ?auto_184398 ?auto_184401 ) ) ( not ( = ?auto_184399 ?auto_184401 ) ) ( not ( = ?auto_184400 ?auto_184401 ) ) ( ON ?auto_184399 ?auto_184400 ) ( ON-TABLE ?auto_184402 ) ( ON ?auto_184401 ?auto_184402 ) ( not ( = ?auto_184402 ?auto_184401 ) ) ( not ( = ?auto_184402 ?auto_184400 ) ) ( not ( = ?auto_184402 ?auto_184399 ) ) ( not ( = ?auto_184394 ?auto_184402 ) ) ( not ( = ?auto_184395 ?auto_184402 ) ) ( not ( = ?auto_184396 ?auto_184402 ) ) ( not ( = ?auto_184397 ?auto_184402 ) ) ( not ( = ?auto_184398 ?auto_184402 ) ) ( ON ?auto_184398 ?auto_184399 ) ( ON ?auto_184397 ?auto_184398 ) ( ON ?auto_184396 ?auto_184397 ) ( ON ?auto_184395 ?auto_184396 ) ( ON ?auto_184394 ?auto_184395 ) ( CLEAR ?auto_184394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184402 ?auto_184401 ?auto_184400 ?auto_184399 ?auto_184398 ?auto_184397 ?auto_184396 ?auto_184395 )
      ( MAKE-7PILE ?auto_184394 ?auto_184395 ?auto_184396 ?auto_184397 ?auto_184398 ?auto_184399 ?auto_184400 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184404 - BLOCK
    )
    :vars
    (
      ?auto_184405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184405 ?auto_184404 ) ( CLEAR ?auto_184405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184404 ) ( not ( = ?auto_184404 ?auto_184405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184405 ?auto_184404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184406 - BLOCK
    )
    :vars
    (
      ?auto_184407 - BLOCK
      ?auto_184408 - BLOCK
      ?auto_184409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184407 ?auto_184406 ) ( CLEAR ?auto_184407 ) ( ON-TABLE ?auto_184406 ) ( not ( = ?auto_184406 ?auto_184407 ) ) ( HOLDING ?auto_184408 ) ( CLEAR ?auto_184409 ) ( not ( = ?auto_184406 ?auto_184408 ) ) ( not ( = ?auto_184406 ?auto_184409 ) ) ( not ( = ?auto_184407 ?auto_184408 ) ) ( not ( = ?auto_184407 ?auto_184409 ) ) ( not ( = ?auto_184408 ?auto_184409 ) ) )
    :subtasks
    ( ( !STACK ?auto_184408 ?auto_184409 )
      ( MAKE-1PILE ?auto_184406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184410 - BLOCK
    )
    :vars
    (
      ?auto_184411 - BLOCK
      ?auto_184413 - BLOCK
      ?auto_184412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184411 ?auto_184410 ) ( ON-TABLE ?auto_184410 ) ( not ( = ?auto_184410 ?auto_184411 ) ) ( CLEAR ?auto_184413 ) ( not ( = ?auto_184410 ?auto_184412 ) ) ( not ( = ?auto_184410 ?auto_184413 ) ) ( not ( = ?auto_184411 ?auto_184412 ) ) ( not ( = ?auto_184411 ?auto_184413 ) ) ( not ( = ?auto_184412 ?auto_184413 ) ) ( ON ?auto_184412 ?auto_184411 ) ( CLEAR ?auto_184412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184410 ?auto_184411 )
      ( MAKE-1PILE ?auto_184410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184414 - BLOCK
    )
    :vars
    (
      ?auto_184416 - BLOCK
      ?auto_184415 - BLOCK
      ?auto_184417 - BLOCK
      ?auto_184420 - BLOCK
      ?auto_184421 - BLOCK
      ?auto_184419 - BLOCK
      ?auto_184422 - BLOCK
      ?auto_184418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184416 ?auto_184414 ) ( ON-TABLE ?auto_184414 ) ( not ( = ?auto_184414 ?auto_184416 ) ) ( not ( = ?auto_184414 ?auto_184415 ) ) ( not ( = ?auto_184414 ?auto_184417 ) ) ( not ( = ?auto_184416 ?auto_184415 ) ) ( not ( = ?auto_184416 ?auto_184417 ) ) ( not ( = ?auto_184415 ?auto_184417 ) ) ( ON ?auto_184415 ?auto_184416 ) ( CLEAR ?auto_184415 ) ( HOLDING ?auto_184417 ) ( CLEAR ?auto_184420 ) ( ON-TABLE ?auto_184421 ) ( ON ?auto_184419 ?auto_184421 ) ( ON ?auto_184422 ?auto_184419 ) ( ON ?auto_184418 ?auto_184422 ) ( ON ?auto_184420 ?auto_184418 ) ( not ( = ?auto_184421 ?auto_184419 ) ) ( not ( = ?auto_184421 ?auto_184422 ) ) ( not ( = ?auto_184421 ?auto_184418 ) ) ( not ( = ?auto_184421 ?auto_184420 ) ) ( not ( = ?auto_184421 ?auto_184417 ) ) ( not ( = ?auto_184419 ?auto_184422 ) ) ( not ( = ?auto_184419 ?auto_184418 ) ) ( not ( = ?auto_184419 ?auto_184420 ) ) ( not ( = ?auto_184419 ?auto_184417 ) ) ( not ( = ?auto_184422 ?auto_184418 ) ) ( not ( = ?auto_184422 ?auto_184420 ) ) ( not ( = ?auto_184422 ?auto_184417 ) ) ( not ( = ?auto_184418 ?auto_184420 ) ) ( not ( = ?auto_184418 ?auto_184417 ) ) ( not ( = ?auto_184420 ?auto_184417 ) ) ( not ( = ?auto_184414 ?auto_184420 ) ) ( not ( = ?auto_184414 ?auto_184421 ) ) ( not ( = ?auto_184414 ?auto_184419 ) ) ( not ( = ?auto_184414 ?auto_184422 ) ) ( not ( = ?auto_184414 ?auto_184418 ) ) ( not ( = ?auto_184416 ?auto_184420 ) ) ( not ( = ?auto_184416 ?auto_184421 ) ) ( not ( = ?auto_184416 ?auto_184419 ) ) ( not ( = ?auto_184416 ?auto_184422 ) ) ( not ( = ?auto_184416 ?auto_184418 ) ) ( not ( = ?auto_184415 ?auto_184420 ) ) ( not ( = ?auto_184415 ?auto_184421 ) ) ( not ( = ?auto_184415 ?auto_184419 ) ) ( not ( = ?auto_184415 ?auto_184422 ) ) ( not ( = ?auto_184415 ?auto_184418 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184421 ?auto_184419 ?auto_184422 ?auto_184418 ?auto_184420 ?auto_184417 )
      ( MAKE-1PILE ?auto_184414 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184423 - BLOCK
    )
    :vars
    (
      ?auto_184424 - BLOCK
      ?auto_184430 - BLOCK
      ?auto_184428 - BLOCK
      ?auto_184426 - BLOCK
      ?auto_184431 - BLOCK
      ?auto_184429 - BLOCK
      ?auto_184427 - BLOCK
      ?auto_184425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184424 ?auto_184423 ) ( ON-TABLE ?auto_184423 ) ( not ( = ?auto_184423 ?auto_184424 ) ) ( not ( = ?auto_184423 ?auto_184430 ) ) ( not ( = ?auto_184423 ?auto_184428 ) ) ( not ( = ?auto_184424 ?auto_184430 ) ) ( not ( = ?auto_184424 ?auto_184428 ) ) ( not ( = ?auto_184430 ?auto_184428 ) ) ( ON ?auto_184430 ?auto_184424 ) ( CLEAR ?auto_184426 ) ( ON-TABLE ?auto_184431 ) ( ON ?auto_184429 ?auto_184431 ) ( ON ?auto_184427 ?auto_184429 ) ( ON ?auto_184425 ?auto_184427 ) ( ON ?auto_184426 ?auto_184425 ) ( not ( = ?auto_184431 ?auto_184429 ) ) ( not ( = ?auto_184431 ?auto_184427 ) ) ( not ( = ?auto_184431 ?auto_184425 ) ) ( not ( = ?auto_184431 ?auto_184426 ) ) ( not ( = ?auto_184431 ?auto_184428 ) ) ( not ( = ?auto_184429 ?auto_184427 ) ) ( not ( = ?auto_184429 ?auto_184425 ) ) ( not ( = ?auto_184429 ?auto_184426 ) ) ( not ( = ?auto_184429 ?auto_184428 ) ) ( not ( = ?auto_184427 ?auto_184425 ) ) ( not ( = ?auto_184427 ?auto_184426 ) ) ( not ( = ?auto_184427 ?auto_184428 ) ) ( not ( = ?auto_184425 ?auto_184426 ) ) ( not ( = ?auto_184425 ?auto_184428 ) ) ( not ( = ?auto_184426 ?auto_184428 ) ) ( not ( = ?auto_184423 ?auto_184426 ) ) ( not ( = ?auto_184423 ?auto_184431 ) ) ( not ( = ?auto_184423 ?auto_184429 ) ) ( not ( = ?auto_184423 ?auto_184427 ) ) ( not ( = ?auto_184423 ?auto_184425 ) ) ( not ( = ?auto_184424 ?auto_184426 ) ) ( not ( = ?auto_184424 ?auto_184431 ) ) ( not ( = ?auto_184424 ?auto_184429 ) ) ( not ( = ?auto_184424 ?auto_184427 ) ) ( not ( = ?auto_184424 ?auto_184425 ) ) ( not ( = ?auto_184430 ?auto_184426 ) ) ( not ( = ?auto_184430 ?auto_184431 ) ) ( not ( = ?auto_184430 ?auto_184429 ) ) ( not ( = ?auto_184430 ?auto_184427 ) ) ( not ( = ?auto_184430 ?auto_184425 ) ) ( ON ?auto_184428 ?auto_184430 ) ( CLEAR ?auto_184428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184423 ?auto_184424 ?auto_184430 )
      ( MAKE-1PILE ?auto_184423 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184432 - BLOCK
    )
    :vars
    (
      ?auto_184440 - BLOCK
      ?auto_184437 - BLOCK
      ?auto_184433 - BLOCK
      ?auto_184436 - BLOCK
      ?auto_184435 - BLOCK
      ?auto_184434 - BLOCK
      ?auto_184438 - BLOCK
      ?auto_184439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184440 ?auto_184432 ) ( ON-TABLE ?auto_184432 ) ( not ( = ?auto_184432 ?auto_184440 ) ) ( not ( = ?auto_184432 ?auto_184437 ) ) ( not ( = ?auto_184432 ?auto_184433 ) ) ( not ( = ?auto_184440 ?auto_184437 ) ) ( not ( = ?auto_184440 ?auto_184433 ) ) ( not ( = ?auto_184437 ?auto_184433 ) ) ( ON ?auto_184437 ?auto_184440 ) ( ON-TABLE ?auto_184436 ) ( ON ?auto_184435 ?auto_184436 ) ( ON ?auto_184434 ?auto_184435 ) ( ON ?auto_184438 ?auto_184434 ) ( not ( = ?auto_184436 ?auto_184435 ) ) ( not ( = ?auto_184436 ?auto_184434 ) ) ( not ( = ?auto_184436 ?auto_184438 ) ) ( not ( = ?auto_184436 ?auto_184439 ) ) ( not ( = ?auto_184436 ?auto_184433 ) ) ( not ( = ?auto_184435 ?auto_184434 ) ) ( not ( = ?auto_184435 ?auto_184438 ) ) ( not ( = ?auto_184435 ?auto_184439 ) ) ( not ( = ?auto_184435 ?auto_184433 ) ) ( not ( = ?auto_184434 ?auto_184438 ) ) ( not ( = ?auto_184434 ?auto_184439 ) ) ( not ( = ?auto_184434 ?auto_184433 ) ) ( not ( = ?auto_184438 ?auto_184439 ) ) ( not ( = ?auto_184438 ?auto_184433 ) ) ( not ( = ?auto_184439 ?auto_184433 ) ) ( not ( = ?auto_184432 ?auto_184439 ) ) ( not ( = ?auto_184432 ?auto_184436 ) ) ( not ( = ?auto_184432 ?auto_184435 ) ) ( not ( = ?auto_184432 ?auto_184434 ) ) ( not ( = ?auto_184432 ?auto_184438 ) ) ( not ( = ?auto_184440 ?auto_184439 ) ) ( not ( = ?auto_184440 ?auto_184436 ) ) ( not ( = ?auto_184440 ?auto_184435 ) ) ( not ( = ?auto_184440 ?auto_184434 ) ) ( not ( = ?auto_184440 ?auto_184438 ) ) ( not ( = ?auto_184437 ?auto_184439 ) ) ( not ( = ?auto_184437 ?auto_184436 ) ) ( not ( = ?auto_184437 ?auto_184435 ) ) ( not ( = ?auto_184437 ?auto_184434 ) ) ( not ( = ?auto_184437 ?auto_184438 ) ) ( ON ?auto_184433 ?auto_184437 ) ( CLEAR ?auto_184433 ) ( HOLDING ?auto_184439 ) ( CLEAR ?auto_184438 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184436 ?auto_184435 ?auto_184434 ?auto_184438 ?auto_184439 )
      ( MAKE-1PILE ?auto_184432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184441 - BLOCK
    )
    :vars
    (
      ?auto_184442 - BLOCK
      ?auto_184449 - BLOCK
      ?auto_184445 - BLOCK
      ?auto_184443 - BLOCK
      ?auto_184448 - BLOCK
      ?auto_184444 - BLOCK
      ?auto_184447 - BLOCK
      ?auto_184446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184442 ?auto_184441 ) ( ON-TABLE ?auto_184441 ) ( not ( = ?auto_184441 ?auto_184442 ) ) ( not ( = ?auto_184441 ?auto_184449 ) ) ( not ( = ?auto_184441 ?auto_184445 ) ) ( not ( = ?auto_184442 ?auto_184449 ) ) ( not ( = ?auto_184442 ?auto_184445 ) ) ( not ( = ?auto_184449 ?auto_184445 ) ) ( ON ?auto_184449 ?auto_184442 ) ( ON-TABLE ?auto_184443 ) ( ON ?auto_184448 ?auto_184443 ) ( ON ?auto_184444 ?auto_184448 ) ( ON ?auto_184447 ?auto_184444 ) ( not ( = ?auto_184443 ?auto_184448 ) ) ( not ( = ?auto_184443 ?auto_184444 ) ) ( not ( = ?auto_184443 ?auto_184447 ) ) ( not ( = ?auto_184443 ?auto_184446 ) ) ( not ( = ?auto_184443 ?auto_184445 ) ) ( not ( = ?auto_184448 ?auto_184444 ) ) ( not ( = ?auto_184448 ?auto_184447 ) ) ( not ( = ?auto_184448 ?auto_184446 ) ) ( not ( = ?auto_184448 ?auto_184445 ) ) ( not ( = ?auto_184444 ?auto_184447 ) ) ( not ( = ?auto_184444 ?auto_184446 ) ) ( not ( = ?auto_184444 ?auto_184445 ) ) ( not ( = ?auto_184447 ?auto_184446 ) ) ( not ( = ?auto_184447 ?auto_184445 ) ) ( not ( = ?auto_184446 ?auto_184445 ) ) ( not ( = ?auto_184441 ?auto_184446 ) ) ( not ( = ?auto_184441 ?auto_184443 ) ) ( not ( = ?auto_184441 ?auto_184448 ) ) ( not ( = ?auto_184441 ?auto_184444 ) ) ( not ( = ?auto_184441 ?auto_184447 ) ) ( not ( = ?auto_184442 ?auto_184446 ) ) ( not ( = ?auto_184442 ?auto_184443 ) ) ( not ( = ?auto_184442 ?auto_184448 ) ) ( not ( = ?auto_184442 ?auto_184444 ) ) ( not ( = ?auto_184442 ?auto_184447 ) ) ( not ( = ?auto_184449 ?auto_184446 ) ) ( not ( = ?auto_184449 ?auto_184443 ) ) ( not ( = ?auto_184449 ?auto_184448 ) ) ( not ( = ?auto_184449 ?auto_184444 ) ) ( not ( = ?auto_184449 ?auto_184447 ) ) ( ON ?auto_184445 ?auto_184449 ) ( CLEAR ?auto_184447 ) ( ON ?auto_184446 ?auto_184445 ) ( CLEAR ?auto_184446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184441 ?auto_184442 ?auto_184449 ?auto_184445 )
      ( MAKE-1PILE ?auto_184441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184450 - BLOCK
    )
    :vars
    (
      ?auto_184454 - BLOCK
      ?auto_184456 - BLOCK
      ?auto_184453 - BLOCK
      ?auto_184455 - BLOCK
      ?auto_184458 - BLOCK
      ?auto_184452 - BLOCK
      ?auto_184451 - BLOCK
      ?auto_184457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184454 ?auto_184450 ) ( ON-TABLE ?auto_184450 ) ( not ( = ?auto_184450 ?auto_184454 ) ) ( not ( = ?auto_184450 ?auto_184456 ) ) ( not ( = ?auto_184450 ?auto_184453 ) ) ( not ( = ?auto_184454 ?auto_184456 ) ) ( not ( = ?auto_184454 ?auto_184453 ) ) ( not ( = ?auto_184456 ?auto_184453 ) ) ( ON ?auto_184456 ?auto_184454 ) ( ON-TABLE ?auto_184455 ) ( ON ?auto_184458 ?auto_184455 ) ( ON ?auto_184452 ?auto_184458 ) ( not ( = ?auto_184455 ?auto_184458 ) ) ( not ( = ?auto_184455 ?auto_184452 ) ) ( not ( = ?auto_184455 ?auto_184451 ) ) ( not ( = ?auto_184455 ?auto_184457 ) ) ( not ( = ?auto_184455 ?auto_184453 ) ) ( not ( = ?auto_184458 ?auto_184452 ) ) ( not ( = ?auto_184458 ?auto_184451 ) ) ( not ( = ?auto_184458 ?auto_184457 ) ) ( not ( = ?auto_184458 ?auto_184453 ) ) ( not ( = ?auto_184452 ?auto_184451 ) ) ( not ( = ?auto_184452 ?auto_184457 ) ) ( not ( = ?auto_184452 ?auto_184453 ) ) ( not ( = ?auto_184451 ?auto_184457 ) ) ( not ( = ?auto_184451 ?auto_184453 ) ) ( not ( = ?auto_184457 ?auto_184453 ) ) ( not ( = ?auto_184450 ?auto_184457 ) ) ( not ( = ?auto_184450 ?auto_184455 ) ) ( not ( = ?auto_184450 ?auto_184458 ) ) ( not ( = ?auto_184450 ?auto_184452 ) ) ( not ( = ?auto_184450 ?auto_184451 ) ) ( not ( = ?auto_184454 ?auto_184457 ) ) ( not ( = ?auto_184454 ?auto_184455 ) ) ( not ( = ?auto_184454 ?auto_184458 ) ) ( not ( = ?auto_184454 ?auto_184452 ) ) ( not ( = ?auto_184454 ?auto_184451 ) ) ( not ( = ?auto_184456 ?auto_184457 ) ) ( not ( = ?auto_184456 ?auto_184455 ) ) ( not ( = ?auto_184456 ?auto_184458 ) ) ( not ( = ?auto_184456 ?auto_184452 ) ) ( not ( = ?auto_184456 ?auto_184451 ) ) ( ON ?auto_184453 ?auto_184456 ) ( ON ?auto_184457 ?auto_184453 ) ( CLEAR ?auto_184457 ) ( HOLDING ?auto_184451 ) ( CLEAR ?auto_184452 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184455 ?auto_184458 ?auto_184452 ?auto_184451 )
      ( MAKE-1PILE ?auto_184450 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184459 - BLOCK
    )
    :vars
    (
      ?auto_184462 - BLOCK
      ?auto_184465 - BLOCK
      ?auto_184463 - BLOCK
      ?auto_184466 - BLOCK
      ?auto_184461 - BLOCK
      ?auto_184467 - BLOCK
      ?auto_184460 - BLOCK
      ?auto_184464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184462 ?auto_184459 ) ( ON-TABLE ?auto_184459 ) ( not ( = ?auto_184459 ?auto_184462 ) ) ( not ( = ?auto_184459 ?auto_184465 ) ) ( not ( = ?auto_184459 ?auto_184463 ) ) ( not ( = ?auto_184462 ?auto_184465 ) ) ( not ( = ?auto_184462 ?auto_184463 ) ) ( not ( = ?auto_184465 ?auto_184463 ) ) ( ON ?auto_184465 ?auto_184462 ) ( ON-TABLE ?auto_184466 ) ( ON ?auto_184461 ?auto_184466 ) ( ON ?auto_184467 ?auto_184461 ) ( not ( = ?auto_184466 ?auto_184461 ) ) ( not ( = ?auto_184466 ?auto_184467 ) ) ( not ( = ?auto_184466 ?auto_184460 ) ) ( not ( = ?auto_184466 ?auto_184464 ) ) ( not ( = ?auto_184466 ?auto_184463 ) ) ( not ( = ?auto_184461 ?auto_184467 ) ) ( not ( = ?auto_184461 ?auto_184460 ) ) ( not ( = ?auto_184461 ?auto_184464 ) ) ( not ( = ?auto_184461 ?auto_184463 ) ) ( not ( = ?auto_184467 ?auto_184460 ) ) ( not ( = ?auto_184467 ?auto_184464 ) ) ( not ( = ?auto_184467 ?auto_184463 ) ) ( not ( = ?auto_184460 ?auto_184464 ) ) ( not ( = ?auto_184460 ?auto_184463 ) ) ( not ( = ?auto_184464 ?auto_184463 ) ) ( not ( = ?auto_184459 ?auto_184464 ) ) ( not ( = ?auto_184459 ?auto_184466 ) ) ( not ( = ?auto_184459 ?auto_184461 ) ) ( not ( = ?auto_184459 ?auto_184467 ) ) ( not ( = ?auto_184459 ?auto_184460 ) ) ( not ( = ?auto_184462 ?auto_184464 ) ) ( not ( = ?auto_184462 ?auto_184466 ) ) ( not ( = ?auto_184462 ?auto_184461 ) ) ( not ( = ?auto_184462 ?auto_184467 ) ) ( not ( = ?auto_184462 ?auto_184460 ) ) ( not ( = ?auto_184465 ?auto_184464 ) ) ( not ( = ?auto_184465 ?auto_184466 ) ) ( not ( = ?auto_184465 ?auto_184461 ) ) ( not ( = ?auto_184465 ?auto_184467 ) ) ( not ( = ?auto_184465 ?auto_184460 ) ) ( ON ?auto_184463 ?auto_184465 ) ( ON ?auto_184464 ?auto_184463 ) ( CLEAR ?auto_184467 ) ( ON ?auto_184460 ?auto_184464 ) ( CLEAR ?auto_184460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184459 ?auto_184462 ?auto_184465 ?auto_184463 ?auto_184464 )
      ( MAKE-1PILE ?auto_184459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184468 - BLOCK
    )
    :vars
    (
      ?auto_184469 - BLOCK
      ?auto_184471 - BLOCK
      ?auto_184474 - BLOCK
      ?auto_184475 - BLOCK
      ?auto_184470 - BLOCK
      ?auto_184473 - BLOCK
      ?auto_184476 - BLOCK
      ?auto_184472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184469 ?auto_184468 ) ( ON-TABLE ?auto_184468 ) ( not ( = ?auto_184468 ?auto_184469 ) ) ( not ( = ?auto_184468 ?auto_184471 ) ) ( not ( = ?auto_184468 ?auto_184474 ) ) ( not ( = ?auto_184469 ?auto_184471 ) ) ( not ( = ?auto_184469 ?auto_184474 ) ) ( not ( = ?auto_184471 ?auto_184474 ) ) ( ON ?auto_184471 ?auto_184469 ) ( ON-TABLE ?auto_184475 ) ( ON ?auto_184470 ?auto_184475 ) ( not ( = ?auto_184475 ?auto_184470 ) ) ( not ( = ?auto_184475 ?auto_184473 ) ) ( not ( = ?auto_184475 ?auto_184476 ) ) ( not ( = ?auto_184475 ?auto_184472 ) ) ( not ( = ?auto_184475 ?auto_184474 ) ) ( not ( = ?auto_184470 ?auto_184473 ) ) ( not ( = ?auto_184470 ?auto_184476 ) ) ( not ( = ?auto_184470 ?auto_184472 ) ) ( not ( = ?auto_184470 ?auto_184474 ) ) ( not ( = ?auto_184473 ?auto_184476 ) ) ( not ( = ?auto_184473 ?auto_184472 ) ) ( not ( = ?auto_184473 ?auto_184474 ) ) ( not ( = ?auto_184476 ?auto_184472 ) ) ( not ( = ?auto_184476 ?auto_184474 ) ) ( not ( = ?auto_184472 ?auto_184474 ) ) ( not ( = ?auto_184468 ?auto_184472 ) ) ( not ( = ?auto_184468 ?auto_184475 ) ) ( not ( = ?auto_184468 ?auto_184470 ) ) ( not ( = ?auto_184468 ?auto_184473 ) ) ( not ( = ?auto_184468 ?auto_184476 ) ) ( not ( = ?auto_184469 ?auto_184472 ) ) ( not ( = ?auto_184469 ?auto_184475 ) ) ( not ( = ?auto_184469 ?auto_184470 ) ) ( not ( = ?auto_184469 ?auto_184473 ) ) ( not ( = ?auto_184469 ?auto_184476 ) ) ( not ( = ?auto_184471 ?auto_184472 ) ) ( not ( = ?auto_184471 ?auto_184475 ) ) ( not ( = ?auto_184471 ?auto_184470 ) ) ( not ( = ?auto_184471 ?auto_184473 ) ) ( not ( = ?auto_184471 ?auto_184476 ) ) ( ON ?auto_184474 ?auto_184471 ) ( ON ?auto_184472 ?auto_184474 ) ( ON ?auto_184476 ?auto_184472 ) ( CLEAR ?auto_184476 ) ( HOLDING ?auto_184473 ) ( CLEAR ?auto_184470 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184475 ?auto_184470 ?auto_184473 )
      ( MAKE-1PILE ?auto_184468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184477 - BLOCK
    )
    :vars
    (
      ?auto_184480 - BLOCK
      ?auto_184483 - BLOCK
      ?auto_184478 - BLOCK
      ?auto_184484 - BLOCK
      ?auto_184482 - BLOCK
      ?auto_184485 - BLOCK
      ?auto_184479 - BLOCK
      ?auto_184481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184480 ?auto_184477 ) ( ON-TABLE ?auto_184477 ) ( not ( = ?auto_184477 ?auto_184480 ) ) ( not ( = ?auto_184477 ?auto_184483 ) ) ( not ( = ?auto_184477 ?auto_184478 ) ) ( not ( = ?auto_184480 ?auto_184483 ) ) ( not ( = ?auto_184480 ?auto_184478 ) ) ( not ( = ?auto_184483 ?auto_184478 ) ) ( ON ?auto_184483 ?auto_184480 ) ( ON-TABLE ?auto_184484 ) ( ON ?auto_184482 ?auto_184484 ) ( not ( = ?auto_184484 ?auto_184482 ) ) ( not ( = ?auto_184484 ?auto_184485 ) ) ( not ( = ?auto_184484 ?auto_184479 ) ) ( not ( = ?auto_184484 ?auto_184481 ) ) ( not ( = ?auto_184484 ?auto_184478 ) ) ( not ( = ?auto_184482 ?auto_184485 ) ) ( not ( = ?auto_184482 ?auto_184479 ) ) ( not ( = ?auto_184482 ?auto_184481 ) ) ( not ( = ?auto_184482 ?auto_184478 ) ) ( not ( = ?auto_184485 ?auto_184479 ) ) ( not ( = ?auto_184485 ?auto_184481 ) ) ( not ( = ?auto_184485 ?auto_184478 ) ) ( not ( = ?auto_184479 ?auto_184481 ) ) ( not ( = ?auto_184479 ?auto_184478 ) ) ( not ( = ?auto_184481 ?auto_184478 ) ) ( not ( = ?auto_184477 ?auto_184481 ) ) ( not ( = ?auto_184477 ?auto_184484 ) ) ( not ( = ?auto_184477 ?auto_184482 ) ) ( not ( = ?auto_184477 ?auto_184485 ) ) ( not ( = ?auto_184477 ?auto_184479 ) ) ( not ( = ?auto_184480 ?auto_184481 ) ) ( not ( = ?auto_184480 ?auto_184484 ) ) ( not ( = ?auto_184480 ?auto_184482 ) ) ( not ( = ?auto_184480 ?auto_184485 ) ) ( not ( = ?auto_184480 ?auto_184479 ) ) ( not ( = ?auto_184483 ?auto_184481 ) ) ( not ( = ?auto_184483 ?auto_184484 ) ) ( not ( = ?auto_184483 ?auto_184482 ) ) ( not ( = ?auto_184483 ?auto_184485 ) ) ( not ( = ?auto_184483 ?auto_184479 ) ) ( ON ?auto_184478 ?auto_184483 ) ( ON ?auto_184481 ?auto_184478 ) ( ON ?auto_184479 ?auto_184481 ) ( CLEAR ?auto_184482 ) ( ON ?auto_184485 ?auto_184479 ) ( CLEAR ?auto_184485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184477 ?auto_184480 ?auto_184483 ?auto_184478 ?auto_184481 ?auto_184479 )
      ( MAKE-1PILE ?auto_184477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184486 - BLOCK
    )
    :vars
    (
      ?auto_184492 - BLOCK
      ?auto_184489 - BLOCK
      ?auto_184487 - BLOCK
      ?auto_184494 - BLOCK
      ?auto_184493 - BLOCK
      ?auto_184488 - BLOCK
      ?auto_184490 - BLOCK
      ?auto_184491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184492 ?auto_184486 ) ( ON-TABLE ?auto_184486 ) ( not ( = ?auto_184486 ?auto_184492 ) ) ( not ( = ?auto_184486 ?auto_184489 ) ) ( not ( = ?auto_184486 ?auto_184487 ) ) ( not ( = ?auto_184492 ?auto_184489 ) ) ( not ( = ?auto_184492 ?auto_184487 ) ) ( not ( = ?auto_184489 ?auto_184487 ) ) ( ON ?auto_184489 ?auto_184492 ) ( ON-TABLE ?auto_184494 ) ( not ( = ?auto_184494 ?auto_184493 ) ) ( not ( = ?auto_184494 ?auto_184488 ) ) ( not ( = ?auto_184494 ?auto_184490 ) ) ( not ( = ?auto_184494 ?auto_184491 ) ) ( not ( = ?auto_184494 ?auto_184487 ) ) ( not ( = ?auto_184493 ?auto_184488 ) ) ( not ( = ?auto_184493 ?auto_184490 ) ) ( not ( = ?auto_184493 ?auto_184491 ) ) ( not ( = ?auto_184493 ?auto_184487 ) ) ( not ( = ?auto_184488 ?auto_184490 ) ) ( not ( = ?auto_184488 ?auto_184491 ) ) ( not ( = ?auto_184488 ?auto_184487 ) ) ( not ( = ?auto_184490 ?auto_184491 ) ) ( not ( = ?auto_184490 ?auto_184487 ) ) ( not ( = ?auto_184491 ?auto_184487 ) ) ( not ( = ?auto_184486 ?auto_184491 ) ) ( not ( = ?auto_184486 ?auto_184494 ) ) ( not ( = ?auto_184486 ?auto_184493 ) ) ( not ( = ?auto_184486 ?auto_184488 ) ) ( not ( = ?auto_184486 ?auto_184490 ) ) ( not ( = ?auto_184492 ?auto_184491 ) ) ( not ( = ?auto_184492 ?auto_184494 ) ) ( not ( = ?auto_184492 ?auto_184493 ) ) ( not ( = ?auto_184492 ?auto_184488 ) ) ( not ( = ?auto_184492 ?auto_184490 ) ) ( not ( = ?auto_184489 ?auto_184491 ) ) ( not ( = ?auto_184489 ?auto_184494 ) ) ( not ( = ?auto_184489 ?auto_184493 ) ) ( not ( = ?auto_184489 ?auto_184488 ) ) ( not ( = ?auto_184489 ?auto_184490 ) ) ( ON ?auto_184487 ?auto_184489 ) ( ON ?auto_184491 ?auto_184487 ) ( ON ?auto_184490 ?auto_184491 ) ( ON ?auto_184488 ?auto_184490 ) ( CLEAR ?auto_184488 ) ( HOLDING ?auto_184493 ) ( CLEAR ?auto_184494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184494 ?auto_184493 )
      ( MAKE-1PILE ?auto_184486 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184495 - BLOCK
    )
    :vars
    (
      ?auto_184503 - BLOCK
      ?auto_184496 - BLOCK
      ?auto_184497 - BLOCK
      ?auto_184500 - BLOCK
      ?auto_184498 - BLOCK
      ?auto_184502 - BLOCK
      ?auto_184499 - BLOCK
      ?auto_184501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184503 ?auto_184495 ) ( ON-TABLE ?auto_184495 ) ( not ( = ?auto_184495 ?auto_184503 ) ) ( not ( = ?auto_184495 ?auto_184496 ) ) ( not ( = ?auto_184495 ?auto_184497 ) ) ( not ( = ?auto_184503 ?auto_184496 ) ) ( not ( = ?auto_184503 ?auto_184497 ) ) ( not ( = ?auto_184496 ?auto_184497 ) ) ( ON ?auto_184496 ?auto_184503 ) ( ON-TABLE ?auto_184500 ) ( not ( = ?auto_184500 ?auto_184498 ) ) ( not ( = ?auto_184500 ?auto_184502 ) ) ( not ( = ?auto_184500 ?auto_184499 ) ) ( not ( = ?auto_184500 ?auto_184501 ) ) ( not ( = ?auto_184500 ?auto_184497 ) ) ( not ( = ?auto_184498 ?auto_184502 ) ) ( not ( = ?auto_184498 ?auto_184499 ) ) ( not ( = ?auto_184498 ?auto_184501 ) ) ( not ( = ?auto_184498 ?auto_184497 ) ) ( not ( = ?auto_184502 ?auto_184499 ) ) ( not ( = ?auto_184502 ?auto_184501 ) ) ( not ( = ?auto_184502 ?auto_184497 ) ) ( not ( = ?auto_184499 ?auto_184501 ) ) ( not ( = ?auto_184499 ?auto_184497 ) ) ( not ( = ?auto_184501 ?auto_184497 ) ) ( not ( = ?auto_184495 ?auto_184501 ) ) ( not ( = ?auto_184495 ?auto_184500 ) ) ( not ( = ?auto_184495 ?auto_184498 ) ) ( not ( = ?auto_184495 ?auto_184502 ) ) ( not ( = ?auto_184495 ?auto_184499 ) ) ( not ( = ?auto_184503 ?auto_184501 ) ) ( not ( = ?auto_184503 ?auto_184500 ) ) ( not ( = ?auto_184503 ?auto_184498 ) ) ( not ( = ?auto_184503 ?auto_184502 ) ) ( not ( = ?auto_184503 ?auto_184499 ) ) ( not ( = ?auto_184496 ?auto_184501 ) ) ( not ( = ?auto_184496 ?auto_184500 ) ) ( not ( = ?auto_184496 ?auto_184498 ) ) ( not ( = ?auto_184496 ?auto_184502 ) ) ( not ( = ?auto_184496 ?auto_184499 ) ) ( ON ?auto_184497 ?auto_184496 ) ( ON ?auto_184501 ?auto_184497 ) ( ON ?auto_184499 ?auto_184501 ) ( ON ?auto_184502 ?auto_184499 ) ( CLEAR ?auto_184500 ) ( ON ?auto_184498 ?auto_184502 ) ( CLEAR ?auto_184498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184495 ?auto_184503 ?auto_184496 ?auto_184497 ?auto_184501 ?auto_184499 ?auto_184502 )
      ( MAKE-1PILE ?auto_184495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184504 - BLOCK
    )
    :vars
    (
      ?auto_184506 - BLOCK
      ?auto_184510 - BLOCK
      ?auto_184511 - BLOCK
      ?auto_184512 - BLOCK
      ?auto_184507 - BLOCK
      ?auto_184505 - BLOCK
      ?auto_184509 - BLOCK
      ?auto_184508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184506 ?auto_184504 ) ( ON-TABLE ?auto_184504 ) ( not ( = ?auto_184504 ?auto_184506 ) ) ( not ( = ?auto_184504 ?auto_184510 ) ) ( not ( = ?auto_184504 ?auto_184511 ) ) ( not ( = ?auto_184506 ?auto_184510 ) ) ( not ( = ?auto_184506 ?auto_184511 ) ) ( not ( = ?auto_184510 ?auto_184511 ) ) ( ON ?auto_184510 ?auto_184506 ) ( not ( = ?auto_184512 ?auto_184507 ) ) ( not ( = ?auto_184512 ?auto_184505 ) ) ( not ( = ?auto_184512 ?auto_184509 ) ) ( not ( = ?auto_184512 ?auto_184508 ) ) ( not ( = ?auto_184512 ?auto_184511 ) ) ( not ( = ?auto_184507 ?auto_184505 ) ) ( not ( = ?auto_184507 ?auto_184509 ) ) ( not ( = ?auto_184507 ?auto_184508 ) ) ( not ( = ?auto_184507 ?auto_184511 ) ) ( not ( = ?auto_184505 ?auto_184509 ) ) ( not ( = ?auto_184505 ?auto_184508 ) ) ( not ( = ?auto_184505 ?auto_184511 ) ) ( not ( = ?auto_184509 ?auto_184508 ) ) ( not ( = ?auto_184509 ?auto_184511 ) ) ( not ( = ?auto_184508 ?auto_184511 ) ) ( not ( = ?auto_184504 ?auto_184508 ) ) ( not ( = ?auto_184504 ?auto_184512 ) ) ( not ( = ?auto_184504 ?auto_184507 ) ) ( not ( = ?auto_184504 ?auto_184505 ) ) ( not ( = ?auto_184504 ?auto_184509 ) ) ( not ( = ?auto_184506 ?auto_184508 ) ) ( not ( = ?auto_184506 ?auto_184512 ) ) ( not ( = ?auto_184506 ?auto_184507 ) ) ( not ( = ?auto_184506 ?auto_184505 ) ) ( not ( = ?auto_184506 ?auto_184509 ) ) ( not ( = ?auto_184510 ?auto_184508 ) ) ( not ( = ?auto_184510 ?auto_184512 ) ) ( not ( = ?auto_184510 ?auto_184507 ) ) ( not ( = ?auto_184510 ?auto_184505 ) ) ( not ( = ?auto_184510 ?auto_184509 ) ) ( ON ?auto_184511 ?auto_184510 ) ( ON ?auto_184508 ?auto_184511 ) ( ON ?auto_184509 ?auto_184508 ) ( ON ?auto_184505 ?auto_184509 ) ( ON ?auto_184507 ?auto_184505 ) ( CLEAR ?auto_184507 ) ( HOLDING ?auto_184512 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184512 )
      ( MAKE-1PILE ?auto_184504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184513 - BLOCK
    )
    :vars
    (
      ?auto_184521 - BLOCK
      ?auto_184518 - BLOCK
      ?auto_184515 - BLOCK
      ?auto_184514 - BLOCK
      ?auto_184517 - BLOCK
      ?auto_184519 - BLOCK
      ?auto_184520 - BLOCK
      ?auto_184516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184521 ?auto_184513 ) ( ON-TABLE ?auto_184513 ) ( not ( = ?auto_184513 ?auto_184521 ) ) ( not ( = ?auto_184513 ?auto_184518 ) ) ( not ( = ?auto_184513 ?auto_184515 ) ) ( not ( = ?auto_184521 ?auto_184518 ) ) ( not ( = ?auto_184521 ?auto_184515 ) ) ( not ( = ?auto_184518 ?auto_184515 ) ) ( ON ?auto_184518 ?auto_184521 ) ( not ( = ?auto_184514 ?auto_184517 ) ) ( not ( = ?auto_184514 ?auto_184519 ) ) ( not ( = ?auto_184514 ?auto_184520 ) ) ( not ( = ?auto_184514 ?auto_184516 ) ) ( not ( = ?auto_184514 ?auto_184515 ) ) ( not ( = ?auto_184517 ?auto_184519 ) ) ( not ( = ?auto_184517 ?auto_184520 ) ) ( not ( = ?auto_184517 ?auto_184516 ) ) ( not ( = ?auto_184517 ?auto_184515 ) ) ( not ( = ?auto_184519 ?auto_184520 ) ) ( not ( = ?auto_184519 ?auto_184516 ) ) ( not ( = ?auto_184519 ?auto_184515 ) ) ( not ( = ?auto_184520 ?auto_184516 ) ) ( not ( = ?auto_184520 ?auto_184515 ) ) ( not ( = ?auto_184516 ?auto_184515 ) ) ( not ( = ?auto_184513 ?auto_184516 ) ) ( not ( = ?auto_184513 ?auto_184514 ) ) ( not ( = ?auto_184513 ?auto_184517 ) ) ( not ( = ?auto_184513 ?auto_184519 ) ) ( not ( = ?auto_184513 ?auto_184520 ) ) ( not ( = ?auto_184521 ?auto_184516 ) ) ( not ( = ?auto_184521 ?auto_184514 ) ) ( not ( = ?auto_184521 ?auto_184517 ) ) ( not ( = ?auto_184521 ?auto_184519 ) ) ( not ( = ?auto_184521 ?auto_184520 ) ) ( not ( = ?auto_184518 ?auto_184516 ) ) ( not ( = ?auto_184518 ?auto_184514 ) ) ( not ( = ?auto_184518 ?auto_184517 ) ) ( not ( = ?auto_184518 ?auto_184519 ) ) ( not ( = ?auto_184518 ?auto_184520 ) ) ( ON ?auto_184515 ?auto_184518 ) ( ON ?auto_184516 ?auto_184515 ) ( ON ?auto_184520 ?auto_184516 ) ( ON ?auto_184519 ?auto_184520 ) ( ON ?auto_184517 ?auto_184519 ) ( ON ?auto_184514 ?auto_184517 ) ( CLEAR ?auto_184514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184513 ?auto_184521 ?auto_184518 ?auto_184515 ?auto_184516 ?auto_184520 ?auto_184519 ?auto_184517 )
      ( MAKE-1PILE ?auto_184513 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184530 - BLOCK
      ?auto_184531 - BLOCK
      ?auto_184532 - BLOCK
      ?auto_184533 - BLOCK
      ?auto_184534 - BLOCK
      ?auto_184535 - BLOCK
      ?auto_184536 - BLOCK
      ?auto_184537 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184537 ) ( CLEAR ?auto_184536 ) ( ON-TABLE ?auto_184530 ) ( ON ?auto_184531 ?auto_184530 ) ( ON ?auto_184532 ?auto_184531 ) ( ON ?auto_184533 ?auto_184532 ) ( ON ?auto_184534 ?auto_184533 ) ( ON ?auto_184535 ?auto_184534 ) ( ON ?auto_184536 ?auto_184535 ) ( not ( = ?auto_184530 ?auto_184531 ) ) ( not ( = ?auto_184530 ?auto_184532 ) ) ( not ( = ?auto_184530 ?auto_184533 ) ) ( not ( = ?auto_184530 ?auto_184534 ) ) ( not ( = ?auto_184530 ?auto_184535 ) ) ( not ( = ?auto_184530 ?auto_184536 ) ) ( not ( = ?auto_184530 ?auto_184537 ) ) ( not ( = ?auto_184531 ?auto_184532 ) ) ( not ( = ?auto_184531 ?auto_184533 ) ) ( not ( = ?auto_184531 ?auto_184534 ) ) ( not ( = ?auto_184531 ?auto_184535 ) ) ( not ( = ?auto_184531 ?auto_184536 ) ) ( not ( = ?auto_184531 ?auto_184537 ) ) ( not ( = ?auto_184532 ?auto_184533 ) ) ( not ( = ?auto_184532 ?auto_184534 ) ) ( not ( = ?auto_184532 ?auto_184535 ) ) ( not ( = ?auto_184532 ?auto_184536 ) ) ( not ( = ?auto_184532 ?auto_184537 ) ) ( not ( = ?auto_184533 ?auto_184534 ) ) ( not ( = ?auto_184533 ?auto_184535 ) ) ( not ( = ?auto_184533 ?auto_184536 ) ) ( not ( = ?auto_184533 ?auto_184537 ) ) ( not ( = ?auto_184534 ?auto_184535 ) ) ( not ( = ?auto_184534 ?auto_184536 ) ) ( not ( = ?auto_184534 ?auto_184537 ) ) ( not ( = ?auto_184535 ?auto_184536 ) ) ( not ( = ?auto_184535 ?auto_184537 ) ) ( not ( = ?auto_184536 ?auto_184537 ) ) )
    :subtasks
    ( ( !STACK ?auto_184537 ?auto_184536 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184538 - BLOCK
      ?auto_184539 - BLOCK
      ?auto_184540 - BLOCK
      ?auto_184541 - BLOCK
      ?auto_184542 - BLOCK
      ?auto_184543 - BLOCK
      ?auto_184544 - BLOCK
      ?auto_184545 - BLOCK
    )
    :vars
    (
      ?auto_184546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184544 ) ( ON-TABLE ?auto_184538 ) ( ON ?auto_184539 ?auto_184538 ) ( ON ?auto_184540 ?auto_184539 ) ( ON ?auto_184541 ?auto_184540 ) ( ON ?auto_184542 ?auto_184541 ) ( ON ?auto_184543 ?auto_184542 ) ( ON ?auto_184544 ?auto_184543 ) ( not ( = ?auto_184538 ?auto_184539 ) ) ( not ( = ?auto_184538 ?auto_184540 ) ) ( not ( = ?auto_184538 ?auto_184541 ) ) ( not ( = ?auto_184538 ?auto_184542 ) ) ( not ( = ?auto_184538 ?auto_184543 ) ) ( not ( = ?auto_184538 ?auto_184544 ) ) ( not ( = ?auto_184538 ?auto_184545 ) ) ( not ( = ?auto_184539 ?auto_184540 ) ) ( not ( = ?auto_184539 ?auto_184541 ) ) ( not ( = ?auto_184539 ?auto_184542 ) ) ( not ( = ?auto_184539 ?auto_184543 ) ) ( not ( = ?auto_184539 ?auto_184544 ) ) ( not ( = ?auto_184539 ?auto_184545 ) ) ( not ( = ?auto_184540 ?auto_184541 ) ) ( not ( = ?auto_184540 ?auto_184542 ) ) ( not ( = ?auto_184540 ?auto_184543 ) ) ( not ( = ?auto_184540 ?auto_184544 ) ) ( not ( = ?auto_184540 ?auto_184545 ) ) ( not ( = ?auto_184541 ?auto_184542 ) ) ( not ( = ?auto_184541 ?auto_184543 ) ) ( not ( = ?auto_184541 ?auto_184544 ) ) ( not ( = ?auto_184541 ?auto_184545 ) ) ( not ( = ?auto_184542 ?auto_184543 ) ) ( not ( = ?auto_184542 ?auto_184544 ) ) ( not ( = ?auto_184542 ?auto_184545 ) ) ( not ( = ?auto_184543 ?auto_184544 ) ) ( not ( = ?auto_184543 ?auto_184545 ) ) ( not ( = ?auto_184544 ?auto_184545 ) ) ( ON ?auto_184545 ?auto_184546 ) ( CLEAR ?auto_184545 ) ( HAND-EMPTY ) ( not ( = ?auto_184538 ?auto_184546 ) ) ( not ( = ?auto_184539 ?auto_184546 ) ) ( not ( = ?auto_184540 ?auto_184546 ) ) ( not ( = ?auto_184541 ?auto_184546 ) ) ( not ( = ?auto_184542 ?auto_184546 ) ) ( not ( = ?auto_184543 ?auto_184546 ) ) ( not ( = ?auto_184544 ?auto_184546 ) ) ( not ( = ?auto_184545 ?auto_184546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184545 ?auto_184546 )
      ( MAKE-8PILE ?auto_184538 ?auto_184539 ?auto_184540 ?auto_184541 ?auto_184542 ?auto_184543 ?auto_184544 ?auto_184545 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184547 - BLOCK
      ?auto_184548 - BLOCK
      ?auto_184549 - BLOCK
      ?auto_184550 - BLOCK
      ?auto_184551 - BLOCK
      ?auto_184552 - BLOCK
      ?auto_184553 - BLOCK
      ?auto_184554 - BLOCK
    )
    :vars
    (
      ?auto_184555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184547 ) ( ON ?auto_184548 ?auto_184547 ) ( ON ?auto_184549 ?auto_184548 ) ( ON ?auto_184550 ?auto_184549 ) ( ON ?auto_184551 ?auto_184550 ) ( ON ?auto_184552 ?auto_184551 ) ( not ( = ?auto_184547 ?auto_184548 ) ) ( not ( = ?auto_184547 ?auto_184549 ) ) ( not ( = ?auto_184547 ?auto_184550 ) ) ( not ( = ?auto_184547 ?auto_184551 ) ) ( not ( = ?auto_184547 ?auto_184552 ) ) ( not ( = ?auto_184547 ?auto_184553 ) ) ( not ( = ?auto_184547 ?auto_184554 ) ) ( not ( = ?auto_184548 ?auto_184549 ) ) ( not ( = ?auto_184548 ?auto_184550 ) ) ( not ( = ?auto_184548 ?auto_184551 ) ) ( not ( = ?auto_184548 ?auto_184552 ) ) ( not ( = ?auto_184548 ?auto_184553 ) ) ( not ( = ?auto_184548 ?auto_184554 ) ) ( not ( = ?auto_184549 ?auto_184550 ) ) ( not ( = ?auto_184549 ?auto_184551 ) ) ( not ( = ?auto_184549 ?auto_184552 ) ) ( not ( = ?auto_184549 ?auto_184553 ) ) ( not ( = ?auto_184549 ?auto_184554 ) ) ( not ( = ?auto_184550 ?auto_184551 ) ) ( not ( = ?auto_184550 ?auto_184552 ) ) ( not ( = ?auto_184550 ?auto_184553 ) ) ( not ( = ?auto_184550 ?auto_184554 ) ) ( not ( = ?auto_184551 ?auto_184552 ) ) ( not ( = ?auto_184551 ?auto_184553 ) ) ( not ( = ?auto_184551 ?auto_184554 ) ) ( not ( = ?auto_184552 ?auto_184553 ) ) ( not ( = ?auto_184552 ?auto_184554 ) ) ( not ( = ?auto_184553 ?auto_184554 ) ) ( ON ?auto_184554 ?auto_184555 ) ( CLEAR ?auto_184554 ) ( not ( = ?auto_184547 ?auto_184555 ) ) ( not ( = ?auto_184548 ?auto_184555 ) ) ( not ( = ?auto_184549 ?auto_184555 ) ) ( not ( = ?auto_184550 ?auto_184555 ) ) ( not ( = ?auto_184551 ?auto_184555 ) ) ( not ( = ?auto_184552 ?auto_184555 ) ) ( not ( = ?auto_184553 ?auto_184555 ) ) ( not ( = ?auto_184554 ?auto_184555 ) ) ( HOLDING ?auto_184553 ) ( CLEAR ?auto_184552 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184547 ?auto_184548 ?auto_184549 ?auto_184550 ?auto_184551 ?auto_184552 ?auto_184553 )
      ( MAKE-8PILE ?auto_184547 ?auto_184548 ?auto_184549 ?auto_184550 ?auto_184551 ?auto_184552 ?auto_184553 ?auto_184554 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184556 - BLOCK
      ?auto_184557 - BLOCK
      ?auto_184558 - BLOCK
      ?auto_184559 - BLOCK
      ?auto_184560 - BLOCK
      ?auto_184561 - BLOCK
      ?auto_184562 - BLOCK
      ?auto_184563 - BLOCK
    )
    :vars
    (
      ?auto_184564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184556 ) ( ON ?auto_184557 ?auto_184556 ) ( ON ?auto_184558 ?auto_184557 ) ( ON ?auto_184559 ?auto_184558 ) ( ON ?auto_184560 ?auto_184559 ) ( ON ?auto_184561 ?auto_184560 ) ( not ( = ?auto_184556 ?auto_184557 ) ) ( not ( = ?auto_184556 ?auto_184558 ) ) ( not ( = ?auto_184556 ?auto_184559 ) ) ( not ( = ?auto_184556 ?auto_184560 ) ) ( not ( = ?auto_184556 ?auto_184561 ) ) ( not ( = ?auto_184556 ?auto_184562 ) ) ( not ( = ?auto_184556 ?auto_184563 ) ) ( not ( = ?auto_184557 ?auto_184558 ) ) ( not ( = ?auto_184557 ?auto_184559 ) ) ( not ( = ?auto_184557 ?auto_184560 ) ) ( not ( = ?auto_184557 ?auto_184561 ) ) ( not ( = ?auto_184557 ?auto_184562 ) ) ( not ( = ?auto_184557 ?auto_184563 ) ) ( not ( = ?auto_184558 ?auto_184559 ) ) ( not ( = ?auto_184558 ?auto_184560 ) ) ( not ( = ?auto_184558 ?auto_184561 ) ) ( not ( = ?auto_184558 ?auto_184562 ) ) ( not ( = ?auto_184558 ?auto_184563 ) ) ( not ( = ?auto_184559 ?auto_184560 ) ) ( not ( = ?auto_184559 ?auto_184561 ) ) ( not ( = ?auto_184559 ?auto_184562 ) ) ( not ( = ?auto_184559 ?auto_184563 ) ) ( not ( = ?auto_184560 ?auto_184561 ) ) ( not ( = ?auto_184560 ?auto_184562 ) ) ( not ( = ?auto_184560 ?auto_184563 ) ) ( not ( = ?auto_184561 ?auto_184562 ) ) ( not ( = ?auto_184561 ?auto_184563 ) ) ( not ( = ?auto_184562 ?auto_184563 ) ) ( ON ?auto_184563 ?auto_184564 ) ( not ( = ?auto_184556 ?auto_184564 ) ) ( not ( = ?auto_184557 ?auto_184564 ) ) ( not ( = ?auto_184558 ?auto_184564 ) ) ( not ( = ?auto_184559 ?auto_184564 ) ) ( not ( = ?auto_184560 ?auto_184564 ) ) ( not ( = ?auto_184561 ?auto_184564 ) ) ( not ( = ?auto_184562 ?auto_184564 ) ) ( not ( = ?auto_184563 ?auto_184564 ) ) ( CLEAR ?auto_184561 ) ( ON ?auto_184562 ?auto_184563 ) ( CLEAR ?auto_184562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184564 ?auto_184563 )
      ( MAKE-8PILE ?auto_184556 ?auto_184557 ?auto_184558 ?auto_184559 ?auto_184560 ?auto_184561 ?auto_184562 ?auto_184563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184565 - BLOCK
      ?auto_184566 - BLOCK
      ?auto_184567 - BLOCK
      ?auto_184568 - BLOCK
      ?auto_184569 - BLOCK
      ?auto_184570 - BLOCK
      ?auto_184571 - BLOCK
      ?auto_184572 - BLOCK
    )
    :vars
    (
      ?auto_184573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184565 ) ( ON ?auto_184566 ?auto_184565 ) ( ON ?auto_184567 ?auto_184566 ) ( ON ?auto_184568 ?auto_184567 ) ( ON ?auto_184569 ?auto_184568 ) ( not ( = ?auto_184565 ?auto_184566 ) ) ( not ( = ?auto_184565 ?auto_184567 ) ) ( not ( = ?auto_184565 ?auto_184568 ) ) ( not ( = ?auto_184565 ?auto_184569 ) ) ( not ( = ?auto_184565 ?auto_184570 ) ) ( not ( = ?auto_184565 ?auto_184571 ) ) ( not ( = ?auto_184565 ?auto_184572 ) ) ( not ( = ?auto_184566 ?auto_184567 ) ) ( not ( = ?auto_184566 ?auto_184568 ) ) ( not ( = ?auto_184566 ?auto_184569 ) ) ( not ( = ?auto_184566 ?auto_184570 ) ) ( not ( = ?auto_184566 ?auto_184571 ) ) ( not ( = ?auto_184566 ?auto_184572 ) ) ( not ( = ?auto_184567 ?auto_184568 ) ) ( not ( = ?auto_184567 ?auto_184569 ) ) ( not ( = ?auto_184567 ?auto_184570 ) ) ( not ( = ?auto_184567 ?auto_184571 ) ) ( not ( = ?auto_184567 ?auto_184572 ) ) ( not ( = ?auto_184568 ?auto_184569 ) ) ( not ( = ?auto_184568 ?auto_184570 ) ) ( not ( = ?auto_184568 ?auto_184571 ) ) ( not ( = ?auto_184568 ?auto_184572 ) ) ( not ( = ?auto_184569 ?auto_184570 ) ) ( not ( = ?auto_184569 ?auto_184571 ) ) ( not ( = ?auto_184569 ?auto_184572 ) ) ( not ( = ?auto_184570 ?auto_184571 ) ) ( not ( = ?auto_184570 ?auto_184572 ) ) ( not ( = ?auto_184571 ?auto_184572 ) ) ( ON ?auto_184572 ?auto_184573 ) ( not ( = ?auto_184565 ?auto_184573 ) ) ( not ( = ?auto_184566 ?auto_184573 ) ) ( not ( = ?auto_184567 ?auto_184573 ) ) ( not ( = ?auto_184568 ?auto_184573 ) ) ( not ( = ?auto_184569 ?auto_184573 ) ) ( not ( = ?auto_184570 ?auto_184573 ) ) ( not ( = ?auto_184571 ?auto_184573 ) ) ( not ( = ?auto_184572 ?auto_184573 ) ) ( ON ?auto_184571 ?auto_184572 ) ( CLEAR ?auto_184571 ) ( ON-TABLE ?auto_184573 ) ( HOLDING ?auto_184570 ) ( CLEAR ?auto_184569 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184565 ?auto_184566 ?auto_184567 ?auto_184568 ?auto_184569 ?auto_184570 )
      ( MAKE-8PILE ?auto_184565 ?auto_184566 ?auto_184567 ?auto_184568 ?auto_184569 ?auto_184570 ?auto_184571 ?auto_184572 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184574 - BLOCK
      ?auto_184575 - BLOCK
      ?auto_184576 - BLOCK
      ?auto_184577 - BLOCK
      ?auto_184578 - BLOCK
      ?auto_184579 - BLOCK
      ?auto_184580 - BLOCK
      ?auto_184581 - BLOCK
    )
    :vars
    (
      ?auto_184582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184574 ) ( ON ?auto_184575 ?auto_184574 ) ( ON ?auto_184576 ?auto_184575 ) ( ON ?auto_184577 ?auto_184576 ) ( ON ?auto_184578 ?auto_184577 ) ( not ( = ?auto_184574 ?auto_184575 ) ) ( not ( = ?auto_184574 ?auto_184576 ) ) ( not ( = ?auto_184574 ?auto_184577 ) ) ( not ( = ?auto_184574 ?auto_184578 ) ) ( not ( = ?auto_184574 ?auto_184579 ) ) ( not ( = ?auto_184574 ?auto_184580 ) ) ( not ( = ?auto_184574 ?auto_184581 ) ) ( not ( = ?auto_184575 ?auto_184576 ) ) ( not ( = ?auto_184575 ?auto_184577 ) ) ( not ( = ?auto_184575 ?auto_184578 ) ) ( not ( = ?auto_184575 ?auto_184579 ) ) ( not ( = ?auto_184575 ?auto_184580 ) ) ( not ( = ?auto_184575 ?auto_184581 ) ) ( not ( = ?auto_184576 ?auto_184577 ) ) ( not ( = ?auto_184576 ?auto_184578 ) ) ( not ( = ?auto_184576 ?auto_184579 ) ) ( not ( = ?auto_184576 ?auto_184580 ) ) ( not ( = ?auto_184576 ?auto_184581 ) ) ( not ( = ?auto_184577 ?auto_184578 ) ) ( not ( = ?auto_184577 ?auto_184579 ) ) ( not ( = ?auto_184577 ?auto_184580 ) ) ( not ( = ?auto_184577 ?auto_184581 ) ) ( not ( = ?auto_184578 ?auto_184579 ) ) ( not ( = ?auto_184578 ?auto_184580 ) ) ( not ( = ?auto_184578 ?auto_184581 ) ) ( not ( = ?auto_184579 ?auto_184580 ) ) ( not ( = ?auto_184579 ?auto_184581 ) ) ( not ( = ?auto_184580 ?auto_184581 ) ) ( ON ?auto_184581 ?auto_184582 ) ( not ( = ?auto_184574 ?auto_184582 ) ) ( not ( = ?auto_184575 ?auto_184582 ) ) ( not ( = ?auto_184576 ?auto_184582 ) ) ( not ( = ?auto_184577 ?auto_184582 ) ) ( not ( = ?auto_184578 ?auto_184582 ) ) ( not ( = ?auto_184579 ?auto_184582 ) ) ( not ( = ?auto_184580 ?auto_184582 ) ) ( not ( = ?auto_184581 ?auto_184582 ) ) ( ON ?auto_184580 ?auto_184581 ) ( ON-TABLE ?auto_184582 ) ( CLEAR ?auto_184578 ) ( ON ?auto_184579 ?auto_184580 ) ( CLEAR ?auto_184579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184582 ?auto_184581 ?auto_184580 )
      ( MAKE-8PILE ?auto_184574 ?auto_184575 ?auto_184576 ?auto_184577 ?auto_184578 ?auto_184579 ?auto_184580 ?auto_184581 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184583 - BLOCK
      ?auto_184584 - BLOCK
      ?auto_184585 - BLOCK
      ?auto_184586 - BLOCK
      ?auto_184587 - BLOCK
      ?auto_184588 - BLOCK
      ?auto_184589 - BLOCK
      ?auto_184590 - BLOCK
    )
    :vars
    (
      ?auto_184591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184583 ) ( ON ?auto_184584 ?auto_184583 ) ( ON ?auto_184585 ?auto_184584 ) ( ON ?auto_184586 ?auto_184585 ) ( not ( = ?auto_184583 ?auto_184584 ) ) ( not ( = ?auto_184583 ?auto_184585 ) ) ( not ( = ?auto_184583 ?auto_184586 ) ) ( not ( = ?auto_184583 ?auto_184587 ) ) ( not ( = ?auto_184583 ?auto_184588 ) ) ( not ( = ?auto_184583 ?auto_184589 ) ) ( not ( = ?auto_184583 ?auto_184590 ) ) ( not ( = ?auto_184584 ?auto_184585 ) ) ( not ( = ?auto_184584 ?auto_184586 ) ) ( not ( = ?auto_184584 ?auto_184587 ) ) ( not ( = ?auto_184584 ?auto_184588 ) ) ( not ( = ?auto_184584 ?auto_184589 ) ) ( not ( = ?auto_184584 ?auto_184590 ) ) ( not ( = ?auto_184585 ?auto_184586 ) ) ( not ( = ?auto_184585 ?auto_184587 ) ) ( not ( = ?auto_184585 ?auto_184588 ) ) ( not ( = ?auto_184585 ?auto_184589 ) ) ( not ( = ?auto_184585 ?auto_184590 ) ) ( not ( = ?auto_184586 ?auto_184587 ) ) ( not ( = ?auto_184586 ?auto_184588 ) ) ( not ( = ?auto_184586 ?auto_184589 ) ) ( not ( = ?auto_184586 ?auto_184590 ) ) ( not ( = ?auto_184587 ?auto_184588 ) ) ( not ( = ?auto_184587 ?auto_184589 ) ) ( not ( = ?auto_184587 ?auto_184590 ) ) ( not ( = ?auto_184588 ?auto_184589 ) ) ( not ( = ?auto_184588 ?auto_184590 ) ) ( not ( = ?auto_184589 ?auto_184590 ) ) ( ON ?auto_184590 ?auto_184591 ) ( not ( = ?auto_184583 ?auto_184591 ) ) ( not ( = ?auto_184584 ?auto_184591 ) ) ( not ( = ?auto_184585 ?auto_184591 ) ) ( not ( = ?auto_184586 ?auto_184591 ) ) ( not ( = ?auto_184587 ?auto_184591 ) ) ( not ( = ?auto_184588 ?auto_184591 ) ) ( not ( = ?auto_184589 ?auto_184591 ) ) ( not ( = ?auto_184590 ?auto_184591 ) ) ( ON ?auto_184589 ?auto_184590 ) ( ON-TABLE ?auto_184591 ) ( ON ?auto_184588 ?auto_184589 ) ( CLEAR ?auto_184588 ) ( HOLDING ?auto_184587 ) ( CLEAR ?auto_184586 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184583 ?auto_184584 ?auto_184585 ?auto_184586 ?auto_184587 )
      ( MAKE-8PILE ?auto_184583 ?auto_184584 ?auto_184585 ?auto_184586 ?auto_184587 ?auto_184588 ?auto_184589 ?auto_184590 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184592 - BLOCK
      ?auto_184593 - BLOCK
      ?auto_184594 - BLOCK
      ?auto_184595 - BLOCK
      ?auto_184596 - BLOCK
      ?auto_184597 - BLOCK
      ?auto_184598 - BLOCK
      ?auto_184599 - BLOCK
    )
    :vars
    (
      ?auto_184600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184592 ) ( ON ?auto_184593 ?auto_184592 ) ( ON ?auto_184594 ?auto_184593 ) ( ON ?auto_184595 ?auto_184594 ) ( not ( = ?auto_184592 ?auto_184593 ) ) ( not ( = ?auto_184592 ?auto_184594 ) ) ( not ( = ?auto_184592 ?auto_184595 ) ) ( not ( = ?auto_184592 ?auto_184596 ) ) ( not ( = ?auto_184592 ?auto_184597 ) ) ( not ( = ?auto_184592 ?auto_184598 ) ) ( not ( = ?auto_184592 ?auto_184599 ) ) ( not ( = ?auto_184593 ?auto_184594 ) ) ( not ( = ?auto_184593 ?auto_184595 ) ) ( not ( = ?auto_184593 ?auto_184596 ) ) ( not ( = ?auto_184593 ?auto_184597 ) ) ( not ( = ?auto_184593 ?auto_184598 ) ) ( not ( = ?auto_184593 ?auto_184599 ) ) ( not ( = ?auto_184594 ?auto_184595 ) ) ( not ( = ?auto_184594 ?auto_184596 ) ) ( not ( = ?auto_184594 ?auto_184597 ) ) ( not ( = ?auto_184594 ?auto_184598 ) ) ( not ( = ?auto_184594 ?auto_184599 ) ) ( not ( = ?auto_184595 ?auto_184596 ) ) ( not ( = ?auto_184595 ?auto_184597 ) ) ( not ( = ?auto_184595 ?auto_184598 ) ) ( not ( = ?auto_184595 ?auto_184599 ) ) ( not ( = ?auto_184596 ?auto_184597 ) ) ( not ( = ?auto_184596 ?auto_184598 ) ) ( not ( = ?auto_184596 ?auto_184599 ) ) ( not ( = ?auto_184597 ?auto_184598 ) ) ( not ( = ?auto_184597 ?auto_184599 ) ) ( not ( = ?auto_184598 ?auto_184599 ) ) ( ON ?auto_184599 ?auto_184600 ) ( not ( = ?auto_184592 ?auto_184600 ) ) ( not ( = ?auto_184593 ?auto_184600 ) ) ( not ( = ?auto_184594 ?auto_184600 ) ) ( not ( = ?auto_184595 ?auto_184600 ) ) ( not ( = ?auto_184596 ?auto_184600 ) ) ( not ( = ?auto_184597 ?auto_184600 ) ) ( not ( = ?auto_184598 ?auto_184600 ) ) ( not ( = ?auto_184599 ?auto_184600 ) ) ( ON ?auto_184598 ?auto_184599 ) ( ON-TABLE ?auto_184600 ) ( ON ?auto_184597 ?auto_184598 ) ( CLEAR ?auto_184595 ) ( ON ?auto_184596 ?auto_184597 ) ( CLEAR ?auto_184596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184600 ?auto_184599 ?auto_184598 ?auto_184597 )
      ( MAKE-8PILE ?auto_184592 ?auto_184593 ?auto_184594 ?auto_184595 ?auto_184596 ?auto_184597 ?auto_184598 ?auto_184599 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184601 - BLOCK
      ?auto_184602 - BLOCK
      ?auto_184603 - BLOCK
      ?auto_184604 - BLOCK
      ?auto_184605 - BLOCK
      ?auto_184606 - BLOCK
      ?auto_184607 - BLOCK
      ?auto_184608 - BLOCK
    )
    :vars
    (
      ?auto_184609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184601 ) ( ON ?auto_184602 ?auto_184601 ) ( ON ?auto_184603 ?auto_184602 ) ( not ( = ?auto_184601 ?auto_184602 ) ) ( not ( = ?auto_184601 ?auto_184603 ) ) ( not ( = ?auto_184601 ?auto_184604 ) ) ( not ( = ?auto_184601 ?auto_184605 ) ) ( not ( = ?auto_184601 ?auto_184606 ) ) ( not ( = ?auto_184601 ?auto_184607 ) ) ( not ( = ?auto_184601 ?auto_184608 ) ) ( not ( = ?auto_184602 ?auto_184603 ) ) ( not ( = ?auto_184602 ?auto_184604 ) ) ( not ( = ?auto_184602 ?auto_184605 ) ) ( not ( = ?auto_184602 ?auto_184606 ) ) ( not ( = ?auto_184602 ?auto_184607 ) ) ( not ( = ?auto_184602 ?auto_184608 ) ) ( not ( = ?auto_184603 ?auto_184604 ) ) ( not ( = ?auto_184603 ?auto_184605 ) ) ( not ( = ?auto_184603 ?auto_184606 ) ) ( not ( = ?auto_184603 ?auto_184607 ) ) ( not ( = ?auto_184603 ?auto_184608 ) ) ( not ( = ?auto_184604 ?auto_184605 ) ) ( not ( = ?auto_184604 ?auto_184606 ) ) ( not ( = ?auto_184604 ?auto_184607 ) ) ( not ( = ?auto_184604 ?auto_184608 ) ) ( not ( = ?auto_184605 ?auto_184606 ) ) ( not ( = ?auto_184605 ?auto_184607 ) ) ( not ( = ?auto_184605 ?auto_184608 ) ) ( not ( = ?auto_184606 ?auto_184607 ) ) ( not ( = ?auto_184606 ?auto_184608 ) ) ( not ( = ?auto_184607 ?auto_184608 ) ) ( ON ?auto_184608 ?auto_184609 ) ( not ( = ?auto_184601 ?auto_184609 ) ) ( not ( = ?auto_184602 ?auto_184609 ) ) ( not ( = ?auto_184603 ?auto_184609 ) ) ( not ( = ?auto_184604 ?auto_184609 ) ) ( not ( = ?auto_184605 ?auto_184609 ) ) ( not ( = ?auto_184606 ?auto_184609 ) ) ( not ( = ?auto_184607 ?auto_184609 ) ) ( not ( = ?auto_184608 ?auto_184609 ) ) ( ON ?auto_184607 ?auto_184608 ) ( ON-TABLE ?auto_184609 ) ( ON ?auto_184606 ?auto_184607 ) ( ON ?auto_184605 ?auto_184606 ) ( CLEAR ?auto_184605 ) ( HOLDING ?auto_184604 ) ( CLEAR ?auto_184603 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184601 ?auto_184602 ?auto_184603 ?auto_184604 )
      ( MAKE-8PILE ?auto_184601 ?auto_184602 ?auto_184603 ?auto_184604 ?auto_184605 ?auto_184606 ?auto_184607 ?auto_184608 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184610 - BLOCK
      ?auto_184611 - BLOCK
      ?auto_184612 - BLOCK
      ?auto_184613 - BLOCK
      ?auto_184614 - BLOCK
      ?auto_184615 - BLOCK
      ?auto_184616 - BLOCK
      ?auto_184617 - BLOCK
    )
    :vars
    (
      ?auto_184618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184610 ) ( ON ?auto_184611 ?auto_184610 ) ( ON ?auto_184612 ?auto_184611 ) ( not ( = ?auto_184610 ?auto_184611 ) ) ( not ( = ?auto_184610 ?auto_184612 ) ) ( not ( = ?auto_184610 ?auto_184613 ) ) ( not ( = ?auto_184610 ?auto_184614 ) ) ( not ( = ?auto_184610 ?auto_184615 ) ) ( not ( = ?auto_184610 ?auto_184616 ) ) ( not ( = ?auto_184610 ?auto_184617 ) ) ( not ( = ?auto_184611 ?auto_184612 ) ) ( not ( = ?auto_184611 ?auto_184613 ) ) ( not ( = ?auto_184611 ?auto_184614 ) ) ( not ( = ?auto_184611 ?auto_184615 ) ) ( not ( = ?auto_184611 ?auto_184616 ) ) ( not ( = ?auto_184611 ?auto_184617 ) ) ( not ( = ?auto_184612 ?auto_184613 ) ) ( not ( = ?auto_184612 ?auto_184614 ) ) ( not ( = ?auto_184612 ?auto_184615 ) ) ( not ( = ?auto_184612 ?auto_184616 ) ) ( not ( = ?auto_184612 ?auto_184617 ) ) ( not ( = ?auto_184613 ?auto_184614 ) ) ( not ( = ?auto_184613 ?auto_184615 ) ) ( not ( = ?auto_184613 ?auto_184616 ) ) ( not ( = ?auto_184613 ?auto_184617 ) ) ( not ( = ?auto_184614 ?auto_184615 ) ) ( not ( = ?auto_184614 ?auto_184616 ) ) ( not ( = ?auto_184614 ?auto_184617 ) ) ( not ( = ?auto_184615 ?auto_184616 ) ) ( not ( = ?auto_184615 ?auto_184617 ) ) ( not ( = ?auto_184616 ?auto_184617 ) ) ( ON ?auto_184617 ?auto_184618 ) ( not ( = ?auto_184610 ?auto_184618 ) ) ( not ( = ?auto_184611 ?auto_184618 ) ) ( not ( = ?auto_184612 ?auto_184618 ) ) ( not ( = ?auto_184613 ?auto_184618 ) ) ( not ( = ?auto_184614 ?auto_184618 ) ) ( not ( = ?auto_184615 ?auto_184618 ) ) ( not ( = ?auto_184616 ?auto_184618 ) ) ( not ( = ?auto_184617 ?auto_184618 ) ) ( ON ?auto_184616 ?auto_184617 ) ( ON-TABLE ?auto_184618 ) ( ON ?auto_184615 ?auto_184616 ) ( ON ?auto_184614 ?auto_184615 ) ( CLEAR ?auto_184612 ) ( ON ?auto_184613 ?auto_184614 ) ( CLEAR ?auto_184613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184618 ?auto_184617 ?auto_184616 ?auto_184615 ?auto_184614 )
      ( MAKE-8PILE ?auto_184610 ?auto_184611 ?auto_184612 ?auto_184613 ?auto_184614 ?auto_184615 ?auto_184616 ?auto_184617 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184619 - BLOCK
      ?auto_184620 - BLOCK
      ?auto_184621 - BLOCK
      ?auto_184622 - BLOCK
      ?auto_184623 - BLOCK
      ?auto_184624 - BLOCK
      ?auto_184625 - BLOCK
      ?auto_184626 - BLOCK
    )
    :vars
    (
      ?auto_184627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184619 ) ( ON ?auto_184620 ?auto_184619 ) ( not ( = ?auto_184619 ?auto_184620 ) ) ( not ( = ?auto_184619 ?auto_184621 ) ) ( not ( = ?auto_184619 ?auto_184622 ) ) ( not ( = ?auto_184619 ?auto_184623 ) ) ( not ( = ?auto_184619 ?auto_184624 ) ) ( not ( = ?auto_184619 ?auto_184625 ) ) ( not ( = ?auto_184619 ?auto_184626 ) ) ( not ( = ?auto_184620 ?auto_184621 ) ) ( not ( = ?auto_184620 ?auto_184622 ) ) ( not ( = ?auto_184620 ?auto_184623 ) ) ( not ( = ?auto_184620 ?auto_184624 ) ) ( not ( = ?auto_184620 ?auto_184625 ) ) ( not ( = ?auto_184620 ?auto_184626 ) ) ( not ( = ?auto_184621 ?auto_184622 ) ) ( not ( = ?auto_184621 ?auto_184623 ) ) ( not ( = ?auto_184621 ?auto_184624 ) ) ( not ( = ?auto_184621 ?auto_184625 ) ) ( not ( = ?auto_184621 ?auto_184626 ) ) ( not ( = ?auto_184622 ?auto_184623 ) ) ( not ( = ?auto_184622 ?auto_184624 ) ) ( not ( = ?auto_184622 ?auto_184625 ) ) ( not ( = ?auto_184622 ?auto_184626 ) ) ( not ( = ?auto_184623 ?auto_184624 ) ) ( not ( = ?auto_184623 ?auto_184625 ) ) ( not ( = ?auto_184623 ?auto_184626 ) ) ( not ( = ?auto_184624 ?auto_184625 ) ) ( not ( = ?auto_184624 ?auto_184626 ) ) ( not ( = ?auto_184625 ?auto_184626 ) ) ( ON ?auto_184626 ?auto_184627 ) ( not ( = ?auto_184619 ?auto_184627 ) ) ( not ( = ?auto_184620 ?auto_184627 ) ) ( not ( = ?auto_184621 ?auto_184627 ) ) ( not ( = ?auto_184622 ?auto_184627 ) ) ( not ( = ?auto_184623 ?auto_184627 ) ) ( not ( = ?auto_184624 ?auto_184627 ) ) ( not ( = ?auto_184625 ?auto_184627 ) ) ( not ( = ?auto_184626 ?auto_184627 ) ) ( ON ?auto_184625 ?auto_184626 ) ( ON-TABLE ?auto_184627 ) ( ON ?auto_184624 ?auto_184625 ) ( ON ?auto_184623 ?auto_184624 ) ( ON ?auto_184622 ?auto_184623 ) ( CLEAR ?auto_184622 ) ( HOLDING ?auto_184621 ) ( CLEAR ?auto_184620 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184619 ?auto_184620 ?auto_184621 )
      ( MAKE-8PILE ?auto_184619 ?auto_184620 ?auto_184621 ?auto_184622 ?auto_184623 ?auto_184624 ?auto_184625 ?auto_184626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184628 - BLOCK
      ?auto_184629 - BLOCK
      ?auto_184630 - BLOCK
      ?auto_184631 - BLOCK
      ?auto_184632 - BLOCK
      ?auto_184633 - BLOCK
      ?auto_184634 - BLOCK
      ?auto_184635 - BLOCK
    )
    :vars
    (
      ?auto_184636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184628 ) ( ON ?auto_184629 ?auto_184628 ) ( not ( = ?auto_184628 ?auto_184629 ) ) ( not ( = ?auto_184628 ?auto_184630 ) ) ( not ( = ?auto_184628 ?auto_184631 ) ) ( not ( = ?auto_184628 ?auto_184632 ) ) ( not ( = ?auto_184628 ?auto_184633 ) ) ( not ( = ?auto_184628 ?auto_184634 ) ) ( not ( = ?auto_184628 ?auto_184635 ) ) ( not ( = ?auto_184629 ?auto_184630 ) ) ( not ( = ?auto_184629 ?auto_184631 ) ) ( not ( = ?auto_184629 ?auto_184632 ) ) ( not ( = ?auto_184629 ?auto_184633 ) ) ( not ( = ?auto_184629 ?auto_184634 ) ) ( not ( = ?auto_184629 ?auto_184635 ) ) ( not ( = ?auto_184630 ?auto_184631 ) ) ( not ( = ?auto_184630 ?auto_184632 ) ) ( not ( = ?auto_184630 ?auto_184633 ) ) ( not ( = ?auto_184630 ?auto_184634 ) ) ( not ( = ?auto_184630 ?auto_184635 ) ) ( not ( = ?auto_184631 ?auto_184632 ) ) ( not ( = ?auto_184631 ?auto_184633 ) ) ( not ( = ?auto_184631 ?auto_184634 ) ) ( not ( = ?auto_184631 ?auto_184635 ) ) ( not ( = ?auto_184632 ?auto_184633 ) ) ( not ( = ?auto_184632 ?auto_184634 ) ) ( not ( = ?auto_184632 ?auto_184635 ) ) ( not ( = ?auto_184633 ?auto_184634 ) ) ( not ( = ?auto_184633 ?auto_184635 ) ) ( not ( = ?auto_184634 ?auto_184635 ) ) ( ON ?auto_184635 ?auto_184636 ) ( not ( = ?auto_184628 ?auto_184636 ) ) ( not ( = ?auto_184629 ?auto_184636 ) ) ( not ( = ?auto_184630 ?auto_184636 ) ) ( not ( = ?auto_184631 ?auto_184636 ) ) ( not ( = ?auto_184632 ?auto_184636 ) ) ( not ( = ?auto_184633 ?auto_184636 ) ) ( not ( = ?auto_184634 ?auto_184636 ) ) ( not ( = ?auto_184635 ?auto_184636 ) ) ( ON ?auto_184634 ?auto_184635 ) ( ON-TABLE ?auto_184636 ) ( ON ?auto_184633 ?auto_184634 ) ( ON ?auto_184632 ?auto_184633 ) ( ON ?auto_184631 ?auto_184632 ) ( CLEAR ?auto_184629 ) ( ON ?auto_184630 ?auto_184631 ) ( CLEAR ?auto_184630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184636 ?auto_184635 ?auto_184634 ?auto_184633 ?auto_184632 ?auto_184631 )
      ( MAKE-8PILE ?auto_184628 ?auto_184629 ?auto_184630 ?auto_184631 ?auto_184632 ?auto_184633 ?auto_184634 ?auto_184635 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184637 - BLOCK
      ?auto_184638 - BLOCK
      ?auto_184639 - BLOCK
      ?auto_184640 - BLOCK
      ?auto_184641 - BLOCK
      ?auto_184642 - BLOCK
      ?auto_184643 - BLOCK
      ?auto_184644 - BLOCK
    )
    :vars
    (
      ?auto_184645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184637 ) ( not ( = ?auto_184637 ?auto_184638 ) ) ( not ( = ?auto_184637 ?auto_184639 ) ) ( not ( = ?auto_184637 ?auto_184640 ) ) ( not ( = ?auto_184637 ?auto_184641 ) ) ( not ( = ?auto_184637 ?auto_184642 ) ) ( not ( = ?auto_184637 ?auto_184643 ) ) ( not ( = ?auto_184637 ?auto_184644 ) ) ( not ( = ?auto_184638 ?auto_184639 ) ) ( not ( = ?auto_184638 ?auto_184640 ) ) ( not ( = ?auto_184638 ?auto_184641 ) ) ( not ( = ?auto_184638 ?auto_184642 ) ) ( not ( = ?auto_184638 ?auto_184643 ) ) ( not ( = ?auto_184638 ?auto_184644 ) ) ( not ( = ?auto_184639 ?auto_184640 ) ) ( not ( = ?auto_184639 ?auto_184641 ) ) ( not ( = ?auto_184639 ?auto_184642 ) ) ( not ( = ?auto_184639 ?auto_184643 ) ) ( not ( = ?auto_184639 ?auto_184644 ) ) ( not ( = ?auto_184640 ?auto_184641 ) ) ( not ( = ?auto_184640 ?auto_184642 ) ) ( not ( = ?auto_184640 ?auto_184643 ) ) ( not ( = ?auto_184640 ?auto_184644 ) ) ( not ( = ?auto_184641 ?auto_184642 ) ) ( not ( = ?auto_184641 ?auto_184643 ) ) ( not ( = ?auto_184641 ?auto_184644 ) ) ( not ( = ?auto_184642 ?auto_184643 ) ) ( not ( = ?auto_184642 ?auto_184644 ) ) ( not ( = ?auto_184643 ?auto_184644 ) ) ( ON ?auto_184644 ?auto_184645 ) ( not ( = ?auto_184637 ?auto_184645 ) ) ( not ( = ?auto_184638 ?auto_184645 ) ) ( not ( = ?auto_184639 ?auto_184645 ) ) ( not ( = ?auto_184640 ?auto_184645 ) ) ( not ( = ?auto_184641 ?auto_184645 ) ) ( not ( = ?auto_184642 ?auto_184645 ) ) ( not ( = ?auto_184643 ?auto_184645 ) ) ( not ( = ?auto_184644 ?auto_184645 ) ) ( ON ?auto_184643 ?auto_184644 ) ( ON-TABLE ?auto_184645 ) ( ON ?auto_184642 ?auto_184643 ) ( ON ?auto_184641 ?auto_184642 ) ( ON ?auto_184640 ?auto_184641 ) ( ON ?auto_184639 ?auto_184640 ) ( CLEAR ?auto_184639 ) ( HOLDING ?auto_184638 ) ( CLEAR ?auto_184637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184637 ?auto_184638 )
      ( MAKE-8PILE ?auto_184637 ?auto_184638 ?auto_184639 ?auto_184640 ?auto_184641 ?auto_184642 ?auto_184643 ?auto_184644 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184646 - BLOCK
      ?auto_184647 - BLOCK
      ?auto_184648 - BLOCK
      ?auto_184649 - BLOCK
      ?auto_184650 - BLOCK
      ?auto_184651 - BLOCK
      ?auto_184652 - BLOCK
      ?auto_184653 - BLOCK
    )
    :vars
    (
      ?auto_184654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184646 ) ( not ( = ?auto_184646 ?auto_184647 ) ) ( not ( = ?auto_184646 ?auto_184648 ) ) ( not ( = ?auto_184646 ?auto_184649 ) ) ( not ( = ?auto_184646 ?auto_184650 ) ) ( not ( = ?auto_184646 ?auto_184651 ) ) ( not ( = ?auto_184646 ?auto_184652 ) ) ( not ( = ?auto_184646 ?auto_184653 ) ) ( not ( = ?auto_184647 ?auto_184648 ) ) ( not ( = ?auto_184647 ?auto_184649 ) ) ( not ( = ?auto_184647 ?auto_184650 ) ) ( not ( = ?auto_184647 ?auto_184651 ) ) ( not ( = ?auto_184647 ?auto_184652 ) ) ( not ( = ?auto_184647 ?auto_184653 ) ) ( not ( = ?auto_184648 ?auto_184649 ) ) ( not ( = ?auto_184648 ?auto_184650 ) ) ( not ( = ?auto_184648 ?auto_184651 ) ) ( not ( = ?auto_184648 ?auto_184652 ) ) ( not ( = ?auto_184648 ?auto_184653 ) ) ( not ( = ?auto_184649 ?auto_184650 ) ) ( not ( = ?auto_184649 ?auto_184651 ) ) ( not ( = ?auto_184649 ?auto_184652 ) ) ( not ( = ?auto_184649 ?auto_184653 ) ) ( not ( = ?auto_184650 ?auto_184651 ) ) ( not ( = ?auto_184650 ?auto_184652 ) ) ( not ( = ?auto_184650 ?auto_184653 ) ) ( not ( = ?auto_184651 ?auto_184652 ) ) ( not ( = ?auto_184651 ?auto_184653 ) ) ( not ( = ?auto_184652 ?auto_184653 ) ) ( ON ?auto_184653 ?auto_184654 ) ( not ( = ?auto_184646 ?auto_184654 ) ) ( not ( = ?auto_184647 ?auto_184654 ) ) ( not ( = ?auto_184648 ?auto_184654 ) ) ( not ( = ?auto_184649 ?auto_184654 ) ) ( not ( = ?auto_184650 ?auto_184654 ) ) ( not ( = ?auto_184651 ?auto_184654 ) ) ( not ( = ?auto_184652 ?auto_184654 ) ) ( not ( = ?auto_184653 ?auto_184654 ) ) ( ON ?auto_184652 ?auto_184653 ) ( ON-TABLE ?auto_184654 ) ( ON ?auto_184651 ?auto_184652 ) ( ON ?auto_184650 ?auto_184651 ) ( ON ?auto_184649 ?auto_184650 ) ( ON ?auto_184648 ?auto_184649 ) ( CLEAR ?auto_184646 ) ( ON ?auto_184647 ?auto_184648 ) ( CLEAR ?auto_184647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184654 ?auto_184653 ?auto_184652 ?auto_184651 ?auto_184650 ?auto_184649 ?auto_184648 )
      ( MAKE-8PILE ?auto_184646 ?auto_184647 ?auto_184648 ?auto_184649 ?auto_184650 ?auto_184651 ?auto_184652 ?auto_184653 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184655 - BLOCK
      ?auto_184656 - BLOCK
      ?auto_184657 - BLOCK
      ?auto_184658 - BLOCK
      ?auto_184659 - BLOCK
      ?auto_184660 - BLOCK
      ?auto_184661 - BLOCK
      ?auto_184662 - BLOCK
    )
    :vars
    (
      ?auto_184663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184655 ?auto_184656 ) ) ( not ( = ?auto_184655 ?auto_184657 ) ) ( not ( = ?auto_184655 ?auto_184658 ) ) ( not ( = ?auto_184655 ?auto_184659 ) ) ( not ( = ?auto_184655 ?auto_184660 ) ) ( not ( = ?auto_184655 ?auto_184661 ) ) ( not ( = ?auto_184655 ?auto_184662 ) ) ( not ( = ?auto_184656 ?auto_184657 ) ) ( not ( = ?auto_184656 ?auto_184658 ) ) ( not ( = ?auto_184656 ?auto_184659 ) ) ( not ( = ?auto_184656 ?auto_184660 ) ) ( not ( = ?auto_184656 ?auto_184661 ) ) ( not ( = ?auto_184656 ?auto_184662 ) ) ( not ( = ?auto_184657 ?auto_184658 ) ) ( not ( = ?auto_184657 ?auto_184659 ) ) ( not ( = ?auto_184657 ?auto_184660 ) ) ( not ( = ?auto_184657 ?auto_184661 ) ) ( not ( = ?auto_184657 ?auto_184662 ) ) ( not ( = ?auto_184658 ?auto_184659 ) ) ( not ( = ?auto_184658 ?auto_184660 ) ) ( not ( = ?auto_184658 ?auto_184661 ) ) ( not ( = ?auto_184658 ?auto_184662 ) ) ( not ( = ?auto_184659 ?auto_184660 ) ) ( not ( = ?auto_184659 ?auto_184661 ) ) ( not ( = ?auto_184659 ?auto_184662 ) ) ( not ( = ?auto_184660 ?auto_184661 ) ) ( not ( = ?auto_184660 ?auto_184662 ) ) ( not ( = ?auto_184661 ?auto_184662 ) ) ( ON ?auto_184662 ?auto_184663 ) ( not ( = ?auto_184655 ?auto_184663 ) ) ( not ( = ?auto_184656 ?auto_184663 ) ) ( not ( = ?auto_184657 ?auto_184663 ) ) ( not ( = ?auto_184658 ?auto_184663 ) ) ( not ( = ?auto_184659 ?auto_184663 ) ) ( not ( = ?auto_184660 ?auto_184663 ) ) ( not ( = ?auto_184661 ?auto_184663 ) ) ( not ( = ?auto_184662 ?auto_184663 ) ) ( ON ?auto_184661 ?auto_184662 ) ( ON-TABLE ?auto_184663 ) ( ON ?auto_184660 ?auto_184661 ) ( ON ?auto_184659 ?auto_184660 ) ( ON ?auto_184658 ?auto_184659 ) ( ON ?auto_184657 ?auto_184658 ) ( ON ?auto_184656 ?auto_184657 ) ( CLEAR ?auto_184656 ) ( HOLDING ?auto_184655 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184655 )
      ( MAKE-8PILE ?auto_184655 ?auto_184656 ?auto_184657 ?auto_184658 ?auto_184659 ?auto_184660 ?auto_184661 ?auto_184662 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184664 - BLOCK
      ?auto_184665 - BLOCK
      ?auto_184666 - BLOCK
      ?auto_184667 - BLOCK
      ?auto_184668 - BLOCK
      ?auto_184669 - BLOCK
      ?auto_184670 - BLOCK
      ?auto_184671 - BLOCK
    )
    :vars
    (
      ?auto_184672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184664 ?auto_184665 ) ) ( not ( = ?auto_184664 ?auto_184666 ) ) ( not ( = ?auto_184664 ?auto_184667 ) ) ( not ( = ?auto_184664 ?auto_184668 ) ) ( not ( = ?auto_184664 ?auto_184669 ) ) ( not ( = ?auto_184664 ?auto_184670 ) ) ( not ( = ?auto_184664 ?auto_184671 ) ) ( not ( = ?auto_184665 ?auto_184666 ) ) ( not ( = ?auto_184665 ?auto_184667 ) ) ( not ( = ?auto_184665 ?auto_184668 ) ) ( not ( = ?auto_184665 ?auto_184669 ) ) ( not ( = ?auto_184665 ?auto_184670 ) ) ( not ( = ?auto_184665 ?auto_184671 ) ) ( not ( = ?auto_184666 ?auto_184667 ) ) ( not ( = ?auto_184666 ?auto_184668 ) ) ( not ( = ?auto_184666 ?auto_184669 ) ) ( not ( = ?auto_184666 ?auto_184670 ) ) ( not ( = ?auto_184666 ?auto_184671 ) ) ( not ( = ?auto_184667 ?auto_184668 ) ) ( not ( = ?auto_184667 ?auto_184669 ) ) ( not ( = ?auto_184667 ?auto_184670 ) ) ( not ( = ?auto_184667 ?auto_184671 ) ) ( not ( = ?auto_184668 ?auto_184669 ) ) ( not ( = ?auto_184668 ?auto_184670 ) ) ( not ( = ?auto_184668 ?auto_184671 ) ) ( not ( = ?auto_184669 ?auto_184670 ) ) ( not ( = ?auto_184669 ?auto_184671 ) ) ( not ( = ?auto_184670 ?auto_184671 ) ) ( ON ?auto_184671 ?auto_184672 ) ( not ( = ?auto_184664 ?auto_184672 ) ) ( not ( = ?auto_184665 ?auto_184672 ) ) ( not ( = ?auto_184666 ?auto_184672 ) ) ( not ( = ?auto_184667 ?auto_184672 ) ) ( not ( = ?auto_184668 ?auto_184672 ) ) ( not ( = ?auto_184669 ?auto_184672 ) ) ( not ( = ?auto_184670 ?auto_184672 ) ) ( not ( = ?auto_184671 ?auto_184672 ) ) ( ON ?auto_184670 ?auto_184671 ) ( ON-TABLE ?auto_184672 ) ( ON ?auto_184669 ?auto_184670 ) ( ON ?auto_184668 ?auto_184669 ) ( ON ?auto_184667 ?auto_184668 ) ( ON ?auto_184666 ?auto_184667 ) ( ON ?auto_184665 ?auto_184666 ) ( ON ?auto_184664 ?auto_184665 ) ( CLEAR ?auto_184664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184672 ?auto_184671 ?auto_184670 ?auto_184669 ?auto_184668 ?auto_184667 ?auto_184666 ?auto_184665 )
      ( MAKE-8PILE ?auto_184664 ?auto_184665 ?auto_184666 ?auto_184667 ?auto_184668 ?auto_184669 ?auto_184670 ?auto_184671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184680 - BLOCK
      ?auto_184681 - BLOCK
      ?auto_184682 - BLOCK
      ?auto_184683 - BLOCK
      ?auto_184684 - BLOCK
      ?auto_184685 - BLOCK
      ?auto_184686 - BLOCK
    )
    :vars
    (
      ?auto_184687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184687 ?auto_184686 ) ( CLEAR ?auto_184687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184680 ) ( ON ?auto_184681 ?auto_184680 ) ( ON ?auto_184682 ?auto_184681 ) ( ON ?auto_184683 ?auto_184682 ) ( ON ?auto_184684 ?auto_184683 ) ( ON ?auto_184685 ?auto_184684 ) ( ON ?auto_184686 ?auto_184685 ) ( not ( = ?auto_184680 ?auto_184681 ) ) ( not ( = ?auto_184680 ?auto_184682 ) ) ( not ( = ?auto_184680 ?auto_184683 ) ) ( not ( = ?auto_184680 ?auto_184684 ) ) ( not ( = ?auto_184680 ?auto_184685 ) ) ( not ( = ?auto_184680 ?auto_184686 ) ) ( not ( = ?auto_184680 ?auto_184687 ) ) ( not ( = ?auto_184681 ?auto_184682 ) ) ( not ( = ?auto_184681 ?auto_184683 ) ) ( not ( = ?auto_184681 ?auto_184684 ) ) ( not ( = ?auto_184681 ?auto_184685 ) ) ( not ( = ?auto_184681 ?auto_184686 ) ) ( not ( = ?auto_184681 ?auto_184687 ) ) ( not ( = ?auto_184682 ?auto_184683 ) ) ( not ( = ?auto_184682 ?auto_184684 ) ) ( not ( = ?auto_184682 ?auto_184685 ) ) ( not ( = ?auto_184682 ?auto_184686 ) ) ( not ( = ?auto_184682 ?auto_184687 ) ) ( not ( = ?auto_184683 ?auto_184684 ) ) ( not ( = ?auto_184683 ?auto_184685 ) ) ( not ( = ?auto_184683 ?auto_184686 ) ) ( not ( = ?auto_184683 ?auto_184687 ) ) ( not ( = ?auto_184684 ?auto_184685 ) ) ( not ( = ?auto_184684 ?auto_184686 ) ) ( not ( = ?auto_184684 ?auto_184687 ) ) ( not ( = ?auto_184685 ?auto_184686 ) ) ( not ( = ?auto_184685 ?auto_184687 ) ) ( not ( = ?auto_184686 ?auto_184687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184687 ?auto_184686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184705 - BLOCK
      ?auto_184706 - BLOCK
      ?auto_184707 - BLOCK
      ?auto_184708 - BLOCK
      ?auto_184709 - BLOCK
      ?auto_184710 - BLOCK
      ?auto_184711 - BLOCK
    )
    :vars
    (
      ?auto_184712 - BLOCK
      ?auto_184713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184705 ) ( ON ?auto_184706 ?auto_184705 ) ( ON ?auto_184707 ?auto_184706 ) ( ON ?auto_184708 ?auto_184707 ) ( ON ?auto_184709 ?auto_184708 ) ( ON ?auto_184710 ?auto_184709 ) ( not ( = ?auto_184705 ?auto_184706 ) ) ( not ( = ?auto_184705 ?auto_184707 ) ) ( not ( = ?auto_184705 ?auto_184708 ) ) ( not ( = ?auto_184705 ?auto_184709 ) ) ( not ( = ?auto_184705 ?auto_184710 ) ) ( not ( = ?auto_184705 ?auto_184711 ) ) ( not ( = ?auto_184705 ?auto_184712 ) ) ( not ( = ?auto_184706 ?auto_184707 ) ) ( not ( = ?auto_184706 ?auto_184708 ) ) ( not ( = ?auto_184706 ?auto_184709 ) ) ( not ( = ?auto_184706 ?auto_184710 ) ) ( not ( = ?auto_184706 ?auto_184711 ) ) ( not ( = ?auto_184706 ?auto_184712 ) ) ( not ( = ?auto_184707 ?auto_184708 ) ) ( not ( = ?auto_184707 ?auto_184709 ) ) ( not ( = ?auto_184707 ?auto_184710 ) ) ( not ( = ?auto_184707 ?auto_184711 ) ) ( not ( = ?auto_184707 ?auto_184712 ) ) ( not ( = ?auto_184708 ?auto_184709 ) ) ( not ( = ?auto_184708 ?auto_184710 ) ) ( not ( = ?auto_184708 ?auto_184711 ) ) ( not ( = ?auto_184708 ?auto_184712 ) ) ( not ( = ?auto_184709 ?auto_184710 ) ) ( not ( = ?auto_184709 ?auto_184711 ) ) ( not ( = ?auto_184709 ?auto_184712 ) ) ( not ( = ?auto_184710 ?auto_184711 ) ) ( not ( = ?auto_184710 ?auto_184712 ) ) ( not ( = ?auto_184711 ?auto_184712 ) ) ( ON ?auto_184712 ?auto_184713 ) ( CLEAR ?auto_184712 ) ( not ( = ?auto_184705 ?auto_184713 ) ) ( not ( = ?auto_184706 ?auto_184713 ) ) ( not ( = ?auto_184707 ?auto_184713 ) ) ( not ( = ?auto_184708 ?auto_184713 ) ) ( not ( = ?auto_184709 ?auto_184713 ) ) ( not ( = ?auto_184710 ?auto_184713 ) ) ( not ( = ?auto_184711 ?auto_184713 ) ) ( not ( = ?auto_184712 ?auto_184713 ) ) ( HOLDING ?auto_184711 ) ( CLEAR ?auto_184710 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184705 ?auto_184706 ?auto_184707 ?auto_184708 ?auto_184709 ?auto_184710 ?auto_184711 ?auto_184712 )
      ( MAKE-7PILE ?auto_184705 ?auto_184706 ?auto_184707 ?auto_184708 ?auto_184709 ?auto_184710 ?auto_184711 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184714 - BLOCK
      ?auto_184715 - BLOCK
      ?auto_184716 - BLOCK
      ?auto_184717 - BLOCK
      ?auto_184718 - BLOCK
      ?auto_184719 - BLOCK
      ?auto_184720 - BLOCK
    )
    :vars
    (
      ?auto_184722 - BLOCK
      ?auto_184721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184714 ) ( ON ?auto_184715 ?auto_184714 ) ( ON ?auto_184716 ?auto_184715 ) ( ON ?auto_184717 ?auto_184716 ) ( ON ?auto_184718 ?auto_184717 ) ( ON ?auto_184719 ?auto_184718 ) ( not ( = ?auto_184714 ?auto_184715 ) ) ( not ( = ?auto_184714 ?auto_184716 ) ) ( not ( = ?auto_184714 ?auto_184717 ) ) ( not ( = ?auto_184714 ?auto_184718 ) ) ( not ( = ?auto_184714 ?auto_184719 ) ) ( not ( = ?auto_184714 ?auto_184720 ) ) ( not ( = ?auto_184714 ?auto_184722 ) ) ( not ( = ?auto_184715 ?auto_184716 ) ) ( not ( = ?auto_184715 ?auto_184717 ) ) ( not ( = ?auto_184715 ?auto_184718 ) ) ( not ( = ?auto_184715 ?auto_184719 ) ) ( not ( = ?auto_184715 ?auto_184720 ) ) ( not ( = ?auto_184715 ?auto_184722 ) ) ( not ( = ?auto_184716 ?auto_184717 ) ) ( not ( = ?auto_184716 ?auto_184718 ) ) ( not ( = ?auto_184716 ?auto_184719 ) ) ( not ( = ?auto_184716 ?auto_184720 ) ) ( not ( = ?auto_184716 ?auto_184722 ) ) ( not ( = ?auto_184717 ?auto_184718 ) ) ( not ( = ?auto_184717 ?auto_184719 ) ) ( not ( = ?auto_184717 ?auto_184720 ) ) ( not ( = ?auto_184717 ?auto_184722 ) ) ( not ( = ?auto_184718 ?auto_184719 ) ) ( not ( = ?auto_184718 ?auto_184720 ) ) ( not ( = ?auto_184718 ?auto_184722 ) ) ( not ( = ?auto_184719 ?auto_184720 ) ) ( not ( = ?auto_184719 ?auto_184722 ) ) ( not ( = ?auto_184720 ?auto_184722 ) ) ( ON ?auto_184722 ?auto_184721 ) ( not ( = ?auto_184714 ?auto_184721 ) ) ( not ( = ?auto_184715 ?auto_184721 ) ) ( not ( = ?auto_184716 ?auto_184721 ) ) ( not ( = ?auto_184717 ?auto_184721 ) ) ( not ( = ?auto_184718 ?auto_184721 ) ) ( not ( = ?auto_184719 ?auto_184721 ) ) ( not ( = ?auto_184720 ?auto_184721 ) ) ( not ( = ?auto_184722 ?auto_184721 ) ) ( CLEAR ?auto_184719 ) ( ON ?auto_184720 ?auto_184722 ) ( CLEAR ?auto_184720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184721 ?auto_184722 )
      ( MAKE-7PILE ?auto_184714 ?auto_184715 ?auto_184716 ?auto_184717 ?auto_184718 ?auto_184719 ?auto_184720 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184723 - BLOCK
      ?auto_184724 - BLOCK
      ?auto_184725 - BLOCK
      ?auto_184726 - BLOCK
      ?auto_184727 - BLOCK
      ?auto_184728 - BLOCK
      ?auto_184729 - BLOCK
    )
    :vars
    (
      ?auto_184731 - BLOCK
      ?auto_184730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184723 ) ( ON ?auto_184724 ?auto_184723 ) ( ON ?auto_184725 ?auto_184724 ) ( ON ?auto_184726 ?auto_184725 ) ( ON ?auto_184727 ?auto_184726 ) ( not ( = ?auto_184723 ?auto_184724 ) ) ( not ( = ?auto_184723 ?auto_184725 ) ) ( not ( = ?auto_184723 ?auto_184726 ) ) ( not ( = ?auto_184723 ?auto_184727 ) ) ( not ( = ?auto_184723 ?auto_184728 ) ) ( not ( = ?auto_184723 ?auto_184729 ) ) ( not ( = ?auto_184723 ?auto_184731 ) ) ( not ( = ?auto_184724 ?auto_184725 ) ) ( not ( = ?auto_184724 ?auto_184726 ) ) ( not ( = ?auto_184724 ?auto_184727 ) ) ( not ( = ?auto_184724 ?auto_184728 ) ) ( not ( = ?auto_184724 ?auto_184729 ) ) ( not ( = ?auto_184724 ?auto_184731 ) ) ( not ( = ?auto_184725 ?auto_184726 ) ) ( not ( = ?auto_184725 ?auto_184727 ) ) ( not ( = ?auto_184725 ?auto_184728 ) ) ( not ( = ?auto_184725 ?auto_184729 ) ) ( not ( = ?auto_184725 ?auto_184731 ) ) ( not ( = ?auto_184726 ?auto_184727 ) ) ( not ( = ?auto_184726 ?auto_184728 ) ) ( not ( = ?auto_184726 ?auto_184729 ) ) ( not ( = ?auto_184726 ?auto_184731 ) ) ( not ( = ?auto_184727 ?auto_184728 ) ) ( not ( = ?auto_184727 ?auto_184729 ) ) ( not ( = ?auto_184727 ?auto_184731 ) ) ( not ( = ?auto_184728 ?auto_184729 ) ) ( not ( = ?auto_184728 ?auto_184731 ) ) ( not ( = ?auto_184729 ?auto_184731 ) ) ( ON ?auto_184731 ?auto_184730 ) ( not ( = ?auto_184723 ?auto_184730 ) ) ( not ( = ?auto_184724 ?auto_184730 ) ) ( not ( = ?auto_184725 ?auto_184730 ) ) ( not ( = ?auto_184726 ?auto_184730 ) ) ( not ( = ?auto_184727 ?auto_184730 ) ) ( not ( = ?auto_184728 ?auto_184730 ) ) ( not ( = ?auto_184729 ?auto_184730 ) ) ( not ( = ?auto_184731 ?auto_184730 ) ) ( ON ?auto_184729 ?auto_184731 ) ( CLEAR ?auto_184729 ) ( ON-TABLE ?auto_184730 ) ( HOLDING ?auto_184728 ) ( CLEAR ?auto_184727 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184723 ?auto_184724 ?auto_184725 ?auto_184726 ?auto_184727 ?auto_184728 )
      ( MAKE-7PILE ?auto_184723 ?auto_184724 ?auto_184725 ?auto_184726 ?auto_184727 ?auto_184728 ?auto_184729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184732 - BLOCK
      ?auto_184733 - BLOCK
      ?auto_184734 - BLOCK
      ?auto_184735 - BLOCK
      ?auto_184736 - BLOCK
      ?auto_184737 - BLOCK
      ?auto_184738 - BLOCK
    )
    :vars
    (
      ?auto_184739 - BLOCK
      ?auto_184740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184732 ) ( ON ?auto_184733 ?auto_184732 ) ( ON ?auto_184734 ?auto_184733 ) ( ON ?auto_184735 ?auto_184734 ) ( ON ?auto_184736 ?auto_184735 ) ( not ( = ?auto_184732 ?auto_184733 ) ) ( not ( = ?auto_184732 ?auto_184734 ) ) ( not ( = ?auto_184732 ?auto_184735 ) ) ( not ( = ?auto_184732 ?auto_184736 ) ) ( not ( = ?auto_184732 ?auto_184737 ) ) ( not ( = ?auto_184732 ?auto_184738 ) ) ( not ( = ?auto_184732 ?auto_184739 ) ) ( not ( = ?auto_184733 ?auto_184734 ) ) ( not ( = ?auto_184733 ?auto_184735 ) ) ( not ( = ?auto_184733 ?auto_184736 ) ) ( not ( = ?auto_184733 ?auto_184737 ) ) ( not ( = ?auto_184733 ?auto_184738 ) ) ( not ( = ?auto_184733 ?auto_184739 ) ) ( not ( = ?auto_184734 ?auto_184735 ) ) ( not ( = ?auto_184734 ?auto_184736 ) ) ( not ( = ?auto_184734 ?auto_184737 ) ) ( not ( = ?auto_184734 ?auto_184738 ) ) ( not ( = ?auto_184734 ?auto_184739 ) ) ( not ( = ?auto_184735 ?auto_184736 ) ) ( not ( = ?auto_184735 ?auto_184737 ) ) ( not ( = ?auto_184735 ?auto_184738 ) ) ( not ( = ?auto_184735 ?auto_184739 ) ) ( not ( = ?auto_184736 ?auto_184737 ) ) ( not ( = ?auto_184736 ?auto_184738 ) ) ( not ( = ?auto_184736 ?auto_184739 ) ) ( not ( = ?auto_184737 ?auto_184738 ) ) ( not ( = ?auto_184737 ?auto_184739 ) ) ( not ( = ?auto_184738 ?auto_184739 ) ) ( ON ?auto_184739 ?auto_184740 ) ( not ( = ?auto_184732 ?auto_184740 ) ) ( not ( = ?auto_184733 ?auto_184740 ) ) ( not ( = ?auto_184734 ?auto_184740 ) ) ( not ( = ?auto_184735 ?auto_184740 ) ) ( not ( = ?auto_184736 ?auto_184740 ) ) ( not ( = ?auto_184737 ?auto_184740 ) ) ( not ( = ?auto_184738 ?auto_184740 ) ) ( not ( = ?auto_184739 ?auto_184740 ) ) ( ON ?auto_184738 ?auto_184739 ) ( ON-TABLE ?auto_184740 ) ( CLEAR ?auto_184736 ) ( ON ?auto_184737 ?auto_184738 ) ( CLEAR ?auto_184737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184740 ?auto_184739 ?auto_184738 )
      ( MAKE-7PILE ?auto_184732 ?auto_184733 ?auto_184734 ?auto_184735 ?auto_184736 ?auto_184737 ?auto_184738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184741 - BLOCK
      ?auto_184742 - BLOCK
      ?auto_184743 - BLOCK
      ?auto_184744 - BLOCK
      ?auto_184745 - BLOCK
      ?auto_184746 - BLOCK
      ?auto_184747 - BLOCK
    )
    :vars
    (
      ?auto_184748 - BLOCK
      ?auto_184749 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184741 ) ( ON ?auto_184742 ?auto_184741 ) ( ON ?auto_184743 ?auto_184742 ) ( ON ?auto_184744 ?auto_184743 ) ( not ( = ?auto_184741 ?auto_184742 ) ) ( not ( = ?auto_184741 ?auto_184743 ) ) ( not ( = ?auto_184741 ?auto_184744 ) ) ( not ( = ?auto_184741 ?auto_184745 ) ) ( not ( = ?auto_184741 ?auto_184746 ) ) ( not ( = ?auto_184741 ?auto_184747 ) ) ( not ( = ?auto_184741 ?auto_184748 ) ) ( not ( = ?auto_184742 ?auto_184743 ) ) ( not ( = ?auto_184742 ?auto_184744 ) ) ( not ( = ?auto_184742 ?auto_184745 ) ) ( not ( = ?auto_184742 ?auto_184746 ) ) ( not ( = ?auto_184742 ?auto_184747 ) ) ( not ( = ?auto_184742 ?auto_184748 ) ) ( not ( = ?auto_184743 ?auto_184744 ) ) ( not ( = ?auto_184743 ?auto_184745 ) ) ( not ( = ?auto_184743 ?auto_184746 ) ) ( not ( = ?auto_184743 ?auto_184747 ) ) ( not ( = ?auto_184743 ?auto_184748 ) ) ( not ( = ?auto_184744 ?auto_184745 ) ) ( not ( = ?auto_184744 ?auto_184746 ) ) ( not ( = ?auto_184744 ?auto_184747 ) ) ( not ( = ?auto_184744 ?auto_184748 ) ) ( not ( = ?auto_184745 ?auto_184746 ) ) ( not ( = ?auto_184745 ?auto_184747 ) ) ( not ( = ?auto_184745 ?auto_184748 ) ) ( not ( = ?auto_184746 ?auto_184747 ) ) ( not ( = ?auto_184746 ?auto_184748 ) ) ( not ( = ?auto_184747 ?auto_184748 ) ) ( ON ?auto_184748 ?auto_184749 ) ( not ( = ?auto_184741 ?auto_184749 ) ) ( not ( = ?auto_184742 ?auto_184749 ) ) ( not ( = ?auto_184743 ?auto_184749 ) ) ( not ( = ?auto_184744 ?auto_184749 ) ) ( not ( = ?auto_184745 ?auto_184749 ) ) ( not ( = ?auto_184746 ?auto_184749 ) ) ( not ( = ?auto_184747 ?auto_184749 ) ) ( not ( = ?auto_184748 ?auto_184749 ) ) ( ON ?auto_184747 ?auto_184748 ) ( ON-TABLE ?auto_184749 ) ( ON ?auto_184746 ?auto_184747 ) ( CLEAR ?auto_184746 ) ( HOLDING ?auto_184745 ) ( CLEAR ?auto_184744 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184741 ?auto_184742 ?auto_184743 ?auto_184744 ?auto_184745 )
      ( MAKE-7PILE ?auto_184741 ?auto_184742 ?auto_184743 ?auto_184744 ?auto_184745 ?auto_184746 ?auto_184747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184750 - BLOCK
      ?auto_184751 - BLOCK
      ?auto_184752 - BLOCK
      ?auto_184753 - BLOCK
      ?auto_184754 - BLOCK
      ?auto_184755 - BLOCK
      ?auto_184756 - BLOCK
    )
    :vars
    (
      ?auto_184758 - BLOCK
      ?auto_184757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184750 ) ( ON ?auto_184751 ?auto_184750 ) ( ON ?auto_184752 ?auto_184751 ) ( ON ?auto_184753 ?auto_184752 ) ( not ( = ?auto_184750 ?auto_184751 ) ) ( not ( = ?auto_184750 ?auto_184752 ) ) ( not ( = ?auto_184750 ?auto_184753 ) ) ( not ( = ?auto_184750 ?auto_184754 ) ) ( not ( = ?auto_184750 ?auto_184755 ) ) ( not ( = ?auto_184750 ?auto_184756 ) ) ( not ( = ?auto_184750 ?auto_184758 ) ) ( not ( = ?auto_184751 ?auto_184752 ) ) ( not ( = ?auto_184751 ?auto_184753 ) ) ( not ( = ?auto_184751 ?auto_184754 ) ) ( not ( = ?auto_184751 ?auto_184755 ) ) ( not ( = ?auto_184751 ?auto_184756 ) ) ( not ( = ?auto_184751 ?auto_184758 ) ) ( not ( = ?auto_184752 ?auto_184753 ) ) ( not ( = ?auto_184752 ?auto_184754 ) ) ( not ( = ?auto_184752 ?auto_184755 ) ) ( not ( = ?auto_184752 ?auto_184756 ) ) ( not ( = ?auto_184752 ?auto_184758 ) ) ( not ( = ?auto_184753 ?auto_184754 ) ) ( not ( = ?auto_184753 ?auto_184755 ) ) ( not ( = ?auto_184753 ?auto_184756 ) ) ( not ( = ?auto_184753 ?auto_184758 ) ) ( not ( = ?auto_184754 ?auto_184755 ) ) ( not ( = ?auto_184754 ?auto_184756 ) ) ( not ( = ?auto_184754 ?auto_184758 ) ) ( not ( = ?auto_184755 ?auto_184756 ) ) ( not ( = ?auto_184755 ?auto_184758 ) ) ( not ( = ?auto_184756 ?auto_184758 ) ) ( ON ?auto_184758 ?auto_184757 ) ( not ( = ?auto_184750 ?auto_184757 ) ) ( not ( = ?auto_184751 ?auto_184757 ) ) ( not ( = ?auto_184752 ?auto_184757 ) ) ( not ( = ?auto_184753 ?auto_184757 ) ) ( not ( = ?auto_184754 ?auto_184757 ) ) ( not ( = ?auto_184755 ?auto_184757 ) ) ( not ( = ?auto_184756 ?auto_184757 ) ) ( not ( = ?auto_184758 ?auto_184757 ) ) ( ON ?auto_184756 ?auto_184758 ) ( ON-TABLE ?auto_184757 ) ( ON ?auto_184755 ?auto_184756 ) ( CLEAR ?auto_184753 ) ( ON ?auto_184754 ?auto_184755 ) ( CLEAR ?auto_184754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184757 ?auto_184758 ?auto_184756 ?auto_184755 )
      ( MAKE-7PILE ?auto_184750 ?auto_184751 ?auto_184752 ?auto_184753 ?auto_184754 ?auto_184755 ?auto_184756 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184759 - BLOCK
      ?auto_184760 - BLOCK
      ?auto_184761 - BLOCK
      ?auto_184762 - BLOCK
      ?auto_184763 - BLOCK
      ?auto_184764 - BLOCK
      ?auto_184765 - BLOCK
    )
    :vars
    (
      ?auto_184766 - BLOCK
      ?auto_184767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184759 ) ( ON ?auto_184760 ?auto_184759 ) ( ON ?auto_184761 ?auto_184760 ) ( not ( = ?auto_184759 ?auto_184760 ) ) ( not ( = ?auto_184759 ?auto_184761 ) ) ( not ( = ?auto_184759 ?auto_184762 ) ) ( not ( = ?auto_184759 ?auto_184763 ) ) ( not ( = ?auto_184759 ?auto_184764 ) ) ( not ( = ?auto_184759 ?auto_184765 ) ) ( not ( = ?auto_184759 ?auto_184766 ) ) ( not ( = ?auto_184760 ?auto_184761 ) ) ( not ( = ?auto_184760 ?auto_184762 ) ) ( not ( = ?auto_184760 ?auto_184763 ) ) ( not ( = ?auto_184760 ?auto_184764 ) ) ( not ( = ?auto_184760 ?auto_184765 ) ) ( not ( = ?auto_184760 ?auto_184766 ) ) ( not ( = ?auto_184761 ?auto_184762 ) ) ( not ( = ?auto_184761 ?auto_184763 ) ) ( not ( = ?auto_184761 ?auto_184764 ) ) ( not ( = ?auto_184761 ?auto_184765 ) ) ( not ( = ?auto_184761 ?auto_184766 ) ) ( not ( = ?auto_184762 ?auto_184763 ) ) ( not ( = ?auto_184762 ?auto_184764 ) ) ( not ( = ?auto_184762 ?auto_184765 ) ) ( not ( = ?auto_184762 ?auto_184766 ) ) ( not ( = ?auto_184763 ?auto_184764 ) ) ( not ( = ?auto_184763 ?auto_184765 ) ) ( not ( = ?auto_184763 ?auto_184766 ) ) ( not ( = ?auto_184764 ?auto_184765 ) ) ( not ( = ?auto_184764 ?auto_184766 ) ) ( not ( = ?auto_184765 ?auto_184766 ) ) ( ON ?auto_184766 ?auto_184767 ) ( not ( = ?auto_184759 ?auto_184767 ) ) ( not ( = ?auto_184760 ?auto_184767 ) ) ( not ( = ?auto_184761 ?auto_184767 ) ) ( not ( = ?auto_184762 ?auto_184767 ) ) ( not ( = ?auto_184763 ?auto_184767 ) ) ( not ( = ?auto_184764 ?auto_184767 ) ) ( not ( = ?auto_184765 ?auto_184767 ) ) ( not ( = ?auto_184766 ?auto_184767 ) ) ( ON ?auto_184765 ?auto_184766 ) ( ON-TABLE ?auto_184767 ) ( ON ?auto_184764 ?auto_184765 ) ( ON ?auto_184763 ?auto_184764 ) ( CLEAR ?auto_184763 ) ( HOLDING ?auto_184762 ) ( CLEAR ?auto_184761 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184759 ?auto_184760 ?auto_184761 ?auto_184762 )
      ( MAKE-7PILE ?auto_184759 ?auto_184760 ?auto_184761 ?auto_184762 ?auto_184763 ?auto_184764 ?auto_184765 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184768 - BLOCK
      ?auto_184769 - BLOCK
      ?auto_184770 - BLOCK
      ?auto_184771 - BLOCK
      ?auto_184772 - BLOCK
      ?auto_184773 - BLOCK
      ?auto_184774 - BLOCK
    )
    :vars
    (
      ?auto_184775 - BLOCK
      ?auto_184776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184768 ) ( ON ?auto_184769 ?auto_184768 ) ( ON ?auto_184770 ?auto_184769 ) ( not ( = ?auto_184768 ?auto_184769 ) ) ( not ( = ?auto_184768 ?auto_184770 ) ) ( not ( = ?auto_184768 ?auto_184771 ) ) ( not ( = ?auto_184768 ?auto_184772 ) ) ( not ( = ?auto_184768 ?auto_184773 ) ) ( not ( = ?auto_184768 ?auto_184774 ) ) ( not ( = ?auto_184768 ?auto_184775 ) ) ( not ( = ?auto_184769 ?auto_184770 ) ) ( not ( = ?auto_184769 ?auto_184771 ) ) ( not ( = ?auto_184769 ?auto_184772 ) ) ( not ( = ?auto_184769 ?auto_184773 ) ) ( not ( = ?auto_184769 ?auto_184774 ) ) ( not ( = ?auto_184769 ?auto_184775 ) ) ( not ( = ?auto_184770 ?auto_184771 ) ) ( not ( = ?auto_184770 ?auto_184772 ) ) ( not ( = ?auto_184770 ?auto_184773 ) ) ( not ( = ?auto_184770 ?auto_184774 ) ) ( not ( = ?auto_184770 ?auto_184775 ) ) ( not ( = ?auto_184771 ?auto_184772 ) ) ( not ( = ?auto_184771 ?auto_184773 ) ) ( not ( = ?auto_184771 ?auto_184774 ) ) ( not ( = ?auto_184771 ?auto_184775 ) ) ( not ( = ?auto_184772 ?auto_184773 ) ) ( not ( = ?auto_184772 ?auto_184774 ) ) ( not ( = ?auto_184772 ?auto_184775 ) ) ( not ( = ?auto_184773 ?auto_184774 ) ) ( not ( = ?auto_184773 ?auto_184775 ) ) ( not ( = ?auto_184774 ?auto_184775 ) ) ( ON ?auto_184775 ?auto_184776 ) ( not ( = ?auto_184768 ?auto_184776 ) ) ( not ( = ?auto_184769 ?auto_184776 ) ) ( not ( = ?auto_184770 ?auto_184776 ) ) ( not ( = ?auto_184771 ?auto_184776 ) ) ( not ( = ?auto_184772 ?auto_184776 ) ) ( not ( = ?auto_184773 ?auto_184776 ) ) ( not ( = ?auto_184774 ?auto_184776 ) ) ( not ( = ?auto_184775 ?auto_184776 ) ) ( ON ?auto_184774 ?auto_184775 ) ( ON-TABLE ?auto_184776 ) ( ON ?auto_184773 ?auto_184774 ) ( ON ?auto_184772 ?auto_184773 ) ( CLEAR ?auto_184770 ) ( ON ?auto_184771 ?auto_184772 ) ( CLEAR ?auto_184771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184776 ?auto_184775 ?auto_184774 ?auto_184773 ?auto_184772 )
      ( MAKE-7PILE ?auto_184768 ?auto_184769 ?auto_184770 ?auto_184771 ?auto_184772 ?auto_184773 ?auto_184774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184777 - BLOCK
      ?auto_184778 - BLOCK
      ?auto_184779 - BLOCK
      ?auto_184780 - BLOCK
      ?auto_184781 - BLOCK
      ?auto_184782 - BLOCK
      ?auto_184783 - BLOCK
    )
    :vars
    (
      ?auto_184784 - BLOCK
      ?auto_184785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184777 ) ( ON ?auto_184778 ?auto_184777 ) ( not ( = ?auto_184777 ?auto_184778 ) ) ( not ( = ?auto_184777 ?auto_184779 ) ) ( not ( = ?auto_184777 ?auto_184780 ) ) ( not ( = ?auto_184777 ?auto_184781 ) ) ( not ( = ?auto_184777 ?auto_184782 ) ) ( not ( = ?auto_184777 ?auto_184783 ) ) ( not ( = ?auto_184777 ?auto_184784 ) ) ( not ( = ?auto_184778 ?auto_184779 ) ) ( not ( = ?auto_184778 ?auto_184780 ) ) ( not ( = ?auto_184778 ?auto_184781 ) ) ( not ( = ?auto_184778 ?auto_184782 ) ) ( not ( = ?auto_184778 ?auto_184783 ) ) ( not ( = ?auto_184778 ?auto_184784 ) ) ( not ( = ?auto_184779 ?auto_184780 ) ) ( not ( = ?auto_184779 ?auto_184781 ) ) ( not ( = ?auto_184779 ?auto_184782 ) ) ( not ( = ?auto_184779 ?auto_184783 ) ) ( not ( = ?auto_184779 ?auto_184784 ) ) ( not ( = ?auto_184780 ?auto_184781 ) ) ( not ( = ?auto_184780 ?auto_184782 ) ) ( not ( = ?auto_184780 ?auto_184783 ) ) ( not ( = ?auto_184780 ?auto_184784 ) ) ( not ( = ?auto_184781 ?auto_184782 ) ) ( not ( = ?auto_184781 ?auto_184783 ) ) ( not ( = ?auto_184781 ?auto_184784 ) ) ( not ( = ?auto_184782 ?auto_184783 ) ) ( not ( = ?auto_184782 ?auto_184784 ) ) ( not ( = ?auto_184783 ?auto_184784 ) ) ( ON ?auto_184784 ?auto_184785 ) ( not ( = ?auto_184777 ?auto_184785 ) ) ( not ( = ?auto_184778 ?auto_184785 ) ) ( not ( = ?auto_184779 ?auto_184785 ) ) ( not ( = ?auto_184780 ?auto_184785 ) ) ( not ( = ?auto_184781 ?auto_184785 ) ) ( not ( = ?auto_184782 ?auto_184785 ) ) ( not ( = ?auto_184783 ?auto_184785 ) ) ( not ( = ?auto_184784 ?auto_184785 ) ) ( ON ?auto_184783 ?auto_184784 ) ( ON-TABLE ?auto_184785 ) ( ON ?auto_184782 ?auto_184783 ) ( ON ?auto_184781 ?auto_184782 ) ( ON ?auto_184780 ?auto_184781 ) ( CLEAR ?auto_184780 ) ( HOLDING ?auto_184779 ) ( CLEAR ?auto_184778 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184777 ?auto_184778 ?auto_184779 )
      ( MAKE-7PILE ?auto_184777 ?auto_184778 ?auto_184779 ?auto_184780 ?auto_184781 ?auto_184782 ?auto_184783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184786 - BLOCK
      ?auto_184787 - BLOCK
      ?auto_184788 - BLOCK
      ?auto_184789 - BLOCK
      ?auto_184790 - BLOCK
      ?auto_184791 - BLOCK
      ?auto_184792 - BLOCK
    )
    :vars
    (
      ?auto_184793 - BLOCK
      ?auto_184794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184786 ) ( ON ?auto_184787 ?auto_184786 ) ( not ( = ?auto_184786 ?auto_184787 ) ) ( not ( = ?auto_184786 ?auto_184788 ) ) ( not ( = ?auto_184786 ?auto_184789 ) ) ( not ( = ?auto_184786 ?auto_184790 ) ) ( not ( = ?auto_184786 ?auto_184791 ) ) ( not ( = ?auto_184786 ?auto_184792 ) ) ( not ( = ?auto_184786 ?auto_184793 ) ) ( not ( = ?auto_184787 ?auto_184788 ) ) ( not ( = ?auto_184787 ?auto_184789 ) ) ( not ( = ?auto_184787 ?auto_184790 ) ) ( not ( = ?auto_184787 ?auto_184791 ) ) ( not ( = ?auto_184787 ?auto_184792 ) ) ( not ( = ?auto_184787 ?auto_184793 ) ) ( not ( = ?auto_184788 ?auto_184789 ) ) ( not ( = ?auto_184788 ?auto_184790 ) ) ( not ( = ?auto_184788 ?auto_184791 ) ) ( not ( = ?auto_184788 ?auto_184792 ) ) ( not ( = ?auto_184788 ?auto_184793 ) ) ( not ( = ?auto_184789 ?auto_184790 ) ) ( not ( = ?auto_184789 ?auto_184791 ) ) ( not ( = ?auto_184789 ?auto_184792 ) ) ( not ( = ?auto_184789 ?auto_184793 ) ) ( not ( = ?auto_184790 ?auto_184791 ) ) ( not ( = ?auto_184790 ?auto_184792 ) ) ( not ( = ?auto_184790 ?auto_184793 ) ) ( not ( = ?auto_184791 ?auto_184792 ) ) ( not ( = ?auto_184791 ?auto_184793 ) ) ( not ( = ?auto_184792 ?auto_184793 ) ) ( ON ?auto_184793 ?auto_184794 ) ( not ( = ?auto_184786 ?auto_184794 ) ) ( not ( = ?auto_184787 ?auto_184794 ) ) ( not ( = ?auto_184788 ?auto_184794 ) ) ( not ( = ?auto_184789 ?auto_184794 ) ) ( not ( = ?auto_184790 ?auto_184794 ) ) ( not ( = ?auto_184791 ?auto_184794 ) ) ( not ( = ?auto_184792 ?auto_184794 ) ) ( not ( = ?auto_184793 ?auto_184794 ) ) ( ON ?auto_184792 ?auto_184793 ) ( ON-TABLE ?auto_184794 ) ( ON ?auto_184791 ?auto_184792 ) ( ON ?auto_184790 ?auto_184791 ) ( ON ?auto_184789 ?auto_184790 ) ( CLEAR ?auto_184787 ) ( ON ?auto_184788 ?auto_184789 ) ( CLEAR ?auto_184788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184794 ?auto_184793 ?auto_184792 ?auto_184791 ?auto_184790 ?auto_184789 )
      ( MAKE-7PILE ?auto_184786 ?auto_184787 ?auto_184788 ?auto_184789 ?auto_184790 ?auto_184791 ?auto_184792 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184795 - BLOCK
      ?auto_184796 - BLOCK
      ?auto_184797 - BLOCK
      ?auto_184798 - BLOCK
      ?auto_184799 - BLOCK
      ?auto_184800 - BLOCK
      ?auto_184801 - BLOCK
    )
    :vars
    (
      ?auto_184802 - BLOCK
      ?auto_184803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184795 ) ( not ( = ?auto_184795 ?auto_184796 ) ) ( not ( = ?auto_184795 ?auto_184797 ) ) ( not ( = ?auto_184795 ?auto_184798 ) ) ( not ( = ?auto_184795 ?auto_184799 ) ) ( not ( = ?auto_184795 ?auto_184800 ) ) ( not ( = ?auto_184795 ?auto_184801 ) ) ( not ( = ?auto_184795 ?auto_184802 ) ) ( not ( = ?auto_184796 ?auto_184797 ) ) ( not ( = ?auto_184796 ?auto_184798 ) ) ( not ( = ?auto_184796 ?auto_184799 ) ) ( not ( = ?auto_184796 ?auto_184800 ) ) ( not ( = ?auto_184796 ?auto_184801 ) ) ( not ( = ?auto_184796 ?auto_184802 ) ) ( not ( = ?auto_184797 ?auto_184798 ) ) ( not ( = ?auto_184797 ?auto_184799 ) ) ( not ( = ?auto_184797 ?auto_184800 ) ) ( not ( = ?auto_184797 ?auto_184801 ) ) ( not ( = ?auto_184797 ?auto_184802 ) ) ( not ( = ?auto_184798 ?auto_184799 ) ) ( not ( = ?auto_184798 ?auto_184800 ) ) ( not ( = ?auto_184798 ?auto_184801 ) ) ( not ( = ?auto_184798 ?auto_184802 ) ) ( not ( = ?auto_184799 ?auto_184800 ) ) ( not ( = ?auto_184799 ?auto_184801 ) ) ( not ( = ?auto_184799 ?auto_184802 ) ) ( not ( = ?auto_184800 ?auto_184801 ) ) ( not ( = ?auto_184800 ?auto_184802 ) ) ( not ( = ?auto_184801 ?auto_184802 ) ) ( ON ?auto_184802 ?auto_184803 ) ( not ( = ?auto_184795 ?auto_184803 ) ) ( not ( = ?auto_184796 ?auto_184803 ) ) ( not ( = ?auto_184797 ?auto_184803 ) ) ( not ( = ?auto_184798 ?auto_184803 ) ) ( not ( = ?auto_184799 ?auto_184803 ) ) ( not ( = ?auto_184800 ?auto_184803 ) ) ( not ( = ?auto_184801 ?auto_184803 ) ) ( not ( = ?auto_184802 ?auto_184803 ) ) ( ON ?auto_184801 ?auto_184802 ) ( ON-TABLE ?auto_184803 ) ( ON ?auto_184800 ?auto_184801 ) ( ON ?auto_184799 ?auto_184800 ) ( ON ?auto_184798 ?auto_184799 ) ( ON ?auto_184797 ?auto_184798 ) ( CLEAR ?auto_184797 ) ( HOLDING ?auto_184796 ) ( CLEAR ?auto_184795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184795 ?auto_184796 )
      ( MAKE-7PILE ?auto_184795 ?auto_184796 ?auto_184797 ?auto_184798 ?auto_184799 ?auto_184800 ?auto_184801 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184804 - BLOCK
      ?auto_184805 - BLOCK
      ?auto_184806 - BLOCK
      ?auto_184807 - BLOCK
      ?auto_184808 - BLOCK
      ?auto_184809 - BLOCK
      ?auto_184810 - BLOCK
    )
    :vars
    (
      ?auto_184812 - BLOCK
      ?auto_184811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184804 ) ( not ( = ?auto_184804 ?auto_184805 ) ) ( not ( = ?auto_184804 ?auto_184806 ) ) ( not ( = ?auto_184804 ?auto_184807 ) ) ( not ( = ?auto_184804 ?auto_184808 ) ) ( not ( = ?auto_184804 ?auto_184809 ) ) ( not ( = ?auto_184804 ?auto_184810 ) ) ( not ( = ?auto_184804 ?auto_184812 ) ) ( not ( = ?auto_184805 ?auto_184806 ) ) ( not ( = ?auto_184805 ?auto_184807 ) ) ( not ( = ?auto_184805 ?auto_184808 ) ) ( not ( = ?auto_184805 ?auto_184809 ) ) ( not ( = ?auto_184805 ?auto_184810 ) ) ( not ( = ?auto_184805 ?auto_184812 ) ) ( not ( = ?auto_184806 ?auto_184807 ) ) ( not ( = ?auto_184806 ?auto_184808 ) ) ( not ( = ?auto_184806 ?auto_184809 ) ) ( not ( = ?auto_184806 ?auto_184810 ) ) ( not ( = ?auto_184806 ?auto_184812 ) ) ( not ( = ?auto_184807 ?auto_184808 ) ) ( not ( = ?auto_184807 ?auto_184809 ) ) ( not ( = ?auto_184807 ?auto_184810 ) ) ( not ( = ?auto_184807 ?auto_184812 ) ) ( not ( = ?auto_184808 ?auto_184809 ) ) ( not ( = ?auto_184808 ?auto_184810 ) ) ( not ( = ?auto_184808 ?auto_184812 ) ) ( not ( = ?auto_184809 ?auto_184810 ) ) ( not ( = ?auto_184809 ?auto_184812 ) ) ( not ( = ?auto_184810 ?auto_184812 ) ) ( ON ?auto_184812 ?auto_184811 ) ( not ( = ?auto_184804 ?auto_184811 ) ) ( not ( = ?auto_184805 ?auto_184811 ) ) ( not ( = ?auto_184806 ?auto_184811 ) ) ( not ( = ?auto_184807 ?auto_184811 ) ) ( not ( = ?auto_184808 ?auto_184811 ) ) ( not ( = ?auto_184809 ?auto_184811 ) ) ( not ( = ?auto_184810 ?auto_184811 ) ) ( not ( = ?auto_184812 ?auto_184811 ) ) ( ON ?auto_184810 ?auto_184812 ) ( ON-TABLE ?auto_184811 ) ( ON ?auto_184809 ?auto_184810 ) ( ON ?auto_184808 ?auto_184809 ) ( ON ?auto_184807 ?auto_184808 ) ( ON ?auto_184806 ?auto_184807 ) ( CLEAR ?auto_184804 ) ( ON ?auto_184805 ?auto_184806 ) ( CLEAR ?auto_184805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184811 ?auto_184812 ?auto_184810 ?auto_184809 ?auto_184808 ?auto_184807 ?auto_184806 )
      ( MAKE-7PILE ?auto_184804 ?auto_184805 ?auto_184806 ?auto_184807 ?auto_184808 ?auto_184809 ?auto_184810 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184813 - BLOCK
      ?auto_184814 - BLOCK
      ?auto_184815 - BLOCK
      ?auto_184816 - BLOCK
      ?auto_184817 - BLOCK
      ?auto_184818 - BLOCK
      ?auto_184819 - BLOCK
    )
    :vars
    (
      ?auto_184820 - BLOCK
      ?auto_184821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184813 ?auto_184814 ) ) ( not ( = ?auto_184813 ?auto_184815 ) ) ( not ( = ?auto_184813 ?auto_184816 ) ) ( not ( = ?auto_184813 ?auto_184817 ) ) ( not ( = ?auto_184813 ?auto_184818 ) ) ( not ( = ?auto_184813 ?auto_184819 ) ) ( not ( = ?auto_184813 ?auto_184820 ) ) ( not ( = ?auto_184814 ?auto_184815 ) ) ( not ( = ?auto_184814 ?auto_184816 ) ) ( not ( = ?auto_184814 ?auto_184817 ) ) ( not ( = ?auto_184814 ?auto_184818 ) ) ( not ( = ?auto_184814 ?auto_184819 ) ) ( not ( = ?auto_184814 ?auto_184820 ) ) ( not ( = ?auto_184815 ?auto_184816 ) ) ( not ( = ?auto_184815 ?auto_184817 ) ) ( not ( = ?auto_184815 ?auto_184818 ) ) ( not ( = ?auto_184815 ?auto_184819 ) ) ( not ( = ?auto_184815 ?auto_184820 ) ) ( not ( = ?auto_184816 ?auto_184817 ) ) ( not ( = ?auto_184816 ?auto_184818 ) ) ( not ( = ?auto_184816 ?auto_184819 ) ) ( not ( = ?auto_184816 ?auto_184820 ) ) ( not ( = ?auto_184817 ?auto_184818 ) ) ( not ( = ?auto_184817 ?auto_184819 ) ) ( not ( = ?auto_184817 ?auto_184820 ) ) ( not ( = ?auto_184818 ?auto_184819 ) ) ( not ( = ?auto_184818 ?auto_184820 ) ) ( not ( = ?auto_184819 ?auto_184820 ) ) ( ON ?auto_184820 ?auto_184821 ) ( not ( = ?auto_184813 ?auto_184821 ) ) ( not ( = ?auto_184814 ?auto_184821 ) ) ( not ( = ?auto_184815 ?auto_184821 ) ) ( not ( = ?auto_184816 ?auto_184821 ) ) ( not ( = ?auto_184817 ?auto_184821 ) ) ( not ( = ?auto_184818 ?auto_184821 ) ) ( not ( = ?auto_184819 ?auto_184821 ) ) ( not ( = ?auto_184820 ?auto_184821 ) ) ( ON ?auto_184819 ?auto_184820 ) ( ON-TABLE ?auto_184821 ) ( ON ?auto_184818 ?auto_184819 ) ( ON ?auto_184817 ?auto_184818 ) ( ON ?auto_184816 ?auto_184817 ) ( ON ?auto_184815 ?auto_184816 ) ( ON ?auto_184814 ?auto_184815 ) ( CLEAR ?auto_184814 ) ( HOLDING ?auto_184813 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184813 )
      ( MAKE-7PILE ?auto_184813 ?auto_184814 ?auto_184815 ?auto_184816 ?auto_184817 ?auto_184818 ?auto_184819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184822 - BLOCK
      ?auto_184823 - BLOCK
      ?auto_184824 - BLOCK
      ?auto_184825 - BLOCK
      ?auto_184826 - BLOCK
      ?auto_184827 - BLOCK
      ?auto_184828 - BLOCK
    )
    :vars
    (
      ?auto_184830 - BLOCK
      ?auto_184829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184822 ?auto_184823 ) ) ( not ( = ?auto_184822 ?auto_184824 ) ) ( not ( = ?auto_184822 ?auto_184825 ) ) ( not ( = ?auto_184822 ?auto_184826 ) ) ( not ( = ?auto_184822 ?auto_184827 ) ) ( not ( = ?auto_184822 ?auto_184828 ) ) ( not ( = ?auto_184822 ?auto_184830 ) ) ( not ( = ?auto_184823 ?auto_184824 ) ) ( not ( = ?auto_184823 ?auto_184825 ) ) ( not ( = ?auto_184823 ?auto_184826 ) ) ( not ( = ?auto_184823 ?auto_184827 ) ) ( not ( = ?auto_184823 ?auto_184828 ) ) ( not ( = ?auto_184823 ?auto_184830 ) ) ( not ( = ?auto_184824 ?auto_184825 ) ) ( not ( = ?auto_184824 ?auto_184826 ) ) ( not ( = ?auto_184824 ?auto_184827 ) ) ( not ( = ?auto_184824 ?auto_184828 ) ) ( not ( = ?auto_184824 ?auto_184830 ) ) ( not ( = ?auto_184825 ?auto_184826 ) ) ( not ( = ?auto_184825 ?auto_184827 ) ) ( not ( = ?auto_184825 ?auto_184828 ) ) ( not ( = ?auto_184825 ?auto_184830 ) ) ( not ( = ?auto_184826 ?auto_184827 ) ) ( not ( = ?auto_184826 ?auto_184828 ) ) ( not ( = ?auto_184826 ?auto_184830 ) ) ( not ( = ?auto_184827 ?auto_184828 ) ) ( not ( = ?auto_184827 ?auto_184830 ) ) ( not ( = ?auto_184828 ?auto_184830 ) ) ( ON ?auto_184830 ?auto_184829 ) ( not ( = ?auto_184822 ?auto_184829 ) ) ( not ( = ?auto_184823 ?auto_184829 ) ) ( not ( = ?auto_184824 ?auto_184829 ) ) ( not ( = ?auto_184825 ?auto_184829 ) ) ( not ( = ?auto_184826 ?auto_184829 ) ) ( not ( = ?auto_184827 ?auto_184829 ) ) ( not ( = ?auto_184828 ?auto_184829 ) ) ( not ( = ?auto_184830 ?auto_184829 ) ) ( ON ?auto_184828 ?auto_184830 ) ( ON-TABLE ?auto_184829 ) ( ON ?auto_184827 ?auto_184828 ) ( ON ?auto_184826 ?auto_184827 ) ( ON ?auto_184825 ?auto_184826 ) ( ON ?auto_184824 ?auto_184825 ) ( ON ?auto_184823 ?auto_184824 ) ( ON ?auto_184822 ?auto_184823 ) ( CLEAR ?auto_184822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184829 ?auto_184830 ?auto_184828 ?auto_184827 ?auto_184826 ?auto_184825 ?auto_184824 ?auto_184823 )
      ( MAKE-7PILE ?auto_184822 ?auto_184823 ?auto_184824 ?auto_184825 ?auto_184826 ?auto_184827 ?auto_184828 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184832 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184832 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_184832 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184833 - BLOCK
    )
    :vars
    (
      ?auto_184834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184833 ?auto_184834 ) ( CLEAR ?auto_184833 ) ( HAND-EMPTY ) ( not ( = ?auto_184833 ?auto_184834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184833 ?auto_184834 )
      ( MAKE-1PILE ?auto_184833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184835 - BLOCK
    )
    :vars
    (
      ?auto_184836 - BLOCK
      ?auto_184841 - BLOCK
      ?auto_184840 - BLOCK
      ?auto_184839 - BLOCK
      ?auto_184837 - BLOCK
      ?auto_184838 - BLOCK
      ?auto_184842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184835 ?auto_184836 ) ) ( HOLDING ?auto_184835 ) ( CLEAR ?auto_184836 ) ( ON-TABLE ?auto_184841 ) ( ON ?auto_184840 ?auto_184841 ) ( ON ?auto_184839 ?auto_184840 ) ( ON ?auto_184837 ?auto_184839 ) ( ON ?auto_184838 ?auto_184837 ) ( ON ?auto_184842 ?auto_184838 ) ( ON ?auto_184836 ?auto_184842 ) ( not ( = ?auto_184841 ?auto_184840 ) ) ( not ( = ?auto_184841 ?auto_184839 ) ) ( not ( = ?auto_184841 ?auto_184837 ) ) ( not ( = ?auto_184841 ?auto_184838 ) ) ( not ( = ?auto_184841 ?auto_184842 ) ) ( not ( = ?auto_184841 ?auto_184836 ) ) ( not ( = ?auto_184841 ?auto_184835 ) ) ( not ( = ?auto_184840 ?auto_184839 ) ) ( not ( = ?auto_184840 ?auto_184837 ) ) ( not ( = ?auto_184840 ?auto_184838 ) ) ( not ( = ?auto_184840 ?auto_184842 ) ) ( not ( = ?auto_184840 ?auto_184836 ) ) ( not ( = ?auto_184840 ?auto_184835 ) ) ( not ( = ?auto_184839 ?auto_184837 ) ) ( not ( = ?auto_184839 ?auto_184838 ) ) ( not ( = ?auto_184839 ?auto_184842 ) ) ( not ( = ?auto_184839 ?auto_184836 ) ) ( not ( = ?auto_184839 ?auto_184835 ) ) ( not ( = ?auto_184837 ?auto_184838 ) ) ( not ( = ?auto_184837 ?auto_184842 ) ) ( not ( = ?auto_184837 ?auto_184836 ) ) ( not ( = ?auto_184837 ?auto_184835 ) ) ( not ( = ?auto_184838 ?auto_184842 ) ) ( not ( = ?auto_184838 ?auto_184836 ) ) ( not ( = ?auto_184838 ?auto_184835 ) ) ( not ( = ?auto_184842 ?auto_184836 ) ) ( not ( = ?auto_184842 ?auto_184835 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184841 ?auto_184840 ?auto_184839 ?auto_184837 ?auto_184838 ?auto_184842 ?auto_184836 ?auto_184835 )
      ( MAKE-1PILE ?auto_184835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184843 - BLOCK
    )
    :vars
    (
      ?auto_184849 - BLOCK
      ?auto_184844 - BLOCK
      ?auto_184846 - BLOCK
      ?auto_184845 - BLOCK
      ?auto_184850 - BLOCK
      ?auto_184848 - BLOCK
      ?auto_184847 - BLOCK
      ?auto_184851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184843 ?auto_184849 ) ) ( CLEAR ?auto_184849 ) ( ON-TABLE ?auto_184844 ) ( ON ?auto_184846 ?auto_184844 ) ( ON ?auto_184845 ?auto_184846 ) ( ON ?auto_184850 ?auto_184845 ) ( ON ?auto_184848 ?auto_184850 ) ( ON ?auto_184847 ?auto_184848 ) ( ON ?auto_184849 ?auto_184847 ) ( not ( = ?auto_184844 ?auto_184846 ) ) ( not ( = ?auto_184844 ?auto_184845 ) ) ( not ( = ?auto_184844 ?auto_184850 ) ) ( not ( = ?auto_184844 ?auto_184848 ) ) ( not ( = ?auto_184844 ?auto_184847 ) ) ( not ( = ?auto_184844 ?auto_184849 ) ) ( not ( = ?auto_184844 ?auto_184843 ) ) ( not ( = ?auto_184846 ?auto_184845 ) ) ( not ( = ?auto_184846 ?auto_184850 ) ) ( not ( = ?auto_184846 ?auto_184848 ) ) ( not ( = ?auto_184846 ?auto_184847 ) ) ( not ( = ?auto_184846 ?auto_184849 ) ) ( not ( = ?auto_184846 ?auto_184843 ) ) ( not ( = ?auto_184845 ?auto_184850 ) ) ( not ( = ?auto_184845 ?auto_184848 ) ) ( not ( = ?auto_184845 ?auto_184847 ) ) ( not ( = ?auto_184845 ?auto_184849 ) ) ( not ( = ?auto_184845 ?auto_184843 ) ) ( not ( = ?auto_184850 ?auto_184848 ) ) ( not ( = ?auto_184850 ?auto_184847 ) ) ( not ( = ?auto_184850 ?auto_184849 ) ) ( not ( = ?auto_184850 ?auto_184843 ) ) ( not ( = ?auto_184848 ?auto_184847 ) ) ( not ( = ?auto_184848 ?auto_184849 ) ) ( not ( = ?auto_184848 ?auto_184843 ) ) ( not ( = ?auto_184847 ?auto_184849 ) ) ( not ( = ?auto_184847 ?auto_184843 ) ) ( ON ?auto_184843 ?auto_184851 ) ( CLEAR ?auto_184843 ) ( HAND-EMPTY ) ( not ( = ?auto_184843 ?auto_184851 ) ) ( not ( = ?auto_184849 ?auto_184851 ) ) ( not ( = ?auto_184844 ?auto_184851 ) ) ( not ( = ?auto_184846 ?auto_184851 ) ) ( not ( = ?auto_184845 ?auto_184851 ) ) ( not ( = ?auto_184850 ?auto_184851 ) ) ( not ( = ?auto_184848 ?auto_184851 ) ) ( not ( = ?auto_184847 ?auto_184851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184843 ?auto_184851 )
      ( MAKE-1PILE ?auto_184843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184852 - BLOCK
    )
    :vars
    (
      ?auto_184860 - BLOCK
      ?auto_184859 - BLOCK
      ?auto_184855 - BLOCK
      ?auto_184853 - BLOCK
      ?auto_184858 - BLOCK
      ?auto_184857 - BLOCK
      ?auto_184856 - BLOCK
      ?auto_184854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184852 ?auto_184860 ) ) ( ON-TABLE ?auto_184859 ) ( ON ?auto_184855 ?auto_184859 ) ( ON ?auto_184853 ?auto_184855 ) ( ON ?auto_184858 ?auto_184853 ) ( ON ?auto_184857 ?auto_184858 ) ( ON ?auto_184856 ?auto_184857 ) ( not ( = ?auto_184859 ?auto_184855 ) ) ( not ( = ?auto_184859 ?auto_184853 ) ) ( not ( = ?auto_184859 ?auto_184858 ) ) ( not ( = ?auto_184859 ?auto_184857 ) ) ( not ( = ?auto_184859 ?auto_184856 ) ) ( not ( = ?auto_184859 ?auto_184860 ) ) ( not ( = ?auto_184859 ?auto_184852 ) ) ( not ( = ?auto_184855 ?auto_184853 ) ) ( not ( = ?auto_184855 ?auto_184858 ) ) ( not ( = ?auto_184855 ?auto_184857 ) ) ( not ( = ?auto_184855 ?auto_184856 ) ) ( not ( = ?auto_184855 ?auto_184860 ) ) ( not ( = ?auto_184855 ?auto_184852 ) ) ( not ( = ?auto_184853 ?auto_184858 ) ) ( not ( = ?auto_184853 ?auto_184857 ) ) ( not ( = ?auto_184853 ?auto_184856 ) ) ( not ( = ?auto_184853 ?auto_184860 ) ) ( not ( = ?auto_184853 ?auto_184852 ) ) ( not ( = ?auto_184858 ?auto_184857 ) ) ( not ( = ?auto_184858 ?auto_184856 ) ) ( not ( = ?auto_184858 ?auto_184860 ) ) ( not ( = ?auto_184858 ?auto_184852 ) ) ( not ( = ?auto_184857 ?auto_184856 ) ) ( not ( = ?auto_184857 ?auto_184860 ) ) ( not ( = ?auto_184857 ?auto_184852 ) ) ( not ( = ?auto_184856 ?auto_184860 ) ) ( not ( = ?auto_184856 ?auto_184852 ) ) ( ON ?auto_184852 ?auto_184854 ) ( CLEAR ?auto_184852 ) ( not ( = ?auto_184852 ?auto_184854 ) ) ( not ( = ?auto_184860 ?auto_184854 ) ) ( not ( = ?auto_184859 ?auto_184854 ) ) ( not ( = ?auto_184855 ?auto_184854 ) ) ( not ( = ?auto_184853 ?auto_184854 ) ) ( not ( = ?auto_184858 ?auto_184854 ) ) ( not ( = ?auto_184857 ?auto_184854 ) ) ( not ( = ?auto_184856 ?auto_184854 ) ) ( HOLDING ?auto_184860 ) ( CLEAR ?auto_184856 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184859 ?auto_184855 ?auto_184853 ?auto_184858 ?auto_184857 ?auto_184856 ?auto_184860 )
      ( MAKE-1PILE ?auto_184852 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184861 - BLOCK
    )
    :vars
    (
      ?auto_184863 - BLOCK
      ?auto_184866 - BLOCK
      ?auto_184862 - BLOCK
      ?auto_184869 - BLOCK
      ?auto_184868 - BLOCK
      ?auto_184864 - BLOCK
      ?auto_184867 - BLOCK
      ?auto_184865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184861 ?auto_184863 ) ) ( ON-TABLE ?auto_184866 ) ( ON ?auto_184862 ?auto_184866 ) ( ON ?auto_184869 ?auto_184862 ) ( ON ?auto_184868 ?auto_184869 ) ( ON ?auto_184864 ?auto_184868 ) ( ON ?auto_184867 ?auto_184864 ) ( not ( = ?auto_184866 ?auto_184862 ) ) ( not ( = ?auto_184866 ?auto_184869 ) ) ( not ( = ?auto_184866 ?auto_184868 ) ) ( not ( = ?auto_184866 ?auto_184864 ) ) ( not ( = ?auto_184866 ?auto_184867 ) ) ( not ( = ?auto_184866 ?auto_184863 ) ) ( not ( = ?auto_184866 ?auto_184861 ) ) ( not ( = ?auto_184862 ?auto_184869 ) ) ( not ( = ?auto_184862 ?auto_184868 ) ) ( not ( = ?auto_184862 ?auto_184864 ) ) ( not ( = ?auto_184862 ?auto_184867 ) ) ( not ( = ?auto_184862 ?auto_184863 ) ) ( not ( = ?auto_184862 ?auto_184861 ) ) ( not ( = ?auto_184869 ?auto_184868 ) ) ( not ( = ?auto_184869 ?auto_184864 ) ) ( not ( = ?auto_184869 ?auto_184867 ) ) ( not ( = ?auto_184869 ?auto_184863 ) ) ( not ( = ?auto_184869 ?auto_184861 ) ) ( not ( = ?auto_184868 ?auto_184864 ) ) ( not ( = ?auto_184868 ?auto_184867 ) ) ( not ( = ?auto_184868 ?auto_184863 ) ) ( not ( = ?auto_184868 ?auto_184861 ) ) ( not ( = ?auto_184864 ?auto_184867 ) ) ( not ( = ?auto_184864 ?auto_184863 ) ) ( not ( = ?auto_184864 ?auto_184861 ) ) ( not ( = ?auto_184867 ?auto_184863 ) ) ( not ( = ?auto_184867 ?auto_184861 ) ) ( ON ?auto_184861 ?auto_184865 ) ( not ( = ?auto_184861 ?auto_184865 ) ) ( not ( = ?auto_184863 ?auto_184865 ) ) ( not ( = ?auto_184866 ?auto_184865 ) ) ( not ( = ?auto_184862 ?auto_184865 ) ) ( not ( = ?auto_184869 ?auto_184865 ) ) ( not ( = ?auto_184868 ?auto_184865 ) ) ( not ( = ?auto_184864 ?auto_184865 ) ) ( not ( = ?auto_184867 ?auto_184865 ) ) ( CLEAR ?auto_184867 ) ( ON ?auto_184863 ?auto_184861 ) ( CLEAR ?auto_184863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184865 ?auto_184861 )
      ( MAKE-1PILE ?auto_184861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184870 - BLOCK
    )
    :vars
    (
      ?auto_184872 - BLOCK
      ?auto_184871 - BLOCK
      ?auto_184877 - BLOCK
      ?auto_184874 - BLOCK
      ?auto_184878 - BLOCK
      ?auto_184873 - BLOCK
      ?auto_184876 - BLOCK
      ?auto_184875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184870 ?auto_184872 ) ) ( ON-TABLE ?auto_184871 ) ( ON ?auto_184877 ?auto_184871 ) ( ON ?auto_184874 ?auto_184877 ) ( ON ?auto_184878 ?auto_184874 ) ( ON ?auto_184873 ?auto_184878 ) ( not ( = ?auto_184871 ?auto_184877 ) ) ( not ( = ?auto_184871 ?auto_184874 ) ) ( not ( = ?auto_184871 ?auto_184878 ) ) ( not ( = ?auto_184871 ?auto_184873 ) ) ( not ( = ?auto_184871 ?auto_184876 ) ) ( not ( = ?auto_184871 ?auto_184872 ) ) ( not ( = ?auto_184871 ?auto_184870 ) ) ( not ( = ?auto_184877 ?auto_184874 ) ) ( not ( = ?auto_184877 ?auto_184878 ) ) ( not ( = ?auto_184877 ?auto_184873 ) ) ( not ( = ?auto_184877 ?auto_184876 ) ) ( not ( = ?auto_184877 ?auto_184872 ) ) ( not ( = ?auto_184877 ?auto_184870 ) ) ( not ( = ?auto_184874 ?auto_184878 ) ) ( not ( = ?auto_184874 ?auto_184873 ) ) ( not ( = ?auto_184874 ?auto_184876 ) ) ( not ( = ?auto_184874 ?auto_184872 ) ) ( not ( = ?auto_184874 ?auto_184870 ) ) ( not ( = ?auto_184878 ?auto_184873 ) ) ( not ( = ?auto_184878 ?auto_184876 ) ) ( not ( = ?auto_184878 ?auto_184872 ) ) ( not ( = ?auto_184878 ?auto_184870 ) ) ( not ( = ?auto_184873 ?auto_184876 ) ) ( not ( = ?auto_184873 ?auto_184872 ) ) ( not ( = ?auto_184873 ?auto_184870 ) ) ( not ( = ?auto_184876 ?auto_184872 ) ) ( not ( = ?auto_184876 ?auto_184870 ) ) ( ON ?auto_184870 ?auto_184875 ) ( not ( = ?auto_184870 ?auto_184875 ) ) ( not ( = ?auto_184872 ?auto_184875 ) ) ( not ( = ?auto_184871 ?auto_184875 ) ) ( not ( = ?auto_184877 ?auto_184875 ) ) ( not ( = ?auto_184874 ?auto_184875 ) ) ( not ( = ?auto_184878 ?auto_184875 ) ) ( not ( = ?auto_184873 ?auto_184875 ) ) ( not ( = ?auto_184876 ?auto_184875 ) ) ( ON ?auto_184872 ?auto_184870 ) ( CLEAR ?auto_184872 ) ( ON-TABLE ?auto_184875 ) ( HOLDING ?auto_184876 ) ( CLEAR ?auto_184873 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184871 ?auto_184877 ?auto_184874 ?auto_184878 ?auto_184873 ?auto_184876 )
      ( MAKE-1PILE ?auto_184870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184879 - BLOCK
    )
    :vars
    (
      ?auto_184885 - BLOCK
      ?auto_184882 - BLOCK
      ?auto_184880 - BLOCK
      ?auto_184881 - BLOCK
      ?auto_184887 - BLOCK
      ?auto_184883 - BLOCK
      ?auto_184884 - BLOCK
      ?auto_184886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184879 ?auto_184885 ) ) ( ON-TABLE ?auto_184882 ) ( ON ?auto_184880 ?auto_184882 ) ( ON ?auto_184881 ?auto_184880 ) ( ON ?auto_184887 ?auto_184881 ) ( ON ?auto_184883 ?auto_184887 ) ( not ( = ?auto_184882 ?auto_184880 ) ) ( not ( = ?auto_184882 ?auto_184881 ) ) ( not ( = ?auto_184882 ?auto_184887 ) ) ( not ( = ?auto_184882 ?auto_184883 ) ) ( not ( = ?auto_184882 ?auto_184884 ) ) ( not ( = ?auto_184882 ?auto_184885 ) ) ( not ( = ?auto_184882 ?auto_184879 ) ) ( not ( = ?auto_184880 ?auto_184881 ) ) ( not ( = ?auto_184880 ?auto_184887 ) ) ( not ( = ?auto_184880 ?auto_184883 ) ) ( not ( = ?auto_184880 ?auto_184884 ) ) ( not ( = ?auto_184880 ?auto_184885 ) ) ( not ( = ?auto_184880 ?auto_184879 ) ) ( not ( = ?auto_184881 ?auto_184887 ) ) ( not ( = ?auto_184881 ?auto_184883 ) ) ( not ( = ?auto_184881 ?auto_184884 ) ) ( not ( = ?auto_184881 ?auto_184885 ) ) ( not ( = ?auto_184881 ?auto_184879 ) ) ( not ( = ?auto_184887 ?auto_184883 ) ) ( not ( = ?auto_184887 ?auto_184884 ) ) ( not ( = ?auto_184887 ?auto_184885 ) ) ( not ( = ?auto_184887 ?auto_184879 ) ) ( not ( = ?auto_184883 ?auto_184884 ) ) ( not ( = ?auto_184883 ?auto_184885 ) ) ( not ( = ?auto_184883 ?auto_184879 ) ) ( not ( = ?auto_184884 ?auto_184885 ) ) ( not ( = ?auto_184884 ?auto_184879 ) ) ( ON ?auto_184879 ?auto_184886 ) ( not ( = ?auto_184879 ?auto_184886 ) ) ( not ( = ?auto_184885 ?auto_184886 ) ) ( not ( = ?auto_184882 ?auto_184886 ) ) ( not ( = ?auto_184880 ?auto_184886 ) ) ( not ( = ?auto_184881 ?auto_184886 ) ) ( not ( = ?auto_184887 ?auto_184886 ) ) ( not ( = ?auto_184883 ?auto_184886 ) ) ( not ( = ?auto_184884 ?auto_184886 ) ) ( ON ?auto_184885 ?auto_184879 ) ( ON-TABLE ?auto_184886 ) ( CLEAR ?auto_184883 ) ( ON ?auto_184884 ?auto_184885 ) ( CLEAR ?auto_184884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184886 ?auto_184879 ?auto_184885 )
      ( MAKE-1PILE ?auto_184879 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184888 - BLOCK
    )
    :vars
    (
      ?auto_184896 - BLOCK
      ?auto_184893 - BLOCK
      ?auto_184891 - BLOCK
      ?auto_184895 - BLOCK
      ?auto_184890 - BLOCK
      ?auto_184894 - BLOCK
      ?auto_184892 - BLOCK
      ?auto_184889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184888 ?auto_184896 ) ) ( ON-TABLE ?auto_184893 ) ( ON ?auto_184891 ?auto_184893 ) ( ON ?auto_184895 ?auto_184891 ) ( ON ?auto_184890 ?auto_184895 ) ( not ( = ?auto_184893 ?auto_184891 ) ) ( not ( = ?auto_184893 ?auto_184895 ) ) ( not ( = ?auto_184893 ?auto_184890 ) ) ( not ( = ?auto_184893 ?auto_184894 ) ) ( not ( = ?auto_184893 ?auto_184892 ) ) ( not ( = ?auto_184893 ?auto_184896 ) ) ( not ( = ?auto_184893 ?auto_184888 ) ) ( not ( = ?auto_184891 ?auto_184895 ) ) ( not ( = ?auto_184891 ?auto_184890 ) ) ( not ( = ?auto_184891 ?auto_184894 ) ) ( not ( = ?auto_184891 ?auto_184892 ) ) ( not ( = ?auto_184891 ?auto_184896 ) ) ( not ( = ?auto_184891 ?auto_184888 ) ) ( not ( = ?auto_184895 ?auto_184890 ) ) ( not ( = ?auto_184895 ?auto_184894 ) ) ( not ( = ?auto_184895 ?auto_184892 ) ) ( not ( = ?auto_184895 ?auto_184896 ) ) ( not ( = ?auto_184895 ?auto_184888 ) ) ( not ( = ?auto_184890 ?auto_184894 ) ) ( not ( = ?auto_184890 ?auto_184892 ) ) ( not ( = ?auto_184890 ?auto_184896 ) ) ( not ( = ?auto_184890 ?auto_184888 ) ) ( not ( = ?auto_184894 ?auto_184892 ) ) ( not ( = ?auto_184894 ?auto_184896 ) ) ( not ( = ?auto_184894 ?auto_184888 ) ) ( not ( = ?auto_184892 ?auto_184896 ) ) ( not ( = ?auto_184892 ?auto_184888 ) ) ( ON ?auto_184888 ?auto_184889 ) ( not ( = ?auto_184888 ?auto_184889 ) ) ( not ( = ?auto_184896 ?auto_184889 ) ) ( not ( = ?auto_184893 ?auto_184889 ) ) ( not ( = ?auto_184891 ?auto_184889 ) ) ( not ( = ?auto_184895 ?auto_184889 ) ) ( not ( = ?auto_184890 ?auto_184889 ) ) ( not ( = ?auto_184894 ?auto_184889 ) ) ( not ( = ?auto_184892 ?auto_184889 ) ) ( ON ?auto_184896 ?auto_184888 ) ( ON-TABLE ?auto_184889 ) ( ON ?auto_184892 ?auto_184896 ) ( CLEAR ?auto_184892 ) ( HOLDING ?auto_184894 ) ( CLEAR ?auto_184890 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184893 ?auto_184891 ?auto_184895 ?auto_184890 ?auto_184894 )
      ( MAKE-1PILE ?auto_184888 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184897 - BLOCK
    )
    :vars
    (
      ?auto_184899 - BLOCK
      ?auto_184901 - BLOCK
      ?auto_184904 - BLOCK
      ?auto_184898 - BLOCK
      ?auto_184902 - BLOCK
      ?auto_184905 - BLOCK
      ?auto_184903 - BLOCK
      ?auto_184900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184897 ?auto_184899 ) ) ( ON-TABLE ?auto_184901 ) ( ON ?auto_184904 ?auto_184901 ) ( ON ?auto_184898 ?auto_184904 ) ( ON ?auto_184902 ?auto_184898 ) ( not ( = ?auto_184901 ?auto_184904 ) ) ( not ( = ?auto_184901 ?auto_184898 ) ) ( not ( = ?auto_184901 ?auto_184902 ) ) ( not ( = ?auto_184901 ?auto_184905 ) ) ( not ( = ?auto_184901 ?auto_184903 ) ) ( not ( = ?auto_184901 ?auto_184899 ) ) ( not ( = ?auto_184901 ?auto_184897 ) ) ( not ( = ?auto_184904 ?auto_184898 ) ) ( not ( = ?auto_184904 ?auto_184902 ) ) ( not ( = ?auto_184904 ?auto_184905 ) ) ( not ( = ?auto_184904 ?auto_184903 ) ) ( not ( = ?auto_184904 ?auto_184899 ) ) ( not ( = ?auto_184904 ?auto_184897 ) ) ( not ( = ?auto_184898 ?auto_184902 ) ) ( not ( = ?auto_184898 ?auto_184905 ) ) ( not ( = ?auto_184898 ?auto_184903 ) ) ( not ( = ?auto_184898 ?auto_184899 ) ) ( not ( = ?auto_184898 ?auto_184897 ) ) ( not ( = ?auto_184902 ?auto_184905 ) ) ( not ( = ?auto_184902 ?auto_184903 ) ) ( not ( = ?auto_184902 ?auto_184899 ) ) ( not ( = ?auto_184902 ?auto_184897 ) ) ( not ( = ?auto_184905 ?auto_184903 ) ) ( not ( = ?auto_184905 ?auto_184899 ) ) ( not ( = ?auto_184905 ?auto_184897 ) ) ( not ( = ?auto_184903 ?auto_184899 ) ) ( not ( = ?auto_184903 ?auto_184897 ) ) ( ON ?auto_184897 ?auto_184900 ) ( not ( = ?auto_184897 ?auto_184900 ) ) ( not ( = ?auto_184899 ?auto_184900 ) ) ( not ( = ?auto_184901 ?auto_184900 ) ) ( not ( = ?auto_184904 ?auto_184900 ) ) ( not ( = ?auto_184898 ?auto_184900 ) ) ( not ( = ?auto_184902 ?auto_184900 ) ) ( not ( = ?auto_184905 ?auto_184900 ) ) ( not ( = ?auto_184903 ?auto_184900 ) ) ( ON ?auto_184899 ?auto_184897 ) ( ON-TABLE ?auto_184900 ) ( ON ?auto_184903 ?auto_184899 ) ( CLEAR ?auto_184902 ) ( ON ?auto_184905 ?auto_184903 ) ( CLEAR ?auto_184905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184900 ?auto_184897 ?auto_184899 ?auto_184903 )
      ( MAKE-1PILE ?auto_184897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184906 - BLOCK
    )
    :vars
    (
      ?auto_184910 - BLOCK
      ?auto_184914 - BLOCK
      ?auto_184913 - BLOCK
      ?auto_184912 - BLOCK
      ?auto_184907 - BLOCK
      ?auto_184909 - BLOCK
      ?auto_184911 - BLOCK
      ?auto_184908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184906 ?auto_184910 ) ) ( ON-TABLE ?auto_184914 ) ( ON ?auto_184913 ?auto_184914 ) ( ON ?auto_184912 ?auto_184913 ) ( not ( = ?auto_184914 ?auto_184913 ) ) ( not ( = ?auto_184914 ?auto_184912 ) ) ( not ( = ?auto_184914 ?auto_184907 ) ) ( not ( = ?auto_184914 ?auto_184909 ) ) ( not ( = ?auto_184914 ?auto_184911 ) ) ( not ( = ?auto_184914 ?auto_184910 ) ) ( not ( = ?auto_184914 ?auto_184906 ) ) ( not ( = ?auto_184913 ?auto_184912 ) ) ( not ( = ?auto_184913 ?auto_184907 ) ) ( not ( = ?auto_184913 ?auto_184909 ) ) ( not ( = ?auto_184913 ?auto_184911 ) ) ( not ( = ?auto_184913 ?auto_184910 ) ) ( not ( = ?auto_184913 ?auto_184906 ) ) ( not ( = ?auto_184912 ?auto_184907 ) ) ( not ( = ?auto_184912 ?auto_184909 ) ) ( not ( = ?auto_184912 ?auto_184911 ) ) ( not ( = ?auto_184912 ?auto_184910 ) ) ( not ( = ?auto_184912 ?auto_184906 ) ) ( not ( = ?auto_184907 ?auto_184909 ) ) ( not ( = ?auto_184907 ?auto_184911 ) ) ( not ( = ?auto_184907 ?auto_184910 ) ) ( not ( = ?auto_184907 ?auto_184906 ) ) ( not ( = ?auto_184909 ?auto_184911 ) ) ( not ( = ?auto_184909 ?auto_184910 ) ) ( not ( = ?auto_184909 ?auto_184906 ) ) ( not ( = ?auto_184911 ?auto_184910 ) ) ( not ( = ?auto_184911 ?auto_184906 ) ) ( ON ?auto_184906 ?auto_184908 ) ( not ( = ?auto_184906 ?auto_184908 ) ) ( not ( = ?auto_184910 ?auto_184908 ) ) ( not ( = ?auto_184914 ?auto_184908 ) ) ( not ( = ?auto_184913 ?auto_184908 ) ) ( not ( = ?auto_184912 ?auto_184908 ) ) ( not ( = ?auto_184907 ?auto_184908 ) ) ( not ( = ?auto_184909 ?auto_184908 ) ) ( not ( = ?auto_184911 ?auto_184908 ) ) ( ON ?auto_184910 ?auto_184906 ) ( ON-TABLE ?auto_184908 ) ( ON ?auto_184911 ?auto_184910 ) ( ON ?auto_184909 ?auto_184911 ) ( CLEAR ?auto_184909 ) ( HOLDING ?auto_184907 ) ( CLEAR ?auto_184912 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184914 ?auto_184913 ?auto_184912 ?auto_184907 )
      ( MAKE-1PILE ?auto_184906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184915 - BLOCK
    )
    :vars
    (
      ?auto_184921 - BLOCK
      ?auto_184922 - BLOCK
      ?auto_184920 - BLOCK
      ?auto_184919 - BLOCK
      ?auto_184923 - BLOCK
      ?auto_184916 - BLOCK
      ?auto_184918 - BLOCK
      ?auto_184917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184915 ?auto_184921 ) ) ( ON-TABLE ?auto_184922 ) ( ON ?auto_184920 ?auto_184922 ) ( ON ?auto_184919 ?auto_184920 ) ( not ( = ?auto_184922 ?auto_184920 ) ) ( not ( = ?auto_184922 ?auto_184919 ) ) ( not ( = ?auto_184922 ?auto_184923 ) ) ( not ( = ?auto_184922 ?auto_184916 ) ) ( not ( = ?auto_184922 ?auto_184918 ) ) ( not ( = ?auto_184922 ?auto_184921 ) ) ( not ( = ?auto_184922 ?auto_184915 ) ) ( not ( = ?auto_184920 ?auto_184919 ) ) ( not ( = ?auto_184920 ?auto_184923 ) ) ( not ( = ?auto_184920 ?auto_184916 ) ) ( not ( = ?auto_184920 ?auto_184918 ) ) ( not ( = ?auto_184920 ?auto_184921 ) ) ( not ( = ?auto_184920 ?auto_184915 ) ) ( not ( = ?auto_184919 ?auto_184923 ) ) ( not ( = ?auto_184919 ?auto_184916 ) ) ( not ( = ?auto_184919 ?auto_184918 ) ) ( not ( = ?auto_184919 ?auto_184921 ) ) ( not ( = ?auto_184919 ?auto_184915 ) ) ( not ( = ?auto_184923 ?auto_184916 ) ) ( not ( = ?auto_184923 ?auto_184918 ) ) ( not ( = ?auto_184923 ?auto_184921 ) ) ( not ( = ?auto_184923 ?auto_184915 ) ) ( not ( = ?auto_184916 ?auto_184918 ) ) ( not ( = ?auto_184916 ?auto_184921 ) ) ( not ( = ?auto_184916 ?auto_184915 ) ) ( not ( = ?auto_184918 ?auto_184921 ) ) ( not ( = ?auto_184918 ?auto_184915 ) ) ( ON ?auto_184915 ?auto_184917 ) ( not ( = ?auto_184915 ?auto_184917 ) ) ( not ( = ?auto_184921 ?auto_184917 ) ) ( not ( = ?auto_184922 ?auto_184917 ) ) ( not ( = ?auto_184920 ?auto_184917 ) ) ( not ( = ?auto_184919 ?auto_184917 ) ) ( not ( = ?auto_184923 ?auto_184917 ) ) ( not ( = ?auto_184916 ?auto_184917 ) ) ( not ( = ?auto_184918 ?auto_184917 ) ) ( ON ?auto_184921 ?auto_184915 ) ( ON-TABLE ?auto_184917 ) ( ON ?auto_184918 ?auto_184921 ) ( ON ?auto_184916 ?auto_184918 ) ( CLEAR ?auto_184919 ) ( ON ?auto_184923 ?auto_184916 ) ( CLEAR ?auto_184923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184917 ?auto_184915 ?auto_184921 ?auto_184918 ?auto_184916 )
      ( MAKE-1PILE ?auto_184915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184924 - BLOCK
    )
    :vars
    (
      ?auto_184929 - BLOCK
      ?auto_184927 - BLOCK
      ?auto_184932 - BLOCK
      ?auto_184930 - BLOCK
      ?auto_184925 - BLOCK
      ?auto_184926 - BLOCK
      ?auto_184928 - BLOCK
      ?auto_184931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184924 ?auto_184929 ) ) ( ON-TABLE ?auto_184927 ) ( ON ?auto_184932 ?auto_184927 ) ( not ( = ?auto_184927 ?auto_184932 ) ) ( not ( = ?auto_184927 ?auto_184930 ) ) ( not ( = ?auto_184927 ?auto_184925 ) ) ( not ( = ?auto_184927 ?auto_184926 ) ) ( not ( = ?auto_184927 ?auto_184928 ) ) ( not ( = ?auto_184927 ?auto_184929 ) ) ( not ( = ?auto_184927 ?auto_184924 ) ) ( not ( = ?auto_184932 ?auto_184930 ) ) ( not ( = ?auto_184932 ?auto_184925 ) ) ( not ( = ?auto_184932 ?auto_184926 ) ) ( not ( = ?auto_184932 ?auto_184928 ) ) ( not ( = ?auto_184932 ?auto_184929 ) ) ( not ( = ?auto_184932 ?auto_184924 ) ) ( not ( = ?auto_184930 ?auto_184925 ) ) ( not ( = ?auto_184930 ?auto_184926 ) ) ( not ( = ?auto_184930 ?auto_184928 ) ) ( not ( = ?auto_184930 ?auto_184929 ) ) ( not ( = ?auto_184930 ?auto_184924 ) ) ( not ( = ?auto_184925 ?auto_184926 ) ) ( not ( = ?auto_184925 ?auto_184928 ) ) ( not ( = ?auto_184925 ?auto_184929 ) ) ( not ( = ?auto_184925 ?auto_184924 ) ) ( not ( = ?auto_184926 ?auto_184928 ) ) ( not ( = ?auto_184926 ?auto_184929 ) ) ( not ( = ?auto_184926 ?auto_184924 ) ) ( not ( = ?auto_184928 ?auto_184929 ) ) ( not ( = ?auto_184928 ?auto_184924 ) ) ( ON ?auto_184924 ?auto_184931 ) ( not ( = ?auto_184924 ?auto_184931 ) ) ( not ( = ?auto_184929 ?auto_184931 ) ) ( not ( = ?auto_184927 ?auto_184931 ) ) ( not ( = ?auto_184932 ?auto_184931 ) ) ( not ( = ?auto_184930 ?auto_184931 ) ) ( not ( = ?auto_184925 ?auto_184931 ) ) ( not ( = ?auto_184926 ?auto_184931 ) ) ( not ( = ?auto_184928 ?auto_184931 ) ) ( ON ?auto_184929 ?auto_184924 ) ( ON-TABLE ?auto_184931 ) ( ON ?auto_184928 ?auto_184929 ) ( ON ?auto_184926 ?auto_184928 ) ( ON ?auto_184925 ?auto_184926 ) ( CLEAR ?auto_184925 ) ( HOLDING ?auto_184930 ) ( CLEAR ?auto_184932 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184927 ?auto_184932 ?auto_184930 )
      ( MAKE-1PILE ?auto_184924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184933 - BLOCK
    )
    :vars
    (
      ?auto_184937 - BLOCK
      ?auto_184940 - BLOCK
      ?auto_184936 - BLOCK
      ?auto_184939 - BLOCK
      ?auto_184941 - BLOCK
      ?auto_184934 - BLOCK
      ?auto_184935 - BLOCK
      ?auto_184938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184933 ?auto_184937 ) ) ( ON-TABLE ?auto_184940 ) ( ON ?auto_184936 ?auto_184940 ) ( not ( = ?auto_184940 ?auto_184936 ) ) ( not ( = ?auto_184940 ?auto_184939 ) ) ( not ( = ?auto_184940 ?auto_184941 ) ) ( not ( = ?auto_184940 ?auto_184934 ) ) ( not ( = ?auto_184940 ?auto_184935 ) ) ( not ( = ?auto_184940 ?auto_184937 ) ) ( not ( = ?auto_184940 ?auto_184933 ) ) ( not ( = ?auto_184936 ?auto_184939 ) ) ( not ( = ?auto_184936 ?auto_184941 ) ) ( not ( = ?auto_184936 ?auto_184934 ) ) ( not ( = ?auto_184936 ?auto_184935 ) ) ( not ( = ?auto_184936 ?auto_184937 ) ) ( not ( = ?auto_184936 ?auto_184933 ) ) ( not ( = ?auto_184939 ?auto_184941 ) ) ( not ( = ?auto_184939 ?auto_184934 ) ) ( not ( = ?auto_184939 ?auto_184935 ) ) ( not ( = ?auto_184939 ?auto_184937 ) ) ( not ( = ?auto_184939 ?auto_184933 ) ) ( not ( = ?auto_184941 ?auto_184934 ) ) ( not ( = ?auto_184941 ?auto_184935 ) ) ( not ( = ?auto_184941 ?auto_184937 ) ) ( not ( = ?auto_184941 ?auto_184933 ) ) ( not ( = ?auto_184934 ?auto_184935 ) ) ( not ( = ?auto_184934 ?auto_184937 ) ) ( not ( = ?auto_184934 ?auto_184933 ) ) ( not ( = ?auto_184935 ?auto_184937 ) ) ( not ( = ?auto_184935 ?auto_184933 ) ) ( ON ?auto_184933 ?auto_184938 ) ( not ( = ?auto_184933 ?auto_184938 ) ) ( not ( = ?auto_184937 ?auto_184938 ) ) ( not ( = ?auto_184940 ?auto_184938 ) ) ( not ( = ?auto_184936 ?auto_184938 ) ) ( not ( = ?auto_184939 ?auto_184938 ) ) ( not ( = ?auto_184941 ?auto_184938 ) ) ( not ( = ?auto_184934 ?auto_184938 ) ) ( not ( = ?auto_184935 ?auto_184938 ) ) ( ON ?auto_184937 ?auto_184933 ) ( ON-TABLE ?auto_184938 ) ( ON ?auto_184935 ?auto_184937 ) ( ON ?auto_184934 ?auto_184935 ) ( ON ?auto_184941 ?auto_184934 ) ( CLEAR ?auto_184936 ) ( ON ?auto_184939 ?auto_184941 ) ( CLEAR ?auto_184939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184938 ?auto_184933 ?auto_184937 ?auto_184935 ?auto_184934 ?auto_184941 )
      ( MAKE-1PILE ?auto_184933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184942 - BLOCK
    )
    :vars
    (
      ?auto_184950 - BLOCK
      ?auto_184948 - BLOCK
      ?auto_184947 - BLOCK
      ?auto_184945 - BLOCK
      ?auto_184949 - BLOCK
      ?auto_184946 - BLOCK
      ?auto_184944 - BLOCK
      ?auto_184943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184942 ?auto_184950 ) ) ( ON-TABLE ?auto_184948 ) ( not ( = ?auto_184948 ?auto_184947 ) ) ( not ( = ?auto_184948 ?auto_184945 ) ) ( not ( = ?auto_184948 ?auto_184949 ) ) ( not ( = ?auto_184948 ?auto_184946 ) ) ( not ( = ?auto_184948 ?auto_184944 ) ) ( not ( = ?auto_184948 ?auto_184950 ) ) ( not ( = ?auto_184948 ?auto_184942 ) ) ( not ( = ?auto_184947 ?auto_184945 ) ) ( not ( = ?auto_184947 ?auto_184949 ) ) ( not ( = ?auto_184947 ?auto_184946 ) ) ( not ( = ?auto_184947 ?auto_184944 ) ) ( not ( = ?auto_184947 ?auto_184950 ) ) ( not ( = ?auto_184947 ?auto_184942 ) ) ( not ( = ?auto_184945 ?auto_184949 ) ) ( not ( = ?auto_184945 ?auto_184946 ) ) ( not ( = ?auto_184945 ?auto_184944 ) ) ( not ( = ?auto_184945 ?auto_184950 ) ) ( not ( = ?auto_184945 ?auto_184942 ) ) ( not ( = ?auto_184949 ?auto_184946 ) ) ( not ( = ?auto_184949 ?auto_184944 ) ) ( not ( = ?auto_184949 ?auto_184950 ) ) ( not ( = ?auto_184949 ?auto_184942 ) ) ( not ( = ?auto_184946 ?auto_184944 ) ) ( not ( = ?auto_184946 ?auto_184950 ) ) ( not ( = ?auto_184946 ?auto_184942 ) ) ( not ( = ?auto_184944 ?auto_184950 ) ) ( not ( = ?auto_184944 ?auto_184942 ) ) ( ON ?auto_184942 ?auto_184943 ) ( not ( = ?auto_184942 ?auto_184943 ) ) ( not ( = ?auto_184950 ?auto_184943 ) ) ( not ( = ?auto_184948 ?auto_184943 ) ) ( not ( = ?auto_184947 ?auto_184943 ) ) ( not ( = ?auto_184945 ?auto_184943 ) ) ( not ( = ?auto_184949 ?auto_184943 ) ) ( not ( = ?auto_184946 ?auto_184943 ) ) ( not ( = ?auto_184944 ?auto_184943 ) ) ( ON ?auto_184950 ?auto_184942 ) ( ON-TABLE ?auto_184943 ) ( ON ?auto_184944 ?auto_184950 ) ( ON ?auto_184946 ?auto_184944 ) ( ON ?auto_184949 ?auto_184946 ) ( ON ?auto_184945 ?auto_184949 ) ( CLEAR ?auto_184945 ) ( HOLDING ?auto_184947 ) ( CLEAR ?auto_184948 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184948 ?auto_184947 )
      ( MAKE-1PILE ?auto_184942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184951 - BLOCK
    )
    :vars
    (
      ?auto_184953 - BLOCK
      ?auto_184954 - BLOCK
      ?auto_184959 - BLOCK
      ?auto_184956 - BLOCK
      ?auto_184958 - BLOCK
      ?auto_184957 - BLOCK
      ?auto_184952 - BLOCK
      ?auto_184955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184951 ?auto_184953 ) ) ( ON-TABLE ?auto_184954 ) ( not ( = ?auto_184954 ?auto_184959 ) ) ( not ( = ?auto_184954 ?auto_184956 ) ) ( not ( = ?auto_184954 ?auto_184958 ) ) ( not ( = ?auto_184954 ?auto_184957 ) ) ( not ( = ?auto_184954 ?auto_184952 ) ) ( not ( = ?auto_184954 ?auto_184953 ) ) ( not ( = ?auto_184954 ?auto_184951 ) ) ( not ( = ?auto_184959 ?auto_184956 ) ) ( not ( = ?auto_184959 ?auto_184958 ) ) ( not ( = ?auto_184959 ?auto_184957 ) ) ( not ( = ?auto_184959 ?auto_184952 ) ) ( not ( = ?auto_184959 ?auto_184953 ) ) ( not ( = ?auto_184959 ?auto_184951 ) ) ( not ( = ?auto_184956 ?auto_184958 ) ) ( not ( = ?auto_184956 ?auto_184957 ) ) ( not ( = ?auto_184956 ?auto_184952 ) ) ( not ( = ?auto_184956 ?auto_184953 ) ) ( not ( = ?auto_184956 ?auto_184951 ) ) ( not ( = ?auto_184958 ?auto_184957 ) ) ( not ( = ?auto_184958 ?auto_184952 ) ) ( not ( = ?auto_184958 ?auto_184953 ) ) ( not ( = ?auto_184958 ?auto_184951 ) ) ( not ( = ?auto_184957 ?auto_184952 ) ) ( not ( = ?auto_184957 ?auto_184953 ) ) ( not ( = ?auto_184957 ?auto_184951 ) ) ( not ( = ?auto_184952 ?auto_184953 ) ) ( not ( = ?auto_184952 ?auto_184951 ) ) ( ON ?auto_184951 ?auto_184955 ) ( not ( = ?auto_184951 ?auto_184955 ) ) ( not ( = ?auto_184953 ?auto_184955 ) ) ( not ( = ?auto_184954 ?auto_184955 ) ) ( not ( = ?auto_184959 ?auto_184955 ) ) ( not ( = ?auto_184956 ?auto_184955 ) ) ( not ( = ?auto_184958 ?auto_184955 ) ) ( not ( = ?auto_184957 ?auto_184955 ) ) ( not ( = ?auto_184952 ?auto_184955 ) ) ( ON ?auto_184953 ?auto_184951 ) ( ON-TABLE ?auto_184955 ) ( ON ?auto_184952 ?auto_184953 ) ( ON ?auto_184957 ?auto_184952 ) ( ON ?auto_184958 ?auto_184957 ) ( ON ?auto_184956 ?auto_184958 ) ( CLEAR ?auto_184954 ) ( ON ?auto_184959 ?auto_184956 ) ( CLEAR ?auto_184959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184955 ?auto_184951 ?auto_184953 ?auto_184952 ?auto_184957 ?auto_184958 ?auto_184956 )
      ( MAKE-1PILE ?auto_184951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184960 - BLOCK
    )
    :vars
    (
      ?auto_184967 - BLOCK
      ?auto_184964 - BLOCK
      ?auto_184962 - BLOCK
      ?auto_184968 - BLOCK
      ?auto_184966 - BLOCK
      ?auto_184965 - BLOCK
      ?auto_184961 - BLOCK
      ?auto_184963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184960 ?auto_184967 ) ) ( not ( = ?auto_184964 ?auto_184962 ) ) ( not ( = ?auto_184964 ?auto_184968 ) ) ( not ( = ?auto_184964 ?auto_184966 ) ) ( not ( = ?auto_184964 ?auto_184965 ) ) ( not ( = ?auto_184964 ?auto_184961 ) ) ( not ( = ?auto_184964 ?auto_184967 ) ) ( not ( = ?auto_184964 ?auto_184960 ) ) ( not ( = ?auto_184962 ?auto_184968 ) ) ( not ( = ?auto_184962 ?auto_184966 ) ) ( not ( = ?auto_184962 ?auto_184965 ) ) ( not ( = ?auto_184962 ?auto_184961 ) ) ( not ( = ?auto_184962 ?auto_184967 ) ) ( not ( = ?auto_184962 ?auto_184960 ) ) ( not ( = ?auto_184968 ?auto_184966 ) ) ( not ( = ?auto_184968 ?auto_184965 ) ) ( not ( = ?auto_184968 ?auto_184961 ) ) ( not ( = ?auto_184968 ?auto_184967 ) ) ( not ( = ?auto_184968 ?auto_184960 ) ) ( not ( = ?auto_184966 ?auto_184965 ) ) ( not ( = ?auto_184966 ?auto_184961 ) ) ( not ( = ?auto_184966 ?auto_184967 ) ) ( not ( = ?auto_184966 ?auto_184960 ) ) ( not ( = ?auto_184965 ?auto_184961 ) ) ( not ( = ?auto_184965 ?auto_184967 ) ) ( not ( = ?auto_184965 ?auto_184960 ) ) ( not ( = ?auto_184961 ?auto_184967 ) ) ( not ( = ?auto_184961 ?auto_184960 ) ) ( ON ?auto_184960 ?auto_184963 ) ( not ( = ?auto_184960 ?auto_184963 ) ) ( not ( = ?auto_184967 ?auto_184963 ) ) ( not ( = ?auto_184964 ?auto_184963 ) ) ( not ( = ?auto_184962 ?auto_184963 ) ) ( not ( = ?auto_184968 ?auto_184963 ) ) ( not ( = ?auto_184966 ?auto_184963 ) ) ( not ( = ?auto_184965 ?auto_184963 ) ) ( not ( = ?auto_184961 ?auto_184963 ) ) ( ON ?auto_184967 ?auto_184960 ) ( ON-TABLE ?auto_184963 ) ( ON ?auto_184961 ?auto_184967 ) ( ON ?auto_184965 ?auto_184961 ) ( ON ?auto_184966 ?auto_184965 ) ( ON ?auto_184968 ?auto_184966 ) ( ON ?auto_184962 ?auto_184968 ) ( CLEAR ?auto_184962 ) ( HOLDING ?auto_184964 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184964 )
      ( MAKE-1PILE ?auto_184960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184969 - BLOCK
    )
    :vars
    (
      ?auto_184970 - BLOCK
      ?auto_184977 - BLOCK
      ?auto_184976 - BLOCK
      ?auto_184973 - BLOCK
      ?auto_184975 - BLOCK
      ?auto_184971 - BLOCK
      ?auto_184974 - BLOCK
      ?auto_184972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184969 ?auto_184970 ) ) ( not ( = ?auto_184977 ?auto_184976 ) ) ( not ( = ?auto_184977 ?auto_184973 ) ) ( not ( = ?auto_184977 ?auto_184975 ) ) ( not ( = ?auto_184977 ?auto_184971 ) ) ( not ( = ?auto_184977 ?auto_184974 ) ) ( not ( = ?auto_184977 ?auto_184970 ) ) ( not ( = ?auto_184977 ?auto_184969 ) ) ( not ( = ?auto_184976 ?auto_184973 ) ) ( not ( = ?auto_184976 ?auto_184975 ) ) ( not ( = ?auto_184976 ?auto_184971 ) ) ( not ( = ?auto_184976 ?auto_184974 ) ) ( not ( = ?auto_184976 ?auto_184970 ) ) ( not ( = ?auto_184976 ?auto_184969 ) ) ( not ( = ?auto_184973 ?auto_184975 ) ) ( not ( = ?auto_184973 ?auto_184971 ) ) ( not ( = ?auto_184973 ?auto_184974 ) ) ( not ( = ?auto_184973 ?auto_184970 ) ) ( not ( = ?auto_184973 ?auto_184969 ) ) ( not ( = ?auto_184975 ?auto_184971 ) ) ( not ( = ?auto_184975 ?auto_184974 ) ) ( not ( = ?auto_184975 ?auto_184970 ) ) ( not ( = ?auto_184975 ?auto_184969 ) ) ( not ( = ?auto_184971 ?auto_184974 ) ) ( not ( = ?auto_184971 ?auto_184970 ) ) ( not ( = ?auto_184971 ?auto_184969 ) ) ( not ( = ?auto_184974 ?auto_184970 ) ) ( not ( = ?auto_184974 ?auto_184969 ) ) ( ON ?auto_184969 ?auto_184972 ) ( not ( = ?auto_184969 ?auto_184972 ) ) ( not ( = ?auto_184970 ?auto_184972 ) ) ( not ( = ?auto_184977 ?auto_184972 ) ) ( not ( = ?auto_184976 ?auto_184972 ) ) ( not ( = ?auto_184973 ?auto_184972 ) ) ( not ( = ?auto_184975 ?auto_184972 ) ) ( not ( = ?auto_184971 ?auto_184972 ) ) ( not ( = ?auto_184974 ?auto_184972 ) ) ( ON ?auto_184970 ?auto_184969 ) ( ON-TABLE ?auto_184972 ) ( ON ?auto_184974 ?auto_184970 ) ( ON ?auto_184971 ?auto_184974 ) ( ON ?auto_184975 ?auto_184971 ) ( ON ?auto_184973 ?auto_184975 ) ( ON ?auto_184976 ?auto_184973 ) ( ON ?auto_184977 ?auto_184976 ) ( CLEAR ?auto_184977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184972 ?auto_184969 ?auto_184970 ?auto_184974 ?auto_184971 ?auto_184975 ?auto_184973 ?auto_184976 )
      ( MAKE-1PILE ?auto_184969 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184984 - BLOCK
      ?auto_184985 - BLOCK
      ?auto_184986 - BLOCK
      ?auto_184987 - BLOCK
      ?auto_184988 - BLOCK
      ?auto_184989 - BLOCK
    )
    :vars
    (
      ?auto_184990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184990 ?auto_184989 ) ( CLEAR ?auto_184990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184984 ) ( ON ?auto_184985 ?auto_184984 ) ( ON ?auto_184986 ?auto_184985 ) ( ON ?auto_184987 ?auto_184986 ) ( ON ?auto_184988 ?auto_184987 ) ( ON ?auto_184989 ?auto_184988 ) ( not ( = ?auto_184984 ?auto_184985 ) ) ( not ( = ?auto_184984 ?auto_184986 ) ) ( not ( = ?auto_184984 ?auto_184987 ) ) ( not ( = ?auto_184984 ?auto_184988 ) ) ( not ( = ?auto_184984 ?auto_184989 ) ) ( not ( = ?auto_184984 ?auto_184990 ) ) ( not ( = ?auto_184985 ?auto_184986 ) ) ( not ( = ?auto_184985 ?auto_184987 ) ) ( not ( = ?auto_184985 ?auto_184988 ) ) ( not ( = ?auto_184985 ?auto_184989 ) ) ( not ( = ?auto_184985 ?auto_184990 ) ) ( not ( = ?auto_184986 ?auto_184987 ) ) ( not ( = ?auto_184986 ?auto_184988 ) ) ( not ( = ?auto_184986 ?auto_184989 ) ) ( not ( = ?auto_184986 ?auto_184990 ) ) ( not ( = ?auto_184987 ?auto_184988 ) ) ( not ( = ?auto_184987 ?auto_184989 ) ) ( not ( = ?auto_184987 ?auto_184990 ) ) ( not ( = ?auto_184988 ?auto_184989 ) ) ( not ( = ?auto_184988 ?auto_184990 ) ) ( not ( = ?auto_184989 ?auto_184990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184990 ?auto_184989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184991 - BLOCK
      ?auto_184992 - BLOCK
      ?auto_184993 - BLOCK
      ?auto_184994 - BLOCK
      ?auto_184995 - BLOCK
      ?auto_184996 - BLOCK
    )
    :vars
    (
      ?auto_184997 - BLOCK
      ?auto_184998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184997 ?auto_184996 ) ( CLEAR ?auto_184997 ) ( ON-TABLE ?auto_184991 ) ( ON ?auto_184992 ?auto_184991 ) ( ON ?auto_184993 ?auto_184992 ) ( ON ?auto_184994 ?auto_184993 ) ( ON ?auto_184995 ?auto_184994 ) ( ON ?auto_184996 ?auto_184995 ) ( not ( = ?auto_184991 ?auto_184992 ) ) ( not ( = ?auto_184991 ?auto_184993 ) ) ( not ( = ?auto_184991 ?auto_184994 ) ) ( not ( = ?auto_184991 ?auto_184995 ) ) ( not ( = ?auto_184991 ?auto_184996 ) ) ( not ( = ?auto_184991 ?auto_184997 ) ) ( not ( = ?auto_184992 ?auto_184993 ) ) ( not ( = ?auto_184992 ?auto_184994 ) ) ( not ( = ?auto_184992 ?auto_184995 ) ) ( not ( = ?auto_184992 ?auto_184996 ) ) ( not ( = ?auto_184992 ?auto_184997 ) ) ( not ( = ?auto_184993 ?auto_184994 ) ) ( not ( = ?auto_184993 ?auto_184995 ) ) ( not ( = ?auto_184993 ?auto_184996 ) ) ( not ( = ?auto_184993 ?auto_184997 ) ) ( not ( = ?auto_184994 ?auto_184995 ) ) ( not ( = ?auto_184994 ?auto_184996 ) ) ( not ( = ?auto_184994 ?auto_184997 ) ) ( not ( = ?auto_184995 ?auto_184996 ) ) ( not ( = ?auto_184995 ?auto_184997 ) ) ( not ( = ?auto_184996 ?auto_184997 ) ) ( HOLDING ?auto_184998 ) ( not ( = ?auto_184991 ?auto_184998 ) ) ( not ( = ?auto_184992 ?auto_184998 ) ) ( not ( = ?auto_184993 ?auto_184998 ) ) ( not ( = ?auto_184994 ?auto_184998 ) ) ( not ( = ?auto_184995 ?auto_184998 ) ) ( not ( = ?auto_184996 ?auto_184998 ) ) ( not ( = ?auto_184997 ?auto_184998 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_184998 )
      ( MAKE-6PILE ?auto_184991 ?auto_184992 ?auto_184993 ?auto_184994 ?auto_184995 ?auto_184996 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184999 - BLOCK
      ?auto_185000 - BLOCK
      ?auto_185001 - BLOCK
      ?auto_185002 - BLOCK
      ?auto_185003 - BLOCK
      ?auto_185004 - BLOCK
    )
    :vars
    (
      ?auto_185005 - BLOCK
      ?auto_185006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185005 ?auto_185004 ) ( ON-TABLE ?auto_184999 ) ( ON ?auto_185000 ?auto_184999 ) ( ON ?auto_185001 ?auto_185000 ) ( ON ?auto_185002 ?auto_185001 ) ( ON ?auto_185003 ?auto_185002 ) ( ON ?auto_185004 ?auto_185003 ) ( not ( = ?auto_184999 ?auto_185000 ) ) ( not ( = ?auto_184999 ?auto_185001 ) ) ( not ( = ?auto_184999 ?auto_185002 ) ) ( not ( = ?auto_184999 ?auto_185003 ) ) ( not ( = ?auto_184999 ?auto_185004 ) ) ( not ( = ?auto_184999 ?auto_185005 ) ) ( not ( = ?auto_185000 ?auto_185001 ) ) ( not ( = ?auto_185000 ?auto_185002 ) ) ( not ( = ?auto_185000 ?auto_185003 ) ) ( not ( = ?auto_185000 ?auto_185004 ) ) ( not ( = ?auto_185000 ?auto_185005 ) ) ( not ( = ?auto_185001 ?auto_185002 ) ) ( not ( = ?auto_185001 ?auto_185003 ) ) ( not ( = ?auto_185001 ?auto_185004 ) ) ( not ( = ?auto_185001 ?auto_185005 ) ) ( not ( = ?auto_185002 ?auto_185003 ) ) ( not ( = ?auto_185002 ?auto_185004 ) ) ( not ( = ?auto_185002 ?auto_185005 ) ) ( not ( = ?auto_185003 ?auto_185004 ) ) ( not ( = ?auto_185003 ?auto_185005 ) ) ( not ( = ?auto_185004 ?auto_185005 ) ) ( not ( = ?auto_184999 ?auto_185006 ) ) ( not ( = ?auto_185000 ?auto_185006 ) ) ( not ( = ?auto_185001 ?auto_185006 ) ) ( not ( = ?auto_185002 ?auto_185006 ) ) ( not ( = ?auto_185003 ?auto_185006 ) ) ( not ( = ?auto_185004 ?auto_185006 ) ) ( not ( = ?auto_185005 ?auto_185006 ) ) ( ON ?auto_185006 ?auto_185005 ) ( CLEAR ?auto_185006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184999 ?auto_185000 ?auto_185001 ?auto_185002 ?auto_185003 ?auto_185004 ?auto_185005 )
      ( MAKE-6PILE ?auto_184999 ?auto_185000 ?auto_185001 ?auto_185002 ?auto_185003 ?auto_185004 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185007 - BLOCK
      ?auto_185008 - BLOCK
      ?auto_185009 - BLOCK
      ?auto_185010 - BLOCK
      ?auto_185011 - BLOCK
      ?auto_185012 - BLOCK
    )
    :vars
    (
      ?auto_185014 - BLOCK
      ?auto_185013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185014 ?auto_185012 ) ( ON-TABLE ?auto_185007 ) ( ON ?auto_185008 ?auto_185007 ) ( ON ?auto_185009 ?auto_185008 ) ( ON ?auto_185010 ?auto_185009 ) ( ON ?auto_185011 ?auto_185010 ) ( ON ?auto_185012 ?auto_185011 ) ( not ( = ?auto_185007 ?auto_185008 ) ) ( not ( = ?auto_185007 ?auto_185009 ) ) ( not ( = ?auto_185007 ?auto_185010 ) ) ( not ( = ?auto_185007 ?auto_185011 ) ) ( not ( = ?auto_185007 ?auto_185012 ) ) ( not ( = ?auto_185007 ?auto_185014 ) ) ( not ( = ?auto_185008 ?auto_185009 ) ) ( not ( = ?auto_185008 ?auto_185010 ) ) ( not ( = ?auto_185008 ?auto_185011 ) ) ( not ( = ?auto_185008 ?auto_185012 ) ) ( not ( = ?auto_185008 ?auto_185014 ) ) ( not ( = ?auto_185009 ?auto_185010 ) ) ( not ( = ?auto_185009 ?auto_185011 ) ) ( not ( = ?auto_185009 ?auto_185012 ) ) ( not ( = ?auto_185009 ?auto_185014 ) ) ( not ( = ?auto_185010 ?auto_185011 ) ) ( not ( = ?auto_185010 ?auto_185012 ) ) ( not ( = ?auto_185010 ?auto_185014 ) ) ( not ( = ?auto_185011 ?auto_185012 ) ) ( not ( = ?auto_185011 ?auto_185014 ) ) ( not ( = ?auto_185012 ?auto_185014 ) ) ( not ( = ?auto_185007 ?auto_185013 ) ) ( not ( = ?auto_185008 ?auto_185013 ) ) ( not ( = ?auto_185009 ?auto_185013 ) ) ( not ( = ?auto_185010 ?auto_185013 ) ) ( not ( = ?auto_185011 ?auto_185013 ) ) ( not ( = ?auto_185012 ?auto_185013 ) ) ( not ( = ?auto_185014 ?auto_185013 ) ) ( HOLDING ?auto_185013 ) ( CLEAR ?auto_185014 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185007 ?auto_185008 ?auto_185009 ?auto_185010 ?auto_185011 ?auto_185012 ?auto_185014 ?auto_185013 )
      ( MAKE-6PILE ?auto_185007 ?auto_185008 ?auto_185009 ?auto_185010 ?auto_185011 ?auto_185012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185015 - BLOCK
      ?auto_185016 - BLOCK
      ?auto_185017 - BLOCK
      ?auto_185018 - BLOCK
      ?auto_185019 - BLOCK
      ?auto_185020 - BLOCK
    )
    :vars
    (
      ?auto_185021 - BLOCK
      ?auto_185022 - BLOCK
      ?auto_185023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185021 ?auto_185020 ) ( ON-TABLE ?auto_185015 ) ( ON ?auto_185016 ?auto_185015 ) ( ON ?auto_185017 ?auto_185016 ) ( ON ?auto_185018 ?auto_185017 ) ( ON ?auto_185019 ?auto_185018 ) ( ON ?auto_185020 ?auto_185019 ) ( not ( = ?auto_185015 ?auto_185016 ) ) ( not ( = ?auto_185015 ?auto_185017 ) ) ( not ( = ?auto_185015 ?auto_185018 ) ) ( not ( = ?auto_185015 ?auto_185019 ) ) ( not ( = ?auto_185015 ?auto_185020 ) ) ( not ( = ?auto_185015 ?auto_185021 ) ) ( not ( = ?auto_185016 ?auto_185017 ) ) ( not ( = ?auto_185016 ?auto_185018 ) ) ( not ( = ?auto_185016 ?auto_185019 ) ) ( not ( = ?auto_185016 ?auto_185020 ) ) ( not ( = ?auto_185016 ?auto_185021 ) ) ( not ( = ?auto_185017 ?auto_185018 ) ) ( not ( = ?auto_185017 ?auto_185019 ) ) ( not ( = ?auto_185017 ?auto_185020 ) ) ( not ( = ?auto_185017 ?auto_185021 ) ) ( not ( = ?auto_185018 ?auto_185019 ) ) ( not ( = ?auto_185018 ?auto_185020 ) ) ( not ( = ?auto_185018 ?auto_185021 ) ) ( not ( = ?auto_185019 ?auto_185020 ) ) ( not ( = ?auto_185019 ?auto_185021 ) ) ( not ( = ?auto_185020 ?auto_185021 ) ) ( not ( = ?auto_185015 ?auto_185022 ) ) ( not ( = ?auto_185016 ?auto_185022 ) ) ( not ( = ?auto_185017 ?auto_185022 ) ) ( not ( = ?auto_185018 ?auto_185022 ) ) ( not ( = ?auto_185019 ?auto_185022 ) ) ( not ( = ?auto_185020 ?auto_185022 ) ) ( not ( = ?auto_185021 ?auto_185022 ) ) ( CLEAR ?auto_185021 ) ( ON ?auto_185022 ?auto_185023 ) ( CLEAR ?auto_185022 ) ( HAND-EMPTY ) ( not ( = ?auto_185015 ?auto_185023 ) ) ( not ( = ?auto_185016 ?auto_185023 ) ) ( not ( = ?auto_185017 ?auto_185023 ) ) ( not ( = ?auto_185018 ?auto_185023 ) ) ( not ( = ?auto_185019 ?auto_185023 ) ) ( not ( = ?auto_185020 ?auto_185023 ) ) ( not ( = ?auto_185021 ?auto_185023 ) ) ( not ( = ?auto_185022 ?auto_185023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185022 ?auto_185023 )
      ( MAKE-6PILE ?auto_185015 ?auto_185016 ?auto_185017 ?auto_185018 ?auto_185019 ?auto_185020 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185042 - BLOCK
      ?auto_185043 - BLOCK
      ?auto_185044 - BLOCK
      ?auto_185045 - BLOCK
      ?auto_185046 - BLOCK
      ?auto_185047 - BLOCK
    )
    :vars
    (
      ?auto_185049 - BLOCK
      ?auto_185050 - BLOCK
      ?auto_185048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185042 ) ( ON ?auto_185043 ?auto_185042 ) ( ON ?auto_185044 ?auto_185043 ) ( ON ?auto_185045 ?auto_185044 ) ( ON ?auto_185046 ?auto_185045 ) ( not ( = ?auto_185042 ?auto_185043 ) ) ( not ( = ?auto_185042 ?auto_185044 ) ) ( not ( = ?auto_185042 ?auto_185045 ) ) ( not ( = ?auto_185042 ?auto_185046 ) ) ( not ( = ?auto_185042 ?auto_185047 ) ) ( not ( = ?auto_185042 ?auto_185049 ) ) ( not ( = ?auto_185043 ?auto_185044 ) ) ( not ( = ?auto_185043 ?auto_185045 ) ) ( not ( = ?auto_185043 ?auto_185046 ) ) ( not ( = ?auto_185043 ?auto_185047 ) ) ( not ( = ?auto_185043 ?auto_185049 ) ) ( not ( = ?auto_185044 ?auto_185045 ) ) ( not ( = ?auto_185044 ?auto_185046 ) ) ( not ( = ?auto_185044 ?auto_185047 ) ) ( not ( = ?auto_185044 ?auto_185049 ) ) ( not ( = ?auto_185045 ?auto_185046 ) ) ( not ( = ?auto_185045 ?auto_185047 ) ) ( not ( = ?auto_185045 ?auto_185049 ) ) ( not ( = ?auto_185046 ?auto_185047 ) ) ( not ( = ?auto_185046 ?auto_185049 ) ) ( not ( = ?auto_185047 ?auto_185049 ) ) ( not ( = ?auto_185042 ?auto_185050 ) ) ( not ( = ?auto_185043 ?auto_185050 ) ) ( not ( = ?auto_185044 ?auto_185050 ) ) ( not ( = ?auto_185045 ?auto_185050 ) ) ( not ( = ?auto_185046 ?auto_185050 ) ) ( not ( = ?auto_185047 ?auto_185050 ) ) ( not ( = ?auto_185049 ?auto_185050 ) ) ( ON ?auto_185050 ?auto_185048 ) ( not ( = ?auto_185042 ?auto_185048 ) ) ( not ( = ?auto_185043 ?auto_185048 ) ) ( not ( = ?auto_185044 ?auto_185048 ) ) ( not ( = ?auto_185045 ?auto_185048 ) ) ( not ( = ?auto_185046 ?auto_185048 ) ) ( not ( = ?auto_185047 ?auto_185048 ) ) ( not ( = ?auto_185049 ?auto_185048 ) ) ( not ( = ?auto_185050 ?auto_185048 ) ) ( ON ?auto_185049 ?auto_185050 ) ( CLEAR ?auto_185049 ) ( HOLDING ?auto_185047 ) ( CLEAR ?auto_185046 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185042 ?auto_185043 ?auto_185044 ?auto_185045 ?auto_185046 ?auto_185047 ?auto_185049 )
      ( MAKE-6PILE ?auto_185042 ?auto_185043 ?auto_185044 ?auto_185045 ?auto_185046 ?auto_185047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185051 - BLOCK
      ?auto_185052 - BLOCK
      ?auto_185053 - BLOCK
      ?auto_185054 - BLOCK
      ?auto_185055 - BLOCK
      ?auto_185056 - BLOCK
    )
    :vars
    (
      ?auto_185057 - BLOCK
      ?auto_185058 - BLOCK
      ?auto_185059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185051 ) ( ON ?auto_185052 ?auto_185051 ) ( ON ?auto_185053 ?auto_185052 ) ( ON ?auto_185054 ?auto_185053 ) ( ON ?auto_185055 ?auto_185054 ) ( not ( = ?auto_185051 ?auto_185052 ) ) ( not ( = ?auto_185051 ?auto_185053 ) ) ( not ( = ?auto_185051 ?auto_185054 ) ) ( not ( = ?auto_185051 ?auto_185055 ) ) ( not ( = ?auto_185051 ?auto_185056 ) ) ( not ( = ?auto_185051 ?auto_185057 ) ) ( not ( = ?auto_185052 ?auto_185053 ) ) ( not ( = ?auto_185052 ?auto_185054 ) ) ( not ( = ?auto_185052 ?auto_185055 ) ) ( not ( = ?auto_185052 ?auto_185056 ) ) ( not ( = ?auto_185052 ?auto_185057 ) ) ( not ( = ?auto_185053 ?auto_185054 ) ) ( not ( = ?auto_185053 ?auto_185055 ) ) ( not ( = ?auto_185053 ?auto_185056 ) ) ( not ( = ?auto_185053 ?auto_185057 ) ) ( not ( = ?auto_185054 ?auto_185055 ) ) ( not ( = ?auto_185054 ?auto_185056 ) ) ( not ( = ?auto_185054 ?auto_185057 ) ) ( not ( = ?auto_185055 ?auto_185056 ) ) ( not ( = ?auto_185055 ?auto_185057 ) ) ( not ( = ?auto_185056 ?auto_185057 ) ) ( not ( = ?auto_185051 ?auto_185058 ) ) ( not ( = ?auto_185052 ?auto_185058 ) ) ( not ( = ?auto_185053 ?auto_185058 ) ) ( not ( = ?auto_185054 ?auto_185058 ) ) ( not ( = ?auto_185055 ?auto_185058 ) ) ( not ( = ?auto_185056 ?auto_185058 ) ) ( not ( = ?auto_185057 ?auto_185058 ) ) ( ON ?auto_185058 ?auto_185059 ) ( not ( = ?auto_185051 ?auto_185059 ) ) ( not ( = ?auto_185052 ?auto_185059 ) ) ( not ( = ?auto_185053 ?auto_185059 ) ) ( not ( = ?auto_185054 ?auto_185059 ) ) ( not ( = ?auto_185055 ?auto_185059 ) ) ( not ( = ?auto_185056 ?auto_185059 ) ) ( not ( = ?auto_185057 ?auto_185059 ) ) ( not ( = ?auto_185058 ?auto_185059 ) ) ( ON ?auto_185057 ?auto_185058 ) ( CLEAR ?auto_185055 ) ( ON ?auto_185056 ?auto_185057 ) ( CLEAR ?auto_185056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185059 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185059 ?auto_185058 ?auto_185057 )
      ( MAKE-6PILE ?auto_185051 ?auto_185052 ?auto_185053 ?auto_185054 ?auto_185055 ?auto_185056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185060 - BLOCK
      ?auto_185061 - BLOCK
      ?auto_185062 - BLOCK
      ?auto_185063 - BLOCK
      ?auto_185064 - BLOCK
      ?auto_185065 - BLOCK
    )
    :vars
    (
      ?auto_185066 - BLOCK
      ?auto_185068 - BLOCK
      ?auto_185067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185060 ) ( ON ?auto_185061 ?auto_185060 ) ( ON ?auto_185062 ?auto_185061 ) ( ON ?auto_185063 ?auto_185062 ) ( not ( = ?auto_185060 ?auto_185061 ) ) ( not ( = ?auto_185060 ?auto_185062 ) ) ( not ( = ?auto_185060 ?auto_185063 ) ) ( not ( = ?auto_185060 ?auto_185064 ) ) ( not ( = ?auto_185060 ?auto_185065 ) ) ( not ( = ?auto_185060 ?auto_185066 ) ) ( not ( = ?auto_185061 ?auto_185062 ) ) ( not ( = ?auto_185061 ?auto_185063 ) ) ( not ( = ?auto_185061 ?auto_185064 ) ) ( not ( = ?auto_185061 ?auto_185065 ) ) ( not ( = ?auto_185061 ?auto_185066 ) ) ( not ( = ?auto_185062 ?auto_185063 ) ) ( not ( = ?auto_185062 ?auto_185064 ) ) ( not ( = ?auto_185062 ?auto_185065 ) ) ( not ( = ?auto_185062 ?auto_185066 ) ) ( not ( = ?auto_185063 ?auto_185064 ) ) ( not ( = ?auto_185063 ?auto_185065 ) ) ( not ( = ?auto_185063 ?auto_185066 ) ) ( not ( = ?auto_185064 ?auto_185065 ) ) ( not ( = ?auto_185064 ?auto_185066 ) ) ( not ( = ?auto_185065 ?auto_185066 ) ) ( not ( = ?auto_185060 ?auto_185068 ) ) ( not ( = ?auto_185061 ?auto_185068 ) ) ( not ( = ?auto_185062 ?auto_185068 ) ) ( not ( = ?auto_185063 ?auto_185068 ) ) ( not ( = ?auto_185064 ?auto_185068 ) ) ( not ( = ?auto_185065 ?auto_185068 ) ) ( not ( = ?auto_185066 ?auto_185068 ) ) ( ON ?auto_185068 ?auto_185067 ) ( not ( = ?auto_185060 ?auto_185067 ) ) ( not ( = ?auto_185061 ?auto_185067 ) ) ( not ( = ?auto_185062 ?auto_185067 ) ) ( not ( = ?auto_185063 ?auto_185067 ) ) ( not ( = ?auto_185064 ?auto_185067 ) ) ( not ( = ?auto_185065 ?auto_185067 ) ) ( not ( = ?auto_185066 ?auto_185067 ) ) ( not ( = ?auto_185068 ?auto_185067 ) ) ( ON ?auto_185066 ?auto_185068 ) ( ON ?auto_185065 ?auto_185066 ) ( CLEAR ?auto_185065 ) ( ON-TABLE ?auto_185067 ) ( HOLDING ?auto_185064 ) ( CLEAR ?auto_185063 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185060 ?auto_185061 ?auto_185062 ?auto_185063 ?auto_185064 )
      ( MAKE-6PILE ?auto_185060 ?auto_185061 ?auto_185062 ?auto_185063 ?auto_185064 ?auto_185065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185069 - BLOCK
      ?auto_185070 - BLOCK
      ?auto_185071 - BLOCK
      ?auto_185072 - BLOCK
      ?auto_185073 - BLOCK
      ?auto_185074 - BLOCK
    )
    :vars
    (
      ?auto_185077 - BLOCK
      ?auto_185076 - BLOCK
      ?auto_185075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185069 ) ( ON ?auto_185070 ?auto_185069 ) ( ON ?auto_185071 ?auto_185070 ) ( ON ?auto_185072 ?auto_185071 ) ( not ( = ?auto_185069 ?auto_185070 ) ) ( not ( = ?auto_185069 ?auto_185071 ) ) ( not ( = ?auto_185069 ?auto_185072 ) ) ( not ( = ?auto_185069 ?auto_185073 ) ) ( not ( = ?auto_185069 ?auto_185074 ) ) ( not ( = ?auto_185069 ?auto_185077 ) ) ( not ( = ?auto_185070 ?auto_185071 ) ) ( not ( = ?auto_185070 ?auto_185072 ) ) ( not ( = ?auto_185070 ?auto_185073 ) ) ( not ( = ?auto_185070 ?auto_185074 ) ) ( not ( = ?auto_185070 ?auto_185077 ) ) ( not ( = ?auto_185071 ?auto_185072 ) ) ( not ( = ?auto_185071 ?auto_185073 ) ) ( not ( = ?auto_185071 ?auto_185074 ) ) ( not ( = ?auto_185071 ?auto_185077 ) ) ( not ( = ?auto_185072 ?auto_185073 ) ) ( not ( = ?auto_185072 ?auto_185074 ) ) ( not ( = ?auto_185072 ?auto_185077 ) ) ( not ( = ?auto_185073 ?auto_185074 ) ) ( not ( = ?auto_185073 ?auto_185077 ) ) ( not ( = ?auto_185074 ?auto_185077 ) ) ( not ( = ?auto_185069 ?auto_185076 ) ) ( not ( = ?auto_185070 ?auto_185076 ) ) ( not ( = ?auto_185071 ?auto_185076 ) ) ( not ( = ?auto_185072 ?auto_185076 ) ) ( not ( = ?auto_185073 ?auto_185076 ) ) ( not ( = ?auto_185074 ?auto_185076 ) ) ( not ( = ?auto_185077 ?auto_185076 ) ) ( ON ?auto_185076 ?auto_185075 ) ( not ( = ?auto_185069 ?auto_185075 ) ) ( not ( = ?auto_185070 ?auto_185075 ) ) ( not ( = ?auto_185071 ?auto_185075 ) ) ( not ( = ?auto_185072 ?auto_185075 ) ) ( not ( = ?auto_185073 ?auto_185075 ) ) ( not ( = ?auto_185074 ?auto_185075 ) ) ( not ( = ?auto_185077 ?auto_185075 ) ) ( not ( = ?auto_185076 ?auto_185075 ) ) ( ON ?auto_185077 ?auto_185076 ) ( ON ?auto_185074 ?auto_185077 ) ( ON-TABLE ?auto_185075 ) ( CLEAR ?auto_185072 ) ( ON ?auto_185073 ?auto_185074 ) ( CLEAR ?auto_185073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185075 ?auto_185076 ?auto_185077 ?auto_185074 )
      ( MAKE-6PILE ?auto_185069 ?auto_185070 ?auto_185071 ?auto_185072 ?auto_185073 ?auto_185074 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185078 - BLOCK
      ?auto_185079 - BLOCK
      ?auto_185080 - BLOCK
      ?auto_185081 - BLOCK
      ?auto_185082 - BLOCK
      ?auto_185083 - BLOCK
    )
    :vars
    (
      ?auto_185084 - BLOCK
      ?auto_185086 - BLOCK
      ?auto_185085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185078 ) ( ON ?auto_185079 ?auto_185078 ) ( ON ?auto_185080 ?auto_185079 ) ( not ( = ?auto_185078 ?auto_185079 ) ) ( not ( = ?auto_185078 ?auto_185080 ) ) ( not ( = ?auto_185078 ?auto_185081 ) ) ( not ( = ?auto_185078 ?auto_185082 ) ) ( not ( = ?auto_185078 ?auto_185083 ) ) ( not ( = ?auto_185078 ?auto_185084 ) ) ( not ( = ?auto_185079 ?auto_185080 ) ) ( not ( = ?auto_185079 ?auto_185081 ) ) ( not ( = ?auto_185079 ?auto_185082 ) ) ( not ( = ?auto_185079 ?auto_185083 ) ) ( not ( = ?auto_185079 ?auto_185084 ) ) ( not ( = ?auto_185080 ?auto_185081 ) ) ( not ( = ?auto_185080 ?auto_185082 ) ) ( not ( = ?auto_185080 ?auto_185083 ) ) ( not ( = ?auto_185080 ?auto_185084 ) ) ( not ( = ?auto_185081 ?auto_185082 ) ) ( not ( = ?auto_185081 ?auto_185083 ) ) ( not ( = ?auto_185081 ?auto_185084 ) ) ( not ( = ?auto_185082 ?auto_185083 ) ) ( not ( = ?auto_185082 ?auto_185084 ) ) ( not ( = ?auto_185083 ?auto_185084 ) ) ( not ( = ?auto_185078 ?auto_185086 ) ) ( not ( = ?auto_185079 ?auto_185086 ) ) ( not ( = ?auto_185080 ?auto_185086 ) ) ( not ( = ?auto_185081 ?auto_185086 ) ) ( not ( = ?auto_185082 ?auto_185086 ) ) ( not ( = ?auto_185083 ?auto_185086 ) ) ( not ( = ?auto_185084 ?auto_185086 ) ) ( ON ?auto_185086 ?auto_185085 ) ( not ( = ?auto_185078 ?auto_185085 ) ) ( not ( = ?auto_185079 ?auto_185085 ) ) ( not ( = ?auto_185080 ?auto_185085 ) ) ( not ( = ?auto_185081 ?auto_185085 ) ) ( not ( = ?auto_185082 ?auto_185085 ) ) ( not ( = ?auto_185083 ?auto_185085 ) ) ( not ( = ?auto_185084 ?auto_185085 ) ) ( not ( = ?auto_185086 ?auto_185085 ) ) ( ON ?auto_185084 ?auto_185086 ) ( ON ?auto_185083 ?auto_185084 ) ( ON-TABLE ?auto_185085 ) ( ON ?auto_185082 ?auto_185083 ) ( CLEAR ?auto_185082 ) ( HOLDING ?auto_185081 ) ( CLEAR ?auto_185080 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185078 ?auto_185079 ?auto_185080 ?auto_185081 )
      ( MAKE-6PILE ?auto_185078 ?auto_185079 ?auto_185080 ?auto_185081 ?auto_185082 ?auto_185083 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185087 - BLOCK
      ?auto_185088 - BLOCK
      ?auto_185089 - BLOCK
      ?auto_185090 - BLOCK
      ?auto_185091 - BLOCK
      ?auto_185092 - BLOCK
    )
    :vars
    (
      ?auto_185095 - BLOCK
      ?auto_185093 - BLOCK
      ?auto_185094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185087 ) ( ON ?auto_185088 ?auto_185087 ) ( ON ?auto_185089 ?auto_185088 ) ( not ( = ?auto_185087 ?auto_185088 ) ) ( not ( = ?auto_185087 ?auto_185089 ) ) ( not ( = ?auto_185087 ?auto_185090 ) ) ( not ( = ?auto_185087 ?auto_185091 ) ) ( not ( = ?auto_185087 ?auto_185092 ) ) ( not ( = ?auto_185087 ?auto_185095 ) ) ( not ( = ?auto_185088 ?auto_185089 ) ) ( not ( = ?auto_185088 ?auto_185090 ) ) ( not ( = ?auto_185088 ?auto_185091 ) ) ( not ( = ?auto_185088 ?auto_185092 ) ) ( not ( = ?auto_185088 ?auto_185095 ) ) ( not ( = ?auto_185089 ?auto_185090 ) ) ( not ( = ?auto_185089 ?auto_185091 ) ) ( not ( = ?auto_185089 ?auto_185092 ) ) ( not ( = ?auto_185089 ?auto_185095 ) ) ( not ( = ?auto_185090 ?auto_185091 ) ) ( not ( = ?auto_185090 ?auto_185092 ) ) ( not ( = ?auto_185090 ?auto_185095 ) ) ( not ( = ?auto_185091 ?auto_185092 ) ) ( not ( = ?auto_185091 ?auto_185095 ) ) ( not ( = ?auto_185092 ?auto_185095 ) ) ( not ( = ?auto_185087 ?auto_185093 ) ) ( not ( = ?auto_185088 ?auto_185093 ) ) ( not ( = ?auto_185089 ?auto_185093 ) ) ( not ( = ?auto_185090 ?auto_185093 ) ) ( not ( = ?auto_185091 ?auto_185093 ) ) ( not ( = ?auto_185092 ?auto_185093 ) ) ( not ( = ?auto_185095 ?auto_185093 ) ) ( ON ?auto_185093 ?auto_185094 ) ( not ( = ?auto_185087 ?auto_185094 ) ) ( not ( = ?auto_185088 ?auto_185094 ) ) ( not ( = ?auto_185089 ?auto_185094 ) ) ( not ( = ?auto_185090 ?auto_185094 ) ) ( not ( = ?auto_185091 ?auto_185094 ) ) ( not ( = ?auto_185092 ?auto_185094 ) ) ( not ( = ?auto_185095 ?auto_185094 ) ) ( not ( = ?auto_185093 ?auto_185094 ) ) ( ON ?auto_185095 ?auto_185093 ) ( ON ?auto_185092 ?auto_185095 ) ( ON-TABLE ?auto_185094 ) ( ON ?auto_185091 ?auto_185092 ) ( CLEAR ?auto_185089 ) ( ON ?auto_185090 ?auto_185091 ) ( CLEAR ?auto_185090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185094 ?auto_185093 ?auto_185095 ?auto_185092 ?auto_185091 )
      ( MAKE-6PILE ?auto_185087 ?auto_185088 ?auto_185089 ?auto_185090 ?auto_185091 ?auto_185092 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185096 - BLOCK
      ?auto_185097 - BLOCK
      ?auto_185098 - BLOCK
      ?auto_185099 - BLOCK
      ?auto_185100 - BLOCK
      ?auto_185101 - BLOCK
    )
    :vars
    (
      ?auto_185102 - BLOCK
      ?auto_185103 - BLOCK
      ?auto_185104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185096 ) ( ON ?auto_185097 ?auto_185096 ) ( not ( = ?auto_185096 ?auto_185097 ) ) ( not ( = ?auto_185096 ?auto_185098 ) ) ( not ( = ?auto_185096 ?auto_185099 ) ) ( not ( = ?auto_185096 ?auto_185100 ) ) ( not ( = ?auto_185096 ?auto_185101 ) ) ( not ( = ?auto_185096 ?auto_185102 ) ) ( not ( = ?auto_185097 ?auto_185098 ) ) ( not ( = ?auto_185097 ?auto_185099 ) ) ( not ( = ?auto_185097 ?auto_185100 ) ) ( not ( = ?auto_185097 ?auto_185101 ) ) ( not ( = ?auto_185097 ?auto_185102 ) ) ( not ( = ?auto_185098 ?auto_185099 ) ) ( not ( = ?auto_185098 ?auto_185100 ) ) ( not ( = ?auto_185098 ?auto_185101 ) ) ( not ( = ?auto_185098 ?auto_185102 ) ) ( not ( = ?auto_185099 ?auto_185100 ) ) ( not ( = ?auto_185099 ?auto_185101 ) ) ( not ( = ?auto_185099 ?auto_185102 ) ) ( not ( = ?auto_185100 ?auto_185101 ) ) ( not ( = ?auto_185100 ?auto_185102 ) ) ( not ( = ?auto_185101 ?auto_185102 ) ) ( not ( = ?auto_185096 ?auto_185103 ) ) ( not ( = ?auto_185097 ?auto_185103 ) ) ( not ( = ?auto_185098 ?auto_185103 ) ) ( not ( = ?auto_185099 ?auto_185103 ) ) ( not ( = ?auto_185100 ?auto_185103 ) ) ( not ( = ?auto_185101 ?auto_185103 ) ) ( not ( = ?auto_185102 ?auto_185103 ) ) ( ON ?auto_185103 ?auto_185104 ) ( not ( = ?auto_185096 ?auto_185104 ) ) ( not ( = ?auto_185097 ?auto_185104 ) ) ( not ( = ?auto_185098 ?auto_185104 ) ) ( not ( = ?auto_185099 ?auto_185104 ) ) ( not ( = ?auto_185100 ?auto_185104 ) ) ( not ( = ?auto_185101 ?auto_185104 ) ) ( not ( = ?auto_185102 ?auto_185104 ) ) ( not ( = ?auto_185103 ?auto_185104 ) ) ( ON ?auto_185102 ?auto_185103 ) ( ON ?auto_185101 ?auto_185102 ) ( ON-TABLE ?auto_185104 ) ( ON ?auto_185100 ?auto_185101 ) ( ON ?auto_185099 ?auto_185100 ) ( CLEAR ?auto_185099 ) ( HOLDING ?auto_185098 ) ( CLEAR ?auto_185097 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185096 ?auto_185097 ?auto_185098 )
      ( MAKE-6PILE ?auto_185096 ?auto_185097 ?auto_185098 ?auto_185099 ?auto_185100 ?auto_185101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185105 - BLOCK
      ?auto_185106 - BLOCK
      ?auto_185107 - BLOCK
      ?auto_185108 - BLOCK
      ?auto_185109 - BLOCK
      ?auto_185110 - BLOCK
    )
    :vars
    (
      ?auto_185112 - BLOCK
      ?auto_185111 - BLOCK
      ?auto_185113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185105 ) ( ON ?auto_185106 ?auto_185105 ) ( not ( = ?auto_185105 ?auto_185106 ) ) ( not ( = ?auto_185105 ?auto_185107 ) ) ( not ( = ?auto_185105 ?auto_185108 ) ) ( not ( = ?auto_185105 ?auto_185109 ) ) ( not ( = ?auto_185105 ?auto_185110 ) ) ( not ( = ?auto_185105 ?auto_185112 ) ) ( not ( = ?auto_185106 ?auto_185107 ) ) ( not ( = ?auto_185106 ?auto_185108 ) ) ( not ( = ?auto_185106 ?auto_185109 ) ) ( not ( = ?auto_185106 ?auto_185110 ) ) ( not ( = ?auto_185106 ?auto_185112 ) ) ( not ( = ?auto_185107 ?auto_185108 ) ) ( not ( = ?auto_185107 ?auto_185109 ) ) ( not ( = ?auto_185107 ?auto_185110 ) ) ( not ( = ?auto_185107 ?auto_185112 ) ) ( not ( = ?auto_185108 ?auto_185109 ) ) ( not ( = ?auto_185108 ?auto_185110 ) ) ( not ( = ?auto_185108 ?auto_185112 ) ) ( not ( = ?auto_185109 ?auto_185110 ) ) ( not ( = ?auto_185109 ?auto_185112 ) ) ( not ( = ?auto_185110 ?auto_185112 ) ) ( not ( = ?auto_185105 ?auto_185111 ) ) ( not ( = ?auto_185106 ?auto_185111 ) ) ( not ( = ?auto_185107 ?auto_185111 ) ) ( not ( = ?auto_185108 ?auto_185111 ) ) ( not ( = ?auto_185109 ?auto_185111 ) ) ( not ( = ?auto_185110 ?auto_185111 ) ) ( not ( = ?auto_185112 ?auto_185111 ) ) ( ON ?auto_185111 ?auto_185113 ) ( not ( = ?auto_185105 ?auto_185113 ) ) ( not ( = ?auto_185106 ?auto_185113 ) ) ( not ( = ?auto_185107 ?auto_185113 ) ) ( not ( = ?auto_185108 ?auto_185113 ) ) ( not ( = ?auto_185109 ?auto_185113 ) ) ( not ( = ?auto_185110 ?auto_185113 ) ) ( not ( = ?auto_185112 ?auto_185113 ) ) ( not ( = ?auto_185111 ?auto_185113 ) ) ( ON ?auto_185112 ?auto_185111 ) ( ON ?auto_185110 ?auto_185112 ) ( ON-TABLE ?auto_185113 ) ( ON ?auto_185109 ?auto_185110 ) ( ON ?auto_185108 ?auto_185109 ) ( CLEAR ?auto_185106 ) ( ON ?auto_185107 ?auto_185108 ) ( CLEAR ?auto_185107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185113 ?auto_185111 ?auto_185112 ?auto_185110 ?auto_185109 ?auto_185108 )
      ( MAKE-6PILE ?auto_185105 ?auto_185106 ?auto_185107 ?auto_185108 ?auto_185109 ?auto_185110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185114 - BLOCK
      ?auto_185115 - BLOCK
      ?auto_185116 - BLOCK
      ?auto_185117 - BLOCK
      ?auto_185118 - BLOCK
      ?auto_185119 - BLOCK
    )
    :vars
    (
      ?auto_185120 - BLOCK
      ?auto_185121 - BLOCK
      ?auto_185122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185114 ) ( not ( = ?auto_185114 ?auto_185115 ) ) ( not ( = ?auto_185114 ?auto_185116 ) ) ( not ( = ?auto_185114 ?auto_185117 ) ) ( not ( = ?auto_185114 ?auto_185118 ) ) ( not ( = ?auto_185114 ?auto_185119 ) ) ( not ( = ?auto_185114 ?auto_185120 ) ) ( not ( = ?auto_185115 ?auto_185116 ) ) ( not ( = ?auto_185115 ?auto_185117 ) ) ( not ( = ?auto_185115 ?auto_185118 ) ) ( not ( = ?auto_185115 ?auto_185119 ) ) ( not ( = ?auto_185115 ?auto_185120 ) ) ( not ( = ?auto_185116 ?auto_185117 ) ) ( not ( = ?auto_185116 ?auto_185118 ) ) ( not ( = ?auto_185116 ?auto_185119 ) ) ( not ( = ?auto_185116 ?auto_185120 ) ) ( not ( = ?auto_185117 ?auto_185118 ) ) ( not ( = ?auto_185117 ?auto_185119 ) ) ( not ( = ?auto_185117 ?auto_185120 ) ) ( not ( = ?auto_185118 ?auto_185119 ) ) ( not ( = ?auto_185118 ?auto_185120 ) ) ( not ( = ?auto_185119 ?auto_185120 ) ) ( not ( = ?auto_185114 ?auto_185121 ) ) ( not ( = ?auto_185115 ?auto_185121 ) ) ( not ( = ?auto_185116 ?auto_185121 ) ) ( not ( = ?auto_185117 ?auto_185121 ) ) ( not ( = ?auto_185118 ?auto_185121 ) ) ( not ( = ?auto_185119 ?auto_185121 ) ) ( not ( = ?auto_185120 ?auto_185121 ) ) ( ON ?auto_185121 ?auto_185122 ) ( not ( = ?auto_185114 ?auto_185122 ) ) ( not ( = ?auto_185115 ?auto_185122 ) ) ( not ( = ?auto_185116 ?auto_185122 ) ) ( not ( = ?auto_185117 ?auto_185122 ) ) ( not ( = ?auto_185118 ?auto_185122 ) ) ( not ( = ?auto_185119 ?auto_185122 ) ) ( not ( = ?auto_185120 ?auto_185122 ) ) ( not ( = ?auto_185121 ?auto_185122 ) ) ( ON ?auto_185120 ?auto_185121 ) ( ON ?auto_185119 ?auto_185120 ) ( ON-TABLE ?auto_185122 ) ( ON ?auto_185118 ?auto_185119 ) ( ON ?auto_185117 ?auto_185118 ) ( ON ?auto_185116 ?auto_185117 ) ( CLEAR ?auto_185116 ) ( HOLDING ?auto_185115 ) ( CLEAR ?auto_185114 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185114 ?auto_185115 )
      ( MAKE-6PILE ?auto_185114 ?auto_185115 ?auto_185116 ?auto_185117 ?auto_185118 ?auto_185119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185123 - BLOCK
      ?auto_185124 - BLOCK
      ?auto_185125 - BLOCK
      ?auto_185126 - BLOCK
      ?auto_185127 - BLOCK
      ?auto_185128 - BLOCK
    )
    :vars
    (
      ?auto_185129 - BLOCK
      ?auto_185130 - BLOCK
      ?auto_185131 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185123 ) ( not ( = ?auto_185123 ?auto_185124 ) ) ( not ( = ?auto_185123 ?auto_185125 ) ) ( not ( = ?auto_185123 ?auto_185126 ) ) ( not ( = ?auto_185123 ?auto_185127 ) ) ( not ( = ?auto_185123 ?auto_185128 ) ) ( not ( = ?auto_185123 ?auto_185129 ) ) ( not ( = ?auto_185124 ?auto_185125 ) ) ( not ( = ?auto_185124 ?auto_185126 ) ) ( not ( = ?auto_185124 ?auto_185127 ) ) ( not ( = ?auto_185124 ?auto_185128 ) ) ( not ( = ?auto_185124 ?auto_185129 ) ) ( not ( = ?auto_185125 ?auto_185126 ) ) ( not ( = ?auto_185125 ?auto_185127 ) ) ( not ( = ?auto_185125 ?auto_185128 ) ) ( not ( = ?auto_185125 ?auto_185129 ) ) ( not ( = ?auto_185126 ?auto_185127 ) ) ( not ( = ?auto_185126 ?auto_185128 ) ) ( not ( = ?auto_185126 ?auto_185129 ) ) ( not ( = ?auto_185127 ?auto_185128 ) ) ( not ( = ?auto_185127 ?auto_185129 ) ) ( not ( = ?auto_185128 ?auto_185129 ) ) ( not ( = ?auto_185123 ?auto_185130 ) ) ( not ( = ?auto_185124 ?auto_185130 ) ) ( not ( = ?auto_185125 ?auto_185130 ) ) ( not ( = ?auto_185126 ?auto_185130 ) ) ( not ( = ?auto_185127 ?auto_185130 ) ) ( not ( = ?auto_185128 ?auto_185130 ) ) ( not ( = ?auto_185129 ?auto_185130 ) ) ( ON ?auto_185130 ?auto_185131 ) ( not ( = ?auto_185123 ?auto_185131 ) ) ( not ( = ?auto_185124 ?auto_185131 ) ) ( not ( = ?auto_185125 ?auto_185131 ) ) ( not ( = ?auto_185126 ?auto_185131 ) ) ( not ( = ?auto_185127 ?auto_185131 ) ) ( not ( = ?auto_185128 ?auto_185131 ) ) ( not ( = ?auto_185129 ?auto_185131 ) ) ( not ( = ?auto_185130 ?auto_185131 ) ) ( ON ?auto_185129 ?auto_185130 ) ( ON ?auto_185128 ?auto_185129 ) ( ON-TABLE ?auto_185131 ) ( ON ?auto_185127 ?auto_185128 ) ( ON ?auto_185126 ?auto_185127 ) ( ON ?auto_185125 ?auto_185126 ) ( CLEAR ?auto_185123 ) ( ON ?auto_185124 ?auto_185125 ) ( CLEAR ?auto_185124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185131 ?auto_185130 ?auto_185129 ?auto_185128 ?auto_185127 ?auto_185126 ?auto_185125 )
      ( MAKE-6PILE ?auto_185123 ?auto_185124 ?auto_185125 ?auto_185126 ?auto_185127 ?auto_185128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185132 - BLOCK
      ?auto_185133 - BLOCK
      ?auto_185134 - BLOCK
      ?auto_185135 - BLOCK
      ?auto_185136 - BLOCK
      ?auto_185137 - BLOCK
    )
    :vars
    (
      ?auto_185138 - BLOCK
      ?auto_185139 - BLOCK
      ?auto_185140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185132 ?auto_185133 ) ) ( not ( = ?auto_185132 ?auto_185134 ) ) ( not ( = ?auto_185132 ?auto_185135 ) ) ( not ( = ?auto_185132 ?auto_185136 ) ) ( not ( = ?auto_185132 ?auto_185137 ) ) ( not ( = ?auto_185132 ?auto_185138 ) ) ( not ( = ?auto_185133 ?auto_185134 ) ) ( not ( = ?auto_185133 ?auto_185135 ) ) ( not ( = ?auto_185133 ?auto_185136 ) ) ( not ( = ?auto_185133 ?auto_185137 ) ) ( not ( = ?auto_185133 ?auto_185138 ) ) ( not ( = ?auto_185134 ?auto_185135 ) ) ( not ( = ?auto_185134 ?auto_185136 ) ) ( not ( = ?auto_185134 ?auto_185137 ) ) ( not ( = ?auto_185134 ?auto_185138 ) ) ( not ( = ?auto_185135 ?auto_185136 ) ) ( not ( = ?auto_185135 ?auto_185137 ) ) ( not ( = ?auto_185135 ?auto_185138 ) ) ( not ( = ?auto_185136 ?auto_185137 ) ) ( not ( = ?auto_185136 ?auto_185138 ) ) ( not ( = ?auto_185137 ?auto_185138 ) ) ( not ( = ?auto_185132 ?auto_185139 ) ) ( not ( = ?auto_185133 ?auto_185139 ) ) ( not ( = ?auto_185134 ?auto_185139 ) ) ( not ( = ?auto_185135 ?auto_185139 ) ) ( not ( = ?auto_185136 ?auto_185139 ) ) ( not ( = ?auto_185137 ?auto_185139 ) ) ( not ( = ?auto_185138 ?auto_185139 ) ) ( ON ?auto_185139 ?auto_185140 ) ( not ( = ?auto_185132 ?auto_185140 ) ) ( not ( = ?auto_185133 ?auto_185140 ) ) ( not ( = ?auto_185134 ?auto_185140 ) ) ( not ( = ?auto_185135 ?auto_185140 ) ) ( not ( = ?auto_185136 ?auto_185140 ) ) ( not ( = ?auto_185137 ?auto_185140 ) ) ( not ( = ?auto_185138 ?auto_185140 ) ) ( not ( = ?auto_185139 ?auto_185140 ) ) ( ON ?auto_185138 ?auto_185139 ) ( ON ?auto_185137 ?auto_185138 ) ( ON-TABLE ?auto_185140 ) ( ON ?auto_185136 ?auto_185137 ) ( ON ?auto_185135 ?auto_185136 ) ( ON ?auto_185134 ?auto_185135 ) ( ON ?auto_185133 ?auto_185134 ) ( CLEAR ?auto_185133 ) ( HOLDING ?auto_185132 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185132 )
      ( MAKE-6PILE ?auto_185132 ?auto_185133 ?auto_185134 ?auto_185135 ?auto_185136 ?auto_185137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185141 - BLOCK
      ?auto_185142 - BLOCK
      ?auto_185143 - BLOCK
      ?auto_185144 - BLOCK
      ?auto_185145 - BLOCK
      ?auto_185146 - BLOCK
    )
    :vars
    (
      ?auto_185147 - BLOCK
      ?auto_185149 - BLOCK
      ?auto_185148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185141 ?auto_185142 ) ) ( not ( = ?auto_185141 ?auto_185143 ) ) ( not ( = ?auto_185141 ?auto_185144 ) ) ( not ( = ?auto_185141 ?auto_185145 ) ) ( not ( = ?auto_185141 ?auto_185146 ) ) ( not ( = ?auto_185141 ?auto_185147 ) ) ( not ( = ?auto_185142 ?auto_185143 ) ) ( not ( = ?auto_185142 ?auto_185144 ) ) ( not ( = ?auto_185142 ?auto_185145 ) ) ( not ( = ?auto_185142 ?auto_185146 ) ) ( not ( = ?auto_185142 ?auto_185147 ) ) ( not ( = ?auto_185143 ?auto_185144 ) ) ( not ( = ?auto_185143 ?auto_185145 ) ) ( not ( = ?auto_185143 ?auto_185146 ) ) ( not ( = ?auto_185143 ?auto_185147 ) ) ( not ( = ?auto_185144 ?auto_185145 ) ) ( not ( = ?auto_185144 ?auto_185146 ) ) ( not ( = ?auto_185144 ?auto_185147 ) ) ( not ( = ?auto_185145 ?auto_185146 ) ) ( not ( = ?auto_185145 ?auto_185147 ) ) ( not ( = ?auto_185146 ?auto_185147 ) ) ( not ( = ?auto_185141 ?auto_185149 ) ) ( not ( = ?auto_185142 ?auto_185149 ) ) ( not ( = ?auto_185143 ?auto_185149 ) ) ( not ( = ?auto_185144 ?auto_185149 ) ) ( not ( = ?auto_185145 ?auto_185149 ) ) ( not ( = ?auto_185146 ?auto_185149 ) ) ( not ( = ?auto_185147 ?auto_185149 ) ) ( ON ?auto_185149 ?auto_185148 ) ( not ( = ?auto_185141 ?auto_185148 ) ) ( not ( = ?auto_185142 ?auto_185148 ) ) ( not ( = ?auto_185143 ?auto_185148 ) ) ( not ( = ?auto_185144 ?auto_185148 ) ) ( not ( = ?auto_185145 ?auto_185148 ) ) ( not ( = ?auto_185146 ?auto_185148 ) ) ( not ( = ?auto_185147 ?auto_185148 ) ) ( not ( = ?auto_185149 ?auto_185148 ) ) ( ON ?auto_185147 ?auto_185149 ) ( ON ?auto_185146 ?auto_185147 ) ( ON-TABLE ?auto_185148 ) ( ON ?auto_185145 ?auto_185146 ) ( ON ?auto_185144 ?auto_185145 ) ( ON ?auto_185143 ?auto_185144 ) ( ON ?auto_185142 ?auto_185143 ) ( ON ?auto_185141 ?auto_185142 ) ( CLEAR ?auto_185141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185148 ?auto_185149 ?auto_185147 ?auto_185146 ?auto_185145 ?auto_185144 ?auto_185143 ?auto_185142 )
      ( MAKE-6PILE ?auto_185141 ?auto_185142 ?auto_185143 ?auto_185144 ?auto_185145 ?auto_185146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185152 - BLOCK
      ?auto_185153 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_185153 ) ( CLEAR ?auto_185152 ) ( ON-TABLE ?auto_185152 ) ( not ( = ?auto_185152 ?auto_185153 ) ) )
    :subtasks
    ( ( !STACK ?auto_185153 ?auto_185152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185154 - BLOCK
      ?auto_185155 - BLOCK
    )
    :vars
    (
      ?auto_185156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_185154 ) ( ON-TABLE ?auto_185154 ) ( not ( = ?auto_185154 ?auto_185155 ) ) ( ON ?auto_185155 ?auto_185156 ) ( CLEAR ?auto_185155 ) ( HAND-EMPTY ) ( not ( = ?auto_185154 ?auto_185156 ) ) ( not ( = ?auto_185155 ?auto_185156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185155 ?auto_185156 )
      ( MAKE-2PILE ?auto_185154 ?auto_185155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185157 - BLOCK
      ?auto_185158 - BLOCK
    )
    :vars
    (
      ?auto_185159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185157 ?auto_185158 ) ) ( ON ?auto_185158 ?auto_185159 ) ( CLEAR ?auto_185158 ) ( not ( = ?auto_185157 ?auto_185159 ) ) ( not ( = ?auto_185158 ?auto_185159 ) ) ( HOLDING ?auto_185157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185157 )
      ( MAKE-2PILE ?auto_185157 ?auto_185158 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185160 - BLOCK
      ?auto_185161 - BLOCK
    )
    :vars
    (
      ?auto_185162 - BLOCK
      ?auto_185163 - BLOCK
      ?auto_185166 - BLOCK
      ?auto_185165 - BLOCK
      ?auto_185167 - BLOCK
      ?auto_185164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185160 ?auto_185161 ) ) ( ON ?auto_185161 ?auto_185162 ) ( not ( = ?auto_185160 ?auto_185162 ) ) ( not ( = ?auto_185161 ?auto_185162 ) ) ( ON ?auto_185160 ?auto_185161 ) ( CLEAR ?auto_185160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185163 ) ( ON ?auto_185166 ?auto_185163 ) ( ON ?auto_185165 ?auto_185166 ) ( ON ?auto_185167 ?auto_185165 ) ( ON ?auto_185164 ?auto_185167 ) ( ON ?auto_185162 ?auto_185164 ) ( not ( = ?auto_185163 ?auto_185166 ) ) ( not ( = ?auto_185163 ?auto_185165 ) ) ( not ( = ?auto_185163 ?auto_185167 ) ) ( not ( = ?auto_185163 ?auto_185164 ) ) ( not ( = ?auto_185163 ?auto_185162 ) ) ( not ( = ?auto_185163 ?auto_185161 ) ) ( not ( = ?auto_185163 ?auto_185160 ) ) ( not ( = ?auto_185166 ?auto_185165 ) ) ( not ( = ?auto_185166 ?auto_185167 ) ) ( not ( = ?auto_185166 ?auto_185164 ) ) ( not ( = ?auto_185166 ?auto_185162 ) ) ( not ( = ?auto_185166 ?auto_185161 ) ) ( not ( = ?auto_185166 ?auto_185160 ) ) ( not ( = ?auto_185165 ?auto_185167 ) ) ( not ( = ?auto_185165 ?auto_185164 ) ) ( not ( = ?auto_185165 ?auto_185162 ) ) ( not ( = ?auto_185165 ?auto_185161 ) ) ( not ( = ?auto_185165 ?auto_185160 ) ) ( not ( = ?auto_185167 ?auto_185164 ) ) ( not ( = ?auto_185167 ?auto_185162 ) ) ( not ( = ?auto_185167 ?auto_185161 ) ) ( not ( = ?auto_185167 ?auto_185160 ) ) ( not ( = ?auto_185164 ?auto_185162 ) ) ( not ( = ?auto_185164 ?auto_185161 ) ) ( not ( = ?auto_185164 ?auto_185160 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185163 ?auto_185166 ?auto_185165 ?auto_185167 ?auto_185164 ?auto_185162 ?auto_185161 )
      ( MAKE-2PILE ?auto_185160 ?auto_185161 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185168 - BLOCK
      ?auto_185169 - BLOCK
    )
    :vars
    (
      ?auto_185171 - BLOCK
      ?auto_185172 - BLOCK
      ?auto_185170 - BLOCK
      ?auto_185174 - BLOCK
      ?auto_185173 - BLOCK
      ?auto_185175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185168 ?auto_185169 ) ) ( ON ?auto_185169 ?auto_185171 ) ( not ( = ?auto_185168 ?auto_185171 ) ) ( not ( = ?auto_185169 ?auto_185171 ) ) ( ON-TABLE ?auto_185172 ) ( ON ?auto_185170 ?auto_185172 ) ( ON ?auto_185174 ?auto_185170 ) ( ON ?auto_185173 ?auto_185174 ) ( ON ?auto_185175 ?auto_185173 ) ( ON ?auto_185171 ?auto_185175 ) ( not ( = ?auto_185172 ?auto_185170 ) ) ( not ( = ?auto_185172 ?auto_185174 ) ) ( not ( = ?auto_185172 ?auto_185173 ) ) ( not ( = ?auto_185172 ?auto_185175 ) ) ( not ( = ?auto_185172 ?auto_185171 ) ) ( not ( = ?auto_185172 ?auto_185169 ) ) ( not ( = ?auto_185172 ?auto_185168 ) ) ( not ( = ?auto_185170 ?auto_185174 ) ) ( not ( = ?auto_185170 ?auto_185173 ) ) ( not ( = ?auto_185170 ?auto_185175 ) ) ( not ( = ?auto_185170 ?auto_185171 ) ) ( not ( = ?auto_185170 ?auto_185169 ) ) ( not ( = ?auto_185170 ?auto_185168 ) ) ( not ( = ?auto_185174 ?auto_185173 ) ) ( not ( = ?auto_185174 ?auto_185175 ) ) ( not ( = ?auto_185174 ?auto_185171 ) ) ( not ( = ?auto_185174 ?auto_185169 ) ) ( not ( = ?auto_185174 ?auto_185168 ) ) ( not ( = ?auto_185173 ?auto_185175 ) ) ( not ( = ?auto_185173 ?auto_185171 ) ) ( not ( = ?auto_185173 ?auto_185169 ) ) ( not ( = ?auto_185173 ?auto_185168 ) ) ( not ( = ?auto_185175 ?auto_185171 ) ) ( not ( = ?auto_185175 ?auto_185169 ) ) ( not ( = ?auto_185175 ?auto_185168 ) ) ( HOLDING ?auto_185168 ) ( CLEAR ?auto_185169 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185172 ?auto_185170 ?auto_185174 ?auto_185173 ?auto_185175 ?auto_185171 ?auto_185169 ?auto_185168 )
      ( MAKE-2PILE ?auto_185168 ?auto_185169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185176 - BLOCK
      ?auto_185177 - BLOCK
    )
    :vars
    (
      ?auto_185181 - BLOCK
      ?auto_185179 - BLOCK
      ?auto_185182 - BLOCK
      ?auto_185180 - BLOCK
      ?auto_185183 - BLOCK
      ?auto_185178 - BLOCK
      ?auto_185184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185176 ?auto_185177 ) ) ( ON ?auto_185177 ?auto_185181 ) ( not ( = ?auto_185176 ?auto_185181 ) ) ( not ( = ?auto_185177 ?auto_185181 ) ) ( ON-TABLE ?auto_185179 ) ( ON ?auto_185182 ?auto_185179 ) ( ON ?auto_185180 ?auto_185182 ) ( ON ?auto_185183 ?auto_185180 ) ( ON ?auto_185178 ?auto_185183 ) ( ON ?auto_185181 ?auto_185178 ) ( not ( = ?auto_185179 ?auto_185182 ) ) ( not ( = ?auto_185179 ?auto_185180 ) ) ( not ( = ?auto_185179 ?auto_185183 ) ) ( not ( = ?auto_185179 ?auto_185178 ) ) ( not ( = ?auto_185179 ?auto_185181 ) ) ( not ( = ?auto_185179 ?auto_185177 ) ) ( not ( = ?auto_185179 ?auto_185176 ) ) ( not ( = ?auto_185182 ?auto_185180 ) ) ( not ( = ?auto_185182 ?auto_185183 ) ) ( not ( = ?auto_185182 ?auto_185178 ) ) ( not ( = ?auto_185182 ?auto_185181 ) ) ( not ( = ?auto_185182 ?auto_185177 ) ) ( not ( = ?auto_185182 ?auto_185176 ) ) ( not ( = ?auto_185180 ?auto_185183 ) ) ( not ( = ?auto_185180 ?auto_185178 ) ) ( not ( = ?auto_185180 ?auto_185181 ) ) ( not ( = ?auto_185180 ?auto_185177 ) ) ( not ( = ?auto_185180 ?auto_185176 ) ) ( not ( = ?auto_185183 ?auto_185178 ) ) ( not ( = ?auto_185183 ?auto_185181 ) ) ( not ( = ?auto_185183 ?auto_185177 ) ) ( not ( = ?auto_185183 ?auto_185176 ) ) ( not ( = ?auto_185178 ?auto_185181 ) ) ( not ( = ?auto_185178 ?auto_185177 ) ) ( not ( = ?auto_185178 ?auto_185176 ) ) ( CLEAR ?auto_185177 ) ( ON ?auto_185176 ?auto_185184 ) ( CLEAR ?auto_185176 ) ( HAND-EMPTY ) ( not ( = ?auto_185176 ?auto_185184 ) ) ( not ( = ?auto_185177 ?auto_185184 ) ) ( not ( = ?auto_185181 ?auto_185184 ) ) ( not ( = ?auto_185179 ?auto_185184 ) ) ( not ( = ?auto_185182 ?auto_185184 ) ) ( not ( = ?auto_185180 ?auto_185184 ) ) ( not ( = ?auto_185183 ?auto_185184 ) ) ( not ( = ?auto_185178 ?auto_185184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185176 ?auto_185184 )
      ( MAKE-2PILE ?auto_185176 ?auto_185177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185185 - BLOCK
      ?auto_185186 - BLOCK
    )
    :vars
    (
      ?auto_185191 - BLOCK
      ?auto_185190 - BLOCK
      ?auto_185192 - BLOCK
      ?auto_185188 - BLOCK
      ?auto_185187 - BLOCK
      ?auto_185193 - BLOCK
      ?auto_185189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185185 ?auto_185186 ) ) ( not ( = ?auto_185185 ?auto_185191 ) ) ( not ( = ?auto_185186 ?auto_185191 ) ) ( ON-TABLE ?auto_185190 ) ( ON ?auto_185192 ?auto_185190 ) ( ON ?auto_185188 ?auto_185192 ) ( ON ?auto_185187 ?auto_185188 ) ( ON ?auto_185193 ?auto_185187 ) ( ON ?auto_185191 ?auto_185193 ) ( not ( = ?auto_185190 ?auto_185192 ) ) ( not ( = ?auto_185190 ?auto_185188 ) ) ( not ( = ?auto_185190 ?auto_185187 ) ) ( not ( = ?auto_185190 ?auto_185193 ) ) ( not ( = ?auto_185190 ?auto_185191 ) ) ( not ( = ?auto_185190 ?auto_185186 ) ) ( not ( = ?auto_185190 ?auto_185185 ) ) ( not ( = ?auto_185192 ?auto_185188 ) ) ( not ( = ?auto_185192 ?auto_185187 ) ) ( not ( = ?auto_185192 ?auto_185193 ) ) ( not ( = ?auto_185192 ?auto_185191 ) ) ( not ( = ?auto_185192 ?auto_185186 ) ) ( not ( = ?auto_185192 ?auto_185185 ) ) ( not ( = ?auto_185188 ?auto_185187 ) ) ( not ( = ?auto_185188 ?auto_185193 ) ) ( not ( = ?auto_185188 ?auto_185191 ) ) ( not ( = ?auto_185188 ?auto_185186 ) ) ( not ( = ?auto_185188 ?auto_185185 ) ) ( not ( = ?auto_185187 ?auto_185193 ) ) ( not ( = ?auto_185187 ?auto_185191 ) ) ( not ( = ?auto_185187 ?auto_185186 ) ) ( not ( = ?auto_185187 ?auto_185185 ) ) ( not ( = ?auto_185193 ?auto_185191 ) ) ( not ( = ?auto_185193 ?auto_185186 ) ) ( not ( = ?auto_185193 ?auto_185185 ) ) ( ON ?auto_185185 ?auto_185189 ) ( CLEAR ?auto_185185 ) ( not ( = ?auto_185185 ?auto_185189 ) ) ( not ( = ?auto_185186 ?auto_185189 ) ) ( not ( = ?auto_185191 ?auto_185189 ) ) ( not ( = ?auto_185190 ?auto_185189 ) ) ( not ( = ?auto_185192 ?auto_185189 ) ) ( not ( = ?auto_185188 ?auto_185189 ) ) ( not ( = ?auto_185187 ?auto_185189 ) ) ( not ( = ?auto_185193 ?auto_185189 ) ) ( HOLDING ?auto_185186 ) ( CLEAR ?auto_185191 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185190 ?auto_185192 ?auto_185188 ?auto_185187 ?auto_185193 ?auto_185191 ?auto_185186 )
      ( MAKE-2PILE ?auto_185185 ?auto_185186 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185194 - BLOCK
      ?auto_185195 - BLOCK
    )
    :vars
    (
      ?auto_185201 - BLOCK
      ?auto_185198 - BLOCK
      ?auto_185202 - BLOCK
      ?auto_185197 - BLOCK
      ?auto_185200 - BLOCK
      ?auto_185196 - BLOCK
      ?auto_185199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185194 ?auto_185195 ) ) ( not ( = ?auto_185194 ?auto_185201 ) ) ( not ( = ?auto_185195 ?auto_185201 ) ) ( ON-TABLE ?auto_185198 ) ( ON ?auto_185202 ?auto_185198 ) ( ON ?auto_185197 ?auto_185202 ) ( ON ?auto_185200 ?auto_185197 ) ( ON ?auto_185196 ?auto_185200 ) ( ON ?auto_185201 ?auto_185196 ) ( not ( = ?auto_185198 ?auto_185202 ) ) ( not ( = ?auto_185198 ?auto_185197 ) ) ( not ( = ?auto_185198 ?auto_185200 ) ) ( not ( = ?auto_185198 ?auto_185196 ) ) ( not ( = ?auto_185198 ?auto_185201 ) ) ( not ( = ?auto_185198 ?auto_185195 ) ) ( not ( = ?auto_185198 ?auto_185194 ) ) ( not ( = ?auto_185202 ?auto_185197 ) ) ( not ( = ?auto_185202 ?auto_185200 ) ) ( not ( = ?auto_185202 ?auto_185196 ) ) ( not ( = ?auto_185202 ?auto_185201 ) ) ( not ( = ?auto_185202 ?auto_185195 ) ) ( not ( = ?auto_185202 ?auto_185194 ) ) ( not ( = ?auto_185197 ?auto_185200 ) ) ( not ( = ?auto_185197 ?auto_185196 ) ) ( not ( = ?auto_185197 ?auto_185201 ) ) ( not ( = ?auto_185197 ?auto_185195 ) ) ( not ( = ?auto_185197 ?auto_185194 ) ) ( not ( = ?auto_185200 ?auto_185196 ) ) ( not ( = ?auto_185200 ?auto_185201 ) ) ( not ( = ?auto_185200 ?auto_185195 ) ) ( not ( = ?auto_185200 ?auto_185194 ) ) ( not ( = ?auto_185196 ?auto_185201 ) ) ( not ( = ?auto_185196 ?auto_185195 ) ) ( not ( = ?auto_185196 ?auto_185194 ) ) ( ON ?auto_185194 ?auto_185199 ) ( not ( = ?auto_185194 ?auto_185199 ) ) ( not ( = ?auto_185195 ?auto_185199 ) ) ( not ( = ?auto_185201 ?auto_185199 ) ) ( not ( = ?auto_185198 ?auto_185199 ) ) ( not ( = ?auto_185202 ?auto_185199 ) ) ( not ( = ?auto_185197 ?auto_185199 ) ) ( not ( = ?auto_185200 ?auto_185199 ) ) ( not ( = ?auto_185196 ?auto_185199 ) ) ( CLEAR ?auto_185201 ) ( ON ?auto_185195 ?auto_185194 ) ( CLEAR ?auto_185195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185199 ?auto_185194 )
      ( MAKE-2PILE ?auto_185194 ?auto_185195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185203 - BLOCK
      ?auto_185204 - BLOCK
    )
    :vars
    (
      ?auto_185207 - BLOCK
      ?auto_185205 - BLOCK
      ?auto_185211 - BLOCK
      ?auto_185210 - BLOCK
      ?auto_185208 - BLOCK
      ?auto_185206 - BLOCK
      ?auto_185209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185203 ?auto_185204 ) ) ( not ( = ?auto_185203 ?auto_185207 ) ) ( not ( = ?auto_185204 ?auto_185207 ) ) ( ON-TABLE ?auto_185205 ) ( ON ?auto_185211 ?auto_185205 ) ( ON ?auto_185210 ?auto_185211 ) ( ON ?auto_185208 ?auto_185210 ) ( ON ?auto_185206 ?auto_185208 ) ( not ( = ?auto_185205 ?auto_185211 ) ) ( not ( = ?auto_185205 ?auto_185210 ) ) ( not ( = ?auto_185205 ?auto_185208 ) ) ( not ( = ?auto_185205 ?auto_185206 ) ) ( not ( = ?auto_185205 ?auto_185207 ) ) ( not ( = ?auto_185205 ?auto_185204 ) ) ( not ( = ?auto_185205 ?auto_185203 ) ) ( not ( = ?auto_185211 ?auto_185210 ) ) ( not ( = ?auto_185211 ?auto_185208 ) ) ( not ( = ?auto_185211 ?auto_185206 ) ) ( not ( = ?auto_185211 ?auto_185207 ) ) ( not ( = ?auto_185211 ?auto_185204 ) ) ( not ( = ?auto_185211 ?auto_185203 ) ) ( not ( = ?auto_185210 ?auto_185208 ) ) ( not ( = ?auto_185210 ?auto_185206 ) ) ( not ( = ?auto_185210 ?auto_185207 ) ) ( not ( = ?auto_185210 ?auto_185204 ) ) ( not ( = ?auto_185210 ?auto_185203 ) ) ( not ( = ?auto_185208 ?auto_185206 ) ) ( not ( = ?auto_185208 ?auto_185207 ) ) ( not ( = ?auto_185208 ?auto_185204 ) ) ( not ( = ?auto_185208 ?auto_185203 ) ) ( not ( = ?auto_185206 ?auto_185207 ) ) ( not ( = ?auto_185206 ?auto_185204 ) ) ( not ( = ?auto_185206 ?auto_185203 ) ) ( ON ?auto_185203 ?auto_185209 ) ( not ( = ?auto_185203 ?auto_185209 ) ) ( not ( = ?auto_185204 ?auto_185209 ) ) ( not ( = ?auto_185207 ?auto_185209 ) ) ( not ( = ?auto_185205 ?auto_185209 ) ) ( not ( = ?auto_185211 ?auto_185209 ) ) ( not ( = ?auto_185210 ?auto_185209 ) ) ( not ( = ?auto_185208 ?auto_185209 ) ) ( not ( = ?auto_185206 ?auto_185209 ) ) ( ON ?auto_185204 ?auto_185203 ) ( CLEAR ?auto_185204 ) ( ON-TABLE ?auto_185209 ) ( HOLDING ?auto_185207 ) ( CLEAR ?auto_185206 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185205 ?auto_185211 ?auto_185210 ?auto_185208 ?auto_185206 ?auto_185207 )
      ( MAKE-2PILE ?auto_185203 ?auto_185204 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185212 - BLOCK
      ?auto_185213 - BLOCK
    )
    :vars
    (
      ?auto_185216 - BLOCK
      ?auto_185214 - BLOCK
      ?auto_185215 - BLOCK
      ?auto_185218 - BLOCK
      ?auto_185220 - BLOCK
      ?auto_185219 - BLOCK
      ?auto_185217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185212 ?auto_185213 ) ) ( not ( = ?auto_185212 ?auto_185216 ) ) ( not ( = ?auto_185213 ?auto_185216 ) ) ( ON-TABLE ?auto_185214 ) ( ON ?auto_185215 ?auto_185214 ) ( ON ?auto_185218 ?auto_185215 ) ( ON ?auto_185220 ?auto_185218 ) ( ON ?auto_185219 ?auto_185220 ) ( not ( = ?auto_185214 ?auto_185215 ) ) ( not ( = ?auto_185214 ?auto_185218 ) ) ( not ( = ?auto_185214 ?auto_185220 ) ) ( not ( = ?auto_185214 ?auto_185219 ) ) ( not ( = ?auto_185214 ?auto_185216 ) ) ( not ( = ?auto_185214 ?auto_185213 ) ) ( not ( = ?auto_185214 ?auto_185212 ) ) ( not ( = ?auto_185215 ?auto_185218 ) ) ( not ( = ?auto_185215 ?auto_185220 ) ) ( not ( = ?auto_185215 ?auto_185219 ) ) ( not ( = ?auto_185215 ?auto_185216 ) ) ( not ( = ?auto_185215 ?auto_185213 ) ) ( not ( = ?auto_185215 ?auto_185212 ) ) ( not ( = ?auto_185218 ?auto_185220 ) ) ( not ( = ?auto_185218 ?auto_185219 ) ) ( not ( = ?auto_185218 ?auto_185216 ) ) ( not ( = ?auto_185218 ?auto_185213 ) ) ( not ( = ?auto_185218 ?auto_185212 ) ) ( not ( = ?auto_185220 ?auto_185219 ) ) ( not ( = ?auto_185220 ?auto_185216 ) ) ( not ( = ?auto_185220 ?auto_185213 ) ) ( not ( = ?auto_185220 ?auto_185212 ) ) ( not ( = ?auto_185219 ?auto_185216 ) ) ( not ( = ?auto_185219 ?auto_185213 ) ) ( not ( = ?auto_185219 ?auto_185212 ) ) ( ON ?auto_185212 ?auto_185217 ) ( not ( = ?auto_185212 ?auto_185217 ) ) ( not ( = ?auto_185213 ?auto_185217 ) ) ( not ( = ?auto_185216 ?auto_185217 ) ) ( not ( = ?auto_185214 ?auto_185217 ) ) ( not ( = ?auto_185215 ?auto_185217 ) ) ( not ( = ?auto_185218 ?auto_185217 ) ) ( not ( = ?auto_185220 ?auto_185217 ) ) ( not ( = ?auto_185219 ?auto_185217 ) ) ( ON ?auto_185213 ?auto_185212 ) ( ON-TABLE ?auto_185217 ) ( CLEAR ?auto_185219 ) ( ON ?auto_185216 ?auto_185213 ) ( CLEAR ?auto_185216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185217 ?auto_185212 ?auto_185213 )
      ( MAKE-2PILE ?auto_185212 ?auto_185213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185221 - BLOCK
      ?auto_185222 - BLOCK
    )
    :vars
    (
      ?auto_185224 - BLOCK
      ?auto_185226 - BLOCK
      ?auto_185227 - BLOCK
      ?auto_185225 - BLOCK
      ?auto_185223 - BLOCK
      ?auto_185228 - BLOCK
      ?auto_185229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185221 ?auto_185222 ) ) ( not ( = ?auto_185221 ?auto_185224 ) ) ( not ( = ?auto_185222 ?auto_185224 ) ) ( ON-TABLE ?auto_185226 ) ( ON ?auto_185227 ?auto_185226 ) ( ON ?auto_185225 ?auto_185227 ) ( ON ?auto_185223 ?auto_185225 ) ( not ( = ?auto_185226 ?auto_185227 ) ) ( not ( = ?auto_185226 ?auto_185225 ) ) ( not ( = ?auto_185226 ?auto_185223 ) ) ( not ( = ?auto_185226 ?auto_185228 ) ) ( not ( = ?auto_185226 ?auto_185224 ) ) ( not ( = ?auto_185226 ?auto_185222 ) ) ( not ( = ?auto_185226 ?auto_185221 ) ) ( not ( = ?auto_185227 ?auto_185225 ) ) ( not ( = ?auto_185227 ?auto_185223 ) ) ( not ( = ?auto_185227 ?auto_185228 ) ) ( not ( = ?auto_185227 ?auto_185224 ) ) ( not ( = ?auto_185227 ?auto_185222 ) ) ( not ( = ?auto_185227 ?auto_185221 ) ) ( not ( = ?auto_185225 ?auto_185223 ) ) ( not ( = ?auto_185225 ?auto_185228 ) ) ( not ( = ?auto_185225 ?auto_185224 ) ) ( not ( = ?auto_185225 ?auto_185222 ) ) ( not ( = ?auto_185225 ?auto_185221 ) ) ( not ( = ?auto_185223 ?auto_185228 ) ) ( not ( = ?auto_185223 ?auto_185224 ) ) ( not ( = ?auto_185223 ?auto_185222 ) ) ( not ( = ?auto_185223 ?auto_185221 ) ) ( not ( = ?auto_185228 ?auto_185224 ) ) ( not ( = ?auto_185228 ?auto_185222 ) ) ( not ( = ?auto_185228 ?auto_185221 ) ) ( ON ?auto_185221 ?auto_185229 ) ( not ( = ?auto_185221 ?auto_185229 ) ) ( not ( = ?auto_185222 ?auto_185229 ) ) ( not ( = ?auto_185224 ?auto_185229 ) ) ( not ( = ?auto_185226 ?auto_185229 ) ) ( not ( = ?auto_185227 ?auto_185229 ) ) ( not ( = ?auto_185225 ?auto_185229 ) ) ( not ( = ?auto_185223 ?auto_185229 ) ) ( not ( = ?auto_185228 ?auto_185229 ) ) ( ON ?auto_185222 ?auto_185221 ) ( ON-TABLE ?auto_185229 ) ( ON ?auto_185224 ?auto_185222 ) ( CLEAR ?auto_185224 ) ( HOLDING ?auto_185228 ) ( CLEAR ?auto_185223 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185226 ?auto_185227 ?auto_185225 ?auto_185223 ?auto_185228 )
      ( MAKE-2PILE ?auto_185221 ?auto_185222 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185230 - BLOCK
      ?auto_185231 - BLOCK
    )
    :vars
    (
      ?auto_185235 - BLOCK
      ?auto_185234 - BLOCK
      ?auto_185236 - BLOCK
      ?auto_185237 - BLOCK
      ?auto_185233 - BLOCK
      ?auto_185238 - BLOCK
      ?auto_185232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185230 ?auto_185231 ) ) ( not ( = ?auto_185230 ?auto_185235 ) ) ( not ( = ?auto_185231 ?auto_185235 ) ) ( ON-TABLE ?auto_185234 ) ( ON ?auto_185236 ?auto_185234 ) ( ON ?auto_185237 ?auto_185236 ) ( ON ?auto_185233 ?auto_185237 ) ( not ( = ?auto_185234 ?auto_185236 ) ) ( not ( = ?auto_185234 ?auto_185237 ) ) ( not ( = ?auto_185234 ?auto_185233 ) ) ( not ( = ?auto_185234 ?auto_185238 ) ) ( not ( = ?auto_185234 ?auto_185235 ) ) ( not ( = ?auto_185234 ?auto_185231 ) ) ( not ( = ?auto_185234 ?auto_185230 ) ) ( not ( = ?auto_185236 ?auto_185237 ) ) ( not ( = ?auto_185236 ?auto_185233 ) ) ( not ( = ?auto_185236 ?auto_185238 ) ) ( not ( = ?auto_185236 ?auto_185235 ) ) ( not ( = ?auto_185236 ?auto_185231 ) ) ( not ( = ?auto_185236 ?auto_185230 ) ) ( not ( = ?auto_185237 ?auto_185233 ) ) ( not ( = ?auto_185237 ?auto_185238 ) ) ( not ( = ?auto_185237 ?auto_185235 ) ) ( not ( = ?auto_185237 ?auto_185231 ) ) ( not ( = ?auto_185237 ?auto_185230 ) ) ( not ( = ?auto_185233 ?auto_185238 ) ) ( not ( = ?auto_185233 ?auto_185235 ) ) ( not ( = ?auto_185233 ?auto_185231 ) ) ( not ( = ?auto_185233 ?auto_185230 ) ) ( not ( = ?auto_185238 ?auto_185235 ) ) ( not ( = ?auto_185238 ?auto_185231 ) ) ( not ( = ?auto_185238 ?auto_185230 ) ) ( ON ?auto_185230 ?auto_185232 ) ( not ( = ?auto_185230 ?auto_185232 ) ) ( not ( = ?auto_185231 ?auto_185232 ) ) ( not ( = ?auto_185235 ?auto_185232 ) ) ( not ( = ?auto_185234 ?auto_185232 ) ) ( not ( = ?auto_185236 ?auto_185232 ) ) ( not ( = ?auto_185237 ?auto_185232 ) ) ( not ( = ?auto_185233 ?auto_185232 ) ) ( not ( = ?auto_185238 ?auto_185232 ) ) ( ON ?auto_185231 ?auto_185230 ) ( ON-TABLE ?auto_185232 ) ( ON ?auto_185235 ?auto_185231 ) ( CLEAR ?auto_185233 ) ( ON ?auto_185238 ?auto_185235 ) ( CLEAR ?auto_185238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185232 ?auto_185230 ?auto_185231 ?auto_185235 )
      ( MAKE-2PILE ?auto_185230 ?auto_185231 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185239 - BLOCK
      ?auto_185240 - BLOCK
    )
    :vars
    (
      ?auto_185244 - BLOCK
      ?auto_185247 - BLOCK
      ?auto_185245 - BLOCK
      ?auto_185243 - BLOCK
      ?auto_185246 - BLOCK
      ?auto_185242 - BLOCK
      ?auto_185241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185239 ?auto_185240 ) ) ( not ( = ?auto_185239 ?auto_185244 ) ) ( not ( = ?auto_185240 ?auto_185244 ) ) ( ON-TABLE ?auto_185247 ) ( ON ?auto_185245 ?auto_185247 ) ( ON ?auto_185243 ?auto_185245 ) ( not ( = ?auto_185247 ?auto_185245 ) ) ( not ( = ?auto_185247 ?auto_185243 ) ) ( not ( = ?auto_185247 ?auto_185246 ) ) ( not ( = ?auto_185247 ?auto_185242 ) ) ( not ( = ?auto_185247 ?auto_185244 ) ) ( not ( = ?auto_185247 ?auto_185240 ) ) ( not ( = ?auto_185247 ?auto_185239 ) ) ( not ( = ?auto_185245 ?auto_185243 ) ) ( not ( = ?auto_185245 ?auto_185246 ) ) ( not ( = ?auto_185245 ?auto_185242 ) ) ( not ( = ?auto_185245 ?auto_185244 ) ) ( not ( = ?auto_185245 ?auto_185240 ) ) ( not ( = ?auto_185245 ?auto_185239 ) ) ( not ( = ?auto_185243 ?auto_185246 ) ) ( not ( = ?auto_185243 ?auto_185242 ) ) ( not ( = ?auto_185243 ?auto_185244 ) ) ( not ( = ?auto_185243 ?auto_185240 ) ) ( not ( = ?auto_185243 ?auto_185239 ) ) ( not ( = ?auto_185246 ?auto_185242 ) ) ( not ( = ?auto_185246 ?auto_185244 ) ) ( not ( = ?auto_185246 ?auto_185240 ) ) ( not ( = ?auto_185246 ?auto_185239 ) ) ( not ( = ?auto_185242 ?auto_185244 ) ) ( not ( = ?auto_185242 ?auto_185240 ) ) ( not ( = ?auto_185242 ?auto_185239 ) ) ( ON ?auto_185239 ?auto_185241 ) ( not ( = ?auto_185239 ?auto_185241 ) ) ( not ( = ?auto_185240 ?auto_185241 ) ) ( not ( = ?auto_185244 ?auto_185241 ) ) ( not ( = ?auto_185247 ?auto_185241 ) ) ( not ( = ?auto_185245 ?auto_185241 ) ) ( not ( = ?auto_185243 ?auto_185241 ) ) ( not ( = ?auto_185246 ?auto_185241 ) ) ( not ( = ?auto_185242 ?auto_185241 ) ) ( ON ?auto_185240 ?auto_185239 ) ( ON-TABLE ?auto_185241 ) ( ON ?auto_185244 ?auto_185240 ) ( ON ?auto_185242 ?auto_185244 ) ( CLEAR ?auto_185242 ) ( HOLDING ?auto_185246 ) ( CLEAR ?auto_185243 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185247 ?auto_185245 ?auto_185243 ?auto_185246 )
      ( MAKE-2PILE ?auto_185239 ?auto_185240 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185248 - BLOCK
      ?auto_185249 - BLOCK
    )
    :vars
    (
      ?auto_185256 - BLOCK
      ?auto_185250 - BLOCK
      ?auto_185254 - BLOCK
      ?auto_185253 - BLOCK
      ?auto_185251 - BLOCK
      ?auto_185252 - BLOCK
      ?auto_185255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185248 ?auto_185249 ) ) ( not ( = ?auto_185248 ?auto_185256 ) ) ( not ( = ?auto_185249 ?auto_185256 ) ) ( ON-TABLE ?auto_185250 ) ( ON ?auto_185254 ?auto_185250 ) ( ON ?auto_185253 ?auto_185254 ) ( not ( = ?auto_185250 ?auto_185254 ) ) ( not ( = ?auto_185250 ?auto_185253 ) ) ( not ( = ?auto_185250 ?auto_185251 ) ) ( not ( = ?auto_185250 ?auto_185252 ) ) ( not ( = ?auto_185250 ?auto_185256 ) ) ( not ( = ?auto_185250 ?auto_185249 ) ) ( not ( = ?auto_185250 ?auto_185248 ) ) ( not ( = ?auto_185254 ?auto_185253 ) ) ( not ( = ?auto_185254 ?auto_185251 ) ) ( not ( = ?auto_185254 ?auto_185252 ) ) ( not ( = ?auto_185254 ?auto_185256 ) ) ( not ( = ?auto_185254 ?auto_185249 ) ) ( not ( = ?auto_185254 ?auto_185248 ) ) ( not ( = ?auto_185253 ?auto_185251 ) ) ( not ( = ?auto_185253 ?auto_185252 ) ) ( not ( = ?auto_185253 ?auto_185256 ) ) ( not ( = ?auto_185253 ?auto_185249 ) ) ( not ( = ?auto_185253 ?auto_185248 ) ) ( not ( = ?auto_185251 ?auto_185252 ) ) ( not ( = ?auto_185251 ?auto_185256 ) ) ( not ( = ?auto_185251 ?auto_185249 ) ) ( not ( = ?auto_185251 ?auto_185248 ) ) ( not ( = ?auto_185252 ?auto_185256 ) ) ( not ( = ?auto_185252 ?auto_185249 ) ) ( not ( = ?auto_185252 ?auto_185248 ) ) ( ON ?auto_185248 ?auto_185255 ) ( not ( = ?auto_185248 ?auto_185255 ) ) ( not ( = ?auto_185249 ?auto_185255 ) ) ( not ( = ?auto_185256 ?auto_185255 ) ) ( not ( = ?auto_185250 ?auto_185255 ) ) ( not ( = ?auto_185254 ?auto_185255 ) ) ( not ( = ?auto_185253 ?auto_185255 ) ) ( not ( = ?auto_185251 ?auto_185255 ) ) ( not ( = ?auto_185252 ?auto_185255 ) ) ( ON ?auto_185249 ?auto_185248 ) ( ON-TABLE ?auto_185255 ) ( ON ?auto_185256 ?auto_185249 ) ( ON ?auto_185252 ?auto_185256 ) ( CLEAR ?auto_185253 ) ( ON ?auto_185251 ?auto_185252 ) ( CLEAR ?auto_185251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185255 ?auto_185248 ?auto_185249 ?auto_185256 ?auto_185252 )
      ( MAKE-2PILE ?auto_185248 ?auto_185249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185257 - BLOCK
      ?auto_185258 - BLOCK
    )
    :vars
    (
      ?auto_185261 - BLOCK
      ?auto_185259 - BLOCK
      ?auto_185265 - BLOCK
      ?auto_185264 - BLOCK
      ?auto_185262 - BLOCK
      ?auto_185260 - BLOCK
      ?auto_185263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185257 ?auto_185258 ) ) ( not ( = ?auto_185257 ?auto_185261 ) ) ( not ( = ?auto_185258 ?auto_185261 ) ) ( ON-TABLE ?auto_185259 ) ( ON ?auto_185265 ?auto_185259 ) ( not ( = ?auto_185259 ?auto_185265 ) ) ( not ( = ?auto_185259 ?auto_185264 ) ) ( not ( = ?auto_185259 ?auto_185262 ) ) ( not ( = ?auto_185259 ?auto_185260 ) ) ( not ( = ?auto_185259 ?auto_185261 ) ) ( not ( = ?auto_185259 ?auto_185258 ) ) ( not ( = ?auto_185259 ?auto_185257 ) ) ( not ( = ?auto_185265 ?auto_185264 ) ) ( not ( = ?auto_185265 ?auto_185262 ) ) ( not ( = ?auto_185265 ?auto_185260 ) ) ( not ( = ?auto_185265 ?auto_185261 ) ) ( not ( = ?auto_185265 ?auto_185258 ) ) ( not ( = ?auto_185265 ?auto_185257 ) ) ( not ( = ?auto_185264 ?auto_185262 ) ) ( not ( = ?auto_185264 ?auto_185260 ) ) ( not ( = ?auto_185264 ?auto_185261 ) ) ( not ( = ?auto_185264 ?auto_185258 ) ) ( not ( = ?auto_185264 ?auto_185257 ) ) ( not ( = ?auto_185262 ?auto_185260 ) ) ( not ( = ?auto_185262 ?auto_185261 ) ) ( not ( = ?auto_185262 ?auto_185258 ) ) ( not ( = ?auto_185262 ?auto_185257 ) ) ( not ( = ?auto_185260 ?auto_185261 ) ) ( not ( = ?auto_185260 ?auto_185258 ) ) ( not ( = ?auto_185260 ?auto_185257 ) ) ( ON ?auto_185257 ?auto_185263 ) ( not ( = ?auto_185257 ?auto_185263 ) ) ( not ( = ?auto_185258 ?auto_185263 ) ) ( not ( = ?auto_185261 ?auto_185263 ) ) ( not ( = ?auto_185259 ?auto_185263 ) ) ( not ( = ?auto_185265 ?auto_185263 ) ) ( not ( = ?auto_185264 ?auto_185263 ) ) ( not ( = ?auto_185262 ?auto_185263 ) ) ( not ( = ?auto_185260 ?auto_185263 ) ) ( ON ?auto_185258 ?auto_185257 ) ( ON-TABLE ?auto_185263 ) ( ON ?auto_185261 ?auto_185258 ) ( ON ?auto_185260 ?auto_185261 ) ( ON ?auto_185262 ?auto_185260 ) ( CLEAR ?auto_185262 ) ( HOLDING ?auto_185264 ) ( CLEAR ?auto_185265 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185259 ?auto_185265 ?auto_185264 )
      ( MAKE-2PILE ?auto_185257 ?auto_185258 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185266 - BLOCK
      ?auto_185267 - BLOCK
    )
    :vars
    (
      ?auto_185272 - BLOCK
      ?auto_185274 - BLOCK
      ?auto_185273 - BLOCK
      ?auto_185270 - BLOCK
      ?auto_185271 - BLOCK
      ?auto_185269 - BLOCK
      ?auto_185268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185266 ?auto_185267 ) ) ( not ( = ?auto_185266 ?auto_185272 ) ) ( not ( = ?auto_185267 ?auto_185272 ) ) ( ON-TABLE ?auto_185274 ) ( ON ?auto_185273 ?auto_185274 ) ( not ( = ?auto_185274 ?auto_185273 ) ) ( not ( = ?auto_185274 ?auto_185270 ) ) ( not ( = ?auto_185274 ?auto_185271 ) ) ( not ( = ?auto_185274 ?auto_185269 ) ) ( not ( = ?auto_185274 ?auto_185272 ) ) ( not ( = ?auto_185274 ?auto_185267 ) ) ( not ( = ?auto_185274 ?auto_185266 ) ) ( not ( = ?auto_185273 ?auto_185270 ) ) ( not ( = ?auto_185273 ?auto_185271 ) ) ( not ( = ?auto_185273 ?auto_185269 ) ) ( not ( = ?auto_185273 ?auto_185272 ) ) ( not ( = ?auto_185273 ?auto_185267 ) ) ( not ( = ?auto_185273 ?auto_185266 ) ) ( not ( = ?auto_185270 ?auto_185271 ) ) ( not ( = ?auto_185270 ?auto_185269 ) ) ( not ( = ?auto_185270 ?auto_185272 ) ) ( not ( = ?auto_185270 ?auto_185267 ) ) ( not ( = ?auto_185270 ?auto_185266 ) ) ( not ( = ?auto_185271 ?auto_185269 ) ) ( not ( = ?auto_185271 ?auto_185272 ) ) ( not ( = ?auto_185271 ?auto_185267 ) ) ( not ( = ?auto_185271 ?auto_185266 ) ) ( not ( = ?auto_185269 ?auto_185272 ) ) ( not ( = ?auto_185269 ?auto_185267 ) ) ( not ( = ?auto_185269 ?auto_185266 ) ) ( ON ?auto_185266 ?auto_185268 ) ( not ( = ?auto_185266 ?auto_185268 ) ) ( not ( = ?auto_185267 ?auto_185268 ) ) ( not ( = ?auto_185272 ?auto_185268 ) ) ( not ( = ?auto_185274 ?auto_185268 ) ) ( not ( = ?auto_185273 ?auto_185268 ) ) ( not ( = ?auto_185270 ?auto_185268 ) ) ( not ( = ?auto_185271 ?auto_185268 ) ) ( not ( = ?auto_185269 ?auto_185268 ) ) ( ON ?auto_185267 ?auto_185266 ) ( ON-TABLE ?auto_185268 ) ( ON ?auto_185272 ?auto_185267 ) ( ON ?auto_185269 ?auto_185272 ) ( ON ?auto_185271 ?auto_185269 ) ( CLEAR ?auto_185273 ) ( ON ?auto_185270 ?auto_185271 ) ( CLEAR ?auto_185270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185268 ?auto_185266 ?auto_185267 ?auto_185272 ?auto_185269 ?auto_185271 )
      ( MAKE-2PILE ?auto_185266 ?auto_185267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185275 - BLOCK
      ?auto_185276 - BLOCK
    )
    :vars
    (
      ?auto_185283 - BLOCK
      ?auto_185278 - BLOCK
      ?auto_185282 - BLOCK
      ?auto_185280 - BLOCK
      ?auto_185277 - BLOCK
      ?auto_185279 - BLOCK
      ?auto_185281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185275 ?auto_185276 ) ) ( not ( = ?auto_185275 ?auto_185283 ) ) ( not ( = ?auto_185276 ?auto_185283 ) ) ( ON-TABLE ?auto_185278 ) ( not ( = ?auto_185278 ?auto_185282 ) ) ( not ( = ?auto_185278 ?auto_185280 ) ) ( not ( = ?auto_185278 ?auto_185277 ) ) ( not ( = ?auto_185278 ?auto_185279 ) ) ( not ( = ?auto_185278 ?auto_185283 ) ) ( not ( = ?auto_185278 ?auto_185276 ) ) ( not ( = ?auto_185278 ?auto_185275 ) ) ( not ( = ?auto_185282 ?auto_185280 ) ) ( not ( = ?auto_185282 ?auto_185277 ) ) ( not ( = ?auto_185282 ?auto_185279 ) ) ( not ( = ?auto_185282 ?auto_185283 ) ) ( not ( = ?auto_185282 ?auto_185276 ) ) ( not ( = ?auto_185282 ?auto_185275 ) ) ( not ( = ?auto_185280 ?auto_185277 ) ) ( not ( = ?auto_185280 ?auto_185279 ) ) ( not ( = ?auto_185280 ?auto_185283 ) ) ( not ( = ?auto_185280 ?auto_185276 ) ) ( not ( = ?auto_185280 ?auto_185275 ) ) ( not ( = ?auto_185277 ?auto_185279 ) ) ( not ( = ?auto_185277 ?auto_185283 ) ) ( not ( = ?auto_185277 ?auto_185276 ) ) ( not ( = ?auto_185277 ?auto_185275 ) ) ( not ( = ?auto_185279 ?auto_185283 ) ) ( not ( = ?auto_185279 ?auto_185276 ) ) ( not ( = ?auto_185279 ?auto_185275 ) ) ( ON ?auto_185275 ?auto_185281 ) ( not ( = ?auto_185275 ?auto_185281 ) ) ( not ( = ?auto_185276 ?auto_185281 ) ) ( not ( = ?auto_185283 ?auto_185281 ) ) ( not ( = ?auto_185278 ?auto_185281 ) ) ( not ( = ?auto_185282 ?auto_185281 ) ) ( not ( = ?auto_185280 ?auto_185281 ) ) ( not ( = ?auto_185277 ?auto_185281 ) ) ( not ( = ?auto_185279 ?auto_185281 ) ) ( ON ?auto_185276 ?auto_185275 ) ( ON-TABLE ?auto_185281 ) ( ON ?auto_185283 ?auto_185276 ) ( ON ?auto_185279 ?auto_185283 ) ( ON ?auto_185277 ?auto_185279 ) ( ON ?auto_185280 ?auto_185277 ) ( CLEAR ?auto_185280 ) ( HOLDING ?auto_185282 ) ( CLEAR ?auto_185278 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185278 ?auto_185282 )
      ( MAKE-2PILE ?auto_185275 ?auto_185276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185284 - BLOCK
      ?auto_185285 - BLOCK
    )
    :vars
    (
      ?auto_185286 - BLOCK
      ?auto_185291 - BLOCK
      ?auto_185288 - BLOCK
      ?auto_185292 - BLOCK
      ?auto_185290 - BLOCK
      ?auto_185287 - BLOCK
      ?auto_185289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185284 ?auto_185285 ) ) ( not ( = ?auto_185284 ?auto_185286 ) ) ( not ( = ?auto_185285 ?auto_185286 ) ) ( ON-TABLE ?auto_185291 ) ( not ( = ?auto_185291 ?auto_185288 ) ) ( not ( = ?auto_185291 ?auto_185292 ) ) ( not ( = ?auto_185291 ?auto_185290 ) ) ( not ( = ?auto_185291 ?auto_185287 ) ) ( not ( = ?auto_185291 ?auto_185286 ) ) ( not ( = ?auto_185291 ?auto_185285 ) ) ( not ( = ?auto_185291 ?auto_185284 ) ) ( not ( = ?auto_185288 ?auto_185292 ) ) ( not ( = ?auto_185288 ?auto_185290 ) ) ( not ( = ?auto_185288 ?auto_185287 ) ) ( not ( = ?auto_185288 ?auto_185286 ) ) ( not ( = ?auto_185288 ?auto_185285 ) ) ( not ( = ?auto_185288 ?auto_185284 ) ) ( not ( = ?auto_185292 ?auto_185290 ) ) ( not ( = ?auto_185292 ?auto_185287 ) ) ( not ( = ?auto_185292 ?auto_185286 ) ) ( not ( = ?auto_185292 ?auto_185285 ) ) ( not ( = ?auto_185292 ?auto_185284 ) ) ( not ( = ?auto_185290 ?auto_185287 ) ) ( not ( = ?auto_185290 ?auto_185286 ) ) ( not ( = ?auto_185290 ?auto_185285 ) ) ( not ( = ?auto_185290 ?auto_185284 ) ) ( not ( = ?auto_185287 ?auto_185286 ) ) ( not ( = ?auto_185287 ?auto_185285 ) ) ( not ( = ?auto_185287 ?auto_185284 ) ) ( ON ?auto_185284 ?auto_185289 ) ( not ( = ?auto_185284 ?auto_185289 ) ) ( not ( = ?auto_185285 ?auto_185289 ) ) ( not ( = ?auto_185286 ?auto_185289 ) ) ( not ( = ?auto_185291 ?auto_185289 ) ) ( not ( = ?auto_185288 ?auto_185289 ) ) ( not ( = ?auto_185292 ?auto_185289 ) ) ( not ( = ?auto_185290 ?auto_185289 ) ) ( not ( = ?auto_185287 ?auto_185289 ) ) ( ON ?auto_185285 ?auto_185284 ) ( ON-TABLE ?auto_185289 ) ( ON ?auto_185286 ?auto_185285 ) ( ON ?auto_185287 ?auto_185286 ) ( ON ?auto_185290 ?auto_185287 ) ( ON ?auto_185292 ?auto_185290 ) ( CLEAR ?auto_185291 ) ( ON ?auto_185288 ?auto_185292 ) ( CLEAR ?auto_185288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185289 ?auto_185284 ?auto_185285 ?auto_185286 ?auto_185287 ?auto_185290 ?auto_185292 )
      ( MAKE-2PILE ?auto_185284 ?auto_185285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185293 - BLOCK
      ?auto_185294 - BLOCK
    )
    :vars
    (
      ?auto_185297 - BLOCK
      ?auto_185299 - BLOCK
      ?auto_185301 - BLOCK
      ?auto_185295 - BLOCK
      ?auto_185298 - BLOCK
      ?auto_185300 - BLOCK
      ?auto_185296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185293 ?auto_185294 ) ) ( not ( = ?auto_185293 ?auto_185297 ) ) ( not ( = ?auto_185294 ?auto_185297 ) ) ( not ( = ?auto_185299 ?auto_185301 ) ) ( not ( = ?auto_185299 ?auto_185295 ) ) ( not ( = ?auto_185299 ?auto_185298 ) ) ( not ( = ?auto_185299 ?auto_185300 ) ) ( not ( = ?auto_185299 ?auto_185297 ) ) ( not ( = ?auto_185299 ?auto_185294 ) ) ( not ( = ?auto_185299 ?auto_185293 ) ) ( not ( = ?auto_185301 ?auto_185295 ) ) ( not ( = ?auto_185301 ?auto_185298 ) ) ( not ( = ?auto_185301 ?auto_185300 ) ) ( not ( = ?auto_185301 ?auto_185297 ) ) ( not ( = ?auto_185301 ?auto_185294 ) ) ( not ( = ?auto_185301 ?auto_185293 ) ) ( not ( = ?auto_185295 ?auto_185298 ) ) ( not ( = ?auto_185295 ?auto_185300 ) ) ( not ( = ?auto_185295 ?auto_185297 ) ) ( not ( = ?auto_185295 ?auto_185294 ) ) ( not ( = ?auto_185295 ?auto_185293 ) ) ( not ( = ?auto_185298 ?auto_185300 ) ) ( not ( = ?auto_185298 ?auto_185297 ) ) ( not ( = ?auto_185298 ?auto_185294 ) ) ( not ( = ?auto_185298 ?auto_185293 ) ) ( not ( = ?auto_185300 ?auto_185297 ) ) ( not ( = ?auto_185300 ?auto_185294 ) ) ( not ( = ?auto_185300 ?auto_185293 ) ) ( ON ?auto_185293 ?auto_185296 ) ( not ( = ?auto_185293 ?auto_185296 ) ) ( not ( = ?auto_185294 ?auto_185296 ) ) ( not ( = ?auto_185297 ?auto_185296 ) ) ( not ( = ?auto_185299 ?auto_185296 ) ) ( not ( = ?auto_185301 ?auto_185296 ) ) ( not ( = ?auto_185295 ?auto_185296 ) ) ( not ( = ?auto_185298 ?auto_185296 ) ) ( not ( = ?auto_185300 ?auto_185296 ) ) ( ON ?auto_185294 ?auto_185293 ) ( ON-TABLE ?auto_185296 ) ( ON ?auto_185297 ?auto_185294 ) ( ON ?auto_185300 ?auto_185297 ) ( ON ?auto_185298 ?auto_185300 ) ( ON ?auto_185295 ?auto_185298 ) ( ON ?auto_185301 ?auto_185295 ) ( CLEAR ?auto_185301 ) ( HOLDING ?auto_185299 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185299 )
      ( MAKE-2PILE ?auto_185293 ?auto_185294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185302 - BLOCK
      ?auto_185303 - BLOCK
    )
    :vars
    (
      ?auto_185310 - BLOCK
      ?auto_185307 - BLOCK
      ?auto_185304 - BLOCK
      ?auto_185305 - BLOCK
      ?auto_185309 - BLOCK
      ?auto_185306 - BLOCK
      ?auto_185308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185302 ?auto_185303 ) ) ( not ( = ?auto_185302 ?auto_185310 ) ) ( not ( = ?auto_185303 ?auto_185310 ) ) ( not ( = ?auto_185307 ?auto_185304 ) ) ( not ( = ?auto_185307 ?auto_185305 ) ) ( not ( = ?auto_185307 ?auto_185309 ) ) ( not ( = ?auto_185307 ?auto_185306 ) ) ( not ( = ?auto_185307 ?auto_185310 ) ) ( not ( = ?auto_185307 ?auto_185303 ) ) ( not ( = ?auto_185307 ?auto_185302 ) ) ( not ( = ?auto_185304 ?auto_185305 ) ) ( not ( = ?auto_185304 ?auto_185309 ) ) ( not ( = ?auto_185304 ?auto_185306 ) ) ( not ( = ?auto_185304 ?auto_185310 ) ) ( not ( = ?auto_185304 ?auto_185303 ) ) ( not ( = ?auto_185304 ?auto_185302 ) ) ( not ( = ?auto_185305 ?auto_185309 ) ) ( not ( = ?auto_185305 ?auto_185306 ) ) ( not ( = ?auto_185305 ?auto_185310 ) ) ( not ( = ?auto_185305 ?auto_185303 ) ) ( not ( = ?auto_185305 ?auto_185302 ) ) ( not ( = ?auto_185309 ?auto_185306 ) ) ( not ( = ?auto_185309 ?auto_185310 ) ) ( not ( = ?auto_185309 ?auto_185303 ) ) ( not ( = ?auto_185309 ?auto_185302 ) ) ( not ( = ?auto_185306 ?auto_185310 ) ) ( not ( = ?auto_185306 ?auto_185303 ) ) ( not ( = ?auto_185306 ?auto_185302 ) ) ( ON ?auto_185302 ?auto_185308 ) ( not ( = ?auto_185302 ?auto_185308 ) ) ( not ( = ?auto_185303 ?auto_185308 ) ) ( not ( = ?auto_185310 ?auto_185308 ) ) ( not ( = ?auto_185307 ?auto_185308 ) ) ( not ( = ?auto_185304 ?auto_185308 ) ) ( not ( = ?auto_185305 ?auto_185308 ) ) ( not ( = ?auto_185309 ?auto_185308 ) ) ( not ( = ?auto_185306 ?auto_185308 ) ) ( ON ?auto_185303 ?auto_185302 ) ( ON-TABLE ?auto_185308 ) ( ON ?auto_185310 ?auto_185303 ) ( ON ?auto_185306 ?auto_185310 ) ( ON ?auto_185309 ?auto_185306 ) ( ON ?auto_185305 ?auto_185309 ) ( ON ?auto_185304 ?auto_185305 ) ( ON ?auto_185307 ?auto_185304 ) ( CLEAR ?auto_185307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185308 ?auto_185302 ?auto_185303 ?auto_185310 ?auto_185306 ?auto_185309 ?auto_185305 ?auto_185304 )
      ( MAKE-2PILE ?auto_185302 ?auto_185303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185316 - BLOCK
      ?auto_185317 - BLOCK
      ?auto_185318 - BLOCK
      ?auto_185319 - BLOCK
      ?auto_185320 - BLOCK
    )
    :vars
    (
      ?auto_185321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185321 ?auto_185320 ) ( CLEAR ?auto_185321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185316 ) ( ON ?auto_185317 ?auto_185316 ) ( ON ?auto_185318 ?auto_185317 ) ( ON ?auto_185319 ?auto_185318 ) ( ON ?auto_185320 ?auto_185319 ) ( not ( = ?auto_185316 ?auto_185317 ) ) ( not ( = ?auto_185316 ?auto_185318 ) ) ( not ( = ?auto_185316 ?auto_185319 ) ) ( not ( = ?auto_185316 ?auto_185320 ) ) ( not ( = ?auto_185316 ?auto_185321 ) ) ( not ( = ?auto_185317 ?auto_185318 ) ) ( not ( = ?auto_185317 ?auto_185319 ) ) ( not ( = ?auto_185317 ?auto_185320 ) ) ( not ( = ?auto_185317 ?auto_185321 ) ) ( not ( = ?auto_185318 ?auto_185319 ) ) ( not ( = ?auto_185318 ?auto_185320 ) ) ( not ( = ?auto_185318 ?auto_185321 ) ) ( not ( = ?auto_185319 ?auto_185320 ) ) ( not ( = ?auto_185319 ?auto_185321 ) ) ( not ( = ?auto_185320 ?auto_185321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185321 ?auto_185320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185322 - BLOCK
      ?auto_185323 - BLOCK
      ?auto_185324 - BLOCK
      ?auto_185325 - BLOCK
      ?auto_185326 - BLOCK
    )
    :vars
    (
      ?auto_185327 - BLOCK
      ?auto_185328 - BLOCK
      ?auto_185329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185327 ?auto_185326 ) ( CLEAR ?auto_185327 ) ( ON-TABLE ?auto_185322 ) ( ON ?auto_185323 ?auto_185322 ) ( ON ?auto_185324 ?auto_185323 ) ( ON ?auto_185325 ?auto_185324 ) ( ON ?auto_185326 ?auto_185325 ) ( not ( = ?auto_185322 ?auto_185323 ) ) ( not ( = ?auto_185322 ?auto_185324 ) ) ( not ( = ?auto_185322 ?auto_185325 ) ) ( not ( = ?auto_185322 ?auto_185326 ) ) ( not ( = ?auto_185322 ?auto_185327 ) ) ( not ( = ?auto_185323 ?auto_185324 ) ) ( not ( = ?auto_185323 ?auto_185325 ) ) ( not ( = ?auto_185323 ?auto_185326 ) ) ( not ( = ?auto_185323 ?auto_185327 ) ) ( not ( = ?auto_185324 ?auto_185325 ) ) ( not ( = ?auto_185324 ?auto_185326 ) ) ( not ( = ?auto_185324 ?auto_185327 ) ) ( not ( = ?auto_185325 ?auto_185326 ) ) ( not ( = ?auto_185325 ?auto_185327 ) ) ( not ( = ?auto_185326 ?auto_185327 ) ) ( HOLDING ?auto_185328 ) ( CLEAR ?auto_185329 ) ( not ( = ?auto_185322 ?auto_185328 ) ) ( not ( = ?auto_185322 ?auto_185329 ) ) ( not ( = ?auto_185323 ?auto_185328 ) ) ( not ( = ?auto_185323 ?auto_185329 ) ) ( not ( = ?auto_185324 ?auto_185328 ) ) ( not ( = ?auto_185324 ?auto_185329 ) ) ( not ( = ?auto_185325 ?auto_185328 ) ) ( not ( = ?auto_185325 ?auto_185329 ) ) ( not ( = ?auto_185326 ?auto_185328 ) ) ( not ( = ?auto_185326 ?auto_185329 ) ) ( not ( = ?auto_185327 ?auto_185328 ) ) ( not ( = ?auto_185327 ?auto_185329 ) ) ( not ( = ?auto_185328 ?auto_185329 ) ) )
    :subtasks
    ( ( !STACK ?auto_185328 ?auto_185329 )
      ( MAKE-5PILE ?auto_185322 ?auto_185323 ?auto_185324 ?auto_185325 ?auto_185326 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185330 - BLOCK
      ?auto_185331 - BLOCK
      ?auto_185332 - BLOCK
      ?auto_185333 - BLOCK
      ?auto_185334 - BLOCK
    )
    :vars
    (
      ?auto_185335 - BLOCK
      ?auto_185336 - BLOCK
      ?auto_185337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185335 ?auto_185334 ) ( ON-TABLE ?auto_185330 ) ( ON ?auto_185331 ?auto_185330 ) ( ON ?auto_185332 ?auto_185331 ) ( ON ?auto_185333 ?auto_185332 ) ( ON ?auto_185334 ?auto_185333 ) ( not ( = ?auto_185330 ?auto_185331 ) ) ( not ( = ?auto_185330 ?auto_185332 ) ) ( not ( = ?auto_185330 ?auto_185333 ) ) ( not ( = ?auto_185330 ?auto_185334 ) ) ( not ( = ?auto_185330 ?auto_185335 ) ) ( not ( = ?auto_185331 ?auto_185332 ) ) ( not ( = ?auto_185331 ?auto_185333 ) ) ( not ( = ?auto_185331 ?auto_185334 ) ) ( not ( = ?auto_185331 ?auto_185335 ) ) ( not ( = ?auto_185332 ?auto_185333 ) ) ( not ( = ?auto_185332 ?auto_185334 ) ) ( not ( = ?auto_185332 ?auto_185335 ) ) ( not ( = ?auto_185333 ?auto_185334 ) ) ( not ( = ?auto_185333 ?auto_185335 ) ) ( not ( = ?auto_185334 ?auto_185335 ) ) ( CLEAR ?auto_185336 ) ( not ( = ?auto_185330 ?auto_185337 ) ) ( not ( = ?auto_185330 ?auto_185336 ) ) ( not ( = ?auto_185331 ?auto_185337 ) ) ( not ( = ?auto_185331 ?auto_185336 ) ) ( not ( = ?auto_185332 ?auto_185337 ) ) ( not ( = ?auto_185332 ?auto_185336 ) ) ( not ( = ?auto_185333 ?auto_185337 ) ) ( not ( = ?auto_185333 ?auto_185336 ) ) ( not ( = ?auto_185334 ?auto_185337 ) ) ( not ( = ?auto_185334 ?auto_185336 ) ) ( not ( = ?auto_185335 ?auto_185337 ) ) ( not ( = ?auto_185335 ?auto_185336 ) ) ( not ( = ?auto_185337 ?auto_185336 ) ) ( ON ?auto_185337 ?auto_185335 ) ( CLEAR ?auto_185337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185330 ?auto_185331 ?auto_185332 ?auto_185333 ?auto_185334 ?auto_185335 )
      ( MAKE-5PILE ?auto_185330 ?auto_185331 ?auto_185332 ?auto_185333 ?auto_185334 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185338 - BLOCK
      ?auto_185339 - BLOCK
      ?auto_185340 - BLOCK
      ?auto_185341 - BLOCK
      ?auto_185342 - BLOCK
    )
    :vars
    (
      ?auto_185345 - BLOCK
      ?auto_185343 - BLOCK
      ?auto_185344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185345 ?auto_185342 ) ( ON-TABLE ?auto_185338 ) ( ON ?auto_185339 ?auto_185338 ) ( ON ?auto_185340 ?auto_185339 ) ( ON ?auto_185341 ?auto_185340 ) ( ON ?auto_185342 ?auto_185341 ) ( not ( = ?auto_185338 ?auto_185339 ) ) ( not ( = ?auto_185338 ?auto_185340 ) ) ( not ( = ?auto_185338 ?auto_185341 ) ) ( not ( = ?auto_185338 ?auto_185342 ) ) ( not ( = ?auto_185338 ?auto_185345 ) ) ( not ( = ?auto_185339 ?auto_185340 ) ) ( not ( = ?auto_185339 ?auto_185341 ) ) ( not ( = ?auto_185339 ?auto_185342 ) ) ( not ( = ?auto_185339 ?auto_185345 ) ) ( not ( = ?auto_185340 ?auto_185341 ) ) ( not ( = ?auto_185340 ?auto_185342 ) ) ( not ( = ?auto_185340 ?auto_185345 ) ) ( not ( = ?auto_185341 ?auto_185342 ) ) ( not ( = ?auto_185341 ?auto_185345 ) ) ( not ( = ?auto_185342 ?auto_185345 ) ) ( not ( = ?auto_185338 ?auto_185343 ) ) ( not ( = ?auto_185338 ?auto_185344 ) ) ( not ( = ?auto_185339 ?auto_185343 ) ) ( not ( = ?auto_185339 ?auto_185344 ) ) ( not ( = ?auto_185340 ?auto_185343 ) ) ( not ( = ?auto_185340 ?auto_185344 ) ) ( not ( = ?auto_185341 ?auto_185343 ) ) ( not ( = ?auto_185341 ?auto_185344 ) ) ( not ( = ?auto_185342 ?auto_185343 ) ) ( not ( = ?auto_185342 ?auto_185344 ) ) ( not ( = ?auto_185345 ?auto_185343 ) ) ( not ( = ?auto_185345 ?auto_185344 ) ) ( not ( = ?auto_185343 ?auto_185344 ) ) ( ON ?auto_185343 ?auto_185345 ) ( CLEAR ?auto_185343 ) ( HOLDING ?auto_185344 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185344 )
      ( MAKE-5PILE ?auto_185338 ?auto_185339 ?auto_185340 ?auto_185341 ?auto_185342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185346 - BLOCK
      ?auto_185347 - BLOCK
      ?auto_185348 - BLOCK
      ?auto_185349 - BLOCK
      ?auto_185350 - BLOCK
    )
    :vars
    (
      ?auto_185352 - BLOCK
      ?auto_185351 - BLOCK
      ?auto_185353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185352 ?auto_185350 ) ( ON-TABLE ?auto_185346 ) ( ON ?auto_185347 ?auto_185346 ) ( ON ?auto_185348 ?auto_185347 ) ( ON ?auto_185349 ?auto_185348 ) ( ON ?auto_185350 ?auto_185349 ) ( not ( = ?auto_185346 ?auto_185347 ) ) ( not ( = ?auto_185346 ?auto_185348 ) ) ( not ( = ?auto_185346 ?auto_185349 ) ) ( not ( = ?auto_185346 ?auto_185350 ) ) ( not ( = ?auto_185346 ?auto_185352 ) ) ( not ( = ?auto_185347 ?auto_185348 ) ) ( not ( = ?auto_185347 ?auto_185349 ) ) ( not ( = ?auto_185347 ?auto_185350 ) ) ( not ( = ?auto_185347 ?auto_185352 ) ) ( not ( = ?auto_185348 ?auto_185349 ) ) ( not ( = ?auto_185348 ?auto_185350 ) ) ( not ( = ?auto_185348 ?auto_185352 ) ) ( not ( = ?auto_185349 ?auto_185350 ) ) ( not ( = ?auto_185349 ?auto_185352 ) ) ( not ( = ?auto_185350 ?auto_185352 ) ) ( not ( = ?auto_185346 ?auto_185351 ) ) ( not ( = ?auto_185346 ?auto_185353 ) ) ( not ( = ?auto_185347 ?auto_185351 ) ) ( not ( = ?auto_185347 ?auto_185353 ) ) ( not ( = ?auto_185348 ?auto_185351 ) ) ( not ( = ?auto_185348 ?auto_185353 ) ) ( not ( = ?auto_185349 ?auto_185351 ) ) ( not ( = ?auto_185349 ?auto_185353 ) ) ( not ( = ?auto_185350 ?auto_185351 ) ) ( not ( = ?auto_185350 ?auto_185353 ) ) ( not ( = ?auto_185352 ?auto_185351 ) ) ( not ( = ?auto_185352 ?auto_185353 ) ) ( not ( = ?auto_185351 ?auto_185353 ) ) ( ON ?auto_185351 ?auto_185352 ) ( ON ?auto_185353 ?auto_185351 ) ( CLEAR ?auto_185353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185346 ?auto_185347 ?auto_185348 ?auto_185349 ?auto_185350 ?auto_185352 ?auto_185351 )
      ( MAKE-5PILE ?auto_185346 ?auto_185347 ?auto_185348 ?auto_185349 ?auto_185350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185354 - BLOCK
      ?auto_185355 - BLOCK
      ?auto_185356 - BLOCK
      ?auto_185357 - BLOCK
      ?auto_185358 - BLOCK
    )
    :vars
    (
      ?auto_185359 - BLOCK
      ?auto_185361 - BLOCK
      ?auto_185360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185359 ?auto_185358 ) ( ON-TABLE ?auto_185354 ) ( ON ?auto_185355 ?auto_185354 ) ( ON ?auto_185356 ?auto_185355 ) ( ON ?auto_185357 ?auto_185356 ) ( ON ?auto_185358 ?auto_185357 ) ( not ( = ?auto_185354 ?auto_185355 ) ) ( not ( = ?auto_185354 ?auto_185356 ) ) ( not ( = ?auto_185354 ?auto_185357 ) ) ( not ( = ?auto_185354 ?auto_185358 ) ) ( not ( = ?auto_185354 ?auto_185359 ) ) ( not ( = ?auto_185355 ?auto_185356 ) ) ( not ( = ?auto_185355 ?auto_185357 ) ) ( not ( = ?auto_185355 ?auto_185358 ) ) ( not ( = ?auto_185355 ?auto_185359 ) ) ( not ( = ?auto_185356 ?auto_185357 ) ) ( not ( = ?auto_185356 ?auto_185358 ) ) ( not ( = ?auto_185356 ?auto_185359 ) ) ( not ( = ?auto_185357 ?auto_185358 ) ) ( not ( = ?auto_185357 ?auto_185359 ) ) ( not ( = ?auto_185358 ?auto_185359 ) ) ( not ( = ?auto_185354 ?auto_185361 ) ) ( not ( = ?auto_185354 ?auto_185360 ) ) ( not ( = ?auto_185355 ?auto_185361 ) ) ( not ( = ?auto_185355 ?auto_185360 ) ) ( not ( = ?auto_185356 ?auto_185361 ) ) ( not ( = ?auto_185356 ?auto_185360 ) ) ( not ( = ?auto_185357 ?auto_185361 ) ) ( not ( = ?auto_185357 ?auto_185360 ) ) ( not ( = ?auto_185358 ?auto_185361 ) ) ( not ( = ?auto_185358 ?auto_185360 ) ) ( not ( = ?auto_185359 ?auto_185361 ) ) ( not ( = ?auto_185359 ?auto_185360 ) ) ( not ( = ?auto_185361 ?auto_185360 ) ) ( ON ?auto_185361 ?auto_185359 ) ( HOLDING ?auto_185360 ) ( CLEAR ?auto_185361 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185354 ?auto_185355 ?auto_185356 ?auto_185357 ?auto_185358 ?auto_185359 ?auto_185361 ?auto_185360 )
      ( MAKE-5PILE ?auto_185354 ?auto_185355 ?auto_185356 ?auto_185357 ?auto_185358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185362 - BLOCK
      ?auto_185363 - BLOCK
      ?auto_185364 - BLOCK
      ?auto_185365 - BLOCK
      ?auto_185366 - BLOCK
    )
    :vars
    (
      ?auto_185369 - BLOCK
      ?auto_185368 - BLOCK
      ?auto_185367 - BLOCK
      ?auto_185370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185369 ?auto_185366 ) ( ON-TABLE ?auto_185362 ) ( ON ?auto_185363 ?auto_185362 ) ( ON ?auto_185364 ?auto_185363 ) ( ON ?auto_185365 ?auto_185364 ) ( ON ?auto_185366 ?auto_185365 ) ( not ( = ?auto_185362 ?auto_185363 ) ) ( not ( = ?auto_185362 ?auto_185364 ) ) ( not ( = ?auto_185362 ?auto_185365 ) ) ( not ( = ?auto_185362 ?auto_185366 ) ) ( not ( = ?auto_185362 ?auto_185369 ) ) ( not ( = ?auto_185363 ?auto_185364 ) ) ( not ( = ?auto_185363 ?auto_185365 ) ) ( not ( = ?auto_185363 ?auto_185366 ) ) ( not ( = ?auto_185363 ?auto_185369 ) ) ( not ( = ?auto_185364 ?auto_185365 ) ) ( not ( = ?auto_185364 ?auto_185366 ) ) ( not ( = ?auto_185364 ?auto_185369 ) ) ( not ( = ?auto_185365 ?auto_185366 ) ) ( not ( = ?auto_185365 ?auto_185369 ) ) ( not ( = ?auto_185366 ?auto_185369 ) ) ( not ( = ?auto_185362 ?auto_185368 ) ) ( not ( = ?auto_185362 ?auto_185367 ) ) ( not ( = ?auto_185363 ?auto_185368 ) ) ( not ( = ?auto_185363 ?auto_185367 ) ) ( not ( = ?auto_185364 ?auto_185368 ) ) ( not ( = ?auto_185364 ?auto_185367 ) ) ( not ( = ?auto_185365 ?auto_185368 ) ) ( not ( = ?auto_185365 ?auto_185367 ) ) ( not ( = ?auto_185366 ?auto_185368 ) ) ( not ( = ?auto_185366 ?auto_185367 ) ) ( not ( = ?auto_185369 ?auto_185368 ) ) ( not ( = ?auto_185369 ?auto_185367 ) ) ( not ( = ?auto_185368 ?auto_185367 ) ) ( ON ?auto_185368 ?auto_185369 ) ( CLEAR ?auto_185368 ) ( ON ?auto_185367 ?auto_185370 ) ( CLEAR ?auto_185367 ) ( HAND-EMPTY ) ( not ( = ?auto_185362 ?auto_185370 ) ) ( not ( = ?auto_185363 ?auto_185370 ) ) ( not ( = ?auto_185364 ?auto_185370 ) ) ( not ( = ?auto_185365 ?auto_185370 ) ) ( not ( = ?auto_185366 ?auto_185370 ) ) ( not ( = ?auto_185369 ?auto_185370 ) ) ( not ( = ?auto_185368 ?auto_185370 ) ) ( not ( = ?auto_185367 ?auto_185370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185367 ?auto_185370 )
      ( MAKE-5PILE ?auto_185362 ?auto_185363 ?auto_185364 ?auto_185365 ?auto_185366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185371 - BLOCK
      ?auto_185372 - BLOCK
      ?auto_185373 - BLOCK
      ?auto_185374 - BLOCK
      ?auto_185375 - BLOCK
    )
    :vars
    (
      ?auto_185377 - BLOCK
      ?auto_185379 - BLOCK
      ?auto_185376 - BLOCK
      ?auto_185378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185377 ?auto_185375 ) ( ON-TABLE ?auto_185371 ) ( ON ?auto_185372 ?auto_185371 ) ( ON ?auto_185373 ?auto_185372 ) ( ON ?auto_185374 ?auto_185373 ) ( ON ?auto_185375 ?auto_185374 ) ( not ( = ?auto_185371 ?auto_185372 ) ) ( not ( = ?auto_185371 ?auto_185373 ) ) ( not ( = ?auto_185371 ?auto_185374 ) ) ( not ( = ?auto_185371 ?auto_185375 ) ) ( not ( = ?auto_185371 ?auto_185377 ) ) ( not ( = ?auto_185372 ?auto_185373 ) ) ( not ( = ?auto_185372 ?auto_185374 ) ) ( not ( = ?auto_185372 ?auto_185375 ) ) ( not ( = ?auto_185372 ?auto_185377 ) ) ( not ( = ?auto_185373 ?auto_185374 ) ) ( not ( = ?auto_185373 ?auto_185375 ) ) ( not ( = ?auto_185373 ?auto_185377 ) ) ( not ( = ?auto_185374 ?auto_185375 ) ) ( not ( = ?auto_185374 ?auto_185377 ) ) ( not ( = ?auto_185375 ?auto_185377 ) ) ( not ( = ?auto_185371 ?auto_185379 ) ) ( not ( = ?auto_185371 ?auto_185376 ) ) ( not ( = ?auto_185372 ?auto_185379 ) ) ( not ( = ?auto_185372 ?auto_185376 ) ) ( not ( = ?auto_185373 ?auto_185379 ) ) ( not ( = ?auto_185373 ?auto_185376 ) ) ( not ( = ?auto_185374 ?auto_185379 ) ) ( not ( = ?auto_185374 ?auto_185376 ) ) ( not ( = ?auto_185375 ?auto_185379 ) ) ( not ( = ?auto_185375 ?auto_185376 ) ) ( not ( = ?auto_185377 ?auto_185379 ) ) ( not ( = ?auto_185377 ?auto_185376 ) ) ( not ( = ?auto_185379 ?auto_185376 ) ) ( ON ?auto_185376 ?auto_185378 ) ( CLEAR ?auto_185376 ) ( not ( = ?auto_185371 ?auto_185378 ) ) ( not ( = ?auto_185372 ?auto_185378 ) ) ( not ( = ?auto_185373 ?auto_185378 ) ) ( not ( = ?auto_185374 ?auto_185378 ) ) ( not ( = ?auto_185375 ?auto_185378 ) ) ( not ( = ?auto_185377 ?auto_185378 ) ) ( not ( = ?auto_185379 ?auto_185378 ) ) ( not ( = ?auto_185376 ?auto_185378 ) ) ( HOLDING ?auto_185379 ) ( CLEAR ?auto_185377 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185371 ?auto_185372 ?auto_185373 ?auto_185374 ?auto_185375 ?auto_185377 ?auto_185379 )
      ( MAKE-5PILE ?auto_185371 ?auto_185372 ?auto_185373 ?auto_185374 ?auto_185375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185380 - BLOCK
      ?auto_185381 - BLOCK
      ?auto_185382 - BLOCK
      ?auto_185383 - BLOCK
      ?auto_185384 - BLOCK
    )
    :vars
    (
      ?auto_185386 - BLOCK
      ?auto_185388 - BLOCK
      ?auto_185387 - BLOCK
      ?auto_185385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185386 ?auto_185384 ) ( ON-TABLE ?auto_185380 ) ( ON ?auto_185381 ?auto_185380 ) ( ON ?auto_185382 ?auto_185381 ) ( ON ?auto_185383 ?auto_185382 ) ( ON ?auto_185384 ?auto_185383 ) ( not ( = ?auto_185380 ?auto_185381 ) ) ( not ( = ?auto_185380 ?auto_185382 ) ) ( not ( = ?auto_185380 ?auto_185383 ) ) ( not ( = ?auto_185380 ?auto_185384 ) ) ( not ( = ?auto_185380 ?auto_185386 ) ) ( not ( = ?auto_185381 ?auto_185382 ) ) ( not ( = ?auto_185381 ?auto_185383 ) ) ( not ( = ?auto_185381 ?auto_185384 ) ) ( not ( = ?auto_185381 ?auto_185386 ) ) ( not ( = ?auto_185382 ?auto_185383 ) ) ( not ( = ?auto_185382 ?auto_185384 ) ) ( not ( = ?auto_185382 ?auto_185386 ) ) ( not ( = ?auto_185383 ?auto_185384 ) ) ( not ( = ?auto_185383 ?auto_185386 ) ) ( not ( = ?auto_185384 ?auto_185386 ) ) ( not ( = ?auto_185380 ?auto_185388 ) ) ( not ( = ?auto_185380 ?auto_185387 ) ) ( not ( = ?auto_185381 ?auto_185388 ) ) ( not ( = ?auto_185381 ?auto_185387 ) ) ( not ( = ?auto_185382 ?auto_185388 ) ) ( not ( = ?auto_185382 ?auto_185387 ) ) ( not ( = ?auto_185383 ?auto_185388 ) ) ( not ( = ?auto_185383 ?auto_185387 ) ) ( not ( = ?auto_185384 ?auto_185388 ) ) ( not ( = ?auto_185384 ?auto_185387 ) ) ( not ( = ?auto_185386 ?auto_185388 ) ) ( not ( = ?auto_185386 ?auto_185387 ) ) ( not ( = ?auto_185388 ?auto_185387 ) ) ( ON ?auto_185387 ?auto_185385 ) ( not ( = ?auto_185380 ?auto_185385 ) ) ( not ( = ?auto_185381 ?auto_185385 ) ) ( not ( = ?auto_185382 ?auto_185385 ) ) ( not ( = ?auto_185383 ?auto_185385 ) ) ( not ( = ?auto_185384 ?auto_185385 ) ) ( not ( = ?auto_185386 ?auto_185385 ) ) ( not ( = ?auto_185388 ?auto_185385 ) ) ( not ( = ?auto_185387 ?auto_185385 ) ) ( CLEAR ?auto_185386 ) ( ON ?auto_185388 ?auto_185387 ) ( CLEAR ?auto_185388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185385 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185385 ?auto_185387 )
      ( MAKE-5PILE ?auto_185380 ?auto_185381 ?auto_185382 ?auto_185383 ?auto_185384 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185407 - BLOCK
      ?auto_185408 - BLOCK
      ?auto_185409 - BLOCK
      ?auto_185410 - BLOCK
      ?auto_185411 - BLOCK
    )
    :vars
    (
      ?auto_185413 - BLOCK
      ?auto_185412 - BLOCK
      ?auto_185414 - BLOCK
      ?auto_185415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185407 ) ( ON ?auto_185408 ?auto_185407 ) ( ON ?auto_185409 ?auto_185408 ) ( ON ?auto_185410 ?auto_185409 ) ( not ( = ?auto_185407 ?auto_185408 ) ) ( not ( = ?auto_185407 ?auto_185409 ) ) ( not ( = ?auto_185407 ?auto_185410 ) ) ( not ( = ?auto_185407 ?auto_185411 ) ) ( not ( = ?auto_185407 ?auto_185413 ) ) ( not ( = ?auto_185408 ?auto_185409 ) ) ( not ( = ?auto_185408 ?auto_185410 ) ) ( not ( = ?auto_185408 ?auto_185411 ) ) ( not ( = ?auto_185408 ?auto_185413 ) ) ( not ( = ?auto_185409 ?auto_185410 ) ) ( not ( = ?auto_185409 ?auto_185411 ) ) ( not ( = ?auto_185409 ?auto_185413 ) ) ( not ( = ?auto_185410 ?auto_185411 ) ) ( not ( = ?auto_185410 ?auto_185413 ) ) ( not ( = ?auto_185411 ?auto_185413 ) ) ( not ( = ?auto_185407 ?auto_185412 ) ) ( not ( = ?auto_185407 ?auto_185414 ) ) ( not ( = ?auto_185408 ?auto_185412 ) ) ( not ( = ?auto_185408 ?auto_185414 ) ) ( not ( = ?auto_185409 ?auto_185412 ) ) ( not ( = ?auto_185409 ?auto_185414 ) ) ( not ( = ?auto_185410 ?auto_185412 ) ) ( not ( = ?auto_185410 ?auto_185414 ) ) ( not ( = ?auto_185411 ?auto_185412 ) ) ( not ( = ?auto_185411 ?auto_185414 ) ) ( not ( = ?auto_185413 ?auto_185412 ) ) ( not ( = ?auto_185413 ?auto_185414 ) ) ( not ( = ?auto_185412 ?auto_185414 ) ) ( ON ?auto_185414 ?auto_185415 ) ( not ( = ?auto_185407 ?auto_185415 ) ) ( not ( = ?auto_185408 ?auto_185415 ) ) ( not ( = ?auto_185409 ?auto_185415 ) ) ( not ( = ?auto_185410 ?auto_185415 ) ) ( not ( = ?auto_185411 ?auto_185415 ) ) ( not ( = ?auto_185413 ?auto_185415 ) ) ( not ( = ?auto_185412 ?auto_185415 ) ) ( not ( = ?auto_185414 ?auto_185415 ) ) ( ON ?auto_185412 ?auto_185414 ) ( ON-TABLE ?auto_185415 ) ( ON ?auto_185413 ?auto_185412 ) ( CLEAR ?auto_185413 ) ( HOLDING ?auto_185411 ) ( CLEAR ?auto_185410 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185407 ?auto_185408 ?auto_185409 ?auto_185410 ?auto_185411 ?auto_185413 )
      ( MAKE-5PILE ?auto_185407 ?auto_185408 ?auto_185409 ?auto_185410 ?auto_185411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185416 - BLOCK
      ?auto_185417 - BLOCK
      ?auto_185418 - BLOCK
      ?auto_185419 - BLOCK
      ?auto_185420 - BLOCK
    )
    :vars
    (
      ?auto_185424 - BLOCK
      ?auto_185422 - BLOCK
      ?auto_185421 - BLOCK
      ?auto_185423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185416 ) ( ON ?auto_185417 ?auto_185416 ) ( ON ?auto_185418 ?auto_185417 ) ( ON ?auto_185419 ?auto_185418 ) ( not ( = ?auto_185416 ?auto_185417 ) ) ( not ( = ?auto_185416 ?auto_185418 ) ) ( not ( = ?auto_185416 ?auto_185419 ) ) ( not ( = ?auto_185416 ?auto_185420 ) ) ( not ( = ?auto_185416 ?auto_185424 ) ) ( not ( = ?auto_185417 ?auto_185418 ) ) ( not ( = ?auto_185417 ?auto_185419 ) ) ( not ( = ?auto_185417 ?auto_185420 ) ) ( not ( = ?auto_185417 ?auto_185424 ) ) ( not ( = ?auto_185418 ?auto_185419 ) ) ( not ( = ?auto_185418 ?auto_185420 ) ) ( not ( = ?auto_185418 ?auto_185424 ) ) ( not ( = ?auto_185419 ?auto_185420 ) ) ( not ( = ?auto_185419 ?auto_185424 ) ) ( not ( = ?auto_185420 ?auto_185424 ) ) ( not ( = ?auto_185416 ?auto_185422 ) ) ( not ( = ?auto_185416 ?auto_185421 ) ) ( not ( = ?auto_185417 ?auto_185422 ) ) ( not ( = ?auto_185417 ?auto_185421 ) ) ( not ( = ?auto_185418 ?auto_185422 ) ) ( not ( = ?auto_185418 ?auto_185421 ) ) ( not ( = ?auto_185419 ?auto_185422 ) ) ( not ( = ?auto_185419 ?auto_185421 ) ) ( not ( = ?auto_185420 ?auto_185422 ) ) ( not ( = ?auto_185420 ?auto_185421 ) ) ( not ( = ?auto_185424 ?auto_185422 ) ) ( not ( = ?auto_185424 ?auto_185421 ) ) ( not ( = ?auto_185422 ?auto_185421 ) ) ( ON ?auto_185421 ?auto_185423 ) ( not ( = ?auto_185416 ?auto_185423 ) ) ( not ( = ?auto_185417 ?auto_185423 ) ) ( not ( = ?auto_185418 ?auto_185423 ) ) ( not ( = ?auto_185419 ?auto_185423 ) ) ( not ( = ?auto_185420 ?auto_185423 ) ) ( not ( = ?auto_185424 ?auto_185423 ) ) ( not ( = ?auto_185422 ?auto_185423 ) ) ( not ( = ?auto_185421 ?auto_185423 ) ) ( ON ?auto_185422 ?auto_185421 ) ( ON-TABLE ?auto_185423 ) ( ON ?auto_185424 ?auto_185422 ) ( CLEAR ?auto_185419 ) ( ON ?auto_185420 ?auto_185424 ) ( CLEAR ?auto_185420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185423 ?auto_185421 ?auto_185422 ?auto_185424 )
      ( MAKE-5PILE ?auto_185416 ?auto_185417 ?auto_185418 ?auto_185419 ?auto_185420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185425 - BLOCK
      ?auto_185426 - BLOCK
      ?auto_185427 - BLOCK
      ?auto_185428 - BLOCK
      ?auto_185429 - BLOCK
    )
    :vars
    (
      ?auto_185431 - BLOCK
      ?auto_185433 - BLOCK
      ?auto_185432 - BLOCK
      ?auto_185430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185425 ) ( ON ?auto_185426 ?auto_185425 ) ( ON ?auto_185427 ?auto_185426 ) ( not ( = ?auto_185425 ?auto_185426 ) ) ( not ( = ?auto_185425 ?auto_185427 ) ) ( not ( = ?auto_185425 ?auto_185428 ) ) ( not ( = ?auto_185425 ?auto_185429 ) ) ( not ( = ?auto_185425 ?auto_185431 ) ) ( not ( = ?auto_185426 ?auto_185427 ) ) ( not ( = ?auto_185426 ?auto_185428 ) ) ( not ( = ?auto_185426 ?auto_185429 ) ) ( not ( = ?auto_185426 ?auto_185431 ) ) ( not ( = ?auto_185427 ?auto_185428 ) ) ( not ( = ?auto_185427 ?auto_185429 ) ) ( not ( = ?auto_185427 ?auto_185431 ) ) ( not ( = ?auto_185428 ?auto_185429 ) ) ( not ( = ?auto_185428 ?auto_185431 ) ) ( not ( = ?auto_185429 ?auto_185431 ) ) ( not ( = ?auto_185425 ?auto_185433 ) ) ( not ( = ?auto_185425 ?auto_185432 ) ) ( not ( = ?auto_185426 ?auto_185433 ) ) ( not ( = ?auto_185426 ?auto_185432 ) ) ( not ( = ?auto_185427 ?auto_185433 ) ) ( not ( = ?auto_185427 ?auto_185432 ) ) ( not ( = ?auto_185428 ?auto_185433 ) ) ( not ( = ?auto_185428 ?auto_185432 ) ) ( not ( = ?auto_185429 ?auto_185433 ) ) ( not ( = ?auto_185429 ?auto_185432 ) ) ( not ( = ?auto_185431 ?auto_185433 ) ) ( not ( = ?auto_185431 ?auto_185432 ) ) ( not ( = ?auto_185433 ?auto_185432 ) ) ( ON ?auto_185432 ?auto_185430 ) ( not ( = ?auto_185425 ?auto_185430 ) ) ( not ( = ?auto_185426 ?auto_185430 ) ) ( not ( = ?auto_185427 ?auto_185430 ) ) ( not ( = ?auto_185428 ?auto_185430 ) ) ( not ( = ?auto_185429 ?auto_185430 ) ) ( not ( = ?auto_185431 ?auto_185430 ) ) ( not ( = ?auto_185433 ?auto_185430 ) ) ( not ( = ?auto_185432 ?auto_185430 ) ) ( ON ?auto_185433 ?auto_185432 ) ( ON-TABLE ?auto_185430 ) ( ON ?auto_185431 ?auto_185433 ) ( ON ?auto_185429 ?auto_185431 ) ( CLEAR ?auto_185429 ) ( HOLDING ?auto_185428 ) ( CLEAR ?auto_185427 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185425 ?auto_185426 ?auto_185427 ?auto_185428 )
      ( MAKE-5PILE ?auto_185425 ?auto_185426 ?auto_185427 ?auto_185428 ?auto_185429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185434 - BLOCK
      ?auto_185435 - BLOCK
      ?auto_185436 - BLOCK
      ?auto_185437 - BLOCK
      ?auto_185438 - BLOCK
    )
    :vars
    (
      ?auto_185440 - BLOCK
      ?auto_185441 - BLOCK
      ?auto_185439 - BLOCK
      ?auto_185442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185434 ) ( ON ?auto_185435 ?auto_185434 ) ( ON ?auto_185436 ?auto_185435 ) ( not ( = ?auto_185434 ?auto_185435 ) ) ( not ( = ?auto_185434 ?auto_185436 ) ) ( not ( = ?auto_185434 ?auto_185437 ) ) ( not ( = ?auto_185434 ?auto_185438 ) ) ( not ( = ?auto_185434 ?auto_185440 ) ) ( not ( = ?auto_185435 ?auto_185436 ) ) ( not ( = ?auto_185435 ?auto_185437 ) ) ( not ( = ?auto_185435 ?auto_185438 ) ) ( not ( = ?auto_185435 ?auto_185440 ) ) ( not ( = ?auto_185436 ?auto_185437 ) ) ( not ( = ?auto_185436 ?auto_185438 ) ) ( not ( = ?auto_185436 ?auto_185440 ) ) ( not ( = ?auto_185437 ?auto_185438 ) ) ( not ( = ?auto_185437 ?auto_185440 ) ) ( not ( = ?auto_185438 ?auto_185440 ) ) ( not ( = ?auto_185434 ?auto_185441 ) ) ( not ( = ?auto_185434 ?auto_185439 ) ) ( not ( = ?auto_185435 ?auto_185441 ) ) ( not ( = ?auto_185435 ?auto_185439 ) ) ( not ( = ?auto_185436 ?auto_185441 ) ) ( not ( = ?auto_185436 ?auto_185439 ) ) ( not ( = ?auto_185437 ?auto_185441 ) ) ( not ( = ?auto_185437 ?auto_185439 ) ) ( not ( = ?auto_185438 ?auto_185441 ) ) ( not ( = ?auto_185438 ?auto_185439 ) ) ( not ( = ?auto_185440 ?auto_185441 ) ) ( not ( = ?auto_185440 ?auto_185439 ) ) ( not ( = ?auto_185441 ?auto_185439 ) ) ( ON ?auto_185439 ?auto_185442 ) ( not ( = ?auto_185434 ?auto_185442 ) ) ( not ( = ?auto_185435 ?auto_185442 ) ) ( not ( = ?auto_185436 ?auto_185442 ) ) ( not ( = ?auto_185437 ?auto_185442 ) ) ( not ( = ?auto_185438 ?auto_185442 ) ) ( not ( = ?auto_185440 ?auto_185442 ) ) ( not ( = ?auto_185441 ?auto_185442 ) ) ( not ( = ?auto_185439 ?auto_185442 ) ) ( ON ?auto_185441 ?auto_185439 ) ( ON-TABLE ?auto_185442 ) ( ON ?auto_185440 ?auto_185441 ) ( ON ?auto_185438 ?auto_185440 ) ( CLEAR ?auto_185436 ) ( ON ?auto_185437 ?auto_185438 ) ( CLEAR ?auto_185437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185442 ?auto_185439 ?auto_185441 ?auto_185440 ?auto_185438 )
      ( MAKE-5PILE ?auto_185434 ?auto_185435 ?auto_185436 ?auto_185437 ?auto_185438 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185443 - BLOCK
      ?auto_185444 - BLOCK
      ?auto_185445 - BLOCK
      ?auto_185446 - BLOCK
      ?auto_185447 - BLOCK
    )
    :vars
    (
      ?auto_185451 - BLOCK
      ?auto_185449 - BLOCK
      ?auto_185450 - BLOCK
      ?auto_185448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185443 ) ( ON ?auto_185444 ?auto_185443 ) ( not ( = ?auto_185443 ?auto_185444 ) ) ( not ( = ?auto_185443 ?auto_185445 ) ) ( not ( = ?auto_185443 ?auto_185446 ) ) ( not ( = ?auto_185443 ?auto_185447 ) ) ( not ( = ?auto_185443 ?auto_185451 ) ) ( not ( = ?auto_185444 ?auto_185445 ) ) ( not ( = ?auto_185444 ?auto_185446 ) ) ( not ( = ?auto_185444 ?auto_185447 ) ) ( not ( = ?auto_185444 ?auto_185451 ) ) ( not ( = ?auto_185445 ?auto_185446 ) ) ( not ( = ?auto_185445 ?auto_185447 ) ) ( not ( = ?auto_185445 ?auto_185451 ) ) ( not ( = ?auto_185446 ?auto_185447 ) ) ( not ( = ?auto_185446 ?auto_185451 ) ) ( not ( = ?auto_185447 ?auto_185451 ) ) ( not ( = ?auto_185443 ?auto_185449 ) ) ( not ( = ?auto_185443 ?auto_185450 ) ) ( not ( = ?auto_185444 ?auto_185449 ) ) ( not ( = ?auto_185444 ?auto_185450 ) ) ( not ( = ?auto_185445 ?auto_185449 ) ) ( not ( = ?auto_185445 ?auto_185450 ) ) ( not ( = ?auto_185446 ?auto_185449 ) ) ( not ( = ?auto_185446 ?auto_185450 ) ) ( not ( = ?auto_185447 ?auto_185449 ) ) ( not ( = ?auto_185447 ?auto_185450 ) ) ( not ( = ?auto_185451 ?auto_185449 ) ) ( not ( = ?auto_185451 ?auto_185450 ) ) ( not ( = ?auto_185449 ?auto_185450 ) ) ( ON ?auto_185450 ?auto_185448 ) ( not ( = ?auto_185443 ?auto_185448 ) ) ( not ( = ?auto_185444 ?auto_185448 ) ) ( not ( = ?auto_185445 ?auto_185448 ) ) ( not ( = ?auto_185446 ?auto_185448 ) ) ( not ( = ?auto_185447 ?auto_185448 ) ) ( not ( = ?auto_185451 ?auto_185448 ) ) ( not ( = ?auto_185449 ?auto_185448 ) ) ( not ( = ?auto_185450 ?auto_185448 ) ) ( ON ?auto_185449 ?auto_185450 ) ( ON-TABLE ?auto_185448 ) ( ON ?auto_185451 ?auto_185449 ) ( ON ?auto_185447 ?auto_185451 ) ( ON ?auto_185446 ?auto_185447 ) ( CLEAR ?auto_185446 ) ( HOLDING ?auto_185445 ) ( CLEAR ?auto_185444 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185443 ?auto_185444 ?auto_185445 )
      ( MAKE-5PILE ?auto_185443 ?auto_185444 ?auto_185445 ?auto_185446 ?auto_185447 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185452 - BLOCK
      ?auto_185453 - BLOCK
      ?auto_185454 - BLOCK
      ?auto_185455 - BLOCK
      ?auto_185456 - BLOCK
    )
    :vars
    (
      ?auto_185458 - BLOCK
      ?auto_185457 - BLOCK
      ?auto_185460 - BLOCK
      ?auto_185459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185452 ) ( ON ?auto_185453 ?auto_185452 ) ( not ( = ?auto_185452 ?auto_185453 ) ) ( not ( = ?auto_185452 ?auto_185454 ) ) ( not ( = ?auto_185452 ?auto_185455 ) ) ( not ( = ?auto_185452 ?auto_185456 ) ) ( not ( = ?auto_185452 ?auto_185458 ) ) ( not ( = ?auto_185453 ?auto_185454 ) ) ( not ( = ?auto_185453 ?auto_185455 ) ) ( not ( = ?auto_185453 ?auto_185456 ) ) ( not ( = ?auto_185453 ?auto_185458 ) ) ( not ( = ?auto_185454 ?auto_185455 ) ) ( not ( = ?auto_185454 ?auto_185456 ) ) ( not ( = ?auto_185454 ?auto_185458 ) ) ( not ( = ?auto_185455 ?auto_185456 ) ) ( not ( = ?auto_185455 ?auto_185458 ) ) ( not ( = ?auto_185456 ?auto_185458 ) ) ( not ( = ?auto_185452 ?auto_185457 ) ) ( not ( = ?auto_185452 ?auto_185460 ) ) ( not ( = ?auto_185453 ?auto_185457 ) ) ( not ( = ?auto_185453 ?auto_185460 ) ) ( not ( = ?auto_185454 ?auto_185457 ) ) ( not ( = ?auto_185454 ?auto_185460 ) ) ( not ( = ?auto_185455 ?auto_185457 ) ) ( not ( = ?auto_185455 ?auto_185460 ) ) ( not ( = ?auto_185456 ?auto_185457 ) ) ( not ( = ?auto_185456 ?auto_185460 ) ) ( not ( = ?auto_185458 ?auto_185457 ) ) ( not ( = ?auto_185458 ?auto_185460 ) ) ( not ( = ?auto_185457 ?auto_185460 ) ) ( ON ?auto_185460 ?auto_185459 ) ( not ( = ?auto_185452 ?auto_185459 ) ) ( not ( = ?auto_185453 ?auto_185459 ) ) ( not ( = ?auto_185454 ?auto_185459 ) ) ( not ( = ?auto_185455 ?auto_185459 ) ) ( not ( = ?auto_185456 ?auto_185459 ) ) ( not ( = ?auto_185458 ?auto_185459 ) ) ( not ( = ?auto_185457 ?auto_185459 ) ) ( not ( = ?auto_185460 ?auto_185459 ) ) ( ON ?auto_185457 ?auto_185460 ) ( ON-TABLE ?auto_185459 ) ( ON ?auto_185458 ?auto_185457 ) ( ON ?auto_185456 ?auto_185458 ) ( ON ?auto_185455 ?auto_185456 ) ( CLEAR ?auto_185453 ) ( ON ?auto_185454 ?auto_185455 ) ( CLEAR ?auto_185454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185459 ?auto_185460 ?auto_185457 ?auto_185458 ?auto_185456 ?auto_185455 )
      ( MAKE-5PILE ?auto_185452 ?auto_185453 ?auto_185454 ?auto_185455 ?auto_185456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185461 - BLOCK
      ?auto_185462 - BLOCK
      ?auto_185463 - BLOCK
      ?auto_185464 - BLOCK
      ?auto_185465 - BLOCK
    )
    :vars
    (
      ?auto_185468 - BLOCK
      ?auto_185467 - BLOCK
      ?auto_185466 - BLOCK
      ?auto_185469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185461 ) ( not ( = ?auto_185461 ?auto_185462 ) ) ( not ( = ?auto_185461 ?auto_185463 ) ) ( not ( = ?auto_185461 ?auto_185464 ) ) ( not ( = ?auto_185461 ?auto_185465 ) ) ( not ( = ?auto_185461 ?auto_185468 ) ) ( not ( = ?auto_185462 ?auto_185463 ) ) ( not ( = ?auto_185462 ?auto_185464 ) ) ( not ( = ?auto_185462 ?auto_185465 ) ) ( not ( = ?auto_185462 ?auto_185468 ) ) ( not ( = ?auto_185463 ?auto_185464 ) ) ( not ( = ?auto_185463 ?auto_185465 ) ) ( not ( = ?auto_185463 ?auto_185468 ) ) ( not ( = ?auto_185464 ?auto_185465 ) ) ( not ( = ?auto_185464 ?auto_185468 ) ) ( not ( = ?auto_185465 ?auto_185468 ) ) ( not ( = ?auto_185461 ?auto_185467 ) ) ( not ( = ?auto_185461 ?auto_185466 ) ) ( not ( = ?auto_185462 ?auto_185467 ) ) ( not ( = ?auto_185462 ?auto_185466 ) ) ( not ( = ?auto_185463 ?auto_185467 ) ) ( not ( = ?auto_185463 ?auto_185466 ) ) ( not ( = ?auto_185464 ?auto_185467 ) ) ( not ( = ?auto_185464 ?auto_185466 ) ) ( not ( = ?auto_185465 ?auto_185467 ) ) ( not ( = ?auto_185465 ?auto_185466 ) ) ( not ( = ?auto_185468 ?auto_185467 ) ) ( not ( = ?auto_185468 ?auto_185466 ) ) ( not ( = ?auto_185467 ?auto_185466 ) ) ( ON ?auto_185466 ?auto_185469 ) ( not ( = ?auto_185461 ?auto_185469 ) ) ( not ( = ?auto_185462 ?auto_185469 ) ) ( not ( = ?auto_185463 ?auto_185469 ) ) ( not ( = ?auto_185464 ?auto_185469 ) ) ( not ( = ?auto_185465 ?auto_185469 ) ) ( not ( = ?auto_185468 ?auto_185469 ) ) ( not ( = ?auto_185467 ?auto_185469 ) ) ( not ( = ?auto_185466 ?auto_185469 ) ) ( ON ?auto_185467 ?auto_185466 ) ( ON-TABLE ?auto_185469 ) ( ON ?auto_185468 ?auto_185467 ) ( ON ?auto_185465 ?auto_185468 ) ( ON ?auto_185464 ?auto_185465 ) ( ON ?auto_185463 ?auto_185464 ) ( CLEAR ?auto_185463 ) ( HOLDING ?auto_185462 ) ( CLEAR ?auto_185461 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185461 ?auto_185462 )
      ( MAKE-5PILE ?auto_185461 ?auto_185462 ?auto_185463 ?auto_185464 ?auto_185465 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185470 - BLOCK
      ?auto_185471 - BLOCK
      ?auto_185472 - BLOCK
      ?auto_185473 - BLOCK
      ?auto_185474 - BLOCK
    )
    :vars
    (
      ?auto_185476 - BLOCK
      ?auto_185475 - BLOCK
      ?auto_185477 - BLOCK
      ?auto_185478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185470 ) ( not ( = ?auto_185470 ?auto_185471 ) ) ( not ( = ?auto_185470 ?auto_185472 ) ) ( not ( = ?auto_185470 ?auto_185473 ) ) ( not ( = ?auto_185470 ?auto_185474 ) ) ( not ( = ?auto_185470 ?auto_185476 ) ) ( not ( = ?auto_185471 ?auto_185472 ) ) ( not ( = ?auto_185471 ?auto_185473 ) ) ( not ( = ?auto_185471 ?auto_185474 ) ) ( not ( = ?auto_185471 ?auto_185476 ) ) ( not ( = ?auto_185472 ?auto_185473 ) ) ( not ( = ?auto_185472 ?auto_185474 ) ) ( not ( = ?auto_185472 ?auto_185476 ) ) ( not ( = ?auto_185473 ?auto_185474 ) ) ( not ( = ?auto_185473 ?auto_185476 ) ) ( not ( = ?auto_185474 ?auto_185476 ) ) ( not ( = ?auto_185470 ?auto_185475 ) ) ( not ( = ?auto_185470 ?auto_185477 ) ) ( not ( = ?auto_185471 ?auto_185475 ) ) ( not ( = ?auto_185471 ?auto_185477 ) ) ( not ( = ?auto_185472 ?auto_185475 ) ) ( not ( = ?auto_185472 ?auto_185477 ) ) ( not ( = ?auto_185473 ?auto_185475 ) ) ( not ( = ?auto_185473 ?auto_185477 ) ) ( not ( = ?auto_185474 ?auto_185475 ) ) ( not ( = ?auto_185474 ?auto_185477 ) ) ( not ( = ?auto_185476 ?auto_185475 ) ) ( not ( = ?auto_185476 ?auto_185477 ) ) ( not ( = ?auto_185475 ?auto_185477 ) ) ( ON ?auto_185477 ?auto_185478 ) ( not ( = ?auto_185470 ?auto_185478 ) ) ( not ( = ?auto_185471 ?auto_185478 ) ) ( not ( = ?auto_185472 ?auto_185478 ) ) ( not ( = ?auto_185473 ?auto_185478 ) ) ( not ( = ?auto_185474 ?auto_185478 ) ) ( not ( = ?auto_185476 ?auto_185478 ) ) ( not ( = ?auto_185475 ?auto_185478 ) ) ( not ( = ?auto_185477 ?auto_185478 ) ) ( ON ?auto_185475 ?auto_185477 ) ( ON-TABLE ?auto_185478 ) ( ON ?auto_185476 ?auto_185475 ) ( ON ?auto_185474 ?auto_185476 ) ( ON ?auto_185473 ?auto_185474 ) ( ON ?auto_185472 ?auto_185473 ) ( CLEAR ?auto_185470 ) ( ON ?auto_185471 ?auto_185472 ) ( CLEAR ?auto_185471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185478 ?auto_185477 ?auto_185475 ?auto_185476 ?auto_185474 ?auto_185473 ?auto_185472 )
      ( MAKE-5PILE ?auto_185470 ?auto_185471 ?auto_185472 ?auto_185473 ?auto_185474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185479 - BLOCK
      ?auto_185480 - BLOCK
      ?auto_185481 - BLOCK
      ?auto_185482 - BLOCK
      ?auto_185483 - BLOCK
    )
    :vars
    (
      ?auto_185487 - BLOCK
      ?auto_185486 - BLOCK
      ?auto_185485 - BLOCK
      ?auto_185484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185479 ?auto_185480 ) ) ( not ( = ?auto_185479 ?auto_185481 ) ) ( not ( = ?auto_185479 ?auto_185482 ) ) ( not ( = ?auto_185479 ?auto_185483 ) ) ( not ( = ?auto_185479 ?auto_185487 ) ) ( not ( = ?auto_185480 ?auto_185481 ) ) ( not ( = ?auto_185480 ?auto_185482 ) ) ( not ( = ?auto_185480 ?auto_185483 ) ) ( not ( = ?auto_185480 ?auto_185487 ) ) ( not ( = ?auto_185481 ?auto_185482 ) ) ( not ( = ?auto_185481 ?auto_185483 ) ) ( not ( = ?auto_185481 ?auto_185487 ) ) ( not ( = ?auto_185482 ?auto_185483 ) ) ( not ( = ?auto_185482 ?auto_185487 ) ) ( not ( = ?auto_185483 ?auto_185487 ) ) ( not ( = ?auto_185479 ?auto_185486 ) ) ( not ( = ?auto_185479 ?auto_185485 ) ) ( not ( = ?auto_185480 ?auto_185486 ) ) ( not ( = ?auto_185480 ?auto_185485 ) ) ( not ( = ?auto_185481 ?auto_185486 ) ) ( not ( = ?auto_185481 ?auto_185485 ) ) ( not ( = ?auto_185482 ?auto_185486 ) ) ( not ( = ?auto_185482 ?auto_185485 ) ) ( not ( = ?auto_185483 ?auto_185486 ) ) ( not ( = ?auto_185483 ?auto_185485 ) ) ( not ( = ?auto_185487 ?auto_185486 ) ) ( not ( = ?auto_185487 ?auto_185485 ) ) ( not ( = ?auto_185486 ?auto_185485 ) ) ( ON ?auto_185485 ?auto_185484 ) ( not ( = ?auto_185479 ?auto_185484 ) ) ( not ( = ?auto_185480 ?auto_185484 ) ) ( not ( = ?auto_185481 ?auto_185484 ) ) ( not ( = ?auto_185482 ?auto_185484 ) ) ( not ( = ?auto_185483 ?auto_185484 ) ) ( not ( = ?auto_185487 ?auto_185484 ) ) ( not ( = ?auto_185486 ?auto_185484 ) ) ( not ( = ?auto_185485 ?auto_185484 ) ) ( ON ?auto_185486 ?auto_185485 ) ( ON-TABLE ?auto_185484 ) ( ON ?auto_185487 ?auto_185486 ) ( ON ?auto_185483 ?auto_185487 ) ( ON ?auto_185482 ?auto_185483 ) ( ON ?auto_185481 ?auto_185482 ) ( ON ?auto_185480 ?auto_185481 ) ( CLEAR ?auto_185480 ) ( HOLDING ?auto_185479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185479 )
      ( MAKE-5PILE ?auto_185479 ?auto_185480 ?auto_185481 ?auto_185482 ?auto_185483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_185488 - BLOCK
      ?auto_185489 - BLOCK
      ?auto_185490 - BLOCK
      ?auto_185491 - BLOCK
      ?auto_185492 - BLOCK
    )
    :vars
    (
      ?auto_185493 - BLOCK
      ?auto_185496 - BLOCK
      ?auto_185495 - BLOCK
      ?auto_185494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185488 ?auto_185489 ) ) ( not ( = ?auto_185488 ?auto_185490 ) ) ( not ( = ?auto_185488 ?auto_185491 ) ) ( not ( = ?auto_185488 ?auto_185492 ) ) ( not ( = ?auto_185488 ?auto_185493 ) ) ( not ( = ?auto_185489 ?auto_185490 ) ) ( not ( = ?auto_185489 ?auto_185491 ) ) ( not ( = ?auto_185489 ?auto_185492 ) ) ( not ( = ?auto_185489 ?auto_185493 ) ) ( not ( = ?auto_185490 ?auto_185491 ) ) ( not ( = ?auto_185490 ?auto_185492 ) ) ( not ( = ?auto_185490 ?auto_185493 ) ) ( not ( = ?auto_185491 ?auto_185492 ) ) ( not ( = ?auto_185491 ?auto_185493 ) ) ( not ( = ?auto_185492 ?auto_185493 ) ) ( not ( = ?auto_185488 ?auto_185496 ) ) ( not ( = ?auto_185488 ?auto_185495 ) ) ( not ( = ?auto_185489 ?auto_185496 ) ) ( not ( = ?auto_185489 ?auto_185495 ) ) ( not ( = ?auto_185490 ?auto_185496 ) ) ( not ( = ?auto_185490 ?auto_185495 ) ) ( not ( = ?auto_185491 ?auto_185496 ) ) ( not ( = ?auto_185491 ?auto_185495 ) ) ( not ( = ?auto_185492 ?auto_185496 ) ) ( not ( = ?auto_185492 ?auto_185495 ) ) ( not ( = ?auto_185493 ?auto_185496 ) ) ( not ( = ?auto_185493 ?auto_185495 ) ) ( not ( = ?auto_185496 ?auto_185495 ) ) ( ON ?auto_185495 ?auto_185494 ) ( not ( = ?auto_185488 ?auto_185494 ) ) ( not ( = ?auto_185489 ?auto_185494 ) ) ( not ( = ?auto_185490 ?auto_185494 ) ) ( not ( = ?auto_185491 ?auto_185494 ) ) ( not ( = ?auto_185492 ?auto_185494 ) ) ( not ( = ?auto_185493 ?auto_185494 ) ) ( not ( = ?auto_185496 ?auto_185494 ) ) ( not ( = ?auto_185495 ?auto_185494 ) ) ( ON ?auto_185496 ?auto_185495 ) ( ON-TABLE ?auto_185494 ) ( ON ?auto_185493 ?auto_185496 ) ( ON ?auto_185492 ?auto_185493 ) ( ON ?auto_185491 ?auto_185492 ) ( ON ?auto_185490 ?auto_185491 ) ( ON ?auto_185489 ?auto_185490 ) ( ON ?auto_185488 ?auto_185489 ) ( CLEAR ?auto_185488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185494 ?auto_185495 ?auto_185496 ?auto_185493 ?auto_185492 ?auto_185491 ?auto_185490 ?auto_185489 )
      ( MAKE-5PILE ?auto_185488 ?auto_185489 ?auto_185490 ?auto_185491 ?auto_185492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185500 - BLOCK
      ?auto_185501 - BLOCK
      ?auto_185502 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_185502 ) ( CLEAR ?auto_185501 ) ( ON-TABLE ?auto_185500 ) ( ON ?auto_185501 ?auto_185500 ) ( not ( = ?auto_185500 ?auto_185501 ) ) ( not ( = ?auto_185500 ?auto_185502 ) ) ( not ( = ?auto_185501 ?auto_185502 ) ) )
    :subtasks
    ( ( !STACK ?auto_185502 ?auto_185501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185503 - BLOCK
      ?auto_185504 - BLOCK
      ?auto_185505 - BLOCK
    )
    :vars
    (
      ?auto_185506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_185504 ) ( ON-TABLE ?auto_185503 ) ( ON ?auto_185504 ?auto_185503 ) ( not ( = ?auto_185503 ?auto_185504 ) ) ( not ( = ?auto_185503 ?auto_185505 ) ) ( not ( = ?auto_185504 ?auto_185505 ) ) ( ON ?auto_185505 ?auto_185506 ) ( CLEAR ?auto_185505 ) ( HAND-EMPTY ) ( not ( = ?auto_185503 ?auto_185506 ) ) ( not ( = ?auto_185504 ?auto_185506 ) ) ( not ( = ?auto_185505 ?auto_185506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185505 ?auto_185506 )
      ( MAKE-3PILE ?auto_185503 ?auto_185504 ?auto_185505 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185507 - BLOCK
      ?auto_185508 - BLOCK
      ?auto_185509 - BLOCK
    )
    :vars
    (
      ?auto_185510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185507 ) ( not ( = ?auto_185507 ?auto_185508 ) ) ( not ( = ?auto_185507 ?auto_185509 ) ) ( not ( = ?auto_185508 ?auto_185509 ) ) ( ON ?auto_185509 ?auto_185510 ) ( CLEAR ?auto_185509 ) ( not ( = ?auto_185507 ?auto_185510 ) ) ( not ( = ?auto_185508 ?auto_185510 ) ) ( not ( = ?auto_185509 ?auto_185510 ) ) ( HOLDING ?auto_185508 ) ( CLEAR ?auto_185507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185507 ?auto_185508 )
      ( MAKE-3PILE ?auto_185507 ?auto_185508 ?auto_185509 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185511 - BLOCK
      ?auto_185512 - BLOCK
      ?auto_185513 - BLOCK
    )
    :vars
    (
      ?auto_185514 - BLOCK
      ?auto_185516 - BLOCK
      ?auto_185515 - BLOCK
      ?auto_185517 - BLOCK
      ?auto_185518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185511 ) ( not ( = ?auto_185511 ?auto_185512 ) ) ( not ( = ?auto_185511 ?auto_185513 ) ) ( not ( = ?auto_185512 ?auto_185513 ) ) ( ON ?auto_185513 ?auto_185514 ) ( not ( = ?auto_185511 ?auto_185514 ) ) ( not ( = ?auto_185512 ?auto_185514 ) ) ( not ( = ?auto_185513 ?auto_185514 ) ) ( CLEAR ?auto_185511 ) ( ON ?auto_185512 ?auto_185513 ) ( CLEAR ?auto_185512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185516 ) ( ON ?auto_185515 ?auto_185516 ) ( ON ?auto_185517 ?auto_185515 ) ( ON ?auto_185518 ?auto_185517 ) ( ON ?auto_185514 ?auto_185518 ) ( not ( = ?auto_185516 ?auto_185515 ) ) ( not ( = ?auto_185516 ?auto_185517 ) ) ( not ( = ?auto_185516 ?auto_185518 ) ) ( not ( = ?auto_185516 ?auto_185514 ) ) ( not ( = ?auto_185516 ?auto_185513 ) ) ( not ( = ?auto_185516 ?auto_185512 ) ) ( not ( = ?auto_185515 ?auto_185517 ) ) ( not ( = ?auto_185515 ?auto_185518 ) ) ( not ( = ?auto_185515 ?auto_185514 ) ) ( not ( = ?auto_185515 ?auto_185513 ) ) ( not ( = ?auto_185515 ?auto_185512 ) ) ( not ( = ?auto_185517 ?auto_185518 ) ) ( not ( = ?auto_185517 ?auto_185514 ) ) ( not ( = ?auto_185517 ?auto_185513 ) ) ( not ( = ?auto_185517 ?auto_185512 ) ) ( not ( = ?auto_185518 ?auto_185514 ) ) ( not ( = ?auto_185518 ?auto_185513 ) ) ( not ( = ?auto_185518 ?auto_185512 ) ) ( not ( = ?auto_185511 ?auto_185516 ) ) ( not ( = ?auto_185511 ?auto_185515 ) ) ( not ( = ?auto_185511 ?auto_185517 ) ) ( not ( = ?auto_185511 ?auto_185518 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185516 ?auto_185515 ?auto_185517 ?auto_185518 ?auto_185514 ?auto_185513 )
      ( MAKE-3PILE ?auto_185511 ?auto_185512 ?auto_185513 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185519 - BLOCK
      ?auto_185520 - BLOCK
      ?auto_185521 - BLOCK
    )
    :vars
    (
      ?auto_185525 - BLOCK
      ?auto_185523 - BLOCK
      ?auto_185526 - BLOCK
      ?auto_185524 - BLOCK
      ?auto_185522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185519 ?auto_185520 ) ) ( not ( = ?auto_185519 ?auto_185521 ) ) ( not ( = ?auto_185520 ?auto_185521 ) ) ( ON ?auto_185521 ?auto_185525 ) ( not ( = ?auto_185519 ?auto_185525 ) ) ( not ( = ?auto_185520 ?auto_185525 ) ) ( not ( = ?auto_185521 ?auto_185525 ) ) ( ON ?auto_185520 ?auto_185521 ) ( CLEAR ?auto_185520 ) ( ON-TABLE ?auto_185523 ) ( ON ?auto_185526 ?auto_185523 ) ( ON ?auto_185524 ?auto_185526 ) ( ON ?auto_185522 ?auto_185524 ) ( ON ?auto_185525 ?auto_185522 ) ( not ( = ?auto_185523 ?auto_185526 ) ) ( not ( = ?auto_185523 ?auto_185524 ) ) ( not ( = ?auto_185523 ?auto_185522 ) ) ( not ( = ?auto_185523 ?auto_185525 ) ) ( not ( = ?auto_185523 ?auto_185521 ) ) ( not ( = ?auto_185523 ?auto_185520 ) ) ( not ( = ?auto_185526 ?auto_185524 ) ) ( not ( = ?auto_185526 ?auto_185522 ) ) ( not ( = ?auto_185526 ?auto_185525 ) ) ( not ( = ?auto_185526 ?auto_185521 ) ) ( not ( = ?auto_185526 ?auto_185520 ) ) ( not ( = ?auto_185524 ?auto_185522 ) ) ( not ( = ?auto_185524 ?auto_185525 ) ) ( not ( = ?auto_185524 ?auto_185521 ) ) ( not ( = ?auto_185524 ?auto_185520 ) ) ( not ( = ?auto_185522 ?auto_185525 ) ) ( not ( = ?auto_185522 ?auto_185521 ) ) ( not ( = ?auto_185522 ?auto_185520 ) ) ( not ( = ?auto_185519 ?auto_185523 ) ) ( not ( = ?auto_185519 ?auto_185526 ) ) ( not ( = ?auto_185519 ?auto_185524 ) ) ( not ( = ?auto_185519 ?auto_185522 ) ) ( HOLDING ?auto_185519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185519 )
      ( MAKE-3PILE ?auto_185519 ?auto_185520 ?auto_185521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185527 - BLOCK
      ?auto_185528 - BLOCK
      ?auto_185529 - BLOCK
    )
    :vars
    (
      ?auto_185534 - BLOCK
      ?auto_185531 - BLOCK
      ?auto_185530 - BLOCK
      ?auto_185533 - BLOCK
      ?auto_185532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185527 ?auto_185528 ) ) ( not ( = ?auto_185527 ?auto_185529 ) ) ( not ( = ?auto_185528 ?auto_185529 ) ) ( ON ?auto_185529 ?auto_185534 ) ( not ( = ?auto_185527 ?auto_185534 ) ) ( not ( = ?auto_185528 ?auto_185534 ) ) ( not ( = ?auto_185529 ?auto_185534 ) ) ( ON ?auto_185528 ?auto_185529 ) ( ON-TABLE ?auto_185531 ) ( ON ?auto_185530 ?auto_185531 ) ( ON ?auto_185533 ?auto_185530 ) ( ON ?auto_185532 ?auto_185533 ) ( ON ?auto_185534 ?auto_185532 ) ( not ( = ?auto_185531 ?auto_185530 ) ) ( not ( = ?auto_185531 ?auto_185533 ) ) ( not ( = ?auto_185531 ?auto_185532 ) ) ( not ( = ?auto_185531 ?auto_185534 ) ) ( not ( = ?auto_185531 ?auto_185529 ) ) ( not ( = ?auto_185531 ?auto_185528 ) ) ( not ( = ?auto_185530 ?auto_185533 ) ) ( not ( = ?auto_185530 ?auto_185532 ) ) ( not ( = ?auto_185530 ?auto_185534 ) ) ( not ( = ?auto_185530 ?auto_185529 ) ) ( not ( = ?auto_185530 ?auto_185528 ) ) ( not ( = ?auto_185533 ?auto_185532 ) ) ( not ( = ?auto_185533 ?auto_185534 ) ) ( not ( = ?auto_185533 ?auto_185529 ) ) ( not ( = ?auto_185533 ?auto_185528 ) ) ( not ( = ?auto_185532 ?auto_185534 ) ) ( not ( = ?auto_185532 ?auto_185529 ) ) ( not ( = ?auto_185532 ?auto_185528 ) ) ( not ( = ?auto_185527 ?auto_185531 ) ) ( not ( = ?auto_185527 ?auto_185530 ) ) ( not ( = ?auto_185527 ?auto_185533 ) ) ( not ( = ?auto_185527 ?auto_185532 ) ) ( ON ?auto_185527 ?auto_185528 ) ( CLEAR ?auto_185527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185531 ?auto_185530 ?auto_185533 ?auto_185532 ?auto_185534 ?auto_185529 ?auto_185528 )
      ( MAKE-3PILE ?auto_185527 ?auto_185528 ?auto_185529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185535 - BLOCK
      ?auto_185536 - BLOCK
      ?auto_185537 - BLOCK
    )
    :vars
    (
      ?auto_185540 - BLOCK
      ?auto_185539 - BLOCK
      ?auto_185541 - BLOCK
      ?auto_185538 - BLOCK
      ?auto_185542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185535 ?auto_185536 ) ) ( not ( = ?auto_185535 ?auto_185537 ) ) ( not ( = ?auto_185536 ?auto_185537 ) ) ( ON ?auto_185537 ?auto_185540 ) ( not ( = ?auto_185535 ?auto_185540 ) ) ( not ( = ?auto_185536 ?auto_185540 ) ) ( not ( = ?auto_185537 ?auto_185540 ) ) ( ON ?auto_185536 ?auto_185537 ) ( ON-TABLE ?auto_185539 ) ( ON ?auto_185541 ?auto_185539 ) ( ON ?auto_185538 ?auto_185541 ) ( ON ?auto_185542 ?auto_185538 ) ( ON ?auto_185540 ?auto_185542 ) ( not ( = ?auto_185539 ?auto_185541 ) ) ( not ( = ?auto_185539 ?auto_185538 ) ) ( not ( = ?auto_185539 ?auto_185542 ) ) ( not ( = ?auto_185539 ?auto_185540 ) ) ( not ( = ?auto_185539 ?auto_185537 ) ) ( not ( = ?auto_185539 ?auto_185536 ) ) ( not ( = ?auto_185541 ?auto_185538 ) ) ( not ( = ?auto_185541 ?auto_185542 ) ) ( not ( = ?auto_185541 ?auto_185540 ) ) ( not ( = ?auto_185541 ?auto_185537 ) ) ( not ( = ?auto_185541 ?auto_185536 ) ) ( not ( = ?auto_185538 ?auto_185542 ) ) ( not ( = ?auto_185538 ?auto_185540 ) ) ( not ( = ?auto_185538 ?auto_185537 ) ) ( not ( = ?auto_185538 ?auto_185536 ) ) ( not ( = ?auto_185542 ?auto_185540 ) ) ( not ( = ?auto_185542 ?auto_185537 ) ) ( not ( = ?auto_185542 ?auto_185536 ) ) ( not ( = ?auto_185535 ?auto_185539 ) ) ( not ( = ?auto_185535 ?auto_185541 ) ) ( not ( = ?auto_185535 ?auto_185538 ) ) ( not ( = ?auto_185535 ?auto_185542 ) ) ( HOLDING ?auto_185535 ) ( CLEAR ?auto_185536 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185539 ?auto_185541 ?auto_185538 ?auto_185542 ?auto_185540 ?auto_185537 ?auto_185536 ?auto_185535 )
      ( MAKE-3PILE ?auto_185535 ?auto_185536 ?auto_185537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185543 - BLOCK
      ?auto_185544 - BLOCK
      ?auto_185545 - BLOCK
    )
    :vars
    (
      ?auto_185547 - BLOCK
      ?auto_185549 - BLOCK
      ?auto_185546 - BLOCK
      ?auto_185548 - BLOCK
      ?auto_185550 - BLOCK
      ?auto_185551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185543 ?auto_185544 ) ) ( not ( = ?auto_185543 ?auto_185545 ) ) ( not ( = ?auto_185544 ?auto_185545 ) ) ( ON ?auto_185545 ?auto_185547 ) ( not ( = ?auto_185543 ?auto_185547 ) ) ( not ( = ?auto_185544 ?auto_185547 ) ) ( not ( = ?auto_185545 ?auto_185547 ) ) ( ON ?auto_185544 ?auto_185545 ) ( ON-TABLE ?auto_185549 ) ( ON ?auto_185546 ?auto_185549 ) ( ON ?auto_185548 ?auto_185546 ) ( ON ?auto_185550 ?auto_185548 ) ( ON ?auto_185547 ?auto_185550 ) ( not ( = ?auto_185549 ?auto_185546 ) ) ( not ( = ?auto_185549 ?auto_185548 ) ) ( not ( = ?auto_185549 ?auto_185550 ) ) ( not ( = ?auto_185549 ?auto_185547 ) ) ( not ( = ?auto_185549 ?auto_185545 ) ) ( not ( = ?auto_185549 ?auto_185544 ) ) ( not ( = ?auto_185546 ?auto_185548 ) ) ( not ( = ?auto_185546 ?auto_185550 ) ) ( not ( = ?auto_185546 ?auto_185547 ) ) ( not ( = ?auto_185546 ?auto_185545 ) ) ( not ( = ?auto_185546 ?auto_185544 ) ) ( not ( = ?auto_185548 ?auto_185550 ) ) ( not ( = ?auto_185548 ?auto_185547 ) ) ( not ( = ?auto_185548 ?auto_185545 ) ) ( not ( = ?auto_185548 ?auto_185544 ) ) ( not ( = ?auto_185550 ?auto_185547 ) ) ( not ( = ?auto_185550 ?auto_185545 ) ) ( not ( = ?auto_185550 ?auto_185544 ) ) ( not ( = ?auto_185543 ?auto_185549 ) ) ( not ( = ?auto_185543 ?auto_185546 ) ) ( not ( = ?auto_185543 ?auto_185548 ) ) ( not ( = ?auto_185543 ?auto_185550 ) ) ( CLEAR ?auto_185544 ) ( ON ?auto_185543 ?auto_185551 ) ( CLEAR ?auto_185543 ) ( HAND-EMPTY ) ( not ( = ?auto_185543 ?auto_185551 ) ) ( not ( = ?auto_185544 ?auto_185551 ) ) ( not ( = ?auto_185545 ?auto_185551 ) ) ( not ( = ?auto_185547 ?auto_185551 ) ) ( not ( = ?auto_185549 ?auto_185551 ) ) ( not ( = ?auto_185546 ?auto_185551 ) ) ( not ( = ?auto_185548 ?auto_185551 ) ) ( not ( = ?auto_185550 ?auto_185551 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185543 ?auto_185551 )
      ( MAKE-3PILE ?auto_185543 ?auto_185544 ?auto_185545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185552 - BLOCK
      ?auto_185553 - BLOCK
      ?auto_185554 - BLOCK
    )
    :vars
    (
      ?auto_185556 - BLOCK
      ?auto_185558 - BLOCK
      ?auto_185559 - BLOCK
      ?auto_185555 - BLOCK
      ?auto_185560 - BLOCK
      ?auto_185557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185552 ?auto_185553 ) ) ( not ( = ?auto_185552 ?auto_185554 ) ) ( not ( = ?auto_185553 ?auto_185554 ) ) ( ON ?auto_185554 ?auto_185556 ) ( not ( = ?auto_185552 ?auto_185556 ) ) ( not ( = ?auto_185553 ?auto_185556 ) ) ( not ( = ?auto_185554 ?auto_185556 ) ) ( ON-TABLE ?auto_185558 ) ( ON ?auto_185559 ?auto_185558 ) ( ON ?auto_185555 ?auto_185559 ) ( ON ?auto_185560 ?auto_185555 ) ( ON ?auto_185556 ?auto_185560 ) ( not ( = ?auto_185558 ?auto_185559 ) ) ( not ( = ?auto_185558 ?auto_185555 ) ) ( not ( = ?auto_185558 ?auto_185560 ) ) ( not ( = ?auto_185558 ?auto_185556 ) ) ( not ( = ?auto_185558 ?auto_185554 ) ) ( not ( = ?auto_185558 ?auto_185553 ) ) ( not ( = ?auto_185559 ?auto_185555 ) ) ( not ( = ?auto_185559 ?auto_185560 ) ) ( not ( = ?auto_185559 ?auto_185556 ) ) ( not ( = ?auto_185559 ?auto_185554 ) ) ( not ( = ?auto_185559 ?auto_185553 ) ) ( not ( = ?auto_185555 ?auto_185560 ) ) ( not ( = ?auto_185555 ?auto_185556 ) ) ( not ( = ?auto_185555 ?auto_185554 ) ) ( not ( = ?auto_185555 ?auto_185553 ) ) ( not ( = ?auto_185560 ?auto_185556 ) ) ( not ( = ?auto_185560 ?auto_185554 ) ) ( not ( = ?auto_185560 ?auto_185553 ) ) ( not ( = ?auto_185552 ?auto_185558 ) ) ( not ( = ?auto_185552 ?auto_185559 ) ) ( not ( = ?auto_185552 ?auto_185555 ) ) ( not ( = ?auto_185552 ?auto_185560 ) ) ( ON ?auto_185552 ?auto_185557 ) ( CLEAR ?auto_185552 ) ( not ( = ?auto_185552 ?auto_185557 ) ) ( not ( = ?auto_185553 ?auto_185557 ) ) ( not ( = ?auto_185554 ?auto_185557 ) ) ( not ( = ?auto_185556 ?auto_185557 ) ) ( not ( = ?auto_185558 ?auto_185557 ) ) ( not ( = ?auto_185559 ?auto_185557 ) ) ( not ( = ?auto_185555 ?auto_185557 ) ) ( not ( = ?auto_185560 ?auto_185557 ) ) ( HOLDING ?auto_185553 ) ( CLEAR ?auto_185554 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185558 ?auto_185559 ?auto_185555 ?auto_185560 ?auto_185556 ?auto_185554 ?auto_185553 )
      ( MAKE-3PILE ?auto_185552 ?auto_185553 ?auto_185554 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185561 - BLOCK
      ?auto_185562 - BLOCK
      ?auto_185563 - BLOCK
    )
    :vars
    (
      ?auto_185569 - BLOCK
      ?auto_185567 - BLOCK
      ?auto_185564 - BLOCK
      ?auto_185566 - BLOCK
      ?auto_185568 - BLOCK
      ?auto_185565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185561 ?auto_185562 ) ) ( not ( = ?auto_185561 ?auto_185563 ) ) ( not ( = ?auto_185562 ?auto_185563 ) ) ( ON ?auto_185563 ?auto_185569 ) ( not ( = ?auto_185561 ?auto_185569 ) ) ( not ( = ?auto_185562 ?auto_185569 ) ) ( not ( = ?auto_185563 ?auto_185569 ) ) ( ON-TABLE ?auto_185567 ) ( ON ?auto_185564 ?auto_185567 ) ( ON ?auto_185566 ?auto_185564 ) ( ON ?auto_185568 ?auto_185566 ) ( ON ?auto_185569 ?auto_185568 ) ( not ( = ?auto_185567 ?auto_185564 ) ) ( not ( = ?auto_185567 ?auto_185566 ) ) ( not ( = ?auto_185567 ?auto_185568 ) ) ( not ( = ?auto_185567 ?auto_185569 ) ) ( not ( = ?auto_185567 ?auto_185563 ) ) ( not ( = ?auto_185567 ?auto_185562 ) ) ( not ( = ?auto_185564 ?auto_185566 ) ) ( not ( = ?auto_185564 ?auto_185568 ) ) ( not ( = ?auto_185564 ?auto_185569 ) ) ( not ( = ?auto_185564 ?auto_185563 ) ) ( not ( = ?auto_185564 ?auto_185562 ) ) ( not ( = ?auto_185566 ?auto_185568 ) ) ( not ( = ?auto_185566 ?auto_185569 ) ) ( not ( = ?auto_185566 ?auto_185563 ) ) ( not ( = ?auto_185566 ?auto_185562 ) ) ( not ( = ?auto_185568 ?auto_185569 ) ) ( not ( = ?auto_185568 ?auto_185563 ) ) ( not ( = ?auto_185568 ?auto_185562 ) ) ( not ( = ?auto_185561 ?auto_185567 ) ) ( not ( = ?auto_185561 ?auto_185564 ) ) ( not ( = ?auto_185561 ?auto_185566 ) ) ( not ( = ?auto_185561 ?auto_185568 ) ) ( ON ?auto_185561 ?auto_185565 ) ( not ( = ?auto_185561 ?auto_185565 ) ) ( not ( = ?auto_185562 ?auto_185565 ) ) ( not ( = ?auto_185563 ?auto_185565 ) ) ( not ( = ?auto_185569 ?auto_185565 ) ) ( not ( = ?auto_185567 ?auto_185565 ) ) ( not ( = ?auto_185564 ?auto_185565 ) ) ( not ( = ?auto_185566 ?auto_185565 ) ) ( not ( = ?auto_185568 ?auto_185565 ) ) ( CLEAR ?auto_185563 ) ( ON ?auto_185562 ?auto_185561 ) ( CLEAR ?auto_185562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185565 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185565 ?auto_185561 )
      ( MAKE-3PILE ?auto_185561 ?auto_185562 ?auto_185563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185570 - BLOCK
      ?auto_185571 - BLOCK
      ?auto_185572 - BLOCK
    )
    :vars
    (
      ?auto_185578 - BLOCK
      ?auto_185576 - BLOCK
      ?auto_185573 - BLOCK
      ?auto_185574 - BLOCK
      ?auto_185577 - BLOCK
      ?auto_185575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185570 ?auto_185571 ) ) ( not ( = ?auto_185570 ?auto_185572 ) ) ( not ( = ?auto_185571 ?auto_185572 ) ) ( not ( = ?auto_185570 ?auto_185578 ) ) ( not ( = ?auto_185571 ?auto_185578 ) ) ( not ( = ?auto_185572 ?auto_185578 ) ) ( ON-TABLE ?auto_185576 ) ( ON ?auto_185573 ?auto_185576 ) ( ON ?auto_185574 ?auto_185573 ) ( ON ?auto_185577 ?auto_185574 ) ( ON ?auto_185578 ?auto_185577 ) ( not ( = ?auto_185576 ?auto_185573 ) ) ( not ( = ?auto_185576 ?auto_185574 ) ) ( not ( = ?auto_185576 ?auto_185577 ) ) ( not ( = ?auto_185576 ?auto_185578 ) ) ( not ( = ?auto_185576 ?auto_185572 ) ) ( not ( = ?auto_185576 ?auto_185571 ) ) ( not ( = ?auto_185573 ?auto_185574 ) ) ( not ( = ?auto_185573 ?auto_185577 ) ) ( not ( = ?auto_185573 ?auto_185578 ) ) ( not ( = ?auto_185573 ?auto_185572 ) ) ( not ( = ?auto_185573 ?auto_185571 ) ) ( not ( = ?auto_185574 ?auto_185577 ) ) ( not ( = ?auto_185574 ?auto_185578 ) ) ( not ( = ?auto_185574 ?auto_185572 ) ) ( not ( = ?auto_185574 ?auto_185571 ) ) ( not ( = ?auto_185577 ?auto_185578 ) ) ( not ( = ?auto_185577 ?auto_185572 ) ) ( not ( = ?auto_185577 ?auto_185571 ) ) ( not ( = ?auto_185570 ?auto_185576 ) ) ( not ( = ?auto_185570 ?auto_185573 ) ) ( not ( = ?auto_185570 ?auto_185574 ) ) ( not ( = ?auto_185570 ?auto_185577 ) ) ( ON ?auto_185570 ?auto_185575 ) ( not ( = ?auto_185570 ?auto_185575 ) ) ( not ( = ?auto_185571 ?auto_185575 ) ) ( not ( = ?auto_185572 ?auto_185575 ) ) ( not ( = ?auto_185578 ?auto_185575 ) ) ( not ( = ?auto_185576 ?auto_185575 ) ) ( not ( = ?auto_185573 ?auto_185575 ) ) ( not ( = ?auto_185574 ?auto_185575 ) ) ( not ( = ?auto_185577 ?auto_185575 ) ) ( ON ?auto_185571 ?auto_185570 ) ( CLEAR ?auto_185571 ) ( ON-TABLE ?auto_185575 ) ( HOLDING ?auto_185572 ) ( CLEAR ?auto_185578 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185576 ?auto_185573 ?auto_185574 ?auto_185577 ?auto_185578 ?auto_185572 )
      ( MAKE-3PILE ?auto_185570 ?auto_185571 ?auto_185572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185579 - BLOCK
      ?auto_185580 - BLOCK
      ?auto_185581 - BLOCK
    )
    :vars
    (
      ?auto_185585 - BLOCK
      ?auto_185586 - BLOCK
      ?auto_185583 - BLOCK
      ?auto_185584 - BLOCK
      ?auto_185582 - BLOCK
      ?auto_185587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185579 ?auto_185580 ) ) ( not ( = ?auto_185579 ?auto_185581 ) ) ( not ( = ?auto_185580 ?auto_185581 ) ) ( not ( = ?auto_185579 ?auto_185585 ) ) ( not ( = ?auto_185580 ?auto_185585 ) ) ( not ( = ?auto_185581 ?auto_185585 ) ) ( ON-TABLE ?auto_185586 ) ( ON ?auto_185583 ?auto_185586 ) ( ON ?auto_185584 ?auto_185583 ) ( ON ?auto_185582 ?auto_185584 ) ( ON ?auto_185585 ?auto_185582 ) ( not ( = ?auto_185586 ?auto_185583 ) ) ( not ( = ?auto_185586 ?auto_185584 ) ) ( not ( = ?auto_185586 ?auto_185582 ) ) ( not ( = ?auto_185586 ?auto_185585 ) ) ( not ( = ?auto_185586 ?auto_185581 ) ) ( not ( = ?auto_185586 ?auto_185580 ) ) ( not ( = ?auto_185583 ?auto_185584 ) ) ( not ( = ?auto_185583 ?auto_185582 ) ) ( not ( = ?auto_185583 ?auto_185585 ) ) ( not ( = ?auto_185583 ?auto_185581 ) ) ( not ( = ?auto_185583 ?auto_185580 ) ) ( not ( = ?auto_185584 ?auto_185582 ) ) ( not ( = ?auto_185584 ?auto_185585 ) ) ( not ( = ?auto_185584 ?auto_185581 ) ) ( not ( = ?auto_185584 ?auto_185580 ) ) ( not ( = ?auto_185582 ?auto_185585 ) ) ( not ( = ?auto_185582 ?auto_185581 ) ) ( not ( = ?auto_185582 ?auto_185580 ) ) ( not ( = ?auto_185579 ?auto_185586 ) ) ( not ( = ?auto_185579 ?auto_185583 ) ) ( not ( = ?auto_185579 ?auto_185584 ) ) ( not ( = ?auto_185579 ?auto_185582 ) ) ( ON ?auto_185579 ?auto_185587 ) ( not ( = ?auto_185579 ?auto_185587 ) ) ( not ( = ?auto_185580 ?auto_185587 ) ) ( not ( = ?auto_185581 ?auto_185587 ) ) ( not ( = ?auto_185585 ?auto_185587 ) ) ( not ( = ?auto_185586 ?auto_185587 ) ) ( not ( = ?auto_185583 ?auto_185587 ) ) ( not ( = ?auto_185584 ?auto_185587 ) ) ( not ( = ?auto_185582 ?auto_185587 ) ) ( ON ?auto_185580 ?auto_185579 ) ( ON-TABLE ?auto_185587 ) ( CLEAR ?auto_185585 ) ( ON ?auto_185581 ?auto_185580 ) ( CLEAR ?auto_185581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185587 ?auto_185579 ?auto_185580 )
      ( MAKE-3PILE ?auto_185579 ?auto_185580 ?auto_185581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185588 - BLOCK
      ?auto_185589 - BLOCK
      ?auto_185590 - BLOCK
    )
    :vars
    (
      ?auto_185596 - BLOCK
      ?auto_185592 - BLOCK
      ?auto_185591 - BLOCK
      ?auto_185593 - BLOCK
      ?auto_185595 - BLOCK
      ?auto_185594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185588 ?auto_185589 ) ) ( not ( = ?auto_185588 ?auto_185590 ) ) ( not ( = ?auto_185589 ?auto_185590 ) ) ( not ( = ?auto_185588 ?auto_185596 ) ) ( not ( = ?auto_185589 ?auto_185596 ) ) ( not ( = ?auto_185590 ?auto_185596 ) ) ( ON-TABLE ?auto_185592 ) ( ON ?auto_185591 ?auto_185592 ) ( ON ?auto_185593 ?auto_185591 ) ( ON ?auto_185595 ?auto_185593 ) ( not ( = ?auto_185592 ?auto_185591 ) ) ( not ( = ?auto_185592 ?auto_185593 ) ) ( not ( = ?auto_185592 ?auto_185595 ) ) ( not ( = ?auto_185592 ?auto_185596 ) ) ( not ( = ?auto_185592 ?auto_185590 ) ) ( not ( = ?auto_185592 ?auto_185589 ) ) ( not ( = ?auto_185591 ?auto_185593 ) ) ( not ( = ?auto_185591 ?auto_185595 ) ) ( not ( = ?auto_185591 ?auto_185596 ) ) ( not ( = ?auto_185591 ?auto_185590 ) ) ( not ( = ?auto_185591 ?auto_185589 ) ) ( not ( = ?auto_185593 ?auto_185595 ) ) ( not ( = ?auto_185593 ?auto_185596 ) ) ( not ( = ?auto_185593 ?auto_185590 ) ) ( not ( = ?auto_185593 ?auto_185589 ) ) ( not ( = ?auto_185595 ?auto_185596 ) ) ( not ( = ?auto_185595 ?auto_185590 ) ) ( not ( = ?auto_185595 ?auto_185589 ) ) ( not ( = ?auto_185588 ?auto_185592 ) ) ( not ( = ?auto_185588 ?auto_185591 ) ) ( not ( = ?auto_185588 ?auto_185593 ) ) ( not ( = ?auto_185588 ?auto_185595 ) ) ( ON ?auto_185588 ?auto_185594 ) ( not ( = ?auto_185588 ?auto_185594 ) ) ( not ( = ?auto_185589 ?auto_185594 ) ) ( not ( = ?auto_185590 ?auto_185594 ) ) ( not ( = ?auto_185596 ?auto_185594 ) ) ( not ( = ?auto_185592 ?auto_185594 ) ) ( not ( = ?auto_185591 ?auto_185594 ) ) ( not ( = ?auto_185593 ?auto_185594 ) ) ( not ( = ?auto_185595 ?auto_185594 ) ) ( ON ?auto_185589 ?auto_185588 ) ( ON-TABLE ?auto_185594 ) ( ON ?auto_185590 ?auto_185589 ) ( CLEAR ?auto_185590 ) ( HOLDING ?auto_185596 ) ( CLEAR ?auto_185595 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185592 ?auto_185591 ?auto_185593 ?auto_185595 ?auto_185596 )
      ( MAKE-3PILE ?auto_185588 ?auto_185589 ?auto_185590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185597 - BLOCK
      ?auto_185598 - BLOCK
      ?auto_185599 - BLOCK
    )
    :vars
    (
      ?auto_185603 - BLOCK
      ?auto_185605 - BLOCK
      ?auto_185601 - BLOCK
      ?auto_185604 - BLOCK
      ?auto_185602 - BLOCK
      ?auto_185600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185597 ?auto_185598 ) ) ( not ( = ?auto_185597 ?auto_185599 ) ) ( not ( = ?auto_185598 ?auto_185599 ) ) ( not ( = ?auto_185597 ?auto_185603 ) ) ( not ( = ?auto_185598 ?auto_185603 ) ) ( not ( = ?auto_185599 ?auto_185603 ) ) ( ON-TABLE ?auto_185605 ) ( ON ?auto_185601 ?auto_185605 ) ( ON ?auto_185604 ?auto_185601 ) ( ON ?auto_185602 ?auto_185604 ) ( not ( = ?auto_185605 ?auto_185601 ) ) ( not ( = ?auto_185605 ?auto_185604 ) ) ( not ( = ?auto_185605 ?auto_185602 ) ) ( not ( = ?auto_185605 ?auto_185603 ) ) ( not ( = ?auto_185605 ?auto_185599 ) ) ( not ( = ?auto_185605 ?auto_185598 ) ) ( not ( = ?auto_185601 ?auto_185604 ) ) ( not ( = ?auto_185601 ?auto_185602 ) ) ( not ( = ?auto_185601 ?auto_185603 ) ) ( not ( = ?auto_185601 ?auto_185599 ) ) ( not ( = ?auto_185601 ?auto_185598 ) ) ( not ( = ?auto_185604 ?auto_185602 ) ) ( not ( = ?auto_185604 ?auto_185603 ) ) ( not ( = ?auto_185604 ?auto_185599 ) ) ( not ( = ?auto_185604 ?auto_185598 ) ) ( not ( = ?auto_185602 ?auto_185603 ) ) ( not ( = ?auto_185602 ?auto_185599 ) ) ( not ( = ?auto_185602 ?auto_185598 ) ) ( not ( = ?auto_185597 ?auto_185605 ) ) ( not ( = ?auto_185597 ?auto_185601 ) ) ( not ( = ?auto_185597 ?auto_185604 ) ) ( not ( = ?auto_185597 ?auto_185602 ) ) ( ON ?auto_185597 ?auto_185600 ) ( not ( = ?auto_185597 ?auto_185600 ) ) ( not ( = ?auto_185598 ?auto_185600 ) ) ( not ( = ?auto_185599 ?auto_185600 ) ) ( not ( = ?auto_185603 ?auto_185600 ) ) ( not ( = ?auto_185605 ?auto_185600 ) ) ( not ( = ?auto_185601 ?auto_185600 ) ) ( not ( = ?auto_185604 ?auto_185600 ) ) ( not ( = ?auto_185602 ?auto_185600 ) ) ( ON ?auto_185598 ?auto_185597 ) ( ON-TABLE ?auto_185600 ) ( ON ?auto_185599 ?auto_185598 ) ( CLEAR ?auto_185602 ) ( ON ?auto_185603 ?auto_185599 ) ( CLEAR ?auto_185603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185600 ?auto_185597 ?auto_185598 ?auto_185599 )
      ( MAKE-3PILE ?auto_185597 ?auto_185598 ?auto_185599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185606 - BLOCK
      ?auto_185607 - BLOCK
      ?auto_185608 - BLOCK
    )
    :vars
    (
      ?auto_185609 - BLOCK
      ?auto_185612 - BLOCK
      ?auto_185613 - BLOCK
      ?auto_185610 - BLOCK
      ?auto_185614 - BLOCK
      ?auto_185611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185606 ?auto_185607 ) ) ( not ( = ?auto_185606 ?auto_185608 ) ) ( not ( = ?auto_185607 ?auto_185608 ) ) ( not ( = ?auto_185606 ?auto_185609 ) ) ( not ( = ?auto_185607 ?auto_185609 ) ) ( not ( = ?auto_185608 ?auto_185609 ) ) ( ON-TABLE ?auto_185612 ) ( ON ?auto_185613 ?auto_185612 ) ( ON ?auto_185610 ?auto_185613 ) ( not ( = ?auto_185612 ?auto_185613 ) ) ( not ( = ?auto_185612 ?auto_185610 ) ) ( not ( = ?auto_185612 ?auto_185614 ) ) ( not ( = ?auto_185612 ?auto_185609 ) ) ( not ( = ?auto_185612 ?auto_185608 ) ) ( not ( = ?auto_185612 ?auto_185607 ) ) ( not ( = ?auto_185613 ?auto_185610 ) ) ( not ( = ?auto_185613 ?auto_185614 ) ) ( not ( = ?auto_185613 ?auto_185609 ) ) ( not ( = ?auto_185613 ?auto_185608 ) ) ( not ( = ?auto_185613 ?auto_185607 ) ) ( not ( = ?auto_185610 ?auto_185614 ) ) ( not ( = ?auto_185610 ?auto_185609 ) ) ( not ( = ?auto_185610 ?auto_185608 ) ) ( not ( = ?auto_185610 ?auto_185607 ) ) ( not ( = ?auto_185614 ?auto_185609 ) ) ( not ( = ?auto_185614 ?auto_185608 ) ) ( not ( = ?auto_185614 ?auto_185607 ) ) ( not ( = ?auto_185606 ?auto_185612 ) ) ( not ( = ?auto_185606 ?auto_185613 ) ) ( not ( = ?auto_185606 ?auto_185610 ) ) ( not ( = ?auto_185606 ?auto_185614 ) ) ( ON ?auto_185606 ?auto_185611 ) ( not ( = ?auto_185606 ?auto_185611 ) ) ( not ( = ?auto_185607 ?auto_185611 ) ) ( not ( = ?auto_185608 ?auto_185611 ) ) ( not ( = ?auto_185609 ?auto_185611 ) ) ( not ( = ?auto_185612 ?auto_185611 ) ) ( not ( = ?auto_185613 ?auto_185611 ) ) ( not ( = ?auto_185610 ?auto_185611 ) ) ( not ( = ?auto_185614 ?auto_185611 ) ) ( ON ?auto_185607 ?auto_185606 ) ( ON-TABLE ?auto_185611 ) ( ON ?auto_185608 ?auto_185607 ) ( ON ?auto_185609 ?auto_185608 ) ( CLEAR ?auto_185609 ) ( HOLDING ?auto_185614 ) ( CLEAR ?auto_185610 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185612 ?auto_185613 ?auto_185610 ?auto_185614 )
      ( MAKE-3PILE ?auto_185606 ?auto_185607 ?auto_185608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185615 - BLOCK
      ?auto_185616 - BLOCK
      ?auto_185617 - BLOCK
    )
    :vars
    (
      ?auto_185623 - BLOCK
      ?auto_185622 - BLOCK
      ?auto_185618 - BLOCK
      ?auto_185621 - BLOCK
      ?auto_185620 - BLOCK
      ?auto_185619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185615 ?auto_185616 ) ) ( not ( = ?auto_185615 ?auto_185617 ) ) ( not ( = ?auto_185616 ?auto_185617 ) ) ( not ( = ?auto_185615 ?auto_185623 ) ) ( not ( = ?auto_185616 ?auto_185623 ) ) ( not ( = ?auto_185617 ?auto_185623 ) ) ( ON-TABLE ?auto_185622 ) ( ON ?auto_185618 ?auto_185622 ) ( ON ?auto_185621 ?auto_185618 ) ( not ( = ?auto_185622 ?auto_185618 ) ) ( not ( = ?auto_185622 ?auto_185621 ) ) ( not ( = ?auto_185622 ?auto_185620 ) ) ( not ( = ?auto_185622 ?auto_185623 ) ) ( not ( = ?auto_185622 ?auto_185617 ) ) ( not ( = ?auto_185622 ?auto_185616 ) ) ( not ( = ?auto_185618 ?auto_185621 ) ) ( not ( = ?auto_185618 ?auto_185620 ) ) ( not ( = ?auto_185618 ?auto_185623 ) ) ( not ( = ?auto_185618 ?auto_185617 ) ) ( not ( = ?auto_185618 ?auto_185616 ) ) ( not ( = ?auto_185621 ?auto_185620 ) ) ( not ( = ?auto_185621 ?auto_185623 ) ) ( not ( = ?auto_185621 ?auto_185617 ) ) ( not ( = ?auto_185621 ?auto_185616 ) ) ( not ( = ?auto_185620 ?auto_185623 ) ) ( not ( = ?auto_185620 ?auto_185617 ) ) ( not ( = ?auto_185620 ?auto_185616 ) ) ( not ( = ?auto_185615 ?auto_185622 ) ) ( not ( = ?auto_185615 ?auto_185618 ) ) ( not ( = ?auto_185615 ?auto_185621 ) ) ( not ( = ?auto_185615 ?auto_185620 ) ) ( ON ?auto_185615 ?auto_185619 ) ( not ( = ?auto_185615 ?auto_185619 ) ) ( not ( = ?auto_185616 ?auto_185619 ) ) ( not ( = ?auto_185617 ?auto_185619 ) ) ( not ( = ?auto_185623 ?auto_185619 ) ) ( not ( = ?auto_185622 ?auto_185619 ) ) ( not ( = ?auto_185618 ?auto_185619 ) ) ( not ( = ?auto_185621 ?auto_185619 ) ) ( not ( = ?auto_185620 ?auto_185619 ) ) ( ON ?auto_185616 ?auto_185615 ) ( ON-TABLE ?auto_185619 ) ( ON ?auto_185617 ?auto_185616 ) ( ON ?auto_185623 ?auto_185617 ) ( CLEAR ?auto_185621 ) ( ON ?auto_185620 ?auto_185623 ) ( CLEAR ?auto_185620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185619 ?auto_185615 ?auto_185616 ?auto_185617 ?auto_185623 )
      ( MAKE-3PILE ?auto_185615 ?auto_185616 ?auto_185617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185624 - BLOCK
      ?auto_185625 - BLOCK
      ?auto_185626 - BLOCK
    )
    :vars
    (
      ?auto_185631 - BLOCK
      ?auto_185632 - BLOCK
      ?auto_185630 - BLOCK
      ?auto_185629 - BLOCK
      ?auto_185627 - BLOCK
      ?auto_185628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185624 ?auto_185625 ) ) ( not ( = ?auto_185624 ?auto_185626 ) ) ( not ( = ?auto_185625 ?auto_185626 ) ) ( not ( = ?auto_185624 ?auto_185631 ) ) ( not ( = ?auto_185625 ?auto_185631 ) ) ( not ( = ?auto_185626 ?auto_185631 ) ) ( ON-TABLE ?auto_185632 ) ( ON ?auto_185630 ?auto_185632 ) ( not ( = ?auto_185632 ?auto_185630 ) ) ( not ( = ?auto_185632 ?auto_185629 ) ) ( not ( = ?auto_185632 ?auto_185627 ) ) ( not ( = ?auto_185632 ?auto_185631 ) ) ( not ( = ?auto_185632 ?auto_185626 ) ) ( not ( = ?auto_185632 ?auto_185625 ) ) ( not ( = ?auto_185630 ?auto_185629 ) ) ( not ( = ?auto_185630 ?auto_185627 ) ) ( not ( = ?auto_185630 ?auto_185631 ) ) ( not ( = ?auto_185630 ?auto_185626 ) ) ( not ( = ?auto_185630 ?auto_185625 ) ) ( not ( = ?auto_185629 ?auto_185627 ) ) ( not ( = ?auto_185629 ?auto_185631 ) ) ( not ( = ?auto_185629 ?auto_185626 ) ) ( not ( = ?auto_185629 ?auto_185625 ) ) ( not ( = ?auto_185627 ?auto_185631 ) ) ( not ( = ?auto_185627 ?auto_185626 ) ) ( not ( = ?auto_185627 ?auto_185625 ) ) ( not ( = ?auto_185624 ?auto_185632 ) ) ( not ( = ?auto_185624 ?auto_185630 ) ) ( not ( = ?auto_185624 ?auto_185629 ) ) ( not ( = ?auto_185624 ?auto_185627 ) ) ( ON ?auto_185624 ?auto_185628 ) ( not ( = ?auto_185624 ?auto_185628 ) ) ( not ( = ?auto_185625 ?auto_185628 ) ) ( not ( = ?auto_185626 ?auto_185628 ) ) ( not ( = ?auto_185631 ?auto_185628 ) ) ( not ( = ?auto_185632 ?auto_185628 ) ) ( not ( = ?auto_185630 ?auto_185628 ) ) ( not ( = ?auto_185629 ?auto_185628 ) ) ( not ( = ?auto_185627 ?auto_185628 ) ) ( ON ?auto_185625 ?auto_185624 ) ( ON-TABLE ?auto_185628 ) ( ON ?auto_185626 ?auto_185625 ) ( ON ?auto_185631 ?auto_185626 ) ( ON ?auto_185627 ?auto_185631 ) ( CLEAR ?auto_185627 ) ( HOLDING ?auto_185629 ) ( CLEAR ?auto_185630 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185632 ?auto_185630 ?auto_185629 )
      ( MAKE-3PILE ?auto_185624 ?auto_185625 ?auto_185626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185633 - BLOCK
      ?auto_185634 - BLOCK
      ?auto_185635 - BLOCK
    )
    :vars
    (
      ?auto_185641 - BLOCK
      ?auto_185638 - BLOCK
      ?auto_185639 - BLOCK
      ?auto_185637 - BLOCK
      ?auto_185640 - BLOCK
      ?auto_185636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185633 ?auto_185634 ) ) ( not ( = ?auto_185633 ?auto_185635 ) ) ( not ( = ?auto_185634 ?auto_185635 ) ) ( not ( = ?auto_185633 ?auto_185641 ) ) ( not ( = ?auto_185634 ?auto_185641 ) ) ( not ( = ?auto_185635 ?auto_185641 ) ) ( ON-TABLE ?auto_185638 ) ( ON ?auto_185639 ?auto_185638 ) ( not ( = ?auto_185638 ?auto_185639 ) ) ( not ( = ?auto_185638 ?auto_185637 ) ) ( not ( = ?auto_185638 ?auto_185640 ) ) ( not ( = ?auto_185638 ?auto_185641 ) ) ( not ( = ?auto_185638 ?auto_185635 ) ) ( not ( = ?auto_185638 ?auto_185634 ) ) ( not ( = ?auto_185639 ?auto_185637 ) ) ( not ( = ?auto_185639 ?auto_185640 ) ) ( not ( = ?auto_185639 ?auto_185641 ) ) ( not ( = ?auto_185639 ?auto_185635 ) ) ( not ( = ?auto_185639 ?auto_185634 ) ) ( not ( = ?auto_185637 ?auto_185640 ) ) ( not ( = ?auto_185637 ?auto_185641 ) ) ( not ( = ?auto_185637 ?auto_185635 ) ) ( not ( = ?auto_185637 ?auto_185634 ) ) ( not ( = ?auto_185640 ?auto_185641 ) ) ( not ( = ?auto_185640 ?auto_185635 ) ) ( not ( = ?auto_185640 ?auto_185634 ) ) ( not ( = ?auto_185633 ?auto_185638 ) ) ( not ( = ?auto_185633 ?auto_185639 ) ) ( not ( = ?auto_185633 ?auto_185637 ) ) ( not ( = ?auto_185633 ?auto_185640 ) ) ( ON ?auto_185633 ?auto_185636 ) ( not ( = ?auto_185633 ?auto_185636 ) ) ( not ( = ?auto_185634 ?auto_185636 ) ) ( not ( = ?auto_185635 ?auto_185636 ) ) ( not ( = ?auto_185641 ?auto_185636 ) ) ( not ( = ?auto_185638 ?auto_185636 ) ) ( not ( = ?auto_185639 ?auto_185636 ) ) ( not ( = ?auto_185637 ?auto_185636 ) ) ( not ( = ?auto_185640 ?auto_185636 ) ) ( ON ?auto_185634 ?auto_185633 ) ( ON-TABLE ?auto_185636 ) ( ON ?auto_185635 ?auto_185634 ) ( ON ?auto_185641 ?auto_185635 ) ( ON ?auto_185640 ?auto_185641 ) ( CLEAR ?auto_185639 ) ( ON ?auto_185637 ?auto_185640 ) ( CLEAR ?auto_185637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185636 ?auto_185633 ?auto_185634 ?auto_185635 ?auto_185641 ?auto_185640 )
      ( MAKE-3PILE ?auto_185633 ?auto_185634 ?auto_185635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185642 - BLOCK
      ?auto_185643 - BLOCK
      ?auto_185644 - BLOCK
    )
    :vars
    (
      ?auto_185647 - BLOCK
      ?auto_185646 - BLOCK
      ?auto_185649 - BLOCK
      ?auto_185650 - BLOCK
      ?auto_185645 - BLOCK
      ?auto_185648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185642 ?auto_185643 ) ) ( not ( = ?auto_185642 ?auto_185644 ) ) ( not ( = ?auto_185643 ?auto_185644 ) ) ( not ( = ?auto_185642 ?auto_185647 ) ) ( not ( = ?auto_185643 ?auto_185647 ) ) ( not ( = ?auto_185644 ?auto_185647 ) ) ( ON-TABLE ?auto_185646 ) ( not ( = ?auto_185646 ?auto_185649 ) ) ( not ( = ?auto_185646 ?auto_185650 ) ) ( not ( = ?auto_185646 ?auto_185645 ) ) ( not ( = ?auto_185646 ?auto_185647 ) ) ( not ( = ?auto_185646 ?auto_185644 ) ) ( not ( = ?auto_185646 ?auto_185643 ) ) ( not ( = ?auto_185649 ?auto_185650 ) ) ( not ( = ?auto_185649 ?auto_185645 ) ) ( not ( = ?auto_185649 ?auto_185647 ) ) ( not ( = ?auto_185649 ?auto_185644 ) ) ( not ( = ?auto_185649 ?auto_185643 ) ) ( not ( = ?auto_185650 ?auto_185645 ) ) ( not ( = ?auto_185650 ?auto_185647 ) ) ( not ( = ?auto_185650 ?auto_185644 ) ) ( not ( = ?auto_185650 ?auto_185643 ) ) ( not ( = ?auto_185645 ?auto_185647 ) ) ( not ( = ?auto_185645 ?auto_185644 ) ) ( not ( = ?auto_185645 ?auto_185643 ) ) ( not ( = ?auto_185642 ?auto_185646 ) ) ( not ( = ?auto_185642 ?auto_185649 ) ) ( not ( = ?auto_185642 ?auto_185650 ) ) ( not ( = ?auto_185642 ?auto_185645 ) ) ( ON ?auto_185642 ?auto_185648 ) ( not ( = ?auto_185642 ?auto_185648 ) ) ( not ( = ?auto_185643 ?auto_185648 ) ) ( not ( = ?auto_185644 ?auto_185648 ) ) ( not ( = ?auto_185647 ?auto_185648 ) ) ( not ( = ?auto_185646 ?auto_185648 ) ) ( not ( = ?auto_185649 ?auto_185648 ) ) ( not ( = ?auto_185650 ?auto_185648 ) ) ( not ( = ?auto_185645 ?auto_185648 ) ) ( ON ?auto_185643 ?auto_185642 ) ( ON-TABLE ?auto_185648 ) ( ON ?auto_185644 ?auto_185643 ) ( ON ?auto_185647 ?auto_185644 ) ( ON ?auto_185645 ?auto_185647 ) ( ON ?auto_185650 ?auto_185645 ) ( CLEAR ?auto_185650 ) ( HOLDING ?auto_185649 ) ( CLEAR ?auto_185646 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185646 ?auto_185649 )
      ( MAKE-3PILE ?auto_185642 ?auto_185643 ?auto_185644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185651 - BLOCK
      ?auto_185652 - BLOCK
      ?auto_185653 - BLOCK
    )
    :vars
    (
      ?auto_185658 - BLOCK
      ?auto_185655 - BLOCK
      ?auto_185656 - BLOCK
      ?auto_185657 - BLOCK
      ?auto_185659 - BLOCK
      ?auto_185654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185651 ?auto_185652 ) ) ( not ( = ?auto_185651 ?auto_185653 ) ) ( not ( = ?auto_185652 ?auto_185653 ) ) ( not ( = ?auto_185651 ?auto_185658 ) ) ( not ( = ?auto_185652 ?auto_185658 ) ) ( not ( = ?auto_185653 ?auto_185658 ) ) ( ON-TABLE ?auto_185655 ) ( not ( = ?auto_185655 ?auto_185656 ) ) ( not ( = ?auto_185655 ?auto_185657 ) ) ( not ( = ?auto_185655 ?auto_185659 ) ) ( not ( = ?auto_185655 ?auto_185658 ) ) ( not ( = ?auto_185655 ?auto_185653 ) ) ( not ( = ?auto_185655 ?auto_185652 ) ) ( not ( = ?auto_185656 ?auto_185657 ) ) ( not ( = ?auto_185656 ?auto_185659 ) ) ( not ( = ?auto_185656 ?auto_185658 ) ) ( not ( = ?auto_185656 ?auto_185653 ) ) ( not ( = ?auto_185656 ?auto_185652 ) ) ( not ( = ?auto_185657 ?auto_185659 ) ) ( not ( = ?auto_185657 ?auto_185658 ) ) ( not ( = ?auto_185657 ?auto_185653 ) ) ( not ( = ?auto_185657 ?auto_185652 ) ) ( not ( = ?auto_185659 ?auto_185658 ) ) ( not ( = ?auto_185659 ?auto_185653 ) ) ( not ( = ?auto_185659 ?auto_185652 ) ) ( not ( = ?auto_185651 ?auto_185655 ) ) ( not ( = ?auto_185651 ?auto_185656 ) ) ( not ( = ?auto_185651 ?auto_185657 ) ) ( not ( = ?auto_185651 ?auto_185659 ) ) ( ON ?auto_185651 ?auto_185654 ) ( not ( = ?auto_185651 ?auto_185654 ) ) ( not ( = ?auto_185652 ?auto_185654 ) ) ( not ( = ?auto_185653 ?auto_185654 ) ) ( not ( = ?auto_185658 ?auto_185654 ) ) ( not ( = ?auto_185655 ?auto_185654 ) ) ( not ( = ?auto_185656 ?auto_185654 ) ) ( not ( = ?auto_185657 ?auto_185654 ) ) ( not ( = ?auto_185659 ?auto_185654 ) ) ( ON ?auto_185652 ?auto_185651 ) ( ON-TABLE ?auto_185654 ) ( ON ?auto_185653 ?auto_185652 ) ( ON ?auto_185658 ?auto_185653 ) ( ON ?auto_185659 ?auto_185658 ) ( ON ?auto_185657 ?auto_185659 ) ( CLEAR ?auto_185655 ) ( ON ?auto_185656 ?auto_185657 ) ( CLEAR ?auto_185656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185654 ?auto_185651 ?auto_185652 ?auto_185653 ?auto_185658 ?auto_185659 ?auto_185657 )
      ( MAKE-3PILE ?auto_185651 ?auto_185652 ?auto_185653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185660 - BLOCK
      ?auto_185661 - BLOCK
      ?auto_185662 - BLOCK
    )
    :vars
    (
      ?auto_185666 - BLOCK
      ?auto_185665 - BLOCK
      ?auto_185667 - BLOCK
      ?auto_185663 - BLOCK
      ?auto_185668 - BLOCK
      ?auto_185664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185660 ?auto_185661 ) ) ( not ( = ?auto_185660 ?auto_185662 ) ) ( not ( = ?auto_185661 ?auto_185662 ) ) ( not ( = ?auto_185660 ?auto_185666 ) ) ( not ( = ?auto_185661 ?auto_185666 ) ) ( not ( = ?auto_185662 ?auto_185666 ) ) ( not ( = ?auto_185665 ?auto_185667 ) ) ( not ( = ?auto_185665 ?auto_185663 ) ) ( not ( = ?auto_185665 ?auto_185668 ) ) ( not ( = ?auto_185665 ?auto_185666 ) ) ( not ( = ?auto_185665 ?auto_185662 ) ) ( not ( = ?auto_185665 ?auto_185661 ) ) ( not ( = ?auto_185667 ?auto_185663 ) ) ( not ( = ?auto_185667 ?auto_185668 ) ) ( not ( = ?auto_185667 ?auto_185666 ) ) ( not ( = ?auto_185667 ?auto_185662 ) ) ( not ( = ?auto_185667 ?auto_185661 ) ) ( not ( = ?auto_185663 ?auto_185668 ) ) ( not ( = ?auto_185663 ?auto_185666 ) ) ( not ( = ?auto_185663 ?auto_185662 ) ) ( not ( = ?auto_185663 ?auto_185661 ) ) ( not ( = ?auto_185668 ?auto_185666 ) ) ( not ( = ?auto_185668 ?auto_185662 ) ) ( not ( = ?auto_185668 ?auto_185661 ) ) ( not ( = ?auto_185660 ?auto_185665 ) ) ( not ( = ?auto_185660 ?auto_185667 ) ) ( not ( = ?auto_185660 ?auto_185663 ) ) ( not ( = ?auto_185660 ?auto_185668 ) ) ( ON ?auto_185660 ?auto_185664 ) ( not ( = ?auto_185660 ?auto_185664 ) ) ( not ( = ?auto_185661 ?auto_185664 ) ) ( not ( = ?auto_185662 ?auto_185664 ) ) ( not ( = ?auto_185666 ?auto_185664 ) ) ( not ( = ?auto_185665 ?auto_185664 ) ) ( not ( = ?auto_185667 ?auto_185664 ) ) ( not ( = ?auto_185663 ?auto_185664 ) ) ( not ( = ?auto_185668 ?auto_185664 ) ) ( ON ?auto_185661 ?auto_185660 ) ( ON-TABLE ?auto_185664 ) ( ON ?auto_185662 ?auto_185661 ) ( ON ?auto_185666 ?auto_185662 ) ( ON ?auto_185668 ?auto_185666 ) ( ON ?auto_185663 ?auto_185668 ) ( ON ?auto_185667 ?auto_185663 ) ( CLEAR ?auto_185667 ) ( HOLDING ?auto_185665 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185665 )
      ( MAKE-3PILE ?auto_185660 ?auto_185661 ?auto_185662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_185669 - BLOCK
      ?auto_185670 - BLOCK
      ?auto_185671 - BLOCK
    )
    :vars
    (
      ?auto_185672 - BLOCK
      ?auto_185675 - BLOCK
      ?auto_185673 - BLOCK
      ?auto_185677 - BLOCK
      ?auto_185676 - BLOCK
      ?auto_185674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185669 ?auto_185670 ) ) ( not ( = ?auto_185669 ?auto_185671 ) ) ( not ( = ?auto_185670 ?auto_185671 ) ) ( not ( = ?auto_185669 ?auto_185672 ) ) ( not ( = ?auto_185670 ?auto_185672 ) ) ( not ( = ?auto_185671 ?auto_185672 ) ) ( not ( = ?auto_185675 ?auto_185673 ) ) ( not ( = ?auto_185675 ?auto_185677 ) ) ( not ( = ?auto_185675 ?auto_185676 ) ) ( not ( = ?auto_185675 ?auto_185672 ) ) ( not ( = ?auto_185675 ?auto_185671 ) ) ( not ( = ?auto_185675 ?auto_185670 ) ) ( not ( = ?auto_185673 ?auto_185677 ) ) ( not ( = ?auto_185673 ?auto_185676 ) ) ( not ( = ?auto_185673 ?auto_185672 ) ) ( not ( = ?auto_185673 ?auto_185671 ) ) ( not ( = ?auto_185673 ?auto_185670 ) ) ( not ( = ?auto_185677 ?auto_185676 ) ) ( not ( = ?auto_185677 ?auto_185672 ) ) ( not ( = ?auto_185677 ?auto_185671 ) ) ( not ( = ?auto_185677 ?auto_185670 ) ) ( not ( = ?auto_185676 ?auto_185672 ) ) ( not ( = ?auto_185676 ?auto_185671 ) ) ( not ( = ?auto_185676 ?auto_185670 ) ) ( not ( = ?auto_185669 ?auto_185675 ) ) ( not ( = ?auto_185669 ?auto_185673 ) ) ( not ( = ?auto_185669 ?auto_185677 ) ) ( not ( = ?auto_185669 ?auto_185676 ) ) ( ON ?auto_185669 ?auto_185674 ) ( not ( = ?auto_185669 ?auto_185674 ) ) ( not ( = ?auto_185670 ?auto_185674 ) ) ( not ( = ?auto_185671 ?auto_185674 ) ) ( not ( = ?auto_185672 ?auto_185674 ) ) ( not ( = ?auto_185675 ?auto_185674 ) ) ( not ( = ?auto_185673 ?auto_185674 ) ) ( not ( = ?auto_185677 ?auto_185674 ) ) ( not ( = ?auto_185676 ?auto_185674 ) ) ( ON ?auto_185670 ?auto_185669 ) ( ON-TABLE ?auto_185674 ) ( ON ?auto_185671 ?auto_185670 ) ( ON ?auto_185672 ?auto_185671 ) ( ON ?auto_185676 ?auto_185672 ) ( ON ?auto_185677 ?auto_185676 ) ( ON ?auto_185673 ?auto_185677 ) ( ON ?auto_185675 ?auto_185673 ) ( CLEAR ?auto_185675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185674 ?auto_185669 ?auto_185670 ?auto_185671 ?auto_185672 ?auto_185676 ?auto_185677 ?auto_185673 )
      ( MAKE-3PILE ?auto_185669 ?auto_185670 ?auto_185671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185682 - BLOCK
      ?auto_185683 - BLOCK
      ?auto_185684 - BLOCK
      ?auto_185685 - BLOCK
    )
    :vars
    (
      ?auto_185686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185686 ?auto_185685 ) ( CLEAR ?auto_185686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185682 ) ( ON ?auto_185683 ?auto_185682 ) ( ON ?auto_185684 ?auto_185683 ) ( ON ?auto_185685 ?auto_185684 ) ( not ( = ?auto_185682 ?auto_185683 ) ) ( not ( = ?auto_185682 ?auto_185684 ) ) ( not ( = ?auto_185682 ?auto_185685 ) ) ( not ( = ?auto_185682 ?auto_185686 ) ) ( not ( = ?auto_185683 ?auto_185684 ) ) ( not ( = ?auto_185683 ?auto_185685 ) ) ( not ( = ?auto_185683 ?auto_185686 ) ) ( not ( = ?auto_185684 ?auto_185685 ) ) ( not ( = ?auto_185684 ?auto_185686 ) ) ( not ( = ?auto_185685 ?auto_185686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185686 ?auto_185685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185687 - BLOCK
      ?auto_185688 - BLOCK
      ?auto_185689 - BLOCK
      ?auto_185690 - BLOCK
    )
    :vars
    (
      ?auto_185691 - BLOCK
      ?auto_185692 - BLOCK
      ?auto_185693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185691 ?auto_185690 ) ( CLEAR ?auto_185691 ) ( ON-TABLE ?auto_185687 ) ( ON ?auto_185688 ?auto_185687 ) ( ON ?auto_185689 ?auto_185688 ) ( ON ?auto_185690 ?auto_185689 ) ( not ( = ?auto_185687 ?auto_185688 ) ) ( not ( = ?auto_185687 ?auto_185689 ) ) ( not ( = ?auto_185687 ?auto_185690 ) ) ( not ( = ?auto_185687 ?auto_185691 ) ) ( not ( = ?auto_185688 ?auto_185689 ) ) ( not ( = ?auto_185688 ?auto_185690 ) ) ( not ( = ?auto_185688 ?auto_185691 ) ) ( not ( = ?auto_185689 ?auto_185690 ) ) ( not ( = ?auto_185689 ?auto_185691 ) ) ( not ( = ?auto_185690 ?auto_185691 ) ) ( HOLDING ?auto_185692 ) ( CLEAR ?auto_185693 ) ( not ( = ?auto_185687 ?auto_185692 ) ) ( not ( = ?auto_185687 ?auto_185693 ) ) ( not ( = ?auto_185688 ?auto_185692 ) ) ( not ( = ?auto_185688 ?auto_185693 ) ) ( not ( = ?auto_185689 ?auto_185692 ) ) ( not ( = ?auto_185689 ?auto_185693 ) ) ( not ( = ?auto_185690 ?auto_185692 ) ) ( not ( = ?auto_185690 ?auto_185693 ) ) ( not ( = ?auto_185691 ?auto_185692 ) ) ( not ( = ?auto_185691 ?auto_185693 ) ) ( not ( = ?auto_185692 ?auto_185693 ) ) )
    :subtasks
    ( ( !STACK ?auto_185692 ?auto_185693 )
      ( MAKE-4PILE ?auto_185687 ?auto_185688 ?auto_185689 ?auto_185690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185694 - BLOCK
      ?auto_185695 - BLOCK
      ?auto_185696 - BLOCK
      ?auto_185697 - BLOCK
    )
    :vars
    (
      ?auto_185698 - BLOCK
      ?auto_185700 - BLOCK
      ?auto_185699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185698 ?auto_185697 ) ( ON-TABLE ?auto_185694 ) ( ON ?auto_185695 ?auto_185694 ) ( ON ?auto_185696 ?auto_185695 ) ( ON ?auto_185697 ?auto_185696 ) ( not ( = ?auto_185694 ?auto_185695 ) ) ( not ( = ?auto_185694 ?auto_185696 ) ) ( not ( = ?auto_185694 ?auto_185697 ) ) ( not ( = ?auto_185694 ?auto_185698 ) ) ( not ( = ?auto_185695 ?auto_185696 ) ) ( not ( = ?auto_185695 ?auto_185697 ) ) ( not ( = ?auto_185695 ?auto_185698 ) ) ( not ( = ?auto_185696 ?auto_185697 ) ) ( not ( = ?auto_185696 ?auto_185698 ) ) ( not ( = ?auto_185697 ?auto_185698 ) ) ( CLEAR ?auto_185700 ) ( not ( = ?auto_185694 ?auto_185699 ) ) ( not ( = ?auto_185694 ?auto_185700 ) ) ( not ( = ?auto_185695 ?auto_185699 ) ) ( not ( = ?auto_185695 ?auto_185700 ) ) ( not ( = ?auto_185696 ?auto_185699 ) ) ( not ( = ?auto_185696 ?auto_185700 ) ) ( not ( = ?auto_185697 ?auto_185699 ) ) ( not ( = ?auto_185697 ?auto_185700 ) ) ( not ( = ?auto_185698 ?auto_185699 ) ) ( not ( = ?auto_185698 ?auto_185700 ) ) ( not ( = ?auto_185699 ?auto_185700 ) ) ( ON ?auto_185699 ?auto_185698 ) ( CLEAR ?auto_185699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185694 ?auto_185695 ?auto_185696 ?auto_185697 ?auto_185698 )
      ( MAKE-4PILE ?auto_185694 ?auto_185695 ?auto_185696 ?auto_185697 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185701 - BLOCK
      ?auto_185702 - BLOCK
      ?auto_185703 - BLOCK
      ?auto_185704 - BLOCK
    )
    :vars
    (
      ?auto_185706 - BLOCK
      ?auto_185705 - BLOCK
      ?auto_185707 - BLOCK
      ?auto_185708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185706 ?auto_185704 ) ( ON-TABLE ?auto_185701 ) ( ON ?auto_185702 ?auto_185701 ) ( ON ?auto_185703 ?auto_185702 ) ( ON ?auto_185704 ?auto_185703 ) ( not ( = ?auto_185701 ?auto_185702 ) ) ( not ( = ?auto_185701 ?auto_185703 ) ) ( not ( = ?auto_185701 ?auto_185704 ) ) ( not ( = ?auto_185701 ?auto_185706 ) ) ( not ( = ?auto_185702 ?auto_185703 ) ) ( not ( = ?auto_185702 ?auto_185704 ) ) ( not ( = ?auto_185702 ?auto_185706 ) ) ( not ( = ?auto_185703 ?auto_185704 ) ) ( not ( = ?auto_185703 ?auto_185706 ) ) ( not ( = ?auto_185704 ?auto_185706 ) ) ( not ( = ?auto_185701 ?auto_185705 ) ) ( not ( = ?auto_185701 ?auto_185707 ) ) ( not ( = ?auto_185702 ?auto_185705 ) ) ( not ( = ?auto_185702 ?auto_185707 ) ) ( not ( = ?auto_185703 ?auto_185705 ) ) ( not ( = ?auto_185703 ?auto_185707 ) ) ( not ( = ?auto_185704 ?auto_185705 ) ) ( not ( = ?auto_185704 ?auto_185707 ) ) ( not ( = ?auto_185706 ?auto_185705 ) ) ( not ( = ?auto_185706 ?auto_185707 ) ) ( not ( = ?auto_185705 ?auto_185707 ) ) ( ON ?auto_185705 ?auto_185706 ) ( CLEAR ?auto_185705 ) ( HOLDING ?auto_185707 ) ( CLEAR ?auto_185708 ) ( ON-TABLE ?auto_185708 ) ( not ( = ?auto_185708 ?auto_185707 ) ) ( not ( = ?auto_185701 ?auto_185708 ) ) ( not ( = ?auto_185702 ?auto_185708 ) ) ( not ( = ?auto_185703 ?auto_185708 ) ) ( not ( = ?auto_185704 ?auto_185708 ) ) ( not ( = ?auto_185706 ?auto_185708 ) ) ( not ( = ?auto_185705 ?auto_185708 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185708 ?auto_185707 )
      ( MAKE-4PILE ?auto_185701 ?auto_185702 ?auto_185703 ?auto_185704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185709 - BLOCK
      ?auto_185710 - BLOCK
      ?auto_185711 - BLOCK
      ?auto_185712 - BLOCK
    )
    :vars
    (
      ?auto_185715 - BLOCK
      ?auto_185714 - BLOCK
      ?auto_185716 - BLOCK
      ?auto_185713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185715 ?auto_185712 ) ( ON-TABLE ?auto_185709 ) ( ON ?auto_185710 ?auto_185709 ) ( ON ?auto_185711 ?auto_185710 ) ( ON ?auto_185712 ?auto_185711 ) ( not ( = ?auto_185709 ?auto_185710 ) ) ( not ( = ?auto_185709 ?auto_185711 ) ) ( not ( = ?auto_185709 ?auto_185712 ) ) ( not ( = ?auto_185709 ?auto_185715 ) ) ( not ( = ?auto_185710 ?auto_185711 ) ) ( not ( = ?auto_185710 ?auto_185712 ) ) ( not ( = ?auto_185710 ?auto_185715 ) ) ( not ( = ?auto_185711 ?auto_185712 ) ) ( not ( = ?auto_185711 ?auto_185715 ) ) ( not ( = ?auto_185712 ?auto_185715 ) ) ( not ( = ?auto_185709 ?auto_185714 ) ) ( not ( = ?auto_185709 ?auto_185716 ) ) ( not ( = ?auto_185710 ?auto_185714 ) ) ( not ( = ?auto_185710 ?auto_185716 ) ) ( not ( = ?auto_185711 ?auto_185714 ) ) ( not ( = ?auto_185711 ?auto_185716 ) ) ( not ( = ?auto_185712 ?auto_185714 ) ) ( not ( = ?auto_185712 ?auto_185716 ) ) ( not ( = ?auto_185715 ?auto_185714 ) ) ( not ( = ?auto_185715 ?auto_185716 ) ) ( not ( = ?auto_185714 ?auto_185716 ) ) ( ON ?auto_185714 ?auto_185715 ) ( CLEAR ?auto_185713 ) ( ON-TABLE ?auto_185713 ) ( not ( = ?auto_185713 ?auto_185716 ) ) ( not ( = ?auto_185709 ?auto_185713 ) ) ( not ( = ?auto_185710 ?auto_185713 ) ) ( not ( = ?auto_185711 ?auto_185713 ) ) ( not ( = ?auto_185712 ?auto_185713 ) ) ( not ( = ?auto_185715 ?auto_185713 ) ) ( not ( = ?auto_185714 ?auto_185713 ) ) ( ON ?auto_185716 ?auto_185714 ) ( CLEAR ?auto_185716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185709 ?auto_185710 ?auto_185711 ?auto_185712 ?auto_185715 ?auto_185714 )
      ( MAKE-4PILE ?auto_185709 ?auto_185710 ?auto_185711 ?auto_185712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185717 - BLOCK
      ?auto_185718 - BLOCK
      ?auto_185719 - BLOCK
      ?auto_185720 - BLOCK
    )
    :vars
    (
      ?auto_185723 - BLOCK
      ?auto_185724 - BLOCK
      ?auto_185722 - BLOCK
      ?auto_185721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185723 ?auto_185720 ) ( ON-TABLE ?auto_185717 ) ( ON ?auto_185718 ?auto_185717 ) ( ON ?auto_185719 ?auto_185718 ) ( ON ?auto_185720 ?auto_185719 ) ( not ( = ?auto_185717 ?auto_185718 ) ) ( not ( = ?auto_185717 ?auto_185719 ) ) ( not ( = ?auto_185717 ?auto_185720 ) ) ( not ( = ?auto_185717 ?auto_185723 ) ) ( not ( = ?auto_185718 ?auto_185719 ) ) ( not ( = ?auto_185718 ?auto_185720 ) ) ( not ( = ?auto_185718 ?auto_185723 ) ) ( not ( = ?auto_185719 ?auto_185720 ) ) ( not ( = ?auto_185719 ?auto_185723 ) ) ( not ( = ?auto_185720 ?auto_185723 ) ) ( not ( = ?auto_185717 ?auto_185724 ) ) ( not ( = ?auto_185717 ?auto_185722 ) ) ( not ( = ?auto_185718 ?auto_185724 ) ) ( not ( = ?auto_185718 ?auto_185722 ) ) ( not ( = ?auto_185719 ?auto_185724 ) ) ( not ( = ?auto_185719 ?auto_185722 ) ) ( not ( = ?auto_185720 ?auto_185724 ) ) ( not ( = ?auto_185720 ?auto_185722 ) ) ( not ( = ?auto_185723 ?auto_185724 ) ) ( not ( = ?auto_185723 ?auto_185722 ) ) ( not ( = ?auto_185724 ?auto_185722 ) ) ( ON ?auto_185724 ?auto_185723 ) ( not ( = ?auto_185721 ?auto_185722 ) ) ( not ( = ?auto_185717 ?auto_185721 ) ) ( not ( = ?auto_185718 ?auto_185721 ) ) ( not ( = ?auto_185719 ?auto_185721 ) ) ( not ( = ?auto_185720 ?auto_185721 ) ) ( not ( = ?auto_185723 ?auto_185721 ) ) ( not ( = ?auto_185724 ?auto_185721 ) ) ( ON ?auto_185722 ?auto_185724 ) ( CLEAR ?auto_185722 ) ( HOLDING ?auto_185721 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185721 )
      ( MAKE-4PILE ?auto_185717 ?auto_185718 ?auto_185719 ?auto_185720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185725 - BLOCK
      ?auto_185726 - BLOCK
      ?auto_185727 - BLOCK
      ?auto_185728 - BLOCK
    )
    :vars
    (
      ?auto_185732 - BLOCK
      ?auto_185729 - BLOCK
      ?auto_185731 - BLOCK
      ?auto_185730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185732 ?auto_185728 ) ( ON-TABLE ?auto_185725 ) ( ON ?auto_185726 ?auto_185725 ) ( ON ?auto_185727 ?auto_185726 ) ( ON ?auto_185728 ?auto_185727 ) ( not ( = ?auto_185725 ?auto_185726 ) ) ( not ( = ?auto_185725 ?auto_185727 ) ) ( not ( = ?auto_185725 ?auto_185728 ) ) ( not ( = ?auto_185725 ?auto_185732 ) ) ( not ( = ?auto_185726 ?auto_185727 ) ) ( not ( = ?auto_185726 ?auto_185728 ) ) ( not ( = ?auto_185726 ?auto_185732 ) ) ( not ( = ?auto_185727 ?auto_185728 ) ) ( not ( = ?auto_185727 ?auto_185732 ) ) ( not ( = ?auto_185728 ?auto_185732 ) ) ( not ( = ?auto_185725 ?auto_185729 ) ) ( not ( = ?auto_185725 ?auto_185731 ) ) ( not ( = ?auto_185726 ?auto_185729 ) ) ( not ( = ?auto_185726 ?auto_185731 ) ) ( not ( = ?auto_185727 ?auto_185729 ) ) ( not ( = ?auto_185727 ?auto_185731 ) ) ( not ( = ?auto_185728 ?auto_185729 ) ) ( not ( = ?auto_185728 ?auto_185731 ) ) ( not ( = ?auto_185732 ?auto_185729 ) ) ( not ( = ?auto_185732 ?auto_185731 ) ) ( not ( = ?auto_185729 ?auto_185731 ) ) ( ON ?auto_185729 ?auto_185732 ) ( not ( = ?auto_185730 ?auto_185731 ) ) ( not ( = ?auto_185725 ?auto_185730 ) ) ( not ( = ?auto_185726 ?auto_185730 ) ) ( not ( = ?auto_185727 ?auto_185730 ) ) ( not ( = ?auto_185728 ?auto_185730 ) ) ( not ( = ?auto_185732 ?auto_185730 ) ) ( not ( = ?auto_185729 ?auto_185730 ) ) ( ON ?auto_185731 ?auto_185729 ) ( ON ?auto_185730 ?auto_185731 ) ( CLEAR ?auto_185730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185725 ?auto_185726 ?auto_185727 ?auto_185728 ?auto_185732 ?auto_185729 ?auto_185731 )
      ( MAKE-4PILE ?auto_185725 ?auto_185726 ?auto_185727 ?auto_185728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185733 - BLOCK
      ?auto_185734 - BLOCK
      ?auto_185735 - BLOCK
      ?auto_185736 - BLOCK
    )
    :vars
    (
      ?auto_185737 - BLOCK
      ?auto_185740 - BLOCK
      ?auto_185739 - BLOCK
      ?auto_185738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185737 ?auto_185736 ) ( ON-TABLE ?auto_185733 ) ( ON ?auto_185734 ?auto_185733 ) ( ON ?auto_185735 ?auto_185734 ) ( ON ?auto_185736 ?auto_185735 ) ( not ( = ?auto_185733 ?auto_185734 ) ) ( not ( = ?auto_185733 ?auto_185735 ) ) ( not ( = ?auto_185733 ?auto_185736 ) ) ( not ( = ?auto_185733 ?auto_185737 ) ) ( not ( = ?auto_185734 ?auto_185735 ) ) ( not ( = ?auto_185734 ?auto_185736 ) ) ( not ( = ?auto_185734 ?auto_185737 ) ) ( not ( = ?auto_185735 ?auto_185736 ) ) ( not ( = ?auto_185735 ?auto_185737 ) ) ( not ( = ?auto_185736 ?auto_185737 ) ) ( not ( = ?auto_185733 ?auto_185740 ) ) ( not ( = ?auto_185733 ?auto_185739 ) ) ( not ( = ?auto_185734 ?auto_185740 ) ) ( not ( = ?auto_185734 ?auto_185739 ) ) ( not ( = ?auto_185735 ?auto_185740 ) ) ( not ( = ?auto_185735 ?auto_185739 ) ) ( not ( = ?auto_185736 ?auto_185740 ) ) ( not ( = ?auto_185736 ?auto_185739 ) ) ( not ( = ?auto_185737 ?auto_185740 ) ) ( not ( = ?auto_185737 ?auto_185739 ) ) ( not ( = ?auto_185740 ?auto_185739 ) ) ( ON ?auto_185740 ?auto_185737 ) ( not ( = ?auto_185738 ?auto_185739 ) ) ( not ( = ?auto_185733 ?auto_185738 ) ) ( not ( = ?auto_185734 ?auto_185738 ) ) ( not ( = ?auto_185735 ?auto_185738 ) ) ( not ( = ?auto_185736 ?auto_185738 ) ) ( not ( = ?auto_185737 ?auto_185738 ) ) ( not ( = ?auto_185740 ?auto_185738 ) ) ( ON ?auto_185739 ?auto_185740 ) ( HOLDING ?auto_185738 ) ( CLEAR ?auto_185739 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185733 ?auto_185734 ?auto_185735 ?auto_185736 ?auto_185737 ?auto_185740 ?auto_185739 ?auto_185738 )
      ( MAKE-4PILE ?auto_185733 ?auto_185734 ?auto_185735 ?auto_185736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185741 - BLOCK
      ?auto_185742 - BLOCK
      ?auto_185743 - BLOCK
      ?auto_185744 - BLOCK
    )
    :vars
    (
      ?auto_185746 - BLOCK
      ?auto_185745 - BLOCK
      ?auto_185748 - BLOCK
      ?auto_185747 - BLOCK
      ?auto_185749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185746 ?auto_185744 ) ( ON-TABLE ?auto_185741 ) ( ON ?auto_185742 ?auto_185741 ) ( ON ?auto_185743 ?auto_185742 ) ( ON ?auto_185744 ?auto_185743 ) ( not ( = ?auto_185741 ?auto_185742 ) ) ( not ( = ?auto_185741 ?auto_185743 ) ) ( not ( = ?auto_185741 ?auto_185744 ) ) ( not ( = ?auto_185741 ?auto_185746 ) ) ( not ( = ?auto_185742 ?auto_185743 ) ) ( not ( = ?auto_185742 ?auto_185744 ) ) ( not ( = ?auto_185742 ?auto_185746 ) ) ( not ( = ?auto_185743 ?auto_185744 ) ) ( not ( = ?auto_185743 ?auto_185746 ) ) ( not ( = ?auto_185744 ?auto_185746 ) ) ( not ( = ?auto_185741 ?auto_185745 ) ) ( not ( = ?auto_185741 ?auto_185748 ) ) ( not ( = ?auto_185742 ?auto_185745 ) ) ( not ( = ?auto_185742 ?auto_185748 ) ) ( not ( = ?auto_185743 ?auto_185745 ) ) ( not ( = ?auto_185743 ?auto_185748 ) ) ( not ( = ?auto_185744 ?auto_185745 ) ) ( not ( = ?auto_185744 ?auto_185748 ) ) ( not ( = ?auto_185746 ?auto_185745 ) ) ( not ( = ?auto_185746 ?auto_185748 ) ) ( not ( = ?auto_185745 ?auto_185748 ) ) ( ON ?auto_185745 ?auto_185746 ) ( not ( = ?auto_185747 ?auto_185748 ) ) ( not ( = ?auto_185741 ?auto_185747 ) ) ( not ( = ?auto_185742 ?auto_185747 ) ) ( not ( = ?auto_185743 ?auto_185747 ) ) ( not ( = ?auto_185744 ?auto_185747 ) ) ( not ( = ?auto_185746 ?auto_185747 ) ) ( not ( = ?auto_185745 ?auto_185747 ) ) ( ON ?auto_185748 ?auto_185745 ) ( CLEAR ?auto_185748 ) ( ON ?auto_185747 ?auto_185749 ) ( CLEAR ?auto_185747 ) ( HAND-EMPTY ) ( not ( = ?auto_185741 ?auto_185749 ) ) ( not ( = ?auto_185742 ?auto_185749 ) ) ( not ( = ?auto_185743 ?auto_185749 ) ) ( not ( = ?auto_185744 ?auto_185749 ) ) ( not ( = ?auto_185746 ?auto_185749 ) ) ( not ( = ?auto_185745 ?auto_185749 ) ) ( not ( = ?auto_185748 ?auto_185749 ) ) ( not ( = ?auto_185747 ?auto_185749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185747 ?auto_185749 )
      ( MAKE-4PILE ?auto_185741 ?auto_185742 ?auto_185743 ?auto_185744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185750 - BLOCK
      ?auto_185751 - BLOCK
      ?auto_185752 - BLOCK
      ?auto_185753 - BLOCK
    )
    :vars
    (
      ?auto_185754 - BLOCK
      ?auto_185758 - BLOCK
      ?auto_185755 - BLOCK
      ?auto_185757 - BLOCK
      ?auto_185756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185754 ?auto_185753 ) ( ON-TABLE ?auto_185750 ) ( ON ?auto_185751 ?auto_185750 ) ( ON ?auto_185752 ?auto_185751 ) ( ON ?auto_185753 ?auto_185752 ) ( not ( = ?auto_185750 ?auto_185751 ) ) ( not ( = ?auto_185750 ?auto_185752 ) ) ( not ( = ?auto_185750 ?auto_185753 ) ) ( not ( = ?auto_185750 ?auto_185754 ) ) ( not ( = ?auto_185751 ?auto_185752 ) ) ( not ( = ?auto_185751 ?auto_185753 ) ) ( not ( = ?auto_185751 ?auto_185754 ) ) ( not ( = ?auto_185752 ?auto_185753 ) ) ( not ( = ?auto_185752 ?auto_185754 ) ) ( not ( = ?auto_185753 ?auto_185754 ) ) ( not ( = ?auto_185750 ?auto_185758 ) ) ( not ( = ?auto_185750 ?auto_185755 ) ) ( not ( = ?auto_185751 ?auto_185758 ) ) ( not ( = ?auto_185751 ?auto_185755 ) ) ( not ( = ?auto_185752 ?auto_185758 ) ) ( not ( = ?auto_185752 ?auto_185755 ) ) ( not ( = ?auto_185753 ?auto_185758 ) ) ( not ( = ?auto_185753 ?auto_185755 ) ) ( not ( = ?auto_185754 ?auto_185758 ) ) ( not ( = ?auto_185754 ?auto_185755 ) ) ( not ( = ?auto_185758 ?auto_185755 ) ) ( ON ?auto_185758 ?auto_185754 ) ( not ( = ?auto_185757 ?auto_185755 ) ) ( not ( = ?auto_185750 ?auto_185757 ) ) ( not ( = ?auto_185751 ?auto_185757 ) ) ( not ( = ?auto_185752 ?auto_185757 ) ) ( not ( = ?auto_185753 ?auto_185757 ) ) ( not ( = ?auto_185754 ?auto_185757 ) ) ( not ( = ?auto_185758 ?auto_185757 ) ) ( ON ?auto_185757 ?auto_185756 ) ( CLEAR ?auto_185757 ) ( not ( = ?auto_185750 ?auto_185756 ) ) ( not ( = ?auto_185751 ?auto_185756 ) ) ( not ( = ?auto_185752 ?auto_185756 ) ) ( not ( = ?auto_185753 ?auto_185756 ) ) ( not ( = ?auto_185754 ?auto_185756 ) ) ( not ( = ?auto_185758 ?auto_185756 ) ) ( not ( = ?auto_185755 ?auto_185756 ) ) ( not ( = ?auto_185757 ?auto_185756 ) ) ( HOLDING ?auto_185755 ) ( CLEAR ?auto_185758 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185750 ?auto_185751 ?auto_185752 ?auto_185753 ?auto_185754 ?auto_185758 ?auto_185755 )
      ( MAKE-4PILE ?auto_185750 ?auto_185751 ?auto_185752 ?auto_185753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185759 - BLOCK
      ?auto_185760 - BLOCK
      ?auto_185761 - BLOCK
      ?auto_185762 - BLOCK
    )
    :vars
    (
      ?auto_185767 - BLOCK
      ?auto_185764 - BLOCK
      ?auto_185765 - BLOCK
      ?auto_185766 - BLOCK
      ?auto_185763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185767 ?auto_185762 ) ( ON-TABLE ?auto_185759 ) ( ON ?auto_185760 ?auto_185759 ) ( ON ?auto_185761 ?auto_185760 ) ( ON ?auto_185762 ?auto_185761 ) ( not ( = ?auto_185759 ?auto_185760 ) ) ( not ( = ?auto_185759 ?auto_185761 ) ) ( not ( = ?auto_185759 ?auto_185762 ) ) ( not ( = ?auto_185759 ?auto_185767 ) ) ( not ( = ?auto_185760 ?auto_185761 ) ) ( not ( = ?auto_185760 ?auto_185762 ) ) ( not ( = ?auto_185760 ?auto_185767 ) ) ( not ( = ?auto_185761 ?auto_185762 ) ) ( not ( = ?auto_185761 ?auto_185767 ) ) ( not ( = ?auto_185762 ?auto_185767 ) ) ( not ( = ?auto_185759 ?auto_185764 ) ) ( not ( = ?auto_185759 ?auto_185765 ) ) ( not ( = ?auto_185760 ?auto_185764 ) ) ( not ( = ?auto_185760 ?auto_185765 ) ) ( not ( = ?auto_185761 ?auto_185764 ) ) ( not ( = ?auto_185761 ?auto_185765 ) ) ( not ( = ?auto_185762 ?auto_185764 ) ) ( not ( = ?auto_185762 ?auto_185765 ) ) ( not ( = ?auto_185767 ?auto_185764 ) ) ( not ( = ?auto_185767 ?auto_185765 ) ) ( not ( = ?auto_185764 ?auto_185765 ) ) ( ON ?auto_185764 ?auto_185767 ) ( not ( = ?auto_185766 ?auto_185765 ) ) ( not ( = ?auto_185759 ?auto_185766 ) ) ( not ( = ?auto_185760 ?auto_185766 ) ) ( not ( = ?auto_185761 ?auto_185766 ) ) ( not ( = ?auto_185762 ?auto_185766 ) ) ( not ( = ?auto_185767 ?auto_185766 ) ) ( not ( = ?auto_185764 ?auto_185766 ) ) ( ON ?auto_185766 ?auto_185763 ) ( not ( = ?auto_185759 ?auto_185763 ) ) ( not ( = ?auto_185760 ?auto_185763 ) ) ( not ( = ?auto_185761 ?auto_185763 ) ) ( not ( = ?auto_185762 ?auto_185763 ) ) ( not ( = ?auto_185767 ?auto_185763 ) ) ( not ( = ?auto_185764 ?auto_185763 ) ) ( not ( = ?auto_185765 ?auto_185763 ) ) ( not ( = ?auto_185766 ?auto_185763 ) ) ( CLEAR ?auto_185764 ) ( ON ?auto_185765 ?auto_185766 ) ( CLEAR ?auto_185765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185763 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185763 ?auto_185766 )
      ( MAKE-4PILE ?auto_185759 ?auto_185760 ?auto_185761 ?auto_185762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185768 - BLOCK
      ?auto_185769 - BLOCK
      ?auto_185770 - BLOCK
      ?auto_185771 - BLOCK
    )
    :vars
    (
      ?auto_185774 - BLOCK
      ?auto_185775 - BLOCK
      ?auto_185772 - BLOCK
      ?auto_185773 - BLOCK
      ?auto_185776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185774 ?auto_185771 ) ( ON-TABLE ?auto_185768 ) ( ON ?auto_185769 ?auto_185768 ) ( ON ?auto_185770 ?auto_185769 ) ( ON ?auto_185771 ?auto_185770 ) ( not ( = ?auto_185768 ?auto_185769 ) ) ( not ( = ?auto_185768 ?auto_185770 ) ) ( not ( = ?auto_185768 ?auto_185771 ) ) ( not ( = ?auto_185768 ?auto_185774 ) ) ( not ( = ?auto_185769 ?auto_185770 ) ) ( not ( = ?auto_185769 ?auto_185771 ) ) ( not ( = ?auto_185769 ?auto_185774 ) ) ( not ( = ?auto_185770 ?auto_185771 ) ) ( not ( = ?auto_185770 ?auto_185774 ) ) ( not ( = ?auto_185771 ?auto_185774 ) ) ( not ( = ?auto_185768 ?auto_185775 ) ) ( not ( = ?auto_185768 ?auto_185772 ) ) ( not ( = ?auto_185769 ?auto_185775 ) ) ( not ( = ?auto_185769 ?auto_185772 ) ) ( not ( = ?auto_185770 ?auto_185775 ) ) ( not ( = ?auto_185770 ?auto_185772 ) ) ( not ( = ?auto_185771 ?auto_185775 ) ) ( not ( = ?auto_185771 ?auto_185772 ) ) ( not ( = ?auto_185774 ?auto_185775 ) ) ( not ( = ?auto_185774 ?auto_185772 ) ) ( not ( = ?auto_185775 ?auto_185772 ) ) ( not ( = ?auto_185773 ?auto_185772 ) ) ( not ( = ?auto_185768 ?auto_185773 ) ) ( not ( = ?auto_185769 ?auto_185773 ) ) ( not ( = ?auto_185770 ?auto_185773 ) ) ( not ( = ?auto_185771 ?auto_185773 ) ) ( not ( = ?auto_185774 ?auto_185773 ) ) ( not ( = ?auto_185775 ?auto_185773 ) ) ( ON ?auto_185773 ?auto_185776 ) ( not ( = ?auto_185768 ?auto_185776 ) ) ( not ( = ?auto_185769 ?auto_185776 ) ) ( not ( = ?auto_185770 ?auto_185776 ) ) ( not ( = ?auto_185771 ?auto_185776 ) ) ( not ( = ?auto_185774 ?auto_185776 ) ) ( not ( = ?auto_185775 ?auto_185776 ) ) ( not ( = ?auto_185772 ?auto_185776 ) ) ( not ( = ?auto_185773 ?auto_185776 ) ) ( ON ?auto_185772 ?auto_185773 ) ( CLEAR ?auto_185772 ) ( ON-TABLE ?auto_185776 ) ( HOLDING ?auto_185775 ) ( CLEAR ?auto_185774 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185768 ?auto_185769 ?auto_185770 ?auto_185771 ?auto_185774 ?auto_185775 )
      ( MAKE-4PILE ?auto_185768 ?auto_185769 ?auto_185770 ?auto_185771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185777 - BLOCK
      ?auto_185778 - BLOCK
      ?auto_185779 - BLOCK
      ?auto_185780 - BLOCK
    )
    :vars
    (
      ?auto_185785 - BLOCK
      ?auto_185781 - BLOCK
      ?auto_185782 - BLOCK
      ?auto_185784 - BLOCK
      ?auto_185783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185785 ?auto_185780 ) ( ON-TABLE ?auto_185777 ) ( ON ?auto_185778 ?auto_185777 ) ( ON ?auto_185779 ?auto_185778 ) ( ON ?auto_185780 ?auto_185779 ) ( not ( = ?auto_185777 ?auto_185778 ) ) ( not ( = ?auto_185777 ?auto_185779 ) ) ( not ( = ?auto_185777 ?auto_185780 ) ) ( not ( = ?auto_185777 ?auto_185785 ) ) ( not ( = ?auto_185778 ?auto_185779 ) ) ( not ( = ?auto_185778 ?auto_185780 ) ) ( not ( = ?auto_185778 ?auto_185785 ) ) ( not ( = ?auto_185779 ?auto_185780 ) ) ( not ( = ?auto_185779 ?auto_185785 ) ) ( not ( = ?auto_185780 ?auto_185785 ) ) ( not ( = ?auto_185777 ?auto_185781 ) ) ( not ( = ?auto_185777 ?auto_185782 ) ) ( not ( = ?auto_185778 ?auto_185781 ) ) ( not ( = ?auto_185778 ?auto_185782 ) ) ( not ( = ?auto_185779 ?auto_185781 ) ) ( not ( = ?auto_185779 ?auto_185782 ) ) ( not ( = ?auto_185780 ?auto_185781 ) ) ( not ( = ?auto_185780 ?auto_185782 ) ) ( not ( = ?auto_185785 ?auto_185781 ) ) ( not ( = ?auto_185785 ?auto_185782 ) ) ( not ( = ?auto_185781 ?auto_185782 ) ) ( not ( = ?auto_185784 ?auto_185782 ) ) ( not ( = ?auto_185777 ?auto_185784 ) ) ( not ( = ?auto_185778 ?auto_185784 ) ) ( not ( = ?auto_185779 ?auto_185784 ) ) ( not ( = ?auto_185780 ?auto_185784 ) ) ( not ( = ?auto_185785 ?auto_185784 ) ) ( not ( = ?auto_185781 ?auto_185784 ) ) ( ON ?auto_185784 ?auto_185783 ) ( not ( = ?auto_185777 ?auto_185783 ) ) ( not ( = ?auto_185778 ?auto_185783 ) ) ( not ( = ?auto_185779 ?auto_185783 ) ) ( not ( = ?auto_185780 ?auto_185783 ) ) ( not ( = ?auto_185785 ?auto_185783 ) ) ( not ( = ?auto_185781 ?auto_185783 ) ) ( not ( = ?auto_185782 ?auto_185783 ) ) ( not ( = ?auto_185784 ?auto_185783 ) ) ( ON ?auto_185782 ?auto_185784 ) ( ON-TABLE ?auto_185783 ) ( CLEAR ?auto_185785 ) ( ON ?auto_185781 ?auto_185782 ) ( CLEAR ?auto_185781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185783 ?auto_185784 ?auto_185782 )
      ( MAKE-4PILE ?auto_185777 ?auto_185778 ?auto_185779 ?auto_185780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185804 - BLOCK
      ?auto_185805 - BLOCK
      ?auto_185806 - BLOCK
      ?auto_185807 - BLOCK
    )
    :vars
    (
      ?auto_185810 - BLOCK
      ?auto_185811 - BLOCK
      ?auto_185812 - BLOCK
      ?auto_185809 - BLOCK
      ?auto_185808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185804 ) ( ON ?auto_185805 ?auto_185804 ) ( ON ?auto_185806 ?auto_185805 ) ( not ( = ?auto_185804 ?auto_185805 ) ) ( not ( = ?auto_185804 ?auto_185806 ) ) ( not ( = ?auto_185804 ?auto_185807 ) ) ( not ( = ?auto_185804 ?auto_185810 ) ) ( not ( = ?auto_185805 ?auto_185806 ) ) ( not ( = ?auto_185805 ?auto_185807 ) ) ( not ( = ?auto_185805 ?auto_185810 ) ) ( not ( = ?auto_185806 ?auto_185807 ) ) ( not ( = ?auto_185806 ?auto_185810 ) ) ( not ( = ?auto_185807 ?auto_185810 ) ) ( not ( = ?auto_185804 ?auto_185811 ) ) ( not ( = ?auto_185804 ?auto_185812 ) ) ( not ( = ?auto_185805 ?auto_185811 ) ) ( not ( = ?auto_185805 ?auto_185812 ) ) ( not ( = ?auto_185806 ?auto_185811 ) ) ( not ( = ?auto_185806 ?auto_185812 ) ) ( not ( = ?auto_185807 ?auto_185811 ) ) ( not ( = ?auto_185807 ?auto_185812 ) ) ( not ( = ?auto_185810 ?auto_185811 ) ) ( not ( = ?auto_185810 ?auto_185812 ) ) ( not ( = ?auto_185811 ?auto_185812 ) ) ( not ( = ?auto_185809 ?auto_185812 ) ) ( not ( = ?auto_185804 ?auto_185809 ) ) ( not ( = ?auto_185805 ?auto_185809 ) ) ( not ( = ?auto_185806 ?auto_185809 ) ) ( not ( = ?auto_185807 ?auto_185809 ) ) ( not ( = ?auto_185810 ?auto_185809 ) ) ( not ( = ?auto_185811 ?auto_185809 ) ) ( ON ?auto_185809 ?auto_185808 ) ( not ( = ?auto_185804 ?auto_185808 ) ) ( not ( = ?auto_185805 ?auto_185808 ) ) ( not ( = ?auto_185806 ?auto_185808 ) ) ( not ( = ?auto_185807 ?auto_185808 ) ) ( not ( = ?auto_185810 ?auto_185808 ) ) ( not ( = ?auto_185811 ?auto_185808 ) ) ( not ( = ?auto_185812 ?auto_185808 ) ) ( not ( = ?auto_185809 ?auto_185808 ) ) ( ON ?auto_185812 ?auto_185809 ) ( ON-TABLE ?auto_185808 ) ( ON ?auto_185811 ?auto_185812 ) ( ON ?auto_185810 ?auto_185811 ) ( CLEAR ?auto_185810 ) ( HOLDING ?auto_185807 ) ( CLEAR ?auto_185806 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185804 ?auto_185805 ?auto_185806 ?auto_185807 ?auto_185810 )
      ( MAKE-4PILE ?auto_185804 ?auto_185805 ?auto_185806 ?auto_185807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185813 - BLOCK
      ?auto_185814 - BLOCK
      ?auto_185815 - BLOCK
      ?auto_185816 - BLOCK
    )
    :vars
    (
      ?auto_185819 - BLOCK
      ?auto_185820 - BLOCK
      ?auto_185821 - BLOCK
      ?auto_185818 - BLOCK
      ?auto_185817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185813 ) ( ON ?auto_185814 ?auto_185813 ) ( ON ?auto_185815 ?auto_185814 ) ( not ( = ?auto_185813 ?auto_185814 ) ) ( not ( = ?auto_185813 ?auto_185815 ) ) ( not ( = ?auto_185813 ?auto_185816 ) ) ( not ( = ?auto_185813 ?auto_185819 ) ) ( not ( = ?auto_185814 ?auto_185815 ) ) ( not ( = ?auto_185814 ?auto_185816 ) ) ( not ( = ?auto_185814 ?auto_185819 ) ) ( not ( = ?auto_185815 ?auto_185816 ) ) ( not ( = ?auto_185815 ?auto_185819 ) ) ( not ( = ?auto_185816 ?auto_185819 ) ) ( not ( = ?auto_185813 ?auto_185820 ) ) ( not ( = ?auto_185813 ?auto_185821 ) ) ( not ( = ?auto_185814 ?auto_185820 ) ) ( not ( = ?auto_185814 ?auto_185821 ) ) ( not ( = ?auto_185815 ?auto_185820 ) ) ( not ( = ?auto_185815 ?auto_185821 ) ) ( not ( = ?auto_185816 ?auto_185820 ) ) ( not ( = ?auto_185816 ?auto_185821 ) ) ( not ( = ?auto_185819 ?auto_185820 ) ) ( not ( = ?auto_185819 ?auto_185821 ) ) ( not ( = ?auto_185820 ?auto_185821 ) ) ( not ( = ?auto_185818 ?auto_185821 ) ) ( not ( = ?auto_185813 ?auto_185818 ) ) ( not ( = ?auto_185814 ?auto_185818 ) ) ( not ( = ?auto_185815 ?auto_185818 ) ) ( not ( = ?auto_185816 ?auto_185818 ) ) ( not ( = ?auto_185819 ?auto_185818 ) ) ( not ( = ?auto_185820 ?auto_185818 ) ) ( ON ?auto_185818 ?auto_185817 ) ( not ( = ?auto_185813 ?auto_185817 ) ) ( not ( = ?auto_185814 ?auto_185817 ) ) ( not ( = ?auto_185815 ?auto_185817 ) ) ( not ( = ?auto_185816 ?auto_185817 ) ) ( not ( = ?auto_185819 ?auto_185817 ) ) ( not ( = ?auto_185820 ?auto_185817 ) ) ( not ( = ?auto_185821 ?auto_185817 ) ) ( not ( = ?auto_185818 ?auto_185817 ) ) ( ON ?auto_185821 ?auto_185818 ) ( ON-TABLE ?auto_185817 ) ( ON ?auto_185820 ?auto_185821 ) ( ON ?auto_185819 ?auto_185820 ) ( CLEAR ?auto_185815 ) ( ON ?auto_185816 ?auto_185819 ) ( CLEAR ?auto_185816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185817 ?auto_185818 ?auto_185821 ?auto_185820 ?auto_185819 )
      ( MAKE-4PILE ?auto_185813 ?auto_185814 ?auto_185815 ?auto_185816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185822 - BLOCK
      ?auto_185823 - BLOCK
      ?auto_185824 - BLOCK
      ?auto_185825 - BLOCK
    )
    :vars
    (
      ?auto_185827 - BLOCK
      ?auto_185828 - BLOCK
      ?auto_185826 - BLOCK
      ?auto_185830 - BLOCK
      ?auto_185829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185822 ) ( ON ?auto_185823 ?auto_185822 ) ( not ( = ?auto_185822 ?auto_185823 ) ) ( not ( = ?auto_185822 ?auto_185824 ) ) ( not ( = ?auto_185822 ?auto_185825 ) ) ( not ( = ?auto_185822 ?auto_185827 ) ) ( not ( = ?auto_185823 ?auto_185824 ) ) ( not ( = ?auto_185823 ?auto_185825 ) ) ( not ( = ?auto_185823 ?auto_185827 ) ) ( not ( = ?auto_185824 ?auto_185825 ) ) ( not ( = ?auto_185824 ?auto_185827 ) ) ( not ( = ?auto_185825 ?auto_185827 ) ) ( not ( = ?auto_185822 ?auto_185828 ) ) ( not ( = ?auto_185822 ?auto_185826 ) ) ( not ( = ?auto_185823 ?auto_185828 ) ) ( not ( = ?auto_185823 ?auto_185826 ) ) ( not ( = ?auto_185824 ?auto_185828 ) ) ( not ( = ?auto_185824 ?auto_185826 ) ) ( not ( = ?auto_185825 ?auto_185828 ) ) ( not ( = ?auto_185825 ?auto_185826 ) ) ( not ( = ?auto_185827 ?auto_185828 ) ) ( not ( = ?auto_185827 ?auto_185826 ) ) ( not ( = ?auto_185828 ?auto_185826 ) ) ( not ( = ?auto_185830 ?auto_185826 ) ) ( not ( = ?auto_185822 ?auto_185830 ) ) ( not ( = ?auto_185823 ?auto_185830 ) ) ( not ( = ?auto_185824 ?auto_185830 ) ) ( not ( = ?auto_185825 ?auto_185830 ) ) ( not ( = ?auto_185827 ?auto_185830 ) ) ( not ( = ?auto_185828 ?auto_185830 ) ) ( ON ?auto_185830 ?auto_185829 ) ( not ( = ?auto_185822 ?auto_185829 ) ) ( not ( = ?auto_185823 ?auto_185829 ) ) ( not ( = ?auto_185824 ?auto_185829 ) ) ( not ( = ?auto_185825 ?auto_185829 ) ) ( not ( = ?auto_185827 ?auto_185829 ) ) ( not ( = ?auto_185828 ?auto_185829 ) ) ( not ( = ?auto_185826 ?auto_185829 ) ) ( not ( = ?auto_185830 ?auto_185829 ) ) ( ON ?auto_185826 ?auto_185830 ) ( ON-TABLE ?auto_185829 ) ( ON ?auto_185828 ?auto_185826 ) ( ON ?auto_185827 ?auto_185828 ) ( ON ?auto_185825 ?auto_185827 ) ( CLEAR ?auto_185825 ) ( HOLDING ?auto_185824 ) ( CLEAR ?auto_185823 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185822 ?auto_185823 ?auto_185824 )
      ( MAKE-4PILE ?auto_185822 ?auto_185823 ?auto_185824 ?auto_185825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185831 - BLOCK
      ?auto_185832 - BLOCK
      ?auto_185833 - BLOCK
      ?auto_185834 - BLOCK
    )
    :vars
    (
      ?auto_185837 - BLOCK
      ?auto_185839 - BLOCK
      ?auto_185835 - BLOCK
      ?auto_185838 - BLOCK
      ?auto_185836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185831 ) ( ON ?auto_185832 ?auto_185831 ) ( not ( = ?auto_185831 ?auto_185832 ) ) ( not ( = ?auto_185831 ?auto_185833 ) ) ( not ( = ?auto_185831 ?auto_185834 ) ) ( not ( = ?auto_185831 ?auto_185837 ) ) ( not ( = ?auto_185832 ?auto_185833 ) ) ( not ( = ?auto_185832 ?auto_185834 ) ) ( not ( = ?auto_185832 ?auto_185837 ) ) ( not ( = ?auto_185833 ?auto_185834 ) ) ( not ( = ?auto_185833 ?auto_185837 ) ) ( not ( = ?auto_185834 ?auto_185837 ) ) ( not ( = ?auto_185831 ?auto_185839 ) ) ( not ( = ?auto_185831 ?auto_185835 ) ) ( not ( = ?auto_185832 ?auto_185839 ) ) ( not ( = ?auto_185832 ?auto_185835 ) ) ( not ( = ?auto_185833 ?auto_185839 ) ) ( not ( = ?auto_185833 ?auto_185835 ) ) ( not ( = ?auto_185834 ?auto_185839 ) ) ( not ( = ?auto_185834 ?auto_185835 ) ) ( not ( = ?auto_185837 ?auto_185839 ) ) ( not ( = ?auto_185837 ?auto_185835 ) ) ( not ( = ?auto_185839 ?auto_185835 ) ) ( not ( = ?auto_185838 ?auto_185835 ) ) ( not ( = ?auto_185831 ?auto_185838 ) ) ( not ( = ?auto_185832 ?auto_185838 ) ) ( not ( = ?auto_185833 ?auto_185838 ) ) ( not ( = ?auto_185834 ?auto_185838 ) ) ( not ( = ?auto_185837 ?auto_185838 ) ) ( not ( = ?auto_185839 ?auto_185838 ) ) ( ON ?auto_185838 ?auto_185836 ) ( not ( = ?auto_185831 ?auto_185836 ) ) ( not ( = ?auto_185832 ?auto_185836 ) ) ( not ( = ?auto_185833 ?auto_185836 ) ) ( not ( = ?auto_185834 ?auto_185836 ) ) ( not ( = ?auto_185837 ?auto_185836 ) ) ( not ( = ?auto_185839 ?auto_185836 ) ) ( not ( = ?auto_185835 ?auto_185836 ) ) ( not ( = ?auto_185838 ?auto_185836 ) ) ( ON ?auto_185835 ?auto_185838 ) ( ON-TABLE ?auto_185836 ) ( ON ?auto_185839 ?auto_185835 ) ( ON ?auto_185837 ?auto_185839 ) ( ON ?auto_185834 ?auto_185837 ) ( CLEAR ?auto_185832 ) ( ON ?auto_185833 ?auto_185834 ) ( CLEAR ?auto_185833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185836 ?auto_185838 ?auto_185835 ?auto_185839 ?auto_185837 ?auto_185834 )
      ( MAKE-4PILE ?auto_185831 ?auto_185832 ?auto_185833 ?auto_185834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185840 - BLOCK
      ?auto_185841 - BLOCK
      ?auto_185842 - BLOCK
      ?auto_185843 - BLOCK
    )
    :vars
    (
      ?auto_185847 - BLOCK
      ?auto_185848 - BLOCK
      ?auto_185846 - BLOCK
      ?auto_185845 - BLOCK
      ?auto_185844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185840 ) ( not ( = ?auto_185840 ?auto_185841 ) ) ( not ( = ?auto_185840 ?auto_185842 ) ) ( not ( = ?auto_185840 ?auto_185843 ) ) ( not ( = ?auto_185840 ?auto_185847 ) ) ( not ( = ?auto_185841 ?auto_185842 ) ) ( not ( = ?auto_185841 ?auto_185843 ) ) ( not ( = ?auto_185841 ?auto_185847 ) ) ( not ( = ?auto_185842 ?auto_185843 ) ) ( not ( = ?auto_185842 ?auto_185847 ) ) ( not ( = ?auto_185843 ?auto_185847 ) ) ( not ( = ?auto_185840 ?auto_185848 ) ) ( not ( = ?auto_185840 ?auto_185846 ) ) ( not ( = ?auto_185841 ?auto_185848 ) ) ( not ( = ?auto_185841 ?auto_185846 ) ) ( not ( = ?auto_185842 ?auto_185848 ) ) ( not ( = ?auto_185842 ?auto_185846 ) ) ( not ( = ?auto_185843 ?auto_185848 ) ) ( not ( = ?auto_185843 ?auto_185846 ) ) ( not ( = ?auto_185847 ?auto_185848 ) ) ( not ( = ?auto_185847 ?auto_185846 ) ) ( not ( = ?auto_185848 ?auto_185846 ) ) ( not ( = ?auto_185845 ?auto_185846 ) ) ( not ( = ?auto_185840 ?auto_185845 ) ) ( not ( = ?auto_185841 ?auto_185845 ) ) ( not ( = ?auto_185842 ?auto_185845 ) ) ( not ( = ?auto_185843 ?auto_185845 ) ) ( not ( = ?auto_185847 ?auto_185845 ) ) ( not ( = ?auto_185848 ?auto_185845 ) ) ( ON ?auto_185845 ?auto_185844 ) ( not ( = ?auto_185840 ?auto_185844 ) ) ( not ( = ?auto_185841 ?auto_185844 ) ) ( not ( = ?auto_185842 ?auto_185844 ) ) ( not ( = ?auto_185843 ?auto_185844 ) ) ( not ( = ?auto_185847 ?auto_185844 ) ) ( not ( = ?auto_185848 ?auto_185844 ) ) ( not ( = ?auto_185846 ?auto_185844 ) ) ( not ( = ?auto_185845 ?auto_185844 ) ) ( ON ?auto_185846 ?auto_185845 ) ( ON-TABLE ?auto_185844 ) ( ON ?auto_185848 ?auto_185846 ) ( ON ?auto_185847 ?auto_185848 ) ( ON ?auto_185843 ?auto_185847 ) ( ON ?auto_185842 ?auto_185843 ) ( CLEAR ?auto_185842 ) ( HOLDING ?auto_185841 ) ( CLEAR ?auto_185840 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185840 ?auto_185841 )
      ( MAKE-4PILE ?auto_185840 ?auto_185841 ?auto_185842 ?auto_185843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185849 - BLOCK
      ?auto_185850 - BLOCK
      ?auto_185851 - BLOCK
      ?auto_185852 - BLOCK
    )
    :vars
    (
      ?auto_185853 - BLOCK
      ?auto_185854 - BLOCK
      ?auto_185856 - BLOCK
      ?auto_185857 - BLOCK
      ?auto_185855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185849 ) ( not ( = ?auto_185849 ?auto_185850 ) ) ( not ( = ?auto_185849 ?auto_185851 ) ) ( not ( = ?auto_185849 ?auto_185852 ) ) ( not ( = ?auto_185849 ?auto_185853 ) ) ( not ( = ?auto_185850 ?auto_185851 ) ) ( not ( = ?auto_185850 ?auto_185852 ) ) ( not ( = ?auto_185850 ?auto_185853 ) ) ( not ( = ?auto_185851 ?auto_185852 ) ) ( not ( = ?auto_185851 ?auto_185853 ) ) ( not ( = ?auto_185852 ?auto_185853 ) ) ( not ( = ?auto_185849 ?auto_185854 ) ) ( not ( = ?auto_185849 ?auto_185856 ) ) ( not ( = ?auto_185850 ?auto_185854 ) ) ( not ( = ?auto_185850 ?auto_185856 ) ) ( not ( = ?auto_185851 ?auto_185854 ) ) ( not ( = ?auto_185851 ?auto_185856 ) ) ( not ( = ?auto_185852 ?auto_185854 ) ) ( not ( = ?auto_185852 ?auto_185856 ) ) ( not ( = ?auto_185853 ?auto_185854 ) ) ( not ( = ?auto_185853 ?auto_185856 ) ) ( not ( = ?auto_185854 ?auto_185856 ) ) ( not ( = ?auto_185857 ?auto_185856 ) ) ( not ( = ?auto_185849 ?auto_185857 ) ) ( not ( = ?auto_185850 ?auto_185857 ) ) ( not ( = ?auto_185851 ?auto_185857 ) ) ( not ( = ?auto_185852 ?auto_185857 ) ) ( not ( = ?auto_185853 ?auto_185857 ) ) ( not ( = ?auto_185854 ?auto_185857 ) ) ( ON ?auto_185857 ?auto_185855 ) ( not ( = ?auto_185849 ?auto_185855 ) ) ( not ( = ?auto_185850 ?auto_185855 ) ) ( not ( = ?auto_185851 ?auto_185855 ) ) ( not ( = ?auto_185852 ?auto_185855 ) ) ( not ( = ?auto_185853 ?auto_185855 ) ) ( not ( = ?auto_185854 ?auto_185855 ) ) ( not ( = ?auto_185856 ?auto_185855 ) ) ( not ( = ?auto_185857 ?auto_185855 ) ) ( ON ?auto_185856 ?auto_185857 ) ( ON-TABLE ?auto_185855 ) ( ON ?auto_185854 ?auto_185856 ) ( ON ?auto_185853 ?auto_185854 ) ( ON ?auto_185852 ?auto_185853 ) ( ON ?auto_185851 ?auto_185852 ) ( CLEAR ?auto_185849 ) ( ON ?auto_185850 ?auto_185851 ) ( CLEAR ?auto_185850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185855 ?auto_185857 ?auto_185856 ?auto_185854 ?auto_185853 ?auto_185852 ?auto_185851 )
      ( MAKE-4PILE ?auto_185849 ?auto_185850 ?auto_185851 ?auto_185852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185858 - BLOCK
      ?auto_185859 - BLOCK
      ?auto_185860 - BLOCK
      ?auto_185861 - BLOCK
    )
    :vars
    (
      ?auto_185863 - BLOCK
      ?auto_185866 - BLOCK
      ?auto_185864 - BLOCK
      ?auto_185862 - BLOCK
      ?auto_185865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185858 ?auto_185859 ) ) ( not ( = ?auto_185858 ?auto_185860 ) ) ( not ( = ?auto_185858 ?auto_185861 ) ) ( not ( = ?auto_185858 ?auto_185863 ) ) ( not ( = ?auto_185859 ?auto_185860 ) ) ( not ( = ?auto_185859 ?auto_185861 ) ) ( not ( = ?auto_185859 ?auto_185863 ) ) ( not ( = ?auto_185860 ?auto_185861 ) ) ( not ( = ?auto_185860 ?auto_185863 ) ) ( not ( = ?auto_185861 ?auto_185863 ) ) ( not ( = ?auto_185858 ?auto_185866 ) ) ( not ( = ?auto_185858 ?auto_185864 ) ) ( not ( = ?auto_185859 ?auto_185866 ) ) ( not ( = ?auto_185859 ?auto_185864 ) ) ( not ( = ?auto_185860 ?auto_185866 ) ) ( not ( = ?auto_185860 ?auto_185864 ) ) ( not ( = ?auto_185861 ?auto_185866 ) ) ( not ( = ?auto_185861 ?auto_185864 ) ) ( not ( = ?auto_185863 ?auto_185866 ) ) ( not ( = ?auto_185863 ?auto_185864 ) ) ( not ( = ?auto_185866 ?auto_185864 ) ) ( not ( = ?auto_185862 ?auto_185864 ) ) ( not ( = ?auto_185858 ?auto_185862 ) ) ( not ( = ?auto_185859 ?auto_185862 ) ) ( not ( = ?auto_185860 ?auto_185862 ) ) ( not ( = ?auto_185861 ?auto_185862 ) ) ( not ( = ?auto_185863 ?auto_185862 ) ) ( not ( = ?auto_185866 ?auto_185862 ) ) ( ON ?auto_185862 ?auto_185865 ) ( not ( = ?auto_185858 ?auto_185865 ) ) ( not ( = ?auto_185859 ?auto_185865 ) ) ( not ( = ?auto_185860 ?auto_185865 ) ) ( not ( = ?auto_185861 ?auto_185865 ) ) ( not ( = ?auto_185863 ?auto_185865 ) ) ( not ( = ?auto_185866 ?auto_185865 ) ) ( not ( = ?auto_185864 ?auto_185865 ) ) ( not ( = ?auto_185862 ?auto_185865 ) ) ( ON ?auto_185864 ?auto_185862 ) ( ON-TABLE ?auto_185865 ) ( ON ?auto_185866 ?auto_185864 ) ( ON ?auto_185863 ?auto_185866 ) ( ON ?auto_185861 ?auto_185863 ) ( ON ?auto_185860 ?auto_185861 ) ( ON ?auto_185859 ?auto_185860 ) ( CLEAR ?auto_185859 ) ( HOLDING ?auto_185858 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185858 )
      ( MAKE-4PILE ?auto_185858 ?auto_185859 ?auto_185860 ?auto_185861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185867 - BLOCK
      ?auto_185868 - BLOCK
      ?auto_185869 - BLOCK
      ?auto_185870 - BLOCK
    )
    :vars
    (
      ?auto_185871 - BLOCK
      ?auto_185875 - BLOCK
      ?auto_185872 - BLOCK
      ?auto_185873 - BLOCK
      ?auto_185874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185867 ?auto_185868 ) ) ( not ( = ?auto_185867 ?auto_185869 ) ) ( not ( = ?auto_185867 ?auto_185870 ) ) ( not ( = ?auto_185867 ?auto_185871 ) ) ( not ( = ?auto_185868 ?auto_185869 ) ) ( not ( = ?auto_185868 ?auto_185870 ) ) ( not ( = ?auto_185868 ?auto_185871 ) ) ( not ( = ?auto_185869 ?auto_185870 ) ) ( not ( = ?auto_185869 ?auto_185871 ) ) ( not ( = ?auto_185870 ?auto_185871 ) ) ( not ( = ?auto_185867 ?auto_185875 ) ) ( not ( = ?auto_185867 ?auto_185872 ) ) ( not ( = ?auto_185868 ?auto_185875 ) ) ( not ( = ?auto_185868 ?auto_185872 ) ) ( not ( = ?auto_185869 ?auto_185875 ) ) ( not ( = ?auto_185869 ?auto_185872 ) ) ( not ( = ?auto_185870 ?auto_185875 ) ) ( not ( = ?auto_185870 ?auto_185872 ) ) ( not ( = ?auto_185871 ?auto_185875 ) ) ( not ( = ?auto_185871 ?auto_185872 ) ) ( not ( = ?auto_185875 ?auto_185872 ) ) ( not ( = ?auto_185873 ?auto_185872 ) ) ( not ( = ?auto_185867 ?auto_185873 ) ) ( not ( = ?auto_185868 ?auto_185873 ) ) ( not ( = ?auto_185869 ?auto_185873 ) ) ( not ( = ?auto_185870 ?auto_185873 ) ) ( not ( = ?auto_185871 ?auto_185873 ) ) ( not ( = ?auto_185875 ?auto_185873 ) ) ( ON ?auto_185873 ?auto_185874 ) ( not ( = ?auto_185867 ?auto_185874 ) ) ( not ( = ?auto_185868 ?auto_185874 ) ) ( not ( = ?auto_185869 ?auto_185874 ) ) ( not ( = ?auto_185870 ?auto_185874 ) ) ( not ( = ?auto_185871 ?auto_185874 ) ) ( not ( = ?auto_185875 ?auto_185874 ) ) ( not ( = ?auto_185872 ?auto_185874 ) ) ( not ( = ?auto_185873 ?auto_185874 ) ) ( ON ?auto_185872 ?auto_185873 ) ( ON-TABLE ?auto_185874 ) ( ON ?auto_185875 ?auto_185872 ) ( ON ?auto_185871 ?auto_185875 ) ( ON ?auto_185870 ?auto_185871 ) ( ON ?auto_185869 ?auto_185870 ) ( ON ?auto_185868 ?auto_185869 ) ( ON ?auto_185867 ?auto_185868 ) ( CLEAR ?auto_185867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185874 ?auto_185873 ?auto_185872 ?auto_185875 ?auto_185871 ?auto_185870 ?auto_185869 ?auto_185868 )
      ( MAKE-4PILE ?auto_185867 ?auto_185868 ?auto_185869 ?auto_185870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185880 - BLOCK
      ?auto_185881 - BLOCK
      ?auto_185882 - BLOCK
      ?auto_185883 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_185883 ) ( CLEAR ?auto_185882 ) ( ON-TABLE ?auto_185880 ) ( ON ?auto_185881 ?auto_185880 ) ( ON ?auto_185882 ?auto_185881 ) ( not ( = ?auto_185880 ?auto_185881 ) ) ( not ( = ?auto_185880 ?auto_185882 ) ) ( not ( = ?auto_185880 ?auto_185883 ) ) ( not ( = ?auto_185881 ?auto_185882 ) ) ( not ( = ?auto_185881 ?auto_185883 ) ) ( not ( = ?auto_185882 ?auto_185883 ) ) )
    :subtasks
    ( ( !STACK ?auto_185883 ?auto_185882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185884 - BLOCK
      ?auto_185885 - BLOCK
      ?auto_185886 - BLOCK
      ?auto_185887 - BLOCK
    )
    :vars
    (
      ?auto_185888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_185886 ) ( ON-TABLE ?auto_185884 ) ( ON ?auto_185885 ?auto_185884 ) ( ON ?auto_185886 ?auto_185885 ) ( not ( = ?auto_185884 ?auto_185885 ) ) ( not ( = ?auto_185884 ?auto_185886 ) ) ( not ( = ?auto_185884 ?auto_185887 ) ) ( not ( = ?auto_185885 ?auto_185886 ) ) ( not ( = ?auto_185885 ?auto_185887 ) ) ( not ( = ?auto_185886 ?auto_185887 ) ) ( ON ?auto_185887 ?auto_185888 ) ( CLEAR ?auto_185887 ) ( HAND-EMPTY ) ( not ( = ?auto_185884 ?auto_185888 ) ) ( not ( = ?auto_185885 ?auto_185888 ) ) ( not ( = ?auto_185886 ?auto_185888 ) ) ( not ( = ?auto_185887 ?auto_185888 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185887 ?auto_185888 )
      ( MAKE-4PILE ?auto_185884 ?auto_185885 ?auto_185886 ?auto_185887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185889 - BLOCK
      ?auto_185890 - BLOCK
      ?auto_185891 - BLOCK
      ?auto_185892 - BLOCK
    )
    :vars
    (
      ?auto_185893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185889 ) ( ON ?auto_185890 ?auto_185889 ) ( not ( = ?auto_185889 ?auto_185890 ) ) ( not ( = ?auto_185889 ?auto_185891 ) ) ( not ( = ?auto_185889 ?auto_185892 ) ) ( not ( = ?auto_185890 ?auto_185891 ) ) ( not ( = ?auto_185890 ?auto_185892 ) ) ( not ( = ?auto_185891 ?auto_185892 ) ) ( ON ?auto_185892 ?auto_185893 ) ( CLEAR ?auto_185892 ) ( not ( = ?auto_185889 ?auto_185893 ) ) ( not ( = ?auto_185890 ?auto_185893 ) ) ( not ( = ?auto_185891 ?auto_185893 ) ) ( not ( = ?auto_185892 ?auto_185893 ) ) ( HOLDING ?auto_185891 ) ( CLEAR ?auto_185890 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185889 ?auto_185890 ?auto_185891 )
      ( MAKE-4PILE ?auto_185889 ?auto_185890 ?auto_185891 ?auto_185892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185894 - BLOCK
      ?auto_185895 - BLOCK
      ?auto_185896 - BLOCK
      ?auto_185897 - BLOCK
    )
    :vars
    (
      ?auto_185898 - BLOCK
      ?auto_185901 - BLOCK
      ?auto_185900 - BLOCK
      ?auto_185899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185894 ) ( ON ?auto_185895 ?auto_185894 ) ( not ( = ?auto_185894 ?auto_185895 ) ) ( not ( = ?auto_185894 ?auto_185896 ) ) ( not ( = ?auto_185894 ?auto_185897 ) ) ( not ( = ?auto_185895 ?auto_185896 ) ) ( not ( = ?auto_185895 ?auto_185897 ) ) ( not ( = ?auto_185896 ?auto_185897 ) ) ( ON ?auto_185897 ?auto_185898 ) ( not ( = ?auto_185894 ?auto_185898 ) ) ( not ( = ?auto_185895 ?auto_185898 ) ) ( not ( = ?auto_185896 ?auto_185898 ) ) ( not ( = ?auto_185897 ?auto_185898 ) ) ( CLEAR ?auto_185895 ) ( ON ?auto_185896 ?auto_185897 ) ( CLEAR ?auto_185896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185901 ) ( ON ?auto_185900 ?auto_185901 ) ( ON ?auto_185899 ?auto_185900 ) ( ON ?auto_185898 ?auto_185899 ) ( not ( = ?auto_185901 ?auto_185900 ) ) ( not ( = ?auto_185901 ?auto_185899 ) ) ( not ( = ?auto_185901 ?auto_185898 ) ) ( not ( = ?auto_185901 ?auto_185897 ) ) ( not ( = ?auto_185901 ?auto_185896 ) ) ( not ( = ?auto_185900 ?auto_185899 ) ) ( not ( = ?auto_185900 ?auto_185898 ) ) ( not ( = ?auto_185900 ?auto_185897 ) ) ( not ( = ?auto_185900 ?auto_185896 ) ) ( not ( = ?auto_185899 ?auto_185898 ) ) ( not ( = ?auto_185899 ?auto_185897 ) ) ( not ( = ?auto_185899 ?auto_185896 ) ) ( not ( = ?auto_185894 ?auto_185901 ) ) ( not ( = ?auto_185894 ?auto_185900 ) ) ( not ( = ?auto_185894 ?auto_185899 ) ) ( not ( = ?auto_185895 ?auto_185901 ) ) ( not ( = ?auto_185895 ?auto_185900 ) ) ( not ( = ?auto_185895 ?auto_185899 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185901 ?auto_185900 ?auto_185899 ?auto_185898 ?auto_185897 )
      ( MAKE-4PILE ?auto_185894 ?auto_185895 ?auto_185896 ?auto_185897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185902 - BLOCK
      ?auto_185903 - BLOCK
      ?auto_185904 - BLOCK
      ?auto_185905 - BLOCK
    )
    :vars
    (
      ?auto_185908 - BLOCK
      ?auto_185909 - BLOCK
      ?auto_185906 - BLOCK
      ?auto_185907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185902 ) ( not ( = ?auto_185902 ?auto_185903 ) ) ( not ( = ?auto_185902 ?auto_185904 ) ) ( not ( = ?auto_185902 ?auto_185905 ) ) ( not ( = ?auto_185903 ?auto_185904 ) ) ( not ( = ?auto_185903 ?auto_185905 ) ) ( not ( = ?auto_185904 ?auto_185905 ) ) ( ON ?auto_185905 ?auto_185908 ) ( not ( = ?auto_185902 ?auto_185908 ) ) ( not ( = ?auto_185903 ?auto_185908 ) ) ( not ( = ?auto_185904 ?auto_185908 ) ) ( not ( = ?auto_185905 ?auto_185908 ) ) ( ON ?auto_185904 ?auto_185905 ) ( CLEAR ?auto_185904 ) ( ON-TABLE ?auto_185909 ) ( ON ?auto_185906 ?auto_185909 ) ( ON ?auto_185907 ?auto_185906 ) ( ON ?auto_185908 ?auto_185907 ) ( not ( = ?auto_185909 ?auto_185906 ) ) ( not ( = ?auto_185909 ?auto_185907 ) ) ( not ( = ?auto_185909 ?auto_185908 ) ) ( not ( = ?auto_185909 ?auto_185905 ) ) ( not ( = ?auto_185909 ?auto_185904 ) ) ( not ( = ?auto_185906 ?auto_185907 ) ) ( not ( = ?auto_185906 ?auto_185908 ) ) ( not ( = ?auto_185906 ?auto_185905 ) ) ( not ( = ?auto_185906 ?auto_185904 ) ) ( not ( = ?auto_185907 ?auto_185908 ) ) ( not ( = ?auto_185907 ?auto_185905 ) ) ( not ( = ?auto_185907 ?auto_185904 ) ) ( not ( = ?auto_185902 ?auto_185909 ) ) ( not ( = ?auto_185902 ?auto_185906 ) ) ( not ( = ?auto_185902 ?auto_185907 ) ) ( not ( = ?auto_185903 ?auto_185909 ) ) ( not ( = ?auto_185903 ?auto_185906 ) ) ( not ( = ?auto_185903 ?auto_185907 ) ) ( HOLDING ?auto_185903 ) ( CLEAR ?auto_185902 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185902 ?auto_185903 )
      ( MAKE-4PILE ?auto_185902 ?auto_185903 ?auto_185904 ?auto_185905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185910 - BLOCK
      ?auto_185911 - BLOCK
      ?auto_185912 - BLOCK
      ?auto_185913 - BLOCK
    )
    :vars
    (
      ?auto_185917 - BLOCK
      ?auto_185915 - BLOCK
      ?auto_185914 - BLOCK
      ?auto_185916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185910 ) ( not ( = ?auto_185910 ?auto_185911 ) ) ( not ( = ?auto_185910 ?auto_185912 ) ) ( not ( = ?auto_185910 ?auto_185913 ) ) ( not ( = ?auto_185911 ?auto_185912 ) ) ( not ( = ?auto_185911 ?auto_185913 ) ) ( not ( = ?auto_185912 ?auto_185913 ) ) ( ON ?auto_185913 ?auto_185917 ) ( not ( = ?auto_185910 ?auto_185917 ) ) ( not ( = ?auto_185911 ?auto_185917 ) ) ( not ( = ?auto_185912 ?auto_185917 ) ) ( not ( = ?auto_185913 ?auto_185917 ) ) ( ON ?auto_185912 ?auto_185913 ) ( ON-TABLE ?auto_185915 ) ( ON ?auto_185914 ?auto_185915 ) ( ON ?auto_185916 ?auto_185914 ) ( ON ?auto_185917 ?auto_185916 ) ( not ( = ?auto_185915 ?auto_185914 ) ) ( not ( = ?auto_185915 ?auto_185916 ) ) ( not ( = ?auto_185915 ?auto_185917 ) ) ( not ( = ?auto_185915 ?auto_185913 ) ) ( not ( = ?auto_185915 ?auto_185912 ) ) ( not ( = ?auto_185914 ?auto_185916 ) ) ( not ( = ?auto_185914 ?auto_185917 ) ) ( not ( = ?auto_185914 ?auto_185913 ) ) ( not ( = ?auto_185914 ?auto_185912 ) ) ( not ( = ?auto_185916 ?auto_185917 ) ) ( not ( = ?auto_185916 ?auto_185913 ) ) ( not ( = ?auto_185916 ?auto_185912 ) ) ( not ( = ?auto_185910 ?auto_185915 ) ) ( not ( = ?auto_185910 ?auto_185914 ) ) ( not ( = ?auto_185910 ?auto_185916 ) ) ( not ( = ?auto_185911 ?auto_185915 ) ) ( not ( = ?auto_185911 ?auto_185914 ) ) ( not ( = ?auto_185911 ?auto_185916 ) ) ( CLEAR ?auto_185910 ) ( ON ?auto_185911 ?auto_185912 ) ( CLEAR ?auto_185911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185915 ?auto_185914 ?auto_185916 ?auto_185917 ?auto_185913 ?auto_185912 )
      ( MAKE-4PILE ?auto_185910 ?auto_185911 ?auto_185912 ?auto_185913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185918 - BLOCK
      ?auto_185919 - BLOCK
      ?auto_185920 - BLOCK
      ?auto_185921 - BLOCK
    )
    :vars
    (
      ?auto_185922 - BLOCK
      ?auto_185923 - BLOCK
      ?auto_185924 - BLOCK
      ?auto_185925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185918 ?auto_185919 ) ) ( not ( = ?auto_185918 ?auto_185920 ) ) ( not ( = ?auto_185918 ?auto_185921 ) ) ( not ( = ?auto_185919 ?auto_185920 ) ) ( not ( = ?auto_185919 ?auto_185921 ) ) ( not ( = ?auto_185920 ?auto_185921 ) ) ( ON ?auto_185921 ?auto_185922 ) ( not ( = ?auto_185918 ?auto_185922 ) ) ( not ( = ?auto_185919 ?auto_185922 ) ) ( not ( = ?auto_185920 ?auto_185922 ) ) ( not ( = ?auto_185921 ?auto_185922 ) ) ( ON ?auto_185920 ?auto_185921 ) ( ON-TABLE ?auto_185923 ) ( ON ?auto_185924 ?auto_185923 ) ( ON ?auto_185925 ?auto_185924 ) ( ON ?auto_185922 ?auto_185925 ) ( not ( = ?auto_185923 ?auto_185924 ) ) ( not ( = ?auto_185923 ?auto_185925 ) ) ( not ( = ?auto_185923 ?auto_185922 ) ) ( not ( = ?auto_185923 ?auto_185921 ) ) ( not ( = ?auto_185923 ?auto_185920 ) ) ( not ( = ?auto_185924 ?auto_185925 ) ) ( not ( = ?auto_185924 ?auto_185922 ) ) ( not ( = ?auto_185924 ?auto_185921 ) ) ( not ( = ?auto_185924 ?auto_185920 ) ) ( not ( = ?auto_185925 ?auto_185922 ) ) ( not ( = ?auto_185925 ?auto_185921 ) ) ( not ( = ?auto_185925 ?auto_185920 ) ) ( not ( = ?auto_185918 ?auto_185923 ) ) ( not ( = ?auto_185918 ?auto_185924 ) ) ( not ( = ?auto_185918 ?auto_185925 ) ) ( not ( = ?auto_185919 ?auto_185923 ) ) ( not ( = ?auto_185919 ?auto_185924 ) ) ( not ( = ?auto_185919 ?auto_185925 ) ) ( ON ?auto_185919 ?auto_185920 ) ( CLEAR ?auto_185919 ) ( HOLDING ?auto_185918 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185918 )
      ( MAKE-4PILE ?auto_185918 ?auto_185919 ?auto_185920 ?auto_185921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185926 - BLOCK
      ?auto_185927 - BLOCK
      ?auto_185928 - BLOCK
      ?auto_185929 - BLOCK
    )
    :vars
    (
      ?auto_185931 - BLOCK
      ?auto_185933 - BLOCK
      ?auto_185930 - BLOCK
      ?auto_185932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185926 ?auto_185927 ) ) ( not ( = ?auto_185926 ?auto_185928 ) ) ( not ( = ?auto_185926 ?auto_185929 ) ) ( not ( = ?auto_185927 ?auto_185928 ) ) ( not ( = ?auto_185927 ?auto_185929 ) ) ( not ( = ?auto_185928 ?auto_185929 ) ) ( ON ?auto_185929 ?auto_185931 ) ( not ( = ?auto_185926 ?auto_185931 ) ) ( not ( = ?auto_185927 ?auto_185931 ) ) ( not ( = ?auto_185928 ?auto_185931 ) ) ( not ( = ?auto_185929 ?auto_185931 ) ) ( ON ?auto_185928 ?auto_185929 ) ( ON-TABLE ?auto_185933 ) ( ON ?auto_185930 ?auto_185933 ) ( ON ?auto_185932 ?auto_185930 ) ( ON ?auto_185931 ?auto_185932 ) ( not ( = ?auto_185933 ?auto_185930 ) ) ( not ( = ?auto_185933 ?auto_185932 ) ) ( not ( = ?auto_185933 ?auto_185931 ) ) ( not ( = ?auto_185933 ?auto_185929 ) ) ( not ( = ?auto_185933 ?auto_185928 ) ) ( not ( = ?auto_185930 ?auto_185932 ) ) ( not ( = ?auto_185930 ?auto_185931 ) ) ( not ( = ?auto_185930 ?auto_185929 ) ) ( not ( = ?auto_185930 ?auto_185928 ) ) ( not ( = ?auto_185932 ?auto_185931 ) ) ( not ( = ?auto_185932 ?auto_185929 ) ) ( not ( = ?auto_185932 ?auto_185928 ) ) ( not ( = ?auto_185926 ?auto_185933 ) ) ( not ( = ?auto_185926 ?auto_185930 ) ) ( not ( = ?auto_185926 ?auto_185932 ) ) ( not ( = ?auto_185927 ?auto_185933 ) ) ( not ( = ?auto_185927 ?auto_185930 ) ) ( not ( = ?auto_185927 ?auto_185932 ) ) ( ON ?auto_185927 ?auto_185928 ) ( ON ?auto_185926 ?auto_185927 ) ( CLEAR ?auto_185926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185933 ?auto_185930 ?auto_185932 ?auto_185931 ?auto_185929 ?auto_185928 ?auto_185927 )
      ( MAKE-4PILE ?auto_185926 ?auto_185927 ?auto_185928 ?auto_185929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185934 - BLOCK
      ?auto_185935 - BLOCK
      ?auto_185936 - BLOCK
      ?auto_185937 - BLOCK
    )
    :vars
    (
      ?auto_185938 - BLOCK
      ?auto_185941 - BLOCK
      ?auto_185940 - BLOCK
      ?auto_185939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185934 ?auto_185935 ) ) ( not ( = ?auto_185934 ?auto_185936 ) ) ( not ( = ?auto_185934 ?auto_185937 ) ) ( not ( = ?auto_185935 ?auto_185936 ) ) ( not ( = ?auto_185935 ?auto_185937 ) ) ( not ( = ?auto_185936 ?auto_185937 ) ) ( ON ?auto_185937 ?auto_185938 ) ( not ( = ?auto_185934 ?auto_185938 ) ) ( not ( = ?auto_185935 ?auto_185938 ) ) ( not ( = ?auto_185936 ?auto_185938 ) ) ( not ( = ?auto_185937 ?auto_185938 ) ) ( ON ?auto_185936 ?auto_185937 ) ( ON-TABLE ?auto_185941 ) ( ON ?auto_185940 ?auto_185941 ) ( ON ?auto_185939 ?auto_185940 ) ( ON ?auto_185938 ?auto_185939 ) ( not ( = ?auto_185941 ?auto_185940 ) ) ( not ( = ?auto_185941 ?auto_185939 ) ) ( not ( = ?auto_185941 ?auto_185938 ) ) ( not ( = ?auto_185941 ?auto_185937 ) ) ( not ( = ?auto_185941 ?auto_185936 ) ) ( not ( = ?auto_185940 ?auto_185939 ) ) ( not ( = ?auto_185940 ?auto_185938 ) ) ( not ( = ?auto_185940 ?auto_185937 ) ) ( not ( = ?auto_185940 ?auto_185936 ) ) ( not ( = ?auto_185939 ?auto_185938 ) ) ( not ( = ?auto_185939 ?auto_185937 ) ) ( not ( = ?auto_185939 ?auto_185936 ) ) ( not ( = ?auto_185934 ?auto_185941 ) ) ( not ( = ?auto_185934 ?auto_185940 ) ) ( not ( = ?auto_185934 ?auto_185939 ) ) ( not ( = ?auto_185935 ?auto_185941 ) ) ( not ( = ?auto_185935 ?auto_185940 ) ) ( not ( = ?auto_185935 ?auto_185939 ) ) ( ON ?auto_185935 ?auto_185936 ) ( HOLDING ?auto_185934 ) ( CLEAR ?auto_185935 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185941 ?auto_185940 ?auto_185939 ?auto_185938 ?auto_185937 ?auto_185936 ?auto_185935 ?auto_185934 )
      ( MAKE-4PILE ?auto_185934 ?auto_185935 ?auto_185936 ?auto_185937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185942 - BLOCK
      ?auto_185943 - BLOCK
      ?auto_185944 - BLOCK
      ?auto_185945 - BLOCK
    )
    :vars
    (
      ?auto_185946 - BLOCK
      ?auto_185948 - BLOCK
      ?auto_185947 - BLOCK
      ?auto_185949 - BLOCK
      ?auto_185950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185942 ?auto_185943 ) ) ( not ( = ?auto_185942 ?auto_185944 ) ) ( not ( = ?auto_185942 ?auto_185945 ) ) ( not ( = ?auto_185943 ?auto_185944 ) ) ( not ( = ?auto_185943 ?auto_185945 ) ) ( not ( = ?auto_185944 ?auto_185945 ) ) ( ON ?auto_185945 ?auto_185946 ) ( not ( = ?auto_185942 ?auto_185946 ) ) ( not ( = ?auto_185943 ?auto_185946 ) ) ( not ( = ?auto_185944 ?auto_185946 ) ) ( not ( = ?auto_185945 ?auto_185946 ) ) ( ON ?auto_185944 ?auto_185945 ) ( ON-TABLE ?auto_185948 ) ( ON ?auto_185947 ?auto_185948 ) ( ON ?auto_185949 ?auto_185947 ) ( ON ?auto_185946 ?auto_185949 ) ( not ( = ?auto_185948 ?auto_185947 ) ) ( not ( = ?auto_185948 ?auto_185949 ) ) ( not ( = ?auto_185948 ?auto_185946 ) ) ( not ( = ?auto_185948 ?auto_185945 ) ) ( not ( = ?auto_185948 ?auto_185944 ) ) ( not ( = ?auto_185947 ?auto_185949 ) ) ( not ( = ?auto_185947 ?auto_185946 ) ) ( not ( = ?auto_185947 ?auto_185945 ) ) ( not ( = ?auto_185947 ?auto_185944 ) ) ( not ( = ?auto_185949 ?auto_185946 ) ) ( not ( = ?auto_185949 ?auto_185945 ) ) ( not ( = ?auto_185949 ?auto_185944 ) ) ( not ( = ?auto_185942 ?auto_185948 ) ) ( not ( = ?auto_185942 ?auto_185947 ) ) ( not ( = ?auto_185942 ?auto_185949 ) ) ( not ( = ?auto_185943 ?auto_185948 ) ) ( not ( = ?auto_185943 ?auto_185947 ) ) ( not ( = ?auto_185943 ?auto_185949 ) ) ( ON ?auto_185943 ?auto_185944 ) ( CLEAR ?auto_185943 ) ( ON ?auto_185942 ?auto_185950 ) ( CLEAR ?auto_185942 ) ( HAND-EMPTY ) ( not ( = ?auto_185942 ?auto_185950 ) ) ( not ( = ?auto_185943 ?auto_185950 ) ) ( not ( = ?auto_185944 ?auto_185950 ) ) ( not ( = ?auto_185945 ?auto_185950 ) ) ( not ( = ?auto_185946 ?auto_185950 ) ) ( not ( = ?auto_185948 ?auto_185950 ) ) ( not ( = ?auto_185947 ?auto_185950 ) ) ( not ( = ?auto_185949 ?auto_185950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185942 ?auto_185950 )
      ( MAKE-4PILE ?auto_185942 ?auto_185943 ?auto_185944 ?auto_185945 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185951 - BLOCK
      ?auto_185952 - BLOCK
      ?auto_185953 - BLOCK
      ?auto_185954 - BLOCK
    )
    :vars
    (
      ?auto_185957 - BLOCK
      ?auto_185959 - BLOCK
      ?auto_185958 - BLOCK
      ?auto_185955 - BLOCK
      ?auto_185956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185951 ?auto_185952 ) ) ( not ( = ?auto_185951 ?auto_185953 ) ) ( not ( = ?auto_185951 ?auto_185954 ) ) ( not ( = ?auto_185952 ?auto_185953 ) ) ( not ( = ?auto_185952 ?auto_185954 ) ) ( not ( = ?auto_185953 ?auto_185954 ) ) ( ON ?auto_185954 ?auto_185957 ) ( not ( = ?auto_185951 ?auto_185957 ) ) ( not ( = ?auto_185952 ?auto_185957 ) ) ( not ( = ?auto_185953 ?auto_185957 ) ) ( not ( = ?auto_185954 ?auto_185957 ) ) ( ON ?auto_185953 ?auto_185954 ) ( ON-TABLE ?auto_185959 ) ( ON ?auto_185958 ?auto_185959 ) ( ON ?auto_185955 ?auto_185958 ) ( ON ?auto_185957 ?auto_185955 ) ( not ( = ?auto_185959 ?auto_185958 ) ) ( not ( = ?auto_185959 ?auto_185955 ) ) ( not ( = ?auto_185959 ?auto_185957 ) ) ( not ( = ?auto_185959 ?auto_185954 ) ) ( not ( = ?auto_185959 ?auto_185953 ) ) ( not ( = ?auto_185958 ?auto_185955 ) ) ( not ( = ?auto_185958 ?auto_185957 ) ) ( not ( = ?auto_185958 ?auto_185954 ) ) ( not ( = ?auto_185958 ?auto_185953 ) ) ( not ( = ?auto_185955 ?auto_185957 ) ) ( not ( = ?auto_185955 ?auto_185954 ) ) ( not ( = ?auto_185955 ?auto_185953 ) ) ( not ( = ?auto_185951 ?auto_185959 ) ) ( not ( = ?auto_185951 ?auto_185958 ) ) ( not ( = ?auto_185951 ?auto_185955 ) ) ( not ( = ?auto_185952 ?auto_185959 ) ) ( not ( = ?auto_185952 ?auto_185958 ) ) ( not ( = ?auto_185952 ?auto_185955 ) ) ( ON ?auto_185951 ?auto_185956 ) ( CLEAR ?auto_185951 ) ( not ( = ?auto_185951 ?auto_185956 ) ) ( not ( = ?auto_185952 ?auto_185956 ) ) ( not ( = ?auto_185953 ?auto_185956 ) ) ( not ( = ?auto_185954 ?auto_185956 ) ) ( not ( = ?auto_185957 ?auto_185956 ) ) ( not ( = ?auto_185959 ?auto_185956 ) ) ( not ( = ?auto_185958 ?auto_185956 ) ) ( not ( = ?auto_185955 ?auto_185956 ) ) ( HOLDING ?auto_185952 ) ( CLEAR ?auto_185953 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185959 ?auto_185958 ?auto_185955 ?auto_185957 ?auto_185954 ?auto_185953 ?auto_185952 )
      ( MAKE-4PILE ?auto_185951 ?auto_185952 ?auto_185953 ?auto_185954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185960 - BLOCK
      ?auto_185961 - BLOCK
      ?auto_185962 - BLOCK
      ?auto_185963 - BLOCK
    )
    :vars
    (
      ?auto_185966 - BLOCK
      ?auto_185967 - BLOCK
      ?auto_185968 - BLOCK
      ?auto_185965 - BLOCK
      ?auto_185964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185960 ?auto_185961 ) ) ( not ( = ?auto_185960 ?auto_185962 ) ) ( not ( = ?auto_185960 ?auto_185963 ) ) ( not ( = ?auto_185961 ?auto_185962 ) ) ( not ( = ?auto_185961 ?auto_185963 ) ) ( not ( = ?auto_185962 ?auto_185963 ) ) ( ON ?auto_185963 ?auto_185966 ) ( not ( = ?auto_185960 ?auto_185966 ) ) ( not ( = ?auto_185961 ?auto_185966 ) ) ( not ( = ?auto_185962 ?auto_185966 ) ) ( not ( = ?auto_185963 ?auto_185966 ) ) ( ON ?auto_185962 ?auto_185963 ) ( ON-TABLE ?auto_185967 ) ( ON ?auto_185968 ?auto_185967 ) ( ON ?auto_185965 ?auto_185968 ) ( ON ?auto_185966 ?auto_185965 ) ( not ( = ?auto_185967 ?auto_185968 ) ) ( not ( = ?auto_185967 ?auto_185965 ) ) ( not ( = ?auto_185967 ?auto_185966 ) ) ( not ( = ?auto_185967 ?auto_185963 ) ) ( not ( = ?auto_185967 ?auto_185962 ) ) ( not ( = ?auto_185968 ?auto_185965 ) ) ( not ( = ?auto_185968 ?auto_185966 ) ) ( not ( = ?auto_185968 ?auto_185963 ) ) ( not ( = ?auto_185968 ?auto_185962 ) ) ( not ( = ?auto_185965 ?auto_185966 ) ) ( not ( = ?auto_185965 ?auto_185963 ) ) ( not ( = ?auto_185965 ?auto_185962 ) ) ( not ( = ?auto_185960 ?auto_185967 ) ) ( not ( = ?auto_185960 ?auto_185968 ) ) ( not ( = ?auto_185960 ?auto_185965 ) ) ( not ( = ?auto_185961 ?auto_185967 ) ) ( not ( = ?auto_185961 ?auto_185968 ) ) ( not ( = ?auto_185961 ?auto_185965 ) ) ( ON ?auto_185960 ?auto_185964 ) ( not ( = ?auto_185960 ?auto_185964 ) ) ( not ( = ?auto_185961 ?auto_185964 ) ) ( not ( = ?auto_185962 ?auto_185964 ) ) ( not ( = ?auto_185963 ?auto_185964 ) ) ( not ( = ?auto_185966 ?auto_185964 ) ) ( not ( = ?auto_185967 ?auto_185964 ) ) ( not ( = ?auto_185968 ?auto_185964 ) ) ( not ( = ?auto_185965 ?auto_185964 ) ) ( CLEAR ?auto_185962 ) ( ON ?auto_185961 ?auto_185960 ) ( CLEAR ?auto_185961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185964 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185964 ?auto_185960 )
      ( MAKE-4PILE ?auto_185960 ?auto_185961 ?auto_185962 ?auto_185963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185969 - BLOCK
      ?auto_185970 - BLOCK
      ?auto_185971 - BLOCK
      ?auto_185972 - BLOCK
    )
    :vars
    (
      ?auto_185975 - BLOCK
      ?auto_185977 - BLOCK
      ?auto_185973 - BLOCK
      ?auto_185974 - BLOCK
      ?auto_185976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185969 ?auto_185970 ) ) ( not ( = ?auto_185969 ?auto_185971 ) ) ( not ( = ?auto_185969 ?auto_185972 ) ) ( not ( = ?auto_185970 ?auto_185971 ) ) ( not ( = ?auto_185970 ?auto_185972 ) ) ( not ( = ?auto_185971 ?auto_185972 ) ) ( ON ?auto_185972 ?auto_185975 ) ( not ( = ?auto_185969 ?auto_185975 ) ) ( not ( = ?auto_185970 ?auto_185975 ) ) ( not ( = ?auto_185971 ?auto_185975 ) ) ( not ( = ?auto_185972 ?auto_185975 ) ) ( ON-TABLE ?auto_185977 ) ( ON ?auto_185973 ?auto_185977 ) ( ON ?auto_185974 ?auto_185973 ) ( ON ?auto_185975 ?auto_185974 ) ( not ( = ?auto_185977 ?auto_185973 ) ) ( not ( = ?auto_185977 ?auto_185974 ) ) ( not ( = ?auto_185977 ?auto_185975 ) ) ( not ( = ?auto_185977 ?auto_185972 ) ) ( not ( = ?auto_185977 ?auto_185971 ) ) ( not ( = ?auto_185973 ?auto_185974 ) ) ( not ( = ?auto_185973 ?auto_185975 ) ) ( not ( = ?auto_185973 ?auto_185972 ) ) ( not ( = ?auto_185973 ?auto_185971 ) ) ( not ( = ?auto_185974 ?auto_185975 ) ) ( not ( = ?auto_185974 ?auto_185972 ) ) ( not ( = ?auto_185974 ?auto_185971 ) ) ( not ( = ?auto_185969 ?auto_185977 ) ) ( not ( = ?auto_185969 ?auto_185973 ) ) ( not ( = ?auto_185969 ?auto_185974 ) ) ( not ( = ?auto_185970 ?auto_185977 ) ) ( not ( = ?auto_185970 ?auto_185973 ) ) ( not ( = ?auto_185970 ?auto_185974 ) ) ( ON ?auto_185969 ?auto_185976 ) ( not ( = ?auto_185969 ?auto_185976 ) ) ( not ( = ?auto_185970 ?auto_185976 ) ) ( not ( = ?auto_185971 ?auto_185976 ) ) ( not ( = ?auto_185972 ?auto_185976 ) ) ( not ( = ?auto_185975 ?auto_185976 ) ) ( not ( = ?auto_185977 ?auto_185976 ) ) ( not ( = ?auto_185973 ?auto_185976 ) ) ( not ( = ?auto_185974 ?auto_185976 ) ) ( ON ?auto_185970 ?auto_185969 ) ( CLEAR ?auto_185970 ) ( ON-TABLE ?auto_185976 ) ( HOLDING ?auto_185971 ) ( CLEAR ?auto_185972 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185977 ?auto_185973 ?auto_185974 ?auto_185975 ?auto_185972 ?auto_185971 )
      ( MAKE-4PILE ?auto_185969 ?auto_185970 ?auto_185971 ?auto_185972 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185978 - BLOCK
      ?auto_185979 - BLOCK
      ?auto_185980 - BLOCK
      ?auto_185981 - BLOCK
    )
    :vars
    (
      ?auto_185985 - BLOCK
      ?auto_185983 - BLOCK
      ?auto_185984 - BLOCK
      ?auto_185982 - BLOCK
      ?auto_185986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185978 ?auto_185979 ) ) ( not ( = ?auto_185978 ?auto_185980 ) ) ( not ( = ?auto_185978 ?auto_185981 ) ) ( not ( = ?auto_185979 ?auto_185980 ) ) ( not ( = ?auto_185979 ?auto_185981 ) ) ( not ( = ?auto_185980 ?auto_185981 ) ) ( ON ?auto_185981 ?auto_185985 ) ( not ( = ?auto_185978 ?auto_185985 ) ) ( not ( = ?auto_185979 ?auto_185985 ) ) ( not ( = ?auto_185980 ?auto_185985 ) ) ( not ( = ?auto_185981 ?auto_185985 ) ) ( ON-TABLE ?auto_185983 ) ( ON ?auto_185984 ?auto_185983 ) ( ON ?auto_185982 ?auto_185984 ) ( ON ?auto_185985 ?auto_185982 ) ( not ( = ?auto_185983 ?auto_185984 ) ) ( not ( = ?auto_185983 ?auto_185982 ) ) ( not ( = ?auto_185983 ?auto_185985 ) ) ( not ( = ?auto_185983 ?auto_185981 ) ) ( not ( = ?auto_185983 ?auto_185980 ) ) ( not ( = ?auto_185984 ?auto_185982 ) ) ( not ( = ?auto_185984 ?auto_185985 ) ) ( not ( = ?auto_185984 ?auto_185981 ) ) ( not ( = ?auto_185984 ?auto_185980 ) ) ( not ( = ?auto_185982 ?auto_185985 ) ) ( not ( = ?auto_185982 ?auto_185981 ) ) ( not ( = ?auto_185982 ?auto_185980 ) ) ( not ( = ?auto_185978 ?auto_185983 ) ) ( not ( = ?auto_185978 ?auto_185984 ) ) ( not ( = ?auto_185978 ?auto_185982 ) ) ( not ( = ?auto_185979 ?auto_185983 ) ) ( not ( = ?auto_185979 ?auto_185984 ) ) ( not ( = ?auto_185979 ?auto_185982 ) ) ( ON ?auto_185978 ?auto_185986 ) ( not ( = ?auto_185978 ?auto_185986 ) ) ( not ( = ?auto_185979 ?auto_185986 ) ) ( not ( = ?auto_185980 ?auto_185986 ) ) ( not ( = ?auto_185981 ?auto_185986 ) ) ( not ( = ?auto_185985 ?auto_185986 ) ) ( not ( = ?auto_185983 ?auto_185986 ) ) ( not ( = ?auto_185984 ?auto_185986 ) ) ( not ( = ?auto_185982 ?auto_185986 ) ) ( ON ?auto_185979 ?auto_185978 ) ( ON-TABLE ?auto_185986 ) ( CLEAR ?auto_185981 ) ( ON ?auto_185980 ?auto_185979 ) ( CLEAR ?auto_185980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185986 ?auto_185978 ?auto_185979 )
      ( MAKE-4PILE ?auto_185978 ?auto_185979 ?auto_185980 ?auto_185981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185987 - BLOCK
      ?auto_185988 - BLOCK
      ?auto_185989 - BLOCK
      ?auto_185990 - BLOCK
    )
    :vars
    (
      ?auto_185992 - BLOCK
      ?auto_185991 - BLOCK
      ?auto_185995 - BLOCK
      ?auto_185993 - BLOCK
      ?auto_185994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185987 ?auto_185988 ) ) ( not ( = ?auto_185987 ?auto_185989 ) ) ( not ( = ?auto_185987 ?auto_185990 ) ) ( not ( = ?auto_185988 ?auto_185989 ) ) ( not ( = ?auto_185988 ?auto_185990 ) ) ( not ( = ?auto_185989 ?auto_185990 ) ) ( not ( = ?auto_185987 ?auto_185992 ) ) ( not ( = ?auto_185988 ?auto_185992 ) ) ( not ( = ?auto_185989 ?auto_185992 ) ) ( not ( = ?auto_185990 ?auto_185992 ) ) ( ON-TABLE ?auto_185991 ) ( ON ?auto_185995 ?auto_185991 ) ( ON ?auto_185993 ?auto_185995 ) ( ON ?auto_185992 ?auto_185993 ) ( not ( = ?auto_185991 ?auto_185995 ) ) ( not ( = ?auto_185991 ?auto_185993 ) ) ( not ( = ?auto_185991 ?auto_185992 ) ) ( not ( = ?auto_185991 ?auto_185990 ) ) ( not ( = ?auto_185991 ?auto_185989 ) ) ( not ( = ?auto_185995 ?auto_185993 ) ) ( not ( = ?auto_185995 ?auto_185992 ) ) ( not ( = ?auto_185995 ?auto_185990 ) ) ( not ( = ?auto_185995 ?auto_185989 ) ) ( not ( = ?auto_185993 ?auto_185992 ) ) ( not ( = ?auto_185993 ?auto_185990 ) ) ( not ( = ?auto_185993 ?auto_185989 ) ) ( not ( = ?auto_185987 ?auto_185991 ) ) ( not ( = ?auto_185987 ?auto_185995 ) ) ( not ( = ?auto_185987 ?auto_185993 ) ) ( not ( = ?auto_185988 ?auto_185991 ) ) ( not ( = ?auto_185988 ?auto_185995 ) ) ( not ( = ?auto_185988 ?auto_185993 ) ) ( ON ?auto_185987 ?auto_185994 ) ( not ( = ?auto_185987 ?auto_185994 ) ) ( not ( = ?auto_185988 ?auto_185994 ) ) ( not ( = ?auto_185989 ?auto_185994 ) ) ( not ( = ?auto_185990 ?auto_185994 ) ) ( not ( = ?auto_185992 ?auto_185994 ) ) ( not ( = ?auto_185991 ?auto_185994 ) ) ( not ( = ?auto_185995 ?auto_185994 ) ) ( not ( = ?auto_185993 ?auto_185994 ) ) ( ON ?auto_185988 ?auto_185987 ) ( ON-TABLE ?auto_185994 ) ( ON ?auto_185989 ?auto_185988 ) ( CLEAR ?auto_185989 ) ( HOLDING ?auto_185990 ) ( CLEAR ?auto_185992 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185991 ?auto_185995 ?auto_185993 ?auto_185992 ?auto_185990 )
      ( MAKE-4PILE ?auto_185987 ?auto_185988 ?auto_185989 ?auto_185990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_185996 - BLOCK
      ?auto_185997 - BLOCK
      ?auto_185998 - BLOCK
      ?auto_185999 - BLOCK
    )
    :vars
    (
      ?auto_186003 - BLOCK
      ?auto_186002 - BLOCK
      ?auto_186001 - BLOCK
      ?auto_186004 - BLOCK
      ?auto_186000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185996 ?auto_185997 ) ) ( not ( = ?auto_185996 ?auto_185998 ) ) ( not ( = ?auto_185996 ?auto_185999 ) ) ( not ( = ?auto_185997 ?auto_185998 ) ) ( not ( = ?auto_185997 ?auto_185999 ) ) ( not ( = ?auto_185998 ?auto_185999 ) ) ( not ( = ?auto_185996 ?auto_186003 ) ) ( not ( = ?auto_185997 ?auto_186003 ) ) ( not ( = ?auto_185998 ?auto_186003 ) ) ( not ( = ?auto_185999 ?auto_186003 ) ) ( ON-TABLE ?auto_186002 ) ( ON ?auto_186001 ?auto_186002 ) ( ON ?auto_186004 ?auto_186001 ) ( ON ?auto_186003 ?auto_186004 ) ( not ( = ?auto_186002 ?auto_186001 ) ) ( not ( = ?auto_186002 ?auto_186004 ) ) ( not ( = ?auto_186002 ?auto_186003 ) ) ( not ( = ?auto_186002 ?auto_185999 ) ) ( not ( = ?auto_186002 ?auto_185998 ) ) ( not ( = ?auto_186001 ?auto_186004 ) ) ( not ( = ?auto_186001 ?auto_186003 ) ) ( not ( = ?auto_186001 ?auto_185999 ) ) ( not ( = ?auto_186001 ?auto_185998 ) ) ( not ( = ?auto_186004 ?auto_186003 ) ) ( not ( = ?auto_186004 ?auto_185999 ) ) ( not ( = ?auto_186004 ?auto_185998 ) ) ( not ( = ?auto_185996 ?auto_186002 ) ) ( not ( = ?auto_185996 ?auto_186001 ) ) ( not ( = ?auto_185996 ?auto_186004 ) ) ( not ( = ?auto_185997 ?auto_186002 ) ) ( not ( = ?auto_185997 ?auto_186001 ) ) ( not ( = ?auto_185997 ?auto_186004 ) ) ( ON ?auto_185996 ?auto_186000 ) ( not ( = ?auto_185996 ?auto_186000 ) ) ( not ( = ?auto_185997 ?auto_186000 ) ) ( not ( = ?auto_185998 ?auto_186000 ) ) ( not ( = ?auto_185999 ?auto_186000 ) ) ( not ( = ?auto_186003 ?auto_186000 ) ) ( not ( = ?auto_186002 ?auto_186000 ) ) ( not ( = ?auto_186001 ?auto_186000 ) ) ( not ( = ?auto_186004 ?auto_186000 ) ) ( ON ?auto_185997 ?auto_185996 ) ( ON-TABLE ?auto_186000 ) ( ON ?auto_185998 ?auto_185997 ) ( CLEAR ?auto_186003 ) ( ON ?auto_185999 ?auto_185998 ) ( CLEAR ?auto_185999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186000 ?auto_185996 ?auto_185997 ?auto_185998 )
      ( MAKE-4PILE ?auto_185996 ?auto_185997 ?auto_185998 ?auto_185999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186005 - BLOCK
      ?auto_186006 - BLOCK
      ?auto_186007 - BLOCK
      ?auto_186008 - BLOCK
    )
    :vars
    (
      ?auto_186012 - BLOCK
      ?auto_186013 - BLOCK
      ?auto_186011 - BLOCK
      ?auto_186009 - BLOCK
      ?auto_186010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186005 ?auto_186006 ) ) ( not ( = ?auto_186005 ?auto_186007 ) ) ( not ( = ?auto_186005 ?auto_186008 ) ) ( not ( = ?auto_186006 ?auto_186007 ) ) ( not ( = ?auto_186006 ?auto_186008 ) ) ( not ( = ?auto_186007 ?auto_186008 ) ) ( not ( = ?auto_186005 ?auto_186012 ) ) ( not ( = ?auto_186006 ?auto_186012 ) ) ( not ( = ?auto_186007 ?auto_186012 ) ) ( not ( = ?auto_186008 ?auto_186012 ) ) ( ON-TABLE ?auto_186013 ) ( ON ?auto_186011 ?auto_186013 ) ( ON ?auto_186009 ?auto_186011 ) ( not ( = ?auto_186013 ?auto_186011 ) ) ( not ( = ?auto_186013 ?auto_186009 ) ) ( not ( = ?auto_186013 ?auto_186012 ) ) ( not ( = ?auto_186013 ?auto_186008 ) ) ( not ( = ?auto_186013 ?auto_186007 ) ) ( not ( = ?auto_186011 ?auto_186009 ) ) ( not ( = ?auto_186011 ?auto_186012 ) ) ( not ( = ?auto_186011 ?auto_186008 ) ) ( not ( = ?auto_186011 ?auto_186007 ) ) ( not ( = ?auto_186009 ?auto_186012 ) ) ( not ( = ?auto_186009 ?auto_186008 ) ) ( not ( = ?auto_186009 ?auto_186007 ) ) ( not ( = ?auto_186005 ?auto_186013 ) ) ( not ( = ?auto_186005 ?auto_186011 ) ) ( not ( = ?auto_186005 ?auto_186009 ) ) ( not ( = ?auto_186006 ?auto_186013 ) ) ( not ( = ?auto_186006 ?auto_186011 ) ) ( not ( = ?auto_186006 ?auto_186009 ) ) ( ON ?auto_186005 ?auto_186010 ) ( not ( = ?auto_186005 ?auto_186010 ) ) ( not ( = ?auto_186006 ?auto_186010 ) ) ( not ( = ?auto_186007 ?auto_186010 ) ) ( not ( = ?auto_186008 ?auto_186010 ) ) ( not ( = ?auto_186012 ?auto_186010 ) ) ( not ( = ?auto_186013 ?auto_186010 ) ) ( not ( = ?auto_186011 ?auto_186010 ) ) ( not ( = ?auto_186009 ?auto_186010 ) ) ( ON ?auto_186006 ?auto_186005 ) ( ON-TABLE ?auto_186010 ) ( ON ?auto_186007 ?auto_186006 ) ( ON ?auto_186008 ?auto_186007 ) ( CLEAR ?auto_186008 ) ( HOLDING ?auto_186012 ) ( CLEAR ?auto_186009 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186013 ?auto_186011 ?auto_186009 ?auto_186012 )
      ( MAKE-4PILE ?auto_186005 ?auto_186006 ?auto_186007 ?auto_186008 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186014 - BLOCK
      ?auto_186015 - BLOCK
      ?auto_186016 - BLOCK
      ?auto_186017 - BLOCK
    )
    :vars
    (
      ?auto_186022 - BLOCK
      ?auto_186018 - BLOCK
      ?auto_186021 - BLOCK
      ?auto_186019 - BLOCK
      ?auto_186020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186014 ?auto_186015 ) ) ( not ( = ?auto_186014 ?auto_186016 ) ) ( not ( = ?auto_186014 ?auto_186017 ) ) ( not ( = ?auto_186015 ?auto_186016 ) ) ( not ( = ?auto_186015 ?auto_186017 ) ) ( not ( = ?auto_186016 ?auto_186017 ) ) ( not ( = ?auto_186014 ?auto_186022 ) ) ( not ( = ?auto_186015 ?auto_186022 ) ) ( not ( = ?auto_186016 ?auto_186022 ) ) ( not ( = ?auto_186017 ?auto_186022 ) ) ( ON-TABLE ?auto_186018 ) ( ON ?auto_186021 ?auto_186018 ) ( ON ?auto_186019 ?auto_186021 ) ( not ( = ?auto_186018 ?auto_186021 ) ) ( not ( = ?auto_186018 ?auto_186019 ) ) ( not ( = ?auto_186018 ?auto_186022 ) ) ( not ( = ?auto_186018 ?auto_186017 ) ) ( not ( = ?auto_186018 ?auto_186016 ) ) ( not ( = ?auto_186021 ?auto_186019 ) ) ( not ( = ?auto_186021 ?auto_186022 ) ) ( not ( = ?auto_186021 ?auto_186017 ) ) ( not ( = ?auto_186021 ?auto_186016 ) ) ( not ( = ?auto_186019 ?auto_186022 ) ) ( not ( = ?auto_186019 ?auto_186017 ) ) ( not ( = ?auto_186019 ?auto_186016 ) ) ( not ( = ?auto_186014 ?auto_186018 ) ) ( not ( = ?auto_186014 ?auto_186021 ) ) ( not ( = ?auto_186014 ?auto_186019 ) ) ( not ( = ?auto_186015 ?auto_186018 ) ) ( not ( = ?auto_186015 ?auto_186021 ) ) ( not ( = ?auto_186015 ?auto_186019 ) ) ( ON ?auto_186014 ?auto_186020 ) ( not ( = ?auto_186014 ?auto_186020 ) ) ( not ( = ?auto_186015 ?auto_186020 ) ) ( not ( = ?auto_186016 ?auto_186020 ) ) ( not ( = ?auto_186017 ?auto_186020 ) ) ( not ( = ?auto_186022 ?auto_186020 ) ) ( not ( = ?auto_186018 ?auto_186020 ) ) ( not ( = ?auto_186021 ?auto_186020 ) ) ( not ( = ?auto_186019 ?auto_186020 ) ) ( ON ?auto_186015 ?auto_186014 ) ( ON-TABLE ?auto_186020 ) ( ON ?auto_186016 ?auto_186015 ) ( ON ?auto_186017 ?auto_186016 ) ( CLEAR ?auto_186019 ) ( ON ?auto_186022 ?auto_186017 ) ( CLEAR ?auto_186022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186020 ?auto_186014 ?auto_186015 ?auto_186016 ?auto_186017 )
      ( MAKE-4PILE ?auto_186014 ?auto_186015 ?auto_186016 ?auto_186017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186023 - BLOCK
      ?auto_186024 - BLOCK
      ?auto_186025 - BLOCK
      ?auto_186026 - BLOCK
    )
    :vars
    (
      ?auto_186030 - BLOCK
      ?auto_186028 - BLOCK
      ?auto_186031 - BLOCK
      ?auto_186029 - BLOCK
      ?auto_186027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186023 ?auto_186024 ) ) ( not ( = ?auto_186023 ?auto_186025 ) ) ( not ( = ?auto_186023 ?auto_186026 ) ) ( not ( = ?auto_186024 ?auto_186025 ) ) ( not ( = ?auto_186024 ?auto_186026 ) ) ( not ( = ?auto_186025 ?auto_186026 ) ) ( not ( = ?auto_186023 ?auto_186030 ) ) ( not ( = ?auto_186024 ?auto_186030 ) ) ( not ( = ?auto_186025 ?auto_186030 ) ) ( not ( = ?auto_186026 ?auto_186030 ) ) ( ON-TABLE ?auto_186028 ) ( ON ?auto_186031 ?auto_186028 ) ( not ( = ?auto_186028 ?auto_186031 ) ) ( not ( = ?auto_186028 ?auto_186029 ) ) ( not ( = ?auto_186028 ?auto_186030 ) ) ( not ( = ?auto_186028 ?auto_186026 ) ) ( not ( = ?auto_186028 ?auto_186025 ) ) ( not ( = ?auto_186031 ?auto_186029 ) ) ( not ( = ?auto_186031 ?auto_186030 ) ) ( not ( = ?auto_186031 ?auto_186026 ) ) ( not ( = ?auto_186031 ?auto_186025 ) ) ( not ( = ?auto_186029 ?auto_186030 ) ) ( not ( = ?auto_186029 ?auto_186026 ) ) ( not ( = ?auto_186029 ?auto_186025 ) ) ( not ( = ?auto_186023 ?auto_186028 ) ) ( not ( = ?auto_186023 ?auto_186031 ) ) ( not ( = ?auto_186023 ?auto_186029 ) ) ( not ( = ?auto_186024 ?auto_186028 ) ) ( not ( = ?auto_186024 ?auto_186031 ) ) ( not ( = ?auto_186024 ?auto_186029 ) ) ( ON ?auto_186023 ?auto_186027 ) ( not ( = ?auto_186023 ?auto_186027 ) ) ( not ( = ?auto_186024 ?auto_186027 ) ) ( not ( = ?auto_186025 ?auto_186027 ) ) ( not ( = ?auto_186026 ?auto_186027 ) ) ( not ( = ?auto_186030 ?auto_186027 ) ) ( not ( = ?auto_186028 ?auto_186027 ) ) ( not ( = ?auto_186031 ?auto_186027 ) ) ( not ( = ?auto_186029 ?auto_186027 ) ) ( ON ?auto_186024 ?auto_186023 ) ( ON-TABLE ?auto_186027 ) ( ON ?auto_186025 ?auto_186024 ) ( ON ?auto_186026 ?auto_186025 ) ( ON ?auto_186030 ?auto_186026 ) ( CLEAR ?auto_186030 ) ( HOLDING ?auto_186029 ) ( CLEAR ?auto_186031 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186028 ?auto_186031 ?auto_186029 )
      ( MAKE-4PILE ?auto_186023 ?auto_186024 ?auto_186025 ?auto_186026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186032 - BLOCK
      ?auto_186033 - BLOCK
      ?auto_186034 - BLOCK
      ?auto_186035 - BLOCK
    )
    :vars
    (
      ?auto_186038 - BLOCK
      ?auto_186037 - BLOCK
      ?auto_186039 - BLOCK
      ?auto_186040 - BLOCK
      ?auto_186036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186032 ?auto_186033 ) ) ( not ( = ?auto_186032 ?auto_186034 ) ) ( not ( = ?auto_186032 ?auto_186035 ) ) ( not ( = ?auto_186033 ?auto_186034 ) ) ( not ( = ?auto_186033 ?auto_186035 ) ) ( not ( = ?auto_186034 ?auto_186035 ) ) ( not ( = ?auto_186032 ?auto_186038 ) ) ( not ( = ?auto_186033 ?auto_186038 ) ) ( not ( = ?auto_186034 ?auto_186038 ) ) ( not ( = ?auto_186035 ?auto_186038 ) ) ( ON-TABLE ?auto_186037 ) ( ON ?auto_186039 ?auto_186037 ) ( not ( = ?auto_186037 ?auto_186039 ) ) ( not ( = ?auto_186037 ?auto_186040 ) ) ( not ( = ?auto_186037 ?auto_186038 ) ) ( not ( = ?auto_186037 ?auto_186035 ) ) ( not ( = ?auto_186037 ?auto_186034 ) ) ( not ( = ?auto_186039 ?auto_186040 ) ) ( not ( = ?auto_186039 ?auto_186038 ) ) ( not ( = ?auto_186039 ?auto_186035 ) ) ( not ( = ?auto_186039 ?auto_186034 ) ) ( not ( = ?auto_186040 ?auto_186038 ) ) ( not ( = ?auto_186040 ?auto_186035 ) ) ( not ( = ?auto_186040 ?auto_186034 ) ) ( not ( = ?auto_186032 ?auto_186037 ) ) ( not ( = ?auto_186032 ?auto_186039 ) ) ( not ( = ?auto_186032 ?auto_186040 ) ) ( not ( = ?auto_186033 ?auto_186037 ) ) ( not ( = ?auto_186033 ?auto_186039 ) ) ( not ( = ?auto_186033 ?auto_186040 ) ) ( ON ?auto_186032 ?auto_186036 ) ( not ( = ?auto_186032 ?auto_186036 ) ) ( not ( = ?auto_186033 ?auto_186036 ) ) ( not ( = ?auto_186034 ?auto_186036 ) ) ( not ( = ?auto_186035 ?auto_186036 ) ) ( not ( = ?auto_186038 ?auto_186036 ) ) ( not ( = ?auto_186037 ?auto_186036 ) ) ( not ( = ?auto_186039 ?auto_186036 ) ) ( not ( = ?auto_186040 ?auto_186036 ) ) ( ON ?auto_186033 ?auto_186032 ) ( ON-TABLE ?auto_186036 ) ( ON ?auto_186034 ?auto_186033 ) ( ON ?auto_186035 ?auto_186034 ) ( ON ?auto_186038 ?auto_186035 ) ( CLEAR ?auto_186039 ) ( ON ?auto_186040 ?auto_186038 ) ( CLEAR ?auto_186040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186036 ?auto_186032 ?auto_186033 ?auto_186034 ?auto_186035 ?auto_186038 )
      ( MAKE-4PILE ?auto_186032 ?auto_186033 ?auto_186034 ?auto_186035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186041 - BLOCK
      ?auto_186042 - BLOCK
      ?auto_186043 - BLOCK
      ?auto_186044 - BLOCK
    )
    :vars
    (
      ?auto_186045 - BLOCK
      ?auto_186047 - BLOCK
      ?auto_186049 - BLOCK
      ?auto_186048 - BLOCK
      ?auto_186046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186041 ?auto_186042 ) ) ( not ( = ?auto_186041 ?auto_186043 ) ) ( not ( = ?auto_186041 ?auto_186044 ) ) ( not ( = ?auto_186042 ?auto_186043 ) ) ( not ( = ?auto_186042 ?auto_186044 ) ) ( not ( = ?auto_186043 ?auto_186044 ) ) ( not ( = ?auto_186041 ?auto_186045 ) ) ( not ( = ?auto_186042 ?auto_186045 ) ) ( not ( = ?auto_186043 ?auto_186045 ) ) ( not ( = ?auto_186044 ?auto_186045 ) ) ( ON-TABLE ?auto_186047 ) ( not ( = ?auto_186047 ?auto_186049 ) ) ( not ( = ?auto_186047 ?auto_186048 ) ) ( not ( = ?auto_186047 ?auto_186045 ) ) ( not ( = ?auto_186047 ?auto_186044 ) ) ( not ( = ?auto_186047 ?auto_186043 ) ) ( not ( = ?auto_186049 ?auto_186048 ) ) ( not ( = ?auto_186049 ?auto_186045 ) ) ( not ( = ?auto_186049 ?auto_186044 ) ) ( not ( = ?auto_186049 ?auto_186043 ) ) ( not ( = ?auto_186048 ?auto_186045 ) ) ( not ( = ?auto_186048 ?auto_186044 ) ) ( not ( = ?auto_186048 ?auto_186043 ) ) ( not ( = ?auto_186041 ?auto_186047 ) ) ( not ( = ?auto_186041 ?auto_186049 ) ) ( not ( = ?auto_186041 ?auto_186048 ) ) ( not ( = ?auto_186042 ?auto_186047 ) ) ( not ( = ?auto_186042 ?auto_186049 ) ) ( not ( = ?auto_186042 ?auto_186048 ) ) ( ON ?auto_186041 ?auto_186046 ) ( not ( = ?auto_186041 ?auto_186046 ) ) ( not ( = ?auto_186042 ?auto_186046 ) ) ( not ( = ?auto_186043 ?auto_186046 ) ) ( not ( = ?auto_186044 ?auto_186046 ) ) ( not ( = ?auto_186045 ?auto_186046 ) ) ( not ( = ?auto_186047 ?auto_186046 ) ) ( not ( = ?auto_186049 ?auto_186046 ) ) ( not ( = ?auto_186048 ?auto_186046 ) ) ( ON ?auto_186042 ?auto_186041 ) ( ON-TABLE ?auto_186046 ) ( ON ?auto_186043 ?auto_186042 ) ( ON ?auto_186044 ?auto_186043 ) ( ON ?auto_186045 ?auto_186044 ) ( ON ?auto_186048 ?auto_186045 ) ( CLEAR ?auto_186048 ) ( HOLDING ?auto_186049 ) ( CLEAR ?auto_186047 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186047 ?auto_186049 )
      ( MAKE-4PILE ?auto_186041 ?auto_186042 ?auto_186043 ?auto_186044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186050 - BLOCK
      ?auto_186051 - BLOCK
      ?auto_186052 - BLOCK
      ?auto_186053 - BLOCK
    )
    :vars
    (
      ?auto_186056 - BLOCK
      ?auto_186055 - BLOCK
      ?auto_186057 - BLOCK
      ?auto_186058 - BLOCK
      ?auto_186054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186050 ?auto_186051 ) ) ( not ( = ?auto_186050 ?auto_186052 ) ) ( not ( = ?auto_186050 ?auto_186053 ) ) ( not ( = ?auto_186051 ?auto_186052 ) ) ( not ( = ?auto_186051 ?auto_186053 ) ) ( not ( = ?auto_186052 ?auto_186053 ) ) ( not ( = ?auto_186050 ?auto_186056 ) ) ( not ( = ?auto_186051 ?auto_186056 ) ) ( not ( = ?auto_186052 ?auto_186056 ) ) ( not ( = ?auto_186053 ?auto_186056 ) ) ( ON-TABLE ?auto_186055 ) ( not ( = ?auto_186055 ?auto_186057 ) ) ( not ( = ?auto_186055 ?auto_186058 ) ) ( not ( = ?auto_186055 ?auto_186056 ) ) ( not ( = ?auto_186055 ?auto_186053 ) ) ( not ( = ?auto_186055 ?auto_186052 ) ) ( not ( = ?auto_186057 ?auto_186058 ) ) ( not ( = ?auto_186057 ?auto_186056 ) ) ( not ( = ?auto_186057 ?auto_186053 ) ) ( not ( = ?auto_186057 ?auto_186052 ) ) ( not ( = ?auto_186058 ?auto_186056 ) ) ( not ( = ?auto_186058 ?auto_186053 ) ) ( not ( = ?auto_186058 ?auto_186052 ) ) ( not ( = ?auto_186050 ?auto_186055 ) ) ( not ( = ?auto_186050 ?auto_186057 ) ) ( not ( = ?auto_186050 ?auto_186058 ) ) ( not ( = ?auto_186051 ?auto_186055 ) ) ( not ( = ?auto_186051 ?auto_186057 ) ) ( not ( = ?auto_186051 ?auto_186058 ) ) ( ON ?auto_186050 ?auto_186054 ) ( not ( = ?auto_186050 ?auto_186054 ) ) ( not ( = ?auto_186051 ?auto_186054 ) ) ( not ( = ?auto_186052 ?auto_186054 ) ) ( not ( = ?auto_186053 ?auto_186054 ) ) ( not ( = ?auto_186056 ?auto_186054 ) ) ( not ( = ?auto_186055 ?auto_186054 ) ) ( not ( = ?auto_186057 ?auto_186054 ) ) ( not ( = ?auto_186058 ?auto_186054 ) ) ( ON ?auto_186051 ?auto_186050 ) ( ON-TABLE ?auto_186054 ) ( ON ?auto_186052 ?auto_186051 ) ( ON ?auto_186053 ?auto_186052 ) ( ON ?auto_186056 ?auto_186053 ) ( ON ?auto_186058 ?auto_186056 ) ( CLEAR ?auto_186055 ) ( ON ?auto_186057 ?auto_186058 ) ( CLEAR ?auto_186057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186054 ?auto_186050 ?auto_186051 ?auto_186052 ?auto_186053 ?auto_186056 ?auto_186058 )
      ( MAKE-4PILE ?auto_186050 ?auto_186051 ?auto_186052 ?auto_186053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186059 - BLOCK
      ?auto_186060 - BLOCK
      ?auto_186061 - BLOCK
      ?auto_186062 - BLOCK
    )
    :vars
    (
      ?auto_186063 - BLOCK
      ?auto_186067 - BLOCK
      ?auto_186065 - BLOCK
      ?auto_186064 - BLOCK
      ?auto_186066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186059 ?auto_186060 ) ) ( not ( = ?auto_186059 ?auto_186061 ) ) ( not ( = ?auto_186059 ?auto_186062 ) ) ( not ( = ?auto_186060 ?auto_186061 ) ) ( not ( = ?auto_186060 ?auto_186062 ) ) ( not ( = ?auto_186061 ?auto_186062 ) ) ( not ( = ?auto_186059 ?auto_186063 ) ) ( not ( = ?auto_186060 ?auto_186063 ) ) ( not ( = ?auto_186061 ?auto_186063 ) ) ( not ( = ?auto_186062 ?auto_186063 ) ) ( not ( = ?auto_186067 ?auto_186065 ) ) ( not ( = ?auto_186067 ?auto_186064 ) ) ( not ( = ?auto_186067 ?auto_186063 ) ) ( not ( = ?auto_186067 ?auto_186062 ) ) ( not ( = ?auto_186067 ?auto_186061 ) ) ( not ( = ?auto_186065 ?auto_186064 ) ) ( not ( = ?auto_186065 ?auto_186063 ) ) ( not ( = ?auto_186065 ?auto_186062 ) ) ( not ( = ?auto_186065 ?auto_186061 ) ) ( not ( = ?auto_186064 ?auto_186063 ) ) ( not ( = ?auto_186064 ?auto_186062 ) ) ( not ( = ?auto_186064 ?auto_186061 ) ) ( not ( = ?auto_186059 ?auto_186067 ) ) ( not ( = ?auto_186059 ?auto_186065 ) ) ( not ( = ?auto_186059 ?auto_186064 ) ) ( not ( = ?auto_186060 ?auto_186067 ) ) ( not ( = ?auto_186060 ?auto_186065 ) ) ( not ( = ?auto_186060 ?auto_186064 ) ) ( ON ?auto_186059 ?auto_186066 ) ( not ( = ?auto_186059 ?auto_186066 ) ) ( not ( = ?auto_186060 ?auto_186066 ) ) ( not ( = ?auto_186061 ?auto_186066 ) ) ( not ( = ?auto_186062 ?auto_186066 ) ) ( not ( = ?auto_186063 ?auto_186066 ) ) ( not ( = ?auto_186067 ?auto_186066 ) ) ( not ( = ?auto_186065 ?auto_186066 ) ) ( not ( = ?auto_186064 ?auto_186066 ) ) ( ON ?auto_186060 ?auto_186059 ) ( ON-TABLE ?auto_186066 ) ( ON ?auto_186061 ?auto_186060 ) ( ON ?auto_186062 ?auto_186061 ) ( ON ?auto_186063 ?auto_186062 ) ( ON ?auto_186064 ?auto_186063 ) ( ON ?auto_186065 ?auto_186064 ) ( CLEAR ?auto_186065 ) ( HOLDING ?auto_186067 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186067 )
      ( MAKE-4PILE ?auto_186059 ?auto_186060 ?auto_186061 ?auto_186062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186068 - BLOCK
      ?auto_186069 - BLOCK
      ?auto_186070 - BLOCK
      ?auto_186071 - BLOCK
    )
    :vars
    (
      ?auto_186076 - BLOCK
      ?auto_186075 - BLOCK
      ?auto_186074 - BLOCK
      ?auto_186072 - BLOCK
      ?auto_186073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186068 ?auto_186069 ) ) ( not ( = ?auto_186068 ?auto_186070 ) ) ( not ( = ?auto_186068 ?auto_186071 ) ) ( not ( = ?auto_186069 ?auto_186070 ) ) ( not ( = ?auto_186069 ?auto_186071 ) ) ( not ( = ?auto_186070 ?auto_186071 ) ) ( not ( = ?auto_186068 ?auto_186076 ) ) ( not ( = ?auto_186069 ?auto_186076 ) ) ( not ( = ?auto_186070 ?auto_186076 ) ) ( not ( = ?auto_186071 ?auto_186076 ) ) ( not ( = ?auto_186075 ?auto_186074 ) ) ( not ( = ?auto_186075 ?auto_186072 ) ) ( not ( = ?auto_186075 ?auto_186076 ) ) ( not ( = ?auto_186075 ?auto_186071 ) ) ( not ( = ?auto_186075 ?auto_186070 ) ) ( not ( = ?auto_186074 ?auto_186072 ) ) ( not ( = ?auto_186074 ?auto_186076 ) ) ( not ( = ?auto_186074 ?auto_186071 ) ) ( not ( = ?auto_186074 ?auto_186070 ) ) ( not ( = ?auto_186072 ?auto_186076 ) ) ( not ( = ?auto_186072 ?auto_186071 ) ) ( not ( = ?auto_186072 ?auto_186070 ) ) ( not ( = ?auto_186068 ?auto_186075 ) ) ( not ( = ?auto_186068 ?auto_186074 ) ) ( not ( = ?auto_186068 ?auto_186072 ) ) ( not ( = ?auto_186069 ?auto_186075 ) ) ( not ( = ?auto_186069 ?auto_186074 ) ) ( not ( = ?auto_186069 ?auto_186072 ) ) ( ON ?auto_186068 ?auto_186073 ) ( not ( = ?auto_186068 ?auto_186073 ) ) ( not ( = ?auto_186069 ?auto_186073 ) ) ( not ( = ?auto_186070 ?auto_186073 ) ) ( not ( = ?auto_186071 ?auto_186073 ) ) ( not ( = ?auto_186076 ?auto_186073 ) ) ( not ( = ?auto_186075 ?auto_186073 ) ) ( not ( = ?auto_186074 ?auto_186073 ) ) ( not ( = ?auto_186072 ?auto_186073 ) ) ( ON ?auto_186069 ?auto_186068 ) ( ON-TABLE ?auto_186073 ) ( ON ?auto_186070 ?auto_186069 ) ( ON ?auto_186071 ?auto_186070 ) ( ON ?auto_186076 ?auto_186071 ) ( ON ?auto_186072 ?auto_186076 ) ( ON ?auto_186074 ?auto_186072 ) ( ON ?auto_186075 ?auto_186074 ) ( CLEAR ?auto_186075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186073 ?auto_186068 ?auto_186069 ?auto_186070 ?auto_186071 ?auto_186076 ?auto_186072 ?auto_186074 )
      ( MAKE-4PILE ?auto_186068 ?auto_186069 ?auto_186070 ?auto_186071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186080 - BLOCK
      ?auto_186081 - BLOCK
      ?auto_186082 - BLOCK
    )
    :vars
    (
      ?auto_186083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186083 ?auto_186082 ) ( CLEAR ?auto_186083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186080 ) ( ON ?auto_186081 ?auto_186080 ) ( ON ?auto_186082 ?auto_186081 ) ( not ( = ?auto_186080 ?auto_186081 ) ) ( not ( = ?auto_186080 ?auto_186082 ) ) ( not ( = ?auto_186080 ?auto_186083 ) ) ( not ( = ?auto_186081 ?auto_186082 ) ) ( not ( = ?auto_186081 ?auto_186083 ) ) ( not ( = ?auto_186082 ?auto_186083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186083 ?auto_186082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186084 - BLOCK
      ?auto_186085 - BLOCK
      ?auto_186086 - BLOCK
    )
    :vars
    (
      ?auto_186087 - BLOCK
      ?auto_186088 - BLOCK
      ?auto_186089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186087 ?auto_186086 ) ( CLEAR ?auto_186087 ) ( ON-TABLE ?auto_186084 ) ( ON ?auto_186085 ?auto_186084 ) ( ON ?auto_186086 ?auto_186085 ) ( not ( = ?auto_186084 ?auto_186085 ) ) ( not ( = ?auto_186084 ?auto_186086 ) ) ( not ( = ?auto_186084 ?auto_186087 ) ) ( not ( = ?auto_186085 ?auto_186086 ) ) ( not ( = ?auto_186085 ?auto_186087 ) ) ( not ( = ?auto_186086 ?auto_186087 ) ) ( HOLDING ?auto_186088 ) ( CLEAR ?auto_186089 ) ( not ( = ?auto_186084 ?auto_186088 ) ) ( not ( = ?auto_186084 ?auto_186089 ) ) ( not ( = ?auto_186085 ?auto_186088 ) ) ( not ( = ?auto_186085 ?auto_186089 ) ) ( not ( = ?auto_186086 ?auto_186088 ) ) ( not ( = ?auto_186086 ?auto_186089 ) ) ( not ( = ?auto_186087 ?auto_186088 ) ) ( not ( = ?auto_186087 ?auto_186089 ) ) ( not ( = ?auto_186088 ?auto_186089 ) ) )
    :subtasks
    ( ( !STACK ?auto_186088 ?auto_186089 )
      ( MAKE-3PILE ?auto_186084 ?auto_186085 ?auto_186086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186090 - BLOCK
      ?auto_186091 - BLOCK
      ?auto_186092 - BLOCK
    )
    :vars
    (
      ?auto_186094 - BLOCK
      ?auto_186093 - BLOCK
      ?auto_186095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186094 ?auto_186092 ) ( ON-TABLE ?auto_186090 ) ( ON ?auto_186091 ?auto_186090 ) ( ON ?auto_186092 ?auto_186091 ) ( not ( = ?auto_186090 ?auto_186091 ) ) ( not ( = ?auto_186090 ?auto_186092 ) ) ( not ( = ?auto_186090 ?auto_186094 ) ) ( not ( = ?auto_186091 ?auto_186092 ) ) ( not ( = ?auto_186091 ?auto_186094 ) ) ( not ( = ?auto_186092 ?auto_186094 ) ) ( CLEAR ?auto_186093 ) ( not ( = ?auto_186090 ?auto_186095 ) ) ( not ( = ?auto_186090 ?auto_186093 ) ) ( not ( = ?auto_186091 ?auto_186095 ) ) ( not ( = ?auto_186091 ?auto_186093 ) ) ( not ( = ?auto_186092 ?auto_186095 ) ) ( not ( = ?auto_186092 ?auto_186093 ) ) ( not ( = ?auto_186094 ?auto_186095 ) ) ( not ( = ?auto_186094 ?auto_186093 ) ) ( not ( = ?auto_186095 ?auto_186093 ) ) ( ON ?auto_186095 ?auto_186094 ) ( CLEAR ?auto_186095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186090 ?auto_186091 ?auto_186092 ?auto_186094 )
      ( MAKE-3PILE ?auto_186090 ?auto_186091 ?auto_186092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186096 - BLOCK
      ?auto_186097 - BLOCK
      ?auto_186098 - BLOCK
    )
    :vars
    (
      ?auto_186101 - BLOCK
      ?auto_186100 - BLOCK
      ?auto_186099 - BLOCK
      ?auto_186103 - BLOCK
      ?auto_186102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186101 ?auto_186098 ) ( ON-TABLE ?auto_186096 ) ( ON ?auto_186097 ?auto_186096 ) ( ON ?auto_186098 ?auto_186097 ) ( not ( = ?auto_186096 ?auto_186097 ) ) ( not ( = ?auto_186096 ?auto_186098 ) ) ( not ( = ?auto_186096 ?auto_186101 ) ) ( not ( = ?auto_186097 ?auto_186098 ) ) ( not ( = ?auto_186097 ?auto_186101 ) ) ( not ( = ?auto_186098 ?auto_186101 ) ) ( not ( = ?auto_186096 ?auto_186100 ) ) ( not ( = ?auto_186096 ?auto_186099 ) ) ( not ( = ?auto_186097 ?auto_186100 ) ) ( not ( = ?auto_186097 ?auto_186099 ) ) ( not ( = ?auto_186098 ?auto_186100 ) ) ( not ( = ?auto_186098 ?auto_186099 ) ) ( not ( = ?auto_186101 ?auto_186100 ) ) ( not ( = ?auto_186101 ?auto_186099 ) ) ( not ( = ?auto_186100 ?auto_186099 ) ) ( ON ?auto_186100 ?auto_186101 ) ( CLEAR ?auto_186100 ) ( HOLDING ?auto_186099 ) ( CLEAR ?auto_186103 ) ( ON-TABLE ?auto_186102 ) ( ON ?auto_186103 ?auto_186102 ) ( not ( = ?auto_186102 ?auto_186103 ) ) ( not ( = ?auto_186102 ?auto_186099 ) ) ( not ( = ?auto_186103 ?auto_186099 ) ) ( not ( = ?auto_186096 ?auto_186103 ) ) ( not ( = ?auto_186096 ?auto_186102 ) ) ( not ( = ?auto_186097 ?auto_186103 ) ) ( not ( = ?auto_186097 ?auto_186102 ) ) ( not ( = ?auto_186098 ?auto_186103 ) ) ( not ( = ?auto_186098 ?auto_186102 ) ) ( not ( = ?auto_186101 ?auto_186103 ) ) ( not ( = ?auto_186101 ?auto_186102 ) ) ( not ( = ?auto_186100 ?auto_186103 ) ) ( not ( = ?auto_186100 ?auto_186102 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186102 ?auto_186103 ?auto_186099 )
      ( MAKE-3PILE ?auto_186096 ?auto_186097 ?auto_186098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186104 - BLOCK
      ?auto_186105 - BLOCK
      ?auto_186106 - BLOCK
    )
    :vars
    (
      ?auto_186107 - BLOCK
      ?auto_186109 - BLOCK
      ?auto_186110 - BLOCK
      ?auto_186111 - BLOCK
      ?auto_186108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186107 ?auto_186106 ) ( ON-TABLE ?auto_186104 ) ( ON ?auto_186105 ?auto_186104 ) ( ON ?auto_186106 ?auto_186105 ) ( not ( = ?auto_186104 ?auto_186105 ) ) ( not ( = ?auto_186104 ?auto_186106 ) ) ( not ( = ?auto_186104 ?auto_186107 ) ) ( not ( = ?auto_186105 ?auto_186106 ) ) ( not ( = ?auto_186105 ?auto_186107 ) ) ( not ( = ?auto_186106 ?auto_186107 ) ) ( not ( = ?auto_186104 ?auto_186109 ) ) ( not ( = ?auto_186104 ?auto_186110 ) ) ( not ( = ?auto_186105 ?auto_186109 ) ) ( not ( = ?auto_186105 ?auto_186110 ) ) ( not ( = ?auto_186106 ?auto_186109 ) ) ( not ( = ?auto_186106 ?auto_186110 ) ) ( not ( = ?auto_186107 ?auto_186109 ) ) ( not ( = ?auto_186107 ?auto_186110 ) ) ( not ( = ?auto_186109 ?auto_186110 ) ) ( ON ?auto_186109 ?auto_186107 ) ( CLEAR ?auto_186111 ) ( ON-TABLE ?auto_186108 ) ( ON ?auto_186111 ?auto_186108 ) ( not ( = ?auto_186108 ?auto_186111 ) ) ( not ( = ?auto_186108 ?auto_186110 ) ) ( not ( = ?auto_186111 ?auto_186110 ) ) ( not ( = ?auto_186104 ?auto_186111 ) ) ( not ( = ?auto_186104 ?auto_186108 ) ) ( not ( = ?auto_186105 ?auto_186111 ) ) ( not ( = ?auto_186105 ?auto_186108 ) ) ( not ( = ?auto_186106 ?auto_186111 ) ) ( not ( = ?auto_186106 ?auto_186108 ) ) ( not ( = ?auto_186107 ?auto_186111 ) ) ( not ( = ?auto_186107 ?auto_186108 ) ) ( not ( = ?auto_186109 ?auto_186111 ) ) ( not ( = ?auto_186109 ?auto_186108 ) ) ( ON ?auto_186110 ?auto_186109 ) ( CLEAR ?auto_186110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186104 ?auto_186105 ?auto_186106 ?auto_186107 ?auto_186109 )
      ( MAKE-3PILE ?auto_186104 ?auto_186105 ?auto_186106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186112 - BLOCK
      ?auto_186113 - BLOCK
      ?auto_186114 - BLOCK
    )
    :vars
    (
      ?auto_186116 - BLOCK
      ?auto_186115 - BLOCK
      ?auto_186117 - BLOCK
      ?auto_186119 - BLOCK
      ?auto_186118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186116 ?auto_186114 ) ( ON-TABLE ?auto_186112 ) ( ON ?auto_186113 ?auto_186112 ) ( ON ?auto_186114 ?auto_186113 ) ( not ( = ?auto_186112 ?auto_186113 ) ) ( not ( = ?auto_186112 ?auto_186114 ) ) ( not ( = ?auto_186112 ?auto_186116 ) ) ( not ( = ?auto_186113 ?auto_186114 ) ) ( not ( = ?auto_186113 ?auto_186116 ) ) ( not ( = ?auto_186114 ?auto_186116 ) ) ( not ( = ?auto_186112 ?auto_186115 ) ) ( not ( = ?auto_186112 ?auto_186117 ) ) ( not ( = ?auto_186113 ?auto_186115 ) ) ( not ( = ?auto_186113 ?auto_186117 ) ) ( not ( = ?auto_186114 ?auto_186115 ) ) ( not ( = ?auto_186114 ?auto_186117 ) ) ( not ( = ?auto_186116 ?auto_186115 ) ) ( not ( = ?auto_186116 ?auto_186117 ) ) ( not ( = ?auto_186115 ?auto_186117 ) ) ( ON ?auto_186115 ?auto_186116 ) ( ON-TABLE ?auto_186119 ) ( not ( = ?auto_186119 ?auto_186118 ) ) ( not ( = ?auto_186119 ?auto_186117 ) ) ( not ( = ?auto_186118 ?auto_186117 ) ) ( not ( = ?auto_186112 ?auto_186118 ) ) ( not ( = ?auto_186112 ?auto_186119 ) ) ( not ( = ?auto_186113 ?auto_186118 ) ) ( not ( = ?auto_186113 ?auto_186119 ) ) ( not ( = ?auto_186114 ?auto_186118 ) ) ( not ( = ?auto_186114 ?auto_186119 ) ) ( not ( = ?auto_186116 ?auto_186118 ) ) ( not ( = ?auto_186116 ?auto_186119 ) ) ( not ( = ?auto_186115 ?auto_186118 ) ) ( not ( = ?auto_186115 ?auto_186119 ) ) ( ON ?auto_186117 ?auto_186115 ) ( CLEAR ?auto_186117 ) ( HOLDING ?auto_186118 ) ( CLEAR ?auto_186119 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186119 ?auto_186118 )
      ( MAKE-3PILE ?auto_186112 ?auto_186113 ?auto_186114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186120 - BLOCK
      ?auto_186121 - BLOCK
      ?auto_186122 - BLOCK
    )
    :vars
    (
      ?auto_186123 - BLOCK
      ?auto_186126 - BLOCK
      ?auto_186127 - BLOCK
      ?auto_186124 - BLOCK
      ?auto_186125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186123 ?auto_186122 ) ( ON-TABLE ?auto_186120 ) ( ON ?auto_186121 ?auto_186120 ) ( ON ?auto_186122 ?auto_186121 ) ( not ( = ?auto_186120 ?auto_186121 ) ) ( not ( = ?auto_186120 ?auto_186122 ) ) ( not ( = ?auto_186120 ?auto_186123 ) ) ( not ( = ?auto_186121 ?auto_186122 ) ) ( not ( = ?auto_186121 ?auto_186123 ) ) ( not ( = ?auto_186122 ?auto_186123 ) ) ( not ( = ?auto_186120 ?auto_186126 ) ) ( not ( = ?auto_186120 ?auto_186127 ) ) ( not ( = ?auto_186121 ?auto_186126 ) ) ( not ( = ?auto_186121 ?auto_186127 ) ) ( not ( = ?auto_186122 ?auto_186126 ) ) ( not ( = ?auto_186122 ?auto_186127 ) ) ( not ( = ?auto_186123 ?auto_186126 ) ) ( not ( = ?auto_186123 ?auto_186127 ) ) ( not ( = ?auto_186126 ?auto_186127 ) ) ( ON ?auto_186126 ?auto_186123 ) ( ON-TABLE ?auto_186124 ) ( not ( = ?auto_186124 ?auto_186125 ) ) ( not ( = ?auto_186124 ?auto_186127 ) ) ( not ( = ?auto_186125 ?auto_186127 ) ) ( not ( = ?auto_186120 ?auto_186125 ) ) ( not ( = ?auto_186120 ?auto_186124 ) ) ( not ( = ?auto_186121 ?auto_186125 ) ) ( not ( = ?auto_186121 ?auto_186124 ) ) ( not ( = ?auto_186122 ?auto_186125 ) ) ( not ( = ?auto_186122 ?auto_186124 ) ) ( not ( = ?auto_186123 ?auto_186125 ) ) ( not ( = ?auto_186123 ?auto_186124 ) ) ( not ( = ?auto_186126 ?auto_186125 ) ) ( not ( = ?auto_186126 ?auto_186124 ) ) ( ON ?auto_186127 ?auto_186126 ) ( CLEAR ?auto_186124 ) ( ON ?auto_186125 ?auto_186127 ) ( CLEAR ?auto_186125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186120 ?auto_186121 ?auto_186122 ?auto_186123 ?auto_186126 ?auto_186127 )
      ( MAKE-3PILE ?auto_186120 ?auto_186121 ?auto_186122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186128 - BLOCK
      ?auto_186129 - BLOCK
      ?auto_186130 - BLOCK
    )
    :vars
    (
      ?auto_186133 - BLOCK
      ?auto_186134 - BLOCK
      ?auto_186135 - BLOCK
      ?auto_186132 - BLOCK
      ?auto_186131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186133 ?auto_186130 ) ( ON-TABLE ?auto_186128 ) ( ON ?auto_186129 ?auto_186128 ) ( ON ?auto_186130 ?auto_186129 ) ( not ( = ?auto_186128 ?auto_186129 ) ) ( not ( = ?auto_186128 ?auto_186130 ) ) ( not ( = ?auto_186128 ?auto_186133 ) ) ( not ( = ?auto_186129 ?auto_186130 ) ) ( not ( = ?auto_186129 ?auto_186133 ) ) ( not ( = ?auto_186130 ?auto_186133 ) ) ( not ( = ?auto_186128 ?auto_186134 ) ) ( not ( = ?auto_186128 ?auto_186135 ) ) ( not ( = ?auto_186129 ?auto_186134 ) ) ( not ( = ?auto_186129 ?auto_186135 ) ) ( not ( = ?auto_186130 ?auto_186134 ) ) ( not ( = ?auto_186130 ?auto_186135 ) ) ( not ( = ?auto_186133 ?auto_186134 ) ) ( not ( = ?auto_186133 ?auto_186135 ) ) ( not ( = ?auto_186134 ?auto_186135 ) ) ( ON ?auto_186134 ?auto_186133 ) ( not ( = ?auto_186132 ?auto_186131 ) ) ( not ( = ?auto_186132 ?auto_186135 ) ) ( not ( = ?auto_186131 ?auto_186135 ) ) ( not ( = ?auto_186128 ?auto_186131 ) ) ( not ( = ?auto_186128 ?auto_186132 ) ) ( not ( = ?auto_186129 ?auto_186131 ) ) ( not ( = ?auto_186129 ?auto_186132 ) ) ( not ( = ?auto_186130 ?auto_186131 ) ) ( not ( = ?auto_186130 ?auto_186132 ) ) ( not ( = ?auto_186133 ?auto_186131 ) ) ( not ( = ?auto_186133 ?auto_186132 ) ) ( not ( = ?auto_186134 ?auto_186131 ) ) ( not ( = ?auto_186134 ?auto_186132 ) ) ( ON ?auto_186135 ?auto_186134 ) ( ON ?auto_186131 ?auto_186135 ) ( CLEAR ?auto_186131 ) ( HOLDING ?auto_186132 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186132 )
      ( MAKE-3PILE ?auto_186128 ?auto_186129 ?auto_186130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186136 - BLOCK
      ?auto_186137 - BLOCK
      ?auto_186138 - BLOCK
    )
    :vars
    (
      ?auto_186140 - BLOCK
      ?auto_186142 - BLOCK
      ?auto_186139 - BLOCK
      ?auto_186141 - BLOCK
      ?auto_186143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186140 ?auto_186138 ) ( ON-TABLE ?auto_186136 ) ( ON ?auto_186137 ?auto_186136 ) ( ON ?auto_186138 ?auto_186137 ) ( not ( = ?auto_186136 ?auto_186137 ) ) ( not ( = ?auto_186136 ?auto_186138 ) ) ( not ( = ?auto_186136 ?auto_186140 ) ) ( not ( = ?auto_186137 ?auto_186138 ) ) ( not ( = ?auto_186137 ?auto_186140 ) ) ( not ( = ?auto_186138 ?auto_186140 ) ) ( not ( = ?auto_186136 ?auto_186142 ) ) ( not ( = ?auto_186136 ?auto_186139 ) ) ( not ( = ?auto_186137 ?auto_186142 ) ) ( not ( = ?auto_186137 ?auto_186139 ) ) ( not ( = ?auto_186138 ?auto_186142 ) ) ( not ( = ?auto_186138 ?auto_186139 ) ) ( not ( = ?auto_186140 ?auto_186142 ) ) ( not ( = ?auto_186140 ?auto_186139 ) ) ( not ( = ?auto_186142 ?auto_186139 ) ) ( ON ?auto_186142 ?auto_186140 ) ( not ( = ?auto_186141 ?auto_186143 ) ) ( not ( = ?auto_186141 ?auto_186139 ) ) ( not ( = ?auto_186143 ?auto_186139 ) ) ( not ( = ?auto_186136 ?auto_186143 ) ) ( not ( = ?auto_186136 ?auto_186141 ) ) ( not ( = ?auto_186137 ?auto_186143 ) ) ( not ( = ?auto_186137 ?auto_186141 ) ) ( not ( = ?auto_186138 ?auto_186143 ) ) ( not ( = ?auto_186138 ?auto_186141 ) ) ( not ( = ?auto_186140 ?auto_186143 ) ) ( not ( = ?auto_186140 ?auto_186141 ) ) ( not ( = ?auto_186142 ?auto_186143 ) ) ( not ( = ?auto_186142 ?auto_186141 ) ) ( ON ?auto_186139 ?auto_186142 ) ( ON ?auto_186143 ?auto_186139 ) ( ON ?auto_186141 ?auto_186143 ) ( CLEAR ?auto_186141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186136 ?auto_186137 ?auto_186138 ?auto_186140 ?auto_186142 ?auto_186139 ?auto_186143 )
      ( MAKE-3PILE ?auto_186136 ?auto_186137 ?auto_186138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186144 - BLOCK
      ?auto_186145 - BLOCK
      ?auto_186146 - BLOCK
    )
    :vars
    (
      ?auto_186149 - BLOCK
      ?auto_186150 - BLOCK
      ?auto_186151 - BLOCK
      ?auto_186148 - BLOCK
      ?auto_186147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186149 ?auto_186146 ) ( ON-TABLE ?auto_186144 ) ( ON ?auto_186145 ?auto_186144 ) ( ON ?auto_186146 ?auto_186145 ) ( not ( = ?auto_186144 ?auto_186145 ) ) ( not ( = ?auto_186144 ?auto_186146 ) ) ( not ( = ?auto_186144 ?auto_186149 ) ) ( not ( = ?auto_186145 ?auto_186146 ) ) ( not ( = ?auto_186145 ?auto_186149 ) ) ( not ( = ?auto_186146 ?auto_186149 ) ) ( not ( = ?auto_186144 ?auto_186150 ) ) ( not ( = ?auto_186144 ?auto_186151 ) ) ( not ( = ?auto_186145 ?auto_186150 ) ) ( not ( = ?auto_186145 ?auto_186151 ) ) ( not ( = ?auto_186146 ?auto_186150 ) ) ( not ( = ?auto_186146 ?auto_186151 ) ) ( not ( = ?auto_186149 ?auto_186150 ) ) ( not ( = ?auto_186149 ?auto_186151 ) ) ( not ( = ?auto_186150 ?auto_186151 ) ) ( ON ?auto_186150 ?auto_186149 ) ( not ( = ?auto_186148 ?auto_186147 ) ) ( not ( = ?auto_186148 ?auto_186151 ) ) ( not ( = ?auto_186147 ?auto_186151 ) ) ( not ( = ?auto_186144 ?auto_186147 ) ) ( not ( = ?auto_186144 ?auto_186148 ) ) ( not ( = ?auto_186145 ?auto_186147 ) ) ( not ( = ?auto_186145 ?auto_186148 ) ) ( not ( = ?auto_186146 ?auto_186147 ) ) ( not ( = ?auto_186146 ?auto_186148 ) ) ( not ( = ?auto_186149 ?auto_186147 ) ) ( not ( = ?auto_186149 ?auto_186148 ) ) ( not ( = ?auto_186150 ?auto_186147 ) ) ( not ( = ?auto_186150 ?auto_186148 ) ) ( ON ?auto_186151 ?auto_186150 ) ( ON ?auto_186147 ?auto_186151 ) ( HOLDING ?auto_186148 ) ( CLEAR ?auto_186147 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186144 ?auto_186145 ?auto_186146 ?auto_186149 ?auto_186150 ?auto_186151 ?auto_186147 ?auto_186148 )
      ( MAKE-3PILE ?auto_186144 ?auto_186145 ?auto_186146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186152 - BLOCK
      ?auto_186153 - BLOCK
      ?auto_186154 - BLOCK
    )
    :vars
    (
      ?auto_186157 - BLOCK
      ?auto_186156 - BLOCK
      ?auto_186155 - BLOCK
      ?auto_186158 - BLOCK
      ?auto_186159 - BLOCK
      ?auto_186160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186157 ?auto_186154 ) ( ON-TABLE ?auto_186152 ) ( ON ?auto_186153 ?auto_186152 ) ( ON ?auto_186154 ?auto_186153 ) ( not ( = ?auto_186152 ?auto_186153 ) ) ( not ( = ?auto_186152 ?auto_186154 ) ) ( not ( = ?auto_186152 ?auto_186157 ) ) ( not ( = ?auto_186153 ?auto_186154 ) ) ( not ( = ?auto_186153 ?auto_186157 ) ) ( not ( = ?auto_186154 ?auto_186157 ) ) ( not ( = ?auto_186152 ?auto_186156 ) ) ( not ( = ?auto_186152 ?auto_186155 ) ) ( not ( = ?auto_186153 ?auto_186156 ) ) ( not ( = ?auto_186153 ?auto_186155 ) ) ( not ( = ?auto_186154 ?auto_186156 ) ) ( not ( = ?auto_186154 ?auto_186155 ) ) ( not ( = ?auto_186157 ?auto_186156 ) ) ( not ( = ?auto_186157 ?auto_186155 ) ) ( not ( = ?auto_186156 ?auto_186155 ) ) ( ON ?auto_186156 ?auto_186157 ) ( not ( = ?auto_186158 ?auto_186159 ) ) ( not ( = ?auto_186158 ?auto_186155 ) ) ( not ( = ?auto_186159 ?auto_186155 ) ) ( not ( = ?auto_186152 ?auto_186159 ) ) ( not ( = ?auto_186152 ?auto_186158 ) ) ( not ( = ?auto_186153 ?auto_186159 ) ) ( not ( = ?auto_186153 ?auto_186158 ) ) ( not ( = ?auto_186154 ?auto_186159 ) ) ( not ( = ?auto_186154 ?auto_186158 ) ) ( not ( = ?auto_186157 ?auto_186159 ) ) ( not ( = ?auto_186157 ?auto_186158 ) ) ( not ( = ?auto_186156 ?auto_186159 ) ) ( not ( = ?auto_186156 ?auto_186158 ) ) ( ON ?auto_186155 ?auto_186156 ) ( ON ?auto_186159 ?auto_186155 ) ( CLEAR ?auto_186159 ) ( ON ?auto_186158 ?auto_186160 ) ( CLEAR ?auto_186158 ) ( HAND-EMPTY ) ( not ( = ?auto_186152 ?auto_186160 ) ) ( not ( = ?auto_186153 ?auto_186160 ) ) ( not ( = ?auto_186154 ?auto_186160 ) ) ( not ( = ?auto_186157 ?auto_186160 ) ) ( not ( = ?auto_186156 ?auto_186160 ) ) ( not ( = ?auto_186155 ?auto_186160 ) ) ( not ( = ?auto_186158 ?auto_186160 ) ) ( not ( = ?auto_186159 ?auto_186160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186158 ?auto_186160 )
      ( MAKE-3PILE ?auto_186152 ?auto_186153 ?auto_186154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186161 - BLOCK
      ?auto_186162 - BLOCK
      ?auto_186163 - BLOCK
    )
    :vars
    (
      ?auto_186166 - BLOCK
      ?auto_186167 - BLOCK
      ?auto_186164 - BLOCK
      ?auto_186168 - BLOCK
      ?auto_186169 - BLOCK
      ?auto_186165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186166 ?auto_186163 ) ( ON-TABLE ?auto_186161 ) ( ON ?auto_186162 ?auto_186161 ) ( ON ?auto_186163 ?auto_186162 ) ( not ( = ?auto_186161 ?auto_186162 ) ) ( not ( = ?auto_186161 ?auto_186163 ) ) ( not ( = ?auto_186161 ?auto_186166 ) ) ( not ( = ?auto_186162 ?auto_186163 ) ) ( not ( = ?auto_186162 ?auto_186166 ) ) ( not ( = ?auto_186163 ?auto_186166 ) ) ( not ( = ?auto_186161 ?auto_186167 ) ) ( not ( = ?auto_186161 ?auto_186164 ) ) ( not ( = ?auto_186162 ?auto_186167 ) ) ( not ( = ?auto_186162 ?auto_186164 ) ) ( not ( = ?auto_186163 ?auto_186167 ) ) ( not ( = ?auto_186163 ?auto_186164 ) ) ( not ( = ?auto_186166 ?auto_186167 ) ) ( not ( = ?auto_186166 ?auto_186164 ) ) ( not ( = ?auto_186167 ?auto_186164 ) ) ( ON ?auto_186167 ?auto_186166 ) ( not ( = ?auto_186168 ?auto_186169 ) ) ( not ( = ?auto_186168 ?auto_186164 ) ) ( not ( = ?auto_186169 ?auto_186164 ) ) ( not ( = ?auto_186161 ?auto_186169 ) ) ( not ( = ?auto_186161 ?auto_186168 ) ) ( not ( = ?auto_186162 ?auto_186169 ) ) ( not ( = ?auto_186162 ?auto_186168 ) ) ( not ( = ?auto_186163 ?auto_186169 ) ) ( not ( = ?auto_186163 ?auto_186168 ) ) ( not ( = ?auto_186166 ?auto_186169 ) ) ( not ( = ?auto_186166 ?auto_186168 ) ) ( not ( = ?auto_186167 ?auto_186169 ) ) ( not ( = ?auto_186167 ?auto_186168 ) ) ( ON ?auto_186164 ?auto_186167 ) ( ON ?auto_186168 ?auto_186165 ) ( CLEAR ?auto_186168 ) ( not ( = ?auto_186161 ?auto_186165 ) ) ( not ( = ?auto_186162 ?auto_186165 ) ) ( not ( = ?auto_186163 ?auto_186165 ) ) ( not ( = ?auto_186166 ?auto_186165 ) ) ( not ( = ?auto_186167 ?auto_186165 ) ) ( not ( = ?auto_186164 ?auto_186165 ) ) ( not ( = ?auto_186168 ?auto_186165 ) ) ( not ( = ?auto_186169 ?auto_186165 ) ) ( HOLDING ?auto_186169 ) ( CLEAR ?auto_186164 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186161 ?auto_186162 ?auto_186163 ?auto_186166 ?auto_186167 ?auto_186164 ?auto_186169 )
      ( MAKE-3PILE ?auto_186161 ?auto_186162 ?auto_186163 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186170 - BLOCK
      ?auto_186171 - BLOCK
      ?auto_186172 - BLOCK
    )
    :vars
    (
      ?auto_186175 - BLOCK
      ?auto_186174 - BLOCK
      ?auto_186173 - BLOCK
      ?auto_186177 - BLOCK
      ?auto_186178 - BLOCK
      ?auto_186176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186175 ?auto_186172 ) ( ON-TABLE ?auto_186170 ) ( ON ?auto_186171 ?auto_186170 ) ( ON ?auto_186172 ?auto_186171 ) ( not ( = ?auto_186170 ?auto_186171 ) ) ( not ( = ?auto_186170 ?auto_186172 ) ) ( not ( = ?auto_186170 ?auto_186175 ) ) ( not ( = ?auto_186171 ?auto_186172 ) ) ( not ( = ?auto_186171 ?auto_186175 ) ) ( not ( = ?auto_186172 ?auto_186175 ) ) ( not ( = ?auto_186170 ?auto_186174 ) ) ( not ( = ?auto_186170 ?auto_186173 ) ) ( not ( = ?auto_186171 ?auto_186174 ) ) ( not ( = ?auto_186171 ?auto_186173 ) ) ( not ( = ?auto_186172 ?auto_186174 ) ) ( not ( = ?auto_186172 ?auto_186173 ) ) ( not ( = ?auto_186175 ?auto_186174 ) ) ( not ( = ?auto_186175 ?auto_186173 ) ) ( not ( = ?auto_186174 ?auto_186173 ) ) ( ON ?auto_186174 ?auto_186175 ) ( not ( = ?auto_186177 ?auto_186178 ) ) ( not ( = ?auto_186177 ?auto_186173 ) ) ( not ( = ?auto_186178 ?auto_186173 ) ) ( not ( = ?auto_186170 ?auto_186178 ) ) ( not ( = ?auto_186170 ?auto_186177 ) ) ( not ( = ?auto_186171 ?auto_186178 ) ) ( not ( = ?auto_186171 ?auto_186177 ) ) ( not ( = ?auto_186172 ?auto_186178 ) ) ( not ( = ?auto_186172 ?auto_186177 ) ) ( not ( = ?auto_186175 ?auto_186178 ) ) ( not ( = ?auto_186175 ?auto_186177 ) ) ( not ( = ?auto_186174 ?auto_186178 ) ) ( not ( = ?auto_186174 ?auto_186177 ) ) ( ON ?auto_186173 ?auto_186174 ) ( ON ?auto_186177 ?auto_186176 ) ( not ( = ?auto_186170 ?auto_186176 ) ) ( not ( = ?auto_186171 ?auto_186176 ) ) ( not ( = ?auto_186172 ?auto_186176 ) ) ( not ( = ?auto_186175 ?auto_186176 ) ) ( not ( = ?auto_186174 ?auto_186176 ) ) ( not ( = ?auto_186173 ?auto_186176 ) ) ( not ( = ?auto_186177 ?auto_186176 ) ) ( not ( = ?auto_186178 ?auto_186176 ) ) ( CLEAR ?auto_186173 ) ( ON ?auto_186178 ?auto_186177 ) ( CLEAR ?auto_186178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186176 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186176 ?auto_186177 )
      ( MAKE-3PILE ?auto_186170 ?auto_186171 ?auto_186172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186179 - BLOCK
      ?auto_186180 - BLOCK
      ?auto_186181 - BLOCK
    )
    :vars
    (
      ?auto_186182 - BLOCK
      ?auto_186183 - BLOCK
      ?auto_186187 - BLOCK
      ?auto_186184 - BLOCK
      ?auto_186185 - BLOCK
      ?auto_186186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186182 ?auto_186181 ) ( ON-TABLE ?auto_186179 ) ( ON ?auto_186180 ?auto_186179 ) ( ON ?auto_186181 ?auto_186180 ) ( not ( = ?auto_186179 ?auto_186180 ) ) ( not ( = ?auto_186179 ?auto_186181 ) ) ( not ( = ?auto_186179 ?auto_186182 ) ) ( not ( = ?auto_186180 ?auto_186181 ) ) ( not ( = ?auto_186180 ?auto_186182 ) ) ( not ( = ?auto_186181 ?auto_186182 ) ) ( not ( = ?auto_186179 ?auto_186183 ) ) ( not ( = ?auto_186179 ?auto_186187 ) ) ( not ( = ?auto_186180 ?auto_186183 ) ) ( not ( = ?auto_186180 ?auto_186187 ) ) ( not ( = ?auto_186181 ?auto_186183 ) ) ( not ( = ?auto_186181 ?auto_186187 ) ) ( not ( = ?auto_186182 ?auto_186183 ) ) ( not ( = ?auto_186182 ?auto_186187 ) ) ( not ( = ?auto_186183 ?auto_186187 ) ) ( ON ?auto_186183 ?auto_186182 ) ( not ( = ?auto_186184 ?auto_186185 ) ) ( not ( = ?auto_186184 ?auto_186187 ) ) ( not ( = ?auto_186185 ?auto_186187 ) ) ( not ( = ?auto_186179 ?auto_186185 ) ) ( not ( = ?auto_186179 ?auto_186184 ) ) ( not ( = ?auto_186180 ?auto_186185 ) ) ( not ( = ?auto_186180 ?auto_186184 ) ) ( not ( = ?auto_186181 ?auto_186185 ) ) ( not ( = ?auto_186181 ?auto_186184 ) ) ( not ( = ?auto_186182 ?auto_186185 ) ) ( not ( = ?auto_186182 ?auto_186184 ) ) ( not ( = ?auto_186183 ?auto_186185 ) ) ( not ( = ?auto_186183 ?auto_186184 ) ) ( ON ?auto_186184 ?auto_186186 ) ( not ( = ?auto_186179 ?auto_186186 ) ) ( not ( = ?auto_186180 ?auto_186186 ) ) ( not ( = ?auto_186181 ?auto_186186 ) ) ( not ( = ?auto_186182 ?auto_186186 ) ) ( not ( = ?auto_186183 ?auto_186186 ) ) ( not ( = ?auto_186187 ?auto_186186 ) ) ( not ( = ?auto_186184 ?auto_186186 ) ) ( not ( = ?auto_186185 ?auto_186186 ) ) ( ON ?auto_186185 ?auto_186184 ) ( CLEAR ?auto_186185 ) ( ON-TABLE ?auto_186186 ) ( HOLDING ?auto_186187 ) ( CLEAR ?auto_186183 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186179 ?auto_186180 ?auto_186181 ?auto_186182 ?auto_186183 ?auto_186187 )
      ( MAKE-3PILE ?auto_186179 ?auto_186180 ?auto_186181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186188 - BLOCK
      ?auto_186189 - BLOCK
      ?auto_186190 - BLOCK
    )
    :vars
    (
      ?auto_186195 - BLOCK
      ?auto_186194 - BLOCK
      ?auto_186192 - BLOCK
      ?auto_186191 - BLOCK
      ?auto_186193 - BLOCK
      ?auto_186196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186195 ?auto_186190 ) ( ON-TABLE ?auto_186188 ) ( ON ?auto_186189 ?auto_186188 ) ( ON ?auto_186190 ?auto_186189 ) ( not ( = ?auto_186188 ?auto_186189 ) ) ( not ( = ?auto_186188 ?auto_186190 ) ) ( not ( = ?auto_186188 ?auto_186195 ) ) ( not ( = ?auto_186189 ?auto_186190 ) ) ( not ( = ?auto_186189 ?auto_186195 ) ) ( not ( = ?auto_186190 ?auto_186195 ) ) ( not ( = ?auto_186188 ?auto_186194 ) ) ( not ( = ?auto_186188 ?auto_186192 ) ) ( not ( = ?auto_186189 ?auto_186194 ) ) ( not ( = ?auto_186189 ?auto_186192 ) ) ( not ( = ?auto_186190 ?auto_186194 ) ) ( not ( = ?auto_186190 ?auto_186192 ) ) ( not ( = ?auto_186195 ?auto_186194 ) ) ( not ( = ?auto_186195 ?auto_186192 ) ) ( not ( = ?auto_186194 ?auto_186192 ) ) ( ON ?auto_186194 ?auto_186195 ) ( not ( = ?auto_186191 ?auto_186193 ) ) ( not ( = ?auto_186191 ?auto_186192 ) ) ( not ( = ?auto_186193 ?auto_186192 ) ) ( not ( = ?auto_186188 ?auto_186193 ) ) ( not ( = ?auto_186188 ?auto_186191 ) ) ( not ( = ?auto_186189 ?auto_186193 ) ) ( not ( = ?auto_186189 ?auto_186191 ) ) ( not ( = ?auto_186190 ?auto_186193 ) ) ( not ( = ?auto_186190 ?auto_186191 ) ) ( not ( = ?auto_186195 ?auto_186193 ) ) ( not ( = ?auto_186195 ?auto_186191 ) ) ( not ( = ?auto_186194 ?auto_186193 ) ) ( not ( = ?auto_186194 ?auto_186191 ) ) ( ON ?auto_186191 ?auto_186196 ) ( not ( = ?auto_186188 ?auto_186196 ) ) ( not ( = ?auto_186189 ?auto_186196 ) ) ( not ( = ?auto_186190 ?auto_186196 ) ) ( not ( = ?auto_186195 ?auto_186196 ) ) ( not ( = ?auto_186194 ?auto_186196 ) ) ( not ( = ?auto_186192 ?auto_186196 ) ) ( not ( = ?auto_186191 ?auto_186196 ) ) ( not ( = ?auto_186193 ?auto_186196 ) ) ( ON ?auto_186193 ?auto_186191 ) ( ON-TABLE ?auto_186196 ) ( CLEAR ?auto_186194 ) ( ON ?auto_186192 ?auto_186193 ) ( CLEAR ?auto_186192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186196 ?auto_186191 ?auto_186193 )
      ( MAKE-3PILE ?auto_186188 ?auto_186189 ?auto_186190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186197 - BLOCK
      ?auto_186198 - BLOCK
      ?auto_186199 - BLOCK
    )
    :vars
    (
      ?auto_186200 - BLOCK
      ?auto_186202 - BLOCK
      ?auto_186205 - BLOCK
      ?auto_186203 - BLOCK
      ?auto_186204 - BLOCK
      ?auto_186201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186200 ?auto_186199 ) ( ON-TABLE ?auto_186197 ) ( ON ?auto_186198 ?auto_186197 ) ( ON ?auto_186199 ?auto_186198 ) ( not ( = ?auto_186197 ?auto_186198 ) ) ( not ( = ?auto_186197 ?auto_186199 ) ) ( not ( = ?auto_186197 ?auto_186200 ) ) ( not ( = ?auto_186198 ?auto_186199 ) ) ( not ( = ?auto_186198 ?auto_186200 ) ) ( not ( = ?auto_186199 ?auto_186200 ) ) ( not ( = ?auto_186197 ?auto_186202 ) ) ( not ( = ?auto_186197 ?auto_186205 ) ) ( not ( = ?auto_186198 ?auto_186202 ) ) ( not ( = ?auto_186198 ?auto_186205 ) ) ( not ( = ?auto_186199 ?auto_186202 ) ) ( not ( = ?auto_186199 ?auto_186205 ) ) ( not ( = ?auto_186200 ?auto_186202 ) ) ( not ( = ?auto_186200 ?auto_186205 ) ) ( not ( = ?auto_186202 ?auto_186205 ) ) ( not ( = ?auto_186203 ?auto_186204 ) ) ( not ( = ?auto_186203 ?auto_186205 ) ) ( not ( = ?auto_186204 ?auto_186205 ) ) ( not ( = ?auto_186197 ?auto_186204 ) ) ( not ( = ?auto_186197 ?auto_186203 ) ) ( not ( = ?auto_186198 ?auto_186204 ) ) ( not ( = ?auto_186198 ?auto_186203 ) ) ( not ( = ?auto_186199 ?auto_186204 ) ) ( not ( = ?auto_186199 ?auto_186203 ) ) ( not ( = ?auto_186200 ?auto_186204 ) ) ( not ( = ?auto_186200 ?auto_186203 ) ) ( not ( = ?auto_186202 ?auto_186204 ) ) ( not ( = ?auto_186202 ?auto_186203 ) ) ( ON ?auto_186203 ?auto_186201 ) ( not ( = ?auto_186197 ?auto_186201 ) ) ( not ( = ?auto_186198 ?auto_186201 ) ) ( not ( = ?auto_186199 ?auto_186201 ) ) ( not ( = ?auto_186200 ?auto_186201 ) ) ( not ( = ?auto_186202 ?auto_186201 ) ) ( not ( = ?auto_186205 ?auto_186201 ) ) ( not ( = ?auto_186203 ?auto_186201 ) ) ( not ( = ?auto_186204 ?auto_186201 ) ) ( ON ?auto_186204 ?auto_186203 ) ( ON-TABLE ?auto_186201 ) ( ON ?auto_186205 ?auto_186204 ) ( CLEAR ?auto_186205 ) ( HOLDING ?auto_186202 ) ( CLEAR ?auto_186200 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186197 ?auto_186198 ?auto_186199 ?auto_186200 ?auto_186202 )
      ( MAKE-3PILE ?auto_186197 ?auto_186198 ?auto_186199 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186206 - BLOCK
      ?auto_186207 - BLOCK
      ?auto_186208 - BLOCK
    )
    :vars
    (
      ?auto_186211 - BLOCK
      ?auto_186210 - BLOCK
      ?auto_186209 - BLOCK
      ?auto_186213 - BLOCK
      ?auto_186212 - BLOCK
      ?auto_186214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186211 ?auto_186208 ) ( ON-TABLE ?auto_186206 ) ( ON ?auto_186207 ?auto_186206 ) ( ON ?auto_186208 ?auto_186207 ) ( not ( = ?auto_186206 ?auto_186207 ) ) ( not ( = ?auto_186206 ?auto_186208 ) ) ( not ( = ?auto_186206 ?auto_186211 ) ) ( not ( = ?auto_186207 ?auto_186208 ) ) ( not ( = ?auto_186207 ?auto_186211 ) ) ( not ( = ?auto_186208 ?auto_186211 ) ) ( not ( = ?auto_186206 ?auto_186210 ) ) ( not ( = ?auto_186206 ?auto_186209 ) ) ( not ( = ?auto_186207 ?auto_186210 ) ) ( not ( = ?auto_186207 ?auto_186209 ) ) ( not ( = ?auto_186208 ?auto_186210 ) ) ( not ( = ?auto_186208 ?auto_186209 ) ) ( not ( = ?auto_186211 ?auto_186210 ) ) ( not ( = ?auto_186211 ?auto_186209 ) ) ( not ( = ?auto_186210 ?auto_186209 ) ) ( not ( = ?auto_186213 ?auto_186212 ) ) ( not ( = ?auto_186213 ?auto_186209 ) ) ( not ( = ?auto_186212 ?auto_186209 ) ) ( not ( = ?auto_186206 ?auto_186212 ) ) ( not ( = ?auto_186206 ?auto_186213 ) ) ( not ( = ?auto_186207 ?auto_186212 ) ) ( not ( = ?auto_186207 ?auto_186213 ) ) ( not ( = ?auto_186208 ?auto_186212 ) ) ( not ( = ?auto_186208 ?auto_186213 ) ) ( not ( = ?auto_186211 ?auto_186212 ) ) ( not ( = ?auto_186211 ?auto_186213 ) ) ( not ( = ?auto_186210 ?auto_186212 ) ) ( not ( = ?auto_186210 ?auto_186213 ) ) ( ON ?auto_186213 ?auto_186214 ) ( not ( = ?auto_186206 ?auto_186214 ) ) ( not ( = ?auto_186207 ?auto_186214 ) ) ( not ( = ?auto_186208 ?auto_186214 ) ) ( not ( = ?auto_186211 ?auto_186214 ) ) ( not ( = ?auto_186210 ?auto_186214 ) ) ( not ( = ?auto_186209 ?auto_186214 ) ) ( not ( = ?auto_186213 ?auto_186214 ) ) ( not ( = ?auto_186212 ?auto_186214 ) ) ( ON ?auto_186212 ?auto_186213 ) ( ON-TABLE ?auto_186214 ) ( ON ?auto_186209 ?auto_186212 ) ( CLEAR ?auto_186211 ) ( ON ?auto_186210 ?auto_186209 ) ( CLEAR ?auto_186210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186214 ?auto_186213 ?auto_186212 ?auto_186209 )
      ( MAKE-3PILE ?auto_186206 ?auto_186207 ?auto_186208 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186233 - BLOCK
      ?auto_186234 - BLOCK
      ?auto_186235 - BLOCK
    )
    :vars
    (
      ?auto_186241 - BLOCK
      ?auto_186236 - BLOCK
      ?auto_186240 - BLOCK
      ?auto_186239 - BLOCK
      ?auto_186238 - BLOCK
      ?auto_186237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186233 ) ( ON ?auto_186234 ?auto_186233 ) ( not ( = ?auto_186233 ?auto_186234 ) ) ( not ( = ?auto_186233 ?auto_186235 ) ) ( not ( = ?auto_186233 ?auto_186241 ) ) ( not ( = ?auto_186234 ?auto_186235 ) ) ( not ( = ?auto_186234 ?auto_186241 ) ) ( not ( = ?auto_186235 ?auto_186241 ) ) ( not ( = ?auto_186233 ?auto_186236 ) ) ( not ( = ?auto_186233 ?auto_186240 ) ) ( not ( = ?auto_186234 ?auto_186236 ) ) ( not ( = ?auto_186234 ?auto_186240 ) ) ( not ( = ?auto_186235 ?auto_186236 ) ) ( not ( = ?auto_186235 ?auto_186240 ) ) ( not ( = ?auto_186241 ?auto_186236 ) ) ( not ( = ?auto_186241 ?auto_186240 ) ) ( not ( = ?auto_186236 ?auto_186240 ) ) ( not ( = ?auto_186239 ?auto_186238 ) ) ( not ( = ?auto_186239 ?auto_186240 ) ) ( not ( = ?auto_186238 ?auto_186240 ) ) ( not ( = ?auto_186233 ?auto_186238 ) ) ( not ( = ?auto_186233 ?auto_186239 ) ) ( not ( = ?auto_186234 ?auto_186238 ) ) ( not ( = ?auto_186234 ?auto_186239 ) ) ( not ( = ?auto_186235 ?auto_186238 ) ) ( not ( = ?auto_186235 ?auto_186239 ) ) ( not ( = ?auto_186241 ?auto_186238 ) ) ( not ( = ?auto_186241 ?auto_186239 ) ) ( not ( = ?auto_186236 ?auto_186238 ) ) ( not ( = ?auto_186236 ?auto_186239 ) ) ( ON ?auto_186239 ?auto_186237 ) ( not ( = ?auto_186233 ?auto_186237 ) ) ( not ( = ?auto_186234 ?auto_186237 ) ) ( not ( = ?auto_186235 ?auto_186237 ) ) ( not ( = ?auto_186241 ?auto_186237 ) ) ( not ( = ?auto_186236 ?auto_186237 ) ) ( not ( = ?auto_186240 ?auto_186237 ) ) ( not ( = ?auto_186239 ?auto_186237 ) ) ( not ( = ?auto_186238 ?auto_186237 ) ) ( ON ?auto_186238 ?auto_186239 ) ( ON-TABLE ?auto_186237 ) ( ON ?auto_186240 ?auto_186238 ) ( ON ?auto_186236 ?auto_186240 ) ( ON ?auto_186241 ?auto_186236 ) ( CLEAR ?auto_186241 ) ( HOLDING ?auto_186235 ) ( CLEAR ?auto_186234 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186233 ?auto_186234 ?auto_186235 ?auto_186241 )
      ( MAKE-3PILE ?auto_186233 ?auto_186234 ?auto_186235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186242 - BLOCK
      ?auto_186243 - BLOCK
      ?auto_186244 - BLOCK
    )
    :vars
    (
      ?auto_186249 - BLOCK
      ?auto_186245 - BLOCK
      ?auto_186250 - BLOCK
      ?auto_186248 - BLOCK
      ?auto_186247 - BLOCK
      ?auto_186246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186242 ) ( ON ?auto_186243 ?auto_186242 ) ( not ( = ?auto_186242 ?auto_186243 ) ) ( not ( = ?auto_186242 ?auto_186244 ) ) ( not ( = ?auto_186242 ?auto_186249 ) ) ( not ( = ?auto_186243 ?auto_186244 ) ) ( not ( = ?auto_186243 ?auto_186249 ) ) ( not ( = ?auto_186244 ?auto_186249 ) ) ( not ( = ?auto_186242 ?auto_186245 ) ) ( not ( = ?auto_186242 ?auto_186250 ) ) ( not ( = ?auto_186243 ?auto_186245 ) ) ( not ( = ?auto_186243 ?auto_186250 ) ) ( not ( = ?auto_186244 ?auto_186245 ) ) ( not ( = ?auto_186244 ?auto_186250 ) ) ( not ( = ?auto_186249 ?auto_186245 ) ) ( not ( = ?auto_186249 ?auto_186250 ) ) ( not ( = ?auto_186245 ?auto_186250 ) ) ( not ( = ?auto_186248 ?auto_186247 ) ) ( not ( = ?auto_186248 ?auto_186250 ) ) ( not ( = ?auto_186247 ?auto_186250 ) ) ( not ( = ?auto_186242 ?auto_186247 ) ) ( not ( = ?auto_186242 ?auto_186248 ) ) ( not ( = ?auto_186243 ?auto_186247 ) ) ( not ( = ?auto_186243 ?auto_186248 ) ) ( not ( = ?auto_186244 ?auto_186247 ) ) ( not ( = ?auto_186244 ?auto_186248 ) ) ( not ( = ?auto_186249 ?auto_186247 ) ) ( not ( = ?auto_186249 ?auto_186248 ) ) ( not ( = ?auto_186245 ?auto_186247 ) ) ( not ( = ?auto_186245 ?auto_186248 ) ) ( ON ?auto_186248 ?auto_186246 ) ( not ( = ?auto_186242 ?auto_186246 ) ) ( not ( = ?auto_186243 ?auto_186246 ) ) ( not ( = ?auto_186244 ?auto_186246 ) ) ( not ( = ?auto_186249 ?auto_186246 ) ) ( not ( = ?auto_186245 ?auto_186246 ) ) ( not ( = ?auto_186250 ?auto_186246 ) ) ( not ( = ?auto_186248 ?auto_186246 ) ) ( not ( = ?auto_186247 ?auto_186246 ) ) ( ON ?auto_186247 ?auto_186248 ) ( ON-TABLE ?auto_186246 ) ( ON ?auto_186250 ?auto_186247 ) ( ON ?auto_186245 ?auto_186250 ) ( ON ?auto_186249 ?auto_186245 ) ( CLEAR ?auto_186243 ) ( ON ?auto_186244 ?auto_186249 ) ( CLEAR ?auto_186244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186246 ?auto_186248 ?auto_186247 ?auto_186250 ?auto_186245 ?auto_186249 )
      ( MAKE-3PILE ?auto_186242 ?auto_186243 ?auto_186244 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186251 - BLOCK
      ?auto_186252 - BLOCK
      ?auto_186253 - BLOCK
    )
    :vars
    (
      ?auto_186258 - BLOCK
      ?auto_186255 - BLOCK
      ?auto_186256 - BLOCK
      ?auto_186257 - BLOCK
      ?auto_186259 - BLOCK
      ?auto_186254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186251 ) ( not ( = ?auto_186251 ?auto_186252 ) ) ( not ( = ?auto_186251 ?auto_186253 ) ) ( not ( = ?auto_186251 ?auto_186258 ) ) ( not ( = ?auto_186252 ?auto_186253 ) ) ( not ( = ?auto_186252 ?auto_186258 ) ) ( not ( = ?auto_186253 ?auto_186258 ) ) ( not ( = ?auto_186251 ?auto_186255 ) ) ( not ( = ?auto_186251 ?auto_186256 ) ) ( not ( = ?auto_186252 ?auto_186255 ) ) ( not ( = ?auto_186252 ?auto_186256 ) ) ( not ( = ?auto_186253 ?auto_186255 ) ) ( not ( = ?auto_186253 ?auto_186256 ) ) ( not ( = ?auto_186258 ?auto_186255 ) ) ( not ( = ?auto_186258 ?auto_186256 ) ) ( not ( = ?auto_186255 ?auto_186256 ) ) ( not ( = ?auto_186257 ?auto_186259 ) ) ( not ( = ?auto_186257 ?auto_186256 ) ) ( not ( = ?auto_186259 ?auto_186256 ) ) ( not ( = ?auto_186251 ?auto_186259 ) ) ( not ( = ?auto_186251 ?auto_186257 ) ) ( not ( = ?auto_186252 ?auto_186259 ) ) ( not ( = ?auto_186252 ?auto_186257 ) ) ( not ( = ?auto_186253 ?auto_186259 ) ) ( not ( = ?auto_186253 ?auto_186257 ) ) ( not ( = ?auto_186258 ?auto_186259 ) ) ( not ( = ?auto_186258 ?auto_186257 ) ) ( not ( = ?auto_186255 ?auto_186259 ) ) ( not ( = ?auto_186255 ?auto_186257 ) ) ( ON ?auto_186257 ?auto_186254 ) ( not ( = ?auto_186251 ?auto_186254 ) ) ( not ( = ?auto_186252 ?auto_186254 ) ) ( not ( = ?auto_186253 ?auto_186254 ) ) ( not ( = ?auto_186258 ?auto_186254 ) ) ( not ( = ?auto_186255 ?auto_186254 ) ) ( not ( = ?auto_186256 ?auto_186254 ) ) ( not ( = ?auto_186257 ?auto_186254 ) ) ( not ( = ?auto_186259 ?auto_186254 ) ) ( ON ?auto_186259 ?auto_186257 ) ( ON-TABLE ?auto_186254 ) ( ON ?auto_186256 ?auto_186259 ) ( ON ?auto_186255 ?auto_186256 ) ( ON ?auto_186258 ?auto_186255 ) ( ON ?auto_186253 ?auto_186258 ) ( CLEAR ?auto_186253 ) ( HOLDING ?auto_186252 ) ( CLEAR ?auto_186251 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186251 ?auto_186252 )
      ( MAKE-3PILE ?auto_186251 ?auto_186252 ?auto_186253 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186260 - BLOCK
      ?auto_186261 - BLOCK
      ?auto_186262 - BLOCK
    )
    :vars
    (
      ?auto_186264 - BLOCK
      ?auto_186266 - BLOCK
      ?auto_186268 - BLOCK
      ?auto_186265 - BLOCK
      ?auto_186263 - BLOCK
      ?auto_186267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186260 ) ( not ( = ?auto_186260 ?auto_186261 ) ) ( not ( = ?auto_186260 ?auto_186262 ) ) ( not ( = ?auto_186260 ?auto_186264 ) ) ( not ( = ?auto_186261 ?auto_186262 ) ) ( not ( = ?auto_186261 ?auto_186264 ) ) ( not ( = ?auto_186262 ?auto_186264 ) ) ( not ( = ?auto_186260 ?auto_186266 ) ) ( not ( = ?auto_186260 ?auto_186268 ) ) ( not ( = ?auto_186261 ?auto_186266 ) ) ( not ( = ?auto_186261 ?auto_186268 ) ) ( not ( = ?auto_186262 ?auto_186266 ) ) ( not ( = ?auto_186262 ?auto_186268 ) ) ( not ( = ?auto_186264 ?auto_186266 ) ) ( not ( = ?auto_186264 ?auto_186268 ) ) ( not ( = ?auto_186266 ?auto_186268 ) ) ( not ( = ?auto_186265 ?auto_186263 ) ) ( not ( = ?auto_186265 ?auto_186268 ) ) ( not ( = ?auto_186263 ?auto_186268 ) ) ( not ( = ?auto_186260 ?auto_186263 ) ) ( not ( = ?auto_186260 ?auto_186265 ) ) ( not ( = ?auto_186261 ?auto_186263 ) ) ( not ( = ?auto_186261 ?auto_186265 ) ) ( not ( = ?auto_186262 ?auto_186263 ) ) ( not ( = ?auto_186262 ?auto_186265 ) ) ( not ( = ?auto_186264 ?auto_186263 ) ) ( not ( = ?auto_186264 ?auto_186265 ) ) ( not ( = ?auto_186266 ?auto_186263 ) ) ( not ( = ?auto_186266 ?auto_186265 ) ) ( ON ?auto_186265 ?auto_186267 ) ( not ( = ?auto_186260 ?auto_186267 ) ) ( not ( = ?auto_186261 ?auto_186267 ) ) ( not ( = ?auto_186262 ?auto_186267 ) ) ( not ( = ?auto_186264 ?auto_186267 ) ) ( not ( = ?auto_186266 ?auto_186267 ) ) ( not ( = ?auto_186268 ?auto_186267 ) ) ( not ( = ?auto_186265 ?auto_186267 ) ) ( not ( = ?auto_186263 ?auto_186267 ) ) ( ON ?auto_186263 ?auto_186265 ) ( ON-TABLE ?auto_186267 ) ( ON ?auto_186268 ?auto_186263 ) ( ON ?auto_186266 ?auto_186268 ) ( ON ?auto_186264 ?auto_186266 ) ( ON ?auto_186262 ?auto_186264 ) ( CLEAR ?auto_186260 ) ( ON ?auto_186261 ?auto_186262 ) ( CLEAR ?auto_186261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186267 ?auto_186265 ?auto_186263 ?auto_186268 ?auto_186266 ?auto_186264 ?auto_186262 )
      ( MAKE-3PILE ?auto_186260 ?auto_186261 ?auto_186262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186269 - BLOCK
      ?auto_186270 - BLOCK
      ?auto_186271 - BLOCK
    )
    :vars
    (
      ?auto_186272 - BLOCK
      ?auto_186273 - BLOCK
      ?auto_186275 - BLOCK
      ?auto_186274 - BLOCK
      ?auto_186277 - BLOCK
      ?auto_186276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186269 ?auto_186270 ) ) ( not ( = ?auto_186269 ?auto_186271 ) ) ( not ( = ?auto_186269 ?auto_186272 ) ) ( not ( = ?auto_186270 ?auto_186271 ) ) ( not ( = ?auto_186270 ?auto_186272 ) ) ( not ( = ?auto_186271 ?auto_186272 ) ) ( not ( = ?auto_186269 ?auto_186273 ) ) ( not ( = ?auto_186269 ?auto_186275 ) ) ( not ( = ?auto_186270 ?auto_186273 ) ) ( not ( = ?auto_186270 ?auto_186275 ) ) ( not ( = ?auto_186271 ?auto_186273 ) ) ( not ( = ?auto_186271 ?auto_186275 ) ) ( not ( = ?auto_186272 ?auto_186273 ) ) ( not ( = ?auto_186272 ?auto_186275 ) ) ( not ( = ?auto_186273 ?auto_186275 ) ) ( not ( = ?auto_186274 ?auto_186277 ) ) ( not ( = ?auto_186274 ?auto_186275 ) ) ( not ( = ?auto_186277 ?auto_186275 ) ) ( not ( = ?auto_186269 ?auto_186277 ) ) ( not ( = ?auto_186269 ?auto_186274 ) ) ( not ( = ?auto_186270 ?auto_186277 ) ) ( not ( = ?auto_186270 ?auto_186274 ) ) ( not ( = ?auto_186271 ?auto_186277 ) ) ( not ( = ?auto_186271 ?auto_186274 ) ) ( not ( = ?auto_186272 ?auto_186277 ) ) ( not ( = ?auto_186272 ?auto_186274 ) ) ( not ( = ?auto_186273 ?auto_186277 ) ) ( not ( = ?auto_186273 ?auto_186274 ) ) ( ON ?auto_186274 ?auto_186276 ) ( not ( = ?auto_186269 ?auto_186276 ) ) ( not ( = ?auto_186270 ?auto_186276 ) ) ( not ( = ?auto_186271 ?auto_186276 ) ) ( not ( = ?auto_186272 ?auto_186276 ) ) ( not ( = ?auto_186273 ?auto_186276 ) ) ( not ( = ?auto_186275 ?auto_186276 ) ) ( not ( = ?auto_186274 ?auto_186276 ) ) ( not ( = ?auto_186277 ?auto_186276 ) ) ( ON ?auto_186277 ?auto_186274 ) ( ON-TABLE ?auto_186276 ) ( ON ?auto_186275 ?auto_186277 ) ( ON ?auto_186273 ?auto_186275 ) ( ON ?auto_186272 ?auto_186273 ) ( ON ?auto_186271 ?auto_186272 ) ( ON ?auto_186270 ?auto_186271 ) ( CLEAR ?auto_186270 ) ( HOLDING ?auto_186269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186269 )
      ( MAKE-3PILE ?auto_186269 ?auto_186270 ?auto_186271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186278 - BLOCK
      ?auto_186279 - BLOCK
      ?auto_186280 - BLOCK
    )
    :vars
    (
      ?auto_186282 - BLOCK
      ?auto_186281 - BLOCK
      ?auto_186286 - BLOCK
      ?auto_186285 - BLOCK
      ?auto_186283 - BLOCK
      ?auto_186284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186278 ?auto_186279 ) ) ( not ( = ?auto_186278 ?auto_186280 ) ) ( not ( = ?auto_186278 ?auto_186282 ) ) ( not ( = ?auto_186279 ?auto_186280 ) ) ( not ( = ?auto_186279 ?auto_186282 ) ) ( not ( = ?auto_186280 ?auto_186282 ) ) ( not ( = ?auto_186278 ?auto_186281 ) ) ( not ( = ?auto_186278 ?auto_186286 ) ) ( not ( = ?auto_186279 ?auto_186281 ) ) ( not ( = ?auto_186279 ?auto_186286 ) ) ( not ( = ?auto_186280 ?auto_186281 ) ) ( not ( = ?auto_186280 ?auto_186286 ) ) ( not ( = ?auto_186282 ?auto_186281 ) ) ( not ( = ?auto_186282 ?auto_186286 ) ) ( not ( = ?auto_186281 ?auto_186286 ) ) ( not ( = ?auto_186285 ?auto_186283 ) ) ( not ( = ?auto_186285 ?auto_186286 ) ) ( not ( = ?auto_186283 ?auto_186286 ) ) ( not ( = ?auto_186278 ?auto_186283 ) ) ( not ( = ?auto_186278 ?auto_186285 ) ) ( not ( = ?auto_186279 ?auto_186283 ) ) ( not ( = ?auto_186279 ?auto_186285 ) ) ( not ( = ?auto_186280 ?auto_186283 ) ) ( not ( = ?auto_186280 ?auto_186285 ) ) ( not ( = ?auto_186282 ?auto_186283 ) ) ( not ( = ?auto_186282 ?auto_186285 ) ) ( not ( = ?auto_186281 ?auto_186283 ) ) ( not ( = ?auto_186281 ?auto_186285 ) ) ( ON ?auto_186285 ?auto_186284 ) ( not ( = ?auto_186278 ?auto_186284 ) ) ( not ( = ?auto_186279 ?auto_186284 ) ) ( not ( = ?auto_186280 ?auto_186284 ) ) ( not ( = ?auto_186282 ?auto_186284 ) ) ( not ( = ?auto_186281 ?auto_186284 ) ) ( not ( = ?auto_186286 ?auto_186284 ) ) ( not ( = ?auto_186285 ?auto_186284 ) ) ( not ( = ?auto_186283 ?auto_186284 ) ) ( ON ?auto_186283 ?auto_186285 ) ( ON-TABLE ?auto_186284 ) ( ON ?auto_186286 ?auto_186283 ) ( ON ?auto_186281 ?auto_186286 ) ( ON ?auto_186282 ?auto_186281 ) ( ON ?auto_186280 ?auto_186282 ) ( ON ?auto_186279 ?auto_186280 ) ( ON ?auto_186278 ?auto_186279 ) ( CLEAR ?auto_186278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186284 ?auto_186285 ?auto_186283 ?auto_186286 ?auto_186281 ?auto_186282 ?auto_186280 ?auto_186279 )
      ( MAKE-3PILE ?auto_186278 ?auto_186279 ?auto_186280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186292 - BLOCK
      ?auto_186293 - BLOCK
      ?auto_186294 - BLOCK
      ?auto_186295 - BLOCK
      ?auto_186296 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_186296 ) ( CLEAR ?auto_186295 ) ( ON-TABLE ?auto_186292 ) ( ON ?auto_186293 ?auto_186292 ) ( ON ?auto_186294 ?auto_186293 ) ( ON ?auto_186295 ?auto_186294 ) ( not ( = ?auto_186292 ?auto_186293 ) ) ( not ( = ?auto_186292 ?auto_186294 ) ) ( not ( = ?auto_186292 ?auto_186295 ) ) ( not ( = ?auto_186292 ?auto_186296 ) ) ( not ( = ?auto_186293 ?auto_186294 ) ) ( not ( = ?auto_186293 ?auto_186295 ) ) ( not ( = ?auto_186293 ?auto_186296 ) ) ( not ( = ?auto_186294 ?auto_186295 ) ) ( not ( = ?auto_186294 ?auto_186296 ) ) ( not ( = ?auto_186295 ?auto_186296 ) ) )
    :subtasks
    ( ( !STACK ?auto_186296 ?auto_186295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186297 - BLOCK
      ?auto_186298 - BLOCK
      ?auto_186299 - BLOCK
      ?auto_186300 - BLOCK
      ?auto_186301 - BLOCK
    )
    :vars
    (
      ?auto_186302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186300 ) ( ON-TABLE ?auto_186297 ) ( ON ?auto_186298 ?auto_186297 ) ( ON ?auto_186299 ?auto_186298 ) ( ON ?auto_186300 ?auto_186299 ) ( not ( = ?auto_186297 ?auto_186298 ) ) ( not ( = ?auto_186297 ?auto_186299 ) ) ( not ( = ?auto_186297 ?auto_186300 ) ) ( not ( = ?auto_186297 ?auto_186301 ) ) ( not ( = ?auto_186298 ?auto_186299 ) ) ( not ( = ?auto_186298 ?auto_186300 ) ) ( not ( = ?auto_186298 ?auto_186301 ) ) ( not ( = ?auto_186299 ?auto_186300 ) ) ( not ( = ?auto_186299 ?auto_186301 ) ) ( not ( = ?auto_186300 ?auto_186301 ) ) ( ON ?auto_186301 ?auto_186302 ) ( CLEAR ?auto_186301 ) ( HAND-EMPTY ) ( not ( = ?auto_186297 ?auto_186302 ) ) ( not ( = ?auto_186298 ?auto_186302 ) ) ( not ( = ?auto_186299 ?auto_186302 ) ) ( not ( = ?auto_186300 ?auto_186302 ) ) ( not ( = ?auto_186301 ?auto_186302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186301 ?auto_186302 )
      ( MAKE-5PILE ?auto_186297 ?auto_186298 ?auto_186299 ?auto_186300 ?auto_186301 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186303 - BLOCK
      ?auto_186304 - BLOCK
      ?auto_186305 - BLOCK
      ?auto_186306 - BLOCK
      ?auto_186307 - BLOCK
    )
    :vars
    (
      ?auto_186308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186303 ) ( ON ?auto_186304 ?auto_186303 ) ( ON ?auto_186305 ?auto_186304 ) ( not ( = ?auto_186303 ?auto_186304 ) ) ( not ( = ?auto_186303 ?auto_186305 ) ) ( not ( = ?auto_186303 ?auto_186306 ) ) ( not ( = ?auto_186303 ?auto_186307 ) ) ( not ( = ?auto_186304 ?auto_186305 ) ) ( not ( = ?auto_186304 ?auto_186306 ) ) ( not ( = ?auto_186304 ?auto_186307 ) ) ( not ( = ?auto_186305 ?auto_186306 ) ) ( not ( = ?auto_186305 ?auto_186307 ) ) ( not ( = ?auto_186306 ?auto_186307 ) ) ( ON ?auto_186307 ?auto_186308 ) ( CLEAR ?auto_186307 ) ( not ( = ?auto_186303 ?auto_186308 ) ) ( not ( = ?auto_186304 ?auto_186308 ) ) ( not ( = ?auto_186305 ?auto_186308 ) ) ( not ( = ?auto_186306 ?auto_186308 ) ) ( not ( = ?auto_186307 ?auto_186308 ) ) ( HOLDING ?auto_186306 ) ( CLEAR ?auto_186305 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186303 ?auto_186304 ?auto_186305 ?auto_186306 )
      ( MAKE-5PILE ?auto_186303 ?auto_186304 ?auto_186305 ?auto_186306 ?auto_186307 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186309 - BLOCK
      ?auto_186310 - BLOCK
      ?auto_186311 - BLOCK
      ?auto_186312 - BLOCK
      ?auto_186313 - BLOCK
    )
    :vars
    (
      ?auto_186314 - BLOCK
      ?auto_186316 - BLOCK
      ?auto_186315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186309 ) ( ON ?auto_186310 ?auto_186309 ) ( ON ?auto_186311 ?auto_186310 ) ( not ( = ?auto_186309 ?auto_186310 ) ) ( not ( = ?auto_186309 ?auto_186311 ) ) ( not ( = ?auto_186309 ?auto_186312 ) ) ( not ( = ?auto_186309 ?auto_186313 ) ) ( not ( = ?auto_186310 ?auto_186311 ) ) ( not ( = ?auto_186310 ?auto_186312 ) ) ( not ( = ?auto_186310 ?auto_186313 ) ) ( not ( = ?auto_186311 ?auto_186312 ) ) ( not ( = ?auto_186311 ?auto_186313 ) ) ( not ( = ?auto_186312 ?auto_186313 ) ) ( ON ?auto_186313 ?auto_186314 ) ( not ( = ?auto_186309 ?auto_186314 ) ) ( not ( = ?auto_186310 ?auto_186314 ) ) ( not ( = ?auto_186311 ?auto_186314 ) ) ( not ( = ?auto_186312 ?auto_186314 ) ) ( not ( = ?auto_186313 ?auto_186314 ) ) ( CLEAR ?auto_186311 ) ( ON ?auto_186312 ?auto_186313 ) ( CLEAR ?auto_186312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186316 ) ( ON ?auto_186315 ?auto_186316 ) ( ON ?auto_186314 ?auto_186315 ) ( not ( = ?auto_186316 ?auto_186315 ) ) ( not ( = ?auto_186316 ?auto_186314 ) ) ( not ( = ?auto_186316 ?auto_186313 ) ) ( not ( = ?auto_186316 ?auto_186312 ) ) ( not ( = ?auto_186315 ?auto_186314 ) ) ( not ( = ?auto_186315 ?auto_186313 ) ) ( not ( = ?auto_186315 ?auto_186312 ) ) ( not ( = ?auto_186309 ?auto_186316 ) ) ( not ( = ?auto_186309 ?auto_186315 ) ) ( not ( = ?auto_186310 ?auto_186316 ) ) ( not ( = ?auto_186310 ?auto_186315 ) ) ( not ( = ?auto_186311 ?auto_186316 ) ) ( not ( = ?auto_186311 ?auto_186315 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186316 ?auto_186315 ?auto_186314 ?auto_186313 )
      ( MAKE-5PILE ?auto_186309 ?auto_186310 ?auto_186311 ?auto_186312 ?auto_186313 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186317 - BLOCK
      ?auto_186318 - BLOCK
      ?auto_186319 - BLOCK
      ?auto_186320 - BLOCK
      ?auto_186321 - BLOCK
    )
    :vars
    (
      ?auto_186323 - BLOCK
      ?auto_186322 - BLOCK
      ?auto_186324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186317 ) ( ON ?auto_186318 ?auto_186317 ) ( not ( = ?auto_186317 ?auto_186318 ) ) ( not ( = ?auto_186317 ?auto_186319 ) ) ( not ( = ?auto_186317 ?auto_186320 ) ) ( not ( = ?auto_186317 ?auto_186321 ) ) ( not ( = ?auto_186318 ?auto_186319 ) ) ( not ( = ?auto_186318 ?auto_186320 ) ) ( not ( = ?auto_186318 ?auto_186321 ) ) ( not ( = ?auto_186319 ?auto_186320 ) ) ( not ( = ?auto_186319 ?auto_186321 ) ) ( not ( = ?auto_186320 ?auto_186321 ) ) ( ON ?auto_186321 ?auto_186323 ) ( not ( = ?auto_186317 ?auto_186323 ) ) ( not ( = ?auto_186318 ?auto_186323 ) ) ( not ( = ?auto_186319 ?auto_186323 ) ) ( not ( = ?auto_186320 ?auto_186323 ) ) ( not ( = ?auto_186321 ?auto_186323 ) ) ( ON ?auto_186320 ?auto_186321 ) ( CLEAR ?auto_186320 ) ( ON-TABLE ?auto_186322 ) ( ON ?auto_186324 ?auto_186322 ) ( ON ?auto_186323 ?auto_186324 ) ( not ( = ?auto_186322 ?auto_186324 ) ) ( not ( = ?auto_186322 ?auto_186323 ) ) ( not ( = ?auto_186322 ?auto_186321 ) ) ( not ( = ?auto_186322 ?auto_186320 ) ) ( not ( = ?auto_186324 ?auto_186323 ) ) ( not ( = ?auto_186324 ?auto_186321 ) ) ( not ( = ?auto_186324 ?auto_186320 ) ) ( not ( = ?auto_186317 ?auto_186322 ) ) ( not ( = ?auto_186317 ?auto_186324 ) ) ( not ( = ?auto_186318 ?auto_186322 ) ) ( not ( = ?auto_186318 ?auto_186324 ) ) ( not ( = ?auto_186319 ?auto_186322 ) ) ( not ( = ?auto_186319 ?auto_186324 ) ) ( HOLDING ?auto_186319 ) ( CLEAR ?auto_186318 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186317 ?auto_186318 ?auto_186319 )
      ( MAKE-5PILE ?auto_186317 ?auto_186318 ?auto_186319 ?auto_186320 ?auto_186321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186325 - BLOCK
      ?auto_186326 - BLOCK
      ?auto_186327 - BLOCK
      ?auto_186328 - BLOCK
      ?auto_186329 - BLOCK
    )
    :vars
    (
      ?auto_186332 - BLOCK
      ?auto_186330 - BLOCK
      ?auto_186331 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186325 ) ( ON ?auto_186326 ?auto_186325 ) ( not ( = ?auto_186325 ?auto_186326 ) ) ( not ( = ?auto_186325 ?auto_186327 ) ) ( not ( = ?auto_186325 ?auto_186328 ) ) ( not ( = ?auto_186325 ?auto_186329 ) ) ( not ( = ?auto_186326 ?auto_186327 ) ) ( not ( = ?auto_186326 ?auto_186328 ) ) ( not ( = ?auto_186326 ?auto_186329 ) ) ( not ( = ?auto_186327 ?auto_186328 ) ) ( not ( = ?auto_186327 ?auto_186329 ) ) ( not ( = ?auto_186328 ?auto_186329 ) ) ( ON ?auto_186329 ?auto_186332 ) ( not ( = ?auto_186325 ?auto_186332 ) ) ( not ( = ?auto_186326 ?auto_186332 ) ) ( not ( = ?auto_186327 ?auto_186332 ) ) ( not ( = ?auto_186328 ?auto_186332 ) ) ( not ( = ?auto_186329 ?auto_186332 ) ) ( ON ?auto_186328 ?auto_186329 ) ( ON-TABLE ?auto_186330 ) ( ON ?auto_186331 ?auto_186330 ) ( ON ?auto_186332 ?auto_186331 ) ( not ( = ?auto_186330 ?auto_186331 ) ) ( not ( = ?auto_186330 ?auto_186332 ) ) ( not ( = ?auto_186330 ?auto_186329 ) ) ( not ( = ?auto_186330 ?auto_186328 ) ) ( not ( = ?auto_186331 ?auto_186332 ) ) ( not ( = ?auto_186331 ?auto_186329 ) ) ( not ( = ?auto_186331 ?auto_186328 ) ) ( not ( = ?auto_186325 ?auto_186330 ) ) ( not ( = ?auto_186325 ?auto_186331 ) ) ( not ( = ?auto_186326 ?auto_186330 ) ) ( not ( = ?auto_186326 ?auto_186331 ) ) ( not ( = ?auto_186327 ?auto_186330 ) ) ( not ( = ?auto_186327 ?auto_186331 ) ) ( CLEAR ?auto_186326 ) ( ON ?auto_186327 ?auto_186328 ) ( CLEAR ?auto_186327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186330 ?auto_186331 ?auto_186332 ?auto_186329 ?auto_186328 )
      ( MAKE-5PILE ?auto_186325 ?auto_186326 ?auto_186327 ?auto_186328 ?auto_186329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186333 - BLOCK
      ?auto_186334 - BLOCK
      ?auto_186335 - BLOCK
      ?auto_186336 - BLOCK
      ?auto_186337 - BLOCK
    )
    :vars
    (
      ?auto_186338 - BLOCK
      ?auto_186340 - BLOCK
      ?auto_186339 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186333 ) ( not ( = ?auto_186333 ?auto_186334 ) ) ( not ( = ?auto_186333 ?auto_186335 ) ) ( not ( = ?auto_186333 ?auto_186336 ) ) ( not ( = ?auto_186333 ?auto_186337 ) ) ( not ( = ?auto_186334 ?auto_186335 ) ) ( not ( = ?auto_186334 ?auto_186336 ) ) ( not ( = ?auto_186334 ?auto_186337 ) ) ( not ( = ?auto_186335 ?auto_186336 ) ) ( not ( = ?auto_186335 ?auto_186337 ) ) ( not ( = ?auto_186336 ?auto_186337 ) ) ( ON ?auto_186337 ?auto_186338 ) ( not ( = ?auto_186333 ?auto_186338 ) ) ( not ( = ?auto_186334 ?auto_186338 ) ) ( not ( = ?auto_186335 ?auto_186338 ) ) ( not ( = ?auto_186336 ?auto_186338 ) ) ( not ( = ?auto_186337 ?auto_186338 ) ) ( ON ?auto_186336 ?auto_186337 ) ( ON-TABLE ?auto_186340 ) ( ON ?auto_186339 ?auto_186340 ) ( ON ?auto_186338 ?auto_186339 ) ( not ( = ?auto_186340 ?auto_186339 ) ) ( not ( = ?auto_186340 ?auto_186338 ) ) ( not ( = ?auto_186340 ?auto_186337 ) ) ( not ( = ?auto_186340 ?auto_186336 ) ) ( not ( = ?auto_186339 ?auto_186338 ) ) ( not ( = ?auto_186339 ?auto_186337 ) ) ( not ( = ?auto_186339 ?auto_186336 ) ) ( not ( = ?auto_186333 ?auto_186340 ) ) ( not ( = ?auto_186333 ?auto_186339 ) ) ( not ( = ?auto_186334 ?auto_186340 ) ) ( not ( = ?auto_186334 ?auto_186339 ) ) ( not ( = ?auto_186335 ?auto_186340 ) ) ( not ( = ?auto_186335 ?auto_186339 ) ) ( ON ?auto_186335 ?auto_186336 ) ( CLEAR ?auto_186335 ) ( HOLDING ?auto_186334 ) ( CLEAR ?auto_186333 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186333 ?auto_186334 )
      ( MAKE-5PILE ?auto_186333 ?auto_186334 ?auto_186335 ?auto_186336 ?auto_186337 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186341 - BLOCK
      ?auto_186342 - BLOCK
      ?auto_186343 - BLOCK
      ?auto_186344 - BLOCK
      ?auto_186345 - BLOCK
    )
    :vars
    (
      ?auto_186348 - BLOCK
      ?auto_186346 - BLOCK
      ?auto_186347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186341 ) ( not ( = ?auto_186341 ?auto_186342 ) ) ( not ( = ?auto_186341 ?auto_186343 ) ) ( not ( = ?auto_186341 ?auto_186344 ) ) ( not ( = ?auto_186341 ?auto_186345 ) ) ( not ( = ?auto_186342 ?auto_186343 ) ) ( not ( = ?auto_186342 ?auto_186344 ) ) ( not ( = ?auto_186342 ?auto_186345 ) ) ( not ( = ?auto_186343 ?auto_186344 ) ) ( not ( = ?auto_186343 ?auto_186345 ) ) ( not ( = ?auto_186344 ?auto_186345 ) ) ( ON ?auto_186345 ?auto_186348 ) ( not ( = ?auto_186341 ?auto_186348 ) ) ( not ( = ?auto_186342 ?auto_186348 ) ) ( not ( = ?auto_186343 ?auto_186348 ) ) ( not ( = ?auto_186344 ?auto_186348 ) ) ( not ( = ?auto_186345 ?auto_186348 ) ) ( ON ?auto_186344 ?auto_186345 ) ( ON-TABLE ?auto_186346 ) ( ON ?auto_186347 ?auto_186346 ) ( ON ?auto_186348 ?auto_186347 ) ( not ( = ?auto_186346 ?auto_186347 ) ) ( not ( = ?auto_186346 ?auto_186348 ) ) ( not ( = ?auto_186346 ?auto_186345 ) ) ( not ( = ?auto_186346 ?auto_186344 ) ) ( not ( = ?auto_186347 ?auto_186348 ) ) ( not ( = ?auto_186347 ?auto_186345 ) ) ( not ( = ?auto_186347 ?auto_186344 ) ) ( not ( = ?auto_186341 ?auto_186346 ) ) ( not ( = ?auto_186341 ?auto_186347 ) ) ( not ( = ?auto_186342 ?auto_186346 ) ) ( not ( = ?auto_186342 ?auto_186347 ) ) ( not ( = ?auto_186343 ?auto_186346 ) ) ( not ( = ?auto_186343 ?auto_186347 ) ) ( ON ?auto_186343 ?auto_186344 ) ( CLEAR ?auto_186341 ) ( ON ?auto_186342 ?auto_186343 ) ( CLEAR ?auto_186342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186346 ?auto_186347 ?auto_186348 ?auto_186345 ?auto_186344 ?auto_186343 )
      ( MAKE-5PILE ?auto_186341 ?auto_186342 ?auto_186343 ?auto_186344 ?auto_186345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186349 - BLOCK
      ?auto_186350 - BLOCK
      ?auto_186351 - BLOCK
      ?auto_186352 - BLOCK
      ?auto_186353 - BLOCK
    )
    :vars
    (
      ?auto_186355 - BLOCK
      ?auto_186356 - BLOCK
      ?auto_186354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186349 ?auto_186350 ) ) ( not ( = ?auto_186349 ?auto_186351 ) ) ( not ( = ?auto_186349 ?auto_186352 ) ) ( not ( = ?auto_186349 ?auto_186353 ) ) ( not ( = ?auto_186350 ?auto_186351 ) ) ( not ( = ?auto_186350 ?auto_186352 ) ) ( not ( = ?auto_186350 ?auto_186353 ) ) ( not ( = ?auto_186351 ?auto_186352 ) ) ( not ( = ?auto_186351 ?auto_186353 ) ) ( not ( = ?auto_186352 ?auto_186353 ) ) ( ON ?auto_186353 ?auto_186355 ) ( not ( = ?auto_186349 ?auto_186355 ) ) ( not ( = ?auto_186350 ?auto_186355 ) ) ( not ( = ?auto_186351 ?auto_186355 ) ) ( not ( = ?auto_186352 ?auto_186355 ) ) ( not ( = ?auto_186353 ?auto_186355 ) ) ( ON ?auto_186352 ?auto_186353 ) ( ON-TABLE ?auto_186356 ) ( ON ?auto_186354 ?auto_186356 ) ( ON ?auto_186355 ?auto_186354 ) ( not ( = ?auto_186356 ?auto_186354 ) ) ( not ( = ?auto_186356 ?auto_186355 ) ) ( not ( = ?auto_186356 ?auto_186353 ) ) ( not ( = ?auto_186356 ?auto_186352 ) ) ( not ( = ?auto_186354 ?auto_186355 ) ) ( not ( = ?auto_186354 ?auto_186353 ) ) ( not ( = ?auto_186354 ?auto_186352 ) ) ( not ( = ?auto_186349 ?auto_186356 ) ) ( not ( = ?auto_186349 ?auto_186354 ) ) ( not ( = ?auto_186350 ?auto_186356 ) ) ( not ( = ?auto_186350 ?auto_186354 ) ) ( not ( = ?auto_186351 ?auto_186356 ) ) ( not ( = ?auto_186351 ?auto_186354 ) ) ( ON ?auto_186351 ?auto_186352 ) ( ON ?auto_186350 ?auto_186351 ) ( CLEAR ?auto_186350 ) ( HOLDING ?auto_186349 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186349 )
      ( MAKE-5PILE ?auto_186349 ?auto_186350 ?auto_186351 ?auto_186352 ?auto_186353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186357 - BLOCK
      ?auto_186358 - BLOCK
      ?auto_186359 - BLOCK
      ?auto_186360 - BLOCK
      ?auto_186361 - BLOCK
    )
    :vars
    (
      ?auto_186362 - BLOCK
      ?auto_186363 - BLOCK
      ?auto_186364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186357 ?auto_186358 ) ) ( not ( = ?auto_186357 ?auto_186359 ) ) ( not ( = ?auto_186357 ?auto_186360 ) ) ( not ( = ?auto_186357 ?auto_186361 ) ) ( not ( = ?auto_186358 ?auto_186359 ) ) ( not ( = ?auto_186358 ?auto_186360 ) ) ( not ( = ?auto_186358 ?auto_186361 ) ) ( not ( = ?auto_186359 ?auto_186360 ) ) ( not ( = ?auto_186359 ?auto_186361 ) ) ( not ( = ?auto_186360 ?auto_186361 ) ) ( ON ?auto_186361 ?auto_186362 ) ( not ( = ?auto_186357 ?auto_186362 ) ) ( not ( = ?auto_186358 ?auto_186362 ) ) ( not ( = ?auto_186359 ?auto_186362 ) ) ( not ( = ?auto_186360 ?auto_186362 ) ) ( not ( = ?auto_186361 ?auto_186362 ) ) ( ON ?auto_186360 ?auto_186361 ) ( ON-TABLE ?auto_186363 ) ( ON ?auto_186364 ?auto_186363 ) ( ON ?auto_186362 ?auto_186364 ) ( not ( = ?auto_186363 ?auto_186364 ) ) ( not ( = ?auto_186363 ?auto_186362 ) ) ( not ( = ?auto_186363 ?auto_186361 ) ) ( not ( = ?auto_186363 ?auto_186360 ) ) ( not ( = ?auto_186364 ?auto_186362 ) ) ( not ( = ?auto_186364 ?auto_186361 ) ) ( not ( = ?auto_186364 ?auto_186360 ) ) ( not ( = ?auto_186357 ?auto_186363 ) ) ( not ( = ?auto_186357 ?auto_186364 ) ) ( not ( = ?auto_186358 ?auto_186363 ) ) ( not ( = ?auto_186358 ?auto_186364 ) ) ( not ( = ?auto_186359 ?auto_186363 ) ) ( not ( = ?auto_186359 ?auto_186364 ) ) ( ON ?auto_186359 ?auto_186360 ) ( ON ?auto_186358 ?auto_186359 ) ( ON ?auto_186357 ?auto_186358 ) ( CLEAR ?auto_186357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186363 ?auto_186364 ?auto_186362 ?auto_186361 ?auto_186360 ?auto_186359 ?auto_186358 )
      ( MAKE-5PILE ?auto_186357 ?auto_186358 ?auto_186359 ?auto_186360 ?auto_186361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186365 - BLOCK
      ?auto_186366 - BLOCK
      ?auto_186367 - BLOCK
      ?auto_186368 - BLOCK
      ?auto_186369 - BLOCK
    )
    :vars
    (
      ?auto_186371 - BLOCK
      ?auto_186370 - BLOCK
      ?auto_186372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186365 ?auto_186366 ) ) ( not ( = ?auto_186365 ?auto_186367 ) ) ( not ( = ?auto_186365 ?auto_186368 ) ) ( not ( = ?auto_186365 ?auto_186369 ) ) ( not ( = ?auto_186366 ?auto_186367 ) ) ( not ( = ?auto_186366 ?auto_186368 ) ) ( not ( = ?auto_186366 ?auto_186369 ) ) ( not ( = ?auto_186367 ?auto_186368 ) ) ( not ( = ?auto_186367 ?auto_186369 ) ) ( not ( = ?auto_186368 ?auto_186369 ) ) ( ON ?auto_186369 ?auto_186371 ) ( not ( = ?auto_186365 ?auto_186371 ) ) ( not ( = ?auto_186366 ?auto_186371 ) ) ( not ( = ?auto_186367 ?auto_186371 ) ) ( not ( = ?auto_186368 ?auto_186371 ) ) ( not ( = ?auto_186369 ?auto_186371 ) ) ( ON ?auto_186368 ?auto_186369 ) ( ON-TABLE ?auto_186370 ) ( ON ?auto_186372 ?auto_186370 ) ( ON ?auto_186371 ?auto_186372 ) ( not ( = ?auto_186370 ?auto_186372 ) ) ( not ( = ?auto_186370 ?auto_186371 ) ) ( not ( = ?auto_186370 ?auto_186369 ) ) ( not ( = ?auto_186370 ?auto_186368 ) ) ( not ( = ?auto_186372 ?auto_186371 ) ) ( not ( = ?auto_186372 ?auto_186369 ) ) ( not ( = ?auto_186372 ?auto_186368 ) ) ( not ( = ?auto_186365 ?auto_186370 ) ) ( not ( = ?auto_186365 ?auto_186372 ) ) ( not ( = ?auto_186366 ?auto_186370 ) ) ( not ( = ?auto_186366 ?auto_186372 ) ) ( not ( = ?auto_186367 ?auto_186370 ) ) ( not ( = ?auto_186367 ?auto_186372 ) ) ( ON ?auto_186367 ?auto_186368 ) ( ON ?auto_186366 ?auto_186367 ) ( HOLDING ?auto_186365 ) ( CLEAR ?auto_186366 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186370 ?auto_186372 ?auto_186371 ?auto_186369 ?auto_186368 ?auto_186367 ?auto_186366 ?auto_186365 )
      ( MAKE-5PILE ?auto_186365 ?auto_186366 ?auto_186367 ?auto_186368 ?auto_186369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186373 - BLOCK
      ?auto_186374 - BLOCK
      ?auto_186375 - BLOCK
      ?auto_186376 - BLOCK
      ?auto_186377 - BLOCK
    )
    :vars
    (
      ?auto_186380 - BLOCK
      ?auto_186379 - BLOCK
      ?auto_186378 - BLOCK
      ?auto_186381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186373 ?auto_186374 ) ) ( not ( = ?auto_186373 ?auto_186375 ) ) ( not ( = ?auto_186373 ?auto_186376 ) ) ( not ( = ?auto_186373 ?auto_186377 ) ) ( not ( = ?auto_186374 ?auto_186375 ) ) ( not ( = ?auto_186374 ?auto_186376 ) ) ( not ( = ?auto_186374 ?auto_186377 ) ) ( not ( = ?auto_186375 ?auto_186376 ) ) ( not ( = ?auto_186375 ?auto_186377 ) ) ( not ( = ?auto_186376 ?auto_186377 ) ) ( ON ?auto_186377 ?auto_186380 ) ( not ( = ?auto_186373 ?auto_186380 ) ) ( not ( = ?auto_186374 ?auto_186380 ) ) ( not ( = ?auto_186375 ?auto_186380 ) ) ( not ( = ?auto_186376 ?auto_186380 ) ) ( not ( = ?auto_186377 ?auto_186380 ) ) ( ON ?auto_186376 ?auto_186377 ) ( ON-TABLE ?auto_186379 ) ( ON ?auto_186378 ?auto_186379 ) ( ON ?auto_186380 ?auto_186378 ) ( not ( = ?auto_186379 ?auto_186378 ) ) ( not ( = ?auto_186379 ?auto_186380 ) ) ( not ( = ?auto_186379 ?auto_186377 ) ) ( not ( = ?auto_186379 ?auto_186376 ) ) ( not ( = ?auto_186378 ?auto_186380 ) ) ( not ( = ?auto_186378 ?auto_186377 ) ) ( not ( = ?auto_186378 ?auto_186376 ) ) ( not ( = ?auto_186373 ?auto_186379 ) ) ( not ( = ?auto_186373 ?auto_186378 ) ) ( not ( = ?auto_186374 ?auto_186379 ) ) ( not ( = ?auto_186374 ?auto_186378 ) ) ( not ( = ?auto_186375 ?auto_186379 ) ) ( not ( = ?auto_186375 ?auto_186378 ) ) ( ON ?auto_186375 ?auto_186376 ) ( ON ?auto_186374 ?auto_186375 ) ( CLEAR ?auto_186374 ) ( ON ?auto_186373 ?auto_186381 ) ( CLEAR ?auto_186373 ) ( HAND-EMPTY ) ( not ( = ?auto_186373 ?auto_186381 ) ) ( not ( = ?auto_186374 ?auto_186381 ) ) ( not ( = ?auto_186375 ?auto_186381 ) ) ( not ( = ?auto_186376 ?auto_186381 ) ) ( not ( = ?auto_186377 ?auto_186381 ) ) ( not ( = ?auto_186380 ?auto_186381 ) ) ( not ( = ?auto_186379 ?auto_186381 ) ) ( not ( = ?auto_186378 ?auto_186381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186373 ?auto_186381 )
      ( MAKE-5PILE ?auto_186373 ?auto_186374 ?auto_186375 ?auto_186376 ?auto_186377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186382 - BLOCK
      ?auto_186383 - BLOCK
      ?auto_186384 - BLOCK
      ?auto_186385 - BLOCK
      ?auto_186386 - BLOCK
    )
    :vars
    (
      ?auto_186390 - BLOCK
      ?auto_186389 - BLOCK
      ?auto_186387 - BLOCK
      ?auto_186388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186382 ?auto_186383 ) ) ( not ( = ?auto_186382 ?auto_186384 ) ) ( not ( = ?auto_186382 ?auto_186385 ) ) ( not ( = ?auto_186382 ?auto_186386 ) ) ( not ( = ?auto_186383 ?auto_186384 ) ) ( not ( = ?auto_186383 ?auto_186385 ) ) ( not ( = ?auto_186383 ?auto_186386 ) ) ( not ( = ?auto_186384 ?auto_186385 ) ) ( not ( = ?auto_186384 ?auto_186386 ) ) ( not ( = ?auto_186385 ?auto_186386 ) ) ( ON ?auto_186386 ?auto_186390 ) ( not ( = ?auto_186382 ?auto_186390 ) ) ( not ( = ?auto_186383 ?auto_186390 ) ) ( not ( = ?auto_186384 ?auto_186390 ) ) ( not ( = ?auto_186385 ?auto_186390 ) ) ( not ( = ?auto_186386 ?auto_186390 ) ) ( ON ?auto_186385 ?auto_186386 ) ( ON-TABLE ?auto_186389 ) ( ON ?auto_186387 ?auto_186389 ) ( ON ?auto_186390 ?auto_186387 ) ( not ( = ?auto_186389 ?auto_186387 ) ) ( not ( = ?auto_186389 ?auto_186390 ) ) ( not ( = ?auto_186389 ?auto_186386 ) ) ( not ( = ?auto_186389 ?auto_186385 ) ) ( not ( = ?auto_186387 ?auto_186390 ) ) ( not ( = ?auto_186387 ?auto_186386 ) ) ( not ( = ?auto_186387 ?auto_186385 ) ) ( not ( = ?auto_186382 ?auto_186389 ) ) ( not ( = ?auto_186382 ?auto_186387 ) ) ( not ( = ?auto_186383 ?auto_186389 ) ) ( not ( = ?auto_186383 ?auto_186387 ) ) ( not ( = ?auto_186384 ?auto_186389 ) ) ( not ( = ?auto_186384 ?auto_186387 ) ) ( ON ?auto_186384 ?auto_186385 ) ( ON ?auto_186382 ?auto_186388 ) ( CLEAR ?auto_186382 ) ( not ( = ?auto_186382 ?auto_186388 ) ) ( not ( = ?auto_186383 ?auto_186388 ) ) ( not ( = ?auto_186384 ?auto_186388 ) ) ( not ( = ?auto_186385 ?auto_186388 ) ) ( not ( = ?auto_186386 ?auto_186388 ) ) ( not ( = ?auto_186390 ?auto_186388 ) ) ( not ( = ?auto_186389 ?auto_186388 ) ) ( not ( = ?auto_186387 ?auto_186388 ) ) ( HOLDING ?auto_186383 ) ( CLEAR ?auto_186384 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186389 ?auto_186387 ?auto_186390 ?auto_186386 ?auto_186385 ?auto_186384 ?auto_186383 )
      ( MAKE-5PILE ?auto_186382 ?auto_186383 ?auto_186384 ?auto_186385 ?auto_186386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186391 - BLOCK
      ?auto_186392 - BLOCK
      ?auto_186393 - BLOCK
      ?auto_186394 - BLOCK
      ?auto_186395 - BLOCK
    )
    :vars
    (
      ?auto_186396 - BLOCK
      ?auto_186397 - BLOCK
      ?auto_186399 - BLOCK
      ?auto_186398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186391 ?auto_186392 ) ) ( not ( = ?auto_186391 ?auto_186393 ) ) ( not ( = ?auto_186391 ?auto_186394 ) ) ( not ( = ?auto_186391 ?auto_186395 ) ) ( not ( = ?auto_186392 ?auto_186393 ) ) ( not ( = ?auto_186392 ?auto_186394 ) ) ( not ( = ?auto_186392 ?auto_186395 ) ) ( not ( = ?auto_186393 ?auto_186394 ) ) ( not ( = ?auto_186393 ?auto_186395 ) ) ( not ( = ?auto_186394 ?auto_186395 ) ) ( ON ?auto_186395 ?auto_186396 ) ( not ( = ?auto_186391 ?auto_186396 ) ) ( not ( = ?auto_186392 ?auto_186396 ) ) ( not ( = ?auto_186393 ?auto_186396 ) ) ( not ( = ?auto_186394 ?auto_186396 ) ) ( not ( = ?auto_186395 ?auto_186396 ) ) ( ON ?auto_186394 ?auto_186395 ) ( ON-TABLE ?auto_186397 ) ( ON ?auto_186399 ?auto_186397 ) ( ON ?auto_186396 ?auto_186399 ) ( not ( = ?auto_186397 ?auto_186399 ) ) ( not ( = ?auto_186397 ?auto_186396 ) ) ( not ( = ?auto_186397 ?auto_186395 ) ) ( not ( = ?auto_186397 ?auto_186394 ) ) ( not ( = ?auto_186399 ?auto_186396 ) ) ( not ( = ?auto_186399 ?auto_186395 ) ) ( not ( = ?auto_186399 ?auto_186394 ) ) ( not ( = ?auto_186391 ?auto_186397 ) ) ( not ( = ?auto_186391 ?auto_186399 ) ) ( not ( = ?auto_186392 ?auto_186397 ) ) ( not ( = ?auto_186392 ?auto_186399 ) ) ( not ( = ?auto_186393 ?auto_186397 ) ) ( not ( = ?auto_186393 ?auto_186399 ) ) ( ON ?auto_186393 ?auto_186394 ) ( ON ?auto_186391 ?auto_186398 ) ( not ( = ?auto_186391 ?auto_186398 ) ) ( not ( = ?auto_186392 ?auto_186398 ) ) ( not ( = ?auto_186393 ?auto_186398 ) ) ( not ( = ?auto_186394 ?auto_186398 ) ) ( not ( = ?auto_186395 ?auto_186398 ) ) ( not ( = ?auto_186396 ?auto_186398 ) ) ( not ( = ?auto_186397 ?auto_186398 ) ) ( not ( = ?auto_186399 ?auto_186398 ) ) ( CLEAR ?auto_186393 ) ( ON ?auto_186392 ?auto_186391 ) ( CLEAR ?auto_186392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186398 ?auto_186391 )
      ( MAKE-5PILE ?auto_186391 ?auto_186392 ?auto_186393 ?auto_186394 ?auto_186395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186400 - BLOCK
      ?auto_186401 - BLOCK
      ?auto_186402 - BLOCK
      ?auto_186403 - BLOCK
      ?auto_186404 - BLOCK
    )
    :vars
    (
      ?auto_186407 - BLOCK
      ?auto_186405 - BLOCK
      ?auto_186406 - BLOCK
      ?auto_186408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186400 ?auto_186401 ) ) ( not ( = ?auto_186400 ?auto_186402 ) ) ( not ( = ?auto_186400 ?auto_186403 ) ) ( not ( = ?auto_186400 ?auto_186404 ) ) ( not ( = ?auto_186401 ?auto_186402 ) ) ( not ( = ?auto_186401 ?auto_186403 ) ) ( not ( = ?auto_186401 ?auto_186404 ) ) ( not ( = ?auto_186402 ?auto_186403 ) ) ( not ( = ?auto_186402 ?auto_186404 ) ) ( not ( = ?auto_186403 ?auto_186404 ) ) ( ON ?auto_186404 ?auto_186407 ) ( not ( = ?auto_186400 ?auto_186407 ) ) ( not ( = ?auto_186401 ?auto_186407 ) ) ( not ( = ?auto_186402 ?auto_186407 ) ) ( not ( = ?auto_186403 ?auto_186407 ) ) ( not ( = ?auto_186404 ?auto_186407 ) ) ( ON ?auto_186403 ?auto_186404 ) ( ON-TABLE ?auto_186405 ) ( ON ?auto_186406 ?auto_186405 ) ( ON ?auto_186407 ?auto_186406 ) ( not ( = ?auto_186405 ?auto_186406 ) ) ( not ( = ?auto_186405 ?auto_186407 ) ) ( not ( = ?auto_186405 ?auto_186404 ) ) ( not ( = ?auto_186405 ?auto_186403 ) ) ( not ( = ?auto_186406 ?auto_186407 ) ) ( not ( = ?auto_186406 ?auto_186404 ) ) ( not ( = ?auto_186406 ?auto_186403 ) ) ( not ( = ?auto_186400 ?auto_186405 ) ) ( not ( = ?auto_186400 ?auto_186406 ) ) ( not ( = ?auto_186401 ?auto_186405 ) ) ( not ( = ?auto_186401 ?auto_186406 ) ) ( not ( = ?auto_186402 ?auto_186405 ) ) ( not ( = ?auto_186402 ?auto_186406 ) ) ( ON ?auto_186400 ?auto_186408 ) ( not ( = ?auto_186400 ?auto_186408 ) ) ( not ( = ?auto_186401 ?auto_186408 ) ) ( not ( = ?auto_186402 ?auto_186408 ) ) ( not ( = ?auto_186403 ?auto_186408 ) ) ( not ( = ?auto_186404 ?auto_186408 ) ) ( not ( = ?auto_186407 ?auto_186408 ) ) ( not ( = ?auto_186405 ?auto_186408 ) ) ( not ( = ?auto_186406 ?auto_186408 ) ) ( ON ?auto_186401 ?auto_186400 ) ( CLEAR ?auto_186401 ) ( ON-TABLE ?auto_186408 ) ( HOLDING ?auto_186402 ) ( CLEAR ?auto_186403 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186405 ?auto_186406 ?auto_186407 ?auto_186404 ?auto_186403 ?auto_186402 )
      ( MAKE-5PILE ?auto_186400 ?auto_186401 ?auto_186402 ?auto_186403 ?auto_186404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186409 - BLOCK
      ?auto_186410 - BLOCK
      ?auto_186411 - BLOCK
      ?auto_186412 - BLOCK
      ?auto_186413 - BLOCK
    )
    :vars
    (
      ?auto_186414 - BLOCK
      ?auto_186416 - BLOCK
      ?auto_186415 - BLOCK
      ?auto_186417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186409 ?auto_186410 ) ) ( not ( = ?auto_186409 ?auto_186411 ) ) ( not ( = ?auto_186409 ?auto_186412 ) ) ( not ( = ?auto_186409 ?auto_186413 ) ) ( not ( = ?auto_186410 ?auto_186411 ) ) ( not ( = ?auto_186410 ?auto_186412 ) ) ( not ( = ?auto_186410 ?auto_186413 ) ) ( not ( = ?auto_186411 ?auto_186412 ) ) ( not ( = ?auto_186411 ?auto_186413 ) ) ( not ( = ?auto_186412 ?auto_186413 ) ) ( ON ?auto_186413 ?auto_186414 ) ( not ( = ?auto_186409 ?auto_186414 ) ) ( not ( = ?auto_186410 ?auto_186414 ) ) ( not ( = ?auto_186411 ?auto_186414 ) ) ( not ( = ?auto_186412 ?auto_186414 ) ) ( not ( = ?auto_186413 ?auto_186414 ) ) ( ON ?auto_186412 ?auto_186413 ) ( ON-TABLE ?auto_186416 ) ( ON ?auto_186415 ?auto_186416 ) ( ON ?auto_186414 ?auto_186415 ) ( not ( = ?auto_186416 ?auto_186415 ) ) ( not ( = ?auto_186416 ?auto_186414 ) ) ( not ( = ?auto_186416 ?auto_186413 ) ) ( not ( = ?auto_186416 ?auto_186412 ) ) ( not ( = ?auto_186415 ?auto_186414 ) ) ( not ( = ?auto_186415 ?auto_186413 ) ) ( not ( = ?auto_186415 ?auto_186412 ) ) ( not ( = ?auto_186409 ?auto_186416 ) ) ( not ( = ?auto_186409 ?auto_186415 ) ) ( not ( = ?auto_186410 ?auto_186416 ) ) ( not ( = ?auto_186410 ?auto_186415 ) ) ( not ( = ?auto_186411 ?auto_186416 ) ) ( not ( = ?auto_186411 ?auto_186415 ) ) ( ON ?auto_186409 ?auto_186417 ) ( not ( = ?auto_186409 ?auto_186417 ) ) ( not ( = ?auto_186410 ?auto_186417 ) ) ( not ( = ?auto_186411 ?auto_186417 ) ) ( not ( = ?auto_186412 ?auto_186417 ) ) ( not ( = ?auto_186413 ?auto_186417 ) ) ( not ( = ?auto_186414 ?auto_186417 ) ) ( not ( = ?auto_186416 ?auto_186417 ) ) ( not ( = ?auto_186415 ?auto_186417 ) ) ( ON ?auto_186410 ?auto_186409 ) ( ON-TABLE ?auto_186417 ) ( CLEAR ?auto_186412 ) ( ON ?auto_186411 ?auto_186410 ) ( CLEAR ?auto_186411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186417 ?auto_186409 ?auto_186410 )
      ( MAKE-5PILE ?auto_186409 ?auto_186410 ?auto_186411 ?auto_186412 ?auto_186413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186418 - BLOCK
      ?auto_186419 - BLOCK
      ?auto_186420 - BLOCK
      ?auto_186421 - BLOCK
      ?auto_186422 - BLOCK
    )
    :vars
    (
      ?auto_186426 - BLOCK
      ?auto_186424 - BLOCK
      ?auto_186423 - BLOCK
      ?auto_186425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186418 ?auto_186419 ) ) ( not ( = ?auto_186418 ?auto_186420 ) ) ( not ( = ?auto_186418 ?auto_186421 ) ) ( not ( = ?auto_186418 ?auto_186422 ) ) ( not ( = ?auto_186419 ?auto_186420 ) ) ( not ( = ?auto_186419 ?auto_186421 ) ) ( not ( = ?auto_186419 ?auto_186422 ) ) ( not ( = ?auto_186420 ?auto_186421 ) ) ( not ( = ?auto_186420 ?auto_186422 ) ) ( not ( = ?auto_186421 ?auto_186422 ) ) ( ON ?auto_186422 ?auto_186426 ) ( not ( = ?auto_186418 ?auto_186426 ) ) ( not ( = ?auto_186419 ?auto_186426 ) ) ( not ( = ?auto_186420 ?auto_186426 ) ) ( not ( = ?auto_186421 ?auto_186426 ) ) ( not ( = ?auto_186422 ?auto_186426 ) ) ( ON-TABLE ?auto_186424 ) ( ON ?auto_186423 ?auto_186424 ) ( ON ?auto_186426 ?auto_186423 ) ( not ( = ?auto_186424 ?auto_186423 ) ) ( not ( = ?auto_186424 ?auto_186426 ) ) ( not ( = ?auto_186424 ?auto_186422 ) ) ( not ( = ?auto_186424 ?auto_186421 ) ) ( not ( = ?auto_186423 ?auto_186426 ) ) ( not ( = ?auto_186423 ?auto_186422 ) ) ( not ( = ?auto_186423 ?auto_186421 ) ) ( not ( = ?auto_186418 ?auto_186424 ) ) ( not ( = ?auto_186418 ?auto_186423 ) ) ( not ( = ?auto_186419 ?auto_186424 ) ) ( not ( = ?auto_186419 ?auto_186423 ) ) ( not ( = ?auto_186420 ?auto_186424 ) ) ( not ( = ?auto_186420 ?auto_186423 ) ) ( ON ?auto_186418 ?auto_186425 ) ( not ( = ?auto_186418 ?auto_186425 ) ) ( not ( = ?auto_186419 ?auto_186425 ) ) ( not ( = ?auto_186420 ?auto_186425 ) ) ( not ( = ?auto_186421 ?auto_186425 ) ) ( not ( = ?auto_186422 ?auto_186425 ) ) ( not ( = ?auto_186426 ?auto_186425 ) ) ( not ( = ?auto_186424 ?auto_186425 ) ) ( not ( = ?auto_186423 ?auto_186425 ) ) ( ON ?auto_186419 ?auto_186418 ) ( ON-TABLE ?auto_186425 ) ( ON ?auto_186420 ?auto_186419 ) ( CLEAR ?auto_186420 ) ( HOLDING ?auto_186421 ) ( CLEAR ?auto_186422 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186424 ?auto_186423 ?auto_186426 ?auto_186422 ?auto_186421 )
      ( MAKE-5PILE ?auto_186418 ?auto_186419 ?auto_186420 ?auto_186421 ?auto_186422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186427 - BLOCK
      ?auto_186428 - BLOCK
      ?auto_186429 - BLOCK
      ?auto_186430 - BLOCK
      ?auto_186431 - BLOCK
    )
    :vars
    (
      ?auto_186434 - BLOCK
      ?auto_186432 - BLOCK
      ?auto_186435 - BLOCK
      ?auto_186433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186427 ?auto_186428 ) ) ( not ( = ?auto_186427 ?auto_186429 ) ) ( not ( = ?auto_186427 ?auto_186430 ) ) ( not ( = ?auto_186427 ?auto_186431 ) ) ( not ( = ?auto_186428 ?auto_186429 ) ) ( not ( = ?auto_186428 ?auto_186430 ) ) ( not ( = ?auto_186428 ?auto_186431 ) ) ( not ( = ?auto_186429 ?auto_186430 ) ) ( not ( = ?auto_186429 ?auto_186431 ) ) ( not ( = ?auto_186430 ?auto_186431 ) ) ( ON ?auto_186431 ?auto_186434 ) ( not ( = ?auto_186427 ?auto_186434 ) ) ( not ( = ?auto_186428 ?auto_186434 ) ) ( not ( = ?auto_186429 ?auto_186434 ) ) ( not ( = ?auto_186430 ?auto_186434 ) ) ( not ( = ?auto_186431 ?auto_186434 ) ) ( ON-TABLE ?auto_186432 ) ( ON ?auto_186435 ?auto_186432 ) ( ON ?auto_186434 ?auto_186435 ) ( not ( = ?auto_186432 ?auto_186435 ) ) ( not ( = ?auto_186432 ?auto_186434 ) ) ( not ( = ?auto_186432 ?auto_186431 ) ) ( not ( = ?auto_186432 ?auto_186430 ) ) ( not ( = ?auto_186435 ?auto_186434 ) ) ( not ( = ?auto_186435 ?auto_186431 ) ) ( not ( = ?auto_186435 ?auto_186430 ) ) ( not ( = ?auto_186427 ?auto_186432 ) ) ( not ( = ?auto_186427 ?auto_186435 ) ) ( not ( = ?auto_186428 ?auto_186432 ) ) ( not ( = ?auto_186428 ?auto_186435 ) ) ( not ( = ?auto_186429 ?auto_186432 ) ) ( not ( = ?auto_186429 ?auto_186435 ) ) ( ON ?auto_186427 ?auto_186433 ) ( not ( = ?auto_186427 ?auto_186433 ) ) ( not ( = ?auto_186428 ?auto_186433 ) ) ( not ( = ?auto_186429 ?auto_186433 ) ) ( not ( = ?auto_186430 ?auto_186433 ) ) ( not ( = ?auto_186431 ?auto_186433 ) ) ( not ( = ?auto_186434 ?auto_186433 ) ) ( not ( = ?auto_186432 ?auto_186433 ) ) ( not ( = ?auto_186435 ?auto_186433 ) ) ( ON ?auto_186428 ?auto_186427 ) ( ON-TABLE ?auto_186433 ) ( ON ?auto_186429 ?auto_186428 ) ( CLEAR ?auto_186431 ) ( ON ?auto_186430 ?auto_186429 ) ( CLEAR ?auto_186430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186433 ?auto_186427 ?auto_186428 ?auto_186429 )
      ( MAKE-5PILE ?auto_186427 ?auto_186428 ?auto_186429 ?auto_186430 ?auto_186431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186436 - BLOCK
      ?auto_186437 - BLOCK
      ?auto_186438 - BLOCK
      ?auto_186439 - BLOCK
      ?auto_186440 - BLOCK
    )
    :vars
    (
      ?auto_186441 - BLOCK
      ?auto_186442 - BLOCK
      ?auto_186443 - BLOCK
      ?auto_186444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186436 ?auto_186437 ) ) ( not ( = ?auto_186436 ?auto_186438 ) ) ( not ( = ?auto_186436 ?auto_186439 ) ) ( not ( = ?auto_186436 ?auto_186440 ) ) ( not ( = ?auto_186437 ?auto_186438 ) ) ( not ( = ?auto_186437 ?auto_186439 ) ) ( not ( = ?auto_186437 ?auto_186440 ) ) ( not ( = ?auto_186438 ?auto_186439 ) ) ( not ( = ?auto_186438 ?auto_186440 ) ) ( not ( = ?auto_186439 ?auto_186440 ) ) ( not ( = ?auto_186436 ?auto_186441 ) ) ( not ( = ?auto_186437 ?auto_186441 ) ) ( not ( = ?auto_186438 ?auto_186441 ) ) ( not ( = ?auto_186439 ?auto_186441 ) ) ( not ( = ?auto_186440 ?auto_186441 ) ) ( ON-TABLE ?auto_186442 ) ( ON ?auto_186443 ?auto_186442 ) ( ON ?auto_186441 ?auto_186443 ) ( not ( = ?auto_186442 ?auto_186443 ) ) ( not ( = ?auto_186442 ?auto_186441 ) ) ( not ( = ?auto_186442 ?auto_186440 ) ) ( not ( = ?auto_186442 ?auto_186439 ) ) ( not ( = ?auto_186443 ?auto_186441 ) ) ( not ( = ?auto_186443 ?auto_186440 ) ) ( not ( = ?auto_186443 ?auto_186439 ) ) ( not ( = ?auto_186436 ?auto_186442 ) ) ( not ( = ?auto_186436 ?auto_186443 ) ) ( not ( = ?auto_186437 ?auto_186442 ) ) ( not ( = ?auto_186437 ?auto_186443 ) ) ( not ( = ?auto_186438 ?auto_186442 ) ) ( not ( = ?auto_186438 ?auto_186443 ) ) ( ON ?auto_186436 ?auto_186444 ) ( not ( = ?auto_186436 ?auto_186444 ) ) ( not ( = ?auto_186437 ?auto_186444 ) ) ( not ( = ?auto_186438 ?auto_186444 ) ) ( not ( = ?auto_186439 ?auto_186444 ) ) ( not ( = ?auto_186440 ?auto_186444 ) ) ( not ( = ?auto_186441 ?auto_186444 ) ) ( not ( = ?auto_186442 ?auto_186444 ) ) ( not ( = ?auto_186443 ?auto_186444 ) ) ( ON ?auto_186437 ?auto_186436 ) ( ON-TABLE ?auto_186444 ) ( ON ?auto_186438 ?auto_186437 ) ( ON ?auto_186439 ?auto_186438 ) ( CLEAR ?auto_186439 ) ( HOLDING ?auto_186440 ) ( CLEAR ?auto_186441 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186442 ?auto_186443 ?auto_186441 ?auto_186440 )
      ( MAKE-5PILE ?auto_186436 ?auto_186437 ?auto_186438 ?auto_186439 ?auto_186440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186445 - BLOCK
      ?auto_186446 - BLOCK
      ?auto_186447 - BLOCK
      ?auto_186448 - BLOCK
      ?auto_186449 - BLOCK
    )
    :vars
    (
      ?auto_186452 - BLOCK
      ?auto_186450 - BLOCK
      ?auto_186451 - BLOCK
      ?auto_186453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186445 ?auto_186446 ) ) ( not ( = ?auto_186445 ?auto_186447 ) ) ( not ( = ?auto_186445 ?auto_186448 ) ) ( not ( = ?auto_186445 ?auto_186449 ) ) ( not ( = ?auto_186446 ?auto_186447 ) ) ( not ( = ?auto_186446 ?auto_186448 ) ) ( not ( = ?auto_186446 ?auto_186449 ) ) ( not ( = ?auto_186447 ?auto_186448 ) ) ( not ( = ?auto_186447 ?auto_186449 ) ) ( not ( = ?auto_186448 ?auto_186449 ) ) ( not ( = ?auto_186445 ?auto_186452 ) ) ( not ( = ?auto_186446 ?auto_186452 ) ) ( not ( = ?auto_186447 ?auto_186452 ) ) ( not ( = ?auto_186448 ?auto_186452 ) ) ( not ( = ?auto_186449 ?auto_186452 ) ) ( ON-TABLE ?auto_186450 ) ( ON ?auto_186451 ?auto_186450 ) ( ON ?auto_186452 ?auto_186451 ) ( not ( = ?auto_186450 ?auto_186451 ) ) ( not ( = ?auto_186450 ?auto_186452 ) ) ( not ( = ?auto_186450 ?auto_186449 ) ) ( not ( = ?auto_186450 ?auto_186448 ) ) ( not ( = ?auto_186451 ?auto_186452 ) ) ( not ( = ?auto_186451 ?auto_186449 ) ) ( not ( = ?auto_186451 ?auto_186448 ) ) ( not ( = ?auto_186445 ?auto_186450 ) ) ( not ( = ?auto_186445 ?auto_186451 ) ) ( not ( = ?auto_186446 ?auto_186450 ) ) ( not ( = ?auto_186446 ?auto_186451 ) ) ( not ( = ?auto_186447 ?auto_186450 ) ) ( not ( = ?auto_186447 ?auto_186451 ) ) ( ON ?auto_186445 ?auto_186453 ) ( not ( = ?auto_186445 ?auto_186453 ) ) ( not ( = ?auto_186446 ?auto_186453 ) ) ( not ( = ?auto_186447 ?auto_186453 ) ) ( not ( = ?auto_186448 ?auto_186453 ) ) ( not ( = ?auto_186449 ?auto_186453 ) ) ( not ( = ?auto_186452 ?auto_186453 ) ) ( not ( = ?auto_186450 ?auto_186453 ) ) ( not ( = ?auto_186451 ?auto_186453 ) ) ( ON ?auto_186446 ?auto_186445 ) ( ON-TABLE ?auto_186453 ) ( ON ?auto_186447 ?auto_186446 ) ( ON ?auto_186448 ?auto_186447 ) ( CLEAR ?auto_186452 ) ( ON ?auto_186449 ?auto_186448 ) ( CLEAR ?auto_186449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186453 ?auto_186445 ?auto_186446 ?auto_186447 ?auto_186448 )
      ( MAKE-5PILE ?auto_186445 ?auto_186446 ?auto_186447 ?auto_186448 ?auto_186449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186454 - BLOCK
      ?auto_186455 - BLOCK
      ?auto_186456 - BLOCK
      ?auto_186457 - BLOCK
      ?auto_186458 - BLOCK
    )
    :vars
    (
      ?auto_186461 - BLOCK
      ?auto_186459 - BLOCK
      ?auto_186462 - BLOCK
      ?auto_186460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186454 ?auto_186455 ) ) ( not ( = ?auto_186454 ?auto_186456 ) ) ( not ( = ?auto_186454 ?auto_186457 ) ) ( not ( = ?auto_186454 ?auto_186458 ) ) ( not ( = ?auto_186455 ?auto_186456 ) ) ( not ( = ?auto_186455 ?auto_186457 ) ) ( not ( = ?auto_186455 ?auto_186458 ) ) ( not ( = ?auto_186456 ?auto_186457 ) ) ( not ( = ?auto_186456 ?auto_186458 ) ) ( not ( = ?auto_186457 ?auto_186458 ) ) ( not ( = ?auto_186454 ?auto_186461 ) ) ( not ( = ?auto_186455 ?auto_186461 ) ) ( not ( = ?auto_186456 ?auto_186461 ) ) ( not ( = ?auto_186457 ?auto_186461 ) ) ( not ( = ?auto_186458 ?auto_186461 ) ) ( ON-TABLE ?auto_186459 ) ( ON ?auto_186462 ?auto_186459 ) ( not ( = ?auto_186459 ?auto_186462 ) ) ( not ( = ?auto_186459 ?auto_186461 ) ) ( not ( = ?auto_186459 ?auto_186458 ) ) ( not ( = ?auto_186459 ?auto_186457 ) ) ( not ( = ?auto_186462 ?auto_186461 ) ) ( not ( = ?auto_186462 ?auto_186458 ) ) ( not ( = ?auto_186462 ?auto_186457 ) ) ( not ( = ?auto_186454 ?auto_186459 ) ) ( not ( = ?auto_186454 ?auto_186462 ) ) ( not ( = ?auto_186455 ?auto_186459 ) ) ( not ( = ?auto_186455 ?auto_186462 ) ) ( not ( = ?auto_186456 ?auto_186459 ) ) ( not ( = ?auto_186456 ?auto_186462 ) ) ( ON ?auto_186454 ?auto_186460 ) ( not ( = ?auto_186454 ?auto_186460 ) ) ( not ( = ?auto_186455 ?auto_186460 ) ) ( not ( = ?auto_186456 ?auto_186460 ) ) ( not ( = ?auto_186457 ?auto_186460 ) ) ( not ( = ?auto_186458 ?auto_186460 ) ) ( not ( = ?auto_186461 ?auto_186460 ) ) ( not ( = ?auto_186459 ?auto_186460 ) ) ( not ( = ?auto_186462 ?auto_186460 ) ) ( ON ?auto_186455 ?auto_186454 ) ( ON-TABLE ?auto_186460 ) ( ON ?auto_186456 ?auto_186455 ) ( ON ?auto_186457 ?auto_186456 ) ( ON ?auto_186458 ?auto_186457 ) ( CLEAR ?auto_186458 ) ( HOLDING ?auto_186461 ) ( CLEAR ?auto_186462 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186459 ?auto_186462 ?auto_186461 )
      ( MAKE-5PILE ?auto_186454 ?auto_186455 ?auto_186456 ?auto_186457 ?auto_186458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186463 - BLOCK
      ?auto_186464 - BLOCK
      ?auto_186465 - BLOCK
      ?auto_186466 - BLOCK
      ?auto_186467 - BLOCK
    )
    :vars
    (
      ?auto_186471 - BLOCK
      ?auto_186469 - BLOCK
      ?auto_186470 - BLOCK
      ?auto_186468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186463 ?auto_186464 ) ) ( not ( = ?auto_186463 ?auto_186465 ) ) ( not ( = ?auto_186463 ?auto_186466 ) ) ( not ( = ?auto_186463 ?auto_186467 ) ) ( not ( = ?auto_186464 ?auto_186465 ) ) ( not ( = ?auto_186464 ?auto_186466 ) ) ( not ( = ?auto_186464 ?auto_186467 ) ) ( not ( = ?auto_186465 ?auto_186466 ) ) ( not ( = ?auto_186465 ?auto_186467 ) ) ( not ( = ?auto_186466 ?auto_186467 ) ) ( not ( = ?auto_186463 ?auto_186471 ) ) ( not ( = ?auto_186464 ?auto_186471 ) ) ( not ( = ?auto_186465 ?auto_186471 ) ) ( not ( = ?auto_186466 ?auto_186471 ) ) ( not ( = ?auto_186467 ?auto_186471 ) ) ( ON-TABLE ?auto_186469 ) ( ON ?auto_186470 ?auto_186469 ) ( not ( = ?auto_186469 ?auto_186470 ) ) ( not ( = ?auto_186469 ?auto_186471 ) ) ( not ( = ?auto_186469 ?auto_186467 ) ) ( not ( = ?auto_186469 ?auto_186466 ) ) ( not ( = ?auto_186470 ?auto_186471 ) ) ( not ( = ?auto_186470 ?auto_186467 ) ) ( not ( = ?auto_186470 ?auto_186466 ) ) ( not ( = ?auto_186463 ?auto_186469 ) ) ( not ( = ?auto_186463 ?auto_186470 ) ) ( not ( = ?auto_186464 ?auto_186469 ) ) ( not ( = ?auto_186464 ?auto_186470 ) ) ( not ( = ?auto_186465 ?auto_186469 ) ) ( not ( = ?auto_186465 ?auto_186470 ) ) ( ON ?auto_186463 ?auto_186468 ) ( not ( = ?auto_186463 ?auto_186468 ) ) ( not ( = ?auto_186464 ?auto_186468 ) ) ( not ( = ?auto_186465 ?auto_186468 ) ) ( not ( = ?auto_186466 ?auto_186468 ) ) ( not ( = ?auto_186467 ?auto_186468 ) ) ( not ( = ?auto_186471 ?auto_186468 ) ) ( not ( = ?auto_186469 ?auto_186468 ) ) ( not ( = ?auto_186470 ?auto_186468 ) ) ( ON ?auto_186464 ?auto_186463 ) ( ON-TABLE ?auto_186468 ) ( ON ?auto_186465 ?auto_186464 ) ( ON ?auto_186466 ?auto_186465 ) ( ON ?auto_186467 ?auto_186466 ) ( CLEAR ?auto_186470 ) ( ON ?auto_186471 ?auto_186467 ) ( CLEAR ?auto_186471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186468 ?auto_186463 ?auto_186464 ?auto_186465 ?auto_186466 ?auto_186467 )
      ( MAKE-5PILE ?auto_186463 ?auto_186464 ?auto_186465 ?auto_186466 ?auto_186467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186472 - BLOCK
      ?auto_186473 - BLOCK
      ?auto_186474 - BLOCK
      ?auto_186475 - BLOCK
      ?auto_186476 - BLOCK
    )
    :vars
    (
      ?auto_186477 - BLOCK
      ?auto_186478 - BLOCK
      ?auto_186479 - BLOCK
      ?auto_186480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186472 ?auto_186473 ) ) ( not ( = ?auto_186472 ?auto_186474 ) ) ( not ( = ?auto_186472 ?auto_186475 ) ) ( not ( = ?auto_186472 ?auto_186476 ) ) ( not ( = ?auto_186473 ?auto_186474 ) ) ( not ( = ?auto_186473 ?auto_186475 ) ) ( not ( = ?auto_186473 ?auto_186476 ) ) ( not ( = ?auto_186474 ?auto_186475 ) ) ( not ( = ?auto_186474 ?auto_186476 ) ) ( not ( = ?auto_186475 ?auto_186476 ) ) ( not ( = ?auto_186472 ?auto_186477 ) ) ( not ( = ?auto_186473 ?auto_186477 ) ) ( not ( = ?auto_186474 ?auto_186477 ) ) ( not ( = ?auto_186475 ?auto_186477 ) ) ( not ( = ?auto_186476 ?auto_186477 ) ) ( ON-TABLE ?auto_186478 ) ( not ( = ?auto_186478 ?auto_186479 ) ) ( not ( = ?auto_186478 ?auto_186477 ) ) ( not ( = ?auto_186478 ?auto_186476 ) ) ( not ( = ?auto_186478 ?auto_186475 ) ) ( not ( = ?auto_186479 ?auto_186477 ) ) ( not ( = ?auto_186479 ?auto_186476 ) ) ( not ( = ?auto_186479 ?auto_186475 ) ) ( not ( = ?auto_186472 ?auto_186478 ) ) ( not ( = ?auto_186472 ?auto_186479 ) ) ( not ( = ?auto_186473 ?auto_186478 ) ) ( not ( = ?auto_186473 ?auto_186479 ) ) ( not ( = ?auto_186474 ?auto_186478 ) ) ( not ( = ?auto_186474 ?auto_186479 ) ) ( ON ?auto_186472 ?auto_186480 ) ( not ( = ?auto_186472 ?auto_186480 ) ) ( not ( = ?auto_186473 ?auto_186480 ) ) ( not ( = ?auto_186474 ?auto_186480 ) ) ( not ( = ?auto_186475 ?auto_186480 ) ) ( not ( = ?auto_186476 ?auto_186480 ) ) ( not ( = ?auto_186477 ?auto_186480 ) ) ( not ( = ?auto_186478 ?auto_186480 ) ) ( not ( = ?auto_186479 ?auto_186480 ) ) ( ON ?auto_186473 ?auto_186472 ) ( ON-TABLE ?auto_186480 ) ( ON ?auto_186474 ?auto_186473 ) ( ON ?auto_186475 ?auto_186474 ) ( ON ?auto_186476 ?auto_186475 ) ( ON ?auto_186477 ?auto_186476 ) ( CLEAR ?auto_186477 ) ( HOLDING ?auto_186479 ) ( CLEAR ?auto_186478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186478 ?auto_186479 )
      ( MAKE-5PILE ?auto_186472 ?auto_186473 ?auto_186474 ?auto_186475 ?auto_186476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186481 - BLOCK
      ?auto_186482 - BLOCK
      ?auto_186483 - BLOCK
      ?auto_186484 - BLOCK
      ?auto_186485 - BLOCK
    )
    :vars
    (
      ?auto_186487 - BLOCK
      ?auto_186488 - BLOCK
      ?auto_186489 - BLOCK
      ?auto_186486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186481 ?auto_186482 ) ) ( not ( = ?auto_186481 ?auto_186483 ) ) ( not ( = ?auto_186481 ?auto_186484 ) ) ( not ( = ?auto_186481 ?auto_186485 ) ) ( not ( = ?auto_186482 ?auto_186483 ) ) ( not ( = ?auto_186482 ?auto_186484 ) ) ( not ( = ?auto_186482 ?auto_186485 ) ) ( not ( = ?auto_186483 ?auto_186484 ) ) ( not ( = ?auto_186483 ?auto_186485 ) ) ( not ( = ?auto_186484 ?auto_186485 ) ) ( not ( = ?auto_186481 ?auto_186487 ) ) ( not ( = ?auto_186482 ?auto_186487 ) ) ( not ( = ?auto_186483 ?auto_186487 ) ) ( not ( = ?auto_186484 ?auto_186487 ) ) ( not ( = ?auto_186485 ?auto_186487 ) ) ( ON-TABLE ?auto_186488 ) ( not ( = ?auto_186488 ?auto_186489 ) ) ( not ( = ?auto_186488 ?auto_186487 ) ) ( not ( = ?auto_186488 ?auto_186485 ) ) ( not ( = ?auto_186488 ?auto_186484 ) ) ( not ( = ?auto_186489 ?auto_186487 ) ) ( not ( = ?auto_186489 ?auto_186485 ) ) ( not ( = ?auto_186489 ?auto_186484 ) ) ( not ( = ?auto_186481 ?auto_186488 ) ) ( not ( = ?auto_186481 ?auto_186489 ) ) ( not ( = ?auto_186482 ?auto_186488 ) ) ( not ( = ?auto_186482 ?auto_186489 ) ) ( not ( = ?auto_186483 ?auto_186488 ) ) ( not ( = ?auto_186483 ?auto_186489 ) ) ( ON ?auto_186481 ?auto_186486 ) ( not ( = ?auto_186481 ?auto_186486 ) ) ( not ( = ?auto_186482 ?auto_186486 ) ) ( not ( = ?auto_186483 ?auto_186486 ) ) ( not ( = ?auto_186484 ?auto_186486 ) ) ( not ( = ?auto_186485 ?auto_186486 ) ) ( not ( = ?auto_186487 ?auto_186486 ) ) ( not ( = ?auto_186488 ?auto_186486 ) ) ( not ( = ?auto_186489 ?auto_186486 ) ) ( ON ?auto_186482 ?auto_186481 ) ( ON-TABLE ?auto_186486 ) ( ON ?auto_186483 ?auto_186482 ) ( ON ?auto_186484 ?auto_186483 ) ( ON ?auto_186485 ?auto_186484 ) ( ON ?auto_186487 ?auto_186485 ) ( CLEAR ?auto_186488 ) ( ON ?auto_186489 ?auto_186487 ) ( CLEAR ?auto_186489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186486 ?auto_186481 ?auto_186482 ?auto_186483 ?auto_186484 ?auto_186485 ?auto_186487 )
      ( MAKE-5PILE ?auto_186481 ?auto_186482 ?auto_186483 ?auto_186484 ?auto_186485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186490 - BLOCK
      ?auto_186491 - BLOCK
      ?auto_186492 - BLOCK
      ?auto_186493 - BLOCK
      ?auto_186494 - BLOCK
    )
    :vars
    (
      ?auto_186495 - BLOCK
      ?auto_186498 - BLOCK
      ?auto_186496 - BLOCK
      ?auto_186497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186490 ?auto_186491 ) ) ( not ( = ?auto_186490 ?auto_186492 ) ) ( not ( = ?auto_186490 ?auto_186493 ) ) ( not ( = ?auto_186490 ?auto_186494 ) ) ( not ( = ?auto_186491 ?auto_186492 ) ) ( not ( = ?auto_186491 ?auto_186493 ) ) ( not ( = ?auto_186491 ?auto_186494 ) ) ( not ( = ?auto_186492 ?auto_186493 ) ) ( not ( = ?auto_186492 ?auto_186494 ) ) ( not ( = ?auto_186493 ?auto_186494 ) ) ( not ( = ?auto_186490 ?auto_186495 ) ) ( not ( = ?auto_186491 ?auto_186495 ) ) ( not ( = ?auto_186492 ?auto_186495 ) ) ( not ( = ?auto_186493 ?auto_186495 ) ) ( not ( = ?auto_186494 ?auto_186495 ) ) ( not ( = ?auto_186498 ?auto_186496 ) ) ( not ( = ?auto_186498 ?auto_186495 ) ) ( not ( = ?auto_186498 ?auto_186494 ) ) ( not ( = ?auto_186498 ?auto_186493 ) ) ( not ( = ?auto_186496 ?auto_186495 ) ) ( not ( = ?auto_186496 ?auto_186494 ) ) ( not ( = ?auto_186496 ?auto_186493 ) ) ( not ( = ?auto_186490 ?auto_186498 ) ) ( not ( = ?auto_186490 ?auto_186496 ) ) ( not ( = ?auto_186491 ?auto_186498 ) ) ( not ( = ?auto_186491 ?auto_186496 ) ) ( not ( = ?auto_186492 ?auto_186498 ) ) ( not ( = ?auto_186492 ?auto_186496 ) ) ( ON ?auto_186490 ?auto_186497 ) ( not ( = ?auto_186490 ?auto_186497 ) ) ( not ( = ?auto_186491 ?auto_186497 ) ) ( not ( = ?auto_186492 ?auto_186497 ) ) ( not ( = ?auto_186493 ?auto_186497 ) ) ( not ( = ?auto_186494 ?auto_186497 ) ) ( not ( = ?auto_186495 ?auto_186497 ) ) ( not ( = ?auto_186498 ?auto_186497 ) ) ( not ( = ?auto_186496 ?auto_186497 ) ) ( ON ?auto_186491 ?auto_186490 ) ( ON-TABLE ?auto_186497 ) ( ON ?auto_186492 ?auto_186491 ) ( ON ?auto_186493 ?auto_186492 ) ( ON ?auto_186494 ?auto_186493 ) ( ON ?auto_186495 ?auto_186494 ) ( ON ?auto_186496 ?auto_186495 ) ( CLEAR ?auto_186496 ) ( HOLDING ?auto_186498 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186498 )
      ( MAKE-5PILE ?auto_186490 ?auto_186491 ?auto_186492 ?auto_186493 ?auto_186494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186499 - BLOCK
      ?auto_186500 - BLOCK
      ?auto_186501 - BLOCK
      ?auto_186502 - BLOCK
      ?auto_186503 - BLOCK
    )
    :vars
    (
      ?auto_186506 - BLOCK
      ?auto_186504 - BLOCK
      ?auto_186507 - BLOCK
      ?auto_186505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186499 ?auto_186500 ) ) ( not ( = ?auto_186499 ?auto_186501 ) ) ( not ( = ?auto_186499 ?auto_186502 ) ) ( not ( = ?auto_186499 ?auto_186503 ) ) ( not ( = ?auto_186500 ?auto_186501 ) ) ( not ( = ?auto_186500 ?auto_186502 ) ) ( not ( = ?auto_186500 ?auto_186503 ) ) ( not ( = ?auto_186501 ?auto_186502 ) ) ( not ( = ?auto_186501 ?auto_186503 ) ) ( not ( = ?auto_186502 ?auto_186503 ) ) ( not ( = ?auto_186499 ?auto_186506 ) ) ( not ( = ?auto_186500 ?auto_186506 ) ) ( not ( = ?auto_186501 ?auto_186506 ) ) ( not ( = ?auto_186502 ?auto_186506 ) ) ( not ( = ?auto_186503 ?auto_186506 ) ) ( not ( = ?auto_186504 ?auto_186507 ) ) ( not ( = ?auto_186504 ?auto_186506 ) ) ( not ( = ?auto_186504 ?auto_186503 ) ) ( not ( = ?auto_186504 ?auto_186502 ) ) ( not ( = ?auto_186507 ?auto_186506 ) ) ( not ( = ?auto_186507 ?auto_186503 ) ) ( not ( = ?auto_186507 ?auto_186502 ) ) ( not ( = ?auto_186499 ?auto_186504 ) ) ( not ( = ?auto_186499 ?auto_186507 ) ) ( not ( = ?auto_186500 ?auto_186504 ) ) ( not ( = ?auto_186500 ?auto_186507 ) ) ( not ( = ?auto_186501 ?auto_186504 ) ) ( not ( = ?auto_186501 ?auto_186507 ) ) ( ON ?auto_186499 ?auto_186505 ) ( not ( = ?auto_186499 ?auto_186505 ) ) ( not ( = ?auto_186500 ?auto_186505 ) ) ( not ( = ?auto_186501 ?auto_186505 ) ) ( not ( = ?auto_186502 ?auto_186505 ) ) ( not ( = ?auto_186503 ?auto_186505 ) ) ( not ( = ?auto_186506 ?auto_186505 ) ) ( not ( = ?auto_186504 ?auto_186505 ) ) ( not ( = ?auto_186507 ?auto_186505 ) ) ( ON ?auto_186500 ?auto_186499 ) ( ON-TABLE ?auto_186505 ) ( ON ?auto_186501 ?auto_186500 ) ( ON ?auto_186502 ?auto_186501 ) ( ON ?auto_186503 ?auto_186502 ) ( ON ?auto_186506 ?auto_186503 ) ( ON ?auto_186507 ?auto_186506 ) ( ON ?auto_186504 ?auto_186507 ) ( CLEAR ?auto_186504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186505 ?auto_186499 ?auto_186500 ?auto_186501 ?auto_186502 ?auto_186503 ?auto_186506 ?auto_186507 )
      ( MAKE-5PILE ?auto_186499 ?auto_186500 ?auto_186501 ?auto_186502 ?auto_186503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186510 - BLOCK
      ?auto_186511 - BLOCK
    )
    :vars
    (
      ?auto_186512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186512 ?auto_186511 ) ( CLEAR ?auto_186512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186510 ) ( ON ?auto_186511 ?auto_186510 ) ( not ( = ?auto_186510 ?auto_186511 ) ) ( not ( = ?auto_186510 ?auto_186512 ) ) ( not ( = ?auto_186511 ?auto_186512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186512 ?auto_186511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186513 - BLOCK
      ?auto_186514 - BLOCK
    )
    :vars
    (
      ?auto_186515 - BLOCK
      ?auto_186516 - BLOCK
      ?auto_186517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186515 ?auto_186514 ) ( CLEAR ?auto_186515 ) ( ON-TABLE ?auto_186513 ) ( ON ?auto_186514 ?auto_186513 ) ( not ( = ?auto_186513 ?auto_186514 ) ) ( not ( = ?auto_186513 ?auto_186515 ) ) ( not ( = ?auto_186514 ?auto_186515 ) ) ( HOLDING ?auto_186516 ) ( CLEAR ?auto_186517 ) ( not ( = ?auto_186513 ?auto_186516 ) ) ( not ( = ?auto_186513 ?auto_186517 ) ) ( not ( = ?auto_186514 ?auto_186516 ) ) ( not ( = ?auto_186514 ?auto_186517 ) ) ( not ( = ?auto_186515 ?auto_186516 ) ) ( not ( = ?auto_186515 ?auto_186517 ) ) ( not ( = ?auto_186516 ?auto_186517 ) ) )
    :subtasks
    ( ( !STACK ?auto_186516 ?auto_186517 )
      ( MAKE-2PILE ?auto_186513 ?auto_186514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186518 - BLOCK
      ?auto_186519 - BLOCK
    )
    :vars
    (
      ?auto_186521 - BLOCK
      ?auto_186520 - BLOCK
      ?auto_186522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186521 ?auto_186519 ) ( ON-TABLE ?auto_186518 ) ( ON ?auto_186519 ?auto_186518 ) ( not ( = ?auto_186518 ?auto_186519 ) ) ( not ( = ?auto_186518 ?auto_186521 ) ) ( not ( = ?auto_186519 ?auto_186521 ) ) ( CLEAR ?auto_186520 ) ( not ( = ?auto_186518 ?auto_186522 ) ) ( not ( = ?auto_186518 ?auto_186520 ) ) ( not ( = ?auto_186519 ?auto_186522 ) ) ( not ( = ?auto_186519 ?auto_186520 ) ) ( not ( = ?auto_186521 ?auto_186522 ) ) ( not ( = ?auto_186521 ?auto_186520 ) ) ( not ( = ?auto_186522 ?auto_186520 ) ) ( ON ?auto_186522 ?auto_186521 ) ( CLEAR ?auto_186522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186518 ?auto_186519 ?auto_186521 )
      ( MAKE-2PILE ?auto_186518 ?auto_186519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186523 - BLOCK
      ?auto_186524 - BLOCK
    )
    :vars
    (
      ?auto_186525 - BLOCK
      ?auto_186527 - BLOCK
      ?auto_186526 - BLOCK
      ?auto_186528 - BLOCK
      ?auto_186529 - BLOCK
      ?auto_186530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186525 ?auto_186524 ) ( ON-TABLE ?auto_186523 ) ( ON ?auto_186524 ?auto_186523 ) ( not ( = ?auto_186523 ?auto_186524 ) ) ( not ( = ?auto_186523 ?auto_186525 ) ) ( not ( = ?auto_186524 ?auto_186525 ) ) ( not ( = ?auto_186523 ?auto_186527 ) ) ( not ( = ?auto_186523 ?auto_186526 ) ) ( not ( = ?auto_186524 ?auto_186527 ) ) ( not ( = ?auto_186524 ?auto_186526 ) ) ( not ( = ?auto_186525 ?auto_186527 ) ) ( not ( = ?auto_186525 ?auto_186526 ) ) ( not ( = ?auto_186527 ?auto_186526 ) ) ( ON ?auto_186527 ?auto_186525 ) ( CLEAR ?auto_186527 ) ( HOLDING ?auto_186526 ) ( CLEAR ?auto_186528 ) ( ON-TABLE ?auto_186529 ) ( ON ?auto_186530 ?auto_186529 ) ( ON ?auto_186528 ?auto_186530 ) ( not ( = ?auto_186529 ?auto_186530 ) ) ( not ( = ?auto_186529 ?auto_186528 ) ) ( not ( = ?auto_186529 ?auto_186526 ) ) ( not ( = ?auto_186530 ?auto_186528 ) ) ( not ( = ?auto_186530 ?auto_186526 ) ) ( not ( = ?auto_186528 ?auto_186526 ) ) ( not ( = ?auto_186523 ?auto_186528 ) ) ( not ( = ?auto_186523 ?auto_186529 ) ) ( not ( = ?auto_186523 ?auto_186530 ) ) ( not ( = ?auto_186524 ?auto_186528 ) ) ( not ( = ?auto_186524 ?auto_186529 ) ) ( not ( = ?auto_186524 ?auto_186530 ) ) ( not ( = ?auto_186525 ?auto_186528 ) ) ( not ( = ?auto_186525 ?auto_186529 ) ) ( not ( = ?auto_186525 ?auto_186530 ) ) ( not ( = ?auto_186527 ?auto_186528 ) ) ( not ( = ?auto_186527 ?auto_186529 ) ) ( not ( = ?auto_186527 ?auto_186530 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186529 ?auto_186530 ?auto_186528 ?auto_186526 )
      ( MAKE-2PILE ?auto_186523 ?auto_186524 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186531 - BLOCK
      ?auto_186532 - BLOCK
    )
    :vars
    (
      ?auto_186535 - BLOCK
      ?auto_186538 - BLOCK
      ?auto_186536 - BLOCK
      ?auto_186534 - BLOCK
      ?auto_186533 - BLOCK
      ?auto_186537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186535 ?auto_186532 ) ( ON-TABLE ?auto_186531 ) ( ON ?auto_186532 ?auto_186531 ) ( not ( = ?auto_186531 ?auto_186532 ) ) ( not ( = ?auto_186531 ?auto_186535 ) ) ( not ( = ?auto_186532 ?auto_186535 ) ) ( not ( = ?auto_186531 ?auto_186538 ) ) ( not ( = ?auto_186531 ?auto_186536 ) ) ( not ( = ?auto_186532 ?auto_186538 ) ) ( not ( = ?auto_186532 ?auto_186536 ) ) ( not ( = ?auto_186535 ?auto_186538 ) ) ( not ( = ?auto_186535 ?auto_186536 ) ) ( not ( = ?auto_186538 ?auto_186536 ) ) ( ON ?auto_186538 ?auto_186535 ) ( CLEAR ?auto_186534 ) ( ON-TABLE ?auto_186533 ) ( ON ?auto_186537 ?auto_186533 ) ( ON ?auto_186534 ?auto_186537 ) ( not ( = ?auto_186533 ?auto_186537 ) ) ( not ( = ?auto_186533 ?auto_186534 ) ) ( not ( = ?auto_186533 ?auto_186536 ) ) ( not ( = ?auto_186537 ?auto_186534 ) ) ( not ( = ?auto_186537 ?auto_186536 ) ) ( not ( = ?auto_186534 ?auto_186536 ) ) ( not ( = ?auto_186531 ?auto_186534 ) ) ( not ( = ?auto_186531 ?auto_186533 ) ) ( not ( = ?auto_186531 ?auto_186537 ) ) ( not ( = ?auto_186532 ?auto_186534 ) ) ( not ( = ?auto_186532 ?auto_186533 ) ) ( not ( = ?auto_186532 ?auto_186537 ) ) ( not ( = ?auto_186535 ?auto_186534 ) ) ( not ( = ?auto_186535 ?auto_186533 ) ) ( not ( = ?auto_186535 ?auto_186537 ) ) ( not ( = ?auto_186538 ?auto_186534 ) ) ( not ( = ?auto_186538 ?auto_186533 ) ) ( not ( = ?auto_186538 ?auto_186537 ) ) ( ON ?auto_186536 ?auto_186538 ) ( CLEAR ?auto_186536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186531 ?auto_186532 ?auto_186535 ?auto_186538 )
      ( MAKE-2PILE ?auto_186531 ?auto_186532 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186539 - BLOCK
      ?auto_186540 - BLOCK
    )
    :vars
    (
      ?auto_186546 - BLOCK
      ?auto_186545 - BLOCK
      ?auto_186542 - BLOCK
      ?auto_186544 - BLOCK
      ?auto_186543 - BLOCK
      ?auto_186541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186546 ?auto_186540 ) ( ON-TABLE ?auto_186539 ) ( ON ?auto_186540 ?auto_186539 ) ( not ( = ?auto_186539 ?auto_186540 ) ) ( not ( = ?auto_186539 ?auto_186546 ) ) ( not ( = ?auto_186540 ?auto_186546 ) ) ( not ( = ?auto_186539 ?auto_186545 ) ) ( not ( = ?auto_186539 ?auto_186542 ) ) ( not ( = ?auto_186540 ?auto_186545 ) ) ( not ( = ?auto_186540 ?auto_186542 ) ) ( not ( = ?auto_186546 ?auto_186545 ) ) ( not ( = ?auto_186546 ?auto_186542 ) ) ( not ( = ?auto_186545 ?auto_186542 ) ) ( ON ?auto_186545 ?auto_186546 ) ( ON-TABLE ?auto_186544 ) ( ON ?auto_186543 ?auto_186544 ) ( not ( = ?auto_186544 ?auto_186543 ) ) ( not ( = ?auto_186544 ?auto_186541 ) ) ( not ( = ?auto_186544 ?auto_186542 ) ) ( not ( = ?auto_186543 ?auto_186541 ) ) ( not ( = ?auto_186543 ?auto_186542 ) ) ( not ( = ?auto_186541 ?auto_186542 ) ) ( not ( = ?auto_186539 ?auto_186541 ) ) ( not ( = ?auto_186539 ?auto_186544 ) ) ( not ( = ?auto_186539 ?auto_186543 ) ) ( not ( = ?auto_186540 ?auto_186541 ) ) ( not ( = ?auto_186540 ?auto_186544 ) ) ( not ( = ?auto_186540 ?auto_186543 ) ) ( not ( = ?auto_186546 ?auto_186541 ) ) ( not ( = ?auto_186546 ?auto_186544 ) ) ( not ( = ?auto_186546 ?auto_186543 ) ) ( not ( = ?auto_186545 ?auto_186541 ) ) ( not ( = ?auto_186545 ?auto_186544 ) ) ( not ( = ?auto_186545 ?auto_186543 ) ) ( ON ?auto_186542 ?auto_186545 ) ( CLEAR ?auto_186542 ) ( HOLDING ?auto_186541 ) ( CLEAR ?auto_186543 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186544 ?auto_186543 ?auto_186541 )
      ( MAKE-2PILE ?auto_186539 ?auto_186540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186547 - BLOCK
      ?auto_186548 - BLOCK
    )
    :vars
    (
      ?auto_186553 - BLOCK
      ?auto_186550 - BLOCK
      ?auto_186554 - BLOCK
      ?auto_186551 - BLOCK
      ?auto_186549 - BLOCK
      ?auto_186552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186553 ?auto_186548 ) ( ON-TABLE ?auto_186547 ) ( ON ?auto_186548 ?auto_186547 ) ( not ( = ?auto_186547 ?auto_186548 ) ) ( not ( = ?auto_186547 ?auto_186553 ) ) ( not ( = ?auto_186548 ?auto_186553 ) ) ( not ( = ?auto_186547 ?auto_186550 ) ) ( not ( = ?auto_186547 ?auto_186554 ) ) ( not ( = ?auto_186548 ?auto_186550 ) ) ( not ( = ?auto_186548 ?auto_186554 ) ) ( not ( = ?auto_186553 ?auto_186550 ) ) ( not ( = ?auto_186553 ?auto_186554 ) ) ( not ( = ?auto_186550 ?auto_186554 ) ) ( ON ?auto_186550 ?auto_186553 ) ( ON-TABLE ?auto_186551 ) ( ON ?auto_186549 ?auto_186551 ) ( not ( = ?auto_186551 ?auto_186549 ) ) ( not ( = ?auto_186551 ?auto_186552 ) ) ( not ( = ?auto_186551 ?auto_186554 ) ) ( not ( = ?auto_186549 ?auto_186552 ) ) ( not ( = ?auto_186549 ?auto_186554 ) ) ( not ( = ?auto_186552 ?auto_186554 ) ) ( not ( = ?auto_186547 ?auto_186552 ) ) ( not ( = ?auto_186547 ?auto_186551 ) ) ( not ( = ?auto_186547 ?auto_186549 ) ) ( not ( = ?auto_186548 ?auto_186552 ) ) ( not ( = ?auto_186548 ?auto_186551 ) ) ( not ( = ?auto_186548 ?auto_186549 ) ) ( not ( = ?auto_186553 ?auto_186552 ) ) ( not ( = ?auto_186553 ?auto_186551 ) ) ( not ( = ?auto_186553 ?auto_186549 ) ) ( not ( = ?auto_186550 ?auto_186552 ) ) ( not ( = ?auto_186550 ?auto_186551 ) ) ( not ( = ?auto_186550 ?auto_186549 ) ) ( ON ?auto_186554 ?auto_186550 ) ( CLEAR ?auto_186549 ) ( ON ?auto_186552 ?auto_186554 ) ( CLEAR ?auto_186552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186547 ?auto_186548 ?auto_186553 ?auto_186550 ?auto_186554 )
      ( MAKE-2PILE ?auto_186547 ?auto_186548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186555 - BLOCK
      ?auto_186556 - BLOCK
    )
    :vars
    (
      ?auto_186562 - BLOCK
      ?auto_186561 - BLOCK
      ?auto_186558 - BLOCK
      ?auto_186559 - BLOCK
      ?auto_186560 - BLOCK
      ?auto_186557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186562 ?auto_186556 ) ( ON-TABLE ?auto_186555 ) ( ON ?auto_186556 ?auto_186555 ) ( not ( = ?auto_186555 ?auto_186556 ) ) ( not ( = ?auto_186555 ?auto_186562 ) ) ( not ( = ?auto_186556 ?auto_186562 ) ) ( not ( = ?auto_186555 ?auto_186561 ) ) ( not ( = ?auto_186555 ?auto_186558 ) ) ( not ( = ?auto_186556 ?auto_186561 ) ) ( not ( = ?auto_186556 ?auto_186558 ) ) ( not ( = ?auto_186562 ?auto_186561 ) ) ( not ( = ?auto_186562 ?auto_186558 ) ) ( not ( = ?auto_186561 ?auto_186558 ) ) ( ON ?auto_186561 ?auto_186562 ) ( ON-TABLE ?auto_186559 ) ( not ( = ?auto_186559 ?auto_186560 ) ) ( not ( = ?auto_186559 ?auto_186557 ) ) ( not ( = ?auto_186559 ?auto_186558 ) ) ( not ( = ?auto_186560 ?auto_186557 ) ) ( not ( = ?auto_186560 ?auto_186558 ) ) ( not ( = ?auto_186557 ?auto_186558 ) ) ( not ( = ?auto_186555 ?auto_186557 ) ) ( not ( = ?auto_186555 ?auto_186559 ) ) ( not ( = ?auto_186555 ?auto_186560 ) ) ( not ( = ?auto_186556 ?auto_186557 ) ) ( not ( = ?auto_186556 ?auto_186559 ) ) ( not ( = ?auto_186556 ?auto_186560 ) ) ( not ( = ?auto_186562 ?auto_186557 ) ) ( not ( = ?auto_186562 ?auto_186559 ) ) ( not ( = ?auto_186562 ?auto_186560 ) ) ( not ( = ?auto_186561 ?auto_186557 ) ) ( not ( = ?auto_186561 ?auto_186559 ) ) ( not ( = ?auto_186561 ?auto_186560 ) ) ( ON ?auto_186558 ?auto_186561 ) ( ON ?auto_186557 ?auto_186558 ) ( CLEAR ?auto_186557 ) ( HOLDING ?auto_186560 ) ( CLEAR ?auto_186559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186559 ?auto_186560 )
      ( MAKE-2PILE ?auto_186555 ?auto_186556 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186563 - BLOCK
      ?auto_186564 - BLOCK
    )
    :vars
    (
      ?auto_186568 - BLOCK
      ?auto_186565 - BLOCK
      ?auto_186570 - BLOCK
      ?auto_186569 - BLOCK
      ?auto_186566 - BLOCK
      ?auto_186567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186568 ?auto_186564 ) ( ON-TABLE ?auto_186563 ) ( ON ?auto_186564 ?auto_186563 ) ( not ( = ?auto_186563 ?auto_186564 ) ) ( not ( = ?auto_186563 ?auto_186568 ) ) ( not ( = ?auto_186564 ?auto_186568 ) ) ( not ( = ?auto_186563 ?auto_186565 ) ) ( not ( = ?auto_186563 ?auto_186570 ) ) ( not ( = ?auto_186564 ?auto_186565 ) ) ( not ( = ?auto_186564 ?auto_186570 ) ) ( not ( = ?auto_186568 ?auto_186565 ) ) ( not ( = ?auto_186568 ?auto_186570 ) ) ( not ( = ?auto_186565 ?auto_186570 ) ) ( ON ?auto_186565 ?auto_186568 ) ( ON-TABLE ?auto_186569 ) ( not ( = ?auto_186569 ?auto_186566 ) ) ( not ( = ?auto_186569 ?auto_186567 ) ) ( not ( = ?auto_186569 ?auto_186570 ) ) ( not ( = ?auto_186566 ?auto_186567 ) ) ( not ( = ?auto_186566 ?auto_186570 ) ) ( not ( = ?auto_186567 ?auto_186570 ) ) ( not ( = ?auto_186563 ?auto_186567 ) ) ( not ( = ?auto_186563 ?auto_186569 ) ) ( not ( = ?auto_186563 ?auto_186566 ) ) ( not ( = ?auto_186564 ?auto_186567 ) ) ( not ( = ?auto_186564 ?auto_186569 ) ) ( not ( = ?auto_186564 ?auto_186566 ) ) ( not ( = ?auto_186568 ?auto_186567 ) ) ( not ( = ?auto_186568 ?auto_186569 ) ) ( not ( = ?auto_186568 ?auto_186566 ) ) ( not ( = ?auto_186565 ?auto_186567 ) ) ( not ( = ?auto_186565 ?auto_186569 ) ) ( not ( = ?auto_186565 ?auto_186566 ) ) ( ON ?auto_186570 ?auto_186565 ) ( ON ?auto_186567 ?auto_186570 ) ( CLEAR ?auto_186569 ) ( ON ?auto_186566 ?auto_186567 ) ( CLEAR ?auto_186566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186563 ?auto_186564 ?auto_186568 ?auto_186565 ?auto_186570 ?auto_186567 )
      ( MAKE-2PILE ?auto_186563 ?auto_186564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186571 - BLOCK
      ?auto_186572 - BLOCK
    )
    :vars
    (
      ?auto_186577 - BLOCK
      ?auto_186573 - BLOCK
      ?auto_186575 - BLOCK
      ?auto_186578 - BLOCK
      ?auto_186574 - BLOCK
      ?auto_186576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186577 ?auto_186572 ) ( ON-TABLE ?auto_186571 ) ( ON ?auto_186572 ?auto_186571 ) ( not ( = ?auto_186571 ?auto_186572 ) ) ( not ( = ?auto_186571 ?auto_186577 ) ) ( not ( = ?auto_186572 ?auto_186577 ) ) ( not ( = ?auto_186571 ?auto_186573 ) ) ( not ( = ?auto_186571 ?auto_186575 ) ) ( not ( = ?auto_186572 ?auto_186573 ) ) ( not ( = ?auto_186572 ?auto_186575 ) ) ( not ( = ?auto_186577 ?auto_186573 ) ) ( not ( = ?auto_186577 ?auto_186575 ) ) ( not ( = ?auto_186573 ?auto_186575 ) ) ( ON ?auto_186573 ?auto_186577 ) ( not ( = ?auto_186578 ?auto_186574 ) ) ( not ( = ?auto_186578 ?auto_186576 ) ) ( not ( = ?auto_186578 ?auto_186575 ) ) ( not ( = ?auto_186574 ?auto_186576 ) ) ( not ( = ?auto_186574 ?auto_186575 ) ) ( not ( = ?auto_186576 ?auto_186575 ) ) ( not ( = ?auto_186571 ?auto_186576 ) ) ( not ( = ?auto_186571 ?auto_186578 ) ) ( not ( = ?auto_186571 ?auto_186574 ) ) ( not ( = ?auto_186572 ?auto_186576 ) ) ( not ( = ?auto_186572 ?auto_186578 ) ) ( not ( = ?auto_186572 ?auto_186574 ) ) ( not ( = ?auto_186577 ?auto_186576 ) ) ( not ( = ?auto_186577 ?auto_186578 ) ) ( not ( = ?auto_186577 ?auto_186574 ) ) ( not ( = ?auto_186573 ?auto_186576 ) ) ( not ( = ?auto_186573 ?auto_186578 ) ) ( not ( = ?auto_186573 ?auto_186574 ) ) ( ON ?auto_186575 ?auto_186573 ) ( ON ?auto_186576 ?auto_186575 ) ( ON ?auto_186574 ?auto_186576 ) ( CLEAR ?auto_186574 ) ( HOLDING ?auto_186578 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186578 )
      ( MAKE-2PILE ?auto_186571 ?auto_186572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186579 - BLOCK
      ?auto_186580 - BLOCK
    )
    :vars
    (
      ?auto_186585 - BLOCK
      ?auto_186581 - BLOCK
      ?auto_186586 - BLOCK
      ?auto_186583 - BLOCK
      ?auto_186584 - BLOCK
      ?auto_186582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186585 ?auto_186580 ) ( ON-TABLE ?auto_186579 ) ( ON ?auto_186580 ?auto_186579 ) ( not ( = ?auto_186579 ?auto_186580 ) ) ( not ( = ?auto_186579 ?auto_186585 ) ) ( not ( = ?auto_186580 ?auto_186585 ) ) ( not ( = ?auto_186579 ?auto_186581 ) ) ( not ( = ?auto_186579 ?auto_186586 ) ) ( not ( = ?auto_186580 ?auto_186581 ) ) ( not ( = ?auto_186580 ?auto_186586 ) ) ( not ( = ?auto_186585 ?auto_186581 ) ) ( not ( = ?auto_186585 ?auto_186586 ) ) ( not ( = ?auto_186581 ?auto_186586 ) ) ( ON ?auto_186581 ?auto_186585 ) ( not ( = ?auto_186583 ?auto_186584 ) ) ( not ( = ?auto_186583 ?auto_186582 ) ) ( not ( = ?auto_186583 ?auto_186586 ) ) ( not ( = ?auto_186584 ?auto_186582 ) ) ( not ( = ?auto_186584 ?auto_186586 ) ) ( not ( = ?auto_186582 ?auto_186586 ) ) ( not ( = ?auto_186579 ?auto_186582 ) ) ( not ( = ?auto_186579 ?auto_186583 ) ) ( not ( = ?auto_186579 ?auto_186584 ) ) ( not ( = ?auto_186580 ?auto_186582 ) ) ( not ( = ?auto_186580 ?auto_186583 ) ) ( not ( = ?auto_186580 ?auto_186584 ) ) ( not ( = ?auto_186585 ?auto_186582 ) ) ( not ( = ?auto_186585 ?auto_186583 ) ) ( not ( = ?auto_186585 ?auto_186584 ) ) ( not ( = ?auto_186581 ?auto_186582 ) ) ( not ( = ?auto_186581 ?auto_186583 ) ) ( not ( = ?auto_186581 ?auto_186584 ) ) ( ON ?auto_186586 ?auto_186581 ) ( ON ?auto_186582 ?auto_186586 ) ( ON ?auto_186584 ?auto_186582 ) ( ON ?auto_186583 ?auto_186584 ) ( CLEAR ?auto_186583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186579 ?auto_186580 ?auto_186585 ?auto_186581 ?auto_186586 ?auto_186582 ?auto_186584 )
      ( MAKE-2PILE ?auto_186579 ?auto_186580 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186587 - BLOCK
      ?auto_186588 - BLOCK
    )
    :vars
    (
      ?auto_186590 - BLOCK
      ?auto_186591 - BLOCK
      ?auto_186593 - BLOCK
      ?auto_186589 - BLOCK
      ?auto_186594 - BLOCK
      ?auto_186592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186590 ?auto_186588 ) ( ON-TABLE ?auto_186587 ) ( ON ?auto_186588 ?auto_186587 ) ( not ( = ?auto_186587 ?auto_186588 ) ) ( not ( = ?auto_186587 ?auto_186590 ) ) ( not ( = ?auto_186588 ?auto_186590 ) ) ( not ( = ?auto_186587 ?auto_186591 ) ) ( not ( = ?auto_186587 ?auto_186593 ) ) ( not ( = ?auto_186588 ?auto_186591 ) ) ( not ( = ?auto_186588 ?auto_186593 ) ) ( not ( = ?auto_186590 ?auto_186591 ) ) ( not ( = ?auto_186590 ?auto_186593 ) ) ( not ( = ?auto_186591 ?auto_186593 ) ) ( ON ?auto_186591 ?auto_186590 ) ( not ( = ?auto_186589 ?auto_186594 ) ) ( not ( = ?auto_186589 ?auto_186592 ) ) ( not ( = ?auto_186589 ?auto_186593 ) ) ( not ( = ?auto_186594 ?auto_186592 ) ) ( not ( = ?auto_186594 ?auto_186593 ) ) ( not ( = ?auto_186592 ?auto_186593 ) ) ( not ( = ?auto_186587 ?auto_186592 ) ) ( not ( = ?auto_186587 ?auto_186589 ) ) ( not ( = ?auto_186587 ?auto_186594 ) ) ( not ( = ?auto_186588 ?auto_186592 ) ) ( not ( = ?auto_186588 ?auto_186589 ) ) ( not ( = ?auto_186588 ?auto_186594 ) ) ( not ( = ?auto_186590 ?auto_186592 ) ) ( not ( = ?auto_186590 ?auto_186589 ) ) ( not ( = ?auto_186590 ?auto_186594 ) ) ( not ( = ?auto_186591 ?auto_186592 ) ) ( not ( = ?auto_186591 ?auto_186589 ) ) ( not ( = ?auto_186591 ?auto_186594 ) ) ( ON ?auto_186593 ?auto_186591 ) ( ON ?auto_186592 ?auto_186593 ) ( ON ?auto_186594 ?auto_186592 ) ( HOLDING ?auto_186589 ) ( CLEAR ?auto_186594 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186587 ?auto_186588 ?auto_186590 ?auto_186591 ?auto_186593 ?auto_186592 ?auto_186594 ?auto_186589 )
      ( MAKE-2PILE ?auto_186587 ?auto_186588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186595 - BLOCK
      ?auto_186596 - BLOCK
    )
    :vars
    (
      ?auto_186600 - BLOCK
      ?auto_186598 - BLOCK
      ?auto_186602 - BLOCK
      ?auto_186597 - BLOCK
      ?auto_186601 - BLOCK
      ?auto_186599 - BLOCK
      ?auto_186603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186600 ?auto_186596 ) ( ON-TABLE ?auto_186595 ) ( ON ?auto_186596 ?auto_186595 ) ( not ( = ?auto_186595 ?auto_186596 ) ) ( not ( = ?auto_186595 ?auto_186600 ) ) ( not ( = ?auto_186596 ?auto_186600 ) ) ( not ( = ?auto_186595 ?auto_186598 ) ) ( not ( = ?auto_186595 ?auto_186602 ) ) ( not ( = ?auto_186596 ?auto_186598 ) ) ( not ( = ?auto_186596 ?auto_186602 ) ) ( not ( = ?auto_186600 ?auto_186598 ) ) ( not ( = ?auto_186600 ?auto_186602 ) ) ( not ( = ?auto_186598 ?auto_186602 ) ) ( ON ?auto_186598 ?auto_186600 ) ( not ( = ?auto_186597 ?auto_186601 ) ) ( not ( = ?auto_186597 ?auto_186599 ) ) ( not ( = ?auto_186597 ?auto_186602 ) ) ( not ( = ?auto_186601 ?auto_186599 ) ) ( not ( = ?auto_186601 ?auto_186602 ) ) ( not ( = ?auto_186599 ?auto_186602 ) ) ( not ( = ?auto_186595 ?auto_186599 ) ) ( not ( = ?auto_186595 ?auto_186597 ) ) ( not ( = ?auto_186595 ?auto_186601 ) ) ( not ( = ?auto_186596 ?auto_186599 ) ) ( not ( = ?auto_186596 ?auto_186597 ) ) ( not ( = ?auto_186596 ?auto_186601 ) ) ( not ( = ?auto_186600 ?auto_186599 ) ) ( not ( = ?auto_186600 ?auto_186597 ) ) ( not ( = ?auto_186600 ?auto_186601 ) ) ( not ( = ?auto_186598 ?auto_186599 ) ) ( not ( = ?auto_186598 ?auto_186597 ) ) ( not ( = ?auto_186598 ?auto_186601 ) ) ( ON ?auto_186602 ?auto_186598 ) ( ON ?auto_186599 ?auto_186602 ) ( ON ?auto_186601 ?auto_186599 ) ( CLEAR ?auto_186601 ) ( ON ?auto_186597 ?auto_186603 ) ( CLEAR ?auto_186597 ) ( HAND-EMPTY ) ( not ( = ?auto_186595 ?auto_186603 ) ) ( not ( = ?auto_186596 ?auto_186603 ) ) ( not ( = ?auto_186600 ?auto_186603 ) ) ( not ( = ?auto_186598 ?auto_186603 ) ) ( not ( = ?auto_186602 ?auto_186603 ) ) ( not ( = ?auto_186597 ?auto_186603 ) ) ( not ( = ?auto_186601 ?auto_186603 ) ) ( not ( = ?auto_186599 ?auto_186603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186597 ?auto_186603 )
      ( MAKE-2PILE ?auto_186595 ?auto_186596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186604 - BLOCK
      ?auto_186605 - BLOCK
    )
    :vars
    (
      ?auto_186610 - BLOCK
      ?auto_186612 - BLOCK
      ?auto_186609 - BLOCK
      ?auto_186608 - BLOCK
      ?auto_186607 - BLOCK
      ?auto_186606 - BLOCK
      ?auto_186611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186610 ?auto_186605 ) ( ON-TABLE ?auto_186604 ) ( ON ?auto_186605 ?auto_186604 ) ( not ( = ?auto_186604 ?auto_186605 ) ) ( not ( = ?auto_186604 ?auto_186610 ) ) ( not ( = ?auto_186605 ?auto_186610 ) ) ( not ( = ?auto_186604 ?auto_186612 ) ) ( not ( = ?auto_186604 ?auto_186609 ) ) ( not ( = ?auto_186605 ?auto_186612 ) ) ( not ( = ?auto_186605 ?auto_186609 ) ) ( not ( = ?auto_186610 ?auto_186612 ) ) ( not ( = ?auto_186610 ?auto_186609 ) ) ( not ( = ?auto_186612 ?auto_186609 ) ) ( ON ?auto_186612 ?auto_186610 ) ( not ( = ?auto_186608 ?auto_186607 ) ) ( not ( = ?auto_186608 ?auto_186606 ) ) ( not ( = ?auto_186608 ?auto_186609 ) ) ( not ( = ?auto_186607 ?auto_186606 ) ) ( not ( = ?auto_186607 ?auto_186609 ) ) ( not ( = ?auto_186606 ?auto_186609 ) ) ( not ( = ?auto_186604 ?auto_186606 ) ) ( not ( = ?auto_186604 ?auto_186608 ) ) ( not ( = ?auto_186604 ?auto_186607 ) ) ( not ( = ?auto_186605 ?auto_186606 ) ) ( not ( = ?auto_186605 ?auto_186608 ) ) ( not ( = ?auto_186605 ?auto_186607 ) ) ( not ( = ?auto_186610 ?auto_186606 ) ) ( not ( = ?auto_186610 ?auto_186608 ) ) ( not ( = ?auto_186610 ?auto_186607 ) ) ( not ( = ?auto_186612 ?auto_186606 ) ) ( not ( = ?auto_186612 ?auto_186608 ) ) ( not ( = ?auto_186612 ?auto_186607 ) ) ( ON ?auto_186609 ?auto_186612 ) ( ON ?auto_186606 ?auto_186609 ) ( ON ?auto_186608 ?auto_186611 ) ( CLEAR ?auto_186608 ) ( not ( = ?auto_186604 ?auto_186611 ) ) ( not ( = ?auto_186605 ?auto_186611 ) ) ( not ( = ?auto_186610 ?auto_186611 ) ) ( not ( = ?auto_186612 ?auto_186611 ) ) ( not ( = ?auto_186609 ?auto_186611 ) ) ( not ( = ?auto_186608 ?auto_186611 ) ) ( not ( = ?auto_186607 ?auto_186611 ) ) ( not ( = ?auto_186606 ?auto_186611 ) ) ( HOLDING ?auto_186607 ) ( CLEAR ?auto_186606 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186604 ?auto_186605 ?auto_186610 ?auto_186612 ?auto_186609 ?auto_186606 ?auto_186607 )
      ( MAKE-2PILE ?auto_186604 ?auto_186605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186613 - BLOCK
      ?auto_186614 - BLOCK
    )
    :vars
    (
      ?auto_186621 - BLOCK
      ?auto_186620 - BLOCK
      ?auto_186615 - BLOCK
      ?auto_186618 - BLOCK
      ?auto_186619 - BLOCK
      ?auto_186616 - BLOCK
      ?auto_186617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186621 ?auto_186614 ) ( ON-TABLE ?auto_186613 ) ( ON ?auto_186614 ?auto_186613 ) ( not ( = ?auto_186613 ?auto_186614 ) ) ( not ( = ?auto_186613 ?auto_186621 ) ) ( not ( = ?auto_186614 ?auto_186621 ) ) ( not ( = ?auto_186613 ?auto_186620 ) ) ( not ( = ?auto_186613 ?auto_186615 ) ) ( not ( = ?auto_186614 ?auto_186620 ) ) ( not ( = ?auto_186614 ?auto_186615 ) ) ( not ( = ?auto_186621 ?auto_186620 ) ) ( not ( = ?auto_186621 ?auto_186615 ) ) ( not ( = ?auto_186620 ?auto_186615 ) ) ( ON ?auto_186620 ?auto_186621 ) ( not ( = ?auto_186618 ?auto_186619 ) ) ( not ( = ?auto_186618 ?auto_186616 ) ) ( not ( = ?auto_186618 ?auto_186615 ) ) ( not ( = ?auto_186619 ?auto_186616 ) ) ( not ( = ?auto_186619 ?auto_186615 ) ) ( not ( = ?auto_186616 ?auto_186615 ) ) ( not ( = ?auto_186613 ?auto_186616 ) ) ( not ( = ?auto_186613 ?auto_186618 ) ) ( not ( = ?auto_186613 ?auto_186619 ) ) ( not ( = ?auto_186614 ?auto_186616 ) ) ( not ( = ?auto_186614 ?auto_186618 ) ) ( not ( = ?auto_186614 ?auto_186619 ) ) ( not ( = ?auto_186621 ?auto_186616 ) ) ( not ( = ?auto_186621 ?auto_186618 ) ) ( not ( = ?auto_186621 ?auto_186619 ) ) ( not ( = ?auto_186620 ?auto_186616 ) ) ( not ( = ?auto_186620 ?auto_186618 ) ) ( not ( = ?auto_186620 ?auto_186619 ) ) ( ON ?auto_186615 ?auto_186620 ) ( ON ?auto_186616 ?auto_186615 ) ( ON ?auto_186618 ?auto_186617 ) ( not ( = ?auto_186613 ?auto_186617 ) ) ( not ( = ?auto_186614 ?auto_186617 ) ) ( not ( = ?auto_186621 ?auto_186617 ) ) ( not ( = ?auto_186620 ?auto_186617 ) ) ( not ( = ?auto_186615 ?auto_186617 ) ) ( not ( = ?auto_186618 ?auto_186617 ) ) ( not ( = ?auto_186619 ?auto_186617 ) ) ( not ( = ?auto_186616 ?auto_186617 ) ) ( CLEAR ?auto_186616 ) ( ON ?auto_186619 ?auto_186618 ) ( CLEAR ?auto_186619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186617 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186617 ?auto_186618 )
      ( MAKE-2PILE ?auto_186613 ?auto_186614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186622 - BLOCK
      ?auto_186623 - BLOCK
    )
    :vars
    (
      ?auto_186624 - BLOCK
      ?auto_186626 - BLOCK
      ?auto_186630 - BLOCK
      ?auto_186628 - BLOCK
      ?auto_186625 - BLOCK
      ?auto_186627 - BLOCK
      ?auto_186629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186624 ?auto_186623 ) ( ON-TABLE ?auto_186622 ) ( ON ?auto_186623 ?auto_186622 ) ( not ( = ?auto_186622 ?auto_186623 ) ) ( not ( = ?auto_186622 ?auto_186624 ) ) ( not ( = ?auto_186623 ?auto_186624 ) ) ( not ( = ?auto_186622 ?auto_186626 ) ) ( not ( = ?auto_186622 ?auto_186630 ) ) ( not ( = ?auto_186623 ?auto_186626 ) ) ( not ( = ?auto_186623 ?auto_186630 ) ) ( not ( = ?auto_186624 ?auto_186626 ) ) ( not ( = ?auto_186624 ?auto_186630 ) ) ( not ( = ?auto_186626 ?auto_186630 ) ) ( ON ?auto_186626 ?auto_186624 ) ( not ( = ?auto_186628 ?auto_186625 ) ) ( not ( = ?auto_186628 ?auto_186627 ) ) ( not ( = ?auto_186628 ?auto_186630 ) ) ( not ( = ?auto_186625 ?auto_186627 ) ) ( not ( = ?auto_186625 ?auto_186630 ) ) ( not ( = ?auto_186627 ?auto_186630 ) ) ( not ( = ?auto_186622 ?auto_186627 ) ) ( not ( = ?auto_186622 ?auto_186628 ) ) ( not ( = ?auto_186622 ?auto_186625 ) ) ( not ( = ?auto_186623 ?auto_186627 ) ) ( not ( = ?auto_186623 ?auto_186628 ) ) ( not ( = ?auto_186623 ?auto_186625 ) ) ( not ( = ?auto_186624 ?auto_186627 ) ) ( not ( = ?auto_186624 ?auto_186628 ) ) ( not ( = ?auto_186624 ?auto_186625 ) ) ( not ( = ?auto_186626 ?auto_186627 ) ) ( not ( = ?auto_186626 ?auto_186628 ) ) ( not ( = ?auto_186626 ?auto_186625 ) ) ( ON ?auto_186630 ?auto_186626 ) ( ON ?auto_186628 ?auto_186629 ) ( not ( = ?auto_186622 ?auto_186629 ) ) ( not ( = ?auto_186623 ?auto_186629 ) ) ( not ( = ?auto_186624 ?auto_186629 ) ) ( not ( = ?auto_186626 ?auto_186629 ) ) ( not ( = ?auto_186630 ?auto_186629 ) ) ( not ( = ?auto_186628 ?auto_186629 ) ) ( not ( = ?auto_186625 ?auto_186629 ) ) ( not ( = ?auto_186627 ?auto_186629 ) ) ( ON ?auto_186625 ?auto_186628 ) ( CLEAR ?auto_186625 ) ( ON-TABLE ?auto_186629 ) ( HOLDING ?auto_186627 ) ( CLEAR ?auto_186630 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186622 ?auto_186623 ?auto_186624 ?auto_186626 ?auto_186630 ?auto_186627 )
      ( MAKE-2PILE ?auto_186622 ?auto_186623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186631 - BLOCK
      ?auto_186632 - BLOCK
    )
    :vars
    (
      ?auto_186637 - BLOCK
      ?auto_186636 - BLOCK
      ?auto_186634 - BLOCK
      ?auto_186635 - BLOCK
      ?auto_186638 - BLOCK
      ?auto_186639 - BLOCK
      ?auto_186633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186637 ?auto_186632 ) ( ON-TABLE ?auto_186631 ) ( ON ?auto_186632 ?auto_186631 ) ( not ( = ?auto_186631 ?auto_186632 ) ) ( not ( = ?auto_186631 ?auto_186637 ) ) ( not ( = ?auto_186632 ?auto_186637 ) ) ( not ( = ?auto_186631 ?auto_186636 ) ) ( not ( = ?auto_186631 ?auto_186634 ) ) ( not ( = ?auto_186632 ?auto_186636 ) ) ( not ( = ?auto_186632 ?auto_186634 ) ) ( not ( = ?auto_186637 ?auto_186636 ) ) ( not ( = ?auto_186637 ?auto_186634 ) ) ( not ( = ?auto_186636 ?auto_186634 ) ) ( ON ?auto_186636 ?auto_186637 ) ( not ( = ?auto_186635 ?auto_186638 ) ) ( not ( = ?auto_186635 ?auto_186639 ) ) ( not ( = ?auto_186635 ?auto_186634 ) ) ( not ( = ?auto_186638 ?auto_186639 ) ) ( not ( = ?auto_186638 ?auto_186634 ) ) ( not ( = ?auto_186639 ?auto_186634 ) ) ( not ( = ?auto_186631 ?auto_186639 ) ) ( not ( = ?auto_186631 ?auto_186635 ) ) ( not ( = ?auto_186631 ?auto_186638 ) ) ( not ( = ?auto_186632 ?auto_186639 ) ) ( not ( = ?auto_186632 ?auto_186635 ) ) ( not ( = ?auto_186632 ?auto_186638 ) ) ( not ( = ?auto_186637 ?auto_186639 ) ) ( not ( = ?auto_186637 ?auto_186635 ) ) ( not ( = ?auto_186637 ?auto_186638 ) ) ( not ( = ?auto_186636 ?auto_186639 ) ) ( not ( = ?auto_186636 ?auto_186635 ) ) ( not ( = ?auto_186636 ?auto_186638 ) ) ( ON ?auto_186634 ?auto_186636 ) ( ON ?auto_186635 ?auto_186633 ) ( not ( = ?auto_186631 ?auto_186633 ) ) ( not ( = ?auto_186632 ?auto_186633 ) ) ( not ( = ?auto_186637 ?auto_186633 ) ) ( not ( = ?auto_186636 ?auto_186633 ) ) ( not ( = ?auto_186634 ?auto_186633 ) ) ( not ( = ?auto_186635 ?auto_186633 ) ) ( not ( = ?auto_186638 ?auto_186633 ) ) ( not ( = ?auto_186639 ?auto_186633 ) ) ( ON ?auto_186638 ?auto_186635 ) ( ON-TABLE ?auto_186633 ) ( CLEAR ?auto_186634 ) ( ON ?auto_186639 ?auto_186638 ) ( CLEAR ?auto_186639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186633 ?auto_186635 ?auto_186638 )
      ( MAKE-2PILE ?auto_186631 ?auto_186632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186640 - BLOCK
      ?auto_186641 - BLOCK
    )
    :vars
    (
      ?auto_186643 - BLOCK
      ?auto_186644 - BLOCK
      ?auto_186648 - BLOCK
      ?auto_186645 - BLOCK
      ?auto_186642 - BLOCK
      ?auto_186647 - BLOCK
      ?auto_186646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186643 ?auto_186641 ) ( ON-TABLE ?auto_186640 ) ( ON ?auto_186641 ?auto_186640 ) ( not ( = ?auto_186640 ?auto_186641 ) ) ( not ( = ?auto_186640 ?auto_186643 ) ) ( not ( = ?auto_186641 ?auto_186643 ) ) ( not ( = ?auto_186640 ?auto_186644 ) ) ( not ( = ?auto_186640 ?auto_186648 ) ) ( not ( = ?auto_186641 ?auto_186644 ) ) ( not ( = ?auto_186641 ?auto_186648 ) ) ( not ( = ?auto_186643 ?auto_186644 ) ) ( not ( = ?auto_186643 ?auto_186648 ) ) ( not ( = ?auto_186644 ?auto_186648 ) ) ( ON ?auto_186644 ?auto_186643 ) ( not ( = ?auto_186645 ?auto_186642 ) ) ( not ( = ?auto_186645 ?auto_186647 ) ) ( not ( = ?auto_186645 ?auto_186648 ) ) ( not ( = ?auto_186642 ?auto_186647 ) ) ( not ( = ?auto_186642 ?auto_186648 ) ) ( not ( = ?auto_186647 ?auto_186648 ) ) ( not ( = ?auto_186640 ?auto_186647 ) ) ( not ( = ?auto_186640 ?auto_186645 ) ) ( not ( = ?auto_186640 ?auto_186642 ) ) ( not ( = ?auto_186641 ?auto_186647 ) ) ( not ( = ?auto_186641 ?auto_186645 ) ) ( not ( = ?auto_186641 ?auto_186642 ) ) ( not ( = ?auto_186643 ?auto_186647 ) ) ( not ( = ?auto_186643 ?auto_186645 ) ) ( not ( = ?auto_186643 ?auto_186642 ) ) ( not ( = ?auto_186644 ?auto_186647 ) ) ( not ( = ?auto_186644 ?auto_186645 ) ) ( not ( = ?auto_186644 ?auto_186642 ) ) ( ON ?auto_186645 ?auto_186646 ) ( not ( = ?auto_186640 ?auto_186646 ) ) ( not ( = ?auto_186641 ?auto_186646 ) ) ( not ( = ?auto_186643 ?auto_186646 ) ) ( not ( = ?auto_186644 ?auto_186646 ) ) ( not ( = ?auto_186648 ?auto_186646 ) ) ( not ( = ?auto_186645 ?auto_186646 ) ) ( not ( = ?auto_186642 ?auto_186646 ) ) ( not ( = ?auto_186647 ?auto_186646 ) ) ( ON ?auto_186642 ?auto_186645 ) ( ON-TABLE ?auto_186646 ) ( ON ?auto_186647 ?auto_186642 ) ( CLEAR ?auto_186647 ) ( HOLDING ?auto_186648 ) ( CLEAR ?auto_186644 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186640 ?auto_186641 ?auto_186643 ?auto_186644 ?auto_186648 )
      ( MAKE-2PILE ?auto_186640 ?auto_186641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186649 - BLOCK
      ?auto_186650 - BLOCK
    )
    :vars
    (
      ?auto_186656 - BLOCK
      ?auto_186654 - BLOCK
      ?auto_186653 - BLOCK
      ?auto_186655 - BLOCK
      ?auto_186652 - BLOCK
      ?auto_186657 - BLOCK
      ?auto_186651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186656 ?auto_186650 ) ( ON-TABLE ?auto_186649 ) ( ON ?auto_186650 ?auto_186649 ) ( not ( = ?auto_186649 ?auto_186650 ) ) ( not ( = ?auto_186649 ?auto_186656 ) ) ( not ( = ?auto_186650 ?auto_186656 ) ) ( not ( = ?auto_186649 ?auto_186654 ) ) ( not ( = ?auto_186649 ?auto_186653 ) ) ( not ( = ?auto_186650 ?auto_186654 ) ) ( not ( = ?auto_186650 ?auto_186653 ) ) ( not ( = ?auto_186656 ?auto_186654 ) ) ( not ( = ?auto_186656 ?auto_186653 ) ) ( not ( = ?auto_186654 ?auto_186653 ) ) ( ON ?auto_186654 ?auto_186656 ) ( not ( = ?auto_186655 ?auto_186652 ) ) ( not ( = ?auto_186655 ?auto_186657 ) ) ( not ( = ?auto_186655 ?auto_186653 ) ) ( not ( = ?auto_186652 ?auto_186657 ) ) ( not ( = ?auto_186652 ?auto_186653 ) ) ( not ( = ?auto_186657 ?auto_186653 ) ) ( not ( = ?auto_186649 ?auto_186657 ) ) ( not ( = ?auto_186649 ?auto_186655 ) ) ( not ( = ?auto_186649 ?auto_186652 ) ) ( not ( = ?auto_186650 ?auto_186657 ) ) ( not ( = ?auto_186650 ?auto_186655 ) ) ( not ( = ?auto_186650 ?auto_186652 ) ) ( not ( = ?auto_186656 ?auto_186657 ) ) ( not ( = ?auto_186656 ?auto_186655 ) ) ( not ( = ?auto_186656 ?auto_186652 ) ) ( not ( = ?auto_186654 ?auto_186657 ) ) ( not ( = ?auto_186654 ?auto_186655 ) ) ( not ( = ?auto_186654 ?auto_186652 ) ) ( ON ?auto_186655 ?auto_186651 ) ( not ( = ?auto_186649 ?auto_186651 ) ) ( not ( = ?auto_186650 ?auto_186651 ) ) ( not ( = ?auto_186656 ?auto_186651 ) ) ( not ( = ?auto_186654 ?auto_186651 ) ) ( not ( = ?auto_186653 ?auto_186651 ) ) ( not ( = ?auto_186655 ?auto_186651 ) ) ( not ( = ?auto_186652 ?auto_186651 ) ) ( not ( = ?auto_186657 ?auto_186651 ) ) ( ON ?auto_186652 ?auto_186655 ) ( ON-TABLE ?auto_186651 ) ( ON ?auto_186657 ?auto_186652 ) ( CLEAR ?auto_186654 ) ( ON ?auto_186653 ?auto_186657 ) ( CLEAR ?auto_186653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186651 ?auto_186655 ?auto_186652 ?auto_186657 )
      ( MAKE-2PILE ?auto_186649 ?auto_186650 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186658 - BLOCK
      ?auto_186659 - BLOCK
    )
    :vars
    (
      ?auto_186665 - BLOCK
      ?auto_186664 - BLOCK
      ?auto_186663 - BLOCK
      ?auto_186666 - BLOCK
      ?auto_186661 - BLOCK
      ?auto_186660 - BLOCK
      ?auto_186662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186665 ?auto_186659 ) ( ON-TABLE ?auto_186658 ) ( ON ?auto_186659 ?auto_186658 ) ( not ( = ?auto_186658 ?auto_186659 ) ) ( not ( = ?auto_186658 ?auto_186665 ) ) ( not ( = ?auto_186659 ?auto_186665 ) ) ( not ( = ?auto_186658 ?auto_186664 ) ) ( not ( = ?auto_186658 ?auto_186663 ) ) ( not ( = ?auto_186659 ?auto_186664 ) ) ( not ( = ?auto_186659 ?auto_186663 ) ) ( not ( = ?auto_186665 ?auto_186664 ) ) ( not ( = ?auto_186665 ?auto_186663 ) ) ( not ( = ?auto_186664 ?auto_186663 ) ) ( not ( = ?auto_186666 ?auto_186661 ) ) ( not ( = ?auto_186666 ?auto_186660 ) ) ( not ( = ?auto_186666 ?auto_186663 ) ) ( not ( = ?auto_186661 ?auto_186660 ) ) ( not ( = ?auto_186661 ?auto_186663 ) ) ( not ( = ?auto_186660 ?auto_186663 ) ) ( not ( = ?auto_186658 ?auto_186660 ) ) ( not ( = ?auto_186658 ?auto_186666 ) ) ( not ( = ?auto_186658 ?auto_186661 ) ) ( not ( = ?auto_186659 ?auto_186660 ) ) ( not ( = ?auto_186659 ?auto_186666 ) ) ( not ( = ?auto_186659 ?auto_186661 ) ) ( not ( = ?auto_186665 ?auto_186660 ) ) ( not ( = ?auto_186665 ?auto_186666 ) ) ( not ( = ?auto_186665 ?auto_186661 ) ) ( not ( = ?auto_186664 ?auto_186660 ) ) ( not ( = ?auto_186664 ?auto_186666 ) ) ( not ( = ?auto_186664 ?auto_186661 ) ) ( ON ?auto_186666 ?auto_186662 ) ( not ( = ?auto_186658 ?auto_186662 ) ) ( not ( = ?auto_186659 ?auto_186662 ) ) ( not ( = ?auto_186665 ?auto_186662 ) ) ( not ( = ?auto_186664 ?auto_186662 ) ) ( not ( = ?auto_186663 ?auto_186662 ) ) ( not ( = ?auto_186666 ?auto_186662 ) ) ( not ( = ?auto_186661 ?auto_186662 ) ) ( not ( = ?auto_186660 ?auto_186662 ) ) ( ON ?auto_186661 ?auto_186666 ) ( ON-TABLE ?auto_186662 ) ( ON ?auto_186660 ?auto_186661 ) ( ON ?auto_186663 ?auto_186660 ) ( CLEAR ?auto_186663 ) ( HOLDING ?auto_186664 ) ( CLEAR ?auto_186665 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186658 ?auto_186659 ?auto_186665 ?auto_186664 )
      ( MAKE-2PILE ?auto_186658 ?auto_186659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186667 - BLOCK
      ?auto_186668 - BLOCK
    )
    :vars
    (
      ?auto_186673 - BLOCK
      ?auto_186670 - BLOCK
      ?auto_186669 - BLOCK
      ?auto_186672 - BLOCK
      ?auto_186671 - BLOCK
      ?auto_186675 - BLOCK
      ?auto_186674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186673 ?auto_186668 ) ( ON-TABLE ?auto_186667 ) ( ON ?auto_186668 ?auto_186667 ) ( not ( = ?auto_186667 ?auto_186668 ) ) ( not ( = ?auto_186667 ?auto_186673 ) ) ( not ( = ?auto_186668 ?auto_186673 ) ) ( not ( = ?auto_186667 ?auto_186670 ) ) ( not ( = ?auto_186667 ?auto_186669 ) ) ( not ( = ?auto_186668 ?auto_186670 ) ) ( not ( = ?auto_186668 ?auto_186669 ) ) ( not ( = ?auto_186673 ?auto_186670 ) ) ( not ( = ?auto_186673 ?auto_186669 ) ) ( not ( = ?auto_186670 ?auto_186669 ) ) ( not ( = ?auto_186672 ?auto_186671 ) ) ( not ( = ?auto_186672 ?auto_186675 ) ) ( not ( = ?auto_186672 ?auto_186669 ) ) ( not ( = ?auto_186671 ?auto_186675 ) ) ( not ( = ?auto_186671 ?auto_186669 ) ) ( not ( = ?auto_186675 ?auto_186669 ) ) ( not ( = ?auto_186667 ?auto_186675 ) ) ( not ( = ?auto_186667 ?auto_186672 ) ) ( not ( = ?auto_186667 ?auto_186671 ) ) ( not ( = ?auto_186668 ?auto_186675 ) ) ( not ( = ?auto_186668 ?auto_186672 ) ) ( not ( = ?auto_186668 ?auto_186671 ) ) ( not ( = ?auto_186673 ?auto_186675 ) ) ( not ( = ?auto_186673 ?auto_186672 ) ) ( not ( = ?auto_186673 ?auto_186671 ) ) ( not ( = ?auto_186670 ?auto_186675 ) ) ( not ( = ?auto_186670 ?auto_186672 ) ) ( not ( = ?auto_186670 ?auto_186671 ) ) ( ON ?auto_186672 ?auto_186674 ) ( not ( = ?auto_186667 ?auto_186674 ) ) ( not ( = ?auto_186668 ?auto_186674 ) ) ( not ( = ?auto_186673 ?auto_186674 ) ) ( not ( = ?auto_186670 ?auto_186674 ) ) ( not ( = ?auto_186669 ?auto_186674 ) ) ( not ( = ?auto_186672 ?auto_186674 ) ) ( not ( = ?auto_186671 ?auto_186674 ) ) ( not ( = ?auto_186675 ?auto_186674 ) ) ( ON ?auto_186671 ?auto_186672 ) ( ON-TABLE ?auto_186674 ) ( ON ?auto_186675 ?auto_186671 ) ( ON ?auto_186669 ?auto_186675 ) ( CLEAR ?auto_186673 ) ( ON ?auto_186670 ?auto_186669 ) ( CLEAR ?auto_186670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186674 ?auto_186672 ?auto_186671 ?auto_186675 ?auto_186669 )
      ( MAKE-2PILE ?auto_186667 ?auto_186668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186694 - BLOCK
      ?auto_186695 - BLOCK
    )
    :vars
    (
      ?auto_186702 - BLOCK
      ?auto_186696 - BLOCK
      ?auto_186700 - BLOCK
      ?auto_186697 - BLOCK
      ?auto_186699 - BLOCK
      ?auto_186701 - BLOCK
      ?auto_186698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186694 ) ( not ( = ?auto_186694 ?auto_186695 ) ) ( not ( = ?auto_186694 ?auto_186702 ) ) ( not ( = ?auto_186695 ?auto_186702 ) ) ( not ( = ?auto_186694 ?auto_186696 ) ) ( not ( = ?auto_186694 ?auto_186700 ) ) ( not ( = ?auto_186695 ?auto_186696 ) ) ( not ( = ?auto_186695 ?auto_186700 ) ) ( not ( = ?auto_186702 ?auto_186696 ) ) ( not ( = ?auto_186702 ?auto_186700 ) ) ( not ( = ?auto_186696 ?auto_186700 ) ) ( not ( = ?auto_186697 ?auto_186699 ) ) ( not ( = ?auto_186697 ?auto_186701 ) ) ( not ( = ?auto_186697 ?auto_186700 ) ) ( not ( = ?auto_186699 ?auto_186701 ) ) ( not ( = ?auto_186699 ?auto_186700 ) ) ( not ( = ?auto_186701 ?auto_186700 ) ) ( not ( = ?auto_186694 ?auto_186701 ) ) ( not ( = ?auto_186694 ?auto_186697 ) ) ( not ( = ?auto_186694 ?auto_186699 ) ) ( not ( = ?auto_186695 ?auto_186701 ) ) ( not ( = ?auto_186695 ?auto_186697 ) ) ( not ( = ?auto_186695 ?auto_186699 ) ) ( not ( = ?auto_186702 ?auto_186701 ) ) ( not ( = ?auto_186702 ?auto_186697 ) ) ( not ( = ?auto_186702 ?auto_186699 ) ) ( not ( = ?auto_186696 ?auto_186701 ) ) ( not ( = ?auto_186696 ?auto_186697 ) ) ( not ( = ?auto_186696 ?auto_186699 ) ) ( ON ?auto_186697 ?auto_186698 ) ( not ( = ?auto_186694 ?auto_186698 ) ) ( not ( = ?auto_186695 ?auto_186698 ) ) ( not ( = ?auto_186702 ?auto_186698 ) ) ( not ( = ?auto_186696 ?auto_186698 ) ) ( not ( = ?auto_186700 ?auto_186698 ) ) ( not ( = ?auto_186697 ?auto_186698 ) ) ( not ( = ?auto_186699 ?auto_186698 ) ) ( not ( = ?auto_186701 ?auto_186698 ) ) ( ON ?auto_186699 ?auto_186697 ) ( ON-TABLE ?auto_186698 ) ( ON ?auto_186701 ?auto_186699 ) ( ON ?auto_186700 ?auto_186701 ) ( ON ?auto_186696 ?auto_186700 ) ( ON ?auto_186702 ?auto_186696 ) ( CLEAR ?auto_186702 ) ( HOLDING ?auto_186695 ) ( CLEAR ?auto_186694 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186694 ?auto_186695 ?auto_186702 )
      ( MAKE-2PILE ?auto_186694 ?auto_186695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186703 - BLOCK
      ?auto_186704 - BLOCK
    )
    :vars
    (
      ?auto_186710 - BLOCK
      ?auto_186705 - BLOCK
      ?auto_186706 - BLOCK
      ?auto_186708 - BLOCK
      ?auto_186709 - BLOCK
      ?auto_186707 - BLOCK
      ?auto_186711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186703 ) ( not ( = ?auto_186703 ?auto_186704 ) ) ( not ( = ?auto_186703 ?auto_186710 ) ) ( not ( = ?auto_186704 ?auto_186710 ) ) ( not ( = ?auto_186703 ?auto_186705 ) ) ( not ( = ?auto_186703 ?auto_186706 ) ) ( not ( = ?auto_186704 ?auto_186705 ) ) ( not ( = ?auto_186704 ?auto_186706 ) ) ( not ( = ?auto_186710 ?auto_186705 ) ) ( not ( = ?auto_186710 ?auto_186706 ) ) ( not ( = ?auto_186705 ?auto_186706 ) ) ( not ( = ?auto_186708 ?auto_186709 ) ) ( not ( = ?auto_186708 ?auto_186707 ) ) ( not ( = ?auto_186708 ?auto_186706 ) ) ( not ( = ?auto_186709 ?auto_186707 ) ) ( not ( = ?auto_186709 ?auto_186706 ) ) ( not ( = ?auto_186707 ?auto_186706 ) ) ( not ( = ?auto_186703 ?auto_186707 ) ) ( not ( = ?auto_186703 ?auto_186708 ) ) ( not ( = ?auto_186703 ?auto_186709 ) ) ( not ( = ?auto_186704 ?auto_186707 ) ) ( not ( = ?auto_186704 ?auto_186708 ) ) ( not ( = ?auto_186704 ?auto_186709 ) ) ( not ( = ?auto_186710 ?auto_186707 ) ) ( not ( = ?auto_186710 ?auto_186708 ) ) ( not ( = ?auto_186710 ?auto_186709 ) ) ( not ( = ?auto_186705 ?auto_186707 ) ) ( not ( = ?auto_186705 ?auto_186708 ) ) ( not ( = ?auto_186705 ?auto_186709 ) ) ( ON ?auto_186708 ?auto_186711 ) ( not ( = ?auto_186703 ?auto_186711 ) ) ( not ( = ?auto_186704 ?auto_186711 ) ) ( not ( = ?auto_186710 ?auto_186711 ) ) ( not ( = ?auto_186705 ?auto_186711 ) ) ( not ( = ?auto_186706 ?auto_186711 ) ) ( not ( = ?auto_186708 ?auto_186711 ) ) ( not ( = ?auto_186709 ?auto_186711 ) ) ( not ( = ?auto_186707 ?auto_186711 ) ) ( ON ?auto_186709 ?auto_186708 ) ( ON-TABLE ?auto_186711 ) ( ON ?auto_186707 ?auto_186709 ) ( ON ?auto_186706 ?auto_186707 ) ( ON ?auto_186705 ?auto_186706 ) ( ON ?auto_186710 ?auto_186705 ) ( CLEAR ?auto_186703 ) ( ON ?auto_186704 ?auto_186710 ) ( CLEAR ?auto_186704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186711 ?auto_186708 ?auto_186709 ?auto_186707 ?auto_186706 ?auto_186705 ?auto_186710 )
      ( MAKE-2PILE ?auto_186703 ?auto_186704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186712 - BLOCK
      ?auto_186713 - BLOCK
    )
    :vars
    (
      ?auto_186719 - BLOCK
      ?auto_186718 - BLOCK
      ?auto_186716 - BLOCK
      ?auto_186720 - BLOCK
      ?auto_186717 - BLOCK
      ?auto_186715 - BLOCK
      ?auto_186714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186712 ?auto_186713 ) ) ( not ( = ?auto_186712 ?auto_186719 ) ) ( not ( = ?auto_186713 ?auto_186719 ) ) ( not ( = ?auto_186712 ?auto_186718 ) ) ( not ( = ?auto_186712 ?auto_186716 ) ) ( not ( = ?auto_186713 ?auto_186718 ) ) ( not ( = ?auto_186713 ?auto_186716 ) ) ( not ( = ?auto_186719 ?auto_186718 ) ) ( not ( = ?auto_186719 ?auto_186716 ) ) ( not ( = ?auto_186718 ?auto_186716 ) ) ( not ( = ?auto_186720 ?auto_186717 ) ) ( not ( = ?auto_186720 ?auto_186715 ) ) ( not ( = ?auto_186720 ?auto_186716 ) ) ( not ( = ?auto_186717 ?auto_186715 ) ) ( not ( = ?auto_186717 ?auto_186716 ) ) ( not ( = ?auto_186715 ?auto_186716 ) ) ( not ( = ?auto_186712 ?auto_186715 ) ) ( not ( = ?auto_186712 ?auto_186720 ) ) ( not ( = ?auto_186712 ?auto_186717 ) ) ( not ( = ?auto_186713 ?auto_186715 ) ) ( not ( = ?auto_186713 ?auto_186720 ) ) ( not ( = ?auto_186713 ?auto_186717 ) ) ( not ( = ?auto_186719 ?auto_186715 ) ) ( not ( = ?auto_186719 ?auto_186720 ) ) ( not ( = ?auto_186719 ?auto_186717 ) ) ( not ( = ?auto_186718 ?auto_186715 ) ) ( not ( = ?auto_186718 ?auto_186720 ) ) ( not ( = ?auto_186718 ?auto_186717 ) ) ( ON ?auto_186720 ?auto_186714 ) ( not ( = ?auto_186712 ?auto_186714 ) ) ( not ( = ?auto_186713 ?auto_186714 ) ) ( not ( = ?auto_186719 ?auto_186714 ) ) ( not ( = ?auto_186718 ?auto_186714 ) ) ( not ( = ?auto_186716 ?auto_186714 ) ) ( not ( = ?auto_186720 ?auto_186714 ) ) ( not ( = ?auto_186717 ?auto_186714 ) ) ( not ( = ?auto_186715 ?auto_186714 ) ) ( ON ?auto_186717 ?auto_186720 ) ( ON-TABLE ?auto_186714 ) ( ON ?auto_186715 ?auto_186717 ) ( ON ?auto_186716 ?auto_186715 ) ( ON ?auto_186718 ?auto_186716 ) ( ON ?auto_186719 ?auto_186718 ) ( ON ?auto_186713 ?auto_186719 ) ( CLEAR ?auto_186713 ) ( HOLDING ?auto_186712 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186712 )
      ( MAKE-2PILE ?auto_186712 ?auto_186713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186721 - BLOCK
      ?auto_186722 - BLOCK
    )
    :vars
    (
      ?auto_186726 - BLOCK
      ?auto_186724 - BLOCK
      ?auto_186725 - BLOCK
      ?auto_186729 - BLOCK
      ?auto_186727 - BLOCK
      ?auto_186723 - BLOCK
      ?auto_186728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186721 ?auto_186722 ) ) ( not ( = ?auto_186721 ?auto_186726 ) ) ( not ( = ?auto_186722 ?auto_186726 ) ) ( not ( = ?auto_186721 ?auto_186724 ) ) ( not ( = ?auto_186721 ?auto_186725 ) ) ( not ( = ?auto_186722 ?auto_186724 ) ) ( not ( = ?auto_186722 ?auto_186725 ) ) ( not ( = ?auto_186726 ?auto_186724 ) ) ( not ( = ?auto_186726 ?auto_186725 ) ) ( not ( = ?auto_186724 ?auto_186725 ) ) ( not ( = ?auto_186729 ?auto_186727 ) ) ( not ( = ?auto_186729 ?auto_186723 ) ) ( not ( = ?auto_186729 ?auto_186725 ) ) ( not ( = ?auto_186727 ?auto_186723 ) ) ( not ( = ?auto_186727 ?auto_186725 ) ) ( not ( = ?auto_186723 ?auto_186725 ) ) ( not ( = ?auto_186721 ?auto_186723 ) ) ( not ( = ?auto_186721 ?auto_186729 ) ) ( not ( = ?auto_186721 ?auto_186727 ) ) ( not ( = ?auto_186722 ?auto_186723 ) ) ( not ( = ?auto_186722 ?auto_186729 ) ) ( not ( = ?auto_186722 ?auto_186727 ) ) ( not ( = ?auto_186726 ?auto_186723 ) ) ( not ( = ?auto_186726 ?auto_186729 ) ) ( not ( = ?auto_186726 ?auto_186727 ) ) ( not ( = ?auto_186724 ?auto_186723 ) ) ( not ( = ?auto_186724 ?auto_186729 ) ) ( not ( = ?auto_186724 ?auto_186727 ) ) ( ON ?auto_186729 ?auto_186728 ) ( not ( = ?auto_186721 ?auto_186728 ) ) ( not ( = ?auto_186722 ?auto_186728 ) ) ( not ( = ?auto_186726 ?auto_186728 ) ) ( not ( = ?auto_186724 ?auto_186728 ) ) ( not ( = ?auto_186725 ?auto_186728 ) ) ( not ( = ?auto_186729 ?auto_186728 ) ) ( not ( = ?auto_186727 ?auto_186728 ) ) ( not ( = ?auto_186723 ?auto_186728 ) ) ( ON ?auto_186727 ?auto_186729 ) ( ON-TABLE ?auto_186728 ) ( ON ?auto_186723 ?auto_186727 ) ( ON ?auto_186725 ?auto_186723 ) ( ON ?auto_186724 ?auto_186725 ) ( ON ?auto_186726 ?auto_186724 ) ( ON ?auto_186722 ?auto_186726 ) ( ON ?auto_186721 ?auto_186722 ) ( CLEAR ?auto_186721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186728 ?auto_186729 ?auto_186727 ?auto_186723 ?auto_186725 ?auto_186724 ?auto_186726 ?auto_186722 )
      ( MAKE-2PILE ?auto_186721 ?auto_186722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186736 - BLOCK
      ?auto_186737 - BLOCK
      ?auto_186738 - BLOCK
      ?auto_186739 - BLOCK
      ?auto_186740 - BLOCK
      ?auto_186741 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_186741 ) ( CLEAR ?auto_186740 ) ( ON-TABLE ?auto_186736 ) ( ON ?auto_186737 ?auto_186736 ) ( ON ?auto_186738 ?auto_186737 ) ( ON ?auto_186739 ?auto_186738 ) ( ON ?auto_186740 ?auto_186739 ) ( not ( = ?auto_186736 ?auto_186737 ) ) ( not ( = ?auto_186736 ?auto_186738 ) ) ( not ( = ?auto_186736 ?auto_186739 ) ) ( not ( = ?auto_186736 ?auto_186740 ) ) ( not ( = ?auto_186736 ?auto_186741 ) ) ( not ( = ?auto_186737 ?auto_186738 ) ) ( not ( = ?auto_186737 ?auto_186739 ) ) ( not ( = ?auto_186737 ?auto_186740 ) ) ( not ( = ?auto_186737 ?auto_186741 ) ) ( not ( = ?auto_186738 ?auto_186739 ) ) ( not ( = ?auto_186738 ?auto_186740 ) ) ( not ( = ?auto_186738 ?auto_186741 ) ) ( not ( = ?auto_186739 ?auto_186740 ) ) ( not ( = ?auto_186739 ?auto_186741 ) ) ( not ( = ?auto_186740 ?auto_186741 ) ) )
    :subtasks
    ( ( !STACK ?auto_186741 ?auto_186740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186742 - BLOCK
      ?auto_186743 - BLOCK
      ?auto_186744 - BLOCK
      ?auto_186745 - BLOCK
      ?auto_186746 - BLOCK
      ?auto_186747 - BLOCK
    )
    :vars
    (
      ?auto_186748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_186746 ) ( ON-TABLE ?auto_186742 ) ( ON ?auto_186743 ?auto_186742 ) ( ON ?auto_186744 ?auto_186743 ) ( ON ?auto_186745 ?auto_186744 ) ( ON ?auto_186746 ?auto_186745 ) ( not ( = ?auto_186742 ?auto_186743 ) ) ( not ( = ?auto_186742 ?auto_186744 ) ) ( not ( = ?auto_186742 ?auto_186745 ) ) ( not ( = ?auto_186742 ?auto_186746 ) ) ( not ( = ?auto_186742 ?auto_186747 ) ) ( not ( = ?auto_186743 ?auto_186744 ) ) ( not ( = ?auto_186743 ?auto_186745 ) ) ( not ( = ?auto_186743 ?auto_186746 ) ) ( not ( = ?auto_186743 ?auto_186747 ) ) ( not ( = ?auto_186744 ?auto_186745 ) ) ( not ( = ?auto_186744 ?auto_186746 ) ) ( not ( = ?auto_186744 ?auto_186747 ) ) ( not ( = ?auto_186745 ?auto_186746 ) ) ( not ( = ?auto_186745 ?auto_186747 ) ) ( not ( = ?auto_186746 ?auto_186747 ) ) ( ON ?auto_186747 ?auto_186748 ) ( CLEAR ?auto_186747 ) ( HAND-EMPTY ) ( not ( = ?auto_186742 ?auto_186748 ) ) ( not ( = ?auto_186743 ?auto_186748 ) ) ( not ( = ?auto_186744 ?auto_186748 ) ) ( not ( = ?auto_186745 ?auto_186748 ) ) ( not ( = ?auto_186746 ?auto_186748 ) ) ( not ( = ?auto_186747 ?auto_186748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186747 ?auto_186748 )
      ( MAKE-6PILE ?auto_186742 ?auto_186743 ?auto_186744 ?auto_186745 ?auto_186746 ?auto_186747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186749 - BLOCK
      ?auto_186750 - BLOCK
      ?auto_186751 - BLOCK
      ?auto_186752 - BLOCK
      ?auto_186753 - BLOCK
      ?auto_186754 - BLOCK
    )
    :vars
    (
      ?auto_186755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186749 ) ( ON ?auto_186750 ?auto_186749 ) ( ON ?auto_186751 ?auto_186750 ) ( ON ?auto_186752 ?auto_186751 ) ( not ( = ?auto_186749 ?auto_186750 ) ) ( not ( = ?auto_186749 ?auto_186751 ) ) ( not ( = ?auto_186749 ?auto_186752 ) ) ( not ( = ?auto_186749 ?auto_186753 ) ) ( not ( = ?auto_186749 ?auto_186754 ) ) ( not ( = ?auto_186750 ?auto_186751 ) ) ( not ( = ?auto_186750 ?auto_186752 ) ) ( not ( = ?auto_186750 ?auto_186753 ) ) ( not ( = ?auto_186750 ?auto_186754 ) ) ( not ( = ?auto_186751 ?auto_186752 ) ) ( not ( = ?auto_186751 ?auto_186753 ) ) ( not ( = ?auto_186751 ?auto_186754 ) ) ( not ( = ?auto_186752 ?auto_186753 ) ) ( not ( = ?auto_186752 ?auto_186754 ) ) ( not ( = ?auto_186753 ?auto_186754 ) ) ( ON ?auto_186754 ?auto_186755 ) ( CLEAR ?auto_186754 ) ( not ( = ?auto_186749 ?auto_186755 ) ) ( not ( = ?auto_186750 ?auto_186755 ) ) ( not ( = ?auto_186751 ?auto_186755 ) ) ( not ( = ?auto_186752 ?auto_186755 ) ) ( not ( = ?auto_186753 ?auto_186755 ) ) ( not ( = ?auto_186754 ?auto_186755 ) ) ( HOLDING ?auto_186753 ) ( CLEAR ?auto_186752 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186749 ?auto_186750 ?auto_186751 ?auto_186752 ?auto_186753 )
      ( MAKE-6PILE ?auto_186749 ?auto_186750 ?auto_186751 ?auto_186752 ?auto_186753 ?auto_186754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186756 - BLOCK
      ?auto_186757 - BLOCK
      ?auto_186758 - BLOCK
      ?auto_186759 - BLOCK
      ?auto_186760 - BLOCK
      ?auto_186761 - BLOCK
    )
    :vars
    (
      ?auto_186762 - BLOCK
      ?auto_186763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186756 ) ( ON ?auto_186757 ?auto_186756 ) ( ON ?auto_186758 ?auto_186757 ) ( ON ?auto_186759 ?auto_186758 ) ( not ( = ?auto_186756 ?auto_186757 ) ) ( not ( = ?auto_186756 ?auto_186758 ) ) ( not ( = ?auto_186756 ?auto_186759 ) ) ( not ( = ?auto_186756 ?auto_186760 ) ) ( not ( = ?auto_186756 ?auto_186761 ) ) ( not ( = ?auto_186757 ?auto_186758 ) ) ( not ( = ?auto_186757 ?auto_186759 ) ) ( not ( = ?auto_186757 ?auto_186760 ) ) ( not ( = ?auto_186757 ?auto_186761 ) ) ( not ( = ?auto_186758 ?auto_186759 ) ) ( not ( = ?auto_186758 ?auto_186760 ) ) ( not ( = ?auto_186758 ?auto_186761 ) ) ( not ( = ?auto_186759 ?auto_186760 ) ) ( not ( = ?auto_186759 ?auto_186761 ) ) ( not ( = ?auto_186760 ?auto_186761 ) ) ( ON ?auto_186761 ?auto_186762 ) ( not ( = ?auto_186756 ?auto_186762 ) ) ( not ( = ?auto_186757 ?auto_186762 ) ) ( not ( = ?auto_186758 ?auto_186762 ) ) ( not ( = ?auto_186759 ?auto_186762 ) ) ( not ( = ?auto_186760 ?auto_186762 ) ) ( not ( = ?auto_186761 ?auto_186762 ) ) ( CLEAR ?auto_186759 ) ( ON ?auto_186760 ?auto_186761 ) ( CLEAR ?auto_186760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186763 ) ( ON ?auto_186762 ?auto_186763 ) ( not ( = ?auto_186763 ?auto_186762 ) ) ( not ( = ?auto_186763 ?auto_186761 ) ) ( not ( = ?auto_186763 ?auto_186760 ) ) ( not ( = ?auto_186756 ?auto_186763 ) ) ( not ( = ?auto_186757 ?auto_186763 ) ) ( not ( = ?auto_186758 ?auto_186763 ) ) ( not ( = ?auto_186759 ?auto_186763 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186763 ?auto_186762 ?auto_186761 )
      ( MAKE-6PILE ?auto_186756 ?auto_186757 ?auto_186758 ?auto_186759 ?auto_186760 ?auto_186761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186764 - BLOCK
      ?auto_186765 - BLOCK
      ?auto_186766 - BLOCK
      ?auto_186767 - BLOCK
      ?auto_186768 - BLOCK
      ?auto_186769 - BLOCK
    )
    :vars
    (
      ?auto_186771 - BLOCK
      ?auto_186770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186764 ) ( ON ?auto_186765 ?auto_186764 ) ( ON ?auto_186766 ?auto_186765 ) ( not ( = ?auto_186764 ?auto_186765 ) ) ( not ( = ?auto_186764 ?auto_186766 ) ) ( not ( = ?auto_186764 ?auto_186767 ) ) ( not ( = ?auto_186764 ?auto_186768 ) ) ( not ( = ?auto_186764 ?auto_186769 ) ) ( not ( = ?auto_186765 ?auto_186766 ) ) ( not ( = ?auto_186765 ?auto_186767 ) ) ( not ( = ?auto_186765 ?auto_186768 ) ) ( not ( = ?auto_186765 ?auto_186769 ) ) ( not ( = ?auto_186766 ?auto_186767 ) ) ( not ( = ?auto_186766 ?auto_186768 ) ) ( not ( = ?auto_186766 ?auto_186769 ) ) ( not ( = ?auto_186767 ?auto_186768 ) ) ( not ( = ?auto_186767 ?auto_186769 ) ) ( not ( = ?auto_186768 ?auto_186769 ) ) ( ON ?auto_186769 ?auto_186771 ) ( not ( = ?auto_186764 ?auto_186771 ) ) ( not ( = ?auto_186765 ?auto_186771 ) ) ( not ( = ?auto_186766 ?auto_186771 ) ) ( not ( = ?auto_186767 ?auto_186771 ) ) ( not ( = ?auto_186768 ?auto_186771 ) ) ( not ( = ?auto_186769 ?auto_186771 ) ) ( ON ?auto_186768 ?auto_186769 ) ( CLEAR ?auto_186768 ) ( ON-TABLE ?auto_186770 ) ( ON ?auto_186771 ?auto_186770 ) ( not ( = ?auto_186770 ?auto_186771 ) ) ( not ( = ?auto_186770 ?auto_186769 ) ) ( not ( = ?auto_186770 ?auto_186768 ) ) ( not ( = ?auto_186764 ?auto_186770 ) ) ( not ( = ?auto_186765 ?auto_186770 ) ) ( not ( = ?auto_186766 ?auto_186770 ) ) ( not ( = ?auto_186767 ?auto_186770 ) ) ( HOLDING ?auto_186767 ) ( CLEAR ?auto_186766 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186764 ?auto_186765 ?auto_186766 ?auto_186767 )
      ( MAKE-6PILE ?auto_186764 ?auto_186765 ?auto_186766 ?auto_186767 ?auto_186768 ?auto_186769 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186772 - BLOCK
      ?auto_186773 - BLOCK
      ?auto_186774 - BLOCK
      ?auto_186775 - BLOCK
      ?auto_186776 - BLOCK
      ?auto_186777 - BLOCK
    )
    :vars
    (
      ?auto_186779 - BLOCK
      ?auto_186778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186772 ) ( ON ?auto_186773 ?auto_186772 ) ( ON ?auto_186774 ?auto_186773 ) ( not ( = ?auto_186772 ?auto_186773 ) ) ( not ( = ?auto_186772 ?auto_186774 ) ) ( not ( = ?auto_186772 ?auto_186775 ) ) ( not ( = ?auto_186772 ?auto_186776 ) ) ( not ( = ?auto_186772 ?auto_186777 ) ) ( not ( = ?auto_186773 ?auto_186774 ) ) ( not ( = ?auto_186773 ?auto_186775 ) ) ( not ( = ?auto_186773 ?auto_186776 ) ) ( not ( = ?auto_186773 ?auto_186777 ) ) ( not ( = ?auto_186774 ?auto_186775 ) ) ( not ( = ?auto_186774 ?auto_186776 ) ) ( not ( = ?auto_186774 ?auto_186777 ) ) ( not ( = ?auto_186775 ?auto_186776 ) ) ( not ( = ?auto_186775 ?auto_186777 ) ) ( not ( = ?auto_186776 ?auto_186777 ) ) ( ON ?auto_186777 ?auto_186779 ) ( not ( = ?auto_186772 ?auto_186779 ) ) ( not ( = ?auto_186773 ?auto_186779 ) ) ( not ( = ?auto_186774 ?auto_186779 ) ) ( not ( = ?auto_186775 ?auto_186779 ) ) ( not ( = ?auto_186776 ?auto_186779 ) ) ( not ( = ?auto_186777 ?auto_186779 ) ) ( ON ?auto_186776 ?auto_186777 ) ( ON-TABLE ?auto_186778 ) ( ON ?auto_186779 ?auto_186778 ) ( not ( = ?auto_186778 ?auto_186779 ) ) ( not ( = ?auto_186778 ?auto_186777 ) ) ( not ( = ?auto_186778 ?auto_186776 ) ) ( not ( = ?auto_186772 ?auto_186778 ) ) ( not ( = ?auto_186773 ?auto_186778 ) ) ( not ( = ?auto_186774 ?auto_186778 ) ) ( not ( = ?auto_186775 ?auto_186778 ) ) ( CLEAR ?auto_186774 ) ( ON ?auto_186775 ?auto_186776 ) ( CLEAR ?auto_186775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186778 ?auto_186779 ?auto_186777 ?auto_186776 )
      ( MAKE-6PILE ?auto_186772 ?auto_186773 ?auto_186774 ?auto_186775 ?auto_186776 ?auto_186777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186780 - BLOCK
      ?auto_186781 - BLOCK
      ?auto_186782 - BLOCK
      ?auto_186783 - BLOCK
      ?auto_186784 - BLOCK
      ?auto_186785 - BLOCK
    )
    :vars
    (
      ?auto_186786 - BLOCK
      ?auto_186787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186780 ) ( ON ?auto_186781 ?auto_186780 ) ( not ( = ?auto_186780 ?auto_186781 ) ) ( not ( = ?auto_186780 ?auto_186782 ) ) ( not ( = ?auto_186780 ?auto_186783 ) ) ( not ( = ?auto_186780 ?auto_186784 ) ) ( not ( = ?auto_186780 ?auto_186785 ) ) ( not ( = ?auto_186781 ?auto_186782 ) ) ( not ( = ?auto_186781 ?auto_186783 ) ) ( not ( = ?auto_186781 ?auto_186784 ) ) ( not ( = ?auto_186781 ?auto_186785 ) ) ( not ( = ?auto_186782 ?auto_186783 ) ) ( not ( = ?auto_186782 ?auto_186784 ) ) ( not ( = ?auto_186782 ?auto_186785 ) ) ( not ( = ?auto_186783 ?auto_186784 ) ) ( not ( = ?auto_186783 ?auto_186785 ) ) ( not ( = ?auto_186784 ?auto_186785 ) ) ( ON ?auto_186785 ?auto_186786 ) ( not ( = ?auto_186780 ?auto_186786 ) ) ( not ( = ?auto_186781 ?auto_186786 ) ) ( not ( = ?auto_186782 ?auto_186786 ) ) ( not ( = ?auto_186783 ?auto_186786 ) ) ( not ( = ?auto_186784 ?auto_186786 ) ) ( not ( = ?auto_186785 ?auto_186786 ) ) ( ON ?auto_186784 ?auto_186785 ) ( ON-TABLE ?auto_186787 ) ( ON ?auto_186786 ?auto_186787 ) ( not ( = ?auto_186787 ?auto_186786 ) ) ( not ( = ?auto_186787 ?auto_186785 ) ) ( not ( = ?auto_186787 ?auto_186784 ) ) ( not ( = ?auto_186780 ?auto_186787 ) ) ( not ( = ?auto_186781 ?auto_186787 ) ) ( not ( = ?auto_186782 ?auto_186787 ) ) ( not ( = ?auto_186783 ?auto_186787 ) ) ( ON ?auto_186783 ?auto_186784 ) ( CLEAR ?auto_186783 ) ( HOLDING ?auto_186782 ) ( CLEAR ?auto_186781 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186780 ?auto_186781 ?auto_186782 )
      ( MAKE-6PILE ?auto_186780 ?auto_186781 ?auto_186782 ?auto_186783 ?auto_186784 ?auto_186785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186788 - BLOCK
      ?auto_186789 - BLOCK
      ?auto_186790 - BLOCK
      ?auto_186791 - BLOCK
      ?auto_186792 - BLOCK
      ?auto_186793 - BLOCK
    )
    :vars
    (
      ?auto_186795 - BLOCK
      ?auto_186794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186788 ) ( ON ?auto_186789 ?auto_186788 ) ( not ( = ?auto_186788 ?auto_186789 ) ) ( not ( = ?auto_186788 ?auto_186790 ) ) ( not ( = ?auto_186788 ?auto_186791 ) ) ( not ( = ?auto_186788 ?auto_186792 ) ) ( not ( = ?auto_186788 ?auto_186793 ) ) ( not ( = ?auto_186789 ?auto_186790 ) ) ( not ( = ?auto_186789 ?auto_186791 ) ) ( not ( = ?auto_186789 ?auto_186792 ) ) ( not ( = ?auto_186789 ?auto_186793 ) ) ( not ( = ?auto_186790 ?auto_186791 ) ) ( not ( = ?auto_186790 ?auto_186792 ) ) ( not ( = ?auto_186790 ?auto_186793 ) ) ( not ( = ?auto_186791 ?auto_186792 ) ) ( not ( = ?auto_186791 ?auto_186793 ) ) ( not ( = ?auto_186792 ?auto_186793 ) ) ( ON ?auto_186793 ?auto_186795 ) ( not ( = ?auto_186788 ?auto_186795 ) ) ( not ( = ?auto_186789 ?auto_186795 ) ) ( not ( = ?auto_186790 ?auto_186795 ) ) ( not ( = ?auto_186791 ?auto_186795 ) ) ( not ( = ?auto_186792 ?auto_186795 ) ) ( not ( = ?auto_186793 ?auto_186795 ) ) ( ON ?auto_186792 ?auto_186793 ) ( ON-TABLE ?auto_186794 ) ( ON ?auto_186795 ?auto_186794 ) ( not ( = ?auto_186794 ?auto_186795 ) ) ( not ( = ?auto_186794 ?auto_186793 ) ) ( not ( = ?auto_186794 ?auto_186792 ) ) ( not ( = ?auto_186788 ?auto_186794 ) ) ( not ( = ?auto_186789 ?auto_186794 ) ) ( not ( = ?auto_186790 ?auto_186794 ) ) ( not ( = ?auto_186791 ?auto_186794 ) ) ( ON ?auto_186791 ?auto_186792 ) ( CLEAR ?auto_186789 ) ( ON ?auto_186790 ?auto_186791 ) ( CLEAR ?auto_186790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186794 ?auto_186795 ?auto_186793 ?auto_186792 ?auto_186791 )
      ( MAKE-6PILE ?auto_186788 ?auto_186789 ?auto_186790 ?auto_186791 ?auto_186792 ?auto_186793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186796 - BLOCK
      ?auto_186797 - BLOCK
      ?auto_186798 - BLOCK
      ?auto_186799 - BLOCK
      ?auto_186800 - BLOCK
      ?auto_186801 - BLOCK
    )
    :vars
    (
      ?auto_186802 - BLOCK
      ?auto_186803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186796 ) ( not ( = ?auto_186796 ?auto_186797 ) ) ( not ( = ?auto_186796 ?auto_186798 ) ) ( not ( = ?auto_186796 ?auto_186799 ) ) ( not ( = ?auto_186796 ?auto_186800 ) ) ( not ( = ?auto_186796 ?auto_186801 ) ) ( not ( = ?auto_186797 ?auto_186798 ) ) ( not ( = ?auto_186797 ?auto_186799 ) ) ( not ( = ?auto_186797 ?auto_186800 ) ) ( not ( = ?auto_186797 ?auto_186801 ) ) ( not ( = ?auto_186798 ?auto_186799 ) ) ( not ( = ?auto_186798 ?auto_186800 ) ) ( not ( = ?auto_186798 ?auto_186801 ) ) ( not ( = ?auto_186799 ?auto_186800 ) ) ( not ( = ?auto_186799 ?auto_186801 ) ) ( not ( = ?auto_186800 ?auto_186801 ) ) ( ON ?auto_186801 ?auto_186802 ) ( not ( = ?auto_186796 ?auto_186802 ) ) ( not ( = ?auto_186797 ?auto_186802 ) ) ( not ( = ?auto_186798 ?auto_186802 ) ) ( not ( = ?auto_186799 ?auto_186802 ) ) ( not ( = ?auto_186800 ?auto_186802 ) ) ( not ( = ?auto_186801 ?auto_186802 ) ) ( ON ?auto_186800 ?auto_186801 ) ( ON-TABLE ?auto_186803 ) ( ON ?auto_186802 ?auto_186803 ) ( not ( = ?auto_186803 ?auto_186802 ) ) ( not ( = ?auto_186803 ?auto_186801 ) ) ( not ( = ?auto_186803 ?auto_186800 ) ) ( not ( = ?auto_186796 ?auto_186803 ) ) ( not ( = ?auto_186797 ?auto_186803 ) ) ( not ( = ?auto_186798 ?auto_186803 ) ) ( not ( = ?auto_186799 ?auto_186803 ) ) ( ON ?auto_186799 ?auto_186800 ) ( ON ?auto_186798 ?auto_186799 ) ( CLEAR ?auto_186798 ) ( HOLDING ?auto_186797 ) ( CLEAR ?auto_186796 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186796 ?auto_186797 )
      ( MAKE-6PILE ?auto_186796 ?auto_186797 ?auto_186798 ?auto_186799 ?auto_186800 ?auto_186801 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186804 - BLOCK
      ?auto_186805 - BLOCK
      ?auto_186806 - BLOCK
      ?auto_186807 - BLOCK
      ?auto_186808 - BLOCK
      ?auto_186809 - BLOCK
    )
    :vars
    (
      ?auto_186811 - BLOCK
      ?auto_186810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186804 ) ( not ( = ?auto_186804 ?auto_186805 ) ) ( not ( = ?auto_186804 ?auto_186806 ) ) ( not ( = ?auto_186804 ?auto_186807 ) ) ( not ( = ?auto_186804 ?auto_186808 ) ) ( not ( = ?auto_186804 ?auto_186809 ) ) ( not ( = ?auto_186805 ?auto_186806 ) ) ( not ( = ?auto_186805 ?auto_186807 ) ) ( not ( = ?auto_186805 ?auto_186808 ) ) ( not ( = ?auto_186805 ?auto_186809 ) ) ( not ( = ?auto_186806 ?auto_186807 ) ) ( not ( = ?auto_186806 ?auto_186808 ) ) ( not ( = ?auto_186806 ?auto_186809 ) ) ( not ( = ?auto_186807 ?auto_186808 ) ) ( not ( = ?auto_186807 ?auto_186809 ) ) ( not ( = ?auto_186808 ?auto_186809 ) ) ( ON ?auto_186809 ?auto_186811 ) ( not ( = ?auto_186804 ?auto_186811 ) ) ( not ( = ?auto_186805 ?auto_186811 ) ) ( not ( = ?auto_186806 ?auto_186811 ) ) ( not ( = ?auto_186807 ?auto_186811 ) ) ( not ( = ?auto_186808 ?auto_186811 ) ) ( not ( = ?auto_186809 ?auto_186811 ) ) ( ON ?auto_186808 ?auto_186809 ) ( ON-TABLE ?auto_186810 ) ( ON ?auto_186811 ?auto_186810 ) ( not ( = ?auto_186810 ?auto_186811 ) ) ( not ( = ?auto_186810 ?auto_186809 ) ) ( not ( = ?auto_186810 ?auto_186808 ) ) ( not ( = ?auto_186804 ?auto_186810 ) ) ( not ( = ?auto_186805 ?auto_186810 ) ) ( not ( = ?auto_186806 ?auto_186810 ) ) ( not ( = ?auto_186807 ?auto_186810 ) ) ( ON ?auto_186807 ?auto_186808 ) ( ON ?auto_186806 ?auto_186807 ) ( CLEAR ?auto_186804 ) ( ON ?auto_186805 ?auto_186806 ) ( CLEAR ?auto_186805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186810 ?auto_186811 ?auto_186809 ?auto_186808 ?auto_186807 ?auto_186806 )
      ( MAKE-6PILE ?auto_186804 ?auto_186805 ?auto_186806 ?auto_186807 ?auto_186808 ?auto_186809 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186812 - BLOCK
      ?auto_186813 - BLOCK
      ?auto_186814 - BLOCK
      ?auto_186815 - BLOCK
      ?auto_186816 - BLOCK
      ?auto_186817 - BLOCK
    )
    :vars
    (
      ?auto_186819 - BLOCK
      ?auto_186818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186812 ?auto_186813 ) ) ( not ( = ?auto_186812 ?auto_186814 ) ) ( not ( = ?auto_186812 ?auto_186815 ) ) ( not ( = ?auto_186812 ?auto_186816 ) ) ( not ( = ?auto_186812 ?auto_186817 ) ) ( not ( = ?auto_186813 ?auto_186814 ) ) ( not ( = ?auto_186813 ?auto_186815 ) ) ( not ( = ?auto_186813 ?auto_186816 ) ) ( not ( = ?auto_186813 ?auto_186817 ) ) ( not ( = ?auto_186814 ?auto_186815 ) ) ( not ( = ?auto_186814 ?auto_186816 ) ) ( not ( = ?auto_186814 ?auto_186817 ) ) ( not ( = ?auto_186815 ?auto_186816 ) ) ( not ( = ?auto_186815 ?auto_186817 ) ) ( not ( = ?auto_186816 ?auto_186817 ) ) ( ON ?auto_186817 ?auto_186819 ) ( not ( = ?auto_186812 ?auto_186819 ) ) ( not ( = ?auto_186813 ?auto_186819 ) ) ( not ( = ?auto_186814 ?auto_186819 ) ) ( not ( = ?auto_186815 ?auto_186819 ) ) ( not ( = ?auto_186816 ?auto_186819 ) ) ( not ( = ?auto_186817 ?auto_186819 ) ) ( ON ?auto_186816 ?auto_186817 ) ( ON-TABLE ?auto_186818 ) ( ON ?auto_186819 ?auto_186818 ) ( not ( = ?auto_186818 ?auto_186819 ) ) ( not ( = ?auto_186818 ?auto_186817 ) ) ( not ( = ?auto_186818 ?auto_186816 ) ) ( not ( = ?auto_186812 ?auto_186818 ) ) ( not ( = ?auto_186813 ?auto_186818 ) ) ( not ( = ?auto_186814 ?auto_186818 ) ) ( not ( = ?auto_186815 ?auto_186818 ) ) ( ON ?auto_186815 ?auto_186816 ) ( ON ?auto_186814 ?auto_186815 ) ( ON ?auto_186813 ?auto_186814 ) ( CLEAR ?auto_186813 ) ( HOLDING ?auto_186812 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186812 )
      ( MAKE-6PILE ?auto_186812 ?auto_186813 ?auto_186814 ?auto_186815 ?auto_186816 ?auto_186817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186820 - BLOCK
      ?auto_186821 - BLOCK
      ?auto_186822 - BLOCK
      ?auto_186823 - BLOCK
      ?auto_186824 - BLOCK
      ?auto_186825 - BLOCK
    )
    :vars
    (
      ?auto_186826 - BLOCK
      ?auto_186827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186820 ?auto_186821 ) ) ( not ( = ?auto_186820 ?auto_186822 ) ) ( not ( = ?auto_186820 ?auto_186823 ) ) ( not ( = ?auto_186820 ?auto_186824 ) ) ( not ( = ?auto_186820 ?auto_186825 ) ) ( not ( = ?auto_186821 ?auto_186822 ) ) ( not ( = ?auto_186821 ?auto_186823 ) ) ( not ( = ?auto_186821 ?auto_186824 ) ) ( not ( = ?auto_186821 ?auto_186825 ) ) ( not ( = ?auto_186822 ?auto_186823 ) ) ( not ( = ?auto_186822 ?auto_186824 ) ) ( not ( = ?auto_186822 ?auto_186825 ) ) ( not ( = ?auto_186823 ?auto_186824 ) ) ( not ( = ?auto_186823 ?auto_186825 ) ) ( not ( = ?auto_186824 ?auto_186825 ) ) ( ON ?auto_186825 ?auto_186826 ) ( not ( = ?auto_186820 ?auto_186826 ) ) ( not ( = ?auto_186821 ?auto_186826 ) ) ( not ( = ?auto_186822 ?auto_186826 ) ) ( not ( = ?auto_186823 ?auto_186826 ) ) ( not ( = ?auto_186824 ?auto_186826 ) ) ( not ( = ?auto_186825 ?auto_186826 ) ) ( ON ?auto_186824 ?auto_186825 ) ( ON-TABLE ?auto_186827 ) ( ON ?auto_186826 ?auto_186827 ) ( not ( = ?auto_186827 ?auto_186826 ) ) ( not ( = ?auto_186827 ?auto_186825 ) ) ( not ( = ?auto_186827 ?auto_186824 ) ) ( not ( = ?auto_186820 ?auto_186827 ) ) ( not ( = ?auto_186821 ?auto_186827 ) ) ( not ( = ?auto_186822 ?auto_186827 ) ) ( not ( = ?auto_186823 ?auto_186827 ) ) ( ON ?auto_186823 ?auto_186824 ) ( ON ?auto_186822 ?auto_186823 ) ( ON ?auto_186821 ?auto_186822 ) ( ON ?auto_186820 ?auto_186821 ) ( CLEAR ?auto_186820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186827 ?auto_186826 ?auto_186825 ?auto_186824 ?auto_186823 ?auto_186822 ?auto_186821 )
      ( MAKE-6PILE ?auto_186820 ?auto_186821 ?auto_186822 ?auto_186823 ?auto_186824 ?auto_186825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186828 - BLOCK
      ?auto_186829 - BLOCK
      ?auto_186830 - BLOCK
      ?auto_186831 - BLOCK
      ?auto_186832 - BLOCK
      ?auto_186833 - BLOCK
    )
    :vars
    (
      ?auto_186834 - BLOCK
      ?auto_186835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186828 ?auto_186829 ) ) ( not ( = ?auto_186828 ?auto_186830 ) ) ( not ( = ?auto_186828 ?auto_186831 ) ) ( not ( = ?auto_186828 ?auto_186832 ) ) ( not ( = ?auto_186828 ?auto_186833 ) ) ( not ( = ?auto_186829 ?auto_186830 ) ) ( not ( = ?auto_186829 ?auto_186831 ) ) ( not ( = ?auto_186829 ?auto_186832 ) ) ( not ( = ?auto_186829 ?auto_186833 ) ) ( not ( = ?auto_186830 ?auto_186831 ) ) ( not ( = ?auto_186830 ?auto_186832 ) ) ( not ( = ?auto_186830 ?auto_186833 ) ) ( not ( = ?auto_186831 ?auto_186832 ) ) ( not ( = ?auto_186831 ?auto_186833 ) ) ( not ( = ?auto_186832 ?auto_186833 ) ) ( ON ?auto_186833 ?auto_186834 ) ( not ( = ?auto_186828 ?auto_186834 ) ) ( not ( = ?auto_186829 ?auto_186834 ) ) ( not ( = ?auto_186830 ?auto_186834 ) ) ( not ( = ?auto_186831 ?auto_186834 ) ) ( not ( = ?auto_186832 ?auto_186834 ) ) ( not ( = ?auto_186833 ?auto_186834 ) ) ( ON ?auto_186832 ?auto_186833 ) ( ON-TABLE ?auto_186835 ) ( ON ?auto_186834 ?auto_186835 ) ( not ( = ?auto_186835 ?auto_186834 ) ) ( not ( = ?auto_186835 ?auto_186833 ) ) ( not ( = ?auto_186835 ?auto_186832 ) ) ( not ( = ?auto_186828 ?auto_186835 ) ) ( not ( = ?auto_186829 ?auto_186835 ) ) ( not ( = ?auto_186830 ?auto_186835 ) ) ( not ( = ?auto_186831 ?auto_186835 ) ) ( ON ?auto_186831 ?auto_186832 ) ( ON ?auto_186830 ?auto_186831 ) ( ON ?auto_186829 ?auto_186830 ) ( HOLDING ?auto_186828 ) ( CLEAR ?auto_186829 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186835 ?auto_186834 ?auto_186833 ?auto_186832 ?auto_186831 ?auto_186830 ?auto_186829 ?auto_186828 )
      ( MAKE-6PILE ?auto_186828 ?auto_186829 ?auto_186830 ?auto_186831 ?auto_186832 ?auto_186833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186836 - BLOCK
      ?auto_186837 - BLOCK
      ?auto_186838 - BLOCK
      ?auto_186839 - BLOCK
      ?auto_186840 - BLOCK
      ?auto_186841 - BLOCK
    )
    :vars
    (
      ?auto_186842 - BLOCK
      ?auto_186843 - BLOCK
      ?auto_186844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186836 ?auto_186837 ) ) ( not ( = ?auto_186836 ?auto_186838 ) ) ( not ( = ?auto_186836 ?auto_186839 ) ) ( not ( = ?auto_186836 ?auto_186840 ) ) ( not ( = ?auto_186836 ?auto_186841 ) ) ( not ( = ?auto_186837 ?auto_186838 ) ) ( not ( = ?auto_186837 ?auto_186839 ) ) ( not ( = ?auto_186837 ?auto_186840 ) ) ( not ( = ?auto_186837 ?auto_186841 ) ) ( not ( = ?auto_186838 ?auto_186839 ) ) ( not ( = ?auto_186838 ?auto_186840 ) ) ( not ( = ?auto_186838 ?auto_186841 ) ) ( not ( = ?auto_186839 ?auto_186840 ) ) ( not ( = ?auto_186839 ?auto_186841 ) ) ( not ( = ?auto_186840 ?auto_186841 ) ) ( ON ?auto_186841 ?auto_186842 ) ( not ( = ?auto_186836 ?auto_186842 ) ) ( not ( = ?auto_186837 ?auto_186842 ) ) ( not ( = ?auto_186838 ?auto_186842 ) ) ( not ( = ?auto_186839 ?auto_186842 ) ) ( not ( = ?auto_186840 ?auto_186842 ) ) ( not ( = ?auto_186841 ?auto_186842 ) ) ( ON ?auto_186840 ?auto_186841 ) ( ON-TABLE ?auto_186843 ) ( ON ?auto_186842 ?auto_186843 ) ( not ( = ?auto_186843 ?auto_186842 ) ) ( not ( = ?auto_186843 ?auto_186841 ) ) ( not ( = ?auto_186843 ?auto_186840 ) ) ( not ( = ?auto_186836 ?auto_186843 ) ) ( not ( = ?auto_186837 ?auto_186843 ) ) ( not ( = ?auto_186838 ?auto_186843 ) ) ( not ( = ?auto_186839 ?auto_186843 ) ) ( ON ?auto_186839 ?auto_186840 ) ( ON ?auto_186838 ?auto_186839 ) ( ON ?auto_186837 ?auto_186838 ) ( CLEAR ?auto_186837 ) ( ON ?auto_186836 ?auto_186844 ) ( CLEAR ?auto_186836 ) ( HAND-EMPTY ) ( not ( = ?auto_186836 ?auto_186844 ) ) ( not ( = ?auto_186837 ?auto_186844 ) ) ( not ( = ?auto_186838 ?auto_186844 ) ) ( not ( = ?auto_186839 ?auto_186844 ) ) ( not ( = ?auto_186840 ?auto_186844 ) ) ( not ( = ?auto_186841 ?auto_186844 ) ) ( not ( = ?auto_186842 ?auto_186844 ) ) ( not ( = ?auto_186843 ?auto_186844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186836 ?auto_186844 )
      ( MAKE-6PILE ?auto_186836 ?auto_186837 ?auto_186838 ?auto_186839 ?auto_186840 ?auto_186841 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186845 - BLOCK
      ?auto_186846 - BLOCK
      ?auto_186847 - BLOCK
      ?auto_186848 - BLOCK
      ?auto_186849 - BLOCK
      ?auto_186850 - BLOCK
    )
    :vars
    (
      ?auto_186851 - BLOCK
      ?auto_186853 - BLOCK
      ?auto_186852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186845 ?auto_186846 ) ) ( not ( = ?auto_186845 ?auto_186847 ) ) ( not ( = ?auto_186845 ?auto_186848 ) ) ( not ( = ?auto_186845 ?auto_186849 ) ) ( not ( = ?auto_186845 ?auto_186850 ) ) ( not ( = ?auto_186846 ?auto_186847 ) ) ( not ( = ?auto_186846 ?auto_186848 ) ) ( not ( = ?auto_186846 ?auto_186849 ) ) ( not ( = ?auto_186846 ?auto_186850 ) ) ( not ( = ?auto_186847 ?auto_186848 ) ) ( not ( = ?auto_186847 ?auto_186849 ) ) ( not ( = ?auto_186847 ?auto_186850 ) ) ( not ( = ?auto_186848 ?auto_186849 ) ) ( not ( = ?auto_186848 ?auto_186850 ) ) ( not ( = ?auto_186849 ?auto_186850 ) ) ( ON ?auto_186850 ?auto_186851 ) ( not ( = ?auto_186845 ?auto_186851 ) ) ( not ( = ?auto_186846 ?auto_186851 ) ) ( not ( = ?auto_186847 ?auto_186851 ) ) ( not ( = ?auto_186848 ?auto_186851 ) ) ( not ( = ?auto_186849 ?auto_186851 ) ) ( not ( = ?auto_186850 ?auto_186851 ) ) ( ON ?auto_186849 ?auto_186850 ) ( ON-TABLE ?auto_186853 ) ( ON ?auto_186851 ?auto_186853 ) ( not ( = ?auto_186853 ?auto_186851 ) ) ( not ( = ?auto_186853 ?auto_186850 ) ) ( not ( = ?auto_186853 ?auto_186849 ) ) ( not ( = ?auto_186845 ?auto_186853 ) ) ( not ( = ?auto_186846 ?auto_186853 ) ) ( not ( = ?auto_186847 ?auto_186853 ) ) ( not ( = ?auto_186848 ?auto_186853 ) ) ( ON ?auto_186848 ?auto_186849 ) ( ON ?auto_186847 ?auto_186848 ) ( ON ?auto_186845 ?auto_186852 ) ( CLEAR ?auto_186845 ) ( not ( = ?auto_186845 ?auto_186852 ) ) ( not ( = ?auto_186846 ?auto_186852 ) ) ( not ( = ?auto_186847 ?auto_186852 ) ) ( not ( = ?auto_186848 ?auto_186852 ) ) ( not ( = ?auto_186849 ?auto_186852 ) ) ( not ( = ?auto_186850 ?auto_186852 ) ) ( not ( = ?auto_186851 ?auto_186852 ) ) ( not ( = ?auto_186853 ?auto_186852 ) ) ( HOLDING ?auto_186846 ) ( CLEAR ?auto_186847 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186853 ?auto_186851 ?auto_186850 ?auto_186849 ?auto_186848 ?auto_186847 ?auto_186846 )
      ( MAKE-6PILE ?auto_186845 ?auto_186846 ?auto_186847 ?auto_186848 ?auto_186849 ?auto_186850 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186854 - BLOCK
      ?auto_186855 - BLOCK
      ?auto_186856 - BLOCK
      ?auto_186857 - BLOCK
      ?auto_186858 - BLOCK
      ?auto_186859 - BLOCK
    )
    :vars
    (
      ?auto_186861 - BLOCK
      ?auto_186860 - BLOCK
      ?auto_186862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186854 ?auto_186855 ) ) ( not ( = ?auto_186854 ?auto_186856 ) ) ( not ( = ?auto_186854 ?auto_186857 ) ) ( not ( = ?auto_186854 ?auto_186858 ) ) ( not ( = ?auto_186854 ?auto_186859 ) ) ( not ( = ?auto_186855 ?auto_186856 ) ) ( not ( = ?auto_186855 ?auto_186857 ) ) ( not ( = ?auto_186855 ?auto_186858 ) ) ( not ( = ?auto_186855 ?auto_186859 ) ) ( not ( = ?auto_186856 ?auto_186857 ) ) ( not ( = ?auto_186856 ?auto_186858 ) ) ( not ( = ?auto_186856 ?auto_186859 ) ) ( not ( = ?auto_186857 ?auto_186858 ) ) ( not ( = ?auto_186857 ?auto_186859 ) ) ( not ( = ?auto_186858 ?auto_186859 ) ) ( ON ?auto_186859 ?auto_186861 ) ( not ( = ?auto_186854 ?auto_186861 ) ) ( not ( = ?auto_186855 ?auto_186861 ) ) ( not ( = ?auto_186856 ?auto_186861 ) ) ( not ( = ?auto_186857 ?auto_186861 ) ) ( not ( = ?auto_186858 ?auto_186861 ) ) ( not ( = ?auto_186859 ?auto_186861 ) ) ( ON ?auto_186858 ?auto_186859 ) ( ON-TABLE ?auto_186860 ) ( ON ?auto_186861 ?auto_186860 ) ( not ( = ?auto_186860 ?auto_186861 ) ) ( not ( = ?auto_186860 ?auto_186859 ) ) ( not ( = ?auto_186860 ?auto_186858 ) ) ( not ( = ?auto_186854 ?auto_186860 ) ) ( not ( = ?auto_186855 ?auto_186860 ) ) ( not ( = ?auto_186856 ?auto_186860 ) ) ( not ( = ?auto_186857 ?auto_186860 ) ) ( ON ?auto_186857 ?auto_186858 ) ( ON ?auto_186856 ?auto_186857 ) ( ON ?auto_186854 ?auto_186862 ) ( not ( = ?auto_186854 ?auto_186862 ) ) ( not ( = ?auto_186855 ?auto_186862 ) ) ( not ( = ?auto_186856 ?auto_186862 ) ) ( not ( = ?auto_186857 ?auto_186862 ) ) ( not ( = ?auto_186858 ?auto_186862 ) ) ( not ( = ?auto_186859 ?auto_186862 ) ) ( not ( = ?auto_186861 ?auto_186862 ) ) ( not ( = ?auto_186860 ?auto_186862 ) ) ( CLEAR ?auto_186856 ) ( ON ?auto_186855 ?auto_186854 ) ( CLEAR ?auto_186855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186862 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186862 ?auto_186854 )
      ( MAKE-6PILE ?auto_186854 ?auto_186855 ?auto_186856 ?auto_186857 ?auto_186858 ?auto_186859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186863 - BLOCK
      ?auto_186864 - BLOCK
      ?auto_186865 - BLOCK
      ?auto_186866 - BLOCK
      ?auto_186867 - BLOCK
      ?auto_186868 - BLOCK
    )
    :vars
    (
      ?auto_186869 - BLOCK
      ?auto_186871 - BLOCK
      ?auto_186870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186863 ?auto_186864 ) ) ( not ( = ?auto_186863 ?auto_186865 ) ) ( not ( = ?auto_186863 ?auto_186866 ) ) ( not ( = ?auto_186863 ?auto_186867 ) ) ( not ( = ?auto_186863 ?auto_186868 ) ) ( not ( = ?auto_186864 ?auto_186865 ) ) ( not ( = ?auto_186864 ?auto_186866 ) ) ( not ( = ?auto_186864 ?auto_186867 ) ) ( not ( = ?auto_186864 ?auto_186868 ) ) ( not ( = ?auto_186865 ?auto_186866 ) ) ( not ( = ?auto_186865 ?auto_186867 ) ) ( not ( = ?auto_186865 ?auto_186868 ) ) ( not ( = ?auto_186866 ?auto_186867 ) ) ( not ( = ?auto_186866 ?auto_186868 ) ) ( not ( = ?auto_186867 ?auto_186868 ) ) ( ON ?auto_186868 ?auto_186869 ) ( not ( = ?auto_186863 ?auto_186869 ) ) ( not ( = ?auto_186864 ?auto_186869 ) ) ( not ( = ?auto_186865 ?auto_186869 ) ) ( not ( = ?auto_186866 ?auto_186869 ) ) ( not ( = ?auto_186867 ?auto_186869 ) ) ( not ( = ?auto_186868 ?auto_186869 ) ) ( ON ?auto_186867 ?auto_186868 ) ( ON-TABLE ?auto_186871 ) ( ON ?auto_186869 ?auto_186871 ) ( not ( = ?auto_186871 ?auto_186869 ) ) ( not ( = ?auto_186871 ?auto_186868 ) ) ( not ( = ?auto_186871 ?auto_186867 ) ) ( not ( = ?auto_186863 ?auto_186871 ) ) ( not ( = ?auto_186864 ?auto_186871 ) ) ( not ( = ?auto_186865 ?auto_186871 ) ) ( not ( = ?auto_186866 ?auto_186871 ) ) ( ON ?auto_186866 ?auto_186867 ) ( ON ?auto_186863 ?auto_186870 ) ( not ( = ?auto_186863 ?auto_186870 ) ) ( not ( = ?auto_186864 ?auto_186870 ) ) ( not ( = ?auto_186865 ?auto_186870 ) ) ( not ( = ?auto_186866 ?auto_186870 ) ) ( not ( = ?auto_186867 ?auto_186870 ) ) ( not ( = ?auto_186868 ?auto_186870 ) ) ( not ( = ?auto_186869 ?auto_186870 ) ) ( not ( = ?auto_186871 ?auto_186870 ) ) ( ON ?auto_186864 ?auto_186863 ) ( CLEAR ?auto_186864 ) ( ON-TABLE ?auto_186870 ) ( HOLDING ?auto_186865 ) ( CLEAR ?auto_186866 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186871 ?auto_186869 ?auto_186868 ?auto_186867 ?auto_186866 ?auto_186865 )
      ( MAKE-6PILE ?auto_186863 ?auto_186864 ?auto_186865 ?auto_186866 ?auto_186867 ?auto_186868 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186872 - BLOCK
      ?auto_186873 - BLOCK
      ?auto_186874 - BLOCK
      ?auto_186875 - BLOCK
      ?auto_186876 - BLOCK
      ?auto_186877 - BLOCK
    )
    :vars
    (
      ?auto_186878 - BLOCK
      ?auto_186879 - BLOCK
      ?auto_186880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186872 ?auto_186873 ) ) ( not ( = ?auto_186872 ?auto_186874 ) ) ( not ( = ?auto_186872 ?auto_186875 ) ) ( not ( = ?auto_186872 ?auto_186876 ) ) ( not ( = ?auto_186872 ?auto_186877 ) ) ( not ( = ?auto_186873 ?auto_186874 ) ) ( not ( = ?auto_186873 ?auto_186875 ) ) ( not ( = ?auto_186873 ?auto_186876 ) ) ( not ( = ?auto_186873 ?auto_186877 ) ) ( not ( = ?auto_186874 ?auto_186875 ) ) ( not ( = ?auto_186874 ?auto_186876 ) ) ( not ( = ?auto_186874 ?auto_186877 ) ) ( not ( = ?auto_186875 ?auto_186876 ) ) ( not ( = ?auto_186875 ?auto_186877 ) ) ( not ( = ?auto_186876 ?auto_186877 ) ) ( ON ?auto_186877 ?auto_186878 ) ( not ( = ?auto_186872 ?auto_186878 ) ) ( not ( = ?auto_186873 ?auto_186878 ) ) ( not ( = ?auto_186874 ?auto_186878 ) ) ( not ( = ?auto_186875 ?auto_186878 ) ) ( not ( = ?auto_186876 ?auto_186878 ) ) ( not ( = ?auto_186877 ?auto_186878 ) ) ( ON ?auto_186876 ?auto_186877 ) ( ON-TABLE ?auto_186879 ) ( ON ?auto_186878 ?auto_186879 ) ( not ( = ?auto_186879 ?auto_186878 ) ) ( not ( = ?auto_186879 ?auto_186877 ) ) ( not ( = ?auto_186879 ?auto_186876 ) ) ( not ( = ?auto_186872 ?auto_186879 ) ) ( not ( = ?auto_186873 ?auto_186879 ) ) ( not ( = ?auto_186874 ?auto_186879 ) ) ( not ( = ?auto_186875 ?auto_186879 ) ) ( ON ?auto_186875 ?auto_186876 ) ( ON ?auto_186872 ?auto_186880 ) ( not ( = ?auto_186872 ?auto_186880 ) ) ( not ( = ?auto_186873 ?auto_186880 ) ) ( not ( = ?auto_186874 ?auto_186880 ) ) ( not ( = ?auto_186875 ?auto_186880 ) ) ( not ( = ?auto_186876 ?auto_186880 ) ) ( not ( = ?auto_186877 ?auto_186880 ) ) ( not ( = ?auto_186878 ?auto_186880 ) ) ( not ( = ?auto_186879 ?auto_186880 ) ) ( ON ?auto_186873 ?auto_186872 ) ( ON-TABLE ?auto_186880 ) ( CLEAR ?auto_186875 ) ( ON ?auto_186874 ?auto_186873 ) ( CLEAR ?auto_186874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186880 ?auto_186872 ?auto_186873 )
      ( MAKE-6PILE ?auto_186872 ?auto_186873 ?auto_186874 ?auto_186875 ?auto_186876 ?auto_186877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186881 - BLOCK
      ?auto_186882 - BLOCK
      ?auto_186883 - BLOCK
      ?auto_186884 - BLOCK
      ?auto_186885 - BLOCK
      ?auto_186886 - BLOCK
    )
    :vars
    (
      ?auto_186889 - BLOCK
      ?auto_186887 - BLOCK
      ?auto_186888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186881 ?auto_186882 ) ) ( not ( = ?auto_186881 ?auto_186883 ) ) ( not ( = ?auto_186881 ?auto_186884 ) ) ( not ( = ?auto_186881 ?auto_186885 ) ) ( not ( = ?auto_186881 ?auto_186886 ) ) ( not ( = ?auto_186882 ?auto_186883 ) ) ( not ( = ?auto_186882 ?auto_186884 ) ) ( not ( = ?auto_186882 ?auto_186885 ) ) ( not ( = ?auto_186882 ?auto_186886 ) ) ( not ( = ?auto_186883 ?auto_186884 ) ) ( not ( = ?auto_186883 ?auto_186885 ) ) ( not ( = ?auto_186883 ?auto_186886 ) ) ( not ( = ?auto_186884 ?auto_186885 ) ) ( not ( = ?auto_186884 ?auto_186886 ) ) ( not ( = ?auto_186885 ?auto_186886 ) ) ( ON ?auto_186886 ?auto_186889 ) ( not ( = ?auto_186881 ?auto_186889 ) ) ( not ( = ?auto_186882 ?auto_186889 ) ) ( not ( = ?auto_186883 ?auto_186889 ) ) ( not ( = ?auto_186884 ?auto_186889 ) ) ( not ( = ?auto_186885 ?auto_186889 ) ) ( not ( = ?auto_186886 ?auto_186889 ) ) ( ON ?auto_186885 ?auto_186886 ) ( ON-TABLE ?auto_186887 ) ( ON ?auto_186889 ?auto_186887 ) ( not ( = ?auto_186887 ?auto_186889 ) ) ( not ( = ?auto_186887 ?auto_186886 ) ) ( not ( = ?auto_186887 ?auto_186885 ) ) ( not ( = ?auto_186881 ?auto_186887 ) ) ( not ( = ?auto_186882 ?auto_186887 ) ) ( not ( = ?auto_186883 ?auto_186887 ) ) ( not ( = ?auto_186884 ?auto_186887 ) ) ( ON ?auto_186881 ?auto_186888 ) ( not ( = ?auto_186881 ?auto_186888 ) ) ( not ( = ?auto_186882 ?auto_186888 ) ) ( not ( = ?auto_186883 ?auto_186888 ) ) ( not ( = ?auto_186884 ?auto_186888 ) ) ( not ( = ?auto_186885 ?auto_186888 ) ) ( not ( = ?auto_186886 ?auto_186888 ) ) ( not ( = ?auto_186889 ?auto_186888 ) ) ( not ( = ?auto_186887 ?auto_186888 ) ) ( ON ?auto_186882 ?auto_186881 ) ( ON-TABLE ?auto_186888 ) ( ON ?auto_186883 ?auto_186882 ) ( CLEAR ?auto_186883 ) ( HOLDING ?auto_186884 ) ( CLEAR ?auto_186885 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186887 ?auto_186889 ?auto_186886 ?auto_186885 ?auto_186884 )
      ( MAKE-6PILE ?auto_186881 ?auto_186882 ?auto_186883 ?auto_186884 ?auto_186885 ?auto_186886 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186890 - BLOCK
      ?auto_186891 - BLOCK
      ?auto_186892 - BLOCK
      ?auto_186893 - BLOCK
      ?auto_186894 - BLOCK
      ?auto_186895 - BLOCK
    )
    :vars
    (
      ?auto_186896 - BLOCK
      ?auto_186897 - BLOCK
      ?auto_186898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186890 ?auto_186891 ) ) ( not ( = ?auto_186890 ?auto_186892 ) ) ( not ( = ?auto_186890 ?auto_186893 ) ) ( not ( = ?auto_186890 ?auto_186894 ) ) ( not ( = ?auto_186890 ?auto_186895 ) ) ( not ( = ?auto_186891 ?auto_186892 ) ) ( not ( = ?auto_186891 ?auto_186893 ) ) ( not ( = ?auto_186891 ?auto_186894 ) ) ( not ( = ?auto_186891 ?auto_186895 ) ) ( not ( = ?auto_186892 ?auto_186893 ) ) ( not ( = ?auto_186892 ?auto_186894 ) ) ( not ( = ?auto_186892 ?auto_186895 ) ) ( not ( = ?auto_186893 ?auto_186894 ) ) ( not ( = ?auto_186893 ?auto_186895 ) ) ( not ( = ?auto_186894 ?auto_186895 ) ) ( ON ?auto_186895 ?auto_186896 ) ( not ( = ?auto_186890 ?auto_186896 ) ) ( not ( = ?auto_186891 ?auto_186896 ) ) ( not ( = ?auto_186892 ?auto_186896 ) ) ( not ( = ?auto_186893 ?auto_186896 ) ) ( not ( = ?auto_186894 ?auto_186896 ) ) ( not ( = ?auto_186895 ?auto_186896 ) ) ( ON ?auto_186894 ?auto_186895 ) ( ON-TABLE ?auto_186897 ) ( ON ?auto_186896 ?auto_186897 ) ( not ( = ?auto_186897 ?auto_186896 ) ) ( not ( = ?auto_186897 ?auto_186895 ) ) ( not ( = ?auto_186897 ?auto_186894 ) ) ( not ( = ?auto_186890 ?auto_186897 ) ) ( not ( = ?auto_186891 ?auto_186897 ) ) ( not ( = ?auto_186892 ?auto_186897 ) ) ( not ( = ?auto_186893 ?auto_186897 ) ) ( ON ?auto_186890 ?auto_186898 ) ( not ( = ?auto_186890 ?auto_186898 ) ) ( not ( = ?auto_186891 ?auto_186898 ) ) ( not ( = ?auto_186892 ?auto_186898 ) ) ( not ( = ?auto_186893 ?auto_186898 ) ) ( not ( = ?auto_186894 ?auto_186898 ) ) ( not ( = ?auto_186895 ?auto_186898 ) ) ( not ( = ?auto_186896 ?auto_186898 ) ) ( not ( = ?auto_186897 ?auto_186898 ) ) ( ON ?auto_186891 ?auto_186890 ) ( ON-TABLE ?auto_186898 ) ( ON ?auto_186892 ?auto_186891 ) ( CLEAR ?auto_186894 ) ( ON ?auto_186893 ?auto_186892 ) ( CLEAR ?auto_186893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186898 ?auto_186890 ?auto_186891 ?auto_186892 )
      ( MAKE-6PILE ?auto_186890 ?auto_186891 ?auto_186892 ?auto_186893 ?auto_186894 ?auto_186895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186899 - BLOCK
      ?auto_186900 - BLOCK
      ?auto_186901 - BLOCK
      ?auto_186902 - BLOCK
      ?auto_186903 - BLOCK
      ?auto_186904 - BLOCK
    )
    :vars
    (
      ?auto_186906 - BLOCK
      ?auto_186905 - BLOCK
      ?auto_186907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186899 ?auto_186900 ) ) ( not ( = ?auto_186899 ?auto_186901 ) ) ( not ( = ?auto_186899 ?auto_186902 ) ) ( not ( = ?auto_186899 ?auto_186903 ) ) ( not ( = ?auto_186899 ?auto_186904 ) ) ( not ( = ?auto_186900 ?auto_186901 ) ) ( not ( = ?auto_186900 ?auto_186902 ) ) ( not ( = ?auto_186900 ?auto_186903 ) ) ( not ( = ?auto_186900 ?auto_186904 ) ) ( not ( = ?auto_186901 ?auto_186902 ) ) ( not ( = ?auto_186901 ?auto_186903 ) ) ( not ( = ?auto_186901 ?auto_186904 ) ) ( not ( = ?auto_186902 ?auto_186903 ) ) ( not ( = ?auto_186902 ?auto_186904 ) ) ( not ( = ?auto_186903 ?auto_186904 ) ) ( ON ?auto_186904 ?auto_186906 ) ( not ( = ?auto_186899 ?auto_186906 ) ) ( not ( = ?auto_186900 ?auto_186906 ) ) ( not ( = ?auto_186901 ?auto_186906 ) ) ( not ( = ?auto_186902 ?auto_186906 ) ) ( not ( = ?auto_186903 ?auto_186906 ) ) ( not ( = ?auto_186904 ?auto_186906 ) ) ( ON-TABLE ?auto_186905 ) ( ON ?auto_186906 ?auto_186905 ) ( not ( = ?auto_186905 ?auto_186906 ) ) ( not ( = ?auto_186905 ?auto_186904 ) ) ( not ( = ?auto_186905 ?auto_186903 ) ) ( not ( = ?auto_186899 ?auto_186905 ) ) ( not ( = ?auto_186900 ?auto_186905 ) ) ( not ( = ?auto_186901 ?auto_186905 ) ) ( not ( = ?auto_186902 ?auto_186905 ) ) ( ON ?auto_186899 ?auto_186907 ) ( not ( = ?auto_186899 ?auto_186907 ) ) ( not ( = ?auto_186900 ?auto_186907 ) ) ( not ( = ?auto_186901 ?auto_186907 ) ) ( not ( = ?auto_186902 ?auto_186907 ) ) ( not ( = ?auto_186903 ?auto_186907 ) ) ( not ( = ?auto_186904 ?auto_186907 ) ) ( not ( = ?auto_186906 ?auto_186907 ) ) ( not ( = ?auto_186905 ?auto_186907 ) ) ( ON ?auto_186900 ?auto_186899 ) ( ON-TABLE ?auto_186907 ) ( ON ?auto_186901 ?auto_186900 ) ( ON ?auto_186902 ?auto_186901 ) ( CLEAR ?auto_186902 ) ( HOLDING ?auto_186903 ) ( CLEAR ?auto_186904 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186905 ?auto_186906 ?auto_186904 ?auto_186903 )
      ( MAKE-6PILE ?auto_186899 ?auto_186900 ?auto_186901 ?auto_186902 ?auto_186903 ?auto_186904 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186908 - BLOCK
      ?auto_186909 - BLOCK
      ?auto_186910 - BLOCK
      ?auto_186911 - BLOCK
      ?auto_186912 - BLOCK
      ?auto_186913 - BLOCK
    )
    :vars
    (
      ?auto_186916 - BLOCK
      ?auto_186915 - BLOCK
      ?auto_186914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186908 ?auto_186909 ) ) ( not ( = ?auto_186908 ?auto_186910 ) ) ( not ( = ?auto_186908 ?auto_186911 ) ) ( not ( = ?auto_186908 ?auto_186912 ) ) ( not ( = ?auto_186908 ?auto_186913 ) ) ( not ( = ?auto_186909 ?auto_186910 ) ) ( not ( = ?auto_186909 ?auto_186911 ) ) ( not ( = ?auto_186909 ?auto_186912 ) ) ( not ( = ?auto_186909 ?auto_186913 ) ) ( not ( = ?auto_186910 ?auto_186911 ) ) ( not ( = ?auto_186910 ?auto_186912 ) ) ( not ( = ?auto_186910 ?auto_186913 ) ) ( not ( = ?auto_186911 ?auto_186912 ) ) ( not ( = ?auto_186911 ?auto_186913 ) ) ( not ( = ?auto_186912 ?auto_186913 ) ) ( ON ?auto_186913 ?auto_186916 ) ( not ( = ?auto_186908 ?auto_186916 ) ) ( not ( = ?auto_186909 ?auto_186916 ) ) ( not ( = ?auto_186910 ?auto_186916 ) ) ( not ( = ?auto_186911 ?auto_186916 ) ) ( not ( = ?auto_186912 ?auto_186916 ) ) ( not ( = ?auto_186913 ?auto_186916 ) ) ( ON-TABLE ?auto_186915 ) ( ON ?auto_186916 ?auto_186915 ) ( not ( = ?auto_186915 ?auto_186916 ) ) ( not ( = ?auto_186915 ?auto_186913 ) ) ( not ( = ?auto_186915 ?auto_186912 ) ) ( not ( = ?auto_186908 ?auto_186915 ) ) ( not ( = ?auto_186909 ?auto_186915 ) ) ( not ( = ?auto_186910 ?auto_186915 ) ) ( not ( = ?auto_186911 ?auto_186915 ) ) ( ON ?auto_186908 ?auto_186914 ) ( not ( = ?auto_186908 ?auto_186914 ) ) ( not ( = ?auto_186909 ?auto_186914 ) ) ( not ( = ?auto_186910 ?auto_186914 ) ) ( not ( = ?auto_186911 ?auto_186914 ) ) ( not ( = ?auto_186912 ?auto_186914 ) ) ( not ( = ?auto_186913 ?auto_186914 ) ) ( not ( = ?auto_186916 ?auto_186914 ) ) ( not ( = ?auto_186915 ?auto_186914 ) ) ( ON ?auto_186909 ?auto_186908 ) ( ON-TABLE ?auto_186914 ) ( ON ?auto_186910 ?auto_186909 ) ( ON ?auto_186911 ?auto_186910 ) ( CLEAR ?auto_186913 ) ( ON ?auto_186912 ?auto_186911 ) ( CLEAR ?auto_186912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186914 ?auto_186908 ?auto_186909 ?auto_186910 ?auto_186911 )
      ( MAKE-6PILE ?auto_186908 ?auto_186909 ?auto_186910 ?auto_186911 ?auto_186912 ?auto_186913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186917 - BLOCK
      ?auto_186918 - BLOCK
      ?auto_186919 - BLOCK
      ?auto_186920 - BLOCK
      ?auto_186921 - BLOCK
      ?auto_186922 - BLOCK
    )
    :vars
    (
      ?auto_186924 - BLOCK
      ?auto_186925 - BLOCK
      ?auto_186923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186917 ?auto_186918 ) ) ( not ( = ?auto_186917 ?auto_186919 ) ) ( not ( = ?auto_186917 ?auto_186920 ) ) ( not ( = ?auto_186917 ?auto_186921 ) ) ( not ( = ?auto_186917 ?auto_186922 ) ) ( not ( = ?auto_186918 ?auto_186919 ) ) ( not ( = ?auto_186918 ?auto_186920 ) ) ( not ( = ?auto_186918 ?auto_186921 ) ) ( not ( = ?auto_186918 ?auto_186922 ) ) ( not ( = ?auto_186919 ?auto_186920 ) ) ( not ( = ?auto_186919 ?auto_186921 ) ) ( not ( = ?auto_186919 ?auto_186922 ) ) ( not ( = ?auto_186920 ?auto_186921 ) ) ( not ( = ?auto_186920 ?auto_186922 ) ) ( not ( = ?auto_186921 ?auto_186922 ) ) ( not ( = ?auto_186917 ?auto_186924 ) ) ( not ( = ?auto_186918 ?auto_186924 ) ) ( not ( = ?auto_186919 ?auto_186924 ) ) ( not ( = ?auto_186920 ?auto_186924 ) ) ( not ( = ?auto_186921 ?auto_186924 ) ) ( not ( = ?auto_186922 ?auto_186924 ) ) ( ON-TABLE ?auto_186925 ) ( ON ?auto_186924 ?auto_186925 ) ( not ( = ?auto_186925 ?auto_186924 ) ) ( not ( = ?auto_186925 ?auto_186922 ) ) ( not ( = ?auto_186925 ?auto_186921 ) ) ( not ( = ?auto_186917 ?auto_186925 ) ) ( not ( = ?auto_186918 ?auto_186925 ) ) ( not ( = ?auto_186919 ?auto_186925 ) ) ( not ( = ?auto_186920 ?auto_186925 ) ) ( ON ?auto_186917 ?auto_186923 ) ( not ( = ?auto_186917 ?auto_186923 ) ) ( not ( = ?auto_186918 ?auto_186923 ) ) ( not ( = ?auto_186919 ?auto_186923 ) ) ( not ( = ?auto_186920 ?auto_186923 ) ) ( not ( = ?auto_186921 ?auto_186923 ) ) ( not ( = ?auto_186922 ?auto_186923 ) ) ( not ( = ?auto_186924 ?auto_186923 ) ) ( not ( = ?auto_186925 ?auto_186923 ) ) ( ON ?auto_186918 ?auto_186917 ) ( ON-TABLE ?auto_186923 ) ( ON ?auto_186919 ?auto_186918 ) ( ON ?auto_186920 ?auto_186919 ) ( ON ?auto_186921 ?auto_186920 ) ( CLEAR ?auto_186921 ) ( HOLDING ?auto_186922 ) ( CLEAR ?auto_186924 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186925 ?auto_186924 ?auto_186922 )
      ( MAKE-6PILE ?auto_186917 ?auto_186918 ?auto_186919 ?auto_186920 ?auto_186921 ?auto_186922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186926 - BLOCK
      ?auto_186927 - BLOCK
      ?auto_186928 - BLOCK
      ?auto_186929 - BLOCK
      ?auto_186930 - BLOCK
      ?auto_186931 - BLOCK
    )
    :vars
    (
      ?auto_186934 - BLOCK
      ?auto_186933 - BLOCK
      ?auto_186932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186926 ?auto_186927 ) ) ( not ( = ?auto_186926 ?auto_186928 ) ) ( not ( = ?auto_186926 ?auto_186929 ) ) ( not ( = ?auto_186926 ?auto_186930 ) ) ( not ( = ?auto_186926 ?auto_186931 ) ) ( not ( = ?auto_186927 ?auto_186928 ) ) ( not ( = ?auto_186927 ?auto_186929 ) ) ( not ( = ?auto_186927 ?auto_186930 ) ) ( not ( = ?auto_186927 ?auto_186931 ) ) ( not ( = ?auto_186928 ?auto_186929 ) ) ( not ( = ?auto_186928 ?auto_186930 ) ) ( not ( = ?auto_186928 ?auto_186931 ) ) ( not ( = ?auto_186929 ?auto_186930 ) ) ( not ( = ?auto_186929 ?auto_186931 ) ) ( not ( = ?auto_186930 ?auto_186931 ) ) ( not ( = ?auto_186926 ?auto_186934 ) ) ( not ( = ?auto_186927 ?auto_186934 ) ) ( not ( = ?auto_186928 ?auto_186934 ) ) ( not ( = ?auto_186929 ?auto_186934 ) ) ( not ( = ?auto_186930 ?auto_186934 ) ) ( not ( = ?auto_186931 ?auto_186934 ) ) ( ON-TABLE ?auto_186933 ) ( ON ?auto_186934 ?auto_186933 ) ( not ( = ?auto_186933 ?auto_186934 ) ) ( not ( = ?auto_186933 ?auto_186931 ) ) ( not ( = ?auto_186933 ?auto_186930 ) ) ( not ( = ?auto_186926 ?auto_186933 ) ) ( not ( = ?auto_186927 ?auto_186933 ) ) ( not ( = ?auto_186928 ?auto_186933 ) ) ( not ( = ?auto_186929 ?auto_186933 ) ) ( ON ?auto_186926 ?auto_186932 ) ( not ( = ?auto_186926 ?auto_186932 ) ) ( not ( = ?auto_186927 ?auto_186932 ) ) ( not ( = ?auto_186928 ?auto_186932 ) ) ( not ( = ?auto_186929 ?auto_186932 ) ) ( not ( = ?auto_186930 ?auto_186932 ) ) ( not ( = ?auto_186931 ?auto_186932 ) ) ( not ( = ?auto_186934 ?auto_186932 ) ) ( not ( = ?auto_186933 ?auto_186932 ) ) ( ON ?auto_186927 ?auto_186926 ) ( ON-TABLE ?auto_186932 ) ( ON ?auto_186928 ?auto_186927 ) ( ON ?auto_186929 ?auto_186928 ) ( ON ?auto_186930 ?auto_186929 ) ( CLEAR ?auto_186934 ) ( ON ?auto_186931 ?auto_186930 ) ( CLEAR ?auto_186931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186932 ?auto_186926 ?auto_186927 ?auto_186928 ?auto_186929 ?auto_186930 )
      ( MAKE-6PILE ?auto_186926 ?auto_186927 ?auto_186928 ?auto_186929 ?auto_186930 ?auto_186931 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186935 - BLOCK
      ?auto_186936 - BLOCK
      ?auto_186937 - BLOCK
      ?auto_186938 - BLOCK
      ?auto_186939 - BLOCK
      ?auto_186940 - BLOCK
    )
    :vars
    (
      ?auto_186943 - BLOCK
      ?auto_186941 - BLOCK
      ?auto_186942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186935 ?auto_186936 ) ) ( not ( = ?auto_186935 ?auto_186937 ) ) ( not ( = ?auto_186935 ?auto_186938 ) ) ( not ( = ?auto_186935 ?auto_186939 ) ) ( not ( = ?auto_186935 ?auto_186940 ) ) ( not ( = ?auto_186936 ?auto_186937 ) ) ( not ( = ?auto_186936 ?auto_186938 ) ) ( not ( = ?auto_186936 ?auto_186939 ) ) ( not ( = ?auto_186936 ?auto_186940 ) ) ( not ( = ?auto_186937 ?auto_186938 ) ) ( not ( = ?auto_186937 ?auto_186939 ) ) ( not ( = ?auto_186937 ?auto_186940 ) ) ( not ( = ?auto_186938 ?auto_186939 ) ) ( not ( = ?auto_186938 ?auto_186940 ) ) ( not ( = ?auto_186939 ?auto_186940 ) ) ( not ( = ?auto_186935 ?auto_186943 ) ) ( not ( = ?auto_186936 ?auto_186943 ) ) ( not ( = ?auto_186937 ?auto_186943 ) ) ( not ( = ?auto_186938 ?auto_186943 ) ) ( not ( = ?auto_186939 ?auto_186943 ) ) ( not ( = ?auto_186940 ?auto_186943 ) ) ( ON-TABLE ?auto_186941 ) ( not ( = ?auto_186941 ?auto_186943 ) ) ( not ( = ?auto_186941 ?auto_186940 ) ) ( not ( = ?auto_186941 ?auto_186939 ) ) ( not ( = ?auto_186935 ?auto_186941 ) ) ( not ( = ?auto_186936 ?auto_186941 ) ) ( not ( = ?auto_186937 ?auto_186941 ) ) ( not ( = ?auto_186938 ?auto_186941 ) ) ( ON ?auto_186935 ?auto_186942 ) ( not ( = ?auto_186935 ?auto_186942 ) ) ( not ( = ?auto_186936 ?auto_186942 ) ) ( not ( = ?auto_186937 ?auto_186942 ) ) ( not ( = ?auto_186938 ?auto_186942 ) ) ( not ( = ?auto_186939 ?auto_186942 ) ) ( not ( = ?auto_186940 ?auto_186942 ) ) ( not ( = ?auto_186943 ?auto_186942 ) ) ( not ( = ?auto_186941 ?auto_186942 ) ) ( ON ?auto_186936 ?auto_186935 ) ( ON-TABLE ?auto_186942 ) ( ON ?auto_186937 ?auto_186936 ) ( ON ?auto_186938 ?auto_186937 ) ( ON ?auto_186939 ?auto_186938 ) ( ON ?auto_186940 ?auto_186939 ) ( CLEAR ?auto_186940 ) ( HOLDING ?auto_186943 ) ( CLEAR ?auto_186941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186941 ?auto_186943 )
      ( MAKE-6PILE ?auto_186935 ?auto_186936 ?auto_186937 ?auto_186938 ?auto_186939 ?auto_186940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186944 - BLOCK
      ?auto_186945 - BLOCK
      ?auto_186946 - BLOCK
      ?auto_186947 - BLOCK
      ?auto_186948 - BLOCK
      ?auto_186949 - BLOCK
    )
    :vars
    (
      ?auto_186952 - BLOCK
      ?auto_186950 - BLOCK
      ?auto_186951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186944 ?auto_186945 ) ) ( not ( = ?auto_186944 ?auto_186946 ) ) ( not ( = ?auto_186944 ?auto_186947 ) ) ( not ( = ?auto_186944 ?auto_186948 ) ) ( not ( = ?auto_186944 ?auto_186949 ) ) ( not ( = ?auto_186945 ?auto_186946 ) ) ( not ( = ?auto_186945 ?auto_186947 ) ) ( not ( = ?auto_186945 ?auto_186948 ) ) ( not ( = ?auto_186945 ?auto_186949 ) ) ( not ( = ?auto_186946 ?auto_186947 ) ) ( not ( = ?auto_186946 ?auto_186948 ) ) ( not ( = ?auto_186946 ?auto_186949 ) ) ( not ( = ?auto_186947 ?auto_186948 ) ) ( not ( = ?auto_186947 ?auto_186949 ) ) ( not ( = ?auto_186948 ?auto_186949 ) ) ( not ( = ?auto_186944 ?auto_186952 ) ) ( not ( = ?auto_186945 ?auto_186952 ) ) ( not ( = ?auto_186946 ?auto_186952 ) ) ( not ( = ?auto_186947 ?auto_186952 ) ) ( not ( = ?auto_186948 ?auto_186952 ) ) ( not ( = ?auto_186949 ?auto_186952 ) ) ( ON-TABLE ?auto_186950 ) ( not ( = ?auto_186950 ?auto_186952 ) ) ( not ( = ?auto_186950 ?auto_186949 ) ) ( not ( = ?auto_186950 ?auto_186948 ) ) ( not ( = ?auto_186944 ?auto_186950 ) ) ( not ( = ?auto_186945 ?auto_186950 ) ) ( not ( = ?auto_186946 ?auto_186950 ) ) ( not ( = ?auto_186947 ?auto_186950 ) ) ( ON ?auto_186944 ?auto_186951 ) ( not ( = ?auto_186944 ?auto_186951 ) ) ( not ( = ?auto_186945 ?auto_186951 ) ) ( not ( = ?auto_186946 ?auto_186951 ) ) ( not ( = ?auto_186947 ?auto_186951 ) ) ( not ( = ?auto_186948 ?auto_186951 ) ) ( not ( = ?auto_186949 ?auto_186951 ) ) ( not ( = ?auto_186952 ?auto_186951 ) ) ( not ( = ?auto_186950 ?auto_186951 ) ) ( ON ?auto_186945 ?auto_186944 ) ( ON-TABLE ?auto_186951 ) ( ON ?auto_186946 ?auto_186945 ) ( ON ?auto_186947 ?auto_186946 ) ( ON ?auto_186948 ?auto_186947 ) ( ON ?auto_186949 ?auto_186948 ) ( CLEAR ?auto_186950 ) ( ON ?auto_186952 ?auto_186949 ) ( CLEAR ?auto_186952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186951 ?auto_186944 ?auto_186945 ?auto_186946 ?auto_186947 ?auto_186948 ?auto_186949 )
      ( MAKE-6PILE ?auto_186944 ?auto_186945 ?auto_186946 ?auto_186947 ?auto_186948 ?auto_186949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186953 - BLOCK
      ?auto_186954 - BLOCK
      ?auto_186955 - BLOCK
      ?auto_186956 - BLOCK
      ?auto_186957 - BLOCK
      ?auto_186958 - BLOCK
    )
    :vars
    (
      ?auto_186960 - BLOCK
      ?auto_186961 - BLOCK
      ?auto_186959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186953 ?auto_186954 ) ) ( not ( = ?auto_186953 ?auto_186955 ) ) ( not ( = ?auto_186953 ?auto_186956 ) ) ( not ( = ?auto_186953 ?auto_186957 ) ) ( not ( = ?auto_186953 ?auto_186958 ) ) ( not ( = ?auto_186954 ?auto_186955 ) ) ( not ( = ?auto_186954 ?auto_186956 ) ) ( not ( = ?auto_186954 ?auto_186957 ) ) ( not ( = ?auto_186954 ?auto_186958 ) ) ( not ( = ?auto_186955 ?auto_186956 ) ) ( not ( = ?auto_186955 ?auto_186957 ) ) ( not ( = ?auto_186955 ?auto_186958 ) ) ( not ( = ?auto_186956 ?auto_186957 ) ) ( not ( = ?auto_186956 ?auto_186958 ) ) ( not ( = ?auto_186957 ?auto_186958 ) ) ( not ( = ?auto_186953 ?auto_186960 ) ) ( not ( = ?auto_186954 ?auto_186960 ) ) ( not ( = ?auto_186955 ?auto_186960 ) ) ( not ( = ?auto_186956 ?auto_186960 ) ) ( not ( = ?auto_186957 ?auto_186960 ) ) ( not ( = ?auto_186958 ?auto_186960 ) ) ( not ( = ?auto_186961 ?auto_186960 ) ) ( not ( = ?auto_186961 ?auto_186958 ) ) ( not ( = ?auto_186961 ?auto_186957 ) ) ( not ( = ?auto_186953 ?auto_186961 ) ) ( not ( = ?auto_186954 ?auto_186961 ) ) ( not ( = ?auto_186955 ?auto_186961 ) ) ( not ( = ?auto_186956 ?auto_186961 ) ) ( ON ?auto_186953 ?auto_186959 ) ( not ( = ?auto_186953 ?auto_186959 ) ) ( not ( = ?auto_186954 ?auto_186959 ) ) ( not ( = ?auto_186955 ?auto_186959 ) ) ( not ( = ?auto_186956 ?auto_186959 ) ) ( not ( = ?auto_186957 ?auto_186959 ) ) ( not ( = ?auto_186958 ?auto_186959 ) ) ( not ( = ?auto_186960 ?auto_186959 ) ) ( not ( = ?auto_186961 ?auto_186959 ) ) ( ON ?auto_186954 ?auto_186953 ) ( ON-TABLE ?auto_186959 ) ( ON ?auto_186955 ?auto_186954 ) ( ON ?auto_186956 ?auto_186955 ) ( ON ?auto_186957 ?auto_186956 ) ( ON ?auto_186958 ?auto_186957 ) ( ON ?auto_186960 ?auto_186958 ) ( CLEAR ?auto_186960 ) ( HOLDING ?auto_186961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186961 )
      ( MAKE-6PILE ?auto_186953 ?auto_186954 ?auto_186955 ?auto_186956 ?auto_186957 ?auto_186958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_186962 - BLOCK
      ?auto_186963 - BLOCK
      ?auto_186964 - BLOCK
      ?auto_186965 - BLOCK
      ?auto_186966 - BLOCK
      ?auto_186967 - BLOCK
    )
    :vars
    (
      ?auto_186970 - BLOCK
      ?auto_186968 - BLOCK
      ?auto_186969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186962 ?auto_186963 ) ) ( not ( = ?auto_186962 ?auto_186964 ) ) ( not ( = ?auto_186962 ?auto_186965 ) ) ( not ( = ?auto_186962 ?auto_186966 ) ) ( not ( = ?auto_186962 ?auto_186967 ) ) ( not ( = ?auto_186963 ?auto_186964 ) ) ( not ( = ?auto_186963 ?auto_186965 ) ) ( not ( = ?auto_186963 ?auto_186966 ) ) ( not ( = ?auto_186963 ?auto_186967 ) ) ( not ( = ?auto_186964 ?auto_186965 ) ) ( not ( = ?auto_186964 ?auto_186966 ) ) ( not ( = ?auto_186964 ?auto_186967 ) ) ( not ( = ?auto_186965 ?auto_186966 ) ) ( not ( = ?auto_186965 ?auto_186967 ) ) ( not ( = ?auto_186966 ?auto_186967 ) ) ( not ( = ?auto_186962 ?auto_186970 ) ) ( not ( = ?auto_186963 ?auto_186970 ) ) ( not ( = ?auto_186964 ?auto_186970 ) ) ( not ( = ?auto_186965 ?auto_186970 ) ) ( not ( = ?auto_186966 ?auto_186970 ) ) ( not ( = ?auto_186967 ?auto_186970 ) ) ( not ( = ?auto_186968 ?auto_186970 ) ) ( not ( = ?auto_186968 ?auto_186967 ) ) ( not ( = ?auto_186968 ?auto_186966 ) ) ( not ( = ?auto_186962 ?auto_186968 ) ) ( not ( = ?auto_186963 ?auto_186968 ) ) ( not ( = ?auto_186964 ?auto_186968 ) ) ( not ( = ?auto_186965 ?auto_186968 ) ) ( ON ?auto_186962 ?auto_186969 ) ( not ( = ?auto_186962 ?auto_186969 ) ) ( not ( = ?auto_186963 ?auto_186969 ) ) ( not ( = ?auto_186964 ?auto_186969 ) ) ( not ( = ?auto_186965 ?auto_186969 ) ) ( not ( = ?auto_186966 ?auto_186969 ) ) ( not ( = ?auto_186967 ?auto_186969 ) ) ( not ( = ?auto_186970 ?auto_186969 ) ) ( not ( = ?auto_186968 ?auto_186969 ) ) ( ON ?auto_186963 ?auto_186962 ) ( ON-TABLE ?auto_186969 ) ( ON ?auto_186964 ?auto_186963 ) ( ON ?auto_186965 ?auto_186964 ) ( ON ?auto_186966 ?auto_186965 ) ( ON ?auto_186967 ?auto_186966 ) ( ON ?auto_186970 ?auto_186967 ) ( ON ?auto_186968 ?auto_186970 ) ( CLEAR ?auto_186968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186969 ?auto_186962 ?auto_186963 ?auto_186964 ?auto_186965 ?auto_186966 ?auto_186967 ?auto_186970 )
      ( MAKE-6PILE ?auto_186962 ?auto_186963 ?auto_186964 ?auto_186965 ?auto_186966 ?auto_186967 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186972 - BLOCK
    )
    :vars
    (
      ?auto_186973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186973 ?auto_186972 ) ( CLEAR ?auto_186973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186972 ) ( not ( = ?auto_186972 ?auto_186973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186973 ?auto_186972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186974 - BLOCK
    )
    :vars
    (
      ?auto_186975 - BLOCK
      ?auto_186976 - BLOCK
      ?auto_186977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186975 ?auto_186974 ) ( CLEAR ?auto_186975 ) ( ON-TABLE ?auto_186974 ) ( not ( = ?auto_186974 ?auto_186975 ) ) ( HOLDING ?auto_186976 ) ( CLEAR ?auto_186977 ) ( not ( = ?auto_186974 ?auto_186976 ) ) ( not ( = ?auto_186974 ?auto_186977 ) ) ( not ( = ?auto_186975 ?auto_186976 ) ) ( not ( = ?auto_186975 ?auto_186977 ) ) ( not ( = ?auto_186976 ?auto_186977 ) ) )
    :subtasks
    ( ( !STACK ?auto_186976 ?auto_186977 )
      ( MAKE-1PILE ?auto_186974 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186978 - BLOCK
    )
    :vars
    (
      ?auto_186981 - BLOCK
      ?auto_186979 - BLOCK
      ?auto_186980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186981 ?auto_186978 ) ( ON-TABLE ?auto_186978 ) ( not ( = ?auto_186978 ?auto_186981 ) ) ( CLEAR ?auto_186979 ) ( not ( = ?auto_186978 ?auto_186980 ) ) ( not ( = ?auto_186978 ?auto_186979 ) ) ( not ( = ?auto_186981 ?auto_186980 ) ) ( not ( = ?auto_186981 ?auto_186979 ) ) ( not ( = ?auto_186980 ?auto_186979 ) ) ( ON ?auto_186980 ?auto_186981 ) ( CLEAR ?auto_186980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186978 ?auto_186981 )
      ( MAKE-1PILE ?auto_186978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186982 - BLOCK
    )
    :vars
    (
      ?auto_186983 - BLOCK
      ?auto_186984 - BLOCK
      ?auto_186985 - BLOCK
      ?auto_186987 - BLOCK
      ?auto_186988 - BLOCK
      ?auto_186989 - BLOCK
      ?auto_186986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186983 ?auto_186982 ) ( ON-TABLE ?auto_186982 ) ( not ( = ?auto_186982 ?auto_186983 ) ) ( not ( = ?auto_186982 ?auto_186984 ) ) ( not ( = ?auto_186982 ?auto_186985 ) ) ( not ( = ?auto_186983 ?auto_186984 ) ) ( not ( = ?auto_186983 ?auto_186985 ) ) ( not ( = ?auto_186984 ?auto_186985 ) ) ( ON ?auto_186984 ?auto_186983 ) ( CLEAR ?auto_186984 ) ( HOLDING ?auto_186985 ) ( CLEAR ?auto_186987 ) ( ON-TABLE ?auto_186988 ) ( ON ?auto_186989 ?auto_186988 ) ( ON ?auto_186986 ?auto_186989 ) ( ON ?auto_186987 ?auto_186986 ) ( not ( = ?auto_186988 ?auto_186989 ) ) ( not ( = ?auto_186988 ?auto_186986 ) ) ( not ( = ?auto_186988 ?auto_186987 ) ) ( not ( = ?auto_186988 ?auto_186985 ) ) ( not ( = ?auto_186989 ?auto_186986 ) ) ( not ( = ?auto_186989 ?auto_186987 ) ) ( not ( = ?auto_186989 ?auto_186985 ) ) ( not ( = ?auto_186986 ?auto_186987 ) ) ( not ( = ?auto_186986 ?auto_186985 ) ) ( not ( = ?auto_186987 ?auto_186985 ) ) ( not ( = ?auto_186982 ?auto_186987 ) ) ( not ( = ?auto_186982 ?auto_186988 ) ) ( not ( = ?auto_186982 ?auto_186989 ) ) ( not ( = ?auto_186982 ?auto_186986 ) ) ( not ( = ?auto_186983 ?auto_186987 ) ) ( not ( = ?auto_186983 ?auto_186988 ) ) ( not ( = ?auto_186983 ?auto_186989 ) ) ( not ( = ?auto_186983 ?auto_186986 ) ) ( not ( = ?auto_186984 ?auto_186987 ) ) ( not ( = ?auto_186984 ?auto_186988 ) ) ( not ( = ?auto_186984 ?auto_186989 ) ) ( not ( = ?auto_186984 ?auto_186986 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186988 ?auto_186989 ?auto_186986 ?auto_186987 ?auto_186985 )
      ( MAKE-1PILE ?auto_186982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186990 - BLOCK
    )
    :vars
    (
      ?auto_186994 - BLOCK
      ?auto_186996 - BLOCK
      ?auto_186995 - BLOCK
      ?auto_186997 - BLOCK
      ?auto_186992 - BLOCK
      ?auto_186991 - BLOCK
      ?auto_186993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186994 ?auto_186990 ) ( ON-TABLE ?auto_186990 ) ( not ( = ?auto_186990 ?auto_186994 ) ) ( not ( = ?auto_186990 ?auto_186996 ) ) ( not ( = ?auto_186990 ?auto_186995 ) ) ( not ( = ?auto_186994 ?auto_186996 ) ) ( not ( = ?auto_186994 ?auto_186995 ) ) ( not ( = ?auto_186996 ?auto_186995 ) ) ( ON ?auto_186996 ?auto_186994 ) ( CLEAR ?auto_186997 ) ( ON-TABLE ?auto_186992 ) ( ON ?auto_186991 ?auto_186992 ) ( ON ?auto_186993 ?auto_186991 ) ( ON ?auto_186997 ?auto_186993 ) ( not ( = ?auto_186992 ?auto_186991 ) ) ( not ( = ?auto_186992 ?auto_186993 ) ) ( not ( = ?auto_186992 ?auto_186997 ) ) ( not ( = ?auto_186992 ?auto_186995 ) ) ( not ( = ?auto_186991 ?auto_186993 ) ) ( not ( = ?auto_186991 ?auto_186997 ) ) ( not ( = ?auto_186991 ?auto_186995 ) ) ( not ( = ?auto_186993 ?auto_186997 ) ) ( not ( = ?auto_186993 ?auto_186995 ) ) ( not ( = ?auto_186997 ?auto_186995 ) ) ( not ( = ?auto_186990 ?auto_186997 ) ) ( not ( = ?auto_186990 ?auto_186992 ) ) ( not ( = ?auto_186990 ?auto_186991 ) ) ( not ( = ?auto_186990 ?auto_186993 ) ) ( not ( = ?auto_186994 ?auto_186997 ) ) ( not ( = ?auto_186994 ?auto_186992 ) ) ( not ( = ?auto_186994 ?auto_186991 ) ) ( not ( = ?auto_186994 ?auto_186993 ) ) ( not ( = ?auto_186996 ?auto_186997 ) ) ( not ( = ?auto_186996 ?auto_186992 ) ) ( not ( = ?auto_186996 ?auto_186991 ) ) ( not ( = ?auto_186996 ?auto_186993 ) ) ( ON ?auto_186995 ?auto_186996 ) ( CLEAR ?auto_186995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186990 ?auto_186994 ?auto_186996 )
      ( MAKE-1PILE ?auto_186990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_186998 - BLOCK
    )
    :vars
    (
      ?auto_186999 - BLOCK
      ?auto_187002 - BLOCK
      ?auto_187005 - BLOCK
      ?auto_187001 - BLOCK
      ?auto_187004 - BLOCK
      ?auto_187000 - BLOCK
      ?auto_187003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186999 ?auto_186998 ) ( ON-TABLE ?auto_186998 ) ( not ( = ?auto_186998 ?auto_186999 ) ) ( not ( = ?auto_186998 ?auto_187002 ) ) ( not ( = ?auto_186998 ?auto_187005 ) ) ( not ( = ?auto_186999 ?auto_187002 ) ) ( not ( = ?auto_186999 ?auto_187005 ) ) ( not ( = ?auto_187002 ?auto_187005 ) ) ( ON ?auto_187002 ?auto_186999 ) ( ON-TABLE ?auto_187001 ) ( ON ?auto_187004 ?auto_187001 ) ( ON ?auto_187000 ?auto_187004 ) ( not ( = ?auto_187001 ?auto_187004 ) ) ( not ( = ?auto_187001 ?auto_187000 ) ) ( not ( = ?auto_187001 ?auto_187003 ) ) ( not ( = ?auto_187001 ?auto_187005 ) ) ( not ( = ?auto_187004 ?auto_187000 ) ) ( not ( = ?auto_187004 ?auto_187003 ) ) ( not ( = ?auto_187004 ?auto_187005 ) ) ( not ( = ?auto_187000 ?auto_187003 ) ) ( not ( = ?auto_187000 ?auto_187005 ) ) ( not ( = ?auto_187003 ?auto_187005 ) ) ( not ( = ?auto_186998 ?auto_187003 ) ) ( not ( = ?auto_186998 ?auto_187001 ) ) ( not ( = ?auto_186998 ?auto_187004 ) ) ( not ( = ?auto_186998 ?auto_187000 ) ) ( not ( = ?auto_186999 ?auto_187003 ) ) ( not ( = ?auto_186999 ?auto_187001 ) ) ( not ( = ?auto_186999 ?auto_187004 ) ) ( not ( = ?auto_186999 ?auto_187000 ) ) ( not ( = ?auto_187002 ?auto_187003 ) ) ( not ( = ?auto_187002 ?auto_187001 ) ) ( not ( = ?auto_187002 ?auto_187004 ) ) ( not ( = ?auto_187002 ?auto_187000 ) ) ( ON ?auto_187005 ?auto_187002 ) ( CLEAR ?auto_187005 ) ( HOLDING ?auto_187003 ) ( CLEAR ?auto_187000 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187001 ?auto_187004 ?auto_187000 ?auto_187003 )
      ( MAKE-1PILE ?auto_186998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187006 - BLOCK
    )
    :vars
    (
      ?auto_187010 - BLOCK
      ?auto_187009 - BLOCK
      ?auto_187012 - BLOCK
      ?auto_187008 - BLOCK
      ?auto_187013 - BLOCK
      ?auto_187011 - BLOCK
      ?auto_187007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187010 ?auto_187006 ) ( ON-TABLE ?auto_187006 ) ( not ( = ?auto_187006 ?auto_187010 ) ) ( not ( = ?auto_187006 ?auto_187009 ) ) ( not ( = ?auto_187006 ?auto_187012 ) ) ( not ( = ?auto_187010 ?auto_187009 ) ) ( not ( = ?auto_187010 ?auto_187012 ) ) ( not ( = ?auto_187009 ?auto_187012 ) ) ( ON ?auto_187009 ?auto_187010 ) ( ON-TABLE ?auto_187008 ) ( ON ?auto_187013 ?auto_187008 ) ( ON ?auto_187011 ?auto_187013 ) ( not ( = ?auto_187008 ?auto_187013 ) ) ( not ( = ?auto_187008 ?auto_187011 ) ) ( not ( = ?auto_187008 ?auto_187007 ) ) ( not ( = ?auto_187008 ?auto_187012 ) ) ( not ( = ?auto_187013 ?auto_187011 ) ) ( not ( = ?auto_187013 ?auto_187007 ) ) ( not ( = ?auto_187013 ?auto_187012 ) ) ( not ( = ?auto_187011 ?auto_187007 ) ) ( not ( = ?auto_187011 ?auto_187012 ) ) ( not ( = ?auto_187007 ?auto_187012 ) ) ( not ( = ?auto_187006 ?auto_187007 ) ) ( not ( = ?auto_187006 ?auto_187008 ) ) ( not ( = ?auto_187006 ?auto_187013 ) ) ( not ( = ?auto_187006 ?auto_187011 ) ) ( not ( = ?auto_187010 ?auto_187007 ) ) ( not ( = ?auto_187010 ?auto_187008 ) ) ( not ( = ?auto_187010 ?auto_187013 ) ) ( not ( = ?auto_187010 ?auto_187011 ) ) ( not ( = ?auto_187009 ?auto_187007 ) ) ( not ( = ?auto_187009 ?auto_187008 ) ) ( not ( = ?auto_187009 ?auto_187013 ) ) ( not ( = ?auto_187009 ?auto_187011 ) ) ( ON ?auto_187012 ?auto_187009 ) ( CLEAR ?auto_187011 ) ( ON ?auto_187007 ?auto_187012 ) ( CLEAR ?auto_187007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187006 ?auto_187010 ?auto_187009 ?auto_187012 )
      ( MAKE-1PILE ?auto_187006 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187014 - BLOCK
    )
    :vars
    (
      ?auto_187016 - BLOCK
      ?auto_187020 - BLOCK
      ?auto_187017 - BLOCK
      ?auto_187018 - BLOCK
      ?auto_187015 - BLOCK
      ?auto_187021 - BLOCK
      ?auto_187019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187016 ?auto_187014 ) ( ON-TABLE ?auto_187014 ) ( not ( = ?auto_187014 ?auto_187016 ) ) ( not ( = ?auto_187014 ?auto_187020 ) ) ( not ( = ?auto_187014 ?auto_187017 ) ) ( not ( = ?auto_187016 ?auto_187020 ) ) ( not ( = ?auto_187016 ?auto_187017 ) ) ( not ( = ?auto_187020 ?auto_187017 ) ) ( ON ?auto_187020 ?auto_187016 ) ( ON-TABLE ?auto_187018 ) ( ON ?auto_187015 ?auto_187018 ) ( not ( = ?auto_187018 ?auto_187015 ) ) ( not ( = ?auto_187018 ?auto_187021 ) ) ( not ( = ?auto_187018 ?auto_187019 ) ) ( not ( = ?auto_187018 ?auto_187017 ) ) ( not ( = ?auto_187015 ?auto_187021 ) ) ( not ( = ?auto_187015 ?auto_187019 ) ) ( not ( = ?auto_187015 ?auto_187017 ) ) ( not ( = ?auto_187021 ?auto_187019 ) ) ( not ( = ?auto_187021 ?auto_187017 ) ) ( not ( = ?auto_187019 ?auto_187017 ) ) ( not ( = ?auto_187014 ?auto_187019 ) ) ( not ( = ?auto_187014 ?auto_187018 ) ) ( not ( = ?auto_187014 ?auto_187015 ) ) ( not ( = ?auto_187014 ?auto_187021 ) ) ( not ( = ?auto_187016 ?auto_187019 ) ) ( not ( = ?auto_187016 ?auto_187018 ) ) ( not ( = ?auto_187016 ?auto_187015 ) ) ( not ( = ?auto_187016 ?auto_187021 ) ) ( not ( = ?auto_187020 ?auto_187019 ) ) ( not ( = ?auto_187020 ?auto_187018 ) ) ( not ( = ?auto_187020 ?auto_187015 ) ) ( not ( = ?auto_187020 ?auto_187021 ) ) ( ON ?auto_187017 ?auto_187020 ) ( ON ?auto_187019 ?auto_187017 ) ( CLEAR ?auto_187019 ) ( HOLDING ?auto_187021 ) ( CLEAR ?auto_187015 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187018 ?auto_187015 ?auto_187021 )
      ( MAKE-1PILE ?auto_187014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187022 - BLOCK
    )
    :vars
    (
      ?auto_187027 - BLOCK
      ?auto_187023 - BLOCK
      ?auto_187028 - BLOCK
      ?auto_187025 - BLOCK
      ?auto_187029 - BLOCK
      ?auto_187026 - BLOCK
      ?auto_187024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187027 ?auto_187022 ) ( ON-TABLE ?auto_187022 ) ( not ( = ?auto_187022 ?auto_187027 ) ) ( not ( = ?auto_187022 ?auto_187023 ) ) ( not ( = ?auto_187022 ?auto_187028 ) ) ( not ( = ?auto_187027 ?auto_187023 ) ) ( not ( = ?auto_187027 ?auto_187028 ) ) ( not ( = ?auto_187023 ?auto_187028 ) ) ( ON ?auto_187023 ?auto_187027 ) ( ON-TABLE ?auto_187025 ) ( ON ?auto_187029 ?auto_187025 ) ( not ( = ?auto_187025 ?auto_187029 ) ) ( not ( = ?auto_187025 ?auto_187026 ) ) ( not ( = ?auto_187025 ?auto_187024 ) ) ( not ( = ?auto_187025 ?auto_187028 ) ) ( not ( = ?auto_187029 ?auto_187026 ) ) ( not ( = ?auto_187029 ?auto_187024 ) ) ( not ( = ?auto_187029 ?auto_187028 ) ) ( not ( = ?auto_187026 ?auto_187024 ) ) ( not ( = ?auto_187026 ?auto_187028 ) ) ( not ( = ?auto_187024 ?auto_187028 ) ) ( not ( = ?auto_187022 ?auto_187024 ) ) ( not ( = ?auto_187022 ?auto_187025 ) ) ( not ( = ?auto_187022 ?auto_187029 ) ) ( not ( = ?auto_187022 ?auto_187026 ) ) ( not ( = ?auto_187027 ?auto_187024 ) ) ( not ( = ?auto_187027 ?auto_187025 ) ) ( not ( = ?auto_187027 ?auto_187029 ) ) ( not ( = ?auto_187027 ?auto_187026 ) ) ( not ( = ?auto_187023 ?auto_187024 ) ) ( not ( = ?auto_187023 ?auto_187025 ) ) ( not ( = ?auto_187023 ?auto_187029 ) ) ( not ( = ?auto_187023 ?auto_187026 ) ) ( ON ?auto_187028 ?auto_187023 ) ( ON ?auto_187024 ?auto_187028 ) ( CLEAR ?auto_187029 ) ( ON ?auto_187026 ?auto_187024 ) ( CLEAR ?auto_187026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187022 ?auto_187027 ?auto_187023 ?auto_187028 ?auto_187024 )
      ( MAKE-1PILE ?auto_187022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187030 - BLOCK
    )
    :vars
    (
      ?auto_187032 - BLOCK
      ?auto_187037 - BLOCK
      ?auto_187033 - BLOCK
      ?auto_187031 - BLOCK
      ?auto_187036 - BLOCK
      ?auto_187035 - BLOCK
      ?auto_187034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187032 ?auto_187030 ) ( ON-TABLE ?auto_187030 ) ( not ( = ?auto_187030 ?auto_187032 ) ) ( not ( = ?auto_187030 ?auto_187037 ) ) ( not ( = ?auto_187030 ?auto_187033 ) ) ( not ( = ?auto_187032 ?auto_187037 ) ) ( not ( = ?auto_187032 ?auto_187033 ) ) ( not ( = ?auto_187037 ?auto_187033 ) ) ( ON ?auto_187037 ?auto_187032 ) ( ON-TABLE ?auto_187031 ) ( not ( = ?auto_187031 ?auto_187036 ) ) ( not ( = ?auto_187031 ?auto_187035 ) ) ( not ( = ?auto_187031 ?auto_187034 ) ) ( not ( = ?auto_187031 ?auto_187033 ) ) ( not ( = ?auto_187036 ?auto_187035 ) ) ( not ( = ?auto_187036 ?auto_187034 ) ) ( not ( = ?auto_187036 ?auto_187033 ) ) ( not ( = ?auto_187035 ?auto_187034 ) ) ( not ( = ?auto_187035 ?auto_187033 ) ) ( not ( = ?auto_187034 ?auto_187033 ) ) ( not ( = ?auto_187030 ?auto_187034 ) ) ( not ( = ?auto_187030 ?auto_187031 ) ) ( not ( = ?auto_187030 ?auto_187036 ) ) ( not ( = ?auto_187030 ?auto_187035 ) ) ( not ( = ?auto_187032 ?auto_187034 ) ) ( not ( = ?auto_187032 ?auto_187031 ) ) ( not ( = ?auto_187032 ?auto_187036 ) ) ( not ( = ?auto_187032 ?auto_187035 ) ) ( not ( = ?auto_187037 ?auto_187034 ) ) ( not ( = ?auto_187037 ?auto_187031 ) ) ( not ( = ?auto_187037 ?auto_187036 ) ) ( not ( = ?auto_187037 ?auto_187035 ) ) ( ON ?auto_187033 ?auto_187037 ) ( ON ?auto_187034 ?auto_187033 ) ( ON ?auto_187035 ?auto_187034 ) ( CLEAR ?auto_187035 ) ( HOLDING ?auto_187036 ) ( CLEAR ?auto_187031 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187031 ?auto_187036 )
      ( MAKE-1PILE ?auto_187030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187038 - BLOCK
    )
    :vars
    (
      ?auto_187040 - BLOCK
      ?auto_187041 - BLOCK
      ?auto_187043 - BLOCK
      ?auto_187039 - BLOCK
      ?auto_187045 - BLOCK
      ?auto_187042 - BLOCK
      ?auto_187044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187040 ?auto_187038 ) ( ON-TABLE ?auto_187038 ) ( not ( = ?auto_187038 ?auto_187040 ) ) ( not ( = ?auto_187038 ?auto_187041 ) ) ( not ( = ?auto_187038 ?auto_187043 ) ) ( not ( = ?auto_187040 ?auto_187041 ) ) ( not ( = ?auto_187040 ?auto_187043 ) ) ( not ( = ?auto_187041 ?auto_187043 ) ) ( ON ?auto_187041 ?auto_187040 ) ( ON-TABLE ?auto_187039 ) ( not ( = ?auto_187039 ?auto_187045 ) ) ( not ( = ?auto_187039 ?auto_187042 ) ) ( not ( = ?auto_187039 ?auto_187044 ) ) ( not ( = ?auto_187039 ?auto_187043 ) ) ( not ( = ?auto_187045 ?auto_187042 ) ) ( not ( = ?auto_187045 ?auto_187044 ) ) ( not ( = ?auto_187045 ?auto_187043 ) ) ( not ( = ?auto_187042 ?auto_187044 ) ) ( not ( = ?auto_187042 ?auto_187043 ) ) ( not ( = ?auto_187044 ?auto_187043 ) ) ( not ( = ?auto_187038 ?auto_187044 ) ) ( not ( = ?auto_187038 ?auto_187039 ) ) ( not ( = ?auto_187038 ?auto_187045 ) ) ( not ( = ?auto_187038 ?auto_187042 ) ) ( not ( = ?auto_187040 ?auto_187044 ) ) ( not ( = ?auto_187040 ?auto_187039 ) ) ( not ( = ?auto_187040 ?auto_187045 ) ) ( not ( = ?auto_187040 ?auto_187042 ) ) ( not ( = ?auto_187041 ?auto_187044 ) ) ( not ( = ?auto_187041 ?auto_187039 ) ) ( not ( = ?auto_187041 ?auto_187045 ) ) ( not ( = ?auto_187041 ?auto_187042 ) ) ( ON ?auto_187043 ?auto_187041 ) ( ON ?auto_187044 ?auto_187043 ) ( ON ?auto_187042 ?auto_187044 ) ( CLEAR ?auto_187039 ) ( ON ?auto_187045 ?auto_187042 ) ( CLEAR ?auto_187045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187038 ?auto_187040 ?auto_187041 ?auto_187043 ?auto_187044 ?auto_187042 )
      ( MAKE-1PILE ?auto_187038 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187046 - BLOCK
    )
    :vars
    (
      ?auto_187050 - BLOCK
      ?auto_187047 - BLOCK
      ?auto_187052 - BLOCK
      ?auto_187048 - BLOCK
      ?auto_187053 - BLOCK
      ?auto_187049 - BLOCK
      ?auto_187051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187050 ?auto_187046 ) ( ON-TABLE ?auto_187046 ) ( not ( = ?auto_187046 ?auto_187050 ) ) ( not ( = ?auto_187046 ?auto_187047 ) ) ( not ( = ?auto_187046 ?auto_187052 ) ) ( not ( = ?auto_187050 ?auto_187047 ) ) ( not ( = ?auto_187050 ?auto_187052 ) ) ( not ( = ?auto_187047 ?auto_187052 ) ) ( ON ?auto_187047 ?auto_187050 ) ( not ( = ?auto_187048 ?auto_187053 ) ) ( not ( = ?auto_187048 ?auto_187049 ) ) ( not ( = ?auto_187048 ?auto_187051 ) ) ( not ( = ?auto_187048 ?auto_187052 ) ) ( not ( = ?auto_187053 ?auto_187049 ) ) ( not ( = ?auto_187053 ?auto_187051 ) ) ( not ( = ?auto_187053 ?auto_187052 ) ) ( not ( = ?auto_187049 ?auto_187051 ) ) ( not ( = ?auto_187049 ?auto_187052 ) ) ( not ( = ?auto_187051 ?auto_187052 ) ) ( not ( = ?auto_187046 ?auto_187051 ) ) ( not ( = ?auto_187046 ?auto_187048 ) ) ( not ( = ?auto_187046 ?auto_187053 ) ) ( not ( = ?auto_187046 ?auto_187049 ) ) ( not ( = ?auto_187050 ?auto_187051 ) ) ( not ( = ?auto_187050 ?auto_187048 ) ) ( not ( = ?auto_187050 ?auto_187053 ) ) ( not ( = ?auto_187050 ?auto_187049 ) ) ( not ( = ?auto_187047 ?auto_187051 ) ) ( not ( = ?auto_187047 ?auto_187048 ) ) ( not ( = ?auto_187047 ?auto_187053 ) ) ( not ( = ?auto_187047 ?auto_187049 ) ) ( ON ?auto_187052 ?auto_187047 ) ( ON ?auto_187051 ?auto_187052 ) ( ON ?auto_187049 ?auto_187051 ) ( ON ?auto_187053 ?auto_187049 ) ( CLEAR ?auto_187053 ) ( HOLDING ?auto_187048 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187048 )
      ( MAKE-1PILE ?auto_187046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187054 - BLOCK
    )
    :vars
    (
      ?auto_187058 - BLOCK
      ?auto_187056 - BLOCK
      ?auto_187055 - BLOCK
      ?auto_187061 - BLOCK
      ?auto_187059 - BLOCK
      ?auto_187060 - BLOCK
      ?auto_187057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187058 ?auto_187054 ) ( ON-TABLE ?auto_187054 ) ( not ( = ?auto_187054 ?auto_187058 ) ) ( not ( = ?auto_187054 ?auto_187056 ) ) ( not ( = ?auto_187054 ?auto_187055 ) ) ( not ( = ?auto_187058 ?auto_187056 ) ) ( not ( = ?auto_187058 ?auto_187055 ) ) ( not ( = ?auto_187056 ?auto_187055 ) ) ( ON ?auto_187056 ?auto_187058 ) ( not ( = ?auto_187061 ?auto_187059 ) ) ( not ( = ?auto_187061 ?auto_187060 ) ) ( not ( = ?auto_187061 ?auto_187057 ) ) ( not ( = ?auto_187061 ?auto_187055 ) ) ( not ( = ?auto_187059 ?auto_187060 ) ) ( not ( = ?auto_187059 ?auto_187057 ) ) ( not ( = ?auto_187059 ?auto_187055 ) ) ( not ( = ?auto_187060 ?auto_187057 ) ) ( not ( = ?auto_187060 ?auto_187055 ) ) ( not ( = ?auto_187057 ?auto_187055 ) ) ( not ( = ?auto_187054 ?auto_187057 ) ) ( not ( = ?auto_187054 ?auto_187061 ) ) ( not ( = ?auto_187054 ?auto_187059 ) ) ( not ( = ?auto_187054 ?auto_187060 ) ) ( not ( = ?auto_187058 ?auto_187057 ) ) ( not ( = ?auto_187058 ?auto_187061 ) ) ( not ( = ?auto_187058 ?auto_187059 ) ) ( not ( = ?auto_187058 ?auto_187060 ) ) ( not ( = ?auto_187056 ?auto_187057 ) ) ( not ( = ?auto_187056 ?auto_187061 ) ) ( not ( = ?auto_187056 ?auto_187059 ) ) ( not ( = ?auto_187056 ?auto_187060 ) ) ( ON ?auto_187055 ?auto_187056 ) ( ON ?auto_187057 ?auto_187055 ) ( ON ?auto_187060 ?auto_187057 ) ( ON ?auto_187059 ?auto_187060 ) ( ON ?auto_187061 ?auto_187059 ) ( CLEAR ?auto_187061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187054 ?auto_187058 ?auto_187056 ?auto_187055 ?auto_187057 ?auto_187060 ?auto_187059 )
      ( MAKE-1PILE ?auto_187054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187062 - BLOCK
    )
    :vars
    (
      ?auto_187064 - BLOCK
      ?auto_187067 - BLOCK
      ?auto_187065 - BLOCK
      ?auto_187066 - BLOCK
      ?auto_187069 - BLOCK
      ?auto_187063 - BLOCK
      ?auto_187068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187064 ?auto_187062 ) ( ON-TABLE ?auto_187062 ) ( not ( = ?auto_187062 ?auto_187064 ) ) ( not ( = ?auto_187062 ?auto_187067 ) ) ( not ( = ?auto_187062 ?auto_187065 ) ) ( not ( = ?auto_187064 ?auto_187067 ) ) ( not ( = ?auto_187064 ?auto_187065 ) ) ( not ( = ?auto_187067 ?auto_187065 ) ) ( ON ?auto_187067 ?auto_187064 ) ( not ( = ?auto_187066 ?auto_187069 ) ) ( not ( = ?auto_187066 ?auto_187063 ) ) ( not ( = ?auto_187066 ?auto_187068 ) ) ( not ( = ?auto_187066 ?auto_187065 ) ) ( not ( = ?auto_187069 ?auto_187063 ) ) ( not ( = ?auto_187069 ?auto_187068 ) ) ( not ( = ?auto_187069 ?auto_187065 ) ) ( not ( = ?auto_187063 ?auto_187068 ) ) ( not ( = ?auto_187063 ?auto_187065 ) ) ( not ( = ?auto_187068 ?auto_187065 ) ) ( not ( = ?auto_187062 ?auto_187068 ) ) ( not ( = ?auto_187062 ?auto_187066 ) ) ( not ( = ?auto_187062 ?auto_187069 ) ) ( not ( = ?auto_187062 ?auto_187063 ) ) ( not ( = ?auto_187064 ?auto_187068 ) ) ( not ( = ?auto_187064 ?auto_187066 ) ) ( not ( = ?auto_187064 ?auto_187069 ) ) ( not ( = ?auto_187064 ?auto_187063 ) ) ( not ( = ?auto_187067 ?auto_187068 ) ) ( not ( = ?auto_187067 ?auto_187066 ) ) ( not ( = ?auto_187067 ?auto_187069 ) ) ( not ( = ?auto_187067 ?auto_187063 ) ) ( ON ?auto_187065 ?auto_187067 ) ( ON ?auto_187068 ?auto_187065 ) ( ON ?auto_187063 ?auto_187068 ) ( ON ?auto_187069 ?auto_187063 ) ( HOLDING ?auto_187066 ) ( CLEAR ?auto_187069 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187062 ?auto_187064 ?auto_187067 ?auto_187065 ?auto_187068 ?auto_187063 ?auto_187069 ?auto_187066 )
      ( MAKE-1PILE ?auto_187062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187070 - BLOCK
    )
    :vars
    (
      ?auto_187071 - BLOCK
      ?auto_187076 - BLOCK
      ?auto_187074 - BLOCK
      ?auto_187073 - BLOCK
      ?auto_187075 - BLOCK
      ?auto_187072 - BLOCK
      ?auto_187077 - BLOCK
      ?auto_187078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187071 ?auto_187070 ) ( ON-TABLE ?auto_187070 ) ( not ( = ?auto_187070 ?auto_187071 ) ) ( not ( = ?auto_187070 ?auto_187076 ) ) ( not ( = ?auto_187070 ?auto_187074 ) ) ( not ( = ?auto_187071 ?auto_187076 ) ) ( not ( = ?auto_187071 ?auto_187074 ) ) ( not ( = ?auto_187076 ?auto_187074 ) ) ( ON ?auto_187076 ?auto_187071 ) ( not ( = ?auto_187073 ?auto_187075 ) ) ( not ( = ?auto_187073 ?auto_187072 ) ) ( not ( = ?auto_187073 ?auto_187077 ) ) ( not ( = ?auto_187073 ?auto_187074 ) ) ( not ( = ?auto_187075 ?auto_187072 ) ) ( not ( = ?auto_187075 ?auto_187077 ) ) ( not ( = ?auto_187075 ?auto_187074 ) ) ( not ( = ?auto_187072 ?auto_187077 ) ) ( not ( = ?auto_187072 ?auto_187074 ) ) ( not ( = ?auto_187077 ?auto_187074 ) ) ( not ( = ?auto_187070 ?auto_187077 ) ) ( not ( = ?auto_187070 ?auto_187073 ) ) ( not ( = ?auto_187070 ?auto_187075 ) ) ( not ( = ?auto_187070 ?auto_187072 ) ) ( not ( = ?auto_187071 ?auto_187077 ) ) ( not ( = ?auto_187071 ?auto_187073 ) ) ( not ( = ?auto_187071 ?auto_187075 ) ) ( not ( = ?auto_187071 ?auto_187072 ) ) ( not ( = ?auto_187076 ?auto_187077 ) ) ( not ( = ?auto_187076 ?auto_187073 ) ) ( not ( = ?auto_187076 ?auto_187075 ) ) ( not ( = ?auto_187076 ?auto_187072 ) ) ( ON ?auto_187074 ?auto_187076 ) ( ON ?auto_187077 ?auto_187074 ) ( ON ?auto_187072 ?auto_187077 ) ( ON ?auto_187075 ?auto_187072 ) ( CLEAR ?auto_187075 ) ( ON ?auto_187073 ?auto_187078 ) ( CLEAR ?auto_187073 ) ( HAND-EMPTY ) ( not ( = ?auto_187070 ?auto_187078 ) ) ( not ( = ?auto_187071 ?auto_187078 ) ) ( not ( = ?auto_187076 ?auto_187078 ) ) ( not ( = ?auto_187074 ?auto_187078 ) ) ( not ( = ?auto_187073 ?auto_187078 ) ) ( not ( = ?auto_187075 ?auto_187078 ) ) ( not ( = ?auto_187072 ?auto_187078 ) ) ( not ( = ?auto_187077 ?auto_187078 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187073 ?auto_187078 )
      ( MAKE-1PILE ?auto_187070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187079 - BLOCK
    )
    :vars
    (
      ?auto_187086 - BLOCK
      ?auto_187083 - BLOCK
      ?auto_187084 - BLOCK
      ?auto_187085 - BLOCK
      ?auto_187081 - BLOCK
      ?auto_187082 - BLOCK
      ?auto_187080 - BLOCK
      ?auto_187087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187086 ?auto_187079 ) ( ON-TABLE ?auto_187079 ) ( not ( = ?auto_187079 ?auto_187086 ) ) ( not ( = ?auto_187079 ?auto_187083 ) ) ( not ( = ?auto_187079 ?auto_187084 ) ) ( not ( = ?auto_187086 ?auto_187083 ) ) ( not ( = ?auto_187086 ?auto_187084 ) ) ( not ( = ?auto_187083 ?auto_187084 ) ) ( ON ?auto_187083 ?auto_187086 ) ( not ( = ?auto_187085 ?auto_187081 ) ) ( not ( = ?auto_187085 ?auto_187082 ) ) ( not ( = ?auto_187085 ?auto_187080 ) ) ( not ( = ?auto_187085 ?auto_187084 ) ) ( not ( = ?auto_187081 ?auto_187082 ) ) ( not ( = ?auto_187081 ?auto_187080 ) ) ( not ( = ?auto_187081 ?auto_187084 ) ) ( not ( = ?auto_187082 ?auto_187080 ) ) ( not ( = ?auto_187082 ?auto_187084 ) ) ( not ( = ?auto_187080 ?auto_187084 ) ) ( not ( = ?auto_187079 ?auto_187080 ) ) ( not ( = ?auto_187079 ?auto_187085 ) ) ( not ( = ?auto_187079 ?auto_187081 ) ) ( not ( = ?auto_187079 ?auto_187082 ) ) ( not ( = ?auto_187086 ?auto_187080 ) ) ( not ( = ?auto_187086 ?auto_187085 ) ) ( not ( = ?auto_187086 ?auto_187081 ) ) ( not ( = ?auto_187086 ?auto_187082 ) ) ( not ( = ?auto_187083 ?auto_187080 ) ) ( not ( = ?auto_187083 ?auto_187085 ) ) ( not ( = ?auto_187083 ?auto_187081 ) ) ( not ( = ?auto_187083 ?auto_187082 ) ) ( ON ?auto_187084 ?auto_187083 ) ( ON ?auto_187080 ?auto_187084 ) ( ON ?auto_187082 ?auto_187080 ) ( ON ?auto_187085 ?auto_187087 ) ( CLEAR ?auto_187085 ) ( not ( = ?auto_187079 ?auto_187087 ) ) ( not ( = ?auto_187086 ?auto_187087 ) ) ( not ( = ?auto_187083 ?auto_187087 ) ) ( not ( = ?auto_187084 ?auto_187087 ) ) ( not ( = ?auto_187085 ?auto_187087 ) ) ( not ( = ?auto_187081 ?auto_187087 ) ) ( not ( = ?auto_187082 ?auto_187087 ) ) ( not ( = ?auto_187080 ?auto_187087 ) ) ( HOLDING ?auto_187081 ) ( CLEAR ?auto_187082 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187079 ?auto_187086 ?auto_187083 ?auto_187084 ?auto_187080 ?auto_187082 ?auto_187081 )
      ( MAKE-1PILE ?auto_187079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187088 - BLOCK
    )
    :vars
    (
      ?auto_187096 - BLOCK
      ?auto_187094 - BLOCK
      ?auto_187093 - BLOCK
      ?auto_187095 - BLOCK
      ?auto_187089 - BLOCK
      ?auto_187091 - BLOCK
      ?auto_187092 - BLOCK
      ?auto_187090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187096 ?auto_187088 ) ( ON-TABLE ?auto_187088 ) ( not ( = ?auto_187088 ?auto_187096 ) ) ( not ( = ?auto_187088 ?auto_187094 ) ) ( not ( = ?auto_187088 ?auto_187093 ) ) ( not ( = ?auto_187096 ?auto_187094 ) ) ( not ( = ?auto_187096 ?auto_187093 ) ) ( not ( = ?auto_187094 ?auto_187093 ) ) ( ON ?auto_187094 ?auto_187096 ) ( not ( = ?auto_187095 ?auto_187089 ) ) ( not ( = ?auto_187095 ?auto_187091 ) ) ( not ( = ?auto_187095 ?auto_187092 ) ) ( not ( = ?auto_187095 ?auto_187093 ) ) ( not ( = ?auto_187089 ?auto_187091 ) ) ( not ( = ?auto_187089 ?auto_187092 ) ) ( not ( = ?auto_187089 ?auto_187093 ) ) ( not ( = ?auto_187091 ?auto_187092 ) ) ( not ( = ?auto_187091 ?auto_187093 ) ) ( not ( = ?auto_187092 ?auto_187093 ) ) ( not ( = ?auto_187088 ?auto_187092 ) ) ( not ( = ?auto_187088 ?auto_187095 ) ) ( not ( = ?auto_187088 ?auto_187089 ) ) ( not ( = ?auto_187088 ?auto_187091 ) ) ( not ( = ?auto_187096 ?auto_187092 ) ) ( not ( = ?auto_187096 ?auto_187095 ) ) ( not ( = ?auto_187096 ?auto_187089 ) ) ( not ( = ?auto_187096 ?auto_187091 ) ) ( not ( = ?auto_187094 ?auto_187092 ) ) ( not ( = ?auto_187094 ?auto_187095 ) ) ( not ( = ?auto_187094 ?auto_187089 ) ) ( not ( = ?auto_187094 ?auto_187091 ) ) ( ON ?auto_187093 ?auto_187094 ) ( ON ?auto_187092 ?auto_187093 ) ( ON ?auto_187091 ?auto_187092 ) ( ON ?auto_187095 ?auto_187090 ) ( not ( = ?auto_187088 ?auto_187090 ) ) ( not ( = ?auto_187096 ?auto_187090 ) ) ( not ( = ?auto_187094 ?auto_187090 ) ) ( not ( = ?auto_187093 ?auto_187090 ) ) ( not ( = ?auto_187095 ?auto_187090 ) ) ( not ( = ?auto_187089 ?auto_187090 ) ) ( not ( = ?auto_187091 ?auto_187090 ) ) ( not ( = ?auto_187092 ?auto_187090 ) ) ( CLEAR ?auto_187091 ) ( ON ?auto_187089 ?auto_187095 ) ( CLEAR ?auto_187089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187090 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187090 ?auto_187095 )
      ( MAKE-1PILE ?auto_187088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187097 - BLOCK
    )
    :vars
    (
      ?auto_187103 - BLOCK
      ?auto_187100 - BLOCK
      ?auto_187102 - BLOCK
      ?auto_187101 - BLOCK
      ?auto_187104 - BLOCK
      ?auto_187098 - BLOCK
      ?auto_187105 - BLOCK
      ?auto_187099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187103 ?auto_187097 ) ( ON-TABLE ?auto_187097 ) ( not ( = ?auto_187097 ?auto_187103 ) ) ( not ( = ?auto_187097 ?auto_187100 ) ) ( not ( = ?auto_187097 ?auto_187102 ) ) ( not ( = ?auto_187103 ?auto_187100 ) ) ( not ( = ?auto_187103 ?auto_187102 ) ) ( not ( = ?auto_187100 ?auto_187102 ) ) ( ON ?auto_187100 ?auto_187103 ) ( not ( = ?auto_187101 ?auto_187104 ) ) ( not ( = ?auto_187101 ?auto_187098 ) ) ( not ( = ?auto_187101 ?auto_187105 ) ) ( not ( = ?auto_187101 ?auto_187102 ) ) ( not ( = ?auto_187104 ?auto_187098 ) ) ( not ( = ?auto_187104 ?auto_187105 ) ) ( not ( = ?auto_187104 ?auto_187102 ) ) ( not ( = ?auto_187098 ?auto_187105 ) ) ( not ( = ?auto_187098 ?auto_187102 ) ) ( not ( = ?auto_187105 ?auto_187102 ) ) ( not ( = ?auto_187097 ?auto_187105 ) ) ( not ( = ?auto_187097 ?auto_187101 ) ) ( not ( = ?auto_187097 ?auto_187104 ) ) ( not ( = ?auto_187097 ?auto_187098 ) ) ( not ( = ?auto_187103 ?auto_187105 ) ) ( not ( = ?auto_187103 ?auto_187101 ) ) ( not ( = ?auto_187103 ?auto_187104 ) ) ( not ( = ?auto_187103 ?auto_187098 ) ) ( not ( = ?auto_187100 ?auto_187105 ) ) ( not ( = ?auto_187100 ?auto_187101 ) ) ( not ( = ?auto_187100 ?auto_187104 ) ) ( not ( = ?auto_187100 ?auto_187098 ) ) ( ON ?auto_187102 ?auto_187100 ) ( ON ?auto_187105 ?auto_187102 ) ( ON ?auto_187101 ?auto_187099 ) ( not ( = ?auto_187097 ?auto_187099 ) ) ( not ( = ?auto_187103 ?auto_187099 ) ) ( not ( = ?auto_187100 ?auto_187099 ) ) ( not ( = ?auto_187102 ?auto_187099 ) ) ( not ( = ?auto_187101 ?auto_187099 ) ) ( not ( = ?auto_187104 ?auto_187099 ) ) ( not ( = ?auto_187098 ?auto_187099 ) ) ( not ( = ?auto_187105 ?auto_187099 ) ) ( ON ?auto_187104 ?auto_187101 ) ( CLEAR ?auto_187104 ) ( ON-TABLE ?auto_187099 ) ( HOLDING ?auto_187098 ) ( CLEAR ?auto_187105 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187097 ?auto_187103 ?auto_187100 ?auto_187102 ?auto_187105 ?auto_187098 )
      ( MAKE-1PILE ?auto_187097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187106 - BLOCK
    )
    :vars
    (
      ?auto_187113 - BLOCK
      ?auto_187107 - BLOCK
      ?auto_187111 - BLOCK
      ?auto_187109 - BLOCK
      ?auto_187110 - BLOCK
      ?auto_187112 - BLOCK
      ?auto_187108 - BLOCK
      ?auto_187114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187113 ?auto_187106 ) ( ON-TABLE ?auto_187106 ) ( not ( = ?auto_187106 ?auto_187113 ) ) ( not ( = ?auto_187106 ?auto_187107 ) ) ( not ( = ?auto_187106 ?auto_187111 ) ) ( not ( = ?auto_187113 ?auto_187107 ) ) ( not ( = ?auto_187113 ?auto_187111 ) ) ( not ( = ?auto_187107 ?auto_187111 ) ) ( ON ?auto_187107 ?auto_187113 ) ( not ( = ?auto_187109 ?auto_187110 ) ) ( not ( = ?auto_187109 ?auto_187112 ) ) ( not ( = ?auto_187109 ?auto_187108 ) ) ( not ( = ?auto_187109 ?auto_187111 ) ) ( not ( = ?auto_187110 ?auto_187112 ) ) ( not ( = ?auto_187110 ?auto_187108 ) ) ( not ( = ?auto_187110 ?auto_187111 ) ) ( not ( = ?auto_187112 ?auto_187108 ) ) ( not ( = ?auto_187112 ?auto_187111 ) ) ( not ( = ?auto_187108 ?auto_187111 ) ) ( not ( = ?auto_187106 ?auto_187108 ) ) ( not ( = ?auto_187106 ?auto_187109 ) ) ( not ( = ?auto_187106 ?auto_187110 ) ) ( not ( = ?auto_187106 ?auto_187112 ) ) ( not ( = ?auto_187113 ?auto_187108 ) ) ( not ( = ?auto_187113 ?auto_187109 ) ) ( not ( = ?auto_187113 ?auto_187110 ) ) ( not ( = ?auto_187113 ?auto_187112 ) ) ( not ( = ?auto_187107 ?auto_187108 ) ) ( not ( = ?auto_187107 ?auto_187109 ) ) ( not ( = ?auto_187107 ?auto_187110 ) ) ( not ( = ?auto_187107 ?auto_187112 ) ) ( ON ?auto_187111 ?auto_187107 ) ( ON ?auto_187108 ?auto_187111 ) ( ON ?auto_187109 ?auto_187114 ) ( not ( = ?auto_187106 ?auto_187114 ) ) ( not ( = ?auto_187113 ?auto_187114 ) ) ( not ( = ?auto_187107 ?auto_187114 ) ) ( not ( = ?auto_187111 ?auto_187114 ) ) ( not ( = ?auto_187109 ?auto_187114 ) ) ( not ( = ?auto_187110 ?auto_187114 ) ) ( not ( = ?auto_187112 ?auto_187114 ) ) ( not ( = ?auto_187108 ?auto_187114 ) ) ( ON ?auto_187110 ?auto_187109 ) ( ON-TABLE ?auto_187114 ) ( CLEAR ?auto_187108 ) ( ON ?auto_187112 ?auto_187110 ) ( CLEAR ?auto_187112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187114 ?auto_187109 ?auto_187110 )
      ( MAKE-1PILE ?auto_187106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187115 - BLOCK
    )
    :vars
    (
      ?auto_187121 - BLOCK
      ?auto_187122 - BLOCK
      ?auto_187116 - BLOCK
      ?auto_187119 - BLOCK
      ?auto_187117 - BLOCK
      ?auto_187120 - BLOCK
      ?auto_187123 - BLOCK
      ?auto_187118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187121 ?auto_187115 ) ( ON-TABLE ?auto_187115 ) ( not ( = ?auto_187115 ?auto_187121 ) ) ( not ( = ?auto_187115 ?auto_187122 ) ) ( not ( = ?auto_187115 ?auto_187116 ) ) ( not ( = ?auto_187121 ?auto_187122 ) ) ( not ( = ?auto_187121 ?auto_187116 ) ) ( not ( = ?auto_187122 ?auto_187116 ) ) ( ON ?auto_187122 ?auto_187121 ) ( not ( = ?auto_187119 ?auto_187117 ) ) ( not ( = ?auto_187119 ?auto_187120 ) ) ( not ( = ?auto_187119 ?auto_187123 ) ) ( not ( = ?auto_187119 ?auto_187116 ) ) ( not ( = ?auto_187117 ?auto_187120 ) ) ( not ( = ?auto_187117 ?auto_187123 ) ) ( not ( = ?auto_187117 ?auto_187116 ) ) ( not ( = ?auto_187120 ?auto_187123 ) ) ( not ( = ?auto_187120 ?auto_187116 ) ) ( not ( = ?auto_187123 ?auto_187116 ) ) ( not ( = ?auto_187115 ?auto_187123 ) ) ( not ( = ?auto_187115 ?auto_187119 ) ) ( not ( = ?auto_187115 ?auto_187117 ) ) ( not ( = ?auto_187115 ?auto_187120 ) ) ( not ( = ?auto_187121 ?auto_187123 ) ) ( not ( = ?auto_187121 ?auto_187119 ) ) ( not ( = ?auto_187121 ?auto_187117 ) ) ( not ( = ?auto_187121 ?auto_187120 ) ) ( not ( = ?auto_187122 ?auto_187123 ) ) ( not ( = ?auto_187122 ?auto_187119 ) ) ( not ( = ?auto_187122 ?auto_187117 ) ) ( not ( = ?auto_187122 ?auto_187120 ) ) ( ON ?auto_187116 ?auto_187122 ) ( ON ?auto_187119 ?auto_187118 ) ( not ( = ?auto_187115 ?auto_187118 ) ) ( not ( = ?auto_187121 ?auto_187118 ) ) ( not ( = ?auto_187122 ?auto_187118 ) ) ( not ( = ?auto_187116 ?auto_187118 ) ) ( not ( = ?auto_187119 ?auto_187118 ) ) ( not ( = ?auto_187117 ?auto_187118 ) ) ( not ( = ?auto_187120 ?auto_187118 ) ) ( not ( = ?auto_187123 ?auto_187118 ) ) ( ON ?auto_187117 ?auto_187119 ) ( ON-TABLE ?auto_187118 ) ( ON ?auto_187120 ?auto_187117 ) ( CLEAR ?auto_187120 ) ( HOLDING ?auto_187123 ) ( CLEAR ?auto_187116 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187115 ?auto_187121 ?auto_187122 ?auto_187116 ?auto_187123 )
      ( MAKE-1PILE ?auto_187115 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187124 - BLOCK
    )
    :vars
    (
      ?auto_187129 - BLOCK
      ?auto_187132 - BLOCK
      ?auto_187130 - BLOCK
      ?auto_187128 - BLOCK
      ?auto_187125 - BLOCK
      ?auto_187131 - BLOCK
      ?auto_187127 - BLOCK
      ?auto_187126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187129 ?auto_187124 ) ( ON-TABLE ?auto_187124 ) ( not ( = ?auto_187124 ?auto_187129 ) ) ( not ( = ?auto_187124 ?auto_187132 ) ) ( not ( = ?auto_187124 ?auto_187130 ) ) ( not ( = ?auto_187129 ?auto_187132 ) ) ( not ( = ?auto_187129 ?auto_187130 ) ) ( not ( = ?auto_187132 ?auto_187130 ) ) ( ON ?auto_187132 ?auto_187129 ) ( not ( = ?auto_187128 ?auto_187125 ) ) ( not ( = ?auto_187128 ?auto_187131 ) ) ( not ( = ?auto_187128 ?auto_187127 ) ) ( not ( = ?auto_187128 ?auto_187130 ) ) ( not ( = ?auto_187125 ?auto_187131 ) ) ( not ( = ?auto_187125 ?auto_187127 ) ) ( not ( = ?auto_187125 ?auto_187130 ) ) ( not ( = ?auto_187131 ?auto_187127 ) ) ( not ( = ?auto_187131 ?auto_187130 ) ) ( not ( = ?auto_187127 ?auto_187130 ) ) ( not ( = ?auto_187124 ?auto_187127 ) ) ( not ( = ?auto_187124 ?auto_187128 ) ) ( not ( = ?auto_187124 ?auto_187125 ) ) ( not ( = ?auto_187124 ?auto_187131 ) ) ( not ( = ?auto_187129 ?auto_187127 ) ) ( not ( = ?auto_187129 ?auto_187128 ) ) ( not ( = ?auto_187129 ?auto_187125 ) ) ( not ( = ?auto_187129 ?auto_187131 ) ) ( not ( = ?auto_187132 ?auto_187127 ) ) ( not ( = ?auto_187132 ?auto_187128 ) ) ( not ( = ?auto_187132 ?auto_187125 ) ) ( not ( = ?auto_187132 ?auto_187131 ) ) ( ON ?auto_187130 ?auto_187132 ) ( ON ?auto_187128 ?auto_187126 ) ( not ( = ?auto_187124 ?auto_187126 ) ) ( not ( = ?auto_187129 ?auto_187126 ) ) ( not ( = ?auto_187132 ?auto_187126 ) ) ( not ( = ?auto_187130 ?auto_187126 ) ) ( not ( = ?auto_187128 ?auto_187126 ) ) ( not ( = ?auto_187125 ?auto_187126 ) ) ( not ( = ?auto_187131 ?auto_187126 ) ) ( not ( = ?auto_187127 ?auto_187126 ) ) ( ON ?auto_187125 ?auto_187128 ) ( ON-TABLE ?auto_187126 ) ( ON ?auto_187131 ?auto_187125 ) ( CLEAR ?auto_187130 ) ( ON ?auto_187127 ?auto_187131 ) ( CLEAR ?auto_187127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187126 ?auto_187128 ?auto_187125 ?auto_187131 )
      ( MAKE-1PILE ?auto_187124 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187133 - BLOCK
    )
    :vars
    (
      ?auto_187137 - BLOCK
      ?auto_187140 - BLOCK
      ?auto_187134 - BLOCK
      ?auto_187138 - BLOCK
      ?auto_187141 - BLOCK
      ?auto_187139 - BLOCK
      ?auto_187136 - BLOCK
      ?auto_187135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187137 ?auto_187133 ) ( ON-TABLE ?auto_187133 ) ( not ( = ?auto_187133 ?auto_187137 ) ) ( not ( = ?auto_187133 ?auto_187140 ) ) ( not ( = ?auto_187133 ?auto_187134 ) ) ( not ( = ?auto_187137 ?auto_187140 ) ) ( not ( = ?auto_187137 ?auto_187134 ) ) ( not ( = ?auto_187140 ?auto_187134 ) ) ( ON ?auto_187140 ?auto_187137 ) ( not ( = ?auto_187138 ?auto_187141 ) ) ( not ( = ?auto_187138 ?auto_187139 ) ) ( not ( = ?auto_187138 ?auto_187136 ) ) ( not ( = ?auto_187138 ?auto_187134 ) ) ( not ( = ?auto_187141 ?auto_187139 ) ) ( not ( = ?auto_187141 ?auto_187136 ) ) ( not ( = ?auto_187141 ?auto_187134 ) ) ( not ( = ?auto_187139 ?auto_187136 ) ) ( not ( = ?auto_187139 ?auto_187134 ) ) ( not ( = ?auto_187136 ?auto_187134 ) ) ( not ( = ?auto_187133 ?auto_187136 ) ) ( not ( = ?auto_187133 ?auto_187138 ) ) ( not ( = ?auto_187133 ?auto_187141 ) ) ( not ( = ?auto_187133 ?auto_187139 ) ) ( not ( = ?auto_187137 ?auto_187136 ) ) ( not ( = ?auto_187137 ?auto_187138 ) ) ( not ( = ?auto_187137 ?auto_187141 ) ) ( not ( = ?auto_187137 ?auto_187139 ) ) ( not ( = ?auto_187140 ?auto_187136 ) ) ( not ( = ?auto_187140 ?auto_187138 ) ) ( not ( = ?auto_187140 ?auto_187141 ) ) ( not ( = ?auto_187140 ?auto_187139 ) ) ( ON ?auto_187138 ?auto_187135 ) ( not ( = ?auto_187133 ?auto_187135 ) ) ( not ( = ?auto_187137 ?auto_187135 ) ) ( not ( = ?auto_187140 ?auto_187135 ) ) ( not ( = ?auto_187134 ?auto_187135 ) ) ( not ( = ?auto_187138 ?auto_187135 ) ) ( not ( = ?auto_187141 ?auto_187135 ) ) ( not ( = ?auto_187139 ?auto_187135 ) ) ( not ( = ?auto_187136 ?auto_187135 ) ) ( ON ?auto_187141 ?auto_187138 ) ( ON-TABLE ?auto_187135 ) ( ON ?auto_187139 ?auto_187141 ) ( ON ?auto_187136 ?auto_187139 ) ( CLEAR ?auto_187136 ) ( HOLDING ?auto_187134 ) ( CLEAR ?auto_187140 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187133 ?auto_187137 ?auto_187140 ?auto_187134 )
      ( MAKE-1PILE ?auto_187133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187142 - BLOCK
    )
    :vars
    (
      ?auto_187144 - BLOCK
      ?auto_187145 - BLOCK
      ?auto_187148 - BLOCK
      ?auto_187150 - BLOCK
      ?auto_187146 - BLOCK
      ?auto_187143 - BLOCK
      ?auto_187149 - BLOCK
      ?auto_187147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187144 ?auto_187142 ) ( ON-TABLE ?auto_187142 ) ( not ( = ?auto_187142 ?auto_187144 ) ) ( not ( = ?auto_187142 ?auto_187145 ) ) ( not ( = ?auto_187142 ?auto_187148 ) ) ( not ( = ?auto_187144 ?auto_187145 ) ) ( not ( = ?auto_187144 ?auto_187148 ) ) ( not ( = ?auto_187145 ?auto_187148 ) ) ( ON ?auto_187145 ?auto_187144 ) ( not ( = ?auto_187150 ?auto_187146 ) ) ( not ( = ?auto_187150 ?auto_187143 ) ) ( not ( = ?auto_187150 ?auto_187149 ) ) ( not ( = ?auto_187150 ?auto_187148 ) ) ( not ( = ?auto_187146 ?auto_187143 ) ) ( not ( = ?auto_187146 ?auto_187149 ) ) ( not ( = ?auto_187146 ?auto_187148 ) ) ( not ( = ?auto_187143 ?auto_187149 ) ) ( not ( = ?auto_187143 ?auto_187148 ) ) ( not ( = ?auto_187149 ?auto_187148 ) ) ( not ( = ?auto_187142 ?auto_187149 ) ) ( not ( = ?auto_187142 ?auto_187150 ) ) ( not ( = ?auto_187142 ?auto_187146 ) ) ( not ( = ?auto_187142 ?auto_187143 ) ) ( not ( = ?auto_187144 ?auto_187149 ) ) ( not ( = ?auto_187144 ?auto_187150 ) ) ( not ( = ?auto_187144 ?auto_187146 ) ) ( not ( = ?auto_187144 ?auto_187143 ) ) ( not ( = ?auto_187145 ?auto_187149 ) ) ( not ( = ?auto_187145 ?auto_187150 ) ) ( not ( = ?auto_187145 ?auto_187146 ) ) ( not ( = ?auto_187145 ?auto_187143 ) ) ( ON ?auto_187150 ?auto_187147 ) ( not ( = ?auto_187142 ?auto_187147 ) ) ( not ( = ?auto_187144 ?auto_187147 ) ) ( not ( = ?auto_187145 ?auto_187147 ) ) ( not ( = ?auto_187148 ?auto_187147 ) ) ( not ( = ?auto_187150 ?auto_187147 ) ) ( not ( = ?auto_187146 ?auto_187147 ) ) ( not ( = ?auto_187143 ?auto_187147 ) ) ( not ( = ?auto_187149 ?auto_187147 ) ) ( ON ?auto_187146 ?auto_187150 ) ( ON-TABLE ?auto_187147 ) ( ON ?auto_187143 ?auto_187146 ) ( ON ?auto_187149 ?auto_187143 ) ( CLEAR ?auto_187145 ) ( ON ?auto_187148 ?auto_187149 ) ( CLEAR ?auto_187148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187147 ?auto_187150 ?auto_187146 ?auto_187143 ?auto_187149 )
      ( MAKE-1PILE ?auto_187142 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187151 - BLOCK
    )
    :vars
    (
      ?auto_187158 - BLOCK
      ?auto_187155 - BLOCK
      ?auto_187154 - BLOCK
      ?auto_187159 - BLOCK
      ?auto_187157 - BLOCK
      ?auto_187152 - BLOCK
      ?auto_187156 - BLOCK
      ?auto_187153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187158 ?auto_187151 ) ( ON-TABLE ?auto_187151 ) ( not ( = ?auto_187151 ?auto_187158 ) ) ( not ( = ?auto_187151 ?auto_187155 ) ) ( not ( = ?auto_187151 ?auto_187154 ) ) ( not ( = ?auto_187158 ?auto_187155 ) ) ( not ( = ?auto_187158 ?auto_187154 ) ) ( not ( = ?auto_187155 ?auto_187154 ) ) ( not ( = ?auto_187159 ?auto_187157 ) ) ( not ( = ?auto_187159 ?auto_187152 ) ) ( not ( = ?auto_187159 ?auto_187156 ) ) ( not ( = ?auto_187159 ?auto_187154 ) ) ( not ( = ?auto_187157 ?auto_187152 ) ) ( not ( = ?auto_187157 ?auto_187156 ) ) ( not ( = ?auto_187157 ?auto_187154 ) ) ( not ( = ?auto_187152 ?auto_187156 ) ) ( not ( = ?auto_187152 ?auto_187154 ) ) ( not ( = ?auto_187156 ?auto_187154 ) ) ( not ( = ?auto_187151 ?auto_187156 ) ) ( not ( = ?auto_187151 ?auto_187159 ) ) ( not ( = ?auto_187151 ?auto_187157 ) ) ( not ( = ?auto_187151 ?auto_187152 ) ) ( not ( = ?auto_187158 ?auto_187156 ) ) ( not ( = ?auto_187158 ?auto_187159 ) ) ( not ( = ?auto_187158 ?auto_187157 ) ) ( not ( = ?auto_187158 ?auto_187152 ) ) ( not ( = ?auto_187155 ?auto_187156 ) ) ( not ( = ?auto_187155 ?auto_187159 ) ) ( not ( = ?auto_187155 ?auto_187157 ) ) ( not ( = ?auto_187155 ?auto_187152 ) ) ( ON ?auto_187159 ?auto_187153 ) ( not ( = ?auto_187151 ?auto_187153 ) ) ( not ( = ?auto_187158 ?auto_187153 ) ) ( not ( = ?auto_187155 ?auto_187153 ) ) ( not ( = ?auto_187154 ?auto_187153 ) ) ( not ( = ?auto_187159 ?auto_187153 ) ) ( not ( = ?auto_187157 ?auto_187153 ) ) ( not ( = ?auto_187152 ?auto_187153 ) ) ( not ( = ?auto_187156 ?auto_187153 ) ) ( ON ?auto_187157 ?auto_187159 ) ( ON-TABLE ?auto_187153 ) ( ON ?auto_187152 ?auto_187157 ) ( ON ?auto_187156 ?auto_187152 ) ( ON ?auto_187154 ?auto_187156 ) ( CLEAR ?auto_187154 ) ( HOLDING ?auto_187155 ) ( CLEAR ?auto_187158 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187151 ?auto_187158 ?auto_187155 )
      ( MAKE-1PILE ?auto_187151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187160 - BLOCK
    )
    :vars
    (
      ?auto_187162 - BLOCK
      ?auto_187164 - BLOCK
      ?auto_187161 - BLOCK
      ?auto_187166 - BLOCK
      ?auto_187168 - BLOCK
      ?auto_187167 - BLOCK
      ?auto_187165 - BLOCK
      ?auto_187163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187162 ?auto_187160 ) ( ON-TABLE ?auto_187160 ) ( not ( = ?auto_187160 ?auto_187162 ) ) ( not ( = ?auto_187160 ?auto_187164 ) ) ( not ( = ?auto_187160 ?auto_187161 ) ) ( not ( = ?auto_187162 ?auto_187164 ) ) ( not ( = ?auto_187162 ?auto_187161 ) ) ( not ( = ?auto_187164 ?auto_187161 ) ) ( not ( = ?auto_187166 ?auto_187168 ) ) ( not ( = ?auto_187166 ?auto_187167 ) ) ( not ( = ?auto_187166 ?auto_187165 ) ) ( not ( = ?auto_187166 ?auto_187161 ) ) ( not ( = ?auto_187168 ?auto_187167 ) ) ( not ( = ?auto_187168 ?auto_187165 ) ) ( not ( = ?auto_187168 ?auto_187161 ) ) ( not ( = ?auto_187167 ?auto_187165 ) ) ( not ( = ?auto_187167 ?auto_187161 ) ) ( not ( = ?auto_187165 ?auto_187161 ) ) ( not ( = ?auto_187160 ?auto_187165 ) ) ( not ( = ?auto_187160 ?auto_187166 ) ) ( not ( = ?auto_187160 ?auto_187168 ) ) ( not ( = ?auto_187160 ?auto_187167 ) ) ( not ( = ?auto_187162 ?auto_187165 ) ) ( not ( = ?auto_187162 ?auto_187166 ) ) ( not ( = ?auto_187162 ?auto_187168 ) ) ( not ( = ?auto_187162 ?auto_187167 ) ) ( not ( = ?auto_187164 ?auto_187165 ) ) ( not ( = ?auto_187164 ?auto_187166 ) ) ( not ( = ?auto_187164 ?auto_187168 ) ) ( not ( = ?auto_187164 ?auto_187167 ) ) ( ON ?auto_187166 ?auto_187163 ) ( not ( = ?auto_187160 ?auto_187163 ) ) ( not ( = ?auto_187162 ?auto_187163 ) ) ( not ( = ?auto_187164 ?auto_187163 ) ) ( not ( = ?auto_187161 ?auto_187163 ) ) ( not ( = ?auto_187166 ?auto_187163 ) ) ( not ( = ?auto_187168 ?auto_187163 ) ) ( not ( = ?auto_187167 ?auto_187163 ) ) ( not ( = ?auto_187165 ?auto_187163 ) ) ( ON ?auto_187168 ?auto_187166 ) ( ON-TABLE ?auto_187163 ) ( ON ?auto_187167 ?auto_187168 ) ( ON ?auto_187165 ?auto_187167 ) ( ON ?auto_187161 ?auto_187165 ) ( CLEAR ?auto_187162 ) ( ON ?auto_187164 ?auto_187161 ) ( CLEAR ?auto_187164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187163 ?auto_187166 ?auto_187168 ?auto_187167 ?auto_187165 ?auto_187161 )
      ( MAKE-1PILE ?auto_187160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187187 - BLOCK
    )
    :vars
    (
      ?auto_187190 - BLOCK
      ?auto_187189 - BLOCK
      ?auto_187193 - BLOCK
      ?auto_187195 - BLOCK
      ?auto_187191 - BLOCK
      ?auto_187194 - BLOCK
      ?auto_187188 - BLOCK
      ?auto_187192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187187 ?auto_187190 ) ) ( not ( = ?auto_187187 ?auto_187189 ) ) ( not ( = ?auto_187187 ?auto_187193 ) ) ( not ( = ?auto_187190 ?auto_187189 ) ) ( not ( = ?auto_187190 ?auto_187193 ) ) ( not ( = ?auto_187189 ?auto_187193 ) ) ( not ( = ?auto_187195 ?auto_187191 ) ) ( not ( = ?auto_187195 ?auto_187194 ) ) ( not ( = ?auto_187195 ?auto_187188 ) ) ( not ( = ?auto_187195 ?auto_187193 ) ) ( not ( = ?auto_187191 ?auto_187194 ) ) ( not ( = ?auto_187191 ?auto_187188 ) ) ( not ( = ?auto_187191 ?auto_187193 ) ) ( not ( = ?auto_187194 ?auto_187188 ) ) ( not ( = ?auto_187194 ?auto_187193 ) ) ( not ( = ?auto_187188 ?auto_187193 ) ) ( not ( = ?auto_187187 ?auto_187188 ) ) ( not ( = ?auto_187187 ?auto_187195 ) ) ( not ( = ?auto_187187 ?auto_187191 ) ) ( not ( = ?auto_187187 ?auto_187194 ) ) ( not ( = ?auto_187190 ?auto_187188 ) ) ( not ( = ?auto_187190 ?auto_187195 ) ) ( not ( = ?auto_187190 ?auto_187191 ) ) ( not ( = ?auto_187190 ?auto_187194 ) ) ( not ( = ?auto_187189 ?auto_187188 ) ) ( not ( = ?auto_187189 ?auto_187195 ) ) ( not ( = ?auto_187189 ?auto_187191 ) ) ( not ( = ?auto_187189 ?auto_187194 ) ) ( ON ?auto_187195 ?auto_187192 ) ( not ( = ?auto_187187 ?auto_187192 ) ) ( not ( = ?auto_187190 ?auto_187192 ) ) ( not ( = ?auto_187189 ?auto_187192 ) ) ( not ( = ?auto_187193 ?auto_187192 ) ) ( not ( = ?auto_187195 ?auto_187192 ) ) ( not ( = ?auto_187191 ?auto_187192 ) ) ( not ( = ?auto_187194 ?auto_187192 ) ) ( not ( = ?auto_187188 ?auto_187192 ) ) ( ON ?auto_187191 ?auto_187195 ) ( ON-TABLE ?auto_187192 ) ( ON ?auto_187194 ?auto_187191 ) ( ON ?auto_187188 ?auto_187194 ) ( ON ?auto_187193 ?auto_187188 ) ( ON ?auto_187189 ?auto_187193 ) ( ON ?auto_187190 ?auto_187189 ) ( CLEAR ?auto_187190 ) ( HOLDING ?auto_187187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187187 ?auto_187190 )
      ( MAKE-1PILE ?auto_187187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187196 - BLOCK
    )
    :vars
    (
      ?auto_187203 - BLOCK
      ?auto_187198 - BLOCK
      ?auto_187201 - BLOCK
      ?auto_187204 - BLOCK
      ?auto_187197 - BLOCK
      ?auto_187202 - BLOCK
      ?auto_187200 - BLOCK
      ?auto_187199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187196 ?auto_187203 ) ) ( not ( = ?auto_187196 ?auto_187198 ) ) ( not ( = ?auto_187196 ?auto_187201 ) ) ( not ( = ?auto_187203 ?auto_187198 ) ) ( not ( = ?auto_187203 ?auto_187201 ) ) ( not ( = ?auto_187198 ?auto_187201 ) ) ( not ( = ?auto_187204 ?auto_187197 ) ) ( not ( = ?auto_187204 ?auto_187202 ) ) ( not ( = ?auto_187204 ?auto_187200 ) ) ( not ( = ?auto_187204 ?auto_187201 ) ) ( not ( = ?auto_187197 ?auto_187202 ) ) ( not ( = ?auto_187197 ?auto_187200 ) ) ( not ( = ?auto_187197 ?auto_187201 ) ) ( not ( = ?auto_187202 ?auto_187200 ) ) ( not ( = ?auto_187202 ?auto_187201 ) ) ( not ( = ?auto_187200 ?auto_187201 ) ) ( not ( = ?auto_187196 ?auto_187200 ) ) ( not ( = ?auto_187196 ?auto_187204 ) ) ( not ( = ?auto_187196 ?auto_187197 ) ) ( not ( = ?auto_187196 ?auto_187202 ) ) ( not ( = ?auto_187203 ?auto_187200 ) ) ( not ( = ?auto_187203 ?auto_187204 ) ) ( not ( = ?auto_187203 ?auto_187197 ) ) ( not ( = ?auto_187203 ?auto_187202 ) ) ( not ( = ?auto_187198 ?auto_187200 ) ) ( not ( = ?auto_187198 ?auto_187204 ) ) ( not ( = ?auto_187198 ?auto_187197 ) ) ( not ( = ?auto_187198 ?auto_187202 ) ) ( ON ?auto_187204 ?auto_187199 ) ( not ( = ?auto_187196 ?auto_187199 ) ) ( not ( = ?auto_187203 ?auto_187199 ) ) ( not ( = ?auto_187198 ?auto_187199 ) ) ( not ( = ?auto_187201 ?auto_187199 ) ) ( not ( = ?auto_187204 ?auto_187199 ) ) ( not ( = ?auto_187197 ?auto_187199 ) ) ( not ( = ?auto_187202 ?auto_187199 ) ) ( not ( = ?auto_187200 ?auto_187199 ) ) ( ON ?auto_187197 ?auto_187204 ) ( ON-TABLE ?auto_187199 ) ( ON ?auto_187202 ?auto_187197 ) ( ON ?auto_187200 ?auto_187202 ) ( ON ?auto_187201 ?auto_187200 ) ( ON ?auto_187198 ?auto_187201 ) ( ON ?auto_187203 ?auto_187198 ) ( ON ?auto_187196 ?auto_187203 ) ( CLEAR ?auto_187196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187199 ?auto_187204 ?auto_187197 ?auto_187202 ?auto_187200 ?auto_187201 ?auto_187198 ?auto_187203 )
      ( MAKE-1PILE ?auto_187196 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187212 - BLOCK
      ?auto_187213 - BLOCK
      ?auto_187214 - BLOCK
      ?auto_187215 - BLOCK
      ?auto_187216 - BLOCK
      ?auto_187217 - BLOCK
      ?auto_187218 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_187218 ) ( CLEAR ?auto_187217 ) ( ON-TABLE ?auto_187212 ) ( ON ?auto_187213 ?auto_187212 ) ( ON ?auto_187214 ?auto_187213 ) ( ON ?auto_187215 ?auto_187214 ) ( ON ?auto_187216 ?auto_187215 ) ( ON ?auto_187217 ?auto_187216 ) ( not ( = ?auto_187212 ?auto_187213 ) ) ( not ( = ?auto_187212 ?auto_187214 ) ) ( not ( = ?auto_187212 ?auto_187215 ) ) ( not ( = ?auto_187212 ?auto_187216 ) ) ( not ( = ?auto_187212 ?auto_187217 ) ) ( not ( = ?auto_187212 ?auto_187218 ) ) ( not ( = ?auto_187213 ?auto_187214 ) ) ( not ( = ?auto_187213 ?auto_187215 ) ) ( not ( = ?auto_187213 ?auto_187216 ) ) ( not ( = ?auto_187213 ?auto_187217 ) ) ( not ( = ?auto_187213 ?auto_187218 ) ) ( not ( = ?auto_187214 ?auto_187215 ) ) ( not ( = ?auto_187214 ?auto_187216 ) ) ( not ( = ?auto_187214 ?auto_187217 ) ) ( not ( = ?auto_187214 ?auto_187218 ) ) ( not ( = ?auto_187215 ?auto_187216 ) ) ( not ( = ?auto_187215 ?auto_187217 ) ) ( not ( = ?auto_187215 ?auto_187218 ) ) ( not ( = ?auto_187216 ?auto_187217 ) ) ( not ( = ?auto_187216 ?auto_187218 ) ) ( not ( = ?auto_187217 ?auto_187218 ) ) )
    :subtasks
    ( ( !STACK ?auto_187218 ?auto_187217 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187219 - BLOCK
      ?auto_187220 - BLOCK
      ?auto_187221 - BLOCK
      ?auto_187222 - BLOCK
      ?auto_187223 - BLOCK
      ?auto_187224 - BLOCK
      ?auto_187225 - BLOCK
    )
    :vars
    (
      ?auto_187226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187224 ) ( ON-TABLE ?auto_187219 ) ( ON ?auto_187220 ?auto_187219 ) ( ON ?auto_187221 ?auto_187220 ) ( ON ?auto_187222 ?auto_187221 ) ( ON ?auto_187223 ?auto_187222 ) ( ON ?auto_187224 ?auto_187223 ) ( not ( = ?auto_187219 ?auto_187220 ) ) ( not ( = ?auto_187219 ?auto_187221 ) ) ( not ( = ?auto_187219 ?auto_187222 ) ) ( not ( = ?auto_187219 ?auto_187223 ) ) ( not ( = ?auto_187219 ?auto_187224 ) ) ( not ( = ?auto_187219 ?auto_187225 ) ) ( not ( = ?auto_187220 ?auto_187221 ) ) ( not ( = ?auto_187220 ?auto_187222 ) ) ( not ( = ?auto_187220 ?auto_187223 ) ) ( not ( = ?auto_187220 ?auto_187224 ) ) ( not ( = ?auto_187220 ?auto_187225 ) ) ( not ( = ?auto_187221 ?auto_187222 ) ) ( not ( = ?auto_187221 ?auto_187223 ) ) ( not ( = ?auto_187221 ?auto_187224 ) ) ( not ( = ?auto_187221 ?auto_187225 ) ) ( not ( = ?auto_187222 ?auto_187223 ) ) ( not ( = ?auto_187222 ?auto_187224 ) ) ( not ( = ?auto_187222 ?auto_187225 ) ) ( not ( = ?auto_187223 ?auto_187224 ) ) ( not ( = ?auto_187223 ?auto_187225 ) ) ( not ( = ?auto_187224 ?auto_187225 ) ) ( ON ?auto_187225 ?auto_187226 ) ( CLEAR ?auto_187225 ) ( HAND-EMPTY ) ( not ( = ?auto_187219 ?auto_187226 ) ) ( not ( = ?auto_187220 ?auto_187226 ) ) ( not ( = ?auto_187221 ?auto_187226 ) ) ( not ( = ?auto_187222 ?auto_187226 ) ) ( not ( = ?auto_187223 ?auto_187226 ) ) ( not ( = ?auto_187224 ?auto_187226 ) ) ( not ( = ?auto_187225 ?auto_187226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187225 ?auto_187226 )
      ( MAKE-7PILE ?auto_187219 ?auto_187220 ?auto_187221 ?auto_187222 ?auto_187223 ?auto_187224 ?auto_187225 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187227 - BLOCK
      ?auto_187228 - BLOCK
      ?auto_187229 - BLOCK
      ?auto_187230 - BLOCK
      ?auto_187231 - BLOCK
      ?auto_187232 - BLOCK
      ?auto_187233 - BLOCK
    )
    :vars
    (
      ?auto_187234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187227 ) ( ON ?auto_187228 ?auto_187227 ) ( ON ?auto_187229 ?auto_187228 ) ( ON ?auto_187230 ?auto_187229 ) ( ON ?auto_187231 ?auto_187230 ) ( not ( = ?auto_187227 ?auto_187228 ) ) ( not ( = ?auto_187227 ?auto_187229 ) ) ( not ( = ?auto_187227 ?auto_187230 ) ) ( not ( = ?auto_187227 ?auto_187231 ) ) ( not ( = ?auto_187227 ?auto_187232 ) ) ( not ( = ?auto_187227 ?auto_187233 ) ) ( not ( = ?auto_187228 ?auto_187229 ) ) ( not ( = ?auto_187228 ?auto_187230 ) ) ( not ( = ?auto_187228 ?auto_187231 ) ) ( not ( = ?auto_187228 ?auto_187232 ) ) ( not ( = ?auto_187228 ?auto_187233 ) ) ( not ( = ?auto_187229 ?auto_187230 ) ) ( not ( = ?auto_187229 ?auto_187231 ) ) ( not ( = ?auto_187229 ?auto_187232 ) ) ( not ( = ?auto_187229 ?auto_187233 ) ) ( not ( = ?auto_187230 ?auto_187231 ) ) ( not ( = ?auto_187230 ?auto_187232 ) ) ( not ( = ?auto_187230 ?auto_187233 ) ) ( not ( = ?auto_187231 ?auto_187232 ) ) ( not ( = ?auto_187231 ?auto_187233 ) ) ( not ( = ?auto_187232 ?auto_187233 ) ) ( ON ?auto_187233 ?auto_187234 ) ( CLEAR ?auto_187233 ) ( not ( = ?auto_187227 ?auto_187234 ) ) ( not ( = ?auto_187228 ?auto_187234 ) ) ( not ( = ?auto_187229 ?auto_187234 ) ) ( not ( = ?auto_187230 ?auto_187234 ) ) ( not ( = ?auto_187231 ?auto_187234 ) ) ( not ( = ?auto_187232 ?auto_187234 ) ) ( not ( = ?auto_187233 ?auto_187234 ) ) ( HOLDING ?auto_187232 ) ( CLEAR ?auto_187231 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187227 ?auto_187228 ?auto_187229 ?auto_187230 ?auto_187231 ?auto_187232 )
      ( MAKE-7PILE ?auto_187227 ?auto_187228 ?auto_187229 ?auto_187230 ?auto_187231 ?auto_187232 ?auto_187233 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187235 - BLOCK
      ?auto_187236 - BLOCK
      ?auto_187237 - BLOCK
      ?auto_187238 - BLOCK
      ?auto_187239 - BLOCK
      ?auto_187240 - BLOCK
      ?auto_187241 - BLOCK
    )
    :vars
    (
      ?auto_187242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187235 ) ( ON ?auto_187236 ?auto_187235 ) ( ON ?auto_187237 ?auto_187236 ) ( ON ?auto_187238 ?auto_187237 ) ( ON ?auto_187239 ?auto_187238 ) ( not ( = ?auto_187235 ?auto_187236 ) ) ( not ( = ?auto_187235 ?auto_187237 ) ) ( not ( = ?auto_187235 ?auto_187238 ) ) ( not ( = ?auto_187235 ?auto_187239 ) ) ( not ( = ?auto_187235 ?auto_187240 ) ) ( not ( = ?auto_187235 ?auto_187241 ) ) ( not ( = ?auto_187236 ?auto_187237 ) ) ( not ( = ?auto_187236 ?auto_187238 ) ) ( not ( = ?auto_187236 ?auto_187239 ) ) ( not ( = ?auto_187236 ?auto_187240 ) ) ( not ( = ?auto_187236 ?auto_187241 ) ) ( not ( = ?auto_187237 ?auto_187238 ) ) ( not ( = ?auto_187237 ?auto_187239 ) ) ( not ( = ?auto_187237 ?auto_187240 ) ) ( not ( = ?auto_187237 ?auto_187241 ) ) ( not ( = ?auto_187238 ?auto_187239 ) ) ( not ( = ?auto_187238 ?auto_187240 ) ) ( not ( = ?auto_187238 ?auto_187241 ) ) ( not ( = ?auto_187239 ?auto_187240 ) ) ( not ( = ?auto_187239 ?auto_187241 ) ) ( not ( = ?auto_187240 ?auto_187241 ) ) ( ON ?auto_187241 ?auto_187242 ) ( not ( = ?auto_187235 ?auto_187242 ) ) ( not ( = ?auto_187236 ?auto_187242 ) ) ( not ( = ?auto_187237 ?auto_187242 ) ) ( not ( = ?auto_187238 ?auto_187242 ) ) ( not ( = ?auto_187239 ?auto_187242 ) ) ( not ( = ?auto_187240 ?auto_187242 ) ) ( not ( = ?auto_187241 ?auto_187242 ) ) ( CLEAR ?auto_187239 ) ( ON ?auto_187240 ?auto_187241 ) ( CLEAR ?auto_187240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187242 ?auto_187241 )
      ( MAKE-7PILE ?auto_187235 ?auto_187236 ?auto_187237 ?auto_187238 ?auto_187239 ?auto_187240 ?auto_187241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187243 - BLOCK
      ?auto_187244 - BLOCK
      ?auto_187245 - BLOCK
      ?auto_187246 - BLOCK
      ?auto_187247 - BLOCK
      ?auto_187248 - BLOCK
      ?auto_187249 - BLOCK
    )
    :vars
    (
      ?auto_187250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187243 ) ( ON ?auto_187244 ?auto_187243 ) ( ON ?auto_187245 ?auto_187244 ) ( ON ?auto_187246 ?auto_187245 ) ( not ( = ?auto_187243 ?auto_187244 ) ) ( not ( = ?auto_187243 ?auto_187245 ) ) ( not ( = ?auto_187243 ?auto_187246 ) ) ( not ( = ?auto_187243 ?auto_187247 ) ) ( not ( = ?auto_187243 ?auto_187248 ) ) ( not ( = ?auto_187243 ?auto_187249 ) ) ( not ( = ?auto_187244 ?auto_187245 ) ) ( not ( = ?auto_187244 ?auto_187246 ) ) ( not ( = ?auto_187244 ?auto_187247 ) ) ( not ( = ?auto_187244 ?auto_187248 ) ) ( not ( = ?auto_187244 ?auto_187249 ) ) ( not ( = ?auto_187245 ?auto_187246 ) ) ( not ( = ?auto_187245 ?auto_187247 ) ) ( not ( = ?auto_187245 ?auto_187248 ) ) ( not ( = ?auto_187245 ?auto_187249 ) ) ( not ( = ?auto_187246 ?auto_187247 ) ) ( not ( = ?auto_187246 ?auto_187248 ) ) ( not ( = ?auto_187246 ?auto_187249 ) ) ( not ( = ?auto_187247 ?auto_187248 ) ) ( not ( = ?auto_187247 ?auto_187249 ) ) ( not ( = ?auto_187248 ?auto_187249 ) ) ( ON ?auto_187249 ?auto_187250 ) ( not ( = ?auto_187243 ?auto_187250 ) ) ( not ( = ?auto_187244 ?auto_187250 ) ) ( not ( = ?auto_187245 ?auto_187250 ) ) ( not ( = ?auto_187246 ?auto_187250 ) ) ( not ( = ?auto_187247 ?auto_187250 ) ) ( not ( = ?auto_187248 ?auto_187250 ) ) ( not ( = ?auto_187249 ?auto_187250 ) ) ( ON ?auto_187248 ?auto_187249 ) ( CLEAR ?auto_187248 ) ( ON-TABLE ?auto_187250 ) ( HOLDING ?auto_187247 ) ( CLEAR ?auto_187246 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187243 ?auto_187244 ?auto_187245 ?auto_187246 ?auto_187247 )
      ( MAKE-7PILE ?auto_187243 ?auto_187244 ?auto_187245 ?auto_187246 ?auto_187247 ?auto_187248 ?auto_187249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187251 - BLOCK
      ?auto_187252 - BLOCK
      ?auto_187253 - BLOCK
      ?auto_187254 - BLOCK
      ?auto_187255 - BLOCK
      ?auto_187256 - BLOCK
      ?auto_187257 - BLOCK
    )
    :vars
    (
      ?auto_187258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187251 ) ( ON ?auto_187252 ?auto_187251 ) ( ON ?auto_187253 ?auto_187252 ) ( ON ?auto_187254 ?auto_187253 ) ( not ( = ?auto_187251 ?auto_187252 ) ) ( not ( = ?auto_187251 ?auto_187253 ) ) ( not ( = ?auto_187251 ?auto_187254 ) ) ( not ( = ?auto_187251 ?auto_187255 ) ) ( not ( = ?auto_187251 ?auto_187256 ) ) ( not ( = ?auto_187251 ?auto_187257 ) ) ( not ( = ?auto_187252 ?auto_187253 ) ) ( not ( = ?auto_187252 ?auto_187254 ) ) ( not ( = ?auto_187252 ?auto_187255 ) ) ( not ( = ?auto_187252 ?auto_187256 ) ) ( not ( = ?auto_187252 ?auto_187257 ) ) ( not ( = ?auto_187253 ?auto_187254 ) ) ( not ( = ?auto_187253 ?auto_187255 ) ) ( not ( = ?auto_187253 ?auto_187256 ) ) ( not ( = ?auto_187253 ?auto_187257 ) ) ( not ( = ?auto_187254 ?auto_187255 ) ) ( not ( = ?auto_187254 ?auto_187256 ) ) ( not ( = ?auto_187254 ?auto_187257 ) ) ( not ( = ?auto_187255 ?auto_187256 ) ) ( not ( = ?auto_187255 ?auto_187257 ) ) ( not ( = ?auto_187256 ?auto_187257 ) ) ( ON ?auto_187257 ?auto_187258 ) ( not ( = ?auto_187251 ?auto_187258 ) ) ( not ( = ?auto_187252 ?auto_187258 ) ) ( not ( = ?auto_187253 ?auto_187258 ) ) ( not ( = ?auto_187254 ?auto_187258 ) ) ( not ( = ?auto_187255 ?auto_187258 ) ) ( not ( = ?auto_187256 ?auto_187258 ) ) ( not ( = ?auto_187257 ?auto_187258 ) ) ( ON ?auto_187256 ?auto_187257 ) ( ON-TABLE ?auto_187258 ) ( CLEAR ?auto_187254 ) ( ON ?auto_187255 ?auto_187256 ) ( CLEAR ?auto_187255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187258 ?auto_187257 ?auto_187256 )
      ( MAKE-7PILE ?auto_187251 ?auto_187252 ?auto_187253 ?auto_187254 ?auto_187255 ?auto_187256 ?auto_187257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187259 - BLOCK
      ?auto_187260 - BLOCK
      ?auto_187261 - BLOCK
      ?auto_187262 - BLOCK
      ?auto_187263 - BLOCK
      ?auto_187264 - BLOCK
      ?auto_187265 - BLOCK
    )
    :vars
    (
      ?auto_187266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187259 ) ( ON ?auto_187260 ?auto_187259 ) ( ON ?auto_187261 ?auto_187260 ) ( not ( = ?auto_187259 ?auto_187260 ) ) ( not ( = ?auto_187259 ?auto_187261 ) ) ( not ( = ?auto_187259 ?auto_187262 ) ) ( not ( = ?auto_187259 ?auto_187263 ) ) ( not ( = ?auto_187259 ?auto_187264 ) ) ( not ( = ?auto_187259 ?auto_187265 ) ) ( not ( = ?auto_187260 ?auto_187261 ) ) ( not ( = ?auto_187260 ?auto_187262 ) ) ( not ( = ?auto_187260 ?auto_187263 ) ) ( not ( = ?auto_187260 ?auto_187264 ) ) ( not ( = ?auto_187260 ?auto_187265 ) ) ( not ( = ?auto_187261 ?auto_187262 ) ) ( not ( = ?auto_187261 ?auto_187263 ) ) ( not ( = ?auto_187261 ?auto_187264 ) ) ( not ( = ?auto_187261 ?auto_187265 ) ) ( not ( = ?auto_187262 ?auto_187263 ) ) ( not ( = ?auto_187262 ?auto_187264 ) ) ( not ( = ?auto_187262 ?auto_187265 ) ) ( not ( = ?auto_187263 ?auto_187264 ) ) ( not ( = ?auto_187263 ?auto_187265 ) ) ( not ( = ?auto_187264 ?auto_187265 ) ) ( ON ?auto_187265 ?auto_187266 ) ( not ( = ?auto_187259 ?auto_187266 ) ) ( not ( = ?auto_187260 ?auto_187266 ) ) ( not ( = ?auto_187261 ?auto_187266 ) ) ( not ( = ?auto_187262 ?auto_187266 ) ) ( not ( = ?auto_187263 ?auto_187266 ) ) ( not ( = ?auto_187264 ?auto_187266 ) ) ( not ( = ?auto_187265 ?auto_187266 ) ) ( ON ?auto_187264 ?auto_187265 ) ( ON-TABLE ?auto_187266 ) ( ON ?auto_187263 ?auto_187264 ) ( CLEAR ?auto_187263 ) ( HOLDING ?auto_187262 ) ( CLEAR ?auto_187261 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187259 ?auto_187260 ?auto_187261 ?auto_187262 )
      ( MAKE-7PILE ?auto_187259 ?auto_187260 ?auto_187261 ?auto_187262 ?auto_187263 ?auto_187264 ?auto_187265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187267 - BLOCK
      ?auto_187268 - BLOCK
      ?auto_187269 - BLOCK
      ?auto_187270 - BLOCK
      ?auto_187271 - BLOCK
      ?auto_187272 - BLOCK
      ?auto_187273 - BLOCK
    )
    :vars
    (
      ?auto_187274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187267 ) ( ON ?auto_187268 ?auto_187267 ) ( ON ?auto_187269 ?auto_187268 ) ( not ( = ?auto_187267 ?auto_187268 ) ) ( not ( = ?auto_187267 ?auto_187269 ) ) ( not ( = ?auto_187267 ?auto_187270 ) ) ( not ( = ?auto_187267 ?auto_187271 ) ) ( not ( = ?auto_187267 ?auto_187272 ) ) ( not ( = ?auto_187267 ?auto_187273 ) ) ( not ( = ?auto_187268 ?auto_187269 ) ) ( not ( = ?auto_187268 ?auto_187270 ) ) ( not ( = ?auto_187268 ?auto_187271 ) ) ( not ( = ?auto_187268 ?auto_187272 ) ) ( not ( = ?auto_187268 ?auto_187273 ) ) ( not ( = ?auto_187269 ?auto_187270 ) ) ( not ( = ?auto_187269 ?auto_187271 ) ) ( not ( = ?auto_187269 ?auto_187272 ) ) ( not ( = ?auto_187269 ?auto_187273 ) ) ( not ( = ?auto_187270 ?auto_187271 ) ) ( not ( = ?auto_187270 ?auto_187272 ) ) ( not ( = ?auto_187270 ?auto_187273 ) ) ( not ( = ?auto_187271 ?auto_187272 ) ) ( not ( = ?auto_187271 ?auto_187273 ) ) ( not ( = ?auto_187272 ?auto_187273 ) ) ( ON ?auto_187273 ?auto_187274 ) ( not ( = ?auto_187267 ?auto_187274 ) ) ( not ( = ?auto_187268 ?auto_187274 ) ) ( not ( = ?auto_187269 ?auto_187274 ) ) ( not ( = ?auto_187270 ?auto_187274 ) ) ( not ( = ?auto_187271 ?auto_187274 ) ) ( not ( = ?auto_187272 ?auto_187274 ) ) ( not ( = ?auto_187273 ?auto_187274 ) ) ( ON ?auto_187272 ?auto_187273 ) ( ON-TABLE ?auto_187274 ) ( ON ?auto_187271 ?auto_187272 ) ( CLEAR ?auto_187269 ) ( ON ?auto_187270 ?auto_187271 ) ( CLEAR ?auto_187270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187274 ?auto_187273 ?auto_187272 ?auto_187271 )
      ( MAKE-7PILE ?auto_187267 ?auto_187268 ?auto_187269 ?auto_187270 ?auto_187271 ?auto_187272 ?auto_187273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187275 - BLOCK
      ?auto_187276 - BLOCK
      ?auto_187277 - BLOCK
      ?auto_187278 - BLOCK
      ?auto_187279 - BLOCK
      ?auto_187280 - BLOCK
      ?auto_187281 - BLOCK
    )
    :vars
    (
      ?auto_187282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187275 ) ( ON ?auto_187276 ?auto_187275 ) ( not ( = ?auto_187275 ?auto_187276 ) ) ( not ( = ?auto_187275 ?auto_187277 ) ) ( not ( = ?auto_187275 ?auto_187278 ) ) ( not ( = ?auto_187275 ?auto_187279 ) ) ( not ( = ?auto_187275 ?auto_187280 ) ) ( not ( = ?auto_187275 ?auto_187281 ) ) ( not ( = ?auto_187276 ?auto_187277 ) ) ( not ( = ?auto_187276 ?auto_187278 ) ) ( not ( = ?auto_187276 ?auto_187279 ) ) ( not ( = ?auto_187276 ?auto_187280 ) ) ( not ( = ?auto_187276 ?auto_187281 ) ) ( not ( = ?auto_187277 ?auto_187278 ) ) ( not ( = ?auto_187277 ?auto_187279 ) ) ( not ( = ?auto_187277 ?auto_187280 ) ) ( not ( = ?auto_187277 ?auto_187281 ) ) ( not ( = ?auto_187278 ?auto_187279 ) ) ( not ( = ?auto_187278 ?auto_187280 ) ) ( not ( = ?auto_187278 ?auto_187281 ) ) ( not ( = ?auto_187279 ?auto_187280 ) ) ( not ( = ?auto_187279 ?auto_187281 ) ) ( not ( = ?auto_187280 ?auto_187281 ) ) ( ON ?auto_187281 ?auto_187282 ) ( not ( = ?auto_187275 ?auto_187282 ) ) ( not ( = ?auto_187276 ?auto_187282 ) ) ( not ( = ?auto_187277 ?auto_187282 ) ) ( not ( = ?auto_187278 ?auto_187282 ) ) ( not ( = ?auto_187279 ?auto_187282 ) ) ( not ( = ?auto_187280 ?auto_187282 ) ) ( not ( = ?auto_187281 ?auto_187282 ) ) ( ON ?auto_187280 ?auto_187281 ) ( ON-TABLE ?auto_187282 ) ( ON ?auto_187279 ?auto_187280 ) ( ON ?auto_187278 ?auto_187279 ) ( CLEAR ?auto_187278 ) ( HOLDING ?auto_187277 ) ( CLEAR ?auto_187276 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187275 ?auto_187276 ?auto_187277 )
      ( MAKE-7PILE ?auto_187275 ?auto_187276 ?auto_187277 ?auto_187278 ?auto_187279 ?auto_187280 ?auto_187281 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187283 - BLOCK
      ?auto_187284 - BLOCK
      ?auto_187285 - BLOCK
      ?auto_187286 - BLOCK
      ?auto_187287 - BLOCK
      ?auto_187288 - BLOCK
      ?auto_187289 - BLOCK
    )
    :vars
    (
      ?auto_187290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187283 ) ( ON ?auto_187284 ?auto_187283 ) ( not ( = ?auto_187283 ?auto_187284 ) ) ( not ( = ?auto_187283 ?auto_187285 ) ) ( not ( = ?auto_187283 ?auto_187286 ) ) ( not ( = ?auto_187283 ?auto_187287 ) ) ( not ( = ?auto_187283 ?auto_187288 ) ) ( not ( = ?auto_187283 ?auto_187289 ) ) ( not ( = ?auto_187284 ?auto_187285 ) ) ( not ( = ?auto_187284 ?auto_187286 ) ) ( not ( = ?auto_187284 ?auto_187287 ) ) ( not ( = ?auto_187284 ?auto_187288 ) ) ( not ( = ?auto_187284 ?auto_187289 ) ) ( not ( = ?auto_187285 ?auto_187286 ) ) ( not ( = ?auto_187285 ?auto_187287 ) ) ( not ( = ?auto_187285 ?auto_187288 ) ) ( not ( = ?auto_187285 ?auto_187289 ) ) ( not ( = ?auto_187286 ?auto_187287 ) ) ( not ( = ?auto_187286 ?auto_187288 ) ) ( not ( = ?auto_187286 ?auto_187289 ) ) ( not ( = ?auto_187287 ?auto_187288 ) ) ( not ( = ?auto_187287 ?auto_187289 ) ) ( not ( = ?auto_187288 ?auto_187289 ) ) ( ON ?auto_187289 ?auto_187290 ) ( not ( = ?auto_187283 ?auto_187290 ) ) ( not ( = ?auto_187284 ?auto_187290 ) ) ( not ( = ?auto_187285 ?auto_187290 ) ) ( not ( = ?auto_187286 ?auto_187290 ) ) ( not ( = ?auto_187287 ?auto_187290 ) ) ( not ( = ?auto_187288 ?auto_187290 ) ) ( not ( = ?auto_187289 ?auto_187290 ) ) ( ON ?auto_187288 ?auto_187289 ) ( ON-TABLE ?auto_187290 ) ( ON ?auto_187287 ?auto_187288 ) ( ON ?auto_187286 ?auto_187287 ) ( CLEAR ?auto_187284 ) ( ON ?auto_187285 ?auto_187286 ) ( CLEAR ?auto_187285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187290 ?auto_187289 ?auto_187288 ?auto_187287 ?auto_187286 )
      ( MAKE-7PILE ?auto_187283 ?auto_187284 ?auto_187285 ?auto_187286 ?auto_187287 ?auto_187288 ?auto_187289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187291 - BLOCK
      ?auto_187292 - BLOCK
      ?auto_187293 - BLOCK
      ?auto_187294 - BLOCK
      ?auto_187295 - BLOCK
      ?auto_187296 - BLOCK
      ?auto_187297 - BLOCK
    )
    :vars
    (
      ?auto_187298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187291 ) ( not ( = ?auto_187291 ?auto_187292 ) ) ( not ( = ?auto_187291 ?auto_187293 ) ) ( not ( = ?auto_187291 ?auto_187294 ) ) ( not ( = ?auto_187291 ?auto_187295 ) ) ( not ( = ?auto_187291 ?auto_187296 ) ) ( not ( = ?auto_187291 ?auto_187297 ) ) ( not ( = ?auto_187292 ?auto_187293 ) ) ( not ( = ?auto_187292 ?auto_187294 ) ) ( not ( = ?auto_187292 ?auto_187295 ) ) ( not ( = ?auto_187292 ?auto_187296 ) ) ( not ( = ?auto_187292 ?auto_187297 ) ) ( not ( = ?auto_187293 ?auto_187294 ) ) ( not ( = ?auto_187293 ?auto_187295 ) ) ( not ( = ?auto_187293 ?auto_187296 ) ) ( not ( = ?auto_187293 ?auto_187297 ) ) ( not ( = ?auto_187294 ?auto_187295 ) ) ( not ( = ?auto_187294 ?auto_187296 ) ) ( not ( = ?auto_187294 ?auto_187297 ) ) ( not ( = ?auto_187295 ?auto_187296 ) ) ( not ( = ?auto_187295 ?auto_187297 ) ) ( not ( = ?auto_187296 ?auto_187297 ) ) ( ON ?auto_187297 ?auto_187298 ) ( not ( = ?auto_187291 ?auto_187298 ) ) ( not ( = ?auto_187292 ?auto_187298 ) ) ( not ( = ?auto_187293 ?auto_187298 ) ) ( not ( = ?auto_187294 ?auto_187298 ) ) ( not ( = ?auto_187295 ?auto_187298 ) ) ( not ( = ?auto_187296 ?auto_187298 ) ) ( not ( = ?auto_187297 ?auto_187298 ) ) ( ON ?auto_187296 ?auto_187297 ) ( ON-TABLE ?auto_187298 ) ( ON ?auto_187295 ?auto_187296 ) ( ON ?auto_187294 ?auto_187295 ) ( ON ?auto_187293 ?auto_187294 ) ( CLEAR ?auto_187293 ) ( HOLDING ?auto_187292 ) ( CLEAR ?auto_187291 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187291 ?auto_187292 )
      ( MAKE-7PILE ?auto_187291 ?auto_187292 ?auto_187293 ?auto_187294 ?auto_187295 ?auto_187296 ?auto_187297 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187299 - BLOCK
      ?auto_187300 - BLOCK
      ?auto_187301 - BLOCK
      ?auto_187302 - BLOCK
      ?auto_187303 - BLOCK
      ?auto_187304 - BLOCK
      ?auto_187305 - BLOCK
    )
    :vars
    (
      ?auto_187306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187299 ) ( not ( = ?auto_187299 ?auto_187300 ) ) ( not ( = ?auto_187299 ?auto_187301 ) ) ( not ( = ?auto_187299 ?auto_187302 ) ) ( not ( = ?auto_187299 ?auto_187303 ) ) ( not ( = ?auto_187299 ?auto_187304 ) ) ( not ( = ?auto_187299 ?auto_187305 ) ) ( not ( = ?auto_187300 ?auto_187301 ) ) ( not ( = ?auto_187300 ?auto_187302 ) ) ( not ( = ?auto_187300 ?auto_187303 ) ) ( not ( = ?auto_187300 ?auto_187304 ) ) ( not ( = ?auto_187300 ?auto_187305 ) ) ( not ( = ?auto_187301 ?auto_187302 ) ) ( not ( = ?auto_187301 ?auto_187303 ) ) ( not ( = ?auto_187301 ?auto_187304 ) ) ( not ( = ?auto_187301 ?auto_187305 ) ) ( not ( = ?auto_187302 ?auto_187303 ) ) ( not ( = ?auto_187302 ?auto_187304 ) ) ( not ( = ?auto_187302 ?auto_187305 ) ) ( not ( = ?auto_187303 ?auto_187304 ) ) ( not ( = ?auto_187303 ?auto_187305 ) ) ( not ( = ?auto_187304 ?auto_187305 ) ) ( ON ?auto_187305 ?auto_187306 ) ( not ( = ?auto_187299 ?auto_187306 ) ) ( not ( = ?auto_187300 ?auto_187306 ) ) ( not ( = ?auto_187301 ?auto_187306 ) ) ( not ( = ?auto_187302 ?auto_187306 ) ) ( not ( = ?auto_187303 ?auto_187306 ) ) ( not ( = ?auto_187304 ?auto_187306 ) ) ( not ( = ?auto_187305 ?auto_187306 ) ) ( ON ?auto_187304 ?auto_187305 ) ( ON-TABLE ?auto_187306 ) ( ON ?auto_187303 ?auto_187304 ) ( ON ?auto_187302 ?auto_187303 ) ( ON ?auto_187301 ?auto_187302 ) ( CLEAR ?auto_187299 ) ( ON ?auto_187300 ?auto_187301 ) ( CLEAR ?auto_187300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187306 ?auto_187305 ?auto_187304 ?auto_187303 ?auto_187302 ?auto_187301 )
      ( MAKE-7PILE ?auto_187299 ?auto_187300 ?auto_187301 ?auto_187302 ?auto_187303 ?auto_187304 ?auto_187305 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187307 - BLOCK
      ?auto_187308 - BLOCK
      ?auto_187309 - BLOCK
      ?auto_187310 - BLOCK
      ?auto_187311 - BLOCK
      ?auto_187312 - BLOCK
      ?auto_187313 - BLOCK
    )
    :vars
    (
      ?auto_187314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187307 ?auto_187308 ) ) ( not ( = ?auto_187307 ?auto_187309 ) ) ( not ( = ?auto_187307 ?auto_187310 ) ) ( not ( = ?auto_187307 ?auto_187311 ) ) ( not ( = ?auto_187307 ?auto_187312 ) ) ( not ( = ?auto_187307 ?auto_187313 ) ) ( not ( = ?auto_187308 ?auto_187309 ) ) ( not ( = ?auto_187308 ?auto_187310 ) ) ( not ( = ?auto_187308 ?auto_187311 ) ) ( not ( = ?auto_187308 ?auto_187312 ) ) ( not ( = ?auto_187308 ?auto_187313 ) ) ( not ( = ?auto_187309 ?auto_187310 ) ) ( not ( = ?auto_187309 ?auto_187311 ) ) ( not ( = ?auto_187309 ?auto_187312 ) ) ( not ( = ?auto_187309 ?auto_187313 ) ) ( not ( = ?auto_187310 ?auto_187311 ) ) ( not ( = ?auto_187310 ?auto_187312 ) ) ( not ( = ?auto_187310 ?auto_187313 ) ) ( not ( = ?auto_187311 ?auto_187312 ) ) ( not ( = ?auto_187311 ?auto_187313 ) ) ( not ( = ?auto_187312 ?auto_187313 ) ) ( ON ?auto_187313 ?auto_187314 ) ( not ( = ?auto_187307 ?auto_187314 ) ) ( not ( = ?auto_187308 ?auto_187314 ) ) ( not ( = ?auto_187309 ?auto_187314 ) ) ( not ( = ?auto_187310 ?auto_187314 ) ) ( not ( = ?auto_187311 ?auto_187314 ) ) ( not ( = ?auto_187312 ?auto_187314 ) ) ( not ( = ?auto_187313 ?auto_187314 ) ) ( ON ?auto_187312 ?auto_187313 ) ( ON-TABLE ?auto_187314 ) ( ON ?auto_187311 ?auto_187312 ) ( ON ?auto_187310 ?auto_187311 ) ( ON ?auto_187309 ?auto_187310 ) ( ON ?auto_187308 ?auto_187309 ) ( CLEAR ?auto_187308 ) ( HOLDING ?auto_187307 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187307 )
      ( MAKE-7PILE ?auto_187307 ?auto_187308 ?auto_187309 ?auto_187310 ?auto_187311 ?auto_187312 ?auto_187313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187315 - BLOCK
      ?auto_187316 - BLOCK
      ?auto_187317 - BLOCK
      ?auto_187318 - BLOCK
      ?auto_187319 - BLOCK
      ?auto_187320 - BLOCK
      ?auto_187321 - BLOCK
    )
    :vars
    (
      ?auto_187322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187315 ?auto_187316 ) ) ( not ( = ?auto_187315 ?auto_187317 ) ) ( not ( = ?auto_187315 ?auto_187318 ) ) ( not ( = ?auto_187315 ?auto_187319 ) ) ( not ( = ?auto_187315 ?auto_187320 ) ) ( not ( = ?auto_187315 ?auto_187321 ) ) ( not ( = ?auto_187316 ?auto_187317 ) ) ( not ( = ?auto_187316 ?auto_187318 ) ) ( not ( = ?auto_187316 ?auto_187319 ) ) ( not ( = ?auto_187316 ?auto_187320 ) ) ( not ( = ?auto_187316 ?auto_187321 ) ) ( not ( = ?auto_187317 ?auto_187318 ) ) ( not ( = ?auto_187317 ?auto_187319 ) ) ( not ( = ?auto_187317 ?auto_187320 ) ) ( not ( = ?auto_187317 ?auto_187321 ) ) ( not ( = ?auto_187318 ?auto_187319 ) ) ( not ( = ?auto_187318 ?auto_187320 ) ) ( not ( = ?auto_187318 ?auto_187321 ) ) ( not ( = ?auto_187319 ?auto_187320 ) ) ( not ( = ?auto_187319 ?auto_187321 ) ) ( not ( = ?auto_187320 ?auto_187321 ) ) ( ON ?auto_187321 ?auto_187322 ) ( not ( = ?auto_187315 ?auto_187322 ) ) ( not ( = ?auto_187316 ?auto_187322 ) ) ( not ( = ?auto_187317 ?auto_187322 ) ) ( not ( = ?auto_187318 ?auto_187322 ) ) ( not ( = ?auto_187319 ?auto_187322 ) ) ( not ( = ?auto_187320 ?auto_187322 ) ) ( not ( = ?auto_187321 ?auto_187322 ) ) ( ON ?auto_187320 ?auto_187321 ) ( ON-TABLE ?auto_187322 ) ( ON ?auto_187319 ?auto_187320 ) ( ON ?auto_187318 ?auto_187319 ) ( ON ?auto_187317 ?auto_187318 ) ( ON ?auto_187316 ?auto_187317 ) ( ON ?auto_187315 ?auto_187316 ) ( CLEAR ?auto_187315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187322 ?auto_187321 ?auto_187320 ?auto_187319 ?auto_187318 ?auto_187317 ?auto_187316 )
      ( MAKE-7PILE ?auto_187315 ?auto_187316 ?auto_187317 ?auto_187318 ?auto_187319 ?auto_187320 ?auto_187321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187323 - BLOCK
      ?auto_187324 - BLOCK
      ?auto_187325 - BLOCK
      ?auto_187326 - BLOCK
      ?auto_187327 - BLOCK
      ?auto_187328 - BLOCK
      ?auto_187329 - BLOCK
    )
    :vars
    (
      ?auto_187330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187323 ?auto_187324 ) ) ( not ( = ?auto_187323 ?auto_187325 ) ) ( not ( = ?auto_187323 ?auto_187326 ) ) ( not ( = ?auto_187323 ?auto_187327 ) ) ( not ( = ?auto_187323 ?auto_187328 ) ) ( not ( = ?auto_187323 ?auto_187329 ) ) ( not ( = ?auto_187324 ?auto_187325 ) ) ( not ( = ?auto_187324 ?auto_187326 ) ) ( not ( = ?auto_187324 ?auto_187327 ) ) ( not ( = ?auto_187324 ?auto_187328 ) ) ( not ( = ?auto_187324 ?auto_187329 ) ) ( not ( = ?auto_187325 ?auto_187326 ) ) ( not ( = ?auto_187325 ?auto_187327 ) ) ( not ( = ?auto_187325 ?auto_187328 ) ) ( not ( = ?auto_187325 ?auto_187329 ) ) ( not ( = ?auto_187326 ?auto_187327 ) ) ( not ( = ?auto_187326 ?auto_187328 ) ) ( not ( = ?auto_187326 ?auto_187329 ) ) ( not ( = ?auto_187327 ?auto_187328 ) ) ( not ( = ?auto_187327 ?auto_187329 ) ) ( not ( = ?auto_187328 ?auto_187329 ) ) ( ON ?auto_187329 ?auto_187330 ) ( not ( = ?auto_187323 ?auto_187330 ) ) ( not ( = ?auto_187324 ?auto_187330 ) ) ( not ( = ?auto_187325 ?auto_187330 ) ) ( not ( = ?auto_187326 ?auto_187330 ) ) ( not ( = ?auto_187327 ?auto_187330 ) ) ( not ( = ?auto_187328 ?auto_187330 ) ) ( not ( = ?auto_187329 ?auto_187330 ) ) ( ON ?auto_187328 ?auto_187329 ) ( ON-TABLE ?auto_187330 ) ( ON ?auto_187327 ?auto_187328 ) ( ON ?auto_187326 ?auto_187327 ) ( ON ?auto_187325 ?auto_187326 ) ( ON ?auto_187324 ?auto_187325 ) ( HOLDING ?auto_187323 ) ( CLEAR ?auto_187324 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187330 ?auto_187329 ?auto_187328 ?auto_187327 ?auto_187326 ?auto_187325 ?auto_187324 ?auto_187323 )
      ( MAKE-7PILE ?auto_187323 ?auto_187324 ?auto_187325 ?auto_187326 ?auto_187327 ?auto_187328 ?auto_187329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187331 - BLOCK
      ?auto_187332 - BLOCK
      ?auto_187333 - BLOCK
      ?auto_187334 - BLOCK
      ?auto_187335 - BLOCK
      ?auto_187336 - BLOCK
      ?auto_187337 - BLOCK
    )
    :vars
    (
      ?auto_187338 - BLOCK
      ?auto_187339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187331 ?auto_187332 ) ) ( not ( = ?auto_187331 ?auto_187333 ) ) ( not ( = ?auto_187331 ?auto_187334 ) ) ( not ( = ?auto_187331 ?auto_187335 ) ) ( not ( = ?auto_187331 ?auto_187336 ) ) ( not ( = ?auto_187331 ?auto_187337 ) ) ( not ( = ?auto_187332 ?auto_187333 ) ) ( not ( = ?auto_187332 ?auto_187334 ) ) ( not ( = ?auto_187332 ?auto_187335 ) ) ( not ( = ?auto_187332 ?auto_187336 ) ) ( not ( = ?auto_187332 ?auto_187337 ) ) ( not ( = ?auto_187333 ?auto_187334 ) ) ( not ( = ?auto_187333 ?auto_187335 ) ) ( not ( = ?auto_187333 ?auto_187336 ) ) ( not ( = ?auto_187333 ?auto_187337 ) ) ( not ( = ?auto_187334 ?auto_187335 ) ) ( not ( = ?auto_187334 ?auto_187336 ) ) ( not ( = ?auto_187334 ?auto_187337 ) ) ( not ( = ?auto_187335 ?auto_187336 ) ) ( not ( = ?auto_187335 ?auto_187337 ) ) ( not ( = ?auto_187336 ?auto_187337 ) ) ( ON ?auto_187337 ?auto_187338 ) ( not ( = ?auto_187331 ?auto_187338 ) ) ( not ( = ?auto_187332 ?auto_187338 ) ) ( not ( = ?auto_187333 ?auto_187338 ) ) ( not ( = ?auto_187334 ?auto_187338 ) ) ( not ( = ?auto_187335 ?auto_187338 ) ) ( not ( = ?auto_187336 ?auto_187338 ) ) ( not ( = ?auto_187337 ?auto_187338 ) ) ( ON ?auto_187336 ?auto_187337 ) ( ON-TABLE ?auto_187338 ) ( ON ?auto_187335 ?auto_187336 ) ( ON ?auto_187334 ?auto_187335 ) ( ON ?auto_187333 ?auto_187334 ) ( ON ?auto_187332 ?auto_187333 ) ( CLEAR ?auto_187332 ) ( ON ?auto_187331 ?auto_187339 ) ( CLEAR ?auto_187331 ) ( HAND-EMPTY ) ( not ( = ?auto_187331 ?auto_187339 ) ) ( not ( = ?auto_187332 ?auto_187339 ) ) ( not ( = ?auto_187333 ?auto_187339 ) ) ( not ( = ?auto_187334 ?auto_187339 ) ) ( not ( = ?auto_187335 ?auto_187339 ) ) ( not ( = ?auto_187336 ?auto_187339 ) ) ( not ( = ?auto_187337 ?auto_187339 ) ) ( not ( = ?auto_187338 ?auto_187339 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187331 ?auto_187339 )
      ( MAKE-7PILE ?auto_187331 ?auto_187332 ?auto_187333 ?auto_187334 ?auto_187335 ?auto_187336 ?auto_187337 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187340 - BLOCK
      ?auto_187341 - BLOCK
      ?auto_187342 - BLOCK
      ?auto_187343 - BLOCK
      ?auto_187344 - BLOCK
      ?auto_187345 - BLOCK
      ?auto_187346 - BLOCK
    )
    :vars
    (
      ?auto_187348 - BLOCK
      ?auto_187347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187340 ?auto_187341 ) ) ( not ( = ?auto_187340 ?auto_187342 ) ) ( not ( = ?auto_187340 ?auto_187343 ) ) ( not ( = ?auto_187340 ?auto_187344 ) ) ( not ( = ?auto_187340 ?auto_187345 ) ) ( not ( = ?auto_187340 ?auto_187346 ) ) ( not ( = ?auto_187341 ?auto_187342 ) ) ( not ( = ?auto_187341 ?auto_187343 ) ) ( not ( = ?auto_187341 ?auto_187344 ) ) ( not ( = ?auto_187341 ?auto_187345 ) ) ( not ( = ?auto_187341 ?auto_187346 ) ) ( not ( = ?auto_187342 ?auto_187343 ) ) ( not ( = ?auto_187342 ?auto_187344 ) ) ( not ( = ?auto_187342 ?auto_187345 ) ) ( not ( = ?auto_187342 ?auto_187346 ) ) ( not ( = ?auto_187343 ?auto_187344 ) ) ( not ( = ?auto_187343 ?auto_187345 ) ) ( not ( = ?auto_187343 ?auto_187346 ) ) ( not ( = ?auto_187344 ?auto_187345 ) ) ( not ( = ?auto_187344 ?auto_187346 ) ) ( not ( = ?auto_187345 ?auto_187346 ) ) ( ON ?auto_187346 ?auto_187348 ) ( not ( = ?auto_187340 ?auto_187348 ) ) ( not ( = ?auto_187341 ?auto_187348 ) ) ( not ( = ?auto_187342 ?auto_187348 ) ) ( not ( = ?auto_187343 ?auto_187348 ) ) ( not ( = ?auto_187344 ?auto_187348 ) ) ( not ( = ?auto_187345 ?auto_187348 ) ) ( not ( = ?auto_187346 ?auto_187348 ) ) ( ON ?auto_187345 ?auto_187346 ) ( ON-TABLE ?auto_187348 ) ( ON ?auto_187344 ?auto_187345 ) ( ON ?auto_187343 ?auto_187344 ) ( ON ?auto_187342 ?auto_187343 ) ( ON ?auto_187340 ?auto_187347 ) ( CLEAR ?auto_187340 ) ( not ( = ?auto_187340 ?auto_187347 ) ) ( not ( = ?auto_187341 ?auto_187347 ) ) ( not ( = ?auto_187342 ?auto_187347 ) ) ( not ( = ?auto_187343 ?auto_187347 ) ) ( not ( = ?auto_187344 ?auto_187347 ) ) ( not ( = ?auto_187345 ?auto_187347 ) ) ( not ( = ?auto_187346 ?auto_187347 ) ) ( not ( = ?auto_187348 ?auto_187347 ) ) ( HOLDING ?auto_187341 ) ( CLEAR ?auto_187342 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187348 ?auto_187346 ?auto_187345 ?auto_187344 ?auto_187343 ?auto_187342 ?auto_187341 )
      ( MAKE-7PILE ?auto_187340 ?auto_187341 ?auto_187342 ?auto_187343 ?auto_187344 ?auto_187345 ?auto_187346 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187349 - BLOCK
      ?auto_187350 - BLOCK
      ?auto_187351 - BLOCK
      ?auto_187352 - BLOCK
      ?auto_187353 - BLOCK
      ?auto_187354 - BLOCK
      ?auto_187355 - BLOCK
    )
    :vars
    (
      ?auto_187356 - BLOCK
      ?auto_187357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187349 ?auto_187350 ) ) ( not ( = ?auto_187349 ?auto_187351 ) ) ( not ( = ?auto_187349 ?auto_187352 ) ) ( not ( = ?auto_187349 ?auto_187353 ) ) ( not ( = ?auto_187349 ?auto_187354 ) ) ( not ( = ?auto_187349 ?auto_187355 ) ) ( not ( = ?auto_187350 ?auto_187351 ) ) ( not ( = ?auto_187350 ?auto_187352 ) ) ( not ( = ?auto_187350 ?auto_187353 ) ) ( not ( = ?auto_187350 ?auto_187354 ) ) ( not ( = ?auto_187350 ?auto_187355 ) ) ( not ( = ?auto_187351 ?auto_187352 ) ) ( not ( = ?auto_187351 ?auto_187353 ) ) ( not ( = ?auto_187351 ?auto_187354 ) ) ( not ( = ?auto_187351 ?auto_187355 ) ) ( not ( = ?auto_187352 ?auto_187353 ) ) ( not ( = ?auto_187352 ?auto_187354 ) ) ( not ( = ?auto_187352 ?auto_187355 ) ) ( not ( = ?auto_187353 ?auto_187354 ) ) ( not ( = ?auto_187353 ?auto_187355 ) ) ( not ( = ?auto_187354 ?auto_187355 ) ) ( ON ?auto_187355 ?auto_187356 ) ( not ( = ?auto_187349 ?auto_187356 ) ) ( not ( = ?auto_187350 ?auto_187356 ) ) ( not ( = ?auto_187351 ?auto_187356 ) ) ( not ( = ?auto_187352 ?auto_187356 ) ) ( not ( = ?auto_187353 ?auto_187356 ) ) ( not ( = ?auto_187354 ?auto_187356 ) ) ( not ( = ?auto_187355 ?auto_187356 ) ) ( ON ?auto_187354 ?auto_187355 ) ( ON-TABLE ?auto_187356 ) ( ON ?auto_187353 ?auto_187354 ) ( ON ?auto_187352 ?auto_187353 ) ( ON ?auto_187351 ?auto_187352 ) ( ON ?auto_187349 ?auto_187357 ) ( not ( = ?auto_187349 ?auto_187357 ) ) ( not ( = ?auto_187350 ?auto_187357 ) ) ( not ( = ?auto_187351 ?auto_187357 ) ) ( not ( = ?auto_187352 ?auto_187357 ) ) ( not ( = ?auto_187353 ?auto_187357 ) ) ( not ( = ?auto_187354 ?auto_187357 ) ) ( not ( = ?auto_187355 ?auto_187357 ) ) ( not ( = ?auto_187356 ?auto_187357 ) ) ( CLEAR ?auto_187351 ) ( ON ?auto_187350 ?auto_187349 ) ( CLEAR ?auto_187350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187357 ?auto_187349 )
      ( MAKE-7PILE ?auto_187349 ?auto_187350 ?auto_187351 ?auto_187352 ?auto_187353 ?auto_187354 ?auto_187355 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187358 - BLOCK
      ?auto_187359 - BLOCK
      ?auto_187360 - BLOCK
      ?auto_187361 - BLOCK
      ?auto_187362 - BLOCK
      ?auto_187363 - BLOCK
      ?auto_187364 - BLOCK
    )
    :vars
    (
      ?auto_187366 - BLOCK
      ?auto_187365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187358 ?auto_187359 ) ) ( not ( = ?auto_187358 ?auto_187360 ) ) ( not ( = ?auto_187358 ?auto_187361 ) ) ( not ( = ?auto_187358 ?auto_187362 ) ) ( not ( = ?auto_187358 ?auto_187363 ) ) ( not ( = ?auto_187358 ?auto_187364 ) ) ( not ( = ?auto_187359 ?auto_187360 ) ) ( not ( = ?auto_187359 ?auto_187361 ) ) ( not ( = ?auto_187359 ?auto_187362 ) ) ( not ( = ?auto_187359 ?auto_187363 ) ) ( not ( = ?auto_187359 ?auto_187364 ) ) ( not ( = ?auto_187360 ?auto_187361 ) ) ( not ( = ?auto_187360 ?auto_187362 ) ) ( not ( = ?auto_187360 ?auto_187363 ) ) ( not ( = ?auto_187360 ?auto_187364 ) ) ( not ( = ?auto_187361 ?auto_187362 ) ) ( not ( = ?auto_187361 ?auto_187363 ) ) ( not ( = ?auto_187361 ?auto_187364 ) ) ( not ( = ?auto_187362 ?auto_187363 ) ) ( not ( = ?auto_187362 ?auto_187364 ) ) ( not ( = ?auto_187363 ?auto_187364 ) ) ( ON ?auto_187364 ?auto_187366 ) ( not ( = ?auto_187358 ?auto_187366 ) ) ( not ( = ?auto_187359 ?auto_187366 ) ) ( not ( = ?auto_187360 ?auto_187366 ) ) ( not ( = ?auto_187361 ?auto_187366 ) ) ( not ( = ?auto_187362 ?auto_187366 ) ) ( not ( = ?auto_187363 ?auto_187366 ) ) ( not ( = ?auto_187364 ?auto_187366 ) ) ( ON ?auto_187363 ?auto_187364 ) ( ON-TABLE ?auto_187366 ) ( ON ?auto_187362 ?auto_187363 ) ( ON ?auto_187361 ?auto_187362 ) ( ON ?auto_187358 ?auto_187365 ) ( not ( = ?auto_187358 ?auto_187365 ) ) ( not ( = ?auto_187359 ?auto_187365 ) ) ( not ( = ?auto_187360 ?auto_187365 ) ) ( not ( = ?auto_187361 ?auto_187365 ) ) ( not ( = ?auto_187362 ?auto_187365 ) ) ( not ( = ?auto_187363 ?auto_187365 ) ) ( not ( = ?auto_187364 ?auto_187365 ) ) ( not ( = ?auto_187366 ?auto_187365 ) ) ( ON ?auto_187359 ?auto_187358 ) ( CLEAR ?auto_187359 ) ( ON-TABLE ?auto_187365 ) ( HOLDING ?auto_187360 ) ( CLEAR ?auto_187361 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187366 ?auto_187364 ?auto_187363 ?auto_187362 ?auto_187361 ?auto_187360 )
      ( MAKE-7PILE ?auto_187358 ?auto_187359 ?auto_187360 ?auto_187361 ?auto_187362 ?auto_187363 ?auto_187364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187367 - BLOCK
      ?auto_187368 - BLOCK
      ?auto_187369 - BLOCK
      ?auto_187370 - BLOCK
      ?auto_187371 - BLOCK
      ?auto_187372 - BLOCK
      ?auto_187373 - BLOCK
    )
    :vars
    (
      ?auto_187374 - BLOCK
      ?auto_187375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187367 ?auto_187368 ) ) ( not ( = ?auto_187367 ?auto_187369 ) ) ( not ( = ?auto_187367 ?auto_187370 ) ) ( not ( = ?auto_187367 ?auto_187371 ) ) ( not ( = ?auto_187367 ?auto_187372 ) ) ( not ( = ?auto_187367 ?auto_187373 ) ) ( not ( = ?auto_187368 ?auto_187369 ) ) ( not ( = ?auto_187368 ?auto_187370 ) ) ( not ( = ?auto_187368 ?auto_187371 ) ) ( not ( = ?auto_187368 ?auto_187372 ) ) ( not ( = ?auto_187368 ?auto_187373 ) ) ( not ( = ?auto_187369 ?auto_187370 ) ) ( not ( = ?auto_187369 ?auto_187371 ) ) ( not ( = ?auto_187369 ?auto_187372 ) ) ( not ( = ?auto_187369 ?auto_187373 ) ) ( not ( = ?auto_187370 ?auto_187371 ) ) ( not ( = ?auto_187370 ?auto_187372 ) ) ( not ( = ?auto_187370 ?auto_187373 ) ) ( not ( = ?auto_187371 ?auto_187372 ) ) ( not ( = ?auto_187371 ?auto_187373 ) ) ( not ( = ?auto_187372 ?auto_187373 ) ) ( ON ?auto_187373 ?auto_187374 ) ( not ( = ?auto_187367 ?auto_187374 ) ) ( not ( = ?auto_187368 ?auto_187374 ) ) ( not ( = ?auto_187369 ?auto_187374 ) ) ( not ( = ?auto_187370 ?auto_187374 ) ) ( not ( = ?auto_187371 ?auto_187374 ) ) ( not ( = ?auto_187372 ?auto_187374 ) ) ( not ( = ?auto_187373 ?auto_187374 ) ) ( ON ?auto_187372 ?auto_187373 ) ( ON-TABLE ?auto_187374 ) ( ON ?auto_187371 ?auto_187372 ) ( ON ?auto_187370 ?auto_187371 ) ( ON ?auto_187367 ?auto_187375 ) ( not ( = ?auto_187367 ?auto_187375 ) ) ( not ( = ?auto_187368 ?auto_187375 ) ) ( not ( = ?auto_187369 ?auto_187375 ) ) ( not ( = ?auto_187370 ?auto_187375 ) ) ( not ( = ?auto_187371 ?auto_187375 ) ) ( not ( = ?auto_187372 ?auto_187375 ) ) ( not ( = ?auto_187373 ?auto_187375 ) ) ( not ( = ?auto_187374 ?auto_187375 ) ) ( ON ?auto_187368 ?auto_187367 ) ( ON-TABLE ?auto_187375 ) ( CLEAR ?auto_187370 ) ( ON ?auto_187369 ?auto_187368 ) ( CLEAR ?auto_187369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187375 ?auto_187367 ?auto_187368 )
      ( MAKE-7PILE ?auto_187367 ?auto_187368 ?auto_187369 ?auto_187370 ?auto_187371 ?auto_187372 ?auto_187373 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187376 - BLOCK
      ?auto_187377 - BLOCK
      ?auto_187378 - BLOCK
      ?auto_187379 - BLOCK
      ?auto_187380 - BLOCK
      ?auto_187381 - BLOCK
      ?auto_187382 - BLOCK
    )
    :vars
    (
      ?auto_187384 - BLOCK
      ?auto_187383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187376 ?auto_187377 ) ) ( not ( = ?auto_187376 ?auto_187378 ) ) ( not ( = ?auto_187376 ?auto_187379 ) ) ( not ( = ?auto_187376 ?auto_187380 ) ) ( not ( = ?auto_187376 ?auto_187381 ) ) ( not ( = ?auto_187376 ?auto_187382 ) ) ( not ( = ?auto_187377 ?auto_187378 ) ) ( not ( = ?auto_187377 ?auto_187379 ) ) ( not ( = ?auto_187377 ?auto_187380 ) ) ( not ( = ?auto_187377 ?auto_187381 ) ) ( not ( = ?auto_187377 ?auto_187382 ) ) ( not ( = ?auto_187378 ?auto_187379 ) ) ( not ( = ?auto_187378 ?auto_187380 ) ) ( not ( = ?auto_187378 ?auto_187381 ) ) ( not ( = ?auto_187378 ?auto_187382 ) ) ( not ( = ?auto_187379 ?auto_187380 ) ) ( not ( = ?auto_187379 ?auto_187381 ) ) ( not ( = ?auto_187379 ?auto_187382 ) ) ( not ( = ?auto_187380 ?auto_187381 ) ) ( not ( = ?auto_187380 ?auto_187382 ) ) ( not ( = ?auto_187381 ?auto_187382 ) ) ( ON ?auto_187382 ?auto_187384 ) ( not ( = ?auto_187376 ?auto_187384 ) ) ( not ( = ?auto_187377 ?auto_187384 ) ) ( not ( = ?auto_187378 ?auto_187384 ) ) ( not ( = ?auto_187379 ?auto_187384 ) ) ( not ( = ?auto_187380 ?auto_187384 ) ) ( not ( = ?auto_187381 ?auto_187384 ) ) ( not ( = ?auto_187382 ?auto_187384 ) ) ( ON ?auto_187381 ?auto_187382 ) ( ON-TABLE ?auto_187384 ) ( ON ?auto_187380 ?auto_187381 ) ( ON ?auto_187376 ?auto_187383 ) ( not ( = ?auto_187376 ?auto_187383 ) ) ( not ( = ?auto_187377 ?auto_187383 ) ) ( not ( = ?auto_187378 ?auto_187383 ) ) ( not ( = ?auto_187379 ?auto_187383 ) ) ( not ( = ?auto_187380 ?auto_187383 ) ) ( not ( = ?auto_187381 ?auto_187383 ) ) ( not ( = ?auto_187382 ?auto_187383 ) ) ( not ( = ?auto_187384 ?auto_187383 ) ) ( ON ?auto_187377 ?auto_187376 ) ( ON-TABLE ?auto_187383 ) ( ON ?auto_187378 ?auto_187377 ) ( CLEAR ?auto_187378 ) ( HOLDING ?auto_187379 ) ( CLEAR ?auto_187380 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187384 ?auto_187382 ?auto_187381 ?auto_187380 ?auto_187379 )
      ( MAKE-7PILE ?auto_187376 ?auto_187377 ?auto_187378 ?auto_187379 ?auto_187380 ?auto_187381 ?auto_187382 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187385 - BLOCK
      ?auto_187386 - BLOCK
      ?auto_187387 - BLOCK
      ?auto_187388 - BLOCK
      ?auto_187389 - BLOCK
      ?auto_187390 - BLOCK
      ?auto_187391 - BLOCK
    )
    :vars
    (
      ?auto_187392 - BLOCK
      ?auto_187393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187385 ?auto_187386 ) ) ( not ( = ?auto_187385 ?auto_187387 ) ) ( not ( = ?auto_187385 ?auto_187388 ) ) ( not ( = ?auto_187385 ?auto_187389 ) ) ( not ( = ?auto_187385 ?auto_187390 ) ) ( not ( = ?auto_187385 ?auto_187391 ) ) ( not ( = ?auto_187386 ?auto_187387 ) ) ( not ( = ?auto_187386 ?auto_187388 ) ) ( not ( = ?auto_187386 ?auto_187389 ) ) ( not ( = ?auto_187386 ?auto_187390 ) ) ( not ( = ?auto_187386 ?auto_187391 ) ) ( not ( = ?auto_187387 ?auto_187388 ) ) ( not ( = ?auto_187387 ?auto_187389 ) ) ( not ( = ?auto_187387 ?auto_187390 ) ) ( not ( = ?auto_187387 ?auto_187391 ) ) ( not ( = ?auto_187388 ?auto_187389 ) ) ( not ( = ?auto_187388 ?auto_187390 ) ) ( not ( = ?auto_187388 ?auto_187391 ) ) ( not ( = ?auto_187389 ?auto_187390 ) ) ( not ( = ?auto_187389 ?auto_187391 ) ) ( not ( = ?auto_187390 ?auto_187391 ) ) ( ON ?auto_187391 ?auto_187392 ) ( not ( = ?auto_187385 ?auto_187392 ) ) ( not ( = ?auto_187386 ?auto_187392 ) ) ( not ( = ?auto_187387 ?auto_187392 ) ) ( not ( = ?auto_187388 ?auto_187392 ) ) ( not ( = ?auto_187389 ?auto_187392 ) ) ( not ( = ?auto_187390 ?auto_187392 ) ) ( not ( = ?auto_187391 ?auto_187392 ) ) ( ON ?auto_187390 ?auto_187391 ) ( ON-TABLE ?auto_187392 ) ( ON ?auto_187389 ?auto_187390 ) ( ON ?auto_187385 ?auto_187393 ) ( not ( = ?auto_187385 ?auto_187393 ) ) ( not ( = ?auto_187386 ?auto_187393 ) ) ( not ( = ?auto_187387 ?auto_187393 ) ) ( not ( = ?auto_187388 ?auto_187393 ) ) ( not ( = ?auto_187389 ?auto_187393 ) ) ( not ( = ?auto_187390 ?auto_187393 ) ) ( not ( = ?auto_187391 ?auto_187393 ) ) ( not ( = ?auto_187392 ?auto_187393 ) ) ( ON ?auto_187386 ?auto_187385 ) ( ON-TABLE ?auto_187393 ) ( ON ?auto_187387 ?auto_187386 ) ( CLEAR ?auto_187389 ) ( ON ?auto_187388 ?auto_187387 ) ( CLEAR ?auto_187388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187393 ?auto_187385 ?auto_187386 ?auto_187387 )
      ( MAKE-7PILE ?auto_187385 ?auto_187386 ?auto_187387 ?auto_187388 ?auto_187389 ?auto_187390 ?auto_187391 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187394 - BLOCK
      ?auto_187395 - BLOCK
      ?auto_187396 - BLOCK
      ?auto_187397 - BLOCK
      ?auto_187398 - BLOCK
      ?auto_187399 - BLOCK
      ?auto_187400 - BLOCK
    )
    :vars
    (
      ?auto_187402 - BLOCK
      ?auto_187401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187394 ?auto_187395 ) ) ( not ( = ?auto_187394 ?auto_187396 ) ) ( not ( = ?auto_187394 ?auto_187397 ) ) ( not ( = ?auto_187394 ?auto_187398 ) ) ( not ( = ?auto_187394 ?auto_187399 ) ) ( not ( = ?auto_187394 ?auto_187400 ) ) ( not ( = ?auto_187395 ?auto_187396 ) ) ( not ( = ?auto_187395 ?auto_187397 ) ) ( not ( = ?auto_187395 ?auto_187398 ) ) ( not ( = ?auto_187395 ?auto_187399 ) ) ( not ( = ?auto_187395 ?auto_187400 ) ) ( not ( = ?auto_187396 ?auto_187397 ) ) ( not ( = ?auto_187396 ?auto_187398 ) ) ( not ( = ?auto_187396 ?auto_187399 ) ) ( not ( = ?auto_187396 ?auto_187400 ) ) ( not ( = ?auto_187397 ?auto_187398 ) ) ( not ( = ?auto_187397 ?auto_187399 ) ) ( not ( = ?auto_187397 ?auto_187400 ) ) ( not ( = ?auto_187398 ?auto_187399 ) ) ( not ( = ?auto_187398 ?auto_187400 ) ) ( not ( = ?auto_187399 ?auto_187400 ) ) ( ON ?auto_187400 ?auto_187402 ) ( not ( = ?auto_187394 ?auto_187402 ) ) ( not ( = ?auto_187395 ?auto_187402 ) ) ( not ( = ?auto_187396 ?auto_187402 ) ) ( not ( = ?auto_187397 ?auto_187402 ) ) ( not ( = ?auto_187398 ?auto_187402 ) ) ( not ( = ?auto_187399 ?auto_187402 ) ) ( not ( = ?auto_187400 ?auto_187402 ) ) ( ON ?auto_187399 ?auto_187400 ) ( ON-TABLE ?auto_187402 ) ( ON ?auto_187394 ?auto_187401 ) ( not ( = ?auto_187394 ?auto_187401 ) ) ( not ( = ?auto_187395 ?auto_187401 ) ) ( not ( = ?auto_187396 ?auto_187401 ) ) ( not ( = ?auto_187397 ?auto_187401 ) ) ( not ( = ?auto_187398 ?auto_187401 ) ) ( not ( = ?auto_187399 ?auto_187401 ) ) ( not ( = ?auto_187400 ?auto_187401 ) ) ( not ( = ?auto_187402 ?auto_187401 ) ) ( ON ?auto_187395 ?auto_187394 ) ( ON-TABLE ?auto_187401 ) ( ON ?auto_187396 ?auto_187395 ) ( ON ?auto_187397 ?auto_187396 ) ( CLEAR ?auto_187397 ) ( HOLDING ?auto_187398 ) ( CLEAR ?auto_187399 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187402 ?auto_187400 ?auto_187399 ?auto_187398 )
      ( MAKE-7PILE ?auto_187394 ?auto_187395 ?auto_187396 ?auto_187397 ?auto_187398 ?auto_187399 ?auto_187400 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187403 - BLOCK
      ?auto_187404 - BLOCK
      ?auto_187405 - BLOCK
      ?auto_187406 - BLOCK
      ?auto_187407 - BLOCK
      ?auto_187408 - BLOCK
      ?auto_187409 - BLOCK
    )
    :vars
    (
      ?auto_187410 - BLOCK
      ?auto_187411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187403 ?auto_187404 ) ) ( not ( = ?auto_187403 ?auto_187405 ) ) ( not ( = ?auto_187403 ?auto_187406 ) ) ( not ( = ?auto_187403 ?auto_187407 ) ) ( not ( = ?auto_187403 ?auto_187408 ) ) ( not ( = ?auto_187403 ?auto_187409 ) ) ( not ( = ?auto_187404 ?auto_187405 ) ) ( not ( = ?auto_187404 ?auto_187406 ) ) ( not ( = ?auto_187404 ?auto_187407 ) ) ( not ( = ?auto_187404 ?auto_187408 ) ) ( not ( = ?auto_187404 ?auto_187409 ) ) ( not ( = ?auto_187405 ?auto_187406 ) ) ( not ( = ?auto_187405 ?auto_187407 ) ) ( not ( = ?auto_187405 ?auto_187408 ) ) ( not ( = ?auto_187405 ?auto_187409 ) ) ( not ( = ?auto_187406 ?auto_187407 ) ) ( not ( = ?auto_187406 ?auto_187408 ) ) ( not ( = ?auto_187406 ?auto_187409 ) ) ( not ( = ?auto_187407 ?auto_187408 ) ) ( not ( = ?auto_187407 ?auto_187409 ) ) ( not ( = ?auto_187408 ?auto_187409 ) ) ( ON ?auto_187409 ?auto_187410 ) ( not ( = ?auto_187403 ?auto_187410 ) ) ( not ( = ?auto_187404 ?auto_187410 ) ) ( not ( = ?auto_187405 ?auto_187410 ) ) ( not ( = ?auto_187406 ?auto_187410 ) ) ( not ( = ?auto_187407 ?auto_187410 ) ) ( not ( = ?auto_187408 ?auto_187410 ) ) ( not ( = ?auto_187409 ?auto_187410 ) ) ( ON ?auto_187408 ?auto_187409 ) ( ON-TABLE ?auto_187410 ) ( ON ?auto_187403 ?auto_187411 ) ( not ( = ?auto_187403 ?auto_187411 ) ) ( not ( = ?auto_187404 ?auto_187411 ) ) ( not ( = ?auto_187405 ?auto_187411 ) ) ( not ( = ?auto_187406 ?auto_187411 ) ) ( not ( = ?auto_187407 ?auto_187411 ) ) ( not ( = ?auto_187408 ?auto_187411 ) ) ( not ( = ?auto_187409 ?auto_187411 ) ) ( not ( = ?auto_187410 ?auto_187411 ) ) ( ON ?auto_187404 ?auto_187403 ) ( ON-TABLE ?auto_187411 ) ( ON ?auto_187405 ?auto_187404 ) ( ON ?auto_187406 ?auto_187405 ) ( CLEAR ?auto_187408 ) ( ON ?auto_187407 ?auto_187406 ) ( CLEAR ?auto_187407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187411 ?auto_187403 ?auto_187404 ?auto_187405 ?auto_187406 )
      ( MAKE-7PILE ?auto_187403 ?auto_187404 ?auto_187405 ?auto_187406 ?auto_187407 ?auto_187408 ?auto_187409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187412 - BLOCK
      ?auto_187413 - BLOCK
      ?auto_187414 - BLOCK
      ?auto_187415 - BLOCK
      ?auto_187416 - BLOCK
      ?auto_187417 - BLOCK
      ?auto_187418 - BLOCK
    )
    :vars
    (
      ?auto_187419 - BLOCK
      ?auto_187420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187412 ?auto_187413 ) ) ( not ( = ?auto_187412 ?auto_187414 ) ) ( not ( = ?auto_187412 ?auto_187415 ) ) ( not ( = ?auto_187412 ?auto_187416 ) ) ( not ( = ?auto_187412 ?auto_187417 ) ) ( not ( = ?auto_187412 ?auto_187418 ) ) ( not ( = ?auto_187413 ?auto_187414 ) ) ( not ( = ?auto_187413 ?auto_187415 ) ) ( not ( = ?auto_187413 ?auto_187416 ) ) ( not ( = ?auto_187413 ?auto_187417 ) ) ( not ( = ?auto_187413 ?auto_187418 ) ) ( not ( = ?auto_187414 ?auto_187415 ) ) ( not ( = ?auto_187414 ?auto_187416 ) ) ( not ( = ?auto_187414 ?auto_187417 ) ) ( not ( = ?auto_187414 ?auto_187418 ) ) ( not ( = ?auto_187415 ?auto_187416 ) ) ( not ( = ?auto_187415 ?auto_187417 ) ) ( not ( = ?auto_187415 ?auto_187418 ) ) ( not ( = ?auto_187416 ?auto_187417 ) ) ( not ( = ?auto_187416 ?auto_187418 ) ) ( not ( = ?auto_187417 ?auto_187418 ) ) ( ON ?auto_187418 ?auto_187419 ) ( not ( = ?auto_187412 ?auto_187419 ) ) ( not ( = ?auto_187413 ?auto_187419 ) ) ( not ( = ?auto_187414 ?auto_187419 ) ) ( not ( = ?auto_187415 ?auto_187419 ) ) ( not ( = ?auto_187416 ?auto_187419 ) ) ( not ( = ?auto_187417 ?auto_187419 ) ) ( not ( = ?auto_187418 ?auto_187419 ) ) ( ON-TABLE ?auto_187419 ) ( ON ?auto_187412 ?auto_187420 ) ( not ( = ?auto_187412 ?auto_187420 ) ) ( not ( = ?auto_187413 ?auto_187420 ) ) ( not ( = ?auto_187414 ?auto_187420 ) ) ( not ( = ?auto_187415 ?auto_187420 ) ) ( not ( = ?auto_187416 ?auto_187420 ) ) ( not ( = ?auto_187417 ?auto_187420 ) ) ( not ( = ?auto_187418 ?auto_187420 ) ) ( not ( = ?auto_187419 ?auto_187420 ) ) ( ON ?auto_187413 ?auto_187412 ) ( ON-TABLE ?auto_187420 ) ( ON ?auto_187414 ?auto_187413 ) ( ON ?auto_187415 ?auto_187414 ) ( ON ?auto_187416 ?auto_187415 ) ( CLEAR ?auto_187416 ) ( HOLDING ?auto_187417 ) ( CLEAR ?auto_187418 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187419 ?auto_187418 ?auto_187417 )
      ( MAKE-7PILE ?auto_187412 ?auto_187413 ?auto_187414 ?auto_187415 ?auto_187416 ?auto_187417 ?auto_187418 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187421 - BLOCK
      ?auto_187422 - BLOCK
      ?auto_187423 - BLOCK
      ?auto_187424 - BLOCK
      ?auto_187425 - BLOCK
      ?auto_187426 - BLOCK
      ?auto_187427 - BLOCK
    )
    :vars
    (
      ?auto_187428 - BLOCK
      ?auto_187429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187421 ?auto_187422 ) ) ( not ( = ?auto_187421 ?auto_187423 ) ) ( not ( = ?auto_187421 ?auto_187424 ) ) ( not ( = ?auto_187421 ?auto_187425 ) ) ( not ( = ?auto_187421 ?auto_187426 ) ) ( not ( = ?auto_187421 ?auto_187427 ) ) ( not ( = ?auto_187422 ?auto_187423 ) ) ( not ( = ?auto_187422 ?auto_187424 ) ) ( not ( = ?auto_187422 ?auto_187425 ) ) ( not ( = ?auto_187422 ?auto_187426 ) ) ( not ( = ?auto_187422 ?auto_187427 ) ) ( not ( = ?auto_187423 ?auto_187424 ) ) ( not ( = ?auto_187423 ?auto_187425 ) ) ( not ( = ?auto_187423 ?auto_187426 ) ) ( not ( = ?auto_187423 ?auto_187427 ) ) ( not ( = ?auto_187424 ?auto_187425 ) ) ( not ( = ?auto_187424 ?auto_187426 ) ) ( not ( = ?auto_187424 ?auto_187427 ) ) ( not ( = ?auto_187425 ?auto_187426 ) ) ( not ( = ?auto_187425 ?auto_187427 ) ) ( not ( = ?auto_187426 ?auto_187427 ) ) ( ON ?auto_187427 ?auto_187428 ) ( not ( = ?auto_187421 ?auto_187428 ) ) ( not ( = ?auto_187422 ?auto_187428 ) ) ( not ( = ?auto_187423 ?auto_187428 ) ) ( not ( = ?auto_187424 ?auto_187428 ) ) ( not ( = ?auto_187425 ?auto_187428 ) ) ( not ( = ?auto_187426 ?auto_187428 ) ) ( not ( = ?auto_187427 ?auto_187428 ) ) ( ON-TABLE ?auto_187428 ) ( ON ?auto_187421 ?auto_187429 ) ( not ( = ?auto_187421 ?auto_187429 ) ) ( not ( = ?auto_187422 ?auto_187429 ) ) ( not ( = ?auto_187423 ?auto_187429 ) ) ( not ( = ?auto_187424 ?auto_187429 ) ) ( not ( = ?auto_187425 ?auto_187429 ) ) ( not ( = ?auto_187426 ?auto_187429 ) ) ( not ( = ?auto_187427 ?auto_187429 ) ) ( not ( = ?auto_187428 ?auto_187429 ) ) ( ON ?auto_187422 ?auto_187421 ) ( ON-TABLE ?auto_187429 ) ( ON ?auto_187423 ?auto_187422 ) ( ON ?auto_187424 ?auto_187423 ) ( ON ?auto_187425 ?auto_187424 ) ( CLEAR ?auto_187427 ) ( ON ?auto_187426 ?auto_187425 ) ( CLEAR ?auto_187426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187429 ?auto_187421 ?auto_187422 ?auto_187423 ?auto_187424 ?auto_187425 )
      ( MAKE-7PILE ?auto_187421 ?auto_187422 ?auto_187423 ?auto_187424 ?auto_187425 ?auto_187426 ?auto_187427 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187430 - BLOCK
      ?auto_187431 - BLOCK
      ?auto_187432 - BLOCK
      ?auto_187433 - BLOCK
      ?auto_187434 - BLOCK
      ?auto_187435 - BLOCK
      ?auto_187436 - BLOCK
    )
    :vars
    (
      ?auto_187438 - BLOCK
      ?auto_187437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187430 ?auto_187431 ) ) ( not ( = ?auto_187430 ?auto_187432 ) ) ( not ( = ?auto_187430 ?auto_187433 ) ) ( not ( = ?auto_187430 ?auto_187434 ) ) ( not ( = ?auto_187430 ?auto_187435 ) ) ( not ( = ?auto_187430 ?auto_187436 ) ) ( not ( = ?auto_187431 ?auto_187432 ) ) ( not ( = ?auto_187431 ?auto_187433 ) ) ( not ( = ?auto_187431 ?auto_187434 ) ) ( not ( = ?auto_187431 ?auto_187435 ) ) ( not ( = ?auto_187431 ?auto_187436 ) ) ( not ( = ?auto_187432 ?auto_187433 ) ) ( not ( = ?auto_187432 ?auto_187434 ) ) ( not ( = ?auto_187432 ?auto_187435 ) ) ( not ( = ?auto_187432 ?auto_187436 ) ) ( not ( = ?auto_187433 ?auto_187434 ) ) ( not ( = ?auto_187433 ?auto_187435 ) ) ( not ( = ?auto_187433 ?auto_187436 ) ) ( not ( = ?auto_187434 ?auto_187435 ) ) ( not ( = ?auto_187434 ?auto_187436 ) ) ( not ( = ?auto_187435 ?auto_187436 ) ) ( not ( = ?auto_187430 ?auto_187438 ) ) ( not ( = ?auto_187431 ?auto_187438 ) ) ( not ( = ?auto_187432 ?auto_187438 ) ) ( not ( = ?auto_187433 ?auto_187438 ) ) ( not ( = ?auto_187434 ?auto_187438 ) ) ( not ( = ?auto_187435 ?auto_187438 ) ) ( not ( = ?auto_187436 ?auto_187438 ) ) ( ON-TABLE ?auto_187438 ) ( ON ?auto_187430 ?auto_187437 ) ( not ( = ?auto_187430 ?auto_187437 ) ) ( not ( = ?auto_187431 ?auto_187437 ) ) ( not ( = ?auto_187432 ?auto_187437 ) ) ( not ( = ?auto_187433 ?auto_187437 ) ) ( not ( = ?auto_187434 ?auto_187437 ) ) ( not ( = ?auto_187435 ?auto_187437 ) ) ( not ( = ?auto_187436 ?auto_187437 ) ) ( not ( = ?auto_187438 ?auto_187437 ) ) ( ON ?auto_187431 ?auto_187430 ) ( ON-TABLE ?auto_187437 ) ( ON ?auto_187432 ?auto_187431 ) ( ON ?auto_187433 ?auto_187432 ) ( ON ?auto_187434 ?auto_187433 ) ( ON ?auto_187435 ?auto_187434 ) ( CLEAR ?auto_187435 ) ( HOLDING ?auto_187436 ) ( CLEAR ?auto_187438 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187438 ?auto_187436 )
      ( MAKE-7PILE ?auto_187430 ?auto_187431 ?auto_187432 ?auto_187433 ?auto_187434 ?auto_187435 ?auto_187436 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187439 - BLOCK
      ?auto_187440 - BLOCK
      ?auto_187441 - BLOCK
      ?auto_187442 - BLOCK
      ?auto_187443 - BLOCK
      ?auto_187444 - BLOCK
      ?auto_187445 - BLOCK
    )
    :vars
    (
      ?auto_187447 - BLOCK
      ?auto_187446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187439 ?auto_187440 ) ) ( not ( = ?auto_187439 ?auto_187441 ) ) ( not ( = ?auto_187439 ?auto_187442 ) ) ( not ( = ?auto_187439 ?auto_187443 ) ) ( not ( = ?auto_187439 ?auto_187444 ) ) ( not ( = ?auto_187439 ?auto_187445 ) ) ( not ( = ?auto_187440 ?auto_187441 ) ) ( not ( = ?auto_187440 ?auto_187442 ) ) ( not ( = ?auto_187440 ?auto_187443 ) ) ( not ( = ?auto_187440 ?auto_187444 ) ) ( not ( = ?auto_187440 ?auto_187445 ) ) ( not ( = ?auto_187441 ?auto_187442 ) ) ( not ( = ?auto_187441 ?auto_187443 ) ) ( not ( = ?auto_187441 ?auto_187444 ) ) ( not ( = ?auto_187441 ?auto_187445 ) ) ( not ( = ?auto_187442 ?auto_187443 ) ) ( not ( = ?auto_187442 ?auto_187444 ) ) ( not ( = ?auto_187442 ?auto_187445 ) ) ( not ( = ?auto_187443 ?auto_187444 ) ) ( not ( = ?auto_187443 ?auto_187445 ) ) ( not ( = ?auto_187444 ?auto_187445 ) ) ( not ( = ?auto_187439 ?auto_187447 ) ) ( not ( = ?auto_187440 ?auto_187447 ) ) ( not ( = ?auto_187441 ?auto_187447 ) ) ( not ( = ?auto_187442 ?auto_187447 ) ) ( not ( = ?auto_187443 ?auto_187447 ) ) ( not ( = ?auto_187444 ?auto_187447 ) ) ( not ( = ?auto_187445 ?auto_187447 ) ) ( ON-TABLE ?auto_187447 ) ( ON ?auto_187439 ?auto_187446 ) ( not ( = ?auto_187439 ?auto_187446 ) ) ( not ( = ?auto_187440 ?auto_187446 ) ) ( not ( = ?auto_187441 ?auto_187446 ) ) ( not ( = ?auto_187442 ?auto_187446 ) ) ( not ( = ?auto_187443 ?auto_187446 ) ) ( not ( = ?auto_187444 ?auto_187446 ) ) ( not ( = ?auto_187445 ?auto_187446 ) ) ( not ( = ?auto_187447 ?auto_187446 ) ) ( ON ?auto_187440 ?auto_187439 ) ( ON-TABLE ?auto_187446 ) ( ON ?auto_187441 ?auto_187440 ) ( ON ?auto_187442 ?auto_187441 ) ( ON ?auto_187443 ?auto_187442 ) ( ON ?auto_187444 ?auto_187443 ) ( CLEAR ?auto_187447 ) ( ON ?auto_187445 ?auto_187444 ) ( CLEAR ?auto_187445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187446 ?auto_187439 ?auto_187440 ?auto_187441 ?auto_187442 ?auto_187443 ?auto_187444 )
      ( MAKE-7PILE ?auto_187439 ?auto_187440 ?auto_187441 ?auto_187442 ?auto_187443 ?auto_187444 ?auto_187445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187448 - BLOCK
      ?auto_187449 - BLOCK
      ?auto_187450 - BLOCK
      ?auto_187451 - BLOCK
      ?auto_187452 - BLOCK
      ?auto_187453 - BLOCK
      ?auto_187454 - BLOCK
    )
    :vars
    (
      ?auto_187456 - BLOCK
      ?auto_187455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187448 ?auto_187449 ) ) ( not ( = ?auto_187448 ?auto_187450 ) ) ( not ( = ?auto_187448 ?auto_187451 ) ) ( not ( = ?auto_187448 ?auto_187452 ) ) ( not ( = ?auto_187448 ?auto_187453 ) ) ( not ( = ?auto_187448 ?auto_187454 ) ) ( not ( = ?auto_187449 ?auto_187450 ) ) ( not ( = ?auto_187449 ?auto_187451 ) ) ( not ( = ?auto_187449 ?auto_187452 ) ) ( not ( = ?auto_187449 ?auto_187453 ) ) ( not ( = ?auto_187449 ?auto_187454 ) ) ( not ( = ?auto_187450 ?auto_187451 ) ) ( not ( = ?auto_187450 ?auto_187452 ) ) ( not ( = ?auto_187450 ?auto_187453 ) ) ( not ( = ?auto_187450 ?auto_187454 ) ) ( not ( = ?auto_187451 ?auto_187452 ) ) ( not ( = ?auto_187451 ?auto_187453 ) ) ( not ( = ?auto_187451 ?auto_187454 ) ) ( not ( = ?auto_187452 ?auto_187453 ) ) ( not ( = ?auto_187452 ?auto_187454 ) ) ( not ( = ?auto_187453 ?auto_187454 ) ) ( not ( = ?auto_187448 ?auto_187456 ) ) ( not ( = ?auto_187449 ?auto_187456 ) ) ( not ( = ?auto_187450 ?auto_187456 ) ) ( not ( = ?auto_187451 ?auto_187456 ) ) ( not ( = ?auto_187452 ?auto_187456 ) ) ( not ( = ?auto_187453 ?auto_187456 ) ) ( not ( = ?auto_187454 ?auto_187456 ) ) ( ON ?auto_187448 ?auto_187455 ) ( not ( = ?auto_187448 ?auto_187455 ) ) ( not ( = ?auto_187449 ?auto_187455 ) ) ( not ( = ?auto_187450 ?auto_187455 ) ) ( not ( = ?auto_187451 ?auto_187455 ) ) ( not ( = ?auto_187452 ?auto_187455 ) ) ( not ( = ?auto_187453 ?auto_187455 ) ) ( not ( = ?auto_187454 ?auto_187455 ) ) ( not ( = ?auto_187456 ?auto_187455 ) ) ( ON ?auto_187449 ?auto_187448 ) ( ON-TABLE ?auto_187455 ) ( ON ?auto_187450 ?auto_187449 ) ( ON ?auto_187451 ?auto_187450 ) ( ON ?auto_187452 ?auto_187451 ) ( ON ?auto_187453 ?auto_187452 ) ( ON ?auto_187454 ?auto_187453 ) ( CLEAR ?auto_187454 ) ( HOLDING ?auto_187456 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187456 )
      ( MAKE-7PILE ?auto_187448 ?auto_187449 ?auto_187450 ?auto_187451 ?auto_187452 ?auto_187453 ?auto_187454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187457 - BLOCK
      ?auto_187458 - BLOCK
      ?auto_187459 - BLOCK
      ?auto_187460 - BLOCK
      ?auto_187461 - BLOCK
      ?auto_187462 - BLOCK
      ?auto_187463 - BLOCK
    )
    :vars
    (
      ?auto_187465 - BLOCK
      ?auto_187464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187457 ?auto_187458 ) ) ( not ( = ?auto_187457 ?auto_187459 ) ) ( not ( = ?auto_187457 ?auto_187460 ) ) ( not ( = ?auto_187457 ?auto_187461 ) ) ( not ( = ?auto_187457 ?auto_187462 ) ) ( not ( = ?auto_187457 ?auto_187463 ) ) ( not ( = ?auto_187458 ?auto_187459 ) ) ( not ( = ?auto_187458 ?auto_187460 ) ) ( not ( = ?auto_187458 ?auto_187461 ) ) ( not ( = ?auto_187458 ?auto_187462 ) ) ( not ( = ?auto_187458 ?auto_187463 ) ) ( not ( = ?auto_187459 ?auto_187460 ) ) ( not ( = ?auto_187459 ?auto_187461 ) ) ( not ( = ?auto_187459 ?auto_187462 ) ) ( not ( = ?auto_187459 ?auto_187463 ) ) ( not ( = ?auto_187460 ?auto_187461 ) ) ( not ( = ?auto_187460 ?auto_187462 ) ) ( not ( = ?auto_187460 ?auto_187463 ) ) ( not ( = ?auto_187461 ?auto_187462 ) ) ( not ( = ?auto_187461 ?auto_187463 ) ) ( not ( = ?auto_187462 ?auto_187463 ) ) ( not ( = ?auto_187457 ?auto_187465 ) ) ( not ( = ?auto_187458 ?auto_187465 ) ) ( not ( = ?auto_187459 ?auto_187465 ) ) ( not ( = ?auto_187460 ?auto_187465 ) ) ( not ( = ?auto_187461 ?auto_187465 ) ) ( not ( = ?auto_187462 ?auto_187465 ) ) ( not ( = ?auto_187463 ?auto_187465 ) ) ( ON ?auto_187457 ?auto_187464 ) ( not ( = ?auto_187457 ?auto_187464 ) ) ( not ( = ?auto_187458 ?auto_187464 ) ) ( not ( = ?auto_187459 ?auto_187464 ) ) ( not ( = ?auto_187460 ?auto_187464 ) ) ( not ( = ?auto_187461 ?auto_187464 ) ) ( not ( = ?auto_187462 ?auto_187464 ) ) ( not ( = ?auto_187463 ?auto_187464 ) ) ( not ( = ?auto_187465 ?auto_187464 ) ) ( ON ?auto_187458 ?auto_187457 ) ( ON-TABLE ?auto_187464 ) ( ON ?auto_187459 ?auto_187458 ) ( ON ?auto_187460 ?auto_187459 ) ( ON ?auto_187461 ?auto_187460 ) ( ON ?auto_187462 ?auto_187461 ) ( ON ?auto_187463 ?auto_187462 ) ( ON ?auto_187465 ?auto_187463 ) ( CLEAR ?auto_187465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187464 ?auto_187457 ?auto_187458 ?auto_187459 ?auto_187460 ?auto_187461 ?auto_187462 ?auto_187463 )
      ( MAKE-7PILE ?auto_187457 ?auto_187458 ?auto_187459 ?auto_187460 ?auto_187461 ?auto_187462 ?auto_187463 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187474 - BLOCK
      ?auto_187475 - BLOCK
      ?auto_187476 - BLOCK
      ?auto_187477 - BLOCK
      ?auto_187478 - BLOCK
      ?auto_187479 - BLOCK
      ?auto_187480 - BLOCK
      ?auto_187481 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_187481 ) ( CLEAR ?auto_187480 ) ( ON-TABLE ?auto_187474 ) ( ON ?auto_187475 ?auto_187474 ) ( ON ?auto_187476 ?auto_187475 ) ( ON ?auto_187477 ?auto_187476 ) ( ON ?auto_187478 ?auto_187477 ) ( ON ?auto_187479 ?auto_187478 ) ( ON ?auto_187480 ?auto_187479 ) ( not ( = ?auto_187474 ?auto_187475 ) ) ( not ( = ?auto_187474 ?auto_187476 ) ) ( not ( = ?auto_187474 ?auto_187477 ) ) ( not ( = ?auto_187474 ?auto_187478 ) ) ( not ( = ?auto_187474 ?auto_187479 ) ) ( not ( = ?auto_187474 ?auto_187480 ) ) ( not ( = ?auto_187474 ?auto_187481 ) ) ( not ( = ?auto_187475 ?auto_187476 ) ) ( not ( = ?auto_187475 ?auto_187477 ) ) ( not ( = ?auto_187475 ?auto_187478 ) ) ( not ( = ?auto_187475 ?auto_187479 ) ) ( not ( = ?auto_187475 ?auto_187480 ) ) ( not ( = ?auto_187475 ?auto_187481 ) ) ( not ( = ?auto_187476 ?auto_187477 ) ) ( not ( = ?auto_187476 ?auto_187478 ) ) ( not ( = ?auto_187476 ?auto_187479 ) ) ( not ( = ?auto_187476 ?auto_187480 ) ) ( not ( = ?auto_187476 ?auto_187481 ) ) ( not ( = ?auto_187477 ?auto_187478 ) ) ( not ( = ?auto_187477 ?auto_187479 ) ) ( not ( = ?auto_187477 ?auto_187480 ) ) ( not ( = ?auto_187477 ?auto_187481 ) ) ( not ( = ?auto_187478 ?auto_187479 ) ) ( not ( = ?auto_187478 ?auto_187480 ) ) ( not ( = ?auto_187478 ?auto_187481 ) ) ( not ( = ?auto_187479 ?auto_187480 ) ) ( not ( = ?auto_187479 ?auto_187481 ) ) ( not ( = ?auto_187480 ?auto_187481 ) ) )
    :subtasks
    ( ( !STACK ?auto_187481 ?auto_187480 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187482 - BLOCK
      ?auto_187483 - BLOCK
      ?auto_187484 - BLOCK
      ?auto_187485 - BLOCK
      ?auto_187486 - BLOCK
      ?auto_187487 - BLOCK
      ?auto_187488 - BLOCK
      ?auto_187489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187488 ) ( ON-TABLE ?auto_187482 ) ( ON ?auto_187483 ?auto_187482 ) ( ON ?auto_187484 ?auto_187483 ) ( ON ?auto_187485 ?auto_187484 ) ( ON ?auto_187486 ?auto_187485 ) ( ON ?auto_187487 ?auto_187486 ) ( ON ?auto_187488 ?auto_187487 ) ( not ( = ?auto_187482 ?auto_187483 ) ) ( not ( = ?auto_187482 ?auto_187484 ) ) ( not ( = ?auto_187482 ?auto_187485 ) ) ( not ( = ?auto_187482 ?auto_187486 ) ) ( not ( = ?auto_187482 ?auto_187487 ) ) ( not ( = ?auto_187482 ?auto_187488 ) ) ( not ( = ?auto_187482 ?auto_187489 ) ) ( not ( = ?auto_187483 ?auto_187484 ) ) ( not ( = ?auto_187483 ?auto_187485 ) ) ( not ( = ?auto_187483 ?auto_187486 ) ) ( not ( = ?auto_187483 ?auto_187487 ) ) ( not ( = ?auto_187483 ?auto_187488 ) ) ( not ( = ?auto_187483 ?auto_187489 ) ) ( not ( = ?auto_187484 ?auto_187485 ) ) ( not ( = ?auto_187484 ?auto_187486 ) ) ( not ( = ?auto_187484 ?auto_187487 ) ) ( not ( = ?auto_187484 ?auto_187488 ) ) ( not ( = ?auto_187484 ?auto_187489 ) ) ( not ( = ?auto_187485 ?auto_187486 ) ) ( not ( = ?auto_187485 ?auto_187487 ) ) ( not ( = ?auto_187485 ?auto_187488 ) ) ( not ( = ?auto_187485 ?auto_187489 ) ) ( not ( = ?auto_187486 ?auto_187487 ) ) ( not ( = ?auto_187486 ?auto_187488 ) ) ( not ( = ?auto_187486 ?auto_187489 ) ) ( not ( = ?auto_187487 ?auto_187488 ) ) ( not ( = ?auto_187487 ?auto_187489 ) ) ( not ( = ?auto_187488 ?auto_187489 ) ) ( ON-TABLE ?auto_187489 ) ( CLEAR ?auto_187489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_187489 )
      ( MAKE-8PILE ?auto_187482 ?auto_187483 ?auto_187484 ?auto_187485 ?auto_187486 ?auto_187487 ?auto_187488 ?auto_187489 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187490 - BLOCK
      ?auto_187491 - BLOCK
      ?auto_187492 - BLOCK
      ?auto_187493 - BLOCK
      ?auto_187494 - BLOCK
      ?auto_187495 - BLOCK
      ?auto_187496 - BLOCK
      ?auto_187497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187490 ) ( ON ?auto_187491 ?auto_187490 ) ( ON ?auto_187492 ?auto_187491 ) ( ON ?auto_187493 ?auto_187492 ) ( ON ?auto_187494 ?auto_187493 ) ( ON ?auto_187495 ?auto_187494 ) ( not ( = ?auto_187490 ?auto_187491 ) ) ( not ( = ?auto_187490 ?auto_187492 ) ) ( not ( = ?auto_187490 ?auto_187493 ) ) ( not ( = ?auto_187490 ?auto_187494 ) ) ( not ( = ?auto_187490 ?auto_187495 ) ) ( not ( = ?auto_187490 ?auto_187496 ) ) ( not ( = ?auto_187490 ?auto_187497 ) ) ( not ( = ?auto_187491 ?auto_187492 ) ) ( not ( = ?auto_187491 ?auto_187493 ) ) ( not ( = ?auto_187491 ?auto_187494 ) ) ( not ( = ?auto_187491 ?auto_187495 ) ) ( not ( = ?auto_187491 ?auto_187496 ) ) ( not ( = ?auto_187491 ?auto_187497 ) ) ( not ( = ?auto_187492 ?auto_187493 ) ) ( not ( = ?auto_187492 ?auto_187494 ) ) ( not ( = ?auto_187492 ?auto_187495 ) ) ( not ( = ?auto_187492 ?auto_187496 ) ) ( not ( = ?auto_187492 ?auto_187497 ) ) ( not ( = ?auto_187493 ?auto_187494 ) ) ( not ( = ?auto_187493 ?auto_187495 ) ) ( not ( = ?auto_187493 ?auto_187496 ) ) ( not ( = ?auto_187493 ?auto_187497 ) ) ( not ( = ?auto_187494 ?auto_187495 ) ) ( not ( = ?auto_187494 ?auto_187496 ) ) ( not ( = ?auto_187494 ?auto_187497 ) ) ( not ( = ?auto_187495 ?auto_187496 ) ) ( not ( = ?auto_187495 ?auto_187497 ) ) ( not ( = ?auto_187496 ?auto_187497 ) ) ( ON-TABLE ?auto_187497 ) ( CLEAR ?auto_187497 ) ( HOLDING ?auto_187496 ) ( CLEAR ?auto_187495 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187490 ?auto_187491 ?auto_187492 ?auto_187493 ?auto_187494 ?auto_187495 ?auto_187496 )
      ( MAKE-8PILE ?auto_187490 ?auto_187491 ?auto_187492 ?auto_187493 ?auto_187494 ?auto_187495 ?auto_187496 ?auto_187497 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187498 - BLOCK
      ?auto_187499 - BLOCK
      ?auto_187500 - BLOCK
      ?auto_187501 - BLOCK
      ?auto_187502 - BLOCK
      ?auto_187503 - BLOCK
      ?auto_187504 - BLOCK
      ?auto_187505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187498 ) ( ON ?auto_187499 ?auto_187498 ) ( ON ?auto_187500 ?auto_187499 ) ( ON ?auto_187501 ?auto_187500 ) ( ON ?auto_187502 ?auto_187501 ) ( ON ?auto_187503 ?auto_187502 ) ( not ( = ?auto_187498 ?auto_187499 ) ) ( not ( = ?auto_187498 ?auto_187500 ) ) ( not ( = ?auto_187498 ?auto_187501 ) ) ( not ( = ?auto_187498 ?auto_187502 ) ) ( not ( = ?auto_187498 ?auto_187503 ) ) ( not ( = ?auto_187498 ?auto_187504 ) ) ( not ( = ?auto_187498 ?auto_187505 ) ) ( not ( = ?auto_187499 ?auto_187500 ) ) ( not ( = ?auto_187499 ?auto_187501 ) ) ( not ( = ?auto_187499 ?auto_187502 ) ) ( not ( = ?auto_187499 ?auto_187503 ) ) ( not ( = ?auto_187499 ?auto_187504 ) ) ( not ( = ?auto_187499 ?auto_187505 ) ) ( not ( = ?auto_187500 ?auto_187501 ) ) ( not ( = ?auto_187500 ?auto_187502 ) ) ( not ( = ?auto_187500 ?auto_187503 ) ) ( not ( = ?auto_187500 ?auto_187504 ) ) ( not ( = ?auto_187500 ?auto_187505 ) ) ( not ( = ?auto_187501 ?auto_187502 ) ) ( not ( = ?auto_187501 ?auto_187503 ) ) ( not ( = ?auto_187501 ?auto_187504 ) ) ( not ( = ?auto_187501 ?auto_187505 ) ) ( not ( = ?auto_187502 ?auto_187503 ) ) ( not ( = ?auto_187502 ?auto_187504 ) ) ( not ( = ?auto_187502 ?auto_187505 ) ) ( not ( = ?auto_187503 ?auto_187504 ) ) ( not ( = ?auto_187503 ?auto_187505 ) ) ( not ( = ?auto_187504 ?auto_187505 ) ) ( ON-TABLE ?auto_187505 ) ( CLEAR ?auto_187503 ) ( ON ?auto_187504 ?auto_187505 ) ( CLEAR ?auto_187504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187505 )
      ( MAKE-8PILE ?auto_187498 ?auto_187499 ?auto_187500 ?auto_187501 ?auto_187502 ?auto_187503 ?auto_187504 ?auto_187505 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187506 - BLOCK
      ?auto_187507 - BLOCK
      ?auto_187508 - BLOCK
      ?auto_187509 - BLOCK
      ?auto_187510 - BLOCK
      ?auto_187511 - BLOCK
      ?auto_187512 - BLOCK
      ?auto_187513 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187506 ) ( ON ?auto_187507 ?auto_187506 ) ( ON ?auto_187508 ?auto_187507 ) ( ON ?auto_187509 ?auto_187508 ) ( ON ?auto_187510 ?auto_187509 ) ( not ( = ?auto_187506 ?auto_187507 ) ) ( not ( = ?auto_187506 ?auto_187508 ) ) ( not ( = ?auto_187506 ?auto_187509 ) ) ( not ( = ?auto_187506 ?auto_187510 ) ) ( not ( = ?auto_187506 ?auto_187511 ) ) ( not ( = ?auto_187506 ?auto_187512 ) ) ( not ( = ?auto_187506 ?auto_187513 ) ) ( not ( = ?auto_187507 ?auto_187508 ) ) ( not ( = ?auto_187507 ?auto_187509 ) ) ( not ( = ?auto_187507 ?auto_187510 ) ) ( not ( = ?auto_187507 ?auto_187511 ) ) ( not ( = ?auto_187507 ?auto_187512 ) ) ( not ( = ?auto_187507 ?auto_187513 ) ) ( not ( = ?auto_187508 ?auto_187509 ) ) ( not ( = ?auto_187508 ?auto_187510 ) ) ( not ( = ?auto_187508 ?auto_187511 ) ) ( not ( = ?auto_187508 ?auto_187512 ) ) ( not ( = ?auto_187508 ?auto_187513 ) ) ( not ( = ?auto_187509 ?auto_187510 ) ) ( not ( = ?auto_187509 ?auto_187511 ) ) ( not ( = ?auto_187509 ?auto_187512 ) ) ( not ( = ?auto_187509 ?auto_187513 ) ) ( not ( = ?auto_187510 ?auto_187511 ) ) ( not ( = ?auto_187510 ?auto_187512 ) ) ( not ( = ?auto_187510 ?auto_187513 ) ) ( not ( = ?auto_187511 ?auto_187512 ) ) ( not ( = ?auto_187511 ?auto_187513 ) ) ( not ( = ?auto_187512 ?auto_187513 ) ) ( ON-TABLE ?auto_187513 ) ( ON ?auto_187512 ?auto_187513 ) ( CLEAR ?auto_187512 ) ( HOLDING ?auto_187511 ) ( CLEAR ?auto_187510 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187506 ?auto_187507 ?auto_187508 ?auto_187509 ?auto_187510 ?auto_187511 )
      ( MAKE-8PILE ?auto_187506 ?auto_187507 ?auto_187508 ?auto_187509 ?auto_187510 ?auto_187511 ?auto_187512 ?auto_187513 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187514 - BLOCK
      ?auto_187515 - BLOCK
      ?auto_187516 - BLOCK
      ?auto_187517 - BLOCK
      ?auto_187518 - BLOCK
      ?auto_187519 - BLOCK
      ?auto_187520 - BLOCK
      ?auto_187521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187514 ) ( ON ?auto_187515 ?auto_187514 ) ( ON ?auto_187516 ?auto_187515 ) ( ON ?auto_187517 ?auto_187516 ) ( ON ?auto_187518 ?auto_187517 ) ( not ( = ?auto_187514 ?auto_187515 ) ) ( not ( = ?auto_187514 ?auto_187516 ) ) ( not ( = ?auto_187514 ?auto_187517 ) ) ( not ( = ?auto_187514 ?auto_187518 ) ) ( not ( = ?auto_187514 ?auto_187519 ) ) ( not ( = ?auto_187514 ?auto_187520 ) ) ( not ( = ?auto_187514 ?auto_187521 ) ) ( not ( = ?auto_187515 ?auto_187516 ) ) ( not ( = ?auto_187515 ?auto_187517 ) ) ( not ( = ?auto_187515 ?auto_187518 ) ) ( not ( = ?auto_187515 ?auto_187519 ) ) ( not ( = ?auto_187515 ?auto_187520 ) ) ( not ( = ?auto_187515 ?auto_187521 ) ) ( not ( = ?auto_187516 ?auto_187517 ) ) ( not ( = ?auto_187516 ?auto_187518 ) ) ( not ( = ?auto_187516 ?auto_187519 ) ) ( not ( = ?auto_187516 ?auto_187520 ) ) ( not ( = ?auto_187516 ?auto_187521 ) ) ( not ( = ?auto_187517 ?auto_187518 ) ) ( not ( = ?auto_187517 ?auto_187519 ) ) ( not ( = ?auto_187517 ?auto_187520 ) ) ( not ( = ?auto_187517 ?auto_187521 ) ) ( not ( = ?auto_187518 ?auto_187519 ) ) ( not ( = ?auto_187518 ?auto_187520 ) ) ( not ( = ?auto_187518 ?auto_187521 ) ) ( not ( = ?auto_187519 ?auto_187520 ) ) ( not ( = ?auto_187519 ?auto_187521 ) ) ( not ( = ?auto_187520 ?auto_187521 ) ) ( ON-TABLE ?auto_187521 ) ( ON ?auto_187520 ?auto_187521 ) ( CLEAR ?auto_187518 ) ( ON ?auto_187519 ?auto_187520 ) ( CLEAR ?auto_187519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187521 ?auto_187520 )
      ( MAKE-8PILE ?auto_187514 ?auto_187515 ?auto_187516 ?auto_187517 ?auto_187518 ?auto_187519 ?auto_187520 ?auto_187521 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187522 - BLOCK
      ?auto_187523 - BLOCK
      ?auto_187524 - BLOCK
      ?auto_187525 - BLOCK
      ?auto_187526 - BLOCK
      ?auto_187527 - BLOCK
      ?auto_187528 - BLOCK
      ?auto_187529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187522 ) ( ON ?auto_187523 ?auto_187522 ) ( ON ?auto_187524 ?auto_187523 ) ( ON ?auto_187525 ?auto_187524 ) ( not ( = ?auto_187522 ?auto_187523 ) ) ( not ( = ?auto_187522 ?auto_187524 ) ) ( not ( = ?auto_187522 ?auto_187525 ) ) ( not ( = ?auto_187522 ?auto_187526 ) ) ( not ( = ?auto_187522 ?auto_187527 ) ) ( not ( = ?auto_187522 ?auto_187528 ) ) ( not ( = ?auto_187522 ?auto_187529 ) ) ( not ( = ?auto_187523 ?auto_187524 ) ) ( not ( = ?auto_187523 ?auto_187525 ) ) ( not ( = ?auto_187523 ?auto_187526 ) ) ( not ( = ?auto_187523 ?auto_187527 ) ) ( not ( = ?auto_187523 ?auto_187528 ) ) ( not ( = ?auto_187523 ?auto_187529 ) ) ( not ( = ?auto_187524 ?auto_187525 ) ) ( not ( = ?auto_187524 ?auto_187526 ) ) ( not ( = ?auto_187524 ?auto_187527 ) ) ( not ( = ?auto_187524 ?auto_187528 ) ) ( not ( = ?auto_187524 ?auto_187529 ) ) ( not ( = ?auto_187525 ?auto_187526 ) ) ( not ( = ?auto_187525 ?auto_187527 ) ) ( not ( = ?auto_187525 ?auto_187528 ) ) ( not ( = ?auto_187525 ?auto_187529 ) ) ( not ( = ?auto_187526 ?auto_187527 ) ) ( not ( = ?auto_187526 ?auto_187528 ) ) ( not ( = ?auto_187526 ?auto_187529 ) ) ( not ( = ?auto_187527 ?auto_187528 ) ) ( not ( = ?auto_187527 ?auto_187529 ) ) ( not ( = ?auto_187528 ?auto_187529 ) ) ( ON-TABLE ?auto_187529 ) ( ON ?auto_187528 ?auto_187529 ) ( ON ?auto_187527 ?auto_187528 ) ( CLEAR ?auto_187527 ) ( HOLDING ?auto_187526 ) ( CLEAR ?auto_187525 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187522 ?auto_187523 ?auto_187524 ?auto_187525 ?auto_187526 )
      ( MAKE-8PILE ?auto_187522 ?auto_187523 ?auto_187524 ?auto_187525 ?auto_187526 ?auto_187527 ?auto_187528 ?auto_187529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187530 - BLOCK
      ?auto_187531 - BLOCK
      ?auto_187532 - BLOCK
      ?auto_187533 - BLOCK
      ?auto_187534 - BLOCK
      ?auto_187535 - BLOCK
      ?auto_187536 - BLOCK
      ?auto_187537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187530 ) ( ON ?auto_187531 ?auto_187530 ) ( ON ?auto_187532 ?auto_187531 ) ( ON ?auto_187533 ?auto_187532 ) ( not ( = ?auto_187530 ?auto_187531 ) ) ( not ( = ?auto_187530 ?auto_187532 ) ) ( not ( = ?auto_187530 ?auto_187533 ) ) ( not ( = ?auto_187530 ?auto_187534 ) ) ( not ( = ?auto_187530 ?auto_187535 ) ) ( not ( = ?auto_187530 ?auto_187536 ) ) ( not ( = ?auto_187530 ?auto_187537 ) ) ( not ( = ?auto_187531 ?auto_187532 ) ) ( not ( = ?auto_187531 ?auto_187533 ) ) ( not ( = ?auto_187531 ?auto_187534 ) ) ( not ( = ?auto_187531 ?auto_187535 ) ) ( not ( = ?auto_187531 ?auto_187536 ) ) ( not ( = ?auto_187531 ?auto_187537 ) ) ( not ( = ?auto_187532 ?auto_187533 ) ) ( not ( = ?auto_187532 ?auto_187534 ) ) ( not ( = ?auto_187532 ?auto_187535 ) ) ( not ( = ?auto_187532 ?auto_187536 ) ) ( not ( = ?auto_187532 ?auto_187537 ) ) ( not ( = ?auto_187533 ?auto_187534 ) ) ( not ( = ?auto_187533 ?auto_187535 ) ) ( not ( = ?auto_187533 ?auto_187536 ) ) ( not ( = ?auto_187533 ?auto_187537 ) ) ( not ( = ?auto_187534 ?auto_187535 ) ) ( not ( = ?auto_187534 ?auto_187536 ) ) ( not ( = ?auto_187534 ?auto_187537 ) ) ( not ( = ?auto_187535 ?auto_187536 ) ) ( not ( = ?auto_187535 ?auto_187537 ) ) ( not ( = ?auto_187536 ?auto_187537 ) ) ( ON-TABLE ?auto_187537 ) ( ON ?auto_187536 ?auto_187537 ) ( ON ?auto_187535 ?auto_187536 ) ( CLEAR ?auto_187533 ) ( ON ?auto_187534 ?auto_187535 ) ( CLEAR ?auto_187534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187537 ?auto_187536 ?auto_187535 )
      ( MAKE-8PILE ?auto_187530 ?auto_187531 ?auto_187532 ?auto_187533 ?auto_187534 ?auto_187535 ?auto_187536 ?auto_187537 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187538 - BLOCK
      ?auto_187539 - BLOCK
      ?auto_187540 - BLOCK
      ?auto_187541 - BLOCK
      ?auto_187542 - BLOCK
      ?auto_187543 - BLOCK
      ?auto_187544 - BLOCK
      ?auto_187545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187538 ) ( ON ?auto_187539 ?auto_187538 ) ( ON ?auto_187540 ?auto_187539 ) ( not ( = ?auto_187538 ?auto_187539 ) ) ( not ( = ?auto_187538 ?auto_187540 ) ) ( not ( = ?auto_187538 ?auto_187541 ) ) ( not ( = ?auto_187538 ?auto_187542 ) ) ( not ( = ?auto_187538 ?auto_187543 ) ) ( not ( = ?auto_187538 ?auto_187544 ) ) ( not ( = ?auto_187538 ?auto_187545 ) ) ( not ( = ?auto_187539 ?auto_187540 ) ) ( not ( = ?auto_187539 ?auto_187541 ) ) ( not ( = ?auto_187539 ?auto_187542 ) ) ( not ( = ?auto_187539 ?auto_187543 ) ) ( not ( = ?auto_187539 ?auto_187544 ) ) ( not ( = ?auto_187539 ?auto_187545 ) ) ( not ( = ?auto_187540 ?auto_187541 ) ) ( not ( = ?auto_187540 ?auto_187542 ) ) ( not ( = ?auto_187540 ?auto_187543 ) ) ( not ( = ?auto_187540 ?auto_187544 ) ) ( not ( = ?auto_187540 ?auto_187545 ) ) ( not ( = ?auto_187541 ?auto_187542 ) ) ( not ( = ?auto_187541 ?auto_187543 ) ) ( not ( = ?auto_187541 ?auto_187544 ) ) ( not ( = ?auto_187541 ?auto_187545 ) ) ( not ( = ?auto_187542 ?auto_187543 ) ) ( not ( = ?auto_187542 ?auto_187544 ) ) ( not ( = ?auto_187542 ?auto_187545 ) ) ( not ( = ?auto_187543 ?auto_187544 ) ) ( not ( = ?auto_187543 ?auto_187545 ) ) ( not ( = ?auto_187544 ?auto_187545 ) ) ( ON-TABLE ?auto_187545 ) ( ON ?auto_187544 ?auto_187545 ) ( ON ?auto_187543 ?auto_187544 ) ( ON ?auto_187542 ?auto_187543 ) ( CLEAR ?auto_187542 ) ( HOLDING ?auto_187541 ) ( CLEAR ?auto_187540 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187538 ?auto_187539 ?auto_187540 ?auto_187541 )
      ( MAKE-8PILE ?auto_187538 ?auto_187539 ?auto_187540 ?auto_187541 ?auto_187542 ?auto_187543 ?auto_187544 ?auto_187545 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187546 - BLOCK
      ?auto_187547 - BLOCK
      ?auto_187548 - BLOCK
      ?auto_187549 - BLOCK
      ?auto_187550 - BLOCK
      ?auto_187551 - BLOCK
      ?auto_187552 - BLOCK
      ?auto_187553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187546 ) ( ON ?auto_187547 ?auto_187546 ) ( ON ?auto_187548 ?auto_187547 ) ( not ( = ?auto_187546 ?auto_187547 ) ) ( not ( = ?auto_187546 ?auto_187548 ) ) ( not ( = ?auto_187546 ?auto_187549 ) ) ( not ( = ?auto_187546 ?auto_187550 ) ) ( not ( = ?auto_187546 ?auto_187551 ) ) ( not ( = ?auto_187546 ?auto_187552 ) ) ( not ( = ?auto_187546 ?auto_187553 ) ) ( not ( = ?auto_187547 ?auto_187548 ) ) ( not ( = ?auto_187547 ?auto_187549 ) ) ( not ( = ?auto_187547 ?auto_187550 ) ) ( not ( = ?auto_187547 ?auto_187551 ) ) ( not ( = ?auto_187547 ?auto_187552 ) ) ( not ( = ?auto_187547 ?auto_187553 ) ) ( not ( = ?auto_187548 ?auto_187549 ) ) ( not ( = ?auto_187548 ?auto_187550 ) ) ( not ( = ?auto_187548 ?auto_187551 ) ) ( not ( = ?auto_187548 ?auto_187552 ) ) ( not ( = ?auto_187548 ?auto_187553 ) ) ( not ( = ?auto_187549 ?auto_187550 ) ) ( not ( = ?auto_187549 ?auto_187551 ) ) ( not ( = ?auto_187549 ?auto_187552 ) ) ( not ( = ?auto_187549 ?auto_187553 ) ) ( not ( = ?auto_187550 ?auto_187551 ) ) ( not ( = ?auto_187550 ?auto_187552 ) ) ( not ( = ?auto_187550 ?auto_187553 ) ) ( not ( = ?auto_187551 ?auto_187552 ) ) ( not ( = ?auto_187551 ?auto_187553 ) ) ( not ( = ?auto_187552 ?auto_187553 ) ) ( ON-TABLE ?auto_187553 ) ( ON ?auto_187552 ?auto_187553 ) ( ON ?auto_187551 ?auto_187552 ) ( ON ?auto_187550 ?auto_187551 ) ( CLEAR ?auto_187548 ) ( ON ?auto_187549 ?auto_187550 ) ( CLEAR ?auto_187549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187553 ?auto_187552 ?auto_187551 ?auto_187550 )
      ( MAKE-8PILE ?auto_187546 ?auto_187547 ?auto_187548 ?auto_187549 ?auto_187550 ?auto_187551 ?auto_187552 ?auto_187553 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187554 - BLOCK
      ?auto_187555 - BLOCK
      ?auto_187556 - BLOCK
      ?auto_187557 - BLOCK
      ?auto_187558 - BLOCK
      ?auto_187559 - BLOCK
      ?auto_187560 - BLOCK
      ?auto_187561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187554 ) ( ON ?auto_187555 ?auto_187554 ) ( not ( = ?auto_187554 ?auto_187555 ) ) ( not ( = ?auto_187554 ?auto_187556 ) ) ( not ( = ?auto_187554 ?auto_187557 ) ) ( not ( = ?auto_187554 ?auto_187558 ) ) ( not ( = ?auto_187554 ?auto_187559 ) ) ( not ( = ?auto_187554 ?auto_187560 ) ) ( not ( = ?auto_187554 ?auto_187561 ) ) ( not ( = ?auto_187555 ?auto_187556 ) ) ( not ( = ?auto_187555 ?auto_187557 ) ) ( not ( = ?auto_187555 ?auto_187558 ) ) ( not ( = ?auto_187555 ?auto_187559 ) ) ( not ( = ?auto_187555 ?auto_187560 ) ) ( not ( = ?auto_187555 ?auto_187561 ) ) ( not ( = ?auto_187556 ?auto_187557 ) ) ( not ( = ?auto_187556 ?auto_187558 ) ) ( not ( = ?auto_187556 ?auto_187559 ) ) ( not ( = ?auto_187556 ?auto_187560 ) ) ( not ( = ?auto_187556 ?auto_187561 ) ) ( not ( = ?auto_187557 ?auto_187558 ) ) ( not ( = ?auto_187557 ?auto_187559 ) ) ( not ( = ?auto_187557 ?auto_187560 ) ) ( not ( = ?auto_187557 ?auto_187561 ) ) ( not ( = ?auto_187558 ?auto_187559 ) ) ( not ( = ?auto_187558 ?auto_187560 ) ) ( not ( = ?auto_187558 ?auto_187561 ) ) ( not ( = ?auto_187559 ?auto_187560 ) ) ( not ( = ?auto_187559 ?auto_187561 ) ) ( not ( = ?auto_187560 ?auto_187561 ) ) ( ON-TABLE ?auto_187561 ) ( ON ?auto_187560 ?auto_187561 ) ( ON ?auto_187559 ?auto_187560 ) ( ON ?auto_187558 ?auto_187559 ) ( ON ?auto_187557 ?auto_187558 ) ( CLEAR ?auto_187557 ) ( HOLDING ?auto_187556 ) ( CLEAR ?auto_187555 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187554 ?auto_187555 ?auto_187556 )
      ( MAKE-8PILE ?auto_187554 ?auto_187555 ?auto_187556 ?auto_187557 ?auto_187558 ?auto_187559 ?auto_187560 ?auto_187561 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187562 - BLOCK
      ?auto_187563 - BLOCK
      ?auto_187564 - BLOCK
      ?auto_187565 - BLOCK
      ?auto_187566 - BLOCK
      ?auto_187567 - BLOCK
      ?auto_187568 - BLOCK
      ?auto_187569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187562 ) ( ON ?auto_187563 ?auto_187562 ) ( not ( = ?auto_187562 ?auto_187563 ) ) ( not ( = ?auto_187562 ?auto_187564 ) ) ( not ( = ?auto_187562 ?auto_187565 ) ) ( not ( = ?auto_187562 ?auto_187566 ) ) ( not ( = ?auto_187562 ?auto_187567 ) ) ( not ( = ?auto_187562 ?auto_187568 ) ) ( not ( = ?auto_187562 ?auto_187569 ) ) ( not ( = ?auto_187563 ?auto_187564 ) ) ( not ( = ?auto_187563 ?auto_187565 ) ) ( not ( = ?auto_187563 ?auto_187566 ) ) ( not ( = ?auto_187563 ?auto_187567 ) ) ( not ( = ?auto_187563 ?auto_187568 ) ) ( not ( = ?auto_187563 ?auto_187569 ) ) ( not ( = ?auto_187564 ?auto_187565 ) ) ( not ( = ?auto_187564 ?auto_187566 ) ) ( not ( = ?auto_187564 ?auto_187567 ) ) ( not ( = ?auto_187564 ?auto_187568 ) ) ( not ( = ?auto_187564 ?auto_187569 ) ) ( not ( = ?auto_187565 ?auto_187566 ) ) ( not ( = ?auto_187565 ?auto_187567 ) ) ( not ( = ?auto_187565 ?auto_187568 ) ) ( not ( = ?auto_187565 ?auto_187569 ) ) ( not ( = ?auto_187566 ?auto_187567 ) ) ( not ( = ?auto_187566 ?auto_187568 ) ) ( not ( = ?auto_187566 ?auto_187569 ) ) ( not ( = ?auto_187567 ?auto_187568 ) ) ( not ( = ?auto_187567 ?auto_187569 ) ) ( not ( = ?auto_187568 ?auto_187569 ) ) ( ON-TABLE ?auto_187569 ) ( ON ?auto_187568 ?auto_187569 ) ( ON ?auto_187567 ?auto_187568 ) ( ON ?auto_187566 ?auto_187567 ) ( ON ?auto_187565 ?auto_187566 ) ( CLEAR ?auto_187563 ) ( ON ?auto_187564 ?auto_187565 ) ( CLEAR ?auto_187564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187569 ?auto_187568 ?auto_187567 ?auto_187566 ?auto_187565 )
      ( MAKE-8PILE ?auto_187562 ?auto_187563 ?auto_187564 ?auto_187565 ?auto_187566 ?auto_187567 ?auto_187568 ?auto_187569 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187570 - BLOCK
      ?auto_187571 - BLOCK
      ?auto_187572 - BLOCK
      ?auto_187573 - BLOCK
      ?auto_187574 - BLOCK
      ?auto_187575 - BLOCK
      ?auto_187576 - BLOCK
      ?auto_187577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187570 ) ( not ( = ?auto_187570 ?auto_187571 ) ) ( not ( = ?auto_187570 ?auto_187572 ) ) ( not ( = ?auto_187570 ?auto_187573 ) ) ( not ( = ?auto_187570 ?auto_187574 ) ) ( not ( = ?auto_187570 ?auto_187575 ) ) ( not ( = ?auto_187570 ?auto_187576 ) ) ( not ( = ?auto_187570 ?auto_187577 ) ) ( not ( = ?auto_187571 ?auto_187572 ) ) ( not ( = ?auto_187571 ?auto_187573 ) ) ( not ( = ?auto_187571 ?auto_187574 ) ) ( not ( = ?auto_187571 ?auto_187575 ) ) ( not ( = ?auto_187571 ?auto_187576 ) ) ( not ( = ?auto_187571 ?auto_187577 ) ) ( not ( = ?auto_187572 ?auto_187573 ) ) ( not ( = ?auto_187572 ?auto_187574 ) ) ( not ( = ?auto_187572 ?auto_187575 ) ) ( not ( = ?auto_187572 ?auto_187576 ) ) ( not ( = ?auto_187572 ?auto_187577 ) ) ( not ( = ?auto_187573 ?auto_187574 ) ) ( not ( = ?auto_187573 ?auto_187575 ) ) ( not ( = ?auto_187573 ?auto_187576 ) ) ( not ( = ?auto_187573 ?auto_187577 ) ) ( not ( = ?auto_187574 ?auto_187575 ) ) ( not ( = ?auto_187574 ?auto_187576 ) ) ( not ( = ?auto_187574 ?auto_187577 ) ) ( not ( = ?auto_187575 ?auto_187576 ) ) ( not ( = ?auto_187575 ?auto_187577 ) ) ( not ( = ?auto_187576 ?auto_187577 ) ) ( ON-TABLE ?auto_187577 ) ( ON ?auto_187576 ?auto_187577 ) ( ON ?auto_187575 ?auto_187576 ) ( ON ?auto_187574 ?auto_187575 ) ( ON ?auto_187573 ?auto_187574 ) ( ON ?auto_187572 ?auto_187573 ) ( CLEAR ?auto_187572 ) ( HOLDING ?auto_187571 ) ( CLEAR ?auto_187570 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187570 ?auto_187571 )
      ( MAKE-8PILE ?auto_187570 ?auto_187571 ?auto_187572 ?auto_187573 ?auto_187574 ?auto_187575 ?auto_187576 ?auto_187577 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187578 - BLOCK
      ?auto_187579 - BLOCK
      ?auto_187580 - BLOCK
      ?auto_187581 - BLOCK
      ?auto_187582 - BLOCK
      ?auto_187583 - BLOCK
      ?auto_187584 - BLOCK
      ?auto_187585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187578 ) ( not ( = ?auto_187578 ?auto_187579 ) ) ( not ( = ?auto_187578 ?auto_187580 ) ) ( not ( = ?auto_187578 ?auto_187581 ) ) ( not ( = ?auto_187578 ?auto_187582 ) ) ( not ( = ?auto_187578 ?auto_187583 ) ) ( not ( = ?auto_187578 ?auto_187584 ) ) ( not ( = ?auto_187578 ?auto_187585 ) ) ( not ( = ?auto_187579 ?auto_187580 ) ) ( not ( = ?auto_187579 ?auto_187581 ) ) ( not ( = ?auto_187579 ?auto_187582 ) ) ( not ( = ?auto_187579 ?auto_187583 ) ) ( not ( = ?auto_187579 ?auto_187584 ) ) ( not ( = ?auto_187579 ?auto_187585 ) ) ( not ( = ?auto_187580 ?auto_187581 ) ) ( not ( = ?auto_187580 ?auto_187582 ) ) ( not ( = ?auto_187580 ?auto_187583 ) ) ( not ( = ?auto_187580 ?auto_187584 ) ) ( not ( = ?auto_187580 ?auto_187585 ) ) ( not ( = ?auto_187581 ?auto_187582 ) ) ( not ( = ?auto_187581 ?auto_187583 ) ) ( not ( = ?auto_187581 ?auto_187584 ) ) ( not ( = ?auto_187581 ?auto_187585 ) ) ( not ( = ?auto_187582 ?auto_187583 ) ) ( not ( = ?auto_187582 ?auto_187584 ) ) ( not ( = ?auto_187582 ?auto_187585 ) ) ( not ( = ?auto_187583 ?auto_187584 ) ) ( not ( = ?auto_187583 ?auto_187585 ) ) ( not ( = ?auto_187584 ?auto_187585 ) ) ( ON-TABLE ?auto_187585 ) ( ON ?auto_187584 ?auto_187585 ) ( ON ?auto_187583 ?auto_187584 ) ( ON ?auto_187582 ?auto_187583 ) ( ON ?auto_187581 ?auto_187582 ) ( ON ?auto_187580 ?auto_187581 ) ( CLEAR ?auto_187578 ) ( ON ?auto_187579 ?auto_187580 ) ( CLEAR ?auto_187579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187585 ?auto_187584 ?auto_187583 ?auto_187582 ?auto_187581 ?auto_187580 )
      ( MAKE-8PILE ?auto_187578 ?auto_187579 ?auto_187580 ?auto_187581 ?auto_187582 ?auto_187583 ?auto_187584 ?auto_187585 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187586 - BLOCK
      ?auto_187587 - BLOCK
      ?auto_187588 - BLOCK
      ?auto_187589 - BLOCK
      ?auto_187590 - BLOCK
      ?auto_187591 - BLOCK
      ?auto_187592 - BLOCK
      ?auto_187593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187586 ?auto_187587 ) ) ( not ( = ?auto_187586 ?auto_187588 ) ) ( not ( = ?auto_187586 ?auto_187589 ) ) ( not ( = ?auto_187586 ?auto_187590 ) ) ( not ( = ?auto_187586 ?auto_187591 ) ) ( not ( = ?auto_187586 ?auto_187592 ) ) ( not ( = ?auto_187586 ?auto_187593 ) ) ( not ( = ?auto_187587 ?auto_187588 ) ) ( not ( = ?auto_187587 ?auto_187589 ) ) ( not ( = ?auto_187587 ?auto_187590 ) ) ( not ( = ?auto_187587 ?auto_187591 ) ) ( not ( = ?auto_187587 ?auto_187592 ) ) ( not ( = ?auto_187587 ?auto_187593 ) ) ( not ( = ?auto_187588 ?auto_187589 ) ) ( not ( = ?auto_187588 ?auto_187590 ) ) ( not ( = ?auto_187588 ?auto_187591 ) ) ( not ( = ?auto_187588 ?auto_187592 ) ) ( not ( = ?auto_187588 ?auto_187593 ) ) ( not ( = ?auto_187589 ?auto_187590 ) ) ( not ( = ?auto_187589 ?auto_187591 ) ) ( not ( = ?auto_187589 ?auto_187592 ) ) ( not ( = ?auto_187589 ?auto_187593 ) ) ( not ( = ?auto_187590 ?auto_187591 ) ) ( not ( = ?auto_187590 ?auto_187592 ) ) ( not ( = ?auto_187590 ?auto_187593 ) ) ( not ( = ?auto_187591 ?auto_187592 ) ) ( not ( = ?auto_187591 ?auto_187593 ) ) ( not ( = ?auto_187592 ?auto_187593 ) ) ( ON-TABLE ?auto_187593 ) ( ON ?auto_187592 ?auto_187593 ) ( ON ?auto_187591 ?auto_187592 ) ( ON ?auto_187590 ?auto_187591 ) ( ON ?auto_187589 ?auto_187590 ) ( ON ?auto_187588 ?auto_187589 ) ( ON ?auto_187587 ?auto_187588 ) ( CLEAR ?auto_187587 ) ( HOLDING ?auto_187586 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187586 )
      ( MAKE-8PILE ?auto_187586 ?auto_187587 ?auto_187588 ?auto_187589 ?auto_187590 ?auto_187591 ?auto_187592 ?auto_187593 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187594 - BLOCK
      ?auto_187595 - BLOCK
      ?auto_187596 - BLOCK
      ?auto_187597 - BLOCK
      ?auto_187598 - BLOCK
      ?auto_187599 - BLOCK
      ?auto_187600 - BLOCK
      ?auto_187601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187594 ?auto_187595 ) ) ( not ( = ?auto_187594 ?auto_187596 ) ) ( not ( = ?auto_187594 ?auto_187597 ) ) ( not ( = ?auto_187594 ?auto_187598 ) ) ( not ( = ?auto_187594 ?auto_187599 ) ) ( not ( = ?auto_187594 ?auto_187600 ) ) ( not ( = ?auto_187594 ?auto_187601 ) ) ( not ( = ?auto_187595 ?auto_187596 ) ) ( not ( = ?auto_187595 ?auto_187597 ) ) ( not ( = ?auto_187595 ?auto_187598 ) ) ( not ( = ?auto_187595 ?auto_187599 ) ) ( not ( = ?auto_187595 ?auto_187600 ) ) ( not ( = ?auto_187595 ?auto_187601 ) ) ( not ( = ?auto_187596 ?auto_187597 ) ) ( not ( = ?auto_187596 ?auto_187598 ) ) ( not ( = ?auto_187596 ?auto_187599 ) ) ( not ( = ?auto_187596 ?auto_187600 ) ) ( not ( = ?auto_187596 ?auto_187601 ) ) ( not ( = ?auto_187597 ?auto_187598 ) ) ( not ( = ?auto_187597 ?auto_187599 ) ) ( not ( = ?auto_187597 ?auto_187600 ) ) ( not ( = ?auto_187597 ?auto_187601 ) ) ( not ( = ?auto_187598 ?auto_187599 ) ) ( not ( = ?auto_187598 ?auto_187600 ) ) ( not ( = ?auto_187598 ?auto_187601 ) ) ( not ( = ?auto_187599 ?auto_187600 ) ) ( not ( = ?auto_187599 ?auto_187601 ) ) ( not ( = ?auto_187600 ?auto_187601 ) ) ( ON-TABLE ?auto_187601 ) ( ON ?auto_187600 ?auto_187601 ) ( ON ?auto_187599 ?auto_187600 ) ( ON ?auto_187598 ?auto_187599 ) ( ON ?auto_187597 ?auto_187598 ) ( ON ?auto_187596 ?auto_187597 ) ( ON ?auto_187595 ?auto_187596 ) ( ON ?auto_187594 ?auto_187595 ) ( CLEAR ?auto_187594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187601 ?auto_187600 ?auto_187599 ?auto_187598 ?auto_187597 ?auto_187596 ?auto_187595 )
      ( MAKE-8PILE ?auto_187594 ?auto_187595 ?auto_187596 ?auto_187597 ?auto_187598 ?auto_187599 ?auto_187600 ?auto_187601 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187602 - BLOCK
      ?auto_187603 - BLOCK
      ?auto_187604 - BLOCK
      ?auto_187605 - BLOCK
      ?auto_187606 - BLOCK
      ?auto_187607 - BLOCK
      ?auto_187608 - BLOCK
      ?auto_187609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187602 ?auto_187603 ) ) ( not ( = ?auto_187602 ?auto_187604 ) ) ( not ( = ?auto_187602 ?auto_187605 ) ) ( not ( = ?auto_187602 ?auto_187606 ) ) ( not ( = ?auto_187602 ?auto_187607 ) ) ( not ( = ?auto_187602 ?auto_187608 ) ) ( not ( = ?auto_187602 ?auto_187609 ) ) ( not ( = ?auto_187603 ?auto_187604 ) ) ( not ( = ?auto_187603 ?auto_187605 ) ) ( not ( = ?auto_187603 ?auto_187606 ) ) ( not ( = ?auto_187603 ?auto_187607 ) ) ( not ( = ?auto_187603 ?auto_187608 ) ) ( not ( = ?auto_187603 ?auto_187609 ) ) ( not ( = ?auto_187604 ?auto_187605 ) ) ( not ( = ?auto_187604 ?auto_187606 ) ) ( not ( = ?auto_187604 ?auto_187607 ) ) ( not ( = ?auto_187604 ?auto_187608 ) ) ( not ( = ?auto_187604 ?auto_187609 ) ) ( not ( = ?auto_187605 ?auto_187606 ) ) ( not ( = ?auto_187605 ?auto_187607 ) ) ( not ( = ?auto_187605 ?auto_187608 ) ) ( not ( = ?auto_187605 ?auto_187609 ) ) ( not ( = ?auto_187606 ?auto_187607 ) ) ( not ( = ?auto_187606 ?auto_187608 ) ) ( not ( = ?auto_187606 ?auto_187609 ) ) ( not ( = ?auto_187607 ?auto_187608 ) ) ( not ( = ?auto_187607 ?auto_187609 ) ) ( not ( = ?auto_187608 ?auto_187609 ) ) ( ON-TABLE ?auto_187609 ) ( ON ?auto_187608 ?auto_187609 ) ( ON ?auto_187607 ?auto_187608 ) ( ON ?auto_187606 ?auto_187607 ) ( ON ?auto_187605 ?auto_187606 ) ( ON ?auto_187604 ?auto_187605 ) ( ON ?auto_187603 ?auto_187604 ) ( HOLDING ?auto_187602 ) ( CLEAR ?auto_187603 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187609 ?auto_187608 ?auto_187607 ?auto_187606 ?auto_187605 ?auto_187604 ?auto_187603 ?auto_187602 )
      ( MAKE-8PILE ?auto_187602 ?auto_187603 ?auto_187604 ?auto_187605 ?auto_187606 ?auto_187607 ?auto_187608 ?auto_187609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187610 - BLOCK
      ?auto_187611 - BLOCK
      ?auto_187612 - BLOCK
      ?auto_187613 - BLOCK
      ?auto_187614 - BLOCK
      ?auto_187615 - BLOCK
      ?auto_187616 - BLOCK
      ?auto_187617 - BLOCK
    )
    :vars
    (
      ?auto_187618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187610 ?auto_187611 ) ) ( not ( = ?auto_187610 ?auto_187612 ) ) ( not ( = ?auto_187610 ?auto_187613 ) ) ( not ( = ?auto_187610 ?auto_187614 ) ) ( not ( = ?auto_187610 ?auto_187615 ) ) ( not ( = ?auto_187610 ?auto_187616 ) ) ( not ( = ?auto_187610 ?auto_187617 ) ) ( not ( = ?auto_187611 ?auto_187612 ) ) ( not ( = ?auto_187611 ?auto_187613 ) ) ( not ( = ?auto_187611 ?auto_187614 ) ) ( not ( = ?auto_187611 ?auto_187615 ) ) ( not ( = ?auto_187611 ?auto_187616 ) ) ( not ( = ?auto_187611 ?auto_187617 ) ) ( not ( = ?auto_187612 ?auto_187613 ) ) ( not ( = ?auto_187612 ?auto_187614 ) ) ( not ( = ?auto_187612 ?auto_187615 ) ) ( not ( = ?auto_187612 ?auto_187616 ) ) ( not ( = ?auto_187612 ?auto_187617 ) ) ( not ( = ?auto_187613 ?auto_187614 ) ) ( not ( = ?auto_187613 ?auto_187615 ) ) ( not ( = ?auto_187613 ?auto_187616 ) ) ( not ( = ?auto_187613 ?auto_187617 ) ) ( not ( = ?auto_187614 ?auto_187615 ) ) ( not ( = ?auto_187614 ?auto_187616 ) ) ( not ( = ?auto_187614 ?auto_187617 ) ) ( not ( = ?auto_187615 ?auto_187616 ) ) ( not ( = ?auto_187615 ?auto_187617 ) ) ( not ( = ?auto_187616 ?auto_187617 ) ) ( ON-TABLE ?auto_187617 ) ( ON ?auto_187616 ?auto_187617 ) ( ON ?auto_187615 ?auto_187616 ) ( ON ?auto_187614 ?auto_187615 ) ( ON ?auto_187613 ?auto_187614 ) ( ON ?auto_187612 ?auto_187613 ) ( ON ?auto_187611 ?auto_187612 ) ( CLEAR ?auto_187611 ) ( ON ?auto_187610 ?auto_187618 ) ( CLEAR ?auto_187610 ) ( HAND-EMPTY ) ( not ( = ?auto_187610 ?auto_187618 ) ) ( not ( = ?auto_187611 ?auto_187618 ) ) ( not ( = ?auto_187612 ?auto_187618 ) ) ( not ( = ?auto_187613 ?auto_187618 ) ) ( not ( = ?auto_187614 ?auto_187618 ) ) ( not ( = ?auto_187615 ?auto_187618 ) ) ( not ( = ?auto_187616 ?auto_187618 ) ) ( not ( = ?auto_187617 ?auto_187618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187610 ?auto_187618 )
      ( MAKE-8PILE ?auto_187610 ?auto_187611 ?auto_187612 ?auto_187613 ?auto_187614 ?auto_187615 ?auto_187616 ?auto_187617 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187619 - BLOCK
      ?auto_187620 - BLOCK
      ?auto_187621 - BLOCK
      ?auto_187622 - BLOCK
      ?auto_187623 - BLOCK
      ?auto_187624 - BLOCK
      ?auto_187625 - BLOCK
      ?auto_187626 - BLOCK
    )
    :vars
    (
      ?auto_187627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187619 ?auto_187620 ) ) ( not ( = ?auto_187619 ?auto_187621 ) ) ( not ( = ?auto_187619 ?auto_187622 ) ) ( not ( = ?auto_187619 ?auto_187623 ) ) ( not ( = ?auto_187619 ?auto_187624 ) ) ( not ( = ?auto_187619 ?auto_187625 ) ) ( not ( = ?auto_187619 ?auto_187626 ) ) ( not ( = ?auto_187620 ?auto_187621 ) ) ( not ( = ?auto_187620 ?auto_187622 ) ) ( not ( = ?auto_187620 ?auto_187623 ) ) ( not ( = ?auto_187620 ?auto_187624 ) ) ( not ( = ?auto_187620 ?auto_187625 ) ) ( not ( = ?auto_187620 ?auto_187626 ) ) ( not ( = ?auto_187621 ?auto_187622 ) ) ( not ( = ?auto_187621 ?auto_187623 ) ) ( not ( = ?auto_187621 ?auto_187624 ) ) ( not ( = ?auto_187621 ?auto_187625 ) ) ( not ( = ?auto_187621 ?auto_187626 ) ) ( not ( = ?auto_187622 ?auto_187623 ) ) ( not ( = ?auto_187622 ?auto_187624 ) ) ( not ( = ?auto_187622 ?auto_187625 ) ) ( not ( = ?auto_187622 ?auto_187626 ) ) ( not ( = ?auto_187623 ?auto_187624 ) ) ( not ( = ?auto_187623 ?auto_187625 ) ) ( not ( = ?auto_187623 ?auto_187626 ) ) ( not ( = ?auto_187624 ?auto_187625 ) ) ( not ( = ?auto_187624 ?auto_187626 ) ) ( not ( = ?auto_187625 ?auto_187626 ) ) ( ON-TABLE ?auto_187626 ) ( ON ?auto_187625 ?auto_187626 ) ( ON ?auto_187624 ?auto_187625 ) ( ON ?auto_187623 ?auto_187624 ) ( ON ?auto_187622 ?auto_187623 ) ( ON ?auto_187621 ?auto_187622 ) ( ON ?auto_187619 ?auto_187627 ) ( CLEAR ?auto_187619 ) ( not ( = ?auto_187619 ?auto_187627 ) ) ( not ( = ?auto_187620 ?auto_187627 ) ) ( not ( = ?auto_187621 ?auto_187627 ) ) ( not ( = ?auto_187622 ?auto_187627 ) ) ( not ( = ?auto_187623 ?auto_187627 ) ) ( not ( = ?auto_187624 ?auto_187627 ) ) ( not ( = ?auto_187625 ?auto_187627 ) ) ( not ( = ?auto_187626 ?auto_187627 ) ) ( HOLDING ?auto_187620 ) ( CLEAR ?auto_187621 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187626 ?auto_187625 ?auto_187624 ?auto_187623 ?auto_187622 ?auto_187621 ?auto_187620 )
      ( MAKE-8PILE ?auto_187619 ?auto_187620 ?auto_187621 ?auto_187622 ?auto_187623 ?auto_187624 ?auto_187625 ?auto_187626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187628 - BLOCK
      ?auto_187629 - BLOCK
      ?auto_187630 - BLOCK
      ?auto_187631 - BLOCK
      ?auto_187632 - BLOCK
      ?auto_187633 - BLOCK
      ?auto_187634 - BLOCK
      ?auto_187635 - BLOCK
    )
    :vars
    (
      ?auto_187636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187628 ?auto_187629 ) ) ( not ( = ?auto_187628 ?auto_187630 ) ) ( not ( = ?auto_187628 ?auto_187631 ) ) ( not ( = ?auto_187628 ?auto_187632 ) ) ( not ( = ?auto_187628 ?auto_187633 ) ) ( not ( = ?auto_187628 ?auto_187634 ) ) ( not ( = ?auto_187628 ?auto_187635 ) ) ( not ( = ?auto_187629 ?auto_187630 ) ) ( not ( = ?auto_187629 ?auto_187631 ) ) ( not ( = ?auto_187629 ?auto_187632 ) ) ( not ( = ?auto_187629 ?auto_187633 ) ) ( not ( = ?auto_187629 ?auto_187634 ) ) ( not ( = ?auto_187629 ?auto_187635 ) ) ( not ( = ?auto_187630 ?auto_187631 ) ) ( not ( = ?auto_187630 ?auto_187632 ) ) ( not ( = ?auto_187630 ?auto_187633 ) ) ( not ( = ?auto_187630 ?auto_187634 ) ) ( not ( = ?auto_187630 ?auto_187635 ) ) ( not ( = ?auto_187631 ?auto_187632 ) ) ( not ( = ?auto_187631 ?auto_187633 ) ) ( not ( = ?auto_187631 ?auto_187634 ) ) ( not ( = ?auto_187631 ?auto_187635 ) ) ( not ( = ?auto_187632 ?auto_187633 ) ) ( not ( = ?auto_187632 ?auto_187634 ) ) ( not ( = ?auto_187632 ?auto_187635 ) ) ( not ( = ?auto_187633 ?auto_187634 ) ) ( not ( = ?auto_187633 ?auto_187635 ) ) ( not ( = ?auto_187634 ?auto_187635 ) ) ( ON-TABLE ?auto_187635 ) ( ON ?auto_187634 ?auto_187635 ) ( ON ?auto_187633 ?auto_187634 ) ( ON ?auto_187632 ?auto_187633 ) ( ON ?auto_187631 ?auto_187632 ) ( ON ?auto_187630 ?auto_187631 ) ( ON ?auto_187628 ?auto_187636 ) ( not ( = ?auto_187628 ?auto_187636 ) ) ( not ( = ?auto_187629 ?auto_187636 ) ) ( not ( = ?auto_187630 ?auto_187636 ) ) ( not ( = ?auto_187631 ?auto_187636 ) ) ( not ( = ?auto_187632 ?auto_187636 ) ) ( not ( = ?auto_187633 ?auto_187636 ) ) ( not ( = ?auto_187634 ?auto_187636 ) ) ( not ( = ?auto_187635 ?auto_187636 ) ) ( CLEAR ?auto_187630 ) ( ON ?auto_187629 ?auto_187628 ) ( CLEAR ?auto_187629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187636 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187636 ?auto_187628 )
      ( MAKE-8PILE ?auto_187628 ?auto_187629 ?auto_187630 ?auto_187631 ?auto_187632 ?auto_187633 ?auto_187634 ?auto_187635 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187637 - BLOCK
      ?auto_187638 - BLOCK
      ?auto_187639 - BLOCK
      ?auto_187640 - BLOCK
      ?auto_187641 - BLOCK
      ?auto_187642 - BLOCK
      ?auto_187643 - BLOCK
      ?auto_187644 - BLOCK
    )
    :vars
    (
      ?auto_187645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187637 ?auto_187638 ) ) ( not ( = ?auto_187637 ?auto_187639 ) ) ( not ( = ?auto_187637 ?auto_187640 ) ) ( not ( = ?auto_187637 ?auto_187641 ) ) ( not ( = ?auto_187637 ?auto_187642 ) ) ( not ( = ?auto_187637 ?auto_187643 ) ) ( not ( = ?auto_187637 ?auto_187644 ) ) ( not ( = ?auto_187638 ?auto_187639 ) ) ( not ( = ?auto_187638 ?auto_187640 ) ) ( not ( = ?auto_187638 ?auto_187641 ) ) ( not ( = ?auto_187638 ?auto_187642 ) ) ( not ( = ?auto_187638 ?auto_187643 ) ) ( not ( = ?auto_187638 ?auto_187644 ) ) ( not ( = ?auto_187639 ?auto_187640 ) ) ( not ( = ?auto_187639 ?auto_187641 ) ) ( not ( = ?auto_187639 ?auto_187642 ) ) ( not ( = ?auto_187639 ?auto_187643 ) ) ( not ( = ?auto_187639 ?auto_187644 ) ) ( not ( = ?auto_187640 ?auto_187641 ) ) ( not ( = ?auto_187640 ?auto_187642 ) ) ( not ( = ?auto_187640 ?auto_187643 ) ) ( not ( = ?auto_187640 ?auto_187644 ) ) ( not ( = ?auto_187641 ?auto_187642 ) ) ( not ( = ?auto_187641 ?auto_187643 ) ) ( not ( = ?auto_187641 ?auto_187644 ) ) ( not ( = ?auto_187642 ?auto_187643 ) ) ( not ( = ?auto_187642 ?auto_187644 ) ) ( not ( = ?auto_187643 ?auto_187644 ) ) ( ON-TABLE ?auto_187644 ) ( ON ?auto_187643 ?auto_187644 ) ( ON ?auto_187642 ?auto_187643 ) ( ON ?auto_187641 ?auto_187642 ) ( ON ?auto_187640 ?auto_187641 ) ( ON ?auto_187637 ?auto_187645 ) ( not ( = ?auto_187637 ?auto_187645 ) ) ( not ( = ?auto_187638 ?auto_187645 ) ) ( not ( = ?auto_187639 ?auto_187645 ) ) ( not ( = ?auto_187640 ?auto_187645 ) ) ( not ( = ?auto_187641 ?auto_187645 ) ) ( not ( = ?auto_187642 ?auto_187645 ) ) ( not ( = ?auto_187643 ?auto_187645 ) ) ( not ( = ?auto_187644 ?auto_187645 ) ) ( ON ?auto_187638 ?auto_187637 ) ( CLEAR ?auto_187638 ) ( ON-TABLE ?auto_187645 ) ( HOLDING ?auto_187639 ) ( CLEAR ?auto_187640 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187644 ?auto_187643 ?auto_187642 ?auto_187641 ?auto_187640 ?auto_187639 )
      ( MAKE-8PILE ?auto_187637 ?auto_187638 ?auto_187639 ?auto_187640 ?auto_187641 ?auto_187642 ?auto_187643 ?auto_187644 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187646 - BLOCK
      ?auto_187647 - BLOCK
      ?auto_187648 - BLOCK
      ?auto_187649 - BLOCK
      ?auto_187650 - BLOCK
      ?auto_187651 - BLOCK
      ?auto_187652 - BLOCK
      ?auto_187653 - BLOCK
    )
    :vars
    (
      ?auto_187654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187646 ?auto_187647 ) ) ( not ( = ?auto_187646 ?auto_187648 ) ) ( not ( = ?auto_187646 ?auto_187649 ) ) ( not ( = ?auto_187646 ?auto_187650 ) ) ( not ( = ?auto_187646 ?auto_187651 ) ) ( not ( = ?auto_187646 ?auto_187652 ) ) ( not ( = ?auto_187646 ?auto_187653 ) ) ( not ( = ?auto_187647 ?auto_187648 ) ) ( not ( = ?auto_187647 ?auto_187649 ) ) ( not ( = ?auto_187647 ?auto_187650 ) ) ( not ( = ?auto_187647 ?auto_187651 ) ) ( not ( = ?auto_187647 ?auto_187652 ) ) ( not ( = ?auto_187647 ?auto_187653 ) ) ( not ( = ?auto_187648 ?auto_187649 ) ) ( not ( = ?auto_187648 ?auto_187650 ) ) ( not ( = ?auto_187648 ?auto_187651 ) ) ( not ( = ?auto_187648 ?auto_187652 ) ) ( not ( = ?auto_187648 ?auto_187653 ) ) ( not ( = ?auto_187649 ?auto_187650 ) ) ( not ( = ?auto_187649 ?auto_187651 ) ) ( not ( = ?auto_187649 ?auto_187652 ) ) ( not ( = ?auto_187649 ?auto_187653 ) ) ( not ( = ?auto_187650 ?auto_187651 ) ) ( not ( = ?auto_187650 ?auto_187652 ) ) ( not ( = ?auto_187650 ?auto_187653 ) ) ( not ( = ?auto_187651 ?auto_187652 ) ) ( not ( = ?auto_187651 ?auto_187653 ) ) ( not ( = ?auto_187652 ?auto_187653 ) ) ( ON-TABLE ?auto_187653 ) ( ON ?auto_187652 ?auto_187653 ) ( ON ?auto_187651 ?auto_187652 ) ( ON ?auto_187650 ?auto_187651 ) ( ON ?auto_187649 ?auto_187650 ) ( ON ?auto_187646 ?auto_187654 ) ( not ( = ?auto_187646 ?auto_187654 ) ) ( not ( = ?auto_187647 ?auto_187654 ) ) ( not ( = ?auto_187648 ?auto_187654 ) ) ( not ( = ?auto_187649 ?auto_187654 ) ) ( not ( = ?auto_187650 ?auto_187654 ) ) ( not ( = ?auto_187651 ?auto_187654 ) ) ( not ( = ?auto_187652 ?auto_187654 ) ) ( not ( = ?auto_187653 ?auto_187654 ) ) ( ON ?auto_187647 ?auto_187646 ) ( ON-TABLE ?auto_187654 ) ( CLEAR ?auto_187649 ) ( ON ?auto_187648 ?auto_187647 ) ( CLEAR ?auto_187648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187654 ?auto_187646 ?auto_187647 )
      ( MAKE-8PILE ?auto_187646 ?auto_187647 ?auto_187648 ?auto_187649 ?auto_187650 ?auto_187651 ?auto_187652 ?auto_187653 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187655 - BLOCK
      ?auto_187656 - BLOCK
      ?auto_187657 - BLOCK
      ?auto_187658 - BLOCK
      ?auto_187659 - BLOCK
      ?auto_187660 - BLOCK
      ?auto_187661 - BLOCK
      ?auto_187662 - BLOCK
    )
    :vars
    (
      ?auto_187663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187655 ?auto_187656 ) ) ( not ( = ?auto_187655 ?auto_187657 ) ) ( not ( = ?auto_187655 ?auto_187658 ) ) ( not ( = ?auto_187655 ?auto_187659 ) ) ( not ( = ?auto_187655 ?auto_187660 ) ) ( not ( = ?auto_187655 ?auto_187661 ) ) ( not ( = ?auto_187655 ?auto_187662 ) ) ( not ( = ?auto_187656 ?auto_187657 ) ) ( not ( = ?auto_187656 ?auto_187658 ) ) ( not ( = ?auto_187656 ?auto_187659 ) ) ( not ( = ?auto_187656 ?auto_187660 ) ) ( not ( = ?auto_187656 ?auto_187661 ) ) ( not ( = ?auto_187656 ?auto_187662 ) ) ( not ( = ?auto_187657 ?auto_187658 ) ) ( not ( = ?auto_187657 ?auto_187659 ) ) ( not ( = ?auto_187657 ?auto_187660 ) ) ( not ( = ?auto_187657 ?auto_187661 ) ) ( not ( = ?auto_187657 ?auto_187662 ) ) ( not ( = ?auto_187658 ?auto_187659 ) ) ( not ( = ?auto_187658 ?auto_187660 ) ) ( not ( = ?auto_187658 ?auto_187661 ) ) ( not ( = ?auto_187658 ?auto_187662 ) ) ( not ( = ?auto_187659 ?auto_187660 ) ) ( not ( = ?auto_187659 ?auto_187661 ) ) ( not ( = ?auto_187659 ?auto_187662 ) ) ( not ( = ?auto_187660 ?auto_187661 ) ) ( not ( = ?auto_187660 ?auto_187662 ) ) ( not ( = ?auto_187661 ?auto_187662 ) ) ( ON-TABLE ?auto_187662 ) ( ON ?auto_187661 ?auto_187662 ) ( ON ?auto_187660 ?auto_187661 ) ( ON ?auto_187659 ?auto_187660 ) ( ON ?auto_187655 ?auto_187663 ) ( not ( = ?auto_187655 ?auto_187663 ) ) ( not ( = ?auto_187656 ?auto_187663 ) ) ( not ( = ?auto_187657 ?auto_187663 ) ) ( not ( = ?auto_187658 ?auto_187663 ) ) ( not ( = ?auto_187659 ?auto_187663 ) ) ( not ( = ?auto_187660 ?auto_187663 ) ) ( not ( = ?auto_187661 ?auto_187663 ) ) ( not ( = ?auto_187662 ?auto_187663 ) ) ( ON ?auto_187656 ?auto_187655 ) ( ON-TABLE ?auto_187663 ) ( ON ?auto_187657 ?auto_187656 ) ( CLEAR ?auto_187657 ) ( HOLDING ?auto_187658 ) ( CLEAR ?auto_187659 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187662 ?auto_187661 ?auto_187660 ?auto_187659 ?auto_187658 )
      ( MAKE-8PILE ?auto_187655 ?auto_187656 ?auto_187657 ?auto_187658 ?auto_187659 ?auto_187660 ?auto_187661 ?auto_187662 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187664 - BLOCK
      ?auto_187665 - BLOCK
      ?auto_187666 - BLOCK
      ?auto_187667 - BLOCK
      ?auto_187668 - BLOCK
      ?auto_187669 - BLOCK
      ?auto_187670 - BLOCK
      ?auto_187671 - BLOCK
    )
    :vars
    (
      ?auto_187672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187664 ?auto_187665 ) ) ( not ( = ?auto_187664 ?auto_187666 ) ) ( not ( = ?auto_187664 ?auto_187667 ) ) ( not ( = ?auto_187664 ?auto_187668 ) ) ( not ( = ?auto_187664 ?auto_187669 ) ) ( not ( = ?auto_187664 ?auto_187670 ) ) ( not ( = ?auto_187664 ?auto_187671 ) ) ( not ( = ?auto_187665 ?auto_187666 ) ) ( not ( = ?auto_187665 ?auto_187667 ) ) ( not ( = ?auto_187665 ?auto_187668 ) ) ( not ( = ?auto_187665 ?auto_187669 ) ) ( not ( = ?auto_187665 ?auto_187670 ) ) ( not ( = ?auto_187665 ?auto_187671 ) ) ( not ( = ?auto_187666 ?auto_187667 ) ) ( not ( = ?auto_187666 ?auto_187668 ) ) ( not ( = ?auto_187666 ?auto_187669 ) ) ( not ( = ?auto_187666 ?auto_187670 ) ) ( not ( = ?auto_187666 ?auto_187671 ) ) ( not ( = ?auto_187667 ?auto_187668 ) ) ( not ( = ?auto_187667 ?auto_187669 ) ) ( not ( = ?auto_187667 ?auto_187670 ) ) ( not ( = ?auto_187667 ?auto_187671 ) ) ( not ( = ?auto_187668 ?auto_187669 ) ) ( not ( = ?auto_187668 ?auto_187670 ) ) ( not ( = ?auto_187668 ?auto_187671 ) ) ( not ( = ?auto_187669 ?auto_187670 ) ) ( not ( = ?auto_187669 ?auto_187671 ) ) ( not ( = ?auto_187670 ?auto_187671 ) ) ( ON-TABLE ?auto_187671 ) ( ON ?auto_187670 ?auto_187671 ) ( ON ?auto_187669 ?auto_187670 ) ( ON ?auto_187668 ?auto_187669 ) ( ON ?auto_187664 ?auto_187672 ) ( not ( = ?auto_187664 ?auto_187672 ) ) ( not ( = ?auto_187665 ?auto_187672 ) ) ( not ( = ?auto_187666 ?auto_187672 ) ) ( not ( = ?auto_187667 ?auto_187672 ) ) ( not ( = ?auto_187668 ?auto_187672 ) ) ( not ( = ?auto_187669 ?auto_187672 ) ) ( not ( = ?auto_187670 ?auto_187672 ) ) ( not ( = ?auto_187671 ?auto_187672 ) ) ( ON ?auto_187665 ?auto_187664 ) ( ON-TABLE ?auto_187672 ) ( ON ?auto_187666 ?auto_187665 ) ( CLEAR ?auto_187668 ) ( ON ?auto_187667 ?auto_187666 ) ( CLEAR ?auto_187667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187672 ?auto_187664 ?auto_187665 ?auto_187666 )
      ( MAKE-8PILE ?auto_187664 ?auto_187665 ?auto_187666 ?auto_187667 ?auto_187668 ?auto_187669 ?auto_187670 ?auto_187671 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187673 - BLOCK
      ?auto_187674 - BLOCK
      ?auto_187675 - BLOCK
      ?auto_187676 - BLOCK
      ?auto_187677 - BLOCK
      ?auto_187678 - BLOCK
      ?auto_187679 - BLOCK
      ?auto_187680 - BLOCK
    )
    :vars
    (
      ?auto_187681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187673 ?auto_187674 ) ) ( not ( = ?auto_187673 ?auto_187675 ) ) ( not ( = ?auto_187673 ?auto_187676 ) ) ( not ( = ?auto_187673 ?auto_187677 ) ) ( not ( = ?auto_187673 ?auto_187678 ) ) ( not ( = ?auto_187673 ?auto_187679 ) ) ( not ( = ?auto_187673 ?auto_187680 ) ) ( not ( = ?auto_187674 ?auto_187675 ) ) ( not ( = ?auto_187674 ?auto_187676 ) ) ( not ( = ?auto_187674 ?auto_187677 ) ) ( not ( = ?auto_187674 ?auto_187678 ) ) ( not ( = ?auto_187674 ?auto_187679 ) ) ( not ( = ?auto_187674 ?auto_187680 ) ) ( not ( = ?auto_187675 ?auto_187676 ) ) ( not ( = ?auto_187675 ?auto_187677 ) ) ( not ( = ?auto_187675 ?auto_187678 ) ) ( not ( = ?auto_187675 ?auto_187679 ) ) ( not ( = ?auto_187675 ?auto_187680 ) ) ( not ( = ?auto_187676 ?auto_187677 ) ) ( not ( = ?auto_187676 ?auto_187678 ) ) ( not ( = ?auto_187676 ?auto_187679 ) ) ( not ( = ?auto_187676 ?auto_187680 ) ) ( not ( = ?auto_187677 ?auto_187678 ) ) ( not ( = ?auto_187677 ?auto_187679 ) ) ( not ( = ?auto_187677 ?auto_187680 ) ) ( not ( = ?auto_187678 ?auto_187679 ) ) ( not ( = ?auto_187678 ?auto_187680 ) ) ( not ( = ?auto_187679 ?auto_187680 ) ) ( ON-TABLE ?auto_187680 ) ( ON ?auto_187679 ?auto_187680 ) ( ON ?auto_187678 ?auto_187679 ) ( ON ?auto_187673 ?auto_187681 ) ( not ( = ?auto_187673 ?auto_187681 ) ) ( not ( = ?auto_187674 ?auto_187681 ) ) ( not ( = ?auto_187675 ?auto_187681 ) ) ( not ( = ?auto_187676 ?auto_187681 ) ) ( not ( = ?auto_187677 ?auto_187681 ) ) ( not ( = ?auto_187678 ?auto_187681 ) ) ( not ( = ?auto_187679 ?auto_187681 ) ) ( not ( = ?auto_187680 ?auto_187681 ) ) ( ON ?auto_187674 ?auto_187673 ) ( ON-TABLE ?auto_187681 ) ( ON ?auto_187675 ?auto_187674 ) ( ON ?auto_187676 ?auto_187675 ) ( CLEAR ?auto_187676 ) ( HOLDING ?auto_187677 ) ( CLEAR ?auto_187678 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187680 ?auto_187679 ?auto_187678 ?auto_187677 )
      ( MAKE-8PILE ?auto_187673 ?auto_187674 ?auto_187675 ?auto_187676 ?auto_187677 ?auto_187678 ?auto_187679 ?auto_187680 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187682 - BLOCK
      ?auto_187683 - BLOCK
      ?auto_187684 - BLOCK
      ?auto_187685 - BLOCK
      ?auto_187686 - BLOCK
      ?auto_187687 - BLOCK
      ?auto_187688 - BLOCK
      ?auto_187689 - BLOCK
    )
    :vars
    (
      ?auto_187690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187682 ?auto_187683 ) ) ( not ( = ?auto_187682 ?auto_187684 ) ) ( not ( = ?auto_187682 ?auto_187685 ) ) ( not ( = ?auto_187682 ?auto_187686 ) ) ( not ( = ?auto_187682 ?auto_187687 ) ) ( not ( = ?auto_187682 ?auto_187688 ) ) ( not ( = ?auto_187682 ?auto_187689 ) ) ( not ( = ?auto_187683 ?auto_187684 ) ) ( not ( = ?auto_187683 ?auto_187685 ) ) ( not ( = ?auto_187683 ?auto_187686 ) ) ( not ( = ?auto_187683 ?auto_187687 ) ) ( not ( = ?auto_187683 ?auto_187688 ) ) ( not ( = ?auto_187683 ?auto_187689 ) ) ( not ( = ?auto_187684 ?auto_187685 ) ) ( not ( = ?auto_187684 ?auto_187686 ) ) ( not ( = ?auto_187684 ?auto_187687 ) ) ( not ( = ?auto_187684 ?auto_187688 ) ) ( not ( = ?auto_187684 ?auto_187689 ) ) ( not ( = ?auto_187685 ?auto_187686 ) ) ( not ( = ?auto_187685 ?auto_187687 ) ) ( not ( = ?auto_187685 ?auto_187688 ) ) ( not ( = ?auto_187685 ?auto_187689 ) ) ( not ( = ?auto_187686 ?auto_187687 ) ) ( not ( = ?auto_187686 ?auto_187688 ) ) ( not ( = ?auto_187686 ?auto_187689 ) ) ( not ( = ?auto_187687 ?auto_187688 ) ) ( not ( = ?auto_187687 ?auto_187689 ) ) ( not ( = ?auto_187688 ?auto_187689 ) ) ( ON-TABLE ?auto_187689 ) ( ON ?auto_187688 ?auto_187689 ) ( ON ?auto_187687 ?auto_187688 ) ( ON ?auto_187682 ?auto_187690 ) ( not ( = ?auto_187682 ?auto_187690 ) ) ( not ( = ?auto_187683 ?auto_187690 ) ) ( not ( = ?auto_187684 ?auto_187690 ) ) ( not ( = ?auto_187685 ?auto_187690 ) ) ( not ( = ?auto_187686 ?auto_187690 ) ) ( not ( = ?auto_187687 ?auto_187690 ) ) ( not ( = ?auto_187688 ?auto_187690 ) ) ( not ( = ?auto_187689 ?auto_187690 ) ) ( ON ?auto_187683 ?auto_187682 ) ( ON-TABLE ?auto_187690 ) ( ON ?auto_187684 ?auto_187683 ) ( ON ?auto_187685 ?auto_187684 ) ( CLEAR ?auto_187687 ) ( ON ?auto_187686 ?auto_187685 ) ( CLEAR ?auto_187686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187690 ?auto_187682 ?auto_187683 ?auto_187684 ?auto_187685 )
      ( MAKE-8PILE ?auto_187682 ?auto_187683 ?auto_187684 ?auto_187685 ?auto_187686 ?auto_187687 ?auto_187688 ?auto_187689 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187691 - BLOCK
      ?auto_187692 - BLOCK
      ?auto_187693 - BLOCK
      ?auto_187694 - BLOCK
      ?auto_187695 - BLOCK
      ?auto_187696 - BLOCK
      ?auto_187697 - BLOCK
      ?auto_187698 - BLOCK
    )
    :vars
    (
      ?auto_187699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187691 ?auto_187692 ) ) ( not ( = ?auto_187691 ?auto_187693 ) ) ( not ( = ?auto_187691 ?auto_187694 ) ) ( not ( = ?auto_187691 ?auto_187695 ) ) ( not ( = ?auto_187691 ?auto_187696 ) ) ( not ( = ?auto_187691 ?auto_187697 ) ) ( not ( = ?auto_187691 ?auto_187698 ) ) ( not ( = ?auto_187692 ?auto_187693 ) ) ( not ( = ?auto_187692 ?auto_187694 ) ) ( not ( = ?auto_187692 ?auto_187695 ) ) ( not ( = ?auto_187692 ?auto_187696 ) ) ( not ( = ?auto_187692 ?auto_187697 ) ) ( not ( = ?auto_187692 ?auto_187698 ) ) ( not ( = ?auto_187693 ?auto_187694 ) ) ( not ( = ?auto_187693 ?auto_187695 ) ) ( not ( = ?auto_187693 ?auto_187696 ) ) ( not ( = ?auto_187693 ?auto_187697 ) ) ( not ( = ?auto_187693 ?auto_187698 ) ) ( not ( = ?auto_187694 ?auto_187695 ) ) ( not ( = ?auto_187694 ?auto_187696 ) ) ( not ( = ?auto_187694 ?auto_187697 ) ) ( not ( = ?auto_187694 ?auto_187698 ) ) ( not ( = ?auto_187695 ?auto_187696 ) ) ( not ( = ?auto_187695 ?auto_187697 ) ) ( not ( = ?auto_187695 ?auto_187698 ) ) ( not ( = ?auto_187696 ?auto_187697 ) ) ( not ( = ?auto_187696 ?auto_187698 ) ) ( not ( = ?auto_187697 ?auto_187698 ) ) ( ON-TABLE ?auto_187698 ) ( ON ?auto_187697 ?auto_187698 ) ( ON ?auto_187691 ?auto_187699 ) ( not ( = ?auto_187691 ?auto_187699 ) ) ( not ( = ?auto_187692 ?auto_187699 ) ) ( not ( = ?auto_187693 ?auto_187699 ) ) ( not ( = ?auto_187694 ?auto_187699 ) ) ( not ( = ?auto_187695 ?auto_187699 ) ) ( not ( = ?auto_187696 ?auto_187699 ) ) ( not ( = ?auto_187697 ?auto_187699 ) ) ( not ( = ?auto_187698 ?auto_187699 ) ) ( ON ?auto_187692 ?auto_187691 ) ( ON-TABLE ?auto_187699 ) ( ON ?auto_187693 ?auto_187692 ) ( ON ?auto_187694 ?auto_187693 ) ( ON ?auto_187695 ?auto_187694 ) ( CLEAR ?auto_187695 ) ( HOLDING ?auto_187696 ) ( CLEAR ?auto_187697 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187698 ?auto_187697 ?auto_187696 )
      ( MAKE-8PILE ?auto_187691 ?auto_187692 ?auto_187693 ?auto_187694 ?auto_187695 ?auto_187696 ?auto_187697 ?auto_187698 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187700 - BLOCK
      ?auto_187701 - BLOCK
      ?auto_187702 - BLOCK
      ?auto_187703 - BLOCK
      ?auto_187704 - BLOCK
      ?auto_187705 - BLOCK
      ?auto_187706 - BLOCK
      ?auto_187707 - BLOCK
    )
    :vars
    (
      ?auto_187708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187700 ?auto_187701 ) ) ( not ( = ?auto_187700 ?auto_187702 ) ) ( not ( = ?auto_187700 ?auto_187703 ) ) ( not ( = ?auto_187700 ?auto_187704 ) ) ( not ( = ?auto_187700 ?auto_187705 ) ) ( not ( = ?auto_187700 ?auto_187706 ) ) ( not ( = ?auto_187700 ?auto_187707 ) ) ( not ( = ?auto_187701 ?auto_187702 ) ) ( not ( = ?auto_187701 ?auto_187703 ) ) ( not ( = ?auto_187701 ?auto_187704 ) ) ( not ( = ?auto_187701 ?auto_187705 ) ) ( not ( = ?auto_187701 ?auto_187706 ) ) ( not ( = ?auto_187701 ?auto_187707 ) ) ( not ( = ?auto_187702 ?auto_187703 ) ) ( not ( = ?auto_187702 ?auto_187704 ) ) ( not ( = ?auto_187702 ?auto_187705 ) ) ( not ( = ?auto_187702 ?auto_187706 ) ) ( not ( = ?auto_187702 ?auto_187707 ) ) ( not ( = ?auto_187703 ?auto_187704 ) ) ( not ( = ?auto_187703 ?auto_187705 ) ) ( not ( = ?auto_187703 ?auto_187706 ) ) ( not ( = ?auto_187703 ?auto_187707 ) ) ( not ( = ?auto_187704 ?auto_187705 ) ) ( not ( = ?auto_187704 ?auto_187706 ) ) ( not ( = ?auto_187704 ?auto_187707 ) ) ( not ( = ?auto_187705 ?auto_187706 ) ) ( not ( = ?auto_187705 ?auto_187707 ) ) ( not ( = ?auto_187706 ?auto_187707 ) ) ( ON-TABLE ?auto_187707 ) ( ON ?auto_187706 ?auto_187707 ) ( ON ?auto_187700 ?auto_187708 ) ( not ( = ?auto_187700 ?auto_187708 ) ) ( not ( = ?auto_187701 ?auto_187708 ) ) ( not ( = ?auto_187702 ?auto_187708 ) ) ( not ( = ?auto_187703 ?auto_187708 ) ) ( not ( = ?auto_187704 ?auto_187708 ) ) ( not ( = ?auto_187705 ?auto_187708 ) ) ( not ( = ?auto_187706 ?auto_187708 ) ) ( not ( = ?auto_187707 ?auto_187708 ) ) ( ON ?auto_187701 ?auto_187700 ) ( ON-TABLE ?auto_187708 ) ( ON ?auto_187702 ?auto_187701 ) ( ON ?auto_187703 ?auto_187702 ) ( ON ?auto_187704 ?auto_187703 ) ( CLEAR ?auto_187706 ) ( ON ?auto_187705 ?auto_187704 ) ( CLEAR ?auto_187705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187708 ?auto_187700 ?auto_187701 ?auto_187702 ?auto_187703 ?auto_187704 )
      ( MAKE-8PILE ?auto_187700 ?auto_187701 ?auto_187702 ?auto_187703 ?auto_187704 ?auto_187705 ?auto_187706 ?auto_187707 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187709 - BLOCK
      ?auto_187710 - BLOCK
      ?auto_187711 - BLOCK
      ?auto_187712 - BLOCK
      ?auto_187713 - BLOCK
      ?auto_187714 - BLOCK
      ?auto_187715 - BLOCK
      ?auto_187716 - BLOCK
    )
    :vars
    (
      ?auto_187717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187709 ?auto_187710 ) ) ( not ( = ?auto_187709 ?auto_187711 ) ) ( not ( = ?auto_187709 ?auto_187712 ) ) ( not ( = ?auto_187709 ?auto_187713 ) ) ( not ( = ?auto_187709 ?auto_187714 ) ) ( not ( = ?auto_187709 ?auto_187715 ) ) ( not ( = ?auto_187709 ?auto_187716 ) ) ( not ( = ?auto_187710 ?auto_187711 ) ) ( not ( = ?auto_187710 ?auto_187712 ) ) ( not ( = ?auto_187710 ?auto_187713 ) ) ( not ( = ?auto_187710 ?auto_187714 ) ) ( not ( = ?auto_187710 ?auto_187715 ) ) ( not ( = ?auto_187710 ?auto_187716 ) ) ( not ( = ?auto_187711 ?auto_187712 ) ) ( not ( = ?auto_187711 ?auto_187713 ) ) ( not ( = ?auto_187711 ?auto_187714 ) ) ( not ( = ?auto_187711 ?auto_187715 ) ) ( not ( = ?auto_187711 ?auto_187716 ) ) ( not ( = ?auto_187712 ?auto_187713 ) ) ( not ( = ?auto_187712 ?auto_187714 ) ) ( not ( = ?auto_187712 ?auto_187715 ) ) ( not ( = ?auto_187712 ?auto_187716 ) ) ( not ( = ?auto_187713 ?auto_187714 ) ) ( not ( = ?auto_187713 ?auto_187715 ) ) ( not ( = ?auto_187713 ?auto_187716 ) ) ( not ( = ?auto_187714 ?auto_187715 ) ) ( not ( = ?auto_187714 ?auto_187716 ) ) ( not ( = ?auto_187715 ?auto_187716 ) ) ( ON-TABLE ?auto_187716 ) ( ON ?auto_187709 ?auto_187717 ) ( not ( = ?auto_187709 ?auto_187717 ) ) ( not ( = ?auto_187710 ?auto_187717 ) ) ( not ( = ?auto_187711 ?auto_187717 ) ) ( not ( = ?auto_187712 ?auto_187717 ) ) ( not ( = ?auto_187713 ?auto_187717 ) ) ( not ( = ?auto_187714 ?auto_187717 ) ) ( not ( = ?auto_187715 ?auto_187717 ) ) ( not ( = ?auto_187716 ?auto_187717 ) ) ( ON ?auto_187710 ?auto_187709 ) ( ON-TABLE ?auto_187717 ) ( ON ?auto_187711 ?auto_187710 ) ( ON ?auto_187712 ?auto_187711 ) ( ON ?auto_187713 ?auto_187712 ) ( ON ?auto_187714 ?auto_187713 ) ( CLEAR ?auto_187714 ) ( HOLDING ?auto_187715 ) ( CLEAR ?auto_187716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187716 ?auto_187715 )
      ( MAKE-8PILE ?auto_187709 ?auto_187710 ?auto_187711 ?auto_187712 ?auto_187713 ?auto_187714 ?auto_187715 ?auto_187716 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187718 - BLOCK
      ?auto_187719 - BLOCK
      ?auto_187720 - BLOCK
      ?auto_187721 - BLOCK
      ?auto_187722 - BLOCK
      ?auto_187723 - BLOCK
      ?auto_187724 - BLOCK
      ?auto_187725 - BLOCK
    )
    :vars
    (
      ?auto_187726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187718 ?auto_187719 ) ) ( not ( = ?auto_187718 ?auto_187720 ) ) ( not ( = ?auto_187718 ?auto_187721 ) ) ( not ( = ?auto_187718 ?auto_187722 ) ) ( not ( = ?auto_187718 ?auto_187723 ) ) ( not ( = ?auto_187718 ?auto_187724 ) ) ( not ( = ?auto_187718 ?auto_187725 ) ) ( not ( = ?auto_187719 ?auto_187720 ) ) ( not ( = ?auto_187719 ?auto_187721 ) ) ( not ( = ?auto_187719 ?auto_187722 ) ) ( not ( = ?auto_187719 ?auto_187723 ) ) ( not ( = ?auto_187719 ?auto_187724 ) ) ( not ( = ?auto_187719 ?auto_187725 ) ) ( not ( = ?auto_187720 ?auto_187721 ) ) ( not ( = ?auto_187720 ?auto_187722 ) ) ( not ( = ?auto_187720 ?auto_187723 ) ) ( not ( = ?auto_187720 ?auto_187724 ) ) ( not ( = ?auto_187720 ?auto_187725 ) ) ( not ( = ?auto_187721 ?auto_187722 ) ) ( not ( = ?auto_187721 ?auto_187723 ) ) ( not ( = ?auto_187721 ?auto_187724 ) ) ( not ( = ?auto_187721 ?auto_187725 ) ) ( not ( = ?auto_187722 ?auto_187723 ) ) ( not ( = ?auto_187722 ?auto_187724 ) ) ( not ( = ?auto_187722 ?auto_187725 ) ) ( not ( = ?auto_187723 ?auto_187724 ) ) ( not ( = ?auto_187723 ?auto_187725 ) ) ( not ( = ?auto_187724 ?auto_187725 ) ) ( ON-TABLE ?auto_187725 ) ( ON ?auto_187718 ?auto_187726 ) ( not ( = ?auto_187718 ?auto_187726 ) ) ( not ( = ?auto_187719 ?auto_187726 ) ) ( not ( = ?auto_187720 ?auto_187726 ) ) ( not ( = ?auto_187721 ?auto_187726 ) ) ( not ( = ?auto_187722 ?auto_187726 ) ) ( not ( = ?auto_187723 ?auto_187726 ) ) ( not ( = ?auto_187724 ?auto_187726 ) ) ( not ( = ?auto_187725 ?auto_187726 ) ) ( ON ?auto_187719 ?auto_187718 ) ( ON-TABLE ?auto_187726 ) ( ON ?auto_187720 ?auto_187719 ) ( ON ?auto_187721 ?auto_187720 ) ( ON ?auto_187722 ?auto_187721 ) ( ON ?auto_187723 ?auto_187722 ) ( CLEAR ?auto_187725 ) ( ON ?auto_187724 ?auto_187723 ) ( CLEAR ?auto_187724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187726 ?auto_187718 ?auto_187719 ?auto_187720 ?auto_187721 ?auto_187722 ?auto_187723 )
      ( MAKE-8PILE ?auto_187718 ?auto_187719 ?auto_187720 ?auto_187721 ?auto_187722 ?auto_187723 ?auto_187724 ?auto_187725 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187727 - BLOCK
      ?auto_187728 - BLOCK
      ?auto_187729 - BLOCK
      ?auto_187730 - BLOCK
      ?auto_187731 - BLOCK
      ?auto_187732 - BLOCK
      ?auto_187733 - BLOCK
      ?auto_187734 - BLOCK
    )
    :vars
    (
      ?auto_187735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187727 ?auto_187728 ) ) ( not ( = ?auto_187727 ?auto_187729 ) ) ( not ( = ?auto_187727 ?auto_187730 ) ) ( not ( = ?auto_187727 ?auto_187731 ) ) ( not ( = ?auto_187727 ?auto_187732 ) ) ( not ( = ?auto_187727 ?auto_187733 ) ) ( not ( = ?auto_187727 ?auto_187734 ) ) ( not ( = ?auto_187728 ?auto_187729 ) ) ( not ( = ?auto_187728 ?auto_187730 ) ) ( not ( = ?auto_187728 ?auto_187731 ) ) ( not ( = ?auto_187728 ?auto_187732 ) ) ( not ( = ?auto_187728 ?auto_187733 ) ) ( not ( = ?auto_187728 ?auto_187734 ) ) ( not ( = ?auto_187729 ?auto_187730 ) ) ( not ( = ?auto_187729 ?auto_187731 ) ) ( not ( = ?auto_187729 ?auto_187732 ) ) ( not ( = ?auto_187729 ?auto_187733 ) ) ( not ( = ?auto_187729 ?auto_187734 ) ) ( not ( = ?auto_187730 ?auto_187731 ) ) ( not ( = ?auto_187730 ?auto_187732 ) ) ( not ( = ?auto_187730 ?auto_187733 ) ) ( not ( = ?auto_187730 ?auto_187734 ) ) ( not ( = ?auto_187731 ?auto_187732 ) ) ( not ( = ?auto_187731 ?auto_187733 ) ) ( not ( = ?auto_187731 ?auto_187734 ) ) ( not ( = ?auto_187732 ?auto_187733 ) ) ( not ( = ?auto_187732 ?auto_187734 ) ) ( not ( = ?auto_187733 ?auto_187734 ) ) ( ON ?auto_187727 ?auto_187735 ) ( not ( = ?auto_187727 ?auto_187735 ) ) ( not ( = ?auto_187728 ?auto_187735 ) ) ( not ( = ?auto_187729 ?auto_187735 ) ) ( not ( = ?auto_187730 ?auto_187735 ) ) ( not ( = ?auto_187731 ?auto_187735 ) ) ( not ( = ?auto_187732 ?auto_187735 ) ) ( not ( = ?auto_187733 ?auto_187735 ) ) ( not ( = ?auto_187734 ?auto_187735 ) ) ( ON ?auto_187728 ?auto_187727 ) ( ON-TABLE ?auto_187735 ) ( ON ?auto_187729 ?auto_187728 ) ( ON ?auto_187730 ?auto_187729 ) ( ON ?auto_187731 ?auto_187730 ) ( ON ?auto_187732 ?auto_187731 ) ( ON ?auto_187733 ?auto_187732 ) ( CLEAR ?auto_187733 ) ( HOLDING ?auto_187734 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187734 )
      ( MAKE-8PILE ?auto_187727 ?auto_187728 ?auto_187729 ?auto_187730 ?auto_187731 ?auto_187732 ?auto_187733 ?auto_187734 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187736 - BLOCK
      ?auto_187737 - BLOCK
      ?auto_187738 - BLOCK
      ?auto_187739 - BLOCK
      ?auto_187740 - BLOCK
      ?auto_187741 - BLOCK
      ?auto_187742 - BLOCK
      ?auto_187743 - BLOCK
    )
    :vars
    (
      ?auto_187744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187736 ?auto_187737 ) ) ( not ( = ?auto_187736 ?auto_187738 ) ) ( not ( = ?auto_187736 ?auto_187739 ) ) ( not ( = ?auto_187736 ?auto_187740 ) ) ( not ( = ?auto_187736 ?auto_187741 ) ) ( not ( = ?auto_187736 ?auto_187742 ) ) ( not ( = ?auto_187736 ?auto_187743 ) ) ( not ( = ?auto_187737 ?auto_187738 ) ) ( not ( = ?auto_187737 ?auto_187739 ) ) ( not ( = ?auto_187737 ?auto_187740 ) ) ( not ( = ?auto_187737 ?auto_187741 ) ) ( not ( = ?auto_187737 ?auto_187742 ) ) ( not ( = ?auto_187737 ?auto_187743 ) ) ( not ( = ?auto_187738 ?auto_187739 ) ) ( not ( = ?auto_187738 ?auto_187740 ) ) ( not ( = ?auto_187738 ?auto_187741 ) ) ( not ( = ?auto_187738 ?auto_187742 ) ) ( not ( = ?auto_187738 ?auto_187743 ) ) ( not ( = ?auto_187739 ?auto_187740 ) ) ( not ( = ?auto_187739 ?auto_187741 ) ) ( not ( = ?auto_187739 ?auto_187742 ) ) ( not ( = ?auto_187739 ?auto_187743 ) ) ( not ( = ?auto_187740 ?auto_187741 ) ) ( not ( = ?auto_187740 ?auto_187742 ) ) ( not ( = ?auto_187740 ?auto_187743 ) ) ( not ( = ?auto_187741 ?auto_187742 ) ) ( not ( = ?auto_187741 ?auto_187743 ) ) ( not ( = ?auto_187742 ?auto_187743 ) ) ( ON ?auto_187736 ?auto_187744 ) ( not ( = ?auto_187736 ?auto_187744 ) ) ( not ( = ?auto_187737 ?auto_187744 ) ) ( not ( = ?auto_187738 ?auto_187744 ) ) ( not ( = ?auto_187739 ?auto_187744 ) ) ( not ( = ?auto_187740 ?auto_187744 ) ) ( not ( = ?auto_187741 ?auto_187744 ) ) ( not ( = ?auto_187742 ?auto_187744 ) ) ( not ( = ?auto_187743 ?auto_187744 ) ) ( ON ?auto_187737 ?auto_187736 ) ( ON-TABLE ?auto_187744 ) ( ON ?auto_187738 ?auto_187737 ) ( ON ?auto_187739 ?auto_187738 ) ( ON ?auto_187740 ?auto_187739 ) ( ON ?auto_187741 ?auto_187740 ) ( ON ?auto_187742 ?auto_187741 ) ( ON ?auto_187743 ?auto_187742 ) ( CLEAR ?auto_187743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187744 ?auto_187736 ?auto_187737 ?auto_187738 ?auto_187739 ?auto_187740 ?auto_187741 ?auto_187742 )
      ( MAKE-8PILE ?auto_187736 ?auto_187737 ?auto_187738 ?auto_187739 ?auto_187740 ?auto_187741 ?auto_187742 ?auto_187743 ) )
  )

)

