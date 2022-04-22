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
      ?auto_8505 - BLOCK
    )
    :vars
    (
      ?auto_8506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8505 ?auto_8506 ) ( CLEAR ?auto_8505 ) ( HAND-EMPTY ) ( not ( = ?auto_8505 ?auto_8506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8505 ?auto_8506 )
      ( !PUTDOWN ?auto_8505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8512 - BLOCK
      ?auto_8513 - BLOCK
    )
    :vars
    (
      ?auto_8514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8512 ) ( ON ?auto_8513 ?auto_8514 ) ( CLEAR ?auto_8513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8512 ) ( not ( = ?auto_8512 ?auto_8513 ) ) ( not ( = ?auto_8512 ?auto_8514 ) ) ( not ( = ?auto_8513 ?auto_8514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8513 ?auto_8514 )
      ( !STACK ?auto_8513 ?auto_8512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8522 - BLOCK
      ?auto_8523 - BLOCK
    )
    :vars
    (
      ?auto_8524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8523 ?auto_8524 ) ( not ( = ?auto_8522 ?auto_8523 ) ) ( not ( = ?auto_8522 ?auto_8524 ) ) ( not ( = ?auto_8523 ?auto_8524 ) ) ( ON ?auto_8522 ?auto_8523 ) ( CLEAR ?auto_8522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8522 )
      ( MAKE-2PILE ?auto_8522 ?auto_8523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8533 - BLOCK
      ?auto_8534 - BLOCK
      ?auto_8535 - BLOCK
    )
    :vars
    (
      ?auto_8536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8534 ) ( ON ?auto_8535 ?auto_8536 ) ( CLEAR ?auto_8535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8533 ) ( ON ?auto_8534 ?auto_8533 ) ( not ( = ?auto_8533 ?auto_8534 ) ) ( not ( = ?auto_8533 ?auto_8535 ) ) ( not ( = ?auto_8533 ?auto_8536 ) ) ( not ( = ?auto_8534 ?auto_8535 ) ) ( not ( = ?auto_8534 ?auto_8536 ) ) ( not ( = ?auto_8535 ?auto_8536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8535 ?auto_8536 )
      ( !STACK ?auto_8535 ?auto_8534 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8547 - BLOCK
      ?auto_8548 - BLOCK
      ?auto_8549 - BLOCK
    )
    :vars
    (
      ?auto_8550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8549 ?auto_8550 ) ( ON-TABLE ?auto_8547 ) ( not ( = ?auto_8547 ?auto_8548 ) ) ( not ( = ?auto_8547 ?auto_8549 ) ) ( not ( = ?auto_8547 ?auto_8550 ) ) ( not ( = ?auto_8548 ?auto_8549 ) ) ( not ( = ?auto_8548 ?auto_8550 ) ) ( not ( = ?auto_8549 ?auto_8550 ) ) ( CLEAR ?auto_8547 ) ( ON ?auto_8548 ?auto_8549 ) ( CLEAR ?auto_8548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8547 ?auto_8548 )
      ( MAKE-3PILE ?auto_8547 ?auto_8548 ?auto_8549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8561 - BLOCK
      ?auto_8562 - BLOCK
      ?auto_8563 - BLOCK
    )
    :vars
    (
      ?auto_8564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8563 ?auto_8564 ) ( not ( = ?auto_8561 ?auto_8562 ) ) ( not ( = ?auto_8561 ?auto_8563 ) ) ( not ( = ?auto_8561 ?auto_8564 ) ) ( not ( = ?auto_8562 ?auto_8563 ) ) ( not ( = ?auto_8562 ?auto_8564 ) ) ( not ( = ?auto_8563 ?auto_8564 ) ) ( ON ?auto_8562 ?auto_8563 ) ( ON ?auto_8561 ?auto_8562 ) ( CLEAR ?auto_8561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8561 )
      ( MAKE-3PILE ?auto_8561 ?auto_8562 ?auto_8563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8576 - BLOCK
      ?auto_8577 - BLOCK
      ?auto_8578 - BLOCK
      ?auto_8579 - BLOCK
    )
    :vars
    (
      ?auto_8580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8578 ) ( ON ?auto_8579 ?auto_8580 ) ( CLEAR ?auto_8579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8576 ) ( ON ?auto_8577 ?auto_8576 ) ( ON ?auto_8578 ?auto_8577 ) ( not ( = ?auto_8576 ?auto_8577 ) ) ( not ( = ?auto_8576 ?auto_8578 ) ) ( not ( = ?auto_8576 ?auto_8579 ) ) ( not ( = ?auto_8576 ?auto_8580 ) ) ( not ( = ?auto_8577 ?auto_8578 ) ) ( not ( = ?auto_8577 ?auto_8579 ) ) ( not ( = ?auto_8577 ?auto_8580 ) ) ( not ( = ?auto_8578 ?auto_8579 ) ) ( not ( = ?auto_8578 ?auto_8580 ) ) ( not ( = ?auto_8579 ?auto_8580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8579 ?auto_8580 )
      ( !STACK ?auto_8579 ?auto_8578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8594 - BLOCK
      ?auto_8595 - BLOCK
      ?auto_8596 - BLOCK
      ?auto_8597 - BLOCK
    )
    :vars
    (
      ?auto_8598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8597 ?auto_8598 ) ( ON-TABLE ?auto_8594 ) ( ON ?auto_8595 ?auto_8594 ) ( not ( = ?auto_8594 ?auto_8595 ) ) ( not ( = ?auto_8594 ?auto_8596 ) ) ( not ( = ?auto_8594 ?auto_8597 ) ) ( not ( = ?auto_8594 ?auto_8598 ) ) ( not ( = ?auto_8595 ?auto_8596 ) ) ( not ( = ?auto_8595 ?auto_8597 ) ) ( not ( = ?auto_8595 ?auto_8598 ) ) ( not ( = ?auto_8596 ?auto_8597 ) ) ( not ( = ?auto_8596 ?auto_8598 ) ) ( not ( = ?auto_8597 ?auto_8598 ) ) ( CLEAR ?auto_8595 ) ( ON ?auto_8596 ?auto_8597 ) ( CLEAR ?auto_8596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8594 ?auto_8595 ?auto_8596 )
      ( MAKE-4PILE ?auto_8594 ?auto_8595 ?auto_8596 ?auto_8597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8612 - BLOCK
      ?auto_8613 - BLOCK
      ?auto_8614 - BLOCK
      ?auto_8615 - BLOCK
    )
    :vars
    (
      ?auto_8616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8615 ?auto_8616 ) ( ON-TABLE ?auto_8612 ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8614 ) ) ( not ( = ?auto_8612 ?auto_8615 ) ) ( not ( = ?auto_8612 ?auto_8616 ) ) ( not ( = ?auto_8613 ?auto_8614 ) ) ( not ( = ?auto_8613 ?auto_8615 ) ) ( not ( = ?auto_8613 ?auto_8616 ) ) ( not ( = ?auto_8614 ?auto_8615 ) ) ( not ( = ?auto_8614 ?auto_8616 ) ) ( not ( = ?auto_8615 ?auto_8616 ) ) ( ON ?auto_8614 ?auto_8615 ) ( CLEAR ?auto_8612 ) ( ON ?auto_8613 ?auto_8614 ) ( CLEAR ?auto_8613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8612 ?auto_8613 )
      ( MAKE-4PILE ?auto_8612 ?auto_8613 ?auto_8614 ?auto_8615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8630 - BLOCK
      ?auto_8631 - BLOCK
      ?auto_8632 - BLOCK
      ?auto_8633 - BLOCK
    )
    :vars
    (
      ?auto_8634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8633 ?auto_8634 ) ( not ( = ?auto_8630 ?auto_8631 ) ) ( not ( = ?auto_8630 ?auto_8632 ) ) ( not ( = ?auto_8630 ?auto_8633 ) ) ( not ( = ?auto_8630 ?auto_8634 ) ) ( not ( = ?auto_8631 ?auto_8632 ) ) ( not ( = ?auto_8631 ?auto_8633 ) ) ( not ( = ?auto_8631 ?auto_8634 ) ) ( not ( = ?auto_8632 ?auto_8633 ) ) ( not ( = ?auto_8632 ?auto_8634 ) ) ( not ( = ?auto_8633 ?auto_8634 ) ) ( ON ?auto_8632 ?auto_8633 ) ( ON ?auto_8631 ?auto_8632 ) ( ON ?auto_8630 ?auto_8631 ) ( CLEAR ?auto_8630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8630 )
      ( MAKE-4PILE ?auto_8630 ?auto_8631 ?auto_8632 ?auto_8633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8649 - BLOCK
      ?auto_8650 - BLOCK
      ?auto_8651 - BLOCK
      ?auto_8652 - BLOCK
      ?auto_8653 - BLOCK
    )
    :vars
    (
      ?auto_8654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8652 ) ( ON ?auto_8653 ?auto_8654 ) ( CLEAR ?auto_8653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8649 ) ( ON ?auto_8650 ?auto_8649 ) ( ON ?auto_8651 ?auto_8650 ) ( ON ?auto_8652 ?auto_8651 ) ( not ( = ?auto_8649 ?auto_8650 ) ) ( not ( = ?auto_8649 ?auto_8651 ) ) ( not ( = ?auto_8649 ?auto_8652 ) ) ( not ( = ?auto_8649 ?auto_8653 ) ) ( not ( = ?auto_8649 ?auto_8654 ) ) ( not ( = ?auto_8650 ?auto_8651 ) ) ( not ( = ?auto_8650 ?auto_8652 ) ) ( not ( = ?auto_8650 ?auto_8653 ) ) ( not ( = ?auto_8650 ?auto_8654 ) ) ( not ( = ?auto_8651 ?auto_8652 ) ) ( not ( = ?auto_8651 ?auto_8653 ) ) ( not ( = ?auto_8651 ?auto_8654 ) ) ( not ( = ?auto_8652 ?auto_8653 ) ) ( not ( = ?auto_8652 ?auto_8654 ) ) ( not ( = ?auto_8653 ?auto_8654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8653 ?auto_8654 )
      ( !STACK ?auto_8653 ?auto_8652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8660 - BLOCK
      ?auto_8661 - BLOCK
      ?auto_8662 - BLOCK
      ?auto_8663 - BLOCK
      ?auto_8664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8663 ) ( ON-TABLE ?auto_8664 ) ( CLEAR ?auto_8664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8660 ) ( ON ?auto_8661 ?auto_8660 ) ( ON ?auto_8662 ?auto_8661 ) ( ON ?auto_8663 ?auto_8662 ) ( not ( = ?auto_8660 ?auto_8661 ) ) ( not ( = ?auto_8660 ?auto_8662 ) ) ( not ( = ?auto_8660 ?auto_8663 ) ) ( not ( = ?auto_8660 ?auto_8664 ) ) ( not ( = ?auto_8661 ?auto_8662 ) ) ( not ( = ?auto_8661 ?auto_8663 ) ) ( not ( = ?auto_8661 ?auto_8664 ) ) ( not ( = ?auto_8662 ?auto_8663 ) ) ( not ( = ?auto_8662 ?auto_8664 ) ) ( not ( = ?auto_8663 ?auto_8664 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_8664 )
      ( !STACK ?auto_8664 ?auto_8663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8670 - BLOCK
      ?auto_8671 - BLOCK
      ?auto_8672 - BLOCK
      ?auto_8673 - BLOCK
      ?auto_8674 - BLOCK
    )
    :vars
    (
      ?auto_8675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8674 ?auto_8675 ) ( ON-TABLE ?auto_8670 ) ( ON ?auto_8671 ?auto_8670 ) ( ON ?auto_8672 ?auto_8671 ) ( not ( = ?auto_8670 ?auto_8671 ) ) ( not ( = ?auto_8670 ?auto_8672 ) ) ( not ( = ?auto_8670 ?auto_8673 ) ) ( not ( = ?auto_8670 ?auto_8674 ) ) ( not ( = ?auto_8670 ?auto_8675 ) ) ( not ( = ?auto_8671 ?auto_8672 ) ) ( not ( = ?auto_8671 ?auto_8673 ) ) ( not ( = ?auto_8671 ?auto_8674 ) ) ( not ( = ?auto_8671 ?auto_8675 ) ) ( not ( = ?auto_8672 ?auto_8673 ) ) ( not ( = ?auto_8672 ?auto_8674 ) ) ( not ( = ?auto_8672 ?auto_8675 ) ) ( not ( = ?auto_8673 ?auto_8674 ) ) ( not ( = ?auto_8673 ?auto_8675 ) ) ( not ( = ?auto_8674 ?auto_8675 ) ) ( CLEAR ?auto_8672 ) ( ON ?auto_8673 ?auto_8674 ) ( CLEAR ?auto_8673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8670 ?auto_8671 ?auto_8672 ?auto_8673 )
      ( MAKE-5PILE ?auto_8670 ?auto_8671 ?auto_8672 ?auto_8673 ?auto_8674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8681 - BLOCK
      ?auto_8682 - BLOCK
      ?auto_8683 - BLOCK
      ?auto_8684 - BLOCK
      ?auto_8685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8685 ) ( ON-TABLE ?auto_8681 ) ( ON ?auto_8682 ?auto_8681 ) ( ON ?auto_8683 ?auto_8682 ) ( not ( = ?auto_8681 ?auto_8682 ) ) ( not ( = ?auto_8681 ?auto_8683 ) ) ( not ( = ?auto_8681 ?auto_8684 ) ) ( not ( = ?auto_8681 ?auto_8685 ) ) ( not ( = ?auto_8682 ?auto_8683 ) ) ( not ( = ?auto_8682 ?auto_8684 ) ) ( not ( = ?auto_8682 ?auto_8685 ) ) ( not ( = ?auto_8683 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8685 ) ) ( CLEAR ?auto_8683 ) ( ON ?auto_8684 ?auto_8685 ) ( CLEAR ?auto_8684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8681 ?auto_8682 ?auto_8683 ?auto_8684 )
      ( MAKE-5PILE ?auto_8681 ?auto_8682 ?auto_8683 ?auto_8684 ?auto_8685 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8691 - BLOCK
      ?auto_8692 - BLOCK
      ?auto_8693 - BLOCK
      ?auto_8694 - BLOCK
      ?auto_8695 - BLOCK
    )
    :vars
    (
      ?auto_8696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8695 ?auto_8696 ) ( ON-TABLE ?auto_8691 ) ( ON ?auto_8692 ?auto_8691 ) ( not ( = ?auto_8691 ?auto_8692 ) ) ( not ( = ?auto_8691 ?auto_8693 ) ) ( not ( = ?auto_8691 ?auto_8694 ) ) ( not ( = ?auto_8691 ?auto_8695 ) ) ( not ( = ?auto_8691 ?auto_8696 ) ) ( not ( = ?auto_8692 ?auto_8693 ) ) ( not ( = ?auto_8692 ?auto_8694 ) ) ( not ( = ?auto_8692 ?auto_8695 ) ) ( not ( = ?auto_8692 ?auto_8696 ) ) ( not ( = ?auto_8693 ?auto_8694 ) ) ( not ( = ?auto_8693 ?auto_8695 ) ) ( not ( = ?auto_8693 ?auto_8696 ) ) ( not ( = ?auto_8694 ?auto_8695 ) ) ( not ( = ?auto_8694 ?auto_8696 ) ) ( not ( = ?auto_8695 ?auto_8696 ) ) ( ON ?auto_8694 ?auto_8695 ) ( CLEAR ?auto_8692 ) ( ON ?auto_8693 ?auto_8694 ) ( CLEAR ?auto_8693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8691 ?auto_8692 ?auto_8693 )
      ( MAKE-5PILE ?auto_8691 ?auto_8692 ?auto_8693 ?auto_8694 ?auto_8695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8702 - BLOCK
      ?auto_8703 - BLOCK
      ?auto_8704 - BLOCK
      ?auto_8705 - BLOCK
      ?auto_8706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8706 ) ( ON-TABLE ?auto_8702 ) ( ON ?auto_8703 ?auto_8702 ) ( not ( = ?auto_8702 ?auto_8703 ) ) ( not ( = ?auto_8702 ?auto_8704 ) ) ( not ( = ?auto_8702 ?auto_8705 ) ) ( not ( = ?auto_8702 ?auto_8706 ) ) ( not ( = ?auto_8703 ?auto_8704 ) ) ( not ( = ?auto_8703 ?auto_8705 ) ) ( not ( = ?auto_8703 ?auto_8706 ) ) ( not ( = ?auto_8704 ?auto_8705 ) ) ( not ( = ?auto_8704 ?auto_8706 ) ) ( not ( = ?auto_8705 ?auto_8706 ) ) ( ON ?auto_8705 ?auto_8706 ) ( CLEAR ?auto_8703 ) ( ON ?auto_8704 ?auto_8705 ) ( CLEAR ?auto_8704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8702 ?auto_8703 ?auto_8704 )
      ( MAKE-5PILE ?auto_8702 ?auto_8703 ?auto_8704 ?auto_8705 ?auto_8706 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8712 - BLOCK
      ?auto_8713 - BLOCK
      ?auto_8714 - BLOCK
      ?auto_8715 - BLOCK
      ?auto_8716 - BLOCK
    )
    :vars
    (
      ?auto_8717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8716 ?auto_8717 ) ( ON-TABLE ?auto_8712 ) ( not ( = ?auto_8712 ?auto_8713 ) ) ( not ( = ?auto_8712 ?auto_8714 ) ) ( not ( = ?auto_8712 ?auto_8715 ) ) ( not ( = ?auto_8712 ?auto_8716 ) ) ( not ( = ?auto_8712 ?auto_8717 ) ) ( not ( = ?auto_8713 ?auto_8714 ) ) ( not ( = ?auto_8713 ?auto_8715 ) ) ( not ( = ?auto_8713 ?auto_8716 ) ) ( not ( = ?auto_8713 ?auto_8717 ) ) ( not ( = ?auto_8714 ?auto_8715 ) ) ( not ( = ?auto_8714 ?auto_8716 ) ) ( not ( = ?auto_8714 ?auto_8717 ) ) ( not ( = ?auto_8715 ?auto_8716 ) ) ( not ( = ?auto_8715 ?auto_8717 ) ) ( not ( = ?auto_8716 ?auto_8717 ) ) ( ON ?auto_8715 ?auto_8716 ) ( ON ?auto_8714 ?auto_8715 ) ( CLEAR ?auto_8712 ) ( ON ?auto_8713 ?auto_8714 ) ( CLEAR ?auto_8713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8712 ?auto_8713 )
      ( MAKE-5PILE ?auto_8712 ?auto_8713 ?auto_8714 ?auto_8715 ?auto_8716 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8723 - BLOCK
      ?auto_8724 - BLOCK
      ?auto_8725 - BLOCK
      ?auto_8726 - BLOCK
      ?auto_8727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8727 ) ( ON-TABLE ?auto_8723 ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8725 ) ) ( not ( = ?auto_8723 ?auto_8726 ) ) ( not ( = ?auto_8723 ?auto_8727 ) ) ( not ( = ?auto_8724 ?auto_8725 ) ) ( not ( = ?auto_8724 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8727 ) ) ( not ( = ?auto_8725 ?auto_8726 ) ) ( not ( = ?auto_8725 ?auto_8727 ) ) ( not ( = ?auto_8726 ?auto_8727 ) ) ( ON ?auto_8726 ?auto_8727 ) ( ON ?auto_8725 ?auto_8726 ) ( CLEAR ?auto_8723 ) ( ON ?auto_8724 ?auto_8725 ) ( CLEAR ?auto_8724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8723 ?auto_8724 )
      ( MAKE-5PILE ?auto_8723 ?auto_8724 ?auto_8725 ?auto_8726 ?auto_8727 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8733 - BLOCK
      ?auto_8734 - BLOCK
      ?auto_8735 - BLOCK
      ?auto_8736 - BLOCK
      ?auto_8737 - BLOCK
    )
    :vars
    (
      ?auto_8738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8737 ?auto_8738 ) ( not ( = ?auto_8733 ?auto_8734 ) ) ( not ( = ?auto_8733 ?auto_8735 ) ) ( not ( = ?auto_8733 ?auto_8736 ) ) ( not ( = ?auto_8733 ?auto_8737 ) ) ( not ( = ?auto_8733 ?auto_8738 ) ) ( not ( = ?auto_8734 ?auto_8735 ) ) ( not ( = ?auto_8734 ?auto_8736 ) ) ( not ( = ?auto_8734 ?auto_8737 ) ) ( not ( = ?auto_8734 ?auto_8738 ) ) ( not ( = ?auto_8735 ?auto_8736 ) ) ( not ( = ?auto_8735 ?auto_8737 ) ) ( not ( = ?auto_8735 ?auto_8738 ) ) ( not ( = ?auto_8736 ?auto_8737 ) ) ( not ( = ?auto_8736 ?auto_8738 ) ) ( not ( = ?auto_8737 ?auto_8738 ) ) ( ON ?auto_8736 ?auto_8737 ) ( ON ?auto_8735 ?auto_8736 ) ( ON ?auto_8734 ?auto_8735 ) ( ON ?auto_8733 ?auto_8734 ) ( CLEAR ?auto_8733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8733 )
      ( MAKE-5PILE ?auto_8733 ?auto_8734 ?auto_8735 ?auto_8736 ?auto_8737 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8744 - BLOCK
      ?auto_8745 - BLOCK
      ?auto_8746 - BLOCK
      ?auto_8747 - BLOCK
      ?auto_8748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8748 ) ( not ( = ?auto_8744 ?auto_8745 ) ) ( not ( = ?auto_8744 ?auto_8746 ) ) ( not ( = ?auto_8744 ?auto_8747 ) ) ( not ( = ?auto_8744 ?auto_8748 ) ) ( not ( = ?auto_8745 ?auto_8746 ) ) ( not ( = ?auto_8745 ?auto_8747 ) ) ( not ( = ?auto_8745 ?auto_8748 ) ) ( not ( = ?auto_8746 ?auto_8747 ) ) ( not ( = ?auto_8746 ?auto_8748 ) ) ( not ( = ?auto_8747 ?auto_8748 ) ) ( ON ?auto_8747 ?auto_8748 ) ( ON ?auto_8746 ?auto_8747 ) ( ON ?auto_8745 ?auto_8746 ) ( ON ?auto_8744 ?auto_8745 ) ( CLEAR ?auto_8744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8744 )
      ( MAKE-5PILE ?auto_8744 ?auto_8745 ?auto_8746 ?auto_8747 ?auto_8748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8754 - BLOCK
      ?auto_8755 - BLOCK
      ?auto_8756 - BLOCK
      ?auto_8757 - BLOCK
      ?auto_8758 - BLOCK
    )
    :vars
    (
      ?auto_8759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_8754 ?auto_8755 ) ) ( not ( = ?auto_8754 ?auto_8756 ) ) ( not ( = ?auto_8754 ?auto_8757 ) ) ( not ( = ?auto_8754 ?auto_8758 ) ) ( not ( = ?auto_8755 ?auto_8756 ) ) ( not ( = ?auto_8755 ?auto_8757 ) ) ( not ( = ?auto_8755 ?auto_8758 ) ) ( not ( = ?auto_8756 ?auto_8757 ) ) ( not ( = ?auto_8756 ?auto_8758 ) ) ( not ( = ?auto_8757 ?auto_8758 ) ) ( ON ?auto_8754 ?auto_8759 ) ( not ( = ?auto_8758 ?auto_8759 ) ) ( not ( = ?auto_8757 ?auto_8759 ) ) ( not ( = ?auto_8756 ?auto_8759 ) ) ( not ( = ?auto_8755 ?auto_8759 ) ) ( not ( = ?auto_8754 ?auto_8759 ) ) ( ON ?auto_8755 ?auto_8754 ) ( ON ?auto_8756 ?auto_8755 ) ( ON ?auto_8757 ?auto_8756 ) ( ON ?auto_8758 ?auto_8757 ) ( CLEAR ?auto_8758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_8758 ?auto_8757 ?auto_8756 ?auto_8755 ?auto_8754 )
      ( MAKE-5PILE ?auto_8754 ?auto_8755 ?auto_8756 ?auto_8757 ?auto_8758 ) )
  )

)

