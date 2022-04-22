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
      ?auto_672505 - BLOCK
    )
    :vars
    (
      ?auto_672506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672505 ?auto_672506 ) ( CLEAR ?auto_672505 ) ( HAND-EMPTY ) ( not ( = ?auto_672505 ?auto_672506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_672505 ?auto_672506 )
      ( !PUTDOWN ?auto_672505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_672512 - BLOCK
      ?auto_672513 - BLOCK
    )
    :vars
    (
      ?auto_672514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_672512 ) ( ON ?auto_672513 ?auto_672514 ) ( CLEAR ?auto_672513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_672512 ) ( not ( = ?auto_672512 ?auto_672513 ) ) ( not ( = ?auto_672512 ?auto_672514 ) ) ( not ( = ?auto_672513 ?auto_672514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_672513 ?auto_672514 )
      ( !STACK ?auto_672513 ?auto_672512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_672522 - BLOCK
      ?auto_672523 - BLOCK
    )
    :vars
    (
      ?auto_672524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672523 ?auto_672524 ) ( not ( = ?auto_672522 ?auto_672523 ) ) ( not ( = ?auto_672522 ?auto_672524 ) ) ( not ( = ?auto_672523 ?auto_672524 ) ) ( ON ?auto_672522 ?auto_672523 ) ( CLEAR ?auto_672522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_672522 )
      ( MAKE-2PILE ?auto_672522 ?auto_672523 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_672533 - BLOCK
      ?auto_672534 - BLOCK
      ?auto_672535 - BLOCK
    )
    :vars
    (
      ?auto_672536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_672534 ) ( ON ?auto_672535 ?auto_672536 ) ( CLEAR ?auto_672535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_672533 ) ( ON ?auto_672534 ?auto_672533 ) ( not ( = ?auto_672533 ?auto_672534 ) ) ( not ( = ?auto_672533 ?auto_672535 ) ) ( not ( = ?auto_672533 ?auto_672536 ) ) ( not ( = ?auto_672534 ?auto_672535 ) ) ( not ( = ?auto_672534 ?auto_672536 ) ) ( not ( = ?auto_672535 ?auto_672536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_672535 ?auto_672536 )
      ( !STACK ?auto_672535 ?auto_672534 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_672547 - BLOCK
      ?auto_672548 - BLOCK
      ?auto_672549 - BLOCK
    )
    :vars
    (
      ?auto_672550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672549 ?auto_672550 ) ( ON-TABLE ?auto_672547 ) ( not ( = ?auto_672547 ?auto_672548 ) ) ( not ( = ?auto_672547 ?auto_672549 ) ) ( not ( = ?auto_672547 ?auto_672550 ) ) ( not ( = ?auto_672548 ?auto_672549 ) ) ( not ( = ?auto_672548 ?auto_672550 ) ) ( not ( = ?auto_672549 ?auto_672550 ) ) ( CLEAR ?auto_672547 ) ( ON ?auto_672548 ?auto_672549 ) ( CLEAR ?auto_672548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_672547 ?auto_672548 )
      ( MAKE-3PILE ?auto_672547 ?auto_672548 ?auto_672549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_672561 - BLOCK
      ?auto_672562 - BLOCK
      ?auto_672563 - BLOCK
    )
    :vars
    (
      ?auto_672564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672563 ?auto_672564 ) ( not ( = ?auto_672561 ?auto_672562 ) ) ( not ( = ?auto_672561 ?auto_672563 ) ) ( not ( = ?auto_672561 ?auto_672564 ) ) ( not ( = ?auto_672562 ?auto_672563 ) ) ( not ( = ?auto_672562 ?auto_672564 ) ) ( not ( = ?auto_672563 ?auto_672564 ) ) ( ON ?auto_672562 ?auto_672563 ) ( ON ?auto_672561 ?auto_672562 ) ( CLEAR ?auto_672561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_672561 )
      ( MAKE-3PILE ?auto_672561 ?auto_672562 ?auto_672563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_672576 - BLOCK
      ?auto_672577 - BLOCK
      ?auto_672578 - BLOCK
      ?auto_672579 - BLOCK
    )
    :vars
    (
      ?auto_672580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_672578 ) ( ON ?auto_672579 ?auto_672580 ) ( CLEAR ?auto_672579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_672576 ) ( ON ?auto_672577 ?auto_672576 ) ( ON ?auto_672578 ?auto_672577 ) ( not ( = ?auto_672576 ?auto_672577 ) ) ( not ( = ?auto_672576 ?auto_672578 ) ) ( not ( = ?auto_672576 ?auto_672579 ) ) ( not ( = ?auto_672576 ?auto_672580 ) ) ( not ( = ?auto_672577 ?auto_672578 ) ) ( not ( = ?auto_672577 ?auto_672579 ) ) ( not ( = ?auto_672577 ?auto_672580 ) ) ( not ( = ?auto_672578 ?auto_672579 ) ) ( not ( = ?auto_672578 ?auto_672580 ) ) ( not ( = ?auto_672579 ?auto_672580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_672579 ?auto_672580 )
      ( !STACK ?auto_672579 ?auto_672578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_672594 - BLOCK
      ?auto_672595 - BLOCK
      ?auto_672596 - BLOCK
      ?auto_672597 - BLOCK
    )
    :vars
    (
      ?auto_672598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672597 ?auto_672598 ) ( ON-TABLE ?auto_672594 ) ( ON ?auto_672595 ?auto_672594 ) ( not ( = ?auto_672594 ?auto_672595 ) ) ( not ( = ?auto_672594 ?auto_672596 ) ) ( not ( = ?auto_672594 ?auto_672597 ) ) ( not ( = ?auto_672594 ?auto_672598 ) ) ( not ( = ?auto_672595 ?auto_672596 ) ) ( not ( = ?auto_672595 ?auto_672597 ) ) ( not ( = ?auto_672595 ?auto_672598 ) ) ( not ( = ?auto_672596 ?auto_672597 ) ) ( not ( = ?auto_672596 ?auto_672598 ) ) ( not ( = ?auto_672597 ?auto_672598 ) ) ( CLEAR ?auto_672595 ) ( ON ?auto_672596 ?auto_672597 ) ( CLEAR ?auto_672596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_672594 ?auto_672595 ?auto_672596 )
      ( MAKE-4PILE ?auto_672594 ?auto_672595 ?auto_672596 ?auto_672597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_672612 - BLOCK
      ?auto_672613 - BLOCK
      ?auto_672614 - BLOCK
      ?auto_672615 - BLOCK
    )
    :vars
    (
      ?auto_672616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672615 ?auto_672616 ) ( ON-TABLE ?auto_672612 ) ( not ( = ?auto_672612 ?auto_672613 ) ) ( not ( = ?auto_672612 ?auto_672614 ) ) ( not ( = ?auto_672612 ?auto_672615 ) ) ( not ( = ?auto_672612 ?auto_672616 ) ) ( not ( = ?auto_672613 ?auto_672614 ) ) ( not ( = ?auto_672613 ?auto_672615 ) ) ( not ( = ?auto_672613 ?auto_672616 ) ) ( not ( = ?auto_672614 ?auto_672615 ) ) ( not ( = ?auto_672614 ?auto_672616 ) ) ( not ( = ?auto_672615 ?auto_672616 ) ) ( ON ?auto_672614 ?auto_672615 ) ( CLEAR ?auto_672612 ) ( ON ?auto_672613 ?auto_672614 ) ( CLEAR ?auto_672613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_672612 ?auto_672613 )
      ( MAKE-4PILE ?auto_672612 ?auto_672613 ?auto_672614 ?auto_672615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_672630 - BLOCK
      ?auto_672631 - BLOCK
      ?auto_672632 - BLOCK
      ?auto_672633 - BLOCK
    )
    :vars
    (
      ?auto_672634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672633 ?auto_672634 ) ( not ( = ?auto_672630 ?auto_672631 ) ) ( not ( = ?auto_672630 ?auto_672632 ) ) ( not ( = ?auto_672630 ?auto_672633 ) ) ( not ( = ?auto_672630 ?auto_672634 ) ) ( not ( = ?auto_672631 ?auto_672632 ) ) ( not ( = ?auto_672631 ?auto_672633 ) ) ( not ( = ?auto_672631 ?auto_672634 ) ) ( not ( = ?auto_672632 ?auto_672633 ) ) ( not ( = ?auto_672632 ?auto_672634 ) ) ( not ( = ?auto_672633 ?auto_672634 ) ) ( ON ?auto_672632 ?auto_672633 ) ( ON ?auto_672631 ?auto_672632 ) ( ON ?auto_672630 ?auto_672631 ) ( CLEAR ?auto_672630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_672630 )
      ( MAKE-4PILE ?auto_672630 ?auto_672631 ?auto_672632 ?auto_672633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_672649 - BLOCK
      ?auto_672650 - BLOCK
      ?auto_672651 - BLOCK
      ?auto_672652 - BLOCK
      ?auto_672653 - BLOCK
    )
    :vars
    (
      ?auto_672654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_672652 ) ( ON ?auto_672653 ?auto_672654 ) ( CLEAR ?auto_672653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_672649 ) ( ON ?auto_672650 ?auto_672649 ) ( ON ?auto_672651 ?auto_672650 ) ( ON ?auto_672652 ?auto_672651 ) ( not ( = ?auto_672649 ?auto_672650 ) ) ( not ( = ?auto_672649 ?auto_672651 ) ) ( not ( = ?auto_672649 ?auto_672652 ) ) ( not ( = ?auto_672649 ?auto_672653 ) ) ( not ( = ?auto_672649 ?auto_672654 ) ) ( not ( = ?auto_672650 ?auto_672651 ) ) ( not ( = ?auto_672650 ?auto_672652 ) ) ( not ( = ?auto_672650 ?auto_672653 ) ) ( not ( = ?auto_672650 ?auto_672654 ) ) ( not ( = ?auto_672651 ?auto_672652 ) ) ( not ( = ?auto_672651 ?auto_672653 ) ) ( not ( = ?auto_672651 ?auto_672654 ) ) ( not ( = ?auto_672652 ?auto_672653 ) ) ( not ( = ?auto_672652 ?auto_672654 ) ) ( not ( = ?auto_672653 ?auto_672654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_672653 ?auto_672654 )
      ( !STACK ?auto_672653 ?auto_672652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_672671 - BLOCK
      ?auto_672672 - BLOCK
      ?auto_672673 - BLOCK
      ?auto_672674 - BLOCK
      ?auto_672675 - BLOCK
    )
    :vars
    (
      ?auto_672676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672675 ?auto_672676 ) ( ON-TABLE ?auto_672671 ) ( ON ?auto_672672 ?auto_672671 ) ( ON ?auto_672673 ?auto_672672 ) ( not ( = ?auto_672671 ?auto_672672 ) ) ( not ( = ?auto_672671 ?auto_672673 ) ) ( not ( = ?auto_672671 ?auto_672674 ) ) ( not ( = ?auto_672671 ?auto_672675 ) ) ( not ( = ?auto_672671 ?auto_672676 ) ) ( not ( = ?auto_672672 ?auto_672673 ) ) ( not ( = ?auto_672672 ?auto_672674 ) ) ( not ( = ?auto_672672 ?auto_672675 ) ) ( not ( = ?auto_672672 ?auto_672676 ) ) ( not ( = ?auto_672673 ?auto_672674 ) ) ( not ( = ?auto_672673 ?auto_672675 ) ) ( not ( = ?auto_672673 ?auto_672676 ) ) ( not ( = ?auto_672674 ?auto_672675 ) ) ( not ( = ?auto_672674 ?auto_672676 ) ) ( not ( = ?auto_672675 ?auto_672676 ) ) ( CLEAR ?auto_672673 ) ( ON ?auto_672674 ?auto_672675 ) ( CLEAR ?auto_672674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_672671 ?auto_672672 ?auto_672673 ?auto_672674 )
      ( MAKE-5PILE ?auto_672671 ?auto_672672 ?auto_672673 ?auto_672674 ?auto_672675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_672693 - BLOCK
      ?auto_672694 - BLOCK
      ?auto_672695 - BLOCK
      ?auto_672696 - BLOCK
      ?auto_672697 - BLOCK
    )
    :vars
    (
      ?auto_672698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672697 ?auto_672698 ) ( ON-TABLE ?auto_672693 ) ( ON ?auto_672694 ?auto_672693 ) ( not ( = ?auto_672693 ?auto_672694 ) ) ( not ( = ?auto_672693 ?auto_672695 ) ) ( not ( = ?auto_672693 ?auto_672696 ) ) ( not ( = ?auto_672693 ?auto_672697 ) ) ( not ( = ?auto_672693 ?auto_672698 ) ) ( not ( = ?auto_672694 ?auto_672695 ) ) ( not ( = ?auto_672694 ?auto_672696 ) ) ( not ( = ?auto_672694 ?auto_672697 ) ) ( not ( = ?auto_672694 ?auto_672698 ) ) ( not ( = ?auto_672695 ?auto_672696 ) ) ( not ( = ?auto_672695 ?auto_672697 ) ) ( not ( = ?auto_672695 ?auto_672698 ) ) ( not ( = ?auto_672696 ?auto_672697 ) ) ( not ( = ?auto_672696 ?auto_672698 ) ) ( not ( = ?auto_672697 ?auto_672698 ) ) ( ON ?auto_672696 ?auto_672697 ) ( CLEAR ?auto_672694 ) ( ON ?auto_672695 ?auto_672696 ) ( CLEAR ?auto_672695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_672693 ?auto_672694 ?auto_672695 )
      ( MAKE-5PILE ?auto_672693 ?auto_672694 ?auto_672695 ?auto_672696 ?auto_672697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_672715 - BLOCK
      ?auto_672716 - BLOCK
      ?auto_672717 - BLOCK
      ?auto_672718 - BLOCK
      ?auto_672719 - BLOCK
    )
    :vars
    (
      ?auto_672720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672719 ?auto_672720 ) ( ON-TABLE ?auto_672715 ) ( not ( = ?auto_672715 ?auto_672716 ) ) ( not ( = ?auto_672715 ?auto_672717 ) ) ( not ( = ?auto_672715 ?auto_672718 ) ) ( not ( = ?auto_672715 ?auto_672719 ) ) ( not ( = ?auto_672715 ?auto_672720 ) ) ( not ( = ?auto_672716 ?auto_672717 ) ) ( not ( = ?auto_672716 ?auto_672718 ) ) ( not ( = ?auto_672716 ?auto_672719 ) ) ( not ( = ?auto_672716 ?auto_672720 ) ) ( not ( = ?auto_672717 ?auto_672718 ) ) ( not ( = ?auto_672717 ?auto_672719 ) ) ( not ( = ?auto_672717 ?auto_672720 ) ) ( not ( = ?auto_672718 ?auto_672719 ) ) ( not ( = ?auto_672718 ?auto_672720 ) ) ( not ( = ?auto_672719 ?auto_672720 ) ) ( ON ?auto_672718 ?auto_672719 ) ( ON ?auto_672717 ?auto_672718 ) ( CLEAR ?auto_672715 ) ( ON ?auto_672716 ?auto_672717 ) ( CLEAR ?auto_672716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_672715 ?auto_672716 )
      ( MAKE-5PILE ?auto_672715 ?auto_672716 ?auto_672717 ?auto_672718 ?auto_672719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_672737 - BLOCK
      ?auto_672738 - BLOCK
      ?auto_672739 - BLOCK
      ?auto_672740 - BLOCK
      ?auto_672741 - BLOCK
    )
    :vars
    (
      ?auto_672742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672741 ?auto_672742 ) ( not ( = ?auto_672737 ?auto_672738 ) ) ( not ( = ?auto_672737 ?auto_672739 ) ) ( not ( = ?auto_672737 ?auto_672740 ) ) ( not ( = ?auto_672737 ?auto_672741 ) ) ( not ( = ?auto_672737 ?auto_672742 ) ) ( not ( = ?auto_672738 ?auto_672739 ) ) ( not ( = ?auto_672738 ?auto_672740 ) ) ( not ( = ?auto_672738 ?auto_672741 ) ) ( not ( = ?auto_672738 ?auto_672742 ) ) ( not ( = ?auto_672739 ?auto_672740 ) ) ( not ( = ?auto_672739 ?auto_672741 ) ) ( not ( = ?auto_672739 ?auto_672742 ) ) ( not ( = ?auto_672740 ?auto_672741 ) ) ( not ( = ?auto_672740 ?auto_672742 ) ) ( not ( = ?auto_672741 ?auto_672742 ) ) ( ON ?auto_672740 ?auto_672741 ) ( ON ?auto_672739 ?auto_672740 ) ( ON ?auto_672738 ?auto_672739 ) ( ON ?auto_672737 ?auto_672738 ) ( CLEAR ?auto_672737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_672737 )
      ( MAKE-5PILE ?auto_672737 ?auto_672738 ?auto_672739 ?auto_672740 ?auto_672741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_672760 - BLOCK
      ?auto_672761 - BLOCK
      ?auto_672762 - BLOCK
      ?auto_672763 - BLOCK
      ?auto_672764 - BLOCK
      ?auto_672765 - BLOCK
    )
    :vars
    (
      ?auto_672766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_672764 ) ( ON ?auto_672765 ?auto_672766 ) ( CLEAR ?auto_672765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_672760 ) ( ON ?auto_672761 ?auto_672760 ) ( ON ?auto_672762 ?auto_672761 ) ( ON ?auto_672763 ?auto_672762 ) ( ON ?auto_672764 ?auto_672763 ) ( not ( = ?auto_672760 ?auto_672761 ) ) ( not ( = ?auto_672760 ?auto_672762 ) ) ( not ( = ?auto_672760 ?auto_672763 ) ) ( not ( = ?auto_672760 ?auto_672764 ) ) ( not ( = ?auto_672760 ?auto_672765 ) ) ( not ( = ?auto_672760 ?auto_672766 ) ) ( not ( = ?auto_672761 ?auto_672762 ) ) ( not ( = ?auto_672761 ?auto_672763 ) ) ( not ( = ?auto_672761 ?auto_672764 ) ) ( not ( = ?auto_672761 ?auto_672765 ) ) ( not ( = ?auto_672761 ?auto_672766 ) ) ( not ( = ?auto_672762 ?auto_672763 ) ) ( not ( = ?auto_672762 ?auto_672764 ) ) ( not ( = ?auto_672762 ?auto_672765 ) ) ( not ( = ?auto_672762 ?auto_672766 ) ) ( not ( = ?auto_672763 ?auto_672764 ) ) ( not ( = ?auto_672763 ?auto_672765 ) ) ( not ( = ?auto_672763 ?auto_672766 ) ) ( not ( = ?auto_672764 ?auto_672765 ) ) ( not ( = ?auto_672764 ?auto_672766 ) ) ( not ( = ?auto_672765 ?auto_672766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_672765 ?auto_672766 )
      ( !STACK ?auto_672765 ?auto_672764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_672786 - BLOCK
      ?auto_672787 - BLOCK
      ?auto_672788 - BLOCK
      ?auto_672789 - BLOCK
      ?auto_672790 - BLOCK
      ?auto_672791 - BLOCK
    )
    :vars
    (
      ?auto_672792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672791 ?auto_672792 ) ( ON-TABLE ?auto_672786 ) ( ON ?auto_672787 ?auto_672786 ) ( ON ?auto_672788 ?auto_672787 ) ( ON ?auto_672789 ?auto_672788 ) ( not ( = ?auto_672786 ?auto_672787 ) ) ( not ( = ?auto_672786 ?auto_672788 ) ) ( not ( = ?auto_672786 ?auto_672789 ) ) ( not ( = ?auto_672786 ?auto_672790 ) ) ( not ( = ?auto_672786 ?auto_672791 ) ) ( not ( = ?auto_672786 ?auto_672792 ) ) ( not ( = ?auto_672787 ?auto_672788 ) ) ( not ( = ?auto_672787 ?auto_672789 ) ) ( not ( = ?auto_672787 ?auto_672790 ) ) ( not ( = ?auto_672787 ?auto_672791 ) ) ( not ( = ?auto_672787 ?auto_672792 ) ) ( not ( = ?auto_672788 ?auto_672789 ) ) ( not ( = ?auto_672788 ?auto_672790 ) ) ( not ( = ?auto_672788 ?auto_672791 ) ) ( not ( = ?auto_672788 ?auto_672792 ) ) ( not ( = ?auto_672789 ?auto_672790 ) ) ( not ( = ?auto_672789 ?auto_672791 ) ) ( not ( = ?auto_672789 ?auto_672792 ) ) ( not ( = ?auto_672790 ?auto_672791 ) ) ( not ( = ?auto_672790 ?auto_672792 ) ) ( not ( = ?auto_672791 ?auto_672792 ) ) ( CLEAR ?auto_672789 ) ( ON ?auto_672790 ?auto_672791 ) ( CLEAR ?auto_672790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_672786 ?auto_672787 ?auto_672788 ?auto_672789 ?auto_672790 )
      ( MAKE-6PILE ?auto_672786 ?auto_672787 ?auto_672788 ?auto_672789 ?auto_672790 ?auto_672791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_672812 - BLOCK
      ?auto_672813 - BLOCK
      ?auto_672814 - BLOCK
      ?auto_672815 - BLOCK
      ?auto_672816 - BLOCK
      ?auto_672817 - BLOCK
    )
    :vars
    (
      ?auto_672818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672817 ?auto_672818 ) ( ON-TABLE ?auto_672812 ) ( ON ?auto_672813 ?auto_672812 ) ( ON ?auto_672814 ?auto_672813 ) ( not ( = ?auto_672812 ?auto_672813 ) ) ( not ( = ?auto_672812 ?auto_672814 ) ) ( not ( = ?auto_672812 ?auto_672815 ) ) ( not ( = ?auto_672812 ?auto_672816 ) ) ( not ( = ?auto_672812 ?auto_672817 ) ) ( not ( = ?auto_672812 ?auto_672818 ) ) ( not ( = ?auto_672813 ?auto_672814 ) ) ( not ( = ?auto_672813 ?auto_672815 ) ) ( not ( = ?auto_672813 ?auto_672816 ) ) ( not ( = ?auto_672813 ?auto_672817 ) ) ( not ( = ?auto_672813 ?auto_672818 ) ) ( not ( = ?auto_672814 ?auto_672815 ) ) ( not ( = ?auto_672814 ?auto_672816 ) ) ( not ( = ?auto_672814 ?auto_672817 ) ) ( not ( = ?auto_672814 ?auto_672818 ) ) ( not ( = ?auto_672815 ?auto_672816 ) ) ( not ( = ?auto_672815 ?auto_672817 ) ) ( not ( = ?auto_672815 ?auto_672818 ) ) ( not ( = ?auto_672816 ?auto_672817 ) ) ( not ( = ?auto_672816 ?auto_672818 ) ) ( not ( = ?auto_672817 ?auto_672818 ) ) ( ON ?auto_672816 ?auto_672817 ) ( CLEAR ?auto_672814 ) ( ON ?auto_672815 ?auto_672816 ) ( CLEAR ?auto_672815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_672812 ?auto_672813 ?auto_672814 ?auto_672815 )
      ( MAKE-6PILE ?auto_672812 ?auto_672813 ?auto_672814 ?auto_672815 ?auto_672816 ?auto_672817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_672838 - BLOCK
      ?auto_672839 - BLOCK
      ?auto_672840 - BLOCK
      ?auto_672841 - BLOCK
      ?auto_672842 - BLOCK
      ?auto_672843 - BLOCK
    )
    :vars
    (
      ?auto_672844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672843 ?auto_672844 ) ( ON-TABLE ?auto_672838 ) ( ON ?auto_672839 ?auto_672838 ) ( not ( = ?auto_672838 ?auto_672839 ) ) ( not ( = ?auto_672838 ?auto_672840 ) ) ( not ( = ?auto_672838 ?auto_672841 ) ) ( not ( = ?auto_672838 ?auto_672842 ) ) ( not ( = ?auto_672838 ?auto_672843 ) ) ( not ( = ?auto_672838 ?auto_672844 ) ) ( not ( = ?auto_672839 ?auto_672840 ) ) ( not ( = ?auto_672839 ?auto_672841 ) ) ( not ( = ?auto_672839 ?auto_672842 ) ) ( not ( = ?auto_672839 ?auto_672843 ) ) ( not ( = ?auto_672839 ?auto_672844 ) ) ( not ( = ?auto_672840 ?auto_672841 ) ) ( not ( = ?auto_672840 ?auto_672842 ) ) ( not ( = ?auto_672840 ?auto_672843 ) ) ( not ( = ?auto_672840 ?auto_672844 ) ) ( not ( = ?auto_672841 ?auto_672842 ) ) ( not ( = ?auto_672841 ?auto_672843 ) ) ( not ( = ?auto_672841 ?auto_672844 ) ) ( not ( = ?auto_672842 ?auto_672843 ) ) ( not ( = ?auto_672842 ?auto_672844 ) ) ( not ( = ?auto_672843 ?auto_672844 ) ) ( ON ?auto_672842 ?auto_672843 ) ( ON ?auto_672841 ?auto_672842 ) ( CLEAR ?auto_672839 ) ( ON ?auto_672840 ?auto_672841 ) ( CLEAR ?auto_672840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_672838 ?auto_672839 ?auto_672840 )
      ( MAKE-6PILE ?auto_672838 ?auto_672839 ?auto_672840 ?auto_672841 ?auto_672842 ?auto_672843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_672864 - BLOCK
      ?auto_672865 - BLOCK
      ?auto_672866 - BLOCK
      ?auto_672867 - BLOCK
      ?auto_672868 - BLOCK
      ?auto_672869 - BLOCK
    )
    :vars
    (
      ?auto_672870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672869 ?auto_672870 ) ( ON-TABLE ?auto_672864 ) ( not ( = ?auto_672864 ?auto_672865 ) ) ( not ( = ?auto_672864 ?auto_672866 ) ) ( not ( = ?auto_672864 ?auto_672867 ) ) ( not ( = ?auto_672864 ?auto_672868 ) ) ( not ( = ?auto_672864 ?auto_672869 ) ) ( not ( = ?auto_672864 ?auto_672870 ) ) ( not ( = ?auto_672865 ?auto_672866 ) ) ( not ( = ?auto_672865 ?auto_672867 ) ) ( not ( = ?auto_672865 ?auto_672868 ) ) ( not ( = ?auto_672865 ?auto_672869 ) ) ( not ( = ?auto_672865 ?auto_672870 ) ) ( not ( = ?auto_672866 ?auto_672867 ) ) ( not ( = ?auto_672866 ?auto_672868 ) ) ( not ( = ?auto_672866 ?auto_672869 ) ) ( not ( = ?auto_672866 ?auto_672870 ) ) ( not ( = ?auto_672867 ?auto_672868 ) ) ( not ( = ?auto_672867 ?auto_672869 ) ) ( not ( = ?auto_672867 ?auto_672870 ) ) ( not ( = ?auto_672868 ?auto_672869 ) ) ( not ( = ?auto_672868 ?auto_672870 ) ) ( not ( = ?auto_672869 ?auto_672870 ) ) ( ON ?auto_672868 ?auto_672869 ) ( ON ?auto_672867 ?auto_672868 ) ( ON ?auto_672866 ?auto_672867 ) ( CLEAR ?auto_672864 ) ( ON ?auto_672865 ?auto_672866 ) ( CLEAR ?auto_672865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_672864 ?auto_672865 )
      ( MAKE-6PILE ?auto_672864 ?auto_672865 ?auto_672866 ?auto_672867 ?auto_672868 ?auto_672869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_672890 - BLOCK
      ?auto_672891 - BLOCK
      ?auto_672892 - BLOCK
      ?auto_672893 - BLOCK
      ?auto_672894 - BLOCK
      ?auto_672895 - BLOCK
    )
    :vars
    (
      ?auto_672896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672895 ?auto_672896 ) ( not ( = ?auto_672890 ?auto_672891 ) ) ( not ( = ?auto_672890 ?auto_672892 ) ) ( not ( = ?auto_672890 ?auto_672893 ) ) ( not ( = ?auto_672890 ?auto_672894 ) ) ( not ( = ?auto_672890 ?auto_672895 ) ) ( not ( = ?auto_672890 ?auto_672896 ) ) ( not ( = ?auto_672891 ?auto_672892 ) ) ( not ( = ?auto_672891 ?auto_672893 ) ) ( not ( = ?auto_672891 ?auto_672894 ) ) ( not ( = ?auto_672891 ?auto_672895 ) ) ( not ( = ?auto_672891 ?auto_672896 ) ) ( not ( = ?auto_672892 ?auto_672893 ) ) ( not ( = ?auto_672892 ?auto_672894 ) ) ( not ( = ?auto_672892 ?auto_672895 ) ) ( not ( = ?auto_672892 ?auto_672896 ) ) ( not ( = ?auto_672893 ?auto_672894 ) ) ( not ( = ?auto_672893 ?auto_672895 ) ) ( not ( = ?auto_672893 ?auto_672896 ) ) ( not ( = ?auto_672894 ?auto_672895 ) ) ( not ( = ?auto_672894 ?auto_672896 ) ) ( not ( = ?auto_672895 ?auto_672896 ) ) ( ON ?auto_672894 ?auto_672895 ) ( ON ?auto_672893 ?auto_672894 ) ( ON ?auto_672892 ?auto_672893 ) ( ON ?auto_672891 ?auto_672892 ) ( ON ?auto_672890 ?auto_672891 ) ( CLEAR ?auto_672890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_672890 )
      ( MAKE-6PILE ?auto_672890 ?auto_672891 ?auto_672892 ?auto_672893 ?auto_672894 ?auto_672895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_672917 - BLOCK
      ?auto_672918 - BLOCK
      ?auto_672919 - BLOCK
      ?auto_672920 - BLOCK
      ?auto_672921 - BLOCK
      ?auto_672922 - BLOCK
      ?auto_672923 - BLOCK
    )
    :vars
    (
      ?auto_672924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_672922 ) ( ON ?auto_672923 ?auto_672924 ) ( CLEAR ?auto_672923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_672917 ) ( ON ?auto_672918 ?auto_672917 ) ( ON ?auto_672919 ?auto_672918 ) ( ON ?auto_672920 ?auto_672919 ) ( ON ?auto_672921 ?auto_672920 ) ( ON ?auto_672922 ?auto_672921 ) ( not ( = ?auto_672917 ?auto_672918 ) ) ( not ( = ?auto_672917 ?auto_672919 ) ) ( not ( = ?auto_672917 ?auto_672920 ) ) ( not ( = ?auto_672917 ?auto_672921 ) ) ( not ( = ?auto_672917 ?auto_672922 ) ) ( not ( = ?auto_672917 ?auto_672923 ) ) ( not ( = ?auto_672917 ?auto_672924 ) ) ( not ( = ?auto_672918 ?auto_672919 ) ) ( not ( = ?auto_672918 ?auto_672920 ) ) ( not ( = ?auto_672918 ?auto_672921 ) ) ( not ( = ?auto_672918 ?auto_672922 ) ) ( not ( = ?auto_672918 ?auto_672923 ) ) ( not ( = ?auto_672918 ?auto_672924 ) ) ( not ( = ?auto_672919 ?auto_672920 ) ) ( not ( = ?auto_672919 ?auto_672921 ) ) ( not ( = ?auto_672919 ?auto_672922 ) ) ( not ( = ?auto_672919 ?auto_672923 ) ) ( not ( = ?auto_672919 ?auto_672924 ) ) ( not ( = ?auto_672920 ?auto_672921 ) ) ( not ( = ?auto_672920 ?auto_672922 ) ) ( not ( = ?auto_672920 ?auto_672923 ) ) ( not ( = ?auto_672920 ?auto_672924 ) ) ( not ( = ?auto_672921 ?auto_672922 ) ) ( not ( = ?auto_672921 ?auto_672923 ) ) ( not ( = ?auto_672921 ?auto_672924 ) ) ( not ( = ?auto_672922 ?auto_672923 ) ) ( not ( = ?auto_672922 ?auto_672924 ) ) ( not ( = ?auto_672923 ?auto_672924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_672923 ?auto_672924 )
      ( !STACK ?auto_672923 ?auto_672922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_672947 - BLOCK
      ?auto_672948 - BLOCK
      ?auto_672949 - BLOCK
      ?auto_672950 - BLOCK
      ?auto_672951 - BLOCK
      ?auto_672952 - BLOCK
      ?auto_672953 - BLOCK
    )
    :vars
    (
      ?auto_672954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672953 ?auto_672954 ) ( ON-TABLE ?auto_672947 ) ( ON ?auto_672948 ?auto_672947 ) ( ON ?auto_672949 ?auto_672948 ) ( ON ?auto_672950 ?auto_672949 ) ( ON ?auto_672951 ?auto_672950 ) ( not ( = ?auto_672947 ?auto_672948 ) ) ( not ( = ?auto_672947 ?auto_672949 ) ) ( not ( = ?auto_672947 ?auto_672950 ) ) ( not ( = ?auto_672947 ?auto_672951 ) ) ( not ( = ?auto_672947 ?auto_672952 ) ) ( not ( = ?auto_672947 ?auto_672953 ) ) ( not ( = ?auto_672947 ?auto_672954 ) ) ( not ( = ?auto_672948 ?auto_672949 ) ) ( not ( = ?auto_672948 ?auto_672950 ) ) ( not ( = ?auto_672948 ?auto_672951 ) ) ( not ( = ?auto_672948 ?auto_672952 ) ) ( not ( = ?auto_672948 ?auto_672953 ) ) ( not ( = ?auto_672948 ?auto_672954 ) ) ( not ( = ?auto_672949 ?auto_672950 ) ) ( not ( = ?auto_672949 ?auto_672951 ) ) ( not ( = ?auto_672949 ?auto_672952 ) ) ( not ( = ?auto_672949 ?auto_672953 ) ) ( not ( = ?auto_672949 ?auto_672954 ) ) ( not ( = ?auto_672950 ?auto_672951 ) ) ( not ( = ?auto_672950 ?auto_672952 ) ) ( not ( = ?auto_672950 ?auto_672953 ) ) ( not ( = ?auto_672950 ?auto_672954 ) ) ( not ( = ?auto_672951 ?auto_672952 ) ) ( not ( = ?auto_672951 ?auto_672953 ) ) ( not ( = ?auto_672951 ?auto_672954 ) ) ( not ( = ?auto_672952 ?auto_672953 ) ) ( not ( = ?auto_672952 ?auto_672954 ) ) ( not ( = ?auto_672953 ?auto_672954 ) ) ( CLEAR ?auto_672951 ) ( ON ?auto_672952 ?auto_672953 ) ( CLEAR ?auto_672952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_672947 ?auto_672948 ?auto_672949 ?auto_672950 ?auto_672951 ?auto_672952 )
      ( MAKE-7PILE ?auto_672947 ?auto_672948 ?auto_672949 ?auto_672950 ?auto_672951 ?auto_672952 ?auto_672953 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_672977 - BLOCK
      ?auto_672978 - BLOCK
      ?auto_672979 - BLOCK
      ?auto_672980 - BLOCK
      ?auto_672981 - BLOCK
      ?auto_672982 - BLOCK
      ?auto_672983 - BLOCK
    )
    :vars
    (
      ?auto_672984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672983 ?auto_672984 ) ( ON-TABLE ?auto_672977 ) ( ON ?auto_672978 ?auto_672977 ) ( ON ?auto_672979 ?auto_672978 ) ( ON ?auto_672980 ?auto_672979 ) ( not ( = ?auto_672977 ?auto_672978 ) ) ( not ( = ?auto_672977 ?auto_672979 ) ) ( not ( = ?auto_672977 ?auto_672980 ) ) ( not ( = ?auto_672977 ?auto_672981 ) ) ( not ( = ?auto_672977 ?auto_672982 ) ) ( not ( = ?auto_672977 ?auto_672983 ) ) ( not ( = ?auto_672977 ?auto_672984 ) ) ( not ( = ?auto_672978 ?auto_672979 ) ) ( not ( = ?auto_672978 ?auto_672980 ) ) ( not ( = ?auto_672978 ?auto_672981 ) ) ( not ( = ?auto_672978 ?auto_672982 ) ) ( not ( = ?auto_672978 ?auto_672983 ) ) ( not ( = ?auto_672978 ?auto_672984 ) ) ( not ( = ?auto_672979 ?auto_672980 ) ) ( not ( = ?auto_672979 ?auto_672981 ) ) ( not ( = ?auto_672979 ?auto_672982 ) ) ( not ( = ?auto_672979 ?auto_672983 ) ) ( not ( = ?auto_672979 ?auto_672984 ) ) ( not ( = ?auto_672980 ?auto_672981 ) ) ( not ( = ?auto_672980 ?auto_672982 ) ) ( not ( = ?auto_672980 ?auto_672983 ) ) ( not ( = ?auto_672980 ?auto_672984 ) ) ( not ( = ?auto_672981 ?auto_672982 ) ) ( not ( = ?auto_672981 ?auto_672983 ) ) ( not ( = ?auto_672981 ?auto_672984 ) ) ( not ( = ?auto_672982 ?auto_672983 ) ) ( not ( = ?auto_672982 ?auto_672984 ) ) ( not ( = ?auto_672983 ?auto_672984 ) ) ( ON ?auto_672982 ?auto_672983 ) ( CLEAR ?auto_672980 ) ( ON ?auto_672981 ?auto_672982 ) ( CLEAR ?auto_672981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_672977 ?auto_672978 ?auto_672979 ?auto_672980 ?auto_672981 )
      ( MAKE-7PILE ?auto_672977 ?auto_672978 ?auto_672979 ?auto_672980 ?auto_672981 ?auto_672982 ?auto_672983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_673007 - BLOCK
      ?auto_673008 - BLOCK
      ?auto_673009 - BLOCK
      ?auto_673010 - BLOCK
      ?auto_673011 - BLOCK
      ?auto_673012 - BLOCK
      ?auto_673013 - BLOCK
    )
    :vars
    (
      ?auto_673014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673013 ?auto_673014 ) ( ON-TABLE ?auto_673007 ) ( ON ?auto_673008 ?auto_673007 ) ( ON ?auto_673009 ?auto_673008 ) ( not ( = ?auto_673007 ?auto_673008 ) ) ( not ( = ?auto_673007 ?auto_673009 ) ) ( not ( = ?auto_673007 ?auto_673010 ) ) ( not ( = ?auto_673007 ?auto_673011 ) ) ( not ( = ?auto_673007 ?auto_673012 ) ) ( not ( = ?auto_673007 ?auto_673013 ) ) ( not ( = ?auto_673007 ?auto_673014 ) ) ( not ( = ?auto_673008 ?auto_673009 ) ) ( not ( = ?auto_673008 ?auto_673010 ) ) ( not ( = ?auto_673008 ?auto_673011 ) ) ( not ( = ?auto_673008 ?auto_673012 ) ) ( not ( = ?auto_673008 ?auto_673013 ) ) ( not ( = ?auto_673008 ?auto_673014 ) ) ( not ( = ?auto_673009 ?auto_673010 ) ) ( not ( = ?auto_673009 ?auto_673011 ) ) ( not ( = ?auto_673009 ?auto_673012 ) ) ( not ( = ?auto_673009 ?auto_673013 ) ) ( not ( = ?auto_673009 ?auto_673014 ) ) ( not ( = ?auto_673010 ?auto_673011 ) ) ( not ( = ?auto_673010 ?auto_673012 ) ) ( not ( = ?auto_673010 ?auto_673013 ) ) ( not ( = ?auto_673010 ?auto_673014 ) ) ( not ( = ?auto_673011 ?auto_673012 ) ) ( not ( = ?auto_673011 ?auto_673013 ) ) ( not ( = ?auto_673011 ?auto_673014 ) ) ( not ( = ?auto_673012 ?auto_673013 ) ) ( not ( = ?auto_673012 ?auto_673014 ) ) ( not ( = ?auto_673013 ?auto_673014 ) ) ( ON ?auto_673012 ?auto_673013 ) ( ON ?auto_673011 ?auto_673012 ) ( CLEAR ?auto_673009 ) ( ON ?auto_673010 ?auto_673011 ) ( CLEAR ?auto_673010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_673007 ?auto_673008 ?auto_673009 ?auto_673010 )
      ( MAKE-7PILE ?auto_673007 ?auto_673008 ?auto_673009 ?auto_673010 ?auto_673011 ?auto_673012 ?auto_673013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_673037 - BLOCK
      ?auto_673038 - BLOCK
      ?auto_673039 - BLOCK
      ?auto_673040 - BLOCK
      ?auto_673041 - BLOCK
      ?auto_673042 - BLOCK
      ?auto_673043 - BLOCK
    )
    :vars
    (
      ?auto_673044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673043 ?auto_673044 ) ( ON-TABLE ?auto_673037 ) ( ON ?auto_673038 ?auto_673037 ) ( not ( = ?auto_673037 ?auto_673038 ) ) ( not ( = ?auto_673037 ?auto_673039 ) ) ( not ( = ?auto_673037 ?auto_673040 ) ) ( not ( = ?auto_673037 ?auto_673041 ) ) ( not ( = ?auto_673037 ?auto_673042 ) ) ( not ( = ?auto_673037 ?auto_673043 ) ) ( not ( = ?auto_673037 ?auto_673044 ) ) ( not ( = ?auto_673038 ?auto_673039 ) ) ( not ( = ?auto_673038 ?auto_673040 ) ) ( not ( = ?auto_673038 ?auto_673041 ) ) ( not ( = ?auto_673038 ?auto_673042 ) ) ( not ( = ?auto_673038 ?auto_673043 ) ) ( not ( = ?auto_673038 ?auto_673044 ) ) ( not ( = ?auto_673039 ?auto_673040 ) ) ( not ( = ?auto_673039 ?auto_673041 ) ) ( not ( = ?auto_673039 ?auto_673042 ) ) ( not ( = ?auto_673039 ?auto_673043 ) ) ( not ( = ?auto_673039 ?auto_673044 ) ) ( not ( = ?auto_673040 ?auto_673041 ) ) ( not ( = ?auto_673040 ?auto_673042 ) ) ( not ( = ?auto_673040 ?auto_673043 ) ) ( not ( = ?auto_673040 ?auto_673044 ) ) ( not ( = ?auto_673041 ?auto_673042 ) ) ( not ( = ?auto_673041 ?auto_673043 ) ) ( not ( = ?auto_673041 ?auto_673044 ) ) ( not ( = ?auto_673042 ?auto_673043 ) ) ( not ( = ?auto_673042 ?auto_673044 ) ) ( not ( = ?auto_673043 ?auto_673044 ) ) ( ON ?auto_673042 ?auto_673043 ) ( ON ?auto_673041 ?auto_673042 ) ( ON ?auto_673040 ?auto_673041 ) ( CLEAR ?auto_673038 ) ( ON ?auto_673039 ?auto_673040 ) ( CLEAR ?auto_673039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_673037 ?auto_673038 ?auto_673039 )
      ( MAKE-7PILE ?auto_673037 ?auto_673038 ?auto_673039 ?auto_673040 ?auto_673041 ?auto_673042 ?auto_673043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_673067 - BLOCK
      ?auto_673068 - BLOCK
      ?auto_673069 - BLOCK
      ?auto_673070 - BLOCK
      ?auto_673071 - BLOCK
      ?auto_673072 - BLOCK
      ?auto_673073 - BLOCK
    )
    :vars
    (
      ?auto_673074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673073 ?auto_673074 ) ( ON-TABLE ?auto_673067 ) ( not ( = ?auto_673067 ?auto_673068 ) ) ( not ( = ?auto_673067 ?auto_673069 ) ) ( not ( = ?auto_673067 ?auto_673070 ) ) ( not ( = ?auto_673067 ?auto_673071 ) ) ( not ( = ?auto_673067 ?auto_673072 ) ) ( not ( = ?auto_673067 ?auto_673073 ) ) ( not ( = ?auto_673067 ?auto_673074 ) ) ( not ( = ?auto_673068 ?auto_673069 ) ) ( not ( = ?auto_673068 ?auto_673070 ) ) ( not ( = ?auto_673068 ?auto_673071 ) ) ( not ( = ?auto_673068 ?auto_673072 ) ) ( not ( = ?auto_673068 ?auto_673073 ) ) ( not ( = ?auto_673068 ?auto_673074 ) ) ( not ( = ?auto_673069 ?auto_673070 ) ) ( not ( = ?auto_673069 ?auto_673071 ) ) ( not ( = ?auto_673069 ?auto_673072 ) ) ( not ( = ?auto_673069 ?auto_673073 ) ) ( not ( = ?auto_673069 ?auto_673074 ) ) ( not ( = ?auto_673070 ?auto_673071 ) ) ( not ( = ?auto_673070 ?auto_673072 ) ) ( not ( = ?auto_673070 ?auto_673073 ) ) ( not ( = ?auto_673070 ?auto_673074 ) ) ( not ( = ?auto_673071 ?auto_673072 ) ) ( not ( = ?auto_673071 ?auto_673073 ) ) ( not ( = ?auto_673071 ?auto_673074 ) ) ( not ( = ?auto_673072 ?auto_673073 ) ) ( not ( = ?auto_673072 ?auto_673074 ) ) ( not ( = ?auto_673073 ?auto_673074 ) ) ( ON ?auto_673072 ?auto_673073 ) ( ON ?auto_673071 ?auto_673072 ) ( ON ?auto_673070 ?auto_673071 ) ( ON ?auto_673069 ?auto_673070 ) ( CLEAR ?auto_673067 ) ( ON ?auto_673068 ?auto_673069 ) ( CLEAR ?auto_673068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_673067 ?auto_673068 )
      ( MAKE-7PILE ?auto_673067 ?auto_673068 ?auto_673069 ?auto_673070 ?auto_673071 ?auto_673072 ?auto_673073 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_673097 - BLOCK
      ?auto_673098 - BLOCK
      ?auto_673099 - BLOCK
      ?auto_673100 - BLOCK
      ?auto_673101 - BLOCK
      ?auto_673102 - BLOCK
      ?auto_673103 - BLOCK
    )
    :vars
    (
      ?auto_673104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673103 ?auto_673104 ) ( not ( = ?auto_673097 ?auto_673098 ) ) ( not ( = ?auto_673097 ?auto_673099 ) ) ( not ( = ?auto_673097 ?auto_673100 ) ) ( not ( = ?auto_673097 ?auto_673101 ) ) ( not ( = ?auto_673097 ?auto_673102 ) ) ( not ( = ?auto_673097 ?auto_673103 ) ) ( not ( = ?auto_673097 ?auto_673104 ) ) ( not ( = ?auto_673098 ?auto_673099 ) ) ( not ( = ?auto_673098 ?auto_673100 ) ) ( not ( = ?auto_673098 ?auto_673101 ) ) ( not ( = ?auto_673098 ?auto_673102 ) ) ( not ( = ?auto_673098 ?auto_673103 ) ) ( not ( = ?auto_673098 ?auto_673104 ) ) ( not ( = ?auto_673099 ?auto_673100 ) ) ( not ( = ?auto_673099 ?auto_673101 ) ) ( not ( = ?auto_673099 ?auto_673102 ) ) ( not ( = ?auto_673099 ?auto_673103 ) ) ( not ( = ?auto_673099 ?auto_673104 ) ) ( not ( = ?auto_673100 ?auto_673101 ) ) ( not ( = ?auto_673100 ?auto_673102 ) ) ( not ( = ?auto_673100 ?auto_673103 ) ) ( not ( = ?auto_673100 ?auto_673104 ) ) ( not ( = ?auto_673101 ?auto_673102 ) ) ( not ( = ?auto_673101 ?auto_673103 ) ) ( not ( = ?auto_673101 ?auto_673104 ) ) ( not ( = ?auto_673102 ?auto_673103 ) ) ( not ( = ?auto_673102 ?auto_673104 ) ) ( not ( = ?auto_673103 ?auto_673104 ) ) ( ON ?auto_673102 ?auto_673103 ) ( ON ?auto_673101 ?auto_673102 ) ( ON ?auto_673100 ?auto_673101 ) ( ON ?auto_673099 ?auto_673100 ) ( ON ?auto_673098 ?auto_673099 ) ( ON ?auto_673097 ?auto_673098 ) ( CLEAR ?auto_673097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_673097 )
      ( MAKE-7PILE ?auto_673097 ?auto_673098 ?auto_673099 ?auto_673100 ?auto_673101 ?auto_673102 ?auto_673103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673128 - BLOCK
      ?auto_673129 - BLOCK
      ?auto_673130 - BLOCK
      ?auto_673131 - BLOCK
      ?auto_673132 - BLOCK
      ?auto_673133 - BLOCK
      ?auto_673134 - BLOCK
      ?auto_673135 - BLOCK
    )
    :vars
    (
      ?auto_673136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_673134 ) ( ON ?auto_673135 ?auto_673136 ) ( CLEAR ?auto_673135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_673128 ) ( ON ?auto_673129 ?auto_673128 ) ( ON ?auto_673130 ?auto_673129 ) ( ON ?auto_673131 ?auto_673130 ) ( ON ?auto_673132 ?auto_673131 ) ( ON ?auto_673133 ?auto_673132 ) ( ON ?auto_673134 ?auto_673133 ) ( not ( = ?auto_673128 ?auto_673129 ) ) ( not ( = ?auto_673128 ?auto_673130 ) ) ( not ( = ?auto_673128 ?auto_673131 ) ) ( not ( = ?auto_673128 ?auto_673132 ) ) ( not ( = ?auto_673128 ?auto_673133 ) ) ( not ( = ?auto_673128 ?auto_673134 ) ) ( not ( = ?auto_673128 ?auto_673135 ) ) ( not ( = ?auto_673128 ?auto_673136 ) ) ( not ( = ?auto_673129 ?auto_673130 ) ) ( not ( = ?auto_673129 ?auto_673131 ) ) ( not ( = ?auto_673129 ?auto_673132 ) ) ( not ( = ?auto_673129 ?auto_673133 ) ) ( not ( = ?auto_673129 ?auto_673134 ) ) ( not ( = ?auto_673129 ?auto_673135 ) ) ( not ( = ?auto_673129 ?auto_673136 ) ) ( not ( = ?auto_673130 ?auto_673131 ) ) ( not ( = ?auto_673130 ?auto_673132 ) ) ( not ( = ?auto_673130 ?auto_673133 ) ) ( not ( = ?auto_673130 ?auto_673134 ) ) ( not ( = ?auto_673130 ?auto_673135 ) ) ( not ( = ?auto_673130 ?auto_673136 ) ) ( not ( = ?auto_673131 ?auto_673132 ) ) ( not ( = ?auto_673131 ?auto_673133 ) ) ( not ( = ?auto_673131 ?auto_673134 ) ) ( not ( = ?auto_673131 ?auto_673135 ) ) ( not ( = ?auto_673131 ?auto_673136 ) ) ( not ( = ?auto_673132 ?auto_673133 ) ) ( not ( = ?auto_673132 ?auto_673134 ) ) ( not ( = ?auto_673132 ?auto_673135 ) ) ( not ( = ?auto_673132 ?auto_673136 ) ) ( not ( = ?auto_673133 ?auto_673134 ) ) ( not ( = ?auto_673133 ?auto_673135 ) ) ( not ( = ?auto_673133 ?auto_673136 ) ) ( not ( = ?auto_673134 ?auto_673135 ) ) ( not ( = ?auto_673134 ?auto_673136 ) ) ( not ( = ?auto_673135 ?auto_673136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_673135 ?auto_673136 )
      ( !STACK ?auto_673135 ?auto_673134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673162 - BLOCK
      ?auto_673163 - BLOCK
      ?auto_673164 - BLOCK
      ?auto_673165 - BLOCK
      ?auto_673166 - BLOCK
      ?auto_673167 - BLOCK
      ?auto_673168 - BLOCK
      ?auto_673169 - BLOCK
    )
    :vars
    (
      ?auto_673170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673169 ?auto_673170 ) ( ON-TABLE ?auto_673162 ) ( ON ?auto_673163 ?auto_673162 ) ( ON ?auto_673164 ?auto_673163 ) ( ON ?auto_673165 ?auto_673164 ) ( ON ?auto_673166 ?auto_673165 ) ( ON ?auto_673167 ?auto_673166 ) ( not ( = ?auto_673162 ?auto_673163 ) ) ( not ( = ?auto_673162 ?auto_673164 ) ) ( not ( = ?auto_673162 ?auto_673165 ) ) ( not ( = ?auto_673162 ?auto_673166 ) ) ( not ( = ?auto_673162 ?auto_673167 ) ) ( not ( = ?auto_673162 ?auto_673168 ) ) ( not ( = ?auto_673162 ?auto_673169 ) ) ( not ( = ?auto_673162 ?auto_673170 ) ) ( not ( = ?auto_673163 ?auto_673164 ) ) ( not ( = ?auto_673163 ?auto_673165 ) ) ( not ( = ?auto_673163 ?auto_673166 ) ) ( not ( = ?auto_673163 ?auto_673167 ) ) ( not ( = ?auto_673163 ?auto_673168 ) ) ( not ( = ?auto_673163 ?auto_673169 ) ) ( not ( = ?auto_673163 ?auto_673170 ) ) ( not ( = ?auto_673164 ?auto_673165 ) ) ( not ( = ?auto_673164 ?auto_673166 ) ) ( not ( = ?auto_673164 ?auto_673167 ) ) ( not ( = ?auto_673164 ?auto_673168 ) ) ( not ( = ?auto_673164 ?auto_673169 ) ) ( not ( = ?auto_673164 ?auto_673170 ) ) ( not ( = ?auto_673165 ?auto_673166 ) ) ( not ( = ?auto_673165 ?auto_673167 ) ) ( not ( = ?auto_673165 ?auto_673168 ) ) ( not ( = ?auto_673165 ?auto_673169 ) ) ( not ( = ?auto_673165 ?auto_673170 ) ) ( not ( = ?auto_673166 ?auto_673167 ) ) ( not ( = ?auto_673166 ?auto_673168 ) ) ( not ( = ?auto_673166 ?auto_673169 ) ) ( not ( = ?auto_673166 ?auto_673170 ) ) ( not ( = ?auto_673167 ?auto_673168 ) ) ( not ( = ?auto_673167 ?auto_673169 ) ) ( not ( = ?auto_673167 ?auto_673170 ) ) ( not ( = ?auto_673168 ?auto_673169 ) ) ( not ( = ?auto_673168 ?auto_673170 ) ) ( not ( = ?auto_673169 ?auto_673170 ) ) ( CLEAR ?auto_673167 ) ( ON ?auto_673168 ?auto_673169 ) ( CLEAR ?auto_673168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_673162 ?auto_673163 ?auto_673164 ?auto_673165 ?auto_673166 ?auto_673167 ?auto_673168 )
      ( MAKE-8PILE ?auto_673162 ?auto_673163 ?auto_673164 ?auto_673165 ?auto_673166 ?auto_673167 ?auto_673168 ?auto_673169 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673196 - BLOCK
      ?auto_673197 - BLOCK
      ?auto_673198 - BLOCK
      ?auto_673199 - BLOCK
      ?auto_673200 - BLOCK
      ?auto_673201 - BLOCK
      ?auto_673202 - BLOCK
      ?auto_673203 - BLOCK
    )
    :vars
    (
      ?auto_673204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673203 ?auto_673204 ) ( ON-TABLE ?auto_673196 ) ( ON ?auto_673197 ?auto_673196 ) ( ON ?auto_673198 ?auto_673197 ) ( ON ?auto_673199 ?auto_673198 ) ( ON ?auto_673200 ?auto_673199 ) ( not ( = ?auto_673196 ?auto_673197 ) ) ( not ( = ?auto_673196 ?auto_673198 ) ) ( not ( = ?auto_673196 ?auto_673199 ) ) ( not ( = ?auto_673196 ?auto_673200 ) ) ( not ( = ?auto_673196 ?auto_673201 ) ) ( not ( = ?auto_673196 ?auto_673202 ) ) ( not ( = ?auto_673196 ?auto_673203 ) ) ( not ( = ?auto_673196 ?auto_673204 ) ) ( not ( = ?auto_673197 ?auto_673198 ) ) ( not ( = ?auto_673197 ?auto_673199 ) ) ( not ( = ?auto_673197 ?auto_673200 ) ) ( not ( = ?auto_673197 ?auto_673201 ) ) ( not ( = ?auto_673197 ?auto_673202 ) ) ( not ( = ?auto_673197 ?auto_673203 ) ) ( not ( = ?auto_673197 ?auto_673204 ) ) ( not ( = ?auto_673198 ?auto_673199 ) ) ( not ( = ?auto_673198 ?auto_673200 ) ) ( not ( = ?auto_673198 ?auto_673201 ) ) ( not ( = ?auto_673198 ?auto_673202 ) ) ( not ( = ?auto_673198 ?auto_673203 ) ) ( not ( = ?auto_673198 ?auto_673204 ) ) ( not ( = ?auto_673199 ?auto_673200 ) ) ( not ( = ?auto_673199 ?auto_673201 ) ) ( not ( = ?auto_673199 ?auto_673202 ) ) ( not ( = ?auto_673199 ?auto_673203 ) ) ( not ( = ?auto_673199 ?auto_673204 ) ) ( not ( = ?auto_673200 ?auto_673201 ) ) ( not ( = ?auto_673200 ?auto_673202 ) ) ( not ( = ?auto_673200 ?auto_673203 ) ) ( not ( = ?auto_673200 ?auto_673204 ) ) ( not ( = ?auto_673201 ?auto_673202 ) ) ( not ( = ?auto_673201 ?auto_673203 ) ) ( not ( = ?auto_673201 ?auto_673204 ) ) ( not ( = ?auto_673202 ?auto_673203 ) ) ( not ( = ?auto_673202 ?auto_673204 ) ) ( not ( = ?auto_673203 ?auto_673204 ) ) ( ON ?auto_673202 ?auto_673203 ) ( CLEAR ?auto_673200 ) ( ON ?auto_673201 ?auto_673202 ) ( CLEAR ?auto_673201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_673196 ?auto_673197 ?auto_673198 ?auto_673199 ?auto_673200 ?auto_673201 )
      ( MAKE-8PILE ?auto_673196 ?auto_673197 ?auto_673198 ?auto_673199 ?auto_673200 ?auto_673201 ?auto_673202 ?auto_673203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673230 - BLOCK
      ?auto_673231 - BLOCK
      ?auto_673232 - BLOCK
      ?auto_673233 - BLOCK
      ?auto_673234 - BLOCK
      ?auto_673235 - BLOCK
      ?auto_673236 - BLOCK
      ?auto_673237 - BLOCK
    )
    :vars
    (
      ?auto_673238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673237 ?auto_673238 ) ( ON-TABLE ?auto_673230 ) ( ON ?auto_673231 ?auto_673230 ) ( ON ?auto_673232 ?auto_673231 ) ( ON ?auto_673233 ?auto_673232 ) ( not ( = ?auto_673230 ?auto_673231 ) ) ( not ( = ?auto_673230 ?auto_673232 ) ) ( not ( = ?auto_673230 ?auto_673233 ) ) ( not ( = ?auto_673230 ?auto_673234 ) ) ( not ( = ?auto_673230 ?auto_673235 ) ) ( not ( = ?auto_673230 ?auto_673236 ) ) ( not ( = ?auto_673230 ?auto_673237 ) ) ( not ( = ?auto_673230 ?auto_673238 ) ) ( not ( = ?auto_673231 ?auto_673232 ) ) ( not ( = ?auto_673231 ?auto_673233 ) ) ( not ( = ?auto_673231 ?auto_673234 ) ) ( not ( = ?auto_673231 ?auto_673235 ) ) ( not ( = ?auto_673231 ?auto_673236 ) ) ( not ( = ?auto_673231 ?auto_673237 ) ) ( not ( = ?auto_673231 ?auto_673238 ) ) ( not ( = ?auto_673232 ?auto_673233 ) ) ( not ( = ?auto_673232 ?auto_673234 ) ) ( not ( = ?auto_673232 ?auto_673235 ) ) ( not ( = ?auto_673232 ?auto_673236 ) ) ( not ( = ?auto_673232 ?auto_673237 ) ) ( not ( = ?auto_673232 ?auto_673238 ) ) ( not ( = ?auto_673233 ?auto_673234 ) ) ( not ( = ?auto_673233 ?auto_673235 ) ) ( not ( = ?auto_673233 ?auto_673236 ) ) ( not ( = ?auto_673233 ?auto_673237 ) ) ( not ( = ?auto_673233 ?auto_673238 ) ) ( not ( = ?auto_673234 ?auto_673235 ) ) ( not ( = ?auto_673234 ?auto_673236 ) ) ( not ( = ?auto_673234 ?auto_673237 ) ) ( not ( = ?auto_673234 ?auto_673238 ) ) ( not ( = ?auto_673235 ?auto_673236 ) ) ( not ( = ?auto_673235 ?auto_673237 ) ) ( not ( = ?auto_673235 ?auto_673238 ) ) ( not ( = ?auto_673236 ?auto_673237 ) ) ( not ( = ?auto_673236 ?auto_673238 ) ) ( not ( = ?auto_673237 ?auto_673238 ) ) ( ON ?auto_673236 ?auto_673237 ) ( ON ?auto_673235 ?auto_673236 ) ( CLEAR ?auto_673233 ) ( ON ?auto_673234 ?auto_673235 ) ( CLEAR ?auto_673234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_673230 ?auto_673231 ?auto_673232 ?auto_673233 ?auto_673234 )
      ( MAKE-8PILE ?auto_673230 ?auto_673231 ?auto_673232 ?auto_673233 ?auto_673234 ?auto_673235 ?auto_673236 ?auto_673237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673264 - BLOCK
      ?auto_673265 - BLOCK
      ?auto_673266 - BLOCK
      ?auto_673267 - BLOCK
      ?auto_673268 - BLOCK
      ?auto_673269 - BLOCK
      ?auto_673270 - BLOCK
      ?auto_673271 - BLOCK
    )
    :vars
    (
      ?auto_673272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673271 ?auto_673272 ) ( ON-TABLE ?auto_673264 ) ( ON ?auto_673265 ?auto_673264 ) ( ON ?auto_673266 ?auto_673265 ) ( not ( = ?auto_673264 ?auto_673265 ) ) ( not ( = ?auto_673264 ?auto_673266 ) ) ( not ( = ?auto_673264 ?auto_673267 ) ) ( not ( = ?auto_673264 ?auto_673268 ) ) ( not ( = ?auto_673264 ?auto_673269 ) ) ( not ( = ?auto_673264 ?auto_673270 ) ) ( not ( = ?auto_673264 ?auto_673271 ) ) ( not ( = ?auto_673264 ?auto_673272 ) ) ( not ( = ?auto_673265 ?auto_673266 ) ) ( not ( = ?auto_673265 ?auto_673267 ) ) ( not ( = ?auto_673265 ?auto_673268 ) ) ( not ( = ?auto_673265 ?auto_673269 ) ) ( not ( = ?auto_673265 ?auto_673270 ) ) ( not ( = ?auto_673265 ?auto_673271 ) ) ( not ( = ?auto_673265 ?auto_673272 ) ) ( not ( = ?auto_673266 ?auto_673267 ) ) ( not ( = ?auto_673266 ?auto_673268 ) ) ( not ( = ?auto_673266 ?auto_673269 ) ) ( not ( = ?auto_673266 ?auto_673270 ) ) ( not ( = ?auto_673266 ?auto_673271 ) ) ( not ( = ?auto_673266 ?auto_673272 ) ) ( not ( = ?auto_673267 ?auto_673268 ) ) ( not ( = ?auto_673267 ?auto_673269 ) ) ( not ( = ?auto_673267 ?auto_673270 ) ) ( not ( = ?auto_673267 ?auto_673271 ) ) ( not ( = ?auto_673267 ?auto_673272 ) ) ( not ( = ?auto_673268 ?auto_673269 ) ) ( not ( = ?auto_673268 ?auto_673270 ) ) ( not ( = ?auto_673268 ?auto_673271 ) ) ( not ( = ?auto_673268 ?auto_673272 ) ) ( not ( = ?auto_673269 ?auto_673270 ) ) ( not ( = ?auto_673269 ?auto_673271 ) ) ( not ( = ?auto_673269 ?auto_673272 ) ) ( not ( = ?auto_673270 ?auto_673271 ) ) ( not ( = ?auto_673270 ?auto_673272 ) ) ( not ( = ?auto_673271 ?auto_673272 ) ) ( ON ?auto_673270 ?auto_673271 ) ( ON ?auto_673269 ?auto_673270 ) ( ON ?auto_673268 ?auto_673269 ) ( CLEAR ?auto_673266 ) ( ON ?auto_673267 ?auto_673268 ) ( CLEAR ?auto_673267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_673264 ?auto_673265 ?auto_673266 ?auto_673267 )
      ( MAKE-8PILE ?auto_673264 ?auto_673265 ?auto_673266 ?auto_673267 ?auto_673268 ?auto_673269 ?auto_673270 ?auto_673271 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673298 - BLOCK
      ?auto_673299 - BLOCK
      ?auto_673300 - BLOCK
      ?auto_673301 - BLOCK
      ?auto_673302 - BLOCK
      ?auto_673303 - BLOCK
      ?auto_673304 - BLOCK
      ?auto_673305 - BLOCK
    )
    :vars
    (
      ?auto_673306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673305 ?auto_673306 ) ( ON-TABLE ?auto_673298 ) ( ON ?auto_673299 ?auto_673298 ) ( not ( = ?auto_673298 ?auto_673299 ) ) ( not ( = ?auto_673298 ?auto_673300 ) ) ( not ( = ?auto_673298 ?auto_673301 ) ) ( not ( = ?auto_673298 ?auto_673302 ) ) ( not ( = ?auto_673298 ?auto_673303 ) ) ( not ( = ?auto_673298 ?auto_673304 ) ) ( not ( = ?auto_673298 ?auto_673305 ) ) ( not ( = ?auto_673298 ?auto_673306 ) ) ( not ( = ?auto_673299 ?auto_673300 ) ) ( not ( = ?auto_673299 ?auto_673301 ) ) ( not ( = ?auto_673299 ?auto_673302 ) ) ( not ( = ?auto_673299 ?auto_673303 ) ) ( not ( = ?auto_673299 ?auto_673304 ) ) ( not ( = ?auto_673299 ?auto_673305 ) ) ( not ( = ?auto_673299 ?auto_673306 ) ) ( not ( = ?auto_673300 ?auto_673301 ) ) ( not ( = ?auto_673300 ?auto_673302 ) ) ( not ( = ?auto_673300 ?auto_673303 ) ) ( not ( = ?auto_673300 ?auto_673304 ) ) ( not ( = ?auto_673300 ?auto_673305 ) ) ( not ( = ?auto_673300 ?auto_673306 ) ) ( not ( = ?auto_673301 ?auto_673302 ) ) ( not ( = ?auto_673301 ?auto_673303 ) ) ( not ( = ?auto_673301 ?auto_673304 ) ) ( not ( = ?auto_673301 ?auto_673305 ) ) ( not ( = ?auto_673301 ?auto_673306 ) ) ( not ( = ?auto_673302 ?auto_673303 ) ) ( not ( = ?auto_673302 ?auto_673304 ) ) ( not ( = ?auto_673302 ?auto_673305 ) ) ( not ( = ?auto_673302 ?auto_673306 ) ) ( not ( = ?auto_673303 ?auto_673304 ) ) ( not ( = ?auto_673303 ?auto_673305 ) ) ( not ( = ?auto_673303 ?auto_673306 ) ) ( not ( = ?auto_673304 ?auto_673305 ) ) ( not ( = ?auto_673304 ?auto_673306 ) ) ( not ( = ?auto_673305 ?auto_673306 ) ) ( ON ?auto_673304 ?auto_673305 ) ( ON ?auto_673303 ?auto_673304 ) ( ON ?auto_673302 ?auto_673303 ) ( ON ?auto_673301 ?auto_673302 ) ( CLEAR ?auto_673299 ) ( ON ?auto_673300 ?auto_673301 ) ( CLEAR ?auto_673300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_673298 ?auto_673299 ?auto_673300 )
      ( MAKE-8PILE ?auto_673298 ?auto_673299 ?auto_673300 ?auto_673301 ?auto_673302 ?auto_673303 ?auto_673304 ?auto_673305 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673332 - BLOCK
      ?auto_673333 - BLOCK
      ?auto_673334 - BLOCK
      ?auto_673335 - BLOCK
      ?auto_673336 - BLOCK
      ?auto_673337 - BLOCK
      ?auto_673338 - BLOCK
      ?auto_673339 - BLOCK
    )
    :vars
    (
      ?auto_673340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673339 ?auto_673340 ) ( ON-TABLE ?auto_673332 ) ( not ( = ?auto_673332 ?auto_673333 ) ) ( not ( = ?auto_673332 ?auto_673334 ) ) ( not ( = ?auto_673332 ?auto_673335 ) ) ( not ( = ?auto_673332 ?auto_673336 ) ) ( not ( = ?auto_673332 ?auto_673337 ) ) ( not ( = ?auto_673332 ?auto_673338 ) ) ( not ( = ?auto_673332 ?auto_673339 ) ) ( not ( = ?auto_673332 ?auto_673340 ) ) ( not ( = ?auto_673333 ?auto_673334 ) ) ( not ( = ?auto_673333 ?auto_673335 ) ) ( not ( = ?auto_673333 ?auto_673336 ) ) ( not ( = ?auto_673333 ?auto_673337 ) ) ( not ( = ?auto_673333 ?auto_673338 ) ) ( not ( = ?auto_673333 ?auto_673339 ) ) ( not ( = ?auto_673333 ?auto_673340 ) ) ( not ( = ?auto_673334 ?auto_673335 ) ) ( not ( = ?auto_673334 ?auto_673336 ) ) ( not ( = ?auto_673334 ?auto_673337 ) ) ( not ( = ?auto_673334 ?auto_673338 ) ) ( not ( = ?auto_673334 ?auto_673339 ) ) ( not ( = ?auto_673334 ?auto_673340 ) ) ( not ( = ?auto_673335 ?auto_673336 ) ) ( not ( = ?auto_673335 ?auto_673337 ) ) ( not ( = ?auto_673335 ?auto_673338 ) ) ( not ( = ?auto_673335 ?auto_673339 ) ) ( not ( = ?auto_673335 ?auto_673340 ) ) ( not ( = ?auto_673336 ?auto_673337 ) ) ( not ( = ?auto_673336 ?auto_673338 ) ) ( not ( = ?auto_673336 ?auto_673339 ) ) ( not ( = ?auto_673336 ?auto_673340 ) ) ( not ( = ?auto_673337 ?auto_673338 ) ) ( not ( = ?auto_673337 ?auto_673339 ) ) ( not ( = ?auto_673337 ?auto_673340 ) ) ( not ( = ?auto_673338 ?auto_673339 ) ) ( not ( = ?auto_673338 ?auto_673340 ) ) ( not ( = ?auto_673339 ?auto_673340 ) ) ( ON ?auto_673338 ?auto_673339 ) ( ON ?auto_673337 ?auto_673338 ) ( ON ?auto_673336 ?auto_673337 ) ( ON ?auto_673335 ?auto_673336 ) ( ON ?auto_673334 ?auto_673335 ) ( CLEAR ?auto_673332 ) ( ON ?auto_673333 ?auto_673334 ) ( CLEAR ?auto_673333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_673332 ?auto_673333 )
      ( MAKE-8PILE ?auto_673332 ?auto_673333 ?auto_673334 ?auto_673335 ?auto_673336 ?auto_673337 ?auto_673338 ?auto_673339 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_673366 - BLOCK
      ?auto_673367 - BLOCK
      ?auto_673368 - BLOCK
      ?auto_673369 - BLOCK
      ?auto_673370 - BLOCK
      ?auto_673371 - BLOCK
      ?auto_673372 - BLOCK
      ?auto_673373 - BLOCK
    )
    :vars
    (
      ?auto_673374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673373 ?auto_673374 ) ( not ( = ?auto_673366 ?auto_673367 ) ) ( not ( = ?auto_673366 ?auto_673368 ) ) ( not ( = ?auto_673366 ?auto_673369 ) ) ( not ( = ?auto_673366 ?auto_673370 ) ) ( not ( = ?auto_673366 ?auto_673371 ) ) ( not ( = ?auto_673366 ?auto_673372 ) ) ( not ( = ?auto_673366 ?auto_673373 ) ) ( not ( = ?auto_673366 ?auto_673374 ) ) ( not ( = ?auto_673367 ?auto_673368 ) ) ( not ( = ?auto_673367 ?auto_673369 ) ) ( not ( = ?auto_673367 ?auto_673370 ) ) ( not ( = ?auto_673367 ?auto_673371 ) ) ( not ( = ?auto_673367 ?auto_673372 ) ) ( not ( = ?auto_673367 ?auto_673373 ) ) ( not ( = ?auto_673367 ?auto_673374 ) ) ( not ( = ?auto_673368 ?auto_673369 ) ) ( not ( = ?auto_673368 ?auto_673370 ) ) ( not ( = ?auto_673368 ?auto_673371 ) ) ( not ( = ?auto_673368 ?auto_673372 ) ) ( not ( = ?auto_673368 ?auto_673373 ) ) ( not ( = ?auto_673368 ?auto_673374 ) ) ( not ( = ?auto_673369 ?auto_673370 ) ) ( not ( = ?auto_673369 ?auto_673371 ) ) ( not ( = ?auto_673369 ?auto_673372 ) ) ( not ( = ?auto_673369 ?auto_673373 ) ) ( not ( = ?auto_673369 ?auto_673374 ) ) ( not ( = ?auto_673370 ?auto_673371 ) ) ( not ( = ?auto_673370 ?auto_673372 ) ) ( not ( = ?auto_673370 ?auto_673373 ) ) ( not ( = ?auto_673370 ?auto_673374 ) ) ( not ( = ?auto_673371 ?auto_673372 ) ) ( not ( = ?auto_673371 ?auto_673373 ) ) ( not ( = ?auto_673371 ?auto_673374 ) ) ( not ( = ?auto_673372 ?auto_673373 ) ) ( not ( = ?auto_673372 ?auto_673374 ) ) ( not ( = ?auto_673373 ?auto_673374 ) ) ( ON ?auto_673372 ?auto_673373 ) ( ON ?auto_673371 ?auto_673372 ) ( ON ?auto_673370 ?auto_673371 ) ( ON ?auto_673369 ?auto_673370 ) ( ON ?auto_673368 ?auto_673369 ) ( ON ?auto_673367 ?auto_673368 ) ( ON ?auto_673366 ?auto_673367 ) ( CLEAR ?auto_673366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_673366 )
      ( MAKE-8PILE ?auto_673366 ?auto_673367 ?auto_673368 ?auto_673369 ?auto_673370 ?auto_673371 ?auto_673372 ?auto_673373 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673401 - BLOCK
      ?auto_673402 - BLOCK
      ?auto_673403 - BLOCK
      ?auto_673404 - BLOCK
      ?auto_673405 - BLOCK
      ?auto_673406 - BLOCK
      ?auto_673407 - BLOCK
      ?auto_673408 - BLOCK
      ?auto_673409 - BLOCK
    )
    :vars
    (
      ?auto_673410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_673408 ) ( ON ?auto_673409 ?auto_673410 ) ( CLEAR ?auto_673409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_673401 ) ( ON ?auto_673402 ?auto_673401 ) ( ON ?auto_673403 ?auto_673402 ) ( ON ?auto_673404 ?auto_673403 ) ( ON ?auto_673405 ?auto_673404 ) ( ON ?auto_673406 ?auto_673405 ) ( ON ?auto_673407 ?auto_673406 ) ( ON ?auto_673408 ?auto_673407 ) ( not ( = ?auto_673401 ?auto_673402 ) ) ( not ( = ?auto_673401 ?auto_673403 ) ) ( not ( = ?auto_673401 ?auto_673404 ) ) ( not ( = ?auto_673401 ?auto_673405 ) ) ( not ( = ?auto_673401 ?auto_673406 ) ) ( not ( = ?auto_673401 ?auto_673407 ) ) ( not ( = ?auto_673401 ?auto_673408 ) ) ( not ( = ?auto_673401 ?auto_673409 ) ) ( not ( = ?auto_673401 ?auto_673410 ) ) ( not ( = ?auto_673402 ?auto_673403 ) ) ( not ( = ?auto_673402 ?auto_673404 ) ) ( not ( = ?auto_673402 ?auto_673405 ) ) ( not ( = ?auto_673402 ?auto_673406 ) ) ( not ( = ?auto_673402 ?auto_673407 ) ) ( not ( = ?auto_673402 ?auto_673408 ) ) ( not ( = ?auto_673402 ?auto_673409 ) ) ( not ( = ?auto_673402 ?auto_673410 ) ) ( not ( = ?auto_673403 ?auto_673404 ) ) ( not ( = ?auto_673403 ?auto_673405 ) ) ( not ( = ?auto_673403 ?auto_673406 ) ) ( not ( = ?auto_673403 ?auto_673407 ) ) ( not ( = ?auto_673403 ?auto_673408 ) ) ( not ( = ?auto_673403 ?auto_673409 ) ) ( not ( = ?auto_673403 ?auto_673410 ) ) ( not ( = ?auto_673404 ?auto_673405 ) ) ( not ( = ?auto_673404 ?auto_673406 ) ) ( not ( = ?auto_673404 ?auto_673407 ) ) ( not ( = ?auto_673404 ?auto_673408 ) ) ( not ( = ?auto_673404 ?auto_673409 ) ) ( not ( = ?auto_673404 ?auto_673410 ) ) ( not ( = ?auto_673405 ?auto_673406 ) ) ( not ( = ?auto_673405 ?auto_673407 ) ) ( not ( = ?auto_673405 ?auto_673408 ) ) ( not ( = ?auto_673405 ?auto_673409 ) ) ( not ( = ?auto_673405 ?auto_673410 ) ) ( not ( = ?auto_673406 ?auto_673407 ) ) ( not ( = ?auto_673406 ?auto_673408 ) ) ( not ( = ?auto_673406 ?auto_673409 ) ) ( not ( = ?auto_673406 ?auto_673410 ) ) ( not ( = ?auto_673407 ?auto_673408 ) ) ( not ( = ?auto_673407 ?auto_673409 ) ) ( not ( = ?auto_673407 ?auto_673410 ) ) ( not ( = ?auto_673408 ?auto_673409 ) ) ( not ( = ?auto_673408 ?auto_673410 ) ) ( not ( = ?auto_673409 ?auto_673410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_673409 ?auto_673410 )
      ( !STACK ?auto_673409 ?auto_673408 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673439 - BLOCK
      ?auto_673440 - BLOCK
      ?auto_673441 - BLOCK
      ?auto_673442 - BLOCK
      ?auto_673443 - BLOCK
      ?auto_673444 - BLOCK
      ?auto_673445 - BLOCK
      ?auto_673446 - BLOCK
      ?auto_673447 - BLOCK
    )
    :vars
    (
      ?auto_673448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673447 ?auto_673448 ) ( ON-TABLE ?auto_673439 ) ( ON ?auto_673440 ?auto_673439 ) ( ON ?auto_673441 ?auto_673440 ) ( ON ?auto_673442 ?auto_673441 ) ( ON ?auto_673443 ?auto_673442 ) ( ON ?auto_673444 ?auto_673443 ) ( ON ?auto_673445 ?auto_673444 ) ( not ( = ?auto_673439 ?auto_673440 ) ) ( not ( = ?auto_673439 ?auto_673441 ) ) ( not ( = ?auto_673439 ?auto_673442 ) ) ( not ( = ?auto_673439 ?auto_673443 ) ) ( not ( = ?auto_673439 ?auto_673444 ) ) ( not ( = ?auto_673439 ?auto_673445 ) ) ( not ( = ?auto_673439 ?auto_673446 ) ) ( not ( = ?auto_673439 ?auto_673447 ) ) ( not ( = ?auto_673439 ?auto_673448 ) ) ( not ( = ?auto_673440 ?auto_673441 ) ) ( not ( = ?auto_673440 ?auto_673442 ) ) ( not ( = ?auto_673440 ?auto_673443 ) ) ( not ( = ?auto_673440 ?auto_673444 ) ) ( not ( = ?auto_673440 ?auto_673445 ) ) ( not ( = ?auto_673440 ?auto_673446 ) ) ( not ( = ?auto_673440 ?auto_673447 ) ) ( not ( = ?auto_673440 ?auto_673448 ) ) ( not ( = ?auto_673441 ?auto_673442 ) ) ( not ( = ?auto_673441 ?auto_673443 ) ) ( not ( = ?auto_673441 ?auto_673444 ) ) ( not ( = ?auto_673441 ?auto_673445 ) ) ( not ( = ?auto_673441 ?auto_673446 ) ) ( not ( = ?auto_673441 ?auto_673447 ) ) ( not ( = ?auto_673441 ?auto_673448 ) ) ( not ( = ?auto_673442 ?auto_673443 ) ) ( not ( = ?auto_673442 ?auto_673444 ) ) ( not ( = ?auto_673442 ?auto_673445 ) ) ( not ( = ?auto_673442 ?auto_673446 ) ) ( not ( = ?auto_673442 ?auto_673447 ) ) ( not ( = ?auto_673442 ?auto_673448 ) ) ( not ( = ?auto_673443 ?auto_673444 ) ) ( not ( = ?auto_673443 ?auto_673445 ) ) ( not ( = ?auto_673443 ?auto_673446 ) ) ( not ( = ?auto_673443 ?auto_673447 ) ) ( not ( = ?auto_673443 ?auto_673448 ) ) ( not ( = ?auto_673444 ?auto_673445 ) ) ( not ( = ?auto_673444 ?auto_673446 ) ) ( not ( = ?auto_673444 ?auto_673447 ) ) ( not ( = ?auto_673444 ?auto_673448 ) ) ( not ( = ?auto_673445 ?auto_673446 ) ) ( not ( = ?auto_673445 ?auto_673447 ) ) ( not ( = ?auto_673445 ?auto_673448 ) ) ( not ( = ?auto_673446 ?auto_673447 ) ) ( not ( = ?auto_673446 ?auto_673448 ) ) ( not ( = ?auto_673447 ?auto_673448 ) ) ( CLEAR ?auto_673445 ) ( ON ?auto_673446 ?auto_673447 ) ( CLEAR ?auto_673446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_673439 ?auto_673440 ?auto_673441 ?auto_673442 ?auto_673443 ?auto_673444 ?auto_673445 ?auto_673446 )
      ( MAKE-9PILE ?auto_673439 ?auto_673440 ?auto_673441 ?auto_673442 ?auto_673443 ?auto_673444 ?auto_673445 ?auto_673446 ?auto_673447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673477 - BLOCK
      ?auto_673478 - BLOCK
      ?auto_673479 - BLOCK
      ?auto_673480 - BLOCK
      ?auto_673481 - BLOCK
      ?auto_673482 - BLOCK
      ?auto_673483 - BLOCK
      ?auto_673484 - BLOCK
      ?auto_673485 - BLOCK
    )
    :vars
    (
      ?auto_673486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673485 ?auto_673486 ) ( ON-TABLE ?auto_673477 ) ( ON ?auto_673478 ?auto_673477 ) ( ON ?auto_673479 ?auto_673478 ) ( ON ?auto_673480 ?auto_673479 ) ( ON ?auto_673481 ?auto_673480 ) ( ON ?auto_673482 ?auto_673481 ) ( not ( = ?auto_673477 ?auto_673478 ) ) ( not ( = ?auto_673477 ?auto_673479 ) ) ( not ( = ?auto_673477 ?auto_673480 ) ) ( not ( = ?auto_673477 ?auto_673481 ) ) ( not ( = ?auto_673477 ?auto_673482 ) ) ( not ( = ?auto_673477 ?auto_673483 ) ) ( not ( = ?auto_673477 ?auto_673484 ) ) ( not ( = ?auto_673477 ?auto_673485 ) ) ( not ( = ?auto_673477 ?auto_673486 ) ) ( not ( = ?auto_673478 ?auto_673479 ) ) ( not ( = ?auto_673478 ?auto_673480 ) ) ( not ( = ?auto_673478 ?auto_673481 ) ) ( not ( = ?auto_673478 ?auto_673482 ) ) ( not ( = ?auto_673478 ?auto_673483 ) ) ( not ( = ?auto_673478 ?auto_673484 ) ) ( not ( = ?auto_673478 ?auto_673485 ) ) ( not ( = ?auto_673478 ?auto_673486 ) ) ( not ( = ?auto_673479 ?auto_673480 ) ) ( not ( = ?auto_673479 ?auto_673481 ) ) ( not ( = ?auto_673479 ?auto_673482 ) ) ( not ( = ?auto_673479 ?auto_673483 ) ) ( not ( = ?auto_673479 ?auto_673484 ) ) ( not ( = ?auto_673479 ?auto_673485 ) ) ( not ( = ?auto_673479 ?auto_673486 ) ) ( not ( = ?auto_673480 ?auto_673481 ) ) ( not ( = ?auto_673480 ?auto_673482 ) ) ( not ( = ?auto_673480 ?auto_673483 ) ) ( not ( = ?auto_673480 ?auto_673484 ) ) ( not ( = ?auto_673480 ?auto_673485 ) ) ( not ( = ?auto_673480 ?auto_673486 ) ) ( not ( = ?auto_673481 ?auto_673482 ) ) ( not ( = ?auto_673481 ?auto_673483 ) ) ( not ( = ?auto_673481 ?auto_673484 ) ) ( not ( = ?auto_673481 ?auto_673485 ) ) ( not ( = ?auto_673481 ?auto_673486 ) ) ( not ( = ?auto_673482 ?auto_673483 ) ) ( not ( = ?auto_673482 ?auto_673484 ) ) ( not ( = ?auto_673482 ?auto_673485 ) ) ( not ( = ?auto_673482 ?auto_673486 ) ) ( not ( = ?auto_673483 ?auto_673484 ) ) ( not ( = ?auto_673483 ?auto_673485 ) ) ( not ( = ?auto_673483 ?auto_673486 ) ) ( not ( = ?auto_673484 ?auto_673485 ) ) ( not ( = ?auto_673484 ?auto_673486 ) ) ( not ( = ?auto_673485 ?auto_673486 ) ) ( ON ?auto_673484 ?auto_673485 ) ( CLEAR ?auto_673482 ) ( ON ?auto_673483 ?auto_673484 ) ( CLEAR ?auto_673483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_673477 ?auto_673478 ?auto_673479 ?auto_673480 ?auto_673481 ?auto_673482 ?auto_673483 )
      ( MAKE-9PILE ?auto_673477 ?auto_673478 ?auto_673479 ?auto_673480 ?auto_673481 ?auto_673482 ?auto_673483 ?auto_673484 ?auto_673485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673515 - BLOCK
      ?auto_673516 - BLOCK
      ?auto_673517 - BLOCK
      ?auto_673518 - BLOCK
      ?auto_673519 - BLOCK
      ?auto_673520 - BLOCK
      ?auto_673521 - BLOCK
      ?auto_673522 - BLOCK
      ?auto_673523 - BLOCK
    )
    :vars
    (
      ?auto_673524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673523 ?auto_673524 ) ( ON-TABLE ?auto_673515 ) ( ON ?auto_673516 ?auto_673515 ) ( ON ?auto_673517 ?auto_673516 ) ( ON ?auto_673518 ?auto_673517 ) ( ON ?auto_673519 ?auto_673518 ) ( not ( = ?auto_673515 ?auto_673516 ) ) ( not ( = ?auto_673515 ?auto_673517 ) ) ( not ( = ?auto_673515 ?auto_673518 ) ) ( not ( = ?auto_673515 ?auto_673519 ) ) ( not ( = ?auto_673515 ?auto_673520 ) ) ( not ( = ?auto_673515 ?auto_673521 ) ) ( not ( = ?auto_673515 ?auto_673522 ) ) ( not ( = ?auto_673515 ?auto_673523 ) ) ( not ( = ?auto_673515 ?auto_673524 ) ) ( not ( = ?auto_673516 ?auto_673517 ) ) ( not ( = ?auto_673516 ?auto_673518 ) ) ( not ( = ?auto_673516 ?auto_673519 ) ) ( not ( = ?auto_673516 ?auto_673520 ) ) ( not ( = ?auto_673516 ?auto_673521 ) ) ( not ( = ?auto_673516 ?auto_673522 ) ) ( not ( = ?auto_673516 ?auto_673523 ) ) ( not ( = ?auto_673516 ?auto_673524 ) ) ( not ( = ?auto_673517 ?auto_673518 ) ) ( not ( = ?auto_673517 ?auto_673519 ) ) ( not ( = ?auto_673517 ?auto_673520 ) ) ( not ( = ?auto_673517 ?auto_673521 ) ) ( not ( = ?auto_673517 ?auto_673522 ) ) ( not ( = ?auto_673517 ?auto_673523 ) ) ( not ( = ?auto_673517 ?auto_673524 ) ) ( not ( = ?auto_673518 ?auto_673519 ) ) ( not ( = ?auto_673518 ?auto_673520 ) ) ( not ( = ?auto_673518 ?auto_673521 ) ) ( not ( = ?auto_673518 ?auto_673522 ) ) ( not ( = ?auto_673518 ?auto_673523 ) ) ( not ( = ?auto_673518 ?auto_673524 ) ) ( not ( = ?auto_673519 ?auto_673520 ) ) ( not ( = ?auto_673519 ?auto_673521 ) ) ( not ( = ?auto_673519 ?auto_673522 ) ) ( not ( = ?auto_673519 ?auto_673523 ) ) ( not ( = ?auto_673519 ?auto_673524 ) ) ( not ( = ?auto_673520 ?auto_673521 ) ) ( not ( = ?auto_673520 ?auto_673522 ) ) ( not ( = ?auto_673520 ?auto_673523 ) ) ( not ( = ?auto_673520 ?auto_673524 ) ) ( not ( = ?auto_673521 ?auto_673522 ) ) ( not ( = ?auto_673521 ?auto_673523 ) ) ( not ( = ?auto_673521 ?auto_673524 ) ) ( not ( = ?auto_673522 ?auto_673523 ) ) ( not ( = ?auto_673522 ?auto_673524 ) ) ( not ( = ?auto_673523 ?auto_673524 ) ) ( ON ?auto_673522 ?auto_673523 ) ( ON ?auto_673521 ?auto_673522 ) ( CLEAR ?auto_673519 ) ( ON ?auto_673520 ?auto_673521 ) ( CLEAR ?auto_673520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_673515 ?auto_673516 ?auto_673517 ?auto_673518 ?auto_673519 ?auto_673520 )
      ( MAKE-9PILE ?auto_673515 ?auto_673516 ?auto_673517 ?auto_673518 ?auto_673519 ?auto_673520 ?auto_673521 ?auto_673522 ?auto_673523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673553 - BLOCK
      ?auto_673554 - BLOCK
      ?auto_673555 - BLOCK
      ?auto_673556 - BLOCK
      ?auto_673557 - BLOCK
      ?auto_673558 - BLOCK
      ?auto_673559 - BLOCK
      ?auto_673560 - BLOCK
      ?auto_673561 - BLOCK
    )
    :vars
    (
      ?auto_673562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673561 ?auto_673562 ) ( ON-TABLE ?auto_673553 ) ( ON ?auto_673554 ?auto_673553 ) ( ON ?auto_673555 ?auto_673554 ) ( ON ?auto_673556 ?auto_673555 ) ( not ( = ?auto_673553 ?auto_673554 ) ) ( not ( = ?auto_673553 ?auto_673555 ) ) ( not ( = ?auto_673553 ?auto_673556 ) ) ( not ( = ?auto_673553 ?auto_673557 ) ) ( not ( = ?auto_673553 ?auto_673558 ) ) ( not ( = ?auto_673553 ?auto_673559 ) ) ( not ( = ?auto_673553 ?auto_673560 ) ) ( not ( = ?auto_673553 ?auto_673561 ) ) ( not ( = ?auto_673553 ?auto_673562 ) ) ( not ( = ?auto_673554 ?auto_673555 ) ) ( not ( = ?auto_673554 ?auto_673556 ) ) ( not ( = ?auto_673554 ?auto_673557 ) ) ( not ( = ?auto_673554 ?auto_673558 ) ) ( not ( = ?auto_673554 ?auto_673559 ) ) ( not ( = ?auto_673554 ?auto_673560 ) ) ( not ( = ?auto_673554 ?auto_673561 ) ) ( not ( = ?auto_673554 ?auto_673562 ) ) ( not ( = ?auto_673555 ?auto_673556 ) ) ( not ( = ?auto_673555 ?auto_673557 ) ) ( not ( = ?auto_673555 ?auto_673558 ) ) ( not ( = ?auto_673555 ?auto_673559 ) ) ( not ( = ?auto_673555 ?auto_673560 ) ) ( not ( = ?auto_673555 ?auto_673561 ) ) ( not ( = ?auto_673555 ?auto_673562 ) ) ( not ( = ?auto_673556 ?auto_673557 ) ) ( not ( = ?auto_673556 ?auto_673558 ) ) ( not ( = ?auto_673556 ?auto_673559 ) ) ( not ( = ?auto_673556 ?auto_673560 ) ) ( not ( = ?auto_673556 ?auto_673561 ) ) ( not ( = ?auto_673556 ?auto_673562 ) ) ( not ( = ?auto_673557 ?auto_673558 ) ) ( not ( = ?auto_673557 ?auto_673559 ) ) ( not ( = ?auto_673557 ?auto_673560 ) ) ( not ( = ?auto_673557 ?auto_673561 ) ) ( not ( = ?auto_673557 ?auto_673562 ) ) ( not ( = ?auto_673558 ?auto_673559 ) ) ( not ( = ?auto_673558 ?auto_673560 ) ) ( not ( = ?auto_673558 ?auto_673561 ) ) ( not ( = ?auto_673558 ?auto_673562 ) ) ( not ( = ?auto_673559 ?auto_673560 ) ) ( not ( = ?auto_673559 ?auto_673561 ) ) ( not ( = ?auto_673559 ?auto_673562 ) ) ( not ( = ?auto_673560 ?auto_673561 ) ) ( not ( = ?auto_673560 ?auto_673562 ) ) ( not ( = ?auto_673561 ?auto_673562 ) ) ( ON ?auto_673560 ?auto_673561 ) ( ON ?auto_673559 ?auto_673560 ) ( ON ?auto_673558 ?auto_673559 ) ( CLEAR ?auto_673556 ) ( ON ?auto_673557 ?auto_673558 ) ( CLEAR ?auto_673557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_673553 ?auto_673554 ?auto_673555 ?auto_673556 ?auto_673557 )
      ( MAKE-9PILE ?auto_673553 ?auto_673554 ?auto_673555 ?auto_673556 ?auto_673557 ?auto_673558 ?auto_673559 ?auto_673560 ?auto_673561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673591 - BLOCK
      ?auto_673592 - BLOCK
      ?auto_673593 - BLOCK
      ?auto_673594 - BLOCK
      ?auto_673595 - BLOCK
      ?auto_673596 - BLOCK
      ?auto_673597 - BLOCK
      ?auto_673598 - BLOCK
      ?auto_673599 - BLOCK
    )
    :vars
    (
      ?auto_673600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673599 ?auto_673600 ) ( ON-TABLE ?auto_673591 ) ( ON ?auto_673592 ?auto_673591 ) ( ON ?auto_673593 ?auto_673592 ) ( not ( = ?auto_673591 ?auto_673592 ) ) ( not ( = ?auto_673591 ?auto_673593 ) ) ( not ( = ?auto_673591 ?auto_673594 ) ) ( not ( = ?auto_673591 ?auto_673595 ) ) ( not ( = ?auto_673591 ?auto_673596 ) ) ( not ( = ?auto_673591 ?auto_673597 ) ) ( not ( = ?auto_673591 ?auto_673598 ) ) ( not ( = ?auto_673591 ?auto_673599 ) ) ( not ( = ?auto_673591 ?auto_673600 ) ) ( not ( = ?auto_673592 ?auto_673593 ) ) ( not ( = ?auto_673592 ?auto_673594 ) ) ( not ( = ?auto_673592 ?auto_673595 ) ) ( not ( = ?auto_673592 ?auto_673596 ) ) ( not ( = ?auto_673592 ?auto_673597 ) ) ( not ( = ?auto_673592 ?auto_673598 ) ) ( not ( = ?auto_673592 ?auto_673599 ) ) ( not ( = ?auto_673592 ?auto_673600 ) ) ( not ( = ?auto_673593 ?auto_673594 ) ) ( not ( = ?auto_673593 ?auto_673595 ) ) ( not ( = ?auto_673593 ?auto_673596 ) ) ( not ( = ?auto_673593 ?auto_673597 ) ) ( not ( = ?auto_673593 ?auto_673598 ) ) ( not ( = ?auto_673593 ?auto_673599 ) ) ( not ( = ?auto_673593 ?auto_673600 ) ) ( not ( = ?auto_673594 ?auto_673595 ) ) ( not ( = ?auto_673594 ?auto_673596 ) ) ( not ( = ?auto_673594 ?auto_673597 ) ) ( not ( = ?auto_673594 ?auto_673598 ) ) ( not ( = ?auto_673594 ?auto_673599 ) ) ( not ( = ?auto_673594 ?auto_673600 ) ) ( not ( = ?auto_673595 ?auto_673596 ) ) ( not ( = ?auto_673595 ?auto_673597 ) ) ( not ( = ?auto_673595 ?auto_673598 ) ) ( not ( = ?auto_673595 ?auto_673599 ) ) ( not ( = ?auto_673595 ?auto_673600 ) ) ( not ( = ?auto_673596 ?auto_673597 ) ) ( not ( = ?auto_673596 ?auto_673598 ) ) ( not ( = ?auto_673596 ?auto_673599 ) ) ( not ( = ?auto_673596 ?auto_673600 ) ) ( not ( = ?auto_673597 ?auto_673598 ) ) ( not ( = ?auto_673597 ?auto_673599 ) ) ( not ( = ?auto_673597 ?auto_673600 ) ) ( not ( = ?auto_673598 ?auto_673599 ) ) ( not ( = ?auto_673598 ?auto_673600 ) ) ( not ( = ?auto_673599 ?auto_673600 ) ) ( ON ?auto_673598 ?auto_673599 ) ( ON ?auto_673597 ?auto_673598 ) ( ON ?auto_673596 ?auto_673597 ) ( ON ?auto_673595 ?auto_673596 ) ( CLEAR ?auto_673593 ) ( ON ?auto_673594 ?auto_673595 ) ( CLEAR ?auto_673594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_673591 ?auto_673592 ?auto_673593 ?auto_673594 )
      ( MAKE-9PILE ?auto_673591 ?auto_673592 ?auto_673593 ?auto_673594 ?auto_673595 ?auto_673596 ?auto_673597 ?auto_673598 ?auto_673599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673629 - BLOCK
      ?auto_673630 - BLOCK
      ?auto_673631 - BLOCK
      ?auto_673632 - BLOCK
      ?auto_673633 - BLOCK
      ?auto_673634 - BLOCK
      ?auto_673635 - BLOCK
      ?auto_673636 - BLOCK
      ?auto_673637 - BLOCK
    )
    :vars
    (
      ?auto_673638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673637 ?auto_673638 ) ( ON-TABLE ?auto_673629 ) ( ON ?auto_673630 ?auto_673629 ) ( not ( = ?auto_673629 ?auto_673630 ) ) ( not ( = ?auto_673629 ?auto_673631 ) ) ( not ( = ?auto_673629 ?auto_673632 ) ) ( not ( = ?auto_673629 ?auto_673633 ) ) ( not ( = ?auto_673629 ?auto_673634 ) ) ( not ( = ?auto_673629 ?auto_673635 ) ) ( not ( = ?auto_673629 ?auto_673636 ) ) ( not ( = ?auto_673629 ?auto_673637 ) ) ( not ( = ?auto_673629 ?auto_673638 ) ) ( not ( = ?auto_673630 ?auto_673631 ) ) ( not ( = ?auto_673630 ?auto_673632 ) ) ( not ( = ?auto_673630 ?auto_673633 ) ) ( not ( = ?auto_673630 ?auto_673634 ) ) ( not ( = ?auto_673630 ?auto_673635 ) ) ( not ( = ?auto_673630 ?auto_673636 ) ) ( not ( = ?auto_673630 ?auto_673637 ) ) ( not ( = ?auto_673630 ?auto_673638 ) ) ( not ( = ?auto_673631 ?auto_673632 ) ) ( not ( = ?auto_673631 ?auto_673633 ) ) ( not ( = ?auto_673631 ?auto_673634 ) ) ( not ( = ?auto_673631 ?auto_673635 ) ) ( not ( = ?auto_673631 ?auto_673636 ) ) ( not ( = ?auto_673631 ?auto_673637 ) ) ( not ( = ?auto_673631 ?auto_673638 ) ) ( not ( = ?auto_673632 ?auto_673633 ) ) ( not ( = ?auto_673632 ?auto_673634 ) ) ( not ( = ?auto_673632 ?auto_673635 ) ) ( not ( = ?auto_673632 ?auto_673636 ) ) ( not ( = ?auto_673632 ?auto_673637 ) ) ( not ( = ?auto_673632 ?auto_673638 ) ) ( not ( = ?auto_673633 ?auto_673634 ) ) ( not ( = ?auto_673633 ?auto_673635 ) ) ( not ( = ?auto_673633 ?auto_673636 ) ) ( not ( = ?auto_673633 ?auto_673637 ) ) ( not ( = ?auto_673633 ?auto_673638 ) ) ( not ( = ?auto_673634 ?auto_673635 ) ) ( not ( = ?auto_673634 ?auto_673636 ) ) ( not ( = ?auto_673634 ?auto_673637 ) ) ( not ( = ?auto_673634 ?auto_673638 ) ) ( not ( = ?auto_673635 ?auto_673636 ) ) ( not ( = ?auto_673635 ?auto_673637 ) ) ( not ( = ?auto_673635 ?auto_673638 ) ) ( not ( = ?auto_673636 ?auto_673637 ) ) ( not ( = ?auto_673636 ?auto_673638 ) ) ( not ( = ?auto_673637 ?auto_673638 ) ) ( ON ?auto_673636 ?auto_673637 ) ( ON ?auto_673635 ?auto_673636 ) ( ON ?auto_673634 ?auto_673635 ) ( ON ?auto_673633 ?auto_673634 ) ( ON ?auto_673632 ?auto_673633 ) ( CLEAR ?auto_673630 ) ( ON ?auto_673631 ?auto_673632 ) ( CLEAR ?auto_673631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_673629 ?auto_673630 ?auto_673631 )
      ( MAKE-9PILE ?auto_673629 ?auto_673630 ?auto_673631 ?auto_673632 ?auto_673633 ?auto_673634 ?auto_673635 ?auto_673636 ?auto_673637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673667 - BLOCK
      ?auto_673668 - BLOCK
      ?auto_673669 - BLOCK
      ?auto_673670 - BLOCK
      ?auto_673671 - BLOCK
      ?auto_673672 - BLOCK
      ?auto_673673 - BLOCK
      ?auto_673674 - BLOCK
      ?auto_673675 - BLOCK
    )
    :vars
    (
      ?auto_673676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673675 ?auto_673676 ) ( ON-TABLE ?auto_673667 ) ( not ( = ?auto_673667 ?auto_673668 ) ) ( not ( = ?auto_673667 ?auto_673669 ) ) ( not ( = ?auto_673667 ?auto_673670 ) ) ( not ( = ?auto_673667 ?auto_673671 ) ) ( not ( = ?auto_673667 ?auto_673672 ) ) ( not ( = ?auto_673667 ?auto_673673 ) ) ( not ( = ?auto_673667 ?auto_673674 ) ) ( not ( = ?auto_673667 ?auto_673675 ) ) ( not ( = ?auto_673667 ?auto_673676 ) ) ( not ( = ?auto_673668 ?auto_673669 ) ) ( not ( = ?auto_673668 ?auto_673670 ) ) ( not ( = ?auto_673668 ?auto_673671 ) ) ( not ( = ?auto_673668 ?auto_673672 ) ) ( not ( = ?auto_673668 ?auto_673673 ) ) ( not ( = ?auto_673668 ?auto_673674 ) ) ( not ( = ?auto_673668 ?auto_673675 ) ) ( not ( = ?auto_673668 ?auto_673676 ) ) ( not ( = ?auto_673669 ?auto_673670 ) ) ( not ( = ?auto_673669 ?auto_673671 ) ) ( not ( = ?auto_673669 ?auto_673672 ) ) ( not ( = ?auto_673669 ?auto_673673 ) ) ( not ( = ?auto_673669 ?auto_673674 ) ) ( not ( = ?auto_673669 ?auto_673675 ) ) ( not ( = ?auto_673669 ?auto_673676 ) ) ( not ( = ?auto_673670 ?auto_673671 ) ) ( not ( = ?auto_673670 ?auto_673672 ) ) ( not ( = ?auto_673670 ?auto_673673 ) ) ( not ( = ?auto_673670 ?auto_673674 ) ) ( not ( = ?auto_673670 ?auto_673675 ) ) ( not ( = ?auto_673670 ?auto_673676 ) ) ( not ( = ?auto_673671 ?auto_673672 ) ) ( not ( = ?auto_673671 ?auto_673673 ) ) ( not ( = ?auto_673671 ?auto_673674 ) ) ( not ( = ?auto_673671 ?auto_673675 ) ) ( not ( = ?auto_673671 ?auto_673676 ) ) ( not ( = ?auto_673672 ?auto_673673 ) ) ( not ( = ?auto_673672 ?auto_673674 ) ) ( not ( = ?auto_673672 ?auto_673675 ) ) ( not ( = ?auto_673672 ?auto_673676 ) ) ( not ( = ?auto_673673 ?auto_673674 ) ) ( not ( = ?auto_673673 ?auto_673675 ) ) ( not ( = ?auto_673673 ?auto_673676 ) ) ( not ( = ?auto_673674 ?auto_673675 ) ) ( not ( = ?auto_673674 ?auto_673676 ) ) ( not ( = ?auto_673675 ?auto_673676 ) ) ( ON ?auto_673674 ?auto_673675 ) ( ON ?auto_673673 ?auto_673674 ) ( ON ?auto_673672 ?auto_673673 ) ( ON ?auto_673671 ?auto_673672 ) ( ON ?auto_673670 ?auto_673671 ) ( ON ?auto_673669 ?auto_673670 ) ( CLEAR ?auto_673667 ) ( ON ?auto_673668 ?auto_673669 ) ( CLEAR ?auto_673668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_673667 ?auto_673668 )
      ( MAKE-9PILE ?auto_673667 ?auto_673668 ?auto_673669 ?auto_673670 ?auto_673671 ?auto_673672 ?auto_673673 ?auto_673674 ?auto_673675 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_673705 - BLOCK
      ?auto_673706 - BLOCK
      ?auto_673707 - BLOCK
      ?auto_673708 - BLOCK
      ?auto_673709 - BLOCK
      ?auto_673710 - BLOCK
      ?auto_673711 - BLOCK
      ?auto_673712 - BLOCK
      ?auto_673713 - BLOCK
    )
    :vars
    (
      ?auto_673714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673713 ?auto_673714 ) ( not ( = ?auto_673705 ?auto_673706 ) ) ( not ( = ?auto_673705 ?auto_673707 ) ) ( not ( = ?auto_673705 ?auto_673708 ) ) ( not ( = ?auto_673705 ?auto_673709 ) ) ( not ( = ?auto_673705 ?auto_673710 ) ) ( not ( = ?auto_673705 ?auto_673711 ) ) ( not ( = ?auto_673705 ?auto_673712 ) ) ( not ( = ?auto_673705 ?auto_673713 ) ) ( not ( = ?auto_673705 ?auto_673714 ) ) ( not ( = ?auto_673706 ?auto_673707 ) ) ( not ( = ?auto_673706 ?auto_673708 ) ) ( not ( = ?auto_673706 ?auto_673709 ) ) ( not ( = ?auto_673706 ?auto_673710 ) ) ( not ( = ?auto_673706 ?auto_673711 ) ) ( not ( = ?auto_673706 ?auto_673712 ) ) ( not ( = ?auto_673706 ?auto_673713 ) ) ( not ( = ?auto_673706 ?auto_673714 ) ) ( not ( = ?auto_673707 ?auto_673708 ) ) ( not ( = ?auto_673707 ?auto_673709 ) ) ( not ( = ?auto_673707 ?auto_673710 ) ) ( not ( = ?auto_673707 ?auto_673711 ) ) ( not ( = ?auto_673707 ?auto_673712 ) ) ( not ( = ?auto_673707 ?auto_673713 ) ) ( not ( = ?auto_673707 ?auto_673714 ) ) ( not ( = ?auto_673708 ?auto_673709 ) ) ( not ( = ?auto_673708 ?auto_673710 ) ) ( not ( = ?auto_673708 ?auto_673711 ) ) ( not ( = ?auto_673708 ?auto_673712 ) ) ( not ( = ?auto_673708 ?auto_673713 ) ) ( not ( = ?auto_673708 ?auto_673714 ) ) ( not ( = ?auto_673709 ?auto_673710 ) ) ( not ( = ?auto_673709 ?auto_673711 ) ) ( not ( = ?auto_673709 ?auto_673712 ) ) ( not ( = ?auto_673709 ?auto_673713 ) ) ( not ( = ?auto_673709 ?auto_673714 ) ) ( not ( = ?auto_673710 ?auto_673711 ) ) ( not ( = ?auto_673710 ?auto_673712 ) ) ( not ( = ?auto_673710 ?auto_673713 ) ) ( not ( = ?auto_673710 ?auto_673714 ) ) ( not ( = ?auto_673711 ?auto_673712 ) ) ( not ( = ?auto_673711 ?auto_673713 ) ) ( not ( = ?auto_673711 ?auto_673714 ) ) ( not ( = ?auto_673712 ?auto_673713 ) ) ( not ( = ?auto_673712 ?auto_673714 ) ) ( not ( = ?auto_673713 ?auto_673714 ) ) ( ON ?auto_673712 ?auto_673713 ) ( ON ?auto_673711 ?auto_673712 ) ( ON ?auto_673710 ?auto_673711 ) ( ON ?auto_673709 ?auto_673710 ) ( ON ?auto_673708 ?auto_673709 ) ( ON ?auto_673707 ?auto_673708 ) ( ON ?auto_673706 ?auto_673707 ) ( ON ?auto_673705 ?auto_673706 ) ( CLEAR ?auto_673705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_673705 )
      ( MAKE-9PILE ?auto_673705 ?auto_673706 ?auto_673707 ?auto_673708 ?auto_673709 ?auto_673710 ?auto_673711 ?auto_673712 ?auto_673713 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_673744 - BLOCK
      ?auto_673745 - BLOCK
      ?auto_673746 - BLOCK
      ?auto_673747 - BLOCK
      ?auto_673748 - BLOCK
      ?auto_673749 - BLOCK
      ?auto_673750 - BLOCK
      ?auto_673751 - BLOCK
      ?auto_673752 - BLOCK
      ?auto_673753 - BLOCK
    )
    :vars
    (
      ?auto_673754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_673752 ) ( ON ?auto_673753 ?auto_673754 ) ( CLEAR ?auto_673753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_673744 ) ( ON ?auto_673745 ?auto_673744 ) ( ON ?auto_673746 ?auto_673745 ) ( ON ?auto_673747 ?auto_673746 ) ( ON ?auto_673748 ?auto_673747 ) ( ON ?auto_673749 ?auto_673748 ) ( ON ?auto_673750 ?auto_673749 ) ( ON ?auto_673751 ?auto_673750 ) ( ON ?auto_673752 ?auto_673751 ) ( not ( = ?auto_673744 ?auto_673745 ) ) ( not ( = ?auto_673744 ?auto_673746 ) ) ( not ( = ?auto_673744 ?auto_673747 ) ) ( not ( = ?auto_673744 ?auto_673748 ) ) ( not ( = ?auto_673744 ?auto_673749 ) ) ( not ( = ?auto_673744 ?auto_673750 ) ) ( not ( = ?auto_673744 ?auto_673751 ) ) ( not ( = ?auto_673744 ?auto_673752 ) ) ( not ( = ?auto_673744 ?auto_673753 ) ) ( not ( = ?auto_673744 ?auto_673754 ) ) ( not ( = ?auto_673745 ?auto_673746 ) ) ( not ( = ?auto_673745 ?auto_673747 ) ) ( not ( = ?auto_673745 ?auto_673748 ) ) ( not ( = ?auto_673745 ?auto_673749 ) ) ( not ( = ?auto_673745 ?auto_673750 ) ) ( not ( = ?auto_673745 ?auto_673751 ) ) ( not ( = ?auto_673745 ?auto_673752 ) ) ( not ( = ?auto_673745 ?auto_673753 ) ) ( not ( = ?auto_673745 ?auto_673754 ) ) ( not ( = ?auto_673746 ?auto_673747 ) ) ( not ( = ?auto_673746 ?auto_673748 ) ) ( not ( = ?auto_673746 ?auto_673749 ) ) ( not ( = ?auto_673746 ?auto_673750 ) ) ( not ( = ?auto_673746 ?auto_673751 ) ) ( not ( = ?auto_673746 ?auto_673752 ) ) ( not ( = ?auto_673746 ?auto_673753 ) ) ( not ( = ?auto_673746 ?auto_673754 ) ) ( not ( = ?auto_673747 ?auto_673748 ) ) ( not ( = ?auto_673747 ?auto_673749 ) ) ( not ( = ?auto_673747 ?auto_673750 ) ) ( not ( = ?auto_673747 ?auto_673751 ) ) ( not ( = ?auto_673747 ?auto_673752 ) ) ( not ( = ?auto_673747 ?auto_673753 ) ) ( not ( = ?auto_673747 ?auto_673754 ) ) ( not ( = ?auto_673748 ?auto_673749 ) ) ( not ( = ?auto_673748 ?auto_673750 ) ) ( not ( = ?auto_673748 ?auto_673751 ) ) ( not ( = ?auto_673748 ?auto_673752 ) ) ( not ( = ?auto_673748 ?auto_673753 ) ) ( not ( = ?auto_673748 ?auto_673754 ) ) ( not ( = ?auto_673749 ?auto_673750 ) ) ( not ( = ?auto_673749 ?auto_673751 ) ) ( not ( = ?auto_673749 ?auto_673752 ) ) ( not ( = ?auto_673749 ?auto_673753 ) ) ( not ( = ?auto_673749 ?auto_673754 ) ) ( not ( = ?auto_673750 ?auto_673751 ) ) ( not ( = ?auto_673750 ?auto_673752 ) ) ( not ( = ?auto_673750 ?auto_673753 ) ) ( not ( = ?auto_673750 ?auto_673754 ) ) ( not ( = ?auto_673751 ?auto_673752 ) ) ( not ( = ?auto_673751 ?auto_673753 ) ) ( not ( = ?auto_673751 ?auto_673754 ) ) ( not ( = ?auto_673752 ?auto_673753 ) ) ( not ( = ?auto_673752 ?auto_673754 ) ) ( not ( = ?auto_673753 ?auto_673754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_673753 ?auto_673754 )
      ( !STACK ?auto_673753 ?auto_673752 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_673786 - BLOCK
      ?auto_673787 - BLOCK
      ?auto_673788 - BLOCK
      ?auto_673789 - BLOCK
      ?auto_673790 - BLOCK
      ?auto_673791 - BLOCK
      ?auto_673792 - BLOCK
      ?auto_673793 - BLOCK
      ?auto_673794 - BLOCK
      ?auto_673795 - BLOCK
    )
    :vars
    (
      ?auto_673796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673795 ?auto_673796 ) ( ON-TABLE ?auto_673786 ) ( ON ?auto_673787 ?auto_673786 ) ( ON ?auto_673788 ?auto_673787 ) ( ON ?auto_673789 ?auto_673788 ) ( ON ?auto_673790 ?auto_673789 ) ( ON ?auto_673791 ?auto_673790 ) ( ON ?auto_673792 ?auto_673791 ) ( ON ?auto_673793 ?auto_673792 ) ( not ( = ?auto_673786 ?auto_673787 ) ) ( not ( = ?auto_673786 ?auto_673788 ) ) ( not ( = ?auto_673786 ?auto_673789 ) ) ( not ( = ?auto_673786 ?auto_673790 ) ) ( not ( = ?auto_673786 ?auto_673791 ) ) ( not ( = ?auto_673786 ?auto_673792 ) ) ( not ( = ?auto_673786 ?auto_673793 ) ) ( not ( = ?auto_673786 ?auto_673794 ) ) ( not ( = ?auto_673786 ?auto_673795 ) ) ( not ( = ?auto_673786 ?auto_673796 ) ) ( not ( = ?auto_673787 ?auto_673788 ) ) ( not ( = ?auto_673787 ?auto_673789 ) ) ( not ( = ?auto_673787 ?auto_673790 ) ) ( not ( = ?auto_673787 ?auto_673791 ) ) ( not ( = ?auto_673787 ?auto_673792 ) ) ( not ( = ?auto_673787 ?auto_673793 ) ) ( not ( = ?auto_673787 ?auto_673794 ) ) ( not ( = ?auto_673787 ?auto_673795 ) ) ( not ( = ?auto_673787 ?auto_673796 ) ) ( not ( = ?auto_673788 ?auto_673789 ) ) ( not ( = ?auto_673788 ?auto_673790 ) ) ( not ( = ?auto_673788 ?auto_673791 ) ) ( not ( = ?auto_673788 ?auto_673792 ) ) ( not ( = ?auto_673788 ?auto_673793 ) ) ( not ( = ?auto_673788 ?auto_673794 ) ) ( not ( = ?auto_673788 ?auto_673795 ) ) ( not ( = ?auto_673788 ?auto_673796 ) ) ( not ( = ?auto_673789 ?auto_673790 ) ) ( not ( = ?auto_673789 ?auto_673791 ) ) ( not ( = ?auto_673789 ?auto_673792 ) ) ( not ( = ?auto_673789 ?auto_673793 ) ) ( not ( = ?auto_673789 ?auto_673794 ) ) ( not ( = ?auto_673789 ?auto_673795 ) ) ( not ( = ?auto_673789 ?auto_673796 ) ) ( not ( = ?auto_673790 ?auto_673791 ) ) ( not ( = ?auto_673790 ?auto_673792 ) ) ( not ( = ?auto_673790 ?auto_673793 ) ) ( not ( = ?auto_673790 ?auto_673794 ) ) ( not ( = ?auto_673790 ?auto_673795 ) ) ( not ( = ?auto_673790 ?auto_673796 ) ) ( not ( = ?auto_673791 ?auto_673792 ) ) ( not ( = ?auto_673791 ?auto_673793 ) ) ( not ( = ?auto_673791 ?auto_673794 ) ) ( not ( = ?auto_673791 ?auto_673795 ) ) ( not ( = ?auto_673791 ?auto_673796 ) ) ( not ( = ?auto_673792 ?auto_673793 ) ) ( not ( = ?auto_673792 ?auto_673794 ) ) ( not ( = ?auto_673792 ?auto_673795 ) ) ( not ( = ?auto_673792 ?auto_673796 ) ) ( not ( = ?auto_673793 ?auto_673794 ) ) ( not ( = ?auto_673793 ?auto_673795 ) ) ( not ( = ?auto_673793 ?auto_673796 ) ) ( not ( = ?auto_673794 ?auto_673795 ) ) ( not ( = ?auto_673794 ?auto_673796 ) ) ( not ( = ?auto_673795 ?auto_673796 ) ) ( CLEAR ?auto_673793 ) ( ON ?auto_673794 ?auto_673795 ) ( CLEAR ?auto_673794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_673786 ?auto_673787 ?auto_673788 ?auto_673789 ?auto_673790 ?auto_673791 ?auto_673792 ?auto_673793 ?auto_673794 )
      ( MAKE-10PILE ?auto_673786 ?auto_673787 ?auto_673788 ?auto_673789 ?auto_673790 ?auto_673791 ?auto_673792 ?auto_673793 ?auto_673794 ?auto_673795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_673828 - BLOCK
      ?auto_673829 - BLOCK
      ?auto_673830 - BLOCK
      ?auto_673831 - BLOCK
      ?auto_673832 - BLOCK
      ?auto_673833 - BLOCK
      ?auto_673834 - BLOCK
      ?auto_673835 - BLOCK
      ?auto_673836 - BLOCK
      ?auto_673837 - BLOCK
    )
    :vars
    (
      ?auto_673838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673837 ?auto_673838 ) ( ON-TABLE ?auto_673828 ) ( ON ?auto_673829 ?auto_673828 ) ( ON ?auto_673830 ?auto_673829 ) ( ON ?auto_673831 ?auto_673830 ) ( ON ?auto_673832 ?auto_673831 ) ( ON ?auto_673833 ?auto_673832 ) ( ON ?auto_673834 ?auto_673833 ) ( not ( = ?auto_673828 ?auto_673829 ) ) ( not ( = ?auto_673828 ?auto_673830 ) ) ( not ( = ?auto_673828 ?auto_673831 ) ) ( not ( = ?auto_673828 ?auto_673832 ) ) ( not ( = ?auto_673828 ?auto_673833 ) ) ( not ( = ?auto_673828 ?auto_673834 ) ) ( not ( = ?auto_673828 ?auto_673835 ) ) ( not ( = ?auto_673828 ?auto_673836 ) ) ( not ( = ?auto_673828 ?auto_673837 ) ) ( not ( = ?auto_673828 ?auto_673838 ) ) ( not ( = ?auto_673829 ?auto_673830 ) ) ( not ( = ?auto_673829 ?auto_673831 ) ) ( not ( = ?auto_673829 ?auto_673832 ) ) ( not ( = ?auto_673829 ?auto_673833 ) ) ( not ( = ?auto_673829 ?auto_673834 ) ) ( not ( = ?auto_673829 ?auto_673835 ) ) ( not ( = ?auto_673829 ?auto_673836 ) ) ( not ( = ?auto_673829 ?auto_673837 ) ) ( not ( = ?auto_673829 ?auto_673838 ) ) ( not ( = ?auto_673830 ?auto_673831 ) ) ( not ( = ?auto_673830 ?auto_673832 ) ) ( not ( = ?auto_673830 ?auto_673833 ) ) ( not ( = ?auto_673830 ?auto_673834 ) ) ( not ( = ?auto_673830 ?auto_673835 ) ) ( not ( = ?auto_673830 ?auto_673836 ) ) ( not ( = ?auto_673830 ?auto_673837 ) ) ( not ( = ?auto_673830 ?auto_673838 ) ) ( not ( = ?auto_673831 ?auto_673832 ) ) ( not ( = ?auto_673831 ?auto_673833 ) ) ( not ( = ?auto_673831 ?auto_673834 ) ) ( not ( = ?auto_673831 ?auto_673835 ) ) ( not ( = ?auto_673831 ?auto_673836 ) ) ( not ( = ?auto_673831 ?auto_673837 ) ) ( not ( = ?auto_673831 ?auto_673838 ) ) ( not ( = ?auto_673832 ?auto_673833 ) ) ( not ( = ?auto_673832 ?auto_673834 ) ) ( not ( = ?auto_673832 ?auto_673835 ) ) ( not ( = ?auto_673832 ?auto_673836 ) ) ( not ( = ?auto_673832 ?auto_673837 ) ) ( not ( = ?auto_673832 ?auto_673838 ) ) ( not ( = ?auto_673833 ?auto_673834 ) ) ( not ( = ?auto_673833 ?auto_673835 ) ) ( not ( = ?auto_673833 ?auto_673836 ) ) ( not ( = ?auto_673833 ?auto_673837 ) ) ( not ( = ?auto_673833 ?auto_673838 ) ) ( not ( = ?auto_673834 ?auto_673835 ) ) ( not ( = ?auto_673834 ?auto_673836 ) ) ( not ( = ?auto_673834 ?auto_673837 ) ) ( not ( = ?auto_673834 ?auto_673838 ) ) ( not ( = ?auto_673835 ?auto_673836 ) ) ( not ( = ?auto_673835 ?auto_673837 ) ) ( not ( = ?auto_673835 ?auto_673838 ) ) ( not ( = ?auto_673836 ?auto_673837 ) ) ( not ( = ?auto_673836 ?auto_673838 ) ) ( not ( = ?auto_673837 ?auto_673838 ) ) ( ON ?auto_673836 ?auto_673837 ) ( CLEAR ?auto_673834 ) ( ON ?auto_673835 ?auto_673836 ) ( CLEAR ?auto_673835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_673828 ?auto_673829 ?auto_673830 ?auto_673831 ?auto_673832 ?auto_673833 ?auto_673834 ?auto_673835 )
      ( MAKE-10PILE ?auto_673828 ?auto_673829 ?auto_673830 ?auto_673831 ?auto_673832 ?auto_673833 ?auto_673834 ?auto_673835 ?auto_673836 ?auto_673837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_673870 - BLOCK
      ?auto_673871 - BLOCK
      ?auto_673872 - BLOCK
      ?auto_673873 - BLOCK
      ?auto_673874 - BLOCK
      ?auto_673875 - BLOCK
      ?auto_673876 - BLOCK
      ?auto_673877 - BLOCK
      ?auto_673878 - BLOCK
      ?auto_673879 - BLOCK
    )
    :vars
    (
      ?auto_673880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673879 ?auto_673880 ) ( ON-TABLE ?auto_673870 ) ( ON ?auto_673871 ?auto_673870 ) ( ON ?auto_673872 ?auto_673871 ) ( ON ?auto_673873 ?auto_673872 ) ( ON ?auto_673874 ?auto_673873 ) ( ON ?auto_673875 ?auto_673874 ) ( not ( = ?auto_673870 ?auto_673871 ) ) ( not ( = ?auto_673870 ?auto_673872 ) ) ( not ( = ?auto_673870 ?auto_673873 ) ) ( not ( = ?auto_673870 ?auto_673874 ) ) ( not ( = ?auto_673870 ?auto_673875 ) ) ( not ( = ?auto_673870 ?auto_673876 ) ) ( not ( = ?auto_673870 ?auto_673877 ) ) ( not ( = ?auto_673870 ?auto_673878 ) ) ( not ( = ?auto_673870 ?auto_673879 ) ) ( not ( = ?auto_673870 ?auto_673880 ) ) ( not ( = ?auto_673871 ?auto_673872 ) ) ( not ( = ?auto_673871 ?auto_673873 ) ) ( not ( = ?auto_673871 ?auto_673874 ) ) ( not ( = ?auto_673871 ?auto_673875 ) ) ( not ( = ?auto_673871 ?auto_673876 ) ) ( not ( = ?auto_673871 ?auto_673877 ) ) ( not ( = ?auto_673871 ?auto_673878 ) ) ( not ( = ?auto_673871 ?auto_673879 ) ) ( not ( = ?auto_673871 ?auto_673880 ) ) ( not ( = ?auto_673872 ?auto_673873 ) ) ( not ( = ?auto_673872 ?auto_673874 ) ) ( not ( = ?auto_673872 ?auto_673875 ) ) ( not ( = ?auto_673872 ?auto_673876 ) ) ( not ( = ?auto_673872 ?auto_673877 ) ) ( not ( = ?auto_673872 ?auto_673878 ) ) ( not ( = ?auto_673872 ?auto_673879 ) ) ( not ( = ?auto_673872 ?auto_673880 ) ) ( not ( = ?auto_673873 ?auto_673874 ) ) ( not ( = ?auto_673873 ?auto_673875 ) ) ( not ( = ?auto_673873 ?auto_673876 ) ) ( not ( = ?auto_673873 ?auto_673877 ) ) ( not ( = ?auto_673873 ?auto_673878 ) ) ( not ( = ?auto_673873 ?auto_673879 ) ) ( not ( = ?auto_673873 ?auto_673880 ) ) ( not ( = ?auto_673874 ?auto_673875 ) ) ( not ( = ?auto_673874 ?auto_673876 ) ) ( not ( = ?auto_673874 ?auto_673877 ) ) ( not ( = ?auto_673874 ?auto_673878 ) ) ( not ( = ?auto_673874 ?auto_673879 ) ) ( not ( = ?auto_673874 ?auto_673880 ) ) ( not ( = ?auto_673875 ?auto_673876 ) ) ( not ( = ?auto_673875 ?auto_673877 ) ) ( not ( = ?auto_673875 ?auto_673878 ) ) ( not ( = ?auto_673875 ?auto_673879 ) ) ( not ( = ?auto_673875 ?auto_673880 ) ) ( not ( = ?auto_673876 ?auto_673877 ) ) ( not ( = ?auto_673876 ?auto_673878 ) ) ( not ( = ?auto_673876 ?auto_673879 ) ) ( not ( = ?auto_673876 ?auto_673880 ) ) ( not ( = ?auto_673877 ?auto_673878 ) ) ( not ( = ?auto_673877 ?auto_673879 ) ) ( not ( = ?auto_673877 ?auto_673880 ) ) ( not ( = ?auto_673878 ?auto_673879 ) ) ( not ( = ?auto_673878 ?auto_673880 ) ) ( not ( = ?auto_673879 ?auto_673880 ) ) ( ON ?auto_673878 ?auto_673879 ) ( ON ?auto_673877 ?auto_673878 ) ( CLEAR ?auto_673875 ) ( ON ?auto_673876 ?auto_673877 ) ( CLEAR ?auto_673876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_673870 ?auto_673871 ?auto_673872 ?auto_673873 ?auto_673874 ?auto_673875 ?auto_673876 )
      ( MAKE-10PILE ?auto_673870 ?auto_673871 ?auto_673872 ?auto_673873 ?auto_673874 ?auto_673875 ?auto_673876 ?auto_673877 ?auto_673878 ?auto_673879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_673912 - BLOCK
      ?auto_673913 - BLOCK
      ?auto_673914 - BLOCK
      ?auto_673915 - BLOCK
      ?auto_673916 - BLOCK
      ?auto_673917 - BLOCK
      ?auto_673918 - BLOCK
      ?auto_673919 - BLOCK
      ?auto_673920 - BLOCK
      ?auto_673921 - BLOCK
    )
    :vars
    (
      ?auto_673922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673921 ?auto_673922 ) ( ON-TABLE ?auto_673912 ) ( ON ?auto_673913 ?auto_673912 ) ( ON ?auto_673914 ?auto_673913 ) ( ON ?auto_673915 ?auto_673914 ) ( ON ?auto_673916 ?auto_673915 ) ( not ( = ?auto_673912 ?auto_673913 ) ) ( not ( = ?auto_673912 ?auto_673914 ) ) ( not ( = ?auto_673912 ?auto_673915 ) ) ( not ( = ?auto_673912 ?auto_673916 ) ) ( not ( = ?auto_673912 ?auto_673917 ) ) ( not ( = ?auto_673912 ?auto_673918 ) ) ( not ( = ?auto_673912 ?auto_673919 ) ) ( not ( = ?auto_673912 ?auto_673920 ) ) ( not ( = ?auto_673912 ?auto_673921 ) ) ( not ( = ?auto_673912 ?auto_673922 ) ) ( not ( = ?auto_673913 ?auto_673914 ) ) ( not ( = ?auto_673913 ?auto_673915 ) ) ( not ( = ?auto_673913 ?auto_673916 ) ) ( not ( = ?auto_673913 ?auto_673917 ) ) ( not ( = ?auto_673913 ?auto_673918 ) ) ( not ( = ?auto_673913 ?auto_673919 ) ) ( not ( = ?auto_673913 ?auto_673920 ) ) ( not ( = ?auto_673913 ?auto_673921 ) ) ( not ( = ?auto_673913 ?auto_673922 ) ) ( not ( = ?auto_673914 ?auto_673915 ) ) ( not ( = ?auto_673914 ?auto_673916 ) ) ( not ( = ?auto_673914 ?auto_673917 ) ) ( not ( = ?auto_673914 ?auto_673918 ) ) ( not ( = ?auto_673914 ?auto_673919 ) ) ( not ( = ?auto_673914 ?auto_673920 ) ) ( not ( = ?auto_673914 ?auto_673921 ) ) ( not ( = ?auto_673914 ?auto_673922 ) ) ( not ( = ?auto_673915 ?auto_673916 ) ) ( not ( = ?auto_673915 ?auto_673917 ) ) ( not ( = ?auto_673915 ?auto_673918 ) ) ( not ( = ?auto_673915 ?auto_673919 ) ) ( not ( = ?auto_673915 ?auto_673920 ) ) ( not ( = ?auto_673915 ?auto_673921 ) ) ( not ( = ?auto_673915 ?auto_673922 ) ) ( not ( = ?auto_673916 ?auto_673917 ) ) ( not ( = ?auto_673916 ?auto_673918 ) ) ( not ( = ?auto_673916 ?auto_673919 ) ) ( not ( = ?auto_673916 ?auto_673920 ) ) ( not ( = ?auto_673916 ?auto_673921 ) ) ( not ( = ?auto_673916 ?auto_673922 ) ) ( not ( = ?auto_673917 ?auto_673918 ) ) ( not ( = ?auto_673917 ?auto_673919 ) ) ( not ( = ?auto_673917 ?auto_673920 ) ) ( not ( = ?auto_673917 ?auto_673921 ) ) ( not ( = ?auto_673917 ?auto_673922 ) ) ( not ( = ?auto_673918 ?auto_673919 ) ) ( not ( = ?auto_673918 ?auto_673920 ) ) ( not ( = ?auto_673918 ?auto_673921 ) ) ( not ( = ?auto_673918 ?auto_673922 ) ) ( not ( = ?auto_673919 ?auto_673920 ) ) ( not ( = ?auto_673919 ?auto_673921 ) ) ( not ( = ?auto_673919 ?auto_673922 ) ) ( not ( = ?auto_673920 ?auto_673921 ) ) ( not ( = ?auto_673920 ?auto_673922 ) ) ( not ( = ?auto_673921 ?auto_673922 ) ) ( ON ?auto_673920 ?auto_673921 ) ( ON ?auto_673919 ?auto_673920 ) ( ON ?auto_673918 ?auto_673919 ) ( CLEAR ?auto_673916 ) ( ON ?auto_673917 ?auto_673918 ) ( CLEAR ?auto_673917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_673912 ?auto_673913 ?auto_673914 ?auto_673915 ?auto_673916 ?auto_673917 )
      ( MAKE-10PILE ?auto_673912 ?auto_673913 ?auto_673914 ?auto_673915 ?auto_673916 ?auto_673917 ?auto_673918 ?auto_673919 ?auto_673920 ?auto_673921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_673954 - BLOCK
      ?auto_673955 - BLOCK
      ?auto_673956 - BLOCK
      ?auto_673957 - BLOCK
      ?auto_673958 - BLOCK
      ?auto_673959 - BLOCK
      ?auto_673960 - BLOCK
      ?auto_673961 - BLOCK
      ?auto_673962 - BLOCK
      ?auto_673963 - BLOCK
    )
    :vars
    (
      ?auto_673964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673963 ?auto_673964 ) ( ON-TABLE ?auto_673954 ) ( ON ?auto_673955 ?auto_673954 ) ( ON ?auto_673956 ?auto_673955 ) ( ON ?auto_673957 ?auto_673956 ) ( not ( = ?auto_673954 ?auto_673955 ) ) ( not ( = ?auto_673954 ?auto_673956 ) ) ( not ( = ?auto_673954 ?auto_673957 ) ) ( not ( = ?auto_673954 ?auto_673958 ) ) ( not ( = ?auto_673954 ?auto_673959 ) ) ( not ( = ?auto_673954 ?auto_673960 ) ) ( not ( = ?auto_673954 ?auto_673961 ) ) ( not ( = ?auto_673954 ?auto_673962 ) ) ( not ( = ?auto_673954 ?auto_673963 ) ) ( not ( = ?auto_673954 ?auto_673964 ) ) ( not ( = ?auto_673955 ?auto_673956 ) ) ( not ( = ?auto_673955 ?auto_673957 ) ) ( not ( = ?auto_673955 ?auto_673958 ) ) ( not ( = ?auto_673955 ?auto_673959 ) ) ( not ( = ?auto_673955 ?auto_673960 ) ) ( not ( = ?auto_673955 ?auto_673961 ) ) ( not ( = ?auto_673955 ?auto_673962 ) ) ( not ( = ?auto_673955 ?auto_673963 ) ) ( not ( = ?auto_673955 ?auto_673964 ) ) ( not ( = ?auto_673956 ?auto_673957 ) ) ( not ( = ?auto_673956 ?auto_673958 ) ) ( not ( = ?auto_673956 ?auto_673959 ) ) ( not ( = ?auto_673956 ?auto_673960 ) ) ( not ( = ?auto_673956 ?auto_673961 ) ) ( not ( = ?auto_673956 ?auto_673962 ) ) ( not ( = ?auto_673956 ?auto_673963 ) ) ( not ( = ?auto_673956 ?auto_673964 ) ) ( not ( = ?auto_673957 ?auto_673958 ) ) ( not ( = ?auto_673957 ?auto_673959 ) ) ( not ( = ?auto_673957 ?auto_673960 ) ) ( not ( = ?auto_673957 ?auto_673961 ) ) ( not ( = ?auto_673957 ?auto_673962 ) ) ( not ( = ?auto_673957 ?auto_673963 ) ) ( not ( = ?auto_673957 ?auto_673964 ) ) ( not ( = ?auto_673958 ?auto_673959 ) ) ( not ( = ?auto_673958 ?auto_673960 ) ) ( not ( = ?auto_673958 ?auto_673961 ) ) ( not ( = ?auto_673958 ?auto_673962 ) ) ( not ( = ?auto_673958 ?auto_673963 ) ) ( not ( = ?auto_673958 ?auto_673964 ) ) ( not ( = ?auto_673959 ?auto_673960 ) ) ( not ( = ?auto_673959 ?auto_673961 ) ) ( not ( = ?auto_673959 ?auto_673962 ) ) ( not ( = ?auto_673959 ?auto_673963 ) ) ( not ( = ?auto_673959 ?auto_673964 ) ) ( not ( = ?auto_673960 ?auto_673961 ) ) ( not ( = ?auto_673960 ?auto_673962 ) ) ( not ( = ?auto_673960 ?auto_673963 ) ) ( not ( = ?auto_673960 ?auto_673964 ) ) ( not ( = ?auto_673961 ?auto_673962 ) ) ( not ( = ?auto_673961 ?auto_673963 ) ) ( not ( = ?auto_673961 ?auto_673964 ) ) ( not ( = ?auto_673962 ?auto_673963 ) ) ( not ( = ?auto_673962 ?auto_673964 ) ) ( not ( = ?auto_673963 ?auto_673964 ) ) ( ON ?auto_673962 ?auto_673963 ) ( ON ?auto_673961 ?auto_673962 ) ( ON ?auto_673960 ?auto_673961 ) ( ON ?auto_673959 ?auto_673960 ) ( CLEAR ?auto_673957 ) ( ON ?auto_673958 ?auto_673959 ) ( CLEAR ?auto_673958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_673954 ?auto_673955 ?auto_673956 ?auto_673957 ?auto_673958 )
      ( MAKE-10PILE ?auto_673954 ?auto_673955 ?auto_673956 ?auto_673957 ?auto_673958 ?auto_673959 ?auto_673960 ?auto_673961 ?auto_673962 ?auto_673963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_673996 - BLOCK
      ?auto_673997 - BLOCK
      ?auto_673998 - BLOCK
      ?auto_673999 - BLOCK
      ?auto_674000 - BLOCK
      ?auto_674001 - BLOCK
      ?auto_674002 - BLOCK
      ?auto_674003 - BLOCK
      ?auto_674004 - BLOCK
      ?auto_674005 - BLOCK
    )
    :vars
    (
      ?auto_674006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674005 ?auto_674006 ) ( ON-TABLE ?auto_673996 ) ( ON ?auto_673997 ?auto_673996 ) ( ON ?auto_673998 ?auto_673997 ) ( not ( = ?auto_673996 ?auto_673997 ) ) ( not ( = ?auto_673996 ?auto_673998 ) ) ( not ( = ?auto_673996 ?auto_673999 ) ) ( not ( = ?auto_673996 ?auto_674000 ) ) ( not ( = ?auto_673996 ?auto_674001 ) ) ( not ( = ?auto_673996 ?auto_674002 ) ) ( not ( = ?auto_673996 ?auto_674003 ) ) ( not ( = ?auto_673996 ?auto_674004 ) ) ( not ( = ?auto_673996 ?auto_674005 ) ) ( not ( = ?auto_673996 ?auto_674006 ) ) ( not ( = ?auto_673997 ?auto_673998 ) ) ( not ( = ?auto_673997 ?auto_673999 ) ) ( not ( = ?auto_673997 ?auto_674000 ) ) ( not ( = ?auto_673997 ?auto_674001 ) ) ( not ( = ?auto_673997 ?auto_674002 ) ) ( not ( = ?auto_673997 ?auto_674003 ) ) ( not ( = ?auto_673997 ?auto_674004 ) ) ( not ( = ?auto_673997 ?auto_674005 ) ) ( not ( = ?auto_673997 ?auto_674006 ) ) ( not ( = ?auto_673998 ?auto_673999 ) ) ( not ( = ?auto_673998 ?auto_674000 ) ) ( not ( = ?auto_673998 ?auto_674001 ) ) ( not ( = ?auto_673998 ?auto_674002 ) ) ( not ( = ?auto_673998 ?auto_674003 ) ) ( not ( = ?auto_673998 ?auto_674004 ) ) ( not ( = ?auto_673998 ?auto_674005 ) ) ( not ( = ?auto_673998 ?auto_674006 ) ) ( not ( = ?auto_673999 ?auto_674000 ) ) ( not ( = ?auto_673999 ?auto_674001 ) ) ( not ( = ?auto_673999 ?auto_674002 ) ) ( not ( = ?auto_673999 ?auto_674003 ) ) ( not ( = ?auto_673999 ?auto_674004 ) ) ( not ( = ?auto_673999 ?auto_674005 ) ) ( not ( = ?auto_673999 ?auto_674006 ) ) ( not ( = ?auto_674000 ?auto_674001 ) ) ( not ( = ?auto_674000 ?auto_674002 ) ) ( not ( = ?auto_674000 ?auto_674003 ) ) ( not ( = ?auto_674000 ?auto_674004 ) ) ( not ( = ?auto_674000 ?auto_674005 ) ) ( not ( = ?auto_674000 ?auto_674006 ) ) ( not ( = ?auto_674001 ?auto_674002 ) ) ( not ( = ?auto_674001 ?auto_674003 ) ) ( not ( = ?auto_674001 ?auto_674004 ) ) ( not ( = ?auto_674001 ?auto_674005 ) ) ( not ( = ?auto_674001 ?auto_674006 ) ) ( not ( = ?auto_674002 ?auto_674003 ) ) ( not ( = ?auto_674002 ?auto_674004 ) ) ( not ( = ?auto_674002 ?auto_674005 ) ) ( not ( = ?auto_674002 ?auto_674006 ) ) ( not ( = ?auto_674003 ?auto_674004 ) ) ( not ( = ?auto_674003 ?auto_674005 ) ) ( not ( = ?auto_674003 ?auto_674006 ) ) ( not ( = ?auto_674004 ?auto_674005 ) ) ( not ( = ?auto_674004 ?auto_674006 ) ) ( not ( = ?auto_674005 ?auto_674006 ) ) ( ON ?auto_674004 ?auto_674005 ) ( ON ?auto_674003 ?auto_674004 ) ( ON ?auto_674002 ?auto_674003 ) ( ON ?auto_674001 ?auto_674002 ) ( ON ?auto_674000 ?auto_674001 ) ( CLEAR ?auto_673998 ) ( ON ?auto_673999 ?auto_674000 ) ( CLEAR ?auto_673999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_673996 ?auto_673997 ?auto_673998 ?auto_673999 )
      ( MAKE-10PILE ?auto_673996 ?auto_673997 ?auto_673998 ?auto_673999 ?auto_674000 ?auto_674001 ?auto_674002 ?auto_674003 ?auto_674004 ?auto_674005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_674038 - BLOCK
      ?auto_674039 - BLOCK
      ?auto_674040 - BLOCK
      ?auto_674041 - BLOCK
      ?auto_674042 - BLOCK
      ?auto_674043 - BLOCK
      ?auto_674044 - BLOCK
      ?auto_674045 - BLOCK
      ?auto_674046 - BLOCK
      ?auto_674047 - BLOCK
    )
    :vars
    (
      ?auto_674048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674047 ?auto_674048 ) ( ON-TABLE ?auto_674038 ) ( ON ?auto_674039 ?auto_674038 ) ( not ( = ?auto_674038 ?auto_674039 ) ) ( not ( = ?auto_674038 ?auto_674040 ) ) ( not ( = ?auto_674038 ?auto_674041 ) ) ( not ( = ?auto_674038 ?auto_674042 ) ) ( not ( = ?auto_674038 ?auto_674043 ) ) ( not ( = ?auto_674038 ?auto_674044 ) ) ( not ( = ?auto_674038 ?auto_674045 ) ) ( not ( = ?auto_674038 ?auto_674046 ) ) ( not ( = ?auto_674038 ?auto_674047 ) ) ( not ( = ?auto_674038 ?auto_674048 ) ) ( not ( = ?auto_674039 ?auto_674040 ) ) ( not ( = ?auto_674039 ?auto_674041 ) ) ( not ( = ?auto_674039 ?auto_674042 ) ) ( not ( = ?auto_674039 ?auto_674043 ) ) ( not ( = ?auto_674039 ?auto_674044 ) ) ( not ( = ?auto_674039 ?auto_674045 ) ) ( not ( = ?auto_674039 ?auto_674046 ) ) ( not ( = ?auto_674039 ?auto_674047 ) ) ( not ( = ?auto_674039 ?auto_674048 ) ) ( not ( = ?auto_674040 ?auto_674041 ) ) ( not ( = ?auto_674040 ?auto_674042 ) ) ( not ( = ?auto_674040 ?auto_674043 ) ) ( not ( = ?auto_674040 ?auto_674044 ) ) ( not ( = ?auto_674040 ?auto_674045 ) ) ( not ( = ?auto_674040 ?auto_674046 ) ) ( not ( = ?auto_674040 ?auto_674047 ) ) ( not ( = ?auto_674040 ?auto_674048 ) ) ( not ( = ?auto_674041 ?auto_674042 ) ) ( not ( = ?auto_674041 ?auto_674043 ) ) ( not ( = ?auto_674041 ?auto_674044 ) ) ( not ( = ?auto_674041 ?auto_674045 ) ) ( not ( = ?auto_674041 ?auto_674046 ) ) ( not ( = ?auto_674041 ?auto_674047 ) ) ( not ( = ?auto_674041 ?auto_674048 ) ) ( not ( = ?auto_674042 ?auto_674043 ) ) ( not ( = ?auto_674042 ?auto_674044 ) ) ( not ( = ?auto_674042 ?auto_674045 ) ) ( not ( = ?auto_674042 ?auto_674046 ) ) ( not ( = ?auto_674042 ?auto_674047 ) ) ( not ( = ?auto_674042 ?auto_674048 ) ) ( not ( = ?auto_674043 ?auto_674044 ) ) ( not ( = ?auto_674043 ?auto_674045 ) ) ( not ( = ?auto_674043 ?auto_674046 ) ) ( not ( = ?auto_674043 ?auto_674047 ) ) ( not ( = ?auto_674043 ?auto_674048 ) ) ( not ( = ?auto_674044 ?auto_674045 ) ) ( not ( = ?auto_674044 ?auto_674046 ) ) ( not ( = ?auto_674044 ?auto_674047 ) ) ( not ( = ?auto_674044 ?auto_674048 ) ) ( not ( = ?auto_674045 ?auto_674046 ) ) ( not ( = ?auto_674045 ?auto_674047 ) ) ( not ( = ?auto_674045 ?auto_674048 ) ) ( not ( = ?auto_674046 ?auto_674047 ) ) ( not ( = ?auto_674046 ?auto_674048 ) ) ( not ( = ?auto_674047 ?auto_674048 ) ) ( ON ?auto_674046 ?auto_674047 ) ( ON ?auto_674045 ?auto_674046 ) ( ON ?auto_674044 ?auto_674045 ) ( ON ?auto_674043 ?auto_674044 ) ( ON ?auto_674042 ?auto_674043 ) ( ON ?auto_674041 ?auto_674042 ) ( CLEAR ?auto_674039 ) ( ON ?auto_674040 ?auto_674041 ) ( CLEAR ?auto_674040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_674038 ?auto_674039 ?auto_674040 )
      ( MAKE-10PILE ?auto_674038 ?auto_674039 ?auto_674040 ?auto_674041 ?auto_674042 ?auto_674043 ?auto_674044 ?auto_674045 ?auto_674046 ?auto_674047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_674080 - BLOCK
      ?auto_674081 - BLOCK
      ?auto_674082 - BLOCK
      ?auto_674083 - BLOCK
      ?auto_674084 - BLOCK
      ?auto_674085 - BLOCK
      ?auto_674086 - BLOCK
      ?auto_674087 - BLOCK
      ?auto_674088 - BLOCK
      ?auto_674089 - BLOCK
    )
    :vars
    (
      ?auto_674090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674089 ?auto_674090 ) ( ON-TABLE ?auto_674080 ) ( not ( = ?auto_674080 ?auto_674081 ) ) ( not ( = ?auto_674080 ?auto_674082 ) ) ( not ( = ?auto_674080 ?auto_674083 ) ) ( not ( = ?auto_674080 ?auto_674084 ) ) ( not ( = ?auto_674080 ?auto_674085 ) ) ( not ( = ?auto_674080 ?auto_674086 ) ) ( not ( = ?auto_674080 ?auto_674087 ) ) ( not ( = ?auto_674080 ?auto_674088 ) ) ( not ( = ?auto_674080 ?auto_674089 ) ) ( not ( = ?auto_674080 ?auto_674090 ) ) ( not ( = ?auto_674081 ?auto_674082 ) ) ( not ( = ?auto_674081 ?auto_674083 ) ) ( not ( = ?auto_674081 ?auto_674084 ) ) ( not ( = ?auto_674081 ?auto_674085 ) ) ( not ( = ?auto_674081 ?auto_674086 ) ) ( not ( = ?auto_674081 ?auto_674087 ) ) ( not ( = ?auto_674081 ?auto_674088 ) ) ( not ( = ?auto_674081 ?auto_674089 ) ) ( not ( = ?auto_674081 ?auto_674090 ) ) ( not ( = ?auto_674082 ?auto_674083 ) ) ( not ( = ?auto_674082 ?auto_674084 ) ) ( not ( = ?auto_674082 ?auto_674085 ) ) ( not ( = ?auto_674082 ?auto_674086 ) ) ( not ( = ?auto_674082 ?auto_674087 ) ) ( not ( = ?auto_674082 ?auto_674088 ) ) ( not ( = ?auto_674082 ?auto_674089 ) ) ( not ( = ?auto_674082 ?auto_674090 ) ) ( not ( = ?auto_674083 ?auto_674084 ) ) ( not ( = ?auto_674083 ?auto_674085 ) ) ( not ( = ?auto_674083 ?auto_674086 ) ) ( not ( = ?auto_674083 ?auto_674087 ) ) ( not ( = ?auto_674083 ?auto_674088 ) ) ( not ( = ?auto_674083 ?auto_674089 ) ) ( not ( = ?auto_674083 ?auto_674090 ) ) ( not ( = ?auto_674084 ?auto_674085 ) ) ( not ( = ?auto_674084 ?auto_674086 ) ) ( not ( = ?auto_674084 ?auto_674087 ) ) ( not ( = ?auto_674084 ?auto_674088 ) ) ( not ( = ?auto_674084 ?auto_674089 ) ) ( not ( = ?auto_674084 ?auto_674090 ) ) ( not ( = ?auto_674085 ?auto_674086 ) ) ( not ( = ?auto_674085 ?auto_674087 ) ) ( not ( = ?auto_674085 ?auto_674088 ) ) ( not ( = ?auto_674085 ?auto_674089 ) ) ( not ( = ?auto_674085 ?auto_674090 ) ) ( not ( = ?auto_674086 ?auto_674087 ) ) ( not ( = ?auto_674086 ?auto_674088 ) ) ( not ( = ?auto_674086 ?auto_674089 ) ) ( not ( = ?auto_674086 ?auto_674090 ) ) ( not ( = ?auto_674087 ?auto_674088 ) ) ( not ( = ?auto_674087 ?auto_674089 ) ) ( not ( = ?auto_674087 ?auto_674090 ) ) ( not ( = ?auto_674088 ?auto_674089 ) ) ( not ( = ?auto_674088 ?auto_674090 ) ) ( not ( = ?auto_674089 ?auto_674090 ) ) ( ON ?auto_674088 ?auto_674089 ) ( ON ?auto_674087 ?auto_674088 ) ( ON ?auto_674086 ?auto_674087 ) ( ON ?auto_674085 ?auto_674086 ) ( ON ?auto_674084 ?auto_674085 ) ( ON ?auto_674083 ?auto_674084 ) ( ON ?auto_674082 ?auto_674083 ) ( CLEAR ?auto_674080 ) ( ON ?auto_674081 ?auto_674082 ) ( CLEAR ?auto_674081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_674080 ?auto_674081 )
      ( MAKE-10PILE ?auto_674080 ?auto_674081 ?auto_674082 ?auto_674083 ?auto_674084 ?auto_674085 ?auto_674086 ?auto_674087 ?auto_674088 ?auto_674089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_674122 - BLOCK
      ?auto_674123 - BLOCK
      ?auto_674124 - BLOCK
      ?auto_674125 - BLOCK
      ?auto_674126 - BLOCK
      ?auto_674127 - BLOCK
      ?auto_674128 - BLOCK
      ?auto_674129 - BLOCK
      ?auto_674130 - BLOCK
      ?auto_674131 - BLOCK
    )
    :vars
    (
      ?auto_674132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674131 ?auto_674132 ) ( not ( = ?auto_674122 ?auto_674123 ) ) ( not ( = ?auto_674122 ?auto_674124 ) ) ( not ( = ?auto_674122 ?auto_674125 ) ) ( not ( = ?auto_674122 ?auto_674126 ) ) ( not ( = ?auto_674122 ?auto_674127 ) ) ( not ( = ?auto_674122 ?auto_674128 ) ) ( not ( = ?auto_674122 ?auto_674129 ) ) ( not ( = ?auto_674122 ?auto_674130 ) ) ( not ( = ?auto_674122 ?auto_674131 ) ) ( not ( = ?auto_674122 ?auto_674132 ) ) ( not ( = ?auto_674123 ?auto_674124 ) ) ( not ( = ?auto_674123 ?auto_674125 ) ) ( not ( = ?auto_674123 ?auto_674126 ) ) ( not ( = ?auto_674123 ?auto_674127 ) ) ( not ( = ?auto_674123 ?auto_674128 ) ) ( not ( = ?auto_674123 ?auto_674129 ) ) ( not ( = ?auto_674123 ?auto_674130 ) ) ( not ( = ?auto_674123 ?auto_674131 ) ) ( not ( = ?auto_674123 ?auto_674132 ) ) ( not ( = ?auto_674124 ?auto_674125 ) ) ( not ( = ?auto_674124 ?auto_674126 ) ) ( not ( = ?auto_674124 ?auto_674127 ) ) ( not ( = ?auto_674124 ?auto_674128 ) ) ( not ( = ?auto_674124 ?auto_674129 ) ) ( not ( = ?auto_674124 ?auto_674130 ) ) ( not ( = ?auto_674124 ?auto_674131 ) ) ( not ( = ?auto_674124 ?auto_674132 ) ) ( not ( = ?auto_674125 ?auto_674126 ) ) ( not ( = ?auto_674125 ?auto_674127 ) ) ( not ( = ?auto_674125 ?auto_674128 ) ) ( not ( = ?auto_674125 ?auto_674129 ) ) ( not ( = ?auto_674125 ?auto_674130 ) ) ( not ( = ?auto_674125 ?auto_674131 ) ) ( not ( = ?auto_674125 ?auto_674132 ) ) ( not ( = ?auto_674126 ?auto_674127 ) ) ( not ( = ?auto_674126 ?auto_674128 ) ) ( not ( = ?auto_674126 ?auto_674129 ) ) ( not ( = ?auto_674126 ?auto_674130 ) ) ( not ( = ?auto_674126 ?auto_674131 ) ) ( not ( = ?auto_674126 ?auto_674132 ) ) ( not ( = ?auto_674127 ?auto_674128 ) ) ( not ( = ?auto_674127 ?auto_674129 ) ) ( not ( = ?auto_674127 ?auto_674130 ) ) ( not ( = ?auto_674127 ?auto_674131 ) ) ( not ( = ?auto_674127 ?auto_674132 ) ) ( not ( = ?auto_674128 ?auto_674129 ) ) ( not ( = ?auto_674128 ?auto_674130 ) ) ( not ( = ?auto_674128 ?auto_674131 ) ) ( not ( = ?auto_674128 ?auto_674132 ) ) ( not ( = ?auto_674129 ?auto_674130 ) ) ( not ( = ?auto_674129 ?auto_674131 ) ) ( not ( = ?auto_674129 ?auto_674132 ) ) ( not ( = ?auto_674130 ?auto_674131 ) ) ( not ( = ?auto_674130 ?auto_674132 ) ) ( not ( = ?auto_674131 ?auto_674132 ) ) ( ON ?auto_674130 ?auto_674131 ) ( ON ?auto_674129 ?auto_674130 ) ( ON ?auto_674128 ?auto_674129 ) ( ON ?auto_674127 ?auto_674128 ) ( ON ?auto_674126 ?auto_674127 ) ( ON ?auto_674125 ?auto_674126 ) ( ON ?auto_674124 ?auto_674125 ) ( ON ?auto_674123 ?auto_674124 ) ( ON ?auto_674122 ?auto_674123 ) ( CLEAR ?auto_674122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_674122 )
      ( MAKE-10PILE ?auto_674122 ?auto_674123 ?auto_674124 ?auto_674125 ?auto_674126 ?auto_674127 ?auto_674128 ?auto_674129 ?auto_674130 ?auto_674131 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674165 - BLOCK
      ?auto_674166 - BLOCK
      ?auto_674167 - BLOCK
      ?auto_674168 - BLOCK
      ?auto_674169 - BLOCK
      ?auto_674170 - BLOCK
      ?auto_674171 - BLOCK
      ?auto_674172 - BLOCK
      ?auto_674173 - BLOCK
      ?auto_674174 - BLOCK
      ?auto_674175 - BLOCK
    )
    :vars
    (
      ?auto_674176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_674174 ) ( ON ?auto_674175 ?auto_674176 ) ( CLEAR ?auto_674175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_674165 ) ( ON ?auto_674166 ?auto_674165 ) ( ON ?auto_674167 ?auto_674166 ) ( ON ?auto_674168 ?auto_674167 ) ( ON ?auto_674169 ?auto_674168 ) ( ON ?auto_674170 ?auto_674169 ) ( ON ?auto_674171 ?auto_674170 ) ( ON ?auto_674172 ?auto_674171 ) ( ON ?auto_674173 ?auto_674172 ) ( ON ?auto_674174 ?auto_674173 ) ( not ( = ?auto_674165 ?auto_674166 ) ) ( not ( = ?auto_674165 ?auto_674167 ) ) ( not ( = ?auto_674165 ?auto_674168 ) ) ( not ( = ?auto_674165 ?auto_674169 ) ) ( not ( = ?auto_674165 ?auto_674170 ) ) ( not ( = ?auto_674165 ?auto_674171 ) ) ( not ( = ?auto_674165 ?auto_674172 ) ) ( not ( = ?auto_674165 ?auto_674173 ) ) ( not ( = ?auto_674165 ?auto_674174 ) ) ( not ( = ?auto_674165 ?auto_674175 ) ) ( not ( = ?auto_674165 ?auto_674176 ) ) ( not ( = ?auto_674166 ?auto_674167 ) ) ( not ( = ?auto_674166 ?auto_674168 ) ) ( not ( = ?auto_674166 ?auto_674169 ) ) ( not ( = ?auto_674166 ?auto_674170 ) ) ( not ( = ?auto_674166 ?auto_674171 ) ) ( not ( = ?auto_674166 ?auto_674172 ) ) ( not ( = ?auto_674166 ?auto_674173 ) ) ( not ( = ?auto_674166 ?auto_674174 ) ) ( not ( = ?auto_674166 ?auto_674175 ) ) ( not ( = ?auto_674166 ?auto_674176 ) ) ( not ( = ?auto_674167 ?auto_674168 ) ) ( not ( = ?auto_674167 ?auto_674169 ) ) ( not ( = ?auto_674167 ?auto_674170 ) ) ( not ( = ?auto_674167 ?auto_674171 ) ) ( not ( = ?auto_674167 ?auto_674172 ) ) ( not ( = ?auto_674167 ?auto_674173 ) ) ( not ( = ?auto_674167 ?auto_674174 ) ) ( not ( = ?auto_674167 ?auto_674175 ) ) ( not ( = ?auto_674167 ?auto_674176 ) ) ( not ( = ?auto_674168 ?auto_674169 ) ) ( not ( = ?auto_674168 ?auto_674170 ) ) ( not ( = ?auto_674168 ?auto_674171 ) ) ( not ( = ?auto_674168 ?auto_674172 ) ) ( not ( = ?auto_674168 ?auto_674173 ) ) ( not ( = ?auto_674168 ?auto_674174 ) ) ( not ( = ?auto_674168 ?auto_674175 ) ) ( not ( = ?auto_674168 ?auto_674176 ) ) ( not ( = ?auto_674169 ?auto_674170 ) ) ( not ( = ?auto_674169 ?auto_674171 ) ) ( not ( = ?auto_674169 ?auto_674172 ) ) ( not ( = ?auto_674169 ?auto_674173 ) ) ( not ( = ?auto_674169 ?auto_674174 ) ) ( not ( = ?auto_674169 ?auto_674175 ) ) ( not ( = ?auto_674169 ?auto_674176 ) ) ( not ( = ?auto_674170 ?auto_674171 ) ) ( not ( = ?auto_674170 ?auto_674172 ) ) ( not ( = ?auto_674170 ?auto_674173 ) ) ( not ( = ?auto_674170 ?auto_674174 ) ) ( not ( = ?auto_674170 ?auto_674175 ) ) ( not ( = ?auto_674170 ?auto_674176 ) ) ( not ( = ?auto_674171 ?auto_674172 ) ) ( not ( = ?auto_674171 ?auto_674173 ) ) ( not ( = ?auto_674171 ?auto_674174 ) ) ( not ( = ?auto_674171 ?auto_674175 ) ) ( not ( = ?auto_674171 ?auto_674176 ) ) ( not ( = ?auto_674172 ?auto_674173 ) ) ( not ( = ?auto_674172 ?auto_674174 ) ) ( not ( = ?auto_674172 ?auto_674175 ) ) ( not ( = ?auto_674172 ?auto_674176 ) ) ( not ( = ?auto_674173 ?auto_674174 ) ) ( not ( = ?auto_674173 ?auto_674175 ) ) ( not ( = ?auto_674173 ?auto_674176 ) ) ( not ( = ?auto_674174 ?auto_674175 ) ) ( not ( = ?auto_674174 ?auto_674176 ) ) ( not ( = ?auto_674175 ?auto_674176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_674175 ?auto_674176 )
      ( !STACK ?auto_674175 ?auto_674174 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674211 - BLOCK
      ?auto_674212 - BLOCK
      ?auto_674213 - BLOCK
      ?auto_674214 - BLOCK
      ?auto_674215 - BLOCK
      ?auto_674216 - BLOCK
      ?auto_674217 - BLOCK
      ?auto_674218 - BLOCK
      ?auto_674219 - BLOCK
      ?auto_674220 - BLOCK
      ?auto_674221 - BLOCK
    )
    :vars
    (
      ?auto_674222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674221 ?auto_674222 ) ( ON-TABLE ?auto_674211 ) ( ON ?auto_674212 ?auto_674211 ) ( ON ?auto_674213 ?auto_674212 ) ( ON ?auto_674214 ?auto_674213 ) ( ON ?auto_674215 ?auto_674214 ) ( ON ?auto_674216 ?auto_674215 ) ( ON ?auto_674217 ?auto_674216 ) ( ON ?auto_674218 ?auto_674217 ) ( ON ?auto_674219 ?auto_674218 ) ( not ( = ?auto_674211 ?auto_674212 ) ) ( not ( = ?auto_674211 ?auto_674213 ) ) ( not ( = ?auto_674211 ?auto_674214 ) ) ( not ( = ?auto_674211 ?auto_674215 ) ) ( not ( = ?auto_674211 ?auto_674216 ) ) ( not ( = ?auto_674211 ?auto_674217 ) ) ( not ( = ?auto_674211 ?auto_674218 ) ) ( not ( = ?auto_674211 ?auto_674219 ) ) ( not ( = ?auto_674211 ?auto_674220 ) ) ( not ( = ?auto_674211 ?auto_674221 ) ) ( not ( = ?auto_674211 ?auto_674222 ) ) ( not ( = ?auto_674212 ?auto_674213 ) ) ( not ( = ?auto_674212 ?auto_674214 ) ) ( not ( = ?auto_674212 ?auto_674215 ) ) ( not ( = ?auto_674212 ?auto_674216 ) ) ( not ( = ?auto_674212 ?auto_674217 ) ) ( not ( = ?auto_674212 ?auto_674218 ) ) ( not ( = ?auto_674212 ?auto_674219 ) ) ( not ( = ?auto_674212 ?auto_674220 ) ) ( not ( = ?auto_674212 ?auto_674221 ) ) ( not ( = ?auto_674212 ?auto_674222 ) ) ( not ( = ?auto_674213 ?auto_674214 ) ) ( not ( = ?auto_674213 ?auto_674215 ) ) ( not ( = ?auto_674213 ?auto_674216 ) ) ( not ( = ?auto_674213 ?auto_674217 ) ) ( not ( = ?auto_674213 ?auto_674218 ) ) ( not ( = ?auto_674213 ?auto_674219 ) ) ( not ( = ?auto_674213 ?auto_674220 ) ) ( not ( = ?auto_674213 ?auto_674221 ) ) ( not ( = ?auto_674213 ?auto_674222 ) ) ( not ( = ?auto_674214 ?auto_674215 ) ) ( not ( = ?auto_674214 ?auto_674216 ) ) ( not ( = ?auto_674214 ?auto_674217 ) ) ( not ( = ?auto_674214 ?auto_674218 ) ) ( not ( = ?auto_674214 ?auto_674219 ) ) ( not ( = ?auto_674214 ?auto_674220 ) ) ( not ( = ?auto_674214 ?auto_674221 ) ) ( not ( = ?auto_674214 ?auto_674222 ) ) ( not ( = ?auto_674215 ?auto_674216 ) ) ( not ( = ?auto_674215 ?auto_674217 ) ) ( not ( = ?auto_674215 ?auto_674218 ) ) ( not ( = ?auto_674215 ?auto_674219 ) ) ( not ( = ?auto_674215 ?auto_674220 ) ) ( not ( = ?auto_674215 ?auto_674221 ) ) ( not ( = ?auto_674215 ?auto_674222 ) ) ( not ( = ?auto_674216 ?auto_674217 ) ) ( not ( = ?auto_674216 ?auto_674218 ) ) ( not ( = ?auto_674216 ?auto_674219 ) ) ( not ( = ?auto_674216 ?auto_674220 ) ) ( not ( = ?auto_674216 ?auto_674221 ) ) ( not ( = ?auto_674216 ?auto_674222 ) ) ( not ( = ?auto_674217 ?auto_674218 ) ) ( not ( = ?auto_674217 ?auto_674219 ) ) ( not ( = ?auto_674217 ?auto_674220 ) ) ( not ( = ?auto_674217 ?auto_674221 ) ) ( not ( = ?auto_674217 ?auto_674222 ) ) ( not ( = ?auto_674218 ?auto_674219 ) ) ( not ( = ?auto_674218 ?auto_674220 ) ) ( not ( = ?auto_674218 ?auto_674221 ) ) ( not ( = ?auto_674218 ?auto_674222 ) ) ( not ( = ?auto_674219 ?auto_674220 ) ) ( not ( = ?auto_674219 ?auto_674221 ) ) ( not ( = ?auto_674219 ?auto_674222 ) ) ( not ( = ?auto_674220 ?auto_674221 ) ) ( not ( = ?auto_674220 ?auto_674222 ) ) ( not ( = ?auto_674221 ?auto_674222 ) ) ( CLEAR ?auto_674219 ) ( ON ?auto_674220 ?auto_674221 ) ( CLEAR ?auto_674220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_674211 ?auto_674212 ?auto_674213 ?auto_674214 ?auto_674215 ?auto_674216 ?auto_674217 ?auto_674218 ?auto_674219 ?auto_674220 )
      ( MAKE-11PILE ?auto_674211 ?auto_674212 ?auto_674213 ?auto_674214 ?auto_674215 ?auto_674216 ?auto_674217 ?auto_674218 ?auto_674219 ?auto_674220 ?auto_674221 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674257 - BLOCK
      ?auto_674258 - BLOCK
      ?auto_674259 - BLOCK
      ?auto_674260 - BLOCK
      ?auto_674261 - BLOCK
      ?auto_674262 - BLOCK
      ?auto_674263 - BLOCK
      ?auto_674264 - BLOCK
      ?auto_674265 - BLOCK
      ?auto_674266 - BLOCK
      ?auto_674267 - BLOCK
    )
    :vars
    (
      ?auto_674268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674267 ?auto_674268 ) ( ON-TABLE ?auto_674257 ) ( ON ?auto_674258 ?auto_674257 ) ( ON ?auto_674259 ?auto_674258 ) ( ON ?auto_674260 ?auto_674259 ) ( ON ?auto_674261 ?auto_674260 ) ( ON ?auto_674262 ?auto_674261 ) ( ON ?auto_674263 ?auto_674262 ) ( ON ?auto_674264 ?auto_674263 ) ( not ( = ?auto_674257 ?auto_674258 ) ) ( not ( = ?auto_674257 ?auto_674259 ) ) ( not ( = ?auto_674257 ?auto_674260 ) ) ( not ( = ?auto_674257 ?auto_674261 ) ) ( not ( = ?auto_674257 ?auto_674262 ) ) ( not ( = ?auto_674257 ?auto_674263 ) ) ( not ( = ?auto_674257 ?auto_674264 ) ) ( not ( = ?auto_674257 ?auto_674265 ) ) ( not ( = ?auto_674257 ?auto_674266 ) ) ( not ( = ?auto_674257 ?auto_674267 ) ) ( not ( = ?auto_674257 ?auto_674268 ) ) ( not ( = ?auto_674258 ?auto_674259 ) ) ( not ( = ?auto_674258 ?auto_674260 ) ) ( not ( = ?auto_674258 ?auto_674261 ) ) ( not ( = ?auto_674258 ?auto_674262 ) ) ( not ( = ?auto_674258 ?auto_674263 ) ) ( not ( = ?auto_674258 ?auto_674264 ) ) ( not ( = ?auto_674258 ?auto_674265 ) ) ( not ( = ?auto_674258 ?auto_674266 ) ) ( not ( = ?auto_674258 ?auto_674267 ) ) ( not ( = ?auto_674258 ?auto_674268 ) ) ( not ( = ?auto_674259 ?auto_674260 ) ) ( not ( = ?auto_674259 ?auto_674261 ) ) ( not ( = ?auto_674259 ?auto_674262 ) ) ( not ( = ?auto_674259 ?auto_674263 ) ) ( not ( = ?auto_674259 ?auto_674264 ) ) ( not ( = ?auto_674259 ?auto_674265 ) ) ( not ( = ?auto_674259 ?auto_674266 ) ) ( not ( = ?auto_674259 ?auto_674267 ) ) ( not ( = ?auto_674259 ?auto_674268 ) ) ( not ( = ?auto_674260 ?auto_674261 ) ) ( not ( = ?auto_674260 ?auto_674262 ) ) ( not ( = ?auto_674260 ?auto_674263 ) ) ( not ( = ?auto_674260 ?auto_674264 ) ) ( not ( = ?auto_674260 ?auto_674265 ) ) ( not ( = ?auto_674260 ?auto_674266 ) ) ( not ( = ?auto_674260 ?auto_674267 ) ) ( not ( = ?auto_674260 ?auto_674268 ) ) ( not ( = ?auto_674261 ?auto_674262 ) ) ( not ( = ?auto_674261 ?auto_674263 ) ) ( not ( = ?auto_674261 ?auto_674264 ) ) ( not ( = ?auto_674261 ?auto_674265 ) ) ( not ( = ?auto_674261 ?auto_674266 ) ) ( not ( = ?auto_674261 ?auto_674267 ) ) ( not ( = ?auto_674261 ?auto_674268 ) ) ( not ( = ?auto_674262 ?auto_674263 ) ) ( not ( = ?auto_674262 ?auto_674264 ) ) ( not ( = ?auto_674262 ?auto_674265 ) ) ( not ( = ?auto_674262 ?auto_674266 ) ) ( not ( = ?auto_674262 ?auto_674267 ) ) ( not ( = ?auto_674262 ?auto_674268 ) ) ( not ( = ?auto_674263 ?auto_674264 ) ) ( not ( = ?auto_674263 ?auto_674265 ) ) ( not ( = ?auto_674263 ?auto_674266 ) ) ( not ( = ?auto_674263 ?auto_674267 ) ) ( not ( = ?auto_674263 ?auto_674268 ) ) ( not ( = ?auto_674264 ?auto_674265 ) ) ( not ( = ?auto_674264 ?auto_674266 ) ) ( not ( = ?auto_674264 ?auto_674267 ) ) ( not ( = ?auto_674264 ?auto_674268 ) ) ( not ( = ?auto_674265 ?auto_674266 ) ) ( not ( = ?auto_674265 ?auto_674267 ) ) ( not ( = ?auto_674265 ?auto_674268 ) ) ( not ( = ?auto_674266 ?auto_674267 ) ) ( not ( = ?auto_674266 ?auto_674268 ) ) ( not ( = ?auto_674267 ?auto_674268 ) ) ( ON ?auto_674266 ?auto_674267 ) ( CLEAR ?auto_674264 ) ( ON ?auto_674265 ?auto_674266 ) ( CLEAR ?auto_674265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_674257 ?auto_674258 ?auto_674259 ?auto_674260 ?auto_674261 ?auto_674262 ?auto_674263 ?auto_674264 ?auto_674265 )
      ( MAKE-11PILE ?auto_674257 ?auto_674258 ?auto_674259 ?auto_674260 ?auto_674261 ?auto_674262 ?auto_674263 ?auto_674264 ?auto_674265 ?auto_674266 ?auto_674267 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674303 - BLOCK
      ?auto_674304 - BLOCK
      ?auto_674305 - BLOCK
      ?auto_674306 - BLOCK
      ?auto_674307 - BLOCK
      ?auto_674308 - BLOCK
      ?auto_674309 - BLOCK
      ?auto_674310 - BLOCK
      ?auto_674311 - BLOCK
      ?auto_674312 - BLOCK
      ?auto_674313 - BLOCK
    )
    :vars
    (
      ?auto_674314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674313 ?auto_674314 ) ( ON-TABLE ?auto_674303 ) ( ON ?auto_674304 ?auto_674303 ) ( ON ?auto_674305 ?auto_674304 ) ( ON ?auto_674306 ?auto_674305 ) ( ON ?auto_674307 ?auto_674306 ) ( ON ?auto_674308 ?auto_674307 ) ( ON ?auto_674309 ?auto_674308 ) ( not ( = ?auto_674303 ?auto_674304 ) ) ( not ( = ?auto_674303 ?auto_674305 ) ) ( not ( = ?auto_674303 ?auto_674306 ) ) ( not ( = ?auto_674303 ?auto_674307 ) ) ( not ( = ?auto_674303 ?auto_674308 ) ) ( not ( = ?auto_674303 ?auto_674309 ) ) ( not ( = ?auto_674303 ?auto_674310 ) ) ( not ( = ?auto_674303 ?auto_674311 ) ) ( not ( = ?auto_674303 ?auto_674312 ) ) ( not ( = ?auto_674303 ?auto_674313 ) ) ( not ( = ?auto_674303 ?auto_674314 ) ) ( not ( = ?auto_674304 ?auto_674305 ) ) ( not ( = ?auto_674304 ?auto_674306 ) ) ( not ( = ?auto_674304 ?auto_674307 ) ) ( not ( = ?auto_674304 ?auto_674308 ) ) ( not ( = ?auto_674304 ?auto_674309 ) ) ( not ( = ?auto_674304 ?auto_674310 ) ) ( not ( = ?auto_674304 ?auto_674311 ) ) ( not ( = ?auto_674304 ?auto_674312 ) ) ( not ( = ?auto_674304 ?auto_674313 ) ) ( not ( = ?auto_674304 ?auto_674314 ) ) ( not ( = ?auto_674305 ?auto_674306 ) ) ( not ( = ?auto_674305 ?auto_674307 ) ) ( not ( = ?auto_674305 ?auto_674308 ) ) ( not ( = ?auto_674305 ?auto_674309 ) ) ( not ( = ?auto_674305 ?auto_674310 ) ) ( not ( = ?auto_674305 ?auto_674311 ) ) ( not ( = ?auto_674305 ?auto_674312 ) ) ( not ( = ?auto_674305 ?auto_674313 ) ) ( not ( = ?auto_674305 ?auto_674314 ) ) ( not ( = ?auto_674306 ?auto_674307 ) ) ( not ( = ?auto_674306 ?auto_674308 ) ) ( not ( = ?auto_674306 ?auto_674309 ) ) ( not ( = ?auto_674306 ?auto_674310 ) ) ( not ( = ?auto_674306 ?auto_674311 ) ) ( not ( = ?auto_674306 ?auto_674312 ) ) ( not ( = ?auto_674306 ?auto_674313 ) ) ( not ( = ?auto_674306 ?auto_674314 ) ) ( not ( = ?auto_674307 ?auto_674308 ) ) ( not ( = ?auto_674307 ?auto_674309 ) ) ( not ( = ?auto_674307 ?auto_674310 ) ) ( not ( = ?auto_674307 ?auto_674311 ) ) ( not ( = ?auto_674307 ?auto_674312 ) ) ( not ( = ?auto_674307 ?auto_674313 ) ) ( not ( = ?auto_674307 ?auto_674314 ) ) ( not ( = ?auto_674308 ?auto_674309 ) ) ( not ( = ?auto_674308 ?auto_674310 ) ) ( not ( = ?auto_674308 ?auto_674311 ) ) ( not ( = ?auto_674308 ?auto_674312 ) ) ( not ( = ?auto_674308 ?auto_674313 ) ) ( not ( = ?auto_674308 ?auto_674314 ) ) ( not ( = ?auto_674309 ?auto_674310 ) ) ( not ( = ?auto_674309 ?auto_674311 ) ) ( not ( = ?auto_674309 ?auto_674312 ) ) ( not ( = ?auto_674309 ?auto_674313 ) ) ( not ( = ?auto_674309 ?auto_674314 ) ) ( not ( = ?auto_674310 ?auto_674311 ) ) ( not ( = ?auto_674310 ?auto_674312 ) ) ( not ( = ?auto_674310 ?auto_674313 ) ) ( not ( = ?auto_674310 ?auto_674314 ) ) ( not ( = ?auto_674311 ?auto_674312 ) ) ( not ( = ?auto_674311 ?auto_674313 ) ) ( not ( = ?auto_674311 ?auto_674314 ) ) ( not ( = ?auto_674312 ?auto_674313 ) ) ( not ( = ?auto_674312 ?auto_674314 ) ) ( not ( = ?auto_674313 ?auto_674314 ) ) ( ON ?auto_674312 ?auto_674313 ) ( ON ?auto_674311 ?auto_674312 ) ( CLEAR ?auto_674309 ) ( ON ?auto_674310 ?auto_674311 ) ( CLEAR ?auto_674310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_674303 ?auto_674304 ?auto_674305 ?auto_674306 ?auto_674307 ?auto_674308 ?auto_674309 ?auto_674310 )
      ( MAKE-11PILE ?auto_674303 ?auto_674304 ?auto_674305 ?auto_674306 ?auto_674307 ?auto_674308 ?auto_674309 ?auto_674310 ?auto_674311 ?auto_674312 ?auto_674313 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674349 - BLOCK
      ?auto_674350 - BLOCK
      ?auto_674351 - BLOCK
      ?auto_674352 - BLOCK
      ?auto_674353 - BLOCK
      ?auto_674354 - BLOCK
      ?auto_674355 - BLOCK
      ?auto_674356 - BLOCK
      ?auto_674357 - BLOCK
      ?auto_674358 - BLOCK
      ?auto_674359 - BLOCK
    )
    :vars
    (
      ?auto_674360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674359 ?auto_674360 ) ( ON-TABLE ?auto_674349 ) ( ON ?auto_674350 ?auto_674349 ) ( ON ?auto_674351 ?auto_674350 ) ( ON ?auto_674352 ?auto_674351 ) ( ON ?auto_674353 ?auto_674352 ) ( ON ?auto_674354 ?auto_674353 ) ( not ( = ?auto_674349 ?auto_674350 ) ) ( not ( = ?auto_674349 ?auto_674351 ) ) ( not ( = ?auto_674349 ?auto_674352 ) ) ( not ( = ?auto_674349 ?auto_674353 ) ) ( not ( = ?auto_674349 ?auto_674354 ) ) ( not ( = ?auto_674349 ?auto_674355 ) ) ( not ( = ?auto_674349 ?auto_674356 ) ) ( not ( = ?auto_674349 ?auto_674357 ) ) ( not ( = ?auto_674349 ?auto_674358 ) ) ( not ( = ?auto_674349 ?auto_674359 ) ) ( not ( = ?auto_674349 ?auto_674360 ) ) ( not ( = ?auto_674350 ?auto_674351 ) ) ( not ( = ?auto_674350 ?auto_674352 ) ) ( not ( = ?auto_674350 ?auto_674353 ) ) ( not ( = ?auto_674350 ?auto_674354 ) ) ( not ( = ?auto_674350 ?auto_674355 ) ) ( not ( = ?auto_674350 ?auto_674356 ) ) ( not ( = ?auto_674350 ?auto_674357 ) ) ( not ( = ?auto_674350 ?auto_674358 ) ) ( not ( = ?auto_674350 ?auto_674359 ) ) ( not ( = ?auto_674350 ?auto_674360 ) ) ( not ( = ?auto_674351 ?auto_674352 ) ) ( not ( = ?auto_674351 ?auto_674353 ) ) ( not ( = ?auto_674351 ?auto_674354 ) ) ( not ( = ?auto_674351 ?auto_674355 ) ) ( not ( = ?auto_674351 ?auto_674356 ) ) ( not ( = ?auto_674351 ?auto_674357 ) ) ( not ( = ?auto_674351 ?auto_674358 ) ) ( not ( = ?auto_674351 ?auto_674359 ) ) ( not ( = ?auto_674351 ?auto_674360 ) ) ( not ( = ?auto_674352 ?auto_674353 ) ) ( not ( = ?auto_674352 ?auto_674354 ) ) ( not ( = ?auto_674352 ?auto_674355 ) ) ( not ( = ?auto_674352 ?auto_674356 ) ) ( not ( = ?auto_674352 ?auto_674357 ) ) ( not ( = ?auto_674352 ?auto_674358 ) ) ( not ( = ?auto_674352 ?auto_674359 ) ) ( not ( = ?auto_674352 ?auto_674360 ) ) ( not ( = ?auto_674353 ?auto_674354 ) ) ( not ( = ?auto_674353 ?auto_674355 ) ) ( not ( = ?auto_674353 ?auto_674356 ) ) ( not ( = ?auto_674353 ?auto_674357 ) ) ( not ( = ?auto_674353 ?auto_674358 ) ) ( not ( = ?auto_674353 ?auto_674359 ) ) ( not ( = ?auto_674353 ?auto_674360 ) ) ( not ( = ?auto_674354 ?auto_674355 ) ) ( not ( = ?auto_674354 ?auto_674356 ) ) ( not ( = ?auto_674354 ?auto_674357 ) ) ( not ( = ?auto_674354 ?auto_674358 ) ) ( not ( = ?auto_674354 ?auto_674359 ) ) ( not ( = ?auto_674354 ?auto_674360 ) ) ( not ( = ?auto_674355 ?auto_674356 ) ) ( not ( = ?auto_674355 ?auto_674357 ) ) ( not ( = ?auto_674355 ?auto_674358 ) ) ( not ( = ?auto_674355 ?auto_674359 ) ) ( not ( = ?auto_674355 ?auto_674360 ) ) ( not ( = ?auto_674356 ?auto_674357 ) ) ( not ( = ?auto_674356 ?auto_674358 ) ) ( not ( = ?auto_674356 ?auto_674359 ) ) ( not ( = ?auto_674356 ?auto_674360 ) ) ( not ( = ?auto_674357 ?auto_674358 ) ) ( not ( = ?auto_674357 ?auto_674359 ) ) ( not ( = ?auto_674357 ?auto_674360 ) ) ( not ( = ?auto_674358 ?auto_674359 ) ) ( not ( = ?auto_674358 ?auto_674360 ) ) ( not ( = ?auto_674359 ?auto_674360 ) ) ( ON ?auto_674358 ?auto_674359 ) ( ON ?auto_674357 ?auto_674358 ) ( ON ?auto_674356 ?auto_674357 ) ( CLEAR ?auto_674354 ) ( ON ?auto_674355 ?auto_674356 ) ( CLEAR ?auto_674355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_674349 ?auto_674350 ?auto_674351 ?auto_674352 ?auto_674353 ?auto_674354 ?auto_674355 )
      ( MAKE-11PILE ?auto_674349 ?auto_674350 ?auto_674351 ?auto_674352 ?auto_674353 ?auto_674354 ?auto_674355 ?auto_674356 ?auto_674357 ?auto_674358 ?auto_674359 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674395 - BLOCK
      ?auto_674396 - BLOCK
      ?auto_674397 - BLOCK
      ?auto_674398 - BLOCK
      ?auto_674399 - BLOCK
      ?auto_674400 - BLOCK
      ?auto_674401 - BLOCK
      ?auto_674402 - BLOCK
      ?auto_674403 - BLOCK
      ?auto_674404 - BLOCK
      ?auto_674405 - BLOCK
    )
    :vars
    (
      ?auto_674406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674405 ?auto_674406 ) ( ON-TABLE ?auto_674395 ) ( ON ?auto_674396 ?auto_674395 ) ( ON ?auto_674397 ?auto_674396 ) ( ON ?auto_674398 ?auto_674397 ) ( ON ?auto_674399 ?auto_674398 ) ( not ( = ?auto_674395 ?auto_674396 ) ) ( not ( = ?auto_674395 ?auto_674397 ) ) ( not ( = ?auto_674395 ?auto_674398 ) ) ( not ( = ?auto_674395 ?auto_674399 ) ) ( not ( = ?auto_674395 ?auto_674400 ) ) ( not ( = ?auto_674395 ?auto_674401 ) ) ( not ( = ?auto_674395 ?auto_674402 ) ) ( not ( = ?auto_674395 ?auto_674403 ) ) ( not ( = ?auto_674395 ?auto_674404 ) ) ( not ( = ?auto_674395 ?auto_674405 ) ) ( not ( = ?auto_674395 ?auto_674406 ) ) ( not ( = ?auto_674396 ?auto_674397 ) ) ( not ( = ?auto_674396 ?auto_674398 ) ) ( not ( = ?auto_674396 ?auto_674399 ) ) ( not ( = ?auto_674396 ?auto_674400 ) ) ( not ( = ?auto_674396 ?auto_674401 ) ) ( not ( = ?auto_674396 ?auto_674402 ) ) ( not ( = ?auto_674396 ?auto_674403 ) ) ( not ( = ?auto_674396 ?auto_674404 ) ) ( not ( = ?auto_674396 ?auto_674405 ) ) ( not ( = ?auto_674396 ?auto_674406 ) ) ( not ( = ?auto_674397 ?auto_674398 ) ) ( not ( = ?auto_674397 ?auto_674399 ) ) ( not ( = ?auto_674397 ?auto_674400 ) ) ( not ( = ?auto_674397 ?auto_674401 ) ) ( not ( = ?auto_674397 ?auto_674402 ) ) ( not ( = ?auto_674397 ?auto_674403 ) ) ( not ( = ?auto_674397 ?auto_674404 ) ) ( not ( = ?auto_674397 ?auto_674405 ) ) ( not ( = ?auto_674397 ?auto_674406 ) ) ( not ( = ?auto_674398 ?auto_674399 ) ) ( not ( = ?auto_674398 ?auto_674400 ) ) ( not ( = ?auto_674398 ?auto_674401 ) ) ( not ( = ?auto_674398 ?auto_674402 ) ) ( not ( = ?auto_674398 ?auto_674403 ) ) ( not ( = ?auto_674398 ?auto_674404 ) ) ( not ( = ?auto_674398 ?auto_674405 ) ) ( not ( = ?auto_674398 ?auto_674406 ) ) ( not ( = ?auto_674399 ?auto_674400 ) ) ( not ( = ?auto_674399 ?auto_674401 ) ) ( not ( = ?auto_674399 ?auto_674402 ) ) ( not ( = ?auto_674399 ?auto_674403 ) ) ( not ( = ?auto_674399 ?auto_674404 ) ) ( not ( = ?auto_674399 ?auto_674405 ) ) ( not ( = ?auto_674399 ?auto_674406 ) ) ( not ( = ?auto_674400 ?auto_674401 ) ) ( not ( = ?auto_674400 ?auto_674402 ) ) ( not ( = ?auto_674400 ?auto_674403 ) ) ( not ( = ?auto_674400 ?auto_674404 ) ) ( not ( = ?auto_674400 ?auto_674405 ) ) ( not ( = ?auto_674400 ?auto_674406 ) ) ( not ( = ?auto_674401 ?auto_674402 ) ) ( not ( = ?auto_674401 ?auto_674403 ) ) ( not ( = ?auto_674401 ?auto_674404 ) ) ( not ( = ?auto_674401 ?auto_674405 ) ) ( not ( = ?auto_674401 ?auto_674406 ) ) ( not ( = ?auto_674402 ?auto_674403 ) ) ( not ( = ?auto_674402 ?auto_674404 ) ) ( not ( = ?auto_674402 ?auto_674405 ) ) ( not ( = ?auto_674402 ?auto_674406 ) ) ( not ( = ?auto_674403 ?auto_674404 ) ) ( not ( = ?auto_674403 ?auto_674405 ) ) ( not ( = ?auto_674403 ?auto_674406 ) ) ( not ( = ?auto_674404 ?auto_674405 ) ) ( not ( = ?auto_674404 ?auto_674406 ) ) ( not ( = ?auto_674405 ?auto_674406 ) ) ( ON ?auto_674404 ?auto_674405 ) ( ON ?auto_674403 ?auto_674404 ) ( ON ?auto_674402 ?auto_674403 ) ( ON ?auto_674401 ?auto_674402 ) ( CLEAR ?auto_674399 ) ( ON ?auto_674400 ?auto_674401 ) ( CLEAR ?auto_674400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_674395 ?auto_674396 ?auto_674397 ?auto_674398 ?auto_674399 ?auto_674400 )
      ( MAKE-11PILE ?auto_674395 ?auto_674396 ?auto_674397 ?auto_674398 ?auto_674399 ?auto_674400 ?auto_674401 ?auto_674402 ?auto_674403 ?auto_674404 ?auto_674405 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674441 - BLOCK
      ?auto_674442 - BLOCK
      ?auto_674443 - BLOCK
      ?auto_674444 - BLOCK
      ?auto_674445 - BLOCK
      ?auto_674446 - BLOCK
      ?auto_674447 - BLOCK
      ?auto_674448 - BLOCK
      ?auto_674449 - BLOCK
      ?auto_674450 - BLOCK
      ?auto_674451 - BLOCK
    )
    :vars
    (
      ?auto_674452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674451 ?auto_674452 ) ( ON-TABLE ?auto_674441 ) ( ON ?auto_674442 ?auto_674441 ) ( ON ?auto_674443 ?auto_674442 ) ( ON ?auto_674444 ?auto_674443 ) ( not ( = ?auto_674441 ?auto_674442 ) ) ( not ( = ?auto_674441 ?auto_674443 ) ) ( not ( = ?auto_674441 ?auto_674444 ) ) ( not ( = ?auto_674441 ?auto_674445 ) ) ( not ( = ?auto_674441 ?auto_674446 ) ) ( not ( = ?auto_674441 ?auto_674447 ) ) ( not ( = ?auto_674441 ?auto_674448 ) ) ( not ( = ?auto_674441 ?auto_674449 ) ) ( not ( = ?auto_674441 ?auto_674450 ) ) ( not ( = ?auto_674441 ?auto_674451 ) ) ( not ( = ?auto_674441 ?auto_674452 ) ) ( not ( = ?auto_674442 ?auto_674443 ) ) ( not ( = ?auto_674442 ?auto_674444 ) ) ( not ( = ?auto_674442 ?auto_674445 ) ) ( not ( = ?auto_674442 ?auto_674446 ) ) ( not ( = ?auto_674442 ?auto_674447 ) ) ( not ( = ?auto_674442 ?auto_674448 ) ) ( not ( = ?auto_674442 ?auto_674449 ) ) ( not ( = ?auto_674442 ?auto_674450 ) ) ( not ( = ?auto_674442 ?auto_674451 ) ) ( not ( = ?auto_674442 ?auto_674452 ) ) ( not ( = ?auto_674443 ?auto_674444 ) ) ( not ( = ?auto_674443 ?auto_674445 ) ) ( not ( = ?auto_674443 ?auto_674446 ) ) ( not ( = ?auto_674443 ?auto_674447 ) ) ( not ( = ?auto_674443 ?auto_674448 ) ) ( not ( = ?auto_674443 ?auto_674449 ) ) ( not ( = ?auto_674443 ?auto_674450 ) ) ( not ( = ?auto_674443 ?auto_674451 ) ) ( not ( = ?auto_674443 ?auto_674452 ) ) ( not ( = ?auto_674444 ?auto_674445 ) ) ( not ( = ?auto_674444 ?auto_674446 ) ) ( not ( = ?auto_674444 ?auto_674447 ) ) ( not ( = ?auto_674444 ?auto_674448 ) ) ( not ( = ?auto_674444 ?auto_674449 ) ) ( not ( = ?auto_674444 ?auto_674450 ) ) ( not ( = ?auto_674444 ?auto_674451 ) ) ( not ( = ?auto_674444 ?auto_674452 ) ) ( not ( = ?auto_674445 ?auto_674446 ) ) ( not ( = ?auto_674445 ?auto_674447 ) ) ( not ( = ?auto_674445 ?auto_674448 ) ) ( not ( = ?auto_674445 ?auto_674449 ) ) ( not ( = ?auto_674445 ?auto_674450 ) ) ( not ( = ?auto_674445 ?auto_674451 ) ) ( not ( = ?auto_674445 ?auto_674452 ) ) ( not ( = ?auto_674446 ?auto_674447 ) ) ( not ( = ?auto_674446 ?auto_674448 ) ) ( not ( = ?auto_674446 ?auto_674449 ) ) ( not ( = ?auto_674446 ?auto_674450 ) ) ( not ( = ?auto_674446 ?auto_674451 ) ) ( not ( = ?auto_674446 ?auto_674452 ) ) ( not ( = ?auto_674447 ?auto_674448 ) ) ( not ( = ?auto_674447 ?auto_674449 ) ) ( not ( = ?auto_674447 ?auto_674450 ) ) ( not ( = ?auto_674447 ?auto_674451 ) ) ( not ( = ?auto_674447 ?auto_674452 ) ) ( not ( = ?auto_674448 ?auto_674449 ) ) ( not ( = ?auto_674448 ?auto_674450 ) ) ( not ( = ?auto_674448 ?auto_674451 ) ) ( not ( = ?auto_674448 ?auto_674452 ) ) ( not ( = ?auto_674449 ?auto_674450 ) ) ( not ( = ?auto_674449 ?auto_674451 ) ) ( not ( = ?auto_674449 ?auto_674452 ) ) ( not ( = ?auto_674450 ?auto_674451 ) ) ( not ( = ?auto_674450 ?auto_674452 ) ) ( not ( = ?auto_674451 ?auto_674452 ) ) ( ON ?auto_674450 ?auto_674451 ) ( ON ?auto_674449 ?auto_674450 ) ( ON ?auto_674448 ?auto_674449 ) ( ON ?auto_674447 ?auto_674448 ) ( ON ?auto_674446 ?auto_674447 ) ( CLEAR ?auto_674444 ) ( ON ?auto_674445 ?auto_674446 ) ( CLEAR ?auto_674445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_674441 ?auto_674442 ?auto_674443 ?auto_674444 ?auto_674445 )
      ( MAKE-11PILE ?auto_674441 ?auto_674442 ?auto_674443 ?auto_674444 ?auto_674445 ?auto_674446 ?auto_674447 ?auto_674448 ?auto_674449 ?auto_674450 ?auto_674451 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674487 - BLOCK
      ?auto_674488 - BLOCK
      ?auto_674489 - BLOCK
      ?auto_674490 - BLOCK
      ?auto_674491 - BLOCK
      ?auto_674492 - BLOCK
      ?auto_674493 - BLOCK
      ?auto_674494 - BLOCK
      ?auto_674495 - BLOCK
      ?auto_674496 - BLOCK
      ?auto_674497 - BLOCK
    )
    :vars
    (
      ?auto_674498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674497 ?auto_674498 ) ( ON-TABLE ?auto_674487 ) ( ON ?auto_674488 ?auto_674487 ) ( ON ?auto_674489 ?auto_674488 ) ( not ( = ?auto_674487 ?auto_674488 ) ) ( not ( = ?auto_674487 ?auto_674489 ) ) ( not ( = ?auto_674487 ?auto_674490 ) ) ( not ( = ?auto_674487 ?auto_674491 ) ) ( not ( = ?auto_674487 ?auto_674492 ) ) ( not ( = ?auto_674487 ?auto_674493 ) ) ( not ( = ?auto_674487 ?auto_674494 ) ) ( not ( = ?auto_674487 ?auto_674495 ) ) ( not ( = ?auto_674487 ?auto_674496 ) ) ( not ( = ?auto_674487 ?auto_674497 ) ) ( not ( = ?auto_674487 ?auto_674498 ) ) ( not ( = ?auto_674488 ?auto_674489 ) ) ( not ( = ?auto_674488 ?auto_674490 ) ) ( not ( = ?auto_674488 ?auto_674491 ) ) ( not ( = ?auto_674488 ?auto_674492 ) ) ( not ( = ?auto_674488 ?auto_674493 ) ) ( not ( = ?auto_674488 ?auto_674494 ) ) ( not ( = ?auto_674488 ?auto_674495 ) ) ( not ( = ?auto_674488 ?auto_674496 ) ) ( not ( = ?auto_674488 ?auto_674497 ) ) ( not ( = ?auto_674488 ?auto_674498 ) ) ( not ( = ?auto_674489 ?auto_674490 ) ) ( not ( = ?auto_674489 ?auto_674491 ) ) ( not ( = ?auto_674489 ?auto_674492 ) ) ( not ( = ?auto_674489 ?auto_674493 ) ) ( not ( = ?auto_674489 ?auto_674494 ) ) ( not ( = ?auto_674489 ?auto_674495 ) ) ( not ( = ?auto_674489 ?auto_674496 ) ) ( not ( = ?auto_674489 ?auto_674497 ) ) ( not ( = ?auto_674489 ?auto_674498 ) ) ( not ( = ?auto_674490 ?auto_674491 ) ) ( not ( = ?auto_674490 ?auto_674492 ) ) ( not ( = ?auto_674490 ?auto_674493 ) ) ( not ( = ?auto_674490 ?auto_674494 ) ) ( not ( = ?auto_674490 ?auto_674495 ) ) ( not ( = ?auto_674490 ?auto_674496 ) ) ( not ( = ?auto_674490 ?auto_674497 ) ) ( not ( = ?auto_674490 ?auto_674498 ) ) ( not ( = ?auto_674491 ?auto_674492 ) ) ( not ( = ?auto_674491 ?auto_674493 ) ) ( not ( = ?auto_674491 ?auto_674494 ) ) ( not ( = ?auto_674491 ?auto_674495 ) ) ( not ( = ?auto_674491 ?auto_674496 ) ) ( not ( = ?auto_674491 ?auto_674497 ) ) ( not ( = ?auto_674491 ?auto_674498 ) ) ( not ( = ?auto_674492 ?auto_674493 ) ) ( not ( = ?auto_674492 ?auto_674494 ) ) ( not ( = ?auto_674492 ?auto_674495 ) ) ( not ( = ?auto_674492 ?auto_674496 ) ) ( not ( = ?auto_674492 ?auto_674497 ) ) ( not ( = ?auto_674492 ?auto_674498 ) ) ( not ( = ?auto_674493 ?auto_674494 ) ) ( not ( = ?auto_674493 ?auto_674495 ) ) ( not ( = ?auto_674493 ?auto_674496 ) ) ( not ( = ?auto_674493 ?auto_674497 ) ) ( not ( = ?auto_674493 ?auto_674498 ) ) ( not ( = ?auto_674494 ?auto_674495 ) ) ( not ( = ?auto_674494 ?auto_674496 ) ) ( not ( = ?auto_674494 ?auto_674497 ) ) ( not ( = ?auto_674494 ?auto_674498 ) ) ( not ( = ?auto_674495 ?auto_674496 ) ) ( not ( = ?auto_674495 ?auto_674497 ) ) ( not ( = ?auto_674495 ?auto_674498 ) ) ( not ( = ?auto_674496 ?auto_674497 ) ) ( not ( = ?auto_674496 ?auto_674498 ) ) ( not ( = ?auto_674497 ?auto_674498 ) ) ( ON ?auto_674496 ?auto_674497 ) ( ON ?auto_674495 ?auto_674496 ) ( ON ?auto_674494 ?auto_674495 ) ( ON ?auto_674493 ?auto_674494 ) ( ON ?auto_674492 ?auto_674493 ) ( ON ?auto_674491 ?auto_674492 ) ( CLEAR ?auto_674489 ) ( ON ?auto_674490 ?auto_674491 ) ( CLEAR ?auto_674490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_674487 ?auto_674488 ?auto_674489 ?auto_674490 )
      ( MAKE-11PILE ?auto_674487 ?auto_674488 ?auto_674489 ?auto_674490 ?auto_674491 ?auto_674492 ?auto_674493 ?auto_674494 ?auto_674495 ?auto_674496 ?auto_674497 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674533 - BLOCK
      ?auto_674534 - BLOCK
      ?auto_674535 - BLOCK
      ?auto_674536 - BLOCK
      ?auto_674537 - BLOCK
      ?auto_674538 - BLOCK
      ?auto_674539 - BLOCK
      ?auto_674540 - BLOCK
      ?auto_674541 - BLOCK
      ?auto_674542 - BLOCK
      ?auto_674543 - BLOCK
    )
    :vars
    (
      ?auto_674544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674543 ?auto_674544 ) ( ON-TABLE ?auto_674533 ) ( ON ?auto_674534 ?auto_674533 ) ( not ( = ?auto_674533 ?auto_674534 ) ) ( not ( = ?auto_674533 ?auto_674535 ) ) ( not ( = ?auto_674533 ?auto_674536 ) ) ( not ( = ?auto_674533 ?auto_674537 ) ) ( not ( = ?auto_674533 ?auto_674538 ) ) ( not ( = ?auto_674533 ?auto_674539 ) ) ( not ( = ?auto_674533 ?auto_674540 ) ) ( not ( = ?auto_674533 ?auto_674541 ) ) ( not ( = ?auto_674533 ?auto_674542 ) ) ( not ( = ?auto_674533 ?auto_674543 ) ) ( not ( = ?auto_674533 ?auto_674544 ) ) ( not ( = ?auto_674534 ?auto_674535 ) ) ( not ( = ?auto_674534 ?auto_674536 ) ) ( not ( = ?auto_674534 ?auto_674537 ) ) ( not ( = ?auto_674534 ?auto_674538 ) ) ( not ( = ?auto_674534 ?auto_674539 ) ) ( not ( = ?auto_674534 ?auto_674540 ) ) ( not ( = ?auto_674534 ?auto_674541 ) ) ( not ( = ?auto_674534 ?auto_674542 ) ) ( not ( = ?auto_674534 ?auto_674543 ) ) ( not ( = ?auto_674534 ?auto_674544 ) ) ( not ( = ?auto_674535 ?auto_674536 ) ) ( not ( = ?auto_674535 ?auto_674537 ) ) ( not ( = ?auto_674535 ?auto_674538 ) ) ( not ( = ?auto_674535 ?auto_674539 ) ) ( not ( = ?auto_674535 ?auto_674540 ) ) ( not ( = ?auto_674535 ?auto_674541 ) ) ( not ( = ?auto_674535 ?auto_674542 ) ) ( not ( = ?auto_674535 ?auto_674543 ) ) ( not ( = ?auto_674535 ?auto_674544 ) ) ( not ( = ?auto_674536 ?auto_674537 ) ) ( not ( = ?auto_674536 ?auto_674538 ) ) ( not ( = ?auto_674536 ?auto_674539 ) ) ( not ( = ?auto_674536 ?auto_674540 ) ) ( not ( = ?auto_674536 ?auto_674541 ) ) ( not ( = ?auto_674536 ?auto_674542 ) ) ( not ( = ?auto_674536 ?auto_674543 ) ) ( not ( = ?auto_674536 ?auto_674544 ) ) ( not ( = ?auto_674537 ?auto_674538 ) ) ( not ( = ?auto_674537 ?auto_674539 ) ) ( not ( = ?auto_674537 ?auto_674540 ) ) ( not ( = ?auto_674537 ?auto_674541 ) ) ( not ( = ?auto_674537 ?auto_674542 ) ) ( not ( = ?auto_674537 ?auto_674543 ) ) ( not ( = ?auto_674537 ?auto_674544 ) ) ( not ( = ?auto_674538 ?auto_674539 ) ) ( not ( = ?auto_674538 ?auto_674540 ) ) ( not ( = ?auto_674538 ?auto_674541 ) ) ( not ( = ?auto_674538 ?auto_674542 ) ) ( not ( = ?auto_674538 ?auto_674543 ) ) ( not ( = ?auto_674538 ?auto_674544 ) ) ( not ( = ?auto_674539 ?auto_674540 ) ) ( not ( = ?auto_674539 ?auto_674541 ) ) ( not ( = ?auto_674539 ?auto_674542 ) ) ( not ( = ?auto_674539 ?auto_674543 ) ) ( not ( = ?auto_674539 ?auto_674544 ) ) ( not ( = ?auto_674540 ?auto_674541 ) ) ( not ( = ?auto_674540 ?auto_674542 ) ) ( not ( = ?auto_674540 ?auto_674543 ) ) ( not ( = ?auto_674540 ?auto_674544 ) ) ( not ( = ?auto_674541 ?auto_674542 ) ) ( not ( = ?auto_674541 ?auto_674543 ) ) ( not ( = ?auto_674541 ?auto_674544 ) ) ( not ( = ?auto_674542 ?auto_674543 ) ) ( not ( = ?auto_674542 ?auto_674544 ) ) ( not ( = ?auto_674543 ?auto_674544 ) ) ( ON ?auto_674542 ?auto_674543 ) ( ON ?auto_674541 ?auto_674542 ) ( ON ?auto_674540 ?auto_674541 ) ( ON ?auto_674539 ?auto_674540 ) ( ON ?auto_674538 ?auto_674539 ) ( ON ?auto_674537 ?auto_674538 ) ( ON ?auto_674536 ?auto_674537 ) ( CLEAR ?auto_674534 ) ( ON ?auto_674535 ?auto_674536 ) ( CLEAR ?auto_674535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_674533 ?auto_674534 ?auto_674535 )
      ( MAKE-11PILE ?auto_674533 ?auto_674534 ?auto_674535 ?auto_674536 ?auto_674537 ?auto_674538 ?auto_674539 ?auto_674540 ?auto_674541 ?auto_674542 ?auto_674543 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674579 - BLOCK
      ?auto_674580 - BLOCK
      ?auto_674581 - BLOCK
      ?auto_674582 - BLOCK
      ?auto_674583 - BLOCK
      ?auto_674584 - BLOCK
      ?auto_674585 - BLOCK
      ?auto_674586 - BLOCK
      ?auto_674587 - BLOCK
      ?auto_674588 - BLOCK
      ?auto_674589 - BLOCK
    )
    :vars
    (
      ?auto_674590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674589 ?auto_674590 ) ( ON-TABLE ?auto_674579 ) ( not ( = ?auto_674579 ?auto_674580 ) ) ( not ( = ?auto_674579 ?auto_674581 ) ) ( not ( = ?auto_674579 ?auto_674582 ) ) ( not ( = ?auto_674579 ?auto_674583 ) ) ( not ( = ?auto_674579 ?auto_674584 ) ) ( not ( = ?auto_674579 ?auto_674585 ) ) ( not ( = ?auto_674579 ?auto_674586 ) ) ( not ( = ?auto_674579 ?auto_674587 ) ) ( not ( = ?auto_674579 ?auto_674588 ) ) ( not ( = ?auto_674579 ?auto_674589 ) ) ( not ( = ?auto_674579 ?auto_674590 ) ) ( not ( = ?auto_674580 ?auto_674581 ) ) ( not ( = ?auto_674580 ?auto_674582 ) ) ( not ( = ?auto_674580 ?auto_674583 ) ) ( not ( = ?auto_674580 ?auto_674584 ) ) ( not ( = ?auto_674580 ?auto_674585 ) ) ( not ( = ?auto_674580 ?auto_674586 ) ) ( not ( = ?auto_674580 ?auto_674587 ) ) ( not ( = ?auto_674580 ?auto_674588 ) ) ( not ( = ?auto_674580 ?auto_674589 ) ) ( not ( = ?auto_674580 ?auto_674590 ) ) ( not ( = ?auto_674581 ?auto_674582 ) ) ( not ( = ?auto_674581 ?auto_674583 ) ) ( not ( = ?auto_674581 ?auto_674584 ) ) ( not ( = ?auto_674581 ?auto_674585 ) ) ( not ( = ?auto_674581 ?auto_674586 ) ) ( not ( = ?auto_674581 ?auto_674587 ) ) ( not ( = ?auto_674581 ?auto_674588 ) ) ( not ( = ?auto_674581 ?auto_674589 ) ) ( not ( = ?auto_674581 ?auto_674590 ) ) ( not ( = ?auto_674582 ?auto_674583 ) ) ( not ( = ?auto_674582 ?auto_674584 ) ) ( not ( = ?auto_674582 ?auto_674585 ) ) ( not ( = ?auto_674582 ?auto_674586 ) ) ( not ( = ?auto_674582 ?auto_674587 ) ) ( not ( = ?auto_674582 ?auto_674588 ) ) ( not ( = ?auto_674582 ?auto_674589 ) ) ( not ( = ?auto_674582 ?auto_674590 ) ) ( not ( = ?auto_674583 ?auto_674584 ) ) ( not ( = ?auto_674583 ?auto_674585 ) ) ( not ( = ?auto_674583 ?auto_674586 ) ) ( not ( = ?auto_674583 ?auto_674587 ) ) ( not ( = ?auto_674583 ?auto_674588 ) ) ( not ( = ?auto_674583 ?auto_674589 ) ) ( not ( = ?auto_674583 ?auto_674590 ) ) ( not ( = ?auto_674584 ?auto_674585 ) ) ( not ( = ?auto_674584 ?auto_674586 ) ) ( not ( = ?auto_674584 ?auto_674587 ) ) ( not ( = ?auto_674584 ?auto_674588 ) ) ( not ( = ?auto_674584 ?auto_674589 ) ) ( not ( = ?auto_674584 ?auto_674590 ) ) ( not ( = ?auto_674585 ?auto_674586 ) ) ( not ( = ?auto_674585 ?auto_674587 ) ) ( not ( = ?auto_674585 ?auto_674588 ) ) ( not ( = ?auto_674585 ?auto_674589 ) ) ( not ( = ?auto_674585 ?auto_674590 ) ) ( not ( = ?auto_674586 ?auto_674587 ) ) ( not ( = ?auto_674586 ?auto_674588 ) ) ( not ( = ?auto_674586 ?auto_674589 ) ) ( not ( = ?auto_674586 ?auto_674590 ) ) ( not ( = ?auto_674587 ?auto_674588 ) ) ( not ( = ?auto_674587 ?auto_674589 ) ) ( not ( = ?auto_674587 ?auto_674590 ) ) ( not ( = ?auto_674588 ?auto_674589 ) ) ( not ( = ?auto_674588 ?auto_674590 ) ) ( not ( = ?auto_674589 ?auto_674590 ) ) ( ON ?auto_674588 ?auto_674589 ) ( ON ?auto_674587 ?auto_674588 ) ( ON ?auto_674586 ?auto_674587 ) ( ON ?auto_674585 ?auto_674586 ) ( ON ?auto_674584 ?auto_674585 ) ( ON ?auto_674583 ?auto_674584 ) ( ON ?auto_674582 ?auto_674583 ) ( ON ?auto_674581 ?auto_674582 ) ( CLEAR ?auto_674579 ) ( ON ?auto_674580 ?auto_674581 ) ( CLEAR ?auto_674580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_674579 ?auto_674580 )
      ( MAKE-11PILE ?auto_674579 ?auto_674580 ?auto_674581 ?auto_674582 ?auto_674583 ?auto_674584 ?auto_674585 ?auto_674586 ?auto_674587 ?auto_674588 ?auto_674589 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_674625 - BLOCK
      ?auto_674626 - BLOCK
      ?auto_674627 - BLOCK
      ?auto_674628 - BLOCK
      ?auto_674629 - BLOCK
      ?auto_674630 - BLOCK
      ?auto_674631 - BLOCK
      ?auto_674632 - BLOCK
      ?auto_674633 - BLOCK
      ?auto_674634 - BLOCK
      ?auto_674635 - BLOCK
    )
    :vars
    (
      ?auto_674636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674635 ?auto_674636 ) ( not ( = ?auto_674625 ?auto_674626 ) ) ( not ( = ?auto_674625 ?auto_674627 ) ) ( not ( = ?auto_674625 ?auto_674628 ) ) ( not ( = ?auto_674625 ?auto_674629 ) ) ( not ( = ?auto_674625 ?auto_674630 ) ) ( not ( = ?auto_674625 ?auto_674631 ) ) ( not ( = ?auto_674625 ?auto_674632 ) ) ( not ( = ?auto_674625 ?auto_674633 ) ) ( not ( = ?auto_674625 ?auto_674634 ) ) ( not ( = ?auto_674625 ?auto_674635 ) ) ( not ( = ?auto_674625 ?auto_674636 ) ) ( not ( = ?auto_674626 ?auto_674627 ) ) ( not ( = ?auto_674626 ?auto_674628 ) ) ( not ( = ?auto_674626 ?auto_674629 ) ) ( not ( = ?auto_674626 ?auto_674630 ) ) ( not ( = ?auto_674626 ?auto_674631 ) ) ( not ( = ?auto_674626 ?auto_674632 ) ) ( not ( = ?auto_674626 ?auto_674633 ) ) ( not ( = ?auto_674626 ?auto_674634 ) ) ( not ( = ?auto_674626 ?auto_674635 ) ) ( not ( = ?auto_674626 ?auto_674636 ) ) ( not ( = ?auto_674627 ?auto_674628 ) ) ( not ( = ?auto_674627 ?auto_674629 ) ) ( not ( = ?auto_674627 ?auto_674630 ) ) ( not ( = ?auto_674627 ?auto_674631 ) ) ( not ( = ?auto_674627 ?auto_674632 ) ) ( not ( = ?auto_674627 ?auto_674633 ) ) ( not ( = ?auto_674627 ?auto_674634 ) ) ( not ( = ?auto_674627 ?auto_674635 ) ) ( not ( = ?auto_674627 ?auto_674636 ) ) ( not ( = ?auto_674628 ?auto_674629 ) ) ( not ( = ?auto_674628 ?auto_674630 ) ) ( not ( = ?auto_674628 ?auto_674631 ) ) ( not ( = ?auto_674628 ?auto_674632 ) ) ( not ( = ?auto_674628 ?auto_674633 ) ) ( not ( = ?auto_674628 ?auto_674634 ) ) ( not ( = ?auto_674628 ?auto_674635 ) ) ( not ( = ?auto_674628 ?auto_674636 ) ) ( not ( = ?auto_674629 ?auto_674630 ) ) ( not ( = ?auto_674629 ?auto_674631 ) ) ( not ( = ?auto_674629 ?auto_674632 ) ) ( not ( = ?auto_674629 ?auto_674633 ) ) ( not ( = ?auto_674629 ?auto_674634 ) ) ( not ( = ?auto_674629 ?auto_674635 ) ) ( not ( = ?auto_674629 ?auto_674636 ) ) ( not ( = ?auto_674630 ?auto_674631 ) ) ( not ( = ?auto_674630 ?auto_674632 ) ) ( not ( = ?auto_674630 ?auto_674633 ) ) ( not ( = ?auto_674630 ?auto_674634 ) ) ( not ( = ?auto_674630 ?auto_674635 ) ) ( not ( = ?auto_674630 ?auto_674636 ) ) ( not ( = ?auto_674631 ?auto_674632 ) ) ( not ( = ?auto_674631 ?auto_674633 ) ) ( not ( = ?auto_674631 ?auto_674634 ) ) ( not ( = ?auto_674631 ?auto_674635 ) ) ( not ( = ?auto_674631 ?auto_674636 ) ) ( not ( = ?auto_674632 ?auto_674633 ) ) ( not ( = ?auto_674632 ?auto_674634 ) ) ( not ( = ?auto_674632 ?auto_674635 ) ) ( not ( = ?auto_674632 ?auto_674636 ) ) ( not ( = ?auto_674633 ?auto_674634 ) ) ( not ( = ?auto_674633 ?auto_674635 ) ) ( not ( = ?auto_674633 ?auto_674636 ) ) ( not ( = ?auto_674634 ?auto_674635 ) ) ( not ( = ?auto_674634 ?auto_674636 ) ) ( not ( = ?auto_674635 ?auto_674636 ) ) ( ON ?auto_674634 ?auto_674635 ) ( ON ?auto_674633 ?auto_674634 ) ( ON ?auto_674632 ?auto_674633 ) ( ON ?auto_674631 ?auto_674632 ) ( ON ?auto_674630 ?auto_674631 ) ( ON ?auto_674629 ?auto_674630 ) ( ON ?auto_674628 ?auto_674629 ) ( ON ?auto_674627 ?auto_674628 ) ( ON ?auto_674626 ?auto_674627 ) ( ON ?auto_674625 ?auto_674626 ) ( CLEAR ?auto_674625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_674625 )
      ( MAKE-11PILE ?auto_674625 ?auto_674626 ?auto_674627 ?auto_674628 ?auto_674629 ?auto_674630 ?auto_674631 ?auto_674632 ?auto_674633 ?auto_674634 ?auto_674635 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_674672 - BLOCK
      ?auto_674673 - BLOCK
      ?auto_674674 - BLOCK
      ?auto_674675 - BLOCK
      ?auto_674676 - BLOCK
      ?auto_674677 - BLOCK
      ?auto_674678 - BLOCK
      ?auto_674679 - BLOCK
      ?auto_674680 - BLOCK
      ?auto_674681 - BLOCK
      ?auto_674682 - BLOCK
      ?auto_674683 - BLOCK
    )
    :vars
    (
      ?auto_674684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_674682 ) ( ON ?auto_674683 ?auto_674684 ) ( CLEAR ?auto_674683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_674672 ) ( ON ?auto_674673 ?auto_674672 ) ( ON ?auto_674674 ?auto_674673 ) ( ON ?auto_674675 ?auto_674674 ) ( ON ?auto_674676 ?auto_674675 ) ( ON ?auto_674677 ?auto_674676 ) ( ON ?auto_674678 ?auto_674677 ) ( ON ?auto_674679 ?auto_674678 ) ( ON ?auto_674680 ?auto_674679 ) ( ON ?auto_674681 ?auto_674680 ) ( ON ?auto_674682 ?auto_674681 ) ( not ( = ?auto_674672 ?auto_674673 ) ) ( not ( = ?auto_674672 ?auto_674674 ) ) ( not ( = ?auto_674672 ?auto_674675 ) ) ( not ( = ?auto_674672 ?auto_674676 ) ) ( not ( = ?auto_674672 ?auto_674677 ) ) ( not ( = ?auto_674672 ?auto_674678 ) ) ( not ( = ?auto_674672 ?auto_674679 ) ) ( not ( = ?auto_674672 ?auto_674680 ) ) ( not ( = ?auto_674672 ?auto_674681 ) ) ( not ( = ?auto_674672 ?auto_674682 ) ) ( not ( = ?auto_674672 ?auto_674683 ) ) ( not ( = ?auto_674672 ?auto_674684 ) ) ( not ( = ?auto_674673 ?auto_674674 ) ) ( not ( = ?auto_674673 ?auto_674675 ) ) ( not ( = ?auto_674673 ?auto_674676 ) ) ( not ( = ?auto_674673 ?auto_674677 ) ) ( not ( = ?auto_674673 ?auto_674678 ) ) ( not ( = ?auto_674673 ?auto_674679 ) ) ( not ( = ?auto_674673 ?auto_674680 ) ) ( not ( = ?auto_674673 ?auto_674681 ) ) ( not ( = ?auto_674673 ?auto_674682 ) ) ( not ( = ?auto_674673 ?auto_674683 ) ) ( not ( = ?auto_674673 ?auto_674684 ) ) ( not ( = ?auto_674674 ?auto_674675 ) ) ( not ( = ?auto_674674 ?auto_674676 ) ) ( not ( = ?auto_674674 ?auto_674677 ) ) ( not ( = ?auto_674674 ?auto_674678 ) ) ( not ( = ?auto_674674 ?auto_674679 ) ) ( not ( = ?auto_674674 ?auto_674680 ) ) ( not ( = ?auto_674674 ?auto_674681 ) ) ( not ( = ?auto_674674 ?auto_674682 ) ) ( not ( = ?auto_674674 ?auto_674683 ) ) ( not ( = ?auto_674674 ?auto_674684 ) ) ( not ( = ?auto_674675 ?auto_674676 ) ) ( not ( = ?auto_674675 ?auto_674677 ) ) ( not ( = ?auto_674675 ?auto_674678 ) ) ( not ( = ?auto_674675 ?auto_674679 ) ) ( not ( = ?auto_674675 ?auto_674680 ) ) ( not ( = ?auto_674675 ?auto_674681 ) ) ( not ( = ?auto_674675 ?auto_674682 ) ) ( not ( = ?auto_674675 ?auto_674683 ) ) ( not ( = ?auto_674675 ?auto_674684 ) ) ( not ( = ?auto_674676 ?auto_674677 ) ) ( not ( = ?auto_674676 ?auto_674678 ) ) ( not ( = ?auto_674676 ?auto_674679 ) ) ( not ( = ?auto_674676 ?auto_674680 ) ) ( not ( = ?auto_674676 ?auto_674681 ) ) ( not ( = ?auto_674676 ?auto_674682 ) ) ( not ( = ?auto_674676 ?auto_674683 ) ) ( not ( = ?auto_674676 ?auto_674684 ) ) ( not ( = ?auto_674677 ?auto_674678 ) ) ( not ( = ?auto_674677 ?auto_674679 ) ) ( not ( = ?auto_674677 ?auto_674680 ) ) ( not ( = ?auto_674677 ?auto_674681 ) ) ( not ( = ?auto_674677 ?auto_674682 ) ) ( not ( = ?auto_674677 ?auto_674683 ) ) ( not ( = ?auto_674677 ?auto_674684 ) ) ( not ( = ?auto_674678 ?auto_674679 ) ) ( not ( = ?auto_674678 ?auto_674680 ) ) ( not ( = ?auto_674678 ?auto_674681 ) ) ( not ( = ?auto_674678 ?auto_674682 ) ) ( not ( = ?auto_674678 ?auto_674683 ) ) ( not ( = ?auto_674678 ?auto_674684 ) ) ( not ( = ?auto_674679 ?auto_674680 ) ) ( not ( = ?auto_674679 ?auto_674681 ) ) ( not ( = ?auto_674679 ?auto_674682 ) ) ( not ( = ?auto_674679 ?auto_674683 ) ) ( not ( = ?auto_674679 ?auto_674684 ) ) ( not ( = ?auto_674680 ?auto_674681 ) ) ( not ( = ?auto_674680 ?auto_674682 ) ) ( not ( = ?auto_674680 ?auto_674683 ) ) ( not ( = ?auto_674680 ?auto_674684 ) ) ( not ( = ?auto_674681 ?auto_674682 ) ) ( not ( = ?auto_674681 ?auto_674683 ) ) ( not ( = ?auto_674681 ?auto_674684 ) ) ( not ( = ?auto_674682 ?auto_674683 ) ) ( not ( = ?auto_674682 ?auto_674684 ) ) ( not ( = ?auto_674683 ?auto_674684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_674683 ?auto_674684 )
      ( !STACK ?auto_674683 ?auto_674682 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_674722 - BLOCK
      ?auto_674723 - BLOCK
      ?auto_674724 - BLOCK
      ?auto_674725 - BLOCK
      ?auto_674726 - BLOCK
      ?auto_674727 - BLOCK
      ?auto_674728 - BLOCK
      ?auto_674729 - BLOCK
      ?auto_674730 - BLOCK
      ?auto_674731 - BLOCK
      ?auto_674732 - BLOCK
      ?auto_674733 - BLOCK
    )
    :vars
    (
      ?auto_674734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674733 ?auto_674734 ) ( ON-TABLE ?auto_674722 ) ( ON ?auto_674723 ?auto_674722 ) ( ON ?auto_674724 ?auto_674723 ) ( ON ?auto_674725 ?auto_674724 ) ( ON ?auto_674726 ?auto_674725 ) ( ON ?auto_674727 ?auto_674726 ) ( ON ?auto_674728 ?auto_674727 ) ( ON ?auto_674729 ?auto_674728 ) ( ON ?auto_674730 ?auto_674729 ) ( ON ?auto_674731 ?auto_674730 ) ( not ( = ?auto_674722 ?auto_674723 ) ) ( not ( = ?auto_674722 ?auto_674724 ) ) ( not ( = ?auto_674722 ?auto_674725 ) ) ( not ( = ?auto_674722 ?auto_674726 ) ) ( not ( = ?auto_674722 ?auto_674727 ) ) ( not ( = ?auto_674722 ?auto_674728 ) ) ( not ( = ?auto_674722 ?auto_674729 ) ) ( not ( = ?auto_674722 ?auto_674730 ) ) ( not ( = ?auto_674722 ?auto_674731 ) ) ( not ( = ?auto_674722 ?auto_674732 ) ) ( not ( = ?auto_674722 ?auto_674733 ) ) ( not ( = ?auto_674722 ?auto_674734 ) ) ( not ( = ?auto_674723 ?auto_674724 ) ) ( not ( = ?auto_674723 ?auto_674725 ) ) ( not ( = ?auto_674723 ?auto_674726 ) ) ( not ( = ?auto_674723 ?auto_674727 ) ) ( not ( = ?auto_674723 ?auto_674728 ) ) ( not ( = ?auto_674723 ?auto_674729 ) ) ( not ( = ?auto_674723 ?auto_674730 ) ) ( not ( = ?auto_674723 ?auto_674731 ) ) ( not ( = ?auto_674723 ?auto_674732 ) ) ( not ( = ?auto_674723 ?auto_674733 ) ) ( not ( = ?auto_674723 ?auto_674734 ) ) ( not ( = ?auto_674724 ?auto_674725 ) ) ( not ( = ?auto_674724 ?auto_674726 ) ) ( not ( = ?auto_674724 ?auto_674727 ) ) ( not ( = ?auto_674724 ?auto_674728 ) ) ( not ( = ?auto_674724 ?auto_674729 ) ) ( not ( = ?auto_674724 ?auto_674730 ) ) ( not ( = ?auto_674724 ?auto_674731 ) ) ( not ( = ?auto_674724 ?auto_674732 ) ) ( not ( = ?auto_674724 ?auto_674733 ) ) ( not ( = ?auto_674724 ?auto_674734 ) ) ( not ( = ?auto_674725 ?auto_674726 ) ) ( not ( = ?auto_674725 ?auto_674727 ) ) ( not ( = ?auto_674725 ?auto_674728 ) ) ( not ( = ?auto_674725 ?auto_674729 ) ) ( not ( = ?auto_674725 ?auto_674730 ) ) ( not ( = ?auto_674725 ?auto_674731 ) ) ( not ( = ?auto_674725 ?auto_674732 ) ) ( not ( = ?auto_674725 ?auto_674733 ) ) ( not ( = ?auto_674725 ?auto_674734 ) ) ( not ( = ?auto_674726 ?auto_674727 ) ) ( not ( = ?auto_674726 ?auto_674728 ) ) ( not ( = ?auto_674726 ?auto_674729 ) ) ( not ( = ?auto_674726 ?auto_674730 ) ) ( not ( = ?auto_674726 ?auto_674731 ) ) ( not ( = ?auto_674726 ?auto_674732 ) ) ( not ( = ?auto_674726 ?auto_674733 ) ) ( not ( = ?auto_674726 ?auto_674734 ) ) ( not ( = ?auto_674727 ?auto_674728 ) ) ( not ( = ?auto_674727 ?auto_674729 ) ) ( not ( = ?auto_674727 ?auto_674730 ) ) ( not ( = ?auto_674727 ?auto_674731 ) ) ( not ( = ?auto_674727 ?auto_674732 ) ) ( not ( = ?auto_674727 ?auto_674733 ) ) ( not ( = ?auto_674727 ?auto_674734 ) ) ( not ( = ?auto_674728 ?auto_674729 ) ) ( not ( = ?auto_674728 ?auto_674730 ) ) ( not ( = ?auto_674728 ?auto_674731 ) ) ( not ( = ?auto_674728 ?auto_674732 ) ) ( not ( = ?auto_674728 ?auto_674733 ) ) ( not ( = ?auto_674728 ?auto_674734 ) ) ( not ( = ?auto_674729 ?auto_674730 ) ) ( not ( = ?auto_674729 ?auto_674731 ) ) ( not ( = ?auto_674729 ?auto_674732 ) ) ( not ( = ?auto_674729 ?auto_674733 ) ) ( not ( = ?auto_674729 ?auto_674734 ) ) ( not ( = ?auto_674730 ?auto_674731 ) ) ( not ( = ?auto_674730 ?auto_674732 ) ) ( not ( = ?auto_674730 ?auto_674733 ) ) ( not ( = ?auto_674730 ?auto_674734 ) ) ( not ( = ?auto_674731 ?auto_674732 ) ) ( not ( = ?auto_674731 ?auto_674733 ) ) ( not ( = ?auto_674731 ?auto_674734 ) ) ( not ( = ?auto_674732 ?auto_674733 ) ) ( not ( = ?auto_674732 ?auto_674734 ) ) ( not ( = ?auto_674733 ?auto_674734 ) ) ( CLEAR ?auto_674731 ) ( ON ?auto_674732 ?auto_674733 ) ( CLEAR ?auto_674732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_674722 ?auto_674723 ?auto_674724 ?auto_674725 ?auto_674726 ?auto_674727 ?auto_674728 ?auto_674729 ?auto_674730 ?auto_674731 ?auto_674732 )
      ( MAKE-12PILE ?auto_674722 ?auto_674723 ?auto_674724 ?auto_674725 ?auto_674726 ?auto_674727 ?auto_674728 ?auto_674729 ?auto_674730 ?auto_674731 ?auto_674732 ?auto_674733 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_674772 - BLOCK
      ?auto_674773 - BLOCK
      ?auto_674774 - BLOCK
      ?auto_674775 - BLOCK
      ?auto_674776 - BLOCK
      ?auto_674777 - BLOCK
      ?auto_674778 - BLOCK
      ?auto_674779 - BLOCK
      ?auto_674780 - BLOCK
      ?auto_674781 - BLOCK
      ?auto_674782 - BLOCK
      ?auto_674783 - BLOCK
    )
    :vars
    (
      ?auto_674784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674783 ?auto_674784 ) ( ON-TABLE ?auto_674772 ) ( ON ?auto_674773 ?auto_674772 ) ( ON ?auto_674774 ?auto_674773 ) ( ON ?auto_674775 ?auto_674774 ) ( ON ?auto_674776 ?auto_674775 ) ( ON ?auto_674777 ?auto_674776 ) ( ON ?auto_674778 ?auto_674777 ) ( ON ?auto_674779 ?auto_674778 ) ( ON ?auto_674780 ?auto_674779 ) ( not ( = ?auto_674772 ?auto_674773 ) ) ( not ( = ?auto_674772 ?auto_674774 ) ) ( not ( = ?auto_674772 ?auto_674775 ) ) ( not ( = ?auto_674772 ?auto_674776 ) ) ( not ( = ?auto_674772 ?auto_674777 ) ) ( not ( = ?auto_674772 ?auto_674778 ) ) ( not ( = ?auto_674772 ?auto_674779 ) ) ( not ( = ?auto_674772 ?auto_674780 ) ) ( not ( = ?auto_674772 ?auto_674781 ) ) ( not ( = ?auto_674772 ?auto_674782 ) ) ( not ( = ?auto_674772 ?auto_674783 ) ) ( not ( = ?auto_674772 ?auto_674784 ) ) ( not ( = ?auto_674773 ?auto_674774 ) ) ( not ( = ?auto_674773 ?auto_674775 ) ) ( not ( = ?auto_674773 ?auto_674776 ) ) ( not ( = ?auto_674773 ?auto_674777 ) ) ( not ( = ?auto_674773 ?auto_674778 ) ) ( not ( = ?auto_674773 ?auto_674779 ) ) ( not ( = ?auto_674773 ?auto_674780 ) ) ( not ( = ?auto_674773 ?auto_674781 ) ) ( not ( = ?auto_674773 ?auto_674782 ) ) ( not ( = ?auto_674773 ?auto_674783 ) ) ( not ( = ?auto_674773 ?auto_674784 ) ) ( not ( = ?auto_674774 ?auto_674775 ) ) ( not ( = ?auto_674774 ?auto_674776 ) ) ( not ( = ?auto_674774 ?auto_674777 ) ) ( not ( = ?auto_674774 ?auto_674778 ) ) ( not ( = ?auto_674774 ?auto_674779 ) ) ( not ( = ?auto_674774 ?auto_674780 ) ) ( not ( = ?auto_674774 ?auto_674781 ) ) ( not ( = ?auto_674774 ?auto_674782 ) ) ( not ( = ?auto_674774 ?auto_674783 ) ) ( not ( = ?auto_674774 ?auto_674784 ) ) ( not ( = ?auto_674775 ?auto_674776 ) ) ( not ( = ?auto_674775 ?auto_674777 ) ) ( not ( = ?auto_674775 ?auto_674778 ) ) ( not ( = ?auto_674775 ?auto_674779 ) ) ( not ( = ?auto_674775 ?auto_674780 ) ) ( not ( = ?auto_674775 ?auto_674781 ) ) ( not ( = ?auto_674775 ?auto_674782 ) ) ( not ( = ?auto_674775 ?auto_674783 ) ) ( not ( = ?auto_674775 ?auto_674784 ) ) ( not ( = ?auto_674776 ?auto_674777 ) ) ( not ( = ?auto_674776 ?auto_674778 ) ) ( not ( = ?auto_674776 ?auto_674779 ) ) ( not ( = ?auto_674776 ?auto_674780 ) ) ( not ( = ?auto_674776 ?auto_674781 ) ) ( not ( = ?auto_674776 ?auto_674782 ) ) ( not ( = ?auto_674776 ?auto_674783 ) ) ( not ( = ?auto_674776 ?auto_674784 ) ) ( not ( = ?auto_674777 ?auto_674778 ) ) ( not ( = ?auto_674777 ?auto_674779 ) ) ( not ( = ?auto_674777 ?auto_674780 ) ) ( not ( = ?auto_674777 ?auto_674781 ) ) ( not ( = ?auto_674777 ?auto_674782 ) ) ( not ( = ?auto_674777 ?auto_674783 ) ) ( not ( = ?auto_674777 ?auto_674784 ) ) ( not ( = ?auto_674778 ?auto_674779 ) ) ( not ( = ?auto_674778 ?auto_674780 ) ) ( not ( = ?auto_674778 ?auto_674781 ) ) ( not ( = ?auto_674778 ?auto_674782 ) ) ( not ( = ?auto_674778 ?auto_674783 ) ) ( not ( = ?auto_674778 ?auto_674784 ) ) ( not ( = ?auto_674779 ?auto_674780 ) ) ( not ( = ?auto_674779 ?auto_674781 ) ) ( not ( = ?auto_674779 ?auto_674782 ) ) ( not ( = ?auto_674779 ?auto_674783 ) ) ( not ( = ?auto_674779 ?auto_674784 ) ) ( not ( = ?auto_674780 ?auto_674781 ) ) ( not ( = ?auto_674780 ?auto_674782 ) ) ( not ( = ?auto_674780 ?auto_674783 ) ) ( not ( = ?auto_674780 ?auto_674784 ) ) ( not ( = ?auto_674781 ?auto_674782 ) ) ( not ( = ?auto_674781 ?auto_674783 ) ) ( not ( = ?auto_674781 ?auto_674784 ) ) ( not ( = ?auto_674782 ?auto_674783 ) ) ( not ( = ?auto_674782 ?auto_674784 ) ) ( not ( = ?auto_674783 ?auto_674784 ) ) ( ON ?auto_674782 ?auto_674783 ) ( CLEAR ?auto_674780 ) ( ON ?auto_674781 ?auto_674782 ) ( CLEAR ?auto_674781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_674772 ?auto_674773 ?auto_674774 ?auto_674775 ?auto_674776 ?auto_674777 ?auto_674778 ?auto_674779 ?auto_674780 ?auto_674781 )
      ( MAKE-12PILE ?auto_674772 ?auto_674773 ?auto_674774 ?auto_674775 ?auto_674776 ?auto_674777 ?auto_674778 ?auto_674779 ?auto_674780 ?auto_674781 ?auto_674782 ?auto_674783 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_674822 - BLOCK
      ?auto_674823 - BLOCK
      ?auto_674824 - BLOCK
      ?auto_674825 - BLOCK
      ?auto_674826 - BLOCK
      ?auto_674827 - BLOCK
      ?auto_674828 - BLOCK
      ?auto_674829 - BLOCK
      ?auto_674830 - BLOCK
      ?auto_674831 - BLOCK
      ?auto_674832 - BLOCK
      ?auto_674833 - BLOCK
    )
    :vars
    (
      ?auto_674834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674833 ?auto_674834 ) ( ON-TABLE ?auto_674822 ) ( ON ?auto_674823 ?auto_674822 ) ( ON ?auto_674824 ?auto_674823 ) ( ON ?auto_674825 ?auto_674824 ) ( ON ?auto_674826 ?auto_674825 ) ( ON ?auto_674827 ?auto_674826 ) ( ON ?auto_674828 ?auto_674827 ) ( ON ?auto_674829 ?auto_674828 ) ( not ( = ?auto_674822 ?auto_674823 ) ) ( not ( = ?auto_674822 ?auto_674824 ) ) ( not ( = ?auto_674822 ?auto_674825 ) ) ( not ( = ?auto_674822 ?auto_674826 ) ) ( not ( = ?auto_674822 ?auto_674827 ) ) ( not ( = ?auto_674822 ?auto_674828 ) ) ( not ( = ?auto_674822 ?auto_674829 ) ) ( not ( = ?auto_674822 ?auto_674830 ) ) ( not ( = ?auto_674822 ?auto_674831 ) ) ( not ( = ?auto_674822 ?auto_674832 ) ) ( not ( = ?auto_674822 ?auto_674833 ) ) ( not ( = ?auto_674822 ?auto_674834 ) ) ( not ( = ?auto_674823 ?auto_674824 ) ) ( not ( = ?auto_674823 ?auto_674825 ) ) ( not ( = ?auto_674823 ?auto_674826 ) ) ( not ( = ?auto_674823 ?auto_674827 ) ) ( not ( = ?auto_674823 ?auto_674828 ) ) ( not ( = ?auto_674823 ?auto_674829 ) ) ( not ( = ?auto_674823 ?auto_674830 ) ) ( not ( = ?auto_674823 ?auto_674831 ) ) ( not ( = ?auto_674823 ?auto_674832 ) ) ( not ( = ?auto_674823 ?auto_674833 ) ) ( not ( = ?auto_674823 ?auto_674834 ) ) ( not ( = ?auto_674824 ?auto_674825 ) ) ( not ( = ?auto_674824 ?auto_674826 ) ) ( not ( = ?auto_674824 ?auto_674827 ) ) ( not ( = ?auto_674824 ?auto_674828 ) ) ( not ( = ?auto_674824 ?auto_674829 ) ) ( not ( = ?auto_674824 ?auto_674830 ) ) ( not ( = ?auto_674824 ?auto_674831 ) ) ( not ( = ?auto_674824 ?auto_674832 ) ) ( not ( = ?auto_674824 ?auto_674833 ) ) ( not ( = ?auto_674824 ?auto_674834 ) ) ( not ( = ?auto_674825 ?auto_674826 ) ) ( not ( = ?auto_674825 ?auto_674827 ) ) ( not ( = ?auto_674825 ?auto_674828 ) ) ( not ( = ?auto_674825 ?auto_674829 ) ) ( not ( = ?auto_674825 ?auto_674830 ) ) ( not ( = ?auto_674825 ?auto_674831 ) ) ( not ( = ?auto_674825 ?auto_674832 ) ) ( not ( = ?auto_674825 ?auto_674833 ) ) ( not ( = ?auto_674825 ?auto_674834 ) ) ( not ( = ?auto_674826 ?auto_674827 ) ) ( not ( = ?auto_674826 ?auto_674828 ) ) ( not ( = ?auto_674826 ?auto_674829 ) ) ( not ( = ?auto_674826 ?auto_674830 ) ) ( not ( = ?auto_674826 ?auto_674831 ) ) ( not ( = ?auto_674826 ?auto_674832 ) ) ( not ( = ?auto_674826 ?auto_674833 ) ) ( not ( = ?auto_674826 ?auto_674834 ) ) ( not ( = ?auto_674827 ?auto_674828 ) ) ( not ( = ?auto_674827 ?auto_674829 ) ) ( not ( = ?auto_674827 ?auto_674830 ) ) ( not ( = ?auto_674827 ?auto_674831 ) ) ( not ( = ?auto_674827 ?auto_674832 ) ) ( not ( = ?auto_674827 ?auto_674833 ) ) ( not ( = ?auto_674827 ?auto_674834 ) ) ( not ( = ?auto_674828 ?auto_674829 ) ) ( not ( = ?auto_674828 ?auto_674830 ) ) ( not ( = ?auto_674828 ?auto_674831 ) ) ( not ( = ?auto_674828 ?auto_674832 ) ) ( not ( = ?auto_674828 ?auto_674833 ) ) ( not ( = ?auto_674828 ?auto_674834 ) ) ( not ( = ?auto_674829 ?auto_674830 ) ) ( not ( = ?auto_674829 ?auto_674831 ) ) ( not ( = ?auto_674829 ?auto_674832 ) ) ( not ( = ?auto_674829 ?auto_674833 ) ) ( not ( = ?auto_674829 ?auto_674834 ) ) ( not ( = ?auto_674830 ?auto_674831 ) ) ( not ( = ?auto_674830 ?auto_674832 ) ) ( not ( = ?auto_674830 ?auto_674833 ) ) ( not ( = ?auto_674830 ?auto_674834 ) ) ( not ( = ?auto_674831 ?auto_674832 ) ) ( not ( = ?auto_674831 ?auto_674833 ) ) ( not ( = ?auto_674831 ?auto_674834 ) ) ( not ( = ?auto_674832 ?auto_674833 ) ) ( not ( = ?auto_674832 ?auto_674834 ) ) ( not ( = ?auto_674833 ?auto_674834 ) ) ( ON ?auto_674832 ?auto_674833 ) ( ON ?auto_674831 ?auto_674832 ) ( CLEAR ?auto_674829 ) ( ON ?auto_674830 ?auto_674831 ) ( CLEAR ?auto_674830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_674822 ?auto_674823 ?auto_674824 ?auto_674825 ?auto_674826 ?auto_674827 ?auto_674828 ?auto_674829 ?auto_674830 )
      ( MAKE-12PILE ?auto_674822 ?auto_674823 ?auto_674824 ?auto_674825 ?auto_674826 ?auto_674827 ?auto_674828 ?auto_674829 ?auto_674830 ?auto_674831 ?auto_674832 ?auto_674833 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_674872 - BLOCK
      ?auto_674873 - BLOCK
      ?auto_674874 - BLOCK
      ?auto_674875 - BLOCK
      ?auto_674876 - BLOCK
      ?auto_674877 - BLOCK
      ?auto_674878 - BLOCK
      ?auto_674879 - BLOCK
      ?auto_674880 - BLOCK
      ?auto_674881 - BLOCK
      ?auto_674882 - BLOCK
      ?auto_674883 - BLOCK
    )
    :vars
    (
      ?auto_674884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674883 ?auto_674884 ) ( ON-TABLE ?auto_674872 ) ( ON ?auto_674873 ?auto_674872 ) ( ON ?auto_674874 ?auto_674873 ) ( ON ?auto_674875 ?auto_674874 ) ( ON ?auto_674876 ?auto_674875 ) ( ON ?auto_674877 ?auto_674876 ) ( ON ?auto_674878 ?auto_674877 ) ( not ( = ?auto_674872 ?auto_674873 ) ) ( not ( = ?auto_674872 ?auto_674874 ) ) ( not ( = ?auto_674872 ?auto_674875 ) ) ( not ( = ?auto_674872 ?auto_674876 ) ) ( not ( = ?auto_674872 ?auto_674877 ) ) ( not ( = ?auto_674872 ?auto_674878 ) ) ( not ( = ?auto_674872 ?auto_674879 ) ) ( not ( = ?auto_674872 ?auto_674880 ) ) ( not ( = ?auto_674872 ?auto_674881 ) ) ( not ( = ?auto_674872 ?auto_674882 ) ) ( not ( = ?auto_674872 ?auto_674883 ) ) ( not ( = ?auto_674872 ?auto_674884 ) ) ( not ( = ?auto_674873 ?auto_674874 ) ) ( not ( = ?auto_674873 ?auto_674875 ) ) ( not ( = ?auto_674873 ?auto_674876 ) ) ( not ( = ?auto_674873 ?auto_674877 ) ) ( not ( = ?auto_674873 ?auto_674878 ) ) ( not ( = ?auto_674873 ?auto_674879 ) ) ( not ( = ?auto_674873 ?auto_674880 ) ) ( not ( = ?auto_674873 ?auto_674881 ) ) ( not ( = ?auto_674873 ?auto_674882 ) ) ( not ( = ?auto_674873 ?auto_674883 ) ) ( not ( = ?auto_674873 ?auto_674884 ) ) ( not ( = ?auto_674874 ?auto_674875 ) ) ( not ( = ?auto_674874 ?auto_674876 ) ) ( not ( = ?auto_674874 ?auto_674877 ) ) ( not ( = ?auto_674874 ?auto_674878 ) ) ( not ( = ?auto_674874 ?auto_674879 ) ) ( not ( = ?auto_674874 ?auto_674880 ) ) ( not ( = ?auto_674874 ?auto_674881 ) ) ( not ( = ?auto_674874 ?auto_674882 ) ) ( not ( = ?auto_674874 ?auto_674883 ) ) ( not ( = ?auto_674874 ?auto_674884 ) ) ( not ( = ?auto_674875 ?auto_674876 ) ) ( not ( = ?auto_674875 ?auto_674877 ) ) ( not ( = ?auto_674875 ?auto_674878 ) ) ( not ( = ?auto_674875 ?auto_674879 ) ) ( not ( = ?auto_674875 ?auto_674880 ) ) ( not ( = ?auto_674875 ?auto_674881 ) ) ( not ( = ?auto_674875 ?auto_674882 ) ) ( not ( = ?auto_674875 ?auto_674883 ) ) ( not ( = ?auto_674875 ?auto_674884 ) ) ( not ( = ?auto_674876 ?auto_674877 ) ) ( not ( = ?auto_674876 ?auto_674878 ) ) ( not ( = ?auto_674876 ?auto_674879 ) ) ( not ( = ?auto_674876 ?auto_674880 ) ) ( not ( = ?auto_674876 ?auto_674881 ) ) ( not ( = ?auto_674876 ?auto_674882 ) ) ( not ( = ?auto_674876 ?auto_674883 ) ) ( not ( = ?auto_674876 ?auto_674884 ) ) ( not ( = ?auto_674877 ?auto_674878 ) ) ( not ( = ?auto_674877 ?auto_674879 ) ) ( not ( = ?auto_674877 ?auto_674880 ) ) ( not ( = ?auto_674877 ?auto_674881 ) ) ( not ( = ?auto_674877 ?auto_674882 ) ) ( not ( = ?auto_674877 ?auto_674883 ) ) ( not ( = ?auto_674877 ?auto_674884 ) ) ( not ( = ?auto_674878 ?auto_674879 ) ) ( not ( = ?auto_674878 ?auto_674880 ) ) ( not ( = ?auto_674878 ?auto_674881 ) ) ( not ( = ?auto_674878 ?auto_674882 ) ) ( not ( = ?auto_674878 ?auto_674883 ) ) ( not ( = ?auto_674878 ?auto_674884 ) ) ( not ( = ?auto_674879 ?auto_674880 ) ) ( not ( = ?auto_674879 ?auto_674881 ) ) ( not ( = ?auto_674879 ?auto_674882 ) ) ( not ( = ?auto_674879 ?auto_674883 ) ) ( not ( = ?auto_674879 ?auto_674884 ) ) ( not ( = ?auto_674880 ?auto_674881 ) ) ( not ( = ?auto_674880 ?auto_674882 ) ) ( not ( = ?auto_674880 ?auto_674883 ) ) ( not ( = ?auto_674880 ?auto_674884 ) ) ( not ( = ?auto_674881 ?auto_674882 ) ) ( not ( = ?auto_674881 ?auto_674883 ) ) ( not ( = ?auto_674881 ?auto_674884 ) ) ( not ( = ?auto_674882 ?auto_674883 ) ) ( not ( = ?auto_674882 ?auto_674884 ) ) ( not ( = ?auto_674883 ?auto_674884 ) ) ( ON ?auto_674882 ?auto_674883 ) ( ON ?auto_674881 ?auto_674882 ) ( ON ?auto_674880 ?auto_674881 ) ( CLEAR ?auto_674878 ) ( ON ?auto_674879 ?auto_674880 ) ( CLEAR ?auto_674879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_674872 ?auto_674873 ?auto_674874 ?auto_674875 ?auto_674876 ?auto_674877 ?auto_674878 ?auto_674879 )
      ( MAKE-12PILE ?auto_674872 ?auto_674873 ?auto_674874 ?auto_674875 ?auto_674876 ?auto_674877 ?auto_674878 ?auto_674879 ?auto_674880 ?auto_674881 ?auto_674882 ?auto_674883 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_674922 - BLOCK
      ?auto_674923 - BLOCK
      ?auto_674924 - BLOCK
      ?auto_674925 - BLOCK
      ?auto_674926 - BLOCK
      ?auto_674927 - BLOCK
      ?auto_674928 - BLOCK
      ?auto_674929 - BLOCK
      ?auto_674930 - BLOCK
      ?auto_674931 - BLOCK
      ?auto_674932 - BLOCK
      ?auto_674933 - BLOCK
    )
    :vars
    (
      ?auto_674934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674933 ?auto_674934 ) ( ON-TABLE ?auto_674922 ) ( ON ?auto_674923 ?auto_674922 ) ( ON ?auto_674924 ?auto_674923 ) ( ON ?auto_674925 ?auto_674924 ) ( ON ?auto_674926 ?auto_674925 ) ( ON ?auto_674927 ?auto_674926 ) ( not ( = ?auto_674922 ?auto_674923 ) ) ( not ( = ?auto_674922 ?auto_674924 ) ) ( not ( = ?auto_674922 ?auto_674925 ) ) ( not ( = ?auto_674922 ?auto_674926 ) ) ( not ( = ?auto_674922 ?auto_674927 ) ) ( not ( = ?auto_674922 ?auto_674928 ) ) ( not ( = ?auto_674922 ?auto_674929 ) ) ( not ( = ?auto_674922 ?auto_674930 ) ) ( not ( = ?auto_674922 ?auto_674931 ) ) ( not ( = ?auto_674922 ?auto_674932 ) ) ( not ( = ?auto_674922 ?auto_674933 ) ) ( not ( = ?auto_674922 ?auto_674934 ) ) ( not ( = ?auto_674923 ?auto_674924 ) ) ( not ( = ?auto_674923 ?auto_674925 ) ) ( not ( = ?auto_674923 ?auto_674926 ) ) ( not ( = ?auto_674923 ?auto_674927 ) ) ( not ( = ?auto_674923 ?auto_674928 ) ) ( not ( = ?auto_674923 ?auto_674929 ) ) ( not ( = ?auto_674923 ?auto_674930 ) ) ( not ( = ?auto_674923 ?auto_674931 ) ) ( not ( = ?auto_674923 ?auto_674932 ) ) ( not ( = ?auto_674923 ?auto_674933 ) ) ( not ( = ?auto_674923 ?auto_674934 ) ) ( not ( = ?auto_674924 ?auto_674925 ) ) ( not ( = ?auto_674924 ?auto_674926 ) ) ( not ( = ?auto_674924 ?auto_674927 ) ) ( not ( = ?auto_674924 ?auto_674928 ) ) ( not ( = ?auto_674924 ?auto_674929 ) ) ( not ( = ?auto_674924 ?auto_674930 ) ) ( not ( = ?auto_674924 ?auto_674931 ) ) ( not ( = ?auto_674924 ?auto_674932 ) ) ( not ( = ?auto_674924 ?auto_674933 ) ) ( not ( = ?auto_674924 ?auto_674934 ) ) ( not ( = ?auto_674925 ?auto_674926 ) ) ( not ( = ?auto_674925 ?auto_674927 ) ) ( not ( = ?auto_674925 ?auto_674928 ) ) ( not ( = ?auto_674925 ?auto_674929 ) ) ( not ( = ?auto_674925 ?auto_674930 ) ) ( not ( = ?auto_674925 ?auto_674931 ) ) ( not ( = ?auto_674925 ?auto_674932 ) ) ( not ( = ?auto_674925 ?auto_674933 ) ) ( not ( = ?auto_674925 ?auto_674934 ) ) ( not ( = ?auto_674926 ?auto_674927 ) ) ( not ( = ?auto_674926 ?auto_674928 ) ) ( not ( = ?auto_674926 ?auto_674929 ) ) ( not ( = ?auto_674926 ?auto_674930 ) ) ( not ( = ?auto_674926 ?auto_674931 ) ) ( not ( = ?auto_674926 ?auto_674932 ) ) ( not ( = ?auto_674926 ?auto_674933 ) ) ( not ( = ?auto_674926 ?auto_674934 ) ) ( not ( = ?auto_674927 ?auto_674928 ) ) ( not ( = ?auto_674927 ?auto_674929 ) ) ( not ( = ?auto_674927 ?auto_674930 ) ) ( not ( = ?auto_674927 ?auto_674931 ) ) ( not ( = ?auto_674927 ?auto_674932 ) ) ( not ( = ?auto_674927 ?auto_674933 ) ) ( not ( = ?auto_674927 ?auto_674934 ) ) ( not ( = ?auto_674928 ?auto_674929 ) ) ( not ( = ?auto_674928 ?auto_674930 ) ) ( not ( = ?auto_674928 ?auto_674931 ) ) ( not ( = ?auto_674928 ?auto_674932 ) ) ( not ( = ?auto_674928 ?auto_674933 ) ) ( not ( = ?auto_674928 ?auto_674934 ) ) ( not ( = ?auto_674929 ?auto_674930 ) ) ( not ( = ?auto_674929 ?auto_674931 ) ) ( not ( = ?auto_674929 ?auto_674932 ) ) ( not ( = ?auto_674929 ?auto_674933 ) ) ( not ( = ?auto_674929 ?auto_674934 ) ) ( not ( = ?auto_674930 ?auto_674931 ) ) ( not ( = ?auto_674930 ?auto_674932 ) ) ( not ( = ?auto_674930 ?auto_674933 ) ) ( not ( = ?auto_674930 ?auto_674934 ) ) ( not ( = ?auto_674931 ?auto_674932 ) ) ( not ( = ?auto_674931 ?auto_674933 ) ) ( not ( = ?auto_674931 ?auto_674934 ) ) ( not ( = ?auto_674932 ?auto_674933 ) ) ( not ( = ?auto_674932 ?auto_674934 ) ) ( not ( = ?auto_674933 ?auto_674934 ) ) ( ON ?auto_674932 ?auto_674933 ) ( ON ?auto_674931 ?auto_674932 ) ( ON ?auto_674930 ?auto_674931 ) ( ON ?auto_674929 ?auto_674930 ) ( CLEAR ?auto_674927 ) ( ON ?auto_674928 ?auto_674929 ) ( CLEAR ?auto_674928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_674922 ?auto_674923 ?auto_674924 ?auto_674925 ?auto_674926 ?auto_674927 ?auto_674928 )
      ( MAKE-12PILE ?auto_674922 ?auto_674923 ?auto_674924 ?auto_674925 ?auto_674926 ?auto_674927 ?auto_674928 ?auto_674929 ?auto_674930 ?auto_674931 ?auto_674932 ?auto_674933 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_674972 - BLOCK
      ?auto_674973 - BLOCK
      ?auto_674974 - BLOCK
      ?auto_674975 - BLOCK
      ?auto_674976 - BLOCK
      ?auto_674977 - BLOCK
      ?auto_674978 - BLOCK
      ?auto_674979 - BLOCK
      ?auto_674980 - BLOCK
      ?auto_674981 - BLOCK
      ?auto_674982 - BLOCK
      ?auto_674983 - BLOCK
    )
    :vars
    (
      ?auto_674984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_674983 ?auto_674984 ) ( ON-TABLE ?auto_674972 ) ( ON ?auto_674973 ?auto_674972 ) ( ON ?auto_674974 ?auto_674973 ) ( ON ?auto_674975 ?auto_674974 ) ( ON ?auto_674976 ?auto_674975 ) ( not ( = ?auto_674972 ?auto_674973 ) ) ( not ( = ?auto_674972 ?auto_674974 ) ) ( not ( = ?auto_674972 ?auto_674975 ) ) ( not ( = ?auto_674972 ?auto_674976 ) ) ( not ( = ?auto_674972 ?auto_674977 ) ) ( not ( = ?auto_674972 ?auto_674978 ) ) ( not ( = ?auto_674972 ?auto_674979 ) ) ( not ( = ?auto_674972 ?auto_674980 ) ) ( not ( = ?auto_674972 ?auto_674981 ) ) ( not ( = ?auto_674972 ?auto_674982 ) ) ( not ( = ?auto_674972 ?auto_674983 ) ) ( not ( = ?auto_674972 ?auto_674984 ) ) ( not ( = ?auto_674973 ?auto_674974 ) ) ( not ( = ?auto_674973 ?auto_674975 ) ) ( not ( = ?auto_674973 ?auto_674976 ) ) ( not ( = ?auto_674973 ?auto_674977 ) ) ( not ( = ?auto_674973 ?auto_674978 ) ) ( not ( = ?auto_674973 ?auto_674979 ) ) ( not ( = ?auto_674973 ?auto_674980 ) ) ( not ( = ?auto_674973 ?auto_674981 ) ) ( not ( = ?auto_674973 ?auto_674982 ) ) ( not ( = ?auto_674973 ?auto_674983 ) ) ( not ( = ?auto_674973 ?auto_674984 ) ) ( not ( = ?auto_674974 ?auto_674975 ) ) ( not ( = ?auto_674974 ?auto_674976 ) ) ( not ( = ?auto_674974 ?auto_674977 ) ) ( not ( = ?auto_674974 ?auto_674978 ) ) ( not ( = ?auto_674974 ?auto_674979 ) ) ( not ( = ?auto_674974 ?auto_674980 ) ) ( not ( = ?auto_674974 ?auto_674981 ) ) ( not ( = ?auto_674974 ?auto_674982 ) ) ( not ( = ?auto_674974 ?auto_674983 ) ) ( not ( = ?auto_674974 ?auto_674984 ) ) ( not ( = ?auto_674975 ?auto_674976 ) ) ( not ( = ?auto_674975 ?auto_674977 ) ) ( not ( = ?auto_674975 ?auto_674978 ) ) ( not ( = ?auto_674975 ?auto_674979 ) ) ( not ( = ?auto_674975 ?auto_674980 ) ) ( not ( = ?auto_674975 ?auto_674981 ) ) ( not ( = ?auto_674975 ?auto_674982 ) ) ( not ( = ?auto_674975 ?auto_674983 ) ) ( not ( = ?auto_674975 ?auto_674984 ) ) ( not ( = ?auto_674976 ?auto_674977 ) ) ( not ( = ?auto_674976 ?auto_674978 ) ) ( not ( = ?auto_674976 ?auto_674979 ) ) ( not ( = ?auto_674976 ?auto_674980 ) ) ( not ( = ?auto_674976 ?auto_674981 ) ) ( not ( = ?auto_674976 ?auto_674982 ) ) ( not ( = ?auto_674976 ?auto_674983 ) ) ( not ( = ?auto_674976 ?auto_674984 ) ) ( not ( = ?auto_674977 ?auto_674978 ) ) ( not ( = ?auto_674977 ?auto_674979 ) ) ( not ( = ?auto_674977 ?auto_674980 ) ) ( not ( = ?auto_674977 ?auto_674981 ) ) ( not ( = ?auto_674977 ?auto_674982 ) ) ( not ( = ?auto_674977 ?auto_674983 ) ) ( not ( = ?auto_674977 ?auto_674984 ) ) ( not ( = ?auto_674978 ?auto_674979 ) ) ( not ( = ?auto_674978 ?auto_674980 ) ) ( not ( = ?auto_674978 ?auto_674981 ) ) ( not ( = ?auto_674978 ?auto_674982 ) ) ( not ( = ?auto_674978 ?auto_674983 ) ) ( not ( = ?auto_674978 ?auto_674984 ) ) ( not ( = ?auto_674979 ?auto_674980 ) ) ( not ( = ?auto_674979 ?auto_674981 ) ) ( not ( = ?auto_674979 ?auto_674982 ) ) ( not ( = ?auto_674979 ?auto_674983 ) ) ( not ( = ?auto_674979 ?auto_674984 ) ) ( not ( = ?auto_674980 ?auto_674981 ) ) ( not ( = ?auto_674980 ?auto_674982 ) ) ( not ( = ?auto_674980 ?auto_674983 ) ) ( not ( = ?auto_674980 ?auto_674984 ) ) ( not ( = ?auto_674981 ?auto_674982 ) ) ( not ( = ?auto_674981 ?auto_674983 ) ) ( not ( = ?auto_674981 ?auto_674984 ) ) ( not ( = ?auto_674982 ?auto_674983 ) ) ( not ( = ?auto_674982 ?auto_674984 ) ) ( not ( = ?auto_674983 ?auto_674984 ) ) ( ON ?auto_674982 ?auto_674983 ) ( ON ?auto_674981 ?auto_674982 ) ( ON ?auto_674980 ?auto_674981 ) ( ON ?auto_674979 ?auto_674980 ) ( ON ?auto_674978 ?auto_674979 ) ( CLEAR ?auto_674976 ) ( ON ?auto_674977 ?auto_674978 ) ( CLEAR ?auto_674977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_674972 ?auto_674973 ?auto_674974 ?auto_674975 ?auto_674976 ?auto_674977 )
      ( MAKE-12PILE ?auto_674972 ?auto_674973 ?auto_674974 ?auto_674975 ?auto_674976 ?auto_674977 ?auto_674978 ?auto_674979 ?auto_674980 ?auto_674981 ?auto_674982 ?auto_674983 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_675022 - BLOCK
      ?auto_675023 - BLOCK
      ?auto_675024 - BLOCK
      ?auto_675025 - BLOCK
      ?auto_675026 - BLOCK
      ?auto_675027 - BLOCK
      ?auto_675028 - BLOCK
      ?auto_675029 - BLOCK
      ?auto_675030 - BLOCK
      ?auto_675031 - BLOCK
      ?auto_675032 - BLOCK
      ?auto_675033 - BLOCK
    )
    :vars
    (
      ?auto_675034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675033 ?auto_675034 ) ( ON-TABLE ?auto_675022 ) ( ON ?auto_675023 ?auto_675022 ) ( ON ?auto_675024 ?auto_675023 ) ( ON ?auto_675025 ?auto_675024 ) ( not ( = ?auto_675022 ?auto_675023 ) ) ( not ( = ?auto_675022 ?auto_675024 ) ) ( not ( = ?auto_675022 ?auto_675025 ) ) ( not ( = ?auto_675022 ?auto_675026 ) ) ( not ( = ?auto_675022 ?auto_675027 ) ) ( not ( = ?auto_675022 ?auto_675028 ) ) ( not ( = ?auto_675022 ?auto_675029 ) ) ( not ( = ?auto_675022 ?auto_675030 ) ) ( not ( = ?auto_675022 ?auto_675031 ) ) ( not ( = ?auto_675022 ?auto_675032 ) ) ( not ( = ?auto_675022 ?auto_675033 ) ) ( not ( = ?auto_675022 ?auto_675034 ) ) ( not ( = ?auto_675023 ?auto_675024 ) ) ( not ( = ?auto_675023 ?auto_675025 ) ) ( not ( = ?auto_675023 ?auto_675026 ) ) ( not ( = ?auto_675023 ?auto_675027 ) ) ( not ( = ?auto_675023 ?auto_675028 ) ) ( not ( = ?auto_675023 ?auto_675029 ) ) ( not ( = ?auto_675023 ?auto_675030 ) ) ( not ( = ?auto_675023 ?auto_675031 ) ) ( not ( = ?auto_675023 ?auto_675032 ) ) ( not ( = ?auto_675023 ?auto_675033 ) ) ( not ( = ?auto_675023 ?auto_675034 ) ) ( not ( = ?auto_675024 ?auto_675025 ) ) ( not ( = ?auto_675024 ?auto_675026 ) ) ( not ( = ?auto_675024 ?auto_675027 ) ) ( not ( = ?auto_675024 ?auto_675028 ) ) ( not ( = ?auto_675024 ?auto_675029 ) ) ( not ( = ?auto_675024 ?auto_675030 ) ) ( not ( = ?auto_675024 ?auto_675031 ) ) ( not ( = ?auto_675024 ?auto_675032 ) ) ( not ( = ?auto_675024 ?auto_675033 ) ) ( not ( = ?auto_675024 ?auto_675034 ) ) ( not ( = ?auto_675025 ?auto_675026 ) ) ( not ( = ?auto_675025 ?auto_675027 ) ) ( not ( = ?auto_675025 ?auto_675028 ) ) ( not ( = ?auto_675025 ?auto_675029 ) ) ( not ( = ?auto_675025 ?auto_675030 ) ) ( not ( = ?auto_675025 ?auto_675031 ) ) ( not ( = ?auto_675025 ?auto_675032 ) ) ( not ( = ?auto_675025 ?auto_675033 ) ) ( not ( = ?auto_675025 ?auto_675034 ) ) ( not ( = ?auto_675026 ?auto_675027 ) ) ( not ( = ?auto_675026 ?auto_675028 ) ) ( not ( = ?auto_675026 ?auto_675029 ) ) ( not ( = ?auto_675026 ?auto_675030 ) ) ( not ( = ?auto_675026 ?auto_675031 ) ) ( not ( = ?auto_675026 ?auto_675032 ) ) ( not ( = ?auto_675026 ?auto_675033 ) ) ( not ( = ?auto_675026 ?auto_675034 ) ) ( not ( = ?auto_675027 ?auto_675028 ) ) ( not ( = ?auto_675027 ?auto_675029 ) ) ( not ( = ?auto_675027 ?auto_675030 ) ) ( not ( = ?auto_675027 ?auto_675031 ) ) ( not ( = ?auto_675027 ?auto_675032 ) ) ( not ( = ?auto_675027 ?auto_675033 ) ) ( not ( = ?auto_675027 ?auto_675034 ) ) ( not ( = ?auto_675028 ?auto_675029 ) ) ( not ( = ?auto_675028 ?auto_675030 ) ) ( not ( = ?auto_675028 ?auto_675031 ) ) ( not ( = ?auto_675028 ?auto_675032 ) ) ( not ( = ?auto_675028 ?auto_675033 ) ) ( not ( = ?auto_675028 ?auto_675034 ) ) ( not ( = ?auto_675029 ?auto_675030 ) ) ( not ( = ?auto_675029 ?auto_675031 ) ) ( not ( = ?auto_675029 ?auto_675032 ) ) ( not ( = ?auto_675029 ?auto_675033 ) ) ( not ( = ?auto_675029 ?auto_675034 ) ) ( not ( = ?auto_675030 ?auto_675031 ) ) ( not ( = ?auto_675030 ?auto_675032 ) ) ( not ( = ?auto_675030 ?auto_675033 ) ) ( not ( = ?auto_675030 ?auto_675034 ) ) ( not ( = ?auto_675031 ?auto_675032 ) ) ( not ( = ?auto_675031 ?auto_675033 ) ) ( not ( = ?auto_675031 ?auto_675034 ) ) ( not ( = ?auto_675032 ?auto_675033 ) ) ( not ( = ?auto_675032 ?auto_675034 ) ) ( not ( = ?auto_675033 ?auto_675034 ) ) ( ON ?auto_675032 ?auto_675033 ) ( ON ?auto_675031 ?auto_675032 ) ( ON ?auto_675030 ?auto_675031 ) ( ON ?auto_675029 ?auto_675030 ) ( ON ?auto_675028 ?auto_675029 ) ( ON ?auto_675027 ?auto_675028 ) ( CLEAR ?auto_675025 ) ( ON ?auto_675026 ?auto_675027 ) ( CLEAR ?auto_675026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_675022 ?auto_675023 ?auto_675024 ?auto_675025 ?auto_675026 )
      ( MAKE-12PILE ?auto_675022 ?auto_675023 ?auto_675024 ?auto_675025 ?auto_675026 ?auto_675027 ?auto_675028 ?auto_675029 ?auto_675030 ?auto_675031 ?auto_675032 ?auto_675033 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_675072 - BLOCK
      ?auto_675073 - BLOCK
      ?auto_675074 - BLOCK
      ?auto_675075 - BLOCK
      ?auto_675076 - BLOCK
      ?auto_675077 - BLOCK
      ?auto_675078 - BLOCK
      ?auto_675079 - BLOCK
      ?auto_675080 - BLOCK
      ?auto_675081 - BLOCK
      ?auto_675082 - BLOCK
      ?auto_675083 - BLOCK
    )
    :vars
    (
      ?auto_675084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675083 ?auto_675084 ) ( ON-TABLE ?auto_675072 ) ( ON ?auto_675073 ?auto_675072 ) ( ON ?auto_675074 ?auto_675073 ) ( not ( = ?auto_675072 ?auto_675073 ) ) ( not ( = ?auto_675072 ?auto_675074 ) ) ( not ( = ?auto_675072 ?auto_675075 ) ) ( not ( = ?auto_675072 ?auto_675076 ) ) ( not ( = ?auto_675072 ?auto_675077 ) ) ( not ( = ?auto_675072 ?auto_675078 ) ) ( not ( = ?auto_675072 ?auto_675079 ) ) ( not ( = ?auto_675072 ?auto_675080 ) ) ( not ( = ?auto_675072 ?auto_675081 ) ) ( not ( = ?auto_675072 ?auto_675082 ) ) ( not ( = ?auto_675072 ?auto_675083 ) ) ( not ( = ?auto_675072 ?auto_675084 ) ) ( not ( = ?auto_675073 ?auto_675074 ) ) ( not ( = ?auto_675073 ?auto_675075 ) ) ( not ( = ?auto_675073 ?auto_675076 ) ) ( not ( = ?auto_675073 ?auto_675077 ) ) ( not ( = ?auto_675073 ?auto_675078 ) ) ( not ( = ?auto_675073 ?auto_675079 ) ) ( not ( = ?auto_675073 ?auto_675080 ) ) ( not ( = ?auto_675073 ?auto_675081 ) ) ( not ( = ?auto_675073 ?auto_675082 ) ) ( not ( = ?auto_675073 ?auto_675083 ) ) ( not ( = ?auto_675073 ?auto_675084 ) ) ( not ( = ?auto_675074 ?auto_675075 ) ) ( not ( = ?auto_675074 ?auto_675076 ) ) ( not ( = ?auto_675074 ?auto_675077 ) ) ( not ( = ?auto_675074 ?auto_675078 ) ) ( not ( = ?auto_675074 ?auto_675079 ) ) ( not ( = ?auto_675074 ?auto_675080 ) ) ( not ( = ?auto_675074 ?auto_675081 ) ) ( not ( = ?auto_675074 ?auto_675082 ) ) ( not ( = ?auto_675074 ?auto_675083 ) ) ( not ( = ?auto_675074 ?auto_675084 ) ) ( not ( = ?auto_675075 ?auto_675076 ) ) ( not ( = ?auto_675075 ?auto_675077 ) ) ( not ( = ?auto_675075 ?auto_675078 ) ) ( not ( = ?auto_675075 ?auto_675079 ) ) ( not ( = ?auto_675075 ?auto_675080 ) ) ( not ( = ?auto_675075 ?auto_675081 ) ) ( not ( = ?auto_675075 ?auto_675082 ) ) ( not ( = ?auto_675075 ?auto_675083 ) ) ( not ( = ?auto_675075 ?auto_675084 ) ) ( not ( = ?auto_675076 ?auto_675077 ) ) ( not ( = ?auto_675076 ?auto_675078 ) ) ( not ( = ?auto_675076 ?auto_675079 ) ) ( not ( = ?auto_675076 ?auto_675080 ) ) ( not ( = ?auto_675076 ?auto_675081 ) ) ( not ( = ?auto_675076 ?auto_675082 ) ) ( not ( = ?auto_675076 ?auto_675083 ) ) ( not ( = ?auto_675076 ?auto_675084 ) ) ( not ( = ?auto_675077 ?auto_675078 ) ) ( not ( = ?auto_675077 ?auto_675079 ) ) ( not ( = ?auto_675077 ?auto_675080 ) ) ( not ( = ?auto_675077 ?auto_675081 ) ) ( not ( = ?auto_675077 ?auto_675082 ) ) ( not ( = ?auto_675077 ?auto_675083 ) ) ( not ( = ?auto_675077 ?auto_675084 ) ) ( not ( = ?auto_675078 ?auto_675079 ) ) ( not ( = ?auto_675078 ?auto_675080 ) ) ( not ( = ?auto_675078 ?auto_675081 ) ) ( not ( = ?auto_675078 ?auto_675082 ) ) ( not ( = ?auto_675078 ?auto_675083 ) ) ( not ( = ?auto_675078 ?auto_675084 ) ) ( not ( = ?auto_675079 ?auto_675080 ) ) ( not ( = ?auto_675079 ?auto_675081 ) ) ( not ( = ?auto_675079 ?auto_675082 ) ) ( not ( = ?auto_675079 ?auto_675083 ) ) ( not ( = ?auto_675079 ?auto_675084 ) ) ( not ( = ?auto_675080 ?auto_675081 ) ) ( not ( = ?auto_675080 ?auto_675082 ) ) ( not ( = ?auto_675080 ?auto_675083 ) ) ( not ( = ?auto_675080 ?auto_675084 ) ) ( not ( = ?auto_675081 ?auto_675082 ) ) ( not ( = ?auto_675081 ?auto_675083 ) ) ( not ( = ?auto_675081 ?auto_675084 ) ) ( not ( = ?auto_675082 ?auto_675083 ) ) ( not ( = ?auto_675082 ?auto_675084 ) ) ( not ( = ?auto_675083 ?auto_675084 ) ) ( ON ?auto_675082 ?auto_675083 ) ( ON ?auto_675081 ?auto_675082 ) ( ON ?auto_675080 ?auto_675081 ) ( ON ?auto_675079 ?auto_675080 ) ( ON ?auto_675078 ?auto_675079 ) ( ON ?auto_675077 ?auto_675078 ) ( ON ?auto_675076 ?auto_675077 ) ( CLEAR ?auto_675074 ) ( ON ?auto_675075 ?auto_675076 ) ( CLEAR ?auto_675075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_675072 ?auto_675073 ?auto_675074 ?auto_675075 )
      ( MAKE-12PILE ?auto_675072 ?auto_675073 ?auto_675074 ?auto_675075 ?auto_675076 ?auto_675077 ?auto_675078 ?auto_675079 ?auto_675080 ?auto_675081 ?auto_675082 ?auto_675083 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_675122 - BLOCK
      ?auto_675123 - BLOCK
      ?auto_675124 - BLOCK
      ?auto_675125 - BLOCK
      ?auto_675126 - BLOCK
      ?auto_675127 - BLOCK
      ?auto_675128 - BLOCK
      ?auto_675129 - BLOCK
      ?auto_675130 - BLOCK
      ?auto_675131 - BLOCK
      ?auto_675132 - BLOCK
      ?auto_675133 - BLOCK
    )
    :vars
    (
      ?auto_675134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675133 ?auto_675134 ) ( ON-TABLE ?auto_675122 ) ( ON ?auto_675123 ?auto_675122 ) ( not ( = ?auto_675122 ?auto_675123 ) ) ( not ( = ?auto_675122 ?auto_675124 ) ) ( not ( = ?auto_675122 ?auto_675125 ) ) ( not ( = ?auto_675122 ?auto_675126 ) ) ( not ( = ?auto_675122 ?auto_675127 ) ) ( not ( = ?auto_675122 ?auto_675128 ) ) ( not ( = ?auto_675122 ?auto_675129 ) ) ( not ( = ?auto_675122 ?auto_675130 ) ) ( not ( = ?auto_675122 ?auto_675131 ) ) ( not ( = ?auto_675122 ?auto_675132 ) ) ( not ( = ?auto_675122 ?auto_675133 ) ) ( not ( = ?auto_675122 ?auto_675134 ) ) ( not ( = ?auto_675123 ?auto_675124 ) ) ( not ( = ?auto_675123 ?auto_675125 ) ) ( not ( = ?auto_675123 ?auto_675126 ) ) ( not ( = ?auto_675123 ?auto_675127 ) ) ( not ( = ?auto_675123 ?auto_675128 ) ) ( not ( = ?auto_675123 ?auto_675129 ) ) ( not ( = ?auto_675123 ?auto_675130 ) ) ( not ( = ?auto_675123 ?auto_675131 ) ) ( not ( = ?auto_675123 ?auto_675132 ) ) ( not ( = ?auto_675123 ?auto_675133 ) ) ( not ( = ?auto_675123 ?auto_675134 ) ) ( not ( = ?auto_675124 ?auto_675125 ) ) ( not ( = ?auto_675124 ?auto_675126 ) ) ( not ( = ?auto_675124 ?auto_675127 ) ) ( not ( = ?auto_675124 ?auto_675128 ) ) ( not ( = ?auto_675124 ?auto_675129 ) ) ( not ( = ?auto_675124 ?auto_675130 ) ) ( not ( = ?auto_675124 ?auto_675131 ) ) ( not ( = ?auto_675124 ?auto_675132 ) ) ( not ( = ?auto_675124 ?auto_675133 ) ) ( not ( = ?auto_675124 ?auto_675134 ) ) ( not ( = ?auto_675125 ?auto_675126 ) ) ( not ( = ?auto_675125 ?auto_675127 ) ) ( not ( = ?auto_675125 ?auto_675128 ) ) ( not ( = ?auto_675125 ?auto_675129 ) ) ( not ( = ?auto_675125 ?auto_675130 ) ) ( not ( = ?auto_675125 ?auto_675131 ) ) ( not ( = ?auto_675125 ?auto_675132 ) ) ( not ( = ?auto_675125 ?auto_675133 ) ) ( not ( = ?auto_675125 ?auto_675134 ) ) ( not ( = ?auto_675126 ?auto_675127 ) ) ( not ( = ?auto_675126 ?auto_675128 ) ) ( not ( = ?auto_675126 ?auto_675129 ) ) ( not ( = ?auto_675126 ?auto_675130 ) ) ( not ( = ?auto_675126 ?auto_675131 ) ) ( not ( = ?auto_675126 ?auto_675132 ) ) ( not ( = ?auto_675126 ?auto_675133 ) ) ( not ( = ?auto_675126 ?auto_675134 ) ) ( not ( = ?auto_675127 ?auto_675128 ) ) ( not ( = ?auto_675127 ?auto_675129 ) ) ( not ( = ?auto_675127 ?auto_675130 ) ) ( not ( = ?auto_675127 ?auto_675131 ) ) ( not ( = ?auto_675127 ?auto_675132 ) ) ( not ( = ?auto_675127 ?auto_675133 ) ) ( not ( = ?auto_675127 ?auto_675134 ) ) ( not ( = ?auto_675128 ?auto_675129 ) ) ( not ( = ?auto_675128 ?auto_675130 ) ) ( not ( = ?auto_675128 ?auto_675131 ) ) ( not ( = ?auto_675128 ?auto_675132 ) ) ( not ( = ?auto_675128 ?auto_675133 ) ) ( not ( = ?auto_675128 ?auto_675134 ) ) ( not ( = ?auto_675129 ?auto_675130 ) ) ( not ( = ?auto_675129 ?auto_675131 ) ) ( not ( = ?auto_675129 ?auto_675132 ) ) ( not ( = ?auto_675129 ?auto_675133 ) ) ( not ( = ?auto_675129 ?auto_675134 ) ) ( not ( = ?auto_675130 ?auto_675131 ) ) ( not ( = ?auto_675130 ?auto_675132 ) ) ( not ( = ?auto_675130 ?auto_675133 ) ) ( not ( = ?auto_675130 ?auto_675134 ) ) ( not ( = ?auto_675131 ?auto_675132 ) ) ( not ( = ?auto_675131 ?auto_675133 ) ) ( not ( = ?auto_675131 ?auto_675134 ) ) ( not ( = ?auto_675132 ?auto_675133 ) ) ( not ( = ?auto_675132 ?auto_675134 ) ) ( not ( = ?auto_675133 ?auto_675134 ) ) ( ON ?auto_675132 ?auto_675133 ) ( ON ?auto_675131 ?auto_675132 ) ( ON ?auto_675130 ?auto_675131 ) ( ON ?auto_675129 ?auto_675130 ) ( ON ?auto_675128 ?auto_675129 ) ( ON ?auto_675127 ?auto_675128 ) ( ON ?auto_675126 ?auto_675127 ) ( ON ?auto_675125 ?auto_675126 ) ( CLEAR ?auto_675123 ) ( ON ?auto_675124 ?auto_675125 ) ( CLEAR ?auto_675124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_675122 ?auto_675123 ?auto_675124 )
      ( MAKE-12PILE ?auto_675122 ?auto_675123 ?auto_675124 ?auto_675125 ?auto_675126 ?auto_675127 ?auto_675128 ?auto_675129 ?auto_675130 ?auto_675131 ?auto_675132 ?auto_675133 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_675172 - BLOCK
      ?auto_675173 - BLOCK
      ?auto_675174 - BLOCK
      ?auto_675175 - BLOCK
      ?auto_675176 - BLOCK
      ?auto_675177 - BLOCK
      ?auto_675178 - BLOCK
      ?auto_675179 - BLOCK
      ?auto_675180 - BLOCK
      ?auto_675181 - BLOCK
      ?auto_675182 - BLOCK
      ?auto_675183 - BLOCK
    )
    :vars
    (
      ?auto_675184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675183 ?auto_675184 ) ( ON-TABLE ?auto_675172 ) ( not ( = ?auto_675172 ?auto_675173 ) ) ( not ( = ?auto_675172 ?auto_675174 ) ) ( not ( = ?auto_675172 ?auto_675175 ) ) ( not ( = ?auto_675172 ?auto_675176 ) ) ( not ( = ?auto_675172 ?auto_675177 ) ) ( not ( = ?auto_675172 ?auto_675178 ) ) ( not ( = ?auto_675172 ?auto_675179 ) ) ( not ( = ?auto_675172 ?auto_675180 ) ) ( not ( = ?auto_675172 ?auto_675181 ) ) ( not ( = ?auto_675172 ?auto_675182 ) ) ( not ( = ?auto_675172 ?auto_675183 ) ) ( not ( = ?auto_675172 ?auto_675184 ) ) ( not ( = ?auto_675173 ?auto_675174 ) ) ( not ( = ?auto_675173 ?auto_675175 ) ) ( not ( = ?auto_675173 ?auto_675176 ) ) ( not ( = ?auto_675173 ?auto_675177 ) ) ( not ( = ?auto_675173 ?auto_675178 ) ) ( not ( = ?auto_675173 ?auto_675179 ) ) ( not ( = ?auto_675173 ?auto_675180 ) ) ( not ( = ?auto_675173 ?auto_675181 ) ) ( not ( = ?auto_675173 ?auto_675182 ) ) ( not ( = ?auto_675173 ?auto_675183 ) ) ( not ( = ?auto_675173 ?auto_675184 ) ) ( not ( = ?auto_675174 ?auto_675175 ) ) ( not ( = ?auto_675174 ?auto_675176 ) ) ( not ( = ?auto_675174 ?auto_675177 ) ) ( not ( = ?auto_675174 ?auto_675178 ) ) ( not ( = ?auto_675174 ?auto_675179 ) ) ( not ( = ?auto_675174 ?auto_675180 ) ) ( not ( = ?auto_675174 ?auto_675181 ) ) ( not ( = ?auto_675174 ?auto_675182 ) ) ( not ( = ?auto_675174 ?auto_675183 ) ) ( not ( = ?auto_675174 ?auto_675184 ) ) ( not ( = ?auto_675175 ?auto_675176 ) ) ( not ( = ?auto_675175 ?auto_675177 ) ) ( not ( = ?auto_675175 ?auto_675178 ) ) ( not ( = ?auto_675175 ?auto_675179 ) ) ( not ( = ?auto_675175 ?auto_675180 ) ) ( not ( = ?auto_675175 ?auto_675181 ) ) ( not ( = ?auto_675175 ?auto_675182 ) ) ( not ( = ?auto_675175 ?auto_675183 ) ) ( not ( = ?auto_675175 ?auto_675184 ) ) ( not ( = ?auto_675176 ?auto_675177 ) ) ( not ( = ?auto_675176 ?auto_675178 ) ) ( not ( = ?auto_675176 ?auto_675179 ) ) ( not ( = ?auto_675176 ?auto_675180 ) ) ( not ( = ?auto_675176 ?auto_675181 ) ) ( not ( = ?auto_675176 ?auto_675182 ) ) ( not ( = ?auto_675176 ?auto_675183 ) ) ( not ( = ?auto_675176 ?auto_675184 ) ) ( not ( = ?auto_675177 ?auto_675178 ) ) ( not ( = ?auto_675177 ?auto_675179 ) ) ( not ( = ?auto_675177 ?auto_675180 ) ) ( not ( = ?auto_675177 ?auto_675181 ) ) ( not ( = ?auto_675177 ?auto_675182 ) ) ( not ( = ?auto_675177 ?auto_675183 ) ) ( not ( = ?auto_675177 ?auto_675184 ) ) ( not ( = ?auto_675178 ?auto_675179 ) ) ( not ( = ?auto_675178 ?auto_675180 ) ) ( not ( = ?auto_675178 ?auto_675181 ) ) ( not ( = ?auto_675178 ?auto_675182 ) ) ( not ( = ?auto_675178 ?auto_675183 ) ) ( not ( = ?auto_675178 ?auto_675184 ) ) ( not ( = ?auto_675179 ?auto_675180 ) ) ( not ( = ?auto_675179 ?auto_675181 ) ) ( not ( = ?auto_675179 ?auto_675182 ) ) ( not ( = ?auto_675179 ?auto_675183 ) ) ( not ( = ?auto_675179 ?auto_675184 ) ) ( not ( = ?auto_675180 ?auto_675181 ) ) ( not ( = ?auto_675180 ?auto_675182 ) ) ( not ( = ?auto_675180 ?auto_675183 ) ) ( not ( = ?auto_675180 ?auto_675184 ) ) ( not ( = ?auto_675181 ?auto_675182 ) ) ( not ( = ?auto_675181 ?auto_675183 ) ) ( not ( = ?auto_675181 ?auto_675184 ) ) ( not ( = ?auto_675182 ?auto_675183 ) ) ( not ( = ?auto_675182 ?auto_675184 ) ) ( not ( = ?auto_675183 ?auto_675184 ) ) ( ON ?auto_675182 ?auto_675183 ) ( ON ?auto_675181 ?auto_675182 ) ( ON ?auto_675180 ?auto_675181 ) ( ON ?auto_675179 ?auto_675180 ) ( ON ?auto_675178 ?auto_675179 ) ( ON ?auto_675177 ?auto_675178 ) ( ON ?auto_675176 ?auto_675177 ) ( ON ?auto_675175 ?auto_675176 ) ( ON ?auto_675174 ?auto_675175 ) ( CLEAR ?auto_675172 ) ( ON ?auto_675173 ?auto_675174 ) ( CLEAR ?auto_675173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_675172 ?auto_675173 )
      ( MAKE-12PILE ?auto_675172 ?auto_675173 ?auto_675174 ?auto_675175 ?auto_675176 ?auto_675177 ?auto_675178 ?auto_675179 ?auto_675180 ?auto_675181 ?auto_675182 ?auto_675183 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_675222 - BLOCK
      ?auto_675223 - BLOCK
      ?auto_675224 - BLOCK
      ?auto_675225 - BLOCK
      ?auto_675226 - BLOCK
      ?auto_675227 - BLOCK
      ?auto_675228 - BLOCK
      ?auto_675229 - BLOCK
      ?auto_675230 - BLOCK
      ?auto_675231 - BLOCK
      ?auto_675232 - BLOCK
      ?auto_675233 - BLOCK
    )
    :vars
    (
      ?auto_675234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675233 ?auto_675234 ) ( not ( = ?auto_675222 ?auto_675223 ) ) ( not ( = ?auto_675222 ?auto_675224 ) ) ( not ( = ?auto_675222 ?auto_675225 ) ) ( not ( = ?auto_675222 ?auto_675226 ) ) ( not ( = ?auto_675222 ?auto_675227 ) ) ( not ( = ?auto_675222 ?auto_675228 ) ) ( not ( = ?auto_675222 ?auto_675229 ) ) ( not ( = ?auto_675222 ?auto_675230 ) ) ( not ( = ?auto_675222 ?auto_675231 ) ) ( not ( = ?auto_675222 ?auto_675232 ) ) ( not ( = ?auto_675222 ?auto_675233 ) ) ( not ( = ?auto_675222 ?auto_675234 ) ) ( not ( = ?auto_675223 ?auto_675224 ) ) ( not ( = ?auto_675223 ?auto_675225 ) ) ( not ( = ?auto_675223 ?auto_675226 ) ) ( not ( = ?auto_675223 ?auto_675227 ) ) ( not ( = ?auto_675223 ?auto_675228 ) ) ( not ( = ?auto_675223 ?auto_675229 ) ) ( not ( = ?auto_675223 ?auto_675230 ) ) ( not ( = ?auto_675223 ?auto_675231 ) ) ( not ( = ?auto_675223 ?auto_675232 ) ) ( not ( = ?auto_675223 ?auto_675233 ) ) ( not ( = ?auto_675223 ?auto_675234 ) ) ( not ( = ?auto_675224 ?auto_675225 ) ) ( not ( = ?auto_675224 ?auto_675226 ) ) ( not ( = ?auto_675224 ?auto_675227 ) ) ( not ( = ?auto_675224 ?auto_675228 ) ) ( not ( = ?auto_675224 ?auto_675229 ) ) ( not ( = ?auto_675224 ?auto_675230 ) ) ( not ( = ?auto_675224 ?auto_675231 ) ) ( not ( = ?auto_675224 ?auto_675232 ) ) ( not ( = ?auto_675224 ?auto_675233 ) ) ( not ( = ?auto_675224 ?auto_675234 ) ) ( not ( = ?auto_675225 ?auto_675226 ) ) ( not ( = ?auto_675225 ?auto_675227 ) ) ( not ( = ?auto_675225 ?auto_675228 ) ) ( not ( = ?auto_675225 ?auto_675229 ) ) ( not ( = ?auto_675225 ?auto_675230 ) ) ( not ( = ?auto_675225 ?auto_675231 ) ) ( not ( = ?auto_675225 ?auto_675232 ) ) ( not ( = ?auto_675225 ?auto_675233 ) ) ( not ( = ?auto_675225 ?auto_675234 ) ) ( not ( = ?auto_675226 ?auto_675227 ) ) ( not ( = ?auto_675226 ?auto_675228 ) ) ( not ( = ?auto_675226 ?auto_675229 ) ) ( not ( = ?auto_675226 ?auto_675230 ) ) ( not ( = ?auto_675226 ?auto_675231 ) ) ( not ( = ?auto_675226 ?auto_675232 ) ) ( not ( = ?auto_675226 ?auto_675233 ) ) ( not ( = ?auto_675226 ?auto_675234 ) ) ( not ( = ?auto_675227 ?auto_675228 ) ) ( not ( = ?auto_675227 ?auto_675229 ) ) ( not ( = ?auto_675227 ?auto_675230 ) ) ( not ( = ?auto_675227 ?auto_675231 ) ) ( not ( = ?auto_675227 ?auto_675232 ) ) ( not ( = ?auto_675227 ?auto_675233 ) ) ( not ( = ?auto_675227 ?auto_675234 ) ) ( not ( = ?auto_675228 ?auto_675229 ) ) ( not ( = ?auto_675228 ?auto_675230 ) ) ( not ( = ?auto_675228 ?auto_675231 ) ) ( not ( = ?auto_675228 ?auto_675232 ) ) ( not ( = ?auto_675228 ?auto_675233 ) ) ( not ( = ?auto_675228 ?auto_675234 ) ) ( not ( = ?auto_675229 ?auto_675230 ) ) ( not ( = ?auto_675229 ?auto_675231 ) ) ( not ( = ?auto_675229 ?auto_675232 ) ) ( not ( = ?auto_675229 ?auto_675233 ) ) ( not ( = ?auto_675229 ?auto_675234 ) ) ( not ( = ?auto_675230 ?auto_675231 ) ) ( not ( = ?auto_675230 ?auto_675232 ) ) ( not ( = ?auto_675230 ?auto_675233 ) ) ( not ( = ?auto_675230 ?auto_675234 ) ) ( not ( = ?auto_675231 ?auto_675232 ) ) ( not ( = ?auto_675231 ?auto_675233 ) ) ( not ( = ?auto_675231 ?auto_675234 ) ) ( not ( = ?auto_675232 ?auto_675233 ) ) ( not ( = ?auto_675232 ?auto_675234 ) ) ( not ( = ?auto_675233 ?auto_675234 ) ) ( ON ?auto_675232 ?auto_675233 ) ( ON ?auto_675231 ?auto_675232 ) ( ON ?auto_675230 ?auto_675231 ) ( ON ?auto_675229 ?auto_675230 ) ( ON ?auto_675228 ?auto_675229 ) ( ON ?auto_675227 ?auto_675228 ) ( ON ?auto_675226 ?auto_675227 ) ( ON ?auto_675225 ?auto_675226 ) ( ON ?auto_675224 ?auto_675225 ) ( ON ?auto_675223 ?auto_675224 ) ( ON ?auto_675222 ?auto_675223 ) ( CLEAR ?auto_675222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_675222 )
      ( MAKE-12PILE ?auto_675222 ?auto_675223 ?auto_675224 ?auto_675225 ?auto_675226 ?auto_675227 ?auto_675228 ?auto_675229 ?auto_675230 ?auto_675231 ?auto_675232 ?auto_675233 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675273 - BLOCK
      ?auto_675274 - BLOCK
      ?auto_675275 - BLOCK
      ?auto_675276 - BLOCK
      ?auto_675277 - BLOCK
      ?auto_675278 - BLOCK
      ?auto_675279 - BLOCK
      ?auto_675280 - BLOCK
      ?auto_675281 - BLOCK
      ?auto_675282 - BLOCK
      ?auto_675283 - BLOCK
      ?auto_675284 - BLOCK
      ?auto_675285 - BLOCK
    )
    :vars
    (
      ?auto_675286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_675284 ) ( ON ?auto_675285 ?auto_675286 ) ( CLEAR ?auto_675285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_675273 ) ( ON ?auto_675274 ?auto_675273 ) ( ON ?auto_675275 ?auto_675274 ) ( ON ?auto_675276 ?auto_675275 ) ( ON ?auto_675277 ?auto_675276 ) ( ON ?auto_675278 ?auto_675277 ) ( ON ?auto_675279 ?auto_675278 ) ( ON ?auto_675280 ?auto_675279 ) ( ON ?auto_675281 ?auto_675280 ) ( ON ?auto_675282 ?auto_675281 ) ( ON ?auto_675283 ?auto_675282 ) ( ON ?auto_675284 ?auto_675283 ) ( not ( = ?auto_675273 ?auto_675274 ) ) ( not ( = ?auto_675273 ?auto_675275 ) ) ( not ( = ?auto_675273 ?auto_675276 ) ) ( not ( = ?auto_675273 ?auto_675277 ) ) ( not ( = ?auto_675273 ?auto_675278 ) ) ( not ( = ?auto_675273 ?auto_675279 ) ) ( not ( = ?auto_675273 ?auto_675280 ) ) ( not ( = ?auto_675273 ?auto_675281 ) ) ( not ( = ?auto_675273 ?auto_675282 ) ) ( not ( = ?auto_675273 ?auto_675283 ) ) ( not ( = ?auto_675273 ?auto_675284 ) ) ( not ( = ?auto_675273 ?auto_675285 ) ) ( not ( = ?auto_675273 ?auto_675286 ) ) ( not ( = ?auto_675274 ?auto_675275 ) ) ( not ( = ?auto_675274 ?auto_675276 ) ) ( not ( = ?auto_675274 ?auto_675277 ) ) ( not ( = ?auto_675274 ?auto_675278 ) ) ( not ( = ?auto_675274 ?auto_675279 ) ) ( not ( = ?auto_675274 ?auto_675280 ) ) ( not ( = ?auto_675274 ?auto_675281 ) ) ( not ( = ?auto_675274 ?auto_675282 ) ) ( not ( = ?auto_675274 ?auto_675283 ) ) ( not ( = ?auto_675274 ?auto_675284 ) ) ( not ( = ?auto_675274 ?auto_675285 ) ) ( not ( = ?auto_675274 ?auto_675286 ) ) ( not ( = ?auto_675275 ?auto_675276 ) ) ( not ( = ?auto_675275 ?auto_675277 ) ) ( not ( = ?auto_675275 ?auto_675278 ) ) ( not ( = ?auto_675275 ?auto_675279 ) ) ( not ( = ?auto_675275 ?auto_675280 ) ) ( not ( = ?auto_675275 ?auto_675281 ) ) ( not ( = ?auto_675275 ?auto_675282 ) ) ( not ( = ?auto_675275 ?auto_675283 ) ) ( not ( = ?auto_675275 ?auto_675284 ) ) ( not ( = ?auto_675275 ?auto_675285 ) ) ( not ( = ?auto_675275 ?auto_675286 ) ) ( not ( = ?auto_675276 ?auto_675277 ) ) ( not ( = ?auto_675276 ?auto_675278 ) ) ( not ( = ?auto_675276 ?auto_675279 ) ) ( not ( = ?auto_675276 ?auto_675280 ) ) ( not ( = ?auto_675276 ?auto_675281 ) ) ( not ( = ?auto_675276 ?auto_675282 ) ) ( not ( = ?auto_675276 ?auto_675283 ) ) ( not ( = ?auto_675276 ?auto_675284 ) ) ( not ( = ?auto_675276 ?auto_675285 ) ) ( not ( = ?auto_675276 ?auto_675286 ) ) ( not ( = ?auto_675277 ?auto_675278 ) ) ( not ( = ?auto_675277 ?auto_675279 ) ) ( not ( = ?auto_675277 ?auto_675280 ) ) ( not ( = ?auto_675277 ?auto_675281 ) ) ( not ( = ?auto_675277 ?auto_675282 ) ) ( not ( = ?auto_675277 ?auto_675283 ) ) ( not ( = ?auto_675277 ?auto_675284 ) ) ( not ( = ?auto_675277 ?auto_675285 ) ) ( not ( = ?auto_675277 ?auto_675286 ) ) ( not ( = ?auto_675278 ?auto_675279 ) ) ( not ( = ?auto_675278 ?auto_675280 ) ) ( not ( = ?auto_675278 ?auto_675281 ) ) ( not ( = ?auto_675278 ?auto_675282 ) ) ( not ( = ?auto_675278 ?auto_675283 ) ) ( not ( = ?auto_675278 ?auto_675284 ) ) ( not ( = ?auto_675278 ?auto_675285 ) ) ( not ( = ?auto_675278 ?auto_675286 ) ) ( not ( = ?auto_675279 ?auto_675280 ) ) ( not ( = ?auto_675279 ?auto_675281 ) ) ( not ( = ?auto_675279 ?auto_675282 ) ) ( not ( = ?auto_675279 ?auto_675283 ) ) ( not ( = ?auto_675279 ?auto_675284 ) ) ( not ( = ?auto_675279 ?auto_675285 ) ) ( not ( = ?auto_675279 ?auto_675286 ) ) ( not ( = ?auto_675280 ?auto_675281 ) ) ( not ( = ?auto_675280 ?auto_675282 ) ) ( not ( = ?auto_675280 ?auto_675283 ) ) ( not ( = ?auto_675280 ?auto_675284 ) ) ( not ( = ?auto_675280 ?auto_675285 ) ) ( not ( = ?auto_675280 ?auto_675286 ) ) ( not ( = ?auto_675281 ?auto_675282 ) ) ( not ( = ?auto_675281 ?auto_675283 ) ) ( not ( = ?auto_675281 ?auto_675284 ) ) ( not ( = ?auto_675281 ?auto_675285 ) ) ( not ( = ?auto_675281 ?auto_675286 ) ) ( not ( = ?auto_675282 ?auto_675283 ) ) ( not ( = ?auto_675282 ?auto_675284 ) ) ( not ( = ?auto_675282 ?auto_675285 ) ) ( not ( = ?auto_675282 ?auto_675286 ) ) ( not ( = ?auto_675283 ?auto_675284 ) ) ( not ( = ?auto_675283 ?auto_675285 ) ) ( not ( = ?auto_675283 ?auto_675286 ) ) ( not ( = ?auto_675284 ?auto_675285 ) ) ( not ( = ?auto_675284 ?auto_675286 ) ) ( not ( = ?auto_675285 ?auto_675286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_675285 ?auto_675286 )
      ( !STACK ?auto_675285 ?auto_675284 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675327 - BLOCK
      ?auto_675328 - BLOCK
      ?auto_675329 - BLOCK
      ?auto_675330 - BLOCK
      ?auto_675331 - BLOCK
      ?auto_675332 - BLOCK
      ?auto_675333 - BLOCK
      ?auto_675334 - BLOCK
      ?auto_675335 - BLOCK
      ?auto_675336 - BLOCK
      ?auto_675337 - BLOCK
      ?auto_675338 - BLOCK
      ?auto_675339 - BLOCK
    )
    :vars
    (
      ?auto_675340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675339 ?auto_675340 ) ( ON-TABLE ?auto_675327 ) ( ON ?auto_675328 ?auto_675327 ) ( ON ?auto_675329 ?auto_675328 ) ( ON ?auto_675330 ?auto_675329 ) ( ON ?auto_675331 ?auto_675330 ) ( ON ?auto_675332 ?auto_675331 ) ( ON ?auto_675333 ?auto_675332 ) ( ON ?auto_675334 ?auto_675333 ) ( ON ?auto_675335 ?auto_675334 ) ( ON ?auto_675336 ?auto_675335 ) ( ON ?auto_675337 ?auto_675336 ) ( not ( = ?auto_675327 ?auto_675328 ) ) ( not ( = ?auto_675327 ?auto_675329 ) ) ( not ( = ?auto_675327 ?auto_675330 ) ) ( not ( = ?auto_675327 ?auto_675331 ) ) ( not ( = ?auto_675327 ?auto_675332 ) ) ( not ( = ?auto_675327 ?auto_675333 ) ) ( not ( = ?auto_675327 ?auto_675334 ) ) ( not ( = ?auto_675327 ?auto_675335 ) ) ( not ( = ?auto_675327 ?auto_675336 ) ) ( not ( = ?auto_675327 ?auto_675337 ) ) ( not ( = ?auto_675327 ?auto_675338 ) ) ( not ( = ?auto_675327 ?auto_675339 ) ) ( not ( = ?auto_675327 ?auto_675340 ) ) ( not ( = ?auto_675328 ?auto_675329 ) ) ( not ( = ?auto_675328 ?auto_675330 ) ) ( not ( = ?auto_675328 ?auto_675331 ) ) ( not ( = ?auto_675328 ?auto_675332 ) ) ( not ( = ?auto_675328 ?auto_675333 ) ) ( not ( = ?auto_675328 ?auto_675334 ) ) ( not ( = ?auto_675328 ?auto_675335 ) ) ( not ( = ?auto_675328 ?auto_675336 ) ) ( not ( = ?auto_675328 ?auto_675337 ) ) ( not ( = ?auto_675328 ?auto_675338 ) ) ( not ( = ?auto_675328 ?auto_675339 ) ) ( not ( = ?auto_675328 ?auto_675340 ) ) ( not ( = ?auto_675329 ?auto_675330 ) ) ( not ( = ?auto_675329 ?auto_675331 ) ) ( not ( = ?auto_675329 ?auto_675332 ) ) ( not ( = ?auto_675329 ?auto_675333 ) ) ( not ( = ?auto_675329 ?auto_675334 ) ) ( not ( = ?auto_675329 ?auto_675335 ) ) ( not ( = ?auto_675329 ?auto_675336 ) ) ( not ( = ?auto_675329 ?auto_675337 ) ) ( not ( = ?auto_675329 ?auto_675338 ) ) ( not ( = ?auto_675329 ?auto_675339 ) ) ( not ( = ?auto_675329 ?auto_675340 ) ) ( not ( = ?auto_675330 ?auto_675331 ) ) ( not ( = ?auto_675330 ?auto_675332 ) ) ( not ( = ?auto_675330 ?auto_675333 ) ) ( not ( = ?auto_675330 ?auto_675334 ) ) ( not ( = ?auto_675330 ?auto_675335 ) ) ( not ( = ?auto_675330 ?auto_675336 ) ) ( not ( = ?auto_675330 ?auto_675337 ) ) ( not ( = ?auto_675330 ?auto_675338 ) ) ( not ( = ?auto_675330 ?auto_675339 ) ) ( not ( = ?auto_675330 ?auto_675340 ) ) ( not ( = ?auto_675331 ?auto_675332 ) ) ( not ( = ?auto_675331 ?auto_675333 ) ) ( not ( = ?auto_675331 ?auto_675334 ) ) ( not ( = ?auto_675331 ?auto_675335 ) ) ( not ( = ?auto_675331 ?auto_675336 ) ) ( not ( = ?auto_675331 ?auto_675337 ) ) ( not ( = ?auto_675331 ?auto_675338 ) ) ( not ( = ?auto_675331 ?auto_675339 ) ) ( not ( = ?auto_675331 ?auto_675340 ) ) ( not ( = ?auto_675332 ?auto_675333 ) ) ( not ( = ?auto_675332 ?auto_675334 ) ) ( not ( = ?auto_675332 ?auto_675335 ) ) ( not ( = ?auto_675332 ?auto_675336 ) ) ( not ( = ?auto_675332 ?auto_675337 ) ) ( not ( = ?auto_675332 ?auto_675338 ) ) ( not ( = ?auto_675332 ?auto_675339 ) ) ( not ( = ?auto_675332 ?auto_675340 ) ) ( not ( = ?auto_675333 ?auto_675334 ) ) ( not ( = ?auto_675333 ?auto_675335 ) ) ( not ( = ?auto_675333 ?auto_675336 ) ) ( not ( = ?auto_675333 ?auto_675337 ) ) ( not ( = ?auto_675333 ?auto_675338 ) ) ( not ( = ?auto_675333 ?auto_675339 ) ) ( not ( = ?auto_675333 ?auto_675340 ) ) ( not ( = ?auto_675334 ?auto_675335 ) ) ( not ( = ?auto_675334 ?auto_675336 ) ) ( not ( = ?auto_675334 ?auto_675337 ) ) ( not ( = ?auto_675334 ?auto_675338 ) ) ( not ( = ?auto_675334 ?auto_675339 ) ) ( not ( = ?auto_675334 ?auto_675340 ) ) ( not ( = ?auto_675335 ?auto_675336 ) ) ( not ( = ?auto_675335 ?auto_675337 ) ) ( not ( = ?auto_675335 ?auto_675338 ) ) ( not ( = ?auto_675335 ?auto_675339 ) ) ( not ( = ?auto_675335 ?auto_675340 ) ) ( not ( = ?auto_675336 ?auto_675337 ) ) ( not ( = ?auto_675336 ?auto_675338 ) ) ( not ( = ?auto_675336 ?auto_675339 ) ) ( not ( = ?auto_675336 ?auto_675340 ) ) ( not ( = ?auto_675337 ?auto_675338 ) ) ( not ( = ?auto_675337 ?auto_675339 ) ) ( not ( = ?auto_675337 ?auto_675340 ) ) ( not ( = ?auto_675338 ?auto_675339 ) ) ( not ( = ?auto_675338 ?auto_675340 ) ) ( not ( = ?auto_675339 ?auto_675340 ) ) ( CLEAR ?auto_675337 ) ( ON ?auto_675338 ?auto_675339 ) ( CLEAR ?auto_675338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_675327 ?auto_675328 ?auto_675329 ?auto_675330 ?auto_675331 ?auto_675332 ?auto_675333 ?auto_675334 ?auto_675335 ?auto_675336 ?auto_675337 ?auto_675338 )
      ( MAKE-13PILE ?auto_675327 ?auto_675328 ?auto_675329 ?auto_675330 ?auto_675331 ?auto_675332 ?auto_675333 ?auto_675334 ?auto_675335 ?auto_675336 ?auto_675337 ?auto_675338 ?auto_675339 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675381 - BLOCK
      ?auto_675382 - BLOCK
      ?auto_675383 - BLOCK
      ?auto_675384 - BLOCK
      ?auto_675385 - BLOCK
      ?auto_675386 - BLOCK
      ?auto_675387 - BLOCK
      ?auto_675388 - BLOCK
      ?auto_675389 - BLOCK
      ?auto_675390 - BLOCK
      ?auto_675391 - BLOCK
      ?auto_675392 - BLOCK
      ?auto_675393 - BLOCK
    )
    :vars
    (
      ?auto_675394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675393 ?auto_675394 ) ( ON-TABLE ?auto_675381 ) ( ON ?auto_675382 ?auto_675381 ) ( ON ?auto_675383 ?auto_675382 ) ( ON ?auto_675384 ?auto_675383 ) ( ON ?auto_675385 ?auto_675384 ) ( ON ?auto_675386 ?auto_675385 ) ( ON ?auto_675387 ?auto_675386 ) ( ON ?auto_675388 ?auto_675387 ) ( ON ?auto_675389 ?auto_675388 ) ( ON ?auto_675390 ?auto_675389 ) ( not ( = ?auto_675381 ?auto_675382 ) ) ( not ( = ?auto_675381 ?auto_675383 ) ) ( not ( = ?auto_675381 ?auto_675384 ) ) ( not ( = ?auto_675381 ?auto_675385 ) ) ( not ( = ?auto_675381 ?auto_675386 ) ) ( not ( = ?auto_675381 ?auto_675387 ) ) ( not ( = ?auto_675381 ?auto_675388 ) ) ( not ( = ?auto_675381 ?auto_675389 ) ) ( not ( = ?auto_675381 ?auto_675390 ) ) ( not ( = ?auto_675381 ?auto_675391 ) ) ( not ( = ?auto_675381 ?auto_675392 ) ) ( not ( = ?auto_675381 ?auto_675393 ) ) ( not ( = ?auto_675381 ?auto_675394 ) ) ( not ( = ?auto_675382 ?auto_675383 ) ) ( not ( = ?auto_675382 ?auto_675384 ) ) ( not ( = ?auto_675382 ?auto_675385 ) ) ( not ( = ?auto_675382 ?auto_675386 ) ) ( not ( = ?auto_675382 ?auto_675387 ) ) ( not ( = ?auto_675382 ?auto_675388 ) ) ( not ( = ?auto_675382 ?auto_675389 ) ) ( not ( = ?auto_675382 ?auto_675390 ) ) ( not ( = ?auto_675382 ?auto_675391 ) ) ( not ( = ?auto_675382 ?auto_675392 ) ) ( not ( = ?auto_675382 ?auto_675393 ) ) ( not ( = ?auto_675382 ?auto_675394 ) ) ( not ( = ?auto_675383 ?auto_675384 ) ) ( not ( = ?auto_675383 ?auto_675385 ) ) ( not ( = ?auto_675383 ?auto_675386 ) ) ( not ( = ?auto_675383 ?auto_675387 ) ) ( not ( = ?auto_675383 ?auto_675388 ) ) ( not ( = ?auto_675383 ?auto_675389 ) ) ( not ( = ?auto_675383 ?auto_675390 ) ) ( not ( = ?auto_675383 ?auto_675391 ) ) ( not ( = ?auto_675383 ?auto_675392 ) ) ( not ( = ?auto_675383 ?auto_675393 ) ) ( not ( = ?auto_675383 ?auto_675394 ) ) ( not ( = ?auto_675384 ?auto_675385 ) ) ( not ( = ?auto_675384 ?auto_675386 ) ) ( not ( = ?auto_675384 ?auto_675387 ) ) ( not ( = ?auto_675384 ?auto_675388 ) ) ( not ( = ?auto_675384 ?auto_675389 ) ) ( not ( = ?auto_675384 ?auto_675390 ) ) ( not ( = ?auto_675384 ?auto_675391 ) ) ( not ( = ?auto_675384 ?auto_675392 ) ) ( not ( = ?auto_675384 ?auto_675393 ) ) ( not ( = ?auto_675384 ?auto_675394 ) ) ( not ( = ?auto_675385 ?auto_675386 ) ) ( not ( = ?auto_675385 ?auto_675387 ) ) ( not ( = ?auto_675385 ?auto_675388 ) ) ( not ( = ?auto_675385 ?auto_675389 ) ) ( not ( = ?auto_675385 ?auto_675390 ) ) ( not ( = ?auto_675385 ?auto_675391 ) ) ( not ( = ?auto_675385 ?auto_675392 ) ) ( not ( = ?auto_675385 ?auto_675393 ) ) ( not ( = ?auto_675385 ?auto_675394 ) ) ( not ( = ?auto_675386 ?auto_675387 ) ) ( not ( = ?auto_675386 ?auto_675388 ) ) ( not ( = ?auto_675386 ?auto_675389 ) ) ( not ( = ?auto_675386 ?auto_675390 ) ) ( not ( = ?auto_675386 ?auto_675391 ) ) ( not ( = ?auto_675386 ?auto_675392 ) ) ( not ( = ?auto_675386 ?auto_675393 ) ) ( not ( = ?auto_675386 ?auto_675394 ) ) ( not ( = ?auto_675387 ?auto_675388 ) ) ( not ( = ?auto_675387 ?auto_675389 ) ) ( not ( = ?auto_675387 ?auto_675390 ) ) ( not ( = ?auto_675387 ?auto_675391 ) ) ( not ( = ?auto_675387 ?auto_675392 ) ) ( not ( = ?auto_675387 ?auto_675393 ) ) ( not ( = ?auto_675387 ?auto_675394 ) ) ( not ( = ?auto_675388 ?auto_675389 ) ) ( not ( = ?auto_675388 ?auto_675390 ) ) ( not ( = ?auto_675388 ?auto_675391 ) ) ( not ( = ?auto_675388 ?auto_675392 ) ) ( not ( = ?auto_675388 ?auto_675393 ) ) ( not ( = ?auto_675388 ?auto_675394 ) ) ( not ( = ?auto_675389 ?auto_675390 ) ) ( not ( = ?auto_675389 ?auto_675391 ) ) ( not ( = ?auto_675389 ?auto_675392 ) ) ( not ( = ?auto_675389 ?auto_675393 ) ) ( not ( = ?auto_675389 ?auto_675394 ) ) ( not ( = ?auto_675390 ?auto_675391 ) ) ( not ( = ?auto_675390 ?auto_675392 ) ) ( not ( = ?auto_675390 ?auto_675393 ) ) ( not ( = ?auto_675390 ?auto_675394 ) ) ( not ( = ?auto_675391 ?auto_675392 ) ) ( not ( = ?auto_675391 ?auto_675393 ) ) ( not ( = ?auto_675391 ?auto_675394 ) ) ( not ( = ?auto_675392 ?auto_675393 ) ) ( not ( = ?auto_675392 ?auto_675394 ) ) ( not ( = ?auto_675393 ?auto_675394 ) ) ( ON ?auto_675392 ?auto_675393 ) ( CLEAR ?auto_675390 ) ( ON ?auto_675391 ?auto_675392 ) ( CLEAR ?auto_675391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_675381 ?auto_675382 ?auto_675383 ?auto_675384 ?auto_675385 ?auto_675386 ?auto_675387 ?auto_675388 ?auto_675389 ?auto_675390 ?auto_675391 )
      ( MAKE-13PILE ?auto_675381 ?auto_675382 ?auto_675383 ?auto_675384 ?auto_675385 ?auto_675386 ?auto_675387 ?auto_675388 ?auto_675389 ?auto_675390 ?auto_675391 ?auto_675392 ?auto_675393 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675435 - BLOCK
      ?auto_675436 - BLOCK
      ?auto_675437 - BLOCK
      ?auto_675438 - BLOCK
      ?auto_675439 - BLOCK
      ?auto_675440 - BLOCK
      ?auto_675441 - BLOCK
      ?auto_675442 - BLOCK
      ?auto_675443 - BLOCK
      ?auto_675444 - BLOCK
      ?auto_675445 - BLOCK
      ?auto_675446 - BLOCK
      ?auto_675447 - BLOCK
    )
    :vars
    (
      ?auto_675448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675447 ?auto_675448 ) ( ON-TABLE ?auto_675435 ) ( ON ?auto_675436 ?auto_675435 ) ( ON ?auto_675437 ?auto_675436 ) ( ON ?auto_675438 ?auto_675437 ) ( ON ?auto_675439 ?auto_675438 ) ( ON ?auto_675440 ?auto_675439 ) ( ON ?auto_675441 ?auto_675440 ) ( ON ?auto_675442 ?auto_675441 ) ( ON ?auto_675443 ?auto_675442 ) ( not ( = ?auto_675435 ?auto_675436 ) ) ( not ( = ?auto_675435 ?auto_675437 ) ) ( not ( = ?auto_675435 ?auto_675438 ) ) ( not ( = ?auto_675435 ?auto_675439 ) ) ( not ( = ?auto_675435 ?auto_675440 ) ) ( not ( = ?auto_675435 ?auto_675441 ) ) ( not ( = ?auto_675435 ?auto_675442 ) ) ( not ( = ?auto_675435 ?auto_675443 ) ) ( not ( = ?auto_675435 ?auto_675444 ) ) ( not ( = ?auto_675435 ?auto_675445 ) ) ( not ( = ?auto_675435 ?auto_675446 ) ) ( not ( = ?auto_675435 ?auto_675447 ) ) ( not ( = ?auto_675435 ?auto_675448 ) ) ( not ( = ?auto_675436 ?auto_675437 ) ) ( not ( = ?auto_675436 ?auto_675438 ) ) ( not ( = ?auto_675436 ?auto_675439 ) ) ( not ( = ?auto_675436 ?auto_675440 ) ) ( not ( = ?auto_675436 ?auto_675441 ) ) ( not ( = ?auto_675436 ?auto_675442 ) ) ( not ( = ?auto_675436 ?auto_675443 ) ) ( not ( = ?auto_675436 ?auto_675444 ) ) ( not ( = ?auto_675436 ?auto_675445 ) ) ( not ( = ?auto_675436 ?auto_675446 ) ) ( not ( = ?auto_675436 ?auto_675447 ) ) ( not ( = ?auto_675436 ?auto_675448 ) ) ( not ( = ?auto_675437 ?auto_675438 ) ) ( not ( = ?auto_675437 ?auto_675439 ) ) ( not ( = ?auto_675437 ?auto_675440 ) ) ( not ( = ?auto_675437 ?auto_675441 ) ) ( not ( = ?auto_675437 ?auto_675442 ) ) ( not ( = ?auto_675437 ?auto_675443 ) ) ( not ( = ?auto_675437 ?auto_675444 ) ) ( not ( = ?auto_675437 ?auto_675445 ) ) ( not ( = ?auto_675437 ?auto_675446 ) ) ( not ( = ?auto_675437 ?auto_675447 ) ) ( not ( = ?auto_675437 ?auto_675448 ) ) ( not ( = ?auto_675438 ?auto_675439 ) ) ( not ( = ?auto_675438 ?auto_675440 ) ) ( not ( = ?auto_675438 ?auto_675441 ) ) ( not ( = ?auto_675438 ?auto_675442 ) ) ( not ( = ?auto_675438 ?auto_675443 ) ) ( not ( = ?auto_675438 ?auto_675444 ) ) ( not ( = ?auto_675438 ?auto_675445 ) ) ( not ( = ?auto_675438 ?auto_675446 ) ) ( not ( = ?auto_675438 ?auto_675447 ) ) ( not ( = ?auto_675438 ?auto_675448 ) ) ( not ( = ?auto_675439 ?auto_675440 ) ) ( not ( = ?auto_675439 ?auto_675441 ) ) ( not ( = ?auto_675439 ?auto_675442 ) ) ( not ( = ?auto_675439 ?auto_675443 ) ) ( not ( = ?auto_675439 ?auto_675444 ) ) ( not ( = ?auto_675439 ?auto_675445 ) ) ( not ( = ?auto_675439 ?auto_675446 ) ) ( not ( = ?auto_675439 ?auto_675447 ) ) ( not ( = ?auto_675439 ?auto_675448 ) ) ( not ( = ?auto_675440 ?auto_675441 ) ) ( not ( = ?auto_675440 ?auto_675442 ) ) ( not ( = ?auto_675440 ?auto_675443 ) ) ( not ( = ?auto_675440 ?auto_675444 ) ) ( not ( = ?auto_675440 ?auto_675445 ) ) ( not ( = ?auto_675440 ?auto_675446 ) ) ( not ( = ?auto_675440 ?auto_675447 ) ) ( not ( = ?auto_675440 ?auto_675448 ) ) ( not ( = ?auto_675441 ?auto_675442 ) ) ( not ( = ?auto_675441 ?auto_675443 ) ) ( not ( = ?auto_675441 ?auto_675444 ) ) ( not ( = ?auto_675441 ?auto_675445 ) ) ( not ( = ?auto_675441 ?auto_675446 ) ) ( not ( = ?auto_675441 ?auto_675447 ) ) ( not ( = ?auto_675441 ?auto_675448 ) ) ( not ( = ?auto_675442 ?auto_675443 ) ) ( not ( = ?auto_675442 ?auto_675444 ) ) ( not ( = ?auto_675442 ?auto_675445 ) ) ( not ( = ?auto_675442 ?auto_675446 ) ) ( not ( = ?auto_675442 ?auto_675447 ) ) ( not ( = ?auto_675442 ?auto_675448 ) ) ( not ( = ?auto_675443 ?auto_675444 ) ) ( not ( = ?auto_675443 ?auto_675445 ) ) ( not ( = ?auto_675443 ?auto_675446 ) ) ( not ( = ?auto_675443 ?auto_675447 ) ) ( not ( = ?auto_675443 ?auto_675448 ) ) ( not ( = ?auto_675444 ?auto_675445 ) ) ( not ( = ?auto_675444 ?auto_675446 ) ) ( not ( = ?auto_675444 ?auto_675447 ) ) ( not ( = ?auto_675444 ?auto_675448 ) ) ( not ( = ?auto_675445 ?auto_675446 ) ) ( not ( = ?auto_675445 ?auto_675447 ) ) ( not ( = ?auto_675445 ?auto_675448 ) ) ( not ( = ?auto_675446 ?auto_675447 ) ) ( not ( = ?auto_675446 ?auto_675448 ) ) ( not ( = ?auto_675447 ?auto_675448 ) ) ( ON ?auto_675446 ?auto_675447 ) ( ON ?auto_675445 ?auto_675446 ) ( CLEAR ?auto_675443 ) ( ON ?auto_675444 ?auto_675445 ) ( CLEAR ?auto_675444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_675435 ?auto_675436 ?auto_675437 ?auto_675438 ?auto_675439 ?auto_675440 ?auto_675441 ?auto_675442 ?auto_675443 ?auto_675444 )
      ( MAKE-13PILE ?auto_675435 ?auto_675436 ?auto_675437 ?auto_675438 ?auto_675439 ?auto_675440 ?auto_675441 ?auto_675442 ?auto_675443 ?auto_675444 ?auto_675445 ?auto_675446 ?auto_675447 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675489 - BLOCK
      ?auto_675490 - BLOCK
      ?auto_675491 - BLOCK
      ?auto_675492 - BLOCK
      ?auto_675493 - BLOCK
      ?auto_675494 - BLOCK
      ?auto_675495 - BLOCK
      ?auto_675496 - BLOCK
      ?auto_675497 - BLOCK
      ?auto_675498 - BLOCK
      ?auto_675499 - BLOCK
      ?auto_675500 - BLOCK
      ?auto_675501 - BLOCK
    )
    :vars
    (
      ?auto_675502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675501 ?auto_675502 ) ( ON-TABLE ?auto_675489 ) ( ON ?auto_675490 ?auto_675489 ) ( ON ?auto_675491 ?auto_675490 ) ( ON ?auto_675492 ?auto_675491 ) ( ON ?auto_675493 ?auto_675492 ) ( ON ?auto_675494 ?auto_675493 ) ( ON ?auto_675495 ?auto_675494 ) ( ON ?auto_675496 ?auto_675495 ) ( not ( = ?auto_675489 ?auto_675490 ) ) ( not ( = ?auto_675489 ?auto_675491 ) ) ( not ( = ?auto_675489 ?auto_675492 ) ) ( not ( = ?auto_675489 ?auto_675493 ) ) ( not ( = ?auto_675489 ?auto_675494 ) ) ( not ( = ?auto_675489 ?auto_675495 ) ) ( not ( = ?auto_675489 ?auto_675496 ) ) ( not ( = ?auto_675489 ?auto_675497 ) ) ( not ( = ?auto_675489 ?auto_675498 ) ) ( not ( = ?auto_675489 ?auto_675499 ) ) ( not ( = ?auto_675489 ?auto_675500 ) ) ( not ( = ?auto_675489 ?auto_675501 ) ) ( not ( = ?auto_675489 ?auto_675502 ) ) ( not ( = ?auto_675490 ?auto_675491 ) ) ( not ( = ?auto_675490 ?auto_675492 ) ) ( not ( = ?auto_675490 ?auto_675493 ) ) ( not ( = ?auto_675490 ?auto_675494 ) ) ( not ( = ?auto_675490 ?auto_675495 ) ) ( not ( = ?auto_675490 ?auto_675496 ) ) ( not ( = ?auto_675490 ?auto_675497 ) ) ( not ( = ?auto_675490 ?auto_675498 ) ) ( not ( = ?auto_675490 ?auto_675499 ) ) ( not ( = ?auto_675490 ?auto_675500 ) ) ( not ( = ?auto_675490 ?auto_675501 ) ) ( not ( = ?auto_675490 ?auto_675502 ) ) ( not ( = ?auto_675491 ?auto_675492 ) ) ( not ( = ?auto_675491 ?auto_675493 ) ) ( not ( = ?auto_675491 ?auto_675494 ) ) ( not ( = ?auto_675491 ?auto_675495 ) ) ( not ( = ?auto_675491 ?auto_675496 ) ) ( not ( = ?auto_675491 ?auto_675497 ) ) ( not ( = ?auto_675491 ?auto_675498 ) ) ( not ( = ?auto_675491 ?auto_675499 ) ) ( not ( = ?auto_675491 ?auto_675500 ) ) ( not ( = ?auto_675491 ?auto_675501 ) ) ( not ( = ?auto_675491 ?auto_675502 ) ) ( not ( = ?auto_675492 ?auto_675493 ) ) ( not ( = ?auto_675492 ?auto_675494 ) ) ( not ( = ?auto_675492 ?auto_675495 ) ) ( not ( = ?auto_675492 ?auto_675496 ) ) ( not ( = ?auto_675492 ?auto_675497 ) ) ( not ( = ?auto_675492 ?auto_675498 ) ) ( not ( = ?auto_675492 ?auto_675499 ) ) ( not ( = ?auto_675492 ?auto_675500 ) ) ( not ( = ?auto_675492 ?auto_675501 ) ) ( not ( = ?auto_675492 ?auto_675502 ) ) ( not ( = ?auto_675493 ?auto_675494 ) ) ( not ( = ?auto_675493 ?auto_675495 ) ) ( not ( = ?auto_675493 ?auto_675496 ) ) ( not ( = ?auto_675493 ?auto_675497 ) ) ( not ( = ?auto_675493 ?auto_675498 ) ) ( not ( = ?auto_675493 ?auto_675499 ) ) ( not ( = ?auto_675493 ?auto_675500 ) ) ( not ( = ?auto_675493 ?auto_675501 ) ) ( not ( = ?auto_675493 ?auto_675502 ) ) ( not ( = ?auto_675494 ?auto_675495 ) ) ( not ( = ?auto_675494 ?auto_675496 ) ) ( not ( = ?auto_675494 ?auto_675497 ) ) ( not ( = ?auto_675494 ?auto_675498 ) ) ( not ( = ?auto_675494 ?auto_675499 ) ) ( not ( = ?auto_675494 ?auto_675500 ) ) ( not ( = ?auto_675494 ?auto_675501 ) ) ( not ( = ?auto_675494 ?auto_675502 ) ) ( not ( = ?auto_675495 ?auto_675496 ) ) ( not ( = ?auto_675495 ?auto_675497 ) ) ( not ( = ?auto_675495 ?auto_675498 ) ) ( not ( = ?auto_675495 ?auto_675499 ) ) ( not ( = ?auto_675495 ?auto_675500 ) ) ( not ( = ?auto_675495 ?auto_675501 ) ) ( not ( = ?auto_675495 ?auto_675502 ) ) ( not ( = ?auto_675496 ?auto_675497 ) ) ( not ( = ?auto_675496 ?auto_675498 ) ) ( not ( = ?auto_675496 ?auto_675499 ) ) ( not ( = ?auto_675496 ?auto_675500 ) ) ( not ( = ?auto_675496 ?auto_675501 ) ) ( not ( = ?auto_675496 ?auto_675502 ) ) ( not ( = ?auto_675497 ?auto_675498 ) ) ( not ( = ?auto_675497 ?auto_675499 ) ) ( not ( = ?auto_675497 ?auto_675500 ) ) ( not ( = ?auto_675497 ?auto_675501 ) ) ( not ( = ?auto_675497 ?auto_675502 ) ) ( not ( = ?auto_675498 ?auto_675499 ) ) ( not ( = ?auto_675498 ?auto_675500 ) ) ( not ( = ?auto_675498 ?auto_675501 ) ) ( not ( = ?auto_675498 ?auto_675502 ) ) ( not ( = ?auto_675499 ?auto_675500 ) ) ( not ( = ?auto_675499 ?auto_675501 ) ) ( not ( = ?auto_675499 ?auto_675502 ) ) ( not ( = ?auto_675500 ?auto_675501 ) ) ( not ( = ?auto_675500 ?auto_675502 ) ) ( not ( = ?auto_675501 ?auto_675502 ) ) ( ON ?auto_675500 ?auto_675501 ) ( ON ?auto_675499 ?auto_675500 ) ( ON ?auto_675498 ?auto_675499 ) ( CLEAR ?auto_675496 ) ( ON ?auto_675497 ?auto_675498 ) ( CLEAR ?auto_675497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_675489 ?auto_675490 ?auto_675491 ?auto_675492 ?auto_675493 ?auto_675494 ?auto_675495 ?auto_675496 ?auto_675497 )
      ( MAKE-13PILE ?auto_675489 ?auto_675490 ?auto_675491 ?auto_675492 ?auto_675493 ?auto_675494 ?auto_675495 ?auto_675496 ?auto_675497 ?auto_675498 ?auto_675499 ?auto_675500 ?auto_675501 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675543 - BLOCK
      ?auto_675544 - BLOCK
      ?auto_675545 - BLOCK
      ?auto_675546 - BLOCK
      ?auto_675547 - BLOCK
      ?auto_675548 - BLOCK
      ?auto_675549 - BLOCK
      ?auto_675550 - BLOCK
      ?auto_675551 - BLOCK
      ?auto_675552 - BLOCK
      ?auto_675553 - BLOCK
      ?auto_675554 - BLOCK
      ?auto_675555 - BLOCK
    )
    :vars
    (
      ?auto_675556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675555 ?auto_675556 ) ( ON-TABLE ?auto_675543 ) ( ON ?auto_675544 ?auto_675543 ) ( ON ?auto_675545 ?auto_675544 ) ( ON ?auto_675546 ?auto_675545 ) ( ON ?auto_675547 ?auto_675546 ) ( ON ?auto_675548 ?auto_675547 ) ( ON ?auto_675549 ?auto_675548 ) ( not ( = ?auto_675543 ?auto_675544 ) ) ( not ( = ?auto_675543 ?auto_675545 ) ) ( not ( = ?auto_675543 ?auto_675546 ) ) ( not ( = ?auto_675543 ?auto_675547 ) ) ( not ( = ?auto_675543 ?auto_675548 ) ) ( not ( = ?auto_675543 ?auto_675549 ) ) ( not ( = ?auto_675543 ?auto_675550 ) ) ( not ( = ?auto_675543 ?auto_675551 ) ) ( not ( = ?auto_675543 ?auto_675552 ) ) ( not ( = ?auto_675543 ?auto_675553 ) ) ( not ( = ?auto_675543 ?auto_675554 ) ) ( not ( = ?auto_675543 ?auto_675555 ) ) ( not ( = ?auto_675543 ?auto_675556 ) ) ( not ( = ?auto_675544 ?auto_675545 ) ) ( not ( = ?auto_675544 ?auto_675546 ) ) ( not ( = ?auto_675544 ?auto_675547 ) ) ( not ( = ?auto_675544 ?auto_675548 ) ) ( not ( = ?auto_675544 ?auto_675549 ) ) ( not ( = ?auto_675544 ?auto_675550 ) ) ( not ( = ?auto_675544 ?auto_675551 ) ) ( not ( = ?auto_675544 ?auto_675552 ) ) ( not ( = ?auto_675544 ?auto_675553 ) ) ( not ( = ?auto_675544 ?auto_675554 ) ) ( not ( = ?auto_675544 ?auto_675555 ) ) ( not ( = ?auto_675544 ?auto_675556 ) ) ( not ( = ?auto_675545 ?auto_675546 ) ) ( not ( = ?auto_675545 ?auto_675547 ) ) ( not ( = ?auto_675545 ?auto_675548 ) ) ( not ( = ?auto_675545 ?auto_675549 ) ) ( not ( = ?auto_675545 ?auto_675550 ) ) ( not ( = ?auto_675545 ?auto_675551 ) ) ( not ( = ?auto_675545 ?auto_675552 ) ) ( not ( = ?auto_675545 ?auto_675553 ) ) ( not ( = ?auto_675545 ?auto_675554 ) ) ( not ( = ?auto_675545 ?auto_675555 ) ) ( not ( = ?auto_675545 ?auto_675556 ) ) ( not ( = ?auto_675546 ?auto_675547 ) ) ( not ( = ?auto_675546 ?auto_675548 ) ) ( not ( = ?auto_675546 ?auto_675549 ) ) ( not ( = ?auto_675546 ?auto_675550 ) ) ( not ( = ?auto_675546 ?auto_675551 ) ) ( not ( = ?auto_675546 ?auto_675552 ) ) ( not ( = ?auto_675546 ?auto_675553 ) ) ( not ( = ?auto_675546 ?auto_675554 ) ) ( not ( = ?auto_675546 ?auto_675555 ) ) ( not ( = ?auto_675546 ?auto_675556 ) ) ( not ( = ?auto_675547 ?auto_675548 ) ) ( not ( = ?auto_675547 ?auto_675549 ) ) ( not ( = ?auto_675547 ?auto_675550 ) ) ( not ( = ?auto_675547 ?auto_675551 ) ) ( not ( = ?auto_675547 ?auto_675552 ) ) ( not ( = ?auto_675547 ?auto_675553 ) ) ( not ( = ?auto_675547 ?auto_675554 ) ) ( not ( = ?auto_675547 ?auto_675555 ) ) ( not ( = ?auto_675547 ?auto_675556 ) ) ( not ( = ?auto_675548 ?auto_675549 ) ) ( not ( = ?auto_675548 ?auto_675550 ) ) ( not ( = ?auto_675548 ?auto_675551 ) ) ( not ( = ?auto_675548 ?auto_675552 ) ) ( not ( = ?auto_675548 ?auto_675553 ) ) ( not ( = ?auto_675548 ?auto_675554 ) ) ( not ( = ?auto_675548 ?auto_675555 ) ) ( not ( = ?auto_675548 ?auto_675556 ) ) ( not ( = ?auto_675549 ?auto_675550 ) ) ( not ( = ?auto_675549 ?auto_675551 ) ) ( not ( = ?auto_675549 ?auto_675552 ) ) ( not ( = ?auto_675549 ?auto_675553 ) ) ( not ( = ?auto_675549 ?auto_675554 ) ) ( not ( = ?auto_675549 ?auto_675555 ) ) ( not ( = ?auto_675549 ?auto_675556 ) ) ( not ( = ?auto_675550 ?auto_675551 ) ) ( not ( = ?auto_675550 ?auto_675552 ) ) ( not ( = ?auto_675550 ?auto_675553 ) ) ( not ( = ?auto_675550 ?auto_675554 ) ) ( not ( = ?auto_675550 ?auto_675555 ) ) ( not ( = ?auto_675550 ?auto_675556 ) ) ( not ( = ?auto_675551 ?auto_675552 ) ) ( not ( = ?auto_675551 ?auto_675553 ) ) ( not ( = ?auto_675551 ?auto_675554 ) ) ( not ( = ?auto_675551 ?auto_675555 ) ) ( not ( = ?auto_675551 ?auto_675556 ) ) ( not ( = ?auto_675552 ?auto_675553 ) ) ( not ( = ?auto_675552 ?auto_675554 ) ) ( not ( = ?auto_675552 ?auto_675555 ) ) ( not ( = ?auto_675552 ?auto_675556 ) ) ( not ( = ?auto_675553 ?auto_675554 ) ) ( not ( = ?auto_675553 ?auto_675555 ) ) ( not ( = ?auto_675553 ?auto_675556 ) ) ( not ( = ?auto_675554 ?auto_675555 ) ) ( not ( = ?auto_675554 ?auto_675556 ) ) ( not ( = ?auto_675555 ?auto_675556 ) ) ( ON ?auto_675554 ?auto_675555 ) ( ON ?auto_675553 ?auto_675554 ) ( ON ?auto_675552 ?auto_675553 ) ( ON ?auto_675551 ?auto_675552 ) ( CLEAR ?auto_675549 ) ( ON ?auto_675550 ?auto_675551 ) ( CLEAR ?auto_675550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_675543 ?auto_675544 ?auto_675545 ?auto_675546 ?auto_675547 ?auto_675548 ?auto_675549 ?auto_675550 )
      ( MAKE-13PILE ?auto_675543 ?auto_675544 ?auto_675545 ?auto_675546 ?auto_675547 ?auto_675548 ?auto_675549 ?auto_675550 ?auto_675551 ?auto_675552 ?auto_675553 ?auto_675554 ?auto_675555 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675597 - BLOCK
      ?auto_675598 - BLOCK
      ?auto_675599 - BLOCK
      ?auto_675600 - BLOCK
      ?auto_675601 - BLOCK
      ?auto_675602 - BLOCK
      ?auto_675603 - BLOCK
      ?auto_675604 - BLOCK
      ?auto_675605 - BLOCK
      ?auto_675606 - BLOCK
      ?auto_675607 - BLOCK
      ?auto_675608 - BLOCK
      ?auto_675609 - BLOCK
    )
    :vars
    (
      ?auto_675610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675609 ?auto_675610 ) ( ON-TABLE ?auto_675597 ) ( ON ?auto_675598 ?auto_675597 ) ( ON ?auto_675599 ?auto_675598 ) ( ON ?auto_675600 ?auto_675599 ) ( ON ?auto_675601 ?auto_675600 ) ( ON ?auto_675602 ?auto_675601 ) ( not ( = ?auto_675597 ?auto_675598 ) ) ( not ( = ?auto_675597 ?auto_675599 ) ) ( not ( = ?auto_675597 ?auto_675600 ) ) ( not ( = ?auto_675597 ?auto_675601 ) ) ( not ( = ?auto_675597 ?auto_675602 ) ) ( not ( = ?auto_675597 ?auto_675603 ) ) ( not ( = ?auto_675597 ?auto_675604 ) ) ( not ( = ?auto_675597 ?auto_675605 ) ) ( not ( = ?auto_675597 ?auto_675606 ) ) ( not ( = ?auto_675597 ?auto_675607 ) ) ( not ( = ?auto_675597 ?auto_675608 ) ) ( not ( = ?auto_675597 ?auto_675609 ) ) ( not ( = ?auto_675597 ?auto_675610 ) ) ( not ( = ?auto_675598 ?auto_675599 ) ) ( not ( = ?auto_675598 ?auto_675600 ) ) ( not ( = ?auto_675598 ?auto_675601 ) ) ( not ( = ?auto_675598 ?auto_675602 ) ) ( not ( = ?auto_675598 ?auto_675603 ) ) ( not ( = ?auto_675598 ?auto_675604 ) ) ( not ( = ?auto_675598 ?auto_675605 ) ) ( not ( = ?auto_675598 ?auto_675606 ) ) ( not ( = ?auto_675598 ?auto_675607 ) ) ( not ( = ?auto_675598 ?auto_675608 ) ) ( not ( = ?auto_675598 ?auto_675609 ) ) ( not ( = ?auto_675598 ?auto_675610 ) ) ( not ( = ?auto_675599 ?auto_675600 ) ) ( not ( = ?auto_675599 ?auto_675601 ) ) ( not ( = ?auto_675599 ?auto_675602 ) ) ( not ( = ?auto_675599 ?auto_675603 ) ) ( not ( = ?auto_675599 ?auto_675604 ) ) ( not ( = ?auto_675599 ?auto_675605 ) ) ( not ( = ?auto_675599 ?auto_675606 ) ) ( not ( = ?auto_675599 ?auto_675607 ) ) ( not ( = ?auto_675599 ?auto_675608 ) ) ( not ( = ?auto_675599 ?auto_675609 ) ) ( not ( = ?auto_675599 ?auto_675610 ) ) ( not ( = ?auto_675600 ?auto_675601 ) ) ( not ( = ?auto_675600 ?auto_675602 ) ) ( not ( = ?auto_675600 ?auto_675603 ) ) ( not ( = ?auto_675600 ?auto_675604 ) ) ( not ( = ?auto_675600 ?auto_675605 ) ) ( not ( = ?auto_675600 ?auto_675606 ) ) ( not ( = ?auto_675600 ?auto_675607 ) ) ( not ( = ?auto_675600 ?auto_675608 ) ) ( not ( = ?auto_675600 ?auto_675609 ) ) ( not ( = ?auto_675600 ?auto_675610 ) ) ( not ( = ?auto_675601 ?auto_675602 ) ) ( not ( = ?auto_675601 ?auto_675603 ) ) ( not ( = ?auto_675601 ?auto_675604 ) ) ( not ( = ?auto_675601 ?auto_675605 ) ) ( not ( = ?auto_675601 ?auto_675606 ) ) ( not ( = ?auto_675601 ?auto_675607 ) ) ( not ( = ?auto_675601 ?auto_675608 ) ) ( not ( = ?auto_675601 ?auto_675609 ) ) ( not ( = ?auto_675601 ?auto_675610 ) ) ( not ( = ?auto_675602 ?auto_675603 ) ) ( not ( = ?auto_675602 ?auto_675604 ) ) ( not ( = ?auto_675602 ?auto_675605 ) ) ( not ( = ?auto_675602 ?auto_675606 ) ) ( not ( = ?auto_675602 ?auto_675607 ) ) ( not ( = ?auto_675602 ?auto_675608 ) ) ( not ( = ?auto_675602 ?auto_675609 ) ) ( not ( = ?auto_675602 ?auto_675610 ) ) ( not ( = ?auto_675603 ?auto_675604 ) ) ( not ( = ?auto_675603 ?auto_675605 ) ) ( not ( = ?auto_675603 ?auto_675606 ) ) ( not ( = ?auto_675603 ?auto_675607 ) ) ( not ( = ?auto_675603 ?auto_675608 ) ) ( not ( = ?auto_675603 ?auto_675609 ) ) ( not ( = ?auto_675603 ?auto_675610 ) ) ( not ( = ?auto_675604 ?auto_675605 ) ) ( not ( = ?auto_675604 ?auto_675606 ) ) ( not ( = ?auto_675604 ?auto_675607 ) ) ( not ( = ?auto_675604 ?auto_675608 ) ) ( not ( = ?auto_675604 ?auto_675609 ) ) ( not ( = ?auto_675604 ?auto_675610 ) ) ( not ( = ?auto_675605 ?auto_675606 ) ) ( not ( = ?auto_675605 ?auto_675607 ) ) ( not ( = ?auto_675605 ?auto_675608 ) ) ( not ( = ?auto_675605 ?auto_675609 ) ) ( not ( = ?auto_675605 ?auto_675610 ) ) ( not ( = ?auto_675606 ?auto_675607 ) ) ( not ( = ?auto_675606 ?auto_675608 ) ) ( not ( = ?auto_675606 ?auto_675609 ) ) ( not ( = ?auto_675606 ?auto_675610 ) ) ( not ( = ?auto_675607 ?auto_675608 ) ) ( not ( = ?auto_675607 ?auto_675609 ) ) ( not ( = ?auto_675607 ?auto_675610 ) ) ( not ( = ?auto_675608 ?auto_675609 ) ) ( not ( = ?auto_675608 ?auto_675610 ) ) ( not ( = ?auto_675609 ?auto_675610 ) ) ( ON ?auto_675608 ?auto_675609 ) ( ON ?auto_675607 ?auto_675608 ) ( ON ?auto_675606 ?auto_675607 ) ( ON ?auto_675605 ?auto_675606 ) ( ON ?auto_675604 ?auto_675605 ) ( CLEAR ?auto_675602 ) ( ON ?auto_675603 ?auto_675604 ) ( CLEAR ?auto_675603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_675597 ?auto_675598 ?auto_675599 ?auto_675600 ?auto_675601 ?auto_675602 ?auto_675603 )
      ( MAKE-13PILE ?auto_675597 ?auto_675598 ?auto_675599 ?auto_675600 ?auto_675601 ?auto_675602 ?auto_675603 ?auto_675604 ?auto_675605 ?auto_675606 ?auto_675607 ?auto_675608 ?auto_675609 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675651 - BLOCK
      ?auto_675652 - BLOCK
      ?auto_675653 - BLOCK
      ?auto_675654 - BLOCK
      ?auto_675655 - BLOCK
      ?auto_675656 - BLOCK
      ?auto_675657 - BLOCK
      ?auto_675658 - BLOCK
      ?auto_675659 - BLOCK
      ?auto_675660 - BLOCK
      ?auto_675661 - BLOCK
      ?auto_675662 - BLOCK
      ?auto_675663 - BLOCK
    )
    :vars
    (
      ?auto_675664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675663 ?auto_675664 ) ( ON-TABLE ?auto_675651 ) ( ON ?auto_675652 ?auto_675651 ) ( ON ?auto_675653 ?auto_675652 ) ( ON ?auto_675654 ?auto_675653 ) ( ON ?auto_675655 ?auto_675654 ) ( not ( = ?auto_675651 ?auto_675652 ) ) ( not ( = ?auto_675651 ?auto_675653 ) ) ( not ( = ?auto_675651 ?auto_675654 ) ) ( not ( = ?auto_675651 ?auto_675655 ) ) ( not ( = ?auto_675651 ?auto_675656 ) ) ( not ( = ?auto_675651 ?auto_675657 ) ) ( not ( = ?auto_675651 ?auto_675658 ) ) ( not ( = ?auto_675651 ?auto_675659 ) ) ( not ( = ?auto_675651 ?auto_675660 ) ) ( not ( = ?auto_675651 ?auto_675661 ) ) ( not ( = ?auto_675651 ?auto_675662 ) ) ( not ( = ?auto_675651 ?auto_675663 ) ) ( not ( = ?auto_675651 ?auto_675664 ) ) ( not ( = ?auto_675652 ?auto_675653 ) ) ( not ( = ?auto_675652 ?auto_675654 ) ) ( not ( = ?auto_675652 ?auto_675655 ) ) ( not ( = ?auto_675652 ?auto_675656 ) ) ( not ( = ?auto_675652 ?auto_675657 ) ) ( not ( = ?auto_675652 ?auto_675658 ) ) ( not ( = ?auto_675652 ?auto_675659 ) ) ( not ( = ?auto_675652 ?auto_675660 ) ) ( not ( = ?auto_675652 ?auto_675661 ) ) ( not ( = ?auto_675652 ?auto_675662 ) ) ( not ( = ?auto_675652 ?auto_675663 ) ) ( not ( = ?auto_675652 ?auto_675664 ) ) ( not ( = ?auto_675653 ?auto_675654 ) ) ( not ( = ?auto_675653 ?auto_675655 ) ) ( not ( = ?auto_675653 ?auto_675656 ) ) ( not ( = ?auto_675653 ?auto_675657 ) ) ( not ( = ?auto_675653 ?auto_675658 ) ) ( not ( = ?auto_675653 ?auto_675659 ) ) ( not ( = ?auto_675653 ?auto_675660 ) ) ( not ( = ?auto_675653 ?auto_675661 ) ) ( not ( = ?auto_675653 ?auto_675662 ) ) ( not ( = ?auto_675653 ?auto_675663 ) ) ( not ( = ?auto_675653 ?auto_675664 ) ) ( not ( = ?auto_675654 ?auto_675655 ) ) ( not ( = ?auto_675654 ?auto_675656 ) ) ( not ( = ?auto_675654 ?auto_675657 ) ) ( not ( = ?auto_675654 ?auto_675658 ) ) ( not ( = ?auto_675654 ?auto_675659 ) ) ( not ( = ?auto_675654 ?auto_675660 ) ) ( not ( = ?auto_675654 ?auto_675661 ) ) ( not ( = ?auto_675654 ?auto_675662 ) ) ( not ( = ?auto_675654 ?auto_675663 ) ) ( not ( = ?auto_675654 ?auto_675664 ) ) ( not ( = ?auto_675655 ?auto_675656 ) ) ( not ( = ?auto_675655 ?auto_675657 ) ) ( not ( = ?auto_675655 ?auto_675658 ) ) ( not ( = ?auto_675655 ?auto_675659 ) ) ( not ( = ?auto_675655 ?auto_675660 ) ) ( not ( = ?auto_675655 ?auto_675661 ) ) ( not ( = ?auto_675655 ?auto_675662 ) ) ( not ( = ?auto_675655 ?auto_675663 ) ) ( not ( = ?auto_675655 ?auto_675664 ) ) ( not ( = ?auto_675656 ?auto_675657 ) ) ( not ( = ?auto_675656 ?auto_675658 ) ) ( not ( = ?auto_675656 ?auto_675659 ) ) ( not ( = ?auto_675656 ?auto_675660 ) ) ( not ( = ?auto_675656 ?auto_675661 ) ) ( not ( = ?auto_675656 ?auto_675662 ) ) ( not ( = ?auto_675656 ?auto_675663 ) ) ( not ( = ?auto_675656 ?auto_675664 ) ) ( not ( = ?auto_675657 ?auto_675658 ) ) ( not ( = ?auto_675657 ?auto_675659 ) ) ( not ( = ?auto_675657 ?auto_675660 ) ) ( not ( = ?auto_675657 ?auto_675661 ) ) ( not ( = ?auto_675657 ?auto_675662 ) ) ( not ( = ?auto_675657 ?auto_675663 ) ) ( not ( = ?auto_675657 ?auto_675664 ) ) ( not ( = ?auto_675658 ?auto_675659 ) ) ( not ( = ?auto_675658 ?auto_675660 ) ) ( not ( = ?auto_675658 ?auto_675661 ) ) ( not ( = ?auto_675658 ?auto_675662 ) ) ( not ( = ?auto_675658 ?auto_675663 ) ) ( not ( = ?auto_675658 ?auto_675664 ) ) ( not ( = ?auto_675659 ?auto_675660 ) ) ( not ( = ?auto_675659 ?auto_675661 ) ) ( not ( = ?auto_675659 ?auto_675662 ) ) ( not ( = ?auto_675659 ?auto_675663 ) ) ( not ( = ?auto_675659 ?auto_675664 ) ) ( not ( = ?auto_675660 ?auto_675661 ) ) ( not ( = ?auto_675660 ?auto_675662 ) ) ( not ( = ?auto_675660 ?auto_675663 ) ) ( not ( = ?auto_675660 ?auto_675664 ) ) ( not ( = ?auto_675661 ?auto_675662 ) ) ( not ( = ?auto_675661 ?auto_675663 ) ) ( not ( = ?auto_675661 ?auto_675664 ) ) ( not ( = ?auto_675662 ?auto_675663 ) ) ( not ( = ?auto_675662 ?auto_675664 ) ) ( not ( = ?auto_675663 ?auto_675664 ) ) ( ON ?auto_675662 ?auto_675663 ) ( ON ?auto_675661 ?auto_675662 ) ( ON ?auto_675660 ?auto_675661 ) ( ON ?auto_675659 ?auto_675660 ) ( ON ?auto_675658 ?auto_675659 ) ( ON ?auto_675657 ?auto_675658 ) ( CLEAR ?auto_675655 ) ( ON ?auto_675656 ?auto_675657 ) ( CLEAR ?auto_675656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_675651 ?auto_675652 ?auto_675653 ?auto_675654 ?auto_675655 ?auto_675656 )
      ( MAKE-13PILE ?auto_675651 ?auto_675652 ?auto_675653 ?auto_675654 ?auto_675655 ?auto_675656 ?auto_675657 ?auto_675658 ?auto_675659 ?auto_675660 ?auto_675661 ?auto_675662 ?auto_675663 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675705 - BLOCK
      ?auto_675706 - BLOCK
      ?auto_675707 - BLOCK
      ?auto_675708 - BLOCK
      ?auto_675709 - BLOCK
      ?auto_675710 - BLOCK
      ?auto_675711 - BLOCK
      ?auto_675712 - BLOCK
      ?auto_675713 - BLOCK
      ?auto_675714 - BLOCK
      ?auto_675715 - BLOCK
      ?auto_675716 - BLOCK
      ?auto_675717 - BLOCK
    )
    :vars
    (
      ?auto_675718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675717 ?auto_675718 ) ( ON-TABLE ?auto_675705 ) ( ON ?auto_675706 ?auto_675705 ) ( ON ?auto_675707 ?auto_675706 ) ( ON ?auto_675708 ?auto_675707 ) ( not ( = ?auto_675705 ?auto_675706 ) ) ( not ( = ?auto_675705 ?auto_675707 ) ) ( not ( = ?auto_675705 ?auto_675708 ) ) ( not ( = ?auto_675705 ?auto_675709 ) ) ( not ( = ?auto_675705 ?auto_675710 ) ) ( not ( = ?auto_675705 ?auto_675711 ) ) ( not ( = ?auto_675705 ?auto_675712 ) ) ( not ( = ?auto_675705 ?auto_675713 ) ) ( not ( = ?auto_675705 ?auto_675714 ) ) ( not ( = ?auto_675705 ?auto_675715 ) ) ( not ( = ?auto_675705 ?auto_675716 ) ) ( not ( = ?auto_675705 ?auto_675717 ) ) ( not ( = ?auto_675705 ?auto_675718 ) ) ( not ( = ?auto_675706 ?auto_675707 ) ) ( not ( = ?auto_675706 ?auto_675708 ) ) ( not ( = ?auto_675706 ?auto_675709 ) ) ( not ( = ?auto_675706 ?auto_675710 ) ) ( not ( = ?auto_675706 ?auto_675711 ) ) ( not ( = ?auto_675706 ?auto_675712 ) ) ( not ( = ?auto_675706 ?auto_675713 ) ) ( not ( = ?auto_675706 ?auto_675714 ) ) ( not ( = ?auto_675706 ?auto_675715 ) ) ( not ( = ?auto_675706 ?auto_675716 ) ) ( not ( = ?auto_675706 ?auto_675717 ) ) ( not ( = ?auto_675706 ?auto_675718 ) ) ( not ( = ?auto_675707 ?auto_675708 ) ) ( not ( = ?auto_675707 ?auto_675709 ) ) ( not ( = ?auto_675707 ?auto_675710 ) ) ( not ( = ?auto_675707 ?auto_675711 ) ) ( not ( = ?auto_675707 ?auto_675712 ) ) ( not ( = ?auto_675707 ?auto_675713 ) ) ( not ( = ?auto_675707 ?auto_675714 ) ) ( not ( = ?auto_675707 ?auto_675715 ) ) ( not ( = ?auto_675707 ?auto_675716 ) ) ( not ( = ?auto_675707 ?auto_675717 ) ) ( not ( = ?auto_675707 ?auto_675718 ) ) ( not ( = ?auto_675708 ?auto_675709 ) ) ( not ( = ?auto_675708 ?auto_675710 ) ) ( not ( = ?auto_675708 ?auto_675711 ) ) ( not ( = ?auto_675708 ?auto_675712 ) ) ( not ( = ?auto_675708 ?auto_675713 ) ) ( not ( = ?auto_675708 ?auto_675714 ) ) ( not ( = ?auto_675708 ?auto_675715 ) ) ( not ( = ?auto_675708 ?auto_675716 ) ) ( not ( = ?auto_675708 ?auto_675717 ) ) ( not ( = ?auto_675708 ?auto_675718 ) ) ( not ( = ?auto_675709 ?auto_675710 ) ) ( not ( = ?auto_675709 ?auto_675711 ) ) ( not ( = ?auto_675709 ?auto_675712 ) ) ( not ( = ?auto_675709 ?auto_675713 ) ) ( not ( = ?auto_675709 ?auto_675714 ) ) ( not ( = ?auto_675709 ?auto_675715 ) ) ( not ( = ?auto_675709 ?auto_675716 ) ) ( not ( = ?auto_675709 ?auto_675717 ) ) ( not ( = ?auto_675709 ?auto_675718 ) ) ( not ( = ?auto_675710 ?auto_675711 ) ) ( not ( = ?auto_675710 ?auto_675712 ) ) ( not ( = ?auto_675710 ?auto_675713 ) ) ( not ( = ?auto_675710 ?auto_675714 ) ) ( not ( = ?auto_675710 ?auto_675715 ) ) ( not ( = ?auto_675710 ?auto_675716 ) ) ( not ( = ?auto_675710 ?auto_675717 ) ) ( not ( = ?auto_675710 ?auto_675718 ) ) ( not ( = ?auto_675711 ?auto_675712 ) ) ( not ( = ?auto_675711 ?auto_675713 ) ) ( not ( = ?auto_675711 ?auto_675714 ) ) ( not ( = ?auto_675711 ?auto_675715 ) ) ( not ( = ?auto_675711 ?auto_675716 ) ) ( not ( = ?auto_675711 ?auto_675717 ) ) ( not ( = ?auto_675711 ?auto_675718 ) ) ( not ( = ?auto_675712 ?auto_675713 ) ) ( not ( = ?auto_675712 ?auto_675714 ) ) ( not ( = ?auto_675712 ?auto_675715 ) ) ( not ( = ?auto_675712 ?auto_675716 ) ) ( not ( = ?auto_675712 ?auto_675717 ) ) ( not ( = ?auto_675712 ?auto_675718 ) ) ( not ( = ?auto_675713 ?auto_675714 ) ) ( not ( = ?auto_675713 ?auto_675715 ) ) ( not ( = ?auto_675713 ?auto_675716 ) ) ( not ( = ?auto_675713 ?auto_675717 ) ) ( not ( = ?auto_675713 ?auto_675718 ) ) ( not ( = ?auto_675714 ?auto_675715 ) ) ( not ( = ?auto_675714 ?auto_675716 ) ) ( not ( = ?auto_675714 ?auto_675717 ) ) ( not ( = ?auto_675714 ?auto_675718 ) ) ( not ( = ?auto_675715 ?auto_675716 ) ) ( not ( = ?auto_675715 ?auto_675717 ) ) ( not ( = ?auto_675715 ?auto_675718 ) ) ( not ( = ?auto_675716 ?auto_675717 ) ) ( not ( = ?auto_675716 ?auto_675718 ) ) ( not ( = ?auto_675717 ?auto_675718 ) ) ( ON ?auto_675716 ?auto_675717 ) ( ON ?auto_675715 ?auto_675716 ) ( ON ?auto_675714 ?auto_675715 ) ( ON ?auto_675713 ?auto_675714 ) ( ON ?auto_675712 ?auto_675713 ) ( ON ?auto_675711 ?auto_675712 ) ( ON ?auto_675710 ?auto_675711 ) ( CLEAR ?auto_675708 ) ( ON ?auto_675709 ?auto_675710 ) ( CLEAR ?auto_675709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_675705 ?auto_675706 ?auto_675707 ?auto_675708 ?auto_675709 )
      ( MAKE-13PILE ?auto_675705 ?auto_675706 ?auto_675707 ?auto_675708 ?auto_675709 ?auto_675710 ?auto_675711 ?auto_675712 ?auto_675713 ?auto_675714 ?auto_675715 ?auto_675716 ?auto_675717 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675759 - BLOCK
      ?auto_675760 - BLOCK
      ?auto_675761 - BLOCK
      ?auto_675762 - BLOCK
      ?auto_675763 - BLOCK
      ?auto_675764 - BLOCK
      ?auto_675765 - BLOCK
      ?auto_675766 - BLOCK
      ?auto_675767 - BLOCK
      ?auto_675768 - BLOCK
      ?auto_675769 - BLOCK
      ?auto_675770 - BLOCK
      ?auto_675771 - BLOCK
    )
    :vars
    (
      ?auto_675772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675771 ?auto_675772 ) ( ON-TABLE ?auto_675759 ) ( ON ?auto_675760 ?auto_675759 ) ( ON ?auto_675761 ?auto_675760 ) ( not ( = ?auto_675759 ?auto_675760 ) ) ( not ( = ?auto_675759 ?auto_675761 ) ) ( not ( = ?auto_675759 ?auto_675762 ) ) ( not ( = ?auto_675759 ?auto_675763 ) ) ( not ( = ?auto_675759 ?auto_675764 ) ) ( not ( = ?auto_675759 ?auto_675765 ) ) ( not ( = ?auto_675759 ?auto_675766 ) ) ( not ( = ?auto_675759 ?auto_675767 ) ) ( not ( = ?auto_675759 ?auto_675768 ) ) ( not ( = ?auto_675759 ?auto_675769 ) ) ( not ( = ?auto_675759 ?auto_675770 ) ) ( not ( = ?auto_675759 ?auto_675771 ) ) ( not ( = ?auto_675759 ?auto_675772 ) ) ( not ( = ?auto_675760 ?auto_675761 ) ) ( not ( = ?auto_675760 ?auto_675762 ) ) ( not ( = ?auto_675760 ?auto_675763 ) ) ( not ( = ?auto_675760 ?auto_675764 ) ) ( not ( = ?auto_675760 ?auto_675765 ) ) ( not ( = ?auto_675760 ?auto_675766 ) ) ( not ( = ?auto_675760 ?auto_675767 ) ) ( not ( = ?auto_675760 ?auto_675768 ) ) ( not ( = ?auto_675760 ?auto_675769 ) ) ( not ( = ?auto_675760 ?auto_675770 ) ) ( not ( = ?auto_675760 ?auto_675771 ) ) ( not ( = ?auto_675760 ?auto_675772 ) ) ( not ( = ?auto_675761 ?auto_675762 ) ) ( not ( = ?auto_675761 ?auto_675763 ) ) ( not ( = ?auto_675761 ?auto_675764 ) ) ( not ( = ?auto_675761 ?auto_675765 ) ) ( not ( = ?auto_675761 ?auto_675766 ) ) ( not ( = ?auto_675761 ?auto_675767 ) ) ( not ( = ?auto_675761 ?auto_675768 ) ) ( not ( = ?auto_675761 ?auto_675769 ) ) ( not ( = ?auto_675761 ?auto_675770 ) ) ( not ( = ?auto_675761 ?auto_675771 ) ) ( not ( = ?auto_675761 ?auto_675772 ) ) ( not ( = ?auto_675762 ?auto_675763 ) ) ( not ( = ?auto_675762 ?auto_675764 ) ) ( not ( = ?auto_675762 ?auto_675765 ) ) ( not ( = ?auto_675762 ?auto_675766 ) ) ( not ( = ?auto_675762 ?auto_675767 ) ) ( not ( = ?auto_675762 ?auto_675768 ) ) ( not ( = ?auto_675762 ?auto_675769 ) ) ( not ( = ?auto_675762 ?auto_675770 ) ) ( not ( = ?auto_675762 ?auto_675771 ) ) ( not ( = ?auto_675762 ?auto_675772 ) ) ( not ( = ?auto_675763 ?auto_675764 ) ) ( not ( = ?auto_675763 ?auto_675765 ) ) ( not ( = ?auto_675763 ?auto_675766 ) ) ( not ( = ?auto_675763 ?auto_675767 ) ) ( not ( = ?auto_675763 ?auto_675768 ) ) ( not ( = ?auto_675763 ?auto_675769 ) ) ( not ( = ?auto_675763 ?auto_675770 ) ) ( not ( = ?auto_675763 ?auto_675771 ) ) ( not ( = ?auto_675763 ?auto_675772 ) ) ( not ( = ?auto_675764 ?auto_675765 ) ) ( not ( = ?auto_675764 ?auto_675766 ) ) ( not ( = ?auto_675764 ?auto_675767 ) ) ( not ( = ?auto_675764 ?auto_675768 ) ) ( not ( = ?auto_675764 ?auto_675769 ) ) ( not ( = ?auto_675764 ?auto_675770 ) ) ( not ( = ?auto_675764 ?auto_675771 ) ) ( not ( = ?auto_675764 ?auto_675772 ) ) ( not ( = ?auto_675765 ?auto_675766 ) ) ( not ( = ?auto_675765 ?auto_675767 ) ) ( not ( = ?auto_675765 ?auto_675768 ) ) ( not ( = ?auto_675765 ?auto_675769 ) ) ( not ( = ?auto_675765 ?auto_675770 ) ) ( not ( = ?auto_675765 ?auto_675771 ) ) ( not ( = ?auto_675765 ?auto_675772 ) ) ( not ( = ?auto_675766 ?auto_675767 ) ) ( not ( = ?auto_675766 ?auto_675768 ) ) ( not ( = ?auto_675766 ?auto_675769 ) ) ( not ( = ?auto_675766 ?auto_675770 ) ) ( not ( = ?auto_675766 ?auto_675771 ) ) ( not ( = ?auto_675766 ?auto_675772 ) ) ( not ( = ?auto_675767 ?auto_675768 ) ) ( not ( = ?auto_675767 ?auto_675769 ) ) ( not ( = ?auto_675767 ?auto_675770 ) ) ( not ( = ?auto_675767 ?auto_675771 ) ) ( not ( = ?auto_675767 ?auto_675772 ) ) ( not ( = ?auto_675768 ?auto_675769 ) ) ( not ( = ?auto_675768 ?auto_675770 ) ) ( not ( = ?auto_675768 ?auto_675771 ) ) ( not ( = ?auto_675768 ?auto_675772 ) ) ( not ( = ?auto_675769 ?auto_675770 ) ) ( not ( = ?auto_675769 ?auto_675771 ) ) ( not ( = ?auto_675769 ?auto_675772 ) ) ( not ( = ?auto_675770 ?auto_675771 ) ) ( not ( = ?auto_675770 ?auto_675772 ) ) ( not ( = ?auto_675771 ?auto_675772 ) ) ( ON ?auto_675770 ?auto_675771 ) ( ON ?auto_675769 ?auto_675770 ) ( ON ?auto_675768 ?auto_675769 ) ( ON ?auto_675767 ?auto_675768 ) ( ON ?auto_675766 ?auto_675767 ) ( ON ?auto_675765 ?auto_675766 ) ( ON ?auto_675764 ?auto_675765 ) ( ON ?auto_675763 ?auto_675764 ) ( CLEAR ?auto_675761 ) ( ON ?auto_675762 ?auto_675763 ) ( CLEAR ?auto_675762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_675759 ?auto_675760 ?auto_675761 ?auto_675762 )
      ( MAKE-13PILE ?auto_675759 ?auto_675760 ?auto_675761 ?auto_675762 ?auto_675763 ?auto_675764 ?auto_675765 ?auto_675766 ?auto_675767 ?auto_675768 ?auto_675769 ?auto_675770 ?auto_675771 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675813 - BLOCK
      ?auto_675814 - BLOCK
      ?auto_675815 - BLOCK
      ?auto_675816 - BLOCK
      ?auto_675817 - BLOCK
      ?auto_675818 - BLOCK
      ?auto_675819 - BLOCK
      ?auto_675820 - BLOCK
      ?auto_675821 - BLOCK
      ?auto_675822 - BLOCK
      ?auto_675823 - BLOCK
      ?auto_675824 - BLOCK
      ?auto_675825 - BLOCK
    )
    :vars
    (
      ?auto_675826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675825 ?auto_675826 ) ( ON-TABLE ?auto_675813 ) ( ON ?auto_675814 ?auto_675813 ) ( not ( = ?auto_675813 ?auto_675814 ) ) ( not ( = ?auto_675813 ?auto_675815 ) ) ( not ( = ?auto_675813 ?auto_675816 ) ) ( not ( = ?auto_675813 ?auto_675817 ) ) ( not ( = ?auto_675813 ?auto_675818 ) ) ( not ( = ?auto_675813 ?auto_675819 ) ) ( not ( = ?auto_675813 ?auto_675820 ) ) ( not ( = ?auto_675813 ?auto_675821 ) ) ( not ( = ?auto_675813 ?auto_675822 ) ) ( not ( = ?auto_675813 ?auto_675823 ) ) ( not ( = ?auto_675813 ?auto_675824 ) ) ( not ( = ?auto_675813 ?auto_675825 ) ) ( not ( = ?auto_675813 ?auto_675826 ) ) ( not ( = ?auto_675814 ?auto_675815 ) ) ( not ( = ?auto_675814 ?auto_675816 ) ) ( not ( = ?auto_675814 ?auto_675817 ) ) ( not ( = ?auto_675814 ?auto_675818 ) ) ( not ( = ?auto_675814 ?auto_675819 ) ) ( not ( = ?auto_675814 ?auto_675820 ) ) ( not ( = ?auto_675814 ?auto_675821 ) ) ( not ( = ?auto_675814 ?auto_675822 ) ) ( not ( = ?auto_675814 ?auto_675823 ) ) ( not ( = ?auto_675814 ?auto_675824 ) ) ( not ( = ?auto_675814 ?auto_675825 ) ) ( not ( = ?auto_675814 ?auto_675826 ) ) ( not ( = ?auto_675815 ?auto_675816 ) ) ( not ( = ?auto_675815 ?auto_675817 ) ) ( not ( = ?auto_675815 ?auto_675818 ) ) ( not ( = ?auto_675815 ?auto_675819 ) ) ( not ( = ?auto_675815 ?auto_675820 ) ) ( not ( = ?auto_675815 ?auto_675821 ) ) ( not ( = ?auto_675815 ?auto_675822 ) ) ( not ( = ?auto_675815 ?auto_675823 ) ) ( not ( = ?auto_675815 ?auto_675824 ) ) ( not ( = ?auto_675815 ?auto_675825 ) ) ( not ( = ?auto_675815 ?auto_675826 ) ) ( not ( = ?auto_675816 ?auto_675817 ) ) ( not ( = ?auto_675816 ?auto_675818 ) ) ( not ( = ?auto_675816 ?auto_675819 ) ) ( not ( = ?auto_675816 ?auto_675820 ) ) ( not ( = ?auto_675816 ?auto_675821 ) ) ( not ( = ?auto_675816 ?auto_675822 ) ) ( not ( = ?auto_675816 ?auto_675823 ) ) ( not ( = ?auto_675816 ?auto_675824 ) ) ( not ( = ?auto_675816 ?auto_675825 ) ) ( not ( = ?auto_675816 ?auto_675826 ) ) ( not ( = ?auto_675817 ?auto_675818 ) ) ( not ( = ?auto_675817 ?auto_675819 ) ) ( not ( = ?auto_675817 ?auto_675820 ) ) ( not ( = ?auto_675817 ?auto_675821 ) ) ( not ( = ?auto_675817 ?auto_675822 ) ) ( not ( = ?auto_675817 ?auto_675823 ) ) ( not ( = ?auto_675817 ?auto_675824 ) ) ( not ( = ?auto_675817 ?auto_675825 ) ) ( not ( = ?auto_675817 ?auto_675826 ) ) ( not ( = ?auto_675818 ?auto_675819 ) ) ( not ( = ?auto_675818 ?auto_675820 ) ) ( not ( = ?auto_675818 ?auto_675821 ) ) ( not ( = ?auto_675818 ?auto_675822 ) ) ( not ( = ?auto_675818 ?auto_675823 ) ) ( not ( = ?auto_675818 ?auto_675824 ) ) ( not ( = ?auto_675818 ?auto_675825 ) ) ( not ( = ?auto_675818 ?auto_675826 ) ) ( not ( = ?auto_675819 ?auto_675820 ) ) ( not ( = ?auto_675819 ?auto_675821 ) ) ( not ( = ?auto_675819 ?auto_675822 ) ) ( not ( = ?auto_675819 ?auto_675823 ) ) ( not ( = ?auto_675819 ?auto_675824 ) ) ( not ( = ?auto_675819 ?auto_675825 ) ) ( not ( = ?auto_675819 ?auto_675826 ) ) ( not ( = ?auto_675820 ?auto_675821 ) ) ( not ( = ?auto_675820 ?auto_675822 ) ) ( not ( = ?auto_675820 ?auto_675823 ) ) ( not ( = ?auto_675820 ?auto_675824 ) ) ( not ( = ?auto_675820 ?auto_675825 ) ) ( not ( = ?auto_675820 ?auto_675826 ) ) ( not ( = ?auto_675821 ?auto_675822 ) ) ( not ( = ?auto_675821 ?auto_675823 ) ) ( not ( = ?auto_675821 ?auto_675824 ) ) ( not ( = ?auto_675821 ?auto_675825 ) ) ( not ( = ?auto_675821 ?auto_675826 ) ) ( not ( = ?auto_675822 ?auto_675823 ) ) ( not ( = ?auto_675822 ?auto_675824 ) ) ( not ( = ?auto_675822 ?auto_675825 ) ) ( not ( = ?auto_675822 ?auto_675826 ) ) ( not ( = ?auto_675823 ?auto_675824 ) ) ( not ( = ?auto_675823 ?auto_675825 ) ) ( not ( = ?auto_675823 ?auto_675826 ) ) ( not ( = ?auto_675824 ?auto_675825 ) ) ( not ( = ?auto_675824 ?auto_675826 ) ) ( not ( = ?auto_675825 ?auto_675826 ) ) ( ON ?auto_675824 ?auto_675825 ) ( ON ?auto_675823 ?auto_675824 ) ( ON ?auto_675822 ?auto_675823 ) ( ON ?auto_675821 ?auto_675822 ) ( ON ?auto_675820 ?auto_675821 ) ( ON ?auto_675819 ?auto_675820 ) ( ON ?auto_675818 ?auto_675819 ) ( ON ?auto_675817 ?auto_675818 ) ( ON ?auto_675816 ?auto_675817 ) ( CLEAR ?auto_675814 ) ( ON ?auto_675815 ?auto_675816 ) ( CLEAR ?auto_675815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_675813 ?auto_675814 ?auto_675815 )
      ( MAKE-13PILE ?auto_675813 ?auto_675814 ?auto_675815 ?auto_675816 ?auto_675817 ?auto_675818 ?auto_675819 ?auto_675820 ?auto_675821 ?auto_675822 ?auto_675823 ?auto_675824 ?auto_675825 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675867 - BLOCK
      ?auto_675868 - BLOCK
      ?auto_675869 - BLOCK
      ?auto_675870 - BLOCK
      ?auto_675871 - BLOCK
      ?auto_675872 - BLOCK
      ?auto_675873 - BLOCK
      ?auto_675874 - BLOCK
      ?auto_675875 - BLOCK
      ?auto_675876 - BLOCK
      ?auto_675877 - BLOCK
      ?auto_675878 - BLOCK
      ?auto_675879 - BLOCK
    )
    :vars
    (
      ?auto_675880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675879 ?auto_675880 ) ( ON-TABLE ?auto_675867 ) ( not ( = ?auto_675867 ?auto_675868 ) ) ( not ( = ?auto_675867 ?auto_675869 ) ) ( not ( = ?auto_675867 ?auto_675870 ) ) ( not ( = ?auto_675867 ?auto_675871 ) ) ( not ( = ?auto_675867 ?auto_675872 ) ) ( not ( = ?auto_675867 ?auto_675873 ) ) ( not ( = ?auto_675867 ?auto_675874 ) ) ( not ( = ?auto_675867 ?auto_675875 ) ) ( not ( = ?auto_675867 ?auto_675876 ) ) ( not ( = ?auto_675867 ?auto_675877 ) ) ( not ( = ?auto_675867 ?auto_675878 ) ) ( not ( = ?auto_675867 ?auto_675879 ) ) ( not ( = ?auto_675867 ?auto_675880 ) ) ( not ( = ?auto_675868 ?auto_675869 ) ) ( not ( = ?auto_675868 ?auto_675870 ) ) ( not ( = ?auto_675868 ?auto_675871 ) ) ( not ( = ?auto_675868 ?auto_675872 ) ) ( not ( = ?auto_675868 ?auto_675873 ) ) ( not ( = ?auto_675868 ?auto_675874 ) ) ( not ( = ?auto_675868 ?auto_675875 ) ) ( not ( = ?auto_675868 ?auto_675876 ) ) ( not ( = ?auto_675868 ?auto_675877 ) ) ( not ( = ?auto_675868 ?auto_675878 ) ) ( not ( = ?auto_675868 ?auto_675879 ) ) ( not ( = ?auto_675868 ?auto_675880 ) ) ( not ( = ?auto_675869 ?auto_675870 ) ) ( not ( = ?auto_675869 ?auto_675871 ) ) ( not ( = ?auto_675869 ?auto_675872 ) ) ( not ( = ?auto_675869 ?auto_675873 ) ) ( not ( = ?auto_675869 ?auto_675874 ) ) ( not ( = ?auto_675869 ?auto_675875 ) ) ( not ( = ?auto_675869 ?auto_675876 ) ) ( not ( = ?auto_675869 ?auto_675877 ) ) ( not ( = ?auto_675869 ?auto_675878 ) ) ( not ( = ?auto_675869 ?auto_675879 ) ) ( not ( = ?auto_675869 ?auto_675880 ) ) ( not ( = ?auto_675870 ?auto_675871 ) ) ( not ( = ?auto_675870 ?auto_675872 ) ) ( not ( = ?auto_675870 ?auto_675873 ) ) ( not ( = ?auto_675870 ?auto_675874 ) ) ( not ( = ?auto_675870 ?auto_675875 ) ) ( not ( = ?auto_675870 ?auto_675876 ) ) ( not ( = ?auto_675870 ?auto_675877 ) ) ( not ( = ?auto_675870 ?auto_675878 ) ) ( not ( = ?auto_675870 ?auto_675879 ) ) ( not ( = ?auto_675870 ?auto_675880 ) ) ( not ( = ?auto_675871 ?auto_675872 ) ) ( not ( = ?auto_675871 ?auto_675873 ) ) ( not ( = ?auto_675871 ?auto_675874 ) ) ( not ( = ?auto_675871 ?auto_675875 ) ) ( not ( = ?auto_675871 ?auto_675876 ) ) ( not ( = ?auto_675871 ?auto_675877 ) ) ( not ( = ?auto_675871 ?auto_675878 ) ) ( not ( = ?auto_675871 ?auto_675879 ) ) ( not ( = ?auto_675871 ?auto_675880 ) ) ( not ( = ?auto_675872 ?auto_675873 ) ) ( not ( = ?auto_675872 ?auto_675874 ) ) ( not ( = ?auto_675872 ?auto_675875 ) ) ( not ( = ?auto_675872 ?auto_675876 ) ) ( not ( = ?auto_675872 ?auto_675877 ) ) ( not ( = ?auto_675872 ?auto_675878 ) ) ( not ( = ?auto_675872 ?auto_675879 ) ) ( not ( = ?auto_675872 ?auto_675880 ) ) ( not ( = ?auto_675873 ?auto_675874 ) ) ( not ( = ?auto_675873 ?auto_675875 ) ) ( not ( = ?auto_675873 ?auto_675876 ) ) ( not ( = ?auto_675873 ?auto_675877 ) ) ( not ( = ?auto_675873 ?auto_675878 ) ) ( not ( = ?auto_675873 ?auto_675879 ) ) ( not ( = ?auto_675873 ?auto_675880 ) ) ( not ( = ?auto_675874 ?auto_675875 ) ) ( not ( = ?auto_675874 ?auto_675876 ) ) ( not ( = ?auto_675874 ?auto_675877 ) ) ( not ( = ?auto_675874 ?auto_675878 ) ) ( not ( = ?auto_675874 ?auto_675879 ) ) ( not ( = ?auto_675874 ?auto_675880 ) ) ( not ( = ?auto_675875 ?auto_675876 ) ) ( not ( = ?auto_675875 ?auto_675877 ) ) ( not ( = ?auto_675875 ?auto_675878 ) ) ( not ( = ?auto_675875 ?auto_675879 ) ) ( not ( = ?auto_675875 ?auto_675880 ) ) ( not ( = ?auto_675876 ?auto_675877 ) ) ( not ( = ?auto_675876 ?auto_675878 ) ) ( not ( = ?auto_675876 ?auto_675879 ) ) ( not ( = ?auto_675876 ?auto_675880 ) ) ( not ( = ?auto_675877 ?auto_675878 ) ) ( not ( = ?auto_675877 ?auto_675879 ) ) ( not ( = ?auto_675877 ?auto_675880 ) ) ( not ( = ?auto_675878 ?auto_675879 ) ) ( not ( = ?auto_675878 ?auto_675880 ) ) ( not ( = ?auto_675879 ?auto_675880 ) ) ( ON ?auto_675878 ?auto_675879 ) ( ON ?auto_675877 ?auto_675878 ) ( ON ?auto_675876 ?auto_675877 ) ( ON ?auto_675875 ?auto_675876 ) ( ON ?auto_675874 ?auto_675875 ) ( ON ?auto_675873 ?auto_675874 ) ( ON ?auto_675872 ?auto_675873 ) ( ON ?auto_675871 ?auto_675872 ) ( ON ?auto_675870 ?auto_675871 ) ( ON ?auto_675869 ?auto_675870 ) ( CLEAR ?auto_675867 ) ( ON ?auto_675868 ?auto_675869 ) ( CLEAR ?auto_675868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_675867 ?auto_675868 )
      ( MAKE-13PILE ?auto_675867 ?auto_675868 ?auto_675869 ?auto_675870 ?auto_675871 ?auto_675872 ?auto_675873 ?auto_675874 ?auto_675875 ?auto_675876 ?auto_675877 ?auto_675878 ?auto_675879 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_675921 - BLOCK
      ?auto_675922 - BLOCK
      ?auto_675923 - BLOCK
      ?auto_675924 - BLOCK
      ?auto_675925 - BLOCK
      ?auto_675926 - BLOCK
      ?auto_675927 - BLOCK
      ?auto_675928 - BLOCK
      ?auto_675929 - BLOCK
      ?auto_675930 - BLOCK
      ?auto_675931 - BLOCK
      ?auto_675932 - BLOCK
      ?auto_675933 - BLOCK
    )
    :vars
    (
      ?auto_675934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_675933 ?auto_675934 ) ( not ( = ?auto_675921 ?auto_675922 ) ) ( not ( = ?auto_675921 ?auto_675923 ) ) ( not ( = ?auto_675921 ?auto_675924 ) ) ( not ( = ?auto_675921 ?auto_675925 ) ) ( not ( = ?auto_675921 ?auto_675926 ) ) ( not ( = ?auto_675921 ?auto_675927 ) ) ( not ( = ?auto_675921 ?auto_675928 ) ) ( not ( = ?auto_675921 ?auto_675929 ) ) ( not ( = ?auto_675921 ?auto_675930 ) ) ( not ( = ?auto_675921 ?auto_675931 ) ) ( not ( = ?auto_675921 ?auto_675932 ) ) ( not ( = ?auto_675921 ?auto_675933 ) ) ( not ( = ?auto_675921 ?auto_675934 ) ) ( not ( = ?auto_675922 ?auto_675923 ) ) ( not ( = ?auto_675922 ?auto_675924 ) ) ( not ( = ?auto_675922 ?auto_675925 ) ) ( not ( = ?auto_675922 ?auto_675926 ) ) ( not ( = ?auto_675922 ?auto_675927 ) ) ( not ( = ?auto_675922 ?auto_675928 ) ) ( not ( = ?auto_675922 ?auto_675929 ) ) ( not ( = ?auto_675922 ?auto_675930 ) ) ( not ( = ?auto_675922 ?auto_675931 ) ) ( not ( = ?auto_675922 ?auto_675932 ) ) ( not ( = ?auto_675922 ?auto_675933 ) ) ( not ( = ?auto_675922 ?auto_675934 ) ) ( not ( = ?auto_675923 ?auto_675924 ) ) ( not ( = ?auto_675923 ?auto_675925 ) ) ( not ( = ?auto_675923 ?auto_675926 ) ) ( not ( = ?auto_675923 ?auto_675927 ) ) ( not ( = ?auto_675923 ?auto_675928 ) ) ( not ( = ?auto_675923 ?auto_675929 ) ) ( not ( = ?auto_675923 ?auto_675930 ) ) ( not ( = ?auto_675923 ?auto_675931 ) ) ( not ( = ?auto_675923 ?auto_675932 ) ) ( not ( = ?auto_675923 ?auto_675933 ) ) ( not ( = ?auto_675923 ?auto_675934 ) ) ( not ( = ?auto_675924 ?auto_675925 ) ) ( not ( = ?auto_675924 ?auto_675926 ) ) ( not ( = ?auto_675924 ?auto_675927 ) ) ( not ( = ?auto_675924 ?auto_675928 ) ) ( not ( = ?auto_675924 ?auto_675929 ) ) ( not ( = ?auto_675924 ?auto_675930 ) ) ( not ( = ?auto_675924 ?auto_675931 ) ) ( not ( = ?auto_675924 ?auto_675932 ) ) ( not ( = ?auto_675924 ?auto_675933 ) ) ( not ( = ?auto_675924 ?auto_675934 ) ) ( not ( = ?auto_675925 ?auto_675926 ) ) ( not ( = ?auto_675925 ?auto_675927 ) ) ( not ( = ?auto_675925 ?auto_675928 ) ) ( not ( = ?auto_675925 ?auto_675929 ) ) ( not ( = ?auto_675925 ?auto_675930 ) ) ( not ( = ?auto_675925 ?auto_675931 ) ) ( not ( = ?auto_675925 ?auto_675932 ) ) ( not ( = ?auto_675925 ?auto_675933 ) ) ( not ( = ?auto_675925 ?auto_675934 ) ) ( not ( = ?auto_675926 ?auto_675927 ) ) ( not ( = ?auto_675926 ?auto_675928 ) ) ( not ( = ?auto_675926 ?auto_675929 ) ) ( not ( = ?auto_675926 ?auto_675930 ) ) ( not ( = ?auto_675926 ?auto_675931 ) ) ( not ( = ?auto_675926 ?auto_675932 ) ) ( not ( = ?auto_675926 ?auto_675933 ) ) ( not ( = ?auto_675926 ?auto_675934 ) ) ( not ( = ?auto_675927 ?auto_675928 ) ) ( not ( = ?auto_675927 ?auto_675929 ) ) ( not ( = ?auto_675927 ?auto_675930 ) ) ( not ( = ?auto_675927 ?auto_675931 ) ) ( not ( = ?auto_675927 ?auto_675932 ) ) ( not ( = ?auto_675927 ?auto_675933 ) ) ( not ( = ?auto_675927 ?auto_675934 ) ) ( not ( = ?auto_675928 ?auto_675929 ) ) ( not ( = ?auto_675928 ?auto_675930 ) ) ( not ( = ?auto_675928 ?auto_675931 ) ) ( not ( = ?auto_675928 ?auto_675932 ) ) ( not ( = ?auto_675928 ?auto_675933 ) ) ( not ( = ?auto_675928 ?auto_675934 ) ) ( not ( = ?auto_675929 ?auto_675930 ) ) ( not ( = ?auto_675929 ?auto_675931 ) ) ( not ( = ?auto_675929 ?auto_675932 ) ) ( not ( = ?auto_675929 ?auto_675933 ) ) ( not ( = ?auto_675929 ?auto_675934 ) ) ( not ( = ?auto_675930 ?auto_675931 ) ) ( not ( = ?auto_675930 ?auto_675932 ) ) ( not ( = ?auto_675930 ?auto_675933 ) ) ( not ( = ?auto_675930 ?auto_675934 ) ) ( not ( = ?auto_675931 ?auto_675932 ) ) ( not ( = ?auto_675931 ?auto_675933 ) ) ( not ( = ?auto_675931 ?auto_675934 ) ) ( not ( = ?auto_675932 ?auto_675933 ) ) ( not ( = ?auto_675932 ?auto_675934 ) ) ( not ( = ?auto_675933 ?auto_675934 ) ) ( ON ?auto_675932 ?auto_675933 ) ( ON ?auto_675931 ?auto_675932 ) ( ON ?auto_675930 ?auto_675931 ) ( ON ?auto_675929 ?auto_675930 ) ( ON ?auto_675928 ?auto_675929 ) ( ON ?auto_675927 ?auto_675928 ) ( ON ?auto_675926 ?auto_675927 ) ( ON ?auto_675925 ?auto_675926 ) ( ON ?auto_675924 ?auto_675925 ) ( ON ?auto_675923 ?auto_675924 ) ( ON ?auto_675922 ?auto_675923 ) ( ON ?auto_675921 ?auto_675922 ) ( CLEAR ?auto_675921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_675921 )
      ( MAKE-13PILE ?auto_675921 ?auto_675922 ?auto_675923 ?auto_675924 ?auto_675925 ?auto_675926 ?auto_675927 ?auto_675928 ?auto_675929 ?auto_675930 ?auto_675931 ?auto_675932 ?auto_675933 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_675976 - BLOCK
      ?auto_675977 - BLOCK
      ?auto_675978 - BLOCK
      ?auto_675979 - BLOCK
      ?auto_675980 - BLOCK
      ?auto_675981 - BLOCK
      ?auto_675982 - BLOCK
      ?auto_675983 - BLOCK
      ?auto_675984 - BLOCK
      ?auto_675985 - BLOCK
      ?auto_675986 - BLOCK
      ?auto_675987 - BLOCK
      ?auto_675988 - BLOCK
      ?auto_675989 - BLOCK
    )
    :vars
    (
      ?auto_675990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_675988 ) ( ON ?auto_675989 ?auto_675990 ) ( CLEAR ?auto_675989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_675976 ) ( ON ?auto_675977 ?auto_675976 ) ( ON ?auto_675978 ?auto_675977 ) ( ON ?auto_675979 ?auto_675978 ) ( ON ?auto_675980 ?auto_675979 ) ( ON ?auto_675981 ?auto_675980 ) ( ON ?auto_675982 ?auto_675981 ) ( ON ?auto_675983 ?auto_675982 ) ( ON ?auto_675984 ?auto_675983 ) ( ON ?auto_675985 ?auto_675984 ) ( ON ?auto_675986 ?auto_675985 ) ( ON ?auto_675987 ?auto_675986 ) ( ON ?auto_675988 ?auto_675987 ) ( not ( = ?auto_675976 ?auto_675977 ) ) ( not ( = ?auto_675976 ?auto_675978 ) ) ( not ( = ?auto_675976 ?auto_675979 ) ) ( not ( = ?auto_675976 ?auto_675980 ) ) ( not ( = ?auto_675976 ?auto_675981 ) ) ( not ( = ?auto_675976 ?auto_675982 ) ) ( not ( = ?auto_675976 ?auto_675983 ) ) ( not ( = ?auto_675976 ?auto_675984 ) ) ( not ( = ?auto_675976 ?auto_675985 ) ) ( not ( = ?auto_675976 ?auto_675986 ) ) ( not ( = ?auto_675976 ?auto_675987 ) ) ( not ( = ?auto_675976 ?auto_675988 ) ) ( not ( = ?auto_675976 ?auto_675989 ) ) ( not ( = ?auto_675976 ?auto_675990 ) ) ( not ( = ?auto_675977 ?auto_675978 ) ) ( not ( = ?auto_675977 ?auto_675979 ) ) ( not ( = ?auto_675977 ?auto_675980 ) ) ( not ( = ?auto_675977 ?auto_675981 ) ) ( not ( = ?auto_675977 ?auto_675982 ) ) ( not ( = ?auto_675977 ?auto_675983 ) ) ( not ( = ?auto_675977 ?auto_675984 ) ) ( not ( = ?auto_675977 ?auto_675985 ) ) ( not ( = ?auto_675977 ?auto_675986 ) ) ( not ( = ?auto_675977 ?auto_675987 ) ) ( not ( = ?auto_675977 ?auto_675988 ) ) ( not ( = ?auto_675977 ?auto_675989 ) ) ( not ( = ?auto_675977 ?auto_675990 ) ) ( not ( = ?auto_675978 ?auto_675979 ) ) ( not ( = ?auto_675978 ?auto_675980 ) ) ( not ( = ?auto_675978 ?auto_675981 ) ) ( not ( = ?auto_675978 ?auto_675982 ) ) ( not ( = ?auto_675978 ?auto_675983 ) ) ( not ( = ?auto_675978 ?auto_675984 ) ) ( not ( = ?auto_675978 ?auto_675985 ) ) ( not ( = ?auto_675978 ?auto_675986 ) ) ( not ( = ?auto_675978 ?auto_675987 ) ) ( not ( = ?auto_675978 ?auto_675988 ) ) ( not ( = ?auto_675978 ?auto_675989 ) ) ( not ( = ?auto_675978 ?auto_675990 ) ) ( not ( = ?auto_675979 ?auto_675980 ) ) ( not ( = ?auto_675979 ?auto_675981 ) ) ( not ( = ?auto_675979 ?auto_675982 ) ) ( not ( = ?auto_675979 ?auto_675983 ) ) ( not ( = ?auto_675979 ?auto_675984 ) ) ( not ( = ?auto_675979 ?auto_675985 ) ) ( not ( = ?auto_675979 ?auto_675986 ) ) ( not ( = ?auto_675979 ?auto_675987 ) ) ( not ( = ?auto_675979 ?auto_675988 ) ) ( not ( = ?auto_675979 ?auto_675989 ) ) ( not ( = ?auto_675979 ?auto_675990 ) ) ( not ( = ?auto_675980 ?auto_675981 ) ) ( not ( = ?auto_675980 ?auto_675982 ) ) ( not ( = ?auto_675980 ?auto_675983 ) ) ( not ( = ?auto_675980 ?auto_675984 ) ) ( not ( = ?auto_675980 ?auto_675985 ) ) ( not ( = ?auto_675980 ?auto_675986 ) ) ( not ( = ?auto_675980 ?auto_675987 ) ) ( not ( = ?auto_675980 ?auto_675988 ) ) ( not ( = ?auto_675980 ?auto_675989 ) ) ( not ( = ?auto_675980 ?auto_675990 ) ) ( not ( = ?auto_675981 ?auto_675982 ) ) ( not ( = ?auto_675981 ?auto_675983 ) ) ( not ( = ?auto_675981 ?auto_675984 ) ) ( not ( = ?auto_675981 ?auto_675985 ) ) ( not ( = ?auto_675981 ?auto_675986 ) ) ( not ( = ?auto_675981 ?auto_675987 ) ) ( not ( = ?auto_675981 ?auto_675988 ) ) ( not ( = ?auto_675981 ?auto_675989 ) ) ( not ( = ?auto_675981 ?auto_675990 ) ) ( not ( = ?auto_675982 ?auto_675983 ) ) ( not ( = ?auto_675982 ?auto_675984 ) ) ( not ( = ?auto_675982 ?auto_675985 ) ) ( not ( = ?auto_675982 ?auto_675986 ) ) ( not ( = ?auto_675982 ?auto_675987 ) ) ( not ( = ?auto_675982 ?auto_675988 ) ) ( not ( = ?auto_675982 ?auto_675989 ) ) ( not ( = ?auto_675982 ?auto_675990 ) ) ( not ( = ?auto_675983 ?auto_675984 ) ) ( not ( = ?auto_675983 ?auto_675985 ) ) ( not ( = ?auto_675983 ?auto_675986 ) ) ( not ( = ?auto_675983 ?auto_675987 ) ) ( not ( = ?auto_675983 ?auto_675988 ) ) ( not ( = ?auto_675983 ?auto_675989 ) ) ( not ( = ?auto_675983 ?auto_675990 ) ) ( not ( = ?auto_675984 ?auto_675985 ) ) ( not ( = ?auto_675984 ?auto_675986 ) ) ( not ( = ?auto_675984 ?auto_675987 ) ) ( not ( = ?auto_675984 ?auto_675988 ) ) ( not ( = ?auto_675984 ?auto_675989 ) ) ( not ( = ?auto_675984 ?auto_675990 ) ) ( not ( = ?auto_675985 ?auto_675986 ) ) ( not ( = ?auto_675985 ?auto_675987 ) ) ( not ( = ?auto_675985 ?auto_675988 ) ) ( not ( = ?auto_675985 ?auto_675989 ) ) ( not ( = ?auto_675985 ?auto_675990 ) ) ( not ( = ?auto_675986 ?auto_675987 ) ) ( not ( = ?auto_675986 ?auto_675988 ) ) ( not ( = ?auto_675986 ?auto_675989 ) ) ( not ( = ?auto_675986 ?auto_675990 ) ) ( not ( = ?auto_675987 ?auto_675988 ) ) ( not ( = ?auto_675987 ?auto_675989 ) ) ( not ( = ?auto_675987 ?auto_675990 ) ) ( not ( = ?auto_675988 ?auto_675989 ) ) ( not ( = ?auto_675988 ?auto_675990 ) ) ( not ( = ?auto_675989 ?auto_675990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_675989 ?auto_675990 )
      ( !STACK ?auto_675989 ?auto_675988 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676034 - BLOCK
      ?auto_676035 - BLOCK
      ?auto_676036 - BLOCK
      ?auto_676037 - BLOCK
      ?auto_676038 - BLOCK
      ?auto_676039 - BLOCK
      ?auto_676040 - BLOCK
      ?auto_676041 - BLOCK
      ?auto_676042 - BLOCK
      ?auto_676043 - BLOCK
      ?auto_676044 - BLOCK
      ?auto_676045 - BLOCK
      ?auto_676046 - BLOCK
      ?auto_676047 - BLOCK
    )
    :vars
    (
      ?auto_676048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676047 ?auto_676048 ) ( ON-TABLE ?auto_676034 ) ( ON ?auto_676035 ?auto_676034 ) ( ON ?auto_676036 ?auto_676035 ) ( ON ?auto_676037 ?auto_676036 ) ( ON ?auto_676038 ?auto_676037 ) ( ON ?auto_676039 ?auto_676038 ) ( ON ?auto_676040 ?auto_676039 ) ( ON ?auto_676041 ?auto_676040 ) ( ON ?auto_676042 ?auto_676041 ) ( ON ?auto_676043 ?auto_676042 ) ( ON ?auto_676044 ?auto_676043 ) ( ON ?auto_676045 ?auto_676044 ) ( not ( = ?auto_676034 ?auto_676035 ) ) ( not ( = ?auto_676034 ?auto_676036 ) ) ( not ( = ?auto_676034 ?auto_676037 ) ) ( not ( = ?auto_676034 ?auto_676038 ) ) ( not ( = ?auto_676034 ?auto_676039 ) ) ( not ( = ?auto_676034 ?auto_676040 ) ) ( not ( = ?auto_676034 ?auto_676041 ) ) ( not ( = ?auto_676034 ?auto_676042 ) ) ( not ( = ?auto_676034 ?auto_676043 ) ) ( not ( = ?auto_676034 ?auto_676044 ) ) ( not ( = ?auto_676034 ?auto_676045 ) ) ( not ( = ?auto_676034 ?auto_676046 ) ) ( not ( = ?auto_676034 ?auto_676047 ) ) ( not ( = ?auto_676034 ?auto_676048 ) ) ( not ( = ?auto_676035 ?auto_676036 ) ) ( not ( = ?auto_676035 ?auto_676037 ) ) ( not ( = ?auto_676035 ?auto_676038 ) ) ( not ( = ?auto_676035 ?auto_676039 ) ) ( not ( = ?auto_676035 ?auto_676040 ) ) ( not ( = ?auto_676035 ?auto_676041 ) ) ( not ( = ?auto_676035 ?auto_676042 ) ) ( not ( = ?auto_676035 ?auto_676043 ) ) ( not ( = ?auto_676035 ?auto_676044 ) ) ( not ( = ?auto_676035 ?auto_676045 ) ) ( not ( = ?auto_676035 ?auto_676046 ) ) ( not ( = ?auto_676035 ?auto_676047 ) ) ( not ( = ?auto_676035 ?auto_676048 ) ) ( not ( = ?auto_676036 ?auto_676037 ) ) ( not ( = ?auto_676036 ?auto_676038 ) ) ( not ( = ?auto_676036 ?auto_676039 ) ) ( not ( = ?auto_676036 ?auto_676040 ) ) ( not ( = ?auto_676036 ?auto_676041 ) ) ( not ( = ?auto_676036 ?auto_676042 ) ) ( not ( = ?auto_676036 ?auto_676043 ) ) ( not ( = ?auto_676036 ?auto_676044 ) ) ( not ( = ?auto_676036 ?auto_676045 ) ) ( not ( = ?auto_676036 ?auto_676046 ) ) ( not ( = ?auto_676036 ?auto_676047 ) ) ( not ( = ?auto_676036 ?auto_676048 ) ) ( not ( = ?auto_676037 ?auto_676038 ) ) ( not ( = ?auto_676037 ?auto_676039 ) ) ( not ( = ?auto_676037 ?auto_676040 ) ) ( not ( = ?auto_676037 ?auto_676041 ) ) ( not ( = ?auto_676037 ?auto_676042 ) ) ( not ( = ?auto_676037 ?auto_676043 ) ) ( not ( = ?auto_676037 ?auto_676044 ) ) ( not ( = ?auto_676037 ?auto_676045 ) ) ( not ( = ?auto_676037 ?auto_676046 ) ) ( not ( = ?auto_676037 ?auto_676047 ) ) ( not ( = ?auto_676037 ?auto_676048 ) ) ( not ( = ?auto_676038 ?auto_676039 ) ) ( not ( = ?auto_676038 ?auto_676040 ) ) ( not ( = ?auto_676038 ?auto_676041 ) ) ( not ( = ?auto_676038 ?auto_676042 ) ) ( not ( = ?auto_676038 ?auto_676043 ) ) ( not ( = ?auto_676038 ?auto_676044 ) ) ( not ( = ?auto_676038 ?auto_676045 ) ) ( not ( = ?auto_676038 ?auto_676046 ) ) ( not ( = ?auto_676038 ?auto_676047 ) ) ( not ( = ?auto_676038 ?auto_676048 ) ) ( not ( = ?auto_676039 ?auto_676040 ) ) ( not ( = ?auto_676039 ?auto_676041 ) ) ( not ( = ?auto_676039 ?auto_676042 ) ) ( not ( = ?auto_676039 ?auto_676043 ) ) ( not ( = ?auto_676039 ?auto_676044 ) ) ( not ( = ?auto_676039 ?auto_676045 ) ) ( not ( = ?auto_676039 ?auto_676046 ) ) ( not ( = ?auto_676039 ?auto_676047 ) ) ( not ( = ?auto_676039 ?auto_676048 ) ) ( not ( = ?auto_676040 ?auto_676041 ) ) ( not ( = ?auto_676040 ?auto_676042 ) ) ( not ( = ?auto_676040 ?auto_676043 ) ) ( not ( = ?auto_676040 ?auto_676044 ) ) ( not ( = ?auto_676040 ?auto_676045 ) ) ( not ( = ?auto_676040 ?auto_676046 ) ) ( not ( = ?auto_676040 ?auto_676047 ) ) ( not ( = ?auto_676040 ?auto_676048 ) ) ( not ( = ?auto_676041 ?auto_676042 ) ) ( not ( = ?auto_676041 ?auto_676043 ) ) ( not ( = ?auto_676041 ?auto_676044 ) ) ( not ( = ?auto_676041 ?auto_676045 ) ) ( not ( = ?auto_676041 ?auto_676046 ) ) ( not ( = ?auto_676041 ?auto_676047 ) ) ( not ( = ?auto_676041 ?auto_676048 ) ) ( not ( = ?auto_676042 ?auto_676043 ) ) ( not ( = ?auto_676042 ?auto_676044 ) ) ( not ( = ?auto_676042 ?auto_676045 ) ) ( not ( = ?auto_676042 ?auto_676046 ) ) ( not ( = ?auto_676042 ?auto_676047 ) ) ( not ( = ?auto_676042 ?auto_676048 ) ) ( not ( = ?auto_676043 ?auto_676044 ) ) ( not ( = ?auto_676043 ?auto_676045 ) ) ( not ( = ?auto_676043 ?auto_676046 ) ) ( not ( = ?auto_676043 ?auto_676047 ) ) ( not ( = ?auto_676043 ?auto_676048 ) ) ( not ( = ?auto_676044 ?auto_676045 ) ) ( not ( = ?auto_676044 ?auto_676046 ) ) ( not ( = ?auto_676044 ?auto_676047 ) ) ( not ( = ?auto_676044 ?auto_676048 ) ) ( not ( = ?auto_676045 ?auto_676046 ) ) ( not ( = ?auto_676045 ?auto_676047 ) ) ( not ( = ?auto_676045 ?auto_676048 ) ) ( not ( = ?auto_676046 ?auto_676047 ) ) ( not ( = ?auto_676046 ?auto_676048 ) ) ( not ( = ?auto_676047 ?auto_676048 ) ) ( CLEAR ?auto_676045 ) ( ON ?auto_676046 ?auto_676047 ) ( CLEAR ?auto_676046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_676034 ?auto_676035 ?auto_676036 ?auto_676037 ?auto_676038 ?auto_676039 ?auto_676040 ?auto_676041 ?auto_676042 ?auto_676043 ?auto_676044 ?auto_676045 ?auto_676046 )
      ( MAKE-14PILE ?auto_676034 ?auto_676035 ?auto_676036 ?auto_676037 ?auto_676038 ?auto_676039 ?auto_676040 ?auto_676041 ?auto_676042 ?auto_676043 ?auto_676044 ?auto_676045 ?auto_676046 ?auto_676047 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676092 - BLOCK
      ?auto_676093 - BLOCK
      ?auto_676094 - BLOCK
      ?auto_676095 - BLOCK
      ?auto_676096 - BLOCK
      ?auto_676097 - BLOCK
      ?auto_676098 - BLOCK
      ?auto_676099 - BLOCK
      ?auto_676100 - BLOCK
      ?auto_676101 - BLOCK
      ?auto_676102 - BLOCK
      ?auto_676103 - BLOCK
      ?auto_676104 - BLOCK
      ?auto_676105 - BLOCK
    )
    :vars
    (
      ?auto_676106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676105 ?auto_676106 ) ( ON-TABLE ?auto_676092 ) ( ON ?auto_676093 ?auto_676092 ) ( ON ?auto_676094 ?auto_676093 ) ( ON ?auto_676095 ?auto_676094 ) ( ON ?auto_676096 ?auto_676095 ) ( ON ?auto_676097 ?auto_676096 ) ( ON ?auto_676098 ?auto_676097 ) ( ON ?auto_676099 ?auto_676098 ) ( ON ?auto_676100 ?auto_676099 ) ( ON ?auto_676101 ?auto_676100 ) ( ON ?auto_676102 ?auto_676101 ) ( not ( = ?auto_676092 ?auto_676093 ) ) ( not ( = ?auto_676092 ?auto_676094 ) ) ( not ( = ?auto_676092 ?auto_676095 ) ) ( not ( = ?auto_676092 ?auto_676096 ) ) ( not ( = ?auto_676092 ?auto_676097 ) ) ( not ( = ?auto_676092 ?auto_676098 ) ) ( not ( = ?auto_676092 ?auto_676099 ) ) ( not ( = ?auto_676092 ?auto_676100 ) ) ( not ( = ?auto_676092 ?auto_676101 ) ) ( not ( = ?auto_676092 ?auto_676102 ) ) ( not ( = ?auto_676092 ?auto_676103 ) ) ( not ( = ?auto_676092 ?auto_676104 ) ) ( not ( = ?auto_676092 ?auto_676105 ) ) ( not ( = ?auto_676092 ?auto_676106 ) ) ( not ( = ?auto_676093 ?auto_676094 ) ) ( not ( = ?auto_676093 ?auto_676095 ) ) ( not ( = ?auto_676093 ?auto_676096 ) ) ( not ( = ?auto_676093 ?auto_676097 ) ) ( not ( = ?auto_676093 ?auto_676098 ) ) ( not ( = ?auto_676093 ?auto_676099 ) ) ( not ( = ?auto_676093 ?auto_676100 ) ) ( not ( = ?auto_676093 ?auto_676101 ) ) ( not ( = ?auto_676093 ?auto_676102 ) ) ( not ( = ?auto_676093 ?auto_676103 ) ) ( not ( = ?auto_676093 ?auto_676104 ) ) ( not ( = ?auto_676093 ?auto_676105 ) ) ( not ( = ?auto_676093 ?auto_676106 ) ) ( not ( = ?auto_676094 ?auto_676095 ) ) ( not ( = ?auto_676094 ?auto_676096 ) ) ( not ( = ?auto_676094 ?auto_676097 ) ) ( not ( = ?auto_676094 ?auto_676098 ) ) ( not ( = ?auto_676094 ?auto_676099 ) ) ( not ( = ?auto_676094 ?auto_676100 ) ) ( not ( = ?auto_676094 ?auto_676101 ) ) ( not ( = ?auto_676094 ?auto_676102 ) ) ( not ( = ?auto_676094 ?auto_676103 ) ) ( not ( = ?auto_676094 ?auto_676104 ) ) ( not ( = ?auto_676094 ?auto_676105 ) ) ( not ( = ?auto_676094 ?auto_676106 ) ) ( not ( = ?auto_676095 ?auto_676096 ) ) ( not ( = ?auto_676095 ?auto_676097 ) ) ( not ( = ?auto_676095 ?auto_676098 ) ) ( not ( = ?auto_676095 ?auto_676099 ) ) ( not ( = ?auto_676095 ?auto_676100 ) ) ( not ( = ?auto_676095 ?auto_676101 ) ) ( not ( = ?auto_676095 ?auto_676102 ) ) ( not ( = ?auto_676095 ?auto_676103 ) ) ( not ( = ?auto_676095 ?auto_676104 ) ) ( not ( = ?auto_676095 ?auto_676105 ) ) ( not ( = ?auto_676095 ?auto_676106 ) ) ( not ( = ?auto_676096 ?auto_676097 ) ) ( not ( = ?auto_676096 ?auto_676098 ) ) ( not ( = ?auto_676096 ?auto_676099 ) ) ( not ( = ?auto_676096 ?auto_676100 ) ) ( not ( = ?auto_676096 ?auto_676101 ) ) ( not ( = ?auto_676096 ?auto_676102 ) ) ( not ( = ?auto_676096 ?auto_676103 ) ) ( not ( = ?auto_676096 ?auto_676104 ) ) ( not ( = ?auto_676096 ?auto_676105 ) ) ( not ( = ?auto_676096 ?auto_676106 ) ) ( not ( = ?auto_676097 ?auto_676098 ) ) ( not ( = ?auto_676097 ?auto_676099 ) ) ( not ( = ?auto_676097 ?auto_676100 ) ) ( not ( = ?auto_676097 ?auto_676101 ) ) ( not ( = ?auto_676097 ?auto_676102 ) ) ( not ( = ?auto_676097 ?auto_676103 ) ) ( not ( = ?auto_676097 ?auto_676104 ) ) ( not ( = ?auto_676097 ?auto_676105 ) ) ( not ( = ?auto_676097 ?auto_676106 ) ) ( not ( = ?auto_676098 ?auto_676099 ) ) ( not ( = ?auto_676098 ?auto_676100 ) ) ( not ( = ?auto_676098 ?auto_676101 ) ) ( not ( = ?auto_676098 ?auto_676102 ) ) ( not ( = ?auto_676098 ?auto_676103 ) ) ( not ( = ?auto_676098 ?auto_676104 ) ) ( not ( = ?auto_676098 ?auto_676105 ) ) ( not ( = ?auto_676098 ?auto_676106 ) ) ( not ( = ?auto_676099 ?auto_676100 ) ) ( not ( = ?auto_676099 ?auto_676101 ) ) ( not ( = ?auto_676099 ?auto_676102 ) ) ( not ( = ?auto_676099 ?auto_676103 ) ) ( not ( = ?auto_676099 ?auto_676104 ) ) ( not ( = ?auto_676099 ?auto_676105 ) ) ( not ( = ?auto_676099 ?auto_676106 ) ) ( not ( = ?auto_676100 ?auto_676101 ) ) ( not ( = ?auto_676100 ?auto_676102 ) ) ( not ( = ?auto_676100 ?auto_676103 ) ) ( not ( = ?auto_676100 ?auto_676104 ) ) ( not ( = ?auto_676100 ?auto_676105 ) ) ( not ( = ?auto_676100 ?auto_676106 ) ) ( not ( = ?auto_676101 ?auto_676102 ) ) ( not ( = ?auto_676101 ?auto_676103 ) ) ( not ( = ?auto_676101 ?auto_676104 ) ) ( not ( = ?auto_676101 ?auto_676105 ) ) ( not ( = ?auto_676101 ?auto_676106 ) ) ( not ( = ?auto_676102 ?auto_676103 ) ) ( not ( = ?auto_676102 ?auto_676104 ) ) ( not ( = ?auto_676102 ?auto_676105 ) ) ( not ( = ?auto_676102 ?auto_676106 ) ) ( not ( = ?auto_676103 ?auto_676104 ) ) ( not ( = ?auto_676103 ?auto_676105 ) ) ( not ( = ?auto_676103 ?auto_676106 ) ) ( not ( = ?auto_676104 ?auto_676105 ) ) ( not ( = ?auto_676104 ?auto_676106 ) ) ( not ( = ?auto_676105 ?auto_676106 ) ) ( ON ?auto_676104 ?auto_676105 ) ( CLEAR ?auto_676102 ) ( ON ?auto_676103 ?auto_676104 ) ( CLEAR ?auto_676103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_676092 ?auto_676093 ?auto_676094 ?auto_676095 ?auto_676096 ?auto_676097 ?auto_676098 ?auto_676099 ?auto_676100 ?auto_676101 ?auto_676102 ?auto_676103 )
      ( MAKE-14PILE ?auto_676092 ?auto_676093 ?auto_676094 ?auto_676095 ?auto_676096 ?auto_676097 ?auto_676098 ?auto_676099 ?auto_676100 ?auto_676101 ?auto_676102 ?auto_676103 ?auto_676104 ?auto_676105 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676150 - BLOCK
      ?auto_676151 - BLOCK
      ?auto_676152 - BLOCK
      ?auto_676153 - BLOCK
      ?auto_676154 - BLOCK
      ?auto_676155 - BLOCK
      ?auto_676156 - BLOCK
      ?auto_676157 - BLOCK
      ?auto_676158 - BLOCK
      ?auto_676159 - BLOCK
      ?auto_676160 - BLOCK
      ?auto_676161 - BLOCK
      ?auto_676162 - BLOCK
      ?auto_676163 - BLOCK
    )
    :vars
    (
      ?auto_676164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676163 ?auto_676164 ) ( ON-TABLE ?auto_676150 ) ( ON ?auto_676151 ?auto_676150 ) ( ON ?auto_676152 ?auto_676151 ) ( ON ?auto_676153 ?auto_676152 ) ( ON ?auto_676154 ?auto_676153 ) ( ON ?auto_676155 ?auto_676154 ) ( ON ?auto_676156 ?auto_676155 ) ( ON ?auto_676157 ?auto_676156 ) ( ON ?auto_676158 ?auto_676157 ) ( ON ?auto_676159 ?auto_676158 ) ( not ( = ?auto_676150 ?auto_676151 ) ) ( not ( = ?auto_676150 ?auto_676152 ) ) ( not ( = ?auto_676150 ?auto_676153 ) ) ( not ( = ?auto_676150 ?auto_676154 ) ) ( not ( = ?auto_676150 ?auto_676155 ) ) ( not ( = ?auto_676150 ?auto_676156 ) ) ( not ( = ?auto_676150 ?auto_676157 ) ) ( not ( = ?auto_676150 ?auto_676158 ) ) ( not ( = ?auto_676150 ?auto_676159 ) ) ( not ( = ?auto_676150 ?auto_676160 ) ) ( not ( = ?auto_676150 ?auto_676161 ) ) ( not ( = ?auto_676150 ?auto_676162 ) ) ( not ( = ?auto_676150 ?auto_676163 ) ) ( not ( = ?auto_676150 ?auto_676164 ) ) ( not ( = ?auto_676151 ?auto_676152 ) ) ( not ( = ?auto_676151 ?auto_676153 ) ) ( not ( = ?auto_676151 ?auto_676154 ) ) ( not ( = ?auto_676151 ?auto_676155 ) ) ( not ( = ?auto_676151 ?auto_676156 ) ) ( not ( = ?auto_676151 ?auto_676157 ) ) ( not ( = ?auto_676151 ?auto_676158 ) ) ( not ( = ?auto_676151 ?auto_676159 ) ) ( not ( = ?auto_676151 ?auto_676160 ) ) ( not ( = ?auto_676151 ?auto_676161 ) ) ( not ( = ?auto_676151 ?auto_676162 ) ) ( not ( = ?auto_676151 ?auto_676163 ) ) ( not ( = ?auto_676151 ?auto_676164 ) ) ( not ( = ?auto_676152 ?auto_676153 ) ) ( not ( = ?auto_676152 ?auto_676154 ) ) ( not ( = ?auto_676152 ?auto_676155 ) ) ( not ( = ?auto_676152 ?auto_676156 ) ) ( not ( = ?auto_676152 ?auto_676157 ) ) ( not ( = ?auto_676152 ?auto_676158 ) ) ( not ( = ?auto_676152 ?auto_676159 ) ) ( not ( = ?auto_676152 ?auto_676160 ) ) ( not ( = ?auto_676152 ?auto_676161 ) ) ( not ( = ?auto_676152 ?auto_676162 ) ) ( not ( = ?auto_676152 ?auto_676163 ) ) ( not ( = ?auto_676152 ?auto_676164 ) ) ( not ( = ?auto_676153 ?auto_676154 ) ) ( not ( = ?auto_676153 ?auto_676155 ) ) ( not ( = ?auto_676153 ?auto_676156 ) ) ( not ( = ?auto_676153 ?auto_676157 ) ) ( not ( = ?auto_676153 ?auto_676158 ) ) ( not ( = ?auto_676153 ?auto_676159 ) ) ( not ( = ?auto_676153 ?auto_676160 ) ) ( not ( = ?auto_676153 ?auto_676161 ) ) ( not ( = ?auto_676153 ?auto_676162 ) ) ( not ( = ?auto_676153 ?auto_676163 ) ) ( not ( = ?auto_676153 ?auto_676164 ) ) ( not ( = ?auto_676154 ?auto_676155 ) ) ( not ( = ?auto_676154 ?auto_676156 ) ) ( not ( = ?auto_676154 ?auto_676157 ) ) ( not ( = ?auto_676154 ?auto_676158 ) ) ( not ( = ?auto_676154 ?auto_676159 ) ) ( not ( = ?auto_676154 ?auto_676160 ) ) ( not ( = ?auto_676154 ?auto_676161 ) ) ( not ( = ?auto_676154 ?auto_676162 ) ) ( not ( = ?auto_676154 ?auto_676163 ) ) ( not ( = ?auto_676154 ?auto_676164 ) ) ( not ( = ?auto_676155 ?auto_676156 ) ) ( not ( = ?auto_676155 ?auto_676157 ) ) ( not ( = ?auto_676155 ?auto_676158 ) ) ( not ( = ?auto_676155 ?auto_676159 ) ) ( not ( = ?auto_676155 ?auto_676160 ) ) ( not ( = ?auto_676155 ?auto_676161 ) ) ( not ( = ?auto_676155 ?auto_676162 ) ) ( not ( = ?auto_676155 ?auto_676163 ) ) ( not ( = ?auto_676155 ?auto_676164 ) ) ( not ( = ?auto_676156 ?auto_676157 ) ) ( not ( = ?auto_676156 ?auto_676158 ) ) ( not ( = ?auto_676156 ?auto_676159 ) ) ( not ( = ?auto_676156 ?auto_676160 ) ) ( not ( = ?auto_676156 ?auto_676161 ) ) ( not ( = ?auto_676156 ?auto_676162 ) ) ( not ( = ?auto_676156 ?auto_676163 ) ) ( not ( = ?auto_676156 ?auto_676164 ) ) ( not ( = ?auto_676157 ?auto_676158 ) ) ( not ( = ?auto_676157 ?auto_676159 ) ) ( not ( = ?auto_676157 ?auto_676160 ) ) ( not ( = ?auto_676157 ?auto_676161 ) ) ( not ( = ?auto_676157 ?auto_676162 ) ) ( not ( = ?auto_676157 ?auto_676163 ) ) ( not ( = ?auto_676157 ?auto_676164 ) ) ( not ( = ?auto_676158 ?auto_676159 ) ) ( not ( = ?auto_676158 ?auto_676160 ) ) ( not ( = ?auto_676158 ?auto_676161 ) ) ( not ( = ?auto_676158 ?auto_676162 ) ) ( not ( = ?auto_676158 ?auto_676163 ) ) ( not ( = ?auto_676158 ?auto_676164 ) ) ( not ( = ?auto_676159 ?auto_676160 ) ) ( not ( = ?auto_676159 ?auto_676161 ) ) ( not ( = ?auto_676159 ?auto_676162 ) ) ( not ( = ?auto_676159 ?auto_676163 ) ) ( not ( = ?auto_676159 ?auto_676164 ) ) ( not ( = ?auto_676160 ?auto_676161 ) ) ( not ( = ?auto_676160 ?auto_676162 ) ) ( not ( = ?auto_676160 ?auto_676163 ) ) ( not ( = ?auto_676160 ?auto_676164 ) ) ( not ( = ?auto_676161 ?auto_676162 ) ) ( not ( = ?auto_676161 ?auto_676163 ) ) ( not ( = ?auto_676161 ?auto_676164 ) ) ( not ( = ?auto_676162 ?auto_676163 ) ) ( not ( = ?auto_676162 ?auto_676164 ) ) ( not ( = ?auto_676163 ?auto_676164 ) ) ( ON ?auto_676162 ?auto_676163 ) ( ON ?auto_676161 ?auto_676162 ) ( CLEAR ?auto_676159 ) ( ON ?auto_676160 ?auto_676161 ) ( CLEAR ?auto_676160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_676150 ?auto_676151 ?auto_676152 ?auto_676153 ?auto_676154 ?auto_676155 ?auto_676156 ?auto_676157 ?auto_676158 ?auto_676159 ?auto_676160 )
      ( MAKE-14PILE ?auto_676150 ?auto_676151 ?auto_676152 ?auto_676153 ?auto_676154 ?auto_676155 ?auto_676156 ?auto_676157 ?auto_676158 ?auto_676159 ?auto_676160 ?auto_676161 ?auto_676162 ?auto_676163 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676208 - BLOCK
      ?auto_676209 - BLOCK
      ?auto_676210 - BLOCK
      ?auto_676211 - BLOCK
      ?auto_676212 - BLOCK
      ?auto_676213 - BLOCK
      ?auto_676214 - BLOCK
      ?auto_676215 - BLOCK
      ?auto_676216 - BLOCK
      ?auto_676217 - BLOCK
      ?auto_676218 - BLOCK
      ?auto_676219 - BLOCK
      ?auto_676220 - BLOCK
      ?auto_676221 - BLOCK
    )
    :vars
    (
      ?auto_676222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676221 ?auto_676222 ) ( ON-TABLE ?auto_676208 ) ( ON ?auto_676209 ?auto_676208 ) ( ON ?auto_676210 ?auto_676209 ) ( ON ?auto_676211 ?auto_676210 ) ( ON ?auto_676212 ?auto_676211 ) ( ON ?auto_676213 ?auto_676212 ) ( ON ?auto_676214 ?auto_676213 ) ( ON ?auto_676215 ?auto_676214 ) ( ON ?auto_676216 ?auto_676215 ) ( not ( = ?auto_676208 ?auto_676209 ) ) ( not ( = ?auto_676208 ?auto_676210 ) ) ( not ( = ?auto_676208 ?auto_676211 ) ) ( not ( = ?auto_676208 ?auto_676212 ) ) ( not ( = ?auto_676208 ?auto_676213 ) ) ( not ( = ?auto_676208 ?auto_676214 ) ) ( not ( = ?auto_676208 ?auto_676215 ) ) ( not ( = ?auto_676208 ?auto_676216 ) ) ( not ( = ?auto_676208 ?auto_676217 ) ) ( not ( = ?auto_676208 ?auto_676218 ) ) ( not ( = ?auto_676208 ?auto_676219 ) ) ( not ( = ?auto_676208 ?auto_676220 ) ) ( not ( = ?auto_676208 ?auto_676221 ) ) ( not ( = ?auto_676208 ?auto_676222 ) ) ( not ( = ?auto_676209 ?auto_676210 ) ) ( not ( = ?auto_676209 ?auto_676211 ) ) ( not ( = ?auto_676209 ?auto_676212 ) ) ( not ( = ?auto_676209 ?auto_676213 ) ) ( not ( = ?auto_676209 ?auto_676214 ) ) ( not ( = ?auto_676209 ?auto_676215 ) ) ( not ( = ?auto_676209 ?auto_676216 ) ) ( not ( = ?auto_676209 ?auto_676217 ) ) ( not ( = ?auto_676209 ?auto_676218 ) ) ( not ( = ?auto_676209 ?auto_676219 ) ) ( not ( = ?auto_676209 ?auto_676220 ) ) ( not ( = ?auto_676209 ?auto_676221 ) ) ( not ( = ?auto_676209 ?auto_676222 ) ) ( not ( = ?auto_676210 ?auto_676211 ) ) ( not ( = ?auto_676210 ?auto_676212 ) ) ( not ( = ?auto_676210 ?auto_676213 ) ) ( not ( = ?auto_676210 ?auto_676214 ) ) ( not ( = ?auto_676210 ?auto_676215 ) ) ( not ( = ?auto_676210 ?auto_676216 ) ) ( not ( = ?auto_676210 ?auto_676217 ) ) ( not ( = ?auto_676210 ?auto_676218 ) ) ( not ( = ?auto_676210 ?auto_676219 ) ) ( not ( = ?auto_676210 ?auto_676220 ) ) ( not ( = ?auto_676210 ?auto_676221 ) ) ( not ( = ?auto_676210 ?auto_676222 ) ) ( not ( = ?auto_676211 ?auto_676212 ) ) ( not ( = ?auto_676211 ?auto_676213 ) ) ( not ( = ?auto_676211 ?auto_676214 ) ) ( not ( = ?auto_676211 ?auto_676215 ) ) ( not ( = ?auto_676211 ?auto_676216 ) ) ( not ( = ?auto_676211 ?auto_676217 ) ) ( not ( = ?auto_676211 ?auto_676218 ) ) ( not ( = ?auto_676211 ?auto_676219 ) ) ( not ( = ?auto_676211 ?auto_676220 ) ) ( not ( = ?auto_676211 ?auto_676221 ) ) ( not ( = ?auto_676211 ?auto_676222 ) ) ( not ( = ?auto_676212 ?auto_676213 ) ) ( not ( = ?auto_676212 ?auto_676214 ) ) ( not ( = ?auto_676212 ?auto_676215 ) ) ( not ( = ?auto_676212 ?auto_676216 ) ) ( not ( = ?auto_676212 ?auto_676217 ) ) ( not ( = ?auto_676212 ?auto_676218 ) ) ( not ( = ?auto_676212 ?auto_676219 ) ) ( not ( = ?auto_676212 ?auto_676220 ) ) ( not ( = ?auto_676212 ?auto_676221 ) ) ( not ( = ?auto_676212 ?auto_676222 ) ) ( not ( = ?auto_676213 ?auto_676214 ) ) ( not ( = ?auto_676213 ?auto_676215 ) ) ( not ( = ?auto_676213 ?auto_676216 ) ) ( not ( = ?auto_676213 ?auto_676217 ) ) ( not ( = ?auto_676213 ?auto_676218 ) ) ( not ( = ?auto_676213 ?auto_676219 ) ) ( not ( = ?auto_676213 ?auto_676220 ) ) ( not ( = ?auto_676213 ?auto_676221 ) ) ( not ( = ?auto_676213 ?auto_676222 ) ) ( not ( = ?auto_676214 ?auto_676215 ) ) ( not ( = ?auto_676214 ?auto_676216 ) ) ( not ( = ?auto_676214 ?auto_676217 ) ) ( not ( = ?auto_676214 ?auto_676218 ) ) ( not ( = ?auto_676214 ?auto_676219 ) ) ( not ( = ?auto_676214 ?auto_676220 ) ) ( not ( = ?auto_676214 ?auto_676221 ) ) ( not ( = ?auto_676214 ?auto_676222 ) ) ( not ( = ?auto_676215 ?auto_676216 ) ) ( not ( = ?auto_676215 ?auto_676217 ) ) ( not ( = ?auto_676215 ?auto_676218 ) ) ( not ( = ?auto_676215 ?auto_676219 ) ) ( not ( = ?auto_676215 ?auto_676220 ) ) ( not ( = ?auto_676215 ?auto_676221 ) ) ( not ( = ?auto_676215 ?auto_676222 ) ) ( not ( = ?auto_676216 ?auto_676217 ) ) ( not ( = ?auto_676216 ?auto_676218 ) ) ( not ( = ?auto_676216 ?auto_676219 ) ) ( not ( = ?auto_676216 ?auto_676220 ) ) ( not ( = ?auto_676216 ?auto_676221 ) ) ( not ( = ?auto_676216 ?auto_676222 ) ) ( not ( = ?auto_676217 ?auto_676218 ) ) ( not ( = ?auto_676217 ?auto_676219 ) ) ( not ( = ?auto_676217 ?auto_676220 ) ) ( not ( = ?auto_676217 ?auto_676221 ) ) ( not ( = ?auto_676217 ?auto_676222 ) ) ( not ( = ?auto_676218 ?auto_676219 ) ) ( not ( = ?auto_676218 ?auto_676220 ) ) ( not ( = ?auto_676218 ?auto_676221 ) ) ( not ( = ?auto_676218 ?auto_676222 ) ) ( not ( = ?auto_676219 ?auto_676220 ) ) ( not ( = ?auto_676219 ?auto_676221 ) ) ( not ( = ?auto_676219 ?auto_676222 ) ) ( not ( = ?auto_676220 ?auto_676221 ) ) ( not ( = ?auto_676220 ?auto_676222 ) ) ( not ( = ?auto_676221 ?auto_676222 ) ) ( ON ?auto_676220 ?auto_676221 ) ( ON ?auto_676219 ?auto_676220 ) ( ON ?auto_676218 ?auto_676219 ) ( CLEAR ?auto_676216 ) ( ON ?auto_676217 ?auto_676218 ) ( CLEAR ?auto_676217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_676208 ?auto_676209 ?auto_676210 ?auto_676211 ?auto_676212 ?auto_676213 ?auto_676214 ?auto_676215 ?auto_676216 ?auto_676217 )
      ( MAKE-14PILE ?auto_676208 ?auto_676209 ?auto_676210 ?auto_676211 ?auto_676212 ?auto_676213 ?auto_676214 ?auto_676215 ?auto_676216 ?auto_676217 ?auto_676218 ?auto_676219 ?auto_676220 ?auto_676221 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676266 - BLOCK
      ?auto_676267 - BLOCK
      ?auto_676268 - BLOCK
      ?auto_676269 - BLOCK
      ?auto_676270 - BLOCK
      ?auto_676271 - BLOCK
      ?auto_676272 - BLOCK
      ?auto_676273 - BLOCK
      ?auto_676274 - BLOCK
      ?auto_676275 - BLOCK
      ?auto_676276 - BLOCK
      ?auto_676277 - BLOCK
      ?auto_676278 - BLOCK
      ?auto_676279 - BLOCK
    )
    :vars
    (
      ?auto_676280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676279 ?auto_676280 ) ( ON-TABLE ?auto_676266 ) ( ON ?auto_676267 ?auto_676266 ) ( ON ?auto_676268 ?auto_676267 ) ( ON ?auto_676269 ?auto_676268 ) ( ON ?auto_676270 ?auto_676269 ) ( ON ?auto_676271 ?auto_676270 ) ( ON ?auto_676272 ?auto_676271 ) ( ON ?auto_676273 ?auto_676272 ) ( not ( = ?auto_676266 ?auto_676267 ) ) ( not ( = ?auto_676266 ?auto_676268 ) ) ( not ( = ?auto_676266 ?auto_676269 ) ) ( not ( = ?auto_676266 ?auto_676270 ) ) ( not ( = ?auto_676266 ?auto_676271 ) ) ( not ( = ?auto_676266 ?auto_676272 ) ) ( not ( = ?auto_676266 ?auto_676273 ) ) ( not ( = ?auto_676266 ?auto_676274 ) ) ( not ( = ?auto_676266 ?auto_676275 ) ) ( not ( = ?auto_676266 ?auto_676276 ) ) ( not ( = ?auto_676266 ?auto_676277 ) ) ( not ( = ?auto_676266 ?auto_676278 ) ) ( not ( = ?auto_676266 ?auto_676279 ) ) ( not ( = ?auto_676266 ?auto_676280 ) ) ( not ( = ?auto_676267 ?auto_676268 ) ) ( not ( = ?auto_676267 ?auto_676269 ) ) ( not ( = ?auto_676267 ?auto_676270 ) ) ( not ( = ?auto_676267 ?auto_676271 ) ) ( not ( = ?auto_676267 ?auto_676272 ) ) ( not ( = ?auto_676267 ?auto_676273 ) ) ( not ( = ?auto_676267 ?auto_676274 ) ) ( not ( = ?auto_676267 ?auto_676275 ) ) ( not ( = ?auto_676267 ?auto_676276 ) ) ( not ( = ?auto_676267 ?auto_676277 ) ) ( not ( = ?auto_676267 ?auto_676278 ) ) ( not ( = ?auto_676267 ?auto_676279 ) ) ( not ( = ?auto_676267 ?auto_676280 ) ) ( not ( = ?auto_676268 ?auto_676269 ) ) ( not ( = ?auto_676268 ?auto_676270 ) ) ( not ( = ?auto_676268 ?auto_676271 ) ) ( not ( = ?auto_676268 ?auto_676272 ) ) ( not ( = ?auto_676268 ?auto_676273 ) ) ( not ( = ?auto_676268 ?auto_676274 ) ) ( not ( = ?auto_676268 ?auto_676275 ) ) ( not ( = ?auto_676268 ?auto_676276 ) ) ( not ( = ?auto_676268 ?auto_676277 ) ) ( not ( = ?auto_676268 ?auto_676278 ) ) ( not ( = ?auto_676268 ?auto_676279 ) ) ( not ( = ?auto_676268 ?auto_676280 ) ) ( not ( = ?auto_676269 ?auto_676270 ) ) ( not ( = ?auto_676269 ?auto_676271 ) ) ( not ( = ?auto_676269 ?auto_676272 ) ) ( not ( = ?auto_676269 ?auto_676273 ) ) ( not ( = ?auto_676269 ?auto_676274 ) ) ( not ( = ?auto_676269 ?auto_676275 ) ) ( not ( = ?auto_676269 ?auto_676276 ) ) ( not ( = ?auto_676269 ?auto_676277 ) ) ( not ( = ?auto_676269 ?auto_676278 ) ) ( not ( = ?auto_676269 ?auto_676279 ) ) ( not ( = ?auto_676269 ?auto_676280 ) ) ( not ( = ?auto_676270 ?auto_676271 ) ) ( not ( = ?auto_676270 ?auto_676272 ) ) ( not ( = ?auto_676270 ?auto_676273 ) ) ( not ( = ?auto_676270 ?auto_676274 ) ) ( not ( = ?auto_676270 ?auto_676275 ) ) ( not ( = ?auto_676270 ?auto_676276 ) ) ( not ( = ?auto_676270 ?auto_676277 ) ) ( not ( = ?auto_676270 ?auto_676278 ) ) ( not ( = ?auto_676270 ?auto_676279 ) ) ( not ( = ?auto_676270 ?auto_676280 ) ) ( not ( = ?auto_676271 ?auto_676272 ) ) ( not ( = ?auto_676271 ?auto_676273 ) ) ( not ( = ?auto_676271 ?auto_676274 ) ) ( not ( = ?auto_676271 ?auto_676275 ) ) ( not ( = ?auto_676271 ?auto_676276 ) ) ( not ( = ?auto_676271 ?auto_676277 ) ) ( not ( = ?auto_676271 ?auto_676278 ) ) ( not ( = ?auto_676271 ?auto_676279 ) ) ( not ( = ?auto_676271 ?auto_676280 ) ) ( not ( = ?auto_676272 ?auto_676273 ) ) ( not ( = ?auto_676272 ?auto_676274 ) ) ( not ( = ?auto_676272 ?auto_676275 ) ) ( not ( = ?auto_676272 ?auto_676276 ) ) ( not ( = ?auto_676272 ?auto_676277 ) ) ( not ( = ?auto_676272 ?auto_676278 ) ) ( not ( = ?auto_676272 ?auto_676279 ) ) ( not ( = ?auto_676272 ?auto_676280 ) ) ( not ( = ?auto_676273 ?auto_676274 ) ) ( not ( = ?auto_676273 ?auto_676275 ) ) ( not ( = ?auto_676273 ?auto_676276 ) ) ( not ( = ?auto_676273 ?auto_676277 ) ) ( not ( = ?auto_676273 ?auto_676278 ) ) ( not ( = ?auto_676273 ?auto_676279 ) ) ( not ( = ?auto_676273 ?auto_676280 ) ) ( not ( = ?auto_676274 ?auto_676275 ) ) ( not ( = ?auto_676274 ?auto_676276 ) ) ( not ( = ?auto_676274 ?auto_676277 ) ) ( not ( = ?auto_676274 ?auto_676278 ) ) ( not ( = ?auto_676274 ?auto_676279 ) ) ( not ( = ?auto_676274 ?auto_676280 ) ) ( not ( = ?auto_676275 ?auto_676276 ) ) ( not ( = ?auto_676275 ?auto_676277 ) ) ( not ( = ?auto_676275 ?auto_676278 ) ) ( not ( = ?auto_676275 ?auto_676279 ) ) ( not ( = ?auto_676275 ?auto_676280 ) ) ( not ( = ?auto_676276 ?auto_676277 ) ) ( not ( = ?auto_676276 ?auto_676278 ) ) ( not ( = ?auto_676276 ?auto_676279 ) ) ( not ( = ?auto_676276 ?auto_676280 ) ) ( not ( = ?auto_676277 ?auto_676278 ) ) ( not ( = ?auto_676277 ?auto_676279 ) ) ( not ( = ?auto_676277 ?auto_676280 ) ) ( not ( = ?auto_676278 ?auto_676279 ) ) ( not ( = ?auto_676278 ?auto_676280 ) ) ( not ( = ?auto_676279 ?auto_676280 ) ) ( ON ?auto_676278 ?auto_676279 ) ( ON ?auto_676277 ?auto_676278 ) ( ON ?auto_676276 ?auto_676277 ) ( ON ?auto_676275 ?auto_676276 ) ( CLEAR ?auto_676273 ) ( ON ?auto_676274 ?auto_676275 ) ( CLEAR ?auto_676274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_676266 ?auto_676267 ?auto_676268 ?auto_676269 ?auto_676270 ?auto_676271 ?auto_676272 ?auto_676273 ?auto_676274 )
      ( MAKE-14PILE ?auto_676266 ?auto_676267 ?auto_676268 ?auto_676269 ?auto_676270 ?auto_676271 ?auto_676272 ?auto_676273 ?auto_676274 ?auto_676275 ?auto_676276 ?auto_676277 ?auto_676278 ?auto_676279 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676324 - BLOCK
      ?auto_676325 - BLOCK
      ?auto_676326 - BLOCK
      ?auto_676327 - BLOCK
      ?auto_676328 - BLOCK
      ?auto_676329 - BLOCK
      ?auto_676330 - BLOCK
      ?auto_676331 - BLOCK
      ?auto_676332 - BLOCK
      ?auto_676333 - BLOCK
      ?auto_676334 - BLOCK
      ?auto_676335 - BLOCK
      ?auto_676336 - BLOCK
      ?auto_676337 - BLOCK
    )
    :vars
    (
      ?auto_676338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676337 ?auto_676338 ) ( ON-TABLE ?auto_676324 ) ( ON ?auto_676325 ?auto_676324 ) ( ON ?auto_676326 ?auto_676325 ) ( ON ?auto_676327 ?auto_676326 ) ( ON ?auto_676328 ?auto_676327 ) ( ON ?auto_676329 ?auto_676328 ) ( ON ?auto_676330 ?auto_676329 ) ( not ( = ?auto_676324 ?auto_676325 ) ) ( not ( = ?auto_676324 ?auto_676326 ) ) ( not ( = ?auto_676324 ?auto_676327 ) ) ( not ( = ?auto_676324 ?auto_676328 ) ) ( not ( = ?auto_676324 ?auto_676329 ) ) ( not ( = ?auto_676324 ?auto_676330 ) ) ( not ( = ?auto_676324 ?auto_676331 ) ) ( not ( = ?auto_676324 ?auto_676332 ) ) ( not ( = ?auto_676324 ?auto_676333 ) ) ( not ( = ?auto_676324 ?auto_676334 ) ) ( not ( = ?auto_676324 ?auto_676335 ) ) ( not ( = ?auto_676324 ?auto_676336 ) ) ( not ( = ?auto_676324 ?auto_676337 ) ) ( not ( = ?auto_676324 ?auto_676338 ) ) ( not ( = ?auto_676325 ?auto_676326 ) ) ( not ( = ?auto_676325 ?auto_676327 ) ) ( not ( = ?auto_676325 ?auto_676328 ) ) ( not ( = ?auto_676325 ?auto_676329 ) ) ( not ( = ?auto_676325 ?auto_676330 ) ) ( not ( = ?auto_676325 ?auto_676331 ) ) ( not ( = ?auto_676325 ?auto_676332 ) ) ( not ( = ?auto_676325 ?auto_676333 ) ) ( not ( = ?auto_676325 ?auto_676334 ) ) ( not ( = ?auto_676325 ?auto_676335 ) ) ( not ( = ?auto_676325 ?auto_676336 ) ) ( not ( = ?auto_676325 ?auto_676337 ) ) ( not ( = ?auto_676325 ?auto_676338 ) ) ( not ( = ?auto_676326 ?auto_676327 ) ) ( not ( = ?auto_676326 ?auto_676328 ) ) ( not ( = ?auto_676326 ?auto_676329 ) ) ( not ( = ?auto_676326 ?auto_676330 ) ) ( not ( = ?auto_676326 ?auto_676331 ) ) ( not ( = ?auto_676326 ?auto_676332 ) ) ( not ( = ?auto_676326 ?auto_676333 ) ) ( not ( = ?auto_676326 ?auto_676334 ) ) ( not ( = ?auto_676326 ?auto_676335 ) ) ( not ( = ?auto_676326 ?auto_676336 ) ) ( not ( = ?auto_676326 ?auto_676337 ) ) ( not ( = ?auto_676326 ?auto_676338 ) ) ( not ( = ?auto_676327 ?auto_676328 ) ) ( not ( = ?auto_676327 ?auto_676329 ) ) ( not ( = ?auto_676327 ?auto_676330 ) ) ( not ( = ?auto_676327 ?auto_676331 ) ) ( not ( = ?auto_676327 ?auto_676332 ) ) ( not ( = ?auto_676327 ?auto_676333 ) ) ( not ( = ?auto_676327 ?auto_676334 ) ) ( not ( = ?auto_676327 ?auto_676335 ) ) ( not ( = ?auto_676327 ?auto_676336 ) ) ( not ( = ?auto_676327 ?auto_676337 ) ) ( not ( = ?auto_676327 ?auto_676338 ) ) ( not ( = ?auto_676328 ?auto_676329 ) ) ( not ( = ?auto_676328 ?auto_676330 ) ) ( not ( = ?auto_676328 ?auto_676331 ) ) ( not ( = ?auto_676328 ?auto_676332 ) ) ( not ( = ?auto_676328 ?auto_676333 ) ) ( not ( = ?auto_676328 ?auto_676334 ) ) ( not ( = ?auto_676328 ?auto_676335 ) ) ( not ( = ?auto_676328 ?auto_676336 ) ) ( not ( = ?auto_676328 ?auto_676337 ) ) ( not ( = ?auto_676328 ?auto_676338 ) ) ( not ( = ?auto_676329 ?auto_676330 ) ) ( not ( = ?auto_676329 ?auto_676331 ) ) ( not ( = ?auto_676329 ?auto_676332 ) ) ( not ( = ?auto_676329 ?auto_676333 ) ) ( not ( = ?auto_676329 ?auto_676334 ) ) ( not ( = ?auto_676329 ?auto_676335 ) ) ( not ( = ?auto_676329 ?auto_676336 ) ) ( not ( = ?auto_676329 ?auto_676337 ) ) ( not ( = ?auto_676329 ?auto_676338 ) ) ( not ( = ?auto_676330 ?auto_676331 ) ) ( not ( = ?auto_676330 ?auto_676332 ) ) ( not ( = ?auto_676330 ?auto_676333 ) ) ( not ( = ?auto_676330 ?auto_676334 ) ) ( not ( = ?auto_676330 ?auto_676335 ) ) ( not ( = ?auto_676330 ?auto_676336 ) ) ( not ( = ?auto_676330 ?auto_676337 ) ) ( not ( = ?auto_676330 ?auto_676338 ) ) ( not ( = ?auto_676331 ?auto_676332 ) ) ( not ( = ?auto_676331 ?auto_676333 ) ) ( not ( = ?auto_676331 ?auto_676334 ) ) ( not ( = ?auto_676331 ?auto_676335 ) ) ( not ( = ?auto_676331 ?auto_676336 ) ) ( not ( = ?auto_676331 ?auto_676337 ) ) ( not ( = ?auto_676331 ?auto_676338 ) ) ( not ( = ?auto_676332 ?auto_676333 ) ) ( not ( = ?auto_676332 ?auto_676334 ) ) ( not ( = ?auto_676332 ?auto_676335 ) ) ( not ( = ?auto_676332 ?auto_676336 ) ) ( not ( = ?auto_676332 ?auto_676337 ) ) ( not ( = ?auto_676332 ?auto_676338 ) ) ( not ( = ?auto_676333 ?auto_676334 ) ) ( not ( = ?auto_676333 ?auto_676335 ) ) ( not ( = ?auto_676333 ?auto_676336 ) ) ( not ( = ?auto_676333 ?auto_676337 ) ) ( not ( = ?auto_676333 ?auto_676338 ) ) ( not ( = ?auto_676334 ?auto_676335 ) ) ( not ( = ?auto_676334 ?auto_676336 ) ) ( not ( = ?auto_676334 ?auto_676337 ) ) ( not ( = ?auto_676334 ?auto_676338 ) ) ( not ( = ?auto_676335 ?auto_676336 ) ) ( not ( = ?auto_676335 ?auto_676337 ) ) ( not ( = ?auto_676335 ?auto_676338 ) ) ( not ( = ?auto_676336 ?auto_676337 ) ) ( not ( = ?auto_676336 ?auto_676338 ) ) ( not ( = ?auto_676337 ?auto_676338 ) ) ( ON ?auto_676336 ?auto_676337 ) ( ON ?auto_676335 ?auto_676336 ) ( ON ?auto_676334 ?auto_676335 ) ( ON ?auto_676333 ?auto_676334 ) ( ON ?auto_676332 ?auto_676333 ) ( CLEAR ?auto_676330 ) ( ON ?auto_676331 ?auto_676332 ) ( CLEAR ?auto_676331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_676324 ?auto_676325 ?auto_676326 ?auto_676327 ?auto_676328 ?auto_676329 ?auto_676330 ?auto_676331 )
      ( MAKE-14PILE ?auto_676324 ?auto_676325 ?auto_676326 ?auto_676327 ?auto_676328 ?auto_676329 ?auto_676330 ?auto_676331 ?auto_676332 ?auto_676333 ?auto_676334 ?auto_676335 ?auto_676336 ?auto_676337 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676382 - BLOCK
      ?auto_676383 - BLOCK
      ?auto_676384 - BLOCK
      ?auto_676385 - BLOCK
      ?auto_676386 - BLOCK
      ?auto_676387 - BLOCK
      ?auto_676388 - BLOCK
      ?auto_676389 - BLOCK
      ?auto_676390 - BLOCK
      ?auto_676391 - BLOCK
      ?auto_676392 - BLOCK
      ?auto_676393 - BLOCK
      ?auto_676394 - BLOCK
      ?auto_676395 - BLOCK
    )
    :vars
    (
      ?auto_676396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676395 ?auto_676396 ) ( ON-TABLE ?auto_676382 ) ( ON ?auto_676383 ?auto_676382 ) ( ON ?auto_676384 ?auto_676383 ) ( ON ?auto_676385 ?auto_676384 ) ( ON ?auto_676386 ?auto_676385 ) ( ON ?auto_676387 ?auto_676386 ) ( not ( = ?auto_676382 ?auto_676383 ) ) ( not ( = ?auto_676382 ?auto_676384 ) ) ( not ( = ?auto_676382 ?auto_676385 ) ) ( not ( = ?auto_676382 ?auto_676386 ) ) ( not ( = ?auto_676382 ?auto_676387 ) ) ( not ( = ?auto_676382 ?auto_676388 ) ) ( not ( = ?auto_676382 ?auto_676389 ) ) ( not ( = ?auto_676382 ?auto_676390 ) ) ( not ( = ?auto_676382 ?auto_676391 ) ) ( not ( = ?auto_676382 ?auto_676392 ) ) ( not ( = ?auto_676382 ?auto_676393 ) ) ( not ( = ?auto_676382 ?auto_676394 ) ) ( not ( = ?auto_676382 ?auto_676395 ) ) ( not ( = ?auto_676382 ?auto_676396 ) ) ( not ( = ?auto_676383 ?auto_676384 ) ) ( not ( = ?auto_676383 ?auto_676385 ) ) ( not ( = ?auto_676383 ?auto_676386 ) ) ( not ( = ?auto_676383 ?auto_676387 ) ) ( not ( = ?auto_676383 ?auto_676388 ) ) ( not ( = ?auto_676383 ?auto_676389 ) ) ( not ( = ?auto_676383 ?auto_676390 ) ) ( not ( = ?auto_676383 ?auto_676391 ) ) ( not ( = ?auto_676383 ?auto_676392 ) ) ( not ( = ?auto_676383 ?auto_676393 ) ) ( not ( = ?auto_676383 ?auto_676394 ) ) ( not ( = ?auto_676383 ?auto_676395 ) ) ( not ( = ?auto_676383 ?auto_676396 ) ) ( not ( = ?auto_676384 ?auto_676385 ) ) ( not ( = ?auto_676384 ?auto_676386 ) ) ( not ( = ?auto_676384 ?auto_676387 ) ) ( not ( = ?auto_676384 ?auto_676388 ) ) ( not ( = ?auto_676384 ?auto_676389 ) ) ( not ( = ?auto_676384 ?auto_676390 ) ) ( not ( = ?auto_676384 ?auto_676391 ) ) ( not ( = ?auto_676384 ?auto_676392 ) ) ( not ( = ?auto_676384 ?auto_676393 ) ) ( not ( = ?auto_676384 ?auto_676394 ) ) ( not ( = ?auto_676384 ?auto_676395 ) ) ( not ( = ?auto_676384 ?auto_676396 ) ) ( not ( = ?auto_676385 ?auto_676386 ) ) ( not ( = ?auto_676385 ?auto_676387 ) ) ( not ( = ?auto_676385 ?auto_676388 ) ) ( not ( = ?auto_676385 ?auto_676389 ) ) ( not ( = ?auto_676385 ?auto_676390 ) ) ( not ( = ?auto_676385 ?auto_676391 ) ) ( not ( = ?auto_676385 ?auto_676392 ) ) ( not ( = ?auto_676385 ?auto_676393 ) ) ( not ( = ?auto_676385 ?auto_676394 ) ) ( not ( = ?auto_676385 ?auto_676395 ) ) ( not ( = ?auto_676385 ?auto_676396 ) ) ( not ( = ?auto_676386 ?auto_676387 ) ) ( not ( = ?auto_676386 ?auto_676388 ) ) ( not ( = ?auto_676386 ?auto_676389 ) ) ( not ( = ?auto_676386 ?auto_676390 ) ) ( not ( = ?auto_676386 ?auto_676391 ) ) ( not ( = ?auto_676386 ?auto_676392 ) ) ( not ( = ?auto_676386 ?auto_676393 ) ) ( not ( = ?auto_676386 ?auto_676394 ) ) ( not ( = ?auto_676386 ?auto_676395 ) ) ( not ( = ?auto_676386 ?auto_676396 ) ) ( not ( = ?auto_676387 ?auto_676388 ) ) ( not ( = ?auto_676387 ?auto_676389 ) ) ( not ( = ?auto_676387 ?auto_676390 ) ) ( not ( = ?auto_676387 ?auto_676391 ) ) ( not ( = ?auto_676387 ?auto_676392 ) ) ( not ( = ?auto_676387 ?auto_676393 ) ) ( not ( = ?auto_676387 ?auto_676394 ) ) ( not ( = ?auto_676387 ?auto_676395 ) ) ( not ( = ?auto_676387 ?auto_676396 ) ) ( not ( = ?auto_676388 ?auto_676389 ) ) ( not ( = ?auto_676388 ?auto_676390 ) ) ( not ( = ?auto_676388 ?auto_676391 ) ) ( not ( = ?auto_676388 ?auto_676392 ) ) ( not ( = ?auto_676388 ?auto_676393 ) ) ( not ( = ?auto_676388 ?auto_676394 ) ) ( not ( = ?auto_676388 ?auto_676395 ) ) ( not ( = ?auto_676388 ?auto_676396 ) ) ( not ( = ?auto_676389 ?auto_676390 ) ) ( not ( = ?auto_676389 ?auto_676391 ) ) ( not ( = ?auto_676389 ?auto_676392 ) ) ( not ( = ?auto_676389 ?auto_676393 ) ) ( not ( = ?auto_676389 ?auto_676394 ) ) ( not ( = ?auto_676389 ?auto_676395 ) ) ( not ( = ?auto_676389 ?auto_676396 ) ) ( not ( = ?auto_676390 ?auto_676391 ) ) ( not ( = ?auto_676390 ?auto_676392 ) ) ( not ( = ?auto_676390 ?auto_676393 ) ) ( not ( = ?auto_676390 ?auto_676394 ) ) ( not ( = ?auto_676390 ?auto_676395 ) ) ( not ( = ?auto_676390 ?auto_676396 ) ) ( not ( = ?auto_676391 ?auto_676392 ) ) ( not ( = ?auto_676391 ?auto_676393 ) ) ( not ( = ?auto_676391 ?auto_676394 ) ) ( not ( = ?auto_676391 ?auto_676395 ) ) ( not ( = ?auto_676391 ?auto_676396 ) ) ( not ( = ?auto_676392 ?auto_676393 ) ) ( not ( = ?auto_676392 ?auto_676394 ) ) ( not ( = ?auto_676392 ?auto_676395 ) ) ( not ( = ?auto_676392 ?auto_676396 ) ) ( not ( = ?auto_676393 ?auto_676394 ) ) ( not ( = ?auto_676393 ?auto_676395 ) ) ( not ( = ?auto_676393 ?auto_676396 ) ) ( not ( = ?auto_676394 ?auto_676395 ) ) ( not ( = ?auto_676394 ?auto_676396 ) ) ( not ( = ?auto_676395 ?auto_676396 ) ) ( ON ?auto_676394 ?auto_676395 ) ( ON ?auto_676393 ?auto_676394 ) ( ON ?auto_676392 ?auto_676393 ) ( ON ?auto_676391 ?auto_676392 ) ( ON ?auto_676390 ?auto_676391 ) ( ON ?auto_676389 ?auto_676390 ) ( CLEAR ?auto_676387 ) ( ON ?auto_676388 ?auto_676389 ) ( CLEAR ?auto_676388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_676382 ?auto_676383 ?auto_676384 ?auto_676385 ?auto_676386 ?auto_676387 ?auto_676388 )
      ( MAKE-14PILE ?auto_676382 ?auto_676383 ?auto_676384 ?auto_676385 ?auto_676386 ?auto_676387 ?auto_676388 ?auto_676389 ?auto_676390 ?auto_676391 ?auto_676392 ?auto_676393 ?auto_676394 ?auto_676395 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676440 - BLOCK
      ?auto_676441 - BLOCK
      ?auto_676442 - BLOCK
      ?auto_676443 - BLOCK
      ?auto_676444 - BLOCK
      ?auto_676445 - BLOCK
      ?auto_676446 - BLOCK
      ?auto_676447 - BLOCK
      ?auto_676448 - BLOCK
      ?auto_676449 - BLOCK
      ?auto_676450 - BLOCK
      ?auto_676451 - BLOCK
      ?auto_676452 - BLOCK
      ?auto_676453 - BLOCK
    )
    :vars
    (
      ?auto_676454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676453 ?auto_676454 ) ( ON-TABLE ?auto_676440 ) ( ON ?auto_676441 ?auto_676440 ) ( ON ?auto_676442 ?auto_676441 ) ( ON ?auto_676443 ?auto_676442 ) ( ON ?auto_676444 ?auto_676443 ) ( not ( = ?auto_676440 ?auto_676441 ) ) ( not ( = ?auto_676440 ?auto_676442 ) ) ( not ( = ?auto_676440 ?auto_676443 ) ) ( not ( = ?auto_676440 ?auto_676444 ) ) ( not ( = ?auto_676440 ?auto_676445 ) ) ( not ( = ?auto_676440 ?auto_676446 ) ) ( not ( = ?auto_676440 ?auto_676447 ) ) ( not ( = ?auto_676440 ?auto_676448 ) ) ( not ( = ?auto_676440 ?auto_676449 ) ) ( not ( = ?auto_676440 ?auto_676450 ) ) ( not ( = ?auto_676440 ?auto_676451 ) ) ( not ( = ?auto_676440 ?auto_676452 ) ) ( not ( = ?auto_676440 ?auto_676453 ) ) ( not ( = ?auto_676440 ?auto_676454 ) ) ( not ( = ?auto_676441 ?auto_676442 ) ) ( not ( = ?auto_676441 ?auto_676443 ) ) ( not ( = ?auto_676441 ?auto_676444 ) ) ( not ( = ?auto_676441 ?auto_676445 ) ) ( not ( = ?auto_676441 ?auto_676446 ) ) ( not ( = ?auto_676441 ?auto_676447 ) ) ( not ( = ?auto_676441 ?auto_676448 ) ) ( not ( = ?auto_676441 ?auto_676449 ) ) ( not ( = ?auto_676441 ?auto_676450 ) ) ( not ( = ?auto_676441 ?auto_676451 ) ) ( not ( = ?auto_676441 ?auto_676452 ) ) ( not ( = ?auto_676441 ?auto_676453 ) ) ( not ( = ?auto_676441 ?auto_676454 ) ) ( not ( = ?auto_676442 ?auto_676443 ) ) ( not ( = ?auto_676442 ?auto_676444 ) ) ( not ( = ?auto_676442 ?auto_676445 ) ) ( not ( = ?auto_676442 ?auto_676446 ) ) ( not ( = ?auto_676442 ?auto_676447 ) ) ( not ( = ?auto_676442 ?auto_676448 ) ) ( not ( = ?auto_676442 ?auto_676449 ) ) ( not ( = ?auto_676442 ?auto_676450 ) ) ( not ( = ?auto_676442 ?auto_676451 ) ) ( not ( = ?auto_676442 ?auto_676452 ) ) ( not ( = ?auto_676442 ?auto_676453 ) ) ( not ( = ?auto_676442 ?auto_676454 ) ) ( not ( = ?auto_676443 ?auto_676444 ) ) ( not ( = ?auto_676443 ?auto_676445 ) ) ( not ( = ?auto_676443 ?auto_676446 ) ) ( not ( = ?auto_676443 ?auto_676447 ) ) ( not ( = ?auto_676443 ?auto_676448 ) ) ( not ( = ?auto_676443 ?auto_676449 ) ) ( not ( = ?auto_676443 ?auto_676450 ) ) ( not ( = ?auto_676443 ?auto_676451 ) ) ( not ( = ?auto_676443 ?auto_676452 ) ) ( not ( = ?auto_676443 ?auto_676453 ) ) ( not ( = ?auto_676443 ?auto_676454 ) ) ( not ( = ?auto_676444 ?auto_676445 ) ) ( not ( = ?auto_676444 ?auto_676446 ) ) ( not ( = ?auto_676444 ?auto_676447 ) ) ( not ( = ?auto_676444 ?auto_676448 ) ) ( not ( = ?auto_676444 ?auto_676449 ) ) ( not ( = ?auto_676444 ?auto_676450 ) ) ( not ( = ?auto_676444 ?auto_676451 ) ) ( not ( = ?auto_676444 ?auto_676452 ) ) ( not ( = ?auto_676444 ?auto_676453 ) ) ( not ( = ?auto_676444 ?auto_676454 ) ) ( not ( = ?auto_676445 ?auto_676446 ) ) ( not ( = ?auto_676445 ?auto_676447 ) ) ( not ( = ?auto_676445 ?auto_676448 ) ) ( not ( = ?auto_676445 ?auto_676449 ) ) ( not ( = ?auto_676445 ?auto_676450 ) ) ( not ( = ?auto_676445 ?auto_676451 ) ) ( not ( = ?auto_676445 ?auto_676452 ) ) ( not ( = ?auto_676445 ?auto_676453 ) ) ( not ( = ?auto_676445 ?auto_676454 ) ) ( not ( = ?auto_676446 ?auto_676447 ) ) ( not ( = ?auto_676446 ?auto_676448 ) ) ( not ( = ?auto_676446 ?auto_676449 ) ) ( not ( = ?auto_676446 ?auto_676450 ) ) ( not ( = ?auto_676446 ?auto_676451 ) ) ( not ( = ?auto_676446 ?auto_676452 ) ) ( not ( = ?auto_676446 ?auto_676453 ) ) ( not ( = ?auto_676446 ?auto_676454 ) ) ( not ( = ?auto_676447 ?auto_676448 ) ) ( not ( = ?auto_676447 ?auto_676449 ) ) ( not ( = ?auto_676447 ?auto_676450 ) ) ( not ( = ?auto_676447 ?auto_676451 ) ) ( not ( = ?auto_676447 ?auto_676452 ) ) ( not ( = ?auto_676447 ?auto_676453 ) ) ( not ( = ?auto_676447 ?auto_676454 ) ) ( not ( = ?auto_676448 ?auto_676449 ) ) ( not ( = ?auto_676448 ?auto_676450 ) ) ( not ( = ?auto_676448 ?auto_676451 ) ) ( not ( = ?auto_676448 ?auto_676452 ) ) ( not ( = ?auto_676448 ?auto_676453 ) ) ( not ( = ?auto_676448 ?auto_676454 ) ) ( not ( = ?auto_676449 ?auto_676450 ) ) ( not ( = ?auto_676449 ?auto_676451 ) ) ( not ( = ?auto_676449 ?auto_676452 ) ) ( not ( = ?auto_676449 ?auto_676453 ) ) ( not ( = ?auto_676449 ?auto_676454 ) ) ( not ( = ?auto_676450 ?auto_676451 ) ) ( not ( = ?auto_676450 ?auto_676452 ) ) ( not ( = ?auto_676450 ?auto_676453 ) ) ( not ( = ?auto_676450 ?auto_676454 ) ) ( not ( = ?auto_676451 ?auto_676452 ) ) ( not ( = ?auto_676451 ?auto_676453 ) ) ( not ( = ?auto_676451 ?auto_676454 ) ) ( not ( = ?auto_676452 ?auto_676453 ) ) ( not ( = ?auto_676452 ?auto_676454 ) ) ( not ( = ?auto_676453 ?auto_676454 ) ) ( ON ?auto_676452 ?auto_676453 ) ( ON ?auto_676451 ?auto_676452 ) ( ON ?auto_676450 ?auto_676451 ) ( ON ?auto_676449 ?auto_676450 ) ( ON ?auto_676448 ?auto_676449 ) ( ON ?auto_676447 ?auto_676448 ) ( ON ?auto_676446 ?auto_676447 ) ( CLEAR ?auto_676444 ) ( ON ?auto_676445 ?auto_676446 ) ( CLEAR ?auto_676445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_676440 ?auto_676441 ?auto_676442 ?auto_676443 ?auto_676444 ?auto_676445 )
      ( MAKE-14PILE ?auto_676440 ?auto_676441 ?auto_676442 ?auto_676443 ?auto_676444 ?auto_676445 ?auto_676446 ?auto_676447 ?auto_676448 ?auto_676449 ?auto_676450 ?auto_676451 ?auto_676452 ?auto_676453 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676498 - BLOCK
      ?auto_676499 - BLOCK
      ?auto_676500 - BLOCK
      ?auto_676501 - BLOCK
      ?auto_676502 - BLOCK
      ?auto_676503 - BLOCK
      ?auto_676504 - BLOCK
      ?auto_676505 - BLOCK
      ?auto_676506 - BLOCK
      ?auto_676507 - BLOCK
      ?auto_676508 - BLOCK
      ?auto_676509 - BLOCK
      ?auto_676510 - BLOCK
      ?auto_676511 - BLOCK
    )
    :vars
    (
      ?auto_676512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676511 ?auto_676512 ) ( ON-TABLE ?auto_676498 ) ( ON ?auto_676499 ?auto_676498 ) ( ON ?auto_676500 ?auto_676499 ) ( ON ?auto_676501 ?auto_676500 ) ( not ( = ?auto_676498 ?auto_676499 ) ) ( not ( = ?auto_676498 ?auto_676500 ) ) ( not ( = ?auto_676498 ?auto_676501 ) ) ( not ( = ?auto_676498 ?auto_676502 ) ) ( not ( = ?auto_676498 ?auto_676503 ) ) ( not ( = ?auto_676498 ?auto_676504 ) ) ( not ( = ?auto_676498 ?auto_676505 ) ) ( not ( = ?auto_676498 ?auto_676506 ) ) ( not ( = ?auto_676498 ?auto_676507 ) ) ( not ( = ?auto_676498 ?auto_676508 ) ) ( not ( = ?auto_676498 ?auto_676509 ) ) ( not ( = ?auto_676498 ?auto_676510 ) ) ( not ( = ?auto_676498 ?auto_676511 ) ) ( not ( = ?auto_676498 ?auto_676512 ) ) ( not ( = ?auto_676499 ?auto_676500 ) ) ( not ( = ?auto_676499 ?auto_676501 ) ) ( not ( = ?auto_676499 ?auto_676502 ) ) ( not ( = ?auto_676499 ?auto_676503 ) ) ( not ( = ?auto_676499 ?auto_676504 ) ) ( not ( = ?auto_676499 ?auto_676505 ) ) ( not ( = ?auto_676499 ?auto_676506 ) ) ( not ( = ?auto_676499 ?auto_676507 ) ) ( not ( = ?auto_676499 ?auto_676508 ) ) ( not ( = ?auto_676499 ?auto_676509 ) ) ( not ( = ?auto_676499 ?auto_676510 ) ) ( not ( = ?auto_676499 ?auto_676511 ) ) ( not ( = ?auto_676499 ?auto_676512 ) ) ( not ( = ?auto_676500 ?auto_676501 ) ) ( not ( = ?auto_676500 ?auto_676502 ) ) ( not ( = ?auto_676500 ?auto_676503 ) ) ( not ( = ?auto_676500 ?auto_676504 ) ) ( not ( = ?auto_676500 ?auto_676505 ) ) ( not ( = ?auto_676500 ?auto_676506 ) ) ( not ( = ?auto_676500 ?auto_676507 ) ) ( not ( = ?auto_676500 ?auto_676508 ) ) ( not ( = ?auto_676500 ?auto_676509 ) ) ( not ( = ?auto_676500 ?auto_676510 ) ) ( not ( = ?auto_676500 ?auto_676511 ) ) ( not ( = ?auto_676500 ?auto_676512 ) ) ( not ( = ?auto_676501 ?auto_676502 ) ) ( not ( = ?auto_676501 ?auto_676503 ) ) ( not ( = ?auto_676501 ?auto_676504 ) ) ( not ( = ?auto_676501 ?auto_676505 ) ) ( not ( = ?auto_676501 ?auto_676506 ) ) ( not ( = ?auto_676501 ?auto_676507 ) ) ( not ( = ?auto_676501 ?auto_676508 ) ) ( not ( = ?auto_676501 ?auto_676509 ) ) ( not ( = ?auto_676501 ?auto_676510 ) ) ( not ( = ?auto_676501 ?auto_676511 ) ) ( not ( = ?auto_676501 ?auto_676512 ) ) ( not ( = ?auto_676502 ?auto_676503 ) ) ( not ( = ?auto_676502 ?auto_676504 ) ) ( not ( = ?auto_676502 ?auto_676505 ) ) ( not ( = ?auto_676502 ?auto_676506 ) ) ( not ( = ?auto_676502 ?auto_676507 ) ) ( not ( = ?auto_676502 ?auto_676508 ) ) ( not ( = ?auto_676502 ?auto_676509 ) ) ( not ( = ?auto_676502 ?auto_676510 ) ) ( not ( = ?auto_676502 ?auto_676511 ) ) ( not ( = ?auto_676502 ?auto_676512 ) ) ( not ( = ?auto_676503 ?auto_676504 ) ) ( not ( = ?auto_676503 ?auto_676505 ) ) ( not ( = ?auto_676503 ?auto_676506 ) ) ( not ( = ?auto_676503 ?auto_676507 ) ) ( not ( = ?auto_676503 ?auto_676508 ) ) ( not ( = ?auto_676503 ?auto_676509 ) ) ( not ( = ?auto_676503 ?auto_676510 ) ) ( not ( = ?auto_676503 ?auto_676511 ) ) ( not ( = ?auto_676503 ?auto_676512 ) ) ( not ( = ?auto_676504 ?auto_676505 ) ) ( not ( = ?auto_676504 ?auto_676506 ) ) ( not ( = ?auto_676504 ?auto_676507 ) ) ( not ( = ?auto_676504 ?auto_676508 ) ) ( not ( = ?auto_676504 ?auto_676509 ) ) ( not ( = ?auto_676504 ?auto_676510 ) ) ( not ( = ?auto_676504 ?auto_676511 ) ) ( not ( = ?auto_676504 ?auto_676512 ) ) ( not ( = ?auto_676505 ?auto_676506 ) ) ( not ( = ?auto_676505 ?auto_676507 ) ) ( not ( = ?auto_676505 ?auto_676508 ) ) ( not ( = ?auto_676505 ?auto_676509 ) ) ( not ( = ?auto_676505 ?auto_676510 ) ) ( not ( = ?auto_676505 ?auto_676511 ) ) ( not ( = ?auto_676505 ?auto_676512 ) ) ( not ( = ?auto_676506 ?auto_676507 ) ) ( not ( = ?auto_676506 ?auto_676508 ) ) ( not ( = ?auto_676506 ?auto_676509 ) ) ( not ( = ?auto_676506 ?auto_676510 ) ) ( not ( = ?auto_676506 ?auto_676511 ) ) ( not ( = ?auto_676506 ?auto_676512 ) ) ( not ( = ?auto_676507 ?auto_676508 ) ) ( not ( = ?auto_676507 ?auto_676509 ) ) ( not ( = ?auto_676507 ?auto_676510 ) ) ( not ( = ?auto_676507 ?auto_676511 ) ) ( not ( = ?auto_676507 ?auto_676512 ) ) ( not ( = ?auto_676508 ?auto_676509 ) ) ( not ( = ?auto_676508 ?auto_676510 ) ) ( not ( = ?auto_676508 ?auto_676511 ) ) ( not ( = ?auto_676508 ?auto_676512 ) ) ( not ( = ?auto_676509 ?auto_676510 ) ) ( not ( = ?auto_676509 ?auto_676511 ) ) ( not ( = ?auto_676509 ?auto_676512 ) ) ( not ( = ?auto_676510 ?auto_676511 ) ) ( not ( = ?auto_676510 ?auto_676512 ) ) ( not ( = ?auto_676511 ?auto_676512 ) ) ( ON ?auto_676510 ?auto_676511 ) ( ON ?auto_676509 ?auto_676510 ) ( ON ?auto_676508 ?auto_676509 ) ( ON ?auto_676507 ?auto_676508 ) ( ON ?auto_676506 ?auto_676507 ) ( ON ?auto_676505 ?auto_676506 ) ( ON ?auto_676504 ?auto_676505 ) ( ON ?auto_676503 ?auto_676504 ) ( CLEAR ?auto_676501 ) ( ON ?auto_676502 ?auto_676503 ) ( CLEAR ?auto_676502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_676498 ?auto_676499 ?auto_676500 ?auto_676501 ?auto_676502 )
      ( MAKE-14PILE ?auto_676498 ?auto_676499 ?auto_676500 ?auto_676501 ?auto_676502 ?auto_676503 ?auto_676504 ?auto_676505 ?auto_676506 ?auto_676507 ?auto_676508 ?auto_676509 ?auto_676510 ?auto_676511 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676556 - BLOCK
      ?auto_676557 - BLOCK
      ?auto_676558 - BLOCK
      ?auto_676559 - BLOCK
      ?auto_676560 - BLOCK
      ?auto_676561 - BLOCK
      ?auto_676562 - BLOCK
      ?auto_676563 - BLOCK
      ?auto_676564 - BLOCK
      ?auto_676565 - BLOCK
      ?auto_676566 - BLOCK
      ?auto_676567 - BLOCK
      ?auto_676568 - BLOCK
      ?auto_676569 - BLOCK
    )
    :vars
    (
      ?auto_676570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676569 ?auto_676570 ) ( ON-TABLE ?auto_676556 ) ( ON ?auto_676557 ?auto_676556 ) ( ON ?auto_676558 ?auto_676557 ) ( not ( = ?auto_676556 ?auto_676557 ) ) ( not ( = ?auto_676556 ?auto_676558 ) ) ( not ( = ?auto_676556 ?auto_676559 ) ) ( not ( = ?auto_676556 ?auto_676560 ) ) ( not ( = ?auto_676556 ?auto_676561 ) ) ( not ( = ?auto_676556 ?auto_676562 ) ) ( not ( = ?auto_676556 ?auto_676563 ) ) ( not ( = ?auto_676556 ?auto_676564 ) ) ( not ( = ?auto_676556 ?auto_676565 ) ) ( not ( = ?auto_676556 ?auto_676566 ) ) ( not ( = ?auto_676556 ?auto_676567 ) ) ( not ( = ?auto_676556 ?auto_676568 ) ) ( not ( = ?auto_676556 ?auto_676569 ) ) ( not ( = ?auto_676556 ?auto_676570 ) ) ( not ( = ?auto_676557 ?auto_676558 ) ) ( not ( = ?auto_676557 ?auto_676559 ) ) ( not ( = ?auto_676557 ?auto_676560 ) ) ( not ( = ?auto_676557 ?auto_676561 ) ) ( not ( = ?auto_676557 ?auto_676562 ) ) ( not ( = ?auto_676557 ?auto_676563 ) ) ( not ( = ?auto_676557 ?auto_676564 ) ) ( not ( = ?auto_676557 ?auto_676565 ) ) ( not ( = ?auto_676557 ?auto_676566 ) ) ( not ( = ?auto_676557 ?auto_676567 ) ) ( not ( = ?auto_676557 ?auto_676568 ) ) ( not ( = ?auto_676557 ?auto_676569 ) ) ( not ( = ?auto_676557 ?auto_676570 ) ) ( not ( = ?auto_676558 ?auto_676559 ) ) ( not ( = ?auto_676558 ?auto_676560 ) ) ( not ( = ?auto_676558 ?auto_676561 ) ) ( not ( = ?auto_676558 ?auto_676562 ) ) ( not ( = ?auto_676558 ?auto_676563 ) ) ( not ( = ?auto_676558 ?auto_676564 ) ) ( not ( = ?auto_676558 ?auto_676565 ) ) ( not ( = ?auto_676558 ?auto_676566 ) ) ( not ( = ?auto_676558 ?auto_676567 ) ) ( not ( = ?auto_676558 ?auto_676568 ) ) ( not ( = ?auto_676558 ?auto_676569 ) ) ( not ( = ?auto_676558 ?auto_676570 ) ) ( not ( = ?auto_676559 ?auto_676560 ) ) ( not ( = ?auto_676559 ?auto_676561 ) ) ( not ( = ?auto_676559 ?auto_676562 ) ) ( not ( = ?auto_676559 ?auto_676563 ) ) ( not ( = ?auto_676559 ?auto_676564 ) ) ( not ( = ?auto_676559 ?auto_676565 ) ) ( not ( = ?auto_676559 ?auto_676566 ) ) ( not ( = ?auto_676559 ?auto_676567 ) ) ( not ( = ?auto_676559 ?auto_676568 ) ) ( not ( = ?auto_676559 ?auto_676569 ) ) ( not ( = ?auto_676559 ?auto_676570 ) ) ( not ( = ?auto_676560 ?auto_676561 ) ) ( not ( = ?auto_676560 ?auto_676562 ) ) ( not ( = ?auto_676560 ?auto_676563 ) ) ( not ( = ?auto_676560 ?auto_676564 ) ) ( not ( = ?auto_676560 ?auto_676565 ) ) ( not ( = ?auto_676560 ?auto_676566 ) ) ( not ( = ?auto_676560 ?auto_676567 ) ) ( not ( = ?auto_676560 ?auto_676568 ) ) ( not ( = ?auto_676560 ?auto_676569 ) ) ( not ( = ?auto_676560 ?auto_676570 ) ) ( not ( = ?auto_676561 ?auto_676562 ) ) ( not ( = ?auto_676561 ?auto_676563 ) ) ( not ( = ?auto_676561 ?auto_676564 ) ) ( not ( = ?auto_676561 ?auto_676565 ) ) ( not ( = ?auto_676561 ?auto_676566 ) ) ( not ( = ?auto_676561 ?auto_676567 ) ) ( not ( = ?auto_676561 ?auto_676568 ) ) ( not ( = ?auto_676561 ?auto_676569 ) ) ( not ( = ?auto_676561 ?auto_676570 ) ) ( not ( = ?auto_676562 ?auto_676563 ) ) ( not ( = ?auto_676562 ?auto_676564 ) ) ( not ( = ?auto_676562 ?auto_676565 ) ) ( not ( = ?auto_676562 ?auto_676566 ) ) ( not ( = ?auto_676562 ?auto_676567 ) ) ( not ( = ?auto_676562 ?auto_676568 ) ) ( not ( = ?auto_676562 ?auto_676569 ) ) ( not ( = ?auto_676562 ?auto_676570 ) ) ( not ( = ?auto_676563 ?auto_676564 ) ) ( not ( = ?auto_676563 ?auto_676565 ) ) ( not ( = ?auto_676563 ?auto_676566 ) ) ( not ( = ?auto_676563 ?auto_676567 ) ) ( not ( = ?auto_676563 ?auto_676568 ) ) ( not ( = ?auto_676563 ?auto_676569 ) ) ( not ( = ?auto_676563 ?auto_676570 ) ) ( not ( = ?auto_676564 ?auto_676565 ) ) ( not ( = ?auto_676564 ?auto_676566 ) ) ( not ( = ?auto_676564 ?auto_676567 ) ) ( not ( = ?auto_676564 ?auto_676568 ) ) ( not ( = ?auto_676564 ?auto_676569 ) ) ( not ( = ?auto_676564 ?auto_676570 ) ) ( not ( = ?auto_676565 ?auto_676566 ) ) ( not ( = ?auto_676565 ?auto_676567 ) ) ( not ( = ?auto_676565 ?auto_676568 ) ) ( not ( = ?auto_676565 ?auto_676569 ) ) ( not ( = ?auto_676565 ?auto_676570 ) ) ( not ( = ?auto_676566 ?auto_676567 ) ) ( not ( = ?auto_676566 ?auto_676568 ) ) ( not ( = ?auto_676566 ?auto_676569 ) ) ( not ( = ?auto_676566 ?auto_676570 ) ) ( not ( = ?auto_676567 ?auto_676568 ) ) ( not ( = ?auto_676567 ?auto_676569 ) ) ( not ( = ?auto_676567 ?auto_676570 ) ) ( not ( = ?auto_676568 ?auto_676569 ) ) ( not ( = ?auto_676568 ?auto_676570 ) ) ( not ( = ?auto_676569 ?auto_676570 ) ) ( ON ?auto_676568 ?auto_676569 ) ( ON ?auto_676567 ?auto_676568 ) ( ON ?auto_676566 ?auto_676567 ) ( ON ?auto_676565 ?auto_676566 ) ( ON ?auto_676564 ?auto_676565 ) ( ON ?auto_676563 ?auto_676564 ) ( ON ?auto_676562 ?auto_676563 ) ( ON ?auto_676561 ?auto_676562 ) ( ON ?auto_676560 ?auto_676561 ) ( CLEAR ?auto_676558 ) ( ON ?auto_676559 ?auto_676560 ) ( CLEAR ?auto_676559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_676556 ?auto_676557 ?auto_676558 ?auto_676559 )
      ( MAKE-14PILE ?auto_676556 ?auto_676557 ?auto_676558 ?auto_676559 ?auto_676560 ?auto_676561 ?auto_676562 ?auto_676563 ?auto_676564 ?auto_676565 ?auto_676566 ?auto_676567 ?auto_676568 ?auto_676569 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676614 - BLOCK
      ?auto_676615 - BLOCK
      ?auto_676616 - BLOCK
      ?auto_676617 - BLOCK
      ?auto_676618 - BLOCK
      ?auto_676619 - BLOCK
      ?auto_676620 - BLOCK
      ?auto_676621 - BLOCK
      ?auto_676622 - BLOCK
      ?auto_676623 - BLOCK
      ?auto_676624 - BLOCK
      ?auto_676625 - BLOCK
      ?auto_676626 - BLOCK
      ?auto_676627 - BLOCK
    )
    :vars
    (
      ?auto_676628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676627 ?auto_676628 ) ( ON-TABLE ?auto_676614 ) ( ON ?auto_676615 ?auto_676614 ) ( not ( = ?auto_676614 ?auto_676615 ) ) ( not ( = ?auto_676614 ?auto_676616 ) ) ( not ( = ?auto_676614 ?auto_676617 ) ) ( not ( = ?auto_676614 ?auto_676618 ) ) ( not ( = ?auto_676614 ?auto_676619 ) ) ( not ( = ?auto_676614 ?auto_676620 ) ) ( not ( = ?auto_676614 ?auto_676621 ) ) ( not ( = ?auto_676614 ?auto_676622 ) ) ( not ( = ?auto_676614 ?auto_676623 ) ) ( not ( = ?auto_676614 ?auto_676624 ) ) ( not ( = ?auto_676614 ?auto_676625 ) ) ( not ( = ?auto_676614 ?auto_676626 ) ) ( not ( = ?auto_676614 ?auto_676627 ) ) ( not ( = ?auto_676614 ?auto_676628 ) ) ( not ( = ?auto_676615 ?auto_676616 ) ) ( not ( = ?auto_676615 ?auto_676617 ) ) ( not ( = ?auto_676615 ?auto_676618 ) ) ( not ( = ?auto_676615 ?auto_676619 ) ) ( not ( = ?auto_676615 ?auto_676620 ) ) ( not ( = ?auto_676615 ?auto_676621 ) ) ( not ( = ?auto_676615 ?auto_676622 ) ) ( not ( = ?auto_676615 ?auto_676623 ) ) ( not ( = ?auto_676615 ?auto_676624 ) ) ( not ( = ?auto_676615 ?auto_676625 ) ) ( not ( = ?auto_676615 ?auto_676626 ) ) ( not ( = ?auto_676615 ?auto_676627 ) ) ( not ( = ?auto_676615 ?auto_676628 ) ) ( not ( = ?auto_676616 ?auto_676617 ) ) ( not ( = ?auto_676616 ?auto_676618 ) ) ( not ( = ?auto_676616 ?auto_676619 ) ) ( not ( = ?auto_676616 ?auto_676620 ) ) ( not ( = ?auto_676616 ?auto_676621 ) ) ( not ( = ?auto_676616 ?auto_676622 ) ) ( not ( = ?auto_676616 ?auto_676623 ) ) ( not ( = ?auto_676616 ?auto_676624 ) ) ( not ( = ?auto_676616 ?auto_676625 ) ) ( not ( = ?auto_676616 ?auto_676626 ) ) ( not ( = ?auto_676616 ?auto_676627 ) ) ( not ( = ?auto_676616 ?auto_676628 ) ) ( not ( = ?auto_676617 ?auto_676618 ) ) ( not ( = ?auto_676617 ?auto_676619 ) ) ( not ( = ?auto_676617 ?auto_676620 ) ) ( not ( = ?auto_676617 ?auto_676621 ) ) ( not ( = ?auto_676617 ?auto_676622 ) ) ( not ( = ?auto_676617 ?auto_676623 ) ) ( not ( = ?auto_676617 ?auto_676624 ) ) ( not ( = ?auto_676617 ?auto_676625 ) ) ( not ( = ?auto_676617 ?auto_676626 ) ) ( not ( = ?auto_676617 ?auto_676627 ) ) ( not ( = ?auto_676617 ?auto_676628 ) ) ( not ( = ?auto_676618 ?auto_676619 ) ) ( not ( = ?auto_676618 ?auto_676620 ) ) ( not ( = ?auto_676618 ?auto_676621 ) ) ( not ( = ?auto_676618 ?auto_676622 ) ) ( not ( = ?auto_676618 ?auto_676623 ) ) ( not ( = ?auto_676618 ?auto_676624 ) ) ( not ( = ?auto_676618 ?auto_676625 ) ) ( not ( = ?auto_676618 ?auto_676626 ) ) ( not ( = ?auto_676618 ?auto_676627 ) ) ( not ( = ?auto_676618 ?auto_676628 ) ) ( not ( = ?auto_676619 ?auto_676620 ) ) ( not ( = ?auto_676619 ?auto_676621 ) ) ( not ( = ?auto_676619 ?auto_676622 ) ) ( not ( = ?auto_676619 ?auto_676623 ) ) ( not ( = ?auto_676619 ?auto_676624 ) ) ( not ( = ?auto_676619 ?auto_676625 ) ) ( not ( = ?auto_676619 ?auto_676626 ) ) ( not ( = ?auto_676619 ?auto_676627 ) ) ( not ( = ?auto_676619 ?auto_676628 ) ) ( not ( = ?auto_676620 ?auto_676621 ) ) ( not ( = ?auto_676620 ?auto_676622 ) ) ( not ( = ?auto_676620 ?auto_676623 ) ) ( not ( = ?auto_676620 ?auto_676624 ) ) ( not ( = ?auto_676620 ?auto_676625 ) ) ( not ( = ?auto_676620 ?auto_676626 ) ) ( not ( = ?auto_676620 ?auto_676627 ) ) ( not ( = ?auto_676620 ?auto_676628 ) ) ( not ( = ?auto_676621 ?auto_676622 ) ) ( not ( = ?auto_676621 ?auto_676623 ) ) ( not ( = ?auto_676621 ?auto_676624 ) ) ( not ( = ?auto_676621 ?auto_676625 ) ) ( not ( = ?auto_676621 ?auto_676626 ) ) ( not ( = ?auto_676621 ?auto_676627 ) ) ( not ( = ?auto_676621 ?auto_676628 ) ) ( not ( = ?auto_676622 ?auto_676623 ) ) ( not ( = ?auto_676622 ?auto_676624 ) ) ( not ( = ?auto_676622 ?auto_676625 ) ) ( not ( = ?auto_676622 ?auto_676626 ) ) ( not ( = ?auto_676622 ?auto_676627 ) ) ( not ( = ?auto_676622 ?auto_676628 ) ) ( not ( = ?auto_676623 ?auto_676624 ) ) ( not ( = ?auto_676623 ?auto_676625 ) ) ( not ( = ?auto_676623 ?auto_676626 ) ) ( not ( = ?auto_676623 ?auto_676627 ) ) ( not ( = ?auto_676623 ?auto_676628 ) ) ( not ( = ?auto_676624 ?auto_676625 ) ) ( not ( = ?auto_676624 ?auto_676626 ) ) ( not ( = ?auto_676624 ?auto_676627 ) ) ( not ( = ?auto_676624 ?auto_676628 ) ) ( not ( = ?auto_676625 ?auto_676626 ) ) ( not ( = ?auto_676625 ?auto_676627 ) ) ( not ( = ?auto_676625 ?auto_676628 ) ) ( not ( = ?auto_676626 ?auto_676627 ) ) ( not ( = ?auto_676626 ?auto_676628 ) ) ( not ( = ?auto_676627 ?auto_676628 ) ) ( ON ?auto_676626 ?auto_676627 ) ( ON ?auto_676625 ?auto_676626 ) ( ON ?auto_676624 ?auto_676625 ) ( ON ?auto_676623 ?auto_676624 ) ( ON ?auto_676622 ?auto_676623 ) ( ON ?auto_676621 ?auto_676622 ) ( ON ?auto_676620 ?auto_676621 ) ( ON ?auto_676619 ?auto_676620 ) ( ON ?auto_676618 ?auto_676619 ) ( ON ?auto_676617 ?auto_676618 ) ( CLEAR ?auto_676615 ) ( ON ?auto_676616 ?auto_676617 ) ( CLEAR ?auto_676616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_676614 ?auto_676615 ?auto_676616 )
      ( MAKE-14PILE ?auto_676614 ?auto_676615 ?auto_676616 ?auto_676617 ?auto_676618 ?auto_676619 ?auto_676620 ?auto_676621 ?auto_676622 ?auto_676623 ?auto_676624 ?auto_676625 ?auto_676626 ?auto_676627 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676672 - BLOCK
      ?auto_676673 - BLOCK
      ?auto_676674 - BLOCK
      ?auto_676675 - BLOCK
      ?auto_676676 - BLOCK
      ?auto_676677 - BLOCK
      ?auto_676678 - BLOCK
      ?auto_676679 - BLOCK
      ?auto_676680 - BLOCK
      ?auto_676681 - BLOCK
      ?auto_676682 - BLOCK
      ?auto_676683 - BLOCK
      ?auto_676684 - BLOCK
      ?auto_676685 - BLOCK
    )
    :vars
    (
      ?auto_676686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676685 ?auto_676686 ) ( ON-TABLE ?auto_676672 ) ( not ( = ?auto_676672 ?auto_676673 ) ) ( not ( = ?auto_676672 ?auto_676674 ) ) ( not ( = ?auto_676672 ?auto_676675 ) ) ( not ( = ?auto_676672 ?auto_676676 ) ) ( not ( = ?auto_676672 ?auto_676677 ) ) ( not ( = ?auto_676672 ?auto_676678 ) ) ( not ( = ?auto_676672 ?auto_676679 ) ) ( not ( = ?auto_676672 ?auto_676680 ) ) ( not ( = ?auto_676672 ?auto_676681 ) ) ( not ( = ?auto_676672 ?auto_676682 ) ) ( not ( = ?auto_676672 ?auto_676683 ) ) ( not ( = ?auto_676672 ?auto_676684 ) ) ( not ( = ?auto_676672 ?auto_676685 ) ) ( not ( = ?auto_676672 ?auto_676686 ) ) ( not ( = ?auto_676673 ?auto_676674 ) ) ( not ( = ?auto_676673 ?auto_676675 ) ) ( not ( = ?auto_676673 ?auto_676676 ) ) ( not ( = ?auto_676673 ?auto_676677 ) ) ( not ( = ?auto_676673 ?auto_676678 ) ) ( not ( = ?auto_676673 ?auto_676679 ) ) ( not ( = ?auto_676673 ?auto_676680 ) ) ( not ( = ?auto_676673 ?auto_676681 ) ) ( not ( = ?auto_676673 ?auto_676682 ) ) ( not ( = ?auto_676673 ?auto_676683 ) ) ( not ( = ?auto_676673 ?auto_676684 ) ) ( not ( = ?auto_676673 ?auto_676685 ) ) ( not ( = ?auto_676673 ?auto_676686 ) ) ( not ( = ?auto_676674 ?auto_676675 ) ) ( not ( = ?auto_676674 ?auto_676676 ) ) ( not ( = ?auto_676674 ?auto_676677 ) ) ( not ( = ?auto_676674 ?auto_676678 ) ) ( not ( = ?auto_676674 ?auto_676679 ) ) ( not ( = ?auto_676674 ?auto_676680 ) ) ( not ( = ?auto_676674 ?auto_676681 ) ) ( not ( = ?auto_676674 ?auto_676682 ) ) ( not ( = ?auto_676674 ?auto_676683 ) ) ( not ( = ?auto_676674 ?auto_676684 ) ) ( not ( = ?auto_676674 ?auto_676685 ) ) ( not ( = ?auto_676674 ?auto_676686 ) ) ( not ( = ?auto_676675 ?auto_676676 ) ) ( not ( = ?auto_676675 ?auto_676677 ) ) ( not ( = ?auto_676675 ?auto_676678 ) ) ( not ( = ?auto_676675 ?auto_676679 ) ) ( not ( = ?auto_676675 ?auto_676680 ) ) ( not ( = ?auto_676675 ?auto_676681 ) ) ( not ( = ?auto_676675 ?auto_676682 ) ) ( not ( = ?auto_676675 ?auto_676683 ) ) ( not ( = ?auto_676675 ?auto_676684 ) ) ( not ( = ?auto_676675 ?auto_676685 ) ) ( not ( = ?auto_676675 ?auto_676686 ) ) ( not ( = ?auto_676676 ?auto_676677 ) ) ( not ( = ?auto_676676 ?auto_676678 ) ) ( not ( = ?auto_676676 ?auto_676679 ) ) ( not ( = ?auto_676676 ?auto_676680 ) ) ( not ( = ?auto_676676 ?auto_676681 ) ) ( not ( = ?auto_676676 ?auto_676682 ) ) ( not ( = ?auto_676676 ?auto_676683 ) ) ( not ( = ?auto_676676 ?auto_676684 ) ) ( not ( = ?auto_676676 ?auto_676685 ) ) ( not ( = ?auto_676676 ?auto_676686 ) ) ( not ( = ?auto_676677 ?auto_676678 ) ) ( not ( = ?auto_676677 ?auto_676679 ) ) ( not ( = ?auto_676677 ?auto_676680 ) ) ( not ( = ?auto_676677 ?auto_676681 ) ) ( not ( = ?auto_676677 ?auto_676682 ) ) ( not ( = ?auto_676677 ?auto_676683 ) ) ( not ( = ?auto_676677 ?auto_676684 ) ) ( not ( = ?auto_676677 ?auto_676685 ) ) ( not ( = ?auto_676677 ?auto_676686 ) ) ( not ( = ?auto_676678 ?auto_676679 ) ) ( not ( = ?auto_676678 ?auto_676680 ) ) ( not ( = ?auto_676678 ?auto_676681 ) ) ( not ( = ?auto_676678 ?auto_676682 ) ) ( not ( = ?auto_676678 ?auto_676683 ) ) ( not ( = ?auto_676678 ?auto_676684 ) ) ( not ( = ?auto_676678 ?auto_676685 ) ) ( not ( = ?auto_676678 ?auto_676686 ) ) ( not ( = ?auto_676679 ?auto_676680 ) ) ( not ( = ?auto_676679 ?auto_676681 ) ) ( not ( = ?auto_676679 ?auto_676682 ) ) ( not ( = ?auto_676679 ?auto_676683 ) ) ( not ( = ?auto_676679 ?auto_676684 ) ) ( not ( = ?auto_676679 ?auto_676685 ) ) ( not ( = ?auto_676679 ?auto_676686 ) ) ( not ( = ?auto_676680 ?auto_676681 ) ) ( not ( = ?auto_676680 ?auto_676682 ) ) ( not ( = ?auto_676680 ?auto_676683 ) ) ( not ( = ?auto_676680 ?auto_676684 ) ) ( not ( = ?auto_676680 ?auto_676685 ) ) ( not ( = ?auto_676680 ?auto_676686 ) ) ( not ( = ?auto_676681 ?auto_676682 ) ) ( not ( = ?auto_676681 ?auto_676683 ) ) ( not ( = ?auto_676681 ?auto_676684 ) ) ( not ( = ?auto_676681 ?auto_676685 ) ) ( not ( = ?auto_676681 ?auto_676686 ) ) ( not ( = ?auto_676682 ?auto_676683 ) ) ( not ( = ?auto_676682 ?auto_676684 ) ) ( not ( = ?auto_676682 ?auto_676685 ) ) ( not ( = ?auto_676682 ?auto_676686 ) ) ( not ( = ?auto_676683 ?auto_676684 ) ) ( not ( = ?auto_676683 ?auto_676685 ) ) ( not ( = ?auto_676683 ?auto_676686 ) ) ( not ( = ?auto_676684 ?auto_676685 ) ) ( not ( = ?auto_676684 ?auto_676686 ) ) ( not ( = ?auto_676685 ?auto_676686 ) ) ( ON ?auto_676684 ?auto_676685 ) ( ON ?auto_676683 ?auto_676684 ) ( ON ?auto_676682 ?auto_676683 ) ( ON ?auto_676681 ?auto_676682 ) ( ON ?auto_676680 ?auto_676681 ) ( ON ?auto_676679 ?auto_676680 ) ( ON ?auto_676678 ?auto_676679 ) ( ON ?auto_676677 ?auto_676678 ) ( ON ?auto_676676 ?auto_676677 ) ( ON ?auto_676675 ?auto_676676 ) ( ON ?auto_676674 ?auto_676675 ) ( CLEAR ?auto_676672 ) ( ON ?auto_676673 ?auto_676674 ) ( CLEAR ?auto_676673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_676672 ?auto_676673 )
      ( MAKE-14PILE ?auto_676672 ?auto_676673 ?auto_676674 ?auto_676675 ?auto_676676 ?auto_676677 ?auto_676678 ?auto_676679 ?auto_676680 ?auto_676681 ?auto_676682 ?auto_676683 ?auto_676684 ?auto_676685 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_676730 - BLOCK
      ?auto_676731 - BLOCK
      ?auto_676732 - BLOCK
      ?auto_676733 - BLOCK
      ?auto_676734 - BLOCK
      ?auto_676735 - BLOCK
      ?auto_676736 - BLOCK
      ?auto_676737 - BLOCK
      ?auto_676738 - BLOCK
      ?auto_676739 - BLOCK
      ?auto_676740 - BLOCK
      ?auto_676741 - BLOCK
      ?auto_676742 - BLOCK
      ?auto_676743 - BLOCK
    )
    :vars
    (
      ?auto_676744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676743 ?auto_676744 ) ( not ( = ?auto_676730 ?auto_676731 ) ) ( not ( = ?auto_676730 ?auto_676732 ) ) ( not ( = ?auto_676730 ?auto_676733 ) ) ( not ( = ?auto_676730 ?auto_676734 ) ) ( not ( = ?auto_676730 ?auto_676735 ) ) ( not ( = ?auto_676730 ?auto_676736 ) ) ( not ( = ?auto_676730 ?auto_676737 ) ) ( not ( = ?auto_676730 ?auto_676738 ) ) ( not ( = ?auto_676730 ?auto_676739 ) ) ( not ( = ?auto_676730 ?auto_676740 ) ) ( not ( = ?auto_676730 ?auto_676741 ) ) ( not ( = ?auto_676730 ?auto_676742 ) ) ( not ( = ?auto_676730 ?auto_676743 ) ) ( not ( = ?auto_676730 ?auto_676744 ) ) ( not ( = ?auto_676731 ?auto_676732 ) ) ( not ( = ?auto_676731 ?auto_676733 ) ) ( not ( = ?auto_676731 ?auto_676734 ) ) ( not ( = ?auto_676731 ?auto_676735 ) ) ( not ( = ?auto_676731 ?auto_676736 ) ) ( not ( = ?auto_676731 ?auto_676737 ) ) ( not ( = ?auto_676731 ?auto_676738 ) ) ( not ( = ?auto_676731 ?auto_676739 ) ) ( not ( = ?auto_676731 ?auto_676740 ) ) ( not ( = ?auto_676731 ?auto_676741 ) ) ( not ( = ?auto_676731 ?auto_676742 ) ) ( not ( = ?auto_676731 ?auto_676743 ) ) ( not ( = ?auto_676731 ?auto_676744 ) ) ( not ( = ?auto_676732 ?auto_676733 ) ) ( not ( = ?auto_676732 ?auto_676734 ) ) ( not ( = ?auto_676732 ?auto_676735 ) ) ( not ( = ?auto_676732 ?auto_676736 ) ) ( not ( = ?auto_676732 ?auto_676737 ) ) ( not ( = ?auto_676732 ?auto_676738 ) ) ( not ( = ?auto_676732 ?auto_676739 ) ) ( not ( = ?auto_676732 ?auto_676740 ) ) ( not ( = ?auto_676732 ?auto_676741 ) ) ( not ( = ?auto_676732 ?auto_676742 ) ) ( not ( = ?auto_676732 ?auto_676743 ) ) ( not ( = ?auto_676732 ?auto_676744 ) ) ( not ( = ?auto_676733 ?auto_676734 ) ) ( not ( = ?auto_676733 ?auto_676735 ) ) ( not ( = ?auto_676733 ?auto_676736 ) ) ( not ( = ?auto_676733 ?auto_676737 ) ) ( not ( = ?auto_676733 ?auto_676738 ) ) ( not ( = ?auto_676733 ?auto_676739 ) ) ( not ( = ?auto_676733 ?auto_676740 ) ) ( not ( = ?auto_676733 ?auto_676741 ) ) ( not ( = ?auto_676733 ?auto_676742 ) ) ( not ( = ?auto_676733 ?auto_676743 ) ) ( not ( = ?auto_676733 ?auto_676744 ) ) ( not ( = ?auto_676734 ?auto_676735 ) ) ( not ( = ?auto_676734 ?auto_676736 ) ) ( not ( = ?auto_676734 ?auto_676737 ) ) ( not ( = ?auto_676734 ?auto_676738 ) ) ( not ( = ?auto_676734 ?auto_676739 ) ) ( not ( = ?auto_676734 ?auto_676740 ) ) ( not ( = ?auto_676734 ?auto_676741 ) ) ( not ( = ?auto_676734 ?auto_676742 ) ) ( not ( = ?auto_676734 ?auto_676743 ) ) ( not ( = ?auto_676734 ?auto_676744 ) ) ( not ( = ?auto_676735 ?auto_676736 ) ) ( not ( = ?auto_676735 ?auto_676737 ) ) ( not ( = ?auto_676735 ?auto_676738 ) ) ( not ( = ?auto_676735 ?auto_676739 ) ) ( not ( = ?auto_676735 ?auto_676740 ) ) ( not ( = ?auto_676735 ?auto_676741 ) ) ( not ( = ?auto_676735 ?auto_676742 ) ) ( not ( = ?auto_676735 ?auto_676743 ) ) ( not ( = ?auto_676735 ?auto_676744 ) ) ( not ( = ?auto_676736 ?auto_676737 ) ) ( not ( = ?auto_676736 ?auto_676738 ) ) ( not ( = ?auto_676736 ?auto_676739 ) ) ( not ( = ?auto_676736 ?auto_676740 ) ) ( not ( = ?auto_676736 ?auto_676741 ) ) ( not ( = ?auto_676736 ?auto_676742 ) ) ( not ( = ?auto_676736 ?auto_676743 ) ) ( not ( = ?auto_676736 ?auto_676744 ) ) ( not ( = ?auto_676737 ?auto_676738 ) ) ( not ( = ?auto_676737 ?auto_676739 ) ) ( not ( = ?auto_676737 ?auto_676740 ) ) ( not ( = ?auto_676737 ?auto_676741 ) ) ( not ( = ?auto_676737 ?auto_676742 ) ) ( not ( = ?auto_676737 ?auto_676743 ) ) ( not ( = ?auto_676737 ?auto_676744 ) ) ( not ( = ?auto_676738 ?auto_676739 ) ) ( not ( = ?auto_676738 ?auto_676740 ) ) ( not ( = ?auto_676738 ?auto_676741 ) ) ( not ( = ?auto_676738 ?auto_676742 ) ) ( not ( = ?auto_676738 ?auto_676743 ) ) ( not ( = ?auto_676738 ?auto_676744 ) ) ( not ( = ?auto_676739 ?auto_676740 ) ) ( not ( = ?auto_676739 ?auto_676741 ) ) ( not ( = ?auto_676739 ?auto_676742 ) ) ( not ( = ?auto_676739 ?auto_676743 ) ) ( not ( = ?auto_676739 ?auto_676744 ) ) ( not ( = ?auto_676740 ?auto_676741 ) ) ( not ( = ?auto_676740 ?auto_676742 ) ) ( not ( = ?auto_676740 ?auto_676743 ) ) ( not ( = ?auto_676740 ?auto_676744 ) ) ( not ( = ?auto_676741 ?auto_676742 ) ) ( not ( = ?auto_676741 ?auto_676743 ) ) ( not ( = ?auto_676741 ?auto_676744 ) ) ( not ( = ?auto_676742 ?auto_676743 ) ) ( not ( = ?auto_676742 ?auto_676744 ) ) ( not ( = ?auto_676743 ?auto_676744 ) ) ( ON ?auto_676742 ?auto_676743 ) ( ON ?auto_676741 ?auto_676742 ) ( ON ?auto_676740 ?auto_676741 ) ( ON ?auto_676739 ?auto_676740 ) ( ON ?auto_676738 ?auto_676739 ) ( ON ?auto_676737 ?auto_676738 ) ( ON ?auto_676736 ?auto_676737 ) ( ON ?auto_676735 ?auto_676736 ) ( ON ?auto_676734 ?auto_676735 ) ( ON ?auto_676733 ?auto_676734 ) ( ON ?auto_676732 ?auto_676733 ) ( ON ?auto_676731 ?auto_676732 ) ( ON ?auto_676730 ?auto_676731 ) ( CLEAR ?auto_676730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_676730 )
      ( MAKE-14PILE ?auto_676730 ?auto_676731 ?auto_676732 ?auto_676733 ?auto_676734 ?auto_676735 ?auto_676736 ?auto_676737 ?auto_676738 ?auto_676739 ?auto_676740 ?auto_676741 ?auto_676742 ?auto_676743 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_676789 - BLOCK
      ?auto_676790 - BLOCK
      ?auto_676791 - BLOCK
      ?auto_676792 - BLOCK
      ?auto_676793 - BLOCK
      ?auto_676794 - BLOCK
      ?auto_676795 - BLOCK
      ?auto_676796 - BLOCK
      ?auto_676797 - BLOCK
      ?auto_676798 - BLOCK
      ?auto_676799 - BLOCK
      ?auto_676800 - BLOCK
      ?auto_676801 - BLOCK
      ?auto_676802 - BLOCK
      ?auto_676803 - BLOCK
    )
    :vars
    (
      ?auto_676804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_676802 ) ( ON ?auto_676803 ?auto_676804 ) ( CLEAR ?auto_676803 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_676789 ) ( ON ?auto_676790 ?auto_676789 ) ( ON ?auto_676791 ?auto_676790 ) ( ON ?auto_676792 ?auto_676791 ) ( ON ?auto_676793 ?auto_676792 ) ( ON ?auto_676794 ?auto_676793 ) ( ON ?auto_676795 ?auto_676794 ) ( ON ?auto_676796 ?auto_676795 ) ( ON ?auto_676797 ?auto_676796 ) ( ON ?auto_676798 ?auto_676797 ) ( ON ?auto_676799 ?auto_676798 ) ( ON ?auto_676800 ?auto_676799 ) ( ON ?auto_676801 ?auto_676800 ) ( ON ?auto_676802 ?auto_676801 ) ( not ( = ?auto_676789 ?auto_676790 ) ) ( not ( = ?auto_676789 ?auto_676791 ) ) ( not ( = ?auto_676789 ?auto_676792 ) ) ( not ( = ?auto_676789 ?auto_676793 ) ) ( not ( = ?auto_676789 ?auto_676794 ) ) ( not ( = ?auto_676789 ?auto_676795 ) ) ( not ( = ?auto_676789 ?auto_676796 ) ) ( not ( = ?auto_676789 ?auto_676797 ) ) ( not ( = ?auto_676789 ?auto_676798 ) ) ( not ( = ?auto_676789 ?auto_676799 ) ) ( not ( = ?auto_676789 ?auto_676800 ) ) ( not ( = ?auto_676789 ?auto_676801 ) ) ( not ( = ?auto_676789 ?auto_676802 ) ) ( not ( = ?auto_676789 ?auto_676803 ) ) ( not ( = ?auto_676789 ?auto_676804 ) ) ( not ( = ?auto_676790 ?auto_676791 ) ) ( not ( = ?auto_676790 ?auto_676792 ) ) ( not ( = ?auto_676790 ?auto_676793 ) ) ( not ( = ?auto_676790 ?auto_676794 ) ) ( not ( = ?auto_676790 ?auto_676795 ) ) ( not ( = ?auto_676790 ?auto_676796 ) ) ( not ( = ?auto_676790 ?auto_676797 ) ) ( not ( = ?auto_676790 ?auto_676798 ) ) ( not ( = ?auto_676790 ?auto_676799 ) ) ( not ( = ?auto_676790 ?auto_676800 ) ) ( not ( = ?auto_676790 ?auto_676801 ) ) ( not ( = ?auto_676790 ?auto_676802 ) ) ( not ( = ?auto_676790 ?auto_676803 ) ) ( not ( = ?auto_676790 ?auto_676804 ) ) ( not ( = ?auto_676791 ?auto_676792 ) ) ( not ( = ?auto_676791 ?auto_676793 ) ) ( not ( = ?auto_676791 ?auto_676794 ) ) ( not ( = ?auto_676791 ?auto_676795 ) ) ( not ( = ?auto_676791 ?auto_676796 ) ) ( not ( = ?auto_676791 ?auto_676797 ) ) ( not ( = ?auto_676791 ?auto_676798 ) ) ( not ( = ?auto_676791 ?auto_676799 ) ) ( not ( = ?auto_676791 ?auto_676800 ) ) ( not ( = ?auto_676791 ?auto_676801 ) ) ( not ( = ?auto_676791 ?auto_676802 ) ) ( not ( = ?auto_676791 ?auto_676803 ) ) ( not ( = ?auto_676791 ?auto_676804 ) ) ( not ( = ?auto_676792 ?auto_676793 ) ) ( not ( = ?auto_676792 ?auto_676794 ) ) ( not ( = ?auto_676792 ?auto_676795 ) ) ( not ( = ?auto_676792 ?auto_676796 ) ) ( not ( = ?auto_676792 ?auto_676797 ) ) ( not ( = ?auto_676792 ?auto_676798 ) ) ( not ( = ?auto_676792 ?auto_676799 ) ) ( not ( = ?auto_676792 ?auto_676800 ) ) ( not ( = ?auto_676792 ?auto_676801 ) ) ( not ( = ?auto_676792 ?auto_676802 ) ) ( not ( = ?auto_676792 ?auto_676803 ) ) ( not ( = ?auto_676792 ?auto_676804 ) ) ( not ( = ?auto_676793 ?auto_676794 ) ) ( not ( = ?auto_676793 ?auto_676795 ) ) ( not ( = ?auto_676793 ?auto_676796 ) ) ( not ( = ?auto_676793 ?auto_676797 ) ) ( not ( = ?auto_676793 ?auto_676798 ) ) ( not ( = ?auto_676793 ?auto_676799 ) ) ( not ( = ?auto_676793 ?auto_676800 ) ) ( not ( = ?auto_676793 ?auto_676801 ) ) ( not ( = ?auto_676793 ?auto_676802 ) ) ( not ( = ?auto_676793 ?auto_676803 ) ) ( not ( = ?auto_676793 ?auto_676804 ) ) ( not ( = ?auto_676794 ?auto_676795 ) ) ( not ( = ?auto_676794 ?auto_676796 ) ) ( not ( = ?auto_676794 ?auto_676797 ) ) ( not ( = ?auto_676794 ?auto_676798 ) ) ( not ( = ?auto_676794 ?auto_676799 ) ) ( not ( = ?auto_676794 ?auto_676800 ) ) ( not ( = ?auto_676794 ?auto_676801 ) ) ( not ( = ?auto_676794 ?auto_676802 ) ) ( not ( = ?auto_676794 ?auto_676803 ) ) ( not ( = ?auto_676794 ?auto_676804 ) ) ( not ( = ?auto_676795 ?auto_676796 ) ) ( not ( = ?auto_676795 ?auto_676797 ) ) ( not ( = ?auto_676795 ?auto_676798 ) ) ( not ( = ?auto_676795 ?auto_676799 ) ) ( not ( = ?auto_676795 ?auto_676800 ) ) ( not ( = ?auto_676795 ?auto_676801 ) ) ( not ( = ?auto_676795 ?auto_676802 ) ) ( not ( = ?auto_676795 ?auto_676803 ) ) ( not ( = ?auto_676795 ?auto_676804 ) ) ( not ( = ?auto_676796 ?auto_676797 ) ) ( not ( = ?auto_676796 ?auto_676798 ) ) ( not ( = ?auto_676796 ?auto_676799 ) ) ( not ( = ?auto_676796 ?auto_676800 ) ) ( not ( = ?auto_676796 ?auto_676801 ) ) ( not ( = ?auto_676796 ?auto_676802 ) ) ( not ( = ?auto_676796 ?auto_676803 ) ) ( not ( = ?auto_676796 ?auto_676804 ) ) ( not ( = ?auto_676797 ?auto_676798 ) ) ( not ( = ?auto_676797 ?auto_676799 ) ) ( not ( = ?auto_676797 ?auto_676800 ) ) ( not ( = ?auto_676797 ?auto_676801 ) ) ( not ( = ?auto_676797 ?auto_676802 ) ) ( not ( = ?auto_676797 ?auto_676803 ) ) ( not ( = ?auto_676797 ?auto_676804 ) ) ( not ( = ?auto_676798 ?auto_676799 ) ) ( not ( = ?auto_676798 ?auto_676800 ) ) ( not ( = ?auto_676798 ?auto_676801 ) ) ( not ( = ?auto_676798 ?auto_676802 ) ) ( not ( = ?auto_676798 ?auto_676803 ) ) ( not ( = ?auto_676798 ?auto_676804 ) ) ( not ( = ?auto_676799 ?auto_676800 ) ) ( not ( = ?auto_676799 ?auto_676801 ) ) ( not ( = ?auto_676799 ?auto_676802 ) ) ( not ( = ?auto_676799 ?auto_676803 ) ) ( not ( = ?auto_676799 ?auto_676804 ) ) ( not ( = ?auto_676800 ?auto_676801 ) ) ( not ( = ?auto_676800 ?auto_676802 ) ) ( not ( = ?auto_676800 ?auto_676803 ) ) ( not ( = ?auto_676800 ?auto_676804 ) ) ( not ( = ?auto_676801 ?auto_676802 ) ) ( not ( = ?auto_676801 ?auto_676803 ) ) ( not ( = ?auto_676801 ?auto_676804 ) ) ( not ( = ?auto_676802 ?auto_676803 ) ) ( not ( = ?auto_676802 ?auto_676804 ) ) ( not ( = ?auto_676803 ?auto_676804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_676803 ?auto_676804 )
      ( !STACK ?auto_676803 ?auto_676802 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_676851 - BLOCK
      ?auto_676852 - BLOCK
      ?auto_676853 - BLOCK
      ?auto_676854 - BLOCK
      ?auto_676855 - BLOCK
      ?auto_676856 - BLOCK
      ?auto_676857 - BLOCK
      ?auto_676858 - BLOCK
      ?auto_676859 - BLOCK
      ?auto_676860 - BLOCK
      ?auto_676861 - BLOCK
      ?auto_676862 - BLOCK
      ?auto_676863 - BLOCK
      ?auto_676864 - BLOCK
      ?auto_676865 - BLOCK
    )
    :vars
    (
      ?auto_676866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676865 ?auto_676866 ) ( ON-TABLE ?auto_676851 ) ( ON ?auto_676852 ?auto_676851 ) ( ON ?auto_676853 ?auto_676852 ) ( ON ?auto_676854 ?auto_676853 ) ( ON ?auto_676855 ?auto_676854 ) ( ON ?auto_676856 ?auto_676855 ) ( ON ?auto_676857 ?auto_676856 ) ( ON ?auto_676858 ?auto_676857 ) ( ON ?auto_676859 ?auto_676858 ) ( ON ?auto_676860 ?auto_676859 ) ( ON ?auto_676861 ?auto_676860 ) ( ON ?auto_676862 ?auto_676861 ) ( ON ?auto_676863 ?auto_676862 ) ( not ( = ?auto_676851 ?auto_676852 ) ) ( not ( = ?auto_676851 ?auto_676853 ) ) ( not ( = ?auto_676851 ?auto_676854 ) ) ( not ( = ?auto_676851 ?auto_676855 ) ) ( not ( = ?auto_676851 ?auto_676856 ) ) ( not ( = ?auto_676851 ?auto_676857 ) ) ( not ( = ?auto_676851 ?auto_676858 ) ) ( not ( = ?auto_676851 ?auto_676859 ) ) ( not ( = ?auto_676851 ?auto_676860 ) ) ( not ( = ?auto_676851 ?auto_676861 ) ) ( not ( = ?auto_676851 ?auto_676862 ) ) ( not ( = ?auto_676851 ?auto_676863 ) ) ( not ( = ?auto_676851 ?auto_676864 ) ) ( not ( = ?auto_676851 ?auto_676865 ) ) ( not ( = ?auto_676851 ?auto_676866 ) ) ( not ( = ?auto_676852 ?auto_676853 ) ) ( not ( = ?auto_676852 ?auto_676854 ) ) ( not ( = ?auto_676852 ?auto_676855 ) ) ( not ( = ?auto_676852 ?auto_676856 ) ) ( not ( = ?auto_676852 ?auto_676857 ) ) ( not ( = ?auto_676852 ?auto_676858 ) ) ( not ( = ?auto_676852 ?auto_676859 ) ) ( not ( = ?auto_676852 ?auto_676860 ) ) ( not ( = ?auto_676852 ?auto_676861 ) ) ( not ( = ?auto_676852 ?auto_676862 ) ) ( not ( = ?auto_676852 ?auto_676863 ) ) ( not ( = ?auto_676852 ?auto_676864 ) ) ( not ( = ?auto_676852 ?auto_676865 ) ) ( not ( = ?auto_676852 ?auto_676866 ) ) ( not ( = ?auto_676853 ?auto_676854 ) ) ( not ( = ?auto_676853 ?auto_676855 ) ) ( not ( = ?auto_676853 ?auto_676856 ) ) ( not ( = ?auto_676853 ?auto_676857 ) ) ( not ( = ?auto_676853 ?auto_676858 ) ) ( not ( = ?auto_676853 ?auto_676859 ) ) ( not ( = ?auto_676853 ?auto_676860 ) ) ( not ( = ?auto_676853 ?auto_676861 ) ) ( not ( = ?auto_676853 ?auto_676862 ) ) ( not ( = ?auto_676853 ?auto_676863 ) ) ( not ( = ?auto_676853 ?auto_676864 ) ) ( not ( = ?auto_676853 ?auto_676865 ) ) ( not ( = ?auto_676853 ?auto_676866 ) ) ( not ( = ?auto_676854 ?auto_676855 ) ) ( not ( = ?auto_676854 ?auto_676856 ) ) ( not ( = ?auto_676854 ?auto_676857 ) ) ( not ( = ?auto_676854 ?auto_676858 ) ) ( not ( = ?auto_676854 ?auto_676859 ) ) ( not ( = ?auto_676854 ?auto_676860 ) ) ( not ( = ?auto_676854 ?auto_676861 ) ) ( not ( = ?auto_676854 ?auto_676862 ) ) ( not ( = ?auto_676854 ?auto_676863 ) ) ( not ( = ?auto_676854 ?auto_676864 ) ) ( not ( = ?auto_676854 ?auto_676865 ) ) ( not ( = ?auto_676854 ?auto_676866 ) ) ( not ( = ?auto_676855 ?auto_676856 ) ) ( not ( = ?auto_676855 ?auto_676857 ) ) ( not ( = ?auto_676855 ?auto_676858 ) ) ( not ( = ?auto_676855 ?auto_676859 ) ) ( not ( = ?auto_676855 ?auto_676860 ) ) ( not ( = ?auto_676855 ?auto_676861 ) ) ( not ( = ?auto_676855 ?auto_676862 ) ) ( not ( = ?auto_676855 ?auto_676863 ) ) ( not ( = ?auto_676855 ?auto_676864 ) ) ( not ( = ?auto_676855 ?auto_676865 ) ) ( not ( = ?auto_676855 ?auto_676866 ) ) ( not ( = ?auto_676856 ?auto_676857 ) ) ( not ( = ?auto_676856 ?auto_676858 ) ) ( not ( = ?auto_676856 ?auto_676859 ) ) ( not ( = ?auto_676856 ?auto_676860 ) ) ( not ( = ?auto_676856 ?auto_676861 ) ) ( not ( = ?auto_676856 ?auto_676862 ) ) ( not ( = ?auto_676856 ?auto_676863 ) ) ( not ( = ?auto_676856 ?auto_676864 ) ) ( not ( = ?auto_676856 ?auto_676865 ) ) ( not ( = ?auto_676856 ?auto_676866 ) ) ( not ( = ?auto_676857 ?auto_676858 ) ) ( not ( = ?auto_676857 ?auto_676859 ) ) ( not ( = ?auto_676857 ?auto_676860 ) ) ( not ( = ?auto_676857 ?auto_676861 ) ) ( not ( = ?auto_676857 ?auto_676862 ) ) ( not ( = ?auto_676857 ?auto_676863 ) ) ( not ( = ?auto_676857 ?auto_676864 ) ) ( not ( = ?auto_676857 ?auto_676865 ) ) ( not ( = ?auto_676857 ?auto_676866 ) ) ( not ( = ?auto_676858 ?auto_676859 ) ) ( not ( = ?auto_676858 ?auto_676860 ) ) ( not ( = ?auto_676858 ?auto_676861 ) ) ( not ( = ?auto_676858 ?auto_676862 ) ) ( not ( = ?auto_676858 ?auto_676863 ) ) ( not ( = ?auto_676858 ?auto_676864 ) ) ( not ( = ?auto_676858 ?auto_676865 ) ) ( not ( = ?auto_676858 ?auto_676866 ) ) ( not ( = ?auto_676859 ?auto_676860 ) ) ( not ( = ?auto_676859 ?auto_676861 ) ) ( not ( = ?auto_676859 ?auto_676862 ) ) ( not ( = ?auto_676859 ?auto_676863 ) ) ( not ( = ?auto_676859 ?auto_676864 ) ) ( not ( = ?auto_676859 ?auto_676865 ) ) ( not ( = ?auto_676859 ?auto_676866 ) ) ( not ( = ?auto_676860 ?auto_676861 ) ) ( not ( = ?auto_676860 ?auto_676862 ) ) ( not ( = ?auto_676860 ?auto_676863 ) ) ( not ( = ?auto_676860 ?auto_676864 ) ) ( not ( = ?auto_676860 ?auto_676865 ) ) ( not ( = ?auto_676860 ?auto_676866 ) ) ( not ( = ?auto_676861 ?auto_676862 ) ) ( not ( = ?auto_676861 ?auto_676863 ) ) ( not ( = ?auto_676861 ?auto_676864 ) ) ( not ( = ?auto_676861 ?auto_676865 ) ) ( not ( = ?auto_676861 ?auto_676866 ) ) ( not ( = ?auto_676862 ?auto_676863 ) ) ( not ( = ?auto_676862 ?auto_676864 ) ) ( not ( = ?auto_676862 ?auto_676865 ) ) ( not ( = ?auto_676862 ?auto_676866 ) ) ( not ( = ?auto_676863 ?auto_676864 ) ) ( not ( = ?auto_676863 ?auto_676865 ) ) ( not ( = ?auto_676863 ?auto_676866 ) ) ( not ( = ?auto_676864 ?auto_676865 ) ) ( not ( = ?auto_676864 ?auto_676866 ) ) ( not ( = ?auto_676865 ?auto_676866 ) ) ( CLEAR ?auto_676863 ) ( ON ?auto_676864 ?auto_676865 ) ( CLEAR ?auto_676864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_676851 ?auto_676852 ?auto_676853 ?auto_676854 ?auto_676855 ?auto_676856 ?auto_676857 ?auto_676858 ?auto_676859 ?auto_676860 ?auto_676861 ?auto_676862 ?auto_676863 ?auto_676864 )
      ( MAKE-15PILE ?auto_676851 ?auto_676852 ?auto_676853 ?auto_676854 ?auto_676855 ?auto_676856 ?auto_676857 ?auto_676858 ?auto_676859 ?auto_676860 ?auto_676861 ?auto_676862 ?auto_676863 ?auto_676864 ?auto_676865 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_676913 - BLOCK
      ?auto_676914 - BLOCK
      ?auto_676915 - BLOCK
      ?auto_676916 - BLOCK
      ?auto_676917 - BLOCK
      ?auto_676918 - BLOCK
      ?auto_676919 - BLOCK
      ?auto_676920 - BLOCK
      ?auto_676921 - BLOCK
      ?auto_676922 - BLOCK
      ?auto_676923 - BLOCK
      ?auto_676924 - BLOCK
      ?auto_676925 - BLOCK
      ?auto_676926 - BLOCK
      ?auto_676927 - BLOCK
    )
    :vars
    (
      ?auto_676928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676927 ?auto_676928 ) ( ON-TABLE ?auto_676913 ) ( ON ?auto_676914 ?auto_676913 ) ( ON ?auto_676915 ?auto_676914 ) ( ON ?auto_676916 ?auto_676915 ) ( ON ?auto_676917 ?auto_676916 ) ( ON ?auto_676918 ?auto_676917 ) ( ON ?auto_676919 ?auto_676918 ) ( ON ?auto_676920 ?auto_676919 ) ( ON ?auto_676921 ?auto_676920 ) ( ON ?auto_676922 ?auto_676921 ) ( ON ?auto_676923 ?auto_676922 ) ( ON ?auto_676924 ?auto_676923 ) ( not ( = ?auto_676913 ?auto_676914 ) ) ( not ( = ?auto_676913 ?auto_676915 ) ) ( not ( = ?auto_676913 ?auto_676916 ) ) ( not ( = ?auto_676913 ?auto_676917 ) ) ( not ( = ?auto_676913 ?auto_676918 ) ) ( not ( = ?auto_676913 ?auto_676919 ) ) ( not ( = ?auto_676913 ?auto_676920 ) ) ( not ( = ?auto_676913 ?auto_676921 ) ) ( not ( = ?auto_676913 ?auto_676922 ) ) ( not ( = ?auto_676913 ?auto_676923 ) ) ( not ( = ?auto_676913 ?auto_676924 ) ) ( not ( = ?auto_676913 ?auto_676925 ) ) ( not ( = ?auto_676913 ?auto_676926 ) ) ( not ( = ?auto_676913 ?auto_676927 ) ) ( not ( = ?auto_676913 ?auto_676928 ) ) ( not ( = ?auto_676914 ?auto_676915 ) ) ( not ( = ?auto_676914 ?auto_676916 ) ) ( not ( = ?auto_676914 ?auto_676917 ) ) ( not ( = ?auto_676914 ?auto_676918 ) ) ( not ( = ?auto_676914 ?auto_676919 ) ) ( not ( = ?auto_676914 ?auto_676920 ) ) ( not ( = ?auto_676914 ?auto_676921 ) ) ( not ( = ?auto_676914 ?auto_676922 ) ) ( not ( = ?auto_676914 ?auto_676923 ) ) ( not ( = ?auto_676914 ?auto_676924 ) ) ( not ( = ?auto_676914 ?auto_676925 ) ) ( not ( = ?auto_676914 ?auto_676926 ) ) ( not ( = ?auto_676914 ?auto_676927 ) ) ( not ( = ?auto_676914 ?auto_676928 ) ) ( not ( = ?auto_676915 ?auto_676916 ) ) ( not ( = ?auto_676915 ?auto_676917 ) ) ( not ( = ?auto_676915 ?auto_676918 ) ) ( not ( = ?auto_676915 ?auto_676919 ) ) ( not ( = ?auto_676915 ?auto_676920 ) ) ( not ( = ?auto_676915 ?auto_676921 ) ) ( not ( = ?auto_676915 ?auto_676922 ) ) ( not ( = ?auto_676915 ?auto_676923 ) ) ( not ( = ?auto_676915 ?auto_676924 ) ) ( not ( = ?auto_676915 ?auto_676925 ) ) ( not ( = ?auto_676915 ?auto_676926 ) ) ( not ( = ?auto_676915 ?auto_676927 ) ) ( not ( = ?auto_676915 ?auto_676928 ) ) ( not ( = ?auto_676916 ?auto_676917 ) ) ( not ( = ?auto_676916 ?auto_676918 ) ) ( not ( = ?auto_676916 ?auto_676919 ) ) ( not ( = ?auto_676916 ?auto_676920 ) ) ( not ( = ?auto_676916 ?auto_676921 ) ) ( not ( = ?auto_676916 ?auto_676922 ) ) ( not ( = ?auto_676916 ?auto_676923 ) ) ( not ( = ?auto_676916 ?auto_676924 ) ) ( not ( = ?auto_676916 ?auto_676925 ) ) ( not ( = ?auto_676916 ?auto_676926 ) ) ( not ( = ?auto_676916 ?auto_676927 ) ) ( not ( = ?auto_676916 ?auto_676928 ) ) ( not ( = ?auto_676917 ?auto_676918 ) ) ( not ( = ?auto_676917 ?auto_676919 ) ) ( not ( = ?auto_676917 ?auto_676920 ) ) ( not ( = ?auto_676917 ?auto_676921 ) ) ( not ( = ?auto_676917 ?auto_676922 ) ) ( not ( = ?auto_676917 ?auto_676923 ) ) ( not ( = ?auto_676917 ?auto_676924 ) ) ( not ( = ?auto_676917 ?auto_676925 ) ) ( not ( = ?auto_676917 ?auto_676926 ) ) ( not ( = ?auto_676917 ?auto_676927 ) ) ( not ( = ?auto_676917 ?auto_676928 ) ) ( not ( = ?auto_676918 ?auto_676919 ) ) ( not ( = ?auto_676918 ?auto_676920 ) ) ( not ( = ?auto_676918 ?auto_676921 ) ) ( not ( = ?auto_676918 ?auto_676922 ) ) ( not ( = ?auto_676918 ?auto_676923 ) ) ( not ( = ?auto_676918 ?auto_676924 ) ) ( not ( = ?auto_676918 ?auto_676925 ) ) ( not ( = ?auto_676918 ?auto_676926 ) ) ( not ( = ?auto_676918 ?auto_676927 ) ) ( not ( = ?auto_676918 ?auto_676928 ) ) ( not ( = ?auto_676919 ?auto_676920 ) ) ( not ( = ?auto_676919 ?auto_676921 ) ) ( not ( = ?auto_676919 ?auto_676922 ) ) ( not ( = ?auto_676919 ?auto_676923 ) ) ( not ( = ?auto_676919 ?auto_676924 ) ) ( not ( = ?auto_676919 ?auto_676925 ) ) ( not ( = ?auto_676919 ?auto_676926 ) ) ( not ( = ?auto_676919 ?auto_676927 ) ) ( not ( = ?auto_676919 ?auto_676928 ) ) ( not ( = ?auto_676920 ?auto_676921 ) ) ( not ( = ?auto_676920 ?auto_676922 ) ) ( not ( = ?auto_676920 ?auto_676923 ) ) ( not ( = ?auto_676920 ?auto_676924 ) ) ( not ( = ?auto_676920 ?auto_676925 ) ) ( not ( = ?auto_676920 ?auto_676926 ) ) ( not ( = ?auto_676920 ?auto_676927 ) ) ( not ( = ?auto_676920 ?auto_676928 ) ) ( not ( = ?auto_676921 ?auto_676922 ) ) ( not ( = ?auto_676921 ?auto_676923 ) ) ( not ( = ?auto_676921 ?auto_676924 ) ) ( not ( = ?auto_676921 ?auto_676925 ) ) ( not ( = ?auto_676921 ?auto_676926 ) ) ( not ( = ?auto_676921 ?auto_676927 ) ) ( not ( = ?auto_676921 ?auto_676928 ) ) ( not ( = ?auto_676922 ?auto_676923 ) ) ( not ( = ?auto_676922 ?auto_676924 ) ) ( not ( = ?auto_676922 ?auto_676925 ) ) ( not ( = ?auto_676922 ?auto_676926 ) ) ( not ( = ?auto_676922 ?auto_676927 ) ) ( not ( = ?auto_676922 ?auto_676928 ) ) ( not ( = ?auto_676923 ?auto_676924 ) ) ( not ( = ?auto_676923 ?auto_676925 ) ) ( not ( = ?auto_676923 ?auto_676926 ) ) ( not ( = ?auto_676923 ?auto_676927 ) ) ( not ( = ?auto_676923 ?auto_676928 ) ) ( not ( = ?auto_676924 ?auto_676925 ) ) ( not ( = ?auto_676924 ?auto_676926 ) ) ( not ( = ?auto_676924 ?auto_676927 ) ) ( not ( = ?auto_676924 ?auto_676928 ) ) ( not ( = ?auto_676925 ?auto_676926 ) ) ( not ( = ?auto_676925 ?auto_676927 ) ) ( not ( = ?auto_676925 ?auto_676928 ) ) ( not ( = ?auto_676926 ?auto_676927 ) ) ( not ( = ?auto_676926 ?auto_676928 ) ) ( not ( = ?auto_676927 ?auto_676928 ) ) ( ON ?auto_676926 ?auto_676927 ) ( CLEAR ?auto_676924 ) ( ON ?auto_676925 ?auto_676926 ) ( CLEAR ?auto_676925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_676913 ?auto_676914 ?auto_676915 ?auto_676916 ?auto_676917 ?auto_676918 ?auto_676919 ?auto_676920 ?auto_676921 ?auto_676922 ?auto_676923 ?auto_676924 ?auto_676925 )
      ( MAKE-15PILE ?auto_676913 ?auto_676914 ?auto_676915 ?auto_676916 ?auto_676917 ?auto_676918 ?auto_676919 ?auto_676920 ?auto_676921 ?auto_676922 ?auto_676923 ?auto_676924 ?auto_676925 ?auto_676926 ?auto_676927 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_676975 - BLOCK
      ?auto_676976 - BLOCK
      ?auto_676977 - BLOCK
      ?auto_676978 - BLOCK
      ?auto_676979 - BLOCK
      ?auto_676980 - BLOCK
      ?auto_676981 - BLOCK
      ?auto_676982 - BLOCK
      ?auto_676983 - BLOCK
      ?auto_676984 - BLOCK
      ?auto_676985 - BLOCK
      ?auto_676986 - BLOCK
      ?auto_676987 - BLOCK
      ?auto_676988 - BLOCK
      ?auto_676989 - BLOCK
    )
    :vars
    (
      ?auto_676990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676989 ?auto_676990 ) ( ON-TABLE ?auto_676975 ) ( ON ?auto_676976 ?auto_676975 ) ( ON ?auto_676977 ?auto_676976 ) ( ON ?auto_676978 ?auto_676977 ) ( ON ?auto_676979 ?auto_676978 ) ( ON ?auto_676980 ?auto_676979 ) ( ON ?auto_676981 ?auto_676980 ) ( ON ?auto_676982 ?auto_676981 ) ( ON ?auto_676983 ?auto_676982 ) ( ON ?auto_676984 ?auto_676983 ) ( ON ?auto_676985 ?auto_676984 ) ( not ( = ?auto_676975 ?auto_676976 ) ) ( not ( = ?auto_676975 ?auto_676977 ) ) ( not ( = ?auto_676975 ?auto_676978 ) ) ( not ( = ?auto_676975 ?auto_676979 ) ) ( not ( = ?auto_676975 ?auto_676980 ) ) ( not ( = ?auto_676975 ?auto_676981 ) ) ( not ( = ?auto_676975 ?auto_676982 ) ) ( not ( = ?auto_676975 ?auto_676983 ) ) ( not ( = ?auto_676975 ?auto_676984 ) ) ( not ( = ?auto_676975 ?auto_676985 ) ) ( not ( = ?auto_676975 ?auto_676986 ) ) ( not ( = ?auto_676975 ?auto_676987 ) ) ( not ( = ?auto_676975 ?auto_676988 ) ) ( not ( = ?auto_676975 ?auto_676989 ) ) ( not ( = ?auto_676975 ?auto_676990 ) ) ( not ( = ?auto_676976 ?auto_676977 ) ) ( not ( = ?auto_676976 ?auto_676978 ) ) ( not ( = ?auto_676976 ?auto_676979 ) ) ( not ( = ?auto_676976 ?auto_676980 ) ) ( not ( = ?auto_676976 ?auto_676981 ) ) ( not ( = ?auto_676976 ?auto_676982 ) ) ( not ( = ?auto_676976 ?auto_676983 ) ) ( not ( = ?auto_676976 ?auto_676984 ) ) ( not ( = ?auto_676976 ?auto_676985 ) ) ( not ( = ?auto_676976 ?auto_676986 ) ) ( not ( = ?auto_676976 ?auto_676987 ) ) ( not ( = ?auto_676976 ?auto_676988 ) ) ( not ( = ?auto_676976 ?auto_676989 ) ) ( not ( = ?auto_676976 ?auto_676990 ) ) ( not ( = ?auto_676977 ?auto_676978 ) ) ( not ( = ?auto_676977 ?auto_676979 ) ) ( not ( = ?auto_676977 ?auto_676980 ) ) ( not ( = ?auto_676977 ?auto_676981 ) ) ( not ( = ?auto_676977 ?auto_676982 ) ) ( not ( = ?auto_676977 ?auto_676983 ) ) ( not ( = ?auto_676977 ?auto_676984 ) ) ( not ( = ?auto_676977 ?auto_676985 ) ) ( not ( = ?auto_676977 ?auto_676986 ) ) ( not ( = ?auto_676977 ?auto_676987 ) ) ( not ( = ?auto_676977 ?auto_676988 ) ) ( not ( = ?auto_676977 ?auto_676989 ) ) ( not ( = ?auto_676977 ?auto_676990 ) ) ( not ( = ?auto_676978 ?auto_676979 ) ) ( not ( = ?auto_676978 ?auto_676980 ) ) ( not ( = ?auto_676978 ?auto_676981 ) ) ( not ( = ?auto_676978 ?auto_676982 ) ) ( not ( = ?auto_676978 ?auto_676983 ) ) ( not ( = ?auto_676978 ?auto_676984 ) ) ( not ( = ?auto_676978 ?auto_676985 ) ) ( not ( = ?auto_676978 ?auto_676986 ) ) ( not ( = ?auto_676978 ?auto_676987 ) ) ( not ( = ?auto_676978 ?auto_676988 ) ) ( not ( = ?auto_676978 ?auto_676989 ) ) ( not ( = ?auto_676978 ?auto_676990 ) ) ( not ( = ?auto_676979 ?auto_676980 ) ) ( not ( = ?auto_676979 ?auto_676981 ) ) ( not ( = ?auto_676979 ?auto_676982 ) ) ( not ( = ?auto_676979 ?auto_676983 ) ) ( not ( = ?auto_676979 ?auto_676984 ) ) ( not ( = ?auto_676979 ?auto_676985 ) ) ( not ( = ?auto_676979 ?auto_676986 ) ) ( not ( = ?auto_676979 ?auto_676987 ) ) ( not ( = ?auto_676979 ?auto_676988 ) ) ( not ( = ?auto_676979 ?auto_676989 ) ) ( not ( = ?auto_676979 ?auto_676990 ) ) ( not ( = ?auto_676980 ?auto_676981 ) ) ( not ( = ?auto_676980 ?auto_676982 ) ) ( not ( = ?auto_676980 ?auto_676983 ) ) ( not ( = ?auto_676980 ?auto_676984 ) ) ( not ( = ?auto_676980 ?auto_676985 ) ) ( not ( = ?auto_676980 ?auto_676986 ) ) ( not ( = ?auto_676980 ?auto_676987 ) ) ( not ( = ?auto_676980 ?auto_676988 ) ) ( not ( = ?auto_676980 ?auto_676989 ) ) ( not ( = ?auto_676980 ?auto_676990 ) ) ( not ( = ?auto_676981 ?auto_676982 ) ) ( not ( = ?auto_676981 ?auto_676983 ) ) ( not ( = ?auto_676981 ?auto_676984 ) ) ( not ( = ?auto_676981 ?auto_676985 ) ) ( not ( = ?auto_676981 ?auto_676986 ) ) ( not ( = ?auto_676981 ?auto_676987 ) ) ( not ( = ?auto_676981 ?auto_676988 ) ) ( not ( = ?auto_676981 ?auto_676989 ) ) ( not ( = ?auto_676981 ?auto_676990 ) ) ( not ( = ?auto_676982 ?auto_676983 ) ) ( not ( = ?auto_676982 ?auto_676984 ) ) ( not ( = ?auto_676982 ?auto_676985 ) ) ( not ( = ?auto_676982 ?auto_676986 ) ) ( not ( = ?auto_676982 ?auto_676987 ) ) ( not ( = ?auto_676982 ?auto_676988 ) ) ( not ( = ?auto_676982 ?auto_676989 ) ) ( not ( = ?auto_676982 ?auto_676990 ) ) ( not ( = ?auto_676983 ?auto_676984 ) ) ( not ( = ?auto_676983 ?auto_676985 ) ) ( not ( = ?auto_676983 ?auto_676986 ) ) ( not ( = ?auto_676983 ?auto_676987 ) ) ( not ( = ?auto_676983 ?auto_676988 ) ) ( not ( = ?auto_676983 ?auto_676989 ) ) ( not ( = ?auto_676983 ?auto_676990 ) ) ( not ( = ?auto_676984 ?auto_676985 ) ) ( not ( = ?auto_676984 ?auto_676986 ) ) ( not ( = ?auto_676984 ?auto_676987 ) ) ( not ( = ?auto_676984 ?auto_676988 ) ) ( not ( = ?auto_676984 ?auto_676989 ) ) ( not ( = ?auto_676984 ?auto_676990 ) ) ( not ( = ?auto_676985 ?auto_676986 ) ) ( not ( = ?auto_676985 ?auto_676987 ) ) ( not ( = ?auto_676985 ?auto_676988 ) ) ( not ( = ?auto_676985 ?auto_676989 ) ) ( not ( = ?auto_676985 ?auto_676990 ) ) ( not ( = ?auto_676986 ?auto_676987 ) ) ( not ( = ?auto_676986 ?auto_676988 ) ) ( not ( = ?auto_676986 ?auto_676989 ) ) ( not ( = ?auto_676986 ?auto_676990 ) ) ( not ( = ?auto_676987 ?auto_676988 ) ) ( not ( = ?auto_676987 ?auto_676989 ) ) ( not ( = ?auto_676987 ?auto_676990 ) ) ( not ( = ?auto_676988 ?auto_676989 ) ) ( not ( = ?auto_676988 ?auto_676990 ) ) ( not ( = ?auto_676989 ?auto_676990 ) ) ( ON ?auto_676988 ?auto_676989 ) ( ON ?auto_676987 ?auto_676988 ) ( CLEAR ?auto_676985 ) ( ON ?auto_676986 ?auto_676987 ) ( CLEAR ?auto_676986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_676975 ?auto_676976 ?auto_676977 ?auto_676978 ?auto_676979 ?auto_676980 ?auto_676981 ?auto_676982 ?auto_676983 ?auto_676984 ?auto_676985 ?auto_676986 )
      ( MAKE-15PILE ?auto_676975 ?auto_676976 ?auto_676977 ?auto_676978 ?auto_676979 ?auto_676980 ?auto_676981 ?auto_676982 ?auto_676983 ?auto_676984 ?auto_676985 ?auto_676986 ?auto_676987 ?auto_676988 ?auto_676989 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677037 - BLOCK
      ?auto_677038 - BLOCK
      ?auto_677039 - BLOCK
      ?auto_677040 - BLOCK
      ?auto_677041 - BLOCK
      ?auto_677042 - BLOCK
      ?auto_677043 - BLOCK
      ?auto_677044 - BLOCK
      ?auto_677045 - BLOCK
      ?auto_677046 - BLOCK
      ?auto_677047 - BLOCK
      ?auto_677048 - BLOCK
      ?auto_677049 - BLOCK
      ?auto_677050 - BLOCK
      ?auto_677051 - BLOCK
    )
    :vars
    (
      ?auto_677052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677051 ?auto_677052 ) ( ON-TABLE ?auto_677037 ) ( ON ?auto_677038 ?auto_677037 ) ( ON ?auto_677039 ?auto_677038 ) ( ON ?auto_677040 ?auto_677039 ) ( ON ?auto_677041 ?auto_677040 ) ( ON ?auto_677042 ?auto_677041 ) ( ON ?auto_677043 ?auto_677042 ) ( ON ?auto_677044 ?auto_677043 ) ( ON ?auto_677045 ?auto_677044 ) ( ON ?auto_677046 ?auto_677045 ) ( not ( = ?auto_677037 ?auto_677038 ) ) ( not ( = ?auto_677037 ?auto_677039 ) ) ( not ( = ?auto_677037 ?auto_677040 ) ) ( not ( = ?auto_677037 ?auto_677041 ) ) ( not ( = ?auto_677037 ?auto_677042 ) ) ( not ( = ?auto_677037 ?auto_677043 ) ) ( not ( = ?auto_677037 ?auto_677044 ) ) ( not ( = ?auto_677037 ?auto_677045 ) ) ( not ( = ?auto_677037 ?auto_677046 ) ) ( not ( = ?auto_677037 ?auto_677047 ) ) ( not ( = ?auto_677037 ?auto_677048 ) ) ( not ( = ?auto_677037 ?auto_677049 ) ) ( not ( = ?auto_677037 ?auto_677050 ) ) ( not ( = ?auto_677037 ?auto_677051 ) ) ( not ( = ?auto_677037 ?auto_677052 ) ) ( not ( = ?auto_677038 ?auto_677039 ) ) ( not ( = ?auto_677038 ?auto_677040 ) ) ( not ( = ?auto_677038 ?auto_677041 ) ) ( not ( = ?auto_677038 ?auto_677042 ) ) ( not ( = ?auto_677038 ?auto_677043 ) ) ( not ( = ?auto_677038 ?auto_677044 ) ) ( not ( = ?auto_677038 ?auto_677045 ) ) ( not ( = ?auto_677038 ?auto_677046 ) ) ( not ( = ?auto_677038 ?auto_677047 ) ) ( not ( = ?auto_677038 ?auto_677048 ) ) ( not ( = ?auto_677038 ?auto_677049 ) ) ( not ( = ?auto_677038 ?auto_677050 ) ) ( not ( = ?auto_677038 ?auto_677051 ) ) ( not ( = ?auto_677038 ?auto_677052 ) ) ( not ( = ?auto_677039 ?auto_677040 ) ) ( not ( = ?auto_677039 ?auto_677041 ) ) ( not ( = ?auto_677039 ?auto_677042 ) ) ( not ( = ?auto_677039 ?auto_677043 ) ) ( not ( = ?auto_677039 ?auto_677044 ) ) ( not ( = ?auto_677039 ?auto_677045 ) ) ( not ( = ?auto_677039 ?auto_677046 ) ) ( not ( = ?auto_677039 ?auto_677047 ) ) ( not ( = ?auto_677039 ?auto_677048 ) ) ( not ( = ?auto_677039 ?auto_677049 ) ) ( not ( = ?auto_677039 ?auto_677050 ) ) ( not ( = ?auto_677039 ?auto_677051 ) ) ( not ( = ?auto_677039 ?auto_677052 ) ) ( not ( = ?auto_677040 ?auto_677041 ) ) ( not ( = ?auto_677040 ?auto_677042 ) ) ( not ( = ?auto_677040 ?auto_677043 ) ) ( not ( = ?auto_677040 ?auto_677044 ) ) ( not ( = ?auto_677040 ?auto_677045 ) ) ( not ( = ?auto_677040 ?auto_677046 ) ) ( not ( = ?auto_677040 ?auto_677047 ) ) ( not ( = ?auto_677040 ?auto_677048 ) ) ( not ( = ?auto_677040 ?auto_677049 ) ) ( not ( = ?auto_677040 ?auto_677050 ) ) ( not ( = ?auto_677040 ?auto_677051 ) ) ( not ( = ?auto_677040 ?auto_677052 ) ) ( not ( = ?auto_677041 ?auto_677042 ) ) ( not ( = ?auto_677041 ?auto_677043 ) ) ( not ( = ?auto_677041 ?auto_677044 ) ) ( not ( = ?auto_677041 ?auto_677045 ) ) ( not ( = ?auto_677041 ?auto_677046 ) ) ( not ( = ?auto_677041 ?auto_677047 ) ) ( not ( = ?auto_677041 ?auto_677048 ) ) ( not ( = ?auto_677041 ?auto_677049 ) ) ( not ( = ?auto_677041 ?auto_677050 ) ) ( not ( = ?auto_677041 ?auto_677051 ) ) ( not ( = ?auto_677041 ?auto_677052 ) ) ( not ( = ?auto_677042 ?auto_677043 ) ) ( not ( = ?auto_677042 ?auto_677044 ) ) ( not ( = ?auto_677042 ?auto_677045 ) ) ( not ( = ?auto_677042 ?auto_677046 ) ) ( not ( = ?auto_677042 ?auto_677047 ) ) ( not ( = ?auto_677042 ?auto_677048 ) ) ( not ( = ?auto_677042 ?auto_677049 ) ) ( not ( = ?auto_677042 ?auto_677050 ) ) ( not ( = ?auto_677042 ?auto_677051 ) ) ( not ( = ?auto_677042 ?auto_677052 ) ) ( not ( = ?auto_677043 ?auto_677044 ) ) ( not ( = ?auto_677043 ?auto_677045 ) ) ( not ( = ?auto_677043 ?auto_677046 ) ) ( not ( = ?auto_677043 ?auto_677047 ) ) ( not ( = ?auto_677043 ?auto_677048 ) ) ( not ( = ?auto_677043 ?auto_677049 ) ) ( not ( = ?auto_677043 ?auto_677050 ) ) ( not ( = ?auto_677043 ?auto_677051 ) ) ( not ( = ?auto_677043 ?auto_677052 ) ) ( not ( = ?auto_677044 ?auto_677045 ) ) ( not ( = ?auto_677044 ?auto_677046 ) ) ( not ( = ?auto_677044 ?auto_677047 ) ) ( not ( = ?auto_677044 ?auto_677048 ) ) ( not ( = ?auto_677044 ?auto_677049 ) ) ( not ( = ?auto_677044 ?auto_677050 ) ) ( not ( = ?auto_677044 ?auto_677051 ) ) ( not ( = ?auto_677044 ?auto_677052 ) ) ( not ( = ?auto_677045 ?auto_677046 ) ) ( not ( = ?auto_677045 ?auto_677047 ) ) ( not ( = ?auto_677045 ?auto_677048 ) ) ( not ( = ?auto_677045 ?auto_677049 ) ) ( not ( = ?auto_677045 ?auto_677050 ) ) ( not ( = ?auto_677045 ?auto_677051 ) ) ( not ( = ?auto_677045 ?auto_677052 ) ) ( not ( = ?auto_677046 ?auto_677047 ) ) ( not ( = ?auto_677046 ?auto_677048 ) ) ( not ( = ?auto_677046 ?auto_677049 ) ) ( not ( = ?auto_677046 ?auto_677050 ) ) ( not ( = ?auto_677046 ?auto_677051 ) ) ( not ( = ?auto_677046 ?auto_677052 ) ) ( not ( = ?auto_677047 ?auto_677048 ) ) ( not ( = ?auto_677047 ?auto_677049 ) ) ( not ( = ?auto_677047 ?auto_677050 ) ) ( not ( = ?auto_677047 ?auto_677051 ) ) ( not ( = ?auto_677047 ?auto_677052 ) ) ( not ( = ?auto_677048 ?auto_677049 ) ) ( not ( = ?auto_677048 ?auto_677050 ) ) ( not ( = ?auto_677048 ?auto_677051 ) ) ( not ( = ?auto_677048 ?auto_677052 ) ) ( not ( = ?auto_677049 ?auto_677050 ) ) ( not ( = ?auto_677049 ?auto_677051 ) ) ( not ( = ?auto_677049 ?auto_677052 ) ) ( not ( = ?auto_677050 ?auto_677051 ) ) ( not ( = ?auto_677050 ?auto_677052 ) ) ( not ( = ?auto_677051 ?auto_677052 ) ) ( ON ?auto_677050 ?auto_677051 ) ( ON ?auto_677049 ?auto_677050 ) ( ON ?auto_677048 ?auto_677049 ) ( CLEAR ?auto_677046 ) ( ON ?auto_677047 ?auto_677048 ) ( CLEAR ?auto_677047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_677037 ?auto_677038 ?auto_677039 ?auto_677040 ?auto_677041 ?auto_677042 ?auto_677043 ?auto_677044 ?auto_677045 ?auto_677046 ?auto_677047 )
      ( MAKE-15PILE ?auto_677037 ?auto_677038 ?auto_677039 ?auto_677040 ?auto_677041 ?auto_677042 ?auto_677043 ?auto_677044 ?auto_677045 ?auto_677046 ?auto_677047 ?auto_677048 ?auto_677049 ?auto_677050 ?auto_677051 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677099 - BLOCK
      ?auto_677100 - BLOCK
      ?auto_677101 - BLOCK
      ?auto_677102 - BLOCK
      ?auto_677103 - BLOCK
      ?auto_677104 - BLOCK
      ?auto_677105 - BLOCK
      ?auto_677106 - BLOCK
      ?auto_677107 - BLOCK
      ?auto_677108 - BLOCK
      ?auto_677109 - BLOCK
      ?auto_677110 - BLOCK
      ?auto_677111 - BLOCK
      ?auto_677112 - BLOCK
      ?auto_677113 - BLOCK
    )
    :vars
    (
      ?auto_677114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677113 ?auto_677114 ) ( ON-TABLE ?auto_677099 ) ( ON ?auto_677100 ?auto_677099 ) ( ON ?auto_677101 ?auto_677100 ) ( ON ?auto_677102 ?auto_677101 ) ( ON ?auto_677103 ?auto_677102 ) ( ON ?auto_677104 ?auto_677103 ) ( ON ?auto_677105 ?auto_677104 ) ( ON ?auto_677106 ?auto_677105 ) ( ON ?auto_677107 ?auto_677106 ) ( not ( = ?auto_677099 ?auto_677100 ) ) ( not ( = ?auto_677099 ?auto_677101 ) ) ( not ( = ?auto_677099 ?auto_677102 ) ) ( not ( = ?auto_677099 ?auto_677103 ) ) ( not ( = ?auto_677099 ?auto_677104 ) ) ( not ( = ?auto_677099 ?auto_677105 ) ) ( not ( = ?auto_677099 ?auto_677106 ) ) ( not ( = ?auto_677099 ?auto_677107 ) ) ( not ( = ?auto_677099 ?auto_677108 ) ) ( not ( = ?auto_677099 ?auto_677109 ) ) ( not ( = ?auto_677099 ?auto_677110 ) ) ( not ( = ?auto_677099 ?auto_677111 ) ) ( not ( = ?auto_677099 ?auto_677112 ) ) ( not ( = ?auto_677099 ?auto_677113 ) ) ( not ( = ?auto_677099 ?auto_677114 ) ) ( not ( = ?auto_677100 ?auto_677101 ) ) ( not ( = ?auto_677100 ?auto_677102 ) ) ( not ( = ?auto_677100 ?auto_677103 ) ) ( not ( = ?auto_677100 ?auto_677104 ) ) ( not ( = ?auto_677100 ?auto_677105 ) ) ( not ( = ?auto_677100 ?auto_677106 ) ) ( not ( = ?auto_677100 ?auto_677107 ) ) ( not ( = ?auto_677100 ?auto_677108 ) ) ( not ( = ?auto_677100 ?auto_677109 ) ) ( not ( = ?auto_677100 ?auto_677110 ) ) ( not ( = ?auto_677100 ?auto_677111 ) ) ( not ( = ?auto_677100 ?auto_677112 ) ) ( not ( = ?auto_677100 ?auto_677113 ) ) ( not ( = ?auto_677100 ?auto_677114 ) ) ( not ( = ?auto_677101 ?auto_677102 ) ) ( not ( = ?auto_677101 ?auto_677103 ) ) ( not ( = ?auto_677101 ?auto_677104 ) ) ( not ( = ?auto_677101 ?auto_677105 ) ) ( not ( = ?auto_677101 ?auto_677106 ) ) ( not ( = ?auto_677101 ?auto_677107 ) ) ( not ( = ?auto_677101 ?auto_677108 ) ) ( not ( = ?auto_677101 ?auto_677109 ) ) ( not ( = ?auto_677101 ?auto_677110 ) ) ( not ( = ?auto_677101 ?auto_677111 ) ) ( not ( = ?auto_677101 ?auto_677112 ) ) ( not ( = ?auto_677101 ?auto_677113 ) ) ( not ( = ?auto_677101 ?auto_677114 ) ) ( not ( = ?auto_677102 ?auto_677103 ) ) ( not ( = ?auto_677102 ?auto_677104 ) ) ( not ( = ?auto_677102 ?auto_677105 ) ) ( not ( = ?auto_677102 ?auto_677106 ) ) ( not ( = ?auto_677102 ?auto_677107 ) ) ( not ( = ?auto_677102 ?auto_677108 ) ) ( not ( = ?auto_677102 ?auto_677109 ) ) ( not ( = ?auto_677102 ?auto_677110 ) ) ( not ( = ?auto_677102 ?auto_677111 ) ) ( not ( = ?auto_677102 ?auto_677112 ) ) ( not ( = ?auto_677102 ?auto_677113 ) ) ( not ( = ?auto_677102 ?auto_677114 ) ) ( not ( = ?auto_677103 ?auto_677104 ) ) ( not ( = ?auto_677103 ?auto_677105 ) ) ( not ( = ?auto_677103 ?auto_677106 ) ) ( not ( = ?auto_677103 ?auto_677107 ) ) ( not ( = ?auto_677103 ?auto_677108 ) ) ( not ( = ?auto_677103 ?auto_677109 ) ) ( not ( = ?auto_677103 ?auto_677110 ) ) ( not ( = ?auto_677103 ?auto_677111 ) ) ( not ( = ?auto_677103 ?auto_677112 ) ) ( not ( = ?auto_677103 ?auto_677113 ) ) ( not ( = ?auto_677103 ?auto_677114 ) ) ( not ( = ?auto_677104 ?auto_677105 ) ) ( not ( = ?auto_677104 ?auto_677106 ) ) ( not ( = ?auto_677104 ?auto_677107 ) ) ( not ( = ?auto_677104 ?auto_677108 ) ) ( not ( = ?auto_677104 ?auto_677109 ) ) ( not ( = ?auto_677104 ?auto_677110 ) ) ( not ( = ?auto_677104 ?auto_677111 ) ) ( not ( = ?auto_677104 ?auto_677112 ) ) ( not ( = ?auto_677104 ?auto_677113 ) ) ( not ( = ?auto_677104 ?auto_677114 ) ) ( not ( = ?auto_677105 ?auto_677106 ) ) ( not ( = ?auto_677105 ?auto_677107 ) ) ( not ( = ?auto_677105 ?auto_677108 ) ) ( not ( = ?auto_677105 ?auto_677109 ) ) ( not ( = ?auto_677105 ?auto_677110 ) ) ( not ( = ?auto_677105 ?auto_677111 ) ) ( not ( = ?auto_677105 ?auto_677112 ) ) ( not ( = ?auto_677105 ?auto_677113 ) ) ( not ( = ?auto_677105 ?auto_677114 ) ) ( not ( = ?auto_677106 ?auto_677107 ) ) ( not ( = ?auto_677106 ?auto_677108 ) ) ( not ( = ?auto_677106 ?auto_677109 ) ) ( not ( = ?auto_677106 ?auto_677110 ) ) ( not ( = ?auto_677106 ?auto_677111 ) ) ( not ( = ?auto_677106 ?auto_677112 ) ) ( not ( = ?auto_677106 ?auto_677113 ) ) ( not ( = ?auto_677106 ?auto_677114 ) ) ( not ( = ?auto_677107 ?auto_677108 ) ) ( not ( = ?auto_677107 ?auto_677109 ) ) ( not ( = ?auto_677107 ?auto_677110 ) ) ( not ( = ?auto_677107 ?auto_677111 ) ) ( not ( = ?auto_677107 ?auto_677112 ) ) ( not ( = ?auto_677107 ?auto_677113 ) ) ( not ( = ?auto_677107 ?auto_677114 ) ) ( not ( = ?auto_677108 ?auto_677109 ) ) ( not ( = ?auto_677108 ?auto_677110 ) ) ( not ( = ?auto_677108 ?auto_677111 ) ) ( not ( = ?auto_677108 ?auto_677112 ) ) ( not ( = ?auto_677108 ?auto_677113 ) ) ( not ( = ?auto_677108 ?auto_677114 ) ) ( not ( = ?auto_677109 ?auto_677110 ) ) ( not ( = ?auto_677109 ?auto_677111 ) ) ( not ( = ?auto_677109 ?auto_677112 ) ) ( not ( = ?auto_677109 ?auto_677113 ) ) ( not ( = ?auto_677109 ?auto_677114 ) ) ( not ( = ?auto_677110 ?auto_677111 ) ) ( not ( = ?auto_677110 ?auto_677112 ) ) ( not ( = ?auto_677110 ?auto_677113 ) ) ( not ( = ?auto_677110 ?auto_677114 ) ) ( not ( = ?auto_677111 ?auto_677112 ) ) ( not ( = ?auto_677111 ?auto_677113 ) ) ( not ( = ?auto_677111 ?auto_677114 ) ) ( not ( = ?auto_677112 ?auto_677113 ) ) ( not ( = ?auto_677112 ?auto_677114 ) ) ( not ( = ?auto_677113 ?auto_677114 ) ) ( ON ?auto_677112 ?auto_677113 ) ( ON ?auto_677111 ?auto_677112 ) ( ON ?auto_677110 ?auto_677111 ) ( ON ?auto_677109 ?auto_677110 ) ( CLEAR ?auto_677107 ) ( ON ?auto_677108 ?auto_677109 ) ( CLEAR ?auto_677108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_677099 ?auto_677100 ?auto_677101 ?auto_677102 ?auto_677103 ?auto_677104 ?auto_677105 ?auto_677106 ?auto_677107 ?auto_677108 )
      ( MAKE-15PILE ?auto_677099 ?auto_677100 ?auto_677101 ?auto_677102 ?auto_677103 ?auto_677104 ?auto_677105 ?auto_677106 ?auto_677107 ?auto_677108 ?auto_677109 ?auto_677110 ?auto_677111 ?auto_677112 ?auto_677113 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677161 - BLOCK
      ?auto_677162 - BLOCK
      ?auto_677163 - BLOCK
      ?auto_677164 - BLOCK
      ?auto_677165 - BLOCK
      ?auto_677166 - BLOCK
      ?auto_677167 - BLOCK
      ?auto_677168 - BLOCK
      ?auto_677169 - BLOCK
      ?auto_677170 - BLOCK
      ?auto_677171 - BLOCK
      ?auto_677172 - BLOCK
      ?auto_677173 - BLOCK
      ?auto_677174 - BLOCK
      ?auto_677175 - BLOCK
    )
    :vars
    (
      ?auto_677176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677175 ?auto_677176 ) ( ON-TABLE ?auto_677161 ) ( ON ?auto_677162 ?auto_677161 ) ( ON ?auto_677163 ?auto_677162 ) ( ON ?auto_677164 ?auto_677163 ) ( ON ?auto_677165 ?auto_677164 ) ( ON ?auto_677166 ?auto_677165 ) ( ON ?auto_677167 ?auto_677166 ) ( ON ?auto_677168 ?auto_677167 ) ( not ( = ?auto_677161 ?auto_677162 ) ) ( not ( = ?auto_677161 ?auto_677163 ) ) ( not ( = ?auto_677161 ?auto_677164 ) ) ( not ( = ?auto_677161 ?auto_677165 ) ) ( not ( = ?auto_677161 ?auto_677166 ) ) ( not ( = ?auto_677161 ?auto_677167 ) ) ( not ( = ?auto_677161 ?auto_677168 ) ) ( not ( = ?auto_677161 ?auto_677169 ) ) ( not ( = ?auto_677161 ?auto_677170 ) ) ( not ( = ?auto_677161 ?auto_677171 ) ) ( not ( = ?auto_677161 ?auto_677172 ) ) ( not ( = ?auto_677161 ?auto_677173 ) ) ( not ( = ?auto_677161 ?auto_677174 ) ) ( not ( = ?auto_677161 ?auto_677175 ) ) ( not ( = ?auto_677161 ?auto_677176 ) ) ( not ( = ?auto_677162 ?auto_677163 ) ) ( not ( = ?auto_677162 ?auto_677164 ) ) ( not ( = ?auto_677162 ?auto_677165 ) ) ( not ( = ?auto_677162 ?auto_677166 ) ) ( not ( = ?auto_677162 ?auto_677167 ) ) ( not ( = ?auto_677162 ?auto_677168 ) ) ( not ( = ?auto_677162 ?auto_677169 ) ) ( not ( = ?auto_677162 ?auto_677170 ) ) ( not ( = ?auto_677162 ?auto_677171 ) ) ( not ( = ?auto_677162 ?auto_677172 ) ) ( not ( = ?auto_677162 ?auto_677173 ) ) ( not ( = ?auto_677162 ?auto_677174 ) ) ( not ( = ?auto_677162 ?auto_677175 ) ) ( not ( = ?auto_677162 ?auto_677176 ) ) ( not ( = ?auto_677163 ?auto_677164 ) ) ( not ( = ?auto_677163 ?auto_677165 ) ) ( not ( = ?auto_677163 ?auto_677166 ) ) ( not ( = ?auto_677163 ?auto_677167 ) ) ( not ( = ?auto_677163 ?auto_677168 ) ) ( not ( = ?auto_677163 ?auto_677169 ) ) ( not ( = ?auto_677163 ?auto_677170 ) ) ( not ( = ?auto_677163 ?auto_677171 ) ) ( not ( = ?auto_677163 ?auto_677172 ) ) ( not ( = ?auto_677163 ?auto_677173 ) ) ( not ( = ?auto_677163 ?auto_677174 ) ) ( not ( = ?auto_677163 ?auto_677175 ) ) ( not ( = ?auto_677163 ?auto_677176 ) ) ( not ( = ?auto_677164 ?auto_677165 ) ) ( not ( = ?auto_677164 ?auto_677166 ) ) ( not ( = ?auto_677164 ?auto_677167 ) ) ( not ( = ?auto_677164 ?auto_677168 ) ) ( not ( = ?auto_677164 ?auto_677169 ) ) ( not ( = ?auto_677164 ?auto_677170 ) ) ( not ( = ?auto_677164 ?auto_677171 ) ) ( not ( = ?auto_677164 ?auto_677172 ) ) ( not ( = ?auto_677164 ?auto_677173 ) ) ( not ( = ?auto_677164 ?auto_677174 ) ) ( not ( = ?auto_677164 ?auto_677175 ) ) ( not ( = ?auto_677164 ?auto_677176 ) ) ( not ( = ?auto_677165 ?auto_677166 ) ) ( not ( = ?auto_677165 ?auto_677167 ) ) ( not ( = ?auto_677165 ?auto_677168 ) ) ( not ( = ?auto_677165 ?auto_677169 ) ) ( not ( = ?auto_677165 ?auto_677170 ) ) ( not ( = ?auto_677165 ?auto_677171 ) ) ( not ( = ?auto_677165 ?auto_677172 ) ) ( not ( = ?auto_677165 ?auto_677173 ) ) ( not ( = ?auto_677165 ?auto_677174 ) ) ( not ( = ?auto_677165 ?auto_677175 ) ) ( not ( = ?auto_677165 ?auto_677176 ) ) ( not ( = ?auto_677166 ?auto_677167 ) ) ( not ( = ?auto_677166 ?auto_677168 ) ) ( not ( = ?auto_677166 ?auto_677169 ) ) ( not ( = ?auto_677166 ?auto_677170 ) ) ( not ( = ?auto_677166 ?auto_677171 ) ) ( not ( = ?auto_677166 ?auto_677172 ) ) ( not ( = ?auto_677166 ?auto_677173 ) ) ( not ( = ?auto_677166 ?auto_677174 ) ) ( not ( = ?auto_677166 ?auto_677175 ) ) ( not ( = ?auto_677166 ?auto_677176 ) ) ( not ( = ?auto_677167 ?auto_677168 ) ) ( not ( = ?auto_677167 ?auto_677169 ) ) ( not ( = ?auto_677167 ?auto_677170 ) ) ( not ( = ?auto_677167 ?auto_677171 ) ) ( not ( = ?auto_677167 ?auto_677172 ) ) ( not ( = ?auto_677167 ?auto_677173 ) ) ( not ( = ?auto_677167 ?auto_677174 ) ) ( not ( = ?auto_677167 ?auto_677175 ) ) ( not ( = ?auto_677167 ?auto_677176 ) ) ( not ( = ?auto_677168 ?auto_677169 ) ) ( not ( = ?auto_677168 ?auto_677170 ) ) ( not ( = ?auto_677168 ?auto_677171 ) ) ( not ( = ?auto_677168 ?auto_677172 ) ) ( not ( = ?auto_677168 ?auto_677173 ) ) ( not ( = ?auto_677168 ?auto_677174 ) ) ( not ( = ?auto_677168 ?auto_677175 ) ) ( not ( = ?auto_677168 ?auto_677176 ) ) ( not ( = ?auto_677169 ?auto_677170 ) ) ( not ( = ?auto_677169 ?auto_677171 ) ) ( not ( = ?auto_677169 ?auto_677172 ) ) ( not ( = ?auto_677169 ?auto_677173 ) ) ( not ( = ?auto_677169 ?auto_677174 ) ) ( not ( = ?auto_677169 ?auto_677175 ) ) ( not ( = ?auto_677169 ?auto_677176 ) ) ( not ( = ?auto_677170 ?auto_677171 ) ) ( not ( = ?auto_677170 ?auto_677172 ) ) ( not ( = ?auto_677170 ?auto_677173 ) ) ( not ( = ?auto_677170 ?auto_677174 ) ) ( not ( = ?auto_677170 ?auto_677175 ) ) ( not ( = ?auto_677170 ?auto_677176 ) ) ( not ( = ?auto_677171 ?auto_677172 ) ) ( not ( = ?auto_677171 ?auto_677173 ) ) ( not ( = ?auto_677171 ?auto_677174 ) ) ( not ( = ?auto_677171 ?auto_677175 ) ) ( not ( = ?auto_677171 ?auto_677176 ) ) ( not ( = ?auto_677172 ?auto_677173 ) ) ( not ( = ?auto_677172 ?auto_677174 ) ) ( not ( = ?auto_677172 ?auto_677175 ) ) ( not ( = ?auto_677172 ?auto_677176 ) ) ( not ( = ?auto_677173 ?auto_677174 ) ) ( not ( = ?auto_677173 ?auto_677175 ) ) ( not ( = ?auto_677173 ?auto_677176 ) ) ( not ( = ?auto_677174 ?auto_677175 ) ) ( not ( = ?auto_677174 ?auto_677176 ) ) ( not ( = ?auto_677175 ?auto_677176 ) ) ( ON ?auto_677174 ?auto_677175 ) ( ON ?auto_677173 ?auto_677174 ) ( ON ?auto_677172 ?auto_677173 ) ( ON ?auto_677171 ?auto_677172 ) ( ON ?auto_677170 ?auto_677171 ) ( CLEAR ?auto_677168 ) ( ON ?auto_677169 ?auto_677170 ) ( CLEAR ?auto_677169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_677161 ?auto_677162 ?auto_677163 ?auto_677164 ?auto_677165 ?auto_677166 ?auto_677167 ?auto_677168 ?auto_677169 )
      ( MAKE-15PILE ?auto_677161 ?auto_677162 ?auto_677163 ?auto_677164 ?auto_677165 ?auto_677166 ?auto_677167 ?auto_677168 ?auto_677169 ?auto_677170 ?auto_677171 ?auto_677172 ?auto_677173 ?auto_677174 ?auto_677175 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677223 - BLOCK
      ?auto_677224 - BLOCK
      ?auto_677225 - BLOCK
      ?auto_677226 - BLOCK
      ?auto_677227 - BLOCK
      ?auto_677228 - BLOCK
      ?auto_677229 - BLOCK
      ?auto_677230 - BLOCK
      ?auto_677231 - BLOCK
      ?auto_677232 - BLOCK
      ?auto_677233 - BLOCK
      ?auto_677234 - BLOCK
      ?auto_677235 - BLOCK
      ?auto_677236 - BLOCK
      ?auto_677237 - BLOCK
    )
    :vars
    (
      ?auto_677238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677237 ?auto_677238 ) ( ON-TABLE ?auto_677223 ) ( ON ?auto_677224 ?auto_677223 ) ( ON ?auto_677225 ?auto_677224 ) ( ON ?auto_677226 ?auto_677225 ) ( ON ?auto_677227 ?auto_677226 ) ( ON ?auto_677228 ?auto_677227 ) ( ON ?auto_677229 ?auto_677228 ) ( not ( = ?auto_677223 ?auto_677224 ) ) ( not ( = ?auto_677223 ?auto_677225 ) ) ( not ( = ?auto_677223 ?auto_677226 ) ) ( not ( = ?auto_677223 ?auto_677227 ) ) ( not ( = ?auto_677223 ?auto_677228 ) ) ( not ( = ?auto_677223 ?auto_677229 ) ) ( not ( = ?auto_677223 ?auto_677230 ) ) ( not ( = ?auto_677223 ?auto_677231 ) ) ( not ( = ?auto_677223 ?auto_677232 ) ) ( not ( = ?auto_677223 ?auto_677233 ) ) ( not ( = ?auto_677223 ?auto_677234 ) ) ( not ( = ?auto_677223 ?auto_677235 ) ) ( not ( = ?auto_677223 ?auto_677236 ) ) ( not ( = ?auto_677223 ?auto_677237 ) ) ( not ( = ?auto_677223 ?auto_677238 ) ) ( not ( = ?auto_677224 ?auto_677225 ) ) ( not ( = ?auto_677224 ?auto_677226 ) ) ( not ( = ?auto_677224 ?auto_677227 ) ) ( not ( = ?auto_677224 ?auto_677228 ) ) ( not ( = ?auto_677224 ?auto_677229 ) ) ( not ( = ?auto_677224 ?auto_677230 ) ) ( not ( = ?auto_677224 ?auto_677231 ) ) ( not ( = ?auto_677224 ?auto_677232 ) ) ( not ( = ?auto_677224 ?auto_677233 ) ) ( not ( = ?auto_677224 ?auto_677234 ) ) ( not ( = ?auto_677224 ?auto_677235 ) ) ( not ( = ?auto_677224 ?auto_677236 ) ) ( not ( = ?auto_677224 ?auto_677237 ) ) ( not ( = ?auto_677224 ?auto_677238 ) ) ( not ( = ?auto_677225 ?auto_677226 ) ) ( not ( = ?auto_677225 ?auto_677227 ) ) ( not ( = ?auto_677225 ?auto_677228 ) ) ( not ( = ?auto_677225 ?auto_677229 ) ) ( not ( = ?auto_677225 ?auto_677230 ) ) ( not ( = ?auto_677225 ?auto_677231 ) ) ( not ( = ?auto_677225 ?auto_677232 ) ) ( not ( = ?auto_677225 ?auto_677233 ) ) ( not ( = ?auto_677225 ?auto_677234 ) ) ( not ( = ?auto_677225 ?auto_677235 ) ) ( not ( = ?auto_677225 ?auto_677236 ) ) ( not ( = ?auto_677225 ?auto_677237 ) ) ( not ( = ?auto_677225 ?auto_677238 ) ) ( not ( = ?auto_677226 ?auto_677227 ) ) ( not ( = ?auto_677226 ?auto_677228 ) ) ( not ( = ?auto_677226 ?auto_677229 ) ) ( not ( = ?auto_677226 ?auto_677230 ) ) ( not ( = ?auto_677226 ?auto_677231 ) ) ( not ( = ?auto_677226 ?auto_677232 ) ) ( not ( = ?auto_677226 ?auto_677233 ) ) ( not ( = ?auto_677226 ?auto_677234 ) ) ( not ( = ?auto_677226 ?auto_677235 ) ) ( not ( = ?auto_677226 ?auto_677236 ) ) ( not ( = ?auto_677226 ?auto_677237 ) ) ( not ( = ?auto_677226 ?auto_677238 ) ) ( not ( = ?auto_677227 ?auto_677228 ) ) ( not ( = ?auto_677227 ?auto_677229 ) ) ( not ( = ?auto_677227 ?auto_677230 ) ) ( not ( = ?auto_677227 ?auto_677231 ) ) ( not ( = ?auto_677227 ?auto_677232 ) ) ( not ( = ?auto_677227 ?auto_677233 ) ) ( not ( = ?auto_677227 ?auto_677234 ) ) ( not ( = ?auto_677227 ?auto_677235 ) ) ( not ( = ?auto_677227 ?auto_677236 ) ) ( not ( = ?auto_677227 ?auto_677237 ) ) ( not ( = ?auto_677227 ?auto_677238 ) ) ( not ( = ?auto_677228 ?auto_677229 ) ) ( not ( = ?auto_677228 ?auto_677230 ) ) ( not ( = ?auto_677228 ?auto_677231 ) ) ( not ( = ?auto_677228 ?auto_677232 ) ) ( not ( = ?auto_677228 ?auto_677233 ) ) ( not ( = ?auto_677228 ?auto_677234 ) ) ( not ( = ?auto_677228 ?auto_677235 ) ) ( not ( = ?auto_677228 ?auto_677236 ) ) ( not ( = ?auto_677228 ?auto_677237 ) ) ( not ( = ?auto_677228 ?auto_677238 ) ) ( not ( = ?auto_677229 ?auto_677230 ) ) ( not ( = ?auto_677229 ?auto_677231 ) ) ( not ( = ?auto_677229 ?auto_677232 ) ) ( not ( = ?auto_677229 ?auto_677233 ) ) ( not ( = ?auto_677229 ?auto_677234 ) ) ( not ( = ?auto_677229 ?auto_677235 ) ) ( not ( = ?auto_677229 ?auto_677236 ) ) ( not ( = ?auto_677229 ?auto_677237 ) ) ( not ( = ?auto_677229 ?auto_677238 ) ) ( not ( = ?auto_677230 ?auto_677231 ) ) ( not ( = ?auto_677230 ?auto_677232 ) ) ( not ( = ?auto_677230 ?auto_677233 ) ) ( not ( = ?auto_677230 ?auto_677234 ) ) ( not ( = ?auto_677230 ?auto_677235 ) ) ( not ( = ?auto_677230 ?auto_677236 ) ) ( not ( = ?auto_677230 ?auto_677237 ) ) ( not ( = ?auto_677230 ?auto_677238 ) ) ( not ( = ?auto_677231 ?auto_677232 ) ) ( not ( = ?auto_677231 ?auto_677233 ) ) ( not ( = ?auto_677231 ?auto_677234 ) ) ( not ( = ?auto_677231 ?auto_677235 ) ) ( not ( = ?auto_677231 ?auto_677236 ) ) ( not ( = ?auto_677231 ?auto_677237 ) ) ( not ( = ?auto_677231 ?auto_677238 ) ) ( not ( = ?auto_677232 ?auto_677233 ) ) ( not ( = ?auto_677232 ?auto_677234 ) ) ( not ( = ?auto_677232 ?auto_677235 ) ) ( not ( = ?auto_677232 ?auto_677236 ) ) ( not ( = ?auto_677232 ?auto_677237 ) ) ( not ( = ?auto_677232 ?auto_677238 ) ) ( not ( = ?auto_677233 ?auto_677234 ) ) ( not ( = ?auto_677233 ?auto_677235 ) ) ( not ( = ?auto_677233 ?auto_677236 ) ) ( not ( = ?auto_677233 ?auto_677237 ) ) ( not ( = ?auto_677233 ?auto_677238 ) ) ( not ( = ?auto_677234 ?auto_677235 ) ) ( not ( = ?auto_677234 ?auto_677236 ) ) ( not ( = ?auto_677234 ?auto_677237 ) ) ( not ( = ?auto_677234 ?auto_677238 ) ) ( not ( = ?auto_677235 ?auto_677236 ) ) ( not ( = ?auto_677235 ?auto_677237 ) ) ( not ( = ?auto_677235 ?auto_677238 ) ) ( not ( = ?auto_677236 ?auto_677237 ) ) ( not ( = ?auto_677236 ?auto_677238 ) ) ( not ( = ?auto_677237 ?auto_677238 ) ) ( ON ?auto_677236 ?auto_677237 ) ( ON ?auto_677235 ?auto_677236 ) ( ON ?auto_677234 ?auto_677235 ) ( ON ?auto_677233 ?auto_677234 ) ( ON ?auto_677232 ?auto_677233 ) ( ON ?auto_677231 ?auto_677232 ) ( CLEAR ?auto_677229 ) ( ON ?auto_677230 ?auto_677231 ) ( CLEAR ?auto_677230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_677223 ?auto_677224 ?auto_677225 ?auto_677226 ?auto_677227 ?auto_677228 ?auto_677229 ?auto_677230 )
      ( MAKE-15PILE ?auto_677223 ?auto_677224 ?auto_677225 ?auto_677226 ?auto_677227 ?auto_677228 ?auto_677229 ?auto_677230 ?auto_677231 ?auto_677232 ?auto_677233 ?auto_677234 ?auto_677235 ?auto_677236 ?auto_677237 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677285 - BLOCK
      ?auto_677286 - BLOCK
      ?auto_677287 - BLOCK
      ?auto_677288 - BLOCK
      ?auto_677289 - BLOCK
      ?auto_677290 - BLOCK
      ?auto_677291 - BLOCK
      ?auto_677292 - BLOCK
      ?auto_677293 - BLOCK
      ?auto_677294 - BLOCK
      ?auto_677295 - BLOCK
      ?auto_677296 - BLOCK
      ?auto_677297 - BLOCK
      ?auto_677298 - BLOCK
      ?auto_677299 - BLOCK
    )
    :vars
    (
      ?auto_677300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677299 ?auto_677300 ) ( ON-TABLE ?auto_677285 ) ( ON ?auto_677286 ?auto_677285 ) ( ON ?auto_677287 ?auto_677286 ) ( ON ?auto_677288 ?auto_677287 ) ( ON ?auto_677289 ?auto_677288 ) ( ON ?auto_677290 ?auto_677289 ) ( not ( = ?auto_677285 ?auto_677286 ) ) ( not ( = ?auto_677285 ?auto_677287 ) ) ( not ( = ?auto_677285 ?auto_677288 ) ) ( not ( = ?auto_677285 ?auto_677289 ) ) ( not ( = ?auto_677285 ?auto_677290 ) ) ( not ( = ?auto_677285 ?auto_677291 ) ) ( not ( = ?auto_677285 ?auto_677292 ) ) ( not ( = ?auto_677285 ?auto_677293 ) ) ( not ( = ?auto_677285 ?auto_677294 ) ) ( not ( = ?auto_677285 ?auto_677295 ) ) ( not ( = ?auto_677285 ?auto_677296 ) ) ( not ( = ?auto_677285 ?auto_677297 ) ) ( not ( = ?auto_677285 ?auto_677298 ) ) ( not ( = ?auto_677285 ?auto_677299 ) ) ( not ( = ?auto_677285 ?auto_677300 ) ) ( not ( = ?auto_677286 ?auto_677287 ) ) ( not ( = ?auto_677286 ?auto_677288 ) ) ( not ( = ?auto_677286 ?auto_677289 ) ) ( not ( = ?auto_677286 ?auto_677290 ) ) ( not ( = ?auto_677286 ?auto_677291 ) ) ( not ( = ?auto_677286 ?auto_677292 ) ) ( not ( = ?auto_677286 ?auto_677293 ) ) ( not ( = ?auto_677286 ?auto_677294 ) ) ( not ( = ?auto_677286 ?auto_677295 ) ) ( not ( = ?auto_677286 ?auto_677296 ) ) ( not ( = ?auto_677286 ?auto_677297 ) ) ( not ( = ?auto_677286 ?auto_677298 ) ) ( not ( = ?auto_677286 ?auto_677299 ) ) ( not ( = ?auto_677286 ?auto_677300 ) ) ( not ( = ?auto_677287 ?auto_677288 ) ) ( not ( = ?auto_677287 ?auto_677289 ) ) ( not ( = ?auto_677287 ?auto_677290 ) ) ( not ( = ?auto_677287 ?auto_677291 ) ) ( not ( = ?auto_677287 ?auto_677292 ) ) ( not ( = ?auto_677287 ?auto_677293 ) ) ( not ( = ?auto_677287 ?auto_677294 ) ) ( not ( = ?auto_677287 ?auto_677295 ) ) ( not ( = ?auto_677287 ?auto_677296 ) ) ( not ( = ?auto_677287 ?auto_677297 ) ) ( not ( = ?auto_677287 ?auto_677298 ) ) ( not ( = ?auto_677287 ?auto_677299 ) ) ( not ( = ?auto_677287 ?auto_677300 ) ) ( not ( = ?auto_677288 ?auto_677289 ) ) ( not ( = ?auto_677288 ?auto_677290 ) ) ( not ( = ?auto_677288 ?auto_677291 ) ) ( not ( = ?auto_677288 ?auto_677292 ) ) ( not ( = ?auto_677288 ?auto_677293 ) ) ( not ( = ?auto_677288 ?auto_677294 ) ) ( not ( = ?auto_677288 ?auto_677295 ) ) ( not ( = ?auto_677288 ?auto_677296 ) ) ( not ( = ?auto_677288 ?auto_677297 ) ) ( not ( = ?auto_677288 ?auto_677298 ) ) ( not ( = ?auto_677288 ?auto_677299 ) ) ( not ( = ?auto_677288 ?auto_677300 ) ) ( not ( = ?auto_677289 ?auto_677290 ) ) ( not ( = ?auto_677289 ?auto_677291 ) ) ( not ( = ?auto_677289 ?auto_677292 ) ) ( not ( = ?auto_677289 ?auto_677293 ) ) ( not ( = ?auto_677289 ?auto_677294 ) ) ( not ( = ?auto_677289 ?auto_677295 ) ) ( not ( = ?auto_677289 ?auto_677296 ) ) ( not ( = ?auto_677289 ?auto_677297 ) ) ( not ( = ?auto_677289 ?auto_677298 ) ) ( not ( = ?auto_677289 ?auto_677299 ) ) ( not ( = ?auto_677289 ?auto_677300 ) ) ( not ( = ?auto_677290 ?auto_677291 ) ) ( not ( = ?auto_677290 ?auto_677292 ) ) ( not ( = ?auto_677290 ?auto_677293 ) ) ( not ( = ?auto_677290 ?auto_677294 ) ) ( not ( = ?auto_677290 ?auto_677295 ) ) ( not ( = ?auto_677290 ?auto_677296 ) ) ( not ( = ?auto_677290 ?auto_677297 ) ) ( not ( = ?auto_677290 ?auto_677298 ) ) ( not ( = ?auto_677290 ?auto_677299 ) ) ( not ( = ?auto_677290 ?auto_677300 ) ) ( not ( = ?auto_677291 ?auto_677292 ) ) ( not ( = ?auto_677291 ?auto_677293 ) ) ( not ( = ?auto_677291 ?auto_677294 ) ) ( not ( = ?auto_677291 ?auto_677295 ) ) ( not ( = ?auto_677291 ?auto_677296 ) ) ( not ( = ?auto_677291 ?auto_677297 ) ) ( not ( = ?auto_677291 ?auto_677298 ) ) ( not ( = ?auto_677291 ?auto_677299 ) ) ( not ( = ?auto_677291 ?auto_677300 ) ) ( not ( = ?auto_677292 ?auto_677293 ) ) ( not ( = ?auto_677292 ?auto_677294 ) ) ( not ( = ?auto_677292 ?auto_677295 ) ) ( not ( = ?auto_677292 ?auto_677296 ) ) ( not ( = ?auto_677292 ?auto_677297 ) ) ( not ( = ?auto_677292 ?auto_677298 ) ) ( not ( = ?auto_677292 ?auto_677299 ) ) ( not ( = ?auto_677292 ?auto_677300 ) ) ( not ( = ?auto_677293 ?auto_677294 ) ) ( not ( = ?auto_677293 ?auto_677295 ) ) ( not ( = ?auto_677293 ?auto_677296 ) ) ( not ( = ?auto_677293 ?auto_677297 ) ) ( not ( = ?auto_677293 ?auto_677298 ) ) ( not ( = ?auto_677293 ?auto_677299 ) ) ( not ( = ?auto_677293 ?auto_677300 ) ) ( not ( = ?auto_677294 ?auto_677295 ) ) ( not ( = ?auto_677294 ?auto_677296 ) ) ( not ( = ?auto_677294 ?auto_677297 ) ) ( not ( = ?auto_677294 ?auto_677298 ) ) ( not ( = ?auto_677294 ?auto_677299 ) ) ( not ( = ?auto_677294 ?auto_677300 ) ) ( not ( = ?auto_677295 ?auto_677296 ) ) ( not ( = ?auto_677295 ?auto_677297 ) ) ( not ( = ?auto_677295 ?auto_677298 ) ) ( not ( = ?auto_677295 ?auto_677299 ) ) ( not ( = ?auto_677295 ?auto_677300 ) ) ( not ( = ?auto_677296 ?auto_677297 ) ) ( not ( = ?auto_677296 ?auto_677298 ) ) ( not ( = ?auto_677296 ?auto_677299 ) ) ( not ( = ?auto_677296 ?auto_677300 ) ) ( not ( = ?auto_677297 ?auto_677298 ) ) ( not ( = ?auto_677297 ?auto_677299 ) ) ( not ( = ?auto_677297 ?auto_677300 ) ) ( not ( = ?auto_677298 ?auto_677299 ) ) ( not ( = ?auto_677298 ?auto_677300 ) ) ( not ( = ?auto_677299 ?auto_677300 ) ) ( ON ?auto_677298 ?auto_677299 ) ( ON ?auto_677297 ?auto_677298 ) ( ON ?auto_677296 ?auto_677297 ) ( ON ?auto_677295 ?auto_677296 ) ( ON ?auto_677294 ?auto_677295 ) ( ON ?auto_677293 ?auto_677294 ) ( ON ?auto_677292 ?auto_677293 ) ( CLEAR ?auto_677290 ) ( ON ?auto_677291 ?auto_677292 ) ( CLEAR ?auto_677291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_677285 ?auto_677286 ?auto_677287 ?auto_677288 ?auto_677289 ?auto_677290 ?auto_677291 )
      ( MAKE-15PILE ?auto_677285 ?auto_677286 ?auto_677287 ?auto_677288 ?auto_677289 ?auto_677290 ?auto_677291 ?auto_677292 ?auto_677293 ?auto_677294 ?auto_677295 ?auto_677296 ?auto_677297 ?auto_677298 ?auto_677299 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677347 - BLOCK
      ?auto_677348 - BLOCK
      ?auto_677349 - BLOCK
      ?auto_677350 - BLOCK
      ?auto_677351 - BLOCK
      ?auto_677352 - BLOCK
      ?auto_677353 - BLOCK
      ?auto_677354 - BLOCK
      ?auto_677355 - BLOCK
      ?auto_677356 - BLOCK
      ?auto_677357 - BLOCK
      ?auto_677358 - BLOCK
      ?auto_677359 - BLOCK
      ?auto_677360 - BLOCK
      ?auto_677361 - BLOCK
    )
    :vars
    (
      ?auto_677362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677361 ?auto_677362 ) ( ON-TABLE ?auto_677347 ) ( ON ?auto_677348 ?auto_677347 ) ( ON ?auto_677349 ?auto_677348 ) ( ON ?auto_677350 ?auto_677349 ) ( ON ?auto_677351 ?auto_677350 ) ( not ( = ?auto_677347 ?auto_677348 ) ) ( not ( = ?auto_677347 ?auto_677349 ) ) ( not ( = ?auto_677347 ?auto_677350 ) ) ( not ( = ?auto_677347 ?auto_677351 ) ) ( not ( = ?auto_677347 ?auto_677352 ) ) ( not ( = ?auto_677347 ?auto_677353 ) ) ( not ( = ?auto_677347 ?auto_677354 ) ) ( not ( = ?auto_677347 ?auto_677355 ) ) ( not ( = ?auto_677347 ?auto_677356 ) ) ( not ( = ?auto_677347 ?auto_677357 ) ) ( not ( = ?auto_677347 ?auto_677358 ) ) ( not ( = ?auto_677347 ?auto_677359 ) ) ( not ( = ?auto_677347 ?auto_677360 ) ) ( not ( = ?auto_677347 ?auto_677361 ) ) ( not ( = ?auto_677347 ?auto_677362 ) ) ( not ( = ?auto_677348 ?auto_677349 ) ) ( not ( = ?auto_677348 ?auto_677350 ) ) ( not ( = ?auto_677348 ?auto_677351 ) ) ( not ( = ?auto_677348 ?auto_677352 ) ) ( not ( = ?auto_677348 ?auto_677353 ) ) ( not ( = ?auto_677348 ?auto_677354 ) ) ( not ( = ?auto_677348 ?auto_677355 ) ) ( not ( = ?auto_677348 ?auto_677356 ) ) ( not ( = ?auto_677348 ?auto_677357 ) ) ( not ( = ?auto_677348 ?auto_677358 ) ) ( not ( = ?auto_677348 ?auto_677359 ) ) ( not ( = ?auto_677348 ?auto_677360 ) ) ( not ( = ?auto_677348 ?auto_677361 ) ) ( not ( = ?auto_677348 ?auto_677362 ) ) ( not ( = ?auto_677349 ?auto_677350 ) ) ( not ( = ?auto_677349 ?auto_677351 ) ) ( not ( = ?auto_677349 ?auto_677352 ) ) ( not ( = ?auto_677349 ?auto_677353 ) ) ( not ( = ?auto_677349 ?auto_677354 ) ) ( not ( = ?auto_677349 ?auto_677355 ) ) ( not ( = ?auto_677349 ?auto_677356 ) ) ( not ( = ?auto_677349 ?auto_677357 ) ) ( not ( = ?auto_677349 ?auto_677358 ) ) ( not ( = ?auto_677349 ?auto_677359 ) ) ( not ( = ?auto_677349 ?auto_677360 ) ) ( not ( = ?auto_677349 ?auto_677361 ) ) ( not ( = ?auto_677349 ?auto_677362 ) ) ( not ( = ?auto_677350 ?auto_677351 ) ) ( not ( = ?auto_677350 ?auto_677352 ) ) ( not ( = ?auto_677350 ?auto_677353 ) ) ( not ( = ?auto_677350 ?auto_677354 ) ) ( not ( = ?auto_677350 ?auto_677355 ) ) ( not ( = ?auto_677350 ?auto_677356 ) ) ( not ( = ?auto_677350 ?auto_677357 ) ) ( not ( = ?auto_677350 ?auto_677358 ) ) ( not ( = ?auto_677350 ?auto_677359 ) ) ( not ( = ?auto_677350 ?auto_677360 ) ) ( not ( = ?auto_677350 ?auto_677361 ) ) ( not ( = ?auto_677350 ?auto_677362 ) ) ( not ( = ?auto_677351 ?auto_677352 ) ) ( not ( = ?auto_677351 ?auto_677353 ) ) ( not ( = ?auto_677351 ?auto_677354 ) ) ( not ( = ?auto_677351 ?auto_677355 ) ) ( not ( = ?auto_677351 ?auto_677356 ) ) ( not ( = ?auto_677351 ?auto_677357 ) ) ( not ( = ?auto_677351 ?auto_677358 ) ) ( not ( = ?auto_677351 ?auto_677359 ) ) ( not ( = ?auto_677351 ?auto_677360 ) ) ( not ( = ?auto_677351 ?auto_677361 ) ) ( not ( = ?auto_677351 ?auto_677362 ) ) ( not ( = ?auto_677352 ?auto_677353 ) ) ( not ( = ?auto_677352 ?auto_677354 ) ) ( not ( = ?auto_677352 ?auto_677355 ) ) ( not ( = ?auto_677352 ?auto_677356 ) ) ( not ( = ?auto_677352 ?auto_677357 ) ) ( not ( = ?auto_677352 ?auto_677358 ) ) ( not ( = ?auto_677352 ?auto_677359 ) ) ( not ( = ?auto_677352 ?auto_677360 ) ) ( not ( = ?auto_677352 ?auto_677361 ) ) ( not ( = ?auto_677352 ?auto_677362 ) ) ( not ( = ?auto_677353 ?auto_677354 ) ) ( not ( = ?auto_677353 ?auto_677355 ) ) ( not ( = ?auto_677353 ?auto_677356 ) ) ( not ( = ?auto_677353 ?auto_677357 ) ) ( not ( = ?auto_677353 ?auto_677358 ) ) ( not ( = ?auto_677353 ?auto_677359 ) ) ( not ( = ?auto_677353 ?auto_677360 ) ) ( not ( = ?auto_677353 ?auto_677361 ) ) ( not ( = ?auto_677353 ?auto_677362 ) ) ( not ( = ?auto_677354 ?auto_677355 ) ) ( not ( = ?auto_677354 ?auto_677356 ) ) ( not ( = ?auto_677354 ?auto_677357 ) ) ( not ( = ?auto_677354 ?auto_677358 ) ) ( not ( = ?auto_677354 ?auto_677359 ) ) ( not ( = ?auto_677354 ?auto_677360 ) ) ( not ( = ?auto_677354 ?auto_677361 ) ) ( not ( = ?auto_677354 ?auto_677362 ) ) ( not ( = ?auto_677355 ?auto_677356 ) ) ( not ( = ?auto_677355 ?auto_677357 ) ) ( not ( = ?auto_677355 ?auto_677358 ) ) ( not ( = ?auto_677355 ?auto_677359 ) ) ( not ( = ?auto_677355 ?auto_677360 ) ) ( not ( = ?auto_677355 ?auto_677361 ) ) ( not ( = ?auto_677355 ?auto_677362 ) ) ( not ( = ?auto_677356 ?auto_677357 ) ) ( not ( = ?auto_677356 ?auto_677358 ) ) ( not ( = ?auto_677356 ?auto_677359 ) ) ( not ( = ?auto_677356 ?auto_677360 ) ) ( not ( = ?auto_677356 ?auto_677361 ) ) ( not ( = ?auto_677356 ?auto_677362 ) ) ( not ( = ?auto_677357 ?auto_677358 ) ) ( not ( = ?auto_677357 ?auto_677359 ) ) ( not ( = ?auto_677357 ?auto_677360 ) ) ( not ( = ?auto_677357 ?auto_677361 ) ) ( not ( = ?auto_677357 ?auto_677362 ) ) ( not ( = ?auto_677358 ?auto_677359 ) ) ( not ( = ?auto_677358 ?auto_677360 ) ) ( not ( = ?auto_677358 ?auto_677361 ) ) ( not ( = ?auto_677358 ?auto_677362 ) ) ( not ( = ?auto_677359 ?auto_677360 ) ) ( not ( = ?auto_677359 ?auto_677361 ) ) ( not ( = ?auto_677359 ?auto_677362 ) ) ( not ( = ?auto_677360 ?auto_677361 ) ) ( not ( = ?auto_677360 ?auto_677362 ) ) ( not ( = ?auto_677361 ?auto_677362 ) ) ( ON ?auto_677360 ?auto_677361 ) ( ON ?auto_677359 ?auto_677360 ) ( ON ?auto_677358 ?auto_677359 ) ( ON ?auto_677357 ?auto_677358 ) ( ON ?auto_677356 ?auto_677357 ) ( ON ?auto_677355 ?auto_677356 ) ( ON ?auto_677354 ?auto_677355 ) ( ON ?auto_677353 ?auto_677354 ) ( CLEAR ?auto_677351 ) ( ON ?auto_677352 ?auto_677353 ) ( CLEAR ?auto_677352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_677347 ?auto_677348 ?auto_677349 ?auto_677350 ?auto_677351 ?auto_677352 )
      ( MAKE-15PILE ?auto_677347 ?auto_677348 ?auto_677349 ?auto_677350 ?auto_677351 ?auto_677352 ?auto_677353 ?auto_677354 ?auto_677355 ?auto_677356 ?auto_677357 ?auto_677358 ?auto_677359 ?auto_677360 ?auto_677361 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677409 - BLOCK
      ?auto_677410 - BLOCK
      ?auto_677411 - BLOCK
      ?auto_677412 - BLOCK
      ?auto_677413 - BLOCK
      ?auto_677414 - BLOCK
      ?auto_677415 - BLOCK
      ?auto_677416 - BLOCK
      ?auto_677417 - BLOCK
      ?auto_677418 - BLOCK
      ?auto_677419 - BLOCK
      ?auto_677420 - BLOCK
      ?auto_677421 - BLOCK
      ?auto_677422 - BLOCK
      ?auto_677423 - BLOCK
    )
    :vars
    (
      ?auto_677424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677423 ?auto_677424 ) ( ON-TABLE ?auto_677409 ) ( ON ?auto_677410 ?auto_677409 ) ( ON ?auto_677411 ?auto_677410 ) ( ON ?auto_677412 ?auto_677411 ) ( not ( = ?auto_677409 ?auto_677410 ) ) ( not ( = ?auto_677409 ?auto_677411 ) ) ( not ( = ?auto_677409 ?auto_677412 ) ) ( not ( = ?auto_677409 ?auto_677413 ) ) ( not ( = ?auto_677409 ?auto_677414 ) ) ( not ( = ?auto_677409 ?auto_677415 ) ) ( not ( = ?auto_677409 ?auto_677416 ) ) ( not ( = ?auto_677409 ?auto_677417 ) ) ( not ( = ?auto_677409 ?auto_677418 ) ) ( not ( = ?auto_677409 ?auto_677419 ) ) ( not ( = ?auto_677409 ?auto_677420 ) ) ( not ( = ?auto_677409 ?auto_677421 ) ) ( not ( = ?auto_677409 ?auto_677422 ) ) ( not ( = ?auto_677409 ?auto_677423 ) ) ( not ( = ?auto_677409 ?auto_677424 ) ) ( not ( = ?auto_677410 ?auto_677411 ) ) ( not ( = ?auto_677410 ?auto_677412 ) ) ( not ( = ?auto_677410 ?auto_677413 ) ) ( not ( = ?auto_677410 ?auto_677414 ) ) ( not ( = ?auto_677410 ?auto_677415 ) ) ( not ( = ?auto_677410 ?auto_677416 ) ) ( not ( = ?auto_677410 ?auto_677417 ) ) ( not ( = ?auto_677410 ?auto_677418 ) ) ( not ( = ?auto_677410 ?auto_677419 ) ) ( not ( = ?auto_677410 ?auto_677420 ) ) ( not ( = ?auto_677410 ?auto_677421 ) ) ( not ( = ?auto_677410 ?auto_677422 ) ) ( not ( = ?auto_677410 ?auto_677423 ) ) ( not ( = ?auto_677410 ?auto_677424 ) ) ( not ( = ?auto_677411 ?auto_677412 ) ) ( not ( = ?auto_677411 ?auto_677413 ) ) ( not ( = ?auto_677411 ?auto_677414 ) ) ( not ( = ?auto_677411 ?auto_677415 ) ) ( not ( = ?auto_677411 ?auto_677416 ) ) ( not ( = ?auto_677411 ?auto_677417 ) ) ( not ( = ?auto_677411 ?auto_677418 ) ) ( not ( = ?auto_677411 ?auto_677419 ) ) ( not ( = ?auto_677411 ?auto_677420 ) ) ( not ( = ?auto_677411 ?auto_677421 ) ) ( not ( = ?auto_677411 ?auto_677422 ) ) ( not ( = ?auto_677411 ?auto_677423 ) ) ( not ( = ?auto_677411 ?auto_677424 ) ) ( not ( = ?auto_677412 ?auto_677413 ) ) ( not ( = ?auto_677412 ?auto_677414 ) ) ( not ( = ?auto_677412 ?auto_677415 ) ) ( not ( = ?auto_677412 ?auto_677416 ) ) ( not ( = ?auto_677412 ?auto_677417 ) ) ( not ( = ?auto_677412 ?auto_677418 ) ) ( not ( = ?auto_677412 ?auto_677419 ) ) ( not ( = ?auto_677412 ?auto_677420 ) ) ( not ( = ?auto_677412 ?auto_677421 ) ) ( not ( = ?auto_677412 ?auto_677422 ) ) ( not ( = ?auto_677412 ?auto_677423 ) ) ( not ( = ?auto_677412 ?auto_677424 ) ) ( not ( = ?auto_677413 ?auto_677414 ) ) ( not ( = ?auto_677413 ?auto_677415 ) ) ( not ( = ?auto_677413 ?auto_677416 ) ) ( not ( = ?auto_677413 ?auto_677417 ) ) ( not ( = ?auto_677413 ?auto_677418 ) ) ( not ( = ?auto_677413 ?auto_677419 ) ) ( not ( = ?auto_677413 ?auto_677420 ) ) ( not ( = ?auto_677413 ?auto_677421 ) ) ( not ( = ?auto_677413 ?auto_677422 ) ) ( not ( = ?auto_677413 ?auto_677423 ) ) ( not ( = ?auto_677413 ?auto_677424 ) ) ( not ( = ?auto_677414 ?auto_677415 ) ) ( not ( = ?auto_677414 ?auto_677416 ) ) ( not ( = ?auto_677414 ?auto_677417 ) ) ( not ( = ?auto_677414 ?auto_677418 ) ) ( not ( = ?auto_677414 ?auto_677419 ) ) ( not ( = ?auto_677414 ?auto_677420 ) ) ( not ( = ?auto_677414 ?auto_677421 ) ) ( not ( = ?auto_677414 ?auto_677422 ) ) ( not ( = ?auto_677414 ?auto_677423 ) ) ( not ( = ?auto_677414 ?auto_677424 ) ) ( not ( = ?auto_677415 ?auto_677416 ) ) ( not ( = ?auto_677415 ?auto_677417 ) ) ( not ( = ?auto_677415 ?auto_677418 ) ) ( not ( = ?auto_677415 ?auto_677419 ) ) ( not ( = ?auto_677415 ?auto_677420 ) ) ( not ( = ?auto_677415 ?auto_677421 ) ) ( not ( = ?auto_677415 ?auto_677422 ) ) ( not ( = ?auto_677415 ?auto_677423 ) ) ( not ( = ?auto_677415 ?auto_677424 ) ) ( not ( = ?auto_677416 ?auto_677417 ) ) ( not ( = ?auto_677416 ?auto_677418 ) ) ( not ( = ?auto_677416 ?auto_677419 ) ) ( not ( = ?auto_677416 ?auto_677420 ) ) ( not ( = ?auto_677416 ?auto_677421 ) ) ( not ( = ?auto_677416 ?auto_677422 ) ) ( not ( = ?auto_677416 ?auto_677423 ) ) ( not ( = ?auto_677416 ?auto_677424 ) ) ( not ( = ?auto_677417 ?auto_677418 ) ) ( not ( = ?auto_677417 ?auto_677419 ) ) ( not ( = ?auto_677417 ?auto_677420 ) ) ( not ( = ?auto_677417 ?auto_677421 ) ) ( not ( = ?auto_677417 ?auto_677422 ) ) ( not ( = ?auto_677417 ?auto_677423 ) ) ( not ( = ?auto_677417 ?auto_677424 ) ) ( not ( = ?auto_677418 ?auto_677419 ) ) ( not ( = ?auto_677418 ?auto_677420 ) ) ( not ( = ?auto_677418 ?auto_677421 ) ) ( not ( = ?auto_677418 ?auto_677422 ) ) ( not ( = ?auto_677418 ?auto_677423 ) ) ( not ( = ?auto_677418 ?auto_677424 ) ) ( not ( = ?auto_677419 ?auto_677420 ) ) ( not ( = ?auto_677419 ?auto_677421 ) ) ( not ( = ?auto_677419 ?auto_677422 ) ) ( not ( = ?auto_677419 ?auto_677423 ) ) ( not ( = ?auto_677419 ?auto_677424 ) ) ( not ( = ?auto_677420 ?auto_677421 ) ) ( not ( = ?auto_677420 ?auto_677422 ) ) ( not ( = ?auto_677420 ?auto_677423 ) ) ( not ( = ?auto_677420 ?auto_677424 ) ) ( not ( = ?auto_677421 ?auto_677422 ) ) ( not ( = ?auto_677421 ?auto_677423 ) ) ( not ( = ?auto_677421 ?auto_677424 ) ) ( not ( = ?auto_677422 ?auto_677423 ) ) ( not ( = ?auto_677422 ?auto_677424 ) ) ( not ( = ?auto_677423 ?auto_677424 ) ) ( ON ?auto_677422 ?auto_677423 ) ( ON ?auto_677421 ?auto_677422 ) ( ON ?auto_677420 ?auto_677421 ) ( ON ?auto_677419 ?auto_677420 ) ( ON ?auto_677418 ?auto_677419 ) ( ON ?auto_677417 ?auto_677418 ) ( ON ?auto_677416 ?auto_677417 ) ( ON ?auto_677415 ?auto_677416 ) ( ON ?auto_677414 ?auto_677415 ) ( CLEAR ?auto_677412 ) ( ON ?auto_677413 ?auto_677414 ) ( CLEAR ?auto_677413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_677409 ?auto_677410 ?auto_677411 ?auto_677412 ?auto_677413 )
      ( MAKE-15PILE ?auto_677409 ?auto_677410 ?auto_677411 ?auto_677412 ?auto_677413 ?auto_677414 ?auto_677415 ?auto_677416 ?auto_677417 ?auto_677418 ?auto_677419 ?auto_677420 ?auto_677421 ?auto_677422 ?auto_677423 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677471 - BLOCK
      ?auto_677472 - BLOCK
      ?auto_677473 - BLOCK
      ?auto_677474 - BLOCK
      ?auto_677475 - BLOCK
      ?auto_677476 - BLOCK
      ?auto_677477 - BLOCK
      ?auto_677478 - BLOCK
      ?auto_677479 - BLOCK
      ?auto_677480 - BLOCK
      ?auto_677481 - BLOCK
      ?auto_677482 - BLOCK
      ?auto_677483 - BLOCK
      ?auto_677484 - BLOCK
      ?auto_677485 - BLOCK
    )
    :vars
    (
      ?auto_677486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677485 ?auto_677486 ) ( ON-TABLE ?auto_677471 ) ( ON ?auto_677472 ?auto_677471 ) ( ON ?auto_677473 ?auto_677472 ) ( not ( = ?auto_677471 ?auto_677472 ) ) ( not ( = ?auto_677471 ?auto_677473 ) ) ( not ( = ?auto_677471 ?auto_677474 ) ) ( not ( = ?auto_677471 ?auto_677475 ) ) ( not ( = ?auto_677471 ?auto_677476 ) ) ( not ( = ?auto_677471 ?auto_677477 ) ) ( not ( = ?auto_677471 ?auto_677478 ) ) ( not ( = ?auto_677471 ?auto_677479 ) ) ( not ( = ?auto_677471 ?auto_677480 ) ) ( not ( = ?auto_677471 ?auto_677481 ) ) ( not ( = ?auto_677471 ?auto_677482 ) ) ( not ( = ?auto_677471 ?auto_677483 ) ) ( not ( = ?auto_677471 ?auto_677484 ) ) ( not ( = ?auto_677471 ?auto_677485 ) ) ( not ( = ?auto_677471 ?auto_677486 ) ) ( not ( = ?auto_677472 ?auto_677473 ) ) ( not ( = ?auto_677472 ?auto_677474 ) ) ( not ( = ?auto_677472 ?auto_677475 ) ) ( not ( = ?auto_677472 ?auto_677476 ) ) ( not ( = ?auto_677472 ?auto_677477 ) ) ( not ( = ?auto_677472 ?auto_677478 ) ) ( not ( = ?auto_677472 ?auto_677479 ) ) ( not ( = ?auto_677472 ?auto_677480 ) ) ( not ( = ?auto_677472 ?auto_677481 ) ) ( not ( = ?auto_677472 ?auto_677482 ) ) ( not ( = ?auto_677472 ?auto_677483 ) ) ( not ( = ?auto_677472 ?auto_677484 ) ) ( not ( = ?auto_677472 ?auto_677485 ) ) ( not ( = ?auto_677472 ?auto_677486 ) ) ( not ( = ?auto_677473 ?auto_677474 ) ) ( not ( = ?auto_677473 ?auto_677475 ) ) ( not ( = ?auto_677473 ?auto_677476 ) ) ( not ( = ?auto_677473 ?auto_677477 ) ) ( not ( = ?auto_677473 ?auto_677478 ) ) ( not ( = ?auto_677473 ?auto_677479 ) ) ( not ( = ?auto_677473 ?auto_677480 ) ) ( not ( = ?auto_677473 ?auto_677481 ) ) ( not ( = ?auto_677473 ?auto_677482 ) ) ( not ( = ?auto_677473 ?auto_677483 ) ) ( not ( = ?auto_677473 ?auto_677484 ) ) ( not ( = ?auto_677473 ?auto_677485 ) ) ( not ( = ?auto_677473 ?auto_677486 ) ) ( not ( = ?auto_677474 ?auto_677475 ) ) ( not ( = ?auto_677474 ?auto_677476 ) ) ( not ( = ?auto_677474 ?auto_677477 ) ) ( not ( = ?auto_677474 ?auto_677478 ) ) ( not ( = ?auto_677474 ?auto_677479 ) ) ( not ( = ?auto_677474 ?auto_677480 ) ) ( not ( = ?auto_677474 ?auto_677481 ) ) ( not ( = ?auto_677474 ?auto_677482 ) ) ( not ( = ?auto_677474 ?auto_677483 ) ) ( not ( = ?auto_677474 ?auto_677484 ) ) ( not ( = ?auto_677474 ?auto_677485 ) ) ( not ( = ?auto_677474 ?auto_677486 ) ) ( not ( = ?auto_677475 ?auto_677476 ) ) ( not ( = ?auto_677475 ?auto_677477 ) ) ( not ( = ?auto_677475 ?auto_677478 ) ) ( not ( = ?auto_677475 ?auto_677479 ) ) ( not ( = ?auto_677475 ?auto_677480 ) ) ( not ( = ?auto_677475 ?auto_677481 ) ) ( not ( = ?auto_677475 ?auto_677482 ) ) ( not ( = ?auto_677475 ?auto_677483 ) ) ( not ( = ?auto_677475 ?auto_677484 ) ) ( not ( = ?auto_677475 ?auto_677485 ) ) ( not ( = ?auto_677475 ?auto_677486 ) ) ( not ( = ?auto_677476 ?auto_677477 ) ) ( not ( = ?auto_677476 ?auto_677478 ) ) ( not ( = ?auto_677476 ?auto_677479 ) ) ( not ( = ?auto_677476 ?auto_677480 ) ) ( not ( = ?auto_677476 ?auto_677481 ) ) ( not ( = ?auto_677476 ?auto_677482 ) ) ( not ( = ?auto_677476 ?auto_677483 ) ) ( not ( = ?auto_677476 ?auto_677484 ) ) ( not ( = ?auto_677476 ?auto_677485 ) ) ( not ( = ?auto_677476 ?auto_677486 ) ) ( not ( = ?auto_677477 ?auto_677478 ) ) ( not ( = ?auto_677477 ?auto_677479 ) ) ( not ( = ?auto_677477 ?auto_677480 ) ) ( not ( = ?auto_677477 ?auto_677481 ) ) ( not ( = ?auto_677477 ?auto_677482 ) ) ( not ( = ?auto_677477 ?auto_677483 ) ) ( not ( = ?auto_677477 ?auto_677484 ) ) ( not ( = ?auto_677477 ?auto_677485 ) ) ( not ( = ?auto_677477 ?auto_677486 ) ) ( not ( = ?auto_677478 ?auto_677479 ) ) ( not ( = ?auto_677478 ?auto_677480 ) ) ( not ( = ?auto_677478 ?auto_677481 ) ) ( not ( = ?auto_677478 ?auto_677482 ) ) ( not ( = ?auto_677478 ?auto_677483 ) ) ( not ( = ?auto_677478 ?auto_677484 ) ) ( not ( = ?auto_677478 ?auto_677485 ) ) ( not ( = ?auto_677478 ?auto_677486 ) ) ( not ( = ?auto_677479 ?auto_677480 ) ) ( not ( = ?auto_677479 ?auto_677481 ) ) ( not ( = ?auto_677479 ?auto_677482 ) ) ( not ( = ?auto_677479 ?auto_677483 ) ) ( not ( = ?auto_677479 ?auto_677484 ) ) ( not ( = ?auto_677479 ?auto_677485 ) ) ( not ( = ?auto_677479 ?auto_677486 ) ) ( not ( = ?auto_677480 ?auto_677481 ) ) ( not ( = ?auto_677480 ?auto_677482 ) ) ( not ( = ?auto_677480 ?auto_677483 ) ) ( not ( = ?auto_677480 ?auto_677484 ) ) ( not ( = ?auto_677480 ?auto_677485 ) ) ( not ( = ?auto_677480 ?auto_677486 ) ) ( not ( = ?auto_677481 ?auto_677482 ) ) ( not ( = ?auto_677481 ?auto_677483 ) ) ( not ( = ?auto_677481 ?auto_677484 ) ) ( not ( = ?auto_677481 ?auto_677485 ) ) ( not ( = ?auto_677481 ?auto_677486 ) ) ( not ( = ?auto_677482 ?auto_677483 ) ) ( not ( = ?auto_677482 ?auto_677484 ) ) ( not ( = ?auto_677482 ?auto_677485 ) ) ( not ( = ?auto_677482 ?auto_677486 ) ) ( not ( = ?auto_677483 ?auto_677484 ) ) ( not ( = ?auto_677483 ?auto_677485 ) ) ( not ( = ?auto_677483 ?auto_677486 ) ) ( not ( = ?auto_677484 ?auto_677485 ) ) ( not ( = ?auto_677484 ?auto_677486 ) ) ( not ( = ?auto_677485 ?auto_677486 ) ) ( ON ?auto_677484 ?auto_677485 ) ( ON ?auto_677483 ?auto_677484 ) ( ON ?auto_677482 ?auto_677483 ) ( ON ?auto_677481 ?auto_677482 ) ( ON ?auto_677480 ?auto_677481 ) ( ON ?auto_677479 ?auto_677480 ) ( ON ?auto_677478 ?auto_677479 ) ( ON ?auto_677477 ?auto_677478 ) ( ON ?auto_677476 ?auto_677477 ) ( ON ?auto_677475 ?auto_677476 ) ( CLEAR ?auto_677473 ) ( ON ?auto_677474 ?auto_677475 ) ( CLEAR ?auto_677474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_677471 ?auto_677472 ?auto_677473 ?auto_677474 )
      ( MAKE-15PILE ?auto_677471 ?auto_677472 ?auto_677473 ?auto_677474 ?auto_677475 ?auto_677476 ?auto_677477 ?auto_677478 ?auto_677479 ?auto_677480 ?auto_677481 ?auto_677482 ?auto_677483 ?auto_677484 ?auto_677485 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677533 - BLOCK
      ?auto_677534 - BLOCK
      ?auto_677535 - BLOCK
      ?auto_677536 - BLOCK
      ?auto_677537 - BLOCK
      ?auto_677538 - BLOCK
      ?auto_677539 - BLOCK
      ?auto_677540 - BLOCK
      ?auto_677541 - BLOCK
      ?auto_677542 - BLOCK
      ?auto_677543 - BLOCK
      ?auto_677544 - BLOCK
      ?auto_677545 - BLOCK
      ?auto_677546 - BLOCK
      ?auto_677547 - BLOCK
    )
    :vars
    (
      ?auto_677548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677547 ?auto_677548 ) ( ON-TABLE ?auto_677533 ) ( ON ?auto_677534 ?auto_677533 ) ( not ( = ?auto_677533 ?auto_677534 ) ) ( not ( = ?auto_677533 ?auto_677535 ) ) ( not ( = ?auto_677533 ?auto_677536 ) ) ( not ( = ?auto_677533 ?auto_677537 ) ) ( not ( = ?auto_677533 ?auto_677538 ) ) ( not ( = ?auto_677533 ?auto_677539 ) ) ( not ( = ?auto_677533 ?auto_677540 ) ) ( not ( = ?auto_677533 ?auto_677541 ) ) ( not ( = ?auto_677533 ?auto_677542 ) ) ( not ( = ?auto_677533 ?auto_677543 ) ) ( not ( = ?auto_677533 ?auto_677544 ) ) ( not ( = ?auto_677533 ?auto_677545 ) ) ( not ( = ?auto_677533 ?auto_677546 ) ) ( not ( = ?auto_677533 ?auto_677547 ) ) ( not ( = ?auto_677533 ?auto_677548 ) ) ( not ( = ?auto_677534 ?auto_677535 ) ) ( not ( = ?auto_677534 ?auto_677536 ) ) ( not ( = ?auto_677534 ?auto_677537 ) ) ( not ( = ?auto_677534 ?auto_677538 ) ) ( not ( = ?auto_677534 ?auto_677539 ) ) ( not ( = ?auto_677534 ?auto_677540 ) ) ( not ( = ?auto_677534 ?auto_677541 ) ) ( not ( = ?auto_677534 ?auto_677542 ) ) ( not ( = ?auto_677534 ?auto_677543 ) ) ( not ( = ?auto_677534 ?auto_677544 ) ) ( not ( = ?auto_677534 ?auto_677545 ) ) ( not ( = ?auto_677534 ?auto_677546 ) ) ( not ( = ?auto_677534 ?auto_677547 ) ) ( not ( = ?auto_677534 ?auto_677548 ) ) ( not ( = ?auto_677535 ?auto_677536 ) ) ( not ( = ?auto_677535 ?auto_677537 ) ) ( not ( = ?auto_677535 ?auto_677538 ) ) ( not ( = ?auto_677535 ?auto_677539 ) ) ( not ( = ?auto_677535 ?auto_677540 ) ) ( not ( = ?auto_677535 ?auto_677541 ) ) ( not ( = ?auto_677535 ?auto_677542 ) ) ( not ( = ?auto_677535 ?auto_677543 ) ) ( not ( = ?auto_677535 ?auto_677544 ) ) ( not ( = ?auto_677535 ?auto_677545 ) ) ( not ( = ?auto_677535 ?auto_677546 ) ) ( not ( = ?auto_677535 ?auto_677547 ) ) ( not ( = ?auto_677535 ?auto_677548 ) ) ( not ( = ?auto_677536 ?auto_677537 ) ) ( not ( = ?auto_677536 ?auto_677538 ) ) ( not ( = ?auto_677536 ?auto_677539 ) ) ( not ( = ?auto_677536 ?auto_677540 ) ) ( not ( = ?auto_677536 ?auto_677541 ) ) ( not ( = ?auto_677536 ?auto_677542 ) ) ( not ( = ?auto_677536 ?auto_677543 ) ) ( not ( = ?auto_677536 ?auto_677544 ) ) ( not ( = ?auto_677536 ?auto_677545 ) ) ( not ( = ?auto_677536 ?auto_677546 ) ) ( not ( = ?auto_677536 ?auto_677547 ) ) ( not ( = ?auto_677536 ?auto_677548 ) ) ( not ( = ?auto_677537 ?auto_677538 ) ) ( not ( = ?auto_677537 ?auto_677539 ) ) ( not ( = ?auto_677537 ?auto_677540 ) ) ( not ( = ?auto_677537 ?auto_677541 ) ) ( not ( = ?auto_677537 ?auto_677542 ) ) ( not ( = ?auto_677537 ?auto_677543 ) ) ( not ( = ?auto_677537 ?auto_677544 ) ) ( not ( = ?auto_677537 ?auto_677545 ) ) ( not ( = ?auto_677537 ?auto_677546 ) ) ( not ( = ?auto_677537 ?auto_677547 ) ) ( not ( = ?auto_677537 ?auto_677548 ) ) ( not ( = ?auto_677538 ?auto_677539 ) ) ( not ( = ?auto_677538 ?auto_677540 ) ) ( not ( = ?auto_677538 ?auto_677541 ) ) ( not ( = ?auto_677538 ?auto_677542 ) ) ( not ( = ?auto_677538 ?auto_677543 ) ) ( not ( = ?auto_677538 ?auto_677544 ) ) ( not ( = ?auto_677538 ?auto_677545 ) ) ( not ( = ?auto_677538 ?auto_677546 ) ) ( not ( = ?auto_677538 ?auto_677547 ) ) ( not ( = ?auto_677538 ?auto_677548 ) ) ( not ( = ?auto_677539 ?auto_677540 ) ) ( not ( = ?auto_677539 ?auto_677541 ) ) ( not ( = ?auto_677539 ?auto_677542 ) ) ( not ( = ?auto_677539 ?auto_677543 ) ) ( not ( = ?auto_677539 ?auto_677544 ) ) ( not ( = ?auto_677539 ?auto_677545 ) ) ( not ( = ?auto_677539 ?auto_677546 ) ) ( not ( = ?auto_677539 ?auto_677547 ) ) ( not ( = ?auto_677539 ?auto_677548 ) ) ( not ( = ?auto_677540 ?auto_677541 ) ) ( not ( = ?auto_677540 ?auto_677542 ) ) ( not ( = ?auto_677540 ?auto_677543 ) ) ( not ( = ?auto_677540 ?auto_677544 ) ) ( not ( = ?auto_677540 ?auto_677545 ) ) ( not ( = ?auto_677540 ?auto_677546 ) ) ( not ( = ?auto_677540 ?auto_677547 ) ) ( not ( = ?auto_677540 ?auto_677548 ) ) ( not ( = ?auto_677541 ?auto_677542 ) ) ( not ( = ?auto_677541 ?auto_677543 ) ) ( not ( = ?auto_677541 ?auto_677544 ) ) ( not ( = ?auto_677541 ?auto_677545 ) ) ( not ( = ?auto_677541 ?auto_677546 ) ) ( not ( = ?auto_677541 ?auto_677547 ) ) ( not ( = ?auto_677541 ?auto_677548 ) ) ( not ( = ?auto_677542 ?auto_677543 ) ) ( not ( = ?auto_677542 ?auto_677544 ) ) ( not ( = ?auto_677542 ?auto_677545 ) ) ( not ( = ?auto_677542 ?auto_677546 ) ) ( not ( = ?auto_677542 ?auto_677547 ) ) ( not ( = ?auto_677542 ?auto_677548 ) ) ( not ( = ?auto_677543 ?auto_677544 ) ) ( not ( = ?auto_677543 ?auto_677545 ) ) ( not ( = ?auto_677543 ?auto_677546 ) ) ( not ( = ?auto_677543 ?auto_677547 ) ) ( not ( = ?auto_677543 ?auto_677548 ) ) ( not ( = ?auto_677544 ?auto_677545 ) ) ( not ( = ?auto_677544 ?auto_677546 ) ) ( not ( = ?auto_677544 ?auto_677547 ) ) ( not ( = ?auto_677544 ?auto_677548 ) ) ( not ( = ?auto_677545 ?auto_677546 ) ) ( not ( = ?auto_677545 ?auto_677547 ) ) ( not ( = ?auto_677545 ?auto_677548 ) ) ( not ( = ?auto_677546 ?auto_677547 ) ) ( not ( = ?auto_677546 ?auto_677548 ) ) ( not ( = ?auto_677547 ?auto_677548 ) ) ( ON ?auto_677546 ?auto_677547 ) ( ON ?auto_677545 ?auto_677546 ) ( ON ?auto_677544 ?auto_677545 ) ( ON ?auto_677543 ?auto_677544 ) ( ON ?auto_677542 ?auto_677543 ) ( ON ?auto_677541 ?auto_677542 ) ( ON ?auto_677540 ?auto_677541 ) ( ON ?auto_677539 ?auto_677540 ) ( ON ?auto_677538 ?auto_677539 ) ( ON ?auto_677537 ?auto_677538 ) ( ON ?auto_677536 ?auto_677537 ) ( CLEAR ?auto_677534 ) ( ON ?auto_677535 ?auto_677536 ) ( CLEAR ?auto_677535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_677533 ?auto_677534 ?auto_677535 )
      ( MAKE-15PILE ?auto_677533 ?auto_677534 ?auto_677535 ?auto_677536 ?auto_677537 ?auto_677538 ?auto_677539 ?auto_677540 ?auto_677541 ?auto_677542 ?auto_677543 ?auto_677544 ?auto_677545 ?auto_677546 ?auto_677547 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677595 - BLOCK
      ?auto_677596 - BLOCK
      ?auto_677597 - BLOCK
      ?auto_677598 - BLOCK
      ?auto_677599 - BLOCK
      ?auto_677600 - BLOCK
      ?auto_677601 - BLOCK
      ?auto_677602 - BLOCK
      ?auto_677603 - BLOCK
      ?auto_677604 - BLOCK
      ?auto_677605 - BLOCK
      ?auto_677606 - BLOCK
      ?auto_677607 - BLOCK
      ?auto_677608 - BLOCK
      ?auto_677609 - BLOCK
    )
    :vars
    (
      ?auto_677610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677609 ?auto_677610 ) ( ON-TABLE ?auto_677595 ) ( not ( = ?auto_677595 ?auto_677596 ) ) ( not ( = ?auto_677595 ?auto_677597 ) ) ( not ( = ?auto_677595 ?auto_677598 ) ) ( not ( = ?auto_677595 ?auto_677599 ) ) ( not ( = ?auto_677595 ?auto_677600 ) ) ( not ( = ?auto_677595 ?auto_677601 ) ) ( not ( = ?auto_677595 ?auto_677602 ) ) ( not ( = ?auto_677595 ?auto_677603 ) ) ( not ( = ?auto_677595 ?auto_677604 ) ) ( not ( = ?auto_677595 ?auto_677605 ) ) ( not ( = ?auto_677595 ?auto_677606 ) ) ( not ( = ?auto_677595 ?auto_677607 ) ) ( not ( = ?auto_677595 ?auto_677608 ) ) ( not ( = ?auto_677595 ?auto_677609 ) ) ( not ( = ?auto_677595 ?auto_677610 ) ) ( not ( = ?auto_677596 ?auto_677597 ) ) ( not ( = ?auto_677596 ?auto_677598 ) ) ( not ( = ?auto_677596 ?auto_677599 ) ) ( not ( = ?auto_677596 ?auto_677600 ) ) ( not ( = ?auto_677596 ?auto_677601 ) ) ( not ( = ?auto_677596 ?auto_677602 ) ) ( not ( = ?auto_677596 ?auto_677603 ) ) ( not ( = ?auto_677596 ?auto_677604 ) ) ( not ( = ?auto_677596 ?auto_677605 ) ) ( not ( = ?auto_677596 ?auto_677606 ) ) ( not ( = ?auto_677596 ?auto_677607 ) ) ( not ( = ?auto_677596 ?auto_677608 ) ) ( not ( = ?auto_677596 ?auto_677609 ) ) ( not ( = ?auto_677596 ?auto_677610 ) ) ( not ( = ?auto_677597 ?auto_677598 ) ) ( not ( = ?auto_677597 ?auto_677599 ) ) ( not ( = ?auto_677597 ?auto_677600 ) ) ( not ( = ?auto_677597 ?auto_677601 ) ) ( not ( = ?auto_677597 ?auto_677602 ) ) ( not ( = ?auto_677597 ?auto_677603 ) ) ( not ( = ?auto_677597 ?auto_677604 ) ) ( not ( = ?auto_677597 ?auto_677605 ) ) ( not ( = ?auto_677597 ?auto_677606 ) ) ( not ( = ?auto_677597 ?auto_677607 ) ) ( not ( = ?auto_677597 ?auto_677608 ) ) ( not ( = ?auto_677597 ?auto_677609 ) ) ( not ( = ?auto_677597 ?auto_677610 ) ) ( not ( = ?auto_677598 ?auto_677599 ) ) ( not ( = ?auto_677598 ?auto_677600 ) ) ( not ( = ?auto_677598 ?auto_677601 ) ) ( not ( = ?auto_677598 ?auto_677602 ) ) ( not ( = ?auto_677598 ?auto_677603 ) ) ( not ( = ?auto_677598 ?auto_677604 ) ) ( not ( = ?auto_677598 ?auto_677605 ) ) ( not ( = ?auto_677598 ?auto_677606 ) ) ( not ( = ?auto_677598 ?auto_677607 ) ) ( not ( = ?auto_677598 ?auto_677608 ) ) ( not ( = ?auto_677598 ?auto_677609 ) ) ( not ( = ?auto_677598 ?auto_677610 ) ) ( not ( = ?auto_677599 ?auto_677600 ) ) ( not ( = ?auto_677599 ?auto_677601 ) ) ( not ( = ?auto_677599 ?auto_677602 ) ) ( not ( = ?auto_677599 ?auto_677603 ) ) ( not ( = ?auto_677599 ?auto_677604 ) ) ( not ( = ?auto_677599 ?auto_677605 ) ) ( not ( = ?auto_677599 ?auto_677606 ) ) ( not ( = ?auto_677599 ?auto_677607 ) ) ( not ( = ?auto_677599 ?auto_677608 ) ) ( not ( = ?auto_677599 ?auto_677609 ) ) ( not ( = ?auto_677599 ?auto_677610 ) ) ( not ( = ?auto_677600 ?auto_677601 ) ) ( not ( = ?auto_677600 ?auto_677602 ) ) ( not ( = ?auto_677600 ?auto_677603 ) ) ( not ( = ?auto_677600 ?auto_677604 ) ) ( not ( = ?auto_677600 ?auto_677605 ) ) ( not ( = ?auto_677600 ?auto_677606 ) ) ( not ( = ?auto_677600 ?auto_677607 ) ) ( not ( = ?auto_677600 ?auto_677608 ) ) ( not ( = ?auto_677600 ?auto_677609 ) ) ( not ( = ?auto_677600 ?auto_677610 ) ) ( not ( = ?auto_677601 ?auto_677602 ) ) ( not ( = ?auto_677601 ?auto_677603 ) ) ( not ( = ?auto_677601 ?auto_677604 ) ) ( not ( = ?auto_677601 ?auto_677605 ) ) ( not ( = ?auto_677601 ?auto_677606 ) ) ( not ( = ?auto_677601 ?auto_677607 ) ) ( not ( = ?auto_677601 ?auto_677608 ) ) ( not ( = ?auto_677601 ?auto_677609 ) ) ( not ( = ?auto_677601 ?auto_677610 ) ) ( not ( = ?auto_677602 ?auto_677603 ) ) ( not ( = ?auto_677602 ?auto_677604 ) ) ( not ( = ?auto_677602 ?auto_677605 ) ) ( not ( = ?auto_677602 ?auto_677606 ) ) ( not ( = ?auto_677602 ?auto_677607 ) ) ( not ( = ?auto_677602 ?auto_677608 ) ) ( not ( = ?auto_677602 ?auto_677609 ) ) ( not ( = ?auto_677602 ?auto_677610 ) ) ( not ( = ?auto_677603 ?auto_677604 ) ) ( not ( = ?auto_677603 ?auto_677605 ) ) ( not ( = ?auto_677603 ?auto_677606 ) ) ( not ( = ?auto_677603 ?auto_677607 ) ) ( not ( = ?auto_677603 ?auto_677608 ) ) ( not ( = ?auto_677603 ?auto_677609 ) ) ( not ( = ?auto_677603 ?auto_677610 ) ) ( not ( = ?auto_677604 ?auto_677605 ) ) ( not ( = ?auto_677604 ?auto_677606 ) ) ( not ( = ?auto_677604 ?auto_677607 ) ) ( not ( = ?auto_677604 ?auto_677608 ) ) ( not ( = ?auto_677604 ?auto_677609 ) ) ( not ( = ?auto_677604 ?auto_677610 ) ) ( not ( = ?auto_677605 ?auto_677606 ) ) ( not ( = ?auto_677605 ?auto_677607 ) ) ( not ( = ?auto_677605 ?auto_677608 ) ) ( not ( = ?auto_677605 ?auto_677609 ) ) ( not ( = ?auto_677605 ?auto_677610 ) ) ( not ( = ?auto_677606 ?auto_677607 ) ) ( not ( = ?auto_677606 ?auto_677608 ) ) ( not ( = ?auto_677606 ?auto_677609 ) ) ( not ( = ?auto_677606 ?auto_677610 ) ) ( not ( = ?auto_677607 ?auto_677608 ) ) ( not ( = ?auto_677607 ?auto_677609 ) ) ( not ( = ?auto_677607 ?auto_677610 ) ) ( not ( = ?auto_677608 ?auto_677609 ) ) ( not ( = ?auto_677608 ?auto_677610 ) ) ( not ( = ?auto_677609 ?auto_677610 ) ) ( ON ?auto_677608 ?auto_677609 ) ( ON ?auto_677607 ?auto_677608 ) ( ON ?auto_677606 ?auto_677607 ) ( ON ?auto_677605 ?auto_677606 ) ( ON ?auto_677604 ?auto_677605 ) ( ON ?auto_677603 ?auto_677604 ) ( ON ?auto_677602 ?auto_677603 ) ( ON ?auto_677601 ?auto_677602 ) ( ON ?auto_677600 ?auto_677601 ) ( ON ?auto_677599 ?auto_677600 ) ( ON ?auto_677598 ?auto_677599 ) ( ON ?auto_677597 ?auto_677598 ) ( CLEAR ?auto_677595 ) ( ON ?auto_677596 ?auto_677597 ) ( CLEAR ?auto_677596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_677595 ?auto_677596 )
      ( MAKE-15PILE ?auto_677595 ?auto_677596 ?auto_677597 ?auto_677598 ?auto_677599 ?auto_677600 ?auto_677601 ?auto_677602 ?auto_677603 ?auto_677604 ?auto_677605 ?auto_677606 ?auto_677607 ?auto_677608 ?auto_677609 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_677657 - BLOCK
      ?auto_677658 - BLOCK
      ?auto_677659 - BLOCK
      ?auto_677660 - BLOCK
      ?auto_677661 - BLOCK
      ?auto_677662 - BLOCK
      ?auto_677663 - BLOCK
      ?auto_677664 - BLOCK
      ?auto_677665 - BLOCK
      ?auto_677666 - BLOCK
      ?auto_677667 - BLOCK
      ?auto_677668 - BLOCK
      ?auto_677669 - BLOCK
      ?auto_677670 - BLOCK
      ?auto_677671 - BLOCK
    )
    :vars
    (
      ?auto_677672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677671 ?auto_677672 ) ( not ( = ?auto_677657 ?auto_677658 ) ) ( not ( = ?auto_677657 ?auto_677659 ) ) ( not ( = ?auto_677657 ?auto_677660 ) ) ( not ( = ?auto_677657 ?auto_677661 ) ) ( not ( = ?auto_677657 ?auto_677662 ) ) ( not ( = ?auto_677657 ?auto_677663 ) ) ( not ( = ?auto_677657 ?auto_677664 ) ) ( not ( = ?auto_677657 ?auto_677665 ) ) ( not ( = ?auto_677657 ?auto_677666 ) ) ( not ( = ?auto_677657 ?auto_677667 ) ) ( not ( = ?auto_677657 ?auto_677668 ) ) ( not ( = ?auto_677657 ?auto_677669 ) ) ( not ( = ?auto_677657 ?auto_677670 ) ) ( not ( = ?auto_677657 ?auto_677671 ) ) ( not ( = ?auto_677657 ?auto_677672 ) ) ( not ( = ?auto_677658 ?auto_677659 ) ) ( not ( = ?auto_677658 ?auto_677660 ) ) ( not ( = ?auto_677658 ?auto_677661 ) ) ( not ( = ?auto_677658 ?auto_677662 ) ) ( not ( = ?auto_677658 ?auto_677663 ) ) ( not ( = ?auto_677658 ?auto_677664 ) ) ( not ( = ?auto_677658 ?auto_677665 ) ) ( not ( = ?auto_677658 ?auto_677666 ) ) ( not ( = ?auto_677658 ?auto_677667 ) ) ( not ( = ?auto_677658 ?auto_677668 ) ) ( not ( = ?auto_677658 ?auto_677669 ) ) ( not ( = ?auto_677658 ?auto_677670 ) ) ( not ( = ?auto_677658 ?auto_677671 ) ) ( not ( = ?auto_677658 ?auto_677672 ) ) ( not ( = ?auto_677659 ?auto_677660 ) ) ( not ( = ?auto_677659 ?auto_677661 ) ) ( not ( = ?auto_677659 ?auto_677662 ) ) ( not ( = ?auto_677659 ?auto_677663 ) ) ( not ( = ?auto_677659 ?auto_677664 ) ) ( not ( = ?auto_677659 ?auto_677665 ) ) ( not ( = ?auto_677659 ?auto_677666 ) ) ( not ( = ?auto_677659 ?auto_677667 ) ) ( not ( = ?auto_677659 ?auto_677668 ) ) ( not ( = ?auto_677659 ?auto_677669 ) ) ( not ( = ?auto_677659 ?auto_677670 ) ) ( not ( = ?auto_677659 ?auto_677671 ) ) ( not ( = ?auto_677659 ?auto_677672 ) ) ( not ( = ?auto_677660 ?auto_677661 ) ) ( not ( = ?auto_677660 ?auto_677662 ) ) ( not ( = ?auto_677660 ?auto_677663 ) ) ( not ( = ?auto_677660 ?auto_677664 ) ) ( not ( = ?auto_677660 ?auto_677665 ) ) ( not ( = ?auto_677660 ?auto_677666 ) ) ( not ( = ?auto_677660 ?auto_677667 ) ) ( not ( = ?auto_677660 ?auto_677668 ) ) ( not ( = ?auto_677660 ?auto_677669 ) ) ( not ( = ?auto_677660 ?auto_677670 ) ) ( not ( = ?auto_677660 ?auto_677671 ) ) ( not ( = ?auto_677660 ?auto_677672 ) ) ( not ( = ?auto_677661 ?auto_677662 ) ) ( not ( = ?auto_677661 ?auto_677663 ) ) ( not ( = ?auto_677661 ?auto_677664 ) ) ( not ( = ?auto_677661 ?auto_677665 ) ) ( not ( = ?auto_677661 ?auto_677666 ) ) ( not ( = ?auto_677661 ?auto_677667 ) ) ( not ( = ?auto_677661 ?auto_677668 ) ) ( not ( = ?auto_677661 ?auto_677669 ) ) ( not ( = ?auto_677661 ?auto_677670 ) ) ( not ( = ?auto_677661 ?auto_677671 ) ) ( not ( = ?auto_677661 ?auto_677672 ) ) ( not ( = ?auto_677662 ?auto_677663 ) ) ( not ( = ?auto_677662 ?auto_677664 ) ) ( not ( = ?auto_677662 ?auto_677665 ) ) ( not ( = ?auto_677662 ?auto_677666 ) ) ( not ( = ?auto_677662 ?auto_677667 ) ) ( not ( = ?auto_677662 ?auto_677668 ) ) ( not ( = ?auto_677662 ?auto_677669 ) ) ( not ( = ?auto_677662 ?auto_677670 ) ) ( not ( = ?auto_677662 ?auto_677671 ) ) ( not ( = ?auto_677662 ?auto_677672 ) ) ( not ( = ?auto_677663 ?auto_677664 ) ) ( not ( = ?auto_677663 ?auto_677665 ) ) ( not ( = ?auto_677663 ?auto_677666 ) ) ( not ( = ?auto_677663 ?auto_677667 ) ) ( not ( = ?auto_677663 ?auto_677668 ) ) ( not ( = ?auto_677663 ?auto_677669 ) ) ( not ( = ?auto_677663 ?auto_677670 ) ) ( not ( = ?auto_677663 ?auto_677671 ) ) ( not ( = ?auto_677663 ?auto_677672 ) ) ( not ( = ?auto_677664 ?auto_677665 ) ) ( not ( = ?auto_677664 ?auto_677666 ) ) ( not ( = ?auto_677664 ?auto_677667 ) ) ( not ( = ?auto_677664 ?auto_677668 ) ) ( not ( = ?auto_677664 ?auto_677669 ) ) ( not ( = ?auto_677664 ?auto_677670 ) ) ( not ( = ?auto_677664 ?auto_677671 ) ) ( not ( = ?auto_677664 ?auto_677672 ) ) ( not ( = ?auto_677665 ?auto_677666 ) ) ( not ( = ?auto_677665 ?auto_677667 ) ) ( not ( = ?auto_677665 ?auto_677668 ) ) ( not ( = ?auto_677665 ?auto_677669 ) ) ( not ( = ?auto_677665 ?auto_677670 ) ) ( not ( = ?auto_677665 ?auto_677671 ) ) ( not ( = ?auto_677665 ?auto_677672 ) ) ( not ( = ?auto_677666 ?auto_677667 ) ) ( not ( = ?auto_677666 ?auto_677668 ) ) ( not ( = ?auto_677666 ?auto_677669 ) ) ( not ( = ?auto_677666 ?auto_677670 ) ) ( not ( = ?auto_677666 ?auto_677671 ) ) ( not ( = ?auto_677666 ?auto_677672 ) ) ( not ( = ?auto_677667 ?auto_677668 ) ) ( not ( = ?auto_677667 ?auto_677669 ) ) ( not ( = ?auto_677667 ?auto_677670 ) ) ( not ( = ?auto_677667 ?auto_677671 ) ) ( not ( = ?auto_677667 ?auto_677672 ) ) ( not ( = ?auto_677668 ?auto_677669 ) ) ( not ( = ?auto_677668 ?auto_677670 ) ) ( not ( = ?auto_677668 ?auto_677671 ) ) ( not ( = ?auto_677668 ?auto_677672 ) ) ( not ( = ?auto_677669 ?auto_677670 ) ) ( not ( = ?auto_677669 ?auto_677671 ) ) ( not ( = ?auto_677669 ?auto_677672 ) ) ( not ( = ?auto_677670 ?auto_677671 ) ) ( not ( = ?auto_677670 ?auto_677672 ) ) ( not ( = ?auto_677671 ?auto_677672 ) ) ( ON ?auto_677670 ?auto_677671 ) ( ON ?auto_677669 ?auto_677670 ) ( ON ?auto_677668 ?auto_677669 ) ( ON ?auto_677667 ?auto_677668 ) ( ON ?auto_677666 ?auto_677667 ) ( ON ?auto_677665 ?auto_677666 ) ( ON ?auto_677664 ?auto_677665 ) ( ON ?auto_677663 ?auto_677664 ) ( ON ?auto_677662 ?auto_677663 ) ( ON ?auto_677661 ?auto_677662 ) ( ON ?auto_677660 ?auto_677661 ) ( ON ?auto_677659 ?auto_677660 ) ( ON ?auto_677658 ?auto_677659 ) ( ON ?auto_677657 ?auto_677658 ) ( CLEAR ?auto_677657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_677657 )
      ( MAKE-15PILE ?auto_677657 ?auto_677658 ?auto_677659 ?auto_677660 ?auto_677661 ?auto_677662 ?auto_677663 ?auto_677664 ?auto_677665 ?auto_677666 ?auto_677667 ?auto_677668 ?auto_677669 ?auto_677670 ?auto_677671 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_677720 - BLOCK
      ?auto_677721 - BLOCK
      ?auto_677722 - BLOCK
      ?auto_677723 - BLOCK
      ?auto_677724 - BLOCK
      ?auto_677725 - BLOCK
      ?auto_677726 - BLOCK
      ?auto_677727 - BLOCK
      ?auto_677728 - BLOCK
      ?auto_677729 - BLOCK
      ?auto_677730 - BLOCK
      ?auto_677731 - BLOCK
      ?auto_677732 - BLOCK
      ?auto_677733 - BLOCK
      ?auto_677734 - BLOCK
      ?auto_677735 - BLOCK
    )
    :vars
    (
      ?auto_677736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_677734 ) ( ON ?auto_677735 ?auto_677736 ) ( CLEAR ?auto_677735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_677720 ) ( ON ?auto_677721 ?auto_677720 ) ( ON ?auto_677722 ?auto_677721 ) ( ON ?auto_677723 ?auto_677722 ) ( ON ?auto_677724 ?auto_677723 ) ( ON ?auto_677725 ?auto_677724 ) ( ON ?auto_677726 ?auto_677725 ) ( ON ?auto_677727 ?auto_677726 ) ( ON ?auto_677728 ?auto_677727 ) ( ON ?auto_677729 ?auto_677728 ) ( ON ?auto_677730 ?auto_677729 ) ( ON ?auto_677731 ?auto_677730 ) ( ON ?auto_677732 ?auto_677731 ) ( ON ?auto_677733 ?auto_677732 ) ( ON ?auto_677734 ?auto_677733 ) ( not ( = ?auto_677720 ?auto_677721 ) ) ( not ( = ?auto_677720 ?auto_677722 ) ) ( not ( = ?auto_677720 ?auto_677723 ) ) ( not ( = ?auto_677720 ?auto_677724 ) ) ( not ( = ?auto_677720 ?auto_677725 ) ) ( not ( = ?auto_677720 ?auto_677726 ) ) ( not ( = ?auto_677720 ?auto_677727 ) ) ( not ( = ?auto_677720 ?auto_677728 ) ) ( not ( = ?auto_677720 ?auto_677729 ) ) ( not ( = ?auto_677720 ?auto_677730 ) ) ( not ( = ?auto_677720 ?auto_677731 ) ) ( not ( = ?auto_677720 ?auto_677732 ) ) ( not ( = ?auto_677720 ?auto_677733 ) ) ( not ( = ?auto_677720 ?auto_677734 ) ) ( not ( = ?auto_677720 ?auto_677735 ) ) ( not ( = ?auto_677720 ?auto_677736 ) ) ( not ( = ?auto_677721 ?auto_677722 ) ) ( not ( = ?auto_677721 ?auto_677723 ) ) ( not ( = ?auto_677721 ?auto_677724 ) ) ( not ( = ?auto_677721 ?auto_677725 ) ) ( not ( = ?auto_677721 ?auto_677726 ) ) ( not ( = ?auto_677721 ?auto_677727 ) ) ( not ( = ?auto_677721 ?auto_677728 ) ) ( not ( = ?auto_677721 ?auto_677729 ) ) ( not ( = ?auto_677721 ?auto_677730 ) ) ( not ( = ?auto_677721 ?auto_677731 ) ) ( not ( = ?auto_677721 ?auto_677732 ) ) ( not ( = ?auto_677721 ?auto_677733 ) ) ( not ( = ?auto_677721 ?auto_677734 ) ) ( not ( = ?auto_677721 ?auto_677735 ) ) ( not ( = ?auto_677721 ?auto_677736 ) ) ( not ( = ?auto_677722 ?auto_677723 ) ) ( not ( = ?auto_677722 ?auto_677724 ) ) ( not ( = ?auto_677722 ?auto_677725 ) ) ( not ( = ?auto_677722 ?auto_677726 ) ) ( not ( = ?auto_677722 ?auto_677727 ) ) ( not ( = ?auto_677722 ?auto_677728 ) ) ( not ( = ?auto_677722 ?auto_677729 ) ) ( not ( = ?auto_677722 ?auto_677730 ) ) ( not ( = ?auto_677722 ?auto_677731 ) ) ( not ( = ?auto_677722 ?auto_677732 ) ) ( not ( = ?auto_677722 ?auto_677733 ) ) ( not ( = ?auto_677722 ?auto_677734 ) ) ( not ( = ?auto_677722 ?auto_677735 ) ) ( not ( = ?auto_677722 ?auto_677736 ) ) ( not ( = ?auto_677723 ?auto_677724 ) ) ( not ( = ?auto_677723 ?auto_677725 ) ) ( not ( = ?auto_677723 ?auto_677726 ) ) ( not ( = ?auto_677723 ?auto_677727 ) ) ( not ( = ?auto_677723 ?auto_677728 ) ) ( not ( = ?auto_677723 ?auto_677729 ) ) ( not ( = ?auto_677723 ?auto_677730 ) ) ( not ( = ?auto_677723 ?auto_677731 ) ) ( not ( = ?auto_677723 ?auto_677732 ) ) ( not ( = ?auto_677723 ?auto_677733 ) ) ( not ( = ?auto_677723 ?auto_677734 ) ) ( not ( = ?auto_677723 ?auto_677735 ) ) ( not ( = ?auto_677723 ?auto_677736 ) ) ( not ( = ?auto_677724 ?auto_677725 ) ) ( not ( = ?auto_677724 ?auto_677726 ) ) ( not ( = ?auto_677724 ?auto_677727 ) ) ( not ( = ?auto_677724 ?auto_677728 ) ) ( not ( = ?auto_677724 ?auto_677729 ) ) ( not ( = ?auto_677724 ?auto_677730 ) ) ( not ( = ?auto_677724 ?auto_677731 ) ) ( not ( = ?auto_677724 ?auto_677732 ) ) ( not ( = ?auto_677724 ?auto_677733 ) ) ( not ( = ?auto_677724 ?auto_677734 ) ) ( not ( = ?auto_677724 ?auto_677735 ) ) ( not ( = ?auto_677724 ?auto_677736 ) ) ( not ( = ?auto_677725 ?auto_677726 ) ) ( not ( = ?auto_677725 ?auto_677727 ) ) ( not ( = ?auto_677725 ?auto_677728 ) ) ( not ( = ?auto_677725 ?auto_677729 ) ) ( not ( = ?auto_677725 ?auto_677730 ) ) ( not ( = ?auto_677725 ?auto_677731 ) ) ( not ( = ?auto_677725 ?auto_677732 ) ) ( not ( = ?auto_677725 ?auto_677733 ) ) ( not ( = ?auto_677725 ?auto_677734 ) ) ( not ( = ?auto_677725 ?auto_677735 ) ) ( not ( = ?auto_677725 ?auto_677736 ) ) ( not ( = ?auto_677726 ?auto_677727 ) ) ( not ( = ?auto_677726 ?auto_677728 ) ) ( not ( = ?auto_677726 ?auto_677729 ) ) ( not ( = ?auto_677726 ?auto_677730 ) ) ( not ( = ?auto_677726 ?auto_677731 ) ) ( not ( = ?auto_677726 ?auto_677732 ) ) ( not ( = ?auto_677726 ?auto_677733 ) ) ( not ( = ?auto_677726 ?auto_677734 ) ) ( not ( = ?auto_677726 ?auto_677735 ) ) ( not ( = ?auto_677726 ?auto_677736 ) ) ( not ( = ?auto_677727 ?auto_677728 ) ) ( not ( = ?auto_677727 ?auto_677729 ) ) ( not ( = ?auto_677727 ?auto_677730 ) ) ( not ( = ?auto_677727 ?auto_677731 ) ) ( not ( = ?auto_677727 ?auto_677732 ) ) ( not ( = ?auto_677727 ?auto_677733 ) ) ( not ( = ?auto_677727 ?auto_677734 ) ) ( not ( = ?auto_677727 ?auto_677735 ) ) ( not ( = ?auto_677727 ?auto_677736 ) ) ( not ( = ?auto_677728 ?auto_677729 ) ) ( not ( = ?auto_677728 ?auto_677730 ) ) ( not ( = ?auto_677728 ?auto_677731 ) ) ( not ( = ?auto_677728 ?auto_677732 ) ) ( not ( = ?auto_677728 ?auto_677733 ) ) ( not ( = ?auto_677728 ?auto_677734 ) ) ( not ( = ?auto_677728 ?auto_677735 ) ) ( not ( = ?auto_677728 ?auto_677736 ) ) ( not ( = ?auto_677729 ?auto_677730 ) ) ( not ( = ?auto_677729 ?auto_677731 ) ) ( not ( = ?auto_677729 ?auto_677732 ) ) ( not ( = ?auto_677729 ?auto_677733 ) ) ( not ( = ?auto_677729 ?auto_677734 ) ) ( not ( = ?auto_677729 ?auto_677735 ) ) ( not ( = ?auto_677729 ?auto_677736 ) ) ( not ( = ?auto_677730 ?auto_677731 ) ) ( not ( = ?auto_677730 ?auto_677732 ) ) ( not ( = ?auto_677730 ?auto_677733 ) ) ( not ( = ?auto_677730 ?auto_677734 ) ) ( not ( = ?auto_677730 ?auto_677735 ) ) ( not ( = ?auto_677730 ?auto_677736 ) ) ( not ( = ?auto_677731 ?auto_677732 ) ) ( not ( = ?auto_677731 ?auto_677733 ) ) ( not ( = ?auto_677731 ?auto_677734 ) ) ( not ( = ?auto_677731 ?auto_677735 ) ) ( not ( = ?auto_677731 ?auto_677736 ) ) ( not ( = ?auto_677732 ?auto_677733 ) ) ( not ( = ?auto_677732 ?auto_677734 ) ) ( not ( = ?auto_677732 ?auto_677735 ) ) ( not ( = ?auto_677732 ?auto_677736 ) ) ( not ( = ?auto_677733 ?auto_677734 ) ) ( not ( = ?auto_677733 ?auto_677735 ) ) ( not ( = ?auto_677733 ?auto_677736 ) ) ( not ( = ?auto_677734 ?auto_677735 ) ) ( not ( = ?auto_677734 ?auto_677736 ) ) ( not ( = ?auto_677735 ?auto_677736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_677735 ?auto_677736 )
      ( !STACK ?auto_677735 ?auto_677734 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_677786 - BLOCK
      ?auto_677787 - BLOCK
      ?auto_677788 - BLOCK
      ?auto_677789 - BLOCK
      ?auto_677790 - BLOCK
      ?auto_677791 - BLOCK
      ?auto_677792 - BLOCK
      ?auto_677793 - BLOCK
      ?auto_677794 - BLOCK
      ?auto_677795 - BLOCK
      ?auto_677796 - BLOCK
      ?auto_677797 - BLOCK
      ?auto_677798 - BLOCK
      ?auto_677799 - BLOCK
      ?auto_677800 - BLOCK
      ?auto_677801 - BLOCK
    )
    :vars
    (
      ?auto_677802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677801 ?auto_677802 ) ( ON-TABLE ?auto_677786 ) ( ON ?auto_677787 ?auto_677786 ) ( ON ?auto_677788 ?auto_677787 ) ( ON ?auto_677789 ?auto_677788 ) ( ON ?auto_677790 ?auto_677789 ) ( ON ?auto_677791 ?auto_677790 ) ( ON ?auto_677792 ?auto_677791 ) ( ON ?auto_677793 ?auto_677792 ) ( ON ?auto_677794 ?auto_677793 ) ( ON ?auto_677795 ?auto_677794 ) ( ON ?auto_677796 ?auto_677795 ) ( ON ?auto_677797 ?auto_677796 ) ( ON ?auto_677798 ?auto_677797 ) ( ON ?auto_677799 ?auto_677798 ) ( not ( = ?auto_677786 ?auto_677787 ) ) ( not ( = ?auto_677786 ?auto_677788 ) ) ( not ( = ?auto_677786 ?auto_677789 ) ) ( not ( = ?auto_677786 ?auto_677790 ) ) ( not ( = ?auto_677786 ?auto_677791 ) ) ( not ( = ?auto_677786 ?auto_677792 ) ) ( not ( = ?auto_677786 ?auto_677793 ) ) ( not ( = ?auto_677786 ?auto_677794 ) ) ( not ( = ?auto_677786 ?auto_677795 ) ) ( not ( = ?auto_677786 ?auto_677796 ) ) ( not ( = ?auto_677786 ?auto_677797 ) ) ( not ( = ?auto_677786 ?auto_677798 ) ) ( not ( = ?auto_677786 ?auto_677799 ) ) ( not ( = ?auto_677786 ?auto_677800 ) ) ( not ( = ?auto_677786 ?auto_677801 ) ) ( not ( = ?auto_677786 ?auto_677802 ) ) ( not ( = ?auto_677787 ?auto_677788 ) ) ( not ( = ?auto_677787 ?auto_677789 ) ) ( not ( = ?auto_677787 ?auto_677790 ) ) ( not ( = ?auto_677787 ?auto_677791 ) ) ( not ( = ?auto_677787 ?auto_677792 ) ) ( not ( = ?auto_677787 ?auto_677793 ) ) ( not ( = ?auto_677787 ?auto_677794 ) ) ( not ( = ?auto_677787 ?auto_677795 ) ) ( not ( = ?auto_677787 ?auto_677796 ) ) ( not ( = ?auto_677787 ?auto_677797 ) ) ( not ( = ?auto_677787 ?auto_677798 ) ) ( not ( = ?auto_677787 ?auto_677799 ) ) ( not ( = ?auto_677787 ?auto_677800 ) ) ( not ( = ?auto_677787 ?auto_677801 ) ) ( not ( = ?auto_677787 ?auto_677802 ) ) ( not ( = ?auto_677788 ?auto_677789 ) ) ( not ( = ?auto_677788 ?auto_677790 ) ) ( not ( = ?auto_677788 ?auto_677791 ) ) ( not ( = ?auto_677788 ?auto_677792 ) ) ( not ( = ?auto_677788 ?auto_677793 ) ) ( not ( = ?auto_677788 ?auto_677794 ) ) ( not ( = ?auto_677788 ?auto_677795 ) ) ( not ( = ?auto_677788 ?auto_677796 ) ) ( not ( = ?auto_677788 ?auto_677797 ) ) ( not ( = ?auto_677788 ?auto_677798 ) ) ( not ( = ?auto_677788 ?auto_677799 ) ) ( not ( = ?auto_677788 ?auto_677800 ) ) ( not ( = ?auto_677788 ?auto_677801 ) ) ( not ( = ?auto_677788 ?auto_677802 ) ) ( not ( = ?auto_677789 ?auto_677790 ) ) ( not ( = ?auto_677789 ?auto_677791 ) ) ( not ( = ?auto_677789 ?auto_677792 ) ) ( not ( = ?auto_677789 ?auto_677793 ) ) ( not ( = ?auto_677789 ?auto_677794 ) ) ( not ( = ?auto_677789 ?auto_677795 ) ) ( not ( = ?auto_677789 ?auto_677796 ) ) ( not ( = ?auto_677789 ?auto_677797 ) ) ( not ( = ?auto_677789 ?auto_677798 ) ) ( not ( = ?auto_677789 ?auto_677799 ) ) ( not ( = ?auto_677789 ?auto_677800 ) ) ( not ( = ?auto_677789 ?auto_677801 ) ) ( not ( = ?auto_677789 ?auto_677802 ) ) ( not ( = ?auto_677790 ?auto_677791 ) ) ( not ( = ?auto_677790 ?auto_677792 ) ) ( not ( = ?auto_677790 ?auto_677793 ) ) ( not ( = ?auto_677790 ?auto_677794 ) ) ( not ( = ?auto_677790 ?auto_677795 ) ) ( not ( = ?auto_677790 ?auto_677796 ) ) ( not ( = ?auto_677790 ?auto_677797 ) ) ( not ( = ?auto_677790 ?auto_677798 ) ) ( not ( = ?auto_677790 ?auto_677799 ) ) ( not ( = ?auto_677790 ?auto_677800 ) ) ( not ( = ?auto_677790 ?auto_677801 ) ) ( not ( = ?auto_677790 ?auto_677802 ) ) ( not ( = ?auto_677791 ?auto_677792 ) ) ( not ( = ?auto_677791 ?auto_677793 ) ) ( not ( = ?auto_677791 ?auto_677794 ) ) ( not ( = ?auto_677791 ?auto_677795 ) ) ( not ( = ?auto_677791 ?auto_677796 ) ) ( not ( = ?auto_677791 ?auto_677797 ) ) ( not ( = ?auto_677791 ?auto_677798 ) ) ( not ( = ?auto_677791 ?auto_677799 ) ) ( not ( = ?auto_677791 ?auto_677800 ) ) ( not ( = ?auto_677791 ?auto_677801 ) ) ( not ( = ?auto_677791 ?auto_677802 ) ) ( not ( = ?auto_677792 ?auto_677793 ) ) ( not ( = ?auto_677792 ?auto_677794 ) ) ( not ( = ?auto_677792 ?auto_677795 ) ) ( not ( = ?auto_677792 ?auto_677796 ) ) ( not ( = ?auto_677792 ?auto_677797 ) ) ( not ( = ?auto_677792 ?auto_677798 ) ) ( not ( = ?auto_677792 ?auto_677799 ) ) ( not ( = ?auto_677792 ?auto_677800 ) ) ( not ( = ?auto_677792 ?auto_677801 ) ) ( not ( = ?auto_677792 ?auto_677802 ) ) ( not ( = ?auto_677793 ?auto_677794 ) ) ( not ( = ?auto_677793 ?auto_677795 ) ) ( not ( = ?auto_677793 ?auto_677796 ) ) ( not ( = ?auto_677793 ?auto_677797 ) ) ( not ( = ?auto_677793 ?auto_677798 ) ) ( not ( = ?auto_677793 ?auto_677799 ) ) ( not ( = ?auto_677793 ?auto_677800 ) ) ( not ( = ?auto_677793 ?auto_677801 ) ) ( not ( = ?auto_677793 ?auto_677802 ) ) ( not ( = ?auto_677794 ?auto_677795 ) ) ( not ( = ?auto_677794 ?auto_677796 ) ) ( not ( = ?auto_677794 ?auto_677797 ) ) ( not ( = ?auto_677794 ?auto_677798 ) ) ( not ( = ?auto_677794 ?auto_677799 ) ) ( not ( = ?auto_677794 ?auto_677800 ) ) ( not ( = ?auto_677794 ?auto_677801 ) ) ( not ( = ?auto_677794 ?auto_677802 ) ) ( not ( = ?auto_677795 ?auto_677796 ) ) ( not ( = ?auto_677795 ?auto_677797 ) ) ( not ( = ?auto_677795 ?auto_677798 ) ) ( not ( = ?auto_677795 ?auto_677799 ) ) ( not ( = ?auto_677795 ?auto_677800 ) ) ( not ( = ?auto_677795 ?auto_677801 ) ) ( not ( = ?auto_677795 ?auto_677802 ) ) ( not ( = ?auto_677796 ?auto_677797 ) ) ( not ( = ?auto_677796 ?auto_677798 ) ) ( not ( = ?auto_677796 ?auto_677799 ) ) ( not ( = ?auto_677796 ?auto_677800 ) ) ( not ( = ?auto_677796 ?auto_677801 ) ) ( not ( = ?auto_677796 ?auto_677802 ) ) ( not ( = ?auto_677797 ?auto_677798 ) ) ( not ( = ?auto_677797 ?auto_677799 ) ) ( not ( = ?auto_677797 ?auto_677800 ) ) ( not ( = ?auto_677797 ?auto_677801 ) ) ( not ( = ?auto_677797 ?auto_677802 ) ) ( not ( = ?auto_677798 ?auto_677799 ) ) ( not ( = ?auto_677798 ?auto_677800 ) ) ( not ( = ?auto_677798 ?auto_677801 ) ) ( not ( = ?auto_677798 ?auto_677802 ) ) ( not ( = ?auto_677799 ?auto_677800 ) ) ( not ( = ?auto_677799 ?auto_677801 ) ) ( not ( = ?auto_677799 ?auto_677802 ) ) ( not ( = ?auto_677800 ?auto_677801 ) ) ( not ( = ?auto_677800 ?auto_677802 ) ) ( not ( = ?auto_677801 ?auto_677802 ) ) ( CLEAR ?auto_677799 ) ( ON ?auto_677800 ?auto_677801 ) ( CLEAR ?auto_677800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_677786 ?auto_677787 ?auto_677788 ?auto_677789 ?auto_677790 ?auto_677791 ?auto_677792 ?auto_677793 ?auto_677794 ?auto_677795 ?auto_677796 ?auto_677797 ?auto_677798 ?auto_677799 ?auto_677800 )
      ( MAKE-16PILE ?auto_677786 ?auto_677787 ?auto_677788 ?auto_677789 ?auto_677790 ?auto_677791 ?auto_677792 ?auto_677793 ?auto_677794 ?auto_677795 ?auto_677796 ?auto_677797 ?auto_677798 ?auto_677799 ?auto_677800 ?auto_677801 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_677852 - BLOCK
      ?auto_677853 - BLOCK
      ?auto_677854 - BLOCK
      ?auto_677855 - BLOCK
      ?auto_677856 - BLOCK
      ?auto_677857 - BLOCK
      ?auto_677858 - BLOCK
      ?auto_677859 - BLOCK
      ?auto_677860 - BLOCK
      ?auto_677861 - BLOCK
      ?auto_677862 - BLOCK
      ?auto_677863 - BLOCK
      ?auto_677864 - BLOCK
      ?auto_677865 - BLOCK
      ?auto_677866 - BLOCK
      ?auto_677867 - BLOCK
    )
    :vars
    (
      ?auto_677868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677867 ?auto_677868 ) ( ON-TABLE ?auto_677852 ) ( ON ?auto_677853 ?auto_677852 ) ( ON ?auto_677854 ?auto_677853 ) ( ON ?auto_677855 ?auto_677854 ) ( ON ?auto_677856 ?auto_677855 ) ( ON ?auto_677857 ?auto_677856 ) ( ON ?auto_677858 ?auto_677857 ) ( ON ?auto_677859 ?auto_677858 ) ( ON ?auto_677860 ?auto_677859 ) ( ON ?auto_677861 ?auto_677860 ) ( ON ?auto_677862 ?auto_677861 ) ( ON ?auto_677863 ?auto_677862 ) ( ON ?auto_677864 ?auto_677863 ) ( not ( = ?auto_677852 ?auto_677853 ) ) ( not ( = ?auto_677852 ?auto_677854 ) ) ( not ( = ?auto_677852 ?auto_677855 ) ) ( not ( = ?auto_677852 ?auto_677856 ) ) ( not ( = ?auto_677852 ?auto_677857 ) ) ( not ( = ?auto_677852 ?auto_677858 ) ) ( not ( = ?auto_677852 ?auto_677859 ) ) ( not ( = ?auto_677852 ?auto_677860 ) ) ( not ( = ?auto_677852 ?auto_677861 ) ) ( not ( = ?auto_677852 ?auto_677862 ) ) ( not ( = ?auto_677852 ?auto_677863 ) ) ( not ( = ?auto_677852 ?auto_677864 ) ) ( not ( = ?auto_677852 ?auto_677865 ) ) ( not ( = ?auto_677852 ?auto_677866 ) ) ( not ( = ?auto_677852 ?auto_677867 ) ) ( not ( = ?auto_677852 ?auto_677868 ) ) ( not ( = ?auto_677853 ?auto_677854 ) ) ( not ( = ?auto_677853 ?auto_677855 ) ) ( not ( = ?auto_677853 ?auto_677856 ) ) ( not ( = ?auto_677853 ?auto_677857 ) ) ( not ( = ?auto_677853 ?auto_677858 ) ) ( not ( = ?auto_677853 ?auto_677859 ) ) ( not ( = ?auto_677853 ?auto_677860 ) ) ( not ( = ?auto_677853 ?auto_677861 ) ) ( not ( = ?auto_677853 ?auto_677862 ) ) ( not ( = ?auto_677853 ?auto_677863 ) ) ( not ( = ?auto_677853 ?auto_677864 ) ) ( not ( = ?auto_677853 ?auto_677865 ) ) ( not ( = ?auto_677853 ?auto_677866 ) ) ( not ( = ?auto_677853 ?auto_677867 ) ) ( not ( = ?auto_677853 ?auto_677868 ) ) ( not ( = ?auto_677854 ?auto_677855 ) ) ( not ( = ?auto_677854 ?auto_677856 ) ) ( not ( = ?auto_677854 ?auto_677857 ) ) ( not ( = ?auto_677854 ?auto_677858 ) ) ( not ( = ?auto_677854 ?auto_677859 ) ) ( not ( = ?auto_677854 ?auto_677860 ) ) ( not ( = ?auto_677854 ?auto_677861 ) ) ( not ( = ?auto_677854 ?auto_677862 ) ) ( not ( = ?auto_677854 ?auto_677863 ) ) ( not ( = ?auto_677854 ?auto_677864 ) ) ( not ( = ?auto_677854 ?auto_677865 ) ) ( not ( = ?auto_677854 ?auto_677866 ) ) ( not ( = ?auto_677854 ?auto_677867 ) ) ( not ( = ?auto_677854 ?auto_677868 ) ) ( not ( = ?auto_677855 ?auto_677856 ) ) ( not ( = ?auto_677855 ?auto_677857 ) ) ( not ( = ?auto_677855 ?auto_677858 ) ) ( not ( = ?auto_677855 ?auto_677859 ) ) ( not ( = ?auto_677855 ?auto_677860 ) ) ( not ( = ?auto_677855 ?auto_677861 ) ) ( not ( = ?auto_677855 ?auto_677862 ) ) ( not ( = ?auto_677855 ?auto_677863 ) ) ( not ( = ?auto_677855 ?auto_677864 ) ) ( not ( = ?auto_677855 ?auto_677865 ) ) ( not ( = ?auto_677855 ?auto_677866 ) ) ( not ( = ?auto_677855 ?auto_677867 ) ) ( not ( = ?auto_677855 ?auto_677868 ) ) ( not ( = ?auto_677856 ?auto_677857 ) ) ( not ( = ?auto_677856 ?auto_677858 ) ) ( not ( = ?auto_677856 ?auto_677859 ) ) ( not ( = ?auto_677856 ?auto_677860 ) ) ( not ( = ?auto_677856 ?auto_677861 ) ) ( not ( = ?auto_677856 ?auto_677862 ) ) ( not ( = ?auto_677856 ?auto_677863 ) ) ( not ( = ?auto_677856 ?auto_677864 ) ) ( not ( = ?auto_677856 ?auto_677865 ) ) ( not ( = ?auto_677856 ?auto_677866 ) ) ( not ( = ?auto_677856 ?auto_677867 ) ) ( not ( = ?auto_677856 ?auto_677868 ) ) ( not ( = ?auto_677857 ?auto_677858 ) ) ( not ( = ?auto_677857 ?auto_677859 ) ) ( not ( = ?auto_677857 ?auto_677860 ) ) ( not ( = ?auto_677857 ?auto_677861 ) ) ( not ( = ?auto_677857 ?auto_677862 ) ) ( not ( = ?auto_677857 ?auto_677863 ) ) ( not ( = ?auto_677857 ?auto_677864 ) ) ( not ( = ?auto_677857 ?auto_677865 ) ) ( not ( = ?auto_677857 ?auto_677866 ) ) ( not ( = ?auto_677857 ?auto_677867 ) ) ( not ( = ?auto_677857 ?auto_677868 ) ) ( not ( = ?auto_677858 ?auto_677859 ) ) ( not ( = ?auto_677858 ?auto_677860 ) ) ( not ( = ?auto_677858 ?auto_677861 ) ) ( not ( = ?auto_677858 ?auto_677862 ) ) ( not ( = ?auto_677858 ?auto_677863 ) ) ( not ( = ?auto_677858 ?auto_677864 ) ) ( not ( = ?auto_677858 ?auto_677865 ) ) ( not ( = ?auto_677858 ?auto_677866 ) ) ( not ( = ?auto_677858 ?auto_677867 ) ) ( not ( = ?auto_677858 ?auto_677868 ) ) ( not ( = ?auto_677859 ?auto_677860 ) ) ( not ( = ?auto_677859 ?auto_677861 ) ) ( not ( = ?auto_677859 ?auto_677862 ) ) ( not ( = ?auto_677859 ?auto_677863 ) ) ( not ( = ?auto_677859 ?auto_677864 ) ) ( not ( = ?auto_677859 ?auto_677865 ) ) ( not ( = ?auto_677859 ?auto_677866 ) ) ( not ( = ?auto_677859 ?auto_677867 ) ) ( not ( = ?auto_677859 ?auto_677868 ) ) ( not ( = ?auto_677860 ?auto_677861 ) ) ( not ( = ?auto_677860 ?auto_677862 ) ) ( not ( = ?auto_677860 ?auto_677863 ) ) ( not ( = ?auto_677860 ?auto_677864 ) ) ( not ( = ?auto_677860 ?auto_677865 ) ) ( not ( = ?auto_677860 ?auto_677866 ) ) ( not ( = ?auto_677860 ?auto_677867 ) ) ( not ( = ?auto_677860 ?auto_677868 ) ) ( not ( = ?auto_677861 ?auto_677862 ) ) ( not ( = ?auto_677861 ?auto_677863 ) ) ( not ( = ?auto_677861 ?auto_677864 ) ) ( not ( = ?auto_677861 ?auto_677865 ) ) ( not ( = ?auto_677861 ?auto_677866 ) ) ( not ( = ?auto_677861 ?auto_677867 ) ) ( not ( = ?auto_677861 ?auto_677868 ) ) ( not ( = ?auto_677862 ?auto_677863 ) ) ( not ( = ?auto_677862 ?auto_677864 ) ) ( not ( = ?auto_677862 ?auto_677865 ) ) ( not ( = ?auto_677862 ?auto_677866 ) ) ( not ( = ?auto_677862 ?auto_677867 ) ) ( not ( = ?auto_677862 ?auto_677868 ) ) ( not ( = ?auto_677863 ?auto_677864 ) ) ( not ( = ?auto_677863 ?auto_677865 ) ) ( not ( = ?auto_677863 ?auto_677866 ) ) ( not ( = ?auto_677863 ?auto_677867 ) ) ( not ( = ?auto_677863 ?auto_677868 ) ) ( not ( = ?auto_677864 ?auto_677865 ) ) ( not ( = ?auto_677864 ?auto_677866 ) ) ( not ( = ?auto_677864 ?auto_677867 ) ) ( not ( = ?auto_677864 ?auto_677868 ) ) ( not ( = ?auto_677865 ?auto_677866 ) ) ( not ( = ?auto_677865 ?auto_677867 ) ) ( not ( = ?auto_677865 ?auto_677868 ) ) ( not ( = ?auto_677866 ?auto_677867 ) ) ( not ( = ?auto_677866 ?auto_677868 ) ) ( not ( = ?auto_677867 ?auto_677868 ) ) ( ON ?auto_677866 ?auto_677867 ) ( CLEAR ?auto_677864 ) ( ON ?auto_677865 ?auto_677866 ) ( CLEAR ?auto_677865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_677852 ?auto_677853 ?auto_677854 ?auto_677855 ?auto_677856 ?auto_677857 ?auto_677858 ?auto_677859 ?auto_677860 ?auto_677861 ?auto_677862 ?auto_677863 ?auto_677864 ?auto_677865 )
      ( MAKE-16PILE ?auto_677852 ?auto_677853 ?auto_677854 ?auto_677855 ?auto_677856 ?auto_677857 ?auto_677858 ?auto_677859 ?auto_677860 ?auto_677861 ?auto_677862 ?auto_677863 ?auto_677864 ?auto_677865 ?auto_677866 ?auto_677867 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_677918 - BLOCK
      ?auto_677919 - BLOCK
      ?auto_677920 - BLOCK
      ?auto_677921 - BLOCK
      ?auto_677922 - BLOCK
      ?auto_677923 - BLOCK
      ?auto_677924 - BLOCK
      ?auto_677925 - BLOCK
      ?auto_677926 - BLOCK
      ?auto_677927 - BLOCK
      ?auto_677928 - BLOCK
      ?auto_677929 - BLOCK
      ?auto_677930 - BLOCK
      ?auto_677931 - BLOCK
      ?auto_677932 - BLOCK
      ?auto_677933 - BLOCK
    )
    :vars
    (
      ?auto_677934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677933 ?auto_677934 ) ( ON-TABLE ?auto_677918 ) ( ON ?auto_677919 ?auto_677918 ) ( ON ?auto_677920 ?auto_677919 ) ( ON ?auto_677921 ?auto_677920 ) ( ON ?auto_677922 ?auto_677921 ) ( ON ?auto_677923 ?auto_677922 ) ( ON ?auto_677924 ?auto_677923 ) ( ON ?auto_677925 ?auto_677924 ) ( ON ?auto_677926 ?auto_677925 ) ( ON ?auto_677927 ?auto_677926 ) ( ON ?auto_677928 ?auto_677927 ) ( ON ?auto_677929 ?auto_677928 ) ( not ( = ?auto_677918 ?auto_677919 ) ) ( not ( = ?auto_677918 ?auto_677920 ) ) ( not ( = ?auto_677918 ?auto_677921 ) ) ( not ( = ?auto_677918 ?auto_677922 ) ) ( not ( = ?auto_677918 ?auto_677923 ) ) ( not ( = ?auto_677918 ?auto_677924 ) ) ( not ( = ?auto_677918 ?auto_677925 ) ) ( not ( = ?auto_677918 ?auto_677926 ) ) ( not ( = ?auto_677918 ?auto_677927 ) ) ( not ( = ?auto_677918 ?auto_677928 ) ) ( not ( = ?auto_677918 ?auto_677929 ) ) ( not ( = ?auto_677918 ?auto_677930 ) ) ( not ( = ?auto_677918 ?auto_677931 ) ) ( not ( = ?auto_677918 ?auto_677932 ) ) ( not ( = ?auto_677918 ?auto_677933 ) ) ( not ( = ?auto_677918 ?auto_677934 ) ) ( not ( = ?auto_677919 ?auto_677920 ) ) ( not ( = ?auto_677919 ?auto_677921 ) ) ( not ( = ?auto_677919 ?auto_677922 ) ) ( not ( = ?auto_677919 ?auto_677923 ) ) ( not ( = ?auto_677919 ?auto_677924 ) ) ( not ( = ?auto_677919 ?auto_677925 ) ) ( not ( = ?auto_677919 ?auto_677926 ) ) ( not ( = ?auto_677919 ?auto_677927 ) ) ( not ( = ?auto_677919 ?auto_677928 ) ) ( not ( = ?auto_677919 ?auto_677929 ) ) ( not ( = ?auto_677919 ?auto_677930 ) ) ( not ( = ?auto_677919 ?auto_677931 ) ) ( not ( = ?auto_677919 ?auto_677932 ) ) ( not ( = ?auto_677919 ?auto_677933 ) ) ( not ( = ?auto_677919 ?auto_677934 ) ) ( not ( = ?auto_677920 ?auto_677921 ) ) ( not ( = ?auto_677920 ?auto_677922 ) ) ( not ( = ?auto_677920 ?auto_677923 ) ) ( not ( = ?auto_677920 ?auto_677924 ) ) ( not ( = ?auto_677920 ?auto_677925 ) ) ( not ( = ?auto_677920 ?auto_677926 ) ) ( not ( = ?auto_677920 ?auto_677927 ) ) ( not ( = ?auto_677920 ?auto_677928 ) ) ( not ( = ?auto_677920 ?auto_677929 ) ) ( not ( = ?auto_677920 ?auto_677930 ) ) ( not ( = ?auto_677920 ?auto_677931 ) ) ( not ( = ?auto_677920 ?auto_677932 ) ) ( not ( = ?auto_677920 ?auto_677933 ) ) ( not ( = ?auto_677920 ?auto_677934 ) ) ( not ( = ?auto_677921 ?auto_677922 ) ) ( not ( = ?auto_677921 ?auto_677923 ) ) ( not ( = ?auto_677921 ?auto_677924 ) ) ( not ( = ?auto_677921 ?auto_677925 ) ) ( not ( = ?auto_677921 ?auto_677926 ) ) ( not ( = ?auto_677921 ?auto_677927 ) ) ( not ( = ?auto_677921 ?auto_677928 ) ) ( not ( = ?auto_677921 ?auto_677929 ) ) ( not ( = ?auto_677921 ?auto_677930 ) ) ( not ( = ?auto_677921 ?auto_677931 ) ) ( not ( = ?auto_677921 ?auto_677932 ) ) ( not ( = ?auto_677921 ?auto_677933 ) ) ( not ( = ?auto_677921 ?auto_677934 ) ) ( not ( = ?auto_677922 ?auto_677923 ) ) ( not ( = ?auto_677922 ?auto_677924 ) ) ( not ( = ?auto_677922 ?auto_677925 ) ) ( not ( = ?auto_677922 ?auto_677926 ) ) ( not ( = ?auto_677922 ?auto_677927 ) ) ( not ( = ?auto_677922 ?auto_677928 ) ) ( not ( = ?auto_677922 ?auto_677929 ) ) ( not ( = ?auto_677922 ?auto_677930 ) ) ( not ( = ?auto_677922 ?auto_677931 ) ) ( not ( = ?auto_677922 ?auto_677932 ) ) ( not ( = ?auto_677922 ?auto_677933 ) ) ( not ( = ?auto_677922 ?auto_677934 ) ) ( not ( = ?auto_677923 ?auto_677924 ) ) ( not ( = ?auto_677923 ?auto_677925 ) ) ( not ( = ?auto_677923 ?auto_677926 ) ) ( not ( = ?auto_677923 ?auto_677927 ) ) ( not ( = ?auto_677923 ?auto_677928 ) ) ( not ( = ?auto_677923 ?auto_677929 ) ) ( not ( = ?auto_677923 ?auto_677930 ) ) ( not ( = ?auto_677923 ?auto_677931 ) ) ( not ( = ?auto_677923 ?auto_677932 ) ) ( not ( = ?auto_677923 ?auto_677933 ) ) ( not ( = ?auto_677923 ?auto_677934 ) ) ( not ( = ?auto_677924 ?auto_677925 ) ) ( not ( = ?auto_677924 ?auto_677926 ) ) ( not ( = ?auto_677924 ?auto_677927 ) ) ( not ( = ?auto_677924 ?auto_677928 ) ) ( not ( = ?auto_677924 ?auto_677929 ) ) ( not ( = ?auto_677924 ?auto_677930 ) ) ( not ( = ?auto_677924 ?auto_677931 ) ) ( not ( = ?auto_677924 ?auto_677932 ) ) ( not ( = ?auto_677924 ?auto_677933 ) ) ( not ( = ?auto_677924 ?auto_677934 ) ) ( not ( = ?auto_677925 ?auto_677926 ) ) ( not ( = ?auto_677925 ?auto_677927 ) ) ( not ( = ?auto_677925 ?auto_677928 ) ) ( not ( = ?auto_677925 ?auto_677929 ) ) ( not ( = ?auto_677925 ?auto_677930 ) ) ( not ( = ?auto_677925 ?auto_677931 ) ) ( not ( = ?auto_677925 ?auto_677932 ) ) ( not ( = ?auto_677925 ?auto_677933 ) ) ( not ( = ?auto_677925 ?auto_677934 ) ) ( not ( = ?auto_677926 ?auto_677927 ) ) ( not ( = ?auto_677926 ?auto_677928 ) ) ( not ( = ?auto_677926 ?auto_677929 ) ) ( not ( = ?auto_677926 ?auto_677930 ) ) ( not ( = ?auto_677926 ?auto_677931 ) ) ( not ( = ?auto_677926 ?auto_677932 ) ) ( not ( = ?auto_677926 ?auto_677933 ) ) ( not ( = ?auto_677926 ?auto_677934 ) ) ( not ( = ?auto_677927 ?auto_677928 ) ) ( not ( = ?auto_677927 ?auto_677929 ) ) ( not ( = ?auto_677927 ?auto_677930 ) ) ( not ( = ?auto_677927 ?auto_677931 ) ) ( not ( = ?auto_677927 ?auto_677932 ) ) ( not ( = ?auto_677927 ?auto_677933 ) ) ( not ( = ?auto_677927 ?auto_677934 ) ) ( not ( = ?auto_677928 ?auto_677929 ) ) ( not ( = ?auto_677928 ?auto_677930 ) ) ( not ( = ?auto_677928 ?auto_677931 ) ) ( not ( = ?auto_677928 ?auto_677932 ) ) ( not ( = ?auto_677928 ?auto_677933 ) ) ( not ( = ?auto_677928 ?auto_677934 ) ) ( not ( = ?auto_677929 ?auto_677930 ) ) ( not ( = ?auto_677929 ?auto_677931 ) ) ( not ( = ?auto_677929 ?auto_677932 ) ) ( not ( = ?auto_677929 ?auto_677933 ) ) ( not ( = ?auto_677929 ?auto_677934 ) ) ( not ( = ?auto_677930 ?auto_677931 ) ) ( not ( = ?auto_677930 ?auto_677932 ) ) ( not ( = ?auto_677930 ?auto_677933 ) ) ( not ( = ?auto_677930 ?auto_677934 ) ) ( not ( = ?auto_677931 ?auto_677932 ) ) ( not ( = ?auto_677931 ?auto_677933 ) ) ( not ( = ?auto_677931 ?auto_677934 ) ) ( not ( = ?auto_677932 ?auto_677933 ) ) ( not ( = ?auto_677932 ?auto_677934 ) ) ( not ( = ?auto_677933 ?auto_677934 ) ) ( ON ?auto_677932 ?auto_677933 ) ( ON ?auto_677931 ?auto_677932 ) ( CLEAR ?auto_677929 ) ( ON ?auto_677930 ?auto_677931 ) ( CLEAR ?auto_677930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_677918 ?auto_677919 ?auto_677920 ?auto_677921 ?auto_677922 ?auto_677923 ?auto_677924 ?auto_677925 ?auto_677926 ?auto_677927 ?auto_677928 ?auto_677929 ?auto_677930 )
      ( MAKE-16PILE ?auto_677918 ?auto_677919 ?auto_677920 ?auto_677921 ?auto_677922 ?auto_677923 ?auto_677924 ?auto_677925 ?auto_677926 ?auto_677927 ?auto_677928 ?auto_677929 ?auto_677930 ?auto_677931 ?auto_677932 ?auto_677933 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_677984 - BLOCK
      ?auto_677985 - BLOCK
      ?auto_677986 - BLOCK
      ?auto_677987 - BLOCK
      ?auto_677988 - BLOCK
      ?auto_677989 - BLOCK
      ?auto_677990 - BLOCK
      ?auto_677991 - BLOCK
      ?auto_677992 - BLOCK
      ?auto_677993 - BLOCK
      ?auto_677994 - BLOCK
      ?auto_677995 - BLOCK
      ?auto_677996 - BLOCK
      ?auto_677997 - BLOCK
      ?auto_677998 - BLOCK
      ?auto_677999 - BLOCK
    )
    :vars
    (
      ?auto_678000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677999 ?auto_678000 ) ( ON-TABLE ?auto_677984 ) ( ON ?auto_677985 ?auto_677984 ) ( ON ?auto_677986 ?auto_677985 ) ( ON ?auto_677987 ?auto_677986 ) ( ON ?auto_677988 ?auto_677987 ) ( ON ?auto_677989 ?auto_677988 ) ( ON ?auto_677990 ?auto_677989 ) ( ON ?auto_677991 ?auto_677990 ) ( ON ?auto_677992 ?auto_677991 ) ( ON ?auto_677993 ?auto_677992 ) ( ON ?auto_677994 ?auto_677993 ) ( not ( = ?auto_677984 ?auto_677985 ) ) ( not ( = ?auto_677984 ?auto_677986 ) ) ( not ( = ?auto_677984 ?auto_677987 ) ) ( not ( = ?auto_677984 ?auto_677988 ) ) ( not ( = ?auto_677984 ?auto_677989 ) ) ( not ( = ?auto_677984 ?auto_677990 ) ) ( not ( = ?auto_677984 ?auto_677991 ) ) ( not ( = ?auto_677984 ?auto_677992 ) ) ( not ( = ?auto_677984 ?auto_677993 ) ) ( not ( = ?auto_677984 ?auto_677994 ) ) ( not ( = ?auto_677984 ?auto_677995 ) ) ( not ( = ?auto_677984 ?auto_677996 ) ) ( not ( = ?auto_677984 ?auto_677997 ) ) ( not ( = ?auto_677984 ?auto_677998 ) ) ( not ( = ?auto_677984 ?auto_677999 ) ) ( not ( = ?auto_677984 ?auto_678000 ) ) ( not ( = ?auto_677985 ?auto_677986 ) ) ( not ( = ?auto_677985 ?auto_677987 ) ) ( not ( = ?auto_677985 ?auto_677988 ) ) ( not ( = ?auto_677985 ?auto_677989 ) ) ( not ( = ?auto_677985 ?auto_677990 ) ) ( not ( = ?auto_677985 ?auto_677991 ) ) ( not ( = ?auto_677985 ?auto_677992 ) ) ( not ( = ?auto_677985 ?auto_677993 ) ) ( not ( = ?auto_677985 ?auto_677994 ) ) ( not ( = ?auto_677985 ?auto_677995 ) ) ( not ( = ?auto_677985 ?auto_677996 ) ) ( not ( = ?auto_677985 ?auto_677997 ) ) ( not ( = ?auto_677985 ?auto_677998 ) ) ( not ( = ?auto_677985 ?auto_677999 ) ) ( not ( = ?auto_677985 ?auto_678000 ) ) ( not ( = ?auto_677986 ?auto_677987 ) ) ( not ( = ?auto_677986 ?auto_677988 ) ) ( not ( = ?auto_677986 ?auto_677989 ) ) ( not ( = ?auto_677986 ?auto_677990 ) ) ( not ( = ?auto_677986 ?auto_677991 ) ) ( not ( = ?auto_677986 ?auto_677992 ) ) ( not ( = ?auto_677986 ?auto_677993 ) ) ( not ( = ?auto_677986 ?auto_677994 ) ) ( not ( = ?auto_677986 ?auto_677995 ) ) ( not ( = ?auto_677986 ?auto_677996 ) ) ( not ( = ?auto_677986 ?auto_677997 ) ) ( not ( = ?auto_677986 ?auto_677998 ) ) ( not ( = ?auto_677986 ?auto_677999 ) ) ( not ( = ?auto_677986 ?auto_678000 ) ) ( not ( = ?auto_677987 ?auto_677988 ) ) ( not ( = ?auto_677987 ?auto_677989 ) ) ( not ( = ?auto_677987 ?auto_677990 ) ) ( not ( = ?auto_677987 ?auto_677991 ) ) ( not ( = ?auto_677987 ?auto_677992 ) ) ( not ( = ?auto_677987 ?auto_677993 ) ) ( not ( = ?auto_677987 ?auto_677994 ) ) ( not ( = ?auto_677987 ?auto_677995 ) ) ( not ( = ?auto_677987 ?auto_677996 ) ) ( not ( = ?auto_677987 ?auto_677997 ) ) ( not ( = ?auto_677987 ?auto_677998 ) ) ( not ( = ?auto_677987 ?auto_677999 ) ) ( not ( = ?auto_677987 ?auto_678000 ) ) ( not ( = ?auto_677988 ?auto_677989 ) ) ( not ( = ?auto_677988 ?auto_677990 ) ) ( not ( = ?auto_677988 ?auto_677991 ) ) ( not ( = ?auto_677988 ?auto_677992 ) ) ( not ( = ?auto_677988 ?auto_677993 ) ) ( not ( = ?auto_677988 ?auto_677994 ) ) ( not ( = ?auto_677988 ?auto_677995 ) ) ( not ( = ?auto_677988 ?auto_677996 ) ) ( not ( = ?auto_677988 ?auto_677997 ) ) ( not ( = ?auto_677988 ?auto_677998 ) ) ( not ( = ?auto_677988 ?auto_677999 ) ) ( not ( = ?auto_677988 ?auto_678000 ) ) ( not ( = ?auto_677989 ?auto_677990 ) ) ( not ( = ?auto_677989 ?auto_677991 ) ) ( not ( = ?auto_677989 ?auto_677992 ) ) ( not ( = ?auto_677989 ?auto_677993 ) ) ( not ( = ?auto_677989 ?auto_677994 ) ) ( not ( = ?auto_677989 ?auto_677995 ) ) ( not ( = ?auto_677989 ?auto_677996 ) ) ( not ( = ?auto_677989 ?auto_677997 ) ) ( not ( = ?auto_677989 ?auto_677998 ) ) ( not ( = ?auto_677989 ?auto_677999 ) ) ( not ( = ?auto_677989 ?auto_678000 ) ) ( not ( = ?auto_677990 ?auto_677991 ) ) ( not ( = ?auto_677990 ?auto_677992 ) ) ( not ( = ?auto_677990 ?auto_677993 ) ) ( not ( = ?auto_677990 ?auto_677994 ) ) ( not ( = ?auto_677990 ?auto_677995 ) ) ( not ( = ?auto_677990 ?auto_677996 ) ) ( not ( = ?auto_677990 ?auto_677997 ) ) ( not ( = ?auto_677990 ?auto_677998 ) ) ( not ( = ?auto_677990 ?auto_677999 ) ) ( not ( = ?auto_677990 ?auto_678000 ) ) ( not ( = ?auto_677991 ?auto_677992 ) ) ( not ( = ?auto_677991 ?auto_677993 ) ) ( not ( = ?auto_677991 ?auto_677994 ) ) ( not ( = ?auto_677991 ?auto_677995 ) ) ( not ( = ?auto_677991 ?auto_677996 ) ) ( not ( = ?auto_677991 ?auto_677997 ) ) ( not ( = ?auto_677991 ?auto_677998 ) ) ( not ( = ?auto_677991 ?auto_677999 ) ) ( not ( = ?auto_677991 ?auto_678000 ) ) ( not ( = ?auto_677992 ?auto_677993 ) ) ( not ( = ?auto_677992 ?auto_677994 ) ) ( not ( = ?auto_677992 ?auto_677995 ) ) ( not ( = ?auto_677992 ?auto_677996 ) ) ( not ( = ?auto_677992 ?auto_677997 ) ) ( not ( = ?auto_677992 ?auto_677998 ) ) ( not ( = ?auto_677992 ?auto_677999 ) ) ( not ( = ?auto_677992 ?auto_678000 ) ) ( not ( = ?auto_677993 ?auto_677994 ) ) ( not ( = ?auto_677993 ?auto_677995 ) ) ( not ( = ?auto_677993 ?auto_677996 ) ) ( not ( = ?auto_677993 ?auto_677997 ) ) ( not ( = ?auto_677993 ?auto_677998 ) ) ( not ( = ?auto_677993 ?auto_677999 ) ) ( not ( = ?auto_677993 ?auto_678000 ) ) ( not ( = ?auto_677994 ?auto_677995 ) ) ( not ( = ?auto_677994 ?auto_677996 ) ) ( not ( = ?auto_677994 ?auto_677997 ) ) ( not ( = ?auto_677994 ?auto_677998 ) ) ( not ( = ?auto_677994 ?auto_677999 ) ) ( not ( = ?auto_677994 ?auto_678000 ) ) ( not ( = ?auto_677995 ?auto_677996 ) ) ( not ( = ?auto_677995 ?auto_677997 ) ) ( not ( = ?auto_677995 ?auto_677998 ) ) ( not ( = ?auto_677995 ?auto_677999 ) ) ( not ( = ?auto_677995 ?auto_678000 ) ) ( not ( = ?auto_677996 ?auto_677997 ) ) ( not ( = ?auto_677996 ?auto_677998 ) ) ( not ( = ?auto_677996 ?auto_677999 ) ) ( not ( = ?auto_677996 ?auto_678000 ) ) ( not ( = ?auto_677997 ?auto_677998 ) ) ( not ( = ?auto_677997 ?auto_677999 ) ) ( not ( = ?auto_677997 ?auto_678000 ) ) ( not ( = ?auto_677998 ?auto_677999 ) ) ( not ( = ?auto_677998 ?auto_678000 ) ) ( not ( = ?auto_677999 ?auto_678000 ) ) ( ON ?auto_677998 ?auto_677999 ) ( ON ?auto_677997 ?auto_677998 ) ( ON ?auto_677996 ?auto_677997 ) ( CLEAR ?auto_677994 ) ( ON ?auto_677995 ?auto_677996 ) ( CLEAR ?auto_677995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_677984 ?auto_677985 ?auto_677986 ?auto_677987 ?auto_677988 ?auto_677989 ?auto_677990 ?auto_677991 ?auto_677992 ?auto_677993 ?auto_677994 ?auto_677995 )
      ( MAKE-16PILE ?auto_677984 ?auto_677985 ?auto_677986 ?auto_677987 ?auto_677988 ?auto_677989 ?auto_677990 ?auto_677991 ?auto_677992 ?auto_677993 ?auto_677994 ?auto_677995 ?auto_677996 ?auto_677997 ?auto_677998 ?auto_677999 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678050 - BLOCK
      ?auto_678051 - BLOCK
      ?auto_678052 - BLOCK
      ?auto_678053 - BLOCK
      ?auto_678054 - BLOCK
      ?auto_678055 - BLOCK
      ?auto_678056 - BLOCK
      ?auto_678057 - BLOCK
      ?auto_678058 - BLOCK
      ?auto_678059 - BLOCK
      ?auto_678060 - BLOCK
      ?auto_678061 - BLOCK
      ?auto_678062 - BLOCK
      ?auto_678063 - BLOCK
      ?auto_678064 - BLOCK
      ?auto_678065 - BLOCK
    )
    :vars
    (
      ?auto_678066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678065 ?auto_678066 ) ( ON-TABLE ?auto_678050 ) ( ON ?auto_678051 ?auto_678050 ) ( ON ?auto_678052 ?auto_678051 ) ( ON ?auto_678053 ?auto_678052 ) ( ON ?auto_678054 ?auto_678053 ) ( ON ?auto_678055 ?auto_678054 ) ( ON ?auto_678056 ?auto_678055 ) ( ON ?auto_678057 ?auto_678056 ) ( ON ?auto_678058 ?auto_678057 ) ( ON ?auto_678059 ?auto_678058 ) ( not ( = ?auto_678050 ?auto_678051 ) ) ( not ( = ?auto_678050 ?auto_678052 ) ) ( not ( = ?auto_678050 ?auto_678053 ) ) ( not ( = ?auto_678050 ?auto_678054 ) ) ( not ( = ?auto_678050 ?auto_678055 ) ) ( not ( = ?auto_678050 ?auto_678056 ) ) ( not ( = ?auto_678050 ?auto_678057 ) ) ( not ( = ?auto_678050 ?auto_678058 ) ) ( not ( = ?auto_678050 ?auto_678059 ) ) ( not ( = ?auto_678050 ?auto_678060 ) ) ( not ( = ?auto_678050 ?auto_678061 ) ) ( not ( = ?auto_678050 ?auto_678062 ) ) ( not ( = ?auto_678050 ?auto_678063 ) ) ( not ( = ?auto_678050 ?auto_678064 ) ) ( not ( = ?auto_678050 ?auto_678065 ) ) ( not ( = ?auto_678050 ?auto_678066 ) ) ( not ( = ?auto_678051 ?auto_678052 ) ) ( not ( = ?auto_678051 ?auto_678053 ) ) ( not ( = ?auto_678051 ?auto_678054 ) ) ( not ( = ?auto_678051 ?auto_678055 ) ) ( not ( = ?auto_678051 ?auto_678056 ) ) ( not ( = ?auto_678051 ?auto_678057 ) ) ( not ( = ?auto_678051 ?auto_678058 ) ) ( not ( = ?auto_678051 ?auto_678059 ) ) ( not ( = ?auto_678051 ?auto_678060 ) ) ( not ( = ?auto_678051 ?auto_678061 ) ) ( not ( = ?auto_678051 ?auto_678062 ) ) ( not ( = ?auto_678051 ?auto_678063 ) ) ( not ( = ?auto_678051 ?auto_678064 ) ) ( not ( = ?auto_678051 ?auto_678065 ) ) ( not ( = ?auto_678051 ?auto_678066 ) ) ( not ( = ?auto_678052 ?auto_678053 ) ) ( not ( = ?auto_678052 ?auto_678054 ) ) ( not ( = ?auto_678052 ?auto_678055 ) ) ( not ( = ?auto_678052 ?auto_678056 ) ) ( not ( = ?auto_678052 ?auto_678057 ) ) ( not ( = ?auto_678052 ?auto_678058 ) ) ( not ( = ?auto_678052 ?auto_678059 ) ) ( not ( = ?auto_678052 ?auto_678060 ) ) ( not ( = ?auto_678052 ?auto_678061 ) ) ( not ( = ?auto_678052 ?auto_678062 ) ) ( not ( = ?auto_678052 ?auto_678063 ) ) ( not ( = ?auto_678052 ?auto_678064 ) ) ( not ( = ?auto_678052 ?auto_678065 ) ) ( not ( = ?auto_678052 ?auto_678066 ) ) ( not ( = ?auto_678053 ?auto_678054 ) ) ( not ( = ?auto_678053 ?auto_678055 ) ) ( not ( = ?auto_678053 ?auto_678056 ) ) ( not ( = ?auto_678053 ?auto_678057 ) ) ( not ( = ?auto_678053 ?auto_678058 ) ) ( not ( = ?auto_678053 ?auto_678059 ) ) ( not ( = ?auto_678053 ?auto_678060 ) ) ( not ( = ?auto_678053 ?auto_678061 ) ) ( not ( = ?auto_678053 ?auto_678062 ) ) ( not ( = ?auto_678053 ?auto_678063 ) ) ( not ( = ?auto_678053 ?auto_678064 ) ) ( not ( = ?auto_678053 ?auto_678065 ) ) ( not ( = ?auto_678053 ?auto_678066 ) ) ( not ( = ?auto_678054 ?auto_678055 ) ) ( not ( = ?auto_678054 ?auto_678056 ) ) ( not ( = ?auto_678054 ?auto_678057 ) ) ( not ( = ?auto_678054 ?auto_678058 ) ) ( not ( = ?auto_678054 ?auto_678059 ) ) ( not ( = ?auto_678054 ?auto_678060 ) ) ( not ( = ?auto_678054 ?auto_678061 ) ) ( not ( = ?auto_678054 ?auto_678062 ) ) ( not ( = ?auto_678054 ?auto_678063 ) ) ( not ( = ?auto_678054 ?auto_678064 ) ) ( not ( = ?auto_678054 ?auto_678065 ) ) ( not ( = ?auto_678054 ?auto_678066 ) ) ( not ( = ?auto_678055 ?auto_678056 ) ) ( not ( = ?auto_678055 ?auto_678057 ) ) ( not ( = ?auto_678055 ?auto_678058 ) ) ( not ( = ?auto_678055 ?auto_678059 ) ) ( not ( = ?auto_678055 ?auto_678060 ) ) ( not ( = ?auto_678055 ?auto_678061 ) ) ( not ( = ?auto_678055 ?auto_678062 ) ) ( not ( = ?auto_678055 ?auto_678063 ) ) ( not ( = ?auto_678055 ?auto_678064 ) ) ( not ( = ?auto_678055 ?auto_678065 ) ) ( not ( = ?auto_678055 ?auto_678066 ) ) ( not ( = ?auto_678056 ?auto_678057 ) ) ( not ( = ?auto_678056 ?auto_678058 ) ) ( not ( = ?auto_678056 ?auto_678059 ) ) ( not ( = ?auto_678056 ?auto_678060 ) ) ( not ( = ?auto_678056 ?auto_678061 ) ) ( not ( = ?auto_678056 ?auto_678062 ) ) ( not ( = ?auto_678056 ?auto_678063 ) ) ( not ( = ?auto_678056 ?auto_678064 ) ) ( not ( = ?auto_678056 ?auto_678065 ) ) ( not ( = ?auto_678056 ?auto_678066 ) ) ( not ( = ?auto_678057 ?auto_678058 ) ) ( not ( = ?auto_678057 ?auto_678059 ) ) ( not ( = ?auto_678057 ?auto_678060 ) ) ( not ( = ?auto_678057 ?auto_678061 ) ) ( not ( = ?auto_678057 ?auto_678062 ) ) ( not ( = ?auto_678057 ?auto_678063 ) ) ( not ( = ?auto_678057 ?auto_678064 ) ) ( not ( = ?auto_678057 ?auto_678065 ) ) ( not ( = ?auto_678057 ?auto_678066 ) ) ( not ( = ?auto_678058 ?auto_678059 ) ) ( not ( = ?auto_678058 ?auto_678060 ) ) ( not ( = ?auto_678058 ?auto_678061 ) ) ( not ( = ?auto_678058 ?auto_678062 ) ) ( not ( = ?auto_678058 ?auto_678063 ) ) ( not ( = ?auto_678058 ?auto_678064 ) ) ( not ( = ?auto_678058 ?auto_678065 ) ) ( not ( = ?auto_678058 ?auto_678066 ) ) ( not ( = ?auto_678059 ?auto_678060 ) ) ( not ( = ?auto_678059 ?auto_678061 ) ) ( not ( = ?auto_678059 ?auto_678062 ) ) ( not ( = ?auto_678059 ?auto_678063 ) ) ( not ( = ?auto_678059 ?auto_678064 ) ) ( not ( = ?auto_678059 ?auto_678065 ) ) ( not ( = ?auto_678059 ?auto_678066 ) ) ( not ( = ?auto_678060 ?auto_678061 ) ) ( not ( = ?auto_678060 ?auto_678062 ) ) ( not ( = ?auto_678060 ?auto_678063 ) ) ( not ( = ?auto_678060 ?auto_678064 ) ) ( not ( = ?auto_678060 ?auto_678065 ) ) ( not ( = ?auto_678060 ?auto_678066 ) ) ( not ( = ?auto_678061 ?auto_678062 ) ) ( not ( = ?auto_678061 ?auto_678063 ) ) ( not ( = ?auto_678061 ?auto_678064 ) ) ( not ( = ?auto_678061 ?auto_678065 ) ) ( not ( = ?auto_678061 ?auto_678066 ) ) ( not ( = ?auto_678062 ?auto_678063 ) ) ( not ( = ?auto_678062 ?auto_678064 ) ) ( not ( = ?auto_678062 ?auto_678065 ) ) ( not ( = ?auto_678062 ?auto_678066 ) ) ( not ( = ?auto_678063 ?auto_678064 ) ) ( not ( = ?auto_678063 ?auto_678065 ) ) ( not ( = ?auto_678063 ?auto_678066 ) ) ( not ( = ?auto_678064 ?auto_678065 ) ) ( not ( = ?auto_678064 ?auto_678066 ) ) ( not ( = ?auto_678065 ?auto_678066 ) ) ( ON ?auto_678064 ?auto_678065 ) ( ON ?auto_678063 ?auto_678064 ) ( ON ?auto_678062 ?auto_678063 ) ( ON ?auto_678061 ?auto_678062 ) ( CLEAR ?auto_678059 ) ( ON ?auto_678060 ?auto_678061 ) ( CLEAR ?auto_678060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_678050 ?auto_678051 ?auto_678052 ?auto_678053 ?auto_678054 ?auto_678055 ?auto_678056 ?auto_678057 ?auto_678058 ?auto_678059 ?auto_678060 )
      ( MAKE-16PILE ?auto_678050 ?auto_678051 ?auto_678052 ?auto_678053 ?auto_678054 ?auto_678055 ?auto_678056 ?auto_678057 ?auto_678058 ?auto_678059 ?auto_678060 ?auto_678061 ?auto_678062 ?auto_678063 ?auto_678064 ?auto_678065 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678116 - BLOCK
      ?auto_678117 - BLOCK
      ?auto_678118 - BLOCK
      ?auto_678119 - BLOCK
      ?auto_678120 - BLOCK
      ?auto_678121 - BLOCK
      ?auto_678122 - BLOCK
      ?auto_678123 - BLOCK
      ?auto_678124 - BLOCK
      ?auto_678125 - BLOCK
      ?auto_678126 - BLOCK
      ?auto_678127 - BLOCK
      ?auto_678128 - BLOCK
      ?auto_678129 - BLOCK
      ?auto_678130 - BLOCK
      ?auto_678131 - BLOCK
    )
    :vars
    (
      ?auto_678132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678131 ?auto_678132 ) ( ON-TABLE ?auto_678116 ) ( ON ?auto_678117 ?auto_678116 ) ( ON ?auto_678118 ?auto_678117 ) ( ON ?auto_678119 ?auto_678118 ) ( ON ?auto_678120 ?auto_678119 ) ( ON ?auto_678121 ?auto_678120 ) ( ON ?auto_678122 ?auto_678121 ) ( ON ?auto_678123 ?auto_678122 ) ( ON ?auto_678124 ?auto_678123 ) ( not ( = ?auto_678116 ?auto_678117 ) ) ( not ( = ?auto_678116 ?auto_678118 ) ) ( not ( = ?auto_678116 ?auto_678119 ) ) ( not ( = ?auto_678116 ?auto_678120 ) ) ( not ( = ?auto_678116 ?auto_678121 ) ) ( not ( = ?auto_678116 ?auto_678122 ) ) ( not ( = ?auto_678116 ?auto_678123 ) ) ( not ( = ?auto_678116 ?auto_678124 ) ) ( not ( = ?auto_678116 ?auto_678125 ) ) ( not ( = ?auto_678116 ?auto_678126 ) ) ( not ( = ?auto_678116 ?auto_678127 ) ) ( not ( = ?auto_678116 ?auto_678128 ) ) ( not ( = ?auto_678116 ?auto_678129 ) ) ( not ( = ?auto_678116 ?auto_678130 ) ) ( not ( = ?auto_678116 ?auto_678131 ) ) ( not ( = ?auto_678116 ?auto_678132 ) ) ( not ( = ?auto_678117 ?auto_678118 ) ) ( not ( = ?auto_678117 ?auto_678119 ) ) ( not ( = ?auto_678117 ?auto_678120 ) ) ( not ( = ?auto_678117 ?auto_678121 ) ) ( not ( = ?auto_678117 ?auto_678122 ) ) ( not ( = ?auto_678117 ?auto_678123 ) ) ( not ( = ?auto_678117 ?auto_678124 ) ) ( not ( = ?auto_678117 ?auto_678125 ) ) ( not ( = ?auto_678117 ?auto_678126 ) ) ( not ( = ?auto_678117 ?auto_678127 ) ) ( not ( = ?auto_678117 ?auto_678128 ) ) ( not ( = ?auto_678117 ?auto_678129 ) ) ( not ( = ?auto_678117 ?auto_678130 ) ) ( not ( = ?auto_678117 ?auto_678131 ) ) ( not ( = ?auto_678117 ?auto_678132 ) ) ( not ( = ?auto_678118 ?auto_678119 ) ) ( not ( = ?auto_678118 ?auto_678120 ) ) ( not ( = ?auto_678118 ?auto_678121 ) ) ( not ( = ?auto_678118 ?auto_678122 ) ) ( not ( = ?auto_678118 ?auto_678123 ) ) ( not ( = ?auto_678118 ?auto_678124 ) ) ( not ( = ?auto_678118 ?auto_678125 ) ) ( not ( = ?auto_678118 ?auto_678126 ) ) ( not ( = ?auto_678118 ?auto_678127 ) ) ( not ( = ?auto_678118 ?auto_678128 ) ) ( not ( = ?auto_678118 ?auto_678129 ) ) ( not ( = ?auto_678118 ?auto_678130 ) ) ( not ( = ?auto_678118 ?auto_678131 ) ) ( not ( = ?auto_678118 ?auto_678132 ) ) ( not ( = ?auto_678119 ?auto_678120 ) ) ( not ( = ?auto_678119 ?auto_678121 ) ) ( not ( = ?auto_678119 ?auto_678122 ) ) ( not ( = ?auto_678119 ?auto_678123 ) ) ( not ( = ?auto_678119 ?auto_678124 ) ) ( not ( = ?auto_678119 ?auto_678125 ) ) ( not ( = ?auto_678119 ?auto_678126 ) ) ( not ( = ?auto_678119 ?auto_678127 ) ) ( not ( = ?auto_678119 ?auto_678128 ) ) ( not ( = ?auto_678119 ?auto_678129 ) ) ( not ( = ?auto_678119 ?auto_678130 ) ) ( not ( = ?auto_678119 ?auto_678131 ) ) ( not ( = ?auto_678119 ?auto_678132 ) ) ( not ( = ?auto_678120 ?auto_678121 ) ) ( not ( = ?auto_678120 ?auto_678122 ) ) ( not ( = ?auto_678120 ?auto_678123 ) ) ( not ( = ?auto_678120 ?auto_678124 ) ) ( not ( = ?auto_678120 ?auto_678125 ) ) ( not ( = ?auto_678120 ?auto_678126 ) ) ( not ( = ?auto_678120 ?auto_678127 ) ) ( not ( = ?auto_678120 ?auto_678128 ) ) ( not ( = ?auto_678120 ?auto_678129 ) ) ( not ( = ?auto_678120 ?auto_678130 ) ) ( not ( = ?auto_678120 ?auto_678131 ) ) ( not ( = ?auto_678120 ?auto_678132 ) ) ( not ( = ?auto_678121 ?auto_678122 ) ) ( not ( = ?auto_678121 ?auto_678123 ) ) ( not ( = ?auto_678121 ?auto_678124 ) ) ( not ( = ?auto_678121 ?auto_678125 ) ) ( not ( = ?auto_678121 ?auto_678126 ) ) ( not ( = ?auto_678121 ?auto_678127 ) ) ( not ( = ?auto_678121 ?auto_678128 ) ) ( not ( = ?auto_678121 ?auto_678129 ) ) ( not ( = ?auto_678121 ?auto_678130 ) ) ( not ( = ?auto_678121 ?auto_678131 ) ) ( not ( = ?auto_678121 ?auto_678132 ) ) ( not ( = ?auto_678122 ?auto_678123 ) ) ( not ( = ?auto_678122 ?auto_678124 ) ) ( not ( = ?auto_678122 ?auto_678125 ) ) ( not ( = ?auto_678122 ?auto_678126 ) ) ( not ( = ?auto_678122 ?auto_678127 ) ) ( not ( = ?auto_678122 ?auto_678128 ) ) ( not ( = ?auto_678122 ?auto_678129 ) ) ( not ( = ?auto_678122 ?auto_678130 ) ) ( not ( = ?auto_678122 ?auto_678131 ) ) ( not ( = ?auto_678122 ?auto_678132 ) ) ( not ( = ?auto_678123 ?auto_678124 ) ) ( not ( = ?auto_678123 ?auto_678125 ) ) ( not ( = ?auto_678123 ?auto_678126 ) ) ( not ( = ?auto_678123 ?auto_678127 ) ) ( not ( = ?auto_678123 ?auto_678128 ) ) ( not ( = ?auto_678123 ?auto_678129 ) ) ( not ( = ?auto_678123 ?auto_678130 ) ) ( not ( = ?auto_678123 ?auto_678131 ) ) ( not ( = ?auto_678123 ?auto_678132 ) ) ( not ( = ?auto_678124 ?auto_678125 ) ) ( not ( = ?auto_678124 ?auto_678126 ) ) ( not ( = ?auto_678124 ?auto_678127 ) ) ( not ( = ?auto_678124 ?auto_678128 ) ) ( not ( = ?auto_678124 ?auto_678129 ) ) ( not ( = ?auto_678124 ?auto_678130 ) ) ( not ( = ?auto_678124 ?auto_678131 ) ) ( not ( = ?auto_678124 ?auto_678132 ) ) ( not ( = ?auto_678125 ?auto_678126 ) ) ( not ( = ?auto_678125 ?auto_678127 ) ) ( not ( = ?auto_678125 ?auto_678128 ) ) ( not ( = ?auto_678125 ?auto_678129 ) ) ( not ( = ?auto_678125 ?auto_678130 ) ) ( not ( = ?auto_678125 ?auto_678131 ) ) ( not ( = ?auto_678125 ?auto_678132 ) ) ( not ( = ?auto_678126 ?auto_678127 ) ) ( not ( = ?auto_678126 ?auto_678128 ) ) ( not ( = ?auto_678126 ?auto_678129 ) ) ( not ( = ?auto_678126 ?auto_678130 ) ) ( not ( = ?auto_678126 ?auto_678131 ) ) ( not ( = ?auto_678126 ?auto_678132 ) ) ( not ( = ?auto_678127 ?auto_678128 ) ) ( not ( = ?auto_678127 ?auto_678129 ) ) ( not ( = ?auto_678127 ?auto_678130 ) ) ( not ( = ?auto_678127 ?auto_678131 ) ) ( not ( = ?auto_678127 ?auto_678132 ) ) ( not ( = ?auto_678128 ?auto_678129 ) ) ( not ( = ?auto_678128 ?auto_678130 ) ) ( not ( = ?auto_678128 ?auto_678131 ) ) ( not ( = ?auto_678128 ?auto_678132 ) ) ( not ( = ?auto_678129 ?auto_678130 ) ) ( not ( = ?auto_678129 ?auto_678131 ) ) ( not ( = ?auto_678129 ?auto_678132 ) ) ( not ( = ?auto_678130 ?auto_678131 ) ) ( not ( = ?auto_678130 ?auto_678132 ) ) ( not ( = ?auto_678131 ?auto_678132 ) ) ( ON ?auto_678130 ?auto_678131 ) ( ON ?auto_678129 ?auto_678130 ) ( ON ?auto_678128 ?auto_678129 ) ( ON ?auto_678127 ?auto_678128 ) ( ON ?auto_678126 ?auto_678127 ) ( CLEAR ?auto_678124 ) ( ON ?auto_678125 ?auto_678126 ) ( CLEAR ?auto_678125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_678116 ?auto_678117 ?auto_678118 ?auto_678119 ?auto_678120 ?auto_678121 ?auto_678122 ?auto_678123 ?auto_678124 ?auto_678125 )
      ( MAKE-16PILE ?auto_678116 ?auto_678117 ?auto_678118 ?auto_678119 ?auto_678120 ?auto_678121 ?auto_678122 ?auto_678123 ?auto_678124 ?auto_678125 ?auto_678126 ?auto_678127 ?auto_678128 ?auto_678129 ?auto_678130 ?auto_678131 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678182 - BLOCK
      ?auto_678183 - BLOCK
      ?auto_678184 - BLOCK
      ?auto_678185 - BLOCK
      ?auto_678186 - BLOCK
      ?auto_678187 - BLOCK
      ?auto_678188 - BLOCK
      ?auto_678189 - BLOCK
      ?auto_678190 - BLOCK
      ?auto_678191 - BLOCK
      ?auto_678192 - BLOCK
      ?auto_678193 - BLOCK
      ?auto_678194 - BLOCK
      ?auto_678195 - BLOCK
      ?auto_678196 - BLOCK
      ?auto_678197 - BLOCK
    )
    :vars
    (
      ?auto_678198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678197 ?auto_678198 ) ( ON-TABLE ?auto_678182 ) ( ON ?auto_678183 ?auto_678182 ) ( ON ?auto_678184 ?auto_678183 ) ( ON ?auto_678185 ?auto_678184 ) ( ON ?auto_678186 ?auto_678185 ) ( ON ?auto_678187 ?auto_678186 ) ( ON ?auto_678188 ?auto_678187 ) ( ON ?auto_678189 ?auto_678188 ) ( not ( = ?auto_678182 ?auto_678183 ) ) ( not ( = ?auto_678182 ?auto_678184 ) ) ( not ( = ?auto_678182 ?auto_678185 ) ) ( not ( = ?auto_678182 ?auto_678186 ) ) ( not ( = ?auto_678182 ?auto_678187 ) ) ( not ( = ?auto_678182 ?auto_678188 ) ) ( not ( = ?auto_678182 ?auto_678189 ) ) ( not ( = ?auto_678182 ?auto_678190 ) ) ( not ( = ?auto_678182 ?auto_678191 ) ) ( not ( = ?auto_678182 ?auto_678192 ) ) ( not ( = ?auto_678182 ?auto_678193 ) ) ( not ( = ?auto_678182 ?auto_678194 ) ) ( not ( = ?auto_678182 ?auto_678195 ) ) ( not ( = ?auto_678182 ?auto_678196 ) ) ( not ( = ?auto_678182 ?auto_678197 ) ) ( not ( = ?auto_678182 ?auto_678198 ) ) ( not ( = ?auto_678183 ?auto_678184 ) ) ( not ( = ?auto_678183 ?auto_678185 ) ) ( not ( = ?auto_678183 ?auto_678186 ) ) ( not ( = ?auto_678183 ?auto_678187 ) ) ( not ( = ?auto_678183 ?auto_678188 ) ) ( not ( = ?auto_678183 ?auto_678189 ) ) ( not ( = ?auto_678183 ?auto_678190 ) ) ( not ( = ?auto_678183 ?auto_678191 ) ) ( not ( = ?auto_678183 ?auto_678192 ) ) ( not ( = ?auto_678183 ?auto_678193 ) ) ( not ( = ?auto_678183 ?auto_678194 ) ) ( not ( = ?auto_678183 ?auto_678195 ) ) ( not ( = ?auto_678183 ?auto_678196 ) ) ( not ( = ?auto_678183 ?auto_678197 ) ) ( not ( = ?auto_678183 ?auto_678198 ) ) ( not ( = ?auto_678184 ?auto_678185 ) ) ( not ( = ?auto_678184 ?auto_678186 ) ) ( not ( = ?auto_678184 ?auto_678187 ) ) ( not ( = ?auto_678184 ?auto_678188 ) ) ( not ( = ?auto_678184 ?auto_678189 ) ) ( not ( = ?auto_678184 ?auto_678190 ) ) ( not ( = ?auto_678184 ?auto_678191 ) ) ( not ( = ?auto_678184 ?auto_678192 ) ) ( not ( = ?auto_678184 ?auto_678193 ) ) ( not ( = ?auto_678184 ?auto_678194 ) ) ( not ( = ?auto_678184 ?auto_678195 ) ) ( not ( = ?auto_678184 ?auto_678196 ) ) ( not ( = ?auto_678184 ?auto_678197 ) ) ( not ( = ?auto_678184 ?auto_678198 ) ) ( not ( = ?auto_678185 ?auto_678186 ) ) ( not ( = ?auto_678185 ?auto_678187 ) ) ( not ( = ?auto_678185 ?auto_678188 ) ) ( not ( = ?auto_678185 ?auto_678189 ) ) ( not ( = ?auto_678185 ?auto_678190 ) ) ( not ( = ?auto_678185 ?auto_678191 ) ) ( not ( = ?auto_678185 ?auto_678192 ) ) ( not ( = ?auto_678185 ?auto_678193 ) ) ( not ( = ?auto_678185 ?auto_678194 ) ) ( not ( = ?auto_678185 ?auto_678195 ) ) ( not ( = ?auto_678185 ?auto_678196 ) ) ( not ( = ?auto_678185 ?auto_678197 ) ) ( not ( = ?auto_678185 ?auto_678198 ) ) ( not ( = ?auto_678186 ?auto_678187 ) ) ( not ( = ?auto_678186 ?auto_678188 ) ) ( not ( = ?auto_678186 ?auto_678189 ) ) ( not ( = ?auto_678186 ?auto_678190 ) ) ( not ( = ?auto_678186 ?auto_678191 ) ) ( not ( = ?auto_678186 ?auto_678192 ) ) ( not ( = ?auto_678186 ?auto_678193 ) ) ( not ( = ?auto_678186 ?auto_678194 ) ) ( not ( = ?auto_678186 ?auto_678195 ) ) ( not ( = ?auto_678186 ?auto_678196 ) ) ( not ( = ?auto_678186 ?auto_678197 ) ) ( not ( = ?auto_678186 ?auto_678198 ) ) ( not ( = ?auto_678187 ?auto_678188 ) ) ( not ( = ?auto_678187 ?auto_678189 ) ) ( not ( = ?auto_678187 ?auto_678190 ) ) ( not ( = ?auto_678187 ?auto_678191 ) ) ( not ( = ?auto_678187 ?auto_678192 ) ) ( not ( = ?auto_678187 ?auto_678193 ) ) ( not ( = ?auto_678187 ?auto_678194 ) ) ( not ( = ?auto_678187 ?auto_678195 ) ) ( not ( = ?auto_678187 ?auto_678196 ) ) ( not ( = ?auto_678187 ?auto_678197 ) ) ( not ( = ?auto_678187 ?auto_678198 ) ) ( not ( = ?auto_678188 ?auto_678189 ) ) ( not ( = ?auto_678188 ?auto_678190 ) ) ( not ( = ?auto_678188 ?auto_678191 ) ) ( not ( = ?auto_678188 ?auto_678192 ) ) ( not ( = ?auto_678188 ?auto_678193 ) ) ( not ( = ?auto_678188 ?auto_678194 ) ) ( not ( = ?auto_678188 ?auto_678195 ) ) ( not ( = ?auto_678188 ?auto_678196 ) ) ( not ( = ?auto_678188 ?auto_678197 ) ) ( not ( = ?auto_678188 ?auto_678198 ) ) ( not ( = ?auto_678189 ?auto_678190 ) ) ( not ( = ?auto_678189 ?auto_678191 ) ) ( not ( = ?auto_678189 ?auto_678192 ) ) ( not ( = ?auto_678189 ?auto_678193 ) ) ( not ( = ?auto_678189 ?auto_678194 ) ) ( not ( = ?auto_678189 ?auto_678195 ) ) ( not ( = ?auto_678189 ?auto_678196 ) ) ( not ( = ?auto_678189 ?auto_678197 ) ) ( not ( = ?auto_678189 ?auto_678198 ) ) ( not ( = ?auto_678190 ?auto_678191 ) ) ( not ( = ?auto_678190 ?auto_678192 ) ) ( not ( = ?auto_678190 ?auto_678193 ) ) ( not ( = ?auto_678190 ?auto_678194 ) ) ( not ( = ?auto_678190 ?auto_678195 ) ) ( not ( = ?auto_678190 ?auto_678196 ) ) ( not ( = ?auto_678190 ?auto_678197 ) ) ( not ( = ?auto_678190 ?auto_678198 ) ) ( not ( = ?auto_678191 ?auto_678192 ) ) ( not ( = ?auto_678191 ?auto_678193 ) ) ( not ( = ?auto_678191 ?auto_678194 ) ) ( not ( = ?auto_678191 ?auto_678195 ) ) ( not ( = ?auto_678191 ?auto_678196 ) ) ( not ( = ?auto_678191 ?auto_678197 ) ) ( not ( = ?auto_678191 ?auto_678198 ) ) ( not ( = ?auto_678192 ?auto_678193 ) ) ( not ( = ?auto_678192 ?auto_678194 ) ) ( not ( = ?auto_678192 ?auto_678195 ) ) ( not ( = ?auto_678192 ?auto_678196 ) ) ( not ( = ?auto_678192 ?auto_678197 ) ) ( not ( = ?auto_678192 ?auto_678198 ) ) ( not ( = ?auto_678193 ?auto_678194 ) ) ( not ( = ?auto_678193 ?auto_678195 ) ) ( not ( = ?auto_678193 ?auto_678196 ) ) ( not ( = ?auto_678193 ?auto_678197 ) ) ( not ( = ?auto_678193 ?auto_678198 ) ) ( not ( = ?auto_678194 ?auto_678195 ) ) ( not ( = ?auto_678194 ?auto_678196 ) ) ( not ( = ?auto_678194 ?auto_678197 ) ) ( not ( = ?auto_678194 ?auto_678198 ) ) ( not ( = ?auto_678195 ?auto_678196 ) ) ( not ( = ?auto_678195 ?auto_678197 ) ) ( not ( = ?auto_678195 ?auto_678198 ) ) ( not ( = ?auto_678196 ?auto_678197 ) ) ( not ( = ?auto_678196 ?auto_678198 ) ) ( not ( = ?auto_678197 ?auto_678198 ) ) ( ON ?auto_678196 ?auto_678197 ) ( ON ?auto_678195 ?auto_678196 ) ( ON ?auto_678194 ?auto_678195 ) ( ON ?auto_678193 ?auto_678194 ) ( ON ?auto_678192 ?auto_678193 ) ( ON ?auto_678191 ?auto_678192 ) ( CLEAR ?auto_678189 ) ( ON ?auto_678190 ?auto_678191 ) ( CLEAR ?auto_678190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_678182 ?auto_678183 ?auto_678184 ?auto_678185 ?auto_678186 ?auto_678187 ?auto_678188 ?auto_678189 ?auto_678190 )
      ( MAKE-16PILE ?auto_678182 ?auto_678183 ?auto_678184 ?auto_678185 ?auto_678186 ?auto_678187 ?auto_678188 ?auto_678189 ?auto_678190 ?auto_678191 ?auto_678192 ?auto_678193 ?auto_678194 ?auto_678195 ?auto_678196 ?auto_678197 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678248 - BLOCK
      ?auto_678249 - BLOCK
      ?auto_678250 - BLOCK
      ?auto_678251 - BLOCK
      ?auto_678252 - BLOCK
      ?auto_678253 - BLOCK
      ?auto_678254 - BLOCK
      ?auto_678255 - BLOCK
      ?auto_678256 - BLOCK
      ?auto_678257 - BLOCK
      ?auto_678258 - BLOCK
      ?auto_678259 - BLOCK
      ?auto_678260 - BLOCK
      ?auto_678261 - BLOCK
      ?auto_678262 - BLOCK
      ?auto_678263 - BLOCK
    )
    :vars
    (
      ?auto_678264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678263 ?auto_678264 ) ( ON-TABLE ?auto_678248 ) ( ON ?auto_678249 ?auto_678248 ) ( ON ?auto_678250 ?auto_678249 ) ( ON ?auto_678251 ?auto_678250 ) ( ON ?auto_678252 ?auto_678251 ) ( ON ?auto_678253 ?auto_678252 ) ( ON ?auto_678254 ?auto_678253 ) ( not ( = ?auto_678248 ?auto_678249 ) ) ( not ( = ?auto_678248 ?auto_678250 ) ) ( not ( = ?auto_678248 ?auto_678251 ) ) ( not ( = ?auto_678248 ?auto_678252 ) ) ( not ( = ?auto_678248 ?auto_678253 ) ) ( not ( = ?auto_678248 ?auto_678254 ) ) ( not ( = ?auto_678248 ?auto_678255 ) ) ( not ( = ?auto_678248 ?auto_678256 ) ) ( not ( = ?auto_678248 ?auto_678257 ) ) ( not ( = ?auto_678248 ?auto_678258 ) ) ( not ( = ?auto_678248 ?auto_678259 ) ) ( not ( = ?auto_678248 ?auto_678260 ) ) ( not ( = ?auto_678248 ?auto_678261 ) ) ( not ( = ?auto_678248 ?auto_678262 ) ) ( not ( = ?auto_678248 ?auto_678263 ) ) ( not ( = ?auto_678248 ?auto_678264 ) ) ( not ( = ?auto_678249 ?auto_678250 ) ) ( not ( = ?auto_678249 ?auto_678251 ) ) ( not ( = ?auto_678249 ?auto_678252 ) ) ( not ( = ?auto_678249 ?auto_678253 ) ) ( not ( = ?auto_678249 ?auto_678254 ) ) ( not ( = ?auto_678249 ?auto_678255 ) ) ( not ( = ?auto_678249 ?auto_678256 ) ) ( not ( = ?auto_678249 ?auto_678257 ) ) ( not ( = ?auto_678249 ?auto_678258 ) ) ( not ( = ?auto_678249 ?auto_678259 ) ) ( not ( = ?auto_678249 ?auto_678260 ) ) ( not ( = ?auto_678249 ?auto_678261 ) ) ( not ( = ?auto_678249 ?auto_678262 ) ) ( not ( = ?auto_678249 ?auto_678263 ) ) ( not ( = ?auto_678249 ?auto_678264 ) ) ( not ( = ?auto_678250 ?auto_678251 ) ) ( not ( = ?auto_678250 ?auto_678252 ) ) ( not ( = ?auto_678250 ?auto_678253 ) ) ( not ( = ?auto_678250 ?auto_678254 ) ) ( not ( = ?auto_678250 ?auto_678255 ) ) ( not ( = ?auto_678250 ?auto_678256 ) ) ( not ( = ?auto_678250 ?auto_678257 ) ) ( not ( = ?auto_678250 ?auto_678258 ) ) ( not ( = ?auto_678250 ?auto_678259 ) ) ( not ( = ?auto_678250 ?auto_678260 ) ) ( not ( = ?auto_678250 ?auto_678261 ) ) ( not ( = ?auto_678250 ?auto_678262 ) ) ( not ( = ?auto_678250 ?auto_678263 ) ) ( not ( = ?auto_678250 ?auto_678264 ) ) ( not ( = ?auto_678251 ?auto_678252 ) ) ( not ( = ?auto_678251 ?auto_678253 ) ) ( not ( = ?auto_678251 ?auto_678254 ) ) ( not ( = ?auto_678251 ?auto_678255 ) ) ( not ( = ?auto_678251 ?auto_678256 ) ) ( not ( = ?auto_678251 ?auto_678257 ) ) ( not ( = ?auto_678251 ?auto_678258 ) ) ( not ( = ?auto_678251 ?auto_678259 ) ) ( not ( = ?auto_678251 ?auto_678260 ) ) ( not ( = ?auto_678251 ?auto_678261 ) ) ( not ( = ?auto_678251 ?auto_678262 ) ) ( not ( = ?auto_678251 ?auto_678263 ) ) ( not ( = ?auto_678251 ?auto_678264 ) ) ( not ( = ?auto_678252 ?auto_678253 ) ) ( not ( = ?auto_678252 ?auto_678254 ) ) ( not ( = ?auto_678252 ?auto_678255 ) ) ( not ( = ?auto_678252 ?auto_678256 ) ) ( not ( = ?auto_678252 ?auto_678257 ) ) ( not ( = ?auto_678252 ?auto_678258 ) ) ( not ( = ?auto_678252 ?auto_678259 ) ) ( not ( = ?auto_678252 ?auto_678260 ) ) ( not ( = ?auto_678252 ?auto_678261 ) ) ( not ( = ?auto_678252 ?auto_678262 ) ) ( not ( = ?auto_678252 ?auto_678263 ) ) ( not ( = ?auto_678252 ?auto_678264 ) ) ( not ( = ?auto_678253 ?auto_678254 ) ) ( not ( = ?auto_678253 ?auto_678255 ) ) ( not ( = ?auto_678253 ?auto_678256 ) ) ( not ( = ?auto_678253 ?auto_678257 ) ) ( not ( = ?auto_678253 ?auto_678258 ) ) ( not ( = ?auto_678253 ?auto_678259 ) ) ( not ( = ?auto_678253 ?auto_678260 ) ) ( not ( = ?auto_678253 ?auto_678261 ) ) ( not ( = ?auto_678253 ?auto_678262 ) ) ( not ( = ?auto_678253 ?auto_678263 ) ) ( not ( = ?auto_678253 ?auto_678264 ) ) ( not ( = ?auto_678254 ?auto_678255 ) ) ( not ( = ?auto_678254 ?auto_678256 ) ) ( not ( = ?auto_678254 ?auto_678257 ) ) ( not ( = ?auto_678254 ?auto_678258 ) ) ( not ( = ?auto_678254 ?auto_678259 ) ) ( not ( = ?auto_678254 ?auto_678260 ) ) ( not ( = ?auto_678254 ?auto_678261 ) ) ( not ( = ?auto_678254 ?auto_678262 ) ) ( not ( = ?auto_678254 ?auto_678263 ) ) ( not ( = ?auto_678254 ?auto_678264 ) ) ( not ( = ?auto_678255 ?auto_678256 ) ) ( not ( = ?auto_678255 ?auto_678257 ) ) ( not ( = ?auto_678255 ?auto_678258 ) ) ( not ( = ?auto_678255 ?auto_678259 ) ) ( not ( = ?auto_678255 ?auto_678260 ) ) ( not ( = ?auto_678255 ?auto_678261 ) ) ( not ( = ?auto_678255 ?auto_678262 ) ) ( not ( = ?auto_678255 ?auto_678263 ) ) ( not ( = ?auto_678255 ?auto_678264 ) ) ( not ( = ?auto_678256 ?auto_678257 ) ) ( not ( = ?auto_678256 ?auto_678258 ) ) ( not ( = ?auto_678256 ?auto_678259 ) ) ( not ( = ?auto_678256 ?auto_678260 ) ) ( not ( = ?auto_678256 ?auto_678261 ) ) ( not ( = ?auto_678256 ?auto_678262 ) ) ( not ( = ?auto_678256 ?auto_678263 ) ) ( not ( = ?auto_678256 ?auto_678264 ) ) ( not ( = ?auto_678257 ?auto_678258 ) ) ( not ( = ?auto_678257 ?auto_678259 ) ) ( not ( = ?auto_678257 ?auto_678260 ) ) ( not ( = ?auto_678257 ?auto_678261 ) ) ( not ( = ?auto_678257 ?auto_678262 ) ) ( not ( = ?auto_678257 ?auto_678263 ) ) ( not ( = ?auto_678257 ?auto_678264 ) ) ( not ( = ?auto_678258 ?auto_678259 ) ) ( not ( = ?auto_678258 ?auto_678260 ) ) ( not ( = ?auto_678258 ?auto_678261 ) ) ( not ( = ?auto_678258 ?auto_678262 ) ) ( not ( = ?auto_678258 ?auto_678263 ) ) ( not ( = ?auto_678258 ?auto_678264 ) ) ( not ( = ?auto_678259 ?auto_678260 ) ) ( not ( = ?auto_678259 ?auto_678261 ) ) ( not ( = ?auto_678259 ?auto_678262 ) ) ( not ( = ?auto_678259 ?auto_678263 ) ) ( not ( = ?auto_678259 ?auto_678264 ) ) ( not ( = ?auto_678260 ?auto_678261 ) ) ( not ( = ?auto_678260 ?auto_678262 ) ) ( not ( = ?auto_678260 ?auto_678263 ) ) ( not ( = ?auto_678260 ?auto_678264 ) ) ( not ( = ?auto_678261 ?auto_678262 ) ) ( not ( = ?auto_678261 ?auto_678263 ) ) ( not ( = ?auto_678261 ?auto_678264 ) ) ( not ( = ?auto_678262 ?auto_678263 ) ) ( not ( = ?auto_678262 ?auto_678264 ) ) ( not ( = ?auto_678263 ?auto_678264 ) ) ( ON ?auto_678262 ?auto_678263 ) ( ON ?auto_678261 ?auto_678262 ) ( ON ?auto_678260 ?auto_678261 ) ( ON ?auto_678259 ?auto_678260 ) ( ON ?auto_678258 ?auto_678259 ) ( ON ?auto_678257 ?auto_678258 ) ( ON ?auto_678256 ?auto_678257 ) ( CLEAR ?auto_678254 ) ( ON ?auto_678255 ?auto_678256 ) ( CLEAR ?auto_678255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_678248 ?auto_678249 ?auto_678250 ?auto_678251 ?auto_678252 ?auto_678253 ?auto_678254 ?auto_678255 )
      ( MAKE-16PILE ?auto_678248 ?auto_678249 ?auto_678250 ?auto_678251 ?auto_678252 ?auto_678253 ?auto_678254 ?auto_678255 ?auto_678256 ?auto_678257 ?auto_678258 ?auto_678259 ?auto_678260 ?auto_678261 ?auto_678262 ?auto_678263 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678314 - BLOCK
      ?auto_678315 - BLOCK
      ?auto_678316 - BLOCK
      ?auto_678317 - BLOCK
      ?auto_678318 - BLOCK
      ?auto_678319 - BLOCK
      ?auto_678320 - BLOCK
      ?auto_678321 - BLOCK
      ?auto_678322 - BLOCK
      ?auto_678323 - BLOCK
      ?auto_678324 - BLOCK
      ?auto_678325 - BLOCK
      ?auto_678326 - BLOCK
      ?auto_678327 - BLOCK
      ?auto_678328 - BLOCK
      ?auto_678329 - BLOCK
    )
    :vars
    (
      ?auto_678330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678329 ?auto_678330 ) ( ON-TABLE ?auto_678314 ) ( ON ?auto_678315 ?auto_678314 ) ( ON ?auto_678316 ?auto_678315 ) ( ON ?auto_678317 ?auto_678316 ) ( ON ?auto_678318 ?auto_678317 ) ( ON ?auto_678319 ?auto_678318 ) ( not ( = ?auto_678314 ?auto_678315 ) ) ( not ( = ?auto_678314 ?auto_678316 ) ) ( not ( = ?auto_678314 ?auto_678317 ) ) ( not ( = ?auto_678314 ?auto_678318 ) ) ( not ( = ?auto_678314 ?auto_678319 ) ) ( not ( = ?auto_678314 ?auto_678320 ) ) ( not ( = ?auto_678314 ?auto_678321 ) ) ( not ( = ?auto_678314 ?auto_678322 ) ) ( not ( = ?auto_678314 ?auto_678323 ) ) ( not ( = ?auto_678314 ?auto_678324 ) ) ( not ( = ?auto_678314 ?auto_678325 ) ) ( not ( = ?auto_678314 ?auto_678326 ) ) ( not ( = ?auto_678314 ?auto_678327 ) ) ( not ( = ?auto_678314 ?auto_678328 ) ) ( not ( = ?auto_678314 ?auto_678329 ) ) ( not ( = ?auto_678314 ?auto_678330 ) ) ( not ( = ?auto_678315 ?auto_678316 ) ) ( not ( = ?auto_678315 ?auto_678317 ) ) ( not ( = ?auto_678315 ?auto_678318 ) ) ( not ( = ?auto_678315 ?auto_678319 ) ) ( not ( = ?auto_678315 ?auto_678320 ) ) ( not ( = ?auto_678315 ?auto_678321 ) ) ( not ( = ?auto_678315 ?auto_678322 ) ) ( not ( = ?auto_678315 ?auto_678323 ) ) ( not ( = ?auto_678315 ?auto_678324 ) ) ( not ( = ?auto_678315 ?auto_678325 ) ) ( not ( = ?auto_678315 ?auto_678326 ) ) ( not ( = ?auto_678315 ?auto_678327 ) ) ( not ( = ?auto_678315 ?auto_678328 ) ) ( not ( = ?auto_678315 ?auto_678329 ) ) ( not ( = ?auto_678315 ?auto_678330 ) ) ( not ( = ?auto_678316 ?auto_678317 ) ) ( not ( = ?auto_678316 ?auto_678318 ) ) ( not ( = ?auto_678316 ?auto_678319 ) ) ( not ( = ?auto_678316 ?auto_678320 ) ) ( not ( = ?auto_678316 ?auto_678321 ) ) ( not ( = ?auto_678316 ?auto_678322 ) ) ( not ( = ?auto_678316 ?auto_678323 ) ) ( not ( = ?auto_678316 ?auto_678324 ) ) ( not ( = ?auto_678316 ?auto_678325 ) ) ( not ( = ?auto_678316 ?auto_678326 ) ) ( not ( = ?auto_678316 ?auto_678327 ) ) ( not ( = ?auto_678316 ?auto_678328 ) ) ( not ( = ?auto_678316 ?auto_678329 ) ) ( not ( = ?auto_678316 ?auto_678330 ) ) ( not ( = ?auto_678317 ?auto_678318 ) ) ( not ( = ?auto_678317 ?auto_678319 ) ) ( not ( = ?auto_678317 ?auto_678320 ) ) ( not ( = ?auto_678317 ?auto_678321 ) ) ( not ( = ?auto_678317 ?auto_678322 ) ) ( not ( = ?auto_678317 ?auto_678323 ) ) ( not ( = ?auto_678317 ?auto_678324 ) ) ( not ( = ?auto_678317 ?auto_678325 ) ) ( not ( = ?auto_678317 ?auto_678326 ) ) ( not ( = ?auto_678317 ?auto_678327 ) ) ( not ( = ?auto_678317 ?auto_678328 ) ) ( not ( = ?auto_678317 ?auto_678329 ) ) ( not ( = ?auto_678317 ?auto_678330 ) ) ( not ( = ?auto_678318 ?auto_678319 ) ) ( not ( = ?auto_678318 ?auto_678320 ) ) ( not ( = ?auto_678318 ?auto_678321 ) ) ( not ( = ?auto_678318 ?auto_678322 ) ) ( not ( = ?auto_678318 ?auto_678323 ) ) ( not ( = ?auto_678318 ?auto_678324 ) ) ( not ( = ?auto_678318 ?auto_678325 ) ) ( not ( = ?auto_678318 ?auto_678326 ) ) ( not ( = ?auto_678318 ?auto_678327 ) ) ( not ( = ?auto_678318 ?auto_678328 ) ) ( not ( = ?auto_678318 ?auto_678329 ) ) ( not ( = ?auto_678318 ?auto_678330 ) ) ( not ( = ?auto_678319 ?auto_678320 ) ) ( not ( = ?auto_678319 ?auto_678321 ) ) ( not ( = ?auto_678319 ?auto_678322 ) ) ( not ( = ?auto_678319 ?auto_678323 ) ) ( not ( = ?auto_678319 ?auto_678324 ) ) ( not ( = ?auto_678319 ?auto_678325 ) ) ( not ( = ?auto_678319 ?auto_678326 ) ) ( not ( = ?auto_678319 ?auto_678327 ) ) ( not ( = ?auto_678319 ?auto_678328 ) ) ( not ( = ?auto_678319 ?auto_678329 ) ) ( not ( = ?auto_678319 ?auto_678330 ) ) ( not ( = ?auto_678320 ?auto_678321 ) ) ( not ( = ?auto_678320 ?auto_678322 ) ) ( not ( = ?auto_678320 ?auto_678323 ) ) ( not ( = ?auto_678320 ?auto_678324 ) ) ( not ( = ?auto_678320 ?auto_678325 ) ) ( not ( = ?auto_678320 ?auto_678326 ) ) ( not ( = ?auto_678320 ?auto_678327 ) ) ( not ( = ?auto_678320 ?auto_678328 ) ) ( not ( = ?auto_678320 ?auto_678329 ) ) ( not ( = ?auto_678320 ?auto_678330 ) ) ( not ( = ?auto_678321 ?auto_678322 ) ) ( not ( = ?auto_678321 ?auto_678323 ) ) ( not ( = ?auto_678321 ?auto_678324 ) ) ( not ( = ?auto_678321 ?auto_678325 ) ) ( not ( = ?auto_678321 ?auto_678326 ) ) ( not ( = ?auto_678321 ?auto_678327 ) ) ( not ( = ?auto_678321 ?auto_678328 ) ) ( not ( = ?auto_678321 ?auto_678329 ) ) ( not ( = ?auto_678321 ?auto_678330 ) ) ( not ( = ?auto_678322 ?auto_678323 ) ) ( not ( = ?auto_678322 ?auto_678324 ) ) ( not ( = ?auto_678322 ?auto_678325 ) ) ( not ( = ?auto_678322 ?auto_678326 ) ) ( not ( = ?auto_678322 ?auto_678327 ) ) ( not ( = ?auto_678322 ?auto_678328 ) ) ( not ( = ?auto_678322 ?auto_678329 ) ) ( not ( = ?auto_678322 ?auto_678330 ) ) ( not ( = ?auto_678323 ?auto_678324 ) ) ( not ( = ?auto_678323 ?auto_678325 ) ) ( not ( = ?auto_678323 ?auto_678326 ) ) ( not ( = ?auto_678323 ?auto_678327 ) ) ( not ( = ?auto_678323 ?auto_678328 ) ) ( not ( = ?auto_678323 ?auto_678329 ) ) ( not ( = ?auto_678323 ?auto_678330 ) ) ( not ( = ?auto_678324 ?auto_678325 ) ) ( not ( = ?auto_678324 ?auto_678326 ) ) ( not ( = ?auto_678324 ?auto_678327 ) ) ( not ( = ?auto_678324 ?auto_678328 ) ) ( not ( = ?auto_678324 ?auto_678329 ) ) ( not ( = ?auto_678324 ?auto_678330 ) ) ( not ( = ?auto_678325 ?auto_678326 ) ) ( not ( = ?auto_678325 ?auto_678327 ) ) ( not ( = ?auto_678325 ?auto_678328 ) ) ( not ( = ?auto_678325 ?auto_678329 ) ) ( not ( = ?auto_678325 ?auto_678330 ) ) ( not ( = ?auto_678326 ?auto_678327 ) ) ( not ( = ?auto_678326 ?auto_678328 ) ) ( not ( = ?auto_678326 ?auto_678329 ) ) ( not ( = ?auto_678326 ?auto_678330 ) ) ( not ( = ?auto_678327 ?auto_678328 ) ) ( not ( = ?auto_678327 ?auto_678329 ) ) ( not ( = ?auto_678327 ?auto_678330 ) ) ( not ( = ?auto_678328 ?auto_678329 ) ) ( not ( = ?auto_678328 ?auto_678330 ) ) ( not ( = ?auto_678329 ?auto_678330 ) ) ( ON ?auto_678328 ?auto_678329 ) ( ON ?auto_678327 ?auto_678328 ) ( ON ?auto_678326 ?auto_678327 ) ( ON ?auto_678325 ?auto_678326 ) ( ON ?auto_678324 ?auto_678325 ) ( ON ?auto_678323 ?auto_678324 ) ( ON ?auto_678322 ?auto_678323 ) ( ON ?auto_678321 ?auto_678322 ) ( CLEAR ?auto_678319 ) ( ON ?auto_678320 ?auto_678321 ) ( CLEAR ?auto_678320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_678314 ?auto_678315 ?auto_678316 ?auto_678317 ?auto_678318 ?auto_678319 ?auto_678320 )
      ( MAKE-16PILE ?auto_678314 ?auto_678315 ?auto_678316 ?auto_678317 ?auto_678318 ?auto_678319 ?auto_678320 ?auto_678321 ?auto_678322 ?auto_678323 ?auto_678324 ?auto_678325 ?auto_678326 ?auto_678327 ?auto_678328 ?auto_678329 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678380 - BLOCK
      ?auto_678381 - BLOCK
      ?auto_678382 - BLOCK
      ?auto_678383 - BLOCK
      ?auto_678384 - BLOCK
      ?auto_678385 - BLOCK
      ?auto_678386 - BLOCK
      ?auto_678387 - BLOCK
      ?auto_678388 - BLOCK
      ?auto_678389 - BLOCK
      ?auto_678390 - BLOCK
      ?auto_678391 - BLOCK
      ?auto_678392 - BLOCK
      ?auto_678393 - BLOCK
      ?auto_678394 - BLOCK
      ?auto_678395 - BLOCK
    )
    :vars
    (
      ?auto_678396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678395 ?auto_678396 ) ( ON-TABLE ?auto_678380 ) ( ON ?auto_678381 ?auto_678380 ) ( ON ?auto_678382 ?auto_678381 ) ( ON ?auto_678383 ?auto_678382 ) ( ON ?auto_678384 ?auto_678383 ) ( not ( = ?auto_678380 ?auto_678381 ) ) ( not ( = ?auto_678380 ?auto_678382 ) ) ( not ( = ?auto_678380 ?auto_678383 ) ) ( not ( = ?auto_678380 ?auto_678384 ) ) ( not ( = ?auto_678380 ?auto_678385 ) ) ( not ( = ?auto_678380 ?auto_678386 ) ) ( not ( = ?auto_678380 ?auto_678387 ) ) ( not ( = ?auto_678380 ?auto_678388 ) ) ( not ( = ?auto_678380 ?auto_678389 ) ) ( not ( = ?auto_678380 ?auto_678390 ) ) ( not ( = ?auto_678380 ?auto_678391 ) ) ( not ( = ?auto_678380 ?auto_678392 ) ) ( not ( = ?auto_678380 ?auto_678393 ) ) ( not ( = ?auto_678380 ?auto_678394 ) ) ( not ( = ?auto_678380 ?auto_678395 ) ) ( not ( = ?auto_678380 ?auto_678396 ) ) ( not ( = ?auto_678381 ?auto_678382 ) ) ( not ( = ?auto_678381 ?auto_678383 ) ) ( not ( = ?auto_678381 ?auto_678384 ) ) ( not ( = ?auto_678381 ?auto_678385 ) ) ( not ( = ?auto_678381 ?auto_678386 ) ) ( not ( = ?auto_678381 ?auto_678387 ) ) ( not ( = ?auto_678381 ?auto_678388 ) ) ( not ( = ?auto_678381 ?auto_678389 ) ) ( not ( = ?auto_678381 ?auto_678390 ) ) ( not ( = ?auto_678381 ?auto_678391 ) ) ( not ( = ?auto_678381 ?auto_678392 ) ) ( not ( = ?auto_678381 ?auto_678393 ) ) ( not ( = ?auto_678381 ?auto_678394 ) ) ( not ( = ?auto_678381 ?auto_678395 ) ) ( not ( = ?auto_678381 ?auto_678396 ) ) ( not ( = ?auto_678382 ?auto_678383 ) ) ( not ( = ?auto_678382 ?auto_678384 ) ) ( not ( = ?auto_678382 ?auto_678385 ) ) ( not ( = ?auto_678382 ?auto_678386 ) ) ( not ( = ?auto_678382 ?auto_678387 ) ) ( not ( = ?auto_678382 ?auto_678388 ) ) ( not ( = ?auto_678382 ?auto_678389 ) ) ( not ( = ?auto_678382 ?auto_678390 ) ) ( not ( = ?auto_678382 ?auto_678391 ) ) ( not ( = ?auto_678382 ?auto_678392 ) ) ( not ( = ?auto_678382 ?auto_678393 ) ) ( not ( = ?auto_678382 ?auto_678394 ) ) ( not ( = ?auto_678382 ?auto_678395 ) ) ( not ( = ?auto_678382 ?auto_678396 ) ) ( not ( = ?auto_678383 ?auto_678384 ) ) ( not ( = ?auto_678383 ?auto_678385 ) ) ( not ( = ?auto_678383 ?auto_678386 ) ) ( not ( = ?auto_678383 ?auto_678387 ) ) ( not ( = ?auto_678383 ?auto_678388 ) ) ( not ( = ?auto_678383 ?auto_678389 ) ) ( not ( = ?auto_678383 ?auto_678390 ) ) ( not ( = ?auto_678383 ?auto_678391 ) ) ( not ( = ?auto_678383 ?auto_678392 ) ) ( not ( = ?auto_678383 ?auto_678393 ) ) ( not ( = ?auto_678383 ?auto_678394 ) ) ( not ( = ?auto_678383 ?auto_678395 ) ) ( not ( = ?auto_678383 ?auto_678396 ) ) ( not ( = ?auto_678384 ?auto_678385 ) ) ( not ( = ?auto_678384 ?auto_678386 ) ) ( not ( = ?auto_678384 ?auto_678387 ) ) ( not ( = ?auto_678384 ?auto_678388 ) ) ( not ( = ?auto_678384 ?auto_678389 ) ) ( not ( = ?auto_678384 ?auto_678390 ) ) ( not ( = ?auto_678384 ?auto_678391 ) ) ( not ( = ?auto_678384 ?auto_678392 ) ) ( not ( = ?auto_678384 ?auto_678393 ) ) ( not ( = ?auto_678384 ?auto_678394 ) ) ( not ( = ?auto_678384 ?auto_678395 ) ) ( not ( = ?auto_678384 ?auto_678396 ) ) ( not ( = ?auto_678385 ?auto_678386 ) ) ( not ( = ?auto_678385 ?auto_678387 ) ) ( not ( = ?auto_678385 ?auto_678388 ) ) ( not ( = ?auto_678385 ?auto_678389 ) ) ( not ( = ?auto_678385 ?auto_678390 ) ) ( not ( = ?auto_678385 ?auto_678391 ) ) ( not ( = ?auto_678385 ?auto_678392 ) ) ( not ( = ?auto_678385 ?auto_678393 ) ) ( not ( = ?auto_678385 ?auto_678394 ) ) ( not ( = ?auto_678385 ?auto_678395 ) ) ( not ( = ?auto_678385 ?auto_678396 ) ) ( not ( = ?auto_678386 ?auto_678387 ) ) ( not ( = ?auto_678386 ?auto_678388 ) ) ( not ( = ?auto_678386 ?auto_678389 ) ) ( not ( = ?auto_678386 ?auto_678390 ) ) ( not ( = ?auto_678386 ?auto_678391 ) ) ( not ( = ?auto_678386 ?auto_678392 ) ) ( not ( = ?auto_678386 ?auto_678393 ) ) ( not ( = ?auto_678386 ?auto_678394 ) ) ( not ( = ?auto_678386 ?auto_678395 ) ) ( not ( = ?auto_678386 ?auto_678396 ) ) ( not ( = ?auto_678387 ?auto_678388 ) ) ( not ( = ?auto_678387 ?auto_678389 ) ) ( not ( = ?auto_678387 ?auto_678390 ) ) ( not ( = ?auto_678387 ?auto_678391 ) ) ( not ( = ?auto_678387 ?auto_678392 ) ) ( not ( = ?auto_678387 ?auto_678393 ) ) ( not ( = ?auto_678387 ?auto_678394 ) ) ( not ( = ?auto_678387 ?auto_678395 ) ) ( not ( = ?auto_678387 ?auto_678396 ) ) ( not ( = ?auto_678388 ?auto_678389 ) ) ( not ( = ?auto_678388 ?auto_678390 ) ) ( not ( = ?auto_678388 ?auto_678391 ) ) ( not ( = ?auto_678388 ?auto_678392 ) ) ( not ( = ?auto_678388 ?auto_678393 ) ) ( not ( = ?auto_678388 ?auto_678394 ) ) ( not ( = ?auto_678388 ?auto_678395 ) ) ( not ( = ?auto_678388 ?auto_678396 ) ) ( not ( = ?auto_678389 ?auto_678390 ) ) ( not ( = ?auto_678389 ?auto_678391 ) ) ( not ( = ?auto_678389 ?auto_678392 ) ) ( not ( = ?auto_678389 ?auto_678393 ) ) ( not ( = ?auto_678389 ?auto_678394 ) ) ( not ( = ?auto_678389 ?auto_678395 ) ) ( not ( = ?auto_678389 ?auto_678396 ) ) ( not ( = ?auto_678390 ?auto_678391 ) ) ( not ( = ?auto_678390 ?auto_678392 ) ) ( not ( = ?auto_678390 ?auto_678393 ) ) ( not ( = ?auto_678390 ?auto_678394 ) ) ( not ( = ?auto_678390 ?auto_678395 ) ) ( not ( = ?auto_678390 ?auto_678396 ) ) ( not ( = ?auto_678391 ?auto_678392 ) ) ( not ( = ?auto_678391 ?auto_678393 ) ) ( not ( = ?auto_678391 ?auto_678394 ) ) ( not ( = ?auto_678391 ?auto_678395 ) ) ( not ( = ?auto_678391 ?auto_678396 ) ) ( not ( = ?auto_678392 ?auto_678393 ) ) ( not ( = ?auto_678392 ?auto_678394 ) ) ( not ( = ?auto_678392 ?auto_678395 ) ) ( not ( = ?auto_678392 ?auto_678396 ) ) ( not ( = ?auto_678393 ?auto_678394 ) ) ( not ( = ?auto_678393 ?auto_678395 ) ) ( not ( = ?auto_678393 ?auto_678396 ) ) ( not ( = ?auto_678394 ?auto_678395 ) ) ( not ( = ?auto_678394 ?auto_678396 ) ) ( not ( = ?auto_678395 ?auto_678396 ) ) ( ON ?auto_678394 ?auto_678395 ) ( ON ?auto_678393 ?auto_678394 ) ( ON ?auto_678392 ?auto_678393 ) ( ON ?auto_678391 ?auto_678392 ) ( ON ?auto_678390 ?auto_678391 ) ( ON ?auto_678389 ?auto_678390 ) ( ON ?auto_678388 ?auto_678389 ) ( ON ?auto_678387 ?auto_678388 ) ( ON ?auto_678386 ?auto_678387 ) ( CLEAR ?auto_678384 ) ( ON ?auto_678385 ?auto_678386 ) ( CLEAR ?auto_678385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_678380 ?auto_678381 ?auto_678382 ?auto_678383 ?auto_678384 ?auto_678385 )
      ( MAKE-16PILE ?auto_678380 ?auto_678381 ?auto_678382 ?auto_678383 ?auto_678384 ?auto_678385 ?auto_678386 ?auto_678387 ?auto_678388 ?auto_678389 ?auto_678390 ?auto_678391 ?auto_678392 ?auto_678393 ?auto_678394 ?auto_678395 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678446 - BLOCK
      ?auto_678447 - BLOCK
      ?auto_678448 - BLOCK
      ?auto_678449 - BLOCK
      ?auto_678450 - BLOCK
      ?auto_678451 - BLOCK
      ?auto_678452 - BLOCK
      ?auto_678453 - BLOCK
      ?auto_678454 - BLOCK
      ?auto_678455 - BLOCK
      ?auto_678456 - BLOCK
      ?auto_678457 - BLOCK
      ?auto_678458 - BLOCK
      ?auto_678459 - BLOCK
      ?auto_678460 - BLOCK
      ?auto_678461 - BLOCK
    )
    :vars
    (
      ?auto_678462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678461 ?auto_678462 ) ( ON-TABLE ?auto_678446 ) ( ON ?auto_678447 ?auto_678446 ) ( ON ?auto_678448 ?auto_678447 ) ( ON ?auto_678449 ?auto_678448 ) ( not ( = ?auto_678446 ?auto_678447 ) ) ( not ( = ?auto_678446 ?auto_678448 ) ) ( not ( = ?auto_678446 ?auto_678449 ) ) ( not ( = ?auto_678446 ?auto_678450 ) ) ( not ( = ?auto_678446 ?auto_678451 ) ) ( not ( = ?auto_678446 ?auto_678452 ) ) ( not ( = ?auto_678446 ?auto_678453 ) ) ( not ( = ?auto_678446 ?auto_678454 ) ) ( not ( = ?auto_678446 ?auto_678455 ) ) ( not ( = ?auto_678446 ?auto_678456 ) ) ( not ( = ?auto_678446 ?auto_678457 ) ) ( not ( = ?auto_678446 ?auto_678458 ) ) ( not ( = ?auto_678446 ?auto_678459 ) ) ( not ( = ?auto_678446 ?auto_678460 ) ) ( not ( = ?auto_678446 ?auto_678461 ) ) ( not ( = ?auto_678446 ?auto_678462 ) ) ( not ( = ?auto_678447 ?auto_678448 ) ) ( not ( = ?auto_678447 ?auto_678449 ) ) ( not ( = ?auto_678447 ?auto_678450 ) ) ( not ( = ?auto_678447 ?auto_678451 ) ) ( not ( = ?auto_678447 ?auto_678452 ) ) ( not ( = ?auto_678447 ?auto_678453 ) ) ( not ( = ?auto_678447 ?auto_678454 ) ) ( not ( = ?auto_678447 ?auto_678455 ) ) ( not ( = ?auto_678447 ?auto_678456 ) ) ( not ( = ?auto_678447 ?auto_678457 ) ) ( not ( = ?auto_678447 ?auto_678458 ) ) ( not ( = ?auto_678447 ?auto_678459 ) ) ( not ( = ?auto_678447 ?auto_678460 ) ) ( not ( = ?auto_678447 ?auto_678461 ) ) ( not ( = ?auto_678447 ?auto_678462 ) ) ( not ( = ?auto_678448 ?auto_678449 ) ) ( not ( = ?auto_678448 ?auto_678450 ) ) ( not ( = ?auto_678448 ?auto_678451 ) ) ( not ( = ?auto_678448 ?auto_678452 ) ) ( not ( = ?auto_678448 ?auto_678453 ) ) ( not ( = ?auto_678448 ?auto_678454 ) ) ( not ( = ?auto_678448 ?auto_678455 ) ) ( not ( = ?auto_678448 ?auto_678456 ) ) ( not ( = ?auto_678448 ?auto_678457 ) ) ( not ( = ?auto_678448 ?auto_678458 ) ) ( not ( = ?auto_678448 ?auto_678459 ) ) ( not ( = ?auto_678448 ?auto_678460 ) ) ( not ( = ?auto_678448 ?auto_678461 ) ) ( not ( = ?auto_678448 ?auto_678462 ) ) ( not ( = ?auto_678449 ?auto_678450 ) ) ( not ( = ?auto_678449 ?auto_678451 ) ) ( not ( = ?auto_678449 ?auto_678452 ) ) ( not ( = ?auto_678449 ?auto_678453 ) ) ( not ( = ?auto_678449 ?auto_678454 ) ) ( not ( = ?auto_678449 ?auto_678455 ) ) ( not ( = ?auto_678449 ?auto_678456 ) ) ( not ( = ?auto_678449 ?auto_678457 ) ) ( not ( = ?auto_678449 ?auto_678458 ) ) ( not ( = ?auto_678449 ?auto_678459 ) ) ( not ( = ?auto_678449 ?auto_678460 ) ) ( not ( = ?auto_678449 ?auto_678461 ) ) ( not ( = ?auto_678449 ?auto_678462 ) ) ( not ( = ?auto_678450 ?auto_678451 ) ) ( not ( = ?auto_678450 ?auto_678452 ) ) ( not ( = ?auto_678450 ?auto_678453 ) ) ( not ( = ?auto_678450 ?auto_678454 ) ) ( not ( = ?auto_678450 ?auto_678455 ) ) ( not ( = ?auto_678450 ?auto_678456 ) ) ( not ( = ?auto_678450 ?auto_678457 ) ) ( not ( = ?auto_678450 ?auto_678458 ) ) ( not ( = ?auto_678450 ?auto_678459 ) ) ( not ( = ?auto_678450 ?auto_678460 ) ) ( not ( = ?auto_678450 ?auto_678461 ) ) ( not ( = ?auto_678450 ?auto_678462 ) ) ( not ( = ?auto_678451 ?auto_678452 ) ) ( not ( = ?auto_678451 ?auto_678453 ) ) ( not ( = ?auto_678451 ?auto_678454 ) ) ( not ( = ?auto_678451 ?auto_678455 ) ) ( not ( = ?auto_678451 ?auto_678456 ) ) ( not ( = ?auto_678451 ?auto_678457 ) ) ( not ( = ?auto_678451 ?auto_678458 ) ) ( not ( = ?auto_678451 ?auto_678459 ) ) ( not ( = ?auto_678451 ?auto_678460 ) ) ( not ( = ?auto_678451 ?auto_678461 ) ) ( not ( = ?auto_678451 ?auto_678462 ) ) ( not ( = ?auto_678452 ?auto_678453 ) ) ( not ( = ?auto_678452 ?auto_678454 ) ) ( not ( = ?auto_678452 ?auto_678455 ) ) ( not ( = ?auto_678452 ?auto_678456 ) ) ( not ( = ?auto_678452 ?auto_678457 ) ) ( not ( = ?auto_678452 ?auto_678458 ) ) ( not ( = ?auto_678452 ?auto_678459 ) ) ( not ( = ?auto_678452 ?auto_678460 ) ) ( not ( = ?auto_678452 ?auto_678461 ) ) ( not ( = ?auto_678452 ?auto_678462 ) ) ( not ( = ?auto_678453 ?auto_678454 ) ) ( not ( = ?auto_678453 ?auto_678455 ) ) ( not ( = ?auto_678453 ?auto_678456 ) ) ( not ( = ?auto_678453 ?auto_678457 ) ) ( not ( = ?auto_678453 ?auto_678458 ) ) ( not ( = ?auto_678453 ?auto_678459 ) ) ( not ( = ?auto_678453 ?auto_678460 ) ) ( not ( = ?auto_678453 ?auto_678461 ) ) ( not ( = ?auto_678453 ?auto_678462 ) ) ( not ( = ?auto_678454 ?auto_678455 ) ) ( not ( = ?auto_678454 ?auto_678456 ) ) ( not ( = ?auto_678454 ?auto_678457 ) ) ( not ( = ?auto_678454 ?auto_678458 ) ) ( not ( = ?auto_678454 ?auto_678459 ) ) ( not ( = ?auto_678454 ?auto_678460 ) ) ( not ( = ?auto_678454 ?auto_678461 ) ) ( not ( = ?auto_678454 ?auto_678462 ) ) ( not ( = ?auto_678455 ?auto_678456 ) ) ( not ( = ?auto_678455 ?auto_678457 ) ) ( not ( = ?auto_678455 ?auto_678458 ) ) ( not ( = ?auto_678455 ?auto_678459 ) ) ( not ( = ?auto_678455 ?auto_678460 ) ) ( not ( = ?auto_678455 ?auto_678461 ) ) ( not ( = ?auto_678455 ?auto_678462 ) ) ( not ( = ?auto_678456 ?auto_678457 ) ) ( not ( = ?auto_678456 ?auto_678458 ) ) ( not ( = ?auto_678456 ?auto_678459 ) ) ( not ( = ?auto_678456 ?auto_678460 ) ) ( not ( = ?auto_678456 ?auto_678461 ) ) ( not ( = ?auto_678456 ?auto_678462 ) ) ( not ( = ?auto_678457 ?auto_678458 ) ) ( not ( = ?auto_678457 ?auto_678459 ) ) ( not ( = ?auto_678457 ?auto_678460 ) ) ( not ( = ?auto_678457 ?auto_678461 ) ) ( not ( = ?auto_678457 ?auto_678462 ) ) ( not ( = ?auto_678458 ?auto_678459 ) ) ( not ( = ?auto_678458 ?auto_678460 ) ) ( not ( = ?auto_678458 ?auto_678461 ) ) ( not ( = ?auto_678458 ?auto_678462 ) ) ( not ( = ?auto_678459 ?auto_678460 ) ) ( not ( = ?auto_678459 ?auto_678461 ) ) ( not ( = ?auto_678459 ?auto_678462 ) ) ( not ( = ?auto_678460 ?auto_678461 ) ) ( not ( = ?auto_678460 ?auto_678462 ) ) ( not ( = ?auto_678461 ?auto_678462 ) ) ( ON ?auto_678460 ?auto_678461 ) ( ON ?auto_678459 ?auto_678460 ) ( ON ?auto_678458 ?auto_678459 ) ( ON ?auto_678457 ?auto_678458 ) ( ON ?auto_678456 ?auto_678457 ) ( ON ?auto_678455 ?auto_678456 ) ( ON ?auto_678454 ?auto_678455 ) ( ON ?auto_678453 ?auto_678454 ) ( ON ?auto_678452 ?auto_678453 ) ( ON ?auto_678451 ?auto_678452 ) ( CLEAR ?auto_678449 ) ( ON ?auto_678450 ?auto_678451 ) ( CLEAR ?auto_678450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_678446 ?auto_678447 ?auto_678448 ?auto_678449 ?auto_678450 )
      ( MAKE-16PILE ?auto_678446 ?auto_678447 ?auto_678448 ?auto_678449 ?auto_678450 ?auto_678451 ?auto_678452 ?auto_678453 ?auto_678454 ?auto_678455 ?auto_678456 ?auto_678457 ?auto_678458 ?auto_678459 ?auto_678460 ?auto_678461 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678512 - BLOCK
      ?auto_678513 - BLOCK
      ?auto_678514 - BLOCK
      ?auto_678515 - BLOCK
      ?auto_678516 - BLOCK
      ?auto_678517 - BLOCK
      ?auto_678518 - BLOCK
      ?auto_678519 - BLOCK
      ?auto_678520 - BLOCK
      ?auto_678521 - BLOCK
      ?auto_678522 - BLOCK
      ?auto_678523 - BLOCK
      ?auto_678524 - BLOCK
      ?auto_678525 - BLOCK
      ?auto_678526 - BLOCK
      ?auto_678527 - BLOCK
    )
    :vars
    (
      ?auto_678528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678527 ?auto_678528 ) ( ON-TABLE ?auto_678512 ) ( ON ?auto_678513 ?auto_678512 ) ( ON ?auto_678514 ?auto_678513 ) ( not ( = ?auto_678512 ?auto_678513 ) ) ( not ( = ?auto_678512 ?auto_678514 ) ) ( not ( = ?auto_678512 ?auto_678515 ) ) ( not ( = ?auto_678512 ?auto_678516 ) ) ( not ( = ?auto_678512 ?auto_678517 ) ) ( not ( = ?auto_678512 ?auto_678518 ) ) ( not ( = ?auto_678512 ?auto_678519 ) ) ( not ( = ?auto_678512 ?auto_678520 ) ) ( not ( = ?auto_678512 ?auto_678521 ) ) ( not ( = ?auto_678512 ?auto_678522 ) ) ( not ( = ?auto_678512 ?auto_678523 ) ) ( not ( = ?auto_678512 ?auto_678524 ) ) ( not ( = ?auto_678512 ?auto_678525 ) ) ( not ( = ?auto_678512 ?auto_678526 ) ) ( not ( = ?auto_678512 ?auto_678527 ) ) ( not ( = ?auto_678512 ?auto_678528 ) ) ( not ( = ?auto_678513 ?auto_678514 ) ) ( not ( = ?auto_678513 ?auto_678515 ) ) ( not ( = ?auto_678513 ?auto_678516 ) ) ( not ( = ?auto_678513 ?auto_678517 ) ) ( not ( = ?auto_678513 ?auto_678518 ) ) ( not ( = ?auto_678513 ?auto_678519 ) ) ( not ( = ?auto_678513 ?auto_678520 ) ) ( not ( = ?auto_678513 ?auto_678521 ) ) ( not ( = ?auto_678513 ?auto_678522 ) ) ( not ( = ?auto_678513 ?auto_678523 ) ) ( not ( = ?auto_678513 ?auto_678524 ) ) ( not ( = ?auto_678513 ?auto_678525 ) ) ( not ( = ?auto_678513 ?auto_678526 ) ) ( not ( = ?auto_678513 ?auto_678527 ) ) ( not ( = ?auto_678513 ?auto_678528 ) ) ( not ( = ?auto_678514 ?auto_678515 ) ) ( not ( = ?auto_678514 ?auto_678516 ) ) ( not ( = ?auto_678514 ?auto_678517 ) ) ( not ( = ?auto_678514 ?auto_678518 ) ) ( not ( = ?auto_678514 ?auto_678519 ) ) ( not ( = ?auto_678514 ?auto_678520 ) ) ( not ( = ?auto_678514 ?auto_678521 ) ) ( not ( = ?auto_678514 ?auto_678522 ) ) ( not ( = ?auto_678514 ?auto_678523 ) ) ( not ( = ?auto_678514 ?auto_678524 ) ) ( not ( = ?auto_678514 ?auto_678525 ) ) ( not ( = ?auto_678514 ?auto_678526 ) ) ( not ( = ?auto_678514 ?auto_678527 ) ) ( not ( = ?auto_678514 ?auto_678528 ) ) ( not ( = ?auto_678515 ?auto_678516 ) ) ( not ( = ?auto_678515 ?auto_678517 ) ) ( not ( = ?auto_678515 ?auto_678518 ) ) ( not ( = ?auto_678515 ?auto_678519 ) ) ( not ( = ?auto_678515 ?auto_678520 ) ) ( not ( = ?auto_678515 ?auto_678521 ) ) ( not ( = ?auto_678515 ?auto_678522 ) ) ( not ( = ?auto_678515 ?auto_678523 ) ) ( not ( = ?auto_678515 ?auto_678524 ) ) ( not ( = ?auto_678515 ?auto_678525 ) ) ( not ( = ?auto_678515 ?auto_678526 ) ) ( not ( = ?auto_678515 ?auto_678527 ) ) ( not ( = ?auto_678515 ?auto_678528 ) ) ( not ( = ?auto_678516 ?auto_678517 ) ) ( not ( = ?auto_678516 ?auto_678518 ) ) ( not ( = ?auto_678516 ?auto_678519 ) ) ( not ( = ?auto_678516 ?auto_678520 ) ) ( not ( = ?auto_678516 ?auto_678521 ) ) ( not ( = ?auto_678516 ?auto_678522 ) ) ( not ( = ?auto_678516 ?auto_678523 ) ) ( not ( = ?auto_678516 ?auto_678524 ) ) ( not ( = ?auto_678516 ?auto_678525 ) ) ( not ( = ?auto_678516 ?auto_678526 ) ) ( not ( = ?auto_678516 ?auto_678527 ) ) ( not ( = ?auto_678516 ?auto_678528 ) ) ( not ( = ?auto_678517 ?auto_678518 ) ) ( not ( = ?auto_678517 ?auto_678519 ) ) ( not ( = ?auto_678517 ?auto_678520 ) ) ( not ( = ?auto_678517 ?auto_678521 ) ) ( not ( = ?auto_678517 ?auto_678522 ) ) ( not ( = ?auto_678517 ?auto_678523 ) ) ( not ( = ?auto_678517 ?auto_678524 ) ) ( not ( = ?auto_678517 ?auto_678525 ) ) ( not ( = ?auto_678517 ?auto_678526 ) ) ( not ( = ?auto_678517 ?auto_678527 ) ) ( not ( = ?auto_678517 ?auto_678528 ) ) ( not ( = ?auto_678518 ?auto_678519 ) ) ( not ( = ?auto_678518 ?auto_678520 ) ) ( not ( = ?auto_678518 ?auto_678521 ) ) ( not ( = ?auto_678518 ?auto_678522 ) ) ( not ( = ?auto_678518 ?auto_678523 ) ) ( not ( = ?auto_678518 ?auto_678524 ) ) ( not ( = ?auto_678518 ?auto_678525 ) ) ( not ( = ?auto_678518 ?auto_678526 ) ) ( not ( = ?auto_678518 ?auto_678527 ) ) ( not ( = ?auto_678518 ?auto_678528 ) ) ( not ( = ?auto_678519 ?auto_678520 ) ) ( not ( = ?auto_678519 ?auto_678521 ) ) ( not ( = ?auto_678519 ?auto_678522 ) ) ( not ( = ?auto_678519 ?auto_678523 ) ) ( not ( = ?auto_678519 ?auto_678524 ) ) ( not ( = ?auto_678519 ?auto_678525 ) ) ( not ( = ?auto_678519 ?auto_678526 ) ) ( not ( = ?auto_678519 ?auto_678527 ) ) ( not ( = ?auto_678519 ?auto_678528 ) ) ( not ( = ?auto_678520 ?auto_678521 ) ) ( not ( = ?auto_678520 ?auto_678522 ) ) ( not ( = ?auto_678520 ?auto_678523 ) ) ( not ( = ?auto_678520 ?auto_678524 ) ) ( not ( = ?auto_678520 ?auto_678525 ) ) ( not ( = ?auto_678520 ?auto_678526 ) ) ( not ( = ?auto_678520 ?auto_678527 ) ) ( not ( = ?auto_678520 ?auto_678528 ) ) ( not ( = ?auto_678521 ?auto_678522 ) ) ( not ( = ?auto_678521 ?auto_678523 ) ) ( not ( = ?auto_678521 ?auto_678524 ) ) ( not ( = ?auto_678521 ?auto_678525 ) ) ( not ( = ?auto_678521 ?auto_678526 ) ) ( not ( = ?auto_678521 ?auto_678527 ) ) ( not ( = ?auto_678521 ?auto_678528 ) ) ( not ( = ?auto_678522 ?auto_678523 ) ) ( not ( = ?auto_678522 ?auto_678524 ) ) ( not ( = ?auto_678522 ?auto_678525 ) ) ( not ( = ?auto_678522 ?auto_678526 ) ) ( not ( = ?auto_678522 ?auto_678527 ) ) ( not ( = ?auto_678522 ?auto_678528 ) ) ( not ( = ?auto_678523 ?auto_678524 ) ) ( not ( = ?auto_678523 ?auto_678525 ) ) ( not ( = ?auto_678523 ?auto_678526 ) ) ( not ( = ?auto_678523 ?auto_678527 ) ) ( not ( = ?auto_678523 ?auto_678528 ) ) ( not ( = ?auto_678524 ?auto_678525 ) ) ( not ( = ?auto_678524 ?auto_678526 ) ) ( not ( = ?auto_678524 ?auto_678527 ) ) ( not ( = ?auto_678524 ?auto_678528 ) ) ( not ( = ?auto_678525 ?auto_678526 ) ) ( not ( = ?auto_678525 ?auto_678527 ) ) ( not ( = ?auto_678525 ?auto_678528 ) ) ( not ( = ?auto_678526 ?auto_678527 ) ) ( not ( = ?auto_678526 ?auto_678528 ) ) ( not ( = ?auto_678527 ?auto_678528 ) ) ( ON ?auto_678526 ?auto_678527 ) ( ON ?auto_678525 ?auto_678526 ) ( ON ?auto_678524 ?auto_678525 ) ( ON ?auto_678523 ?auto_678524 ) ( ON ?auto_678522 ?auto_678523 ) ( ON ?auto_678521 ?auto_678522 ) ( ON ?auto_678520 ?auto_678521 ) ( ON ?auto_678519 ?auto_678520 ) ( ON ?auto_678518 ?auto_678519 ) ( ON ?auto_678517 ?auto_678518 ) ( ON ?auto_678516 ?auto_678517 ) ( CLEAR ?auto_678514 ) ( ON ?auto_678515 ?auto_678516 ) ( CLEAR ?auto_678515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_678512 ?auto_678513 ?auto_678514 ?auto_678515 )
      ( MAKE-16PILE ?auto_678512 ?auto_678513 ?auto_678514 ?auto_678515 ?auto_678516 ?auto_678517 ?auto_678518 ?auto_678519 ?auto_678520 ?auto_678521 ?auto_678522 ?auto_678523 ?auto_678524 ?auto_678525 ?auto_678526 ?auto_678527 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678578 - BLOCK
      ?auto_678579 - BLOCK
      ?auto_678580 - BLOCK
      ?auto_678581 - BLOCK
      ?auto_678582 - BLOCK
      ?auto_678583 - BLOCK
      ?auto_678584 - BLOCK
      ?auto_678585 - BLOCK
      ?auto_678586 - BLOCK
      ?auto_678587 - BLOCK
      ?auto_678588 - BLOCK
      ?auto_678589 - BLOCK
      ?auto_678590 - BLOCK
      ?auto_678591 - BLOCK
      ?auto_678592 - BLOCK
      ?auto_678593 - BLOCK
    )
    :vars
    (
      ?auto_678594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678593 ?auto_678594 ) ( ON-TABLE ?auto_678578 ) ( ON ?auto_678579 ?auto_678578 ) ( not ( = ?auto_678578 ?auto_678579 ) ) ( not ( = ?auto_678578 ?auto_678580 ) ) ( not ( = ?auto_678578 ?auto_678581 ) ) ( not ( = ?auto_678578 ?auto_678582 ) ) ( not ( = ?auto_678578 ?auto_678583 ) ) ( not ( = ?auto_678578 ?auto_678584 ) ) ( not ( = ?auto_678578 ?auto_678585 ) ) ( not ( = ?auto_678578 ?auto_678586 ) ) ( not ( = ?auto_678578 ?auto_678587 ) ) ( not ( = ?auto_678578 ?auto_678588 ) ) ( not ( = ?auto_678578 ?auto_678589 ) ) ( not ( = ?auto_678578 ?auto_678590 ) ) ( not ( = ?auto_678578 ?auto_678591 ) ) ( not ( = ?auto_678578 ?auto_678592 ) ) ( not ( = ?auto_678578 ?auto_678593 ) ) ( not ( = ?auto_678578 ?auto_678594 ) ) ( not ( = ?auto_678579 ?auto_678580 ) ) ( not ( = ?auto_678579 ?auto_678581 ) ) ( not ( = ?auto_678579 ?auto_678582 ) ) ( not ( = ?auto_678579 ?auto_678583 ) ) ( not ( = ?auto_678579 ?auto_678584 ) ) ( not ( = ?auto_678579 ?auto_678585 ) ) ( not ( = ?auto_678579 ?auto_678586 ) ) ( not ( = ?auto_678579 ?auto_678587 ) ) ( not ( = ?auto_678579 ?auto_678588 ) ) ( not ( = ?auto_678579 ?auto_678589 ) ) ( not ( = ?auto_678579 ?auto_678590 ) ) ( not ( = ?auto_678579 ?auto_678591 ) ) ( not ( = ?auto_678579 ?auto_678592 ) ) ( not ( = ?auto_678579 ?auto_678593 ) ) ( not ( = ?auto_678579 ?auto_678594 ) ) ( not ( = ?auto_678580 ?auto_678581 ) ) ( not ( = ?auto_678580 ?auto_678582 ) ) ( not ( = ?auto_678580 ?auto_678583 ) ) ( not ( = ?auto_678580 ?auto_678584 ) ) ( not ( = ?auto_678580 ?auto_678585 ) ) ( not ( = ?auto_678580 ?auto_678586 ) ) ( not ( = ?auto_678580 ?auto_678587 ) ) ( not ( = ?auto_678580 ?auto_678588 ) ) ( not ( = ?auto_678580 ?auto_678589 ) ) ( not ( = ?auto_678580 ?auto_678590 ) ) ( not ( = ?auto_678580 ?auto_678591 ) ) ( not ( = ?auto_678580 ?auto_678592 ) ) ( not ( = ?auto_678580 ?auto_678593 ) ) ( not ( = ?auto_678580 ?auto_678594 ) ) ( not ( = ?auto_678581 ?auto_678582 ) ) ( not ( = ?auto_678581 ?auto_678583 ) ) ( not ( = ?auto_678581 ?auto_678584 ) ) ( not ( = ?auto_678581 ?auto_678585 ) ) ( not ( = ?auto_678581 ?auto_678586 ) ) ( not ( = ?auto_678581 ?auto_678587 ) ) ( not ( = ?auto_678581 ?auto_678588 ) ) ( not ( = ?auto_678581 ?auto_678589 ) ) ( not ( = ?auto_678581 ?auto_678590 ) ) ( not ( = ?auto_678581 ?auto_678591 ) ) ( not ( = ?auto_678581 ?auto_678592 ) ) ( not ( = ?auto_678581 ?auto_678593 ) ) ( not ( = ?auto_678581 ?auto_678594 ) ) ( not ( = ?auto_678582 ?auto_678583 ) ) ( not ( = ?auto_678582 ?auto_678584 ) ) ( not ( = ?auto_678582 ?auto_678585 ) ) ( not ( = ?auto_678582 ?auto_678586 ) ) ( not ( = ?auto_678582 ?auto_678587 ) ) ( not ( = ?auto_678582 ?auto_678588 ) ) ( not ( = ?auto_678582 ?auto_678589 ) ) ( not ( = ?auto_678582 ?auto_678590 ) ) ( not ( = ?auto_678582 ?auto_678591 ) ) ( not ( = ?auto_678582 ?auto_678592 ) ) ( not ( = ?auto_678582 ?auto_678593 ) ) ( not ( = ?auto_678582 ?auto_678594 ) ) ( not ( = ?auto_678583 ?auto_678584 ) ) ( not ( = ?auto_678583 ?auto_678585 ) ) ( not ( = ?auto_678583 ?auto_678586 ) ) ( not ( = ?auto_678583 ?auto_678587 ) ) ( not ( = ?auto_678583 ?auto_678588 ) ) ( not ( = ?auto_678583 ?auto_678589 ) ) ( not ( = ?auto_678583 ?auto_678590 ) ) ( not ( = ?auto_678583 ?auto_678591 ) ) ( not ( = ?auto_678583 ?auto_678592 ) ) ( not ( = ?auto_678583 ?auto_678593 ) ) ( not ( = ?auto_678583 ?auto_678594 ) ) ( not ( = ?auto_678584 ?auto_678585 ) ) ( not ( = ?auto_678584 ?auto_678586 ) ) ( not ( = ?auto_678584 ?auto_678587 ) ) ( not ( = ?auto_678584 ?auto_678588 ) ) ( not ( = ?auto_678584 ?auto_678589 ) ) ( not ( = ?auto_678584 ?auto_678590 ) ) ( not ( = ?auto_678584 ?auto_678591 ) ) ( not ( = ?auto_678584 ?auto_678592 ) ) ( not ( = ?auto_678584 ?auto_678593 ) ) ( not ( = ?auto_678584 ?auto_678594 ) ) ( not ( = ?auto_678585 ?auto_678586 ) ) ( not ( = ?auto_678585 ?auto_678587 ) ) ( not ( = ?auto_678585 ?auto_678588 ) ) ( not ( = ?auto_678585 ?auto_678589 ) ) ( not ( = ?auto_678585 ?auto_678590 ) ) ( not ( = ?auto_678585 ?auto_678591 ) ) ( not ( = ?auto_678585 ?auto_678592 ) ) ( not ( = ?auto_678585 ?auto_678593 ) ) ( not ( = ?auto_678585 ?auto_678594 ) ) ( not ( = ?auto_678586 ?auto_678587 ) ) ( not ( = ?auto_678586 ?auto_678588 ) ) ( not ( = ?auto_678586 ?auto_678589 ) ) ( not ( = ?auto_678586 ?auto_678590 ) ) ( not ( = ?auto_678586 ?auto_678591 ) ) ( not ( = ?auto_678586 ?auto_678592 ) ) ( not ( = ?auto_678586 ?auto_678593 ) ) ( not ( = ?auto_678586 ?auto_678594 ) ) ( not ( = ?auto_678587 ?auto_678588 ) ) ( not ( = ?auto_678587 ?auto_678589 ) ) ( not ( = ?auto_678587 ?auto_678590 ) ) ( not ( = ?auto_678587 ?auto_678591 ) ) ( not ( = ?auto_678587 ?auto_678592 ) ) ( not ( = ?auto_678587 ?auto_678593 ) ) ( not ( = ?auto_678587 ?auto_678594 ) ) ( not ( = ?auto_678588 ?auto_678589 ) ) ( not ( = ?auto_678588 ?auto_678590 ) ) ( not ( = ?auto_678588 ?auto_678591 ) ) ( not ( = ?auto_678588 ?auto_678592 ) ) ( not ( = ?auto_678588 ?auto_678593 ) ) ( not ( = ?auto_678588 ?auto_678594 ) ) ( not ( = ?auto_678589 ?auto_678590 ) ) ( not ( = ?auto_678589 ?auto_678591 ) ) ( not ( = ?auto_678589 ?auto_678592 ) ) ( not ( = ?auto_678589 ?auto_678593 ) ) ( not ( = ?auto_678589 ?auto_678594 ) ) ( not ( = ?auto_678590 ?auto_678591 ) ) ( not ( = ?auto_678590 ?auto_678592 ) ) ( not ( = ?auto_678590 ?auto_678593 ) ) ( not ( = ?auto_678590 ?auto_678594 ) ) ( not ( = ?auto_678591 ?auto_678592 ) ) ( not ( = ?auto_678591 ?auto_678593 ) ) ( not ( = ?auto_678591 ?auto_678594 ) ) ( not ( = ?auto_678592 ?auto_678593 ) ) ( not ( = ?auto_678592 ?auto_678594 ) ) ( not ( = ?auto_678593 ?auto_678594 ) ) ( ON ?auto_678592 ?auto_678593 ) ( ON ?auto_678591 ?auto_678592 ) ( ON ?auto_678590 ?auto_678591 ) ( ON ?auto_678589 ?auto_678590 ) ( ON ?auto_678588 ?auto_678589 ) ( ON ?auto_678587 ?auto_678588 ) ( ON ?auto_678586 ?auto_678587 ) ( ON ?auto_678585 ?auto_678586 ) ( ON ?auto_678584 ?auto_678585 ) ( ON ?auto_678583 ?auto_678584 ) ( ON ?auto_678582 ?auto_678583 ) ( ON ?auto_678581 ?auto_678582 ) ( CLEAR ?auto_678579 ) ( ON ?auto_678580 ?auto_678581 ) ( CLEAR ?auto_678580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_678578 ?auto_678579 ?auto_678580 )
      ( MAKE-16PILE ?auto_678578 ?auto_678579 ?auto_678580 ?auto_678581 ?auto_678582 ?auto_678583 ?auto_678584 ?auto_678585 ?auto_678586 ?auto_678587 ?auto_678588 ?auto_678589 ?auto_678590 ?auto_678591 ?auto_678592 ?auto_678593 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678644 - BLOCK
      ?auto_678645 - BLOCK
      ?auto_678646 - BLOCK
      ?auto_678647 - BLOCK
      ?auto_678648 - BLOCK
      ?auto_678649 - BLOCK
      ?auto_678650 - BLOCK
      ?auto_678651 - BLOCK
      ?auto_678652 - BLOCK
      ?auto_678653 - BLOCK
      ?auto_678654 - BLOCK
      ?auto_678655 - BLOCK
      ?auto_678656 - BLOCK
      ?auto_678657 - BLOCK
      ?auto_678658 - BLOCK
      ?auto_678659 - BLOCK
    )
    :vars
    (
      ?auto_678660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678659 ?auto_678660 ) ( ON-TABLE ?auto_678644 ) ( not ( = ?auto_678644 ?auto_678645 ) ) ( not ( = ?auto_678644 ?auto_678646 ) ) ( not ( = ?auto_678644 ?auto_678647 ) ) ( not ( = ?auto_678644 ?auto_678648 ) ) ( not ( = ?auto_678644 ?auto_678649 ) ) ( not ( = ?auto_678644 ?auto_678650 ) ) ( not ( = ?auto_678644 ?auto_678651 ) ) ( not ( = ?auto_678644 ?auto_678652 ) ) ( not ( = ?auto_678644 ?auto_678653 ) ) ( not ( = ?auto_678644 ?auto_678654 ) ) ( not ( = ?auto_678644 ?auto_678655 ) ) ( not ( = ?auto_678644 ?auto_678656 ) ) ( not ( = ?auto_678644 ?auto_678657 ) ) ( not ( = ?auto_678644 ?auto_678658 ) ) ( not ( = ?auto_678644 ?auto_678659 ) ) ( not ( = ?auto_678644 ?auto_678660 ) ) ( not ( = ?auto_678645 ?auto_678646 ) ) ( not ( = ?auto_678645 ?auto_678647 ) ) ( not ( = ?auto_678645 ?auto_678648 ) ) ( not ( = ?auto_678645 ?auto_678649 ) ) ( not ( = ?auto_678645 ?auto_678650 ) ) ( not ( = ?auto_678645 ?auto_678651 ) ) ( not ( = ?auto_678645 ?auto_678652 ) ) ( not ( = ?auto_678645 ?auto_678653 ) ) ( not ( = ?auto_678645 ?auto_678654 ) ) ( not ( = ?auto_678645 ?auto_678655 ) ) ( not ( = ?auto_678645 ?auto_678656 ) ) ( not ( = ?auto_678645 ?auto_678657 ) ) ( not ( = ?auto_678645 ?auto_678658 ) ) ( not ( = ?auto_678645 ?auto_678659 ) ) ( not ( = ?auto_678645 ?auto_678660 ) ) ( not ( = ?auto_678646 ?auto_678647 ) ) ( not ( = ?auto_678646 ?auto_678648 ) ) ( not ( = ?auto_678646 ?auto_678649 ) ) ( not ( = ?auto_678646 ?auto_678650 ) ) ( not ( = ?auto_678646 ?auto_678651 ) ) ( not ( = ?auto_678646 ?auto_678652 ) ) ( not ( = ?auto_678646 ?auto_678653 ) ) ( not ( = ?auto_678646 ?auto_678654 ) ) ( not ( = ?auto_678646 ?auto_678655 ) ) ( not ( = ?auto_678646 ?auto_678656 ) ) ( not ( = ?auto_678646 ?auto_678657 ) ) ( not ( = ?auto_678646 ?auto_678658 ) ) ( not ( = ?auto_678646 ?auto_678659 ) ) ( not ( = ?auto_678646 ?auto_678660 ) ) ( not ( = ?auto_678647 ?auto_678648 ) ) ( not ( = ?auto_678647 ?auto_678649 ) ) ( not ( = ?auto_678647 ?auto_678650 ) ) ( not ( = ?auto_678647 ?auto_678651 ) ) ( not ( = ?auto_678647 ?auto_678652 ) ) ( not ( = ?auto_678647 ?auto_678653 ) ) ( not ( = ?auto_678647 ?auto_678654 ) ) ( not ( = ?auto_678647 ?auto_678655 ) ) ( not ( = ?auto_678647 ?auto_678656 ) ) ( not ( = ?auto_678647 ?auto_678657 ) ) ( not ( = ?auto_678647 ?auto_678658 ) ) ( not ( = ?auto_678647 ?auto_678659 ) ) ( not ( = ?auto_678647 ?auto_678660 ) ) ( not ( = ?auto_678648 ?auto_678649 ) ) ( not ( = ?auto_678648 ?auto_678650 ) ) ( not ( = ?auto_678648 ?auto_678651 ) ) ( not ( = ?auto_678648 ?auto_678652 ) ) ( not ( = ?auto_678648 ?auto_678653 ) ) ( not ( = ?auto_678648 ?auto_678654 ) ) ( not ( = ?auto_678648 ?auto_678655 ) ) ( not ( = ?auto_678648 ?auto_678656 ) ) ( not ( = ?auto_678648 ?auto_678657 ) ) ( not ( = ?auto_678648 ?auto_678658 ) ) ( not ( = ?auto_678648 ?auto_678659 ) ) ( not ( = ?auto_678648 ?auto_678660 ) ) ( not ( = ?auto_678649 ?auto_678650 ) ) ( not ( = ?auto_678649 ?auto_678651 ) ) ( not ( = ?auto_678649 ?auto_678652 ) ) ( not ( = ?auto_678649 ?auto_678653 ) ) ( not ( = ?auto_678649 ?auto_678654 ) ) ( not ( = ?auto_678649 ?auto_678655 ) ) ( not ( = ?auto_678649 ?auto_678656 ) ) ( not ( = ?auto_678649 ?auto_678657 ) ) ( not ( = ?auto_678649 ?auto_678658 ) ) ( not ( = ?auto_678649 ?auto_678659 ) ) ( not ( = ?auto_678649 ?auto_678660 ) ) ( not ( = ?auto_678650 ?auto_678651 ) ) ( not ( = ?auto_678650 ?auto_678652 ) ) ( not ( = ?auto_678650 ?auto_678653 ) ) ( not ( = ?auto_678650 ?auto_678654 ) ) ( not ( = ?auto_678650 ?auto_678655 ) ) ( not ( = ?auto_678650 ?auto_678656 ) ) ( not ( = ?auto_678650 ?auto_678657 ) ) ( not ( = ?auto_678650 ?auto_678658 ) ) ( not ( = ?auto_678650 ?auto_678659 ) ) ( not ( = ?auto_678650 ?auto_678660 ) ) ( not ( = ?auto_678651 ?auto_678652 ) ) ( not ( = ?auto_678651 ?auto_678653 ) ) ( not ( = ?auto_678651 ?auto_678654 ) ) ( not ( = ?auto_678651 ?auto_678655 ) ) ( not ( = ?auto_678651 ?auto_678656 ) ) ( not ( = ?auto_678651 ?auto_678657 ) ) ( not ( = ?auto_678651 ?auto_678658 ) ) ( not ( = ?auto_678651 ?auto_678659 ) ) ( not ( = ?auto_678651 ?auto_678660 ) ) ( not ( = ?auto_678652 ?auto_678653 ) ) ( not ( = ?auto_678652 ?auto_678654 ) ) ( not ( = ?auto_678652 ?auto_678655 ) ) ( not ( = ?auto_678652 ?auto_678656 ) ) ( not ( = ?auto_678652 ?auto_678657 ) ) ( not ( = ?auto_678652 ?auto_678658 ) ) ( not ( = ?auto_678652 ?auto_678659 ) ) ( not ( = ?auto_678652 ?auto_678660 ) ) ( not ( = ?auto_678653 ?auto_678654 ) ) ( not ( = ?auto_678653 ?auto_678655 ) ) ( not ( = ?auto_678653 ?auto_678656 ) ) ( not ( = ?auto_678653 ?auto_678657 ) ) ( not ( = ?auto_678653 ?auto_678658 ) ) ( not ( = ?auto_678653 ?auto_678659 ) ) ( not ( = ?auto_678653 ?auto_678660 ) ) ( not ( = ?auto_678654 ?auto_678655 ) ) ( not ( = ?auto_678654 ?auto_678656 ) ) ( not ( = ?auto_678654 ?auto_678657 ) ) ( not ( = ?auto_678654 ?auto_678658 ) ) ( not ( = ?auto_678654 ?auto_678659 ) ) ( not ( = ?auto_678654 ?auto_678660 ) ) ( not ( = ?auto_678655 ?auto_678656 ) ) ( not ( = ?auto_678655 ?auto_678657 ) ) ( not ( = ?auto_678655 ?auto_678658 ) ) ( not ( = ?auto_678655 ?auto_678659 ) ) ( not ( = ?auto_678655 ?auto_678660 ) ) ( not ( = ?auto_678656 ?auto_678657 ) ) ( not ( = ?auto_678656 ?auto_678658 ) ) ( not ( = ?auto_678656 ?auto_678659 ) ) ( not ( = ?auto_678656 ?auto_678660 ) ) ( not ( = ?auto_678657 ?auto_678658 ) ) ( not ( = ?auto_678657 ?auto_678659 ) ) ( not ( = ?auto_678657 ?auto_678660 ) ) ( not ( = ?auto_678658 ?auto_678659 ) ) ( not ( = ?auto_678658 ?auto_678660 ) ) ( not ( = ?auto_678659 ?auto_678660 ) ) ( ON ?auto_678658 ?auto_678659 ) ( ON ?auto_678657 ?auto_678658 ) ( ON ?auto_678656 ?auto_678657 ) ( ON ?auto_678655 ?auto_678656 ) ( ON ?auto_678654 ?auto_678655 ) ( ON ?auto_678653 ?auto_678654 ) ( ON ?auto_678652 ?auto_678653 ) ( ON ?auto_678651 ?auto_678652 ) ( ON ?auto_678650 ?auto_678651 ) ( ON ?auto_678649 ?auto_678650 ) ( ON ?auto_678648 ?auto_678649 ) ( ON ?auto_678647 ?auto_678648 ) ( ON ?auto_678646 ?auto_678647 ) ( CLEAR ?auto_678644 ) ( ON ?auto_678645 ?auto_678646 ) ( CLEAR ?auto_678645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_678644 ?auto_678645 )
      ( MAKE-16PILE ?auto_678644 ?auto_678645 ?auto_678646 ?auto_678647 ?auto_678648 ?auto_678649 ?auto_678650 ?auto_678651 ?auto_678652 ?auto_678653 ?auto_678654 ?auto_678655 ?auto_678656 ?auto_678657 ?auto_678658 ?auto_678659 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_678710 - BLOCK
      ?auto_678711 - BLOCK
      ?auto_678712 - BLOCK
      ?auto_678713 - BLOCK
      ?auto_678714 - BLOCK
      ?auto_678715 - BLOCK
      ?auto_678716 - BLOCK
      ?auto_678717 - BLOCK
      ?auto_678718 - BLOCK
      ?auto_678719 - BLOCK
      ?auto_678720 - BLOCK
      ?auto_678721 - BLOCK
      ?auto_678722 - BLOCK
      ?auto_678723 - BLOCK
      ?auto_678724 - BLOCK
      ?auto_678725 - BLOCK
    )
    :vars
    (
      ?auto_678726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678725 ?auto_678726 ) ( not ( = ?auto_678710 ?auto_678711 ) ) ( not ( = ?auto_678710 ?auto_678712 ) ) ( not ( = ?auto_678710 ?auto_678713 ) ) ( not ( = ?auto_678710 ?auto_678714 ) ) ( not ( = ?auto_678710 ?auto_678715 ) ) ( not ( = ?auto_678710 ?auto_678716 ) ) ( not ( = ?auto_678710 ?auto_678717 ) ) ( not ( = ?auto_678710 ?auto_678718 ) ) ( not ( = ?auto_678710 ?auto_678719 ) ) ( not ( = ?auto_678710 ?auto_678720 ) ) ( not ( = ?auto_678710 ?auto_678721 ) ) ( not ( = ?auto_678710 ?auto_678722 ) ) ( not ( = ?auto_678710 ?auto_678723 ) ) ( not ( = ?auto_678710 ?auto_678724 ) ) ( not ( = ?auto_678710 ?auto_678725 ) ) ( not ( = ?auto_678710 ?auto_678726 ) ) ( not ( = ?auto_678711 ?auto_678712 ) ) ( not ( = ?auto_678711 ?auto_678713 ) ) ( not ( = ?auto_678711 ?auto_678714 ) ) ( not ( = ?auto_678711 ?auto_678715 ) ) ( not ( = ?auto_678711 ?auto_678716 ) ) ( not ( = ?auto_678711 ?auto_678717 ) ) ( not ( = ?auto_678711 ?auto_678718 ) ) ( not ( = ?auto_678711 ?auto_678719 ) ) ( not ( = ?auto_678711 ?auto_678720 ) ) ( not ( = ?auto_678711 ?auto_678721 ) ) ( not ( = ?auto_678711 ?auto_678722 ) ) ( not ( = ?auto_678711 ?auto_678723 ) ) ( not ( = ?auto_678711 ?auto_678724 ) ) ( not ( = ?auto_678711 ?auto_678725 ) ) ( not ( = ?auto_678711 ?auto_678726 ) ) ( not ( = ?auto_678712 ?auto_678713 ) ) ( not ( = ?auto_678712 ?auto_678714 ) ) ( not ( = ?auto_678712 ?auto_678715 ) ) ( not ( = ?auto_678712 ?auto_678716 ) ) ( not ( = ?auto_678712 ?auto_678717 ) ) ( not ( = ?auto_678712 ?auto_678718 ) ) ( not ( = ?auto_678712 ?auto_678719 ) ) ( not ( = ?auto_678712 ?auto_678720 ) ) ( not ( = ?auto_678712 ?auto_678721 ) ) ( not ( = ?auto_678712 ?auto_678722 ) ) ( not ( = ?auto_678712 ?auto_678723 ) ) ( not ( = ?auto_678712 ?auto_678724 ) ) ( not ( = ?auto_678712 ?auto_678725 ) ) ( not ( = ?auto_678712 ?auto_678726 ) ) ( not ( = ?auto_678713 ?auto_678714 ) ) ( not ( = ?auto_678713 ?auto_678715 ) ) ( not ( = ?auto_678713 ?auto_678716 ) ) ( not ( = ?auto_678713 ?auto_678717 ) ) ( not ( = ?auto_678713 ?auto_678718 ) ) ( not ( = ?auto_678713 ?auto_678719 ) ) ( not ( = ?auto_678713 ?auto_678720 ) ) ( not ( = ?auto_678713 ?auto_678721 ) ) ( not ( = ?auto_678713 ?auto_678722 ) ) ( not ( = ?auto_678713 ?auto_678723 ) ) ( not ( = ?auto_678713 ?auto_678724 ) ) ( not ( = ?auto_678713 ?auto_678725 ) ) ( not ( = ?auto_678713 ?auto_678726 ) ) ( not ( = ?auto_678714 ?auto_678715 ) ) ( not ( = ?auto_678714 ?auto_678716 ) ) ( not ( = ?auto_678714 ?auto_678717 ) ) ( not ( = ?auto_678714 ?auto_678718 ) ) ( not ( = ?auto_678714 ?auto_678719 ) ) ( not ( = ?auto_678714 ?auto_678720 ) ) ( not ( = ?auto_678714 ?auto_678721 ) ) ( not ( = ?auto_678714 ?auto_678722 ) ) ( not ( = ?auto_678714 ?auto_678723 ) ) ( not ( = ?auto_678714 ?auto_678724 ) ) ( not ( = ?auto_678714 ?auto_678725 ) ) ( not ( = ?auto_678714 ?auto_678726 ) ) ( not ( = ?auto_678715 ?auto_678716 ) ) ( not ( = ?auto_678715 ?auto_678717 ) ) ( not ( = ?auto_678715 ?auto_678718 ) ) ( not ( = ?auto_678715 ?auto_678719 ) ) ( not ( = ?auto_678715 ?auto_678720 ) ) ( not ( = ?auto_678715 ?auto_678721 ) ) ( not ( = ?auto_678715 ?auto_678722 ) ) ( not ( = ?auto_678715 ?auto_678723 ) ) ( not ( = ?auto_678715 ?auto_678724 ) ) ( not ( = ?auto_678715 ?auto_678725 ) ) ( not ( = ?auto_678715 ?auto_678726 ) ) ( not ( = ?auto_678716 ?auto_678717 ) ) ( not ( = ?auto_678716 ?auto_678718 ) ) ( not ( = ?auto_678716 ?auto_678719 ) ) ( not ( = ?auto_678716 ?auto_678720 ) ) ( not ( = ?auto_678716 ?auto_678721 ) ) ( not ( = ?auto_678716 ?auto_678722 ) ) ( not ( = ?auto_678716 ?auto_678723 ) ) ( not ( = ?auto_678716 ?auto_678724 ) ) ( not ( = ?auto_678716 ?auto_678725 ) ) ( not ( = ?auto_678716 ?auto_678726 ) ) ( not ( = ?auto_678717 ?auto_678718 ) ) ( not ( = ?auto_678717 ?auto_678719 ) ) ( not ( = ?auto_678717 ?auto_678720 ) ) ( not ( = ?auto_678717 ?auto_678721 ) ) ( not ( = ?auto_678717 ?auto_678722 ) ) ( not ( = ?auto_678717 ?auto_678723 ) ) ( not ( = ?auto_678717 ?auto_678724 ) ) ( not ( = ?auto_678717 ?auto_678725 ) ) ( not ( = ?auto_678717 ?auto_678726 ) ) ( not ( = ?auto_678718 ?auto_678719 ) ) ( not ( = ?auto_678718 ?auto_678720 ) ) ( not ( = ?auto_678718 ?auto_678721 ) ) ( not ( = ?auto_678718 ?auto_678722 ) ) ( not ( = ?auto_678718 ?auto_678723 ) ) ( not ( = ?auto_678718 ?auto_678724 ) ) ( not ( = ?auto_678718 ?auto_678725 ) ) ( not ( = ?auto_678718 ?auto_678726 ) ) ( not ( = ?auto_678719 ?auto_678720 ) ) ( not ( = ?auto_678719 ?auto_678721 ) ) ( not ( = ?auto_678719 ?auto_678722 ) ) ( not ( = ?auto_678719 ?auto_678723 ) ) ( not ( = ?auto_678719 ?auto_678724 ) ) ( not ( = ?auto_678719 ?auto_678725 ) ) ( not ( = ?auto_678719 ?auto_678726 ) ) ( not ( = ?auto_678720 ?auto_678721 ) ) ( not ( = ?auto_678720 ?auto_678722 ) ) ( not ( = ?auto_678720 ?auto_678723 ) ) ( not ( = ?auto_678720 ?auto_678724 ) ) ( not ( = ?auto_678720 ?auto_678725 ) ) ( not ( = ?auto_678720 ?auto_678726 ) ) ( not ( = ?auto_678721 ?auto_678722 ) ) ( not ( = ?auto_678721 ?auto_678723 ) ) ( not ( = ?auto_678721 ?auto_678724 ) ) ( not ( = ?auto_678721 ?auto_678725 ) ) ( not ( = ?auto_678721 ?auto_678726 ) ) ( not ( = ?auto_678722 ?auto_678723 ) ) ( not ( = ?auto_678722 ?auto_678724 ) ) ( not ( = ?auto_678722 ?auto_678725 ) ) ( not ( = ?auto_678722 ?auto_678726 ) ) ( not ( = ?auto_678723 ?auto_678724 ) ) ( not ( = ?auto_678723 ?auto_678725 ) ) ( not ( = ?auto_678723 ?auto_678726 ) ) ( not ( = ?auto_678724 ?auto_678725 ) ) ( not ( = ?auto_678724 ?auto_678726 ) ) ( not ( = ?auto_678725 ?auto_678726 ) ) ( ON ?auto_678724 ?auto_678725 ) ( ON ?auto_678723 ?auto_678724 ) ( ON ?auto_678722 ?auto_678723 ) ( ON ?auto_678721 ?auto_678722 ) ( ON ?auto_678720 ?auto_678721 ) ( ON ?auto_678719 ?auto_678720 ) ( ON ?auto_678718 ?auto_678719 ) ( ON ?auto_678717 ?auto_678718 ) ( ON ?auto_678716 ?auto_678717 ) ( ON ?auto_678715 ?auto_678716 ) ( ON ?auto_678714 ?auto_678715 ) ( ON ?auto_678713 ?auto_678714 ) ( ON ?auto_678712 ?auto_678713 ) ( ON ?auto_678711 ?auto_678712 ) ( ON ?auto_678710 ?auto_678711 ) ( CLEAR ?auto_678710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_678710 )
      ( MAKE-16PILE ?auto_678710 ?auto_678711 ?auto_678712 ?auto_678713 ?auto_678714 ?auto_678715 ?auto_678716 ?auto_678717 ?auto_678718 ?auto_678719 ?auto_678720 ?auto_678721 ?auto_678722 ?auto_678723 ?auto_678724 ?auto_678725 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_678777 - BLOCK
      ?auto_678778 - BLOCK
      ?auto_678779 - BLOCK
      ?auto_678780 - BLOCK
      ?auto_678781 - BLOCK
      ?auto_678782 - BLOCK
      ?auto_678783 - BLOCK
      ?auto_678784 - BLOCK
      ?auto_678785 - BLOCK
      ?auto_678786 - BLOCK
      ?auto_678787 - BLOCK
      ?auto_678788 - BLOCK
      ?auto_678789 - BLOCK
      ?auto_678790 - BLOCK
      ?auto_678791 - BLOCK
      ?auto_678792 - BLOCK
      ?auto_678793 - BLOCK
    )
    :vars
    (
      ?auto_678794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_678792 ) ( ON ?auto_678793 ?auto_678794 ) ( CLEAR ?auto_678793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_678777 ) ( ON ?auto_678778 ?auto_678777 ) ( ON ?auto_678779 ?auto_678778 ) ( ON ?auto_678780 ?auto_678779 ) ( ON ?auto_678781 ?auto_678780 ) ( ON ?auto_678782 ?auto_678781 ) ( ON ?auto_678783 ?auto_678782 ) ( ON ?auto_678784 ?auto_678783 ) ( ON ?auto_678785 ?auto_678784 ) ( ON ?auto_678786 ?auto_678785 ) ( ON ?auto_678787 ?auto_678786 ) ( ON ?auto_678788 ?auto_678787 ) ( ON ?auto_678789 ?auto_678788 ) ( ON ?auto_678790 ?auto_678789 ) ( ON ?auto_678791 ?auto_678790 ) ( ON ?auto_678792 ?auto_678791 ) ( not ( = ?auto_678777 ?auto_678778 ) ) ( not ( = ?auto_678777 ?auto_678779 ) ) ( not ( = ?auto_678777 ?auto_678780 ) ) ( not ( = ?auto_678777 ?auto_678781 ) ) ( not ( = ?auto_678777 ?auto_678782 ) ) ( not ( = ?auto_678777 ?auto_678783 ) ) ( not ( = ?auto_678777 ?auto_678784 ) ) ( not ( = ?auto_678777 ?auto_678785 ) ) ( not ( = ?auto_678777 ?auto_678786 ) ) ( not ( = ?auto_678777 ?auto_678787 ) ) ( not ( = ?auto_678777 ?auto_678788 ) ) ( not ( = ?auto_678777 ?auto_678789 ) ) ( not ( = ?auto_678777 ?auto_678790 ) ) ( not ( = ?auto_678777 ?auto_678791 ) ) ( not ( = ?auto_678777 ?auto_678792 ) ) ( not ( = ?auto_678777 ?auto_678793 ) ) ( not ( = ?auto_678777 ?auto_678794 ) ) ( not ( = ?auto_678778 ?auto_678779 ) ) ( not ( = ?auto_678778 ?auto_678780 ) ) ( not ( = ?auto_678778 ?auto_678781 ) ) ( not ( = ?auto_678778 ?auto_678782 ) ) ( not ( = ?auto_678778 ?auto_678783 ) ) ( not ( = ?auto_678778 ?auto_678784 ) ) ( not ( = ?auto_678778 ?auto_678785 ) ) ( not ( = ?auto_678778 ?auto_678786 ) ) ( not ( = ?auto_678778 ?auto_678787 ) ) ( not ( = ?auto_678778 ?auto_678788 ) ) ( not ( = ?auto_678778 ?auto_678789 ) ) ( not ( = ?auto_678778 ?auto_678790 ) ) ( not ( = ?auto_678778 ?auto_678791 ) ) ( not ( = ?auto_678778 ?auto_678792 ) ) ( not ( = ?auto_678778 ?auto_678793 ) ) ( not ( = ?auto_678778 ?auto_678794 ) ) ( not ( = ?auto_678779 ?auto_678780 ) ) ( not ( = ?auto_678779 ?auto_678781 ) ) ( not ( = ?auto_678779 ?auto_678782 ) ) ( not ( = ?auto_678779 ?auto_678783 ) ) ( not ( = ?auto_678779 ?auto_678784 ) ) ( not ( = ?auto_678779 ?auto_678785 ) ) ( not ( = ?auto_678779 ?auto_678786 ) ) ( not ( = ?auto_678779 ?auto_678787 ) ) ( not ( = ?auto_678779 ?auto_678788 ) ) ( not ( = ?auto_678779 ?auto_678789 ) ) ( not ( = ?auto_678779 ?auto_678790 ) ) ( not ( = ?auto_678779 ?auto_678791 ) ) ( not ( = ?auto_678779 ?auto_678792 ) ) ( not ( = ?auto_678779 ?auto_678793 ) ) ( not ( = ?auto_678779 ?auto_678794 ) ) ( not ( = ?auto_678780 ?auto_678781 ) ) ( not ( = ?auto_678780 ?auto_678782 ) ) ( not ( = ?auto_678780 ?auto_678783 ) ) ( not ( = ?auto_678780 ?auto_678784 ) ) ( not ( = ?auto_678780 ?auto_678785 ) ) ( not ( = ?auto_678780 ?auto_678786 ) ) ( not ( = ?auto_678780 ?auto_678787 ) ) ( not ( = ?auto_678780 ?auto_678788 ) ) ( not ( = ?auto_678780 ?auto_678789 ) ) ( not ( = ?auto_678780 ?auto_678790 ) ) ( not ( = ?auto_678780 ?auto_678791 ) ) ( not ( = ?auto_678780 ?auto_678792 ) ) ( not ( = ?auto_678780 ?auto_678793 ) ) ( not ( = ?auto_678780 ?auto_678794 ) ) ( not ( = ?auto_678781 ?auto_678782 ) ) ( not ( = ?auto_678781 ?auto_678783 ) ) ( not ( = ?auto_678781 ?auto_678784 ) ) ( not ( = ?auto_678781 ?auto_678785 ) ) ( not ( = ?auto_678781 ?auto_678786 ) ) ( not ( = ?auto_678781 ?auto_678787 ) ) ( not ( = ?auto_678781 ?auto_678788 ) ) ( not ( = ?auto_678781 ?auto_678789 ) ) ( not ( = ?auto_678781 ?auto_678790 ) ) ( not ( = ?auto_678781 ?auto_678791 ) ) ( not ( = ?auto_678781 ?auto_678792 ) ) ( not ( = ?auto_678781 ?auto_678793 ) ) ( not ( = ?auto_678781 ?auto_678794 ) ) ( not ( = ?auto_678782 ?auto_678783 ) ) ( not ( = ?auto_678782 ?auto_678784 ) ) ( not ( = ?auto_678782 ?auto_678785 ) ) ( not ( = ?auto_678782 ?auto_678786 ) ) ( not ( = ?auto_678782 ?auto_678787 ) ) ( not ( = ?auto_678782 ?auto_678788 ) ) ( not ( = ?auto_678782 ?auto_678789 ) ) ( not ( = ?auto_678782 ?auto_678790 ) ) ( not ( = ?auto_678782 ?auto_678791 ) ) ( not ( = ?auto_678782 ?auto_678792 ) ) ( not ( = ?auto_678782 ?auto_678793 ) ) ( not ( = ?auto_678782 ?auto_678794 ) ) ( not ( = ?auto_678783 ?auto_678784 ) ) ( not ( = ?auto_678783 ?auto_678785 ) ) ( not ( = ?auto_678783 ?auto_678786 ) ) ( not ( = ?auto_678783 ?auto_678787 ) ) ( not ( = ?auto_678783 ?auto_678788 ) ) ( not ( = ?auto_678783 ?auto_678789 ) ) ( not ( = ?auto_678783 ?auto_678790 ) ) ( not ( = ?auto_678783 ?auto_678791 ) ) ( not ( = ?auto_678783 ?auto_678792 ) ) ( not ( = ?auto_678783 ?auto_678793 ) ) ( not ( = ?auto_678783 ?auto_678794 ) ) ( not ( = ?auto_678784 ?auto_678785 ) ) ( not ( = ?auto_678784 ?auto_678786 ) ) ( not ( = ?auto_678784 ?auto_678787 ) ) ( not ( = ?auto_678784 ?auto_678788 ) ) ( not ( = ?auto_678784 ?auto_678789 ) ) ( not ( = ?auto_678784 ?auto_678790 ) ) ( not ( = ?auto_678784 ?auto_678791 ) ) ( not ( = ?auto_678784 ?auto_678792 ) ) ( not ( = ?auto_678784 ?auto_678793 ) ) ( not ( = ?auto_678784 ?auto_678794 ) ) ( not ( = ?auto_678785 ?auto_678786 ) ) ( not ( = ?auto_678785 ?auto_678787 ) ) ( not ( = ?auto_678785 ?auto_678788 ) ) ( not ( = ?auto_678785 ?auto_678789 ) ) ( not ( = ?auto_678785 ?auto_678790 ) ) ( not ( = ?auto_678785 ?auto_678791 ) ) ( not ( = ?auto_678785 ?auto_678792 ) ) ( not ( = ?auto_678785 ?auto_678793 ) ) ( not ( = ?auto_678785 ?auto_678794 ) ) ( not ( = ?auto_678786 ?auto_678787 ) ) ( not ( = ?auto_678786 ?auto_678788 ) ) ( not ( = ?auto_678786 ?auto_678789 ) ) ( not ( = ?auto_678786 ?auto_678790 ) ) ( not ( = ?auto_678786 ?auto_678791 ) ) ( not ( = ?auto_678786 ?auto_678792 ) ) ( not ( = ?auto_678786 ?auto_678793 ) ) ( not ( = ?auto_678786 ?auto_678794 ) ) ( not ( = ?auto_678787 ?auto_678788 ) ) ( not ( = ?auto_678787 ?auto_678789 ) ) ( not ( = ?auto_678787 ?auto_678790 ) ) ( not ( = ?auto_678787 ?auto_678791 ) ) ( not ( = ?auto_678787 ?auto_678792 ) ) ( not ( = ?auto_678787 ?auto_678793 ) ) ( not ( = ?auto_678787 ?auto_678794 ) ) ( not ( = ?auto_678788 ?auto_678789 ) ) ( not ( = ?auto_678788 ?auto_678790 ) ) ( not ( = ?auto_678788 ?auto_678791 ) ) ( not ( = ?auto_678788 ?auto_678792 ) ) ( not ( = ?auto_678788 ?auto_678793 ) ) ( not ( = ?auto_678788 ?auto_678794 ) ) ( not ( = ?auto_678789 ?auto_678790 ) ) ( not ( = ?auto_678789 ?auto_678791 ) ) ( not ( = ?auto_678789 ?auto_678792 ) ) ( not ( = ?auto_678789 ?auto_678793 ) ) ( not ( = ?auto_678789 ?auto_678794 ) ) ( not ( = ?auto_678790 ?auto_678791 ) ) ( not ( = ?auto_678790 ?auto_678792 ) ) ( not ( = ?auto_678790 ?auto_678793 ) ) ( not ( = ?auto_678790 ?auto_678794 ) ) ( not ( = ?auto_678791 ?auto_678792 ) ) ( not ( = ?auto_678791 ?auto_678793 ) ) ( not ( = ?auto_678791 ?auto_678794 ) ) ( not ( = ?auto_678792 ?auto_678793 ) ) ( not ( = ?auto_678792 ?auto_678794 ) ) ( not ( = ?auto_678793 ?auto_678794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_678793 ?auto_678794 )
      ( !STACK ?auto_678793 ?auto_678792 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_678812 - BLOCK
      ?auto_678813 - BLOCK
      ?auto_678814 - BLOCK
      ?auto_678815 - BLOCK
      ?auto_678816 - BLOCK
      ?auto_678817 - BLOCK
      ?auto_678818 - BLOCK
      ?auto_678819 - BLOCK
      ?auto_678820 - BLOCK
      ?auto_678821 - BLOCK
      ?auto_678822 - BLOCK
      ?auto_678823 - BLOCK
      ?auto_678824 - BLOCK
      ?auto_678825 - BLOCK
      ?auto_678826 - BLOCK
      ?auto_678827 - BLOCK
      ?auto_678828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_678827 ) ( ON-TABLE ?auto_678828 ) ( CLEAR ?auto_678828 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_678812 ) ( ON ?auto_678813 ?auto_678812 ) ( ON ?auto_678814 ?auto_678813 ) ( ON ?auto_678815 ?auto_678814 ) ( ON ?auto_678816 ?auto_678815 ) ( ON ?auto_678817 ?auto_678816 ) ( ON ?auto_678818 ?auto_678817 ) ( ON ?auto_678819 ?auto_678818 ) ( ON ?auto_678820 ?auto_678819 ) ( ON ?auto_678821 ?auto_678820 ) ( ON ?auto_678822 ?auto_678821 ) ( ON ?auto_678823 ?auto_678822 ) ( ON ?auto_678824 ?auto_678823 ) ( ON ?auto_678825 ?auto_678824 ) ( ON ?auto_678826 ?auto_678825 ) ( ON ?auto_678827 ?auto_678826 ) ( not ( = ?auto_678812 ?auto_678813 ) ) ( not ( = ?auto_678812 ?auto_678814 ) ) ( not ( = ?auto_678812 ?auto_678815 ) ) ( not ( = ?auto_678812 ?auto_678816 ) ) ( not ( = ?auto_678812 ?auto_678817 ) ) ( not ( = ?auto_678812 ?auto_678818 ) ) ( not ( = ?auto_678812 ?auto_678819 ) ) ( not ( = ?auto_678812 ?auto_678820 ) ) ( not ( = ?auto_678812 ?auto_678821 ) ) ( not ( = ?auto_678812 ?auto_678822 ) ) ( not ( = ?auto_678812 ?auto_678823 ) ) ( not ( = ?auto_678812 ?auto_678824 ) ) ( not ( = ?auto_678812 ?auto_678825 ) ) ( not ( = ?auto_678812 ?auto_678826 ) ) ( not ( = ?auto_678812 ?auto_678827 ) ) ( not ( = ?auto_678812 ?auto_678828 ) ) ( not ( = ?auto_678813 ?auto_678814 ) ) ( not ( = ?auto_678813 ?auto_678815 ) ) ( not ( = ?auto_678813 ?auto_678816 ) ) ( not ( = ?auto_678813 ?auto_678817 ) ) ( not ( = ?auto_678813 ?auto_678818 ) ) ( not ( = ?auto_678813 ?auto_678819 ) ) ( not ( = ?auto_678813 ?auto_678820 ) ) ( not ( = ?auto_678813 ?auto_678821 ) ) ( not ( = ?auto_678813 ?auto_678822 ) ) ( not ( = ?auto_678813 ?auto_678823 ) ) ( not ( = ?auto_678813 ?auto_678824 ) ) ( not ( = ?auto_678813 ?auto_678825 ) ) ( not ( = ?auto_678813 ?auto_678826 ) ) ( not ( = ?auto_678813 ?auto_678827 ) ) ( not ( = ?auto_678813 ?auto_678828 ) ) ( not ( = ?auto_678814 ?auto_678815 ) ) ( not ( = ?auto_678814 ?auto_678816 ) ) ( not ( = ?auto_678814 ?auto_678817 ) ) ( not ( = ?auto_678814 ?auto_678818 ) ) ( not ( = ?auto_678814 ?auto_678819 ) ) ( not ( = ?auto_678814 ?auto_678820 ) ) ( not ( = ?auto_678814 ?auto_678821 ) ) ( not ( = ?auto_678814 ?auto_678822 ) ) ( not ( = ?auto_678814 ?auto_678823 ) ) ( not ( = ?auto_678814 ?auto_678824 ) ) ( not ( = ?auto_678814 ?auto_678825 ) ) ( not ( = ?auto_678814 ?auto_678826 ) ) ( not ( = ?auto_678814 ?auto_678827 ) ) ( not ( = ?auto_678814 ?auto_678828 ) ) ( not ( = ?auto_678815 ?auto_678816 ) ) ( not ( = ?auto_678815 ?auto_678817 ) ) ( not ( = ?auto_678815 ?auto_678818 ) ) ( not ( = ?auto_678815 ?auto_678819 ) ) ( not ( = ?auto_678815 ?auto_678820 ) ) ( not ( = ?auto_678815 ?auto_678821 ) ) ( not ( = ?auto_678815 ?auto_678822 ) ) ( not ( = ?auto_678815 ?auto_678823 ) ) ( not ( = ?auto_678815 ?auto_678824 ) ) ( not ( = ?auto_678815 ?auto_678825 ) ) ( not ( = ?auto_678815 ?auto_678826 ) ) ( not ( = ?auto_678815 ?auto_678827 ) ) ( not ( = ?auto_678815 ?auto_678828 ) ) ( not ( = ?auto_678816 ?auto_678817 ) ) ( not ( = ?auto_678816 ?auto_678818 ) ) ( not ( = ?auto_678816 ?auto_678819 ) ) ( not ( = ?auto_678816 ?auto_678820 ) ) ( not ( = ?auto_678816 ?auto_678821 ) ) ( not ( = ?auto_678816 ?auto_678822 ) ) ( not ( = ?auto_678816 ?auto_678823 ) ) ( not ( = ?auto_678816 ?auto_678824 ) ) ( not ( = ?auto_678816 ?auto_678825 ) ) ( not ( = ?auto_678816 ?auto_678826 ) ) ( not ( = ?auto_678816 ?auto_678827 ) ) ( not ( = ?auto_678816 ?auto_678828 ) ) ( not ( = ?auto_678817 ?auto_678818 ) ) ( not ( = ?auto_678817 ?auto_678819 ) ) ( not ( = ?auto_678817 ?auto_678820 ) ) ( not ( = ?auto_678817 ?auto_678821 ) ) ( not ( = ?auto_678817 ?auto_678822 ) ) ( not ( = ?auto_678817 ?auto_678823 ) ) ( not ( = ?auto_678817 ?auto_678824 ) ) ( not ( = ?auto_678817 ?auto_678825 ) ) ( not ( = ?auto_678817 ?auto_678826 ) ) ( not ( = ?auto_678817 ?auto_678827 ) ) ( not ( = ?auto_678817 ?auto_678828 ) ) ( not ( = ?auto_678818 ?auto_678819 ) ) ( not ( = ?auto_678818 ?auto_678820 ) ) ( not ( = ?auto_678818 ?auto_678821 ) ) ( not ( = ?auto_678818 ?auto_678822 ) ) ( not ( = ?auto_678818 ?auto_678823 ) ) ( not ( = ?auto_678818 ?auto_678824 ) ) ( not ( = ?auto_678818 ?auto_678825 ) ) ( not ( = ?auto_678818 ?auto_678826 ) ) ( not ( = ?auto_678818 ?auto_678827 ) ) ( not ( = ?auto_678818 ?auto_678828 ) ) ( not ( = ?auto_678819 ?auto_678820 ) ) ( not ( = ?auto_678819 ?auto_678821 ) ) ( not ( = ?auto_678819 ?auto_678822 ) ) ( not ( = ?auto_678819 ?auto_678823 ) ) ( not ( = ?auto_678819 ?auto_678824 ) ) ( not ( = ?auto_678819 ?auto_678825 ) ) ( not ( = ?auto_678819 ?auto_678826 ) ) ( not ( = ?auto_678819 ?auto_678827 ) ) ( not ( = ?auto_678819 ?auto_678828 ) ) ( not ( = ?auto_678820 ?auto_678821 ) ) ( not ( = ?auto_678820 ?auto_678822 ) ) ( not ( = ?auto_678820 ?auto_678823 ) ) ( not ( = ?auto_678820 ?auto_678824 ) ) ( not ( = ?auto_678820 ?auto_678825 ) ) ( not ( = ?auto_678820 ?auto_678826 ) ) ( not ( = ?auto_678820 ?auto_678827 ) ) ( not ( = ?auto_678820 ?auto_678828 ) ) ( not ( = ?auto_678821 ?auto_678822 ) ) ( not ( = ?auto_678821 ?auto_678823 ) ) ( not ( = ?auto_678821 ?auto_678824 ) ) ( not ( = ?auto_678821 ?auto_678825 ) ) ( not ( = ?auto_678821 ?auto_678826 ) ) ( not ( = ?auto_678821 ?auto_678827 ) ) ( not ( = ?auto_678821 ?auto_678828 ) ) ( not ( = ?auto_678822 ?auto_678823 ) ) ( not ( = ?auto_678822 ?auto_678824 ) ) ( not ( = ?auto_678822 ?auto_678825 ) ) ( not ( = ?auto_678822 ?auto_678826 ) ) ( not ( = ?auto_678822 ?auto_678827 ) ) ( not ( = ?auto_678822 ?auto_678828 ) ) ( not ( = ?auto_678823 ?auto_678824 ) ) ( not ( = ?auto_678823 ?auto_678825 ) ) ( not ( = ?auto_678823 ?auto_678826 ) ) ( not ( = ?auto_678823 ?auto_678827 ) ) ( not ( = ?auto_678823 ?auto_678828 ) ) ( not ( = ?auto_678824 ?auto_678825 ) ) ( not ( = ?auto_678824 ?auto_678826 ) ) ( not ( = ?auto_678824 ?auto_678827 ) ) ( not ( = ?auto_678824 ?auto_678828 ) ) ( not ( = ?auto_678825 ?auto_678826 ) ) ( not ( = ?auto_678825 ?auto_678827 ) ) ( not ( = ?auto_678825 ?auto_678828 ) ) ( not ( = ?auto_678826 ?auto_678827 ) ) ( not ( = ?auto_678826 ?auto_678828 ) ) ( not ( = ?auto_678827 ?auto_678828 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_678828 )
      ( !STACK ?auto_678828 ?auto_678827 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_678846 - BLOCK
      ?auto_678847 - BLOCK
      ?auto_678848 - BLOCK
      ?auto_678849 - BLOCK
      ?auto_678850 - BLOCK
      ?auto_678851 - BLOCK
      ?auto_678852 - BLOCK
      ?auto_678853 - BLOCK
      ?auto_678854 - BLOCK
      ?auto_678855 - BLOCK
      ?auto_678856 - BLOCK
      ?auto_678857 - BLOCK
      ?auto_678858 - BLOCK
      ?auto_678859 - BLOCK
      ?auto_678860 - BLOCK
      ?auto_678861 - BLOCK
      ?auto_678862 - BLOCK
    )
    :vars
    (
      ?auto_678863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678862 ?auto_678863 ) ( ON-TABLE ?auto_678846 ) ( ON ?auto_678847 ?auto_678846 ) ( ON ?auto_678848 ?auto_678847 ) ( ON ?auto_678849 ?auto_678848 ) ( ON ?auto_678850 ?auto_678849 ) ( ON ?auto_678851 ?auto_678850 ) ( ON ?auto_678852 ?auto_678851 ) ( ON ?auto_678853 ?auto_678852 ) ( ON ?auto_678854 ?auto_678853 ) ( ON ?auto_678855 ?auto_678854 ) ( ON ?auto_678856 ?auto_678855 ) ( ON ?auto_678857 ?auto_678856 ) ( ON ?auto_678858 ?auto_678857 ) ( ON ?auto_678859 ?auto_678858 ) ( ON ?auto_678860 ?auto_678859 ) ( not ( = ?auto_678846 ?auto_678847 ) ) ( not ( = ?auto_678846 ?auto_678848 ) ) ( not ( = ?auto_678846 ?auto_678849 ) ) ( not ( = ?auto_678846 ?auto_678850 ) ) ( not ( = ?auto_678846 ?auto_678851 ) ) ( not ( = ?auto_678846 ?auto_678852 ) ) ( not ( = ?auto_678846 ?auto_678853 ) ) ( not ( = ?auto_678846 ?auto_678854 ) ) ( not ( = ?auto_678846 ?auto_678855 ) ) ( not ( = ?auto_678846 ?auto_678856 ) ) ( not ( = ?auto_678846 ?auto_678857 ) ) ( not ( = ?auto_678846 ?auto_678858 ) ) ( not ( = ?auto_678846 ?auto_678859 ) ) ( not ( = ?auto_678846 ?auto_678860 ) ) ( not ( = ?auto_678846 ?auto_678861 ) ) ( not ( = ?auto_678846 ?auto_678862 ) ) ( not ( = ?auto_678846 ?auto_678863 ) ) ( not ( = ?auto_678847 ?auto_678848 ) ) ( not ( = ?auto_678847 ?auto_678849 ) ) ( not ( = ?auto_678847 ?auto_678850 ) ) ( not ( = ?auto_678847 ?auto_678851 ) ) ( not ( = ?auto_678847 ?auto_678852 ) ) ( not ( = ?auto_678847 ?auto_678853 ) ) ( not ( = ?auto_678847 ?auto_678854 ) ) ( not ( = ?auto_678847 ?auto_678855 ) ) ( not ( = ?auto_678847 ?auto_678856 ) ) ( not ( = ?auto_678847 ?auto_678857 ) ) ( not ( = ?auto_678847 ?auto_678858 ) ) ( not ( = ?auto_678847 ?auto_678859 ) ) ( not ( = ?auto_678847 ?auto_678860 ) ) ( not ( = ?auto_678847 ?auto_678861 ) ) ( not ( = ?auto_678847 ?auto_678862 ) ) ( not ( = ?auto_678847 ?auto_678863 ) ) ( not ( = ?auto_678848 ?auto_678849 ) ) ( not ( = ?auto_678848 ?auto_678850 ) ) ( not ( = ?auto_678848 ?auto_678851 ) ) ( not ( = ?auto_678848 ?auto_678852 ) ) ( not ( = ?auto_678848 ?auto_678853 ) ) ( not ( = ?auto_678848 ?auto_678854 ) ) ( not ( = ?auto_678848 ?auto_678855 ) ) ( not ( = ?auto_678848 ?auto_678856 ) ) ( not ( = ?auto_678848 ?auto_678857 ) ) ( not ( = ?auto_678848 ?auto_678858 ) ) ( not ( = ?auto_678848 ?auto_678859 ) ) ( not ( = ?auto_678848 ?auto_678860 ) ) ( not ( = ?auto_678848 ?auto_678861 ) ) ( not ( = ?auto_678848 ?auto_678862 ) ) ( not ( = ?auto_678848 ?auto_678863 ) ) ( not ( = ?auto_678849 ?auto_678850 ) ) ( not ( = ?auto_678849 ?auto_678851 ) ) ( not ( = ?auto_678849 ?auto_678852 ) ) ( not ( = ?auto_678849 ?auto_678853 ) ) ( not ( = ?auto_678849 ?auto_678854 ) ) ( not ( = ?auto_678849 ?auto_678855 ) ) ( not ( = ?auto_678849 ?auto_678856 ) ) ( not ( = ?auto_678849 ?auto_678857 ) ) ( not ( = ?auto_678849 ?auto_678858 ) ) ( not ( = ?auto_678849 ?auto_678859 ) ) ( not ( = ?auto_678849 ?auto_678860 ) ) ( not ( = ?auto_678849 ?auto_678861 ) ) ( not ( = ?auto_678849 ?auto_678862 ) ) ( not ( = ?auto_678849 ?auto_678863 ) ) ( not ( = ?auto_678850 ?auto_678851 ) ) ( not ( = ?auto_678850 ?auto_678852 ) ) ( not ( = ?auto_678850 ?auto_678853 ) ) ( not ( = ?auto_678850 ?auto_678854 ) ) ( not ( = ?auto_678850 ?auto_678855 ) ) ( not ( = ?auto_678850 ?auto_678856 ) ) ( not ( = ?auto_678850 ?auto_678857 ) ) ( not ( = ?auto_678850 ?auto_678858 ) ) ( not ( = ?auto_678850 ?auto_678859 ) ) ( not ( = ?auto_678850 ?auto_678860 ) ) ( not ( = ?auto_678850 ?auto_678861 ) ) ( not ( = ?auto_678850 ?auto_678862 ) ) ( not ( = ?auto_678850 ?auto_678863 ) ) ( not ( = ?auto_678851 ?auto_678852 ) ) ( not ( = ?auto_678851 ?auto_678853 ) ) ( not ( = ?auto_678851 ?auto_678854 ) ) ( not ( = ?auto_678851 ?auto_678855 ) ) ( not ( = ?auto_678851 ?auto_678856 ) ) ( not ( = ?auto_678851 ?auto_678857 ) ) ( not ( = ?auto_678851 ?auto_678858 ) ) ( not ( = ?auto_678851 ?auto_678859 ) ) ( not ( = ?auto_678851 ?auto_678860 ) ) ( not ( = ?auto_678851 ?auto_678861 ) ) ( not ( = ?auto_678851 ?auto_678862 ) ) ( not ( = ?auto_678851 ?auto_678863 ) ) ( not ( = ?auto_678852 ?auto_678853 ) ) ( not ( = ?auto_678852 ?auto_678854 ) ) ( not ( = ?auto_678852 ?auto_678855 ) ) ( not ( = ?auto_678852 ?auto_678856 ) ) ( not ( = ?auto_678852 ?auto_678857 ) ) ( not ( = ?auto_678852 ?auto_678858 ) ) ( not ( = ?auto_678852 ?auto_678859 ) ) ( not ( = ?auto_678852 ?auto_678860 ) ) ( not ( = ?auto_678852 ?auto_678861 ) ) ( not ( = ?auto_678852 ?auto_678862 ) ) ( not ( = ?auto_678852 ?auto_678863 ) ) ( not ( = ?auto_678853 ?auto_678854 ) ) ( not ( = ?auto_678853 ?auto_678855 ) ) ( not ( = ?auto_678853 ?auto_678856 ) ) ( not ( = ?auto_678853 ?auto_678857 ) ) ( not ( = ?auto_678853 ?auto_678858 ) ) ( not ( = ?auto_678853 ?auto_678859 ) ) ( not ( = ?auto_678853 ?auto_678860 ) ) ( not ( = ?auto_678853 ?auto_678861 ) ) ( not ( = ?auto_678853 ?auto_678862 ) ) ( not ( = ?auto_678853 ?auto_678863 ) ) ( not ( = ?auto_678854 ?auto_678855 ) ) ( not ( = ?auto_678854 ?auto_678856 ) ) ( not ( = ?auto_678854 ?auto_678857 ) ) ( not ( = ?auto_678854 ?auto_678858 ) ) ( not ( = ?auto_678854 ?auto_678859 ) ) ( not ( = ?auto_678854 ?auto_678860 ) ) ( not ( = ?auto_678854 ?auto_678861 ) ) ( not ( = ?auto_678854 ?auto_678862 ) ) ( not ( = ?auto_678854 ?auto_678863 ) ) ( not ( = ?auto_678855 ?auto_678856 ) ) ( not ( = ?auto_678855 ?auto_678857 ) ) ( not ( = ?auto_678855 ?auto_678858 ) ) ( not ( = ?auto_678855 ?auto_678859 ) ) ( not ( = ?auto_678855 ?auto_678860 ) ) ( not ( = ?auto_678855 ?auto_678861 ) ) ( not ( = ?auto_678855 ?auto_678862 ) ) ( not ( = ?auto_678855 ?auto_678863 ) ) ( not ( = ?auto_678856 ?auto_678857 ) ) ( not ( = ?auto_678856 ?auto_678858 ) ) ( not ( = ?auto_678856 ?auto_678859 ) ) ( not ( = ?auto_678856 ?auto_678860 ) ) ( not ( = ?auto_678856 ?auto_678861 ) ) ( not ( = ?auto_678856 ?auto_678862 ) ) ( not ( = ?auto_678856 ?auto_678863 ) ) ( not ( = ?auto_678857 ?auto_678858 ) ) ( not ( = ?auto_678857 ?auto_678859 ) ) ( not ( = ?auto_678857 ?auto_678860 ) ) ( not ( = ?auto_678857 ?auto_678861 ) ) ( not ( = ?auto_678857 ?auto_678862 ) ) ( not ( = ?auto_678857 ?auto_678863 ) ) ( not ( = ?auto_678858 ?auto_678859 ) ) ( not ( = ?auto_678858 ?auto_678860 ) ) ( not ( = ?auto_678858 ?auto_678861 ) ) ( not ( = ?auto_678858 ?auto_678862 ) ) ( not ( = ?auto_678858 ?auto_678863 ) ) ( not ( = ?auto_678859 ?auto_678860 ) ) ( not ( = ?auto_678859 ?auto_678861 ) ) ( not ( = ?auto_678859 ?auto_678862 ) ) ( not ( = ?auto_678859 ?auto_678863 ) ) ( not ( = ?auto_678860 ?auto_678861 ) ) ( not ( = ?auto_678860 ?auto_678862 ) ) ( not ( = ?auto_678860 ?auto_678863 ) ) ( not ( = ?auto_678861 ?auto_678862 ) ) ( not ( = ?auto_678861 ?auto_678863 ) ) ( not ( = ?auto_678862 ?auto_678863 ) ) ( CLEAR ?auto_678860 ) ( ON ?auto_678861 ?auto_678862 ) ( CLEAR ?auto_678861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_678846 ?auto_678847 ?auto_678848 ?auto_678849 ?auto_678850 ?auto_678851 ?auto_678852 ?auto_678853 ?auto_678854 ?auto_678855 ?auto_678856 ?auto_678857 ?auto_678858 ?auto_678859 ?auto_678860 ?auto_678861 )
      ( MAKE-17PILE ?auto_678846 ?auto_678847 ?auto_678848 ?auto_678849 ?auto_678850 ?auto_678851 ?auto_678852 ?auto_678853 ?auto_678854 ?auto_678855 ?auto_678856 ?auto_678857 ?auto_678858 ?auto_678859 ?auto_678860 ?auto_678861 ?auto_678862 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_678881 - BLOCK
      ?auto_678882 - BLOCK
      ?auto_678883 - BLOCK
      ?auto_678884 - BLOCK
      ?auto_678885 - BLOCK
      ?auto_678886 - BLOCK
      ?auto_678887 - BLOCK
      ?auto_678888 - BLOCK
      ?auto_678889 - BLOCK
      ?auto_678890 - BLOCK
      ?auto_678891 - BLOCK
      ?auto_678892 - BLOCK
      ?auto_678893 - BLOCK
      ?auto_678894 - BLOCK
      ?auto_678895 - BLOCK
      ?auto_678896 - BLOCK
      ?auto_678897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_678897 ) ( ON-TABLE ?auto_678881 ) ( ON ?auto_678882 ?auto_678881 ) ( ON ?auto_678883 ?auto_678882 ) ( ON ?auto_678884 ?auto_678883 ) ( ON ?auto_678885 ?auto_678884 ) ( ON ?auto_678886 ?auto_678885 ) ( ON ?auto_678887 ?auto_678886 ) ( ON ?auto_678888 ?auto_678887 ) ( ON ?auto_678889 ?auto_678888 ) ( ON ?auto_678890 ?auto_678889 ) ( ON ?auto_678891 ?auto_678890 ) ( ON ?auto_678892 ?auto_678891 ) ( ON ?auto_678893 ?auto_678892 ) ( ON ?auto_678894 ?auto_678893 ) ( ON ?auto_678895 ?auto_678894 ) ( not ( = ?auto_678881 ?auto_678882 ) ) ( not ( = ?auto_678881 ?auto_678883 ) ) ( not ( = ?auto_678881 ?auto_678884 ) ) ( not ( = ?auto_678881 ?auto_678885 ) ) ( not ( = ?auto_678881 ?auto_678886 ) ) ( not ( = ?auto_678881 ?auto_678887 ) ) ( not ( = ?auto_678881 ?auto_678888 ) ) ( not ( = ?auto_678881 ?auto_678889 ) ) ( not ( = ?auto_678881 ?auto_678890 ) ) ( not ( = ?auto_678881 ?auto_678891 ) ) ( not ( = ?auto_678881 ?auto_678892 ) ) ( not ( = ?auto_678881 ?auto_678893 ) ) ( not ( = ?auto_678881 ?auto_678894 ) ) ( not ( = ?auto_678881 ?auto_678895 ) ) ( not ( = ?auto_678881 ?auto_678896 ) ) ( not ( = ?auto_678881 ?auto_678897 ) ) ( not ( = ?auto_678882 ?auto_678883 ) ) ( not ( = ?auto_678882 ?auto_678884 ) ) ( not ( = ?auto_678882 ?auto_678885 ) ) ( not ( = ?auto_678882 ?auto_678886 ) ) ( not ( = ?auto_678882 ?auto_678887 ) ) ( not ( = ?auto_678882 ?auto_678888 ) ) ( not ( = ?auto_678882 ?auto_678889 ) ) ( not ( = ?auto_678882 ?auto_678890 ) ) ( not ( = ?auto_678882 ?auto_678891 ) ) ( not ( = ?auto_678882 ?auto_678892 ) ) ( not ( = ?auto_678882 ?auto_678893 ) ) ( not ( = ?auto_678882 ?auto_678894 ) ) ( not ( = ?auto_678882 ?auto_678895 ) ) ( not ( = ?auto_678882 ?auto_678896 ) ) ( not ( = ?auto_678882 ?auto_678897 ) ) ( not ( = ?auto_678883 ?auto_678884 ) ) ( not ( = ?auto_678883 ?auto_678885 ) ) ( not ( = ?auto_678883 ?auto_678886 ) ) ( not ( = ?auto_678883 ?auto_678887 ) ) ( not ( = ?auto_678883 ?auto_678888 ) ) ( not ( = ?auto_678883 ?auto_678889 ) ) ( not ( = ?auto_678883 ?auto_678890 ) ) ( not ( = ?auto_678883 ?auto_678891 ) ) ( not ( = ?auto_678883 ?auto_678892 ) ) ( not ( = ?auto_678883 ?auto_678893 ) ) ( not ( = ?auto_678883 ?auto_678894 ) ) ( not ( = ?auto_678883 ?auto_678895 ) ) ( not ( = ?auto_678883 ?auto_678896 ) ) ( not ( = ?auto_678883 ?auto_678897 ) ) ( not ( = ?auto_678884 ?auto_678885 ) ) ( not ( = ?auto_678884 ?auto_678886 ) ) ( not ( = ?auto_678884 ?auto_678887 ) ) ( not ( = ?auto_678884 ?auto_678888 ) ) ( not ( = ?auto_678884 ?auto_678889 ) ) ( not ( = ?auto_678884 ?auto_678890 ) ) ( not ( = ?auto_678884 ?auto_678891 ) ) ( not ( = ?auto_678884 ?auto_678892 ) ) ( not ( = ?auto_678884 ?auto_678893 ) ) ( not ( = ?auto_678884 ?auto_678894 ) ) ( not ( = ?auto_678884 ?auto_678895 ) ) ( not ( = ?auto_678884 ?auto_678896 ) ) ( not ( = ?auto_678884 ?auto_678897 ) ) ( not ( = ?auto_678885 ?auto_678886 ) ) ( not ( = ?auto_678885 ?auto_678887 ) ) ( not ( = ?auto_678885 ?auto_678888 ) ) ( not ( = ?auto_678885 ?auto_678889 ) ) ( not ( = ?auto_678885 ?auto_678890 ) ) ( not ( = ?auto_678885 ?auto_678891 ) ) ( not ( = ?auto_678885 ?auto_678892 ) ) ( not ( = ?auto_678885 ?auto_678893 ) ) ( not ( = ?auto_678885 ?auto_678894 ) ) ( not ( = ?auto_678885 ?auto_678895 ) ) ( not ( = ?auto_678885 ?auto_678896 ) ) ( not ( = ?auto_678885 ?auto_678897 ) ) ( not ( = ?auto_678886 ?auto_678887 ) ) ( not ( = ?auto_678886 ?auto_678888 ) ) ( not ( = ?auto_678886 ?auto_678889 ) ) ( not ( = ?auto_678886 ?auto_678890 ) ) ( not ( = ?auto_678886 ?auto_678891 ) ) ( not ( = ?auto_678886 ?auto_678892 ) ) ( not ( = ?auto_678886 ?auto_678893 ) ) ( not ( = ?auto_678886 ?auto_678894 ) ) ( not ( = ?auto_678886 ?auto_678895 ) ) ( not ( = ?auto_678886 ?auto_678896 ) ) ( not ( = ?auto_678886 ?auto_678897 ) ) ( not ( = ?auto_678887 ?auto_678888 ) ) ( not ( = ?auto_678887 ?auto_678889 ) ) ( not ( = ?auto_678887 ?auto_678890 ) ) ( not ( = ?auto_678887 ?auto_678891 ) ) ( not ( = ?auto_678887 ?auto_678892 ) ) ( not ( = ?auto_678887 ?auto_678893 ) ) ( not ( = ?auto_678887 ?auto_678894 ) ) ( not ( = ?auto_678887 ?auto_678895 ) ) ( not ( = ?auto_678887 ?auto_678896 ) ) ( not ( = ?auto_678887 ?auto_678897 ) ) ( not ( = ?auto_678888 ?auto_678889 ) ) ( not ( = ?auto_678888 ?auto_678890 ) ) ( not ( = ?auto_678888 ?auto_678891 ) ) ( not ( = ?auto_678888 ?auto_678892 ) ) ( not ( = ?auto_678888 ?auto_678893 ) ) ( not ( = ?auto_678888 ?auto_678894 ) ) ( not ( = ?auto_678888 ?auto_678895 ) ) ( not ( = ?auto_678888 ?auto_678896 ) ) ( not ( = ?auto_678888 ?auto_678897 ) ) ( not ( = ?auto_678889 ?auto_678890 ) ) ( not ( = ?auto_678889 ?auto_678891 ) ) ( not ( = ?auto_678889 ?auto_678892 ) ) ( not ( = ?auto_678889 ?auto_678893 ) ) ( not ( = ?auto_678889 ?auto_678894 ) ) ( not ( = ?auto_678889 ?auto_678895 ) ) ( not ( = ?auto_678889 ?auto_678896 ) ) ( not ( = ?auto_678889 ?auto_678897 ) ) ( not ( = ?auto_678890 ?auto_678891 ) ) ( not ( = ?auto_678890 ?auto_678892 ) ) ( not ( = ?auto_678890 ?auto_678893 ) ) ( not ( = ?auto_678890 ?auto_678894 ) ) ( not ( = ?auto_678890 ?auto_678895 ) ) ( not ( = ?auto_678890 ?auto_678896 ) ) ( not ( = ?auto_678890 ?auto_678897 ) ) ( not ( = ?auto_678891 ?auto_678892 ) ) ( not ( = ?auto_678891 ?auto_678893 ) ) ( not ( = ?auto_678891 ?auto_678894 ) ) ( not ( = ?auto_678891 ?auto_678895 ) ) ( not ( = ?auto_678891 ?auto_678896 ) ) ( not ( = ?auto_678891 ?auto_678897 ) ) ( not ( = ?auto_678892 ?auto_678893 ) ) ( not ( = ?auto_678892 ?auto_678894 ) ) ( not ( = ?auto_678892 ?auto_678895 ) ) ( not ( = ?auto_678892 ?auto_678896 ) ) ( not ( = ?auto_678892 ?auto_678897 ) ) ( not ( = ?auto_678893 ?auto_678894 ) ) ( not ( = ?auto_678893 ?auto_678895 ) ) ( not ( = ?auto_678893 ?auto_678896 ) ) ( not ( = ?auto_678893 ?auto_678897 ) ) ( not ( = ?auto_678894 ?auto_678895 ) ) ( not ( = ?auto_678894 ?auto_678896 ) ) ( not ( = ?auto_678894 ?auto_678897 ) ) ( not ( = ?auto_678895 ?auto_678896 ) ) ( not ( = ?auto_678895 ?auto_678897 ) ) ( not ( = ?auto_678896 ?auto_678897 ) ) ( CLEAR ?auto_678895 ) ( ON ?auto_678896 ?auto_678897 ) ( CLEAR ?auto_678896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_678881 ?auto_678882 ?auto_678883 ?auto_678884 ?auto_678885 ?auto_678886 ?auto_678887 ?auto_678888 ?auto_678889 ?auto_678890 ?auto_678891 ?auto_678892 ?auto_678893 ?auto_678894 ?auto_678895 ?auto_678896 )
      ( MAKE-17PILE ?auto_678881 ?auto_678882 ?auto_678883 ?auto_678884 ?auto_678885 ?auto_678886 ?auto_678887 ?auto_678888 ?auto_678889 ?auto_678890 ?auto_678891 ?auto_678892 ?auto_678893 ?auto_678894 ?auto_678895 ?auto_678896 ?auto_678897 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_678915 - BLOCK
      ?auto_678916 - BLOCK
      ?auto_678917 - BLOCK
      ?auto_678918 - BLOCK
      ?auto_678919 - BLOCK
      ?auto_678920 - BLOCK
      ?auto_678921 - BLOCK
      ?auto_678922 - BLOCK
      ?auto_678923 - BLOCK
      ?auto_678924 - BLOCK
      ?auto_678925 - BLOCK
      ?auto_678926 - BLOCK
      ?auto_678927 - BLOCK
      ?auto_678928 - BLOCK
      ?auto_678929 - BLOCK
      ?auto_678930 - BLOCK
      ?auto_678931 - BLOCK
    )
    :vars
    (
      ?auto_678932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_678931 ?auto_678932 ) ( ON-TABLE ?auto_678915 ) ( ON ?auto_678916 ?auto_678915 ) ( ON ?auto_678917 ?auto_678916 ) ( ON ?auto_678918 ?auto_678917 ) ( ON ?auto_678919 ?auto_678918 ) ( ON ?auto_678920 ?auto_678919 ) ( ON ?auto_678921 ?auto_678920 ) ( ON ?auto_678922 ?auto_678921 ) ( ON ?auto_678923 ?auto_678922 ) ( ON ?auto_678924 ?auto_678923 ) ( ON ?auto_678925 ?auto_678924 ) ( ON ?auto_678926 ?auto_678925 ) ( ON ?auto_678927 ?auto_678926 ) ( ON ?auto_678928 ?auto_678927 ) ( not ( = ?auto_678915 ?auto_678916 ) ) ( not ( = ?auto_678915 ?auto_678917 ) ) ( not ( = ?auto_678915 ?auto_678918 ) ) ( not ( = ?auto_678915 ?auto_678919 ) ) ( not ( = ?auto_678915 ?auto_678920 ) ) ( not ( = ?auto_678915 ?auto_678921 ) ) ( not ( = ?auto_678915 ?auto_678922 ) ) ( not ( = ?auto_678915 ?auto_678923 ) ) ( not ( = ?auto_678915 ?auto_678924 ) ) ( not ( = ?auto_678915 ?auto_678925 ) ) ( not ( = ?auto_678915 ?auto_678926 ) ) ( not ( = ?auto_678915 ?auto_678927 ) ) ( not ( = ?auto_678915 ?auto_678928 ) ) ( not ( = ?auto_678915 ?auto_678929 ) ) ( not ( = ?auto_678915 ?auto_678930 ) ) ( not ( = ?auto_678915 ?auto_678931 ) ) ( not ( = ?auto_678915 ?auto_678932 ) ) ( not ( = ?auto_678916 ?auto_678917 ) ) ( not ( = ?auto_678916 ?auto_678918 ) ) ( not ( = ?auto_678916 ?auto_678919 ) ) ( not ( = ?auto_678916 ?auto_678920 ) ) ( not ( = ?auto_678916 ?auto_678921 ) ) ( not ( = ?auto_678916 ?auto_678922 ) ) ( not ( = ?auto_678916 ?auto_678923 ) ) ( not ( = ?auto_678916 ?auto_678924 ) ) ( not ( = ?auto_678916 ?auto_678925 ) ) ( not ( = ?auto_678916 ?auto_678926 ) ) ( not ( = ?auto_678916 ?auto_678927 ) ) ( not ( = ?auto_678916 ?auto_678928 ) ) ( not ( = ?auto_678916 ?auto_678929 ) ) ( not ( = ?auto_678916 ?auto_678930 ) ) ( not ( = ?auto_678916 ?auto_678931 ) ) ( not ( = ?auto_678916 ?auto_678932 ) ) ( not ( = ?auto_678917 ?auto_678918 ) ) ( not ( = ?auto_678917 ?auto_678919 ) ) ( not ( = ?auto_678917 ?auto_678920 ) ) ( not ( = ?auto_678917 ?auto_678921 ) ) ( not ( = ?auto_678917 ?auto_678922 ) ) ( not ( = ?auto_678917 ?auto_678923 ) ) ( not ( = ?auto_678917 ?auto_678924 ) ) ( not ( = ?auto_678917 ?auto_678925 ) ) ( not ( = ?auto_678917 ?auto_678926 ) ) ( not ( = ?auto_678917 ?auto_678927 ) ) ( not ( = ?auto_678917 ?auto_678928 ) ) ( not ( = ?auto_678917 ?auto_678929 ) ) ( not ( = ?auto_678917 ?auto_678930 ) ) ( not ( = ?auto_678917 ?auto_678931 ) ) ( not ( = ?auto_678917 ?auto_678932 ) ) ( not ( = ?auto_678918 ?auto_678919 ) ) ( not ( = ?auto_678918 ?auto_678920 ) ) ( not ( = ?auto_678918 ?auto_678921 ) ) ( not ( = ?auto_678918 ?auto_678922 ) ) ( not ( = ?auto_678918 ?auto_678923 ) ) ( not ( = ?auto_678918 ?auto_678924 ) ) ( not ( = ?auto_678918 ?auto_678925 ) ) ( not ( = ?auto_678918 ?auto_678926 ) ) ( not ( = ?auto_678918 ?auto_678927 ) ) ( not ( = ?auto_678918 ?auto_678928 ) ) ( not ( = ?auto_678918 ?auto_678929 ) ) ( not ( = ?auto_678918 ?auto_678930 ) ) ( not ( = ?auto_678918 ?auto_678931 ) ) ( not ( = ?auto_678918 ?auto_678932 ) ) ( not ( = ?auto_678919 ?auto_678920 ) ) ( not ( = ?auto_678919 ?auto_678921 ) ) ( not ( = ?auto_678919 ?auto_678922 ) ) ( not ( = ?auto_678919 ?auto_678923 ) ) ( not ( = ?auto_678919 ?auto_678924 ) ) ( not ( = ?auto_678919 ?auto_678925 ) ) ( not ( = ?auto_678919 ?auto_678926 ) ) ( not ( = ?auto_678919 ?auto_678927 ) ) ( not ( = ?auto_678919 ?auto_678928 ) ) ( not ( = ?auto_678919 ?auto_678929 ) ) ( not ( = ?auto_678919 ?auto_678930 ) ) ( not ( = ?auto_678919 ?auto_678931 ) ) ( not ( = ?auto_678919 ?auto_678932 ) ) ( not ( = ?auto_678920 ?auto_678921 ) ) ( not ( = ?auto_678920 ?auto_678922 ) ) ( not ( = ?auto_678920 ?auto_678923 ) ) ( not ( = ?auto_678920 ?auto_678924 ) ) ( not ( = ?auto_678920 ?auto_678925 ) ) ( not ( = ?auto_678920 ?auto_678926 ) ) ( not ( = ?auto_678920 ?auto_678927 ) ) ( not ( = ?auto_678920 ?auto_678928 ) ) ( not ( = ?auto_678920 ?auto_678929 ) ) ( not ( = ?auto_678920 ?auto_678930 ) ) ( not ( = ?auto_678920 ?auto_678931 ) ) ( not ( = ?auto_678920 ?auto_678932 ) ) ( not ( = ?auto_678921 ?auto_678922 ) ) ( not ( = ?auto_678921 ?auto_678923 ) ) ( not ( = ?auto_678921 ?auto_678924 ) ) ( not ( = ?auto_678921 ?auto_678925 ) ) ( not ( = ?auto_678921 ?auto_678926 ) ) ( not ( = ?auto_678921 ?auto_678927 ) ) ( not ( = ?auto_678921 ?auto_678928 ) ) ( not ( = ?auto_678921 ?auto_678929 ) ) ( not ( = ?auto_678921 ?auto_678930 ) ) ( not ( = ?auto_678921 ?auto_678931 ) ) ( not ( = ?auto_678921 ?auto_678932 ) ) ( not ( = ?auto_678922 ?auto_678923 ) ) ( not ( = ?auto_678922 ?auto_678924 ) ) ( not ( = ?auto_678922 ?auto_678925 ) ) ( not ( = ?auto_678922 ?auto_678926 ) ) ( not ( = ?auto_678922 ?auto_678927 ) ) ( not ( = ?auto_678922 ?auto_678928 ) ) ( not ( = ?auto_678922 ?auto_678929 ) ) ( not ( = ?auto_678922 ?auto_678930 ) ) ( not ( = ?auto_678922 ?auto_678931 ) ) ( not ( = ?auto_678922 ?auto_678932 ) ) ( not ( = ?auto_678923 ?auto_678924 ) ) ( not ( = ?auto_678923 ?auto_678925 ) ) ( not ( = ?auto_678923 ?auto_678926 ) ) ( not ( = ?auto_678923 ?auto_678927 ) ) ( not ( = ?auto_678923 ?auto_678928 ) ) ( not ( = ?auto_678923 ?auto_678929 ) ) ( not ( = ?auto_678923 ?auto_678930 ) ) ( not ( = ?auto_678923 ?auto_678931 ) ) ( not ( = ?auto_678923 ?auto_678932 ) ) ( not ( = ?auto_678924 ?auto_678925 ) ) ( not ( = ?auto_678924 ?auto_678926 ) ) ( not ( = ?auto_678924 ?auto_678927 ) ) ( not ( = ?auto_678924 ?auto_678928 ) ) ( not ( = ?auto_678924 ?auto_678929 ) ) ( not ( = ?auto_678924 ?auto_678930 ) ) ( not ( = ?auto_678924 ?auto_678931 ) ) ( not ( = ?auto_678924 ?auto_678932 ) ) ( not ( = ?auto_678925 ?auto_678926 ) ) ( not ( = ?auto_678925 ?auto_678927 ) ) ( not ( = ?auto_678925 ?auto_678928 ) ) ( not ( = ?auto_678925 ?auto_678929 ) ) ( not ( = ?auto_678925 ?auto_678930 ) ) ( not ( = ?auto_678925 ?auto_678931 ) ) ( not ( = ?auto_678925 ?auto_678932 ) ) ( not ( = ?auto_678926 ?auto_678927 ) ) ( not ( = ?auto_678926 ?auto_678928 ) ) ( not ( = ?auto_678926 ?auto_678929 ) ) ( not ( = ?auto_678926 ?auto_678930 ) ) ( not ( = ?auto_678926 ?auto_678931 ) ) ( not ( = ?auto_678926 ?auto_678932 ) ) ( not ( = ?auto_678927 ?auto_678928 ) ) ( not ( = ?auto_678927 ?auto_678929 ) ) ( not ( = ?auto_678927 ?auto_678930 ) ) ( not ( = ?auto_678927 ?auto_678931 ) ) ( not ( = ?auto_678927 ?auto_678932 ) ) ( not ( = ?auto_678928 ?auto_678929 ) ) ( not ( = ?auto_678928 ?auto_678930 ) ) ( not ( = ?auto_678928 ?auto_678931 ) ) ( not ( = ?auto_678928 ?auto_678932 ) ) ( not ( = ?auto_678929 ?auto_678930 ) ) ( not ( = ?auto_678929 ?auto_678931 ) ) ( not ( = ?auto_678929 ?auto_678932 ) ) ( not ( = ?auto_678930 ?auto_678931 ) ) ( not ( = ?auto_678930 ?auto_678932 ) ) ( not ( = ?auto_678931 ?auto_678932 ) ) ( ON ?auto_678930 ?auto_678931 ) ( CLEAR ?auto_678928 ) ( ON ?auto_678929 ?auto_678930 ) ( CLEAR ?auto_678929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_678915 ?auto_678916 ?auto_678917 ?auto_678918 ?auto_678919 ?auto_678920 ?auto_678921 ?auto_678922 ?auto_678923 ?auto_678924 ?auto_678925 ?auto_678926 ?auto_678927 ?auto_678928 ?auto_678929 )
      ( MAKE-17PILE ?auto_678915 ?auto_678916 ?auto_678917 ?auto_678918 ?auto_678919 ?auto_678920 ?auto_678921 ?auto_678922 ?auto_678923 ?auto_678924 ?auto_678925 ?auto_678926 ?auto_678927 ?auto_678928 ?auto_678929 ?auto_678930 ?auto_678931 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_678950 - BLOCK
      ?auto_678951 - BLOCK
      ?auto_678952 - BLOCK
      ?auto_678953 - BLOCK
      ?auto_678954 - BLOCK
      ?auto_678955 - BLOCK
      ?auto_678956 - BLOCK
      ?auto_678957 - BLOCK
      ?auto_678958 - BLOCK
      ?auto_678959 - BLOCK
      ?auto_678960 - BLOCK
      ?auto_678961 - BLOCK
      ?auto_678962 - BLOCK
      ?auto_678963 - BLOCK
      ?auto_678964 - BLOCK
      ?auto_678965 - BLOCK
      ?auto_678966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_678966 ) ( ON-TABLE ?auto_678950 ) ( ON ?auto_678951 ?auto_678950 ) ( ON ?auto_678952 ?auto_678951 ) ( ON ?auto_678953 ?auto_678952 ) ( ON ?auto_678954 ?auto_678953 ) ( ON ?auto_678955 ?auto_678954 ) ( ON ?auto_678956 ?auto_678955 ) ( ON ?auto_678957 ?auto_678956 ) ( ON ?auto_678958 ?auto_678957 ) ( ON ?auto_678959 ?auto_678958 ) ( ON ?auto_678960 ?auto_678959 ) ( ON ?auto_678961 ?auto_678960 ) ( ON ?auto_678962 ?auto_678961 ) ( ON ?auto_678963 ?auto_678962 ) ( not ( = ?auto_678950 ?auto_678951 ) ) ( not ( = ?auto_678950 ?auto_678952 ) ) ( not ( = ?auto_678950 ?auto_678953 ) ) ( not ( = ?auto_678950 ?auto_678954 ) ) ( not ( = ?auto_678950 ?auto_678955 ) ) ( not ( = ?auto_678950 ?auto_678956 ) ) ( not ( = ?auto_678950 ?auto_678957 ) ) ( not ( = ?auto_678950 ?auto_678958 ) ) ( not ( = ?auto_678950 ?auto_678959 ) ) ( not ( = ?auto_678950 ?auto_678960 ) ) ( not ( = ?auto_678950 ?auto_678961 ) ) ( not ( = ?auto_678950 ?auto_678962 ) ) ( not ( = ?auto_678950 ?auto_678963 ) ) ( not ( = ?auto_678950 ?auto_678964 ) ) ( not ( = ?auto_678950 ?auto_678965 ) ) ( not ( = ?auto_678950 ?auto_678966 ) ) ( not ( = ?auto_678951 ?auto_678952 ) ) ( not ( = ?auto_678951 ?auto_678953 ) ) ( not ( = ?auto_678951 ?auto_678954 ) ) ( not ( = ?auto_678951 ?auto_678955 ) ) ( not ( = ?auto_678951 ?auto_678956 ) ) ( not ( = ?auto_678951 ?auto_678957 ) ) ( not ( = ?auto_678951 ?auto_678958 ) ) ( not ( = ?auto_678951 ?auto_678959 ) ) ( not ( = ?auto_678951 ?auto_678960 ) ) ( not ( = ?auto_678951 ?auto_678961 ) ) ( not ( = ?auto_678951 ?auto_678962 ) ) ( not ( = ?auto_678951 ?auto_678963 ) ) ( not ( = ?auto_678951 ?auto_678964 ) ) ( not ( = ?auto_678951 ?auto_678965 ) ) ( not ( = ?auto_678951 ?auto_678966 ) ) ( not ( = ?auto_678952 ?auto_678953 ) ) ( not ( = ?auto_678952 ?auto_678954 ) ) ( not ( = ?auto_678952 ?auto_678955 ) ) ( not ( = ?auto_678952 ?auto_678956 ) ) ( not ( = ?auto_678952 ?auto_678957 ) ) ( not ( = ?auto_678952 ?auto_678958 ) ) ( not ( = ?auto_678952 ?auto_678959 ) ) ( not ( = ?auto_678952 ?auto_678960 ) ) ( not ( = ?auto_678952 ?auto_678961 ) ) ( not ( = ?auto_678952 ?auto_678962 ) ) ( not ( = ?auto_678952 ?auto_678963 ) ) ( not ( = ?auto_678952 ?auto_678964 ) ) ( not ( = ?auto_678952 ?auto_678965 ) ) ( not ( = ?auto_678952 ?auto_678966 ) ) ( not ( = ?auto_678953 ?auto_678954 ) ) ( not ( = ?auto_678953 ?auto_678955 ) ) ( not ( = ?auto_678953 ?auto_678956 ) ) ( not ( = ?auto_678953 ?auto_678957 ) ) ( not ( = ?auto_678953 ?auto_678958 ) ) ( not ( = ?auto_678953 ?auto_678959 ) ) ( not ( = ?auto_678953 ?auto_678960 ) ) ( not ( = ?auto_678953 ?auto_678961 ) ) ( not ( = ?auto_678953 ?auto_678962 ) ) ( not ( = ?auto_678953 ?auto_678963 ) ) ( not ( = ?auto_678953 ?auto_678964 ) ) ( not ( = ?auto_678953 ?auto_678965 ) ) ( not ( = ?auto_678953 ?auto_678966 ) ) ( not ( = ?auto_678954 ?auto_678955 ) ) ( not ( = ?auto_678954 ?auto_678956 ) ) ( not ( = ?auto_678954 ?auto_678957 ) ) ( not ( = ?auto_678954 ?auto_678958 ) ) ( not ( = ?auto_678954 ?auto_678959 ) ) ( not ( = ?auto_678954 ?auto_678960 ) ) ( not ( = ?auto_678954 ?auto_678961 ) ) ( not ( = ?auto_678954 ?auto_678962 ) ) ( not ( = ?auto_678954 ?auto_678963 ) ) ( not ( = ?auto_678954 ?auto_678964 ) ) ( not ( = ?auto_678954 ?auto_678965 ) ) ( not ( = ?auto_678954 ?auto_678966 ) ) ( not ( = ?auto_678955 ?auto_678956 ) ) ( not ( = ?auto_678955 ?auto_678957 ) ) ( not ( = ?auto_678955 ?auto_678958 ) ) ( not ( = ?auto_678955 ?auto_678959 ) ) ( not ( = ?auto_678955 ?auto_678960 ) ) ( not ( = ?auto_678955 ?auto_678961 ) ) ( not ( = ?auto_678955 ?auto_678962 ) ) ( not ( = ?auto_678955 ?auto_678963 ) ) ( not ( = ?auto_678955 ?auto_678964 ) ) ( not ( = ?auto_678955 ?auto_678965 ) ) ( not ( = ?auto_678955 ?auto_678966 ) ) ( not ( = ?auto_678956 ?auto_678957 ) ) ( not ( = ?auto_678956 ?auto_678958 ) ) ( not ( = ?auto_678956 ?auto_678959 ) ) ( not ( = ?auto_678956 ?auto_678960 ) ) ( not ( = ?auto_678956 ?auto_678961 ) ) ( not ( = ?auto_678956 ?auto_678962 ) ) ( not ( = ?auto_678956 ?auto_678963 ) ) ( not ( = ?auto_678956 ?auto_678964 ) ) ( not ( = ?auto_678956 ?auto_678965 ) ) ( not ( = ?auto_678956 ?auto_678966 ) ) ( not ( = ?auto_678957 ?auto_678958 ) ) ( not ( = ?auto_678957 ?auto_678959 ) ) ( not ( = ?auto_678957 ?auto_678960 ) ) ( not ( = ?auto_678957 ?auto_678961 ) ) ( not ( = ?auto_678957 ?auto_678962 ) ) ( not ( = ?auto_678957 ?auto_678963 ) ) ( not ( = ?auto_678957 ?auto_678964 ) ) ( not ( = ?auto_678957 ?auto_678965 ) ) ( not ( = ?auto_678957 ?auto_678966 ) ) ( not ( = ?auto_678958 ?auto_678959 ) ) ( not ( = ?auto_678958 ?auto_678960 ) ) ( not ( = ?auto_678958 ?auto_678961 ) ) ( not ( = ?auto_678958 ?auto_678962 ) ) ( not ( = ?auto_678958 ?auto_678963 ) ) ( not ( = ?auto_678958 ?auto_678964 ) ) ( not ( = ?auto_678958 ?auto_678965 ) ) ( not ( = ?auto_678958 ?auto_678966 ) ) ( not ( = ?auto_678959 ?auto_678960 ) ) ( not ( = ?auto_678959 ?auto_678961 ) ) ( not ( = ?auto_678959 ?auto_678962 ) ) ( not ( = ?auto_678959 ?auto_678963 ) ) ( not ( = ?auto_678959 ?auto_678964 ) ) ( not ( = ?auto_678959 ?auto_678965 ) ) ( not ( = ?auto_678959 ?auto_678966 ) ) ( not ( = ?auto_678960 ?auto_678961 ) ) ( not ( = ?auto_678960 ?auto_678962 ) ) ( not ( = ?auto_678960 ?auto_678963 ) ) ( not ( = ?auto_678960 ?auto_678964 ) ) ( not ( = ?auto_678960 ?auto_678965 ) ) ( not ( = ?auto_678960 ?auto_678966 ) ) ( not ( = ?auto_678961 ?auto_678962 ) ) ( not ( = ?auto_678961 ?auto_678963 ) ) ( not ( = ?auto_678961 ?auto_678964 ) ) ( not ( = ?auto_678961 ?auto_678965 ) ) ( not ( = ?auto_678961 ?auto_678966 ) ) ( not ( = ?auto_678962 ?auto_678963 ) ) ( not ( = ?auto_678962 ?auto_678964 ) ) ( not ( = ?auto_678962 ?auto_678965 ) ) ( not ( = ?auto_678962 ?auto_678966 ) ) ( not ( = ?auto_678963 ?auto_678964 ) ) ( not ( = ?auto_678963 ?auto_678965 ) ) ( not ( = ?auto_678963 ?auto_678966 ) ) ( not ( = ?auto_678964 ?auto_678965 ) ) ( not ( = ?auto_678964 ?auto_678966 ) ) ( not ( = ?auto_678965 ?auto_678966 ) ) ( ON ?auto_678965 ?auto_678966 ) ( CLEAR ?auto_678963 ) ( ON ?auto_678964 ?auto_678965 ) ( CLEAR ?auto_678964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_678950 ?auto_678951 ?auto_678952 ?auto_678953 ?auto_678954 ?auto_678955 ?auto_678956 ?auto_678957 ?auto_678958 ?auto_678959 ?auto_678960 ?auto_678961 ?auto_678962 ?auto_678963 ?auto_678964 )
      ( MAKE-17PILE ?auto_678950 ?auto_678951 ?auto_678952 ?auto_678953 ?auto_678954 ?auto_678955 ?auto_678956 ?auto_678957 ?auto_678958 ?auto_678959 ?auto_678960 ?auto_678961 ?auto_678962 ?auto_678963 ?auto_678964 ?auto_678965 ?auto_678966 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_678984 - BLOCK
      ?auto_678985 - BLOCK
      ?auto_678986 - BLOCK
      ?auto_678987 - BLOCK
      ?auto_678988 - BLOCK
      ?auto_678989 - BLOCK
      ?auto_678990 - BLOCK
      ?auto_678991 - BLOCK
      ?auto_678992 - BLOCK
      ?auto_678993 - BLOCK
      ?auto_678994 - BLOCK
      ?auto_678995 - BLOCK
      ?auto_678996 - BLOCK
      ?auto_678997 - BLOCK
      ?auto_678998 - BLOCK
      ?auto_678999 - BLOCK
      ?auto_679000 - BLOCK
    )
    :vars
    (
      ?auto_679001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679000 ?auto_679001 ) ( ON-TABLE ?auto_678984 ) ( ON ?auto_678985 ?auto_678984 ) ( ON ?auto_678986 ?auto_678985 ) ( ON ?auto_678987 ?auto_678986 ) ( ON ?auto_678988 ?auto_678987 ) ( ON ?auto_678989 ?auto_678988 ) ( ON ?auto_678990 ?auto_678989 ) ( ON ?auto_678991 ?auto_678990 ) ( ON ?auto_678992 ?auto_678991 ) ( ON ?auto_678993 ?auto_678992 ) ( ON ?auto_678994 ?auto_678993 ) ( ON ?auto_678995 ?auto_678994 ) ( ON ?auto_678996 ?auto_678995 ) ( not ( = ?auto_678984 ?auto_678985 ) ) ( not ( = ?auto_678984 ?auto_678986 ) ) ( not ( = ?auto_678984 ?auto_678987 ) ) ( not ( = ?auto_678984 ?auto_678988 ) ) ( not ( = ?auto_678984 ?auto_678989 ) ) ( not ( = ?auto_678984 ?auto_678990 ) ) ( not ( = ?auto_678984 ?auto_678991 ) ) ( not ( = ?auto_678984 ?auto_678992 ) ) ( not ( = ?auto_678984 ?auto_678993 ) ) ( not ( = ?auto_678984 ?auto_678994 ) ) ( not ( = ?auto_678984 ?auto_678995 ) ) ( not ( = ?auto_678984 ?auto_678996 ) ) ( not ( = ?auto_678984 ?auto_678997 ) ) ( not ( = ?auto_678984 ?auto_678998 ) ) ( not ( = ?auto_678984 ?auto_678999 ) ) ( not ( = ?auto_678984 ?auto_679000 ) ) ( not ( = ?auto_678984 ?auto_679001 ) ) ( not ( = ?auto_678985 ?auto_678986 ) ) ( not ( = ?auto_678985 ?auto_678987 ) ) ( not ( = ?auto_678985 ?auto_678988 ) ) ( not ( = ?auto_678985 ?auto_678989 ) ) ( not ( = ?auto_678985 ?auto_678990 ) ) ( not ( = ?auto_678985 ?auto_678991 ) ) ( not ( = ?auto_678985 ?auto_678992 ) ) ( not ( = ?auto_678985 ?auto_678993 ) ) ( not ( = ?auto_678985 ?auto_678994 ) ) ( not ( = ?auto_678985 ?auto_678995 ) ) ( not ( = ?auto_678985 ?auto_678996 ) ) ( not ( = ?auto_678985 ?auto_678997 ) ) ( not ( = ?auto_678985 ?auto_678998 ) ) ( not ( = ?auto_678985 ?auto_678999 ) ) ( not ( = ?auto_678985 ?auto_679000 ) ) ( not ( = ?auto_678985 ?auto_679001 ) ) ( not ( = ?auto_678986 ?auto_678987 ) ) ( not ( = ?auto_678986 ?auto_678988 ) ) ( not ( = ?auto_678986 ?auto_678989 ) ) ( not ( = ?auto_678986 ?auto_678990 ) ) ( not ( = ?auto_678986 ?auto_678991 ) ) ( not ( = ?auto_678986 ?auto_678992 ) ) ( not ( = ?auto_678986 ?auto_678993 ) ) ( not ( = ?auto_678986 ?auto_678994 ) ) ( not ( = ?auto_678986 ?auto_678995 ) ) ( not ( = ?auto_678986 ?auto_678996 ) ) ( not ( = ?auto_678986 ?auto_678997 ) ) ( not ( = ?auto_678986 ?auto_678998 ) ) ( not ( = ?auto_678986 ?auto_678999 ) ) ( not ( = ?auto_678986 ?auto_679000 ) ) ( not ( = ?auto_678986 ?auto_679001 ) ) ( not ( = ?auto_678987 ?auto_678988 ) ) ( not ( = ?auto_678987 ?auto_678989 ) ) ( not ( = ?auto_678987 ?auto_678990 ) ) ( not ( = ?auto_678987 ?auto_678991 ) ) ( not ( = ?auto_678987 ?auto_678992 ) ) ( not ( = ?auto_678987 ?auto_678993 ) ) ( not ( = ?auto_678987 ?auto_678994 ) ) ( not ( = ?auto_678987 ?auto_678995 ) ) ( not ( = ?auto_678987 ?auto_678996 ) ) ( not ( = ?auto_678987 ?auto_678997 ) ) ( not ( = ?auto_678987 ?auto_678998 ) ) ( not ( = ?auto_678987 ?auto_678999 ) ) ( not ( = ?auto_678987 ?auto_679000 ) ) ( not ( = ?auto_678987 ?auto_679001 ) ) ( not ( = ?auto_678988 ?auto_678989 ) ) ( not ( = ?auto_678988 ?auto_678990 ) ) ( not ( = ?auto_678988 ?auto_678991 ) ) ( not ( = ?auto_678988 ?auto_678992 ) ) ( not ( = ?auto_678988 ?auto_678993 ) ) ( not ( = ?auto_678988 ?auto_678994 ) ) ( not ( = ?auto_678988 ?auto_678995 ) ) ( not ( = ?auto_678988 ?auto_678996 ) ) ( not ( = ?auto_678988 ?auto_678997 ) ) ( not ( = ?auto_678988 ?auto_678998 ) ) ( not ( = ?auto_678988 ?auto_678999 ) ) ( not ( = ?auto_678988 ?auto_679000 ) ) ( not ( = ?auto_678988 ?auto_679001 ) ) ( not ( = ?auto_678989 ?auto_678990 ) ) ( not ( = ?auto_678989 ?auto_678991 ) ) ( not ( = ?auto_678989 ?auto_678992 ) ) ( not ( = ?auto_678989 ?auto_678993 ) ) ( not ( = ?auto_678989 ?auto_678994 ) ) ( not ( = ?auto_678989 ?auto_678995 ) ) ( not ( = ?auto_678989 ?auto_678996 ) ) ( not ( = ?auto_678989 ?auto_678997 ) ) ( not ( = ?auto_678989 ?auto_678998 ) ) ( not ( = ?auto_678989 ?auto_678999 ) ) ( not ( = ?auto_678989 ?auto_679000 ) ) ( not ( = ?auto_678989 ?auto_679001 ) ) ( not ( = ?auto_678990 ?auto_678991 ) ) ( not ( = ?auto_678990 ?auto_678992 ) ) ( not ( = ?auto_678990 ?auto_678993 ) ) ( not ( = ?auto_678990 ?auto_678994 ) ) ( not ( = ?auto_678990 ?auto_678995 ) ) ( not ( = ?auto_678990 ?auto_678996 ) ) ( not ( = ?auto_678990 ?auto_678997 ) ) ( not ( = ?auto_678990 ?auto_678998 ) ) ( not ( = ?auto_678990 ?auto_678999 ) ) ( not ( = ?auto_678990 ?auto_679000 ) ) ( not ( = ?auto_678990 ?auto_679001 ) ) ( not ( = ?auto_678991 ?auto_678992 ) ) ( not ( = ?auto_678991 ?auto_678993 ) ) ( not ( = ?auto_678991 ?auto_678994 ) ) ( not ( = ?auto_678991 ?auto_678995 ) ) ( not ( = ?auto_678991 ?auto_678996 ) ) ( not ( = ?auto_678991 ?auto_678997 ) ) ( not ( = ?auto_678991 ?auto_678998 ) ) ( not ( = ?auto_678991 ?auto_678999 ) ) ( not ( = ?auto_678991 ?auto_679000 ) ) ( not ( = ?auto_678991 ?auto_679001 ) ) ( not ( = ?auto_678992 ?auto_678993 ) ) ( not ( = ?auto_678992 ?auto_678994 ) ) ( not ( = ?auto_678992 ?auto_678995 ) ) ( not ( = ?auto_678992 ?auto_678996 ) ) ( not ( = ?auto_678992 ?auto_678997 ) ) ( not ( = ?auto_678992 ?auto_678998 ) ) ( not ( = ?auto_678992 ?auto_678999 ) ) ( not ( = ?auto_678992 ?auto_679000 ) ) ( not ( = ?auto_678992 ?auto_679001 ) ) ( not ( = ?auto_678993 ?auto_678994 ) ) ( not ( = ?auto_678993 ?auto_678995 ) ) ( not ( = ?auto_678993 ?auto_678996 ) ) ( not ( = ?auto_678993 ?auto_678997 ) ) ( not ( = ?auto_678993 ?auto_678998 ) ) ( not ( = ?auto_678993 ?auto_678999 ) ) ( not ( = ?auto_678993 ?auto_679000 ) ) ( not ( = ?auto_678993 ?auto_679001 ) ) ( not ( = ?auto_678994 ?auto_678995 ) ) ( not ( = ?auto_678994 ?auto_678996 ) ) ( not ( = ?auto_678994 ?auto_678997 ) ) ( not ( = ?auto_678994 ?auto_678998 ) ) ( not ( = ?auto_678994 ?auto_678999 ) ) ( not ( = ?auto_678994 ?auto_679000 ) ) ( not ( = ?auto_678994 ?auto_679001 ) ) ( not ( = ?auto_678995 ?auto_678996 ) ) ( not ( = ?auto_678995 ?auto_678997 ) ) ( not ( = ?auto_678995 ?auto_678998 ) ) ( not ( = ?auto_678995 ?auto_678999 ) ) ( not ( = ?auto_678995 ?auto_679000 ) ) ( not ( = ?auto_678995 ?auto_679001 ) ) ( not ( = ?auto_678996 ?auto_678997 ) ) ( not ( = ?auto_678996 ?auto_678998 ) ) ( not ( = ?auto_678996 ?auto_678999 ) ) ( not ( = ?auto_678996 ?auto_679000 ) ) ( not ( = ?auto_678996 ?auto_679001 ) ) ( not ( = ?auto_678997 ?auto_678998 ) ) ( not ( = ?auto_678997 ?auto_678999 ) ) ( not ( = ?auto_678997 ?auto_679000 ) ) ( not ( = ?auto_678997 ?auto_679001 ) ) ( not ( = ?auto_678998 ?auto_678999 ) ) ( not ( = ?auto_678998 ?auto_679000 ) ) ( not ( = ?auto_678998 ?auto_679001 ) ) ( not ( = ?auto_678999 ?auto_679000 ) ) ( not ( = ?auto_678999 ?auto_679001 ) ) ( not ( = ?auto_679000 ?auto_679001 ) ) ( ON ?auto_678999 ?auto_679000 ) ( ON ?auto_678998 ?auto_678999 ) ( CLEAR ?auto_678996 ) ( ON ?auto_678997 ?auto_678998 ) ( CLEAR ?auto_678997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_678984 ?auto_678985 ?auto_678986 ?auto_678987 ?auto_678988 ?auto_678989 ?auto_678990 ?auto_678991 ?auto_678992 ?auto_678993 ?auto_678994 ?auto_678995 ?auto_678996 ?auto_678997 )
      ( MAKE-17PILE ?auto_678984 ?auto_678985 ?auto_678986 ?auto_678987 ?auto_678988 ?auto_678989 ?auto_678990 ?auto_678991 ?auto_678992 ?auto_678993 ?auto_678994 ?auto_678995 ?auto_678996 ?auto_678997 ?auto_678998 ?auto_678999 ?auto_679000 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679019 - BLOCK
      ?auto_679020 - BLOCK
      ?auto_679021 - BLOCK
      ?auto_679022 - BLOCK
      ?auto_679023 - BLOCK
      ?auto_679024 - BLOCK
      ?auto_679025 - BLOCK
      ?auto_679026 - BLOCK
      ?auto_679027 - BLOCK
      ?auto_679028 - BLOCK
      ?auto_679029 - BLOCK
      ?auto_679030 - BLOCK
      ?auto_679031 - BLOCK
      ?auto_679032 - BLOCK
      ?auto_679033 - BLOCK
      ?auto_679034 - BLOCK
      ?auto_679035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679035 ) ( ON-TABLE ?auto_679019 ) ( ON ?auto_679020 ?auto_679019 ) ( ON ?auto_679021 ?auto_679020 ) ( ON ?auto_679022 ?auto_679021 ) ( ON ?auto_679023 ?auto_679022 ) ( ON ?auto_679024 ?auto_679023 ) ( ON ?auto_679025 ?auto_679024 ) ( ON ?auto_679026 ?auto_679025 ) ( ON ?auto_679027 ?auto_679026 ) ( ON ?auto_679028 ?auto_679027 ) ( ON ?auto_679029 ?auto_679028 ) ( ON ?auto_679030 ?auto_679029 ) ( ON ?auto_679031 ?auto_679030 ) ( not ( = ?auto_679019 ?auto_679020 ) ) ( not ( = ?auto_679019 ?auto_679021 ) ) ( not ( = ?auto_679019 ?auto_679022 ) ) ( not ( = ?auto_679019 ?auto_679023 ) ) ( not ( = ?auto_679019 ?auto_679024 ) ) ( not ( = ?auto_679019 ?auto_679025 ) ) ( not ( = ?auto_679019 ?auto_679026 ) ) ( not ( = ?auto_679019 ?auto_679027 ) ) ( not ( = ?auto_679019 ?auto_679028 ) ) ( not ( = ?auto_679019 ?auto_679029 ) ) ( not ( = ?auto_679019 ?auto_679030 ) ) ( not ( = ?auto_679019 ?auto_679031 ) ) ( not ( = ?auto_679019 ?auto_679032 ) ) ( not ( = ?auto_679019 ?auto_679033 ) ) ( not ( = ?auto_679019 ?auto_679034 ) ) ( not ( = ?auto_679019 ?auto_679035 ) ) ( not ( = ?auto_679020 ?auto_679021 ) ) ( not ( = ?auto_679020 ?auto_679022 ) ) ( not ( = ?auto_679020 ?auto_679023 ) ) ( not ( = ?auto_679020 ?auto_679024 ) ) ( not ( = ?auto_679020 ?auto_679025 ) ) ( not ( = ?auto_679020 ?auto_679026 ) ) ( not ( = ?auto_679020 ?auto_679027 ) ) ( not ( = ?auto_679020 ?auto_679028 ) ) ( not ( = ?auto_679020 ?auto_679029 ) ) ( not ( = ?auto_679020 ?auto_679030 ) ) ( not ( = ?auto_679020 ?auto_679031 ) ) ( not ( = ?auto_679020 ?auto_679032 ) ) ( not ( = ?auto_679020 ?auto_679033 ) ) ( not ( = ?auto_679020 ?auto_679034 ) ) ( not ( = ?auto_679020 ?auto_679035 ) ) ( not ( = ?auto_679021 ?auto_679022 ) ) ( not ( = ?auto_679021 ?auto_679023 ) ) ( not ( = ?auto_679021 ?auto_679024 ) ) ( not ( = ?auto_679021 ?auto_679025 ) ) ( not ( = ?auto_679021 ?auto_679026 ) ) ( not ( = ?auto_679021 ?auto_679027 ) ) ( not ( = ?auto_679021 ?auto_679028 ) ) ( not ( = ?auto_679021 ?auto_679029 ) ) ( not ( = ?auto_679021 ?auto_679030 ) ) ( not ( = ?auto_679021 ?auto_679031 ) ) ( not ( = ?auto_679021 ?auto_679032 ) ) ( not ( = ?auto_679021 ?auto_679033 ) ) ( not ( = ?auto_679021 ?auto_679034 ) ) ( not ( = ?auto_679021 ?auto_679035 ) ) ( not ( = ?auto_679022 ?auto_679023 ) ) ( not ( = ?auto_679022 ?auto_679024 ) ) ( not ( = ?auto_679022 ?auto_679025 ) ) ( not ( = ?auto_679022 ?auto_679026 ) ) ( not ( = ?auto_679022 ?auto_679027 ) ) ( not ( = ?auto_679022 ?auto_679028 ) ) ( not ( = ?auto_679022 ?auto_679029 ) ) ( not ( = ?auto_679022 ?auto_679030 ) ) ( not ( = ?auto_679022 ?auto_679031 ) ) ( not ( = ?auto_679022 ?auto_679032 ) ) ( not ( = ?auto_679022 ?auto_679033 ) ) ( not ( = ?auto_679022 ?auto_679034 ) ) ( not ( = ?auto_679022 ?auto_679035 ) ) ( not ( = ?auto_679023 ?auto_679024 ) ) ( not ( = ?auto_679023 ?auto_679025 ) ) ( not ( = ?auto_679023 ?auto_679026 ) ) ( not ( = ?auto_679023 ?auto_679027 ) ) ( not ( = ?auto_679023 ?auto_679028 ) ) ( not ( = ?auto_679023 ?auto_679029 ) ) ( not ( = ?auto_679023 ?auto_679030 ) ) ( not ( = ?auto_679023 ?auto_679031 ) ) ( not ( = ?auto_679023 ?auto_679032 ) ) ( not ( = ?auto_679023 ?auto_679033 ) ) ( not ( = ?auto_679023 ?auto_679034 ) ) ( not ( = ?auto_679023 ?auto_679035 ) ) ( not ( = ?auto_679024 ?auto_679025 ) ) ( not ( = ?auto_679024 ?auto_679026 ) ) ( not ( = ?auto_679024 ?auto_679027 ) ) ( not ( = ?auto_679024 ?auto_679028 ) ) ( not ( = ?auto_679024 ?auto_679029 ) ) ( not ( = ?auto_679024 ?auto_679030 ) ) ( not ( = ?auto_679024 ?auto_679031 ) ) ( not ( = ?auto_679024 ?auto_679032 ) ) ( not ( = ?auto_679024 ?auto_679033 ) ) ( not ( = ?auto_679024 ?auto_679034 ) ) ( not ( = ?auto_679024 ?auto_679035 ) ) ( not ( = ?auto_679025 ?auto_679026 ) ) ( not ( = ?auto_679025 ?auto_679027 ) ) ( not ( = ?auto_679025 ?auto_679028 ) ) ( not ( = ?auto_679025 ?auto_679029 ) ) ( not ( = ?auto_679025 ?auto_679030 ) ) ( not ( = ?auto_679025 ?auto_679031 ) ) ( not ( = ?auto_679025 ?auto_679032 ) ) ( not ( = ?auto_679025 ?auto_679033 ) ) ( not ( = ?auto_679025 ?auto_679034 ) ) ( not ( = ?auto_679025 ?auto_679035 ) ) ( not ( = ?auto_679026 ?auto_679027 ) ) ( not ( = ?auto_679026 ?auto_679028 ) ) ( not ( = ?auto_679026 ?auto_679029 ) ) ( not ( = ?auto_679026 ?auto_679030 ) ) ( not ( = ?auto_679026 ?auto_679031 ) ) ( not ( = ?auto_679026 ?auto_679032 ) ) ( not ( = ?auto_679026 ?auto_679033 ) ) ( not ( = ?auto_679026 ?auto_679034 ) ) ( not ( = ?auto_679026 ?auto_679035 ) ) ( not ( = ?auto_679027 ?auto_679028 ) ) ( not ( = ?auto_679027 ?auto_679029 ) ) ( not ( = ?auto_679027 ?auto_679030 ) ) ( not ( = ?auto_679027 ?auto_679031 ) ) ( not ( = ?auto_679027 ?auto_679032 ) ) ( not ( = ?auto_679027 ?auto_679033 ) ) ( not ( = ?auto_679027 ?auto_679034 ) ) ( not ( = ?auto_679027 ?auto_679035 ) ) ( not ( = ?auto_679028 ?auto_679029 ) ) ( not ( = ?auto_679028 ?auto_679030 ) ) ( not ( = ?auto_679028 ?auto_679031 ) ) ( not ( = ?auto_679028 ?auto_679032 ) ) ( not ( = ?auto_679028 ?auto_679033 ) ) ( not ( = ?auto_679028 ?auto_679034 ) ) ( not ( = ?auto_679028 ?auto_679035 ) ) ( not ( = ?auto_679029 ?auto_679030 ) ) ( not ( = ?auto_679029 ?auto_679031 ) ) ( not ( = ?auto_679029 ?auto_679032 ) ) ( not ( = ?auto_679029 ?auto_679033 ) ) ( not ( = ?auto_679029 ?auto_679034 ) ) ( not ( = ?auto_679029 ?auto_679035 ) ) ( not ( = ?auto_679030 ?auto_679031 ) ) ( not ( = ?auto_679030 ?auto_679032 ) ) ( not ( = ?auto_679030 ?auto_679033 ) ) ( not ( = ?auto_679030 ?auto_679034 ) ) ( not ( = ?auto_679030 ?auto_679035 ) ) ( not ( = ?auto_679031 ?auto_679032 ) ) ( not ( = ?auto_679031 ?auto_679033 ) ) ( not ( = ?auto_679031 ?auto_679034 ) ) ( not ( = ?auto_679031 ?auto_679035 ) ) ( not ( = ?auto_679032 ?auto_679033 ) ) ( not ( = ?auto_679032 ?auto_679034 ) ) ( not ( = ?auto_679032 ?auto_679035 ) ) ( not ( = ?auto_679033 ?auto_679034 ) ) ( not ( = ?auto_679033 ?auto_679035 ) ) ( not ( = ?auto_679034 ?auto_679035 ) ) ( ON ?auto_679034 ?auto_679035 ) ( ON ?auto_679033 ?auto_679034 ) ( CLEAR ?auto_679031 ) ( ON ?auto_679032 ?auto_679033 ) ( CLEAR ?auto_679032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_679019 ?auto_679020 ?auto_679021 ?auto_679022 ?auto_679023 ?auto_679024 ?auto_679025 ?auto_679026 ?auto_679027 ?auto_679028 ?auto_679029 ?auto_679030 ?auto_679031 ?auto_679032 )
      ( MAKE-17PILE ?auto_679019 ?auto_679020 ?auto_679021 ?auto_679022 ?auto_679023 ?auto_679024 ?auto_679025 ?auto_679026 ?auto_679027 ?auto_679028 ?auto_679029 ?auto_679030 ?auto_679031 ?auto_679032 ?auto_679033 ?auto_679034 ?auto_679035 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679053 - BLOCK
      ?auto_679054 - BLOCK
      ?auto_679055 - BLOCK
      ?auto_679056 - BLOCK
      ?auto_679057 - BLOCK
      ?auto_679058 - BLOCK
      ?auto_679059 - BLOCK
      ?auto_679060 - BLOCK
      ?auto_679061 - BLOCK
      ?auto_679062 - BLOCK
      ?auto_679063 - BLOCK
      ?auto_679064 - BLOCK
      ?auto_679065 - BLOCK
      ?auto_679066 - BLOCK
      ?auto_679067 - BLOCK
      ?auto_679068 - BLOCK
      ?auto_679069 - BLOCK
    )
    :vars
    (
      ?auto_679070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679069 ?auto_679070 ) ( ON-TABLE ?auto_679053 ) ( ON ?auto_679054 ?auto_679053 ) ( ON ?auto_679055 ?auto_679054 ) ( ON ?auto_679056 ?auto_679055 ) ( ON ?auto_679057 ?auto_679056 ) ( ON ?auto_679058 ?auto_679057 ) ( ON ?auto_679059 ?auto_679058 ) ( ON ?auto_679060 ?auto_679059 ) ( ON ?auto_679061 ?auto_679060 ) ( ON ?auto_679062 ?auto_679061 ) ( ON ?auto_679063 ?auto_679062 ) ( ON ?auto_679064 ?auto_679063 ) ( not ( = ?auto_679053 ?auto_679054 ) ) ( not ( = ?auto_679053 ?auto_679055 ) ) ( not ( = ?auto_679053 ?auto_679056 ) ) ( not ( = ?auto_679053 ?auto_679057 ) ) ( not ( = ?auto_679053 ?auto_679058 ) ) ( not ( = ?auto_679053 ?auto_679059 ) ) ( not ( = ?auto_679053 ?auto_679060 ) ) ( not ( = ?auto_679053 ?auto_679061 ) ) ( not ( = ?auto_679053 ?auto_679062 ) ) ( not ( = ?auto_679053 ?auto_679063 ) ) ( not ( = ?auto_679053 ?auto_679064 ) ) ( not ( = ?auto_679053 ?auto_679065 ) ) ( not ( = ?auto_679053 ?auto_679066 ) ) ( not ( = ?auto_679053 ?auto_679067 ) ) ( not ( = ?auto_679053 ?auto_679068 ) ) ( not ( = ?auto_679053 ?auto_679069 ) ) ( not ( = ?auto_679053 ?auto_679070 ) ) ( not ( = ?auto_679054 ?auto_679055 ) ) ( not ( = ?auto_679054 ?auto_679056 ) ) ( not ( = ?auto_679054 ?auto_679057 ) ) ( not ( = ?auto_679054 ?auto_679058 ) ) ( not ( = ?auto_679054 ?auto_679059 ) ) ( not ( = ?auto_679054 ?auto_679060 ) ) ( not ( = ?auto_679054 ?auto_679061 ) ) ( not ( = ?auto_679054 ?auto_679062 ) ) ( not ( = ?auto_679054 ?auto_679063 ) ) ( not ( = ?auto_679054 ?auto_679064 ) ) ( not ( = ?auto_679054 ?auto_679065 ) ) ( not ( = ?auto_679054 ?auto_679066 ) ) ( not ( = ?auto_679054 ?auto_679067 ) ) ( not ( = ?auto_679054 ?auto_679068 ) ) ( not ( = ?auto_679054 ?auto_679069 ) ) ( not ( = ?auto_679054 ?auto_679070 ) ) ( not ( = ?auto_679055 ?auto_679056 ) ) ( not ( = ?auto_679055 ?auto_679057 ) ) ( not ( = ?auto_679055 ?auto_679058 ) ) ( not ( = ?auto_679055 ?auto_679059 ) ) ( not ( = ?auto_679055 ?auto_679060 ) ) ( not ( = ?auto_679055 ?auto_679061 ) ) ( not ( = ?auto_679055 ?auto_679062 ) ) ( not ( = ?auto_679055 ?auto_679063 ) ) ( not ( = ?auto_679055 ?auto_679064 ) ) ( not ( = ?auto_679055 ?auto_679065 ) ) ( not ( = ?auto_679055 ?auto_679066 ) ) ( not ( = ?auto_679055 ?auto_679067 ) ) ( not ( = ?auto_679055 ?auto_679068 ) ) ( not ( = ?auto_679055 ?auto_679069 ) ) ( not ( = ?auto_679055 ?auto_679070 ) ) ( not ( = ?auto_679056 ?auto_679057 ) ) ( not ( = ?auto_679056 ?auto_679058 ) ) ( not ( = ?auto_679056 ?auto_679059 ) ) ( not ( = ?auto_679056 ?auto_679060 ) ) ( not ( = ?auto_679056 ?auto_679061 ) ) ( not ( = ?auto_679056 ?auto_679062 ) ) ( not ( = ?auto_679056 ?auto_679063 ) ) ( not ( = ?auto_679056 ?auto_679064 ) ) ( not ( = ?auto_679056 ?auto_679065 ) ) ( not ( = ?auto_679056 ?auto_679066 ) ) ( not ( = ?auto_679056 ?auto_679067 ) ) ( not ( = ?auto_679056 ?auto_679068 ) ) ( not ( = ?auto_679056 ?auto_679069 ) ) ( not ( = ?auto_679056 ?auto_679070 ) ) ( not ( = ?auto_679057 ?auto_679058 ) ) ( not ( = ?auto_679057 ?auto_679059 ) ) ( not ( = ?auto_679057 ?auto_679060 ) ) ( not ( = ?auto_679057 ?auto_679061 ) ) ( not ( = ?auto_679057 ?auto_679062 ) ) ( not ( = ?auto_679057 ?auto_679063 ) ) ( not ( = ?auto_679057 ?auto_679064 ) ) ( not ( = ?auto_679057 ?auto_679065 ) ) ( not ( = ?auto_679057 ?auto_679066 ) ) ( not ( = ?auto_679057 ?auto_679067 ) ) ( not ( = ?auto_679057 ?auto_679068 ) ) ( not ( = ?auto_679057 ?auto_679069 ) ) ( not ( = ?auto_679057 ?auto_679070 ) ) ( not ( = ?auto_679058 ?auto_679059 ) ) ( not ( = ?auto_679058 ?auto_679060 ) ) ( not ( = ?auto_679058 ?auto_679061 ) ) ( not ( = ?auto_679058 ?auto_679062 ) ) ( not ( = ?auto_679058 ?auto_679063 ) ) ( not ( = ?auto_679058 ?auto_679064 ) ) ( not ( = ?auto_679058 ?auto_679065 ) ) ( not ( = ?auto_679058 ?auto_679066 ) ) ( not ( = ?auto_679058 ?auto_679067 ) ) ( not ( = ?auto_679058 ?auto_679068 ) ) ( not ( = ?auto_679058 ?auto_679069 ) ) ( not ( = ?auto_679058 ?auto_679070 ) ) ( not ( = ?auto_679059 ?auto_679060 ) ) ( not ( = ?auto_679059 ?auto_679061 ) ) ( not ( = ?auto_679059 ?auto_679062 ) ) ( not ( = ?auto_679059 ?auto_679063 ) ) ( not ( = ?auto_679059 ?auto_679064 ) ) ( not ( = ?auto_679059 ?auto_679065 ) ) ( not ( = ?auto_679059 ?auto_679066 ) ) ( not ( = ?auto_679059 ?auto_679067 ) ) ( not ( = ?auto_679059 ?auto_679068 ) ) ( not ( = ?auto_679059 ?auto_679069 ) ) ( not ( = ?auto_679059 ?auto_679070 ) ) ( not ( = ?auto_679060 ?auto_679061 ) ) ( not ( = ?auto_679060 ?auto_679062 ) ) ( not ( = ?auto_679060 ?auto_679063 ) ) ( not ( = ?auto_679060 ?auto_679064 ) ) ( not ( = ?auto_679060 ?auto_679065 ) ) ( not ( = ?auto_679060 ?auto_679066 ) ) ( not ( = ?auto_679060 ?auto_679067 ) ) ( not ( = ?auto_679060 ?auto_679068 ) ) ( not ( = ?auto_679060 ?auto_679069 ) ) ( not ( = ?auto_679060 ?auto_679070 ) ) ( not ( = ?auto_679061 ?auto_679062 ) ) ( not ( = ?auto_679061 ?auto_679063 ) ) ( not ( = ?auto_679061 ?auto_679064 ) ) ( not ( = ?auto_679061 ?auto_679065 ) ) ( not ( = ?auto_679061 ?auto_679066 ) ) ( not ( = ?auto_679061 ?auto_679067 ) ) ( not ( = ?auto_679061 ?auto_679068 ) ) ( not ( = ?auto_679061 ?auto_679069 ) ) ( not ( = ?auto_679061 ?auto_679070 ) ) ( not ( = ?auto_679062 ?auto_679063 ) ) ( not ( = ?auto_679062 ?auto_679064 ) ) ( not ( = ?auto_679062 ?auto_679065 ) ) ( not ( = ?auto_679062 ?auto_679066 ) ) ( not ( = ?auto_679062 ?auto_679067 ) ) ( not ( = ?auto_679062 ?auto_679068 ) ) ( not ( = ?auto_679062 ?auto_679069 ) ) ( not ( = ?auto_679062 ?auto_679070 ) ) ( not ( = ?auto_679063 ?auto_679064 ) ) ( not ( = ?auto_679063 ?auto_679065 ) ) ( not ( = ?auto_679063 ?auto_679066 ) ) ( not ( = ?auto_679063 ?auto_679067 ) ) ( not ( = ?auto_679063 ?auto_679068 ) ) ( not ( = ?auto_679063 ?auto_679069 ) ) ( not ( = ?auto_679063 ?auto_679070 ) ) ( not ( = ?auto_679064 ?auto_679065 ) ) ( not ( = ?auto_679064 ?auto_679066 ) ) ( not ( = ?auto_679064 ?auto_679067 ) ) ( not ( = ?auto_679064 ?auto_679068 ) ) ( not ( = ?auto_679064 ?auto_679069 ) ) ( not ( = ?auto_679064 ?auto_679070 ) ) ( not ( = ?auto_679065 ?auto_679066 ) ) ( not ( = ?auto_679065 ?auto_679067 ) ) ( not ( = ?auto_679065 ?auto_679068 ) ) ( not ( = ?auto_679065 ?auto_679069 ) ) ( not ( = ?auto_679065 ?auto_679070 ) ) ( not ( = ?auto_679066 ?auto_679067 ) ) ( not ( = ?auto_679066 ?auto_679068 ) ) ( not ( = ?auto_679066 ?auto_679069 ) ) ( not ( = ?auto_679066 ?auto_679070 ) ) ( not ( = ?auto_679067 ?auto_679068 ) ) ( not ( = ?auto_679067 ?auto_679069 ) ) ( not ( = ?auto_679067 ?auto_679070 ) ) ( not ( = ?auto_679068 ?auto_679069 ) ) ( not ( = ?auto_679068 ?auto_679070 ) ) ( not ( = ?auto_679069 ?auto_679070 ) ) ( ON ?auto_679068 ?auto_679069 ) ( ON ?auto_679067 ?auto_679068 ) ( ON ?auto_679066 ?auto_679067 ) ( CLEAR ?auto_679064 ) ( ON ?auto_679065 ?auto_679066 ) ( CLEAR ?auto_679065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_679053 ?auto_679054 ?auto_679055 ?auto_679056 ?auto_679057 ?auto_679058 ?auto_679059 ?auto_679060 ?auto_679061 ?auto_679062 ?auto_679063 ?auto_679064 ?auto_679065 )
      ( MAKE-17PILE ?auto_679053 ?auto_679054 ?auto_679055 ?auto_679056 ?auto_679057 ?auto_679058 ?auto_679059 ?auto_679060 ?auto_679061 ?auto_679062 ?auto_679063 ?auto_679064 ?auto_679065 ?auto_679066 ?auto_679067 ?auto_679068 ?auto_679069 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679088 - BLOCK
      ?auto_679089 - BLOCK
      ?auto_679090 - BLOCK
      ?auto_679091 - BLOCK
      ?auto_679092 - BLOCK
      ?auto_679093 - BLOCK
      ?auto_679094 - BLOCK
      ?auto_679095 - BLOCK
      ?auto_679096 - BLOCK
      ?auto_679097 - BLOCK
      ?auto_679098 - BLOCK
      ?auto_679099 - BLOCK
      ?auto_679100 - BLOCK
      ?auto_679101 - BLOCK
      ?auto_679102 - BLOCK
      ?auto_679103 - BLOCK
      ?auto_679104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679104 ) ( ON-TABLE ?auto_679088 ) ( ON ?auto_679089 ?auto_679088 ) ( ON ?auto_679090 ?auto_679089 ) ( ON ?auto_679091 ?auto_679090 ) ( ON ?auto_679092 ?auto_679091 ) ( ON ?auto_679093 ?auto_679092 ) ( ON ?auto_679094 ?auto_679093 ) ( ON ?auto_679095 ?auto_679094 ) ( ON ?auto_679096 ?auto_679095 ) ( ON ?auto_679097 ?auto_679096 ) ( ON ?auto_679098 ?auto_679097 ) ( ON ?auto_679099 ?auto_679098 ) ( not ( = ?auto_679088 ?auto_679089 ) ) ( not ( = ?auto_679088 ?auto_679090 ) ) ( not ( = ?auto_679088 ?auto_679091 ) ) ( not ( = ?auto_679088 ?auto_679092 ) ) ( not ( = ?auto_679088 ?auto_679093 ) ) ( not ( = ?auto_679088 ?auto_679094 ) ) ( not ( = ?auto_679088 ?auto_679095 ) ) ( not ( = ?auto_679088 ?auto_679096 ) ) ( not ( = ?auto_679088 ?auto_679097 ) ) ( not ( = ?auto_679088 ?auto_679098 ) ) ( not ( = ?auto_679088 ?auto_679099 ) ) ( not ( = ?auto_679088 ?auto_679100 ) ) ( not ( = ?auto_679088 ?auto_679101 ) ) ( not ( = ?auto_679088 ?auto_679102 ) ) ( not ( = ?auto_679088 ?auto_679103 ) ) ( not ( = ?auto_679088 ?auto_679104 ) ) ( not ( = ?auto_679089 ?auto_679090 ) ) ( not ( = ?auto_679089 ?auto_679091 ) ) ( not ( = ?auto_679089 ?auto_679092 ) ) ( not ( = ?auto_679089 ?auto_679093 ) ) ( not ( = ?auto_679089 ?auto_679094 ) ) ( not ( = ?auto_679089 ?auto_679095 ) ) ( not ( = ?auto_679089 ?auto_679096 ) ) ( not ( = ?auto_679089 ?auto_679097 ) ) ( not ( = ?auto_679089 ?auto_679098 ) ) ( not ( = ?auto_679089 ?auto_679099 ) ) ( not ( = ?auto_679089 ?auto_679100 ) ) ( not ( = ?auto_679089 ?auto_679101 ) ) ( not ( = ?auto_679089 ?auto_679102 ) ) ( not ( = ?auto_679089 ?auto_679103 ) ) ( not ( = ?auto_679089 ?auto_679104 ) ) ( not ( = ?auto_679090 ?auto_679091 ) ) ( not ( = ?auto_679090 ?auto_679092 ) ) ( not ( = ?auto_679090 ?auto_679093 ) ) ( not ( = ?auto_679090 ?auto_679094 ) ) ( not ( = ?auto_679090 ?auto_679095 ) ) ( not ( = ?auto_679090 ?auto_679096 ) ) ( not ( = ?auto_679090 ?auto_679097 ) ) ( not ( = ?auto_679090 ?auto_679098 ) ) ( not ( = ?auto_679090 ?auto_679099 ) ) ( not ( = ?auto_679090 ?auto_679100 ) ) ( not ( = ?auto_679090 ?auto_679101 ) ) ( not ( = ?auto_679090 ?auto_679102 ) ) ( not ( = ?auto_679090 ?auto_679103 ) ) ( not ( = ?auto_679090 ?auto_679104 ) ) ( not ( = ?auto_679091 ?auto_679092 ) ) ( not ( = ?auto_679091 ?auto_679093 ) ) ( not ( = ?auto_679091 ?auto_679094 ) ) ( not ( = ?auto_679091 ?auto_679095 ) ) ( not ( = ?auto_679091 ?auto_679096 ) ) ( not ( = ?auto_679091 ?auto_679097 ) ) ( not ( = ?auto_679091 ?auto_679098 ) ) ( not ( = ?auto_679091 ?auto_679099 ) ) ( not ( = ?auto_679091 ?auto_679100 ) ) ( not ( = ?auto_679091 ?auto_679101 ) ) ( not ( = ?auto_679091 ?auto_679102 ) ) ( not ( = ?auto_679091 ?auto_679103 ) ) ( not ( = ?auto_679091 ?auto_679104 ) ) ( not ( = ?auto_679092 ?auto_679093 ) ) ( not ( = ?auto_679092 ?auto_679094 ) ) ( not ( = ?auto_679092 ?auto_679095 ) ) ( not ( = ?auto_679092 ?auto_679096 ) ) ( not ( = ?auto_679092 ?auto_679097 ) ) ( not ( = ?auto_679092 ?auto_679098 ) ) ( not ( = ?auto_679092 ?auto_679099 ) ) ( not ( = ?auto_679092 ?auto_679100 ) ) ( not ( = ?auto_679092 ?auto_679101 ) ) ( not ( = ?auto_679092 ?auto_679102 ) ) ( not ( = ?auto_679092 ?auto_679103 ) ) ( not ( = ?auto_679092 ?auto_679104 ) ) ( not ( = ?auto_679093 ?auto_679094 ) ) ( not ( = ?auto_679093 ?auto_679095 ) ) ( not ( = ?auto_679093 ?auto_679096 ) ) ( not ( = ?auto_679093 ?auto_679097 ) ) ( not ( = ?auto_679093 ?auto_679098 ) ) ( not ( = ?auto_679093 ?auto_679099 ) ) ( not ( = ?auto_679093 ?auto_679100 ) ) ( not ( = ?auto_679093 ?auto_679101 ) ) ( not ( = ?auto_679093 ?auto_679102 ) ) ( not ( = ?auto_679093 ?auto_679103 ) ) ( not ( = ?auto_679093 ?auto_679104 ) ) ( not ( = ?auto_679094 ?auto_679095 ) ) ( not ( = ?auto_679094 ?auto_679096 ) ) ( not ( = ?auto_679094 ?auto_679097 ) ) ( not ( = ?auto_679094 ?auto_679098 ) ) ( not ( = ?auto_679094 ?auto_679099 ) ) ( not ( = ?auto_679094 ?auto_679100 ) ) ( not ( = ?auto_679094 ?auto_679101 ) ) ( not ( = ?auto_679094 ?auto_679102 ) ) ( not ( = ?auto_679094 ?auto_679103 ) ) ( not ( = ?auto_679094 ?auto_679104 ) ) ( not ( = ?auto_679095 ?auto_679096 ) ) ( not ( = ?auto_679095 ?auto_679097 ) ) ( not ( = ?auto_679095 ?auto_679098 ) ) ( not ( = ?auto_679095 ?auto_679099 ) ) ( not ( = ?auto_679095 ?auto_679100 ) ) ( not ( = ?auto_679095 ?auto_679101 ) ) ( not ( = ?auto_679095 ?auto_679102 ) ) ( not ( = ?auto_679095 ?auto_679103 ) ) ( not ( = ?auto_679095 ?auto_679104 ) ) ( not ( = ?auto_679096 ?auto_679097 ) ) ( not ( = ?auto_679096 ?auto_679098 ) ) ( not ( = ?auto_679096 ?auto_679099 ) ) ( not ( = ?auto_679096 ?auto_679100 ) ) ( not ( = ?auto_679096 ?auto_679101 ) ) ( not ( = ?auto_679096 ?auto_679102 ) ) ( not ( = ?auto_679096 ?auto_679103 ) ) ( not ( = ?auto_679096 ?auto_679104 ) ) ( not ( = ?auto_679097 ?auto_679098 ) ) ( not ( = ?auto_679097 ?auto_679099 ) ) ( not ( = ?auto_679097 ?auto_679100 ) ) ( not ( = ?auto_679097 ?auto_679101 ) ) ( not ( = ?auto_679097 ?auto_679102 ) ) ( not ( = ?auto_679097 ?auto_679103 ) ) ( not ( = ?auto_679097 ?auto_679104 ) ) ( not ( = ?auto_679098 ?auto_679099 ) ) ( not ( = ?auto_679098 ?auto_679100 ) ) ( not ( = ?auto_679098 ?auto_679101 ) ) ( not ( = ?auto_679098 ?auto_679102 ) ) ( not ( = ?auto_679098 ?auto_679103 ) ) ( not ( = ?auto_679098 ?auto_679104 ) ) ( not ( = ?auto_679099 ?auto_679100 ) ) ( not ( = ?auto_679099 ?auto_679101 ) ) ( not ( = ?auto_679099 ?auto_679102 ) ) ( not ( = ?auto_679099 ?auto_679103 ) ) ( not ( = ?auto_679099 ?auto_679104 ) ) ( not ( = ?auto_679100 ?auto_679101 ) ) ( not ( = ?auto_679100 ?auto_679102 ) ) ( not ( = ?auto_679100 ?auto_679103 ) ) ( not ( = ?auto_679100 ?auto_679104 ) ) ( not ( = ?auto_679101 ?auto_679102 ) ) ( not ( = ?auto_679101 ?auto_679103 ) ) ( not ( = ?auto_679101 ?auto_679104 ) ) ( not ( = ?auto_679102 ?auto_679103 ) ) ( not ( = ?auto_679102 ?auto_679104 ) ) ( not ( = ?auto_679103 ?auto_679104 ) ) ( ON ?auto_679103 ?auto_679104 ) ( ON ?auto_679102 ?auto_679103 ) ( ON ?auto_679101 ?auto_679102 ) ( CLEAR ?auto_679099 ) ( ON ?auto_679100 ?auto_679101 ) ( CLEAR ?auto_679100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_679088 ?auto_679089 ?auto_679090 ?auto_679091 ?auto_679092 ?auto_679093 ?auto_679094 ?auto_679095 ?auto_679096 ?auto_679097 ?auto_679098 ?auto_679099 ?auto_679100 )
      ( MAKE-17PILE ?auto_679088 ?auto_679089 ?auto_679090 ?auto_679091 ?auto_679092 ?auto_679093 ?auto_679094 ?auto_679095 ?auto_679096 ?auto_679097 ?auto_679098 ?auto_679099 ?auto_679100 ?auto_679101 ?auto_679102 ?auto_679103 ?auto_679104 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679122 - BLOCK
      ?auto_679123 - BLOCK
      ?auto_679124 - BLOCK
      ?auto_679125 - BLOCK
      ?auto_679126 - BLOCK
      ?auto_679127 - BLOCK
      ?auto_679128 - BLOCK
      ?auto_679129 - BLOCK
      ?auto_679130 - BLOCK
      ?auto_679131 - BLOCK
      ?auto_679132 - BLOCK
      ?auto_679133 - BLOCK
      ?auto_679134 - BLOCK
      ?auto_679135 - BLOCK
      ?auto_679136 - BLOCK
      ?auto_679137 - BLOCK
      ?auto_679138 - BLOCK
    )
    :vars
    (
      ?auto_679139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679138 ?auto_679139 ) ( ON-TABLE ?auto_679122 ) ( ON ?auto_679123 ?auto_679122 ) ( ON ?auto_679124 ?auto_679123 ) ( ON ?auto_679125 ?auto_679124 ) ( ON ?auto_679126 ?auto_679125 ) ( ON ?auto_679127 ?auto_679126 ) ( ON ?auto_679128 ?auto_679127 ) ( ON ?auto_679129 ?auto_679128 ) ( ON ?auto_679130 ?auto_679129 ) ( ON ?auto_679131 ?auto_679130 ) ( ON ?auto_679132 ?auto_679131 ) ( not ( = ?auto_679122 ?auto_679123 ) ) ( not ( = ?auto_679122 ?auto_679124 ) ) ( not ( = ?auto_679122 ?auto_679125 ) ) ( not ( = ?auto_679122 ?auto_679126 ) ) ( not ( = ?auto_679122 ?auto_679127 ) ) ( not ( = ?auto_679122 ?auto_679128 ) ) ( not ( = ?auto_679122 ?auto_679129 ) ) ( not ( = ?auto_679122 ?auto_679130 ) ) ( not ( = ?auto_679122 ?auto_679131 ) ) ( not ( = ?auto_679122 ?auto_679132 ) ) ( not ( = ?auto_679122 ?auto_679133 ) ) ( not ( = ?auto_679122 ?auto_679134 ) ) ( not ( = ?auto_679122 ?auto_679135 ) ) ( not ( = ?auto_679122 ?auto_679136 ) ) ( not ( = ?auto_679122 ?auto_679137 ) ) ( not ( = ?auto_679122 ?auto_679138 ) ) ( not ( = ?auto_679122 ?auto_679139 ) ) ( not ( = ?auto_679123 ?auto_679124 ) ) ( not ( = ?auto_679123 ?auto_679125 ) ) ( not ( = ?auto_679123 ?auto_679126 ) ) ( not ( = ?auto_679123 ?auto_679127 ) ) ( not ( = ?auto_679123 ?auto_679128 ) ) ( not ( = ?auto_679123 ?auto_679129 ) ) ( not ( = ?auto_679123 ?auto_679130 ) ) ( not ( = ?auto_679123 ?auto_679131 ) ) ( not ( = ?auto_679123 ?auto_679132 ) ) ( not ( = ?auto_679123 ?auto_679133 ) ) ( not ( = ?auto_679123 ?auto_679134 ) ) ( not ( = ?auto_679123 ?auto_679135 ) ) ( not ( = ?auto_679123 ?auto_679136 ) ) ( not ( = ?auto_679123 ?auto_679137 ) ) ( not ( = ?auto_679123 ?auto_679138 ) ) ( not ( = ?auto_679123 ?auto_679139 ) ) ( not ( = ?auto_679124 ?auto_679125 ) ) ( not ( = ?auto_679124 ?auto_679126 ) ) ( not ( = ?auto_679124 ?auto_679127 ) ) ( not ( = ?auto_679124 ?auto_679128 ) ) ( not ( = ?auto_679124 ?auto_679129 ) ) ( not ( = ?auto_679124 ?auto_679130 ) ) ( not ( = ?auto_679124 ?auto_679131 ) ) ( not ( = ?auto_679124 ?auto_679132 ) ) ( not ( = ?auto_679124 ?auto_679133 ) ) ( not ( = ?auto_679124 ?auto_679134 ) ) ( not ( = ?auto_679124 ?auto_679135 ) ) ( not ( = ?auto_679124 ?auto_679136 ) ) ( not ( = ?auto_679124 ?auto_679137 ) ) ( not ( = ?auto_679124 ?auto_679138 ) ) ( not ( = ?auto_679124 ?auto_679139 ) ) ( not ( = ?auto_679125 ?auto_679126 ) ) ( not ( = ?auto_679125 ?auto_679127 ) ) ( not ( = ?auto_679125 ?auto_679128 ) ) ( not ( = ?auto_679125 ?auto_679129 ) ) ( not ( = ?auto_679125 ?auto_679130 ) ) ( not ( = ?auto_679125 ?auto_679131 ) ) ( not ( = ?auto_679125 ?auto_679132 ) ) ( not ( = ?auto_679125 ?auto_679133 ) ) ( not ( = ?auto_679125 ?auto_679134 ) ) ( not ( = ?auto_679125 ?auto_679135 ) ) ( not ( = ?auto_679125 ?auto_679136 ) ) ( not ( = ?auto_679125 ?auto_679137 ) ) ( not ( = ?auto_679125 ?auto_679138 ) ) ( not ( = ?auto_679125 ?auto_679139 ) ) ( not ( = ?auto_679126 ?auto_679127 ) ) ( not ( = ?auto_679126 ?auto_679128 ) ) ( not ( = ?auto_679126 ?auto_679129 ) ) ( not ( = ?auto_679126 ?auto_679130 ) ) ( not ( = ?auto_679126 ?auto_679131 ) ) ( not ( = ?auto_679126 ?auto_679132 ) ) ( not ( = ?auto_679126 ?auto_679133 ) ) ( not ( = ?auto_679126 ?auto_679134 ) ) ( not ( = ?auto_679126 ?auto_679135 ) ) ( not ( = ?auto_679126 ?auto_679136 ) ) ( not ( = ?auto_679126 ?auto_679137 ) ) ( not ( = ?auto_679126 ?auto_679138 ) ) ( not ( = ?auto_679126 ?auto_679139 ) ) ( not ( = ?auto_679127 ?auto_679128 ) ) ( not ( = ?auto_679127 ?auto_679129 ) ) ( not ( = ?auto_679127 ?auto_679130 ) ) ( not ( = ?auto_679127 ?auto_679131 ) ) ( not ( = ?auto_679127 ?auto_679132 ) ) ( not ( = ?auto_679127 ?auto_679133 ) ) ( not ( = ?auto_679127 ?auto_679134 ) ) ( not ( = ?auto_679127 ?auto_679135 ) ) ( not ( = ?auto_679127 ?auto_679136 ) ) ( not ( = ?auto_679127 ?auto_679137 ) ) ( not ( = ?auto_679127 ?auto_679138 ) ) ( not ( = ?auto_679127 ?auto_679139 ) ) ( not ( = ?auto_679128 ?auto_679129 ) ) ( not ( = ?auto_679128 ?auto_679130 ) ) ( not ( = ?auto_679128 ?auto_679131 ) ) ( not ( = ?auto_679128 ?auto_679132 ) ) ( not ( = ?auto_679128 ?auto_679133 ) ) ( not ( = ?auto_679128 ?auto_679134 ) ) ( not ( = ?auto_679128 ?auto_679135 ) ) ( not ( = ?auto_679128 ?auto_679136 ) ) ( not ( = ?auto_679128 ?auto_679137 ) ) ( not ( = ?auto_679128 ?auto_679138 ) ) ( not ( = ?auto_679128 ?auto_679139 ) ) ( not ( = ?auto_679129 ?auto_679130 ) ) ( not ( = ?auto_679129 ?auto_679131 ) ) ( not ( = ?auto_679129 ?auto_679132 ) ) ( not ( = ?auto_679129 ?auto_679133 ) ) ( not ( = ?auto_679129 ?auto_679134 ) ) ( not ( = ?auto_679129 ?auto_679135 ) ) ( not ( = ?auto_679129 ?auto_679136 ) ) ( not ( = ?auto_679129 ?auto_679137 ) ) ( not ( = ?auto_679129 ?auto_679138 ) ) ( not ( = ?auto_679129 ?auto_679139 ) ) ( not ( = ?auto_679130 ?auto_679131 ) ) ( not ( = ?auto_679130 ?auto_679132 ) ) ( not ( = ?auto_679130 ?auto_679133 ) ) ( not ( = ?auto_679130 ?auto_679134 ) ) ( not ( = ?auto_679130 ?auto_679135 ) ) ( not ( = ?auto_679130 ?auto_679136 ) ) ( not ( = ?auto_679130 ?auto_679137 ) ) ( not ( = ?auto_679130 ?auto_679138 ) ) ( not ( = ?auto_679130 ?auto_679139 ) ) ( not ( = ?auto_679131 ?auto_679132 ) ) ( not ( = ?auto_679131 ?auto_679133 ) ) ( not ( = ?auto_679131 ?auto_679134 ) ) ( not ( = ?auto_679131 ?auto_679135 ) ) ( not ( = ?auto_679131 ?auto_679136 ) ) ( not ( = ?auto_679131 ?auto_679137 ) ) ( not ( = ?auto_679131 ?auto_679138 ) ) ( not ( = ?auto_679131 ?auto_679139 ) ) ( not ( = ?auto_679132 ?auto_679133 ) ) ( not ( = ?auto_679132 ?auto_679134 ) ) ( not ( = ?auto_679132 ?auto_679135 ) ) ( not ( = ?auto_679132 ?auto_679136 ) ) ( not ( = ?auto_679132 ?auto_679137 ) ) ( not ( = ?auto_679132 ?auto_679138 ) ) ( not ( = ?auto_679132 ?auto_679139 ) ) ( not ( = ?auto_679133 ?auto_679134 ) ) ( not ( = ?auto_679133 ?auto_679135 ) ) ( not ( = ?auto_679133 ?auto_679136 ) ) ( not ( = ?auto_679133 ?auto_679137 ) ) ( not ( = ?auto_679133 ?auto_679138 ) ) ( not ( = ?auto_679133 ?auto_679139 ) ) ( not ( = ?auto_679134 ?auto_679135 ) ) ( not ( = ?auto_679134 ?auto_679136 ) ) ( not ( = ?auto_679134 ?auto_679137 ) ) ( not ( = ?auto_679134 ?auto_679138 ) ) ( not ( = ?auto_679134 ?auto_679139 ) ) ( not ( = ?auto_679135 ?auto_679136 ) ) ( not ( = ?auto_679135 ?auto_679137 ) ) ( not ( = ?auto_679135 ?auto_679138 ) ) ( not ( = ?auto_679135 ?auto_679139 ) ) ( not ( = ?auto_679136 ?auto_679137 ) ) ( not ( = ?auto_679136 ?auto_679138 ) ) ( not ( = ?auto_679136 ?auto_679139 ) ) ( not ( = ?auto_679137 ?auto_679138 ) ) ( not ( = ?auto_679137 ?auto_679139 ) ) ( not ( = ?auto_679138 ?auto_679139 ) ) ( ON ?auto_679137 ?auto_679138 ) ( ON ?auto_679136 ?auto_679137 ) ( ON ?auto_679135 ?auto_679136 ) ( ON ?auto_679134 ?auto_679135 ) ( CLEAR ?auto_679132 ) ( ON ?auto_679133 ?auto_679134 ) ( CLEAR ?auto_679133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_679122 ?auto_679123 ?auto_679124 ?auto_679125 ?auto_679126 ?auto_679127 ?auto_679128 ?auto_679129 ?auto_679130 ?auto_679131 ?auto_679132 ?auto_679133 )
      ( MAKE-17PILE ?auto_679122 ?auto_679123 ?auto_679124 ?auto_679125 ?auto_679126 ?auto_679127 ?auto_679128 ?auto_679129 ?auto_679130 ?auto_679131 ?auto_679132 ?auto_679133 ?auto_679134 ?auto_679135 ?auto_679136 ?auto_679137 ?auto_679138 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679157 - BLOCK
      ?auto_679158 - BLOCK
      ?auto_679159 - BLOCK
      ?auto_679160 - BLOCK
      ?auto_679161 - BLOCK
      ?auto_679162 - BLOCK
      ?auto_679163 - BLOCK
      ?auto_679164 - BLOCK
      ?auto_679165 - BLOCK
      ?auto_679166 - BLOCK
      ?auto_679167 - BLOCK
      ?auto_679168 - BLOCK
      ?auto_679169 - BLOCK
      ?auto_679170 - BLOCK
      ?auto_679171 - BLOCK
      ?auto_679172 - BLOCK
      ?auto_679173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679173 ) ( ON-TABLE ?auto_679157 ) ( ON ?auto_679158 ?auto_679157 ) ( ON ?auto_679159 ?auto_679158 ) ( ON ?auto_679160 ?auto_679159 ) ( ON ?auto_679161 ?auto_679160 ) ( ON ?auto_679162 ?auto_679161 ) ( ON ?auto_679163 ?auto_679162 ) ( ON ?auto_679164 ?auto_679163 ) ( ON ?auto_679165 ?auto_679164 ) ( ON ?auto_679166 ?auto_679165 ) ( ON ?auto_679167 ?auto_679166 ) ( not ( = ?auto_679157 ?auto_679158 ) ) ( not ( = ?auto_679157 ?auto_679159 ) ) ( not ( = ?auto_679157 ?auto_679160 ) ) ( not ( = ?auto_679157 ?auto_679161 ) ) ( not ( = ?auto_679157 ?auto_679162 ) ) ( not ( = ?auto_679157 ?auto_679163 ) ) ( not ( = ?auto_679157 ?auto_679164 ) ) ( not ( = ?auto_679157 ?auto_679165 ) ) ( not ( = ?auto_679157 ?auto_679166 ) ) ( not ( = ?auto_679157 ?auto_679167 ) ) ( not ( = ?auto_679157 ?auto_679168 ) ) ( not ( = ?auto_679157 ?auto_679169 ) ) ( not ( = ?auto_679157 ?auto_679170 ) ) ( not ( = ?auto_679157 ?auto_679171 ) ) ( not ( = ?auto_679157 ?auto_679172 ) ) ( not ( = ?auto_679157 ?auto_679173 ) ) ( not ( = ?auto_679158 ?auto_679159 ) ) ( not ( = ?auto_679158 ?auto_679160 ) ) ( not ( = ?auto_679158 ?auto_679161 ) ) ( not ( = ?auto_679158 ?auto_679162 ) ) ( not ( = ?auto_679158 ?auto_679163 ) ) ( not ( = ?auto_679158 ?auto_679164 ) ) ( not ( = ?auto_679158 ?auto_679165 ) ) ( not ( = ?auto_679158 ?auto_679166 ) ) ( not ( = ?auto_679158 ?auto_679167 ) ) ( not ( = ?auto_679158 ?auto_679168 ) ) ( not ( = ?auto_679158 ?auto_679169 ) ) ( not ( = ?auto_679158 ?auto_679170 ) ) ( not ( = ?auto_679158 ?auto_679171 ) ) ( not ( = ?auto_679158 ?auto_679172 ) ) ( not ( = ?auto_679158 ?auto_679173 ) ) ( not ( = ?auto_679159 ?auto_679160 ) ) ( not ( = ?auto_679159 ?auto_679161 ) ) ( not ( = ?auto_679159 ?auto_679162 ) ) ( not ( = ?auto_679159 ?auto_679163 ) ) ( not ( = ?auto_679159 ?auto_679164 ) ) ( not ( = ?auto_679159 ?auto_679165 ) ) ( not ( = ?auto_679159 ?auto_679166 ) ) ( not ( = ?auto_679159 ?auto_679167 ) ) ( not ( = ?auto_679159 ?auto_679168 ) ) ( not ( = ?auto_679159 ?auto_679169 ) ) ( not ( = ?auto_679159 ?auto_679170 ) ) ( not ( = ?auto_679159 ?auto_679171 ) ) ( not ( = ?auto_679159 ?auto_679172 ) ) ( not ( = ?auto_679159 ?auto_679173 ) ) ( not ( = ?auto_679160 ?auto_679161 ) ) ( not ( = ?auto_679160 ?auto_679162 ) ) ( not ( = ?auto_679160 ?auto_679163 ) ) ( not ( = ?auto_679160 ?auto_679164 ) ) ( not ( = ?auto_679160 ?auto_679165 ) ) ( not ( = ?auto_679160 ?auto_679166 ) ) ( not ( = ?auto_679160 ?auto_679167 ) ) ( not ( = ?auto_679160 ?auto_679168 ) ) ( not ( = ?auto_679160 ?auto_679169 ) ) ( not ( = ?auto_679160 ?auto_679170 ) ) ( not ( = ?auto_679160 ?auto_679171 ) ) ( not ( = ?auto_679160 ?auto_679172 ) ) ( not ( = ?auto_679160 ?auto_679173 ) ) ( not ( = ?auto_679161 ?auto_679162 ) ) ( not ( = ?auto_679161 ?auto_679163 ) ) ( not ( = ?auto_679161 ?auto_679164 ) ) ( not ( = ?auto_679161 ?auto_679165 ) ) ( not ( = ?auto_679161 ?auto_679166 ) ) ( not ( = ?auto_679161 ?auto_679167 ) ) ( not ( = ?auto_679161 ?auto_679168 ) ) ( not ( = ?auto_679161 ?auto_679169 ) ) ( not ( = ?auto_679161 ?auto_679170 ) ) ( not ( = ?auto_679161 ?auto_679171 ) ) ( not ( = ?auto_679161 ?auto_679172 ) ) ( not ( = ?auto_679161 ?auto_679173 ) ) ( not ( = ?auto_679162 ?auto_679163 ) ) ( not ( = ?auto_679162 ?auto_679164 ) ) ( not ( = ?auto_679162 ?auto_679165 ) ) ( not ( = ?auto_679162 ?auto_679166 ) ) ( not ( = ?auto_679162 ?auto_679167 ) ) ( not ( = ?auto_679162 ?auto_679168 ) ) ( not ( = ?auto_679162 ?auto_679169 ) ) ( not ( = ?auto_679162 ?auto_679170 ) ) ( not ( = ?auto_679162 ?auto_679171 ) ) ( not ( = ?auto_679162 ?auto_679172 ) ) ( not ( = ?auto_679162 ?auto_679173 ) ) ( not ( = ?auto_679163 ?auto_679164 ) ) ( not ( = ?auto_679163 ?auto_679165 ) ) ( not ( = ?auto_679163 ?auto_679166 ) ) ( not ( = ?auto_679163 ?auto_679167 ) ) ( not ( = ?auto_679163 ?auto_679168 ) ) ( not ( = ?auto_679163 ?auto_679169 ) ) ( not ( = ?auto_679163 ?auto_679170 ) ) ( not ( = ?auto_679163 ?auto_679171 ) ) ( not ( = ?auto_679163 ?auto_679172 ) ) ( not ( = ?auto_679163 ?auto_679173 ) ) ( not ( = ?auto_679164 ?auto_679165 ) ) ( not ( = ?auto_679164 ?auto_679166 ) ) ( not ( = ?auto_679164 ?auto_679167 ) ) ( not ( = ?auto_679164 ?auto_679168 ) ) ( not ( = ?auto_679164 ?auto_679169 ) ) ( not ( = ?auto_679164 ?auto_679170 ) ) ( not ( = ?auto_679164 ?auto_679171 ) ) ( not ( = ?auto_679164 ?auto_679172 ) ) ( not ( = ?auto_679164 ?auto_679173 ) ) ( not ( = ?auto_679165 ?auto_679166 ) ) ( not ( = ?auto_679165 ?auto_679167 ) ) ( not ( = ?auto_679165 ?auto_679168 ) ) ( not ( = ?auto_679165 ?auto_679169 ) ) ( not ( = ?auto_679165 ?auto_679170 ) ) ( not ( = ?auto_679165 ?auto_679171 ) ) ( not ( = ?auto_679165 ?auto_679172 ) ) ( not ( = ?auto_679165 ?auto_679173 ) ) ( not ( = ?auto_679166 ?auto_679167 ) ) ( not ( = ?auto_679166 ?auto_679168 ) ) ( not ( = ?auto_679166 ?auto_679169 ) ) ( not ( = ?auto_679166 ?auto_679170 ) ) ( not ( = ?auto_679166 ?auto_679171 ) ) ( not ( = ?auto_679166 ?auto_679172 ) ) ( not ( = ?auto_679166 ?auto_679173 ) ) ( not ( = ?auto_679167 ?auto_679168 ) ) ( not ( = ?auto_679167 ?auto_679169 ) ) ( not ( = ?auto_679167 ?auto_679170 ) ) ( not ( = ?auto_679167 ?auto_679171 ) ) ( not ( = ?auto_679167 ?auto_679172 ) ) ( not ( = ?auto_679167 ?auto_679173 ) ) ( not ( = ?auto_679168 ?auto_679169 ) ) ( not ( = ?auto_679168 ?auto_679170 ) ) ( not ( = ?auto_679168 ?auto_679171 ) ) ( not ( = ?auto_679168 ?auto_679172 ) ) ( not ( = ?auto_679168 ?auto_679173 ) ) ( not ( = ?auto_679169 ?auto_679170 ) ) ( not ( = ?auto_679169 ?auto_679171 ) ) ( not ( = ?auto_679169 ?auto_679172 ) ) ( not ( = ?auto_679169 ?auto_679173 ) ) ( not ( = ?auto_679170 ?auto_679171 ) ) ( not ( = ?auto_679170 ?auto_679172 ) ) ( not ( = ?auto_679170 ?auto_679173 ) ) ( not ( = ?auto_679171 ?auto_679172 ) ) ( not ( = ?auto_679171 ?auto_679173 ) ) ( not ( = ?auto_679172 ?auto_679173 ) ) ( ON ?auto_679172 ?auto_679173 ) ( ON ?auto_679171 ?auto_679172 ) ( ON ?auto_679170 ?auto_679171 ) ( ON ?auto_679169 ?auto_679170 ) ( CLEAR ?auto_679167 ) ( ON ?auto_679168 ?auto_679169 ) ( CLEAR ?auto_679168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_679157 ?auto_679158 ?auto_679159 ?auto_679160 ?auto_679161 ?auto_679162 ?auto_679163 ?auto_679164 ?auto_679165 ?auto_679166 ?auto_679167 ?auto_679168 )
      ( MAKE-17PILE ?auto_679157 ?auto_679158 ?auto_679159 ?auto_679160 ?auto_679161 ?auto_679162 ?auto_679163 ?auto_679164 ?auto_679165 ?auto_679166 ?auto_679167 ?auto_679168 ?auto_679169 ?auto_679170 ?auto_679171 ?auto_679172 ?auto_679173 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679191 - BLOCK
      ?auto_679192 - BLOCK
      ?auto_679193 - BLOCK
      ?auto_679194 - BLOCK
      ?auto_679195 - BLOCK
      ?auto_679196 - BLOCK
      ?auto_679197 - BLOCK
      ?auto_679198 - BLOCK
      ?auto_679199 - BLOCK
      ?auto_679200 - BLOCK
      ?auto_679201 - BLOCK
      ?auto_679202 - BLOCK
      ?auto_679203 - BLOCK
      ?auto_679204 - BLOCK
      ?auto_679205 - BLOCK
      ?auto_679206 - BLOCK
      ?auto_679207 - BLOCK
    )
    :vars
    (
      ?auto_679208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679207 ?auto_679208 ) ( ON-TABLE ?auto_679191 ) ( ON ?auto_679192 ?auto_679191 ) ( ON ?auto_679193 ?auto_679192 ) ( ON ?auto_679194 ?auto_679193 ) ( ON ?auto_679195 ?auto_679194 ) ( ON ?auto_679196 ?auto_679195 ) ( ON ?auto_679197 ?auto_679196 ) ( ON ?auto_679198 ?auto_679197 ) ( ON ?auto_679199 ?auto_679198 ) ( ON ?auto_679200 ?auto_679199 ) ( not ( = ?auto_679191 ?auto_679192 ) ) ( not ( = ?auto_679191 ?auto_679193 ) ) ( not ( = ?auto_679191 ?auto_679194 ) ) ( not ( = ?auto_679191 ?auto_679195 ) ) ( not ( = ?auto_679191 ?auto_679196 ) ) ( not ( = ?auto_679191 ?auto_679197 ) ) ( not ( = ?auto_679191 ?auto_679198 ) ) ( not ( = ?auto_679191 ?auto_679199 ) ) ( not ( = ?auto_679191 ?auto_679200 ) ) ( not ( = ?auto_679191 ?auto_679201 ) ) ( not ( = ?auto_679191 ?auto_679202 ) ) ( not ( = ?auto_679191 ?auto_679203 ) ) ( not ( = ?auto_679191 ?auto_679204 ) ) ( not ( = ?auto_679191 ?auto_679205 ) ) ( not ( = ?auto_679191 ?auto_679206 ) ) ( not ( = ?auto_679191 ?auto_679207 ) ) ( not ( = ?auto_679191 ?auto_679208 ) ) ( not ( = ?auto_679192 ?auto_679193 ) ) ( not ( = ?auto_679192 ?auto_679194 ) ) ( not ( = ?auto_679192 ?auto_679195 ) ) ( not ( = ?auto_679192 ?auto_679196 ) ) ( not ( = ?auto_679192 ?auto_679197 ) ) ( not ( = ?auto_679192 ?auto_679198 ) ) ( not ( = ?auto_679192 ?auto_679199 ) ) ( not ( = ?auto_679192 ?auto_679200 ) ) ( not ( = ?auto_679192 ?auto_679201 ) ) ( not ( = ?auto_679192 ?auto_679202 ) ) ( not ( = ?auto_679192 ?auto_679203 ) ) ( not ( = ?auto_679192 ?auto_679204 ) ) ( not ( = ?auto_679192 ?auto_679205 ) ) ( not ( = ?auto_679192 ?auto_679206 ) ) ( not ( = ?auto_679192 ?auto_679207 ) ) ( not ( = ?auto_679192 ?auto_679208 ) ) ( not ( = ?auto_679193 ?auto_679194 ) ) ( not ( = ?auto_679193 ?auto_679195 ) ) ( not ( = ?auto_679193 ?auto_679196 ) ) ( not ( = ?auto_679193 ?auto_679197 ) ) ( not ( = ?auto_679193 ?auto_679198 ) ) ( not ( = ?auto_679193 ?auto_679199 ) ) ( not ( = ?auto_679193 ?auto_679200 ) ) ( not ( = ?auto_679193 ?auto_679201 ) ) ( not ( = ?auto_679193 ?auto_679202 ) ) ( not ( = ?auto_679193 ?auto_679203 ) ) ( not ( = ?auto_679193 ?auto_679204 ) ) ( not ( = ?auto_679193 ?auto_679205 ) ) ( not ( = ?auto_679193 ?auto_679206 ) ) ( not ( = ?auto_679193 ?auto_679207 ) ) ( not ( = ?auto_679193 ?auto_679208 ) ) ( not ( = ?auto_679194 ?auto_679195 ) ) ( not ( = ?auto_679194 ?auto_679196 ) ) ( not ( = ?auto_679194 ?auto_679197 ) ) ( not ( = ?auto_679194 ?auto_679198 ) ) ( not ( = ?auto_679194 ?auto_679199 ) ) ( not ( = ?auto_679194 ?auto_679200 ) ) ( not ( = ?auto_679194 ?auto_679201 ) ) ( not ( = ?auto_679194 ?auto_679202 ) ) ( not ( = ?auto_679194 ?auto_679203 ) ) ( not ( = ?auto_679194 ?auto_679204 ) ) ( not ( = ?auto_679194 ?auto_679205 ) ) ( not ( = ?auto_679194 ?auto_679206 ) ) ( not ( = ?auto_679194 ?auto_679207 ) ) ( not ( = ?auto_679194 ?auto_679208 ) ) ( not ( = ?auto_679195 ?auto_679196 ) ) ( not ( = ?auto_679195 ?auto_679197 ) ) ( not ( = ?auto_679195 ?auto_679198 ) ) ( not ( = ?auto_679195 ?auto_679199 ) ) ( not ( = ?auto_679195 ?auto_679200 ) ) ( not ( = ?auto_679195 ?auto_679201 ) ) ( not ( = ?auto_679195 ?auto_679202 ) ) ( not ( = ?auto_679195 ?auto_679203 ) ) ( not ( = ?auto_679195 ?auto_679204 ) ) ( not ( = ?auto_679195 ?auto_679205 ) ) ( not ( = ?auto_679195 ?auto_679206 ) ) ( not ( = ?auto_679195 ?auto_679207 ) ) ( not ( = ?auto_679195 ?auto_679208 ) ) ( not ( = ?auto_679196 ?auto_679197 ) ) ( not ( = ?auto_679196 ?auto_679198 ) ) ( not ( = ?auto_679196 ?auto_679199 ) ) ( not ( = ?auto_679196 ?auto_679200 ) ) ( not ( = ?auto_679196 ?auto_679201 ) ) ( not ( = ?auto_679196 ?auto_679202 ) ) ( not ( = ?auto_679196 ?auto_679203 ) ) ( not ( = ?auto_679196 ?auto_679204 ) ) ( not ( = ?auto_679196 ?auto_679205 ) ) ( not ( = ?auto_679196 ?auto_679206 ) ) ( not ( = ?auto_679196 ?auto_679207 ) ) ( not ( = ?auto_679196 ?auto_679208 ) ) ( not ( = ?auto_679197 ?auto_679198 ) ) ( not ( = ?auto_679197 ?auto_679199 ) ) ( not ( = ?auto_679197 ?auto_679200 ) ) ( not ( = ?auto_679197 ?auto_679201 ) ) ( not ( = ?auto_679197 ?auto_679202 ) ) ( not ( = ?auto_679197 ?auto_679203 ) ) ( not ( = ?auto_679197 ?auto_679204 ) ) ( not ( = ?auto_679197 ?auto_679205 ) ) ( not ( = ?auto_679197 ?auto_679206 ) ) ( not ( = ?auto_679197 ?auto_679207 ) ) ( not ( = ?auto_679197 ?auto_679208 ) ) ( not ( = ?auto_679198 ?auto_679199 ) ) ( not ( = ?auto_679198 ?auto_679200 ) ) ( not ( = ?auto_679198 ?auto_679201 ) ) ( not ( = ?auto_679198 ?auto_679202 ) ) ( not ( = ?auto_679198 ?auto_679203 ) ) ( not ( = ?auto_679198 ?auto_679204 ) ) ( not ( = ?auto_679198 ?auto_679205 ) ) ( not ( = ?auto_679198 ?auto_679206 ) ) ( not ( = ?auto_679198 ?auto_679207 ) ) ( not ( = ?auto_679198 ?auto_679208 ) ) ( not ( = ?auto_679199 ?auto_679200 ) ) ( not ( = ?auto_679199 ?auto_679201 ) ) ( not ( = ?auto_679199 ?auto_679202 ) ) ( not ( = ?auto_679199 ?auto_679203 ) ) ( not ( = ?auto_679199 ?auto_679204 ) ) ( not ( = ?auto_679199 ?auto_679205 ) ) ( not ( = ?auto_679199 ?auto_679206 ) ) ( not ( = ?auto_679199 ?auto_679207 ) ) ( not ( = ?auto_679199 ?auto_679208 ) ) ( not ( = ?auto_679200 ?auto_679201 ) ) ( not ( = ?auto_679200 ?auto_679202 ) ) ( not ( = ?auto_679200 ?auto_679203 ) ) ( not ( = ?auto_679200 ?auto_679204 ) ) ( not ( = ?auto_679200 ?auto_679205 ) ) ( not ( = ?auto_679200 ?auto_679206 ) ) ( not ( = ?auto_679200 ?auto_679207 ) ) ( not ( = ?auto_679200 ?auto_679208 ) ) ( not ( = ?auto_679201 ?auto_679202 ) ) ( not ( = ?auto_679201 ?auto_679203 ) ) ( not ( = ?auto_679201 ?auto_679204 ) ) ( not ( = ?auto_679201 ?auto_679205 ) ) ( not ( = ?auto_679201 ?auto_679206 ) ) ( not ( = ?auto_679201 ?auto_679207 ) ) ( not ( = ?auto_679201 ?auto_679208 ) ) ( not ( = ?auto_679202 ?auto_679203 ) ) ( not ( = ?auto_679202 ?auto_679204 ) ) ( not ( = ?auto_679202 ?auto_679205 ) ) ( not ( = ?auto_679202 ?auto_679206 ) ) ( not ( = ?auto_679202 ?auto_679207 ) ) ( not ( = ?auto_679202 ?auto_679208 ) ) ( not ( = ?auto_679203 ?auto_679204 ) ) ( not ( = ?auto_679203 ?auto_679205 ) ) ( not ( = ?auto_679203 ?auto_679206 ) ) ( not ( = ?auto_679203 ?auto_679207 ) ) ( not ( = ?auto_679203 ?auto_679208 ) ) ( not ( = ?auto_679204 ?auto_679205 ) ) ( not ( = ?auto_679204 ?auto_679206 ) ) ( not ( = ?auto_679204 ?auto_679207 ) ) ( not ( = ?auto_679204 ?auto_679208 ) ) ( not ( = ?auto_679205 ?auto_679206 ) ) ( not ( = ?auto_679205 ?auto_679207 ) ) ( not ( = ?auto_679205 ?auto_679208 ) ) ( not ( = ?auto_679206 ?auto_679207 ) ) ( not ( = ?auto_679206 ?auto_679208 ) ) ( not ( = ?auto_679207 ?auto_679208 ) ) ( ON ?auto_679206 ?auto_679207 ) ( ON ?auto_679205 ?auto_679206 ) ( ON ?auto_679204 ?auto_679205 ) ( ON ?auto_679203 ?auto_679204 ) ( ON ?auto_679202 ?auto_679203 ) ( CLEAR ?auto_679200 ) ( ON ?auto_679201 ?auto_679202 ) ( CLEAR ?auto_679201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_679191 ?auto_679192 ?auto_679193 ?auto_679194 ?auto_679195 ?auto_679196 ?auto_679197 ?auto_679198 ?auto_679199 ?auto_679200 ?auto_679201 )
      ( MAKE-17PILE ?auto_679191 ?auto_679192 ?auto_679193 ?auto_679194 ?auto_679195 ?auto_679196 ?auto_679197 ?auto_679198 ?auto_679199 ?auto_679200 ?auto_679201 ?auto_679202 ?auto_679203 ?auto_679204 ?auto_679205 ?auto_679206 ?auto_679207 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679226 - BLOCK
      ?auto_679227 - BLOCK
      ?auto_679228 - BLOCK
      ?auto_679229 - BLOCK
      ?auto_679230 - BLOCK
      ?auto_679231 - BLOCK
      ?auto_679232 - BLOCK
      ?auto_679233 - BLOCK
      ?auto_679234 - BLOCK
      ?auto_679235 - BLOCK
      ?auto_679236 - BLOCK
      ?auto_679237 - BLOCK
      ?auto_679238 - BLOCK
      ?auto_679239 - BLOCK
      ?auto_679240 - BLOCK
      ?auto_679241 - BLOCK
      ?auto_679242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679242 ) ( ON-TABLE ?auto_679226 ) ( ON ?auto_679227 ?auto_679226 ) ( ON ?auto_679228 ?auto_679227 ) ( ON ?auto_679229 ?auto_679228 ) ( ON ?auto_679230 ?auto_679229 ) ( ON ?auto_679231 ?auto_679230 ) ( ON ?auto_679232 ?auto_679231 ) ( ON ?auto_679233 ?auto_679232 ) ( ON ?auto_679234 ?auto_679233 ) ( ON ?auto_679235 ?auto_679234 ) ( not ( = ?auto_679226 ?auto_679227 ) ) ( not ( = ?auto_679226 ?auto_679228 ) ) ( not ( = ?auto_679226 ?auto_679229 ) ) ( not ( = ?auto_679226 ?auto_679230 ) ) ( not ( = ?auto_679226 ?auto_679231 ) ) ( not ( = ?auto_679226 ?auto_679232 ) ) ( not ( = ?auto_679226 ?auto_679233 ) ) ( not ( = ?auto_679226 ?auto_679234 ) ) ( not ( = ?auto_679226 ?auto_679235 ) ) ( not ( = ?auto_679226 ?auto_679236 ) ) ( not ( = ?auto_679226 ?auto_679237 ) ) ( not ( = ?auto_679226 ?auto_679238 ) ) ( not ( = ?auto_679226 ?auto_679239 ) ) ( not ( = ?auto_679226 ?auto_679240 ) ) ( not ( = ?auto_679226 ?auto_679241 ) ) ( not ( = ?auto_679226 ?auto_679242 ) ) ( not ( = ?auto_679227 ?auto_679228 ) ) ( not ( = ?auto_679227 ?auto_679229 ) ) ( not ( = ?auto_679227 ?auto_679230 ) ) ( not ( = ?auto_679227 ?auto_679231 ) ) ( not ( = ?auto_679227 ?auto_679232 ) ) ( not ( = ?auto_679227 ?auto_679233 ) ) ( not ( = ?auto_679227 ?auto_679234 ) ) ( not ( = ?auto_679227 ?auto_679235 ) ) ( not ( = ?auto_679227 ?auto_679236 ) ) ( not ( = ?auto_679227 ?auto_679237 ) ) ( not ( = ?auto_679227 ?auto_679238 ) ) ( not ( = ?auto_679227 ?auto_679239 ) ) ( not ( = ?auto_679227 ?auto_679240 ) ) ( not ( = ?auto_679227 ?auto_679241 ) ) ( not ( = ?auto_679227 ?auto_679242 ) ) ( not ( = ?auto_679228 ?auto_679229 ) ) ( not ( = ?auto_679228 ?auto_679230 ) ) ( not ( = ?auto_679228 ?auto_679231 ) ) ( not ( = ?auto_679228 ?auto_679232 ) ) ( not ( = ?auto_679228 ?auto_679233 ) ) ( not ( = ?auto_679228 ?auto_679234 ) ) ( not ( = ?auto_679228 ?auto_679235 ) ) ( not ( = ?auto_679228 ?auto_679236 ) ) ( not ( = ?auto_679228 ?auto_679237 ) ) ( not ( = ?auto_679228 ?auto_679238 ) ) ( not ( = ?auto_679228 ?auto_679239 ) ) ( not ( = ?auto_679228 ?auto_679240 ) ) ( not ( = ?auto_679228 ?auto_679241 ) ) ( not ( = ?auto_679228 ?auto_679242 ) ) ( not ( = ?auto_679229 ?auto_679230 ) ) ( not ( = ?auto_679229 ?auto_679231 ) ) ( not ( = ?auto_679229 ?auto_679232 ) ) ( not ( = ?auto_679229 ?auto_679233 ) ) ( not ( = ?auto_679229 ?auto_679234 ) ) ( not ( = ?auto_679229 ?auto_679235 ) ) ( not ( = ?auto_679229 ?auto_679236 ) ) ( not ( = ?auto_679229 ?auto_679237 ) ) ( not ( = ?auto_679229 ?auto_679238 ) ) ( not ( = ?auto_679229 ?auto_679239 ) ) ( not ( = ?auto_679229 ?auto_679240 ) ) ( not ( = ?auto_679229 ?auto_679241 ) ) ( not ( = ?auto_679229 ?auto_679242 ) ) ( not ( = ?auto_679230 ?auto_679231 ) ) ( not ( = ?auto_679230 ?auto_679232 ) ) ( not ( = ?auto_679230 ?auto_679233 ) ) ( not ( = ?auto_679230 ?auto_679234 ) ) ( not ( = ?auto_679230 ?auto_679235 ) ) ( not ( = ?auto_679230 ?auto_679236 ) ) ( not ( = ?auto_679230 ?auto_679237 ) ) ( not ( = ?auto_679230 ?auto_679238 ) ) ( not ( = ?auto_679230 ?auto_679239 ) ) ( not ( = ?auto_679230 ?auto_679240 ) ) ( not ( = ?auto_679230 ?auto_679241 ) ) ( not ( = ?auto_679230 ?auto_679242 ) ) ( not ( = ?auto_679231 ?auto_679232 ) ) ( not ( = ?auto_679231 ?auto_679233 ) ) ( not ( = ?auto_679231 ?auto_679234 ) ) ( not ( = ?auto_679231 ?auto_679235 ) ) ( not ( = ?auto_679231 ?auto_679236 ) ) ( not ( = ?auto_679231 ?auto_679237 ) ) ( not ( = ?auto_679231 ?auto_679238 ) ) ( not ( = ?auto_679231 ?auto_679239 ) ) ( not ( = ?auto_679231 ?auto_679240 ) ) ( not ( = ?auto_679231 ?auto_679241 ) ) ( not ( = ?auto_679231 ?auto_679242 ) ) ( not ( = ?auto_679232 ?auto_679233 ) ) ( not ( = ?auto_679232 ?auto_679234 ) ) ( not ( = ?auto_679232 ?auto_679235 ) ) ( not ( = ?auto_679232 ?auto_679236 ) ) ( not ( = ?auto_679232 ?auto_679237 ) ) ( not ( = ?auto_679232 ?auto_679238 ) ) ( not ( = ?auto_679232 ?auto_679239 ) ) ( not ( = ?auto_679232 ?auto_679240 ) ) ( not ( = ?auto_679232 ?auto_679241 ) ) ( not ( = ?auto_679232 ?auto_679242 ) ) ( not ( = ?auto_679233 ?auto_679234 ) ) ( not ( = ?auto_679233 ?auto_679235 ) ) ( not ( = ?auto_679233 ?auto_679236 ) ) ( not ( = ?auto_679233 ?auto_679237 ) ) ( not ( = ?auto_679233 ?auto_679238 ) ) ( not ( = ?auto_679233 ?auto_679239 ) ) ( not ( = ?auto_679233 ?auto_679240 ) ) ( not ( = ?auto_679233 ?auto_679241 ) ) ( not ( = ?auto_679233 ?auto_679242 ) ) ( not ( = ?auto_679234 ?auto_679235 ) ) ( not ( = ?auto_679234 ?auto_679236 ) ) ( not ( = ?auto_679234 ?auto_679237 ) ) ( not ( = ?auto_679234 ?auto_679238 ) ) ( not ( = ?auto_679234 ?auto_679239 ) ) ( not ( = ?auto_679234 ?auto_679240 ) ) ( not ( = ?auto_679234 ?auto_679241 ) ) ( not ( = ?auto_679234 ?auto_679242 ) ) ( not ( = ?auto_679235 ?auto_679236 ) ) ( not ( = ?auto_679235 ?auto_679237 ) ) ( not ( = ?auto_679235 ?auto_679238 ) ) ( not ( = ?auto_679235 ?auto_679239 ) ) ( not ( = ?auto_679235 ?auto_679240 ) ) ( not ( = ?auto_679235 ?auto_679241 ) ) ( not ( = ?auto_679235 ?auto_679242 ) ) ( not ( = ?auto_679236 ?auto_679237 ) ) ( not ( = ?auto_679236 ?auto_679238 ) ) ( not ( = ?auto_679236 ?auto_679239 ) ) ( not ( = ?auto_679236 ?auto_679240 ) ) ( not ( = ?auto_679236 ?auto_679241 ) ) ( not ( = ?auto_679236 ?auto_679242 ) ) ( not ( = ?auto_679237 ?auto_679238 ) ) ( not ( = ?auto_679237 ?auto_679239 ) ) ( not ( = ?auto_679237 ?auto_679240 ) ) ( not ( = ?auto_679237 ?auto_679241 ) ) ( not ( = ?auto_679237 ?auto_679242 ) ) ( not ( = ?auto_679238 ?auto_679239 ) ) ( not ( = ?auto_679238 ?auto_679240 ) ) ( not ( = ?auto_679238 ?auto_679241 ) ) ( not ( = ?auto_679238 ?auto_679242 ) ) ( not ( = ?auto_679239 ?auto_679240 ) ) ( not ( = ?auto_679239 ?auto_679241 ) ) ( not ( = ?auto_679239 ?auto_679242 ) ) ( not ( = ?auto_679240 ?auto_679241 ) ) ( not ( = ?auto_679240 ?auto_679242 ) ) ( not ( = ?auto_679241 ?auto_679242 ) ) ( ON ?auto_679241 ?auto_679242 ) ( ON ?auto_679240 ?auto_679241 ) ( ON ?auto_679239 ?auto_679240 ) ( ON ?auto_679238 ?auto_679239 ) ( ON ?auto_679237 ?auto_679238 ) ( CLEAR ?auto_679235 ) ( ON ?auto_679236 ?auto_679237 ) ( CLEAR ?auto_679236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_679226 ?auto_679227 ?auto_679228 ?auto_679229 ?auto_679230 ?auto_679231 ?auto_679232 ?auto_679233 ?auto_679234 ?auto_679235 ?auto_679236 )
      ( MAKE-17PILE ?auto_679226 ?auto_679227 ?auto_679228 ?auto_679229 ?auto_679230 ?auto_679231 ?auto_679232 ?auto_679233 ?auto_679234 ?auto_679235 ?auto_679236 ?auto_679237 ?auto_679238 ?auto_679239 ?auto_679240 ?auto_679241 ?auto_679242 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679260 - BLOCK
      ?auto_679261 - BLOCK
      ?auto_679262 - BLOCK
      ?auto_679263 - BLOCK
      ?auto_679264 - BLOCK
      ?auto_679265 - BLOCK
      ?auto_679266 - BLOCK
      ?auto_679267 - BLOCK
      ?auto_679268 - BLOCK
      ?auto_679269 - BLOCK
      ?auto_679270 - BLOCK
      ?auto_679271 - BLOCK
      ?auto_679272 - BLOCK
      ?auto_679273 - BLOCK
      ?auto_679274 - BLOCK
      ?auto_679275 - BLOCK
      ?auto_679276 - BLOCK
    )
    :vars
    (
      ?auto_679277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679276 ?auto_679277 ) ( ON-TABLE ?auto_679260 ) ( ON ?auto_679261 ?auto_679260 ) ( ON ?auto_679262 ?auto_679261 ) ( ON ?auto_679263 ?auto_679262 ) ( ON ?auto_679264 ?auto_679263 ) ( ON ?auto_679265 ?auto_679264 ) ( ON ?auto_679266 ?auto_679265 ) ( ON ?auto_679267 ?auto_679266 ) ( ON ?auto_679268 ?auto_679267 ) ( not ( = ?auto_679260 ?auto_679261 ) ) ( not ( = ?auto_679260 ?auto_679262 ) ) ( not ( = ?auto_679260 ?auto_679263 ) ) ( not ( = ?auto_679260 ?auto_679264 ) ) ( not ( = ?auto_679260 ?auto_679265 ) ) ( not ( = ?auto_679260 ?auto_679266 ) ) ( not ( = ?auto_679260 ?auto_679267 ) ) ( not ( = ?auto_679260 ?auto_679268 ) ) ( not ( = ?auto_679260 ?auto_679269 ) ) ( not ( = ?auto_679260 ?auto_679270 ) ) ( not ( = ?auto_679260 ?auto_679271 ) ) ( not ( = ?auto_679260 ?auto_679272 ) ) ( not ( = ?auto_679260 ?auto_679273 ) ) ( not ( = ?auto_679260 ?auto_679274 ) ) ( not ( = ?auto_679260 ?auto_679275 ) ) ( not ( = ?auto_679260 ?auto_679276 ) ) ( not ( = ?auto_679260 ?auto_679277 ) ) ( not ( = ?auto_679261 ?auto_679262 ) ) ( not ( = ?auto_679261 ?auto_679263 ) ) ( not ( = ?auto_679261 ?auto_679264 ) ) ( not ( = ?auto_679261 ?auto_679265 ) ) ( not ( = ?auto_679261 ?auto_679266 ) ) ( not ( = ?auto_679261 ?auto_679267 ) ) ( not ( = ?auto_679261 ?auto_679268 ) ) ( not ( = ?auto_679261 ?auto_679269 ) ) ( not ( = ?auto_679261 ?auto_679270 ) ) ( not ( = ?auto_679261 ?auto_679271 ) ) ( not ( = ?auto_679261 ?auto_679272 ) ) ( not ( = ?auto_679261 ?auto_679273 ) ) ( not ( = ?auto_679261 ?auto_679274 ) ) ( not ( = ?auto_679261 ?auto_679275 ) ) ( not ( = ?auto_679261 ?auto_679276 ) ) ( not ( = ?auto_679261 ?auto_679277 ) ) ( not ( = ?auto_679262 ?auto_679263 ) ) ( not ( = ?auto_679262 ?auto_679264 ) ) ( not ( = ?auto_679262 ?auto_679265 ) ) ( not ( = ?auto_679262 ?auto_679266 ) ) ( not ( = ?auto_679262 ?auto_679267 ) ) ( not ( = ?auto_679262 ?auto_679268 ) ) ( not ( = ?auto_679262 ?auto_679269 ) ) ( not ( = ?auto_679262 ?auto_679270 ) ) ( not ( = ?auto_679262 ?auto_679271 ) ) ( not ( = ?auto_679262 ?auto_679272 ) ) ( not ( = ?auto_679262 ?auto_679273 ) ) ( not ( = ?auto_679262 ?auto_679274 ) ) ( not ( = ?auto_679262 ?auto_679275 ) ) ( not ( = ?auto_679262 ?auto_679276 ) ) ( not ( = ?auto_679262 ?auto_679277 ) ) ( not ( = ?auto_679263 ?auto_679264 ) ) ( not ( = ?auto_679263 ?auto_679265 ) ) ( not ( = ?auto_679263 ?auto_679266 ) ) ( not ( = ?auto_679263 ?auto_679267 ) ) ( not ( = ?auto_679263 ?auto_679268 ) ) ( not ( = ?auto_679263 ?auto_679269 ) ) ( not ( = ?auto_679263 ?auto_679270 ) ) ( not ( = ?auto_679263 ?auto_679271 ) ) ( not ( = ?auto_679263 ?auto_679272 ) ) ( not ( = ?auto_679263 ?auto_679273 ) ) ( not ( = ?auto_679263 ?auto_679274 ) ) ( not ( = ?auto_679263 ?auto_679275 ) ) ( not ( = ?auto_679263 ?auto_679276 ) ) ( not ( = ?auto_679263 ?auto_679277 ) ) ( not ( = ?auto_679264 ?auto_679265 ) ) ( not ( = ?auto_679264 ?auto_679266 ) ) ( not ( = ?auto_679264 ?auto_679267 ) ) ( not ( = ?auto_679264 ?auto_679268 ) ) ( not ( = ?auto_679264 ?auto_679269 ) ) ( not ( = ?auto_679264 ?auto_679270 ) ) ( not ( = ?auto_679264 ?auto_679271 ) ) ( not ( = ?auto_679264 ?auto_679272 ) ) ( not ( = ?auto_679264 ?auto_679273 ) ) ( not ( = ?auto_679264 ?auto_679274 ) ) ( not ( = ?auto_679264 ?auto_679275 ) ) ( not ( = ?auto_679264 ?auto_679276 ) ) ( not ( = ?auto_679264 ?auto_679277 ) ) ( not ( = ?auto_679265 ?auto_679266 ) ) ( not ( = ?auto_679265 ?auto_679267 ) ) ( not ( = ?auto_679265 ?auto_679268 ) ) ( not ( = ?auto_679265 ?auto_679269 ) ) ( not ( = ?auto_679265 ?auto_679270 ) ) ( not ( = ?auto_679265 ?auto_679271 ) ) ( not ( = ?auto_679265 ?auto_679272 ) ) ( not ( = ?auto_679265 ?auto_679273 ) ) ( not ( = ?auto_679265 ?auto_679274 ) ) ( not ( = ?auto_679265 ?auto_679275 ) ) ( not ( = ?auto_679265 ?auto_679276 ) ) ( not ( = ?auto_679265 ?auto_679277 ) ) ( not ( = ?auto_679266 ?auto_679267 ) ) ( not ( = ?auto_679266 ?auto_679268 ) ) ( not ( = ?auto_679266 ?auto_679269 ) ) ( not ( = ?auto_679266 ?auto_679270 ) ) ( not ( = ?auto_679266 ?auto_679271 ) ) ( not ( = ?auto_679266 ?auto_679272 ) ) ( not ( = ?auto_679266 ?auto_679273 ) ) ( not ( = ?auto_679266 ?auto_679274 ) ) ( not ( = ?auto_679266 ?auto_679275 ) ) ( not ( = ?auto_679266 ?auto_679276 ) ) ( not ( = ?auto_679266 ?auto_679277 ) ) ( not ( = ?auto_679267 ?auto_679268 ) ) ( not ( = ?auto_679267 ?auto_679269 ) ) ( not ( = ?auto_679267 ?auto_679270 ) ) ( not ( = ?auto_679267 ?auto_679271 ) ) ( not ( = ?auto_679267 ?auto_679272 ) ) ( not ( = ?auto_679267 ?auto_679273 ) ) ( not ( = ?auto_679267 ?auto_679274 ) ) ( not ( = ?auto_679267 ?auto_679275 ) ) ( not ( = ?auto_679267 ?auto_679276 ) ) ( not ( = ?auto_679267 ?auto_679277 ) ) ( not ( = ?auto_679268 ?auto_679269 ) ) ( not ( = ?auto_679268 ?auto_679270 ) ) ( not ( = ?auto_679268 ?auto_679271 ) ) ( not ( = ?auto_679268 ?auto_679272 ) ) ( not ( = ?auto_679268 ?auto_679273 ) ) ( not ( = ?auto_679268 ?auto_679274 ) ) ( not ( = ?auto_679268 ?auto_679275 ) ) ( not ( = ?auto_679268 ?auto_679276 ) ) ( not ( = ?auto_679268 ?auto_679277 ) ) ( not ( = ?auto_679269 ?auto_679270 ) ) ( not ( = ?auto_679269 ?auto_679271 ) ) ( not ( = ?auto_679269 ?auto_679272 ) ) ( not ( = ?auto_679269 ?auto_679273 ) ) ( not ( = ?auto_679269 ?auto_679274 ) ) ( not ( = ?auto_679269 ?auto_679275 ) ) ( not ( = ?auto_679269 ?auto_679276 ) ) ( not ( = ?auto_679269 ?auto_679277 ) ) ( not ( = ?auto_679270 ?auto_679271 ) ) ( not ( = ?auto_679270 ?auto_679272 ) ) ( not ( = ?auto_679270 ?auto_679273 ) ) ( not ( = ?auto_679270 ?auto_679274 ) ) ( not ( = ?auto_679270 ?auto_679275 ) ) ( not ( = ?auto_679270 ?auto_679276 ) ) ( not ( = ?auto_679270 ?auto_679277 ) ) ( not ( = ?auto_679271 ?auto_679272 ) ) ( not ( = ?auto_679271 ?auto_679273 ) ) ( not ( = ?auto_679271 ?auto_679274 ) ) ( not ( = ?auto_679271 ?auto_679275 ) ) ( not ( = ?auto_679271 ?auto_679276 ) ) ( not ( = ?auto_679271 ?auto_679277 ) ) ( not ( = ?auto_679272 ?auto_679273 ) ) ( not ( = ?auto_679272 ?auto_679274 ) ) ( not ( = ?auto_679272 ?auto_679275 ) ) ( not ( = ?auto_679272 ?auto_679276 ) ) ( not ( = ?auto_679272 ?auto_679277 ) ) ( not ( = ?auto_679273 ?auto_679274 ) ) ( not ( = ?auto_679273 ?auto_679275 ) ) ( not ( = ?auto_679273 ?auto_679276 ) ) ( not ( = ?auto_679273 ?auto_679277 ) ) ( not ( = ?auto_679274 ?auto_679275 ) ) ( not ( = ?auto_679274 ?auto_679276 ) ) ( not ( = ?auto_679274 ?auto_679277 ) ) ( not ( = ?auto_679275 ?auto_679276 ) ) ( not ( = ?auto_679275 ?auto_679277 ) ) ( not ( = ?auto_679276 ?auto_679277 ) ) ( ON ?auto_679275 ?auto_679276 ) ( ON ?auto_679274 ?auto_679275 ) ( ON ?auto_679273 ?auto_679274 ) ( ON ?auto_679272 ?auto_679273 ) ( ON ?auto_679271 ?auto_679272 ) ( ON ?auto_679270 ?auto_679271 ) ( CLEAR ?auto_679268 ) ( ON ?auto_679269 ?auto_679270 ) ( CLEAR ?auto_679269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_679260 ?auto_679261 ?auto_679262 ?auto_679263 ?auto_679264 ?auto_679265 ?auto_679266 ?auto_679267 ?auto_679268 ?auto_679269 )
      ( MAKE-17PILE ?auto_679260 ?auto_679261 ?auto_679262 ?auto_679263 ?auto_679264 ?auto_679265 ?auto_679266 ?auto_679267 ?auto_679268 ?auto_679269 ?auto_679270 ?auto_679271 ?auto_679272 ?auto_679273 ?auto_679274 ?auto_679275 ?auto_679276 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679295 - BLOCK
      ?auto_679296 - BLOCK
      ?auto_679297 - BLOCK
      ?auto_679298 - BLOCK
      ?auto_679299 - BLOCK
      ?auto_679300 - BLOCK
      ?auto_679301 - BLOCK
      ?auto_679302 - BLOCK
      ?auto_679303 - BLOCK
      ?auto_679304 - BLOCK
      ?auto_679305 - BLOCK
      ?auto_679306 - BLOCK
      ?auto_679307 - BLOCK
      ?auto_679308 - BLOCK
      ?auto_679309 - BLOCK
      ?auto_679310 - BLOCK
      ?auto_679311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679311 ) ( ON-TABLE ?auto_679295 ) ( ON ?auto_679296 ?auto_679295 ) ( ON ?auto_679297 ?auto_679296 ) ( ON ?auto_679298 ?auto_679297 ) ( ON ?auto_679299 ?auto_679298 ) ( ON ?auto_679300 ?auto_679299 ) ( ON ?auto_679301 ?auto_679300 ) ( ON ?auto_679302 ?auto_679301 ) ( ON ?auto_679303 ?auto_679302 ) ( not ( = ?auto_679295 ?auto_679296 ) ) ( not ( = ?auto_679295 ?auto_679297 ) ) ( not ( = ?auto_679295 ?auto_679298 ) ) ( not ( = ?auto_679295 ?auto_679299 ) ) ( not ( = ?auto_679295 ?auto_679300 ) ) ( not ( = ?auto_679295 ?auto_679301 ) ) ( not ( = ?auto_679295 ?auto_679302 ) ) ( not ( = ?auto_679295 ?auto_679303 ) ) ( not ( = ?auto_679295 ?auto_679304 ) ) ( not ( = ?auto_679295 ?auto_679305 ) ) ( not ( = ?auto_679295 ?auto_679306 ) ) ( not ( = ?auto_679295 ?auto_679307 ) ) ( not ( = ?auto_679295 ?auto_679308 ) ) ( not ( = ?auto_679295 ?auto_679309 ) ) ( not ( = ?auto_679295 ?auto_679310 ) ) ( not ( = ?auto_679295 ?auto_679311 ) ) ( not ( = ?auto_679296 ?auto_679297 ) ) ( not ( = ?auto_679296 ?auto_679298 ) ) ( not ( = ?auto_679296 ?auto_679299 ) ) ( not ( = ?auto_679296 ?auto_679300 ) ) ( not ( = ?auto_679296 ?auto_679301 ) ) ( not ( = ?auto_679296 ?auto_679302 ) ) ( not ( = ?auto_679296 ?auto_679303 ) ) ( not ( = ?auto_679296 ?auto_679304 ) ) ( not ( = ?auto_679296 ?auto_679305 ) ) ( not ( = ?auto_679296 ?auto_679306 ) ) ( not ( = ?auto_679296 ?auto_679307 ) ) ( not ( = ?auto_679296 ?auto_679308 ) ) ( not ( = ?auto_679296 ?auto_679309 ) ) ( not ( = ?auto_679296 ?auto_679310 ) ) ( not ( = ?auto_679296 ?auto_679311 ) ) ( not ( = ?auto_679297 ?auto_679298 ) ) ( not ( = ?auto_679297 ?auto_679299 ) ) ( not ( = ?auto_679297 ?auto_679300 ) ) ( not ( = ?auto_679297 ?auto_679301 ) ) ( not ( = ?auto_679297 ?auto_679302 ) ) ( not ( = ?auto_679297 ?auto_679303 ) ) ( not ( = ?auto_679297 ?auto_679304 ) ) ( not ( = ?auto_679297 ?auto_679305 ) ) ( not ( = ?auto_679297 ?auto_679306 ) ) ( not ( = ?auto_679297 ?auto_679307 ) ) ( not ( = ?auto_679297 ?auto_679308 ) ) ( not ( = ?auto_679297 ?auto_679309 ) ) ( not ( = ?auto_679297 ?auto_679310 ) ) ( not ( = ?auto_679297 ?auto_679311 ) ) ( not ( = ?auto_679298 ?auto_679299 ) ) ( not ( = ?auto_679298 ?auto_679300 ) ) ( not ( = ?auto_679298 ?auto_679301 ) ) ( not ( = ?auto_679298 ?auto_679302 ) ) ( not ( = ?auto_679298 ?auto_679303 ) ) ( not ( = ?auto_679298 ?auto_679304 ) ) ( not ( = ?auto_679298 ?auto_679305 ) ) ( not ( = ?auto_679298 ?auto_679306 ) ) ( not ( = ?auto_679298 ?auto_679307 ) ) ( not ( = ?auto_679298 ?auto_679308 ) ) ( not ( = ?auto_679298 ?auto_679309 ) ) ( not ( = ?auto_679298 ?auto_679310 ) ) ( not ( = ?auto_679298 ?auto_679311 ) ) ( not ( = ?auto_679299 ?auto_679300 ) ) ( not ( = ?auto_679299 ?auto_679301 ) ) ( not ( = ?auto_679299 ?auto_679302 ) ) ( not ( = ?auto_679299 ?auto_679303 ) ) ( not ( = ?auto_679299 ?auto_679304 ) ) ( not ( = ?auto_679299 ?auto_679305 ) ) ( not ( = ?auto_679299 ?auto_679306 ) ) ( not ( = ?auto_679299 ?auto_679307 ) ) ( not ( = ?auto_679299 ?auto_679308 ) ) ( not ( = ?auto_679299 ?auto_679309 ) ) ( not ( = ?auto_679299 ?auto_679310 ) ) ( not ( = ?auto_679299 ?auto_679311 ) ) ( not ( = ?auto_679300 ?auto_679301 ) ) ( not ( = ?auto_679300 ?auto_679302 ) ) ( not ( = ?auto_679300 ?auto_679303 ) ) ( not ( = ?auto_679300 ?auto_679304 ) ) ( not ( = ?auto_679300 ?auto_679305 ) ) ( not ( = ?auto_679300 ?auto_679306 ) ) ( not ( = ?auto_679300 ?auto_679307 ) ) ( not ( = ?auto_679300 ?auto_679308 ) ) ( not ( = ?auto_679300 ?auto_679309 ) ) ( not ( = ?auto_679300 ?auto_679310 ) ) ( not ( = ?auto_679300 ?auto_679311 ) ) ( not ( = ?auto_679301 ?auto_679302 ) ) ( not ( = ?auto_679301 ?auto_679303 ) ) ( not ( = ?auto_679301 ?auto_679304 ) ) ( not ( = ?auto_679301 ?auto_679305 ) ) ( not ( = ?auto_679301 ?auto_679306 ) ) ( not ( = ?auto_679301 ?auto_679307 ) ) ( not ( = ?auto_679301 ?auto_679308 ) ) ( not ( = ?auto_679301 ?auto_679309 ) ) ( not ( = ?auto_679301 ?auto_679310 ) ) ( not ( = ?auto_679301 ?auto_679311 ) ) ( not ( = ?auto_679302 ?auto_679303 ) ) ( not ( = ?auto_679302 ?auto_679304 ) ) ( not ( = ?auto_679302 ?auto_679305 ) ) ( not ( = ?auto_679302 ?auto_679306 ) ) ( not ( = ?auto_679302 ?auto_679307 ) ) ( not ( = ?auto_679302 ?auto_679308 ) ) ( not ( = ?auto_679302 ?auto_679309 ) ) ( not ( = ?auto_679302 ?auto_679310 ) ) ( not ( = ?auto_679302 ?auto_679311 ) ) ( not ( = ?auto_679303 ?auto_679304 ) ) ( not ( = ?auto_679303 ?auto_679305 ) ) ( not ( = ?auto_679303 ?auto_679306 ) ) ( not ( = ?auto_679303 ?auto_679307 ) ) ( not ( = ?auto_679303 ?auto_679308 ) ) ( not ( = ?auto_679303 ?auto_679309 ) ) ( not ( = ?auto_679303 ?auto_679310 ) ) ( not ( = ?auto_679303 ?auto_679311 ) ) ( not ( = ?auto_679304 ?auto_679305 ) ) ( not ( = ?auto_679304 ?auto_679306 ) ) ( not ( = ?auto_679304 ?auto_679307 ) ) ( not ( = ?auto_679304 ?auto_679308 ) ) ( not ( = ?auto_679304 ?auto_679309 ) ) ( not ( = ?auto_679304 ?auto_679310 ) ) ( not ( = ?auto_679304 ?auto_679311 ) ) ( not ( = ?auto_679305 ?auto_679306 ) ) ( not ( = ?auto_679305 ?auto_679307 ) ) ( not ( = ?auto_679305 ?auto_679308 ) ) ( not ( = ?auto_679305 ?auto_679309 ) ) ( not ( = ?auto_679305 ?auto_679310 ) ) ( not ( = ?auto_679305 ?auto_679311 ) ) ( not ( = ?auto_679306 ?auto_679307 ) ) ( not ( = ?auto_679306 ?auto_679308 ) ) ( not ( = ?auto_679306 ?auto_679309 ) ) ( not ( = ?auto_679306 ?auto_679310 ) ) ( not ( = ?auto_679306 ?auto_679311 ) ) ( not ( = ?auto_679307 ?auto_679308 ) ) ( not ( = ?auto_679307 ?auto_679309 ) ) ( not ( = ?auto_679307 ?auto_679310 ) ) ( not ( = ?auto_679307 ?auto_679311 ) ) ( not ( = ?auto_679308 ?auto_679309 ) ) ( not ( = ?auto_679308 ?auto_679310 ) ) ( not ( = ?auto_679308 ?auto_679311 ) ) ( not ( = ?auto_679309 ?auto_679310 ) ) ( not ( = ?auto_679309 ?auto_679311 ) ) ( not ( = ?auto_679310 ?auto_679311 ) ) ( ON ?auto_679310 ?auto_679311 ) ( ON ?auto_679309 ?auto_679310 ) ( ON ?auto_679308 ?auto_679309 ) ( ON ?auto_679307 ?auto_679308 ) ( ON ?auto_679306 ?auto_679307 ) ( ON ?auto_679305 ?auto_679306 ) ( CLEAR ?auto_679303 ) ( ON ?auto_679304 ?auto_679305 ) ( CLEAR ?auto_679304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_679295 ?auto_679296 ?auto_679297 ?auto_679298 ?auto_679299 ?auto_679300 ?auto_679301 ?auto_679302 ?auto_679303 ?auto_679304 )
      ( MAKE-17PILE ?auto_679295 ?auto_679296 ?auto_679297 ?auto_679298 ?auto_679299 ?auto_679300 ?auto_679301 ?auto_679302 ?auto_679303 ?auto_679304 ?auto_679305 ?auto_679306 ?auto_679307 ?auto_679308 ?auto_679309 ?auto_679310 ?auto_679311 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679329 - BLOCK
      ?auto_679330 - BLOCK
      ?auto_679331 - BLOCK
      ?auto_679332 - BLOCK
      ?auto_679333 - BLOCK
      ?auto_679334 - BLOCK
      ?auto_679335 - BLOCK
      ?auto_679336 - BLOCK
      ?auto_679337 - BLOCK
      ?auto_679338 - BLOCK
      ?auto_679339 - BLOCK
      ?auto_679340 - BLOCK
      ?auto_679341 - BLOCK
      ?auto_679342 - BLOCK
      ?auto_679343 - BLOCK
      ?auto_679344 - BLOCK
      ?auto_679345 - BLOCK
    )
    :vars
    (
      ?auto_679346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679345 ?auto_679346 ) ( ON-TABLE ?auto_679329 ) ( ON ?auto_679330 ?auto_679329 ) ( ON ?auto_679331 ?auto_679330 ) ( ON ?auto_679332 ?auto_679331 ) ( ON ?auto_679333 ?auto_679332 ) ( ON ?auto_679334 ?auto_679333 ) ( ON ?auto_679335 ?auto_679334 ) ( ON ?auto_679336 ?auto_679335 ) ( not ( = ?auto_679329 ?auto_679330 ) ) ( not ( = ?auto_679329 ?auto_679331 ) ) ( not ( = ?auto_679329 ?auto_679332 ) ) ( not ( = ?auto_679329 ?auto_679333 ) ) ( not ( = ?auto_679329 ?auto_679334 ) ) ( not ( = ?auto_679329 ?auto_679335 ) ) ( not ( = ?auto_679329 ?auto_679336 ) ) ( not ( = ?auto_679329 ?auto_679337 ) ) ( not ( = ?auto_679329 ?auto_679338 ) ) ( not ( = ?auto_679329 ?auto_679339 ) ) ( not ( = ?auto_679329 ?auto_679340 ) ) ( not ( = ?auto_679329 ?auto_679341 ) ) ( not ( = ?auto_679329 ?auto_679342 ) ) ( not ( = ?auto_679329 ?auto_679343 ) ) ( not ( = ?auto_679329 ?auto_679344 ) ) ( not ( = ?auto_679329 ?auto_679345 ) ) ( not ( = ?auto_679329 ?auto_679346 ) ) ( not ( = ?auto_679330 ?auto_679331 ) ) ( not ( = ?auto_679330 ?auto_679332 ) ) ( not ( = ?auto_679330 ?auto_679333 ) ) ( not ( = ?auto_679330 ?auto_679334 ) ) ( not ( = ?auto_679330 ?auto_679335 ) ) ( not ( = ?auto_679330 ?auto_679336 ) ) ( not ( = ?auto_679330 ?auto_679337 ) ) ( not ( = ?auto_679330 ?auto_679338 ) ) ( not ( = ?auto_679330 ?auto_679339 ) ) ( not ( = ?auto_679330 ?auto_679340 ) ) ( not ( = ?auto_679330 ?auto_679341 ) ) ( not ( = ?auto_679330 ?auto_679342 ) ) ( not ( = ?auto_679330 ?auto_679343 ) ) ( not ( = ?auto_679330 ?auto_679344 ) ) ( not ( = ?auto_679330 ?auto_679345 ) ) ( not ( = ?auto_679330 ?auto_679346 ) ) ( not ( = ?auto_679331 ?auto_679332 ) ) ( not ( = ?auto_679331 ?auto_679333 ) ) ( not ( = ?auto_679331 ?auto_679334 ) ) ( not ( = ?auto_679331 ?auto_679335 ) ) ( not ( = ?auto_679331 ?auto_679336 ) ) ( not ( = ?auto_679331 ?auto_679337 ) ) ( not ( = ?auto_679331 ?auto_679338 ) ) ( not ( = ?auto_679331 ?auto_679339 ) ) ( not ( = ?auto_679331 ?auto_679340 ) ) ( not ( = ?auto_679331 ?auto_679341 ) ) ( not ( = ?auto_679331 ?auto_679342 ) ) ( not ( = ?auto_679331 ?auto_679343 ) ) ( not ( = ?auto_679331 ?auto_679344 ) ) ( not ( = ?auto_679331 ?auto_679345 ) ) ( not ( = ?auto_679331 ?auto_679346 ) ) ( not ( = ?auto_679332 ?auto_679333 ) ) ( not ( = ?auto_679332 ?auto_679334 ) ) ( not ( = ?auto_679332 ?auto_679335 ) ) ( not ( = ?auto_679332 ?auto_679336 ) ) ( not ( = ?auto_679332 ?auto_679337 ) ) ( not ( = ?auto_679332 ?auto_679338 ) ) ( not ( = ?auto_679332 ?auto_679339 ) ) ( not ( = ?auto_679332 ?auto_679340 ) ) ( not ( = ?auto_679332 ?auto_679341 ) ) ( not ( = ?auto_679332 ?auto_679342 ) ) ( not ( = ?auto_679332 ?auto_679343 ) ) ( not ( = ?auto_679332 ?auto_679344 ) ) ( not ( = ?auto_679332 ?auto_679345 ) ) ( not ( = ?auto_679332 ?auto_679346 ) ) ( not ( = ?auto_679333 ?auto_679334 ) ) ( not ( = ?auto_679333 ?auto_679335 ) ) ( not ( = ?auto_679333 ?auto_679336 ) ) ( not ( = ?auto_679333 ?auto_679337 ) ) ( not ( = ?auto_679333 ?auto_679338 ) ) ( not ( = ?auto_679333 ?auto_679339 ) ) ( not ( = ?auto_679333 ?auto_679340 ) ) ( not ( = ?auto_679333 ?auto_679341 ) ) ( not ( = ?auto_679333 ?auto_679342 ) ) ( not ( = ?auto_679333 ?auto_679343 ) ) ( not ( = ?auto_679333 ?auto_679344 ) ) ( not ( = ?auto_679333 ?auto_679345 ) ) ( not ( = ?auto_679333 ?auto_679346 ) ) ( not ( = ?auto_679334 ?auto_679335 ) ) ( not ( = ?auto_679334 ?auto_679336 ) ) ( not ( = ?auto_679334 ?auto_679337 ) ) ( not ( = ?auto_679334 ?auto_679338 ) ) ( not ( = ?auto_679334 ?auto_679339 ) ) ( not ( = ?auto_679334 ?auto_679340 ) ) ( not ( = ?auto_679334 ?auto_679341 ) ) ( not ( = ?auto_679334 ?auto_679342 ) ) ( not ( = ?auto_679334 ?auto_679343 ) ) ( not ( = ?auto_679334 ?auto_679344 ) ) ( not ( = ?auto_679334 ?auto_679345 ) ) ( not ( = ?auto_679334 ?auto_679346 ) ) ( not ( = ?auto_679335 ?auto_679336 ) ) ( not ( = ?auto_679335 ?auto_679337 ) ) ( not ( = ?auto_679335 ?auto_679338 ) ) ( not ( = ?auto_679335 ?auto_679339 ) ) ( not ( = ?auto_679335 ?auto_679340 ) ) ( not ( = ?auto_679335 ?auto_679341 ) ) ( not ( = ?auto_679335 ?auto_679342 ) ) ( not ( = ?auto_679335 ?auto_679343 ) ) ( not ( = ?auto_679335 ?auto_679344 ) ) ( not ( = ?auto_679335 ?auto_679345 ) ) ( not ( = ?auto_679335 ?auto_679346 ) ) ( not ( = ?auto_679336 ?auto_679337 ) ) ( not ( = ?auto_679336 ?auto_679338 ) ) ( not ( = ?auto_679336 ?auto_679339 ) ) ( not ( = ?auto_679336 ?auto_679340 ) ) ( not ( = ?auto_679336 ?auto_679341 ) ) ( not ( = ?auto_679336 ?auto_679342 ) ) ( not ( = ?auto_679336 ?auto_679343 ) ) ( not ( = ?auto_679336 ?auto_679344 ) ) ( not ( = ?auto_679336 ?auto_679345 ) ) ( not ( = ?auto_679336 ?auto_679346 ) ) ( not ( = ?auto_679337 ?auto_679338 ) ) ( not ( = ?auto_679337 ?auto_679339 ) ) ( not ( = ?auto_679337 ?auto_679340 ) ) ( not ( = ?auto_679337 ?auto_679341 ) ) ( not ( = ?auto_679337 ?auto_679342 ) ) ( not ( = ?auto_679337 ?auto_679343 ) ) ( not ( = ?auto_679337 ?auto_679344 ) ) ( not ( = ?auto_679337 ?auto_679345 ) ) ( not ( = ?auto_679337 ?auto_679346 ) ) ( not ( = ?auto_679338 ?auto_679339 ) ) ( not ( = ?auto_679338 ?auto_679340 ) ) ( not ( = ?auto_679338 ?auto_679341 ) ) ( not ( = ?auto_679338 ?auto_679342 ) ) ( not ( = ?auto_679338 ?auto_679343 ) ) ( not ( = ?auto_679338 ?auto_679344 ) ) ( not ( = ?auto_679338 ?auto_679345 ) ) ( not ( = ?auto_679338 ?auto_679346 ) ) ( not ( = ?auto_679339 ?auto_679340 ) ) ( not ( = ?auto_679339 ?auto_679341 ) ) ( not ( = ?auto_679339 ?auto_679342 ) ) ( not ( = ?auto_679339 ?auto_679343 ) ) ( not ( = ?auto_679339 ?auto_679344 ) ) ( not ( = ?auto_679339 ?auto_679345 ) ) ( not ( = ?auto_679339 ?auto_679346 ) ) ( not ( = ?auto_679340 ?auto_679341 ) ) ( not ( = ?auto_679340 ?auto_679342 ) ) ( not ( = ?auto_679340 ?auto_679343 ) ) ( not ( = ?auto_679340 ?auto_679344 ) ) ( not ( = ?auto_679340 ?auto_679345 ) ) ( not ( = ?auto_679340 ?auto_679346 ) ) ( not ( = ?auto_679341 ?auto_679342 ) ) ( not ( = ?auto_679341 ?auto_679343 ) ) ( not ( = ?auto_679341 ?auto_679344 ) ) ( not ( = ?auto_679341 ?auto_679345 ) ) ( not ( = ?auto_679341 ?auto_679346 ) ) ( not ( = ?auto_679342 ?auto_679343 ) ) ( not ( = ?auto_679342 ?auto_679344 ) ) ( not ( = ?auto_679342 ?auto_679345 ) ) ( not ( = ?auto_679342 ?auto_679346 ) ) ( not ( = ?auto_679343 ?auto_679344 ) ) ( not ( = ?auto_679343 ?auto_679345 ) ) ( not ( = ?auto_679343 ?auto_679346 ) ) ( not ( = ?auto_679344 ?auto_679345 ) ) ( not ( = ?auto_679344 ?auto_679346 ) ) ( not ( = ?auto_679345 ?auto_679346 ) ) ( ON ?auto_679344 ?auto_679345 ) ( ON ?auto_679343 ?auto_679344 ) ( ON ?auto_679342 ?auto_679343 ) ( ON ?auto_679341 ?auto_679342 ) ( ON ?auto_679340 ?auto_679341 ) ( ON ?auto_679339 ?auto_679340 ) ( ON ?auto_679338 ?auto_679339 ) ( CLEAR ?auto_679336 ) ( ON ?auto_679337 ?auto_679338 ) ( CLEAR ?auto_679337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_679329 ?auto_679330 ?auto_679331 ?auto_679332 ?auto_679333 ?auto_679334 ?auto_679335 ?auto_679336 ?auto_679337 )
      ( MAKE-17PILE ?auto_679329 ?auto_679330 ?auto_679331 ?auto_679332 ?auto_679333 ?auto_679334 ?auto_679335 ?auto_679336 ?auto_679337 ?auto_679338 ?auto_679339 ?auto_679340 ?auto_679341 ?auto_679342 ?auto_679343 ?auto_679344 ?auto_679345 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679364 - BLOCK
      ?auto_679365 - BLOCK
      ?auto_679366 - BLOCK
      ?auto_679367 - BLOCK
      ?auto_679368 - BLOCK
      ?auto_679369 - BLOCK
      ?auto_679370 - BLOCK
      ?auto_679371 - BLOCK
      ?auto_679372 - BLOCK
      ?auto_679373 - BLOCK
      ?auto_679374 - BLOCK
      ?auto_679375 - BLOCK
      ?auto_679376 - BLOCK
      ?auto_679377 - BLOCK
      ?auto_679378 - BLOCK
      ?auto_679379 - BLOCK
      ?auto_679380 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679380 ) ( ON-TABLE ?auto_679364 ) ( ON ?auto_679365 ?auto_679364 ) ( ON ?auto_679366 ?auto_679365 ) ( ON ?auto_679367 ?auto_679366 ) ( ON ?auto_679368 ?auto_679367 ) ( ON ?auto_679369 ?auto_679368 ) ( ON ?auto_679370 ?auto_679369 ) ( ON ?auto_679371 ?auto_679370 ) ( not ( = ?auto_679364 ?auto_679365 ) ) ( not ( = ?auto_679364 ?auto_679366 ) ) ( not ( = ?auto_679364 ?auto_679367 ) ) ( not ( = ?auto_679364 ?auto_679368 ) ) ( not ( = ?auto_679364 ?auto_679369 ) ) ( not ( = ?auto_679364 ?auto_679370 ) ) ( not ( = ?auto_679364 ?auto_679371 ) ) ( not ( = ?auto_679364 ?auto_679372 ) ) ( not ( = ?auto_679364 ?auto_679373 ) ) ( not ( = ?auto_679364 ?auto_679374 ) ) ( not ( = ?auto_679364 ?auto_679375 ) ) ( not ( = ?auto_679364 ?auto_679376 ) ) ( not ( = ?auto_679364 ?auto_679377 ) ) ( not ( = ?auto_679364 ?auto_679378 ) ) ( not ( = ?auto_679364 ?auto_679379 ) ) ( not ( = ?auto_679364 ?auto_679380 ) ) ( not ( = ?auto_679365 ?auto_679366 ) ) ( not ( = ?auto_679365 ?auto_679367 ) ) ( not ( = ?auto_679365 ?auto_679368 ) ) ( not ( = ?auto_679365 ?auto_679369 ) ) ( not ( = ?auto_679365 ?auto_679370 ) ) ( not ( = ?auto_679365 ?auto_679371 ) ) ( not ( = ?auto_679365 ?auto_679372 ) ) ( not ( = ?auto_679365 ?auto_679373 ) ) ( not ( = ?auto_679365 ?auto_679374 ) ) ( not ( = ?auto_679365 ?auto_679375 ) ) ( not ( = ?auto_679365 ?auto_679376 ) ) ( not ( = ?auto_679365 ?auto_679377 ) ) ( not ( = ?auto_679365 ?auto_679378 ) ) ( not ( = ?auto_679365 ?auto_679379 ) ) ( not ( = ?auto_679365 ?auto_679380 ) ) ( not ( = ?auto_679366 ?auto_679367 ) ) ( not ( = ?auto_679366 ?auto_679368 ) ) ( not ( = ?auto_679366 ?auto_679369 ) ) ( not ( = ?auto_679366 ?auto_679370 ) ) ( not ( = ?auto_679366 ?auto_679371 ) ) ( not ( = ?auto_679366 ?auto_679372 ) ) ( not ( = ?auto_679366 ?auto_679373 ) ) ( not ( = ?auto_679366 ?auto_679374 ) ) ( not ( = ?auto_679366 ?auto_679375 ) ) ( not ( = ?auto_679366 ?auto_679376 ) ) ( not ( = ?auto_679366 ?auto_679377 ) ) ( not ( = ?auto_679366 ?auto_679378 ) ) ( not ( = ?auto_679366 ?auto_679379 ) ) ( not ( = ?auto_679366 ?auto_679380 ) ) ( not ( = ?auto_679367 ?auto_679368 ) ) ( not ( = ?auto_679367 ?auto_679369 ) ) ( not ( = ?auto_679367 ?auto_679370 ) ) ( not ( = ?auto_679367 ?auto_679371 ) ) ( not ( = ?auto_679367 ?auto_679372 ) ) ( not ( = ?auto_679367 ?auto_679373 ) ) ( not ( = ?auto_679367 ?auto_679374 ) ) ( not ( = ?auto_679367 ?auto_679375 ) ) ( not ( = ?auto_679367 ?auto_679376 ) ) ( not ( = ?auto_679367 ?auto_679377 ) ) ( not ( = ?auto_679367 ?auto_679378 ) ) ( not ( = ?auto_679367 ?auto_679379 ) ) ( not ( = ?auto_679367 ?auto_679380 ) ) ( not ( = ?auto_679368 ?auto_679369 ) ) ( not ( = ?auto_679368 ?auto_679370 ) ) ( not ( = ?auto_679368 ?auto_679371 ) ) ( not ( = ?auto_679368 ?auto_679372 ) ) ( not ( = ?auto_679368 ?auto_679373 ) ) ( not ( = ?auto_679368 ?auto_679374 ) ) ( not ( = ?auto_679368 ?auto_679375 ) ) ( not ( = ?auto_679368 ?auto_679376 ) ) ( not ( = ?auto_679368 ?auto_679377 ) ) ( not ( = ?auto_679368 ?auto_679378 ) ) ( not ( = ?auto_679368 ?auto_679379 ) ) ( not ( = ?auto_679368 ?auto_679380 ) ) ( not ( = ?auto_679369 ?auto_679370 ) ) ( not ( = ?auto_679369 ?auto_679371 ) ) ( not ( = ?auto_679369 ?auto_679372 ) ) ( not ( = ?auto_679369 ?auto_679373 ) ) ( not ( = ?auto_679369 ?auto_679374 ) ) ( not ( = ?auto_679369 ?auto_679375 ) ) ( not ( = ?auto_679369 ?auto_679376 ) ) ( not ( = ?auto_679369 ?auto_679377 ) ) ( not ( = ?auto_679369 ?auto_679378 ) ) ( not ( = ?auto_679369 ?auto_679379 ) ) ( not ( = ?auto_679369 ?auto_679380 ) ) ( not ( = ?auto_679370 ?auto_679371 ) ) ( not ( = ?auto_679370 ?auto_679372 ) ) ( not ( = ?auto_679370 ?auto_679373 ) ) ( not ( = ?auto_679370 ?auto_679374 ) ) ( not ( = ?auto_679370 ?auto_679375 ) ) ( not ( = ?auto_679370 ?auto_679376 ) ) ( not ( = ?auto_679370 ?auto_679377 ) ) ( not ( = ?auto_679370 ?auto_679378 ) ) ( not ( = ?auto_679370 ?auto_679379 ) ) ( not ( = ?auto_679370 ?auto_679380 ) ) ( not ( = ?auto_679371 ?auto_679372 ) ) ( not ( = ?auto_679371 ?auto_679373 ) ) ( not ( = ?auto_679371 ?auto_679374 ) ) ( not ( = ?auto_679371 ?auto_679375 ) ) ( not ( = ?auto_679371 ?auto_679376 ) ) ( not ( = ?auto_679371 ?auto_679377 ) ) ( not ( = ?auto_679371 ?auto_679378 ) ) ( not ( = ?auto_679371 ?auto_679379 ) ) ( not ( = ?auto_679371 ?auto_679380 ) ) ( not ( = ?auto_679372 ?auto_679373 ) ) ( not ( = ?auto_679372 ?auto_679374 ) ) ( not ( = ?auto_679372 ?auto_679375 ) ) ( not ( = ?auto_679372 ?auto_679376 ) ) ( not ( = ?auto_679372 ?auto_679377 ) ) ( not ( = ?auto_679372 ?auto_679378 ) ) ( not ( = ?auto_679372 ?auto_679379 ) ) ( not ( = ?auto_679372 ?auto_679380 ) ) ( not ( = ?auto_679373 ?auto_679374 ) ) ( not ( = ?auto_679373 ?auto_679375 ) ) ( not ( = ?auto_679373 ?auto_679376 ) ) ( not ( = ?auto_679373 ?auto_679377 ) ) ( not ( = ?auto_679373 ?auto_679378 ) ) ( not ( = ?auto_679373 ?auto_679379 ) ) ( not ( = ?auto_679373 ?auto_679380 ) ) ( not ( = ?auto_679374 ?auto_679375 ) ) ( not ( = ?auto_679374 ?auto_679376 ) ) ( not ( = ?auto_679374 ?auto_679377 ) ) ( not ( = ?auto_679374 ?auto_679378 ) ) ( not ( = ?auto_679374 ?auto_679379 ) ) ( not ( = ?auto_679374 ?auto_679380 ) ) ( not ( = ?auto_679375 ?auto_679376 ) ) ( not ( = ?auto_679375 ?auto_679377 ) ) ( not ( = ?auto_679375 ?auto_679378 ) ) ( not ( = ?auto_679375 ?auto_679379 ) ) ( not ( = ?auto_679375 ?auto_679380 ) ) ( not ( = ?auto_679376 ?auto_679377 ) ) ( not ( = ?auto_679376 ?auto_679378 ) ) ( not ( = ?auto_679376 ?auto_679379 ) ) ( not ( = ?auto_679376 ?auto_679380 ) ) ( not ( = ?auto_679377 ?auto_679378 ) ) ( not ( = ?auto_679377 ?auto_679379 ) ) ( not ( = ?auto_679377 ?auto_679380 ) ) ( not ( = ?auto_679378 ?auto_679379 ) ) ( not ( = ?auto_679378 ?auto_679380 ) ) ( not ( = ?auto_679379 ?auto_679380 ) ) ( ON ?auto_679379 ?auto_679380 ) ( ON ?auto_679378 ?auto_679379 ) ( ON ?auto_679377 ?auto_679378 ) ( ON ?auto_679376 ?auto_679377 ) ( ON ?auto_679375 ?auto_679376 ) ( ON ?auto_679374 ?auto_679375 ) ( ON ?auto_679373 ?auto_679374 ) ( CLEAR ?auto_679371 ) ( ON ?auto_679372 ?auto_679373 ) ( CLEAR ?auto_679372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_679364 ?auto_679365 ?auto_679366 ?auto_679367 ?auto_679368 ?auto_679369 ?auto_679370 ?auto_679371 ?auto_679372 )
      ( MAKE-17PILE ?auto_679364 ?auto_679365 ?auto_679366 ?auto_679367 ?auto_679368 ?auto_679369 ?auto_679370 ?auto_679371 ?auto_679372 ?auto_679373 ?auto_679374 ?auto_679375 ?auto_679376 ?auto_679377 ?auto_679378 ?auto_679379 ?auto_679380 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679398 - BLOCK
      ?auto_679399 - BLOCK
      ?auto_679400 - BLOCK
      ?auto_679401 - BLOCK
      ?auto_679402 - BLOCK
      ?auto_679403 - BLOCK
      ?auto_679404 - BLOCK
      ?auto_679405 - BLOCK
      ?auto_679406 - BLOCK
      ?auto_679407 - BLOCK
      ?auto_679408 - BLOCK
      ?auto_679409 - BLOCK
      ?auto_679410 - BLOCK
      ?auto_679411 - BLOCK
      ?auto_679412 - BLOCK
      ?auto_679413 - BLOCK
      ?auto_679414 - BLOCK
    )
    :vars
    (
      ?auto_679415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679414 ?auto_679415 ) ( ON-TABLE ?auto_679398 ) ( ON ?auto_679399 ?auto_679398 ) ( ON ?auto_679400 ?auto_679399 ) ( ON ?auto_679401 ?auto_679400 ) ( ON ?auto_679402 ?auto_679401 ) ( ON ?auto_679403 ?auto_679402 ) ( ON ?auto_679404 ?auto_679403 ) ( not ( = ?auto_679398 ?auto_679399 ) ) ( not ( = ?auto_679398 ?auto_679400 ) ) ( not ( = ?auto_679398 ?auto_679401 ) ) ( not ( = ?auto_679398 ?auto_679402 ) ) ( not ( = ?auto_679398 ?auto_679403 ) ) ( not ( = ?auto_679398 ?auto_679404 ) ) ( not ( = ?auto_679398 ?auto_679405 ) ) ( not ( = ?auto_679398 ?auto_679406 ) ) ( not ( = ?auto_679398 ?auto_679407 ) ) ( not ( = ?auto_679398 ?auto_679408 ) ) ( not ( = ?auto_679398 ?auto_679409 ) ) ( not ( = ?auto_679398 ?auto_679410 ) ) ( not ( = ?auto_679398 ?auto_679411 ) ) ( not ( = ?auto_679398 ?auto_679412 ) ) ( not ( = ?auto_679398 ?auto_679413 ) ) ( not ( = ?auto_679398 ?auto_679414 ) ) ( not ( = ?auto_679398 ?auto_679415 ) ) ( not ( = ?auto_679399 ?auto_679400 ) ) ( not ( = ?auto_679399 ?auto_679401 ) ) ( not ( = ?auto_679399 ?auto_679402 ) ) ( not ( = ?auto_679399 ?auto_679403 ) ) ( not ( = ?auto_679399 ?auto_679404 ) ) ( not ( = ?auto_679399 ?auto_679405 ) ) ( not ( = ?auto_679399 ?auto_679406 ) ) ( not ( = ?auto_679399 ?auto_679407 ) ) ( not ( = ?auto_679399 ?auto_679408 ) ) ( not ( = ?auto_679399 ?auto_679409 ) ) ( not ( = ?auto_679399 ?auto_679410 ) ) ( not ( = ?auto_679399 ?auto_679411 ) ) ( not ( = ?auto_679399 ?auto_679412 ) ) ( not ( = ?auto_679399 ?auto_679413 ) ) ( not ( = ?auto_679399 ?auto_679414 ) ) ( not ( = ?auto_679399 ?auto_679415 ) ) ( not ( = ?auto_679400 ?auto_679401 ) ) ( not ( = ?auto_679400 ?auto_679402 ) ) ( not ( = ?auto_679400 ?auto_679403 ) ) ( not ( = ?auto_679400 ?auto_679404 ) ) ( not ( = ?auto_679400 ?auto_679405 ) ) ( not ( = ?auto_679400 ?auto_679406 ) ) ( not ( = ?auto_679400 ?auto_679407 ) ) ( not ( = ?auto_679400 ?auto_679408 ) ) ( not ( = ?auto_679400 ?auto_679409 ) ) ( not ( = ?auto_679400 ?auto_679410 ) ) ( not ( = ?auto_679400 ?auto_679411 ) ) ( not ( = ?auto_679400 ?auto_679412 ) ) ( not ( = ?auto_679400 ?auto_679413 ) ) ( not ( = ?auto_679400 ?auto_679414 ) ) ( not ( = ?auto_679400 ?auto_679415 ) ) ( not ( = ?auto_679401 ?auto_679402 ) ) ( not ( = ?auto_679401 ?auto_679403 ) ) ( not ( = ?auto_679401 ?auto_679404 ) ) ( not ( = ?auto_679401 ?auto_679405 ) ) ( not ( = ?auto_679401 ?auto_679406 ) ) ( not ( = ?auto_679401 ?auto_679407 ) ) ( not ( = ?auto_679401 ?auto_679408 ) ) ( not ( = ?auto_679401 ?auto_679409 ) ) ( not ( = ?auto_679401 ?auto_679410 ) ) ( not ( = ?auto_679401 ?auto_679411 ) ) ( not ( = ?auto_679401 ?auto_679412 ) ) ( not ( = ?auto_679401 ?auto_679413 ) ) ( not ( = ?auto_679401 ?auto_679414 ) ) ( not ( = ?auto_679401 ?auto_679415 ) ) ( not ( = ?auto_679402 ?auto_679403 ) ) ( not ( = ?auto_679402 ?auto_679404 ) ) ( not ( = ?auto_679402 ?auto_679405 ) ) ( not ( = ?auto_679402 ?auto_679406 ) ) ( not ( = ?auto_679402 ?auto_679407 ) ) ( not ( = ?auto_679402 ?auto_679408 ) ) ( not ( = ?auto_679402 ?auto_679409 ) ) ( not ( = ?auto_679402 ?auto_679410 ) ) ( not ( = ?auto_679402 ?auto_679411 ) ) ( not ( = ?auto_679402 ?auto_679412 ) ) ( not ( = ?auto_679402 ?auto_679413 ) ) ( not ( = ?auto_679402 ?auto_679414 ) ) ( not ( = ?auto_679402 ?auto_679415 ) ) ( not ( = ?auto_679403 ?auto_679404 ) ) ( not ( = ?auto_679403 ?auto_679405 ) ) ( not ( = ?auto_679403 ?auto_679406 ) ) ( not ( = ?auto_679403 ?auto_679407 ) ) ( not ( = ?auto_679403 ?auto_679408 ) ) ( not ( = ?auto_679403 ?auto_679409 ) ) ( not ( = ?auto_679403 ?auto_679410 ) ) ( not ( = ?auto_679403 ?auto_679411 ) ) ( not ( = ?auto_679403 ?auto_679412 ) ) ( not ( = ?auto_679403 ?auto_679413 ) ) ( not ( = ?auto_679403 ?auto_679414 ) ) ( not ( = ?auto_679403 ?auto_679415 ) ) ( not ( = ?auto_679404 ?auto_679405 ) ) ( not ( = ?auto_679404 ?auto_679406 ) ) ( not ( = ?auto_679404 ?auto_679407 ) ) ( not ( = ?auto_679404 ?auto_679408 ) ) ( not ( = ?auto_679404 ?auto_679409 ) ) ( not ( = ?auto_679404 ?auto_679410 ) ) ( not ( = ?auto_679404 ?auto_679411 ) ) ( not ( = ?auto_679404 ?auto_679412 ) ) ( not ( = ?auto_679404 ?auto_679413 ) ) ( not ( = ?auto_679404 ?auto_679414 ) ) ( not ( = ?auto_679404 ?auto_679415 ) ) ( not ( = ?auto_679405 ?auto_679406 ) ) ( not ( = ?auto_679405 ?auto_679407 ) ) ( not ( = ?auto_679405 ?auto_679408 ) ) ( not ( = ?auto_679405 ?auto_679409 ) ) ( not ( = ?auto_679405 ?auto_679410 ) ) ( not ( = ?auto_679405 ?auto_679411 ) ) ( not ( = ?auto_679405 ?auto_679412 ) ) ( not ( = ?auto_679405 ?auto_679413 ) ) ( not ( = ?auto_679405 ?auto_679414 ) ) ( not ( = ?auto_679405 ?auto_679415 ) ) ( not ( = ?auto_679406 ?auto_679407 ) ) ( not ( = ?auto_679406 ?auto_679408 ) ) ( not ( = ?auto_679406 ?auto_679409 ) ) ( not ( = ?auto_679406 ?auto_679410 ) ) ( not ( = ?auto_679406 ?auto_679411 ) ) ( not ( = ?auto_679406 ?auto_679412 ) ) ( not ( = ?auto_679406 ?auto_679413 ) ) ( not ( = ?auto_679406 ?auto_679414 ) ) ( not ( = ?auto_679406 ?auto_679415 ) ) ( not ( = ?auto_679407 ?auto_679408 ) ) ( not ( = ?auto_679407 ?auto_679409 ) ) ( not ( = ?auto_679407 ?auto_679410 ) ) ( not ( = ?auto_679407 ?auto_679411 ) ) ( not ( = ?auto_679407 ?auto_679412 ) ) ( not ( = ?auto_679407 ?auto_679413 ) ) ( not ( = ?auto_679407 ?auto_679414 ) ) ( not ( = ?auto_679407 ?auto_679415 ) ) ( not ( = ?auto_679408 ?auto_679409 ) ) ( not ( = ?auto_679408 ?auto_679410 ) ) ( not ( = ?auto_679408 ?auto_679411 ) ) ( not ( = ?auto_679408 ?auto_679412 ) ) ( not ( = ?auto_679408 ?auto_679413 ) ) ( not ( = ?auto_679408 ?auto_679414 ) ) ( not ( = ?auto_679408 ?auto_679415 ) ) ( not ( = ?auto_679409 ?auto_679410 ) ) ( not ( = ?auto_679409 ?auto_679411 ) ) ( not ( = ?auto_679409 ?auto_679412 ) ) ( not ( = ?auto_679409 ?auto_679413 ) ) ( not ( = ?auto_679409 ?auto_679414 ) ) ( not ( = ?auto_679409 ?auto_679415 ) ) ( not ( = ?auto_679410 ?auto_679411 ) ) ( not ( = ?auto_679410 ?auto_679412 ) ) ( not ( = ?auto_679410 ?auto_679413 ) ) ( not ( = ?auto_679410 ?auto_679414 ) ) ( not ( = ?auto_679410 ?auto_679415 ) ) ( not ( = ?auto_679411 ?auto_679412 ) ) ( not ( = ?auto_679411 ?auto_679413 ) ) ( not ( = ?auto_679411 ?auto_679414 ) ) ( not ( = ?auto_679411 ?auto_679415 ) ) ( not ( = ?auto_679412 ?auto_679413 ) ) ( not ( = ?auto_679412 ?auto_679414 ) ) ( not ( = ?auto_679412 ?auto_679415 ) ) ( not ( = ?auto_679413 ?auto_679414 ) ) ( not ( = ?auto_679413 ?auto_679415 ) ) ( not ( = ?auto_679414 ?auto_679415 ) ) ( ON ?auto_679413 ?auto_679414 ) ( ON ?auto_679412 ?auto_679413 ) ( ON ?auto_679411 ?auto_679412 ) ( ON ?auto_679410 ?auto_679411 ) ( ON ?auto_679409 ?auto_679410 ) ( ON ?auto_679408 ?auto_679409 ) ( ON ?auto_679407 ?auto_679408 ) ( ON ?auto_679406 ?auto_679407 ) ( CLEAR ?auto_679404 ) ( ON ?auto_679405 ?auto_679406 ) ( CLEAR ?auto_679405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_679398 ?auto_679399 ?auto_679400 ?auto_679401 ?auto_679402 ?auto_679403 ?auto_679404 ?auto_679405 )
      ( MAKE-17PILE ?auto_679398 ?auto_679399 ?auto_679400 ?auto_679401 ?auto_679402 ?auto_679403 ?auto_679404 ?auto_679405 ?auto_679406 ?auto_679407 ?auto_679408 ?auto_679409 ?auto_679410 ?auto_679411 ?auto_679412 ?auto_679413 ?auto_679414 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679433 - BLOCK
      ?auto_679434 - BLOCK
      ?auto_679435 - BLOCK
      ?auto_679436 - BLOCK
      ?auto_679437 - BLOCK
      ?auto_679438 - BLOCK
      ?auto_679439 - BLOCK
      ?auto_679440 - BLOCK
      ?auto_679441 - BLOCK
      ?auto_679442 - BLOCK
      ?auto_679443 - BLOCK
      ?auto_679444 - BLOCK
      ?auto_679445 - BLOCK
      ?auto_679446 - BLOCK
      ?auto_679447 - BLOCK
      ?auto_679448 - BLOCK
      ?auto_679449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679449 ) ( ON-TABLE ?auto_679433 ) ( ON ?auto_679434 ?auto_679433 ) ( ON ?auto_679435 ?auto_679434 ) ( ON ?auto_679436 ?auto_679435 ) ( ON ?auto_679437 ?auto_679436 ) ( ON ?auto_679438 ?auto_679437 ) ( ON ?auto_679439 ?auto_679438 ) ( not ( = ?auto_679433 ?auto_679434 ) ) ( not ( = ?auto_679433 ?auto_679435 ) ) ( not ( = ?auto_679433 ?auto_679436 ) ) ( not ( = ?auto_679433 ?auto_679437 ) ) ( not ( = ?auto_679433 ?auto_679438 ) ) ( not ( = ?auto_679433 ?auto_679439 ) ) ( not ( = ?auto_679433 ?auto_679440 ) ) ( not ( = ?auto_679433 ?auto_679441 ) ) ( not ( = ?auto_679433 ?auto_679442 ) ) ( not ( = ?auto_679433 ?auto_679443 ) ) ( not ( = ?auto_679433 ?auto_679444 ) ) ( not ( = ?auto_679433 ?auto_679445 ) ) ( not ( = ?auto_679433 ?auto_679446 ) ) ( not ( = ?auto_679433 ?auto_679447 ) ) ( not ( = ?auto_679433 ?auto_679448 ) ) ( not ( = ?auto_679433 ?auto_679449 ) ) ( not ( = ?auto_679434 ?auto_679435 ) ) ( not ( = ?auto_679434 ?auto_679436 ) ) ( not ( = ?auto_679434 ?auto_679437 ) ) ( not ( = ?auto_679434 ?auto_679438 ) ) ( not ( = ?auto_679434 ?auto_679439 ) ) ( not ( = ?auto_679434 ?auto_679440 ) ) ( not ( = ?auto_679434 ?auto_679441 ) ) ( not ( = ?auto_679434 ?auto_679442 ) ) ( not ( = ?auto_679434 ?auto_679443 ) ) ( not ( = ?auto_679434 ?auto_679444 ) ) ( not ( = ?auto_679434 ?auto_679445 ) ) ( not ( = ?auto_679434 ?auto_679446 ) ) ( not ( = ?auto_679434 ?auto_679447 ) ) ( not ( = ?auto_679434 ?auto_679448 ) ) ( not ( = ?auto_679434 ?auto_679449 ) ) ( not ( = ?auto_679435 ?auto_679436 ) ) ( not ( = ?auto_679435 ?auto_679437 ) ) ( not ( = ?auto_679435 ?auto_679438 ) ) ( not ( = ?auto_679435 ?auto_679439 ) ) ( not ( = ?auto_679435 ?auto_679440 ) ) ( not ( = ?auto_679435 ?auto_679441 ) ) ( not ( = ?auto_679435 ?auto_679442 ) ) ( not ( = ?auto_679435 ?auto_679443 ) ) ( not ( = ?auto_679435 ?auto_679444 ) ) ( not ( = ?auto_679435 ?auto_679445 ) ) ( not ( = ?auto_679435 ?auto_679446 ) ) ( not ( = ?auto_679435 ?auto_679447 ) ) ( not ( = ?auto_679435 ?auto_679448 ) ) ( not ( = ?auto_679435 ?auto_679449 ) ) ( not ( = ?auto_679436 ?auto_679437 ) ) ( not ( = ?auto_679436 ?auto_679438 ) ) ( not ( = ?auto_679436 ?auto_679439 ) ) ( not ( = ?auto_679436 ?auto_679440 ) ) ( not ( = ?auto_679436 ?auto_679441 ) ) ( not ( = ?auto_679436 ?auto_679442 ) ) ( not ( = ?auto_679436 ?auto_679443 ) ) ( not ( = ?auto_679436 ?auto_679444 ) ) ( not ( = ?auto_679436 ?auto_679445 ) ) ( not ( = ?auto_679436 ?auto_679446 ) ) ( not ( = ?auto_679436 ?auto_679447 ) ) ( not ( = ?auto_679436 ?auto_679448 ) ) ( not ( = ?auto_679436 ?auto_679449 ) ) ( not ( = ?auto_679437 ?auto_679438 ) ) ( not ( = ?auto_679437 ?auto_679439 ) ) ( not ( = ?auto_679437 ?auto_679440 ) ) ( not ( = ?auto_679437 ?auto_679441 ) ) ( not ( = ?auto_679437 ?auto_679442 ) ) ( not ( = ?auto_679437 ?auto_679443 ) ) ( not ( = ?auto_679437 ?auto_679444 ) ) ( not ( = ?auto_679437 ?auto_679445 ) ) ( not ( = ?auto_679437 ?auto_679446 ) ) ( not ( = ?auto_679437 ?auto_679447 ) ) ( not ( = ?auto_679437 ?auto_679448 ) ) ( not ( = ?auto_679437 ?auto_679449 ) ) ( not ( = ?auto_679438 ?auto_679439 ) ) ( not ( = ?auto_679438 ?auto_679440 ) ) ( not ( = ?auto_679438 ?auto_679441 ) ) ( not ( = ?auto_679438 ?auto_679442 ) ) ( not ( = ?auto_679438 ?auto_679443 ) ) ( not ( = ?auto_679438 ?auto_679444 ) ) ( not ( = ?auto_679438 ?auto_679445 ) ) ( not ( = ?auto_679438 ?auto_679446 ) ) ( not ( = ?auto_679438 ?auto_679447 ) ) ( not ( = ?auto_679438 ?auto_679448 ) ) ( not ( = ?auto_679438 ?auto_679449 ) ) ( not ( = ?auto_679439 ?auto_679440 ) ) ( not ( = ?auto_679439 ?auto_679441 ) ) ( not ( = ?auto_679439 ?auto_679442 ) ) ( not ( = ?auto_679439 ?auto_679443 ) ) ( not ( = ?auto_679439 ?auto_679444 ) ) ( not ( = ?auto_679439 ?auto_679445 ) ) ( not ( = ?auto_679439 ?auto_679446 ) ) ( not ( = ?auto_679439 ?auto_679447 ) ) ( not ( = ?auto_679439 ?auto_679448 ) ) ( not ( = ?auto_679439 ?auto_679449 ) ) ( not ( = ?auto_679440 ?auto_679441 ) ) ( not ( = ?auto_679440 ?auto_679442 ) ) ( not ( = ?auto_679440 ?auto_679443 ) ) ( not ( = ?auto_679440 ?auto_679444 ) ) ( not ( = ?auto_679440 ?auto_679445 ) ) ( not ( = ?auto_679440 ?auto_679446 ) ) ( not ( = ?auto_679440 ?auto_679447 ) ) ( not ( = ?auto_679440 ?auto_679448 ) ) ( not ( = ?auto_679440 ?auto_679449 ) ) ( not ( = ?auto_679441 ?auto_679442 ) ) ( not ( = ?auto_679441 ?auto_679443 ) ) ( not ( = ?auto_679441 ?auto_679444 ) ) ( not ( = ?auto_679441 ?auto_679445 ) ) ( not ( = ?auto_679441 ?auto_679446 ) ) ( not ( = ?auto_679441 ?auto_679447 ) ) ( not ( = ?auto_679441 ?auto_679448 ) ) ( not ( = ?auto_679441 ?auto_679449 ) ) ( not ( = ?auto_679442 ?auto_679443 ) ) ( not ( = ?auto_679442 ?auto_679444 ) ) ( not ( = ?auto_679442 ?auto_679445 ) ) ( not ( = ?auto_679442 ?auto_679446 ) ) ( not ( = ?auto_679442 ?auto_679447 ) ) ( not ( = ?auto_679442 ?auto_679448 ) ) ( not ( = ?auto_679442 ?auto_679449 ) ) ( not ( = ?auto_679443 ?auto_679444 ) ) ( not ( = ?auto_679443 ?auto_679445 ) ) ( not ( = ?auto_679443 ?auto_679446 ) ) ( not ( = ?auto_679443 ?auto_679447 ) ) ( not ( = ?auto_679443 ?auto_679448 ) ) ( not ( = ?auto_679443 ?auto_679449 ) ) ( not ( = ?auto_679444 ?auto_679445 ) ) ( not ( = ?auto_679444 ?auto_679446 ) ) ( not ( = ?auto_679444 ?auto_679447 ) ) ( not ( = ?auto_679444 ?auto_679448 ) ) ( not ( = ?auto_679444 ?auto_679449 ) ) ( not ( = ?auto_679445 ?auto_679446 ) ) ( not ( = ?auto_679445 ?auto_679447 ) ) ( not ( = ?auto_679445 ?auto_679448 ) ) ( not ( = ?auto_679445 ?auto_679449 ) ) ( not ( = ?auto_679446 ?auto_679447 ) ) ( not ( = ?auto_679446 ?auto_679448 ) ) ( not ( = ?auto_679446 ?auto_679449 ) ) ( not ( = ?auto_679447 ?auto_679448 ) ) ( not ( = ?auto_679447 ?auto_679449 ) ) ( not ( = ?auto_679448 ?auto_679449 ) ) ( ON ?auto_679448 ?auto_679449 ) ( ON ?auto_679447 ?auto_679448 ) ( ON ?auto_679446 ?auto_679447 ) ( ON ?auto_679445 ?auto_679446 ) ( ON ?auto_679444 ?auto_679445 ) ( ON ?auto_679443 ?auto_679444 ) ( ON ?auto_679442 ?auto_679443 ) ( ON ?auto_679441 ?auto_679442 ) ( CLEAR ?auto_679439 ) ( ON ?auto_679440 ?auto_679441 ) ( CLEAR ?auto_679440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_679433 ?auto_679434 ?auto_679435 ?auto_679436 ?auto_679437 ?auto_679438 ?auto_679439 ?auto_679440 )
      ( MAKE-17PILE ?auto_679433 ?auto_679434 ?auto_679435 ?auto_679436 ?auto_679437 ?auto_679438 ?auto_679439 ?auto_679440 ?auto_679441 ?auto_679442 ?auto_679443 ?auto_679444 ?auto_679445 ?auto_679446 ?auto_679447 ?auto_679448 ?auto_679449 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679467 - BLOCK
      ?auto_679468 - BLOCK
      ?auto_679469 - BLOCK
      ?auto_679470 - BLOCK
      ?auto_679471 - BLOCK
      ?auto_679472 - BLOCK
      ?auto_679473 - BLOCK
      ?auto_679474 - BLOCK
      ?auto_679475 - BLOCK
      ?auto_679476 - BLOCK
      ?auto_679477 - BLOCK
      ?auto_679478 - BLOCK
      ?auto_679479 - BLOCK
      ?auto_679480 - BLOCK
      ?auto_679481 - BLOCK
      ?auto_679482 - BLOCK
      ?auto_679483 - BLOCK
    )
    :vars
    (
      ?auto_679484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679483 ?auto_679484 ) ( ON-TABLE ?auto_679467 ) ( ON ?auto_679468 ?auto_679467 ) ( ON ?auto_679469 ?auto_679468 ) ( ON ?auto_679470 ?auto_679469 ) ( ON ?auto_679471 ?auto_679470 ) ( ON ?auto_679472 ?auto_679471 ) ( not ( = ?auto_679467 ?auto_679468 ) ) ( not ( = ?auto_679467 ?auto_679469 ) ) ( not ( = ?auto_679467 ?auto_679470 ) ) ( not ( = ?auto_679467 ?auto_679471 ) ) ( not ( = ?auto_679467 ?auto_679472 ) ) ( not ( = ?auto_679467 ?auto_679473 ) ) ( not ( = ?auto_679467 ?auto_679474 ) ) ( not ( = ?auto_679467 ?auto_679475 ) ) ( not ( = ?auto_679467 ?auto_679476 ) ) ( not ( = ?auto_679467 ?auto_679477 ) ) ( not ( = ?auto_679467 ?auto_679478 ) ) ( not ( = ?auto_679467 ?auto_679479 ) ) ( not ( = ?auto_679467 ?auto_679480 ) ) ( not ( = ?auto_679467 ?auto_679481 ) ) ( not ( = ?auto_679467 ?auto_679482 ) ) ( not ( = ?auto_679467 ?auto_679483 ) ) ( not ( = ?auto_679467 ?auto_679484 ) ) ( not ( = ?auto_679468 ?auto_679469 ) ) ( not ( = ?auto_679468 ?auto_679470 ) ) ( not ( = ?auto_679468 ?auto_679471 ) ) ( not ( = ?auto_679468 ?auto_679472 ) ) ( not ( = ?auto_679468 ?auto_679473 ) ) ( not ( = ?auto_679468 ?auto_679474 ) ) ( not ( = ?auto_679468 ?auto_679475 ) ) ( not ( = ?auto_679468 ?auto_679476 ) ) ( not ( = ?auto_679468 ?auto_679477 ) ) ( not ( = ?auto_679468 ?auto_679478 ) ) ( not ( = ?auto_679468 ?auto_679479 ) ) ( not ( = ?auto_679468 ?auto_679480 ) ) ( not ( = ?auto_679468 ?auto_679481 ) ) ( not ( = ?auto_679468 ?auto_679482 ) ) ( not ( = ?auto_679468 ?auto_679483 ) ) ( not ( = ?auto_679468 ?auto_679484 ) ) ( not ( = ?auto_679469 ?auto_679470 ) ) ( not ( = ?auto_679469 ?auto_679471 ) ) ( not ( = ?auto_679469 ?auto_679472 ) ) ( not ( = ?auto_679469 ?auto_679473 ) ) ( not ( = ?auto_679469 ?auto_679474 ) ) ( not ( = ?auto_679469 ?auto_679475 ) ) ( not ( = ?auto_679469 ?auto_679476 ) ) ( not ( = ?auto_679469 ?auto_679477 ) ) ( not ( = ?auto_679469 ?auto_679478 ) ) ( not ( = ?auto_679469 ?auto_679479 ) ) ( not ( = ?auto_679469 ?auto_679480 ) ) ( not ( = ?auto_679469 ?auto_679481 ) ) ( not ( = ?auto_679469 ?auto_679482 ) ) ( not ( = ?auto_679469 ?auto_679483 ) ) ( not ( = ?auto_679469 ?auto_679484 ) ) ( not ( = ?auto_679470 ?auto_679471 ) ) ( not ( = ?auto_679470 ?auto_679472 ) ) ( not ( = ?auto_679470 ?auto_679473 ) ) ( not ( = ?auto_679470 ?auto_679474 ) ) ( not ( = ?auto_679470 ?auto_679475 ) ) ( not ( = ?auto_679470 ?auto_679476 ) ) ( not ( = ?auto_679470 ?auto_679477 ) ) ( not ( = ?auto_679470 ?auto_679478 ) ) ( not ( = ?auto_679470 ?auto_679479 ) ) ( not ( = ?auto_679470 ?auto_679480 ) ) ( not ( = ?auto_679470 ?auto_679481 ) ) ( not ( = ?auto_679470 ?auto_679482 ) ) ( not ( = ?auto_679470 ?auto_679483 ) ) ( not ( = ?auto_679470 ?auto_679484 ) ) ( not ( = ?auto_679471 ?auto_679472 ) ) ( not ( = ?auto_679471 ?auto_679473 ) ) ( not ( = ?auto_679471 ?auto_679474 ) ) ( not ( = ?auto_679471 ?auto_679475 ) ) ( not ( = ?auto_679471 ?auto_679476 ) ) ( not ( = ?auto_679471 ?auto_679477 ) ) ( not ( = ?auto_679471 ?auto_679478 ) ) ( not ( = ?auto_679471 ?auto_679479 ) ) ( not ( = ?auto_679471 ?auto_679480 ) ) ( not ( = ?auto_679471 ?auto_679481 ) ) ( not ( = ?auto_679471 ?auto_679482 ) ) ( not ( = ?auto_679471 ?auto_679483 ) ) ( not ( = ?auto_679471 ?auto_679484 ) ) ( not ( = ?auto_679472 ?auto_679473 ) ) ( not ( = ?auto_679472 ?auto_679474 ) ) ( not ( = ?auto_679472 ?auto_679475 ) ) ( not ( = ?auto_679472 ?auto_679476 ) ) ( not ( = ?auto_679472 ?auto_679477 ) ) ( not ( = ?auto_679472 ?auto_679478 ) ) ( not ( = ?auto_679472 ?auto_679479 ) ) ( not ( = ?auto_679472 ?auto_679480 ) ) ( not ( = ?auto_679472 ?auto_679481 ) ) ( not ( = ?auto_679472 ?auto_679482 ) ) ( not ( = ?auto_679472 ?auto_679483 ) ) ( not ( = ?auto_679472 ?auto_679484 ) ) ( not ( = ?auto_679473 ?auto_679474 ) ) ( not ( = ?auto_679473 ?auto_679475 ) ) ( not ( = ?auto_679473 ?auto_679476 ) ) ( not ( = ?auto_679473 ?auto_679477 ) ) ( not ( = ?auto_679473 ?auto_679478 ) ) ( not ( = ?auto_679473 ?auto_679479 ) ) ( not ( = ?auto_679473 ?auto_679480 ) ) ( not ( = ?auto_679473 ?auto_679481 ) ) ( not ( = ?auto_679473 ?auto_679482 ) ) ( not ( = ?auto_679473 ?auto_679483 ) ) ( not ( = ?auto_679473 ?auto_679484 ) ) ( not ( = ?auto_679474 ?auto_679475 ) ) ( not ( = ?auto_679474 ?auto_679476 ) ) ( not ( = ?auto_679474 ?auto_679477 ) ) ( not ( = ?auto_679474 ?auto_679478 ) ) ( not ( = ?auto_679474 ?auto_679479 ) ) ( not ( = ?auto_679474 ?auto_679480 ) ) ( not ( = ?auto_679474 ?auto_679481 ) ) ( not ( = ?auto_679474 ?auto_679482 ) ) ( not ( = ?auto_679474 ?auto_679483 ) ) ( not ( = ?auto_679474 ?auto_679484 ) ) ( not ( = ?auto_679475 ?auto_679476 ) ) ( not ( = ?auto_679475 ?auto_679477 ) ) ( not ( = ?auto_679475 ?auto_679478 ) ) ( not ( = ?auto_679475 ?auto_679479 ) ) ( not ( = ?auto_679475 ?auto_679480 ) ) ( not ( = ?auto_679475 ?auto_679481 ) ) ( not ( = ?auto_679475 ?auto_679482 ) ) ( not ( = ?auto_679475 ?auto_679483 ) ) ( not ( = ?auto_679475 ?auto_679484 ) ) ( not ( = ?auto_679476 ?auto_679477 ) ) ( not ( = ?auto_679476 ?auto_679478 ) ) ( not ( = ?auto_679476 ?auto_679479 ) ) ( not ( = ?auto_679476 ?auto_679480 ) ) ( not ( = ?auto_679476 ?auto_679481 ) ) ( not ( = ?auto_679476 ?auto_679482 ) ) ( not ( = ?auto_679476 ?auto_679483 ) ) ( not ( = ?auto_679476 ?auto_679484 ) ) ( not ( = ?auto_679477 ?auto_679478 ) ) ( not ( = ?auto_679477 ?auto_679479 ) ) ( not ( = ?auto_679477 ?auto_679480 ) ) ( not ( = ?auto_679477 ?auto_679481 ) ) ( not ( = ?auto_679477 ?auto_679482 ) ) ( not ( = ?auto_679477 ?auto_679483 ) ) ( not ( = ?auto_679477 ?auto_679484 ) ) ( not ( = ?auto_679478 ?auto_679479 ) ) ( not ( = ?auto_679478 ?auto_679480 ) ) ( not ( = ?auto_679478 ?auto_679481 ) ) ( not ( = ?auto_679478 ?auto_679482 ) ) ( not ( = ?auto_679478 ?auto_679483 ) ) ( not ( = ?auto_679478 ?auto_679484 ) ) ( not ( = ?auto_679479 ?auto_679480 ) ) ( not ( = ?auto_679479 ?auto_679481 ) ) ( not ( = ?auto_679479 ?auto_679482 ) ) ( not ( = ?auto_679479 ?auto_679483 ) ) ( not ( = ?auto_679479 ?auto_679484 ) ) ( not ( = ?auto_679480 ?auto_679481 ) ) ( not ( = ?auto_679480 ?auto_679482 ) ) ( not ( = ?auto_679480 ?auto_679483 ) ) ( not ( = ?auto_679480 ?auto_679484 ) ) ( not ( = ?auto_679481 ?auto_679482 ) ) ( not ( = ?auto_679481 ?auto_679483 ) ) ( not ( = ?auto_679481 ?auto_679484 ) ) ( not ( = ?auto_679482 ?auto_679483 ) ) ( not ( = ?auto_679482 ?auto_679484 ) ) ( not ( = ?auto_679483 ?auto_679484 ) ) ( ON ?auto_679482 ?auto_679483 ) ( ON ?auto_679481 ?auto_679482 ) ( ON ?auto_679480 ?auto_679481 ) ( ON ?auto_679479 ?auto_679480 ) ( ON ?auto_679478 ?auto_679479 ) ( ON ?auto_679477 ?auto_679478 ) ( ON ?auto_679476 ?auto_679477 ) ( ON ?auto_679475 ?auto_679476 ) ( ON ?auto_679474 ?auto_679475 ) ( CLEAR ?auto_679472 ) ( ON ?auto_679473 ?auto_679474 ) ( CLEAR ?auto_679473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_679467 ?auto_679468 ?auto_679469 ?auto_679470 ?auto_679471 ?auto_679472 ?auto_679473 )
      ( MAKE-17PILE ?auto_679467 ?auto_679468 ?auto_679469 ?auto_679470 ?auto_679471 ?auto_679472 ?auto_679473 ?auto_679474 ?auto_679475 ?auto_679476 ?auto_679477 ?auto_679478 ?auto_679479 ?auto_679480 ?auto_679481 ?auto_679482 ?auto_679483 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679502 - BLOCK
      ?auto_679503 - BLOCK
      ?auto_679504 - BLOCK
      ?auto_679505 - BLOCK
      ?auto_679506 - BLOCK
      ?auto_679507 - BLOCK
      ?auto_679508 - BLOCK
      ?auto_679509 - BLOCK
      ?auto_679510 - BLOCK
      ?auto_679511 - BLOCK
      ?auto_679512 - BLOCK
      ?auto_679513 - BLOCK
      ?auto_679514 - BLOCK
      ?auto_679515 - BLOCK
      ?auto_679516 - BLOCK
      ?auto_679517 - BLOCK
      ?auto_679518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679518 ) ( ON-TABLE ?auto_679502 ) ( ON ?auto_679503 ?auto_679502 ) ( ON ?auto_679504 ?auto_679503 ) ( ON ?auto_679505 ?auto_679504 ) ( ON ?auto_679506 ?auto_679505 ) ( ON ?auto_679507 ?auto_679506 ) ( not ( = ?auto_679502 ?auto_679503 ) ) ( not ( = ?auto_679502 ?auto_679504 ) ) ( not ( = ?auto_679502 ?auto_679505 ) ) ( not ( = ?auto_679502 ?auto_679506 ) ) ( not ( = ?auto_679502 ?auto_679507 ) ) ( not ( = ?auto_679502 ?auto_679508 ) ) ( not ( = ?auto_679502 ?auto_679509 ) ) ( not ( = ?auto_679502 ?auto_679510 ) ) ( not ( = ?auto_679502 ?auto_679511 ) ) ( not ( = ?auto_679502 ?auto_679512 ) ) ( not ( = ?auto_679502 ?auto_679513 ) ) ( not ( = ?auto_679502 ?auto_679514 ) ) ( not ( = ?auto_679502 ?auto_679515 ) ) ( not ( = ?auto_679502 ?auto_679516 ) ) ( not ( = ?auto_679502 ?auto_679517 ) ) ( not ( = ?auto_679502 ?auto_679518 ) ) ( not ( = ?auto_679503 ?auto_679504 ) ) ( not ( = ?auto_679503 ?auto_679505 ) ) ( not ( = ?auto_679503 ?auto_679506 ) ) ( not ( = ?auto_679503 ?auto_679507 ) ) ( not ( = ?auto_679503 ?auto_679508 ) ) ( not ( = ?auto_679503 ?auto_679509 ) ) ( not ( = ?auto_679503 ?auto_679510 ) ) ( not ( = ?auto_679503 ?auto_679511 ) ) ( not ( = ?auto_679503 ?auto_679512 ) ) ( not ( = ?auto_679503 ?auto_679513 ) ) ( not ( = ?auto_679503 ?auto_679514 ) ) ( not ( = ?auto_679503 ?auto_679515 ) ) ( not ( = ?auto_679503 ?auto_679516 ) ) ( not ( = ?auto_679503 ?auto_679517 ) ) ( not ( = ?auto_679503 ?auto_679518 ) ) ( not ( = ?auto_679504 ?auto_679505 ) ) ( not ( = ?auto_679504 ?auto_679506 ) ) ( not ( = ?auto_679504 ?auto_679507 ) ) ( not ( = ?auto_679504 ?auto_679508 ) ) ( not ( = ?auto_679504 ?auto_679509 ) ) ( not ( = ?auto_679504 ?auto_679510 ) ) ( not ( = ?auto_679504 ?auto_679511 ) ) ( not ( = ?auto_679504 ?auto_679512 ) ) ( not ( = ?auto_679504 ?auto_679513 ) ) ( not ( = ?auto_679504 ?auto_679514 ) ) ( not ( = ?auto_679504 ?auto_679515 ) ) ( not ( = ?auto_679504 ?auto_679516 ) ) ( not ( = ?auto_679504 ?auto_679517 ) ) ( not ( = ?auto_679504 ?auto_679518 ) ) ( not ( = ?auto_679505 ?auto_679506 ) ) ( not ( = ?auto_679505 ?auto_679507 ) ) ( not ( = ?auto_679505 ?auto_679508 ) ) ( not ( = ?auto_679505 ?auto_679509 ) ) ( not ( = ?auto_679505 ?auto_679510 ) ) ( not ( = ?auto_679505 ?auto_679511 ) ) ( not ( = ?auto_679505 ?auto_679512 ) ) ( not ( = ?auto_679505 ?auto_679513 ) ) ( not ( = ?auto_679505 ?auto_679514 ) ) ( not ( = ?auto_679505 ?auto_679515 ) ) ( not ( = ?auto_679505 ?auto_679516 ) ) ( not ( = ?auto_679505 ?auto_679517 ) ) ( not ( = ?auto_679505 ?auto_679518 ) ) ( not ( = ?auto_679506 ?auto_679507 ) ) ( not ( = ?auto_679506 ?auto_679508 ) ) ( not ( = ?auto_679506 ?auto_679509 ) ) ( not ( = ?auto_679506 ?auto_679510 ) ) ( not ( = ?auto_679506 ?auto_679511 ) ) ( not ( = ?auto_679506 ?auto_679512 ) ) ( not ( = ?auto_679506 ?auto_679513 ) ) ( not ( = ?auto_679506 ?auto_679514 ) ) ( not ( = ?auto_679506 ?auto_679515 ) ) ( not ( = ?auto_679506 ?auto_679516 ) ) ( not ( = ?auto_679506 ?auto_679517 ) ) ( not ( = ?auto_679506 ?auto_679518 ) ) ( not ( = ?auto_679507 ?auto_679508 ) ) ( not ( = ?auto_679507 ?auto_679509 ) ) ( not ( = ?auto_679507 ?auto_679510 ) ) ( not ( = ?auto_679507 ?auto_679511 ) ) ( not ( = ?auto_679507 ?auto_679512 ) ) ( not ( = ?auto_679507 ?auto_679513 ) ) ( not ( = ?auto_679507 ?auto_679514 ) ) ( not ( = ?auto_679507 ?auto_679515 ) ) ( not ( = ?auto_679507 ?auto_679516 ) ) ( not ( = ?auto_679507 ?auto_679517 ) ) ( not ( = ?auto_679507 ?auto_679518 ) ) ( not ( = ?auto_679508 ?auto_679509 ) ) ( not ( = ?auto_679508 ?auto_679510 ) ) ( not ( = ?auto_679508 ?auto_679511 ) ) ( not ( = ?auto_679508 ?auto_679512 ) ) ( not ( = ?auto_679508 ?auto_679513 ) ) ( not ( = ?auto_679508 ?auto_679514 ) ) ( not ( = ?auto_679508 ?auto_679515 ) ) ( not ( = ?auto_679508 ?auto_679516 ) ) ( not ( = ?auto_679508 ?auto_679517 ) ) ( not ( = ?auto_679508 ?auto_679518 ) ) ( not ( = ?auto_679509 ?auto_679510 ) ) ( not ( = ?auto_679509 ?auto_679511 ) ) ( not ( = ?auto_679509 ?auto_679512 ) ) ( not ( = ?auto_679509 ?auto_679513 ) ) ( not ( = ?auto_679509 ?auto_679514 ) ) ( not ( = ?auto_679509 ?auto_679515 ) ) ( not ( = ?auto_679509 ?auto_679516 ) ) ( not ( = ?auto_679509 ?auto_679517 ) ) ( not ( = ?auto_679509 ?auto_679518 ) ) ( not ( = ?auto_679510 ?auto_679511 ) ) ( not ( = ?auto_679510 ?auto_679512 ) ) ( not ( = ?auto_679510 ?auto_679513 ) ) ( not ( = ?auto_679510 ?auto_679514 ) ) ( not ( = ?auto_679510 ?auto_679515 ) ) ( not ( = ?auto_679510 ?auto_679516 ) ) ( not ( = ?auto_679510 ?auto_679517 ) ) ( not ( = ?auto_679510 ?auto_679518 ) ) ( not ( = ?auto_679511 ?auto_679512 ) ) ( not ( = ?auto_679511 ?auto_679513 ) ) ( not ( = ?auto_679511 ?auto_679514 ) ) ( not ( = ?auto_679511 ?auto_679515 ) ) ( not ( = ?auto_679511 ?auto_679516 ) ) ( not ( = ?auto_679511 ?auto_679517 ) ) ( not ( = ?auto_679511 ?auto_679518 ) ) ( not ( = ?auto_679512 ?auto_679513 ) ) ( not ( = ?auto_679512 ?auto_679514 ) ) ( not ( = ?auto_679512 ?auto_679515 ) ) ( not ( = ?auto_679512 ?auto_679516 ) ) ( not ( = ?auto_679512 ?auto_679517 ) ) ( not ( = ?auto_679512 ?auto_679518 ) ) ( not ( = ?auto_679513 ?auto_679514 ) ) ( not ( = ?auto_679513 ?auto_679515 ) ) ( not ( = ?auto_679513 ?auto_679516 ) ) ( not ( = ?auto_679513 ?auto_679517 ) ) ( not ( = ?auto_679513 ?auto_679518 ) ) ( not ( = ?auto_679514 ?auto_679515 ) ) ( not ( = ?auto_679514 ?auto_679516 ) ) ( not ( = ?auto_679514 ?auto_679517 ) ) ( not ( = ?auto_679514 ?auto_679518 ) ) ( not ( = ?auto_679515 ?auto_679516 ) ) ( not ( = ?auto_679515 ?auto_679517 ) ) ( not ( = ?auto_679515 ?auto_679518 ) ) ( not ( = ?auto_679516 ?auto_679517 ) ) ( not ( = ?auto_679516 ?auto_679518 ) ) ( not ( = ?auto_679517 ?auto_679518 ) ) ( ON ?auto_679517 ?auto_679518 ) ( ON ?auto_679516 ?auto_679517 ) ( ON ?auto_679515 ?auto_679516 ) ( ON ?auto_679514 ?auto_679515 ) ( ON ?auto_679513 ?auto_679514 ) ( ON ?auto_679512 ?auto_679513 ) ( ON ?auto_679511 ?auto_679512 ) ( ON ?auto_679510 ?auto_679511 ) ( ON ?auto_679509 ?auto_679510 ) ( CLEAR ?auto_679507 ) ( ON ?auto_679508 ?auto_679509 ) ( CLEAR ?auto_679508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_679502 ?auto_679503 ?auto_679504 ?auto_679505 ?auto_679506 ?auto_679507 ?auto_679508 )
      ( MAKE-17PILE ?auto_679502 ?auto_679503 ?auto_679504 ?auto_679505 ?auto_679506 ?auto_679507 ?auto_679508 ?auto_679509 ?auto_679510 ?auto_679511 ?auto_679512 ?auto_679513 ?auto_679514 ?auto_679515 ?auto_679516 ?auto_679517 ?auto_679518 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679536 - BLOCK
      ?auto_679537 - BLOCK
      ?auto_679538 - BLOCK
      ?auto_679539 - BLOCK
      ?auto_679540 - BLOCK
      ?auto_679541 - BLOCK
      ?auto_679542 - BLOCK
      ?auto_679543 - BLOCK
      ?auto_679544 - BLOCK
      ?auto_679545 - BLOCK
      ?auto_679546 - BLOCK
      ?auto_679547 - BLOCK
      ?auto_679548 - BLOCK
      ?auto_679549 - BLOCK
      ?auto_679550 - BLOCK
      ?auto_679551 - BLOCK
      ?auto_679552 - BLOCK
    )
    :vars
    (
      ?auto_679553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679552 ?auto_679553 ) ( ON-TABLE ?auto_679536 ) ( ON ?auto_679537 ?auto_679536 ) ( ON ?auto_679538 ?auto_679537 ) ( ON ?auto_679539 ?auto_679538 ) ( ON ?auto_679540 ?auto_679539 ) ( not ( = ?auto_679536 ?auto_679537 ) ) ( not ( = ?auto_679536 ?auto_679538 ) ) ( not ( = ?auto_679536 ?auto_679539 ) ) ( not ( = ?auto_679536 ?auto_679540 ) ) ( not ( = ?auto_679536 ?auto_679541 ) ) ( not ( = ?auto_679536 ?auto_679542 ) ) ( not ( = ?auto_679536 ?auto_679543 ) ) ( not ( = ?auto_679536 ?auto_679544 ) ) ( not ( = ?auto_679536 ?auto_679545 ) ) ( not ( = ?auto_679536 ?auto_679546 ) ) ( not ( = ?auto_679536 ?auto_679547 ) ) ( not ( = ?auto_679536 ?auto_679548 ) ) ( not ( = ?auto_679536 ?auto_679549 ) ) ( not ( = ?auto_679536 ?auto_679550 ) ) ( not ( = ?auto_679536 ?auto_679551 ) ) ( not ( = ?auto_679536 ?auto_679552 ) ) ( not ( = ?auto_679536 ?auto_679553 ) ) ( not ( = ?auto_679537 ?auto_679538 ) ) ( not ( = ?auto_679537 ?auto_679539 ) ) ( not ( = ?auto_679537 ?auto_679540 ) ) ( not ( = ?auto_679537 ?auto_679541 ) ) ( not ( = ?auto_679537 ?auto_679542 ) ) ( not ( = ?auto_679537 ?auto_679543 ) ) ( not ( = ?auto_679537 ?auto_679544 ) ) ( not ( = ?auto_679537 ?auto_679545 ) ) ( not ( = ?auto_679537 ?auto_679546 ) ) ( not ( = ?auto_679537 ?auto_679547 ) ) ( not ( = ?auto_679537 ?auto_679548 ) ) ( not ( = ?auto_679537 ?auto_679549 ) ) ( not ( = ?auto_679537 ?auto_679550 ) ) ( not ( = ?auto_679537 ?auto_679551 ) ) ( not ( = ?auto_679537 ?auto_679552 ) ) ( not ( = ?auto_679537 ?auto_679553 ) ) ( not ( = ?auto_679538 ?auto_679539 ) ) ( not ( = ?auto_679538 ?auto_679540 ) ) ( not ( = ?auto_679538 ?auto_679541 ) ) ( not ( = ?auto_679538 ?auto_679542 ) ) ( not ( = ?auto_679538 ?auto_679543 ) ) ( not ( = ?auto_679538 ?auto_679544 ) ) ( not ( = ?auto_679538 ?auto_679545 ) ) ( not ( = ?auto_679538 ?auto_679546 ) ) ( not ( = ?auto_679538 ?auto_679547 ) ) ( not ( = ?auto_679538 ?auto_679548 ) ) ( not ( = ?auto_679538 ?auto_679549 ) ) ( not ( = ?auto_679538 ?auto_679550 ) ) ( not ( = ?auto_679538 ?auto_679551 ) ) ( not ( = ?auto_679538 ?auto_679552 ) ) ( not ( = ?auto_679538 ?auto_679553 ) ) ( not ( = ?auto_679539 ?auto_679540 ) ) ( not ( = ?auto_679539 ?auto_679541 ) ) ( not ( = ?auto_679539 ?auto_679542 ) ) ( not ( = ?auto_679539 ?auto_679543 ) ) ( not ( = ?auto_679539 ?auto_679544 ) ) ( not ( = ?auto_679539 ?auto_679545 ) ) ( not ( = ?auto_679539 ?auto_679546 ) ) ( not ( = ?auto_679539 ?auto_679547 ) ) ( not ( = ?auto_679539 ?auto_679548 ) ) ( not ( = ?auto_679539 ?auto_679549 ) ) ( not ( = ?auto_679539 ?auto_679550 ) ) ( not ( = ?auto_679539 ?auto_679551 ) ) ( not ( = ?auto_679539 ?auto_679552 ) ) ( not ( = ?auto_679539 ?auto_679553 ) ) ( not ( = ?auto_679540 ?auto_679541 ) ) ( not ( = ?auto_679540 ?auto_679542 ) ) ( not ( = ?auto_679540 ?auto_679543 ) ) ( not ( = ?auto_679540 ?auto_679544 ) ) ( not ( = ?auto_679540 ?auto_679545 ) ) ( not ( = ?auto_679540 ?auto_679546 ) ) ( not ( = ?auto_679540 ?auto_679547 ) ) ( not ( = ?auto_679540 ?auto_679548 ) ) ( not ( = ?auto_679540 ?auto_679549 ) ) ( not ( = ?auto_679540 ?auto_679550 ) ) ( not ( = ?auto_679540 ?auto_679551 ) ) ( not ( = ?auto_679540 ?auto_679552 ) ) ( not ( = ?auto_679540 ?auto_679553 ) ) ( not ( = ?auto_679541 ?auto_679542 ) ) ( not ( = ?auto_679541 ?auto_679543 ) ) ( not ( = ?auto_679541 ?auto_679544 ) ) ( not ( = ?auto_679541 ?auto_679545 ) ) ( not ( = ?auto_679541 ?auto_679546 ) ) ( not ( = ?auto_679541 ?auto_679547 ) ) ( not ( = ?auto_679541 ?auto_679548 ) ) ( not ( = ?auto_679541 ?auto_679549 ) ) ( not ( = ?auto_679541 ?auto_679550 ) ) ( not ( = ?auto_679541 ?auto_679551 ) ) ( not ( = ?auto_679541 ?auto_679552 ) ) ( not ( = ?auto_679541 ?auto_679553 ) ) ( not ( = ?auto_679542 ?auto_679543 ) ) ( not ( = ?auto_679542 ?auto_679544 ) ) ( not ( = ?auto_679542 ?auto_679545 ) ) ( not ( = ?auto_679542 ?auto_679546 ) ) ( not ( = ?auto_679542 ?auto_679547 ) ) ( not ( = ?auto_679542 ?auto_679548 ) ) ( not ( = ?auto_679542 ?auto_679549 ) ) ( not ( = ?auto_679542 ?auto_679550 ) ) ( not ( = ?auto_679542 ?auto_679551 ) ) ( not ( = ?auto_679542 ?auto_679552 ) ) ( not ( = ?auto_679542 ?auto_679553 ) ) ( not ( = ?auto_679543 ?auto_679544 ) ) ( not ( = ?auto_679543 ?auto_679545 ) ) ( not ( = ?auto_679543 ?auto_679546 ) ) ( not ( = ?auto_679543 ?auto_679547 ) ) ( not ( = ?auto_679543 ?auto_679548 ) ) ( not ( = ?auto_679543 ?auto_679549 ) ) ( not ( = ?auto_679543 ?auto_679550 ) ) ( not ( = ?auto_679543 ?auto_679551 ) ) ( not ( = ?auto_679543 ?auto_679552 ) ) ( not ( = ?auto_679543 ?auto_679553 ) ) ( not ( = ?auto_679544 ?auto_679545 ) ) ( not ( = ?auto_679544 ?auto_679546 ) ) ( not ( = ?auto_679544 ?auto_679547 ) ) ( not ( = ?auto_679544 ?auto_679548 ) ) ( not ( = ?auto_679544 ?auto_679549 ) ) ( not ( = ?auto_679544 ?auto_679550 ) ) ( not ( = ?auto_679544 ?auto_679551 ) ) ( not ( = ?auto_679544 ?auto_679552 ) ) ( not ( = ?auto_679544 ?auto_679553 ) ) ( not ( = ?auto_679545 ?auto_679546 ) ) ( not ( = ?auto_679545 ?auto_679547 ) ) ( not ( = ?auto_679545 ?auto_679548 ) ) ( not ( = ?auto_679545 ?auto_679549 ) ) ( not ( = ?auto_679545 ?auto_679550 ) ) ( not ( = ?auto_679545 ?auto_679551 ) ) ( not ( = ?auto_679545 ?auto_679552 ) ) ( not ( = ?auto_679545 ?auto_679553 ) ) ( not ( = ?auto_679546 ?auto_679547 ) ) ( not ( = ?auto_679546 ?auto_679548 ) ) ( not ( = ?auto_679546 ?auto_679549 ) ) ( not ( = ?auto_679546 ?auto_679550 ) ) ( not ( = ?auto_679546 ?auto_679551 ) ) ( not ( = ?auto_679546 ?auto_679552 ) ) ( not ( = ?auto_679546 ?auto_679553 ) ) ( not ( = ?auto_679547 ?auto_679548 ) ) ( not ( = ?auto_679547 ?auto_679549 ) ) ( not ( = ?auto_679547 ?auto_679550 ) ) ( not ( = ?auto_679547 ?auto_679551 ) ) ( not ( = ?auto_679547 ?auto_679552 ) ) ( not ( = ?auto_679547 ?auto_679553 ) ) ( not ( = ?auto_679548 ?auto_679549 ) ) ( not ( = ?auto_679548 ?auto_679550 ) ) ( not ( = ?auto_679548 ?auto_679551 ) ) ( not ( = ?auto_679548 ?auto_679552 ) ) ( not ( = ?auto_679548 ?auto_679553 ) ) ( not ( = ?auto_679549 ?auto_679550 ) ) ( not ( = ?auto_679549 ?auto_679551 ) ) ( not ( = ?auto_679549 ?auto_679552 ) ) ( not ( = ?auto_679549 ?auto_679553 ) ) ( not ( = ?auto_679550 ?auto_679551 ) ) ( not ( = ?auto_679550 ?auto_679552 ) ) ( not ( = ?auto_679550 ?auto_679553 ) ) ( not ( = ?auto_679551 ?auto_679552 ) ) ( not ( = ?auto_679551 ?auto_679553 ) ) ( not ( = ?auto_679552 ?auto_679553 ) ) ( ON ?auto_679551 ?auto_679552 ) ( ON ?auto_679550 ?auto_679551 ) ( ON ?auto_679549 ?auto_679550 ) ( ON ?auto_679548 ?auto_679549 ) ( ON ?auto_679547 ?auto_679548 ) ( ON ?auto_679546 ?auto_679547 ) ( ON ?auto_679545 ?auto_679546 ) ( ON ?auto_679544 ?auto_679545 ) ( ON ?auto_679543 ?auto_679544 ) ( ON ?auto_679542 ?auto_679543 ) ( CLEAR ?auto_679540 ) ( ON ?auto_679541 ?auto_679542 ) ( CLEAR ?auto_679541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_679536 ?auto_679537 ?auto_679538 ?auto_679539 ?auto_679540 ?auto_679541 )
      ( MAKE-17PILE ?auto_679536 ?auto_679537 ?auto_679538 ?auto_679539 ?auto_679540 ?auto_679541 ?auto_679542 ?auto_679543 ?auto_679544 ?auto_679545 ?auto_679546 ?auto_679547 ?auto_679548 ?auto_679549 ?auto_679550 ?auto_679551 ?auto_679552 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679571 - BLOCK
      ?auto_679572 - BLOCK
      ?auto_679573 - BLOCK
      ?auto_679574 - BLOCK
      ?auto_679575 - BLOCK
      ?auto_679576 - BLOCK
      ?auto_679577 - BLOCK
      ?auto_679578 - BLOCK
      ?auto_679579 - BLOCK
      ?auto_679580 - BLOCK
      ?auto_679581 - BLOCK
      ?auto_679582 - BLOCK
      ?auto_679583 - BLOCK
      ?auto_679584 - BLOCK
      ?auto_679585 - BLOCK
      ?auto_679586 - BLOCK
      ?auto_679587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679587 ) ( ON-TABLE ?auto_679571 ) ( ON ?auto_679572 ?auto_679571 ) ( ON ?auto_679573 ?auto_679572 ) ( ON ?auto_679574 ?auto_679573 ) ( ON ?auto_679575 ?auto_679574 ) ( not ( = ?auto_679571 ?auto_679572 ) ) ( not ( = ?auto_679571 ?auto_679573 ) ) ( not ( = ?auto_679571 ?auto_679574 ) ) ( not ( = ?auto_679571 ?auto_679575 ) ) ( not ( = ?auto_679571 ?auto_679576 ) ) ( not ( = ?auto_679571 ?auto_679577 ) ) ( not ( = ?auto_679571 ?auto_679578 ) ) ( not ( = ?auto_679571 ?auto_679579 ) ) ( not ( = ?auto_679571 ?auto_679580 ) ) ( not ( = ?auto_679571 ?auto_679581 ) ) ( not ( = ?auto_679571 ?auto_679582 ) ) ( not ( = ?auto_679571 ?auto_679583 ) ) ( not ( = ?auto_679571 ?auto_679584 ) ) ( not ( = ?auto_679571 ?auto_679585 ) ) ( not ( = ?auto_679571 ?auto_679586 ) ) ( not ( = ?auto_679571 ?auto_679587 ) ) ( not ( = ?auto_679572 ?auto_679573 ) ) ( not ( = ?auto_679572 ?auto_679574 ) ) ( not ( = ?auto_679572 ?auto_679575 ) ) ( not ( = ?auto_679572 ?auto_679576 ) ) ( not ( = ?auto_679572 ?auto_679577 ) ) ( not ( = ?auto_679572 ?auto_679578 ) ) ( not ( = ?auto_679572 ?auto_679579 ) ) ( not ( = ?auto_679572 ?auto_679580 ) ) ( not ( = ?auto_679572 ?auto_679581 ) ) ( not ( = ?auto_679572 ?auto_679582 ) ) ( not ( = ?auto_679572 ?auto_679583 ) ) ( not ( = ?auto_679572 ?auto_679584 ) ) ( not ( = ?auto_679572 ?auto_679585 ) ) ( not ( = ?auto_679572 ?auto_679586 ) ) ( not ( = ?auto_679572 ?auto_679587 ) ) ( not ( = ?auto_679573 ?auto_679574 ) ) ( not ( = ?auto_679573 ?auto_679575 ) ) ( not ( = ?auto_679573 ?auto_679576 ) ) ( not ( = ?auto_679573 ?auto_679577 ) ) ( not ( = ?auto_679573 ?auto_679578 ) ) ( not ( = ?auto_679573 ?auto_679579 ) ) ( not ( = ?auto_679573 ?auto_679580 ) ) ( not ( = ?auto_679573 ?auto_679581 ) ) ( not ( = ?auto_679573 ?auto_679582 ) ) ( not ( = ?auto_679573 ?auto_679583 ) ) ( not ( = ?auto_679573 ?auto_679584 ) ) ( not ( = ?auto_679573 ?auto_679585 ) ) ( not ( = ?auto_679573 ?auto_679586 ) ) ( not ( = ?auto_679573 ?auto_679587 ) ) ( not ( = ?auto_679574 ?auto_679575 ) ) ( not ( = ?auto_679574 ?auto_679576 ) ) ( not ( = ?auto_679574 ?auto_679577 ) ) ( not ( = ?auto_679574 ?auto_679578 ) ) ( not ( = ?auto_679574 ?auto_679579 ) ) ( not ( = ?auto_679574 ?auto_679580 ) ) ( not ( = ?auto_679574 ?auto_679581 ) ) ( not ( = ?auto_679574 ?auto_679582 ) ) ( not ( = ?auto_679574 ?auto_679583 ) ) ( not ( = ?auto_679574 ?auto_679584 ) ) ( not ( = ?auto_679574 ?auto_679585 ) ) ( not ( = ?auto_679574 ?auto_679586 ) ) ( not ( = ?auto_679574 ?auto_679587 ) ) ( not ( = ?auto_679575 ?auto_679576 ) ) ( not ( = ?auto_679575 ?auto_679577 ) ) ( not ( = ?auto_679575 ?auto_679578 ) ) ( not ( = ?auto_679575 ?auto_679579 ) ) ( not ( = ?auto_679575 ?auto_679580 ) ) ( not ( = ?auto_679575 ?auto_679581 ) ) ( not ( = ?auto_679575 ?auto_679582 ) ) ( not ( = ?auto_679575 ?auto_679583 ) ) ( not ( = ?auto_679575 ?auto_679584 ) ) ( not ( = ?auto_679575 ?auto_679585 ) ) ( not ( = ?auto_679575 ?auto_679586 ) ) ( not ( = ?auto_679575 ?auto_679587 ) ) ( not ( = ?auto_679576 ?auto_679577 ) ) ( not ( = ?auto_679576 ?auto_679578 ) ) ( not ( = ?auto_679576 ?auto_679579 ) ) ( not ( = ?auto_679576 ?auto_679580 ) ) ( not ( = ?auto_679576 ?auto_679581 ) ) ( not ( = ?auto_679576 ?auto_679582 ) ) ( not ( = ?auto_679576 ?auto_679583 ) ) ( not ( = ?auto_679576 ?auto_679584 ) ) ( not ( = ?auto_679576 ?auto_679585 ) ) ( not ( = ?auto_679576 ?auto_679586 ) ) ( not ( = ?auto_679576 ?auto_679587 ) ) ( not ( = ?auto_679577 ?auto_679578 ) ) ( not ( = ?auto_679577 ?auto_679579 ) ) ( not ( = ?auto_679577 ?auto_679580 ) ) ( not ( = ?auto_679577 ?auto_679581 ) ) ( not ( = ?auto_679577 ?auto_679582 ) ) ( not ( = ?auto_679577 ?auto_679583 ) ) ( not ( = ?auto_679577 ?auto_679584 ) ) ( not ( = ?auto_679577 ?auto_679585 ) ) ( not ( = ?auto_679577 ?auto_679586 ) ) ( not ( = ?auto_679577 ?auto_679587 ) ) ( not ( = ?auto_679578 ?auto_679579 ) ) ( not ( = ?auto_679578 ?auto_679580 ) ) ( not ( = ?auto_679578 ?auto_679581 ) ) ( not ( = ?auto_679578 ?auto_679582 ) ) ( not ( = ?auto_679578 ?auto_679583 ) ) ( not ( = ?auto_679578 ?auto_679584 ) ) ( not ( = ?auto_679578 ?auto_679585 ) ) ( not ( = ?auto_679578 ?auto_679586 ) ) ( not ( = ?auto_679578 ?auto_679587 ) ) ( not ( = ?auto_679579 ?auto_679580 ) ) ( not ( = ?auto_679579 ?auto_679581 ) ) ( not ( = ?auto_679579 ?auto_679582 ) ) ( not ( = ?auto_679579 ?auto_679583 ) ) ( not ( = ?auto_679579 ?auto_679584 ) ) ( not ( = ?auto_679579 ?auto_679585 ) ) ( not ( = ?auto_679579 ?auto_679586 ) ) ( not ( = ?auto_679579 ?auto_679587 ) ) ( not ( = ?auto_679580 ?auto_679581 ) ) ( not ( = ?auto_679580 ?auto_679582 ) ) ( not ( = ?auto_679580 ?auto_679583 ) ) ( not ( = ?auto_679580 ?auto_679584 ) ) ( not ( = ?auto_679580 ?auto_679585 ) ) ( not ( = ?auto_679580 ?auto_679586 ) ) ( not ( = ?auto_679580 ?auto_679587 ) ) ( not ( = ?auto_679581 ?auto_679582 ) ) ( not ( = ?auto_679581 ?auto_679583 ) ) ( not ( = ?auto_679581 ?auto_679584 ) ) ( not ( = ?auto_679581 ?auto_679585 ) ) ( not ( = ?auto_679581 ?auto_679586 ) ) ( not ( = ?auto_679581 ?auto_679587 ) ) ( not ( = ?auto_679582 ?auto_679583 ) ) ( not ( = ?auto_679582 ?auto_679584 ) ) ( not ( = ?auto_679582 ?auto_679585 ) ) ( not ( = ?auto_679582 ?auto_679586 ) ) ( not ( = ?auto_679582 ?auto_679587 ) ) ( not ( = ?auto_679583 ?auto_679584 ) ) ( not ( = ?auto_679583 ?auto_679585 ) ) ( not ( = ?auto_679583 ?auto_679586 ) ) ( not ( = ?auto_679583 ?auto_679587 ) ) ( not ( = ?auto_679584 ?auto_679585 ) ) ( not ( = ?auto_679584 ?auto_679586 ) ) ( not ( = ?auto_679584 ?auto_679587 ) ) ( not ( = ?auto_679585 ?auto_679586 ) ) ( not ( = ?auto_679585 ?auto_679587 ) ) ( not ( = ?auto_679586 ?auto_679587 ) ) ( ON ?auto_679586 ?auto_679587 ) ( ON ?auto_679585 ?auto_679586 ) ( ON ?auto_679584 ?auto_679585 ) ( ON ?auto_679583 ?auto_679584 ) ( ON ?auto_679582 ?auto_679583 ) ( ON ?auto_679581 ?auto_679582 ) ( ON ?auto_679580 ?auto_679581 ) ( ON ?auto_679579 ?auto_679580 ) ( ON ?auto_679578 ?auto_679579 ) ( ON ?auto_679577 ?auto_679578 ) ( CLEAR ?auto_679575 ) ( ON ?auto_679576 ?auto_679577 ) ( CLEAR ?auto_679576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_679571 ?auto_679572 ?auto_679573 ?auto_679574 ?auto_679575 ?auto_679576 )
      ( MAKE-17PILE ?auto_679571 ?auto_679572 ?auto_679573 ?auto_679574 ?auto_679575 ?auto_679576 ?auto_679577 ?auto_679578 ?auto_679579 ?auto_679580 ?auto_679581 ?auto_679582 ?auto_679583 ?auto_679584 ?auto_679585 ?auto_679586 ?auto_679587 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679605 - BLOCK
      ?auto_679606 - BLOCK
      ?auto_679607 - BLOCK
      ?auto_679608 - BLOCK
      ?auto_679609 - BLOCK
      ?auto_679610 - BLOCK
      ?auto_679611 - BLOCK
      ?auto_679612 - BLOCK
      ?auto_679613 - BLOCK
      ?auto_679614 - BLOCK
      ?auto_679615 - BLOCK
      ?auto_679616 - BLOCK
      ?auto_679617 - BLOCK
      ?auto_679618 - BLOCK
      ?auto_679619 - BLOCK
      ?auto_679620 - BLOCK
      ?auto_679621 - BLOCK
    )
    :vars
    (
      ?auto_679622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679621 ?auto_679622 ) ( ON-TABLE ?auto_679605 ) ( ON ?auto_679606 ?auto_679605 ) ( ON ?auto_679607 ?auto_679606 ) ( ON ?auto_679608 ?auto_679607 ) ( not ( = ?auto_679605 ?auto_679606 ) ) ( not ( = ?auto_679605 ?auto_679607 ) ) ( not ( = ?auto_679605 ?auto_679608 ) ) ( not ( = ?auto_679605 ?auto_679609 ) ) ( not ( = ?auto_679605 ?auto_679610 ) ) ( not ( = ?auto_679605 ?auto_679611 ) ) ( not ( = ?auto_679605 ?auto_679612 ) ) ( not ( = ?auto_679605 ?auto_679613 ) ) ( not ( = ?auto_679605 ?auto_679614 ) ) ( not ( = ?auto_679605 ?auto_679615 ) ) ( not ( = ?auto_679605 ?auto_679616 ) ) ( not ( = ?auto_679605 ?auto_679617 ) ) ( not ( = ?auto_679605 ?auto_679618 ) ) ( not ( = ?auto_679605 ?auto_679619 ) ) ( not ( = ?auto_679605 ?auto_679620 ) ) ( not ( = ?auto_679605 ?auto_679621 ) ) ( not ( = ?auto_679605 ?auto_679622 ) ) ( not ( = ?auto_679606 ?auto_679607 ) ) ( not ( = ?auto_679606 ?auto_679608 ) ) ( not ( = ?auto_679606 ?auto_679609 ) ) ( not ( = ?auto_679606 ?auto_679610 ) ) ( not ( = ?auto_679606 ?auto_679611 ) ) ( not ( = ?auto_679606 ?auto_679612 ) ) ( not ( = ?auto_679606 ?auto_679613 ) ) ( not ( = ?auto_679606 ?auto_679614 ) ) ( not ( = ?auto_679606 ?auto_679615 ) ) ( not ( = ?auto_679606 ?auto_679616 ) ) ( not ( = ?auto_679606 ?auto_679617 ) ) ( not ( = ?auto_679606 ?auto_679618 ) ) ( not ( = ?auto_679606 ?auto_679619 ) ) ( not ( = ?auto_679606 ?auto_679620 ) ) ( not ( = ?auto_679606 ?auto_679621 ) ) ( not ( = ?auto_679606 ?auto_679622 ) ) ( not ( = ?auto_679607 ?auto_679608 ) ) ( not ( = ?auto_679607 ?auto_679609 ) ) ( not ( = ?auto_679607 ?auto_679610 ) ) ( not ( = ?auto_679607 ?auto_679611 ) ) ( not ( = ?auto_679607 ?auto_679612 ) ) ( not ( = ?auto_679607 ?auto_679613 ) ) ( not ( = ?auto_679607 ?auto_679614 ) ) ( not ( = ?auto_679607 ?auto_679615 ) ) ( not ( = ?auto_679607 ?auto_679616 ) ) ( not ( = ?auto_679607 ?auto_679617 ) ) ( not ( = ?auto_679607 ?auto_679618 ) ) ( not ( = ?auto_679607 ?auto_679619 ) ) ( not ( = ?auto_679607 ?auto_679620 ) ) ( not ( = ?auto_679607 ?auto_679621 ) ) ( not ( = ?auto_679607 ?auto_679622 ) ) ( not ( = ?auto_679608 ?auto_679609 ) ) ( not ( = ?auto_679608 ?auto_679610 ) ) ( not ( = ?auto_679608 ?auto_679611 ) ) ( not ( = ?auto_679608 ?auto_679612 ) ) ( not ( = ?auto_679608 ?auto_679613 ) ) ( not ( = ?auto_679608 ?auto_679614 ) ) ( not ( = ?auto_679608 ?auto_679615 ) ) ( not ( = ?auto_679608 ?auto_679616 ) ) ( not ( = ?auto_679608 ?auto_679617 ) ) ( not ( = ?auto_679608 ?auto_679618 ) ) ( not ( = ?auto_679608 ?auto_679619 ) ) ( not ( = ?auto_679608 ?auto_679620 ) ) ( not ( = ?auto_679608 ?auto_679621 ) ) ( not ( = ?auto_679608 ?auto_679622 ) ) ( not ( = ?auto_679609 ?auto_679610 ) ) ( not ( = ?auto_679609 ?auto_679611 ) ) ( not ( = ?auto_679609 ?auto_679612 ) ) ( not ( = ?auto_679609 ?auto_679613 ) ) ( not ( = ?auto_679609 ?auto_679614 ) ) ( not ( = ?auto_679609 ?auto_679615 ) ) ( not ( = ?auto_679609 ?auto_679616 ) ) ( not ( = ?auto_679609 ?auto_679617 ) ) ( not ( = ?auto_679609 ?auto_679618 ) ) ( not ( = ?auto_679609 ?auto_679619 ) ) ( not ( = ?auto_679609 ?auto_679620 ) ) ( not ( = ?auto_679609 ?auto_679621 ) ) ( not ( = ?auto_679609 ?auto_679622 ) ) ( not ( = ?auto_679610 ?auto_679611 ) ) ( not ( = ?auto_679610 ?auto_679612 ) ) ( not ( = ?auto_679610 ?auto_679613 ) ) ( not ( = ?auto_679610 ?auto_679614 ) ) ( not ( = ?auto_679610 ?auto_679615 ) ) ( not ( = ?auto_679610 ?auto_679616 ) ) ( not ( = ?auto_679610 ?auto_679617 ) ) ( not ( = ?auto_679610 ?auto_679618 ) ) ( not ( = ?auto_679610 ?auto_679619 ) ) ( not ( = ?auto_679610 ?auto_679620 ) ) ( not ( = ?auto_679610 ?auto_679621 ) ) ( not ( = ?auto_679610 ?auto_679622 ) ) ( not ( = ?auto_679611 ?auto_679612 ) ) ( not ( = ?auto_679611 ?auto_679613 ) ) ( not ( = ?auto_679611 ?auto_679614 ) ) ( not ( = ?auto_679611 ?auto_679615 ) ) ( not ( = ?auto_679611 ?auto_679616 ) ) ( not ( = ?auto_679611 ?auto_679617 ) ) ( not ( = ?auto_679611 ?auto_679618 ) ) ( not ( = ?auto_679611 ?auto_679619 ) ) ( not ( = ?auto_679611 ?auto_679620 ) ) ( not ( = ?auto_679611 ?auto_679621 ) ) ( not ( = ?auto_679611 ?auto_679622 ) ) ( not ( = ?auto_679612 ?auto_679613 ) ) ( not ( = ?auto_679612 ?auto_679614 ) ) ( not ( = ?auto_679612 ?auto_679615 ) ) ( not ( = ?auto_679612 ?auto_679616 ) ) ( not ( = ?auto_679612 ?auto_679617 ) ) ( not ( = ?auto_679612 ?auto_679618 ) ) ( not ( = ?auto_679612 ?auto_679619 ) ) ( not ( = ?auto_679612 ?auto_679620 ) ) ( not ( = ?auto_679612 ?auto_679621 ) ) ( not ( = ?auto_679612 ?auto_679622 ) ) ( not ( = ?auto_679613 ?auto_679614 ) ) ( not ( = ?auto_679613 ?auto_679615 ) ) ( not ( = ?auto_679613 ?auto_679616 ) ) ( not ( = ?auto_679613 ?auto_679617 ) ) ( not ( = ?auto_679613 ?auto_679618 ) ) ( not ( = ?auto_679613 ?auto_679619 ) ) ( not ( = ?auto_679613 ?auto_679620 ) ) ( not ( = ?auto_679613 ?auto_679621 ) ) ( not ( = ?auto_679613 ?auto_679622 ) ) ( not ( = ?auto_679614 ?auto_679615 ) ) ( not ( = ?auto_679614 ?auto_679616 ) ) ( not ( = ?auto_679614 ?auto_679617 ) ) ( not ( = ?auto_679614 ?auto_679618 ) ) ( not ( = ?auto_679614 ?auto_679619 ) ) ( not ( = ?auto_679614 ?auto_679620 ) ) ( not ( = ?auto_679614 ?auto_679621 ) ) ( not ( = ?auto_679614 ?auto_679622 ) ) ( not ( = ?auto_679615 ?auto_679616 ) ) ( not ( = ?auto_679615 ?auto_679617 ) ) ( not ( = ?auto_679615 ?auto_679618 ) ) ( not ( = ?auto_679615 ?auto_679619 ) ) ( not ( = ?auto_679615 ?auto_679620 ) ) ( not ( = ?auto_679615 ?auto_679621 ) ) ( not ( = ?auto_679615 ?auto_679622 ) ) ( not ( = ?auto_679616 ?auto_679617 ) ) ( not ( = ?auto_679616 ?auto_679618 ) ) ( not ( = ?auto_679616 ?auto_679619 ) ) ( not ( = ?auto_679616 ?auto_679620 ) ) ( not ( = ?auto_679616 ?auto_679621 ) ) ( not ( = ?auto_679616 ?auto_679622 ) ) ( not ( = ?auto_679617 ?auto_679618 ) ) ( not ( = ?auto_679617 ?auto_679619 ) ) ( not ( = ?auto_679617 ?auto_679620 ) ) ( not ( = ?auto_679617 ?auto_679621 ) ) ( not ( = ?auto_679617 ?auto_679622 ) ) ( not ( = ?auto_679618 ?auto_679619 ) ) ( not ( = ?auto_679618 ?auto_679620 ) ) ( not ( = ?auto_679618 ?auto_679621 ) ) ( not ( = ?auto_679618 ?auto_679622 ) ) ( not ( = ?auto_679619 ?auto_679620 ) ) ( not ( = ?auto_679619 ?auto_679621 ) ) ( not ( = ?auto_679619 ?auto_679622 ) ) ( not ( = ?auto_679620 ?auto_679621 ) ) ( not ( = ?auto_679620 ?auto_679622 ) ) ( not ( = ?auto_679621 ?auto_679622 ) ) ( ON ?auto_679620 ?auto_679621 ) ( ON ?auto_679619 ?auto_679620 ) ( ON ?auto_679618 ?auto_679619 ) ( ON ?auto_679617 ?auto_679618 ) ( ON ?auto_679616 ?auto_679617 ) ( ON ?auto_679615 ?auto_679616 ) ( ON ?auto_679614 ?auto_679615 ) ( ON ?auto_679613 ?auto_679614 ) ( ON ?auto_679612 ?auto_679613 ) ( ON ?auto_679611 ?auto_679612 ) ( ON ?auto_679610 ?auto_679611 ) ( CLEAR ?auto_679608 ) ( ON ?auto_679609 ?auto_679610 ) ( CLEAR ?auto_679609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_679605 ?auto_679606 ?auto_679607 ?auto_679608 ?auto_679609 )
      ( MAKE-17PILE ?auto_679605 ?auto_679606 ?auto_679607 ?auto_679608 ?auto_679609 ?auto_679610 ?auto_679611 ?auto_679612 ?auto_679613 ?auto_679614 ?auto_679615 ?auto_679616 ?auto_679617 ?auto_679618 ?auto_679619 ?auto_679620 ?auto_679621 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679640 - BLOCK
      ?auto_679641 - BLOCK
      ?auto_679642 - BLOCK
      ?auto_679643 - BLOCK
      ?auto_679644 - BLOCK
      ?auto_679645 - BLOCK
      ?auto_679646 - BLOCK
      ?auto_679647 - BLOCK
      ?auto_679648 - BLOCK
      ?auto_679649 - BLOCK
      ?auto_679650 - BLOCK
      ?auto_679651 - BLOCK
      ?auto_679652 - BLOCK
      ?auto_679653 - BLOCK
      ?auto_679654 - BLOCK
      ?auto_679655 - BLOCK
      ?auto_679656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679656 ) ( ON-TABLE ?auto_679640 ) ( ON ?auto_679641 ?auto_679640 ) ( ON ?auto_679642 ?auto_679641 ) ( ON ?auto_679643 ?auto_679642 ) ( not ( = ?auto_679640 ?auto_679641 ) ) ( not ( = ?auto_679640 ?auto_679642 ) ) ( not ( = ?auto_679640 ?auto_679643 ) ) ( not ( = ?auto_679640 ?auto_679644 ) ) ( not ( = ?auto_679640 ?auto_679645 ) ) ( not ( = ?auto_679640 ?auto_679646 ) ) ( not ( = ?auto_679640 ?auto_679647 ) ) ( not ( = ?auto_679640 ?auto_679648 ) ) ( not ( = ?auto_679640 ?auto_679649 ) ) ( not ( = ?auto_679640 ?auto_679650 ) ) ( not ( = ?auto_679640 ?auto_679651 ) ) ( not ( = ?auto_679640 ?auto_679652 ) ) ( not ( = ?auto_679640 ?auto_679653 ) ) ( not ( = ?auto_679640 ?auto_679654 ) ) ( not ( = ?auto_679640 ?auto_679655 ) ) ( not ( = ?auto_679640 ?auto_679656 ) ) ( not ( = ?auto_679641 ?auto_679642 ) ) ( not ( = ?auto_679641 ?auto_679643 ) ) ( not ( = ?auto_679641 ?auto_679644 ) ) ( not ( = ?auto_679641 ?auto_679645 ) ) ( not ( = ?auto_679641 ?auto_679646 ) ) ( not ( = ?auto_679641 ?auto_679647 ) ) ( not ( = ?auto_679641 ?auto_679648 ) ) ( not ( = ?auto_679641 ?auto_679649 ) ) ( not ( = ?auto_679641 ?auto_679650 ) ) ( not ( = ?auto_679641 ?auto_679651 ) ) ( not ( = ?auto_679641 ?auto_679652 ) ) ( not ( = ?auto_679641 ?auto_679653 ) ) ( not ( = ?auto_679641 ?auto_679654 ) ) ( not ( = ?auto_679641 ?auto_679655 ) ) ( not ( = ?auto_679641 ?auto_679656 ) ) ( not ( = ?auto_679642 ?auto_679643 ) ) ( not ( = ?auto_679642 ?auto_679644 ) ) ( not ( = ?auto_679642 ?auto_679645 ) ) ( not ( = ?auto_679642 ?auto_679646 ) ) ( not ( = ?auto_679642 ?auto_679647 ) ) ( not ( = ?auto_679642 ?auto_679648 ) ) ( not ( = ?auto_679642 ?auto_679649 ) ) ( not ( = ?auto_679642 ?auto_679650 ) ) ( not ( = ?auto_679642 ?auto_679651 ) ) ( not ( = ?auto_679642 ?auto_679652 ) ) ( not ( = ?auto_679642 ?auto_679653 ) ) ( not ( = ?auto_679642 ?auto_679654 ) ) ( not ( = ?auto_679642 ?auto_679655 ) ) ( not ( = ?auto_679642 ?auto_679656 ) ) ( not ( = ?auto_679643 ?auto_679644 ) ) ( not ( = ?auto_679643 ?auto_679645 ) ) ( not ( = ?auto_679643 ?auto_679646 ) ) ( not ( = ?auto_679643 ?auto_679647 ) ) ( not ( = ?auto_679643 ?auto_679648 ) ) ( not ( = ?auto_679643 ?auto_679649 ) ) ( not ( = ?auto_679643 ?auto_679650 ) ) ( not ( = ?auto_679643 ?auto_679651 ) ) ( not ( = ?auto_679643 ?auto_679652 ) ) ( not ( = ?auto_679643 ?auto_679653 ) ) ( not ( = ?auto_679643 ?auto_679654 ) ) ( not ( = ?auto_679643 ?auto_679655 ) ) ( not ( = ?auto_679643 ?auto_679656 ) ) ( not ( = ?auto_679644 ?auto_679645 ) ) ( not ( = ?auto_679644 ?auto_679646 ) ) ( not ( = ?auto_679644 ?auto_679647 ) ) ( not ( = ?auto_679644 ?auto_679648 ) ) ( not ( = ?auto_679644 ?auto_679649 ) ) ( not ( = ?auto_679644 ?auto_679650 ) ) ( not ( = ?auto_679644 ?auto_679651 ) ) ( not ( = ?auto_679644 ?auto_679652 ) ) ( not ( = ?auto_679644 ?auto_679653 ) ) ( not ( = ?auto_679644 ?auto_679654 ) ) ( not ( = ?auto_679644 ?auto_679655 ) ) ( not ( = ?auto_679644 ?auto_679656 ) ) ( not ( = ?auto_679645 ?auto_679646 ) ) ( not ( = ?auto_679645 ?auto_679647 ) ) ( not ( = ?auto_679645 ?auto_679648 ) ) ( not ( = ?auto_679645 ?auto_679649 ) ) ( not ( = ?auto_679645 ?auto_679650 ) ) ( not ( = ?auto_679645 ?auto_679651 ) ) ( not ( = ?auto_679645 ?auto_679652 ) ) ( not ( = ?auto_679645 ?auto_679653 ) ) ( not ( = ?auto_679645 ?auto_679654 ) ) ( not ( = ?auto_679645 ?auto_679655 ) ) ( not ( = ?auto_679645 ?auto_679656 ) ) ( not ( = ?auto_679646 ?auto_679647 ) ) ( not ( = ?auto_679646 ?auto_679648 ) ) ( not ( = ?auto_679646 ?auto_679649 ) ) ( not ( = ?auto_679646 ?auto_679650 ) ) ( not ( = ?auto_679646 ?auto_679651 ) ) ( not ( = ?auto_679646 ?auto_679652 ) ) ( not ( = ?auto_679646 ?auto_679653 ) ) ( not ( = ?auto_679646 ?auto_679654 ) ) ( not ( = ?auto_679646 ?auto_679655 ) ) ( not ( = ?auto_679646 ?auto_679656 ) ) ( not ( = ?auto_679647 ?auto_679648 ) ) ( not ( = ?auto_679647 ?auto_679649 ) ) ( not ( = ?auto_679647 ?auto_679650 ) ) ( not ( = ?auto_679647 ?auto_679651 ) ) ( not ( = ?auto_679647 ?auto_679652 ) ) ( not ( = ?auto_679647 ?auto_679653 ) ) ( not ( = ?auto_679647 ?auto_679654 ) ) ( not ( = ?auto_679647 ?auto_679655 ) ) ( not ( = ?auto_679647 ?auto_679656 ) ) ( not ( = ?auto_679648 ?auto_679649 ) ) ( not ( = ?auto_679648 ?auto_679650 ) ) ( not ( = ?auto_679648 ?auto_679651 ) ) ( not ( = ?auto_679648 ?auto_679652 ) ) ( not ( = ?auto_679648 ?auto_679653 ) ) ( not ( = ?auto_679648 ?auto_679654 ) ) ( not ( = ?auto_679648 ?auto_679655 ) ) ( not ( = ?auto_679648 ?auto_679656 ) ) ( not ( = ?auto_679649 ?auto_679650 ) ) ( not ( = ?auto_679649 ?auto_679651 ) ) ( not ( = ?auto_679649 ?auto_679652 ) ) ( not ( = ?auto_679649 ?auto_679653 ) ) ( not ( = ?auto_679649 ?auto_679654 ) ) ( not ( = ?auto_679649 ?auto_679655 ) ) ( not ( = ?auto_679649 ?auto_679656 ) ) ( not ( = ?auto_679650 ?auto_679651 ) ) ( not ( = ?auto_679650 ?auto_679652 ) ) ( not ( = ?auto_679650 ?auto_679653 ) ) ( not ( = ?auto_679650 ?auto_679654 ) ) ( not ( = ?auto_679650 ?auto_679655 ) ) ( not ( = ?auto_679650 ?auto_679656 ) ) ( not ( = ?auto_679651 ?auto_679652 ) ) ( not ( = ?auto_679651 ?auto_679653 ) ) ( not ( = ?auto_679651 ?auto_679654 ) ) ( not ( = ?auto_679651 ?auto_679655 ) ) ( not ( = ?auto_679651 ?auto_679656 ) ) ( not ( = ?auto_679652 ?auto_679653 ) ) ( not ( = ?auto_679652 ?auto_679654 ) ) ( not ( = ?auto_679652 ?auto_679655 ) ) ( not ( = ?auto_679652 ?auto_679656 ) ) ( not ( = ?auto_679653 ?auto_679654 ) ) ( not ( = ?auto_679653 ?auto_679655 ) ) ( not ( = ?auto_679653 ?auto_679656 ) ) ( not ( = ?auto_679654 ?auto_679655 ) ) ( not ( = ?auto_679654 ?auto_679656 ) ) ( not ( = ?auto_679655 ?auto_679656 ) ) ( ON ?auto_679655 ?auto_679656 ) ( ON ?auto_679654 ?auto_679655 ) ( ON ?auto_679653 ?auto_679654 ) ( ON ?auto_679652 ?auto_679653 ) ( ON ?auto_679651 ?auto_679652 ) ( ON ?auto_679650 ?auto_679651 ) ( ON ?auto_679649 ?auto_679650 ) ( ON ?auto_679648 ?auto_679649 ) ( ON ?auto_679647 ?auto_679648 ) ( ON ?auto_679646 ?auto_679647 ) ( ON ?auto_679645 ?auto_679646 ) ( CLEAR ?auto_679643 ) ( ON ?auto_679644 ?auto_679645 ) ( CLEAR ?auto_679644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_679640 ?auto_679641 ?auto_679642 ?auto_679643 ?auto_679644 )
      ( MAKE-17PILE ?auto_679640 ?auto_679641 ?auto_679642 ?auto_679643 ?auto_679644 ?auto_679645 ?auto_679646 ?auto_679647 ?auto_679648 ?auto_679649 ?auto_679650 ?auto_679651 ?auto_679652 ?auto_679653 ?auto_679654 ?auto_679655 ?auto_679656 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679674 - BLOCK
      ?auto_679675 - BLOCK
      ?auto_679676 - BLOCK
      ?auto_679677 - BLOCK
      ?auto_679678 - BLOCK
      ?auto_679679 - BLOCK
      ?auto_679680 - BLOCK
      ?auto_679681 - BLOCK
      ?auto_679682 - BLOCK
      ?auto_679683 - BLOCK
      ?auto_679684 - BLOCK
      ?auto_679685 - BLOCK
      ?auto_679686 - BLOCK
      ?auto_679687 - BLOCK
      ?auto_679688 - BLOCK
      ?auto_679689 - BLOCK
      ?auto_679690 - BLOCK
    )
    :vars
    (
      ?auto_679691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679690 ?auto_679691 ) ( ON-TABLE ?auto_679674 ) ( ON ?auto_679675 ?auto_679674 ) ( ON ?auto_679676 ?auto_679675 ) ( not ( = ?auto_679674 ?auto_679675 ) ) ( not ( = ?auto_679674 ?auto_679676 ) ) ( not ( = ?auto_679674 ?auto_679677 ) ) ( not ( = ?auto_679674 ?auto_679678 ) ) ( not ( = ?auto_679674 ?auto_679679 ) ) ( not ( = ?auto_679674 ?auto_679680 ) ) ( not ( = ?auto_679674 ?auto_679681 ) ) ( not ( = ?auto_679674 ?auto_679682 ) ) ( not ( = ?auto_679674 ?auto_679683 ) ) ( not ( = ?auto_679674 ?auto_679684 ) ) ( not ( = ?auto_679674 ?auto_679685 ) ) ( not ( = ?auto_679674 ?auto_679686 ) ) ( not ( = ?auto_679674 ?auto_679687 ) ) ( not ( = ?auto_679674 ?auto_679688 ) ) ( not ( = ?auto_679674 ?auto_679689 ) ) ( not ( = ?auto_679674 ?auto_679690 ) ) ( not ( = ?auto_679674 ?auto_679691 ) ) ( not ( = ?auto_679675 ?auto_679676 ) ) ( not ( = ?auto_679675 ?auto_679677 ) ) ( not ( = ?auto_679675 ?auto_679678 ) ) ( not ( = ?auto_679675 ?auto_679679 ) ) ( not ( = ?auto_679675 ?auto_679680 ) ) ( not ( = ?auto_679675 ?auto_679681 ) ) ( not ( = ?auto_679675 ?auto_679682 ) ) ( not ( = ?auto_679675 ?auto_679683 ) ) ( not ( = ?auto_679675 ?auto_679684 ) ) ( not ( = ?auto_679675 ?auto_679685 ) ) ( not ( = ?auto_679675 ?auto_679686 ) ) ( not ( = ?auto_679675 ?auto_679687 ) ) ( not ( = ?auto_679675 ?auto_679688 ) ) ( not ( = ?auto_679675 ?auto_679689 ) ) ( not ( = ?auto_679675 ?auto_679690 ) ) ( not ( = ?auto_679675 ?auto_679691 ) ) ( not ( = ?auto_679676 ?auto_679677 ) ) ( not ( = ?auto_679676 ?auto_679678 ) ) ( not ( = ?auto_679676 ?auto_679679 ) ) ( not ( = ?auto_679676 ?auto_679680 ) ) ( not ( = ?auto_679676 ?auto_679681 ) ) ( not ( = ?auto_679676 ?auto_679682 ) ) ( not ( = ?auto_679676 ?auto_679683 ) ) ( not ( = ?auto_679676 ?auto_679684 ) ) ( not ( = ?auto_679676 ?auto_679685 ) ) ( not ( = ?auto_679676 ?auto_679686 ) ) ( not ( = ?auto_679676 ?auto_679687 ) ) ( not ( = ?auto_679676 ?auto_679688 ) ) ( not ( = ?auto_679676 ?auto_679689 ) ) ( not ( = ?auto_679676 ?auto_679690 ) ) ( not ( = ?auto_679676 ?auto_679691 ) ) ( not ( = ?auto_679677 ?auto_679678 ) ) ( not ( = ?auto_679677 ?auto_679679 ) ) ( not ( = ?auto_679677 ?auto_679680 ) ) ( not ( = ?auto_679677 ?auto_679681 ) ) ( not ( = ?auto_679677 ?auto_679682 ) ) ( not ( = ?auto_679677 ?auto_679683 ) ) ( not ( = ?auto_679677 ?auto_679684 ) ) ( not ( = ?auto_679677 ?auto_679685 ) ) ( not ( = ?auto_679677 ?auto_679686 ) ) ( not ( = ?auto_679677 ?auto_679687 ) ) ( not ( = ?auto_679677 ?auto_679688 ) ) ( not ( = ?auto_679677 ?auto_679689 ) ) ( not ( = ?auto_679677 ?auto_679690 ) ) ( not ( = ?auto_679677 ?auto_679691 ) ) ( not ( = ?auto_679678 ?auto_679679 ) ) ( not ( = ?auto_679678 ?auto_679680 ) ) ( not ( = ?auto_679678 ?auto_679681 ) ) ( not ( = ?auto_679678 ?auto_679682 ) ) ( not ( = ?auto_679678 ?auto_679683 ) ) ( not ( = ?auto_679678 ?auto_679684 ) ) ( not ( = ?auto_679678 ?auto_679685 ) ) ( not ( = ?auto_679678 ?auto_679686 ) ) ( not ( = ?auto_679678 ?auto_679687 ) ) ( not ( = ?auto_679678 ?auto_679688 ) ) ( not ( = ?auto_679678 ?auto_679689 ) ) ( not ( = ?auto_679678 ?auto_679690 ) ) ( not ( = ?auto_679678 ?auto_679691 ) ) ( not ( = ?auto_679679 ?auto_679680 ) ) ( not ( = ?auto_679679 ?auto_679681 ) ) ( not ( = ?auto_679679 ?auto_679682 ) ) ( not ( = ?auto_679679 ?auto_679683 ) ) ( not ( = ?auto_679679 ?auto_679684 ) ) ( not ( = ?auto_679679 ?auto_679685 ) ) ( not ( = ?auto_679679 ?auto_679686 ) ) ( not ( = ?auto_679679 ?auto_679687 ) ) ( not ( = ?auto_679679 ?auto_679688 ) ) ( not ( = ?auto_679679 ?auto_679689 ) ) ( not ( = ?auto_679679 ?auto_679690 ) ) ( not ( = ?auto_679679 ?auto_679691 ) ) ( not ( = ?auto_679680 ?auto_679681 ) ) ( not ( = ?auto_679680 ?auto_679682 ) ) ( not ( = ?auto_679680 ?auto_679683 ) ) ( not ( = ?auto_679680 ?auto_679684 ) ) ( not ( = ?auto_679680 ?auto_679685 ) ) ( not ( = ?auto_679680 ?auto_679686 ) ) ( not ( = ?auto_679680 ?auto_679687 ) ) ( not ( = ?auto_679680 ?auto_679688 ) ) ( not ( = ?auto_679680 ?auto_679689 ) ) ( not ( = ?auto_679680 ?auto_679690 ) ) ( not ( = ?auto_679680 ?auto_679691 ) ) ( not ( = ?auto_679681 ?auto_679682 ) ) ( not ( = ?auto_679681 ?auto_679683 ) ) ( not ( = ?auto_679681 ?auto_679684 ) ) ( not ( = ?auto_679681 ?auto_679685 ) ) ( not ( = ?auto_679681 ?auto_679686 ) ) ( not ( = ?auto_679681 ?auto_679687 ) ) ( not ( = ?auto_679681 ?auto_679688 ) ) ( not ( = ?auto_679681 ?auto_679689 ) ) ( not ( = ?auto_679681 ?auto_679690 ) ) ( not ( = ?auto_679681 ?auto_679691 ) ) ( not ( = ?auto_679682 ?auto_679683 ) ) ( not ( = ?auto_679682 ?auto_679684 ) ) ( not ( = ?auto_679682 ?auto_679685 ) ) ( not ( = ?auto_679682 ?auto_679686 ) ) ( not ( = ?auto_679682 ?auto_679687 ) ) ( not ( = ?auto_679682 ?auto_679688 ) ) ( not ( = ?auto_679682 ?auto_679689 ) ) ( not ( = ?auto_679682 ?auto_679690 ) ) ( not ( = ?auto_679682 ?auto_679691 ) ) ( not ( = ?auto_679683 ?auto_679684 ) ) ( not ( = ?auto_679683 ?auto_679685 ) ) ( not ( = ?auto_679683 ?auto_679686 ) ) ( not ( = ?auto_679683 ?auto_679687 ) ) ( not ( = ?auto_679683 ?auto_679688 ) ) ( not ( = ?auto_679683 ?auto_679689 ) ) ( not ( = ?auto_679683 ?auto_679690 ) ) ( not ( = ?auto_679683 ?auto_679691 ) ) ( not ( = ?auto_679684 ?auto_679685 ) ) ( not ( = ?auto_679684 ?auto_679686 ) ) ( not ( = ?auto_679684 ?auto_679687 ) ) ( not ( = ?auto_679684 ?auto_679688 ) ) ( not ( = ?auto_679684 ?auto_679689 ) ) ( not ( = ?auto_679684 ?auto_679690 ) ) ( not ( = ?auto_679684 ?auto_679691 ) ) ( not ( = ?auto_679685 ?auto_679686 ) ) ( not ( = ?auto_679685 ?auto_679687 ) ) ( not ( = ?auto_679685 ?auto_679688 ) ) ( not ( = ?auto_679685 ?auto_679689 ) ) ( not ( = ?auto_679685 ?auto_679690 ) ) ( not ( = ?auto_679685 ?auto_679691 ) ) ( not ( = ?auto_679686 ?auto_679687 ) ) ( not ( = ?auto_679686 ?auto_679688 ) ) ( not ( = ?auto_679686 ?auto_679689 ) ) ( not ( = ?auto_679686 ?auto_679690 ) ) ( not ( = ?auto_679686 ?auto_679691 ) ) ( not ( = ?auto_679687 ?auto_679688 ) ) ( not ( = ?auto_679687 ?auto_679689 ) ) ( not ( = ?auto_679687 ?auto_679690 ) ) ( not ( = ?auto_679687 ?auto_679691 ) ) ( not ( = ?auto_679688 ?auto_679689 ) ) ( not ( = ?auto_679688 ?auto_679690 ) ) ( not ( = ?auto_679688 ?auto_679691 ) ) ( not ( = ?auto_679689 ?auto_679690 ) ) ( not ( = ?auto_679689 ?auto_679691 ) ) ( not ( = ?auto_679690 ?auto_679691 ) ) ( ON ?auto_679689 ?auto_679690 ) ( ON ?auto_679688 ?auto_679689 ) ( ON ?auto_679687 ?auto_679688 ) ( ON ?auto_679686 ?auto_679687 ) ( ON ?auto_679685 ?auto_679686 ) ( ON ?auto_679684 ?auto_679685 ) ( ON ?auto_679683 ?auto_679684 ) ( ON ?auto_679682 ?auto_679683 ) ( ON ?auto_679681 ?auto_679682 ) ( ON ?auto_679680 ?auto_679681 ) ( ON ?auto_679679 ?auto_679680 ) ( ON ?auto_679678 ?auto_679679 ) ( CLEAR ?auto_679676 ) ( ON ?auto_679677 ?auto_679678 ) ( CLEAR ?auto_679677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_679674 ?auto_679675 ?auto_679676 ?auto_679677 )
      ( MAKE-17PILE ?auto_679674 ?auto_679675 ?auto_679676 ?auto_679677 ?auto_679678 ?auto_679679 ?auto_679680 ?auto_679681 ?auto_679682 ?auto_679683 ?auto_679684 ?auto_679685 ?auto_679686 ?auto_679687 ?auto_679688 ?auto_679689 ?auto_679690 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679709 - BLOCK
      ?auto_679710 - BLOCK
      ?auto_679711 - BLOCK
      ?auto_679712 - BLOCK
      ?auto_679713 - BLOCK
      ?auto_679714 - BLOCK
      ?auto_679715 - BLOCK
      ?auto_679716 - BLOCK
      ?auto_679717 - BLOCK
      ?auto_679718 - BLOCK
      ?auto_679719 - BLOCK
      ?auto_679720 - BLOCK
      ?auto_679721 - BLOCK
      ?auto_679722 - BLOCK
      ?auto_679723 - BLOCK
      ?auto_679724 - BLOCK
      ?auto_679725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679725 ) ( ON-TABLE ?auto_679709 ) ( ON ?auto_679710 ?auto_679709 ) ( ON ?auto_679711 ?auto_679710 ) ( not ( = ?auto_679709 ?auto_679710 ) ) ( not ( = ?auto_679709 ?auto_679711 ) ) ( not ( = ?auto_679709 ?auto_679712 ) ) ( not ( = ?auto_679709 ?auto_679713 ) ) ( not ( = ?auto_679709 ?auto_679714 ) ) ( not ( = ?auto_679709 ?auto_679715 ) ) ( not ( = ?auto_679709 ?auto_679716 ) ) ( not ( = ?auto_679709 ?auto_679717 ) ) ( not ( = ?auto_679709 ?auto_679718 ) ) ( not ( = ?auto_679709 ?auto_679719 ) ) ( not ( = ?auto_679709 ?auto_679720 ) ) ( not ( = ?auto_679709 ?auto_679721 ) ) ( not ( = ?auto_679709 ?auto_679722 ) ) ( not ( = ?auto_679709 ?auto_679723 ) ) ( not ( = ?auto_679709 ?auto_679724 ) ) ( not ( = ?auto_679709 ?auto_679725 ) ) ( not ( = ?auto_679710 ?auto_679711 ) ) ( not ( = ?auto_679710 ?auto_679712 ) ) ( not ( = ?auto_679710 ?auto_679713 ) ) ( not ( = ?auto_679710 ?auto_679714 ) ) ( not ( = ?auto_679710 ?auto_679715 ) ) ( not ( = ?auto_679710 ?auto_679716 ) ) ( not ( = ?auto_679710 ?auto_679717 ) ) ( not ( = ?auto_679710 ?auto_679718 ) ) ( not ( = ?auto_679710 ?auto_679719 ) ) ( not ( = ?auto_679710 ?auto_679720 ) ) ( not ( = ?auto_679710 ?auto_679721 ) ) ( not ( = ?auto_679710 ?auto_679722 ) ) ( not ( = ?auto_679710 ?auto_679723 ) ) ( not ( = ?auto_679710 ?auto_679724 ) ) ( not ( = ?auto_679710 ?auto_679725 ) ) ( not ( = ?auto_679711 ?auto_679712 ) ) ( not ( = ?auto_679711 ?auto_679713 ) ) ( not ( = ?auto_679711 ?auto_679714 ) ) ( not ( = ?auto_679711 ?auto_679715 ) ) ( not ( = ?auto_679711 ?auto_679716 ) ) ( not ( = ?auto_679711 ?auto_679717 ) ) ( not ( = ?auto_679711 ?auto_679718 ) ) ( not ( = ?auto_679711 ?auto_679719 ) ) ( not ( = ?auto_679711 ?auto_679720 ) ) ( not ( = ?auto_679711 ?auto_679721 ) ) ( not ( = ?auto_679711 ?auto_679722 ) ) ( not ( = ?auto_679711 ?auto_679723 ) ) ( not ( = ?auto_679711 ?auto_679724 ) ) ( not ( = ?auto_679711 ?auto_679725 ) ) ( not ( = ?auto_679712 ?auto_679713 ) ) ( not ( = ?auto_679712 ?auto_679714 ) ) ( not ( = ?auto_679712 ?auto_679715 ) ) ( not ( = ?auto_679712 ?auto_679716 ) ) ( not ( = ?auto_679712 ?auto_679717 ) ) ( not ( = ?auto_679712 ?auto_679718 ) ) ( not ( = ?auto_679712 ?auto_679719 ) ) ( not ( = ?auto_679712 ?auto_679720 ) ) ( not ( = ?auto_679712 ?auto_679721 ) ) ( not ( = ?auto_679712 ?auto_679722 ) ) ( not ( = ?auto_679712 ?auto_679723 ) ) ( not ( = ?auto_679712 ?auto_679724 ) ) ( not ( = ?auto_679712 ?auto_679725 ) ) ( not ( = ?auto_679713 ?auto_679714 ) ) ( not ( = ?auto_679713 ?auto_679715 ) ) ( not ( = ?auto_679713 ?auto_679716 ) ) ( not ( = ?auto_679713 ?auto_679717 ) ) ( not ( = ?auto_679713 ?auto_679718 ) ) ( not ( = ?auto_679713 ?auto_679719 ) ) ( not ( = ?auto_679713 ?auto_679720 ) ) ( not ( = ?auto_679713 ?auto_679721 ) ) ( not ( = ?auto_679713 ?auto_679722 ) ) ( not ( = ?auto_679713 ?auto_679723 ) ) ( not ( = ?auto_679713 ?auto_679724 ) ) ( not ( = ?auto_679713 ?auto_679725 ) ) ( not ( = ?auto_679714 ?auto_679715 ) ) ( not ( = ?auto_679714 ?auto_679716 ) ) ( not ( = ?auto_679714 ?auto_679717 ) ) ( not ( = ?auto_679714 ?auto_679718 ) ) ( not ( = ?auto_679714 ?auto_679719 ) ) ( not ( = ?auto_679714 ?auto_679720 ) ) ( not ( = ?auto_679714 ?auto_679721 ) ) ( not ( = ?auto_679714 ?auto_679722 ) ) ( not ( = ?auto_679714 ?auto_679723 ) ) ( not ( = ?auto_679714 ?auto_679724 ) ) ( not ( = ?auto_679714 ?auto_679725 ) ) ( not ( = ?auto_679715 ?auto_679716 ) ) ( not ( = ?auto_679715 ?auto_679717 ) ) ( not ( = ?auto_679715 ?auto_679718 ) ) ( not ( = ?auto_679715 ?auto_679719 ) ) ( not ( = ?auto_679715 ?auto_679720 ) ) ( not ( = ?auto_679715 ?auto_679721 ) ) ( not ( = ?auto_679715 ?auto_679722 ) ) ( not ( = ?auto_679715 ?auto_679723 ) ) ( not ( = ?auto_679715 ?auto_679724 ) ) ( not ( = ?auto_679715 ?auto_679725 ) ) ( not ( = ?auto_679716 ?auto_679717 ) ) ( not ( = ?auto_679716 ?auto_679718 ) ) ( not ( = ?auto_679716 ?auto_679719 ) ) ( not ( = ?auto_679716 ?auto_679720 ) ) ( not ( = ?auto_679716 ?auto_679721 ) ) ( not ( = ?auto_679716 ?auto_679722 ) ) ( not ( = ?auto_679716 ?auto_679723 ) ) ( not ( = ?auto_679716 ?auto_679724 ) ) ( not ( = ?auto_679716 ?auto_679725 ) ) ( not ( = ?auto_679717 ?auto_679718 ) ) ( not ( = ?auto_679717 ?auto_679719 ) ) ( not ( = ?auto_679717 ?auto_679720 ) ) ( not ( = ?auto_679717 ?auto_679721 ) ) ( not ( = ?auto_679717 ?auto_679722 ) ) ( not ( = ?auto_679717 ?auto_679723 ) ) ( not ( = ?auto_679717 ?auto_679724 ) ) ( not ( = ?auto_679717 ?auto_679725 ) ) ( not ( = ?auto_679718 ?auto_679719 ) ) ( not ( = ?auto_679718 ?auto_679720 ) ) ( not ( = ?auto_679718 ?auto_679721 ) ) ( not ( = ?auto_679718 ?auto_679722 ) ) ( not ( = ?auto_679718 ?auto_679723 ) ) ( not ( = ?auto_679718 ?auto_679724 ) ) ( not ( = ?auto_679718 ?auto_679725 ) ) ( not ( = ?auto_679719 ?auto_679720 ) ) ( not ( = ?auto_679719 ?auto_679721 ) ) ( not ( = ?auto_679719 ?auto_679722 ) ) ( not ( = ?auto_679719 ?auto_679723 ) ) ( not ( = ?auto_679719 ?auto_679724 ) ) ( not ( = ?auto_679719 ?auto_679725 ) ) ( not ( = ?auto_679720 ?auto_679721 ) ) ( not ( = ?auto_679720 ?auto_679722 ) ) ( not ( = ?auto_679720 ?auto_679723 ) ) ( not ( = ?auto_679720 ?auto_679724 ) ) ( not ( = ?auto_679720 ?auto_679725 ) ) ( not ( = ?auto_679721 ?auto_679722 ) ) ( not ( = ?auto_679721 ?auto_679723 ) ) ( not ( = ?auto_679721 ?auto_679724 ) ) ( not ( = ?auto_679721 ?auto_679725 ) ) ( not ( = ?auto_679722 ?auto_679723 ) ) ( not ( = ?auto_679722 ?auto_679724 ) ) ( not ( = ?auto_679722 ?auto_679725 ) ) ( not ( = ?auto_679723 ?auto_679724 ) ) ( not ( = ?auto_679723 ?auto_679725 ) ) ( not ( = ?auto_679724 ?auto_679725 ) ) ( ON ?auto_679724 ?auto_679725 ) ( ON ?auto_679723 ?auto_679724 ) ( ON ?auto_679722 ?auto_679723 ) ( ON ?auto_679721 ?auto_679722 ) ( ON ?auto_679720 ?auto_679721 ) ( ON ?auto_679719 ?auto_679720 ) ( ON ?auto_679718 ?auto_679719 ) ( ON ?auto_679717 ?auto_679718 ) ( ON ?auto_679716 ?auto_679717 ) ( ON ?auto_679715 ?auto_679716 ) ( ON ?auto_679714 ?auto_679715 ) ( ON ?auto_679713 ?auto_679714 ) ( CLEAR ?auto_679711 ) ( ON ?auto_679712 ?auto_679713 ) ( CLEAR ?auto_679712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_679709 ?auto_679710 ?auto_679711 ?auto_679712 )
      ( MAKE-17PILE ?auto_679709 ?auto_679710 ?auto_679711 ?auto_679712 ?auto_679713 ?auto_679714 ?auto_679715 ?auto_679716 ?auto_679717 ?auto_679718 ?auto_679719 ?auto_679720 ?auto_679721 ?auto_679722 ?auto_679723 ?auto_679724 ?auto_679725 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679743 - BLOCK
      ?auto_679744 - BLOCK
      ?auto_679745 - BLOCK
      ?auto_679746 - BLOCK
      ?auto_679747 - BLOCK
      ?auto_679748 - BLOCK
      ?auto_679749 - BLOCK
      ?auto_679750 - BLOCK
      ?auto_679751 - BLOCK
      ?auto_679752 - BLOCK
      ?auto_679753 - BLOCK
      ?auto_679754 - BLOCK
      ?auto_679755 - BLOCK
      ?auto_679756 - BLOCK
      ?auto_679757 - BLOCK
      ?auto_679758 - BLOCK
      ?auto_679759 - BLOCK
    )
    :vars
    (
      ?auto_679760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679759 ?auto_679760 ) ( ON-TABLE ?auto_679743 ) ( ON ?auto_679744 ?auto_679743 ) ( not ( = ?auto_679743 ?auto_679744 ) ) ( not ( = ?auto_679743 ?auto_679745 ) ) ( not ( = ?auto_679743 ?auto_679746 ) ) ( not ( = ?auto_679743 ?auto_679747 ) ) ( not ( = ?auto_679743 ?auto_679748 ) ) ( not ( = ?auto_679743 ?auto_679749 ) ) ( not ( = ?auto_679743 ?auto_679750 ) ) ( not ( = ?auto_679743 ?auto_679751 ) ) ( not ( = ?auto_679743 ?auto_679752 ) ) ( not ( = ?auto_679743 ?auto_679753 ) ) ( not ( = ?auto_679743 ?auto_679754 ) ) ( not ( = ?auto_679743 ?auto_679755 ) ) ( not ( = ?auto_679743 ?auto_679756 ) ) ( not ( = ?auto_679743 ?auto_679757 ) ) ( not ( = ?auto_679743 ?auto_679758 ) ) ( not ( = ?auto_679743 ?auto_679759 ) ) ( not ( = ?auto_679743 ?auto_679760 ) ) ( not ( = ?auto_679744 ?auto_679745 ) ) ( not ( = ?auto_679744 ?auto_679746 ) ) ( not ( = ?auto_679744 ?auto_679747 ) ) ( not ( = ?auto_679744 ?auto_679748 ) ) ( not ( = ?auto_679744 ?auto_679749 ) ) ( not ( = ?auto_679744 ?auto_679750 ) ) ( not ( = ?auto_679744 ?auto_679751 ) ) ( not ( = ?auto_679744 ?auto_679752 ) ) ( not ( = ?auto_679744 ?auto_679753 ) ) ( not ( = ?auto_679744 ?auto_679754 ) ) ( not ( = ?auto_679744 ?auto_679755 ) ) ( not ( = ?auto_679744 ?auto_679756 ) ) ( not ( = ?auto_679744 ?auto_679757 ) ) ( not ( = ?auto_679744 ?auto_679758 ) ) ( not ( = ?auto_679744 ?auto_679759 ) ) ( not ( = ?auto_679744 ?auto_679760 ) ) ( not ( = ?auto_679745 ?auto_679746 ) ) ( not ( = ?auto_679745 ?auto_679747 ) ) ( not ( = ?auto_679745 ?auto_679748 ) ) ( not ( = ?auto_679745 ?auto_679749 ) ) ( not ( = ?auto_679745 ?auto_679750 ) ) ( not ( = ?auto_679745 ?auto_679751 ) ) ( not ( = ?auto_679745 ?auto_679752 ) ) ( not ( = ?auto_679745 ?auto_679753 ) ) ( not ( = ?auto_679745 ?auto_679754 ) ) ( not ( = ?auto_679745 ?auto_679755 ) ) ( not ( = ?auto_679745 ?auto_679756 ) ) ( not ( = ?auto_679745 ?auto_679757 ) ) ( not ( = ?auto_679745 ?auto_679758 ) ) ( not ( = ?auto_679745 ?auto_679759 ) ) ( not ( = ?auto_679745 ?auto_679760 ) ) ( not ( = ?auto_679746 ?auto_679747 ) ) ( not ( = ?auto_679746 ?auto_679748 ) ) ( not ( = ?auto_679746 ?auto_679749 ) ) ( not ( = ?auto_679746 ?auto_679750 ) ) ( not ( = ?auto_679746 ?auto_679751 ) ) ( not ( = ?auto_679746 ?auto_679752 ) ) ( not ( = ?auto_679746 ?auto_679753 ) ) ( not ( = ?auto_679746 ?auto_679754 ) ) ( not ( = ?auto_679746 ?auto_679755 ) ) ( not ( = ?auto_679746 ?auto_679756 ) ) ( not ( = ?auto_679746 ?auto_679757 ) ) ( not ( = ?auto_679746 ?auto_679758 ) ) ( not ( = ?auto_679746 ?auto_679759 ) ) ( not ( = ?auto_679746 ?auto_679760 ) ) ( not ( = ?auto_679747 ?auto_679748 ) ) ( not ( = ?auto_679747 ?auto_679749 ) ) ( not ( = ?auto_679747 ?auto_679750 ) ) ( not ( = ?auto_679747 ?auto_679751 ) ) ( not ( = ?auto_679747 ?auto_679752 ) ) ( not ( = ?auto_679747 ?auto_679753 ) ) ( not ( = ?auto_679747 ?auto_679754 ) ) ( not ( = ?auto_679747 ?auto_679755 ) ) ( not ( = ?auto_679747 ?auto_679756 ) ) ( not ( = ?auto_679747 ?auto_679757 ) ) ( not ( = ?auto_679747 ?auto_679758 ) ) ( not ( = ?auto_679747 ?auto_679759 ) ) ( not ( = ?auto_679747 ?auto_679760 ) ) ( not ( = ?auto_679748 ?auto_679749 ) ) ( not ( = ?auto_679748 ?auto_679750 ) ) ( not ( = ?auto_679748 ?auto_679751 ) ) ( not ( = ?auto_679748 ?auto_679752 ) ) ( not ( = ?auto_679748 ?auto_679753 ) ) ( not ( = ?auto_679748 ?auto_679754 ) ) ( not ( = ?auto_679748 ?auto_679755 ) ) ( not ( = ?auto_679748 ?auto_679756 ) ) ( not ( = ?auto_679748 ?auto_679757 ) ) ( not ( = ?auto_679748 ?auto_679758 ) ) ( not ( = ?auto_679748 ?auto_679759 ) ) ( not ( = ?auto_679748 ?auto_679760 ) ) ( not ( = ?auto_679749 ?auto_679750 ) ) ( not ( = ?auto_679749 ?auto_679751 ) ) ( not ( = ?auto_679749 ?auto_679752 ) ) ( not ( = ?auto_679749 ?auto_679753 ) ) ( not ( = ?auto_679749 ?auto_679754 ) ) ( not ( = ?auto_679749 ?auto_679755 ) ) ( not ( = ?auto_679749 ?auto_679756 ) ) ( not ( = ?auto_679749 ?auto_679757 ) ) ( not ( = ?auto_679749 ?auto_679758 ) ) ( not ( = ?auto_679749 ?auto_679759 ) ) ( not ( = ?auto_679749 ?auto_679760 ) ) ( not ( = ?auto_679750 ?auto_679751 ) ) ( not ( = ?auto_679750 ?auto_679752 ) ) ( not ( = ?auto_679750 ?auto_679753 ) ) ( not ( = ?auto_679750 ?auto_679754 ) ) ( not ( = ?auto_679750 ?auto_679755 ) ) ( not ( = ?auto_679750 ?auto_679756 ) ) ( not ( = ?auto_679750 ?auto_679757 ) ) ( not ( = ?auto_679750 ?auto_679758 ) ) ( not ( = ?auto_679750 ?auto_679759 ) ) ( not ( = ?auto_679750 ?auto_679760 ) ) ( not ( = ?auto_679751 ?auto_679752 ) ) ( not ( = ?auto_679751 ?auto_679753 ) ) ( not ( = ?auto_679751 ?auto_679754 ) ) ( not ( = ?auto_679751 ?auto_679755 ) ) ( not ( = ?auto_679751 ?auto_679756 ) ) ( not ( = ?auto_679751 ?auto_679757 ) ) ( not ( = ?auto_679751 ?auto_679758 ) ) ( not ( = ?auto_679751 ?auto_679759 ) ) ( not ( = ?auto_679751 ?auto_679760 ) ) ( not ( = ?auto_679752 ?auto_679753 ) ) ( not ( = ?auto_679752 ?auto_679754 ) ) ( not ( = ?auto_679752 ?auto_679755 ) ) ( not ( = ?auto_679752 ?auto_679756 ) ) ( not ( = ?auto_679752 ?auto_679757 ) ) ( not ( = ?auto_679752 ?auto_679758 ) ) ( not ( = ?auto_679752 ?auto_679759 ) ) ( not ( = ?auto_679752 ?auto_679760 ) ) ( not ( = ?auto_679753 ?auto_679754 ) ) ( not ( = ?auto_679753 ?auto_679755 ) ) ( not ( = ?auto_679753 ?auto_679756 ) ) ( not ( = ?auto_679753 ?auto_679757 ) ) ( not ( = ?auto_679753 ?auto_679758 ) ) ( not ( = ?auto_679753 ?auto_679759 ) ) ( not ( = ?auto_679753 ?auto_679760 ) ) ( not ( = ?auto_679754 ?auto_679755 ) ) ( not ( = ?auto_679754 ?auto_679756 ) ) ( not ( = ?auto_679754 ?auto_679757 ) ) ( not ( = ?auto_679754 ?auto_679758 ) ) ( not ( = ?auto_679754 ?auto_679759 ) ) ( not ( = ?auto_679754 ?auto_679760 ) ) ( not ( = ?auto_679755 ?auto_679756 ) ) ( not ( = ?auto_679755 ?auto_679757 ) ) ( not ( = ?auto_679755 ?auto_679758 ) ) ( not ( = ?auto_679755 ?auto_679759 ) ) ( not ( = ?auto_679755 ?auto_679760 ) ) ( not ( = ?auto_679756 ?auto_679757 ) ) ( not ( = ?auto_679756 ?auto_679758 ) ) ( not ( = ?auto_679756 ?auto_679759 ) ) ( not ( = ?auto_679756 ?auto_679760 ) ) ( not ( = ?auto_679757 ?auto_679758 ) ) ( not ( = ?auto_679757 ?auto_679759 ) ) ( not ( = ?auto_679757 ?auto_679760 ) ) ( not ( = ?auto_679758 ?auto_679759 ) ) ( not ( = ?auto_679758 ?auto_679760 ) ) ( not ( = ?auto_679759 ?auto_679760 ) ) ( ON ?auto_679758 ?auto_679759 ) ( ON ?auto_679757 ?auto_679758 ) ( ON ?auto_679756 ?auto_679757 ) ( ON ?auto_679755 ?auto_679756 ) ( ON ?auto_679754 ?auto_679755 ) ( ON ?auto_679753 ?auto_679754 ) ( ON ?auto_679752 ?auto_679753 ) ( ON ?auto_679751 ?auto_679752 ) ( ON ?auto_679750 ?auto_679751 ) ( ON ?auto_679749 ?auto_679750 ) ( ON ?auto_679748 ?auto_679749 ) ( ON ?auto_679747 ?auto_679748 ) ( ON ?auto_679746 ?auto_679747 ) ( CLEAR ?auto_679744 ) ( ON ?auto_679745 ?auto_679746 ) ( CLEAR ?auto_679745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_679743 ?auto_679744 ?auto_679745 )
      ( MAKE-17PILE ?auto_679743 ?auto_679744 ?auto_679745 ?auto_679746 ?auto_679747 ?auto_679748 ?auto_679749 ?auto_679750 ?auto_679751 ?auto_679752 ?auto_679753 ?auto_679754 ?auto_679755 ?auto_679756 ?auto_679757 ?auto_679758 ?auto_679759 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679778 - BLOCK
      ?auto_679779 - BLOCK
      ?auto_679780 - BLOCK
      ?auto_679781 - BLOCK
      ?auto_679782 - BLOCK
      ?auto_679783 - BLOCK
      ?auto_679784 - BLOCK
      ?auto_679785 - BLOCK
      ?auto_679786 - BLOCK
      ?auto_679787 - BLOCK
      ?auto_679788 - BLOCK
      ?auto_679789 - BLOCK
      ?auto_679790 - BLOCK
      ?auto_679791 - BLOCK
      ?auto_679792 - BLOCK
      ?auto_679793 - BLOCK
      ?auto_679794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679794 ) ( ON-TABLE ?auto_679778 ) ( ON ?auto_679779 ?auto_679778 ) ( not ( = ?auto_679778 ?auto_679779 ) ) ( not ( = ?auto_679778 ?auto_679780 ) ) ( not ( = ?auto_679778 ?auto_679781 ) ) ( not ( = ?auto_679778 ?auto_679782 ) ) ( not ( = ?auto_679778 ?auto_679783 ) ) ( not ( = ?auto_679778 ?auto_679784 ) ) ( not ( = ?auto_679778 ?auto_679785 ) ) ( not ( = ?auto_679778 ?auto_679786 ) ) ( not ( = ?auto_679778 ?auto_679787 ) ) ( not ( = ?auto_679778 ?auto_679788 ) ) ( not ( = ?auto_679778 ?auto_679789 ) ) ( not ( = ?auto_679778 ?auto_679790 ) ) ( not ( = ?auto_679778 ?auto_679791 ) ) ( not ( = ?auto_679778 ?auto_679792 ) ) ( not ( = ?auto_679778 ?auto_679793 ) ) ( not ( = ?auto_679778 ?auto_679794 ) ) ( not ( = ?auto_679779 ?auto_679780 ) ) ( not ( = ?auto_679779 ?auto_679781 ) ) ( not ( = ?auto_679779 ?auto_679782 ) ) ( not ( = ?auto_679779 ?auto_679783 ) ) ( not ( = ?auto_679779 ?auto_679784 ) ) ( not ( = ?auto_679779 ?auto_679785 ) ) ( not ( = ?auto_679779 ?auto_679786 ) ) ( not ( = ?auto_679779 ?auto_679787 ) ) ( not ( = ?auto_679779 ?auto_679788 ) ) ( not ( = ?auto_679779 ?auto_679789 ) ) ( not ( = ?auto_679779 ?auto_679790 ) ) ( not ( = ?auto_679779 ?auto_679791 ) ) ( not ( = ?auto_679779 ?auto_679792 ) ) ( not ( = ?auto_679779 ?auto_679793 ) ) ( not ( = ?auto_679779 ?auto_679794 ) ) ( not ( = ?auto_679780 ?auto_679781 ) ) ( not ( = ?auto_679780 ?auto_679782 ) ) ( not ( = ?auto_679780 ?auto_679783 ) ) ( not ( = ?auto_679780 ?auto_679784 ) ) ( not ( = ?auto_679780 ?auto_679785 ) ) ( not ( = ?auto_679780 ?auto_679786 ) ) ( not ( = ?auto_679780 ?auto_679787 ) ) ( not ( = ?auto_679780 ?auto_679788 ) ) ( not ( = ?auto_679780 ?auto_679789 ) ) ( not ( = ?auto_679780 ?auto_679790 ) ) ( not ( = ?auto_679780 ?auto_679791 ) ) ( not ( = ?auto_679780 ?auto_679792 ) ) ( not ( = ?auto_679780 ?auto_679793 ) ) ( not ( = ?auto_679780 ?auto_679794 ) ) ( not ( = ?auto_679781 ?auto_679782 ) ) ( not ( = ?auto_679781 ?auto_679783 ) ) ( not ( = ?auto_679781 ?auto_679784 ) ) ( not ( = ?auto_679781 ?auto_679785 ) ) ( not ( = ?auto_679781 ?auto_679786 ) ) ( not ( = ?auto_679781 ?auto_679787 ) ) ( not ( = ?auto_679781 ?auto_679788 ) ) ( not ( = ?auto_679781 ?auto_679789 ) ) ( not ( = ?auto_679781 ?auto_679790 ) ) ( not ( = ?auto_679781 ?auto_679791 ) ) ( not ( = ?auto_679781 ?auto_679792 ) ) ( not ( = ?auto_679781 ?auto_679793 ) ) ( not ( = ?auto_679781 ?auto_679794 ) ) ( not ( = ?auto_679782 ?auto_679783 ) ) ( not ( = ?auto_679782 ?auto_679784 ) ) ( not ( = ?auto_679782 ?auto_679785 ) ) ( not ( = ?auto_679782 ?auto_679786 ) ) ( not ( = ?auto_679782 ?auto_679787 ) ) ( not ( = ?auto_679782 ?auto_679788 ) ) ( not ( = ?auto_679782 ?auto_679789 ) ) ( not ( = ?auto_679782 ?auto_679790 ) ) ( not ( = ?auto_679782 ?auto_679791 ) ) ( not ( = ?auto_679782 ?auto_679792 ) ) ( not ( = ?auto_679782 ?auto_679793 ) ) ( not ( = ?auto_679782 ?auto_679794 ) ) ( not ( = ?auto_679783 ?auto_679784 ) ) ( not ( = ?auto_679783 ?auto_679785 ) ) ( not ( = ?auto_679783 ?auto_679786 ) ) ( not ( = ?auto_679783 ?auto_679787 ) ) ( not ( = ?auto_679783 ?auto_679788 ) ) ( not ( = ?auto_679783 ?auto_679789 ) ) ( not ( = ?auto_679783 ?auto_679790 ) ) ( not ( = ?auto_679783 ?auto_679791 ) ) ( not ( = ?auto_679783 ?auto_679792 ) ) ( not ( = ?auto_679783 ?auto_679793 ) ) ( not ( = ?auto_679783 ?auto_679794 ) ) ( not ( = ?auto_679784 ?auto_679785 ) ) ( not ( = ?auto_679784 ?auto_679786 ) ) ( not ( = ?auto_679784 ?auto_679787 ) ) ( not ( = ?auto_679784 ?auto_679788 ) ) ( not ( = ?auto_679784 ?auto_679789 ) ) ( not ( = ?auto_679784 ?auto_679790 ) ) ( not ( = ?auto_679784 ?auto_679791 ) ) ( not ( = ?auto_679784 ?auto_679792 ) ) ( not ( = ?auto_679784 ?auto_679793 ) ) ( not ( = ?auto_679784 ?auto_679794 ) ) ( not ( = ?auto_679785 ?auto_679786 ) ) ( not ( = ?auto_679785 ?auto_679787 ) ) ( not ( = ?auto_679785 ?auto_679788 ) ) ( not ( = ?auto_679785 ?auto_679789 ) ) ( not ( = ?auto_679785 ?auto_679790 ) ) ( not ( = ?auto_679785 ?auto_679791 ) ) ( not ( = ?auto_679785 ?auto_679792 ) ) ( not ( = ?auto_679785 ?auto_679793 ) ) ( not ( = ?auto_679785 ?auto_679794 ) ) ( not ( = ?auto_679786 ?auto_679787 ) ) ( not ( = ?auto_679786 ?auto_679788 ) ) ( not ( = ?auto_679786 ?auto_679789 ) ) ( not ( = ?auto_679786 ?auto_679790 ) ) ( not ( = ?auto_679786 ?auto_679791 ) ) ( not ( = ?auto_679786 ?auto_679792 ) ) ( not ( = ?auto_679786 ?auto_679793 ) ) ( not ( = ?auto_679786 ?auto_679794 ) ) ( not ( = ?auto_679787 ?auto_679788 ) ) ( not ( = ?auto_679787 ?auto_679789 ) ) ( not ( = ?auto_679787 ?auto_679790 ) ) ( not ( = ?auto_679787 ?auto_679791 ) ) ( not ( = ?auto_679787 ?auto_679792 ) ) ( not ( = ?auto_679787 ?auto_679793 ) ) ( not ( = ?auto_679787 ?auto_679794 ) ) ( not ( = ?auto_679788 ?auto_679789 ) ) ( not ( = ?auto_679788 ?auto_679790 ) ) ( not ( = ?auto_679788 ?auto_679791 ) ) ( not ( = ?auto_679788 ?auto_679792 ) ) ( not ( = ?auto_679788 ?auto_679793 ) ) ( not ( = ?auto_679788 ?auto_679794 ) ) ( not ( = ?auto_679789 ?auto_679790 ) ) ( not ( = ?auto_679789 ?auto_679791 ) ) ( not ( = ?auto_679789 ?auto_679792 ) ) ( not ( = ?auto_679789 ?auto_679793 ) ) ( not ( = ?auto_679789 ?auto_679794 ) ) ( not ( = ?auto_679790 ?auto_679791 ) ) ( not ( = ?auto_679790 ?auto_679792 ) ) ( not ( = ?auto_679790 ?auto_679793 ) ) ( not ( = ?auto_679790 ?auto_679794 ) ) ( not ( = ?auto_679791 ?auto_679792 ) ) ( not ( = ?auto_679791 ?auto_679793 ) ) ( not ( = ?auto_679791 ?auto_679794 ) ) ( not ( = ?auto_679792 ?auto_679793 ) ) ( not ( = ?auto_679792 ?auto_679794 ) ) ( not ( = ?auto_679793 ?auto_679794 ) ) ( ON ?auto_679793 ?auto_679794 ) ( ON ?auto_679792 ?auto_679793 ) ( ON ?auto_679791 ?auto_679792 ) ( ON ?auto_679790 ?auto_679791 ) ( ON ?auto_679789 ?auto_679790 ) ( ON ?auto_679788 ?auto_679789 ) ( ON ?auto_679787 ?auto_679788 ) ( ON ?auto_679786 ?auto_679787 ) ( ON ?auto_679785 ?auto_679786 ) ( ON ?auto_679784 ?auto_679785 ) ( ON ?auto_679783 ?auto_679784 ) ( ON ?auto_679782 ?auto_679783 ) ( ON ?auto_679781 ?auto_679782 ) ( CLEAR ?auto_679779 ) ( ON ?auto_679780 ?auto_679781 ) ( CLEAR ?auto_679780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_679778 ?auto_679779 ?auto_679780 )
      ( MAKE-17PILE ?auto_679778 ?auto_679779 ?auto_679780 ?auto_679781 ?auto_679782 ?auto_679783 ?auto_679784 ?auto_679785 ?auto_679786 ?auto_679787 ?auto_679788 ?auto_679789 ?auto_679790 ?auto_679791 ?auto_679792 ?auto_679793 ?auto_679794 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679812 - BLOCK
      ?auto_679813 - BLOCK
      ?auto_679814 - BLOCK
      ?auto_679815 - BLOCK
      ?auto_679816 - BLOCK
      ?auto_679817 - BLOCK
      ?auto_679818 - BLOCK
      ?auto_679819 - BLOCK
      ?auto_679820 - BLOCK
      ?auto_679821 - BLOCK
      ?auto_679822 - BLOCK
      ?auto_679823 - BLOCK
      ?auto_679824 - BLOCK
      ?auto_679825 - BLOCK
      ?auto_679826 - BLOCK
      ?auto_679827 - BLOCK
      ?auto_679828 - BLOCK
    )
    :vars
    (
      ?auto_679829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679828 ?auto_679829 ) ( ON-TABLE ?auto_679812 ) ( not ( = ?auto_679812 ?auto_679813 ) ) ( not ( = ?auto_679812 ?auto_679814 ) ) ( not ( = ?auto_679812 ?auto_679815 ) ) ( not ( = ?auto_679812 ?auto_679816 ) ) ( not ( = ?auto_679812 ?auto_679817 ) ) ( not ( = ?auto_679812 ?auto_679818 ) ) ( not ( = ?auto_679812 ?auto_679819 ) ) ( not ( = ?auto_679812 ?auto_679820 ) ) ( not ( = ?auto_679812 ?auto_679821 ) ) ( not ( = ?auto_679812 ?auto_679822 ) ) ( not ( = ?auto_679812 ?auto_679823 ) ) ( not ( = ?auto_679812 ?auto_679824 ) ) ( not ( = ?auto_679812 ?auto_679825 ) ) ( not ( = ?auto_679812 ?auto_679826 ) ) ( not ( = ?auto_679812 ?auto_679827 ) ) ( not ( = ?auto_679812 ?auto_679828 ) ) ( not ( = ?auto_679812 ?auto_679829 ) ) ( not ( = ?auto_679813 ?auto_679814 ) ) ( not ( = ?auto_679813 ?auto_679815 ) ) ( not ( = ?auto_679813 ?auto_679816 ) ) ( not ( = ?auto_679813 ?auto_679817 ) ) ( not ( = ?auto_679813 ?auto_679818 ) ) ( not ( = ?auto_679813 ?auto_679819 ) ) ( not ( = ?auto_679813 ?auto_679820 ) ) ( not ( = ?auto_679813 ?auto_679821 ) ) ( not ( = ?auto_679813 ?auto_679822 ) ) ( not ( = ?auto_679813 ?auto_679823 ) ) ( not ( = ?auto_679813 ?auto_679824 ) ) ( not ( = ?auto_679813 ?auto_679825 ) ) ( not ( = ?auto_679813 ?auto_679826 ) ) ( not ( = ?auto_679813 ?auto_679827 ) ) ( not ( = ?auto_679813 ?auto_679828 ) ) ( not ( = ?auto_679813 ?auto_679829 ) ) ( not ( = ?auto_679814 ?auto_679815 ) ) ( not ( = ?auto_679814 ?auto_679816 ) ) ( not ( = ?auto_679814 ?auto_679817 ) ) ( not ( = ?auto_679814 ?auto_679818 ) ) ( not ( = ?auto_679814 ?auto_679819 ) ) ( not ( = ?auto_679814 ?auto_679820 ) ) ( not ( = ?auto_679814 ?auto_679821 ) ) ( not ( = ?auto_679814 ?auto_679822 ) ) ( not ( = ?auto_679814 ?auto_679823 ) ) ( not ( = ?auto_679814 ?auto_679824 ) ) ( not ( = ?auto_679814 ?auto_679825 ) ) ( not ( = ?auto_679814 ?auto_679826 ) ) ( not ( = ?auto_679814 ?auto_679827 ) ) ( not ( = ?auto_679814 ?auto_679828 ) ) ( not ( = ?auto_679814 ?auto_679829 ) ) ( not ( = ?auto_679815 ?auto_679816 ) ) ( not ( = ?auto_679815 ?auto_679817 ) ) ( not ( = ?auto_679815 ?auto_679818 ) ) ( not ( = ?auto_679815 ?auto_679819 ) ) ( not ( = ?auto_679815 ?auto_679820 ) ) ( not ( = ?auto_679815 ?auto_679821 ) ) ( not ( = ?auto_679815 ?auto_679822 ) ) ( not ( = ?auto_679815 ?auto_679823 ) ) ( not ( = ?auto_679815 ?auto_679824 ) ) ( not ( = ?auto_679815 ?auto_679825 ) ) ( not ( = ?auto_679815 ?auto_679826 ) ) ( not ( = ?auto_679815 ?auto_679827 ) ) ( not ( = ?auto_679815 ?auto_679828 ) ) ( not ( = ?auto_679815 ?auto_679829 ) ) ( not ( = ?auto_679816 ?auto_679817 ) ) ( not ( = ?auto_679816 ?auto_679818 ) ) ( not ( = ?auto_679816 ?auto_679819 ) ) ( not ( = ?auto_679816 ?auto_679820 ) ) ( not ( = ?auto_679816 ?auto_679821 ) ) ( not ( = ?auto_679816 ?auto_679822 ) ) ( not ( = ?auto_679816 ?auto_679823 ) ) ( not ( = ?auto_679816 ?auto_679824 ) ) ( not ( = ?auto_679816 ?auto_679825 ) ) ( not ( = ?auto_679816 ?auto_679826 ) ) ( not ( = ?auto_679816 ?auto_679827 ) ) ( not ( = ?auto_679816 ?auto_679828 ) ) ( not ( = ?auto_679816 ?auto_679829 ) ) ( not ( = ?auto_679817 ?auto_679818 ) ) ( not ( = ?auto_679817 ?auto_679819 ) ) ( not ( = ?auto_679817 ?auto_679820 ) ) ( not ( = ?auto_679817 ?auto_679821 ) ) ( not ( = ?auto_679817 ?auto_679822 ) ) ( not ( = ?auto_679817 ?auto_679823 ) ) ( not ( = ?auto_679817 ?auto_679824 ) ) ( not ( = ?auto_679817 ?auto_679825 ) ) ( not ( = ?auto_679817 ?auto_679826 ) ) ( not ( = ?auto_679817 ?auto_679827 ) ) ( not ( = ?auto_679817 ?auto_679828 ) ) ( not ( = ?auto_679817 ?auto_679829 ) ) ( not ( = ?auto_679818 ?auto_679819 ) ) ( not ( = ?auto_679818 ?auto_679820 ) ) ( not ( = ?auto_679818 ?auto_679821 ) ) ( not ( = ?auto_679818 ?auto_679822 ) ) ( not ( = ?auto_679818 ?auto_679823 ) ) ( not ( = ?auto_679818 ?auto_679824 ) ) ( not ( = ?auto_679818 ?auto_679825 ) ) ( not ( = ?auto_679818 ?auto_679826 ) ) ( not ( = ?auto_679818 ?auto_679827 ) ) ( not ( = ?auto_679818 ?auto_679828 ) ) ( not ( = ?auto_679818 ?auto_679829 ) ) ( not ( = ?auto_679819 ?auto_679820 ) ) ( not ( = ?auto_679819 ?auto_679821 ) ) ( not ( = ?auto_679819 ?auto_679822 ) ) ( not ( = ?auto_679819 ?auto_679823 ) ) ( not ( = ?auto_679819 ?auto_679824 ) ) ( not ( = ?auto_679819 ?auto_679825 ) ) ( not ( = ?auto_679819 ?auto_679826 ) ) ( not ( = ?auto_679819 ?auto_679827 ) ) ( not ( = ?auto_679819 ?auto_679828 ) ) ( not ( = ?auto_679819 ?auto_679829 ) ) ( not ( = ?auto_679820 ?auto_679821 ) ) ( not ( = ?auto_679820 ?auto_679822 ) ) ( not ( = ?auto_679820 ?auto_679823 ) ) ( not ( = ?auto_679820 ?auto_679824 ) ) ( not ( = ?auto_679820 ?auto_679825 ) ) ( not ( = ?auto_679820 ?auto_679826 ) ) ( not ( = ?auto_679820 ?auto_679827 ) ) ( not ( = ?auto_679820 ?auto_679828 ) ) ( not ( = ?auto_679820 ?auto_679829 ) ) ( not ( = ?auto_679821 ?auto_679822 ) ) ( not ( = ?auto_679821 ?auto_679823 ) ) ( not ( = ?auto_679821 ?auto_679824 ) ) ( not ( = ?auto_679821 ?auto_679825 ) ) ( not ( = ?auto_679821 ?auto_679826 ) ) ( not ( = ?auto_679821 ?auto_679827 ) ) ( not ( = ?auto_679821 ?auto_679828 ) ) ( not ( = ?auto_679821 ?auto_679829 ) ) ( not ( = ?auto_679822 ?auto_679823 ) ) ( not ( = ?auto_679822 ?auto_679824 ) ) ( not ( = ?auto_679822 ?auto_679825 ) ) ( not ( = ?auto_679822 ?auto_679826 ) ) ( not ( = ?auto_679822 ?auto_679827 ) ) ( not ( = ?auto_679822 ?auto_679828 ) ) ( not ( = ?auto_679822 ?auto_679829 ) ) ( not ( = ?auto_679823 ?auto_679824 ) ) ( not ( = ?auto_679823 ?auto_679825 ) ) ( not ( = ?auto_679823 ?auto_679826 ) ) ( not ( = ?auto_679823 ?auto_679827 ) ) ( not ( = ?auto_679823 ?auto_679828 ) ) ( not ( = ?auto_679823 ?auto_679829 ) ) ( not ( = ?auto_679824 ?auto_679825 ) ) ( not ( = ?auto_679824 ?auto_679826 ) ) ( not ( = ?auto_679824 ?auto_679827 ) ) ( not ( = ?auto_679824 ?auto_679828 ) ) ( not ( = ?auto_679824 ?auto_679829 ) ) ( not ( = ?auto_679825 ?auto_679826 ) ) ( not ( = ?auto_679825 ?auto_679827 ) ) ( not ( = ?auto_679825 ?auto_679828 ) ) ( not ( = ?auto_679825 ?auto_679829 ) ) ( not ( = ?auto_679826 ?auto_679827 ) ) ( not ( = ?auto_679826 ?auto_679828 ) ) ( not ( = ?auto_679826 ?auto_679829 ) ) ( not ( = ?auto_679827 ?auto_679828 ) ) ( not ( = ?auto_679827 ?auto_679829 ) ) ( not ( = ?auto_679828 ?auto_679829 ) ) ( ON ?auto_679827 ?auto_679828 ) ( ON ?auto_679826 ?auto_679827 ) ( ON ?auto_679825 ?auto_679826 ) ( ON ?auto_679824 ?auto_679825 ) ( ON ?auto_679823 ?auto_679824 ) ( ON ?auto_679822 ?auto_679823 ) ( ON ?auto_679821 ?auto_679822 ) ( ON ?auto_679820 ?auto_679821 ) ( ON ?auto_679819 ?auto_679820 ) ( ON ?auto_679818 ?auto_679819 ) ( ON ?auto_679817 ?auto_679818 ) ( ON ?auto_679816 ?auto_679817 ) ( ON ?auto_679815 ?auto_679816 ) ( ON ?auto_679814 ?auto_679815 ) ( CLEAR ?auto_679812 ) ( ON ?auto_679813 ?auto_679814 ) ( CLEAR ?auto_679813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_679812 ?auto_679813 )
      ( MAKE-17PILE ?auto_679812 ?auto_679813 ?auto_679814 ?auto_679815 ?auto_679816 ?auto_679817 ?auto_679818 ?auto_679819 ?auto_679820 ?auto_679821 ?auto_679822 ?auto_679823 ?auto_679824 ?auto_679825 ?auto_679826 ?auto_679827 ?auto_679828 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679847 - BLOCK
      ?auto_679848 - BLOCK
      ?auto_679849 - BLOCK
      ?auto_679850 - BLOCK
      ?auto_679851 - BLOCK
      ?auto_679852 - BLOCK
      ?auto_679853 - BLOCK
      ?auto_679854 - BLOCK
      ?auto_679855 - BLOCK
      ?auto_679856 - BLOCK
      ?auto_679857 - BLOCK
      ?auto_679858 - BLOCK
      ?auto_679859 - BLOCK
      ?auto_679860 - BLOCK
      ?auto_679861 - BLOCK
      ?auto_679862 - BLOCK
      ?auto_679863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679863 ) ( ON-TABLE ?auto_679847 ) ( not ( = ?auto_679847 ?auto_679848 ) ) ( not ( = ?auto_679847 ?auto_679849 ) ) ( not ( = ?auto_679847 ?auto_679850 ) ) ( not ( = ?auto_679847 ?auto_679851 ) ) ( not ( = ?auto_679847 ?auto_679852 ) ) ( not ( = ?auto_679847 ?auto_679853 ) ) ( not ( = ?auto_679847 ?auto_679854 ) ) ( not ( = ?auto_679847 ?auto_679855 ) ) ( not ( = ?auto_679847 ?auto_679856 ) ) ( not ( = ?auto_679847 ?auto_679857 ) ) ( not ( = ?auto_679847 ?auto_679858 ) ) ( not ( = ?auto_679847 ?auto_679859 ) ) ( not ( = ?auto_679847 ?auto_679860 ) ) ( not ( = ?auto_679847 ?auto_679861 ) ) ( not ( = ?auto_679847 ?auto_679862 ) ) ( not ( = ?auto_679847 ?auto_679863 ) ) ( not ( = ?auto_679848 ?auto_679849 ) ) ( not ( = ?auto_679848 ?auto_679850 ) ) ( not ( = ?auto_679848 ?auto_679851 ) ) ( not ( = ?auto_679848 ?auto_679852 ) ) ( not ( = ?auto_679848 ?auto_679853 ) ) ( not ( = ?auto_679848 ?auto_679854 ) ) ( not ( = ?auto_679848 ?auto_679855 ) ) ( not ( = ?auto_679848 ?auto_679856 ) ) ( not ( = ?auto_679848 ?auto_679857 ) ) ( not ( = ?auto_679848 ?auto_679858 ) ) ( not ( = ?auto_679848 ?auto_679859 ) ) ( not ( = ?auto_679848 ?auto_679860 ) ) ( not ( = ?auto_679848 ?auto_679861 ) ) ( not ( = ?auto_679848 ?auto_679862 ) ) ( not ( = ?auto_679848 ?auto_679863 ) ) ( not ( = ?auto_679849 ?auto_679850 ) ) ( not ( = ?auto_679849 ?auto_679851 ) ) ( not ( = ?auto_679849 ?auto_679852 ) ) ( not ( = ?auto_679849 ?auto_679853 ) ) ( not ( = ?auto_679849 ?auto_679854 ) ) ( not ( = ?auto_679849 ?auto_679855 ) ) ( not ( = ?auto_679849 ?auto_679856 ) ) ( not ( = ?auto_679849 ?auto_679857 ) ) ( not ( = ?auto_679849 ?auto_679858 ) ) ( not ( = ?auto_679849 ?auto_679859 ) ) ( not ( = ?auto_679849 ?auto_679860 ) ) ( not ( = ?auto_679849 ?auto_679861 ) ) ( not ( = ?auto_679849 ?auto_679862 ) ) ( not ( = ?auto_679849 ?auto_679863 ) ) ( not ( = ?auto_679850 ?auto_679851 ) ) ( not ( = ?auto_679850 ?auto_679852 ) ) ( not ( = ?auto_679850 ?auto_679853 ) ) ( not ( = ?auto_679850 ?auto_679854 ) ) ( not ( = ?auto_679850 ?auto_679855 ) ) ( not ( = ?auto_679850 ?auto_679856 ) ) ( not ( = ?auto_679850 ?auto_679857 ) ) ( not ( = ?auto_679850 ?auto_679858 ) ) ( not ( = ?auto_679850 ?auto_679859 ) ) ( not ( = ?auto_679850 ?auto_679860 ) ) ( not ( = ?auto_679850 ?auto_679861 ) ) ( not ( = ?auto_679850 ?auto_679862 ) ) ( not ( = ?auto_679850 ?auto_679863 ) ) ( not ( = ?auto_679851 ?auto_679852 ) ) ( not ( = ?auto_679851 ?auto_679853 ) ) ( not ( = ?auto_679851 ?auto_679854 ) ) ( not ( = ?auto_679851 ?auto_679855 ) ) ( not ( = ?auto_679851 ?auto_679856 ) ) ( not ( = ?auto_679851 ?auto_679857 ) ) ( not ( = ?auto_679851 ?auto_679858 ) ) ( not ( = ?auto_679851 ?auto_679859 ) ) ( not ( = ?auto_679851 ?auto_679860 ) ) ( not ( = ?auto_679851 ?auto_679861 ) ) ( not ( = ?auto_679851 ?auto_679862 ) ) ( not ( = ?auto_679851 ?auto_679863 ) ) ( not ( = ?auto_679852 ?auto_679853 ) ) ( not ( = ?auto_679852 ?auto_679854 ) ) ( not ( = ?auto_679852 ?auto_679855 ) ) ( not ( = ?auto_679852 ?auto_679856 ) ) ( not ( = ?auto_679852 ?auto_679857 ) ) ( not ( = ?auto_679852 ?auto_679858 ) ) ( not ( = ?auto_679852 ?auto_679859 ) ) ( not ( = ?auto_679852 ?auto_679860 ) ) ( not ( = ?auto_679852 ?auto_679861 ) ) ( not ( = ?auto_679852 ?auto_679862 ) ) ( not ( = ?auto_679852 ?auto_679863 ) ) ( not ( = ?auto_679853 ?auto_679854 ) ) ( not ( = ?auto_679853 ?auto_679855 ) ) ( not ( = ?auto_679853 ?auto_679856 ) ) ( not ( = ?auto_679853 ?auto_679857 ) ) ( not ( = ?auto_679853 ?auto_679858 ) ) ( not ( = ?auto_679853 ?auto_679859 ) ) ( not ( = ?auto_679853 ?auto_679860 ) ) ( not ( = ?auto_679853 ?auto_679861 ) ) ( not ( = ?auto_679853 ?auto_679862 ) ) ( not ( = ?auto_679853 ?auto_679863 ) ) ( not ( = ?auto_679854 ?auto_679855 ) ) ( not ( = ?auto_679854 ?auto_679856 ) ) ( not ( = ?auto_679854 ?auto_679857 ) ) ( not ( = ?auto_679854 ?auto_679858 ) ) ( not ( = ?auto_679854 ?auto_679859 ) ) ( not ( = ?auto_679854 ?auto_679860 ) ) ( not ( = ?auto_679854 ?auto_679861 ) ) ( not ( = ?auto_679854 ?auto_679862 ) ) ( not ( = ?auto_679854 ?auto_679863 ) ) ( not ( = ?auto_679855 ?auto_679856 ) ) ( not ( = ?auto_679855 ?auto_679857 ) ) ( not ( = ?auto_679855 ?auto_679858 ) ) ( not ( = ?auto_679855 ?auto_679859 ) ) ( not ( = ?auto_679855 ?auto_679860 ) ) ( not ( = ?auto_679855 ?auto_679861 ) ) ( not ( = ?auto_679855 ?auto_679862 ) ) ( not ( = ?auto_679855 ?auto_679863 ) ) ( not ( = ?auto_679856 ?auto_679857 ) ) ( not ( = ?auto_679856 ?auto_679858 ) ) ( not ( = ?auto_679856 ?auto_679859 ) ) ( not ( = ?auto_679856 ?auto_679860 ) ) ( not ( = ?auto_679856 ?auto_679861 ) ) ( not ( = ?auto_679856 ?auto_679862 ) ) ( not ( = ?auto_679856 ?auto_679863 ) ) ( not ( = ?auto_679857 ?auto_679858 ) ) ( not ( = ?auto_679857 ?auto_679859 ) ) ( not ( = ?auto_679857 ?auto_679860 ) ) ( not ( = ?auto_679857 ?auto_679861 ) ) ( not ( = ?auto_679857 ?auto_679862 ) ) ( not ( = ?auto_679857 ?auto_679863 ) ) ( not ( = ?auto_679858 ?auto_679859 ) ) ( not ( = ?auto_679858 ?auto_679860 ) ) ( not ( = ?auto_679858 ?auto_679861 ) ) ( not ( = ?auto_679858 ?auto_679862 ) ) ( not ( = ?auto_679858 ?auto_679863 ) ) ( not ( = ?auto_679859 ?auto_679860 ) ) ( not ( = ?auto_679859 ?auto_679861 ) ) ( not ( = ?auto_679859 ?auto_679862 ) ) ( not ( = ?auto_679859 ?auto_679863 ) ) ( not ( = ?auto_679860 ?auto_679861 ) ) ( not ( = ?auto_679860 ?auto_679862 ) ) ( not ( = ?auto_679860 ?auto_679863 ) ) ( not ( = ?auto_679861 ?auto_679862 ) ) ( not ( = ?auto_679861 ?auto_679863 ) ) ( not ( = ?auto_679862 ?auto_679863 ) ) ( ON ?auto_679862 ?auto_679863 ) ( ON ?auto_679861 ?auto_679862 ) ( ON ?auto_679860 ?auto_679861 ) ( ON ?auto_679859 ?auto_679860 ) ( ON ?auto_679858 ?auto_679859 ) ( ON ?auto_679857 ?auto_679858 ) ( ON ?auto_679856 ?auto_679857 ) ( ON ?auto_679855 ?auto_679856 ) ( ON ?auto_679854 ?auto_679855 ) ( ON ?auto_679853 ?auto_679854 ) ( ON ?auto_679852 ?auto_679853 ) ( ON ?auto_679851 ?auto_679852 ) ( ON ?auto_679850 ?auto_679851 ) ( ON ?auto_679849 ?auto_679850 ) ( CLEAR ?auto_679847 ) ( ON ?auto_679848 ?auto_679849 ) ( CLEAR ?auto_679848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_679847 ?auto_679848 )
      ( MAKE-17PILE ?auto_679847 ?auto_679848 ?auto_679849 ?auto_679850 ?auto_679851 ?auto_679852 ?auto_679853 ?auto_679854 ?auto_679855 ?auto_679856 ?auto_679857 ?auto_679858 ?auto_679859 ?auto_679860 ?auto_679861 ?auto_679862 ?auto_679863 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679881 - BLOCK
      ?auto_679882 - BLOCK
      ?auto_679883 - BLOCK
      ?auto_679884 - BLOCK
      ?auto_679885 - BLOCK
      ?auto_679886 - BLOCK
      ?auto_679887 - BLOCK
      ?auto_679888 - BLOCK
      ?auto_679889 - BLOCK
      ?auto_679890 - BLOCK
      ?auto_679891 - BLOCK
      ?auto_679892 - BLOCK
      ?auto_679893 - BLOCK
      ?auto_679894 - BLOCK
      ?auto_679895 - BLOCK
      ?auto_679896 - BLOCK
      ?auto_679897 - BLOCK
    )
    :vars
    (
      ?auto_679898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679897 ?auto_679898 ) ( not ( = ?auto_679881 ?auto_679882 ) ) ( not ( = ?auto_679881 ?auto_679883 ) ) ( not ( = ?auto_679881 ?auto_679884 ) ) ( not ( = ?auto_679881 ?auto_679885 ) ) ( not ( = ?auto_679881 ?auto_679886 ) ) ( not ( = ?auto_679881 ?auto_679887 ) ) ( not ( = ?auto_679881 ?auto_679888 ) ) ( not ( = ?auto_679881 ?auto_679889 ) ) ( not ( = ?auto_679881 ?auto_679890 ) ) ( not ( = ?auto_679881 ?auto_679891 ) ) ( not ( = ?auto_679881 ?auto_679892 ) ) ( not ( = ?auto_679881 ?auto_679893 ) ) ( not ( = ?auto_679881 ?auto_679894 ) ) ( not ( = ?auto_679881 ?auto_679895 ) ) ( not ( = ?auto_679881 ?auto_679896 ) ) ( not ( = ?auto_679881 ?auto_679897 ) ) ( not ( = ?auto_679881 ?auto_679898 ) ) ( not ( = ?auto_679882 ?auto_679883 ) ) ( not ( = ?auto_679882 ?auto_679884 ) ) ( not ( = ?auto_679882 ?auto_679885 ) ) ( not ( = ?auto_679882 ?auto_679886 ) ) ( not ( = ?auto_679882 ?auto_679887 ) ) ( not ( = ?auto_679882 ?auto_679888 ) ) ( not ( = ?auto_679882 ?auto_679889 ) ) ( not ( = ?auto_679882 ?auto_679890 ) ) ( not ( = ?auto_679882 ?auto_679891 ) ) ( not ( = ?auto_679882 ?auto_679892 ) ) ( not ( = ?auto_679882 ?auto_679893 ) ) ( not ( = ?auto_679882 ?auto_679894 ) ) ( not ( = ?auto_679882 ?auto_679895 ) ) ( not ( = ?auto_679882 ?auto_679896 ) ) ( not ( = ?auto_679882 ?auto_679897 ) ) ( not ( = ?auto_679882 ?auto_679898 ) ) ( not ( = ?auto_679883 ?auto_679884 ) ) ( not ( = ?auto_679883 ?auto_679885 ) ) ( not ( = ?auto_679883 ?auto_679886 ) ) ( not ( = ?auto_679883 ?auto_679887 ) ) ( not ( = ?auto_679883 ?auto_679888 ) ) ( not ( = ?auto_679883 ?auto_679889 ) ) ( not ( = ?auto_679883 ?auto_679890 ) ) ( not ( = ?auto_679883 ?auto_679891 ) ) ( not ( = ?auto_679883 ?auto_679892 ) ) ( not ( = ?auto_679883 ?auto_679893 ) ) ( not ( = ?auto_679883 ?auto_679894 ) ) ( not ( = ?auto_679883 ?auto_679895 ) ) ( not ( = ?auto_679883 ?auto_679896 ) ) ( not ( = ?auto_679883 ?auto_679897 ) ) ( not ( = ?auto_679883 ?auto_679898 ) ) ( not ( = ?auto_679884 ?auto_679885 ) ) ( not ( = ?auto_679884 ?auto_679886 ) ) ( not ( = ?auto_679884 ?auto_679887 ) ) ( not ( = ?auto_679884 ?auto_679888 ) ) ( not ( = ?auto_679884 ?auto_679889 ) ) ( not ( = ?auto_679884 ?auto_679890 ) ) ( not ( = ?auto_679884 ?auto_679891 ) ) ( not ( = ?auto_679884 ?auto_679892 ) ) ( not ( = ?auto_679884 ?auto_679893 ) ) ( not ( = ?auto_679884 ?auto_679894 ) ) ( not ( = ?auto_679884 ?auto_679895 ) ) ( not ( = ?auto_679884 ?auto_679896 ) ) ( not ( = ?auto_679884 ?auto_679897 ) ) ( not ( = ?auto_679884 ?auto_679898 ) ) ( not ( = ?auto_679885 ?auto_679886 ) ) ( not ( = ?auto_679885 ?auto_679887 ) ) ( not ( = ?auto_679885 ?auto_679888 ) ) ( not ( = ?auto_679885 ?auto_679889 ) ) ( not ( = ?auto_679885 ?auto_679890 ) ) ( not ( = ?auto_679885 ?auto_679891 ) ) ( not ( = ?auto_679885 ?auto_679892 ) ) ( not ( = ?auto_679885 ?auto_679893 ) ) ( not ( = ?auto_679885 ?auto_679894 ) ) ( not ( = ?auto_679885 ?auto_679895 ) ) ( not ( = ?auto_679885 ?auto_679896 ) ) ( not ( = ?auto_679885 ?auto_679897 ) ) ( not ( = ?auto_679885 ?auto_679898 ) ) ( not ( = ?auto_679886 ?auto_679887 ) ) ( not ( = ?auto_679886 ?auto_679888 ) ) ( not ( = ?auto_679886 ?auto_679889 ) ) ( not ( = ?auto_679886 ?auto_679890 ) ) ( not ( = ?auto_679886 ?auto_679891 ) ) ( not ( = ?auto_679886 ?auto_679892 ) ) ( not ( = ?auto_679886 ?auto_679893 ) ) ( not ( = ?auto_679886 ?auto_679894 ) ) ( not ( = ?auto_679886 ?auto_679895 ) ) ( not ( = ?auto_679886 ?auto_679896 ) ) ( not ( = ?auto_679886 ?auto_679897 ) ) ( not ( = ?auto_679886 ?auto_679898 ) ) ( not ( = ?auto_679887 ?auto_679888 ) ) ( not ( = ?auto_679887 ?auto_679889 ) ) ( not ( = ?auto_679887 ?auto_679890 ) ) ( not ( = ?auto_679887 ?auto_679891 ) ) ( not ( = ?auto_679887 ?auto_679892 ) ) ( not ( = ?auto_679887 ?auto_679893 ) ) ( not ( = ?auto_679887 ?auto_679894 ) ) ( not ( = ?auto_679887 ?auto_679895 ) ) ( not ( = ?auto_679887 ?auto_679896 ) ) ( not ( = ?auto_679887 ?auto_679897 ) ) ( not ( = ?auto_679887 ?auto_679898 ) ) ( not ( = ?auto_679888 ?auto_679889 ) ) ( not ( = ?auto_679888 ?auto_679890 ) ) ( not ( = ?auto_679888 ?auto_679891 ) ) ( not ( = ?auto_679888 ?auto_679892 ) ) ( not ( = ?auto_679888 ?auto_679893 ) ) ( not ( = ?auto_679888 ?auto_679894 ) ) ( not ( = ?auto_679888 ?auto_679895 ) ) ( not ( = ?auto_679888 ?auto_679896 ) ) ( not ( = ?auto_679888 ?auto_679897 ) ) ( not ( = ?auto_679888 ?auto_679898 ) ) ( not ( = ?auto_679889 ?auto_679890 ) ) ( not ( = ?auto_679889 ?auto_679891 ) ) ( not ( = ?auto_679889 ?auto_679892 ) ) ( not ( = ?auto_679889 ?auto_679893 ) ) ( not ( = ?auto_679889 ?auto_679894 ) ) ( not ( = ?auto_679889 ?auto_679895 ) ) ( not ( = ?auto_679889 ?auto_679896 ) ) ( not ( = ?auto_679889 ?auto_679897 ) ) ( not ( = ?auto_679889 ?auto_679898 ) ) ( not ( = ?auto_679890 ?auto_679891 ) ) ( not ( = ?auto_679890 ?auto_679892 ) ) ( not ( = ?auto_679890 ?auto_679893 ) ) ( not ( = ?auto_679890 ?auto_679894 ) ) ( not ( = ?auto_679890 ?auto_679895 ) ) ( not ( = ?auto_679890 ?auto_679896 ) ) ( not ( = ?auto_679890 ?auto_679897 ) ) ( not ( = ?auto_679890 ?auto_679898 ) ) ( not ( = ?auto_679891 ?auto_679892 ) ) ( not ( = ?auto_679891 ?auto_679893 ) ) ( not ( = ?auto_679891 ?auto_679894 ) ) ( not ( = ?auto_679891 ?auto_679895 ) ) ( not ( = ?auto_679891 ?auto_679896 ) ) ( not ( = ?auto_679891 ?auto_679897 ) ) ( not ( = ?auto_679891 ?auto_679898 ) ) ( not ( = ?auto_679892 ?auto_679893 ) ) ( not ( = ?auto_679892 ?auto_679894 ) ) ( not ( = ?auto_679892 ?auto_679895 ) ) ( not ( = ?auto_679892 ?auto_679896 ) ) ( not ( = ?auto_679892 ?auto_679897 ) ) ( not ( = ?auto_679892 ?auto_679898 ) ) ( not ( = ?auto_679893 ?auto_679894 ) ) ( not ( = ?auto_679893 ?auto_679895 ) ) ( not ( = ?auto_679893 ?auto_679896 ) ) ( not ( = ?auto_679893 ?auto_679897 ) ) ( not ( = ?auto_679893 ?auto_679898 ) ) ( not ( = ?auto_679894 ?auto_679895 ) ) ( not ( = ?auto_679894 ?auto_679896 ) ) ( not ( = ?auto_679894 ?auto_679897 ) ) ( not ( = ?auto_679894 ?auto_679898 ) ) ( not ( = ?auto_679895 ?auto_679896 ) ) ( not ( = ?auto_679895 ?auto_679897 ) ) ( not ( = ?auto_679895 ?auto_679898 ) ) ( not ( = ?auto_679896 ?auto_679897 ) ) ( not ( = ?auto_679896 ?auto_679898 ) ) ( not ( = ?auto_679897 ?auto_679898 ) ) ( ON ?auto_679896 ?auto_679897 ) ( ON ?auto_679895 ?auto_679896 ) ( ON ?auto_679894 ?auto_679895 ) ( ON ?auto_679893 ?auto_679894 ) ( ON ?auto_679892 ?auto_679893 ) ( ON ?auto_679891 ?auto_679892 ) ( ON ?auto_679890 ?auto_679891 ) ( ON ?auto_679889 ?auto_679890 ) ( ON ?auto_679888 ?auto_679889 ) ( ON ?auto_679887 ?auto_679888 ) ( ON ?auto_679886 ?auto_679887 ) ( ON ?auto_679885 ?auto_679886 ) ( ON ?auto_679884 ?auto_679885 ) ( ON ?auto_679883 ?auto_679884 ) ( ON ?auto_679882 ?auto_679883 ) ( ON ?auto_679881 ?auto_679882 ) ( CLEAR ?auto_679881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_679881 )
      ( MAKE-17PILE ?auto_679881 ?auto_679882 ?auto_679883 ?auto_679884 ?auto_679885 ?auto_679886 ?auto_679887 ?auto_679888 ?auto_679889 ?auto_679890 ?auto_679891 ?auto_679892 ?auto_679893 ?auto_679894 ?auto_679895 ?auto_679896 ?auto_679897 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679916 - BLOCK
      ?auto_679917 - BLOCK
      ?auto_679918 - BLOCK
      ?auto_679919 - BLOCK
      ?auto_679920 - BLOCK
      ?auto_679921 - BLOCK
      ?auto_679922 - BLOCK
      ?auto_679923 - BLOCK
      ?auto_679924 - BLOCK
      ?auto_679925 - BLOCK
      ?auto_679926 - BLOCK
      ?auto_679927 - BLOCK
      ?auto_679928 - BLOCK
      ?auto_679929 - BLOCK
      ?auto_679930 - BLOCK
      ?auto_679931 - BLOCK
      ?auto_679932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_679932 ) ( not ( = ?auto_679916 ?auto_679917 ) ) ( not ( = ?auto_679916 ?auto_679918 ) ) ( not ( = ?auto_679916 ?auto_679919 ) ) ( not ( = ?auto_679916 ?auto_679920 ) ) ( not ( = ?auto_679916 ?auto_679921 ) ) ( not ( = ?auto_679916 ?auto_679922 ) ) ( not ( = ?auto_679916 ?auto_679923 ) ) ( not ( = ?auto_679916 ?auto_679924 ) ) ( not ( = ?auto_679916 ?auto_679925 ) ) ( not ( = ?auto_679916 ?auto_679926 ) ) ( not ( = ?auto_679916 ?auto_679927 ) ) ( not ( = ?auto_679916 ?auto_679928 ) ) ( not ( = ?auto_679916 ?auto_679929 ) ) ( not ( = ?auto_679916 ?auto_679930 ) ) ( not ( = ?auto_679916 ?auto_679931 ) ) ( not ( = ?auto_679916 ?auto_679932 ) ) ( not ( = ?auto_679917 ?auto_679918 ) ) ( not ( = ?auto_679917 ?auto_679919 ) ) ( not ( = ?auto_679917 ?auto_679920 ) ) ( not ( = ?auto_679917 ?auto_679921 ) ) ( not ( = ?auto_679917 ?auto_679922 ) ) ( not ( = ?auto_679917 ?auto_679923 ) ) ( not ( = ?auto_679917 ?auto_679924 ) ) ( not ( = ?auto_679917 ?auto_679925 ) ) ( not ( = ?auto_679917 ?auto_679926 ) ) ( not ( = ?auto_679917 ?auto_679927 ) ) ( not ( = ?auto_679917 ?auto_679928 ) ) ( not ( = ?auto_679917 ?auto_679929 ) ) ( not ( = ?auto_679917 ?auto_679930 ) ) ( not ( = ?auto_679917 ?auto_679931 ) ) ( not ( = ?auto_679917 ?auto_679932 ) ) ( not ( = ?auto_679918 ?auto_679919 ) ) ( not ( = ?auto_679918 ?auto_679920 ) ) ( not ( = ?auto_679918 ?auto_679921 ) ) ( not ( = ?auto_679918 ?auto_679922 ) ) ( not ( = ?auto_679918 ?auto_679923 ) ) ( not ( = ?auto_679918 ?auto_679924 ) ) ( not ( = ?auto_679918 ?auto_679925 ) ) ( not ( = ?auto_679918 ?auto_679926 ) ) ( not ( = ?auto_679918 ?auto_679927 ) ) ( not ( = ?auto_679918 ?auto_679928 ) ) ( not ( = ?auto_679918 ?auto_679929 ) ) ( not ( = ?auto_679918 ?auto_679930 ) ) ( not ( = ?auto_679918 ?auto_679931 ) ) ( not ( = ?auto_679918 ?auto_679932 ) ) ( not ( = ?auto_679919 ?auto_679920 ) ) ( not ( = ?auto_679919 ?auto_679921 ) ) ( not ( = ?auto_679919 ?auto_679922 ) ) ( not ( = ?auto_679919 ?auto_679923 ) ) ( not ( = ?auto_679919 ?auto_679924 ) ) ( not ( = ?auto_679919 ?auto_679925 ) ) ( not ( = ?auto_679919 ?auto_679926 ) ) ( not ( = ?auto_679919 ?auto_679927 ) ) ( not ( = ?auto_679919 ?auto_679928 ) ) ( not ( = ?auto_679919 ?auto_679929 ) ) ( not ( = ?auto_679919 ?auto_679930 ) ) ( not ( = ?auto_679919 ?auto_679931 ) ) ( not ( = ?auto_679919 ?auto_679932 ) ) ( not ( = ?auto_679920 ?auto_679921 ) ) ( not ( = ?auto_679920 ?auto_679922 ) ) ( not ( = ?auto_679920 ?auto_679923 ) ) ( not ( = ?auto_679920 ?auto_679924 ) ) ( not ( = ?auto_679920 ?auto_679925 ) ) ( not ( = ?auto_679920 ?auto_679926 ) ) ( not ( = ?auto_679920 ?auto_679927 ) ) ( not ( = ?auto_679920 ?auto_679928 ) ) ( not ( = ?auto_679920 ?auto_679929 ) ) ( not ( = ?auto_679920 ?auto_679930 ) ) ( not ( = ?auto_679920 ?auto_679931 ) ) ( not ( = ?auto_679920 ?auto_679932 ) ) ( not ( = ?auto_679921 ?auto_679922 ) ) ( not ( = ?auto_679921 ?auto_679923 ) ) ( not ( = ?auto_679921 ?auto_679924 ) ) ( not ( = ?auto_679921 ?auto_679925 ) ) ( not ( = ?auto_679921 ?auto_679926 ) ) ( not ( = ?auto_679921 ?auto_679927 ) ) ( not ( = ?auto_679921 ?auto_679928 ) ) ( not ( = ?auto_679921 ?auto_679929 ) ) ( not ( = ?auto_679921 ?auto_679930 ) ) ( not ( = ?auto_679921 ?auto_679931 ) ) ( not ( = ?auto_679921 ?auto_679932 ) ) ( not ( = ?auto_679922 ?auto_679923 ) ) ( not ( = ?auto_679922 ?auto_679924 ) ) ( not ( = ?auto_679922 ?auto_679925 ) ) ( not ( = ?auto_679922 ?auto_679926 ) ) ( not ( = ?auto_679922 ?auto_679927 ) ) ( not ( = ?auto_679922 ?auto_679928 ) ) ( not ( = ?auto_679922 ?auto_679929 ) ) ( not ( = ?auto_679922 ?auto_679930 ) ) ( not ( = ?auto_679922 ?auto_679931 ) ) ( not ( = ?auto_679922 ?auto_679932 ) ) ( not ( = ?auto_679923 ?auto_679924 ) ) ( not ( = ?auto_679923 ?auto_679925 ) ) ( not ( = ?auto_679923 ?auto_679926 ) ) ( not ( = ?auto_679923 ?auto_679927 ) ) ( not ( = ?auto_679923 ?auto_679928 ) ) ( not ( = ?auto_679923 ?auto_679929 ) ) ( not ( = ?auto_679923 ?auto_679930 ) ) ( not ( = ?auto_679923 ?auto_679931 ) ) ( not ( = ?auto_679923 ?auto_679932 ) ) ( not ( = ?auto_679924 ?auto_679925 ) ) ( not ( = ?auto_679924 ?auto_679926 ) ) ( not ( = ?auto_679924 ?auto_679927 ) ) ( not ( = ?auto_679924 ?auto_679928 ) ) ( not ( = ?auto_679924 ?auto_679929 ) ) ( not ( = ?auto_679924 ?auto_679930 ) ) ( not ( = ?auto_679924 ?auto_679931 ) ) ( not ( = ?auto_679924 ?auto_679932 ) ) ( not ( = ?auto_679925 ?auto_679926 ) ) ( not ( = ?auto_679925 ?auto_679927 ) ) ( not ( = ?auto_679925 ?auto_679928 ) ) ( not ( = ?auto_679925 ?auto_679929 ) ) ( not ( = ?auto_679925 ?auto_679930 ) ) ( not ( = ?auto_679925 ?auto_679931 ) ) ( not ( = ?auto_679925 ?auto_679932 ) ) ( not ( = ?auto_679926 ?auto_679927 ) ) ( not ( = ?auto_679926 ?auto_679928 ) ) ( not ( = ?auto_679926 ?auto_679929 ) ) ( not ( = ?auto_679926 ?auto_679930 ) ) ( not ( = ?auto_679926 ?auto_679931 ) ) ( not ( = ?auto_679926 ?auto_679932 ) ) ( not ( = ?auto_679927 ?auto_679928 ) ) ( not ( = ?auto_679927 ?auto_679929 ) ) ( not ( = ?auto_679927 ?auto_679930 ) ) ( not ( = ?auto_679927 ?auto_679931 ) ) ( not ( = ?auto_679927 ?auto_679932 ) ) ( not ( = ?auto_679928 ?auto_679929 ) ) ( not ( = ?auto_679928 ?auto_679930 ) ) ( not ( = ?auto_679928 ?auto_679931 ) ) ( not ( = ?auto_679928 ?auto_679932 ) ) ( not ( = ?auto_679929 ?auto_679930 ) ) ( not ( = ?auto_679929 ?auto_679931 ) ) ( not ( = ?auto_679929 ?auto_679932 ) ) ( not ( = ?auto_679930 ?auto_679931 ) ) ( not ( = ?auto_679930 ?auto_679932 ) ) ( not ( = ?auto_679931 ?auto_679932 ) ) ( ON ?auto_679931 ?auto_679932 ) ( ON ?auto_679930 ?auto_679931 ) ( ON ?auto_679929 ?auto_679930 ) ( ON ?auto_679928 ?auto_679929 ) ( ON ?auto_679927 ?auto_679928 ) ( ON ?auto_679926 ?auto_679927 ) ( ON ?auto_679925 ?auto_679926 ) ( ON ?auto_679924 ?auto_679925 ) ( ON ?auto_679923 ?auto_679924 ) ( ON ?auto_679922 ?auto_679923 ) ( ON ?auto_679921 ?auto_679922 ) ( ON ?auto_679920 ?auto_679921 ) ( ON ?auto_679919 ?auto_679920 ) ( ON ?auto_679918 ?auto_679919 ) ( ON ?auto_679917 ?auto_679918 ) ( ON ?auto_679916 ?auto_679917 ) ( CLEAR ?auto_679916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_679916 )
      ( MAKE-17PILE ?auto_679916 ?auto_679917 ?auto_679918 ?auto_679919 ?auto_679920 ?auto_679921 ?auto_679922 ?auto_679923 ?auto_679924 ?auto_679925 ?auto_679926 ?auto_679927 ?auto_679928 ?auto_679929 ?auto_679930 ?auto_679931 ?auto_679932 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_679950 - BLOCK
      ?auto_679951 - BLOCK
      ?auto_679952 - BLOCK
      ?auto_679953 - BLOCK
      ?auto_679954 - BLOCK
      ?auto_679955 - BLOCK
      ?auto_679956 - BLOCK
      ?auto_679957 - BLOCK
      ?auto_679958 - BLOCK
      ?auto_679959 - BLOCK
      ?auto_679960 - BLOCK
      ?auto_679961 - BLOCK
      ?auto_679962 - BLOCK
      ?auto_679963 - BLOCK
      ?auto_679964 - BLOCK
      ?auto_679965 - BLOCK
      ?auto_679966 - BLOCK
    )
    :vars
    (
      ?auto_679967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_679950 ?auto_679951 ) ) ( not ( = ?auto_679950 ?auto_679952 ) ) ( not ( = ?auto_679950 ?auto_679953 ) ) ( not ( = ?auto_679950 ?auto_679954 ) ) ( not ( = ?auto_679950 ?auto_679955 ) ) ( not ( = ?auto_679950 ?auto_679956 ) ) ( not ( = ?auto_679950 ?auto_679957 ) ) ( not ( = ?auto_679950 ?auto_679958 ) ) ( not ( = ?auto_679950 ?auto_679959 ) ) ( not ( = ?auto_679950 ?auto_679960 ) ) ( not ( = ?auto_679950 ?auto_679961 ) ) ( not ( = ?auto_679950 ?auto_679962 ) ) ( not ( = ?auto_679950 ?auto_679963 ) ) ( not ( = ?auto_679950 ?auto_679964 ) ) ( not ( = ?auto_679950 ?auto_679965 ) ) ( not ( = ?auto_679950 ?auto_679966 ) ) ( not ( = ?auto_679951 ?auto_679952 ) ) ( not ( = ?auto_679951 ?auto_679953 ) ) ( not ( = ?auto_679951 ?auto_679954 ) ) ( not ( = ?auto_679951 ?auto_679955 ) ) ( not ( = ?auto_679951 ?auto_679956 ) ) ( not ( = ?auto_679951 ?auto_679957 ) ) ( not ( = ?auto_679951 ?auto_679958 ) ) ( not ( = ?auto_679951 ?auto_679959 ) ) ( not ( = ?auto_679951 ?auto_679960 ) ) ( not ( = ?auto_679951 ?auto_679961 ) ) ( not ( = ?auto_679951 ?auto_679962 ) ) ( not ( = ?auto_679951 ?auto_679963 ) ) ( not ( = ?auto_679951 ?auto_679964 ) ) ( not ( = ?auto_679951 ?auto_679965 ) ) ( not ( = ?auto_679951 ?auto_679966 ) ) ( not ( = ?auto_679952 ?auto_679953 ) ) ( not ( = ?auto_679952 ?auto_679954 ) ) ( not ( = ?auto_679952 ?auto_679955 ) ) ( not ( = ?auto_679952 ?auto_679956 ) ) ( not ( = ?auto_679952 ?auto_679957 ) ) ( not ( = ?auto_679952 ?auto_679958 ) ) ( not ( = ?auto_679952 ?auto_679959 ) ) ( not ( = ?auto_679952 ?auto_679960 ) ) ( not ( = ?auto_679952 ?auto_679961 ) ) ( not ( = ?auto_679952 ?auto_679962 ) ) ( not ( = ?auto_679952 ?auto_679963 ) ) ( not ( = ?auto_679952 ?auto_679964 ) ) ( not ( = ?auto_679952 ?auto_679965 ) ) ( not ( = ?auto_679952 ?auto_679966 ) ) ( not ( = ?auto_679953 ?auto_679954 ) ) ( not ( = ?auto_679953 ?auto_679955 ) ) ( not ( = ?auto_679953 ?auto_679956 ) ) ( not ( = ?auto_679953 ?auto_679957 ) ) ( not ( = ?auto_679953 ?auto_679958 ) ) ( not ( = ?auto_679953 ?auto_679959 ) ) ( not ( = ?auto_679953 ?auto_679960 ) ) ( not ( = ?auto_679953 ?auto_679961 ) ) ( not ( = ?auto_679953 ?auto_679962 ) ) ( not ( = ?auto_679953 ?auto_679963 ) ) ( not ( = ?auto_679953 ?auto_679964 ) ) ( not ( = ?auto_679953 ?auto_679965 ) ) ( not ( = ?auto_679953 ?auto_679966 ) ) ( not ( = ?auto_679954 ?auto_679955 ) ) ( not ( = ?auto_679954 ?auto_679956 ) ) ( not ( = ?auto_679954 ?auto_679957 ) ) ( not ( = ?auto_679954 ?auto_679958 ) ) ( not ( = ?auto_679954 ?auto_679959 ) ) ( not ( = ?auto_679954 ?auto_679960 ) ) ( not ( = ?auto_679954 ?auto_679961 ) ) ( not ( = ?auto_679954 ?auto_679962 ) ) ( not ( = ?auto_679954 ?auto_679963 ) ) ( not ( = ?auto_679954 ?auto_679964 ) ) ( not ( = ?auto_679954 ?auto_679965 ) ) ( not ( = ?auto_679954 ?auto_679966 ) ) ( not ( = ?auto_679955 ?auto_679956 ) ) ( not ( = ?auto_679955 ?auto_679957 ) ) ( not ( = ?auto_679955 ?auto_679958 ) ) ( not ( = ?auto_679955 ?auto_679959 ) ) ( not ( = ?auto_679955 ?auto_679960 ) ) ( not ( = ?auto_679955 ?auto_679961 ) ) ( not ( = ?auto_679955 ?auto_679962 ) ) ( not ( = ?auto_679955 ?auto_679963 ) ) ( not ( = ?auto_679955 ?auto_679964 ) ) ( not ( = ?auto_679955 ?auto_679965 ) ) ( not ( = ?auto_679955 ?auto_679966 ) ) ( not ( = ?auto_679956 ?auto_679957 ) ) ( not ( = ?auto_679956 ?auto_679958 ) ) ( not ( = ?auto_679956 ?auto_679959 ) ) ( not ( = ?auto_679956 ?auto_679960 ) ) ( not ( = ?auto_679956 ?auto_679961 ) ) ( not ( = ?auto_679956 ?auto_679962 ) ) ( not ( = ?auto_679956 ?auto_679963 ) ) ( not ( = ?auto_679956 ?auto_679964 ) ) ( not ( = ?auto_679956 ?auto_679965 ) ) ( not ( = ?auto_679956 ?auto_679966 ) ) ( not ( = ?auto_679957 ?auto_679958 ) ) ( not ( = ?auto_679957 ?auto_679959 ) ) ( not ( = ?auto_679957 ?auto_679960 ) ) ( not ( = ?auto_679957 ?auto_679961 ) ) ( not ( = ?auto_679957 ?auto_679962 ) ) ( not ( = ?auto_679957 ?auto_679963 ) ) ( not ( = ?auto_679957 ?auto_679964 ) ) ( not ( = ?auto_679957 ?auto_679965 ) ) ( not ( = ?auto_679957 ?auto_679966 ) ) ( not ( = ?auto_679958 ?auto_679959 ) ) ( not ( = ?auto_679958 ?auto_679960 ) ) ( not ( = ?auto_679958 ?auto_679961 ) ) ( not ( = ?auto_679958 ?auto_679962 ) ) ( not ( = ?auto_679958 ?auto_679963 ) ) ( not ( = ?auto_679958 ?auto_679964 ) ) ( not ( = ?auto_679958 ?auto_679965 ) ) ( not ( = ?auto_679958 ?auto_679966 ) ) ( not ( = ?auto_679959 ?auto_679960 ) ) ( not ( = ?auto_679959 ?auto_679961 ) ) ( not ( = ?auto_679959 ?auto_679962 ) ) ( not ( = ?auto_679959 ?auto_679963 ) ) ( not ( = ?auto_679959 ?auto_679964 ) ) ( not ( = ?auto_679959 ?auto_679965 ) ) ( not ( = ?auto_679959 ?auto_679966 ) ) ( not ( = ?auto_679960 ?auto_679961 ) ) ( not ( = ?auto_679960 ?auto_679962 ) ) ( not ( = ?auto_679960 ?auto_679963 ) ) ( not ( = ?auto_679960 ?auto_679964 ) ) ( not ( = ?auto_679960 ?auto_679965 ) ) ( not ( = ?auto_679960 ?auto_679966 ) ) ( not ( = ?auto_679961 ?auto_679962 ) ) ( not ( = ?auto_679961 ?auto_679963 ) ) ( not ( = ?auto_679961 ?auto_679964 ) ) ( not ( = ?auto_679961 ?auto_679965 ) ) ( not ( = ?auto_679961 ?auto_679966 ) ) ( not ( = ?auto_679962 ?auto_679963 ) ) ( not ( = ?auto_679962 ?auto_679964 ) ) ( not ( = ?auto_679962 ?auto_679965 ) ) ( not ( = ?auto_679962 ?auto_679966 ) ) ( not ( = ?auto_679963 ?auto_679964 ) ) ( not ( = ?auto_679963 ?auto_679965 ) ) ( not ( = ?auto_679963 ?auto_679966 ) ) ( not ( = ?auto_679964 ?auto_679965 ) ) ( not ( = ?auto_679964 ?auto_679966 ) ) ( not ( = ?auto_679965 ?auto_679966 ) ) ( ON ?auto_679950 ?auto_679967 ) ( not ( = ?auto_679966 ?auto_679967 ) ) ( not ( = ?auto_679965 ?auto_679967 ) ) ( not ( = ?auto_679964 ?auto_679967 ) ) ( not ( = ?auto_679963 ?auto_679967 ) ) ( not ( = ?auto_679962 ?auto_679967 ) ) ( not ( = ?auto_679961 ?auto_679967 ) ) ( not ( = ?auto_679960 ?auto_679967 ) ) ( not ( = ?auto_679959 ?auto_679967 ) ) ( not ( = ?auto_679958 ?auto_679967 ) ) ( not ( = ?auto_679957 ?auto_679967 ) ) ( not ( = ?auto_679956 ?auto_679967 ) ) ( not ( = ?auto_679955 ?auto_679967 ) ) ( not ( = ?auto_679954 ?auto_679967 ) ) ( not ( = ?auto_679953 ?auto_679967 ) ) ( not ( = ?auto_679952 ?auto_679967 ) ) ( not ( = ?auto_679951 ?auto_679967 ) ) ( not ( = ?auto_679950 ?auto_679967 ) ) ( ON ?auto_679951 ?auto_679950 ) ( ON ?auto_679952 ?auto_679951 ) ( ON ?auto_679953 ?auto_679952 ) ( ON ?auto_679954 ?auto_679953 ) ( ON ?auto_679955 ?auto_679954 ) ( ON ?auto_679956 ?auto_679955 ) ( ON ?auto_679957 ?auto_679956 ) ( ON ?auto_679958 ?auto_679957 ) ( ON ?auto_679959 ?auto_679958 ) ( ON ?auto_679960 ?auto_679959 ) ( ON ?auto_679961 ?auto_679960 ) ( ON ?auto_679962 ?auto_679961 ) ( ON ?auto_679963 ?auto_679962 ) ( ON ?auto_679964 ?auto_679963 ) ( ON ?auto_679965 ?auto_679964 ) ( ON ?auto_679966 ?auto_679965 ) ( CLEAR ?auto_679966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_679966 ?auto_679965 ?auto_679964 ?auto_679963 ?auto_679962 ?auto_679961 ?auto_679960 ?auto_679959 ?auto_679958 ?auto_679957 ?auto_679956 ?auto_679955 ?auto_679954 ?auto_679953 ?auto_679952 ?auto_679951 ?auto_679950 )
      ( MAKE-17PILE ?auto_679950 ?auto_679951 ?auto_679952 ?auto_679953 ?auto_679954 ?auto_679955 ?auto_679956 ?auto_679957 ?auto_679958 ?auto_679959 ?auto_679960 ?auto_679961 ?auto_679962 ?auto_679963 ?auto_679964 ?auto_679965 ?auto_679966 ) )
  )

)
