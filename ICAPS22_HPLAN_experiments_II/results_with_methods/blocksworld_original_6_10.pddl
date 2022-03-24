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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57556 - BLOCK
      ?auto_57557 - BLOCK
      ?auto_57558 - BLOCK
      ?auto_57559 - BLOCK
      ?auto_57560 - BLOCK
      ?auto_57561 - BLOCK
    )
    :vars
    (
      ?auto_57562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57562 ?auto_57561 ) ( CLEAR ?auto_57562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57556 ) ( ON ?auto_57557 ?auto_57556 ) ( ON ?auto_57558 ?auto_57557 ) ( ON ?auto_57559 ?auto_57558 ) ( ON ?auto_57560 ?auto_57559 ) ( ON ?auto_57561 ?auto_57560 ) ( not ( = ?auto_57556 ?auto_57557 ) ) ( not ( = ?auto_57556 ?auto_57558 ) ) ( not ( = ?auto_57556 ?auto_57559 ) ) ( not ( = ?auto_57556 ?auto_57560 ) ) ( not ( = ?auto_57556 ?auto_57561 ) ) ( not ( = ?auto_57556 ?auto_57562 ) ) ( not ( = ?auto_57557 ?auto_57558 ) ) ( not ( = ?auto_57557 ?auto_57559 ) ) ( not ( = ?auto_57557 ?auto_57560 ) ) ( not ( = ?auto_57557 ?auto_57561 ) ) ( not ( = ?auto_57557 ?auto_57562 ) ) ( not ( = ?auto_57558 ?auto_57559 ) ) ( not ( = ?auto_57558 ?auto_57560 ) ) ( not ( = ?auto_57558 ?auto_57561 ) ) ( not ( = ?auto_57558 ?auto_57562 ) ) ( not ( = ?auto_57559 ?auto_57560 ) ) ( not ( = ?auto_57559 ?auto_57561 ) ) ( not ( = ?auto_57559 ?auto_57562 ) ) ( not ( = ?auto_57560 ?auto_57561 ) ) ( not ( = ?auto_57560 ?auto_57562 ) ) ( not ( = ?auto_57561 ?auto_57562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57562 ?auto_57561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57564 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57564 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_57564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57565 - BLOCK
    )
    :vars
    (
      ?auto_57566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57565 ?auto_57566 ) ( CLEAR ?auto_57565 ) ( HAND-EMPTY ) ( not ( = ?auto_57565 ?auto_57566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57565 ?auto_57566 )
      ( MAKE-1PILE ?auto_57565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57572 - BLOCK
      ?auto_57573 - BLOCK
      ?auto_57574 - BLOCK
      ?auto_57575 - BLOCK
      ?auto_57576 - BLOCK
    )
    :vars
    (
      ?auto_57577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57577 ?auto_57576 ) ( CLEAR ?auto_57577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57572 ) ( ON ?auto_57573 ?auto_57572 ) ( ON ?auto_57574 ?auto_57573 ) ( ON ?auto_57575 ?auto_57574 ) ( ON ?auto_57576 ?auto_57575 ) ( not ( = ?auto_57572 ?auto_57573 ) ) ( not ( = ?auto_57572 ?auto_57574 ) ) ( not ( = ?auto_57572 ?auto_57575 ) ) ( not ( = ?auto_57572 ?auto_57576 ) ) ( not ( = ?auto_57572 ?auto_57577 ) ) ( not ( = ?auto_57573 ?auto_57574 ) ) ( not ( = ?auto_57573 ?auto_57575 ) ) ( not ( = ?auto_57573 ?auto_57576 ) ) ( not ( = ?auto_57573 ?auto_57577 ) ) ( not ( = ?auto_57574 ?auto_57575 ) ) ( not ( = ?auto_57574 ?auto_57576 ) ) ( not ( = ?auto_57574 ?auto_57577 ) ) ( not ( = ?auto_57575 ?auto_57576 ) ) ( not ( = ?auto_57575 ?auto_57577 ) ) ( not ( = ?auto_57576 ?auto_57577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57577 ?auto_57576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57578 - BLOCK
      ?auto_57579 - BLOCK
      ?auto_57580 - BLOCK
      ?auto_57581 - BLOCK
      ?auto_57582 - BLOCK
    )
    :vars
    (
      ?auto_57583 - BLOCK
      ?auto_57584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57583 ?auto_57582 ) ( CLEAR ?auto_57583 ) ( ON-TABLE ?auto_57578 ) ( ON ?auto_57579 ?auto_57578 ) ( ON ?auto_57580 ?auto_57579 ) ( ON ?auto_57581 ?auto_57580 ) ( ON ?auto_57582 ?auto_57581 ) ( not ( = ?auto_57578 ?auto_57579 ) ) ( not ( = ?auto_57578 ?auto_57580 ) ) ( not ( = ?auto_57578 ?auto_57581 ) ) ( not ( = ?auto_57578 ?auto_57582 ) ) ( not ( = ?auto_57578 ?auto_57583 ) ) ( not ( = ?auto_57579 ?auto_57580 ) ) ( not ( = ?auto_57579 ?auto_57581 ) ) ( not ( = ?auto_57579 ?auto_57582 ) ) ( not ( = ?auto_57579 ?auto_57583 ) ) ( not ( = ?auto_57580 ?auto_57581 ) ) ( not ( = ?auto_57580 ?auto_57582 ) ) ( not ( = ?auto_57580 ?auto_57583 ) ) ( not ( = ?auto_57581 ?auto_57582 ) ) ( not ( = ?auto_57581 ?auto_57583 ) ) ( not ( = ?auto_57582 ?auto_57583 ) ) ( HOLDING ?auto_57584 ) ( not ( = ?auto_57578 ?auto_57584 ) ) ( not ( = ?auto_57579 ?auto_57584 ) ) ( not ( = ?auto_57580 ?auto_57584 ) ) ( not ( = ?auto_57581 ?auto_57584 ) ) ( not ( = ?auto_57582 ?auto_57584 ) ) ( not ( = ?auto_57583 ?auto_57584 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_57584 )
      ( MAKE-5PILE ?auto_57578 ?auto_57579 ?auto_57580 ?auto_57581 ?auto_57582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57585 - BLOCK
      ?auto_57586 - BLOCK
      ?auto_57587 - BLOCK
      ?auto_57588 - BLOCK
      ?auto_57589 - BLOCK
    )
    :vars
    (
      ?auto_57591 - BLOCK
      ?auto_57590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57591 ?auto_57589 ) ( ON-TABLE ?auto_57585 ) ( ON ?auto_57586 ?auto_57585 ) ( ON ?auto_57587 ?auto_57586 ) ( ON ?auto_57588 ?auto_57587 ) ( ON ?auto_57589 ?auto_57588 ) ( not ( = ?auto_57585 ?auto_57586 ) ) ( not ( = ?auto_57585 ?auto_57587 ) ) ( not ( = ?auto_57585 ?auto_57588 ) ) ( not ( = ?auto_57585 ?auto_57589 ) ) ( not ( = ?auto_57585 ?auto_57591 ) ) ( not ( = ?auto_57586 ?auto_57587 ) ) ( not ( = ?auto_57586 ?auto_57588 ) ) ( not ( = ?auto_57586 ?auto_57589 ) ) ( not ( = ?auto_57586 ?auto_57591 ) ) ( not ( = ?auto_57587 ?auto_57588 ) ) ( not ( = ?auto_57587 ?auto_57589 ) ) ( not ( = ?auto_57587 ?auto_57591 ) ) ( not ( = ?auto_57588 ?auto_57589 ) ) ( not ( = ?auto_57588 ?auto_57591 ) ) ( not ( = ?auto_57589 ?auto_57591 ) ) ( not ( = ?auto_57585 ?auto_57590 ) ) ( not ( = ?auto_57586 ?auto_57590 ) ) ( not ( = ?auto_57587 ?auto_57590 ) ) ( not ( = ?auto_57588 ?auto_57590 ) ) ( not ( = ?auto_57589 ?auto_57590 ) ) ( not ( = ?auto_57591 ?auto_57590 ) ) ( ON ?auto_57590 ?auto_57591 ) ( CLEAR ?auto_57590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57585 ?auto_57586 ?auto_57587 ?auto_57588 ?auto_57589 ?auto_57591 )
      ( MAKE-5PILE ?auto_57585 ?auto_57586 ?auto_57587 ?auto_57588 ?auto_57589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57594 - BLOCK
      ?auto_57595 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57595 ) ( CLEAR ?auto_57594 ) ( ON-TABLE ?auto_57594 ) ( not ( = ?auto_57594 ?auto_57595 ) ) )
    :subtasks
    ( ( !STACK ?auto_57595 ?auto_57594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57596 - BLOCK
      ?auto_57597 - BLOCK
    )
    :vars
    (
      ?auto_57598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57596 ) ( ON-TABLE ?auto_57596 ) ( not ( = ?auto_57596 ?auto_57597 ) ) ( ON ?auto_57597 ?auto_57598 ) ( CLEAR ?auto_57597 ) ( HAND-EMPTY ) ( not ( = ?auto_57596 ?auto_57598 ) ) ( not ( = ?auto_57597 ?auto_57598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57597 ?auto_57598 )
      ( MAKE-2PILE ?auto_57596 ?auto_57597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57599 - BLOCK
      ?auto_57600 - BLOCK
    )
    :vars
    (
      ?auto_57601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57599 ?auto_57600 ) ) ( ON ?auto_57600 ?auto_57601 ) ( CLEAR ?auto_57600 ) ( not ( = ?auto_57599 ?auto_57601 ) ) ( not ( = ?auto_57600 ?auto_57601 ) ) ( HOLDING ?auto_57599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57599 )
      ( MAKE-2PILE ?auto_57599 ?auto_57600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57602 - BLOCK
      ?auto_57603 - BLOCK
    )
    :vars
    (
      ?auto_57604 - BLOCK
      ?auto_57606 - BLOCK
      ?auto_57607 - BLOCK
      ?auto_57608 - BLOCK
      ?auto_57605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57602 ?auto_57603 ) ) ( ON ?auto_57603 ?auto_57604 ) ( not ( = ?auto_57602 ?auto_57604 ) ) ( not ( = ?auto_57603 ?auto_57604 ) ) ( ON ?auto_57602 ?auto_57603 ) ( CLEAR ?auto_57602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57606 ) ( ON ?auto_57607 ?auto_57606 ) ( ON ?auto_57608 ?auto_57607 ) ( ON ?auto_57605 ?auto_57608 ) ( ON ?auto_57604 ?auto_57605 ) ( not ( = ?auto_57606 ?auto_57607 ) ) ( not ( = ?auto_57606 ?auto_57608 ) ) ( not ( = ?auto_57606 ?auto_57605 ) ) ( not ( = ?auto_57606 ?auto_57604 ) ) ( not ( = ?auto_57606 ?auto_57603 ) ) ( not ( = ?auto_57606 ?auto_57602 ) ) ( not ( = ?auto_57607 ?auto_57608 ) ) ( not ( = ?auto_57607 ?auto_57605 ) ) ( not ( = ?auto_57607 ?auto_57604 ) ) ( not ( = ?auto_57607 ?auto_57603 ) ) ( not ( = ?auto_57607 ?auto_57602 ) ) ( not ( = ?auto_57608 ?auto_57605 ) ) ( not ( = ?auto_57608 ?auto_57604 ) ) ( not ( = ?auto_57608 ?auto_57603 ) ) ( not ( = ?auto_57608 ?auto_57602 ) ) ( not ( = ?auto_57605 ?auto_57604 ) ) ( not ( = ?auto_57605 ?auto_57603 ) ) ( not ( = ?auto_57605 ?auto_57602 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57606 ?auto_57607 ?auto_57608 ?auto_57605 ?auto_57604 ?auto_57603 )
      ( MAKE-2PILE ?auto_57602 ?auto_57603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57613 - BLOCK
      ?auto_57614 - BLOCK
      ?auto_57615 - BLOCK
      ?auto_57616 - BLOCK
    )
    :vars
    (
      ?auto_57617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57617 ?auto_57616 ) ( CLEAR ?auto_57617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57613 ) ( ON ?auto_57614 ?auto_57613 ) ( ON ?auto_57615 ?auto_57614 ) ( ON ?auto_57616 ?auto_57615 ) ( not ( = ?auto_57613 ?auto_57614 ) ) ( not ( = ?auto_57613 ?auto_57615 ) ) ( not ( = ?auto_57613 ?auto_57616 ) ) ( not ( = ?auto_57613 ?auto_57617 ) ) ( not ( = ?auto_57614 ?auto_57615 ) ) ( not ( = ?auto_57614 ?auto_57616 ) ) ( not ( = ?auto_57614 ?auto_57617 ) ) ( not ( = ?auto_57615 ?auto_57616 ) ) ( not ( = ?auto_57615 ?auto_57617 ) ) ( not ( = ?auto_57616 ?auto_57617 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57617 ?auto_57616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57618 - BLOCK
      ?auto_57619 - BLOCK
      ?auto_57620 - BLOCK
      ?auto_57621 - BLOCK
    )
    :vars
    (
      ?auto_57622 - BLOCK
      ?auto_57623 - BLOCK
      ?auto_57624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57622 ?auto_57621 ) ( CLEAR ?auto_57622 ) ( ON-TABLE ?auto_57618 ) ( ON ?auto_57619 ?auto_57618 ) ( ON ?auto_57620 ?auto_57619 ) ( ON ?auto_57621 ?auto_57620 ) ( not ( = ?auto_57618 ?auto_57619 ) ) ( not ( = ?auto_57618 ?auto_57620 ) ) ( not ( = ?auto_57618 ?auto_57621 ) ) ( not ( = ?auto_57618 ?auto_57622 ) ) ( not ( = ?auto_57619 ?auto_57620 ) ) ( not ( = ?auto_57619 ?auto_57621 ) ) ( not ( = ?auto_57619 ?auto_57622 ) ) ( not ( = ?auto_57620 ?auto_57621 ) ) ( not ( = ?auto_57620 ?auto_57622 ) ) ( not ( = ?auto_57621 ?auto_57622 ) ) ( HOLDING ?auto_57623 ) ( CLEAR ?auto_57624 ) ( not ( = ?auto_57618 ?auto_57623 ) ) ( not ( = ?auto_57618 ?auto_57624 ) ) ( not ( = ?auto_57619 ?auto_57623 ) ) ( not ( = ?auto_57619 ?auto_57624 ) ) ( not ( = ?auto_57620 ?auto_57623 ) ) ( not ( = ?auto_57620 ?auto_57624 ) ) ( not ( = ?auto_57621 ?auto_57623 ) ) ( not ( = ?auto_57621 ?auto_57624 ) ) ( not ( = ?auto_57622 ?auto_57623 ) ) ( not ( = ?auto_57622 ?auto_57624 ) ) ( not ( = ?auto_57623 ?auto_57624 ) ) )
    :subtasks
    ( ( !STACK ?auto_57623 ?auto_57624 )
      ( MAKE-4PILE ?auto_57618 ?auto_57619 ?auto_57620 ?auto_57621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57625 - BLOCK
      ?auto_57626 - BLOCK
      ?auto_57627 - BLOCK
      ?auto_57628 - BLOCK
    )
    :vars
    (
      ?auto_57631 - BLOCK
      ?auto_57630 - BLOCK
      ?auto_57629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57631 ?auto_57628 ) ( ON-TABLE ?auto_57625 ) ( ON ?auto_57626 ?auto_57625 ) ( ON ?auto_57627 ?auto_57626 ) ( ON ?auto_57628 ?auto_57627 ) ( not ( = ?auto_57625 ?auto_57626 ) ) ( not ( = ?auto_57625 ?auto_57627 ) ) ( not ( = ?auto_57625 ?auto_57628 ) ) ( not ( = ?auto_57625 ?auto_57631 ) ) ( not ( = ?auto_57626 ?auto_57627 ) ) ( not ( = ?auto_57626 ?auto_57628 ) ) ( not ( = ?auto_57626 ?auto_57631 ) ) ( not ( = ?auto_57627 ?auto_57628 ) ) ( not ( = ?auto_57627 ?auto_57631 ) ) ( not ( = ?auto_57628 ?auto_57631 ) ) ( CLEAR ?auto_57630 ) ( not ( = ?auto_57625 ?auto_57629 ) ) ( not ( = ?auto_57625 ?auto_57630 ) ) ( not ( = ?auto_57626 ?auto_57629 ) ) ( not ( = ?auto_57626 ?auto_57630 ) ) ( not ( = ?auto_57627 ?auto_57629 ) ) ( not ( = ?auto_57627 ?auto_57630 ) ) ( not ( = ?auto_57628 ?auto_57629 ) ) ( not ( = ?auto_57628 ?auto_57630 ) ) ( not ( = ?auto_57631 ?auto_57629 ) ) ( not ( = ?auto_57631 ?auto_57630 ) ) ( not ( = ?auto_57629 ?auto_57630 ) ) ( ON ?auto_57629 ?auto_57631 ) ( CLEAR ?auto_57629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57625 ?auto_57626 ?auto_57627 ?auto_57628 ?auto_57631 )
      ( MAKE-4PILE ?auto_57625 ?auto_57626 ?auto_57627 ?auto_57628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57632 - BLOCK
      ?auto_57633 - BLOCK
      ?auto_57634 - BLOCK
      ?auto_57635 - BLOCK
    )
    :vars
    (
      ?auto_57637 - BLOCK
      ?auto_57636 - BLOCK
      ?auto_57638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57637 ?auto_57635 ) ( ON-TABLE ?auto_57632 ) ( ON ?auto_57633 ?auto_57632 ) ( ON ?auto_57634 ?auto_57633 ) ( ON ?auto_57635 ?auto_57634 ) ( not ( = ?auto_57632 ?auto_57633 ) ) ( not ( = ?auto_57632 ?auto_57634 ) ) ( not ( = ?auto_57632 ?auto_57635 ) ) ( not ( = ?auto_57632 ?auto_57637 ) ) ( not ( = ?auto_57633 ?auto_57634 ) ) ( not ( = ?auto_57633 ?auto_57635 ) ) ( not ( = ?auto_57633 ?auto_57637 ) ) ( not ( = ?auto_57634 ?auto_57635 ) ) ( not ( = ?auto_57634 ?auto_57637 ) ) ( not ( = ?auto_57635 ?auto_57637 ) ) ( not ( = ?auto_57632 ?auto_57636 ) ) ( not ( = ?auto_57632 ?auto_57638 ) ) ( not ( = ?auto_57633 ?auto_57636 ) ) ( not ( = ?auto_57633 ?auto_57638 ) ) ( not ( = ?auto_57634 ?auto_57636 ) ) ( not ( = ?auto_57634 ?auto_57638 ) ) ( not ( = ?auto_57635 ?auto_57636 ) ) ( not ( = ?auto_57635 ?auto_57638 ) ) ( not ( = ?auto_57637 ?auto_57636 ) ) ( not ( = ?auto_57637 ?auto_57638 ) ) ( not ( = ?auto_57636 ?auto_57638 ) ) ( ON ?auto_57636 ?auto_57637 ) ( CLEAR ?auto_57636 ) ( HOLDING ?auto_57638 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57638 )
      ( MAKE-4PILE ?auto_57632 ?auto_57633 ?auto_57634 ?auto_57635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57639 - BLOCK
      ?auto_57640 - BLOCK
      ?auto_57641 - BLOCK
      ?auto_57642 - BLOCK
    )
    :vars
    (
      ?auto_57643 - BLOCK
      ?auto_57645 - BLOCK
      ?auto_57644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57643 ?auto_57642 ) ( ON-TABLE ?auto_57639 ) ( ON ?auto_57640 ?auto_57639 ) ( ON ?auto_57641 ?auto_57640 ) ( ON ?auto_57642 ?auto_57641 ) ( not ( = ?auto_57639 ?auto_57640 ) ) ( not ( = ?auto_57639 ?auto_57641 ) ) ( not ( = ?auto_57639 ?auto_57642 ) ) ( not ( = ?auto_57639 ?auto_57643 ) ) ( not ( = ?auto_57640 ?auto_57641 ) ) ( not ( = ?auto_57640 ?auto_57642 ) ) ( not ( = ?auto_57640 ?auto_57643 ) ) ( not ( = ?auto_57641 ?auto_57642 ) ) ( not ( = ?auto_57641 ?auto_57643 ) ) ( not ( = ?auto_57642 ?auto_57643 ) ) ( not ( = ?auto_57639 ?auto_57645 ) ) ( not ( = ?auto_57639 ?auto_57644 ) ) ( not ( = ?auto_57640 ?auto_57645 ) ) ( not ( = ?auto_57640 ?auto_57644 ) ) ( not ( = ?auto_57641 ?auto_57645 ) ) ( not ( = ?auto_57641 ?auto_57644 ) ) ( not ( = ?auto_57642 ?auto_57645 ) ) ( not ( = ?auto_57642 ?auto_57644 ) ) ( not ( = ?auto_57643 ?auto_57645 ) ) ( not ( = ?auto_57643 ?auto_57644 ) ) ( not ( = ?auto_57645 ?auto_57644 ) ) ( ON ?auto_57645 ?auto_57643 ) ( ON ?auto_57644 ?auto_57645 ) ( CLEAR ?auto_57644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57639 ?auto_57640 ?auto_57641 ?auto_57642 ?auto_57643 ?auto_57645 )
      ( MAKE-4PILE ?auto_57639 ?auto_57640 ?auto_57641 ?auto_57642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57649 - BLOCK
      ?auto_57650 - BLOCK
      ?auto_57651 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57651 ) ( CLEAR ?auto_57650 ) ( ON-TABLE ?auto_57649 ) ( ON ?auto_57650 ?auto_57649 ) ( not ( = ?auto_57649 ?auto_57650 ) ) ( not ( = ?auto_57649 ?auto_57651 ) ) ( not ( = ?auto_57650 ?auto_57651 ) ) )
    :subtasks
    ( ( !STACK ?auto_57651 ?auto_57650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57652 - BLOCK
      ?auto_57653 - BLOCK
      ?auto_57654 - BLOCK
    )
    :vars
    (
      ?auto_57655 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57653 ) ( ON-TABLE ?auto_57652 ) ( ON ?auto_57653 ?auto_57652 ) ( not ( = ?auto_57652 ?auto_57653 ) ) ( not ( = ?auto_57652 ?auto_57654 ) ) ( not ( = ?auto_57653 ?auto_57654 ) ) ( ON ?auto_57654 ?auto_57655 ) ( CLEAR ?auto_57654 ) ( HAND-EMPTY ) ( not ( = ?auto_57652 ?auto_57655 ) ) ( not ( = ?auto_57653 ?auto_57655 ) ) ( not ( = ?auto_57654 ?auto_57655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57654 ?auto_57655 )
      ( MAKE-3PILE ?auto_57652 ?auto_57653 ?auto_57654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57656 - BLOCK
      ?auto_57657 - BLOCK
      ?auto_57658 - BLOCK
    )
    :vars
    (
      ?auto_57659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57656 ) ( not ( = ?auto_57656 ?auto_57657 ) ) ( not ( = ?auto_57656 ?auto_57658 ) ) ( not ( = ?auto_57657 ?auto_57658 ) ) ( ON ?auto_57658 ?auto_57659 ) ( CLEAR ?auto_57658 ) ( not ( = ?auto_57656 ?auto_57659 ) ) ( not ( = ?auto_57657 ?auto_57659 ) ) ( not ( = ?auto_57658 ?auto_57659 ) ) ( HOLDING ?auto_57657 ) ( CLEAR ?auto_57656 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57656 ?auto_57657 )
      ( MAKE-3PILE ?auto_57656 ?auto_57657 ?auto_57658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57660 - BLOCK
      ?auto_57661 - BLOCK
      ?auto_57662 - BLOCK
    )
    :vars
    (
      ?auto_57663 - BLOCK
      ?auto_57665 - BLOCK
      ?auto_57664 - BLOCK
      ?auto_57666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57660 ) ( not ( = ?auto_57660 ?auto_57661 ) ) ( not ( = ?auto_57660 ?auto_57662 ) ) ( not ( = ?auto_57661 ?auto_57662 ) ) ( ON ?auto_57662 ?auto_57663 ) ( not ( = ?auto_57660 ?auto_57663 ) ) ( not ( = ?auto_57661 ?auto_57663 ) ) ( not ( = ?auto_57662 ?auto_57663 ) ) ( CLEAR ?auto_57660 ) ( ON ?auto_57661 ?auto_57662 ) ( CLEAR ?auto_57661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57665 ) ( ON ?auto_57664 ?auto_57665 ) ( ON ?auto_57666 ?auto_57664 ) ( ON ?auto_57663 ?auto_57666 ) ( not ( = ?auto_57665 ?auto_57664 ) ) ( not ( = ?auto_57665 ?auto_57666 ) ) ( not ( = ?auto_57665 ?auto_57663 ) ) ( not ( = ?auto_57665 ?auto_57662 ) ) ( not ( = ?auto_57665 ?auto_57661 ) ) ( not ( = ?auto_57664 ?auto_57666 ) ) ( not ( = ?auto_57664 ?auto_57663 ) ) ( not ( = ?auto_57664 ?auto_57662 ) ) ( not ( = ?auto_57664 ?auto_57661 ) ) ( not ( = ?auto_57666 ?auto_57663 ) ) ( not ( = ?auto_57666 ?auto_57662 ) ) ( not ( = ?auto_57666 ?auto_57661 ) ) ( not ( = ?auto_57660 ?auto_57665 ) ) ( not ( = ?auto_57660 ?auto_57664 ) ) ( not ( = ?auto_57660 ?auto_57666 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57665 ?auto_57664 ?auto_57666 ?auto_57663 ?auto_57662 )
      ( MAKE-3PILE ?auto_57660 ?auto_57661 ?auto_57662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57667 - BLOCK
      ?auto_57668 - BLOCK
      ?auto_57669 - BLOCK
    )
    :vars
    (
      ?auto_57673 - BLOCK
      ?auto_57671 - BLOCK
      ?auto_57670 - BLOCK
      ?auto_57672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57667 ?auto_57668 ) ) ( not ( = ?auto_57667 ?auto_57669 ) ) ( not ( = ?auto_57668 ?auto_57669 ) ) ( ON ?auto_57669 ?auto_57673 ) ( not ( = ?auto_57667 ?auto_57673 ) ) ( not ( = ?auto_57668 ?auto_57673 ) ) ( not ( = ?auto_57669 ?auto_57673 ) ) ( ON ?auto_57668 ?auto_57669 ) ( CLEAR ?auto_57668 ) ( ON-TABLE ?auto_57671 ) ( ON ?auto_57670 ?auto_57671 ) ( ON ?auto_57672 ?auto_57670 ) ( ON ?auto_57673 ?auto_57672 ) ( not ( = ?auto_57671 ?auto_57670 ) ) ( not ( = ?auto_57671 ?auto_57672 ) ) ( not ( = ?auto_57671 ?auto_57673 ) ) ( not ( = ?auto_57671 ?auto_57669 ) ) ( not ( = ?auto_57671 ?auto_57668 ) ) ( not ( = ?auto_57670 ?auto_57672 ) ) ( not ( = ?auto_57670 ?auto_57673 ) ) ( not ( = ?auto_57670 ?auto_57669 ) ) ( not ( = ?auto_57670 ?auto_57668 ) ) ( not ( = ?auto_57672 ?auto_57673 ) ) ( not ( = ?auto_57672 ?auto_57669 ) ) ( not ( = ?auto_57672 ?auto_57668 ) ) ( not ( = ?auto_57667 ?auto_57671 ) ) ( not ( = ?auto_57667 ?auto_57670 ) ) ( not ( = ?auto_57667 ?auto_57672 ) ) ( HOLDING ?auto_57667 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57667 )
      ( MAKE-3PILE ?auto_57667 ?auto_57668 ?auto_57669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57674 - BLOCK
      ?auto_57675 - BLOCK
      ?auto_57676 - BLOCK
    )
    :vars
    (
      ?auto_57679 - BLOCK
      ?auto_57677 - BLOCK
      ?auto_57678 - BLOCK
      ?auto_57680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57674 ?auto_57675 ) ) ( not ( = ?auto_57674 ?auto_57676 ) ) ( not ( = ?auto_57675 ?auto_57676 ) ) ( ON ?auto_57676 ?auto_57679 ) ( not ( = ?auto_57674 ?auto_57679 ) ) ( not ( = ?auto_57675 ?auto_57679 ) ) ( not ( = ?auto_57676 ?auto_57679 ) ) ( ON ?auto_57675 ?auto_57676 ) ( ON-TABLE ?auto_57677 ) ( ON ?auto_57678 ?auto_57677 ) ( ON ?auto_57680 ?auto_57678 ) ( ON ?auto_57679 ?auto_57680 ) ( not ( = ?auto_57677 ?auto_57678 ) ) ( not ( = ?auto_57677 ?auto_57680 ) ) ( not ( = ?auto_57677 ?auto_57679 ) ) ( not ( = ?auto_57677 ?auto_57676 ) ) ( not ( = ?auto_57677 ?auto_57675 ) ) ( not ( = ?auto_57678 ?auto_57680 ) ) ( not ( = ?auto_57678 ?auto_57679 ) ) ( not ( = ?auto_57678 ?auto_57676 ) ) ( not ( = ?auto_57678 ?auto_57675 ) ) ( not ( = ?auto_57680 ?auto_57679 ) ) ( not ( = ?auto_57680 ?auto_57676 ) ) ( not ( = ?auto_57680 ?auto_57675 ) ) ( not ( = ?auto_57674 ?auto_57677 ) ) ( not ( = ?auto_57674 ?auto_57678 ) ) ( not ( = ?auto_57674 ?auto_57680 ) ) ( ON ?auto_57674 ?auto_57675 ) ( CLEAR ?auto_57674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57677 ?auto_57678 ?auto_57680 ?auto_57679 ?auto_57676 ?auto_57675 )
      ( MAKE-3PILE ?auto_57674 ?auto_57675 ?auto_57676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57684 - BLOCK
      ?auto_57685 - BLOCK
      ?auto_57686 - BLOCK
    )
    :vars
    (
      ?auto_57687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57687 ?auto_57686 ) ( CLEAR ?auto_57687 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57684 ) ( ON ?auto_57685 ?auto_57684 ) ( ON ?auto_57686 ?auto_57685 ) ( not ( = ?auto_57684 ?auto_57685 ) ) ( not ( = ?auto_57684 ?auto_57686 ) ) ( not ( = ?auto_57684 ?auto_57687 ) ) ( not ( = ?auto_57685 ?auto_57686 ) ) ( not ( = ?auto_57685 ?auto_57687 ) ) ( not ( = ?auto_57686 ?auto_57687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57687 ?auto_57686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57688 - BLOCK
      ?auto_57689 - BLOCK
      ?auto_57690 - BLOCK
    )
    :vars
    (
      ?auto_57691 - BLOCK
      ?auto_57692 - BLOCK
      ?auto_57693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57691 ?auto_57690 ) ( CLEAR ?auto_57691 ) ( ON-TABLE ?auto_57688 ) ( ON ?auto_57689 ?auto_57688 ) ( ON ?auto_57690 ?auto_57689 ) ( not ( = ?auto_57688 ?auto_57689 ) ) ( not ( = ?auto_57688 ?auto_57690 ) ) ( not ( = ?auto_57688 ?auto_57691 ) ) ( not ( = ?auto_57689 ?auto_57690 ) ) ( not ( = ?auto_57689 ?auto_57691 ) ) ( not ( = ?auto_57690 ?auto_57691 ) ) ( HOLDING ?auto_57692 ) ( CLEAR ?auto_57693 ) ( not ( = ?auto_57688 ?auto_57692 ) ) ( not ( = ?auto_57688 ?auto_57693 ) ) ( not ( = ?auto_57689 ?auto_57692 ) ) ( not ( = ?auto_57689 ?auto_57693 ) ) ( not ( = ?auto_57690 ?auto_57692 ) ) ( not ( = ?auto_57690 ?auto_57693 ) ) ( not ( = ?auto_57691 ?auto_57692 ) ) ( not ( = ?auto_57691 ?auto_57693 ) ) ( not ( = ?auto_57692 ?auto_57693 ) ) )
    :subtasks
    ( ( !STACK ?auto_57692 ?auto_57693 )
      ( MAKE-3PILE ?auto_57688 ?auto_57689 ?auto_57690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57694 - BLOCK
      ?auto_57695 - BLOCK
      ?auto_57696 - BLOCK
    )
    :vars
    (
      ?auto_57697 - BLOCK
      ?auto_57698 - BLOCK
      ?auto_57699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57697 ?auto_57696 ) ( ON-TABLE ?auto_57694 ) ( ON ?auto_57695 ?auto_57694 ) ( ON ?auto_57696 ?auto_57695 ) ( not ( = ?auto_57694 ?auto_57695 ) ) ( not ( = ?auto_57694 ?auto_57696 ) ) ( not ( = ?auto_57694 ?auto_57697 ) ) ( not ( = ?auto_57695 ?auto_57696 ) ) ( not ( = ?auto_57695 ?auto_57697 ) ) ( not ( = ?auto_57696 ?auto_57697 ) ) ( CLEAR ?auto_57698 ) ( not ( = ?auto_57694 ?auto_57699 ) ) ( not ( = ?auto_57694 ?auto_57698 ) ) ( not ( = ?auto_57695 ?auto_57699 ) ) ( not ( = ?auto_57695 ?auto_57698 ) ) ( not ( = ?auto_57696 ?auto_57699 ) ) ( not ( = ?auto_57696 ?auto_57698 ) ) ( not ( = ?auto_57697 ?auto_57699 ) ) ( not ( = ?auto_57697 ?auto_57698 ) ) ( not ( = ?auto_57699 ?auto_57698 ) ) ( ON ?auto_57699 ?auto_57697 ) ( CLEAR ?auto_57699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57694 ?auto_57695 ?auto_57696 ?auto_57697 )
      ( MAKE-3PILE ?auto_57694 ?auto_57695 ?auto_57696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57700 - BLOCK
      ?auto_57701 - BLOCK
      ?auto_57702 - BLOCK
    )
    :vars
    (
      ?auto_57705 - BLOCK
      ?auto_57703 - BLOCK
      ?auto_57704 - BLOCK
      ?auto_57706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57705 ?auto_57702 ) ( ON-TABLE ?auto_57700 ) ( ON ?auto_57701 ?auto_57700 ) ( ON ?auto_57702 ?auto_57701 ) ( not ( = ?auto_57700 ?auto_57701 ) ) ( not ( = ?auto_57700 ?auto_57702 ) ) ( not ( = ?auto_57700 ?auto_57705 ) ) ( not ( = ?auto_57701 ?auto_57702 ) ) ( not ( = ?auto_57701 ?auto_57705 ) ) ( not ( = ?auto_57702 ?auto_57705 ) ) ( not ( = ?auto_57700 ?auto_57703 ) ) ( not ( = ?auto_57700 ?auto_57704 ) ) ( not ( = ?auto_57701 ?auto_57703 ) ) ( not ( = ?auto_57701 ?auto_57704 ) ) ( not ( = ?auto_57702 ?auto_57703 ) ) ( not ( = ?auto_57702 ?auto_57704 ) ) ( not ( = ?auto_57705 ?auto_57703 ) ) ( not ( = ?auto_57705 ?auto_57704 ) ) ( not ( = ?auto_57703 ?auto_57704 ) ) ( ON ?auto_57703 ?auto_57705 ) ( CLEAR ?auto_57703 ) ( HOLDING ?auto_57704 ) ( CLEAR ?auto_57706 ) ( ON-TABLE ?auto_57706 ) ( not ( = ?auto_57706 ?auto_57704 ) ) ( not ( = ?auto_57700 ?auto_57706 ) ) ( not ( = ?auto_57701 ?auto_57706 ) ) ( not ( = ?auto_57702 ?auto_57706 ) ) ( not ( = ?auto_57705 ?auto_57706 ) ) ( not ( = ?auto_57703 ?auto_57706 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57706 ?auto_57704 )
      ( MAKE-3PILE ?auto_57700 ?auto_57701 ?auto_57702 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57707 - BLOCK
      ?auto_57708 - BLOCK
      ?auto_57709 - BLOCK
    )
    :vars
    (
      ?auto_57713 - BLOCK
      ?auto_57710 - BLOCK
      ?auto_57712 - BLOCK
      ?auto_57711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57713 ?auto_57709 ) ( ON-TABLE ?auto_57707 ) ( ON ?auto_57708 ?auto_57707 ) ( ON ?auto_57709 ?auto_57708 ) ( not ( = ?auto_57707 ?auto_57708 ) ) ( not ( = ?auto_57707 ?auto_57709 ) ) ( not ( = ?auto_57707 ?auto_57713 ) ) ( not ( = ?auto_57708 ?auto_57709 ) ) ( not ( = ?auto_57708 ?auto_57713 ) ) ( not ( = ?auto_57709 ?auto_57713 ) ) ( not ( = ?auto_57707 ?auto_57710 ) ) ( not ( = ?auto_57707 ?auto_57712 ) ) ( not ( = ?auto_57708 ?auto_57710 ) ) ( not ( = ?auto_57708 ?auto_57712 ) ) ( not ( = ?auto_57709 ?auto_57710 ) ) ( not ( = ?auto_57709 ?auto_57712 ) ) ( not ( = ?auto_57713 ?auto_57710 ) ) ( not ( = ?auto_57713 ?auto_57712 ) ) ( not ( = ?auto_57710 ?auto_57712 ) ) ( ON ?auto_57710 ?auto_57713 ) ( CLEAR ?auto_57711 ) ( ON-TABLE ?auto_57711 ) ( not ( = ?auto_57711 ?auto_57712 ) ) ( not ( = ?auto_57707 ?auto_57711 ) ) ( not ( = ?auto_57708 ?auto_57711 ) ) ( not ( = ?auto_57709 ?auto_57711 ) ) ( not ( = ?auto_57713 ?auto_57711 ) ) ( not ( = ?auto_57710 ?auto_57711 ) ) ( ON ?auto_57712 ?auto_57710 ) ( CLEAR ?auto_57712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57707 ?auto_57708 ?auto_57709 ?auto_57713 ?auto_57710 )
      ( MAKE-3PILE ?auto_57707 ?auto_57708 ?auto_57709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57714 - BLOCK
      ?auto_57715 - BLOCK
      ?auto_57716 - BLOCK
    )
    :vars
    (
      ?auto_57717 - BLOCK
      ?auto_57718 - BLOCK
      ?auto_57720 - BLOCK
      ?auto_57719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57717 ?auto_57716 ) ( ON-TABLE ?auto_57714 ) ( ON ?auto_57715 ?auto_57714 ) ( ON ?auto_57716 ?auto_57715 ) ( not ( = ?auto_57714 ?auto_57715 ) ) ( not ( = ?auto_57714 ?auto_57716 ) ) ( not ( = ?auto_57714 ?auto_57717 ) ) ( not ( = ?auto_57715 ?auto_57716 ) ) ( not ( = ?auto_57715 ?auto_57717 ) ) ( not ( = ?auto_57716 ?auto_57717 ) ) ( not ( = ?auto_57714 ?auto_57718 ) ) ( not ( = ?auto_57714 ?auto_57720 ) ) ( not ( = ?auto_57715 ?auto_57718 ) ) ( not ( = ?auto_57715 ?auto_57720 ) ) ( not ( = ?auto_57716 ?auto_57718 ) ) ( not ( = ?auto_57716 ?auto_57720 ) ) ( not ( = ?auto_57717 ?auto_57718 ) ) ( not ( = ?auto_57717 ?auto_57720 ) ) ( not ( = ?auto_57718 ?auto_57720 ) ) ( ON ?auto_57718 ?auto_57717 ) ( not ( = ?auto_57719 ?auto_57720 ) ) ( not ( = ?auto_57714 ?auto_57719 ) ) ( not ( = ?auto_57715 ?auto_57719 ) ) ( not ( = ?auto_57716 ?auto_57719 ) ) ( not ( = ?auto_57717 ?auto_57719 ) ) ( not ( = ?auto_57718 ?auto_57719 ) ) ( ON ?auto_57720 ?auto_57718 ) ( CLEAR ?auto_57720 ) ( HOLDING ?auto_57719 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57719 )
      ( MAKE-3PILE ?auto_57714 ?auto_57715 ?auto_57716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_57721 - BLOCK
      ?auto_57722 - BLOCK
      ?auto_57723 - BLOCK
    )
    :vars
    (
      ?auto_57726 - BLOCK
      ?auto_57727 - BLOCK
      ?auto_57724 - BLOCK
      ?auto_57725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57726 ?auto_57723 ) ( ON-TABLE ?auto_57721 ) ( ON ?auto_57722 ?auto_57721 ) ( ON ?auto_57723 ?auto_57722 ) ( not ( = ?auto_57721 ?auto_57722 ) ) ( not ( = ?auto_57721 ?auto_57723 ) ) ( not ( = ?auto_57721 ?auto_57726 ) ) ( not ( = ?auto_57722 ?auto_57723 ) ) ( not ( = ?auto_57722 ?auto_57726 ) ) ( not ( = ?auto_57723 ?auto_57726 ) ) ( not ( = ?auto_57721 ?auto_57727 ) ) ( not ( = ?auto_57721 ?auto_57724 ) ) ( not ( = ?auto_57722 ?auto_57727 ) ) ( not ( = ?auto_57722 ?auto_57724 ) ) ( not ( = ?auto_57723 ?auto_57727 ) ) ( not ( = ?auto_57723 ?auto_57724 ) ) ( not ( = ?auto_57726 ?auto_57727 ) ) ( not ( = ?auto_57726 ?auto_57724 ) ) ( not ( = ?auto_57727 ?auto_57724 ) ) ( ON ?auto_57727 ?auto_57726 ) ( not ( = ?auto_57725 ?auto_57724 ) ) ( not ( = ?auto_57721 ?auto_57725 ) ) ( not ( = ?auto_57722 ?auto_57725 ) ) ( not ( = ?auto_57723 ?auto_57725 ) ) ( not ( = ?auto_57726 ?auto_57725 ) ) ( not ( = ?auto_57727 ?auto_57725 ) ) ( ON ?auto_57724 ?auto_57727 ) ( ON ?auto_57725 ?auto_57724 ) ( CLEAR ?auto_57725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57721 ?auto_57722 ?auto_57723 ?auto_57726 ?auto_57727 ?auto_57724 )
      ( MAKE-3PILE ?auto_57721 ?auto_57722 ?auto_57723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57732 - BLOCK
      ?auto_57733 - BLOCK
      ?auto_57734 - BLOCK
      ?auto_57735 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57735 ) ( CLEAR ?auto_57734 ) ( ON-TABLE ?auto_57732 ) ( ON ?auto_57733 ?auto_57732 ) ( ON ?auto_57734 ?auto_57733 ) ( not ( = ?auto_57732 ?auto_57733 ) ) ( not ( = ?auto_57732 ?auto_57734 ) ) ( not ( = ?auto_57732 ?auto_57735 ) ) ( not ( = ?auto_57733 ?auto_57734 ) ) ( not ( = ?auto_57733 ?auto_57735 ) ) ( not ( = ?auto_57734 ?auto_57735 ) ) )
    :subtasks
    ( ( !STACK ?auto_57735 ?auto_57734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57736 - BLOCK
      ?auto_57737 - BLOCK
      ?auto_57738 - BLOCK
      ?auto_57739 - BLOCK
    )
    :vars
    (
      ?auto_57740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57738 ) ( ON-TABLE ?auto_57736 ) ( ON ?auto_57737 ?auto_57736 ) ( ON ?auto_57738 ?auto_57737 ) ( not ( = ?auto_57736 ?auto_57737 ) ) ( not ( = ?auto_57736 ?auto_57738 ) ) ( not ( = ?auto_57736 ?auto_57739 ) ) ( not ( = ?auto_57737 ?auto_57738 ) ) ( not ( = ?auto_57737 ?auto_57739 ) ) ( not ( = ?auto_57738 ?auto_57739 ) ) ( ON ?auto_57739 ?auto_57740 ) ( CLEAR ?auto_57739 ) ( HAND-EMPTY ) ( not ( = ?auto_57736 ?auto_57740 ) ) ( not ( = ?auto_57737 ?auto_57740 ) ) ( not ( = ?auto_57738 ?auto_57740 ) ) ( not ( = ?auto_57739 ?auto_57740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57739 ?auto_57740 )
      ( MAKE-4PILE ?auto_57736 ?auto_57737 ?auto_57738 ?auto_57739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57741 - BLOCK
      ?auto_57742 - BLOCK
      ?auto_57743 - BLOCK
      ?auto_57744 - BLOCK
    )
    :vars
    (
      ?auto_57745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57741 ) ( ON ?auto_57742 ?auto_57741 ) ( not ( = ?auto_57741 ?auto_57742 ) ) ( not ( = ?auto_57741 ?auto_57743 ) ) ( not ( = ?auto_57741 ?auto_57744 ) ) ( not ( = ?auto_57742 ?auto_57743 ) ) ( not ( = ?auto_57742 ?auto_57744 ) ) ( not ( = ?auto_57743 ?auto_57744 ) ) ( ON ?auto_57744 ?auto_57745 ) ( CLEAR ?auto_57744 ) ( not ( = ?auto_57741 ?auto_57745 ) ) ( not ( = ?auto_57742 ?auto_57745 ) ) ( not ( = ?auto_57743 ?auto_57745 ) ) ( not ( = ?auto_57744 ?auto_57745 ) ) ( HOLDING ?auto_57743 ) ( CLEAR ?auto_57742 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57741 ?auto_57742 ?auto_57743 )
      ( MAKE-4PILE ?auto_57741 ?auto_57742 ?auto_57743 ?auto_57744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57746 - BLOCK
      ?auto_57747 - BLOCK
      ?auto_57748 - BLOCK
      ?auto_57749 - BLOCK
    )
    :vars
    (
      ?auto_57750 - BLOCK
      ?auto_57751 - BLOCK
      ?auto_57752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57746 ) ( ON ?auto_57747 ?auto_57746 ) ( not ( = ?auto_57746 ?auto_57747 ) ) ( not ( = ?auto_57746 ?auto_57748 ) ) ( not ( = ?auto_57746 ?auto_57749 ) ) ( not ( = ?auto_57747 ?auto_57748 ) ) ( not ( = ?auto_57747 ?auto_57749 ) ) ( not ( = ?auto_57748 ?auto_57749 ) ) ( ON ?auto_57749 ?auto_57750 ) ( not ( = ?auto_57746 ?auto_57750 ) ) ( not ( = ?auto_57747 ?auto_57750 ) ) ( not ( = ?auto_57748 ?auto_57750 ) ) ( not ( = ?auto_57749 ?auto_57750 ) ) ( CLEAR ?auto_57747 ) ( ON ?auto_57748 ?auto_57749 ) ( CLEAR ?auto_57748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57751 ) ( ON ?auto_57752 ?auto_57751 ) ( ON ?auto_57750 ?auto_57752 ) ( not ( = ?auto_57751 ?auto_57752 ) ) ( not ( = ?auto_57751 ?auto_57750 ) ) ( not ( = ?auto_57751 ?auto_57749 ) ) ( not ( = ?auto_57751 ?auto_57748 ) ) ( not ( = ?auto_57752 ?auto_57750 ) ) ( not ( = ?auto_57752 ?auto_57749 ) ) ( not ( = ?auto_57752 ?auto_57748 ) ) ( not ( = ?auto_57746 ?auto_57751 ) ) ( not ( = ?auto_57746 ?auto_57752 ) ) ( not ( = ?auto_57747 ?auto_57751 ) ) ( not ( = ?auto_57747 ?auto_57752 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57751 ?auto_57752 ?auto_57750 ?auto_57749 )
      ( MAKE-4PILE ?auto_57746 ?auto_57747 ?auto_57748 ?auto_57749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57753 - BLOCK
      ?auto_57754 - BLOCK
      ?auto_57755 - BLOCK
      ?auto_57756 - BLOCK
    )
    :vars
    (
      ?auto_57758 - BLOCK
      ?auto_57759 - BLOCK
      ?auto_57757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57753 ) ( not ( = ?auto_57753 ?auto_57754 ) ) ( not ( = ?auto_57753 ?auto_57755 ) ) ( not ( = ?auto_57753 ?auto_57756 ) ) ( not ( = ?auto_57754 ?auto_57755 ) ) ( not ( = ?auto_57754 ?auto_57756 ) ) ( not ( = ?auto_57755 ?auto_57756 ) ) ( ON ?auto_57756 ?auto_57758 ) ( not ( = ?auto_57753 ?auto_57758 ) ) ( not ( = ?auto_57754 ?auto_57758 ) ) ( not ( = ?auto_57755 ?auto_57758 ) ) ( not ( = ?auto_57756 ?auto_57758 ) ) ( ON ?auto_57755 ?auto_57756 ) ( CLEAR ?auto_57755 ) ( ON-TABLE ?auto_57759 ) ( ON ?auto_57757 ?auto_57759 ) ( ON ?auto_57758 ?auto_57757 ) ( not ( = ?auto_57759 ?auto_57757 ) ) ( not ( = ?auto_57759 ?auto_57758 ) ) ( not ( = ?auto_57759 ?auto_57756 ) ) ( not ( = ?auto_57759 ?auto_57755 ) ) ( not ( = ?auto_57757 ?auto_57758 ) ) ( not ( = ?auto_57757 ?auto_57756 ) ) ( not ( = ?auto_57757 ?auto_57755 ) ) ( not ( = ?auto_57753 ?auto_57759 ) ) ( not ( = ?auto_57753 ?auto_57757 ) ) ( not ( = ?auto_57754 ?auto_57759 ) ) ( not ( = ?auto_57754 ?auto_57757 ) ) ( HOLDING ?auto_57754 ) ( CLEAR ?auto_57753 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57753 ?auto_57754 )
      ( MAKE-4PILE ?auto_57753 ?auto_57754 ?auto_57755 ?auto_57756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57760 - BLOCK
      ?auto_57761 - BLOCK
      ?auto_57762 - BLOCK
      ?auto_57763 - BLOCK
    )
    :vars
    (
      ?auto_57766 - BLOCK
      ?auto_57765 - BLOCK
      ?auto_57764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57760 ) ( not ( = ?auto_57760 ?auto_57761 ) ) ( not ( = ?auto_57760 ?auto_57762 ) ) ( not ( = ?auto_57760 ?auto_57763 ) ) ( not ( = ?auto_57761 ?auto_57762 ) ) ( not ( = ?auto_57761 ?auto_57763 ) ) ( not ( = ?auto_57762 ?auto_57763 ) ) ( ON ?auto_57763 ?auto_57766 ) ( not ( = ?auto_57760 ?auto_57766 ) ) ( not ( = ?auto_57761 ?auto_57766 ) ) ( not ( = ?auto_57762 ?auto_57766 ) ) ( not ( = ?auto_57763 ?auto_57766 ) ) ( ON ?auto_57762 ?auto_57763 ) ( ON-TABLE ?auto_57765 ) ( ON ?auto_57764 ?auto_57765 ) ( ON ?auto_57766 ?auto_57764 ) ( not ( = ?auto_57765 ?auto_57764 ) ) ( not ( = ?auto_57765 ?auto_57766 ) ) ( not ( = ?auto_57765 ?auto_57763 ) ) ( not ( = ?auto_57765 ?auto_57762 ) ) ( not ( = ?auto_57764 ?auto_57766 ) ) ( not ( = ?auto_57764 ?auto_57763 ) ) ( not ( = ?auto_57764 ?auto_57762 ) ) ( not ( = ?auto_57760 ?auto_57765 ) ) ( not ( = ?auto_57760 ?auto_57764 ) ) ( not ( = ?auto_57761 ?auto_57765 ) ) ( not ( = ?auto_57761 ?auto_57764 ) ) ( CLEAR ?auto_57760 ) ( ON ?auto_57761 ?auto_57762 ) ( CLEAR ?auto_57761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57765 ?auto_57764 ?auto_57766 ?auto_57763 ?auto_57762 )
      ( MAKE-4PILE ?auto_57760 ?auto_57761 ?auto_57762 ?auto_57763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57767 - BLOCK
      ?auto_57768 - BLOCK
      ?auto_57769 - BLOCK
      ?auto_57770 - BLOCK
    )
    :vars
    (
      ?auto_57772 - BLOCK
      ?auto_57771 - BLOCK
      ?auto_57773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57767 ?auto_57768 ) ) ( not ( = ?auto_57767 ?auto_57769 ) ) ( not ( = ?auto_57767 ?auto_57770 ) ) ( not ( = ?auto_57768 ?auto_57769 ) ) ( not ( = ?auto_57768 ?auto_57770 ) ) ( not ( = ?auto_57769 ?auto_57770 ) ) ( ON ?auto_57770 ?auto_57772 ) ( not ( = ?auto_57767 ?auto_57772 ) ) ( not ( = ?auto_57768 ?auto_57772 ) ) ( not ( = ?auto_57769 ?auto_57772 ) ) ( not ( = ?auto_57770 ?auto_57772 ) ) ( ON ?auto_57769 ?auto_57770 ) ( ON-TABLE ?auto_57771 ) ( ON ?auto_57773 ?auto_57771 ) ( ON ?auto_57772 ?auto_57773 ) ( not ( = ?auto_57771 ?auto_57773 ) ) ( not ( = ?auto_57771 ?auto_57772 ) ) ( not ( = ?auto_57771 ?auto_57770 ) ) ( not ( = ?auto_57771 ?auto_57769 ) ) ( not ( = ?auto_57773 ?auto_57772 ) ) ( not ( = ?auto_57773 ?auto_57770 ) ) ( not ( = ?auto_57773 ?auto_57769 ) ) ( not ( = ?auto_57767 ?auto_57771 ) ) ( not ( = ?auto_57767 ?auto_57773 ) ) ( not ( = ?auto_57768 ?auto_57771 ) ) ( not ( = ?auto_57768 ?auto_57773 ) ) ( ON ?auto_57768 ?auto_57769 ) ( CLEAR ?auto_57768 ) ( HOLDING ?auto_57767 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57767 )
      ( MAKE-4PILE ?auto_57767 ?auto_57768 ?auto_57769 ?auto_57770 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_57774 - BLOCK
      ?auto_57775 - BLOCK
      ?auto_57776 - BLOCK
      ?auto_57777 - BLOCK
    )
    :vars
    (
      ?auto_57778 - BLOCK
      ?auto_57779 - BLOCK
      ?auto_57780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57774 ?auto_57775 ) ) ( not ( = ?auto_57774 ?auto_57776 ) ) ( not ( = ?auto_57774 ?auto_57777 ) ) ( not ( = ?auto_57775 ?auto_57776 ) ) ( not ( = ?auto_57775 ?auto_57777 ) ) ( not ( = ?auto_57776 ?auto_57777 ) ) ( ON ?auto_57777 ?auto_57778 ) ( not ( = ?auto_57774 ?auto_57778 ) ) ( not ( = ?auto_57775 ?auto_57778 ) ) ( not ( = ?auto_57776 ?auto_57778 ) ) ( not ( = ?auto_57777 ?auto_57778 ) ) ( ON ?auto_57776 ?auto_57777 ) ( ON-TABLE ?auto_57779 ) ( ON ?auto_57780 ?auto_57779 ) ( ON ?auto_57778 ?auto_57780 ) ( not ( = ?auto_57779 ?auto_57780 ) ) ( not ( = ?auto_57779 ?auto_57778 ) ) ( not ( = ?auto_57779 ?auto_57777 ) ) ( not ( = ?auto_57779 ?auto_57776 ) ) ( not ( = ?auto_57780 ?auto_57778 ) ) ( not ( = ?auto_57780 ?auto_57777 ) ) ( not ( = ?auto_57780 ?auto_57776 ) ) ( not ( = ?auto_57774 ?auto_57779 ) ) ( not ( = ?auto_57774 ?auto_57780 ) ) ( not ( = ?auto_57775 ?auto_57779 ) ) ( not ( = ?auto_57775 ?auto_57780 ) ) ( ON ?auto_57775 ?auto_57776 ) ( ON ?auto_57774 ?auto_57775 ) ( CLEAR ?auto_57774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57779 ?auto_57780 ?auto_57778 ?auto_57777 ?auto_57776 ?auto_57775 )
      ( MAKE-4PILE ?auto_57774 ?auto_57775 ?auto_57776 ?auto_57777 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57783 - BLOCK
      ?auto_57784 - BLOCK
    )
    :vars
    (
      ?auto_57785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57785 ?auto_57784 ) ( CLEAR ?auto_57785 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57783 ) ( ON ?auto_57784 ?auto_57783 ) ( not ( = ?auto_57783 ?auto_57784 ) ) ( not ( = ?auto_57783 ?auto_57785 ) ) ( not ( = ?auto_57784 ?auto_57785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57785 ?auto_57784 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57786 - BLOCK
      ?auto_57787 - BLOCK
    )
    :vars
    (
      ?auto_57788 - BLOCK
      ?auto_57789 - BLOCK
      ?auto_57790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57788 ?auto_57787 ) ( CLEAR ?auto_57788 ) ( ON-TABLE ?auto_57786 ) ( ON ?auto_57787 ?auto_57786 ) ( not ( = ?auto_57786 ?auto_57787 ) ) ( not ( = ?auto_57786 ?auto_57788 ) ) ( not ( = ?auto_57787 ?auto_57788 ) ) ( HOLDING ?auto_57789 ) ( CLEAR ?auto_57790 ) ( not ( = ?auto_57786 ?auto_57789 ) ) ( not ( = ?auto_57786 ?auto_57790 ) ) ( not ( = ?auto_57787 ?auto_57789 ) ) ( not ( = ?auto_57787 ?auto_57790 ) ) ( not ( = ?auto_57788 ?auto_57789 ) ) ( not ( = ?auto_57788 ?auto_57790 ) ) ( not ( = ?auto_57789 ?auto_57790 ) ) )
    :subtasks
    ( ( !STACK ?auto_57789 ?auto_57790 )
      ( MAKE-2PILE ?auto_57786 ?auto_57787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57791 - BLOCK
      ?auto_57792 - BLOCK
    )
    :vars
    (
      ?auto_57795 - BLOCK
      ?auto_57794 - BLOCK
      ?auto_57793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57795 ?auto_57792 ) ( ON-TABLE ?auto_57791 ) ( ON ?auto_57792 ?auto_57791 ) ( not ( = ?auto_57791 ?auto_57792 ) ) ( not ( = ?auto_57791 ?auto_57795 ) ) ( not ( = ?auto_57792 ?auto_57795 ) ) ( CLEAR ?auto_57794 ) ( not ( = ?auto_57791 ?auto_57793 ) ) ( not ( = ?auto_57791 ?auto_57794 ) ) ( not ( = ?auto_57792 ?auto_57793 ) ) ( not ( = ?auto_57792 ?auto_57794 ) ) ( not ( = ?auto_57795 ?auto_57793 ) ) ( not ( = ?auto_57795 ?auto_57794 ) ) ( not ( = ?auto_57793 ?auto_57794 ) ) ( ON ?auto_57793 ?auto_57795 ) ( CLEAR ?auto_57793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57791 ?auto_57792 ?auto_57795 )
      ( MAKE-2PILE ?auto_57791 ?auto_57792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57796 - BLOCK
      ?auto_57797 - BLOCK
    )
    :vars
    (
      ?auto_57799 - BLOCK
      ?auto_57798 - BLOCK
      ?auto_57800 - BLOCK
      ?auto_57801 - BLOCK
      ?auto_57802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57799 ?auto_57797 ) ( ON-TABLE ?auto_57796 ) ( ON ?auto_57797 ?auto_57796 ) ( not ( = ?auto_57796 ?auto_57797 ) ) ( not ( = ?auto_57796 ?auto_57799 ) ) ( not ( = ?auto_57797 ?auto_57799 ) ) ( not ( = ?auto_57796 ?auto_57798 ) ) ( not ( = ?auto_57796 ?auto_57800 ) ) ( not ( = ?auto_57797 ?auto_57798 ) ) ( not ( = ?auto_57797 ?auto_57800 ) ) ( not ( = ?auto_57799 ?auto_57798 ) ) ( not ( = ?auto_57799 ?auto_57800 ) ) ( not ( = ?auto_57798 ?auto_57800 ) ) ( ON ?auto_57798 ?auto_57799 ) ( CLEAR ?auto_57798 ) ( HOLDING ?auto_57800 ) ( CLEAR ?auto_57801 ) ( ON-TABLE ?auto_57802 ) ( ON ?auto_57801 ?auto_57802 ) ( not ( = ?auto_57802 ?auto_57801 ) ) ( not ( = ?auto_57802 ?auto_57800 ) ) ( not ( = ?auto_57801 ?auto_57800 ) ) ( not ( = ?auto_57796 ?auto_57801 ) ) ( not ( = ?auto_57796 ?auto_57802 ) ) ( not ( = ?auto_57797 ?auto_57801 ) ) ( not ( = ?auto_57797 ?auto_57802 ) ) ( not ( = ?auto_57799 ?auto_57801 ) ) ( not ( = ?auto_57799 ?auto_57802 ) ) ( not ( = ?auto_57798 ?auto_57801 ) ) ( not ( = ?auto_57798 ?auto_57802 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57802 ?auto_57801 ?auto_57800 )
      ( MAKE-2PILE ?auto_57796 ?auto_57797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57803 - BLOCK
      ?auto_57804 - BLOCK
    )
    :vars
    (
      ?auto_57807 - BLOCK
      ?auto_57806 - BLOCK
      ?auto_57809 - BLOCK
      ?auto_57808 - BLOCK
      ?auto_57805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57807 ?auto_57804 ) ( ON-TABLE ?auto_57803 ) ( ON ?auto_57804 ?auto_57803 ) ( not ( = ?auto_57803 ?auto_57804 ) ) ( not ( = ?auto_57803 ?auto_57807 ) ) ( not ( = ?auto_57804 ?auto_57807 ) ) ( not ( = ?auto_57803 ?auto_57806 ) ) ( not ( = ?auto_57803 ?auto_57809 ) ) ( not ( = ?auto_57804 ?auto_57806 ) ) ( not ( = ?auto_57804 ?auto_57809 ) ) ( not ( = ?auto_57807 ?auto_57806 ) ) ( not ( = ?auto_57807 ?auto_57809 ) ) ( not ( = ?auto_57806 ?auto_57809 ) ) ( ON ?auto_57806 ?auto_57807 ) ( CLEAR ?auto_57808 ) ( ON-TABLE ?auto_57805 ) ( ON ?auto_57808 ?auto_57805 ) ( not ( = ?auto_57805 ?auto_57808 ) ) ( not ( = ?auto_57805 ?auto_57809 ) ) ( not ( = ?auto_57808 ?auto_57809 ) ) ( not ( = ?auto_57803 ?auto_57808 ) ) ( not ( = ?auto_57803 ?auto_57805 ) ) ( not ( = ?auto_57804 ?auto_57808 ) ) ( not ( = ?auto_57804 ?auto_57805 ) ) ( not ( = ?auto_57807 ?auto_57808 ) ) ( not ( = ?auto_57807 ?auto_57805 ) ) ( not ( = ?auto_57806 ?auto_57808 ) ) ( not ( = ?auto_57806 ?auto_57805 ) ) ( ON ?auto_57809 ?auto_57806 ) ( CLEAR ?auto_57809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57803 ?auto_57804 ?auto_57807 ?auto_57806 )
      ( MAKE-2PILE ?auto_57803 ?auto_57804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57810 - BLOCK
      ?auto_57811 - BLOCK
    )
    :vars
    (
      ?auto_57813 - BLOCK
      ?auto_57816 - BLOCK
      ?auto_57812 - BLOCK
      ?auto_57815 - BLOCK
      ?auto_57814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57813 ?auto_57811 ) ( ON-TABLE ?auto_57810 ) ( ON ?auto_57811 ?auto_57810 ) ( not ( = ?auto_57810 ?auto_57811 ) ) ( not ( = ?auto_57810 ?auto_57813 ) ) ( not ( = ?auto_57811 ?auto_57813 ) ) ( not ( = ?auto_57810 ?auto_57816 ) ) ( not ( = ?auto_57810 ?auto_57812 ) ) ( not ( = ?auto_57811 ?auto_57816 ) ) ( not ( = ?auto_57811 ?auto_57812 ) ) ( not ( = ?auto_57813 ?auto_57816 ) ) ( not ( = ?auto_57813 ?auto_57812 ) ) ( not ( = ?auto_57816 ?auto_57812 ) ) ( ON ?auto_57816 ?auto_57813 ) ( ON-TABLE ?auto_57815 ) ( not ( = ?auto_57815 ?auto_57814 ) ) ( not ( = ?auto_57815 ?auto_57812 ) ) ( not ( = ?auto_57814 ?auto_57812 ) ) ( not ( = ?auto_57810 ?auto_57814 ) ) ( not ( = ?auto_57810 ?auto_57815 ) ) ( not ( = ?auto_57811 ?auto_57814 ) ) ( not ( = ?auto_57811 ?auto_57815 ) ) ( not ( = ?auto_57813 ?auto_57814 ) ) ( not ( = ?auto_57813 ?auto_57815 ) ) ( not ( = ?auto_57816 ?auto_57814 ) ) ( not ( = ?auto_57816 ?auto_57815 ) ) ( ON ?auto_57812 ?auto_57816 ) ( CLEAR ?auto_57812 ) ( HOLDING ?auto_57814 ) ( CLEAR ?auto_57815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57815 ?auto_57814 )
      ( MAKE-2PILE ?auto_57810 ?auto_57811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57817 - BLOCK
      ?auto_57818 - BLOCK
    )
    :vars
    (
      ?auto_57822 - BLOCK
      ?auto_57820 - BLOCK
      ?auto_57823 - BLOCK
      ?auto_57821 - BLOCK
      ?auto_57819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57822 ?auto_57818 ) ( ON-TABLE ?auto_57817 ) ( ON ?auto_57818 ?auto_57817 ) ( not ( = ?auto_57817 ?auto_57818 ) ) ( not ( = ?auto_57817 ?auto_57822 ) ) ( not ( = ?auto_57818 ?auto_57822 ) ) ( not ( = ?auto_57817 ?auto_57820 ) ) ( not ( = ?auto_57817 ?auto_57823 ) ) ( not ( = ?auto_57818 ?auto_57820 ) ) ( not ( = ?auto_57818 ?auto_57823 ) ) ( not ( = ?auto_57822 ?auto_57820 ) ) ( not ( = ?auto_57822 ?auto_57823 ) ) ( not ( = ?auto_57820 ?auto_57823 ) ) ( ON ?auto_57820 ?auto_57822 ) ( ON-TABLE ?auto_57821 ) ( not ( = ?auto_57821 ?auto_57819 ) ) ( not ( = ?auto_57821 ?auto_57823 ) ) ( not ( = ?auto_57819 ?auto_57823 ) ) ( not ( = ?auto_57817 ?auto_57819 ) ) ( not ( = ?auto_57817 ?auto_57821 ) ) ( not ( = ?auto_57818 ?auto_57819 ) ) ( not ( = ?auto_57818 ?auto_57821 ) ) ( not ( = ?auto_57822 ?auto_57819 ) ) ( not ( = ?auto_57822 ?auto_57821 ) ) ( not ( = ?auto_57820 ?auto_57819 ) ) ( not ( = ?auto_57820 ?auto_57821 ) ) ( ON ?auto_57823 ?auto_57820 ) ( CLEAR ?auto_57821 ) ( ON ?auto_57819 ?auto_57823 ) ( CLEAR ?auto_57819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57817 ?auto_57818 ?auto_57822 ?auto_57820 ?auto_57823 )
      ( MAKE-2PILE ?auto_57817 ?auto_57818 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57824 - BLOCK
      ?auto_57825 - BLOCK
    )
    :vars
    (
      ?auto_57830 - BLOCK
      ?auto_57826 - BLOCK
      ?auto_57827 - BLOCK
      ?auto_57828 - BLOCK
      ?auto_57829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57830 ?auto_57825 ) ( ON-TABLE ?auto_57824 ) ( ON ?auto_57825 ?auto_57824 ) ( not ( = ?auto_57824 ?auto_57825 ) ) ( not ( = ?auto_57824 ?auto_57830 ) ) ( not ( = ?auto_57825 ?auto_57830 ) ) ( not ( = ?auto_57824 ?auto_57826 ) ) ( not ( = ?auto_57824 ?auto_57827 ) ) ( not ( = ?auto_57825 ?auto_57826 ) ) ( not ( = ?auto_57825 ?auto_57827 ) ) ( not ( = ?auto_57830 ?auto_57826 ) ) ( not ( = ?auto_57830 ?auto_57827 ) ) ( not ( = ?auto_57826 ?auto_57827 ) ) ( ON ?auto_57826 ?auto_57830 ) ( not ( = ?auto_57828 ?auto_57829 ) ) ( not ( = ?auto_57828 ?auto_57827 ) ) ( not ( = ?auto_57829 ?auto_57827 ) ) ( not ( = ?auto_57824 ?auto_57829 ) ) ( not ( = ?auto_57824 ?auto_57828 ) ) ( not ( = ?auto_57825 ?auto_57829 ) ) ( not ( = ?auto_57825 ?auto_57828 ) ) ( not ( = ?auto_57830 ?auto_57829 ) ) ( not ( = ?auto_57830 ?auto_57828 ) ) ( not ( = ?auto_57826 ?auto_57829 ) ) ( not ( = ?auto_57826 ?auto_57828 ) ) ( ON ?auto_57827 ?auto_57826 ) ( ON ?auto_57829 ?auto_57827 ) ( CLEAR ?auto_57829 ) ( HOLDING ?auto_57828 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57828 )
      ( MAKE-2PILE ?auto_57824 ?auto_57825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57831 - BLOCK
      ?auto_57832 - BLOCK
    )
    :vars
    (
      ?auto_57836 - BLOCK
      ?auto_57833 - BLOCK
      ?auto_57834 - BLOCK
      ?auto_57837 - BLOCK
      ?auto_57835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57836 ?auto_57832 ) ( ON-TABLE ?auto_57831 ) ( ON ?auto_57832 ?auto_57831 ) ( not ( = ?auto_57831 ?auto_57832 ) ) ( not ( = ?auto_57831 ?auto_57836 ) ) ( not ( = ?auto_57832 ?auto_57836 ) ) ( not ( = ?auto_57831 ?auto_57833 ) ) ( not ( = ?auto_57831 ?auto_57834 ) ) ( not ( = ?auto_57832 ?auto_57833 ) ) ( not ( = ?auto_57832 ?auto_57834 ) ) ( not ( = ?auto_57836 ?auto_57833 ) ) ( not ( = ?auto_57836 ?auto_57834 ) ) ( not ( = ?auto_57833 ?auto_57834 ) ) ( ON ?auto_57833 ?auto_57836 ) ( not ( = ?auto_57837 ?auto_57835 ) ) ( not ( = ?auto_57837 ?auto_57834 ) ) ( not ( = ?auto_57835 ?auto_57834 ) ) ( not ( = ?auto_57831 ?auto_57835 ) ) ( not ( = ?auto_57831 ?auto_57837 ) ) ( not ( = ?auto_57832 ?auto_57835 ) ) ( not ( = ?auto_57832 ?auto_57837 ) ) ( not ( = ?auto_57836 ?auto_57835 ) ) ( not ( = ?auto_57836 ?auto_57837 ) ) ( not ( = ?auto_57833 ?auto_57835 ) ) ( not ( = ?auto_57833 ?auto_57837 ) ) ( ON ?auto_57834 ?auto_57833 ) ( ON ?auto_57835 ?auto_57834 ) ( ON ?auto_57837 ?auto_57835 ) ( CLEAR ?auto_57837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57831 ?auto_57832 ?auto_57836 ?auto_57833 ?auto_57834 ?auto_57835 )
      ( MAKE-2PILE ?auto_57831 ?auto_57832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57843 - BLOCK
      ?auto_57844 - BLOCK
      ?auto_57845 - BLOCK
      ?auto_57846 - BLOCK
      ?auto_57847 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57847 ) ( CLEAR ?auto_57846 ) ( ON-TABLE ?auto_57843 ) ( ON ?auto_57844 ?auto_57843 ) ( ON ?auto_57845 ?auto_57844 ) ( ON ?auto_57846 ?auto_57845 ) ( not ( = ?auto_57843 ?auto_57844 ) ) ( not ( = ?auto_57843 ?auto_57845 ) ) ( not ( = ?auto_57843 ?auto_57846 ) ) ( not ( = ?auto_57843 ?auto_57847 ) ) ( not ( = ?auto_57844 ?auto_57845 ) ) ( not ( = ?auto_57844 ?auto_57846 ) ) ( not ( = ?auto_57844 ?auto_57847 ) ) ( not ( = ?auto_57845 ?auto_57846 ) ) ( not ( = ?auto_57845 ?auto_57847 ) ) ( not ( = ?auto_57846 ?auto_57847 ) ) )
    :subtasks
    ( ( !STACK ?auto_57847 ?auto_57846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57848 - BLOCK
      ?auto_57849 - BLOCK
      ?auto_57850 - BLOCK
      ?auto_57851 - BLOCK
      ?auto_57852 - BLOCK
    )
    :vars
    (
      ?auto_57853 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57851 ) ( ON-TABLE ?auto_57848 ) ( ON ?auto_57849 ?auto_57848 ) ( ON ?auto_57850 ?auto_57849 ) ( ON ?auto_57851 ?auto_57850 ) ( not ( = ?auto_57848 ?auto_57849 ) ) ( not ( = ?auto_57848 ?auto_57850 ) ) ( not ( = ?auto_57848 ?auto_57851 ) ) ( not ( = ?auto_57848 ?auto_57852 ) ) ( not ( = ?auto_57849 ?auto_57850 ) ) ( not ( = ?auto_57849 ?auto_57851 ) ) ( not ( = ?auto_57849 ?auto_57852 ) ) ( not ( = ?auto_57850 ?auto_57851 ) ) ( not ( = ?auto_57850 ?auto_57852 ) ) ( not ( = ?auto_57851 ?auto_57852 ) ) ( ON ?auto_57852 ?auto_57853 ) ( CLEAR ?auto_57852 ) ( HAND-EMPTY ) ( not ( = ?auto_57848 ?auto_57853 ) ) ( not ( = ?auto_57849 ?auto_57853 ) ) ( not ( = ?auto_57850 ?auto_57853 ) ) ( not ( = ?auto_57851 ?auto_57853 ) ) ( not ( = ?auto_57852 ?auto_57853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57852 ?auto_57853 )
      ( MAKE-5PILE ?auto_57848 ?auto_57849 ?auto_57850 ?auto_57851 ?auto_57852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57854 - BLOCK
      ?auto_57855 - BLOCK
      ?auto_57856 - BLOCK
      ?auto_57857 - BLOCK
      ?auto_57858 - BLOCK
    )
    :vars
    (
      ?auto_57859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57854 ) ( ON ?auto_57855 ?auto_57854 ) ( ON ?auto_57856 ?auto_57855 ) ( not ( = ?auto_57854 ?auto_57855 ) ) ( not ( = ?auto_57854 ?auto_57856 ) ) ( not ( = ?auto_57854 ?auto_57857 ) ) ( not ( = ?auto_57854 ?auto_57858 ) ) ( not ( = ?auto_57855 ?auto_57856 ) ) ( not ( = ?auto_57855 ?auto_57857 ) ) ( not ( = ?auto_57855 ?auto_57858 ) ) ( not ( = ?auto_57856 ?auto_57857 ) ) ( not ( = ?auto_57856 ?auto_57858 ) ) ( not ( = ?auto_57857 ?auto_57858 ) ) ( ON ?auto_57858 ?auto_57859 ) ( CLEAR ?auto_57858 ) ( not ( = ?auto_57854 ?auto_57859 ) ) ( not ( = ?auto_57855 ?auto_57859 ) ) ( not ( = ?auto_57856 ?auto_57859 ) ) ( not ( = ?auto_57857 ?auto_57859 ) ) ( not ( = ?auto_57858 ?auto_57859 ) ) ( HOLDING ?auto_57857 ) ( CLEAR ?auto_57856 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57854 ?auto_57855 ?auto_57856 ?auto_57857 )
      ( MAKE-5PILE ?auto_57854 ?auto_57855 ?auto_57856 ?auto_57857 ?auto_57858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57860 - BLOCK
      ?auto_57861 - BLOCK
      ?auto_57862 - BLOCK
      ?auto_57863 - BLOCK
      ?auto_57864 - BLOCK
    )
    :vars
    (
      ?auto_57865 - BLOCK
      ?auto_57866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57860 ) ( ON ?auto_57861 ?auto_57860 ) ( ON ?auto_57862 ?auto_57861 ) ( not ( = ?auto_57860 ?auto_57861 ) ) ( not ( = ?auto_57860 ?auto_57862 ) ) ( not ( = ?auto_57860 ?auto_57863 ) ) ( not ( = ?auto_57860 ?auto_57864 ) ) ( not ( = ?auto_57861 ?auto_57862 ) ) ( not ( = ?auto_57861 ?auto_57863 ) ) ( not ( = ?auto_57861 ?auto_57864 ) ) ( not ( = ?auto_57862 ?auto_57863 ) ) ( not ( = ?auto_57862 ?auto_57864 ) ) ( not ( = ?auto_57863 ?auto_57864 ) ) ( ON ?auto_57864 ?auto_57865 ) ( not ( = ?auto_57860 ?auto_57865 ) ) ( not ( = ?auto_57861 ?auto_57865 ) ) ( not ( = ?auto_57862 ?auto_57865 ) ) ( not ( = ?auto_57863 ?auto_57865 ) ) ( not ( = ?auto_57864 ?auto_57865 ) ) ( CLEAR ?auto_57862 ) ( ON ?auto_57863 ?auto_57864 ) ( CLEAR ?auto_57863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57866 ) ( ON ?auto_57865 ?auto_57866 ) ( not ( = ?auto_57866 ?auto_57865 ) ) ( not ( = ?auto_57866 ?auto_57864 ) ) ( not ( = ?auto_57866 ?auto_57863 ) ) ( not ( = ?auto_57860 ?auto_57866 ) ) ( not ( = ?auto_57861 ?auto_57866 ) ) ( not ( = ?auto_57862 ?auto_57866 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57866 ?auto_57865 ?auto_57864 )
      ( MAKE-5PILE ?auto_57860 ?auto_57861 ?auto_57862 ?auto_57863 ?auto_57864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57867 - BLOCK
      ?auto_57868 - BLOCK
      ?auto_57869 - BLOCK
      ?auto_57870 - BLOCK
      ?auto_57871 - BLOCK
    )
    :vars
    (
      ?auto_57873 - BLOCK
      ?auto_57872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57867 ) ( ON ?auto_57868 ?auto_57867 ) ( not ( = ?auto_57867 ?auto_57868 ) ) ( not ( = ?auto_57867 ?auto_57869 ) ) ( not ( = ?auto_57867 ?auto_57870 ) ) ( not ( = ?auto_57867 ?auto_57871 ) ) ( not ( = ?auto_57868 ?auto_57869 ) ) ( not ( = ?auto_57868 ?auto_57870 ) ) ( not ( = ?auto_57868 ?auto_57871 ) ) ( not ( = ?auto_57869 ?auto_57870 ) ) ( not ( = ?auto_57869 ?auto_57871 ) ) ( not ( = ?auto_57870 ?auto_57871 ) ) ( ON ?auto_57871 ?auto_57873 ) ( not ( = ?auto_57867 ?auto_57873 ) ) ( not ( = ?auto_57868 ?auto_57873 ) ) ( not ( = ?auto_57869 ?auto_57873 ) ) ( not ( = ?auto_57870 ?auto_57873 ) ) ( not ( = ?auto_57871 ?auto_57873 ) ) ( ON ?auto_57870 ?auto_57871 ) ( CLEAR ?auto_57870 ) ( ON-TABLE ?auto_57872 ) ( ON ?auto_57873 ?auto_57872 ) ( not ( = ?auto_57872 ?auto_57873 ) ) ( not ( = ?auto_57872 ?auto_57871 ) ) ( not ( = ?auto_57872 ?auto_57870 ) ) ( not ( = ?auto_57867 ?auto_57872 ) ) ( not ( = ?auto_57868 ?auto_57872 ) ) ( not ( = ?auto_57869 ?auto_57872 ) ) ( HOLDING ?auto_57869 ) ( CLEAR ?auto_57868 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57867 ?auto_57868 ?auto_57869 )
      ( MAKE-5PILE ?auto_57867 ?auto_57868 ?auto_57869 ?auto_57870 ?auto_57871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57874 - BLOCK
      ?auto_57875 - BLOCK
      ?auto_57876 - BLOCK
      ?auto_57877 - BLOCK
      ?auto_57878 - BLOCK
    )
    :vars
    (
      ?auto_57879 - BLOCK
      ?auto_57880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57874 ) ( ON ?auto_57875 ?auto_57874 ) ( not ( = ?auto_57874 ?auto_57875 ) ) ( not ( = ?auto_57874 ?auto_57876 ) ) ( not ( = ?auto_57874 ?auto_57877 ) ) ( not ( = ?auto_57874 ?auto_57878 ) ) ( not ( = ?auto_57875 ?auto_57876 ) ) ( not ( = ?auto_57875 ?auto_57877 ) ) ( not ( = ?auto_57875 ?auto_57878 ) ) ( not ( = ?auto_57876 ?auto_57877 ) ) ( not ( = ?auto_57876 ?auto_57878 ) ) ( not ( = ?auto_57877 ?auto_57878 ) ) ( ON ?auto_57878 ?auto_57879 ) ( not ( = ?auto_57874 ?auto_57879 ) ) ( not ( = ?auto_57875 ?auto_57879 ) ) ( not ( = ?auto_57876 ?auto_57879 ) ) ( not ( = ?auto_57877 ?auto_57879 ) ) ( not ( = ?auto_57878 ?auto_57879 ) ) ( ON ?auto_57877 ?auto_57878 ) ( ON-TABLE ?auto_57880 ) ( ON ?auto_57879 ?auto_57880 ) ( not ( = ?auto_57880 ?auto_57879 ) ) ( not ( = ?auto_57880 ?auto_57878 ) ) ( not ( = ?auto_57880 ?auto_57877 ) ) ( not ( = ?auto_57874 ?auto_57880 ) ) ( not ( = ?auto_57875 ?auto_57880 ) ) ( not ( = ?auto_57876 ?auto_57880 ) ) ( CLEAR ?auto_57875 ) ( ON ?auto_57876 ?auto_57877 ) ( CLEAR ?auto_57876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57880 ?auto_57879 ?auto_57878 ?auto_57877 )
      ( MAKE-5PILE ?auto_57874 ?auto_57875 ?auto_57876 ?auto_57877 ?auto_57878 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57881 - BLOCK
      ?auto_57882 - BLOCK
      ?auto_57883 - BLOCK
      ?auto_57884 - BLOCK
      ?auto_57885 - BLOCK
    )
    :vars
    (
      ?auto_57887 - BLOCK
      ?auto_57886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57881 ) ( not ( = ?auto_57881 ?auto_57882 ) ) ( not ( = ?auto_57881 ?auto_57883 ) ) ( not ( = ?auto_57881 ?auto_57884 ) ) ( not ( = ?auto_57881 ?auto_57885 ) ) ( not ( = ?auto_57882 ?auto_57883 ) ) ( not ( = ?auto_57882 ?auto_57884 ) ) ( not ( = ?auto_57882 ?auto_57885 ) ) ( not ( = ?auto_57883 ?auto_57884 ) ) ( not ( = ?auto_57883 ?auto_57885 ) ) ( not ( = ?auto_57884 ?auto_57885 ) ) ( ON ?auto_57885 ?auto_57887 ) ( not ( = ?auto_57881 ?auto_57887 ) ) ( not ( = ?auto_57882 ?auto_57887 ) ) ( not ( = ?auto_57883 ?auto_57887 ) ) ( not ( = ?auto_57884 ?auto_57887 ) ) ( not ( = ?auto_57885 ?auto_57887 ) ) ( ON ?auto_57884 ?auto_57885 ) ( ON-TABLE ?auto_57886 ) ( ON ?auto_57887 ?auto_57886 ) ( not ( = ?auto_57886 ?auto_57887 ) ) ( not ( = ?auto_57886 ?auto_57885 ) ) ( not ( = ?auto_57886 ?auto_57884 ) ) ( not ( = ?auto_57881 ?auto_57886 ) ) ( not ( = ?auto_57882 ?auto_57886 ) ) ( not ( = ?auto_57883 ?auto_57886 ) ) ( ON ?auto_57883 ?auto_57884 ) ( CLEAR ?auto_57883 ) ( HOLDING ?auto_57882 ) ( CLEAR ?auto_57881 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57881 ?auto_57882 )
      ( MAKE-5PILE ?auto_57881 ?auto_57882 ?auto_57883 ?auto_57884 ?auto_57885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57888 - BLOCK
      ?auto_57889 - BLOCK
      ?auto_57890 - BLOCK
      ?auto_57891 - BLOCK
      ?auto_57892 - BLOCK
    )
    :vars
    (
      ?auto_57893 - BLOCK
      ?auto_57894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57888 ) ( not ( = ?auto_57888 ?auto_57889 ) ) ( not ( = ?auto_57888 ?auto_57890 ) ) ( not ( = ?auto_57888 ?auto_57891 ) ) ( not ( = ?auto_57888 ?auto_57892 ) ) ( not ( = ?auto_57889 ?auto_57890 ) ) ( not ( = ?auto_57889 ?auto_57891 ) ) ( not ( = ?auto_57889 ?auto_57892 ) ) ( not ( = ?auto_57890 ?auto_57891 ) ) ( not ( = ?auto_57890 ?auto_57892 ) ) ( not ( = ?auto_57891 ?auto_57892 ) ) ( ON ?auto_57892 ?auto_57893 ) ( not ( = ?auto_57888 ?auto_57893 ) ) ( not ( = ?auto_57889 ?auto_57893 ) ) ( not ( = ?auto_57890 ?auto_57893 ) ) ( not ( = ?auto_57891 ?auto_57893 ) ) ( not ( = ?auto_57892 ?auto_57893 ) ) ( ON ?auto_57891 ?auto_57892 ) ( ON-TABLE ?auto_57894 ) ( ON ?auto_57893 ?auto_57894 ) ( not ( = ?auto_57894 ?auto_57893 ) ) ( not ( = ?auto_57894 ?auto_57892 ) ) ( not ( = ?auto_57894 ?auto_57891 ) ) ( not ( = ?auto_57888 ?auto_57894 ) ) ( not ( = ?auto_57889 ?auto_57894 ) ) ( not ( = ?auto_57890 ?auto_57894 ) ) ( ON ?auto_57890 ?auto_57891 ) ( CLEAR ?auto_57888 ) ( ON ?auto_57889 ?auto_57890 ) ( CLEAR ?auto_57889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57894 ?auto_57893 ?auto_57892 ?auto_57891 ?auto_57890 )
      ( MAKE-5PILE ?auto_57888 ?auto_57889 ?auto_57890 ?auto_57891 ?auto_57892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57895 - BLOCK
      ?auto_57896 - BLOCK
      ?auto_57897 - BLOCK
      ?auto_57898 - BLOCK
      ?auto_57899 - BLOCK
    )
    :vars
    (
      ?auto_57901 - BLOCK
      ?auto_57900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57895 ?auto_57896 ) ) ( not ( = ?auto_57895 ?auto_57897 ) ) ( not ( = ?auto_57895 ?auto_57898 ) ) ( not ( = ?auto_57895 ?auto_57899 ) ) ( not ( = ?auto_57896 ?auto_57897 ) ) ( not ( = ?auto_57896 ?auto_57898 ) ) ( not ( = ?auto_57896 ?auto_57899 ) ) ( not ( = ?auto_57897 ?auto_57898 ) ) ( not ( = ?auto_57897 ?auto_57899 ) ) ( not ( = ?auto_57898 ?auto_57899 ) ) ( ON ?auto_57899 ?auto_57901 ) ( not ( = ?auto_57895 ?auto_57901 ) ) ( not ( = ?auto_57896 ?auto_57901 ) ) ( not ( = ?auto_57897 ?auto_57901 ) ) ( not ( = ?auto_57898 ?auto_57901 ) ) ( not ( = ?auto_57899 ?auto_57901 ) ) ( ON ?auto_57898 ?auto_57899 ) ( ON-TABLE ?auto_57900 ) ( ON ?auto_57901 ?auto_57900 ) ( not ( = ?auto_57900 ?auto_57901 ) ) ( not ( = ?auto_57900 ?auto_57899 ) ) ( not ( = ?auto_57900 ?auto_57898 ) ) ( not ( = ?auto_57895 ?auto_57900 ) ) ( not ( = ?auto_57896 ?auto_57900 ) ) ( not ( = ?auto_57897 ?auto_57900 ) ) ( ON ?auto_57897 ?auto_57898 ) ( ON ?auto_57896 ?auto_57897 ) ( CLEAR ?auto_57896 ) ( HOLDING ?auto_57895 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57895 )
      ( MAKE-5PILE ?auto_57895 ?auto_57896 ?auto_57897 ?auto_57898 ?auto_57899 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_57902 - BLOCK
      ?auto_57903 - BLOCK
      ?auto_57904 - BLOCK
      ?auto_57905 - BLOCK
      ?auto_57906 - BLOCK
    )
    :vars
    (
      ?auto_57907 - BLOCK
      ?auto_57908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57902 ?auto_57903 ) ) ( not ( = ?auto_57902 ?auto_57904 ) ) ( not ( = ?auto_57902 ?auto_57905 ) ) ( not ( = ?auto_57902 ?auto_57906 ) ) ( not ( = ?auto_57903 ?auto_57904 ) ) ( not ( = ?auto_57903 ?auto_57905 ) ) ( not ( = ?auto_57903 ?auto_57906 ) ) ( not ( = ?auto_57904 ?auto_57905 ) ) ( not ( = ?auto_57904 ?auto_57906 ) ) ( not ( = ?auto_57905 ?auto_57906 ) ) ( ON ?auto_57906 ?auto_57907 ) ( not ( = ?auto_57902 ?auto_57907 ) ) ( not ( = ?auto_57903 ?auto_57907 ) ) ( not ( = ?auto_57904 ?auto_57907 ) ) ( not ( = ?auto_57905 ?auto_57907 ) ) ( not ( = ?auto_57906 ?auto_57907 ) ) ( ON ?auto_57905 ?auto_57906 ) ( ON-TABLE ?auto_57908 ) ( ON ?auto_57907 ?auto_57908 ) ( not ( = ?auto_57908 ?auto_57907 ) ) ( not ( = ?auto_57908 ?auto_57906 ) ) ( not ( = ?auto_57908 ?auto_57905 ) ) ( not ( = ?auto_57902 ?auto_57908 ) ) ( not ( = ?auto_57903 ?auto_57908 ) ) ( not ( = ?auto_57904 ?auto_57908 ) ) ( ON ?auto_57904 ?auto_57905 ) ( ON ?auto_57903 ?auto_57904 ) ( ON ?auto_57902 ?auto_57903 ) ( CLEAR ?auto_57902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57908 ?auto_57907 ?auto_57906 ?auto_57905 ?auto_57904 ?auto_57903 )
      ( MAKE-5PILE ?auto_57902 ?auto_57903 ?auto_57904 ?auto_57905 ?auto_57906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57910 - BLOCK
    )
    :vars
    (
      ?auto_57911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57911 ?auto_57910 ) ( CLEAR ?auto_57911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_57910 ) ( not ( = ?auto_57910 ?auto_57911 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57911 ?auto_57910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57912 - BLOCK
    )
    :vars
    (
      ?auto_57913 - BLOCK
      ?auto_57914 - BLOCK
      ?auto_57915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57913 ?auto_57912 ) ( CLEAR ?auto_57913 ) ( ON-TABLE ?auto_57912 ) ( not ( = ?auto_57912 ?auto_57913 ) ) ( HOLDING ?auto_57914 ) ( CLEAR ?auto_57915 ) ( not ( = ?auto_57912 ?auto_57914 ) ) ( not ( = ?auto_57912 ?auto_57915 ) ) ( not ( = ?auto_57913 ?auto_57914 ) ) ( not ( = ?auto_57913 ?auto_57915 ) ) ( not ( = ?auto_57914 ?auto_57915 ) ) )
    :subtasks
    ( ( !STACK ?auto_57914 ?auto_57915 )
      ( MAKE-1PILE ?auto_57912 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57916 - BLOCK
    )
    :vars
    (
      ?auto_57918 - BLOCK
      ?auto_57919 - BLOCK
      ?auto_57917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57918 ?auto_57916 ) ( ON-TABLE ?auto_57916 ) ( not ( = ?auto_57916 ?auto_57918 ) ) ( CLEAR ?auto_57919 ) ( not ( = ?auto_57916 ?auto_57917 ) ) ( not ( = ?auto_57916 ?auto_57919 ) ) ( not ( = ?auto_57918 ?auto_57917 ) ) ( not ( = ?auto_57918 ?auto_57919 ) ) ( not ( = ?auto_57917 ?auto_57919 ) ) ( ON ?auto_57917 ?auto_57918 ) ( CLEAR ?auto_57917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57916 ?auto_57918 )
      ( MAKE-1PILE ?auto_57916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57920 - BLOCK
    )
    :vars
    (
      ?auto_57922 - BLOCK
      ?auto_57923 - BLOCK
      ?auto_57921 - BLOCK
      ?auto_57926 - BLOCK
      ?auto_57925 - BLOCK
      ?auto_57924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57922 ?auto_57920 ) ( ON-TABLE ?auto_57920 ) ( not ( = ?auto_57920 ?auto_57922 ) ) ( not ( = ?auto_57920 ?auto_57923 ) ) ( not ( = ?auto_57920 ?auto_57921 ) ) ( not ( = ?auto_57922 ?auto_57923 ) ) ( not ( = ?auto_57922 ?auto_57921 ) ) ( not ( = ?auto_57923 ?auto_57921 ) ) ( ON ?auto_57923 ?auto_57922 ) ( CLEAR ?auto_57923 ) ( HOLDING ?auto_57921 ) ( CLEAR ?auto_57926 ) ( ON-TABLE ?auto_57925 ) ( ON ?auto_57924 ?auto_57925 ) ( ON ?auto_57926 ?auto_57924 ) ( not ( = ?auto_57925 ?auto_57924 ) ) ( not ( = ?auto_57925 ?auto_57926 ) ) ( not ( = ?auto_57925 ?auto_57921 ) ) ( not ( = ?auto_57924 ?auto_57926 ) ) ( not ( = ?auto_57924 ?auto_57921 ) ) ( not ( = ?auto_57926 ?auto_57921 ) ) ( not ( = ?auto_57920 ?auto_57926 ) ) ( not ( = ?auto_57920 ?auto_57925 ) ) ( not ( = ?auto_57920 ?auto_57924 ) ) ( not ( = ?auto_57922 ?auto_57926 ) ) ( not ( = ?auto_57922 ?auto_57925 ) ) ( not ( = ?auto_57922 ?auto_57924 ) ) ( not ( = ?auto_57923 ?auto_57926 ) ) ( not ( = ?auto_57923 ?auto_57925 ) ) ( not ( = ?auto_57923 ?auto_57924 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57925 ?auto_57924 ?auto_57926 ?auto_57921 )
      ( MAKE-1PILE ?auto_57920 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57927 - BLOCK
    )
    :vars
    (
      ?auto_57933 - BLOCK
      ?auto_57930 - BLOCK
      ?auto_57929 - BLOCK
      ?auto_57928 - BLOCK
      ?auto_57932 - BLOCK
      ?auto_57931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57933 ?auto_57927 ) ( ON-TABLE ?auto_57927 ) ( not ( = ?auto_57927 ?auto_57933 ) ) ( not ( = ?auto_57927 ?auto_57930 ) ) ( not ( = ?auto_57927 ?auto_57929 ) ) ( not ( = ?auto_57933 ?auto_57930 ) ) ( not ( = ?auto_57933 ?auto_57929 ) ) ( not ( = ?auto_57930 ?auto_57929 ) ) ( ON ?auto_57930 ?auto_57933 ) ( CLEAR ?auto_57928 ) ( ON-TABLE ?auto_57932 ) ( ON ?auto_57931 ?auto_57932 ) ( ON ?auto_57928 ?auto_57931 ) ( not ( = ?auto_57932 ?auto_57931 ) ) ( not ( = ?auto_57932 ?auto_57928 ) ) ( not ( = ?auto_57932 ?auto_57929 ) ) ( not ( = ?auto_57931 ?auto_57928 ) ) ( not ( = ?auto_57931 ?auto_57929 ) ) ( not ( = ?auto_57928 ?auto_57929 ) ) ( not ( = ?auto_57927 ?auto_57928 ) ) ( not ( = ?auto_57927 ?auto_57932 ) ) ( not ( = ?auto_57927 ?auto_57931 ) ) ( not ( = ?auto_57933 ?auto_57928 ) ) ( not ( = ?auto_57933 ?auto_57932 ) ) ( not ( = ?auto_57933 ?auto_57931 ) ) ( not ( = ?auto_57930 ?auto_57928 ) ) ( not ( = ?auto_57930 ?auto_57932 ) ) ( not ( = ?auto_57930 ?auto_57931 ) ) ( ON ?auto_57929 ?auto_57930 ) ( CLEAR ?auto_57929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57927 ?auto_57933 ?auto_57930 )
      ( MAKE-1PILE ?auto_57927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57934 - BLOCK
    )
    :vars
    (
      ?auto_57936 - BLOCK
      ?auto_57940 - BLOCK
      ?auto_57937 - BLOCK
      ?auto_57935 - BLOCK
      ?auto_57938 - BLOCK
      ?auto_57939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57936 ?auto_57934 ) ( ON-TABLE ?auto_57934 ) ( not ( = ?auto_57934 ?auto_57936 ) ) ( not ( = ?auto_57934 ?auto_57940 ) ) ( not ( = ?auto_57934 ?auto_57937 ) ) ( not ( = ?auto_57936 ?auto_57940 ) ) ( not ( = ?auto_57936 ?auto_57937 ) ) ( not ( = ?auto_57940 ?auto_57937 ) ) ( ON ?auto_57940 ?auto_57936 ) ( ON-TABLE ?auto_57935 ) ( ON ?auto_57938 ?auto_57935 ) ( not ( = ?auto_57935 ?auto_57938 ) ) ( not ( = ?auto_57935 ?auto_57939 ) ) ( not ( = ?auto_57935 ?auto_57937 ) ) ( not ( = ?auto_57938 ?auto_57939 ) ) ( not ( = ?auto_57938 ?auto_57937 ) ) ( not ( = ?auto_57939 ?auto_57937 ) ) ( not ( = ?auto_57934 ?auto_57939 ) ) ( not ( = ?auto_57934 ?auto_57935 ) ) ( not ( = ?auto_57934 ?auto_57938 ) ) ( not ( = ?auto_57936 ?auto_57939 ) ) ( not ( = ?auto_57936 ?auto_57935 ) ) ( not ( = ?auto_57936 ?auto_57938 ) ) ( not ( = ?auto_57940 ?auto_57939 ) ) ( not ( = ?auto_57940 ?auto_57935 ) ) ( not ( = ?auto_57940 ?auto_57938 ) ) ( ON ?auto_57937 ?auto_57940 ) ( CLEAR ?auto_57937 ) ( HOLDING ?auto_57939 ) ( CLEAR ?auto_57938 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_57935 ?auto_57938 ?auto_57939 )
      ( MAKE-1PILE ?auto_57934 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57941 - BLOCK
    )
    :vars
    (
      ?auto_57943 - BLOCK
      ?auto_57942 - BLOCK
      ?auto_57946 - BLOCK
      ?auto_57945 - BLOCK
      ?auto_57947 - BLOCK
      ?auto_57944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57943 ?auto_57941 ) ( ON-TABLE ?auto_57941 ) ( not ( = ?auto_57941 ?auto_57943 ) ) ( not ( = ?auto_57941 ?auto_57942 ) ) ( not ( = ?auto_57941 ?auto_57946 ) ) ( not ( = ?auto_57943 ?auto_57942 ) ) ( not ( = ?auto_57943 ?auto_57946 ) ) ( not ( = ?auto_57942 ?auto_57946 ) ) ( ON ?auto_57942 ?auto_57943 ) ( ON-TABLE ?auto_57945 ) ( ON ?auto_57947 ?auto_57945 ) ( not ( = ?auto_57945 ?auto_57947 ) ) ( not ( = ?auto_57945 ?auto_57944 ) ) ( not ( = ?auto_57945 ?auto_57946 ) ) ( not ( = ?auto_57947 ?auto_57944 ) ) ( not ( = ?auto_57947 ?auto_57946 ) ) ( not ( = ?auto_57944 ?auto_57946 ) ) ( not ( = ?auto_57941 ?auto_57944 ) ) ( not ( = ?auto_57941 ?auto_57945 ) ) ( not ( = ?auto_57941 ?auto_57947 ) ) ( not ( = ?auto_57943 ?auto_57944 ) ) ( not ( = ?auto_57943 ?auto_57945 ) ) ( not ( = ?auto_57943 ?auto_57947 ) ) ( not ( = ?auto_57942 ?auto_57944 ) ) ( not ( = ?auto_57942 ?auto_57945 ) ) ( not ( = ?auto_57942 ?auto_57947 ) ) ( ON ?auto_57946 ?auto_57942 ) ( CLEAR ?auto_57947 ) ( ON ?auto_57944 ?auto_57946 ) ( CLEAR ?auto_57944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_57941 ?auto_57943 ?auto_57942 ?auto_57946 )
      ( MAKE-1PILE ?auto_57941 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57948 - BLOCK
    )
    :vars
    (
      ?auto_57953 - BLOCK
      ?auto_57954 - BLOCK
      ?auto_57952 - BLOCK
      ?auto_57949 - BLOCK
      ?auto_57950 - BLOCK
      ?auto_57951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57953 ?auto_57948 ) ( ON-TABLE ?auto_57948 ) ( not ( = ?auto_57948 ?auto_57953 ) ) ( not ( = ?auto_57948 ?auto_57954 ) ) ( not ( = ?auto_57948 ?auto_57952 ) ) ( not ( = ?auto_57953 ?auto_57954 ) ) ( not ( = ?auto_57953 ?auto_57952 ) ) ( not ( = ?auto_57954 ?auto_57952 ) ) ( ON ?auto_57954 ?auto_57953 ) ( ON-TABLE ?auto_57949 ) ( not ( = ?auto_57949 ?auto_57950 ) ) ( not ( = ?auto_57949 ?auto_57951 ) ) ( not ( = ?auto_57949 ?auto_57952 ) ) ( not ( = ?auto_57950 ?auto_57951 ) ) ( not ( = ?auto_57950 ?auto_57952 ) ) ( not ( = ?auto_57951 ?auto_57952 ) ) ( not ( = ?auto_57948 ?auto_57951 ) ) ( not ( = ?auto_57948 ?auto_57949 ) ) ( not ( = ?auto_57948 ?auto_57950 ) ) ( not ( = ?auto_57953 ?auto_57951 ) ) ( not ( = ?auto_57953 ?auto_57949 ) ) ( not ( = ?auto_57953 ?auto_57950 ) ) ( not ( = ?auto_57954 ?auto_57951 ) ) ( not ( = ?auto_57954 ?auto_57949 ) ) ( not ( = ?auto_57954 ?auto_57950 ) ) ( ON ?auto_57952 ?auto_57954 ) ( ON ?auto_57951 ?auto_57952 ) ( CLEAR ?auto_57951 ) ( HOLDING ?auto_57950 ) ( CLEAR ?auto_57949 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_57949 ?auto_57950 )
      ( MAKE-1PILE ?auto_57948 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57955 - BLOCK
    )
    :vars
    (
      ?auto_57957 - BLOCK
      ?auto_57956 - BLOCK
      ?auto_57960 - BLOCK
      ?auto_57958 - BLOCK
      ?auto_57961 - BLOCK
      ?auto_57959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57957 ?auto_57955 ) ( ON-TABLE ?auto_57955 ) ( not ( = ?auto_57955 ?auto_57957 ) ) ( not ( = ?auto_57955 ?auto_57956 ) ) ( not ( = ?auto_57955 ?auto_57960 ) ) ( not ( = ?auto_57957 ?auto_57956 ) ) ( not ( = ?auto_57957 ?auto_57960 ) ) ( not ( = ?auto_57956 ?auto_57960 ) ) ( ON ?auto_57956 ?auto_57957 ) ( ON-TABLE ?auto_57958 ) ( not ( = ?auto_57958 ?auto_57961 ) ) ( not ( = ?auto_57958 ?auto_57959 ) ) ( not ( = ?auto_57958 ?auto_57960 ) ) ( not ( = ?auto_57961 ?auto_57959 ) ) ( not ( = ?auto_57961 ?auto_57960 ) ) ( not ( = ?auto_57959 ?auto_57960 ) ) ( not ( = ?auto_57955 ?auto_57959 ) ) ( not ( = ?auto_57955 ?auto_57958 ) ) ( not ( = ?auto_57955 ?auto_57961 ) ) ( not ( = ?auto_57957 ?auto_57959 ) ) ( not ( = ?auto_57957 ?auto_57958 ) ) ( not ( = ?auto_57957 ?auto_57961 ) ) ( not ( = ?auto_57956 ?auto_57959 ) ) ( not ( = ?auto_57956 ?auto_57958 ) ) ( not ( = ?auto_57956 ?auto_57961 ) ) ( ON ?auto_57960 ?auto_57956 ) ( ON ?auto_57959 ?auto_57960 ) ( CLEAR ?auto_57958 ) ( ON ?auto_57961 ?auto_57959 ) ( CLEAR ?auto_57961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57955 ?auto_57957 ?auto_57956 ?auto_57960 ?auto_57959 )
      ( MAKE-1PILE ?auto_57955 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57962 - BLOCK
    )
    :vars
    (
      ?auto_57964 - BLOCK
      ?auto_57963 - BLOCK
      ?auto_57967 - BLOCK
      ?auto_57966 - BLOCK
      ?auto_57965 - BLOCK
      ?auto_57968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57964 ?auto_57962 ) ( ON-TABLE ?auto_57962 ) ( not ( = ?auto_57962 ?auto_57964 ) ) ( not ( = ?auto_57962 ?auto_57963 ) ) ( not ( = ?auto_57962 ?auto_57967 ) ) ( not ( = ?auto_57964 ?auto_57963 ) ) ( not ( = ?auto_57964 ?auto_57967 ) ) ( not ( = ?auto_57963 ?auto_57967 ) ) ( ON ?auto_57963 ?auto_57964 ) ( not ( = ?auto_57966 ?auto_57965 ) ) ( not ( = ?auto_57966 ?auto_57968 ) ) ( not ( = ?auto_57966 ?auto_57967 ) ) ( not ( = ?auto_57965 ?auto_57968 ) ) ( not ( = ?auto_57965 ?auto_57967 ) ) ( not ( = ?auto_57968 ?auto_57967 ) ) ( not ( = ?auto_57962 ?auto_57968 ) ) ( not ( = ?auto_57962 ?auto_57966 ) ) ( not ( = ?auto_57962 ?auto_57965 ) ) ( not ( = ?auto_57964 ?auto_57968 ) ) ( not ( = ?auto_57964 ?auto_57966 ) ) ( not ( = ?auto_57964 ?auto_57965 ) ) ( not ( = ?auto_57963 ?auto_57968 ) ) ( not ( = ?auto_57963 ?auto_57966 ) ) ( not ( = ?auto_57963 ?auto_57965 ) ) ( ON ?auto_57967 ?auto_57963 ) ( ON ?auto_57968 ?auto_57967 ) ( ON ?auto_57965 ?auto_57968 ) ( CLEAR ?auto_57965 ) ( HOLDING ?auto_57966 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_57966 )
      ( MAKE-1PILE ?auto_57962 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57969 - BLOCK
    )
    :vars
    (
      ?auto_57970 - BLOCK
      ?auto_57971 - BLOCK
      ?auto_57974 - BLOCK
      ?auto_57973 - BLOCK
      ?auto_57972 - BLOCK
      ?auto_57975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_57970 ?auto_57969 ) ( ON-TABLE ?auto_57969 ) ( not ( = ?auto_57969 ?auto_57970 ) ) ( not ( = ?auto_57969 ?auto_57971 ) ) ( not ( = ?auto_57969 ?auto_57974 ) ) ( not ( = ?auto_57970 ?auto_57971 ) ) ( not ( = ?auto_57970 ?auto_57974 ) ) ( not ( = ?auto_57971 ?auto_57974 ) ) ( ON ?auto_57971 ?auto_57970 ) ( not ( = ?auto_57973 ?auto_57972 ) ) ( not ( = ?auto_57973 ?auto_57975 ) ) ( not ( = ?auto_57973 ?auto_57974 ) ) ( not ( = ?auto_57972 ?auto_57975 ) ) ( not ( = ?auto_57972 ?auto_57974 ) ) ( not ( = ?auto_57975 ?auto_57974 ) ) ( not ( = ?auto_57969 ?auto_57975 ) ) ( not ( = ?auto_57969 ?auto_57973 ) ) ( not ( = ?auto_57969 ?auto_57972 ) ) ( not ( = ?auto_57970 ?auto_57975 ) ) ( not ( = ?auto_57970 ?auto_57973 ) ) ( not ( = ?auto_57970 ?auto_57972 ) ) ( not ( = ?auto_57971 ?auto_57975 ) ) ( not ( = ?auto_57971 ?auto_57973 ) ) ( not ( = ?auto_57971 ?auto_57972 ) ) ( ON ?auto_57974 ?auto_57971 ) ( ON ?auto_57975 ?auto_57974 ) ( ON ?auto_57972 ?auto_57975 ) ( ON ?auto_57973 ?auto_57972 ) ( CLEAR ?auto_57973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_57969 ?auto_57970 ?auto_57971 ?auto_57974 ?auto_57975 ?auto_57972 )
      ( MAKE-1PILE ?auto_57969 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57982 - BLOCK
      ?auto_57983 - BLOCK
      ?auto_57984 - BLOCK
      ?auto_57985 - BLOCK
      ?auto_57986 - BLOCK
      ?auto_57987 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_57987 ) ( CLEAR ?auto_57986 ) ( ON-TABLE ?auto_57982 ) ( ON ?auto_57983 ?auto_57982 ) ( ON ?auto_57984 ?auto_57983 ) ( ON ?auto_57985 ?auto_57984 ) ( ON ?auto_57986 ?auto_57985 ) ( not ( = ?auto_57982 ?auto_57983 ) ) ( not ( = ?auto_57982 ?auto_57984 ) ) ( not ( = ?auto_57982 ?auto_57985 ) ) ( not ( = ?auto_57982 ?auto_57986 ) ) ( not ( = ?auto_57982 ?auto_57987 ) ) ( not ( = ?auto_57983 ?auto_57984 ) ) ( not ( = ?auto_57983 ?auto_57985 ) ) ( not ( = ?auto_57983 ?auto_57986 ) ) ( not ( = ?auto_57983 ?auto_57987 ) ) ( not ( = ?auto_57984 ?auto_57985 ) ) ( not ( = ?auto_57984 ?auto_57986 ) ) ( not ( = ?auto_57984 ?auto_57987 ) ) ( not ( = ?auto_57985 ?auto_57986 ) ) ( not ( = ?auto_57985 ?auto_57987 ) ) ( not ( = ?auto_57986 ?auto_57987 ) ) )
    :subtasks
    ( ( !STACK ?auto_57987 ?auto_57986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57988 - BLOCK
      ?auto_57989 - BLOCK
      ?auto_57990 - BLOCK
      ?auto_57991 - BLOCK
      ?auto_57992 - BLOCK
      ?auto_57993 - BLOCK
    )
    :vars
    (
      ?auto_57994 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57992 ) ( ON-TABLE ?auto_57988 ) ( ON ?auto_57989 ?auto_57988 ) ( ON ?auto_57990 ?auto_57989 ) ( ON ?auto_57991 ?auto_57990 ) ( ON ?auto_57992 ?auto_57991 ) ( not ( = ?auto_57988 ?auto_57989 ) ) ( not ( = ?auto_57988 ?auto_57990 ) ) ( not ( = ?auto_57988 ?auto_57991 ) ) ( not ( = ?auto_57988 ?auto_57992 ) ) ( not ( = ?auto_57988 ?auto_57993 ) ) ( not ( = ?auto_57989 ?auto_57990 ) ) ( not ( = ?auto_57989 ?auto_57991 ) ) ( not ( = ?auto_57989 ?auto_57992 ) ) ( not ( = ?auto_57989 ?auto_57993 ) ) ( not ( = ?auto_57990 ?auto_57991 ) ) ( not ( = ?auto_57990 ?auto_57992 ) ) ( not ( = ?auto_57990 ?auto_57993 ) ) ( not ( = ?auto_57991 ?auto_57992 ) ) ( not ( = ?auto_57991 ?auto_57993 ) ) ( not ( = ?auto_57992 ?auto_57993 ) ) ( ON ?auto_57993 ?auto_57994 ) ( CLEAR ?auto_57993 ) ( HAND-EMPTY ) ( not ( = ?auto_57988 ?auto_57994 ) ) ( not ( = ?auto_57989 ?auto_57994 ) ) ( not ( = ?auto_57990 ?auto_57994 ) ) ( not ( = ?auto_57991 ?auto_57994 ) ) ( not ( = ?auto_57992 ?auto_57994 ) ) ( not ( = ?auto_57993 ?auto_57994 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_57993 ?auto_57994 )
      ( MAKE-6PILE ?auto_57988 ?auto_57989 ?auto_57990 ?auto_57991 ?auto_57992 ?auto_57993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_57995 - BLOCK
      ?auto_57996 - BLOCK
      ?auto_57997 - BLOCK
      ?auto_57998 - BLOCK
      ?auto_57999 - BLOCK
      ?auto_58000 - BLOCK
    )
    :vars
    (
      ?auto_58001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_57995 ) ( ON ?auto_57996 ?auto_57995 ) ( ON ?auto_57997 ?auto_57996 ) ( ON ?auto_57998 ?auto_57997 ) ( not ( = ?auto_57995 ?auto_57996 ) ) ( not ( = ?auto_57995 ?auto_57997 ) ) ( not ( = ?auto_57995 ?auto_57998 ) ) ( not ( = ?auto_57995 ?auto_57999 ) ) ( not ( = ?auto_57995 ?auto_58000 ) ) ( not ( = ?auto_57996 ?auto_57997 ) ) ( not ( = ?auto_57996 ?auto_57998 ) ) ( not ( = ?auto_57996 ?auto_57999 ) ) ( not ( = ?auto_57996 ?auto_58000 ) ) ( not ( = ?auto_57997 ?auto_57998 ) ) ( not ( = ?auto_57997 ?auto_57999 ) ) ( not ( = ?auto_57997 ?auto_58000 ) ) ( not ( = ?auto_57998 ?auto_57999 ) ) ( not ( = ?auto_57998 ?auto_58000 ) ) ( not ( = ?auto_57999 ?auto_58000 ) ) ( ON ?auto_58000 ?auto_58001 ) ( CLEAR ?auto_58000 ) ( not ( = ?auto_57995 ?auto_58001 ) ) ( not ( = ?auto_57996 ?auto_58001 ) ) ( not ( = ?auto_57997 ?auto_58001 ) ) ( not ( = ?auto_57998 ?auto_58001 ) ) ( not ( = ?auto_57999 ?auto_58001 ) ) ( not ( = ?auto_58000 ?auto_58001 ) ) ( HOLDING ?auto_57999 ) ( CLEAR ?auto_57998 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_57995 ?auto_57996 ?auto_57997 ?auto_57998 ?auto_57999 )
      ( MAKE-6PILE ?auto_57995 ?auto_57996 ?auto_57997 ?auto_57998 ?auto_57999 ?auto_58000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58002 - BLOCK
      ?auto_58003 - BLOCK
      ?auto_58004 - BLOCK
      ?auto_58005 - BLOCK
      ?auto_58006 - BLOCK
      ?auto_58007 - BLOCK
    )
    :vars
    (
      ?auto_58008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58002 ) ( ON ?auto_58003 ?auto_58002 ) ( ON ?auto_58004 ?auto_58003 ) ( ON ?auto_58005 ?auto_58004 ) ( not ( = ?auto_58002 ?auto_58003 ) ) ( not ( = ?auto_58002 ?auto_58004 ) ) ( not ( = ?auto_58002 ?auto_58005 ) ) ( not ( = ?auto_58002 ?auto_58006 ) ) ( not ( = ?auto_58002 ?auto_58007 ) ) ( not ( = ?auto_58003 ?auto_58004 ) ) ( not ( = ?auto_58003 ?auto_58005 ) ) ( not ( = ?auto_58003 ?auto_58006 ) ) ( not ( = ?auto_58003 ?auto_58007 ) ) ( not ( = ?auto_58004 ?auto_58005 ) ) ( not ( = ?auto_58004 ?auto_58006 ) ) ( not ( = ?auto_58004 ?auto_58007 ) ) ( not ( = ?auto_58005 ?auto_58006 ) ) ( not ( = ?auto_58005 ?auto_58007 ) ) ( not ( = ?auto_58006 ?auto_58007 ) ) ( ON ?auto_58007 ?auto_58008 ) ( not ( = ?auto_58002 ?auto_58008 ) ) ( not ( = ?auto_58003 ?auto_58008 ) ) ( not ( = ?auto_58004 ?auto_58008 ) ) ( not ( = ?auto_58005 ?auto_58008 ) ) ( not ( = ?auto_58006 ?auto_58008 ) ) ( not ( = ?auto_58007 ?auto_58008 ) ) ( CLEAR ?auto_58005 ) ( ON ?auto_58006 ?auto_58007 ) ( CLEAR ?auto_58006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58008 ?auto_58007 )
      ( MAKE-6PILE ?auto_58002 ?auto_58003 ?auto_58004 ?auto_58005 ?auto_58006 ?auto_58007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58009 - BLOCK
      ?auto_58010 - BLOCK
      ?auto_58011 - BLOCK
      ?auto_58012 - BLOCK
      ?auto_58013 - BLOCK
      ?auto_58014 - BLOCK
    )
    :vars
    (
      ?auto_58015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58009 ) ( ON ?auto_58010 ?auto_58009 ) ( ON ?auto_58011 ?auto_58010 ) ( not ( = ?auto_58009 ?auto_58010 ) ) ( not ( = ?auto_58009 ?auto_58011 ) ) ( not ( = ?auto_58009 ?auto_58012 ) ) ( not ( = ?auto_58009 ?auto_58013 ) ) ( not ( = ?auto_58009 ?auto_58014 ) ) ( not ( = ?auto_58010 ?auto_58011 ) ) ( not ( = ?auto_58010 ?auto_58012 ) ) ( not ( = ?auto_58010 ?auto_58013 ) ) ( not ( = ?auto_58010 ?auto_58014 ) ) ( not ( = ?auto_58011 ?auto_58012 ) ) ( not ( = ?auto_58011 ?auto_58013 ) ) ( not ( = ?auto_58011 ?auto_58014 ) ) ( not ( = ?auto_58012 ?auto_58013 ) ) ( not ( = ?auto_58012 ?auto_58014 ) ) ( not ( = ?auto_58013 ?auto_58014 ) ) ( ON ?auto_58014 ?auto_58015 ) ( not ( = ?auto_58009 ?auto_58015 ) ) ( not ( = ?auto_58010 ?auto_58015 ) ) ( not ( = ?auto_58011 ?auto_58015 ) ) ( not ( = ?auto_58012 ?auto_58015 ) ) ( not ( = ?auto_58013 ?auto_58015 ) ) ( not ( = ?auto_58014 ?auto_58015 ) ) ( ON ?auto_58013 ?auto_58014 ) ( CLEAR ?auto_58013 ) ( ON-TABLE ?auto_58015 ) ( HOLDING ?auto_58012 ) ( CLEAR ?auto_58011 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58009 ?auto_58010 ?auto_58011 ?auto_58012 )
      ( MAKE-6PILE ?auto_58009 ?auto_58010 ?auto_58011 ?auto_58012 ?auto_58013 ?auto_58014 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58016 - BLOCK
      ?auto_58017 - BLOCK
      ?auto_58018 - BLOCK
      ?auto_58019 - BLOCK
      ?auto_58020 - BLOCK
      ?auto_58021 - BLOCK
    )
    :vars
    (
      ?auto_58022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58016 ) ( ON ?auto_58017 ?auto_58016 ) ( ON ?auto_58018 ?auto_58017 ) ( not ( = ?auto_58016 ?auto_58017 ) ) ( not ( = ?auto_58016 ?auto_58018 ) ) ( not ( = ?auto_58016 ?auto_58019 ) ) ( not ( = ?auto_58016 ?auto_58020 ) ) ( not ( = ?auto_58016 ?auto_58021 ) ) ( not ( = ?auto_58017 ?auto_58018 ) ) ( not ( = ?auto_58017 ?auto_58019 ) ) ( not ( = ?auto_58017 ?auto_58020 ) ) ( not ( = ?auto_58017 ?auto_58021 ) ) ( not ( = ?auto_58018 ?auto_58019 ) ) ( not ( = ?auto_58018 ?auto_58020 ) ) ( not ( = ?auto_58018 ?auto_58021 ) ) ( not ( = ?auto_58019 ?auto_58020 ) ) ( not ( = ?auto_58019 ?auto_58021 ) ) ( not ( = ?auto_58020 ?auto_58021 ) ) ( ON ?auto_58021 ?auto_58022 ) ( not ( = ?auto_58016 ?auto_58022 ) ) ( not ( = ?auto_58017 ?auto_58022 ) ) ( not ( = ?auto_58018 ?auto_58022 ) ) ( not ( = ?auto_58019 ?auto_58022 ) ) ( not ( = ?auto_58020 ?auto_58022 ) ) ( not ( = ?auto_58021 ?auto_58022 ) ) ( ON ?auto_58020 ?auto_58021 ) ( ON-TABLE ?auto_58022 ) ( CLEAR ?auto_58018 ) ( ON ?auto_58019 ?auto_58020 ) ( CLEAR ?auto_58019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58022 ?auto_58021 ?auto_58020 )
      ( MAKE-6PILE ?auto_58016 ?auto_58017 ?auto_58018 ?auto_58019 ?auto_58020 ?auto_58021 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58023 - BLOCK
      ?auto_58024 - BLOCK
      ?auto_58025 - BLOCK
      ?auto_58026 - BLOCK
      ?auto_58027 - BLOCK
      ?auto_58028 - BLOCK
    )
    :vars
    (
      ?auto_58029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58023 ) ( ON ?auto_58024 ?auto_58023 ) ( not ( = ?auto_58023 ?auto_58024 ) ) ( not ( = ?auto_58023 ?auto_58025 ) ) ( not ( = ?auto_58023 ?auto_58026 ) ) ( not ( = ?auto_58023 ?auto_58027 ) ) ( not ( = ?auto_58023 ?auto_58028 ) ) ( not ( = ?auto_58024 ?auto_58025 ) ) ( not ( = ?auto_58024 ?auto_58026 ) ) ( not ( = ?auto_58024 ?auto_58027 ) ) ( not ( = ?auto_58024 ?auto_58028 ) ) ( not ( = ?auto_58025 ?auto_58026 ) ) ( not ( = ?auto_58025 ?auto_58027 ) ) ( not ( = ?auto_58025 ?auto_58028 ) ) ( not ( = ?auto_58026 ?auto_58027 ) ) ( not ( = ?auto_58026 ?auto_58028 ) ) ( not ( = ?auto_58027 ?auto_58028 ) ) ( ON ?auto_58028 ?auto_58029 ) ( not ( = ?auto_58023 ?auto_58029 ) ) ( not ( = ?auto_58024 ?auto_58029 ) ) ( not ( = ?auto_58025 ?auto_58029 ) ) ( not ( = ?auto_58026 ?auto_58029 ) ) ( not ( = ?auto_58027 ?auto_58029 ) ) ( not ( = ?auto_58028 ?auto_58029 ) ) ( ON ?auto_58027 ?auto_58028 ) ( ON-TABLE ?auto_58029 ) ( ON ?auto_58026 ?auto_58027 ) ( CLEAR ?auto_58026 ) ( HOLDING ?auto_58025 ) ( CLEAR ?auto_58024 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58023 ?auto_58024 ?auto_58025 )
      ( MAKE-6PILE ?auto_58023 ?auto_58024 ?auto_58025 ?auto_58026 ?auto_58027 ?auto_58028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58030 - BLOCK
      ?auto_58031 - BLOCK
      ?auto_58032 - BLOCK
      ?auto_58033 - BLOCK
      ?auto_58034 - BLOCK
      ?auto_58035 - BLOCK
    )
    :vars
    (
      ?auto_58036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58030 ) ( ON ?auto_58031 ?auto_58030 ) ( not ( = ?auto_58030 ?auto_58031 ) ) ( not ( = ?auto_58030 ?auto_58032 ) ) ( not ( = ?auto_58030 ?auto_58033 ) ) ( not ( = ?auto_58030 ?auto_58034 ) ) ( not ( = ?auto_58030 ?auto_58035 ) ) ( not ( = ?auto_58031 ?auto_58032 ) ) ( not ( = ?auto_58031 ?auto_58033 ) ) ( not ( = ?auto_58031 ?auto_58034 ) ) ( not ( = ?auto_58031 ?auto_58035 ) ) ( not ( = ?auto_58032 ?auto_58033 ) ) ( not ( = ?auto_58032 ?auto_58034 ) ) ( not ( = ?auto_58032 ?auto_58035 ) ) ( not ( = ?auto_58033 ?auto_58034 ) ) ( not ( = ?auto_58033 ?auto_58035 ) ) ( not ( = ?auto_58034 ?auto_58035 ) ) ( ON ?auto_58035 ?auto_58036 ) ( not ( = ?auto_58030 ?auto_58036 ) ) ( not ( = ?auto_58031 ?auto_58036 ) ) ( not ( = ?auto_58032 ?auto_58036 ) ) ( not ( = ?auto_58033 ?auto_58036 ) ) ( not ( = ?auto_58034 ?auto_58036 ) ) ( not ( = ?auto_58035 ?auto_58036 ) ) ( ON ?auto_58034 ?auto_58035 ) ( ON-TABLE ?auto_58036 ) ( ON ?auto_58033 ?auto_58034 ) ( CLEAR ?auto_58031 ) ( ON ?auto_58032 ?auto_58033 ) ( CLEAR ?auto_58032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58036 ?auto_58035 ?auto_58034 ?auto_58033 )
      ( MAKE-6PILE ?auto_58030 ?auto_58031 ?auto_58032 ?auto_58033 ?auto_58034 ?auto_58035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58037 - BLOCK
      ?auto_58038 - BLOCK
      ?auto_58039 - BLOCK
      ?auto_58040 - BLOCK
      ?auto_58041 - BLOCK
      ?auto_58042 - BLOCK
    )
    :vars
    (
      ?auto_58043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58037 ) ( not ( = ?auto_58037 ?auto_58038 ) ) ( not ( = ?auto_58037 ?auto_58039 ) ) ( not ( = ?auto_58037 ?auto_58040 ) ) ( not ( = ?auto_58037 ?auto_58041 ) ) ( not ( = ?auto_58037 ?auto_58042 ) ) ( not ( = ?auto_58038 ?auto_58039 ) ) ( not ( = ?auto_58038 ?auto_58040 ) ) ( not ( = ?auto_58038 ?auto_58041 ) ) ( not ( = ?auto_58038 ?auto_58042 ) ) ( not ( = ?auto_58039 ?auto_58040 ) ) ( not ( = ?auto_58039 ?auto_58041 ) ) ( not ( = ?auto_58039 ?auto_58042 ) ) ( not ( = ?auto_58040 ?auto_58041 ) ) ( not ( = ?auto_58040 ?auto_58042 ) ) ( not ( = ?auto_58041 ?auto_58042 ) ) ( ON ?auto_58042 ?auto_58043 ) ( not ( = ?auto_58037 ?auto_58043 ) ) ( not ( = ?auto_58038 ?auto_58043 ) ) ( not ( = ?auto_58039 ?auto_58043 ) ) ( not ( = ?auto_58040 ?auto_58043 ) ) ( not ( = ?auto_58041 ?auto_58043 ) ) ( not ( = ?auto_58042 ?auto_58043 ) ) ( ON ?auto_58041 ?auto_58042 ) ( ON-TABLE ?auto_58043 ) ( ON ?auto_58040 ?auto_58041 ) ( ON ?auto_58039 ?auto_58040 ) ( CLEAR ?auto_58039 ) ( HOLDING ?auto_58038 ) ( CLEAR ?auto_58037 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58037 ?auto_58038 )
      ( MAKE-6PILE ?auto_58037 ?auto_58038 ?auto_58039 ?auto_58040 ?auto_58041 ?auto_58042 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58044 - BLOCK
      ?auto_58045 - BLOCK
      ?auto_58046 - BLOCK
      ?auto_58047 - BLOCK
      ?auto_58048 - BLOCK
      ?auto_58049 - BLOCK
    )
    :vars
    (
      ?auto_58050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58044 ) ( not ( = ?auto_58044 ?auto_58045 ) ) ( not ( = ?auto_58044 ?auto_58046 ) ) ( not ( = ?auto_58044 ?auto_58047 ) ) ( not ( = ?auto_58044 ?auto_58048 ) ) ( not ( = ?auto_58044 ?auto_58049 ) ) ( not ( = ?auto_58045 ?auto_58046 ) ) ( not ( = ?auto_58045 ?auto_58047 ) ) ( not ( = ?auto_58045 ?auto_58048 ) ) ( not ( = ?auto_58045 ?auto_58049 ) ) ( not ( = ?auto_58046 ?auto_58047 ) ) ( not ( = ?auto_58046 ?auto_58048 ) ) ( not ( = ?auto_58046 ?auto_58049 ) ) ( not ( = ?auto_58047 ?auto_58048 ) ) ( not ( = ?auto_58047 ?auto_58049 ) ) ( not ( = ?auto_58048 ?auto_58049 ) ) ( ON ?auto_58049 ?auto_58050 ) ( not ( = ?auto_58044 ?auto_58050 ) ) ( not ( = ?auto_58045 ?auto_58050 ) ) ( not ( = ?auto_58046 ?auto_58050 ) ) ( not ( = ?auto_58047 ?auto_58050 ) ) ( not ( = ?auto_58048 ?auto_58050 ) ) ( not ( = ?auto_58049 ?auto_58050 ) ) ( ON ?auto_58048 ?auto_58049 ) ( ON-TABLE ?auto_58050 ) ( ON ?auto_58047 ?auto_58048 ) ( ON ?auto_58046 ?auto_58047 ) ( CLEAR ?auto_58044 ) ( ON ?auto_58045 ?auto_58046 ) ( CLEAR ?auto_58045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58050 ?auto_58049 ?auto_58048 ?auto_58047 ?auto_58046 )
      ( MAKE-6PILE ?auto_58044 ?auto_58045 ?auto_58046 ?auto_58047 ?auto_58048 ?auto_58049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58051 - BLOCK
      ?auto_58052 - BLOCK
      ?auto_58053 - BLOCK
      ?auto_58054 - BLOCK
      ?auto_58055 - BLOCK
      ?auto_58056 - BLOCK
    )
    :vars
    (
      ?auto_58057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58051 ?auto_58052 ) ) ( not ( = ?auto_58051 ?auto_58053 ) ) ( not ( = ?auto_58051 ?auto_58054 ) ) ( not ( = ?auto_58051 ?auto_58055 ) ) ( not ( = ?auto_58051 ?auto_58056 ) ) ( not ( = ?auto_58052 ?auto_58053 ) ) ( not ( = ?auto_58052 ?auto_58054 ) ) ( not ( = ?auto_58052 ?auto_58055 ) ) ( not ( = ?auto_58052 ?auto_58056 ) ) ( not ( = ?auto_58053 ?auto_58054 ) ) ( not ( = ?auto_58053 ?auto_58055 ) ) ( not ( = ?auto_58053 ?auto_58056 ) ) ( not ( = ?auto_58054 ?auto_58055 ) ) ( not ( = ?auto_58054 ?auto_58056 ) ) ( not ( = ?auto_58055 ?auto_58056 ) ) ( ON ?auto_58056 ?auto_58057 ) ( not ( = ?auto_58051 ?auto_58057 ) ) ( not ( = ?auto_58052 ?auto_58057 ) ) ( not ( = ?auto_58053 ?auto_58057 ) ) ( not ( = ?auto_58054 ?auto_58057 ) ) ( not ( = ?auto_58055 ?auto_58057 ) ) ( not ( = ?auto_58056 ?auto_58057 ) ) ( ON ?auto_58055 ?auto_58056 ) ( ON-TABLE ?auto_58057 ) ( ON ?auto_58054 ?auto_58055 ) ( ON ?auto_58053 ?auto_58054 ) ( ON ?auto_58052 ?auto_58053 ) ( CLEAR ?auto_58052 ) ( HOLDING ?auto_58051 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58051 )
      ( MAKE-6PILE ?auto_58051 ?auto_58052 ?auto_58053 ?auto_58054 ?auto_58055 ?auto_58056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_58058 - BLOCK
      ?auto_58059 - BLOCK
      ?auto_58060 - BLOCK
      ?auto_58061 - BLOCK
      ?auto_58062 - BLOCK
      ?auto_58063 - BLOCK
    )
    :vars
    (
      ?auto_58064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58058 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58060 ) ) ( not ( = ?auto_58058 ?auto_58061 ) ) ( not ( = ?auto_58058 ?auto_58062 ) ) ( not ( = ?auto_58058 ?auto_58063 ) ) ( not ( = ?auto_58059 ?auto_58060 ) ) ( not ( = ?auto_58059 ?auto_58061 ) ) ( not ( = ?auto_58059 ?auto_58062 ) ) ( not ( = ?auto_58059 ?auto_58063 ) ) ( not ( = ?auto_58060 ?auto_58061 ) ) ( not ( = ?auto_58060 ?auto_58062 ) ) ( not ( = ?auto_58060 ?auto_58063 ) ) ( not ( = ?auto_58061 ?auto_58062 ) ) ( not ( = ?auto_58061 ?auto_58063 ) ) ( not ( = ?auto_58062 ?auto_58063 ) ) ( ON ?auto_58063 ?auto_58064 ) ( not ( = ?auto_58058 ?auto_58064 ) ) ( not ( = ?auto_58059 ?auto_58064 ) ) ( not ( = ?auto_58060 ?auto_58064 ) ) ( not ( = ?auto_58061 ?auto_58064 ) ) ( not ( = ?auto_58062 ?auto_58064 ) ) ( not ( = ?auto_58063 ?auto_58064 ) ) ( ON ?auto_58062 ?auto_58063 ) ( ON-TABLE ?auto_58064 ) ( ON ?auto_58061 ?auto_58062 ) ( ON ?auto_58060 ?auto_58061 ) ( ON ?auto_58059 ?auto_58060 ) ( ON ?auto_58058 ?auto_58059 ) ( CLEAR ?auto_58058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58064 ?auto_58063 ?auto_58062 ?auto_58061 ?auto_58060 ?auto_58059 )
      ( MAKE-6PILE ?auto_58058 ?auto_58059 ?auto_58060 ?auto_58061 ?auto_58062 ?auto_58063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58070 - BLOCK
      ?auto_58071 - BLOCK
      ?auto_58072 - BLOCK
      ?auto_58073 - BLOCK
      ?auto_58074 - BLOCK
    )
    :vars
    (
      ?auto_58075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58075 ?auto_58074 ) ( CLEAR ?auto_58075 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58070 ) ( ON ?auto_58071 ?auto_58070 ) ( ON ?auto_58072 ?auto_58071 ) ( ON ?auto_58073 ?auto_58072 ) ( ON ?auto_58074 ?auto_58073 ) ( not ( = ?auto_58070 ?auto_58071 ) ) ( not ( = ?auto_58070 ?auto_58072 ) ) ( not ( = ?auto_58070 ?auto_58073 ) ) ( not ( = ?auto_58070 ?auto_58074 ) ) ( not ( = ?auto_58070 ?auto_58075 ) ) ( not ( = ?auto_58071 ?auto_58072 ) ) ( not ( = ?auto_58071 ?auto_58073 ) ) ( not ( = ?auto_58071 ?auto_58074 ) ) ( not ( = ?auto_58071 ?auto_58075 ) ) ( not ( = ?auto_58072 ?auto_58073 ) ) ( not ( = ?auto_58072 ?auto_58074 ) ) ( not ( = ?auto_58072 ?auto_58075 ) ) ( not ( = ?auto_58073 ?auto_58074 ) ) ( not ( = ?auto_58073 ?auto_58075 ) ) ( not ( = ?auto_58074 ?auto_58075 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58075 ?auto_58074 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58089 - BLOCK
      ?auto_58090 - BLOCK
      ?auto_58091 - BLOCK
      ?auto_58092 - BLOCK
      ?auto_58093 - BLOCK
    )
    :vars
    (
      ?auto_58094 - BLOCK
      ?auto_58095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58089 ) ( ON ?auto_58090 ?auto_58089 ) ( ON ?auto_58091 ?auto_58090 ) ( ON ?auto_58092 ?auto_58091 ) ( not ( = ?auto_58089 ?auto_58090 ) ) ( not ( = ?auto_58089 ?auto_58091 ) ) ( not ( = ?auto_58089 ?auto_58092 ) ) ( not ( = ?auto_58089 ?auto_58093 ) ) ( not ( = ?auto_58089 ?auto_58094 ) ) ( not ( = ?auto_58090 ?auto_58091 ) ) ( not ( = ?auto_58090 ?auto_58092 ) ) ( not ( = ?auto_58090 ?auto_58093 ) ) ( not ( = ?auto_58090 ?auto_58094 ) ) ( not ( = ?auto_58091 ?auto_58092 ) ) ( not ( = ?auto_58091 ?auto_58093 ) ) ( not ( = ?auto_58091 ?auto_58094 ) ) ( not ( = ?auto_58092 ?auto_58093 ) ) ( not ( = ?auto_58092 ?auto_58094 ) ) ( not ( = ?auto_58093 ?auto_58094 ) ) ( ON ?auto_58094 ?auto_58095 ) ( CLEAR ?auto_58094 ) ( not ( = ?auto_58089 ?auto_58095 ) ) ( not ( = ?auto_58090 ?auto_58095 ) ) ( not ( = ?auto_58091 ?auto_58095 ) ) ( not ( = ?auto_58092 ?auto_58095 ) ) ( not ( = ?auto_58093 ?auto_58095 ) ) ( not ( = ?auto_58094 ?auto_58095 ) ) ( HOLDING ?auto_58093 ) ( CLEAR ?auto_58092 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58089 ?auto_58090 ?auto_58091 ?auto_58092 ?auto_58093 ?auto_58094 )
      ( MAKE-5PILE ?auto_58089 ?auto_58090 ?auto_58091 ?auto_58092 ?auto_58093 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58096 - BLOCK
      ?auto_58097 - BLOCK
      ?auto_58098 - BLOCK
      ?auto_58099 - BLOCK
      ?auto_58100 - BLOCK
    )
    :vars
    (
      ?auto_58102 - BLOCK
      ?auto_58101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58096 ) ( ON ?auto_58097 ?auto_58096 ) ( ON ?auto_58098 ?auto_58097 ) ( ON ?auto_58099 ?auto_58098 ) ( not ( = ?auto_58096 ?auto_58097 ) ) ( not ( = ?auto_58096 ?auto_58098 ) ) ( not ( = ?auto_58096 ?auto_58099 ) ) ( not ( = ?auto_58096 ?auto_58100 ) ) ( not ( = ?auto_58096 ?auto_58102 ) ) ( not ( = ?auto_58097 ?auto_58098 ) ) ( not ( = ?auto_58097 ?auto_58099 ) ) ( not ( = ?auto_58097 ?auto_58100 ) ) ( not ( = ?auto_58097 ?auto_58102 ) ) ( not ( = ?auto_58098 ?auto_58099 ) ) ( not ( = ?auto_58098 ?auto_58100 ) ) ( not ( = ?auto_58098 ?auto_58102 ) ) ( not ( = ?auto_58099 ?auto_58100 ) ) ( not ( = ?auto_58099 ?auto_58102 ) ) ( not ( = ?auto_58100 ?auto_58102 ) ) ( ON ?auto_58102 ?auto_58101 ) ( not ( = ?auto_58096 ?auto_58101 ) ) ( not ( = ?auto_58097 ?auto_58101 ) ) ( not ( = ?auto_58098 ?auto_58101 ) ) ( not ( = ?auto_58099 ?auto_58101 ) ) ( not ( = ?auto_58100 ?auto_58101 ) ) ( not ( = ?auto_58102 ?auto_58101 ) ) ( CLEAR ?auto_58099 ) ( ON ?auto_58100 ?auto_58102 ) ( CLEAR ?auto_58100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58101 ?auto_58102 )
      ( MAKE-5PILE ?auto_58096 ?auto_58097 ?auto_58098 ?auto_58099 ?auto_58100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58103 - BLOCK
      ?auto_58104 - BLOCK
      ?auto_58105 - BLOCK
      ?auto_58106 - BLOCK
      ?auto_58107 - BLOCK
    )
    :vars
    (
      ?auto_58109 - BLOCK
      ?auto_58108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58103 ) ( ON ?auto_58104 ?auto_58103 ) ( ON ?auto_58105 ?auto_58104 ) ( not ( = ?auto_58103 ?auto_58104 ) ) ( not ( = ?auto_58103 ?auto_58105 ) ) ( not ( = ?auto_58103 ?auto_58106 ) ) ( not ( = ?auto_58103 ?auto_58107 ) ) ( not ( = ?auto_58103 ?auto_58109 ) ) ( not ( = ?auto_58104 ?auto_58105 ) ) ( not ( = ?auto_58104 ?auto_58106 ) ) ( not ( = ?auto_58104 ?auto_58107 ) ) ( not ( = ?auto_58104 ?auto_58109 ) ) ( not ( = ?auto_58105 ?auto_58106 ) ) ( not ( = ?auto_58105 ?auto_58107 ) ) ( not ( = ?auto_58105 ?auto_58109 ) ) ( not ( = ?auto_58106 ?auto_58107 ) ) ( not ( = ?auto_58106 ?auto_58109 ) ) ( not ( = ?auto_58107 ?auto_58109 ) ) ( ON ?auto_58109 ?auto_58108 ) ( not ( = ?auto_58103 ?auto_58108 ) ) ( not ( = ?auto_58104 ?auto_58108 ) ) ( not ( = ?auto_58105 ?auto_58108 ) ) ( not ( = ?auto_58106 ?auto_58108 ) ) ( not ( = ?auto_58107 ?auto_58108 ) ) ( not ( = ?auto_58109 ?auto_58108 ) ) ( ON ?auto_58107 ?auto_58109 ) ( CLEAR ?auto_58107 ) ( ON-TABLE ?auto_58108 ) ( HOLDING ?auto_58106 ) ( CLEAR ?auto_58105 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58103 ?auto_58104 ?auto_58105 ?auto_58106 )
      ( MAKE-5PILE ?auto_58103 ?auto_58104 ?auto_58105 ?auto_58106 ?auto_58107 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58110 - BLOCK
      ?auto_58111 - BLOCK
      ?auto_58112 - BLOCK
      ?auto_58113 - BLOCK
      ?auto_58114 - BLOCK
    )
    :vars
    (
      ?auto_58116 - BLOCK
      ?auto_58115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58110 ) ( ON ?auto_58111 ?auto_58110 ) ( ON ?auto_58112 ?auto_58111 ) ( not ( = ?auto_58110 ?auto_58111 ) ) ( not ( = ?auto_58110 ?auto_58112 ) ) ( not ( = ?auto_58110 ?auto_58113 ) ) ( not ( = ?auto_58110 ?auto_58114 ) ) ( not ( = ?auto_58110 ?auto_58116 ) ) ( not ( = ?auto_58111 ?auto_58112 ) ) ( not ( = ?auto_58111 ?auto_58113 ) ) ( not ( = ?auto_58111 ?auto_58114 ) ) ( not ( = ?auto_58111 ?auto_58116 ) ) ( not ( = ?auto_58112 ?auto_58113 ) ) ( not ( = ?auto_58112 ?auto_58114 ) ) ( not ( = ?auto_58112 ?auto_58116 ) ) ( not ( = ?auto_58113 ?auto_58114 ) ) ( not ( = ?auto_58113 ?auto_58116 ) ) ( not ( = ?auto_58114 ?auto_58116 ) ) ( ON ?auto_58116 ?auto_58115 ) ( not ( = ?auto_58110 ?auto_58115 ) ) ( not ( = ?auto_58111 ?auto_58115 ) ) ( not ( = ?auto_58112 ?auto_58115 ) ) ( not ( = ?auto_58113 ?auto_58115 ) ) ( not ( = ?auto_58114 ?auto_58115 ) ) ( not ( = ?auto_58116 ?auto_58115 ) ) ( ON ?auto_58114 ?auto_58116 ) ( ON-TABLE ?auto_58115 ) ( CLEAR ?auto_58112 ) ( ON ?auto_58113 ?auto_58114 ) ( CLEAR ?auto_58113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58115 ?auto_58116 ?auto_58114 )
      ( MAKE-5PILE ?auto_58110 ?auto_58111 ?auto_58112 ?auto_58113 ?auto_58114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58117 - BLOCK
      ?auto_58118 - BLOCK
      ?auto_58119 - BLOCK
      ?auto_58120 - BLOCK
      ?auto_58121 - BLOCK
    )
    :vars
    (
      ?auto_58123 - BLOCK
      ?auto_58122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58117 ) ( ON ?auto_58118 ?auto_58117 ) ( not ( = ?auto_58117 ?auto_58118 ) ) ( not ( = ?auto_58117 ?auto_58119 ) ) ( not ( = ?auto_58117 ?auto_58120 ) ) ( not ( = ?auto_58117 ?auto_58121 ) ) ( not ( = ?auto_58117 ?auto_58123 ) ) ( not ( = ?auto_58118 ?auto_58119 ) ) ( not ( = ?auto_58118 ?auto_58120 ) ) ( not ( = ?auto_58118 ?auto_58121 ) ) ( not ( = ?auto_58118 ?auto_58123 ) ) ( not ( = ?auto_58119 ?auto_58120 ) ) ( not ( = ?auto_58119 ?auto_58121 ) ) ( not ( = ?auto_58119 ?auto_58123 ) ) ( not ( = ?auto_58120 ?auto_58121 ) ) ( not ( = ?auto_58120 ?auto_58123 ) ) ( not ( = ?auto_58121 ?auto_58123 ) ) ( ON ?auto_58123 ?auto_58122 ) ( not ( = ?auto_58117 ?auto_58122 ) ) ( not ( = ?auto_58118 ?auto_58122 ) ) ( not ( = ?auto_58119 ?auto_58122 ) ) ( not ( = ?auto_58120 ?auto_58122 ) ) ( not ( = ?auto_58121 ?auto_58122 ) ) ( not ( = ?auto_58123 ?auto_58122 ) ) ( ON ?auto_58121 ?auto_58123 ) ( ON-TABLE ?auto_58122 ) ( ON ?auto_58120 ?auto_58121 ) ( CLEAR ?auto_58120 ) ( HOLDING ?auto_58119 ) ( CLEAR ?auto_58118 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58117 ?auto_58118 ?auto_58119 )
      ( MAKE-5PILE ?auto_58117 ?auto_58118 ?auto_58119 ?auto_58120 ?auto_58121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58124 - BLOCK
      ?auto_58125 - BLOCK
      ?auto_58126 - BLOCK
      ?auto_58127 - BLOCK
      ?auto_58128 - BLOCK
    )
    :vars
    (
      ?auto_58130 - BLOCK
      ?auto_58129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58124 ) ( ON ?auto_58125 ?auto_58124 ) ( not ( = ?auto_58124 ?auto_58125 ) ) ( not ( = ?auto_58124 ?auto_58126 ) ) ( not ( = ?auto_58124 ?auto_58127 ) ) ( not ( = ?auto_58124 ?auto_58128 ) ) ( not ( = ?auto_58124 ?auto_58130 ) ) ( not ( = ?auto_58125 ?auto_58126 ) ) ( not ( = ?auto_58125 ?auto_58127 ) ) ( not ( = ?auto_58125 ?auto_58128 ) ) ( not ( = ?auto_58125 ?auto_58130 ) ) ( not ( = ?auto_58126 ?auto_58127 ) ) ( not ( = ?auto_58126 ?auto_58128 ) ) ( not ( = ?auto_58126 ?auto_58130 ) ) ( not ( = ?auto_58127 ?auto_58128 ) ) ( not ( = ?auto_58127 ?auto_58130 ) ) ( not ( = ?auto_58128 ?auto_58130 ) ) ( ON ?auto_58130 ?auto_58129 ) ( not ( = ?auto_58124 ?auto_58129 ) ) ( not ( = ?auto_58125 ?auto_58129 ) ) ( not ( = ?auto_58126 ?auto_58129 ) ) ( not ( = ?auto_58127 ?auto_58129 ) ) ( not ( = ?auto_58128 ?auto_58129 ) ) ( not ( = ?auto_58130 ?auto_58129 ) ) ( ON ?auto_58128 ?auto_58130 ) ( ON-TABLE ?auto_58129 ) ( ON ?auto_58127 ?auto_58128 ) ( CLEAR ?auto_58125 ) ( ON ?auto_58126 ?auto_58127 ) ( CLEAR ?auto_58126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58129 ?auto_58130 ?auto_58128 ?auto_58127 )
      ( MAKE-5PILE ?auto_58124 ?auto_58125 ?auto_58126 ?auto_58127 ?auto_58128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58131 - BLOCK
      ?auto_58132 - BLOCK
      ?auto_58133 - BLOCK
      ?auto_58134 - BLOCK
      ?auto_58135 - BLOCK
    )
    :vars
    (
      ?auto_58136 - BLOCK
      ?auto_58137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58131 ) ( not ( = ?auto_58131 ?auto_58132 ) ) ( not ( = ?auto_58131 ?auto_58133 ) ) ( not ( = ?auto_58131 ?auto_58134 ) ) ( not ( = ?auto_58131 ?auto_58135 ) ) ( not ( = ?auto_58131 ?auto_58136 ) ) ( not ( = ?auto_58132 ?auto_58133 ) ) ( not ( = ?auto_58132 ?auto_58134 ) ) ( not ( = ?auto_58132 ?auto_58135 ) ) ( not ( = ?auto_58132 ?auto_58136 ) ) ( not ( = ?auto_58133 ?auto_58134 ) ) ( not ( = ?auto_58133 ?auto_58135 ) ) ( not ( = ?auto_58133 ?auto_58136 ) ) ( not ( = ?auto_58134 ?auto_58135 ) ) ( not ( = ?auto_58134 ?auto_58136 ) ) ( not ( = ?auto_58135 ?auto_58136 ) ) ( ON ?auto_58136 ?auto_58137 ) ( not ( = ?auto_58131 ?auto_58137 ) ) ( not ( = ?auto_58132 ?auto_58137 ) ) ( not ( = ?auto_58133 ?auto_58137 ) ) ( not ( = ?auto_58134 ?auto_58137 ) ) ( not ( = ?auto_58135 ?auto_58137 ) ) ( not ( = ?auto_58136 ?auto_58137 ) ) ( ON ?auto_58135 ?auto_58136 ) ( ON-TABLE ?auto_58137 ) ( ON ?auto_58134 ?auto_58135 ) ( ON ?auto_58133 ?auto_58134 ) ( CLEAR ?auto_58133 ) ( HOLDING ?auto_58132 ) ( CLEAR ?auto_58131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58131 ?auto_58132 )
      ( MAKE-5PILE ?auto_58131 ?auto_58132 ?auto_58133 ?auto_58134 ?auto_58135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58138 - BLOCK
      ?auto_58139 - BLOCK
      ?auto_58140 - BLOCK
      ?auto_58141 - BLOCK
      ?auto_58142 - BLOCK
    )
    :vars
    (
      ?auto_58144 - BLOCK
      ?auto_58143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58138 ) ( not ( = ?auto_58138 ?auto_58139 ) ) ( not ( = ?auto_58138 ?auto_58140 ) ) ( not ( = ?auto_58138 ?auto_58141 ) ) ( not ( = ?auto_58138 ?auto_58142 ) ) ( not ( = ?auto_58138 ?auto_58144 ) ) ( not ( = ?auto_58139 ?auto_58140 ) ) ( not ( = ?auto_58139 ?auto_58141 ) ) ( not ( = ?auto_58139 ?auto_58142 ) ) ( not ( = ?auto_58139 ?auto_58144 ) ) ( not ( = ?auto_58140 ?auto_58141 ) ) ( not ( = ?auto_58140 ?auto_58142 ) ) ( not ( = ?auto_58140 ?auto_58144 ) ) ( not ( = ?auto_58141 ?auto_58142 ) ) ( not ( = ?auto_58141 ?auto_58144 ) ) ( not ( = ?auto_58142 ?auto_58144 ) ) ( ON ?auto_58144 ?auto_58143 ) ( not ( = ?auto_58138 ?auto_58143 ) ) ( not ( = ?auto_58139 ?auto_58143 ) ) ( not ( = ?auto_58140 ?auto_58143 ) ) ( not ( = ?auto_58141 ?auto_58143 ) ) ( not ( = ?auto_58142 ?auto_58143 ) ) ( not ( = ?auto_58144 ?auto_58143 ) ) ( ON ?auto_58142 ?auto_58144 ) ( ON-TABLE ?auto_58143 ) ( ON ?auto_58141 ?auto_58142 ) ( ON ?auto_58140 ?auto_58141 ) ( CLEAR ?auto_58138 ) ( ON ?auto_58139 ?auto_58140 ) ( CLEAR ?auto_58139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58143 ?auto_58144 ?auto_58142 ?auto_58141 ?auto_58140 )
      ( MAKE-5PILE ?auto_58138 ?auto_58139 ?auto_58140 ?auto_58141 ?auto_58142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58145 - BLOCK
      ?auto_58146 - BLOCK
      ?auto_58147 - BLOCK
      ?auto_58148 - BLOCK
      ?auto_58149 - BLOCK
    )
    :vars
    (
      ?auto_58151 - BLOCK
      ?auto_58150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58145 ?auto_58146 ) ) ( not ( = ?auto_58145 ?auto_58147 ) ) ( not ( = ?auto_58145 ?auto_58148 ) ) ( not ( = ?auto_58145 ?auto_58149 ) ) ( not ( = ?auto_58145 ?auto_58151 ) ) ( not ( = ?auto_58146 ?auto_58147 ) ) ( not ( = ?auto_58146 ?auto_58148 ) ) ( not ( = ?auto_58146 ?auto_58149 ) ) ( not ( = ?auto_58146 ?auto_58151 ) ) ( not ( = ?auto_58147 ?auto_58148 ) ) ( not ( = ?auto_58147 ?auto_58149 ) ) ( not ( = ?auto_58147 ?auto_58151 ) ) ( not ( = ?auto_58148 ?auto_58149 ) ) ( not ( = ?auto_58148 ?auto_58151 ) ) ( not ( = ?auto_58149 ?auto_58151 ) ) ( ON ?auto_58151 ?auto_58150 ) ( not ( = ?auto_58145 ?auto_58150 ) ) ( not ( = ?auto_58146 ?auto_58150 ) ) ( not ( = ?auto_58147 ?auto_58150 ) ) ( not ( = ?auto_58148 ?auto_58150 ) ) ( not ( = ?auto_58149 ?auto_58150 ) ) ( not ( = ?auto_58151 ?auto_58150 ) ) ( ON ?auto_58149 ?auto_58151 ) ( ON-TABLE ?auto_58150 ) ( ON ?auto_58148 ?auto_58149 ) ( ON ?auto_58147 ?auto_58148 ) ( ON ?auto_58146 ?auto_58147 ) ( CLEAR ?auto_58146 ) ( HOLDING ?auto_58145 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58145 )
      ( MAKE-5PILE ?auto_58145 ?auto_58146 ?auto_58147 ?auto_58148 ?auto_58149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_58152 - BLOCK
      ?auto_58153 - BLOCK
      ?auto_58154 - BLOCK
      ?auto_58155 - BLOCK
      ?auto_58156 - BLOCK
    )
    :vars
    (
      ?auto_58157 - BLOCK
      ?auto_58158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58152 ?auto_58153 ) ) ( not ( = ?auto_58152 ?auto_58154 ) ) ( not ( = ?auto_58152 ?auto_58155 ) ) ( not ( = ?auto_58152 ?auto_58156 ) ) ( not ( = ?auto_58152 ?auto_58157 ) ) ( not ( = ?auto_58153 ?auto_58154 ) ) ( not ( = ?auto_58153 ?auto_58155 ) ) ( not ( = ?auto_58153 ?auto_58156 ) ) ( not ( = ?auto_58153 ?auto_58157 ) ) ( not ( = ?auto_58154 ?auto_58155 ) ) ( not ( = ?auto_58154 ?auto_58156 ) ) ( not ( = ?auto_58154 ?auto_58157 ) ) ( not ( = ?auto_58155 ?auto_58156 ) ) ( not ( = ?auto_58155 ?auto_58157 ) ) ( not ( = ?auto_58156 ?auto_58157 ) ) ( ON ?auto_58157 ?auto_58158 ) ( not ( = ?auto_58152 ?auto_58158 ) ) ( not ( = ?auto_58153 ?auto_58158 ) ) ( not ( = ?auto_58154 ?auto_58158 ) ) ( not ( = ?auto_58155 ?auto_58158 ) ) ( not ( = ?auto_58156 ?auto_58158 ) ) ( not ( = ?auto_58157 ?auto_58158 ) ) ( ON ?auto_58156 ?auto_58157 ) ( ON-TABLE ?auto_58158 ) ( ON ?auto_58155 ?auto_58156 ) ( ON ?auto_58154 ?auto_58155 ) ( ON ?auto_58153 ?auto_58154 ) ( ON ?auto_58152 ?auto_58153 ) ( CLEAR ?auto_58152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58158 ?auto_58157 ?auto_58156 ?auto_58155 ?auto_58154 ?auto_58153 )
      ( MAKE-5PILE ?auto_58152 ?auto_58153 ?auto_58154 ?auto_58155 ?auto_58156 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58160 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58160 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_58160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58161 - BLOCK
    )
    :vars
    (
      ?auto_58162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58161 ?auto_58162 ) ( CLEAR ?auto_58161 ) ( HAND-EMPTY ) ( not ( = ?auto_58161 ?auto_58162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58161 ?auto_58162 )
      ( MAKE-1PILE ?auto_58161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58163 - BLOCK
    )
    :vars
    (
      ?auto_58164 - BLOCK
      ?auto_58167 - BLOCK
      ?auto_58168 - BLOCK
      ?auto_58165 - BLOCK
      ?auto_58166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58163 ?auto_58164 ) ) ( HOLDING ?auto_58163 ) ( CLEAR ?auto_58164 ) ( ON-TABLE ?auto_58167 ) ( ON ?auto_58168 ?auto_58167 ) ( ON ?auto_58165 ?auto_58168 ) ( ON ?auto_58166 ?auto_58165 ) ( ON ?auto_58164 ?auto_58166 ) ( not ( = ?auto_58167 ?auto_58168 ) ) ( not ( = ?auto_58167 ?auto_58165 ) ) ( not ( = ?auto_58167 ?auto_58166 ) ) ( not ( = ?auto_58167 ?auto_58164 ) ) ( not ( = ?auto_58167 ?auto_58163 ) ) ( not ( = ?auto_58168 ?auto_58165 ) ) ( not ( = ?auto_58168 ?auto_58166 ) ) ( not ( = ?auto_58168 ?auto_58164 ) ) ( not ( = ?auto_58168 ?auto_58163 ) ) ( not ( = ?auto_58165 ?auto_58166 ) ) ( not ( = ?auto_58165 ?auto_58164 ) ) ( not ( = ?auto_58165 ?auto_58163 ) ) ( not ( = ?auto_58166 ?auto_58164 ) ) ( not ( = ?auto_58166 ?auto_58163 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58167 ?auto_58168 ?auto_58165 ?auto_58166 ?auto_58164 ?auto_58163 )
      ( MAKE-1PILE ?auto_58163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58169 - BLOCK
    )
    :vars
    (
      ?auto_58171 - BLOCK
      ?auto_58170 - BLOCK
      ?auto_58174 - BLOCK
      ?auto_58172 - BLOCK
      ?auto_58173 - BLOCK
      ?auto_58175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58169 ?auto_58171 ) ) ( CLEAR ?auto_58171 ) ( ON-TABLE ?auto_58170 ) ( ON ?auto_58174 ?auto_58170 ) ( ON ?auto_58172 ?auto_58174 ) ( ON ?auto_58173 ?auto_58172 ) ( ON ?auto_58171 ?auto_58173 ) ( not ( = ?auto_58170 ?auto_58174 ) ) ( not ( = ?auto_58170 ?auto_58172 ) ) ( not ( = ?auto_58170 ?auto_58173 ) ) ( not ( = ?auto_58170 ?auto_58171 ) ) ( not ( = ?auto_58170 ?auto_58169 ) ) ( not ( = ?auto_58174 ?auto_58172 ) ) ( not ( = ?auto_58174 ?auto_58173 ) ) ( not ( = ?auto_58174 ?auto_58171 ) ) ( not ( = ?auto_58174 ?auto_58169 ) ) ( not ( = ?auto_58172 ?auto_58173 ) ) ( not ( = ?auto_58172 ?auto_58171 ) ) ( not ( = ?auto_58172 ?auto_58169 ) ) ( not ( = ?auto_58173 ?auto_58171 ) ) ( not ( = ?auto_58173 ?auto_58169 ) ) ( ON ?auto_58169 ?auto_58175 ) ( CLEAR ?auto_58169 ) ( HAND-EMPTY ) ( not ( = ?auto_58169 ?auto_58175 ) ) ( not ( = ?auto_58171 ?auto_58175 ) ) ( not ( = ?auto_58170 ?auto_58175 ) ) ( not ( = ?auto_58174 ?auto_58175 ) ) ( not ( = ?auto_58172 ?auto_58175 ) ) ( not ( = ?auto_58173 ?auto_58175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58169 ?auto_58175 )
      ( MAKE-1PILE ?auto_58169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58176 - BLOCK
    )
    :vars
    (
      ?auto_58177 - BLOCK
      ?auto_58178 - BLOCK
      ?auto_58180 - BLOCK
      ?auto_58182 - BLOCK
      ?auto_58181 - BLOCK
      ?auto_58179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58176 ?auto_58177 ) ) ( ON-TABLE ?auto_58178 ) ( ON ?auto_58180 ?auto_58178 ) ( ON ?auto_58182 ?auto_58180 ) ( ON ?auto_58181 ?auto_58182 ) ( not ( = ?auto_58178 ?auto_58180 ) ) ( not ( = ?auto_58178 ?auto_58182 ) ) ( not ( = ?auto_58178 ?auto_58181 ) ) ( not ( = ?auto_58178 ?auto_58177 ) ) ( not ( = ?auto_58178 ?auto_58176 ) ) ( not ( = ?auto_58180 ?auto_58182 ) ) ( not ( = ?auto_58180 ?auto_58181 ) ) ( not ( = ?auto_58180 ?auto_58177 ) ) ( not ( = ?auto_58180 ?auto_58176 ) ) ( not ( = ?auto_58182 ?auto_58181 ) ) ( not ( = ?auto_58182 ?auto_58177 ) ) ( not ( = ?auto_58182 ?auto_58176 ) ) ( not ( = ?auto_58181 ?auto_58177 ) ) ( not ( = ?auto_58181 ?auto_58176 ) ) ( ON ?auto_58176 ?auto_58179 ) ( CLEAR ?auto_58176 ) ( not ( = ?auto_58176 ?auto_58179 ) ) ( not ( = ?auto_58177 ?auto_58179 ) ) ( not ( = ?auto_58178 ?auto_58179 ) ) ( not ( = ?auto_58180 ?auto_58179 ) ) ( not ( = ?auto_58182 ?auto_58179 ) ) ( not ( = ?auto_58181 ?auto_58179 ) ) ( HOLDING ?auto_58177 ) ( CLEAR ?auto_58181 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58178 ?auto_58180 ?auto_58182 ?auto_58181 ?auto_58177 )
      ( MAKE-1PILE ?auto_58176 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58183 - BLOCK
    )
    :vars
    (
      ?auto_58187 - BLOCK
      ?auto_58186 - BLOCK
      ?auto_58188 - BLOCK
      ?auto_58184 - BLOCK
      ?auto_58185 - BLOCK
      ?auto_58189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58183 ?auto_58187 ) ) ( ON-TABLE ?auto_58186 ) ( ON ?auto_58188 ?auto_58186 ) ( ON ?auto_58184 ?auto_58188 ) ( ON ?auto_58185 ?auto_58184 ) ( not ( = ?auto_58186 ?auto_58188 ) ) ( not ( = ?auto_58186 ?auto_58184 ) ) ( not ( = ?auto_58186 ?auto_58185 ) ) ( not ( = ?auto_58186 ?auto_58187 ) ) ( not ( = ?auto_58186 ?auto_58183 ) ) ( not ( = ?auto_58188 ?auto_58184 ) ) ( not ( = ?auto_58188 ?auto_58185 ) ) ( not ( = ?auto_58188 ?auto_58187 ) ) ( not ( = ?auto_58188 ?auto_58183 ) ) ( not ( = ?auto_58184 ?auto_58185 ) ) ( not ( = ?auto_58184 ?auto_58187 ) ) ( not ( = ?auto_58184 ?auto_58183 ) ) ( not ( = ?auto_58185 ?auto_58187 ) ) ( not ( = ?auto_58185 ?auto_58183 ) ) ( ON ?auto_58183 ?auto_58189 ) ( not ( = ?auto_58183 ?auto_58189 ) ) ( not ( = ?auto_58187 ?auto_58189 ) ) ( not ( = ?auto_58186 ?auto_58189 ) ) ( not ( = ?auto_58188 ?auto_58189 ) ) ( not ( = ?auto_58184 ?auto_58189 ) ) ( not ( = ?auto_58185 ?auto_58189 ) ) ( CLEAR ?auto_58185 ) ( ON ?auto_58187 ?auto_58183 ) ( CLEAR ?auto_58187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58189 ?auto_58183 )
      ( MAKE-1PILE ?auto_58183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58190 - BLOCK
    )
    :vars
    (
      ?auto_58192 - BLOCK
      ?auto_58191 - BLOCK
      ?auto_58193 - BLOCK
      ?auto_58194 - BLOCK
      ?auto_58195 - BLOCK
      ?auto_58196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58190 ?auto_58192 ) ) ( ON-TABLE ?auto_58191 ) ( ON ?auto_58193 ?auto_58191 ) ( ON ?auto_58194 ?auto_58193 ) ( not ( = ?auto_58191 ?auto_58193 ) ) ( not ( = ?auto_58191 ?auto_58194 ) ) ( not ( = ?auto_58191 ?auto_58195 ) ) ( not ( = ?auto_58191 ?auto_58192 ) ) ( not ( = ?auto_58191 ?auto_58190 ) ) ( not ( = ?auto_58193 ?auto_58194 ) ) ( not ( = ?auto_58193 ?auto_58195 ) ) ( not ( = ?auto_58193 ?auto_58192 ) ) ( not ( = ?auto_58193 ?auto_58190 ) ) ( not ( = ?auto_58194 ?auto_58195 ) ) ( not ( = ?auto_58194 ?auto_58192 ) ) ( not ( = ?auto_58194 ?auto_58190 ) ) ( not ( = ?auto_58195 ?auto_58192 ) ) ( not ( = ?auto_58195 ?auto_58190 ) ) ( ON ?auto_58190 ?auto_58196 ) ( not ( = ?auto_58190 ?auto_58196 ) ) ( not ( = ?auto_58192 ?auto_58196 ) ) ( not ( = ?auto_58191 ?auto_58196 ) ) ( not ( = ?auto_58193 ?auto_58196 ) ) ( not ( = ?auto_58194 ?auto_58196 ) ) ( not ( = ?auto_58195 ?auto_58196 ) ) ( ON ?auto_58192 ?auto_58190 ) ( CLEAR ?auto_58192 ) ( ON-TABLE ?auto_58196 ) ( HOLDING ?auto_58195 ) ( CLEAR ?auto_58194 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58191 ?auto_58193 ?auto_58194 ?auto_58195 )
      ( MAKE-1PILE ?auto_58190 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58197 - BLOCK
    )
    :vars
    (
      ?auto_58199 - BLOCK
      ?auto_58202 - BLOCK
      ?auto_58198 - BLOCK
      ?auto_58201 - BLOCK
      ?auto_58200 - BLOCK
      ?auto_58203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58197 ?auto_58199 ) ) ( ON-TABLE ?auto_58202 ) ( ON ?auto_58198 ?auto_58202 ) ( ON ?auto_58201 ?auto_58198 ) ( not ( = ?auto_58202 ?auto_58198 ) ) ( not ( = ?auto_58202 ?auto_58201 ) ) ( not ( = ?auto_58202 ?auto_58200 ) ) ( not ( = ?auto_58202 ?auto_58199 ) ) ( not ( = ?auto_58202 ?auto_58197 ) ) ( not ( = ?auto_58198 ?auto_58201 ) ) ( not ( = ?auto_58198 ?auto_58200 ) ) ( not ( = ?auto_58198 ?auto_58199 ) ) ( not ( = ?auto_58198 ?auto_58197 ) ) ( not ( = ?auto_58201 ?auto_58200 ) ) ( not ( = ?auto_58201 ?auto_58199 ) ) ( not ( = ?auto_58201 ?auto_58197 ) ) ( not ( = ?auto_58200 ?auto_58199 ) ) ( not ( = ?auto_58200 ?auto_58197 ) ) ( ON ?auto_58197 ?auto_58203 ) ( not ( = ?auto_58197 ?auto_58203 ) ) ( not ( = ?auto_58199 ?auto_58203 ) ) ( not ( = ?auto_58202 ?auto_58203 ) ) ( not ( = ?auto_58198 ?auto_58203 ) ) ( not ( = ?auto_58201 ?auto_58203 ) ) ( not ( = ?auto_58200 ?auto_58203 ) ) ( ON ?auto_58199 ?auto_58197 ) ( ON-TABLE ?auto_58203 ) ( CLEAR ?auto_58201 ) ( ON ?auto_58200 ?auto_58199 ) ( CLEAR ?auto_58200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58203 ?auto_58197 ?auto_58199 )
      ( MAKE-1PILE ?auto_58197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58204 - BLOCK
    )
    :vars
    (
      ?auto_58205 - BLOCK
      ?auto_58207 - BLOCK
      ?auto_58209 - BLOCK
      ?auto_58210 - BLOCK
      ?auto_58206 - BLOCK
      ?auto_58208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58204 ?auto_58205 ) ) ( ON-TABLE ?auto_58207 ) ( ON ?auto_58209 ?auto_58207 ) ( not ( = ?auto_58207 ?auto_58209 ) ) ( not ( = ?auto_58207 ?auto_58210 ) ) ( not ( = ?auto_58207 ?auto_58206 ) ) ( not ( = ?auto_58207 ?auto_58205 ) ) ( not ( = ?auto_58207 ?auto_58204 ) ) ( not ( = ?auto_58209 ?auto_58210 ) ) ( not ( = ?auto_58209 ?auto_58206 ) ) ( not ( = ?auto_58209 ?auto_58205 ) ) ( not ( = ?auto_58209 ?auto_58204 ) ) ( not ( = ?auto_58210 ?auto_58206 ) ) ( not ( = ?auto_58210 ?auto_58205 ) ) ( not ( = ?auto_58210 ?auto_58204 ) ) ( not ( = ?auto_58206 ?auto_58205 ) ) ( not ( = ?auto_58206 ?auto_58204 ) ) ( ON ?auto_58204 ?auto_58208 ) ( not ( = ?auto_58204 ?auto_58208 ) ) ( not ( = ?auto_58205 ?auto_58208 ) ) ( not ( = ?auto_58207 ?auto_58208 ) ) ( not ( = ?auto_58209 ?auto_58208 ) ) ( not ( = ?auto_58210 ?auto_58208 ) ) ( not ( = ?auto_58206 ?auto_58208 ) ) ( ON ?auto_58205 ?auto_58204 ) ( ON-TABLE ?auto_58208 ) ( ON ?auto_58206 ?auto_58205 ) ( CLEAR ?auto_58206 ) ( HOLDING ?auto_58210 ) ( CLEAR ?auto_58209 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58207 ?auto_58209 ?auto_58210 )
      ( MAKE-1PILE ?auto_58204 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58211 - BLOCK
    )
    :vars
    (
      ?auto_58212 - BLOCK
      ?auto_58217 - BLOCK
      ?auto_58216 - BLOCK
      ?auto_58215 - BLOCK
      ?auto_58214 - BLOCK
      ?auto_58213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58211 ?auto_58212 ) ) ( ON-TABLE ?auto_58217 ) ( ON ?auto_58216 ?auto_58217 ) ( not ( = ?auto_58217 ?auto_58216 ) ) ( not ( = ?auto_58217 ?auto_58215 ) ) ( not ( = ?auto_58217 ?auto_58214 ) ) ( not ( = ?auto_58217 ?auto_58212 ) ) ( not ( = ?auto_58217 ?auto_58211 ) ) ( not ( = ?auto_58216 ?auto_58215 ) ) ( not ( = ?auto_58216 ?auto_58214 ) ) ( not ( = ?auto_58216 ?auto_58212 ) ) ( not ( = ?auto_58216 ?auto_58211 ) ) ( not ( = ?auto_58215 ?auto_58214 ) ) ( not ( = ?auto_58215 ?auto_58212 ) ) ( not ( = ?auto_58215 ?auto_58211 ) ) ( not ( = ?auto_58214 ?auto_58212 ) ) ( not ( = ?auto_58214 ?auto_58211 ) ) ( ON ?auto_58211 ?auto_58213 ) ( not ( = ?auto_58211 ?auto_58213 ) ) ( not ( = ?auto_58212 ?auto_58213 ) ) ( not ( = ?auto_58217 ?auto_58213 ) ) ( not ( = ?auto_58216 ?auto_58213 ) ) ( not ( = ?auto_58215 ?auto_58213 ) ) ( not ( = ?auto_58214 ?auto_58213 ) ) ( ON ?auto_58212 ?auto_58211 ) ( ON-TABLE ?auto_58213 ) ( ON ?auto_58214 ?auto_58212 ) ( CLEAR ?auto_58216 ) ( ON ?auto_58215 ?auto_58214 ) ( CLEAR ?auto_58215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58213 ?auto_58211 ?auto_58212 ?auto_58214 )
      ( MAKE-1PILE ?auto_58211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58218 - BLOCK
    )
    :vars
    (
      ?auto_58224 - BLOCK
      ?auto_58222 - BLOCK
      ?auto_58219 - BLOCK
      ?auto_58223 - BLOCK
      ?auto_58221 - BLOCK
      ?auto_58220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58218 ?auto_58224 ) ) ( ON-TABLE ?auto_58222 ) ( not ( = ?auto_58222 ?auto_58219 ) ) ( not ( = ?auto_58222 ?auto_58223 ) ) ( not ( = ?auto_58222 ?auto_58221 ) ) ( not ( = ?auto_58222 ?auto_58224 ) ) ( not ( = ?auto_58222 ?auto_58218 ) ) ( not ( = ?auto_58219 ?auto_58223 ) ) ( not ( = ?auto_58219 ?auto_58221 ) ) ( not ( = ?auto_58219 ?auto_58224 ) ) ( not ( = ?auto_58219 ?auto_58218 ) ) ( not ( = ?auto_58223 ?auto_58221 ) ) ( not ( = ?auto_58223 ?auto_58224 ) ) ( not ( = ?auto_58223 ?auto_58218 ) ) ( not ( = ?auto_58221 ?auto_58224 ) ) ( not ( = ?auto_58221 ?auto_58218 ) ) ( ON ?auto_58218 ?auto_58220 ) ( not ( = ?auto_58218 ?auto_58220 ) ) ( not ( = ?auto_58224 ?auto_58220 ) ) ( not ( = ?auto_58222 ?auto_58220 ) ) ( not ( = ?auto_58219 ?auto_58220 ) ) ( not ( = ?auto_58223 ?auto_58220 ) ) ( not ( = ?auto_58221 ?auto_58220 ) ) ( ON ?auto_58224 ?auto_58218 ) ( ON-TABLE ?auto_58220 ) ( ON ?auto_58221 ?auto_58224 ) ( ON ?auto_58223 ?auto_58221 ) ( CLEAR ?auto_58223 ) ( HOLDING ?auto_58219 ) ( CLEAR ?auto_58222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58222 ?auto_58219 )
      ( MAKE-1PILE ?auto_58218 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58225 - BLOCK
    )
    :vars
    (
      ?auto_58227 - BLOCK
      ?auto_58231 - BLOCK
      ?auto_58229 - BLOCK
      ?auto_58226 - BLOCK
      ?auto_58230 - BLOCK
      ?auto_58228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58225 ?auto_58227 ) ) ( ON-TABLE ?auto_58231 ) ( not ( = ?auto_58231 ?auto_58229 ) ) ( not ( = ?auto_58231 ?auto_58226 ) ) ( not ( = ?auto_58231 ?auto_58230 ) ) ( not ( = ?auto_58231 ?auto_58227 ) ) ( not ( = ?auto_58231 ?auto_58225 ) ) ( not ( = ?auto_58229 ?auto_58226 ) ) ( not ( = ?auto_58229 ?auto_58230 ) ) ( not ( = ?auto_58229 ?auto_58227 ) ) ( not ( = ?auto_58229 ?auto_58225 ) ) ( not ( = ?auto_58226 ?auto_58230 ) ) ( not ( = ?auto_58226 ?auto_58227 ) ) ( not ( = ?auto_58226 ?auto_58225 ) ) ( not ( = ?auto_58230 ?auto_58227 ) ) ( not ( = ?auto_58230 ?auto_58225 ) ) ( ON ?auto_58225 ?auto_58228 ) ( not ( = ?auto_58225 ?auto_58228 ) ) ( not ( = ?auto_58227 ?auto_58228 ) ) ( not ( = ?auto_58231 ?auto_58228 ) ) ( not ( = ?auto_58229 ?auto_58228 ) ) ( not ( = ?auto_58226 ?auto_58228 ) ) ( not ( = ?auto_58230 ?auto_58228 ) ) ( ON ?auto_58227 ?auto_58225 ) ( ON-TABLE ?auto_58228 ) ( ON ?auto_58230 ?auto_58227 ) ( ON ?auto_58226 ?auto_58230 ) ( CLEAR ?auto_58231 ) ( ON ?auto_58229 ?auto_58226 ) ( CLEAR ?auto_58229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58228 ?auto_58225 ?auto_58227 ?auto_58230 ?auto_58226 )
      ( MAKE-1PILE ?auto_58225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58232 - BLOCK
    )
    :vars
    (
      ?auto_58233 - BLOCK
      ?auto_58237 - BLOCK
      ?auto_58234 - BLOCK
      ?auto_58238 - BLOCK
      ?auto_58236 - BLOCK
      ?auto_58235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58232 ?auto_58233 ) ) ( not ( = ?auto_58237 ?auto_58234 ) ) ( not ( = ?auto_58237 ?auto_58238 ) ) ( not ( = ?auto_58237 ?auto_58236 ) ) ( not ( = ?auto_58237 ?auto_58233 ) ) ( not ( = ?auto_58237 ?auto_58232 ) ) ( not ( = ?auto_58234 ?auto_58238 ) ) ( not ( = ?auto_58234 ?auto_58236 ) ) ( not ( = ?auto_58234 ?auto_58233 ) ) ( not ( = ?auto_58234 ?auto_58232 ) ) ( not ( = ?auto_58238 ?auto_58236 ) ) ( not ( = ?auto_58238 ?auto_58233 ) ) ( not ( = ?auto_58238 ?auto_58232 ) ) ( not ( = ?auto_58236 ?auto_58233 ) ) ( not ( = ?auto_58236 ?auto_58232 ) ) ( ON ?auto_58232 ?auto_58235 ) ( not ( = ?auto_58232 ?auto_58235 ) ) ( not ( = ?auto_58233 ?auto_58235 ) ) ( not ( = ?auto_58237 ?auto_58235 ) ) ( not ( = ?auto_58234 ?auto_58235 ) ) ( not ( = ?auto_58238 ?auto_58235 ) ) ( not ( = ?auto_58236 ?auto_58235 ) ) ( ON ?auto_58233 ?auto_58232 ) ( ON-TABLE ?auto_58235 ) ( ON ?auto_58236 ?auto_58233 ) ( ON ?auto_58238 ?auto_58236 ) ( ON ?auto_58234 ?auto_58238 ) ( CLEAR ?auto_58234 ) ( HOLDING ?auto_58237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58237 )
      ( MAKE-1PILE ?auto_58232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58239 - BLOCK
    )
    :vars
    (
      ?auto_58245 - BLOCK
      ?auto_58242 - BLOCK
      ?auto_58241 - BLOCK
      ?auto_58244 - BLOCK
      ?auto_58240 - BLOCK
      ?auto_58243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58239 ?auto_58245 ) ) ( not ( = ?auto_58242 ?auto_58241 ) ) ( not ( = ?auto_58242 ?auto_58244 ) ) ( not ( = ?auto_58242 ?auto_58240 ) ) ( not ( = ?auto_58242 ?auto_58245 ) ) ( not ( = ?auto_58242 ?auto_58239 ) ) ( not ( = ?auto_58241 ?auto_58244 ) ) ( not ( = ?auto_58241 ?auto_58240 ) ) ( not ( = ?auto_58241 ?auto_58245 ) ) ( not ( = ?auto_58241 ?auto_58239 ) ) ( not ( = ?auto_58244 ?auto_58240 ) ) ( not ( = ?auto_58244 ?auto_58245 ) ) ( not ( = ?auto_58244 ?auto_58239 ) ) ( not ( = ?auto_58240 ?auto_58245 ) ) ( not ( = ?auto_58240 ?auto_58239 ) ) ( ON ?auto_58239 ?auto_58243 ) ( not ( = ?auto_58239 ?auto_58243 ) ) ( not ( = ?auto_58245 ?auto_58243 ) ) ( not ( = ?auto_58242 ?auto_58243 ) ) ( not ( = ?auto_58241 ?auto_58243 ) ) ( not ( = ?auto_58244 ?auto_58243 ) ) ( not ( = ?auto_58240 ?auto_58243 ) ) ( ON ?auto_58245 ?auto_58239 ) ( ON-TABLE ?auto_58243 ) ( ON ?auto_58240 ?auto_58245 ) ( ON ?auto_58244 ?auto_58240 ) ( ON ?auto_58241 ?auto_58244 ) ( ON ?auto_58242 ?auto_58241 ) ( CLEAR ?auto_58242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58243 ?auto_58239 ?auto_58245 ?auto_58240 ?auto_58244 ?auto_58241 )
      ( MAKE-1PILE ?auto_58239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58250 - BLOCK
      ?auto_58251 - BLOCK
      ?auto_58252 - BLOCK
      ?auto_58253 - BLOCK
    )
    :vars
    (
      ?auto_58254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58254 ?auto_58253 ) ( CLEAR ?auto_58254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58250 ) ( ON ?auto_58251 ?auto_58250 ) ( ON ?auto_58252 ?auto_58251 ) ( ON ?auto_58253 ?auto_58252 ) ( not ( = ?auto_58250 ?auto_58251 ) ) ( not ( = ?auto_58250 ?auto_58252 ) ) ( not ( = ?auto_58250 ?auto_58253 ) ) ( not ( = ?auto_58250 ?auto_58254 ) ) ( not ( = ?auto_58251 ?auto_58252 ) ) ( not ( = ?auto_58251 ?auto_58253 ) ) ( not ( = ?auto_58251 ?auto_58254 ) ) ( not ( = ?auto_58252 ?auto_58253 ) ) ( not ( = ?auto_58252 ?auto_58254 ) ) ( not ( = ?auto_58253 ?auto_58254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58254 ?auto_58253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58255 - BLOCK
      ?auto_58256 - BLOCK
      ?auto_58257 - BLOCK
      ?auto_58258 - BLOCK
    )
    :vars
    (
      ?auto_58259 - BLOCK
      ?auto_58260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58259 ?auto_58258 ) ( CLEAR ?auto_58259 ) ( ON-TABLE ?auto_58255 ) ( ON ?auto_58256 ?auto_58255 ) ( ON ?auto_58257 ?auto_58256 ) ( ON ?auto_58258 ?auto_58257 ) ( not ( = ?auto_58255 ?auto_58256 ) ) ( not ( = ?auto_58255 ?auto_58257 ) ) ( not ( = ?auto_58255 ?auto_58258 ) ) ( not ( = ?auto_58255 ?auto_58259 ) ) ( not ( = ?auto_58256 ?auto_58257 ) ) ( not ( = ?auto_58256 ?auto_58258 ) ) ( not ( = ?auto_58256 ?auto_58259 ) ) ( not ( = ?auto_58257 ?auto_58258 ) ) ( not ( = ?auto_58257 ?auto_58259 ) ) ( not ( = ?auto_58258 ?auto_58259 ) ) ( HOLDING ?auto_58260 ) ( not ( = ?auto_58255 ?auto_58260 ) ) ( not ( = ?auto_58256 ?auto_58260 ) ) ( not ( = ?auto_58257 ?auto_58260 ) ) ( not ( = ?auto_58258 ?auto_58260 ) ) ( not ( = ?auto_58259 ?auto_58260 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_58260 )
      ( MAKE-4PILE ?auto_58255 ?auto_58256 ?auto_58257 ?auto_58258 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58261 - BLOCK
      ?auto_58262 - BLOCK
      ?auto_58263 - BLOCK
      ?auto_58264 - BLOCK
    )
    :vars
    (
      ?auto_58266 - BLOCK
      ?auto_58265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58266 ?auto_58264 ) ( ON-TABLE ?auto_58261 ) ( ON ?auto_58262 ?auto_58261 ) ( ON ?auto_58263 ?auto_58262 ) ( ON ?auto_58264 ?auto_58263 ) ( not ( = ?auto_58261 ?auto_58262 ) ) ( not ( = ?auto_58261 ?auto_58263 ) ) ( not ( = ?auto_58261 ?auto_58264 ) ) ( not ( = ?auto_58261 ?auto_58266 ) ) ( not ( = ?auto_58262 ?auto_58263 ) ) ( not ( = ?auto_58262 ?auto_58264 ) ) ( not ( = ?auto_58262 ?auto_58266 ) ) ( not ( = ?auto_58263 ?auto_58264 ) ) ( not ( = ?auto_58263 ?auto_58266 ) ) ( not ( = ?auto_58264 ?auto_58266 ) ) ( not ( = ?auto_58261 ?auto_58265 ) ) ( not ( = ?auto_58262 ?auto_58265 ) ) ( not ( = ?auto_58263 ?auto_58265 ) ) ( not ( = ?auto_58264 ?auto_58265 ) ) ( not ( = ?auto_58266 ?auto_58265 ) ) ( ON ?auto_58265 ?auto_58266 ) ( CLEAR ?auto_58265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58261 ?auto_58262 ?auto_58263 ?auto_58264 ?auto_58266 )
      ( MAKE-4PILE ?auto_58261 ?auto_58262 ?auto_58263 ?auto_58264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58267 - BLOCK
      ?auto_58268 - BLOCK
      ?auto_58269 - BLOCK
      ?auto_58270 - BLOCK
    )
    :vars
    (
      ?auto_58271 - BLOCK
      ?auto_58272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58271 ?auto_58270 ) ( ON-TABLE ?auto_58267 ) ( ON ?auto_58268 ?auto_58267 ) ( ON ?auto_58269 ?auto_58268 ) ( ON ?auto_58270 ?auto_58269 ) ( not ( = ?auto_58267 ?auto_58268 ) ) ( not ( = ?auto_58267 ?auto_58269 ) ) ( not ( = ?auto_58267 ?auto_58270 ) ) ( not ( = ?auto_58267 ?auto_58271 ) ) ( not ( = ?auto_58268 ?auto_58269 ) ) ( not ( = ?auto_58268 ?auto_58270 ) ) ( not ( = ?auto_58268 ?auto_58271 ) ) ( not ( = ?auto_58269 ?auto_58270 ) ) ( not ( = ?auto_58269 ?auto_58271 ) ) ( not ( = ?auto_58270 ?auto_58271 ) ) ( not ( = ?auto_58267 ?auto_58272 ) ) ( not ( = ?auto_58268 ?auto_58272 ) ) ( not ( = ?auto_58269 ?auto_58272 ) ) ( not ( = ?auto_58270 ?auto_58272 ) ) ( not ( = ?auto_58271 ?auto_58272 ) ) ( HOLDING ?auto_58272 ) ( CLEAR ?auto_58271 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58267 ?auto_58268 ?auto_58269 ?auto_58270 ?auto_58271 ?auto_58272 )
      ( MAKE-4PILE ?auto_58267 ?auto_58268 ?auto_58269 ?auto_58270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58273 - BLOCK
      ?auto_58274 - BLOCK
      ?auto_58275 - BLOCK
      ?auto_58276 - BLOCK
    )
    :vars
    (
      ?auto_58277 - BLOCK
      ?auto_58278 - BLOCK
      ?auto_58279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58277 ?auto_58276 ) ( ON-TABLE ?auto_58273 ) ( ON ?auto_58274 ?auto_58273 ) ( ON ?auto_58275 ?auto_58274 ) ( ON ?auto_58276 ?auto_58275 ) ( not ( = ?auto_58273 ?auto_58274 ) ) ( not ( = ?auto_58273 ?auto_58275 ) ) ( not ( = ?auto_58273 ?auto_58276 ) ) ( not ( = ?auto_58273 ?auto_58277 ) ) ( not ( = ?auto_58274 ?auto_58275 ) ) ( not ( = ?auto_58274 ?auto_58276 ) ) ( not ( = ?auto_58274 ?auto_58277 ) ) ( not ( = ?auto_58275 ?auto_58276 ) ) ( not ( = ?auto_58275 ?auto_58277 ) ) ( not ( = ?auto_58276 ?auto_58277 ) ) ( not ( = ?auto_58273 ?auto_58278 ) ) ( not ( = ?auto_58274 ?auto_58278 ) ) ( not ( = ?auto_58275 ?auto_58278 ) ) ( not ( = ?auto_58276 ?auto_58278 ) ) ( not ( = ?auto_58277 ?auto_58278 ) ) ( CLEAR ?auto_58277 ) ( ON ?auto_58278 ?auto_58279 ) ( CLEAR ?auto_58278 ) ( HAND-EMPTY ) ( not ( = ?auto_58273 ?auto_58279 ) ) ( not ( = ?auto_58274 ?auto_58279 ) ) ( not ( = ?auto_58275 ?auto_58279 ) ) ( not ( = ?auto_58276 ?auto_58279 ) ) ( not ( = ?auto_58277 ?auto_58279 ) ) ( not ( = ?auto_58278 ?auto_58279 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58278 ?auto_58279 )
      ( MAKE-4PILE ?auto_58273 ?auto_58274 ?auto_58275 ?auto_58276 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58294 - BLOCK
      ?auto_58295 - BLOCK
      ?auto_58296 - BLOCK
      ?auto_58297 - BLOCK
    )
    :vars
    (
      ?auto_58300 - BLOCK
      ?auto_58299 - BLOCK
      ?auto_58298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58294 ) ( ON ?auto_58295 ?auto_58294 ) ( ON ?auto_58296 ?auto_58295 ) ( not ( = ?auto_58294 ?auto_58295 ) ) ( not ( = ?auto_58294 ?auto_58296 ) ) ( not ( = ?auto_58294 ?auto_58297 ) ) ( not ( = ?auto_58294 ?auto_58300 ) ) ( not ( = ?auto_58295 ?auto_58296 ) ) ( not ( = ?auto_58295 ?auto_58297 ) ) ( not ( = ?auto_58295 ?auto_58300 ) ) ( not ( = ?auto_58296 ?auto_58297 ) ) ( not ( = ?auto_58296 ?auto_58300 ) ) ( not ( = ?auto_58297 ?auto_58300 ) ) ( not ( = ?auto_58294 ?auto_58299 ) ) ( not ( = ?auto_58295 ?auto_58299 ) ) ( not ( = ?auto_58296 ?auto_58299 ) ) ( not ( = ?auto_58297 ?auto_58299 ) ) ( not ( = ?auto_58300 ?auto_58299 ) ) ( ON ?auto_58299 ?auto_58298 ) ( not ( = ?auto_58294 ?auto_58298 ) ) ( not ( = ?auto_58295 ?auto_58298 ) ) ( not ( = ?auto_58296 ?auto_58298 ) ) ( not ( = ?auto_58297 ?auto_58298 ) ) ( not ( = ?auto_58300 ?auto_58298 ) ) ( not ( = ?auto_58299 ?auto_58298 ) ) ( ON ?auto_58300 ?auto_58299 ) ( CLEAR ?auto_58300 ) ( HOLDING ?auto_58297 ) ( CLEAR ?auto_58296 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58294 ?auto_58295 ?auto_58296 ?auto_58297 ?auto_58300 )
      ( MAKE-4PILE ?auto_58294 ?auto_58295 ?auto_58296 ?auto_58297 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58301 - BLOCK
      ?auto_58302 - BLOCK
      ?auto_58303 - BLOCK
      ?auto_58304 - BLOCK
    )
    :vars
    (
      ?auto_58306 - BLOCK
      ?auto_58307 - BLOCK
      ?auto_58305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58301 ) ( ON ?auto_58302 ?auto_58301 ) ( ON ?auto_58303 ?auto_58302 ) ( not ( = ?auto_58301 ?auto_58302 ) ) ( not ( = ?auto_58301 ?auto_58303 ) ) ( not ( = ?auto_58301 ?auto_58304 ) ) ( not ( = ?auto_58301 ?auto_58306 ) ) ( not ( = ?auto_58302 ?auto_58303 ) ) ( not ( = ?auto_58302 ?auto_58304 ) ) ( not ( = ?auto_58302 ?auto_58306 ) ) ( not ( = ?auto_58303 ?auto_58304 ) ) ( not ( = ?auto_58303 ?auto_58306 ) ) ( not ( = ?auto_58304 ?auto_58306 ) ) ( not ( = ?auto_58301 ?auto_58307 ) ) ( not ( = ?auto_58302 ?auto_58307 ) ) ( not ( = ?auto_58303 ?auto_58307 ) ) ( not ( = ?auto_58304 ?auto_58307 ) ) ( not ( = ?auto_58306 ?auto_58307 ) ) ( ON ?auto_58307 ?auto_58305 ) ( not ( = ?auto_58301 ?auto_58305 ) ) ( not ( = ?auto_58302 ?auto_58305 ) ) ( not ( = ?auto_58303 ?auto_58305 ) ) ( not ( = ?auto_58304 ?auto_58305 ) ) ( not ( = ?auto_58306 ?auto_58305 ) ) ( not ( = ?auto_58307 ?auto_58305 ) ) ( ON ?auto_58306 ?auto_58307 ) ( CLEAR ?auto_58303 ) ( ON ?auto_58304 ?auto_58306 ) ( CLEAR ?auto_58304 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58305 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58305 ?auto_58307 ?auto_58306 )
      ( MAKE-4PILE ?auto_58301 ?auto_58302 ?auto_58303 ?auto_58304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58308 - BLOCK
      ?auto_58309 - BLOCK
      ?auto_58310 - BLOCK
      ?auto_58311 - BLOCK
    )
    :vars
    (
      ?auto_58312 - BLOCK
      ?auto_58313 - BLOCK
      ?auto_58314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58308 ) ( ON ?auto_58309 ?auto_58308 ) ( not ( = ?auto_58308 ?auto_58309 ) ) ( not ( = ?auto_58308 ?auto_58310 ) ) ( not ( = ?auto_58308 ?auto_58311 ) ) ( not ( = ?auto_58308 ?auto_58312 ) ) ( not ( = ?auto_58309 ?auto_58310 ) ) ( not ( = ?auto_58309 ?auto_58311 ) ) ( not ( = ?auto_58309 ?auto_58312 ) ) ( not ( = ?auto_58310 ?auto_58311 ) ) ( not ( = ?auto_58310 ?auto_58312 ) ) ( not ( = ?auto_58311 ?auto_58312 ) ) ( not ( = ?auto_58308 ?auto_58313 ) ) ( not ( = ?auto_58309 ?auto_58313 ) ) ( not ( = ?auto_58310 ?auto_58313 ) ) ( not ( = ?auto_58311 ?auto_58313 ) ) ( not ( = ?auto_58312 ?auto_58313 ) ) ( ON ?auto_58313 ?auto_58314 ) ( not ( = ?auto_58308 ?auto_58314 ) ) ( not ( = ?auto_58309 ?auto_58314 ) ) ( not ( = ?auto_58310 ?auto_58314 ) ) ( not ( = ?auto_58311 ?auto_58314 ) ) ( not ( = ?auto_58312 ?auto_58314 ) ) ( not ( = ?auto_58313 ?auto_58314 ) ) ( ON ?auto_58312 ?auto_58313 ) ( ON ?auto_58311 ?auto_58312 ) ( CLEAR ?auto_58311 ) ( ON-TABLE ?auto_58314 ) ( HOLDING ?auto_58310 ) ( CLEAR ?auto_58309 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58308 ?auto_58309 ?auto_58310 )
      ( MAKE-4PILE ?auto_58308 ?auto_58309 ?auto_58310 ?auto_58311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58315 - BLOCK
      ?auto_58316 - BLOCK
      ?auto_58317 - BLOCK
      ?auto_58318 - BLOCK
    )
    :vars
    (
      ?auto_58319 - BLOCK
      ?auto_58320 - BLOCK
      ?auto_58321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58315 ) ( ON ?auto_58316 ?auto_58315 ) ( not ( = ?auto_58315 ?auto_58316 ) ) ( not ( = ?auto_58315 ?auto_58317 ) ) ( not ( = ?auto_58315 ?auto_58318 ) ) ( not ( = ?auto_58315 ?auto_58319 ) ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( not ( = ?auto_58316 ?auto_58318 ) ) ( not ( = ?auto_58316 ?auto_58319 ) ) ( not ( = ?auto_58317 ?auto_58318 ) ) ( not ( = ?auto_58317 ?auto_58319 ) ) ( not ( = ?auto_58318 ?auto_58319 ) ) ( not ( = ?auto_58315 ?auto_58320 ) ) ( not ( = ?auto_58316 ?auto_58320 ) ) ( not ( = ?auto_58317 ?auto_58320 ) ) ( not ( = ?auto_58318 ?auto_58320 ) ) ( not ( = ?auto_58319 ?auto_58320 ) ) ( ON ?auto_58320 ?auto_58321 ) ( not ( = ?auto_58315 ?auto_58321 ) ) ( not ( = ?auto_58316 ?auto_58321 ) ) ( not ( = ?auto_58317 ?auto_58321 ) ) ( not ( = ?auto_58318 ?auto_58321 ) ) ( not ( = ?auto_58319 ?auto_58321 ) ) ( not ( = ?auto_58320 ?auto_58321 ) ) ( ON ?auto_58319 ?auto_58320 ) ( ON ?auto_58318 ?auto_58319 ) ( ON-TABLE ?auto_58321 ) ( CLEAR ?auto_58316 ) ( ON ?auto_58317 ?auto_58318 ) ( CLEAR ?auto_58317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58321 ?auto_58320 ?auto_58319 ?auto_58318 )
      ( MAKE-4PILE ?auto_58315 ?auto_58316 ?auto_58317 ?auto_58318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58322 - BLOCK
      ?auto_58323 - BLOCK
      ?auto_58324 - BLOCK
      ?auto_58325 - BLOCK
    )
    :vars
    (
      ?auto_58327 - BLOCK
      ?auto_58328 - BLOCK
      ?auto_58326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58322 ) ( not ( = ?auto_58322 ?auto_58323 ) ) ( not ( = ?auto_58322 ?auto_58324 ) ) ( not ( = ?auto_58322 ?auto_58325 ) ) ( not ( = ?auto_58322 ?auto_58327 ) ) ( not ( = ?auto_58323 ?auto_58324 ) ) ( not ( = ?auto_58323 ?auto_58325 ) ) ( not ( = ?auto_58323 ?auto_58327 ) ) ( not ( = ?auto_58324 ?auto_58325 ) ) ( not ( = ?auto_58324 ?auto_58327 ) ) ( not ( = ?auto_58325 ?auto_58327 ) ) ( not ( = ?auto_58322 ?auto_58328 ) ) ( not ( = ?auto_58323 ?auto_58328 ) ) ( not ( = ?auto_58324 ?auto_58328 ) ) ( not ( = ?auto_58325 ?auto_58328 ) ) ( not ( = ?auto_58327 ?auto_58328 ) ) ( ON ?auto_58328 ?auto_58326 ) ( not ( = ?auto_58322 ?auto_58326 ) ) ( not ( = ?auto_58323 ?auto_58326 ) ) ( not ( = ?auto_58324 ?auto_58326 ) ) ( not ( = ?auto_58325 ?auto_58326 ) ) ( not ( = ?auto_58327 ?auto_58326 ) ) ( not ( = ?auto_58328 ?auto_58326 ) ) ( ON ?auto_58327 ?auto_58328 ) ( ON ?auto_58325 ?auto_58327 ) ( ON-TABLE ?auto_58326 ) ( ON ?auto_58324 ?auto_58325 ) ( CLEAR ?auto_58324 ) ( HOLDING ?auto_58323 ) ( CLEAR ?auto_58322 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58322 ?auto_58323 )
      ( MAKE-4PILE ?auto_58322 ?auto_58323 ?auto_58324 ?auto_58325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58329 - BLOCK
      ?auto_58330 - BLOCK
      ?auto_58331 - BLOCK
      ?auto_58332 - BLOCK
    )
    :vars
    (
      ?auto_58335 - BLOCK
      ?auto_58333 - BLOCK
      ?auto_58334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58329 ) ( not ( = ?auto_58329 ?auto_58330 ) ) ( not ( = ?auto_58329 ?auto_58331 ) ) ( not ( = ?auto_58329 ?auto_58332 ) ) ( not ( = ?auto_58329 ?auto_58335 ) ) ( not ( = ?auto_58330 ?auto_58331 ) ) ( not ( = ?auto_58330 ?auto_58332 ) ) ( not ( = ?auto_58330 ?auto_58335 ) ) ( not ( = ?auto_58331 ?auto_58332 ) ) ( not ( = ?auto_58331 ?auto_58335 ) ) ( not ( = ?auto_58332 ?auto_58335 ) ) ( not ( = ?auto_58329 ?auto_58333 ) ) ( not ( = ?auto_58330 ?auto_58333 ) ) ( not ( = ?auto_58331 ?auto_58333 ) ) ( not ( = ?auto_58332 ?auto_58333 ) ) ( not ( = ?auto_58335 ?auto_58333 ) ) ( ON ?auto_58333 ?auto_58334 ) ( not ( = ?auto_58329 ?auto_58334 ) ) ( not ( = ?auto_58330 ?auto_58334 ) ) ( not ( = ?auto_58331 ?auto_58334 ) ) ( not ( = ?auto_58332 ?auto_58334 ) ) ( not ( = ?auto_58335 ?auto_58334 ) ) ( not ( = ?auto_58333 ?auto_58334 ) ) ( ON ?auto_58335 ?auto_58333 ) ( ON ?auto_58332 ?auto_58335 ) ( ON-TABLE ?auto_58334 ) ( ON ?auto_58331 ?auto_58332 ) ( CLEAR ?auto_58329 ) ( ON ?auto_58330 ?auto_58331 ) ( CLEAR ?auto_58330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58334 ?auto_58333 ?auto_58335 ?auto_58332 ?auto_58331 )
      ( MAKE-4PILE ?auto_58329 ?auto_58330 ?auto_58331 ?auto_58332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58336 - BLOCK
      ?auto_58337 - BLOCK
      ?auto_58338 - BLOCK
      ?auto_58339 - BLOCK
    )
    :vars
    (
      ?auto_58342 - BLOCK
      ?auto_58341 - BLOCK
      ?auto_58340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58336 ?auto_58337 ) ) ( not ( = ?auto_58336 ?auto_58338 ) ) ( not ( = ?auto_58336 ?auto_58339 ) ) ( not ( = ?auto_58336 ?auto_58342 ) ) ( not ( = ?auto_58337 ?auto_58338 ) ) ( not ( = ?auto_58337 ?auto_58339 ) ) ( not ( = ?auto_58337 ?auto_58342 ) ) ( not ( = ?auto_58338 ?auto_58339 ) ) ( not ( = ?auto_58338 ?auto_58342 ) ) ( not ( = ?auto_58339 ?auto_58342 ) ) ( not ( = ?auto_58336 ?auto_58341 ) ) ( not ( = ?auto_58337 ?auto_58341 ) ) ( not ( = ?auto_58338 ?auto_58341 ) ) ( not ( = ?auto_58339 ?auto_58341 ) ) ( not ( = ?auto_58342 ?auto_58341 ) ) ( ON ?auto_58341 ?auto_58340 ) ( not ( = ?auto_58336 ?auto_58340 ) ) ( not ( = ?auto_58337 ?auto_58340 ) ) ( not ( = ?auto_58338 ?auto_58340 ) ) ( not ( = ?auto_58339 ?auto_58340 ) ) ( not ( = ?auto_58342 ?auto_58340 ) ) ( not ( = ?auto_58341 ?auto_58340 ) ) ( ON ?auto_58342 ?auto_58341 ) ( ON ?auto_58339 ?auto_58342 ) ( ON-TABLE ?auto_58340 ) ( ON ?auto_58338 ?auto_58339 ) ( ON ?auto_58337 ?auto_58338 ) ( CLEAR ?auto_58337 ) ( HOLDING ?auto_58336 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58336 )
      ( MAKE-4PILE ?auto_58336 ?auto_58337 ?auto_58338 ?auto_58339 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58343 - BLOCK
      ?auto_58344 - BLOCK
      ?auto_58345 - BLOCK
      ?auto_58346 - BLOCK
    )
    :vars
    (
      ?auto_58348 - BLOCK
      ?auto_58349 - BLOCK
      ?auto_58347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58343 ?auto_58344 ) ) ( not ( = ?auto_58343 ?auto_58345 ) ) ( not ( = ?auto_58343 ?auto_58346 ) ) ( not ( = ?auto_58343 ?auto_58348 ) ) ( not ( = ?auto_58344 ?auto_58345 ) ) ( not ( = ?auto_58344 ?auto_58346 ) ) ( not ( = ?auto_58344 ?auto_58348 ) ) ( not ( = ?auto_58345 ?auto_58346 ) ) ( not ( = ?auto_58345 ?auto_58348 ) ) ( not ( = ?auto_58346 ?auto_58348 ) ) ( not ( = ?auto_58343 ?auto_58349 ) ) ( not ( = ?auto_58344 ?auto_58349 ) ) ( not ( = ?auto_58345 ?auto_58349 ) ) ( not ( = ?auto_58346 ?auto_58349 ) ) ( not ( = ?auto_58348 ?auto_58349 ) ) ( ON ?auto_58349 ?auto_58347 ) ( not ( = ?auto_58343 ?auto_58347 ) ) ( not ( = ?auto_58344 ?auto_58347 ) ) ( not ( = ?auto_58345 ?auto_58347 ) ) ( not ( = ?auto_58346 ?auto_58347 ) ) ( not ( = ?auto_58348 ?auto_58347 ) ) ( not ( = ?auto_58349 ?auto_58347 ) ) ( ON ?auto_58348 ?auto_58349 ) ( ON ?auto_58346 ?auto_58348 ) ( ON-TABLE ?auto_58347 ) ( ON ?auto_58345 ?auto_58346 ) ( ON ?auto_58344 ?auto_58345 ) ( ON ?auto_58343 ?auto_58344 ) ( CLEAR ?auto_58343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58347 ?auto_58349 ?auto_58348 ?auto_58346 ?auto_58345 ?auto_58344 )
      ( MAKE-4PILE ?auto_58343 ?auto_58344 ?auto_58345 ?auto_58346 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58352 - BLOCK
      ?auto_58353 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58353 ) ( CLEAR ?auto_58352 ) ( ON-TABLE ?auto_58352 ) ( not ( = ?auto_58352 ?auto_58353 ) ) )
    :subtasks
    ( ( !STACK ?auto_58353 ?auto_58352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58354 - BLOCK
      ?auto_58355 - BLOCK
    )
    :vars
    (
      ?auto_58356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58354 ) ( ON-TABLE ?auto_58354 ) ( not ( = ?auto_58354 ?auto_58355 ) ) ( ON ?auto_58355 ?auto_58356 ) ( CLEAR ?auto_58355 ) ( HAND-EMPTY ) ( not ( = ?auto_58354 ?auto_58356 ) ) ( not ( = ?auto_58355 ?auto_58356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58355 ?auto_58356 )
      ( MAKE-2PILE ?auto_58354 ?auto_58355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58357 - BLOCK
      ?auto_58358 - BLOCK
    )
    :vars
    (
      ?auto_58359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58357 ?auto_58358 ) ) ( ON ?auto_58358 ?auto_58359 ) ( CLEAR ?auto_58358 ) ( not ( = ?auto_58357 ?auto_58359 ) ) ( not ( = ?auto_58358 ?auto_58359 ) ) ( HOLDING ?auto_58357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58357 )
      ( MAKE-2PILE ?auto_58357 ?auto_58358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58360 - BLOCK
      ?auto_58361 - BLOCK
    )
    :vars
    (
      ?auto_58362 - BLOCK
      ?auto_58363 - BLOCK
      ?auto_58364 - BLOCK
      ?auto_58365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58360 ?auto_58361 ) ) ( ON ?auto_58361 ?auto_58362 ) ( not ( = ?auto_58360 ?auto_58362 ) ) ( not ( = ?auto_58361 ?auto_58362 ) ) ( ON ?auto_58360 ?auto_58361 ) ( CLEAR ?auto_58360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58363 ) ( ON ?auto_58364 ?auto_58363 ) ( ON ?auto_58365 ?auto_58364 ) ( ON ?auto_58362 ?auto_58365 ) ( not ( = ?auto_58363 ?auto_58364 ) ) ( not ( = ?auto_58363 ?auto_58365 ) ) ( not ( = ?auto_58363 ?auto_58362 ) ) ( not ( = ?auto_58363 ?auto_58361 ) ) ( not ( = ?auto_58363 ?auto_58360 ) ) ( not ( = ?auto_58364 ?auto_58365 ) ) ( not ( = ?auto_58364 ?auto_58362 ) ) ( not ( = ?auto_58364 ?auto_58361 ) ) ( not ( = ?auto_58364 ?auto_58360 ) ) ( not ( = ?auto_58365 ?auto_58362 ) ) ( not ( = ?auto_58365 ?auto_58361 ) ) ( not ( = ?auto_58365 ?auto_58360 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58363 ?auto_58364 ?auto_58365 ?auto_58362 ?auto_58361 )
      ( MAKE-2PILE ?auto_58360 ?auto_58361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58366 - BLOCK
      ?auto_58367 - BLOCK
    )
    :vars
    (
      ?auto_58368 - BLOCK
      ?auto_58369 - BLOCK
      ?auto_58371 - BLOCK
      ?auto_58370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58366 ?auto_58367 ) ) ( ON ?auto_58367 ?auto_58368 ) ( not ( = ?auto_58366 ?auto_58368 ) ) ( not ( = ?auto_58367 ?auto_58368 ) ) ( ON-TABLE ?auto_58369 ) ( ON ?auto_58371 ?auto_58369 ) ( ON ?auto_58370 ?auto_58371 ) ( ON ?auto_58368 ?auto_58370 ) ( not ( = ?auto_58369 ?auto_58371 ) ) ( not ( = ?auto_58369 ?auto_58370 ) ) ( not ( = ?auto_58369 ?auto_58368 ) ) ( not ( = ?auto_58369 ?auto_58367 ) ) ( not ( = ?auto_58369 ?auto_58366 ) ) ( not ( = ?auto_58371 ?auto_58370 ) ) ( not ( = ?auto_58371 ?auto_58368 ) ) ( not ( = ?auto_58371 ?auto_58367 ) ) ( not ( = ?auto_58371 ?auto_58366 ) ) ( not ( = ?auto_58370 ?auto_58368 ) ) ( not ( = ?auto_58370 ?auto_58367 ) ) ( not ( = ?auto_58370 ?auto_58366 ) ) ( HOLDING ?auto_58366 ) ( CLEAR ?auto_58367 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58369 ?auto_58371 ?auto_58370 ?auto_58368 ?auto_58367 ?auto_58366 )
      ( MAKE-2PILE ?auto_58366 ?auto_58367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58372 - BLOCK
      ?auto_58373 - BLOCK
    )
    :vars
    (
      ?auto_58376 - BLOCK
      ?auto_58375 - BLOCK
      ?auto_58377 - BLOCK
      ?auto_58374 - BLOCK
      ?auto_58378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58372 ?auto_58373 ) ) ( ON ?auto_58373 ?auto_58376 ) ( not ( = ?auto_58372 ?auto_58376 ) ) ( not ( = ?auto_58373 ?auto_58376 ) ) ( ON-TABLE ?auto_58375 ) ( ON ?auto_58377 ?auto_58375 ) ( ON ?auto_58374 ?auto_58377 ) ( ON ?auto_58376 ?auto_58374 ) ( not ( = ?auto_58375 ?auto_58377 ) ) ( not ( = ?auto_58375 ?auto_58374 ) ) ( not ( = ?auto_58375 ?auto_58376 ) ) ( not ( = ?auto_58375 ?auto_58373 ) ) ( not ( = ?auto_58375 ?auto_58372 ) ) ( not ( = ?auto_58377 ?auto_58374 ) ) ( not ( = ?auto_58377 ?auto_58376 ) ) ( not ( = ?auto_58377 ?auto_58373 ) ) ( not ( = ?auto_58377 ?auto_58372 ) ) ( not ( = ?auto_58374 ?auto_58376 ) ) ( not ( = ?auto_58374 ?auto_58373 ) ) ( not ( = ?auto_58374 ?auto_58372 ) ) ( CLEAR ?auto_58373 ) ( ON ?auto_58372 ?auto_58378 ) ( CLEAR ?auto_58372 ) ( HAND-EMPTY ) ( not ( = ?auto_58372 ?auto_58378 ) ) ( not ( = ?auto_58373 ?auto_58378 ) ) ( not ( = ?auto_58376 ?auto_58378 ) ) ( not ( = ?auto_58375 ?auto_58378 ) ) ( not ( = ?auto_58377 ?auto_58378 ) ) ( not ( = ?auto_58374 ?auto_58378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58372 ?auto_58378 )
      ( MAKE-2PILE ?auto_58372 ?auto_58373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58379 - BLOCK
      ?auto_58380 - BLOCK
    )
    :vars
    (
      ?auto_58381 - BLOCK
      ?auto_58385 - BLOCK
      ?auto_58383 - BLOCK
      ?auto_58384 - BLOCK
      ?auto_58382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58379 ?auto_58380 ) ) ( not ( = ?auto_58379 ?auto_58381 ) ) ( not ( = ?auto_58380 ?auto_58381 ) ) ( ON-TABLE ?auto_58385 ) ( ON ?auto_58383 ?auto_58385 ) ( ON ?auto_58384 ?auto_58383 ) ( ON ?auto_58381 ?auto_58384 ) ( not ( = ?auto_58385 ?auto_58383 ) ) ( not ( = ?auto_58385 ?auto_58384 ) ) ( not ( = ?auto_58385 ?auto_58381 ) ) ( not ( = ?auto_58385 ?auto_58380 ) ) ( not ( = ?auto_58385 ?auto_58379 ) ) ( not ( = ?auto_58383 ?auto_58384 ) ) ( not ( = ?auto_58383 ?auto_58381 ) ) ( not ( = ?auto_58383 ?auto_58380 ) ) ( not ( = ?auto_58383 ?auto_58379 ) ) ( not ( = ?auto_58384 ?auto_58381 ) ) ( not ( = ?auto_58384 ?auto_58380 ) ) ( not ( = ?auto_58384 ?auto_58379 ) ) ( ON ?auto_58379 ?auto_58382 ) ( CLEAR ?auto_58379 ) ( not ( = ?auto_58379 ?auto_58382 ) ) ( not ( = ?auto_58380 ?auto_58382 ) ) ( not ( = ?auto_58381 ?auto_58382 ) ) ( not ( = ?auto_58385 ?auto_58382 ) ) ( not ( = ?auto_58383 ?auto_58382 ) ) ( not ( = ?auto_58384 ?auto_58382 ) ) ( HOLDING ?auto_58380 ) ( CLEAR ?auto_58381 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58385 ?auto_58383 ?auto_58384 ?auto_58381 ?auto_58380 )
      ( MAKE-2PILE ?auto_58379 ?auto_58380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58386 - BLOCK
      ?auto_58387 - BLOCK
    )
    :vars
    (
      ?auto_58391 - BLOCK
      ?auto_58388 - BLOCK
      ?auto_58389 - BLOCK
      ?auto_58390 - BLOCK
      ?auto_58392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58386 ?auto_58387 ) ) ( not ( = ?auto_58386 ?auto_58391 ) ) ( not ( = ?auto_58387 ?auto_58391 ) ) ( ON-TABLE ?auto_58388 ) ( ON ?auto_58389 ?auto_58388 ) ( ON ?auto_58390 ?auto_58389 ) ( ON ?auto_58391 ?auto_58390 ) ( not ( = ?auto_58388 ?auto_58389 ) ) ( not ( = ?auto_58388 ?auto_58390 ) ) ( not ( = ?auto_58388 ?auto_58391 ) ) ( not ( = ?auto_58388 ?auto_58387 ) ) ( not ( = ?auto_58388 ?auto_58386 ) ) ( not ( = ?auto_58389 ?auto_58390 ) ) ( not ( = ?auto_58389 ?auto_58391 ) ) ( not ( = ?auto_58389 ?auto_58387 ) ) ( not ( = ?auto_58389 ?auto_58386 ) ) ( not ( = ?auto_58390 ?auto_58391 ) ) ( not ( = ?auto_58390 ?auto_58387 ) ) ( not ( = ?auto_58390 ?auto_58386 ) ) ( ON ?auto_58386 ?auto_58392 ) ( not ( = ?auto_58386 ?auto_58392 ) ) ( not ( = ?auto_58387 ?auto_58392 ) ) ( not ( = ?auto_58391 ?auto_58392 ) ) ( not ( = ?auto_58388 ?auto_58392 ) ) ( not ( = ?auto_58389 ?auto_58392 ) ) ( not ( = ?auto_58390 ?auto_58392 ) ) ( CLEAR ?auto_58391 ) ( ON ?auto_58387 ?auto_58386 ) ( CLEAR ?auto_58387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58392 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58392 ?auto_58386 )
      ( MAKE-2PILE ?auto_58386 ?auto_58387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58393 - BLOCK
      ?auto_58394 - BLOCK
    )
    :vars
    (
      ?auto_58397 - BLOCK
      ?auto_58399 - BLOCK
      ?auto_58398 - BLOCK
      ?auto_58395 - BLOCK
      ?auto_58396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58393 ?auto_58394 ) ) ( not ( = ?auto_58393 ?auto_58397 ) ) ( not ( = ?auto_58394 ?auto_58397 ) ) ( ON-TABLE ?auto_58399 ) ( ON ?auto_58398 ?auto_58399 ) ( ON ?auto_58395 ?auto_58398 ) ( not ( = ?auto_58399 ?auto_58398 ) ) ( not ( = ?auto_58399 ?auto_58395 ) ) ( not ( = ?auto_58399 ?auto_58397 ) ) ( not ( = ?auto_58399 ?auto_58394 ) ) ( not ( = ?auto_58399 ?auto_58393 ) ) ( not ( = ?auto_58398 ?auto_58395 ) ) ( not ( = ?auto_58398 ?auto_58397 ) ) ( not ( = ?auto_58398 ?auto_58394 ) ) ( not ( = ?auto_58398 ?auto_58393 ) ) ( not ( = ?auto_58395 ?auto_58397 ) ) ( not ( = ?auto_58395 ?auto_58394 ) ) ( not ( = ?auto_58395 ?auto_58393 ) ) ( ON ?auto_58393 ?auto_58396 ) ( not ( = ?auto_58393 ?auto_58396 ) ) ( not ( = ?auto_58394 ?auto_58396 ) ) ( not ( = ?auto_58397 ?auto_58396 ) ) ( not ( = ?auto_58399 ?auto_58396 ) ) ( not ( = ?auto_58398 ?auto_58396 ) ) ( not ( = ?auto_58395 ?auto_58396 ) ) ( ON ?auto_58394 ?auto_58393 ) ( CLEAR ?auto_58394 ) ( ON-TABLE ?auto_58396 ) ( HOLDING ?auto_58397 ) ( CLEAR ?auto_58395 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58399 ?auto_58398 ?auto_58395 ?auto_58397 )
      ( MAKE-2PILE ?auto_58393 ?auto_58394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58400 - BLOCK
      ?auto_58401 - BLOCK
    )
    :vars
    (
      ?auto_58405 - BLOCK
      ?auto_58404 - BLOCK
      ?auto_58402 - BLOCK
      ?auto_58406 - BLOCK
      ?auto_58403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58400 ?auto_58401 ) ) ( not ( = ?auto_58400 ?auto_58405 ) ) ( not ( = ?auto_58401 ?auto_58405 ) ) ( ON-TABLE ?auto_58404 ) ( ON ?auto_58402 ?auto_58404 ) ( ON ?auto_58406 ?auto_58402 ) ( not ( = ?auto_58404 ?auto_58402 ) ) ( not ( = ?auto_58404 ?auto_58406 ) ) ( not ( = ?auto_58404 ?auto_58405 ) ) ( not ( = ?auto_58404 ?auto_58401 ) ) ( not ( = ?auto_58404 ?auto_58400 ) ) ( not ( = ?auto_58402 ?auto_58406 ) ) ( not ( = ?auto_58402 ?auto_58405 ) ) ( not ( = ?auto_58402 ?auto_58401 ) ) ( not ( = ?auto_58402 ?auto_58400 ) ) ( not ( = ?auto_58406 ?auto_58405 ) ) ( not ( = ?auto_58406 ?auto_58401 ) ) ( not ( = ?auto_58406 ?auto_58400 ) ) ( ON ?auto_58400 ?auto_58403 ) ( not ( = ?auto_58400 ?auto_58403 ) ) ( not ( = ?auto_58401 ?auto_58403 ) ) ( not ( = ?auto_58405 ?auto_58403 ) ) ( not ( = ?auto_58404 ?auto_58403 ) ) ( not ( = ?auto_58402 ?auto_58403 ) ) ( not ( = ?auto_58406 ?auto_58403 ) ) ( ON ?auto_58401 ?auto_58400 ) ( ON-TABLE ?auto_58403 ) ( CLEAR ?auto_58406 ) ( ON ?auto_58405 ?auto_58401 ) ( CLEAR ?auto_58405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58403 ?auto_58400 ?auto_58401 )
      ( MAKE-2PILE ?auto_58400 ?auto_58401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58407 - BLOCK
      ?auto_58408 - BLOCK
    )
    :vars
    (
      ?auto_58411 - BLOCK
      ?auto_58409 - BLOCK
      ?auto_58410 - BLOCK
      ?auto_58412 - BLOCK
      ?auto_58413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58407 ?auto_58408 ) ) ( not ( = ?auto_58407 ?auto_58411 ) ) ( not ( = ?auto_58408 ?auto_58411 ) ) ( ON-TABLE ?auto_58409 ) ( ON ?auto_58410 ?auto_58409 ) ( not ( = ?auto_58409 ?auto_58410 ) ) ( not ( = ?auto_58409 ?auto_58412 ) ) ( not ( = ?auto_58409 ?auto_58411 ) ) ( not ( = ?auto_58409 ?auto_58408 ) ) ( not ( = ?auto_58409 ?auto_58407 ) ) ( not ( = ?auto_58410 ?auto_58412 ) ) ( not ( = ?auto_58410 ?auto_58411 ) ) ( not ( = ?auto_58410 ?auto_58408 ) ) ( not ( = ?auto_58410 ?auto_58407 ) ) ( not ( = ?auto_58412 ?auto_58411 ) ) ( not ( = ?auto_58412 ?auto_58408 ) ) ( not ( = ?auto_58412 ?auto_58407 ) ) ( ON ?auto_58407 ?auto_58413 ) ( not ( = ?auto_58407 ?auto_58413 ) ) ( not ( = ?auto_58408 ?auto_58413 ) ) ( not ( = ?auto_58411 ?auto_58413 ) ) ( not ( = ?auto_58409 ?auto_58413 ) ) ( not ( = ?auto_58410 ?auto_58413 ) ) ( not ( = ?auto_58412 ?auto_58413 ) ) ( ON ?auto_58408 ?auto_58407 ) ( ON-TABLE ?auto_58413 ) ( ON ?auto_58411 ?auto_58408 ) ( CLEAR ?auto_58411 ) ( HOLDING ?auto_58412 ) ( CLEAR ?auto_58410 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58409 ?auto_58410 ?auto_58412 )
      ( MAKE-2PILE ?auto_58407 ?auto_58408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58414 - BLOCK
      ?auto_58415 - BLOCK
    )
    :vars
    (
      ?auto_58419 - BLOCK
      ?auto_58416 - BLOCK
      ?auto_58420 - BLOCK
      ?auto_58417 - BLOCK
      ?auto_58418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58414 ?auto_58415 ) ) ( not ( = ?auto_58414 ?auto_58419 ) ) ( not ( = ?auto_58415 ?auto_58419 ) ) ( ON-TABLE ?auto_58416 ) ( ON ?auto_58420 ?auto_58416 ) ( not ( = ?auto_58416 ?auto_58420 ) ) ( not ( = ?auto_58416 ?auto_58417 ) ) ( not ( = ?auto_58416 ?auto_58419 ) ) ( not ( = ?auto_58416 ?auto_58415 ) ) ( not ( = ?auto_58416 ?auto_58414 ) ) ( not ( = ?auto_58420 ?auto_58417 ) ) ( not ( = ?auto_58420 ?auto_58419 ) ) ( not ( = ?auto_58420 ?auto_58415 ) ) ( not ( = ?auto_58420 ?auto_58414 ) ) ( not ( = ?auto_58417 ?auto_58419 ) ) ( not ( = ?auto_58417 ?auto_58415 ) ) ( not ( = ?auto_58417 ?auto_58414 ) ) ( ON ?auto_58414 ?auto_58418 ) ( not ( = ?auto_58414 ?auto_58418 ) ) ( not ( = ?auto_58415 ?auto_58418 ) ) ( not ( = ?auto_58419 ?auto_58418 ) ) ( not ( = ?auto_58416 ?auto_58418 ) ) ( not ( = ?auto_58420 ?auto_58418 ) ) ( not ( = ?auto_58417 ?auto_58418 ) ) ( ON ?auto_58415 ?auto_58414 ) ( ON-TABLE ?auto_58418 ) ( ON ?auto_58419 ?auto_58415 ) ( CLEAR ?auto_58420 ) ( ON ?auto_58417 ?auto_58419 ) ( CLEAR ?auto_58417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58418 ?auto_58414 ?auto_58415 ?auto_58419 )
      ( MAKE-2PILE ?auto_58414 ?auto_58415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58421 - BLOCK
      ?auto_58422 - BLOCK
    )
    :vars
    (
      ?auto_58425 - BLOCK
      ?auto_58426 - BLOCK
      ?auto_58423 - BLOCK
      ?auto_58427 - BLOCK
      ?auto_58424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58421 ?auto_58422 ) ) ( not ( = ?auto_58421 ?auto_58425 ) ) ( not ( = ?auto_58422 ?auto_58425 ) ) ( ON-TABLE ?auto_58426 ) ( not ( = ?auto_58426 ?auto_58423 ) ) ( not ( = ?auto_58426 ?auto_58427 ) ) ( not ( = ?auto_58426 ?auto_58425 ) ) ( not ( = ?auto_58426 ?auto_58422 ) ) ( not ( = ?auto_58426 ?auto_58421 ) ) ( not ( = ?auto_58423 ?auto_58427 ) ) ( not ( = ?auto_58423 ?auto_58425 ) ) ( not ( = ?auto_58423 ?auto_58422 ) ) ( not ( = ?auto_58423 ?auto_58421 ) ) ( not ( = ?auto_58427 ?auto_58425 ) ) ( not ( = ?auto_58427 ?auto_58422 ) ) ( not ( = ?auto_58427 ?auto_58421 ) ) ( ON ?auto_58421 ?auto_58424 ) ( not ( = ?auto_58421 ?auto_58424 ) ) ( not ( = ?auto_58422 ?auto_58424 ) ) ( not ( = ?auto_58425 ?auto_58424 ) ) ( not ( = ?auto_58426 ?auto_58424 ) ) ( not ( = ?auto_58423 ?auto_58424 ) ) ( not ( = ?auto_58427 ?auto_58424 ) ) ( ON ?auto_58422 ?auto_58421 ) ( ON-TABLE ?auto_58424 ) ( ON ?auto_58425 ?auto_58422 ) ( ON ?auto_58427 ?auto_58425 ) ( CLEAR ?auto_58427 ) ( HOLDING ?auto_58423 ) ( CLEAR ?auto_58426 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58426 ?auto_58423 )
      ( MAKE-2PILE ?auto_58421 ?auto_58422 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58428 - BLOCK
      ?auto_58429 - BLOCK
    )
    :vars
    (
      ?auto_58432 - BLOCK
      ?auto_58434 - BLOCK
      ?auto_58430 - BLOCK
      ?auto_58433 - BLOCK
      ?auto_58431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58428 ?auto_58429 ) ) ( not ( = ?auto_58428 ?auto_58432 ) ) ( not ( = ?auto_58429 ?auto_58432 ) ) ( ON-TABLE ?auto_58434 ) ( not ( = ?auto_58434 ?auto_58430 ) ) ( not ( = ?auto_58434 ?auto_58433 ) ) ( not ( = ?auto_58434 ?auto_58432 ) ) ( not ( = ?auto_58434 ?auto_58429 ) ) ( not ( = ?auto_58434 ?auto_58428 ) ) ( not ( = ?auto_58430 ?auto_58433 ) ) ( not ( = ?auto_58430 ?auto_58432 ) ) ( not ( = ?auto_58430 ?auto_58429 ) ) ( not ( = ?auto_58430 ?auto_58428 ) ) ( not ( = ?auto_58433 ?auto_58432 ) ) ( not ( = ?auto_58433 ?auto_58429 ) ) ( not ( = ?auto_58433 ?auto_58428 ) ) ( ON ?auto_58428 ?auto_58431 ) ( not ( = ?auto_58428 ?auto_58431 ) ) ( not ( = ?auto_58429 ?auto_58431 ) ) ( not ( = ?auto_58432 ?auto_58431 ) ) ( not ( = ?auto_58434 ?auto_58431 ) ) ( not ( = ?auto_58430 ?auto_58431 ) ) ( not ( = ?auto_58433 ?auto_58431 ) ) ( ON ?auto_58429 ?auto_58428 ) ( ON-TABLE ?auto_58431 ) ( ON ?auto_58432 ?auto_58429 ) ( ON ?auto_58433 ?auto_58432 ) ( CLEAR ?auto_58434 ) ( ON ?auto_58430 ?auto_58433 ) ( CLEAR ?auto_58430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58431 ?auto_58428 ?auto_58429 ?auto_58432 ?auto_58433 )
      ( MAKE-2PILE ?auto_58428 ?auto_58429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58435 - BLOCK
      ?auto_58436 - BLOCK
    )
    :vars
    (
      ?auto_58438 - BLOCK
      ?auto_58439 - BLOCK
      ?auto_58440 - BLOCK
      ?auto_58437 - BLOCK
      ?auto_58441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58435 ?auto_58436 ) ) ( not ( = ?auto_58435 ?auto_58438 ) ) ( not ( = ?auto_58436 ?auto_58438 ) ) ( not ( = ?auto_58439 ?auto_58440 ) ) ( not ( = ?auto_58439 ?auto_58437 ) ) ( not ( = ?auto_58439 ?auto_58438 ) ) ( not ( = ?auto_58439 ?auto_58436 ) ) ( not ( = ?auto_58439 ?auto_58435 ) ) ( not ( = ?auto_58440 ?auto_58437 ) ) ( not ( = ?auto_58440 ?auto_58438 ) ) ( not ( = ?auto_58440 ?auto_58436 ) ) ( not ( = ?auto_58440 ?auto_58435 ) ) ( not ( = ?auto_58437 ?auto_58438 ) ) ( not ( = ?auto_58437 ?auto_58436 ) ) ( not ( = ?auto_58437 ?auto_58435 ) ) ( ON ?auto_58435 ?auto_58441 ) ( not ( = ?auto_58435 ?auto_58441 ) ) ( not ( = ?auto_58436 ?auto_58441 ) ) ( not ( = ?auto_58438 ?auto_58441 ) ) ( not ( = ?auto_58439 ?auto_58441 ) ) ( not ( = ?auto_58440 ?auto_58441 ) ) ( not ( = ?auto_58437 ?auto_58441 ) ) ( ON ?auto_58436 ?auto_58435 ) ( ON-TABLE ?auto_58441 ) ( ON ?auto_58438 ?auto_58436 ) ( ON ?auto_58437 ?auto_58438 ) ( ON ?auto_58440 ?auto_58437 ) ( CLEAR ?auto_58440 ) ( HOLDING ?auto_58439 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58439 )
      ( MAKE-2PILE ?auto_58435 ?auto_58436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58442 - BLOCK
      ?auto_58443 - BLOCK
    )
    :vars
    (
      ?auto_58448 - BLOCK
      ?auto_58445 - BLOCK
      ?auto_58446 - BLOCK
      ?auto_58447 - BLOCK
      ?auto_58444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58442 ?auto_58443 ) ) ( not ( = ?auto_58442 ?auto_58448 ) ) ( not ( = ?auto_58443 ?auto_58448 ) ) ( not ( = ?auto_58445 ?auto_58446 ) ) ( not ( = ?auto_58445 ?auto_58447 ) ) ( not ( = ?auto_58445 ?auto_58448 ) ) ( not ( = ?auto_58445 ?auto_58443 ) ) ( not ( = ?auto_58445 ?auto_58442 ) ) ( not ( = ?auto_58446 ?auto_58447 ) ) ( not ( = ?auto_58446 ?auto_58448 ) ) ( not ( = ?auto_58446 ?auto_58443 ) ) ( not ( = ?auto_58446 ?auto_58442 ) ) ( not ( = ?auto_58447 ?auto_58448 ) ) ( not ( = ?auto_58447 ?auto_58443 ) ) ( not ( = ?auto_58447 ?auto_58442 ) ) ( ON ?auto_58442 ?auto_58444 ) ( not ( = ?auto_58442 ?auto_58444 ) ) ( not ( = ?auto_58443 ?auto_58444 ) ) ( not ( = ?auto_58448 ?auto_58444 ) ) ( not ( = ?auto_58445 ?auto_58444 ) ) ( not ( = ?auto_58446 ?auto_58444 ) ) ( not ( = ?auto_58447 ?auto_58444 ) ) ( ON ?auto_58443 ?auto_58442 ) ( ON-TABLE ?auto_58444 ) ( ON ?auto_58448 ?auto_58443 ) ( ON ?auto_58447 ?auto_58448 ) ( ON ?auto_58446 ?auto_58447 ) ( ON ?auto_58445 ?auto_58446 ) ( CLEAR ?auto_58445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58444 ?auto_58442 ?auto_58443 ?auto_58448 ?auto_58447 ?auto_58446 )
      ( MAKE-2PILE ?auto_58442 ?auto_58443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58452 - BLOCK
      ?auto_58453 - BLOCK
      ?auto_58454 - BLOCK
    )
    :vars
    (
      ?auto_58455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58455 ?auto_58454 ) ( CLEAR ?auto_58455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58452 ) ( ON ?auto_58453 ?auto_58452 ) ( ON ?auto_58454 ?auto_58453 ) ( not ( = ?auto_58452 ?auto_58453 ) ) ( not ( = ?auto_58452 ?auto_58454 ) ) ( not ( = ?auto_58452 ?auto_58455 ) ) ( not ( = ?auto_58453 ?auto_58454 ) ) ( not ( = ?auto_58453 ?auto_58455 ) ) ( not ( = ?auto_58454 ?auto_58455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58455 ?auto_58454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58456 - BLOCK
      ?auto_58457 - BLOCK
      ?auto_58458 - BLOCK
    )
    :vars
    (
      ?auto_58459 - BLOCK
      ?auto_58460 - BLOCK
      ?auto_58461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58459 ?auto_58458 ) ( CLEAR ?auto_58459 ) ( ON-TABLE ?auto_58456 ) ( ON ?auto_58457 ?auto_58456 ) ( ON ?auto_58458 ?auto_58457 ) ( not ( = ?auto_58456 ?auto_58457 ) ) ( not ( = ?auto_58456 ?auto_58458 ) ) ( not ( = ?auto_58456 ?auto_58459 ) ) ( not ( = ?auto_58457 ?auto_58458 ) ) ( not ( = ?auto_58457 ?auto_58459 ) ) ( not ( = ?auto_58458 ?auto_58459 ) ) ( HOLDING ?auto_58460 ) ( CLEAR ?auto_58461 ) ( not ( = ?auto_58456 ?auto_58460 ) ) ( not ( = ?auto_58456 ?auto_58461 ) ) ( not ( = ?auto_58457 ?auto_58460 ) ) ( not ( = ?auto_58457 ?auto_58461 ) ) ( not ( = ?auto_58458 ?auto_58460 ) ) ( not ( = ?auto_58458 ?auto_58461 ) ) ( not ( = ?auto_58459 ?auto_58460 ) ) ( not ( = ?auto_58459 ?auto_58461 ) ) ( not ( = ?auto_58460 ?auto_58461 ) ) )
    :subtasks
    ( ( !STACK ?auto_58460 ?auto_58461 )
      ( MAKE-3PILE ?auto_58456 ?auto_58457 ?auto_58458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58462 - BLOCK
      ?auto_58463 - BLOCK
      ?auto_58464 - BLOCK
    )
    :vars
    (
      ?auto_58466 - BLOCK
      ?auto_58467 - BLOCK
      ?auto_58465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58466 ?auto_58464 ) ( ON-TABLE ?auto_58462 ) ( ON ?auto_58463 ?auto_58462 ) ( ON ?auto_58464 ?auto_58463 ) ( not ( = ?auto_58462 ?auto_58463 ) ) ( not ( = ?auto_58462 ?auto_58464 ) ) ( not ( = ?auto_58462 ?auto_58466 ) ) ( not ( = ?auto_58463 ?auto_58464 ) ) ( not ( = ?auto_58463 ?auto_58466 ) ) ( not ( = ?auto_58464 ?auto_58466 ) ) ( CLEAR ?auto_58467 ) ( not ( = ?auto_58462 ?auto_58465 ) ) ( not ( = ?auto_58462 ?auto_58467 ) ) ( not ( = ?auto_58463 ?auto_58465 ) ) ( not ( = ?auto_58463 ?auto_58467 ) ) ( not ( = ?auto_58464 ?auto_58465 ) ) ( not ( = ?auto_58464 ?auto_58467 ) ) ( not ( = ?auto_58466 ?auto_58465 ) ) ( not ( = ?auto_58466 ?auto_58467 ) ) ( not ( = ?auto_58465 ?auto_58467 ) ) ( ON ?auto_58465 ?auto_58466 ) ( CLEAR ?auto_58465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58462 ?auto_58463 ?auto_58464 ?auto_58466 )
      ( MAKE-3PILE ?auto_58462 ?auto_58463 ?auto_58464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58468 - BLOCK
      ?auto_58469 - BLOCK
      ?auto_58470 - BLOCK
    )
    :vars
    (
      ?auto_58472 - BLOCK
      ?auto_58471 - BLOCK
      ?auto_58473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58472 ?auto_58470 ) ( ON-TABLE ?auto_58468 ) ( ON ?auto_58469 ?auto_58468 ) ( ON ?auto_58470 ?auto_58469 ) ( not ( = ?auto_58468 ?auto_58469 ) ) ( not ( = ?auto_58468 ?auto_58470 ) ) ( not ( = ?auto_58468 ?auto_58472 ) ) ( not ( = ?auto_58469 ?auto_58470 ) ) ( not ( = ?auto_58469 ?auto_58472 ) ) ( not ( = ?auto_58470 ?auto_58472 ) ) ( not ( = ?auto_58468 ?auto_58471 ) ) ( not ( = ?auto_58468 ?auto_58473 ) ) ( not ( = ?auto_58469 ?auto_58471 ) ) ( not ( = ?auto_58469 ?auto_58473 ) ) ( not ( = ?auto_58470 ?auto_58471 ) ) ( not ( = ?auto_58470 ?auto_58473 ) ) ( not ( = ?auto_58472 ?auto_58471 ) ) ( not ( = ?auto_58472 ?auto_58473 ) ) ( not ( = ?auto_58471 ?auto_58473 ) ) ( ON ?auto_58471 ?auto_58472 ) ( CLEAR ?auto_58471 ) ( HOLDING ?auto_58473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58473 )
      ( MAKE-3PILE ?auto_58468 ?auto_58469 ?auto_58470 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58474 - BLOCK
      ?auto_58475 - BLOCK
      ?auto_58476 - BLOCK
    )
    :vars
    (
      ?auto_58478 - BLOCK
      ?auto_58477 - BLOCK
      ?auto_58479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58478 ?auto_58476 ) ( ON-TABLE ?auto_58474 ) ( ON ?auto_58475 ?auto_58474 ) ( ON ?auto_58476 ?auto_58475 ) ( not ( = ?auto_58474 ?auto_58475 ) ) ( not ( = ?auto_58474 ?auto_58476 ) ) ( not ( = ?auto_58474 ?auto_58478 ) ) ( not ( = ?auto_58475 ?auto_58476 ) ) ( not ( = ?auto_58475 ?auto_58478 ) ) ( not ( = ?auto_58476 ?auto_58478 ) ) ( not ( = ?auto_58474 ?auto_58477 ) ) ( not ( = ?auto_58474 ?auto_58479 ) ) ( not ( = ?auto_58475 ?auto_58477 ) ) ( not ( = ?auto_58475 ?auto_58479 ) ) ( not ( = ?auto_58476 ?auto_58477 ) ) ( not ( = ?auto_58476 ?auto_58479 ) ) ( not ( = ?auto_58478 ?auto_58477 ) ) ( not ( = ?auto_58478 ?auto_58479 ) ) ( not ( = ?auto_58477 ?auto_58479 ) ) ( ON ?auto_58477 ?auto_58478 ) ( ON ?auto_58479 ?auto_58477 ) ( CLEAR ?auto_58479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58474 ?auto_58475 ?auto_58476 ?auto_58478 ?auto_58477 )
      ( MAKE-3PILE ?auto_58474 ?auto_58475 ?auto_58476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58480 - BLOCK
      ?auto_58481 - BLOCK
      ?auto_58482 - BLOCK
    )
    :vars
    (
      ?auto_58485 - BLOCK
      ?auto_58484 - BLOCK
      ?auto_58483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58485 ?auto_58482 ) ( ON-TABLE ?auto_58480 ) ( ON ?auto_58481 ?auto_58480 ) ( ON ?auto_58482 ?auto_58481 ) ( not ( = ?auto_58480 ?auto_58481 ) ) ( not ( = ?auto_58480 ?auto_58482 ) ) ( not ( = ?auto_58480 ?auto_58485 ) ) ( not ( = ?auto_58481 ?auto_58482 ) ) ( not ( = ?auto_58481 ?auto_58485 ) ) ( not ( = ?auto_58482 ?auto_58485 ) ) ( not ( = ?auto_58480 ?auto_58484 ) ) ( not ( = ?auto_58480 ?auto_58483 ) ) ( not ( = ?auto_58481 ?auto_58484 ) ) ( not ( = ?auto_58481 ?auto_58483 ) ) ( not ( = ?auto_58482 ?auto_58484 ) ) ( not ( = ?auto_58482 ?auto_58483 ) ) ( not ( = ?auto_58485 ?auto_58484 ) ) ( not ( = ?auto_58485 ?auto_58483 ) ) ( not ( = ?auto_58484 ?auto_58483 ) ) ( ON ?auto_58484 ?auto_58485 ) ( HOLDING ?auto_58483 ) ( CLEAR ?auto_58484 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58480 ?auto_58481 ?auto_58482 ?auto_58485 ?auto_58484 ?auto_58483 )
      ( MAKE-3PILE ?auto_58480 ?auto_58481 ?auto_58482 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58486 - BLOCK
      ?auto_58487 - BLOCK
      ?auto_58488 - BLOCK
    )
    :vars
    (
      ?auto_58490 - BLOCK
      ?auto_58489 - BLOCK
      ?auto_58491 - BLOCK
      ?auto_58492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58490 ?auto_58488 ) ( ON-TABLE ?auto_58486 ) ( ON ?auto_58487 ?auto_58486 ) ( ON ?auto_58488 ?auto_58487 ) ( not ( = ?auto_58486 ?auto_58487 ) ) ( not ( = ?auto_58486 ?auto_58488 ) ) ( not ( = ?auto_58486 ?auto_58490 ) ) ( not ( = ?auto_58487 ?auto_58488 ) ) ( not ( = ?auto_58487 ?auto_58490 ) ) ( not ( = ?auto_58488 ?auto_58490 ) ) ( not ( = ?auto_58486 ?auto_58489 ) ) ( not ( = ?auto_58486 ?auto_58491 ) ) ( not ( = ?auto_58487 ?auto_58489 ) ) ( not ( = ?auto_58487 ?auto_58491 ) ) ( not ( = ?auto_58488 ?auto_58489 ) ) ( not ( = ?auto_58488 ?auto_58491 ) ) ( not ( = ?auto_58490 ?auto_58489 ) ) ( not ( = ?auto_58490 ?auto_58491 ) ) ( not ( = ?auto_58489 ?auto_58491 ) ) ( ON ?auto_58489 ?auto_58490 ) ( CLEAR ?auto_58489 ) ( ON ?auto_58491 ?auto_58492 ) ( CLEAR ?auto_58491 ) ( HAND-EMPTY ) ( not ( = ?auto_58486 ?auto_58492 ) ) ( not ( = ?auto_58487 ?auto_58492 ) ) ( not ( = ?auto_58488 ?auto_58492 ) ) ( not ( = ?auto_58490 ?auto_58492 ) ) ( not ( = ?auto_58489 ?auto_58492 ) ) ( not ( = ?auto_58491 ?auto_58492 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58491 ?auto_58492 )
      ( MAKE-3PILE ?auto_58486 ?auto_58487 ?auto_58488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58493 - BLOCK
      ?auto_58494 - BLOCK
      ?auto_58495 - BLOCK
    )
    :vars
    (
      ?auto_58496 - BLOCK
      ?auto_58498 - BLOCK
      ?auto_58499 - BLOCK
      ?auto_58497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58496 ?auto_58495 ) ( ON-TABLE ?auto_58493 ) ( ON ?auto_58494 ?auto_58493 ) ( ON ?auto_58495 ?auto_58494 ) ( not ( = ?auto_58493 ?auto_58494 ) ) ( not ( = ?auto_58493 ?auto_58495 ) ) ( not ( = ?auto_58493 ?auto_58496 ) ) ( not ( = ?auto_58494 ?auto_58495 ) ) ( not ( = ?auto_58494 ?auto_58496 ) ) ( not ( = ?auto_58495 ?auto_58496 ) ) ( not ( = ?auto_58493 ?auto_58498 ) ) ( not ( = ?auto_58493 ?auto_58499 ) ) ( not ( = ?auto_58494 ?auto_58498 ) ) ( not ( = ?auto_58494 ?auto_58499 ) ) ( not ( = ?auto_58495 ?auto_58498 ) ) ( not ( = ?auto_58495 ?auto_58499 ) ) ( not ( = ?auto_58496 ?auto_58498 ) ) ( not ( = ?auto_58496 ?auto_58499 ) ) ( not ( = ?auto_58498 ?auto_58499 ) ) ( ON ?auto_58499 ?auto_58497 ) ( CLEAR ?auto_58499 ) ( not ( = ?auto_58493 ?auto_58497 ) ) ( not ( = ?auto_58494 ?auto_58497 ) ) ( not ( = ?auto_58495 ?auto_58497 ) ) ( not ( = ?auto_58496 ?auto_58497 ) ) ( not ( = ?auto_58498 ?auto_58497 ) ) ( not ( = ?auto_58499 ?auto_58497 ) ) ( HOLDING ?auto_58498 ) ( CLEAR ?auto_58496 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58493 ?auto_58494 ?auto_58495 ?auto_58496 ?auto_58498 )
      ( MAKE-3PILE ?auto_58493 ?auto_58494 ?auto_58495 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58500 - BLOCK
      ?auto_58501 - BLOCK
      ?auto_58502 - BLOCK
    )
    :vars
    (
      ?auto_58505 - BLOCK
      ?auto_58506 - BLOCK
      ?auto_58503 - BLOCK
      ?auto_58504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58505 ?auto_58502 ) ( ON-TABLE ?auto_58500 ) ( ON ?auto_58501 ?auto_58500 ) ( ON ?auto_58502 ?auto_58501 ) ( not ( = ?auto_58500 ?auto_58501 ) ) ( not ( = ?auto_58500 ?auto_58502 ) ) ( not ( = ?auto_58500 ?auto_58505 ) ) ( not ( = ?auto_58501 ?auto_58502 ) ) ( not ( = ?auto_58501 ?auto_58505 ) ) ( not ( = ?auto_58502 ?auto_58505 ) ) ( not ( = ?auto_58500 ?auto_58506 ) ) ( not ( = ?auto_58500 ?auto_58503 ) ) ( not ( = ?auto_58501 ?auto_58506 ) ) ( not ( = ?auto_58501 ?auto_58503 ) ) ( not ( = ?auto_58502 ?auto_58506 ) ) ( not ( = ?auto_58502 ?auto_58503 ) ) ( not ( = ?auto_58505 ?auto_58506 ) ) ( not ( = ?auto_58505 ?auto_58503 ) ) ( not ( = ?auto_58506 ?auto_58503 ) ) ( ON ?auto_58503 ?auto_58504 ) ( not ( = ?auto_58500 ?auto_58504 ) ) ( not ( = ?auto_58501 ?auto_58504 ) ) ( not ( = ?auto_58502 ?auto_58504 ) ) ( not ( = ?auto_58505 ?auto_58504 ) ) ( not ( = ?auto_58506 ?auto_58504 ) ) ( not ( = ?auto_58503 ?auto_58504 ) ) ( CLEAR ?auto_58505 ) ( ON ?auto_58506 ?auto_58503 ) ( CLEAR ?auto_58506 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58504 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58504 ?auto_58503 )
      ( MAKE-3PILE ?auto_58500 ?auto_58501 ?auto_58502 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58521 - BLOCK
      ?auto_58522 - BLOCK
      ?auto_58523 - BLOCK
    )
    :vars
    (
      ?auto_58524 - BLOCK
      ?auto_58527 - BLOCK
      ?auto_58525 - BLOCK
      ?auto_58526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58521 ) ( ON ?auto_58522 ?auto_58521 ) ( not ( = ?auto_58521 ?auto_58522 ) ) ( not ( = ?auto_58521 ?auto_58523 ) ) ( not ( = ?auto_58521 ?auto_58524 ) ) ( not ( = ?auto_58522 ?auto_58523 ) ) ( not ( = ?auto_58522 ?auto_58524 ) ) ( not ( = ?auto_58523 ?auto_58524 ) ) ( not ( = ?auto_58521 ?auto_58527 ) ) ( not ( = ?auto_58521 ?auto_58525 ) ) ( not ( = ?auto_58522 ?auto_58527 ) ) ( not ( = ?auto_58522 ?auto_58525 ) ) ( not ( = ?auto_58523 ?auto_58527 ) ) ( not ( = ?auto_58523 ?auto_58525 ) ) ( not ( = ?auto_58524 ?auto_58527 ) ) ( not ( = ?auto_58524 ?auto_58525 ) ) ( not ( = ?auto_58527 ?auto_58525 ) ) ( ON ?auto_58525 ?auto_58526 ) ( not ( = ?auto_58521 ?auto_58526 ) ) ( not ( = ?auto_58522 ?auto_58526 ) ) ( not ( = ?auto_58523 ?auto_58526 ) ) ( not ( = ?auto_58524 ?auto_58526 ) ) ( not ( = ?auto_58527 ?auto_58526 ) ) ( not ( = ?auto_58525 ?auto_58526 ) ) ( ON ?auto_58527 ?auto_58525 ) ( ON-TABLE ?auto_58526 ) ( ON ?auto_58524 ?auto_58527 ) ( CLEAR ?auto_58524 ) ( HOLDING ?auto_58523 ) ( CLEAR ?auto_58522 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58521 ?auto_58522 ?auto_58523 ?auto_58524 )
      ( MAKE-3PILE ?auto_58521 ?auto_58522 ?auto_58523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58528 - BLOCK
      ?auto_58529 - BLOCK
      ?auto_58530 - BLOCK
    )
    :vars
    (
      ?auto_58532 - BLOCK
      ?auto_58531 - BLOCK
      ?auto_58533 - BLOCK
      ?auto_58534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58528 ) ( ON ?auto_58529 ?auto_58528 ) ( not ( = ?auto_58528 ?auto_58529 ) ) ( not ( = ?auto_58528 ?auto_58530 ) ) ( not ( = ?auto_58528 ?auto_58532 ) ) ( not ( = ?auto_58529 ?auto_58530 ) ) ( not ( = ?auto_58529 ?auto_58532 ) ) ( not ( = ?auto_58530 ?auto_58532 ) ) ( not ( = ?auto_58528 ?auto_58531 ) ) ( not ( = ?auto_58528 ?auto_58533 ) ) ( not ( = ?auto_58529 ?auto_58531 ) ) ( not ( = ?auto_58529 ?auto_58533 ) ) ( not ( = ?auto_58530 ?auto_58531 ) ) ( not ( = ?auto_58530 ?auto_58533 ) ) ( not ( = ?auto_58532 ?auto_58531 ) ) ( not ( = ?auto_58532 ?auto_58533 ) ) ( not ( = ?auto_58531 ?auto_58533 ) ) ( ON ?auto_58533 ?auto_58534 ) ( not ( = ?auto_58528 ?auto_58534 ) ) ( not ( = ?auto_58529 ?auto_58534 ) ) ( not ( = ?auto_58530 ?auto_58534 ) ) ( not ( = ?auto_58532 ?auto_58534 ) ) ( not ( = ?auto_58531 ?auto_58534 ) ) ( not ( = ?auto_58533 ?auto_58534 ) ) ( ON ?auto_58531 ?auto_58533 ) ( ON-TABLE ?auto_58534 ) ( ON ?auto_58532 ?auto_58531 ) ( CLEAR ?auto_58529 ) ( ON ?auto_58530 ?auto_58532 ) ( CLEAR ?auto_58530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58534 ?auto_58533 ?auto_58531 ?auto_58532 )
      ( MAKE-3PILE ?auto_58528 ?auto_58529 ?auto_58530 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58535 - BLOCK
      ?auto_58536 - BLOCK
      ?auto_58537 - BLOCK
    )
    :vars
    (
      ?auto_58540 - BLOCK
      ?auto_58539 - BLOCK
      ?auto_58538 - BLOCK
      ?auto_58541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58535 ) ( not ( = ?auto_58535 ?auto_58536 ) ) ( not ( = ?auto_58535 ?auto_58537 ) ) ( not ( = ?auto_58535 ?auto_58540 ) ) ( not ( = ?auto_58536 ?auto_58537 ) ) ( not ( = ?auto_58536 ?auto_58540 ) ) ( not ( = ?auto_58537 ?auto_58540 ) ) ( not ( = ?auto_58535 ?auto_58539 ) ) ( not ( = ?auto_58535 ?auto_58538 ) ) ( not ( = ?auto_58536 ?auto_58539 ) ) ( not ( = ?auto_58536 ?auto_58538 ) ) ( not ( = ?auto_58537 ?auto_58539 ) ) ( not ( = ?auto_58537 ?auto_58538 ) ) ( not ( = ?auto_58540 ?auto_58539 ) ) ( not ( = ?auto_58540 ?auto_58538 ) ) ( not ( = ?auto_58539 ?auto_58538 ) ) ( ON ?auto_58538 ?auto_58541 ) ( not ( = ?auto_58535 ?auto_58541 ) ) ( not ( = ?auto_58536 ?auto_58541 ) ) ( not ( = ?auto_58537 ?auto_58541 ) ) ( not ( = ?auto_58540 ?auto_58541 ) ) ( not ( = ?auto_58539 ?auto_58541 ) ) ( not ( = ?auto_58538 ?auto_58541 ) ) ( ON ?auto_58539 ?auto_58538 ) ( ON-TABLE ?auto_58541 ) ( ON ?auto_58540 ?auto_58539 ) ( ON ?auto_58537 ?auto_58540 ) ( CLEAR ?auto_58537 ) ( HOLDING ?auto_58536 ) ( CLEAR ?auto_58535 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58535 ?auto_58536 )
      ( MAKE-3PILE ?auto_58535 ?auto_58536 ?auto_58537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58542 - BLOCK
      ?auto_58543 - BLOCK
      ?auto_58544 - BLOCK
    )
    :vars
    (
      ?auto_58545 - BLOCK
      ?auto_58548 - BLOCK
      ?auto_58547 - BLOCK
      ?auto_58546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58542 ) ( not ( = ?auto_58542 ?auto_58543 ) ) ( not ( = ?auto_58542 ?auto_58544 ) ) ( not ( = ?auto_58542 ?auto_58545 ) ) ( not ( = ?auto_58543 ?auto_58544 ) ) ( not ( = ?auto_58543 ?auto_58545 ) ) ( not ( = ?auto_58544 ?auto_58545 ) ) ( not ( = ?auto_58542 ?auto_58548 ) ) ( not ( = ?auto_58542 ?auto_58547 ) ) ( not ( = ?auto_58543 ?auto_58548 ) ) ( not ( = ?auto_58543 ?auto_58547 ) ) ( not ( = ?auto_58544 ?auto_58548 ) ) ( not ( = ?auto_58544 ?auto_58547 ) ) ( not ( = ?auto_58545 ?auto_58548 ) ) ( not ( = ?auto_58545 ?auto_58547 ) ) ( not ( = ?auto_58548 ?auto_58547 ) ) ( ON ?auto_58547 ?auto_58546 ) ( not ( = ?auto_58542 ?auto_58546 ) ) ( not ( = ?auto_58543 ?auto_58546 ) ) ( not ( = ?auto_58544 ?auto_58546 ) ) ( not ( = ?auto_58545 ?auto_58546 ) ) ( not ( = ?auto_58548 ?auto_58546 ) ) ( not ( = ?auto_58547 ?auto_58546 ) ) ( ON ?auto_58548 ?auto_58547 ) ( ON-TABLE ?auto_58546 ) ( ON ?auto_58545 ?auto_58548 ) ( ON ?auto_58544 ?auto_58545 ) ( CLEAR ?auto_58542 ) ( ON ?auto_58543 ?auto_58544 ) ( CLEAR ?auto_58543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58546 ?auto_58547 ?auto_58548 ?auto_58545 ?auto_58544 )
      ( MAKE-3PILE ?auto_58542 ?auto_58543 ?auto_58544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58549 - BLOCK
      ?auto_58550 - BLOCK
      ?auto_58551 - BLOCK
    )
    :vars
    (
      ?auto_58554 - BLOCK
      ?auto_58552 - BLOCK
      ?auto_58555 - BLOCK
      ?auto_58553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58549 ?auto_58550 ) ) ( not ( = ?auto_58549 ?auto_58551 ) ) ( not ( = ?auto_58549 ?auto_58554 ) ) ( not ( = ?auto_58550 ?auto_58551 ) ) ( not ( = ?auto_58550 ?auto_58554 ) ) ( not ( = ?auto_58551 ?auto_58554 ) ) ( not ( = ?auto_58549 ?auto_58552 ) ) ( not ( = ?auto_58549 ?auto_58555 ) ) ( not ( = ?auto_58550 ?auto_58552 ) ) ( not ( = ?auto_58550 ?auto_58555 ) ) ( not ( = ?auto_58551 ?auto_58552 ) ) ( not ( = ?auto_58551 ?auto_58555 ) ) ( not ( = ?auto_58554 ?auto_58552 ) ) ( not ( = ?auto_58554 ?auto_58555 ) ) ( not ( = ?auto_58552 ?auto_58555 ) ) ( ON ?auto_58555 ?auto_58553 ) ( not ( = ?auto_58549 ?auto_58553 ) ) ( not ( = ?auto_58550 ?auto_58553 ) ) ( not ( = ?auto_58551 ?auto_58553 ) ) ( not ( = ?auto_58554 ?auto_58553 ) ) ( not ( = ?auto_58552 ?auto_58553 ) ) ( not ( = ?auto_58555 ?auto_58553 ) ) ( ON ?auto_58552 ?auto_58555 ) ( ON-TABLE ?auto_58553 ) ( ON ?auto_58554 ?auto_58552 ) ( ON ?auto_58551 ?auto_58554 ) ( ON ?auto_58550 ?auto_58551 ) ( CLEAR ?auto_58550 ) ( HOLDING ?auto_58549 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58549 )
      ( MAKE-3PILE ?auto_58549 ?auto_58550 ?auto_58551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58556 - BLOCK
      ?auto_58557 - BLOCK
      ?auto_58558 - BLOCK
    )
    :vars
    (
      ?auto_58562 - BLOCK
      ?auto_58561 - BLOCK
      ?auto_58559 - BLOCK
      ?auto_58560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58556 ?auto_58557 ) ) ( not ( = ?auto_58556 ?auto_58558 ) ) ( not ( = ?auto_58556 ?auto_58562 ) ) ( not ( = ?auto_58557 ?auto_58558 ) ) ( not ( = ?auto_58557 ?auto_58562 ) ) ( not ( = ?auto_58558 ?auto_58562 ) ) ( not ( = ?auto_58556 ?auto_58561 ) ) ( not ( = ?auto_58556 ?auto_58559 ) ) ( not ( = ?auto_58557 ?auto_58561 ) ) ( not ( = ?auto_58557 ?auto_58559 ) ) ( not ( = ?auto_58558 ?auto_58561 ) ) ( not ( = ?auto_58558 ?auto_58559 ) ) ( not ( = ?auto_58562 ?auto_58561 ) ) ( not ( = ?auto_58562 ?auto_58559 ) ) ( not ( = ?auto_58561 ?auto_58559 ) ) ( ON ?auto_58559 ?auto_58560 ) ( not ( = ?auto_58556 ?auto_58560 ) ) ( not ( = ?auto_58557 ?auto_58560 ) ) ( not ( = ?auto_58558 ?auto_58560 ) ) ( not ( = ?auto_58562 ?auto_58560 ) ) ( not ( = ?auto_58561 ?auto_58560 ) ) ( not ( = ?auto_58559 ?auto_58560 ) ) ( ON ?auto_58561 ?auto_58559 ) ( ON-TABLE ?auto_58560 ) ( ON ?auto_58562 ?auto_58561 ) ( ON ?auto_58558 ?auto_58562 ) ( ON ?auto_58557 ?auto_58558 ) ( ON ?auto_58556 ?auto_58557 ) ( CLEAR ?auto_58556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58560 ?auto_58559 ?auto_58561 ?auto_58562 ?auto_58558 ?auto_58557 )
      ( MAKE-3PILE ?auto_58556 ?auto_58557 ?auto_58558 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58566 - BLOCK
      ?auto_58567 - BLOCK
      ?auto_58568 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58568 ) ( CLEAR ?auto_58567 ) ( ON-TABLE ?auto_58566 ) ( ON ?auto_58567 ?auto_58566 ) ( not ( = ?auto_58566 ?auto_58567 ) ) ( not ( = ?auto_58566 ?auto_58568 ) ) ( not ( = ?auto_58567 ?auto_58568 ) ) )
    :subtasks
    ( ( !STACK ?auto_58568 ?auto_58567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58569 - BLOCK
      ?auto_58570 - BLOCK
      ?auto_58571 - BLOCK
    )
    :vars
    (
      ?auto_58572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58570 ) ( ON-TABLE ?auto_58569 ) ( ON ?auto_58570 ?auto_58569 ) ( not ( = ?auto_58569 ?auto_58570 ) ) ( not ( = ?auto_58569 ?auto_58571 ) ) ( not ( = ?auto_58570 ?auto_58571 ) ) ( ON ?auto_58571 ?auto_58572 ) ( CLEAR ?auto_58571 ) ( HAND-EMPTY ) ( not ( = ?auto_58569 ?auto_58572 ) ) ( not ( = ?auto_58570 ?auto_58572 ) ) ( not ( = ?auto_58571 ?auto_58572 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58571 ?auto_58572 )
      ( MAKE-3PILE ?auto_58569 ?auto_58570 ?auto_58571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58573 - BLOCK
      ?auto_58574 - BLOCK
      ?auto_58575 - BLOCK
    )
    :vars
    (
      ?auto_58576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58573 ) ( not ( = ?auto_58573 ?auto_58574 ) ) ( not ( = ?auto_58573 ?auto_58575 ) ) ( not ( = ?auto_58574 ?auto_58575 ) ) ( ON ?auto_58575 ?auto_58576 ) ( CLEAR ?auto_58575 ) ( not ( = ?auto_58573 ?auto_58576 ) ) ( not ( = ?auto_58574 ?auto_58576 ) ) ( not ( = ?auto_58575 ?auto_58576 ) ) ( HOLDING ?auto_58574 ) ( CLEAR ?auto_58573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58573 ?auto_58574 )
      ( MAKE-3PILE ?auto_58573 ?auto_58574 ?auto_58575 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58577 - BLOCK
      ?auto_58578 - BLOCK
      ?auto_58579 - BLOCK
    )
    :vars
    (
      ?auto_58580 - BLOCK
      ?auto_58581 - BLOCK
      ?auto_58582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58577 ) ( not ( = ?auto_58577 ?auto_58578 ) ) ( not ( = ?auto_58577 ?auto_58579 ) ) ( not ( = ?auto_58578 ?auto_58579 ) ) ( ON ?auto_58579 ?auto_58580 ) ( not ( = ?auto_58577 ?auto_58580 ) ) ( not ( = ?auto_58578 ?auto_58580 ) ) ( not ( = ?auto_58579 ?auto_58580 ) ) ( CLEAR ?auto_58577 ) ( ON ?auto_58578 ?auto_58579 ) ( CLEAR ?auto_58578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58581 ) ( ON ?auto_58582 ?auto_58581 ) ( ON ?auto_58580 ?auto_58582 ) ( not ( = ?auto_58581 ?auto_58582 ) ) ( not ( = ?auto_58581 ?auto_58580 ) ) ( not ( = ?auto_58581 ?auto_58579 ) ) ( not ( = ?auto_58581 ?auto_58578 ) ) ( not ( = ?auto_58582 ?auto_58580 ) ) ( not ( = ?auto_58582 ?auto_58579 ) ) ( not ( = ?auto_58582 ?auto_58578 ) ) ( not ( = ?auto_58577 ?auto_58581 ) ) ( not ( = ?auto_58577 ?auto_58582 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58581 ?auto_58582 ?auto_58580 ?auto_58579 )
      ( MAKE-3PILE ?auto_58577 ?auto_58578 ?auto_58579 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58583 - BLOCK
      ?auto_58584 - BLOCK
      ?auto_58585 - BLOCK
    )
    :vars
    (
      ?auto_58586 - BLOCK
      ?auto_58588 - BLOCK
      ?auto_58587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58583 ?auto_58584 ) ) ( not ( = ?auto_58583 ?auto_58585 ) ) ( not ( = ?auto_58584 ?auto_58585 ) ) ( ON ?auto_58585 ?auto_58586 ) ( not ( = ?auto_58583 ?auto_58586 ) ) ( not ( = ?auto_58584 ?auto_58586 ) ) ( not ( = ?auto_58585 ?auto_58586 ) ) ( ON ?auto_58584 ?auto_58585 ) ( CLEAR ?auto_58584 ) ( ON-TABLE ?auto_58588 ) ( ON ?auto_58587 ?auto_58588 ) ( ON ?auto_58586 ?auto_58587 ) ( not ( = ?auto_58588 ?auto_58587 ) ) ( not ( = ?auto_58588 ?auto_58586 ) ) ( not ( = ?auto_58588 ?auto_58585 ) ) ( not ( = ?auto_58588 ?auto_58584 ) ) ( not ( = ?auto_58587 ?auto_58586 ) ) ( not ( = ?auto_58587 ?auto_58585 ) ) ( not ( = ?auto_58587 ?auto_58584 ) ) ( not ( = ?auto_58583 ?auto_58588 ) ) ( not ( = ?auto_58583 ?auto_58587 ) ) ( HOLDING ?auto_58583 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58583 )
      ( MAKE-3PILE ?auto_58583 ?auto_58584 ?auto_58585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58589 - BLOCK
      ?auto_58590 - BLOCK
      ?auto_58591 - BLOCK
    )
    :vars
    (
      ?auto_58592 - BLOCK
      ?auto_58594 - BLOCK
      ?auto_58593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58589 ?auto_58590 ) ) ( not ( = ?auto_58589 ?auto_58591 ) ) ( not ( = ?auto_58590 ?auto_58591 ) ) ( ON ?auto_58591 ?auto_58592 ) ( not ( = ?auto_58589 ?auto_58592 ) ) ( not ( = ?auto_58590 ?auto_58592 ) ) ( not ( = ?auto_58591 ?auto_58592 ) ) ( ON ?auto_58590 ?auto_58591 ) ( ON-TABLE ?auto_58594 ) ( ON ?auto_58593 ?auto_58594 ) ( ON ?auto_58592 ?auto_58593 ) ( not ( = ?auto_58594 ?auto_58593 ) ) ( not ( = ?auto_58594 ?auto_58592 ) ) ( not ( = ?auto_58594 ?auto_58591 ) ) ( not ( = ?auto_58594 ?auto_58590 ) ) ( not ( = ?auto_58593 ?auto_58592 ) ) ( not ( = ?auto_58593 ?auto_58591 ) ) ( not ( = ?auto_58593 ?auto_58590 ) ) ( not ( = ?auto_58589 ?auto_58594 ) ) ( not ( = ?auto_58589 ?auto_58593 ) ) ( ON ?auto_58589 ?auto_58590 ) ( CLEAR ?auto_58589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58594 ?auto_58593 ?auto_58592 ?auto_58591 ?auto_58590 )
      ( MAKE-3PILE ?auto_58589 ?auto_58590 ?auto_58591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58595 - BLOCK
      ?auto_58596 - BLOCK
      ?auto_58597 - BLOCK
    )
    :vars
    (
      ?auto_58598 - BLOCK
      ?auto_58600 - BLOCK
      ?auto_58599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58595 ?auto_58596 ) ) ( not ( = ?auto_58595 ?auto_58597 ) ) ( not ( = ?auto_58596 ?auto_58597 ) ) ( ON ?auto_58597 ?auto_58598 ) ( not ( = ?auto_58595 ?auto_58598 ) ) ( not ( = ?auto_58596 ?auto_58598 ) ) ( not ( = ?auto_58597 ?auto_58598 ) ) ( ON ?auto_58596 ?auto_58597 ) ( ON-TABLE ?auto_58600 ) ( ON ?auto_58599 ?auto_58600 ) ( ON ?auto_58598 ?auto_58599 ) ( not ( = ?auto_58600 ?auto_58599 ) ) ( not ( = ?auto_58600 ?auto_58598 ) ) ( not ( = ?auto_58600 ?auto_58597 ) ) ( not ( = ?auto_58600 ?auto_58596 ) ) ( not ( = ?auto_58599 ?auto_58598 ) ) ( not ( = ?auto_58599 ?auto_58597 ) ) ( not ( = ?auto_58599 ?auto_58596 ) ) ( not ( = ?auto_58595 ?auto_58600 ) ) ( not ( = ?auto_58595 ?auto_58599 ) ) ( HOLDING ?auto_58595 ) ( CLEAR ?auto_58596 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58600 ?auto_58599 ?auto_58598 ?auto_58597 ?auto_58596 ?auto_58595 )
      ( MAKE-3PILE ?auto_58595 ?auto_58596 ?auto_58597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58601 - BLOCK
      ?auto_58602 - BLOCK
      ?auto_58603 - BLOCK
    )
    :vars
    (
      ?auto_58605 - BLOCK
      ?auto_58604 - BLOCK
      ?auto_58606 - BLOCK
      ?auto_58607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58601 ?auto_58602 ) ) ( not ( = ?auto_58601 ?auto_58603 ) ) ( not ( = ?auto_58602 ?auto_58603 ) ) ( ON ?auto_58603 ?auto_58605 ) ( not ( = ?auto_58601 ?auto_58605 ) ) ( not ( = ?auto_58602 ?auto_58605 ) ) ( not ( = ?auto_58603 ?auto_58605 ) ) ( ON ?auto_58602 ?auto_58603 ) ( ON-TABLE ?auto_58604 ) ( ON ?auto_58606 ?auto_58604 ) ( ON ?auto_58605 ?auto_58606 ) ( not ( = ?auto_58604 ?auto_58606 ) ) ( not ( = ?auto_58604 ?auto_58605 ) ) ( not ( = ?auto_58604 ?auto_58603 ) ) ( not ( = ?auto_58604 ?auto_58602 ) ) ( not ( = ?auto_58606 ?auto_58605 ) ) ( not ( = ?auto_58606 ?auto_58603 ) ) ( not ( = ?auto_58606 ?auto_58602 ) ) ( not ( = ?auto_58601 ?auto_58604 ) ) ( not ( = ?auto_58601 ?auto_58606 ) ) ( CLEAR ?auto_58602 ) ( ON ?auto_58601 ?auto_58607 ) ( CLEAR ?auto_58601 ) ( HAND-EMPTY ) ( not ( = ?auto_58601 ?auto_58607 ) ) ( not ( = ?auto_58602 ?auto_58607 ) ) ( not ( = ?auto_58603 ?auto_58607 ) ) ( not ( = ?auto_58605 ?auto_58607 ) ) ( not ( = ?auto_58604 ?auto_58607 ) ) ( not ( = ?auto_58606 ?auto_58607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58601 ?auto_58607 )
      ( MAKE-3PILE ?auto_58601 ?auto_58602 ?auto_58603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58608 - BLOCK
      ?auto_58609 - BLOCK
      ?auto_58610 - BLOCK
    )
    :vars
    (
      ?auto_58613 - BLOCK
      ?auto_58611 - BLOCK
      ?auto_58612 - BLOCK
      ?auto_58614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58608 ?auto_58609 ) ) ( not ( = ?auto_58608 ?auto_58610 ) ) ( not ( = ?auto_58609 ?auto_58610 ) ) ( ON ?auto_58610 ?auto_58613 ) ( not ( = ?auto_58608 ?auto_58613 ) ) ( not ( = ?auto_58609 ?auto_58613 ) ) ( not ( = ?auto_58610 ?auto_58613 ) ) ( ON-TABLE ?auto_58611 ) ( ON ?auto_58612 ?auto_58611 ) ( ON ?auto_58613 ?auto_58612 ) ( not ( = ?auto_58611 ?auto_58612 ) ) ( not ( = ?auto_58611 ?auto_58613 ) ) ( not ( = ?auto_58611 ?auto_58610 ) ) ( not ( = ?auto_58611 ?auto_58609 ) ) ( not ( = ?auto_58612 ?auto_58613 ) ) ( not ( = ?auto_58612 ?auto_58610 ) ) ( not ( = ?auto_58612 ?auto_58609 ) ) ( not ( = ?auto_58608 ?auto_58611 ) ) ( not ( = ?auto_58608 ?auto_58612 ) ) ( ON ?auto_58608 ?auto_58614 ) ( CLEAR ?auto_58608 ) ( not ( = ?auto_58608 ?auto_58614 ) ) ( not ( = ?auto_58609 ?auto_58614 ) ) ( not ( = ?auto_58610 ?auto_58614 ) ) ( not ( = ?auto_58613 ?auto_58614 ) ) ( not ( = ?auto_58611 ?auto_58614 ) ) ( not ( = ?auto_58612 ?auto_58614 ) ) ( HOLDING ?auto_58609 ) ( CLEAR ?auto_58610 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58611 ?auto_58612 ?auto_58613 ?auto_58610 ?auto_58609 )
      ( MAKE-3PILE ?auto_58608 ?auto_58609 ?auto_58610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58615 - BLOCK
      ?auto_58616 - BLOCK
      ?auto_58617 - BLOCK
    )
    :vars
    (
      ?auto_58621 - BLOCK
      ?auto_58619 - BLOCK
      ?auto_58620 - BLOCK
      ?auto_58618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58615 ?auto_58616 ) ) ( not ( = ?auto_58615 ?auto_58617 ) ) ( not ( = ?auto_58616 ?auto_58617 ) ) ( ON ?auto_58617 ?auto_58621 ) ( not ( = ?auto_58615 ?auto_58621 ) ) ( not ( = ?auto_58616 ?auto_58621 ) ) ( not ( = ?auto_58617 ?auto_58621 ) ) ( ON-TABLE ?auto_58619 ) ( ON ?auto_58620 ?auto_58619 ) ( ON ?auto_58621 ?auto_58620 ) ( not ( = ?auto_58619 ?auto_58620 ) ) ( not ( = ?auto_58619 ?auto_58621 ) ) ( not ( = ?auto_58619 ?auto_58617 ) ) ( not ( = ?auto_58619 ?auto_58616 ) ) ( not ( = ?auto_58620 ?auto_58621 ) ) ( not ( = ?auto_58620 ?auto_58617 ) ) ( not ( = ?auto_58620 ?auto_58616 ) ) ( not ( = ?auto_58615 ?auto_58619 ) ) ( not ( = ?auto_58615 ?auto_58620 ) ) ( ON ?auto_58615 ?auto_58618 ) ( not ( = ?auto_58615 ?auto_58618 ) ) ( not ( = ?auto_58616 ?auto_58618 ) ) ( not ( = ?auto_58617 ?auto_58618 ) ) ( not ( = ?auto_58621 ?auto_58618 ) ) ( not ( = ?auto_58619 ?auto_58618 ) ) ( not ( = ?auto_58620 ?auto_58618 ) ) ( CLEAR ?auto_58617 ) ( ON ?auto_58616 ?auto_58615 ) ( CLEAR ?auto_58616 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58618 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58618 ?auto_58615 )
      ( MAKE-3PILE ?auto_58615 ?auto_58616 ?auto_58617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58622 - BLOCK
      ?auto_58623 - BLOCK
      ?auto_58624 - BLOCK
    )
    :vars
    (
      ?auto_58625 - BLOCK
      ?auto_58626 - BLOCK
      ?auto_58628 - BLOCK
      ?auto_58627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58622 ?auto_58623 ) ) ( not ( = ?auto_58622 ?auto_58624 ) ) ( not ( = ?auto_58623 ?auto_58624 ) ) ( not ( = ?auto_58622 ?auto_58625 ) ) ( not ( = ?auto_58623 ?auto_58625 ) ) ( not ( = ?auto_58624 ?auto_58625 ) ) ( ON-TABLE ?auto_58626 ) ( ON ?auto_58628 ?auto_58626 ) ( ON ?auto_58625 ?auto_58628 ) ( not ( = ?auto_58626 ?auto_58628 ) ) ( not ( = ?auto_58626 ?auto_58625 ) ) ( not ( = ?auto_58626 ?auto_58624 ) ) ( not ( = ?auto_58626 ?auto_58623 ) ) ( not ( = ?auto_58628 ?auto_58625 ) ) ( not ( = ?auto_58628 ?auto_58624 ) ) ( not ( = ?auto_58628 ?auto_58623 ) ) ( not ( = ?auto_58622 ?auto_58626 ) ) ( not ( = ?auto_58622 ?auto_58628 ) ) ( ON ?auto_58622 ?auto_58627 ) ( not ( = ?auto_58622 ?auto_58627 ) ) ( not ( = ?auto_58623 ?auto_58627 ) ) ( not ( = ?auto_58624 ?auto_58627 ) ) ( not ( = ?auto_58625 ?auto_58627 ) ) ( not ( = ?auto_58626 ?auto_58627 ) ) ( not ( = ?auto_58628 ?auto_58627 ) ) ( ON ?auto_58623 ?auto_58622 ) ( CLEAR ?auto_58623 ) ( ON-TABLE ?auto_58627 ) ( HOLDING ?auto_58624 ) ( CLEAR ?auto_58625 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58626 ?auto_58628 ?auto_58625 ?auto_58624 )
      ( MAKE-3PILE ?auto_58622 ?auto_58623 ?auto_58624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58629 - BLOCK
      ?auto_58630 - BLOCK
      ?auto_58631 - BLOCK
    )
    :vars
    (
      ?auto_58633 - BLOCK
      ?auto_58634 - BLOCK
      ?auto_58635 - BLOCK
      ?auto_58632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58629 ?auto_58630 ) ) ( not ( = ?auto_58629 ?auto_58631 ) ) ( not ( = ?auto_58630 ?auto_58631 ) ) ( not ( = ?auto_58629 ?auto_58633 ) ) ( not ( = ?auto_58630 ?auto_58633 ) ) ( not ( = ?auto_58631 ?auto_58633 ) ) ( ON-TABLE ?auto_58634 ) ( ON ?auto_58635 ?auto_58634 ) ( ON ?auto_58633 ?auto_58635 ) ( not ( = ?auto_58634 ?auto_58635 ) ) ( not ( = ?auto_58634 ?auto_58633 ) ) ( not ( = ?auto_58634 ?auto_58631 ) ) ( not ( = ?auto_58634 ?auto_58630 ) ) ( not ( = ?auto_58635 ?auto_58633 ) ) ( not ( = ?auto_58635 ?auto_58631 ) ) ( not ( = ?auto_58635 ?auto_58630 ) ) ( not ( = ?auto_58629 ?auto_58634 ) ) ( not ( = ?auto_58629 ?auto_58635 ) ) ( ON ?auto_58629 ?auto_58632 ) ( not ( = ?auto_58629 ?auto_58632 ) ) ( not ( = ?auto_58630 ?auto_58632 ) ) ( not ( = ?auto_58631 ?auto_58632 ) ) ( not ( = ?auto_58633 ?auto_58632 ) ) ( not ( = ?auto_58634 ?auto_58632 ) ) ( not ( = ?auto_58635 ?auto_58632 ) ) ( ON ?auto_58630 ?auto_58629 ) ( ON-TABLE ?auto_58632 ) ( CLEAR ?auto_58633 ) ( ON ?auto_58631 ?auto_58630 ) ( CLEAR ?auto_58631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58632 ?auto_58629 ?auto_58630 )
      ( MAKE-3PILE ?auto_58629 ?auto_58630 ?auto_58631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58636 - BLOCK
      ?auto_58637 - BLOCK
      ?auto_58638 - BLOCK
    )
    :vars
    (
      ?auto_58641 - BLOCK
      ?auto_58642 - BLOCK
      ?auto_58640 - BLOCK
      ?auto_58639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58636 ?auto_58637 ) ) ( not ( = ?auto_58636 ?auto_58638 ) ) ( not ( = ?auto_58637 ?auto_58638 ) ) ( not ( = ?auto_58636 ?auto_58641 ) ) ( not ( = ?auto_58637 ?auto_58641 ) ) ( not ( = ?auto_58638 ?auto_58641 ) ) ( ON-TABLE ?auto_58642 ) ( ON ?auto_58640 ?auto_58642 ) ( not ( = ?auto_58642 ?auto_58640 ) ) ( not ( = ?auto_58642 ?auto_58641 ) ) ( not ( = ?auto_58642 ?auto_58638 ) ) ( not ( = ?auto_58642 ?auto_58637 ) ) ( not ( = ?auto_58640 ?auto_58641 ) ) ( not ( = ?auto_58640 ?auto_58638 ) ) ( not ( = ?auto_58640 ?auto_58637 ) ) ( not ( = ?auto_58636 ?auto_58642 ) ) ( not ( = ?auto_58636 ?auto_58640 ) ) ( ON ?auto_58636 ?auto_58639 ) ( not ( = ?auto_58636 ?auto_58639 ) ) ( not ( = ?auto_58637 ?auto_58639 ) ) ( not ( = ?auto_58638 ?auto_58639 ) ) ( not ( = ?auto_58641 ?auto_58639 ) ) ( not ( = ?auto_58642 ?auto_58639 ) ) ( not ( = ?auto_58640 ?auto_58639 ) ) ( ON ?auto_58637 ?auto_58636 ) ( ON-TABLE ?auto_58639 ) ( ON ?auto_58638 ?auto_58637 ) ( CLEAR ?auto_58638 ) ( HOLDING ?auto_58641 ) ( CLEAR ?auto_58640 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58642 ?auto_58640 ?auto_58641 )
      ( MAKE-3PILE ?auto_58636 ?auto_58637 ?auto_58638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58643 - BLOCK
      ?auto_58644 - BLOCK
      ?auto_58645 - BLOCK
    )
    :vars
    (
      ?auto_58649 - BLOCK
      ?auto_58646 - BLOCK
      ?auto_58648 - BLOCK
      ?auto_58647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58643 ?auto_58644 ) ) ( not ( = ?auto_58643 ?auto_58645 ) ) ( not ( = ?auto_58644 ?auto_58645 ) ) ( not ( = ?auto_58643 ?auto_58649 ) ) ( not ( = ?auto_58644 ?auto_58649 ) ) ( not ( = ?auto_58645 ?auto_58649 ) ) ( ON-TABLE ?auto_58646 ) ( ON ?auto_58648 ?auto_58646 ) ( not ( = ?auto_58646 ?auto_58648 ) ) ( not ( = ?auto_58646 ?auto_58649 ) ) ( not ( = ?auto_58646 ?auto_58645 ) ) ( not ( = ?auto_58646 ?auto_58644 ) ) ( not ( = ?auto_58648 ?auto_58649 ) ) ( not ( = ?auto_58648 ?auto_58645 ) ) ( not ( = ?auto_58648 ?auto_58644 ) ) ( not ( = ?auto_58643 ?auto_58646 ) ) ( not ( = ?auto_58643 ?auto_58648 ) ) ( ON ?auto_58643 ?auto_58647 ) ( not ( = ?auto_58643 ?auto_58647 ) ) ( not ( = ?auto_58644 ?auto_58647 ) ) ( not ( = ?auto_58645 ?auto_58647 ) ) ( not ( = ?auto_58649 ?auto_58647 ) ) ( not ( = ?auto_58646 ?auto_58647 ) ) ( not ( = ?auto_58648 ?auto_58647 ) ) ( ON ?auto_58644 ?auto_58643 ) ( ON-TABLE ?auto_58647 ) ( ON ?auto_58645 ?auto_58644 ) ( CLEAR ?auto_58648 ) ( ON ?auto_58649 ?auto_58645 ) ( CLEAR ?auto_58649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58647 ?auto_58643 ?auto_58644 ?auto_58645 )
      ( MAKE-3PILE ?auto_58643 ?auto_58644 ?auto_58645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58650 - BLOCK
      ?auto_58651 - BLOCK
      ?auto_58652 - BLOCK
    )
    :vars
    (
      ?auto_58653 - BLOCK
      ?auto_58656 - BLOCK
      ?auto_58654 - BLOCK
      ?auto_58655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58650 ?auto_58651 ) ) ( not ( = ?auto_58650 ?auto_58652 ) ) ( not ( = ?auto_58651 ?auto_58652 ) ) ( not ( = ?auto_58650 ?auto_58653 ) ) ( not ( = ?auto_58651 ?auto_58653 ) ) ( not ( = ?auto_58652 ?auto_58653 ) ) ( ON-TABLE ?auto_58656 ) ( not ( = ?auto_58656 ?auto_58654 ) ) ( not ( = ?auto_58656 ?auto_58653 ) ) ( not ( = ?auto_58656 ?auto_58652 ) ) ( not ( = ?auto_58656 ?auto_58651 ) ) ( not ( = ?auto_58654 ?auto_58653 ) ) ( not ( = ?auto_58654 ?auto_58652 ) ) ( not ( = ?auto_58654 ?auto_58651 ) ) ( not ( = ?auto_58650 ?auto_58656 ) ) ( not ( = ?auto_58650 ?auto_58654 ) ) ( ON ?auto_58650 ?auto_58655 ) ( not ( = ?auto_58650 ?auto_58655 ) ) ( not ( = ?auto_58651 ?auto_58655 ) ) ( not ( = ?auto_58652 ?auto_58655 ) ) ( not ( = ?auto_58653 ?auto_58655 ) ) ( not ( = ?auto_58656 ?auto_58655 ) ) ( not ( = ?auto_58654 ?auto_58655 ) ) ( ON ?auto_58651 ?auto_58650 ) ( ON-TABLE ?auto_58655 ) ( ON ?auto_58652 ?auto_58651 ) ( ON ?auto_58653 ?auto_58652 ) ( CLEAR ?auto_58653 ) ( HOLDING ?auto_58654 ) ( CLEAR ?auto_58656 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58656 ?auto_58654 )
      ( MAKE-3PILE ?auto_58650 ?auto_58651 ?auto_58652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58657 - BLOCK
      ?auto_58658 - BLOCK
      ?auto_58659 - BLOCK
    )
    :vars
    (
      ?auto_58660 - BLOCK
      ?auto_58661 - BLOCK
      ?auto_58662 - BLOCK
      ?auto_58663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58657 ?auto_58658 ) ) ( not ( = ?auto_58657 ?auto_58659 ) ) ( not ( = ?auto_58658 ?auto_58659 ) ) ( not ( = ?auto_58657 ?auto_58660 ) ) ( not ( = ?auto_58658 ?auto_58660 ) ) ( not ( = ?auto_58659 ?auto_58660 ) ) ( ON-TABLE ?auto_58661 ) ( not ( = ?auto_58661 ?auto_58662 ) ) ( not ( = ?auto_58661 ?auto_58660 ) ) ( not ( = ?auto_58661 ?auto_58659 ) ) ( not ( = ?auto_58661 ?auto_58658 ) ) ( not ( = ?auto_58662 ?auto_58660 ) ) ( not ( = ?auto_58662 ?auto_58659 ) ) ( not ( = ?auto_58662 ?auto_58658 ) ) ( not ( = ?auto_58657 ?auto_58661 ) ) ( not ( = ?auto_58657 ?auto_58662 ) ) ( ON ?auto_58657 ?auto_58663 ) ( not ( = ?auto_58657 ?auto_58663 ) ) ( not ( = ?auto_58658 ?auto_58663 ) ) ( not ( = ?auto_58659 ?auto_58663 ) ) ( not ( = ?auto_58660 ?auto_58663 ) ) ( not ( = ?auto_58661 ?auto_58663 ) ) ( not ( = ?auto_58662 ?auto_58663 ) ) ( ON ?auto_58658 ?auto_58657 ) ( ON-TABLE ?auto_58663 ) ( ON ?auto_58659 ?auto_58658 ) ( ON ?auto_58660 ?auto_58659 ) ( CLEAR ?auto_58661 ) ( ON ?auto_58662 ?auto_58660 ) ( CLEAR ?auto_58662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58663 ?auto_58657 ?auto_58658 ?auto_58659 ?auto_58660 )
      ( MAKE-3PILE ?auto_58657 ?auto_58658 ?auto_58659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58664 - BLOCK
      ?auto_58665 - BLOCK
      ?auto_58666 - BLOCK
    )
    :vars
    (
      ?auto_58667 - BLOCK
      ?auto_58670 - BLOCK
      ?auto_58668 - BLOCK
      ?auto_58669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58664 ?auto_58665 ) ) ( not ( = ?auto_58664 ?auto_58666 ) ) ( not ( = ?auto_58665 ?auto_58666 ) ) ( not ( = ?auto_58664 ?auto_58667 ) ) ( not ( = ?auto_58665 ?auto_58667 ) ) ( not ( = ?auto_58666 ?auto_58667 ) ) ( not ( = ?auto_58670 ?auto_58668 ) ) ( not ( = ?auto_58670 ?auto_58667 ) ) ( not ( = ?auto_58670 ?auto_58666 ) ) ( not ( = ?auto_58670 ?auto_58665 ) ) ( not ( = ?auto_58668 ?auto_58667 ) ) ( not ( = ?auto_58668 ?auto_58666 ) ) ( not ( = ?auto_58668 ?auto_58665 ) ) ( not ( = ?auto_58664 ?auto_58670 ) ) ( not ( = ?auto_58664 ?auto_58668 ) ) ( ON ?auto_58664 ?auto_58669 ) ( not ( = ?auto_58664 ?auto_58669 ) ) ( not ( = ?auto_58665 ?auto_58669 ) ) ( not ( = ?auto_58666 ?auto_58669 ) ) ( not ( = ?auto_58667 ?auto_58669 ) ) ( not ( = ?auto_58670 ?auto_58669 ) ) ( not ( = ?auto_58668 ?auto_58669 ) ) ( ON ?auto_58665 ?auto_58664 ) ( ON-TABLE ?auto_58669 ) ( ON ?auto_58666 ?auto_58665 ) ( ON ?auto_58667 ?auto_58666 ) ( ON ?auto_58668 ?auto_58667 ) ( CLEAR ?auto_58668 ) ( HOLDING ?auto_58670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58670 )
      ( MAKE-3PILE ?auto_58664 ?auto_58665 ?auto_58666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_58671 - BLOCK
      ?auto_58672 - BLOCK
      ?auto_58673 - BLOCK
    )
    :vars
    (
      ?auto_58675 - BLOCK
      ?auto_58677 - BLOCK
      ?auto_58676 - BLOCK
      ?auto_58674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58671 ?auto_58672 ) ) ( not ( = ?auto_58671 ?auto_58673 ) ) ( not ( = ?auto_58672 ?auto_58673 ) ) ( not ( = ?auto_58671 ?auto_58675 ) ) ( not ( = ?auto_58672 ?auto_58675 ) ) ( not ( = ?auto_58673 ?auto_58675 ) ) ( not ( = ?auto_58677 ?auto_58676 ) ) ( not ( = ?auto_58677 ?auto_58675 ) ) ( not ( = ?auto_58677 ?auto_58673 ) ) ( not ( = ?auto_58677 ?auto_58672 ) ) ( not ( = ?auto_58676 ?auto_58675 ) ) ( not ( = ?auto_58676 ?auto_58673 ) ) ( not ( = ?auto_58676 ?auto_58672 ) ) ( not ( = ?auto_58671 ?auto_58677 ) ) ( not ( = ?auto_58671 ?auto_58676 ) ) ( ON ?auto_58671 ?auto_58674 ) ( not ( = ?auto_58671 ?auto_58674 ) ) ( not ( = ?auto_58672 ?auto_58674 ) ) ( not ( = ?auto_58673 ?auto_58674 ) ) ( not ( = ?auto_58675 ?auto_58674 ) ) ( not ( = ?auto_58677 ?auto_58674 ) ) ( not ( = ?auto_58676 ?auto_58674 ) ) ( ON ?auto_58672 ?auto_58671 ) ( ON-TABLE ?auto_58674 ) ( ON ?auto_58673 ?auto_58672 ) ( ON ?auto_58675 ?auto_58673 ) ( ON ?auto_58676 ?auto_58675 ) ( ON ?auto_58677 ?auto_58676 ) ( CLEAR ?auto_58677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58674 ?auto_58671 ?auto_58672 ?auto_58673 ?auto_58675 ?auto_58676 )
      ( MAKE-3PILE ?auto_58671 ?auto_58672 ?auto_58673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58680 - BLOCK
      ?auto_58681 - BLOCK
    )
    :vars
    (
      ?auto_58682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58682 ?auto_58681 ) ( CLEAR ?auto_58682 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58680 ) ( ON ?auto_58681 ?auto_58680 ) ( not ( = ?auto_58680 ?auto_58681 ) ) ( not ( = ?auto_58680 ?auto_58682 ) ) ( not ( = ?auto_58681 ?auto_58682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58682 ?auto_58681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58683 - BLOCK
      ?auto_58684 - BLOCK
    )
    :vars
    (
      ?auto_58685 - BLOCK
      ?auto_58686 - BLOCK
      ?auto_58687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58685 ?auto_58684 ) ( CLEAR ?auto_58685 ) ( ON-TABLE ?auto_58683 ) ( ON ?auto_58684 ?auto_58683 ) ( not ( = ?auto_58683 ?auto_58684 ) ) ( not ( = ?auto_58683 ?auto_58685 ) ) ( not ( = ?auto_58684 ?auto_58685 ) ) ( HOLDING ?auto_58686 ) ( CLEAR ?auto_58687 ) ( not ( = ?auto_58683 ?auto_58686 ) ) ( not ( = ?auto_58683 ?auto_58687 ) ) ( not ( = ?auto_58684 ?auto_58686 ) ) ( not ( = ?auto_58684 ?auto_58687 ) ) ( not ( = ?auto_58685 ?auto_58686 ) ) ( not ( = ?auto_58685 ?auto_58687 ) ) ( not ( = ?auto_58686 ?auto_58687 ) ) )
    :subtasks
    ( ( !STACK ?auto_58686 ?auto_58687 )
      ( MAKE-2PILE ?auto_58683 ?auto_58684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58688 - BLOCK
      ?auto_58689 - BLOCK
    )
    :vars
    (
      ?auto_58691 - BLOCK
      ?auto_58690 - BLOCK
      ?auto_58692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58691 ?auto_58689 ) ( ON-TABLE ?auto_58688 ) ( ON ?auto_58689 ?auto_58688 ) ( not ( = ?auto_58688 ?auto_58689 ) ) ( not ( = ?auto_58688 ?auto_58691 ) ) ( not ( = ?auto_58689 ?auto_58691 ) ) ( CLEAR ?auto_58690 ) ( not ( = ?auto_58688 ?auto_58692 ) ) ( not ( = ?auto_58688 ?auto_58690 ) ) ( not ( = ?auto_58689 ?auto_58692 ) ) ( not ( = ?auto_58689 ?auto_58690 ) ) ( not ( = ?auto_58691 ?auto_58692 ) ) ( not ( = ?auto_58691 ?auto_58690 ) ) ( not ( = ?auto_58692 ?auto_58690 ) ) ( ON ?auto_58692 ?auto_58691 ) ( CLEAR ?auto_58692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58688 ?auto_58689 ?auto_58691 )
      ( MAKE-2PILE ?auto_58688 ?auto_58689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58693 - BLOCK
      ?auto_58694 - BLOCK
    )
    :vars
    (
      ?auto_58697 - BLOCK
      ?auto_58695 - BLOCK
      ?auto_58696 - BLOCK
      ?auto_58698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58697 ?auto_58694 ) ( ON-TABLE ?auto_58693 ) ( ON ?auto_58694 ?auto_58693 ) ( not ( = ?auto_58693 ?auto_58694 ) ) ( not ( = ?auto_58693 ?auto_58697 ) ) ( not ( = ?auto_58694 ?auto_58697 ) ) ( not ( = ?auto_58693 ?auto_58695 ) ) ( not ( = ?auto_58693 ?auto_58696 ) ) ( not ( = ?auto_58694 ?auto_58695 ) ) ( not ( = ?auto_58694 ?auto_58696 ) ) ( not ( = ?auto_58697 ?auto_58695 ) ) ( not ( = ?auto_58697 ?auto_58696 ) ) ( not ( = ?auto_58695 ?auto_58696 ) ) ( ON ?auto_58695 ?auto_58697 ) ( CLEAR ?auto_58695 ) ( HOLDING ?auto_58696 ) ( CLEAR ?auto_58698 ) ( ON-TABLE ?auto_58698 ) ( not ( = ?auto_58698 ?auto_58696 ) ) ( not ( = ?auto_58693 ?auto_58698 ) ) ( not ( = ?auto_58694 ?auto_58698 ) ) ( not ( = ?auto_58697 ?auto_58698 ) ) ( not ( = ?auto_58695 ?auto_58698 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58698 ?auto_58696 )
      ( MAKE-2PILE ?auto_58693 ?auto_58694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58699 - BLOCK
      ?auto_58700 - BLOCK
    )
    :vars
    (
      ?auto_58702 - BLOCK
      ?auto_58704 - BLOCK
      ?auto_58703 - BLOCK
      ?auto_58701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58702 ?auto_58700 ) ( ON-TABLE ?auto_58699 ) ( ON ?auto_58700 ?auto_58699 ) ( not ( = ?auto_58699 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58702 ) ) ( not ( = ?auto_58700 ?auto_58702 ) ) ( not ( = ?auto_58699 ?auto_58704 ) ) ( not ( = ?auto_58699 ?auto_58703 ) ) ( not ( = ?auto_58700 ?auto_58704 ) ) ( not ( = ?auto_58700 ?auto_58703 ) ) ( not ( = ?auto_58702 ?auto_58704 ) ) ( not ( = ?auto_58702 ?auto_58703 ) ) ( not ( = ?auto_58704 ?auto_58703 ) ) ( ON ?auto_58704 ?auto_58702 ) ( CLEAR ?auto_58701 ) ( ON-TABLE ?auto_58701 ) ( not ( = ?auto_58701 ?auto_58703 ) ) ( not ( = ?auto_58699 ?auto_58701 ) ) ( not ( = ?auto_58700 ?auto_58701 ) ) ( not ( = ?auto_58702 ?auto_58701 ) ) ( not ( = ?auto_58704 ?auto_58701 ) ) ( ON ?auto_58703 ?auto_58704 ) ( CLEAR ?auto_58703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58699 ?auto_58700 ?auto_58702 ?auto_58704 )
      ( MAKE-2PILE ?auto_58699 ?auto_58700 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58705 - BLOCK
      ?auto_58706 - BLOCK
    )
    :vars
    (
      ?auto_58707 - BLOCK
      ?auto_58708 - BLOCK
      ?auto_58710 - BLOCK
      ?auto_58709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58707 ?auto_58706 ) ( ON-TABLE ?auto_58705 ) ( ON ?auto_58706 ?auto_58705 ) ( not ( = ?auto_58705 ?auto_58706 ) ) ( not ( = ?auto_58705 ?auto_58707 ) ) ( not ( = ?auto_58706 ?auto_58707 ) ) ( not ( = ?auto_58705 ?auto_58708 ) ) ( not ( = ?auto_58705 ?auto_58710 ) ) ( not ( = ?auto_58706 ?auto_58708 ) ) ( not ( = ?auto_58706 ?auto_58710 ) ) ( not ( = ?auto_58707 ?auto_58708 ) ) ( not ( = ?auto_58707 ?auto_58710 ) ) ( not ( = ?auto_58708 ?auto_58710 ) ) ( ON ?auto_58708 ?auto_58707 ) ( not ( = ?auto_58709 ?auto_58710 ) ) ( not ( = ?auto_58705 ?auto_58709 ) ) ( not ( = ?auto_58706 ?auto_58709 ) ) ( not ( = ?auto_58707 ?auto_58709 ) ) ( not ( = ?auto_58708 ?auto_58709 ) ) ( ON ?auto_58710 ?auto_58708 ) ( CLEAR ?auto_58710 ) ( HOLDING ?auto_58709 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58709 )
      ( MAKE-2PILE ?auto_58705 ?auto_58706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58711 - BLOCK
      ?auto_58712 - BLOCK
    )
    :vars
    (
      ?auto_58716 - BLOCK
      ?auto_58713 - BLOCK
      ?auto_58714 - BLOCK
      ?auto_58715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58716 ?auto_58712 ) ( ON-TABLE ?auto_58711 ) ( ON ?auto_58712 ?auto_58711 ) ( not ( = ?auto_58711 ?auto_58712 ) ) ( not ( = ?auto_58711 ?auto_58716 ) ) ( not ( = ?auto_58712 ?auto_58716 ) ) ( not ( = ?auto_58711 ?auto_58713 ) ) ( not ( = ?auto_58711 ?auto_58714 ) ) ( not ( = ?auto_58712 ?auto_58713 ) ) ( not ( = ?auto_58712 ?auto_58714 ) ) ( not ( = ?auto_58716 ?auto_58713 ) ) ( not ( = ?auto_58716 ?auto_58714 ) ) ( not ( = ?auto_58713 ?auto_58714 ) ) ( ON ?auto_58713 ?auto_58716 ) ( not ( = ?auto_58715 ?auto_58714 ) ) ( not ( = ?auto_58711 ?auto_58715 ) ) ( not ( = ?auto_58712 ?auto_58715 ) ) ( not ( = ?auto_58716 ?auto_58715 ) ) ( not ( = ?auto_58713 ?auto_58715 ) ) ( ON ?auto_58714 ?auto_58713 ) ( ON ?auto_58715 ?auto_58714 ) ( CLEAR ?auto_58715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58711 ?auto_58712 ?auto_58716 ?auto_58713 ?auto_58714 )
      ( MAKE-2PILE ?auto_58711 ?auto_58712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58717 - BLOCK
      ?auto_58718 - BLOCK
    )
    :vars
    (
      ?auto_58720 - BLOCK
      ?auto_58721 - BLOCK
      ?auto_58719 - BLOCK
      ?auto_58722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58720 ?auto_58718 ) ( ON-TABLE ?auto_58717 ) ( ON ?auto_58718 ?auto_58717 ) ( not ( = ?auto_58717 ?auto_58718 ) ) ( not ( = ?auto_58717 ?auto_58720 ) ) ( not ( = ?auto_58718 ?auto_58720 ) ) ( not ( = ?auto_58717 ?auto_58721 ) ) ( not ( = ?auto_58717 ?auto_58719 ) ) ( not ( = ?auto_58718 ?auto_58721 ) ) ( not ( = ?auto_58718 ?auto_58719 ) ) ( not ( = ?auto_58720 ?auto_58721 ) ) ( not ( = ?auto_58720 ?auto_58719 ) ) ( not ( = ?auto_58721 ?auto_58719 ) ) ( ON ?auto_58721 ?auto_58720 ) ( not ( = ?auto_58722 ?auto_58719 ) ) ( not ( = ?auto_58717 ?auto_58722 ) ) ( not ( = ?auto_58718 ?auto_58722 ) ) ( not ( = ?auto_58720 ?auto_58722 ) ) ( not ( = ?auto_58721 ?auto_58722 ) ) ( ON ?auto_58719 ?auto_58721 ) ( HOLDING ?auto_58722 ) ( CLEAR ?auto_58719 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58717 ?auto_58718 ?auto_58720 ?auto_58721 ?auto_58719 ?auto_58722 )
      ( MAKE-2PILE ?auto_58717 ?auto_58718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58723 - BLOCK
      ?auto_58724 - BLOCK
    )
    :vars
    (
      ?auto_58727 - BLOCK
      ?auto_58728 - BLOCK
      ?auto_58726 - BLOCK
      ?auto_58725 - BLOCK
      ?auto_58729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58727 ?auto_58724 ) ( ON-TABLE ?auto_58723 ) ( ON ?auto_58724 ?auto_58723 ) ( not ( = ?auto_58723 ?auto_58724 ) ) ( not ( = ?auto_58723 ?auto_58727 ) ) ( not ( = ?auto_58724 ?auto_58727 ) ) ( not ( = ?auto_58723 ?auto_58728 ) ) ( not ( = ?auto_58723 ?auto_58726 ) ) ( not ( = ?auto_58724 ?auto_58728 ) ) ( not ( = ?auto_58724 ?auto_58726 ) ) ( not ( = ?auto_58727 ?auto_58728 ) ) ( not ( = ?auto_58727 ?auto_58726 ) ) ( not ( = ?auto_58728 ?auto_58726 ) ) ( ON ?auto_58728 ?auto_58727 ) ( not ( = ?auto_58725 ?auto_58726 ) ) ( not ( = ?auto_58723 ?auto_58725 ) ) ( not ( = ?auto_58724 ?auto_58725 ) ) ( not ( = ?auto_58727 ?auto_58725 ) ) ( not ( = ?auto_58728 ?auto_58725 ) ) ( ON ?auto_58726 ?auto_58728 ) ( CLEAR ?auto_58726 ) ( ON ?auto_58725 ?auto_58729 ) ( CLEAR ?auto_58725 ) ( HAND-EMPTY ) ( not ( = ?auto_58723 ?auto_58729 ) ) ( not ( = ?auto_58724 ?auto_58729 ) ) ( not ( = ?auto_58727 ?auto_58729 ) ) ( not ( = ?auto_58728 ?auto_58729 ) ) ( not ( = ?auto_58726 ?auto_58729 ) ) ( not ( = ?auto_58725 ?auto_58729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58725 ?auto_58729 )
      ( MAKE-2PILE ?auto_58723 ?auto_58724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58730 - BLOCK
      ?auto_58731 - BLOCK
    )
    :vars
    (
      ?auto_58733 - BLOCK
      ?auto_58735 - BLOCK
      ?auto_58736 - BLOCK
      ?auto_58734 - BLOCK
      ?auto_58732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58733 ?auto_58731 ) ( ON-TABLE ?auto_58730 ) ( ON ?auto_58731 ?auto_58730 ) ( not ( = ?auto_58730 ?auto_58731 ) ) ( not ( = ?auto_58730 ?auto_58733 ) ) ( not ( = ?auto_58731 ?auto_58733 ) ) ( not ( = ?auto_58730 ?auto_58735 ) ) ( not ( = ?auto_58730 ?auto_58736 ) ) ( not ( = ?auto_58731 ?auto_58735 ) ) ( not ( = ?auto_58731 ?auto_58736 ) ) ( not ( = ?auto_58733 ?auto_58735 ) ) ( not ( = ?auto_58733 ?auto_58736 ) ) ( not ( = ?auto_58735 ?auto_58736 ) ) ( ON ?auto_58735 ?auto_58733 ) ( not ( = ?auto_58734 ?auto_58736 ) ) ( not ( = ?auto_58730 ?auto_58734 ) ) ( not ( = ?auto_58731 ?auto_58734 ) ) ( not ( = ?auto_58733 ?auto_58734 ) ) ( not ( = ?auto_58735 ?auto_58734 ) ) ( ON ?auto_58734 ?auto_58732 ) ( CLEAR ?auto_58734 ) ( not ( = ?auto_58730 ?auto_58732 ) ) ( not ( = ?auto_58731 ?auto_58732 ) ) ( not ( = ?auto_58733 ?auto_58732 ) ) ( not ( = ?auto_58735 ?auto_58732 ) ) ( not ( = ?auto_58736 ?auto_58732 ) ) ( not ( = ?auto_58734 ?auto_58732 ) ) ( HOLDING ?auto_58736 ) ( CLEAR ?auto_58735 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58730 ?auto_58731 ?auto_58733 ?auto_58735 ?auto_58736 )
      ( MAKE-2PILE ?auto_58730 ?auto_58731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58737 - BLOCK
      ?auto_58738 - BLOCK
    )
    :vars
    (
      ?auto_58743 - BLOCK
      ?auto_58740 - BLOCK
      ?auto_58742 - BLOCK
      ?auto_58739 - BLOCK
      ?auto_58741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58743 ?auto_58738 ) ( ON-TABLE ?auto_58737 ) ( ON ?auto_58738 ?auto_58737 ) ( not ( = ?auto_58737 ?auto_58738 ) ) ( not ( = ?auto_58737 ?auto_58743 ) ) ( not ( = ?auto_58738 ?auto_58743 ) ) ( not ( = ?auto_58737 ?auto_58740 ) ) ( not ( = ?auto_58737 ?auto_58742 ) ) ( not ( = ?auto_58738 ?auto_58740 ) ) ( not ( = ?auto_58738 ?auto_58742 ) ) ( not ( = ?auto_58743 ?auto_58740 ) ) ( not ( = ?auto_58743 ?auto_58742 ) ) ( not ( = ?auto_58740 ?auto_58742 ) ) ( ON ?auto_58740 ?auto_58743 ) ( not ( = ?auto_58739 ?auto_58742 ) ) ( not ( = ?auto_58737 ?auto_58739 ) ) ( not ( = ?auto_58738 ?auto_58739 ) ) ( not ( = ?auto_58743 ?auto_58739 ) ) ( not ( = ?auto_58740 ?auto_58739 ) ) ( ON ?auto_58739 ?auto_58741 ) ( not ( = ?auto_58737 ?auto_58741 ) ) ( not ( = ?auto_58738 ?auto_58741 ) ) ( not ( = ?auto_58743 ?auto_58741 ) ) ( not ( = ?auto_58740 ?auto_58741 ) ) ( not ( = ?auto_58742 ?auto_58741 ) ) ( not ( = ?auto_58739 ?auto_58741 ) ) ( CLEAR ?auto_58740 ) ( ON ?auto_58742 ?auto_58739 ) ( CLEAR ?auto_58742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58741 ?auto_58739 )
      ( MAKE-2PILE ?auto_58737 ?auto_58738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58744 - BLOCK
      ?auto_58745 - BLOCK
    )
    :vars
    (
      ?auto_58750 - BLOCK
      ?auto_58749 - BLOCK
      ?auto_58747 - BLOCK
      ?auto_58746 - BLOCK
      ?auto_58748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58750 ?auto_58745 ) ( ON-TABLE ?auto_58744 ) ( ON ?auto_58745 ?auto_58744 ) ( not ( = ?auto_58744 ?auto_58745 ) ) ( not ( = ?auto_58744 ?auto_58750 ) ) ( not ( = ?auto_58745 ?auto_58750 ) ) ( not ( = ?auto_58744 ?auto_58749 ) ) ( not ( = ?auto_58744 ?auto_58747 ) ) ( not ( = ?auto_58745 ?auto_58749 ) ) ( not ( = ?auto_58745 ?auto_58747 ) ) ( not ( = ?auto_58750 ?auto_58749 ) ) ( not ( = ?auto_58750 ?auto_58747 ) ) ( not ( = ?auto_58749 ?auto_58747 ) ) ( not ( = ?auto_58746 ?auto_58747 ) ) ( not ( = ?auto_58744 ?auto_58746 ) ) ( not ( = ?auto_58745 ?auto_58746 ) ) ( not ( = ?auto_58750 ?auto_58746 ) ) ( not ( = ?auto_58749 ?auto_58746 ) ) ( ON ?auto_58746 ?auto_58748 ) ( not ( = ?auto_58744 ?auto_58748 ) ) ( not ( = ?auto_58745 ?auto_58748 ) ) ( not ( = ?auto_58750 ?auto_58748 ) ) ( not ( = ?auto_58749 ?auto_58748 ) ) ( not ( = ?auto_58747 ?auto_58748 ) ) ( not ( = ?auto_58746 ?auto_58748 ) ) ( ON ?auto_58747 ?auto_58746 ) ( CLEAR ?auto_58747 ) ( ON-TABLE ?auto_58748 ) ( HOLDING ?auto_58749 ) ( CLEAR ?auto_58750 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58744 ?auto_58745 ?auto_58750 ?auto_58749 )
      ( MAKE-2PILE ?auto_58744 ?auto_58745 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58751 - BLOCK
      ?auto_58752 - BLOCK
    )
    :vars
    (
      ?auto_58757 - BLOCK
      ?auto_58756 - BLOCK
      ?auto_58754 - BLOCK
      ?auto_58753 - BLOCK
      ?auto_58755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58757 ?auto_58752 ) ( ON-TABLE ?auto_58751 ) ( ON ?auto_58752 ?auto_58751 ) ( not ( = ?auto_58751 ?auto_58752 ) ) ( not ( = ?auto_58751 ?auto_58757 ) ) ( not ( = ?auto_58752 ?auto_58757 ) ) ( not ( = ?auto_58751 ?auto_58756 ) ) ( not ( = ?auto_58751 ?auto_58754 ) ) ( not ( = ?auto_58752 ?auto_58756 ) ) ( not ( = ?auto_58752 ?auto_58754 ) ) ( not ( = ?auto_58757 ?auto_58756 ) ) ( not ( = ?auto_58757 ?auto_58754 ) ) ( not ( = ?auto_58756 ?auto_58754 ) ) ( not ( = ?auto_58753 ?auto_58754 ) ) ( not ( = ?auto_58751 ?auto_58753 ) ) ( not ( = ?auto_58752 ?auto_58753 ) ) ( not ( = ?auto_58757 ?auto_58753 ) ) ( not ( = ?auto_58756 ?auto_58753 ) ) ( ON ?auto_58753 ?auto_58755 ) ( not ( = ?auto_58751 ?auto_58755 ) ) ( not ( = ?auto_58752 ?auto_58755 ) ) ( not ( = ?auto_58757 ?auto_58755 ) ) ( not ( = ?auto_58756 ?auto_58755 ) ) ( not ( = ?auto_58754 ?auto_58755 ) ) ( not ( = ?auto_58753 ?auto_58755 ) ) ( ON ?auto_58754 ?auto_58753 ) ( ON-TABLE ?auto_58755 ) ( CLEAR ?auto_58757 ) ( ON ?auto_58756 ?auto_58754 ) ( CLEAR ?auto_58756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58755 ?auto_58753 ?auto_58754 )
      ( MAKE-2PILE ?auto_58751 ?auto_58752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58772 - BLOCK
      ?auto_58773 - BLOCK
    )
    :vars
    (
      ?auto_58778 - BLOCK
      ?auto_58774 - BLOCK
      ?auto_58777 - BLOCK
      ?auto_58775 - BLOCK
      ?auto_58776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58772 ) ( not ( = ?auto_58772 ?auto_58773 ) ) ( not ( = ?auto_58772 ?auto_58778 ) ) ( not ( = ?auto_58773 ?auto_58778 ) ) ( not ( = ?auto_58772 ?auto_58774 ) ) ( not ( = ?auto_58772 ?auto_58777 ) ) ( not ( = ?auto_58773 ?auto_58774 ) ) ( not ( = ?auto_58773 ?auto_58777 ) ) ( not ( = ?auto_58778 ?auto_58774 ) ) ( not ( = ?auto_58778 ?auto_58777 ) ) ( not ( = ?auto_58774 ?auto_58777 ) ) ( not ( = ?auto_58775 ?auto_58777 ) ) ( not ( = ?auto_58772 ?auto_58775 ) ) ( not ( = ?auto_58773 ?auto_58775 ) ) ( not ( = ?auto_58778 ?auto_58775 ) ) ( not ( = ?auto_58774 ?auto_58775 ) ) ( ON ?auto_58775 ?auto_58776 ) ( not ( = ?auto_58772 ?auto_58776 ) ) ( not ( = ?auto_58773 ?auto_58776 ) ) ( not ( = ?auto_58778 ?auto_58776 ) ) ( not ( = ?auto_58774 ?auto_58776 ) ) ( not ( = ?auto_58777 ?auto_58776 ) ) ( not ( = ?auto_58775 ?auto_58776 ) ) ( ON ?auto_58777 ?auto_58775 ) ( ON-TABLE ?auto_58776 ) ( ON ?auto_58774 ?auto_58777 ) ( ON ?auto_58778 ?auto_58774 ) ( CLEAR ?auto_58778 ) ( HOLDING ?auto_58773 ) ( CLEAR ?auto_58772 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58772 ?auto_58773 ?auto_58778 )
      ( MAKE-2PILE ?auto_58772 ?auto_58773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58779 - BLOCK
      ?auto_58780 - BLOCK
    )
    :vars
    (
      ?auto_58781 - BLOCK
      ?auto_58784 - BLOCK
      ?auto_58782 - BLOCK
      ?auto_58785 - BLOCK
      ?auto_58783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58779 ) ( not ( = ?auto_58779 ?auto_58780 ) ) ( not ( = ?auto_58779 ?auto_58781 ) ) ( not ( = ?auto_58780 ?auto_58781 ) ) ( not ( = ?auto_58779 ?auto_58784 ) ) ( not ( = ?auto_58779 ?auto_58782 ) ) ( not ( = ?auto_58780 ?auto_58784 ) ) ( not ( = ?auto_58780 ?auto_58782 ) ) ( not ( = ?auto_58781 ?auto_58784 ) ) ( not ( = ?auto_58781 ?auto_58782 ) ) ( not ( = ?auto_58784 ?auto_58782 ) ) ( not ( = ?auto_58785 ?auto_58782 ) ) ( not ( = ?auto_58779 ?auto_58785 ) ) ( not ( = ?auto_58780 ?auto_58785 ) ) ( not ( = ?auto_58781 ?auto_58785 ) ) ( not ( = ?auto_58784 ?auto_58785 ) ) ( ON ?auto_58785 ?auto_58783 ) ( not ( = ?auto_58779 ?auto_58783 ) ) ( not ( = ?auto_58780 ?auto_58783 ) ) ( not ( = ?auto_58781 ?auto_58783 ) ) ( not ( = ?auto_58784 ?auto_58783 ) ) ( not ( = ?auto_58782 ?auto_58783 ) ) ( not ( = ?auto_58785 ?auto_58783 ) ) ( ON ?auto_58782 ?auto_58785 ) ( ON-TABLE ?auto_58783 ) ( ON ?auto_58784 ?auto_58782 ) ( ON ?auto_58781 ?auto_58784 ) ( CLEAR ?auto_58779 ) ( ON ?auto_58780 ?auto_58781 ) ( CLEAR ?auto_58780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58783 ?auto_58785 ?auto_58782 ?auto_58784 ?auto_58781 )
      ( MAKE-2PILE ?auto_58779 ?auto_58780 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58786 - BLOCK
      ?auto_58787 - BLOCK
    )
    :vars
    (
      ?auto_58790 - BLOCK
      ?auto_58788 - BLOCK
      ?auto_58789 - BLOCK
      ?auto_58791 - BLOCK
      ?auto_58792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58786 ?auto_58787 ) ) ( not ( = ?auto_58786 ?auto_58790 ) ) ( not ( = ?auto_58787 ?auto_58790 ) ) ( not ( = ?auto_58786 ?auto_58788 ) ) ( not ( = ?auto_58786 ?auto_58789 ) ) ( not ( = ?auto_58787 ?auto_58788 ) ) ( not ( = ?auto_58787 ?auto_58789 ) ) ( not ( = ?auto_58790 ?auto_58788 ) ) ( not ( = ?auto_58790 ?auto_58789 ) ) ( not ( = ?auto_58788 ?auto_58789 ) ) ( not ( = ?auto_58791 ?auto_58789 ) ) ( not ( = ?auto_58786 ?auto_58791 ) ) ( not ( = ?auto_58787 ?auto_58791 ) ) ( not ( = ?auto_58790 ?auto_58791 ) ) ( not ( = ?auto_58788 ?auto_58791 ) ) ( ON ?auto_58791 ?auto_58792 ) ( not ( = ?auto_58786 ?auto_58792 ) ) ( not ( = ?auto_58787 ?auto_58792 ) ) ( not ( = ?auto_58790 ?auto_58792 ) ) ( not ( = ?auto_58788 ?auto_58792 ) ) ( not ( = ?auto_58789 ?auto_58792 ) ) ( not ( = ?auto_58791 ?auto_58792 ) ) ( ON ?auto_58789 ?auto_58791 ) ( ON-TABLE ?auto_58792 ) ( ON ?auto_58788 ?auto_58789 ) ( ON ?auto_58790 ?auto_58788 ) ( ON ?auto_58787 ?auto_58790 ) ( CLEAR ?auto_58787 ) ( HOLDING ?auto_58786 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58786 )
      ( MAKE-2PILE ?auto_58786 ?auto_58787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_58793 - BLOCK
      ?auto_58794 - BLOCK
    )
    :vars
    (
      ?auto_58799 - BLOCK
      ?auto_58798 - BLOCK
      ?auto_58795 - BLOCK
      ?auto_58796 - BLOCK
      ?auto_58797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58793 ?auto_58794 ) ) ( not ( = ?auto_58793 ?auto_58799 ) ) ( not ( = ?auto_58794 ?auto_58799 ) ) ( not ( = ?auto_58793 ?auto_58798 ) ) ( not ( = ?auto_58793 ?auto_58795 ) ) ( not ( = ?auto_58794 ?auto_58798 ) ) ( not ( = ?auto_58794 ?auto_58795 ) ) ( not ( = ?auto_58799 ?auto_58798 ) ) ( not ( = ?auto_58799 ?auto_58795 ) ) ( not ( = ?auto_58798 ?auto_58795 ) ) ( not ( = ?auto_58796 ?auto_58795 ) ) ( not ( = ?auto_58793 ?auto_58796 ) ) ( not ( = ?auto_58794 ?auto_58796 ) ) ( not ( = ?auto_58799 ?auto_58796 ) ) ( not ( = ?auto_58798 ?auto_58796 ) ) ( ON ?auto_58796 ?auto_58797 ) ( not ( = ?auto_58793 ?auto_58797 ) ) ( not ( = ?auto_58794 ?auto_58797 ) ) ( not ( = ?auto_58799 ?auto_58797 ) ) ( not ( = ?auto_58798 ?auto_58797 ) ) ( not ( = ?auto_58795 ?auto_58797 ) ) ( not ( = ?auto_58796 ?auto_58797 ) ) ( ON ?auto_58795 ?auto_58796 ) ( ON-TABLE ?auto_58797 ) ( ON ?auto_58798 ?auto_58795 ) ( ON ?auto_58799 ?auto_58798 ) ( ON ?auto_58794 ?auto_58799 ) ( ON ?auto_58793 ?auto_58794 ) ( CLEAR ?auto_58793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58797 ?auto_58796 ?auto_58795 ?auto_58798 ?auto_58799 ?auto_58794 )
      ( MAKE-2PILE ?auto_58793 ?auto_58794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58804 - BLOCK
      ?auto_58805 - BLOCK
      ?auto_58806 - BLOCK
      ?auto_58807 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_58807 ) ( CLEAR ?auto_58806 ) ( ON-TABLE ?auto_58804 ) ( ON ?auto_58805 ?auto_58804 ) ( ON ?auto_58806 ?auto_58805 ) ( not ( = ?auto_58804 ?auto_58805 ) ) ( not ( = ?auto_58804 ?auto_58806 ) ) ( not ( = ?auto_58804 ?auto_58807 ) ) ( not ( = ?auto_58805 ?auto_58806 ) ) ( not ( = ?auto_58805 ?auto_58807 ) ) ( not ( = ?auto_58806 ?auto_58807 ) ) )
    :subtasks
    ( ( !STACK ?auto_58807 ?auto_58806 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58808 - BLOCK
      ?auto_58809 - BLOCK
      ?auto_58810 - BLOCK
      ?auto_58811 - BLOCK
    )
    :vars
    (
      ?auto_58812 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_58810 ) ( ON-TABLE ?auto_58808 ) ( ON ?auto_58809 ?auto_58808 ) ( ON ?auto_58810 ?auto_58809 ) ( not ( = ?auto_58808 ?auto_58809 ) ) ( not ( = ?auto_58808 ?auto_58810 ) ) ( not ( = ?auto_58808 ?auto_58811 ) ) ( not ( = ?auto_58809 ?auto_58810 ) ) ( not ( = ?auto_58809 ?auto_58811 ) ) ( not ( = ?auto_58810 ?auto_58811 ) ) ( ON ?auto_58811 ?auto_58812 ) ( CLEAR ?auto_58811 ) ( HAND-EMPTY ) ( not ( = ?auto_58808 ?auto_58812 ) ) ( not ( = ?auto_58809 ?auto_58812 ) ) ( not ( = ?auto_58810 ?auto_58812 ) ) ( not ( = ?auto_58811 ?auto_58812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58811 ?auto_58812 )
      ( MAKE-4PILE ?auto_58808 ?auto_58809 ?auto_58810 ?auto_58811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58813 - BLOCK
      ?auto_58814 - BLOCK
      ?auto_58815 - BLOCK
      ?auto_58816 - BLOCK
    )
    :vars
    (
      ?auto_58817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58813 ) ( ON ?auto_58814 ?auto_58813 ) ( not ( = ?auto_58813 ?auto_58814 ) ) ( not ( = ?auto_58813 ?auto_58815 ) ) ( not ( = ?auto_58813 ?auto_58816 ) ) ( not ( = ?auto_58814 ?auto_58815 ) ) ( not ( = ?auto_58814 ?auto_58816 ) ) ( not ( = ?auto_58815 ?auto_58816 ) ) ( ON ?auto_58816 ?auto_58817 ) ( CLEAR ?auto_58816 ) ( not ( = ?auto_58813 ?auto_58817 ) ) ( not ( = ?auto_58814 ?auto_58817 ) ) ( not ( = ?auto_58815 ?auto_58817 ) ) ( not ( = ?auto_58816 ?auto_58817 ) ) ( HOLDING ?auto_58815 ) ( CLEAR ?auto_58814 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58813 ?auto_58814 ?auto_58815 )
      ( MAKE-4PILE ?auto_58813 ?auto_58814 ?auto_58815 ?auto_58816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58818 - BLOCK
      ?auto_58819 - BLOCK
      ?auto_58820 - BLOCK
      ?auto_58821 - BLOCK
    )
    :vars
    (
      ?auto_58822 - BLOCK
      ?auto_58823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58818 ) ( ON ?auto_58819 ?auto_58818 ) ( not ( = ?auto_58818 ?auto_58819 ) ) ( not ( = ?auto_58818 ?auto_58820 ) ) ( not ( = ?auto_58818 ?auto_58821 ) ) ( not ( = ?auto_58819 ?auto_58820 ) ) ( not ( = ?auto_58819 ?auto_58821 ) ) ( not ( = ?auto_58820 ?auto_58821 ) ) ( ON ?auto_58821 ?auto_58822 ) ( not ( = ?auto_58818 ?auto_58822 ) ) ( not ( = ?auto_58819 ?auto_58822 ) ) ( not ( = ?auto_58820 ?auto_58822 ) ) ( not ( = ?auto_58821 ?auto_58822 ) ) ( CLEAR ?auto_58819 ) ( ON ?auto_58820 ?auto_58821 ) ( CLEAR ?auto_58820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58823 ) ( ON ?auto_58822 ?auto_58823 ) ( not ( = ?auto_58823 ?auto_58822 ) ) ( not ( = ?auto_58823 ?auto_58821 ) ) ( not ( = ?auto_58823 ?auto_58820 ) ) ( not ( = ?auto_58818 ?auto_58823 ) ) ( not ( = ?auto_58819 ?auto_58823 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58823 ?auto_58822 ?auto_58821 )
      ( MAKE-4PILE ?auto_58818 ?auto_58819 ?auto_58820 ?auto_58821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58824 - BLOCK
      ?auto_58825 - BLOCK
      ?auto_58826 - BLOCK
      ?auto_58827 - BLOCK
    )
    :vars
    (
      ?auto_58828 - BLOCK
      ?auto_58829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58824 ) ( not ( = ?auto_58824 ?auto_58825 ) ) ( not ( = ?auto_58824 ?auto_58826 ) ) ( not ( = ?auto_58824 ?auto_58827 ) ) ( not ( = ?auto_58825 ?auto_58826 ) ) ( not ( = ?auto_58825 ?auto_58827 ) ) ( not ( = ?auto_58826 ?auto_58827 ) ) ( ON ?auto_58827 ?auto_58828 ) ( not ( = ?auto_58824 ?auto_58828 ) ) ( not ( = ?auto_58825 ?auto_58828 ) ) ( not ( = ?auto_58826 ?auto_58828 ) ) ( not ( = ?auto_58827 ?auto_58828 ) ) ( ON ?auto_58826 ?auto_58827 ) ( CLEAR ?auto_58826 ) ( ON-TABLE ?auto_58829 ) ( ON ?auto_58828 ?auto_58829 ) ( not ( = ?auto_58829 ?auto_58828 ) ) ( not ( = ?auto_58829 ?auto_58827 ) ) ( not ( = ?auto_58829 ?auto_58826 ) ) ( not ( = ?auto_58824 ?auto_58829 ) ) ( not ( = ?auto_58825 ?auto_58829 ) ) ( HOLDING ?auto_58825 ) ( CLEAR ?auto_58824 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58824 ?auto_58825 )
      ( MAKE-4PILE ?auto_58824 ?auto_58825 ?auto_58826 ?auto_58827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58830 - BLOCK
      ?auto_58831 - BLOCK
      ?auto_58832 - BLOCK
      ?auto_58833 - BLOCK
    )
    :vars
    (
      ?auto_58835 - BLOCK
      ?auto_58834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_58830 ) ( not ( = ?auto_58830 ?auto_58831 ) ) ( not ( = ?auto_58830 ?auto_58832 ) ) ( not ( = ?auto_58830 ?auto_58833 ) ) ( not ( = ?auto_58831 ?auto_58832 ) ) ( not ( = ?auto_58831 ?auto_58833 ) ) ( not ( = ?auto_58832 ?auto_58833 ) ) ( ON ?auto_58833 ?auto_58835 ) ( not ( = ?auto_58830 ?auto_58835 ) ) ( not ( = ?auto_58831 ?auto_58835 ) ) ( not ( = ?auto_58832 ?auto_58835 ) ) ( not ( = ?auto_58833 ?auto_58835 ) ) ( ON ?auto_58832 ?auto_58833 ) ( ON-TABLE ?auto_58834 ) ( ON ?auto_58835 ?auto_58834 ) ( not ( = ?auto_58834 ?auto_58835 ) ) ( not ( = ?auto_58834 ?auto_58833 ) ) ( not ( = ?auto_58834 ?auto_58832 ) ) ( not ( = ?auto_58830 ?auto_58834 ) ) ( not ( = ?auto_58831 ?auto_58834 ) ) ( CLEAR ?auto_58830 ) ( ON ?auto_58831 ?auto_58832 ) ( CLEAR ?auto_58831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58834 ?auto_58835 ?auto_58833 ?auto_58832 )
      ( MAKE-4PILE ?auto_58830 ?auto_58831 ?auto_58832 ?auto_58833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58836 - BLOCK
      ?auto_58837 - BLOCK
      ?auto_58838 - BLOCK
      ?auto_58839 - BLOCK
    )
    :vars
    (
      ?auto_58841 - BLOCK
      ?auto_58840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58836 ?auto_58837 ) ) ( not ( = ?auto_58836 ?auto_58838 ) ) ( not ( = ?auto_58836 ?auto_58839 ) ) ( not ( = ?auto_58837 ?auto_58838 ) ) ( not ( = ?auto_58837 ?auto_58839 ) ) ( not ( = ?auto_58838 ?auto_58839 ) ) ( ON ?auto_58839 ?auto_58841 ) ( not ( = ?auto_58836 ?auto_58841 ) ) ( not ( = ?auto_58837 ?auto_58841 ) ) ( not ( = ?auto_58838 ?auto_58841 ) ) ( not ( = ?auto_58839 ?auto_58841 ) ) ( ON ?auto_58838 ?auto_58839 ) ( ON-TABLE ?auto_58840 ) ( ON ?auto_58841 ?auto_58840 ) ( not ( = ?auto_58840 ?auto_58841 ) ) ( not ( = ?auto_58840 ?auto_58839 ) ) ( not ( = ?auto_58840 ?auto_58838 ) ) ( not ( = ?auto_58836 ?auto_58840 ) ) ( not ( = ?auto_58837 ?auto_58840 ) ) ( ON ?auto_58837 ?auto_58838 ) ( CLEAR ?auto_58837 ) ( HOLDING ?auto_58836 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58836 )
      ( MAKE-4PILE ?auto_58836 ?auto_58837 ?auto_58838 ?auto_58839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58842 - BLOCK
      ?auto_58843 - BLOCK
      ?auto_58844 - BLOCK
      ?auto_58845 - BLOCK
    )
    :vars
    (
      ?auto_58846 - BLOCK
      ?auto_58847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58842 ?auto_58843 ) ) ( not ( = ?auto_58842 ?auto_58844 ) ) ( not ( = ?auto_58842 ?auto_58845 ) ) ( not ( = ?auto_58843 ?auto_58844 ) ) ( not ( = ?auto_58843 ?auto_58845 ) ) ( not ( = ?auto_58844 ?auto_58845 ) ) ( ON ?auto_58845 ?auto_58846 ) ( not ( = ?auto_58842 ?auto_58846 ) ) ( not ( = ?auto_58843 ?auto_58846 ) ) ( not ( = ?auto_58844 ?auto_58846 ) ) ( not ( = ?auto_58845 ?auto_58846 ) ) ( ON ?auto_58844 ?auto_58845 ) ( ON-TABLE ?auto_58847 ) ( ON ?auto_58846 ?auto_58847 ) ( not ( = ?auto_58847 ?auto_58846 ) ) ( not ( = ?auto_58847 ?auto_58845 ) ) ( not ( = ?auto_58847 ?auto_58844 ) ) ( not ( = ?auto_58842 ?auto_58847 ) ) ( not ( = ?auto_58843 ?auto_58847 ) ) ( ON ?auto_58843 ?auto_58844 ) ( ON ?auto_58842 ?auto_58843 ) ( CLEAR ?auto_58842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58847 ?auto_58846 ?auto_58845 ?auto_58844 ?auto_58843 )
      ( MAKE-4PILE ?auto_58842 ?auto_58843 ?auto_58844 ?auto_58845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58848 - BLOCK
      ?auto_58849 - BLOCK
      ?auto_58850 - BLOCK
      ?auto_58851 - BLOCK
    )
    :vars
    (
      ?auto_58853 - BLOCK
      ?auto_58852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58848 ?auto_58849 ) ) ( not ( = ?auto_58848 ?auto_58850 ) ) ( not ( = ?auto_58848 ?auto_58851 ) ) ( not ( = ?auto_58849 ?auto_58850 ) ) ( not ( = ?auto_58849 ?auto_58851 ) ) ( not ( = ?auto_58850 ?auto_58851 ) ) ( ON ?auto_58851 ?auto_58853 ) ( not ( = ?auto_58848 ?auto_58853 ) ) ( not ( = ?auto_58849 ?auto_58853 ) ) ( not ( = ?auto_58850 ?auto_58853 ) ) ( not ( = ?auto_58851 ?auto_58853 ) ) ( ON ?auto_58850 ?auto_58851 ) ( ON-TABLE ?auto_58852 ) ( ON ?auto_58853 ?auto_58852 ) ( not ( = ?auto_58852 ?auto_58853 ) ) ( not ( = ?auto_58852 ?auto_58851 ) ) ( not ( = ?auto_58852 ?auto_58850 ) ) ( not ( = ?auto_58848 ?auto_58852 ) ) ( not ( = ?auto_58849 ?auto_58852 ) ) ( ON ?auto_58849 ?auto_58850 ) ( HOLDING ?auto_58848 ) ( CLEAR ?auto_58849 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58852 ?auto_58853 ?auto_58851 ?auto_58850 ?auto_58849 ?auto_58848 )
      ( MAKE-4PILE ?auto_58848 ?auto_58849 ?auto_58850 ?auto_58851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58854 - BLOCK
      ?auto_58855 - BLOCK
      ?auto_58856 - BLOCK
      ?auto_58857 - BLOCK
    )
    :vars
    (
      ?auto_58858 - BLOCK
      ?auto_58859 - BLOCK
      ?auto_58860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58854 ?auto_58855 ) ) ( not ( = ?auto_58854 ?auto_58856 ) ) ( not ( = ?auto_58854 ?auto_58857 ) ) ( not ( = ?auto_58855 ?auto_58856 ) ) ( not ( = ?auto_58855 ?auto_58857 ) ) ( not ( = ?auto_58856 ?auto_58857 ) ) ( ON ?auto_58857 ?auto_58858 ) ( not ( = ?auto_58854 ?auto_58858 ) ) ( not ( = ?auto_58855 ?auto_58858 ) ) ( not ( = ?auto_58856 ?auto_58858 ) ) ( not ( = ?auto_58857 ?auto_58858 ) ) ( ON ?auto_58856 ?auto_58857 ) ( ON-TABLE ?auto_58859 ) ( ON ?auto_58858 ?auto_58859 ) ( not ( = ?auto_58859 ?auto_58858 ) ) ( not ( = ?auto_58859 ?auto_58857 ) ) ( not ( = ?auto_58859 ?auto_58856 ) ) ( not ( = ?auto_58854 ?auto_58859 ) ) ( not ( = ?auto_58855 ?auto_58859 ) ) ( ON ?auto_58855 ?auto_58856 ) ( CLEAR ?auto_58855 ) ( ON ?auto_58854 ?auto_58860 ) ( CLEAR ?auto_58854 ) ( HAND-EMPTY ) ( not ( = ?auto_58854 ?auto_58860 ) ) ( not ( = ?auto_58855 ?auto_58860 ) ) ( not ( = ?auto_58856 ?auto_58860 ) ) ( not ( = ?auto_58857 ?auto_58860 ) ) ( not ( = ?auto_58858 ?auto_58860 ) ) ( not ( = ?auto_58859 ?auto_58860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58854 ?auto_58860 )
      ( MAKE-4PILE ?auto_58854 ?auto_58855 ?auto_58856 ?auto_58857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58861 - BLOCK
      ?auto_58862 - BLOCK
      ?auto_58863 - BLOCK
      ?auto_58864 - BLOCK
    )
    :vars
    (
      ?auto_58865 - BLOCK
      ?auto_58866 - BLOCK
      ?auto_58867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58861 ?auto_58862 ) ) ( not ( = ?auto_58861 ?auto_58863 ) ) ( not ( = ?auto_58861 ?auto_58864 ) ) ( not ( = ?auto_58862 ?auto_58863 ) ) ( not ( = ?auto_58862 ?auto_58864 ) ) ( not ( = ?auto_58863 ?auto_58864 ) ) ( ON ?auto_58864 ?auto_58865 ) ( not ( = ?auto_58861 ?auto_58865 ) ) ( not ( = ?auto_58862 ?auto_58865 ) ) ( not ( = ?auto_58863 ?auto_58865 ) ) ( not ( = ?auto_58864 ?auto_58865 ) ) ( ON ?auto_58863 ?auto_58864 ) ( ON-TABLE ?auto_58866 ) ( ON ?auto_58865 ?auto_58866 ) ( not ( = ?auto_58866 ?auto_58865 ) ) ( not ( = ?auto_58866 ?auto_58864 ) ) ( not ( = ?auto_58866 ?auto_58863 ) ) ( not ( = ?auto_58861 ?auto_58866 ) ) ( not ( = ?auto_58862 ?auto_58866 ) ) ( ON ?auto_58861 ?auto_58867 ) ( CLEAR ?auto_58861 ) ( not ( = ?auto_58861 ?auto_58867 ) ) ( not ( = ?auto_58862 ?auto_58867 ) ) ( not ( = ?auto_58863 ?auto_58867 ) ) ( not ( = ?auto_58864 ?auto_58867 ) ) ( not ( = ?auto_58865 ?auto_58867 ) ) ( not ( = ?auto_58866 ?auto_58867 ) ) ( HOLDING ?auto_58862 ) ( CLEAR ?auto_58863 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58866 ?auto_58865 ?auto_58864 ?auto_58863 ?auto_58862 )
      ( MAKE-4PILE ?auto_58861 ?auto_58862 ?auto_58863 ?auto_58864 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58868 - BLOCK
      ?auto_58869 - BLOCK
      ?auto_58870 - BLOCK
      ?auto_58871 - BLOCK
    )
    :vars
    (
      ?auto_58872 - BLOCK
      ?auto_58874 - BLOCK
      ?auto_58873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58868 ?auto_58869 ) ) ( not ( = ?auto_58868 ?auto_58870 ) ) ( not ( = ?auto_58868 ?auto_58871 ) ) ( not ( = ?auto_58869 ?auto_58870 ) ) ( not ( = ?auto_58869 ?auto_58871 ) ) ( not ( = ?auto_58870 ?auto_58871 ) ) ( ON ?auto_58871 ?auto_58872 ) ( not ( = ?auto_58868 ?auto_58872 ) ) ( not ( = ?auto_58869 ?auto_58872 ) ) ( not ( = ?auto_58870 ?auto_58872 ) ) ( not ( = ?auto_58871 ?auto_58872 ) ) ( ON ?auto_58870 ?auto_58871 ) ( ON-TABLE ?auto_58874 ) ( ON ?auto_58872 ?auto_58874 ) ( not ( = ?auto_58874 ?auto_58872 ) ) ( not ( = ?auto_58874 ?auto_58871 ) ) ( not ( = ?auto_58874 ?auto_58870 ) ) ( not ( = ?auto_58868 ?auto_58874 ) ) ( not ( = ?auto_58869 ?auto_58874 ) ) ( ON ?auto_58868 ?auto_58873 ) ( not ( = ?auto_58868 ?auto_58873 ) ) ( not ( = ?auto_58869 ?auto_58873 ) ) ( not ( = ?auto_58870 ?auto_58873 ) ) ( not ( = ?auto_58871 ?auto_58873 ) ) ( not ( = ?auto_58872 ?auto_58873 ) ) ( not ( = ?auto_58874 ?auto_58873 ) ) ( CLEAR ?auto_58870 ) ( ON ?auto_58869 ?auto_58868 ) ( CLEAR ?auto_58869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58873 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58873 ?auto_58868 )
      ( MAKE-4PILE ?auto_58868 ?auto_58869 ?auto_58870 ?auto_58871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58875 - BLOCK
      ?auto_58876 - BLOCK
      ?auto_58877 - BLOCK
      ?auto_58878 - BLOCK
    )
    :vars
    (
      ?auto_58881 - BLOCK
      ?auto_58879 - BLOCK
      ?auto_58880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58875 ?auto_58876 ) ) ( not ( = ?auto_58875 ?auto_58877 ) ) ( not ( = ?auto_58875 ?auto_58878 ) ) ( not ( = ?auto_58876 ?auto_58877 ) ) ( not ( = ?auto_58876 ?auto_58878 ) ) ( not ( = ?auto_58877 ?auto_58878 ) ) ( ON ?auto_58878 ?auto_58881 ) ( not ( = ?auto_58875 ?auto_58881 ) ) ( not ( = ?auto_58876 ?auto_58881 ) ) ( not ( = ?auto_58877 ?auto_58881 ) ) ( not ( = ?auto_58878 ?auto_58881 ) ) ( ON-TABLE ?auto_58879 ) ( ON ?auto_58881 ?auto_58879 ) ( not ( = ?auto_58879 ?auto_58881 ) ) ( not ( = ?auto_58879 ?auto_58878 ) ) ( not ( = ?auto_58879 ?auto_58877 ) ) ( not ( = ?auto_58875 ?auto_58879 ) ) ( not ( = ?auto_58876 ?auto_58879 ) ) ( ON ?auto_58875 ?auto_58880 ) ( not ( = ?auto_58875 ?auto_58880 ) ) ( not ( = ?auto_58876 ?auto_58880 ) ) ( not ( = ?auto_58877 ?auto_58880 ) ) ( not ( = ?auto_58878 ?auto_58880 ) ) ( not ( = ?auto_58881 ?auto_58880 ) ) ( not ( = ?auto_58879 ?auto_58880 ) ) ( ON ?auto_58876 ?auto_58875 ) ( CLEAR ?auto_58876 ) ( ON-TABLE ?auto_58880 ) ( HOLDING ?auto_58877 ) ( CLEAR ?auto_58878 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58879 ?auto_58881 ?auto_58878 ?auto_58877 )
      ( MAKE-4PILE ?auto_58875 ?auto_58876 ?auto_58877 ?auto_58878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58882 - BLOCK
      ?auto_58883 - BLOCK
      ?auto_58884 - BLOCK
      ?auto_58885 - BLOCK
    )
    :vars
    (
      ?auto_58888 - BLOCK
      ?auto_58886 - BLOCK
      ?auto_58887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58882 ?auto_58883 ) ) ( not ( = ?auto_58882 ?auto_58884 ) ) ( not ( = ?auto_58882 ?auto_58885 ) ) ( not ( = ?auto_58883 ?auto_58884 ) ) ( not ( = ?auto_58883 ?auto_58885 ) ) ( not ( = ?auto_58884 ?auto_58885 ) ) ( ON ?auto_58885 ?auto_58888 ) ( not ( = ?auto_58882 ?auto_58888 ) ) ( not ( = ?auto_58883 ?auto_58888 ) ) ( not ( = ?auto_58884 ?auto_58888 ) ) ( not ( = ?auto_58885 ?auto_58888 ) ) ( ON-TABLE ?auto_58886 ) ( ON ?auto_58888 ?auto_58886 ) ( not ( = ?auto_58886 ?auto_58888 ) ) ( not ( = ?auto_58886 ?auto_58885 ) ) ( not ( = ?auto_58886 ?auto_58884 ) ) ( not ( = ?auto_58882 ?auto_58886 ) ) ( not ( = ?auto_58883 ?auto_58886 ) ) ( ON ?auto_58882 ?auto_58887 ) ( not ( = ?auto_58882 ?auto_58887 ) ) ( not ( = ?auto_58883 ?auto_58887 ) ) ( not ( = ?auto_58884 ?auto_58887 ) ) ( not ( = ?auto_58885 ?auto_58887 ) ) ( not ( = ?auto_58888 ?auto_58887 ) ) ( not ( = ?auto_58886 ?auto_58887 ) ) ( ON ?auto_58883 ?auto_58882 ) ( ON-TABLE ?auto_58887 ) ( CLEAR ?auto_58885 ) ( ON ?auto_58884 ?auto_58883 ) ( CLEAR ?auto_58884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58887 ?auto_58882 ?auto_58883 )
      ( MAKE-4PILE ?auto_58882 ?auto_58883 ?auto_58884 ?auto_58885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58889 - BLOCK
      ?auto_58890 - BLOCK
      ?auto_58891 - BLOCK
      ?auto_58892 - BLOCK
    )
    :vars
    (
      ?auto_58894 - BLOCK
      ?auto_58893 - BLOCK
      ?auto_58895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58889 ?auto_58890 ) ) ( not ( = ?auto_58889 ?auto_58891 ) ) ( not ( = ?auto_58889 ?auto_58892 ) ) ( not ( = ?auto_58890 ?auto_58891 ) ) ( not ( = ?auto_58890 ?auto_58892 ) ) ( not ( = ?auto_58891 ?auto_58892 ) ) ( not ( = ?auto_58889 ?auto_58894 ) ) ( not ( = ?auto_58890 ?auto_58894 ) ) ( not ( = ?auto_58891 ?auto_58894 ) ) ( not ( = ?auto_58892 ?auto_58894 ) ) ( ON-TABLE ?auto_58893 ) ( ON ?auto_58894 ?auto_58893 ) ( not ( = ?auto_58893 ?auto_58894 ) ) ( not ( = ?auto_58893 ?auto_58892 ) ) ( not ( = ?auto_58893 ?auto_58891 ) ) ( not ( = ?auto_58889 ?auto_58893 ) ) ( not ( = ?auto_58890 ?auto_58893 ) ) ( ON ?auto_58889 ?auto_58895 ) ( not ( = ?auto_58889 ?auto_58895 ) ) ( not ( = ?auto_58890 ?auto_58895 ) ) ( not ( = ?auto_58891 ?auto_58895 ) ) ( not ( = ?auto_58892 ?auto_58895 ) ) ( not ( = ?auto_58894 ?auto_58895 ) ) ( not ( = ?auto_58893 ?auto_58895 ) ) ( ON ?auto_58890 ?auto_58889 ) ( ON-TABLE ?auto_58895 ) ( ON ?auto_58891 ?auto_58890 ) ( CLEAR ?auto_58891 ) ( HOLDING ?auto_58892 ) ( CLEAR ?auto_58894 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58893 ?auto_58894 ?auto_58892 )
      ( MAKE-4PILE ?auto_58889 ?auto_58890 ?auto_58891 ?auto_58892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58896 - BLOCK
      ?auto_58897 - BLOCK
      ?auto_58898 - BLOCK
      ?auto_58899 - BLOCK
    )
    :vars
    (
      ?auto_58901 - BLOCK
      ?auto_58900 - BLOCK
      ?auto_58902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58896 ?auto_58897 ) ) ( not ( = ?auto_58896 ?auto_58898 ) ) ( not ( = ?auto_58896 ?auto_58899 ) ) ( not ( = ?auto_58897 ?auto_58898 ) ) ( not ( = ?auto_58897 ?auto_58899 ) ) ( not ( = ?auto_58898 ?auto_58899 ) ) ( not ( = ?auto_58896 ?auto_58901 ) ) ( not ( = ?auto_58897 ?auto_58901 ) ) ( not ( = ?auto_58898 ?auto_58901 ) ) ( not ( = ?auto_58899 ?auto_58901 ) ) ( ON-TABLE ?auto_58900 ) ( ON ?auto_58901 ?auto_58900 ) ( not ( = ?auto_58900 ?auto_58901 ) ) ( not ( = ?auto_58900 ?auto_58899 ) ) ( not ( = ?auto_58900 ?auto_58898 ) ) ( not ( = ?auto_58896 ?auto_58900 ) ) ( not ( = ?auto_58897 ?auto_58900 ) ) ( ON ?auto_58896 ?auto_58902 ) ( not ( = ?auto_58896 ?auto_58902 ) ) ( not ( = ?auto_58897 ?auto_58902 ) ) ( not ( = ?auto_58898 ?auto_58902 ) ) ( not ( = ?auto_58899 ?auto_58902 ) ) ( not ( = ?auto_58901 ?auto_58902 ) ) ( not ( = ?auto_58900 ?auto_58902 ) ) ( ON ?auto_58897 ?auto_58896 ) ( ON-TABLE ?auto_58902 ) ( ON ?auto_58898 ?auto_58897 ) ( CLEAR ?auto_58901 ) ( ON ?auto_58899 ?auto_58898 ) ( CLEAR ?auto_58899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58902 ?auto_58896 ?auto_58897 ?auto_58898 )
      ( MAKE-4PILE ?auto_58896 ?auto_58897 ?auto_58898 ?auto_58899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58903 - BLOCK
      ?auto_58904 - BLOCK
      ?auto_58905 - BLOCK
      ?auto_58906 - BLOCK
    )
    :vars
    (
      ?auto_58908 - BLOCK
      ?auto_58907 - BLOCK
      ?auto_58909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58903 ?auto_58904 ) ) ( not ( = ?auto_58903 ?auto_58905 ) ) ( not ( = ?auto_58903 ?auto_58906 ) ) ( not ( = ?auto_58904 ?auto_58905 ) ) ( not ( = ?auto_58904 ?auto_58906 ) ) ( not ( = ?auto_58905 ?auto_58906 ) ) ( not ( = ?auto_58903 ?auto_58908 ) ) ( not ( = ?auto_58904 ?auto_58908 ) ) ( not ( = ?auto_58905 ?auto_58908 ) ) ( not ( = ?auto_58906 ?auto_58908 ) ) ( ON-TABLE ?auto_58907 ) ( not ( = ?auto_58907 ?auto_58908 ) ) ( not ( = ?auto_58907 ?auto_58906 ) ) ( not ( = ?auto_58907 ?auto_58905 ) ) ( not ( = ?auto_58903 ?auto_58907 ) ) ( not ( = ?auto_58904 ?auto_58907 ) ) ( ON ?auto_58903 ?auto_58909 ) ( not ( = ?auto_58903 ?auto_58909 ) ) ( not ( = ?auto_58904 ?auto_58909 ) ) ( not ( = ?auto_58905 ?auto_58909 ) ) ( not ( = ?auto_58906 ?auto_58909 ) ) ( not ( = ?auto_58908 ?auto_58909 ) ) ( not ( = ?auto_58907 ?auto_58909 ) ) ( ON ?auto_58904 ?auto_58903 ) ( ON-TABLE ?auto_58909 ) ( ON ?auto_58905 ?auto_58904 ) ( ON ?auto_58906 ?auto_58905 ) ( CLEAR ?auto_58906 ) ( HOLDING ?auto_58908 ) ( CLEAR ?auto_58907 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58907 ?auto_58908 )
      ( MAKE-4PILE ?auto_58903 ?auto_58904 ?auto_58905 ?auto_58906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58910 - BLOCK
      ?auto_58911 - BLOCK
      ?auto_58912 - BLOCK
      ?auto_58913 - BLOCK
    )
    :vars
    (
      ?auto_58914 - BLOCK
      ?auto_58915 - BLOCK
      ?auto_58916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58910 ?auto_58911 ) ) ( not ( = ?auto_58910 ?auto_58912 ) ) ( not ( = ?auto_58910 ?auto_58913 ) ) ( not ( = ?auto_58911 ?auto_58912 ) ) ( not ( = ?auto_58911 ?auto_58913 ) ) ( not ( = ?auto_58912 ?auto_58913 ) ) ( not ( = ?auto_58910 ?auto_58914 ) ) ( not ( = ?auto_58911 ?auto_58914 ) ) ( not ( = ?auto_58912 ?auto_58914 ) ) ( not ( = ?auto_58913 ?auto_58914 ) ) ( ON-TABLE ?auto_58915 ) ( not ( = ?auto_58915 ?auto_58914 ) ) ( not ( = ?auto_58915 ?auto_58913 ) ) ( not ( = ?auto_58915 ?auto_58912 ) ) ( not ( = ?auto_58910 ?auto_58915 ) ) ( not ( = ?auto_58911 ?auto_58915 ) ) ( ON ?auto_58910 ?auto_58916 ) ( not ( = ?auto_58910 ?auto_58916 ) ) ( not ( = ?auto_58911 ?auto_58916 ) ) ( not ( = ?auto_58912 ?auto_58916 ) ) ( not ( = ?auto_58913 ?auto_58916 ) ) ( not ( = ?auto_58914 ?auto_58916 ) ) ( not ( = ?auto_58915 ?auto_58916 ) ) ( ON ?auto_58911 ?auto_58910 ) ( ON-TABLE ?auto_58916 ) ( ON ?auto_58912 ?auto_58911 ) ( ON ?auto_58913 ?auto_58912 ) ( CLEAR ?auto_58915 ) ( ON ?auto_58914 ?auto_58913 ) ( CLEAR ?auto_58914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58916 ?auto_58910 ?auto_58911 ?auto_58912 ?auto_58913 )
      ( MAKE-4PILE ?auto_58910 ?auto_58911 ?auto_58912 ?auto_58913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58917 - BLOCK
      ?auto_58918 - BLOCK
      ?auto_58919 - BLOCK
      ?auto_58920 - BLOCK
    )
    :vars
    (
      ?auto_58922 - BLOCK
      ?auto_58921 - BLOCK
      ?auto_58923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58917 ?auto_58918 ) ) ( not ( = ?auto_58917 ?auto_58919 ) ) ( not ( = ?auto_58917 ?auto_58920 ) ) ( not ( = ?auto_58918 ?auto_58919 ) ) ( not ( = ?auto_58918 ?auto_58920 ) ) ( not ( = ?auto_58919 ?auto_58920 ) ) ( not ( = ?auto_58917 ?auto_58922 ) ) ( not ( = ?auto_58918 ?auto_58922 ) ) ( not ( = ?auto_58919 ?auto_58922 ) ) ( not ( = ?auto_58920 ?auto_58922 ) ) ( not ( = ?auto_58921 ?auto_58922 ) ) ( not ( = ?auto_58921 ?auto_58920 ) ) ( not ( = ?auto_58921 ?auto_58919 ) ) ( not ( = ?auto_58917 ?auto_58921 ) ) ( not ( = ?auto_58918 ?auto_58921 ) ) ( ON ?auto_58917 ?auto_58923 ) ( not ( = ?auto_58917 ?auto_58923 ) ) ( not ( = ?auto_58918 ?auto_58923 ) ) ( not ( = ?auto_58919 ?auto_58923 ) ) ( not ( = ?auto_58920 ?auto_58923 ) ) ( not ( = ?auto_58922 ?auto_58923 ) ) ( not ( = ?auto_58921 ?auto_58923 ) ) ( ON ?auto_58918 ?auto_58917 ) ( ON-TABLE ?auto_58923 ) ( ON ?auto_58919 ?auto_58918 ) ( ON ?auto_58920 ?auto_58919 ) ( ON ?auto_58922 ?auto_58920 ) ( CLEAR ?auto_58922 ) ( HOLDING ?auto_58921 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58921 )
      ( MAKE-4PILE ?auto_58917 ?auto_58918 ?auto_58919 ?auto_58920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_58924 - BLOCK
      ?auto_58925 - BLOCK
      ?auto_58926 - BLOCK
      ?auto_58927 - BLOCK
    )
    :vars
    (
      ?auto_58929 - BLOCK
      ?auto_58928 - BLOCK
      ?auto_58930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_58924 ?auto_58925 ) ) ( not ( = ?auto_58924 ?auto_58926 ) ) ( not ( = ?auto_58924 ?auto_58927 ) ) ( not ( = ?auto_58925 ?auto_58926 ) ) ( not ( = ?auto_58925 ?auto_58927 ) ) ( not ( = ?auto_58926 ?auto_58927 ) ) ( not ( = ?auto_58924 ?auto_58929 ) ) ( not ( = ?auto_58925 ?auto_58929 ) ) ( not ( = ?auto_58926 ?auto_58929 ) ) ( not ( = ?auto_58927 ?auto_58929 ) ) ( not ( = ?auto_58928 ?auto_58929 ) ) ( not ( = ?auto_58928 ?auto_58927 ) ) ( not ( = ?auto_58928 ?auto_58926 ) ) ( not ( = ?auto_58924 ?auto_58928 ) ) ( not ( = ?auto_58925 ?auto_58928 ) ) ( ON ?auto_58924 ?auto_58930 ) ( not ( = ?auto_58924 ?auto_58930 ) ) ( not ( = ?auto_58925 ?auto_58930 ) ) ( not ( = ?auto_58926 ?auto_58930 ) ) ( not ( = ?auto_58927 ?auto_58930 ) ) ( not ( = ?auto_58929 ?auto_58930 ) ) ( not ( = ?auto_58928 ?auto_58930 ) ) ( ON ?auto_58925 ?auto_58924 ) ( ON-TABLE ?auto_58930 ) ( ON ?auto_58926 ?auto_58925 ) ( ON ?auto_58927 ?auto_58926 ) ( ON ?auto_58929 ?auto_58927 ) ( ON ?auto_58928 ?auto_58929 ) ( CLEAR ?auto_58928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58930 ?auto_58924 ?auto_58925 ?auto_58926 ?auto_58927 ?auto_58929 )
      ( MAKE-4PILE ?auto_58924 ?auto_58925 ?auto_58926 ?auto_58927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58932 - BLOCK
    )
    :vars
    (
      ?auto_58933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58933 ?auto_58932 ) ( CLEAR ?auto_58933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58932 ) ( not ( = ?auto_58932 ?auto_58933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58933 ?auto_58932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58934 - BLOCK
    )
    :vars
    (
      ?auto_58935 - BLOCK
      ?auto_58936 - BLOCK
      ?auto_58937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58935 ?auto_58934 ) ( CLEAR ?auto_58935 ) ( ON-TABLE ?auto_58934 ) ( not ( = ?auto_58934 ?auto_58935 ) ) ( HOLDING ?auto_58936 ) ( CLEAR ?auto_58937 ) ( not ( = ?auto_58934 ?auto_58936 ) ) ( not ( = ?auto_58934 ?auto_58937 ) ) ( not ( = ?auto_58935 ?auto_58936 ) ) ( not ( = ?auto_58935 ?auto_58937 ) ) ( not ( = ?auto_58936 ?auto_58937 ) ) )
    :subtasks
    ( ( !STACK ?auto_58936 ?auto_58937 )
      ( MAKE-1PILE ?auto_58934 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58938 - BLOCK
    )
    :vars
    (
      ?auto_58940 - BLOCK
      ?auto_58939 - BLOCK
      ?auto_58941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58940 ?auto_58938 ) ( ON-TABLE ?auto_58938 ) ( not ( = ?auto_58938 ?auto_58940 ) ) ( CLEAR ?auto_58939 ) ( not ( = ?auto_58938 ?auto_58941 ) ) ( not ( = ?auto_58938 ?auto_58939 ) ) ( not ( = ?auto_58940 ?auto_58941 ) ) ( not ( = ?auto_58940 ?auto_58939 ) ) ( not ( = ?auto_58941 ?auto_58939 ) ) ( ON ?auto_58941 ?auto_58940 ) ( CLEAR ?auto_58941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58938 ?auto_58940 )
      ( MAKE-1PILE ?auto_58938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58942 - BLOCK
    )
    :vars
    (
      ?auto_58944 - BLOCK
      ?auto_58943 - BLOCK
      ?auto_58945 - BLOCK
      ?auto_58946 - BLOCK
      ?auto_58947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58944 ?auto_58942 ) ( ON-TABLE ?auto_58942 ) ( not ( = ?auto_58942 ?auto_58944 ) ) ( not ( = ?auto_58942 ?auto_58943 ) ) ( not ( = ?auto_58942 ?auto_58945 ) ) ( not ( = ?auto_58944 ?auto_58943 ) ) ( not ( = ?auto_58944 ?auto_58945 ) ) ( not ( = ?auto_58943 ?auto_58945 ) ) ( ON ?auto_58943 ?auto_58944 ) ( CLEAR ?auto_58943 ) ( HOLDING ?auto_58945 ) ( CLEAR ?auto_58946 ) ( ON-TABLE ?auto_58947 ) ( ON ?auto_58946 ?auto_58947 ) ( not ( = ?auto_58947 ?auto_58946 ) ) ( not ( = ?auto_58947 ?auto_58945 ) ) ( not ( = ?auto_58946 ?auto_58945 ) ) ( not ( = ?auto_58942 ?auto_58946 ) ) ( not ( = ?auto_58942 ?auto_58947 ) ) ( not ( = ?auto_58944 ?auto_58946 ) ) ( not ( = ?auto_58944 ?auto_58947 ) ) ( not ( = ?auto_58943 ?auto_58946 ) ) ( not ( = ?auto_58943 ?auto_58947 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58947 ?auto_58946 ?auto_58945 )
      ( MAKE-1PILE ?auto_58942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58948 - BLOCK
    )
    :vars
    (
      ?auto_58951 - BLOCK
      ?auto_58950 - BLOCK
      ?auto_58952 - BLOCK
      ?auto_58953 - BLOCK
      ?auto_58949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58951 ?auto_58948 ) ( ON-TABLE ?auto_58948 ) ( not ( = ?auto_58948 ?auto_58951 ) ) ( not ( = ?auto_58948 ?auto_58950 ) ) ( not ( = ?auto_58948 ?auto_58952 ) ) ( not ( = ?auto_58951 ?auto_58950 ) ) ( not ( = ?auto_58951 ?auto_58952 ) ) ( not ( = ?auto_58950 ?auto_58952 ) ) ( ON ?auto_58950 ?auto_58951 ) ( CLEAR ?auto_58953 ) ( ON-TABLE ?auto_58949 ) ( ON ?auto_58953 ?auto_58949 ) ( not ( = ?auto_58949 ?auto_58953 ) ) ( not ( = ?auto_58949 ?auto_58952 ) ) ( not ( = ?auto_58953 ?auto_58952 ) ) ( not ( = ?auto_58948 ?auto_58953 ) ) ( not ( = ?auto_58948 ?auto_58949 ) ) ( not ( = ?auto_58951 ?auto_58953 ) ) ( not ( = ?auto_58951 ?auto_58949 ) ) ( not ( = ?auto_58950 ?auto_58953 ) ) ( not ( = ?auto_58950 ?auto_58949 ) ) ( ON ?auto_58952 ?auto_58950 ) ( CLEAR ?auto_58952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_58948 ?auto_58951 ?auto_58950 )
      ( MAKE-1PILE ?auto_58948 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58954 - BLOCK
    )
    :vars
    (
      ?auto_58957 - BLOCK
      ?auto_58956 - BLOCK
      ?auto_58958 - BLOCK
      ?auto_58955 - BLOCK
      ?auto_58959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58957 ?auto_58954 ) ( ON-TABLE ?auto_58954 ) ( not ( = ?auto_58954 ?auto_58957 ) ) ( not ( = ?auto_58954 ?auto_58956 ) ) ( not ( = ?auto_58954 ?auto_58958 ) ) ( not ( = ?auto_58957 ?auto_58956 ) ) ( not ( = ?auto_58957 ?auto_58958 ) ) ( not ( = ?auto_58956 ?auto_58958 ) ) ( ON ?auto_58956 ?auto_58957 ) ( ON-TABLE ?auto_58955 ) ( not ( = ?auto_58955 ?auto_58959 ) ) ( not ( = ?auto_58955 ?auto_58958 ) ) ( not ( = ?auto_58959 ?auto_58958 ) ) ( not ( = ?auto_58954 ?auto_58959 ) ) ( not ( = ?auto_58954 ?auto_58955 ) ) ( not ( = ?auto_58957 ?auto_58959 ) ) ( not ( = ?auto_58957 ?auto_58955 ) ) ( not ( = ?auto_58956 ?auto_58959 ) ) ( not ( = ?auto_58956 ?auto_58955 ) ) ( ON ?auto_58958 ?auto_58956 ) ( CLEAR ?auto_58958 ) ( HOLDING ?auto_58959 ) ( CLEAR ?auto_58955 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58955 ?auto_58959 )
      ( MAKE-1PILE ?auto_58954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58960 - BLOCK
    )
    :vars
    (
      ?auto_58961 - BLOCK
      ?auto_58962 - BLOCK
      ?auto_58964 - BLOCK
      ?auto_58963 - BLOCK
      ?auto_58965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58961 ?auto_58960 ) ( ON-TABLE ?auto_58960 ) ( not ( = ?auto_58960 ?auto_58961 ) ) ( not ( = ?auto_58960 ?auto_58962 ) ) ( not ( = ?auto_58960 ?auto_58964 ) ) ( not ( = ?auto_58961 ?auto_58962 ) ) ( not ( = ?auto_58961 ?auto_58964 ) ) ( not ( = ?auto_58962 ?auto_58964 ) ) ( ON ?auto_58962 ?auto_58961 ) ( ON-TABLE ?auto_58963 ) ( not ( = ?auto_58963 ?auto_58965 ) ) ( not ( = ?auto_58963 ?auto_58964 ) ) ( not ( = ?auto_58965 ?auto_58964 ) ) ( not ( = ?auto_58960 ?auto_58965 ) ) ( not ( = ?auto_58960 ?auto_58963 ) ) ( not ( = ?auto_58961 ?auto_58965 ) ) ( not ( = ?auto_58961 ?auto_58963 ) ) ( not ( = ?auto_58962 ?auto_58965 ) ) ( not ( = ?auto_58962 ?auto_58963 ) ) ( ON ?auto_58964 ?auto_58962 ) ( CLEAR ?auto_58963 ) ( ON ?auto_58965 ?auto_58964 ) ( CLEAR ?auto_58965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_58960 ?auto_58961 ?auto_58962 ?auto_58964 )
      ( MAKE-1PILE ?auto_58960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58966 - BLOCK
    )
    :vars
    (
      ?auto_58968 - BLOCK
      ?auto_58969 - BLOCK
      ?auto_58971 - BLOCK
      ?auto_58970 - BLOCK
      ?auto_58967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58968 ?auto_58966 ) ( ON-TABLE ?auto_58966 ) ( not ( = ?auto_58966 ?auto_58968 ) ) ( not ( = ?auto_58966 ?auto_58969 ) ) ( not ( = ?auto_58966 ?auto_58971 ) ) ( not ( = ?auto_58968 ?auto_58969 ) ) ( not ( = ?auto_58968 ?auto_58971 ) ) ( not ( = ?auto_58969 ?auto_58971 ) ) ( ON ?auto_58969 ?auto_58968 ) ( not ( = ?auto_58970 ?auto_58967 ) ) ( not ( = ?auto_58970 ?auto_58971 ) ) ( not ( = ?auto_58967 ?auto_58971 ) ) ( not ( = ?auto_58966 ?auto_58967 ) ) ( not ( = ?auto_58966 ?auto_58970 ) ) ( not ( = ?auto_58968 ?auto_58967 ) ) ( not ( = ?auto_58968 ?auto_58970 ) ) ( not ( = ?auto_58969 ?auto_58967 ) ) ( not ( = ?auto_58969 ?auto_58970 ) ) ( ON ?auto_58971 ?auto_58969 ) ( ON ?auto_58967 ?auto_58971 ) ( CLEAR ?auto_58967 ) ( HOLDING ?auto_58970 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_58970 )
      ( MAKE-1PILE ?auto_58966 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58972 - BLOCK
    )
    :vars
    (
      ?auto_58976 - BLOCK
      ?auto_58975 - BLOCK
      ?auto_58977 - BLOCK
      ?auto_58974 - BLOCK
      ?auto_58973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58976 ?auto_58972 ) ( ON-TABLE ?auto_58972 ) ( not ( = ?auto_58972 ?auto_58976 ) ) ( not ( = ?auto_58972 ?auto_58975 ) ) ( not ( = ?auto_58972 ?auto_58977 ) ) ( not ( = ?auto_58976 ?auto_58975 ) ) ( not ( = ?auto_58976 ?auto_58977 ) ) ( not ( = ?auto_58975 ?auto_58977 ) ) ( ON ?auto_58975 ?auto_58976 ) ( not ( = ?auto_58974 ?auto_58973 ) ) ( not ( = ?auto_58974 ?auto_58977 ) ) ( not ( = ?auto_58973 ?auto_58977 ) ) ( not ( = ?auto_58972 ?auto_58973 ) ) ( not ( = ?auto_58972 ?auto_58974 ) ) ( not ( = ?auto_58976 ?auto_58973 ) ) ( not ( = ?auto_58976 ?auto_58974 ) ) ( not ( = ?auto_58975 ?auto_58973 ) ) ( not ( = ?auto_58975 ?auto_58974 ) ) ( ON ?auto_58977 ?auto_58975 ) ( ON ?auto_58973 ?auto_58977 ) ( ON ?auto_58974 ?auto_58973 ) ( CLEAR ?auto_58974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58972 ?auto_58976 ?auto_58975 ?auto_58977 ?auto_58973 )
      ( MAKE-1PILE ?auto_58972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58978 - BLOCK
    )
    :vars
    (
      ?auto_58979 - BLOCK
      ?auto_58982 - BLOCK
      ?auto_58981 - BLOCK
      ?auto_58980 - BLOCK
      ?auto_58983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58979 ?auto_58978 ) ( ON-TABLE ?auto_58978 ) ( not ( = ?auto_58978 ?auto_58979 ) ) ( not ( = ?auto_58978 ?auto_58982 ) ) ( not ( = ?auto_58978 ?auto_58981 ) ) ( not ( = ?auto_58979 ?auto_58982 ) ) ( not ( = ?auto_58979 ?auto_58981 ) ) ( not ( = ?auto_58982 ?auto_58981 ) ) ( ON ?auto_58982 ?auto_58979 ) ( not ( = ?auto_58980 ?auto_58983 ) ) ( not ( = ?auto_58980 ?auto_58981 ) ) ( not ( = ?auto_58983 ?auto_58981 ) ) ( not ( = ?auto_58978 ?auto_58983 ) ) ( not ( = ?auto_58978 ?auto_58980 ) ) ( not ( = ?auto_58979 ?auto_58983 ) ) ( not ( = ?auto_58979 ?auto_58980 ) ) ( not ( = ?auto_58982 ?auto_58983 ) ) ( not ( = ?auto_58982 ?auto_58980 ) ) ( ON ?auto_58981 ?auto_58982 ) ( ON ?auto_58983 ?auto_58981 ) ( HOLDING ?auto_58980 ) ( CLEAR ?auto_58983 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_58978 ?auto_58979 ?auto_58982 ?auto_58981 ?auto_58983 ?auto_58980 )
      ( MAKE-1PILE ?auto_58978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58984 - BLOCK
    )
    :vars
    (
      ?auto_58985 - BLOCK
      ?auto_58988 - BLOCK
      ?auto_58986 - BLOCK
      ?auto_58989 - BLOCK
      ?auto_58987 - BLOCK
      ?auto_58990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58985 ?auto_58984 ) ( ON-TABLE ?auto_58984 ) ( not ( = ?auto_58984 ?auto_58985 ) ) ( not ( = ?auto_58984 ?auto_58988 ) ) ( not ( = ?auto_58984 ?auto_58986 ) ) ( not ( = ?auto_58985 ?auto_58988 ) ) ( not ( = ?auto_58985 ?auto_58986 ) ) ( not ( = ?auto_58988 ?auto_58986 ) ) ( ON ?auto_58988 ?auto_58985 ) ( not ( = ?auto_58989 ?auto_58987 ) ) ( not ( = ?auto_58989 ?auto_58986 ) ) ( not ( = ?auto_58987 ?auto_58986 ) ) ( not ( = ?auto_58984 ?auto_58987 ) ) ( not ( = ?auto_58984 ?auto_58989 ) ) ( not ( = ?auto_58985 ?auto_58987 ) ) ( not ( = ?auto_58985 ?auto_58989 ) ) ( not ( = ?auto_58988 ?auto_58987 ) ) ( not ( = ?auto_58988 ?auto_58989 ) ) ( ON ?auto_58986 ?auto_58988 ) ( ON ?auto_58987 ?auto_58986 ) ( CLEAR ?auto_58987 ) ( ON ?auto_58989 ?auto_58990 ) ( CLEAR ?auto_58989 ) ( HAND-EMPTY ) ( not ( = ?auto_58984 ?auto_58990 ) ) ( not ( = ?auto_58985 ?auto_58990 ) ) ( not ( = ?auto_58988 ?auto_58990 ) ) ( not ( = ?auto_58986 ?auto_58990 ) ) ( not ( = ?auto_58989 ?auto_58990 ) ) ( not ( = ?auto_58987 ?auto_58990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_58989 ?auto_58990 )
      ( MAKE-1PILE ?auto_58984 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58991 - BLOCK
    )
    :vars
    (
      ?auto_58992 - BLOCK
      ?auto_58996 - BLOCK
      ?auto_58994 - BLOCK
      ?auto_58997 - BLOCK
      ?auto_58993 - BLOCK
      ?auto_58995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_58992 ?auto_58991 ) ( ON-TABLE ?auto_58991 ) ( not ( = ?auto_58991 ?auto_58992 ) ) ( not ( = ?auto_58991 ?auto_58996 ) ) ( not ( = ?auto_58991 ?auto_58994 ) ) ( not ( = ?auto_58992 ?auto_58996 ) ) ( not ( = ?auto_58992 ?auto_58994 ) ) ( not ( = ?auto_58996 ?auto_58994 ) ) ( ON ?auto_58996 ?auto_58992 ) ( not ( = ?auto_58997 ?auto_58993 ) ) ( not ( = ?auto_58997 ?auto_58994 ) ) ( not ( = ?auto_58993 ?auto_58994 ) ) ( not ( = ?auto_58991 ?auto_58993 ) ) ( not ( = ?auto_58991 ?auto_58997 ) ) ( not ( = ?auto_58992 ?auto_58993 ) ) ( not ( = ?auto_58992 ?auto_58997 ) ) ( not ( = ?auto_58996 ?auto_58993 ) ) ( not ( = ?auto_58996 ?auto_58997 ) ) ( ON ?auto_58994 ?auto_58996 ) ( ON ?auto_58997 ?auto_58995 ) ( CLEAR ?auto_58997 ) ( not ( = ?auto_58991 ?auto_58995 ) ) ( not ( = ?auto_58992 ?auto_58995 ) ) ( not ( = ?auto_58996 ?auto_58995 ) ) ( not ( = ?auto_58994 ?auto_58995 ) ) ( not ( = ?auto_58997 ?auto_58995 ) ) ( not ( = ?auto_58993 ?auto_58995 ) ) ( HOLDING ?auto_58993 ) ( CLEAR ?auto_58994 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_58991 ?auto_58992 ?auto_58996 ?auto_58994 ?auto_58993 )
      ( MAKE-1PILE ?auto_58991 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_58998 - BLOCK
    )
    :vars
    (
      ?auto_59000 - BLOCK
      ?auto_58999 - BLOCK
      ?auto_59003 - BLOCK
      ?auto_59002 - BLOCK
      ?auto_59001 - BLOCK
      ?auto_59004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59000 ?auto_58998 ) ( ON-TABLE ?auto_58998 ) ( not ( = ?auto_58998 ?auto_59000 ) ) ( not ( = ?auto_58998 ?auto_58999 ) ) ( not ( = ?auto_58998 ?auto_59003 ) ) ( not ( = ?auto_59000 ?auto_58999 ) ) ( not ( = ?auto_59000 ?auto_59003 ) ) ( not ( = ?auto_58999 ?auto_59003 ) ) ( ON ?auto_58999 ?auto_59000 ) ( not ( = ?auto_59002 ?auto_59001 ) ) ( not ( = ?auto_59002 ?auto_59003 ) ) ( not ( = ?auto_59001 ?auto_59003 ) ) ( not ( = ?auto_58998 ?auto_59001 ) ) ( not ( = ?auto_58998 ?auto_59002 ) ) ( not ( = ?auto_59000 ?auto_59001 ) ) ( not ( = ?auto_59000 ?auto_59002 ) ) ( not ( = ?auto_58999 ?auto_59001 ) ) ( not ( = ?auto_58999 ?auto_59002 ) ) ( ON ?auto_59003 ?auto_58999 ) ( ON ?auto_59002 ?auto_59004 ) ( not ( = ?auto_58998 ?auto_59004 ) ) ( not ( = ?auto_59000 ?auto_59004 ) ) ( not ( = ?auto_58999 ?auto_59004 ) ) ( not ( = ?auto_59003 ?auto_59004 ) ) ( not ( = ?auto_59002 ?auto_59004 ) ) ( not ( = ?auto_59001 ?auto_59004 ) ) ( CLEAR ?auto_59003 ) ( ON ?auto_59001 ?auto_59002 ) ( CLEAR ?auto_59001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59004 ?auto_59002 )
      ( MAKE-1PILE ?auto_58998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59005 - BLOCK
    )
    :vars
    (
      ?auto_59011 - BLOCK
      ?auto_59008 - BLOCK
      ?auto_59009 - BLOCK
      ?auto_59006 - BLOCK
      ?auto_59010 - BLOCK
      ?auto_59007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59011 ?auto_59005 ) ( ON-TABLE ?auto_59005 ) ( not ( = ?auto_59005 ?auto_59011 ) ) ( not ( = ?auto_59005 ?auto_59008 ) ) ( not ( = ?auto_59005 ?auto_59009 ) ) ( not ( = ?auto_59011 ?auto_59008 ) ) ( not ( = ?auto_59011 ?auto_59009 ) ) ( not ( = ?auto_59008 ?auto_59009 ) ) ( ON ?auto_59008 ?auto_59011 ) ( not ( = ?auto_59006 ?auto_59010 ) ) ( not ( = ?auto_59006 ?auto_59009 ) ) ( not ( = ?auto_59010 ?auto_59009 ) ) ( not ( = ?auto_59005 ?auto_59010 ) ) ( not ( = ?auto_59005 ?auto_59006 ) ) ( not ( = ?auto_59011 ?auto_59010 ) ) ( not ( = ?auto_59011 ?auto_59006 ) ) ( not ( = ?auto_59008 ?auto_59010 ) ) ( not ( = ?auto_59008 ?auto_59006 ) ) ( ON ?auto_59006 ?auto_59007 ) ( not ( = ?auto_59005 ?auto_59007 ) ) ( not ( = ?auto_59011 ?auto_59007 ) ) ( not ( = ?auto_59008 ?auto_59007 ) ) ( not ( = ?auto_59009 ?auto_59007 ) ) ( not ( = ?auto_59006 ?auto_59007 ) ) ( not ( = ?auto_59010 ?auto_59007 ) ) ( ON ?auto_59010 ?auto_59006 ) ( CLEAR ?auto_59010 ) ( ON-TABLE ?auto_59007 ) ( HOLDING ?auto_59009 ) ( CLEAR ?auto_59008 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59005 ?auto_59011 ?auto_59008 ?auto_59009 )
      ( MAKE-1PILE ?auto_59005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59012 - BLOCK
    )
    :vars
    (
      ?auto_59014 - BLOCK
      ?auto_59017 - BLOCK
      ?auto_59015 - BLOCK
      ?auto_59018 - BLOCK
      ?auto_59013 - BLOCK
      ?auto_59016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59014 ?auto_59012 ) ( ON-TABLE ?auto_59012 ) ( not ( = ?auto_59012 ?auto_59014 ) ) ( not ( = ?auto_59012 ?auto_59017 ) ) ( not ( = ?auto_59012 ?auto_59015 ) ) ( not ( = ?auto_59014 ?auto_59017 ) ) ( not ( = ?auto_59014 ?auto_59015 ) ) ( not ( = ?auto_59017 ?auto_59015 ) ) ( ON ?auto_59017 ?auto_59014 ) ( not ( = ?auto_59018 ?auto_59013 ) ) ( not ( = ?auto_59018 ?auto_59015 ) ) ( not ( = ?auto_59013 ?auto_59015 ) ) ( not ( = ?auto_59012 ?auto_59013 ) ) ( not ( = ?auto_59012 ?auto_59018 ) ) ( not ( = ?auto_59014 ?auto_59013 ) ) ( not ( = ?auto_59014 ?auto_59018 ) ) ( not ( = ?auto_59017 ?auto_59013 ) ) ( not ( = ?auto_59017 ?auto_59018 ) ) ( ON ?auto_59018 ?auto_59016 ) ( not ( = ?auto_59012 ?auto_59016 ) ) ( not ( = ?auto_59014 ?auto_59016 ) ) ( not ( = ?auto_59017 ?auto_59016 ) ) ( not ( = ?auto_59015 ?auto_59016 ) ) ( not ( = ?auto_59018 ?auto_59016 ) ) ( not ( = ?auto_59013 ?auto_59016 ) ) ( ON ?auto_59013 ?auto_59018 ) ( ON-TABLE ?auto_59016 ) ( CLEAR ?auto_59017 ) ( ON ?auto_59015 ?auto_59013 ) ( CLEAR ?auto_59015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59016 ?auto_59018 ?auto_59013 )
      ( MAKE-1PILE ?auto_59012 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59019 - BLOCK
    )
    :vars
    (
      ?auto_59020 - BLOCK
      ?auto_59025 - BLOCK
      ?auto_59022 - BLOCK
      ?auto_59023 - BLOCK
      ?auto_59024 - BLOCK
      ?auto_59021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59020 ?auto_59019 ) ( ON-TABLE ?auto_59019 ) ( not ( = ?auto_59019 ?auto_59020 ) ) ( not ( = ?auto_59019 ?auto_59025 ) ) ( not ( = ?auto_59019 ?auto_59022 ) ) ( not ( = ?auto_59020 ?auto_59025 ) ) ( not ( = ?auto_59020 ?auto_59022 ) ) ( not ( = ?auto_59025 ?auto_59022 ) ) ( not ( = ?auto_59023 ?auto_59024 ) ) ( not ( = ?auto_59023 ?auto_59022 ) ) ( not ( = ?auto_59024 ?auto_59022 ) ) ( not ( = ?auto_59019 ?auto_59024 ) ) ( not ( = ?auto_59019 ?auto_59023 ) ) ( not ( = ?auto_59020 ?auto_59024 ) ) ( not ( = ?auto_59020 ?auto_59023 ) ) ( not ( = ?auto_59025 ?auto_59024 ) ) ( not ( = ?auto_59025 ?auto_59023 ) ) ( ON ?auto_59023 ?auto_59021 ) ( not ( = ?auto_59019 ?auto_59021 ) ) ( not ( = ?auto_59020 ?auto_59021 ) ) ( not ( = ?auto_59025 ?auto_59021 ) ) ( not ( = ?auto_59022 ?auto_59021 ) ) ( not ( = ?auto_59023 ?auto_59021 ) ) ( not ( = ?auto_59024 ?auto_59021 ) ) ( ON ?auto_59024 ?auto_59023 ) ( ON-TABLE ?auto_59021 ) ( ON ?auto_59022 ?auto_59024 ) ( CLEAR ?auto_59022 ) ( HOLDING ?auto_59025 ) ( CLEAR ?auto_59020 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59019 ?auto_59020 ?auto_59025 )
      ( MAKE-1PILE ?auto_59019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59026 - BLOCK
    )
    :vars
    (
      ?auto_59028 - BLOCK
      ?auto_59030 - BLOCK
      ?auto_59031 - BLOCK
      ?auto_59032 - BLOCK
      ?auto_59027 - BLOCK
      ?auto_59029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59028 ?auto_59026 ) ( ON-TABLE ?auto_59026 ) ( not ( = ?auto_59026 ?auto_59028 ) ) ( not ( = ?auto_59026 ?auto_59030 ) ) ( not ( = ?auto_59026 ?auto_59031 ) ) ( not ( = ?auto_59028 ?auto_59030 ) ) ( not ( = ?auto_59028 ?auto_59031 ) ) ( not ( = ?auto_59030 ?auto_59031 ) ) ( not ( = ?auto_59032 ?auto_59027 ) ) ( not ( = ?auto_59032 ?auto_59031 ) ) ( not ( = ?auto_59027 ?auto_59031 ) ) ( not ( = ?auto_59026 ?auto_59027 ) ) ( not ( = ?auto_59026 ?auto_59032 ) ) ( not ( = ?auto_59028 ?auto_59027 ) ) ( not ( = ?auto_59028 ?auto_59032 ) ) ( not ( = ?auto_59030 ?auto_59027 ) ) ( not ( = ?auto_59030 ?auto_59032 ) ) ( ON ?auto_59032 ?auto_59029 ) ( not ( = ?auto_59026 ?auto_59029 ) ) ( not ( = ?auto_59028 ?auto_59029 ) ) ( not ( = ?auto_59030 ?auto_59029 ) ) ( not ( = ?auto_59031 ?auto_59029 ) ) ( not ( = ?auto_59032 ?auto_59029 ) ) ( not ( = ?auto_59027 ?auto_59029 ) ) ( ON ?auto_59027 ?auto_59032 ) ( ON-TABLE ?auto_59029 ) ( ON ?auto_59031 ?auto_59027 ) ( CLEAR ?auto_59028 ) ( ON ?auto_59030 ?auto_59031 ) ( CLEAR ?auto_59030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59029 ?auto_59032 ?auto_59027 ?auto_59031 )
      ( MAKE-1PILE ?auto_59026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59047 - BLOCK
    )
    :vars
    (
      ?auto_59053 - BLOCK
      ?auto_59049 - BLOCK
      ?auto_59051 - BLOCK
      ?auto_59048 - BLOCK
      ?auto_59050 - BLOCK
      ?auto_59052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59047 ?auto_59053 ) ) ( not ( = ?auto_59047 ?auto_59049 ) ) ( not ( = ?auto_59047 ?auto_59051 ) ) ( not ( = ?auto_59053 ?auto_59049 ) ) ( not ( = ?auto_59053 ?auto_59051 ) ) ( not ( = ?auto_59049 ?auto_59051 ) ) ( not ( = ?auto_59048 ?auto_59050 ) ) ( not ( = ?auto_59048 ?auto_59051 ) ) ( not ( = ?auto_59050 ?auto_59051 ) ) ( not ( = ?auto_59047 ?auto_59050 ) ) ( not ( = ?auto_59047 ?auto_59048 ) ) ( not ( = ?auto_59053 ?auto_59050 ) ) ( not ( = ?auto_59053 ?auto_59048 ) ) ( not ( = ?auto_59049 ?auto_59050 ) ) ( not ( = ?auto_59049 ?auto_59048 ) ) ( ON ?auto_59048 ?auto_59052 ) ( not ( = ?auto_59047 ?auto_59052 ) ) ( not ( = ?auto_59053 ?auto_59052 ) ) ( not ( = ?auto_59049 ?auto_59052 ) ) ( not ( = ?auto_59051 ?auto_59052 ) ) ( not ( = ?auto_59048 ?auto_59052 ) ) ( not ( = ?auto_59050 ?auto_59052 ) ) ( ON ?auto_59050 ?auto_59048 ) ( ON-TABLE ?auto_59052 ) ( ON ?auto_59051 ?auto_59050 ) ( ON ?auto_59049 ?auto_59051 ) ( ON ?auto_59053 ?auto_59049 ) ( CLEAR ?auto_59053 ) ( HOLDING ?auto_59047 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59047 ?auto_59053 )
      ( MAKE-1PILE ?auto_59047 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_59054 - BLOCK
    )
    :vars
    (
      ?auto_59060 - BLOCK
      ?auto_59059 - BLOCK
      ?auto_59057 - BLOCK
      ?auto_59056 - BLOCK
      ?auto_59055 - BLOCK
      ?auto_59058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59054 ?auto_59060 ) ) ( not ( = ?auto_59054 ?auto_59059 ) ) ( not ( = ?auto_59054 ?auto_59057 ) ) ( not ( = ?auto_59060 ?auto_59059 ) ) ( not ( = ?auto_59060 ?auto_59057 ) ) ( not ( = ?auto_59059 ?auto_59057 ) ) ( not ( = ?auto_59056 ?auto_59055 ) ) ( not ( = ?auto_59056 ?auto_59057 ) ) ( not ( = ?auto_59055 ?auto_59057 ) ) ( not ( = ?auto_59054 ?auto_59055 ) ) ( not ( = ?auto_59054 ?auto_59056 ) ) ( not ( = ?auto_59060 ?auto_59055 ) ) ( not ( = ?auto_59060 ?auto_59056 ) ) ( not ( = ?auto_59059 ?auto_59055 ) ) ( not ( = ?auto_59059 ?auto_59056 ) ) ( ON ?auto_59056 ?auto_59058 ) ( not ( = ?auto_59054 ?auto_59058 ) ) ( not ( = ?auto_59060 ?auto_59058 ) ) ( not ( = ?auto_59059 ?auto_59058 ) ) ( not ( = ?auto_59057 ?auto_59058 ) ) ( not ( = ?auto_59056 ?auto_59058 ) ) ( not ( = ?auto_59055 ?auto_59058 ) ) ( ON ?auto_59055 ?auto_59056 ) ( ON-TABLE ?auto_59058 ) ( ON ?auto_59057 ?auto_59055 ) ( ON ?auto_59059 ?auto_59057 ) ( ON ?auto_59060 ?auto_59059 ) ( ON ?auto_59054 ?auto_59060 ) ( CLEAR ?auto_59054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59058 ?auto_59056 ?auto_59055 ?auto_59057 ?auto_59059 ?auto_59060 )
      ( MAKE-1PILE ?auto_59054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59066 - BLOCK
      ?auto_59067 - BLOCK
      ?auto_59068 - BLOCK
      ?auto_59069 - BLOCK
      ?auto_59070 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59070 ) ( CLEAR ?auto_59069 ) ( ON-TABLE ?auto_59066 ) ( ON ?auto_59067 ?auto_59066 ) ( ON ?auto_59068 ?auto_59067 ) ( ON ?auto_59069 ?auto_59068 ) ( not ( = ?auto_59066 ?auto_59067 ) ) ( not ( = ?auto_59066 ?auto_59068 ) ) ( not ( = ?auto_59066 ?auto_59069 ) ) ( not ( = ?auto_59066 ?auto_59070 ) ) ( not ( = ?auto_59067 ?auto_59068 ) ) ( not ( = ?auto_59067 ?auto_59069 ) ) ( not ( = ?auto_59067 ?auto_59070 ) ) ( not ( = ?auto_59068 ?auto_59069 ) ) ( not ( = ?auto_59068 ?auto_59070 ) ) ( not ( = ?auto_59069 ?auto_59070 ) ) )
    :subtasks
    ( ( !STACK ?auto_59070 ?auto_59069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59071 - BLOCK
      ?auto_59072 - BLOCK
      ?auto_59073 - BLOCK
      ?auto_59074 - BLOCK
      ?auto_59075 - BLOCK
    )
    :vars
    (
      ?auto_59076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59074 ) ( ON-TABLE ?auto_59071 ) ( ON ?auto_59072 ?auto_59071 ) ( ON ?auto_59073 ?auto_59072 ) ( ON ?auto_59074 ?auto_59073 ) ( not ( = ?auto_59071 ?auto_59072 ) ) ( not ( = ?auto_59071 ?auto_59073 ) ) ( not ( = ?auto_59071 ?auto_59074 ) ) ( not ( = ?auto_59071 ?auto_59075 ) ) ( not ( = ?auto_59072 ?auto_59073 ) ) ( not ( = ?auto_59072 ?auto_59074 ) ) ( not ( = ?auto_59072 ?auto_59075 ) ) ( not ( = ?auto_59073 ?auto_59074 ) ) ( not ( = ?auto_59073 ?auto_59075 ) ) ( not ( = ?auto_59074 ?auto_59075 ) ) ( ON ?auto_59075 ?auto_59076 ) ( CLEAR ?auto_59075 ) ( HAND-EMPTY ) ( not ( = ?auto_59071 ?auto_59076 ) ) ( not ( = ?auto_59072 ?auto_59076 ) ) ( not ( = ?auto_59073 ?auto_59076 ) ) ( not ( = ?auto_59074 ?auto_59076 ) ) ( not ( = ?auto_59075 ?auto_59076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59075 ?auto_59076 )
      ( MAKE-5PILE ?auto_59071 ?auto_59072 ?auto_59073 ?auto_59074 ?auto_59075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59077 - BLOCK
      ?auto_59078 - BLOCK
      ?auto_59079 - BLOCK
      ?auto_59080 - BLOCK
      ?auto_59081 - BLOCK
    )
    :vars
    (
      ?auto_59082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59077 ) ( ON ?auto_59078 ?auto_59077 ) ( ON ?auto_59079 ?auto_59078 ) ( not ( = ?auto_59077 ?auto_59078 ) ) ( not ( = ?auto_59077 ?auto_59079 ) ) ( not ( = ?auto_59077 ?auto_59080 ) ) ( not ( = ?auto_59077 ?auto_59081 ) ) ( not ( = ?auto_59078 ?auto_59079 ) ) ( not ( = ?auto_59078 ?auto_59080 ) ) ( not ( = ?auto_59078 ?auto_59081 ) ) ( not ( = ?auto_59079 ?auto_59080 ) ) ( not ( = ?auto_59079 ?auto_59081 ) ) ( not ( = ?auto_59080 ?auto_59081 ) ) ( ON ?auto_59081 ?auto_59082 ) ( CLEAR ?auto_59081 ) ( not ( = ?auto_59077 ?auto_59082 ) ) ( not ( = ?auto_59078 ?auto_59082 ) ) ( not ( = ?auto_59079 ?auto_59082 ) ) ( not ( = ?auto_59080 ?auto_59082 ) ) ( not ( = ?auto_59081 ?auto_59082 ) ) ( HOLDING ?auto_59080 ) ( CLEAR ?auto_59079 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59077 ?auto_59078 ?auto_59079 ?auto_59080 )
      ( MAKE-5PILE ?auto_59077 ?auto_59078 ?auto_59079 ?auto_59080 ?auto_59081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59083 - BLOCK
      ?auto_59084 - BLOCK
      ?auto_59085 - BLOCK
      ?auto_59086 - BLOCK
      ?auto_59087 - BLOCK
    )
    :vars
    (
      ?auto_59088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59083 ) ( ON ?auto_59084 ?auto_59083 ) ( ON ?auto_59085 ?auto_59084 ) ( not ( = ?auto_59083 ?auto_59084 ) ) ( not ( = ?auto_59083 ?auto_59085 ) ) ( not ( = ?auto_59083 ?auto_59086 ) ) ( not ( = ?auto_59083 ?auto_59087 ) ) ( not ( = ?auto_59084 ?auto_59085 ) ) ( not ( = ?auto_59084 ?auto_59086 ) ) ( not ( = ?auto_59084 ?auto_59087 ) ) ( not ( = ?auto_59085 ?auto_59086 ) ) ( not ( = ?auto_59085 ?auto_59087 ) ) ( not ( = ?auto_59086 ?auto_59087 ) ) ( ON ?auto_59087 ?auto_59088 ) ( not ( = ?auto_59083 ?auto_59088 ) ) ( not ( = ?auto_59084 ?auto_59088 ) ) ( not ( = ?auto_59085 ?auto_59088 ) ) ( not ( = ?auto_59086 ?auto_59088 ) ) ( not ( = ?auto_59087 ?auto_59088 ) ) ( CLEAR ?auto_59085 ) ( ON ?auto_59086 ?auto_59087 ) ( CLEAR ?auto_59086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59088 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59088 ?auto_59087 )
      ( MAKE-5PILE ?auto_59083 ?auto_59084 ?auto_59085 ?auto_59086 ?auto_59087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59089 - BLOCK
      ?auto_59090 - BLOCK
      ?auto_59091 - BLOCK
      ?auto_59092 - BLOCK
      ?auto_59093 - BLOCK
    )
    :vars
    (
      ?auto_59094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59089 ) ( ON ?auto_59090 ?auto_59089 ) ( not ( = ?auto_59089 ?auto_59090 ) ) ( not ( = ?auto_59089 ?auto_59091 ) ) ( not ( = ?auto_59089 ?auto_59092 ) ) ( not ( = ?auto_59089 ?auto_59093 ) ) ( not ( = ?auto_59090 ?auto_59091 ) ) ( not ( = ?auto_59090 ?auto_59092 ) ) ( not ( = ?auto_59090 ?auto_59093 ) ) ( not ( = ?auto_59091 ?auto_59092 ) ) ( not ( = ?auto_59091 ?auto_59093 ) ) ( not ( = ?auto_59092 ?auto_59093 ) ) ( ON ?auto_59093 ?auto_59094 ) ( not ( = ?auto_59089 ?auto_59094 ) ) ( not ( = ?auto_59090 ?auto_59094 ) ) ( not ( = ?auto_59091 ?auto_59094 ) ) ( not ( = ?auto_59092 ?auto_59094 ) ) ( not ( = ?auto_59093 ?auto_59094 ) ) ( ON ?auto_59092 ?auto_59093 ) ( CLEAR ?auto_59092 ) ( ON-TABLE ?auto_59094 ) ( HOLDING ?auto_59091 ) ( CLEAR ?auto_59090 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59089 ?auto_59090 ?auto_59091 )
      ( MAKE-5PILE ?auto_59089 ?auto_59090 ?auto_59091 ?auto_59092 ?auto_59093 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59095 - BLOCK
      ?auto_59096 - BLOCK
      ?auto_59097 - BLOCK
      ?auto_59098 - BLOCK
      ?auto_59099 - BLOCK
    )
    :vars
    (
      ?auto_59100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59095 ) ( ON ?auto_59096 ?auto_59095 ) ( not ( = ?auto_59095 ?auto_59096 ) ) ( not ( = ?auto_59095 ?auto_59097 ) ) ( not ( = ?auto_59095 ?auto_59098 ) ) ( not ( = ?auto_59095 ?auto_59099 ) ) ( not ( = ?auto_59096 ?auto_59097 ) ) ( not ( = ?auto_59096 ?auto_59098 ) ) ( not ( = ?auto_59096 ?auto_59099 ) ) ( not ( = ?auto_59097 ?auto_59098 ) ) ( not ( = ?auto_59097 ?auto_59099 ) ) ( not ( = ?auto_59098 ?auto_59099 ) ) ( ON ?auto_59099 ?auto_59100 ) ( not ( = ?auto_59095 ?auto_59100 ) ) ( not ( = ?auto_59096 ?auto_59100 ) ) ( not ( = ?auto_59097 ?auto_59100 ) ) ( not ( = ?auto_59098 ?auto_59100 ) ) ( not ( = ?auto_59099 ?auto_59100 ) ) ( ON ?auto_59098 ?auto_59099 ) ( ON-TABLE ?auto_59100 ) ( CLEAR ?auto_59096 ) ( ON ?auto_59097 ?auto_59098 ) ( CLEAR ?auto_59097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59100 ?auto_59099 ?auto_59098 )
      ( MAKE-5PILE ?auto_59095 ?auto_59096 ?auto_59097 ?auto_59098 ?auto_59099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59101 - BLOCK
      ?auto_59102 - BLOCK
      ?auto_59103 - BLOCK
      ?auto_59104 - BLOCK
      ?auto_59105 - BLOCK
    )
    :vars
    (
      ?auto_59106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59101 ) ( not ( = ?auto_59101 ?auto_59102 ) ) ( not ( = ?auto_59101 ?auto_59103 ) ) ( not ( = ?auto_59101 ?auto_59104 ) ) ( not ( = ?auto_59101 ?auto_59105 ) ) ( not ( = ?auto_59102 ?auto_59103 ) ) ( not ( = ?auto_59102 ?auto_59104 ) ) ( not ( = ?auto_59102 ?auto_59105 ) ) ( not ( = ?auto_59103 ?auto_59104 ) ) ( not ( = ?auto_59103 ?auto_59105 ) ) ( not ( = ?auto_59104 ?auto_59105 ) ) ( ON ?auto_59105 ?auto_59106 ) ( not ( = ?auto_59101 ?auto_59106 ) ) ( not ( = ?auto_59102 ?auto_59106 ) ) ( not ( = ?auto_59103 ?auto_59106 ) ) ( not ( = ?auto_59104 ?auto_59106 ) ) ( not ( = ?auto_59105 ?auto_59106 ) ) ( ON ?auto_59104 ?auto_59105 ) ( ON-TABLE ?auto_59106 ) ( ON ?auto_59103 ?auto_59104 ) ( CLEAR ?auto_59103 ) ( HOLDING ?auto_59102 ) ( CLEAR ?auto_59101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59101 ?auto_59102 )
      ( MAKE-5PILE ?auto_59101 ?auto_59102 ?auto_59103 ?auto_59104 ?auto_59105 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59107 - BLOCK
      ?auto_59108 - BLOCK
      ?auto_59109 - BLOCK
      ?auto_59110 - BLOCK
      ?auto_59111 - BLOCK
    )
    :vars
    (
      ?auto_59112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59107 ) ( not ( = ?auto_59107 ?auto_59108 ) ) ( not ( = ?auto_59107 ?auto_59109 ) ) ( not ( = ?auto_59107 ?auto_59110 ) ) ( not ( = ?auto_59107 ?auto_59111 ) ) ( not ( = ?auto_59108 ?auto_59109 ) ) ( not ( = ?auto_59108 ?auto_59110 ) ) ( not ( = ?auto_59108 ?auto_59111 ) ) ( not ( = ?auto_59109 ?auto_59110 ) ) ( not ( = ?auto_59109 ?auto_59111 ) ) ( not ( = ?auto_59110 ?auto_59111 ) ) ( ON ?auto_59111 ?auto_59112 ) ( not ( = ?auto_59107 ?auto_59112 ) ) ( not ( = ?auto_59108 ?auto_59112 ) ) ( not ( = ?auto_59109 ?auto_59112 ) ) ( not ( = ?auto_59110 ?auto_59112 ) ) ( not ( = ?auto_59111 ?auto_59112 ) ) ( ON ?auto_59110 ?auto_59111 ) ( ON-TABLE ?auto_59112 ) ( ON ?auto_59109 ?auto_59110 ) ( CLEAR ?auto_59107 ) ( ON ?auto_59108 ?auto_59109 ) ( CLEAR ?auto_59108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59112 ?auto_59111 ?auto_59110 ?auto_59109 )
      ( MAKE-5PILE ?auto_59107 ?auto_59108 ?auto_59109 ?auto_59110 ?auto_59111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59113 - BLOCK
      ?auto_59114 - BLOCK
      ?auto_59115 - BLOCK
      ?auto_59116 - BLOCK
      ?auto_59117 - BLOCK
    )
    :vars
    (
      ?auto_59118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59113 ?auto_59114 ) ) ( not ( = ?auto_59113 ?auto_59115 ) ) ( not ( = ?auto_59113 ?auto_59116 ) ) ( not ( = ?auto_59113 ?auto_59117 ) ) ( not ( = ?auto_59114 ?auto_59115 ) ) ( not ( = ?auto_59114 ?auto_59116 ) ) ( not ( = ?auto_59114 ?auto_59117 ) ) ( not ( = ?auto_59115 ?auto_59116 ) ) ( not ( = ?auto_59115 ?auto_59117 ) ) ( not ( = ?auto_59116 ?auto_59117 ) ) ( ON ?auto_59117 ?auto_59118 ) ( not ( = ?auto_59113 ?auto_59118 ) ) ( not ( = ?auto_59114 ?auto_59118 ) ) ( not ( = ?auto_59115 ?auto_59118 ) ) ( not ( = ?auto_59116 ?auto_59118 ) ) ( not ( = ?auto_59117 ?auto_59118 ) ) ( ON ?auto_59116 ?auto_59117 ) ( ON-TABLE ?auto_59118 ) ( ON ?auto_59115 ?auto_59116 ) ( ON ?auto_59114 ?auto_59115 ) ( CLEAR ?auto_59114 ) ( HOLDING ?auto_59113 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59113 )
      ( MAKE-5PILE ?auto_59113 ?auto_59114 ?auto_59115 ?auto_59116 ?auto_59117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59119 - BLOCK
      ?auto_59120 - BLOCK
      ?auto_59121 - BLOCK
      ?auto_59122 - BLOCK
      ?auto_59123 - BLOCK
    )
    :vars
    (
      ?auto_59124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59119 ?auto_59120 ) ) ( not ( = ?auto_59119 ?auto_59121 ) ) ( not ( = ?auto_59119 ?auto_59122 ) ) ( not ( = ?auto_59119 ?auto_59123 ) ) ( not ( = ?auto_59120 ?auto_59121 ) ) ( not ( = ?auto_59120 ?auto_59122 ) ) ( not ( = ?auto_59120 ?auto_59123 ) ) ( not ( = ?auto_59121 ?auto_59122 ) ) ( not ( = ?auto_59121 ?auto_59123 ) ) ( not ( = ?auto_59122 ?auto_59123 ) ) ( ON ?auto_59123 ?auto_59124 ) ( not ( = ?auto_59119 ?auto_59124 ) ) ( not ( = ?auto_59120 ?auto_59124 ) ) ( not ( = ?auto_59121 ?auto_59124 ) ) ( not ( = ?auto_59122 ?auto_59124 ) ) ( not ( = ?auto_59123 ?auto_59124 ) ) ( ON ?auto_59122 ?auto_59123 ) ( ON-TABLE ?auto_59124 ) ( ON ?auto_59121 ?auto_59122 ) ( ON ?auto_59120 ?auto_59121 ) ( ON ?auto_59119 ?auto_59120 ) ( CLEAR ?auto_59119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59124 ?auto_59123 ?auto_59122 ?auto_59121 ?auto_59120 )
      ( MAKE-5PILE ?auto_59119 ?auto_59120 ?auto_59121 ?auto_59122 ?auto_59123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59125 - BLOCK
      ?auto_59126 - BLOCK
      ?auto_59127 - BLOCK
      ?auto_59128 - BLOCK
      ?auto_59129 - BLOCK
    )
    :vars
    (
      ?auto_59130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59125 ?auto_59126 ) ) ( not ( = ?auto_59125 ?auto_59127 ) ) ( not ( = ?auto_59125 ?auto_59128 ) ) ( not ( = ?auto_59125 ?auto_59129 ) ) ( not ( = ?auto_59126 ?auto_59127 ) ) ( not ( = ?auto_59126 ?auto_59128 ) ) ( not ( = ?auto_59126 ?auto_59129 ) ) ( not ( = ?auto_59127 ?auto_59128 ) ) ( not ( = ?auto_59127 ?auto_59129 ) ) ( not ( = ?auto_59128 ?auto_59129 ) ) ( ON ?auto_59129 ?auto_59130 ) ( not ( = ?auto_59125 ?auto_59130 ) ) ( not ( = ?auto_59126 ?auto_59130 ) ) ( not ( = ?auto_59127 ?auto_59130 ) ) ( not ( = ?auto_59128 ?auto_59130 ) ) ( not ( = ?auto_59129 ?auto_59130 ) ) ( ON ?auto_59128 ?auto_59129 ) ( ON-TABLE ?auto_59130 ) ( ON ?auto_59127 ?auto_59128 ) ( ON ?auto_59126 ?auto_59127 ) ( HOLDING ?auto_59125 ) ( CLEAR ?auto_59126 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59130 ?auto_59129 ?auto_59128 ?auto_59127 ?auto_59126 ?auto_59125 )
      ( MAKE-5PILE ?auto_59125 ?auto_59126 ?auto_59127 ?auto_59128 ?auto_59129 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59131 - BLOCK
      ?auto_59132 - BLOCK
      ?auto_59133 - BLOCK
      ?auto_59134 - BLOCK
      ?auto_59135 - BLOCK
    )
    :vars
    (
      ?auto_59136 - BLOCK
      ?auto_59137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59131 ?auto_59132 ) ) ( not ( = ?auto_59131 ?auto_59133 ) ) ( not ( = ?auto_59131 ?auto_59134 ) ) ( not ( = ?auto_59131 ?auto_59135 ) ) ( not ( = ?auto_59132 ?auto_59133 ) ) ( not ( = ?auto_59132 ?auto_59134 ) ) ( not ( = ?auto_59132 ?auto_59135 ) ) ( not ( = ?auto_59133 ?auto_59134 ) ) ( not ( = ?auto_59133 ?auto_59135 ) ) ( not ( = ?auto_59134 ?auto_59135 ) ) ( ON ?auto_59135 ?auto_59136 ) ( not ( = ?auto_59131 ?auto_59136 ) ) ( not ( = ?auto_59132 ?auto_59136 ) ) ( not ( = ?auto_59133 ?auto_59136 ) ) ( not ( = ?auto_59134 ?auto_59136 ) ) ( not ( = ?auto_59135 ?auto_59136 ) ) ( ON ?auto_59134 ?auto_59135 ) ( ON-TABLE ?auto_59136 ) ( ON ?auto_59133 ?auto_59134 ) ( ON ?auto_59132 ?auto_59133 ) ( CLEAR ?auto_59132 ) ( ON ?auto_59131 ?auto_59137 ) ( CLEAR ?auto_59131 ) ( HAND-EMPTY ) ( not ( = ?auto_59131 ?auto_59137 ) ) ( not ( = ?auto_59132 ?auto_59137 ) ) ( not ( = ?auto_59133 ?auto_59137 ) ) ( not ( = ?auto_59134 ?auto_59137 ) ) ( not ( = ?auto_59135 ?auto_59137 ) ) ( not ( = ?auto_59136 ?auto_59137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59131 ?auto_59137 )
      ( MAKE-5PILE ?auto_59131 ?auto_59132 ?auto_59133 ?auto_59134 ?auto_59135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59138 - BLOCK
      ?auto_59139 - BLOCK
      ?auto_59140 - BLOCK
      ?auto_59141 - BLOCK
      ?auto_59142 - BLOCK
    )
    :vars
    (
      ?auto_59144 - BLOCK
      ?auto_59143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59138 ?auto_59139 ) ) ( not ( = ?auto_59138 ?auto_59140 ) ) ( not ( = ?auto_59138 ?auto_59141 ) ) ( not ( = ?auto_59138 ?auto_59142 ) ) ( not ( = ?auto_59139 ?auto_59140 ) ) ( not ( = ?auto_59139 ?auto_59141 ) ) ( not ( = ?auto_59139 ?auto_59142 ) ) ( not ( = ?auto_59140 ?auto_59141 ) ) ( not ( = ?auto_59140 ?auto_59142 ) ) ( not ( = ?auto_59141 ?auto_59142 ) ) ( ON ?auto_59142 ?auto_59144 ) ( not ( = ?auto_59138 ?auto_59144 ) ) ( not ( = ?auto_59139 ?auto_59144 ) ) ( not ( = ?auto_59140 ?auto_59144 ) ) ( not ( = ?auto_59141 ?auto_59144 ) ) ( not ( = ?auto_59142 ?auto_59144 ) ) ( ON ?auto_59141 ?auto_59142 ) ( ON-TABLE ?auto_59144 ) ( ON ?auto_59140 ?auto_59141 ) ( ON ?auto_59138 ?auto_59143 ) ( CLEAR ?auto_59138 ) ( not ( = ?auto_59138 ?auto_59143 ) ) ( not ( = ?auto_59139 ?auto_59143 ) ) ( not ( = ?auto_59140 ?auto_59143 ) ) ( not ( = ?auto_59141 ?auto_59143 ) ) ( not ( = ?auto_59142 ?auto_59143 ) ) ( not ( = ?auto_59144 ?auto_59143 ) ) ( HOLDING ?auto_59139 ) ( CLEAR ?auto_59140 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59144 ?auto_59142 ?auto_59141 ?auto_59140 ?auto_59139 )
      ( MAKE-5PILE ?auto_59138 ?auto_59139 ?auto_59140 ?auto_59141 ?auto_59142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59145 - BLOCK
      ?auto_59146 - BLOCK
      ?auto_59147 - BLOCK
      ?auto_59148 - BLOCK
      ?auto_59149 - BLOCK
    )
    :vars
    (
      ?auto_59151 - BLOCK
      ?auto_59150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59145 ?auto_59146 ) ) ( not ( = ?auto_59145 ?auto_59147 ) ) ( not ( = ?auto_59145 ?auto_59148 ) ) ( not ( = ?auto_59145 ?auto_59149 ) ) ( not ( = ?auto_59146 ?auto_59147 ) ) ( not ( = ?auto_59146 ?auto_59148 ) ) ( not ( = ?auto_59146 ?auto_59149 ) ) ( not ( = ?auto_59147 ?auto_59148 ) ) ( not ( = ?auto_59147 ?auto_59149 ) ) ( not ( = ?auto_59148 ?auto_59149 ) ) ( ON ?auto_59149 ?auto_59151 ) ( not ( = ?auto_59145 ?auto_59151 ) ) ( not ( = ?auto_59146 ?auto_59151 ) ) ( not ( = ?auto_59147 ?auto_59151 ) ) ( not ( = ?auto_59148 ?auto_59151 ) ) ( not ( = ?auto_59149 ?auto_59151 ) ) ( ON ?auto_59148 ?auto_59149 ) ( ON-TABLE ?auto_59151 ) ( ON ?auto_59147 ?auto_59148 ) ( ON ?auto_59145 ?auto_59150 ) ( not ( = ?auto_59145 ?auto_59150 ) ) ( not ( = ?auto_59146 ?auto_59150 ) ) ( not ( = ?auto_59147 ?auto_59150 ) ) ( not ( = ?auto_59148 ?auto_59150 ) ) ( not ( = ?auto_59149 ?auto_59150 ) ) ( not ( = ?auto_59151 ?auto_59150 ) ) ( CLEAR ?auto_59147 ) ( ON ?auto_59146 ?auto_59145 ) ( CLEAR ?auto_59146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59150 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59150 ?auto_59145 )
      ( MAKE-5PILE ?auto_59145 ?auto_59146 ?auto_59147 ?auto_59148 ?auto_59149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59152 - BLOCK
      ?auto_59153 - BLOCK
      ?auto_59154 - BLOCK
      ?auto_59155 - BLOCK
      ?auto_59156 - BLOCK
    )
    :vars
    (
      ?auto_59158 - BLOCK
      ?auto_59157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59152 ?auto_59153 ) ) ( not ( = ?auto_59152 ?auto_59154 ) ) ( not ( = ?auto_59152 ?auto_59155 ) ) ( not ( = ?auto_59152 ?auto_59156 ) ) ( not ( = ?auto_59153 ?auto_59154 ) ) ( not ( = ?auto_59153 ?auto_59155 ) ) ( not ( = ?auto_59153 ?auto_59156 ) ) ( not ( = ?auto_59154 ?auto_59155 ) ) ( not ( = ?auto_59154 ?auto_59156 ) ) ( not ( = ?auto_59155 ?auto_59156 ) ) ( ON ?auto_59156 ?auto_59158 ) ( not ( = ?auto_59152 ?auto_59158 ) ) ( not ( = ?auto_59153 ?auto_59158 ) ) ( not ( = ?auto_59154 ?auto_59158 ) ) ( not ( = ?auto_59155 ?auto_59158 ) ) ( not ( = ?auto_59156 ?auto_59158 ) ) ( ON ?auto_59155 ?auto_59156 ) ( ON-TABLE ?auto_59158 ) ( ON ?auto_59152 ?auto_59157 ) ( not ( = ?auto_59152 ?auto_59157 ) ) ( not ( = ?auto_59153 ?auto_59157 ) ) ( not ( = ?auto_59154 ?auto_59157 ) ) ( not ( = ?auto_59155 ?auto_59157 ) ) ( not ( = ?auto_59156 ?auto_59157 ) ) ( not ( = ?auto_59158 ?auto_59157 ) ) ( ON ?auto_59153 ?auto_59152 ) ( CLEAR ?auto_59153 ) ( ON-TABLE ?auto_59157 ) ( HOLDING ?auto_59154 ) ( CLEAR ?auto_59155 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59158 ?auto_59156 ?auto_59155 ?auto_59154 )
      ( MAKE-5PILE ?auto_59152 ?auto_59153 ?auto_59154 ?auto_59155 ?auto_59156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59159 - BLOCK
      ?auto_59160 - BLOCK
      ?auto_59161 - BLOCK
      ?auto_59162 - BLOCK
      ?auto_59163 - BLOCK
    )
    :vars
    (
      ?auto_59164 - BLOCK
      ?auto_59165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59159 ?auto_59160 ) ) ( not ( = ?auto_59159 ?auto_59161 ) ) ( not ( = ?auto_59159 ?auto_59162 ) ) ( not ( = ?auto_59159 ?auto_59163 ) ) ( not ( = ?auto_59160 ?auto_59161 ) ) ( not ( = ?auto_59160 ?auto_59162 ) ) ( not ( = ?auto_59160 ?auto_59163 ) ) ( not ( = ?auto_59161 ?auto_59162 ) ) ( not ( = ?auto_59161 ?auto_59163 ) ) ( not ( = ?auto_59162 ?auto_59163 ) ) ( ON ?auto_59163 ?auto_59164 ) ( not ( = ?auto_59159 ?auto_59164 ) ) ( not ( = ?auto_59160 ?auto_59164 ) ) ( not ( = ?auto_59161 ?auto_59164 ) ) ( not ( = ?auto_59162 ?auto_59164 ) ) ( not ( = ?auto_59163 ?auto_59164 ) ) ( ON ?auto_59162 ?auto_59163 ) ( ON-TABLE ?auto_59164 ) ( ON ?auto_59159 ?auto_59165 ) ( not ( = ?auto_59159 ?auto_59165 ) ) ( not ( = ?auto_59160 ?auto_59165 ) ) ( not ( = ?auto_59161 ?auto_59165 ) ) ( not ( = ?auto_59162 ?auto_59165 ) ) ( not ( = ?auto_59163 ?auto_59165 ) ) ( not ( = ?auto_59164 ?auto_59165 ) ) ( ON ?auto_59160 ?auto_59159 ) ( ON-TABLE ?auto_59165 ) ( CLEAR ?auto_59162 ) ( ON ?auto_59161 ?auto_59160 ) ( CLEAR ?auto_59161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59165 ?auto_59159 ?auto_59160 )
      ( MAKE-5PILE ?auto_59159 ?auto_59160 ?auto_59161 ?auto_59162 ?auto_59163 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59166 - BLOCK
      ?auto_59167 - BLOCK
      ?auto_59168 - BLOCK
      ?auto_59169 - BLOCK
      ?auto_59170 - BLOCK
    )
    :vars
    (
      ?auto_59172 - BLOCK
      ?auto_59171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59166 ?auto_59167 ) ) ( not ( = ?auto_59166 ?auto_59168 ) ) ( not ( = ?auto_59166 ?auto_59169 ) ) ( not ( = ?auto_59166 ?auto_59170 ) ) ( not ( = ?auto_59167 ?auto_59168 ) ) ( not ( = ?auto_59167 ?auto_59169 ) ) ( not ( = ?auto_59167 ?auto_59170 ) ) ( not ( = ?auto_59168 ?auto_59169 ) ) ( not ( = ?auto_59168 ?auto_59170 ) ) ( not ( = ?auto_59169 ?auto_59170 ) ) ( ON ?auto_59170 ?auto_59172 ) ( not ( = ?auto_59166 ?auto_59172 ) ) ( not ( = ?auto_59167 ?auto_59172 ) ) ( not ( = ?auto_59168 ?auto_59172 ) ) ( not ( = ?auto_59169 ?auto_59172 ) ) ( not ( = ?auto_59170 ?auto_59172 ) ) ( ON-TABLE ?auto_59172 ) ( ON ?auto_59166 ?auto_59171 ) ( not ( = ?auto_59166 ?auto_59171 ) ) ( not ( = ?auto_59167 ?auto_59171 ) ) ( not ( = ?auto_59168 ?auto_59171 ) ) ( not ( = ?auto_59169 ?auto_59171 ) ) ( not ( = ?auto_59170 ?auto_59171 ) ) ( not ( = ?auto_59172 ?auto_59171 ) ) ( ON ?auto_59167 ?auto_59166 ) ( ON-TABLE ?auto_59171 ) ( ON ?auto_59168 ?auto_59167 ) ( CLEAR ?auto_59168 ) ( HOLDING ?auto_59169 ) ( CLEAR ?auto_59170 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59172 ?auto_59170 ?auto_59169 )
      ( MAKE-5PILE ?auto_59166 ?auto_59167 ?auto_59168 ?auto_59169 ?auto_59170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59173 - BLOCK
      ?auto_59174 - BLOCK
      ?auto_59175 - BLOCK
      ?auto_59176 - BLOCK
      ?auto_59177 - BLOCK
    )
    :vars
    (
      ?auto_59179 - BLOCK
      ?auto_59178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59173 ?auto_59174 ) ) ( not ( = ?auto_59173 ?auto_59175 ) ) ( not ( = ?auto_59173 ?auto_59176 ) ) ( not ( = ?auto_59173 ?auto_59177 ) ) ( not ( = ?auto_59174 ?auto_59175 ) ) ( not ( = ?auto_59174 ?auto_59176 ) ) ( not ( = ?auto_59174 ?auto_59177 ) ) ( not ( = ?auto_59175 ?auto_59176 ) ) ( not ( = ?auto_59175 ?auto_59177 ) ) ( not ( = ?auto_59176 ?auto_59177 ) ) ( ON ?auto_59177 ?auto_59179 ) ( not ( = ?auto_59173 ?auto_59179 ) ) ( not ( = ?auto_59174 ?auto_59179 ) ) ( not ( = ?auto_59175 ?auto_59179 ) ) ( not ( = ?auto_59176 ?auto_59179 ) ) ( not ( = ?auto_59177 ?auto_59179 ) ) ( ON-TABLE ?auto_59179 ) ( ON ?auto_59173 ?auto_59178 ) ( not ( = ?auto_59173 ?auto_59178 ) ) ( not ( = ?auto_59174 ?auto_59178 ) ) ( not ( = ?auto_59175 ?auto_59178 ) ) ( not ( = ?auto_59176 ?auto_59178 ) ) ( not ( = ?auto_59177 ?auto_59178 ) ) ( not ( = ?auto_59179 ?auto_59178 ) ) ( ON ?auto_59174 ?auto_59173 ) ( ON-TABLE ?auto_59178 ) ( ON ?auto_59175 ?auto_59174 ) ( CLEAR ?auto_59177 ) ( ON ?auto_59176 ?auto_59175 ) ( CLEAR ?auto_59176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59178 ?auto_59173 ?auto_59174 ?auto_59175 )
      ( MAKE-5PILE ?auto_59173 ?auto_59174 ?auto_59175 ?auto_59176 ?auto_59177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59180 - BLOCK
      ?auto_59181 - BLOCK
      ?auto_59182 - BLOCK
      ?auto_59183 - BLOCK
      ?auto_59184 - BLOCK
    )
    :vars
    (
      ?auto_59185 - BLOCK
      ?auto_59186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59180 ?auto_59181 ) ) ( not ( = ?auto_59180 ?auto_59182 ) ) ( not ( = ?auto_59180 ?auto_59183 ) ) ( not ( = ?auto_59180 ?auto_59184 ) ) ( not ( = ?auto_59181 ?auto_59182 ) ) ( not ( = ?auto_59181 ?auto_59183 ) ) ( not ( = ?auto_59181 ?auto_59184 ) ) ( not ( = ?auto_59182 ?auto_59183 ) ) ( not ( = ?auto_59182 ?auto_59184 ) ) ( not ( = ?auto_59183 ?auto_59184 ) ) ( not ( = ?auto_59180 ?auto_59185 ) ) ( not ( = ?auto_59181 ?auto_59185 ) ) ( not ( = ?auto_59182 ?auto_59185 ) ) ( not ( = ?auto_59183 ?auto_59185 ) ) ( not ( = ?auto_59184 ?auto_59185 ) ) ( ON-TABLE ?auto_59185 ) ( ON ?auto_59180 ?auto_59186 ) ( not ( = ?auto_59180 ?auto_59186 ) ) ( not ( = ?auto_59181 ?auto_59186 ) ) ( not ( = ?auto_59182 ?auto_59186 ) ) ( not ( = ?auto_59183 ?auto_59186 ) ) ( not ( = ?auto_59184 ?auto_59186 ) ) ( not ( = ?auto_59185 ?auto_59186 ) ) ( ON ?auto_59181 ?auto_59180 ) ( ON-TABLE ?auto_59186 ) ( ON ?auto_59182 ?auto_59181 ) ( ON ?auto_59183 ?auto_59182 ) ( CLEAR ?auto_59183 ) ( HOLDING ?auto_59184 ) ( CLEAR ?auto_59185 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59185 ?auto_59184 )
      ( MAKE-5PILE ?auto_59180 ?auto_59181 ?auto_59182 ?auto_59183 ?auto_59184 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59187 - BLOCK
      ?auto_59188 - BLOCK
      ?auto_59189 - BLOCK
      ?auto_59190 - BLOCK
      ?auto_59191 - BLOCK
    )
    :vars
    (
      ?auto_59192 - BLOCK
      ?auto_59193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59187 ?auto_59188 ) ) ( not ( = ?auto_59187 ?auto_59189 ) ) ( not ( = ?auto_59187 ?auto_59190 ) ) ( not ( = ?auto_59187 ?auto_59191 ) ) ( not ( = ?auto_59188 ?auto_59189 ) ) ( not ( = ?auto_59188 ?auto_59190 ) ) ( not ( = ?auto_59188 ?auto_59191 ) ) ( not ( = ?auto_59189 ?auto_59190 ) ) ( not ( = ?auto_59189 ?auto_59191 ) ) ( not ( = ?auto_59190 ?auto_59191 ) ) ( not ( = ?auto_59187 ?auto_59192 ) ) ( not ( = ?auto_59188 ?auto_59192 ) ) ( not ( = ?auto_59189 ?auto_59192 ) ) ( not ( = ?auto_59190 ?auto_59192 ) ) ( not ( = ?auto_59191 ?auto_59192 ) ) ( ON-TABLE ?auto_59192 ) ( ON ?auto_59187 ?auto_59193 ) ( not ( = ?auto_59187 ?auto_59193 ) ) ( not ( = ?auto_59188 ?auto_59193 ) ) ( not ( = ?auto_59189 ?auto_59193 ) ) ( not ( = ?auto_59190 ?auto_59193 ) ) ( not ( = ?auto_59191 ?auto_59193 ) ) ( not ( = ?auto_59192 ?auto_59193 ) ) ( ON ?auto_59188 ?auto_59187 ) ( ON-TABLE ?auto_59193 ) ( ON ?auto_59189 ?auto_59188 ) ( ON ?auto_59190 ?auto_59189 ) ( CLEAR ?auto_59192 ) ( ON ?auto_59191 ?auto_59190 ) ( CLEAR ?auto_59191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59193 ?auto_59187 ?auto_59188 ?auto_59189 ?auto_59190 )
      ( MAKE-5PILE ?auto_59187 ?auto_59188 ?auto_59189 ?auto_59190 ?auto_59191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59194 - BLOCK
      ?auto_59195 - BLOCK
      ?auto_59196 - BLOCK
      ?auto_59197 - BLOCK
      ?auto_59198 - BLOCK
    )
    :vars
    (
      ?auto_59200 - BLOCK
      ?auto_59199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59194 ?auto_59195 ) ) ( not ( = ?auto_59194 ?auto_59196 ) ) ( not ( = ?auto_59194 ?auto_59197 ) ) ( not ( = ?auto_59194 ?auto_59198 ) ) ( not ( = ?auto_59195 ?auto_59196 ) ) ( not ( = ?auto_59195 ?auto_59197 ) ) ( not ( = ?auto_59195 ?auto_59198 ) ) ( not ( = ?auto_59196 ?auto_59197 ) ) ( not ( = ?auto_59196 ?auto_59198 ) ) ( not ( = ?auto_59197 ?auto_59198 ) ) ( not ( = ?auto_59194 ?auto_59200 ) ) ( not ( = ?auto_59195 ?auto_59200 ) ) ( not ( = ?auto_59196 ?auto_59200 ) ) ( not ( = ?auto_59197 ?auto_59200 ) ) ( not ( = ?auto_59198 ?auto_59200 ) ) ( ON ?auto_59194 ?auto_59199 ) ( not ( = ?auto_59194 ?auto_59199 ) ) ( not ( = ?auto_59195 ?auto_59199 ) ) ( not ( = ?auto_59196 ?auto_59199 ) ) ( not ( = ?auto_59197 ?auto_59199 ) ) ( not ( = ?auto_59198 ?auto_59199 ) ) ( not ( = ?auto_59200 ?auto_59199 ) ) ( ON ?auto_59195 ?auto_59194 ) ( ON-TABLE ?auto_59199 ) ( ON ?auto_59196 ?auto_59195 ) ( ON ?auto_59197 ?auto_59196 ) ( ON ?auto_59198 ?auto_59197 ) ( CLEAR ?auto_59198 ) ( HOLDING ?auto_59200 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59200 )
      ( MAKE-5PILE ?auto_59194 ?auto_59195 ?auto_59196 ?auto_59197 ?auto_59198 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_59201 - BLOCK
      ?auto_59202 - BLOCK
      ?auto_59203 - BLOCK
      ?auto_59204 - BLOCK
      ?auto_59205 - BLOCK
    )
    :vars
    (
      ?auto_59207 - BLOCK
      ?auto_59206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59201 ?auto_59202 ) ) ( not ( = ?auto_59201 ?auto_59203 ) ) ( not ( = ?auto_59201 ?auto_59204 ) ) ( not ( = ?auto_59201 ?auto_59205 ) ) ( not ( = ?auto_59202 ?auto_59203 ) ) ( not ( = ?auto_59202 ?auto_59204 ) ) ( not ( = ?auto_59202 ?auto_59205 ) ) ( not ( = ?auto_59203 ?auto_59204 ) ) ( not ( = ?auto_59203 ?auto_59205 ) ) ( not ( = ?auto_59204 ?auto_59205 ) ) ( not ( = ?auto_59201 ?auto_59207 ) ) ( not ( = ?auto_59202 ?auto_59207 ) ) ( not ( = ?auto_59203 ?auto_59207 ) ) ( not ( = ?auto_59204 ?auto_59207 ) ) ( not ( = ?auto_59205 ?auto_59207 ) ) ( ON ?auto_59201 ?auto_59206 ) ( not ( = ?auto_59201 ?auto_59206 ) ) ( not ( = ?auto_59202 ?auto_59206 ) ) ( not ( = ?auto_59203 ?auto_59206 ) ) ( not ( = ?auto_59204 ?auto_59206 ) ) ( not ( = ?auto_59205 ?auto_59206 ) ) ( not ( = ?auto_59207 ?auto_59206 ) ) ( ON ?auto_59202 ?auto_59201 ) ( ON-TABLE ?auto_59206 ) ( ON ?auto_59203 ?auto_59202 ) ( ON ?auto_59204 ?auto_59203 ) ( ON ?auto_59205 ?auto_59204 ) ( ON ?auto_59207 ?auto_59205 ) ( CLEAR ?auto_59207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59206 ?auto_59201 ?auto_59202 ?auto_59203 ?auto_59204 ?auto_59205 )
      ( MAKE-5PILE ?auto_59201 ?auto_59202 ?auto_59203 ?auto_59204 ?auto_59205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59214 - BLOCK
      ?auto_59215 - BLOCK
      ?auto_59216 - BLOCK
      ?auto_59217 - BLOCK
      ?auto_59218 - BLOCK
      ?auto_59219 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_59219 ) ( CLEAR ?auto_59218 ) ( ON-TABLE ?auto_59214 ) ( ON ?auto_59215 ?auto_59214 ) ( ON ?auto_59216 ?auto_59215 ) ( ON ?auto_59217 ?auto_59216 ) ( ON ?auto_59218 ?auto_59217 ) ( not ( = ?auto_59214 ?auto_59215 ) ) ( not ( = ?auto_59214 ?auto_59216 ) ) ( not ( = ?auto_59214 ?auto_59217 ) ) ( not ( = ?auto_59214 ?auto_59218 ) ) ( not ( = ?auto_59214 ?auto_59219 ) ) ( not ( = ?auto_59215 ?auto_59216 ) ) ( not ( = ?auto_59215 ?auto_59217 ) ) ( not ( = ?auto_59215 ?auto_59218 ) ) ( not ( = ?auto_59215 ?auto_59219 ) ) ( not ( = ?auto_59216 ?auto_59217 ) ) ( not ( = ?auto_59216 ?auto_59218 ) ) ( not ( = ?auto_59216 ?auto_59219 ) ) ( not ( = ?auto_59217 ?auto_59218 ) ) ( not ( = ?auto_59217 ?auto_59219 ) ) ( not ( = ?auto_59218 ?auto_59219 ) ) )
    :subtasks
    ( ( !STACK ?auto_59219 ?auto_59218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59220 - BLOCK
      ?auto_59221 - BLOCK
      ?auto_59222 - BLOCK
      ?auto_59223 - BLOCK
      ?auto_59224 - BLOCK
      ?auto_59225 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_59224 ) ( ON-TABLE ?auto_59220 ) ( ON ?auto_59221 ?auto_59220 ) ( ON ?auto_59222 ?auto_59221 ) ( ON ?auto_59223 ?auto_59222 ) ( ON ?auto_59224 ?auto_59223 ) ( not ( = ?auto_59220 ?auto_59221 ) ) ( not ( = ?auto_59220 ?auto_59222 ) ) ( not ( = ?auto_59220 ?auto_59223 ) ) ( not ( = ?auto_59220 ?auto_59224 ) ) ( not ( = ?auto_59220 ?auto_59225 ) ) ( not ( = ?auto_59221 ?auto_59222 ) ) ( not ( = ?auto_59221 ?auto_59223 ) ) ( not ( = ?auto_59221 ?auto_59224 ) ) ( not ( = ?auto_59221 ?auto_59225 ) ) ( not ( = ?auto_59222 ?auto_59223 ) ) ( not ( = ?auto_59222 ?auto_59224 ) ) ( not ( = ?auto_59222 ?auto_59225 ) ) ( not ( = ?auto_59223 ?auto_59224 ) ) ( not ( = ?auto_59223 ?auto_59225 ) ) ( not ( = ?auto_59224 ?auto_59225 ) ) ( ON-TABLE ?auto_59225 ) ( CLEAR ?auto_59225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_59225 )
      ( MAKE-6PILE ?auto_59220 ?auto_59221 ?auto_59222 ?auto_59223 ?auto_59224 ?auto_59225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59226 - BLOCK
      ?auto_59227 - BLOCK
      ?auto_59228 - BLOCK
      ?auto_59229 - BLOCK
      ?auto_59230 - BLOCK
      ?auto_59231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59226 ) ( ON ?auto_59227 ?auto_59226 ) ( ON ?auto_59228 ?auto_59227 ) ( ON ?auto_59229 ?auto_59228 ) ( not ( = ?auto_59226 ?auto_59227 ) ) ( not ( = ?auto_59226 ?auto_59228 ) ) ( not ( = ?auto_59226 ?auto_59229 ) ) ( not ( = ?auto_59226 ?auto_59230 ) ) ( not ( = ?auto_59226 ?auto_59231 ) ) ( not ( = ?auto_59227 ?auto_59228 ) ) ( not ( = ?auto_59227 ?auto_59229 ) ) ( not ( = ?auto_59227 ?auto_59230 ) ) ( not ( = ?auto_59227 ?auto_59231 ) ) ( not ( = ?auto_59228 ?auto_59229 ) ) ( not ( = ?auto_59228 ?auto_59230 ) ) ( not ( = ?auto_59228 ?auto_59231 ) ) ( not ( = ?auto_59229 ?auto_59230 ) ) ( not ( = ?auto_59229 ?auto_59231 ) ) ( not ( = ?auto_59230 ?auto_59231 ) ) ( ON-TABLE ?auto_59231 ) ( CLEAR ?auto_59231 ) ( HOLDING ?auto_59230 ) ( CLEAR ?auto_59229 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59226 ?auto_59227 ?auto_59228 ?auto_59229 ?auto_59230 )
      ( MAKE-6PILE ?auto_59226 ?auto_59227 ?auto_59228 ?auto_59229 ?auto_59230 ?auto_59231 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59232 - BLOCK
      ?auto_59233 - BLOCK
      ?auto_59234 - BLOCK
      ?auto_59235 - BLOCK
      ?auto_59236 - BLOCK
      ?auto_59237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59232 ) ( ON ?auto_59233 ?auto_59232 ) ( ON ?auto_59234 ?auto_59233 ) ( ON ?auto_59235 ?auto_59234 ) ( not ( = ?auto_59232 ?auto_59233 ) ) ( not ( = ?auto_59232 ?auto_59234 ) ) ( not ( = ?auto_59232 ?auto_59235 ) ) ( not ( = ?auto_59232 ?auto_59236 ) ) ( not ( = ?auto_59232 ?auto_59237 ) ) ( not ( = ?auto_59233 ?auto_59234 ) ) ( not ( = ?auto_59233 ?auto_59235 ) ) ( not ( = ?auto_59233 ?auto_59236 ) ) ( not ( = ?auto_59233 ?auto_59237 ) ) ( not ( = ?auto_59234 ?auto_59235 ) ) ( not ( = ?auto_59234 ?auto_59236 ) ) ( not ( = ?auto_59234 ?auto_59237 ) ) ( not ( = ?auto_59235 ?auto_59236 ) ) ( not ( = ?auto_59235 ?auto_59237 ) ) ( not ( = ?auto_59236 ?auto_59237 ) ) ( ON-TABLE ?auto_59237 ) ( CLEAR ?auto_59235 ) ( ON ?auto_59236 ?auto_59237 ) ( CLEAR ?auto_59236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59237 )
      ( MAKE-6PILE ?auto_59232 ?auto_59233 ?auto_59234 ?auto_59235 ?auto_59236 ?auto_59237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59238 - BLOCK
      ?auto_59239 - BLOCK
      ?auto_59240 - BLOCK
      ?auto_59241 - BLOCK
      ?auto_59242 - BLOCK
      ?auto_59243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59238 ) ( ON ?auto_59239 ?auto_59238 ) ( ON ?auto_59240 ?auto_59239 ) ( not ( = ?auto_59238 ?auto_59239 ) ) ( not ( = ?auto_59238 ?auto_59240 ) ) ( not ( = ?auto_59238 ?auto_59241 ) ) ( not ( = ?auto_59238 ?auto_59242 ) ) ( not ( = ?auto_59238 ?auto_59243 ) ) ( not ( = ?auto_59239 ?auto_59240 ) ) ( not ( = ?auto_59239 ?auto_59241 ) ) ( not ( = ?auto_59239 ?auto_59242 ) ) ( not ( = ?auto_59239 ?auto_59243 ) ) ( not ( = ?auto_59240 ?auto_59241 ) ) ( not ( = ?auto_59240 ?auto_59242 ) ) ( not ( = ?auto_59240 ?auto_59243 ) ) ( not ( = ?auto_59241 ?auto_59242 ) ) ( not ( = ?auto_59241 ?auto_59243 ) ) ( not ( = ?auto_59242 ?auto_59243 ) ) ( ON-TABLE ?auto_59243 ) ( ON ?auto_59242 ?auto_59243 ) ( CLEAR ?auto_59242 ) ( HOLDING ?auto_59241 ) ( CLEAR ?auto_59240 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59238 ?auto_59239 ?auto_59240 ?auto_59241 )
      ( MAKE-6PILE ?auto_59238 ?auto_59239 ?auto_59240 ?auto_59241 ?auto_59242 ?auto_59243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59244 - BLOCK
      ?auto_59245 - BLOCK
      ?auto_59246 - BLOCK
      ?auto_59247 - BLOCK
      ?auto_59248 - BLOCK
      ?auto_59249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59244 ) ( ON ?auto_59245 ?auto_59244 ) ( ON ?auto_59246 ?auto_59245 ) ( not ( = ?auto_59244 ?auto_59245 ) ) ( not ( = ?auto_59244 ?auto_59246 ) ) ( not ( = ?auto_59244 ?auto_59247 ) ) ( not ( = ?auto_59244 ?auto_59248 ) ) ( not ( = ?auto_59244 ?auto_59249 ) ) ( not ( = ?auto_59245 ?auto_59246 ) ) ( not ( = ?auto_59245 ?auto_59247 ) ) ( not ( = ?auto_59245 ?auto_59248 ) ) ( not ( = ?auto_59245 ?auto_59249 ) ) ( not ( = ?auto_59246 ?auto_59247 ) ) ( not ( = ?auto_59246 ?auto_59248 ) ) ( not ( = ?auto_59246 ?auto_59249 ) ) ( not ( = ?auto_59247 ?auto_59248 ) ) ( not ( = ?auto_59247 ?auto_59249 ) ) ( not ( = ?auto_59248 ?auto_59249 ) ) ( ON-TABLE ?auto_59249 ) ( ON ?auto_59248 ?auto_59249 ) ( CLEAR ?auto_59246 ) ( ON ?auto_59247 ?auto_59248 ) ( CLEAR ?auto_59247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59249 ?auto_59248 )
      ( MAKE-6PILE ?auto_59244 ?auto_59245 ?auto_59246 ?auto_59247 ?auto_59248 ?auto_59249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59250 - BLOCK
      ?auto_59251 - BLOCK
      ?auto_59252 - BLOCK
      ?auto_59253 - BLOCK
      ?auto_59254 - BLOCK
      ?auto_59255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59250 ) ( ON ?auto_59251 ?auto_59250 ) ( not ( = ?auto_59250 ?auto_59251 ) ) ( not ( = ?auto_59250 ?auto_59252 ) ) ( not ( = ?auto_59250 ?auto_59253 ) ) ( not ( = ?auto_59250 ?auto_59254 ) ) ( not ( = ?auto_59250 ?auto_59255 ) ) ( not ( = ?auto_59251 ?auto_59252 ) ) ( not ( = ?auto_59251 ?auto_59253 ) ) ( not ( = ?auto_59251 ?auto_59254 ) ) ( not ( = ?auto_59251 ?auto_59255 ) ) ( not ( = ?auto_59252 ?auto_59253 ) ) ( not ( = ?auto_59252 ?auto_59254 ) ) ( not ( = ?auto_59252 ?auto_59255 ) ) ( not ( = ?auto_59253 ?auto_59254 ) ) ( not ( = ?auto_59253 ?auto_59255 ) ) ( not ( = ?auto_59254 ?auto_59255 ) ) ( ON-TABLE ?auto_59255 ) ( ON ?auto_59254 ?auto_59255 ) ( ON ?auto_59253 ?auto_59254 ) ( CLEAR ?auto_59253 ) ( HOLDING ?auto_59252 ) ( CLEAR ?auto_59251 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59250 ?auto_59251 ?auto_59252 )
      ( MAKE-6PILE ?auto_59250 ?auto_59251 ?auto_59252 ?auto_59253 ?auto_59254 ?auto_59255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59256 - BLOCK
      ?auto_59257 - BLOCK
      ?auto_59258 - BLOCK
      ?auto_59259 - BLOCK
      ?auto_59260 - BLOCK
      ?auto_59261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59256 ) ( ON ?auto_59257 ?auto_59256 ) ( not ( = ?auto_59256 ?auto_59257 ) ) ( not ( = ?auto_59256 ?auto_59258 ) ) ( not ( = ?auto_59256 ?auto_59259 ) ) ( not ( = ?auto_59256 ?auto_59260 ) ) ( not ( = ?auto_59256 ?auto_59261 ) ) ( not ( = ?auto_59257 ?auto_59258 ) ) ( not ( = ?auto_59257 ?auto_59259 ) ) ( not ( = ?auto_59257 ?auto_59260 ) ) ( not ( = ?auto_59257 ?auto_59261 ) ) ( not ( = ?auto_59258 ?auto_59259 ) ) ( not ( = ?auto_59258 ?auto_59260 ) ) ( not ( = ?auto_59258 ?auto_59261 ) ) ( not ( = ?auto_59259 ?auto_59260 ) ) ( not ( = ?auto_59259 ?auto_59261 ) ) ( not ( = ?auto_59260 ?auto_59261 ) ) ( ON-TABLE ?auto_59261 ) ( ON ?auto_59260 ?auto_59261 ) ( ON ?auto_59259 ?auto_59260 ) ( CLEAR ?auto_59257 ) ( ON ?auto_59258 ?auto_59259 ) ( CLEAR ?auto_59258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59261 ?auto_59260 ?auto_59259 )
      ( MAKE-6PILE ?auto_59256 ?auto_59257 ?auto_59258 ?auto_59259 ?auto_59260 ?auto_59261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59262 - BLOCK
      ?auto_59263 - BLOCK
      ?auto_59264 - BLOCK
      ?auto_59265 - BLOCK
      ?auto_59266 - BLOCK
      ?auto_59267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59262 ) ( not ( = ?auto_59262 ?auto_59263 ) ) ( not ( = ?auto_59262 ?auto_59264 ) ) ( not ( = ?auto_59262 ?auto_59265 ) ) ( not ( = ?auto_59262 ?auto_59266 ) ) ( not ( = ?auto_59262 ?auto_59267 ) ) ( not ( = ?auto_59263 ?auto_59264 ) ) ( not ( = ?auto_59263 ?auto_59265 ) ) ( not ( = ?auto_59263 ?auto_59266 ) ) ( not ( = ?auto_59263 ?auto_59267 ) ) ( not ( = ?auto_59264 ?auto_59265 ) ) ( not ( = ?auto_59264 ?auto_59266 ) ) ( not ( = ?auto_59264 ?auto_59267 ) ) ( not ( = ?auto_59265 ?auto_59266 ) ) ( not ( = ?auto_59265 ?auto_59267 ) ) ( not ( = ?auto_59266 ?auto_59267 ) ) ( ON-TABLE ?auto_59267 ) ( ON ?auto_59266 ?auto_59267 ) ( ON ?auto_59265 ?auto_59266 ) ( ON ?auto_59264 ?auto_59265 ) ( CLEAR ?auto_59264 ) ( HOLDING ?auto_59263 ) ( CLEAR ?auto_59262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59262 ?auto_59263 )
      ( MAKE-6PILE ?auto_59262 ?auto_59263 ?auto_59264 ?auto_59265 ?auto_59266 ?auto_59267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59268 - BLOCK
      ?auto_59269 - BLOCK
      ?auto_59270 - BLOCK
      ?auto_59271 - BLOCK
      ?auto_59272 - BLOCK
      ?auto_59273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_59268 ) ( not ( = ?auto_59268 ?auto_59269 ) ) ( not ( = ?auto_59268 ?auto_59270 ) ) ( not ( = ?auto_59268 ?auto_59271 ) ) ( not ( = ?auto_59268 ?auto_59272 ) ) ( not ( = ?auto_59268 ?auto_59273 ) ) ( not ( = ?auto_59269 ?auto_59270 ) ) ( not ( = ?auto_59269 ?auto_59271 ) ) ( not ( = ?auto_59269 ?auto_59272 ) ) ( not ( = ?auto_59269 ?auto_59273 ) ) ( not ( = ?auto_59270 ?auto_59271 ) ) ( not ( = ?auto_59270 ?auto_59272 ) ) ( not ( = ?auto_59270 ?auto_59273 ) ) ( not ( = ?auto_59271 ?auto_59272 ) ) ( not ( = ?auto_59271 ?auto_59273 ) ) ( not ( = ?auto_59272 ?auto_59273 ) ) ( ON-TABLE ?auto_59273 ) ( ON ?auto_59272 ?auto_59273 ) ( ON ?auto_59271 ?auto_59272 ) ( ON ?auto_59270 ?auto_59271 ) ( CLEAR ?auto_59268 ) ( ON ?auto_59269 ?auto_59270 ) ( CLEAR ?auto_59269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59273 ?auto_59272 ?auto_59271 ?auto_59270 )
      ( MAKE-6PILE ?auto_59268 ?auto_59269 ?auto_59270 ?auto_59271 ?auto_59272 ?auto_59273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59274 - BLOCK
      ?auto_59275 - BLOCK
      ?auto_59276 - BLOCK
      ?auto_59277 - BLOCK
      ?auto_59278 - BLOCK
      ?auto_59279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59274 ?auto_59275 ) ) ( not ( = ?auto_59274 ?auto_59276 ) ) ( not ( = ?auto_59274 ?auto_59277 ) ) ( not ( = ?auto_59274 ?auto_59278 ) ) ( not ( = ?auto_59274 ?auto_59279 ) ) ( not ( = ?auto_59275 ?auto_59276 ) ) ( not ( = ?auto_59275 ?auto_59277 ) ) ( not ( = ?auto_59275 ?auto_59278 ) ) ( not ( = ?auto_59275 ?auto_59279 ) ) ( not ( = ?auto_59276 ?auto_59277 ) ) ( not ( = ?auto_59276 ?auto_59278 ) ) ( not ( = ?auto_59276 ?auto_59279 ) ) ( not ( = ?auto_59277 ?auto_59278 ) ) ( not ( = ?auto_59277 ?auto_59279 ) ) ( not ( = ?auto_59278 ?auto_59279 ) ) ( ON-TABLE ?auto_59279 ) ( ON ?auto_59278 ?auto_59279 ) ( ON ?auto_59277 ?auto_59278 ) ( ON ?auto_59276 ?auto_59277 ) ( ON ?auto_59275 ?auto_59276 ) ( CLEAR ?auto_59275 ) ( HOLDING ?auto_59274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59274 )
      ( MAKE-6PILE ?auto_59274 ?auto_59275 ?auto_59276 ?auto_59277 ?auto_59278 ?auto_59279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59280 - BLOCK
      ?auto_59281 - BLOCK
      ?auto_59282 - BLOCK
      ?auto_59283 - BLOCK
      ?auto_59284 - BLOCK
      ?auto_59285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59280 ?auto_59281 ) ) ( not ( = ?auto_59280 ?auto_59282 ) ) ( not ( = ?auto_59280 ?auto_59283 ) ) ( not ( = ?auto_59280 ?auto_59284 ) ) ( not ( = ?auto_59280 ?auto_59285 ) ) ( not ( = ?auto_59281 ?auto_59282 ) ) ( not ( = ?auto_59281 ?auto_59283 ) ) ( not ( = ?auto_59281 ?auto_59284 ) ) ( not ( = ?auto_59281 ?auto_59285 ) ) ( not ( = ?auto_59282 ?auto_59283 ) ) ( not ( = ?auto_59282 ?auto_59284 ) ) ( not ( = ?auto_59282 ?auto_59285 ) ) ( not ( = ?auto_59283 ?auto_59284 ) ) ( not ( = ?auto_59283 ?auto_59285 ) ) ( not ( = ?auto_59284 ?auto_59285 ) ) ( ON-TABLE ?auto_59285 ) ( ON ?auto_59284 ?auto_59285 ) ( ON ?auto_59283 ?auto_59284 ) ( ON ?auto_59282 ?auto_59283 ) ( ON ?auto_59281 ?auto_59282 ) ( ON ?auto_59280 ?auto_59281 ) ( CLEAR ?auto_59280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59285 ?auto_59284 ?auto_59283 ?auto_59282 ?auto_59281 )
      ( MAKE-6PILE ?auto_59280 ?auto_59281 ?auto_59282 ?auto_59283 ?auto_59284 ?auto_59285 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59286 - BLOCK
      ?auto_59287 - BLOCK
      ?auto_59288 - BLOCK
      ?auto_59289 - BLOCK
      ?auto_59290 - BLOCK
      ?auto_59291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59286 ?auto_59287 ) ) ( not ( = ?auto_59286 ?auto_59288 ) ) ( not ( = ?auto_59286 ?auto_59289 ) ) ( not ( = ?auto_59286 ?auto_59290 ) ) ( not ( = ?auto_59286 ?auto_59291 ) ) ( not ( = ?auto_59287 ?auto_59288 ) ) ( not ( = ?auto_59287 ?auto_59289 ) ) ( not ( = ?auto_59287 ?auto_59290 ) ) ( not ( = ?auto_59287 ?auto_59291 ) ) ( not ( = ?auto_59288 ?auto_59289 ) ) ( not ( = ?auto_59288 ?auto_59290 ) ) ( not ( = ?auto_59288 ?auto_59291 ) ) ( not ( = ?auto_59289 ?auto_59290 ) ) ( not ( = ?auto_59289 ?auto_59291 ) ) ( not ( = ?auto_59290 ?auto_59291 ) ) ( ON-TABLE ?auto_59291 ) ( ON ?auto_59290 ?auto_59291 ) ( ON ?auto_59289 ?auto_59290 ) ( ON ?auto_59288 ?auto_59289 ) ( ON ?auto_59287 ?auto_59288 ) ( HOLDING ?auto_59286 ) ( CLEAR ?auto_59287 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59291 ?auto_59290 ?auto_59289 ?auto_59288 ?auto_59287 ?auto_59286 )
      ( MAKE-6PILE ?auto_59286 ?auto_59287 ?auto_59288 ?auto_59289 ?auto_59290 ?auto_59291 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59292 - BLOCK
      ?auto_59293 - BLOCK
      ?auto_59294 - BLOCK
      ?auto_59295 - BLOCK
      ?auto_59296 - BLOCK
      ?auto_59297 - BLOCK
    )
    :vars
    (
      ?auto_59298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59292 ?auto_59293 ) ) ( not ( = ?auto_59292 ?auto_59294 ) ) ( not ( = ?auto_59292 ?auto_59295 ) ) ( not ( = ?auto_59292 ?auto_59296 ) ) ( not ( = ?auto_59292 ?auto_59297 ) ) ( not ( = ?auto_59293 ?auto_59294 ) ) ( not ( = ?auto_59293 ?auto_59295 ) ) ( not ( = ?auto_59293 ?auto_59296 ) ) ( not ( = ?auto_59293 ?auto_59297 ) ) ( not ( = ?auto_59294 ?auto_59295 ) ) ( not ( = ?auto_59294 ?auto_59296 ) ) ( not ( = ?auto_59294 ?auto_59297 ) ) ( not ( = ?auto_59295 ?auto_59296 ) ) ( not ( = ?auto_59295 ?auto_59297 ) ) ( not ( = ?auto_59296 ?auto_59297 ) ) ( ON-TABLE ?auto_59297 ) ( ON ?auto_59296 ?auto_59297 ) ( ON ?auto_59295 ?auto_59296 ) ( ON ?auto_59294 ?auto_59295 ) ( ON ?auto_59293 ?auto_59294 ) ( CLEAR ?auto_59293 ) ( ON ?auto_59292 ?auto_59298 ) ( CLEAR ?auto_59292 ) ( HAND-EMPTY ) ( not ( = ?auto_59292 ?auto_59298 ) ) ( not ( = ?auto_59293 ?auto_59298 ) ) ( not ( = ?auto_59294 ?auto_59298 ) ) ( not ( = ?auto_59295 ?auto_59298 ) ) ( not ( = ?auto_59296 ?auto_59298 ) ) ( not ( = ?auto_59297 ?auto_59298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59292 ?auto_59298 )
      ( MAKE-6PILE ?auto_59292 ?auto_59293 ?auto_59294 ?auto_59295 ?auto_59296 ?auto_59297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59299 - BLOCK
      ?auto_59300 - BLOCK
      ?auto_59301 - BLOCK
      ?auto_59302 - BLOCK
      ?auto_59303 - BLOCK
      ?auto_59304 - BLOCK
    )
    :vars
    (
      ?auto_59305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59299 ?auto_59300 ) ) ( not ( = ?auto_59299 ?auto_59301 ) ) ( not ( = ?auto_59299 ?auto_59302 ) ) ( not ( = ?auto_59299 ?auto_59303 ) ) ( not ( = ?auto_59299 ?auto_59304 ) ) ( not ( = ?auto_59300 ?auto_59301 ) ) ( not ( = ?auto_59300 ?auto_59302 ) ) ( not ( = ?auto_59300 ?auto_59303 ) ) ( not ( = ?auto_59300 ?auto_59304 ) ) ( not ( = ?auto_59301 ?auto_59302 ) ) ( not ( = ?auto_59301 ?auto_59303 ) ) ( not ( = ?auto_59301 ?auto_59304 ) ) ( not ( = ?auto_59302 ?auto_59303 ) ) ( not ( = ?auto_59302 ?auto_59304 ) ) ( not ( = ?auto_59303 ?auto_59304 ) ) ( ON-TABLE ?auto_59304 ) ( ON ?auto_59303 ?auto_59304 ) ( ON ?auto_59302 ?auto_59303 ) ( ON ?auto_59301 ?auto_59302 ) ( ON ?auto_59299 ?auto_59305 ) ( CLEAR ?auto_59299 ) ( not ( = ?auto_59299 ?auto_59305 ) ) ( not ( = ?auto_59300 ?auto_59305 ) ) ( not ( = ?auto_59301 ?auto_59305 ) ) ( not ( = ?auto_59302 ?auto_59305 ) ) ( not ( = ?auto_59303 ?auto_59305 ) ) ( not ( = ?auto_59304 ?auto_59305 ) ) ( HOLDING ?auto_59300 ) ( CLEAR ?auto_59301 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59304 ?auto_59303 ?auto_59302 ?auto_59301 ?auto_59300 )
      ( MAKE-6PILE ?auto_59299 ?auto_59300 ?auto_59301 ?auto_59302 ?auto_59303 ?auto_59304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59306 - BLOCK
      ?auto_59307 - BLOCK
      ?auto_59308 - BLOCK
      ?auto_59309 - BLOCK
      ?auto_59310 - BLOCK
      ?auto_59311 - BLOCK
    )
    :vars
    (
      ?auto_59312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59306 ?auto_59307 ) ) ( not ( = ?auto_59306 ?auto_59308 ) ) ( not ( = ?auto_59306 ?auto_59309 ) ) ( not ( = ?auto_59306 ?auto_59310 ) ) ( not ( = ?auto_59306 ?auto_59311 ) ) ( not ( = ?auto_59307 ?auto_59308 ) ) ( not ( = ?auto_59307 ?auto_59309 ) ) ( not ( = ?auto_59307 ?auto_59310 ) ) ( not ( = ?auto_59307 ?auto_59311 ) ) ( not ( = ?auto_59308 ?auto_59309 ) ) ( not ( = ?auto_59308 ?auto_59310 ) ) ( not ( = ?auto_59308 ?auto_59311 ) ) ( not ( = ?auto_59309 ?auto_59310 ) ) ( not ( = ?auto_59309 ?auto_59311 ) ) ( not ( = ?auto_59310 ?auto_59311 ) ) ( ON-TABLE ?auto_59311 ) ( ON ?auto_59310 ?auto_59311 ) ( ON ?auto_59309 ?auto_59310 ) ( ON ?auto_59308 ?auto_59309 ) ( ON ?auto_59306 ?auto_59312 ) ( not ( = ?auto_59306 ?auto_59312 ) ) ( not ( = ?auto_59307 ?auto_59312 ) ) ( not ( = ?auto_59308 ?auto_59312 ) ) ( not ( = ?auto_59309 ?auto_59312 ) ) ( not ( = ?auto_59310 ?auto_59312 ) ) ( not ( = ?auto_59311 ?auto_59312 ) ) ( CLEAR ?auto_59308 ) ( ON ?auto_59307 ?auto_59306 ) ( CLEAR ?auto_59307 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_59312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59312 ?auto_59306 )
      ( MAKE-6PILE ?auto_59306 ?auto_59307 ?auto_59308 ?auto_59309 ?auto_59310 ?auto_59311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59313 - BLOCK
      ?auto_59314 - BLOCK
      ?auto_59315 - BLOCK
      ?auto_59316 - BLOCK
      ?auto_59317 - BLOCK
      ?auto_59318 - BLOCK
    )
    :vars
    (
      ?auto_59319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59313 ?auto_59314 ) ) ( not ( = ?auto_59313 ?auto_59315 ) ) ( not ( = ?auto_59313 ?auto_59316 ) ) ( not ( = ?auto_59313 ?auto_59317 ) ) ( not ( = ?auto_59313 ?auto_59318 ) ) ( not ( = ?auto_59314 ?auto_59315 ) ) ( not ( = ?auto_59314 ?auto_59316 ) ) ( not ( = ?auto_59314 ?auto_59317 ) ) ( not ( = ?auto_59314 ?auto_59318 ) ) ( not ( = ?auto_59315 ?auto_59316 ) ) ( not ( = ?auto_59315 ?auto_59317 ) ) ( not ( = ?auto_59315 ?auto_59318 ) ) ( not ( = ?auto_59316 ?auto_59317 ) ) ( not ( = ?auto_59316 ?auto_59318 ) ) ( not ( = ?auto_59317 ?auto_59318 ) ) ( ON-TABLE ?auto_59318 ) ( ON ?auto_59317 ?auto_59318 ) ( ON ?auto_59316 ?auto_59317 ) ( ON ?auto_59313 ?auto_59319 ) ( not ( = ?auto_59313 ?auto_59319 ) ) ( not ( = ?auto_59314 ?auto_59319 ) ) ( not ( = ?auto_59315 ?auto_59319 ) ) ( not ( = ?auto_59316 ?auto_59319 ) ) ( not ( = ?auto_59317 ?auto_59319 ) ) ( not ( = ?auto_59318 ?auto_59319 ) ) ( ON ?auto_59314 ?auto_59313 ) ( CLEAR ?auto_59314 ) ( ON-TABLE ?auto_59319 ) ( HOLDING ?auto_59315 ) ( CLEAR ?auto_59316 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59318 ?auto_59317 ?auto_59316 ?auto_59315 )
      ( MAKE-6PILE ?auto_59313 ?auto_59314 ?auto_59315 ?auto_59316 ?auto_59317 ?auto_59318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59320 - BLOCK
      ?auto_59321 - BLOCK
      ?auto_59322 - BLOCK
      ?auto_59323 - BLOCK
      ?auto_59324 - BLOCK
      ?auto_59325 - BLOCK
    )
    :vars
    (
      ?auto_59326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59320 ?auto_59321 ) ) ( not ( = ?auto_59320 ?auto_59322 ) ) ( not ( = ?auto_59320 ?auto_59323 ) ) ( not ( = ?auto_59320 ?auto_59324 ) ) ( not ( = ?auto_59320 ?auto_59325 ) ) ( not ( = ?auto_59321 ?auto_59322 ) ) ( not ( = ?auto_59321 ?auto_59323 ) ) ( not ( = ?auto_59321 ?auto_59324 ) ) ( not ( = ?auto_59321 ?auto_59325 ) ) ( not ( = ?auto_59322 ?auto_59323 ) ) ( not ( = ?auto_59322 ?auto_59324 ) ) ( not ( = ?auto_59322 ?auto_59325 ) ) ( not ( = ?auto_59323 ?auto_59324 ) ) ( not ( = ?auto_59323 ?auto_59325 ) ) ( not ( = ?auto_59324 ?auto_59325 ) ) ( ON-TABLE ?auto_59325 ) ( ON ?auto_59324 ?auto_59325 ) ( ON ?auto_59323 ?auto_59324 ) ( ON ?auto_59320 ?auto_59326 ) ( not ( = ?auto_59320 ?auto_59326 ) ) ( not ( = ?auto_59321 ?auto_59326 ) ) ( not ( = ?auto_59322 ?auto_59326 ) ) ( not ( = ?auto_59323 ?auto_59326 ) ) ( not ( = ?auto_59324 ?auto_59326 ) ) ( not ( = ?auto_59325 ?auto_59326 ) ) ( ON ?auto_59321 ?auto_59320 ) ( ON-TABLE ?auto_59326 ) ( CLEAR ?auto_59323 ) ( ON ?auto_59322 ?auto_59321 ) ( CLEAR ?auto_59322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59326 ?auto_59320 ?auto_59321 )
      ( MAKE-6PILE ?auto_59320 ?auto_59321 ?auto_59322 ?auto_59323 ?auto_59324 ?auto_59325 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59327 - BLOCK
      ?auto_59328 - BLOCK
      ?auto_59329 - BLOCK
      ?auto_59330 - BLOCK
      ?auto_59331 - BLOCK
      ?auto_59332 - BLOCK
    )
    :vars
    (
      ?auto_59333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59327 ?auto_59328 ) ) ( not ( = ?auto_59327 ?auto_59329 ) ) ( not ( = ?auto_59327 ?auto_59330 ) ) ( not ( = ?auto_59327 ?auto_59331 ) ) ( not ( = ?auto_59327 ?auto_59332 ) ) ( not ( = ?auto_59328 ?auto_59329 ) ) ( not ( = ?auto_59328 ?auto_59330 ) ) ( not ( = ?auto_59328 ?auto_59331 ) ) ( not ( = ?auto_59328 ?auto_59332 ) ) ( not ( = ?auto_59329 ?auto_59330 ) ) ( not ( = ?auto_59329 ?auto_59331 ) ) ( not ( = ?auto_59329 ?auto_59332 ) ) ( not ( = ?auto_59330 ?auto_59331 ) ) ( not ( = ?auto_59330 ?auto_59332 ) ) ( not ( = ?auto_59331 ?auto_59332 ) ) ( ON-TABLE ?auto_59332 ) ( ON ?auto_59331 ?auto_59332 ) ( ON ?auto_59327 ?auto_59333 ) ( not ( = ?auto_59327 ?auto_59333 ) ) ( not ( = ?auto_59328 ?auto_59333 ) ) ( not ( = ?auto_59329 ?auto_59333 ) ) ( not ( = ?auto_59330 ?auto_59333 ) ) ( not ( = ?auto_59331 ?auto_59333 ) ) ( not ( = ?auto_59332 ?auto_59333 ) ) ( ON ?auto_59328 ?auto_59327 ) ( ON-TABLE ?auto_59333 ) ( ON ?auto_59329 ?auto_59328 ) ( CLEAR ?auto_59329 ) ( HOLDING ?auto_59330 ) ( CLEAR ?auto_59331 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_59332 ?auto_59331 ?auto_59330 )
      ( MAKE-6PILE ?auto_59327 ?auto_59328 ?auto_59329 ?auto_59330 ?auto_59331 ?auto_59332 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59334 - BLOCK
      ?auto_59335 - BLOCK
      ?auto_59336 - BLOCK
      ?auto_59337 - BLOCK
      ?auto_59338 - BLOCK
      ?auto_59339 - BLOCK
    )
    :vars
    (
      ?auto_59340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59334 ?auto_59335 ) ) ( not ( = ?auto_59334 ?auto_59336 ) ) ( not ( = ?auto_59334 ?auto_59337 ) ) ( not ( = ?auto_59334 ?auto_59338 ) ) ( not ( = ?auto_59334 ?auto_59339 ) ) ( not ( = ?auto_59335 ?auto_59336 ) ) ( not ( = ?auto_59335 ?auto_59337 ) ) ( not ( = ?auto_59335 ?auto_59338 ) ) ( not ( = ?auto_59335 ?auto_59339 ) ) ( not ( = ?auto_59336 ?auto_59337 ) ) ( not ( = ?auto_59336 ?auto_59338 ) ) ( not ( = ?auto_59336 ?auto_59339 ) ) ( not ( = ?auto_59337 ?auto_59338 ) ) ( not ( = ?auto_59337 ?auto_59339 ) ) ( not ( = ?auto_59338 ?auto_59339 ) ) ( ON-TABLE ?auto_59339 ) ( ON ?auto_59338 ?auto_59339 ) ( ON ?auto_59334 ?auto_59340 ) ( not ( = ?auto_59334 ?auto_59340 ) ) ( not ( = ?auto_59335 ?auto_59340 ) ) ( not ( = ?auto_59336 ?auto_59340 ) ) ( not ( = ?auto_59337 ?auto_59340 ) ) ( not ( = ?auto_59338 ?auto_59340 ) ) ( not ( = ?auto_59339 ?auto_59340 ) ) ( ON ?auto_59335 ?auto_59334 ) ( ON-TABLE ?auto_59340 ) ( ON ?auto_59336 ?auto_59335 ) ( CLEAR ?auto_59338 ) ( ON ?auto_59337 ?auto_59336 ) ( CLEAR ?auto_59337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_59340 ?auto_59334 ?auto_59335 ?auto_59336 )
      ( MAKE-6PILE ?auto_59334 ?auto_59335 ?auto_59336 ?auto_59337 ?auto_59338 ?auto_59339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59341 - BLOCK
      ?auto_59342 - BLOCK
      ?auto_59343 - BLOCK
      ?auto_59344 - BLOCK
      ?auto_59345 - BLOCK
      ?auto_59346 - BLOCK
    )
    :vars
    (
      ?auto_59347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59341 ?auto_59342 ) ) ( not ( = ?auto_59341 ?auto_59343 ) ) ( not ( = ?auto_59341 ?auto_59344 ) ) ( not ( = ?auto_59341 ?auto_59345 ) ) ( not ( = ?auto_59341 ?auto_59346 ) ) ( not ( = ?auto_59342 ?auto_59343 ) ) ( not ( = ?auto_59342 ?auto_59344 ) ) ( not ( = ?auto_59342 ?auto_59345 ) ) ( not ( = ?auto_59342 ?auto_59346 ) ) ( not ( = ?auto_59343 ?auto_59344 ) ) ( not ( = ?auto_59343 ?auto_59345 ) ) ( not ( = ?auto_59343 ?auto_59346 ) ) ( not ( = ?auto_59344 ?auto_59345 ) ) ( not ( = ?auto_59344 ?auto_59346 ) ) ( not ( = ?auto_59345 ?auto_59346 ) ) ( ON-TABLE ?auto_59346 ) ( ON ?auto_59341 ?auto_59347 ) ( not ( = ?auto_59341 ?auto_59347 ) ) ( not ( = ?auto_59342 ?auto_59347 ) ) ( not ( = ?auto_59343 ?auto_59347 ) ) ( not ( = ?auto_59344 ?auto_59347 ) ) ( not ( = ?auto_59345 ?auto_59347 ) ) ( not ( = ?auto_59346 ?auto_59347 ) ) ( ON ?auto_59342 ?auto_59341 ) ( ON-TABLE ?auto_59347 ) ( ON ?auto_59343 ?auto_59342 ) ( ON ?auto_59344 ?auto_59343 ) ( CLEAR ?auto_59344 ) ( HOLDING ?auto_59345 ) ( CLEAR ?auto_59346 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_59346 ?auto_59345 )
      ( MAKE-6PILE ?auto_59341 ?auto_59342 ?auto_59343 ?auto_59344 ?auto_59345 ?auto_59346 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59348 - BLOCK
      ?auto_59349 - BLOCK
      ?auto_59350 - BLOCK
      ?auto_59351 - BLOCK
      ?auto_59352 - BLOCK
      ?auto_59353 - BLOCK
    )
    :vars
    (
      ?auto_59354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59348 ?auto_59349 ) ) ( not ( = ?auto_59348 ?auto_59350 ) ) ( not ( = ?auto_59348 ?auto_59351 ) ) ( not ( = ?auto_59348 ?auto_59352 ) ) ( not ( = ?auto_59348 ?auto_59353 ) ) ( not ( = ?auto_59349 ?auto_59350 ) ) ( not ( = ?auto_59349 ?auto_59351 ) ) ( not ( = ?auto_59349 ?auto_59352 ) ) ( not ( = ?auto_59349 ?auto_59353 ) ) ( not ( = ?auto_59350 ?auto_59351 ) ) ( not ( = ?auto_59350 ?auto_59352 ) ) ( not ( = ?auto_59350 ?auto_59353 ) ) ( not ( = ?auto_59351 ?auto_59352 ) ) ( not ( = ?auto_59351 ?auto_59353 ) ) ( not ( = ?auto_59352 ?auto_59353 ) ) ( ON-TABLE ?auto_59353 ) ( ON ?auto_59348 ?auto_59354 ) ( not ( = ?auto_59348 ?auto_59354 ) ) ( not ( = ?auto_59349 ?auto_59354 ) ) ( not ( = ?auto_59350 ?auto_59354 ) ) ( not ( = ?auto_59351 ?auto_59354 ) ) ( not ( = ?auto_59352 ?auto_59354 ) ) ( not ( = ?auto_59353 ?auto_59354 ) ) ( ON ?auto_59349 ?auto_59348 ) ( ON-TABLE ?auto_59354 ) ( ON ?auto_59350 ?auto_59349 ) ( ON ?auto_59351 ?auto_59350 ) ( CLEAR ?auto_59353 ) ( ON ?auto_59352 ?auto_59351 ) ( CLEAR ?auto_59352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_59354 ?auto_59348 ?auto_59349 ?auto_59350 ?auto_59351 )
      ( MAKE-6PILE ?auto_59348 ?auto_59349 ?auto_59350 ?auto_59351 ?auto_59352 ?auto_59353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59355 - BLOCK
      ?auto_59356 - BLOCK
      ?auto_59357 - BLOCK
      ?auto_59358 - BLOCK
      ?auto_59359 - BLOCK
      ?auto_59360 - BLOCK
    )
    :vars
    (
      ?auto_59361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59355 ?auto_59356 ) ) ( not ( = ?auto_59355 ?auto_59357 ) ) ( not ( = ?auto_59355 ?auto_59358 ) ) ( not ( = ?auto_59355 ?auto_59359 ) ) ( not ( = ?auto_59355 ?auto_59360 ) ) ( not ( = ?auto_59356 ?auto_59357 ) ) ( not ( = ?auto_59356 ?auto_59358 ) ) ( not ( = ?auto_59356 ?auto_59359 ) ) ( not ( = ?auto_59356 ?auto_59360 ) ) ( not ( = ?auto_59357 ?auto_59358 ) ) ( not ( = ?auto_59357 ?auto_59359 ) ) ( not ( = ?auto_59357 ?auto_59360 ) ) ( not ( = ?auto_59358 ?auto_59359 ) ) ( not ( = ?auto_59358 ?auto_59360 ) ) ( not ( = ?auto_59359 ?auto_59360 ) ) ( ON ?auto_59355 ?auto_59361 ) ( not ( = ?auto_59355 ?auto_59361 ) ) ( not ( = ?auto_59356 ?auto_59361 ) ) ( not ( = ?auto_59357 ?auto_59361 ) ) ( not ( = ?auto_59358 ?auto_59361 ) ) ( not ( = ?auto_59359 ?auto_59361 ) ) ( not ( = ?auto_59360 ?auto_59361 ) ) ( ON ?auto_59356 ?auto_59355 ) ( ON-TABLE ?auto_59361 ) ( ON ?auto_59357 ?auto_59356 ) ( ON ?auto_59358 ?auto_59357 ) ( ON ?auto_59359 ?auto_59358 ) ( CLEAR ?auto_59359 ) ( HOLDING ?auto_59360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59360 )
      ( MAKE-6PILE ?auto_59355 ?auto_59356 ?auto_59357 ?auto_59358 ?auto_59359 ?auto_59360 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_59362 - BLOCK
      ?auto_59363 - BLOCK
      ?auto_59364 - BLOCK
      ?auto_59365 - BLOCK
      ?auto_59366 - BLOCK
      ?auto_59367 - BLOCK
    )
    :vars
    (
      ?auto_59368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59362 ?auto_59363 ) ) ( not ( = ?auto_59362 ?auto_59364 ) ) ( not ( = ?auto_59362 ?auto_59365 ) ) ( not ( = ?auto_59362 ?auto_59366 ) ) ( not ( = ?auto_59362 ?auto_59367 ) ) ( not ( = ?auto_59363 ?auto_59364 ) ) ( not ( = ?auto_59363 ?auto_59365 ) ) ( not ( = ?auto_59363 ?auto_59366 ) ) ( not ( = ?auto_59363 ?auto_59367 ) ) ( not ( = ?auto_59364 ?auto_59365 ) ) ( not ( = ?auto_59364 ?auto_59366 ) ) ( not ( = ?auto_59364 ?auto_59367 ) ) ( not ( = ?auto_59365 ?auto_59366 ) ) ( not ( = ?auto_59365 ?auto_59367 ) ) ( not ( = ?auto_59366 ?auto_59367 ) ) ( ON ?auto_59362 ?auto_59368 ) ( not ( = ?auto_59362 ?auto_59368 ) ) ( not ( = ?auto_59363 ?auto_59368 ) ) ( not ( = ?auto_59364 ?auto_59368 ) ) ( not ( = ?auto_59365 ?auto_59368 ) ) ( not ( = ?auto_59366 ?auto_59368 ) ) ( not ( = ?auto_59367 ?auto_59368 ) ) ( ON ?auto_59363 ?auto_59362 ) ( ON-TABLE ?auto_59368 ) ( ON ?auto_59364 ?auto_59363 ) ( ON ?auto_59365 ?auto_59364 ) ( ON ?auto_59366 ?auto_59365 ) ( ON ?auto_59367 ?auto_59366 ) ( CLEAR ?auto_59367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_59368 ?auto_59362 ?auto_59363 ?auto_59364 ?auto_59365 ?auto_59366 )
      ( MAKE-6PILE ?auto_59362 ?auto_59363 ?auto_59364 ?auto_59365 ?auto_59366 ?auto_59367 ) )
  )

)

