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
      ?auto_433645 - BLOCK
    )
    :vars
    (
      ?auto_433646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433645 ?auto_433646 ) ( CLEAR ?auto_433645 ) ( HAND-EMPTY ) ( not ( = ?auto_433645 ?auto_433646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433645 ?auto_433646 )
      ( !PUTDOWN ?auto_433645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_433648 - BLOCK
    )
    :vars
    (
      ?auto_433649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433648 ?auto_433649 ) ( CLEAR ?auto_433648 ) ( HAND-EMPTY ) ( not ( = ?auto_433648 ?auto_433649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433648 ?auto_433649 )
      ( !PUTDOWN ?auto_433648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_433652 - BLOCK
      ?auto_433653 - BLOCK
    )
    :vars
    (
      ?auto_433654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433652 ) ( ON ?auto_433653 ?auto_433654 ) ( CLEAR ?auto_433653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433652 ) ( not ( = ?auto_433652 ?auto_433653 ) ) ( not ( = ?auto_433652 ?auto_433654 ) ) ( not ( = ?auto_433653 ?auto_433654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433653 ?auto_433654 )
      ( !STACK ?auto_433653 ?auto_433652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_433657 - BLOCK
      ?auto_433658 - BLOCK
    )
    :vars
    (
      ?auto_433659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433657 ) ( ON ?auto_433658 ?auto_433659 ) ( CLEAR ?auto_433658 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433657 ) ( not ( = ?auto_433657 ?auto_433658 ) ) ( not ( = ?auto_433657 ?auto_433659 ) ) ( not ( = ?auto_433658 ?auto_433659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433658 ?auto_433659 )
      ( !STACK ?auto_433658 ?auto_433657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_433662 - BLOCK
      ?auto_433663 - BLOCK
    )
    :vars
    (
      ?auto_433664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433663 ?auto_433664 ) ( not ( = ?auto_433662 ?auto_433663 ) ) ( not ( = ?auto_433662 ?auto_433664 ) ) ( not ( = ?auto_433663 ?auto_433664 ) ) ( ON ?auto_433662 ?auto_433663 ) ( CLEAR ?auto_433662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433662 )
      ( MAKE-2PILE ?auto_433662 ?auto_433663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_433667 - BLOCK
      ?auto_433668 - BLOCK
    )
    :vars
    (
      ?auto_433669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433668 ?auto_433669 ) ( not ( = ?auto_433667 ?auto_433668 ) ) ( not ( = ?auto_433667 ?auto_433669 ) ) ( not ( = ?auto_433668 ?auto_433669 ) ) ( ON ?auto_433667 ?auto_433668 ) ( CLEAR ?auto_433667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433667 )
      ( MAKE-2PILE ?auto_433667 ?auto_433668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_433673 - BLOCK
      ?auto_433674 - BLOCK
      ?auto_433675 - BLOCK
    )
    :vars
    (
      ?auto_433676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433674 ) ( ON ?auto_433675 ?auto_433676 ) ( CLEAR ?auto_433675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433673 ) ( ON ?auto_433674 ?auto_433673 ) ( not ( = ?auto_433673 ?auto_433674 ) ) ( not ( = ?auto_433673 ?auto_433675 ) ) ( not ( = ?auto_433673 ?auto_433676 ) ) ( not ( = ?auto_433674 ?auto_433675 ) ) ( not ( = ?auto_433674 ?auto_433676 ) ) ( not ( = ?auto_433675 ?auto_433676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433675 ?auto_433676 )
      ( !STACK ?auto_433675 ?auto_433674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_433680 - BLOCK
      ?auto_433681 - BLOCK
      ?auto_433682 - BLOCK
    )
    :vars
    (
      ?auto_433683 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433681 ) ( ON ?auto_433682 ?auto_433683 ) ( CLEAR ?auto_433682 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433680 ) ( ON ?auto_433681 ?auto_433680 ) ( not ( = ?auto_433680 ?auto_433681 ) ) ( not ( = ?auto_433680 ?auto_433682 ) ) ( not ( = ?auto_433680 ?auto_433683 ) ) ( not ( = ?auto_433681 ?auto_433682 ) ) ( not ( = ?auto_433681 ?auto_433683 ) ) ( not ( = ?auto_433682 ?auto_433683 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433682 ?auto_433683 )
      ( !STACK ?auto_433682 ?auto_433681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_433687 - BLOCK
      ?auto_433688 - BLOCK
      ?auto_433689 - BLOCK
    )
    :vars
    (
      ?auto_433690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433689 ?auto_433690 ) ( ON-TABLE ?auto_433687 ) ( not ( = ?auto_433687 ?auto_433688 ) ) ( not ( = ?auto_433687 ?auto_433689 ) ) ( not ( = ?auto_433687 ?auto_433690 ) ) ( not ( = ?auto_433688 ?auto_433689 ) ) ( not ( = ?auto_433688 ?auto_433690 ) ) ( not ( = ?auto_433689 ?auto_433690 ) ) ( CLEAR ?auto_433687 ) ( ON ?auto_433688 ?auto_433689 ) ( CLEAR ?auto_433688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433687 ?auto_433688 )
      ( MAKE-3PILE ?auto_433687 ?auto_433688 ?auto_433689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_433694 - BLOCK
      ?auto_433695 - BLOCK
      ?auto_433696 - BLOCK
    )
    :vars
    (
      ?auto_433697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433696 ?auto_433697 ) ( ON-TABLE ?auto_433694 ) ( not ( = ?auto_433694 ?auto_433695 ) ) ( not ( = ?auto_433694 ?auto_433696 ) ) ( not ( = ?auto_433694 ?auto_433697 ) ) ( not ( = ?auto_433695 ?auto_433696 ) ) ( not ( = ?auto_433695 ?auto_433697 ) ) ( not ( = ?auto_433696 ?auto_433697 ) ) ( CLEAR ?auto_433694 ) ( ON ?auto_433695 ?auto_433696 ) ( CLEAR ?auto_433695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433694 ?auto_433695 )
      ( MAKE-3PILE ?auto_433694 ?auto_433695 ?auto_433696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_433701 - BLOCK
      ?auto_433702 - BLOCK
      ?auto_433703 - BLOCK
    )
    :vars
    (
      ?auto_433704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433703 ?auto_433704 ) ( not ( = ?auto_433701 ?auto_433702 ) ) ( not ( = ?auto_433701 ?auto_433703 ) ) ( not ( = ?auto_433701 ?auto_433704 ) ) ( not ( = ?auto_433702 ?auto_433703 ) ) ( not ( = ?auto_433702 ?auto_433704 ) ) ( not ( = ?auto_433703 ?auto_433704 ) ) ( ON ?auto_433702 ?auto_433703 ) ( ON ?auto_433701 ?auto_433702 ) ( CLEAR ?auto_433701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433701 )
      ( MAKE-3PILE ?auto_433701 ?auto_433702 ?auto_433703 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_433708 - BLOCK
      ?auto_433709 - BLOCK
      ?auto_433710 - BLOCK
    )
    :vars
    (
      ?auto_433711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433710 ?auto_433711 ) ( not ( = ?auto_433708 ?auto_433709 ) ) ( not ( = ?auto_433708 ?auto_433710 ) ) ( not ( = ?auto_433708 ?auto_433711 ) ) ( not ( = ?auto_433709 ?auto_433710 ) ) ( not ( = ?auto_433709 ?auto_433711 ) ) ( not ( = ?auto_433710 ?auto_433711 ) ) ( ON ?auto_433709 ?auto_433710 ) ( ON ?auto_433708 ?auto_433709 ) ( CLEAR ?auto_433708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433708 )
      ( MAKE-3PILE ?auto_433708 ?auto_433709 ?auto_433710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433716 - BLOCK
      ?auto_433717 - BLOCK
      ?auto_433718 - BLOCK
      ?auto_433719 - BLOCK
    )
    :vars
    (
      ?auto_433720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433718 ) ( ON ?auto_433719 ?auto_433720 ) ( CLEAR ?auto_433719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433716 ) ( ON ?auto_433717 ?auto_433716 ) ( ON ?auto_433718 ?auto_433717 ) ( not ( = ?auto_433716 ?auto_433717 ) ) ( not ( = ?auto_433716 ?auto_433718 ) ) ( not ( = ?auto_433716 ?auto_433719 ) ) ( not ( = ?auto_433716 ?auto_433720 ) ) ( not ( = ?auto_433717 ?auto_433718 ) ) ( not ( = ?auto_433717 ?auto_433719 ) ) ( not ( = ?auto_433717 ?auto_433720 ) ) ( not ( = ?auto_433718 ?auto_433719 ) ) ( not ( = ?auto_433718 ?auto_433720 ) ) ( not ( = ?auto_433719 ?auto_433720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433719 ?auto_433720 )
      ( !STACK ?auto_433719 ?auto_433718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433725 - BLOCK
      ?auto_433726 - BLOCK
      ?auto_433727 - BLOCK
      ?auto_433728 - BLOCK
    )
    :vars
    (
      ?auto_433729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433727 ) ( ON ?auto_433728 ?auto_433729 ) ( CLEAR ?auto_433728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433725 ) ( ON ?auto_433726 ?auto_433725 ) ( ON ?auto_433727 ?auto_433726 ) ( not ( = ?auto_433725 ?auto_433726 ) ) ( not ( = ?auto_433725 ?auto_433727 ) ) ( not ( = ?auto_433725 ?auto_433728 ) ) ( not ( = ?auto_433725 ?auto_433729 ) ) ( not ( = ?auto_433726 ?auto_433727 ) ) ( not ( = ?auto_433726 ?auto_433728 ) ) ( not ( = ?auto_433726 ?auto_433729 ) ) ( not ( = ?auto_433727 ?auto_433728 ) ) ( not ( = ?auto_433727 ?auto_433729 ) ) ( not ( = ?auto_433728 ?auto_433729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433728 ?auto_433729 )
      ( !STACK ?auto_433728 ?auto_433727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433734 - BLOCK
      ?auto_433735 - BLOCK
      ?auto_433736 - BLOCK
      ?auto_433737 - BLOCK
    )
    :vars
    (
      ?auto_433738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433737 ?auto_433738 ) ( ON-TABLE ?auto_433734 ) ( ON ?auto_433735 ?auto_433734 ) ( not ( = ?auto_433734 ?auto_433735 ) ) ( not ( = ?auto_433734 ?auto_433736 ) ) ( not ( = ?auto_433734 ?auto_433737 ) ) ( not ( = ?auto_433734 ?auto_433738 ) ) ( not ( = ?auto_433735 ?auto_433736 ) ) ( not ( = ?auto_433735 ?auto_433737 ) ) ( not ( = ?auto_433735 ?auto_433738 ) ) ( not ( = ?auto_433736 ?auto_433737 ) ) ( not ( = ?auto_433736 ?auto_433738 ) ) ( not ( = ?auto_433737 ?auto_433738 ) ) ( CLEAR ?auto_433735 ) ( ON ?auto_433736 ?auto_433737 ) ( CLEAR ?auto_433736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433734 ?auto_433735 ?auto_433736 )
      ( MAKE-4PILE ?auto_433734 ?auto_433735 ?auto_433736 ?auto_433737 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433743 - BLOCK
      ?auto_433744 - BLOCK
      ?auto_433745 - BLOCK
      ?auto_433746 - BLOCK
    )
    :vars
    (
      ?auto_433747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433746 ?auto_433747 ) ( ON-TABLE ?auto_433743 ) ( ON ?auto_433744 ?auto_433743 ) ( not ( = ?auto_433743 ?auto_433744 ) ) ( not ( = ?auto_433743 ?auto_433745 ) ) ( not ( = ?auto_433743 ?auto_433746 ) ) ( not ( = ?auto_433743 ?auto_433747 ) ) ( not ( = ?auto_433744 ?auto_433745 ) ) ( not ( = ?auto_433744 ?auto_433746 ) ) ( not ( = ?auto_433744 ?auto_433747 ) ) ( not ( = ?auto_433745 ?auto_433746 ) ) ( not ( = ?auto_433745 ?auto_433747 ) ) ( not ( = ?auto_433746 ?auto_433747 ) ) ( CLEAR ?auto_433744 ) ( ON ?auto_433745 ?auto_433746 ) ( CLEAR ?auto_433745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433743 ?auto_433744 ?auto_433745 )
      ( MAKE-4PILE ?auto_433743 ?auto_433744 ?auto_433745 ?auto_433746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433752 - BLOCK
      ?auto_433753 - BLOCK
      ?auto_433754 - BLOCK
      ?auto_433755 - BLOCK
    )
    :vars
    (
      ?auto_433756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433755 ?auto_433756 ) ( ON-TABLE ?auto_433752 ) ( not ( = ?auto_433752 ?auto_433753 ) ) ( not ( = ?auto_433752 ?auto_433754 ) ) ( not ( = ?auto_433752 ?auto_433755 ) ) ( not ( = ?auto_433752 ?auto_433756 ) ) ( not ( = ?auto_433753 ?auto_433754 ) ) ( not ( = ?auto_433753 ?auto_433755 ) ) ( not ( = ?auto_433753 ?auto_433756 ) ) ( not ( = ?auto_433754 ?auto_433755 ) ) ( not ( = ?auto_433754 ?auto_433756 ) ) ( not ( = ?auto_433755 ?auto_433756 ) ) ( ON ?auto_433754 ?auto_433755 ) ( CLEAR ?auto_433752 ) ( ON ?auto_433753 ?auto_433754 ) ( CLEAR ?auto_433753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433752 ?auto_433753 )
      ( MAKE-4PILE ?auto_433752 ?auto_433753 ?auto_433754 ?auto_433755 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433761 - BLOCK
      ?auto_433762 - BLOCK
      ?auto_433763 - BLOCK
      ?auto_433764 - BLOCK
    )
    :vars
    (
      ?auto_433765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433764 ?auto_433765 ) ( ON-TABLE ?auto_433761 ) ( not ( = ?auto_433761 ?auto_433762 ) ) ( not ( = ?auto_433761 ?auto_433763 ) ) ( not ( = ?auto_433761 ?auto_433764 ) ) ( not ( = ?auto_433761 ?auto_433765 ) ) ( not ( = ?auto_433762 ?auto_433763 ) ) ( not ( = ?auto_433762 ?auto_433764 ) ) ( not ( = ?auto_433762 ?auto_433765 ) ) ( not ( = ?auto_433763 ?auto_433764 ) ) ( not ( = ?auto_433763 ?auto_433765 ) ) ( not ( = ?auto_433764 ?auto_433765 ) ) ( ON ?auto_433763 ?auto_433764 ) ( CLEAR ?auto_433761 ) ( ON ?auto_433762 ?auto_433763 ) ( CLEAR ?auto_433762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433761 ?auto_433762 )
      ( MAKE-4PILE ?auto_433761 ?auto_433762 ?auto_433763 ?auto_433764 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433770 - BLOCK
      ?auto_433771 - BLOCK
      ?auto_433772 - BLOCK
      ?auto_433773 - BLOCK
    )
    :vars
    (
      ?auto_433774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433773 ?auto_433774 ) ( not ( = ?auto_433770 ?auto_433771 ) ) ( not ( = ?auto_433770 ?auto_433772 ) ) ( not ( = ?auto_433770 ?auto_433773 ) ) ( not ( = ?auto_433770 ?auto_433774 ) ) ( not ( = ?auto_433771 ?auto_433772 ) ) ( not ( = ?auto_433771 ?auto_433773 ) ) ( not ( = ?auto_433771 ?auto_433774 ) ) ( not ( = ?auto_433772 ?auto_433773 ) ) ( not ( = ?auto_433772 ?auto_433774 ) ) ( not ( = ?auto_433773 ?auto_433774 ) ) ( ON ?auto_433772 ?auto_433773 ) ( ON ?auto_433771 ?auto_433772 ) ( ON ?auto_433770 ?auto_433771 ) ( CLEAR ?auto_433770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433770 )
      ( MAKE-4PILE ?auto_433770 ?auto_433771 ?auto_433772 ?auto_433773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_433779 - BLOCK
      ?auto_433780 - BLOCK
      ?auto_433781 - BLOCK
      ?auto_433782 - BLOCK
    )
    :vars
    (
      ?auto_433783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433782 ?auto_433783 ) ( not ( = ?auto_433779 ?auto_433780 ) ) ( not ( = ?auto_433779 ?auto_433781 ) ) ( not ( = ?auto_433779 ?auto_433782 ) ) ( not ( = ?auto_433779 ?auto_433783 ) ) ( not ( = ?auto_433780 ?auto_433781 ) ) ( not ( = ?auto_433780 ?auto_433782 ) ) ( not ( = ?auto_433780 ?auto_433783 ) ) ( not ( = ?auto_433781 ?auto_433782 ) ) ( not ( = ?auto_433781 ?auto_433783 ) ) ( not ( = ?auto_433782 ?auto_433783 ) ) ( ON ?auto_433781 ?auto_433782 ) ( ON ?auto_433780 ?auto_433781 ) ( ON ?auto_433779 ?auto_433780 ) ( CLEAR ?auto_433779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433779 )
      ( MAKE-4PILE ?auto_433779 ?auto_433780 ?auto_433781 ?auto_433782 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433789 - BLOCK
      ?auto_433790 - BLOCK
      ?auto_433791 - BLOCK
      ?auto_433792 - BLOCK
      ?auto_433793 - BLOCK
    )
    :vars
    (
      ?auto_433794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433792 ) ( ON ?auto_433793 ?auto_433794 ) ( CLEAR ?auto_433793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433789 ) ( ON ?auto_433790 ?auto_433789 ) ( ON ?auto_433791 ?auto_433790 ) ( ON ?auto_433792 ?auto_433791 ) ( not ( = ?auto_433789 ?auto_433790 ) ) ( not ( = ?auto_433789 ?auto_433791 ) ) ( not ( = ?auto_433789 ?auto_433792 ) ) ( not ( = ?auto_433789 ?auto_433793 ) ) ( not ( = ?auto_433789 ?auto_433794 ) ) ( not ( = ?auto_433790 ?auto_433791 ) ) ( not ( = ?auto_433790 ?auto_433792 ) ) ( not ( = ?auto_433790 ?auto_433793 ) ) ( not ( = ?auto_433790 ?auto_433794 ) ) ( not ( = ?auto_433791 ?auto_433792 ) ) ( not ( = ?auto_433791 ?auto_433793 ) ) ( not ( = ?auto_433791 ?auto_433794 ) ) ( not ( = ?auto_433792 ?auto_433793 ) ) ( not ( = ?auto_433792 ?auto_433794 ) ) ( not ( = ?auto_433793 ?auto_433794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433793 ?auto_433794 )
      ( !STACK ?auto_433793 ?auto_433792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433800 - BLOCK
      ?auto_433801 - BLOCK
      ?auto_433802 - BLOCK
      ?auto_433803 - BLOCK
      ?auto_433804 - BLOCK
    )
    :vars
    (
      ?auto_433805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433803 ) ( ON ?auto_433804 ?auto_433805 ) ( CLEAR ?auto_433804 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433800 ) ( ON ?auto_433801 ?auto_433800 ) ( ON ?auto_433802 ?auto_433801 ) ( ON ?auto_433803 ?auto_433802 ) ( not ( = ?auto_433800 ?auto_433801 ) ) ( not ( = ?auto_433800 ?auto_433802 ) ) ( not ( = ?auto_433800 ?auto_433803 ) ) ( not ( = ?auto_433800 ?auto_433804 ) ) ( not ( = ?auto_433800 ?auto_433805 ) ) ( not ( = ?auto_433801 ?auto_433802 ) ) ( not ( = ?auto_433801 ?auto_433803 ) ) ( not ( = ?auto_433801 ?auto_433804 ) ) ( not ( = ?auto_433801 ?auto_433805 ) ) ( not ( = ?auto_433802 ?auto_433803 ) ) ( not ( = ?auto_433802 ?auto_433804 ) ) ( not ( = ?auto_433802 ?auto_433805 ) ) ( not ( = ?auto_433803 ?auto_433804 ) ) ( not ( = ?auto_433803 ?auto_433805 ) ) ( not ( = ?auto_433804 ?auto_433805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433804 ?auto_433805 )
      ( !STACK ?auto_433804 ?auto_433803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433811 - BLOCK
      ?auto_433812 - BLOCK
      ?auto_433813 - BLOCK
      ?auto_433814 - BLOCK
      ?auto_433815 - BLOCK
    )
    :vars
    (
      ?auto_433816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433815 ?auto_433816 ) ( ON-TABLE ?auto_433811 ) ( ON ?auto_433812 ?auto_433811 ) ( ON ?auto_433813 ?auto_433812 ) ( not ( = ?auto_433811 ?auto_433812 ) ) ( not ( = ?auto_433811 ?auto_433813 ) ) ( not ( = ?auto_433811 ?auto_433814 ) ) ( not ( = ?auto_433811 ?auto_433815 ) ) ( not ( = ?auto_433811 ?auto_433816 ) ) ( not ( = ?auto_433812 ?auto_433813 ) ) ( not ( = ?auto_433812 ?auto_433814 ) ) ( not ( = ?auto_433812 ?auto_433815 ) ) ( not ( = ?auto_433812 ?auto_433816 ) ) ( not ( = ?auto_433813 ?auto_433814 ) ) ( not ( = ?auto_433813 ?auto_433815 ) ) ( not ( = ?auto_433813 ?auto_433816 ) ) ( not ( = ?auto_433814 ?auto_433815 ) ) ( not ( = ?auto_433814 ?auto_433816 ) ) ( not ( = ?auto_433815 ?auto_433816 ) ) ( CLEAR ?auto_433813 ) ( ON ?auto_433814 ?auto_433815 ) ( CLEAR ?auto_433814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433811 ?auto_433812 ?auto_433813 ?auto_433814 )
      ( MAKE-5PILE ?auto_433811 ?auto_433812 ?auto_433813 ?auto_433814 ?auto_433815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433822 - BLOCK
      ?auto_433823 - BLOCK
      ?auto_433824 - BLOCK
      ?auto_433825 - BLOCK
      ?auto_433826 - BLOCK
    )
    :vars
    (
      ?auto_433827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433826 ?auto_433827 ) ( ON-TABLE ?auto_433822 ) ( ON ?auto_433823 ?auto_433822 ) ( ON ?auto_433824 ?auto_433823 ) ( not ( = ?auto_433822 ?auto_433823 ) ) ( not ( = ?auto_433822 ?auto_433824 ) ) ( not ( = ?auto_433822 ?auto_433825 ) ) ( not ( = ?auto_433822 ?auto_433826 ) ) ( not ( = ?auto_433822 ?auto_433827 ) ) ( not ( = ?auto_433823 ?auto_433824 ) ) ( not ( = ?auto_433823 ?auto_433825 ) ) ( not ( = ?auto_433823 ?auto_433826 ) ) ( not ( = ?auto_433823 ?auto_433827 ) ) ( not ( = ?auto_433824 ?auto_433825 ) ) ( not ( = ?auto_433824 ?auto_433826 ) ) ( not ( = ?auto_433824 ?auto_433827 ) ) ( not ( = ?auto_433825 ?auto_433826 ) ) ( not ( = ?auto_433825 ?auto_433827 ) ) ( not ( = ?auto_433826 ?auto_433827 ) ) ( CLEAR ?auto_433824 ) ( ON ?auto_433825 ?auto_433826 ) ( CLEAR ?auto_433825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433822 ?auto_433823 ?auto_433824 ?auto_433825 )
      ( MAKE-5PILE ?auto_433822 ?auto_433823 ?auto_433824 ?auto_433825 ?auto_433826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433833 - BLOCK
      ?auto_433834 - BLOCK
      ?auto_433835 - BLOCK
      ?auto_433836 - BLOCK
      ?auto_433837 - BLOCK
    )
    :vars
    (
      ?auto_433838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433837 ?auto_433838 ) ( ON-TABLE ?auto_433833 ) ( ON ?auto_433834 ?auto_433833 ) ( not ( = ?auto_433833 ?auto_433834 ) ) ( not ( = ?auto_433833 ?auto_433835 ) ) ( not ( = ?auto_433833 ?auto_433836 ) ) ( not ( = ?auto_433833 ?auto_433837 ) ) ( not ( = ?auto_433833 ?auto_433838 ) ) ( not ( = ?auto_433834 ?auto_433835 ) ) ( not ( = ?auto_433834 ?auto_433836 ) ) ( not ( = ?auto_433834 ?auto_433837 ) ) ( not ( = ?auto_433834 ?auto_433838 ) ) ( not ( = ?auto_433835 ?auto_433836 ) ) ( not ( = ?auto_433835 ?auto_433837 ) ) ( not ( = ?auto_433835 ?auto_433838 ) ) ( not ( = ?auto_433836 ?auto_433837 ) ) ( not ( = ?auto_433836 ?auto_433838 ) ) ( not ( = ?auto_433837 ?auto_433838 ) ) ( ON ?auto_433836 ?auto_433837 ) ( CLEAR ?auto_433834 ) ( ON ?auto_433835 ?auto_433836 ) ( CLEAR ?auto_433835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433833 ?auto_433834 ?auto_433835 )
      ( MAKE-5PILE ?auto_433833 ?auto_433834 ?auto_433835 ?auto_433836 ?auto_433837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433844 - BLOCK
      ?auto_433845 - BLOCK
      ?auto_433846 - BLOCK
      ?auto_433847 - BLOCK
      ?auto_433848 - BLOCK
    )
    :vars
    (
      ?auto_433849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433848 ?auto_433849 ) ( ON-TABLE ?auto_433844 ) ( ON ?auto_433845 ?auto_433844 ) ( not ( = ?auto_433844 ?auto_433845 ) ) ( not ( = ?auto_433844 ?auto_433846 ) ) ( not ( = ?auto_433844 ?auto_433847 ) ) ( not ( = ?auto_433844 ?auto_433848 ) ) ( not ( = ?auto_433844 ?auto_433849 ) ) ( not ( = ?auto_433845 ?auto_433846 ) ) ( not ( = ?auto_433845 ?auto_433847 ) ) ( not ( = ?auto_433845 ?auto_433848 ) ) ( not ( = ?auto_433845 ?auto_433849 ) ) ( not ( = ?auto_433846 ?auto_433847 ) ) ( not ( = ?auto_433846 ?auto_433848 ) ) ( not ( = ?auto_433846 ?auto_433849 ) ) ( not ( = ?auto_433847 ?auto_433848 ) ) ( not ( = ?auto_433847 ?auto_433849 ) ) ( not ( = ?auto_433848 ?auto_433849 ) ) ( ON ?auto_433847 ?auto_433848 ) ( CLEAR ?auto_433845 ) ( ON ?auto_433846 ?auto_433847 ) ( CLEAR ?auto_433846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433844 ?auto_433845 ?auto_433846 )
      ( MAKE-5PILE ?auto_433844 ?auto_433845 ?auto_433846 ?auto_433847 ?auto_433848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433855 - BLOCK
      ?auto_433856 - BLOCK
      ?auto_433857 - BLOCK
      ?auto_433858 - BLOCK
      ?auto_433859 - BLOCK
    )
    :vars
    (
      ?auto_433860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433859 ?auto_433860 ) ( ON-TABLE ?auto_433855 ) ( not ( = ?auto_433855 ?auto_433856 ) ) ( not ( = ?auto_433855 ?auto_433857 ) ) ( not ( = ?auto_433855 ?auto_433858 ) ) ( not ( = ?auto_433855 ?auto_433859 ) ) ( not ( = ?auto_433855 ?auto_433860 ) ) ( not ( = ?auto_433856 ?auto_433857 ) ) ( not ( = ?auto_433856 ?auto_433858 ) ) ( not ( = ?auto_433856 ?auto_433859 ) ) ( not ( = ?auto_433856 ?auto_433860 ) ) ( not ( = ?auto_433857 ?auto_433858 ) ) ( not ( = ?auto_433857 ?auto_433859 ) ) ( not ( = ?auto_433857 ?auto_433860 ) ) ( not ( = ?auto_433858 ?auto_433859 ) ) ( not ( = ?auto_433858 ?auto_433860 ) ) ( not ( = ?auto_433859 ?auto_433860 ) ) ( ON ?auto_433858 ?auto_433859 ) ( ON ?auto_433857 ?auto_433858 ) ( CLEAR ?auto_433855 ) ( ON ?auto_433856 ?auto_433857 ) ( CLEAR ?auto_433856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433855 ?auto_433856 )
      ( MAKE-5PILE ?auto_433855 ?auto_433856 ?auto_433857 ?auto_433858 ?auto_433859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433866 - BLOCK
      ?auto_433867 - BLOCK
      ?auto_433868 - BLOCK
      ?auto_433869 - BLOCK
      ?auto_433870 - BLOCK
    )
    :vars
    (
      ?auto_433871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433870 ?auto_433871 ) ( ON-TABLE ?auto_433866 ) ( not ( = ?auto_433866 ?auto_433867 ) ) ( not ( = ?auto_433866 ?auto_433868 ) ) ( not ( = ?auto_433866 ?auto_433869 ) ) ( not ( = ?auto_433866 ?auto_433870 ) ) ( not ( = ?auto_433866 ?auto_433871 ) ) ( not ( = ?auto_433867 ?auto_433868 ) ) ( not ( = ?auto_433867 ?auto_433869 ) ) ( not ( = ?auto_433867 ?auto_433870 ) ) ( not ( = ?auto_433867 ?auto_433871 ) ) ( not ( = ?auto_433868 ?auto_433869 ) ) ( not ( = ?auto_433868 ?auto_433870 ) ) ( not ( = ?auto_433868 ?auto_433871 ) ) ( not ( = ?auto_433869 ?auto_433870 ) ) ( not ( = ?auto_433869 ?auto_433871 ) ) ( not ( = ?auto_433870 ?auto_433871 ) ) ( ON ?auto_433869 ?auto_433870 ) ( ON ?auto_433868 ?auto_433869 ) ( CLEAR ?auto_433866 ) ( ON ?auto_433867 ?auto_433868 ) ( CLEAR ?auto_433867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_433866 ?auto_433867 )
      ( MAKE-5PILE ?auto_433866 ?auto_433867 ?auto_433868 ?auto_433869 ?auto_433870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433877 - BLOCK
      ?auto_433878 - BLOCK
      ?auto_433879 - BLOCK
      ?auto_433880 - BLOCK
      ?auto_433881 - BLOCK
    )
    :vars
    (
      ?auto_433882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433881 ?auto_433882 ) ( not ( = ?auto_433877 ?auto_433878 ) ) ( not ( = ?auto_433877 ?auto_433879 ) ) ( not ( = ?auto_433877 ?auto_433880 ) ) ( not ( = ?auto_433877 ?auto_433881 ) ) ( not ( = ?auto_433877 ?auto_433882 ) ) ( not ( = ?auto_433878 ?auto_433879 ) ) ( not ( = ?auto_433878 ?auto_433880 ) ) ( not ( = ?auto_433878 ?auto_433881 ) ) ( not ( = ?auto_433878 ?auto_433882 ) ) ( not ( = ?auto_433879 ?auto_433880 ) ) ( not ( = ?auto_433879 ?auto_433881 ) ) ( not ( = ?auto_433879 ?auto_433882 ) ) ( not ( = ?auto_433880 ?auto_433881 ) ) ( not ( = ?auto_433880 ?auto_433882 ) ) ( not ( = ?auto_433881 ?auto_433882 ) ) ( ON ?auto_433880 ?auto_433881 ) ( ON ?auto_433879 ?auto_433880 ) ( ON ?auto_433878 ?auto_433879 ) ( ON ?auto_433877 ?auto_433878 ) ( CLEAR ?auto_433877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433877 )
      ( MAKE-5PILE ?auto_433877 ?auto_433878 ?auto_433879 ?auto_433880 ?auto_433881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_433888 - BLOCK
      ?auto_433889 - BLOCK
      ?auto_433890 - BLOCK
      ?auto_433891 - BLOCK
      ?auto_433892 - BLOCK
    )
    :vars
    (
      ?auto_433893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433892 ?auto_433893 ) ( not ( = ?auto_433888 ?auto_433889 ) ) ( not ( = ?auto_433888 ?auto_433890 ) ) ( not ( = ?auto_433888 ?auto_433891 ) ) ( not ( = ?auto_433888 ?auto_433892 ) ) ( not ( = ?auto_433888 ?auto_433893 ) ) ( not ( = ?auto_433889 ?auto_433890 ) ) ( not ( = ?auto_433889 ?auto_433891 ) ) ( not ( = ?auto_433889 ?auto_433892 ) ) ( not ( = ?auto_433889 ?auto_433893 ) ) ( not ( = ?auto_433890 ?auto_433891 ) ) ( not ( = ?auto_433890 ?auto_433892 ) ) ( not ( = ?auto_433890 ?auto_433893 ) ) ( not ( = ?auto_433891 ?auto_433892 ) ) ( not ( = ?auto_433891 ?auto_433893 ) ) ( not ( = ?auto_433892 ?auto_433893 ) ) ( ON ?auto_433891 ?auto_433892 ) ( ON ?auto_433890 ?auto_433891 ) ( ON ?auto_433889 ?auto_433890 ) ( ON ?auto_433888 ?auto_433889 ) ( CLEAR ?auto_433888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_433888 )
      ( MAKE-5PILE ?auto_433888 ?auto_433889 ?auto_433890 ?auto_433891 ?auto_433892 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433900 - BLOCK
      ?auto_433901 - BLOCK
      ?auto_433902 - BLOCK
      ?auto_433903 - BLOCK
      ?auto_433904 - BLOCK
      ?auto_433905 - BLOCK
    )
    :vars
    (
      ?auto_433906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433904 ) ( ON ?auto_433905 ?auto_433906 ) ( CLEAR ?auto_433905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433900 ) ( ON ?auto_433901 ?auto_433900 ) ( ON ?auto_433902 ?auto_433901 ) ( ON ?auto_433903 ?auto_433902 ) ( ON ?auto_433904 ?auto_433903 ) ( not ( = ?auto_433900 ?auto_433901 ) ) ( not ( = ?auto_433900 ?auto_433902 ) ) ( not ( = ?auto_433900 ?auto_433903 ) ) ( not ( = ?auto_433900 ?auto_433904 ) ) ( not ( = ?auto_433900 ?auto_433905 ) ) ( not ( = ?auto_433900 ?auto_433906 ) ) ( not ( = ?auto_433901 ?auto_433902 ) ) ( not ( = ?auto_433901 ?auto_433903 ) ) ( not ( = ?auto_433901 ?auto_433904 ) ) ( not ( = ?auto_433901 ?auto_433905 ) ) ( not ( = ?auto_433901 ?auto_433906 ) ) ( not ( = ?auto_433902 ?auto_433903 ) ) ( not ( = ?auto_433902 ?auto_433904 ) ) ( not ( = ?auto_433902 ?auto_433905 ) ) ( not ( = ?auto_433902 ?auto_433906 ) ) ( not ( = ?auto_433903 ?auto_433904 ) ) ( not ( = ?auto_433903 ?auto_433905 ) ) ( not ( = ?auto_433903 ?auto_433906 ) ) ( not ( = ?auto_433904 ?auto_433905 ) ) ( not ( = ?auto_433904 ?auto_433906 ) ) ( not ( = ?auto_433905 ?auto_433906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433905 ?auto_433906 )
      ( !STACK ?auto_433905 ?auto_433904 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433913 - BLOCK
      ?auto_433914 - BLOCK
      ?auto_433915 - BLOCK
      ?auto_433916 - BLOCK
      ?auto_433917 - BLOCK
      ?auto_433918 - BLOCK
    )
    :vars
    (
      ?auto_433919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_433917 ) ( ON ?auto_433918 ?auto_433919 ) ( CLEAR ?auto_433918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_433913 ) ( ON ?auto_433914 ?auto_433913 ) ( ON ?auto_433915 ?auto_433914 ) ( ON ?auto_433916 ?auto_433915 ) ( ON ?auto_433917 ?auto_433916 ) ( not ( = ?auto_433913 ?auto_433914 ) ) ( not ( = ?auto_433913 ?auto_433915 ) ) ( not ( = ?auto_433913 ?auto_433916 ) ) ( not ( = ?auto_433913 ?auto_433917 ) ) ( not ( = ?auto_433913 ?auto_433918 ) ) ( not ( = ?auto_433913 ?auto_433919 ) ) ( not ( = ?auto_433914 ?auto_433915 ) ) ( not ( = ?auto_433914 ?auto_433916 ) ) ( not ( = ?auto_433914 ?auto_433917 ) ) ( not ( = ?auto_433914 ?auto_433918 ) ) ( not ( = ?auto_433914 ?auto_433919 ) ) ( not ( = ?auto_433915 ?auto_433916 ) ) ( not ( = ?auto_433915 ?auto_433917 ) ) ( not ( = ?auto_433915 ?auto_433918 ) ) ( not ( = ?auto_433915 ?auto_433919 ) ) ( not ( = ?auto_433916 ?auto_433917 ) ) ( not ( = ?auto_433916 ?auto_433918 ) ) ( not ( = ?auto_433916 ?auto_433919 ) ) ( not ( = ?auto_433917 ?auto_433918 ) ) ( not ( = ?auto_433917 ?auto_433919 ) ) ( not ( = ?auto_433918 ?auto_433919 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_433918 ?auto_433919 )
      ( !STACK ?auto_433918 ?auto_433917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433926 - BLOCK
      ?auto_433927 - BLOCK
      ?auto_433928 - BLOCK
      ?auto_433929 - BLOCK
      ?auto_433930 - BLOCK
      ?auto_433931 - BLOCK
    )
    :vars
    (
      ?auto_433932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433931 ?auto_433932 ) ( ON-TABLE ?auto_433926 ) ( ON ?auto_433927 ?auto_433926 ) ( ON ?auto_433928 ?auto_433927 ) ( ON ?auto_433929 ?auto_433928 ) ( not ( = ?auto_433926 ?auto_433927 ) ) ( not ( = ?auto_433926 ?auto_433928 ) ) ( not ( = ?auto_433926 ?auto_433929 ) ) ( not ( = ?auto_433926 ?auto_433930 ) ) ( not ( = ?auto_433926 ?auto_433931 ) ) ( not ( = ?auto_433926 ?auto_433932 ) ) ( not ( = ?auto_433927 ?auto_433928 ) ) ( not ( = ?auto_433927 ?auto_433929 ) ) ( not ( = ?auto_433927 ?auto_433930 ) ) ( not ( = ?auto_433927 ?auto_433931 ) ) ( not ( = ?auto_433927 ?auto_433932 ) ) ( not ( = ?auto_433928 ?auto_433929 ) ) ( not ( = ?auto_433928 ?auto_433930 ) ) ( not ( = ?auto_433928 ?auto_433931 ) ) ( not ( = ?auto_433928 ?auto_433932 ) ) ( not ( = ?auto_433929 ?auto_433930 ) ) ( not ( = ?auto_433929 ?auto_433931 ) ) ( not ( = ?auto_433929 ?auto_433932 ) ) ( not ( = ?auto_433930 ?auto_433931 ) ) ( not ( = ?auto_433930 ?auto_433932 ) ) ( not ( = ?auto_433931 ?auto_433932 ) ) ( CLEAR ?auto_433929 ) ( ON ?auto_433930 ?auto_433931 ) ( CLEAR ?auto_433930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_433926 ?auto_433927 ?auto_433928 ?auto_433929 ?auto_433930 )
      ( MAKE-6PILE ?auto_433926 ?auto_433927 ?auto_433928 ?auto_433929 ?auto_433930 ?auto_433931 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433939 - BLOCK
      ?auto_433940 - BLOCK
      ?auto_433941 - BLOCK
      ?auto_433942 - BLOCK
      ?auto_433943 - BLOCK
      ?auto_433944 - BLOCK
    )
    :vars
    (
      ?auto_433945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433944 ?auto_433945 ) ( ON-TABLE ?auto_433939 ) ( ON ?auto_433940 ?auto_433939 ) ( ON ?auto_433941 ?auto_433940 ) ( ON ?auto_433942 ?auto_433941 ) ( not ( = ?auto_433939 ?auto_433940 ) ) ( not ( = ?auto_433939 ?auto_433941 ) ) ( not ( = ?auto_433939 ?auto_433942 ) ) ( not ( = ?auto_433939 ?auto_433943 ) ) ( not ( = ?auto_433939 ?auto_433944 ) ) ( not ( = ?auto_433939 ?auto_433945 ) ) ( not ( = ?auto_433940 ?auto_433941 ) ) ( not ( = ?auto_433940 ?auto_433942 ) ) ( not ( = ?auto_433940 ?auto_433943 ) ) ( not ( = ?auto_433940 ?auto_433944 ) ) ( not ( = ?auto_433940 ?auto_433945 ) ) ( not ( = ?auto_433941 ?auto_433942 ) ) ( not ( = ?auto_433941 ?auto_433943 ) ) ( not ( = ?auto_433941 ?auto_433944 ) ) ( not ( = ?auto_433941 ?auto_433945 ) ) ( not ( = ?auto_433942 ?auto_433943 ) ) ( not ( = ?auto_433942 ?auto_433944 ) ) ( not ( = ?auto_433942 ?auto_433945 ) ) ( not ( = ?auto_433943 ?auto_433944 ) ) ( not ( = ?auto_433943 ?auto_433945 ) ) ( not ( = ?auto_433944 ?auto_433945 ) ) ( CLEAR ?auto_433942 ) ( ON ?auto_433943 ?auto_433944 ) ( CLEAR ?auto_433943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_433939 ?auto_433940 ?auto_433941 ?auto_433942 ?auto_433943 )
      ( MAKE-6PILE ?auto_433939 ?auto_433940 ?auto_433941 ?auto_433942 ?auto_433943 ?auto_433944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433952 - BLOCK
      ?auto_433953 - BLOCK
      ?auto_433954 - BLOCK
      ?auto_433955 - BLOCK
      ?auto_433956 - BLOCK
      ?auto_433957 - BLOCK
    )
    :vars
    (
      ?auto_433958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433957 ?auto_433958 ) ( ON-TABLE ?auto_433952 ) ( ON ?auto_433953 ?auto_433952 ) ( ON ?auto_433954 ?auto_433953 ) ( not ( = ?auto_433952 ?auto_433953 ) ) ( not ( = ?auto_433952 ?auto_433954 ) ) ( not ( = ?auto_433952 ?auto_433955 ) ) ( not ( = ?auto_433952 ?auto_433956 ) ) ( not ( = ?auto_433952 ?auto_433957 ) ) ( not ( = ?auto_433952 ?auto_433958 ) ) ( not ( = ?auto_433953 ?auto_433954 ) ) ( not ( = ?auto_433953 ?auto_433955 ) ) ( not ( = ?auto_433953 ?auto_433956 ) ) ( not ( = ?auto_433953 ?auto_433957 ) ) ( not ( = ?auto_433953 ?auto_433958 ) ) ( not ( = ?auto_433954 ?auto_433955 ) ) ( not ( = ?auto_433954 ?auto_433956 ) ) ( not ( = ?auto_433954 ?auto_433957 ) ) ( not ( = ?auto_433954 ?auto_433958 ) ) ( not ( = ?auto_433955 ?auto_433956 ) ) ( not ( = ?auto_433955 ?auto_433957 ) ) ( not ( = ?auto_433955 ?auto_433958 ) ) ( not ( = ?auto_433956 ?auto_433957 ) ) ( not ( = ?auto_433956 ?auto_433958 ) ) ( not ( = ?auto_433957 ?auto_433958 ) ) ( ON ?auto_433956 ?auto_433957 ) ( CLEAR ?auto_433954 ) ( ON ?auto_433955 ?auto_433956 ) ( CLEAR ?auto_433955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433952 ?auto_433953 ?auto_433954 ?auto_433955 )
      ( MAKE-6PILE ?auto_433952 ?auto_433953 ?auto_433954 ?auto_433955 ?auto_433956 ?auto_433957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433965 - BLOCK
      ?auto_433966 - BLOCK
      ?auto_433967 - BLOCK
      ?auto_433968 - BLOCK
      ?auto_433969 - BLOCK
      ?auto_433970 - BLOCK
    )
    :vars
    (
      ?auto_433971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433970 ?auto_433971 ) ( ON-TABLE ?auto_433965 ) ( ON ?auto_433966 ?auto_433965 ) ( ON ?auto_433967 ?auto_433966 ) ( not ( = ?auto_433965 ?auto_433966 ) ) ( not ( = ?auto_433965 ?auto_433967 ) ) ( not ( = ?auto_433965 ?auto_433968 ) ) ( not ( = ?auto_433965 ?auto_433969 ) ) ( not ( = ?auto_433965 ?auto_433970 ) ) ( not ( = ?auto_433965 ?auto_433971 ) ) ( not ( = ?auto_433966 ?auto_433967 ) ) ( not ( = ?auto_433966 ?auto_433968 ) ) ( not ( = ?auto_433966 ?auto_433969 ) ) ( not ( = ?auto_433966 ?auto_433970 ) ) ( not ( = ?auto_433966 ?auto_433971 ) ) ( not ( = ?auto_433967 ?auto_433968 ) ) ( not ( = ?auto_433967 ?auto_433969 ) ) ( not ( = ?auto_433967 ?auto_433970 ) ) ( not ( = ?auto_433967 ?auto_433971 ) ) ( not ( = ?auto_433968 ?auto_433969 ) ) ( not ( = ?auto_433968 ?auto_433970 ) ) ( not ( = ?auto_433968 ?auto_433971 ) ) ( not ( = ?auto_433969 ?auto_433970 ) ) ( not ( = ?auto_433969 ?auto_433971 ) ) ( not ( = ?auto_433970 ?auto_433971 ) ) ( ON ?auto_433969 ?auto_433970 ) ( CLEAR ?auto_433967 ) ( ON ?auto_433968 ?auto_433969 ) ( CLEAR ?auto_433968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_433965 ?auto_433966 ?auto_433967 ?auto_433968 )
      ( MAKE-6PILE ?auto_433965 ?auto_433966 ?auto_433967 ?auto_433968 ?auto_433969 ?auto_433970 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433978 - BLOCK
      ?auto_433979 - BLOCK
      ?auto_433980 - BLOCK
      ?auto_433981 - BLOCK
      ?auto_433982 - BLOCK
      ?auto_433983 - BLOCK
    )
    :vars
    (
      ?auto_433984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433983 ?auto_433984 ) ( ON-TABLE ?auto_433978 ) ( ON ?auto_433979 ?auto_433978 ) ( not ( = ?auto_433978 ?auto_433979 ) ) ( not ( = ?auto_433978 ?auto_433980 ) ) ( not ( = ?auto_433978 ?auto_433981 ) ) ( not ( = ?auto_433978 ?auto_433982 ) ) ( not ( = ?auto_433978 ?auto_433983 ) ) ( not ( = ?auto_433978 ?auto_433984 ) ) ( not ( = ?auto_433979 ?auto_433980 ) ) ( not ( = ?auto_433979 ?auto_433981 ) ) ( not ( = ?auto_433979 ?auto_433982 ) ) ( not ( = ?auto_433979 ?auto_433983 ) ) ( not ( = ?auto_433979 ?auto_433984 ) ) ( not ( = ?auto_433980 ?auto_433981 ) ) ( not ( = ?auto_433980 ?auto_433982 ) ) ( not ( = ?auto_433980 ?auto_433983 ) ) ( not ( = ?auto_433980 ?auto_433984 ) ) ( not ( = ?auto_433981 ?auto_433982 ) ) ( not ( = ?auto_433981 ?auto_433983 ) ) ( not ( = ?auto_433981 ?auto_433984 ) ) ( not ( = ?auto_433982 ?auto_433983 ) ) ( not ( = ?auto_433982 ?auto_433984 ) ) ( not ( = ?auto_433983 ?auto_433984 ) ) ( ON ?auto_433982 ?auto_433983 ) ( ON ?auto_433981 ?auto_433982 ) ( CLEAR ?auto_433979 ) ( ON ?auto_433980 ?auto_433981 ) ( CLEAR ?auto_433980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433978 ?auto_433979 ?auto_433980 )
      ( MAKE-6PILE ?auto_433978 ?auto_433979 ?auto_433980 ?auto_433981 ?auto_433982 ?auto_433983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_433991 - BLOCK
      ?auto_433992 - BLOCK
      ?auto_433993 - BLOCK
      ?auto_433994 - BLOCK
      ?auto_433995 - BLOCK
      ?auto_433996 - BLOCK
    )
    :vars
    (
      ?auto_433997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_433996 ?auto_433997 ) ( ON-TABLE ?auto_433991 ) ( ON ?auto_433992 ?auto_433991 ) ( not ( = ?auto_433991 ?auto_433992 ) ) ( not ( = ?auto_433991 ?auto_433993 ) ) ( not ( = ?auto_433991 ?auto_433994 ) ) ( not ( = ?auto_433991 ?auto_433995 ) ) ( not ( = ?auto_433991 ?auto_433996 ) ) ( not ( = ?auto_433991 ?auto_433997 ) ) ( not ( = ?auto_433992 ?auto_433993 ) ) ( not ( = ?auto_433992 ?auto_433994 ) ) ( not ( = ?auto_433992 ?auto_433995 ) ) ( not ( = ?auto_433992 ?auto_433996 ) ) ( not ( = ?auto_433992 ?auto_433997 ) ) ( not ( = ?auto_433993 ?auto_433994 ) ) ( not ( = ?auto_433993 ?auto_433995 ) ) ( not ( = ?auto_433993 ?auto_433996 ) ) ( not ( = ?auto_433993 ?auto_433997 ) ) ( not ( = ?auto_433994 ?auto_433995 ) ) ( not ( = ?auto_433994 ?auto_433996 ) ) ( not ( = ?auto_433994 ?auto_433997 ) ) ( not ( = ?auto_433995 ?auto_433996 ) ) ( not ( = ?auto_433995 ?auto_433997 ) ) ( not ( = ?auto_433996 ?auto_433997 ) ) ( ON ?auto_433995 ?auto_433996 ) ( ON ?auto_433994 ?auto_433995 ) ( CLEAR ?auto_433992 ) ( ON ?auto_433993 ?auto_433994 ) ( CLEAR ?auto_433993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_433991 ?auto_433992 ?auto_433993 )
      ( MAKE-6PILE ?auto_433991 ?auto_433992 ?auto_433993 ?auto_433994 ?auto_433995 ?auto_433996 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_434004 - BLOCK
      ?auto_434005 - BLOCK
      ?auto_434006 - BLOCK
      ?auto_434007 - BLOCK
      ?auto_434008 - BLOCK
      ?auto_434009 - BLOCK
    )
    :vars
    (
      ?auto_434010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434009 ?auto_434010 ) ( ON-TABLE ?auto_434004 ) ( not ( = ?auto_434004 ?auto_434005 ) ) ( not ( = ?auto_434004 ?auto_434006 ) ) ( not ( = ?auto_434004 ?auto_434007 ) ) ( not ( = ?auto_434004 ?auto_434008 ) ) ( not ( = ?auto_434004 ?auto_434009 ) ) ( not ( = ?auto_434004 ?auto_434010 ) ) ( not ( = ?auto_434005 ?auto_434006 ) ) ( not ( = ?auto_434005 ?auto_434007 ) ) ( not ( = ?auto_434005 ?auto_434008 ) ) ( not ( = ?auto_434005 ?auto_434009 ) ) ( not ( = ?auto_434005 ?auto_434010 ) ) ( not ( = ?auto_434006 ?auto_434007 ) ) ( not ( = ?auto_434006 ?auto_434008 ) ) ( not ( = ?auto_434006 ?auto_434009 ) ) ( not ( = ?auto_434006 ?auto_434010 ) ) ( not ( = ?auto_434007 ?auto_434008 ) ) ( not ( = ?auto_434007 ?auto_434009 ) ) ( not ( = ?auto_434007 ?auto_434010 ) ) ( not ( = ?auto_434008 ?auto_434009 ) ) ( not ( = ?auto_434008 ?auto_434010 ) ) ( not ( = ?auto_434009 ?auto_434010 ) ) ( ON ?auto_434008 ?auto_434009 ) ( ON ?auto_434007 ?auto_434008 ) ( ON ?auto_434006 ?auto_434007 ) ( CLEAR ?auto_434004 ) ( ON ?auto_434005 ?auto_434006 ) ( CLEAR ?auto_434005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434004 ?auto_434005 )
      ( MAKE-6PILE ?auto_434004 ?auto_434005 ?auto_434006 ?auto_434007 ?auto_434008 ?auto_434009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_434017 - BLOCK
      ?auto_434018 - BLOCK
      ?auto_434019 - BLOCK
      ?auto_434020 - BLOCK
      ?auto_434021 - BLOCK
      ?auto_434022 - BLOCK
    )
    :vars
    (
      ?auto_434023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434022 ?auto_434023 ) ( ON-TABLE ?auto_434017 ) ( not ( = ?auto_434017 ?auto_434018 ) ) ( not ( = ?auto_434017 ?auto_434019 ) ) ( not ( = ?auto_434017 ?auto_434020 ) ) ( not ( = ?auto_434017 ?auto_434021 ) ) ( not ( = ?auto_434017 ?auto_434022 ) ) ( not ( = ?auto_434017 ?auto_434023 ) ) ( not ( = ?auto_434018 ?auto_434019 ) ) ( not ( = ?auto_434018 ?auto_434020 ) ) ( not ( = ?auto_434018 ?auto_434021 ) ) ( not ( = ?auto_434018 ?auto_434022 ) ) ( not ( = ?auto_434018 ?auto_434023 ) ) ( not ( = ?auto_434019 ?auto_434020 ) ) ( not ( = ?auto_434019 ?auto_434021 ) ) ( not ( = ?auto_434019 ?auto_434022 ) ) ( not ( = ?auto_434019 ?auto_434023 ) ) ( not ( = ?auto_434020 ?auto_434021 ) ) ( not ( = ?auto_434020 ?auto_434022 ) ) ( not ( = ?auto_434020 ?auto_434023 ) ) ( not ( = ?auto_434021 ?auto_434022 ) ) ( not ( = ?auto_434021 ?auto_434023 ) ) ( not ( = ?auto_434022 ?auto_434023 ) ) ( ON ?auto_434021 ?auto_434022 ) ( ON ?auto_434020 ?auto_434021 ) ( ON ?auto_434019 ?auto_434020 ) ( CLEAR ?auto_434017 ) ( ON ?auto_434018 ?auto_434019 ) ( CLEAR ?auto_434018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434017 ?auto_434018 )
      ( MAKE-6PILE ?auto_434017 ?auto_434018 ?auto_434019 ?auto_434020 ?auto_434021 ?auto_434022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_434030 - BLOCK
      ?auto_434031 - BLOCK
      ?auto_434032 - BLOCK
      ?auto_434033 - BLOCK
      ?auto_434034 - BLOCK
      ?auto_434035 - BLOCK
    )
    :vars
    (
      ?auto_434036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434035 ?auto_434036 ) ( not ( = ?auto_434030 ?auto_434031 ) ) ( not ( = ?auto_434030 ?auto_434032 ) ) ( not ( = ?auto_434030 ?auto_434033 ) ) ( not ( = ?auto_434030 ?auto_434034 ) ) ( not ( = ?auto_434030 ?auto_434035 ) ) ( not ( = ?auto_434030 ?auto_434036 ) ) ( not ( = ?auto_434031 ?auto_434032 ) ) ( not ( = ?auto_434031 ?auto_434033 ) ) ( not ( = ?auto_434031 ?auto_434034 ) ) ( not ( = ?auto_434031 ?auto_434035 ) ) ( not ( = ?auto_434031 ?auto_434036 ) ) ( not ( = ?auto_434032 ?auto_434033 ) ) ( not ( = ?auto_434032 ?auto_434034 ) ) ( not ( = ?auto_434032 ?auto_434035 ) ) ( not ( = ?auto_434032 ?auto_434036 ) ) ( not ( = ?auto_434033 ?auto_434034 ) ) ( not ( = ?auto_434033 ?auto_434035 ) ) ( not ( = ?auto_434033 ?auto_434036 ) ) ( not ( = ?auto_434034 ?auto_434035 ) ) ( not ( = ?auto_434034 ?auto_434036 ) ) ( not ( = ?auto_434035 ?auto_434036 ) ) ( ON ?auto_434034 ?auto_434035 ) ( ON ?auto_434033 ?auto_434034 ) ( ON ?auto_434032 ?auto_434033 ) ( ON ?auto_434031 ?auto_434032 ) ( ON ?auto_434030 ?auto_434031 ) ( CLEAR ?auto_434030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434030 )
      ( MAKE-6PILE ?auto_434030 ?auto_434031 ?auto_434032 ?auto_434033 ?auto_434034 ?auto_434035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_434043 - BLOCK
      ?auto_434044 - BLOCK
      ?auto_434045 - BLOCK
      ?auto_434046 - BLOCK
      ?auto_434047 - BLOCK
      ?auto_434048 - BLOCK
    )
    :vars
    (
      ?auto_434049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434048 ?auto_434049 ) ( not ( = ?auto_434043 ?auto_434044 ) ) ( not ( = ?auto_434043 ?auto_434045 ) ) ( not ( = ?auto_434043 ?auto_434046 ) ) ( not ( = ?auto_434043 ?auto_434047 ) ) ( not ( = ?auto_434043 ?auto_434048 ) ) ( not ( = ?auto_434043 ?auto_434049 ) ) ( not ( = ?auto_434044 ?auto_434045 ) ) ( not ( = ?auto_434044 ?auto_434046 ) ) ( not ( = ?auto_434044 ?auto_434047 ) ) ( not ( = ?auto_434044 ?auto_434048 ) ) ( not ( = ?auto_434044 ?auto_434049 ) ) ( not ( = ?auto_434045 ?auto_434046 ) ) ( not ( = ?auto_434045 ?auto_434047 ) ) ( not ( = ?auto_434045 ?auto_434048 ) ) ( not ( = ?auto_434045 ?auto_434049 ) ) ( not ( = ?auto_434046 ?auto_434047 ) ) ( not ( = ?auto_434046 ?auto_434048 ) ) ( not ( = ?auto_434046 ?auto_434049 ) ) ( not ( = ?auto_434047 ?auto_434048 ) ) ( not ( = ?auto_434047 ?auto_434049 ) ) ( not ( = ?auto_434048 ?auto_434049 ) ) ( ON ?auto_434047 ?auto_434048 ) ( ON ?auto_434046 ?auto_434047 ) ( ON ?auto_434045 ?auto_434046 ) ( ON ?auto_434044 ?auto_434045 ) ( ON ?auto_434043 ?auto_434044 ) ( CLEAR ?auto_434043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434043 )
      ( MAKE-6PILE ?auto_434043 ?auto_434044 ?auto_434045 ?auto_434046 ?auto_434047 ?auto_434048 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434057 - BLOCK
      ?auto_434058 - BLOCK
      ?auto_434059 - BLOCK
      ?auto_434060 - BLOCK
      ?auto_434061 - BLOCK
      ?auto_434062 - BLOCK
      ?auto_434063 - BLOCK
    )
    :vars
    (
      ?auto_434064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434062 ) ( ON ?auto_434063 ?auto_434064 ) ( CLEAR ?auto_434063 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434057 ) ( ON ?auto_434058 ?auto_434057 ) ( ON ?auto_434059 ?auto_434058 ) ( ON ?auto_434060 ?auto_434059 ) ( ON ?auto_434061 ?auto_434060 ) ( ON ?auto_434062 ?auto_434061 ) ( not ( = ?auto_434057 ?auto_434058 ) ) ( not ( = ?auto_434057 ?auto_434059 ) ) ( not ( = ?auto_434057 ?auto_434060 ) ) ( not ( = ?auto_434057 ?auto_434061 ) ) ( not ( = ?auto_434057 ?auto_434062 ) ) ( not ( = ?auto_434057 ?auto_434063 ) ) ( not ( = ?auto_434057 ?auto_434064 ) ) ( not ( = ?auto_434058 ?auto_434059 ) ) ( not ( = ?auto_434058 ?auto_434060 ) ) ( not ( = ?auto_434058 ?auto_434061 ) ) ( not ( = ?auto_434058 ?auto_434062 ) ) ( not ( = ?auto_434058 ?auto_434063 ) ) ( not ( = ?auto_434058 ?auto_434064 ) ) ( not ( = ?auto_434059 ?auto_434060 ) ) ( not ( = ?auto_434059 ?auto_434061 ) ) ( not ( = ?auto_434059 ?auto_434062 ) ) ( not ( = ?auto_434059 ?auto_434063 ) ) ( not ( = ?auto_434059 ?auto_434064 ) ) ( not ( = ?auto_434060 ?auto_434061 ) ) ( not ( = ?auto_434060 ?auto_434062 ) ) ( not ( = ?auto_434060 ?auto_434063 ) ) ( not ( = ?auto_434060 ?auto_434064 ) ) ( not ( = ?auto_434061 ?auto_434062 ) ) ( not ( = ?auto_434061 ?auto_434063 ) ) ( not ( = ?auto_434061 ?auto_434064 ) ) ( not ( = ?auto_434062 ?auto_434063 ) ) ( not ( = ?auto_434062 ?auto_434064 ) ) ( not ( = ?auto_434063 ?auto_434064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434063 ?auto_434064 )
      ( !STACK ?auto_434063 ?auto_434062 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434072 - BLOCK
      ?auto_434073 - BLOCK
      ?auto_434074 - BLOCK
      ?auto_434075 - BLOCK
      ?auto_434076 - BLOCK
      ?auto_434077 - BLOCK
      ?auto_434078 - BLOCK
    )
    :vars
    (
      ?auto_434079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434077 ) ( ON ?auto_434078 ?auto_434079 ) ( CLEAR ?auto_434078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434072 ) ( ON ?auto_434073 ?auto_434072 ) ( ON ?auto_434074 ?auto_434073 ) ( ON ?auto_434075 ?auto_434074 ) ( ON ?auto_434076 ?auto_434075 ) ( ON ?auto_434077 ?auto_434076 ) ( not ( = ?auto_434072 ?auto_434073 ) ) ( not ( = ?auto_434072 ?auto_434074 ) ) ( not ( = ?auto_434072 ?auto_434075 ) ) ( not ( = ?auto_434072 ?auto_434076 ) ) ( not ( = ?auto_434072 ?auto_434077 ) ) ( not ( = ?auto_434072 ?auto_434078 ) ) ( not ( = ?auto_434072 ?auto_434079 ) ) ( not ( = ?auto_434073 ?auto_434074 ) ) ( not ( = ?auto_434073 ?auto_434075 ) ) ( not ( = ?auto_434073 ?auto_434076 ) ) ( not ( = ?auto_434073 ?auto_434077 ) ) ( not ( = ?auto_434073 ?auto_434078 ) ) ( not ( = ?auto_434073 ?auto_434079 ) ) ( not ( = ?auto_434074 ?auto_434075 ) ) ( not ( = ?auto_434074 ?auto_434076 ) ) ( not ( = ?auto_434074 ?auto_434077 ) ) ( not ( = ?auto_434074 ?auto_434078 ) ) ( not ( = ?auto_434074 ?auto_434079 ) ) ( not ( = ?auto_434075 ?auto_434076 ) ) ( not ( = ?auto_434075 ?auto_434077 ) ) ( not ( = ?auto_434075 ?auto_434078 ) ) ( not ( = ?auto_434075 ?auto_434079 ) ) ( not ( = ?auto_434076 ?auto_434077 ) ) ( not ( = ?auto_434076 ?auto_434078 ) ) ( not ( = ?auto_434076 ?auto_434079 ) ) ( not ( = ?auto_434077 ?auto_434078 ) ) ( not ( = ?auto_434077 ?auto_434079 ) ) ( not ( = ?auto_434078 ?auto_434079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434078 ?auto_434079 )
      ( !STACK ?auto_434078 ?auto_434077 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434087 - BLOCK
      ?auto_434088 - BLOCK
      ?auto_434089 - BLOCK
      ?auto_434090 - BLOCK
      ?auto_434091 - BLOCK
      ?auto_434092 - BLOCK
      ?auto_434093 - BLOCK
    )
    :vars
    (
      ?auto_434094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434093 ?auto_434094 ) ( ON-TABLE ?auto_434087 ) ( ON ?auto_434088 ?auto_434087 ) ( ON ?auto_434089 ?auto_434088 ) ( ON ?auto_434090 ?auto_434089 ) ( ON ?auto_434091 ?auto_434090 ) ( not ( = ?auto_434087 ?auto_434088 ) ) ( not ( = ?auto_434087 ?auto_434089 ) ) ( not ( = ?auto_434087 ?auto_434090 ) ) ( not ( = ?auto_434087 ?auto_434091 ) ) ( not ( = ?auto_434087 ?auto_434092 ) ) ( not ( = ?auto_434087 ?auto_434093 ) ) ( not ( = ?auto_434087 ?auto_434094 ) ) ( not ( = ?auto_434088 ?auto_434089 ) ) ( not ( = ?auto_434088 ?auto_434090 ) ) ( not ( = ?auto_434088 ?auto_434091 ) ) ( not ( = ?auto_434088 ?auto_434092 ) ) ( not ( = ?auto_434088 ?auto_434093 ) ) ( not ( = ?auto_434088 ?auto_434094 ) ) ( not ( = ?auto_434089 ?auto_434090 ) ) ( not ( = ?auto_434089 ?auto_434091 ) ) ( not ( = ?auto_434089 ?auto_434092 ) ) ( not ( = ?auto_434089 ?auto_434093 ) ) ( not ( = ?auto_434089 ?auto_434094 ) ) ( not ( = ?auto_434090 ?auto_434091 ) ) ( not ( = ?auto_434090 ?auto_434092 ) ) ( not ( = ?auto_434090 ?auto_434093 ) ) ( not ( = ?auto_434090 ?auto_434094 ) ) ( not ( = ?auto_434091 ?auto_434092 ) ) ( not ( = ?auto_434091 ?auto_434093 ) ) ( not ( = ?auto_434091 ?auto_434094 ) ) ( not ( = ?auto_434092 ?auto_434093 ) ) ( not ( = ?auto_434092 ?auto_434094 ) ) ( not ( = ?auto_434093 ?auto_434094 ) ) ( CLEAR ?auto_434091 ) ( ON ?auto_434092 ?auto_434093 ) ( CLEAR ?auto_434092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_434087 ?auto_434088 ?auto_434089 ?auto_434090 ?auto_434091 ?auto_434092 )
      ( MAKE-7PILE ?auto_434087 ?auto_434088 ?auto_434089 ?auto_434090 ?auto_434091 ?auto_434092 ?auto_434093 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434102 - BLOCK
      ?auto_434103 - BLOCK
      ?auto_434104 - BLOCK
      ?auto_434105 - BLOCK
      ?auto_434106 - BLOCK
      ?auto_434107 - BLOCK
      ?auto_434108 - BLOCK
    )
    :vars
    (
      ?auto_434109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434108 ?auto_434109 ) ( ON-TABLE ?auto_434102 ) ( ON ?auto_434103 ?auto_434102 ) ( ON ?auto_434104 ?auto_434103 ) ( ON ?auto_434105 ?auto_434104 ) ( ON ?auto_434106 ?auto_434105 ) ( not ( = ?auto_434102 ?auto_434103 ) ) ( not ( = ?auto_434102 ?auto_434104 ) ) ( not ( = ?auto_434102 ?auto_434105 ) ) ( not ( = ?auto_434102 ?auto_434106 ) ) ( not ( = ?auto_434102 ?auto_434107 ) ) ( not ( = ?auto_434102 ?auto_434108 ) ) ( not ( = ?auto_434102 ?auto_434109 ) ) ( not ( = ?auto_434103 ?auto_434104 ) ) ( not ( = ?auto_434103 ?auto_434105 ) ) ( not ( = ?auto_434103 ?auto_434106 ) ) ( not ( = ?auto_434103 ?auto_434107 ) ) ( not ( = ?auto_434103 ?auto_434108 ) ) ( not ( = ?auto_434103 ?auto_434109 ) ) ( not ( = ?auto_434104 ?auto_434105 ) ) ( not ( = ?auto_434104 ?auto_434106 ) ) ( not ( = ?auto_434104 ?auto_434107 ) ) ( not ( = ?auto_434104 ?auto_434108 ) ) ( not ( = ?auto_434104 ?auto_434109 ) ) ( not ( = ?auto_434105 ?auto_434106 ) ) ( not ( = ?auto_434105 ?auto_434107 ) ) ( not ( = ?auto_434105 ?auto_434108 ) ) ( not ( = ?auto_434105 ?auto_434109 ) ) ( not ( = ?auto_434106 ?auto_434107 ) ) ( not ( = ?auto_434106 ?auto_434108 ) ) ( not ( = ?auto_434106 ?auto_434109 ) ) ( not ( = ?auto_434107 ?auto_434108 ) ) ( not ( = ?auto_434107 ?auto_434109 ) ) ( not ( = ?auto_434108 ?auto_434109 ) ) ( CLEAR ?auto_434106 ) ( ON ?auto_434107 ?auto_434108 ) ( CLEAR ?auto_434107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_434102 ?auto_434103 ?auto_434104 ?auto_434105 ?auto_434106 ?auto_434107 )
      ( MAKE-7PILE ?auto_434102 ?auto_434103 ?auto_434104 ?auto_434105 ?auto_434106 ?auto_434107 ?auto_434108 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434117 - BLOCK
      ?auto_434118 - BLOCK
      ?auto_434119 - BLOCK
      ?auto_434120 - BLOCK
      ?auto_434121 - BLOCK
      ?auto_434122 - BLOCK
      ?auto_434123 - BLOCK
    )
    :vars
    (
      ?auto_434124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434123 ?auto_434124 ) ( ON-TABLE ?auto_434117 ) ( ON ?auto_434118 ?auto_434117 ) ( ON ?auto_434119 ?auto_434118 ) ( ON ?auto_434120 ?auto_434119 ) ( not ( = ?auto_434117 ?auto_434118 ) ) ( not ( = ?auto_434117 ?auto_434119 ) ) ( not ( = ?auto_434117 ?auto_434120 ) ) ( not ( = ?auto_434117 ?auto_434121 ) ) ( not ( = ?auto_434117 ?auto_434122 ) ) ( not ( = ?auto_434117 ?auto_434123 ) ) ( not ( = ?auto_434117 ?auto_434124 ) ) ( not ( = ?auto_434118 ?auto_434119 ) ) ( not ( = ?auto_434118 ?auto_434120 ) ) ( not ( = ?auto_434118 ?auto_434121 ) ) ( not ( = ?auto_434118 ?auto_434122 ) ) ( not ( = ?auto_434118 ?auto_434123 ) ) ( not ( = ?auto_434118 ?auto_434124 ) ) ( not ( = ?auto_434119 ?auto_434120 ) ) ( not ( = ?auto_434119 ?auto_434121 ) ) ( not ( = ?auto_434119 ?auto_434122 ) ) ( not ( = ?auto_434119 ?auto_434123 ) ) ( not ( = ?auto_434119 ?auto_434124 ) ) ( not ( = ?auto_434120 ?auto_434121 ) ) ( not ( = ?auto_434120 ?auto_434122 ) ) ( not ( = ?auto_434120 ?auto_434123 ) ) ( not ( = ?auto_434120 ?auto_434124 ) ) ( not ( = ?auto_434121 ?auto_434122 ) ) ( not ( = ?auto_434121 ?auto_434123 ) ) ( not ( = ?auto_434121 ?auto_434124 ) ) ( not ( = ?auto_434122 ?auto_434123 ) ) ( not ( = ?auto_434122 ?auto_434124 ) ) ( not ( = ?auto_434123 ?auto_434124 ) ) ( ON ?auto_434122 ?auto_434123 ) ( CLEAR ?auto_434120 ) ( ON ?auto_434121 ?auto_434122 ) ( CLEAR ?auto_434121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_434117 ?auto_434118 ?auto_434119 ?auto_434120 ?auto_434121 )
      ( MAKE-7PILE ?auto_434117 ?auto_434118 ?auto_434119 ?auto_434120 ?auto_434121 ?auto_434122 ?auto_434123 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434132 - BLOCK
      ?auto_434133 - BLOCK
      ?auto_434134 - BLOCK
      ?auto_434135 - BLOCK
      ?auto_434136 - BLOCK
      ?auto_434137 - BLOCK
      ?auto_434138 - BLOCK
    )
    :vars
    (
      ?auto_434139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434138 ?auto_434139 ) ( ON-TABLE ?auto_434132 ) ( ON ?auto_434133 ?auto_434132 ) ( ON ?auto_434134 ?auto_434133 ) ( ON ?auto_434135 ?auto_434134 ) ( not ( = ?auto_434132 ?auto_434133 ) ) ( not ( = ?auto_434132 ?auto_434134 ) ) ( not ( = ?auto_434132 ?auto_434135 ) ) ( not ( = ?auto_434132 ?auto_434136 ) ) ( not ( = ?auto_434132 ?auto_434137 ) ) ( not ( = ?auto_434132 ?auto_434138 ) ) ( not ( = ?auto_434132 ?auto_434139 ) ) ( not ( = ?auto_434133 ?auto_434134 ) ) ( not ( = ?auto_434133 ?auto_434135 ) ) ( not ( = ?auto_434133 ?auto_434136 ) ) ( not ( = ?auto_434133 ?auto_434137 ) ) ( not ( = ?auto_434133 ?auto_434138 ) ) ( not ( = ?auto_434133 ?auto_434139 ) ) ( not ( = ?auto_434134 ?auto_434135 ) ) ( not ( = ?auto_434134 ?auto_434136 ) ) ( not ( = ?auto_434134 ?auto_434137 ) ) ( not ( = ?auto_434134 ?auto_434138 ) ) ( not ( = ?auto_434134 ?auto_434139 ) ) ( not ( = ?auto_434135 ?auto_434136 ) ) ( not ( = ?auto_434135 ?auto_434137 ) ) ( not ( = ?auto_434135 ?auto_434138 ) ) ( not ( = ?auto_434135 ?auto_434139 ) ) ( not ( = ?auto_434136 ?auto_434137 ) ) ( not ( = ?auto_434136 ?auto_434138 ) ) ( not ( = ?auto_434136 ?auto_434139 ) ) ( not ( = ?auto_434137 ?auto_434138 ) ) ( not ( = ?auto_434137 ?auto_434139 ) ) ( not ( = ?auto_434138 ?auto_434139 ) ) ( ON ?auto_434137 ?auto_434138 ) ( CLEAR ?auto_434135 ) ( ON ?auto_434136 ?auto_434137 ) ( CLEAR ?auto_434136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_434132 ?auto_434133 ?auto_434134 ?auto_434135 ?auto_434136 )
      ( MAKE-7PILE ?auto_434132 ?auto_434133 ?auto_434134 ?auto_434135 ?auto_434136 ?auto_434137 ?auto_434138 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434147 - BLOCK
      ?auto_434148 - BLOCK
      ?auto_434149 - BLOCK
      ?auto_434150 - BLOCK
      ?auto_434151 - BLOCK
      ?auto_434152 - BLOCK
      ?auto_434153 - BLOCK
    )
    :vars
    (
      ?auto_434154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434153 ?auto_434154 ) ( ON-TABLE ?auto_434147 ) ( ON ?auto_434148 ?auto_434147 ) ( ON ?auto_434149 ?auto_434148 ) ( not ( = ?auto_434147 ?auto_434148 ) ) ( not ( = ?auto_434147 ?auto_434149 ) ) ( not ( = ?auto_434147 ?auto_434150 ) ) ( not ( = ?auto_434147 ?auto_434151 ) ) ( not ( = ?auto_434147 ?auto_434152 ) ) ( not ( = ?auto_434147 ?auto_434153 ) ) ( not ( = ?auto_434147 ?auto_434154 ) ) ( not ( = ?auto_434148 ?auto_434149 ) ) ( not ( = ?auto_434148 ?auto_434150 ) ) ( not ( = ?auto_434148 ?auto_434151 ) ) ( not ( = ?auto_434148 ?auto_434152 ) ) ( not ( = ?auto_434148 ?auto_434153 ) ) ( not ( = ?auto_434148 ?auto_434154 ) ) ( not ( = ?auto_434149 ?auto_434150 ) ) ( not ( = ?auto_434149 ?auto_434151 ) ) ( not ( = ?auto_434149 ?auto_434152 ) ) ( not ( = ?auto_434149 ?auto_434153 ) ) ( not ( = ?auto_434149 ?auto_434154 ) ) ( not ( = ?auto_434150 ?auto_434151 ) ) ( not ( = ?auto_434150 ?auto_434152 ) ) ( not ( = ?auto_434150 ?auto_434153 ) ) ( not ( = ?auto_434150 ?auto_434154 ) ) ( not ( = ?auto_434151 ?auto_434152 ) ) ( not ( = ?auto_434151 ?auto_434153 ) ) ( not ( = ?auto_434151 ?auto_434154 ) ) ( not ( = ?auto_434152 ?auto_434153 ) ) ( not ( = ?auto_434152 ?auto_434154 ) ) ( not ( = ?auto_434153 ?auto_434154 ) ) ( ON ?auto_434152 ?auto_434153 ) ( ON ?auto_434151 ?auto_434152 ) ( CLEAR ?auto_434149 ) ( ON ?auto_434150 ?auto_434151 ) ( CLEAR ?auto_434150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_434147 ?auto_434148 ?auto_434149 ?auto_434150 )
      ( MAKE-7PILE ?auto_434147 ?auto_434148 ?auto_434149 ?auto_434150 ?auto_434151 ?auto_434152 ?auto_434153 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434162 - BLOCK
      ?auto_434163 - BLOCK
      ?auto_434164 - BLOCK
      ?auto_434165 - BLOCK
      ?auto_434166 - BLOCK
      ?auto_434167 - BLOCK
      ?auto_434168 - BLOCK
    )
    :vars
    (
      ?auto_434169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434168 ?auto_434169 ) ( ON-TABLE ?auto_434162 ) ( ON ?auto_434163 ?auto_434162 ) ( ON ?auto_434164 ?auto_434163 ) ( not ( = ?auto_434162 ?auto_434163 ) ) ( not ( = ?auto_434162 ?auto_434164 ) ) ( not ( = ?auto_434162 ?auto_434165 ) ) ( not ( = ?auto_434162 ?auto_434166 ) ) ( not ( = ?auto_434162 ?auto_434167 ) ) ( not ( = ?auto_434162 ?auto_434168 ) ) ( not ( = ?auto_434162 ?auto_434169 ) ) ( not ( = ?auto_434163 ?auto_434164 ) ) ( not ( = ?auto_434163 ?auto_434165 ) ) ( not ( = ?auto_434163 ?auto_434166 ) ) ( not ( = ?auto_434163 ?auto_434167 ) ) ( not ( = ?auto_434163 ?auto_434168 ) ) ( not ( = ?auto_434163 ?auto_434169 ) ) ( not ( = ?auto_434164 ?auto_434165 ) ) ( not ( = ?auto_434164 ?auto_434166 ) ) ( not ( = ?auto_434164 ?auto_434167 ) ) ( not ( = ?auto_434164 ?auto_434168 ) ) ( not ( = ?auto_434164 ?auto_434169 ) ) ( not ( = ?auto_434165 ?auto_434166 ) ) ( not ( = ?auto_434165 ?auto_434167 ) ) ( not ( = ?auto_434165 ?auto_434168 ) ) ( not ( = ?auto_434165 ?auto_434169 ) ) ( not ( = ?auto_434166 ?auto_434167 ) ) ( not ( = ?auto_434166 ?auto_434168 ) ) ( not ( = ?auto_434166 ?auto_434169 ) ) ( not ( = ?auto_434167 ?auto_434168 ) ) ( not ( = ?auto_434167 ?auto_434169 ) ) ( not ( = ?auto_434168 ?auto_434169 ) ) ( ON ?auto_434167 ?auto_434168 ) ( ON ?auto_434166 ?auto_434167 ) ( CLEAR ?auto_434164 ) ( ON ?auto_434165 ?auto_434166 ) ( CLEAR ?auto_434165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_434162 ?auto_434163 ?auto_434164 ?auto_434165 )
      ( MAKE-7PILE ?auto_434162 ?auto_434163 ?auto_434164 ?auto_434165 ?auto_434166 ?auto_434167 ?auto_434168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434177 - BLOCK
      ?auto_434178 - BLOCK
      ?auto_434179 - BLOCK
      ?auto_434180 - BLOCK
      ?auto_434181 - BLOCK
      ?auto_434182 - BLOCK
      ?auto_434183 - BLOCK
    )
    :vars
    (
      ?auto_434184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434183 ?auto_434184 ) ( ON-TABLE ?auto_434177 ) ( ON ?auto_434178 ?auto_434177 ) ( not ( = ?auto_434177 ?auto_434178 ) ) ( not ( = ?auto_434177 ?auto_434179 ) ) ( not ( = ?auto_434177 ?auto_434180 ) ) ( not ( = ?auto_434177 ?auto_434181 ) ) ( not ( = ?auto_434177 ?auto_434182 ) ) ( not ( = ?auto_434177 ?auto_434183 ) ) ( not ( = ?auto_434177 ?auto_434184 ) ) ( not ( = ?auto_434178 ?auto_434179 ) ) ( not ( = ?auto_434178 ?auto_434180 ) ) ( not ( = ?auto_434178 ?auto_434181 ) ) ( not ( = ?auto_434178 ?auto_434182 ) ) ( not ( = ?auto_434178 ?auto_434183 ) ) ( not ( = ?auto_434178 ?auto_434184 ) ) ( not ( = ?auto_434179 ?auto_434180 ) ) ( not ( = ?auto_434179 ?auto_434181 ) ) ( not ( = ?auto_434179 ?auto_434182 ) ) ( not ( = ?auto_434179 ?auto_434183 ) ) ( not ( = ?auto_434179 ?auto_434184 ) ) ( not ( = ?auto_434180 ?auto_434181 ) ) ( not ( = ?auto_434180 ?auto_434182 ) ) ( not ( = ?auto_434180 ?auto_434183 ) ) ( not ( = ?auto_434180 ?auto_434184 ) ) ( not ( = ?auto_434181 ?auto_434182 ) ) ( not ( = ?auto_434181 ?auto_434183 ) ) ( not ( = ?auto_434181 ?auto_434184 ) ) ( not ( = ?auto_434182 ?auto_434183 ) ) ( not ( = ?auto_434182 ?auto_434184 ) ) ( not ( = ?auto_434183 ?auto_434184 ) ) ( ON ?auto_434182 ?auto_434183 ) ( ON ?auto_434181 ?auto_434182 ) ( ON ?auto_434180 ?auto_434181 ) ( CLEAR ?auto_434178 ) ( ON ?auto_434179 ?auto_434180 ) ( CLEAR ?auto_434179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_434177 ?auto_434178 ?auto_434179 )
      ( MAKE-7PILE ?auto_434177 ?auto_434178 ?auto_434179 ?auto_434180 ?auto_434181 ?auto_434182 ?auto_434183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434192 - BLOCK
      ?auto_434193 - BLOCK
      ?auto_434194 - BLOCK
      ?auto_434195 - BLOCK
      ?auto_434196 - BLOCK
      ?auto_434197 - BLOCK
      ?auto_434198 - BLOCK
    )
    :vars
    (
      ?auto_434199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434198 ?auto_434199 ) ( ON-TABLE ?auto_434192 ) ( ON ?auto_434193 ?auto_434192 ) ( not ( = ?auto_434192 ?auto_434193 ) ) ( not ( = ?auto_434192 ?auto_434194 ) ) ( not ( = ?auto_434192 ?auto_434195 ) ) ( not ( = ?auto_434192 ?auto_434196 ) ) ( not ( = ?auto_434192 ?auto_434197 ) ) ( not ( = ?auto_434192 ?auto_434198 ) ) ( not ( = ?auto_434192 ?auto_434199 ) ) ( not ( = ?auto_434193 ?auto_434194 ) ) ( not ( = ?auto_434193 ?auto_434195 ) ) ( not ( = ?auto_434193 ?auto_434196 ) ) ( not ( = ?auto_434193 ?auto_434197 ) ) ( not ( = ?auto_434193 ?auto_434198 ) ) ( not ( = ?auto_434193 ?auto_434199 ) ) ( not ( = ?auto_434194 ?auto_434195 ) ) ( not ( = ?auto_434194 ?auto_434196 ) ) ( not ( = ?auto_434194 ?auto_434197 ) ) ( not ( = ?auto_434194 ?auto_434198 ) ) ( not ( = ?auto_434194 ?auto_434199 ) ) ( not ( = ?auto_434195 ?auto_434196 ) ) ( not ( = ?auto_434195 ?auto_434197 ) ) ( not ( = ?auto_434195 ?auto_434198 ) ) ( not ( = ?auto_434195 ?auto_434199 ) ) ( not ( = ?auto_434196 ?auto_434197 ) ) ( not ( = ?auto_434196 ?auto_434198 ) ) ( not ( = ?auto_434196 ?auto_434199 ) ) ( not ( = ?auto_434197 ?auto_434198 ) ) ( not ( = ?auto_434197 ?auto_434199 ) ) ( not ( = ?auto_434198 ?auto_434199 ) ) ( ON ?auto_434197 ?auto_434198 ) ( ON ?auto_434196 ?auto_434197 ) ( ON ?auto_434195 ?auto_434196 ) ( CLEAR ?auto_434193 ) ( ON ?auto_434194 ?auto_434195 ) ( CLEAR ?auto_434194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_434192 ?auto_434193 ?auto_434194 )
      ( MAKE-7PILE ?auto_434192 ?auto_434193 ?auto_434194 ?auto_434195 ?auto_434196 ?auto_434197 ?auto_434198 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434207 - BLOCK
      ?auto_434208 - BLOCK
      ?auto_434209 - BLOCK
      ?auto_434210 - BLOCK
      ?auto_434211 - BLOCK
      ?auto_434212 - BLOCK
      ?auto_434213 - BLOCK
    )
    :vars
    (
      ?auto_434214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434213 ?auto_434214 ) ( ON-TABLE ?auto_434207 ) ( not ( = ?auto_434207 ?auto_434208 ) ) ( not ( = ?auto_434207 ?auto_434209 ) ) ( not ( = ?auto_434207 ?auto_434210 ) ) ( not ( = ?auto_434207 ?auto_434211 ) ) ( not ( = ?auto_434207 ?auto_434212 ) ) ( not ( = ?auto_434207 ?auto_434213 ) ) ( not ( = ?auto_434207 ?auto_434214 ) ) ( not ( = ?auto_434208 ?auto_434209 ) ) ( not ( = ?auto_434208 ?auto_434210 ) ) ( not ( = ?auto_434208 ?auto_434211 ) ) ( not ( = ?auto_434208 ?auto_434212 ) ) ( not ( = ?auto_434208 ?auto_434213 ) ) ( not ( = ?auto_434208 ?auto_434214 ) ) ( not ( = ?auto_434209 ?auto_434210 ) ) ( not ( = ?auto_434209 ?auto_434211 ) ) ( not ( = ?auto_434209 ?auto_434212 ) ) ( not ( = ?auto_434209 ?auto_434213 ) ) ( not ( = ?auto_434209 ?auto_434214 ) ) ( not ( = ?auto_434210 ?auto_434211 ) ) ( not ( = ?auto_434210 ?auto_434212 ) ) ( not ( = ?auto_434210 ?auto_434213 ) ) ( not ( = ?auto_434210 ?auto_434214 ) ) ( not ( = ?auto_434211 ?auto_434212 ) ) ( not ( = ?auto_434211 ?auto_434213 ) ) ( not ( = ?auto_434211 ?auto_434214 ) ) ( not ( = ?auto_434212 ?auto_434213 ) ) ( not ( = ?auto_434212 ?auto_434214 ) ) ( not ( = ?auto_434213 ?auto_434214 ) ) ( ON ?auto_434212 ?auto_434213 ) ( ON ?auto_434211 ?auto_434212 ) ( ON ?auto_434210 ?auto_434211 ) ( ON ?auto_434209 ?auto_434210 ) ( CLEAR ?auto_434207 ) ( ON ?auto_434208 ?auto_434209 ) ( CLEAR ?auto_434208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434207 ?auto_434208 )
      ( MAKE-7PILE ?auto_434207 ?auto_434208 ?auto_434209 ?auto_434210 ?auto_434211 ?auto_434212 ?auto_434213 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434222 - BLOCK
      ?auto_434223 - BLOCK
      ?auto_434224 - BLOCK
      ?auto_434225 - BLOCK
      ?auto_434226 - BLOCK
      ?auto_434227 - BLOCK
      ?auto_434228 - BLOCK
    )
    :vars
    (
      ?auto_434229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434228 ?auto_434229 ) ( ON-TABLE ?auto_434222 ) ( not ( = ?auto_434222 ?auto_434223 ) ) ( not ( = ?auto_434222 ?auto_434224 ) ) ( not ( = ?auto_434222 ?auto_434225 ) ) ( not ( = ?auto_434222 ?auto_434226 ) ) ( not ( = ?auto_434222 ?auto_434227 ) ) ( not ( = ?auto_434222 ?auto_434228 ) ) ( not ( = ?auto_434222 ?auto_434229 ) ) ( not ( = ?auto_434223 ?auto_434224 ) ) ( not ( = ?auto_434223 ?auto_434225 ) ) ( not ( = ?auto_434223 ?auto_434226 ) ) ( not ( = ?auto_434223 ?auto_434227 ) ) ( not ( = ?auto_434223 ?auto_434228 ) ) ( not ( = ?auto_434223 ?auto_434229 ) ) ( not ( = ?auto_434224 ?auto_434225 ) ) ( not ( = ?auto_434224 ?auto_434226 ) ) ( not ( = ?auto_434224 ?auto_434227 ) ) ( not ( = ?auto_434224 ?auto_434228 ) ) ( not ( = ?auto_434224 ?auto_434229 ) ) ( not ( = ?auto_434225 ?auto_434226 ) ) ( not ( = ?auto_434225 ?auto_434227 ) ) ( not ( = ?auto_434225 ?auto_434228 ) ) ( not ( = ?auto_434225 ?auto_434229 ) ) ( not ( = ?auto_434226 ?auto_434227 ) ) ( not ( = ?auto_434226 ?auto_434228 ) ) ( not ( = ?auto_434226 ?auto_434229 ) ) ( not ( = ?auto_434227 ?auto_434228 ) ) ( not ( = ?auto_434227 ?auto_434229 ) ) ( not ( = ?auto_434228 ?auto_434229 ) ) ( ON ?auto_434227 ?auto_434228 ) ( ON ?auto_434226 ?auto_434227 ) ( ON ?auto_434225 ?auto_434226 ) ( ON ?auto_434224 ?auto_434225 ) ( CLEAR ?auto_434222 ) ( ON ?auto_434223 ?auto_434224 ) ( CLEAR ?auto_434223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434222 ?auto_434223 )
      ( MAKE-7PILE ?auto_434222 ?auto_434223 ?auto_434224 ?auto_434225 ?auto_434226 ?auto_434227 ?auto_434228 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434237 - BLOCK
      ?auto_434238 - BLOCK
      ?auto_434239 - BLOCK
      ?auto_434240 - BLOCK
      ?auto_434241 - BLOCK
      ?auto_434242 - BLOCK
      ?auto_434243 - BLOCK
    )
    :vars
    (
      ?auto_434244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434243 ?auto_434244 ) ( not ( = ?auto_434237 ?auto_434238 ) ) ( not ( = ?auto_434237 ?auto_434239 ) ) ( not ( = ?auto_434237 ?auto_434240 ) ) ( not ( = ?auto_434237 ?auto_434241 ) ) ( not ( = ?auto_434237 ?auto_434242 ) ) ( not ( = ?auto_434237 ?auto_434243 ) ) ( not ( = ?auto_434237 ?auto_434244 ) ) ( not ( = ?auto_434238 ?auto_434239 ) ) ( not ( = ?auto_434238 ?auto_434240 ) ) ( not ( = ?auto_434238 ?auto_434241 ) ) ( not ( = ?auto_434238 ?auto_434242 ) ) ( not ( = ?auto_434238 ?auto_434243 ) ) ( not ( = ?auto_434238 ?auto_434244 ) ) ( not ( = ?auto_434239 ?auto_434240 ) ) ( not ( = ?auto_434239 ?auto_434241 ) ) ( not ( = ?auto_434239 ?auto_434242 ) ) ( not ( = ?auto_434239 ?auto_434243 ) ) ( not ( = ?auto_434239 ?auto_434244 ) ) ( not ( = ?auto_434240 ?auto_434241 ) ) ( not ( = ?auto_434240 ?auto_434242 ) ) ( not ( = ?auto_434240 ?auto_434243 ) ) ( not ( = ?auto_434240 ?auto_434244 ) ) ( not ( = ?auto_434241 ?auto_434242 ) ) ( not ( = ?auto_434241 ?auto_434243 ) ) ( not ( = ?auto_434241 ?auto_434244 ) ) ( not ( = ?auto_434242 ?auto_434243 ) ) ( not ( = ?auto_434242 ?auto_434244 ) ) ( not ( = ?auto_434243 ?auto_434244 ) ) ( ON ?auto_434242 ?auto_434243 ) ( ON ?auto_434241 ?auto_434242 ) ( ON ?auto_434240 ?auto_434241 ) ( ON ?auto_434239 ?auto_434240 ) ( ON ?auto_434238 ?auto_434239 ) ( ON ?auto_434237 ?auto_434238 ) ( CLEAR ?auto_434237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434237 )
      ( MAKE-7PILE ?auto_434237 ?auto_434238 ?auto_434239 ?auto_434240 ?auto_434241 ?auto_434242 ?auto_434243 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_434252 - BLOCK
      ?auto_434253 - BLOCK
      ?auto_434254 - BLOCK
      ?auto_434255 - BLOCK
      ?auto_434256 - BLOCK
      ?auto_434257 - BLOCK
      ?auto_434258 - BLOCK
    )
    :vars
    (
      ?auto_434259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434258 ?auto_434259 ) ( not ( = ?auto_434252 ?auto_434253 ) ) ( not ( = ?auto_434252 ?auto_434254 ) ) ( not ( = ?auto_434252 ?auto_434255 ) ) ( not ( = ?auto_434252 ?auto_434256 ) ) ( not ( = ?auto_434252 ?auto_434257 ) ) ( not ( = ?auto_434252 ?auto_434258 ) ) ( not ( = ?auto_434252 ?auto_434259 ) ) ( not ( = ?auto_434253 ?auto_434254 ) ) ( not ( = ?auto_434253 ?auto_434255 ) ) ( not ( = ?auto_434253 ?auto_434256 ) ) ( not ( = ?auto_434253 ?auto_434257 ) ) ( not ( = ?auto_434253 ?auto_434258 ) ) ( not ( = ?auto_434253 ?auto_434259 ) ) ( not ( = ?auto_434254 ?auto_434255 ) ) ( not ( = ?auto_434254 ?auto_434256 ) ) ( not ( = ?auto_434254 ?auto_434257 ) ) ( not ( = ?auto_434254 ?auto_434258 ) ) ( not ( = ?auto_434254 ?auto_434259 ) ) ( not ( = ?auto_434255 ?auto_434256 ) ) ( not ( = ?auto_434255 ?auto_434257 ) ) ( not ( = ?auto_434255 ?auto_434258 ) ) ( not ( = ?auto_434255 ?auto_434259 ) ) ( not ( = ?auto_434256 ?auto_434257 ) ) ( not ( = ?auto_434256 ?auto_434258 ) ) ( not ( = ?auto_434256 ?auto_434259 ) ) ( not ( = ?auto_434257 ?auto_434258 ) ) ( not ( = ?auto_434257 ?auto_434259 ) ) ( not ( = ?auto_434258 ?auto_434259 ) ) ( ON ?auto_434257 ?auto_434258 ) ( ON ?auto_434256 ?auto_434257 ) ( ON ?auto_434255 ?auto_434256 ) ( ON ?auto_434254 ?auto_434255 ) ( ON ?auto_434253 ?auto_434254 ) ( ON ?auto_434252 ?auto_434253 ) ( CLEAR ?auto_434252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434252 )
      ( MAKE-7PILE ?auto_434252 ?auto_434253 ?auto_434254 ?auto_434255 ?auto_434256 ?auto_434257 ?auto_434258 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434268 - BLOCK
      ?auto_434269 - BLOCK
      ?auto_434270 - BLOCK
      ?auto_434271 - BLOCK
      ?auto_434272 - BLOCK
      ?auto_434273 - BLOCK
      ?auto_434274 - BLOCK
      ?auto_434275 - BLOCK
    )
    :vars
    (
      ?auto_434276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434274 ) ( ON ?auto_434275 ?auto_434276 ) ( CLEAR ?auto_434275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434268 ) ( ON ?auto_434269 ?auto_434268 ) ( ON ?auto_434270 ?auto_434269 ) ( ON ?auto_434271 ?auto_434270 ) ( ON ?auto_434272 ?auto_434271 ) ( ON ?auto_434273 ?auto_434272 ) ( ON ?auto_434274 ?auto_434273 ) ( not ( = ?auto_434268 ?auto_434269 ) ) ( not ( = ?auto_434268 ?auto_434270 ) ) ( not ( = ?auto_434268 ?auto_434271 ) ) ( not ( = ?auto_434268 ?auto_434272 ) ) ( not ( = ?auto_434268 ?auto_434273 ) ) ( not ( = ?auto_434268 ?auto_434274 ) ) ( not ( = ?auto_434268 ?auto_434275 ) ) ( not ( = ?auto_434268 ?auto_434276 ) ) ( not ( = ?auto_434269 ?auto_434270 ) ) ( not ( = ?auto_434269 ?auto_434271 ) ) ( not ( = ?auto_434269 ?auto_434272 ) ) ( not ( = ?auto_434269 ?auto_434273 ) ) ( not ( = ?auto_434269 ?auto_434274 ) ) ( not ( = ?auto_434269 ?auto_434275 ) ) ( not ( = ?auto_434269 ?auto_434276 ) ) ( not ( = ?auto_434270 ?auto_434271 ) ) ( not ( = ?auto_434270 ?auto_434272 ) ) ( not ( = ?auto_434270 ?auto_434273 ) ) ( not ( = ?auto_434270 ?auto_434274 ) ) ( not ( = ?auto_434270 ?auto_434275 ) ) ( not ( = ?auto_434270 ?auto_434276 ) ) ( not ( = ?auto_434271 ?auto_434272 ) ) ( not ( = ?auto_434271 ?auto_434273 ) ) ( not ( = ?auto_434271 ?auto_434274 ) ) ( not ( = ?auto_434271 ?auto_434275 ) ) ( not ( = ?auto_434271 ?auto_434276 ) ) ( not ( = ?auto_434272 ?auto_434273 ) ) ( not ( = ?auto_434272 ?auto_434274 ) ) ( not ( = ?auto_434272 ?auto_434275 ) ) ( not ( = ?auto_434272 ?auto_434276 ) ) ( not ( = ?auto_434273 ?auto_434274 ) ) ( not ( = ?auto_434273 ?auto_434275 ) ) ( not ( = ?auto_434273 ?auto_434276 ) ) ( not ( = ?auto_434274 ?auto_434275 ) ) ( not ( = ?auto_434274 ?auto_434276 ) ) ( not ( = ?auto_434275 ?auto_434276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434275 ?auto_434276 )
      ( !STACK ?auto_434275 ?auto_434274 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434285 - BLOCK
      ?auto_434286 - BLOCK
      ?auto_434287 - BLOCK
      ?auto_434288 - BLOCK
      ?auto_434289 - BLOCK
      ?auto_434290 - BLOCK
      ?auto_434291 - BLOCK
      ?auto_434292 - BLOCK
    )
    :vars
    (
      ?auto_434293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434291 ) ( ON ?auto_434292 ?auto_434293 ) ( CLEAR ?auto_434292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434285 ) ( ON ?auto_434286 ?auto_434285 ) ( ON ?auto_434287 ?auto_434286 ) ( ON ?auto_434288 ?auto_434287 ) ( ON ?auto_434289 ?auto_434288 ) ( ON ?auto_434290 ?auto_434289 ) ( ON ?auto_434291 ?auto_434290 ) ( not ( = ?auto_434285 ?auto_434286 ) ) ( not ( = ?auto_434285 ?auto_434287 ) ) ( not ( = ?auto_434285 ?auto_434288 ) ) ( not ( = ?auto_434285 ?auto_434289 ) ) ( not ( = ?auto_434285 ?auto_434290 ) ) ( not ( = ?auto_434285 ?auto_434291 ) ) ( not ( = ?auto_434285 ?auto_434292 ) ) ( not ( = ?auto_434285 ?auto_434293 ) ) ( not ( = ?auto_434286 ?auto_434287 ) ) ( not ( = ?auto_434286 ?auto_434288 ) ) ( not ( = ?auto_434286 ?auto_434289 ) ) ( not ( = ?auto_434286 ?auto_434290 ) ) ( not ( = ?auto_434286 ?auto_434291 ) ) ( not ( = ?auto_434286 ?auto_434292 ) ) ( not ( = ?auto_434286 ?auto_434293 ) ) ( not ( = ?auto_434287 ?auto_434288 ) ) ( not ( = ?auto_434287 ?auto_434289 ) ) ( not ( = ?auto_434287 ?auto_434290 ) ) ( not ( = ?auto_434287 ?auto_434291 ) ) ( not ( = ?auto_434287 ?auto_434292 ) ) ( not ( = ?auto_434287 ?auto_434293 ) ) ( not ( = ?auto_434288 ?auto_434289 ) ) ( not ( = ?auto_434288 ?auto_434290 ) ) ( not ( = ?auto_434288 ?auto_434291 ) ) ( not ( = ?auto_434288 ?auto_434292 ) ) ( not ( = ?auto_434288 ?auto_434293 ) ) ( not ( = ?auto_434289 ?auto_434290 ) ) ( not ( = ?auto_434289 ?auto_434291 ) ) ( not ( = ?auto_434289 ?auto_434292 ) ) ( not ( = ?auto_434289 ?auto_434293 ) ) ( not ( = ?auto_434290 ?auto_434291 ) ) ( not ( = ?auto_434290 ?auto_434292 ) ) ( not ( = ?auto_434290 ?auto_434293 ) ) ( not ( = ?auto_434291 ?auto_434292 ) ) ( not ( = ?auto_434291 ?auto_434293 ) ) ( not ( = ?auto_434292 ?auto_434293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434292 ?auto_434293 )
      ( !STACK ?auto_434292 ?auto_434291 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434302 - BLOCK
      ?auto_434303 - BLOCK
      ?auto_434304 - BLOCK
      ?auto_434305 - BLOCK
      ?auto_434306 - BLOCK
      ?auto_434307 - BLOCK
      ?auto_434308 - BLOCK
      ?auto_434309 - BLOCK
    )
    :vars
    (
      ?auto_434310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434309 ?auto_434310 ) ( ON-TABLE ?auto_434302 ) ( ON ?auto_434303 ?auto_434302 ) ( ON ?auto_434304 ?auto_434303 ) ( ON ?auto_434305 ?auto_434304 ) ( ON ?auto_434306 ?auto_434305 ) ( ON ?auto_434307 ?auto_434306 ) ( not ( = ?auto_434302 ?auto_434303 ) ) ( not ( = ?auto_434302 ?auto_434304 ) ) ( not ( = ?auto_434302 ?auto_434305 ) ) ( not ( = ?auto_434302 ?auto_434306 ) ) ( not ( = ?auto_434302 ?auto_434307 ) ) ( not ( = ?auto_434302 ?auto_434308 ) ) ( not ( = ?auto_434302 ?auto_434309 ) ) ( not ( = ?auto_434302 ?auto_434310 ) ) ( not ( = ?auto_434303 ?auto_434304 ) ) ( not ( = ?auto_434303 ?auto_434305 ) ) ( not ( = ?auto_434303 ?auto_434306 ) ) ( not ( = ?auto_434303 ?auto_434307 ) ) ( not ( = ?auto_434303 ?auto_434308 ) ) ( not ( = ?auto_434303 ?auto_434309 ) ) ( not ( = ?auto_434303 ?auto_434310 ) ) ( not ( = ?auto_434304 ?auto_434305 ) ) ( not ( = ?auto_434304 ?auto_434306 ) ) ( not ( = ?auto_434304 ?auto_434307 ) ) ( not ( = ?auto_434304 ?auto_434308 ) ) ( not ( = ?auto_434304 ?auto_434309 ) ) ( not ( = ?auto_434304 ?auto_434310 ) ) ( not ( = ?auto_434305 ?auto_434306 ) ) ( not ( = ?auto_434305 ?auto_434307 ) ) ( not ( = ?auto_434305 ?auto_434308 ) ) ( not ( = ?auto_434305 ?auto_434309 ) ) ( not ( = ?auto_434305 ?auto_434310 ) ) ( not ( = ?auto_434306 ?auto_434307 ) ) ( not ( = ?auto_434306 ?auto_434308 ) ) ( not ( = ?auto_434306 ?auto_434309 ) ) ( not ( = ?auto_434306 ?auto_434310 ) ) ( not ( = ?auto_434307 ?auto_434308 ) ) ( not ( = ?auto_434307 ?auto_434309 ) ) ( not ( = ?auto_434307 ?auto_434310 ) ) ( not ( = ?auto_434308 ?auto_434309 ) ) ( not ( = ?auto_434308 ?auto_434310 ) ) ( not ( = ?auto_434309 ?auto_434310 ) ) ( CLEAR ?auto_434307 ) ( ON ?auto_434308 ?auto_434309 ) ( CLEAR ?auto_434308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_434302 ?auto_434303 ?auto_434304 ?auto_434305 ?auto_434306 ?auto_434307 ?auto_434308 )
      ( MAKE-8PILE ?auto_434302 ?auto_434303 ?auto_434304 ?auto_434305 ?auto_434306 ?auto_434307 ?auto_434308 ?auto_434309 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434319 - BLOCK
      ?auto_434320 - BLOCK
      ?auto_434321 - BLOCK
      ?auto_434322 - BLOCK
      ?auto_434323 - BLOCK
      ?auto_434324 - BLOCK
      ?auto_434325 - BLOCK
      ?auto_434326 - BLOCK
    )
    :vars
    (
      ?auto_434327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434326 ?auto_434327 ) ( ON-TABLE ?auto_434319 ) ( ON ?auto_434320 ?auto_434319 ) ( ON ?auto_434321 ?auto_434320 ) ( ON ?auto_434322 ?auto_434321 ) ( ON ?auto_434323 ?auto_434322 ) ( ON ?auto_434324 ?auto_434323 ) ( not ( = ?auto_434319 ?auto_434320 ) ) ( not ( = ?auto_434319 ?auto_434321 ) ) ( not ( = ?auto_434319 ?auto_434322 ) ) ( not ( = ?auto_434319 ?auto_434323 ) ) ( not ( = ?auto_434319 ?auto_434324 ) ) ( not ( = ?auto_434319 ?auto_434325 ) ) ( not ( = ?auto_434319 ?auto_434326 ) ) ( not ( = ?auto_434319 ?auto_434327 ) ) ( not ( = ?auto_434320 ?auto_434321 ) ) ( not ( = ?auto_434320 ?auto_434322 ) ) ( not ( = ?auto_434320 ?auto_434323 ) ) ( not ( = ?auto_434320 ?auto_434324 ) ) ( not ( = ?auto_434320 ?auto_434325 ) ) ( not ( = ?auto_434320 ?auto_434326 ) ) ( not ( = ?auto_434320 ?auto_434327 ) ) ( not ( = ?auto_434321 ?auto_434322 ) ) ( not ( = ?auto_434321 ?auto_434323 ) ) ( not ( = ?auto_434321 ?auto_434324 ) ) ( not ( = ?auto_434321 ?auto_434325 ) ) ( not ( = ?auto_434321 ?auto_434326 ) ) ( not ( = ?auto_434321 ?auto_434327 ) ) ( not ( = ?auto_434322 ?auto_434323 ) ) ( not ( = ?auto_434322 ?auto_434324 ) ) ( not ( = ?auto_434322 ?auto_434325 ) ) ( not ( = ?auto_434322 ?auto_434326 ) ) ( not ( = ?auto_434322 ?auto_434327 ) ) ( not ( = ?auto_434323 ?auto_434324 ) ) ( not ( = ?auto_434323 ?auto_434325 ) ) ( not ( = ?auto_434323 ?auto_434326 ) ) ( not ( = ?auto_434323 ?auto_434327 ) ) ( not ( = ?auto_434324 ?auto_434325 ) ) ( not ( = ?auto_434324 ?auto_434326 ) ) ( not ( = ?auto_434324 ?auto_434327 ) ) ( not ( = ?auto_434325 ?auto_434326 ) ) ( not ( = ?auto_434325 ?auto_434327 ) ) ( not ( = ?auto_434326 ?auto_434327 ) ) ( CLEAR ?auto_434324 ) ( ON ?auto_434325 ?auto_434326 ) ( CLEAR ?auto_434325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_434319 ?auto_434320 ?auto_434321 ?auto_434322 ?auto_434323 ?auto_434324 ?auto_434325 )
      ( MAKE-8PILE ?auto_434319 ?auto_434320 ?auto_434321 ?auto_434322 ?auto_434323 ?auto_434324 ?auto_434325 ?auto_434326 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434336 - BLOCK
      ?auto_434337 - BLOCK
      ?auto_434338 - BLOCK
      ?auto_434339 - BLOCK
      ?auto_434340 - BLOCK
      ?auto_434341 - BLOCK
      ?auto_434342 - BLOCK
      ?auto_434343 - BLOCK
    )
    :vars
    (
      ?auto_434344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434343 ?auto_434344 ) ( ON-TABLE ?auto_434336 ) ( ON ?auto_434337 ?auto_434336 ) ( ON ?auto_434338 ?auto_434337 ) ( ON ?auto_434339 ?auto_434338 ) ( ON ?auto_434340 ?auto_434339 ) ( not ( = ?auto_434336 ?auto_434337 ) ) ( not ( = ?auto_434336 ?auto_434338 ) ) ( not ( = ?auto_434336 ?auto_434339 ) ) ( not ( = ?auto_434336 ?auto_434340 ) ) ( not ( = ?auto_434336 ?auto_434341 ) ) ( not ( = ?auto_434336 ?auto_434342 ) ) ( not ( = ?auto_434336 ?auto_434343 ) ) ( not ( = ?auto_434336 ?auto_434344 ) ) ( not ( = ?auto_434337 ?auto_434338 ) ) ( not ( = ?auto_434337 ?auto_434339 ) ) ( not ( = ?auto_434337 ?auto_434340 ) ) ( not ( = ?auto_434337 ?auto_434341 ) ) ( not ( = ?auto_434337 ?auto_434342 ) ) ( not ( = ?auto_434337 ?auto_434343 ) ) ( not ( = ?auto_434337 ?auto_434344 ) ) ( not ( = ?auto_434338 ?auto_434339 ) ) ( not ( = ?auto_434338 ?auto_434340 ) ) ( not ( = ?auto_434338 ?auto_434341 ) ) ( not ( = ?auto_434338 ?auto_434342 ) ) ( not ( = ?auto_434338 ?auto_434343 ) ) ( not ( = ?auto_434338 ?auto_434344 ) ) ( not ( = ?auto_434339 ?auto_434340 ) ) ( not ( = ?auto_434339 ?auto_434341 ) ) ( not ( = ?auto_434339 ?auto_434342 ) ) ( not ( = ?auto_434339 ?auto_434343 ) ) ( not ( = ?auto_434339 ?auto_434344 ) ) ( not ( = ?auto_434340 ?auto_434341 ) ) ( not ( = ?auto_434340 ?auto_434342 ) ) ( not ( = ?auto_434340 ?auto_434343 ) ) ( not ( = ?auto_434340 ?auto_434344 ) ) ( not ( = ?auto_434341 ?auto_434342 ) ) ( not ( = ?auto_434341 ?auto_434343 ) ) ( not ( = ?auto_434341 ?auto_434344 ) ) ( not ( = ?auto_434342 ?auto_434343 ) ) ( not ( = ?auto_434342 ?auto_434344 ) ) ( not ( = ?auto_434343 ?auto_434344 ) ) ( ON ?auto_434342 ?auto_434343 ) ( CLEAR ?auto_434340 ) ( ON ?auto_434341 ?auto_434342 ) ( CLEAR ?auto_434341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_434336 ?auto_434337 ?auto_434338 ?auto_434339 ?auto_434340 ?auto_434341 )
      ( MAKE-8PILE ?auto_434336 ?auto_434337 ?auto_434338 ?auto_434339 ?auto_434340 ?auto_434341 ?auto_434342 ?auto_434343 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434353 - BLOCK
      ?auto_434354 - BLOCK
      ?auto_434355 - BLOCK
      ?auto_434356 - BLOCK
      ?auto_434357 - BLOCK
      ?auto_434358 - BLOCK
      ?auto_434359 - BLOCK
      ?auto_434360 - BLOCK
    )
    :vars
    (
      ?auto_434361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434360 ?auto_434361 ) ( ON-TABLE ?auto_434353 ) ( ON ?auto_434354 ?auto_434353 ) ( ON ?auto_434355 ?auto_434354 ) ( ON ?auto_434356 ?auto_434355 ) ( ON ?auto_434357 ?auto_434356 ) ( not ( = ?auto_434353 ?auto_434354 ) ) ( not ( = ?auto_434353 ?auto_434355 ) ) ( not ( = ?auto_434353 ?auto_434356 ) ) ( not ( = ?auto_434353 ?auto_434357 ) ) ( not ( = ?auto_434353 ?auto_434358 ) ) ( not ( = ?auto_434353 ?auto_434359 ) ) ( not ( = ?auto_434353 ?auto_434360 ) ) ( not ( = ?auto_434353 ?auto_434361 ) ) ( not ( = ?auto_434354 ?auto_434355 ) ) ( not ( = ?auto_434354 ?auto_434356 ) ) ( not ( = ?auto_434354 ?auto_434357 ) ) ( not ( = ?auto_434354 ?auto_434358 ) ) ( not ( = ?auto_434354 ?auto_434359 ) ) ( not ( = ?auto_434354 ?auto_434360 ) ) ( not ( = ?auto_434354 ?auto_434361 ) ) ( not ( = ?auto_434355 ?auto_434356 ) ) ( not ( = ?auto_434355 ?auto_434357 ) ) ( not ( = ?auto_434355 ?auto_434358 ) ) ( not ( = ?auto_434355 ?auto_434359 ) ) ( not ( = ?auto_434355 ?auto_434360 ) ) ( not ( = ?auto_434355 ?auto_434361 ) ) ( not ( = ?auto_434356 ?auto_434357 ) ) ( not ( = ?auto_434356 ?auto_434358 ) ) ( not ( = ?auto_434356 ?auto_434359 ) ) ( not ( = ?auto_434356 ?auto_434360 ) ) ( not ( = ?auto_434356 ?auto_434361 ) ) ( not ( = ?auto_434357 ?auto_434358 ) ) ( not ( = ?auto_434357 ?auto_434359 ) ) ( not ( = ?auto_434357 ?auto_434360 ) ) ( not ( = ?auto_434357 ?auto_434361 ) ) ( not ( = ?auto_434358 ?auto_434359 ) ) ( not ( = ?auto_434358 ?auto_434360 ) ) ( not ( = ?auto_434358 ?auto_434361 ) ) ( not ( = ?auto_434359 ?auto_434360 ) ) ( not ( = ?auto_434359 ?auto_434361 ) ) ( not ( = ?auto_434360 ?auto_434361 ) ) ( ON ?auto_434359 ?auto_434360 ) ( CLEAR ?auto_434357 ) ( ON ?auto_434358 ?auto_434359 ) ( CLEAR ?auto_434358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_434353 ?auto_434354 ?auto_434355 ?auto_434356 ?auto_434357 ?auto_434358 )
      ( MAKE-8PILE ?auto_434353 ?auto_434354 ?auto_434355 ?auto_434356 ?auto_434357 ?auto_434358 ?auto_434359 ?auto_434360 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434370 - BLOCK
      ?auto_434371 - BLOCK
      ?auto_434372 - BLOCK
      ?auto_434373 - BLOCK
      ?auto_434374 - BLOCK
      ?auto_434375 - BLOCK
      ?auto_434376 - BLOCK
      ?auto_434377 - BLOCK
    )
    :vars
    (
      ?auto_434378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434377 ?auto_434378 ) ( ON-TABLE ?auto_434370 ) ( ON ?auto_434371 ?auto_434370 ) ( ON ?auto_434372 ?auto_434371 ) ( ON ?auto_434373 ?auto_434372 ) ( not ( = ?auto_434370 ?auto_434371 ) ) ( not ( = ?auto_434370 ?auto_434372 ) ) ( not ( = ?auto_434370 ?auto_434373 ) ) ( not ( = ?auto_434370 ?auto_434374 ) ) ( not ( = ?auto_434370 ?auto_434375 ) ) ( not ( = ?auto_434370 ?auto_434376 ) ) ( not ( = ?auto_434370 ?auto_434377 ) ) ( not ( = ?auto_434370 ?auto_434378 ) ) ( not ( = ?auto_434371 ?auto_434372 ) ) ( not ( = ?auto_434371 ?auto_434373 ) ) ( not ( = ?auto_434371 ?auto_434374 ) ) ( not ( = ?auto_434371 ?auto_434375 ) ) ( not ( = ?auto_434371 ?auto_434376 ) ) ( not ( = ?auto_434371 ?auto_434377 ) ) ( not ( = ?auto_434371 ?auto_434378 ) ) ( not ( = ?auto_434372 ?auto_434373 ) ) ( not ( = ?auto_434372 ?auto_434374 ) ) ( not ( = ?auto_434372 ?auto_434375 ) ) ( not ( = ?auto_434372 ?auto_434376 ) ) ( not ( = ?auto_434372 ?auto_434377 ) ) ( not ( = ?auto_434372 ?auto_434378 ) ) ( not ( = ?auto_434373 ?auto_434374 ) ) ( not ( = ?auto_434373 ?auto_434375 ) ) ( not ( = ?auto_434373 ?auto_434376 ) ) ( not ( = ?auto_434373 ?auto_434377 ) ) ( not ( = ?auto_434373 ?auto_434378 ) ) ( not ( = ?auto_434374 ?auto_434375 ) ) ( not ( = ?auto_434374 ?auto_434376 ) ) ( not ( = ?auto_434374 ?auto_434377 ) ) ( not ( = ?auto_434374 ?auto_434378 ) ) ( not ( = ?auto_434375 ?auto_434376 ) ) ( not ( = ?auto_434375 ?auto_434377 ) ) ( not ( = ?auto_434375 ?auto_434378 ) ) ( not ( = ?auto_434376 ?auto_434377 ) ) ( not ( = ?auto_434376 ?auto_434378 ) ) ( not ( = ?auto_434377 ?auto_434378 ) ) ( ON ?auto_434376 ?auto_434377 ) ( ON ?auto_434375 ?auto_434376 ) ( CLEAR ?auto_434373 ) ( ON ?auto_434374 ?auto_434375 ) ( CLEAR ?auto_434374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_434370 ?auto_434371 ?auto_434372 ?auto_434373 ?auto_434374 )
      ( MAKE-8PILE ?auto_434370 ?auto_434371 ?auto_434372 ?auto_434373 ?auto_434374 ?auto_434375 ?auto_434376 ?auto_434377 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434387 - BLOCK
      ?auto_434388 - BLOCK
      ?auto_434389 - BLOCK
      ?auto_434390 - BLOCK
      ?auto_434391 - BLOCK
      ?auto_434392 - BLOCK
      ?auto_434393 - BLOCK
      ?auto_434394 - BLOCK
    )
    :vars
    (
      ?auto_434395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434394 ?auto_434395 ) ( ON-TABLE ?auto_434387 ) ( ON ?auto_434388 ?auto_434387 ) ( ON ?auto_434389 ?auto_434388 ) ( ON ?auto_434390 ?auto_434389 ) ( not ( = ?auto_434387 ?auto_434388 ) ) ( not ( = ?auto_434387 ?auto_434389 ) ) ( not ( = ?auto_434387 ?auto_434390 ) ) ( not ( = ?auto_434387 ?auto_434391 ) ) ( not ( = ?auto_434387 ?auto_434392 ) ) ( not ( = ?auto_434387 ?auto_434393 ) ) ( not ( = ?auto_434387 ?auto_434394 ) ) ( not ( = ?auto_434387 ?auto_434395 ) ) ( not ( = ?auto_434388 ?auto_434389 ) ) ( not ( = ?auto_434388 ?auto_434390 ) ) ( not ( = ?auto_434388 ?auto_434391 ) ) ( not ( = ?auto_434388 ?auto_434392 ) ) ( not ( = ?auto_434388 ?auto_434393 ) ) ( not ( = ?auto_434388 ?auto_434394 ) ) ( not ( = ?auto_434388 ?auto_434395 ) ) ( not ( = ?auto_434389 ?auto_434390 ) ) ( not ( = ?auto_434389 ?auto_434391 ) ) ( not ( = ?auto_434389 ?auto_434392 ) ) ( not ( = ?auto_434389 ?auto_434393 ) ) ( not ( = ?auto_434389 ?auto_434394 ) ) ( not ( = ?auto_434389 ?auto_434395 ) ) ( not ( = ?auto_434390 ?auto_434391 ) ) ( not ( = ?auto_434390 ?auto_434392 ) ) ( not ( = ?auto_434390 ?auto_434393 ) ) ( not ( = ?auto_434390 ?auto_434394 ) ) ( not ( = ?auto_434390 ?auto_434395 ) ) ( not ( = ?auto_434391 ?auto_434392 ) ) ( not ( = ?auto_434391 ?auto_434393 ) ) ( not ( = ?auto_434391 ?auto_434394 ) ) ( not ( = ?auto_434391 ?auto_434395 ) ) ( not ( = ?auto_434392 ?auto_434393 ) ) ( not ( = ?auto_434392 ?auto_434394 ) ) ( not ( = ?auto_434392 ?auto_434395 ) ) ( not ( = ?auto_434393 ?auto_434394 ) ) ( not ( = ?auto_434393 ?auto_434395 ) ) ( not ( = ?auto_434394 ?auto_434395 ) ) ( ON ?auto_434393 ?auto_434394 ) ( ON ?auto_434392 ?auto_434393 ) ( CLEAR ?auto_434390 ) ( ON ?auto_434391 ?auto_434392 ) ( CLEAR ?auto_434391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_434387 ?auto_434388 ?auto_434389 ?auto_434390 ?auto_434391 )
      ( MAKE-8PILE ?auto_434387 ?auto_434388 ?auto_434389 ?auto_434390 ?auto_434391 ?auto_434392 ?auto_434393 ?auto_434394 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434404 - BLOCK
      ?auto_434405 - BLOCK
      ?auto_434406 - BLOCK
      ?auto_434407 - BLOCK
      ?auto_434408 - BLOCK
      ?auto_434409 - BLOCK
      ?auto_434410 - BLOCK
      ?auto_434411 - BLOCK
    )
    :vars
    (
      ?auto_434412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434411 ?auto_434412 ) ( ON-TABLE ?auto_434404 ) ( ON ?auto_434405 ?auto_434404 ) ( ON ?auto_434406 ?auto_434405 ) ( not ( = ?auto_434404 ?auto_434405 ) ) ( not ( = ?auto_434404 ?auto_434406 ) ) ( not ( = ?auto_434404 ?auto_434407 ) ) ( not ( = ?auto_434404 ?auto_434408 ) ) ( not ( = ?auto_434404 ?auto_434409 ) ) ( not ( = ?auto_434404 ?auto_434410 ) ) ( not ( = ?auto_434404 ?auto_434411 ) ) ( not ( = ?auto_434404 ?auto_434412 ) ) ( not ( = ?auto_434405 ?auto_434406 ) ) ( not ( = ?auto_434405 ?auto_434407 ) ) ( not ( = ?auto_434405 ?auto_434408 ) ) ( not ( = ?auto_434405 ?auto_434409 ) ) ( not ( = ?auto_434405 ?auto_434410 ) ) ( not ( = ?auto_434405 ?auto_434411 ) ) ( not ( = ?auto_434405 ?auto_434412 ) ) ( not ( = ?auto_434406 ?auto_434407 ) ) ( not ( = ?auto_434406 ?auto_434408 ) ) ( not ( = ?auto_434406 ?auto_434409 ) ) ( not ( = ?auto_434406 ?auto_434410 ) ) ( not ( = ?auto_434406 ?auto_434411 ) ) ( not ( = ?auto_434406 ?auto_434412 ) ) ( not ( = ?auto_434407 ?auto_434408 ) ) ( not ( = ?auto_434407 ?auto_434409 ) ) ( not ( = ?auto_434407 ?auto_434410 ) ) ( not ( = ?auto_434407 ?auto_434411 ) ) ( not ( = ?auto_434407 ?auto_434412 ) ) ( not ( = ?auto_434408 ?auto_434409 ) ) ( not ( = ?auto_434408 ?auto_434410 ) ) ( not ( = ?auto_434408 ?auto_434411 ) ) ( not ( = ?auto_434408 ?auto_434412 ) ) ( not ( = ?auto_434409 ?auto_434410 ) ) ( not ( = ?auto_434409 ?auto_434411 ) ) ( not ( = ?auto_434409 ?auto_434412 ) ) ( not ( = ?auto_434410 ?auto_434411 ) ) ( not ( = ?auto_434410 ?auto_434412 ) ) ( not ( = ?auto_434411 ?auto_434412 ) ) ( ON ?auto_434410 ?auto_434411 ) ( ON ?auto_434409 ?auto_434410 ) ( ON ?auto_434408 ?auto_434409 ) ( CLEAR ?auto_434406 ) ( ON ?auto_434407 ?auto_434408 ) ( CLEAR ?auto_434407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_434404 ?auto_434405 ?auto_434406 ?auto_434407 )
      ( MAKE-8PILE ?auto_434404 ?auto_434405 ?auto_434406 ?auto_434407 ?auto_434408 ?auto_434409 ?auto_434410 ?auto_434411 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434421 - BLOCK
      ?auto_434422 - BLOCK
      ?auto_434423 - BLOCK
      ?auto_434424 - BLOCK
      ?auto_434425 - BLOCK
      ?auto_434426 - BLOCK
      ?auto_434427 - BLOCK
      ?auto_434428 - BLOCK
    )
    :vars
    (
      ?auto_434429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434428 ?auto_434429 ) ( ON-TABLE ?auto_434421 ) ( ON ?auto_434422 ?auto_434421 ) ( ON ?auto_434423 ?auto_434422 ) ( not ( = ?auto_434421 ?auto_434422 ) ) ( not ( = ?auto_434421 ?auto_434423 ) ) ( not ( = ?auto_434421 ?auto_434424 ) ) ( not ( = ?auto_434421 ?auto_434425 ) ) ( not ( = ?auto_434421 ?auto_434426 ) ) ( not ( = ?auto_434421 ?auto_434427 ) ) ( not ( = ?auto_434421 ?auto_434428 ) ) ( not ( = ?auto_434421 ?auto_434429 ) ) ( not ( = ?auto_434422 ?auto_434423 ) ) ( not ( = ?auto_434422 ?auto_434424 ) ) ( not ( = ?auto_434422 ?auto_434425 ) ) ( not ( = ?auto_434422 ?auto_434426 ) ) ( not ( = ?auto_434422 ?auto_434427 ) ) ( not ( = ?auto_434422 ?auto_434428 ) ) ( not ( = ?auto_434422 ?auto_434429 ) ) ( not ( = ?auto_434423 ?auto_434424 ) ) ( not ( = ?auto_434423 ?auto_434425 ) ) ( not ( = ?auto_434423 ?auto_434426 ) ) ( not ( = ?auto_434423 ?auto_434427 ) ) ( not ( = ?auto_434423 ?auto_434428 ) ) ( not ( = ?auto_434423 ?auto_434429 ) ) ( not ( = ?auto_434424 ?auto_434425 ) ) ( not ( = ?auto_434424 ?auto_434426 ) ) ( not ( = ?auto_434424 ?auto_434427 ) ) ( not ( = ?auto_434424 ?auto_434428 ) ) ( not ( = ?auto_434424 ?auto_434429 ) ) ( not ( = ?auto_434425 ?auto_434426 ) ) ( not ( = ?auto_434425 ?auto_434427 ) ) ( not ( = ?auto_434425 ?auto_434428 ) ) ( not ( = ?auto_434425 ?auto_434429 ) ) ( not ( = ?auto_434426 ?auto_434427 ) ) ( not ( = ?auto_434426 ?auto_434428 ) ) ( not ( = ?auto_434426 ?auto_434429 ) ) ( not ( = ?auto_434427 ?auto_434428 ) ) ( not ( = ?auto_434427 ?auto_434429 ) ) ( not ( = ?auto_434428 ?auto_434429 ) ) ( ON ?auto_434427 ?auto_434428 ) ( ON ?auto_434426 ?auto_434427 ) ( ON ?auto_434425 ?auto_434426 ) ( CLEAR ?auto_434423 ) ( ON ?auto_434424 ?auto_434425 ) ( CLEAR ?auto_434424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_434421 ?auto_434422 ?auto_434423 ?auto_434424 )
      ( MAKE-8PILE ?auto_434421 ?auto_434422 ?auto_434423 ?auto_434424 ?auto_434425 ?auto_434426 ?auto_434427 ?auto_434428 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434438 - BLOCK
      ?auto_434439 - BLOCK
      ?auto_434440 - BLOCK
      ?auto_434441 - BLOCK
      ?auto_434442 - BLOCK
      ?auto_434443 - BLOCK
      ?auto_434444 - BLOCK
      ?auto_434445 - BLOCK
    )
    :vars
    (
      ?auto_434446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434445 ?auto_434446 ) ( ON-TABLE ?auto_434438 ) ( ON ?auto_434439 ?auto_434438 ) ( not ( = ?auto_434438 ?auto_434439 ) ) ( not ( = ?auto_434438 ?auto_434440 ) ) ( not ( = ?auto_434438 ?auto_434441 ) ) ( not ( = ?auto_434438 ?auto_434442 ) ) ( not ( = ?auto_434438 ?auto_434443 ) ) ( not ( = ?auto_434438 ?auto_434444 ) ) ( not ( = ?auto_434438 ?auto_434445 ) ) ( not ( = ?auto_434438 ?auto_434446 ) ) ( not ( = ?auto_434439 ?auto_434440 ) ) ( not ( = ?auto_434439 ?auto_434441 ) ) ( not ( = ?auto_434439 ?auto_434442 ) ) ( not ( = ?auto_434439 ?auto_434443 ) ) ( not ( = ?auto_434439 ?auto_434444 ) ) ( not ( = ?auto_434439 ?auto_434445 ) ) ( not ( = ?auto_434439 ?auto_434446 ) ) ( not ( = ?auto_434440 ?auto_434441 ) ) ( not ( = ?auto_434440 ?auto_434442 ) ) ( not ( = ?auto_434440 ?auto_434443 ) ) ( not ( = ?auto_434440 ?auto_434444 ) ) ( not ( = ?auto_434440 ?auto_434445 ) ) ( not ( = ?auto_434440 ?auto_434446 ) ) ( not ( = ?auto_434441 ?auto_434442 ) ) ( not ( = ?auto_434441 ?auto_434443 ) ) ( not ( = ?auto_434441 ?auto_434444 ) ) ( not ( = ?auto_434441 ?auto_434445 ) ) ( not ( = ?auto_434441 ?auto_434446 ) ) ( not ( = ?auto_434442 ?auto_434443 ) ) ( not ( = ?auto_434442 ?auto_434444 ) ) ( not ( = ?auto_434442 ?auto_434445 ) ) ( not ( = ?auto_434442 ?auto_434446 ) ) ( not ( = ?auto_434443 ?auto_434444 ) ) ( not ( = ?auto_434443 ?auto_434445 ) ) ( not ( = ?auto_434443 ?auto_434446 ) ) ( not ( = ?auto_434444 ?auto_434445 ) ) ( not ( = ?auto_434444 ?auto_434446 ) ) ( not ( = ?auto_434445 ?auto_434446 ) ) ( ON ?auto_434444 ?auto_434445 ) ( ON ?auto_434443 ?auto_434444 ) ( ON ?auto_434442 ?auto_434443 ) ( ON ?auto_434441 ?auto_434442 ) ( CLEAR ?auto_434439 ) ( ON ?auto_434440 ?auto_434441 ) ( CLEAR ?auto_434440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_434438 ?auto_434439 ?auto_434440 )
      ( MAKE-8PILE ?auto_434438 ?auto_434439 ?auto_434440 ?auto_434441 ?auto_434442 ?auto_434443 ?auto_434444 ?auto_434445 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434455 - BLOCK
      ?auto_434456 - BLOCK
      ?auto_434457 - BLOCK
      ?auto_434458 - BLOCK
      ?auto_434459 - BLOCK
      ?auto_434460 - BLOCK
      ?auto_434461 - BLOCK
      ?auto_434462 - BLOCK
    )
    :vars
    (
      ?auto_434463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434462 ?auto_434463 ) ( ON-TABLE ?auto_434455 ) ( ON ?auto_434456 ?auto_434455 ) ( not ( = ?auto_434455 ?auto_434456 ) ) ( not ( = ?auto_434455 ?auto_434457 ) ) ( not ( = ?auto_434455 ?auto_434458 ) ) ( not ( = ?auto_434455 ?auto_434459 ) ) ( not ( = ?auto_434455 ?auto_434460 ) ) ( not ( = ?auto_434455 ?auto_434461 ) ) ( not ( = ?auto_434455 ?auto_434462 ) ) ( not ( = ?auto_434455 ?auto_434463 ) ) ( not ( = ?auto_434456 ?auto_434457 ) ) ( not ( = ?auto_434456 ?auto_434458 ) ) ( not ( = ?auto_434456 ?auto_434459 ) ) ( not ( = ?auto_434456 ?auto_434460 ) ) ( not ( = ?auto_434456 ?auto_434461 ) ) ( not ( = ?auto_434456 ?auto_434462 ) ) ( not ( = ?auto_434456 ?auto_434463 ) ) ( not ( = ?auto_434457 ?auto_434458 ) ) ( not ( = ?auto_434457 ?auto_434459 ) ) ( not ( = ?auto_434457 ?auto_434460 ) ) ( not ( = ?auto_434457 ?auto_434461 ) ) ( not ( = ?auto_434457 ?auto_434462 ) ) ( not ( = ?auto_434457 ?auto_434463 ) ) ( not ( = ?auto_434458 ?auto_434459 ) ) ( not ( = ?auto_434458 ?auto_434460 ) ) ( not ( = ?auto_434458 ?auto_434461 ) ) ( not ( = ?auto_434458 ?auto_434462 ) ) ( not ( = ?auto_434458 ?auto_434463 ) ) ( not ( = ?auto_434459 ?auto_434460 ) ) ( not ( = ?auto_434459 ?auto_434461 ) ) ( not ( = ?auto_434459 ?auto_434462 ) ) ( not ( = ?auto_434459 ?auto_434463 ) ) ( not ( = ?auto_434460 ?auto_434461 ) ) ( not ( = ?auto_434460 ?auto_434462 ) ) ( not ( = ?auto_434460 ?auto_434463 ) ) ( not ( = ?auto_434461 ?auto_434462 ) ) ( not ( = ?auto_434461 ?auto_434463 ) ) ( not ( = ?auto_434462 ?auto_434463 ) ) ( ON ?auto_434461 ?auto_434462 ) ( ON ?auto_434460 ?auto_434461 ) ( ON ?auto_434459 ?auto_434460 ) ( ON ?auto_434458 ?auto_434459 ) ( CLEAR ?auto_434456 ) ( ON ?auto_434457 ?auto_434458 ) ( CLEAR ?auto_434457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_434455 ?auto_434456 ?auto_434457 )
      ( MAKE-8PILE ?auto_434455 ?auto_434456 ?auto_434457 ?auto_434458 ?auto_434459 ?auto_434460 ?auto_434461 ?auto_434462 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434472 - BLOCK
      ?auto_434473 - BLOCK
      ?auto_434474 - BLOCK
      ?auto_434475 - BLOCK
      ?auto_434476 - BLOCK
      ?auto_434477 - BLOCK
      ?auto_434478 - BLOCK
      ?auto_434479 - BLOCK
    )
    :vars
    (
      ?auto_434480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434479 ?auto_434480 ) ( ON-TABLE ?auto_434472 ) ( not ( = ?auto_434472 ?auto_434473 ) ) ( not ( = ?auto_434472 ?auto_434474 ) ) ( not ( = ?auto_434472 ?auto_434475 ) ) ( not ( = ?auto_434472 ?auto_434476 ) ) ( not ( = ?auto_434472 ?auto_434477 ) ) ( not ( = ?auto_434472 ?auto_434478 ) ) ( not ( = ?auto_434472 ?auto_434479 ) ) ( not ( = ?auto_434472 ?auto_434480 ) ) ( not ( = ?auto_434473 ?auto_434474 ) ) ( not ( = ?auto_434473 ?auto_434475 ) ) ( not ( = ?auto_434473 ?auto_434476 ) ) ( not ( = ?auto_434473 ?auto_434477 ) ) ( not ( = ?auto_434473 ?auto_434478 ) ) ( not ( = ?auto_434473 ?auto_434479 ) ) ( not ( = ?auto_434473 ?auto_434480 ) ) ( not ( = ?auto_434474 ?auto_434475 ) ) ( not ( = ?auto_434474 ?auto_434476 ) ) ( not ( = ?auto_434474 ?auto_434477 ) ) ( not ( = ?auto_434474 ?auto_434478 ) ) ( not ( = ?auto_434474 ?auto_434479 ) ) ( not ( = ?auto_434474 ?auto_434480 ) ) ( not ( = ?auto_434475 ?auto_434476 ) ) ( not ( = ?auto_434475 ?auto_434477 ) ) ( not ( = ?auto_434475 ?auto_434478 ) ) ( not ( = ?auto_434475 ?auto_434479 ) ) ( not ( = ?auto_434475 ?auto_434480 ) ) ( not ( = ?auto_434476 ?auto_434477 ) ) ( not ( = ?auto_434476 ?auto_434478 ) ) ( not ( = ?auto_434476 ?auto_434479 ) ) ( not ( = ?auto_434476 ?auto_434480 ) ) ( not ( = ?auto_434477 ?auto_434478 ) ) ( not ( = ?auto_434477 ?auto_434479 ) ) ( not ( = ?auto_434477 ?auto_434480 ) ) ( not ( = ?auto_434478 ?auto_434479 ) ) ( not ( = ?auto_434478 ?auto_434480 ) ) ( not ( = ?auto_434479 ?auto_434480 ) ) ( ON ?auto_434478 ?auto_434479 ) ( ON ?auto_434477 ?auto_434478 ) ( ON ?auto_434476 ?auto_434477 ) ( ON ?auto_434475 ?auto_434476 ) ( ON ?auto_434474 ?auto_434475 ) ( CLEAR ?auto_434472 ) ( ON ?auto_434473 ?auto_434474 ) ( CLEAR ?auto_434473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434472 ?auto_434473 )
      ( MAKE-8PILE ?auto_434472 ?auto_434473 ?auto_434474 ?auto_434475 ?auto_434476 ?auto_434477 ?auto_434478 ?auto_434479 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434489 - BLOCK
      ?auto_434490 - BLOCK
      ?auto_434491 - BLOCK
      ?auto_434492 - BLOCK
      ?auto_434493 - BLOCK
      ?auto_434494 - BLOCK
      ?auto_434495 - BLOCK
      ?auto_434496 - BLOCK
    )
    :vars
    (
      ?auto_434497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434496 ?auto_434497 ) ( ON-TABLE ?auto_434489 ) ( not ( = ?auto_434489 ?auto_434490 ) ) ( not ( = ?auto_434489 ?auto_434491 ) ) ( not ( = ?auto_434489 ?auto_434492 ) ) ( not ( = ?auto_434489 ?auto_434493 ) ) ( not ( = ?auto_434489 ?auto_434494 ) ) ( not ( = ?auto_434489 ?auto_434495 ) ) ( not ( = ?auto_434489 ?auto_434496 ) ) ( not ( = ?auto_434489 ?auto_434497 ) ) ( not ( = ?auto_434490 ?auto_434491 ) ) ( not ( = ?auto_434490 ?auto_434492 ) ) ( not ( = ?auto_434490 ?auto_434493 ) ) ( not ( = ?auto_434490 ?auto_434494 ) ) ( not ( = ?auto_434490 ?auto_434495 ) ) ( not ( = ?auto_434490 ?auto_434496 ) ) ( not ( = ?auto_434490 ?auto_434497 ) ) ( not ( = ?auto_434491 ?auto_434492 ) ) ( not ( = ?auto_434491 ?auto_434493 ) ) ( not ( = ?auto_434491 ?auto_434494 ) ) ( not ( = ?auto_434491 ?auto_434495 ) ) ( not ( = ?auto_434491 ?auto_434496 ) ) ( not ( = ?auto_434491 ?auto_434497 ) ) ( not ( = ?auto_434492 ?auto_434493 ) ) ( not ( = ?auto_434492 ?auto_434494 ) ) ( not ( = ?auto_434492 ?auto_434495 ) ) ( not ( = ?auto_434492 ?auto_434496 ) ) ( not ( = ?auto_434492 ?auto_434497 ) ) ( not ( = ?auto_434493 ?auto_434494 ) ) ( not ( = ?auto_434493 ?auto_434495 ) ) ( not ( = ?auto_434493 ?auto_434496 ) ) ( not ( = ?auto_434493 ?auto_434497 ) ) ( not ( = ?auto_434494 ?auto_434495 ) ) ( not ( = ?auto_434494 ?auto_434496 ) ) ( not ( = ?auto_434494 ?auto_434497 ) ) ( not ( = ?auto_434495 ?auto_434496 ) ) ( not ( = ?auto_434495 ?auto_434497 ) ) ( not ( = ?auto_434496 ?auto_434497 ) ) ( ON ?auto_434495 ?auto_434496 ) ( ON ?auto_434494 ?auto_434495 ) ( ON ?auto_434493 ?auto_434494 ) ( ON ?auto_434492 ?auto_434493 ) ( ON ?auto_434491 ?auto_434492 ) ( CLEAR ?auto_434489 ) ( ON ?auto_434490 ?auto_434491 ) ( CLEAR ?auto_434490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434489 ?auto_434490 )
      ( MAKE-8PILE ?auto_434489 ?auto_434490 ?auto_434491 ?auto_434492 ?auto_434493 ?auto_434494 ?auto_434495 ?auto_434496 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434506 - BLOCK
      ?auto_434507 - BLOCK
      ?auto_434508 - BLOCK
      ?auto_434509 - BLOCK
      ?auto_434510 - BLOCK
      ?auto_434511 - BLOCK
      ?auto_434512 - BLOCK
      ?auto_434513 - BLOCK
    )
    :vars
    (
      ?auto_434514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434513 ?auto_434514 ) ( not ( = ?auto_434506 ?auto_434507 ) ) ( not ( = ?auto_434506 ?auto_434508 ) ) ( not ( = ?auto_434506 ?auto_434509 ) ) ( not ( = ?auto_434506 ?auto_434510 ) ) ( not ( = ?auto_434506 ?auto_434511 ) ) ( not ( = ?auto_434506 ?auto_434512 ) ) ( not ( = ?auto_434506 ?auto_434513 ) ) ( not ( = ?auto_434506 ?auto_434514 ) ) ( not ( = ?auto_434507 ?auto_434508 ) ) ( not ( = ?auto_434507 ?auto_434509 ) ) ( not ( = ?auto_434507 ?auto_434510 ) ) ( not ( = ?auto_434507 ?auto_434511 ) ) ( not ( = ?auto_434507 ?auto_434512 ) ) ( not ( = ?auto_434507 ?auto_434513 ) ) ( not ( = ?auto_434507 ?auto_434514 ) ) ( not ( = ?auto_434508 ?auto_434509 ) ) ( not ( = ?auto_434508 ?auto_434510 ) ) ( not ( = ?auto_434508 ?auto_434511 ) ) ( not ( = ?auto_434508 ?auto_434512 ) ) ( not ( = ?auto_434508 ?auto_434513 ) ) ( not ( = ?auto_434508 ?auto_434514 ) ) ( not ( = ?auto_434509 ?auto_434510 ) ) ( not ( = ?auto_434509 ?auto_434511 ) ) ( not ( = ?auto_434509 ?auto_434512 ) ) ( not ( = ?auto_434509 ?auto_434513 ) ) ( not ( = ?auto_434509 ?auto_434514 ) ) ( not ( = ?auto_434510 ?auto_434511 ) ) ( not ( = ?auto_434510 ?auto_434512 ) ) ( not ( = ?auto_434510 ?auto_434513 ) ) ( not ( = ?auto_434510 ?auto_434514 ) ) ( not ( = ?auto_434511 ?auto_434512 ) ) ( not ( = ?auto_434511 ?auto_434513 ) ) ( not ( = ?auto_434511 ?auto_434514 ) ) ( not ( = ?auto_434512 ?auto_434513 ) ) ( not ( = ?auto_434512 ?auto_434514 ) ) ( not ( = ?auto_434513 ?auto_434514 ) ) ( ON ?auto_434512 ?auto_434513 ) ( ON ?auto_434511 ?auto_434512 ) ( ON ?auto_434510 ?auto_434511 ) ( ON ?auto_434509 ?auto_434510 ) ( ON ?auto_434508 ?auto_434509 ) ( ON ?auto_434507 ?auto_434508 ) ( ON ?auto_434506 ?auto_434507 ) ( CLEAR ?auto_434506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434506 )
      ( MAKE-8PILE ?auto_434506 ?auto_434507 ?auto_434508 ?auto_434509 ?auto_434510 ?auto_434511 ?auto_434512 ?auto_434513 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_434523 - BLOCK
      ?auto_434524 - BLOCK
      ?auto_434525 - BLOCK
      ?auto_434526 - BLOCK
      ?auto_434527 - BLOCK
      ?auto_434528 - BLOCK
      ?auto_434529 - BLOCK
      ?auto_434530 - BLOCK
    )
    :vars
    (
      ?auto_434531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434530 ?auto_434531 ) ( not ( = ?auto_434523 ?auto_434524 ) ) ( not ( = ?auto_434523 ?auto_434525 ) ) ( not ( = ?auto_434523 ?auto_434526 ) ) ( not ( = ?auto_434523 ?auto_434527 ) ) ( not ( = ?auto_434523 ?auto_434528 ) ) ( not ( = ?auto_434523 ?auto_434529 ) ) ( not ( = ?auto_434523 ?auto_434530 ) ) ( not ( = ?auto_434523 ?auto_434531 ) ) ( not ( = ?auto_434524 ?auto_434525 ) ) ( not ( = ?auto_434524 ?auto_434526 ) ) ( not ( = ?auto_434524 ?auto_434527 ) ) ( not ( = ?auto_434524 ?auto_434528 ) ) ( not ( = ?auto_434524 ?auto_434529 ) ) ( not ( = ?auto_434524 ?auto_434530 ) ) ( not ( = ?auto_434524 ?auto_434531 ) ) ( not ( = ?auto_434525 ?auto_434526 ) ) ( not ( = ?auto_434525 ?auto_434527 ) ) ( not ( = ?auto_434525 ?auto_434528 ) ) ( not ( = ?auto_434525 ?auto_434529 ) ) ( not ( = ?auto_434525 ?auto_434530 ) ) ( not ( = ?auto_434525 ?auto_434531 ) ) ( not ( = ?auto_434526 ?auto_434527 ) ) ( not ( = ?auto_434526 ?auto_434528 ) ) ( not ( = ?auto_434526 ?auto_434529 ) ) ( not ( = ?auto_434526 ?auto_434530 ) ) ( not ( = ?auto_434526 ?auto_434531 ) ) ( not ( = ?auto_434527 ?auto_434528 ) ) ( not ( = ?auto_434527 ?auto_434529 ) ) ( not ( = ?auto_434527 ?auto_434530 ) ) ( not ( = ?auto_434527 ?auto_434531 ) ) ( not ( = ?auto_434528 ?auto_434529 ) ) ( not ( = ?auto_434528 ?auto_434530 ) ) ( not ( = ?auto_434528 ?auto_434531 ) ) ( not ( = ?auto_434529 ?auto_434530 ) ) ( not ( = ?auto_434529 ?auto_434531 ) ) ( not ( = ?auto_434530 ?auto_434531 ) ) ( ON ?auto_434529 ?auto_434530 ) ( ON ?auto_434528 ?auto_434529 ) ( ON ?auto_434527 ?auto_434528 ) ( ON ?auto_434526 ?auto_434527 ) ( ON ?auto_434525 ?auto_434526 ) ( ON ?auto_434524 ?auto_434525 ) ( ON ?auto_434523 ?auto_434524 ) ( CLEAR ?auto_434523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434523 )
      ( MAKE-8PILE ?auto_434523 ?auto_434524 ?auto_434525 ?auto_434526 ?auto_434527 ?auto_434528 ?auto_434529 ?auto_434530 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434541 - BLOCK
      ?auto_434542 - BLOCK
      ?auto_434543 - BLOCK
      ?auto_434544 - BLOCK
      ?auto_434545 - BLOCK
      ?auto_434546 - BLOCK
      ?auto_434547 - BLOCK
      ?auto_434548 - BLOCK
      ?auto_434549 - BLOCK
    )
    :vars
    (
      ?auto_434550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434548 ) ( ON ?auto_434549 ?auto_434550 ) ( CLEAR ?auto_434549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434541 ) ( ON ?auto_434542 ?auto_434541 ) ( ON ?auto_434543 ?auto_434542 ) ( ON ?auto_434544 ?auto_434543 ) ( ON ?auto_434545 ?auto_434544 ) ( ON ?auto_434546 ?auto_434545 ) ( ON ?auto_434547 ?auto_434546 ) ( ON ?auto_434548 ?auto_434547 ) ( not ( = ?auto_434541 ?auto_434542 ) ) ( not ( = ?auto_434541 ?auto_434543 ) ) ( not ( = ?auto_434541 ?auto_434544 ) ) ( not ( = ?auto_434541 ?auto_434545 ) ) ( not ( = ?auto_434541 ?auto_434546 ) ) ( not ( = ?auto_434541 ?auto_434547 ) ) ( not ( = ?auto_434541 ?auto_434548 ) ) ( not ( = ?auto_434541 ?auto_434549 ) ) ( not ( = ?auto_434541 ?auto_434550 ) ) ( not ( = ?auto_434542 ?auto_434543 ) ) ( not ( = ?auto_434542 ?auto_434544 ) ) ( not ( = ?auto_434542 ?auto_434545 ) ) ( not ( = ?auto_434542 ?auto_434546 ) ) ( not ( = ?auto_434542 ?auto_434547 ) ) ( not ( = ?auto_434542 ?auto_434548 ) ) ( not ( = ?auto_434542 ?auto_434549 ) ) ( not ( = ?auto_434542 ?auto_434550 ) ) ( not ( = ?auto_434543 ?auto_434544 ) ) ( not ( = ?auto_434543 ?auto_434545 ) ) ( not ( = ?auto_434543 ?auto_434546 ) ) ( not ( = ?auto_434543 ?auto_434547 ) ) ( not ( = ?auto_434543 ?auto_434548 ) ) ( not ( = ?auto_434543 ?auto_434549 ) ) ( not ( = ?auto_434543 ?auto_434550 ) ) ( not ( = ?auto_434544 ?auto_434545 ) ) ( not ( = ?auto_434544 ?auto_434546 ) ) ( not ( = ?auto_434544 ?auto_434547 ) ) ( not ( = ?auto_434544 ?auto_434548 ) ) ( not ( = ?auto_434544 ?auto_434549 ) ) ( not ( = ?auto_434544 ?auto_434550 ) ) ( not ( = ?auto_434545 ?auto_434546 ) ) ( not ( = ?auto_434545 ?auto_434547 ) ) ( not ( = ?auto_434545 ?auto_434548 ) ) ( not ( = ?auto_434545 ?auto_434549 ) ) ( not ( = ?auto_434545 ?auto_434550 ) ) ( not ( = ?auto_434546 ?auto_434547 ) ) ( not ( = ?auto_434546 ?auto_434548 ) ) ( not ( = ?auto_434546 ?auto_434549 ) ) ( not ( = ?auto_434546 ?auto_434550 ) ) ( not ( = ?auto_434547 ?auto_434548 ) ) ( not ( = ?auto_434547 ?auto_434549 ) ) ( not ( = ?auto_434547 ?auto_434550 ) ) ( not ( = ?auto_434548 ?auto_434549 ) ) ( not ( = ?auto_434548 ?auto_434550 ) ) ( not ( = ?auto_434549 ?auto_434550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434549 ?auto_434550 )
      ( !STACK ?auto_434549 ?auto_434548 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434560 - BLOCK
      ?auto_434561 - BLOCK
      ?auto_434562 - BLOCK
      ?auto_434563 - BLOCK
      ?auto_434564 - BLOCK
      ?auto_434565 - BLOCK
      ?auto_434566 - BLOCK
      ?auto_434567 - BLOCK
      ?auto_434568 - BLOCK
    )
    :vars
    (
      ?auto_434569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434567 ) ( ON ?auto_434568 ?auto_434569 ) ( CLEAR ?auto_434568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434560 ) ( ON ?auto_434561 ?auto_434560 ) ( ON ?auto_434562 ?auto_434561 ) ( ON ?auto_434563 ?auto_434562 ) ( ON ?auto_434564 ?auto_434563 ) ( ON ?auto_434565 ?auto_434564 ) ( ON ?auto_434566 ?auto_434565 ) ( ON ?auto_434567 ?auto_434566 ) ( not ( = ?auto_434560 ?auto_434561 ) ) ( not ( = ?auto_434560 ?auto_434562 ) ) ( not ( = ?auto_434560 ?auto_434563 ) ) ( not ( = ?auto_434560 ?auto_434564 ) ) ( not ( = ?auto_434560 ?auto_434565 ) ) ( not ( = ?auto_434560 ?auto_434566 ) ) ( not ( = ?auto_434560 ?auto_434567 ) ) ( not ( = ?auto_434560 ?auto_434568 ) ) ( not ( = ?auto_434560 ?auto_434569 ) ) ( not ( = ?auto_434561 ?auto_434562 ) ) ( not ( = ?auto_434561 ?auto_434563 ) ) ( not ( = ?auto_434561 ?auto_434564 ) ) ( not ( = ?auto_434561 ?auto_434565 ) ) ( not ( = ?auto_434561 ?auto_434566 ) ) ( not ( = ?auto_434561 ?auto_434567 ) ) ( not ( = ?auto_434561 ?auto_434568 ) ) ( not ( = ?auto_434561 ?auto_434569 ) ) ( not ( = ?auto_434562 ?auto_434563 ) ) ( not ( = ?auto_434562 ?auto_434564 ) ) ( not ( = ?auto_434562 ?auto_434565 ) ) ( not ( = ?auto_434562 ?auto_434566 ) ) ( not ( = ?auto_434562 ?auto_434567 ) ) ( not ( = ?auto_434562 ?auto_434568 ) ) ( not ( = ?auto_434562 ?auto_434569 ) ) ( not ( = ?auto_434563 ?auto_434564 ) ) ( not ( = ?auto_434563 ?auto_434565 ) ) ( not ( = ?auto_434563 ?auto_434566 ) ) ( not ( = ?auto_434563 ?auto_434567 ) ) ( not ( = ?auto_434563 ?auto_434568 ) ) ( not ( = ?auto_434563 ?auto_434569 ) ) ( not ( = ?auto_434564 ?auto_434565 ) ) ( not ( = ?auto_434564 ?auto_434566 ) ) ( not ( = ?auto_434564 ?auto_434567 ) ) ( not ( = ?auto_434564 ?auto_434568 ) ) ( not ( = ?auto_434564 ?auto_434569 ) ) ( not ( = ?auto_434565 ?auto_434566 ) ) ( not ( = ?auto_434565 ?auto_434567 ) ) ( not ( = ?auto_434565 ?auto_434568 ) ) ( not ( = ?auto_434565 ?auto_434569 ) ) ( not ( = ?auto_434566 ?auto_434567 ) ) ( not ( = ?auto_434566 ?auto_434568 ) ) ( not ( = ?auto_434566 ?auto_434569 ) ) ( not ( = ?auto_434567 ?auto_434568 ) ) ( not ( = ?auto_434567 ?auto_434569 ) ) ( not ( = ?auto_434568 ?auto_434569 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434568 ?auto_434569 )
      ( !STACK ?auto_434568 ?auto_434567 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434579 - BLOCK
      ?auto_434580 - BLOCK
      ?auto_434581 - BLOCK
      ?auto_434582 - BLOCK
      ?auto_434583 - BLOCK
      ?auto_434584 - BLOCK
      ?auto_434585 - BLOCK
      ?auto_434586 - BLOCK
      ?auto_434587 - BLOCK
    )
    :vars
    (
      ?auto_434588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434587 ?auto_434588 ) ( ON-TABLE ?auto_434579 ) ( ON ?auto_434580 ?auto_434579 ) ( ON ?auto_434581 ?auto_434580 ) ( ON ?auto_434582 ?auto_434581 ) ( ON ?auto_434583 ?auto_434582 ) ( ON ?auto_434584 ?auto_434583 ) ( ON ?auto_434585 ?auto_434584 ) ( not ( = ?auto_434579 ?auto_434580 ) ) ( not ( = ?auto_434579 ?auto_434581 ) ) ( not ( = ?auto_434579 ?auto_434582 ) ) ( not ( = ?auto_434579 ?auto_434583 ) ) ( not ( = ?auto_434579 ?auto_434584 ) ) ( not ( = ?auto_434579 ?auto_434585 ) ) ( not ( = ?auto_434579 ?auto_434586 ) ) ( not ( = ?auto_434579 ?auto_434587 ) ) ( not ( = ?auto_434579 ?auto_434588 ) ) ( not ( = ?auto_434580 ?auto_434581 ) ) ( not ( = ?auto_434580 ?auto_434582 ) ) ( not ( = ?auto_434580 ?auto_434583 ) ) ( not ( = ?auto_434580 ?auto_434584 ) ) ( not ( = ?auto_434580 ?auto_434585 ) ) ( not ( = ?auto_434580 ?auto_434586 ) ) ( not ( = ?auto_434580 ?auto_434587 ) ) ( not ( = ?auto_434580 ?auto_434588 ) ) ( not ( = ?auto_434581 ?auto_434582 ) ) ( not ( = ?auto_434581 ?auto_434583 ) ) ( not ( = ?auto_434581 ?auto_434584 ) ) ( not ( = ?auto_434581 ?auto_434585 ) ) ( not ( = ?auto_434581 ?auto_434586 ) ) ( not ( = ?auto_434581 ?auto_434587 ) ) ( not ( = ?auto_434581 ?auto_434588 ) ) ( not ( = ?auto_434582 ?auto_434583 ) ) ( not ( = ?auto_434582 ?auto_434584 ) ) ( not ( = ?auto_434582 ?auto_434585 ) ) ( not ( = ?auto_434582 ?auto_434586 ) ) ( not ( = ?auto_434582 ?auto_434587 ) ) ( not ( = ?auto_434582 ?auto_434588 ) ) ( not ( = ?auto_434583 ?auto_434584 ) ) ( not ( = ?auto_434583 ?auto_434585 ) ) ( not ( = ?auto_434583 ?auto_434586 ) ) ( not ( = ?auto_434583 ?auto_434587 ) ) ( not ( = ?auto_434583 ?auto_434588 ) ) ( not ( = ?auto_434584 ?auto_434585 ) ) ( not ( = ?auto_434584 ?auto_434586 ) ) ( not ( = ?auto_434584 ?auto_434587 ) ) ( not ( = ?auto_434584 ?auto_434588 ) ) ( not ( = ?auto_434585 ?auto_434586 ) ) ( not ( = ?auto_434585 ?auto_434587 ) ) ( not ( = ?auto_434585 ?auto_434588 ) ) ( not ( = ?auto_434586 ?auto_434587 ) ) ( not ( = ?auto_434586 ?auto_434588 ) ) ( not ( = ?auto_434587 ?auto_434588 ) ) ( CLEAR ?auto_434585 ) ( ON ?auto_434586 ?auto_434587 ) ( CLEAR ?auto_434586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_434579 ?auto_434580 ?auto_434581 ?auto_434582 ?auto_434583 ?auto_434584 ?auto_434585 ?auto_434586 )
      ( MAKE-9PILE ?auto_434579 ?auto_434580 ?auto_434581 ?auto_434582 ?auto_434583 ?auto_434584 ?auto_434585 ?auto_434586 ?auto_434587 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434598 - BLOCK
      ?auto_434599 - BLOCK
      ?auto_434600 - BLOCK
      ?auto_434601 - BLOCK
      ?auto_434602 - BLOCK
      ?auto_434603 - BLOCK
      ?auto_434604 - BLOCK
      ?auto_434605 - BLOCK
      ?auto_434606 - BLOCK
    )
    :vars
    (
      ?auto_434607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434606 ?auto_434607 ) ( ON-TABLE ?auto_434598 ) ( ON ?auto_434599 ?auto_434598 ) ( ON ?auto_434600 ?auto_434599 ) ( ON ?auto_434601 ?auto_434600 ) ( ON ?auto_434602 ?auto_434601 ) ( ON ?auto_434603 ?auto_434602 ) ( ON ?auto_434604 ?auto_434603 ) ( not ( = ?auto_434598 ?auto_434599 ) ) ( not ( = ?auto_434598 ?auto_434600 ) ) ( not ( = ?auto_434598 ?auto_434601 ) ) ( not ( = ?auto_434598 ?auto_434602 ) ) ( not ( = ?auto_434598 ?auto_434603 ) ) ( not ( = ?auto_434598 ?auto_434604 ) ) ( not ( = ?auto_434598 ?auto_434605 ) ) ( not ( = ?auto_434598 ?auto_434606 ) ) ( not ( = ?auto_434598 ?auto_434607 ) ) ( not ( = ?auto_434599 ?auto_434600 ) ) ( not ( = ?auto_434599 ?auto_434601 ) ) ( not ( = ?auto_434599 ?auto_434602 ) ) ( not ( = ?auto_434599 ?auto_434603 ) ) ( not ( = ?auto_434599 ?auto_434604 ) ) ( not ( = ?auto_434599 ?auto_434605 ) ) ( not ( = ?auto_434599 ?auto_434606 ) ) ( not ( = ?auto_434599 ?auto_434607 ) ) ( not ( = ?auto_434600 ?auto_434601 ) ) ( not ( = ?auto_434600 ?auto_434602 ) ) ( not ( = ?auto_434600 ?auto_434603 ) ) ( not ( = ?auto_434600 ?auto_434604 ) ) ( not ( = ?auto_434600 ?auto_434605 ) ) ( not ( = ?auto_434600 ?auto_434606 ) ) ( not ( = ?auto_434600 ?auto_434607 ) ) ( not ( = ?auto_434601 ?auto_434602 ) ) ( not ( = ?auto_434601 ?auto_434603 ) ) ( not ( = ?auto_434601 ?auto_434604 ) ) ( not ( = ?auto_434601 ?auto_434605 ) ) ( not ( = ?auto_434601 ?auto_434606 ) ) ( not ( = ?auto_434601 ?auto_434607 ) ) ( not ( = ?auto_434602 ?auto_434603 ) ) ( not ( = ?auto_434602 ?auto_434604 ) ) ( not ( = ?auto_434602 ?auto_434605 ) ) ( not ( = ?auto_434602 ?auto_434606 ) ) ( not ( = ?auto_434602 ?auto_434607 ) ) ( not ( = ?auto_434603 ?auto_434604 ) ) ( not ( = ?auto_434603 ?auto_434605 ) ) ( not ( = ?auto_434603 ?auto_434606 ) ) ( not ( = ?auto_434603 ?auto_434607 ) ) ( not ( = ?auto_434604 ?auto_434605 ) ) ( not ( = ?auto_434604 ?auto_434606 ) ) ( not ( = ?auto_434604 ?auto_434607 ) ) ( not ( = ?auto_434605 ?auto_434606 ) ) ( not ( = ?auto_434605 ?auto_434607 ) ) ( not ( = ?auto_434606 ?auto_434607 ) ) ( CLEAR ?auto_434604 ) ( ON ?auto_434605 ?auto_434606 ) ( CLEAR ?auto_434605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_434598 ?auto_434599 ?auto_434600 ?auto_434601 ?auto_434602 ?auto_434603 ?auto_434604 ?auto_434605 )
      ( MAKE-9PILE ?auto_434598 ?auto_434599 ?auto_434600 ?auto_434601 ?auto_434602 ?auto_434603 ?auto_434604 ?auto_434605 ?auto_434606 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434617 - BLOCK
      ?auto_434618 - BLOCK
      ?auto_434619 - BLOCK
      ?auto_434620 - BLOCK
      ?auto_434621 - BLOCK
      ?auto_434622 - BLOCK
      ?auto_434623 - BLOCK
      ?auto_434624 - BLOCK
      ?auto_434625 - BLOCK
    )
    :vars
    (
      ?auto_434626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434625 ?auto_434626 ) ( ON-TABLE ?auto_434617 ) ( ON ?auto_434618 ?auto_434617 ) ( ON ?auto_434619 ?auto_434618 ) ( ON ?auto_434620 ?auto_434619 ) ( ON ?auto_434621 ?auto_434620 ) ( ON ?auto_434622 ?auto_434621 ) ( not ( = ?auto_434617 ?auto_434618 ) ) ( not ( = ?auto_434617 ?auto_434619 ) ) ( not ( = ?auto_434617 ?auto_434620 ) ) ( not ( = ?auto_434617 ?auto_434621 ) ) ( not ( = ?auto_434617 ?auto_434622 ) ) ( not ( = ?auto_434617 ?auto_434623 ) ) ( not ( = ?auto_434617 ?auto_434624 ) ) ( not ( = ?auto_434617 ?auto_434625 ) ) ( not ( = ?auto_434617 ?auto_434626 ) ) ( not ( = ?auto_434618 ?auto_434619 ) ) ( not ( = ?auto_434618 ?auto_434620 ) ) ( not ( = ?auto_434618 ?auto_434621 ) ) ( not ( = ?auto_434618 ?auto_434622 ) ) ( not ( = ?auto_434618 ?auto_434623 ) ) ( not ( = ?auto_434618 ?auto_434624 ) ) ( not ( = ?auto_434618 ?auto_434625 ) ) ( not ( = ?auto_434618 ?auto_434626 ) ) ( not ( = ?auto_434619 ?auto_434620 ) ) ( not ( = ?auto_434619 ?auto_434621 ) ) ( not ( = ?auto_434619 ?auto_434622 ) ) ( not ( = ?auto_434619 ?auto_434623 ) ) ( not ( = ?auto_434619 ?auto_434624 ) ) ( not ( = ?auto_434619 ?auto_434625 ) ) ( not ( = ?auto_434619 ?auto_434626 ) ) ( not ( = ?auto_434620 ?auto_434621 ) ) ( not ( = ?auto_434620 ?auto_434622 ) ) ( not ( = ?auto_434620 ?auto_434623 ) ) ( not ( = ?auto_434620 ?auto_434624 ) ) ( not ( = ?auto_434620 ?auto_434625 ) ) ( not ( = ?auto_434620 ?auto_434626 ) ) ( not ( = ?auto_434621 ?auto_434622 ) ) ( not ( = ?auto_434621 ?auto_434623 ) ) ( not ( = ?auto_434621 ?auto_434624 ) ) ( not ( = ?auto_434621 ?auto_434625 ) ) ( not ( = ?auto_434621 ?auto_434626 ) ) ( not ( = ?auto_434622 ?auto_434623 ) ) ( not ( = ?auto_434622 ?auto_434624 ) ) ( not ( = ?auto_434622 ?auto_434625 ) ) ( not ( = ?auto_434622 ?auto_434626 ) ) ( not ( = ?auto_434623 ?auto_434624 ) ) ( not ( = ?auto_434623 ?auto_434625 ) ) ( not ( = ?auto_434623 ?auto_434626 ) ) ( not ( = ?auto_434624 ?auto_434625 ) ) ( not ( = ?auto_434624 ?auto_434626 ) ) ( not ( = ?auto_434625 ?auto_434626 ) ) ( ON ?auto_434624 ?auto_434625 ) ( CLEAR ?auto_434622 ) ( ON ?auto_434623 ?auto_434624 ) ( CLEAR ?auto_434623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_434617 ?auto_434618 ?auto_434619 ?auto_434620 ?auto_434621 ?auto_434622 ?auto_434623 )
      ( MAKE-9PILE ?auto_434617 ?auto_434618 ?auto_434619 ?auto_434620 ?auto_434621 ?auto_434622 ?auto_434623 ?auto_434624 ?auto_434625 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434636 - BLOCK
      ?auto_434637 - BLOCK
      ?auto_434638 - BLOCK
      ?auto_434639 - BLOCK
      ?auto_434640 - BLOCK
      ?auto_434641 - BLOCK
      ?auto_434642 - BLOCK
      ?auto_434643 - BLOCK
      ?auto_434644 - BLOCK
    )
    :vars
    (
      ?auto_434645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434644 ?auto_434645 ) ( ON-TABLE ?auto_434636 ) ( ON ?auto_434637 ?auto_434636 ) ( ON ?auto_434638 ?auto_434637 ) ( ON ?auto_434639 ?auto_434638 ) ( ON ?auto_434640 ?auto_434639 ) ( ON ?auto_434641 ?auto_434640 ) ( not ( = ?auto_434636 ?auto_434637 ) ) ( not ( = ?auto_434636 ?auto_434638 ) ) ( not ( = ?auto_434636 ?auto_434639 ) ) ( not ( = ?auto_434636 ?auto_434640 ) ) ( not ( = ?auto_434636 ?auto_434641 ) ) ( not ( = ?auto_434636 ?auto_434642 ) ) ( not ( = ?auto_434636 ?auto_434643 ) ) ( not ( = ?auto_434636 ?auto_434644 ) ) ( not ( = ?auto_434636 ?auto_434645 ) ) ( not ( = ?auto_434637 ?auto_434638 ) ) ( not ( = ?auto_434637 ?auto_434639 ) ) ( not ( = ?auto_434637 ?auto_434640 ) ) ( not ( = ?auto_434637 ?auto_434641 ) ) ( not ( = ?auto_434637 ?auto_434642 ) ) ( not ( = ?auto_434637 ?auto_434643 ) ) ( not ( = ?auto_434637 ?auto_434644 ) ) ( not ( = ?auto_434637 ?auto_434645 ) ) ( not ( = ?auto_434638 ?auto_434639 ) ) ( not ( = ?auto_434638 ?auto_434640 ) ) ( not ( = ?auto_434638 ?auto_434641 ) ) ( not ( = ?auto_434638 ?auto_434642 ) ) ( not ( = ?auto_434638 ?auto_434643 ) ) ( not ( = ?auto_434638 ?auto_434644 ) ) ( not ( = ?auto_434638 ?auto_434645 ) ) ( not ( = ?auto_434639 ?auto_434640 ) ) ( not ( = ?auto_434639 ?auto_434641 ) ) ( not ( = ?auto_434639 ?auto_434642 ) ) ( not ( = ?auto_434639 ?auto_434643 ) ) ( not ( = ?auto_434639 ?auto_434644 ) ) ( not ( = ?auto_434639 ?auto_434645 ) ) ( not ( = ?auto_434640 ?auto_434641 ) ) ( not ( = ?auto_434640 ?auto_434642 ) ) ( not ( = ?auto_434640 ?auto_434643 ) ) ( not ( = ?auto_434640 ?auto_434644 ) ) ( not ( = ?auto_434640 ?auto_434645 ) ) ( not ( = ?auto_434641 ?auto_434642 ) ) ( not ( = ?auto_434641 ?auto_434643 ) ) ( not ( = ?auto_434641 ?auto_434644 ) ) ( not ( = ?auto_434641 ?auto_434645 ) ) ( not ( = ?auto_434642 ?auto_434643 ) ) ( not ( = ?auto_434642 ?auto_434644 ) ) ( not ( = ?auto_434642 ?auto_434645 ) ) ( not ( = ?auto_434643 ?auto_434644 ) ) ( not ( = ?auto_434643 ?auto_434645 ) ) ( not ( = ?auto_434644 ?auto_434645 ) ) ( ON ?auto_434643 ?auto_434644 ) ( CLEAR ?auto_434641 ) ( ON ?auto_434642 ?auto_434643 ) ( CLEAR ?auto_434642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_434636 ?auto_434637 ?auto_434638 ?auto_434639 ?auto_434640 ?auto_434641 ?auto_434642 )
      ( MAKE-9PILE ?auto_434636 ?auto_434637 ?auto_434638 ?auto_434639 ?auto_434640 ?auto_434641 ?auto_434642 ?auto_434643 ?auto_434644 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434655 - BLOCK
      ?auto_434656 - BLOCK
      ?auto_434657 - BLOCK
      ?auto_434658 - BLOCK
      ?auto_434659 - BLOCK
      ?auto_434660 - BLOCK
      ?auto_434661 - BLOCK
      ?auto_434662 - BLOCK
      ?auto_434663 - BLOCK
    )
    :vars
    (
      ?auto_434664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434663 ?auto_434664 ) ( ON-TABLE ?auto_434655 ) ( ON ?auto_434656 ?auto_434655 ) ( ON ?auto_434657 ?auto_434656 ) ( ON ?auto_434658 ?auto_434657 ) ( ON ?auto_434659 ?auto_434658 ) ( not ( = ?auto_434655 ?auto_434656 ) ) ( not ( = ?auto_434655 ?auto_434657 ) ) ( not ( = ?auto_434655 ?auto_434658 ) ) ( not ( = ?auto_434655 ?auto_434659 ) ) ( not ( = ?auto_434655 ?auto_434660 ) ) ( not ( = ?auto_434655 ?auto_434661 ) ) ( not ( = ?auto_434655 ?auto_434662 ) ) ( not ( = ?auto_434655 ?auto_434663 ) ) ( not ( = ?auto_434655 ?auto_434664 ) ) ( not ( = ?auto_434656 ?auto_434657 ) ) ( not ( = ?auto_434656 ?auto_434658 ) ) ( not ( = ?auto_434656 ?auto_434659 ) ) ( not ( = ?auto_434656 ?auto_434660 ) ) ( not ( = ?auto_434656 ?auto_434661 ) ) ( not ( = ?auto_434656 ?auto_434662 ) ) ( not ( = ?auto_434656 ?auto_434663 ) ) ( not ( = ?auto_434656 ?auto_434664 ) ) ( not ( = ?auto_434657 ?auto_434658 ) ) ( not ( = ?auto_434657 ?auto_434659 ) ) ( not ( = ?auto_434657 ?auto_434660 ) ) ( not ( = ?auto_434657 ?auto_434661 ) ) ( not ( = ?auto_434657 ?auto_434662 ) ) ( not ( = ?auto_434657 ?auto_434663 ) ) ( not ( = ?auto_434657 ?auto_434664 ) ) ( not ( = ?auto_434658 ?auto_434659 ) ) ( not ( = ?auto_434658 ?auto_434660 ) ) ( not ( = ?auto_434658 ?auto_434661 ) ) ( not ( = ?auto_434658 ?auto_434662 ) ) ( not ( = ?auto_434658 ?auto_434663 ) ) ( not ( = ?auto_434658 ?auto_434664 ) ) ( not ( = ?auto_434659 ?auto_434660 ) ) ( not ( = ?auto_434659 ?auto_434661 ) ) ( not ( = ?auto_434659 ?auto_434662 ) ) ( not ( = ?auto_434659 ?auto_434663 ) ) ( not ( = ?auto_434659 ?auto_434664 ) ) ( not ( = ?auto_434660 ?auto_434661 ) ) ( not ( = ?auto_434660 ?auto_434662 ) ) ( not ( = ?auto_434660 ?auto_434663 ) ) ( not ( = ?auto_434660 ?auto_434664 ) ) ( not ( = ?auto_434661 ?auto_434662 ) ) ( not ( = ?auto_434661 ?auto_434663 ) ) ( not ( = ?auto_434661 ?auto_434664 ) ) ( not ( = ?auto_434662 ?auto_434663 ) ) ( not ( = ?auto_434662 ?auto_434664 ) ) ( not ( = ?auto_434663 ?auto_434664 ) ) ( ON ?auto_434662 ?auto_434663 ) ( ON ?auto_434661 ?auto_434662 ) ( CLEAR ?auto_434659 ) ( ON ?auto_434660 ?auto_434661 ) ( CLEAR ?auto_434660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_434655 ?auto_434656 ?auto_434657 ?auto_434658 ?auto_434659 ?auto_434660 )
      ( MAKE-9PILE ?auto_434655 ?auto_434656 ?auto_434657 ?auto_434658 ?auto_434659 ?auto_434660 ?auto_434661 ?auto_434662 ?auto_434663 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434674 - BLOCK
      ?auto_434675 - BLOCK
      ?auto_434676 - BLOCK
      ?auto_434677 - BLOCK
      ?auto_434678 - BLOCK
      ?auto_434679 - BLOCK
      ?auto_434680 - BLOCK
      ?auto_434681 - BLOCK
      ?auto_434682 - BLOCK
    )
    :vars
    (
      ?auto_434683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434682 ?auto_434683 ) ( ON-TABLE ?auto_434674 ) ( ON ?auto_434675 ?auto_434674 ) ( ON ?auto_434676 ?auto_434675 ) ( ON ?auto_434677 ?auto_434676 ) ( ON ?auto_434678 ?auto_434677 ) ( not ( = ?auto_434674 ?auto_434675 ) ) ( not ( = ?auto_434674 ?auto_434676 ) ) ( not ( = ?auto_434674 ?auto_434677 ) ) ( not ( = ?auto_434674 ?auto_434678 ) ) ( not ( = ?auto_434674 ?auto_434679 ) ) ( not ( = ?auto_434674 ?auto_434680 ) ) ( not ( = ?auto_434674 ?auto_434681 ) ) ( not ( = ?auto_434674 ?auto_434682 ) ) ( not ( = ?auto_434674 ?auto_434683 ) ) ( not ( = ?auto_434675 ?auto_434676 ) ) ( not ( = ?auto_434675 ?auto_434677 ) ) ( not ( = ?auto_434675 ?auto_434678 ) ) ( not ( = ?auto_434675 ?auto_434679 ) ) ( not ( = ?auto_434675 ?auto_434680 ) ) ( not ( = ?auto_434675 ?auto_434681 ) ) ( not ( = ?auto_434675 ?auto_434682 ) ) ( not ( = ?auto_434675 ?auto_434683 ) ) ( not ( = ?auto_434676 ?auto_434677 ) ) ( not ( = ?auto_434676 ?auto_434678 ) ) ( not ( = ?auto_434676 ?auto_434679 ) ) ( not ( = ?auto_434676 ?auto_434680 ) ) ( not ( = ?auto_434676 ?auto_434681 ) ) ( not ( = ?auto_434676 ?auto_434682 ) ) ( not ( = ?auto_434676 ?auto_434683 ) ) ( not ( = ?auto_434677 ?auto_434678 ) ) ( not ( = ?auto_434677 ?auto_434679 ) ) ( not ( = ?auto_434677 ?auto_434680 ) ) ( not ( = ?auto_434677 ?auto_434681 ) ) ( not ( = ?auto_434677 ?auto_434682 ) ) ( not ( = ?auto_434677 ?auto_434683 ) ) ( not ( = ?auto_434678 ?auto_434679 ) ) ( not ( = ?auto_434678 ?auto_434680 ) ) ( not ( = ?auto_434678 ?auto_434681 ) ) ( not ( = ?auto_434678 ?auto_434682 ) ) ( not ( = ?auto_434678 ?auto_434683 ) ) ( not ( = ?auto_434679 ?auto_434680 ) ) ( not ( = ?auto_434679 ?auto_434681 ) ) ( not ( = ?auto_434679 ?auto_434682 ) ) ( not ( = ?auto_434679 ?auto_434683 ) ) ( not ( = ?auto_434680 ?auto_434681 ) ) ( not ( = ?auto_434680 ?auto_434682 ) ) ( not ( = ?auto_434680 ?auto_434683 ) ) ( not ( = ?auto_434681 ?auto_434682 ) ) ( not ( = ?auto_434681 ?auto_434683 ) ) ( not ( = ?auto_434682 ?auto_434683 ) ) ( ON ?auto_434681 ?auto_434682 ) ( ON ?auto_434680 ?auto_434681 ) ( CLEAR ?auto_434678 ) ( ON ?auto_434679 ?auto_434680 ) ( CLEAR ?auto_434679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_434674 ?auto_434675 ?auto_434676 ?auto_434677 ?auto_434678 ?auto_434679 )
      ( MAKE-9PILE ?auto_434674 ?auto_434675 ?auto_434676 ?auto_434677 ?auto_434678 ?auto_434679 ?auto_434680 ?auto_434681 ?auto_434682 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434693 - BLOCK
      ?auto_434694 - BLOCK
      ?auto_434695 - BLOCK
      ?auto_434696 - BLOCK
      ?auto_434697 - BLOCK
      ?auto_434698 - BLOCK
      ?auto_434699 - BLOCK
      ?auto_434700 - BLOCK
      ?auto_434701 - BLOCK
    )
    :vars
    (
      ?auto_434702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434701 ?auto_434702 ) ( ON-TABLE ?auto_434693 ) ( ON ?auto_434694 ?auto_434693 ) ( ON ?auto_434695 ?auto_434694 ) ( ON ?auto_434696 ?auto_434695 ) ( not ( = ?auto_434693 ?auto_434694 ) ) ( not ( = ?auto_434693 ?auto_434695 ) ) ( not ( = ?auto_434693 ?auto_434696 ) ) ( not ( = ?auto_434693 ?auto_434697 ) ) ( not ( = ?auto_434693 ?auto_434698 ) ) ( not ( = ?auto_434693 ?auto_434699 ) ) ( not ( = ?auto_434693 ?auto_434700 ) ) ( not ( = ?auto_434693 ?auto_434701 ) ) ( not ( = ?auto_434693 ?auto_434702 ) ) ( not ( = ?auto_434694 ?auto_434695 ) ) ( not ( = ?auto_434694 ?auto_434696 ) ) ( not ( = ?auto_434694 ?auto_434697 ) ) ( not ( = ?auto_434694 ?auto_434698 ) ) ( not ( = ?auto_434694 ?auto_434699 ) ) ( not ( = ?auto_434694 ?auto_434700 ) ) ( not ( = ?auto_434694 ?auto_434701 ) ) ( not ( = ?auto_434694 ?auto_434702 ) ) ( not ( = ?auto_434695 ?auto_434696 ) ) ( not ( = ?auto_434695 ?auto_434697 ) ) ( not ( = ?auto_434695 ?auto_434698 ) ) ( not ( = ?auto_434695 ?auto_434699 ) ) ( not ( = ?auto_434695 ?auto_434700 ) ) ( not ( = ?auto_434695 ?auto_434701 ) ) ( not ( = ?auto_434695 ?auto_434702 ) ) ( not ( = ?auto_434696 ?auto_434697 ) ) ( not ( = ?auto_434696 ?auto_434698 ) ) ( not ( = ?auto_434696 ?auto_434699 ) ) ( not ( = ?auto_434696 ?auto_434700 ) ) ( not ( = ?auto_434696 ?auto_434701 ) ) ( not ( = ?auto_434696 ?auto_434702 ) ) ( not ( = ?auto_434697 ?auto_434698 ) ) ( not ( = ?auto_434697 ?auto_434699 ) ) ( not ( = ?auto_434697 ?auto_434700 ) ) ( not ( = ?auto_434697 ?auto_434701 ) ) ( not ( = ?auto_434697 ?auto_434702 ) ) ( not ( = ?auto_434698 ?auto_434699 ) ) ( not ( = ?auto_434698 ?auto_434700 ) ) ( not ( = ?auto_434698 ?auto_434701 ) ) ( not ( = ?auto_434698 ?auto_434702 ) ) ( not ( = ?auto_434699 ?auto_434700 ) ) ( not ( = ?auto_434699 ?auto_434701 ) ) ( not ( = ?auto_434699 ?auto_434702 ) ) ( not ( = ?auto_434700 ?auto_434701 ) ) ( not ( = ?auto_434700 ?auto_434702 ) ) ( not ( = ?auto_434701 ?auto_434702 ) ) ( ON ?auto_434700 ?auto_434701 ) ( ON ?auto_434699 ?auto_434700 ) ( ON ?auto_434698 ?auto_434699 ) ( CLEAR ?auto_434696 ) ( ON ?auto_434697 ?auto_434698 ) ( CLEAR ?auto_434697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_434693 ?auto_434694 ?auto_434695 ?auto_434696 ?auto_434697 )
      ( MAKE-9PILE ?auto_434693 ?auto_434694 ?auto_434695 ?auto_434696 ?auto_434697 ?auto_434698 ?auto_434699 ?auto_434700 ?auto_434701 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434712 - BLOCK
      ?auto_434713 - BLOCK
      ?auto_434714 - BLOCK
      ?auto_434715 - BLOCK
      ?auto_434716 - BLOCK
      ?auto_434717 - BLOCK
      ?auto_434718 - BLOCK
      ?auto_434719 - BLOCK
      ?auto_434720 - BLOCK
    )
    :vars
    (
      ?auto_434721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434720 ?auto_434721 ) ( ON-TABLE ?auto_434712 ) ( ON ?auto_434713 ?auto_434712 ) ( ON ?auto_434714 ?auto_434713 ) ( ON ?auto_434715 ?auto_434714 ) ( not ( = ?auto_434712 ?auto_434713 ) ) ( not ( = ?auto_434712 ?auto_434714 ) ) ( not ( = ?auto_434712 ?auto_434715 ) ) ( not ( = ?auto_434712 ?auto_434716 ) ) ( not ( = ?auto_434712 ?auto_434717 ) ) ( not ( = ?auto_434712 ?auto_434718 ) ) ( not ( = ?auto_434712 ?auto_434719 ) ) ( not ( = ?auto_434712 ?auto_434720 ) ) ( not ( = ?auto_434712 ?auto_434721 ) ) ( not ( = ?auto_434713 ?auto_434714 ) ) ( not ( = ?auto_434713 ?auto_434715 ) ) ( not ( = ?auto_434713 ?auto_434716 ) ) ( not ( = ?auto_434713 ?auto_434717 ) ) ( not ( = ?auto_434713 ?auto_434718 ) ) ( not ( = ?auto_434713 ?auto_434719 ) ) ( not ( = ?auto_434713 ?auto_434720 ) ) ( not ( = ?auto_434713 ?auto_434721 ) ) ( not ( = ?auto_434714 ?auto_434715 ) ) ( not ( = ?auto_434714 ?auto_434716 ) ) ( not ( = ?auto_434714 ?auto_434717 ) ) ( not ( = ?auto_434714 ?auto_434718 ) ) ( not ( = ?auto_434714 ?auto_434719 ) ) ( not ( = ?auto_434714 ?auto_434720 ) ) ( not ( = ?auto_434714 ?auto_434721 ) ) ( not ( = ?auto_434715 ?auto_434716 ) ) ( not ( = ?auto_434715 ?auto_434717 ) ) ( not ( = ?auto_434715 ?auto_434718 ) ) ( not ( = ?auto_434715 ?auto_434719 ) ) ( not ( = ?auto_434715 ?auto_434720 ) ) ( not ( = ?auto_434715 ?auto_434721 ) ) ( not ( = ?auto_434716 ?auto_434717 ) ) ( not ( = ?auto_434716 ?auto_434718 ) ) ( not ( = ?auto_434716 ?auto_434719 ) ) ( not ( = ?auto_434716 ?auto_434720 ) ) ( not ( = ?auto_434716 ?auto_434721 ) ) ( not ( = ?auto_434717 ?auto_434718 ) ) ( not ( = ?auto_434717 ?auto_434719 ) ) ( not ( = ?auto_434717 ?auto_434720 ) ) ( not ( = ?auto_434717 ?auto_434721 ) ) ( not ( = ?auto_434718 ?auto_434719 ) ) ( not ( = ?auto_434718 ?auto_434720 ) ) ( not ( = ?auto_434718 ?auto_434721 ) ) ( not ( = ?auto_434719 ?auto_434720 ) ) ( not ( = ?auto_434719 ?auto_434721 ) ) ( not ( = ?auto_434720 ?auto_434721 ) ) ( ON ?auto_434719 ?auto_434720 ) ( ON ?auto_434718 ?auto_434719 ) ( ON ?auto_434717 ?auto_434718 ) ( CLEAR ?auto_434715 ) ( ON ?auto_434716 ?auto_434717 ) ( CLEAR ?auto_434716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_434712 ?auto_434713 ?auto_434714 ?auto_434715 ?auto_434716 )
      ( MAKE-9PILE ?auto_434712 ?auto_434713 ?auto_434714 ?auto_434715 ?auto_434716 ?auto_434717 ?auto_434718 ?auto_434719 ?auto_434720 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434731 - BLOCK
      ?auto_434732 - BLOCK
      ?auto_434733 - BLOCK
      ?auto_434734 - BLOCK
      ?auto_434735 - BLOCK
      ?auto_434736 - BLOCK
      ?auto_434737 - BLOCK
      ?auto_434738 - BLOCK
      ?auto_434739 - BLOCK
    )
    :vars
    (
      ?auto_434740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434739 ?auto_434740 ) ( ON-TABLE ?auto_434731 ) ( ON ?auto_434732 ?auto_434731 ) ( ON ?auto_434733 ?auto_434732 ) ( not ( = ?auto_434731 ?auto_434732 ) ) ( not ( = ?auto_434731 ?auto_434733 ) ) ( not ( = ?auto_434731 ?auto_434734 ) ) ( not ( = ?auto_434731 ?auto_434735 ) ) ( not ( = ?auto_434731 ?auto_434736 ) ) ( not ( = ?auto_434731 ?auto_434737 ) ) ( not ( = ?auto_434731 ?auto_434738 ) ) ( not ( = ?auto_434731 ?auto_434739 ) ) ( not ( = ?auto_434731 ?auto_434740 ) ) ( not ( = ?auto_434732 ?auto_434733 ) ) ( not ( = ?auto_434732 ?auto_434734 ) ) ( not ( = ?auto_434732 ?auto_434735 ) ) ( not ( = ?auto_434732 ?auto_434736 ) ) ( not ( = ?auto_434732 ?auto_434737 ) ) ( not ( = ?auto_434732 ?auto_434738 ) ) ( not ( = ?auto_434732 ?auto_434739 ) ) ( not ( = ?auto_434732 ?auto_434740 ) ) ( not ( = ?auto_434733 ?auto_434734 ) ) ( not ( = ?auto_434733 ?auto_434735 ) ) ( not ( = ?auto_434733 ?auto_434736 ) ) ( not ( = ?auto_434733 ?auto_434737 ) ) ( not ( = ?auto_434733 ?auto_434738 ) ) ( not ( = ?auto_434733 ?auto_434739 ) ) ( not ( = ?auto_434733 ?auto_434740 ) ) ( not ( = ?auto_434734 ?auto_434735 ) ) ( not ( = ?auto_434734 ?auto_434736 ) ) ( not ( = ?auto_434734 ?auto_434737 ) ) ( not ( = ?auto_434734 ?auto_434738 ) ) ( not ( = ?auto_434734 ?auto_434739 ) ) ( not ( = ?auto_434734 ?auto_434740 ) ) ( not ( = ?auto_434735 ?auto_434736 ) ) ( not ( = ?auto_434735 ?auto_434737 ) ) ( not ( = ?auto_434735 ?auto_434738 ) ) ( not ( = ?auto_434735 ?auto_434739 ) ) ( not ( = ?auto_434735 ?auto_434740 ) ) ( not ( = ?auto_434736 ?auto_434737 ) ) ( not ( = ?auto_434736 ?auto_434738 ) ) ( not ( = ?auto_434736 ?auto_434739 ) ) ( not ( = ?auto_434736 ?auto_434740 ) ) ( not ( = ?auto_434737 ?auto_434738 ) ) ( not ( = ?auto_434737 ?auto_434739 ) ) ( not ( = ?auto_434737 ?auto_434740 ) ) ( not ( = ?auto_434738 ?auto_434739 ) ) ( not ( = ?auto_434738 ?auto_434740 ) ) ( not ( = ?auto_434739 ?auto_434740 ) ) ( ON ?auto_434738 ?auto_434739 ) ( ON ?auto_434737 ?auto_434738 ) ( ON ?auto_434736 ?auto_434737 ) ( ON ?auto_434735 ?auto_434736 ) ( CLEAR ?auto_434733 ) ( ON ?auto_434734 ?auto_434735 ) ( CLEAR ?auto_434734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_434731 ?auto_434732 ?auto_434733 ?auto_434734 )
      ( MAKE-9PILE ?auto_434731 ?auto_434732 ?auto_434733 ?auto_434734 ?auto_434735 ?auto_434736 ?auto_434737 ?auto_434738 ?auto_434739 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434750 - BLOCK
      ?auto_434751 - BLOCK
      ?auto_434752 - BLOCK
      ?auto_434753 - BLOCK
      ?auto_434754 - BLOCK
      ?auto_434755 - BLOCK
      ?auto_434756 - BLOCK
      ?auto_434757 - BLOCK
      ?auto_434758 - BLOCK
    )
    :vars
    (
      ?auto_434759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434758 ?auto_434759 ) ( ON-TABLE ?auto_434750 ) ( ON ?auto_434751 ?auto_434750 ) ( ON ?auto_434752 ?auto_434751 ) ( not ( = ?auto_434750 ?auto_434751 ) ) ( not ( = ?auto_434750 ?auto_434752 ) ) ( not ( = ?auto_434750 ?auto_434753 ) ) ( not ( = ?auto_434750 ?auto_434754 ) ) ( not ( = ?auto_434750 ?auto_434755 ) ) ( not ( = ?auto_434750 ?auto_434756 ) ) ( not ( = ?auto_434750 ?auto_434757 ) ) ( not ( = ?auto_434750 ?auto_434758 ) ) ( not ( = ?auto_434750 ?auto_434759 ) ) ( not ( = ?auto_434751 ?auto_434752 ) ) ( not ( = ?auto_434751 ?auto_434753 ) ) ( not ( = ?auto_434751 ?auto_434754 ) ) ( not ( = ?auto_434751 ?auto_434755 ) ) ( not ( = ?auto_434751 ?auto_434756 ) ) ( not ( = ?auto_434751 ?auto_434757 ) ) ( not ( = ?auto_434751 ?auto_434758 ) ) ( not ( = ?auto_434751 ?auto_434759 ) ) ( not ( = ?auto_434752 ?auto_434753 ) ) ( not ( = ?auto_434752 ?auto_434754 ) ) ( not ( = ?auto_434752 ?auto_434755 ) ) ( not ( = ?auto_434752 ?auto_434756 ) ) ( not ( = ?auto_434752 ?auto_434757 ) ) ( not ( = ?auto_434752 ?auto_434758 ) ) ( not ( = ?auto_434752 ?auto_434759 ) ) ( not ( = ?auto_434753 ?auto_434754 ) ) ( not ( = ?auto_434753 ?auto_434755 ) ) ( not ( = ?auto_434753 ?auto_434756 ) ) ( not ( = ?auto_434753 ?auto_434757 ) ) ( not ( = ?auto_434753 ?auto_434758 ) ) ( not ( = ?auto_434753 ?auto_434759 ) ) ( not ( = ?auto_434754 ?auto_434755 ) ) ( not ( = ?auto_434754 ?auto_434756 ) ) ( not ( = ?auto_434754 ?auto_434757 ) ) ( not ( = ?auto_434754 ?auto_434758 ) ) ( not ( = ?auto_434754 ?auto_434759 ) ) ( not ( = ?auto_434755 ?auto_434756 ) ) ( not ( = ?auto_434755 ?auto_434757 ) ) ( not ( = ?auto_434755 ?auto_434758 ) ) ( not ( = ?auto_434755 ?auto_434759 ) ) ( not ( = ?auto_434756 ?auto_434757 ) ) ( not ( = ?auto_434756 ?auto_434758 ) ) ( not ( = ?auto_434756 ?auto_434759 ) ) ( not ( = ?auto_434757 ?auto_434758 ) ) ( not ( = ?auto_434757 ?auto_434759 ) ) ( not ( = ?auto_434758 ?auto_434759 ) ) ( ON ?auto_434757 ?auto_434758 ) ( ON ?auto_434756 ?auto_434757 ) ( ON ?auto_434755 ?auto_434756 ) ( ON ?auto_434754 ?auto_434755 ) ( CLEAR ?auto_434752 ) ( ON ?auto_434753 ?auto_434754 ) ( CLEAR ?auto_434753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_434750 ?auto_434751 ?auto_434752 ?auto_434753 )
      ( MAKE-9PILE ?auto_434750 ?auto_434751 ?auto_434752 ?auto_434753 ?auto_434754 ?auto_434755 ?auto_434756 ?auto_434757 ?auto_434758 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434769 - BLOCK
      ?auto_434770 - BLOCK
      ?auto_434771 - BLOCK
      ?auto_434772 - BLOCK
      ?auto_434773 - BLOCK
      ?auto_434774 - BLOCK
      ?auto_434775 - BLOCK
      ?auto_434776 - BLOCK
      ?auto_434777 - BLOCK
    )
    :vars
    (
      ?auto_434778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434777 ?auto_434778 ) ( ON-TABLE ?auto_434769 ) ( ON ?auto_434770 ?auto_434769 ) ( not ( = ?auto_434769 ?auto_434770 ) ) ( not ( = ?auto_434769 ?auto_434771 ) ) ( not ( = ?auto_434769 ?auto_434772 ) ) ( not ( = ?auto_434769 ?auto_434773 ) ) ( not ( = ?auto_434769 ?auto_434774 ) ) ( not ( = ?auto_434769 ?auto_434775 ) ) ( not ( = ?auto_434769 ?auto_434776 ) ) ( not ( = ?auto_434769 ?auto_434777 ) ) ( not ( = ?auto_434769 ?auto_434778 ) ) ( not ( = ?auto_434770 ?auto_434771 ) ) ( not ( = ?auto_434770 ?auto_434772 ) ) ( not ( = ?auto_434770 ?auto_434773 ) ) ( not ( = ?auto_434770 ?auto_434774 ) ) ( not ( = ?auto_434770 ?auto_434775 ) ) ( not ( = ?auto_434770 ?auto_434776 ) ) ( not ( = ?auto_434770 ?auto_434777 ) ) ( not ( = ?auto_434770 ?auto_434778 ) ) ( not ( = ?auto_434771 ?auto_434772 ) ) ( not ( = ?auto_434771 ?auto_434773 ) ) ( not ( = ?auto_434771 ?auto_434774 ) ) ( not ( = ?auto_434771 ?auto_434775 ) ) ( not ( = ?auto_434771 ?auto_434776 ) ) ( not ( = ?auto_434771 ?auto_434777 ) ) ( not ( = ?auto_434771 ?auto_434778 ) ) ( not ( = ?auto_434772 ?auto_434773 ) ) ( not ( = ?auto_434772 ?auto_434774 ) ) ( not ( = ?auto_434772 ?auto_434775 ) ) ( not ( = ?auto_434772 ?auto_434776 ) ) ( not ( = ?auto_434772 ?auto_434777 ) ) ( not ( = ?auto_434772 ?auto_434778 ) ) ( not ( = ?auto_434773 ?auto_434774 ) ) ( not ( = ?auto_434773 ?auto_434775 ) ) ( not ( = ?auto_434773 ?auto_434776 ) ) ( not ( = ?auto_434773 ?auto_434777 ) ) ( not ( = ?auto_434773 ?auto_434778 ) ) ( not ( = ?auto_434774 ?auto_434775 ) ) ( not ( = ?auto_434774 ?auto_434776 ) ) ( not ( = ?auto_434774 ?auto_434777 ) ) ( not ( = ?auto_434774 ?auto_434778 ) ) ( not ( = ?auto_434775 ?auto_434776 ) ) ( not ( = ?auto_434775 ?auto_434777 ) ) ( not ( = ?auto_434775 ?auto_434778 ) ) ( not ( = ?auto_434776 ?auto_434777 ) ) ( not ( = ?auto_434776 ?auto_434778 ) ) ( not ( = ?auto_434777 ?auto_434778 ) ) ( ON ?auto_434776 ?auto_434777 ) ( ON ?auto_434775 ?auto_434776 ) ( ON ?auto_434774 ?auto_434775 ) ( ON ?auto_434773 ?auto_434774 ) ( ON ?auto_434772 ?auto_434773 ) ( CLEAR ?auto_434770 ) ( ON ?auto_434771 ?auto_434772 ) ( CLEAR ?auto_434771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_434769 ?auto_434770 ?auto_434771 )
      ( MAKE-9PILE ?auto_434769 ?auto_434770 ?auto_434771 ?auto_434772 ?auto_434773 ?auto_434774 ?auto_434775 ?auto_434776 ?auto_434777 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434788 - BLOCK
      ?auto_434789 - BLOCK
      ?auto_434790 - BLOCK
      ?auto_434791 - BLOCK
      ?auto_434792 - BLOCK
      ?auto_434793 - BLOCK
      ?auto_434794 - BLOCK
      ?auto_434795 - BLOCK
      ?auto_434796 - BLOCK
    )
    :vars
    (
      ?auto_434797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434796 ?auto_434797 ) ( ON-TABLE ?auto_434788 ) ( ON ?auto_434789 ?auto_434788 ) ( not ( = ?auto_434788 ?auto_434789 ) ) ( not ( = ?auto_434788 ?auto_434790 ) ) ( not ( = ?auto_434788 ?auto_434791 ) ) ( not ( = ?auto_434788 ?auto_434792 ) ) ( not ( = ?auto_434788 ?auto_434793 ) ) ( not ( = ?auto_434788 ?auto_434794 ) ) ( not ( = ?auto_434788 ?auto_434795 ) ) ( not ( = ?auto_434788 ?auto_434796 ) ) ( not ( = ?auto_434788 ?auto_434797 ) ) ( not ( = ?auto_434789 ?auto_434790 ) ) ( not ( = ?auto_434789 ?auto_434791 ) ) ( not ( = ?auto_434789 ?auto_434792 ) ) ( not ( = ?auto_434789 ?auto_434793 ) ) ( not ( = ?auto_434789 ?auto_434794 ) ) ( not ( = ?auto_434789 ?auto_434795 ) ) ( not ( = ?auto_434789 ?auto_434796 ) ) ( not ( = ?auto_434789 ?auto_434797 ) ) ( not ( = ?auto_434790 ?auto_434791 ) ) ( not ( = ?auto_434790 ?auto_434792 ) ) ( not ( = ?auto_434790 ?auto_434793 ) ) ( not ( = ?auto_434790 ?auto_434794 ) ) ( not ( = ?auto_434790 ?auto_434795 ) ) ( not ( = ?auto_434790 ?auto_434796 ) ) ( not ( = ?auto_434790 ?auto_434797 ) ) ( not ( = ?auto_434791 ?auto_434792 ) ) ( not ( = ?auto_434791 ?auto_434793 ) ) ( not ( = ?auto_434791 ?auto_434794 ) ) ( not ( = ?auto_434791 ?auto_434795 ) ) ( not ( = ?auto_434791 ?auto_434796 ) ) ( not ( = ?auto_434791 ?auto_434797 ) ) ( not ( = ?auto_434792 ?auto_434793 ) ) ( not ( = ?auto_434792 ?auto_434794 ) ) ( not ( = ?auto_434792 ?auto_434795 ) ) ( not ( = ?auto_434792 ?auto_434796 ) ) ( not ( = ?auto_434792 ?auto_434797 ) ) ( not ( = ?auto_434793 ?auto_434794 ) ) ( not ( = ?auto_434793 ?auto_434795 ) ) ( not ( = ?auto_434793 ?auto_434796 ) ) ( not ( = ?auto_434793 ?auto_434797 ) ) ( not ( = ?auto_434794 ?auto_434795 ) ) ( not ( = ?auto_434794 ?auto_434796 ) ) ( not ( = ?auto_434794 ?auto_434797 ) ) ( not ( = ?auto_434795 ?auto_434796 ) ) ( not ( = ?auto_434795 ?auto_434797 ) ) ( not ( = ?auto_434796 ?auto_434797 ) ) ( ON ?auto_434795 ?auto_434796 ) ( ON ?auto_434794 ?auto_434795 ) ( ON ?auto_434793 ?auto_434794 ) ( ON ?auto_434792 ?auto_434793 ) ( ON ?auto_434791 ?auto_434792 ) ( CLEAR ?auto_434789 ) ( ON ?auto_434790 ?auto_434791 ) ( CLEAR ?auto_434790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_434788 ?auto_434789 ?auto_434790 )
      ( MAKE-9PILE ?auto_434788 ?auto_434789 ?auto_434790 ?auto_434791 ?auto_434792 ?auto_434793 ?auto_434794 ?auto_434795 ?auto_434796 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434807 - BLOCK
      ?auto_434808 - BLOCK
      ?auto_434809 - BLOCK
      ?auto_434810 - BLOCK
      ?auto_434811 - BLOCK
      ?auto_434812 - BLOCK
      ?auto_434813 - BLOCK
      ?auto_434814 - BLOCK
      ?auto_434815 - BLOCK
    )
    :vars
    (
      ?auto_434816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434815 ?auto_434816 ) ( ON-TABLE ?auto_434807 ) ( not ( = ?auto_434807 ?auto_434808 ) ) ( not ( = ?auto_434807 ?auto_434809 ) ) ( not ( = ?auto_434807 ?auto_434810 ) ) ( not ( = ?auto_434807 ?auto_434811 ) ) ( not ( = ?auto_434807 ?auto_434812 ) ) ( not ( = ?auto_434807 ?auto_434813 ) ) ( not ( = ?auto_434807 ?auto_434814 ) ) ( not ( = ?auto_434807 ?auto_434815 ) ) ( not ( = ?auto_434807 ?auto_434816 ) ) ( not ( = ?auto_434808 ?auto_434809 ) ) ( not ( = ?auto_434808 ?auto_434810 ) ) ( not ( = ?auto_434808 ?auto_434811 ) ) ( not ( = ?auto_434808 ?auto_434812 ) ) ( not ( = ?auto_434808 ?auto_434813 ) ) ( not ( = ?auto_434808 ?auto_434814 ) ) ( not ( = ?auto_434808 ?auto_434815 ) ) ( not ( = ?auto_434808 ?auto_434816 ) ) ( not ( = ?auto_434809 ?auto_434810 ) ) ( not ( = ?auto_434809 ?auto_434811 ) ) ( not ( = ?auto_434809 ?auto_434812 ) ) ( not ( = ?auto_434809 ?auto_434813 ) ) ( not ( = ?auto_434809 ?auto_434814 ) ) ( not ( = ?auto_434809 ?auto_434815 ) ) ( not ( = ?auto_434809 ?auto_434816 ) ) ( not ( = ?auto_434810 ?auto_434811 ) ) ( not ( = ?auto_434810 ?auto_434812 ) ) ( not ( = ?auto_434810 ?auto_434813 ) ) ( not ( = ?auto_434810 ?auto_434814 ) ) ( not ( = ?auto_434810 ?auto_434815 ) ) ( not ( = ?auto_434810 ?auto_434816 ) ) ( not ( = ?auto_434811 ?auto_434812 ) ) ( not ( = ?auto_434811 ?auto_434813 ) ) ( not ( = ?auto_434811 ?auto_434814 ) ) ( not ( = ?auto_434811 ?auto_434815 ) ) ( not ( = ?auto_434811 ?auto_434816 ) ) ( not ( = ?auto_434812 ?auto_434813 ) ) ( not ( = ?auto_434812 ?auto_434814 ) ) ( not ( = ?auto_434812 ?auto_434815 ) ) ( not ( = ?auto_434812 ?auto_434816 ) ) ( not ( = ?auto_434813 ?auto_434814 ) ) ( not ( = ?auto_434813 ?auto_434815 ) ) ( not ( = ?auto_434813 ?auto_434816 ) ) ( not ( = ?auto_434814 ?auto_434815 ) ) ( not ( = ?auto_434814 ?auto_434816 ) ) ( not ( = ?auto_434815 ?auto_434816 ) ) ( ON ?auto_434814 ?auto_434815 ) ( ON ?auto_434813 ?auto_434814 ) ( ON ?auto_434812 ?auto_434813 ) ( ON ?auto_434811 ?auto_434812 ) ( ON ?auto_434810 ?auto_434811 ) ( ON ?auto_434809 ?auto_434810 ) ( CLEAR ?auto_434807 ) ( ON ?auto_434808 ?auto_434809 ) ( CLEAR ?auto_434808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434807 ?auto_434808 )
      ( MAKE-9PILE ?auto_434807 ?auto_434808 ?auto_434809 ?auto_434810 ?auto_434811 ?auto_434812 ?auto_434813 ?auto_434814 ?auto_434815 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434826 - BLOCK
      ?auto_434827 - BLOCK
      ?auto_434828 - BLOCK
      ?auto_434829 - BLOCK
      ?auto_434830 - BLOCK
      ?auto_434831 - BLOCK
      ?auto_434832 - BLOCK
      ?auto_434833 - BLOCK
      ?auto_434834 - BLOCK
    )
    :vars
    (
      ?auto_434835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434834 ?auto_434835 ) ( ON-TABLE ?auto_434826 ) ( not ( = ?auto_434826 ?auto_434827 ) ) ( not ( = ?auto_434826 ?auto_434828 ) ) ( not ( = ?auto_434826 ?auto_434829 ) ) ( not ( = ?auto_434826 ?auto_434830 ) ) ( not ( = ?auto_434826 ?auto_434831 ) ) ( not ( = ?auto_434826 ?auto_434832 ) ) ( not ( = ?auto_434826 ?auto_434833 ) ) ( not ( = ?auto_434826 ?auto_434834 ) ) ( not ( = ?auto_434826 ?auto_434835 ) ) ( not ( = ?auto_434827 ?auto_434828 ) ) ( not ( = ?auto_434827 ?auto_434829 ) ) ( not ( = ?auto_434827 ?auto_434830 ) ) ( not ( = ?auto_434827 ?auto_434831 ) ) ( not ( = ?auto_434827 ?auto_434832 ) ) ( not ( = ?auto_434827 ?auto_434833 ) ) ( not ( = ?auto_434827 ?auto_434834 ) ) ( not ( = ?auto_434827 ?auto_434835 ) ) ( not ( = ?auto_434828 ?auto_434829 ) ) ( not ( = ?auto_434828 ?auto_434830 ) ) ( not ( = ?auto_434828 ?auto_434831 ) ) ( not ( = ?auto_434828 ?auto_434832 ) ) ( not ( = ?auto_434828 ?auto_434833 ) ) ( not ( = ?auto_434828 ?auto_434834 ) ) ( not ( = ?auto_434828 ?auto_434835 ) ) ( not ( = ?auto_434829 ?auto_434830 ) ) ( not ( = ?auto_434829 ?auto_434831 ) ) ( not ( = ?auto_434829 ?auto_434832 ) ) ( not ( = ?auto_434829 ?auto_434833 ) ) ( not ( = ?auto_434829 ?auto_434834 ) ) ( not ( = ?auto_434829 ?auto_434835 ) ) ( not ( = ?auto_434830 ?auto_434831 ) ) ( not ( = ?auto_434830 ?auto_434832 ) ) ( not ( = ?auto_434830 ?auto_434833 ) ) ( not ( = ?auto_434830 ?auto_434834 ) ) ( not ( = ?auto_434830 ?auto_434835 ) ) ( not ( = ?auto_434831 ?auto_434832 ) ) ( not ( = ?auto_434831 ?auto_434833 ) ) ( not ( = ?auto_434831 ?auto_434834 ) ) ( not ( = ?auto_434831 ?auto_434835 ) ) ( not ( = ?auto_434832 ?auto_434833 ) ) ( not ( = ?auto_434832 ?auto_434834 ) ) ( not ( = ?auto_434832 ?auto_434835 ) ) ( not ( = ?auto_434833 ?auto_434834 ) ) ( not ( = ?auto_434833 ?auto_434835 ) ) ( not ( = ?auto_434834 ?auto_434835 ) ) ( ON ?auto_434833 ?auto_434834 ) ( ON ?auto_434832 ?auto_434833 ) ( ON ?auto_434831 ?auto_434832 ) ( ON ?auto_434830 ?auto_434831 ) ( ON ?auto_434829 ?auto_434830 ) ( ON ?auto_434828 ?auto_434829 ) ( CLEAR ?auto_434826 ) ( ON ?auto_434827 ?auto_434828 ) ( CLEAR ?auto_434827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_434826 ?auto_434827 )
      ( MAKE-9PILE ?auto_434826 ?auto_434827 ?auto_434828 ?auto_434829 ?auto_434830 ?auto_434831 ?auto_434832 ?auto_434833 ?auto_434834 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434845 - BLOCK
      ?auto_434846 - BLOCK
      ?auto_434847 - BLOCK
      ?auto_434848 - BLOCK
      ?auto_434849 - BLOCK
      ?auto_434850 - BLOCK
      ?auto_434851 - BLOCK
      ?auto_434852 - BLOCK
      ?auto_434853 - BLOCK
    )
    :vars
    (
      ?auto_434854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434853 ?auto_434854 ) ( not ( = ?auto_434845 ?auto_434846 ) ) ( not ( = ?auto_434845 ?auto_434847 ) ) ( not ( = ?auto_434845 ?auto_434848 ) ) ( not ( = ?auto_434845 ?auto_434849 ) ) ( not ( = ?auto_434845 ?auto_434850 ) ) ( not ( = ?auto_434845 ?auto_434851 ) ) ( not ( = ?auto_434845 ?auto_434852 ) ) ( not ( = ?auto_434845 ?auto_434853 ) ) ( not ( = ?auto_434845 ?auto_434854 ) ) ( not ( = ?auto_434846 ?auto_434847 ) ) ( not ( = ?auto_434846 ?auto_434848 ) ) ( not ( = ?auto_434846 ?auto_434849 ) ) ( not ( = ?auto_434846 ?auto_434850 ) ) ( not ( = ?auto_434846 ?auto_434851 ) ) ( not ( = ?auto_434846 ?auto_434852 ) ) ( not ( = ?auto_434846 ?auto_434853 ) ) ( not ( = ?auto_434846 ?auto_434854 ) ) ( not ( = ?auto_434847 ?auto_434848 ) ) ( not ( = ?auto_434847 ?auto_434849 ) ) ( not ( = ?auto_434847 ?auto_434850 ) ) ( not ( = ?auto_434847 ?auto_434851 ) ) ( not ( = ?auto_434847 ?auto_434852 ) ) ( not ( = ?auto_434847 ?auto_434853 ) ) ( not ( = ?auto_434847 ?auto_434854 ) ) ( not ( = ?auto_434848 ?auto_434849 ) ) ( not ( = ?auto_434848 ?auto_434850 ) ) ( not ( = ?auto_434848 ?auto_434851 ) ) ( not ( = ?auto_434848 ?auto_434852 ) ) ( not ( = ?auto_434848 ?auto_434853 ) ) ( not ( = ?auto_434848 ?auto_434854 ) ) ( not ( = ?auto_434849 ?auto_434850 ) ) ( not ( = ?auto_434849 ?auto_434851 ) ) ( not ( = ?auto_434849 ?auto_434852 ) ) ( not ( = ?auto_434849 ?auto_434853 ) ) ( not ( = ?auto_434849 ?auto_434854 ) ) ( not ( = ?auto_434850 ?auto_434851 ) ) ( not ( = ?auto_434850 ?auto_434852 ) ) ( not ( = ?auto_434850 ?auto_434853 ) ) ( not ( = ?auto_434850 ?auto_434854 ) ) ( not ( = ?auto_434851 ?auto_434852 ) ) ( not ( = ?auto_434851 ?auto_434853 ) ) ( not ( = ?auto_434851 ?auto_434854 ) ) ( not ( = ?auto_434852 ?auto_434853 ) ) ( not ( = ?auto_434852 ?auto_434854 ) ) ( not ( = ?auto_434853 ?auto_434854 ) ) ( ON ?auto_434852 ?auto_434853 ) ( ON ?auto_434851 ?auto_434852 ) ( ON ?auto_434850 ?auto_434851 ) ( ON ?auto_434849 ?auto_434850 ) ( ON ?auto_434848 ?auto_434849 ) ( ON ?auto_434847 ?auto_434848 ) ( ON ?auto_434846 ?auto_434847 ) ( ON ?auto_434845 ?auto_434846 ) ( CLEAR ?auto_434845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434845 )
      ( MAKE-9PILE ?auto_434845 ?auto_434846 ?auto_434847 ?auto_434848 ?auto_434849 ?auto_434850 ?auto_434851 ?auto_434852 ?auto_434853 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_434864 - BLOCK
      ?auto_434865 - BLOCK
      ?auto_434866 - BLOCK
      ?auto_434867 - BLOCK
      ?auto_434868 - BLOCK
      ?auto_434869 - BLOCK
      ?auto_434870 - BLOCK
      ?auto_434871 - BLOCK
      ?auto_434872 - BLOCK
    )
    :vars
    (
      ?auto_434873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434872 ?auto_434873 ) ( not ( = ?auto_434864 ?auto_434865 ) ) ( not ( = ?auto_434864 ?auto_434866 ) ) ( not ( = ?auto_434864 ?auto_434867 ) ) ( not ( = ?auto_434864 ?auto_434868 ) ) ( not ( = ?auto_434864 ?auto_434869 ) ) ( not ( = ?auto_434864 ?auto_434870 ) ) ( not ( = ?auto_434864 ?auto_434871 ) ) ( not ( = ?auto_434864 ?auto_434872 ) ) ( not ( = ?auto_434864 ?auto_434873 ) ) ( not ( = ?auto_434865 ?auto_434866 ) ) ( not ( = ?auto_434865 ?auto_434867 ) ) ( not ( = ?auto_434865 ?auto_434868 ) ) ( not ( = ?auto_434865 ?auto_434869 ) ) ( not ( = ?auto_434865 ?auto_434870 ) ) ( not ( = ?auto_434865 ?auto_434871 ) ) ( not ( = ?auto_434865 ?auto_434872 ) ) ( not ( = ?auto_434865 ?auto_434873 ) ) ( not ( = ?auto_434866 ?auto_434867 ) ) ( not ( = ?auto_434866 ?auto_434868 ) ) ( not ( = ?auto_434866 ?auto_434869 ) ) ( not ( = ?auto_434866 ?auto_434870 ) ) ( not ( = ?auto_434866 ?auto_434871 ) ) ( not ( = ?auto_434866 ?auto_434872 ) ) ( not ( = ?auto_434866 ?auto_434873 ) ) ( not ( = ?auto_434867 ?auto_434868 ) ) ( not ( = ?auto_434867 ?auto_434869 ) ) ( not ( = ?auto_434867 ?auto_434870 ) ) ( not ( = ?auto_434867 ?auto_434871 ) ) ( not ( = ?auto_434867 ?auto_434872 ) ) ( not ( = ?auto_434867 ?auto_434873 ) ) ( not ( = ?auto_434868 ?auto_434869 ) ) ( not ( = ?auto_434868 ?auto_434870 ) ) ( not ( = ?auto_434868 ?auto_434871 ) ) ( not ( = ?auto_434868 ?auto_434872 ) ) ( not ( = ?auto_434868 ?auto_434873 ) ) ( not ( = ?auto_434869 ?auto_434870 ) ) ( not ( = ?auto_434869 ?auto_434871 ) ) ( not ( = ?auto_434869 ?auto_434872 ) ) ( not ( = ?auto_434869 ?auto_434873 ) ) ( not ( = ?auto_434870 ?auto_434871 ) ) ( not ( = ?auto_434870 ?auto_434872 ) ) ( not ( = ?auto_434870 ?auto_434873 ) ) ( not ( = ?auto_434871 ?auto_434872 ) ) ( not ( = ?auto_434871 ?auto_434873 ) ) ( not ( = ?auto_434872 ?auto_434873 ) ) ( ON ?auto_434871 ?auto_434872 ) ( ON ?auto_434870 ?auto_434871 ) ( ON ?auto_434869 ?auto_434870 ) ( ON ?auto_434868 ?auto_434869 ) ( ON ?auto_434867 ?auto_434868 ) ( ON ?auto_434866 ?auto_434867 ) ( ON ?auto_434865 ?auto_434866 ) ( ON ?auto_434864 ?auto_434865 ) ( CLEAR ?auto_434864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_434864 )
      ( MAKE-9PILE ?auto_434864 ?auto_434865 ?auto_434866 ?auto_434867 ?auto_434868 ?auto_434869 ?auto_434870 ?auto_434871 ?auto_434872 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_434884 - BLOCK
      ?auto_434885 - BLOCK
      ?auto_434886 - BLOCK
      ?auto_434887 - BLOCK
      ?auto_434888 - BLOCK
      ?auto_434889 - BLOCK
      ?auto_434890 - BLOCK
      ?auto_434891 - BLOCK
      ?auto_434892 - BLOCK
      ?auto_434893 - BLOCK
    )
    :vars
    (
      ?auto_434894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434892 ) ( ON ?auto_434893 ?auto_434894 ) ( CLEAR ?auto_434893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434884 ) ( ON ?auto_434885 ?auto_434884 ) ( ON ?auto_434886 ?auto_434885 ) ( ON ?auto_434887 ?auto_434886 ) ( ON ?auto_434888 ?auto_434887 ) ( ON ?auto_434889 ?auto_434888 ) ( ON ?auto_434890 ?auto_434889 ) ( ON ?auto_434891 ?auto_434890 ) ( ON ?auto_434892 ?auto_434891 ) ( not ( = ?auto_434884 ?auto_434885 ) ) ( not ( = ?auto_434884 ?auto_434886 ) ) ( not ( = ?auto_434884 ?auto_434887 ) ) ( not ( = ?auto_434884 ?auto_434888 ) ) ( not ( = ?auto_434884 ?auto_434889 ) ) ( not ( = ?auto_434884 ?auto_434890 ) ) ( not ( = ?auto_434884 ?auto_434891 ) ) ( not ( = ?auto_434884 ?auto_434892 ) ) ( not ( = ?auto_434884 ?auto_434893 ) ) ( not ( = ?auto_434884 ?auto_434894 ) ) ( not ( = ?auto_434885 ?auto_434886 ) ) ( not ( = ?auto_434885 ?auto_434887 ) ) ( not ( = ?auto_434885 ?auto_434888 ) ) ( not ( = ?auto_434885 ?auto_434889 ) ) ( not ( = ?auto_434885 ?auto_434890 ) ) ( not ( = ?auto_434885 ?auto_434891 ) ) ( not ( = ?auto_434885 ?auto_434892 ) ) ( not ( = ?auto_434885 ?auto_434893 ) ) ( not ( = ?auto_434885 ?auto_434894 ) ) ( not ( = ?auto_434886 ?auto_434887 ) ) ( not ( = ?auto_434886 ?auto_434888 ) ) ( not ( = ?auto_434886 ?auto_434889 ) ) ( not ( = ?auto_434886 ?auto_434890 ) ) ( not ( = ?auto_434886 ?auto_434891 ) ) ( not ( = ?auto_434886 ?auto_434892 ) ) ( not ( = ?auto_434886 ?auto_434893 ) ) ( not ( = ?auto_434886 ?auto_434894 ) ) ( not ( = ?auto_434887 ?auto_434888 ) ) ( not ( = ?auto_434887 ?auto_434889 ) ) ( not ( = ?auto_434887 ?auto_434890 ) ) ( not ( = ?auto_434887 ?auto_434891 ) ) ( not ( = ?auto_434887 ?auto_434892 ) ) ( not ( = ?auto_434887 ?auto_434893 ) ) ( not ( = ?auto_434887 ?auto_434894 ) ) ( not ( = ?auto_434888 ?auto_434889 ) ) ( not ( = ?auto_434888 ?auto_434890 ) ) ( not ( = ?auto_434888 ?auto_434891 ) ) ( not ( = ?auto_434888 ?auto_434892 ) ) ( not ( = ?auto_434888 ?auto_434893 ) ) ( not ( = ?auto_434888 ?auto_434894 ) ) ( not ( = ?auto_434889 ?auto_434890 ) ) ( not ( = ?auto_434889 ?auto_434891 ) ) ( not ( = ?auto_434889 ?auto_434892 ) ) ( not ( = ?auto_434889 ?auto_434893 ) ) ( not ( = ?auto_434889 ?auto_434894 ) ) ( not ( = ?auto_434890 ?auto_434891 ) ) ( not ( = ?auto_434890 ?auto_434892 ) ) ( not ( = ?auto_434890 ?auto_434893 ) ) ( not ( = ?auto_434890 ?auto_434894 ) ) ( not ( = ?auto_434891 ?auto_434892 ) ) ( not ( = ?auto_434891 ?auto_434893 ) ) ( not ( = ?auto_434891 ?auto_434894 ) ) ( not ( = ?auto_434892 ?auto_434893 ) ) ( not ( = ?auto_434892 ?auto_434894 ) ) ( not ( = ?auto_434893 ?auto_434894 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434893 ?auto_434894 )
      ( !STACK ?auto_434893 ?auto_434892 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_434905 - BLOCK
      ?auto_434906 - BLOCK
      ?auto_434907 - BLOCK
      ?auto_434908 - BLOCK
      ?auto_434909 - BLOCK
      ?auto_434910 - BLOCK
      ?auto_434911 - BLOCK
      ?auto_434912 - BLOCK
      ?auto_434913 - BLOCK
      ?auto_434914 - BLOCK
    )
    :vars
    (
      ?auto_434915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_434913 ) ( ON ?auto_434914 ?auto_434915 ) ( CLEAR ?auto_434914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_434905 ) ( ON ?auto_434906 ?auto_434905 ) ( ON ?auto_434907 ?auto_434906 ) ( ON ?auto_434908 ?auto_434907 ) ( ON ?auto_434909 ?auto_434908 ) ( ON ?auto_434910 ?auto_434909 ) ( ON ?auto_434911 ?auto_434910 ) ( ON ?auto_434912 ?auto_434911 ) ( ON ?auto_434913 ?auto_434912 ) ( not ( = ?auto_434905 ?auto_434906 ) ) ( not ( = ?auto_434905 ?auto_434907 ) ) ( not ( = ?auto_434905 ?auto_434908 ) ) ( not ( = ?auto_434905 ?auto_434909 ) ) ( not ( = ?auto_434905 ?auto_434910 ) ) ( not ( = ?auto_434905 ?auto_434911 ) ) ( not ( = ?auto_434905 ?auto_434912 ) ) ( not ( = ?auto_434905 ?auto_434913 ) ) ( not ( = ?auto_434905 ?auto_434914 ) ) ( not ( = ?auto_434905 ?auto_434915 ) ) ( not ( = ?auto_434906 ?auto_434907 ) ) ( not ( = ?auto_434906 ?auto_434908 ) ) ( not ( = ?auto_434906 ?auto_434909 ) ) ( not ( = ?auto_434906 ?auto_434910 ) ) ( not ( = ?auto_434906 ?auto_434911 ) ) ( not ( = ?auto_434906 ?auto_434912 ) ) ( not ( = ?auto_434906 ?auto_434913 ) ) ( not ( = ?auto_434906 ?auto_434914 ) ) ( not ( = ?auto_434906 ?auto_434915 ) ) ( not ( = ?auto_434907 ?auto_434908 ) ) ( not ( = ?auto_434907 ?auto_434909 ) ) ( not ( = ?auto_434907 ?auto_434910 ) ) ( not ( = ?auto_434907 ?auto_434911 ) ) ( not ( = ?auto_434907 ?auto_434912 ) ) ( not ( = ?auto_434907 ?auto_434913 ) ) ( not ( = ?auto_434907 ?auto_434914 ) ) ( not ( = ?auto_434907 ?auto_434915 ) ) ( not ( = ?auto_434908 ?auto_434909 ) ) ( not ( = ?auto_434908 ?auto_434910 ) ) ( not ( = ?auto_434908 ?auto_434911 ) ) ( not ( = ?auto_434908 ?auto_434912 ) ) ( not ( = ?auto_434908 ?auto_434913 ) ) ( not ( = ?auto_434908 ?auto_434914 ) ) ( not ( = ?auto_434908 ?auto_434915 ) ) ( not ( = ?auto_434909 ?auto_434910 ) ) ( not ( = ?auto_434909 ?auto_434911 ) ) ( not ( = ?auto_434909 ?auto_434912 ) ) ( not ( = ?auto_434909 ?auto_434913 ) ) ( not ( = ?auto_434909 ?auto_434914 ) ) ( not ( = ?auto_434909 ?auto_434915 ) ) ( not ( = ?auto_434910 ?auto_434911 ) ) ( not ( = ?auto_434910 ?auto_434912 ) ) ( not ( = ?auto_434910 ?auto_434913 ) ) ( not ( = ?auto_434910 ?auto_434914 ) ) ( not ( = ?auto_434910 ?auto_434915 ) ) ( not ( = ?auto_434911 ?auto_434912 ) ) ( not ( = ?auto_434911 ?auto_434913 ) ) ( not ( = ?auto_434911 ?auto_434914 ) ) ( not ( = ?auto_434911 ?auto_434915 ) ) ( not ( = ?auto_434912 ?auto_434913 ) ) ( not ( = ?auto_434912 ?auto_434914 ) ) ( not ( = ?auto_434912 ?auto_434915 ) ) ( not ( = ?auto_434913 ?auto_434914 ) ) ( not ( = ?auto_434913 ?auto_434915 ) ) ( not ( = ?auto_434914 ?auto_434915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_434914 ?auto_434915 )
      ( !STACK ?auto_434914 ?auto_434913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_434926 - BLOCK
      ?auto_434927 - BLOCK
      ?auto_434928 - BLOCK
      ?auto_434929 - BLOCK
      ?auto_434930 - BLOCK
      ?auto_434931 - BLOCK
      ?auto_434932 - BLOCK
      ?auto_434933 - BLOCK
      ?auto_434934 - BLOCK
      ?auto_434935 - BLOCK
    )
    :vars
    (
      ?auto_434936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434935 ?auto_434936 ) ( ON-TABLE ?auto_434926 ) ( ON ?auto_434927 ?auto_434926 ) ( ON ?auto_434928 ?auto_434927 ) ( ON ?auto_434929 ?auto_434928 ) ( ON ?auto_434930 ?auto_434929 ) ( ON ?auto_434931 ?auto_434930 ) ( ON ?auto_434932 ?auto_434931 ) ( ON ?auto_434933 ?auto_434932 ) ( not ( = ?auto_434926 ?auto_434927 ) ) ( not ( = ?auto_434926 ?auto_434928 ) ) ( not ( = ?auto_434926 ?auto_434929 ) ) ( not ( = ?auto_434926 ?auto_434930 ) ) ( not ( = ?auto_434926 ?auto_434931 ) ) ( not ( = ?auto_434926 ?auto_434932 ) ) ( not ( = ?auto_434926 ?auto_434933 ) ) ( not ( = ?auto_434926 ?auto_434934 ) ) ( not ( = ?auto_434926 ?auto_434935 ) ) ( not ( = ?auto_434926 ?auto_434936 ) ) ( not ( = ?auto_434927 ?auto_434928 ) ) ( not ( = ?auto_434927 ?auto_434929 ) ) ( not ( = ?auto_434927 ?auto_434930 ) ) ( not ( = ?auto_434927 ?auto_434931 ) ) ( not ( = ?auto_434927 ?auto_434932 ) ) ( not ( = ?auto_434927 ?auto_434933 ) ) ( not ( = ?auto_434927 ?auto_434934 ) ) ( not ( = ?auto_434927 ?auto_434935 ) ) ( not ( = ?auto_434927 ?auto_434936 ) ) ( not ( = ?auto_434928 ?auto_434929 ) ) ( not ( = ?auto_434928 ?auto_434930 ) ) ( not ( = ?auto_434928 ?auto_434931 ) ) ( not ( = ?auto_434928 ?auto_434932 ) ) ( not ( = ?auto_434928 ?auto_434933 ) ) ( not ( = ?auto_434928 ?auto_434934 ) ) ( not ( = ?auto_434928 ?auto_434935 ) ) ( not ( = ?auto_434928 ?auto_434936 ) ) ( not ( = ?auto_434929 ?auto_434930 ) ) ( not ( = ?auto_434929 ?auto_434931 ) ) ( not ( = ?auto_434929 ?auto_434932 ) ) ( not ( = ?auto_434929 ?auto_434933 ) ) ( not ( = ?auto_434929 ?auto_434934 ) ) ( not ( = ?auto_434929 ?auto_434935 ) ) ( not ( = ?auto_434929 ?auto_434936 ) ) ( not ( = ?auto_434930 ?auto_434931 ) ) ( not ( = ?auto_434930 ?auto_434932 ) ) ( not ( = ?auto_434930 ?auto_434933 ) ) ( not ( = ?auto_434930 ?auto_434934 ) ) ( not ( = ?auto_434930 ?auto_434935 ) ) ( not ( = ?auto_434930 ?auto_434936 ) ) ( not ( = ?auto_434931 ?auto_434932 ) ) ( not ( = ?auto_434931 ?auto_434933 ) ) ( not ( = ?auto_434931 ?auto_434934 ) ) ( not ( = ?auto_434931 ?auto_434935 ) ) ( not ( = ?auto_434931 ?auto_434936 ) ) ( not ( = ?auto_434932 ?auto_434933 ) ) ( not ( = ?auto_434932 ?auto_434934 ) ) ( not ( = ?auto_434932 ?auto_434935 ) ) ( not ( = ?auto_434932 ?auto_434936 ) ) ( not ( = ?auto_434933 ?auto_434934 ) ) ( not ( = ?auto_434933 ?auto_434935 ) ) ( not ( = ?auto_434933 ?auto_434936 ) ) ( not ( = ?auto_434934 ?auto_434935 ) ) ( not ( = ?auto_434934 ?auto_434936 ) ) ( not ( = ?auto_434935 ?auto_434936 ) ) ( CLEAR ?auto_434933 ) ( ON ?auto_434934 ?auto_434935 ) ( CLEAR ?auto_434934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_434926 ?auto_434927 ?auto_434928 ?auto_434929 ?auto_434930 ?auto_434931 ?auto_434932 ?auto_434933 ?auto_434934 )
      ( MAKE-10PILE ?auto_434926 ?auto_434927 ?auto_434928 ?auto_434929 ?auto_434930 ?auto_434931 ?auto_434932 ?auto_434933 ?auto_434934 ?auto_434935 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_434947 - BLOCK
      ?auto_434948 - BLOCK
      ?auto_434949 - BLOCK
      ?auto_434950 - BLOCK
      ?auto_434951 - BLOCK
      ?auto_434952 - BLOCK
      ?auto_434953 - BLOCK
      ?auto_434954 - BLOCK
      ?auto_434955 - BLOCK
      ?auto_434956 - BLOCK
    )
    :vars
    (
      ?auto_434957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434956 ?auto_434957 ) ( ON-TABLE ?auto_434947 ) ( ON ?auto_434948 ?auto_434947 ) ( ON ?auto_434949 ?auto_434948 ) ( ON ?auto_434950 ?auto_434949 ) ( ON ?auto_434951 ?auto_434950 ) ( ON ?auto_434952 ?auto_434951 ) ( ON ?auto_434953 ?auto_434952 ) ( ON ?auto_434954 ?auto_434953 ) ( not ( = ?auto_434947 ?auto_434948 ) ) ( not ( = ?auto_434947 ?auto_434949 ) ) ( not ( = ?auto_434947 ?auto_434950 ) ) ( not ( = ?auto_434947 ?auto_434951 ) ) ( not ( = ?auto_434947 ?auto_434952 ) ) ( not ( = ?auto_434947 ?auto_434953 ) ) ( not ( = ?auto_434947 ?auto_434954 ) ) ( not ( = ?auto_434947 ?auto_434955 ) ) ( not ( = ?auto_434947 ?auto_434956 ) ) ( not ( = ?auto_434947 ?auto_434957 ) ) ( not ( = ?auto_434948 ?auto_434949 ) ) ( not ( = ?auto_434948 ?auto_434950 ) ) ( not ( = ?auto_434948 ?auto_434951 ) ) ( not ( = ?auto_434948 ?auto_434952 ) ) ( not ( = ?auto_434948 ?auto_434953 ) ) ( not ( = ?auto_434948 ?auto_434954 ) ) ( not ( = ?auto_434948 ?auto_434955 ) ) ( not ( = ?auto_434948 ?auto_434956 ) ) ( not ( = ?auto_434948 ?auto_434957 ) ) ( not ( = ?auto_434949 ?auto_434950 ) ) ( not ( = ?auto_434949 ?auto_434951 ) ) ( not ( = ?auto_434949 ?auto_434952 ) ) ( not ( = ?auto_434949 ?auto_434953 ) ) ( not ( = ?auto_434949 ?auto_434954 ) ) ( not ( = ?auto_434949 ?auto_434955 ) ) ( not ( = ?auto_434949 ?auto_434956 ) ) ( not ( = ?auto_434949 ?auto_434957 ) ) ( not ( = ?auto_434950 ?auto_434951 ) ) ( not ( = ?auto_434950 ?auto_434952 ) ) ( not ( = ?auto_434950 ?auto_434953 ) ) ( not ( = ?auto_434950 ?auto_434954 ) ) ( not ( = ?auto_434950 ?auto_434955 ) ) ( not ( = ?auto_434950 ?auto_434956 ) ) ( not ( = ?auto_434950 ?auto_434957 ) ) ( not ( = ?auto_434951 ?auto_434952 ) ) ( not ( = ?auto_434951 ?auto_434953 ) ) ( not ( = ?auto_434951 ?auto_434954 ) ) ( not ( = ?auto_434951 ?auto_434955 ) ) ( not ( = ?auto_434951 ?auto_434956 ) ) ( not ( = ?auto_434951 ?auto_434957 ) ) ( not ( = ?auto_434952 ?auto_434953 ) ) ( not ( = ?auto_434952 ?auto_434954 ) ) ( not ( = ?auto_434952 ?auto_434955 ) ) ( not ( = ?auto_434952 ?auto_434956 ) ) ( not ( = ?auto_434952 ?auto_434957 ) ) ( not ( = ?auto_434953 ?auto_434954 ) ) ( not ( = ?auto_434953 ?auto_434955 ) ) ( not ( = ?auto_434953 ?auto_434956 ) ) ( not ( = ?auto_434953 ?auto_434957 ) ) ( not ( = ?auto_434954 ?auto_434955 ) ) ( not ( = ?auto_434954 ?auto_434956 ) ) ( not ( = ?auto_434954 ?auto_434957 ) ) ( not ( = ?auto_434955 ?auto_434956 ) ) ( not ( = ?auto_434955 ?auto_434957 ) ) ( not ( = ?auto_434956 ?auto_434957 ) ) ( CLEAR ?auto_434954 ) ( ON ?auto_434955 ?auto_434956 ) ( CLEAR ?auto_434955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_434947 ?auto_434948 ?auto_434949 ?auto_434950 ?auto_434951 ?auto_434952 ?auto_434953 ?auto_434954 ?auto_434955 )
      ( MAKE-10PILE ?auto_434947 ?auto_434948 ?auto_434949 ?auto_434950 ?auto_434951 ?auto_434952 ?auto_434953 ?auto_434954 ?auto_434955 ?auto_434956 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_434968 - BLOCK
      ?auto_434969 - BLOCK
      ?auto_434970 - BLOCK
      ?auto_434971 - BLOCK
      ?auto_434972 - BLOCK
      ?auto_434973 - BLOCK
      ?auto_434974 - BLOCK
      ?auto_434975 - BLOCK
      ?auto_434976 - BLOCK
      ?auto_434977 - BLOCK
    )
    :vars
    (
      ?auto_434978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434977 ?auto_434978 ) ( ON-TABLE ?auto_434968 ) ( ON ?auto_434969 ?auto_434968 ) ( ON ?auto_434970 ?auto_434969 ) ( ON ?auto_434971 ?auto_434970 ) ( ON ?auto_434972 ?auto_434971 ) ( ON ?auto_434973 ?auto_434972 ) ( ON ?auto_434974 ?auto_434973 ) ( not ( = ?auto_434968 ?auto_434969 ) ) ( not ( = ?auto_434968 ?auto_434970 ) ) ( not ( = ?auto_434968 ?auto_434971 ) ) ( not ( = ?auto_434968 ?auto_434972 ) ) ( not ( = ?auto_434968 ?auto_434973 ) ) ( not ( = ?auto_434968 ?auto_434974 ) ) ( not ( = ?auto_434968 ?auto_434975 ) ) ( not ( = ?auto_434968 ?auto_434976 ) ) ( not ( = ?auto_434968 ?auto_434977 ) ) ( not ( = ?auto_434968 ?auto_434978 ) ) ( not ( = ?auto_434969 ?auto_434970 ) ) ( not ( = ?auto_434969 ?auto_434971 ) ) ( not ( = ?auto_434969 ?auto_434972 ) ) ( not ( = ?auto_434969 ?auto_434973 ) ) ( not ( = ?auto_434969 ?auto_434974 ) ) ( not ( = ?auto_434969 ?auto_434975 ) ) ( not ( = ?auto_434969 ?auto_434976 ) ) ( not ( = ?auto_434969 ?auto_434977 ) ) ( not ( = ?auto_434969 ?auto_434978 ) ) ( not ( = ?auto_434970 ?auto_434971 ) ) ( not ( = ?auto_434970 ?auto_434972 ) ) ( not ( = ?auto_434970 ?auto_434973 ) ) ( not ( = ?auto_434970 ?auto_434974 ) ) ( not ( = ?auto_434970 ?auto_434975 ) ) ( not ( = ?auto_434970 ?auto_434976 ) ) ( not ( = ?auto_434970 ?auto_434977 ) ) ( not ( = ?auto_434970 ?auto_434978 ) ) ( not ( = ?auto_434971 ?auto_434972 ) ) ( not ( = ?auto_434971 ?auto_434973 ) ) ( not ( = ?auto_434971 ?auto_434974 ) ) ( not ( = ?auto_434971 ?auto_434975 ) ) ( not ( = ?auto_434971 ?auto_434976 ) ) ( not ( = ?auto_434971 ?auto_434977 ) ) ( not ( = ?auto_434971 ?auto_434978 ) ) ( not ( = ?auto_434972 ?auto_434973 ) ) ( not ( = ?auto_434972 ?auto_434974 ) ) ( not ( = ?auto_434972 ?auto_434975 ) ) ( not ( = ?auto_434972 ?auto_434976 ) ) ( not ( = ?auto_434972 ?auto_434977 ) ) ( not ( = ?auto_434972 ?auto_434978 ) ) ( not ( = ?auto_434973 ?auto_434974 ) ) ( not ( = ?auto_434973 ?auto_434975 ) ) ( not ( = ?auto_434973 ?auto_434976 ) ) ( not ( = ?auto_434973 ?auto_434977 ) ) ( not ( = ?auto_434973 ?auto_434978 ) ) ( not ( = ?auto_434974 ?auto_434975 ) ) ( not ( = ?auto_434974 ?auto_434976 ) ) ( not ( = ?auto_434974 ?auto_434977 ) ) ( not ( = ?auto_434974 ?auto_434978 ) ) ( not ( = ?auto_434975 ?auto_434976 ) ) ( not ( = ?auto_434975 ?auto_434977 ) ) ( not ( = ?auto_434975 ?auto_434978 ) ) ( not ( = ?auto_434976 ?auto_434977 ) ) ( not ( = ?auto_434976 ?auto_434978 ) ) ( not ( = ?auto_434977 ?auto_434978 ) ) ( ON ?auto_434976 ?auto_434977 ) ( CLEAR ?auto_434974 ) ( ON ?auto_434975 ?auto_434976 ) ( CLEAR ?auto_434975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_434968 ?auto_434969 ?auto_434970 ?auto_434971 ?auto_434972 ?auto_434973 ?auto_434974 ?auto_434975 )
      ( MAKE-10PILE ?auto_434968 ?auto_434969 ?auto_434970 ?auto_434971 ?auto_434972 ?auto_434973 ?auto_434974 ?auto_434975 ?auto_434976 ?auto_434977 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_434989 - BLOCK
      ?auto_434990 - BLOCK
      ?auto_434991 - BLOCK
      ?auto_434992 - BLOCK
      ?auto_434993 - BLOCK
      ?auto_434994 - BLOCK
      ?auto_434995 - BLOCK
      ?auto_434996 - BLOCK
      ?auto_434997 - BLOCK
      ?auto_434998 - BLOCK
    )
    :vars
    (
      ?auto_434999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_434998 ?auto_434999 ) ( ON-TABLE ?auto_434989 ) ( ON ?auto_434990 ?auto_434989 ) ( ON ?auto_434991 ?auto_434990 ) ( ON ?auto_434992 ?auto_434991 ) ( ON ?auto_434993 ?auto_434992 ) ( ON ?auto_434994 ?auto_434993 ) ( ON ?auto_434995 ?auto_434994 ) ( not ( = ?auto_434989 ?auto_434990 ) ) ( not ( = ?auto_434989 ?auto_434991 ) ) ( not ( = ?auto_434989 ?auto_434992 ) ) ( not ( = ?auto_434989 ?auto_434993 ) ) ( not ( = ?auto_434989 ?auto_434994 ) ) ( not ( = ?auto_434989 ?auto_434995 ) ) ( not ( = ?auto_434989 ?auto_434996 ) ) ( not ( = ?auto_434989 ?auto_434997 ) ) ( not ( = ?auto_434989 ?auto_434998 ) ) ( not ( = ?auto_434989 ?auto_434999 ) ) ( not ( = ?auto_434990 ?auto_434991 ) ) ( not ( = ?auto_434990 ?auto_434992 ) ) ( not ( = ?auto_434990 ?auto_434993 ) ) ( not ( = ?auto_434990 ?auto_434994 ) ) ( not ( = ?auto_434990 ?auto_434995 ) ) ( not ( = ?auto_434990 ?auto_434996 ) ) ( not ( = ?auto_434990 ?auto_434997 ) ) ( not ( = ?auto_434990 ?auto_434998 ) ) ( not ( = ?auto_434990 ?auto_434999 ) ) ( not ( = ?auto_434991 ?auto_434992 ) ) ( not ( = ?auto_434991 ?auto_434993 ) ) ( not ( = ?auto_434991 ?auto_434994 ) ) ( not ( = ?auto_434991 ?auto_434995 ) ) ( not ( = ?auto_434991 ?auto_434996 ) ) ( not ( = ?auto_434991 ?auto_434997 ) ) ( not ( = ?auto_434991 ?auto_434998 ) ) ( not ( = ?auto_434991 ?auto_434999 ) ) ( not ( = ?auto_434992 ?auto_434993 ) ) ( not ( = ?auto_434992 ?auto_434994 ) ) ( not ( = ?auto_434992 ?auto_434995 ) ) ( not ( = ?auto_434992 ?auto_434996 ) ) ( not ( = ?auto_434992 ?auto_434997 ) ) ( not ( = ?auto_434992 ?auto_434998 ) ) ( not ( = ?auto_434992 ?auto_434999 ) ) ( not ( = ?auto_434993 ?auto_434994 ) ) ( not ( = ?auto_434993 ?auto_434995 ) ) ( not ( = ?auto_434993 ?auto_434996 ) ) ( not ( = ?auto_434993 ?auto_434997 ) ) ( not ( = ?auto_434993 ?auto_434998 ) ) ( not ( = ?auto_434993 ?auto_434999 ) ) ( not ( = ?auto_434994 ?auto_434995 ) ) ( not ( = ?auto_434994 ?auto_434996 ) ) ( not ( = ?auto_434994 ?auto_434997 ) ) ( not ( = ?auto_434994 ?auto_434998 ) ) ( not ( = ?auto_434994 ?auto_434999 ) ) ( not ( = ?auto_434995 ?auto_434996 ) ) ( not ( = ?auto_434995 ?auto_434997 ) ) ( not ( = ?auto_434995 ?auto_434998 ) ) ( not ( = ?auto_434995 ?auto_434999 ) ) ( not ( = ?auto_434996 ?auto_434997 ) ) ( not ( = ?auto_434996 ?auto_434998 ) ) ( not ( = ?auto_434996 ?auto_434999 ) ) ( not ( = ?auto_434997 ?auto_434998 ) ) ( not ( = ?auto_434997 ?auto_434999 ) ) ( not ( = ?auto_434998 ?auto_434999 ) ) ( ON ?auto_434997 ?auto_434998 ) ( CLEAR ?auto_434995 ) ( ON ?auto_434996 ?auto_434997 ) ( CLEAR ?auto_434996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_434989 ?auto_434990 ?auto_434991 ?auto_434992 ?auto_434993 ?auto_434994 ?auto_434995 ?auto_434996 )
      ( MAKE-10PILE ?auto_434989 ?auto_434990 ?auto_434991 ?auto_434992 ?auto_434993 ?auto_434994 ?auto_434995 ?auto_434996 ?auto_434997 ?auto_434998 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435010 - BLOCK
      ?auto_435011 - BLOCK
      ?auto_435012 - BLOCK
      ?auto_435013 - BLOCK
      ?auto_435014 - BLOCK
      ?auto_435015 - BLOCK
      ?auto_435016 - BLOCK
      ?auto_435017 - BLOCK
      ?auto_435018 - BLOCK
      ?auto_435019 - BLOCK
    )
    :vars
    (
      ?auto_435020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435019 ?auto_435020 ) ( ON-TABLE ?auto_435010 ) ( ON ?auto_435011 ?auto_435010 ) ( ON ?auto_435012 ?auto_435011 ) ( ON ?auto_435013 ?auto_435012 ) ( ON ?auto_435014 ?auto_435013 ) ( ON ?auto_435015 ?auto_435014 ) ( not ( = ?auto_435010 ?auto_435011 ) ) ( not ( = ?auto_435010 ?auto_435012 ) ) ( not ( = ?auto_435010 ?auto_435013 ) ) ( not ( = ?auto_435010 ?auto_435014 ) ) ( not ( = ?auto_435010 ?auto_435015 ) ) ( not ( = ?auto_435010 ?auto_435016 ) ) ( not ( = ?auto_435010 ?auto_435017 ) ) ( not ( = ?auto_435010 ?auto_435018 ) ) ( not ( = ?auto_435010 ?auto_435019 ) ) ( not ( = ?auto_435010 ?auto_435020 ) ) ( not ( = ?auto_435011 ?auto_435012 ) ) ( not ( = ?auto_435011 ?auto_435013 ) ) ( not ( = ?auto_435011 ?auto_435014 ) ) ( not ( = ?auto_435011 ?auto_435015 ) ) ( not ( = ?auto_435011 ?auto_435016 ) ) ( not ( = ?auto_435011 ?auto_435017 ) ) ( not ( = ?auto_435011 ?auto_435018 ) ) ( not ( = ?auto_435011 ?auto_435019 ) ) ( not ( = ?auto_435011 ?auto_435020 ) ) ( not ( = ?auto_435012 ?auto_435013 ) ) ( not ( = ?auto_435012 ?auto_435014 ) ) ( not ( = ?auto_435012 ?auto_435015 ) ) ( not ( = ?auto_435012 ?auto_435016 ) ) ( not ( = ?auto_435012 ?auto_435017 ) ) ( not ( = ?auto_435012 ?auto_435018 ) ) ( not ( = ?auto_435012 ?auto_435019 ) ) ( not ( = ?auto_435012 ?auto_435020 ) ) ( not ( = ?auto_435013 ?auto_435014 ) ) ( not ( = ?auto_435013 ?auto_435015 ) ) ( not ( = ?auto_435013 ?auto_435016 ) ) ( not ( = ?auto_435013 ?auto_435017 ) ) ( not ( = ?auto_435013 ?auto_435018 ) ) ( not ( = ?auto_435013 ?auto_435019 ) ) ( not ( = ?auto_435013 ?auto_435020 ) ) ( not ( = ?auto_435014 ?auto_435015 ) ) ( not ( = ?auto_435014 ?auto_435016 ) ) ( not ( = ?auto_435014 ?auto_435017 ) ) ( not ( = ?auto_435014 ?auto_435018 ) ) ( not ( = ?auto_435014 ?auto_435019 ) ) ( not ( = ?auto_435014 ?auto_435020 ) ) ( not ( = ?auto_435015 ?auto_435016 ) ) ( not ( = ?auto_435015 ?auto_435017 ) ) ( not ( = ?auto_435015 ?auto_435018 ) ) ( not ( = ?auto_435015 ?auto_435019 ) ) ( not ( = ?auto_435015 ?auto_435020 ) ) ( not ( = ?auto_435016 ?auto_435017 ) ) ( not ( = ?auto_435016 ?auto_435018 ) ) ( not ( = ?auto_435016 ?auto_435019 ) ) ( not ( = ?auto_435016 ?auto_435020 ) ) ( not ( = ?auto_435017 ?auto_435018 ) ) ( not ( = ?auto_435017 ?auto_435019 ) ) ( not ( = ?auto_435017 ?auto_435020 ) ) ( not ( = ?auto_435018 ?auto_435019 ) ) ( not ( = ?auto_435018 ?auto_435020 ) ) ( not ( = ?auto_435019 ?auto_435020 ) ) ( ON ?auto_435018 ?auto_435019 ) ( ON ?auto_435017 ?auto_435018 ) ( CLEAR ?auto_435015 ) ( ON ?auto_435016 ?auto_435017 ) ( CLEAR ?auto_435016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_435010 ?auto_435011 ?auto_435012 ?auto_435013 ?auto_435014 ?auto_435015 ?auto_435016 )
      ( MAKE-10PILE ?auto_435010 ?auto_435011 ?auto_435012 ?auto_435013 ?auto_435014 ?auto_435015 ?auto_435016 ?auto_435017 ?auto_435018 ?auto_435019 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435031 - BLOCK
      ?auto_435032 - BLOCK
      ?auto_435033 - BLOCK
      ?auto_435034 - BLOCK
      ?auto_435035 - BLOCK
      ?auto_435036 - BLOCK
      ?auto_435037 - BLOCK
      ?auto_435038 - BLOCK
      ?auto_435039 - BLOCK
      ?auto_435040 - BLOCK
    )
    :vars
    (
      ?auto_435041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435040 ?auto_435041 ) ( ON-TABLE ?auto_435031 ) ( ON ?auto_435032 ?auto_435031 ) ( ON ?auto_435033 ?auto_435032 ) ( ON ?auto_435034 ?auto_435033 ) ( ON ?auto_435035 ?auto_435034 ) ( ON ?auto_435036 ?auto_435035 ) ( not ( = ?auto_435031 ?auto_435032 ) ) ( not ( = ?auto_435031 ?auto_435033 ) ) ( not ( = ?auto_435031 ?auto_435034 ) ) ( not ( = ?auto_435031 ?auto_435035 ) ) ( not ( = ?auto_435031 ?auto_435036 ) ) ( not ( = ?auto_435031 ?auto_435037 ) ) ( not ( = ?auto_435031 ?auto_435038 ) ) ( not ( = ?auto_435031 ?auto_435039 ) ) ( not ( = ?auto_435031 ?auto_435040 ) ) ( not ( = ?auto_435031 ?auto_435041 ) ) ( not ( = ?auto_435032 ?auto_435033 ) ) ( not ( = ?auto_435032 ?auto_435034 ) ) ( not ( = ?auto_435032 ?auto_435035 ) ) ( not ( = ?auto_435032 ?auto_435036 ) ) ( not ( = ?auto_435032 ?auto_435037 ) ) ( not ( = ?auto_435032 ?auto_435038 ) ) ( not ( = ?auto_435032 ?auto_435039 ) ) ( not ( = ?auto_435032 ?auto_435040 ) ) ( not ( = ?auto_435032 ?auto_435041 ) ) ( not ( = ?auto_435033 ?auto_435034 ) ) ( not ( = ?auto_435033 ?auto_435035 ) ) ( not ( = ?auto_435033 ?auto_435036 ) ) ( not ( = ?auto_435033 ?auto_435037 ) ) ( not ( = ?auto_435033 ?auto_435038 ) ) ( not ( = ?auto_435033 ?auto_435039 ) ) ( not ( = ?auto_435033 ?auto_435040 ) ) ( not ( = ?auto_435033 ?auto_435041 ) ) ( not ( = ?auto_435034 ?auto_435035 ) ) ( not ( = ?auto_435034 ?auto_435036 ) ) ( not ( = ?auto_435034 ?auto_435037 ) ) ( not ( = ?auto_435034 ?auto_435038 ) ) ( not ( = ?auto_435034 ?auto_435039 ) ) ( not ( = ?auto_435034 ?auto_435040 ) ) ( not ( = ?auto_435034 ?auto_435041 ) ) ( not ( = ?auto_435035 ?auto_435036 ) ) ( not ( = ?auto_435035 ?auto_435037 ) ) ( not ( = ?auto_435035 ?auto_435038 ) ) ( not ( = ?auto_435035 ?auto_435039 ) ) ( not ( = ?auto_435035 ?auto_435040 ) ) ( not ( = ?auto_435035 ?auto_435041 ) ) ( not ( = ?auto_435036 ?auto_435037 ) ) ( not ( = ?auto_435036 ?auto_435038 ) ) ( not ( = ?auto_435036 ?auto_435039 ) ) ( not ( = ?auto_435036 ?auto_435040 ) ) ( not ( = ?auto_435036 ?auto_435041 ) ) ( not ( = ?auto_435037 ?auto_435038 ) ) ( not ( = ?auto_435037 ?auto_435039 ) ) ( not ( = ?auto_435037 ?auto_435040 ) ) ( not ( = ?auto_435037 ?auto_435041 ) ) ( not ( = ?auto_435038 ?auto_435039 ) ) ( not ( = ?auto_435038 ?auto_435040 ) ) ( not ( = ?auto_435038 ?auto_435041 ) ) ( not ( = ?auto_435039 ?auto_435040 ) ) ( not ( = ?auto_435039 ?auto_435041 ) ) ( not ( = ?auto_435040 ?auto_435041 ) ) ( ON ?auto_435039 ?auto_435040 ) ( ON ?auto_435038 ?auto_435039 ) ( CLEAR ?auto_435036 ) ( ON ?auto_435037 ?auto_435038 ) ( CLEAR ?auto_435037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_435031 ?auto_435032 ?auto_435033 ?auto_435034 ?auto_435035 ?auto_435036 ?auto_435037 )
      ( MAKE-10PILE ?auto_435031 ?auto_435032 ?auto_435033 ?auto_435034 ?auto_435035 ?auto_435036 ?auto_435037 ?auto_435038 ?auto_435039 ?auto_435040 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435052 - BLOCK
      ?auto_435053 - BLOCK
      ?auto_435054 - BLOCK
      ?auto_435055 - BLOCK
      ?auto_435056 - BLOCK
      ?auto_435057 - BLOCK
      ?auto_435058 - BLOCK
      ?auto_435059 - BLOCK
      ?auto_435060 - BLOCK
      ?auto_435061 - BLOCK
    )
    :vars
    (
      ?auto_435062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435061 ?auto_435062 ) ( ON-TABLE ?auto_435052 ) ( ON ?auto_435053 ?auto_435052 ) ( ON ?auto_435054 ?auto_435053 ) ( ON ?auto_435055 ?auto_435054 ) ( ON ?auto_435056 ?auto_435055 ) ( not ( = ?auto_435052 ?auto_435053 ) ) ( not ( = ?auto_435052 ?auto_435054 ) ) ( not ( = ?auto_435052 ?auto_435055 ) ) ( not ( = ?auto_435052 ?auto_435056 ) ) ( not ( = ?auto_435052 ?auto_435057 ) ) ( not ( = ?auto_435052 ?auto_435058 ) ) ( not ( = ?auto_435052 ?auto_435059 ) ) ( not ( = ?auto_435052 ?auto_435060 ) ) ( not ( = ?auto_435052 ?auto_435061 ) ) ( not ( = ?auto_435052 ?auto_435062 ) ) ( not ( = ?auto_435053 ?auto_435054 ) ) ( not ( = ?auto_435053 ?auto_435055 ) ) ( not ( = ?auto_435053 ?auto_435056 ) ) ( not ( = ?auto_435053 ?auto_435057 ) ) ( not ( = ?auto_435053 ?auto_435058 ) ) ( not ( = ?auto_435053 ?auto_435059 ) ) ( not ( = ?auto_435053 ?auto_435060 ) ) ( not ( = ?auto_435053 ?auto_435061 ) ) ( not ( = ?auto_435053 ?auto_435062 ) ) ( not ( = ?auto_435054 ?auto_435055 ) ) ( not ( = ?auto_435054 ?auto_435056 ) ) ( not ( = ?auto_435054 ?auto_435057 ) ) ( not ( = ?auto_435054 ?auto_435058 ) ) ( not ( = ?auto_435054 ?auto_435059 ) ) ( not ( = ?auto_435054 ?auto_435060 ) ) ( not ( = ?auto_435054 ?auto_435061 ) ) ( not ( = ?auto_435054 ?auto_435062 ) ) ( not ( = ?auto_435055 ?auto_435056 ) ) ( not ( = ?auto_435055 ?auto_435057 ) ) ( not ( = ?auto_435055 ?auto_435058 ) ) ( not ( = ?auto_435055 ?auto_435059 ) ) ( not ( = ?auto_435055 ?auto_435060 ) ) ( not ( = ?auto_435055 ?auto_435061 ) ) ( not ( = ?auto_435055 ?auto_435062 ) ) ( not ( = ?auto_435056 ?auto_435057 ) ) ( not ( = ?auto_435056 ?auto_435058 ) ) ( not ( = ?auto_435056 ?auto_435059 ) ) ( not ( = ?auto_435056 ?auto_435060 ) ) ( not ( = ?auto_435056 ?auto_435061 ) ) ( not ( = ?auto_435056 ?auto_435062 ) ) ( not ( = ?auto_435057 ?auto_435058 ) ) ( not ( = ?auto_435057 ?auto_435059 ) ) ( not ( = ?auto_435057 ?auto_435060 ) ) ( not ( = ?auto_435057 ?auto_435061 ) ) ( not ( = ?auto_435057 ?auto_435062 ) ) ( not ( = ?auto_435058 ?auto_435059 ) ) ( not ( = ?auto_435058 ?auto_435060 ) ) ( not ( = ?auto_435058 ?auto_435061 ) ) ( not ( = ?auto_435058 ?auto_435062 ) ) ( not ( = ?auto_435059 ?auto_435060 ) ) ( not ( = ?auto_435059 ?auto_435061 ) ) ( not ( = ?auto_435059 ?auto_435062 ) ) ( not ( = ?auto_435060 ?auto_435061 ) ) ( not ( = ?auto_435060 ?auto_435062 ) ) ( not ( = ?auto_435061 ?auto_435062 ) ) ( ON ?auto_435060 ?auto_435061 ) ( ON ?auto_435059 ?auto_435060 ) ( ON ?auto_435058 ?auto_435059 ) ( CLEAR ?auto_435056 ) ( ON ?auto_435057 ?auto_435058 ) ( CLEAR ?auto_435057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_435052 ?auto_435053 ?auto_435054 ?auto_435055 ?auto_435056 ?auto_435057 )
      ( MAKE-10PILE ?auto_435052 ?auto_435053 ?auto_435054 ?auto_435055 ?auto_435056 ?auto_435057 ?auto_435058 ?auto_435059 ?auto_435060 ?auto_435061 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435073 - BLOCK
      ?auto_435074 - BLOCK
      ?auto_435075 - BLOCK
      ?auto_435076 - BLOCK
      ?auto_435077 - BLOCK
      ?auto_435078 - BLOCK
      ?auto_435079 - BLOCK
      ?auto_435080 - BLOCK
      ?auto_435081 - BLOCK
      ?auto_435082 - BLOCK
    )
    :vars
    (
      ?auto_435083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435082 ?auto_435083 ) ( ON-TABLE ?auto_435073 ) ( ON ?auto_435074 ?auto_435073 ) ( ON ?auto_435075 ?auto_435074 ) ( ON ?auto_435076 ?auto_435075 ) ( ON ?auto_435077 ?auto_435076 ) ( not ( = ?auto_435073 ?auto_435074 ) ) ( not ( = ?auto_435073 ?auto_435075 ) ) ( not ( = ?auto_435073 ?auto_435076 ) ) ( not ( = ?auto_435073 ?auto_435077 ) ) ( not ( = ?auto_435073 ?auto_435078 ) ) ( not ( = ?auto_435073 ?auto_435079 ) ) ( not ( = ?auto_435073 ?auto_435080 ) ) ( not ( = ?auto_435073 ?auto_435081 ) ) ( not ( = ?auto_435073 ?auto_435082 ) ) ( not ( = ?auto_435073 ?auto_435083 ) ) ( not ( = ?auto_435074 ?auto_435075 ) ) ( not ( = ?auto_435074 ?auto_435076 ) ) ( not ( = ?auto_435074 ?auto_435077 ) ) ( not ( = ?auto_435074 ?auto_435078 ) ) ( not ( = ?auto_435074 ?auto_435079 ) ) ( not ( = ?auto_435074 ?auto_435080 ) ) ( not ( = ?auto_435074 ?auto_435081 ) ) ( not ( = ?auto_435074 ?auto_435082 ) ) ( not ( = ?auto_435074 ?auto_435083 ) ) ( not ( = ?auto_435075 ?auto_435076 ) ) ( not ( = ?auto_435075 ?auto_435077 ) ) ( not ( = ?auto_435075 ?auto_435078 ) ) ( not ( = ?auto_435075 ?auto_435079 ) ) ( not ( = ?auto_435075 ?auto_435080 ) ) ( not ( = ?auto_435075 ?auto_435081 ) ) ( not ( = ?auto_435075 ?auto_435082 ) ) ( not ( = ?auto_435075 ?auto_435083 ) ) ( not ( = ?auto_435076 ?auto_435077 ) ) ( not ( = ?auto_435076 ?auto_435078 ) ) ( not ( = ?auto_435076 ?auto_435079 ) ) ( not ( = ?auto_435076 ?auto_435080 ) ) ( not ( = ?auto_435076 ?auto_435081 ) ) ( not ( = ?auto_435076 ?auto_435082 ) ) ( not ( = ?auto_435076 ?auto_435083 ) ) ( not ( = ?auto_435077 ?auto_435078 ) ) ( not ( = ?auto_435077 ?auto_435079 ) ) ( not ( = ?auto_435077 ?auto_435080 ) ) ( not ( = ?auto_435077 ?auto_435081 ) ) ( not ( = ?auto_435077 ?auto_435082 ) ) ( not ( = ?auto_435077 ?auto_435083 ) ) ( not ( = ?auto_435078 ?auto_435079 ) ) ( not ( = ?auto_435078 ?auto_435080 ) ) ( not ( = ?auto_435078 ?auto_435081 ) ) ( not ( = ?auto_435078 ?auto_435082 ) ) ( not ( = ?auto_435078 ?auto_435083 ) ) ( not ( = ?auto_435079 ?auto_435080 ) ) ( not ( = ?auto_435079 ?auto_435081 ) ) ( not ( = ?auto_435079 ?auto_435082 ) ) ( not ( = ?auto_435079 ?auto_435083 ) ) ( not ( = ?auto_435080 ?auto_435081 ) ) ( not ( = ?auto_435080 ?auto_435082 ) ) ( not ( = ?auto_435080 ?auto_435083 ) ) ( not ( = ?auto_435081 ?auto_435082 ) ) ( not ( = ?auto_435081 ?auto_435083 ) ) ( not ( = ?auto_435082 ?auto_435083 ) ) ( ON ?auto_435081 ?auto_435082 ) ( ON ?auto_435080 ?auto_435081 ) ( ON ?auto_435079 ?auto_435080 ) ( CLEAR ?auto_435077 ) ( ON ?auto_435078 ?auto_435079 ) ( CLEAR ?auto_435078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_435073 ?auto_435074 ?auto_435075 ?auto_435076 ?auto_435077 ?auto_435078 )
      ( MAKE-10PILE ?auto_435073 ?auto_435074 ?auto_435075 ?auto_435076 ?auto_435077 ?auto_435078 ?auto_435079 ?auto_435080 ?auto_435081 ?auto_435082 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435094 - BLOCK
      ?auto_435095 - BLOCK
      ?auto_435096 - BLOCK
      ?auto_435097 - BLOCK
      ?auto_435098 - BLOCK
      ?auto_435099 - BLOCK
      ?auto_435100 - BLOCK
      ?auto_435101 - BLOCK
      ?auto_435102 - BLOCK
      ?auto_435103 - BLOCK
    )
    :vars
    (
      ?auto_435104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435103 ?auto_435104 ) ( ON-TABLE ?auto_435094 ) ( ON ?auto_435095 ?auto_435094 ) ( ON ?auto_435096 ?auto_435095 ) ( ON ?auto_435097 ?auto_435096 ) ( not ( = ?auto_435094 ?auto_435095 ) ) ( not ( = ?auto_435094 ?auto_435096 ) ) ( not ( = ?auto_435094 ?auto_435097 ) ) ( not ( = ?auto_435094 ?auto_435098 ) ) ( not ( = ?auto_435094 ?auto_435099 ) ) ( not ( = ?auto_435094 ?auto_435100 ) ) ( not ( = ?auto_435094 ?auto_435101 ) ) ( not ( = ?auto_435094 ?auto_435102 ) ) ( not ( = ?auto_435094 ?auto_435103 ) ) ( not ( = ?auto_435094 ?auto_435104 ) ) ( not ( = ?auto_435095 ?auto_435096 ) ) ( not ( = ?auto_435095 ?auto_435097 ) ) ( not ( = ?auto_435095 ?auto_435098 ) ) ( not ( = ?auto_435095 ?auto_435099 ) ) ( not ( = ?auto_435095 ?auto_435100 ) ) ( not ( = ?auto_435095 ?auto_435101 ) ) ( not ( = ?auto_435095 ?auto_435102 ) ) ( not ( = ?auto_435095 ?auto_435103 ) ) ( not ( = ?auto_435095 ?auto_435104 ) ) ( not ( = ?auto_435096 ?auto_435097 ) ) ( not ( = ?auto_435096 ?auto_435098 ) ) ( not ( = ?auto_435096 ?auto_435099 ) ) ( not ( = ?auto_435096 ?auto_435100 ) ) ( not ( = ?auto_435096 ?auto_435101 ) ) ( not ( = ?auto_435096 ?auto_435102 ) ) ( not ( = ?auto_435096 ?auto_435103 ) ) ( not ( = ?auto_435096 ?auto_435104 ) ) ( not ( = ?auto_435097 ?auto_435098 ) ) ( not ( = ?auto_435097 ?auto_435099 ) ) ( not ( = ?auto_435097 ?auto_435100 ) ) ( not ( = ?auto_435097 ?auto_435101 ) ) ( not ( = ?auto_435097 ?auto_435102 ) ) ( not ( = ?auto_435097 ?auto_435103 ) ) ( not ( = ?auto_435097 ?auto_435104 ) ) ( not ( = ?auto_435098 ?auto_435099 ) ) ( not ( = ?auto_435098 ?auto_435100 ) ) ( not ( = ?auto_435098 ?auto_435101 ) ) ( not ( = ?auto_435098 ?auto_435102 ) ) ( not ( = ?auto_435098 ?auto_435103 ) ) ( not ( = ?auto_435098 ?auto_435104 ) ) ( not ( = ?auto_435099 ?auto_435100 ) ) ( not ( = ?auto_435099 ?auto_435101 ) ) ( not ( = ?auto_435099 ?auto_435102 ) ) ( not ( = ?auto_435099 ?auto_435103 ) ) ( not ( = ?auto_435099 ?auto_435104 ) ) ( not ( = ?auto_435100 ?auto_435101 ) ) ( not ( = ?auto_435100 ?auto_435102 ) ) ( not ( = ?auto_435100 ?auto_435103 ) ) ( not ( = ?auto_435100 ?auto_435104 ) ) ( not ( = ?auto_435101 ?auto_435102 ) ) ( not ( = ?auto_435101 ?auto_435103 ) ) ( not ( = ?auto_435101 ?auto_435104 ) ) ( not ( = ?auto_435102 ?auto_435103 ) ) ( not ( = ?auto_435102 ?auto_435104 ) ) ( not ( = ?auto_435103 ?auto_435104 ) ) ( ON ?auto_435102 ?auto_435103 ) ( ON ?auto_435101 ?auto_435102 ) ( ON ?auto_435100 ?auto_435101 ) ( ON ?auto_435099 ?auto_435100 ) ( CLEAR ?auto_435097 ) ( ON ?auto_435098 ?auto_435099 ) ( CLEAR ?auto_435098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_435094 ?auto_435095 ?auto_435096 ?auto_435097 ?auto_435098 )
      ( MAKE-10PILE ?auto_435094 ?auto_435095 ?auto_435096 ?auto_435097 ?auto_435098 ?auto_435099 ?auto_435100 ?auto_435101 ?auto_435102 ?auto_435103 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435115 - BLOCK
      ?auto_435116 - BLOCK
      ?auto_435117 - BLOCK
      ?auto_435118 - BLOCK
      ?auto_435119 - BLOCK
      ?auto_435120 - BLOCK
      ?auto_435121 - BLOCK
      ?auto_435122 - BLOCK
      ?auto_435123 - BLOCK
      ?auto_435124 - BLOCK
    )
    :vars
    (
      ?auto_435125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435124 ?auto_435125 ) ( ON-TABLE ?auto_435115 ) ( ON ?auto_435116 ?auto_435115 ) ( ON ?auto_435117 ?auto_435116 ) ( ON ?auto_435118 ?auto_435117 ) ( not ( = ?auto_435115 ?auto_435116 ) ) ( not ( = ?auto_435115 ?auto_435117 ) ) ( not ( = ?auto_435115 ?auto_435118 ) ) ( not ( = ?auto_435115 ?auto_435119 ) ) ( not ( = ?auto_435115 ?auto_435120 ) ) ( not ( = ?auto_435115 ?auto_435121 ) ) ( not ( = ?auto_435115 ?auto_435122 ) ) ( not ( = ?auto_435115 ?auto_435123 ) ) ( not ( = ?auto_435115 ?auto_435124 ) ) ( not ( = ?auto_435115 ?auto_435125 ) ) ( not ( = ?auto_435116 ?auto_435117 ) ) ( not ( = ?auto_435116 ?auto_435118 ) ) ( not ( = ?auto_435116 ?auto_435119 ) ) ( not ( = ?auto_435116 ?auto_435120 ) ) ( not ( = ?auto_435116 ?auto_435121 ) ) ( not ( = ?auto_435116 ?auto_435122 ) ) ( not ( = ?auto_435116 ?auto_435123 ) ) ( not ( = ?auto_435116 ?auto_435124 ) ) ( not ( = ?auto_435116 ?auto_435125 ) ) ( not ( = ?auto_435117 ?auto_435118 ) ) ( not ( = ?auto_435117 ?auto_435119 ) ) ( not ( = ?auto_435117 ?auto_435120 ) ) ( not ( = ?auto_435117 ?auto_435121 ) ) ( not ( = ?auto_435117 ?auto_435122 ) ) ( not ( = ?auto_435117 ?auto_435123 ) ) ( not ( = ?auto_435117 ?auto_435124 ) ) ( not ( = ?auto_435117 ?auto_435125 ) ) ( not ( = ?auto_435118 ?auto_435119 ) ) ( not ( = ?auto_435118 ?auto_435120 ) ) ( not ( = ?auto_435118 ?auto_435121 ) ) ( not ( = ?auto_435118 ?auto_435122 ) ) ( not ( = ?auto_435118 ?auto_435123 ) ) ( not ( = ?auto_435118 ?auto_435124 ) ) ( not ( = ?auto_435118 ?auto_435125 ) ) ( not ( = ?auto_435119 ?auto_435120 ) ) ( not ( = ?auto_435119 ?auto_435121 ) ) ( not ( = ?auto_435119 ?auto_435122 ) ) ( not ( = ?auto_435119 ?auto_435123 ) ) ( not ( = ?auto_435119 ?auto_435124 ) ) ( not ( = ?auto_435119 ?auto_435125 ) ) ( not ( = ?auto_435120 ?auto_435121 ) ) ( not ( = ?auto_435120 ?auto_435122 ) ) ( not ( = ?auto_435120 ?auto_435123 ) ) ( not ( = ?auto_435120 ?auto_435124 ) ) ( not ( = ?auto_435120 ?auto_435125 ) ) ( not ( = ?auto_435121 ?auto_435122 ) ) ( not ( = ?auto_435121 ?auto_435123 ) ) ( not ( = ?auto_435121 ?auto_435124 ) ) ( not ( = ?auto_435121 ?auto_435125 ) ) ( not ( = ?auto_435122 ?auto_435123 ) ) ( not ( = ?auto_435122 ?auto_435124 ) ) ( not ( = ?auto_435122 ?auto_435125 ) ) ( not ( = ?auto_435123 ?auto_435124 ) ) ( not ( = ?auto_435123 ?auto_435125 ) ) ( not ( = ?auto_435124 ?auto_435125 ) ) ( ON ?auto_435123 ?auto_435124 ) ( ON ?auto_435122 ?auto_435123 ) ( ON ?auto_435121 ?auto_435122 ) ( ON ?auto_435120 ?auto_435121 ) ( CLEAR ?auto_435118 ) ( ON ?auto_435119 ?auto_435120 ) ( CLEAR ?auto_435119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_435115 ?auto_435116 ?auto_435117 ?auto_435118 ?auto_435119 )
      ( MAKE-10PILE ?auto_435115 ?auto_435116 ?auto_435117 ?auto_435118 ?auto_435119 ?auto_435120 ?auto_435121 ?auto_435122 ?auto_435123 ?auto_435124 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435136 - BLOCK
      ?auto_435137 - BLOCK
      ?auto_435138 - BLOCK
      ?auto_435139 - BLOCK
      ?auto_435140 - BLOCK
      ?auto_435141 - BLOCK
      ?auto_435142 - BLOCK
      ?auto_435143 - BLOCK
      ?auto_435144 - BLOCK
      ?auto_435145 - BLOCK
    )
    :vars
    (
      ?auto_435146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435145 ?auto_435146 ) ( ON-TABLE ?auto_435136 ) ( ON ?auto_435137 ?auto_435136 ) ( ON ?auto_435138 ?auto_435137 ) ( not ( = ?auto_435136 ?auto_435137 ) ) ( not ( = ?auto_435136 ?auto_435138 ) ) ( not ( = ?auto_435136 ?auto_435139 ) ) ( not ( = ?auto_435136 ?auto_435140 ) ) ( not ( = ?auto_435136 ?auto_435141 ) ) ( not ( = ?auto_435136 ?auto_435142 ) ) ( not ( = ?auto_435136 ?auto_435143 ) ) ( not ( = ?auto_435136 ?auto_435144 ) ) ( not ( = ?auto_435136 ?auto_435145 ) ) ( not ( = ?auto_435136 ?auto_435146 ) ) ( not ( = ?auto_435137 ?auto_435138 ) ) ( not ( = ?auto_435137 ?auto_435139 ) ) ( not ( = ?auto_435137 ?auto_435140 ) ) ( not ( = ?auto_435137 ?auto_435141 ) ) ( not ( = ?auto_435137 ?auto_435142 ) ) ( not ( = ?auto_435137 ?auto_435143 ) ) ( not ( = ?auto_435137 ?auto_435144 ) ) ( not ( = ?auto_435137 ?auto_435145 ) ) ( not ( = ?auto_435137 ?auto_435146 ) ) ( not ( = ?auto_435138 ?auto_435139 ) ) ( not ( = ?auto_435138 ?auto_435140 ) ) ( not ( = ?auto_435138 ?auto_435141 ) ) ( not ( = ?auto_435138 ?auto_435142 ) ) ( not ( = ?auto_435138 ?auto_435143 ) ) ( not ( = ?auto_435138 ?auto_435144 ) ) ( not ( = ?auto_435138 ?auto_435145 ) ) ( not ( = ?auto_435138 ?auto_435146 ) ) ( not ( = ?auto_435139 ?auto_435140 ) ) ( not ( = ?auto_435139 ?auto_435141 ) ) ( not ( = ?auto_435139 ?auto_435142 ) ) ( not ( = ?auto_435139 ?auto_435143 ) ) ( not ( = ?auto_435139 ?auto_435144 ) ) ( not ( = ?auto_435139 ?auto_435145 ) ) ( not ( = ?auto_435139 ?auto_435146 ) ) ( not ( = ?auto_435140 ?auto_435141 ) ) ( not ( = ?auto_435140 ?auto_435142 ) ) ( not ( = ?auto_435140 ?auto_435143 ) ) ( not ( = ?auto_435140 ?auto_435144 ) ) ( not ( = ?auto_435140 ?auto_435145 ) ) ( not ( = ?auto_435140 ?auto_435146 ) ) ( not ( = ?auto_435141 ?auto_435142 ) ) ( not ( = ?auto_435141 ?auto_435143 ) ) ( not ( = ?auto_435141 ?auto_435144 ) ) ( not ( = ?auto_435141 ?auto_435145 ) ) ( not ( = ?auto_435141 ?auto_435146 ) ) ( not ( = ?auto_435142 ?auto_435143 ) ) ( not ( = ?auto_435142 ?auto_435144 ) ) ( not ( = ?auto_435142 ?auto_435145 ) ) ( not ( = ?auto_435142 ?auto_435146 ) ) ( not ( = ?auto_435143 ?auto_435144 ) ) ( not ( = ?auto_435143 ?auto_435145 ) ) ( not ( = ?auto_435143 ?auto_435146 ) ) ( not ( = ?auto_435144 ?auto_435145 ) ) ( not ( = ?auto_435144 ?auto_435146 ) ) ( not ( = ?auto_435145 ?auto_435146 ) ) ( ON ?auto_435144 ?auto_435145 ) ( ON ?auto_435143 ?auto_435144 ) ( ON ?auto_435142 ?auto_435143 ) ( ON ?auto_435141 ?auto_435142 ) ( ON ?auto_435140 ?auto_435141 ) ( CLEAR ?auto_435138 ) ( ON ?auto_435139 ?auto_435140 ) ( CLEAR ?auto_435139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_435136 ?auto_435137 ?auto_435138 ?auto_435139 )
      ( MAKE-10PILE ?auto_435136 ?auto_435137 ?auto_435138 ?auto_435139 ?auto_435140 ?auto_435141 ?auto_435142 ?auto_435143 ?auto_435144 ?auto_435145 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435157 - BLOCK
      ?auto_435158 - BLOCK
      ?auto_435159 - BLOCK
      ?auto_435160 - BLOCK
      ?auto_435161 - BLOCK
      ?auto_435162 - BLOCK
      ?auto_435163 - BLOCK
      ?auto_435164 - BLOCK
      ?auto_435165 - BLOCK
      ?auto_435166 - BLOCK
    )
    :vars
    (
      ?auto_435167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435166 ?auto_435167 ) ( ON-TABLE ?auto_435157 ) ( ON ?auto_435158 ?auto_435157 ) ( ON ?auto_435159 ?auto_435158 ) ( not ( = ?auto_435157 ?auto_435158 ) ) ( not ( = ?auto_435157 ?auto_435159 ) ) ( not ( = ?auto_435157 ?auto_435160 ) ) ( not ( = ?auto_435157 ?auto_435161 ) ) ( not ( = ?auto_435157 ?auto_435162 ) ) ( not ( = ?auto_435157 ?auto_435163 ) ) ( not ( = ?auto_435157 ?auto_435164 ) ) ( not ( = ?auto_435157 ?auto_435165 ) ) ( not ( = ?auto_435157 ?auto_435166 ) ) ( not ( = ?auto_435157 ?auto_435167 ) ) ( not ( = ?auto_435158 ?auto_435159 ) ) ( not ( = ?auto_435158 ?auto_435160 ) ) ( not ( = ?auto_435158 ?auto_435161 ) ) ( not ( = ?auto_435158 ?auto_435162 ) ) ( not ( = ?auto_435158 ?auto_435163 ) ) ( not ( = ?auto_435158 ?auto_435164 ) ) ( not ( = ?auto_435158 ?auto_435165 ) ) ( not ( = ?auto_435158 ?auto_435166 ) ) ( not ( = ?auto_435158 ?auto_435167 ) ) ( not ( = ?auto_435159 ?auto_435160 ) ) ( not ( = ?auto_435159 ?auto_435161 ) ) ( not ( = ?auto_435159 ?auto_435162 ) ) ( not ( = ?auto_435159 ?auto_435163 ) ) ( not ( = ?auto_435159 ?auto_435164 ) ) ( not ( = ?auto_435159 ?auto_435165 ) ) ( not ( = ?auto_435159 ?auto_435166 ) ) ( not ( = ?auto_435159 ?auto_435167 ) ) ( not ( = ?auto_435160 ?auto_435161 ) ) ( not ( = ?auto_435160 ?auto_435162 ) ) ( not ( = ?auto_435160 ?auto_435163 ) ) ( not ( = ?auto_435160 ?auto_435164 ) ) ( not ( = ?auto_435160 ?auto_435165 ) ) ( not ( = ?auto_435160 ?auto_435166 ) ) ( not ( = ?auto_435160 ?auto_435167 ) ) ( not ( = ?auto_435161 ?auto_435162 ) ) ( not ( = ?auto_435161 ?auto_435163 ) ) ( not ( = ?auto_435161 ?auto_435164 ) ) ( not ( = ?auto_435161 ?auto_435165 ) ) ( not ( = ?auto_435161 ?auto_435166 ) ) ( not ( = ?auto_435161 ?auto_435167 ) ) ( not ( = ?auto_435162 ?auto_435163 ) ) ( not ( = ?auto_435162 ?auto_435164 ) ) ( not ( = ?auto_435162 ?auto_435165 ) ) ( not ( = ?auto_435162 ?auto_435166 ) ) ( not ( = ?auto_435162 ?auto_435167 ) ) ( not ( = ?auto_435163 ?auto_435164 ) ) ( not ( = ?auto_435163 ?auto_435165 ) ) ( not ( = ?auto_435163 ?auto_435166 ) ) ( not ( = ?auto_435163 ?auto_435167 ) ) ( not ( = ?auto_435164 ?auto_435165 ) ) ( not ( = ?auto_435164 ?auto_435166 ) ) ( not ( = ?auto_435164 ?auto_435167 ) ) ( not ( = ?auto_435165 ?auto_435166 ) ) ( not ( = ?auto_435165 ?auto_435167 ) ) ( not ( = ?auto_435166 ?auto_435167 ) ) ( ON ?auto_435165 ?auto_435166 ) ( ON ?auto_435164 ?auto_435165 ) ( ON ?auto_435163 ?auto_435164 ) ( ON ?auto_435162 ?auto_435163 ) ( ON ?auto_435161 ?auto_435162 ) ( CLEAR ?auto_435159 ) ( ON ?auto_435160 ?auto_435161 ) ( CLEAR ?auto_435160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_435157 ?auto_435158 ?auto_435159 ?auto_435160 )
      ( MAKE-10PILE ?auto_435157 ?auto_435158 ?auto_435159 ?auto_435160 ?auto_435161 ?auto_435162 ?auto_435163 ?auto_435164 ?auto_435165 ?auto_435166 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435178 - BLOCK
      ?auto_435179 - BLOCK
      ?auto_435180 - BLOCK
      ?auto_435181 - BLOCK
      ?auto_435182 - BLOCK
      ?auto_435183 - BLOCK
      ?auto_435184 - BLOCK
      ?auto_435185 - BLOCK
      ?auto_435186 - BLOCK
      ?auto_435187 - BLOCK
    )
    :vars
    (
      ?auto_435188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435187 ?auto_435188 ) ( ON-TABLE ?auto_435178 ) ( ON ?auto_435179 ?auto_435178 ) ( not ( = ?auto_435178 ?auto_435179 ) ) ( not ( = ?auto_435178 ?auto_435180 ) ) ( not ( = ?auto_435178 ?auto_435181 ) ) ( not ( = ?auto_435178 ?auto_435182 ) ) ( not ( = ?auto_435178 ?auto_435183 ) ) ( not ( = ?auto_435178 ?auto_435184 ) ) ( not ( = ?auto_435178 ?auto_435185 ) ) ( not ( = ?auto_435178 ?auto_435186 ) ) ( not ( = ?auto_435178 ?auto_435187 ) ) ( not ( = ?auto_435178 ?auto_435188 ) ) ( not ( = ?auto_435179 ?auto_435180 ) ) ( not ( = ?auto_435179 ?auto_435181 ) ) ( not ( = ?auto_435179 ?auto_435182 ) ) ( not ( = ?auto_435179 ?auto_435183 ) ) ( not ( = ?auto_435179 ?auto_435184 ) ) ( not ( = ?auto_435179 ?auto_435185 ) ) ( not ( = ?auto_435179 ?auto_435186 ) ) ( not ( = ?auto_435179 ?auto_435187 ) ) ( not ( = ?auto_435179 ?auto_435188 ) ) ( not ( = ?auto_435180 ?auto_435181 ) ) ( not ( = ?auto_435180 ?auto_435182 ) ) ( not ( = ?auto_435180 ?auto_435183 ) ) ( not ( = ?auto_435180 ?auto_435184 ) ) ( not ( = ?auto_435180 ?auto_435185 ) ) ( not ( = ?auto_435180 ?auto_435186 ) ) ( not ( = ?auto_435180 ?auto_435187 ) ) ( not ( = ?auto_435180 ?auto_435188 ) ) ( not ( = ?auto_435181 ?auto_435182 ) ) ( not ( = ?auto_435181 ?auto_435183 ) ) ( not ( = ?auto_435181 ?auto_435184 ) ) ( not ( = ?auto_435181 ?auto_435185 ) ) ( not ( = ?auto_435181 ?auto_435186 ) ) ( not ( = ?auto_435181 ?auto_435187 ) ) ( not ( = ?auto_435181 ?auto_435188 ) ) ( not ( = ?auto_435182 ?auto_435183 ) ) ( not ( = ?auto_435182 ?auto_435184 ) ) ( not ( = ?auto_435182 ?auto_435185 ) ) ( not ( = ?auto_435182 ?auto_435186 ) ) ( not ( = ?auto_435182 ?auto_435187 ) ) ( not ( = ?auto_435182 ?auto_435188 ) ) ( not ( = ?auto_435183 ?auto_435184 ) ) ( not ( = ?auto_435183 ?auto_435185 ) ) ( not ( = ?auto_435183 ?auto_435186 ) ) ( not ( = ?auto_435183 ?auto_435187 ) ) ( not ( = ?auto_435183 ?auto_435188 ) ) ( not ( = ?auto_435184 ?auto_435185 ) ) ( not ( = ?auto_435184 ?auto_435186 ) ) ( not ( = ?auto_435184 ?auto_435187 ) ) ( not ( = ?auto_435184 ?auto_435188 ) ) ( not ( = ?auto_435185 ?auto_435186 ) ) ( not ( = ?auto_435185 ?auto_435187 ) ) ( not ( = ?auto_435185 ?auto_435188 ) ) ( not ( = ?auto_435186 ?auto_435187 ) ) ( not ( = ?auto_435186 ?auto_435188 ) ) ( not ( = ?auto_435187 ?auto_435188 ) ) ( ON ?auto_435186 ?auto_435187 ) ( ON ?auto_435185 ?auto_435186 ) ( ON ?auto_435184 ?auto_435185 ) ( ON ?auto_435183 ?auto_435184 ) ( ON ?auto_435182 ?auto_435183 ) ( ON ?auto_435181 ?auto_435182 ) ( CLEAR ?auto_435179 ) ( ON ?auto_435180 ?auto_435181 ) ( CLEAR ?auto_435180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_435178 ?auto_435179 ?auto_435180 )
      ( MAKE-10PILE ?auto_435178 ?auto_435179 ?auto_435180 ?auto_435181 ?auto_435182 ?auto_435183 ?auto_435184 ?auto_435185 ?auto_435186 ?auto_435187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435199 - BLOCK
      ?auto_435200 - BLOCK
      ?auto_435201 - BLOCK
      ?auto_435202 - BLOCK
      ?auto_435203 - BLOCK
      ?auto_435204 - BLOCK
      ?auto_435205 - BLOCK
      ?auto_435206 - BLOCK
      ?auto_435207 - BLOCK
      ?auto_435208 - BLOCK
    )
    :vars
    (
      ?auto_435209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435208 ?auto_435209 ) ( ON-TABLE ?auto_435199 ) ( ON ?auto_435200 ?auto_435199 ) ( not ( = ?auto_435199 ?auto_435200 ) ) ( not ( = ?auto_435199 ?auto_435201 ) ) ( not ( = ?auto_435199 ?auto_435202 ) ) ( not ( = ?auto_435199 ?auto_435203 ) ) ( not ( = ?auto_435199 ?auto_435204 ) ) ( not ( = ?auto_435199 ?auto_435205 ) ) ( not ( = ?auto_435199 ?auto_435206 ) ) ( not ( = ?auto_435199 ?auto_435207 ) ) ( not ( = ?auto_435199 ?auto_435208 ) ) ( not ( = ?auto_435199 ?auto_435209 ) ) ( not ( = ?auto_435200 ?auto_435201 ) ) ( not ( = ?auto_435200 ?auto_435202 ) ) ( not ( = ?auto_435200 ?auto_435203 ) ) ( not ( = ?auto_435200 ?auto_435204 ) ) ( not ( = ?auto_435200 ?auto_435205 ) ) ( not ( = ?auto_435200 ?auto_435206 ) ) ( not ( = ?auto_435200 ?auto_435207 ) ) ( not ( = ?auto_435200 ?auto_435208 ) ) ( not ( = ?auto_435200 ?auto_435209 ) ) ( not ( = ?auto_435201 ?auto_435202 ) ) ( not ( = ?auto_435201 ?auto_435203 ) ) ( not ( = ?auto_435201 ?auto_435204 ) ) ( not ( = ?auto_435201 ?auto_435205 ) ) ( not ( = ?auto_435201 ?auto_435206 ) ) ( not ( = ?auto_435201 ?auto_435207 ) ) ( not ( = ?auto_435201 ?auto_435208 ) ) ( not ( = ?auto_435201 ?auto_435209 ) ) ( not ( = ?auto_435202 ?auto_435203 ) ) ( not ( = ?auto_435202 ?auto_435204 ) ) ( not ( = ?auto_435202 ?auto_435205 ) ) ( not ( = ?auto_435202 ?auto_435206 ) ) ( not ( = ?auto_435202 ?auto_435207 ) ) ( not ( = ?auto_435202 ?auto_435208 ) ) ( not ( = ?auto_435202 ?auto_435209 ) ) ( not ( = ?auto_435203 ?auto_435204 ) ) ( not ( = ?auto_435203 ?auto_435205 ) ) ( not ( = ?auto_435203 ?auto_435206 ) ) ( not ( = ?auto_435203 ?auto_435207 ) ) ( not ( = ?auto_435203 ?auto_435208 ) ) ( not ( = ?auto_435203 ?auto_435209 ) ) ( not ( = ?auto_435204 ?auto_435205 ) ) ( not ( = ?auto_435204 ?auto_435206 ) ) ( not ( = ?auto_435204 ?auto_435207 ) ) ( not ( = ?auto_435204 ?auto_435208 ) ) ( not ( = ?auto_435204 ?auto_435209 ) ) ( not ( = ?auto_435205 ?auto_435206 ) ) ( not ( = ?auto_435205 ?auto_435207 ) ) ( not ( = ?auto_435205 ?auto_435208 ) ) ( not ( = ?auto_435205 ?auto_435209 ) ) ( not ( = ?auto_435206 ?auto_435207 ) ) ( not ( = ?auto_435206 ?auto_435208 ) ) ( not ( = ?auto_435206 ?auto_435209 ) ) ( not ( = ?auto_435207 ?auto_435208 ) ) ( not ( = ?auto_435207 ?auto_435209 ) ) ( not ( = ?auto_435208 ?auto_435209 ) ) ( ON ?auto_435207 ?auto_435208 ) ( ON ?auto_435206 ?auto_435207 ) ( ON ?auto_435205 ?auto_435206 ) ( ON ?auto_435204 ?auto_435205 ) ( ON ?auto_435203 ?auto_435204 ) ( ON ?auto_435202 ?auto_435203 ) ( CLEAR ?auto_435200 ) ( ON ?auto_435201 ?auto_435202 ) ( CLEAR ?auto_435201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_435199 ?auto_435200 ?auto_435201 )
      ( MAKE-10PILE ?auto_435199 ?auto_435200 ?auto_435201 ?auto_435202 ?auto_435203 ?auto_435204 ?auto_435205 ?auto_435206 ?auto_435207 ?auto_435208 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435220 - BLOCK
      ?auto_435221 - BLOCK
      ?auto_435222 - BLOCK
      ?auto_435223 - BLOCK
      ?auto_435224 - BLOCK
      ?auto_435225 - BLOCK
      ?auto_435226 - BLOCK
      ?auto_435227 - BLOCK
      ?auto_435228 - BLOCK
      ?auto_435229 - BLOCK
    )
    :vars
    (
      ?auto_435230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435229 ?auto_435230 ) ( ON-TABLE ?auto_435220 ) ( not ( = ?auto_435220 ?auto_435221 ) ) ( not ( = ?auto_435220 ?auto_435222 ) ) ( not ( = ?auto_435220 ?auto_435223 ) ) ( not ( = ?auto_435220 ?auto_435224 ) ) ( not ( = ?auto_435220 ?auto_435225 ) ) ( not ( = ?auto_435220 ?auto_435226 ) ) ( not ( = ?auto_435220 ?auto_435227 ) ) ( not ( = ?auto_435220 ?auto_435228 ) ) ( not ( = ?auto_435220 ?auto_435229 ) ) ( not ( = ?auto_435220 ?auto_435230 ) ) ( not ( = ?auto_435221 ?auto_435222 ) ) ( not ( = ?auto_435221 ?auto_435223 ) ) ( not ( = ?auto_435221 ?auto_435224 ) ) ( not ( = ?auto_435221 ?auto_435225 ) ) ( not ( = ?auto_435221 ?auto_435226 ) ) ( not ( = ?auto_435221 ?auto_435227 ) ) ( not ( = ?auto_435221 ?auto_435228 ) ) ( not ( = ?auto_435221 ?auto_435229 ) ) ( not ( = ?auto_435221 ?auto_435230 ) ) ( not ( = ?auto_435222 ?auto_435223 ) ) ( not ( = ?auto_435222 ?auto_435224 ) ) ( not ( = ?auto_435222 ?auto_435225 ) ) ( not ( = ?auto_435222 ?auto_435226 ) ) ( not ( = ?auto_435222 ?auto_435227 ) ) ( not ( = ?auto_435222 ?auto_435228 ) ) ( not ( = ?auto_435222 ?auto_435229 ) ) ( not ( = ?auto_435222 ?auto_435230 ) ) ( not ( = ?auto_435223 ?auto_435224 ) ) ( not ( = ?auto_435223 ?auto_435225 ) ) ( not ( = ?auto_435223 ?auto_435226 ) ) ( not ( = ?auto_435223 ?auto_435227 ) ) ( not ( = ?auto_435223 ?auto_435228 ) ) ( not ( = ?auto_435223 ?auto_435229 ) ) ( not ( = ?auto_435223 ?auto_435230 ) ) ( not ( = ?auto_435224 ?auto_435225 ) ) ( not ( = ?auto_435224 ?auto_435226 ) ) ( not ( = ?auto_435224 ?auto_435227 ) ) ( not ( = ?auto_435224 ?auto_435228 ) ) ( not ( = ?auto_435224 ?auto_435229 ) ) ( not ( = ?auto_435224 ?auto_435230 ) ) ( not ( = ?auto_435225 ?auto_435226 ) ) ( not ( = ?auto_435225 ?auto_435227 ) ) ( not ( = ?auto_435225 ?auto_435228 ) ) ( not ( = ?auto_435225 ?auto_435229 ) ) ( not ( = ?auto_435225 ?auto_435230 ) ) ( not ( = ?auto_435226 ?auto_435227 ) ) ( not ( = ?auto_435226 ?auto_435228 ) ) ( not ( = ?auto_435226 ?auto_435229 ) ) ( not ( = ?auto_435226 ?auto_435230 ) ) ( not ( = ?auto_435227 ?auto_435228 ) ) ( not ( = ?auto_435227 ?auto_435229 ) ) ( not ( = ?auto_435227 ?auto_435230 ) ) ( not ( = ?auto_435228 ?auto_435229 ) ) ( not ( = ?auto_435228 ?auto_435230 ) ) ( not ( = ?auto_435229 ?auto_435230 ) ) ( ON ?auto_435228 ?auto_435229 ) ( ON ?auto_435227 ?auto_435228 ) ( ON ?auto_435226 ?auto_435227 ) ( ON ?auto_435225 ?auto_435226 ) ( ON ?auto_435224 ?auto_435225 ) ( ON ?auto_435223 ?auto_435224 ) ( ON ?auto_435222 ?auto_435223 ) ( CLEAR ?auto_435220 ) ( ON ?auto_435221 ?auto_435222 ) ( CLEAR ?auto_435221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_435220 ?auto_435221 )
      ( MAKE-10PILE ?auto_435220 ?auto_435221 ?auto_435222 ?auto_435223 ?auto_435224 ?auto_435225 ?auto_435226 ?auto_435227 ?auto_435228 ?auto_435229 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435241 - BLOCK
      ?auto_435242 - BLOCK
      ?auto_435243 - BLOCK
      ?auto_435244 - BLOCK
      ?auto_435245 - BLOCK
      ?auto_435246 - BLOCK
      ?auto_435247 - BLOCK
      ?auto_435248 - BLOCK
      ?auto_435249 - BLOCK
      ?auto_435250 - BLOCK
    )
    :vars
    (
      ?auto_435251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435250 ?auto_435251 ) ( ON-TABLE ?auto_435241 ) ( not ( = ?auto_435241 ?auto_435242 ) ) ( not ( = ?auto_435241 ?auto_435243 ) ) ( not ( = ?auto_435241 ?auto_435244 ) ) ( not ( = ?auto_435241 ?auto_435245 ) ) ( not ( = ?auto_435241 ?auto_435246 ) ) ( not ( = ?auto_435241 ?auto_435247 ) ) ( not ( = ?auto_435241 ?auto_435248 ) ) ( not ( = ?auto_435241 ?auto_435249 ) ) ( not ( = ?auto_435241 ?auto_435250 ) ) ( not ( = ?auto_435241 ?auto_435251 ) ) ( not ( = ?auto_435242 ?auto_435243 ) ) ( not ( = ?auto_435242 ?auto_435244 ) ) ( not ( = ?auto_435242 ?auto_435245 ) ) ( not ( = ?auto_435242 ?auto_435246 ) ) ( not ( = ?auto_435242 ?auto_435247 ) ) ( not ( = ?auto_435242 ?auto_435248 ) ) ( not ( = ?auto_435242 ?auto_435249 ) ) ( not ( = ?auto_435242 ?auto_435250 ) ) ( not ( = ?auto_435242 ?auto_435251 ) ) ( not ( = ?auto_435243 ?auto_435244 ) ) ( not ( = ?auto_435243 ?auto_435245 ) ) ( not ( = ?auto_435243 ?auto_435246 ) ) ( not ( = ?auto_435243 ?auto_435247 ) ) ( not ( = ?auto_435243 ?auto_435248 ) ) ( not ( = ?auto_435243 ?auto_435249 ) ) ( not ( = ?auto_435243 ?auto_435250 ) ) ( not ( = ?auto_435243 ?auto_435251 ) ) ( not ( = ?auto_435244 ?auto_435245 ) ) ( not ( = ?auto_435244 ?auto_435246 ) ) ( not ( = ?auto_435244 ?auto_435247 ) ) ( not ( = ?auto_435244 ?auto_435248 ) ) ( not ( = ?auto_435244 ?auto_435249 ) ) ( not ( = ?auto_435244 ?auto_435250 ) ) ( not ( = ?auto_435244 ?auto_435251 ) ) ( not ( = ?auto_435245 ?auto_435246 ) ) ( not ( = ?auto_435245 ?auto_435247 ) ) ( not ( = ?auto_435245 ?auto_435248 ) ) ( not ( = ?auto_435245 ?auto_435249 ) ) ( not ( = ?auto_435245 ?auto_435250 ) ) ( not ( = ?auto_435245 ?auto_435251 ) ) ( not ( = ?auto_435246 ?auto_435247 ) ) ( not ( = ?auto_435246 ?auto_435248 ) ) ( not ( = ?auto_435246 ?auto_435249 ) ) ( not ( = ?auto_435246 ?auto_435250 ) ) ( not ( = ?auto_435246 ?auto_435251 ) ) ( not ( = ?auto_435247 ?auto_435248 ) ) ( not ( = ?auto_435247 ?auto_435249 ) ) ( not ( = ?auto_435247 ?auto_435250 ) ) ( not ( = ?auto_435247 ?auto_435251 ) ) ( not ( = ?auto_435248 ?auto_435249 ) ) ( not ( = ?auto_435248 ?auto_435250 ) ) ( not ( = ?auto_435248 ?auto_435251 ) ) ( not ( = ?auto_435249 ?auto_435250 ) ) ( not ( = ?auto_435249 ?auto_435251 ) ) ( not ( = ?auto_435250 ?auto_435251 ) ) ( ON ?auto_435249 ?auto_435250 ) ( ON ?auto_435248 ?auto_435249 ) ( ON ?auto_435247 ?auto_435248 ) ( ON ?auto_435246 ?auto_435247 ) ( ON ?auto_435245 ?auto_435246 ) ( ON ?auto_435244 ?auto_435245 ) ( ON ?auto_435243 ?auto_435244 ) ( CLEAR ?auto_435241 ) ( ON ?auto_435242 ?auto_435243 ) ( CLEAR ?auto_435242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_435241 ?auto_435242 )
      ( MAKE-10PILE ?auto_435241 ?auto_435242 ?auto_435243 ?auto_435244 ?auto_435245 ?auto_435246 ?auto_435247 ?auto_435248 ?auto_435249 ?auto_435250 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435262 - BLOCK
      ?auto_435263 - BLOCK
      ?auto_435264 - BLOCK
      ?auto_435265 - BLOCK
      ?auto_435266 - BLOCK
      ?auto_435267 - BLOCK
      ?auto_435268 - BLOCK
      ?auto_435269 - BLOCK
      ?auto_435270 - BLOCK
      ?auto_435271 - BLOCK
    )
    :vars
    (
      ?auto_435272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435271 ?auto_435272 ) ( not ( = ?auto_435262 ?auto_435263 ) ) ( not ( = ?auto_435262 ?auto_435264 ) ) ( not ( = ?auto_435262 ?auto_435265 ) ) ( not ( = ?auto_435262 ?auto_435266 ) ) ( not ( = ?auto_435262 ?auto_435267 ) ) ( not ( = ?auto_435262 ?auto_435268 ) ) ( not ( = ?auto_435262 ?auto_435269 ) ) ( not ( = ?auto_435262 ?auto_435270 ) ) ( not ( = ?auto_435262 ?auto_435271 ) ) ( not ( = ?auto_435262 ?auto_435272 ) ) ( not ( = ?auto_435263 ?auto_435264 ) ) ( not ( = ?auto_435263 ?auto_435265 ) ) ( not ( = ?auto_435263 ?auto_435266 ) ) ( not ( = ?auto_435263 ?auto_435267 ) ) ( not ( = ?auto_435263 ?auto_435268 ) ) ( not ( = ?auto_435263 ?auto_435269 ) ) ( not ( = ?auto_435263 ?auto_435270 ) ) ( not ( = ?auto_435263 ?auto_435271 ) ) ( not ( = ?auto_435263 ?auto_435272 ) ) ( not ( = ?auto_435264 ?auto_435265 ) ) ( not ( = ?auto_435264 ?auto_435266 ) ) ( not ( = ?auto_435264 ?auto_435267 ) ) ( not ( = ?auto_435264 ?auto_435268 ) ) ( not ( = ?auto_435264 ?auto_435269 ) ) ( not ( = ?auto_435264 ?auto_435270 ) ) ( not ( = ?auto_435264 ?auto_435271 ) ) ( not ( = ?auto_435264 ?auto_435272 ) ) ( not ( = ?auto_435265 ?auto_435266 ) ) ( not ( = ?auto_435265 ?auto_435267 ) ) ( not ( = ?auto_435265 ?auto_435268 ) ) ( not ( = ?auto_435265 ?auto_435269 ) ) ( not ( = ?auto_435265 ?auto_435270 ) ) ( not ( = ?auto_435265 ?auto_435271 ) ) ( not ( = ?auto_435265 ?auto_435272 ) ) ( not ( = ?auto_435266 ?auto_435267 ) ) ( not ( = ?auto_435266 ?auto_435268 ) ) ( not ( = ?auto_435266 ?auto_435269 ) ) ( not ( = ?auto_435266 ?auto_435270 ) ) ( not ( = ?auto_435266 ?auto_435271 ) ) ( not ( = ?auto_435266 ?auto_435272 ) ) ( not ( = ?auto_435267 ?auto_435268 ) ) ( not ( = ?auto_435267 ?auto_435269 ) ) ( not ( = ?auto_435267 ?auto_435270 ) ) ( not ( = ?auto_435267 ?auto_435271 ) ) ( not ( = ?auto_435267 ?auto_435272 ) ) ( not ( = ?auto_435268 ?auto_435269 ) ) ( not ( = ?auto_435268 ?auto_435270 ) ) ( not ( = ?auto_435268 ?auto_435271 ) ) ( not ( = ?auto_435268 ?auto_435272 ) ) ( not ( = ?auto_435269 ?auto_435270 ) ) ( not ( = ?auto_435269 ?auto_435271 ) ) ( not ( = ?auto_435269 ?auto_435272 ) ) ( not ( = ?auto_435270 ?auto_435271 ) ) ( not ( = ?auto_435270 ?auto_435272 ) ) ( not ( = ?auto_435271 ?auto_435272 ) ) ( ON ?auto_435270 ?auto_435271 ) ( ON ?auto_435269 ?auto_435270 ) ( ON ?auto_435268 ?auto_435269 ) ( ON ?auto_435267 ?auto_435268 ) ( ON ?auto_435266 ?auto_435267 ) ( ON ?auto_435265 ?auto_435266 ) ( ON ?auto_435264 ?auto_435265 ) ( ON ?auto_435263 ?auto_435264 ) ( ON ?auto_435262 ?auto_435263 ) ( CLEAR ?auto_435262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_435262 )
      ( MAKE-10PILE ?auto_435262 ?auto_435263 ?auto_435264 ?auto_435265 ?auto_435266 ?auto_435267 ?auto_435268 ?auto_435269 ?auto_435270 ?auto_435271 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_435283 - BLOCK
      ?auto_435284 - BLOCK
      ?auto_435285 - BLOCK
      ?auto_435286 - BLOCK
      ?auto_435287 - BLOCK
      ?auto_435288 - BLOCK
      ?auto_435289 - BLOCK
      ?auto_435290 - BLOCK
      ?auto_435291 - BLOCK
      ?auto_435292 - BLOCK
    )
    :vars
    (
      ?auto_435293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435292 ?auto_435293 ) ( not ( = ?auto_435283 ?auto_435284 ) ) ( not ( = ?auto_435283 ?auto_435285 ) ) ( not ( = ?auto_435283 ?auto_435286 ) ) ( not ( = ?auto_435283 ?auto_435287 ) ) ( not ( = ?auto_435283 ?auto_435288 ) ) ( not ( = ?auto_435283 ?auto_435289 ) ) ( not ( = ?auto_435283 ?auto_435290 ) ) ( not ( = ?auto_435283 ?auto_435291 ) ) ( not ( = ?auto_435283 ?auto_435292 ) ) ( not ( = ?auto_435283 ?auto_435293 ) ) ( not ( = ?auto_435284 ?auto_435285 ) ) ( not ( = ?auto_435284 ?auto_435286 ) ) ( not ( = ?auto_435284 ?auto_435287 ) ) ( not ( = ?auto_435284 ?auto_435288 ) ) ( not ( = ?auto_435284 ?auto_435289 ) ) ( not ( = ?auto_435284 ?auto_435290 ) ) ( not ( = ?auto_435284 ?auto_435291 ) ) ( not ( = ?auto_435284 ?auto_435292 ) ) ( not ( = ?auto_435284 ?auto_435293 ) ) ( not ( = ?auto_435285 ?auto_435286 ) ) ( not ( = ?auto_435285 ?auto_435287 ) ) ( not ( = ?auto_435285 ?auto_435288 ) ) ( not ( = ?auto_435285 ?auto_435289 ) ) ( not ( = ?auto_435285 ?auto_435290 ) ) ( not ( = ?auto_435285 ?auto_435291 ) ) ( not ( = ?auto_435285 ?auto_435292 ) ) ( not ( = ?auto_435285 ?auto_435293 ) ) ( not ( = ?auto_435286 ?auto_435287 ) ) ( not ( = ?auto_435286 ?auto_435288 ) ) ( not ( = ?auto_435286 ?auto_435289 ) ) ( not ( = ?auto_435286 ?auto_435290 ) ) ( not ( = ?auto_435286 ?auto_435291 ) ) ( not ( = ?auto_435286 ?auto_435292 ) ) ( not ( = ?auto_435286 ?auto_435293 ) ) ( not ( = ?auto_435287 ?auto_435288 ) ) ( not ( = ?auto_435287 ?auto_435289 ) ) ( not ( = ?auto_435287 ?auto_435290 ) ) ( not ( = ?auto_435287 ?auto_435291 ) ) ( not ( = ?auto_435287 ?auto_435292 ) ) ( not ( = ?auto_435287 ?auto_435293 ) ) ( not ( = ?auto_435288 ?auto_435289 ) ) ( not ( = ?auto_435288 ?auto_435290 ) ) ( not ( = ?auto_435288 ?auto_435291 ) ) ( not ( = ?auto_435288 ?auto_435292 ) ) ( not ( = ?auto_435288 ?auto_435293 ) ) ( not ( = ?auto_435289 ?auto_435290 ) ) ( not ( = ?auto_435289 ?auto_435291 ) ) ( not ( = ?auto_435289 ?auto_435292 ) ) ( not ( = ?auto_435289 ?auto_435293 ) ) ( not ( = ?auto_435290 ?auto_435291 ) ) ( not ( = ?auto_435290 ?auto_435292 ) ) ( not ( = ?auto_435290 ?auto_435293 ) ) ( not ( = ?auto_435291 ?auto_435292 ) ) ( not ( = ?auto_435291 ?auto_435293 ) ) ( not ( = ?auto_435292 ?auto_435293 ) ) ( ON ?auto_435291 ?auto_435292 ) ( ON ?auto_435290 ?auto_435291 ) ( ON ?auto_435289 ?auto_435290 ) ( ON ?auto_435288 ?auto_435289 ) ( ON ?auto_435287 ?auto_435288 ) ( ON ?auto_435286 ?auto_435287 ) ( ON ?auto_435285 ?auto_435286 ) ( ON ?auto_435284 ?auto_435285 ) ( ON ?auto_435283 ?auto_435284 ) ( CLEAR ?auto_435283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_435283 )
      ( MAKE-10PILE ?auto_435283 ?auto_435284 ?auto_435285 ?auto_435286 ?auto_435287 ?auto_435288 ?auto_435289 ?auto_435290 ?auto_435291 ?auto_435292 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435305 - BLOCK
      ?auto_435306 - BLOCK
      ?auto_435307 - BLOCK
      ?auto_435308 - BLOCK
      ?auto_435309 - BLOCK
      ?auto_435310 - BLOCK
      ?auto_435311 - BLOCK
      ?auto_435312 - BLOCK
      ?auto_435313 - BLOCK
      ?auto_435314 - BLOCK
      ?auto_435315 - BLOCK
    )
    :vars
    (
      ?auto_435316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_435314 ) ( ON ?auto_435315 ?auto_435316 ) ( CLEAR ?auto_435315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_435305 ) ( ON ?auto_435306 ?auto_435305 ) ( ON ?auto_435307 ?auto_435306 ) ( ON ?auto_435308 ?auto_435307 ) ( ON ?auto_435309 ?auto_435308 ) ( ON ?auto_435310 ?auto_435309 ) ( ON ?auto_435311 ?auto_435310 ) ( ON ?auto_435312 ?auto_435311 ) ( ON ?auto_435313 ?auto_435312 ) ( ON ?auto_435314 ?auto_435313 ) ( not ( = ?auto_435305 ?auto_435306 ) ) ( not ( = ?auto_435305 ?auto_435307 ) ) ( not ( = ?auto_435305 ?auto_435308 ) ) ( not ( = ?auto_435305 ?auto_435309 ) ) ( not ( = ?auto_435305 ?auto_435310 ) ) ( not ( = ?auto_435305 ?auto_435311 ) ) ( not ( = ?auto_435305 ?auto_435312 ) ) ( not ( = ?auto_435305 ?auto_435313 ) ) ( not ( = ?auto_435305 ?auto_435314 ) ) ( not ( = ?auto_435305 ?auto_435315 ) ) ( not ( = ?auto_435305 ?auto_435316 ) ) ( not ( = ?auto_435306 ?auto_435307 ) ) ( not ( = ?auto_435306 ?auto_435308 ) ) ( not ( = ?auto_435306 ?auto_435309 ) ) ( not ( = ?auto_435306 ?auto_435310 ) ) ( not ( = ?auto_435306 ?auto_435311 ) ) ( not ( = ?auto_435306 ?auto_435312 ) ) ( not ( = ?auto_435306 ?auto_435313 ) ) ( not ( = ?auto_435306 ?auto_435314 ) ) ( not ( = ?auto_435306 ?auto_435315 ) ) ( not ( = ?auto_435306 ?auto_435316 ) ) ( not ( = ?auto_435307 ?auto_435308 ) ) ( not ( = ?auto_435307 ?auto_435309 ) ) ( not ( = ?auto_435307 ?auto_435310 ) ) ( not ( = ?auto_435307 ?auto_435311 ) ) ( not ( = ?auto_435307 ?auto_435312 ) ) ( not ( = ?auto_435307 ?auto_435313 ) ) ( not ( = ?auto_435307 ?auto_435314 ) ) ( not ( = ?auto_435307 ?auto_435315 ) ) ( not ( = ?auto_435307 ?auto_435316 ) ) ( not ( = ?auto_435308 ?auto_435309 ) ) ( not ( = ?auto_435308 ?auto_435310 ) ) ( not ( = ?auto_435308 ?auto_435311 ) ) ( not ( = ?auto_435308 ?auto_435312 ) ) ( not ( = ?auto_435308 ?auto_435313 ) ) ( not ( = ?auto_435308 ?auto_435314 ) ) ( not ( = ?auto_435308 ?auto_435315 ) ) ( not ( = ?auto_435308 ?auto_435316 ) ) ( not ( = ?auto_435309 ?auto_435310 ) ) ( not ( = ?auto_435309 ?auto_435311 ) ) ( not ( = ?auto_435309 ?auto_435312 ) ) ( not ( = ?auto_435309 ?auto_435313 ) ) ( not ( = ?auto_435309 ?auto_435314 ) ) ( not ( = ?auto_435309 ?auto_435315 ) ) ( not ( = ?auto_435309 ?auto_435316 ) ) ( not ( = ?auto_435310 ?auto_435311 ) ) ( not ( = ?auto_435310 ?auto_435312 ) ) ( not ( = ?auto_435310 ?auto_435313 ) ) ( not ( = ?auto_435310 ?auto_435314 ) ) ( not ( = ?auto_435310 ?auto_435315 ) ) ( not ( = ?auto_435310 ?auto_435316 ) ) ( not ( = ?auto_435311 ?auto_435312 ) ) ( not ( = ?auto_435311 ?auto_435313 ) ) ( not ( = ?auto_435311 ?auto_435314 ) ) ( not ( = ?auto_435311 ?auto_435315 ) ) ( not ( = ?auto_435311 ?auto_435316 ) ) ( not ( = ?auto_435312 ?auto_435313 ) ) ( not ( = ?auto_435312 ?auto_435314 ) ) ( not ( = ?auto_435312 ?auto_435315 ) ) ( not ( = ?auto_435312 ?auto_435316 ) ) ( not ( = ?auto_435313 ?auto_435314 ) ) ( not ( = ?auto_435313 ?auto_435315 ) ) ( not ( = ?auto_435313 ?auto_435316 ) ) ( not ( = ?auto_435314 ?auto_435315 ) ) ( not ( = ?auto_435314 ?auto_435316 ) ) ( not ( = ?auto_435315 ?auto_435316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_435315 ?auto_435316 )
      ( !STACK ?auto_435315 ?auto_435314 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435328 - BLOCK
      ?auto_435329 - BLOCK
      ?auto_435330 - BLOCK
      ?auto_435331 - BLOCK
      ?auto_435332 - BLOCK
      ?auto_435333 - BLOCK
      ?auto_435334 - BLOCK
      ?auto_435335 - BLOCK
      ?auto_435336 - BLOCK
      ?auto_435337 - BLOCK
      ?auto_435338 - BLOCK
    )
    :vars
    (
      ?auto_435339 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_435337 ) ( ON ?auto_435338 ?auto_435339 ) ( CLEAR ?auto_435338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_435328 ) ( ON ?auto_435329 ?auto_435328 ) ( ON ?auto_435330 ?auto_435329 ) ( ON ?auto_435331 ?auto_435330 ) ( ON ?auto_435332 ?auto_435331 ) ( ON ?auto_435333 ?auto_435332 ) ( ON ?auto_435334 ?auto_435333 ) ( ON ?auto_435335 ?auto_435334 ) ( ON ?auto_435336 ?auto_435335 ) ( ON ?auto_435337 ?auto_435336 ) ( not ( = ?auto_435328 ?auto_435329 ) ) ( not ( = ?auto_435328 ?auto_435330 ) ) ( not ( = ?auto_435328 ?auto_435331 ) ) ( not ( = ?auto_435328 ?auto_435332 ) ) ( not ( = ?auto_435328 ?auto_435333 ) ) ( not ( = ?auto_435328 ?auto_435334 ) ) ( not ( = ?auto_435328 ?auto_435335 ) ) ( not ( = ?auto_435328 ?auto_435336 ) ) ( not ( = ?auto_435328 ?auto_435337 ) ) ( not ( = ?auto_435328 ?auto_435338 ) ) ( not ( = ?auto_435328 ?auto_435339 ) ) ( not ( = ?auto_435329 ?auto_435330 ) ) ( not ( = ?auto_435329 ?auto_435331 ) ) ( not ( = ?auto_435329 ?auto_435332 ) ) ( not ( = ?auto_435329 ?auto_435333 ) ) ( not ( = ?auto_435329 ?auto_435334 ) ) ( not ( = ?auto_435329 ?auto_435335 ) ) ( not ( = ?auto_435329 ?auto_435336 ) ) ( not ( = ?auto_435329 ?auto_435337 ) ) ( not ( = ?auto_435329 ?auto_435338 ) ) ( not ( = ?auto_435329 ?auto_435339 ) ) ( not ( = ?auto_435330 ?auto_435331 ) ) ( not ( = ?auto_435330 ?auto_435332 ) ) ( not ( = ?auto_435330 ?auto_435333 ) ) ( not ( = ?auto_435330 ?auto_435334 ) ) ( not ( = ?auto_435330 ?auto_435335 ) ) ( not ( = ?auto_435330 ?auto_435336 ) ) ( not ( = ?auto_435330 ?auto_435337 ) ) ( not ( = ?auto_435330 ?auto_435338 ) ) ( not ( = ?auto_435330 ?auto_435339 ) ) ( not ( = ?auto_435331 ?auto_435332 ) ) ( not ( = ?auto_435331 ?auto_435333 ) ) ( not ( = ?auto_435331 ?auto_435334 ) ) ( not ( = ?auto_435331 ?auto_435335 ) ) ( not ( = ?auto_435331 ?auto_435336 ) ) ( not ( = ?auto_435331 ?auto_435337 ) ) ( not ( = ?auto_435331 ?auto_435338 ) ) ( not ( = ?auto_435331 ?auto_435339 ) ) ( not ( = ?auto_435332 ?auto_435333 ) ) ( not ( = ?auto_435332 ?auto_435334 ) ) ( not ( = ?auto_435332 ?auto_435335 ) ) ( not ( = ?auto_435332 ?auto_435336 ) ) ( not ( = ?auto_435332 ?auto_435337 ) ) ( not ( = ?auto_435332 ?auto_435338 ) ) ( not ( = ?auto_435332 ?auto_435339 ) ) ( not ( = ?auto_435333 ?auto_435334 ) ) ( not ( = ?auto_435333 ?auto_435335 ) ) ( not ( = ?auto_435333 ?auto_435336 ) ) ( not ( = ?auto_435333 ?auto_435337 ) ) ( not ( = ?auto_435333 ?auto_435338 ) ) ( not ( = ?auto_435333 ?auto_435339 ) ) ( not ( = ?auto_435334 ?auto_435335 ) ) ( not ( = ?auto_435334 ?auto_435336 ) ) ( not ( = ?auto_435334 ?auto_435337 ) ) ( not ( = ?auto_435334 ?auto_435338 ) ) ( not ( = ?auto_435334 ?auto_435339 ) ) ( not ( = ?auto_435335 ?auto_435336 ) ) ( not ( = ?auto_435335 ?auto_435337 ) ) ( not ( = ?auto_435335 ?auto_435338 ) ) ( not ( = ?auto_435335 ?auto_435339 ) ) ( not ( = ?auto_435336 ?auto_435337 ) ) ( not ( = ?auto_435336 ?auto_435338 ) ) ( not ( = ?auto_435336 ?auto_435339 ) ) ( not ( = ?auto_435337 ?auto_435338 ) ) ( not ( = ?auto_435337 ?auto_435339 ) ) ( not ( = ?auto_435338 ?auto_435339 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_435338 ?auto_435339 )
      ( !STACK ?auto_435338 ?auto_435337 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435351 - BLOCK
      ?auto_435352 - BLOCK
      ?auto_435353 - BLOCK
      ?auto_435354 - BLOCK
      ?auto_435355 - BLOCK
      ?auto_435356 - BLOCK
      ?auto_435357 - BLOCK
      ?auto_435358 - BLOCK
      ?auto_435359 - BLOCK
      ?auto_435360 - BLOCK
      ?auto_435361 - BLOCK
    )
    :vars
    (
      ?auto_435362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435361 ?auto_435362 ) ( ON-TABLE ?auto_435351 ) ( ON ?auto_435352 ?auto_435351 ) ( ON ?auto_435353 ?auto_435352 ) ( ON ?auto_435354 ?auto_435353 ) ( ON ?auto_435355 ?auto_435354 ) ( ON ?auto_435356 ?auto_435355 ) ( ON ?auto_435357 ?auto_435356 ) ( ON ?auto_435358 ?auto_435357 ) ( ON ?auto_435359 ?auto_435358 ) ( not ( = ?auto_435351 ?auto_435352 ) ) ( not ( = ?auto_435351 ?auto_435353 ) ) ( not ( = ?auto_435351 ?auto_435354 ) ) ( not ( = ?auto_435351 ?auto_435355 ) ) ( not ( = ?auto_435351 ?auto_435356 ) ) ( not ( = ?auto_435351 ?auto_435357 ) ) ( not ( = ?auto_435351 ?auto_435358 ) ) ( not ( = ?auto_435351 ?auto_435359 ) ) ( not ( = ?auto_435351 ?auto_435360 ) ) ( not ( = ?auto_435351 ?auto_435361 ) ) ( not ( = ?auto_435351 ?auto_435362 ) ) ( not ( = ?auto_435352 ?auto_435353 ) ) ( not ( = ?auto_435352 ?auto_435354 ) ) ( not ( = ?auto_435352 ?auto_435355 ) ) ( not ( = ?auto_435352 ?auto_435356 ) ) ( not ( = ?auto_435352 ?auto_435357 ) ) ( not ( = ?auto_435352 ?auto_435358 ) ) ( not ( = ?auto_435352 ?auto_435359 ) ) ( not ( = ?auto_435352 ?auto_435360 ) ) ( not ( = ?auto_435352 ?auto_435361 ) ) ( not ( = ?auto_435352 ?auto_435362 ) ) ( not ( = ?auto_435353 ?auto_435354 ) ) ( not ( = ?auto_435353 ?auto_435355 ) ) ( not ( = ?auto_435353 ?auto_435356 ) ) ( not ( = ?auto_435353 ?auto_435357 ) ) ( not ( = ?auto_435353 ?auto_435358 ) ) ( not ( = ?auto_435353 ?auto_435359 ) ) ( not ( = ?auto_435353 ?auto_435360 ) ) ( not ( = ?auto_435353 ?auto_435361 ) ) ( not ( = ?auto_435353 ?auto_435362 ) ) ( not ( = ?auto_435354 ?auto_435355 ) ) ( not ( = ?auto_435354 ?auto_435356 ) ) ( not ( = ?auto_435354 ?auto_435357 ) ) ( not ( = ?auto_435354 ?auto_435358 ) ) ( not ( = ?auto_435354 ?auto_435359 ) ) ( not ( = ?auto_435354 ?auto_435360 ) ) ( not ( = ?auto_435354 ?auto_435361 ) ) ( not ( = ?auto_435354 ?auto_435362 ) ) ( not ( = ?auto_435355 ?auto_435356 ) ) ( not ( = ?auto_435355 ?auto_435357 ) ) ( not ( = ?auto_435355 ?auto_435358 ) ) ( not ( = ?auto_435355 ?auto_435359 ) ) ( not ( = ?auto_435355 ?auto_435360 ) ) ( not ( = ?auto_435355 ?auto_435361 ) ) ( not ( = ?auto_435355 ?auto_435362 ) ) ( not ( = ?auto_435356 ?auto_435357 ) ) ( not ( = ?auto_435356 ?auto_435358 ) ) ( not ( = ?auto_435356 ?auto_435359 ) ) ( not ( = ?auto_435356 ?auto_435360 ) ) ( not ( = ?auto_435356 ?auto_435361 ) ) ( not ( = ?auto_435356 ?auto_435362 ) ) ( not ( = ?auto_435357 ?auto_435358 ) ) ( not ( = ?auto_435357 ?auto_435359 ) ) ( not ( = ?auto_435357 ?auto_435360 ) ) ( not ( = ?auto_435357 ?auto_435361 ) ) ( not ( = ?auto_435357 ?auto_435362 ) ) ( not ( = ?auto_435358 ?auto_435359 ) ) ( not ( = ?auto_435358 ?auto_435360 ) ) ( not ( = ?auto_435358 ?auto_435361 ) ) ( not ( = ?auto_435358 ?auto_435362 ) ) ( not ( = ?auto_435359 ?auto_435360 ) ) ( not ( = ?auto_435359 ?auto_435361 ) ) ( not ( = ?auto_435359 ?auto_435362 ) ) ( not ( = ?auto_435360 ?auto_435361 ) ) ( not ( = ?auto_435360 ?auto_435362 ) ) ( not ( = ?auto_435361 ?auto_435362 ) ) ( CLEAR ?auto_435359 ) ( ON ?auto_435360 ?auto_435361 ) ( CLEAR ?auto_435360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_435351 ?auto_435352 ?auto_435353 ?auto_435354 ?auto_435355 ?auto_435356 ?auto_435357 ?auto_435358 ?auto_435359 ?auto_435360 )
      ( MAKE-11PILE ?auto_435351 ?auto_435352 ?auto_435353 ?auto_435354 ?auto_435355 ?auto_435356 ?auto_435357 ?auto_435358 ?auto_435359 ?auto_435360 ?auto_435361 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435374 - BLOCK
      ?auto_435375 - BLOCK
      ?auto_435376 - BLOCK
      ?auto_435377 - BLOCK
      ?auto_435378 - BLOCK
      ?auto_435379 - BLOCK
      ?auto_435380 - BLOCK
      ?auto_435381 - BLOCK
      ?auto_435382 - BLOCK
      ?auto_435383 - BLOCK
      ?auto_435384 - BLOCK
    )
    :vars
    (
      ?auto_435385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435384 ?auto_435385 ) ( ON-TABLE ?auto_435374 ) ( ON ?auto_435375 ?auto_435374 ) ( ON ?auto_435376 ?auto_435375 ) ( ON ?auto_435377 ?auto_435376 ) ( ON ?auto_435378 ?auto_435377 ) ( ON ?auto_435379 ?auto_435378 ) ( ON ?auto_435380 ?auto_435379 ) ( ON ?auto_435381 ?auto_435380 ) ( ON ?auto_435382 ?auto_435381 ) ( not ( = ?auto_435374 ?auto_435375 ) ) ( not ( = ?auto_435374 ?auto_435376 ) ) ( not ( = ?auto_435374 ?auto_435377 ) ) ( not ( = ?auto_435374 ?auto_435378 ) ) ( not ( = ?auto_435374 ?auto_435379 ) ) ( not ( = ?auto_435374 ?auto_435380 ) ) ( not ( = ?auto_435374 ?auto_435381 ) ) ( not ( = ?auto_435374 ?auto_435382 ) ) ( not ( = ?auto_435374 ?auto_435383 ) ) ( not ( = ?auto_435374 ?auto_435384 ) ) ( not ( = ?auto_435374 ?auto_435385 ) ) ( not ( = ?auto_435375 ?auto_435376 ) ) ( not ( = ?auto_435375 ?auto_435377 ) ) ( not ( = ?auto_435375 ?auto_435378 ) ) ( not ( = ?auto_435375 ?auto_435379 ) ) ( not ( = ?auto_435375 ?auto_435380 ) ) ( not ( = ?auto_435375 ?auto_435381 ) ) ( not ( = ?auto_435375 ?auto_435382 ) ) ( not ( = ?auto_435375 ?auto_435383 ) ) ( not ( = ?auto_435375 ?auto_435384 ) ) ( not ( = ?auto_435375 ?auto_435385 ) ) ( not ( = ?auto_435376 ?auto_435377 ) ) ( not ( = ?auto_435376 ?auto_435378 ) ) ( not ( = ?auto_435376 ?auto_435379 ) ) ( not ( = ?auto_435376 ?auto_435380 ) ) ( not ( = ?auto_435376 ?auto_435381 ) ) ( not ( = ?auto_435376 ?auto_435382 ) ) ( not ( = ?auto_435376 ?auto_435383 ) ) ( not ( = ?auto_435376 ?auto_435384 ) ) ( not ( = ?auto_435376 ?auto_435385 ) ) ( not ( = ?auto_435377 ?auto_435378 ) ) ( not ( = ?auto_435377 ?auto_435379 ) ) ( not ( = ?auto_435377 ?auto_435380 ) ) ( not ( = ?auto_435377 ?auto_435381 ) ) ( not ( = ?auto_435377 ?auto_435382 ) ) ( not ( = ?auto_435377 ?auto_435383 ) ) ( not ( = ?auto_435377 ?auto_435384 ) ) ( not ( = ?auto_435377 ?auto_435385 ) ) ( not ( = ?auto_435378 ?auto_435379 ) ) ( not ( = ?auto_435378 ?auto_435380 ) ) ( not ( = ?auto_435378 ?auto_435381 ) ) ( not ( = ?auto_435378 ?auto_435382 ) ) ( not ( = ?auto_435378 ?auto_435383 ) ) ( not ( = ?auto_435378 ?auto_435384 ) ) ( not ( = ?auto_435378 ?auto_435385 ) ) ( not ( = ?auto_435379 ?auto_435380 ) ) ( not ( = ?auto_435379 ?auto_435381 ) ) ( not ( = ?auto_435379 ?auto_435382 ) ) ( not ( = ?auto_435379 ?auto_435383 ) ) ( not ( = ?auto_435379 ?auto_435384 ) ) ( not ( = ?auto_435379 ?auto_435385 ) ) ( not ( = ?auto_435380 ?auto_435381 ) ) ( not ( = ?auto_435380 ?auto_435382 ) ) ( not ( = ?auto_435380 ?auto_435383 ) ) ( not ( = ?auto_435380 ?auto_435384 ) ) ( not ( = ?auto_435380 ?auto_435385 ) ) ( not ( = ?auto_435381 ?auto_435382 ) ) ( not ( = ?auto_435381 ?auto_435383 ) ) ( not ( = ?auto_435381 ?auto_435384 ) ) ( not ( = ?auto_435381 ?auto_435385 ) ) ( not ( = ?auto_435382 ?auto_435383 ) ) ( not ( = ?auto_435382 ?auto_435384 ) ) ( not ( = ?auto_435382 ?auto_435385 ) ) ( not ( = ?auto_435383 ?auto_435384 ) ) ( not ( = ?auto_435383 ?auto_435385 ) ) ( not ( = ?auto_435384 ?auto_435385 ) ) ( CLEAR ?auto_435382 ) ( ON ?auto_435383 ?auto_435384 ) ( CLEAR ?auto_435383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_435374 ?auto_435375 ?auto_435376 ?auto_435377 ?auto_435378 ?auto_435379 ?auto_435380 ?auto_435381 ?auto_435382 ?auto_435383 )
      ( MAKE-11PILE ?auto_435374 ?auto_435375 ?auto_435376 ?auto_435377 ?auto_435378 ?auto_435379 ?auto_435380 ?auto_435381 ?auto_435382 ?auto_435383 ?auto_435384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435397 - BLOCK
      ?auto_435398 - BLOCK
      ?auto_435399 - BLOCK
      ?auto_435400 - BLOCK
      ?auto_435401 - BLOCK
      ?auto_435402 - BLOCK
      ?auto_435403 - BLOCK
      ?auto_435404 - BLOCK
      ?auto_435405 - BLOCK
      ?auto_435406 - BLOCK
      ?auto_435407 - BLOCK
    )
    :vars
    (
      ?auto_435408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435407 ?auto_435408 ) ( ON-TABLE ?auto_435397 ) ( ON ?auto_435398 ?auto_435397 ) ( ON ?auto_435399 ?auto_435398 ) ( ON ?auto_435400 ?auto_435399 ) ( ON ?auto_435401 ?auto_435400 ) ( ON ?auto_435402 ?auto_435401 ) ( ON ?auto_435403 ?auto_435402 ) ( ON ?auto_435404 ?auto_435403 ) ( not ( = ?auto_435397 ?auto_435398 ) ) ( not ( = ?auto_435397 ?auto_435399 ) ) ( not ( = ?auto_435397 ?auto_435400 ) ) ( not ( = ?auto_435397 ?auto_435401 ) ) ( not ( = ?auto_435397 ?auto_435402 ) ) ( not ( = ?auto_435397 ?auto_435403 ) ) ( not ( = ?auto_435397 ?auto_435404 ) ) ( not ( = ?auto_435397 ?auto_435405 ) ) ( not ( = ?auto_435397 ?auto_435406 ) ) ( not ( = ?auto_435397 ?auto_435407 ) ) ( not ( = ?auto_435397 ?auto_435408 ) ) ( not ( = ?auto_435398 ?auto_435399 ) ) ( not ( = ?auto_435398 ?auto_435400 ) ) ( not ( = ?auto_435398 ?auto_435401 ) ) ( not ( = ?auto_435398 ?auto_435402 ) ) ( not ( = ?auto_435398 ?auto_435403 ) ) ( not ( = ?auto_435398 ?auto_435404 ) ) ( not ( = ?auto_435398 ?auto_435405 ) ) ( not ( = ?auto_435398 ?auto_435406 ) ) ( not ( = ?auto_435398 ?auto_435407 ) ) ( not ( = ?auto_435398 ?auto_435408 ) ) ( not ( = ?auto_435399 ?auto_435400 ) ) ( not ( = ?auto_435399 ?auto_435401 ) ) ( not ( = ?auto_435399 ?auto_435402 ) ) ( not ( = ?auto_435399 ?auto_435403 ) ) ( not ( = ?auto_435399 ?auto_435404 ) ) ( not ( = ?auto_435399 ?auto_435405 ) ) ( not ( = ?auto_435399 ?auto_435406 ) ) ( not ( = ?auto_435399 ?auto_435407 ) ) ( not ( = ?auto_435399 ?auto_435408 ) ) ( not ( = ?auto_435400 ?auto_435401 ) ) ( not ( = ?auto_435400 ?auto_435402 ) ) ( not ( = ?auto_435400 ?auto_435403 ) ) ( not ( = ?auto_435400 ?auto_435404 ) ) ( not ( = ?auto_435400 ?auto_435405 ) ) ( not ( = ?auto_435400 ?auto_435406 ) ) ( not ( = ?auto_435400 ?auto_435407 ) ) ( not ( = ?auto_435400 ?auto_435408 ) ) ( not ( = ?auto_435401 ?auto_435402 ) ) ( not ( = ?auto_435401 ?auto_435403 ) ) ( not ( = ?auto_435401 ?auto_435404 ) ) ( not ( = ?auto_435401 ?auto_435405 ) ) ( not ( = ?auto_435401 ?auto_435406 ) ) ( not ( = ?auto_435401 ?auto_435407 ) ) ( not ( = ?auto_435401 ?auto_435408 ) ) ( not ( = ?auto_435402 ?auto_435403 ) ) ( not ( = ?auto_435402 ?auto_435404 ) ) ( not ( = ?auto_435402 ?auto_435405 ) ) ( not ( = ?auto_435402 ?auto_435406 ) ) ( not ( = ?auto_435402 ?auto_435407 ) ) ( not ( = ?auto_435402 ?auto_435408 ) ) ( not ( = ?auto_435403 ?auto_435404 ) ) ( not ( = ?auto_435403 ?auto_435405 ) ) ( not ( = ?auto_435403 ?auto_435406 ) ) ( not ( = ?auto_435403 ?auto_435407 ) ) ( not ( = ?auto_435403 ?auto_435408 ) ) ( not ( = ?auto_435404 ?auto_435405 ) ) ( not ( = ?auto_435404 ?auto_435406 ) ) ( not ( = ?auto_435404 ?auto_435407 ) ) ( not ( = ?auto_435404 ?auto_435408 ) ) ( not ( = ?auto_435405 ?auto_435406 ) ) ( not ( = ?auto_435405 ?auto_435407 ) ) ( not ( = ?auto_435405 ?auto_435408 ) ) ( not ( = ?auto_435406 ?auto_435407 ) ) ( not ( = ?auto_435406 ?auto_435408 ) ) ( not ( = ?auto_435407 ?auto_435408 ) ) ( ON ?auto_435406 ?auto_435407 ) ( CLEAR ?auto_435404 ) ( ON ?auto_435405 ?auto_435406 ) ( CLEAR ?auto_435405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_435397 ?auto_435398 ?auto_435399 ?auto_435400 ?auto_435401 ?auto_435402 ?auto_435403 ?auto_435404 ?auto_435405 )
      ( MAKE-11PILE ?auto_435397 ?auto_435398 ?auto_435399 ?auto_435400 ?auto_435401 ?auto_435402 ?auto_435403 ?auto_435404 ?auto_435405 ?auto_435406 ?auto_435407 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435420 - BLOCK
      ?auto_435421 - BLOCK
      ?auto_435422 - BLOCK
      ?auto_435423 - BLOCK
      ?auto_435424 - BLOCK
      ?auto_435425 - BLOCK
      ?auto_435426 - BLOCK
      ?auto_435427 - BLOCK
      ?auto_435428 - BLOCK
      ?auto_435429 - BLOCK
      ?auto_435430 - BLOCK
    )
    :vars
    (
      ?auto_435431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435430 ?auto_435431 ) ( ON-TABLE ?auto_435420 ) ( ON ?auto_435421 ?auto_435420 ) ( ON ?auto_435422 ?auto_435421 ) ( ON ?auto_435423 ?auto_435422 ) ( ON ?auto_435424 ?auto_435423 ) ( ON ?auto_435425 ?auto_435424 ) ( ON ?auto_435426 ?auto_435425 ) ( ON ?auto_435427 ?auto_435426 ) ( not ( = ?auto_435420 ?auto_435421 ) ) ( not ( = ?auto_435420 ?auto_435422 ) ) ( not ( = ?auto_435420 ?auto_435423 ) ) ( not ( = ?auto_435420 ?auto_435424 ) ) ( not ( = ?auto_435420 ?auto_435425 ) ) ( not ( = ?auto_435420 ?auto_435426 ) ) ( not ( = ?auto_435420 ?auto_435427 ) ) ( not ( = ?auto_435420 ?auto_435428 ) ) ( not ( = ?auto_435420 ?auto_435429 ) ) ( not ( = ?auto_435420 ?auto_435430 ) ) ( not ( = ?auto_435420 ?auto_435431 ) ) ( not ( = ?auto_435421 ?auto_435422 ) ) ( not ( = ?auto_435421 ?auto_435423 ) ) ( not ( = ?auto_435421 ?auto_435424 ) ) ( not ( = ?auto_435421 ?auto_435425 ) ) ( not ( = ?auto_435421 ?auto_435426 ) ) ( not ( = ?auto_435421 ?auto_435427 ) ) ( not ( = ?auto_435421 ?auto_435428 ) ) ( not ( = ?auto_435421 ?auto_435429 ) ) ( not ( = ?auto_435421 ?auto_435430 ) ) ( not ( = ?auto_435421 ?auto_435431 ) ) ( not ( = ?auto_435422 ?auto_435423 ) ) ( not ( = ?auto_435422 ?auto_435424 ) ) ( not ( = ?auto_435422 ?auto_435425 ) ) ( not ( = ?auto_435422 ?auto_435426 ) ) ( not ( = ?auto_435422 ?auto_435427 ) ) ( not ( = ?auto_435422 ?auto_435428 ) ) ( not ( = ?auto_435422 ?auto_435429 ) ) ( not ( = ?auto_435422 ?auto_435430 ) ) ( not ( = ?auto_435422 ?auto_435431 ) ) ( not ( = ?auto_435423 ?auto_435424 ) ) ( not ( = ?auto_435423 ?auto_435425 ) ) ( not ( = ?auto_435423 ?auto_435426 ) ) ( not ( = ?auto_435423 ?auto_435427 ) ) ( not ( = ?auto_435423 ?auto_435428 ) ) ( not ( = ?auto_435423 ?auto_435429 ) ) ( not ( = ?auto_435423 ?auto_435430 ) ) ( not ( = ?auto_435423 ?auto_435431 ) ) ( not ( = ?auto_435424 ?auto_435425 ) ) ( not ( = ?auto_435424 ?auto_435426 ) ) ( not ( = ?auto_435424 ?auto_435427 ) ) ( not ( = ?auto_435424 ?auto_435428 ) ) ( not ( = ?auto_435424 ?auto_435429 ) ) ( not ( = ?auto_435424 ?auto_435430 ) ) ( not ( = ?auto_435424 ?auto_435431 ) ) ( not ( = ?auto_435425 ?auto_435426 ) ) ( not ( = ?auto_435425 ?auto_435427 ) ) ( not ( = ?auto_435425 ?auto_435428 ) ) ( not ( = ?auto_435425 ?auto_435429 ) ) ( not ( = ?auto_435425 ?auto_435430 ) ) ( not ( = ?auto_435425 ?auto_435431 ) ) ( not ( = ?auto_435426 ?auto_435427 ) ) ( not ( = ?auto_435426 ?auto_435428 ) ) ( not ( = ?auto_435426 ?auto_435429 ) ) ( not ( = ?auto_435426 ?auto_435430 ) ) ( not ( = ?auto_435426 ?auto_435431 ) ) ( not ( = ?auto_435427 ?auto_435428 ) ) ( not ( = ?auto_435427 ?auto_435429 ) ) ( not ( = ?auto_435427 ?auto_435430 ) ) ( not ( = ?auto_435427 ?auto_435431 ) ) ( not ( = ?auto_435428 ?auto_435429 ) ) ( not ( = ?auto_435428 ?auto_435430 ) ) ( not ( = ?auto_435428 ?auto_435431 ) ) ( not ( = ?auto_435429 ?auto_435430 ) ) ( not ( = ?auto_435429 ?auto_435431 ) ) ( not ( = ?auto_435430 ?auto_435431 ) ) ( ON ?auto_435429 ?auto_435430 ) ( CLEAR ?auto_435427 ) ( ON ?auto_435428 ?auto_435429 ) ( CLEAR ?auto_435428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_435420 ?auto_435421 ?auto_435422 ?auto_435423 ?auto_435424 ?auto_435425 ?auto_435426 ?auto_435427 ?auto_435428 )
      ( MAKE-11PILE ?auto_435420 ?auto_435421 ?auto_435422 ?auto_435423 ?auto_435424 ?auto_435425 ?auto_435426 ?auto_435427 ?auto_435428 ?auto_435429 ?auto_435430 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435443 - BLOCK
      ?auto_435444 - BLOCK
      ?auto_435445 - BLOCK
      ?auto_435446 - BLOCK
      ?auto_435447 - BLOCK
      ?auto_435448 - BLOCK
      ?auto_435449 - BLOCK
      ?auto_435450 - BLOCK
      ?auto_435451 - BLOCK
      ?auto_435452 - BLOCK
      ?auto_435453 - BLOCK
    )
    :vars
    (
      ?auto_435454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435453 ?auto_435454 ) ( ON-TABLE ?auto_435443 ) ( ON ?auto_435444 ?auto_435443 ) ( ON ?auto_435445 ?auto_435444 ) ( ON ?auto_435446 ?auto_435445 ) ( ON ?auto_435447 ?auto_435446 ) ( ON ?auto_435448 ?auto_435447 ) ( ON ?auto_435449 ?auto_435448 ) ( not ( = ?auto_435443 ?auto_435444 ) ) ( not ( = ?auto_435443 ?auto_435445 ) ) ( not ( = ?auto_435443 ?auto_435446 ) ) ( not ( = ?auto_435443 ?auto_435447 ) ) ( not ( = ?auto_435443 ?auto_435448 ) ) ( not ( = ?auto_435443 ?auto_435449 ) ) ( not ( = ?auto_435443 ?auto_435450 ) ) ( not ( = ?auto_435443 ?auto_435451 ) ) ( not ( = ?auto_435443 ?auto_435452 ) ) ( not ( = ?auto_435443 ?auto_435453 ) ) ( not ( = ?auto_435443 ?auto_435454 ) ) ( not ( = ?auto_435444 ?auto_435445 ) ) ( not ( = ?auto_435444 ?auto_435446 ) ) ( not ( = ?auto_435444 ?auto_435447 ) ) ( not ( = ?auto_435444 ?auto_435448 ) ) ( not ( = ?auto_435444 ?auto_435449 ) ) ( not ( = ?auto_435444 ?auto_435450 ) ) ( not ( = ?auto_435444 ?auto_435451 ) ) ( not ( = ?auto_435444 ?auto_435452 ) ) ( not ( = ?auto_435444 ?auto_435453 ) ) ( not ( = ?auto_435444 ?auto_435454 ) ) ( not ( = ?auto_435445 ?auto_435446 ) ) ( not ( = ?auto_435445 ?auto_435447 ) ) ( not ( = ?auto_435445 ?auto_435448 ) ) ( not ( = ?auto_435445 ?auto_435449 ) ) ( not ( = ?auto_435445 ?auto_435450 ) ) ( not ( = ?auto_435445 ?auto_435451 ) ) ( not ( = ?auto_435445 ?auto_435452 ) ) ( not ( = ?auto_435445 ?auto_435453 ) ) ( not ( = ?auto_435445 ?auto_435454 ) ) ( not ( = ?auto_435446 ?auto_435447 ) ) ( not ( = ?auto_435446 ?auto_435448 ) ) ( not ( = ?auto_435446 ?auto_435449 ) ) ( not ( = ?auto_435446 ?auto_435450 ) ) ( not ( = ?auto_435446 ?auto_435451 ) ) ( not ( = ?auto_435446 ?auto_435452 ) ) ( not ( = ?auto_435446 ?auto_435453 ) ) ( not ( = ?auto_435446 ?auto_435454 ) ) ( not ( = ?auto_435447 ?auto_435448 ) ) ( not ( = ?auto_435447 ?auto_435449 ) ) ( not ( = ?auto_435447 ?auto_435450 ) ) ( not ( = ?auto_435447 ?auto_435451 ) ) ( not ( = ?auto_435447 ?auto_435452 ) ) ( not ( = ?auto_435447 ?auto_435453 ) ) ( not ( = ?auto_435447 ?auto_435454 ) ) ( not ( = ?auto_435448 ?auto_435449 ) ) ( not ( = ?auto_435448 ?auto_435450 ) ) ( not ( = ?auto_435448 ?auto_435451 ) ) ( not ( = ?auto_435448 ?auto_435452 ) ) ( not ( = ?auto_435448 ?auto_435453 ) ) ( not ( = ?auto_435448 ?auto_435454 ) ) ( not ( = ?auto_435449 ?auto_435450 ) ) ( not ( = ?auto_435449 ?auto_435451 ) ) ( not ( = ?auto_435449 ?auto_435452 ) ) ( not ( = ?auto_435449 ?auto_435453 ) ) ( not ( = ?auto_435449 ?auto_435454 ) ) ( not ( = ?auto_435450 ?auto_435451 ) ) ( not ( = ?auto_435450 ?auto_435452 ) ) ( not ( = ?auto_435450 ?auto_435453 ) ) ( not ( = ?auto_435450 ?auto_435454 ) ) ( not ( = ?auto_435451 ?auto_435452 ) ) ( not ( = ?auto_435451 ?auto_435453 ) ) ( not ( = ?auto_435451 ?auto_435454 ) ) ( not ( = ?auto_435452 ?auto_435453 ) ) ( not ( = ?auto_435452 ?auto_435454 ) ) ( not ( = ?auto_435453 ?auto_435454 ) ) ( ON ?auto_435452 ?auto_435453 ) ( ON ?auto_435451 ?auto_435452 ) ( CLEAR ?auto_435449 ) ( ON ?auto_435450 ?auto_435451 ) ( CLEAR ?auto_435450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_435443 ?auto_435444 ?auto_435445 ?auto_435446 ?auto_435447 ?auto_435448 ?auto_435449 ?auto_435450 )
      ( MAKE-11PILE ?auto_435443 ?auto_435444 ?auto_435445 ?auto_435446 ?auto_435447 ?auto_435448 ?auto_435449 ?auto_435450 ?auto_435451 ?auto_435452 ?auto_435453 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435466 - BLOCK
      ?auto_435467 - BLOCK
      ?auto_435468 - BLOCK
      ?auto_435469 - BLOCK
      ?auto_435470 - BLOCK
      ?auto_435471 - BLOCK
      ?auto_435472 - BLOCK
      ?auto_435473 - BLOCK
      ?auto_435474 - BLOCK
      ?auto_435475 - BLOCK
      ?auto_435476 - BLOCK
    )
    :vars
    (
      ?auto_435477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435476 ?auto_435477 ) ( ON-TABLE ?auto_435466 ) ( ON ?auto_435467 ?auto_435466 ) ( ON ?auto_435468 ?auto_435467 ) ( ON ?auto_435469 ?auto_435468 ) ( ON ?auto_435470 ?auto_435469 ) ( ON ?auto_435471 ?auto_435470 ) ( ON ?auto_435472 ?auto_435471 ) ( not ( = ?auto_435466 ?auto_435467 ) ) ( not ( = ?auto_435466 ?auto_435468 ) ) ( not ( = ?auto_435466 ?auto_435469 ) ) ( not ( = ?auto_435466 ?auto_435470 ) ) ( not ( = ?auto_435466 ?auto_435471 ) ) ( not ( = ?auto_435466 ?auto_435472 ) ) ( not ( = ?auto_435466 ?auto_435473 ) ) ( not ( = ?auto_435466 ?auto_435474 ) ) ( not ( = ?auto_435466 ?auto_435475 ) ) ( not ( = ?auto_435466 ?auto_435476 ) ) ( not ( = ?auto_435466 ?auto_435477 ) ) ( not ( = ?auto_435467 ?auto_435468 ) ) ( not ( = ?auto_435467 ?auto_435469 ) ) ( not ( = ?auto_435467 ?auto_435470 ) ) ( not ( = ?auto_435467 ?auto_435471 ) ) ( not ( = ?auto_435467 ?auto_435472 ) ) ( not ( = ?auto_435467 ?auto_435473 ) ) ( not ( = ?auto_435467 ?auto_435474 ) ) ( not ( = ?auto_435467 ?auto_435475 ) ) ( not ( = ?auto_435467 ?auto_435476 ) ) ( not ( = ?auto_435467 ?auto_435477 ) ) ( not ( = ?auto_435468 ?auto_435469 ) ) ( not ( = ?auto_435468 ?auto_435470 ) ) ( not ( = ?auto_435468 ?auto_435471 ) ) ( not ( = ?auto_435468 ?auto_435472 ) ) ( not ( = ?auto_435468 ?auto_435473 ) ) ( not ( = ?auto_435468 ?auto_435474 ) ) ( not ( = ?auto_435468 ?auto_435475 ) ) ( not ( = ?auto_435468 ?auto_435476 ) ) ( not ( = ?auto_435468 ?auto_435477 ) ) ( not ( = ?auto_435469 ?auto_435470 ) ) ( not ( = ?auto_435469 ?auto_435471 ) ) ( not ( = ?auto_435469 ?auto_435472 ) ) ( not ( = ?auto_435469 ?auto_435473 ) ) ( not ( = ?auto_435469 ?auto_435474 ) ) ( not ( = ?auto_435469 ?auto_435475 ) ) ( not ( = ?auto_435469 ?auto_435476 ) ) ( not ( = ?auto_435469 ?auto_435477 ) ) ( not ( = ?auto_435470 ?auto_435471 ) ) ( not ( = ?auto_435470 ?auto_435472 ) ) ( not ( = ?auto_435470 ?auto_435473 ) ) ( not ( = ?auto_435470 ?auto_435474 ) ) ( not ( = ?auto_435470 ?auto_435475 ) ) ( not ( = ?auto_435470 ?auto_435476 ) ) ( not ( = ?auto_435470 ?auto_435477 ) ) ( not ( = ?auto_435471 ?auto_435472 ) ) ( not ( = ?auto_435471 ?auto_435473 ) ) ( not ( = ?auto_435471 ?auto_435474 ) ) ( not ( = ?auto_435471 ?auto_435475 ) ) ( not ( = ?auto_435471 ?auto_435476 ) ) ( not ( = ?auto_435471 ?auto_435477 ) ) ( not ( = ?auto_435472 ?auto_435473 ) ) ( not ( = ?auto_435472 ?auto_435474 ) ) ( not ( = ?auto_435472 ?auto_435475 ) ) ( not ( = ?auto_435472 ?auto_435476 ) ) ( not ( = ?auto_435472 ?auto_435477 ) ) ( not ( = ?auto_435473 ?auto_435474 ) ) ( not ( = ?auto_435473 ?auto_435475 ) ) ( not ( = ?auto_435473 ?auto_435476 ) ) ( not ( = ?auto_435473 ?auto_435477 ) ) ( not ( = ?auto_435474 ?auto_435475 ) ) ( not ( = ?auto_435474 ?auto_435476 ) ) ( not ( = ?auto_435474 ?auto_435477 ) ) ( not ( = ?auto_435475 ?auto_435476 ) ) ( not ( = ?auto_435475 ?auto_435477 ) ) ( not ( = ?auto_435476 ?auto_435477 ) ) ( ON ?auto_435475 ?auto_435476 ) ( ON ?auto_435474 ?auto_435475 ) ( CLEAR ?auto_435472 ) ( ON ?auto_435473 ?auto_435474 ) ( CLEAR ?auto_435473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_435466 ?auto_435467 ?auto_435468 ?auto_435469 ?auto_435470 ?auto_435471 ?auto_435472 ?auto_435473 )
      ( MAKE-11PILE ?auto_435466 ?auto_435467 ?auto_435468 ?auto_435469 ?auto_435470 ?auto_435471 ?auto_435472 ?auto_435473 ?auto_435474 ?auto_435475 ?auto_435476 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435489 - BLOCK
      ?auto_435490 - BLOCK
      ?auto_435491 - BLOCK
      ?auto_435492 - BLOCK
      ?auto_435493 - BLOCK
      ?auto_435494 - BLOCK
      ?auto_435495 - BLOCK
      ?auto_435496 - BLOCK
      ?auto_435497 - BLOCK
      ?auto_435498 - BLOCK
      ?auto_435499 - BLOCK
    )
    :vars
    (
      ?auto_435500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435499 ?auto_435500 ) ( ON-TABLE ?auto_435489 ) ( ON ?auto_435490 ?auto_435489 ) ( ON ?auto_435491 ?auto_435490 ) ( ON ?auto_435492 ?auto_435491 ) ( ON ?auto_435493 ?auto_435492 ) ( ON ?auto_435494 ?auto_435493 ) ( not ( = ?auto_435489 ?auto_435490 ) ) ( not ( = ?auto_435489 ?auto_435491 ) ) ( not ( = ?auto_435489 ?auto_435492 ) ) ( not ( = ?auto_435489 ?auto_435493 ) ) ( not ( = ?auto_435489 ?auto_435494 ) ) ( not ( = ?auto_435489 ?auto_435495 ) ) ( not ( = ?auto_435489 ?auto_435496 ) ) ( not ( = ?auto_435489 ?auto_435497 ) ) ( not ( = ?auto_435489 ?auto_435498 ) ) ( not ( = ?auto_435489 ?auto_435499 ) ) ( not ( = ?auto_435489 ?auto_435500 ) ) ( not ( = ?auto_435490 ?auto_435491 ) ) ( not ( = ?auto_435490 ?auto_435492 ) ) ( not ( = ?auto_435490 ?auto_435493 ) ) ( not ( = ?auto_435490 ?auto_435494 ) ) ( not ( = ?auto_435490 ?auto_435495 ) ) ( not ( = ?auto_435490 ?auto_435496 ) ) ( not ( = ?auto_435490 ?auto_435497 ) ) ( not ( = ?auto_435490 ?auto_435498 ) ) ( not ( = ?auto_435490 ?auto_435499 ) ) ( not ( = ?auto_435490 ?auto_435500 ) ) ( not ( = ?auto_435491 ?auto_435492 ) ) ( not ( = ?auto_435491 ?auto_435493 ) ) ( not ( = ?auto_435491 ?auto_435494 ) ) ( not ( = ?auto_435491 ?auto_435495 ) ) ( not ( = ?auto_435491 ?auto_435496 ) ) ( not ( = ?auto_435491 ?auto_435497 ) ) ( not ( = ?auto_435491 ?auto_435498 ) ) ( not ( = ?auto_435491 ?auto_435499 ) ) ( not ( = ?auto_435491 ?auto_435500 ) ) ( not ( = ?auto_435492 ?auto_435493 ) ) ( not ( = ?auto_435492 ?auto_435494 ) ) ( not ( = ?auto_435492 ?auto_435495 ) ) ( not ( = ?auto_435492 ?auto_435496 ) ) ( not ( = ?auto_435492 ?auto_435497 ) ) ( not ( = ?auto_435492 ?auto_435498 ) ) ( not ( = ?auto_435492 ?auto_435499 ) ) ( not ( = ?auto_435492 ?auto_435500 ) ) ( not ( = ?auto_435493 ?auto_435494 ) ) ( not ( = ?auto_435493 ?auto_435495 ) ) ( not ( = ?auto_435493 ?auto_435496 ) ) ( not ( = ?auto_435493 ?auto_435497 ) ) ( not ( = ?auto_435493 ?auto_435498 ) ) ( not ( = ?auto_435493 ?auto_435499 ) ) ( not ( = ?auto_435493 ?auto_435500 ) ) ( not ( = ?auto_435494 ?auto_435495 ) ) ( not ( = ?auto_435494 ?auto_435496 ) ) ( not ( = ?auto_435494 ?auto_435497 ) ) ( not ( = ?auto_435494 ?auto_435498 ) ) ( not ( = ?auto_435494 ?auto_435499 ) ) ( not ( = ?auto_435494 ?auto_435500 ) ) ( not ( = ?auto_435495 ?auto_435496 ) ) ( not ( = ?auto_435495 ?auto_435497 ) ) ( not ( = ?auto_435495 ?auto_435498 ) ) ( not ( = ?auto_435495 ?auto_435499 ) ) ( not ( = ?auto_435495 ?auto_435500 ) ) ( not ( = ?auto_435496 ?auto_435497 ) ) ( not ( = ?auto_435496 ?auto_435498 ) ) ( not ( = ?auto_435496 ?auto_435499 ) ) ( not ( = ?auto_435496 ?auto_435500 ) ) ( not ( = ?auto_435497 ?auto_435498 ) ) ( not ( = ?auto_435497 ?auto_435499 ) ) ( not ( = ?auto_435497 ?auto_435500 ) ) ( not ( = ?auto_435498 ?auto_435499 ) ) ( not ( = ?auto_435498 ?auto_435500 ) ) ( not ( = ?auto_435499 ?auto_435500 ) ) ( ON ?auto_435498 ?auto_435499 ) ( ON ?auto_435497 ?auto_435498 ) ( ON ?auto_435496 ?auto_435497 ) ( CLEAR ?auto_435494 ) ( ON ?auto_435495 ?auto_435496 ) ( CLEAR ?auto_435495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_435489 ?auto_435490 ?auto_435491 ?auto_435492 ?auto_435493 ?auto_435494 ?auto_435495 )
      ( MAKE-11PILE ?auto_435489 ?auto_435490 ?auto_435491 ?auto_435492 ?auto_435493 ?auto_435494 ?auto_435495 ?auto_435496 ?auto_435497 ?auto_435498 ?auto_435499 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435512 - BLOCK
      ?auto_435513 - BLOCK
      ?auto_435514 - BLOCK
      ?auto_435515 - BLOCK
      ?auto_435516 - BLOCK
      ?auto_435517 - BLOCK
      ?auto_435518 - BLOCK
      ?auto_435519 - BLOCK
      ?auto_435520 - BLOCK
      ?auto_435521 - BLOCK
      ?auto_435522 - BLOCK
    )
    :vars
    (
      ?auto_435523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435522 ?auto_435523 ) ( ON-TABLE ?auto_435512 ) ( ON ?auto_435513 ?auto_435512 ) ( ON ?auto_435514 ?auto_435513 ) ( ON ?auto_435515 ?auto_435514 ) ( ON ?auto_435516 ?auto_435515 ) ( ON ?auto_435517 ?auto_435516 ) ( not ( = ?auto_435512 ?auto_435513 ) ) ( not ( = ?auto_435512 ?auto_435514 ) ) ( not ( = ?auto_435512 ?auto_435515 ) ) ( not ( = ?auto_435512 ?auto_435516 ) ) ( not ( = ?auto_435512 ?auto_435517 ) ) ( not ( = ?auto_435512 ?auto_435518 ) ) ( not ( = ?auto_435512 ?auto_435519 ) ) ( not ( = ?auto_435512 ?auto_435520 ) ) ( not ( = ?auto_435512 ?auto_435521 ) ) ( not ( = ?auto_435512 ?auto_435522 ) ) ( not ( = ?auto_435512 ?auto_435523 ) ) ( not ( = ?auto_435513 ?auto_435514 ) ) ( not ( = ?auto_435513 ?auto_435515 ) ) ( not ( = ?auto_435513 ?auto_435516 ) ) ( not ( = ?auto_435513 ?auto_435517 ) ) ( not ( = ?auto_435513 ?auto_435518 ) ) ( not ( = ?auto_435513 ?auto_435519 ) ) ( not ( = ?auto_435513 ?auto_435520 ) ) ( not ( = ?auto_435513 ?auto_435521 ) ) ( not ( = ?auto_435513 ?auto_435522 ) ) ( not ( = ?auto_435513 ?auto_435523 ) ) ( not ( = ?auto_435514 ?auto_435515 ) ) ( not ( = ?auto_435514 ?auto_435516 ) ) ( not ( = ?auto_435514 ?auto_435517 ) ) ( not ( = ?auto_435514 ?auto_435518 ) ) ( not ( = ?auto_435514 ?auto_435519 ) ) ( not ( = ?auto_435514 ?auto_435520 ) ) ( not ( = ?auto_435514 ?auto_435521 ) ) ( not ( = ?auto_435514 ?auto_435522 ) ) ( not ( = ?auto_435514 ?auto_435523 ) ) ( not ( = ?auto_435515 ?auto_435516 ) ) ( not ( = ?auto_435515 ?auto_435517 ) ) ( not ( = ?auto_435515 ?auto_435518 ) ) ( not ( = ?auto_435515 ?auto_435519 ) ) ( not ( = ?auto_435515 ?auto_435520 ) ) ( not ( = ?auto_435515 ?auto_435521 ) ) ( not ( = ?auto_435515 ?auto_435522 ) ) ( not ( = ?auto_435515 ?auto_435523 ) ) ( not ( = ?auto_435516 ?auto_435517 ) ) ( not ( = ?auto_435516 ?auto_435518 ) ) ( not ( = ?auto_435516 ?auto_435519 ) ) ( not ( = ?auto_435516 ?auto_435520 ) ) ( not ( = ?auto_435516 ?auto_435521 ) ) ( not ( = ?auto_435516 ?auto_435522 ) ) ( not ( = ?auto_435516 ?auto_435523 ) ) ( not ( = ?auto_435517 ?auto_435518 ) ) ( not ( = ?auto_435517 ?auto_435519 ) ) ( not ( = ?auto_435517 ?auto_435520 ) ) ( not ( = ?auto_435517 ?auto_435521 ) ) ( not ( = ?auto_435517 ?auto_435522 ) ) ( not ( = ?auto_435517 ?auto_435523 ) ) ( not ( = ?auto_435518 ?auto_435519 ) ) ( not ( = ?auto_435518 ?auto_435520 ) ) ( not ( = ?auto_435518 ?auto_435521 ) ) ( not ( = ?auto_435518 ?auto_435522 ) ) ( not ( = ?auto_435518 ?auto_435523 ) ) ( not ( = ?auto_435519 ?auto_435520 ) ) ( not ( = ?auto_435519 ?auto_435521 ) ) ( not ( = ?auto_435519 ?auto_435522 ) ) ( not ( = ?auto_435519 ?auto_435523 ) ) ( not ( = ?auto_435520 ?auto_435521 ) ) ( not ( = ?auto_435520 ?auto_435522 ) ) ( not ( = ?auto_435520 ?auto_435523 ) ) ( not ( = ?auto_435521 ?auto_435522 ) ) ( not ( = ?auto_435521 ?auto_435523 ) ) ( not ( = ?auto_435522 ?auto_435523 ) ) ( ON ?auto_435521 ?auto_435522 ) ( ON ?auto_435520 ?auto_435521 ) ( ON ?auto_435519 ?auto_435520 ) ( CLEAR ?auto_435517 ) ( ON ?auto_435518 ?auto_435519 ) ( CLEAR ?auto_435518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_435512 ?auto_435513 ?auto_435514 ?auto_435515 ?auto_435516 ?auto_435517 ?auto_435518 )
      ( MAKE-11PILE ?auto_435512 ?auto_435513 ?auto_435514 ?auto_435515 ?auto_435516 ?auto_435517 ?auto_435518 ?auto_435519 ?auto_435520 ?auto_435521 ?auto_435522 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435535 - BLOCK
      ?auto_435536 - BLOCK
      ?auto_435537 - BLOCK
      ?auto_435538 - BLOCK
      ?auto_435539 - BLOCK
      ?auto_435540 - BLOCK
      ?auto_435541 - BLOCK
      ?auto_435542 - BLOCK
      ?auto_435543 - BLOCK
      ?auto_435544 - BLOCK
      ?auto_435545 - BLOCK
    )
    :vars
    (
      ?auto_435546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435545 ?auto_435546 ) ( ON-TABLE ?auto_435535 ) ( ON ?auto_435536 ?auto_435535 ) ( ON ?auto_435537 ?auto_435536 ) ( ON ?auto_435538 ?auto_435537 ) ( ON ?auto_435539 ?auto_435538 ) ( not ( = ?auto_435535 ?auto_435536 ) ) ( not ( = ?auto_435535 ?auto_435537 ) ) ( not ( = ?auto_435535 ?auto_435538 ) ) ( not ( = ?auto_435535 ?auto_435539 ) ) ( not ( = ?auto_435535 ?auto_435540 ) ) ( not ( = ?auto_435535 ?auto_435541 ) ) ( not ( = ?auto_435535 ?auto_435542 ) ) ( not ( = ?auto_435535 ?auto_435543 ) ) ( not ( = ?auto_435535 ?auto_435544 ) ) ( not ( = ?auto_435535 ?auto_435545 ) ) ( not ( = ?auto_435535 ?auto_435546 ) ) ( not ( = ?auto_435536 ?auto_435537 ) ) ( not ( = ?auto_435536 ?auto_435538 ) ) ( not ( = ?auto_435536 ?auto_435539 ) ) ( not ( = ?auto_435536 ?auto_435540 ) ) ( not ( = ?auto_435536 ?auto_435541 ) ) ( not ( = ?auto_435536 ?auto_435542 ) ) ( not ( = ?auto_435536 ?auto_435543 ) ) ( not ( = ?auto_435536 ?auto_435544 ) ) ( not ( = ?auto_435536 ?auto_435545 ) ) ( not ( = ?auto_435536 ?auto_435546 ) ) ( not ( = ?auto_435537 ?auto_435538 ) ) ( not ( = ?auto_435537 ?auto_435539 ) ) ( not ( = ?auto_435537 ?auto_435540 ) ) ( not ( = ?auto_435537 ?auto_435541 ) ) ( not ( = ?auto_435537 ?auto_435542 ) ) ( not ( = ?auto_435537 ?auto_435543 ) ) ( not ( = ?auto_435537 ?auto_435544 ) ) ( not ( = ?auto_435537 ?auto_435545 ) ) ( not ( = ?auto_435537 ?auto_435546 ) ) ( not ( = ?auto_435538 ?auto_435539 ) ) ( not ( = ?auto_435538 ?auto_435540 ) ) ( not ( = ?auto_435538 ?auto_435541 ) ) ( not ( = ?auto_435538 ?auto_435542 ) ) ( not ( = ?auto_435538 ?auto_435543 ) ) ( not ( = ?auto_435538 ?auto_435544 ) ) ( not ( = ?auto_435538 ?auto_435545 ) ) ( not ( = ?auto_435538 ?auto_435546 ) ) ( not ( = ?auto_435539 ?auto_435540 ) ) ( not ( = ?auto_435539 ?auto_435541 ) ) ( not ( = ?auto_435539 ?auto_435542 ) ) ( not ( = ?auto_435539 ?auto_435543 ) ) ( not ( = ?auto_435539 ?auto_435544 ) ) ( not ( = ?auto_435539 ?auto_435545 ) ) ( not ( = ?auto_435539 ?auto_435546 ) ) ( not ( = ?auto_435540 ?auto_435541 ) ) ( not ( = ?auto_435540 ?auto_435542 ) ) ( not ( = ?auto_435540 ?auto_435543 ) ) ( not ( = ?auto_435540 ?auto_435544 ) ) ( not ( = ?auto_435540 ?auto_435545 ) ) ( not ( = ?auto_435540 ?auto_435546 ) ) ( not ( = ?auto_435541 ?auto_435542 ) ) ( not ( = ?auto_435541 ?auto_435543 ) ) ( not ( = ?auto_435541 ?auto_435544 ) ) ( not ( = ?auto_435541 ?auto_435545 ) ) ( not ( = ?auto_435541 ?auto_435546 ) ) ( not ( = ?auto_435542 ?auto_435543 ) ) ( not ( = ?auto_435542 ?auto_435544 ) ) ( not ( = ?auto_435542 ?auto_435545 ) ) ( not ( = ?auto_435542 ?auto_435546 ) ) ( not ( = ?auto_435543 ?auto_435544 ) ) ( not ( = ?auto_435543 ?auto_435545 ) ) ( not ( = ?auto_435543 ?auto_435546 ) ) ( not ( = ?auto_435544 ?auto_435545 ) ) ( not ( = ?auto_435544 ?auto_435546 ) ) ( not ( = ?auto_435545 ?auto_435546 ) ) ( ON ?auto_435544 ?auto_435545 ) ( ON ?auto_435543 ?auto_435544 ) ( ON ?auto_435542 ?auto_435543 ) ( ON ?auto_435541 ?auto_435542 ) ( CLEAR ?auto_435539 ) ( ON ?auto_435540 ?auto_435541 ) ( CLEAR ?auto_435540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_435535 ?auto_435536 ?auto_435537 ?auto_435538 ?auto_435539 ?auto_435540 )
      ( MAKE-11PILE ?auto_435535 ?auto_435536 ?auto_435537 ?auto_435538 ?auto_435539 ?auto_435540 ?auto_435541 ?auto_435542 ?auto_435543 ?auto_435544 ?auto_435545 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435558 - BLOCK
      ?auto_435559 - BLOCK
      ?auto_435560 - BLOCK
      ?auto_435561 - BLOCK
      ?auto_435562 - BLOCK
      ?auto_435563 - BLOCK
      ?auto_435564 - BLOCK
      ?auto_435565 - BLOCK
      ?auto_435566 - BLOCK
      ?auto_435567 - BLOCK
      ?auto_435568 - BLOCK
    )
    :vars
    (
      ?auto_435569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435568 ?auto_435569 ) ( ON-TABLE ?auto_435558 ) ( ON ?auto_435559 ?auto_435558 ) ( ON ?auto_435560 ?auto_435559 ) ( ON ?auto_435561 ?auto_435560 ) ( ON ?auto_435562 ?auto_435561 ) ( not ( = ?auto_435558 ?auto_435559 ) ) ( not ( = ?auto_435558 ?auto_435560 ) ) ( not ( = ?auto_435558 ?auto_435561 ) ) ( not ( = ?auto_435558 ?auto_435562 ) ) ( not ( = ?auto_435558 ?auto_435563 ) ) ( not ( = ?auto_435558 ?auto_435564 ) ) ( not ( = ?auto_435558 ?auto_435565 ) ) ( not ( = ?auto_435558 ?auto_435566 ) ) ( not ( = ?auto_435558 ?auto_435567 ) ) ( not ( = ?auto_435558 ?auto_435568 ) ) ( not ( = ?auto_435558 ?auto_435569 ) ) ( not ( = ?auto_435559 ?auto_435560 ) ) ( not ( = ?auto_435559 ?auto_435561 ) ) ( not ( = ?auto_435559 ?auto_435562 ) ) ( not ( = ?auto_435559 ?auto_435563 ) ) ( not ( = ?auto_435559 ?auto_435564 ) ) ( not ( = ?auto_435559 ?auto_435565 ) ) ( not ( = ?auto_435559 ?auto_435566 ) ) ( not ( = ?auto_435559 ?auto_435567 ) ) ( not ( = ?auto_435559 ?auto_435568 ) ) ( not ( = ?auto_435559 ?auto_435569 ) ) ( not ( = ?auto_435560 ?auto_435561 ) ) ( not ( = ?auto_435560 ?auto_435562 ) ) ( not ( = ?auto_435560 ?auto_435563 ) ) ( not ( = ?auto_435560 ?auto_435564 ) ) ( not ( = ?auto_435560 ?auto_435565 ) ) ( not ( = ?auto_435560 ?auto_435566 ) ) ( not ( = ?auto_435560 ?auto_435567 ) ) ( not ( = ?auto_435560 ?auto_435568 ) ) ( not ( = ?auto_435560 ?auto_435569 ) ) ( not ( = ?auto_435561 ?auto_435562 ) ) ( not ( = ?auto_435561 ?auto_435563 ) ) ( not ( = ?auto_435561 ?auto_435564 ) ) ( not ( = ?auto_435561 ?auto_435565 ) ) ( not ( = ?auto_435561 ?auto_435566 ) ) ( not ( = ?auto_435561 ?auto_435567 ) ) ( not ( = ?auto_435561 ?auto_435568 ) ) ( not ( = ?auto_435561 ?auto_435569 ) ) ( not ( = ?auto_435562 ?auto_435563 ) ) ( not ( = ?auto_435562 ?auto_435564 ) ) ( not ( = ?auto_435562 ?auto_435565 ) ) ( not ( = ?auto_435562 ?auto_435566 ) ) ( not ( = ?auto_435562 ?auto_435567 ) ) ( not ( = ?auto_435562 ?auto_435568 ) ) ( not ( = ?auto_435562 ?auto_435569 ) ) ( not ( = ?auto_435563 ?auto_435564 ) ) ( not ( = ?auto_435563 ?auto_435565 ) ) ( not ( = ?auto_435563 ?auto_435566 ) ) ( not ( = ?auto_435563 ?auto_435567 ) ) ( not ( = ?auto_435563 ?auto_435568 ) ) ( not ( = ?auto_435563 ?auto_435569 ) ) ( not ( = ?auto_435564 ?auto_435565 ) ) ( not ( = ?auto_435564 ?auto_435566 ) ) ( not ( = ?auto_435564 ?auto_435567 ) ) ( not ( = ?auto_435564 ?auto_435568 ) ) ( not ( = ?auto_435564 ?auto_435569 ) ) ( not ( = ?auto_435565 ?auto_435566 ) ) ( not ( = ?auto_435565 ?auto_435567 ) ) ( not ( = ?auto_435565 ?auto_435568 ) ) ( not ( = ?auto_435565 ?auto_435569 ) ) ( not ( = ?auto_435566 ?auto_435567 ) ) ( not ( = ?auto_435566 ?auto_435568 ) ) ( not ( = ?auto_435566 ?auto_435569 ) ) ( not ( = ?auto_435567 ?auto_435568 ) ) ( not ( = ?auto_435567 ?auto_435569 ) ) ( not ( = ?auto_435568 ?auto_435569 ) ) ( ON ?auto_435567 ?auto_435568 ) ( ON ?auto_435566 ?auto_435567 ) ( ON ?auto_435565 ?auto_435566 ) ( ON ?auto_435564 ?auto_435565 ) ( CLEAR ?auto_435562 ) ( ON ?auto_435563 ?auto_435564 ) ( CLEAR ?auto_435563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_435558 ?auto_435559 ?auto_435560 ?auto_435561 ?auto_435562 ?auto_435563 )
      ( MAKE-11PILE ?auto_435558 ?auto_435559 ?auto_435560 ?auto_435561 ?auto_435562 ?auto_435563 ?auto_435564 ?auto_435565 ?auto_435566 ?auto_435567 ?auto_435568 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435581 - BLOCK
      ?auto_435582 - BLOCK
      ?auto_435583 - BLOCK
      ?auto_435584 - BLOCK
      ?auto_435585 - BLOCK
      ?auto_435586 - BLOCK
      ?auto_435587 - BLOCK
      ?auto_435588 - BLOCK
      ?auto_435589 - BLOCK
      ?auto_435590 - BLOCK
      ?auto_435591 - BLOCK
    )
    :vars
    (
      ?auto_435592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435591 ?auto_435592 ) ( ON-TABLE ?auto_435581 ) ( ON ?auto_435582 ?auto_435581 ) ( ON ?auto_435583 ?auto_435582 ) ( ON ?auto_435584 ?auto_435583 ) ( not ( = ?auto_435581 ?auto_435582 ) ) ( not ( = ?auto_435581 ?auto_435583 ) ) ( not ( = ?auto_435581 ?auto_435584 ) ) ( not ( = ?auto_435581 ?auto_435585 ) ) ( not ( = ?auto_435581 ?auto_435586 ) ) ( not ( = ?auto_435581 ?auto_435587 ) ) ( not ( = ?auto_435581 ?auto_435588 ) ) ( not ( = ?auto_435581 ?auto_435589 ) ) ( not ( = ?auto_435581 ?auto_435590 ) ) ( not ( = ?auto_435581 ?auto_435591 ) ) ( not ( = ?auto_435581 ?auto_435592 ) ) ( not ( = ?auto_435582 ?auto_435583 ) ) ( not ( = ?auto_435582 ?auto_435584 ) ) ( not ( = ?auto_435582 ?auto_435585 ) ) ( not ( = ?auto_435582 ?auto_435586 ) ) ( not ( = ?auto_435582 ?auto_435587 ) ) ( not ( = ?auto_435582 ?auto_435588 ) ) ( not ( = ?auto_435582 ?auto_435589 ) ) ( not ( = ?auto_435582 ?auto_435590 ) ) ( not ( = ?auto_435582 ?auto_435591 ) ) ( not ( = ?auto_435582 ?auto_435592 ) ) ( not ( = ?auto_435583 ?auto_435584 ) ) ( not ( = ?auto_435583 ?auto_435585 ) ) ( not ( = ?auto_435583 ?auto_435586 ) ) ( not ( = ?auto_435583 ?auto_435587 ) ) ( not ( = ?auto_435583 ?auto_435588 ) ) ( not ( = ?auto_435583 ?auto_435589 ) ) ( not ( = ?auto_435583 ?auto_435590 ) ) ( not ( = ?auto_435583 ?auto_435591 ) ) ( not ( = ?auto_435583 ?auto_435592 ) ) ( not ( = ?auto_435584 ?auto_435585 ) ) ( not ( = ?auto_435584 ?auto_435586 ) ) ( not ( = ?auto_435584 ?auto_435587 ) ) ( not ( = ?auto_435584 ?auto_435588 ) ) ( not ( = ?auto_435584 ?auto_435589 ) ) ( not ( = ?auto_435584 ?auto_435590 ) ) ( not ( = ?auto_435584 ?auto_435591 ) ) ( not ( = ?auto_435584 ?auto_435592 ) ) ( not ( = ?auto_435585 ?auto_435586 ) ) ( not ( = ?auto_435585 ?auto_435587 ) ) ( not ( = ?auto_435585 ?auto_435588 ) ) ( not ( = ?auto_435585 ?auto_435589 ) ) ( not ( = ?auto_435585 ?auto_435590 ) ) ( not ( = ?auto_435585 ?auto_435591 ) ) ( not ( = ?auto_435585 ?auto_435592 ) ) ( not ( = ?auto_435586 ?auto_435587 ) ) ( not ( = ?auto_435586 ?auto_435588 ) ) ( not ( = ?auto_435586 ?auto_435589 ) ) ( not ( = ?auto_435586 ?auto_435590 ) ) ( not ( = ?auto_435586 ?auto_435591 ) ) ( not ( = ?auto_435586 ?auto_435592 ) ) ( not ( = ?auto_435587 ?auto_435588 ) ) ( not ( = ?auto_435587 ?auto_435589 ) ) ( not ( = ?auto_435587 ?auto_435590 ) ) ( not ( = ?auto_435587 ?auto_435591 ) ) ( not ( = ?auto_435587 ?auto_435592 ) ) ( not ( = ?auto_435588 ?auto_435589 ) ) ( not ( = ?auto_435588 ?auto_435590 ) ) ( not ( = ?auto_435588 ?auto_435591 ) ) ( not ( = ?auto_435588 ?auto_435592 ) ) ( not ( = ?auto_435589 ?auto_435590 ) ) ( not ( = ?auto_435589 ?auto_435591 ) ) ( not ( = ?auto_435589 ?auto_435592 ) ) ( not ( = ?auto_435590 ?auto_435591 ) ) ( not ( = ?auto_435590 ?auto_435592 ) ) ( not ( = ?auto_435591 ?auto_435592 ) ) ( ON ?auto_435590 ?auto_435591 ) ( ON ?auto_435589 ?auto_435590 ) ( ON ?auto_435588 ?auto_435589 ) ( ON ?auto_435587 ?auto_435588 ) ( ON ?auto_435586 ?auto_435587 ) ( CLEAR ?auto_435584 ) ( ON ?auto_435585 ?auto_435586 ) ( CLEAR ?auto_435585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_435581 ?auto_435582 ?auto_435583 ?auto_435584 ?auto_435585 )
      ( MAKE-11PILE ?auto_435581 ?auto_435582 ?auto_435583 ?auto_435584 ?auto_435585 ?auto_435586 ?auto_435587 ?auto_435588 ?auto_435589 ?auto_435590 ?auto_435591 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435604 - BLOCK
      ?auto_435605 - BLOCK
      ?auto_435606 - BLOCK
      ?auto_435607 - BLOCK
      ?auto_435608 - BLOCK
      ?auto_435609 - BLOCK
      ?auto_435610 - BLOCK
      ?auto_435611 - BLOCK
      ?auto_435612 - BLOCK
      ?auto_435613 - BLOCK
      ?auto_435614 - BLOCK
    )
    :vars
    (
      ?auto_435615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435614 ?auto_435615 ) ( ON-TABLE ?auto_435604 ) ( ON ?auto_435605 ?auto_435604 ) ( ON ?auto_435606 ?auto_435605 ) ( ON ?auto_435607 ?auto_435606 ) ( not ( = ?auto_435604 ?auto_435605 ) ) ( not ( = ?auto_435604 ?auto_435606 ) ) ( not ( = ?auto_435604 ?auto_435607 ) ) ( not ( = ?auto_435604 ?auto_435608 ) ) ( not ( = ?auto_435604 ?auto_435609 ) ) ( not ( = ?auto_435604 ?auto_435610 ) ) ( not ( = ?auto_435604 ?auto_435611 ) ) ( not ( = ?auto_435604 ?auto_435612 ) ) ( not ( = ?auto_435604 ?auto_435613 ) ) ( not ( = ?auto_435604 ?auto_435614 ) ) ( not ( = ?auto_435604 ?auto_435615 ) ) ( not ( = ?auto_435605 ?auto_435606 ) ) ( not ( = ?auto_435605 ?auto_435607 ) ) ( not ( = ?auto_435605 ?auto_435608 ) ) ( not ( = ?auto_435605 ?auto_435609 ) ) ( not ( = ?auto_435605 ?auto_435610 ) ) ( not ( = ?auto_435605 ?auto_435611 ) ) ( not ( = ?auto_435605 ?auto_435612 ) ) ( not ( = ?auto_435605 ?auto_435613 ) ) ( not ( = ?auto_435605 ?auto_435614 ) ) ( not ( = ?auto_435605 ?auto_435615 ) ) ( not ( = ?auto_435606 ?auto_435607 ) ) ( not ( = ?auto_435606 ?auto_435608 ) ) ( not ( = ?auto_435606 ?auto_435609 ) ) ( not ( = ?auto_435606 ?auto_435610 ) ) ( not ( = ?auto_435606 ?auto_435611 ) ) ( not ( = ?auto_435606 ?auto_435612 ) ) ( not ( = ?auto_435606 ?auto_435613 ) ) ( not ( = ?auto_435606 ?auto_435614 ) ) ( not ( = ?auto_435606 ?auto_435615 ) ) ( not ( = ?auto_435607 ?auto_435608 ) ) ( not ( = ?auto_435607 ?auto_435609 ) ) ( not ( = ?auto_435607 ?auto_435610 ) ) ( not ( = ?auto_435607 ?auto_435611 ) ) ( not ( = ?auto_435607 ?auto_435612 ) ) ( not ( = ?auto_435607 ?auto_435613 ) ) ( not ( = ?auto_435607 ?auto_435614 ) ) ( not ( = ?auto_435607 ?auto_435615 ) ) ( not ( = ?auto_435608 ?auto_435609 ) ) ( not ( = ?auto_435608 ?auto_435610 ) ) ( not ( = ?auto_435608 ?auto_435611 ) ) ( not ( = ?auto_435608 ?auto_435612 ) ) ( not ( = ?auto_435608 ?auto_435613 ) ) ( not ( = ?auto_435608 ?auto_435614 ) ) ( not ( = ?auto_435608 ?auto_435615 ) ) ( not ( = ?auto_435609 ?auto_435610 ) ) ( not ( = ?auto_435609 ?auto_435611 ) ) ( not ( = ?auto_435609 ?auto_435612 ) ) ( not ( = ?auto_435609 ?auto_435613 ) ) ( not ( = ?auto_435609 ?auto_435614 ) ) ( not ( = ?auto_435609 ?auto_435615 ) ) ( not ( = ?auto_435610 ?auto_435611 ) ) ( not ( = ?auto_435610 ?auto_435612 ) ) ( not ( = ?auto_435610 ?auto_435613 ) ) ( not ( = ?auto_435610 ?auto_435614 ) ) ( not ( = ?auto_435610 ?auto_435615 ) ) ( not ( = ?auto_435611 ?auto_435612 ) ) ( not ( = ?auto_435611 ?auto_435613 ) ) ( not ( = ?auto_435611 ?auto_435614 ) ) ( not ( = ?auto_435611 ?auto_435615 ) ) ( not ( = ?auto_435612 ?auto_435613 ) ) ( not ( = ?auto_435612 ?auto_435614 ) ) ( not ( = ?auto_435612 ?auto_435615 ) ) ( not ( = ?auto_435613 ?auto_435614 ) ) ( not ( = ?auto_435613 ?auto_435615 ) ) ( not ( = ?auto_435614 ?auto_435615 ) ) ( ON ?auto_435613 ?auto_435614 ) ( ON ?auto_435612 ?auto_435613 ) ( ON ?auto_435611 ?auto_435612 ) ( ON ?auto_435610 ?auto_435611 ) ( ON ?auto_435609 ?auto_435610 ) ( CLEAR ?auto_435607 ) ( ON ?auto_435608 ?auto_435609 ) ( CLEAR ?auto_435608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_435604 ?auto_435605 ?auto_435606 ?auto_435607 ?auto_435608 )
      ( MAKE-11PILE ?auto_435604 ?auto_435605 ?auto_435606 ?auto_435607 ?auto_435608 ?auto_435609 ?auto_435610 ?auto_435611 ?auto_435612 ?auto_435613 ?auto_435614 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435627 - BLOCK
      ?auto_435628 - BLOCK
      ?auto_435629 - BLOCK
      ?auto_435630 - BLOCK
      ?auto_435631 - BLOCK
      ?auto_435632 - BLOCK
      ?auto_435633 - BLOCK
      ?auto_435634 - BLOCK
      ?auto_435635 - BLOCK
      ?auto_435636 - BLOCK
      ?auto_435637 - BLOCK
    )
    :vars
    (
      ?auto_435638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435637 ?auto_435638 ) ( ON-TABLE ?auto_435627 ) ( ON ?auto_435628 ?auto_435627 ) ( ON ?auto_435629 ?auto_435628 ) ( not ( = ?auto_435627 ?auto_435628 ) ) ( not ( = ?auto_435627 ?auto_435629 ) ) ( not ( = ?auto_435627 ?auto_435630 ) ) ( not ( = ?auto_435627 ?auto_435631 ) ) ( not ( = ?auto_435627 ?auto_435632 ) ) ( not ( = ?auto_435627 ?auto_435633 ) ) ( not ( = ?auto_435627 ?auto_435634 ) ) ( not ( = ?auto_435627 ?auto_435635 ) ) ( not ( = ?auto_435627 ?auto_435636 ) ) ( not ( = ?auto_435627 ?auto_435637 ) ) ( not ( = ?auto_435627 ?auto_435638 ) ) ( not ( = ?auto_435628 ?auto_435629 ) ) ( not ( = ?auto_435628 ?auto_435630 ) ) ( not ( = ?auto_435628 ?auto_435631 ) ) ( not ( = ?auto_435628 ?auto_435632 ) ) ( not ( = ?auto_435628 ?auto_435633 ) ) ( not ( = ?auto_435628 ?auto_435634 ) ) ( not ( = ?auto_435628 ?auto_435635 ) ) ( not ( = ?auto_435628 ?auto_435636 ) ) ( not ( = ?auto_435628 ?auto_435637 ) ) ( not ( = ?auto_435628 ?auto_435638 ) ) ( not ( = ?auto_435629 ?auto_435630 ) ) ( not ( = ?auto_435629 ?auto_435631 ) ) ( not ( = ?auto_435629 ?auto_435632 ) ) ( not ( = ?auto_435629 ?auto_435633 ) ) ( not ( = ?auto_435629 ?auto_435634 ) ) ( not ( = ?auto_435629 ?auto_435635 ) ) ( not ( = ?auto_435629 ?auto_435636 ) ) ( not ( = ?auto_435629 ?auto_435637 ) ) ( not ( = ?auto_435629 ?auto_435638 ) ) ( not ( = ?auto_435630 ?auto_435631 ) ) ( not ( = ?auto_435630 ?auto_435632 ) ) ( not ( = ?auto_435630 ?auto_435633 ) ) ( not ( = ?auto_435630 ?auto_435634 ) ) ( not ( = ?auto_435630 ?auto_435635 ) ) ( not ( = ?auto_435630 ?auto_435636 ) ) ( not ( = ?auto_435630 ?auto_435637 ) ) ( not ( = ?auto_435630 ?auto_435638 ) ) ( not ( = ?auto_435631 ?auto_435632 ) ) ( not ( = ?auto_435631 ?auto_435633 ) ) ( not ( = ?auto_435631 ?auto_435634 ) ) ( not ( = ?auto_435631 ?auto_435635 ) ) ( not ( = ?auto_435631 ?auto_435636 ) ) ( not ( = ?auto_435631 ?auto_435637 ) ) ( not ( = ?auto_435631 ?auto_435638 ) ) ( not ( = ?auto_435632 ?auto_435633 ) ) ( not ( = ?auto_435632 ?auto_435634 ) ) ( not ( = ?auto_435632 ?auto_435635 ) ) ( not ( = ?auto_435632 ?auto_435636 ) ) ( not ( = ?auto_435632 ?auto_435637 ) ) ( not ( = ?auto_435632 ?auto_435638 ) ) ( not ( = ?auto_435633 ?auto_435634 ) ) ( not ( = ?auto_435633 ?auto_435635 ) ) ( not ( = ?auto_435633 ?auto_435636 ) ) ( not ( = ?auto_435633 ?auto_435637 ) ) ( not ( = ?auto_435633 ?auto_435638 ) ) ( not ( = ?auto_435634 ?auto_435635 ) ) ( not ( = ?auto_435634 ?auto_435636 ) ) ( not ( = ?auto_435634 ?auto_435637 ) ) ( not ( = ?auto_435634 ?auto_435638 ) ) ( not ( = ?auto_435635 ?auto_435636 ) ) ( not ( = ?auto_435635 ?auto_435637 ) ) ( not ( = ?auto_435635 ?auto_435638 ) ) ( not ( = ?auto_435636 ?auto_435637 ) ) ( not ( = ?auto_435636 ?auto_435638 ) ) ( not ( = ?auto_435637 ?auto_435638 ) ) ( ON ?auto_435636 ?auto_435637 ) ( ON ?auto_435635 ?auto_435636 ) ( ON ?auto_435634 ?auto_435635 ) ( ON ?auto_435633 ?auto_435634 ) ( ON ?auto_435632 ?auto_435633 ) ( ON ?auto_435631 ?auto_435632 ) ( CLEAR ?auto_435629 ) ( ON ?auto_435630 ?auto_435631 ) ( CLEAR ?auto_435630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_435627 ?auto_435628 ?auto_435629 ?auto_435630 )
      ( MAKE-11PILE ?auto_435627 ?auto_435628 ?auto_435629 ?auto_435630 ?auto_435631 ?auto_435632 ?auto_435633 ?auto_435634 ?auto_435635 ?auto_435636 ?auto_435637 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435650 - BLOCK
      ?auto_435651 - BLOCK
      ?auto_435652 - BLOCK
      ?auto_435653 - BLOCK
      ?auto_435654 - BLOCK
      ?auto_435655 - BLOCK
      ?auto_435656 - BLOCK
      ?auto_435657 - BLOCK
      ?auto_435658 - BLOCK
      ?auto_435659 - BLOCK
      ?auto_435660 - BLOCK
    )
    :vars
    (
      ?auto_435661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435660 ?auto_435661 ) ( ON-TABLE ?auto_435650 ) ( ON ?auto_435651 ?auto_435650 ) ( ON ?auto_435652 ?auto_435651 ) ( not ( = ?auto_435650 ?auto_435651 ) ) ( not ( = ?auto_435650 ?auto_435652 ) ) ( not ( = ?auto_435650 ?auto_435653 ) ) ( not ( = ?auto_435650 ?auto_435654 ) ) ( not ( = ?auto_435650 ?auto_435655 ) ) ( not ( = ?auto_435650 ?auto_435656 ) ) ( not ( = ?auto_435650 ?auto_435657 ) ) ( not ( = ?auto_435650 ?auto_435658 ) ) ( not ( = ?auto_435650 ?auto_435659 ) ) ( not ( = ?auto_435650 ?auto_435660 ) ) ( not ( = ?auto_435650 ?auto_435661 ) ) ( not ( = ?auto_435651 ?auto_435652 ) ) ( not ( = ?auto_435651 ?auto_435653 ) ) ( not ( = ?auto_435651 ?auto_435654 ) ) ( not ( = ?auto_435651 ?auto_435655 ) ) ( not ( = ?auto_435651 ?auto_435656 ) ) ( not ( = ?auto_435651 ?auto_435657 ) ) ( not ( = ?auto_435651 ?auto_435658 ) ) ( not ( = ?auto_435651 ?auto_435659 ) ) ( not ( = ?auto_435651 ?auto_435660 ) ) ( not ( = ?auto_435651 ?auto_435661 ) ) ( not ( = ?auto_435652 ?auto_435653 ) ) ( not ( = ?auto_435652 ?auto_435654 ) ) ( not ( = ?auto_435652 ?auto_435655 ) ) ( not ( = ?auto_435652 ?auto_435656 ) ) ( not ( = ?auto_435652 ?auto_435657 ) ) ( not ( = ?auto_435652 ?auto_435658 ) ) ( not ( = ?auto_435652 ?auto_435659 ) ) ( not ( = ?auto_435652 ?auto_435660 ) ) ( not ( = ?auto_435652 ?auto_435661 ) ) ( not ( = ?auto_435653 ?auto_435654 ) ) ( not ( = ?auto_435653 ?auto_435655 ) ) ( not ( = ?auto_435653 ?auto_435656 ) ) ( not ( = ?auto_435653 ?auto_435657 ) ) ( not ( = ?auto_435653 ?auto_435658 ) ) ( not ( = ?auto_435653 ?auto_435659 ) ) ( not ( = ?auto_435653 ?auto_435660 ) ) ( not ( = ?auto_435653 ?auto_435661 ) ) ( not ( = ?auto_435654 ?auto_435655 ) ) ( not ( = ?auto_435654 ?auto_435656 ) ) ( not ( = ?auto_435654 ?auto_435657 ) ) ( not ( = ?auto_435654 ?auto_435658 ) ) ( not ( = ?auto_435654 ?auto_435659 ) ) ( not ( = ?auto_435654 ?auto_435660 ) ) ( not ( = ?auto_435654 ?auto_435661 ) ) ( not ( = ?auto_435655 ?auto_435656 ) ) ( not ( = ?auto_435655 ?auto_435657 ) ) ( not ( = ?auto_435655 ?auto_435658 ) ) ( not ( = ?auto_435655 ?auto_435659 ) ) ( not ( = ?auto_435655 ?auto_435660 ) ) ( not ( = ?auto_435655 ?auto_435661 ) ) ( not ( = ?auto_435656 ?auto_435657 ) ) ( not ( = ?auto_435656 ?auto_435658 ) ) ( not ( = ?auto_435656 ?auto_435659 ) ) ( not ( = ?auto_435656 ?auto_435660 ) ) ( not ( = ?auto_435656 ?auto_435661 ) ) ( not ( = ?auto_435657 ?auto_435658 ) ) ( not ( = ?auto_435657 ?auto_435659 ) ) ( not ( = ?auto_435657 ?auto_435660 ) ) ( not ( = ?auto_435657 ?auto_435661 ) ) ( not ( = ?auto_435658 ?auto_435659 ) ) ( not ( = ?auto_435658 ?auto_435660 ) ) ( not ( = ?auto_435658 ?auto_435661 ) ) ( not ( = ?auto_435659 ?auto_435660 ) ) ( not ( = ?auto_435659 ?auto_435661 ) ) ( not ( = ?auto_435660 ?auto_435661 ) ) ( ON ?auto_435659 ?auto_435660 ) ( ON ?auto_435658 ?auto_435659 ) ( ON ?auto_435657 ?auto_435658 ) ( ON ?auto_435656 ?auto_435657 ) ( ON ?auto_435655 ?auto_435656 ) ( ON ?auto_435654 ?auto_435655 ) ( CLEAR ?auto_435652 ) ( ON ?auto_435653 ?auto_435654 ) ( CLEAR ?auto_435653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_435650 ?auto_435651 ?auto_435652 ?auto_435653 )
      ( MAKE-11PILE ?auto_435650 ?auto_435651 ?auto_435652 ?auto_435653 ?auto_435654 ?auto_435655 ?auto_435656 ?auto_435657 ?auto_435658 ?auto_435659 ?auto_435660 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435673 - BLOCK
      ?auto_435674 - BLOCK
      ?auto_435675 - BLOCK
      ?auto_435676 - BLOCK
      ?auto_435677 - BLOCK
      ?auto_435678 - BLOCK
      ?auto_435679 - BLOCK
      ?auto_435680 - BLOCK
      ?auto_435681 - BLOCK
      ?auto_435682 - BLOCK
      ?auto_435683 - BLOCK
    )
    :vars
    (
      ?auto_435684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435683 ?auto_435684 ) ( ON-TABLE ?auto_435673 ) ( ON ?auto_435674 ?auto_435673 ) ( not ( = ?auto_435673 ?auto_435674 ) ) ( not ( = ?auto_435673 ?auto_435675 ) ) ( not ( = ?auto_435673 ?auto_435676 ) ) ( not ( = ?auto_435673 ?auto_435677 ) ) ( not ( = ?auto_435673 ?auto_435678 ) ) ( not ( = ?auto_435673 ?auto_435679 ) ) ( not ( = ?auto_435673 ?auto_435680 ) ) ( not ( = ?auto_435673 ?auto_435681 ) ) ( not ( = ?auto_435673 ?auto_435682 ) ) ( not ( = ?auto_435673 ?auto_435683 ) ) ( not ( = ?auto_435673 ?auto_435684 ) ) ( not ( = ?auto_435674 ?auto_435675 ) ) ( not ( = ?auto_435674 ?auto_435676 ) ) ( not ( = ?auto_435674 ?auto_435677 ) ) ( not ( = ?auto_435674 ?auto_435678 ) ) ( not ( = ?auto_435674 ?auto_435679 ) ) ( not ( = ?auto_435674 ?auto_435680 ) ) ( not ( = ?auto_435674 ?auto_435681 ) ) ( not ( = ?auto_435674 ?auto_435682 ) ) ( not ( = ?auto_435674 ?auto_435683 ) ) ( not ( = ?auto_435674 ?auto_435684 ) ) ( not ( = ?auto_435675 ?auto_435676 ) ) ( not ( = ?auto_435675 ?auto_435677 ) ) ( not ( = ?auto_435675 ?auto_435678 ) ) ( not ( = ?auto_435675 ?auto_435679 ) ) ( not ( = ?auto_435675 ?auto_435680 ) ) ( not ( = ?auto_435675 ?auto_435681 ) ) ( not ( = ?auto_435675 ?auto_435682 ) ) ( not ( = ?auto_435675 ?auto_435683 ) ) ( not ( = ?auto_435675 ?auto_435684 ) ) ( not ( = ?auto_435676 ?auto_435677 ) ) ( not ( = ?auto_435676 ?auto_435678 ) ) ( not ( = ?auto_435676 ?auto_435679 ) ) ( not ( = ?auto_435676 ?auto_435680 ) ) ( not ( = ?auto_435676 ?auto_435681 ) ) ( not ( = ?auto_435676 ?auto_435682 ) ) ( not ( = ?auto_435676 ?auto_435683 ) ) ( not ( = ?auto_435676 ?auto_435684 ) ) ( not ( = ?auto_435677 ?auto_435678 ) ) ( not ( = ?auto_435677 ?auto_435679 ) ) ( not ( = ?auto_435677 ?auto_435680 ) ) ( not ( = ?auto_435677 ?auto_435681 ) ) ( not ( = ?auto_435677 ?auto_435682 ) ) ( not ( = ?auto_435677 ?auto_435683 ) ) ( not ( = ?auto_435677 ?auto_435684 ) ) ( not ( = ?auto_435678 ?auto_435679 ) ) ( not ( = ?auto_435678 ?auto_435680 ) ) ( not ( = ?auto_435678 ?auto_435681 ) ) ( not ( = ?auto_435678 ?auto_435682 ) ) ( not ( = ?auto_435678 ?auto_435683 ) ) ( not ( = ?auto_435678 ?auto_435684 ) ) ( not ( = ?auto_435679 ?auto_435680 ) ) ( not ( = ?auto_435679 ?auto_435681 ) ) ( not ( = ?auto_435679 ?auto_435682 ) ) ( not ( = ?auto_435679 ?auto_435683 ) ) ( not ( = ?auto_435679 ?auto_435684 ) ) ( not ( = ?auto_435680 ?auto_435681 ) ) ( not ( = ?auto_435680 ?auto_435682 ) ) ( not ( = ?auto_435680 ?auto_435683 ) ) ( not ( = ?auto_435680 ?auto_435684 ) ) ( not ( = ?auto_435681 ?auto_435682 ) ) ( not ( = ?auto_435681 ?auto_435683 ) ) ( not ( = ?auto_435681 ?auto_435684 ) ) ( not ( = ?auto_435682 ?auto_435683 ) ) ( not ( = ?auto_435682 ?auto_435684 ) ) ( not ( = ?auto_435683 ?auto_435684 ) ) ( ON ?auto_435682 ?auto_435683 ) ( ON ?auto_435681 ?auto_435682 ) ( ON ?auto_435680 ?auto_435681 ) ( ON ?auto_435679 ?auto_435680 ) ( ON ?auto_435678 ?auto_435679 ) ( ON ?auto_435677 ?auto_435678 ) ( ON ?auto_435676 ?auto_435677 ) ( CLEAR ?auto_435674 ) ( ON ?auto_435675 ?auto_435676 ) ( CLEAR ?auto_435675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_435673 ?auto_435674 ?auto_435675 )
      ( MAKE-11PILE ?auto_435673 ?auto_435674 ?auto_435675 ?auto_435676 ?auto_435677 ?auto_435678 ?auto_435679 ?auto_435680 ?auto_435681 ?auto_435682 ?auto_435683 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435696 - BLOCK
      ?auto_435697 - BLOCK
      ?auto_435698 - BLOCK
      ?auto_435699 - BLOCK
      ?auto_435700 - BLOCK
      ?auto_435701 - BLOCK
      ?auto_435702 - BLOCK
      ?auto_435703 - BLOCK
      ?auto_435704 - BLOCK
      ?auto_435705 - BLOCK
      ?auto_435706 - BLOCK
    )
    :vars
    (
      ?auto_435707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435706 ?auto_435707 ) ( ON-TABLE ?auto_435696 ) ( ON ?auto_435697 ?auto_435696 ) ( not ( = ?auto_435696 ?auto_435697 ) ) ( not ( = ?auto_435696 ?auto_435698 ) ) ( not ( = ?auto_435696 ?auto_435699 ) ) ( not ( = ?auto_435696 ?auto_435700 ) ) ( not ( = ?auto_435696 ?auto_435701 ) ) ( not ( = ?auto_435696 ?auto_435702 ) ) ( not ( = ?auto_435696 ?auto_435703 ) ) ( not ( = ?auto_435696 ?auto_435704 ) ) ( not ( = ?auto_435696 ?auto_435705 ) ) ( not ( = ?auto_435696 ?auto_435706 ) ) ( not ( = ?auto_435696 ?auto_435707 ) ) ( not ( = ?auto_435697 ?auto_435698 ) ) ( not ( = ?auto_435697 ?auto_435699 ) ) ( not ( = ?auto_435697 ?auto_435700 ) ) ( not ( = ?auto_435697 ?auto_435701 ) ) ( not ( = ?auto_435697 ?auto_435702 ) ) ( not ( = ?auto_435697 ?auto_435703 ) ) ( not ( = ?auto_435697 ?auto_435704 ) ) ( not ( = ?auto_435697 ?auto_435705 ) ) ( not ( = ?auto_435697 ?auto_435706 ) ) ( not ( = ?auto_435697 ?auto_435707 ) ) ( not ( = ?auto_435698 ?auto_435699 ) ) ( not ( = ?auto_435698 ?auto_435700 ) ) ( not ( = ?auto_435698 ?auto_435701 ) ) ( not ( = ?auto_435698 ?auto_435702 ) ) ( not ( = ?auto_435698 ?auto_435703 ) ) ( not ( = ?auto_435698 ?auto_435704 ) ) ( not ( = ?auto_435698 ?auto_435705 ) ) ( not ( = ?auto_435698 ?auto_435706 ) ) ( not ( = ?auto_435698 ?auto_435707 ) ) ( not ( = ?auto_435699 ?auto_435700 ) ) ( not ( = ?auto_435699 ?auto_435701 ) ) ( not ( = ?auto_435699 ?auto_435702 ) ) ( not ( = ?auto_435699 ?auto_435703 ) ) ( not ( = ?auto_435699 ?auto_435704 ) ) ( not ( = ?auto_435699 ?auto_435705 ) ) ( not ( = ?auto_435699 ?auto_435706 ) ) ( not ( = ?auto_435699 ?auto_435707 ) ) ( not ( = ?auto_435700 ?auto_435701 ) ) ( not ( = ?auto_435700 ?auto_435702 ) ) ( not ( = ?auto_435700 ?auto_435703 ) ) ( not ( = ?auto_435700 ?auto_435704 ) ) ( not ( = ?auto_435700 ?auto_435705 ) ) ( not ( = ?auto_435700 ?auto_435706 ) ) ( not ( = ?auto_435700 ?auto_435707 ) ) ( not ( = ?auto_435701 ?auto_435702 ) ) ( not ( = ?auto_435701 ?auto_435703 ) ) ( not ( = ?auto_435701 ?auto_435704 ) ) ( not ( = ?auto_435701 ?auto_435705 ) ) ( not ( = ?auto_435701 ?auto_435706 ) ) ( not ( = ?auto_435701 ?auto_435707 ) ) ( not ( = ?auto_435702 ?auto_435703 ) ) ( not ( = ?auto_435702 ?auto_435704 ) ) ( not ( = ?auto_435702 ?auto_435705 ) ) ( not ( = ?auto_435702 ?auto_435706 ) ) ( not ( = ?auto_435702 ?auto_435707 ) ) ( not ( = ?auto_435703 ?auto_435704 ) ) ( not ( = ?auto_435703 ?auto_435705 ) ) ( not ( = ?auto_435703 ?auto_435706 ) ) ( not ( = ?auto_435703 ?auto_435707 ) ) ( not ( = ?auto_435704 ?auto_435705 ) ) ( not ( = ?auto_435704 ?auto_435706 ) ) ( not ( = ?auto_435704 ?auto_435707 ) ) ( not ( = ?auto_435705 ?auto_435706 ) ) ( not ( = ?auto_435705 ?auto_435707 ) ) ( not ( = ?auto_435706 ?auto_435707 ) ) ( ON ?auto_435705 ?auto_435706 ) ( ON ?auto_435704 ?auto_435705 ) ( ON ?auto_435703 ?auto_435704 ) ( ON ?auto_435702 ?auto_435703 ) ( ON ?auto_435701 ?auto_435702 ) ( ON ?auto_435700 ?auto_435701 ) ( ON ?auto_435699 ?auto_435700 ) ( CLEAR ?auto_435697 ) ( ON ?auto_435698 ?auto_435699 ) ( CLEAR ?auto_435698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_435696 ?auto_435697 ?auto_435698 )
      ( MAKE-11PILE ?auto_435696 ?auto_435697 ?auto_435698 ?auto_435699 ?auto_435700 ?auto_435701 ?auto_435702 ?auto_435703 ?auto_435704 ?auto_435705 ?auto_435706 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435719 - BLOCK
      ?auto_435720 - BLOCK
      ?auto_435721 - BLOCK
      ?auto_435722 - BLOCK
      ?auto_435723 - BLOCK
      ?auto_435724 - BLOCK
      ?auto_435725 - BLOCK
      ?auto_435726 - BLOCK
      ?auto_435727 - BLOCK
      ?auto_435728 - BLOCK
      ?auto_435729 - BLOCK
    )
    :vars
    (
      ?auto_435730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435729 ?auto_435730 ) ( ON-TABLE ?auto_435719 ) ( not ( = ?auto_435719 ?auto_435720 ) ) ( not ( = ?auto_435719 ?auto_435721 ) ) ( not ( = ?auto_435719 ?auto_435722 ) ) ( not ( = ?auto_435719 ?auto_435723 ) ) ( not ( = ?auto_435719 ?auto_435724 ) ) ( not ( = ?auto_435719 ?auto_435725 ) ) ( not ( = ?auto_435719 ?auto_435726 ) ) ( not ( = ?auto_435719 ?auto_435727 ) ) ( not ( = ?auto_435719 ?auto_435728 ) ) ( not ( = ?auto_435719 ?auto_435729 ) ) ( not ( = ?auto_435719 ?auto_435730 ) ) ( not ( = ?auto_435720 ?auto_435721 ) ) ( not ( = ?auto_435720 ?auto_435722 ) ) ( not ( = ?auto_435720 ?auto_435723 ) ) ( not ( = ?auto_435720 ?auto_435724 ) ) ( not ( = ?auto_435720 ?auto_435725 ) ) ( not ( = ?auto_435720 ?auto_435726 ) ) ( not ( = ?auto_435720 ?auto_435727 ) ) ( not ( = ?auto_435720 ?auto_435728 ) ) ( not ( = ?auto_435720 ?auto_435729 ) ) ( not ( = ?auto_435720 ?auto_435730 ) ) ( not ( = ?auto_435721 ?auto_435722 ) ) ( not ( = ?auto_435721 ?auto_435723 ) ) ( not ( = ?auto_435721 ?auto_435724 ) ) ( not ( = ?auto_435721 ?auto_435725 ) ) ( not ( = ?auto_435721 ?auto_435726 ) ) ( not ( = ?auto_435721 ?auto_435727 ) ) ( not ( = ?auto_435721 ?auto_435728 ) ) ( not ( = ?auto_435721 ?auto_435729 ) ) ( not ( = ?auto_435721 ?auto_435730 ) ) ( not ( = ?auto_435722 ?auto_435723 ) ) ( not ( = ?auto_435722 ?auto_435724 ) ) ( not ( = ?auto_435722 ?auto_435725 ) ) ( not ( = ?auto_435722 ?auto_435726 ) ) ( not ( = ?auto_435722 ?auto_435727 ) ) ( not ( = ?auto_435722 ?auto_435728 ) ) ( not ( = ?auto_435722 ?auto_435729 ) ) ( not ( = ?auto_435722 ?auto_435730 ) ) ( not ( = ?auto_435723 ?auto_435724 ) ) ( not ( = ?auto_435723 ?auto_435725 ) ) ( not ( = ?auto_435723 ?auto_435726 ) ) ( not ( = ?auto_435723 ?auto_435727 ) ) ( not ( = ?auto_435723 ?auto_435728 ) ) ( not ( = ?auto_435723 ?auto_435729 ) ) ( not ( = ?auto_435723 ?auto_435730 ) ) ( not ( = ?auto_435724 ?auto_435725 ) ) ( not ( = ?auto_435724 ?auto_435726 ) ) ( not ( = ?auto_435724 ?auto_435727 ) ) ( not ( = ?auto_435724 ?auto_435728 ) ) ( not ( = ?auto_435724 ?auto_435729 ) ) ( not ( = ?auto_435724 ?auto_435730 ) ) ( not ( = ?auto_435725 ?auto_435726 ) ) ( not ( = ?auto_435725 ?auto_435727 ) ) ( not ( = ?auto_435725 ?auto_435728 ) ) ( not ( = ?auto_435725 ?auto_435729 ) ) ( not ( = ?auto_435725 ?auto_435730 ) ) ( not ( = ?auto_435726 ?auto_435727 ) ) ( not ( = ?auto_435726 ?auto_435728 ) ) ( not ( = ?auto_435726 ?auto_435729 ) ) ( not ( = ?auto_435726 ?auto_435730 ) ) ( not ( = ?auto_435727 ?auto_435728 ) ) ( not ( = ?auto_435727 ?auto_435729 ) ) ( not ( = ?auto_435727 ?auto_435730 ) ) ( not ( = ?auto_435728 ?auto_435729 ) ) ( not ( = ?auto_435728 ?auto_435730 ) ) ( not ( = ?auto_435729 ?auto_435730 ) ) ( ON ?auto_435728 ?auto_435729 ) ( ON ?auto_435727 ?auto_435728 ) ( ON ?auto_435726 ?auto_435727 ) ( ON ?auto_435725 ?auto_435726 ) ( ON ?auto_435724 ?auto_435725 ) ( ON ?auto_435723 ?auto_435724 ) ( ON ?auto_435722 ?auto_435723 ) ( ON ?auto_435721 ?auto_435722 ) ( CLEAR ?auto_435719 ) ( ON ?auto_435720 ?auto_435721 ) ( CLEAR ?auto_435720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_435719 ?auto_435720 )
      ( MAKE-11PILE ?auto_435719 ?auto_435720 ?auto_435721 ?auto_435722 ?auto_435723 ?auto_435724 ?auto_435725 ?auto_435726 ?auto_435727 ?auto_435728 ?auto_435729 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435742 - BLOCK
      ?auto_435743 - BLOCK
      ?auto_435744 - BLOCK
      ?auto_435745 - BLOCK
      ?auto_435746 - BLOCK
      ?auto_435747 - BLOCK
      ?auto_435748 - BLOCK
      ?auto_435749 - BLOCK
      ?auto_435750 - BLOCK
      ?auto_435751 - BLOCK
      ?auto_435752 - BLOCK
    )
    :vars
    (
      ?auto_435753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435752 ?auto_435753 ) ( ON-TABLE ?auto_435742 ) ( not ( = ?auto_435742 ?auto_435743 ) ) ( not ( = ?auto_435742 ?auto_435744 ) ) ( not ( = ?auto_435742 ?auto_435745 ) ) ( not ( = ?auto_435742 ?auto_435746 ) ) ( not ( = ?auto_435742 ?auto_435747 ) ) ( not ( = ?auto_435742 ?auto_435748 ) ) ( not ( = ?auto_435742 ?auto_435749 ) ) ( not ( = ?auto_435742 ?auto_435750 ) ) ( not ( = ?auto_435742 ?auto_435751 ) ) ( not ( = ?auto_435742 ?auto_435752 ) ) ( not ( = ?auto_435742 ?auto_435753 ) ) ( not ( = ?auto_435743 ?auto_435744 ) ) ( not ( = ?auto_435743 ?auto_435745 ) ) ( not ( = ?auto_435743 ?auto_435746 ) ) ( not ( = ?auto_435743 ?auto_435747 ) ) ( not ( = ?auto_435743 ?auto_435748 ) ) ( not ( = ?auto_435743 ?auto_435749 ) ) ( not ( = ?auto_435743 ?auto_435750 ) ) ( not ( = ?auto_435743 ?auto_435751 ) ) ( not ( = ?auto_435743 ?auto_435752 ) ) ( not ( = ?auto_435743 ?auto_435753 ) ) ( not ( = ?auto_435744 ?auto_435745 ) ) ( not ( = ?auto_435744 ?auto_435746 ) ) ( not ( = ?auto_435744 ?auto_435747 ) ) ( not ( = ?auto_435744 ?auto_435748 ) ) ( not ( = ?auto_435744 ?auto_435749 ) ) ( not ( = ?auto_435744 ?auto_435750 ) ) ( not ( = ?auto_435744 ?auto_435751 ) ) ( not ( = ?auto_435744 ?auto_435752 ) ) ( not ( = ?auto_435744 ?auto_435753 ) ) ( not ( = ?auto_435745 ?auto_435746 ) ) ( not ( = ?auto_435745 ?auto_435747 ) ) ( not ( = ?auto_435745 ?auto_435748 ) ) ( not ( = ?auto_435745 ?auto_435749 ) ) ( not ( = ?auto_435745 ?auto_435750 ) ) ( not ( = ?auto_435745 ?auto_435751 ) ) ( not ( = ?auto_435745 ?auto_435752 ) ) ( not ( = ?auto_435745 ?auto_435753 ) ) ( not ( = ?auto_435746 ?auto_435747 ) ) ( not ( = ?auto_435746 ?auto_435748 ) ) ( not ( = ?auto_435746 ?auto_435749 ) ) ( not ( = ?auto_435746 ?auto_435750 ) ) ( not ( = ?auto_435746 ?auto_435751 ) ) ( not ( = ?auto_435746 ?auto_435752 ) ) ( not ( = ?auto_435746 ?auto_435753 ) ) ( not ( = ?auto_435747 ?auto_435748 ) ) ( not ( = ?auto_435747 ?auto_435749 ) ) ( not ( = ?auto_435747 ?auto_435750 ) ) ( not ( = ?auto_435747 ?auto_435751 ) ) ( not ( = ?auto_435747 ?auto_435752 ) ) ( not ( = ?auto_435747 ?auto_435753 ) ) ( not ( = ?auto_435748 ?auto_435749 ) ) ( not ( = ?auto_435748 ?auto_435750 ) ) ( not ( = ?auto_435748 ?auto_435751 ) ) ( not ( = ?auto_435748 ?auto_435752 ) ) ( not ( = ?auto_435748 ?auto_435753 ) ) ( not ( = ?auto_435749 ?auto_435750 ) ) ( not ( = ?auto_435749 ?auto_435751 ) ) ( not ( = ?auto_435749 ?auto_435752 ) ) ( not ( = ?auto_435749 ?auto_435753 ) ) ( not ( = ?auto_435750 ?auto_435751 ) ) ( not ( = ?auto_435750 ?auto_435752 ) ) ( not ( = ?auto_435750 ?auto_435753 ) ) ( not ( = ?auto_435751 ?auto_435752 ) ) ( not ( = ?auto_435751 ?auto_435753 ) ) ( not ( = ?auto_435752 ?auto_435753 ) ) ( ON ?auto_435751 ?auto_435752 ) ( ON ?auto_435750 ?auto_435751 ) ( ON ?auto_435749 ?auto_435750 ) ( ON ?auto_435748 ?auto_435749 ) ( ON ?auto_435747 ?auto_435748 ) ( ON ?auto_435746 ?auto_435747 ) ( ON ?auto_435745 ?auto_435746 ) ( ON ?auto_435744 ?auto_435745 ) ( CLEAR ?auto_435742 ) ( ON ?auto_435743 ?auto_435744 ) ( CLEAR ?auto_435743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_435742 ?auto_435743 )
      ( MAKE-11PILE ?auto_435742 ?auto_435743 ?auto_435744 ?auto_435745 ?auto_435746 ?auto_435747 ?auto_435748 ?auto_435749 ?auto_435750 ?auto_435751 ?auto_435752 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435765 - BLOCK
      ?auto_435766 - BLOCK
      ?auto_435767 - BLOCK
      ?auto_435768 - BLOCK
      ?auto_435769 - BLOCK
      ?auto_435770 - BLOCK
      ?auto_435771 - BLOCK
      ?auto_435772 - BLOCK
      ?auto_435773 - BLOCK
      ?auto_435774 - BLOCK
      ?auto_435775 - BLOCK
    )
    :vars
    (
      ?auto_435776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435775 ?auto_435776 ) ( not ( = ?auto_435765 ?auto_435766 ) ) ( not ( = ?auto_435765 ?auto_435767 ) ) ( not ( = ?auto_435765 ?auto_435768 ) ) ( not ( = ?auto_435765 ?auto_435769 ) ) ( not ( = ?auto_435765 ?auto_435770 ) ) ( not ( = ?auto_435765 ?auto_435771 ) ) ( not ( = ?auto_435765 ?auto_435772 ) ) ( not ( = ?auto_435765 ?auto_435773 ) ) ( not ( = ?auto_435765 ?auto_435774 ) ) ( not ( = ?auto_435765 ?auto_435775 ) ) ( not ( = ?auto_435765 ?auto_435776 ) ) ( not ( = ?auto_435766 ?auto_435767 ) ) ( not ( = ?auto_435766 ?auto_435768 ) ) ( not ( = ?auto_435766 ?auto_435769 ) ) ( not ( = ?auto_435766 ?auto_435770 ) ) ( not ( = ?auto_435766 ?auto_435771 ) ) ( not ( = ?auto_435766 ?auto_435772 ) ) ( not ( = ?auto_435766 ?auto_435773 ) ) ( not ( = ?auto_435766 ?auto_435774 ) ) ( not ( = ?auto_435766 ?auto_435775 ) ) ( not ( = ?auto_435766 ?auto_435776 ) ) ( not ( = ?auto_435767 ?auto_435768 ) ) ( not ( = ?auto_435767 ?auto_435769 ) ) ( not ( = ?auto_435767 ?auto_435770 ) ) ( not ( = ?auto_435767 ?auto_435771 ) ) ( not ( = ?auto_435767 ?auto_435772 ) ) ( not ( = ?auto_435767 ?auto_435773 ) ) ( not ( = ?auto_435767 ?auto_435774 ) ) ( not ( = ?auto_435767 ?auto_435775 ) ) ( not ( = ?auto_435767 ?auto_435776 ) ) ( not ( = ?auto_435768 ?auto_435769 ) ) ( not ( = ?auto_435768 ?auto_435770 ) ) ( not ( = ?auto_435768 ?auto_435771 ) ) ( not ( = ?auto_435768 ?auto_435772 ) ) ( not ( = ?auto_435768 ?auto_435773 ) ) ( not ( = ?auto_435768 ?auto_435774 ) ) ( not ( = ?auto_435768 ?auto_435775 ) ) ( not ( = ?auto_435768 ?auto_435776 ) ) ( not ( = ?auto_435769 ?auto_435770 ) ) ( not ( = ?auto_435769 ?auto_435771 ) ) ( not ( = ?auto_435769 ?auto_435772 ) ) ( not ( = ?auto_435769 ?auto_435773 ) ) ( not ( = ?auto_435769 ?auto_435774 ) ) ( not ( = ?auto_435769 ?auto_435775 ) ) ( not ( = ?auto_435769 ?auto_435776 ) ) ( not ( = ?auto_435770 ?auto_435771 ) ) ( not ( = ?auto_435770 ?auto_435772 ) ) ( not ( = ?auto_435770 ?auto_435773 ) ) ( not ( = ?auto_435770 ?auto_435774 ) ) ( not ( = ?auto_435770 ?auto_435775 ) ) ( not ( = ?auto_435770 ?auto_435776 ) ) ( not ( = ?auto_435771 ?auto_435772 ) ) ( not ( = ?auto_435771 ?auto_435773 ) ) ( not ( = ?auto_435771 ?auto_435774 ) ) ( not ( = ?auto_435771 ?auto_435775 ) ) ( not ( = ?auto_435771 ?auto_435776 ) ) ( not ( = ?auto_435772 ?auto_435773 ) ) ( not ( = ?auto_435772 ?auto_435774 ) ) ( not ( = ?auto_435772 ?auto_435775 ) ) ( not ( = ?auto_435772 ?auto_435776 ) ) ( not ( = ?auto_435773 ?auto_435774 ) ) ( not ( = ?auto_435773 ?auto_435775 ) ) ( not ( = ?auto_435773 ?auto_435776 ) ) ( not ( = ?auto_435774 ?auto_435775 ) ) ( not ( = ?auto_435774 ?auto_435776 ) ) ( not ( = ?auto_435775 ?auto_435776 ) ) ( ON ?auto_435774 ?auto_435775 ) ( ON ?auto_435773 ?auto_435774 ) ( ON ?auto_435772 ?auto_435773 ) ( ON ?auto_435771 ?auto_435772 ) ( ON ?auto_435770 ?auto_435771 ) ( ON ?auto_435769 ?auto_435770 ) ( ON ?auto_435768 ?auto_435769 ) ( ON ?auto_435767 ?auto_435768 ) ( ON ?auto_435766 ?auto_435767 ) ( ON ?auto_435765 ?auto_435766 ) ( CLEAR ?auto_435765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_435765 )
      ( MAKE-11PILE ?auto_435765 ?auto_435766 ?auto_435767 ?auto_435768 ?auto_435769 ?auto_435770 ?auto_435771 ?auto_435772 ?auto_435773 ?auto_435774 ?auto_435775 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_435788 - BLOCK
      ?auto_435789 - BLOCK
      ?auto_435790 - BLOCK
      ?auto_435791 - BLOCK
      ?auto_435792 - BLOCK
      ?auto_435793 - BLOCK
      ?auto_435794 - BLOCK
      ?auto_435795 - BLOCK
      ?auto_435796 - BLOCK
      ?auto_435797 - BLOCK
      ?auto_435798 - BLOCK
    )
    :vars
    (
      ?auto_435799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435798 ?auto_435799 ) ( not ( = ?auto_435788 ?auto_435789 ) ) ( not ( = ?auto_435788 ?auto_435790 ) ) ( not ( = ?auto_435788 ?auto_435791 ) ) ( not ( = ?auto_435788 ?auto_435792 ) ) ( not ( = ?auto_435788 ?auto_435793 ) ) ( not ( = ?auto_435788 ?auto_435794 ) ) ( not ( = ?auto_435788 ?auto_435795 ) ) ( not ( = ?auto_435788 ?auto_435796 ) ) ( not ( = ?auto_435788 ?auto_435797 ) ) ( not ( = ?auto_435788 ?auto_435798 ) ) ( not ( = ?auto_435788 ?auto_435799 ) ) ( not ( = ?auto_435789 ?auto_435790 ) ) ( not ( = ?auto_435789 ?auto_435791 ) ) ( not ( = ?auto_435789 ?auto_435792 ) ) ( not ( = ?auto_435789 ?auto_435793 ) ) ( not ( = ?auto_435789 ?auto_435794 ) ) ( not ( = ?auto_435789 ?auto_435795 ) ) ( not ( = ?auto_435789 ?auto_435796 ) ) ( not ( = ?auto_435789 ?auto_435797 ) ) ( not ( = ?auto_435789 ?auto_435798 ) ) ( not ( = ?auto_435789 ?auto_435799 ) ) ( not ( = ?auto_435790 ?auto_435791 ) ) ( not ( = ?auto_435790 ?auto_435792 ) ) ( not ( = ?auto_435790 ?auto_435793 ) ) ( not ( = ?auto_435790 ?auto_435794 ) ) ( not ( = ?auto_435790 ?auto_435795 ) ) ( not ( = ?auto_435790 ?auto_435796 ) ) ( not ( = ?auto_435790 ?auto_435797 ) ) ( not ( = ?auto_435790 ?auto_435798 ) ) ( not ( = ?auto_435790 ?auto_435799 ) ) ( not ( = ?auto_435791 ?auto_435792 ) ) ( not ( = ?auto_435791 ?auto_435793 ) ) ( not ( = ?auto_435791 ?auto_435794 ) ) ( not ( = ?auto_435791 ?auto_435795 ) ) ( not ( = ?auto_435791 ?auto_435796 ) ) ( not ( = ?auto_435791 ?auto_435797 ) ) ( not ( = ?auto_435791 ?auto_435798 ) ) ( not ( = ?auto_435791 ?auto_435799 ) ) ( not ( = ?auto_435792 ?auto_435793 ) ) ( not ( = ?auto_435792 ?auto_435794 ) ) ( not ( = ?auto_435792 ?auto_435795 ) ) ( not ( = ?auto_435792 ?auto_435796 ) ) ( not ( = ?auto_435792 ?auto_435797 ) ) ( not ( = ?auto_435792 ?auto_435798 ) ) ( not ( = ?auto_435792 ?auto_435799 ) ) ( not ( = ?auto_435793 ?auto_435794 ) ) ( not ( = ?auto_435793 ?auto_435795 ) ) ( not ( = ?auto_435793 ?auto_435796 ) ) ( not ( = ?auto_435793 ?auto_435797 ) ) ( not ( = ?auto_435793 ?auto_435798 ) ) ( not ( = ?auto_435793 ?auto_435799 ) ) ( not ( = ?auto_435794 ?auto_435795 ) ) ( not ( = ?auto_435794 ?auto_435796 ) ) ( not ( = ?auto_435794 ?auto_435797 ) ) ( not ( = ?auto_435794 ?auto_435798 ) ) ( not ( = ?auto_435794 ?auto_435799 ) ) ( not ( = ?auto_435795 ?auto_435796 ) ) ( not ( = ?auto_435795 ?auto_435797 ) ) ( not ( = ?auto_435795 ?auto_435798 ) ) ( not ( = ?auto_435795 ?auto_435799 ) ) ( not ( = ?auto_435796 ?auto_435797 ) ) ( not ( = ?auto_435796 ?auto_435798 ) ) ( not ( = ?auto_435796 ?auto_435799 ) ) ( not ( = ?auto_435797 ?auto_435798 ) ) ( not ( = ?auto_435797 ?auto_435799 ) ) ( not ( = ?auto_435798 ?auto_435799 ) ) ( ON ?auto_435797 ?auto_435798 ) ( ON ?auto_435796 ?auto_435797 ) ( ON ?auto_435795 ?auto_435796 ) ( ON ?auto_435794 ?auto_435795 ) ( ON ?auto_435793 ?auto_435794 ) ( ON ?auto_435792 ?auto_435793 ) ( ON ?auto_435791 ?auto_435792 ) ( ON ?auto_435790 ?auto_435791 ) ( ON ?auto_435789 ?auto_435790 ) ( ON ?auto_435788 ?auto_435789 ) ( CLEAR ?auto_435788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_435788 )
      ( MAKE-11PILE ?auto_435788 ?auto_435789 ?auto_435790 ?auto_435791 ?auto_435792 ?auto_435793 ?auto_435794 ?auto_435795 ?auto_435796 ?auto_435797 ?auto_435798 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435812 - BLOCK
      ?auto_435813 - BLOCK
      ?auto_435814 - BLOCK
      ?auto_435815 - BLOCK
      ?auto_435816 - BLOCK
      ?auto_435817 - BLOCK
      ?auto_435818 - BLOCK
      ?auto_435819 - BLOCK
      ?auto_435820 - BLOCK
      ?auto_435821 - BLOCK
      ?auto_435822 - BLOCK
      ?auto_435823 - BLOCK
    )
    :vars
    (
      ?auto_435824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_435822 ) ( ON ?auto_435823 ?auto_435824 ) ( CLEAR ?auto_435823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_435812 ) ( ON ?auto_435813 ?auto_435812 ) ( ON ?auto_435814 ?auto_435813 ) ( ON ?auto_435815 ?auto_435814 ) ( ON ?auto_435816 ?auto_435815 ) ( ON ?auto_435817 ?auto_435816 ) ( ON ?auto_435818 ?auto_435817 ) ( ON ?auto_435819 ?auto_435818 ) ( ON ?auto_435820 ?auto_435819 ) ( ON ?auto_435821 ?auto_435820 ) ( ON ?auto_435822 ?auto_435821 ) ( not ( = ?auto_435812 ?auto_435813 ) ) ( not ( = ?auto_435812 ?auto_435814 ) ) ( not ( = ?auto_435812 ?auto_435815 ) ) ( not ( = ?auto_435812 ?auto_435816 ) ) ( not ( = ?auto_435812 ?auto_435817 ) ) ( not ( = ?auto_435812 ?auto_435818 ) ) ( not ( = ?auto_435812 ?auto_435819 ) ) ( not ( = ?auto_435812 ?auto_435820 ) ) ( not ( = ?auto_435812 ?auto_435821 ) ) ( not ( = ?auto_435812 ?auto_435822 ) ) ( not ( = ?auto_435812 ?auto_435823 ) ) ( not ( = ?auto_435812 ?auto_435824 ) ) ( not ( = ?auto_435813 ?auto_435814 ) ) ( not ( = ?auto_435813 ?auto_435815 ) ) ( not ( = ?auto_435813 ?auto_435816 ) ) ( not ( = ?auto_435813 ?auto_435817 ) ) ( not ( = ?auto_435813 ?auto_435818 ) ) ( not ( = ?auto_435813 ?auto_435819 ) ) ( not ( = ?auto_435813 ?auto_435820 ) ) ( not ( = ?auto_435813 ?auto_435821 ) ) ( not ( = ?auto_435813 ?auto_435822 ) ) ( not ( = ?auto_435813 ?auto_435823 ) ) ( not ( = ?auto_435813 ?auto_435824 ) ) ( not ( = ?auto_435814 ?auto_435815 ) ) ( not ( = ?auto_435814 ?auto_435816 ) ) ( not ( = ?auto_435814 ?auto_435817 ) ) ( not ( = ?auto_435814 ?auto_435818 ) ) ( not ( = ?auto_435814 ?auto_435819 ) ) ( not ( = ?auto_435814 ?auto_435820 ) ) ( not ( = ?auto_435814 ?auto_435821 ) ) ( not ( = ?auto_435814 ?auto_435822 ) ) ( not ( = ?auto_435814 ?auto_435823 ) ) ( not ( = ?auto_435814 ?auto_435824 ) ) ( not ( = ?auto_435815 ?auto_435816 ) ) ( not ( = ?auto_435815 ?auto_435817 ) ) ( not ( = ?auto_435815 ?auto_435818 ) ) ( not ( = ?auto_435815 ?auto_435819 ) ) ( not ( = ?auto_435815 ?auto_435820 ) ) ( not ( = ?auto_435815 ?auto_435821 ) ) ( not ( = ?auto_435815 ?auto_435822 ) ) ( not ( = ?auto_435815 ?auto_435823 ) ) ( not ( = ?auto_435815 ?auto_435824 ) ) ( not ( = ?auto_435816 ?auto_435817 ) ) ( not ( = ?auto_435816 ?auto_435818 ) ) ( not ( = ?auto_435816 ?auto_435819 ) ) ( not ( = ?auto_435816 ?auto_435820 ) ) ( not ( = ?auto_435816 ?auto_435821 ) ) ( not ( = ?auto_435816 ?auto_435822 ) ) ( not ( = ?auto_435816 ?auto_435823 ) ) ( not ( = ?auto_435816 ?auto_435824 ) ) ( not ( = ?auto_435817 ?auto_435818 ) ) ( not ( = ?auto_435817 ?auto_435819 ) ) ( not ( = ?auto_435817 ?auto_435820 ) ) ( not ( = ?auto_435817 ?auto_435821 ) ) ( not ( = ?auto_435817 ?auto_435822 ) ) ( not ( = ?auto_435817 ?auto_435823 ) ) ( not ( = ?auto_435817 ?auto_435824 ) ) ( not ( = ?auto_435818 ?auto_435819 ) ) ( not ( = ?auto_435818 ?auto_435820 ) ) ( not ( = ?auto_435818 ?auto_435821 ) ) ( not ( = ?auto_435818 ?auto_435822 ) ) ( not ( = ?auto_435818 ?auto_435823 ) ) ( not ( = ?auto_435818 ?auto_435824 ) ) ( not ( = ?auto_435819 ?auto_435820 ) ) ( not ( = ?auto_435819 ?auto_435821 ) ) ( not ( = ?auto_435819 ?auto_435822 ) ) ( not ( = ?auto_435819 ?auto_435823 ) ) ( not ( = ?auto_435819 ?auto_435824 ) ) ( not ( = ?auto_435820 ?auto_435821 ) ) ( not ( = ?auto_435820 ?auto_435822 ) ) ( not ( = ?auto_435820 ?auto_435823 ) ) ( not ( = ?auto_435820 ?auto_435824 ) ) ( not ( = ?auto_435821 ?auto_435822 ) ) ( not ( = ?auto_435821 ?auto_435823 ) ) ( not ( = ?auto_435821 ?auto_435824 ) ) ( not ( = ?auto_435822 ?auto_435823 ) ) ( not ( = ?auto_435822 ?auto_435824 ) ) ( not ( = ?auto_435823 ?auto_435824 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_435823 ?auto_435824 )
      ( !STACK ?auto_435823 ?auto_435822 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435837 - BLOCK
      ?auto_435838 - BLOCK
      ?auto_435839 - BLOCK
      ?auto_435840 - BLOCK
      ?auto_435841 - BLOCK
      ?auto_435842 - BLOCK
      ?auto_435843 - BLOCK
      ?auto_435844 - BLOCK
      ?auto_435845 - BLOCK
      ?auto_435846 - BLOCK
      ?auto_435847 - BLOCK
      ?auto_435848 - BLOCK
    )
    :vars
    (
      ?auto_435849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_435847 ) ( ON ?auto_435848 ?auto_435849 ) ( CLEAR ?auto_435848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_435837 ) ( ON ?auto_435838 ?auto_435837 ) ( ON ?auto_435839 ?auto_435838 ) ( ON ?auto_435840 ?auto_435839 ) ( ON ?auto_435841 ?auto_435840 ) ( ON ?auto_435842 ?auto_435841 ) ( ON ?auto_435843 ?auto_435842 ) ( ON ?auto_435844 ?auto_435843 ) ( ON ?auto_435845 ?auto_435844 ) ( ON ?auto_435846 ?auto_435845 ) ( ON ?auto_435847 ?auto_435846 ) ( not ( = ?auto_435837 ?auto_435838 ) ) ( not ( = ?auto_435837 ?auto_435839 ) ) ( not ( = ?auto_435837 ?auto_435840 ) ) ( not ( = ?auto_435837 ?auto_435841 ) ) ( not ( = ?auto_435837 ?auto_435842 ) ) ( not ( = ?auto_435837 ?auto_435843 ) ) ( not ( = ?auto_435837 ?auto_435844 ) ) ( not ( = ?auto_435837 ?auto_435845 ) ) ( not ( = ?auto_435837 ?auto_435846 ) ) ( not ( = ?auto_435837 ?auto_435847 ) ) ( not ( = ?auto_435837 ?auto_435848 ) ) ( not ( = ?auto_435837 ?auto_435849 ) ) ( not ( = ?auto_435838 ?auto_435839 ) ) ( not ( = ?auto_435838 ?auto_435840 ) ) ( not ( = ?auto_435838 ?auto_435841 ) ) ( not ( = ?auto_435838 ?auto_435842 ) ) ( not ( = ?auto_435838 ?auto_435843 ) ) ( not ( = ?auto_435838 ?auto_435844 ) ) ( not ( = ?auto_435838 ?auto_435845 ) ) ( not ( = ?auto_435838 ?auto_435846 ) ) ( not ( = ?auto_435838 ?auto_435847 ) ) ( not ( = ?auto_435838 ?auto_435848 ) ) ( not ( = ?auto_435838 ?auto_435849 ) ) ( not ( = ?auto_435839 ?auto_435840 ) ) ( not ( = ?auto_435839 ?auto_435841 ) ) ( not ( = ?auto_435839 ?auto_435842 ) ) ( not ( = ?auto_435839 ?auto_435843 ) ) ( not ( = ?auto_435839 ?auto_435844 ) ) ( not ( = ?auto_435839 ?auto_435845 ) ) ( not ( = ?auto_435839 ?auto_435846 ) ) ( not ( = ?auto_435839 ?auto_435847 ) ) ( not ( = ?auto_435839 ?auto_435848 ) ) ( not ( = ?auto_435839 ?auto_435849 ) ) ( not ( = ?auto_435840 ?auto_435841 ) ) ( not ( = ?auto_435840 ?auto_435842 ) ) ( not ( = ?auto_435840 ?auto_435843 ) ) ( not ( = ?auto_435840 ?auto_435844 ) ) ( not ( = ?auto_435840 ?auto_435845 ) ) ( not ( = ?auto_435840 ?auto_435846 ) ) ( not ( = ?auto_435840 ?auto_435847 ) ) ( not ( = ?auto_435840 ?auto_435848 ) ) ( not ( = ?auto_435840 ?auto_435849 ) ) ( not ( = ?auto_435841 ?auto_435842 ) ) ( not ( = ?auto_435841 ?auto_435843 ) ) ( not ( = ?auto_435841 ?auto_435844 ) ) ( not ( = ?auto_435841 ?auto_435845 ) ) ( not ( = ?auto_435841 ?auto_435846 ) ) ( not ( = ?auto_435841 ?auto_435847 ) ) ( not ( = ?auto_435841 ?auto_435848 ) ) ( not ( = ?auto_435841 ?auto_435849 ) ) ( not ( = ?auto_435842 ?auto_435843 ) ) ( not ( = ?auto_435842 ?auto_435844 ) ) ( not ( = ?auto_435842 ?auto_435845 ) ) ( not ( = ?auto_435842 ?auto_435846 ) ) ( not ( = ?auto_435842 ?auto_435847 ) ) ( not ( = ?auto_435842 ?auto_435848 ) ) ( not ( = ?auto_435842 ?auto_435849 ) ) ( not ( = ?auto_435843 ?auto_435844 ) ) ( not ( = ?auto_435843 ?auto_435845 ) ) ( not ( = ?auto_435843 ?auto_435846 ) ) ( not ( = ?auto_435843 ?auto_435847 ) ) ( not ( = ?auto_435843 ?auto_435848 ) ) ( not ( = ?auto_435843 ?auto_435849 ) ) ( not ( = ?auto_435844 ?auto_435845 ) ) ( not ( = ?auto_435844 ?auto_435846 ) ) ( not ( = ?auto_435844 ?auto_435847 ) ) ( not ( = ?auto_435844 ?auto_435848 ) ) ( not ( = ?auto_435844 ?auto_435849 ) ) ( not ( = ?auto_435845 ?auto_435846 ) ) ( not ( = ?auto_435845 ?auto_435847 ) ) ( not ( = ?auto_435845 ?auto_435848 ) ) ( not ( = ?auto_435845 ?auto_435849 ) ) ( not ( = ?auto_435846 ?auto_435847 ) ) ( not ( = ?auto_435846 ?auto_435848 ) ) ( not ( = ?auto_435846 ?auto_435849 ) ) ( not ( = ?auto_435847 ?auto_435848 ) ) ( not ( = ?auto_435847 ?auto_435849 ) ) ( not ( = ?auto_435848 ?auto_435849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_435848 ?auto_435849 )
      ( !STACK ?auto_435848 ?auto_435847 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435862 - BLOCK
      ?auto_435863 - BLOCK
      ?auto_435864 - BLOCK
      ?auto_435865 - BLOCK
      ?auto_435866 - BLOCK
      ?auto_435867 - BLOCK
      ?auto_435868 - BLOCK
      ?auto_435869 - BLOCK
      ?auto_435870 - BLOCK
      ?auto_435871 - BLOCK
      ?auto_435872 - BLOCK
      ?auto_435873 - BLOCK
    )
    :vars
    (
      ?auto_435874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435873 ?auto_435874 ) ( ON-TABLE ?auto_435862 ) ( ON ?auto_435863 ?auto_435862 ) ( ON ?auto_435864 ?auto_435863 ) ( ON ?auto_435865 ?auto_435864 ) ( ON ?auto_435866 ?auto_435865 ) ( ON ?auto_435867 ?auto_435866 ) ( ON ?auto_435868 ?auto_435867 ) ( ON ?auto_435869 ?auto_435868 ) ( ON ?auto_435870 ?auto_435869 ) ( ON ?auto_435871 ?auto_435870 ) ( not ( = ?auto_435862 ?auto_435863 ) ) ( not ( = ?auto_435862 ?auto_435864 ) ) ( not ( = ?auto_435862 ?auto_435865 ) ) ( not ( = ?auto_435862 ?auto_435866 ) ) ( not ( = ?auto_435862 ?auto_435867 ) ) ( not ( = ?auto_435862 ?auto_435868 ) ) ( not ( = ?auto_435862 ?auto_435869 ) ) ( not ( = ?auto_435862 ?auto_435870 ) ) ( not ( = ?auto_435862 ?auto_435871 ) ) ( not ( = ?auto_435862 ?auto_435872 ) ) ( not ( = ?auto_435862 ?auto_435873 ) ) ( not ( = ?auto_435862 ?auto_435874 ) ) ( not ( = ?auto_435863 ?auto_435864 ) ) ( not ( = ?auto_435863 ?auto_435865 ) ) ( not ( = ?auto_435863 ?auto_435866 ) ) ( not ( = ?auto_435863 ?auto_435867 ) ) ( not ( = ?auto_435863 ?auto_435868 ) ) ( not ( = ?auto_435863 ?auto_435869 ) ) ( not ( = ?auto_435863 ?auto_435870 ) ) ( not ( = ?auto_435863 ?auto_435871 ) ) ( not ( = ?auto_435863 ?auto_435872 ) ) ( not ( = ?auto_435863 ?auto_435873 ) ) ( not ( = ?auto_435863 ?auto_435874 ) ) ( not ( = ?auto_435864 ?auto_435865 ) ) ( not ( = ?auto_435864 ?auto_435866 ) ) ( not ( = ?auto_435864 ?auto_435867 ) ) ( not ( = ?auto_435864 ?auto_435868 ) ) ( not ( = ?auto_435864 ?auto_435869 ) ) ( not ( = ?auto_435864 ?auto_435870 ) ) ( not ( = ?auto_435864 ?auto_435871 ) ) ( not ( = ?auto_435864 ?auto_435872 ) ) ( not ( = ?auto_435864 ?auto_435873 ) ) ( not ( = ?auto_435864 ?auto_435874 ) ) ( not ( = ?auto_435865 ?auto_435866 ) ) ( not ( = ?auto_435865 ?auto_435867 ) ) ( not ( = ?auto_435865 ?auto_435868 ) ) ( not ( = ?auto_435865 ?auto_435869 ) ) ( not ( = ?auto_435865 ?auto_435870 ) ) ( not ( = ?auto_435865 ?auto_435871 ) ) ( not ( = ?auto_435865 ?auto_435872 ) ) ( not ( = ?auto_435865 ?auto_435873 ) ) ( not ( = ?auto_435865 ?auto_435874 ) ) ( not ( = ?auto_435866 ?auto_435867 ) ) ( not ( = ?auto_435866 ?auto_435868 ) ) ( not ( = ?auto_435866 ?auto_435869 ) ) ( not ( = ?auto_435866 ?auto_435870 ) ) ( not ( = ?auto_435866 ?auto_435871 ) ) ( not ( = ?auto_435866 ?auto_435872 ) ) ( not ( = ?auto_435866 ?auto_435873 ) ) ( not ( = ?auto_435866 ?auto_435874 ) ) ( not ( = ?auto_435867 ?auto_435868 ) ) ( not ( = ?auto_435867 ?auto_435869 ) ) ( not ( = ?auto_435867 ?auto_435870 ) ) ( not ( = ?auto_435867 ?auto_435871 ) ) ( not ( = ?auto_435867 ?auto_435872 ) ) ( not ( = ?auto_435867 ?auto_435873 ) ) ( not ( = ?auto_435867 ?auto_435874 ) ) ( not ( = ?auto_435868 ?auto_435869 ) ) ( not ( = ?auto_435868 ?auto_435870 ) ) ( not ( = ?auto_435868 ?auto_435871 ) ) ( not ( = ?auto_435868 ?auto_435872 ) ) ( not ( = ?auto_435868 ?auto_435873 ) ) ( not ( = ?auto_435868 ?auto_435874 ) ) ( not ( = ?auto_435869 ?auto_435870 ) ) ( not ( = ?auto_435869 ?auto_435871 ) ) ( not ( = ?auto_435869 ?auto_435872 ) ) ( not ( = ?auto_435869 ?auto_435873 ) ) ( not ( = ?auto_435869 ?auto_435874 ) ) ( not ( = ?auto_435870 ?auto_435871 ) ) ( not ( = ?auto_435870 ?auto_435872 ) ) ( not ( = ?auto_435870 ?auto_435873 ) ) ( not ( = ?auto_435870 ?auto_435874 ) ) ( not ( = ?auto_435871 ?auto_435872 ) ) ( not ( = ?auto_435871 ?auto_435873 ) ) ( not ( = ?auto_435871 ?auto_435874 ) ) ( not ( = ?auto_435872 ?auto_435873 ) ) ( not ( = ?auto_435872 ?auto_435874 ) ) ( not ( = ?auto_435873 ?auto_435874 ) ) ( CLEAR ?auto_435871 ) ( ON ?auto_435872 ?auto_435873 ) ( CLEAR ?auto_435872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_435862 ?auto_435863 ?auto_435864 ?auto_435865 ?auto_435866 ?auto_435867 ?auto_435868 ?auto_435869 ?auto_435870 ?auto_435871 ?auto_435872 )
      ( MAKE-12PILE ?auto_435862 ?auto_435863 ?auto_435864 ?auto_435865 ?auto_435866 ?auto_435867 ?auto_435868 ?auto_435869 ?auto_435870 ?auto_435871 ?auto_435872 ?auto_435873 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435887 - BLOCK
      ?auto_435888 - BLOCK
      ?auto_435889 - BLOCK
      ?auto_435890 - BLOCK
      ?auto_435891 - BLOCK
      ?auto_435892 - BLOCK
      ?auto_435893 - BLOCK
      ?auto_435894 - BLOCK
      ?auto_435895 - BLOCK
      ?auto_435896 - BLOCK
      ?auto_435897 - BLOCK
      ?auto_435898 - BLOCK
    )
    :vars
    (
      ?auto_435899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435898 ?auto_435899 ) ( ON-TABLE ?auto_435887 ) ( ON ?auto_435888 ?auto_435887 ) ( ON ?auto_435889 ?auto_435888 ) ( ON ?auto_435890 ?auto_435889 ) ( ON ?auto_435891 ?auto_435890 ) ( ON ?auto_435892 ?auto_435891 ) ( ON ?auto_435893 ?auto_435892 ) ( ON ?auto_435894 ?auto_435893 ) ( ON ?auto_435895 ?auto_435894 ) ( ON ?auto_435896 ?auto_435895 ) ( not ( = ?auto_435887 ?auto_435888 ) ) ( not ( = ?auto_435887 ?auto_435889 ) ) ( not ( = ?auto_435887 ?auto_435890 ) ) ( not ( = ?auto_435887 ?auto_435891 ) ) ( not ( = ?auto_435887 ?auto_435892 ) ) ( not ( = ?auto_435887 ?auto_435893 ) ) ( not ( = ?auto_435887 ?auto_435894 ) ) ( not ( = ?auto_435887 ?auto_435895 ) ) ( not ( = ?auto_435887 ?auto_435896 ) ) ( not ( = ?auto_435887 ?auto_435897 ) ) ( not ( = ?auto_435887 ?auto_435898 ) ) ( not ( = ?auto_435887 ?auto_435899 ) ) ( not ( = ?auto_435888 ?auto_435889 ) ) ( not ( = ?auto_435888 ?auto_435890 ) ) ( not ( = ?auto_435888 ?auto_435891 ) ) ( not ( = ?auto_435888 ?auto_435892 ) ) ( not ( = ?auto_435888 ?auto_435893 ) ) ( not ( = ?auto_435888 ?auto_435894 ) ) ( not ( = ?auto_435888 ?auto_435895 ) ) ( not ( = ?auto_435888 ?auto_435896 ) ) ( not ( = ?auto_435888 ?auto_435897 ) ) ( not ( = ?auto_435888 ?auto_435898 ) ) ( not ( = ?auto_435888 ?auto_435899 ) ) ( not ( = ?auto_435889 ?auto_435890 ) ) ( not ( = ?auto_435889 ?auto_435891 ) ) ( not ( = ?auto_435889 ?auto_435892 ) ) ( not ( = ?auto_435889 ?auto_435893 ) ) ( not ( = ?auto_435889 ?auto_435894 ) ) ( not ( = ?auto_435889 ?auto_435895 ) ) ( not ( = ?auto_435889 ?auto_435896 ) ) ( not ( = ?auto_435889 ?auto_435897 ) ) ( not ( = ?auto_435889 ?auto_435898 ) ) ( not ( = ?auto_435889 ?auto_435899 ) ) ( not ( = ?auto_435890 ?auto_435891 ) ) ( not ( = ?auto_435890 ?auto_435892 ) ) ( not ( = ?auto_435890 ?auto_435893 ) ) ( not ( = ?auto_435890 ?auto_435894 ) ) ( not ( = ?auto_435890 ?auto_435895 ) ) ( not ( = ?auto_435890 ?auto_435896 ) ) ( not ( = ?auto_435890 ?auto_435897 ) ) ( not ( = ?auto_435890 ?auto_435898 ) ) ( not ( = ?auto_435890 ?auto_435899 ) ) ( not ( = ?auto_435891 ?auto_435892 ) ) ( not ( = ?auto_435891 ?auto_435893 ) ) ( not ( = ?auto_435891 ?auto_435894 ) ) ( not ( = ?auto_435891 ?auto_435895 ) ) ( not ( = ?auto_435891 ?auto_435896 ) ) ( not ( = ?auto_435891 ?auto_435897 ) ) ( not ( = ?auto_435891 ?auto_435898 ) ) ( not ( = ?auto_435891 ?auto_435899 ) ) ( not ( = ?auto_435892 ?auto_435893 ) ) ( not ( = ?auto_435892 ?auto_435894 ) ) ( not ( = ?auto_435892 ?auto_435895 ) ) ( not ( = ?auto_435892 ?auto_435896 ) ) ( not ( = ?auto_435892 ?auto_435897 ) ) ( not ( = ?auto_435892 ?auto_435898 ) ) ( not ( = ?auto_435892 ?auto_435899 ) ) ( not ( = ?auto_435893 ?auto_435894 ) ) ( not ( = ?auto_435893 ?auto_435895 ) ) ( not ( = ?auto_435893 ?auto_435896 ) ) ( not ( = ?auto_435893 ?auto_435897 ) ) ( not ( = ?auto_435893 ?auto_435898 ) ) ( not ( = ?auto_435893 ?auto_435899 ) ) ( not ( = ?auto_435894 ?auto_435895 ) ) ( not ( = ?auto_435894 ?auto_435896 ) ) ( not ( = ?auto_435894 ?auto_435897 ) ) ( not ( = ?auto_435894 ?auto_435898 ) ) ( not ( = ?auto_435894 ?auto_435899 ) ) ( not ( = ?auto_435895 ?auto_435896 ) ) ( not ( = ?auto_435895 ?auto_435897 ) ) ( not ( = ?auto_435895 ?auto_435898 ) ) ( not ( = ?auto_435895 ?auto_435899 ) ) ( not ( = ?auto_435896 ?auto_435897 ) ) ( not ( = ?auto_435896 ?auto_435898 ) ) ( not ( = ?auto_435896 ?auto_435899 ) ) ( not ( = ?auto_435897 ?auto_435898 ) ) ( not ( = ?auto_435897 ?auto_435899 ) ) ( not ( = ?auto_435898 ?auto_435899 ) ) ( CLEAR ?auto_435896 ) ( ON ?auto_435897 ?auto_435898 ) ( CLEAR ?auto_435897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_435887 ?auto_435888 ?auto_435889 ?auto_435890 ?auto_435891 ?auto_435892 ?auto_435893 ?auto_435894 ?auto_435895 ?auto_435896 ?auto_435897 )
      ( MAKE-12PILE ?auto_435887 ?auto_435888 ?auto_435889 ?auto_435890 ?auto_435891 ?auto_435892 ?auto_435893 ?auto_435894 ?auto_435895 ?auto_435896 ?auto_435897 ?auto_435898 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435912 - BLOCK
      ?auto_435913 - BLOCK
      ?auto_435914 - BLOCK
      ?auto_435915 - BLOCK
      ?auto_435916 - BLOCK
      ?auto_435917 - BLOCK
      ?auto_435918 - BLOCK
      ?auto_435919 - BLOCK
      ?auto_435920 - BLOCK
      ?auto_435921 - BLOCK
      ?auto_435922 - BLOCK
      ?auto_435923 - BLOCK
    )
    :vars
    (
      ?auto_435924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435923 ?auto_435924 ) ( ON-TABLE ?auto_435912 ) ( ON ?auto_435913 ?auto_435912 ) ( ON ?auto_435914 ?auto_435913 ) ( ON ?auto_435915 ?auto_435914 ) ( ON ?auto_435916 ?auto_435915 ) ( ON ?auto_435917 ?auto_435916 ) ( ON ?auto_435918 ?auto_435917 ) ( ON ?auto_435919 ?auto_435918 ) ( ON ?auto_435920 ?auto_435919 ) ( not ( = ?auto_435912 ?auto_435913 ) ) ( not ( = ?auto_435912 ?auto_435914 ) ) ( not ( = ?auto_435912 ?auto_435915 ) ) ( not ( = ?auto_435912 ?auto_435916 ) ) ( not ( = ?auto_435912 ?auto_435917 ) ) ( not ( = ?auto_435912 ?auto_435918 ) ) ( not ( = ?auto_435912 ?auto_435919 ) ) ( not ( = ?auto_435912 ?auto_435920 ) ) ( not ( = ?auto_435912 ?auto_435921 ) ) ( not ( = ?auto_435912 ?auto_435922 ) ) ( not ( = ?auto_435912 ?auto_435923 ) ) ( not ( = ?auto_435912 ?auto_435924 ) ) ( not ( = ?auto_435913 ?auto_435914 ) ) ( not ( = ?auto_435913 ?auto_435915 ) ) ( not ( = ?auto_435913 ?auto_435916 ) ) ( not ( = ?auto_435913 ?auto_435917 ) ) ( not ( = ?auto_435913 ?auto_435918 ) ) ( not ( = ?auto_435913 ?auto_435919 ) ) ( not ( = ?auto_435913 ?auto_435920 ) ) ( not ( = ?auto_435913 ?auto_435921 ) ) ( not ( = ?auto_435913 ?auto_435922 ) ) ( not ( = ?auto_435913 ?auto_435923 ) ) ( not ( = ?auto_435913 ?auto_435924 ) ) ( not ( = ?auto_435914 ?auto_435915 ) ) ( not ( = ?auto_435914 ?auto_435916 ) ) ( not ( = ?auto_435914 ?auto_435917 ) ) ( not ( = ?auto_435914 ?auto_435918 ) ) ( not ( = ?auto_435914 ?auto_435919 ) ) ( not ( = ?auto_435914 ?auto_435920 ) ) ( not ( = ?auto_435914 ?auto_435921 ) ) ( not ( = ?auto_435914 ?auto_435922 ) ) ( not ( = ?auto_435914 ?auto_435923 ) ) ( not ( = ?auto_435914 ?auto_435924 ) ) ( not ( = ?auto_435915 ?auto_435916 ) ) ( not ( = ?auto_435915 ?auto_435917 ) ) ( not ( = ?auto_435915 ?auto_435918 ) ) ( not ( = ?auto_435915 ?auto_435919 ) ) ( not ( = ?auto_435915 ?auto_435920 ) ) ( not ( = ?auto_435915 ?auto_435921 ) ) ( not ( = ?auto_435915 ?auto_435922 ) ) ( not ( = ?auto_435915 ?auto_435923 ) ) ( not ( = ?auto_435915 ?auto_435924 ) ) ( not ( = ?auto_435916 ?auto_435917 ) ) ( not ( = ?auto_435916 ?auto_435918 ) ) ( not ( = ?auto_435916 ?auto_435919 ) ) ( not ( = ?auto_435916 ?auto_435920 ) ) ( not ( = ?auto_435916 ?auto_435921 ) ) ( not ( = ?auto_435916 ?auto_435922 ) ) ( not ( = ?auto_435916 ?auto_435923 ) ) ( not ( = ?auto_435916 ?auto_435924 ) ) ( not ( = ?auto_435917 ?auto_435918 ) ) ( not ( = ?auto_435917 ?auto_435919 ) ) ( not ( = ?auto_435917 ?auto_435920 ) ) ( not ( = ?auto_435917 ?auto_435921 ) ) ( not ( = ?auto_435917 ?auto_435922 ) ) ( not ( = ?auto_435917 ?auto_435923 ) ) ( not ( = ?auto_435917 ?auto_435924 ) ) ( not ( = ?auto_435918 ?auto_435919 ) ) ( not ( = ?auto_435918 ?auto_435920 ) ) ( not ( = ?auto_435918 ?auto_435921 ) ) ( not ( = ?auto_435918 ?auto_435922 ) ) ( not ( = ?auto_435918 ?auto_435923 ) ) ( not ( = ?auto_435918 ?auto_435924 ) ) ( not ( = ?auto_435919 ?auto_435920 ) ) ( not ( = ?auto_435919 ?auto_435921 ) ) ( not ( = ?auto_435919 ?auto_435922 ) ) ( not ( = ?auto_435919 ?auto_435923 ) ) ( not ( = ?auto_435919 ?auto_435924 ) ) ( not ( = ?auto_435920 ?auto_435921 ) ) ( not ( = ?auto_435920 ?auto_435922 ) ) ( not ( = ?auto_435920 ?auto_435923 ) ) ( not ( = ?auto_435920 ?auto_435924 ) ) ( not ( = ?auto_435921 ?auto_435922 ) ) ( not ( = ?auto_435921 ?auto_435923 ) ) ( not ( = ?auto_435921 ?auto_435924 ) ) ( not ( = ?auto_435922 ?auto_435923 ) ) ( not ( = ?auto_435922 ?auto_435924 ) ) ( not ( = ?auto_435923 ?auto_435924 ) ) ( ON ?auto_435922 ?auto_435923 ) ( CLEAR ?auto_435920 ) ( ON ?auto_435921 ?auto_435922 ) ( CLEAR ?auto_435921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_435912 ?auto_435913 ?auto_435914 ?auto_435915 ?auto_435916 ?auto_435917 ?auto_435918 ?auto_435919 ?auto_435920 ?auto_435921 )
      ( MAKE-12PILE ?auto_435912 ?auto_435913 ?auto_435914 ?auto_435915 ?auto_435916 ?auto_435917 ?auto_435918 ?auto_435919 ?auto_435920 ?auto_435921 ?auto_435922 ?auto_435923 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435937 - BLOCK
      ?auto_435938 - BLOCK
      ?auto_435939 - BLOCK
      ?auto_435940 - BLOCK
      ?auto_435941 - BLOCK
      ?auto_435942 - BLOCK
      ?auto_435943 - BLOCK
      ?auto_435944 - BLOCK
      ?auto_435945 - BLOCK
      ?auto_435946 - BLOCK
      ?auto_435947 - BLOCK
      ?auto_435948 - BLOCK
    )
    :vars
    (
      ?auto_435949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435948 ?auto_435949 ) ( ON-TABLE ?auto_435937 ) ( ON ?auto_435938 ?auto_435937 ) ( ON ?auto_435939 ?auto_435938 ) ( ON ?auto_435940 ?auto_435939 ) ( ON ?auto_435941 ?auto_435940 ) ( ON ?auto_435942 ?auto_435941 ) ( ON ?auto_435943 ?auto_435942 ) ( ON ?auto_435944 ?auto_435943 ) ( ON ?auto_435945 ?auto_435944 ) ( not ( = ?auto_435937 ?auto_435938 ) ) ( not ( = ?auto_435937 ?auto_435939 ) ) ( not ( = ?auto_435937 ?auto_435940 ) ) ( not ( = ?auto_435937 ?auto_435941 ) ) ( not ( = ?auto_435937 ?auto_435942 ) ) ( not ( = ?auto_435937 ?auto_435943 ) ) ( not ( = ?auto_435937 ?auto_435944 ) ) ( not ( = ?auto_435937 ?auto_435945 ) ) ( not ( = ?auto_435937 ?auto_435946 ) ) ( not ( = ?auto_435937 ?auto_435947 ) ) ( not ( = ?auto_435937 ?auto_435948 ) ) ( not ( = ?auto_435937 ?auto_435949 ) ) ( not ( = ?auto_435938 ?auto_435939 ) ) ( not ( = ?auto_435938 ?auto_435940 ) ) ( not ( = ?auto_435938 ?auto_435941 ) ) ( not ( = ?auto_435938 ?auto_435942 ) ) ( not ( = ?auto_435938 ?auto_435943 ) ) ( not ( = ?auto_435938 ?auto_435944 ) ) ( not ( = ?auto_435938 ?auto_435945 ) ) ( not ( = ?auto_435938 ?auto_435946 ) ) ( not ( = ?auto_435938 ?auto_435947 ) ) ( not ( = ?auto_435938 ?auto_435948 ) ) ( not ( = ?auto_435938 ?auto_435949 ) ) ( not ( = ?auto_435939 ?auto_435940 ) ) ( not ( = ?auto_435939 ?auto_435941 ) ) ( not ( = ?auto_435939 ?auto_435942 ) ) ( not ( = ?auto_435939 ?auto_435943 ) ) ( not ( = ?auto_435939 ?auto_435944 ) ) ( not ( = ?auto_435939 ?auto_435945 ) ) ( not ( = ?auto_435939 ?auto_435946 ) ) ( not ( = ?auto_435939 ?auto_435947 ) ) ( not ( = ?auto_435939 ?auto_435948 ) ) ( not ( = ?auto_435939 ?auto_435949 ) ) ( not ( = ?auto_435940 ?auto_435941 ) ) ( not ( = ?auto_435940 ?auto_435942 ) ) ( not ( = ?auto_435940 ?auto_435943 ) ) ( not ( = ?auto_435940 ?auto_435944 ) ) ( not ( = ?auto_435940 ?auto_435945 ) ) ( not ( = ?auto_435940 ?auto_435946 ) ) ( not ( = ?auto_435940 ?auto_435947 ) ) ( not ( = ?auto_435940 ?auto_435948 ) ) ( not ( = ?auto_435940 ?auto_435949 ) ) ( not ( = ?auto_435941 ?auto_435942 ) ) ( not ( = ?auto_435941 ?auto_435943 ) ) ( not ( = ?auto_435941 ?auto_435944 ) ) ( not ( = ?auto_435941 ?auto_435945 ) ) ( not ( = ?auto_435941 ?auto_435946 ) ) ( not ( = ?auto_435941 ?auto_435947 ) ) ( not ( = ?auto_435941 ?auto_435948 ) ) ( not ( = ?auto_435941 ?auto_435949 ) ) ( not ( = ?auto_435942 ?auto_435943 ) ) ( not ( = ?auto_435942 ?auto_435944 ) ) ( not ( = ?auto_435942 ?auto_435945 ) ) ( not ( = ?auto_435942 ?auto_435946 ) ) ( not ( = ?auto_435942 ?auto_435947 ) ) ( not ( = ?auto_435942 ?auto_435948 ) ) ( not ( = ?auto_435942 ?auto_435949 ) ) ( not ( = ?auto_435943 ?auto_435944 ) ) ( not ( = ?auto_435943 ?auto_435945 ) ) ( not ( = ?auto_435943 ?auto_435946 ) ) ( not ( = ?auto_435943 ?auto_435947 ) ) ( not ( = ?auto_435943 ?auto_435948 ) ) ( not ( = ?auto_435943 ?auto_435949 ) ) ( not ( = ?auto_435944 ?auto_435945 ) ) ( not ( = ?auto_435944 ?auto_435946 ) ) ( not ( = ?auto_435944 ?auto_435947 ) ) ( not ( = ?auto_435944 ?auto_435948 ) ) ( not ( = ?auto_435944 ?auto_435949 ) ) ( not ( = ?auto_435945 ?auto_435946 ) ) ( not ( = ?auto_435945 ?auto_435947 ) ) ( not ( = ?auto_435945 ?auto_435948 ) ) ( not ( = ?auto_435945 ?auto_435949 ) ) ( not ( = ?auto_435946 ?auto_435947 ) ) ( not ( = ?auto_435946 ?auto_435948 ) ) ( not ( = ?auto_435946 ?auto_435949 ) ) ( not ( = ?auto_435947 ?auto_435948 ) ) ( not ( = ?auto_435947 ?auto_435949 ) ) ( not ( = ?auto_435948 ?auto_435949 ) ) ( ON ?auto_435947 ?auto_435948 ) ( CLEAR ?auto_435945 ) ( ON ?auto_435946 ?auto_435947 ) ( CLEAR ?auto_435946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_435937 ?auto_435938 ?auto_435939 ?auto_435940 ?auto_435941 ?auto_435942 ?auto_435943 ?auto_435944 ?auto_435945 ?auto_435946 )
      ( MAKE-12PILE ?auto_435937 ?auto_435938 ?auto_435939 ?auto_435940 ?auto_435941 ?auto_435942 ?auto_435943 ?auto_435944 ?auto_435945 ?auto_435946 ?auto_435947 ?auto_435948 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435962 - BLOCK
      ?auto_435963 - BLOCK
      ?auto_435964 - BLOCK
      ?auto_435965 - BLOCK
      ?auto_435966 - BLOCK
      ?auto_435967 - BLOCK
      ?auto_435968 - BLOCK
      ?auto_435969 - BLOCK
      ?auto_435970 - BLOCK
      ?auto_435971 - BLOCK
      ?auto_435972 - BLOCK
      ?auto_435973 - BLOCK
    )
    :vars
    (
      ?auto_435974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435973 ?auto_435974 ) ( ON-TABLE ?auto_435962 ) ( ON ?auto_435963 ?auto_435962 ) ( ON ?auto_435964 ?auto_435963 ) ( ON ?auto_435965 ?auto_435964 ) ( ON ?auto_435966 ?auto_435965 ) ( ON ?auto_435967 ?auto_435966 ) ( ON ?auto_435968 ?auto_435967 ) ( ON ?auto_435969 ?auto_435968 ) ( not ( = ?auto_435962 ?auto_435963 ) ) ( not ( = ?auto_435962 ?auto_435964 ) ) ( not ( = ?auto_435962 ?auto_435965 ) ) ( not ( = ?auto_435962 ?auto_435966 ) ) ( not ( = ?auto_435962 ?auto_435967 ) ) ( not ( = ?auto_435962 ?auto_435968 ) ) ( not ( = ?auto_435962 ?auto_435969 ) ) ( not ( = ?auto_435962 ?auto_435970 ) ) ( not ( = ?auto_435962 ?auto_435971 ) ) ( not ( = ?auto_435962 ?auto_435972 ) ) ( not ( = ?auto_435962 ?auto_435973 ) ) ( not ( = ?auto_435962 ?auto_435974 ) ) ( not ( = ?auto_435963 ?auto_435964 ) ) ( not ( = ?auto_435963 ?auto_435965 ) ) ( not ( = ?auto_435963 ?auto_435966 ) ) ( not ( = ?auto_435963 ?auto_435967 ) ) ( not ( = ?auto_435963 ?auto_435968 ) ) ( not ( = ?auto_435963 ?auto_435969 ) ) ( not ( = ?auto_435963 ?auto_435970 ) ) ( not ( = ?auto_435963 ?auto_435971 ) ) ( not ( = ?auto_435963 ?auto_435972 ) ) ( not ( = ?auto_435963 ?auto_435973 ) ) ( not ( = ?auto_435963 ?auto_435974 ) ) ( not ( = ?auto_435964 ?auto_435965 ) ) ( not ( = ?auto_435964 ?auto_435966 ) ) ( not ( = ?auto_435964 ?auto_435967 ) ) ( not ( = ?auto_435964 ?auto_435968 ) ) ( not ( = ?auto_435964 ?auto_435969 ) ) ( not ( = ?auto_435964 ?auto_435970 ) ) ( not ( = ?auto_435964 ?auto_435971 ) ) ( not ( = ?auto_435964 ?auto_435972 ) ) ( not ( = ?auto_435964 ?auto_435973 ) ) ( not ( = ?auto_435964 ?auto_435974 ) ) ( not ( = ?auto_435965 ?auto_435966 ) ) ( not ( = ?auto_435965 ?auto_435967 ) ) ( not ( = ?auto_435965 ?auto_435968 ) ) ( not ( = ?auto_435965 ?auto_435969 ) ) ( not ( = ?auto_435965 ?auto_435970 ) ) ( not ( = ?auto_435965 ?auto_435971 ) ) ( not ( = ?auto_435965 ?auto_435972 ) ) ( not ( = ?auto_435965 ?auto_435973 ) ) ( not ( = ?auto_435965 ?auto_435974 ) ) ( not ( = ?auto_435966 ?auto_435967 ) ) ( not ( = ?auto_435966 ?auto_435968 ) ) ( not ( = ?auto_435966 ?auto_435969 ) ) ( not ( = ?auto_435966 ?auto_435970 ) ) ( not ( = ?auto_435966 ?auto_435971 ) ) ( not ( = ?auto_435966 ?auto_435972 ) ) ( not ( = ?auto_435966 ?auto_435973 ) ) ( not ( = ?auto_435966 ?auto_435974 ) ) ( not ( = ?auto_435967 ?auto_435968 ) ) ( not ( = ?auto_435967 ?auto_435969 ) ) ( not ( = ?auto_435967 ?auto_435970 ) ) ( not ( = ?auto_435967 ?auto_435971 ) ) ( not ( = ?auto_435967 ?auto_435972 ) ) ( not ( = ?auto_435967 ?auto_435973 ) ) ( not ( = ?auto_435967 ?auto_435974 ) ) ( not ( = ?auto_435968 ?auto_435969 ) ) ( not ( = ?auto_435968 ?auto_435970 ) ) ( not ( = ?auto_435968 ?auto_435971 ) ) ( not ( = ?auto_435968 ?auto_435972 ) ) ( not ( = ?auto_435968 ?auto_435973 ) ) ( not ( = ?auto_435968 ?auto_435974 ) ) ( not ( = ?auto_435969 ?auto_435970 ) ) ( not ( = ?auto_435969 ?auto_435971 ) ) ( not ( = ?auto_435969 ?auto_435972 ) ) ( not ( = ?auto_435969 ?auto_435973 ) ) ( not ( = ?auto_435969 ?auto_435974 ) ) ( not ( = ?auto_435970 ?auto_435971 ) ) ( not ( = ?auto_435970 ?auto_435972 ) ) ( not ( = ?auto_435970 ?auto_435973 ) ) ( not ( = ?auto_435970 ?auto_435974 ) ) ( not ( = ?auto_435971 ?auto_435972 ) ) ( not ( = ?auto_435971 ?auto_435973 ) ) ( not ( = ?auto_435971 ?auto_435974 ) ) ( not ( = ?auto_435972 ?auto_435973 ) ) ( not ( = ?auto_435972 ?auto_435974 ) ) ( not ( = ?auto_435973 ?auto_435974 ) ) ( ON ?auto_435972 ?auto_435973 ) ( ON ?auto_435971 ?auto_435972 ) ( CLEAR ?auto_435969 ) ( ON ?auto_435970 ?auto_435971 ) ( CLEAR ?auto_435970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_435962 ?auto_435963 ?auto_435964 ?auto_435965 ?auto_435966 ?auto_435967 ?auto_435968 ?auto_435969 ?auto_435970 )
      ( MAKE-12PILE ?auto_435962 ?auto_435963 ?auto_435964 ?auto_435965 ?auto_435966 ?auto_435967 ?auto_435968 ?auto_435969 ?auto_435970 ?auto_435971 ?auto_435972 ?auto_435973 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_435987 - BLOCK
      ?auto_435988 - BLOCK
      ?auto_435989 - BLOCK
      ?auto_435990 - BLOCK
      ?auto_435991 - BLOCK
      ?auto_435992 - BLOCK
      ?auto_435993 - BLOCK
      ?auto_435994 - BLOCK
      ?auto_435995 - BLOCK
      ?auto_435996 - BLOCK
      ?auto_435997 - BLOCK
      ?auto_435998 - BLOCK
    )
    :vars
    (
      ?auto_435999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_435998 ?auto_435999 ) ( ON-TABLE ?auto_435987 ) ( ON ?auto_435988 ?auto_435987 ) ( ON ?auto_435989 ?auto_435988 ) ( ON ?auto_435990 ?auto_435989 ) ( ON ?auto_435991 ?auto_435990 ) ( ON ?auto_435992 ?auto_435991 ) ( ON ?auto_435993 ?auto_435992 ) ( ON ?auto_435994 ?auto_435993 ) ( not ( = ?auto_435987 ?auto_435988 ) ) ( not ( = ?auto_435987 ?auto_435989 ) ) ( not ( = ?auto_435987 ?auto_435990 ) ) ( not ( = ?auto_435987 ?auto_435991 ) ) ( not ( = ?auto_435987 ?auto_435992 ) ) ( not ( = ?auto_435987 ?auto_435993 ) ) ( not ( = ?auto_435987 ?auto_435994 ) ) ( not ( = ?auto_435987 ?auto_435995 ) ) ( not ( = ?auto_435987 ?auto_435996 ) ) ( not ( = ?auto_435987 ?auto_435997 ) ) ( not ( = ?auto_435987 ?auto_435998 ) ) ( not ( = ?auto_435987 ?auto_435999 ) ) ( not ( = ?auto_435988 ?auto_435989 ) ) ( not ( = ?auto_435988 ?auto_435990 ) ) ( not ( = ?auto_435988 ?auto_435991 ) ) ( not ( = ?auto_435988 ?auto_435992 ) ) ( not ( = ?auto_435988 ?auto_435993 ) ) ( not ( = ?auto_435988 ?auto_435994 ) ) ( not ( = ?auto_435988 ?auto_435995 ) ) ( not ( = ?auto_435988 ?auto_435996 ) ) ( not ( = ?auto_435988 ?auto_435997 ) ) ( not ( = ?auto_435988 ?auto_435998 ) ) ( not ( = ?auto_435988 ?auto_435999 ) ) ( not ( = ?auto_435989 ?auto_435990 ) ) ( not ( = ?auto_435989 ?auto_435991 ) ) ( not ( = ?auto_435989 ?auto_435992 ) ) ( not ( = ?auto_435989 ?auto_435993 ) ) ( not ( = ?auto_435989 ?auto_435994 ) ) ( not ( = ?auto_435989 ?auto_435995 ) ) ( not ( = ?auto_435989 ?auto_435996 ) ) ( not ( = ?auto_435989 ?auto_435997 ) ) ( not ( = ?auto_435989 ?auto_435998 ) ) ( not ( = ?auto_435989 ?auto_435999 ) ) ( not ( = ?auto_435990 ?auto_435991 ) ) ( not ( = ?auto_435990 ?auto_435992 ) ) ( not ( = ?auto_435990 ?auto_435993 ) ) ( not ( = ?auto_435990 ?auto_435994 ) ) ( not ( = ?auto_435990 ?auto_435995 ) ) ( not ( = ?auto_435990 ?auto_435996 ) ) ( not ( = ?auto_435990 ?auto_435997 ) ) ( not ( = ?auto_435990 ?auto_435998 ) ) ( not ( = ?auto_435990 ?auto_435999 ) ) ( not ( = ?auto_435991 ?auto_435992 ) ) ( not ( = ?auto_435991 ?auto_435993 ) ) ( not ( = ?auto_435991 ?auto_435994 ) ) ( not ( = ?auto_435991 ?auto_435995 ) ) ( not ( = ?auto_435991 ?auto_435996 ) ) ( not ( = ?auto_435991 ?auto_435997 ) ) ( not ( = ?auto_435991 ?auto_435998 ) ) ( not ( = ?auto_435991 ?auto_435999 ) ) ( not ( = ?auto_435992 ?auto_435993 ) ) ( not ( = ?auto_435992 ?auto_435994 ) ) ( not ( = ?auto_435992 ?auto_435995 ) ) ( not ( = ?auto_435992 ?auto_435996 ) ) ( not ( = ?auto_435992 ?auto_435997 ) ) ( not ( = ?auto_435992 ?auto_435998 ) ) ( not ( = ?auto_435992 ?auto_435999 ) ) ( not ( = ?auto_435993 ?auto_435994 ) ) ( not ( = ?auto_435993 ?auto_435995 ) ) ( not ( = ?auto_435993 ?auto_435996 ) ) ( not ( = ?auto_435993 ?auto_435997 ) ) ( not ( = ?auto_435993 ?auto_435998 ) ) ( not ( = ?auto_435993 ?auto_435999 ) ) ( not ( = ?auto_435994 ?auto_435995 ) ) ( not ( = ?auto_435994 ?auto_435996 ) ) ( not ( = ?auto_435994 ?auto_435997 ) ) ( not ( = ?auto_435994 ?auto_435998 ) ) ( not ( = ?auto_435994 ?auto_435999 ) ) ( not ( = ?auto_435995 ?auto_435996 ) ) ( not ( = ?auto_435995 ?auto_435997 ) ) ( not ( = ?auto_435995 ?auto_435998 ) ) ( not ( = ?auto_435995 ?auto_435999 ) ) ( not ( = ?auto_435996 ?auto_435997 ) ) ( not ( = ?auto_435996 ?auto_435998 ) ) ( not ( = ?auto_435996 ?auto_435999 ) ) ( not ( = ?auto_435997 ?auto_435998 ) ) ( not ( = ?auto_435997 ?auto_435999 ) ) ( not ( = ?auto_435998 ?auto_435999 ) ) ( ON ?auto_435997 ?auto_435998 ) ( ON ?auto_435996 ?auto_435997 ) ( CLEAR ?auto_435994 ) ( ON ?auto_435995 ?auto_435996 ) ( CLEAR ?auto_435995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_435987 ?auto_435988 ?auto_435989 ?auto_435990 ?auto_435991 ?auto_435992 ?auto_435993 ?auto_435994 ?auto_435995 )
      ( MAKE-12PILE ?auto_435987 ?auto_435988 ?auto_435989 ?auto_435990 ?auto_435991 ?auto_435992 ?auto_435993 ?auto_435994 ?auto_435995 ?auto_435996 ?auto_435997 ?auto_435998 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436012 - BLOCK
      ?auto_436013 - BLOCK
      ?auto_436014 - BLOCK
      ?auto_436015 - BLOCK
      ?auto_436016 - BLOCK
      ?auto_436017 - BLOCK
      ?auto_436018 - BLOCK
      ?auto_436019 - BLOCK
      ?auto_436020 - BLOCK
      ?auto_436021 - BLOCK
      ?auto_436022 - BLOCK
      ?auto_436023 - BLOCK
    )
    :vars
    (
      ?auto_436024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436023 ?auto_436024 ) ( ON-TABLE ?auto_436012 ) ( ON ?auto_436013 ?auto_436012 ) ( ON ?auto_436014 ?auto_436013 ) ( ON ?auto_436015 ?auto_436014 ) ( ON ?auto_436016 ?auto_436015 ) ( ON ?auto_436017 ?auto_436016 ) ( ON ?auto_436018 ?auto_436017 ) ( not ( = ?auto_436012 ?auto_436013 ) ) ( not ( = ?auto_436012 ?auto_436014 ) ) ( not ( = ?auto_436012 ?auto_436015 ) ) ( not ( = ?auto_436012 ?auto_436016 ) ) ( not ( = ?auto_436012 ?auto_436017 ) ) ( not ( = ?auto_436012 ?auto_436018 ) ) ( not ( = ?auto_436012 ?auto_436019 ) ) ( not ( = ?auto_436012 ?auto_436020 ) ) ( not ( = ?auto_436012 ?auto_436021 ) ) ( not ( = ?auto_436012 ?auto_436022 ) ) ( not ( = ?auto_436012 ?auto_436023 ) ) ( not ( = ?auto_436012 ?auto_436024 ) ) ( not ( = ?auto_436013 ?auto_436014 ) ) ( not ( = ?auto_436013 ?auto_436015 ) ) ( not ( = ?auto_436013 ?auto_436016 ) ) ( not ( = ?auto_436013 ?auto_436017 ) ) ( not ( = ?auto_436013 ?auto_436018 ) ) ( not ( = ?auto_436013 ?auto_436019 ) ) ( not ( = ?auto_436013 ?auto_436020 ) ) ( not ( = ?auto_436013 ?auto_436021 ) ) ( not ( = ?auto_436013 ?auto_436022 ) ) ( not ( = ?auto_436013 ?auto_436023 ) ) ( not ( = ?auto_436013 ?auto_436024 ) ) ( not ( = ?auto_436014 ?auto_436015 ) ) ( not ( = ?auto_436014 ?auto_436016 ) ) ( not ( = ?auto_436014 ?auto_436017 ) ) ( not ( = ?auto_436014 ?auto_436018 ) ) ( not ( = ?auto_436014 ?auto_436019 ) ) ( not ( = ?auto_436014 ?auto_436020 ) ) ( not ( = ?auto_436014 ?auto_436021 ) ) ( not ( = ?auto_436014 ?auto_436022 ) ) ( not ( = ?auto_436014 ?auto_436023 ) ) ( not ( = ?auto_436014 ?auto_436024 ) ) ( not ( = ?auto_436015 ?auto_436016 ) ) ( not ( = ?auto_436015 ?auto_436017 ) ) ( not ( = ?auto_436015 ?auto_436018 ) ) ( not ( = ?auto_436015 ?auto_436019 ) ) ( not ( = ?auto_436015 ?auto_436020 ) ) ( not ( = ?auto_436015 ?auto_436021 ) ) ( not ( = ?auto_436015 ?auto_436022 ) ) ( not ( = ?auto_436015 ?auto_436023 ) ) ( not ( = ?auto_436015 ?auto_436024 ) ) ( not ( = ?auto_436016 ?auto_436017 ) ) ( not ( = ?auto_436016 ?auto_436018 ) ) ( not ( = ?auto_436016 ?auto_436019 ) ) ( not ( = ?auto_436016 ?auto_436020 ) ) ( not ( = ?auto_436016 ?auto_436021 ) ) ( not ( = ?auto_436016 ?auto_436022 ) ) ( not ( = ?auto_436016 ?auto_436023 ) ) ( not ( = ?auto_436016 ?auto_436024 ) ) ( not ( = ?auto_436017 ?auto_436018 ) ) ( not ( = ?auto_436017 ?auto_436019 ) ) ( not ( = ?auto_436017 ?auto_436020 ) ) ( not ( = ?auto_436017 ?auto_436021 ) ) ( not ( = ?auto_436017 ?auto_436022 ) ) ( not ( = ?auto_436017 ?auto_436023 ) ) ( not ( = ?auto_436017 ?auto_436024 ) ) ( not ( = ?auto_436018 ?auto_436019 ) ) ( not ( = ?auto_436018 ?auto_436020 ) ) ( not ( = ?auto_436018 ?auto_436021 ) ) ( not ( = ?auto_436018 ?auto_436022 ) ) ( not ( = ?auto_436018 ?auto_436023 ) ) ( not ( = ?auto_436018 ?auto_436024 ) ) ( not ( = ?auto_436019 ?auto_436020 ) ) ( not ( = ?auto_436019 ?auto_436021 ) ) ( not ( = ?auto_436019 ?auto_436022 ) ) ( not ( = ?auto_436019 ?auto_436023 ) ) ( not ( = ?auto_436019 ?auto_436024 ) ) ( not ( = ?auto_436020 ?auto_436021 ) ) ( not ( = ?auto_436020 ?auto_436022 ) ) ( not ( = ?auto_436020 ?auto_436023 ) ) ( not ( = ?auto_436020 ?auto_436024 ) ) ( not ( = ?auto_436021 ?auto_436022 ) ) ( not ( = ?auto_436021 ?auto_436023 ) ) ( not ( = ?auto_436021 ?auto_436024 ) ) ( not ( = ?auto_436022 ?auto_436023 ) ) ( not ( = ?auto_436022 ?auto_436024 ) ) ( not ( = ?auto_436023 ?auto_436024 ) ) ( ON ?auto_436022 ?auto_436023 ) ( ON ?auto_436021 ?auto_436022 ) ( ON ?auto_436020 ?auto_436021 ) ( CLEAR ?auto_436018 ) ( ON ?auto_436019 ?auto_436020 ) ( CLEAR ?auto_436019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_436012 ?auto_436013 ?auto_436014 ?auto_436015 ?auto_436016 ?auto_436017 ?auto_436018 ?auto_436019 )
      ( MAKE-12PILE ?auto_436012 ?auto_436013 ?auto_436014 ?auto_436015 ?auto_436016 ?auto_436017 ?auto_436018 ?auto_436019 ?auto_436020 ?auto_436021 ?auto_436022 ?auto_436023 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436037 - BLOCK
      ?auto_436038 - BLOCK
      ?auto_436039 - BLOCK
      ?auto_436040 - BLOCK
      ?auto_436041 - BLOCK
      ?auto_436042 - BLOCK
      ?auto_436043 - BLOCK
      ?auto_436044 - BLOCK
      ?auto_436045 - BLOCK
      ?auto_436046 - BLOCK
      ?auto_436047 - BLOCK
      ?auto_436048 - BLOCK
    )
    :vars
    (
      ?auto_436049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436048 ?auto_436049 ) ( ON-TABLE ?auto_436037 ) ( ON ?auto_436038 ?auto_436037 ) ( ON ?auto_436039 ?auto_436038 ) ( ON ?auto_436040 ?auto_436039 ) ( ON ?auto_436041 ?auto_436040 ) ( ON ?auto_436042 ?auto_436041 ) ( ON ?auto_436043 ?auto_436042 ) ( not ( = ?auto_436037 ?auto_436038 ) ) ( not ( = ?auto_436037 ?auto_436039 ) ) ( not ( = ?auto_436037 ?auto_436040 ) ) ( not ( = ?auto_436037 ?auto_436041 ) ) ( not ( = ?auto_436037 ?auto_436042 ) ) ( not ( = ?auto_436037 ?auto_436043 ) ) ( not ( = ?auto_436037 ?auto_436044 ) ) ( not ( = ?auto_436037 ?auto_436045 ) ) ( not ( = ?auto_436037 ?auto_436046 ) ) ( not ( = ?auto_436037 ?auto_436047 ) ) ( not ( = ?auto_436037 ?auto_436048 ) ) ( not ( = ?auto_436037 ?auto_436049 ) ) ( not ( = ?auto_436038 ?auto_436039 ) ) ( not ( = ?auto_436038 ?auto_436040 ) ) ( not ( = ?auto_436038 ?auto_436041 ) ) ( not ( = ?auto_436038 ?auto_436042 ) ) ( not ( = ?auto_436038 ?auto_436043 ) ) ( not ( = ?auto_436038 ?auto_436044 ) ) ( not ( = ?auto_436038 ?auto_436045 ) ) ( not ( = ?auto_436038 ?auto_436046 ) ) ( not ( = ?auto_436038 ?auto_436047 ) ) ( not ( = ?auto_436038 ?auto_436048 ) ) ( not ( = ?auto_436038 ?auto_436049 ) ) ( not ( = ?auto_436039 ?auto_436040 ) ) ( not ( = ?auto_436039 ?auto_436041 ) ) ( not ( = ?auto_436039 ?auto_436042 ) ) ( not ( = ?auto_436039 ?auto_436043 ) ) ( not ( = ?auto_436039 ?auto_436044 ) ) ( not ( = ?auto_436039 ?auto_436045 ) ) ( not ( = ?auto_436039 ?auto_436046 ) ) ( not ( = ?auto_436039 ?auto_436047 ) ) ( not ( = ?auto_436039 ?auto_436048 ) ) ( not ( = ?auto_436039 ?auto_436049 ) ) ( not ( = ?auto_436040 ?auto_436041 ) ) ( not ( = ?auto_436040 ?auto_436042 ) ) ( not ( = ?auto_436040 ?auto_436043 ) ) ( not ( = ?auto_436040 ?auto_436044 ) ) ( not ( = ?auto_436040 ?auto_436045 ) ) ( not ( = ?auto_436040 ?auto_436046 ) ) ( not ( = ?auto_436040 ?auto_436047 ) ) ( not ( = ?auto_436040 ?auto_436048 ) ) ( not ( = ?auto_436040 ?auto_436049 ) ) ( not ( = ?auto_436041 ?auto_436042 ) ) ( not ( = ?auto_436041 ?auto_436043 ) ) ( not ( = ?auto_436041 ?auto_436044 ) ) ( not ( = ?auto_436041 ?auto_436045 ) ) ( not ( = ?auto_436041 ?auto_436046 ) ) ( not ( = ?auto_436041 ?auto_436047 ) ) ( not ( = ?auto_436041 ?auto_436048 ) ) ( not ( = ?auto_436041 ?auto_436049 ) ) ( not ( = ?auto_436042 ?auto_436043 ) ) ( not ( = ?auto_436042 ?auto_436044 ) ) ( not ( = ?auto_436042 ?auto_436045 ) ) ( not ( = ?auto_436042 ?auto_436046 ) ) ( not ( = ?auto_436042 ?auto_436047 ) ) ( not ( = ?auto_436042 ?auto_436048 ) ) ( not ( = ?auto_436042 ?auto_436049 ) ) ( not ( = ?auto_436043 ?auto_436044 ) ) ( not ( = ?auto_436043 ?auto_436045 ) ) ( not ( = ?auto_436043 ?auto_436046 ) ) ( not ( = ?auto_436043 ?auto_436047 ) ) ( not ( = ?auto_436043 ?auto_436048 ) ) ( not ( = ?auto_436043 ?auto_436049 ) ) ( not ( = ?auto_436044 ?auto_436045 ) ) ( not ( = ?auto_436044 ?auto_436046 ) ) ( not ( = ?auto_436044 ?auto_436047 ) ) ( not ( = ?auto_436044 ?auto_436048 ) ) ( not ( = ?auto_436044 ?auto_436049 ) ) ( not ( = ?auto_436045 ?auto_436046 ) ) ( not ( = ?auto_436045 ?auto_436047 ) ) ( not ( = ?auto_436045 ?auto_436048 ) ) ( not ( = ?auto_436045 ?auto_436049 ) ) ( not ( = ?auto_436046 ?auto_436047 ) ) ( not ( = ?auto_436046 ?auto_436048 ) ) ( not ( = ?auto_436046 ?auto_436049 ) ) ( not ( = ?auto_436047 ?auto_436048 ) ) ( not ( = ?auto_436047 ?auto_436049 ) ) ( not ( = ?auto_436048 ?auto_436049 ) ) ( ON ?auto_436047 ?auto_436048 ) ( ON ?auto_436046 ?auto_436047 ) ( ON ?auto_436045 ?auto_436046 ) ( CLEAR ?auto_436043 ) ( ON ?auto_436044 ?auto_436045 ) ( CLEAR ?auto_436044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_436037 ?auto_436038 ?auto_436039 ?auto_436040 ?auto_436041 ?auto_436042 ?auto_436043 ?auto_436044 )
      ( MAKE-12PILE ?auto_436037 ?auto_436038 ?auto_436039 ?auto_436040 ?auto_436041 ?auto_436042 ?auto_436043 ?auto_436044 ?auto_436045 ?auto_436046 ?auto_436047 ?auto_436048 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436062 - BLOCK
      ?auto_436063 - BLOCK
      ?auto_436064 - BLOCK
      ?auto_436065 - BLOCK
      ?auto_436066 - BLOCK
      ?auto_436067 - BLOCK
      ?auto_436068 - BLOCK
      ?auto_436069 - BLOCK
      ?auto_436070 - BLOCK
      ?auto_436071 - BLOCK
      ?auto_436072 - BLOCK
      ?auto_436073 - BLOCK
    )
    :vars
    (
      ?auto_436074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436073 ?auto_436074 ) ( ON-TABLE ?auto_436062 ) ( ON ?auto_436063 ?auto_436062 ) ( ON ?auto_436064 ?auto_436063 ) ( ON ?auto_436065 ?auto_436064 ) ( ON ?auto_436066 ?auto_436065 ) ( ON ?auto_436067 ?auto_436066 ) ( not ( = ?auto_436062 ?auto_436063 ) ) ( not ( = ?auto_436062 ?auto_436064 ) ) ( not ( = ?auto_436062 ?auto_436065 ) ) ( not ( = ?auto_436062 ?auto_436066 ) ) ( not ( = ?auto_436062 ?auto_436067 ) ) ( not ( = ?auto_436062 ?auto_436068 ) ) ( not ( = ?auto_436062 ?auto_436069 ) ) ( not ( = ?auto_436062 ?auto_436070 ) ) ( not ( = ?auto_436062 ?auto_436071 ) ) ( not ( = ?auto_436062 ?auto_436072 ) ) ( not ( = ?auto_436062 ?auto_436073 ) ) ( not ( = ?auto_436062 ?auto_436074 ) ) ( not ( = ?auto_436063 ?auto_436064 ) ) ( not ( = ?auto_436063 ?auto_436065 ) ) ( not ( = ?auto_436063 ?auto_436066 ) ) ( not ( = ?auto_436063 ?auto_436067 ) ) ( not ( = ?auto_436063 ?auto_436068 ) ) ( not ( = ?auto_436063 ?auto_436069 ) ) ( not ( = ?auto_436063 ?auto_436070 ) ) ( not ( = ?auto_436063 ?auto_436071 ) ) ( not ( = ?auto_436063 ?auto_436072 ) ) ( not ( = ?auto_436063 ?auto_436073 ) ) ( not ( = ?auto_436063 ?auto_436074 ) ) ( not ( = ?auto_436064 ?auto_436065 ) ) ( not ( = ?auto_436064 ?auto_436066 ) ) ( not ( = ?auto_436064 ?auto_436067 ) ) ( not ( = ?auto_436064 ?auto_436068 ) ) ( not ( = ?auto_436064 ?auto_436069 ) ) ( not ( = ?auto_436064 ?auto_436070 ) ) ( not ( = ?auto_436064 ?auto_436071 ) ) ( not ( = ?auto_436064 ?auto_436072 ) ) ( not ( = ?auto_436064 ?auto_436073 ) ) ( not ( = ?auto_436064 ?auto_436074 ) ) ( not ( = ?auto_436065 ?auto_436066 ) ) ( not ( = ?auto_436065 ?auto_436067 ) ) ( not ( = ?auto_436065 ?auto_436068 ) ) ( not ( = ?auto_436065 ?auto_436069 ) ) ( not ( = ?auto_436065 ?auto_436070 ) ) ( not ( = ?auto_436065 ?auto_436071 ) ) ( not ( = ?auto_436065 ?auto_436072 ) ) ( not ( = ?auto_436065 ?auto_436073 ) ) ( not ( = ?auto_436065 ?auto_436074 ) ) ( not ( = ?auto_436066 ?auto_436067 ) ) ( not ( = ?auto_436066 ?auto_436068 ) ) ( not ( = ?auto_436066 ?auto_436069 ) ) ( not ( = ?auto_436066 ?auto_436070 ) ) ( not ( = ?auto_436066 ?auto_436071 ) ) ( not ( = ?auto_436066 ?auto_436072 ) ) ( not ( = ?auto_436066 ?auto_436073 ) ) ( not ( = ?auto_436066 ?auto_436074 ) ) ( not ( = ?auto_436067 ?auto_436068 ) ) ( not ( = ?auto_436067 ?auto_436069 ) ) ( not ( = ?auto_436067 ?auto_436070 ) ) ( not ( = ?auto_436067 ?auto_436071 ) ) ( not ( = ?auto_436067 ?auto_436072 ) ) ( not ( = ?auto_436067 ?auto_436073 ) ) ( not ( = ?auto_436067 ?auto_436074 ) ) ( not ( = ?auto_436068 ?auto_436069 ) ) ( not ( = ?auto_436068 ?auto_436070 ) ) ( not ( = ?auto_436068 ?auto_436071 ) ) ( not ( = ?auto_436068 ?auto_436072 ) ) ( not ( = ?auto_436068 ?auto_436073 ) ) ( not ( = ?auto_436068 ?auto_436074 ) ) ( not ( = ?auto_436069 ?auto_436070 ) ) ( not ( = ?auto_436069 ?auto_436071 ) ) ( not ( = ?auto_436069 ?auto_436072 ) ) ( not ( = ?auto_436069 ?auto_436073 ) ) ( not ( = ?auto_436069 ?auto_436074 ) ) ( not ( = ?auto_436070 ?auto_436071 ) ) ( not ( = ?auto_436070 ?auto_436072 ) ) ( not ( = ?auto_436070 ?auto_436073 ) ) ( not ( = ?auto_436070 ?auto_436074 ) ) ( not ( = ?auto_436071 ?auto_436072 ) ) ( not ( = ?auto_436071 ?auto_436073 ) ) ( not ( = ?auto_436071 ?auto_436074 ) ) ( not ( = ?auto_436072 ?auto_436073 ) ) ( not ( = ?auto_436072 ?auto_436074 ) ) ( not ( = ?auto_436073 ?auto_436074 ) ) ( ON ?auto_436072 ?auto_436073 ) ( ON ?auto_436071 ?auto_436072 ) ( ON ?auto_436070 ?auto_436071 ) ( ON ?auto_436069 ?auto_436070 ) ( CLEAR ?auto_436067 ) ( ON ?auto_436068 ?auto_436069 ) ( CLEAR ?auto_436068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_436062 ?auto_436063 ?auto_436064 ?auto_436065 ?auto_436066 ?auto_436067 ?auto_436068 )
      ( MAKE-12PILE ?auto_436062 ?auto_436063 ?auto_436064 ?auto_436065 ?auto_436066 ?auto_436067 ?auto_436068 ?auto_436069 ?auto_436070 ?auto_436071 ?auto_436072 ?auto_436073 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436087 - BLOCK
      ?auto_436088 - BLOCK
      ?auto_436089 - BLOCK
      ?auto_436090 - BLOCK
      ?auto_436091 - BLOCK
      ?auto_436092 - BLOCK
      ?auto_436093 - BLOCK
      ?auto_436094 - BLOCK
      ?auto_436095 - BLOCK
      ?auto_436096 - BLOCK
      ?auto_436097 - BLOCK
      ?auto_436098 - BLOCK
    )
    :vars
    (
      ?auto_436099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436098 ?auto_436099 ) ( ON-TABLE ?auto_436087 ) ( ON ?auto_436088 ?auto_436087 ) ( ON ?auto_436089 ?auto_436088 ) ( ON ?auto_436090 ?auto_436089 ) ( ON ?auto_436091 ?auto_436090 ) ( ON ?auto_436092 ?auto_436091 ) ( not ( = ?auto_436087 ?auto_436088 ) ) ( not ( = ?auto_436087 ?auto_436089 ) ) ( not ( = ?auto_436087 ?auto_436090 ) ) ( not ( = ?auto_436087 ?auto_436091 ) ) ( not ( = ?auto_436087 ?auto_436092 ) ) ( not ( = ?auto_436087 ?auto_436093 ) ) ( not ( = ?auto_436087 ?auto_436094 ) ) ( not ( = ?auto_436087 ?auto_436095 ) ) ( not ( = ?auto_436087 ?auto_436096 ) ) ( not ( = ?auto_436087 ?auto_436097 ) ) ( not ( = ?auto_436087 ?auto_436098 ) ) ( not ( = ?auto_436087 ?auto_436099 ) ) ( not ( = ?auto_436088 ?auto_436089 ) ) ( not ( = ?auto_436088 ?auto_436090 ) ) ( not ( = ?auto_436088 ?auto_436091 ) ) ( not ( = ?auto_436088 ?auto_436092 ) ) ( not ( = ?auto_436088 ?auto_436093 ) ) ( not ( = ?auto_436088 ?auto_436094 ) ) ( not ( = ?auto_436088 ?auto_436095 ) ) ( not ( = ?auto_436088 ?auto_436096 ) ) ( not ( = ?auto_436088 ?auto_436097 ) ) ( not ( = ?auto_436088 ?auto_436098 ) ) ( not ( = ?auto_436088 ?auto_436099 ) ) ( not ( = ?auto_436089 ?auto_436090 ) ) ( not ( = ?auto_436089 ?auto_436091 ) ) ( not ( = ?auto_436089 ?auto_436092 ) ) ( not ( = ?auto_436089 ?auto_436093 ) ) ( not ( = ?auto_436089 ?auto_436094 ) ) ( not ( = ?auto_436089 ?auto_436095 ) ) ( not ( = ?auto_436089 ?auto_436096 ) ) ( not ( = ?auto_436089 ?auto_436097 ) ) ( not ( = ?auto_436089 ?auto_436098 ) ) ( not ( = ?auto_436089 ?auto_436099 ) ) ( not ( = ?auto_436090 ?auto_436091 ) ) ( not ( = ?auto_436090 ?auto_436092 ) ) ( not ( = ?auto_436090 ?auto_436093 ) ) ( not ( = ?auto_436090 ?auto_436094 ) ) ( not ( = ?auto_436090 ?auto_436095 ) ) ( not ( = ?auto_436090 ?auto_436096 ) ) ( not ( = ?auto_436090 ?auto_436097 ) ) ( not ( = ?auto_436090 ?auto_436098 ) ) ( not ( = ?auto_436090 ?auto_436099 ) ) ( not ( = ?auto_436091 ?auto_436092 ) ) ( not ( = ?auto_436091 ?auto_436093 ) ) ( not ( = ?auto_436091 ?auto_436094 ) ) ( not ( = ?auto_436091 ?auto_436095 ) ) ( not ( = ?auto_436091 ?auto_436096 ) ) ( not ( = ?auto_436091 ?auto_436097 ) ) ( not ( = ?auto_436091 ?auto_436098 ) ) ( not ( = ?auto_436091 ?auto_436099 ) ) ( not ( = ?auto_436092 ?auto_436093 ) ) ( not ( = ?auto_436092 ?auto_436094 ) ) ( not ( = ?auto_436092 ?auto_436095 ) ) ( not ( = ?auto_436092 ?auto_436096 ) ) ( not ( = ?auto_436092 ?auto_436097 ) ) ( not ( = ?auto_436092 ?auto_436098 ) ) ( not ( = ?auto_436092 ?auto_436099 ) ) ( not ( = ?auto_436093 ?auto_436094 ) ) ( not ( = ?auto_436093 ?auto_436095 ) ) ( not ( = ?auto_436093 ?auto_436096 ) ) ( not ( = ?auto_436093 ?auto_436097 ) ) ( not ( = ?auto_436093 ?auto_436098 ) ) ( not ( = ?auto_436093 ?auto_436099 ) ) ( not ( = ?auto_436094 ?auto_436095 ) ) ( not ( = ?auto_436094 ?auto_436096 ) ) ( not ( = ?auto_436094 ?auto_436097 ) ) ( not ( = ?auto_436094 ?auto_436098 ) ) ( not ( = ?auto_436094 ?auto_436099 ) ) ( not ( = ?auto_436095 ?auto_436096 ) ) ( not ( = ?auto_436095 ?auto_436097 ) ) ( not ( = ?auto_436095 ?auto_436098 ) ) ( not ( = ?auto_436095 ?auto_436099 ) ) ( not ( = ?auto_436096 ?auto_436097 ) ) ( not ( = ?auto_436096 ?auto_436098 ) ) ( not ( = ?auto_436096 ?auto_436099 ) ) ( not ( = ?auto_436097 ?auto_436098 ) ) ( not ( = ?auto_436097 ?auto_436099 ) ) ( not ( = ?auto_436098 ?auto_436099 ) ) ( ON ?auto_436097 ?auto_436098 ) ( ON ?auto_436096 ?auto_436097 ) ( ON ?auto_436095 ?auto_436096 ) ( ON ?auto_436094 ?auto_436095 ) ( CLEAR ?auto_436092 ) ( ON ?auto_436093 ?auto_436094 ) ( CLEAR ?auto_436093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_436087 ?auto_436088 ?auto_436089 ?auto_436090 ?auto_436091 ?auto_436092 ?auto_436093 )
      ( MAKE-12PILE ?auto_436087 ?auto_436088 ?auto_436089 ?auto_436090 ?auto_436091 ?auto_436092 ?auto_436093 ?auto_436094 ?auto_436095 ?auto_436096 ?auto_436097 ?auto_436098 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436112 - BLOCK
      ?auto_436113 - BLOCK
      ?auto_436114 - BLOCK
      ?auto_436115 - BLOCK
      ?auto_436116 - BLOCK
      ?auto_436117 - BLOCK
      ?auto_436118 - BLOCK
      ?auto_436119 - BLOCK
      ?auto_436120 - BLOCK
      ?auto_436121 - BLOCK
      ?auto_436122 - BLOCK
      ?auto_436123 - BLOCK
    )
    :vars
    (
      ?auto_436124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436123 ?auto_436124 ) ( ON-TABLE ?auto_436112 ) ( ON ?auto_436113 ?auto_436112 ) ( ON ?auto_436114 ?auto_436113 ) ( ON ?auto_436115 ?auto_436114 ) ( ON ?auto_436116 ?auto_436115 ) ( not ( = ?auto_436112 ?auto_436113 ) ) ( not ( = ?auto_436112 ?auto_436114 ) ) ( not ( = ?auto_436112 ?auto_436115 ) ) ( not ( = ?auto_436112 ?auto_436116 ) ) ( not ( = ?auto_436112 ?auto_436117 ) ) ( not ( = ?auto_436112 ?auto_436118 ) ) ( not ( = ?auto_436112 ?auto_436119 ) ) ( not ( = ?auto_436112 ?auto_436120 ) ) ( not ( = ?auto_436112 ?auto_436121 ) ) ( not ( = ?auto_436112 ?auto_436122 ) ) ( not ( = ?auto_436112 ?auto_436123 ) ) ( not ( = ?auto_436112 ?auto_436124 ) ) ( not ( = ?auto_436113 ?auto_436114 ) ) ( not ( = ?auto_436113 ?auto_436115 ) ) ( not ( = ?auto_436113 ?auto_436116 ) ) ( not ( = ?auto_436113 ?auto_436117 ) ) ( not ( = ?auto_436113 ?auto_436118 ) ) ( not ( = ?auto_436113 ?auto_436119 ) ) ( not ( = ?auto_436113 ?auto_436120 ) ) ( not ( = ?auto_436113 ?auto_436121 ) ) ( not ( = ?auto_436113 ?auto_436122 ) ) ( not ( = ?auto_436113 ?auto_436123 ) ) ( not ( = ?auto_436113 ?auto_436124 ) ) ( not ( = ?auto_436114 ?auto_436115 ) ) ( not ( = ?auto_436114 ?auto_436116 ) ) ( not ( = ?auto_436114 ?auto_436117 ) ) ( not ( = ?auto_436114 ?auto_436118 ) ) ( not ( = ?auto_436114 ?auto_436119 ) ) ( not ( = ?auto_436114 ?auto_436120 ) ) ( not ( = ?auto_436114 ?auto_436121 ) ) ( not ( = ?auto_436114 ?auto_436122 ) ) ( not ( = ?auto_436114 ?auto_436123 ) ) ( not ( = ?auto_436114 ?auto_436124 ) ) ( not ( = ?auto_436115 ?auto_436116 ) ) ( not ( = ?auto_436115 ?auto_436117 ) ) ( not ( = ?auto_436115 ?auto_436118 ) ) ( not ( = ?auto_436115 ?auto_436119 ) ) ( not ( = ?auto_436115 ?auto_436120 ) ) ( not ( = ?auto_436115 ?auto_436121 ) ) ( not ( = ?auto_436115 ?auto_436122 ) ) ( not ( = ?auto_436115 ?auto_436123 ) ) ( not ( = ?auto_436115 ?auto_436124 ) ) ( not ( = ?auto_436116 ?auto_436117 ) ) ( not ( = ?auto_436116 ?auto_436118 ) ) ( not ( = ?auto_436116 ?auto_436119 ) ) ( not ( = ?auto_436116 ?auto_436120 ) ) ( not ( = ?auto_436116 ?auto_436121 ) ) ( not ( = ?auto_436116 ?auto_436122 ) ) ( not ( = ?auto_436116 ?auto_436123 ) ) ( not ( = ?auto_436116 ?auto_436124 ) ) ( not ( = ?auto_436117 ?auto_436118 ) ) ( not ( = ?auto_436117 ?auto_436119 ) ) ( not ( = ?auto_436117 ?auto_436120 ) ) ( not ( = ?auto_436117 ?auto_436121 ) ) ( not ( = ?auto_436117 ?auto_436122 ) ) ( not ( = ?auto_436117 ?auto_436123 ) ) ( not ( = ?auto_436117 ?auto_436124 ) ) ( not ( = ?auto_436118 ?auto_436119 ) ) ( not ( = ?auto_436118 ?auto_436120 ) ) ( not ( = ?auto_436118 ?auto_436121 ) ) ( not ( = ?auto_436118 ?auto_436122 ) ) ( not ( = ?auto_436118 ?auto_436123 ) ) ( not ( = ?auto_436118 ?auto_436124 ) ) ( not ( = ?auto_436119 ?auto_436120 ) ) ( not ( = ?auto_436119 ?auto_436121 ) ) ( not ( = ?auto_436119 ?auto_436122 ) ) ( not ( = ?auto_436119 ?auto_436123 ) ) ( not ( = ?auto_436119 ?auto_436124 ) ) ( not ( = ?auto_436120 ?auto_436121 ) ) ( not ( = ?auto_436120 ?auto_436122 ) ) ( not ( = ?auto_436120 ?auto_436123 ) ) ( not ( = ?auto_436120 ?auto_436124 ) ) ( not ( = ?auto_436121 ?auto_436122 ) ) ( not ( = ?auto_436121 ?auto_436123 ) ) ( not ( = ?auto_436121 ?auto_436124 ) ) ( not ( = ?auto_436122 ?auto_436123 ) ) ( not ( = ?auto_436122 ?auto_436124 ) ) ( not ( = ?auto_436123 ?auto_436124 ) ) ( ON ?auto_436122 ?auto_436123 ) ( ON ?auto_436121 ?auto_436122 ) ( ON ?auto_436120 ?auto_436121 ) ( ON ?auto_436119 ?auto_436120 ) ( ON ?auto_436118 ?auto_436119 ) ( CLEAR ?auto_436116 ) ( ON ?auto_436117 ?auto_436118 ) ( CLEAR ?auto_436117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_436112 ?auto_436113 ?auto_436114 ?auto_436115 ?auto_436116 ?auto_436117 )
      ( MAKE-12PILE ?auto_436112 ?auto_436113 ?auto_436114 ?auto_436115 ?auto_436116 ?auto_436117 ?auto_436118 ?auto_436119 ?auto_436120 ?auto_436121 ?auto_436122 ?auto_436123 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436137 - BLOCK
      ?auto_436138 - BLOCK
      ?auto_436139 - BLOCK
      ?auto_436140 - BLOCK
      ?auto_436141 - BLOCK
      ?auto_436142 - BLOCK
      ?auto_436143 - BLOCK
      ?auto_436144 - BLOCK
      ?auto_436145 - BLOCK
      ?auto_436146 - BLOCK
      ?auto_436147 - BLOCK
      ?auto_436148 - BLOCK
    )
    :vars
    (
      ?auto_436149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436148 ?auto_436149 ) ( ON-TABLE ?auto_436137 ) ( ON ?auto_436138 ?auto_436137 ) ( ON ?auto_436139 ?auto_436138 ) ( ON ?auto_436140 ?auto_436139 ) ( ON ?auto_436141 ?auto_436140 ) ( not ( = ?auto_436137 ?auto_436138 ) ) ( not ( = ?auto_436137 ?auto_436139 ) ) ( not ( = ?auto_436137 ?auto_436140 ) ) ( not ( = ?auto_436137 ?auto_436141 ) ) ( not ( = ?auto_436137 ?auto_436142 ) ) ( not ( = ?auto_436137 ?auto_436143 ) ) ( not ( = ?auto_436137 ?auto_436144 ) ) ( not ( = ?auto_436137 ?auto_436145 ) ) ( not ( = ?auto_436137 ?auto_436146 ) ) ( not ( = ?auto_436137 ?auto_436147 ) ) ( not ( = ?auto_436137 ?auto_436148 ) ) ( not ( = ?auto_436137 ?auto_436149 ) ) ( not ( = ?auto_436138 ?auto_436139 ) ) ( not ( = ?auto_436138 ?auto_436140 ) ) ( not ( = ?auto_436138 ?auto_436141 ) ) ( not ( = ?auto_436138 ?auto_436142 ) ) ( not ( = ?auto_436138 ?auto_436143 ) ) ( not ( = ?auto_436138 ?auto_436144 ) ) ( not ( = ?auto_436138 ?auto_436145 ) ) ( not ( = ?auto_436138 ?auto_436146 ) ) ( not ( = ?auto_436138 ?auto_436147 ) ) ( not ( = ?auto_436138 ?auto_436148 ) ) ( not ( = ?auto_436138 ?auto_436149 ) ) ( not ( = ?auto_436139 ?auto_436140 ) ) ( not ( = ?auto_436139 ?auto_436141 ) ) ( not ( = ?auto_436139 ?auto_436142 ) ) ( not ( = ?auto_436139 ?auto_436143 ) ) ( not ( = ?auto_436139 ?auto_436144 ) ) ( not ( = ?auto_436139 ?auto_436145 ) ) ( not ( = ?auto_436139 ?auto_436146 ) ) ( not ( = ?auto_436139 ?auto_436147 ) ) ( not ( = ?auto_436139 ?auto_436148 ) ) ( not ( = ?auto_436139 ?auto_436149 ) ) ( not ( = ?auto_436140 ?auto_436141 ) ) ( not ( = ?auto_436140 ?auto_436142 ) ) ( not ( = ?auto_436140 ?auto_436143 ) ) ( not ( = ?auto_436140 ?auto_436144 ) ) ( not ( = ?auto_436140 ?auto_436145 ) ) ( not ( = ?auto_436140 ?auto_436146 ) ) ( not ( = ?auto_436140 ?auto_436147 ) ) ( not ( = ?auto_436140 ?auto_436148 ) ) ( not ( = ?auto_436140 ?auto_436149 ) ) ( not ( = ?auto_436141 ?auto_436142 ) ) ( not ( = ?auto_436141 ?auto_436143 ) ) ( not ( = ?auto_436141 ?auto_436144 ) ) ( not ( = ?auto_436141 ?auto_436145 ) ) ( not ( = ?auto_436141 ?auto_436146 ) ) ( not ( = ?auto_436141 ?auto_436147 ) ) ( not ( = ?auto_436141 ?auto_436148 ) ) ( not ( = ?auto_436141 ?auto_436149 ) ) ( not ( = ?auto_436142 ?auto_436143 ) ) ( not ( = ?auto_436142 ?auto_436144 ) ) ( not ( = ?auto_436142 ?auto_436145 ) ) ( not ( = ?auto_436142 ?auto_436146 ) ) ( not ( = ?auto_436142 ?auto_436147 ) ) ( not ( = ?auto_436142 ?auto_436148 ) ) ( not ( = ?auto_436142 ?auto_436149 ) ) ( not ( = ?auto_436143 ?auto_436144 ) ) ( not ( = ?auto_436143 ?auto_436145 ) ) ( not ( = ?auto_436143 ?auto_436146 ) ) ( not ( = ?auto_436143 ?auto_436147 ) ) ( not ( = ?auto_436143 ?auto_436148 ) ) ( not ( = ?auto_436143 ?auto_436149 ) ) ( not ( = ?auto_436144 ?auto_436145 ) ) ( not ( = ?auto_436144 ?auto_436146 ) ) ( not ( = ?auto_436144 ?auto_436147 ) ) ( not ( = ?auto_436144 ?auto_436148 ) ) ( not ( = ?auto_436144 ?auto_436149 ) ) ( not ( = ?auto_436145 ?auto_436146 ) ) ( not ( = ?auto_436145 ?auto_436147 ) ) ( not ( = ?auto_436145 ?auto_436148 ) ) ( not ( = ?auto_436145 ?auto_436149 ) ) ( not ( = ?auto_436146 ?auto_436147 ) ) ( not ( = ?auto_436146 ?auto_436148 ) ) ( not ( = ?auto_436146 ?auto_436149 ) ) ( not ( = ?auto_436147 ?auto_436148 ) ) ( not ( = ?auto_436147 ?auto_436149 ) ) ( not ( = ?auto_436148 ?auto_436149 ) ) ( ON ?auto_436147 ?auto_436148 ) ( ON ?auto_436146 ?auto_436147 ) ( ON ?auto_436145 ?auto_436146 ) ( ON ?auto_436144 ?auto_436145 ) ( ON ?auto_436143 ?auto_436144 ) ( CLEAR ?auto_436141 ) ( ON ?auto_436142 ?auto_436143 ) ( CLEAR ?auto_436142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_436137 ?auto_436138 ?auto_436139 ?auto_436140 ?auto_436141 ?auto_436142 )
      ( MAKE-12PILE ?auto_436137 ?auto_436138 ?auto_436139 ?auto_436140 ?auto_436141 ?auto_436142 ?auto_436143 ?auto_436144 ?auto_436145 ?auto_436146 ?auto_436147 ?auto_436148 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436162 - BLOCK
      ?auto_436163 - BLOCK
      ?auto_436164 - BLOCK
      ?auto_436165 - BLOCK
      ?auto_436166 - BLOCK
      ?auto_436167 - BLOCK
      ?auto_436168 - BLOCK
      ?auto_436169 - BLOCK
      ?auto_436170 - BLOCK
      ?auto_436171 - BLOCK
      ?auto_436172 - BLOCK
      ?auto_436173 - BLOCK
    )
    :vars
    (
      ?auto_436174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436173 ?auto_436174 ) ( ON-TABLE ?auto_436162 ) ( ON ?auto_436163 ?auto_436162 ) ( ON ?auto_436164 ?auto_436163 ) ( ON ?auto_436165 ?auto_436164 ) ( not ( = ?auto_436162 ?auto_436163 ) ) ( not ( = ?auto_436162 ?auto_436164 ) ) ( not ( = ?auto_436162 ?auto_436165 ) ) ( not ( = ?auto_436162 ?auto_436166 ) ) ( not ( = ?auto_436162 ?auto_436167 ) ) ( not ( = ?auto_436162 ?auto_436168 ) ) ( not ( = ?auto_436162 ?auto_436169 ) ) ( not ( = ?auto_436162 ?auto_436170 ) ) ( not ( = ?auto_436162 ?auto_436171 ) ) ( not ( = ?auto_436162 ?auto_436172 ) ) ( not ( = ?auto_436162 ?auto_436173 ) ) ( not ( = ?auto_436162 ?auto_436174 ) ) ( not ( = ?auto_436163 ?auto_436164 ) ) ( not ( = ?auto_436163 ?auto_436165 ) ) ( not ( = ?auto_436163 ?auto_436166 ) ) ( not ( = ?auto_436163 ?auto_436167 ) ) ( not ( = ?auto_436163 ?auto_436168 ) ) ( not ( = ?auto_436163 ?auto_436169 ) ) ( not ( = ?auto_436163 ?auto_436170 ) ) ( not ( = ?auto_436163 ?auto_436171 ) ) ( not ( = ?auto_436163 ?auto_436172 ) ) ( not ( = ?auto_436163 ?auto_436173 ) ) ( not ( = ?auto_436163 ?auto_436174 ) ) ( not ( = ?auto_436164 ?auto_436165 ) ) ( not ( = ?auto_436164 ?auto_436166 ) ) ( not ( = ?auto_436164 ?auto_436167 ) ) ( not ( = ?auto_436164 ?auto_436168 ) ) ( not ( = ?auto_436164 ?auto_436169 ) ) ( not ( = ?auto_436164 ?auto_436170 ) ) ( not ( = ?auto_436164 ?auto_436171 ) ) ( not ( = ?auto_436164 ?auto_436172 ) ) ( not ( = ?auto_436164 ?auto_436173 ) ) ( not ( = ?auto_436164 ?auto_436174 ) ) ( not ( = ?auto_436165 ?auto_436166 ) ) ( not ( = ?auto_436165 ?auto_436167 ) ) ( not ( = ?auto_436165 ?auto_436168 ) ) ( not ( = ?auto_436165 ?auto_436169 ) ) ( not ( = ?auto_436165 ?auto_436170 ) ) ( not ( = ?auto_436165 ?auto_436171 ) ) ( not ( = ?auto_436165 ?auto_436172 ) ) ( not ( = ?auto_436165 ?auto_436173 ) ) ( not ( = ?auto_436165 ?auto_436174 ) ) ( not ( = ?auto_436166 ?auto_436167 ) ) ( not ( = ?auto_436166 ?auto_436168 ) ) ( not ( = ?auto_436166 ?auto_436169 ) ) ( not ( = ?auto_436166 ?auto_436170 ) ) ( not ( = ?auto_436166 ?auto_436171 ) ) ( not ( = ?auto_436166 ?auto_436172 ) ) ( not ( = ?auto_436166 ?auto_436173 ) ) ( not ( = ?auto_436166 ?auto_436174 ) ) ( not ( = ?auto_436167 ?auto_436168 ) ) ( not ( = ?auto_436167 ?auto_436169 ) ) ( not ( = ?auto_436167 ?auto_436170 ) ) ( not ( = ?auto_436167 ?auto_436171 ) ) ( not ( = ?auto_436167 ?auto_436172 ) ) ( not ( = ?auto_436167 ?auto_436173 ) ) ( not ( = ?auto_436167 ?auto_436174 ) ) ( not ( = ?auto_436168 ?auto_436169 ) ) ( not ( = ?auto_436168 ?auto_436170 ) ) ( not ( = ?auto_436168 ?auto_436171 ) ) ( not ( = ?auto_436168 ?auto_436172 ) ) ( not ( = ?auto_436168 ?auto_436173 ) ) ( not ( = ?auto_436168 ?auto_436174 ) ) ( not ( = ?auto_436169 ?auto_436170 ) ) ( not ( = ?auto_436169 ?auto_436171 ) ) ( not ( = ?auto_436169 ?auto_436172 ) ) ( not ( = ?auto_436169 ?auto_436173 ) ) ( not ( = ?auto_436169 ?auto_436174 ) ) ( not ( = ?auto_436170 ?auto_436171 ) ) ( not ( = ?auto_436170 ?auto_436172 ) ) ( not ( = ?auto_436170 ?auto_436173 ) ) ( not ( = ?auto_436170 ?auto_436174 ) ) ( not ( = ?auto_436171 ?auto_436172 ) ) ( not ( = ?auto_436171 ?auto_436173 ) ) ( not ( = ?auto_436171 ?auto_436174 ) ) ( not ( = ?auto_436172 ?auto_436173 ) ) ( not ( = ?auto_436172 ?auto_436174 ) ) ( not ( = ?auto_436173 ?auto_436174 ) ) ( ON ?auto_436172 ?auto_436173 ) ( ON ?auto_436171 ?auto_436172 ) ( ON ?auto_436170 ?auto_436171 ) ( ON ?auto_436169 ?auto_436170 ) ( ON ?auto_436168 ?auto_436169 ) ( ON ?auto_436167 ?auto_436168 ) ( CLEAR ?auto_436165 ) ( ON ?auto_436166 ?auto_436167 ) ( CLEAR ?auto_436166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_436162 ?auto_436163 ?auto_436164 ?auto_436165 ?auto_436166 )
      ( MAKE-12PILE ?auto_436162 ?auto_436163 ?auto_436164 ?auto_436165 ?auto_436166 ?auto_436167 ?auto_436168 ?auto_436169 ?auto_436170 ?auto_436171 ?auto_436172 ?auto_436173 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436187 - BLOCK
      ?auto_436188 - BLOCK
      ?auto_436189 - BLOCK
      ?auto_436190 - BLOCK
      ?auto_436191 - BLOCK
      ?auto_436192 - BLOCK
      ?auto_436193 - BLOCK
      ?auto_436194 - BLOCK
      ?auto_436195 - BLOCK
      ?auto_436196 - BLOCK
      ?auto_436197 - BLOCK
      ?auto_436198 - BLOCK
    )
    :vars
    (
      ?auto_436199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436198 ?auto_436199 ) ( ON-TABLE ?auto_436187 ) ( ON ?auto_436188 ?auto_436187 ) ( ON ?auto_436189 ?auto_436188 ) ( ON ?auto_436190 ?auto_436189 ) ( not ( = ?auto_436187 ?auto_436188 ) ) ( not ( = ?auto_436187 ?auto_436189 ) ) ( not ( = ?auto_436187 ?auto_436190 ) ) ( not ( = ?auto_436187 ?auto_436191 ) ) ( not ( = ?auto_436187 ?auto_436192 ) ) ( not ( = ?auto_436187 ?auto_436193 ) ) ( not ( = ?auto_436187 ?auto_436194 ) ) ( not ( = ?auto_436187 ?auto_436195 ) ) ( not ( = ?auto_436187 ?auto_436196 ) ) ( not ( = ?auto_436187 ?auto_436197 ) ) ( not ( = ?auto_436187 ?auto_436198 ) ) ( not ( = ?auto_436187 ?auto_436199 ) ) ( not ( = ?auto_436188 ?auto_436189 ) ) ( not ( = ?auto_436188 ?auto_436190 ) ) ( not ( = ?auto_436188 ?auto_436191 ) ) ( not ( = ?auto_436188 ?auto_436192 ) ) ( not ( = ?auto_436188 ?auto_436193 ) ) ( not ( = ?auto_436188 ?auto_436194 ) ) ( not ( = ?auto_436188 ?auto_436195 ) ) ( not ( = ?auto_436188 ?auto_436196 ) ) ( not ( = ?auto_436188 ?auto_436197 ) ) ( not ( = ?auto_436188 ?auto_436198 ) ) ( not ( = ?auto_436188 ?auto_436199 ) ) ( not ( = ?auto_436189 ?auto_436190 ) ) ( not ( = ?auto_436189 ?auto_436191 ) ) ( not ( = ?auto_436189 ?auto_436192 ) ) ( not ( = ?auto_436189 ?auto_436193 ) ) ( not ( = ?auto_436189 ?auto_436194 ) ) ( not ( = ?auto_436189 ?auto_436195 ) ) ( not ( = ?auto_436189 ?auto_436196 ) ) ( not ( = ?auto_436189 ?auto_436197 ) ) ( not ( = ?auto_436189 ?auto_436198 ) ) ( not ( = ?auto_436189 ?auto_436199 ) ) ( not ( = ?auto_436190 ?auto_436191 ) ) ( not ( = ?auto_436190 ?auto_436192 ) ) ( not ( = ?auto_436190 ?auto_436193 ) ) ( not ( = ?auto_436190 ?auto_436194 ) ) ( not ( = ?auto_436190 ?auto_436195 ) ) ( not ( = ?auto_436190 ?auto_436196 ) ) ( not ( = ?auto_436190 ?auto_436197 ) ) ( not ( = ?auto_436190 ?auto_436198 ) ) ( not ( = ?auto_436190 ?auto_436199 ) ) ( not ( = ?auto_436191 ?auto_436192 ) ) ( not ( = ?auto_436191 ?auto_436193 ) ) ( not ( = ?auto_436191 ?auto_436194 ) ) ( not ( = ?auto_436191 ?auto_436195 ) ) ( not ( = ?auto_436191 ?auto_436196 ) ) ( not ( = ?auto_436191 ?auto_436197 ) ) ( not ( = ?auto_436191 ?auto_436198 ) ) ( not ( = ?auto_436191 ?auto_436199 ) ) ( not ( = ?auto_436192 ?auto_436193 ) ) ( not ( = ?auto_436192 ?auto_436194 ) ) ( not ( = ?auto_436192 ?auto_436195 ) ) ( not ( = ?auto_436192 ?auto_436196 ) ) ( not ( = ?auto_436192 ?auto_436197 ) ) ( not ( = ?auto_436192 ?auto_436198 ) ) ( not ( = ?auto_436192 ?auto_436199 ) ) ( not ( = ?auto_436193 ?auto_436194 ) ) ( not ( = ?auto_436193 ?auto_436195 ) ) ( not ( = ?auto_436193 ?auto_436196 ) ) ( not ( = ?auto_436193 ?auto_436197 ) ) ( not ( = ?auto_436193 ?auto_436198 ) ) ( not ( = ?auto_436193 ?auto_436199 ) ) ( not ( = ?auto_436194 ?auto_436195 ) ) ( not ( = ?auto_436194 ?auto_436196 ) ) ( not ( = ?auto_436194 ?auto_436197 ) ) ( not ( = ?auto_436194 ?auto_436198 ) ) ( not ( = ?auto_436194 ?auto_436199 ) ) ( not ( = ?auto_436195 ?auto_436196 ) ) ( not ( = ?auto_436195 ?auto_436197 ) ) ( not ( = ?auto_436195 ?auto_436198 ) ) ( not ( = ?auto_436195 ?auto_436199 ) ) ( not ( = ?auto_436196 ?auto_436197 ) ) ( not ( = ?auto_436196 ?auto_436198 ) ) ( not ( = ?auto_436196 ?auto_436199 ) ) ( not ( = ?auto_436197 ?auto_436198 ) ) ( not ( = ?auto_436197 ?auto_436199 ) ) ( not ( = ?auto_436198 ?auto_436199 ) ) ( ON ?auto_436197 ?auto_436198 ) ( ON ?auto_436196 ?auto_436197 ) ( ON ?auto_436195 ?auto_436196 ) ( ON ?auto_436194 ?auto_436195 ) ( ON ?auto_436193 ?auto_436194 ) ( ON ?auto_436192 ?auto_436193 ) ( CLEAR ?auto_436190 ) ( ON ?auto_436191 ?auto_436192 ) ( CLEAR ?auto_436191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_436187 ?auto_436188 ?auto_436189 ?auto_436190 ?auto_436191 )
      ( MAKE-12PILE ?auto_436187 ?auto_436188 ?auto_436189 ?auto_436190 ?auto_436191 ?auto_436192 ?auto_436193 ?auto_436194 ?auto_436195 ?auto_436196 ?auto_436197 ?auto_436198 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436212 - BLOCK
      ?auto_436213 - BLOCK
      ?auto_436214 - BLOCK
      ?auto_436215 - BLOCK
      ?auto_436216 - BLOCK
      ?auto_436217 - BLOCK
      ?auto_436218 - BLOCK
      ?auto_436219 - BLOCK
      ?auto_436220 - BLOCK
      ?auto_436221 - BLOCK
      ?auto_436222 - BLOCK
      ?auto_436223 - BLOCK
    )
    :vars
    (
      ?auto_436224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436223 ?auto_436224 ) ( ON-TABLE ?auto_436212 ) ( ON ?auto_436213 ?auto_436212 ) ( ON ?auto_436214 ?auto_436213 ) ( not ( = ?auto_436212 ?auto_436213 ) ) ( not ( = ?auto_436212 ?auto_436214 ) ) ( not ( = ?auto_436212 ?auto_436215 ) ) ( not ( = ?auto_436212 ?auto_436216 ) ) ( not ( = ?auto_436212 ?auto_436217 ) ) ( not ( = ?auto_436212 ?auto_436218 ) ) ( not ( = ?auto_436212 ?auto_436219 ) ) ( not ( = ?auto_436212 ?auto_436220 ) ) ( not ( = ?auto_436212 ?auto_436221 ) ) ( not ( = ?auto_436212 ?auto_436222 ) ) ( not ( = ?auto_436212 ?auto_436223 ) ) ( not ( = ?auto_436212 ?auto_436224 ) ) ( not ( = ?auto_436213 ?auto_436214 ) ) ( not ( = ?auto_436213 ?auto_436215 ) ) ( not ( = ?auto_436213 ?auto_436216 ) ) ( not ( = ?auto_436213 ?auto_436217 ) ) ( not ( = ?auto_436213 ?auto_436218 ) ) ( not ( = ?auto_436213 ?auto_436219 ) ) ( not ( = ?auto_436213 ?auto_436220 ) ) ( not ( = ?auto_436213 ?auto_436221 ) ) ( not ( = ?auto_436213 ?auto_436222 ) ) ( not ( = ?auto_436213 ?auto_436223 ) ) ( not ( = ?auto_436213 ?auto_436224 ) ) ( not ( = ?auto_436214 ?auto_436215 ) ) ( not ( = ?auto_436214 ?auto_436216 ) ) ( not ( = ?auto_436214 ?auto_436217 ) ) ( not ( = ?auto_436214 ?auto_436218 ) ) ( not ( = ?auto_436214 ?auto_436219 ) ) ( not ( = ?auto_436214 ?auto_436220 ) ) ( not ( = ?auto_436214 ?auto_436221 ) ) ( not ( = ?auto_436214 ?auto_436222 ) ) ( not ( = ?auto_436214 ?auto_436223 ) ) ( not ( = ?auto_436214 ?auto_436224 ) ) ( not ( = ?auto_436215 ?auto_436216 ) ) ( not ( = ?auto_436215 ?auto_436217 ) ) ( not ( = ?auto_436215 ?auto_436218 ) ) ( not ( = ?auto_436215 ?auto_436219 ) ) ( not ( = ?auto_436215 ?auto_436220 ) ) ( not ( = ?auto_436215 ?auto_436221 ) ) ( not ( = ?auto_436215 ?auto_436222 ) ) ( not ( = ?auto_436215 ?auto_436223 ) ) ( not ( = ?auto_436215 ?auto_436224 ) ) ( not ( = ?auto_436216 ?auto_436217 ) ) ( not ( = ?auto_436216 ?auto_436218 ) ) ( not ( = ?auto_436216 ?auto_436219 ) ) ( not ( = ?auto_436216 ?auto_436220 ) ) ( not ( = ?auto_436216 ?auto_436221 ) ) ( not ( = ?auto_436216 ?auto_436222 ) ) ( not ( = ?auto_436216 ?auto_436223 ) ) ( not ( = ?auto_436216 ?auto_436224 ) ) ( not ( = ?auto_436217 ?auto_436218 ) ) ( not ( = ?auto_436217 ?auto_436219 ) ) ( not ( = ?auto_436217 ?auto_436220 ) ) ( not ( = ?auto_436217 ?auto_436221 ) ) ( not ( = ?auto_436217 ?auto_436222 ) ) ( not ( = ?auto_436217 ?auto_436223 ) ) ( not ( = ?auto_436217 ?auto_436224 ) ) ( not ( = ?auto_436218 ?auto_436219 ) ) ( not ( = ?auto_436218 ?auto_436220 ) ) ( not ( = ?auto_436218 ?auto_436221 ) ) ( not ( = ?auto_436218 ?auto_436222 ) ) ( not ( = ?auto_436218 ?auto_436223 ) ) ( not ( = ?auto_436218 ?auto_436224 ) ) ( not ( = ?auto_436219 ?auto_436220 ) ) ( not ( = ?auto_436219 ?auto_436221 ) ) ( not ( = ?auto_436219 ?auto_436222 ) ) ( not ( = ?auto_436219 ?auto_436223 ) ) ( not ( = ?auto_436219 ?auto_436224 ) ) ( not ( = ?auto_436220 ?auto_436221 ) ) ( not ( = ?auto_436220 ?auto_436222 ) ) ( not ( = ?auto_436220 ?auto_436223 ) ) ( not ( = ?auto_436220 ?auto_436224 ) ) ( not ( = ?auto_436221 ?auto_436222 ) ) ( not ( = ?auto_436221 ?auto_436223 ) ) ( not ( = ?auto_436221 ?auto_436224 ) ) ( not ( = ?auto_436222 ?auto_436223 ) ) ( not ( = ?auto_436222 ?auto_436224 ) ) ( not ( = ?auto_436223 ?auto_436224 ) ) ( ON ?auto_436222 ?auto_436223 ) ( ON ?auto_436221 ?auto_436222 ) ( ON ?auto_436220 ?auto_436221 ) ( ON ?auto_436219 ?auto_436220 ) ( ON ?auto_436218 ?auto_436219 ) ( ON ?auto_436217 ?auto_436218 ) ( ON ?auto_436216 ?auto_436217 ) ( CLEAR ?auto_436214 ) ( ON ?auto_436215 ?auto_436216 ) ( CLEAR ?auto_436215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_436212 ?auto_436213 ?auto_436214 ?auto_436215 )
      ( MAKE-12PILE ?auto_436212 ?auto_436213 ?auto_436214 ?auto_436215 ?auto_436216 ?auto_436217 ?auto_436218 ?auto_436219 ?auto_436220 ?auto_436221 ?auto_436222 ?auto_436223 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436237 - BLOCK
      ?auto_436238 - BLOCK
      ?auto_436239 - BLOCK
      ?auto_436240 - BLOCK
      ?auto_436241 - BLOCK
      ?auto_436242 - BLOCK
      ?auto_436243 - BLOCK
      ?auto_436244 - BLOCK
      ?auto_436245 - BLOCK
      ?auto_436246 - BLOCK
      ?auto_436247 - BLOCK
      ?auto_436248 - BLOCK
    )
    :vars
    (
      ?auto_436249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436248 ?auto_436249 ) ( ON-TABLE ?auto_436237 ) ( ON ?auto_436238 ?auto_436237 ) ( ON ?auto_436239 ?auto_436238 ) ( not ( = ?auto_436237 ?auto_436238 ) ) ( not ( = ?auto_436237 ?auto_436239 ) ) ( not ( = ?auto_436237 ?auto_436240 ) ) ( not ( = ?auto_436237 ?auto_436241 ) ) ( not ( = ?auto_436237 ?auto_436242 ) ) ( not ( = ?auto_436237 ?auto_436243 ) ) ( not ( = ?auto_436237 ?auto_436244 ) ) ( not ( = ?auto_436237 ?auto_436245 ) ) ( not ( = ?auto_436237 ?auto_436246 ) ) ( not ( = ?auto_436237 ?auto_436247 ) ) ( not ( = ?auto_436237 ?auto_436248 ) ) ( not ( = ?auto_436237 ?auto_436249 ) ) ( not ( = ?auto_436238 ?auto_436239 ) ) ( not ( = ?auto_436238 ?auto_436240 ) ) ( not ( = ?auto_436238 ?auto_436241 ) ) ( not ( = ?auto_436238 ?auto_436242 ) ) ( not ( = ?auto_436238 ?auto_436243 ) ) ( not ( = ?auto_436238 ?auto_436244 ) ) ( not ( = ?auto_436238 ?auto_436245 ) ) ( not ( = ?auto_436238 ?auto_436246 ) ) ( not ( = ?auto_436238 ?auto_436247 ) ) ( not ( = ?auto_436238 ?auto_436248 ) ) ( not ( = ?auto_436238 ?auto_436249 ) ) ( not ( = ?auto_436239 ?auto_436240 ) ) ( not ( = ?auto_436239 ?auto_436241 ) ) ( not ( = ?auto_436239 ?auto_436242 ) ) ( not ( = ?auto_436239 ?auto_436243 ) ) ( not ( = ?auto_436239 ?auto_436244 ) ) ( not ( = ?auto_436239 ?auto_436245 ) ) ( not ( = ?auto_436239 ?auto_436246 ) ) ( not ( = ?auto_436239 ?auto_436247 ) ) ( not ( = ?auto_436239 ?auto_436248 ) ) ( not ( = ?auto_436239 ?auto_436249 ) ) ( not ( = ?auto_436240 ?auto_436241 ) ) ( not ( = ?auto_436240 ?auto_436242 ) ) ( not ( = ?auto_436240 ?auto_436243 ) ) ( not ( = ?auto_436240 ?auto_436244 ) ) ( not ( = ?auto_436240 ?auto_436245 ) ) ( not ( = ?auto_436240 ?auto_436246 ) ) ( not ( = ?auto_436240 ?auto_436247 ) ) ( not ( = ?auto_436240 ?auto_436248 ) ) ( not ( = ?auto_436240 ?auto_436249 ) ) ( not ( = ?auto_436241 ?auto_436242 ) ) ( not ( = ?auto_436241 ?auto_436243 ) ) ( not ( = ?auto_436241 ?auto_436244 ) ) ( not ( = ?auto_436241 ?auto_436245 ) ) ( not ( = ?auto_436241 ?auto_436246 ) ) ( not ( = ?auto_436241 ?auto_436247 ) ) ( not ( = ?auto_436241 ?auto_436248 ) ) ( not ( = ?auto_436241 ?auto_436249 ) ) ( not ( = ?auto_436242 ?auto_436243 ) ) ( not ( = ?auto_436242 ?auto_436244 ) ) ( not ( = ?auto_436242 ?auto_436245 ) ) ( not ( = ?auto_436242 ?auto_436246 ) ) ( not ( = ?auto_436242 ?auto_436247 ) ) ( not ( = ?auto_436242 ?auto_436248 ) ) ( not ( = ?auto_436242 ?auto_436249 ) ) ( not ( = ?auto_436243 ?auto_436244 ) ) ( not ( = ?auto_436243 ?auto_436245 ) ) ( not ( = ?auto_436243 ?auto_436246 ) ) ( not ( = ?auto_436243 ?auto_436247 ) ) ( not ( = ?auto_436243 ?auto_436248 ) ) ( not ( = ?auto_436243 ?auto_436249 ) ) ( not ( = ?auto_436244 ?auto_436245 ) ) ( not ( = ?auto_436244 ?auto_436246 ) ) ( not ( = ?auto_436244 ?auto_436247 ) ) ( not ( = ?auto_436244 ?auto_436248 ) ) ( not ( = ?auto_436244 ?auto_436249 ) ) ( not ( = ?auto_436245 ?auto_436246 ) ) ( not ( = ?auto_436245 ?auto_436247 ) ) ( not ( = ?auto_436245 ?auto_436248 ) ) ( not ( = ?auto_436245 ?auto_436249 ) ) ( not ( = ?auto_436246 ?auto_436247 ) ) ( not ( = ?auto_436246 ?auto_436248 ) ) ( not ( = ?auto_436246 ?auto_436249 ) ) ( not ( = ?auto_436247 ?auto_436248 ) ) ( not ( = ?auto_436247 ?auto_436249 ) ) ( not ( = ?auto_436248 ?auto_436249 ) ) ( ON ?auto_436247 ?auto_436248 ) ( ON ?auto_436246 ?auto_436247 ) ( ON ?auto_436245 ?auto_436246 ) ( ON ?auto_436244 ?auto_436245 ) ( ON ?auto_436243 ?auto_436244 ) ( ON ?auto_436242 ?auto_436243 ) ( ON ?auto_436241 ?auto_436242 ) ( CLEAR ?auto_436239 ) ( ON ?auto_436240 ?auto_436241 ) ( CLEAR ?auto_436240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_436237 ?auto_436238 ?auto_436239 ?auto_436240 )
      ( MAKE-12PILE ?auto_436237 ?auto_436238 ?auto_436239 ?auto_436240 ?auto_436241 ?auto_436242 ?auto_436243 ?auto_436244 ?auto_436245 ?auto_436246 ?auto_436247 ?auto_436248 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436262 - BLOCK
      ?auto_436263 - BLOCK
      ?auto_436264 - BLOCK
      ?auto_436265 - BLOCK
      ?auto_436266 - BLOCK
      ?auto_436267 - BLOCK
      ?auto_436268 - BLOCK
      ?auto_436269 - BLOCK
      ?auto_436270 - BLOCK
      ?auto_436271 - BLOCK
      ?auto_436272 - BLOCK
      ?auto_436273 - BLOCK
    )
    :vars
    (
      ?auto_436274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436273 ?auto_436274 ) ( ON-TABLE ?auto_436262 ) ( ON ?auto_436263 ?auto_436262 ) ( not ( = ?auto_436262 ?auto_436263 ) ) ( not ( = ?auto_436262 ?auto_436264 ) ) ( not ( = ?auto_436262 ?auto_436265 ) ) ( not ( = ?auto_436262 ?auto_436266 ) ) ( not ( = ?auto_436262 ?auto_436267 ) ) ( not ( = ?auto_436262 ?auto_436268 ) ) ( not ( = ?auto_436262 ?auto_436269 ) ) ( not ( = ?auto_436262 ?auto_436270 ) ) ( not ( = ?auto_436262 ?auto_436271 ) ) ( not ( = ?auto_436262 ?auto_436272 ) ) ( not ( = ?auto_436262 ?auto_436273 ) ) ( not ( = ?auto_436262 ?auto_436274 ) ) ( not ( = ?auto_436263 ?auto_436264 ) ) ( not ( = ?auto_436263 ?auto_436265 ) ) ( not ( = ?auto_436263 ?auto_436266 ) ) ( not ( = ?auto_436263 ?auto_436267 ) ) ( not ( = ?auto_436263 ?auto_436268 ) ) ( not ( = ?auto_436263 ?auto_436269 ) ) ( not ( = ?auto_436263 ?auto_436270 ) ) ( not ( = ?auto_436263 ?auto_436271 ) ) ( not ( = ?auto_436263 ?auto_436272 ) ) ( not ( = ?auto_436263 ?auto_436273 ) ) ( not ( = ?auto_436263 ?auto_436274 ) ) ( not ( = ?auto_436264 ?auto_436265 ) ) ( not ( = ?auto_436264 ?auto_436266 ) ) ( not ( = ?auto_436264 ?auto_436267 ) ) ( not ( = ?auto_436264 ?auto_436268 ) ) ( not ( = ?auto_436264 ?auto_436269 ) ) ( not ( = ?auto_436264 ?auto_436270 ) ) ( not ( = ?auto_436264 ?auto_436271 ) ) ( not ( = ?auto_436264 ?auto_436272 ) ) ( not ( = ?auto_436264 ?auto_436273 ) ) ( not ( = ?auto_436264 ?auto_436274 ) ) ( not ( = ?auto_436265 ?auto_436266 ) ) ( not ( = ?auto_436265 ?auto_436267 ) ) ( not ( = ?auto_436265 ?auto_436268 ) ) ( not ( = ?auto_436265 ?auto_436269 ) ) ( not ( = ?auto_436265 ?auto_436270 ) ) ( not ( = ?auto_436265 ?auto_436271 ) ) ( not ( = ?auto_436265 ?auto_436272 ) ) ( not ( = ?auto_436265 ?auto_436273 ) ) ( not ( = ?auto_436265 ?auto_436274 ) ) ( not ( = ?auto_436266 ?auto_436267 ) ) ( not ( = ?auto_436266 ?auto_436268 ) ) ( not ( = ?auto_436266 ?auto_436269 ) ) ( not ( = ?auto_436266 ?auto_436270 ) ) ( not ( = ?auto_436266 ?auto_436271 ) ) ( not ( = ?auto_436266 ?auto_436272 ) ) ( not ( = ?auto_436266 ?auto_436273 ) ) ( not ( = ?auto_436266 ?auto_436274 ) ) ( not ( = ?auto_436267 ?auto_436268 ) ) ( not ( = ?auto_436267 ?auto_436269 ) ) ( not ( = ?auto_436267 ?auto_436270 ) ) ( not ( = ?auto_436267 ?auto_436271 ) ) ( not ( = ?auto_436267 ?auto_436272 ) ) ( not ( = ?auto_436267 ?auto_436273 ) ) ( not ( = ?auto_436267 ?auto_436274 ) ) ( not ( = ?auto_436268 ?auto_436269 ) ) ( not ( = ?auto_436268 ?auto_436270 ) ) ( not ( = ?auto_436268 ?auto_436271 ) ) ( not ( = ?auto_436268 ?auto_436272 ) ) ( not ( = ?auto_436268 ?auto_436273 ) ) ( not ( = ?auto_436268 ?auto_436274 ) ) ( not ( = ?auto_436269 ?auto_436270 ) ) ( not ( = ?auto_436269 ?auto_436271 ) ) ( not ( = ?auto_436269 ?auto_436272 ) ) ( not ( = ?auto_436269 ?auto_436273 ) ) ( not ( = ?auto_436269 ?auto_436274 ) ) ( not ( = ?auto_436270 ?auto_436271 ) ) ( not ( = ?auto_436270 ?auto_436272 ) ) ( not ( = ?auto_436270 ?auto_436273 ) ) ( not ( = ?auto_436270 ?auto_436274 ) ) ( not ( = ?auto_436271 ?auto_436272 ) ) ( not ( = ?auto_436271 ?auto_436273 ) ) ( not ( = ?auto_436271 ?auto_436274 ) ) ( not ( = ?auto_436272 ?auto_436273 ) ) ( not ( = ?auto_436272 ?auto_436274 ) ) ( not ( = ?auto_436273 ?auto_436274 ) ) ( ON ?auto_436272 ?auto_436273 ) ( ON ?auto_436271 ?auto_436272 ) ( ON ?auto_436270 ?auto_436271 ) ( ON ?auto_436269 ?auto_436270 ) ( ON ?auto_436268 ?auto_436269 ) ( ON ?auto_436267 ?auto_436268 ) ( ON ?auto_436266 ?auto_436267 ) ( ON ?auto_436265 ?auto_436266 ) ( CLEAR ?auto_436263 ) ( ON ?auto_436264 ?auto_436265 ) ( CLEAR ?auto_436264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_436262 ?auto_436263 ?auto_436264 )
      ( MAKE-12PILE ?auto_436262 ?auto_436263 ?auto_436264 ?auto_436265 ?auto_436266 ?auto_436267 ?auto_436268 ?auto_436269 ?auto_436270 ?auto_436271 ?auto_436272 ?auto_436273 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436287 - BLOCK
      ?auto_436288 - BLOCK
      ?auto_436289 - BLOCK
      ?auto_436290 - BLOCK
      ?auto_436291 - BLOCK
      ?auto_436292 - BLOCK
      ?auto_436293 - BLOCK
      ?auto_436294 - BLOCK
      ?auto_436295 - BLOCK
      ?auto_436296 - BLOCK
      ?auto_436297 - BLOCK
      ?auto_436298 - BLOCK
    )
    :vars
    (
      ?auto_436299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436298 ?auto_436299 ) ( ON-TABLE ?auto_436287 ) ( ON ?auto_436288 ?auto_436287 ) ( not ( = ?auto_436287 ?auto_436288 ) ) ( not ( = ?auto_436287 ?auto_436289 ) ) ( not ( = ?auto_436287 ?auto_436290 ) ) ( not ( = ?auto_436287 ?auto_436291 ) ) ( not ( = ?auto_436287 ?auto_436292 ) ) ( not ( = ?auto_436287 ?auto_436293 ) ) ( not ( = ?auto_436287 ?auto_436294 ) ) ( not ( = ?auto_436287 ?auto_436295 ) ) ( not ( = ?auto_436287 ?auto_436296 ) ) ( not ( = ?auto_436287 ?auto_436297 ) ) ( not ( = ?auto_436287 ?auto_436298 ) ) ( not ( = ?auto_436287 ?auto_436299 ) ) ( not ( = ?auto_436288 ?auto_436289 ) ) ( not ( = ?auto_436288 ?auto_436290 ) ) ( not ( = ?auto_436288 ?auto_436291 ) ) ( not ( = ?auto_436288 ?auto_436292 ) ) ( not ( = ?auto_436288 ?auto_436293 ) ) ( not ( = ?auto_436288 ?auto_436294 ) ) ( not ( = ?auto_436288 ?auto_436295 ) ) ( not ( = ?auto_436288 ?auto_436296 ) ) ( not ( = ?auto_436288 ?auto_436297 ) ) ( not ( = ?auto_436288 ?auto_436298 ) ) ( not ( = ?auto_436288 ?auto_436299 ) ) ( not ( = ?auto_436289 ?auto_436290 ) ) ( not ( = ?auto_436289 ?auto_436291 ) ) ( not ( = ?auto_436289 ?auto_436292 ) ) ( not ( = ?auto_436289 ?auto_436293 ) ) ( not ( = ?auto_436289 ?auto_436294 ) ) ( not ( = ?auto_436289 ?auto_436295 ) ) ( not ( = ?auto_436289 ?auto_436296 ) ) ( not ( = ?auto_436289 ?auto_436297 ) ) ( not ( = ?auto_436289 ?auto_436298 ) ) ( not ( = ?auto_436289 ?auto_436299 ) ) ( not ( = ?auto_436290 ?auto_436291 ) ) ( not ( = ?auto_436290 ?auto_436292 ) ) ( not ( = ?auto_436290 ?auto_436293 ) ) ( not ( = ?auto_436290 ?auto_436294 ) ) ( not ( = ?auto_436290 ?auto_436295 ) ) ( not ( = ?auto_436290 ?auto_436296 ) ) ( not ( = ?auto_436290 ?auto_436297 ) ) ( not ( = ?auto_436290 ?auto_436298 ) ) ( not ( = ?auto_436290 ?auto_436299 ) ) ( not ( = ?auto_436291 ?auto_436292 ) ) ( not ( = ?auto_436291 ?auto_436293 ) ) ( not ( = ?auto_436291 ?auto_436294 ) ) ( not ( = ?auto_436291 ?auto_436295 ) ) ( not ( = ?auto_436291 ?auto_436296 ) ) ( not ( = ?auto_436291 ?auto_436297 ) ) ( not ( = ?auto_436291 ?auto_436298 ) ) ( not ( = ?auto_436291 ?auto_436299 ) ) ( not ( = ?auto_436292 ?auto_436293 ) ) ( not ( = ?auto_436292 ?auto_436294 ) ) ( not ( = ?auto_436292 ?auto_436295 ) ) ( not ( = ?auto_436292 ?auto_436296 ) ) ( not ( = ?auto_436292 ?auto_436297 ) ) ( not ( = ?auto_436292 ?auto_436298 ) ) ( not ( = ?auto_436292 ?auto_436299 ) ) ( not ( = ?auto_436293 ?auto_436294 ) ) ( not ( = ?auto_436293 ?auto_436295 ) ) ( not ( = ?auto_436293 ?auto_436296 ) ) ( not ( = ?auto_436293 ?auto_436297 ) ) ( not ( = ?auto_436293 ?auto_436298 ) ) ( not ( = ?auto_436293 ?auto_436299 ) ) ( not ( = ?auto_436294 ?auto_436295 ) ) ( not ( = ?auto_436294 ?auto_436296 ) ) ( not ( = ?auto_436294 ?auto_436297 ) ) ( not ( = ?auto_436294 ?auto_436298 ) ) ( not ( = ?auto_436294 ?auto_436299 ) ) ( not ( = ?auto_436295 ?auto_436296 ) ) ( not ( = ?auto_436295 ?auto_436297 ) ) ( not ( = ?auto_436295 ?auto_436298 ) ) ( not ( = ?auto_436295 ?auto_436299 ) ) ( not ( = ?auto_436296 ?auto_436297 ) ) ( not ( = ?auto_436296 ?auto_436298 ) ) ( not ( = ?auto_436296 ?auto_436299 ) ) ( not ( = ?auto_436297 ?auto_436298 ) ) ( not ( = ?auto_436297 ?auto_436299 ) ) ( not ( = ?auto_436298 ?auto_436299 ) ) ( ON ?auto_436297 ?auto_436298 ) ( ON ?auto_436296 ?auto_436297 ) ( ON ?auto_436295 ?auto_436296 ) ( ON ?auto_436294 ?auto_436295 ) ( ON ?auto_436293 ?auto_436294 ) ( ON ?auto_436292 ?auto_436293 ) ( ON ?auto_436291 ?auto_436292 ) ( ON ?auto_436290 ?auto_436291 ) ( CLEAR ?auto_436288 ) ( ON ?auto_436289 ?auto_436290 ) ( CLEAR ?auto_436289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_436287 ?auto_436288 ?auto_436289 )
      ( MAKE-12PILE ?auto_436287 ?auto_436288 ?auto_436289 ?auto_436290 ?auto_436291 ?auto_436292 ?auto_436293 ?auto_436294 ?auto_436295 ?auto_436296 ?auto_436297 ?auto_436298 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436312 - BLOCK
      ?auto_436313 - BLOCK
      ?auto_436314 - BLOCK
      ?auto_436315 - BLOCK
      ?auto_436316 - BLOCK
      ?auto_436317 - BLOCK
      ?auto_436318 - BLOCK
      ?auto_436319 - BLOCK
      ?auto_436320 - BLOCK
      ?auto_436321 - BLOCK
      ?auto_436322 - BLOCK
      ?auto_436323 - BLOCK
    )
    :vars
    (
      ?auto_436324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436323 ?auto_436324 ) ( ON-TABLE ?auto_436312 ) ( not ( = ?auto_436312 ?auto_436313 ) ) ( not ( = ?auto_436312 ?auto_436314 ) ) ( not ( = ?auto_436312 ?auto_436315 ) ) ( not ( = ?auto_436312 ?auto_436316 ) ) ( not ( = ?auto_436312 ?auto_436317 ) ) ( not ( = ?auto_436312 ?auto_436318 ) ) ( not ( = ?auto_436312 ?auto_436319 ) ) ( not ( = ?auto_436312 ?auto_436320 ) ) ( not ( = ?auto_436312 ?auto_436321 ) ) ( not ( = ?auto_436312 ?auto_436322 ) ) ( not ( = ?auto_436312 ?auto_436323 ) ) ( not ( = ?auto_436312 ?auto_436324 ) ) ( not ( = ?auto_436313 ?auto_436314 ) ) ( not ( = ?auto_436313 ?auto_436315 ) ) ( not ( = ?auto_436313 ?auto_436316 ) ) ( not ( = ?auto_436313 ?auto_436317 ) ) ( not ( = ?auto_436313 ?auto_436318 ) ) ( not ( = ?auto_436313 ?auto_436319 ) ) ( not ( = ?auto_436313 ?auto_436320 ) ) ( not ( = ?auto_436313 ?auto_436321 ) ) ( not ( = ?auto_436313 ?auto_436322 ) ) ( not ( = ?auto_436313 ?auto_436323 ) ) ( not ( = ?auto_436313 ?auto_436324 ) ) ( not ( = ?auto_436314 ?auto_436315 ) ) ( not ( = ?auto_436314 ?auto_436316 ) ) ( not ( = ?auto_436314 ?auto_436317 ) ) ( not ( = ?auto_436314 ?auto_436318 ) ) ( not ( = ?auto_436314 ?auto_436319 ) ) ( not ( = ?auto_436314 ?auto_436320 ) ) ( not ( = ?auto_436314 ?auto_436321 ) ) ( not ( = ?auto_436314 ?auto_436322 ) ) ( not ( = ?auto_436314 ?auto_436323 ) ) ( not ( = ?auto_436314 ?auto_436324 ) ) ( not ( = ?auto_436315 ?auto_436316 ) ) ( not ( = ?auto_436315 ?auto_436317 ) ) ( not ( = ?auto_436315 ?auto_436318 ) ) ( not ( = ?auto_436315 ?auto_436319 ) ) ( not ( = ?auto_436315 ?auto_436320 ) ) ( not ( = ?auto_436315 ?auto_436321 ) ) ( not ( = ?auto_436315 ?auto_436322 ) ) ( not ( = ?auto_436315 ?auto_436323 ) ) ( not ( = ?auto_436315 ?auto_436324 ) ) ( not ( = ?auto_436316 ?auto_436317 ) ) ( not ( = ?auto_436316 ?auto_436318 ) ) ( not ( = ?auto_436316 ?auto_436319 ) ) ( not ( = ?auto_436316 ?auto_436320 ) ) ( not ( = ?auto_436316 ?auto_436321 ) ) ( not ( = ?auto_436316 ?auto_436322 ) ) ( not ( = ?auto_436316 ?auto_436323 ) ) ( not ( = ?auto_436316 ?auto_436324 ) ) ( not ( = ?auto_436317 ?auto_436318 ) ) ( not ( = ?auto_436317 ?auto_436319 ) ) ( not ( = ?auto_436317 ?auto_436320 ) ) ( not ( = ?auto_436317 ?auto_436321 ) ) ( not ( = ?auto_436317 ?auto_436322 ) ) ( not ( = ?auto_436317 ?auto_436323 ) ) ( not ( = ?auto_436317 ?auto_436324 ) ) ( not ( = ?auto_436318 ?auto_436319 ) ) ( not ( = ?auto_436318 ?auto_436320 ) ) ( not ( = ?auto_436318 ?auto_436321 ) ) ( not ( = ?auto_436318 ?auto_436322 ) ) ( not ( = ?auto_436318 ?auto_436323 ) ) ( not ( = ?auto_436318 ?auto_436324 ) ) ( not ( = ?auto_436319 ?auto_436320 ) ) ( not ( = ?auto_436319 ?auto_436321 ) ) ( not ( = ?auto_436319 ?auto_436322 ) ) ( not ( = ?auto_436319 ?auto_436323 ) ) ( not ( = ?auto_436319 ?auto_436324 ) ) ( not ( = ?auto_436320 ?auto_436321 ) ) ( not ( = ?auto_436320 ?auto_436322 ) ) ( not ( = ?auto_436320 ?auto_436323 ) ) ( not ( = ?auto_436320 ?auto_436324 ) ) ( not ( = ?auto_436321 ?auto_436322 ) ) ( not ( = ?auto_436321 ?auto_436323 ) ) ( not ( = ?auto_436321 ?auto_436324 ) ) ( not ( = ?auto_436322 ?auto_436323 ) ) ( not ( = ?auto_436322 ?auto_436324 ) ) ( not ( = ?auto_436323 ?auto_436324 ) ) ( ON ?auto_436322 ?auto_436323 ) ( ON ?auto_436321 ?auto_436322 ) ( ON ?auto_436320 ?auto_436321 ) ( ON ?auto_436319 ?auto_436320 ) ( ON ?auto_436318 ?auto_436319 ) ( ON ?auto_436317 ?auto_436318 ) ( ON ?auto_436316 ?auto_436317 ) ( ON ?auto_436315 ?auto_436316 ) ( ON ?auto_436314 ?auto_436315 ) ( CLEAR ?auto_436312 ) ( ON ?auto_436313 ?auto_436314 ) ( CLEAR ?auto_436313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_436312 ?auto_436313 )
      ( MAKE-12PILE ?auto_436312 ?auto_436313 ?auto_436314 ?auto_436315 ?auto_436316 ?auto_436317 ?auto_436318 ?auto_436319 ?auto_436320 ?auto_436321 ?auto_436322 ?auto_436323 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436337 - BLOCK
      ?auto_436338 - BLOCK
      ?auto_436339 - BLOCK
      ?auto_436340 - BLOCK
      ?auto_436341 - BLOCK
      ?auto_436342 - BLOCK
      ?auto_436343 - BLOCK
      ?auto_436344 - BLOCK
      ?auto_436345 - BLOCK
      ?auto_436346 - BLOCK
      ?auto_436347 - BLOCK
      ?auto_436348 - BLOCK
    )
    :vars
    (
      ?auto_436349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436348 ?auto_436349 ) ( ON-TABLE ?auto_436337 ) ( not ( = ?auto_436337 ?auto_436338 ) ) ( not ( = ?auto_436337 ?auto_436339 ) ) ( not ( = ?auto_436337 ?auto_436340 ) ) ( not ( = ?auto_436337 ?auto_436341 ) ) ( not ( = ?auto_436337 ?auto_436342 ) ) ( not ( = ?auto_436337 ?auto_436343 ) ) ( not ( = ?auto_436337 ?auto_436344 ) ) ( not ( = ?auto_436337 ?auto_436345 ) ) ( not ( = ?auto_436337 ?auto_436346 ) ) ( not ( = ?auto_436337 ?auto_436347 ) ) ( not ( = ?auto_436337 ?auto_436348 ) ) ( not ( = ?auto_436337 ?auto_436349 ) ) ( not ( = ?auto_436338 ?auto_436339 ) ) ( not ( = ?auto_436338 ?auto_436340 ) ) ( not ( = ?auto_436338 ?auto_436341 ) ) ( not ( = ?auto_436338 ?auto_436342 ) ) ( not ( = ?auto_436338 ?auto_436343 ) ) ( not ( = ?auto_436338 ?auto_436344 ) ) ( not ( = ?auto_436338 ?auto_436345 ) ) ( not ( = ?auto_436338 ?auto_436346 ) ) ( not ( = ?auto_436338 ?auto_436347 ) ) ( not ( = ?auto_436338 ?auto_436348 ) ) ( not ( = ?auto_436338 ?auto_436349 ) ) ( not ( = ?auto_436339 ?auto_436340 ) ) ( not ( = ?auto_436339 ?auto_436341 ) ) ( not ( = ?auto_436339 ?auto_436342 ) ) ( not ( = ?auto_436339 ?auto_436343 ) ) ( not ( = ?auto_436339 ?auto_436344 ) ) ( not ( = ?auto_436339 ?auto_436345 ) ) ( not ( = ?auto_436339 ?auto_436346 ) ) ( not ( = ?auto_436339 ?auto_436347 ) ) ( not ( = ?auto_436339 ?auto_436348 ) ) ( not ( = ?auto_436339 ?auto_436349 ) ) ( not ( = ?auto_436340 ?auto_436341 ) ) ( not ( = ?auto_436340 ?auto_436342 ) ) ( not ( = ?auto_436340 ?auto_436343 ) ) ( not ( = ?auto_436340 ?auto_436344 ) ) ( not ( = ?auto_436340 ?auto_436345 ) ) ( not ( = ?auto_436340 ?auto_436346 ) ) ( not ( = ?auto_436340 ?auto_436347 ) ) ( not ( = ?auto_436340 ?auto_436348 ) ) ( not ( = ?auto_436340 ?auto_436349 ) ) ( not ( = ?auto_436341 ?auto_436342 ) ) ( not ( = ?auto_436341 ?auto_436343 ) ) ( not ( = ?auto_436341 ?auto_436344 ) ) ( not ( = ?auto_436341 ?auto_436345 ) ) ( not ( = ?auto_436341 ?auto_436346 ) ) ( not ( = ?auto_436341 ?auto_436347 ) ) ( not ( = ?auto_436341 ?auto_436348 ) ) ( not ( = ?auto_436341 ?auto_436349 ) ) ( not ( = ?auto_436342 ?auto_436343 ) ) ( not ( = ?auto_436342 ?auto_436344 ) ) ( not ( = ?auto_436342 ?auto_436345 ) ) ( not ( = ?auto_436342 ?auto_436346 ) ) ( not ( = ?auto_436342 ?auto_436347 ) ) ( not ( = ?auto_436342 ?auto_436348 ) ) ( not ( = ?auto_436342 ?auto_436349 ) ) ( not ( = ?auto_436343 ?auto_436344 ) ) ( not ( = ?auto_436343 ?auto_436345 ) ) ( not ( = ?auto_436343 ?auto_436346 ) ) ( not ( = ?auto_436343 ?auto_436347 ) ) ( not ( = ?auto_436343 ?auto_436348 ) ) ( not ( = ?auto_436343 ?auto_436349 ) ) ( not ( = ?auto_436344 ?auto_436345 ) ) ( not ( = ?auto_436344 ?auto_436346 ) ) ( not ( = ?auto_436344 ?auto_436347 ) ) ( not ( = ?auto_436344 ?auto_436348 ) ) ( not ( = ?auto_436344 ?auto_436349 ) ) ( not ( = ?auto_436345 ?auto_436346 ) ) ( not ( = ?auto_436345 ?auto_436347 ) ) ( not ( = ?auto_436345 ?auto_436348 ) ) ( not ( = ?auto_436345 ?auto_436349 ) ) ( not ( = ?auto_436346 ?auto_436347 ) ) ( not ( = ?auto_436346 ?auto_436348 ) ) ( not ( = ?auto_436346 ?auto_436349 ) ) ( not ( = ?auto_436347 ?auto_436348 ) ) ( not ( = ?auto_436347 ?auto_436349 ) ) ( not ( = ?auto_436348 ?auto_436349 ) ) ( ON ?auto_436347 ?auto_436348 ) ( ON ?auto_436346 ?auto_436347 ) ( ON ?auto_436345 ?auto_436346 ) ( ON ?auto_436344 ?auto_436345 ) ( ON ?auto_436343 ?auto_436344 ) ( ON ?auto_436342 ?auto_436343 ) ( ON ?auto_436341 ?auto_436342 ) ( ON ?auto_436340 ?auto_436341 ) ( ON ?auto_436339 ?auto_436340 ) ( CLEAR ?auto_436337 ) ( ON ?auto_436338 ?auto_436339 ) ( CLEAR ?auto_436338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_436337 ?auto_436338 )
      ( MAKE-12PILE ?auto_436337 ?auto_436338 ?auto_436339 ?auto_436340 ?auto_436341 ?auto_436342 ?auto_436343 ?auto_436344 ?auto_436345 ?auto_436346 ?auto_436347 ?auto_436348 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436362 - BLOCK
      ?auto_436363 - BLOCK
      ?auto_436364 - BLOCK
      ?auto_436365 - BLOCK
      ?auto_436366 - BLOCK
      ?auto_436367 - BLOCK
      ?auto_436368 - BLOCK
      ?auto_436369 - BLOCK
      ?auto_436370 - BLOCK
      ?auto_436371 - BLOCK
      ?auto_436372 - BLOCK
      ?auto_436373 - BLOCK
    )
    :vars
    (
      ?auto_436374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436373 ?auto_436374 ) ( not ( = ?auto_436362 ?auto_436363 ) ) ( not ( = ?auto_436362 ?auto_436364 ) ) ( not ( = ?auto_436362 ?auto_436365 ) ) ( not ( = ?auto_436362 ?auto_436366 ) ) ( not ( = ?auto_436362 ?auto_436367 ) ) ( not ( = ?auto_436362 ?auto_436368 ) ) ( not ( = ?auto_436362 ?auto_436369 ) ) ( not ( = ?auto_436362 ?auto_436370 ) ) ( not ( = ?auto_436362 ?auto_436371 ) ) ( not ( = ?auto_436362 ?auto_436372 ) ) ( not ( = ?auto_436362 ?auto_436373 ) ) ( not ( = ?auto_436362 ?auto_436374 ) ) ( not ( = ?auto_436363 ?auto_436364 ) ) ( not ( = ?auto_436363 ?auto_436365 ) ) ( not ( = ?auto_436363 ?auto_436366 ) ) ( not ( = ?auto_436363 ?auto_436367 ) ) ( not ( = ?auto_436363 ?auto_436368 ) ) ( not ( = ?auto_436363 ?auto_436369 ) ) ( not ( = ?auto_436363 ?auto_436370 ) ) ( not ( = ?auto_436363 ?auto_436371 ) ) ( not ( = ?auto_436363 ?auto_436372 ) ) ( not ( = ?auto_436363 ?auto_436373 ) ) ( not ( = ?auto_436363 ?auto_436374 ) ) ( not ( = ?auto_436364 ?auto_436365 ) ) ( not ( = ?auto_436364 ?auto_436366 ) ) ( not ( = ?auto_436364 ?auto_436367 ) ) ( not ( = ?auto_436364 ?auto_436368 ) ) ( not ( = ?auto_436364 ?auto_436369 ) ) ( not ( = ?auto_436364 ?auto_436370 ) ) ( not ( = ?auto_436364 ?auto_436371 ) ) ( not ( = ?auto_436364 ?auto_436372 ) ) ( not ( = ?auto_436364 ?auto_436373 ) ) ( not ( = ?auto_436364 ?auto_436374 ) ) ( not ( = ?auto_436365 ?auto_436366 ) ) ( not ( = ?auto_436365 ?auto_436367 ) ) ( not ( = ?auto_436365 ?auto_436368 ) ) ( not ( = ?auto_436365 ?auto_436369 ) ) ( not ( = ?auto_436365 ?auto_436370 ) ) ( not ( = ?auto_436365 ?auto_436371 ) ) ( not ( = ?auto_436365 ?auto_436372 ) ) ( not ( = ?auto_436365 ?auto_436373 ) ) ( not ( = ?auto_436365 ?auto_436374 ) ) ( not ( = ?auto_436366 ?auto_436367 ) ) ( not ( = ?auto_436366 ?auto_436368 ) ) ( not ( = ?auto_436366 ?auto_436369 ) ) ( not ( = ?auto_436366 ?auto_436370 ) ) ( not ( = ?auto_436366 ?auto_436371 ) ) ( not ( = ?auto_436366 ?auto_436372 ) ) ( not ( = ?auto_436366 ?auto_436373 ) ) ( not ( = ?auto_436366 ?auto_436374 ) ) ( not ( = ?auto_436367 ?auto_436368 ) ) ( not ( = ?auto_436367 ?auto_436369 ) ) ( not ( = ?auto_436367 ?auto_436370 ) ) ( not ( = ?auto_436367 ?auto_436371 ) ) ( not ( = ?auto_436367 ?auto_436372 ) ) ( not ( = ?auto_436367 ?auto_436373 ) ) ( not ( = ?auto_436367 ?auto_436374 ) ) ( not ( = ?auto_436368 ?auto_436369 ) ) ( not ( = ?auto_436368 ?auto_436370 ) ) ( not ( = ?auto_436368 ?auto_436371 ) ) ( not ( = ?auto_436368 ?auto_436372 ) ) ( not ( = ?auto_436368 ?auto_436373 ) ) ( not ( = ?auto_436368 ?auto_436374 ) ) ( not ( = ?auto_436369 ?auto_436370 ) ) ( not ( = ?auto_436369 ?auto_436371 ) ) ( not ( = ?auto_436369 ?auto_436372 ) ) ( not ( = ?auto_436369 ?auto_436373 ) ) ( not ( = ?auto_436369 ?auto_436374 ) ) ( not ( = ?auto_436370 ?auto_436371 ) ) ( not ( = ?auto_436370 ?auto_436372 ) ) ( not ( = ?auto_436370 ?auto_436373 ) ) ( not ( = ?auto_436370 ?auto_436374 ) ) ( not ( = ?auto_436371 ?auto_436372 ) ) ( not ( = ?auto_436371 ?auto_436373 ) ) ( not ( = ?auto_436371 ?auto_436374 ) ) ( not ( = ?auto_436372 ?auto_436373 ) ) ( not ( = ?auto_436372 ?auto_436374 ) ) ( not ( = ?auto_436373 ?auto_436374 ) ) ( ON ?auto_436372 ?auto_436373 ) ( ON ?auto_436371 ?auto_436372 ) ( ON ?auto_436370 ?auto_436371 ) ( ON ?auto_436369 ?auto_436370 ) ( ON ?auto_436368 ?auto_436369 ) ( ON ?auto_436367 ?auto_436368 ) ( ON ?auto_436366 ?auto_436367 ) ( ON ?auto_436365 ?auto_436366 ) ( ON ?auto_436364 ?auto_436365 ) ( ON ?auto_436363 ?auto_436364 ) ( ON ?auto_436362 ?auto_436363 ) ( CLEAR ?auto_436362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_436362 )
      ( MAKE-12PILE ?auto_436362 ?auto_436363 ?auto_436364 ?auto_436365 ?auto_436366 ?auto_436367 ?auto_436368 ?auto_436369 ?auto_436370 ?auto_436371 ?auto_436372 ?auto_436373 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_436387 - BLOCK
      ?auto_436388 - BLOCK
      ?auto_436389 - BLOCK
      ?auto_436390 - BLOCK
      ?auto_436391 - BLOCK
      ?auto_436392 - BLOCK
      ?auto_436393 - BLOCK
      ?auto_436394 - BLOCK
      ?auto_436395 - BLOCK
      ?auto_436396 - BLOCK
      ?auto_436397 - BLOCK
      ?auto_436398 - BLOCK
    )
    :vars
    (
      ?auto_436399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436398 ?auto_436399 ) ( not ( = ?auto_436387 ?auto_436388 ) ) ( not ( = ?auto_436387 ?auto_436389 ) ) ( not ( = ?auto_436387 ?auto_436390 ) ) ( not ( = ?auto_436387 ?auto_436391 ) ) ( not ( = ?auto_436387 ?auto_436392 ) ) ( not ( = ?auto_436387 ?auto_436393 ) ) ( not ( = ?auto_436387 ?auto_436394 ) ) ( not ( = ?auto_436387 ?auto_436395 ) ) ( not ( = ?auto_436387 ?auto_436396 ) ) ( not ( = ?auto_436387 ?auto_436397 ) ) ( not ( = ?auto_436387 ?auto_436398 ) ) ( not ( = ?auto_436387 ?auto_436399 ) ) ( not ( = ?auto_436388 ?auto_436389 ) ) ( not ( = ?auto_436388 ?auto_436390 ) ) ( not ( = ?auto_436388 ?auto_436391 ) ) ( not ( = ?auto_436388 ?auto_436392 ) ) ( not ( = ?auto_436388 ?auto_436393 ) ) ( not ( = ?auto_436388 ?auto_436394 ) ) ( not ( = ?auto_436388 ?auto_436395 ) ) ( not ( = ?auto_436388 ?auto_436396 ) ) ( not ( = ?auto_436388 ?auto_436397 ) ) ( not ( = ?auto_436388 ?auto_436398 ) ) ( not ( = ?auto_436388 ?auto_436399 ) ) ( not ( = ?auto_436389 ?auto_436390 ) ) ( not ( = ?auto_436389 ?auto_436391 ) ) ( not ( = ?auto_436389 ?auto_436392 ) ) ( not ( = ?auto_436389 ?auto_436393 ) ) ( not ( = ?auto_436389 ?auto_436394 ) ) ( not ( = ?auto_436389 ?auto_436395 ) ) ( not ( = ?auto_436389 ?auto_436396 ) ) ( not ( = ?auto_436389 ?auto_436397 ) ) ( not ( = ?auto_436389 ?auto_436398 ) ) ( not ( = ?auto_436389 ?auto_436399 ) ) ( not ( = ?auto_436390 ?auto_436391 ) ) ( not ( = ?auto_436390 ?auto_436392 ) ) ( not ( = ?auto_436390 ?auto_436393 ) ) ( not ( = ?auto_436390 ?auto_436394 ) ) ( not ( = ?auto_436390 ?auto_436395 ) ) ( not ( = ?auto_436390 ?auto_436396 ) ) ( not ( = ?auto_436390 ?auto_436397 ) ) ( not ( = ?auto_436390 ?auto_436398 ) ) ( not ( = ?auto_436390 ?auto_436399 ) ) ( not ( = ?auto_436391 ?auto_436392 ) ) ( not ( = ?auto_436391 ?auto_436393 ) ) ( not ( = ?auto_436391 ?auto_436394 ) ) ( not ( = ?auto_436391 ?auto_436395 ) ) ( not ( = ?auto_436391 ?auto_436396 ) ) ( not ( = ?auto_436391 ?auto_436397 ) ) ( not ( = ?auto_436391 ?auto_436398 ) ) ( not ( = ?auto_436391 ?auto_436399 ) ) ( not ( = ?auto_436392 ?auto_436393 ) ) ( not ( = ?auto_436392 ?auto_436394 ) ) ( not ( = ?auto_436392 ?auto_436395 ) ) ( not ( = ?auto_436392 ?auto_436396 ) ) ( not ( = ?auto_436392 ?auto_436397 ) ) ( not ( = ?auto_436392 ?auto_436398 ) ) ( not ( = ?auto_436392 ?auto_436399 ) ) ( not ( = ?auto_436393 ?auto_436394 ) ) ( not ( = ?auto_436393 ?auto_436395 ) ) ( not ( = ?auto_436393 ?auto_436396 ) ) ( not ( = ?auto_436393 ?auto_436397 ) ) ( not ( = ?auto_436393 ?auto_436398 ) ) ( not ( = ?auto_436393 ?auto_436399 ) ) ( not ( = ?auto_436394 ?auto_436395 ) ) ( not ( = ?auto_436394 ?auto_436396 ) ) ( not ( = ?auto_436394 ?auto_436397 ) ) ( not ( = ?auto_436394 ?auto_436398 ) ) ( not ( = ?auto_436394 ?auto_436399 ) ) ( not ( = ?auto_436395 ?auto_436396 ) ) ( not ( = ?auto_436395 ?auto_436397 ) ) ( not ( = ?auto_436395 ?auto_436398 ) ) ( not ( = ?auto_436395 ?auto_436399 ) ) ( not ( = ?auto_436396 ?auto_436397 ) ) ( not ( = ?auto_436396 ?auto_436398 ) ) ( not ( = ?auto_436396 ?auto_436399 ) ) ( not ( = ?auto_436397 ?auto_436398 ) ) ( not ( = ?auto_436397 ?auto_436399 ) ) ( not ( = ?auto_436398 ?auto_436399 ) ) ( ON ?auto_436397 ?auto_436398 ) ( ON ?auto_436396 ?auto_436397 ) ( ON ?auto_436395 ?auto_436396 ) ( ON ?auto_436394 ?auto_436395 ) ( ON ?auto_436393 ?auto_436394 ) ( ON ?auto_436392 ?auto_436393 ) ( ON ?auto_436391 ?auto_436392 ) ( ON ?auto_436390 ?auto_436391 ) ( ON ?auto_436389 ?auto_436390 ) ( ON ?auto_436388 ?auto_436389 ) ( ON ?auto_436387 ?auto_436388 ) ( CLEAR ?auto_436387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_436387 )
      ( MAKE-12PILE ?auto_436387 ?auto_436388 ?auto_436389 ?auto_436390 ?auto_436391 ?auto_436392 ?auto_436393 ?auto_436394 ?auto_436395 ?auto_436396 ?auto_436397 ?auto_436398 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436413 - BLOCK
      ?auto_436414 - BLOCK
      ?auto_436415 - BLOCK
      ?auto_436416 - BLOCK
      ?auto_436417 - BLOCK
      ?auto_436418 - BLOCK
      ?auto_436419 - BLOCK
      ?auto_436420 - BLOCK
      ?auto_436421 - BLOCK
      ?auto_436422 - BLOCK
      ?auto_436423 - BLOCK
      ?auto_436424 - BLOCK
      ?auto_436425 - BLOCK
    )
    :vars
    (
      ?auto_436426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_436424 ) ( ON ?auto_436425 ?auto_436426 ) ( CLEAR ?auto_436425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_436413 ) ( ON ?auto_436414 ?auto_436413 ) ( ON ?auto_436415 ?auto_436414 ) ( ON ?auto_436416 ?auto_436415 ) ( ON ?auto_436417 ?auto_436416 ) ( ON ?auto_436418 ?auto_436417 ) ( ON ?auto_436419 ?auto_436418 ) ( ON ?auto_436420 ?auto_436419 ) ( ON ?auto_436421 ?auto_436420 ) ( ON ?auto_436422 ?auto_436421 ) ( ON ?auto_436423 ?auto_436422 ) ( ON ?auto_436424 ?auto_436423 ) ( not ( = ?auto_436413 ?auto_436414 ) ) ( not ( = ?auto_436413 ?auto_436415 ) ) ( not ( = ?auto_436413 ?auto_436416 ) ) ( not ( = ?auto_436413 ?auto_436417 ) ) ( not ( = ?auto_436413 ?auto_436418 ) ) ( not ( = ?auto_436413 ?auto_436419 ) ) ( not ( = ?auto_436413 ?auto_436420 ) ) ( not ( = ?auto_436413 ?auto_436421 ) ) ( not ( = ?auto_436413 ?auto_436422 ) ) ( not ( = ?auto_436413 ?auto_436423 ) ) ( not ( = ?auto_436413 ?auto_436424 ) ) ( not ( = ?auto_436413 ?auto_436425 ) ) ( not ( = ?auto_436413 ?auto_436426 ) ) ( not ( = ?auto_436414 ?auto_436415 ) ) ( not ( = ?auto_436414 ?auto_436416 ) ) ( not ( = ?auto_436414 ?auto_436417 ) ) ( not ( = ?auto_436414 ?auto_436418 ) ) ( not ( = ?auto_436414 ?auto_436419 ) ) ( not ( = ?auto_436414 ?auto_436420 ) ) ( not ( = ?auto_436414 ?auto_436421 ) ) ( not ( = ?auto_436414 ?auto_436422 ) ) ( not ( = ?auto_436414 ?auto_436423 ) ) ( not ( = ?auto_436414 ?auto_436424 ) ) ( not ( = ?auto_436414 ?auto_436425 ) ) ( not ( = ?auto_436414 ?auto_436426 ) ) ( not ( = ?auto_436415 ?auto_436416 ) ) ( not ( = ?auto_436415 ?auto_436417 ) ) ( not ( = ?auto_436415 ?auto_436418 ) ) ( not ( = ?auto_436415 ?auto_436419 ) ) ( not ( = ?auto_436415 ?auto_436420 ) ) ( not ( = ?auto_436415 ?auto_436421 ) ) ( not ( = ?auto_436415 ?auto_436422 ) ) ( not ( = ?auto_436415 ?auto_436423 ) ) ( not ( = ?auto_436415 ?auto_436424 ) ) ( not ( = ?auto_436415 ?auto_436425 ) ) ( not ( = ?auto_436415 ?auto_436426 ) ) ( not ( = ?auto_436416 ?auto_436417 ) ) ( not ( = ?auto_436416 ?auto_436418 ) ) ( not ( = ?auto_436416 ?auto_436419 ) ) ( not ( = ?auto_436416 ?auto_436420 ) ) ( not ( = ?auto_436416 ?auto_436421 ) ) ( not ( = ?auto_436416 ?auto_436422 ) ) ( not ( = ?auto_436416 ?auto_436423 ) ) ( not ( = ?auto_436416 ?auto_436424 ) ) ( not ( = ?auto_436416 ?auto_436425 ) ) ( not ( = ?auto_436416 ?auto_436426 ) ) ( not ( = ?auto_436417 ?auto_436418 ) ) ( not ( = ?auto_436417 ?auto_436419 ) ) ( not ( = ?auto_436417 ?auto_436420 ) ) ( not ( = ?auto_436417 ?auto_436421 ) ) ( not ( = ?auto_436417 ?auto_436422 ) ) ( not ( = ?auto_436417 ?auto_436423 ) ) ( not ( = ?auto_436417 ?auto_436424 ) ) ( not ( = ?auto_436417 ?auto_436425 ) ) ( not ( = ?auto_436417 ?auto_436426 ) ) ( not ( = ?auto_436418 ?auto_436419 ) ) ( not ( = ?auto_436418 ?auto_436420 ) ) ( not ( = ?auto_436418 ?auto_436421 ) ) ( not ( = ?auto_436418 ?auto_436422 ) ) ( not ( = ?auto_436418 ?auto_436423 ) ) ( not ( = ?auto_436418 ?auto_436424 ) ) ( not ( = ?auto_436418 ?auto_436425 ) ) ( not ( = ?auto_436418 ?auto_436426 ) ) ( not ( = ?auto_436419 ?auto_436420 ) ) ( not ( = ?auto_436419 ?auto_436421 ) ) ( not ( = ?auto_436419 ?auto_436422 ) ) ( not ( = ?auto_436419 ?auto_436423 ) ) ( not ( = ?auto_436419 ?auto_436424 ) ) ( not ( = ?auto_436419 ?auto_436425 ) ) ( not ( = ?auto_436419 ?auto_436426 ) ) ( not ( = ?auto_436420 ?auto_436421 ) ) ( not ( = ?auto_436420 ?auto_436422 ) ) ( not ( = ?auto_436420 ?auto_436423 ) ) ( not ( = ?auto_436420 ?auto_436424 ) ) ( not ( = ?auto_436420 ?auto_436425 ) ) ( not ( = ?auto_436420 ?auto_436426 ) ) ( not ( = ?auto_436421 ?auto_436422 ) ) ( not ( = ?auto_436421 ?auto_436423 ) ) ( not ( = ?auto_436421 ?auto_436424 ) ) ( not ( = ?auto_436421 ?auto_436425 ) ) ( not ( = ?auto_436421 ?auto_436426 ) ) ( not ( = ?auto_436422 ?auto_436423 ) ) ( not ( = ?auto_436422 ?auto_436424 ) ) ( not ( = ?auto_436422 ?auto_436425 ) ) ( not ( = ?auto_436422 ?auto_436426 ) ) ( not ( = ?auto_436423 ?auto_436424 ) ) ( not ( = ?auto_436423 ?auto_436425 ) ) ( not ( = ?auto_436423 ?auto_436426 ) ) ( not ( = ?auto_436424 ?auto_436425 ) ) ( not ( = ?auto_436424 ?auto_436426 ) ) ( not ( = ?auto_436425 ?auto_436426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_436425 ?auto_436426 )
      ( !STACK ?auto_436425 ?auto_436424 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436440 - BLOCK
      ?auto_436441 - BLOCK
      ?auto_436442 - BLOCK
      ?auto_436443 - BLOCK
      ?auto_436444 - BLOCK
      ?auto_436445 - BLOCK
      ?auto_436446 - BLOCK
      ?auto_436447 - BLOCK
      ?auto_436448 - BLOCK
      ?auto_436449 - BLOCK
      ?auto_436450 - BLOCK
      ?auto_436451 - BLOCK
      ?auto_436452 - BLOCK
    )
    :vars
    (
      ?auto_436453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_436451 ) ( ON ?auto_436452 ?auto_436453 ) ( CLEAR ?auto_436452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_436440 ) ( ON ?auto_436441 ?auto_436440 ) ( ON ?auto_436442 ?auto_436441 ) ( ON ?auto_436443 ?auto_436442 ) ( ON ?auto_436444 ?auto_436443 ) ( ON ?auto_436445 ?auto_436444 ) ( ON ?auto_436446 ?auto_436445 ) ( ON ?auto_436447 ?auto_436446 ) ( ON ?auto_436448 ?auto_436447 ) ( ON ?auto_436449 ?auto_436448 ) ( ON ?auto_436450 ?auto_436449 ) ( ON ?auto_436451 ?auto_436450 ) ( not ( = ?auto_436440 ?auto_436441 ) ) ( not ( = ?auto_436440 ?auto_436442 ) ) ( not ( = ?auto_436440 ?auto_436443 ) ) ( not ( = ?auto_436440 ?auto_436444 ) ) ( not ( = ?auto_436440 ?auto_436445 ) ) ( not ( = ?auto_436440 ?auto_436446 ) ) ( not ( = ?auto_436440 ?auto_436447 ) ) ( not ( = ?auto_436440 ?auto_436448 ) ) ( not ( = ?auto_436440 ?auto_436449 ) ) ( not ( = ?auto_436440 ?auto_436450 ) ) ( not ( = ?auto_436440 ?auto_436451 ) ) ( not ( = ?auto_436440 ?auto_436452 ) ) ( not ( = ?auto_436440 ?auto_436453 ) ) ( not ( = ?auto_436441 ?auto_436442 ) ) ( not ( = ?auto_436441 ?auto_436443 ) ) ( not ( = ?auto_436441 ?auto_436444 ) ) ( not ( = ?auto_436441 ?auto_436445 ) ) ( not ( = ?auto_436441 ?auto_436446 ) ) ( not ( = ?auto_436441 ?auto_436447 ) ) ( not ( = ?auto_436441 ?auto_436448 ) ) ( not ( = ?auto_436441 ?auto_436449 ) ) ( not ( = ?auto_436441 ?auto_436450 ) ) ( not ( = ?auto_436441 ?auto_436451 ) ) ( not ( = ?auto_436441 ?auto_436452 ) ) ( not ( = ?auto_436441 ?auto_436453 ) ) ( not ( = ?auto_436442 ?auto_436443 ) ) ( not ( = ?auto_436442 ?auto_436444 ) ) ( not ( = ?auto_436442 ?auto_436445 ) ) ( not ( = ?auto_436442 ?auto_436446 ) ) ( not ( = ?auto_436442 ?auto_436447 ) ) ( not ( = ?auto_436442 ?auto_436448 ) ) ( not ( = ?auto_436442 ?auto_436449 ) ) ( not ( = ?auto_436442 ?auto_436450 ) ) ( not ( = ?auto_436442 ?auto_436451 ) ) ( not ( = ?auto_436442 ?auto_436452 ) ) ( not ( = ?auto_436442 ?auto_436453 ) ) ( not ( = ?auto_436443 ?auto_436444 ) ) ( not ( = ?auto_436443 ?auto_436445 ) ) ( not ( = ?auto_436443 ?auto_436446 ) ) ( not ( = ?auto_436443 ?auto_436447 ) ) ( not ( = ?auto_436443 ?auto_436448 ) ) ( not ( = ?auto_436443 ?auto_436449 ) ) ( not ( = ?auto_436443 ?auto_436450 ) ) ( not ( = ?auto_436443 ?auto_436451 ) ) ( not ( = ?auto_436443 ?auto_436452 ) ) ( not ( = ?auto_436443 ?auto_436453 ) ) ( not ( = ?auto_436444 ?auto_436445 ) ) ( not ( = ?auto_436444 ?auto_436446 ) ) ( not ( = ?auto_436444 ?auto_436447 ) ) ( not ( = ?auto_436444 ?auto_436448 ) ) ( not ( = ?auto_436444 ?auto_436449 ) ) ( not ( = ?auto_436444 ?auto_436450 ) ) ( not ( = ?auto_436444 ?auto_436451 ) ) ( not ( = ?auto_436444 ?auto_436452 ) ) ( not ( = ?auto_436444 ?auto_436453 ) ) ( not ( = ?auto_436445 ?auto_436446 ) ) ( not ( = ?auto_436445 ?auto_436447 ) ) ( not ( = ?auto_436445 ?auto_436448 ) ) ( not ( = ?auto_436445 ?auto_436449 ) ) ( not ( = ?auto_436445 ?auto_436450 ) ) ( not ( = ?auto_436445 ?auto_436451 ) ) ( not ( = ?auto_436445 ?auto_436452 ) ) ( not ( = ?auto_436445 ?auto_436453 ) ) ( not ( = ?auto_436446 ?auto_436447 ) ) ( not ( = ?auto_436446 ?auto_436448 ) ) ( not ( = ?auto_436446 ?auto_436449 ) ) ( not ( = ?auto_436446 ?auto_436450 ) ) ( not ( = ?auto_436446 ?auto_436451 ) ) ( not ( = ?auto_436446 ?auto_436452 ) ) ( not ( = ?auto_436446 ?auto_436453 ) ) ( not ( = ?auto_436447 ?auto_436448 ) ) ( not ( = ?auto_436447 ?auto_436449 ) ) ( not ( = ?auto_436447 ?auto_436450 ) ) ( not ( = ?auto_436447 ?auto_436451 ) ) ( not ( = ?auto_436447 ?auto_436452 ) ) ( not ( = ?auto_436447 ?auto_436453 ) ) ( not ( = ?auto_436448 ?auto_436449 ) ) ( not ( = ?auto_436448 ?auto_436450 ) ) ( not ( = ?auto_436448 ?auto_436451 ) ) ( not ( = ?auto_436448 ?auto_436452 ) ) ( not ( = ?auto_436448 ?auto_436453 ) ) ( not ( = ?auto_436449 ?auto_436450 ) ) ( not ( = ?auto_436449 ?auto_436451 ) ) ( not ( = ?auto_436449 ?auto_436452 ) ) ( not ( = ?auto_436449 ?auto_436453 ) ) ( not ( = ?auto_436450 ?auto_436451 ) ) ( not ( = ?auto_436450 ?auto_436452 ) ) ( not ( = ?auto_436450 ?auto_436453 ) ) ( not ( = ?auto_436451 ?auto_436452 ) ) ( not ( = ?auto_436451 ?auto_436453 ) ) ( not ( = ?auto_436452 ?auto_436453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_436452 ?auto_436453 )
      ( !STACK ?auto_436452 ?auto_436451 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436467 - BLOCK
      ?auto_436468 - BLOCK
      ?auto_436469 - BLOCK
      ?auto_436470 - BLOCK
      ?auto_436471 - BLOCK
      ?auto_436472 - BLOCK
      ?auto_436473 - BLOCK
      ?auto_436474 - BLOCK
      ?auto_436475 - BLOCK
      ?auto_436476 - BLOCK
      ?auto_436477 - BLOCK
      ?auto_436478 - BLOCK
      ?auto_436479 - BLOCK
    )
    :vars
    (
      ?auto_436480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436479 ?auto_436480 ) ( ON-TABLE ?auto_436467 ) ( ON ?auto_436468 ?auto_436467 ) ( ON ?auto_436469 ?auto_436468 ) ( ON ?auto_436470 ?auto_436469 ) ( ON ?auto_436471 ?auto_436470 ) ( ON ?auto_436472 ?auto_436471 ) ( ON ?auto_436473 ?auto_436472 ) ( ON ?auto_436474 ?auto_436473 ) ( ON ?auto_436475 ?auto_436474 ) ( ON ?auto_436476 ?auto_436475 ) ( ON ?auto_436477 ?auto_436476 ) ( not ( = ?auto_436467 ?auto_436468 ) ) ( not ( = ?auto_436467 ?auto_436469 ) ) ( not ( = ?auto_436467 ?auto_436470 ) ) ( not ( = ?auto_436467 ?auto_436471 ) ) ( not ( = ?auto_436467 ?auto_436472 ) ) ( not ( = ?auto_436467 ?auto_436473 ) ) ( not ( = ?auto_436467 ?auto_436474 ) ) ( not ( = ?auto_436467 ?auto_436475 ) ) ( not ( = ?auto_436467 ?auto_436476 ) ) ( not ( = ?auto_436467 ?auto_436477 ) ) ( not ( = ?auto_436467 ?auto_436478 ) ) ( not ( = ?auto_436467 ?auto_436479 ) ) ( not ( = ?auto_436467 ?auto_436480 ) ) ( not ( = ?auto_436468 ?auto_436469 ) ) ( not ( = ?auto_436468 ?auto_436470 ) ) ( not ( = ?auto_436468 ?auto_436471 ) ) ( not ( = ?auto_436468 ?auto_436472 ) ) ( not ( = ?auto_436468 ?auto_436473 ) ) ( not ( = ?auto_436468 ?auto_436474 ) ) ( not ( = ?auto_436468 ?auto_436475 ) ) ( not ( = ?auto_436468 ?auto_436476 ) ) ( not ( = ?auto_436468 ?auto_436477 ) ) ( not ( = ?auto_436468 ?auto_436478 ) ) ( not ( = ?auto_436468 ?auto_436479 ) ) ( not ( = ?auto_436468 ?auto_436480 ) ) ( not ( = ?auto_436469 ?auto_436470 ) ) ( not ( = ?auto_436469 ?auto_436471 ) ) ( not ( = ?auto_436469 ?auto_436472 ) ) ( not ( = ?auto_436469 ?auto_436473 ) ) ( not ( = ?auto_436469 ?auto_436474 ) ) ( not ( = ?auto_436469 ?auto_436475 ) ) ( not ( = ?auto_436469 ?auto_436476 ) ) ( not ( = ?auto_436469 ?auto_436477 ) ) ( not ( = ?auto_436469 ?auto_436478 ) ) ( not ( = ?auto_436469 ?auto_436479 ) ) ( not ( = ?auto_436469 ?auto_436480 ) ) ( not ( = ?auto_436470 ?auto_436471 ) ) ( not ( = ?auto_436470 ?auto_436472 ) ) ( not ( = ?auto_436470 ?auto_436473 ) ) ( not ( = ?auto_436470 ?auto_436474 ) ) ( not ( = ?auto_436470 ?auto_436475 ) ) ( not ( = ?auto_436470 ?auto_436476 ) ) ( not ( = ?auto_436470 ?auto_436477 ) ) ( not ( = ?auto_436470 ?auto_436478 ) ) ( not ( = ?auto_436470 ?auto_436479 ) ) ( not ( = ?auto_436470 ?auto_436480 ) ) ( not ( = ?auto_436471 ?auto_436472 ) ) ( not ( = ?auto_436471 ?auto_436473 ) ) ( not ( = ?auto_436471 ?auto_436474 ) ) ( not ( = ?auto_436471 ?auto_436475 ) ) ( not ( = ?auto_436471 ?auto_436476 ) ) ( not ( = ?auto_436471 ?auto_436477 ) ) ( not ( = ?auto_436471 ?auto_436478 ) ) ( not ( = ?auto_436471 ?auto_436479 ) ) ( not ( = ?auto_436471 ?auto_436480 ) ) ( not ( = ?auto_436472 ?auto_436473 ) ) ( not ( = ?auto_436472 ?auto_436474 ) ) ( not ( = ?auto_436472 ?auto_436475 ) ) ( not ( = ?auto_436472 ?auto_436476 ) ) ( not ( = ?auto_436472 ?auto_436477 ) ) ( not ( = ?auto_436472 ?auto_436478 ) ) ( not ( = ?auto_436472 ?auto_436479 ) ) ( not ( = ?auto_436472 ?auto_436480 ) ) ( not ( = ?auto_436473 ?auto_436474 ) ) ( not ( = ?auto_436473 ?auto_436475 ) ) ( not ( = ?auto_436473 ?auto_436476 ) ) ( not ( = ?auto_436473 ?auto_436477 ) ) ( not ( = ?auto_436473 ?auto_436478 ) ) ( not ( = ?auto_436473 ?auto_436479 ) ) ( not ( = ?auto_436473 ?auto_436480 ) ) ( not ( = ?auto_436474 ?auto_436475 ) ) ( not ( = ?auto_436474 ?auto_436476 ) ) ( not ( = ?auto_436474 ?auto_436477 ) ) ( not ( = ?auto_436474 ?auto_436478 ) ) ( not ( = ?auto_436474 ?auto_436479 ) ) ( not ( = ?auto_436474 ?auto_436480 ) ) ( not ( = ?auto_436475 ?auto_436476 ) ) ( not ( = ?auto_436475 ?auto_436477 ) ) ( not ( = ?auto_436475 ?auto_436478 ) ) ( not ( = ?auto_436475 ?auto_436479 ) ) ( not ( = ?auto_436475 ?auto_436480 ) ) ( not ( = ?auto_436476 ?auto_436477 ) ) ( not ( = ?auto_436476 ?auto_436478 ) ) ( not ( = ?auto_436476 ?auto_436479 ) ) ( not ( = ?auto_436476 ?auto_436480 ) ) ( not ( = ?auto_436477 ?auto_436478 ) ) ( not ( = ?auto_436477 ?auto_436479 ) ) ( not ( = ?auto_436477 ?auto_436480 ) ) ( not ( = ?auto_436478 ?auto_436479 ) ) ( not ( = ?auto_436478 ?auto_436480 ) ) ( not ( = ?auto_436479 ?auto_436480 ) ) ( CLEAR ?auto_436477 ) ( ON ?auto_436478 ?auto_436479 ) ( CLEAR ?auto_436478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_436467 ?auto_436468 ?auto_436469 ?auto_436470 ?auto_436471 ?auto_436472 ?auto_436473 ?auto_436474 ?auto_436475 ?auto_436476 ?auto_436477 ?auto_436478 )
      ( MAKE-13PILE ?auto_436467 ?auto_436468 ?auto_436469 ?auto_436470 ?auto_436471 ?auto_436472 ?auto_436473 ?auto_436474 ?auto_436475 ?auto_436476 ?auto_436477 ?auto_436478 ?auto_436479 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436494 - BLOCK
      ?auto_436495 - BLOCK
      ?auto_436496 - BLOCK
      ?auto_436497 - BLOCK
      ?auto_436498 - BLOCK
      ?auto_436499 - BLOCK
      ?auto_436500 - BLOCK
      ?auto_436501 - BLOCK
      ?auto_436502 - BLOCK
      ?auto_436503 - BLOCK
      ?auto_436504 - BLOCK
      ?auto_436505 - BLOCK
      ?auto_436506 - BLOCK
    )
    :vars
    (
      ?auto_436507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436506 ?auto_436507 ) ( ON-TABLE ?auto_436494 ) ( ON ?auto_436495 ?auto_436494 ) ( ON ?auto_436496 ?auto_436495 ) ( ON ?auto_436497 ?auto_436496 ) ( ON ?auto_436498 ?auto_436497 ) ( ON ?auto_436499 ?auto_436498 ) ( ON ?auto_436500 ?auto_436499 ) ( ON ?auto_436501 ?auto_436500 ) ( ON ?auto_436502 ?auto_436501 ) ( ON ?auto_436503 ?auto_436502 ) ( ON ?auto_436504 ?auto_436503 ) ( not ( = ?auto_436494 ?auto_436495 ) ) ( not ( = ?auto_436494 ?auto_436496 ) ) ( not ( = ?auto_436494 ?auto_436497 ) ) ( not ( = ?auto_436494 ?auto_436498 ) ) ( not ( = ?auto_436494 ?auto_436499 ) ) ( not ( = ?auto_436494 ?auto_436500 ) ) ( not ( = ?auto_436494 ?auto_436501 ) ) ( not ( = ?auto_436494 ?auto_436502 ) ) ( not ( = ?auto_436494 ?auto_436503 ) ) ( not ( = ?auto_436494 ?auto_436504 ) ) ( not ( = ?auto_436494 ?auto_436505 ) ) ( not ( = ?auto_436494 ?auto_436506 ) ) ( not ( = ?auto_436494 ?auto_436507 ) ) ( not ( = ?auto_436495 ?auto_436496 ) ) ( not ( = ?auto_436495 ?auto_436497 ) ) ( not ( = ?auto_436495 ?auto_436498 ) ) ( not ( = ?auto_436495 ?auto_436499 ) ) ( not ( = ?auto_436495 ?auto_436500 ) ) ( not ( = ?auto_436495 ?auto_436501 ) ) ( not ( = ?auto_436495 ?auto_436502 ) ) ( not ( = ?auto_436495 ?auto_436503 ) ) ( not ( = ?auto_436495 ?auto_436504 ) ) ( not ( = ?auto_436495 ?auto_436505 ) ) ( not ( = ?auto_436495 ?auto_436506 ) ) ( not ( = ?auto_436495 ?auto_436507 ) ) ( not ( = ?auto_436496 ?auto_436497 ) ) ( not ( = ?auto_436496 ?auto_436498 ) ) ( not ( = ?auto_436496 ?auto_436499 ) ) ( not ( = ?auto_436496 ?auto_436500 ) ) ( not ( = ?auto_436496 ?auto_436501 ) ) ( not ( = ?auto_436496 ?auto_436502 ) ) ( not ( = ?auto_436496 ?auto_436503 ) ) ( not ( = ?auto_436496 ?auto_436504 ) ) ( not ( = ?auto_436496 ?auto_436505 ) ) ( not ( = ?auto_436496 ?auto_436506 ) ) ( not ( = ?auto_436496 ?auto_436507 ) ) ( not ( = ?auto_436497 ?auto_436498 ) ) ( not ( = ?auto_436497 ?auto_436499 ) ) ( not ( = ?auto_436497 ?auto_436500 ) ) ( not ( = ?auto_436497 ?auto_436501 ) ) ( not ( = ?auto_436497 ?auto_436502 ) ) ( not ( = ?auto_436497 ?auto_436503 ) ) ( not ( = ?auto_436497 ?auto_436504 ) ) ( not ( = ?auto_436497 ?auto_436505 ) ) ( not ( = ?auto_436497 ?auto_436506 ) ) ( not ( = ?auto_436497 ?auto_436507 ) ) ( not ( = ?auto_436498 ?auto_436499 ) ) ( not ( = ?auto_436498 ?auto_436500 ) ) ( not ( = ?auto_436498 ?auto_436501 ) ) ( not ( = ?auto_436498 ?auto_436502 ) ) ( not ( = ?auto_436498 ?auto_436503 ) ) ( not ( = ?auto_436498 ?auto_436504 ) ) ( not ( = ?auto_436498 ?auto_436505 ) ) ( not ( = ?auto_436498 ?auto_436506 ) ) ( not ( = ?auto_436498 ?auto_436507 ) ) ( not ( = ?auto_436499 ?auto_436500 ) ) ( not ( = ?auto_436499 ?auto_436501 ) ) ( not ( = ?auto_436499 ?auto_436502 ) ) ( not ( = ?auto_436499 ?auto_436503 ) ) ( not ( = ?auto_436499 ?auto_436504 ) ) ( not ( = ?auto_436499 ?auto_436505 ) ) ( not ( = ?auto_436499 ?auto_436506 ) ) ( not ( = ?auto_436499 ?auto_436507 ) ) ( not ( = ?auto_436500 ?auto_436501 ) ) ( not ( = ?auto_436500 ?auto_436502 ) ) ( not ( = ?auto_436500 ?auto_436503 ) ) ( not ( = ?auto_436500 ?auto_436504 ) ) ( not ( = ?auto_436500 ?auto_436505 ) ) ( not ( = ?auto_436500 ?auto_436506 ) ) ( not ( = ?auto_436500 ?auto_436507 ) ) ( not ( = ?auto_436501 ?auto_436502 ) ) ( not ( = ?auto_436501 ?auto_436503 ) ) ( not ( = ?auto_436501 ?auto_436504 ) ) ( not ( = ?auto_436501 ?auto_436505 ) ) ( not ( = ?auto_436501 ?auto_436506 ) ) ( not ( = ?auto_436501 ?auto_436507 ) ) ( not ( = ?auto_436502 ?auto_436503 ) ) ( not ( = ?auto_436502 ?auto_436504 ) ) ( not ( = ?auto_436502 ?auto_436505 ) ) ( not ( = ?auto_436502 ?auto_436506 ) ) ( not ( = ?auto_436502 ?auto_436507 ) ) ( not ( = ?auto_436503 ?auto_436504 ) ) ( not ( = ?auto_436503 ?auto_436505 ) ) ( not ( = ?auto_436503 ?auto_436506 ) ) ( not ( = ?auto_436503 ?auto_436507 ) ) ( not ( = ?auto_436504 ?auto_436505 ) ) ( not ( = ?auto_436504 ?auto_436506 ) ) ( not ( = ?auto_436504 ?auto_436507 ) ) ( not ( = ?auto_436505 ?auto_436506 ) ) ( not ( = ?auto_436505 ?auto_436507 ) ) ( not ( = ?auto_436506 ?auto_436507 ) ) ( CLEAR ?auto_436504 ) ( ON ?auto_436505 ?auto_436506 ) ( CLEAR ?auto_436505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_436494 ?auto_436495 ?auto_436496 ?auto_436497 ?auto_436498 ?auto_436499 ?auto_436500 ?auto_436501 ?auto_436502 ?auto_436503 ?auto_436504 ?auto_436505 )
      ( MAKE-13PILE ?auto_436494 ?auto_436495 ?auto_436496 ?auto_436497 ?auto_436498 ?auto_436499 ?auto_436500 ?auto_436501 ?auto_436502 ?auto_436503 ?auto_436504 ?auto_436505 ?auto_436506 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436521 - BLOCK
      ?auto_436522 - BLOCK
      ?auto_436523 - BLOCK
      ?auto_436524 - BLOCK
      ?auto_436525 - BLOCK
      ?auto_436526 - BLOCK
      ?auto_436527 - BLOCK
      ?auto_436528 - BLOCK
      ?auto_436529 - BLOCK
      ?auto_436530 - BLOCK
      ?auto_436531 - BLOCK
      ?auto_436532 - BLOCK
      ?auto_436533 - BLOCK
    )
    :vars
    (
      ?auto_436534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436533 ?auto_436534 ) ( ON-TABLE ?auto_436521 ) ( ON ?auto_436522 ?auto_436521 ) ( ON ?auto_436523 ?auto_436522 ) ( ON ?auto_436524 ?auto_436523 ) ( ON ?auto_436525 ?auto_436524 ) ( ON ?auto_436526 ?auto_436525 ) ( ON ?auto_436527 ?auto_436526 ) ( ON ?auto_436528 ?auto_436527 ) ( ON ?auto_436529 ?auto_436528 ) ( ON ?auto_436530 ?auto_436529 ) ( not ( = ?auto_436521 ?auto_436522 ) ) ( not ( = ?auto_436521 ?auto_436523 ) ) ( not ( = ?auto_436521 ?auto_436524 ) ) ( not ( = ?auto_436521 ?auto_436525 ) ) ( not ( = ?auto_436521 ?auto_436526 ) ) ( not ( = ?auto_436521 ?auto_436527 ) ) ( not ( = ?auto_436521 ?auto_436528 ) ) ( not ( = ?auto_436521 ?auto_436529 ) ) ( not ( = ?auto_436521 ?auto_436530 ) ) ( not ( = ?auto_436521 ?auto_436531 ) ) ( not ( = ?auto_436521 ?auto_436532 ) ) ( not ( = ?auto_436521 ?auto_436533 ) ) ( not ( = ?auto_436521 ?auto_436534 ) ) ( not ( = ?auto_436522 ?auto_436523 ) ) ( not ( = ?auto_436522 ?auto_436524 ) ) ( not ( = ?auto_436522 ?auto_436525 ) ) ( not ( = ?auto_436522 ?auto_436526 ) ) ( not ( = ?auto_436522 ?auto_436527 ) ) ( not ( = ?auto_436522 ?auto_436528 ) ) ( not ( = ?auto_436522 ?auto_436529 ) ) ( not ( = ?auto_436522 ?auto_436530 ) ) ( not ( = ?auto_436522 ?auto_436531 ) ) ( not ( = ?auto_436522 ?auto_436532 ) ) ( not ( = ?auto_436522 ?auto_436533 ) ) ( not ( = ?auto_436522 ?auto_436534 ) ) ( not ( = ?auto_436523 ?auto_436524 ) ) ( not ( = ?auto_436523 ?auto_436525 ) ) ( not ( = ?auto_436523 ?auto_436526 ) ) ( not ( = ?auto_436523 ?auto_436527 ) ) ( not ( = ?auto_436523 ?auto_436528 ) ) ( not ( = ?auto_436523 ?auto_436529 ) ) ( not ( = ?auto_436523 ?auto_436530 ) ) ( not ( = ?auto_436523 ?auto_436531 ) ) ( not ( = ?auto_436523 ?auto_436532 ) ) ( not ( = ?auto_436523 ?auto_436533 ) ) ( not ( = ?auto_436523 ?auto_436534 ) ) ( not ( = ?auto_436524 ?auto_436525 ) ) ( not ( = ?auto_436524 ?auto_436526 ) ) ( not ( = ?auto_436524 ?auto_436527 ) ) ( not ( = ?auto_436524 ?auto_436528 ) ) ( not ( = ?auto_436524 ?auto_436529 ) ) ( not ( = ?auto_436524 ?auto_436530 ) ) ( not ( = ?auto_436524 ?auto_436531 ) ) ( not ( = ?auto_436524 ?auto_436532 ) ) ( not ( = ?auto_436524 ?auto_436533 ) ) ( not ( = ?auto_436524 ?auto_436534 ) ) ( not ( = ?auto_436525 ?auto_436526 ) ) ( not ( = ?auto_436525 ?auto_436527 ) ) ( not ( = ?auto_436525 ?auto_436528 ) ) ( not ( = ?auto_436525 ?auto_436529 ) ) ( not ( = ?auto_436525 ?auto_436530 ) ) ( not ( = ?auto_436525 ?auto_436531 ) ) ( not ( = ?auto_436525 ?auto_436532 ) ) ( not ( = ?auto_436525 ?auto_436533 ) ) ( not ( = ?auto_436525 ?auto_436534 ) ) ( not ( = ?auto_436526 ?auto_436527 ) ) ( not ( = ?auto_436526 ?auto_436528 ) ) ( not ( = ?auto_436526 ?auto_436529 ) ) ( not ( = ?auto_436526 ?auto_436530 ) ) ( not ( = ?auto_436526 ?auto_436531 ) ) ( not ( = ?auto_436526 ?auto_436532 ) ) ( not ( = ?auto_436526 ?auto_436533 ) ) ( not ( = ?auto_436526 ?auto_436534 ) ) ( not ( = ?auto_436527 ?auto_436528 ) ) ( not ( = ?auto_436527 ?auto_436529 ) ) ( not ( = ?auto_436527 ?auto_436530 ) ) ( not ( = ?auto_436527 ?auto_436531 ) ) ( not ( = ?auto_436527 ?auto_436532 ) ) ( not ( = ?auto_436527 ?auto_436533 ) ) ( not ( = ?auto_436527 ?auto_436534 ) ) ( not ( = ?auto_436528 ?auto_436529 ) ) ( not ( = ?auto_436528 ?auto_436530 ) ) ( not ( = ?auto_436528 ?auto_436531 ) ) ( not ( = ?auto_436528 ?auto_436532 ) ) ( not ( = ?auto_436528 ?auto_436533 ) ) ( not ( = ?auto_436528 ?auto_436534 ) ) ( not ( = ?auto_436529 ?auto_436530 ) ) ( not ( = ?auto_436529 ?auto_436531 ) ) ( not ( = ?auto_436529 ?auto_436532 ) ) ( not ( = ?auto_436529 ?auto_436533 ) ) ( not ( = ?auto_436529 ?auto_436534 ) ) ( not ( = ?auto_436530 ?auto_436531 ) ) ( not ( = ?auto_436530 ?auto_436532 ) ) ( not ( = ?auto_436530 ?auto_436533 ) ) ( not ( = ?auto_436530 ?auto_436534 ) ) ( not ( = ?auto_436531 ?auto_436532 ) ) ( not ( = ?auto_436531 ?auto_436533 ) ) ( not ( = ?auto_436531 ?auto_436534 ) ) ( not ( = ?auto_436532 ?auto_436533 ) ) ( not ( = ?auto_436532 ?auto_436534 ) ) ( not ( = ?auto_436533 ?auto_436534 ) ) ( ON ?auto_436532 ?auto_436533 ) ( CLEAR ?auto_436530 ) ( ON ?auto_436531 ?auto_436532 ) ( CLEAR ?auto_436531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_436521 ?auto_436522 ?auto_436523 ?auto_436524 ?auto_436525 ?auto_436526 ?auto_436527 ?auto_436528 ?auto_436529 ?auto_436530 ?auto_436531 )
      ( MAKE-13PILE ?auto_436521 ?auto_436522 ?auto_436523 ?auto_436524 ?auto_436525 ?auto_436526 ?auto_436527 ?auto_436528 ?auto_436529 ?auto_436530 ?auto_436531 ?auto_436532 ?auto_436533 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436548 - BLOCK
      ?auto_436549 - BLOCK
      ?auto_436550 - BLOCK
      ?auto_436551 - BLOCK
      ?auto_436552 - BLOCK
      ?auto_436553 - BLOCK
      ?auto_436554 - BLOCK
      ?auto_436555 - BLOCK
      ?auto_436556 - BLOCK
      ?auto_436557 - BLOCK
      ?auto_436558 - BLOCK
      ?auto_436559 - BLOCK
      ?auto_436560 - BLOCK
    )
    :vars
    (
      ?auto_436561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436560 ?auto_436561 ) ( ON-TABLE ?auto_436548 ) ( ON ?auto_436549 ?auto_436548 ) ( ON ?auto_436550 ?auto_436549 ) ( ON ?auto_436551 ?auto_436550 ) ( ON ?auto_436552 ?auto_436551 ) ( ON ?auto_436553 ?auto_436552 ) ( ON ?auto_436554 ?auto_436553 ) ( ON ?auto_436555 ?auto_436554 ) ( ON ?auto_436556 ?auto_436555 ) ( ON ?auto_436557 ?auto_436556 ) ( not ( = ?auto_436548 ?auto_436549 ) ) ( not ( = ?auto_436548 ?auto_436550 ) ) ( not ( = ?auto_436548 ?auto_436551 ) ) ( not ( = ?auto_436548 ?auto_436552 ) ) ( not ( = ?auto_436548 ?auto_436553 ) ) ( not ( = ?auto_436548 ?auto_436554 ) ) ( not ( = ?auto_436548 ?auto_436555 ) ) ( not ( = ?auto_436548 ?auto_436556 ) ) ( not ( = ?auto_436548 ?auto_436557 ) ) ( not ( = ?auto_436548 ?auto_436558 ) ) ( not ( = ?auto_436548 ?auto_436559 ) ) ( not ( = ?auto_436548 ?auto_436560 ) ) ( not ( = ?auto_436548 ?auto_436561 ) ) ( not ( = ?auto_436549 ?auto_436550 ) ) ( not ( = ?auto_436549 ?auto_436551 ) ) ( not ( = ?auto_436549 ?auto_436552 ) ) ( not ( = ?auto_436549 ?auto_436553 ) ) ( not ( = ?auto_436549 ?auto_436554 ) ) ( not ( = ?auto_436549 ?auto_436555 ) ) ( not ( = ?auto_436549 ?auto_436556 ) ) ( not ( = ?auto_436549 ?auto_436557 ) ) ( not ( = ?auto_436549 ?auto_436558 ) ) ( not ( = ?auto_436549 ?auto_436559 ) ) ( not ( = ?auto_436549 ?auto_436560 ) ) ( not ( = ?auto_436549 ?auto_436561 ) ) ( not ( = ?auto_436550 ?auto_436551 ) ) ( not ( = ?auto_436550 ?auto_436552 ) ) ( not ( = ?auto_436550 ?auto_436553 ) ) ( not ( = ?auto_436550 ?auto_436554 ) ) ( not ( = ?auto_436550 ?auto_436555 ) ) ( not ( = ?auto_436550 ?auto_436556 ) ) ( not ( = ?auto_436550 ?auto_436557 ) ) ( not ( = ?auto_436550 ?auto_436558 ) ) ( not ( = ?auto_436550 ?auto_436559 ) ) ( not ( = ?auto_436550 ?auto_436560 ) ) ( not ( = ?auto_436550 ?auto_436561 ) ) ( not ( = ?auto_436551 ?auto_436552 ) ) ( not ( = ?auto_436551 ?auto_436553 ) ) ( not ( = ?auto_436551 ?auto_436554 ) ) ( not ( = ?auto_436551 ?auto_436555 ) ) ( not ( = ?auto_436551 ?auto_436556 ) ) ( not ( = ?auto_436551 ?auto_436557 ) ) ( not ( = ?auto_436551 ?auto_436558 ) ) ( not ( = ?auto_436551 ?auto_436559 ) ) ( not ( = ?auto_436551 ?auto_436560 ) ) ( not ( = ?auto_436551 ?auto_436561 ) ) ( not ( = ?auto_436552 ?auto_436553 ) ) ( not ( = ?auto_436552 ?auto_436554 ) ) ( not ( = ?auto_436552 ?auto_436555 ) ) ( not ( = ?auto_436552 ?auto_436556 ) ) ( not ( = ?auto_436552 ?auto_436557 ) ) ( not ( = ?auto_436552 ?auto_436558 ) ) ( not ( = ?auto_436552 ?auto_436559 ) ) ( not ( = ?auto_436552 ?auto_436560 ) ) ( not ( = ?auto_436552 ?auto_436561 ) ) ( not ( = ?auto_436553 ?auto_436554 ) ) ( not ( = ?auto_436553 ?auto_436555 ) ) ( not ( = ?auto_436553 ?auto_436556 ) ) ( not ( = ?auto_436553 ?auto_436557 ) ) ( not ( = ?auto_436553 ?auto_436558 ) ) ( not ( = ?auto_436553 ?auto_436559 ) ) ( not ( = ?auto_436553 ?auto_436560 ) ) ( not ( = ?auto_436553 ?auto_436561 ) ) ( not ( = ?auto_436554 ?auto_436555 ) ) ( not ( = ?auto_436554 ?auto_436556 ) ) ( not ( = ?auto_436554 ?auto_436557 ) ) ( not ( = ?auto_436554 ?auto_436558 ) ) ( not ( = ?auto_436554 ?auto_436559 ) ) ( not ( = ?auto_436554 ?auto_436560 ) ) ( not ( = ?auto_436554 ?auto_436561 ) ) ( not ( = ?auto_436555 ?auto_436556 ) ) ( not ( = ?auto_436555 ?auto_436557 ) ) ( not ( = ?auto_436555 ?auto_436558 ) ) ( not ( = ?auto_436555 ?auto_436559 ) ) ( not ( = ?auto_436555 ?auto_436560 ) ) ( not ( = ?auto_436555 ?auto_436561 ) ) ( not ( = ?auto_436556 ?auto_436557 ) ) ( not ( = ?auto_436556 ?auto_436558 ) ) ( not ( = ?auto_436556 ?auto_436559 ) ) ( not ( = ?auto_436556 ?auto_436560 ) ) ( not ( = ?auto_436556 ?auto_436561 ) ) ( not ( = ?auto_436557 ?auto_436558 ) ) ( not ( = ?auto_436557 ?auto_436559 ) ) ( not ( = ?auto_436557 ?auto_436560 ) ) ( not ( = ?auto_436557 ?auto_436561 ) ) ( not ( = ?auto_436558 ?auto_436559 ) ) ( not ( = ?auto_436558 ?auto_436560 ) ) ( not ( = ?auto_436558 ?auto_436561 ) ) ( not ( = ?auto_436559 ?auto_436560 ) ) ( not ( = ?auto_436559 ?auto_436561 ) ) ( not ( = ?auto_436560 ?auto_436561 ) ) ( ON ?auto_436559 ?auto_436560 ) ( CLEAR ?auto_436557 ) ( ON ?auto_436558 ?auto_436559 ) ( CLEAR ?auto_436558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_436548 ?auto_436549 ?auto_436550 ?auto_436551 ?auto_436552 ?auto_436553 ?auto_436554 ?auto_436555 ?auto_436556 ?auto_436557 ?auto_436558 )
      ( MAKE-13PILE ?auto_436548 ?auto_436549 ?auto_436550 ?auto_436551 ?auto_436552 ?auto_436553 ?auto_436554 ?auto_436555 ?auto_436556 ?auto_436557 ?auto_436558 ?auto_436559 ?auto_436560 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436575 - BLOCK
      ?auto_436576 - BLOCK
      ?auto_436577 - BLOCK
      ?auto_436578 - BLOCK
      ?auto_436579 - BLOCK
      ?auto_436580 - BLOCK
      ?auto_436581 - BLOCK
      ?auto_436582 - BLOCK
      ?auto_436583 - BLOCK
      ?auto_436584 - BLOCK
      ?auto_436585 - BLOCK
      ?auto_436586 - BLOCK
      ?auto_436587 - BLOCK
    )
    :vars
    (
      ?auto_436588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436587 ?auto_436588 ) ( ON-TABLE ?auto_436575 ) ( ON ?auto_436576 ?auto_436575 ) ( ON ?auto_436577 ?auto_436576 ) ( ON ?auto_436578 ?auto_436577 ) ( ON ?auto_436579 ?auto_436578 ) ( ON ?auto_436580 ?auto_436579 ) ( ON ?auto_436581 ?auto_436580 ) ( ON ?auto_436582 ?auto_436581 ) ( ON ?auto_436583 ?auto_436582 ) ( not ( = ?auto_436575 ?auto_436576 ) ) ( not ( = ?auto_436575 ?auto_436577 ) ) ( not ( = ?auto_436575 ?auto_436578 ) ) ( not ( = ?auto_436575 ?auto_436579 ) ) ( not ( = ?auto_436575 ?auto_436580 ) ) ( not ( = ?auto_436575 ?auto_436581 ) ) ( not ( = ?auto_436575 ?auto_436582 ) ) ( not ( = ?auto_436575 ?auto_436583 ) ) ( not ( = ?auto_436575 ?auto_436584 ) ) ( not ( = ?auto_436575 ?auto_436585 ) ) ( not ( = ?auto_436575 ?auto_436586 ) ) ( not ( = ?auto_436575 ?auto_436587 ) ) ( not ( = ?auto_436575 ?auto_436588 ) ) ( not ( = ?auto_436576 ?auto_436577 ) ) ( not ( = ?auto_436576 ?auto_436578 ) ) ( not ( = ?auto_436576 ?auto_436579 ) ) ( not ( = ?auto_436576 ?auto_436580 ) ) ( not ( = ?auto_436576 ?auto_436581 ) ) ( not ( = ?auto_436576 ?auto_436582 ) ) ( not ( = ?auto_436576 ?auto_436583 ) ) ( not ( = ?auto_436576 ?auto_436584 ) ) ( not ( = ?auto_436576 ?auto_436585 ) ) ( not ( = ?auto_436576 ?auto_436586 ) ) ( not ( = ?auto_436576 ?auto_436587 ) ) ( not ( = ?auto_436576 ?auto_436588 ) ) ( not ( = ?auto_436577 ?auto_436578 ) ) ( not ( = ?auto_436577 ?auto_436579 ) ) ( not ( = ?auto_436577 ?auto_436580 ) ) ( not ( = ?auto_436577 ?auto_436581 ) ) ( not ( = ?auto_436577 ?auto_436582 ) ) ( not ( = ?auto_436577 ?auto_436583 ) ) ( not ( = ?auto_436577 ?auto_436584 ) ) ( not ( = ?auto_436577 ?auto_436585 ) ) ( not ( = ?auto_436577 ?auto_436586 ) ) ( not ( = ?auto_436577 ?auto_436587 ) ) ( not ( = ?auto_436577 ?auto_436588 ) ) ( not ( = ?auto_436578 ?auto_436579 ) ) ( not ( = ?auto_436578 ?auto_436580 ) ) ( not ( = ?auto_436578 ?auto_436581 ) ) ( not ( = ?auto_436578 ?auto_436582 ) ) ( not ( = ?auto_436578 ?auto_436583 ) ) ( not ( = ?auto_436578 ?auto_436584 ) ) ( not ( = ?auto_436578 ?auto_436585 ) ) ( not ( = ?auto_436578 ?auto_436586 ) ) ( not ( = ?auto_436578 ?auto_436587 ) ) ( not ( = ?auto_436578 ?auto_436588 ) ) ( not ( = ?auto_436579 ?auto_436580 ) ) ( not ( = ?auto_436579 ?auto_436581 ) ) ( not ( = ?auto_436579 ?auto_436582 ) ) ( not ( = ?auto_436579 ?auto_436583 ) ) ( not ( = ?auto_436579 ?auto_436584 ) ) ( not ( = ?auto_436579 ?auto_436585 ) ) ( not ( = ?auto_436579 ?auto_436586 ) ) ( not ( = ?auto_436579 ?auto_436587 ) ) ( not ( = ?auto_436579 ?auto_436588 ) ) ( not ( = ?auto_436580 ?auto_436581 ) ) ( not ( = ?auto_436580 ?auto_436582 ) ) ( not ( = ?auto_436580 ?auto_436583 ) ) ( not ( = ?auto_436580 ?auto_436584 ) ) ( not ( = ?auto_436580 ?auto_436585 ) ) ( not ( = ?auto_436580 ?auto_436586 ) ) ( not ( = ?auto_436580 ?auto_436587 ) ) ( not ( = ?auto_436580 ?auto_436588 ) ) ( not ( = ?auto_436581 ?auto_436582 ) ) ( not ( = ?auto_436581 ?auto_436583 ) ) ( not ( = ?auto_436581 ?auto_436584 ) ) ( not ( = ?auto_436581 ?auto_436585 ) ) ( not ( = ?auto_436581 ?auto_436586 ) ) ( not ( = ?auto_436581 ?auto_436587 ) ) ( not ( = ?auto_436581 ?auto_436588 ) ) ( not ( = ?auto_436582 ?auto_436583 ) ) ( not ( = ?auto_436582 ?auto_436584 ) ) ( not ( = ?auto_436582 ?auto_436585 ) ) ( not ( = ?auto_436582 ?auto_436586 ) ) ( not ( = ?auto_436582 ?auto_436587 ) ) ( not ( = ?auto_436582 ?auto_436588 ) ) ( not ( = ?auto_436583 ?auto_436584 ) ) ( not ( = ?auto_436583 ?auto_436585 ) ) ( not ( = ?auto_436583 ?auto_436586 ) ) ( not ( = ?auto_436583 ?auto_436587 ) ) ( not ( = ?auto_436583 ?auto_436588 ) ) ( not ( = ?auto_436584 ?auto_436585 ) ) ( not ( = ?auto_436584 ?auto_436586 ) ) ( not ( = ?auto_436584 ?auto_436587 ) ) ( not ( = ?auto_436584 ?auto_436588 ) ) ( not ( = ?auto_436585 ?auto_436586 ) ) ( not ( = ?auto_436585 ?auto_436587 ) ) ( not ( = ?auto_436585 ?auto_436588 ) ) ( not ( = ?auto_436586 ?auto_436587 ) ) ( not ( = ?auto_436586 ?auto_436588 ) ) ( not ( = ?auto_436587 ?auto_436588 ) ) ( ON ?auto_436586 ?auto_436587 ) ( ON ?auto_436585 ?auto_436586 ) ( CLEAR ?auto_436583 ) ( ON ?auto_436584 ?auto_436585 ) ( CLEAR ?auto_436584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_436575 ?auto_436576 ?auto_436577 ?auto_436578 ?auto_436579 ?auto_436580 ?auto_436581 ?auto_436582 ?auto_436583 ?auto_436584 )
      ( MAKE-13PILE ?auto_436575 ?auto_436576 ?auto_436577 ?auto_436578 ?auto_436579 ?auto_436580 ?auto_436581 ?auto_436582 ?auto_436583 ?auto_436584 ?auto_436585 ?auto_436586 ?auto_436587 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436602 - BLOCK
      ?auto_436603 - BLOCK
      ?auto_436604 - BLOCK
      ?auto_436605 - BLOCK
      ?auto_436606 - BLOCK
      ?auto_436607 - BLOCK
      ?auto_436608 - BLOCK
      ?auto_436609 - BLOCK
      ?auto_436610 - BLOCK
      ?auto_436611 - BLOCK
      ?auto_436612 - BLOCK
      ?auto_436613 - BLOCK
      ?auto_436614 - BLOCK
    )
    :vars
    (
      ?auto_436615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436614 ?auto_436615 ) ( ON-TABLE ?auto_436602 ) ( ON ?auto_436603 ?auto_436602 ) ( ON ?auto_436604 ?auto_436603 ) ( ON ?auto_436605 ?auto_436604 ) ( ON ?auto_436606 ?auto_436605 ) ( ON ?auto_436607 ?auto_436606 ) ( ON ?auto_436608 ?auto_436607 ) ( ON ?auto_436609 ?auto_436608 ) ( ON ?auto_436610 ?auto_436609 ) ( not ( = ?auto_436602 ?auto_436603 ) ) ( not ( = ?auto_436602 ?auto_436604 ) ) ( not ( = ?auto_436602 ?auto_436605 ) ) ( not ( = ?auto_436602 ?auto_436606 ) ) ( not ( = ?auto_436602 ?auto_436607 ) ) ( not ( = ?auto_436602 ?auto_436608 ) ) ( not ( = ?auto_436602 ?auto_436609 ) ) ( not ( = ?auto_436602 ?auto_436610 ) ) ( not ( = ?auto_436602 ?auto_436611 ) ) ( not ( = ?auto_436602 ?auto_436612 ) ) ( not ( = ?auto_436602 ?auto_436613 ) ) ( not ( = ?auto_436602 ?auto_436614 ) ) ( not ( = ?auto_436602 ?auto_436615 ) ) ( not ( = ?auto_436603 ?auto_436604 ) ) ( not ( = ?auto_436603 ?auto_436605 ) ) ( not ( = ?auto_436603 ?auto_436606 ) ) ( not ( = ?auto_436603 ?auto_436607 ) ) ( not ( = ?auto_436603 ?auto_436608 ) ) ( not ( = ?auto_436603 ?auto_436609 ) ) ( not ( = ?auto_436603 ?auto_436610 ) ) ( not ( = ?auto_436603 ?auto_436611 ) ) ( not ( = ?auto_436603 ?auto_436612 ) ) ( not ( = ?auto_436603 ?auto_436613 ) ) ( not ( = ?auto_436603 ?auto_436614 ) ) ( not ( = ?auto_436603 ?auto_436615 ) ) ( not ( = ?auto_436604 ?auto_436605 ) ) ( not ( = ?auto_436604 ?auto_436606 ) ) ( not ( = ?auto_436604 ?auto_436607 ) ) ( not ( = ?auto_436604 ?auto_436608 ) ) ( not ( = ?auto_436604 ?auto_436609 ) ) ( not ( = ?auto_436604 ?auto_436610 ) ) ( not ( = ?auto_436604 ?auto_436611 ) ) ( not ( = ?auto_436604 ?auto_436612 ) ) ( not ( = ?auto_436604 ?auto_436613 ) ) ( not ( = ?auto_436604 ?auto_436614 ) ) ( not ( = ?auto_436604 ?auto_436615 ) ) ( not ( = ?auto_436605 ?auto_436606 ) ) ( not ( = ?auto_436605 ?auto_436607 ) ) ( not ( = ?auto_436605 ?auto_436608 ) ) ( not ( = ?auto_436605 ?auto_436609 ) ) ( not ( = ?auto_436605 ?auto_436610 ) ) ( not ( = ?auto_436605 ?auto_436611 ) ) ( not ( = ?auto_436605 ?auto_436612 ) ) ( not ( = ?auto_436605 ?auto_436613 ) ) ( not ( = ?auto_436605 ?auto_436614 ) ) ( not ( = ?auto_436605 ?auto_436615 ) ) ( not ( = ?auto_436606 ?auto_436607 ) ) ( not ( = ?auto_436606 ?auto_436608 ) ) ( not ( = ?auto_436606 ?auto_436609 ) ) ( not ( = ?auto_436606 ?auto_436610 ) ) ( not ( = ?auto_436606 ?auto_436611 ) ) ( not ( = ?auto_436606 ?auto_436612 ) ) ( not ( = ?auto_436606 ?auto_436613 ) ) ( not ( = ?auto_436606 ?auto_436614 ) ) ( not ( = ?auto_436606 ?auto_436615 ) ) ( not ( = ?auto_436607 ?auto_436608 ) ) ( not ( = ?auto_436607 ?auto_436609 ) ) ( not ( = ?auto_436607 ?auto_436610 ) ) ( not ( = ?auto_436607 ?auto_436611 ) ) ( not ( = ?auto_436607 ?auto_436612 ) ) ( not ( = ?auto_436607 ?auto_436613 ) ) ( not ( = ?auto_436607 ?auto_436614 ) ) ( not ( = ?auto_436607 ?auto_436615 ) ) ( not ( = ?auto_436608 ?auto_436609 ) ) ( not ( = ?auto_436608 ?auto_436610 ) ) ( not ( = ?auto_436608 ?auto_436611 ) ) ( not ( = ?auto_436608 ?auto_436612 ) ) ( not ( = ?auto_436608 ?auto_436613 ) ) ( not ( = ?auto_436608 ?auto_436614 ) ) ( not ( = ?auto_436608 ?auto_436615 ) ) ( not ( = ?auto_436609 ?auto_436610 ) ) ( not ( = ?auto_436609 ?auto_436611 ) ) ( not ( = ?auto_436609 ?auto_436612 ) ) ( not ( = ?auto_436609 ?auto_436613 ) ) ( not ( = ?auto_436609 ?auto_436614 ) ) ( not ( = ?auto_436609 ?auto_436615 ) ) ( not ( = ?auto_436610 ?auto_436611 ) ) ( not ( = ?auto_436610 ?auto_436612 ) ) ( not ( = ?auto_436610 ?auto_436613 ) ) ( not ( = ?auto_436610 ?auto_436614 ) ) ( not ( = ?auto_436610 ?auto_436615 ) ) ( not ( = ?auto_436611 ?auto_436612 ) ) ( not ( = ?auto_436611 ?auto_436613 ) ) ( not ( = ?auto_436611 ?auto_436614 ) ) ( not ( = ?auto_436611 ?auto_436615 ) ) ( not ( = ?auto_436612 ?auto_436613 ) ) ( not ( = ?auto_436612 ?auto_436614 ) ) ( not ( = ?auto_436612 ?auto_436615 ) ) ( not ( = ?auto_436613 ?auto_436614 ) ) ( not ( = ?auto_436613 ?auto_436615 ) ) ( not ( = ?auto_436614 ?auto_436615 ) ) ( ON ?auto_436613 ?auto_436614 ) ( ON ?auto_436612 ?auto_436613 ) ( CLEAR ?auto_436610 ) ( ON ?auto_436611 ?auto_436612 ) ( CLEAR ?auto_436611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_436602 ?auto_436603 ?auto_436604 ?auto_436605 ?auto_436606 ?auto_436607 ?auto_436608 ?auto_436609 ?auto_436610 ?auto_436611 )
      ( MAKE-13PILE ?auto_436602 ?auto_436603 ?auto_436604 ?auto_436605 ?auto_436606 ?auto_436607 ?auto_436608 ?auto_436609 ?auto_436610 ?auto_436611 ?auto_436612 ?auto_436613 ?auto_436614 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436629 - BLOCK
      ?auto_436630 - BLOCK
      ?auto_436631 - BLOCK
      ?auto_436632 - BLOCK
      ?auto_436633 - BLOCK
      ?auto_436634 - BLOCK
      ?auto_436635 - BLOCK
      ?auto_436636 - BLOCK
      ?auto_436637 - BLOCK
      ?auto_436638 - BLOCK
      ?auto_436639 - BLOCK
      ?auto_436640 - BLOCK
      ?auto_436641 - BLOCK
    )
    :vars
    (
      ?auto_436642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436641 ?auto_436642 ) ( ON-TABLE ?auto_436629 ) ( ON ?auto_436630 ?auto_436629 ) ( ON ?auto_436631 ?auto_436630 ) ( ON ?auto_436632 ?auto_436631 ) ( ON ?auto_436633 ?auto_436632 ) ( ON ?auto_436634 ?auto_436633 ) ( ON ?auto_436635 ?auto_436634 ) ( ON ?auto_436636 ?auto_436635 ) ( not ( = ?auto_436629 ?auto_436630 ) ) ( not ( = ?auto_436629 ?auto_436631 ) ) ( not ( = ?auto_436629 ?auto_436632 ) ) ( not ( = ?auto_436629 ?auto_436633 ) ) ( not ( = ?auto_436629 ?auto_436634 ) ) ( not ( = ?auto_436629 ?auto_436635 ) ) ( not ( = ?auto_436629 ?auto_436636 ) ) ( not ( = ?auto_436629 ?auto_436637 ) ) ( not ( = ?auto_436629 ?auto_436638 ) ) ( not ( = ?auto_436629 ?auto_436639 ) ) ( not ( = ?auto_436629 ?auto_436640 ) ) ( not ( = ?auto_436629 ?auto_436641 ) ) ( not ( = ?auto_436629 ?auto_436642 ) ) ( not ( = ?auto_436630 ?auto_436631 ) ) ( not ( = ?auto_436630 ?auto_436632 ) ) ( not ( = ?auto_436630 ?auto_436633 ) ) ( not ( = ?auto_436630 ?auto_436634 ) ) ( not ( = ?auto_436630 ?auto_436635 ) ) ( not ( = ?auto_436630 ?auto_436636 ) ) ( not ( = ?auto_436630 ?auto_436637 ) ) ( not ( = ?auto_436630 ?auto_436638 ) ) ( not ( = ?auto_436630 ?auto_436639 ) ) ( not ( = ?auto_436630 ?auto_436640 ) ) ( not ( = ?auto_436630 ?auto_436641 ) ) ( not ( = ?auto_436630 ?auto_436642 ) ) ( not ( = ?auto_436631 ?auto_436632 ) ) ( not ( = ?auto_436631 ?auto_436633 ) ) ( not ( = ?auto_436631 ?auto_436634 ) ) ( not ( = ?auto_436631 ?auto_436635 ) ) ( not ( = ?auto_436631 ?auto_436636 ) ) ( not ( = ?auto_436631 ?auto_436637 ) ) ( not ( = ?auto_436631 ?auto_436638 ) ) ( not ( = ?auto_436631 ?auto_436639 ) ) ( not ( = ?auto_436631 ?auto_436640 ) ) ( not ( = ?auto_436631 ?auto_436641 ) ) ( not ( = ?auto_436631 ?auto_436642 ) ) ( not ( = ?auto_436632 ?auto_436633 ) ) ( not ( = ?auto_436632 ?auto_436634 ) ) ( not ( = ?auto_436632 ?auto_436635 ) ) ( not ( = ?auto_436632 ?auto_436636 ) ) ( not ( = ?auto_436632 ?auto_436637 ) ) ( not ( = ?auto_436632 ?auto_436638 ) ) ( not ( = ?auto_436632 ?auto_436639 ) ) ( not ( = ?auto_436632 ?auto_436640 ) ) ( not ( = ?auto_436632 ?auto_436641 ) ) ( not ( = ?auto_436632 ?auto_436642 ) ) ( not ( = ?auto_436633 ?auto_436634 ) ) ( not ( = ?auto_436633 ?auto_436635 ) ) ( not ( = ?auto_436633 ?auto_436636 ) ) ( not ( = ?auto_436633 ?auto_436637 ) ) ( not ( = ?auto_436633 ?auto_436638 ) ) ( not ( = ?auto_436633 ?auto_436639 ) ) ( not ( = ?auto_436633 ?auto_436640 ) ) ( not ( = ?auto_436633 ?auto_436641 ) ) ( not ( = ?auto_436633 ?auto_436642 ) ) ( not ( = ?auto_436634 ?auto_436635 ) ) ( not ( = ?auto_436634 ?auto_436636 ) ) ( not ( = ?auto_436634 ?auto_436637 ) ) ( not ( = ?auto_436634 ?auto_436638 ) ) ( not ( = ?auto_436634 ?auto_436639 ) ) ( not ( = ?auto_436634 ?auto_436640 ) ) ( not ( = ?auto_436634 ?auto_436641 ) ) ( not ( = ?auto_436634 ?auto_436642 ) ) ( not ( = ?auto_436635 ?auto_436636 ) ) ( not ( = ?auto_436635 ?auto_436637 ) ) ( not ( = ?auto_436635 ?auto_436638 ) ) ( not ( = ?auto_436635 ?auto_436639 ) ) ( not ( = ?auto_436635 ?auto_436640 ) ) ( not ( = ?auto_436635 ?auto_436641 ) ) ( not ( = ?auto_436635 ?auto_436642 ) ) ( not ( = ?auto_436636 ?auto_436637 ) ) ( not ( = ?auto_436636 ?auto_436638 ) ) ( not ( = ?auto_436636 ?auto_436639 ) ) ( not ( = ?auto_436636 ?auto_436640 ) ) ( not ( = ?auto_436636 ?auto_436641 ) ) ( not ( = ?auto_436636 ?auto_436642 ) ) ( not ( = ?auto_436637 ?auto_436638 ) ) ( not ( = ?auto_436637 ?auto_436639 ) ) ( not ( = ?auto_436637 ?auto_436640 ) ) ( not ( = ?auto_436637 ?auto_436641 ) ) ( not ( = ?auto_436637 ?auto_436642 ) ) ( not ( = ?auto_436638 ?auto_436639 ) ) ( not ( = ?auto_436638 ?auto_436640 ) ) ( not ( = ?auto_436638 ?auto_436641 ) ) ( not ( = ?auto_436638 ?auto_436642 ) ) ( not ( = ?auto_436639 ?auto_436640 ) ) ( not ( = ?auto_436639 ?auto_436641 ) ) ( not ( = ?auto_436639 ?auto_436642 ) ) ( not ( = ?auto_436640 ?auto_436641 ) ) ( not ( = ?auto_436640 ?auto_436642 ) ) ( not ( = ?auto_436641 ?auto_436642 ) ) ( ON ?auto_436640 ?auto_436641 ) ( ON ?auto_436639 ?auto_436640 ) ( ON ?auto_436638 ?auto_436639 ) ( CLEAR ?auto_436636 ) ( ON ?auto_436637 ?auto_436638 ) ( CLEAR ?auto_436637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_436629 ?auto_436630 ?auto_436631 ?auto_436632 ?auto_436633 ?auto_436634 ?auto_436635 ?auto_436636 ?auto_436637 )
      ( MAKE-13PILE ?auto_436629 ?auto_436630 ?auto_436631 ?auto_436632 ?auto_436633 ?auto_436634 ?auto_436635 ?auto_436636 ?auto_436637 ?auto_436638 ?auto_436639 ?auto_436640 ?auto_436641 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436656 - BLOCK
      ?auto_436657 - BLOCK
      ?auto_436658 - BLOCK
      ?auto_436659 - BLOCK
      ?auto_436660 - BLOCK
      ?auto_436661 - BLOCK
      ?auto_436662 - BLOCK
      ?auto_436663 - BLOCK
      ?auto_436664 - BLOCK
      ?auto_436665 - BLOCK
      ?auto_436666 - BLOCK
      ?auto_436667 - BLOCK
      ?auto_436668 - BLOCK
    )
    :vars
    (
      ?auto_436669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436668 ?auto_436669 ) ( ON-TABLE ?auto_436656 ) ( ON ?auto_436657 ?auto_436656 ) ( ON ?auto_436658 ?auto_436657 ) ( ON ?auto_436659 ?auto_436658 ) ( ON ?auto_436660 ?auto_436659 ) ( ON ?auto_436661 ?auto_436660 ) ( ON ?auto_436662 ?auto_436661 ) ( ON ?auto_436663 ?auto_436662 ) ( not ( = ?auto_436656 ?auto_436657 ) ) ( not ( = ?auto_436656 ?auto_436658 ) ) ( not ( = ?auto_436656 ?auto_436659 ) ) ( not ( = ?auto_436656 ?auto_436660 ) ) ( not ( = ?auto_436656 ?auto_436661 ) ) ( not ( = ?auto_436656 ?auto_436662 ) ) ( not ( = ?auto_436656 ?auto_436663 ) ) ( not ( = ?auto_436656 ?auto_436664 ) ) ( not ( = ?auto_436656 ?auto_436665 ) ) ( not ( = ?auto_436656 ?auto_436666 ) ) ( not ( = ?auto_436656 ?auto_436667 ) ) ( not ( = ?auto_436656 ?auto_436668 ) ) ( not ( = ?auto_436656 ?auto_436669 ) ) ( not ( = ?auto_436657 ?auto_436658 ) ) ( not ( = ?auto_436657 ?auto_436659 ) ) ( not ( = ?auto_436657 ?auto_436660 ) ) ( not ( = ?auto_436657 ?auto_436661 ) ) ( not ( = ?auto_436657 ?auto_436662 ) ) ( not ( = ?auto_436657 ?auto_436663 ) ) ( not ( = ?auto_436657 ?auto_436664 ) ) ( not ( = ?auto_436657 ?auto_436665 ) ) ( not ( = ?auto_436657 ?auto_436666 ) ) ( not ( = ?auto_436657 ?auto_436667 ) ) ( not ( = ?auto_436657 ?auto_436668 ) ) ( not ( = ?auto_436657 ?auto_436669 ) ) ( not ( = ?auto_436658 ?auto_436659 ) ) ( not ( = ?auto_436658 ?auto_436660 ) ) ( not ( = ?auto_436658 ?auto_436661 ) ) ( not ( = ?auto_436658 ?auto_436662 ) ) ( not ( = ?auto_436658 ?auto_436663 ) ) ( not ( = ?auto_436658 ?auto_436664 ) ) ( not ( = ?auto_436658 ?auto_436665 ) ) ( not ( = ?auto_436658 ?auto_436666 ) ) ( not ( = ?auto_436658 ?auto_436667 ) ) ( not ( = ?auto_436658 ?auto_436668 ) ) ( not ( = ?auto_436658 ?auto_436669 ) ) ( not ( = ?auto_436659 ?auto_436660 ) ) ( not ( = ?auto_436659 ?auto_436661 ) ) ( not ( = ?auto_436659 ?auto_436662 ) ) ( not ( = ?auto_436659 ?auto_436663 ) ) ( not ( = ?auto_436659 ?auto_436664 ) ) ( not ( = ?auto_436659 ?auto_436665 ) ) ( not ( = ?auto_436659 ?auto_436666 ) ) ( not ( = ?auto_436659 ?auto_436667 ) ) ( not ( = ?auto_436659 ?auto_436668 ) ) ( not ( = ?auto_436659 ?auto_436669 ) ) ( not ( = ?auto_436660 ?auto_436661 ) ) ( not ( = ?auto_436660 ?auto_436662 ) ) ( not ( = ?auto_436660 ?auto_436663 ) ) ( not ( = ?auto_436660 ?auto_436664 ) ) ( not ( = ?auto_436660 ?auto_436665 ) ) ( not ( = ?auto_436660 ?auto_436666 ) ) ( not ( = ?auto_436660 ?auto_436667 ) ) ( not ( = ?auto_436660 ?auto_436668 ) ) ( not ( = ?auto_436660 ?auto_436669 ) ) ( not ( = ?auto_436661 ?auto_436662 ) ) ( not ( = ?auto_436661 ?auto_436663 ) ) ( not ( = ?auto_436661 ?auto_436664 ) ) ( not ( = ?auto_436661 ?auto_436665 ) ) ( not ( = ?auto_436661 ?auto_436666 ) ) ( not ( = ?auto_436661 ?auto_436667 ) ) ( not ( = ?auto_436661 ?auto_436668 ) ) ( not ( = ?auto_436661 ?auto_436669 ) ) ( not ( = ?auto_436662 ?auto_436663 ) ) ( not ( = ?auto_436662 ?auto_436664 ) ) ( not ( = ?auto_436662 ?auto_436665 ) ) ( not ( = ?auto_436662 ?auto_436666 ) ) ( not ( = ?auto_436662 ?auto_436667 ) ) ( not ( = ?auto_436662 ?auto_436668 ) ) ( not ( = ?auto_436662 ?auto_436669 ) ) ( not ( = ?auto_436663 ?auto_436664 ) ) ( not ( = ?auto_436663 ?auto_436665 ) ) ( not ( = ?auto_436663 ?auto_436666 ) ) ( not ( = ?auto_436663 ?auto_436667 ) ) ( not ( = ?auto_436663 ?auto_436668 ) ) ( not ( = ?auto_436663 ?auto_436669 ) ) ( not ( = ?auto_436664 ?auto_436665 ) ) ( not ( = ?auto_436664 ?auto_436666 ) ) ( not ( = ?auto_436664 ?auto_436667 ) ) ( not ( = ?auto_436664 ?auto_436668 ) ) ( not ( = ?auto_436664 ?auto_436669 ) ) ( not ( = ?auto_436665 ?auto_436666 ) ) ( not ( = ?auto_436665 ?auto_436667 ) ) ( not ( = ?auto_436665 ?auto_436668 ) ) ( not ( = ?auto_436665 ?auto_436669 ) ) ( not ( = ?auto_436666 ?auto_436667 ) ) ( not ( = ?auto_436666 ?auto_436668 ) ) ( not ( = ?auto_436666 ?auto_436669 ) ) ( not ( = ?auto_436667 ?auto_436668 ) ) ( not ( = ?auto_436667 ?auto_436669 ) ) ( not ( = ?auto_436668 ?auto_436669 ) ) ( ON ?auto_436667 ?auto_436668 ) ( ON ?auto_436666 ?auto_436667 ) ( ON ?auto_436665 ?auto_436666 ) ( CLEAR ?auto_436663 ) ( ON ?auto_436664 ?auto_436665 ) ( CLEAR ?auto_436664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_436656 ?auto_436657 ?auto_436658 ?auto_436659 ?auto_436660 ?auto_436661 ?auto_436662 ?auto_436663 ?auto_436664 )
      ( MAKE-13PILE ?auto_436656 ?auto_436657 ?auto_436658 ?auto_436659 ?auto_436660 ?auto_436661 ?auto_436662 ?auto_436663 ?auto_436664 ?auto_436665 ?auto_436666 ?auto_436667 ?auto_436668 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436683 - BLOCK
      ?auto_436684 - BLOCK
      ?auto_436685 - BLOCK
      ?auto_436686 - BLOCK
      ?auto_436687 - BLOCK
      ?auto_436688 - BLOCK
      ?auto_436689 - BLOCK
      ?auto_436690 - BLOCK
      ?auto_436691 - BLOCK
      ?auto_436692 - BLOCK
      ?auto_436693 - BLOCK
      ?auto_436694 - BLOCK
      ?auto_436695 - BLOCK
    )
    :vars
    (
      ?auto_436696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436695 ?auto_436696 ) ( ON-TABLE ?auto_436683 ) ( ON ?auto_436684 ?auto_436683 ) ( ON ?auto_436685 ?auto_436684 ) ( ON ?auto_436686 ?auto_436685 ) ( ON ?auto_436687 ?auto_436686 ) ( ON ?auto_436688 ?auto_436687 ) ( ON ?auto_436689 ?auto_436688 ) ( not ( = ?auto_436683 ?auto_436684 ) ) ( not ( = ?auto_436683 ?auto_436685 ) ) ( not ( = ?auto_436683 ?auto_436686 ) ) ( not ( = ?auto_436683 ?auto_436687 ) ) ( not ( = ?auto_436683 ?auto_436688 ) ) ( not ( = ?auto_436683 ?auto_436689 ) ) ( not ( = ?auto_436683 ?auto_436690 ) ) ( not ( = ?auto_436683 ?auto_436691 ) ) ( not ( = ?auto_436683 ?auto_436692 ) ) ( not ( = ?auto_436683 ?auto_436693 ) ) ( not ( = ?auto_436683 ?auto_436694 ) ) ( not ( = ?auto_436683 ?auto_436695 ) ) ( not ( = ?auto_436683 ?auto_436696 ) ) ( not ( = ?auto_436684 ?auto_436685 ) ) ( not ( = ?auto_436684 ?auto_436686 ) ) ( not ( = ?auto_436684 ?auto_436687 ) ) ( not ( = ?auto_436684 ?auto_436688 ) ) ( not ( = ?auto_436684 ?auto_436689 ) ) ( not ( = ?auto_436684 ?auto_436690 ) ) ( not ( = ?auto_436684 ?auto_436691 ) ) ( not ( = ?auto_436684 ?auto_436692 ) ) ( not ( = ?auto_436684 ?auto_436693 ) ) ( not ( = ?auto_436684 ?auto_436694 ) ) ( not ( = ?auto_436684 ?auto_436695 ) ) ( not ( = ?auto_436684 ?auto_436696 ) ) ( not ( = ?auto_436685 ?auto_436686 ) ) ( not ( = ?auto_436685 ?auto_436687 ) ) ( not ( = ?auto_436685 ?auto_436688 ) ) ( not ( = ?auto_436685 ?auto_436689 ) ) ( not ( = ?auto_436685 ?auto_436690 ) ) ( not ( = ?auto_436685 ?auto_436691 ) ) ( not ( = ?auto_436685 ?auto_436692 ) ) ( not ( = ?auto_436685 ?auto_436693 ) ) ( not ( = ?auto_436685 ?auto_436694 ) ) ( not ( = ?auto_436685 ?auto_436695 ) ) ( not ( = ?auto_436685 ?auto_436696 ) ) ( not ( = ?auto_436686 ?auto_436687 ) ) ( not ( = ?auto_436686 ?auto_436688 ) ) ( not ( = ?auto_436686 ?auto_436689 ) ) ( not ( = ?auto_436686 ?auto_436690 ) ) ( not ( = ?auto_436686 ?auto_436691 ) ) ( not ( = ?auto_436686 ?auto_436692 ) ) ( not ( = ?auto_436686 ?auto_436693 ) ) ( not ( = ?auto_436686 ?auto_436694 ) ) ( not ( = ?auto_436686 ?auto_436695 ) ) ( not ( = ?auto_436686 ?auto_436696 ) ) ( not ( = ?auto_436687 ?auto_436688 ) ) ( not ( = ?auto_436687 ?auto_436689 ) ) ( not ( = ?auto_436687 ?auto_436690 ) ) ( not ( = ?auto_436687 ?auto_436691 ) ) ( not ( = ?auto_436687 ?auto_436692 ) ) ( not ( = ?auto_436687 ?auto_436693 ) ) ( not ( = ?auto_436687 ?auto_436694 ) ) ( not ( = ?auto_436687 ?auto_436695 ) ) ( not ( = ?auto_436687 ?auto_436696 ) ) ( not ( = ?auto_436688 ?auto_436689 ) ) ( not ( = ?auto_436688 ?auto_436690 ) ) ( not ( = ?auto_436688 ?auto_436691 ) ) ( not ( = ?auto_436688 ?auto_436692 ) ) ( not ( = ?auto_436688 ?auto_436693 ) ) ( not ( = ?auto_436688 ?auto_436694 ) ) ( not ( = ?auto_436688 ?auto_436695 ) ) ( not ( = ?auto_436688 ?auto_436696 ) ) ( not ( = ?auto_436689 ?auto_436690 ) ) ( not ( = ?auto_436689 ?auto_436691 ) ) ( not ( = ?auto_436689 ?auto_436692 ) ) ( not ( = ?auto_436689 ?auto_436693 ) ) ( not ( = ?auto_436689 ?auto_436694 ) ) ( not ( = ?auto_436689 ?auto_436695 ) ) ( not ( = ?auto_436689 ?auto_436696 ) ) ( not ( = ?auto_436690 ?auto_436691 ) ) ( not ( = ?auto_436690 ?auto_436692 ) ) ( not ( = ?auto_436690 ?auto_436693 ) ) ( not ( = ?auto_436690 ?auto_436694 ) ) ( not ( = ?auto_436690 ?auto_436695 ) ) ( not ( = ?auto_436690 ?auto_436696 ) ) ( not ( = ?auto_436691 ?auto_436692 ) ) ( not ( = ?auto_436691 ?auto_436693 ) ) ( not ( = ?auto_436691 ?auto_436694 ) ) ( not ( = ?auto_436691 ?auto_436695 ) ) ( not ( = ?auto_436691 ?auto_436696 ) ) ( not ( = ?auto_436692 ?auto_436693 ) ) ( not ( = ?auto_436692 ?auto_436694 ) ) ( not ( = ?auto_436692 ?auto_436695 ) ) ( not ( = ?auto_436692 ?auto_436696 ) ) ( not ( = ?auto_436693 ?auto_436694 ) ) ( not ( = ?auto_436693 ?auto_436695 ) ) ( not ( = ?auto_436693 ?auto_436696 ) ) ( not ( = ?auto_436694 ?auto_436695 ) ) ( not ( = ?auto_436694 ?auto_436696 ) ) ( not ( = ?auto_436695 ?auto_436696 ) ) ( ON ?auto_436694 ?auto_436695 ) ( ON ?auto_436693 ?auto_436694 ) ( ON ?auto_436692 ?auto_436693 ) ( ON ?auto_436691 ?auto_436692 ) ( CLEAR ?auto_436689 ) ( ON ?auto_436690 ?auto_436691 ) ( CLEAR ?auto_436690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_436683 ?auto_436684 ?auto_436685 ?auto_436686 ?auto_436687 ?auto_436688 ?auto_436689 ?auto_436690 )
      ( MAKE-13PILE ?auto_436683 ?auto_436684 ?auto_436685 ?auto_436686 ?auto_436687 ?auto_436688 ?auto_436689 ?auto_436690 ?auto_436691 ?auto_436692 ?auto_436693 ?auto_436694 ?auto_436695 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436710 - BLOCK
      ?auto_436711 - BLOCK
      ?auto_436712 - BLOCK
      ?auto_436713 - BLOCK
      ?auto_436714 - BLOCK
      ?auto_436715 - BLOCK
      ?auto_436716 - BLOCK
      ?auto_436717 - BLOCK
      ?auto_436718 - BLOCK
      ?auto_436719 - BLOCK
      ?auto_436720 - BLOCK
      ?auto_436721 - BLOCK
      ?auto_436722 - BLOCK
    )
    :vars
    (
      ?auto_436723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436722 ?auto_436723 ) ( ON-TABLE ?auto_436710 ) ( ON ?auto_436711 ?auto_436710 ) ( ON ?auto_436712 ?auto_436711 ) ( ON ?auto_436713 ?auto_436712 ) ( ON ?auto_436714 ?auto_436713 ) ( ON ?auto_436715 ?auto_436714 ) ( ON ?auto_436716 ?auto_436715 ) ( not ( = ?auto_436710 ?auto_436711 ) ) ( not ( = ?auto_436710 ?auto_436712 ) ) ( not ( = ?auto_436710 ?auto_436713 ) ) ( not ( = ?auto_436710 ?auto_436714 ) ) ( not ( = ?auto_436710 ?auto_436715 ) ) ( not ( = ?auto_436710 ?auto_436716 ) ) ( not ( = ?auto_436710 ?auto_436717 ) ) ( not ( = ?auto_436710 ?auto_436718 ) ) ( not ( = ?auto_436710 ?auto_436719 ) ) ( not ( = ?auto_436710 ?auto_436720 ) ) ( not ( = ?auto_436710 ?auto_436721 ) ) ( not ( = ?auto_436710 ?auto_436722 ) ) ( not ( = ?auto_436710 ?auto_436723 ) ) ( not ( = ?auto_436711 ?auto_436712 ) ) ( not ( = ?auto_436711 ?auto_436713 ) ) ( not ( = ?auto_436711 ?auto_436714 ) ) ( not ( = ?auto_436711 ?auto_436715 ) ) ( not ( = ?auto_436711 ?auto_436716 ) ) ( not ( = ?auto_436711 ?auto_436717 ) ) ( not ( = ?auto_436711 ?auto_436718 ) ) ( not ( = ?auto_436711 ?auto_436719 ) ) ( not ( = ?auto_436711 ?auto_436720 ) ) ( not ( = ?auto_436711 ?auto_436721 ) ) ( not ( = ?auto_436711 ?auto_436722 ) ) ( not ( = ?auto_436711 ?auto_436723 ) ) ( not ( = ?auto_436712 ?auto_436713 ) ) ( not ( = ?auto_436712 ?auto_436714 ) ) ( not ( = ?auto_436712 ?auto_436715 ) ) ( not ( = ?auto_436712 ?auto_436716 ) ) ( not ( = ?auto_436712 ?auto_436717 ) ) ( not ( = ?auto_436712 ?auto_436718 ) ) ( not ( = ?auto_436712 ?auto_436719 ) ) ( not ( = ?auto_436712 ?auto_436720 ) ) ( not ( = ?auto_436712 ?auto_436721 ) ) ( not ( = ?auto_436712 ?auto_436722 ) ) ( not ( = ?auto_436712 ?auto_436723 ) ) ( not ( = ?auto_436713 ?auto_436714 ) ) ( not ( = ?auto_436713 ?auto_436715 ) ) ( not ( = ?auto_436713 ?auto_436716 ) ) ( not ( = ?auto_436713 ?auto_436717 ) ) ( not ( = ?auto_436713 ?auto_436718 ) ) ( not ( = ?auto_436713 ?auto_436719 ) ) ( not ( = ?auto_436713 ?auto_436720 ) ) ( not ( = ?auto_436713 ?auto_436721 ) ) ( not ( = ?auto_436713 ?auto_436722 ) ) ( not ( = ?auto_436713 ?auto_436723 ) ) ( not ( = ?auto_436714 ?auto_436715 ) ) ( not ( = ?auto_436714 ?auto_436716 ) ) ( not ( = ?auto_436714 ?auto_436717 ) ) ( not ( = ?auto_436714 ?auto_436718 ) ) ( not ( = ?auto_436714 ?auto_436719 ) ) ( not ( = ?auto_436714 ?auto_436720 ) ) ( not ( = ?auto_436714 ?auto_436721 ) ) ( not ( = ?auto_436714 ?auto_436722 ) ) ( not ( = ?auto_436714 ?auto_436723 ) ) ( not ( = ?auto_436715 ?auto_436716 ) ) ( not ( = ?auto_436715 ?auto_436717 ) ) ( not ( = ?auto_436715 ?auto_436718 ) ) ( not ( = ?auto_436715 ?auto_436719 ) ) ( not ( = ?auto_436715 ?auto_436720 ) ) ( not ( = ?auto_436715 ?auto_436721 ) ) ( not ( = ?auto_436715 ?auto_436722 ) ) ( not ( = ?auto_436715 ?auto_436723 ) ) ( not ( = ?auto_436716 ?auto_436717 ) ) ( not ( = ?auto_436716 ?auto_436718 ) ) ( not ( = ?auto_436716 ?auto_436719 ) ) ( not ( = ?auto_436716 ?auto_436720 ) ) ( not ( = ?auto_436716 ?auto_436721 ) ) ( not ( = ?auto_436716 ?auto_436722 ) ) ( not ( = ?auto_436716 ?auto_436723 ) ) ( not ( = ?auto_436717 ?auto_436718 ) ) ( not ( = ?auto_436717 ?auto_436719 ) ) ( not ( = ?auto_436717 ?auto_436720 ) ) ( not ( = ?auto_436717 ?auto_436721 ) ) ( not ( = ?auto_436717 ?auto_436722 ) ) ( not ( = ?auto_436717 ?auto_436723 ) ) ( not ( = ?auto_436718 ?auto_436719 ) ) ( not ( = ?auto_436718 ?auto_436720 ) ) ( not ( = ?auto_436718 ?auto_436721 ) ) ( not ( = ?auto_436718 ?auto_436722 ) ) ( not ( = ?auto_436718 ?auto_436723 ) ) ( not ( = ?auto_436719 ?auto_436720 ) ) ( not ( = ?auto_436719 ?auto_436721 ) ) ( not ( = ?auto_436719 ?auto_436722 ) ) ( not ( = ?auto_436719 ?auto_436723 ) ) ( not ( = ?auto_436720 ?auto_436721 ) ) ( not ( = ?auto_436720 ?auto_436722 ) ) ( not ( = ?auto_436720 ?auto_436723 ) ) ( not ( = ?auto_436721 ?auto_436722 ) ) ( not ( = ?auto_436721 ?auto_436723 ) ) ( not ( = ?auto_436722 ?auto_436723 ) ) ( ON ?auto_436721 ?auto_436722 ) ( ON ?auto_436720 ?auto_436721 ) ( ON ?auto_436719 ?auto_436720 ) ( ON ?auto_436718 ?auto_436719 ) ( CLEAR ?auto_436716 ) ( ON ?auto_436717 ?auto_436718 ) ( CLEAR ?auto_436717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_436710 ?auto_436711 ?auto_436712 ?auto_436713 ?auto_436714 ?auto_436715 ?auto_436716 ?auto_436717 )
      ( MAKE-13PILE ?auto_436710 ?auto_436711 ?auto_436712 ?auto_436713 ?auto_436714 ?auto_436715 ?auto_436716 ?auto_436717 ?auto_436718 ?auto_436719 ?auto_436720 ?auto_436721 ?auto_436722 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436737 - BLOCK
      ?auto_436738 - BLOCK
      ?auto_436739 - BLOCK
      ?auto_436740 - BLOCK
      ?auto_436741 - BLOCK
      ?auto_436742 - BLOCK
      ?auto_436743 - BLOCK
      ?auto_436744 - BLOCK
      ?auto_436745 - BLOCK
      ?auto_436746 - BLOCK
      ?auto_436747 - BLOCK
      ?auto_436748 - BLOCK
      ?auto_436749 - BLOCK
    )
    :vars
    (
      ?auto_436750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436749 ?auto_436750 ) ( ON-TABLE ?auto_436737 ) ( ON ?auto_436738 ?auto_436737 ) ( ON ?auto_436739 ?auto_436738 ) ( ON ?auto_436740 ?auto_436739 ) ( ON ?auto_436741 ?auto_436740 ) ( ON ?auto_436742 ?auto_436741 ) ( not ( = ?auto_436737 ?auto_436738 ) ) ( not ( = ?auto_436737 ?auto_436739 ) ) ( not ( = ?auto_436737 ?auto_436740 ) ) ( not ( = ?auto_436737 ?auto_436741 ) ) ( not ( = ?auto_436737 ?auto_436742 ) ) ( not ( = ?auto_436737 ?auto_436743 ) ) ( not ( = ?auto_436737 ?auto_436744 ) ) ( not ( = ?auto_436737 ?auto_436745 ) ) ( not ( = ?auto_436737 ?auto_436746 ) ) ( not ( = ?auto_436737 ?auto_436747 ) ) ( not ( = ?auto_436737 ?auto_436748 ) ) ( not ( = ?auto_436737 ?auto_436749 ) ) ( not ( = ?auto_436737 ?auto_436750 ) ) ( not ( = ?auto_436738 ?auto_436739 ) ) ( not ( = ?auto_436738 ?auto_436740 ) ) ( not ( = ?auto_436738 ?auto_436741 ) ) ( not ( = ?auto_436738 ?auto_436742 ) ) ( not ( = ?auto_436738 ?auto_436743 ) ) ( not ( = ?auto_436738 ?auto_436744 ) ) ( not ( = ?auto_436738 ?auto_436745 ) ) ( not ( = ?auto_436738 ?auto_436746 ) ) ( not ( = ?auto_436738 ?auto_436747 ) ) ( not ( = ?auto_436738 ?auto_436748 ) ) ( not ( = ?auto_436738 ?auto_436749 ) ) ( not ( = ?auto_436738 ?auto_436750 ) ) ( not ( = ?auto_436739 ?auto_436740 ) ) ( not ( = ?auto_436739 ?auto_436741 ) ) ( not ( = ?auto_436739 ?auto_436742 ) ) ( not ( = ?auto_436739 ?auto_436743 ) ) ( not ( = ?auto_436739 ?auto_436744 ) ) ( not ( = ?auto_436739 ?auto_436745 ) ) ( not ( = ?auto_436739 ?auto_436746 ) ) ( not ( = ?auto_436739 ?auto_436747 ) ) ( not ( = ?auto_436739 ?auto_436748 ) ) ( not ( = ?auto_436739 ?auto_436749 ) ) ( not ( = ?auto_436739 ?auto_436750 ) ) ( not ( = ?auto_436740 ?auto_436741 ) ) ( not ( = ?auto_436740 ?auto_436742 ) ) ( not ( = ?auto_436740 ?auto_436743 ) ) ( not ( = ?auto_436740 ?auto_436744 ) ) ( not ( = ?auto_436740 ?auto_436745 ) ) ( not ( = ?auto_436740 ?auto_436746 ) ) ( not ( = ?auto_436740 ?auto_436747 ) ) ( not ( = ?auto_436740 ?auto_436748 ) ) ( not ( = ?auto_436740 ?auto_436749 ) ) ( not ( = ?auto_436740 ?auto_436750 ) ) ( not ( = ?auto_436741 ?auto_436742 ) ) ( not ( = ?auto_436741 ?auto_436743 ) ) ( not ( = ?auto_436741 ?auto_436744 ) ) ( not ( = ?auto_436741 ?auto_436745 ) ) ( not ( = ?auto_436741 ?auto_436746 ) ) ( not ( = ?auto_436741 ?auto_436747 ) ) ( not ( = ?auto_436741 ?auto_436748 ) ) ( not ( = ?auto_436741 ?auto_436749 ) ) ( not ( = ?auto_436741 ?auto_436750 ) ) ( not ( = ?auto_436742 ?auto_436743 ) ) ( not ( = ?auto_436742 ?auto_436744 ) ) ( not ( = ?auto_436742 ?auto_436745 ) ) ( not ( = ?auto_436742 ?auto_436746 ) ) ( not ( = ?auto_436742 ?auto_436747 ) ) ( not ( = ?auto_436742 ?auto_436748 ) ) ( not ( = ?auto_436742 ?auto_436749 ) ) ( not ( = ?auto_436742 ?auto_436750 ) ) ( not ( = ?auto_436743 ?auto_436744 ) ) ( not ( = ?auto_436743 ?auto_436745 ) ) ( not ( = ?auto_436743 ?auto_436746 ) ) ( not ( = ?auto_436743 ?auto_436747 ) ) ( not ( = ?auto_436743 ?auto_436748 ) ) ( not ( = ?auto_436743 ?auto_436749 ) ) ( not ( = ?auto_436743 ?auto_436750 ) ) ( not ( = ?auto_436744 ?auto_436745 ) ) ( not ( = ?auto_436744 ?auto_436746 ) ) ( not ( = ?auto_436744 ?auto_436747 ) ) ( not ( = ?auto_436744 ?auto_436748 ) ) ( not ( = ?auto_436744 ?auto_436749 ) ) ( not ( = ?auto_436744 ?auto_436750 ) ) ( not ( = ?auto_436745 ?auto_436746 ) ) ( not ( = ?auto_436745 ?auto_436747 ) ) ( not ( = ?auto_436745 ?auto_436748 ) ) ( not ( = ?auto_436745 ?auto_436749 ) ) ( not ( = ?auto_436745 ?auto_436750 ) ) ( not ( = ?auto_436746 ?auto_436747 ) ) ( not ( = ?auto_436746 ?auto_436748 ) ) ( not ( = ?auto_436746 ?auto_436749 ) ) ( not ( = ?auto_436746 ?auto_436750 ) ) ( not ( = ?auto_436747 ?auto_436748 ) ) ( not ( = ?auto_436747 ?auto_436749 ) ) ( not ( = ?auto_436747 ?auto_436750 ) ) ( not ( = ?auto_436748 ?auto_436749 ) ) ( not ( = ?auto_436748 ?auto_436750 ) ) ( not ( = ?auto_436749 ?auto_436750 ) ) ( ON ?auto_436748 ?auto_436749 ) ( ON ?auto_436747 ?auto_436748 ) ( ON ?auto_436746 ?auto_436747 ) ( ON ?auto_436745 ?auto_436746 ) ( ON ?auto_436744 ?auto_436745 ) ( CLEAR ?auto_436742 ) ( ON ?auto_436743 ?auto_436744 ) ( CLEAR ?auto_436743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_436737 ?auto_436738 ?auto_436739 ?auto_436740 ?auto_436741 ?auto_436742 ?auto_436743 )
      ( MAKE-13PILE ?auto_436737 ?auto_436738 ?auto_436739 ?auto_436740 ?auto_436741 ?auto_436742 ?auto_436743 ?auto_436744 ?auto_436745 ?auto_436746 ?auto_436747 ?auto_436748 ?auto_436749 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436764 - BLOCK
      ?auto_436765 - BLOCK
      ?auto_436766 - BLOCK
      ?auto_436767 - BLOCK
      ?auto_436768 - BLOCK
      ?auto_436769 - BLOCK
      ?auto_436770 - BLOCK
      ?auto_436771 - BLOCK
      ?auto_436772 - BLOCK
      ?auto_436773 - BLOCK
      ?auto_436774 - BLOCK
      ?auto_436775 - BLOCK
      ?auto_436776 - BLOCK
    )
    :vars
    (
      ?auto_436777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436776 ?auto_436777 ) ( ON-TABLE ?auto_436764 ) ( ON ?auto_436765 ?auto_436764 ) ( ON ?auto_436766 ?auto_436765 ) ( ON ?auto_436767 ?auto_436766 ) ( ON ?auto_436768 ?auto_436767 ) ( ON ?auto_436769 ?auto_436768 ) ( not ( = ?auto_436764 ?auto_436765 ) ) ( not ( = ?auto_436764 ?auto_436766 ) ) ( not ( = ?auto_436764 ?auto_436767 ) ) ( not ( = ?auto_436764 ?auto_436768 ) ) ( not ( = ?auto_436764 ?auto_436769 ) ) ( not ( = ?auto_436764 ?auto_436770 ) ) ( not ( = ?auto_436764 ?auto_436771 ) ) ( not ( = ?auto_436764 ?auto_436772 ) ) ( not ( = ?auto_436764 ?auto_436773 ) ) ( not ( = ?auto_436764 ?auto_436774 ) ) ( not ( = ?auto_436764 ?auto_436775 ) ) ( not ( = ?auto_436764 ?auto_436776 ) ) ( not ( = ?auto_436764 ?auto_436777 ) ) ( not ( = ?auto_436765 ?auto_436766 ) ) ( not ( = ?auto_436765 ?auto_436767 ) ) ( not ( = ?auto_436765 ?auto_436768 ) ) ( not ( = ?auto_436765 ?auto_436769 ) ) ( not ( = ?auto_436765 ?auto_436770 ) ) ( not ( = ?auto_436765 ?auto_436771 ) ) ( not ( = ?auto_436765 ?auto_436772 ) ) ( not ( = ?auto_436765 ?auto_436773 ) ) ( not ( = ?auto_436765 ?auto_436774 ) ) ( not ( = ?auto_436765 ?auto_436775 ) ) ( not ( = ?auto_436765 ?auto_436776 ) ) ( not ( = ?auto_436765 ?auto_436777 ) ) ( not ( = ?auto_436766 ?auto_436767 ) ) ( not ( = ?auto_436766 ?auto_436768 ) ) ( not ( = ?auto_436766 ?auto_436769 ) ) ( not ( = ?auto_436766 ?auto_436770 ) ) ( not ( = ?auto_436766 ?auto_436771 ) ) ( not ( = ?auto_436766 ?auto_436772 ) ) ( not ( = ?auto_436766 ?auto_436773 ) ) ( not ( = ?auto_436766 ?auto_436774 ) ) ( not ( = ?auto_436766 ?auto_436775 ) ) ( not ( = ?auto_436766 ?auto_436776 ) ) ( not ( = ?auto_436766 ?auto_436777 ) ) ( not ( = ?auto_436767 ?auto_436768 ) ) ( not ( = ?auto_436767 ?auto_436769 ) ) ( not ( = ?auto_436767 ?auto_436770 ) ) ( not ( = ?auto_436767 ?auto_436771 ) ) ( not ( = ?auto_436767 ?auto_436772 ) ) ( not ( = ?auto_436767 ?auto_436773 ) ) ( not ( = ?auto_436767 ?auto_436774 ) ) ( not ( = ?auto_436767 ?auto_436775 ) ) ( not ( = ?auto_436767 ?auto_436776 ) ) ( not ( = ?auto_436767 ?auto_436777 ) ) ( not ( = ?auto_436768 ?auto_436769 ) ) ( not ( = ?auto_436768 ?auto_436770 ) ) ( not ( = ?auto_436768 ?auto_436771 ) ) ( not ( = ?auto_436768 ?auto_436772 ) ) ( not ( = ?auto_436768 ?auto_436773 ) ) ( not ( = ?auto_436768 ?auto_436774 ) ) ( not ( = ?auto_436768 ?auto_436775 ) ) ( not ( = ?auto_436768 ?auto_436776 ) ) ( not ( = ?auto_436768 ?auto_436777 ) ) ( not ( = ?auto_436769 ?auto_436770 ) ) ( not ( = ?auto_436769 ?auto_436771 ) ) ( not ( = ?auto_436769 ?auto_436772 ) ) ( not ( = ?auto_436769 ?auto_436773 ) ) ( not ( = ?auto_436769 ?auto_436774 ) ) ( not ( = ?auto_436769 ?auto_436775 ) ) ( not ( = ?auto_436769 ?auto_436776 ) ) ( not ( = ?auto_436769 ?auto_436777 ) ) ( not ( = ?auto_436770 ?auto_436771 ) ) ( not ( = ?auto_436770 ?auto_436772 ) ) ( not ( = ?auto_436770 ?auto_436773 ) ) ( not ( = ?auto_436770 ?auto_436774 ) ) ( not ( = ?auto_436770 ?auto_436775 ) ) ( not ( = ?auto_436770 ?auto_436776 ) ) ( not ( = ?auto_436770 ?auto_436777 ) ) ( not ( = ?auto_436771 ?auto_436772 ) ) ( not ( = ?auto_436771 ?auto_436773 ) ) ( not ( = ?auto_436771 ?auto_436774 ) ) ( not ( = ?auto_436771 ?auto_436775 ) ) ( not ( = ?auto_436771 ?auto_436776 ) ) ( not ( = ?auto_436771 ?auto_436777 ) ) ( not ( = ?auto_436772 ?auto_436773 ) ) ( not ( = ?auto_436772 ?auto_436774 ) ) ( not ( = ?auto_436772 ?auto_436775 ) ) ( not ( = ?auto_436772 ?auto_436776 ) ) ( not ( = ?auto_436772 ?auto_436777 ) ) ( not ( = ?auto_436773 ?auto_436774 ) ) ( not ( = ?auto_436773 ?auto_436775 ) ) ( not ( = ?auto_436773 ?auto_436776 ) ) ( not ( = ?auto_436773 ?auto_436777 ) ) ( not ( = ?auto_436774 ?auto_436775 ) ) ( not ( = ?auto_436774 ?auto_436776 ) ) ( not ( = ?auto_436774 ?auto_436777 ) ) ( not ( = ?auto_436775 ?auto_436776 ) ) ( not ( = ?auto_436775 ?auto_436777 ) ) ( not ( = ?auto_436776 ?auto_436777 ) ) ( ON ?auto_436775 ?auto_436776 ) ( ON ?auto_436774 ?auto_436775 ) ( ON ?auto_436773 ?auto_436774 ) ( ON ?auto_436772 ?auto_436773 ) ( ON ?auto_436771 ?auto_436772 ) ( CLEAR ?auto_436769 ) ( ON ?auto_436770 ?auto_436771 ) ( CLEAR ?auto_436770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_436764 ?auto_436765 ?auto_436766 ?auto_436767 ?auto_436768 ?auto_436769 ?auto_436770 )
      ( MAKE-13PILE ?auto_436764 ?auto_436765 ?auto_436766 ?auto_436767 ?auto_436768 ?auto_436769 ?auto_436770 ?auto_436771 ?auto_436772 ?auto_436773 ?auto_436774 ?auto_436775 ?auto_436776 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436791 - BLOCK
      ?auto_436792 - BLOCK
      ?auto_436793 - BLOCK
      ?auto_436794 - BLOCK
      ?auto_436795 - BLOCK
      ?auto_436796 - BLOCK
      ?auto_436797 - BLOCK
      ?auto_436798 - BLOCK
      ?auto_436799 - BLOCK
      ?auto_436800 - BLOCK
      ?auto_436801 - BLOCK
      ?auto_436802 - BLOCK
      ?auto_436803 - BLOCK
    )
    :vars
    (
      ?auto_436804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436803 ?auto_436804 ) ( ON-TABLE ?auto_436791 ) ( ON ?auto_436792 ?auto_436791 ) ( ON ?auto_436793 ?auto_436792 ) ( ON ?auto_436794 ?auto_436793 ) ( ON ?auto_436795 ?auto_436794 ) ( not ( = ?auto_436791 ?auto_436792 ) ) ( not ( = ?auto_436791 ?auto_436793 ) ) ( not ( = ?auto_436791 ?auto_436794 ) ) ( not ( = ?auto_436791 ?auto_436795 ) ) ( not ( = ?auto_436791 ?auto_436796 ) ) ( not ( = ?auto_436791 ?auto_436797 ) ) ( not ( = ?auto_436791 ?auto_436798 ) ) ( not ( = ?auto_436791 ?auto_436799 ) ) ( not ( = ?auto_436791 ?auto_436800 ) ) ( not ( = ?auto_436791 ?auto_436801 ) ) ( not ( = ?auto_436791 ?auto_436802 ) ) ( not ( = ?auto_436791 ?auto_436803 ) ) ( not ( = ?auto_436791 ?auto_436804 ) ) ( not ( = ?auto_436792 ?auto_436793 ) ) ( not ( = ?auto_436792 ?auto_436794 ) ) ( not ( = ?auto_436792 ?auto_436795 ) ) ( not ( = ?auto_436792 ?auto_436796 ) ) ( not ( = ?auto_436792 ?auto_436797 ) ) ( not ( = ?auto_436792 ?auto_436798 ) ) ( not ( = ?auto_436792 ?auto_436799 ) ) ( not ( = ?auto_436792 ?auto_436800 ) ) ( not ( = ?auto_436792 ?auto_436801 ) ) ( not ( = ?auto_436792 ?auto_436802 ) ) ( not ( = ?auto_436792 ?auto_436803 ) ) ( not ( = ?auto_436792 ?auto_436804 ) ) ( not ( = ?auto_436793 ?auto_436794 ) ) ( not ( = ?auto_436793 ?auto_436795 ) ) ( not ( = ?auto_436793 ?auto_436796 ) ) ( not ( = ?auto_436793 ?auto_436797 ) ) ( not ( = ?auto_436793 ?auto_436798 ) ) ( not ( = ?auto_436793 ?auto_436799 ) ) ( not ( = ?auto_436793 ?auto_436800 ) ) ( not ( = ?auto_436793 ?auto_436801 ) ) ( not ( = ?auto_436793 ?auto_436802 ) ) ( not ( = ?auto_436793 ?auto_436803 ) ) ( not ( = ?auto_436793 ?auto_436804 ) ) ( not ( = ?auto_436794 ?auto_436795 ) ) ( not ( = ?auto_436794 ?auto_436796 ) ) ( not ( = ?auto_436794 ?auto_436797 ) ) ( not ( = ?auto_436794 ?auto_436798 ) ) ( not ( = ?auto_436794 ?auto_436799 ) ) ( not ( = ?auto_436794 ?auto_436800 ) ) ( not ( = ?auto_436794 ?auto_436801 ) ) ( not ( = ?auto_436794 ?auto_436802 ) ) ( not ( = ?auto_436794 ?auto_436803 ) ) ( not ( = ?auto_436794 ?auto_436804 ) ) ( not ( = ?auto_436795 ?auto_436796 ) ) ( not ( = ?auto_436795 ?auto_436797 ) ) ( not ( = ?auto_436795 ?auto_436798 ) ) ( not ( = ?auto_436795 ?auto_436799 ) ) ( not ( = ?auto_436795 ?auto_436800 ) ) ( not ( = ?auto_436795 ?auto_436801 ) ) ( not ( = ?auto_436795 ?auto_436802 ) ) ( not ( = ?auto_436795 ?auto_436803 ) ) ( not ( = ?auto_436795 ?auto_436804 ) ) ( not ( = ?auto_436796 ?auto_436797 ) ) ( not ( = ?auto_436796 ?auto_436798 ) ) ( not ( = ?auto_436796 ?auto_436799 ) ) ( not ( = ?auto_436796 ?auto_436800 ) ) ( not ( = ?auto_436796 ?auto_436801 ) ) ( not ( = ?auto_436796 ?auto_436802 ) ) ( not ( = ?auto_436796 ?auto_436803 ) ) ( not ( = ?auto_436796 ?auto_436804 ) ) ( not ( = ?auto_436797 ?auto_436798 ) ) ( not ( = ?auto_436797 ?auto_436799 ) ) ( not ( = ?auto_436797 ?auto_436800 ) ) ( not ( = ?auto_436797 ?auto_436801 ) ) ( not ( = ?auto_436797 ?auto_436802 ) ) ( not ( = ?auto_436797 ?auto_436803 ) ) ( not ( = ?auto_436797 ?auto_436804 ) ) ( not ( = ?auto_436798 ?auto_436799 ) ) ( not ( = ?auto_436798 ?auto_436800 ) ) ( not ( = ?auto_436798 ?auto_436801 ) ) ( not ( = ?auto_436798 ?auto_436802 ) ) ( not ( = ?auto_436798 ?auto_436803 ) ) ( not ( = ?auto_436798 ?auto_436804 ) ) ( not ( = ?auto_436799 ?auto_436800 ) ) ( not ( = ?auto_436799 ?auto_436801 ) ) ( not ( = ?auto_436799 ?auto_436802 ) ) ( not ( = ?auto_436799 ?auto_436803 ) ) ( not ( = ?auto_436799 ?auto_436804 ) ) ( not ( = ?auto_436800 ?auto_436801 ) ) ( not ( = ?auto_436800 ?auto_436802 ) ) ( not ( = ?auto_436800 ?auto_436803 ) ) ( not ( = ?auto_436800 ?auto_436804 ) ) ( not ( = ?auto_436801 ?auto_436802 ) ) ( not ( = ?auto_436801 ?auto_436803 ) ) ( not ( = ?auto_436801 ?auto_436804 ) ) ( not ( = ?auto_436802 ?auto_436803 ) ) ( not ( = ?auto_436802 ?auto_436804 ) ) ( not ( = ?auto_436803 ?auto_436804 ) ) ( ON ?auto_436802 ?auto_436803 ) ( ON ?auto_436801 ?auto_436802 ) ( ON ?auto_436800 ?auto_436801 ) ( ON ?auto_436799 ?auto_436800 ) ( ON ?auto_436798 ?auto_436799 ) ( ON ?auto_436797 ?auto_436798 ) ( CLEAR ?auto_436795 ) ( ON ?auto_436796 ?auto_436797 ) ( CLEAR ?auto_436796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_436791 ?auto_436792 ?auto_436793 ?auto_436794 ?auto_436795 ?auto_436796 )
      ( MAKE-13PILE ?auto_436791 ?auto_436792 ?auto_436793 ?auto_436794 ?auto_436795 ?auto_436796 ?auto_436797 ?auto_436798 ?auto_436799 ?auto_436800 ?auto_436801 ?auto_436802 ?auto_436803 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436818 - BLOCK
      ?auto_436819 - BLOCK
      ?auto_436820 - BLOCK
      ?auto_436821 - BLOCK
      ?auto_436822 - BLOCK
      ?auto_436823 - BLOCK
      ?auto_436824 - BLOCK
      ?auto_436825 - BLOCK
      ?auto_436826 - BLOCK
      ?auto_436827 - BLOCK
      ?auto_436828 - BLOCK
      ?auto_436829 - BLOCK
      ?auto_436830 - BLOCK
    )
    :vars
    (
      ?auto_436831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436830 ?auto_436831 ) ( ON-TABLE ?auto_436818 ) ( ON ?auto_436819 ?auto_436818 ) ( ON ?auto_436820 ?auto_436819 ) ( ON ?auto_436821 ?auto_436820 ) ( ON ?auto_436822 ?auto_436821 ) ( not ( = ?auto_436818 ?auto_436819 ) ) ( not ( = ?auto_436818 ?auto_436820 ) ) ( not ( = ?auto_436818 ?auto_436821 ) ) ( not ( = ?auto_436818 ?auto_436822 ) ) ( not ( = ?auto_436818 ?auto_436823 ) ) ( not ( = ?auto_436818 ?auto_436824 ) ) ( not ( = ?auto_436818 ?auto_436825 ) ) ( not ( = ?auto_436818 ?auto_436826 ) ) ( not ( = ?auto_436818 ?auto_436827 ) ) ( not ( = ?auto_436818 ?auto_436828 ) ) ( not ( = ?auto_436818 ?auto_436829 ) ) ( not ( = ?auto_436818 ?auto_436830 ) ) ( not ( = ?auto_436818 ?auto_436831 ) ) ( not ( = ?auto_436819 ?auto_436820 ) ) ( not ( = ?auto_436819 ?auto_436821 ) ) ( not ( = ?auto_436819 ?auto_436822 ) ) ( not ( = ?auto_436819 ?auto_436823 ) ) ( not ( = ?auto_436819 ?auto_436824 ) ) ( not ( = ?auto_436819 ?auto_436825 ) ) ( not ( = ?auto_436819 ?auto_436826 ) ) ( not ( = ?auto_436819 ?auto_436827 ) ) ( not ( = ?auto_436819 ?auto_436828 ) ) ( not ( = ?auto_436819 ?auto_436829 ) ) ( not ( = ?auto_436819 ?auto_436830 ) ) ( not ( = ?auto_436819 ?auto_436831 ) ) ( not ( = ?auto_436820 ?auto_436821 ) ) ( not ( = ?auto_436820 ?auto_436822 ) ) ( not ( = ?auto_436820 ?auto_436823 ) ) ( not ( = ?auto_436820 ?auto_436824 ) ) ( not ( = ?auto_436820 ?auto_436825 ) ) ( not ( = ?auto_436820 ?auto_436826 ) ) ( not ( = ?auto_436820 ?auto_436827 ) ) ( not ( = ?auto_436820 ?auto_436828 ) ) ( not ( = ?auto_436820 ?auto_436829 ) ) ( not ( = ?auto_436820 ?auto_436830 ) ) ( not ( = ?auto_436820 ?auto_436831 ) ) ( not ( = ?auto_436821 ?auto_436822 ) ) ( not ( = ?auto_436821 ?auto_436823 ) ) ( not ( = ?auto_436821 ?auto_436824 ) ) ( not ( = ?auto_436821 ?auto_436825 ) ) ( not ( = ?auto_436821 ?auto_436826 ) ) ( not ( = ?auto_436821 ?auto_436827 ) ) ( not ( = ?auto_436821 ?auto_436828 ) ) ( not ( = ?auto_436821 ?auto_436829 ) ) ( not ( = ?auto_436821 ?auto_436830 ) ) ( not ( = ?auto_436821 ?auto_436831 ) ) ( not ( = ?auto_436822 ?auto_436823 ) ) ( not ( = ?auto_436822 ?auto_436824 ) ) ( not ( = ?auto_436822 ?auto_436825 ) ) ( not ( = ?auto_436822 ?auto_436826 ) ) ( not ( = ?auto_436822 ?auto_436827 ) ) ( not ( = ?auto_436822 ?auto_436828 ) ) ( not ( = ?auto_436822 ?auto_436829 ) ) ( not ( = ?auto_436822 ?auto_436830 ) ) ( not ( = ?auto_436822 ?auto_436831 ) ) ( not ( = ?auto_436823 ?auto_436824 ) ) ( not ( = ?auto_436823 ?auto_436825 ) ) ( not ( = ?auto_436823 ?auto_436826 ) ) ( not ( = ?auto_436823 ?auto_436827 ) ) ( not ( = ?auto_436823 ?auto_436828 ) ) ( not ( = ?auto_436823 ?auto_436829 ) ) ( not ( = ?auto_436823 ?auto_436830 ) ) ( not ( = ?auto_436823 ?auto_436831 ) ) ( not ( = ?auto_436824 ?auto_436825 ) ) ( not ( = ?auto_436824 ?auto_436826 ) ) ( not ( = ?auto_436824 ?auto_436827 ) ) ( not ( = ?auto_436824 ?auto_436828 ) ) ( not ( = ?auto_436824 ?auto_436829 ) ) ( not ( = ?auto_436824 ?auto_436830 ) ) ( not ( = ?auto_436824 ?auto_436831 ) ) ( not ( = ?auto_436825 ?auto_436826 ) ) ( not ( = ?auto_436825 ?auto_436827 ) ) ( not ( = ?auto_436825 ?auto_436828 ) ) ( not ( = ?auto_436825 ?auto_436829 ) ) ( not ( = ?auto_436825 ?auto_436830 ) ) ( not ( = ?auto_436825 ?auto_436831 ) ) ( not ( = ?auto_436826 ?auto_436827 ) ) ( not ( = ?auto_436826 ?auto_436828 ) ) ( not ( = ?auto_436826 ?auto_436829 ) ) ( not ( = ?auto_436826 ?auto_436830 ) ) ( not ( = ?auto_436826 ?auto_436831 ) ) ( not ( = ?auto_436827 ?auto_436828 ) ) ( not ( = ?auto_436827 ?auto_436829 ) ) ( not ( = ?auto_436827 ?auto_436830 ) ) ( not ( = ?auto_436827 ?auto_436831 ) ) ( not ( = ?auto_436828 ?auto_436829 ) ) ( not ( = ?auto_436828 ?auto_436830 ) ) ( not ( = ?auto_436828 ?auto_436831 ) ) ( not ( = ?auto_436829 ?auto_436830 ) ) ( not ( = ?auto_436829 ?auto_436831 ) ) ( not ( = ?auto_436830 ?auto_436831 ) ) ( ON ?auto_436829 ?auto_436830 ) ( ON ?auto_436828 ?auto_436829 ) ( ON ?auto_436827 ?auto_436828 ) ( ON ?auto_436826 ?auto_436827 ) ( ON ?auto_436825 ?auto_436826 ) ( ON ?auto_436824 ?auto_436825 ) ( CLEAR ?auto_436822 ) ( ON ?auto_436823 ?auto_436824 ) ( CLEAR ?auto_436823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_436818 ?auto_436819 ?auto_436820 ?auto_436821 ?auto_436822 ?auto_436823 )
      ( MAKE-13PILE ?auto_436818 ?auto_436819 ?auto_436820 ?auto_436821 ?auto_436822 ?auto_436823 ?auto_436824 ?auto_436825 ?auto_436826 ?auto_436827 ?auto_436828 ?auto_436829 ?auto_436830 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436845 - BLOCK
      ?auto_436846 - BLOCK
      ?auto_436847 - BLOCK
      ?auto_436848 - BLOCK
      ?auto_436849 - BLOCK
      ?auto_436850 - BLOCK
      ?auto_436851 - BLOCK
      ?auto_436852 - BLOCK
      ?auto_436853 - BLOCK
      ?auto_436854 - BLOCK
      ?auto_436855 - BLOCK
      ?auto_436856 - BLOCK
      ?auto_436857 - BLOCK
    )
    :vars
    (
      ?auto_436858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436857 ?auto_436858 ) ( ON-TABLE ?auto_436845 ) ( ON ?auto_436846 ?auto_436845 ) ( ON ?auto_436847 ?auto_436846 ) ( ON ?auto_436848 ?auto_436847 ) ( not ( = ?auto_436845 ?auto_436846 ) ) ( not ( = ?auto_436845 ?auto_436847 ) ) ( not ( = ?auto_436845 ?auto_436848 ) ) ( not ( = ?auto_436845 ?auto_436849 ) ) ( not ( = ?auto_436845 ?auto_436850 ) ) ( not ( = ?auto_436845 ?auto_436851 ) ) ( not ( = ?auto_436845 ?auto_436852 ) ) ( not ( = ?auto_436845 ?auto_436853 ) ) ( not ( = ?auto_436845 ?auto_436854 ) ) ( not ( = ?auto_436845 ?auto_436855 ) ) ( not ( = ?auto_436845 ?auto_436856 ) ) ( not ( = ?auto_436845 ?auto_436857 ) ) ( not ( = ?auto_436845 ?auto_436858 ) ) ( not ( = ?auto_436846 ?auto_436847 ) ) ( not ( = ?auto_436846 ?auto_436848 ) ) ( not ( = ?auto_436846 ?auto_436849 ) ) ( not ( = ?auto_436846 ?auto_436850 ) ) ( not ( = ?auto_436846 ?auto_436851 ) ) ( not ( = ?auto_436846 ?auto_436852 ) ) ( not ( = ?auto_436846 ?auto_436853 ) ) ( not ( = ?auto_436846 ?auto_436854 ) ) ( not ( = ?auto_436846 ?auto_436855 ) ) ( not ( = ?auto_436846 ?auto_436856 ) ) ( not ( = ?auto_436846 ?auto_436857 ) ) ( not ( = ?auto_436846 ?auto_436858 ) ) ( not ( = ?auto_436847 ?auto_436848 ) ) ( not ( = ?auto_436847 ?auto_436849 ) ) ( not ( = ?auto_436847 ?auto_436850 ) ) ( not ( = ?auto_436847 ?auto_436851 ) ) ( not ( = ?auto_436847 ?auto_436852 ) ) ( not ( = ?auto_436847 ?auto_436853 ) ) ( not ( = ?auto_436847 ?auto_436854 ) ) ( not ( = ?auto_436847 ?auto_436855 ) ) ( not ( = ?auto_436847 ?auto_436856 ) ) ( not ( = ?auto_436847 ?auto_436857 ) ) ( not ( = ?auto_436847 ?auto_436858 ) ) ( not ( = ?auto_436848 ?auto_436849 ) ) ( not ( = ?auto_436848 ?auto_436850 ) ) ( not ( = ?auto_436848 ?auto_436851 ) ) ( not ( = ?auto_436848 ?auto_436852 ) ) ( not ( = ?auto_436848 ?auto_436853 ) ) ( not ( = ?auto_436848 ?auto_436854 ) ) ( not ( = ?auto_436848 ?auto_436855 ) ) ( not ( = ?auto_436848 ?auto_436856 ) ) ( not ( = ?auto_436848 ?auto_436857 ) ) ( not ( = ?auto_436848 ?auto_436858 ) ) ( not ( = ?auto_436849 ?auto_436850 ) ) ( not ( = ?auto_436849 ?auto_436851 ) ) ( not ( = ?auto_436849 ?auto_436852 ) ) ( not ( = ?auto_436849 ?auto_436853 ) ) ( not ( = ?auto_436849 ?auto_436854 ) ) ( not ( = ?auto_436849 ?auto_436855 ) ) ( not ( = ?auto_436849 ?auto_436856 ) ) ( not ( = ?auto_436849 ?auto_436857 ) ) ( not ( = ?auto_436849 ?auto_436858 ) ) ( not ( = ?auto_436850 ?auto_436851 ) ) ( not ( = ?auto_436850 ?auto_436852 ) ) ( not ( = ?auto_436850 ?auto_436853 ) ) ( not ( = ?auto_436850 ?auto_436854 ) ) ( not ( = ?auto_436850 ?auto_436855 ) ) ( not ( = ?auto_436850 ?auto_436856 ) ) ( not ( = ?auto_436850 ?auto_436857 ) ) ( not ( = ?auto_436850 ?auto_436858 ) ) ( not ( = ?auto_436851 ?auto_436852 ) ) ( not ( = ?auto_436851 ?auto_436853 ) ) ( not ( = ?auto_436851 ?auto_436854 ) ) ( not ( = ?auto_436851 ?auto_436855 ) ) ( not ( = ?auto_436851 ?auto_436856 ) ) ( not ( = ?auto_436851 ?auto_436857 ) ) ( not ( = ?auto_436851 ?auto_436858 ) ) ( not ( = ?auto_436852 ?auto_436853 ) ) ( not ( = ?auto_436852 ?auto_436854 ) ) ( not ( = ?auto_436852 ?auto_436855 ) ) ( not ( = ?auto_436852 ?auto_436856 ) ) ( not ( = ?auto_436852 ?auto_436857 ) ) ( not ( = ?auto_436852 ?auto_436858 ) ) ( not ( = ?auto_436853 ?auto_436854 ) ) ( not ( = ?auto_436853 ?auto_436855 ) ) ( not ( = ?auto_436853 ?auto_436856 ) ) ( not ( = ?auto_436853 ?auto_436857 ) ) ( not ( = ?auto_436853 ?auto_436858 ) ) ( not ( = ?auto_436854 ?auto_436855 ) ) ( not ( = ?auto_436854 ?auto_436856 ) ) ( not ( = ?auto_436854 ?auto_436857 ) ) ( not ( = ?auto_436854 ?auto_436858 ) ) ( not ( = ?auto_436855 ?auto_436856 ) ) ( not ( = ?auto_436855 ?auto_436857 ) ) ( not ( = ?auto_436855 ?auto_436858 ) ) ( not ( = ?auto_436856 ?auto_436857 ) ) ( not ( = ?auto_436856 ?auto_436858 ) ) ( not ( = ?auto_436857 ?auto_436858 ) ) ( ON ?auto_436856 ?auto_436857 ) ( ON ?auto_436855 ?auto_436856 ) ( ON ?auto_436854 ?auto_436855 ) ( ON ?auto_436853 ?auto_436854 ) ( ON ?auto_436852 ?auto_436853 ) ( ON ?auto_436851 ?auto_436852 ) ( ON ?auto_436850 ?auto_436851 ) ( CLEAR ?auto_436848 ) ( ON ?auto_436849 ?auto_436850 ) ( CLEAR ?auto_436849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_436845 ?auto_436846 ?auto_436847 ?auto_436848 ?auto_436849 )
      ( MAKE-13PILE ?auto_436845 ?auto_436846 ?auto_436847 ?auto_436848 ?auto_436849 ?auto_436850 ?auto_436851 ?auto_436852 ?auto_436853 ?auto_436854 ?auto_436855 ?auto_436856 ?auto_436857 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436872 - BLOCK
      ?auto_436873 - BLOCK
      ?auto_436874 - BLOCK
      ?auto_436875 - BLOCK
      ?auto_436876 - BLOCK
      ?auto_436877 - BLOCK
      ?auto_436878 - BLOCK
      ?auto_436879 - BLOCK
      ?auto_436880 - BLOCK
      ?auto_436881 - BLOCK
      ?auto_436882 - BLOCK
      ?auto_436883 - BLOCK
      ?auto_436884 - BLOCK
    )
    :vars
    (
      ?auto_436885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436884 ?auto_436885 ) ( ON-TABLE ?auto_436872 ) ( ON ?auto_436873 ?auto_436872 ) ( ON ?auto_436874 ?auto_436873 ) ( ON ?auto_436875 ?auto_436874 ) ( not ( = ?auto_436872 ?auto_436873 ) ) ( not ( = ?auto_436872 ?auto_436874 ) ) ( not ( = ?auto_436872 ?auto_436875 ) ) ( not ( = ?auto_436872 ?auto_436876 ) ) ( not ( = ?auto_436872 ?auto_436877 ) ) ( not ( = ?auto_436872 ?auto_436878 ) ) ( not ( = ?auto_436872 ?auto_436879 ) ) ( not ( = ?auto_436872 ?auto_436880 ) ) ( not ( = ?auto_436872 ?auto_436881 ) ) ( not ( = ?auto_436872 ?auto_436882 ) ) ( not ( = ?auto_436872 ?auto_436883 ) ) ( not ( = ?auto_436872 ?auto_436884 ) ) ( not ( = ?auto_436872 ?auto_436885 ) ) ( not ( = ?auto_436873 ?auto_436874 ) ) ( not ( = ?auto_436873 ?auto_436875 ) ) ( not ( = ?auto_436873 ?auto_436876 ) ) ( not ( = ?auto_436873 ?auto_436877 ) ) ( not ( = ?auto_436873 ?auto_436878 ) ) ( not ( = ?auto_436873 ?auto_436879 ) ) ( not ( = ?auto_436873 ?auto_436880 ) ) ( not ( = ?auto_436873 ?auto_436881 ) ) ( not ( = ?auto_436873 ?auto_436882 ) ) ( not ( = ?auto_436873 ?auto_436883 ) ) ( not ( = ?auto_436873 ?auto_436884 ) ) ( not ( = ?auto_436873 ?auto_436885 ) ) ( not ( = ?auto_436874 ?auto_436875 ) ) ( not ( = ?auto_436874 ?auto_436876 ) ) ( not ( = ?auto_436874 ?auto_436877 ) ) ( not ( = ?auto_436874 ?auto_436878 ) ) ( not ( = ?auto_436874 ?auto_436879 ) ) ( not ( = ?auto_436874 ?auto_436880 ) ) ( not ( = ?auto_436874 ?auto_436881 ) ) ( not ( = ?auto_436874 ?auto_436882 ) ) ( not ( = ?auto_436874 ?auto_436883 ) ) ( not ( = ?auto_436874 ?auto_436884 ) ) ( not ( = ?auto_436874 ?auto_436885 ) ) ( not ( = ?auto_436875 ?auto_436876 ) ) ( not ( = ?auto_436875 ?auto_436877 ) ) ( not ( = ?auto_436875 ?auto_436878 ) ) ( not ( = ?auto_436875 ?auto_436879 ) ) ( not ( = ?auto_436875 ?auto_436880 ) ) ( not ( = ?auto_436875 ?auto_436881 ) ) ( not ( = ?auto_436875 ?auto_436882 ) ) ( not ( = ?auto_436875 ?auto_436883 ) ) ( not ( = ?auto_436875 ?auto_436884 ) ) ( not ( = ?auto_436875 ?auto_436885 ) ) ( not ( = ?auto_436876 ?auto_436877 ) ) ( not ( = ?auto_436876 ?auto_436878 ) ) ( not ( = ?auto_436876 ?auto_436879 ) ) ( not ( = ?auto_436876 ?auto_436880 ) ) ( not ( = ?auto_436876 ?auto_436881 ) ) ( not ( = ?auto_436876 ?auto_436882 ) ) ( not ( = ?auto_436876 ?auto_436883 ) ) ( not ( = ?auto_436876 ?auto_436884 ) ) ( not ( = ?auto_436876 ?auto_436885 ) ) ( not ( = ?auto_436877 ?auto_436878 ) ) ( not ( = ?auto_436877 ?auto_436879 ) ) ( not ( = ?auto_436877 ?auto_436880 ) ) ( not ( = ?auto_436877 ?auto_436881 ) ) ( not ( = ?auto_436877 ?auto_436882 ) ) ( not ( = ?auto_436877 ?auto_436883 ) ) ( not ( = ?auto_436877 ?auto_436884 ) ) ( not ( = ?auto_436877 ?auto_436885 ) ) ( not ( = ?auto_436878 ?auto_436879 ) ) ( not ( = ?auto_436878 ?auto_436880 ) ) ( not ( = ?auto_436878 ?auto_436881 ) ) ( not ( = ?auto_436878 ?auto_436882 ) ) ( not ( = ?auto_436878 ?auto_436883 ) ) ( not ( = ?auto_436878 ?auto_436884 ) ) ( not ( = ?auto_436878 ?auto_436885 ) ) ( not ( = ?auto_436879 ?auto_436880 ) ) ( not ( = ?auto_436879 ?auto_436881 ) ) ( not ( = ?auto_436879 ?auto_436882 ) ) ( not ( = ?auto_436879 ?auto_436883 ) ) ( not ( = ?auto_436879 ?auto_436884 ) ) ( not ( = ?auto_436879 ?auto_436885 ) ) ( not ( = ?auto_436880 ?auto_436881 ) ) ( not ( = ?auto_436880 ?auto_436882 ) ) ( not ( = ?auto_436880 ?auto_436883 ) ) ( not ( = ?auto_436880 ?auto_436884 ) ) ( not ( = ?auto_436880 ?auto_436885 ) ) ( not ( = ?auto_436881 ?auto_436882 ) ) ( not ( = ?auto_436881 ?auto_436883 ) ) ( not ( = ?auto_436881 ?auto_436884 ) ) ( not ( = ?auto_436881 ?auto_436885 ) ) ( not ( = ?auto_436882 ?auto_436883 ) ) ( not ( = ?auto_436882 ?auto_436884 ) ) ( not ( = ?auto_436882 ?auto_436885 ) ) ( not ( = ?auto_436883 ?auto_436884 ) ) ( not ( = ?auto_436883 ?auto_436885 ) ) ( not ( = ?auto_436884 ?auto_436885 ) ) ( ON ?auto_436883 ?auto_436884 ) ( ON ?auto_436882 ?auto_436883 ) ( ON ?auto_436881 ?auto_436882 ) ( ON ?auto_436880 ?auto_436881 ) ( ON ?auto_436879 ?auto_436880 ) ( ON ?auto_436878 ?auto_436879 ) ( ON ?auto_436877 ?auto_436878 ) ( CLEAR ?auto_436875 ) ( ON ?auto_436876 ?auto_436877 ) ( CLEAR ?auto_436876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_436872 ?auto_436873 ?auto_436874 ?auto_436875 ?auto_436876 )
      ( MAKE-13PILE ?auto_436872 ?auto_436873 ?auto_436874 ?auto_436875 ?auto_436876 ?auto_436877 ?auto_436878 ?auto_436879 ?auto_436880 ?auto_436881 ?auto_436882 ?auto_436883 ?auto_436884 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436899 - BLOCK
      ?auto_436900 - BLOCK
      ?auto_436901 - BLOCK
      ?auto_436902 - BLOCK
      ?auto_436903 - BLOCK
      ?auto_436904 - BLOCK
      ?auto_436905 - BLOCK
      ?auto_436906 - BLOCK
      ?auto_436907 - BLOCK
      ?auto_436908 - BLOCK
      ?auto_436909 - BLOCK
      ?auto_436910 - BLOCK
      ?auto_436911 - BLOCK
    )
    :vars
    (
      ?auto_436912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436911 ?auto_436912 ) ( ON-TABLE ?auto_436899 ) ( ON ?auto_436900 ?auto_436899 ) ( ON ?auto_436901 ?auto_436900 ) ( not ( = ?auto_436899 ?auto_436900 ) ) ( not ( = ?auto_436899 ?auto_436901 ) ) ( not ( = ?auto_436899 ?auto_436902 ) ) ( not ( = ?auto_436899 ?auto_436903 ) ) ( not ( = ?auto_436899 ?auto_436904 ) ) ( not ( = ?auto_436899 ?auto_436905 ) ) ( not ( = ?auto_436899 ?auto_436906 ) ) ( not ( = ?auto_436899 ?auto_436907 ) ) ( not ( = ?auto_436899 ?auto_436908 ) ) ( not ( = ?auto_436899 ?auto_436909 ) ) ( not ( = ?auto_436899 ?auto_436910 ) ) ( not ( = ?auto_436899 ?auto_436911 ) ) ( not ( = ?auto_436899 ?auto_436912 ) ) ( not ( = ?auto_436900 ?auto_436901 ) ) ( not ( = ?auto_436900 ?auto_436902 ) ) ( not ( = ?auto_436900 ?auto_436903 ) ) ( not ( = ?auto_436900 ?auto_436904 ) ) ( not ( = ?auto_436900 ?auto_436905 ) ) ( not ( = ?auto_436900 ?auto_436906 ) ) ( not ( = ?auto_436900 ?auto_436907 ) ) ( not ( = ?auto_436900 ?auto_436908 ) ) ( not ( = ?auto_436900 ?auto_436909 ) ) ( not ( = ?auto_436900 ?auto_436910 ) ) ( not ( = ?auto_436900 ?auto_436911 ) ) ( not ( = ?auto_436900 ?auto_436912 ) ) ( not ( = ?auto_436901 ?auto_436902 ) ) ( not ( = ?auto_436901 ?auto_436903 ) ) ( not ( = ?auto_436901 ?auto_436904 ) ) ( not ( = ?auto_436901 ?auto_436905 ) ) ( not ( = ?auto_436901 ?auto_436906 ) ) ( not ( = ?auto_436901 ?auto_436907 ) ) ( not ( = ?auto_436901 ?auto_436908 ) ) ( not ( = ?auto_436901 ?auto_436909 ) ) ( not ( = ?auto_436901 ?auto_436910 ) ) ( not ( = ?auto_436901 ?auto_436911 ) ) ( not ( = ?auto_436901 ?auto_436912 ) ) ( not ( = ?auto_436902 ?auto_436903 ) ) ( not ( = ?auto_436902 ?auto_436904 ) ) ( not ( = ?auto_436902 ?auto_436905 ) ) ( not ( = ?auto_436902 ?auto_436906 ) ) ( not ( = ?auto_436902 ?auto_436907 ) ) ( not ( = ?auto_436902 ?auto_436908 ) ) ( not ( = ?auto_436902 ?auto_436909 ) ) ( not ( = ?auto_436902 ?auto_436910 ) ) ( not ( = ?auto_436902 ?auto_436911 ) ) ( not ( = ?auto_436902 ?auto_436912 ) ) ( not ( = ?auto_436903 ?auto_436904 ) ) ( not ( = ?auto_436903 ?auto_436905 ) ) ( not ( = ?auto_436903 ?auto_436906 ) ) ( not ( = ?auto_436903 ?auto_436907 ) ) ( not ( = ?auto_436903 ?auto_436908 ) ) ( not ( = ?auto_436903 ?auto_436909 ) ) ( not ( = ?auto_436903 ?auto_436910 ) ) ( not ( = ?auto_436903 ?auto_436911 ) ) ( not ( = ?auto_436903 ?auto_436912 ) ) ( not ( = ?auto_436904 ?auto_436905 ) ) ( not ( = ?auto_436904 ?auto_436906 ) ) ( not ( = ?auto_436904 ?auto_436907 ) ) ( not ( = ?auto_436904 ?auto_436908 ) ) ( not ( = ?auto_436904 ?auto_436909 ) ) ( not ( = ?auto_436904 ?auto_436910 ) ) ( not ( = ?auto_436904 ?auto_436911 ) ) ( not ( = ?auto_436904 ?auto_436912 ) ) ( not ( = ?auto_436905 ?auto_436906 ) ) ( not ( = ?auto_436905 ?auto_436907 ) ) ( not ( = ?auto_436905 ?auto_436908 ) ) ( not ( = ?auto_436905 ?auto_436909 ) ) ( not ( = ?auto_436905 ?auto_436910 ) ) ( not ( = ?auto_436905 ?auto_436911 ) ) ( not ( = ?auto_436905 ?auto_436912 ) ) ( not ( = ?auto_436906 ?auto_436907 ) ) ( not ( = ?auto_436906 ?auto_436908 ) ) ( not ( = ?auto_436906 ?auto_436909 ) ) ( not ( = ?auto_436906 ?auto_436910 ) ) ( not ( = ?auto_436906 ?auto_436911 ) ) ( not ( = ?auto_436906 ?auto_436912 ) ) ( not ( = ?auto_436907 ?auto_436908 ) ) ( not ( = ?auto_436907 ?auto_436909 ) ) ( not ( = ?auto_436907 ?auto_436910 ) ) ( not ( = ?auto_436907 ?auto_436911 ) ) ( not ( = ?auto_436907 ?auto_436912 ) ) ( not ( = ?auto_436908 ?auto_436909 ) ) ( not ( = ?auto_436908 ?auto_436910 ) ) ( not ( = ?auto_436908 ?auto_436911 ) ) ( not ( = ?auto_436908 ?auto_436912 ) ) ( not ( = ?auto_436909 ?auto_436910 ) ) ( not ( = ?auto_436909 ?auto_436911 ) ) ( not ( = ?auto_436909 ?auto_436912 ) ) ( not ( = ?auto_436910 ?auto_436911 ) ) ( not ( = ?auto_436910 ?auto_436912 ) ) ( not ( = ?auto_436911 ?auto_436912 ) ) ( ON ?auto_436910 ?auto_436911 ) ( ON ?auto_436909 ?auto_436910 ) ( ON ?auto_436908 ?auto_436909 ) ( ON ?auto_436907 ?auto_436908 ) ( ON ?auto_436906 ?auto_436907 ) ( ON ?auto_436905 ?auto_436906 ) ( ON ?auto_436904 ?auto_436905 ) ( ON ?auto_436903 ?auto_436904 ) ( CLEAR ?auto_436901 ) ( ON ?auto_436902 ?auto_436903 ) ( CLEAR ?auto_436902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_436899 ?auto_436900 ?auto_436901 ?auto_436902 )
      ( MAKE-13PILE ?auto_436899 ?auto_436900 ?auto_436901 ?auto_436902 ?auto_436903 ?auto_436904 ?auto_436905 ?auto_436906 ?auto_436907 ?auto_436908 ?auto_436909 ?auto_436910 ?auto_436911 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436926 - BLOCK
      ?auto_436927 - BLOCK
      ?auto_436928 - BLOCK
      ?auto_436929 - BLOCK
      ?auto_436930 - BLOCK
      ?auto_436931 - BLOCK
      ?auto_436932 - BLOCK
      ?auto_436933 - BLOCK
      ?auto_436934 - BLOCK
      ?auto_436935 - BLOCK
      ?auto_436936 - BLOCK
      ?auto_436937 - BLOCK
      ?auto_436938 - BLOCK
    )
    :vars
    (
      ?auto_436939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436938 ?auto_436939 ) ( ON-TABLE ?auto_436926 ) ( ON ?auto_436927 ?auto_436926 ) ( ON ?auto_436928 ?auto_436927 ) ( not ( = ?auto_436926 ?auto_436927 ) ) ( not ( = ?auto_436926 ?auto_436928 ) ) ( not ( = ?auto_436926 ?auto_436929 ) ) ( not ( = ?auto_436926 ?auto_436930 ) ) ( not ( = ?auto_436926 ?auto_436931 ) ) ( not ( = ?auto_436926 ?auto_436932 ) ) ( not ( = ?auto_436926 ?auto_436933 ) ) ( not ( = ?auto_436926 ?auto_436934 ) ) ( not ( = ?auto_436926 ?auto_436935 ) ) ( not ( = ?auto_436926 ?auto_436936 ) ) ( not ( = ?auto_436926 ?auto_436937 ) ) ( not ( = ?auto_436926 ?auto_436938 ) ) ( not ( = ?auto_436926 ?auto_436939 ) ) ( not ( = ?auto_436927 ?auto_436928 ) ) ( not ( = ?auto_436927 ?auto_436929 ) ) ( not ( = ?auto_436927 ?auto_436930 ) ) ( not ( = ?auto_436927 ?auto_436931 ) ) ( not ( = ?auto_436927 ?auto_436932 ) ) ( not ( = ?auto_436927 ?auto_436933 ) ) ( not ( = ?auto_436927 ?auto_436934 ) ) ( not ( = ?auto_436927 ?auto_436935 ) ) ( not ( = ?auto_436927 ?auto_436936 ) ) ( not ( = ?auto_436927 ?auto_436937 ) ) ( not ( = ?auto_436927 ?auto_436938 ) ) ( not ( = ?auto_436927 ?auto_436939 ) ) ( not ( = ?auto_436928 ?auto_436929 ) ) ( not ( = ?auto_436928 ?auto_436930 ) ) ( not ( = ?auto_436928 ?auto_436931 ) ) ( not ( = ?auto_436928 ?auto_436932 ) ) ( not ( = ?auto_436928 ?auto_436933 ) ) ( not ( = ?auto_436928 ?auto_436934 ) ) ( not ( = ?auto_436928 ?auto_436935 ) ) ( not ( = ?auto_436928 ?auto_436936 ) ) ( not ( = ?auto_436928 ?auto_436937 ) ) ( not ( = ?auto_436928 ?auto_436938 ) ) ( not ( = ?auto_436928 ?auto_436939 ) ) ( not ( = ?auto_436929 ?auto_436930 ) ) ( not ( = ?auto_436929 ?auto_436931 ) ) ( not ( = ?auto_436929 ?auto_436932 ) ) ( not ( = ?auto_436929 ?auto_436933 ) ) ( not ( = ?auto_436929 ?auto_436934 ) ) ( not ( = ?auto_436929 ?auto_436935 ) ) ( not ( = ?auto_436929 ?auto_436936 ) ) ( not ( = ?auto_436929 ?auto_436937 ) ) ( not ( = ?auto_436929 ?auto_436938 ) ) ( not ( = ?auto_436929 ?auto_436939 ) ) ( not ( = ?auto_436930 ?auto_436931 ) ) ( not ( = ?auto_436930 ?auto_436932 ) ) ( not ( = ?auto_436930 ?auto_436933 ) ) ( not ( = ?auto_436930 ?auto_436934 ) ) ( not ( = ?auto_436930 ?auto_436935 ) ) ( not ( = ?auto_436930 ?auto_436936 ) ) ( not ( = ?auto_436930 ?auto_436937 ) ) ( not ( = ?auto_436930 ?auto_436938 ) ) ( not ( = ?auto_436930 ?auto_436939 ) ) ( not ( = ?auto_436931 ?auto_436932 ) ) ( not ( = ?auto_436931 ?auto_436933 ) ) ( not ( = ?auto_436931 ?auto_436934 ) ) ( not ( = ?auto_436931 ?auto_436935 ) ) ( not ( = ?auto_436931 ?auto_436936 ) ) ( not ( = ?auto_436931 ?auto_436937 ) ) ( not ( = ?auto_436931 ?auto_436938 ) ) ( not ( = ?auto_436931 ?auto_436939 ) ) ( not ( = ?auto_436932 ?auto_436933 ) ) ( not ( = ?auto_436932 ?auto_436934 ) ) ( not ( = ?auto_436932 ?auto_436935 ) ) ( not ( = ?auto_436932 ?auto_436936 ) ) ( not ( = ?auto_436932 ?auto_436937 ) ) ( not ( = ?auto_436932 ?auto_436938 ) ) ( not ( = ?auto_436932 ?auto_436939 ) ) ( not ( = ?auto_436933 ?auto_436934 ) ) ( not ( = ?auto_436933 ?auto_436935 ) ) ( not ( = ?auto_436933 ?auto_436936 ) ) ( not ( = ?auto_436933 ?auto_436937 ) ) ( not ( = ?auto_436933 ?auto_436938 ) ) ( not ( = ?auto_436933 ?auto_436939 ) ) ( not ( = ?auto_436934 ?auto_436935 ) ) ( not ( = ?auto_436934 ?auto_436936 ) ) ( not ( = ?auto_436934 ?auto_436937 ) ) ( not ( = ?auto_436934 ?auto_436938 ) ) ( not ( = ?auto_436934 ?auto_436939 ) ) ( not ( = ?auto_436935 ?auto_436936 ) ) ( not ( = ?auto_436935 ?auto_436937 ) ) ( not ( = ?auto_436935 ?auto_436938 ) ) ( not ( = ?auto_436935 ?auto_436939 ) ) ( not ( = ?auto_436936 ?auto_436937 ) ) ( not ( = ?auto_436936 ?auto_436938 ) ) ( not ( = ?auto_436936 ?auto_436939 ) ) ( not ( = ?auto_436937 ?auto_436938 ) ) ( not ( = ?auto_436937 ?auto_436939 ) ) ( not ( = ?auto_436938 ?auto_436939 ) ) ( ON ?auto_436937 ?auto_436938 ) ( ON ?auto_436936 ?auto_436937 ) ( ON ?auto_436935 ?auto_436936 ) ( ON ?auto_436934 ?auto_436935 ) ( ON ?auto_436933 ?auto_436934 ) ( ON ?auto_436932 ?auto_436933 ) ( ON ?auto_436931 ?auto_436932 ) ( ON ?auto_436930 ?auto_436931 ) ( CLEAR ?auto_436928 ) ( ON ?auto_436929 ?auto_436930 ) ( CLEAR ?auto_436929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_436926 ?auto_436927 ?auto_436928 ?auto_436929 )
      ( MAKE-13PILE ?auto_436926 ?auto_436927 ?auto_436928 ?auto_436929 ?auto_436930 ?auto_436931 ?auto_436932 ?auto_436933 ?auto_436934 ?auto_436935 ?auto_436936 ?auto_436937 ?auto_436938 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436953 - BLOCK
      ?auto_436954 - BLOCK
      ?auto_436955 - BLOCK
      ?auto_436956 - BLOCK
      ?auto_436957 - BLOCK
      ?auto_436958 - BLOCK
      ?auto_436959 - BLOCK
      ?auto_436960 - BLOCK
      ?auto_436961 - BLOCK
      ?auto_436962 - BLOCK
      ?auto_436963 - BLOCK
      ?auto_436964 - BLOCK
      ?auto_436965 - BLOCK
    )
    :vars
    (
      ?auto_436966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436965 ?auto_436966 ) ( ON-TABLE ?auto_436953 ) ( ON ?auto_436954 ?auto_436953 ) ( not ( = ?auto_436953 ?auto_436954 ) ) ( not ( = ?auto_436953 ?auto_436955 ) ) ( not ( = ?auto_436953 ?auto_436956 ) ) ( not ( = ?auto_436953 ?auto_436957 ) ) ( not ( = ?auto_436953 ?auto_436958 ) ) ( not ( = ?auto_436953 ?auto_436959 ) ) ( not ( = ?auto_436953 ?auto_436960 ) ) ( not ( = ?auto_436953 ?auto_436961 ) ) ( not ( = ?auto_436953 ?auto_436962 ) ) ( not ( = ?auto_436953 ?auto_436963 ) ) ( not ( = ?auto_436953 ?auto_436964 ) ) ( not ( = ?auto_436953 ?auto_436965 ) ) ( not ( = ?auto_436953 ?auto_436966 ) ) ( not ( = ?auto_436954 ?auto_436955 ) ) ( not ( = ?auto_436954 ?auto_436956 ) ) ( not ( = ?auto_436954 ?auto_436957 ) ) ( not ( = ?auto_436954 ?auto_436958 ) ) ( not ( = ?auto_436954 ?auto_436959 ) ) ( not ( = ?auto_436954 ?auto_436960 ) ) ( not ( = ?auto_436954 ?auto_436961 ) ) ( not ( = ?auto_436954 ?auto_436962 ) ) ( not ( = ?auto_436954 ?auto_436963 ) ) ( not ( = ?auto_436954 ?auto_436964 ) ) ( not ( = ?auto_436954 ?auto_436965 ) ) ( not ( = ?auto_436954 ?auto_436966 ) ) ( not ( = ?auto_436955 ?auto_436956 ) ) ( not ( = ?auto_436955 ?auto_436957 ) ) ( not ( = ?auto_436955 ?auto_436958 ) ) ( not ( = ?auto_436955 ?auto_436959 ) ) ( not ( = ?auto_436955 ?auto_436960 ) ) ( not ( = ?auto_436955 ?auto_436961 ) ) ( not ( = ?auto_436955 ?auto_436962 ) ) ( not ( = ?auto_436955 ?auto_436963 ) ) ( not ( = ?auto_436955 ?auto_436964 ) ) ( not ( = ?auto_436955 ?auto_436965 ) ) ( not ( = ?auto_436955 ?auto_436966 ) ) ( not ( = ?auto_436956 ?auto_436957 ) ) ( not ( = ?auto_436956 ?auto_436958 ) ) ( not ( = ?auto_436956 ?auto_436959 ) ) ( not ( = ?auto_436956 ?auto_436960 ) ) ( not ( = ?auto_436956 ?auto_436961 ) ) ( not ( = ?auto_436956 ?auto_436962 ) ) ( not ( = ?auto_436956 ?auto_436963 ) ) ( not ( = ?auto_436956 ?auto_436964 ) ) ( not ( = ?auto_436956 ?auto_436965 ) ) ( not ( = ?auto_436956 ?auto_436966 ) ) ( not ( = ?auto_436957 ?auto_436958 ) ) ( not ( = ?auto_436957 ?auto_436959 ) ) ( not ( = ?auto_436957 ?auto_436960 ) ) ( not ( = ?auto_436957 ?auto_436961 ) ) ( not ( = ?auto_436957 ?auto_436962 ) ) ( not ( = ?auto_436957 ?auto_436963 ) ) ( not ( = ?auto_436957 ?auto_436964 ) ) ( not ( = ?auto_436957 ?auto_436965 ) ) ( not ( = ?auto_436957 ?auto_436966 ) ) ( not ( = ?auto_436958 ?auto_436959 ) ) ( not ( = ?auto_436958 ?auto_436960 ) ) ( not ( = ?auto_436958 ?auto_436961 ) ) ( not ( = ?auto_436958 ?auto_436962 ) ) ( not ( = ?auto_436958 ?auto_436963 ) ) ( not ( = ?auto_436958 ?auto_436964 ) ) ( not ( = ?auto_436958 ?auto_436965 ) ) ( not ( = ?auto_436958 ?auto_436966 ) ) ( not ( = ?auto_436959 ?auto_436960 ) ) ( not ( = ?auto_436959 ?auto_436961 ) ) ( not ( = ?auto_436959 ?auto_436962 ) ) ( not ( = ?auto_436959 ?auto_436963 ) ) ( not ( = ?auto_436959 ?auto_436964 ) ) ( not ( = ?auto_436959 ?auto_436965 ) ) ( not ( = ?auto_436959 ?auto_436966 ) ) ( not ( = ?auto_436960 ?auto_436961 ) ) ( not ( = ?auto_436960 ?auto_436962 ) ) ( not ( = ?auto_436960 ?auto_436963 ) ) ( not ( = ?auto_436960 ?auto_436964 ) ) ( not ( = ?auto_436960 ?auto_436965 ) ) ( not ( = ?auto_436960 ?auto_436966 ) ) ( not ( = ?auto_436961 ?auto_436962 ) ) ( not ( = ?auto_436961 ?auto_436963 ) ) ( not ( = ?auto_436961 ?auto_436964 ) ) ( not ( = ?auto_436961 ?auto_436965 ) ) ( not ( = ?auto_436961 ?auto_436966 ) ) ( not ( = ?auto_436962 ?auto_436963 ) ) ( not ( = ?auto_436962 ?auto_436964 ) ) ( not ( = ?auto_436962 ?auto_436965 ) ) ( not ( = ?auto_436962 ?auto_436966 ) ) ( not ( = ?auto_436963 ?auto_436964 ) ) ( not ( = ?auto_436963 ?auto_436965 ) ) ( not ( = ?auto_436963 ?auto_436966 ) ) ( not ( = ?auto_436964 ?auto_436965 ) ) ( not ( = ?auto_436964 ?auto_436966 ) ) ( not ( = ?auto_436965 ?auto_436966 ) ) ( ON ?auto_436964 ?auto_436965 ) ( ON ?auto_436963 ?auto_436964 ) ( ON ?auto_436962 ?auto_436963 ) ( ON ?auto_436961 ?auto_436962 ) ( ON ?auto_436960 ?auto_436961 ) ( ON ?auto_436959 ?auto_436960 ) ( ON ?auto_436958 ?auto_436959 ) ( ON ?auto_436957 ?auto_436958 ) ( ON ?auto_436956 ?auto_436957 ) ( CLEAR ?auto_436954 ) ( ON ?auto_436955 ?auto_436956 ) ( CLEAR ?auto_436955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_436953 ?auto_436954 ?auto_436955 )
      ( MAKE-13PILE ?auto_436953 ?auto_436954 ?auto_436955 ?auto_436956 ?auto_436957 ?auto_436958 ?auto_436959 ?auto_436960 ?auto_436961 ?auto_436962 ?auto_436963 ?auto_436964 ?auto_436965 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_436980 - BLOCK
      ?auto_436981 - BLOCK
      ?auto_436982 - BLOCK
      ?auto_436983 - BLOCK
      ?auto_436984 - BLOCK
      ?auto_436985 - BLOCK
      ?auto_436986 - BLOCK
      ?auto_436987 - BLOCK
      ?auto_436988 - BLOCK
      ?auto_436989 - BLOCK
      ?auto_436990 - BLOCK
      ?auto_436991 - BLOCK
      ?auto_436992 - BLOCK
    )
    :vars
    (
      ?auto_436993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_436992 ?auto_436993 ) ( ON-TABLE ?auto_436980 ) ( ON ?auto_436981 ?auto_436980 ) ( not ( = ?auto_436980 ?auto_436981 ) ) ( not ( = ?auto_436980 ?auto_436982 ) ) ( not ( = ?auto_436980 ?auto_436983 ) ) ( not ( = ?auto_436980 ?auto_436984 ) ) ( not ( = ?auto_436980 ?auto_436985 ) ) ( not ( = ?auto_436980 ?auto_436986 ) ) ( not ( = ?auto_436980 ?auto_436987 ) ) ( not ( = ?auto_436980 ?auto_436988 ) ) ( not ( = ?auto_436980 ?auto_436989 ) ) ( not ( = ?auto_436980 ?auto_436990 ) ) ( not ( = ?auto_436980 ?auto_436991 ) ) ( not ( = ?auto_436980 ?auto_436992 ) ) ( not ( = ?auto_436980 ?auto_436993 ) ) ( not ( = ?auto_436981 ?auto_436982 ) ) ( not ( = ?auto_436981 ?auto_436983 ) ) ( not ( = ?auto_436981 ?auto_436984 ) ) ( not ( = ?auto_436981 ?auto_436985 ) ) ( not ( = ?auto_436981 ?auto_436986 ) ) ( not ( = ?auto_436981 ?auto_436987 ) ) ( not ( = ?auto_436981 ?auto_436988 ) ) ( not ( = ?auto_436981 ?auto_436989 ) ) ( not ( = ?auto_436981 ?auto_436990 ) ) ( not ( = ?auto_436981 ?auto_436991 ) ) ( not ( = ?auto_436981 ?auto_436992 ) ) ( not ( = ?auto_436981 ?auto_436993 ) ) ( not ( = ?auto_436982 ?auto_436983 ) ) ( not ( = ?auto_436982 ?auto_436984 ) ) ( not ( = ?auto_436982 ?auto_436985 ) ) ( not ( = ?auto_436982 ?auto_436986 ) ) ( not ( = ?auto_436982 ?auto_436987 ) ) ( not ( = ?auto_436982 ?auto_436988 ) ) ( not ( = ?auto_436982 ?auto_436989 ) ) ( not ( = ?auto_436982 ?auto_436990 ) ) ( not ( = ?auto_436982 ?auto_436991 ) ) ( not ( = ?auto_436982 ?auto_436992 ) ) ( not ( = ?auto_436982 ?auto_436993 ) ) ( not ( = ?auto_436983 ?auto_436984 ) ) ( not ( = ?auto_436983 ?auto_436985 ) ) ( not ( = ?auto_436983 ?auto_436986 ) ) ( not ( = ?auto_436983 ?auto_436987 ) ) ( not ( = ?auto_436983 ?auto_436988 ) ) ( not ( = ?auto_436983 ?auto_436989 ) ) ( not ( = ?auto_436983 ?auto_436990 ) ) ( not ( = ?auto_436983 ?auto_436991 ) ) ( not ( = ?auto_436983 ?auto_436992 ) ) ( not ( = ?auto_436983 ?auto_436993 ) ) ( not ( = ?auto_436984 ?auto_436985 ) ) ( not ( = ?auto_436984 ?auto_436986 ) ) ( not ( = ?auto_436984 ?auto_436987 ) ) ( not ( = ?auto_436984 ?auto_436988 ) ) ( not ( = ?auto_436984 ?auto_436989 ) ) ( not ( = ?auto_436984 ?auto_436990 ) ) ( not ( = ?auto_436984 ?auto_436991 ) ) ( not ( = ?auto_436984 ?auto_436992 ) ) ( not ( = ?auto_436984 ?auto_436993 ) ) ( not ( = ?auto_436985 ?auto_436986 ) ) ( not ( = ?auto_436985 ?auto_436987 ) ) ( not ( = ?auto_436985 ?auto_436988 ) ) ( not ( = ?auto_436985 ?auto_436989 ) ) ( not ( = ?auto_436985 ?auto_436990 ) ) ( not ( = ?auto_436985 ?auto_436991 ) ) ( not ( = ?auto_436985 ?auto_436992 ) ) ( not ( = ?auto_436985 ?auto_436993 ) ) ( not ( = ?auto_436986 ?auto_436987 ) ) ( not ( = ?auto_436986 ?auto_436988 ) ) ( not ( = ?auto_436986 ?auto_436989 ) ) ( not ( = ?auto_436986 ?auto_436990 ) ) ( not ( = ?auto_436986 ?auto_436991 ) ) ( not ( = ?auto_436986 ?auto_436992 ) ) ( not ( = ?auto_436986 ?auto_436993 ) ) ( not ( = ?auto_436987 ?auto_436988 ) ) ( not ( = ?auto_436987 ?auto_436989 ) ) ( not ( = ?auto_436987 ?auto_436990 ) ) ( not ( = ?auto_436987 ?auto_436991 ) ) ( not ( = ?auto_436987 ?auto_436992 ) ) ( not ( = ?auto_436987 ?auto_436993 ) ) ( not ( = ?auto_436988 ?auto_436989 ) ) ( not ( = ?auto_436988 ?auto_436990 ) ) ( not ( = ?auto_436988 ?auto_436991 ) ) ( not ( = ?auto_436988 ?auto_436992 ) ) ( not ( = ?auto_436988 ?auto_436993 ) ) ( not ( = ?auto_436989 ?auto_436990 ) ) ( not ( = ?auto_436989 ?auto_436991 ) ) ( not ( = ?auto_436989 ?auto_436992 ) ) ( not ( = ?auto_436989 ?auto_436993 ) ) ( not ( = ?auto_436990 ?auto_436991 ) ) ( not ( = ?auto_436990 ?auto_436992 ) ) ( not ( = ?auto_436990 ?auto_436993 ) ) ( not ( = ?auto_436991 ?auto_436992 ) ) ( not ( = ?auto_436991 ?auto_436993 ) ) ( not ( = ?auto_436992 ?auto_436993 ) ) ( ON ?auto_436991 ?auto_436992 ) ( ON ?auto_436990 ?auto_436991 ) ( ON ?auto_436989 ?auto_436990 ) ( ON ?auto_436988 ?auto_436989 ) ( ON ?auto_436987 ?auto_436988 ) ( ON ?auto_436986 ?auto_436987 ) ( ON ?auto_436985 ?auto_436986 ) ( ON ?auto_436984 ?auto_436985 ) ( ON ?auto_436983 ?auto_436984 ) ( CLEAR ?auto_436981 ) ( ON ?auto_436982 ?auto_436983 ) ( CLEAR ?auto_436982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_436980 ?auto_436981 ?auto_436982 )
      ( MAKE-13PILE ?auto_436980 ?auto_436981 ?auto_436982 ?auto_436983 ?auto_436984 ?auto_436985 ?auto_436986 ?auto_436987 ?auto_436988 ?auto_436989 ?auto_436990 ?auto_436991 ?auto_436992 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_437007 - BLOCK
      ?auto_437008 - BLOCK
      ?auto_437009 - BLOCK
      ?auto_437010 - BLOCK
      ?auto_437011 - BLOCK
      ?auto_437012 - BLOCK
      ?auto_437013 - BLOCK
      ?auto_437014 - BLOCK
      ?auto_437015 - BLOCK
      ?auto_437016 - BLOCK
      ?auto_437017 - BLOCK
      ?auto_437018 - BLOCK
      ?auto_437019 - BLOCK
    )
    :vars
    (
      ?auto_437020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437019 ?auto_437020 ) ( ON-TABLE ?auto_437007 ) ( not ( = ?auto_437007 ?auto_437008 ) ) ( not ( = ?auto_437007 ?auto_437009 ) ) ( not ( = ?auto_437007 ?auto_437010 ) ) ( not ( = ?auto_437007 ?auto_437011 ) ) ( not ( = ?auto_437007 ?auto_437012 ) ) ( not ( = ?auto_437007 ?auto_437013 ) ) ( not ( = ?auto_437007 ?auto_437014 ) ) ( not ( = ?auto_437007 ?auto_437015 ) ) ( not ( = ?auto_437007 ?auto_437016 ) ) ( not ( = ?auto_437007 ?auto_437017 ) ) ( not ( = ?auto_437007 ?auto_437018 ) ) ( not ( = ?auto_437007 ?auto_437019 ) ) ( not ( = ?auto_437007 ?auto_437020 ) ) ( not ( = ?auto_437008 ?auto_437009 ) ) ( not ( = ?auto_437008 ?auto_437010 ) ) ( not ( = ?auto_437008 ?auto_437011 ) ) ( not ( = ?auto_437008 ?auto_437012 ) ) ( not ( = ?auto_437008 ?auto_437013 ) ) ( not ( = ?auto_437008 ?auto_437014 ) ) ( not ( = ?auto_437008 ?auto_437015 ) ) ( not ( = ?auto_437008 ?auto_437016 ) ) ( not ( = ?auto_437008 ?auto_437017 ) ) ( not ( = ?auto_437008 ?auto_437018 ) ) ( not ( = ?auto_437008 ?auto_437019 ) ) ( not ( = ?auto_437008 ?auto_437020 ) ) ( not ( = ?auto_437009 ?auto_437010 ) ) ( not ( = ?auto_437009 ?auto_437011 ) ) ( not ( = ?auto_437009 ?auto_437012 ) ) ( not ( = ?auto_437009 ?auto_437013 ) ) ( not ( = ?auto_437009 ?auto_437014 ) ) ( not ( = ?auto_437009 ?auto_437015 ) ) ( not ( = ?auto_437009 ?auto_437016 ) ) ( not ( = ?auto_437009 ?auto_437017 ) ) ( not ( = ?auto_437009 ?auto_437018 ) ) ( not ( = ?auto_437009 ?auto_437019 ) ) ( not ( = ?auto_437009 ?auto_437020 ) ) ( not ( = ?auto_437010 ?auto_437011 ) ) ( not ( = ?auto_437010 ?auto_437012 ) ) ( not ( = ?auto_437010 ?auto_437013 ) ) ( not ( = ?auto_437010 ?auto_437014 ) ) ( not ( = ?auto_437010 ?auto_437015 ) ) ( not ( = ?auto_437010 ?auto_437016 ) ) ( not ( = ?auto_437010 ?auto_437017 ) ) ( not ( = ?auto_437010 ?auto_437018 ) ) ( not ( = ?auto_437010 ?auto_437019 ) ) ( not ( = ?auto_437010 ?auto_437020 ) ) ( not ( = ?auto_437011 ?auto_437012 ) ) ( not ( = ?auto_437011 ?auto_437013 ) ) ( not ( = ?auto_437011 ?auto_437014 ) ) ( not ( = ?auto_437011 ?auto_437015 ) ) ( not ( = ?auto_437011 ?auto_437016 ) ) ( not ( = ?auto_437011 ?auto_437017 ) ) ( not ( = ?auto_437011 ?auto_437018 ) ) ( not ( = ?auto_437011 ?auto_437019 ) ) ( not ( = ?auto_437011 ?auto_437020 ) ) ( not ( = ?auto_437012 ?auto_437013 ) ) ( not ( = ?auto_437012 ?auto_437014 ) ) ( not ( = ?auto_437012 ?auto_437015 ) ) ( not ( = ?auto_437012 ?auto_437016 ) ) ( not ( = ?auto_437012 ?auto_437017 ) ) ( not ( = ?auto_437012 ?auto_437018 ) ) ( not ( = ?auto_437012 ?auto_437019 ) ) ( not ( = ?auto_437012 ?auto_437020 ) ) ( not ( = ?auto_437013 ?auto_437014 ) ) ( not ( = ?auto_437013 ?auto_437015 ) ) ( not ( = ?auto_437013 ?auto_437016 ) ) ( not ( = ?auto_437013 ?auto_437017 ) ) ( not ( = ?auto_437013 ?auto_437018 ) ) ( not ( = ?auto_437013 ?auto_437019 ) ) ( not ( = ?auto_437013 ?auto_437020 ) ) ( not ( = ?auto_437014 ?auto_437015 ) ) ( not ( = ?auto_437014 ?auto_437016 ) ) ( not ( = ?auto_437014 ?auto_437017 ) ) ( not ( = ?auto_437014 ?auto_437018 ) ) ( not ( = ?auto_437014 ?auto_437019 ) ) ( not ( = ?auto_437014 ?auto_437020 ) ) ( not ( = ?auto_437015 ?auto_437016 ) ) ( not ( = ?auto_437015 ?auto_437017 ) ) ( not ( = ?auto_437015 ?auto_437018 ) ) ( not ( = ?auto_437015 ?auto_437019 ) ) ( not ( = ?auto_437015 ?auto_437020 ) ) ( not ( = ?auto_437016 ?auto_437017 ) ) ( not ( = ?auto_437016 ?auto_437018 ) ) ( not ( = ?auto_437016 ?auto_437019 ) ) ( not ( = ?auto_437016 ?auto_437020 ) ) ( not ( = ?auto_437017 ?auto_437018 ) ) ( not ( = ?auto_437017 ?auto_437019 ) ) ( not ( = ?auto_437017 ?auto_437020 ) ) ( not ( = ?auto_437018 ?auto_437019 ) ) ( not ( = ?auto_437018 ?auto_437020 ) ) ( not ( = ?auto_437019 ?auto_437020 ) ) ( ON ?auto_437018 ?auto_437019 ) ( ON ?auto_437017 ?auto_437018 ) ( ON ?auto_437016 ?auto_437017 ) ( ON ?auto_437015 ?auto_437016 ) ( ON ?auto_437014 ?auto_437015 ) ( ON ?auto_437013 ?auto_437014 ) ( ON ?auto_437012 ?auto_437013 ) ( ON ?auto_437011 ?auto_437012 ) ( ON ?auto_437010 ?auto_437011 ) ( ON ?auto_437009 ?auto_437010 ) ( CLEAR ?auto_437007 ) ( ON ?auto_437008 ?auto_437009 ) ( CLEAR ?auto_437008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_437007 ?auto_437008 )
      ( MAKE-13PILE ?auto_437007 ?auto_437008 ?auto_437009 ?auto_437010 ?auto_437011 ?auto_437012 ?auto_437013 ?auto_437014 ?auto_437015 ?auto_437016 ?auto_437017 ?auto_437018 ?auto_437019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_437034 - BLOCK
      ?auto_437035 - BLOCK
      ?auto_437036 - BLOCK
      ?auto_437037 - BLOCK
      ?auto_437038 - BLOCK
      ?auto_437039 - BLOCK
      ?auto_437040 - BLOCK
      ?auto_437041 - BLOCK
      ?auto_437042 - BLOCK
      ?auto_437043 - BLOCK
      ?auto_437044 - BLOCK
      ?auto_437045 - BLOCK
      ?auto_437046 - BLOCK
    )
    :vars
    (
      ?auto_437047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437046 ?auto_437047 ) ( ON-TABLE ?auto_437034 ) ( not ( = ?auto_437034 ?auto_437035 ) ) ( not ( = ?auto_437034 ?auto_437036 ) ) ( not ( = ?auto_437034 ?auto_437037 ) ) ( not ( = ?auto_437034 ?auto_437038 ) ) ( not ( = ?auto_437034 ?auto_437039 ) ) ( not ( = ?auto_437034 ?auto_437040 ) ) ( not ( = ?auto_437034 ?auto_437041 ) ) ( not ( = ?auto_437034 ?auto_437042 ) ) ( not ( = ?auto_437034 ?auto_437043 ) ) ( not ( = ?auto_437034 ?auto_437044 ) ) ( not ( = ?auto_437034 ?auto_437045 ) ) ( not ( = ?auto_437034 ?auto_437046 ) ) ( not ( = ?auto_437034 ?auto_437047 ) ) ( not ( = ?auto_437035 ?auto_437036 ) ) ( not ( = ?auto_437035 ?auto_437037 ) ) ( not ( = ?auto_437035 ?auto_437038 ) ) ( not ( = ?auto_437035 ?auto_437039 ) ) ( not ( = ?auto_437035 ?auto_437040 ) ) ( not ( = ?auto_437035 ?auto_437041 ) ) ( not ( = ?auto_437035 ?auto_437042 ) ) ( not ( = ?auto_437035 ?auto_437043 ) ) ( not ( = ?auto_437035 ?auto_437044 ) ) ( not ( = ?auto_437035 ?auto_437045 ) ) ( not ( = ?auto_437035 ?auto_437046 ) ) ( not ( = ?auto_437035 ?auto_437047 ) ) ( not ( = ?auto_437036 ?auto_437037 ) ) ( not ( = ?auto_437036 ?auto_437038 ) ) ( not ( = ?auto_437036 ?auto_437039 ) ) ( not ( = ?auto_437036 ?auto_437040 ) ) ( not ( = ?auto_437036 ?auto_437041 ) ) ( not ( = ?auto_437036 ?auto_437042 ) ) ( not ( = ?auto_437036 ?auto_437043 ) ) ( not ( = ?auto_437036 ?auto_437044 ) ) ( not ( = ?auto_437036 ?auto_437045 ) ) ( not ( = ?auto_437036 ?auto_437046 ) ) ( not ( = ?auto_437036 ?auto_437047 ) ) ( not ( = ?auto_437037 ?auto_437038 ) ) ( not ( = ?auto_437037 ?auto_437039 ) ) ( not ( = ?auto_437037 ?auto_437040 ) ) ( not ( = ?auto_437037 ?auto_437041 ) ) ( not ( = ?auto_437037 ?auto_437042 ) ) ( not ( = ?auto_437037 ?auto_437043 ) ) ( not ( = ?auto_437037 ?auto_437044 ) ) ( not ( = ?auto_437037 ?auto_437045 ) ) ( not ( = ?auto_437037 ?auto_437046 ) ) ( not ( = ?auto_437037 ?auto_437047 ) ) ( not ( = ?auto_437038 ?auto_437039 ) ) ( not ( = ?auto_437038 ?auto_437040 ) ) ( not ( = ?auto_437038 ?auto_437041 ) ) ( not ( = ?auto_437038 ?auto_437042 ) ) ( not ( = ?auto_437038 ?auto_437043 ) ) ( not ( = ?auto_437038 ?auto_437044 ) ) ( not ( = ?auto_437038 ?auto_437045 ) ) ( not ( = ?auto_437038 ?auto_437046 ) ) ( not ( = ?auto_437038 ?auto_437047 ) ) ( not ( = ?auto_437039 ?auto_437040 ) ) ( not ( = ?auto_437039 ?auto_437041 ) ) ( not ( = ?auto_437039 ?auto_437042 ) ) ( not ( = ?auto_437039 ?auto_437043 ) ) ( not ( = ?auto_437039 ?auto_437044 ) ) ( not ( = ?auto_437039 ?auto_437045 ) ) ( not ( = ?auto_437039 ?auto_437046 ) ) ( not ( = ?auto_437039 ?auto_437047 ) ) ( not ( = ?auto_437040 ?auto_437041 ) ) ( not ( = ?auto_437040 ?auto_437042 ) ) ( not ( = ?auto_437040 ?auto_437043 ) ) ( not ( = ?auto_437040 ?auto_437044 ) ) ( not ( = ?auto_437040 ?auto_437045 ) ) ( not ( = ?auto_437040 ?auto_437046 ) ) ( not ( = ?auto_437040 ?auto_437047 ) ) ( not ( = ?auto_437041 ?auto_437042 ) ) ( not ( = ?auto_437041 ?auto_437043 ) ) ( not ( = ?auto_437041 ?auto_437044 ) ) ( not ( = ?auto_437041 ?auto_437045 ) ) ( not ( = ?auto_437041 ?auto_437046 ) ) ( not ( = ?auto_437041 ?auto_437047 ) ) ( not ( = ?auto_437042 ?auto_437043 ) ) ( not ( = ?auto_437042 ?auto_437044 ) ) ( not ( = ?auto_437042 ?auto_437045 ) ) ( not ( = ?auto_437042 ?auto_437046 ) ) ( not ( = ?auto_437042 ?auto_437047 ) ) ( not ( = ?auto_437043 ?auto_437044 ) ) ( not ( = ?auto_437043 ?auto_437045 ) ) ( not ( = ?auto_437043 ?auto_437046 ) ) ( not ( = ?auto_437043 ?auto_437047 ) ) ( not ( = ?auto_437044 ?auto_437045 ) ) ( not ( = ?auto_437044 ?auto_437046 ) ) ( not ( = ?auto_437044 ?auto_437047 ) ) ( not ( = ?auto_437045 ?auto_437046 ) ) ( not ( = ?auto_437045 ?auto_437047 ) ) ( not ( = ?auto_437046 ?auto_437047 ) ) ( ON ?auto_437045 ?auto_437046 ) ( ON ?auto_437044 ?auto_437045 ) ( ON ?auto_437043 ?auto_437044 ) ( ON ?auto_437042 ?auto_437043 ) ( ON ?auto_437041 ?auto_437042 ) ( ON ?auto_437040 ?auto_437041 ) ( ON ?auto_437039 ?auto_437040 ) ( ON ?auto_437038 ?auto_437039 ) ( ON ?auto_437037 ?auto_437038 ) ( ON ?auto_437036 ?auto_437037 ) ( CLEAR ?auto_437034 ) ( ON ?auto_437035 ?auto_437036 ) ( CLEAR ?auto_437035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_437034 ?auto_437035 )
      ( MAKE-13PILE ?auto_437034 ?auto_437035 ?auto_437036 ?auto_437037 ?auto_437038 ?auto_437039 ?auto_437040 ?auto_437041 ?auto_437042 ?auto_437043 ?auto_437044 ?auto_437045 ?auto_437046 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_437061 - BLOCK
      ?auto_437062 - BLOCK
      ?auto_437063 - BLOCK
      ?auto_437064 - BLOCK
      ?auto_437065 - BLOCK
      ?auto_437066 - BLOCK
      ?auto_437067 - BLOCK
      ?auto_437068 - BLOCK
      ?auto_437069 - BLOCK
      ?auto_437070 - BLOCK
      ?auto_437071 - BLOCK
      ?auto_437072 - BLOCK
      ?auto_437073 - BLOCK
    )
    :vars
    (
      ?auto_437074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437073 ?auto_437074 ) ( not ( = ?auto_437061 ?auto_437062 ) ) ( not ( = ?auto_437061 ?auto_437063 ) ) ( not ( = ?auto_437061 ?auto_437064 ) ) ( not ( = ?auto_437061 ?auto_437065 ) ) ( not ( = ?auto_437061 ?auto_437066 ) ) ( not ( = ?auto_437061 ?auto_437067 ) ) ( not ( = ?auto_437061 ?auto_437068 ) ) ( not ( = ?auto_437061 ?auto_437069 ) ) ( not ( = ?auto_437061 ?auto_437070 ) ) ( not ( = ?auto_437061 ?auto_437071 ) ) ( not ( = ?auto_437061 ?auto_437072 ) ) ( not ( = ?auto_437061 ?auto_437073 ) ) ( not ( = ?auto_437061 ?auto_437074 ) ) ( not ( = ?auto_437062 ?auto_437063 ) ) ( not ( = ?auto_437062 ?auto_437064 ) ) ( not ( = ?auto_437062 ?auto_437065 ) ) ( not ( = ?auto_437062 ?auto_437066 ) ) ( not ( = ?auto_437062 ?auto_437067 ) ) ( not ( = ?auto_437062 ?auto_437068 ) ) ( not ( = ?auto_437062 ?auto_437069 ) ) ( not ( = ?auto_437062 ?auto_437070 ) ) ( not ( = ?auto_437062 ?auto_437071 ) ) ( not ( = ?auto_437062 ?auto_437072 ) ) ( not ( = ?auto_437062 ?auto_437073 ) ) ( not ( = ?auto_437062 ?auto_437074 ) ) ( not ( = ?auto_437063 ?auto_437064 ) ) ( not ( = ?auto_437063 ?auto_437065 ) ) ( not ( = ?auto_437063 ?auto_437066 ) ) ( not ( = ?auto_437063 ?auto_437067 ) ) ( not ( = ?auto_437063 ?auto_437068 ) ) ( not ( = ?auto_437063 ?auto_437069 ) ) ( not ( = ?auto_437063 ?auto_437070 ) ) ( not ( = ?auto_437063 ?auto_437071 ) ) ( not ( = ?auto_437063 ?auto_437072 ) ) ( not ( = ?auto_437063 ?auto_437073 ) ) ( not ( = ?auto_437063 ?auto_437074 ) ) ( not ( = ?auto_437064 ?auto_437065 ) ) ( not ( = ?auto_437064 ?auto_437066 ) ) ( not ( = ?auto_437064 ?auto_437067 ) ) ( not ( = ?auto_437064 ?auto_437068 ) ) ( not ( = ?auto_437064 ?auto_437069 ) ) ( not ( = ?auto_437064 ?auto_437070 ) ) ( not ( = ?auto_437064 ?auto_437071 ) ) ( not ( = ?auto_437064 ?auto_437072 ) ) ( not ( = ?auto_437064 ?auto_437073 ) ) ( not ( = ?auto_437064 ?auto_437074 ) ) ( not ( = ?auto_437065 ?auto_437066 ) ) ( not ( = ?auto_437065 ?auto_437067 ) ) ( not ( = ?auto_437065 ?auto_437068 ) ) ( not ( = ?auto_437065 ?auto_437069 ) ) ( not ( = ?auto_437065 ?auto_437070 ) ) ( not ( = ?auto_437065 ?auto_437071 ) ) ( not ( = ?auto_437065 ?auto_437072 ) ) ( not ( = ?auto_437065 ?auto_437073 ) ) ( not ( = ?auto_437065 ?auto_437074 ) ) ( not ( = ?auto_437066 ?auto_437067 ) ) ( not ( = ?auto_437066 ?auto_437068 ) ) ( not ( = ?auto_437066 ?auto_437069 ) ) ( not ( = ?auto_437066 ?auto_437070 ) ) ( not ( = ?auto_437066 ?auto_437071 ) ) ( not ( = ?auto_437066 ?auto_437072 ) ) ( not ( = ?auto_437066 ?auto_437073 ) ) ( not ( = ?auto_437066 ?auto_437074 ) ) ( not ( = ?auto_437067 ?auto_437068 ) ) ( not ( = ?auto_437067 ?auto_437069 ) ) ( not ( = ?auto_437067 ?auto_437070 ) ) ( not ( = ?auto_437067 ?auto_437071 ) ) ( not ( = ?auto_437067 ?auto_437072 ) ) ( not ( = ?auto_437067 ?auto_437073 ) ) ( not ( = ?auto_437067 ?auto_437074 ) ) ( not ( = ?auto_437068 ?auto_437069 ) ) ( not ( = ?auto_437068 ?auto_437070 ) ) ( not ( = ?auto_437068 ?auto_437071 ) ) ( not ( = ?auto_437068 ?auto_437072 ) ) ( not ( = ?auto_437068 ?auto_437073 ) ) ( not ( = ?auto_437068 ?auto_437074 ) ) ( not ( = ?auto_437069 ?auto_437070 ) ) ( not ( = ?auto_437069 ?auto_437071 ) ) ( not ( = ?auto_437069 ?auto_437072 ) ) ( not ( = ?auto_437069 ?auto_437073 ) ) ( not ( = ?auto_437069 ?auto_437074 ) ) ( not ( = ?auto_437070 ?auto_437071 ) ) ( not ( = ?auto_437070 ?auto_437072 ) ) ( not ( = ?auto_437070 ?auto_437073 ) ) ( not ( = ?auto_437070 ?auto_437074 ) ) ( not ( = ?auto_437071 ?auto_437072 ) ) ( not ( = ?auto_437071 ?auto_437073 ) ) ( not ( = ?auto_437071 ?auto_437074 ) ) ( not ( = ?auto_437072 ?auto_437073 ) ) ( not ( = ?auto_437072 ?auto_437074 ) ) ( not ( = ?auto_437073 ?auto_437074 ) ) ( ON ?auto_437072 ?auto_437073 ) ( ON ?auto_437071 ?auto_437072 ) ( ON ?auto_437070 ?auto_437071 ) ( ON ?auto_437069 ?auto_437070 ) ( ON ?auto_437068 ?auto_437069 ) ( ON ?auto_437067 ?auto_437068 ) ( ON ?auto_437066 ?auto_437067 ) ( ON ?auto_437065 ?auto_437066 ) ( ON ?auto_437064 ?auto_437065 ) ( ON ?auto_437063 ?auto_437064 ) ( ON ?auto_437062 ?auto_437063 ) ( ON ?auto_437061 ?auto_437062 ) ( CLEAR ?auto_437061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_437061 )
      ( MAKE-13PILE ?auto_437061 ?auto_437062 ?auto_437063 ?auto_437064 ?auto_437065 ?auto_437066 ?auto_437067 ?auto_437068 ?auto_437069 ?auto_437070 ?auto_437071 ?auto_437072 ?auto_437073 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_437088 - BLOCK
      ?auto_437089 - BLOCK
      ?auto_437090 - BLOCK
      ?auto_437091 - BLOCK
      ?auto_437092 - BLOCK
      ?auto_437093 - BLOCK
      ?auto_437094 - BLOCK
      ?auto_437095 - BLOCK
      ?auto_437096 - BLOCK
      ?auto_437097 - BLOCK
      ?auto_437098 - BLOCK
      ?auto_437099 - BLOCK
      ?auto_437100 - BLOCK
    )
    :vars
    (
      ?auto_437101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437100 ?auto_437101 ) ( not ( = ?auto_437088 ?auto_437089 ) ) ( not ( = ?auto_437088 ?auto_437090 ) ) ( not ( = ?auto_437088 ?auto_437091 ) ) ( not ( = ?auto_437088 ?auto_437092 ) ) ( not ( = ?auto_437088 ?auto_437093 ) ) ( not ( = ?auto_437088 ?auto_437094 ) ) ( not ( = ?auto_437088 ?auto_437095 ) ) ( not ( = ?auto_437088 ?auto_437096 ) ) ( not ( = ?auto_437088 ?auto_437097 ) ) ( not ( = ?auto_437088 ?auto_437098 ) ) ( not ( = ?auto_437088 ?auto_437099 ) ) ( not ( = ?auto_437088 ?auto_437100 ) ) ( not ( = ?auto_437088 ?auto_437101 ) ) ( not ( = ?auto_437089 ?auto_437090 ) ) ( not ( = ?auto_437089 ?auto_437091 ) ) ( not ( = ?auto_437089 ?auto_437092 ) ) ( not ( = ?auto_437089 ?auto_437093 ) ) ( not ( = ?auto_437089 ?auto_437094 ) ) ( not ( = ?auto_437089 ?auto_437095 ) ) ( not ( = ?auto_437089 ?auto_437096 ) ) ( not ( = ?auto_437089 ?auto_437097 ) ) ( not ( = ?auto_437089 ?auto_437098 ) ) ( not ( = ?auto_437089 ?auto_437099 ) ) ( not ( = ?auto_437089 ?auto_437100 ) ) ( not ( = ?auto_437089 ?auto_437101 ) ) ( not ( = ?auto_437090 ?auto_437091 ) ) ( not ( = ?auto_437090 ?auto_437092 ) ) ( not ( = ?auto_437090 ?auto_437093 ) ) ( not ( = ?auto_437090 ?auto_437094 ) ) ( not ( = ?auto_437090 ?auto_437095 ) ) ( not ( = ?auto_437090 ?auto_437096 ) ) ( not ( = ?auto_437090 ?auto_437097 ) ) ( not ( = ?auto_437090 ?auto_437098 ) ) ( not ( = ?auto_437090 ?auto_437099 ) ) ( not ( = ?auto_437090 ?auto_437100 ) ) ( not ( = ?auto_437090 ?auto_437101 ) ) ( not ( = ?auto_437091 ?auto_437092 ) ) ( not ( = ?auto_437091 ?auto_437093 ) ) ( not ( = ?auto_437091 ?auto_437094 ) ) ( not ( = ?auto_437091 ?auto_437095 ) ) ( not ( = ?auto_437091 ?auto_437096 ) ) ( not ( = ?auto_437091 ?auto_437097 ) ) ( not ( = ?auto_437091 ?auto_437098 ) ) ( not ( = ?auto_437091 ?auto_437099 ) ) ( not ( = ?auto_437091 ?auto_437100 ) ) ( not ( = ?auto_437091 ?auto_437101 ) ) ( not ( = ?auto_437092 ?auto_437093 ) ) ( not ( = ?auto_437092 ?auto_437094 ) ) ( not ( = ?auto_437092 ?auto_437095 ) ) ( not ( = ?auto_437092 ?auto_437096 ) ) ( not ( = ?auto_437092 ?auto_437097 ) ) ( not ( = ?auto_437092 ?auto_437098 ) ) ( not ( = ?auto_437092 ?auto_437099 ) ) ( not ( = ?auto_437092 ?auto_437100 ) ) ( not ( = ?auto_437092 ?auto_437101 ) ) ( not ( = ?auto_437093 ?auto_437094 ) ) ( not ( = ?auto_437093 ?auto_437095 ) ) ( not ( = ?auto_437093 ?auto_437096 ) ) ( not ( = ?auto_437093 ?auto_437097 ) ) ( not ( = ?auto_437093 ?auto_437098 ) ) ( not ( = ?auto_437093 ?auto_437099 ) ) ( not ( = ?auto_437093 ?auto_437100 ) ) ( not ( = ?auto_437093 ?auto_437101 ) ) ( not ( = ?auto_437094 ?auto_437095 ) ) ( not ( = ?auto_437094 ?auto_437096 ) ) ( not ( = ?auto_437094 ?auto_437097 ) ) ( not ( = ?auto_437094 ?auto_437098 ) ) ( not ( = ?auto_437094 ?auto_437099 ) ) ( not ( = ?auto_437094 ?auto_437100 ) ) ( not ( = ?auto_437094 ?auto_437101 ) ) ( not ( = ?auto_437095 ?auto_437096 ) ) ( not ( = ?auto_437095 ?auto_437097 ) ) ( not ( = ?auto_437095 ?auto_437098 ) ) ( not ( = ?auto_437095 ?auto_437099 ) ) ( not ( = ?auto_437095 ?auto_437100 ) ) ( not ( = ?auto_437095 ?auto_437101 ) ) ( not ( = ?auto_437096 ?auto_437097 ) ) ( not ( = ?auto_437096 ?auto_437098 ) ) ( not ( = ?auto_437096 ?auto_437099 ) ) ( not ( = ?auto_437096 ?auto_437100 ) ) ( not ( = ?auto_437096 ?auto_437101 ) ) ( not ( = ?auto_437097 ?auto_437098 ) ) ( not ( = ?auto_437097 ?auto_437099 ) ) ( not ( = ?auto_437097 ?auto_437100 ) ) ( not ( = ?auto_437097 ?auto_437101 ) ) ( not ( = ?auto_437098 ?auto_437099 ) ) ( not ( = ?auto_437098 ?auto_437100 ) ) ( not ( = ?auto_437098 ?auto_437101 ) ) ( not ( = ?auto_437099 ?auto_437100 ) ) ( not ( = ?auto_437099 ?auto_437101 ) ) ( not ( = ?auto_437100 ?auto_437101 ) ) ( ON ?auto_437099 ?auto_437100 ) ( ON ?auto_437098 ?auto_437099 ) ( ON ?auto_437097 ?auto_437098 ) ( ON ?auto_437096 ?auto_437097 ) ( ON ?auto_437095 ?auto_437096 ) ( ON ?auto_437094 ?auto_437095 ) ( ON ?auto_437093 ?auto_437094 ) ( ON ?auto_437092 ?auto_437093 ) ( ON ?auto_437091 ?auto_437092 ) ( ON ?auto_437090 ?auto_437091 ) ( ON ?auto_437089 ?auto_437090 ) ( ON ?auto_437088 ?auto_437089 ) ( CLEAR ?auto_437088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_437088 )
      ( MAKE-13PILE ?auto_437088 ?auto_437089 ?auto_437090 ?auto_437091 ?auto_437092 ?auto_437093 ?auto_437094 ?auto_437095 ?auto_437096 ?auto_437097 ?auto_437098 ?auto_437099 ?auto_437100 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437116 - BLOCK
      ?auto_437117 - BLOCK
      ?auto_437118 - BLOCK
      ?auto_437119 - BLOCK
      ?auto_437120 - BLOCK
      ?auto_437121 - BLOCK
      ?auto_437122 - BLOCK
      ?auto_437123 - BLOCK
      ?auto_437124 - BLOCK
      ?auto_437125 - BLOCK
      ?auto_437126 - BLOCK
      ?auto_437127 - BLOCK
      ?auto_437128 - BLOCK
      ?auto_437129 - BLOCK
    )
    :vars
    (
      ?auto_437130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_437128 ) ( ON ?auto_437129 ?auto_437130 ) ( CLEAR ?auto_437129 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_437116 ) ( ON ?auto_437117 ?auto_437116 ) ( ON ?auto_437118 ?auto_437117 ) ( ON ?auto_437119 ?auto_437118 ) ( ON ?auto_437120 ?auto_437119 ) ( ON ?auto_437121 ?auto_437120 ) ( ON ?auto_437122 ?auto_437121 ) ( ON ?auto_437123 ?auto_437122 ) ( ON ?auto_437124 ?auto_437123 ) ( ON ?auto_437125 ?auto_437124 ) ( ON ?auto_437126 ?auto_437125 ) ( ON ?auto_437127 ?auto_437126 ) ( ON ?auto_437128 ?auto_437127 ) ( not ( = ?auto_437116 ?auto_437117 ) ) ( not ( = ?auto_437116 ?auto_437118 ) ) ( not ( = ?auto_437116 ?auto_437119 ) ) ( not ( = ?auto_437116 ?auto_437120 ) ) ( not ( = ?auto_437116 ?auto_437121 ) ) ( not ( = ?auto_437116 ?auto_437122 ) ) ( not ( = ?auto_437116 ?auto_437123 ) ) ( not ( = ?auto_437116 ?auto_437124 ) ) ( not ( = ?auto_437116 ?auto_437125 ) ) ( not ( = ?auto_437116 ?auto_437126 ) ) ( not ( = ?auto_437116 ?auto_437127 ) ) ( not ( = ?auto_437116 ?auto_437128 ) ) ( not ( = ?auto_437116 ?auto_437129 ) ) ( not ( = ?auto_437116 ?auto_437130 ) ) ( not ( = ?auto_437117 ?auto_437118 ) ) ( not ( = ?auto_437117 ?auto_437119 ) ) ( not ( = ?auto_437117 ?auto_437120 ) ) ( not ( = ?auto_437117 ?auto_437121 ) ) ( not ( = ?auto_437117 ?auto_437122 ) ) ( not ( = ?auto_437117 ?auto_437123 ) ) ( not ( = ?auto_437117 ?auto_437124 ) ) ( not ( = ?auto_437117 ?auto_437125 ) ) ( not ( = ?auto_437117 ?auto_437126 ) ) ( not ( = ?auto_437117 ?auto_437127 ) ) ( not ( = ?auto_437117 ?auto_437128 ) ) ( not ( = ?auto_437117 ?auto_437129 ) ) ( not ( = ?auto_437117 ?auto_437130 ) ) ( not ( = ?auto_437118 ?auto_437119 ) ) ( not ( = ?auto_437118 ?auto_437120 ) ) ( not ( = ?auto_437118 ?auto_437121 ) ) ( not ( = ?auto_437118 ?auto_437122 ) ) ( not ( = ?auto_437118 ?auto_437123 ) ) ( not ( = ?auto_437118 ?auto_437124 ) ) ( not ( = ?auto_437118 ?auto_437125 ) ) ( not ( = ?auto_437118 ?auto_437126 ) ) ( not ( = ?auto_437118 ?auto_437127 ) ) ( not ( = ?auto_437118 ?auto_437128 ) ) ( not ( = ?auto_437118 ?auto_437129 ) ) ( not ( = ?auto_437118 ?auto_437130 ) ) ( not ( = ?auto_437119 ?auto_437120 ) ) ( not ( = ?auto_437119 ?auto_437121 ) ) ( not ( = ?auto_437119 ?auto_437122 ) ) ( not ( = ?auto_437119 ?auto_437123 ) ) ( not ( = ?auto_437119 ?auto_437124 ) ) ( not ( = ?auto_437119 ?auto_437125 ) ) ( not ( = ?auto_437119 ?auto_437126 ) ) ( not ( = ?auto_437119 ?auto_437127 ) ) ( not ( = ?auto_437119 ?auto_437128 ) ) ( not ( = ?auto_437119 ?auto_437129 ) ) ( not ( = ?auto_437119 ?auto_437130 ) ) ( not ( = ?auto_437120 ?auto_437121 ) ) ( not ( = ?auto_437120 ?auto_437122 ) ) ( not ( = ?auto_437120 ?auto_437123 ) ) ( not ( = ?auto_437120 ?auto_437124 ) ) ( not ( = ?auto_437120 ?auto_437125 ) ) ( not ( = ?auto_437120 ?auto_437126 ) ) ( not ( = ?auto_437120 ?auto_437127 ) ) ( not ( = ?auto_437120 ?auto_437128 ) ) ( not ( = ?auto_437120 ?auto_437129 ) ) ( not ( = ?auto_437120 ?auto_437130 ) ) ( not ( = ?auto_437121 ?auto_437122 ) ) ( not ( = ?auto_437121 ?auto_437123 ) ) ( not ( = ?auto_437121 ?auto_437124 ) ) ( not ( = ?auto_437121 ?auto_437125 ) ) ( not ( = ?auto_437121 ?auto_437126 ) ) ( not ( = ?auto_437121 ?auto_437127 ) ) ( not ( = ?auto_437121 ?auto_437128 ) ) ( not ( = ?auto_437121 ?auto_437129 ) ) ( not ( = ?auto_437121 ?auto_437130 ) ) ( not ( = ?auto_437122 ?auto_437123 ) ) ( not ( = ?auto_437122 ?auto_437124 ) ) ( not ( = ?auto_437122 ?auto_437125 ) ) ( not ( = ?auto_437122 ?auto_437126 ) ) ( not ( = ?auto_437122 ?auto_437127 ) ) ( not ( = ?auto_437122 ?auto_437128 ) ) ( not ( = ?auto_437122 ?auto_437129 ) ) ( not ( = ?auto_437122 ?auto_437130 ) ) ( not ( = ?auto_437123 ?auto_437124 ) ) ( not ( = ?auto_437123 ?auto_437125 ) ) ( not ( = ?auto_437123 ?auto_437126 ) ) ( not ( = ?auto_437123 ?auto_437127 ) ) ( not ( = ?auto_437123 ?auto_437128 ) ) ( not ( = ?auto_437123 ?auto_437129 ) ) ( not ( = ?auto_437123 ?auto_437130 ) ) ( not ( = ?auto_437124 ?auto_437125 ) ) ( not ( = ?auto_437124 ?auto_437126 ) ) ( not ( = ?auto_437124 ?auto_437127 ) ) ( not ( = ?auto_437124 ?auto_437128 ) ) ( not ( = ?auto_437124 ?auto_437129 ) ) ( not ( = ?auto_437124 ?auto_437130 ) ) ( not ( = ?auto_437125 ?auto_437126 ) ) ( not ( = ?auto_437125 ?auto_437127 ) ) ( not ( = ?auto_437125 ?auto_437128 ) ) ( not ( = ?auto_437125 ?auto_437129 ) ) ( not ( = ?auto_437125 ?auto_437130 ) ) ( not ( = ?auto_437126 ?auto_437127 ) ) ( not ( = ?auto_437126 ?auto_437128 ) ) ( not ( = ?auto_437126 ?auto_437129 ) ) ( not ( = ?auto_437126 ?auto_437130 ) ) ( not ( = ?auto_437127 ?auto_437128 ) ) ( not ( = ?auto_437127 ?auto_437129 ) ) ( not ( = ?auto_437127 ?auto_437130 ) ) ( not ( = ?auto_437128 ?auto_437129 ) ) ( not ( = ?auto_437128 ?auto_437130 ) ) ( not ( = ?auto_437129 ?auto_437130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_437129 ?auto_437130 )
      ( !STACK ?auto_437129 ?auto_437128 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437145 - BLOCK
      ?auto_437146 - BLOCK
      ?auto_437147 - BLOCK
      ?auto_437148 - BLOCK
      ?auto_437149 - BLOCK
      ?auto_437150 - BLOCK
      ?auto_437151 - BLOCK
      ?auto_437152 - BLOCK
      ?auto_437153 - BLOCK
      ?auto_437154 - BLOCK
      ?auto_437155 - BLOCK
      ?auto_437156 - BLOCK
      ?auto_437157 - BLOCK
      ?auto_437158 - BLOCK
    )
    :vars
    (
      ?auto_437159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_437157 ) ( ON ?auto_437158 ?auto_437159 ) ( CLEAR ?auto_437158 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_437145 ) ( ON ?auto_437146 ?auto_437145 ) ( ON ?auto_437147 ?auto_437146 ) ( ON ?auto_437148 ?auto_437147 ) ( ON ?auto_437149 ?auto_437148 ) ( ON ?auto_437150 ?auto_437149 ) ( ON ?auto_437151 ?auto_437150 ) ( ON ?auto_437152 ?auto_437151 ) ( ON ?auto_437153 ?auto_437152 ) ( ON ?auto_437154 ?auto_437153 ) ( ON ?auto_437155 ?auto_437154 ) ( ON ?auto_437156 ?auto_437155 ) ( ON ?auto_437157 ?auto_437156 ) ( not ( = ?auto_437145 ?auto_437146 ) ) ( not ( = ?auto_437145 ?auto_437147 ) ) ( not ( = ?auto_437145 ?auto_437148 ) ) ( not ( = ?auto_437145 ?auto_437149 ) ) ( not ( = ?auto_437145 ?auto_437150 ) ) ( not ( = ?auto_437145 ?auto_437151 ) ) ( not ( = ?auto_437145 ?auto_437152 ) ) ( not ( = ?auto_437145 ?auto_437153 ) ) ( not ( = ?auto_437145 ?auto_437154 ) ) ( not ( = ?auto_437145 ?auto_437155 ) ) ( not ( = ?auto_437145 ?auto_437156 ) ) ( not ( = ?auto_437145 ?auto_437157 ) ) ( not ( = ?auto_437145 ?auto_437158 ) ) ( not ( = ?auto_437145 ?auto_437159 ) ) ( not ( = ?auto_437146 ?auto_437147 ) ) ( not ( = ?auto_437146 ?auto_437148 ) ) ( not ( = ?auto_437146 ?auto_437149 ) ) ( not ( = ?auto_437146 ?auto_437150 ) ) ( not ( = ?auto_437146 ?auto_437151 ) ) ( not ( = ?auto_437146 ?auto_437152 ) ) ( not ( = ?auto_437146 ?auto_437153 ) ) ( not ( = ?auto_437146 ?auto_437154 ) ) ( not ( = ?auto_437146 ?auto_437155 ) ) ( not ( = ?auto_437146 ?auto_437156 ) ) ( not ( = ?auto_437146 ?auto_437157 ) ) ( not ( = ?auto_437146 ?auto_437158 ) ) ( not ( = ?auto_437146 ?auto_437159 ) ) ( not ( = ?auto_437147 ?auto_437148 ) ) ( not ( = ?auto_437147 ?auto_437149 ) ) ( not ( = ?auto_437147 ?auto_437150 ) ) ( not ( = ?auto_437147 ?auto_437151 ) ) ( not ( = ?auto_437147 ?auto_437152 ) ) ( not ( = ?auto_437147 ?auto_437153 ) ) ( not ( = ?auto_437147 ?auto_437154 ) ) ( not ( = ?auto_437147 ?auto_437155 ) ) ( not ( = ?auto_437147 ?auto_437156 ) ) ( not ( = ?auto_437147 ?auto_437157 ) ) ( not ( = ?auto_437147 ?auto_437158 ) ) ( not ( = ?auto_437147 ?auto_437159 ) ) ( not ( = ?auto_437148 ?auto_437149 ) ) ( not ( = ?auto_437148 ?auto_437150 ) ) ( not ( = ?auto_437148 ?auto_437151 ) ) ( not ( = ?auto_437148 ?auto_437152 ) ) ( not ( = ?auto_437148 ?auto_437153 ) ) ( not ( = ?auto_437148 ?auto_437154 ) ) ( not ( = ?auto_437148 ?auto_437155 ) ) ( not ( = ?auto_437148 ?auto_437156 ) ) ( not ( = ?auto_437148 ?auto_437157 ) ) ( not ( = ?auto_437148 ?auto_437158 ) ) ( not ( = ?auto_437148 ?auto_437159 ) ) ( not ( = ?auto_437149 ?auto_437150 ) ) ( not ( = ?auto_437149 ?auto_437151 ) ) ( not ( = ?auto_437149 ?auto_437152 ) ) ( not ( = ?auto_437149 ?auto_437153 ) ) ( not ( = ?auto_437149 ?auto_437154 ) ) ( not ( = ?auto_437149 ?auto_437155 ) ) ( not ( = ?auto_437149 ?auto_437156 ) ) ( not ( = ?auto_437149 ?auto_437157 ) ) ( not ( = ?auto_437149 ?auto_437158 ) ) ( not ( = ?auto_437149 ?auto_437159 ) ) ( not ( = ?auto_437150 ?auto_437151 ) ) ( not ( = ?auto_437150 ?auto_437152 ) ) ( not ( = ?auto_437150 ?auto_437153 ) ) ( not ( = ?auto_437150 ?auto_437154 ) ) ( not ( = ?auto_437150 ?auto_437155 ) ) ( not ( = ?auto_437150 ?auto_437156 ) ) ( not ( = ?auto_437150 ?auto_437157 ) ) ( not ( = ?auto_437150 ?auto_437158 ) ) ( not ( = ?auto_437150 ?auto_437159 ) ) ( not ( = ?auto_437151 ?auto_437152 ) ) ( not ( = ?auto_437151 ?auto_437153 ) ) ( not ( = ?auto_437151 ?auto_437154 ) ) ( not ( = ?auto_437151 ?auto_437155 ) ) ( not ( = ?auto_437151 ?auto_437156 ) ) ( not ( = ?auto_437151 ?auto_437157 ) ) ( not ( = ?auto_437151 ?auto_437158 ) ) ( not ( = ?auto_437151 ?auto_437159 ) ) ( not ( = ?auto_437152 ?auto_437153 ) ) ( not ( = ?auto_437152 ?auto_437154 ) ) ( not ( = ?auto_437152 ?auto_437155 ) ) ( not ( = ?auto_437152 ?auto_437156 ) ) ( not ( = ?auto_437152 ?auto_437157 ) ) ( not ( = ?auto_437152 ?auto_437158 ) ) ( not ( = ?auto_437152 ?auto_437159 ) ) ( not ( = ?auto_437153 ?auto_437154 ) ) ( not ( = ?auto_437153 ?auto_437155 ) ) ( not ( = ?auto_437153 ?auto_437156 ) ) ( not ( = ?auto_437153 ?auto_437157 ) ) ( not ( = ?auto_437153 ?auto_437158 ) ) ( not ( = ?auto_437153 ?auto_437159 ) ) ( not ( = ?auto_437154 ?auto_437155 ) ) ( not ( = ?auto_437154 ?auto_437156 ) ) ( not ( = ?auto_437154 ?auto_437157 ) ) ( not ( = ?auto_437154 ?auto_437158 ) ) ( not ( = ?auto_437154 ?auto_437159 ) ) ( not ( = ?auto_437155 ?auto_437156 ) ) ( not ( = ?auto_437155 ?auto_437157 ) ) ( not ( = ?auto_437155 ?auto_437158 ) ) ( not ( = ?auto_437155 ?auto_437159 ) ) ( not ( = ?auto_437156 ?auto_437157 ) ) ( not ( = ?auto_437156 ?auto_437158 ) ) ( not ( = ?auto_437156 ?auto_437159 ) ) ( not ( = ?auto_437157 ?auto_437158 ) ) ( not ( = ?auto_437157 ?auto_437159 ) ) ( not ( = ?auto_437158 ?auto_437159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_437158 ?auto_437159 )
      ( !STACK ?auto_437158 ?auto_437157 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437174 - BLOCK
      ?auto_437175 - BLOCK
      ?auto_437176 - BLOCK
      ?auto_437177 - BLOCK
      ?auto_437178 - BLOCK
      ?auto_437179 - BLOCK
      ?auto_437180 - BLOCK
      ?auto_437181 - BLOCK
      ?auto_437182 - BLOCK
      ?auto_437183 - BLOCK
      ?auto_437184 - BLOCK
      ?auto_437185 - BLOCK
      ?auto_437186 - BLOCK
      ?auto_437187 - BLOCK
    )
    :vars
    (
      ?auto_437188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437187 ?auto_437188 ) ( ON-TABLE ?auto_437174 ) ( ON ?auto_437175 ?auto_437174 ) ( ON ?auto_437176 ?auto_437175 ) ( ON ?auto_437177 ?auto_437176 ) ( ON ?auto_437178 ?auto_437177 ) ( ON ?auto_437179 ?auto_437178 ) ( ON ?auto_437180 ?auto_437179 ) ( ON ?auto_437181 ?auto_437180 ) ( ON ?auto_437182 ?auto_437181 ) ( ON ?auto_437183 ?auto_437182 ) ( ON ?auto_437184 ?auto_437183 ) ( ON ?auto_437185 ?auto_437184 ) ( not ( = ?auto_437174 ?auto_437175 ) ) ( not ( = ?auto_437174 ?auto_437176 ) ) ( not ( = ?auto_437174 ?auto_437177 ) ) ( not ( = ?auto_437174 ?auto_437178 ) ) ( not ( = ?auto_437174 ?auto_437179 ) ) ( not ( = ?auto_437174 ?auto_437180 ) ) ( not ( = ?auto_437174 ?auto_437181 ) ) ( not ( = ?auto_437174 ?auto_437182 ) ) ( not ( = ?auto_437174 ?auto_437183 ) ) ( not ( = ?auto_437174 ?auto_437184 ) ) ( not ( = ?auto_437174 ?auto_437185 ) ) ( not ( = ?auto_437174 ?auto_437186 ) ) ( not ( = ?auto_437174 ?auto_437187 ) ) ( not ( = ?auto_437174 ?auto_437188 ) ) ( not ( = ?auto_437175 ?auto_437176 ) ) ( not ( = ?auto_437175 ?auto_437177 ) ) ( not ( = ?auto_437175 ?auto_437178 ) ) ( not ( = ?auto_437175 ?auto_437179 ) ) ( not ( = ?auto_437175 ?auto_437180 ) ) ( not ( = ?auto_437175 ?auto_437181 ) ) ( not ( = ?auto_437175 ?auto_437182 ) ) ( not ( = ?auto_437175 ?auto_437183 ) ) ( not ( = ?auto_437175 ?auto_437184 ) ) ( not ( = ?auto_437175 ?auto_437185 ) ) ( not ( = ?auto_437175 ?auto_437186 ) ) ( not ( = ?auto_437175 ?auto_437187 ) ) ( not ( = ?auto_437175 ?auto_437188 ) ) ( not ( = ?auto_437176 ?auto_437177 ) ) ( not ( = ?auto_437176 ?auto_437178 ) ) ( not ( = ?auto_437176 ?auto_437179 ) ) ( not ( = ?auto_437176 ?auto_437180 ) ) ( not ( = ?auto_437176 ?auto_437181 ) ) ( not ( = ?auto_437176 ?auto_437182 ) ) ( not ( = ?auto_437176 ?auto_437183 ) ) ( not ( = ?auto_437176 ?auto_437184 ) ) ( not ( = ?auto_437176 ?auto_437185 ) ) ( not ( = ?auto_437176 ?auto_437186 ) ) ( not ( = ?auto_437176 ?auto_437187 ) ) ( not ( = ?auto_437176 ?auto_437188 ) ) ( not ( = ?auto_437177 ?auto_437178 ) ) ( not ( = ?auto_437177 ?auto_437179 ) ) ( not ( = ?auto_437177 ?auto_437180 ) ) ( not ( = ?auto_437177 ?auto_437181 ) ) ( not ( = ?auto_437177 ?auto_437182 ) ) ( not ( = ?auto_437177 ?auto_437183 ) ) ( not ( = ?auto_437177 ?auto_437184 ) ) ( not ( = ?auto_437177 ?auto_437185 ) ) ( not ( = ?auto_437177 ?auto_437186 ) ) ( not ( = ?auto_437177 ?auto_437187 ) ) ( not ( = ?auto_437177 ?auto_437188 ) ) ( not ( = ?auto_437178 ?auto_437179 ) ) ( not ( = ?auto_437178 ?auto_437180 ) ) ( not ( = ?auto_437178 ?auto_437181 ) ) ( not ( = ?auto_437178 ?auto_437182 ) ) ( not ( = ?auto_437178 ?auto_437183 ) ) ( not ( = ?auto_437178 ?auto_437184 ) ) ( not ( = ?auto_437178 ?auto_437185 ) ) ( not ( = ?auto_437178 ?auto_437186 ) ) ( not ( = ?auto_437178 ?auto_437187 ) ) ( not ( = ?auto_437178 ?auto_437188 ) ) ( not ( = ?auto_437179 ?auto_437180 ) ) ( not ( = ?auto_437179 ?auto_437181 ) ) ( not ( = ?auto_437179 ?auto_437182 ) ) ( not ( = ?auto_437179 ?auto_437183 ) ) ( not ( = ?auto_437179 ?auto_437184 ) ) ( not ( = ?auto_437179 ?auto_437185 ) ) ( not ( = ?auto_437179 ?auto_437186 ) ) ( not ( = ?auto_437179 ?auto_437187 ) ) ( not ( = ?auto_437179 ?auto_437188 ) ) ( not ( = ?auto_437180 ?auto_437181 ) ) ( not ( = ?auto_437180 ?auto_437182 ) ) ( not ( = ?auto_437180 ?auto_437183 ) ) ( not ( = ?auto_437180 ?auto_437184 ) ) ( not ( = ?auto_437180 ?auto_437185 ) ) ( not ( = ?auto_437180 ?auto_437186 ) ) ( not ( = ?auto_437180 ?auto_437187 ) ) ( not ( = ?auto_437180 ?auto_437188 ) ) ( not ( = ?auto_437181 ?auto_437182 ) ) ( not ( = ?auto_437181 ?auto_437183 ) ) ( not ( = ?auto_437181 ?auto_437184 ) ) ( not ( = ?auto_437181 ?auto_437185 ) ) ( not ( = ?auto_437181 ?auto_437186 ) ) ( not ( = ?auto_437181 ?auto_437187 ) ) ( not ( = ?auto_437181 ?auto_437188 ) ) ( not ( = ?auto_437182 ?auto_437183 ) ) ( not ( = ?auto_437182 ?auto_437184 ) ) ( not ( = ?auto_437182 ?auto_437185 ) ) ( not ( = ?auto_437182 ?auto_437186 ) ) ( not ( = ?auto_437182 ?auto_437187 ) ) ( not ( = ?auto_437182 ?auto_437188 ) ) ( not ( = ?auto_437183 ?auto_437184 ) ) ( not ( = ?auto_437183 ?auto_437185 ) ) ( not ( = ?auto_437183 ?auto_437186 ) ) ( not ( = ?auto_437183 ?auto_437187 ) ) ( not ( = ?auto_437183 ?auto_437188 ) ) ( not ( = ?auto_437184 ?auto_437185 ) ) ( not ( = ?auto_437184 ?auto_437186 ) ) ( not ( = ?auto_437184 ?auto_437187 ) ) ( not ( = ?auto_437184 ?auto_437188 ) ) ( not ( = ?auto_437185 ?auto_437186 ) ) ( not ( = ?auto_437185 ?auto_437187 ) ) ( not ( = ?auto_437185 ?auto_437188 ) ) ( not ( = ?auto_437186 ?auto_437187 ) ) ( not ( = ?auto_437186 ?auto_437188 ) ) ( not ( = ?auto_437187 ?auto_437188 ) ) ( CLEAR ?auto_437185 ) ( ON ?auto_437186 ?auto_437187 ) ( CLEAR ?auto_437186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_437174 ?auto_437175 ?auto_437176 ?auto_437177 ?auto_437178 ?auto_437179 ?auto_437180 ?auto_437181 ?auto_437182 ?auto_437183 ?auto_437184 ?auto_437185 ?auto_437186 )
      ( MAKE-14PILE ?auto_437174 ?auto_437175 ?auto_437176 ?auto_437177 ?auto_437178 ?auto_437179 ?auto_437180 ?auto_437181 ?auto_437182 ?auto_437183 ?auto_437184 ?auto_437185 ?auto_437186 ?auto_437187 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437203 - BLOCK
      ?auto_437204 - BLOCK
      ?auto_437205 - BLOCK
      ?auto_437206 - BLOCK
      ?auto_437207 - BLOCK
      ?auto_437208 - BLOCK
      ?auto_437209 - BLOCK
      ?auto_437210 - BLOCK
      ?auto_437211 - BLOCK
      ?auto_437212 - BLOCK
      ?auto_437213 - BLOCK
      ?auto_437214 - BLOCK
      ?auto_437215 - BLOCK
      ?auto_437216 - BLOCK
    )
    :vars
    (
      ?auto_437217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437216 ?auto_437217 ) ( ON-TABLE ?auto_437203 ) ( ON ?auto_437204 ?auto_437203 ) ( ON ?auto_437205 ?auto_437204 ) ( ON ?auto_437206 ?auto_437205 ) ( ON ?auto_437207 ?auto_437206 ) ( ON ?auto_437208 ?auto_437207 ) ( ON ?auto_437209 ?auto_437208 ) ( ON ?auto_437210 ?auto_437209 ) ( ON ?auto_437211 ?auto_437210 ) ( ON ?auto_437212 ?auto_437211 ) ( ON ?auto_437213 ?auto_437212 ) ( ON ?auto_437214 ?auto_437213 ) ( not ( = ?auto_437203 ?auto_437204 ) ) ( not ( = ?auto_437203 ?auto_437205 ) ) ( not ( = ?auto_437203 ?auto_437206 ) ) ( not ( = ?auto_437203 ?auto_437207 ) ) ( not ( = ?auto_437203 ?auto_437208 ) ) ( not ( = ?auto_437203 ?auto_437209 ) ) ( not ( = ?auto_437203 ?auto_437210 ) ) ( not ( = ?auto_437203 ?auto_437211 ) ) ( not ( = ?auto_437203 ?auto_437212 ) ) ( not ( = ?auto_437203 ?auto_437213 ) ) ( not ( = ?auto_437203 ?auto_437214 ) ) ( not ( = ?auto_437203 ?auto_437215 ) ) ( not ( = ?auto_437203 ?auto_437216 ) ) ( not ( = ?auto_437203 ?auto_437217 ) ) ( not ( = ?auto_437204 ?auto_437205 ) ) ( not ( = ?auto_437204 ?auto_437206 ) ) ( not ( = ?auto_437204 ?auto_437207 ) ) ( not ( = ?auto_437204 ?auto_437208 ) ) ( not ( = ?auto_437204 ?auto_437209 ) ) ( not ( = ?auto_437204 ?auto_437210 ) ) ( not ( = ?auto_437204 ?auto_437211 ) ) ( not ( = ?auto_437204 ?auto_437212 ) ) ( not ( = ?auto_437204 ?auto_437213 ) ) ( not ( = ?auto_437204 ?auto_437214 ) ) ( not ( = ?auto_437204 ?auto_437215 ) ) ( not ( = ?auto_437204 ?auto_437216 ) ) ( not ( = ?auto_437204 ?auto_437217 ) ) ( not ( = ?auto_437205 ?auto_437206 ) ) ( not ( = ?auto_437205 ?auto_437207 ) ) ( not ( = ?auto_437205 ?auto_437208 ) ) ( not ( = ?auto_437205 ?auto_437209 ) ) ( not ( = ?auto_437205 ?auto_437210 ) ) ( not ( = ?auto_437205 ?auto_437211 ) ) ( not ( = ?auto_437205 ?auto_437212 ) ) ( not ( = ?auto_437205 ?auto_437213 ) ) ( not ( = ?auto_437205 ?auto_437214 ) ) ( not ( = ?auto_437205 ?auto_437215 ) ) ( not ( = ?auto_437205 ?auto_437216 ) ) ( not ( = ?auto_437205 ?auto_437217 ) ) ( not ( = ?auto_437206 ?auto_437207 ) ) ( not ( = ?auto_437206 ?auto_437208 ) ) ( not ( = ?auto_437206 ?auto_437209 ) ) ( not ( = ?auto_437206 ?auto_437210 ) ) ( not ( = ?auto_437206 ?auto_437211 ) ) ( not ( = ?auto_437206 ?auto_437212 ) ) ( not ( = ?auto_437206 ?auto_437213 ) ) ( not ( = ?auto_437206 ?auto_437214 ) ) ( not ( = ?auto_437206 ?auto_437215 ) ) ( not ( = ?auto_437206 ?auto_437216 ) ) ( not ( = ?auto_437206 ?auto_437217 ) ) ( not ( = ?auto_437207 ?auto_437208 ) ) ( not ( = ?auto_437207 ?auto_437209 ) ) ( not ( = ?auto_437207 ?auto_437210 ) ) ( not ( = ?auto_437207 ?auto_437211 ) ) ( not ( = ?auto_437207 ?auto_437212 ) ) ( not ( = ?auto_437207 ?auto_437213 ) ) ( not ( = ?auto_437207 ?auto_437214 ) ) ( not ( = ?auto_437207 ?auto_437215 ) ) ( not ( = ?auto_437207 ?auto_437216 ) ) ( not ( = ?auto_437207 ?auto_437217 ) ) ( not ( = ?auto_437208 ?auto_437209 ) ) ( not ( = ?auto_437208 ?auto_437210 ) ) ( not ( = ?auto_437208 ?auto_437211 ) ) ( not ( = ?auto_437208 ?auto_437212 ) ) ( not ( = ?auto_437208 ?auto_437213 ) ) ( not ( = ?auto_437208 ?auto_437214 ) ) ( not ( = ?auto_437208 ?auto_437215 ) ) ( not ( = ?auto_437208 ?auto_437216 ) ) ( not ( = ?auto_437208 ?auto_437217 ) ) ( not ( = ?auto_437209 ?auto_437210 ) ) ( not ( = ?auto_437209 ?auto_437211 ) ) ( not ( = ?auto_437209 ?auto_437212 ) ) ( not ( = ?auto_437209 ?auto_437213 ) ) ( not ( = ?auto_437209 ?auto_437214 ) ) ( not ( = ?auto_437209 ?auto_437215 ) ) ( not ( = ?auto_437209 ?auto_437216 ) ) ( not ( = ?auto_437209 ?auto_437217 ) ) ( not ( = ?auto_437210 ?auto_437211 ) ) ( not ( = ?auto_437210 ?auto_437212 ) ) ( not ( = ?auto_437210 ?auto_437213 ) ) ( not ( = ?auto_437210 ?auto_437214 ) ) ( not ( = ?auto_437210 ?auto_437215 ) ) ( not ( = ?auto_437210 ?auto_437216 ) ) ( not ( = ?auto_437210 ?auto_437217 ) ) ( not ( = ?auto_437211 ?auto_437212 ) ) ( not ( = ?auto_437211 ?auto_437213 ) ) ( not ( = ?auto_437211 ?auto_437214 ) ) ( not ( = ?auto_437211 ?auto_437215 ) ) ( not ( = ?auto_437211 ?auto_437216 ) ) ( not ( = ?auto_437211 ?auto_437217 ) ) ( not ( = ?auto_437212 ?auto_437213 ) ) ( not ( = ?auto_437212 ?auto_437214 ) ) ( not ( = ?auto_437212 ?auto_437215 ) ) ( not ( = ?auto_437212 ?auto_437216 ) ) ( not ( = ?auto_437212 ?auto_437217 ) ) ( not ( = ?auto_437213 ?auto_437214 ) ) ( not ( = ?auto_437213 ?auto_437215 ) ) ( not ( = ?auto_437213 ?auto_437216 ) ) ( not ( = ?auto_437213 ?auto_437217 ) ) ( not ( = ?auto_437214 ?auto_437215 ) ) ( not ( = ?auto_437214 ?auto_437216 ) ) ( not ( = ?auto_437214 ?auto_437217 ) ) ( not ( = ?auto_437215 ?auto_437216 ) ) ( not ( = ?auto_437215 ?auto_437217 ) ) ( not ( = ?auto_437216 ?auto_437217 ) ) ( CLEAR ?auto_437214 ) ( ON ?auto_437215 ?auto_437216 ) ( CLEAR ?auto_437215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_437203 ?auto_437204 ?auto_437205 ?auto_437206 ?auto_437207 ?auto_437208 ?auto_437209 ?auto_437210 ?auto_437211 ?auto_437212 ?auto_437213 ?auto_437214 ?auto_437215 )
      ( MAKE-14PILE ?auto_437203 ?auto_437204 ?auto_437205 ?auto_437206 ?auto_437207 ?auto_437208 ?auto_437209 ?auto_437210 ?auto_437211 ?auto_437212 ?auto_437213 ?auto_437214 ?auto_437215 ?auto_437216 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437232 - BLOCK
      ?auto_437233 - BLOCK
      ?auto_437234 - BLOCK
      ?auto_437235 - BLOCK
      ?auto_437236 - BLOCK
      ?auto_437237 - BLOCK
      ?auto_437238 - BLOCK
      ?auto_437239 - BLOCK
      ?auto_437240 - BLOCK
      ?auto_437241 - BLOCK
      ?auto_437242 - BLOCK
      ?auto_437243 - BLOCK
      ?auto_437244 - BLOCK
      ?auto_437245 - BLOCK
    )
    :vars
    (
      ?auto_437246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437245 ?auto_437246 ) ( ON-TABLE ?auto_437232 ) ( ON ?auto_437233 ?auto_437232 ) ( ON ?auto_437234 ?auto_437233 ) ( ON ?auto_437235 ?auto_437234 ) ( ON ?auto_437236 ?auto_437235 ) ( ON ?auto_437237 ?auto_437236 ) ( ON ?auto_437238 ?auto_437237 ) ( ON ?auto_437239 ?auto_437238 ) ( ON ?auto_437240 ?auto_437239 ) ( ON ?auto_437241 ?auto_437240 ) ( ON ?auto_437242 ?auto_437241 ) ( not ( = ?auto_437232 ?auto_437233 ) ) ( not ( = ?auto_437232 ?auto_437234 ) ) ( not ( = ?auto_437232 ?auto_437235 ) ) ( not ( = ?auto_437232 ?auto_437236 ) ) ( not ( = ?auto_437232 ?auto_437237 ) ) ( not ( = ?auto_437232 ?auto_437238 ) ) ( not ( = ?auto_437232 ?auto_437239 ) ) ( not ( = ?auto_437232 ?auto_437240 ) ) ( not ( = ?auto_437232 ?auto_437241 ) ) ( not ( = ?auto_437232 ?auto_437242 ) ) ( not ( = ?auto_437232 ?auto_437243 ) ) ( not ( = ?auto_437232 ?auto_437244 ) ) ( not ( = ?auto_437232 ?auto_437245 ) ) ( not ( = ?auto_437232 ?auto_437246 ) ) ( not ( = ?auto_437233 ?auto_437234 ) ) ( not ( = ?auto_437233 ?auto_437235 ) ) ( not ( = ?auto_437233 ?auto_437236 ) ) ( not ( = ?auto_437233 ?auto_437237 ) ) ( not ( = ?auto_437233 ?auto_437238 ) ) ( not ( = ?auto_437233 ?auto_437239 ) ) ( not ( = ?auto_437233 ?auto_437240 ) ) ( not ( = ?auto_437233 ?auto_437241 ) ) ( not ( = ?auto_437233 ?auto_437242 ) ) ( not ( = ?auto_437233 ?auto_437243 ) ) ( not ( = ?auto_437233 ?auto_437244 ) ) ( not ( = ?auto_437233 ?auto_437245 ) ) ( not ( = ?auto_437233 ?auto_437246 ) ) ( not ( = ?auto_437234 ?auto_437235 ) ) ( not ( = ?auto_437234 ?auto_437236 ) ) ( not ( = ?auto_437234 ?auto_437237 ) ) ( not ( = ?auto_437234 ?auto_437238 ) ) ( not ( = ?auto_437234 ?auto_437239 ) ) ( not ( = ?auto_437234 ?auto_437240 ) ) ( not ( = ?auto_437234 ?auto_437241 ) ) ( not ( = ?auto_437234 ?auto_437242 ) ) ( not ( = ?auto_437234 ?auto_437243 ) ) ( not ( = ?auto_437234 ?auto_437244 ) ) ( not ( = ?auto_437234 ?auto_437245 ) ) ( not ( = ?auto_437234 ?auto_437246 ) ) ( not ( = ?auto_437235 ?auto_437236 ) ) ( not ( = ?auto_437235 ?auto_437237 ) ) ( not ( = ?auto_437235 ?auto_437238 ) ) ( not ( = ?auto_437235 ?auto_437239 ) ) ( not ( = ?auto_437235 ?auto_437240 ) ) ( not ( = ?auto_437235 ?auto_437241 ) ) ( not ( = ?auto_437235 ?auto_437242 ) ) ( not ( = ?auto_437235 ?auto_437243 ) ) ( not ( = ?auto_437235 ?auto_437244 ) ) ( not ( = ?auto_437235 ?auto_437245 ) ) ( not ( = ?auto_437235 ?auto_437246 ) ) ( not ( = ?auto_437236 ?auto_437237 ) ) ( not ( = ?auto_437236 ?auto_437238 ) ) ( not ( = ?auto_437236 ?auto_437239 ) ) ( not ( = ?auto_437236 ?auto_437240 ) ) ( not ( = ?auto_437236 ?auto_437241 ) ) ( not ( = ?auto_437236 ?auto_437242 ) ) ( not ( = ?auto_437236 ?auto_437243 ) ) ( not ( = ?auto_437236 ?auto_437244 ) ) ( not ( = ?auto_437236 ?auto_437245 ) ) ( not ( = ?auto_437236 ?auto_437246 ) ) ( not ( = ?auto_437237 ?auto_437238 ) ) ( not ( = ?auto_437237 ?auto_437239 ) ) ( not ( = ?auto_437237 ?auto_437240 ) ) ( not ( = ?auto_437237 ?auto_437241 ) ) ( not ( = ?auto_437237 ?auto_437242 ) ) ( not ( = ?auto_437237 ?auto_437243 ) ) ( not ( = ?auto_437237 ?auto_437244 ) ) ( not ( = ?auto_437237 ?auto_437245 ) ) ( not ( = ?auto_437237 ?auto_437246 ) ) ( not ( = ?auto_437238 ?auto_437239 ) ) ( not ( = ?auto_437238 ?auto_437240 ) ) ( not ( = ?auto_437238 ?auto_437241 ) ) ( not ( = ?auto_437238 ?auto_437242 ) ) ( not ( = ?auto_437238 ?auto_437243 ) ) ( not ( = ?auto_437238 ?auto_437244 ) ) ( not ( = ?auto_437238 ?auto_437245 ) ) ( not ( = ?auto_437238 ?auto_437246 ) ) ( not ( = ?auto_437239 ?auto_437240 ) ) ( not ( = ?auto_437239 ?auto_437241 ) ) ( not ( = ?auto_437239 ?auto_437242 ) ) ( not ( = ?auto_437239 ?auto_437243 ) ) ( not ( = ?auto_437239 ?auto_437244 ) ) ( not ( = ?auto_437239 ?auto_437245 ) ) ( not ( = ?auto_437239 ?auto_437246 ) ) ( not ( = ?auto_437240 ?auto_437241 ) ) ( not ( = ?auto_437240 ?auto_437242 ) ) ( not ( = ?auto_437240 ?auto_437243 ) ) ( not ( = ?auto_437240 ?auto_437244 ) ) ( not ( = ?auto_437240 ?auto_437245 ) ) ( not ( = ?auto_437240 ?auto_437246 ) ) ( not ( = ?auto_437241 ?auto_437242 ) ) ( not ( = ?auto_437241 ?auto_437243 ) ) ( not ( = ?auto_437241 ?auto_437244 ) ) ( not ( = ?auto_437241 ?auto_437245 ) ) ( not ( = ?auto_437241 ?auto_437246 ) ) ( not ( = ?auto_437242 ?auto_437243 ) ) ( not ( = ?auto_437242 ?auto_437244 ) ) ( not ( = ?auto_437242 ?auto_437245 ) ) ( not ( = ?auto_437242 ?auto_437246 ) ) ( not ( = ?auto_437243 ?auto_437244 ) ) ( not ( = ?auto_437243 ?auto_437245 ) ) ( not ( = ?auto_437243 ?auto_437246 ) ) ( not ( = ?auto_437244 ?auto_437245 ) ) ( not ( = ?auto_437244 ?auto_437246 ) ) ( not ( = ?auto_437245 ?auto_437246 ) ) ( ON ?auto_437244 ?auto_437245 ) ( CLEAR ?auto_437242 ) ( ON ?auto_437243 ?auto_437244 ) ( CLEAR ?auto_437243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_437232 ?auto_437233 ?auto_437234 ?auto_437235 ?auto_437236 ?auto_437237 ?auto_437238 ?auto_437239 ?auto_437240 ?auto_437241 ?auto_437242 ?auto_437243 )
      ( MAKE-14PILE ?auto_437232 ?auto_437233 ?auto_437234 ?auto_437235 ?auto_437236 ?auto_437237 ?auto_437238 ?auto_437239 ?auto_437240 ?auto_437241 ?auto_437242 ?auto_437243 ?auto_437244 ?auto_437245 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437261 - BLOCK
      ?auto_437262 - BLOCK
      ?auto_437263 - BLOCK
      ?auto_437264 - BLOCK
      ?auto_437265 - BLOCK
      ?auto_437266 - BLOCK
      ?auto_437267 - BLOCK
      ?auto_437268 - BLOCK
      ?auto_437269 - BLOCK
      ?auto_437270 - BLOCK
      ?auto_437271 - BLOCK
      ?auto_437272 - BLOCK
      ?auto_437273 - BLOCK
      ?auto_437274 - BLOCK
    )
    :vars
    (
      ?auto_437275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437274 ?auto_437275 ) ( ON-TABLE ?auto_437261 ) ( ON ?auto_437262 ?auto_437261 ) ( ON ?auto_437263 ?auto_437262 ) ( ON ?auto_437264 ?auto_437263 ) ( ON ?auto_437265 ?auto_437264 ) ( ON ?auto_437266 ?auto_437265 ) ( ON ?auto_437267 ?auto_437266 ) ( ON ?auto_437268 ?auto_437267 ) ( ON ?auto_437269 ?auto_437268 ) ( ON ?auto_437270 ?auto_437269 ) ( ON ?auto_437271 ?auto_437270 ) ( not ( = ?auto_437261 ?auto_437262 ) ) ( not ( = ?auto_437261 ?auto_437263 ) ) ( not ( = ?auto_437261 ?auto_437264 ) ) ( not ( = ?auto_437261 ?auto_437265 ) ) ( not ( = ?auto_437261 ?auto_437266 ) ) ( not ( = ?auto_437261 ?auto_437267 ) ) ( not ( = ?auto_437261 ?auto_437268 ) ) ( not ( = ?auto_437261 ?auto_437269 ) ) ( not ( = ?auto_437261 ?auto_437270 ) ) ( not ( = ?auto_437261 ?auto_437271 ) ) ( not ( = ?auto_437261 ?auto_437272 ) ) ( not ( = ?auto_437261 ?auto_437273 ) ) ( not ( = ?auto_437261 ?auto_437274 ) ) ( not ( = ?auto_437261 ?auto_437275 ) ) ( not ( = ?auto_437262 ?auto_437263 ) ) ( not ( = ?auto_437262 ?auto_437264 ) ) ( not ( = ?auto_437262 ?auto_437265 ) ) ( not ( = ?auto_437262 ?auto_437266 ) ) ( not ( = ?auto_437262 ?auto_437267 ) ) ( not ( = ?auto_437262 ?auto_437268 ) ) ( not ( = ?auto_437262 ?auto_437269 ) ) ( not ( = ?auto_437262 ?auto_437270 ) ) ( not ( = ?auto_437262 ?auto_437271 ) ) ( not ( = ?auto_437262 ?auto_437272 ) ) ( not ( = ?auto_437262 ?auto_437273 ) ) ( not ( = ?auto_437262 ?auto_437274 ) ) ( not ( = ?auto_437262 ?auto_437275 ) ) ( not ( = ?auto_437263 ?auto_437264 ) ) ( not ( = ?auto_437263 ?auto_437265 ) ) ( not ( = ?auto_437263 ?auto_437266 ) ) ( not ( = ?auto_437263 ?auto_437267 ) ) ( not ( = ?auto_437263 ?auto_437268 ) ) ( not ( = ?auto_437263 ?auto_437269 ) ) ( not ( = ?auto_437263 ?auto_437270 ) ) ( not ( = ?auto_437263 ?auto_437271 ) ) ( not ( = ?auto_437263 ?auto_437272 ) ) ( not ( = ?auto_437263 ?auto_437273 ) ) ( not ( = ?auto_437263 ?auto_437274 ) ) ( not ( = ?auto_437263 ?auto_437275 ) ) ( not ( = ?auto_437264 ?auto_437265 ) ) ( not ( = ?auto_437264 ?auto_437266 ) ) ( not ( = ?auto_437264 ?auto_437267 ) ) ( not ( = ?auto_437264 ?auto_437268 ) ) ( not ( = ?auto_437264 ?auto_437269 ) ) ( not ( = ?auto_437264 ?auto_437270 ) ) ( not ( = ?auto_437264 ?auto_437271 ) ) ( not ( = ?auto_437264 ?auto_437272 ) ) ( not ( = ?auto_437264 ?auto_437273 ) ) ( not ( = ?auto_437264 ?auto_437274 ) ) ( not ( = ?auto_437264 ?auto_437275 ) ) ( not ( = ?auto_437265 ?auto_437266 ) ) ( not ( = ?auto_437265 ?auto_437267 ) ) ( not ( = ?auto_437265 ?auto_437268 ) ) ( not ( = ?auto_437265 ?auto_437269 ) ) ( not ( = ?auto_437265 ?auto_437270 ) ) ( not ( = ?auto_437265 ?auto_437271 ) ) ( not ( = ?auto_437265 ?auto_437272 ) ) ( not ( = ?auto_437265 ?auto_437273 ) ) ( not ( = ?auto_437265 ?auto_437274 ) ) ( not ( = ?auto_437265 ?auto_437275 ) ) ( not ( = ?auto_437266 ?auto_437267 ) ) ( not ( = ?auto_437266 ?auto_437268 ) ) ( not ( = ?auto_437266 ?auto_437269 ) ) ( not ( = ?auto_437266 ?auto_437270 ) ) ( not ( = ?auto_437266 ?auto_437271 ) ) ( not ( = ?auto_437266 ?auto_437272 ) ) ( not ( = ?auto_437266 ?auto_437273 ) ) ( not ( = ?auto_437266 ?auto_437274 ) ) ( not ( = ?auto_437266 ?auto_437275 ) ) ( not ( = ?auto_437267 ?auto_437268 ) ) ( not ( = ?auto_437267 ?auto_437269 ) ) ( not ( = ?auto_437267 ?auto_437270 ) ) ( not ( = ?auto_437267 ?auto_437271 ) ) ( not ( = ?auto_437267 ?auto_437272 ) ) ( not ( = ?auto_437267 ?auto_437273 ) ) ( not ( = ?auto_437267 ?auto_437274 ) ) ( not ( = ?auto_437267 ?auto_437275 ) ) ( not ( = ?auto_437268 ?auto_437269 ) ) ( not ( = ?auto_437268 ?auto_437270 ) ) ( not ( = ?auto_437268 ?auto_437271 ) ) ( not ( = ?auto_437268 ?auto_437272 ) ) ( not ( = ?auto_437268 ?auto_437273 ) ) ( not ( = ?auto_437268 ?auto_437274 ) ) ( not ( = ?auto_437268 ?auto_437275 ) ) ( not ( = ?auto_437269 ?auto_437270 ) ) ( not ( = ?auto_437269 ?auto_437271 ) ) ( not ( = ?auto_437269 ?auto_437272 ) ) ( not ( = ?auto_437269 ?auto_437273 ) ) ( not ( = ?auto_437269 ?auto_437274 ) ) ( not ( = ?auto_437269 ?auto_437275 ) ) ( not ( = ?auto_437270 ?auto_437271 ) ) ( not ( = ?auto_437270 ?auto_437272 ) ) ( not ( = ?auto_437270 ?auto_437273 ) ) ( not ( = ?auto_437270 ?auto_437274 ) ) ( not ( = ?auto_437270 ?auto_437275 ) ) ( not ( = ?auto_437271 ?auto_437272 ) ) ( not ( = ?auto_437271 ?auto_437273 ) ) ( not ( = ?auto_437271 ?auto_437274 ) ) ( not ( = ?auto_437271 ?auto_437275 ) ) ( not ( = ?auto_437272 ?auto_437273 ) ) ( not ( = ?auto_437272 ?auto_437274 ) ) ( not ( = ?auto_437272 ?auto_437275 ) ) ( not ( = ?auto_437273 ?auto_437274 ) ) ( not ( = ?auto_437273 ?auto_437275 ) ) ( not ( = ?auto_437274 ?auto_437275 ) ) ( ON ?auto_437273 ?auto_437274 ) ( CLEAR ?auto_437271 ) ( ON ?auto_437272 ?auto_437273 ) ( CLEAR ?auto_437272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_437261 ?auto_437262 ?auto_437263 ?auto_437264 ?auto_437265 ?auto_437266 ?auto_437267 ?auto_437268 ?auto_437269 ?auto_437270 ?auto_437271 ?auto_437272 )
      ( MAKE-14PILE ?auto_437261 ?auto_437262 ?auto_437263 ?auto_437264 ?auto_437265 ?auto_437266 ?auto_437267 ?auto_437268 ?auto_437269 ?auto_437270 ?auto_437271 ?auto_437272 ?auto_437273 ?auto_437274 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437290 - BLOCK
      ?auto_437291 - BLOCK
      ?auto_437292 - BLOCK
      ?auto_437293 - BLOCK
      ?auto_437294 - BLOCK
      ?auto_437295 - BLOCK
      ?auto_437296 - BLOCK
      ?auto_437297 - BLOCK
      ?auto_437298 - BLOCK
      ?auto_437299 - BLOCK
      ?auto_437300 - BLOCK
      ?auto_437301 - BLOCK
      ?auto_437302 - BLOCK
      ?auto_437303 - BLOCK
    )
    :vars
    (
      ?auto_437304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437303 ?auto_437304 ) ( ON-TABLE ?auto_437290 ) ( ON ?auto_437291 ?auto_437290 ) ( ON ?auto_437292 ?auto_437291 ) ( ON ?auto_437293 ?auto_437292 ) ( ON ?auto_437294 ?auto_437293 ) ( ON ?auto_437295 ?auto_437294 ) ( ON ?auto_437296 ?auto_437295 ) ( ON ?auto_437297 ?auto_437296 ) ( ON ?auto_437298 ?auto_437297 ) ( ON ?auto_437299 ?auto_437298 ) ( not ( = ?auto_437290 ?auto_437291 ) ) ( not ( = ?auto_437290 ?auto_437292 ) ) ( not ( = ?auto_437290 ?auto_437293 ) ) ( not ( = ?auto_437290 ?auto_437294 ) ) ( not ( = ?auto_437290 ?auto_437295 ) ) ( not ( = ?auto_437290 ?auto_437296 ) ) ( not ( = ?auto_437290 ?auto_437297 ) ) ( not ( = ?auto_437290 ?auto_437298 ) ) ( not ( = ?auto_437290 ?auto_437299 ) ) ( not ( = ?auto_437290 ?auto_437300 ) ) ( not ( = ?auto_437290 ?auto_437301 ) ) ( not ( = ?auto_437290 ?auto_437302 ) ) ( not ( = ?auto_437290 ?auto_437303 ) ) ( not ( = ?auto_437290 ?auto_437304 ) ) ( not ( = ?auto_437291 ?auto_437292 ) ) ( not ( = ?auto_437291 ?auto_437293 ) ) ( not ( = ?auto_437291 ?auto_437294 ) ) ( not ( = ?auto_437291 ?auto_437295 ) ) ( not ( = ?auto_437291 ?auto_437296 ) ) ( not ( = ?auto_437291 ?auto_437297 ) ) ( not ( = ?auto_437291 ?auto_437298 ) ) ( not ( = ?auto_437291 ?auto_437299 ) ) ( not ( = ?auto_437291 ?auto_437300 ) ) ( not ( = ?auto_437291 ?auto_437301 ) ) ( not ( = ?auto_437291 ?auto_437302 ) ) ( not ( = ?auto_437291 ?auto_437303 ) ) ( not ( = ?auto_437291 ?auto_437304 ) ) ( not ( = ?auto_437292 ?auto_437293 ) ) ( not ( = ?auto_437292 ?auto_437294 ) ) ( not ( = ?auto_437292 ?auto_437295 ) ) ( not ( = ?auto_437292 ?auto_437296 ) ) ( not ( = ?auto_437292 ?auto_437297 ) ) ( not ( = ?auto_437292 ?auto_437298 ) ) ( not ( = ?auto_437292 ?auto_437299 ) ) ( not ( = ?auto_437292 ?auto_437300 ) ) ( not ( = ?auto_437292 ?auto_437301 ) ) ( not ( = ?auto_437292 ?auto_437302 ) ) ( not ( = ?auto_437292 ?auto_437303 ) ) ( not ( = ?auto_437292 ?auto_437304 ) ) ( not ( = ?auto_437293 ?auto_437294 ) ) ( not ( = ?auto_437293 ?auto_437295 ) ) ( not ( = ?auto_437293 ?auto_437296 ) ) ( not ( = ?auto_437293 ?auto_437297 ) ) ( not ( = ?auto_437293 ?auto_437298 ) ) ( not ( = ?auto_437293 ?auto_437299 ) ) ( not ( = ?auto_437293 ?auto_437300 ) ) ( not ( = ?auto_437293 ?auto_437301 ) ) ( not ( = ?auto_437293 ?auto_437302 ) ) ( not ( = ?auto_437293 ?auto_437303 ) ) ( not ( = ?auto_437293 ?auto_437304 ) ) ( not ( = ?auto_437294 ?auto_437295 ) ) ( not ( = ?auto_437294 ?auto_437296 ) ) ( not ( = ?auto_437294 ?auto_437297 ) ) ( not ( = ?auto_437294 ?auto_437298 ) ) ( not ( = ?auto_437294 ?auto_437299 ) ) ( not ( = ?auto_437294 ?auto_437300 ) ) ( not ( = ?auto_437294 ?auto_437301 ) ) ( not ( = ?auto_437294 ?auto_437302 ) ) ( not ( = ?auto_437294 ?auto_437303 ) ) ( not ( = ?auto_437294 ?auto_437304 ) ) ( not ( = ?auto_437295 ?auto_437296 ) ) ( not ( = ?auto_437295 ?auto_437297 ) ) ( not ( = ?auto_437295 ?auto_437298 ) ) ( not ( = ?auto_437295 ?auto_437299 ) ) ( not ( = ?auto_437295 ?auto_437300 ) ) ( not ( = ?auto_437295 ?auto_437301 ) ) ( not ( = ?auto_437295 ?auto_437302 ) ) ( not ( = ?auto_437295 ?auto_437303 ) ) ( not ( = ?auto_437295 ?auto_437304 ) ) ( not ( = ?auto_437296 ?auto_437297 ) ) ( not ( = ?auto_437296 ?auto_437298 ) ) ( not ( = ?auto_437296 ?auto_437299 ) ) ( not ( = ?auto_437296 ?auto_437300 ) ) ( not ( = ?auto_437296 ?auto_437301 ) ) ( not ( = ?auto_437296 ?auto_437302 ) ) ( not ( = ?auto_437296 ?auto_437303 ) ) ( not ( = ?auto_437296 ?auto_437304 ) ) ( not ( = ?auto_437297 ?auto_437298 ) ) ( not ( = ?auto_437297 ?auto_437299 ) ) ( not ( = ?auto_437297 ?auto_437300 ) ) ( not ( = ?auto_437297 ?auto_437301 ) ) ( not ( = ?auto_437297 ?auto_437302 ) ) ( not ( = ?auto_437297 ?auto_437303 ) ) ( not ( = ?auto_437297 ?auto_437304 ) ) ( not ( = ?auto_437298 ?auto_437299 ) ) ( not ( = ?auto_437298 ?auto_437300 ) ) ( not ( = ?auto_437298 ?auto_437301 ) ) ( not ( = ?auto_437298 ?auto_437302 ) ) ( not ( = ?auto_437298 ?auto_437303 ) ) ( not ( = ?auto_437298 ?auto_437304 ) ) ( not ( = ?auto_437299 ?auto_437300 ) ) ( not ( = ?auto_437299 ?auto_437301 ) ) ( not ( = ?auto_437299 ?auto_437302 ) ) ( not ( = ?auto_437299 ?auto_437303 ) ) ( not ( = ?auto_437299 ?auto_437304 ) ) ( not ( = ?auto_437300 ?auto_437301 ) ) ( not ( = ?auto_437300 ?auto_437302 ) ) ( not ( = ?auto_437300 ?auto_437303 ) ) ( not ( = ?auto_437300 ?auto_437304 ) ) ( not ( = ?auto_437301 ?auto_437302 ) ) ( not ( = ?auto_437301 ?auto_437303 ) ) ( not ( = ?auto_437301 ?auto_437304 ) ) ( not ( = ?auto_437302 ?auto_437303 ) ) ( not ( = ?auto_437302 ?auto_437304 ) ) ( not ( = ?auto_437303 ?auto_437304 ) ) ( ON ?auto_437302 ?auto_437303 ) ( ON ?auto_437301 ?auto_437302 ) ( CLEAR ?auto_437299 ) ( ON ?auto_437300 ?auto_437301 ) ( CLEAR ?auto_437300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_437290 ?auto_437291 ?auto_437292 ?auto_437293 ?auto_437294 ?auto_437295 ?auto_437296 ?auto_437297 ?auto_437298 ?auto_437299 ?auto_437300 )
      ( MAKE-14PILE ?auto_437290 ?auto_437291 ?auto_437292 ?auto_437293 ?auto_437294 ?auto_437295 ?auto_437296 ?auto_437297 ?auto_437298 ?auto_437299 ?auto_437300 ?auto_437301 ?auto_437302 ?auto_437303 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437319 - BLOCK
      ?auto_437320 - BLOCK
      ?auto_437321 - BLOCK
      ?auto_437322 - BLOCK
      ?auto_437323 - BLOCK
      ?auto_437324 - BLOCK
      ?auto_437325 - BLOCK
      ?auto_437326 - BLOCK
      ?auto_437327 - BLOCK
      ?auto_437328 - BLOCK
      ?auto_437329 - BLOCK
      ?auto_437330 - BLOCK
      ?auto_437331 - BLOCK
      ?auto_437332 - BLOCK
    )
    :vars
    (
      ?auto_437333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437332 ?auto_437333 ) ( ON-TABLE ?auto_437319 ) ( ON ?auto_437320 ?auto_437319 ) ( ON ?auto_437321 ?auto_437320 ) ( ON ?auto_437322 ?auto_437321 ) ( ON ?auto_437323 ?auto_437322 ) ( ON ?auto_437324 ?auto_437323 ) ( ON ?auto_437325 ?auto_437324 ) ( ON ?auto_437326 ?auto_437325 ) ( ON ?auto_437327 ?auto_437326 ) ( ON ?auto_437328 ?auto_437327 ) ( not ( = ?auto_437319 ?auto_437320 ) ) ( not ( = ?auto_437319 ?auto_437321 ) ) ( not ( = ?auto_437319 ?auto_437322 ) ) ( not ( = ?auto_437319 ?auto_437323 ) ) ( not ( = ?auto_437319 ?auto_437324 ) ) ( not ( = ?auto_437319 ?auto_437325 ) ) ( not ( = ?auto_437319 ?auto_437326 ) ) ( not ( = ?auto_437319 ?auto_437327 ) ) ( not ( = ?auto_437319 ?auto_437328 ) ) ( not ( = ?auto_437319 ?auto_437329 ) ) ( not ( = ?auto_437319 ?auto_437330 ) ) ( not ( = ?auto_437319 ?auto_437331 ) ) ( not ( = ?auto_437319 ?auto_437332 ) ) ( not ( = ?auto_437319 ?auto_437333 ) ) ( not ( = ?auto_437320 ?auto_437321 ) ) ( not ( = ?auto_437320 ?auto_437322 ) ) ( not ( = ?auto_437320 ?auto_437323 ) ) ( not ( = ?auto_437320 ?auto_437324 ) ) ( not ( = ?auto_437320 ?auto_437325 ) ) ( not ( = ?auto_437320 ?auto_437326 ) ) ( not ( = ?auto_437320 ?auto_437327 ) ) ( not ( = ?auto_437320 ?auto_437328 ) ) ( not ( = ?auto_437320 ?auto_437329 ) ) ( not ( = ?auto_437320 ?auto_437330 ) ) ( not ( = ?auto_437320 ?auto_437331 ) ) ( not ( = ?auto_437320 ?auto_437332 ) ) ( not ( = ?auto_437320 ?auto_437333 ) ) ( not ( = ?auto_437321 ?auto_437322 ) ) ( not ( = ?auto_437321 ?auto_437323 ) ) ( not ( = ?auto_437321 ?auto_437324 ) ) ( not ( = ?auto_437321 ?auto_437325 ) ) ( not ( = ?auto_437321 ?auto_437326 ) ) ( not ( = ?auto_437321 ?auto_437327 ) ) ( not ( = ?auto_437321 ?auto_437328 ) ) ( not ( = ?auto_437321 ?auto_437329 ) ) ( not ( = ?auto_437321 ?auto_437330 ) ) ( not ( = ?auto_437321 ?auto_437331 ) ) ( not ( = ?auto_437321 ?auto_437332 ) ) ( not ( = ?auto_437321 ?auto_437333 ) ) ( not ( = ?auto_437322 ?auto_437323 ) ) ( not ( = ?auto_437322 ?auto_437324 ) ) ( not ( = ?auto_437322 ?auto_437325 ) ) ( not ( = ?auto_437322 ?auto_437326 ) ) ( not ( = ?auto_437322 ?auto_437327 ) ) ( not ( = ?auto_437322 ?auto_437328 ) ) ( not ( = ?auto_437322 ?auto_437329 ) ) ( not ( = ?auto_437322 ?auto_437330 ) ) ( not ( = ?auto_437322 ?auto_437331 ) ) ( not ( = ?auto_437322 ?auto_437332 ) ) ( not ( = ?auto_437322 ?auto_437333 ) ) ( not ( = ?auto_437323 ?auto_437324 ) ) ( not ( = ?auto_437323 ?auto_437325 ) ) ( not ( = ?auto_437323 ?auto_437326 ) ) ( not ( = ?auto_437323 ?auto_437327 ) ) ( not ( = ?auto_437323 ?auto_437328 ) ) ( not ( = ?auto_437323 ?auto_437329 ) ) ( not ( = ?auto_437323 ?auto_437330 ) ) ( not ( = ?auto_437323 ?auto_437331 ) ) ( not ( = ?auto_437323 ?auto_437332 ) ) ( not ( = ?auto_437323 ?auto_437333 ) ) ( not ( = ?auto_437324 ?auto_437325 ) ) ( not ( = ?auto_437324 ?auto_437326 ) ) ( not ( = ?auto_437324 ?auto_437327 ) ) ( not ( = ?auto_437324 ?auto_437328 ) ) ( not ( = ?auto_437324 ?auto_437329 ) ) ( not ( = ?auto_437324 ?auto_437330 ) ) ( not ( = ?auto_437324 ?auto_437331 ) ) ( not ( = ?auto_437324 ?auto_437332 ) ) ( not ( = ?auto_437324 ?auto_437333 ) ) ( not ( = ?auto_437325 ?auto_437326 ) ) ( not ( = ?auto_437325 ?auto_437327 ) ) ( not ( = ?auto_437325 ?auto_437328 ) ) ( not ( = ?auto_437325 ?auto_437329 ) ) ( not ( = ?auto_437325 ?auto_437330 ) ) ( not ( = ?auto_437325 ?auto_437331 ) ) ( not ( = ?auto_437325 ?auto_437332 ) ) ( not ( = ?auto_437325 ?auto_437333 ) ) ( not ( = ?auto_437326 ?auto_437327 ) ) ( not ( = ?auto_437326 ?auto_437328 ) ) ( not ( = ?auto_437326 ?auto_437329 ) ) ( not ( = ?auto_437326 ?auto_437330 ) ) ( not ( = ?auto_437326 ?auto_437331 ) ) ( not ( = ?auto_437326 ?auto_437332 ) ) ( not ( = ?auto_437326 ?auto_437333 ) ) ( not ( = ?auto_437327 ?auto_437328 ) ) ( not ( = ?auto_437327 ?auto_437329 ) ) ( not ( = ?auto_437327 ?auto_437330 ) ) ( not ( = ?auto_437327 ?auto_437331 ) ) ( not ( = ?auto_437327 ?auto_437332 ) ) ( not ( = ?auto_437327 ?auto_437333 ) ) ( not ( = ?auto_437328 ?auto_437329 ) ) ( not ( = ?auto_437328 ?auto_437330 ) ) ( not ( = ?auto_437328 ?auto_437331 ) ) ( not ( = ?auto_437328 ?auto_437332 ) ) ( not ( = ?auto_437328 ?auto_437333 ) ) ( not ( = ?auto_437329 ?auto_437330 ) ) ( not ( = ?auto_437329 ?auto_437331 ) ) ( not ( = ?auto_437329 ?auto_437332 ) ) ( not ( = ?auto_437329 ?auto_437333 ) ) ( not ( = ?auto_437330 ?auto_437331 ) ) ( not ( = ?auto_437330 ?auto_437332 ) ) ( not ( = ?auto_437330 ?auto_437333 ) ) ( not ( = ?auto_437331 ?auto_437332 ) ) ( not ( = ?auto_437331 ?auto_437333 ) ) ( not ( = ?auto_437332 ?auto_437333 ) ) ( ON ?auto_437331 ?auto_437332 ) ( ON ?auto_437330 ?auto_437331 ) ( CLEAR ?auto_437328 ) ( ON ?auto_437329 ?auto_437330 ) ( CLEAR ?auto_437329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_437319 ?auto_437320 ?auto_437321 ?auto_437322 ?auto_437323 ?auto_437324 ?auto_437325 ?auto_437326 ?auto_437327 ?auto_437328 ?auto_437329 )
      ( MAKE-14PILE ?auto_437319 ?auto_437320 ?auto_437321 ?auto_437322 ?auto_437323 ?auto_437324 ?auto_437325 ?auto_437326 ?auto_437327 ?auto_437328 ?auto_437329 ?auto_437330 ?auto_437331 ?auto_437332 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437348 - BLOCK
      ?auto_437349 - BLOCK
      ?auto_437350 - BLOCK
      ?auto_437351 - BLOCK
      ?auto_437352 - BLOCK
      ?auto_437353 - BLOCK
      ?auto_437354 - BLOCK
      ?auto_437355 - BLOCK
      ?auto_437356 - BLOCK
      ?auto_437357 - BLOCK
      ?auto_437358 - BLOCK
      ?auto_437359 - BLOCK
      ?auto_437360 - BLOCK
      ?auto_437361 - BLOCK
    )
    :vars
    (
      ?auto_437362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437361 ?auto_437362 ) ( ON-TABLE ?auto_437348 ) ( ON ?auto_437349 ?auto_437348 ) ( ON ?auto_437350 ?auto_437349 ) ( ON ?auto_437351 ?auto_437350 ) ( ON ?auto_437352 ?auto_437351 ) ( ON ?auto_437353 ?auto_437352 ) ( ON ?auto_437354 ?auto_437353 ) ( ON ?auto_437355 ?auto_437354 ) ( ON ?auto_437356 ?auto_437355 ) ( not ( = ?auto_437348 ?auto_437349 ) ) ( not ( = ?auto_437348 ?auto_437350 ) ) ( not ( = ?auto_437348 ?auto_437351 ) ) ( not ( = ?auto_437348 ?auto_437352 ) ) ( not ( = ?auto_437348 ?auto_437353 ) ) ( not ( = ?auto_437348 ?auto_437354 ) ) ( not ( = ?auto_437348 ?auto_437355 ) ) ( not ( = ?auto_437348 ?auto_437356 ) ) ( not ( = ?auto_437348 ?auto_437357 ) ) ( not ( = ?auto_437348 ?auto_437358 ) ) ( not ( = ?auto_437348 ?auto_437359 ) ) ( not ( = ?auto_437348 ?auto_437360 ) ) ( not ( = ?auto_437348 ?auto_437361 ) ) ( not ( = ?auto_437348 ?auto_437362 ) ) ( not ( = ?auto_437349 ?auto_437350 ) ) ( not ( = ?auto_437349 ?auto_437351 ) ) ( not ( = ?auto_437349 ?auto_437352 ) ) ( not ( = ?auto_437349 ?auto_437353 ) ) ( not ( = ?auto_437349 ?auto_437354 ) ) ( not ( = ?auto_437349 ?auto_437355 ) ) ( not ( = ?auto_437349 ?auto_437356 ) ) ( not ( = ?auto_437349 ?auto_437357 ) ) ( not ( = ?auto_437349 ?auto_437358 ) ) ( not ( = ?auto_437349 ?auto_437359 ) ) ( not ( = ?auto_437349 ?auto_437360 ) ) ( not ( = ?auto_437349 ?auto_437361 ) ) ( not ( = ?auto_437349 ?auto_437362 ) ) ( not ( = ?auto_437350 ?auto_437351 ) ) ( not ( = ?auto_437350 ?auto_437352 ) ) ( not ( = ?auto_437350 ?auto_437353 ) ) ( not ( = ?auto_437350 ?auto_437354 ) ) ( not ( = ?auto_437350 ?auto_437355 ) ) ( not ( = ?auto_437350 ?auto_437356 ) ) ( not ( = ?auto_437350 ?auto_437357 ) ) ( not ( = ?auto_437350 ?auto_437358 ) ) ( not ( = ?auto_437350 ?auto_437359 ) ) ( not ( = ?auto_437350 ?auto_437360 ) ) ( not ( = ?auto_437350 ?auto_437361 ) ) ( not ( = ?auto_437350 ?auto_437362 ) ) ( not ( = ?auto_437351 ?auto_437352 ) ) ( not ( = ?auto_437351 ?auto_437353 ) ) ( not ( = ?auto_437351 ?auto_437354 ) ) ( not ( = ?auto_437351 ?auto_437355 ) ) ( not ( = ?auto_437351 ?auto_437356 ) ) ( not ( = ?auto_437351 ?auto_437357 ) ) ( not ( = ?auto_437351 ?auto_437358 ) ) ( not ( = ?auto_437351 ?auto_437359 ) ) ( not ( = ?auto_437351 ?auto_437360 ) ) ( not ( = ?auto_437351 ?auto_437361 ) ) ( not ( = ?auto_437351 ?auto_437362 ) ) ( not ( = ?auto_437352 ?auto_437353 ) ) ( not ( = ?auto_437352 ?auto_437354 ) ) ( not ( = ?auto_437352 ?auto_437355 ) ) ( not ( = ?auto_437352 ?auto_437356 ) ) ( not ( = ?auto_437352 ?auto_437357 ) ) ( not ( = ?auto_437352 ?auto_437358 ) ) ( not ( = ?auto_437352 ?auto_437359 ) ) ( not ( = ?auto_437352 ?auto_437360 ) ) ( not ( = ?auto_437352 ?auto_437361 ) ) ( not ( = ?auto_437352 ?auto_437362 ) ) ( not ( = ?auto_437353 ?auto_437354 ) ) ( not ( = ?auto_437353 ?auto_437355 ) ) ( not ( = ?auto_437353 ?auto_437356 ) ) ( not ( = ?auto_437353 ?auto_437357 ) ) ( not ( = ?auto_437353 ?auto_437358 ) ) ( not ( = ?auto_437353 ?auto_437359 ) ) ( not ( = ?auto_437353 ?auto_437360 ) ) ( not ( = ?auto_437353 ?auto_437361 ) ) ( not ( = ?auto_437353 ?auto_437362 ) ) ( not ( = ?auto_437354 ?auto_437355 ) ) ( not ( = ?auto_437354 ?auto_437356 ) ) ( not ( = ?auto_437354 ?auto_437357 ) ) ( not ( = ?auto_437354 ?auto_437358 ) ) ( not ( = ?auto_437354 ?auto_437359 ) ) ( not ( = ?auto_437354 ?auto_437360 ) ) ( not ( = ?auto_437354 ?auto_437361 ) ) ( not ( = ?auto_437354 ?auto_437362 ) ) ( not ( = ?auto_437355 ?auto_437356 ) ) ( not ( = ?auto_437355 ?auto_437357 ) ) ( not ( = ?auto_437355 ?auto_437358 ) ) ( not ( = ?auto_437355 ?auto_437359 ) ) ( not ( = ?auto_437355 ?auto_437360 ) ) ( not ( = ?auto_437355 ?auto_437361 ) ) ( not ( = ?auto_437355 ?auto_437362 ) ) ( not ( = ?auto_437356 ?auto_437357 ) ) ( not ( = ?auto_437356 ?auto_437358 ) ) ( not ( = ?auto_437356 ?auto_437359 ) ) ( not ( = ?auto_437356 ?auto_437360 ) ) ( not ( = ?auto_437356 ?auto_437361 ) ) ( not ( = ?auto_437356 ?auto_437362 ) ) ( not ( = ?auto_437357 ?auto_437358 ) ) ( not ( = ?auto_437357 ?auto_437359 ) ) ( not ( = ?auto_437357 ?auto_437360 ) ) ( not ( = ?auto_437357 ?auto_437361 ) ) ( not ( = ?auto_437357 ?auto_437362 ) ) ( not ( = ?auto_437358 ?auto_437359 ) ) ( not ( = ?auto_437358 ?auto_437360 ) ) ( not ( = ?auto_437358 ?auto_437361 ) ) ( not ( = ?auto_437358 ?auto_437362 ) ) ( not ( = ?auto_437359 ?auto_437360 ) ) ( not ( = ?auto_437359 ?auto_437361 ) ) ( not ( = ?auto_437359 ?auto_437362 ) ) ( not ( = ?auto_437360 ?auto_437361 ) ) ( not ( = ?auto_437360 ?auto_437362 ) ) ( not ( = ?auto_437361 ?auto_437362 ) ) ( ON ?auto_437360 ?auto_437361 ) ( ON ?auto_437359 ?auto_437360 ) ( ON ?auto_437358 ?auto_437359 ) ( CLEAR ?auto_437356 ) ( ON ?auto_437357 ?auto_437358 ) ( CLEAR ?auto_437357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_437348 ?auto_437349 ?auto_437350 ?auto_437351 ?auto_437352 ?auto_437353 ?auto_437354 ?auto_437355 ?auto_437356 ?auto_437357 )
      ( MAKE-14PILE ?auto_437348 ?auto_437349 ?auto_437350 ?auto_437351 ?auto_437352 ?auto_437353 ?auto_437354 ?auto_437355 ?auto_437356 ?auto_437357 ?auto_437358 ?auto_437359 ?auto_437360 ?auto_437361 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437377 - BLOCK
      ?auto_437378 - BLOCK
      ?auto_437379 - BLOCK
      ?auto_437380 - BLOCK
      ?auto_437381 - BLOCK
      ?auto_437382 - BLOCK
      ?auto_437383 - BLOCK
      ?auto_437384 - BLOCK
      ?auto_437385 - BLOCK
      ?auto_437386 - BLOCK
      ?auto_437387 - BLOCK
      ?auto_437388 - BLOCK
      ?auto_437389 - BLOCK
      ?auto_437390 - BLOCK
    )
    :vars
    (
      ?auto_437391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437390 ?auto_437391 ) ( ON-TABLE ?auto_437377 ) ( ON ?auto_437378 ?auto_437377 ) ( ON ?auto_437379 ?auto_437378 ) ( ON ?auto_437380 ?auto_437379 ) ( ON ?auto_437381 ?auto_437380 ) ( ON ?auto_437382 ?auto_437381 ) ( ON ?auto_437383 ?auto_437382 ) ( ON ?auto_437384 ?auto_437383 ) ( ON ?auto_437385 ?auto_437384 ) ( not ( = ?auto_437377 ?auto_437378 ) ) ( not ( = ?auto_437377 ?auto_437379 ) ) ( not ( = ?auto_437377 ?auto_437380 ) ) ( not ( = ?auto_437377 ?auto_437381 ) ) ( not ( = ?auto_437377 ?auto_437382 ) ) ( not ( = ?auto_437377 ?auto_437383 ) ) ( not ( = ?auto_437377 ?auto_437384 ) ) ( not ( = ?auto_437377 ?auto_437385 ) ) ( not ( = ?auto_437377 ?auto_437386 ) ) ( not ( = ?auto_437377 ?auto_437387 ) ) ( not ( = ?auto_437377 ?auto_437388 ) ) ( not ( = ?auto_437377 ?auto_437389 ) ) ( not ( = ?auto_437377 ?auto_437390 ) ) ( not ( = ?auto_437377 ?auto_437391 ) ) ( not ( = ?auto_437378 ?auto_437379 ) ) ( not ( = ?auto_437378 ?auto_437380 ) ) ( not ( = ?auto_437378 ?auto_437381 ) ) ( not ( = ?auto_437378 ?auto_437382 ) ) ( not ( = ?auto_437378 ?auto_437383 ) ) ( not ( = ?auto_437378 ?auto_437384 ) ) ( not ( = ?auto_437378 ?auto_437385 ) ) ( not ( = ?auto_437378 ?auto_437386 ) ) ( not ( = ?auto_437378 ?auto_437387 ) ) ( not ( = ?auto_437378 ?auto_437388 ) ) ( not ( = ?auto_437378 ?auto_437389 ) ) ( not ( = ?auto_437378 ?auto_437390 ) ) ( not ( = ?auto_437378 ?auto_437391 ) ) ( not ( = ?auto_437379 ?auto_437380 ) ) ( not ( = ?auto_437379 ?auto_437381 ) ) ( not ( = ?auto_437379 ?auto_437382 ) ) ( not ( = ?auto_437379 ?auto_437383 ) ) ( not ( = ?auto_437379 ?auto_437384 ) ) ( not ( = ?auto_437379 ?auto_437385 ) ) ( not ( = ?auto_437379 ?auto_437386 ) ) ( not ( = ?auto_437379 ?auto_437387 ) ) ( not ( = ?auto_437379 ?auto_437388 ) ) ( not ( = ?auto_437379 ?auto_437389 ) ) ( not ( = ?auto_437379 ?auto_437390 ) ) ( not ( = ?auto_437379 ?auto_437391 ) ) ( not ( = ?auto_437380 ?auto_437381 ) ) ( not ( = ?auto_437380 ?auto_437382 ) ) ( not ( = ?auto_437380 ?auto_437383 ) ) ( not ( = ?auto_437380 ?auto_437384 ) ) ( not ( = ?auto_437380 ?auto_437385 ) ) ( not ( = ?auto_437380 ?auto_437386 ) ) ( not ( = ?auto_437380 ?auto_437387 ) ) ( not ( = ?auto_437380 ?auto_437388 ) ) ( not ( = ?auto_437380 ?auto_437389 ) ) ( not ( = ?auto_437380 ?auto_437390 ) ) ( not ( = ?auto_437380 ?auto_437391 ) ) ( not ( = ?auto_437381 ?auto_437382 ) ) ( not ( = ?auto_437381 ?auto_437383 ) ) ( not ( = ?auto_437381 ?auto_437384 ) ) ( not ( = ?auto_437381 ?auto_437385 ) ) ( not ( = ?auto_437381 ?auto_437386 ) ) ( not ( = ?auto_437381 ?auto_437387 ) ) ( not ( = ?auto_437381 ?auto_437388 ) ) ( not ( = ?auto_437381 ?auto_437389 ) ) ( not ( = ?auto_437381 ?auto_437390 ) ) ( not ( = ?auto_437381 ?auto_437391 ) ) ( not ( = ?auto_437382 ?auto_437383 ) ) ( not ( = ?auto_437382 ?auto_437384 ) ) ( not ( = ?auto_437382 ?auto_437385 ) ) ( not ( = ?auto_437382 ?auto_437386 ) ) ( not ( = ?auto_437382 ?auto_437387 ) ) ( not ( = ?auto_437382 ?auto_437388 ) ) ( not ( = ?auto_437382 ?auto_437389 ) ) ( not ( = ?auto_437382 ?auto_437390 ) ) ( not ( = ?auto_437382 ?auto_437391 ) ) ( not ( = ?auto_437383 ?auto_437384 ) ) ( not ( = ?auto_437383 ?auto_437385 ) ) ( not ( = ?auto_437383 ?auto_437386 ) ) ( not ( = ?auto_437383 ?auto_437387 ) ) ( not ( = ?auto_437383 ?auto_437388 ) ) ( not ( = ?auto_437383 ?auto_437389 ) ) ( not ( = ?auto_437383 ?auto_437390 ) ) ( not ( = ?auto_437383 ?auto_437391 ) ) ( not ( = ?auto_437384 ?auto_437385 ) ) ( not ( = ?auto_437384 ?auto_437386 ) ) ( not ( = ?auto_437384 ?auto_437387 ) ) ( not ( = ?auto_437384 ?auto_437388 ) ) ( not ( = ?auto_437384 ?auto_437389 ) ) ( not ( = ?auto_437384 ?auto_437390 ) ) ( not ( = ?auto_437384 ?auto_437391 ) ) ( not ( = ?auto_437385 ?auto_437386 ) ) ( not ( = ?auto_437385 ?auto_437387 ) ) ( not ( = ?auto_437385 ?auto_437388 ) ) ( not ( = ?auto_437385 ?auto_437389 ) ) ( not ( = ?auto_437385 ?auto_437390 ) ) ( not ( = ?auto_437385 ?auto_437391 ) ) ( not ( = ?auto_437386 ?auto_437387 ) ) ( not ( = ?auto_437386 ?auto_437388 ) ) ( not ( = ?auto_437386 ?auto_437389 ) ) ( not ( = ?auto_437386 ?auto_437390 ) ) ( not ( = ?auto_437386 ?auto_437391 ) ) ( not ( = ?auto_437387 ?auto_437388 ) ) ( not ( = ?auto_437387 ?auto_437389 ) ) ( not ( = ?auto_437387 ?auto_437390 ) ) ( not ( = ?auto_437387 ?auto_437391 ) ) ( not ( = ?auto_437388 ?auto_437389 ) ) ( not ( = ?auto_437388 ?auto_437390 ) ) ( not ( = ?auto_437388 ?auto_437391 ) ) ( not ( = ?auto_437389 ?auto_437390 ) ) ( not ( = ?auto_437389 ?auto_437391 ) ) ( not ( = ?auto_437390 ?auto_437391 ) ) ( ON ?auto_437389 ?auto_437390 ) ( ON ?auto_437388 ?auto_437389 ) ( ON ?auto_437387 ?auto_437388 ) ( CLEAR ?auto_437385 ) ( ON ?auto_437386 ?auto_437387 ) ( CLEAR ?auto_437386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_437377 ?auto_437378 ?auto_437379 ?auto_437380 ?auto_437381 ?auto_437382 ?auto_437383 ?auto_437384 ?auto_437385 ?auto_437386 )
      ( MAKE-14PILE ?auto_437377 ?auto_437378 ?auto_437379 ?auto_437380 ?auto_437381 ?auto_437382 ?auto_437383 ?auto_437384 ?auto_437385 ?auto_437386 ?auto_437387 ?auto_437388 ?auto_437389 ?auto_437390 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437406 - BLOCK
      ?auto_437407 - BLOCK
      ?auto_437408 - BLOCK
      ?auto_437409 - BLOCK
      ?auto_437410 - BLOCK
      ?auto_437411 - BLOCK
      ?auto_437412 - BLOCK
      ?auto_437413 - BLOCK
      ?auto_437414 - BLOCK
      ?auto_437415 - BLOCK
      ?auto_437416 - BLOCK
      ?auto_437417 - BLOCK
      ?auto_437418 - BLOCK
      ?auto_437419 - BLOCK
    )
    :vars
    (
      ?auto_437420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437419 ?auto_437420 ) ( ON-TABLE ?auto_437406 ) ( ON ?auto_437407 ?auto_437406 ) ( ON ?auto_437408 ?auto_437407 ) ( ON ?auto_437409 ?auto_437408 ) ( ON ?auto_437410 ?auto_437409 ) ( ON ?auto_437411 ?auto_437410 ) ( ON ?auto_437412 ?auto_437411 ) ( ON ?auto_437413 ?auto_437412 ) ( not ( = ?auto_437406 ?auto_437407 ) ) ( not ( = ?auto_437406 ?auto_437408 ) ) ( not ( = ?auto_437406 ?auto_437409 ) ) ( not ( = ?auto_437406 ?auto_437410 ) ) ( not ( = ?auto_437406 ?auto_437411 ) ) ( not ( = ?auto_437406 ?auto_437412 ) ) ( not ( = ?auto_437406 ?auto_437413 ) ) ( not ( = ?auto_437406 ?auto_437414 ) ) ( not ( = ?auto_437406 ?auto_437415 ) ) ( not ( = ?auto_437406 ?auto_437416 ) ) ( not ( = ?auto_437406 ?auto_437417 ) ) ( not ( = ?auto_437406 ?auto_437418 ) ) ( not ( = ?auto_437406 ?auto_437419 ) ) ( not ( = ?auto_437406 ?auto_437420 ) ) ( not ( = ?auto_437407 ?auto_437408 ) ) ( not ( = ?auto_437407 ?auto_437409 ) ) ( not ( = ?auto_437407 ?auto_437410 ) ) ( not ( = ?auto_437407 ?auto_437411 ) ) ( not ( = ?auto_437407 ?auto_437412 ) ) ( not ( = ?auto_437407 ?auto_437413 ) ) ( not ( = ?auto_437407 ?auto_437414 ) ) ( not ( = ?auto_437407 ?auto_437415 ) ) ( not ( = ?auto_437407 ?auto_437416 ) ) ( not ( = ?auto_437407 ?auto_437417 ) ) ( not ( = ?auto_437407 ?auto_437418 ) ) ( not ( = ?auto_437407 ?auto_437419 ) ) ( not ( = ?auto_437407 ?auto_437420 ) ) ( not ( = ?auto_437408 ?auto_437409 ) ) ( not ( = ?auto_437408 ?auto_437410 ) ) ( not ( = ?auto_437408 ?auto_437411 ) ) ( not ( = ?auto_437408 ?auto_437412 ) ) ( not ( = ?auto_437408 ?auto_437413 ) ) ( not ( = ?auto_437408 ?auto_437414 ) ) ( not ( = ?auto_437408 ?auto_437415 ) ) ( not ( = ?auto_437408 ?auto_437416 ) ) ( not ( = ?auto_437408 ?auto_437417 ) ) ( not ( = ?auto_437408 ?auto_437418 ) ) ( not ( = ?auto_437408 ?auto_437419 ) ) ( not ( = ?auto_437408 ?auto_437420 ) ) ( not ( = ?auto_437409 ?auto_437410 ) ) ( not ( = ?auto_437409 ?auto_437411 ) ) ( not ( = ?auto_437409 ?auto_437412 ) ) ( not ( = ?auto_437409 ?auto_437413 ) ) ( not ( = ?auto_437409 ?auto_437414 ) ) ( not ( = ?auto_437409 ?auto_437415 ) ) ( not ( = ?auto_437409 ?auto_437416 ) ) ( not ( = ?auto_437409 ?auto_437417 ) ) ( not ( = ?auto_437409 ?auto_437418 ) ) ( not ( = ?auto_437409 ?auto_437419 ) ) ( not ( = ?auto_437409 ?auto_437420 ) ) ( not ( = ?auto_437410 ?auto_437411 ) ) ( not ( = ?auto_437410 ?auto_437412 ) ) ( not ( = ?auto_437410 ?auto_437413 ) ) ( not ( = ?auto_437410 ?auto_437414 ) ) ( not ( = ?auto_437410 ?auto_437415 ) ) ( not ( = ?auto_437410 ?auto_437416 ) ) ( not ( = ?auto_437410 ?auto_437417 ) ) ( not ( = ?auto_437410 ?auto_437418 ) ) ( not ( = ?auto_437410 ?auto_437419 ) ) ( not ( = ?auto_437410 ?auto_437420 ) ) ( not ( = ?auto_437411 ?auto_437412 ) ) ( not ( = ?auto_437411 ?auto_437413 ) ) ( not ( = ?auto_437411 ?auto_437414 ) ) ( not ( = ?auto_437411 ?auto_437415 ) ) ( not ( = ?auto_437411 ?auto_437416 ) ) ( not ( = ?auto_437411 ?auto_437417 ) ) ( not ( = ?auto_437411 ?auto_437418 ) ) ( not ( = ?auto_437411 ?auto_437419 ) ) ( not ( = ?auto_437411 ?auto_437420 ) ) ( not ( = ?auto_437412 ?auto_437413 ) ) ( not ( = ?auto_437412 ?auto_437414 ) ) ( not ( = ?auto_437412 ?auto_437415 ) ) ( not ( = ?auto_437412 ?auto_437416 ) ) ( not ( = ?auto_437412 ?auto_437417 ) ) ( not ( = ?auto_437412 ?auto_437418 ) ) ( not ( = ?auto_437412 ?auto_437419 ) ) ( not ( = ?auto_437412 ?auto_437420 ) ) ( not ( = ?auto_437413 ?auto_437414 ) ) ( not ( = ?auto_437413 ?auto_437415 ) ) ( not ( = ?auto_437413 ?auto_437416 ) ) ( not ( = ?auto_437413 ?auto_437417 ) ) ( not ( = ?auto_437413 ?auto_437418 ) ) ( not ( = ?auto_437413 ?auto_437419 ) ) ( not ( = ?auto_437413 ?auto_437420 ) ) ( not ( = ?auto_437414 ?auto_437415 ) ) ( not ( = ?auto_437414 ?auto_437416 ) ) ( not ( = ?auto_437414 ?auto_437417 ) ) ( not ( = ?auto_437414 ?auto_437418 ) ) ( not ( = ?auto_437414 ?auto_437419 ) ) ( not ( = ?auto_437414 ?auto_437420 ) ) ( not ( = ?auto_437415 ?auto_437416 ) ) ( not ( = ?auto_437415 ?auto_437417 ) ) ( not ( = ?auto_437415 ?auto_437418 ) ) ( not ( = ?auto_437415 ?auto_437419 ) ) ( not ( = ?auto_437415 ?auto_437420 ) ) ( not ( = ?auto_437416 ?auto_437417 ) ) ( not ( = ?auto_437416 ?auto_437418 ) ) ( not ( = ?auto_437416 ?auto_437419 ) ) ( not ( = ?auto_437416 ?auto_437420 ) ) ( not ( = ?auto_437417 ?auto_437418 ) ) ( not ( = ?auto_437417 ?auto_437419 ) ) ( not ( = ?auto_437417 ?auto_437420 ) ) ( not ( = ?auto_437418 ?auto_437419 ) ) ( not ( = ?auto_437418 ?auto_437420 ) ) ( not ( = ?auto_437419 ?auto_437420 ) ) ( ON ?auto_437418 ?auto_437419 ) ( ON ?auto_437417 ?auto_437418 ) ( ON ?auto_437416 ?auto_437417 ) ( ON ?auto_437415 ?auto_437416 ) ( CLEAR ?auto_437413 ) ( ON ?auto_437414 ?auto_437415 ) ( CLEAR ?auto_437414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_437406 ?auto_437407 ?auto_437408 ?auto_437409 ?auto_437410 ?auto_437411 ?auto_437412 ?auto_437413 ?auto_437414 )
      ( MAKE-14PILE ?auto_437406 ?auto_437407 ?auto_437408 ?auto_437409 ?auto_437410 ?auto_437411 ?auto_437412 ?auto_437413 ?auto_437414 ?auto_437415 ?auto_437416 ?auto_437417 ?auto_437418 ?auto_437419 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437435 - BLOCK
      ?auto_437436 - BLOCK
      ?auto_437437 - BLOCK
      ?auto_437438 - BLOCK
      ?auto_437439 - BLOCK
      ?auto_437440 - BLOCK
      ?auto_437441 - BLOCK
      ?auto_437442 - BLOCK
      ?auto_437443 - BLOCK
      ?auto_437444 - BLOCK
      ?auto_437445 - BLOCK
      ?auto_437446 - BLOCK
      ?auto_437447 - BLOCK
      ?auto_437448 - BLOCK
    )
    :vars
    (
      ?auto_437449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437448 ?auto_437449 ) ( ON-TABLE ?auto_437435 ) ( ON ?auto_437436 ?auto_437435 ) ( ON ?auto_437437 ?auto_437436 ) ( ON ?auto_437438 ?auto_437437 ) ( ON ?auto_437439 ?auto_437438 ) ( ON ?auto_437440 ?auto_437439 ) ( ON ?auto_437441 ?auto_437440 ) ( ON ?auto_437442 ?auto_437441 ) ( not ( = ?auto_437435 ?auto_437436 ) ) ( not ( = ?auto_437435 ?auto_437437 ) ) ( not ( = ?auto_437435 ?auto_437438 ) ) ( not ( = ?auto_437435 ?auto_437439 ) ) ( not ( = ?auto_437435 ?auto_437440 ) ) ( not ( = ?auto_437435 ?auto_437441 ) ) ( not ( = ?auto_437435 ?auto_437442 ) ) ( not ( = ?auto_437435 ?auto_437443 ) ) ( not ( = ?auto_437435 ?auto_437444 ) ) ( not ( = ?auto_437435 ?auto_437445 ) ) ( not ( = ?auto_437435 ?auto_437446 ) ) ( not ( = ?auto_437435 ?auto_437447 ) ) ( not ( = ?auto_437435 ?auto_437448 ) ) ( not ( = ?auto_437435 ?auto_437449 ) ) ( not ( = ?auto_437436 ?auto_437437 ) ) ( not ( = ?auto_437436 ?auto_437438 ) ) ( not ( = ?auto_437436 ?auto_437439 ) ) ( not ( = ?auto_437436 ?auto_437440 ) ) ( not ( = ?auto_437436 ?auto_437441 ) ) ( not ( = ?auto_437436 ?auto_437442 ) ) ( not ( = ?auto_437436 ?auto_437443 ) ) ( not ( = ?auto_437436 ?auto_437444 ) ) ( not ( = ?auto_437436 ?auto_437445 ) ) ( not ( = ?auto_437436 ?auto_437446 ) ) ( not ( = ?auto_437436 ?auto_437447 ) ) ( not ( = ?auto_437436 ?auto_437448 ) ) ( not ( = ?auto_437436 ?auto_437449 ) ) ( not ( = ?auto_437437 ?auto_437438 ) ) ( not ( = ?auto_437437 ?auto_437439 ) ) ( not ( = ?auto_437437 ?auto_437440 ) ) ( not ( = ?auto_437437 ?auto_437441 ) ) ( not ( = ?auto_437437 ?auto_437442 ) ) ( not ( = ?auto_437437 ?auto_437443 ) ) ( not ( = ?auto_437437 ?auto_437444 ) ) ( not ( = ?auto_437437 ?auto_437445 ) ) ( not ( = ?auto_437437 ?auto_437446 ) ) ( not ( = ?auto_437437 ?auto_437447 ) ) ( not ( = ?auto_437437 ?auto_437448 ) ) ( not ( = ?auto_437437 ?auto_437449 ) ) ( not ( = ?auto_437438 ?auto_437439 ) ) ( not ( = ?auto_437438 ?auto_437440 ) ) ( not ( = ?auto_437438 ?auto_437441 ) ) ( not ( = ?auto_437438 ?auto_437442 ) ) ( not ( = ?auto_437438 ?auto_437443 ) ) ( not ( = ?auto_437438 ?auto_437444 ) ) ( not ( = ?auto_437438 ?auto_437445 ) ) ( not ( = ?auto_437438 ?auto_437446 ) ) ( not ( = ?auto_437438 ?auto_437447 ) ) ( not ( = ?auto_437438 ?auto_437448 ) ) ( not ( = ?auto_437438 ?auto_437449 ) ) ( not ( = ?auto_437439 ?auto_437440 ) ) ( not ( = ?auto_437439 ?auto_437441 ) ) ( not ( = ?auto_437439 ?auto_437442 ) ) ( not ( = ?auto_437439 ?auto_437443 ) ) ( not ( = ?auto_437439 ?auto_437444 ) ) ( not ( = ?auto_437439 ?auto_437445 ) ) ( not ( = ?auto_437439 ?auto_437446 ) ) ( not ( = ?auto_437439 ?auto_437447 ) ) ( not ( = ?auto_437439 ?auto_437448 ) ) ( not ( = ?auto_437439 ?auto_437449 ) ) ( not ( = ?auto_437440 ?auto_437441 ) ) ( not ( = ?auto_437440 ?auto_437442 ) ) ( not ( = ?auto_437440 ?auto_437443 ) ) ( not ( = ?auto_437440 ?auto_437444 ) ) ( not ( = ?auto_437440 ?auto_437445 ) ) ( not ( = ?auto_437440 ?auto_437446 ) ) ( not ( = ?auto_437440 ?auto_437447 ) ) ( not ( = ?auto_437440 ?auto_437448 ) ) ( not ( = ?auto_437440 ?auto_437449 ) ) ( not ( = ?auto_437441 ?auto_437442 ) ) ( not ( = ?auto_437441 ?auto_437443 ) ) ( not ( = ?auto_437441 ?auto_437444 ) ) ( not ( = ?auto_437441 ?auto_437445 ) ) ( not ( = ?auto_437441 ?auto_437446 ) ) ( not ( = ?auto_437441 ?auto_437447 ) ) ( not ( = ?auto_437441 ?auto_437448 ) ) ( not ( = ?auto_437441 ?auto_437449 ) ) ( not ( = ?auto_437442 ?auto_437443 ) ) ( not ( = ?auto_437442 ?auto_437444 ) ) ( not ( = ?auto_437442 ?auto_437445 ) ) ( not ( = ?auto_437442 ?auto_437446 ) ) ( not ( = ?auto_437442 ?auto_437447 ) ) ( not ( = ?auto_437442 ?auto_437448 ) ) ( not ( = ?auto_437442 ?auto_437449 ) ) ( not ( = ?auto_437443 ?auto_437444 ) ) ( not ( = ?auto_437443 ?auto_437445 ) ) ( not ( = ?auto_437443 ?auto_437446 ) ) ( not ( = ?auto_437443 ?auto_437447 ) ) ( not ( = ?auto_437443 ?auto_437448 ) ) ( not ( = ?auto_437443 ?auto_437449 ) ) ( not ( = ?auto_437444 ?auto_437445 ) ) ( not ( = ?auto_437444 ?auto_437446 ) ) ( not ( = ?auto_437444 ?auto_437447 ) ) ( not ( = ?auto_437444 ?auto_437448 ) ) ( not ( = ?auto_437444 ?auto_437449 ) ) ( not ( = ?auto_437445 ?auto_437446 ) ) ( not ( = ?auto_437445 ?auto_437447 ) ) ( not ( = ?auto_437445 ?auto_437448 ) ) ( not ( = ?auto_437445 ?auto_437449 ) ) ( not ( = ?auto_437446 ?auto_437447 ) ) ( not ( = ?auto_437446 ?auto_437448 ) ) ( not ( = ?auto_437446 ?auto_437449 ) ) ( not ( = ?auto_437447 ?auto_437448 ) ) ( not ( = ?auto_437447 ?auto_437449 ) ) ( not ( = ?auto_437448 ?auto_437449 ) ) ( ON ?auto_437447 ?auto_437448 ) ( ON ?auto_437446 ?auto_437447 ) ( ON ?auto_437445 ?auto_437446 ) ( ON ?auto_437444 ?auto_437445 ) ( CLEAR ?auto_437442 ) ( ON ?auto_437443 ?auto_437444 ) ( CLEAR ?auto_437443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_437435 ?auto_437436 ?auto_437437 ?auto_437438 ?auto_437439 ?auto_437440 ?auto_437441 ?auto_437442 ?auto_437443 )
      ( MAKE-14PILE ?auto_437435 ?auto_437436 ?auto_437437 ?auto_437438 ?auto_437439 ?auto_437440 ?auto_437441 ?auto_437442 ?auto_437443 ?auto_437444 ?auto_437445 ?auto_437446 ?auto_437447 ?auto_437448 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437464 - BLOCK
      ?auto_437465 - BLOCK
      ?auto_437466 - BLOCK
      ?auto_437467 - BLOCK
      ?auto_437468 - BLOCK
      ?auto_437469 - BLOCK
      ?auto_437470 - BLOCK
      ?auto_437471 - BLOCK
      ?auto_437472 - BLOCK
      ?auto_437473 - BLOCK
      ?auto_437474 - BLOCK
      ?auto_437475 - BLOCK
      ?auto_437476 - BLOCK
      ?auto_437477 - BLOCK
    )
    :vars
    (
      ?auto_437478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437477 ?auto_437478 ) ( ON-TABLE ?auto_437464 ) ( ON ?auto_437465 ?auto_437464 ) ( ON ?auto_437466 ?auto_437465 ) ( ON ?auto_437467 ?auto_437466 ) ( ON ?auto_437468 ?auto_437467 ) ( ON ?auto_437469 ?auto_437468 ) ( ON ?auto_437470 ?auto_437469 ) ( not ( = ?auto_437464 ?auto_437465 ) ) ( not ( = ?auto_437464 ?auto_437466 ) ) ( not ( = ?auto_437464 ?auto_437467 ) ) ( not ( = ?auto_437464 ?auto_437468 ) ) ( not ( = ?auto_437464 ?auto_437469 ) ) ( not ( = ?auto_437464 ?auto_437470 ) ) ( not ( = ?auto_437464 ?auto_437471 ) ) ( not ( = ?auto_437464 ?auto_437472 ) ) ( not ( = ?auto_437464 ?auto_437473 ) ) ( not ( = ?auto_437464 ?auto_437474 ) ) ( not ( = ?auto_437464 ?auto_437475 ) ) ( not ( = ?auto_437464 ?auto_437476 ) ) ( not ( = ?auto_437464 ?auto_437477 ) ) ( not ( = ?auto_437464 ?auto_437478 ) ) ( not ( = ?auto_437465 ?auto_437466 ) ) ( not ( = ?auto_437465 ?auto_437467 ) ) ( not ( = ?auto_437465 ?auto_437468 ) ) ( not ( = ?auto_437465 ?auto_437469 ) ) ( not ( = ?auto_437465 ?auto_437470 ) ) ( not ( = ?auto_437465 ?auto_437471 ) ) ( not ( = ?auto_437465 ?auto_437472 ) ) ( not ( = ?auto_437465 ?auto_437473 ) ) ( not ( = ?auto_437465 ?auto_437474 ) ) ( not ( = ?auto_437465 ?auto_437475 ) ) ( not ( = ?auto_437465 ?auto_437476 ) ) ( not ( = ?auto_437465 ?auto_437477 ) ) ( not ( = ?auto_437465 ?auto_437478 ) ) ( not ( = ?auto_437466 ?auto_437467 ) ) ( not ( = ?auto_437466 ?auto_437468 ) ) ( not ( = ?auto_437466 ?auto_437469 ) ) ( not ( = ?auto_437466 ?auto_437470 ) ) ( not ( = ?auto_437466 ?auto_437471 ) ) ( not ( = ?auto_437466 ?auto_437472 ) ) ( not ( = ?auto_437466 ?auto_437473 ) ) ( not ( = ?auto_437466 ?auto_437474 ) ) ( not ( = ?auto_437466 ?auto_437475 ) ) ( not ( = ?auto_437466 ?auto_437476 ) ) ( not ( = ?auto_437466 ?auto_437477 ) ) ( not ( = ?auto_437466 ?auto_437478 ) ) ( not ( = ?auto_437467 ?auto_437468 ) ) ( not ( = ?auto_437467 ?auto_437469 ) ) ( not ( = ?auto_437467 ?auto_437470 ) ) ( not ( = ?auto_437467 ?auto_437471 ) ) ( not ( = ?auto_437467 ?auto_437472 ) ) ( not ( = ?auto_437467 ?auto_437473 ) ) ( not ( = ?auto_437467 ?auto_437474 ) ) ( not ( = ?auto_437467 ?auto_437475 ) ) ( not ( = ?auto_437467 ?auto_437476 ) ) ( not ( = ?auto_437467 ?auto_437477 ) ) ( not ( = ?auto_437467 ?auto_437478 ) ) ( not ( = ?auto_437468 ?auto_437469 ) ) ( not ( = ?auto_437468 ?auto_437470 ) ) ( not ( = ?auto_437468 ?auto_437471 ) ) ( not ( = ?auto_437468 ?auto_437472 ) ) ( not ( = ?auto_437468 ?auto_437473 ) ) ( not ( = ?auto_437468 ?auto_437474 ) ) ( not ( = ?auto_437468 ?auto_437475 ) ) ( not ( = ?auto_437468 ?auto_437476 ) ) ( not ( = ?auto_437468 ?auto_437477 ) ) ( not ( = ?auto_437468 ?auto_437478 ) ) ( not ( = ?auto_437469 ?auto_437470 ) ) ( not ( = ?auto_437469 ?auto_437471 ) ) ( not ( = ?auto_437469 ?auto_437472 ) ) ( not ( = ?auto_437469 ?auto_437473 ) ) ( not ( = ?auto_437469 ?auto_437474 ) ) ( not ( = ?auto_437469 ?auto_437475 ) ) ( not ( = ?auto_437469 ?auto_437476 ) ) ( not ( = ?auto_437469 ?auto_437477 ) ) ( not ( = ?auto_437469 ?auto_437478 ) ) ( not ( = ?auto_437470 ?auto_437471 ) ) ( not ( = ?auto_437470 ?auto_437472 ) ) ( not ( = ?auto_437470 ?auto_437473 ) ) ( not ( = ?auto_437470 ?auto_437474 ) ) ( not ( = ?auto_437470 ?auto_437475 ) ) ( not ( = ?auto_437470 ?auto_437476 ) ) ( not ( = ?auto_437470 ?auto_437477 ) ) ( not ( = ?auto_437470 ?auto_437478 ) ) ( not ( = ?auto_437471 ?auto_437472 ) ) ( not ( = ?auto_437471 ?auto_437473 ) ) ( not ( = ?auto_437471 ?auto_437474 ) ) ( not ( = ?auto_437471 ?auto_437475 ) ) ( not ( = ?auto_437471 ?auto_437476 ) ) ( not ( = ?auto_437471 ?auto_437477 ) ) ( not ( = ?auto_437471 ?auto_437478 ) ) ( not ( = ?auto_437472 ?auto_437473 ) ) ( not ( = ?auto_437472 ?auto_437474 ) ) ( not ( = ?auto_437472 ?auto_437475 ) ) ( not ( = ?auto_437472 ?auto_437476 ) ) ( not ( = ?auto_437472 ?auto_437477 ) ) ( not ( = ?auto_437472 ?auto_437478 ) ) ( not ( = ?auto_437473 ?auto_437474 ) ) ( not ( = ?auto_437473 ?auto_437475 ) ) ( not ( = ?auto_437473 ?auto_437476 ) ) ( not ( = ?auto_437473 ?auto_437477 ) ) ( not ( = ?auto_437473 ?auto_437478 ) ) ( not ( = ?auto_437474 ?auto_437475 ) ) ( not ( = ?auto_437474 ?auto_437476 ) ) ( not ( = ?auto_437474 ?auto_437477 ) ) ( not ( = ?auto_437474 ?auto_437478 ) ) ( not ( = ?auto_437475 ?auto_437476 ) ) ( not ( = ?auto_437475 ?auto_437477 ) ) ( not ( = ?auto_437475 ?auto_437478 ) ) ( not ( = ?auto_437476 ?auto_437477 ) ) ( not ( = ?auto_437476 ?auto_437478 ) ) ( not ( = ?auto_437477 ?auto_437478 ) ) ( ON ?auto_437476 ?auto_437477 ) ( ON ?auto_437475 ?auto_437476 ) ( ON ?auto_437474 ?auto_437475 ) ( ON ?auto_437473 ?auto_437474 ) ( ON ?auto_437472 ?auto_437473 ) ( CLEAR ?auto_437470 ) ( ON ?auto_437471 ?auto_437472 ) ( CLEAR ?auto_437471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_437464 ?auto_437465 ?auto_437466 ?auto_437467 ?auto_437468 ?auto_437469 ?auto_437470 ?auto_437471 )
      ( MAKE-14PILE ?auto_437464 ?auto_437465 ?auto_437466 ?auto_437467 ?auto_437468 ?auto_437469 ?auto_437470 ?auto_437471 ?auto_437472 ?auto_437473 ?auto_437474 ?auto_437475 ?auto_437476 ?auto_437477 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437493 - BLOCK
      ?auto_437494 - BLOCK
      ?auto_437495 - BLOCK
      ?auto_437496 - BLOCK
      ?auto_437497 - BLOCK
      ?auto_437498 - BLOCK
      ?auto_437499 - BLOCK
      ?auto_437500 - BLOCK
      ?auto_437501 - BLOCK
      ?auto_437502 - BLOCK
      ?auto_437503 - BLOCK
      ?auto_437504 - BLOCK
      ?auto_437505 - BLOCK
      ?auto_437506 - BLOCK
    )
    :vars
    (
      ?auto_437507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437506 ?auto_437507 ) ( ON-TABLE ?auto_437493 ) ( ON ?auto_437494 ?auto_437493 ) ( ON ?auto_437495 ?auto_437494 ) ( ON ?auto_437496 ?auto_437495 ) ( ON ?auto_437497 ?auto_437496 ) ( ON ?auto_437498 ?auto_437497 ) ( ON ?auto_437499 ?auto_437498 ) ( not ( = ?auto_437493 ?auto_437494 ) ) ( not ( = ?auto_437493 ?auto_437495 ) ) ( not ( = ?auto_437493 ?auto_437496 ) ) ( not ( = ?auto_437493 ?auto_437497 ) ) ( not ( = ?auto_437493 ?auto_437498 ) ) ( not ( = ?auto_437493 ?auto_437499 ) ) ( not ( = ?auto_437493 ?auto_437500 ) ) ( not ( = ?auto_437493 ?auto_437501 ) ) ( not ( = ?auto_437493 ?auto_437502 ) ) ( not ( = ?auto_437493 ?auto_437503 ) ) ( not ( = ?auto_437493 ?auto_437504 ) ) ( not ( = ?auto_437493 ?auto_437505 ) ) ( not ( = ?auto_437493 ?auto_437506 ) ) ( not ( = ?auto_437493 ?auto_437507 ) ) ( not ( = ?auto_437494 ?auto_437495 ) ) ( not ( = ?auto_437494 ?auto_437496 ) ) ( not ( = ?auto_437494 ?auto_437497 ) ) ( not ( = ?auto_437494 ?auto_437498 ) ) ( not ( = ?auto_437494 ?auto_437499 ) ) ( not ( = ?auto_437494 ?auto_437500 ) ) ( not ( = ?auto_437494 ?auto_437501 ) ) ( not ( = ?auto_437494 ?auto_437502 ) ) ( not ( = ?auto_437494 ?auto_437503 ) ) ( not ( = ?auto_437494 ?auto_437504 ) ) ( not ( = ?auto_437494 ?auto_437505 ) ) ( not ( = ?auto_437494 ?auto_437506 ) ) ( not ( = ?auto_437494 ?auto_437507 ) ) ( not ( = ?auto_437495 ?auto_437496 ) ) ( not ( = ?auto_437495 ?auto_437497 ) ) ( not ( = ?auto_437495 ?auto_437498 ) ) ( not ( = ?auto_437495 ?auto_437499 ) ) ( not ( = ?auto_437495 ?auto_437500 ) ) ( not ( = ?auto_437495 ?auto_437501 ) ) ( not ( = ?auto_437495 ?auto_437502 ) ) ( not ( = ?auto_437495 ?auto_437503 ) ) ( not ( = ?auto_437495 ?auto_437504 ) ) ( not ( = ?auto_437495 ?auto_437505 ) ) ( not ( = ?auto_437495 ?auto_437506 ) ) ( not ( = ?auto_437495 ?auto_437507 ) ) ( not ( = ?auto_437496 ?auto_437497 ) ) ( not ( = ?auto_437496 ?auto_437498 ) ) ( not ( = ?auto_437496 ?auto_437499 ) ) ( not ( = ?auto_437496 ?auto_437500 ) ) ( not ( = ?auto_437496 ?auto_437501 ) ) ( not ( = ?auto_437496 ?auto_437502 ) ) ( not ( = ?auto_437496 ?auto_437503 ) ) ( not ( = ?auto_437496 ?auto_437504 ) ) ( not ( = ?auto_437496 ?auto_437505 ) ) ( not ( = ?auto_437496 ?auto_437506 ) ) ( not ( = ?auto_437496 ?auto_437507 ) ) ( not ( = ?auto_437497 ?auto_437498 ) ) ( not ( = ?auto_437497 ?auto_437499 ) ) ( not ( = ?auto_437497 ?auto_437500 ) ) ( not ( = ?auto_437497 ?auto_437501 ) ) ( not ( = ?auto_437497 ?auto_437502 ) ) ( not ( = ?auto_437497 ?auto_437503 ) ) ( not ( = ?auto_437497 ?auto_437504 ) ) ( not ( = ?auto_437497 ?auto_437505 ) ) ( not ( = ?auto_437497 ?auto_437506 ) ) ( not ( = ?auto_437497 ?auto_437507 ) ) ( not ( = ?auto_437498 ?auto_437499 ) ) ( not ( = ?auto_437498 ?auto_437500 ) ) ( not ( = ?auto_437498 ?auto_437501 ) ) ( not ( = ?auto_437498 ?auto_437502 ) ) ( not ( = ?auto_437498 ?auto_437503 ) ) ( not ( = ?auto_437498 ?auto_437504 ) ) ( not ( = ?auto_437498 ?auto_437505 ) ) ( not ( = ?auto_437498 ?auto_437506 ) ) ( not ( = ?auto_437498 ?auto_437507 ) ) ( not ( = ?auto_437499 ?auto_437500 ) ) ( not ( = ?auto_437499 ?auto_437501 ) ) ( not ( = ?auto_437499 ?auto_437502 ) ) ( not ( = ?auto_437499 ?auto_437503 ) ) ( not ( = ?auto_437499 ?auto_437504 ) ) ( not ( = ?auto_437499 ?auto_437505 ) ) ( not ( = ?auto_437499 ?auto_437506 ) ) ( not ( = ?auto_437499 ?auto_437507 ) ) ( not ( = ?auto_437500 ?auto_437501 ) ) ( not ( = ?auto_437500 ?auto_437502 ) ) ( not ( = ?auto_437500 ?auto_437503 ) ) ( not ( = ?auto_437500 ?auto_437504 ) ) ( not ( = ?auto_437500 ?auto_437505 ) ) ( not ( = ?auto_437500 ?auto_437506 ) ) ( not ( = ?auto_437500 ?auto_437507 ) ) ( not ( = ?auto_437501 ?auto_437502 ) ) ( not ( = ?auto_437501 ?auto_437503 ) ) ( not ( = ?auto_437501 ?auto_437504 ) ) ( not ( = ?auto_437501 ?auto_437505 ) ) ( not ( = ?auto_437501 ?auto_437506 ) ) ( not ( = ?auto_437501 ?auto_437507 ) ) ( not ( = ?auto_437502 ?auto_437503 ) ) ( not ( = ?auto_437502 ?auto_437504 ) ) ( not ( = ?auto_437502 ?auto_437505 ) ) ( not ( = ?auto_437502 ?auto_437506 ) ) ( not ( = ?auto_437502 ?auto_437507 ) ) ( not ( = ?auto_437503 ?auto_437504 ) ) ( not ( = ?auto_437503 ?auto_437505 ) ) ( not ( = ?auto_437503 ?auto_437506 ) ) ( not ( = ?auto_437503 ?auto_437507 ) ) ( not ( = ?auto_437504 ?auto_437505 ) ) ( not ( = ?auto_437504 ?auto_437506 ) ) ( not ( = ?auto_437504 ?auto_437507 ) ) ( not ( = ?auto_437505 ?auto_437506 ) ) ( not ( = ?auto_437505 ?auto_437507 ) ) ( not ( = ?auto_437506 ?auto_437507 ) ) ( ON ?auto_437505 ?auto_437506 ) ( ON ?auto_437504 ?auto_437505 ) ( ON ?auto_437503 ?auto_437504 ) ( ON ?auto_437502 ?auto_437503 ) ( ON ?auto_437501 ?auto_437502 ) ( CLEAR ?auto_437499 ) ( ON ?auto_437500 ?auto_437501 ) ( CLEAR ?auto_437500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_437493 ?auto_437494 ?auto_437495 ?auto_437496 ?auto_437497 ?auto_437498 ?auto_437499 ?auto_437500 )
      ( MAKE-14PILE ?auto_437493 ?auto_437494 ?auto_437495 ?auto_437496 ?auto_437497 ?auto_437498 ?auto_437499 ?auto_437500 ?auto_437501 ?auto_437502 ?auto_437503 ?auto_437504 ?auto_437505 ?auto_437506 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437522 - BLOCK
      ?auto_437523 - BLOCK
      ?auto_437524 - BLOCK
      ?auto_437525 - BLOCK
      ?auto_437526 - BLOCK
      ?auto_437527 - BLOCK
      ?auto_437528 - BLOCK
      ?auto_437529 - BLOCK
      ?auto_437530 - BLOCK
      ?auto_437531 - BLOCK
      ?auto_437532 - BLOCK
      ?auto_437533 - BLOCK
      ?auto_437534 - BLOCK
      ?auto_437535 - BLOCK
    )
    :vars
    (
      ?auto_437536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437535 ?auto_437536 ) ( ON-TABLE ?auto_437522 ) ( ON ?auto_437523 ?auto_437522 ) ( ON ?auto_437524 ?auto_437523 ) ( ON ?auto_437525 ?auto_437524 ) ( ON ?auto_437526 ?auto_437525 ) ( ON ?auto_437527 ?auto_437526 ) ( not ( = ?auto_437522 ?auto_437523 ) ) ( not ( = ?auto_437522 ?auto_437524 ) ) ( not ( = ?auto_437522 ?auto_437525 ) ) ( not ( = ?auto_437522 ?auto_437526 ) ) ( not ( = ?auto_437522 ?auto_437527 ) ) ( not ( = ?auto_437522 ?auto_437528 ) ) ( not ( = ?auto_437522 ?auto_437529 ) ) ( not ( = ?auto_437522 ?auto_437530 ) ) ( not ( = ?auto_437522 ?auto_437531 ) ) ( not ( = ?auto_437522 ?auto_437532 ) ) ( not ( = ?auto_437522 ?auto_437533 ) ) ( not ( = ?auto_437522 ?auto_437534 ) ) ( not ( = ?auto_437522 ?auto_437535 ) ) ( not ( = ?auto_437522 ?auto_437536 ) ) ( not ( = ?auto_437523 ?auto_437524 ) ) ( not ( = ?auto_437523 ?auto_437525 ) ) ( not ( = ?auto_437523 ?auto_437526 ) ) ( not ( = ?auto_437523 ?auto_437527 ) ) ( not ( = ?auto_437523 ?auto_437528 ) ) ( not ( = ?auto_437523 ?auto_437529 ) ) ( not ( = ?auto_437523 ?auto_437530 ) ) ( not ( = ?auto_437523 ?auto_437531 ) ) ( not ( = ?auto_437523 ?auto_437532 ) ) ( not ( = ?auto_437523 ?auto_437533 ) ) ( not ( = ?auto_437523 ?auto_437534 ) ) ( not ( = ?auto_437523 ?auto_437535 ) ) ( not ( = ?auto_437523 ?auto_437536 ) ) ( not ( = ?auto_437524 ?auto_437525 ) ) ( not ( = ?auto_437524 ?auto_437526 ) ) ( not ( = ?auto_437524 ?auto_437527 ) ) ( not ( = ?auto_437524 ?auto_437528 ) ) ( not ( = ?auto_437524 ?auto_437529 ) ) ( not ( = ?auto_437524 ?auto_437530 ) ) ( not ( = ?auto_437524 ?auto_437531 ) ) ( not ( = ?auto_437524 ?auto_437532 ) ) ( not ( = ?auto_437524 ?auto_437533 ) ) ( not ( = ?auto_437524 ?auto_437534 ) ) ( not ( = ?auto_437524 ?auto_437535 ) ) ( not ( = ?auto_437524 ?auto_437536 ) ) ( not ( = ?auto_437525 ?auto_437526 ) ) ( not ( = ?auto_437525 ?auto_437527 ) ) ( not ( = ?auto_437525 ?auto_437528 ) ) ( not ( = ?auto_437525 ?auto_437529 ) ) ( not ( = ?auto_437525 ?auto_437530 ) ) ( not ( = ?auto_437525 ?auto_437531 ) ) ( not ( = ?auto_437525 ?auto_437532 ) ) ( not ( = ?auto_437525 ?auto_437533 ) ) ( not ( = ?auto_437525 ?auto_437534 ) ) ( not ( = ?auto_437525 ?auto_437535 ) ) ( not ( = ?auto_437525 ?auto_437536 ) ) ( not ( = ?auto_437526 ?auto_437527 ) ) ( not ( = ?auto_437526 ?auto_437528 ) ) ( not ( = ?auto_437526 ?auto_437529 ) ) ( not ( = ?auto_437526 ?auto_437530 ) ) ( not ( = ?auto_437526 ?auto_437531 ) ) ( not ( = ?auto_437526 ?auto_437532 ) ) ( not ( = ?auto_437526 ?auto_437533 ) ) ( not ( = ?auto_437526 ?auto_437534 ) ) ( not ( = ?auto_437526 ?auto_437535 ) ) ( not ( = ?auto_437526 ?auto_437536 ) ) ( not ( = ?auto_437527 ?auto_437528 ) ) ( not ( = ?auto_437527 ?auto_437529 ) ) ( not ( = ?auto_437527 ?auto_437530 ) ) ( not ( = ?auto_437527 ?auto_437531 ) ) ( not ( = ?auto_437527 ?auto_437532 ) ) ( not ( = ?auto_437527 ?auto_437533 ) ) ( not ( = ?auto_437527 ?auto_437534 ) ) ( not ( = ?auto_437527 ?auto_437535 ) ) ( not ( = ?auto_437527 ?auto_437536 ) ) ( not ( = ?auto_437528 ?auto_437529 ) ) ( not ( = ?auto_437528 ?auto_437530 ) ) ( not ( = ?auto_437528 ?auto_437531 ) ) ( not ( = ?auto_437528 ?auto_437532 ) ) ( not ( = ?auto_437528 ?auto_437533 ) ) ( not ( = ?auto_437528 ?auto_437534 ) ) ( not ( = ?auto_437528 ?auto_437535 ) ) ( not ( = ?auto_437528 ?auto_437536 ) ) ( not ( = ?auto_437529 ?auto_437530 ) ) ( not ( = ?auto_437529 ?auto_437531 ) ) ( not ( = ?auto_437529 ?auto_437532 ) ) ( not ( = ?auto_437529 ?auto_437533 ) ) ( not ( = ?auto_437529 ?auto_437534 ) ) ( not ( = ?auto_437529 ?auto_437535 ) ) ( not ( = ?auto_437529 ?auto_437536 ) ) ( not ( = ?auto_437530 ?auto_437531 ) ) ( not ( = ?auto_437530 ?auto_437532 ) ) ( not ( = ?auto_437530 ?auto_437533 ) ) ( not ( = ?auto_437530 ?auto_437534 ) ) ( not ( = ?auto_437530 ?auto_437535 ) ) ( not ( = ?auto_437530 ?auto_437536 ) ) ( not ( = ?auto_437531 ?auto_437532 ) ) ( not ( = ?auto_437531 ?auto_437533 ) ) ( not ( = ?auto_437531 ?auto_437534 ) ) ( not ( = ?auto_437531 ?auto_437535 ) ) ( not ( = ?auto_437531 ?auto_437536 ) ) ( not ( = ?auto_437532 ?auto_437533 ) ) ( not ( = ?auto_437532 ?auto_437534 ) ) ( not ( = ?auto_437532 ?auto_437535 ) ) ( not ( = ?auto_437532 ?auto_437536 ) ) ( not ( = ?auto_437533 ?auto_437534 ) ) ( not ( = ?auto_437533 ?auto_437535 ) ) ( not ( = ?auto_437533 ?auto_437536 ) ) ( not ( = ?auto_437534 ?auto_437535 ) ) ( not ( = ?auto_437534 ?auto_437536 ) ) ( not ( = ?auto_437535 ?auto_437536 ) ) ( ON ?auto_437534 ?auto_437535 ) ( ON ?auto_437533 ?auto_437534 ) ( ON ?auto_437532 ?auto_437533 ) ( ON ?auto_437531 ?auto_437532 ) ( ON ?auto_437530 ?auto_437531 ) ( ON ?auto_437529 ?auto_437530 ) ( CLEAR ?auto_437527 ) ( ON ?auto_437528 ?auto_437529 ) ( CLEAR ?auto_437528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_437522 ?auto_437523 ?auto_437524 ?auto_437525 ?auto_437526 ?auto_437527 ?auto_437528 )
      ( MAKE-14PILE ?auto_437522 ?auto_437523 ?auto_437524 ?auto_437525 ?auto_437526 ?auto_437527 ?auto_437528 ?auto_437529 ?auto_437530 ?auto_437531 ?auto_437532 ?auto_437533 ?auto_437534 ?auto_437535 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437551 - BLOCK
      ?auto_437552 - BLOCK
      ?auto_437553 - BLOCK
      ?auto_437554 - BLOCK
      ?auto_437555 - BLOCK
      ?auto_437556 - BLOCK
      ?auto_437557 - BLOCK
      ?auto_437558 - BLOCK
      ?auto_437559 - BLOCK
      ?auto_437560 - BLOCK
      ?auto_437561 - BLOCK
      ?auto_437562 - BLOCK
      ?auto_437563 - BLOCK
      ?auto_437564 - BLOCK
    )
    :vars
    (
      ?auto_437565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437564 ?auto_437565 ) ( ON-TABLE ?auto_437551 ) ( ON ?auto_437552 ?auto_437551 ) ( ON ?auto_437553 ?auto_437552 ) ( ON ?auto_437554 ?auto_437553 ) ( ON ?auto_437555 ?auto_437554 ) ( ON ?auto_437556 ?auto_437555 ) ( not ( = ?auto_437551 ?auto_437552 ) ) ( not ( = ?auto_437551 ?auto_437553 ) ) ( not ( = ?auto_437551 ?auto_437554 ) ) ( not ( = ?auto_437551 ?auto_437555 ) ) ( not ( = ?auto_437551 ?auto_437556 ) ) ( not ( = ?auto_437551 ?auto_437557 ) ) ( not ( = ?auto_437551 ?auto_437558 ) ) ( not ( = ?auto_437551 ?auto_437559 ) ) ( not ( = ?auto_437551 ?auto_437560 ) ) ( not ( = ?auto_437551 ?auto_437561 ) ) ( not ( = ?auto_437551 ?auto_437562 ) ) ( not ( = ?auto_437551 ?auto_437563 ) ) ( not ( = ?auto_437551 ?auto_437564 ) ) ( not ( = ?auto_437551 ?auto_437565 ) ) ( not ( = ?auto_437552 ?auto_437553 ) ) ( not ( = ?auto_437552 ?auto_437554 ) ) ( not ( = ?auto_437552 ?auto_437555 ) ) ( not ( = ?auto_437552 ?auto_437556 ) ) ( not ( = ?auto_437552 ?auto_437557 ) ) ( not ( = ?auto_437552 ?auto_437558 ) ) ( not ( = ?auto_437552 ?auto_437559 ) ) ( not ( = ?auto_437552 ?auto_437560 ) ) ( not ( = ?auto_437552 ?auto_437561 ) ) ( not ( = ?auto_437552 ?auto_437562 ) ) ( not ( = ?auto_437552 ?auto_437563 ) ) ( not ( = ?auto_437552 ?auto_437564 ) ) ( not ( = ?auto_437552 ?auto_437565 ) ) ( not ( = ?auto_437553 ?auto_437554 ) ) ( not ( = ?auto_437553 ?auto_437555 ) ) ( not ( = ?auto_437553 ?auto_437556 ) ) ( not ( = ?auto_437553 ?auto_437557 ) ) ( not ( = ?auto_437553 ?auto_437558 ) ) ( not ( = ?auto_437553 ?auto_437559 ) ) ( not ( = ?auto_437553 ?auto_437560 ) ) ( not ( = ?auto_437553 ?auto_437561 ) ) ( not ( = ?auto_437553 ?auto_437562 ) ) ( not ( = ?auto_437553 ?auto_437563 ) ) ( not ( = ?auto_437553 ?auto_437564 ) ) ( not ( = ?auto_437553 ?auto_437565 ) ) ( not ( = ?auto_437554 ?auto_437555 ) ) ( not ( = ?auto_437554 ?auto_437556 ) ) ( not ( = ?auto_437554 ?auto_437557 ) ) ( not ( = ?auto_437554 ?auto_437558 ) ) ( not ( = ?auto_437554 ?auto_437559 ) ) ( not ( = ?auto_437554 ?auto_437560 ) ) ( not ( = ?auto_437554 ?auto_437561 ) ) ( not ( = ?auto_437554 ?auto_437562 ) ) ( not ( = ?auto_437554 ?auto_437563 ) ) ( not ( = ?auto_437554 ?auto_437564 ) ) ( not ( = ?auto_437554 ?auto_437565 ) ) ( not ( = ?auto_437555 ?auto_437556 ) ) ( not ( = ?auto_437555 ?auto_437557 ) ) ( not ( = ?auto_437555 ?auto_437558 ) ) ( not ( = ?auto_437555 ?auto_437559 ) ) ( not ( = ?auto_437555 ?auto_437560 ) ) ( not ( = ?auto_437555 ?auto_437561 ) ) ( not ( = ?auto_437555 ?auto_437562 ) ) ( not ( = ?auto_437555 ?auto_437563 ) ) ( not ( = ?auto_437555 ?auto_437564 ) ) ( not ( = ?auto_437555 ?auto_437565 ) ) ( not ( = ?auto_437556 ?auto_437557 ) ) ( not ( = ?auto_437556 ?auto_437558 ) ) ( not ( = ?auto_437556 ?auto_437559 ) ) ( not ( = ?auto_437556 ?auto_437560 ) ) ( not ( = ?auto_437556 ?auto_437561 ) ) ( not ( = ?auto_437556 ?auto_437562 ) ) ( not ( = ?auto_437556 ?auto_437563 ) ) ( not ( = ?auto_437556 ?auto_437564 ) ) ( not ( = ?auto_437556 ?auto_437565 ) ) ( not ( = ?auto_437557 ?auto_437558 ) ) ( not ( = ?auto_437557 ?auto_437559 ) ) ( not ( = ?auto_437557 ?auto_437560 ) ) ( not ( = ?auto_437557 ?auto_437561 ) ) ( not ( = ?auto_437557 ?auto_437562 ) ) ( not ( = ?auto_437557 ?auto_437563 ) ) ( not ( = ?auto_437557 ?auto_437564 ) ) ( not ( = ?auto_437557 ?auto_437565 ) ) ( not ( = ?auto_437558 ?auto_437559 ) ) ( not ( = ?auto_437558 ?auto_437560 ) ) ( not ( = ?auto_437558 ?auto_437561 ) ) ( not ( = ?auto_437558 ?auto_437562 ) ) ( not ( = ?auto_437558 ?auto_437563 ) ) ( not ( = ?auto_437558 ?auto_437564 ) ) ( not ( = ?auto_437558 ?auto_437565 ) ) ( not ( = ?auto_437559 ?auto_437560 ) ) ( not ( = ?auto_437559 ?auto_437561 ) ) ( not ( = ?auto_437559 ?auto_437562 ) ) ( not ( = ?auto_437559 ?auto_437563 ) ) ( not ( = ?auto_437559 ?auto_437564 ) ) ( not ( = ?auto_437559 ?auto_437565 ) ) ( not ( = ?auto_437560 ?auto_437561 ) ) ( not ( = ?auto_437560 ?auto_437562 ) ) ( not ( = ?auto_437560 ?auto_437563 ) ) ( not ( = ?auto_437560 ?auto_437564 ) ) ( not ( = ?auto_437560 ?auto_437565 ) ) ( not ( = ?auto_437561 ?auto_437562 ) ) ( not ( = ?auto_437561 ?auto_437563 ) ) ( not ( = ?auto_437561 ?auto_437564 ) ) ( not ( = ?auto_437561 ?auto_437565 ) ) ( not ( = ?auto_437562 ?auto_437563 ) ) ( not ( = ?auto_437562 ?auto_437564 ) ) ( not ( = ?auto_437562 ?auto_437565 ) ) ( not ( = ?auto_437563 ?auto_437564 ) ) ( not ( = ?auto_437563 ?auto_437565 ) ) ( not ( = ?auto_437564 ?auto_437565 ) ) ( ON ?auto_437563 ?auto_437564 ) ( ON ?auto_437562 ?auto_437563 ) ( ON ?auto_437561 ?auto_437562 ) ( ON ?auto_437560 ?auto_437561 ) ( ON ?auto_437559 ?auto_437560 ) ( ON ?auto_437558 ?auto_437559 ) ( CLEAR ?auto_437556 ) ( ON ?auto_437557 ?auto_437558 ) ( CLEAR ?auto_437557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_437551 ?auto_437552 ?auto_437553 ?auto_437554 ?auto_437555 ?auto_437556 ?auto_437557 )
      ( MAKE-14PILE ?auto_437551 ?auto_437552 ?auto_437553 ?auto_437554 ?auto_437555 ?auto_437556 ?auto_437557 ?auto_437558 ?auto_437559 ?auto_437560 ?auto_437561 ?auto_437562 ?auto_437563 ?auto_437564 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437580 - BLOCK
      ?auto_437581 - BLOCK
      ?auto_437582 - BLOCK
      ?auto_437583 - BLOCK
      ?auto_437584 - BLOCK
      ?auto_437585 - BLOCK
      ?auto_437586 - BLOCK
      ?auto_437587 - BLOCK
      ?auto_437588 - BLOCK
      ?auto_437589 - BLOCK
      ?auto_437590 - BLOCK
      ?auto_437591 - BLOCK
      ?auto_437592 - BLOCK
      ?auto_437593 - BLOCK
    )
    :vars
    (
      ?auto_437594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437593 ?auto_437594 ) ( ON-TABLE ?auto_437580 ) ( ON ?auto_437581 ?auto_437580 ) ( ON ?auto_437582 ?auto_437581 ) ( ON ?auto_437583 ?auto_437582 ) ( ON ?auto_437584 ?auto_437583 ) ( not ( = ?auto_437580 ?auto_437581 ) ) ( not ( = ?auto_437580 ?auto_437582 ) ) ( not ( = ?auto_437580 ?auto_437583 ) ) ( not ( = ?auto_437580 ?auto_437584 ) ) ( not ( = ?auto_437580 ?auto_437585 ) ) ( not ( = ?auto_437580 ?auto_437586 ) ) ( not ( = ?auto_437580 ?auto_437587 ) ) ( not ( = ?auto_437580 ?auto_437588 ) ) ( not ( = ?auto_437580 ?auto_437589 ) ) ( not ( = ?auto_437580 ?auto_437590 ) ) ( not ( = ?auto_437580 ?auto_437591 ) ) ( not ( = ?auto_437580 ?auto_437592 ) ) ( not ( = ?auto_437580 ?auto_437593 ) ) ( not ( = ?auto_437580 ?auto_437594 ) ) ( not ( = ?auto_437581 ?auto_437582 ) ) ( not ( = ?auto_437581 ?auto_437583 ) ) ( not ( = ?auto_437581 ?auto_437584 ) ) ( not ( = ?auto_437581 ?auto_437585 ) ) ( not ( = ?auto_437581 ?auto_437586 ) ) ( not ( = ?auto_437581 ?auto_437587 ) ) ( not ( = ?auto_437581 ?auto_437588 ) ) ( not ( = ?auto_437581 ?auto_437589 ) ) ( not ( = ?auto_437581 ?auto_437590 ) ) ( not ( = ?auto_437581 ?auto_437591 ) ) ( not ( = ?auto_437581 ?auto_437592 ) ) ( not ( = ?auto_437581 ?auto_437593 ) ) ( not ( = ?auto_437581 ?auto_437594 ) ) ( not ( = ?auto_437582 ?auto_437583 ) ) ( not ( = ?auto_437582 ?auto_437584 ) ) ( not ( = ?auto_437582 ?auto_437585 ) ) ( not ( = ?auto_437582 ?auto_437586 ) ) ( not ( = ?auto_437582 ?auto_437587 ) ) ( not ( = ?auto_437582 ?auto_437588 ) ) ( not ( = ?auto_437582 ?auto_437589 ) ) ( not ( = ?auto_437582 ?auto_437590 ) ) ( not ( = ?auto_437582 ?auto_437591 ) ) ( not ( = ?auto_437582 ?auto_437592 ) ) ( not ( = ?auto_437582 ?auto_437593 ) ) ( not ( = ?auto_437582 ?auto_437594 ) ) ( not ( = ?auto_437583 ?auto_437584 ) ) ( not ( = ?auto_437583 ?auto_437585 ) ) ( not ( = ?auto_437583 ?auto_437586 ) ) ( not ( = ?auto_437583 ?auto_437587 ) ) ( not ( = ?auto_437583 ?auto_437588 ) ) ( not ( = ?auto_437583 ?auto_437589 ) ) ( not ( = ?auto_437583 ?auto_437590 ) ) ( not ( = ?auto_437583 ?auto_437591 ) ) ( not ( = ?auto_437583 ?auto_437592 ) ) ( not ( = ?auto_437583 ?auto_437593 ) ) ( not ( = ?auto_437583 ?auto_437594 ) ) ( not ( = ?auto_437584 ?auto_437585 ) ) ( not ( = ?auto_437584 ?auto_437586 ) ) ( not ( = ?auto_437584 ?auto_437587 ) ) ( not ( = ?auto_437584 ?auto_437588 ) ) ( not ( = ?auto_437584 ?auto_437589 ) ) ( not ( = ?auto_437584 ?auto_437590 ) ) ( not ( = ?auto_437584 ?auto_437591 ) ) ( not ( = ?auto_437584 ?auto_437592 ) ) ( not ( = ?auto_437584 ?auto_437593 ) ) ( not ( = ?auto_437584 ?auto_437594 ) ) ( not ( = ?auto_437585 ?auto_437586 ) ) ( not ( = ?auto_437585 ?auto_437587 ) ) ( not ( = ?auto_437585 ?auto_437588 ) ) ( not ( = ?auto_437585 ?auto_437589 ) ) ( not ( = ?auto_437585 ?auto_437590 ) ) ( not ( = ?auto_437585 ?auto_437591 ) ) ( not ( = ?auto_437585 ?auto_437592 ) ) ( not ( = ?auto_437585 ?auto_437593 ) ) ( not ( = ?auto_437585 ?auto_437594 ) ) ( not ( = ?auto_437586 ?auto_437587 ) ) ( not ( = ?auto_437586 ?auto_437588 ) ) ( not ( = ?auto_437586 ?auto_437589 ) ) ( not ( = ?auto_437586 ?auto_437590 ) ) ( not ( = ?auto_437586 ?auto_437591 ) ) ( not ( = ?auto_437586 ?auto_437592 ) ) ( not ( = ?auto_437586 ?auto_437593 ) ) ( not ( = ?auto_437586 ?auto_437594 ) ) ( not ( = ?auto_437587 ?auto_437588 ) ) ( not ( = ?auto_437587 ?auto_437589 ) ) ( not ( = ?auto_437587 ?auto_437590 ) ) ( not ( = ?auto_437587 ?auto_437591 ) ) ( not ( = ?auto_437587 ?auto_437592 ) ) ( not ( = ?auto_437587 ?auto_437593 ) ) ( not ( = ?auto_437587 ?auto_437594 ) ) ( not ( = ?auto_437588 ?auto_437589 ) ) ( not ( = ?auto_437588 ?auto_437590 ) ) ( not ( = ?auto_437588 ?auto_437591 ) ) ( not ( = ?auto_437588 ?auto_437592 ) ) ( not ( = ?auto_437588 ?auto_437593 ) ) ( not ( = ?auto_437588 ?auto_437594 ) ) ( not ( = ?auto_437589 ?auto_437590 ) ) ( not ( = ?auto_437589 ?auto_437591 ) ) ( not ( = ?auto_437589 ?auto_437592 ) ) ( not ( = ?auto_437589 ?auto_437593 ) ) ( not ( = ?auto_437589 ?auto_437594 ) ) ( not ( = ?auto_437590 ?auto_437591 ) ) ( not ( = ?auto_437590 ?auto_437592 ) ) ( not ( = ?auto_437590 ?auto_437593 ) ) ( not ( = ?auto_437590 ?auto_437594 ) ) ( not ( = ?auto_437591 ?auto_437592 ) ) ( not ( = ?auto_437591 ?auto_437593 ) ) ( not ( = ?auto_437591 ?auto_437594 ) ) ( not ( = ?auto_437592 ?auto_437593 ) ) ( not ( = ?auto_437592 ?auto_437594 ) ) ( not ( = ?auto_437593 ?auto_437594 ) ) ( ON ?auto_437592 ?auto_437593 ) ( ON ?auto_437591 ?auto_437592 ) ( ON ?auto_437590 ?auto_437591 ) ( ON ?auto_437589 ?auto_437590 ) ( ON ?auto_437588 ?auto_437589 ) ( ON ?auto_437587 ?auto_437588 ) ( ON ?auto_437586 ?auto_437587 ) ( CLEAR ?auto_437584 ) ( ON ?auto_437585 ?auto_437586 ) ( CLEAR ?auto_437585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_437580 ?auto_437581 ?auto_437582 ?auto_437583 ?auto_437584 ?auto_437585 )
      ( MAKE-14PILE ?auto_437580 ?auto_437581 ?auto_437582 ?auto_437583 ?auto_437584 ?auto_437585 ?auto_437586 ?auto_437587 ?auto_437588 ?auto_437589 ?auto_437590 ?auto_437591 ?auto_437592 ?auto_437593 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437609 - BLOCK
      ?auto_437610 - BLOCK
      ?auto_437611 - BLOCK
      ?auto_437612 - BLOCK
      ?auto_437613 - BLOCK
      ?auto_437614 - BLOCK
      ?auto_437615 - BLOCK
      ?auto_437616 - BLOCK
      ?auto_437617 - BLOCK
      ?auto_437618 - BLOCK
      ?auto_437619 - BLOCK
      ?auto_437620 - BLOCK
      ?auto_437621 - BLOCK
      ?auto_437622 - BLOCK
    )
    :vars
    (
      ?auto_437623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437622 ?auto_437623 ) ( ON-TABLE ?auto_437609 ) ( ON ?auto_437610 ?auto_437609 ) ( ON ?auto_437611 ?auto_437610 ) ( ON ?auto_437612 ?auto_437611 ) ( ON ?auto_437613 ?auto_437612 ) ( not ( = ?auto_437609 ?auto_437610 ) ) ( not ( = ?auto_437609 ?auto_437611 ) ) ( not ( = ?auto_437609 ?auto_437612 ) ) ( not ( = ?auto_437609 ?auto_437613 ) ) ( not ( = ?auto_437609 ?auto_437614 ) ) ( not ( = ?auto_437609 ?auto_437615 ) ) ( not ( = ?auto_437609 ?auto_437616 ) ) ( not ( = ?auto_437609 ?auto_437617 ) ) ( not ( = ?auto_437609 ?auto_437618 ) ) ( not ( = ?auto_437609 ?auto_437619 ) ) ( not ( = ?auto_437609 ?auto_437620 ) ) ( not ( = ?auto_437609 ?auto_437621 ) ) ( not ( = ?auto_437609 ?auto_437622 ) ) ( not ( = ?auto_437609 ?auto_437623 ) ) ( not ( = ?auto_437610 ?auto_437611 ) ) ( not ( = ?auto_437610 ?auto_437612 ) ) ( not ( = ?auto_437610 ?auto_437613 ) ) ( not ( = ?auto_437610 ?auto_437614 ) ) ( not ( = ?auto_437610 ?auto_437615 ) ) ( not ( = ?auto_437610 ?auto_437616 ) ) ( not ( = ?auto_437610 ?auto_437617 ) ) ( not ( = ?auto_437610 ?auto_437618 ) ) ( not ( = ?auto_437610 ?auto_437619 ) ) ( not ( = ?auto_437610 ?auto_437620 ) ) ( not ( = ?auto_437610 ?auto_437621 ) ) ( not ( = ?auto_437610 ?auto_437622 ) ) ( not ( = ?auto_437610 ?auto_437623 ) ) ( not ( = ?auto_437611 ?auto_437612 ) ) ( not ( = ?auto_437611 ?auto_437613 ) ) ( not ( = ?auto_437611 ?auto_437614 ) ) ( not ( = ?auto_437611 ?auto_437615 ) ) ( not ( = ?auto_437611 ?auto_437616 ) ) ( not ( = ?auto_437611 ?auto_437617 ) ) ( not ( = ?auto_437611 ?auto_437618 ) ) ( not ( = ?auto_437611 ?auto_437619 ) ) ( not ( = ?auto_437611 ?auto_437620 ) ) ( not ( = ?auto_437611 ?auto_437621 ) ) ( not ( = ?auto_437611 ?auto_437622 ) ) ( not ( = ?auto_437611 ?auto_437623 ) ) ( not ( = ?auto_437612 ?auto_437613 ) ) ( not ( = ?auto_437612 ?auto_437614 ) ) ( not ( = ?auto_437612 ?auto_437615 ) ) ( not ( = ?auto_437612 ?auto_437616 ) ) ( not ( = ?auto_437612 ?auto_437617 ) ) ( not ( = ?auto_437612 ?auto_437618 ) ) ( not ( = ?auto_437612 ?auto_437619 ) ) ( not ( = ?auto_437612 ?auto_437620 ) ) ( not ( = ?auto_437612 ?auto_437621 ) ) ( not ( = ?auto_437612 ?auto_437622 ) ) ( not ( = ?auto_437612 ?auto_437623 ) ) ( not ( = ?auto_437613 ?auto_437614 ) ) ( not ( = ?auto_437613 ?auto_437615 ) ) ( not ( = ?auto_437613 ?auto_437616 ) ) ( not ( = ?auto_437613 ?auto_437617 ) ) ( not ( = ?auto_437613 ?auto_437618 ) ) ( not ( = ?auto_437613 ?auto_437619 ) ) ( not ( = ?auto_437613 ?auto_437620 ) ) ( not ( = ?auto_437613 ?auto_437621 ) ) ( not ( = ?auto_437613 ?auto_437622 ) ) ( not ( = ?auto_437613 ?auto_437623 ) ) ( not ( = ?auto_437614 ?auto_437615 ) ) ( not ( = ?auto_437614 ?auto_437616 ) ) ( not ( = ?auto_437614 ?auto_437617 ) ) ( not ( = ?auto_437614 ?auto_437618 ) ) ( not ( = ?auto_437614 ?auto_437619 ) ) ( not ( = ?auto_437614 ?auto_437620 ) ) ( not ( = ?auto_437614 ?auto_437621 ) ) ( not ( = ?auto_437614 ?auto_437622 ) ) ( not ( = ?auto_437614 ?auto_437623 ) ) ( not ( = ?auto_437615 ?auto_437616 ) ) ( not ( = ?auto_437615 ?auto_437617 ) ) ( not ( = ?auto_437615 ?auto_437618 ) ) ( not ( = ?auto_437615 ?auto_437619 ) ) ( not ( = ?auto_437615 ?auto_437620 ) ) ( not ( = ?auto_437615 ?auto_437621 ) ) ( not ( = ?auto_437615 ?auto_437622 ) ) ( not ( = ?auto_437615 ?auto_437623 ) ) ( not ( = ?auto_437616 ?auto_437617 ) ) ( not ( = ?auto_437616 ?auto_437618 ) ) ( not ( = ?auto_437616 ?auto_437619 ) ) ( not ( = ?auto_437616 ?auto_437620 ) ) ( not ( = ?auto_437616 ?auto_437621 ) ) ( not ( = ?auto_437616 ?auto_437622 ) ) ( not ( = ?auto_437616 ?auto_437623 ) ) ( not ( = ?auto_437617 ?auto_437618 ) ) ( not ( = ?auto_437617 ?auto_437619 ) ) ( not ( = ?auto_437617 ?auto_437620 ) ) ( not ( = ?auto_437617 ?auto_437621 ) ) ( not ( = ?auto_437617 ?auto_437622 ) ) ( not ( = ?auto_437617 ?auto_437623 ) ) ( not ( = ?auto_437618 ?auto_437619 ) ) ( not ( = ?auto_437618 ?auto_437620 ) ) ( not ( = ?auto_437618 ?auto_437621 ) ) ( not ( = ?auto_437618 ?auto_437622 ) ) ( not ( = ?auto_437618 ?auto_437623 ) ) ( not ( = ?auto_437619 ?auto_437620 ) ) ( not ( = ?auto_437619 ?auto_437621 ) ) ( not ( = ?auto_437619 ?auto_437622 ) ) ( not ( = ?auto_437619 ?auto_437623 ) ) ( not ( = ?auto_437620 ?auto_437621 ) ) ( not ( = ?auto_437620 ?auto_437622 ) ) ( not ( = ?auto_437620 ?auto_437623 ) ) ( not ( = ?auto_437621 ?auto_437622 ) ) ( not ( = ?auto_437621 ?auto_437623 ) ) ( not ( = ?auto_437622 ?auto_437623 ) ) ( ON ?auto_437621 ?auto_437622 ) ( ON ?auto_437620 ?auto_437621 ) ( ON ?auto_437619 ?auto_437620 ) ( ON ?auto_437618 ?auto_437619 ) ( ON ?auto_437617 ?auto_437618 ) ( ON ?auto_437616 ?auto_437617 ) ( ON ?auto_437615 ?auto_437616 ) ( CLEAR ?auto_437613 ) ( ON ?auto_437614 ?auto_437615 ) ( CLEAR ?auto_437614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_437609 ?auto_437610 ?auto_437611 ?auto_437612 ?auto_437613 ?auto_437614 )
      ( MAKE-14PILE ?auto_437609 ?auto_437610 ?auto_437611 ?auto_437612 ?auto_437613 ?auto_437614 ?auto_437615 ?auto_437616 ?auto_437617 ?auto_437618 ?auto_437619 ?auto_437620 ?auto_437621 ?auto_437622 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437638 - BLOCK
      ?auto_437639 - BLOCK
      ?auto_437640 - BLOCK
      ?auto_437641 - BLOCK
      ?auto_437642 - BLOCK
      ?auto_437643 - BLOCK
      ?auto_437644 - BLOCK
      ?auto_437645 - BLOCK
      ?auto_437646 - BLOCK
      ?auto_437647 - BLOCK
      ?auto_437648 - BLOCK
      ?auto_437649 - BLOCK
      ?auto_437650 - BLOCK
      ?auto_437651 - BLOCK
    )
    :vars
    (
      ?auto_437652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437651 ?auto_437652 ) ( ON-TABLE ?auto_437638 ) ( ON ?auto_437639 ?auto_437638 ) ( ON ?auto_437640 ?auto_437639 ) ( ON ?auto_437641 ?auto_437640 ) ( not ( = ?auto_437638 ?auto_437639 ) ) ( not ( = ?auto_437638 ?auto_437640 ) ) ( not ( = ?auto_437638 ?auto_437641 ) ) ( not ( = ?auto_437638 ?auto_437642 ) ) ( not ( = ?auto_437638 ?auto_437643 ) ) ( not ( = ?auto_437638 ?auto_437644 ) ) ( not ( = ?auto_437638 ?auto_437645 ) ) ( not ( = ?auto_437638 ?auto_437646 ) ) ( not ( = ?auto_437638 ?auto_437647 ) ) ( not ( = ?auto_437638 ?auto_437648 ) ) ( not ( = ?auto_437638 ?auto_437649 ) ) ( not ( = ?auto_437638 ?auto_437650 ) ) ( not ( = ?auto_437638 ?auto_437651 ) ) ( not ( = ?auto_437638 ?auto_437652 ) ) ( not ( = ?auto_437639 ?auto_437640 ) ) ( not ( = ?auto_437639 ?auto_437641 ) ) ( not ( = ?auto_437639 ?auto_437642 ) ) ( not ( = ?auto_437639 ?auto_437643 ) ) ( not ( = ?auto_437639 ?auto_437644 ) ) ( not ( = ?auto_437639 ?auto_437645 ) ) ( not ( = ?auto_437639 ?auto_437646 ) ) ( not ( = ?auto_437639 ?auto_437647 ) ) ( not ( = ?auto_437639 ?auto_437648 ) ) ( not ( = ?auto_437639 ?auto_437649 ) ) ( not ( = ?auto_437639 ?auto_437650 ) ) ( not ( = ?auto_437639 ?auto_437651 ) ) ( not ( = ?auto_437639 ?auto_437652 ) ) ( not ( = ?auto_437640 ?auto_437641 ) ) ( not ( = ?auto_437640 ?auto_437642 ) ) ( not ( = ?auto_437640 ?auto_437643 ) ) ( not ( = ?auto_437640 ?auto_437644 ) ) ( not ( = ?auto_437640 ?auto_437645 ) ) ( not ( = ?auto_437640 ?auto_437646 ) ) ( not ( = ?auto_437640 ?auto_437647 ) ) ( not ( = ?auto_437640 ?auto_437648 ) ) ( not ( = ?auto_437640 ?auto_437649 ) ) ( not ( = ?auto_437640 ?auto_437650 ) ) ( not ( = ?auto_437640 ?auto_437651 ) ) ( not ( = ?auto_437640 ?auto_437652 ) ) ( not ( = ?auto_437641 ?auto_437642 ) ) ( not ( = ?auto_437641 ?auto_437643 ) ) ( not ( = ?auto_437641 ?auto_437644 ) ) ( not ( = ?auto_437641 ?auto_437645 ) ) ( not ( = ?auto_437641 ?auto_437646 ) ) ( not ( = ?auto_437641 ?auto_437647 ) ) ( not ( = ?auto_437641 ?auto_437648 ) ) ( not ( = ?auto_437641 ?auto_437649 ) ) ( not ( = ?auto_437641 ?auto_437650 ) ) ( not ( = ?auto_437641 ?auto_437651 ) ) ( not ( = ?auto_437641 ?auto_437652 ) ) ( not ( = ?auto_437642 ?auto_437643 ) ) ( not ( = ?auto_437642 ?auto_437644 ) ) ( not ( = ?auto_437642 ?auto_437645 ) ) ( not ( = ?auto_437642 ?auto_437646 ) ) ( not ( = ?auto_437642 ?auto_437647 ) ) ( not ( = ?auto_437642 ?auto_437648 ) ) ( not ( = ?auto_437642 ?auto_437649 ) ) ( not ( = ?auto_437642 ?auto_437650 ) ) ( not ( = ?auto_437642 ?auto_437651 ) ) ( not ( = ?auto_437642 ?auto_437652 ) ) ( not ( = ?auto_437643 ?auto_437644 ) ) ( not ( = ?auto_437643 ?auto_437645 ) ) ( not ( = ?auto_437643 ?auto_437646 ) ) ( not ( = ?auto_437643 ?auto_437647 ) ) ( not ( = ?auto_437643 ?auto_437648 ) ) ( not ( = ?auto_437643 ?auto_437649 ) ) ( not ( = ?auto_437643 ?auto_437650 ) ) ( not ( = ?auto_437643 ?auto_437651 ) ) ( not ( = ?auto_437643 ?auto_437652 ) ) ( not ( = ?auto_437644 ?auto_437645 ) ) ( not ( = ?auto_437644 ?auto_437646 ) ) ( not ( = ?auto_437644 ?auto_437647 ) ) ( not ( = ?auto_437644 ?auto_437648 ) ) ( not ( = ?auto_437644 ?auto_437649 ) ) ( not ( = ?auto_437644 ?auto_437650 ) ) ( not ( = ?auto_437644 ?auto_437651 ) ) ( not ( = ?auto_437644 ?auto_437652 ) ) ( not ( = ?auto_437645 ?auto_437646 ) ) ( not ( = ?auto_437645 ?auto_437647 ) ) ( not ( = ?auto_437645 ?auto_437648 ) ) ( not ( = ?auto_437645 ?auto_437649 ) ) ( not ( = ?auto_437645 ?auto_437650 ) ) ( not ( = ?auto_437645 ?auto_437651 ) ) ( not ( = ?auto_437645 ?auto_437652 ) ) ( not ( = ?auto_437646 ?auto_437647 ) ) ( not ( = ?auto_437646 ?auto_437648 ) ) ( not ( = ?auto_437646 ?auto_437649 ) ) ( not ( = ?auto_437646 ?auto_437650 ) ) ( not ( = ?auto_437646 ?auto_437651 ) ) ( not ( = ?auto_437646 ?auto_437652 ) ) ( not ( = ?auto_437647 ?auto_437648 ) ) ( not ( = ?auto_437647 ?auto_437649 ) ) ( not ( = ?auto_437647 ?auto_437650 ) ) ( not ( = ?auto_437647 ?auto_437651 ) ) ( not ( = ?auto_437647 ?auto_437652 ) ) ( not ( = ?auto_437648 ?auto_437649 ) ) ( not ( = ?auto_437648 ?auto_437650 ) ) ( not ( = ?auto_437648 ?auto_437651 ) ) ( not ( = ?auto_437648 ?auto_437652 ) ) ( not ( = ?auto_437649 ?auto_437650 ) ) ( not ( = ?auto_437649 ?auto_437651 ) ) ( not ( = ?auto_437649 ?auto_437652 ) ) ( not ( = ?auto_437650 ?auto_437651 ) ) ( not ( = ?auto_437650 ?auto_437652 ) ) ( not ( = ?auto_437651 ?auto_437652 ) ) ( ON ?auto_437650 ?auto_437651 ) ( ON ?auto_437649 ?auto_437650 ) ( ON ?auto_437648 ?auto_437649 ) ( ON ?auto_437647 ?auto_437648 ) ( ON ?auto_437646 ?auto_437647 ) ( ON ?auto_437645 ?auto_437646 ) ( ON ?auto_437644 ?auto_437645 ) ( ON ?auto_437643 ?auto_437644 ) ( CLEAR ?auto_437641 ) ( ON ?auto_437642 ?auto_437643 ) ( CLEAR ?auto_437642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_437638 ?auto_437639 ?auto_437640 ?auto_437641 ?auto_437642 )
      ( MAKE-14PILE ?auto_437638 ?auto_437639 ?auto_437640 ?auto_437641 ?auto_437642 ?auto_437643 ?auto_437644 ?auto_437645 ?auto_437646 ?auto_437647 ?auto_437648 ?auto_437649 ?auto_437650 ?auto_437651 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437667 - BLOCK
      ?auto_437668 - BLOCK
      ?auto_437669 - BLOCK
      ?auto_437670 - BLOCK
      ?auto_437671 - BLOCK
      ?auto_437672 - BLOCK
      ?auto_437673 - BLOCK
      ?auto_437674 - BLOCK
      ?auto_437675 - BLOCK
      ?auto_437676 - BLOCK
      ?auto_437677 - BLOCK
      ?auto_437678 - BLOCK
      ?auto_437679 - BLOCK
      ?auto_437680 - BLOCK
    )
    :vars
    (
      ?auto_437681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437680 ?auto_437681 ) ( ON-TABLE ?auto_437667 ) ( ON ?auto_437668 ?auto_437667 ) ( ON ?auto_437669 ?auto_437668 ) ( ON ?auto_437670 ?auto_437669 ) ( not ( = ?auto_437667 ?auto_437668 ) ) ( not ( = ?auto_437667 ?auto_437669 ) ) ( not ( = ?auto_437667 ?auto_437670 ) ) ( not ( = ?auto_437667 ?auto_437671 ) ) ( not ( = ?auto_437667 ?auto_437672 ) ) ( not ( = ?auto_437667 ?auto_437673 ) ) ( not ( = ?auto_437667 ?auto_437674 ) ) ( not ( = ?auto_437667 ?auto_437675 ) ) ( not ( = ?auto_437667 ?auto_437676 ) ) ( not ( = ?auto_437667 ?auto_437677 ) ) ( not ( = ?auto_437667 ?auto_437678 ) ) ( not ( = ?auto_437667 ?auto_437679 ) ) ( not ( = ?auto_437667 ?auto_437680 ) ) ( not ( = ?auto_437667 ?auto_437681 ) ) ( not ( = ?auto_437668 ?auto_437669 ) ) ( not ( = ?auto_437668 ?auto_437670 ) ) ( not ( = ?auto_437668 ?auto_437671 ) ) ( not ( = ?auto_437668 ?auto_437672 ) ) ( not ( = ?auto_437668 ?auto_437673 ) ) ( not ( = ?auto_437668 ?auto_437674 ) ) ( not ( = ?auto_437668 ?auto_437675 ) ) ( not ( = ?auto_437668 ?auto_437676 ) ) ( not ( = ?auto_437668 ?auto_437677 ) ) ( not ( = ?auto_437668 ?auto_437678 ) ) ( not ( = ?auto_437668 ?auto_437679 ) ) ( not ( = ?auto_437668 ?auto_437680 ) ) ( not ( = ?auto_437668 ?auto_437681 ) ) ( not ( = ?auto_437669 ?auto_437670 ) ) ( not ( = ?auto_437669 ?auto_437671 ) ) ( not ( = ?auto_437669 ?auto_437672 ) ) ( not ( = ?auto_437669 ?auto_437673 ) ) ( not ( = ?auto_437669 ?auto_437674 ) ) ( not ( = ?auto_437669 ?auto_437675 ) ) ( not ( = ?auto_437669 ?auto_437676 ) ) ( not ( = ?auto_437669 ?auto_437677 ) ) ( not ( = ?auto_437669 ?auto_437678 ) ) ( not ( = ?auto_437669 ?auto_437679 ) ) ( not ( = ?auto_437669 ?auto_437680 ) ) ( not ( = ?auto_437669 ?auto_437681 ) ) ( not ( = ?auto_437670 ?auto_437671 ) ) ( not ( = ?auto_437670 ?auto_437672 ) ) ( not ( = ?auto_437670 ?auto_437673 ) ) ( not ( = ?auto_437670 ?auto_437674 ) ) ( not ( = ?auto_437670 ?auto_437675 ) ) ( not ( = ?auto_437670 ?auto_437676 ) ) ( not ( = ?auto_437670 ?auto_437677 ) ) ( not ( = ?auto_437670 ?auto_437678 ) ) ( not ( = ?auto_437670 ?auto_437679 ) ) ( not ( = ?auto_437670 ?auto_437680 ) ) ( not ( = ?auto_437670 ?auto_437681 ) ) ( not ( = ?auto_437671 ?auto_437672 ) ) ( not ( = ?auto_437671 ?auto_437673 ) ) ( not ( = ?auto_437671 ?auto_437674 ) ) ( not ( = ?auto_437671 ?auto_437675 ) ) ( not ( = ?auto_437671 ?auto_437676 ) ) ( not ( = ?auto_437671 ?auto_437677 ) ) ( not ( = ?auto_437671 ?auto_437678 ) ) ( not ( = ?auto_437671 ?auto_437679 ) ) ( not ( = ?auto_437671 ?auto_437680 ) ) ( not ( = ?auto_437671 ?auto_437681 ) ) ( not ( = ?auto_437672 ?auto_437673 ) ) ( not ( = ?auto_437672 ?auto_437674 ) ) ( not ( = ?auto_437672 ?auto_437675 ) ) ( not ( = ?auto_437672 ?auto_437676 ) ) ( not ( = ?auto_437672 ?auto_437677 ) ) ( not ( = ?auto_437672 ?auto_437678 ) ) ( not ( = ?auto_437672 ?auto_437679 ) ) ( not ( = ?auto_437672 ?auto_437680 ) ) ( not ( = ?auto_437672 ?auto_437681 ) ) ( not ( = ?auto_437673 ?auto_437674 ) ) ( not ( = ?auto_437673 ?auto_437675 ) ) ( not ( = ?auto_437673 ?auto_437676 ) ) ( not ( = ?auto_437673 ?auto_437677 ) ) ( not ( = ?auto_437673 ?auto_437678 ) ) ( not ( = ?auto_437673 ?auto_437679 ) ) ( not ( = ?auto_437673 ?auto_437680 ) ) ( not ( = ?auto_437673 ?auto_437681 ) ) ( not ( = ?auto_437674 ?auto_437675 ) ) ( not ( = ?auto_437674 ?auto_437676 ) ) ( not ( = ?auto_437674 ?auto_437677 ) ) ( not ( = ?auto_437674 ?auto_437678 ) ) ( not ( = ?auto_437674 ?auto_437679 ) ) ( not ( = ?auto_437674 ?auto_437680 ) ) ( not ( = ?auto_437674 ?auto_437681 ) ) ( not ( = ?auto_437675 ?auto_437676 ) ) ( not ( = ?auto_437675 ?auto_437677 ) ) ( not ( = ?auto_437675 ?auto_437678 ) ) ( not ( = ?auto_437675 ?auto_437679 ) ) ( not ( = ?auto_437675 ?auto_437680 ) ) ( not ( = ?auto_437675 ?auto_437681 ) ) ( not ( = ?auto_437676 ?auto_437677 ) ) ( not ( = ?auto_437676 ?auto_437678 ) ) ( not ( = ?auto_437676 ?auto_437679 ) ) ( not ( = ?auto_437676 ?auto_437680 ) ) ( not ( = ?auto_437676 ?auto_437681 ) ) ( not ( = ?auto_437677 ?auto_437678 ) ) ( not ( = ?auto_437677 ?auto_437679 ) ) ( not ( = ?auto_437677 ?auto_437680 ) ) ( not ( = ?auto_437677 ?auto_437681 ) ) ( not ( = ?auto_437678 ?auto_437679 ) ) ( not ( = ?auto_437678 ?auto_437680 ) ) ( not ( = ?auto_437678 ?auto_437681 ) ) ( not ( = ?auto_437679 ?auto_437680 ) ) ( not ( = ?auto_437679 ?auto_437681 ) ) ( not ( = ?auto_437680 ?auto_437681 ) ) ( ON ?auto_437679 ?auto_437680 ) ( ON ?auto_437678 ?auto_437679 ) ( ON ?auto_437677 ?auto_437678 ) ( ON ?auto_437676 ?auto_437677 ) ( ON ?auto_437675 ?auto_437676 ) ( ON ?auto_437674 ?auto_437675 ) ( ON ?auto_437673 ?auto_437674 ) ( ON ?auto_437672 ?auto_437673 ) ( CLEAR ?auto_437670 ) ( ON ?auto_437671 ?auto_437672 ) ( CLEAR ?auto_437671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_437667 ?auto_437668 ?auto_437669 ?auto_437670 ?auto_437671 )
      ( MAKE-14PILE ?auto_437667 ?auto_437668 ?auto_437669 ?auto_437670 ?auto_437671 ?auto_437672 ?auto_437673 ?auto_437674 ?auto_437675 ?auto_437676 ?auto_437677 ?auto_437678 ?auto_437679 ?auto_437680 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437696 - BLOCK
      ?auto_437697 - BLOCK
      ?auto_437698 - BLOCK
      ?auto_437699 - BLOCK
      ?auto_437700 - BLOCK
      ?auto_437701 - BLOCK
      ?auto_437702 - BLOCK
      ?auto_437703 - BLOCK
      ?auto_437704 - BLOCK
      ?auto_437705 - BLOCK
      ?auto_437706 - BLOCK
      ?auto_437707 - BLOCK
      ?auto_437708 - BLOCK
      ?auto_437709 - BLOCK
    )
    :vars
    (
      ?auto_437710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437709 ?auto_437710 ) ( ON-TABLE ?auto_437696 ) ( ON ?auto_437697 ?auto_437696 ) ( ON ?auto_437698 ?auto_437697 ) ( not ( = ?auto_437696 ?auto_437697 ) ) ( not ( = ?auto_437696 ?auto_437698 ) ) ( not ( = ?auto_437696 ?auto_437699 ) ) ( not ( = ?auto_437696 ?auto_437700 ) ) ( not ( = ?auto_437696 ?auto_437701 ) ) ( not ( = ?auto_437696 ?auto_437702 ) ) ( not ( = ?auto_437696 ?auto_437703 ) ) ( not ( = ?auto_437696 ?auto_437704 ) ) ( not ( = ?auto_437696 ?auto_437705 ) ) ( not ( = ?auto_437696 ?auto_437706 ) ) ( not ( = ?auto_437696 ?auto_437707 ) ) ( not ( = ?auto_437696 ?auto_437708 ) ) ( not ( = ?auto_437696 ?auto_437709 ) ) ( not ( = ?auto_437696 ?auto_437710 ) ) ( not ( = ?auto_437697 ?auto_437698 ) ) ( not ( = ?auto_437697 ?auto_437699 ) ) ( not ( = ?auto_437697 ?auto_437700 ) ) ( not ( = ?auto_437697 ?auto_437701 ) ) ( not ( = ?auto_437697 ?auto_437702 ) ) ( not ( = ?auto_437697 ?auto_437703 ) ) ( not ( = ?auto_437697 ?auto_437704 ) ) ( not ( = ?auto_437697 ?auto_437705 ) ) ( not ( = ?auto_437697 ?auto_437706 ) ) ( not ( = ?auto_437697 ?auto_437707 ) ) ( not ( = ?auto_437697 ?auto_437708 ) ) ( not ( = ?auto_437697 ?auto_437709 ) ) ( not ( = ?auto_437697 ?auto_437710 ) ) ( not ( = ?auto_437698 ?auto_437699 ) ) ( not ( = ?auto_437698 ?auto_437700 ) ) ( not ( = ?auto_437698 ?auto_437701 ) ) ( not ( = ?auto_437698 ?auto_437702 ) ) ( not ( = ?auto_437698 ?auto_437703 ) ) ( not ( = ?auto_437698 ?auto_437704 ) ) ( not ( = ?auto_437698 ?auto_437705 ) ) ( not ( = ?auto_437698 ?auto_437706 ) ) ( not ( = ?auto_437698 ?auto_437707 ) ) ( not ( = ?auto_437698 ?auto_437708 ) ) ( not ( = ?auto_437698 ?auto_437709 ) ) ( not ( = ?auto_437698 ?auto_437710 ) ) ( not ( = ?auto_437699 ?auto_437700 ) ) ( not ( = ?auto_437699 ?auto_437701 ) ) ( not ( = ?auto_437699 ?auto_437702 ) ) ( not ( = ?auto_437699 ?auto_437703 ) ) ( not ( = ?auto_437699 ?auto_437704 ) ) ( not ( = ?auto_437699 ?auto_437705 ) ) ( not ( = ?auto_437699 ?auto_437706 ) ) ( not ( = ?auto_437699 ?auto_437707 ) ) ( not ( = ?auto_437699 ?auto_437708 ) ) ( not ( = ?auto_437699 ?auto_437709 ) ) ( not ( = ?auto_437699 ?auto_437710 ) ) ( not ( = ?auto_437700 ?auto_437701 ) ) ( not ( = ?auto_437700 ?auto_437702 ) ) ( not ( = ?auto_437700 ?auto_437703 ) ) ( not ( = ?auto_437700 ?auto_437704 ) ) ( not ( = ?auto_437700 ?auto_437705 ) ) ( not ( = ?auto_437700 ?auto_437706 ) ) ( not ( = ?auto_437700 ?auto_437707 ) ) ( not ( = ?auto_437700 ?auto_437708 ) ) ( not ( = ?auto_437700 ?auto_437709 ) ) ( not ( = ?auto_437700 ?auto_437710 ) ) ( not ( = ?auto_437701 ?auto_437702 ) ) ( not ( = ?auto_437701 ?auto_437703 ) ) ( not ( = ?auto_437701 ?auto_437704 ) ) ( not ( = ?auto_437701 ?auto_437705 ) ) ( not ( = ?auto_437701 ?auto_437706 ) ) ( not ( = ?auto_437701 ?auto_437707 ) ) ( not ( = ?auto_437701 ?auto_437708 ) ) ( not ( = ?auto_437701 ?auto_437709 ) ) ( not ( = ?auto_437701 ?auto_437710 ) ) ( not ( = ?auto_437702 ?auto_437703 ) ) ( not ( = ?auto_437702 ?auto_437704 ) ) ( not ( = ?auto_437702 ?auto_437705 ) ) ( not ( = ?auto_437702 ?auto_437706 ) ) ( not ( = ?auto_437702 ?auto_437707 ) ) ( not ( = ?auto_437702 ?auto_437708 ) ) ( not ( = ?auto_437702 ?auto_437709 ) ) ( not ( = ?auto_437702 ?auto_437710 ) ) ( not ( = ?auto_437703 ?auto_437704 ) ) ( not ( = ?auto_437703 ?auto_437705 ) ) ( not ( = ?auto_437703 ?auto_437706 ) ) ( not ( = ?auto_437703 ?auto_437707 ) ) ( not ( = ?auto_437703 ?auto_437708 ) ) ( not ( = ?auto_437703 ?auto_437709 ) ) ( not ( = ?auto_437703 ?auto_437710 ) ) ( not ( = ?auto_437704 ?auto_437705 ) ) ( not ( = ?auto_437704 ?auto_437706 ) ) ( not ( = ?auto_437704 ?auto_437707 ) ) ( not ( = ?auto_437704 ?auto_437708 ) ) ( not ( = ?auto_437704 ?auto_437709 ) ) ( not ( = ?auto_437704 ?auto_437710 ) ) ( not ( = ?auto_437705 ?auto_437706 ) ) ( not ( = ?auto_437705 ?auto_437707 ) ) ( not ( = ?auto_437705 ?auto_437708 ) ) ( not ( = ?auto_437705 ?auto_437709 ) ) ( not ( = ?auto_437705 ?auto_437710 ) ) ( not ( = ?auto_437706 ?auto_437707 ) ) ( not ( = ?auto_437706 ?auto_437708 ) ) ( not ( = ?auto_437706 ?auto_437709 ) ) ( not ( = ?auto_437706 ?auto_437710 ) ) ( not ( = ?auto_437707 ?auto_437708 ) ) ( not ( = ?auto_437707 ?auto_437709 ) ) ( not ( = ?auto_437707 ?auto_437710 ) ) ( not ( = ?auto_437708 ?auto_437709 ) ) ( not ( = ?auto_437708 ?auto_437710 ) ) ( not ( = ?auto_437709 ?auto_437710 ) ) ( ON ?auto_437708 ?auto_437709 ) ( ON ?auto_437707 ?auto_437708 ) ( ON ?auto_437706 ?auto_437707 ) ( ON ?auto_437705 ?auto_437706 ) ( ON ?auto_437704 ?auto_437705 ) ( ON ?auto_437703 ?auto_437704 ) ( ON ?auto_437702 ?auto_437703 ) ( ON ?auto_437701 ?auto_437702 ) ( ON ?auto_437700 ?auto_437701 ) ( CLEAR ?auto_437698 ) ( ON ?auto_437699 ?auto_437700 ) ( CLEAR ?auto_437699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_437696 ?auto_437697 ?auto_437698 ?auto_437699 )
      ( MAKE-14PILE ?auto_437696 ?auto_437697 ?auto_437698 ?auto_437699 ?auto_437700 ?auto_437701 ?auto_437702 ?auto_437703 ?auto_437704 ?auto_437705 ?auto_437706 ?auto_437707 ?auto_437708 ?auto_437709 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437725 - BLOCK
      ?auto_437726 - BLOCK
      ?auto_437727 - BLOCK
      ?auto_437728 - BLOCK
      ?auto_437729 - BLOCK
      ?auto_437730 - BLOCK
      ?auto_437731 - BLOCK
      ?auto_437732 - BLOCK
      ?auto_437733 - BLOCK
      ?auto_437734 - BLOCK
      ?auto_437735 - BLOCK
      ?auto_437736 - BLOCK
      ?auto_437737 - BLOCK
      ?auto_437738 - BLOCK
    )
    :vars
    (
      ?auto_437739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437738 ?auto_437739 ) ( ON-TABLE ?auto_437725 ) ( ON ?auto_437726 ?auto_437725 ) ( ON ?auto_437727 ?auto_437726 ) ( not ( = ?auto_437725 ?auto_437726 ) ) ( not ( = ?auto_437725 ?auto_437727 ) ) ( not ( = ?auto_437725 ?auto_437728 ) ) ( not ( = ?auto_437725 ?auto_437729 ) ) ( not ( = ?auto_437725 ?auto_437730 ) ) ( not ( = ?auto_437725 ?auto_437731 ) ) ( not ( = ?auto_437725 ?auto_437732 ) ) ( not ( = ?auto_437725 ?auto_437733 ) ) ( not ( = ?auto_437725 ?auto_437734 ) ) ( not ( = ?auto_437725 ?auto_437735 ) ) ( not ( = ?auto_437725 ?auto_437736 ) ) ( not ( = ?auto_437725 ?auto_437737 ) ) ( not ( = ?auto_437725 ?auto_437738 ) ) ( not ( = ?auto_437725 ?auto_437739 ) ) ( not ( = ?auto_437726 ?auto_437727 ) ) ( not ( = ?auto_437726 ?auto_437728 ) ) ( not ( = ?auto_437726 ?auto_437729 ) ) ( not ( = ?auto_437726 ?auto_437730 ) ) ( not ( = ?auto_437726 ?auto_437731 ) ) ( not ( = ?auto_437726 ?auto_437732 ) ) ( not ( = ?auto_437726 ?auto_437733 ) ) ( not ( = ?auto_437726 ?auto_437734 ) ) ( not ( = ?auto_437726 ?auto_437735 ) ) ( not ( = ?auto_437726 ?auto_437736 ) ) ( not ( = ?auto_437726 ?auto_437737 ) ) ( not ( = ?auto_437726 ?auto_437738 ) ) ( not ( = ?auto_437726 ?auto_437739 ) ) ( not ( = ?auto_437727 ?auto_437728 ) ) ( not ( = ?auto_437727 ?auto_437729 ) ) ( not ( = ?auto_437727 ?auto_437730 ) ) ( not ( = ?auto_437727 ?auto_437731 ) ) ( not ( = ?auto_437727 ?auto_437732 ) ) ( not ( = ?auto_437727 ?auto_437733 ) ) ( not ( = ?auto_437727 ?auto_437734 ) ) ( not ( = ?auto_437727 ?auto_437735 ) ) ( not ( = ?auto_437727 ?auto_437736 ) ) ( not ( = ?auto_437727 ?auto_437737 ) ) ( not ( = ?auto_437727 ?auto_437738 ) ) ( not ( = ?auto_437727 ?auto_437739 ) ) ( not ( = ?auto_437728 ?auto_437729 ) ) ( not ( = ?auto_437728 ?auto_437730 ) ) ( not ( = ?auto_437728 ?auto_437731 ) ) ( not ( = ?auto_437728 ?auto_437732 ) ) ( not ( = ?auto_437728 ?auto_437733 ) ) ( not ( = ?auto_437728 ?auto_437734 ) ) ( not ( = ?auto_437728 ?auto_437735 ) ) ( not ( = ?auto_437728 ?auto_437736 ) ) ( not ( = ?auto_437728 ?auto_437737 ) ) ( not ( = ?auto_437728 ?auto_437738 ) ) ( not ( = ?auto_437728 ?auto_437739 ) ) ( not ( = ?auto_437729 ?auto_437730 ) ) ( not ( = ?auto_437729 ?auto_437731 ) ) ( not ( = ?auto_437729 ?auto_437732 ) ) ( not ( = ?auto_437729 ?auto_437733 ) ) ( not ( = ?auto_437729 ?auto_437734 ) ) ( not ( = ?auto_437729 ?auto_437735 ) ) ( not ( = ?auto_437729 ?auto_437736 ) ) ( not ( = ?auto_437729 ?auto_437737 ) ) ( not ( = ?auto_437729 ?auto_437738 ) ) ( not ( = ?auto_437729 ?auto_437739 ) ) ( not ( = ?auto_437730 ?auto_437731 ) ) ( not ( = ?auto_437730 ?auto_437732 ) ) ( not ( = ?auto_437730 ?auto_437733 ) ) ( not ( = ?auto_437730 ?auto_437734 ) ) ( not ( = ?auto_437730 ?auto_437735 ) ) ( not ( = ?auto_437730 ?auto_437736 ) ) ( not ( = ?auto_437730 ?auto_437737 ) ) ( not ( = ?auto_437730 ?auto_437738 ) ) ( not ( = ?auto_437730 ?auto_437739 ) ) ( not ( = ?auto_437731 ?auto_437732 ) ) ( not ( = ?auto_437731 ?auto_437733 ) ) ( not ( = ?auto_437731 ?auto_437734 ) ) ( not ( = ?auto_437731 ?auto_437735 ) ) ( not ( = ?auto_437731 ?auto_437736 ) ) ( not ( = ?auto_437731 ?auto_437737 ) ) ( not ( = ?auto_437731 ?auto_437738 ) ) ( not ( = ?auto_437731 ?auto_437739 ) ) ( not ( = ?auto_437732 ?auto_437733 ) ) ( not ( = ?auto_437732 ?auto_437734 ) ) ( not ( = ?auto_437732 ?auto_437735 ) ) ( not ( = ?auto_437732 ?auto_437736 ) ) ( not ( = ?auto_437732 ?auto_437737 ) ) ( not ( = ?auto_437732 ?auto_437738 ) ) ( not ( = ?auto_437732 ?auto_437739 ) ) ( not ( = ?auto_437733 ?auto_437734 ) ) ( not ( = ?auto_437733 ?auto_437735 ) ) ( not ( = ?auto_437733 ?auto_437736 ) ) ( not ( = ?auto_437733 ?auto_437737 ) ) ( not ( = ?auto_437733 ?auto_437738 ) ) ( not ( = ?auto_437733 ?auto_437739 ) ) ( not ( = ?auto_437734 ?auto_437735 ) ) ( not ( = ?auto_437734 ?auto_437736 ) ) ( not ( = ?auto_437734 ?auto_437737 ) ) ( not ( = ?auto_437734 ?auto_437738 ) ) ( not ( = ?auto_437734 ?auto_437739 ) ) ( not ( = ?auto_437735 ?auto_437736 ) ) ( not ( = ?auto_437735 ?auto_437737 ) ) ( not ( = ?auto_437735 ?auto_437738 ) ) ( not ( = ?auto_437735 ?auto_437739 ) ) ( not ( = ?auto_437736 ?auto_437737 ) ) ( not ( = ?auto_437736 ?auto_437738 ) ) ( not ( = ?auto_437736 ?auto_437739 ) ) ( not ( = ?auto_437737 ?auto_437738 ) ) ( not ( = ?auto_437737 ?auto_437739 ) ) ( not ( = ?auto_437738 ?auto_437739 ) ) ( ON ?auto_437737 ?auto_437738 ) ( ON ?auto_437736 ?auto_437737 ) ( ON ?auto_437735 ?auto_437736 ) ( ON ?auto_437734 ?auto_437735 ) ( ON ?auto_437733 ?auto_437734 ) ( ON ?auto_437732 ?auto_437733 ) ( ON ?auto_437731 ?auto_437732 ) ( ON ?auto_437730 ?auto_437731 ) ( ON ?auto_437729 ?auto_437730 ) ( CLEAR ?auto_437727 ) ( ON ?auto_437728 ?auto_437729 ) ( CLEAR ?auto_437728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_437725 ?auto_437726 ?auto_437727 ?auto_437728 )
      ( MAKE-14PILE ?auto_437725 ?auto_437726 ?auto_437727 ?auto_437728 ?auto_437729 ?auto_437730 ?auto_437731 ?auto_437732 ?auto_437733 ?auto_437734 ?auto_437735 ?auto_437736 ?auto_437737 ?auto_437738 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437754 - BLOCK
      ?auto_437755 - BLOCK
      ?auto_437756 - BLOCK
      ?auto_437757 - BLOCK
      ?auto_437758 - BLOCK
      ?auto_437759 - BLOCK
      ?auto_437760 - BLOCK
      ?auto_437761 - BLOCK
      ?auto_437762 - BLOCK
      ?auto_437763 - BLOCK
      ?auto_437764 - BLOCK
      ?auto_437765 - BLOCK
      ?auto_437766 - BLOCK
      ?auto_437767 - BLOCK
    )
    :vars
    (
      ?auto_437768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437767 ?auto_437768 ) ( ON-TABLE ?auto_437754 ) ( ON ?auto_437755 ?auto_437754 ) ( not ( = ?auto_437754 ?auto_437755 ) ) ( not ( = ?auto_437754 ?auto_437756 ) ) ( not ( = ?auto_437754 ?auto_437757 ) ) ( not ( = ?auto_437754 ?auto_437758 ) ) ( not ( = ?auto_437754 ?auto_437759 ) ) ( not ( = ?auto_437754 ?auto_437760 ) ) ( not ( = ?auto_437754 ?auto_437761 ) ) ( not ( = ?auto_437754 ?auto_437762 ) ) ( not ( = ?auto_437754 ?auto_437763 ) ) ( not ( = ?auto_437754 ?auto_437764 ) ) ( not ( = ?auto_437754 ?auto_437765 ) ) ( not ( = ?auto_437754 ?auto_437766 ) ) ( not ( = ?auto_437754 ?auto_437767 ) ) ( not ( = ?auto_437754 ?auto_437768 ) ) ( not ( = ?auto_437755 ?auto_437756 ) ) ( not ( = ?auto_437755 ?auto_437757 ) ) ( not ( = ?auto_437755 ?auto_437758 ) ) ( not ( = ?auto_437755 ?auto_437759 ) ) ( not ( = ?auto_437755 ?auto_437760 ) ) ( not ( = ?auto_437755 ?auto_437761 ) ) ( not ( = ?auto_437755 ?auto_437762 ) ) ( not ( = ?auto_437755 ?auto_437763 ) ) ( not ( = ?auto_437755 ?auto_437764 ) ) ( not ( = ?auto_437755 ?auto_437765 ) ) ( not ( = ?auto_437755 ?auto_437766 ) ) ( not ( = ?auto_437755 ?auto_437767 ) ) ( not ( = ?auto_437755 ?auto_437768 ) ) ( not ( = ?auto_437756 ?auto_437757 ) ) ( not ( = ?auto_437756 ?auto_437758 ) ) ( not ( = ?auto_437756 ?auto_437759 ) ) ( not ( = ?auto_437756 ?auto_437760 ) ) ( not ( = ?auto_437756 ?auto_437761 ) ) ( not ( = ?auto_437756 ?auto_437762 ) ) ( not ( = ?auto_437756 ?auto_437763 ) ) ( not ( = ?auto_437756 ?auto_437764 ) ) ( not ( = ?auto_437756 ?auto_437765 ) ) ( not ( = ?auto_437756 ?auto_437766 ) ) ( not ( = ?auto_437756 ?auto_437767 ) ) ( not ( = ?auto_437756 ?auto_437768 ) ) ( not ( = ?auto_437757 ?auto_437758 ) ) ( not ( = ?auto_437757 ?auto_437759 ) ) ( not ( = ?auto_437757 ?auto_437760 ) ) ( not ( = ?auto_437757 ?auto_437761 ) ) ( not ( = ?auto_437757 ?auto_437762 ) ) ( not ( = ?auto_437757 ?auto_437763 ) ) ( not ( = ?auto_437757 ?auto_437764 ) ) ( not ( = ?auto_437757 ?auto_437765 ) ) ( not ( = ?auto_437757 ?auto_437766 ) ) ( not ( = ?auto_437757 ?auto_437767 ) ) ( not ( = ?auto_437757 ?auto_437768 ) ) ( not ( = ?auto_437758 ?auto_437759 ) ) ( not ( = ?auto_437758 ?auto_437760 ) ) ( not ( = ?auto_437758 ?auto_437761 ) ) ( not ( = ?auto_437758 ?auto_437762 ) ) ( not ( = ?auto_437758 ?auto_437763 ) ) ( not ( = ?auto_437758 ?auto_437764 ) ) ( not ( = ?auto_437758 ?auto_437765 ) ) ( not ( = ?auto_437758 ?auto_437766 ) ) ( not ( = ?auto_437758 ?auto_437767 ) ) ( not ( = ?auto_437758 ?auto_437768 ) ) ( not ( = ?auto_437759 ?auto_437760 ) ) ( not ( = ?auto_437759 ?auto_437761 ) ) ( not ( = ?auto_437759 ?auto_437762 ) ) ( not ( = ?auto_437759 ?auto_437763 ) ) ( not ( = ?auto_437759 ?auto_437764 ) ) ( not ( = ?auto_437759 ?auto_437765 ) ) ( not ( = ?auto_437759 ?auto_437766 ) ) ( not ( = ?auto_437759 ?auto_437767 ) ) ( not ( = ?auto_437759 ?auto_437768 ) ) ( not ( = ?auto_437760 ?auto_437761 ) ) ( not ( = ?auto_437760 ?auto_437762 ) ) ( not ( = ?auto_437760 ?auto_437763 ) ) ( not ( = ?auto_437760 ?auto_437764 ) ) ( not ( = ?auto_437760 ?auto_437765 ) ) ( not ( = ?auto_437760 ?auto_437766 ) ) ( not ( = ?auto_437760 ?auto_437767 ) ) ( not ( = ?auto_437760 ?auto_437768 ) ) ( not ( = ?auto_437761 ?auto_437762 ) ) ( not ( = ?auto_437761 ?auto_437763 ) ) ( not ( = ?auto_437761 ?auto_437764 ) ) ( not ( = ?auto_437761 ?auto_437765 ) ) ( not ( = ?auto_437761 ?auto_437766 ) ) ( not ( = ?auto_437761 ?auto_437767 ) ) ( not ( = ?auto_437761 ?auto_437768 ) ) ( not ( = ?auto_437762 ?auto_437763 ) ) ( not ( = ?auto_437762 ?auto_437764 ) ) ( not ( = ?auto_437762 ?auto_437765 ) ) ( not ( = ?auto_437762 ?auto_437766 ) ) ( not ( = ?auto_437762 ?auto_437767 ) ) ( not ( = ?auto_437762 ?auto_437768 ) ) ( not ( = ?auto_437763 ?auto_437764 ) ) ( not ( = ?auto_437763 ?auto_437765 ) ) ( not ( = ?auto_437763 ?auto_437766 ) ) ( not ( = ?auto_437763 ?auto_437767 ) ) ( not ( = ?auto_437763 ?auto_437768 ) ) ( not ( = ?auto_437764 ?auto_437765 ) ) ( not ( = ?auto_437764 ?auto_437766 ) ) ( not ( = ?auto_437764 ?auto_437767 ) ) ( not ( = ?auto_437764 ?auto_437768 ) ) ( not ( = ?auto_437765 ?auto_437766 ) ) ( not ( = ?auto_437765 ?auto_437767 ) ) ( not ( = ?auto_437765 ?auto_437768 ) ) ( not ( = ?auto_437766 ?auto_437767 ) ) ( not ( = ?auto_437766 ?auto_437768 ) ) ( not ( = ?auto_437767 ?auto_437768 ) ) ( ON ?auto_437766 ?auto_437767 ) ( ON ?auto_437765 ?auto_437766 ) ( ON ?auto_437764 ?auto_437765 ) ( ON ?auto_437763 ?auto_437764 ) ( ON ?auto_437762 ?auto_437763 ) ( ON ?auto_437761 ?auto_437762 ) ( ON ?auto_437760 ?auto_437761 ) ( ON ?auto_437759 ?auto_437760 ) ( ON ?auto_437758 ?auto_437759 ) ( ON ?auto_437757 ?auto_437758 ) ( CLEAR ?auto_437755 ) ( ON ?auto_437756 ?auto_437757 ) ( CLEAR ?auto_437756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_437754 ?auto_437755 ?auto_437756 )
      ( MAKE-14PILE ?auto_437754 ?auto_437755 ?auto_437756 ?auto_437757 ?auto_437758 ?auto_437759 ?auto_437760 ?auto_437761 ?auto_437762 ?auto_437763 ?auto_437764 ?auto_437765 ?auto_437766 ?auto_437767 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437783 - BLOCK
      ?auto_437784 - BLOCK
      ?auto_437785 - BLOCK
      ?auto_437786 - BLOCK
      ?auto_437787 - BLOCK
      ?auto_437788 - BLOCK
      ?auto_437789 - BLOCK
      ?auto_437790 - BLOCK
      ?auto_437791 - BLOCK
      ?auto_437792 - BLOCK
      ?auto_437793 - BLOCK
      ?auto_437794 - BLOCK
      ?auto_437795 - BLOCK
      ?auto_437796 - BLOCK
    )
    :vars
    (
      ?auto_437797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437796 ?auto_437797 ) ( ON-TABLE ?auto_437783 ) ( ON ?auto_437784 ?auto_437783 ) ( not ( = ?auto_437783 ?auto_437784 ) ) ( not ( = ?auto_437783 ?auto_437785 ) ) ( not ( = ?auto_437783 ?auto_437786 ) ) ( not ( = ?auto_437783 ?auto_437787 ) ) ( not ( = ?auto_437783 ?auto_437788 ) ) ( not ( = ?auto_437783 ?auto_437789 ) ) ( not ( = ?auto_437783 ?auto_437790 ) ) ( not ( = ?auto_437783 ?auto_437791 ) ) ( not ( = ?auto_437783 ?auto_437792 ) ) ( not ( = ?auto_437783 ?auto_437793 ) ) ( not ( = ?auto_437783 ?auto_437794 ) ) ( not ( = ?auto_437783 ?auto_437795 ) ) ( not ( = ?auto_437783 ?auto_437796 ) ) ( not ( = ?auto_437783 ?auto_437797 ) ) ( not ( = ?auto_437784 ?auto_437785 ) ) ( not ( = ?auto_437784 ?auto_437786 ) ) ( not ( = ?auto_437784 ?auto_437787 ) ) ( not ( = ?auto_437784 ?auto_437788 ) ) ( not ( = ?auto_437784 ?auto_437789 ) ) ( not ( = ?auto_437784 ?auto_437790 ) ) ( not ( = ?auto_437784 ?auto_437791 ) ) ( not ( = ?auto_437784 ?auto_437792 ) ) ( not ( = ?auto_437784 ?auto_437793 ) ) ( not ( = ?auto_437784 ?auto_437794 ) ) ( not ( = ?auto_437784 ?auto_437795 ) ) ( not ( = ?auto_437784 ?auto_437796 ) ) ( not ( = ?auto_437784 ?auto_437797 ) ) ( not ( = ?auto_437785 ?auto_437786 ) ) ( not ( = ?auto_437785 ?auto_437787 ) ) ( not ( = ?auto_437785 ?auto_437788 ) ) ( not ( = ?auto_437785 ?auto_437789 ) ) ( not ( = ?auto_437785 ?auto_437790 ) ) ( not ( = ?auto_437785 ?auto_437791 ) ) ( not ( = ?auto_437785 ?auto_437792 ) ) ( not ( = ?auto_437785 ?auto_437793 ) ) ( not ( = ?auto_437785 ?auto_437794 ) ) ( not ( = ?auto_437785 ?auto_437795 ) ) ( not ( = ?auto_437785 ?auto_437796 ) ) ( not ( = ?auto_437785 ?auto_437797 ) ) ( not ( = ?auto_437786 ?auto_437787 ) ) ( not ( = ?auto_437786 ?auto_437788 ) ) ( not ( = ?auto_437786 ?auto_437789 ) ) ( not ( = ?auto_437786 ?auto_437790 ) ) ( not ( = ?auto_437786 ?auto_437791 ) ) ( not ( = ?auto_437786 ?auto_437792 ) ) ( not ( = ?auto_437786 ?auto_437793 ) ) ( not ( = ?auto_437786 ?auto_437794 ) ) ( not ( = ?auto_437786 ?auto_437795 ) ) ( not ( = ?auto_437786 ?auto_437796 ) ) ( not ( = ?auto_437786 ?auto_437797 ) ) ( not ( = ?auto_437787 ?auto_437788 ) ) ( not ( = ?auto_437787 ?auto_437789 ) ) ( not ( = ?auto_437787 ?auto_437790 ) ) ( not ( = ?auto_437787 ?auto_437791 ) ) ( not ( = ?auto_437787 ?auto_437792 ) ) ( not ( = ?auto_437787 ?auto_437793 ) ) ( not ( = ?auto_437787 ?auto_437794 ) ) ( not ( = ?auto_437787 ?auto_437795 ) ) ( not ( = ?auto_437787 ?auto_437796 ) ) ( not ( = ?auto_437787 ?auto_437797 ) ) ( not ( = ?auto_437788 ?auto_437789 ) ) ( not ( = ?auto_437788 ?auto_437790 ) ) ( not ( = ?auto_437788 ?auto_437791 ) ) ( not ( = ?auto_437788 ?auto_437792 ) ) ( not ( = ?auto_437788 ?auto_437793 ) ) ( not ( = ?auto_437788 ?auto_437794 ) ) ( not ( = ?auto_437788 ?auto_437795 ) ) ( not ( = ?auto_437788 ?auto_437796 ) ) ( not ( = ?auto_437788 ?auto_437797 ) ) ( not ( = ?auto_437789 ?auto_437790 ) ) ( not ( = ?auto_437789 ?auto_437791 ) ) ( not ( = ?auto_437789 ?auto_437792 ) ) ( not ( = ?auto_437789 ?auto_437793 ) ) ( not ( = ?auto_437789 ?auto_437794 ) ) ( not ( = ?auto_437789 ?auto_437795 ) ) ( not ( = ?auto_437789 ?auto_437796 ) ) ( not ( = ?auto_437789 ?auto_437797 ) ) ( not ( = ?auto_437790 ?auto_437791 ) ) ( not ( = ?auto_437790 ?auto_437792 ) ) ( not ( = ?auto_437790 ?auto_437793 ) ) ( not ( = ?auto_437790 ?auto_437794 ) ) ( not ( = ?auto_437790 ?auto_437795 ) ) ( not ( = ?auto_437790 ?auto_437796 ) ) ( not ( = ?auto_437790 ?auto_437797 ) ) ( not ( = ?auto_437791 ?auto_437792 ) ) ( not ( = ?auto_437791 ?auto_437793 ) ) ( not ( = ?auto_437791 ?auto_437794 ) ) ( not ( = ?auto_437791 ?auto_437795 ) ) ( not ( = ?auto_437791 ?auto_437796 ) ) ( not ( = ?auto_437791 ?auto_437797 ) ) ( not ( = ?auto_437792 ?auto_437793 ) ) ( not ( = ?auto_437792 ?auto_437794 ) ) ( not ( = ?auto_437792 ?auto_437795 ) ) ( not ( = ?auto_437792 ?auto_437796 ) ) ( not ( = ?auto_437792 ?auto_437797 ) ) ( not ( = ?auto_437793 ?auto_437794 ) ) ( not ( = ?auto_437793 ?auto_437795 ) ) ( not ( = ?auto_437793 ?auto_437796 ) ) ( not ( = ?auto_437793 ?auto_437797 ) ) ( not ( = ?auto_437794 ?auto_437795 ) ) ( not ( = ?auto_437794 ?auto_437796 ) ) ( not ( = ?auto_437794 ?auto_437797 ) ) ( not ( = ?auto_437795 ?auto_437796 ) ) ( not ( = ?auto_437795 ?auto_437797 ) ) ( not ( = ?auto_437796 ?auto_437797 ) ) ( ON ?auto_437795 ?auto_437796 ) ( ON ?auto_437794 ?auto_437795 ) ( ON ?auto_437793 ?auto_437794 ) ( ON ?auto_437792 ?auto_437793 ) ( ON ?auto_437791 ?auto_437792 ) ( ON ?auto_437790 ?auto_437791 ) ( ON ?auto_437789 ?auto_437790 ) ( ON ?auto_437788 ?auto_437789 ) ( ON ?auto_437787 ?auto_437788 ) ( ON ?auto_437786 ?auto_437787 ) ( CLEAR ?auto_437784 ) ( ON ?auto_437785 ?auto_437786 ) ( CLEAR ?auto_437785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_437783 ?auto_437784 ?auto_437785 )
      ( MAKE-14PILE ?auto_437783 ?auto_437784 ?auto_437785 ?auto_437786 ?auto_437787 ?auto_437788 ?auto_437789 ?auto_437790 ?auto_437791 ?auto_437792 ?auto_437793 ?auto_437794 ?auto_437795 ?auto_437796 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437812 - BLOCK
      ?auto_437813 - BLOCK
      ?auto_437814 - BLOCK
      ?auto_437815 - BLOCK
      ?auto_437816 - BLOCK
      ?auto_437817 - BLOCK
      ?auto_437818 - BLOCK
      ?auto_437819 - BLOCK
      ?auto_437820 - BLOCK
      ?auto_437821 - BLOCK
      ?auto_437822 - BLOCK
      ?auto_437823 - BLOCK
      ?auto_437824 - BLOCK
      ?auto_437825 - BLOCK
    )
    :vars
    (
      ?auto_437826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437825 ?auto_437826 ) ( ON-TABLE ?auto_437812 ) ( not ( = ?auto_437812 ?auto_437813 ) ) ( not ( = ?auto_437812 ?auto_437814 ) ) ( not ( = ?auto_437812 ?auto_437815 ) ) ( not ( = ?auto_437812 ?auto_437816 ) ) ( not ( = ?auto_437812 ?auto_437817 ) ) ( not ( = ?auto_437812 ?auto_437818 ) ) ( not ( = ?auto_437812 ?auto_437819 ) ) ( not ( = ?auto_437812 ?auto_437820 ) ) ( not ( = ?auto_437812 ?auto_437821 ) ) ( not ( = ?auto_437812 ?auto_437822 ) ) ( not ( = ?auto_437812 ?auto_437823 ) ) ( not ( = ?auto_437812 ?auto_437824 ) ) ( not ( = ?auto_437812 ?auto_437825 ) ) ( not ( = ?auto_437812 ?auto_437826 ) ) ( not ( = ?auto_437813 ?auto_437814 ) ) ( not ( = ?auto_437813 ?auto_437815 ) ) ( not ( = ?auto_437813 ?auto_437816 ) ) ( not ( = ?auto_437813 ?auto_437817 ) ) ( not ( = ?auto_437813 ?auto_437818 ) ) ( not ( = ?auto_437813 ?auto_437819 ) ) ( not ( = ?auto_437813 ?auto_437820 ) ) ( not ( = ?auto_437813 ?auto_437821 ) ) ( not ( = ?auto_437813 ?auto_437822 ) ) ( not ( = ?auto_437813 ?auto_437823 ) ) ( not ( = ?auto_437813 ?auto_437824 ) ) ( not ( = ?auto_437813 ?auto_437825 ) ) ( not ( = ?auto_437813 ?auto_437826 ) ) ( not ( = ?auto_437814 ?auto_437815 ) ) ( not ( = ?auto_437814 ?auto_437816 ) ) ( not ( = ?auto_437814 ?auto_437817 ) ) ( not ( = ?auto_437814 ?auto_437818 ) ) ( not ( = ?auto_437814 ?auto_437819 ) ) ( not ( = ?auto_437814 ?auto_437820 ) ) ( not ( = ?auto_437814 ?auto_437821 ) ) ( not ( = ?auto_437814 ?auto_437822 ) ) ( not ( = ?auto_437814 ?auto_437823 ) ) ( not ( = ?auto_437814 ?auto_437824 ) ) ( not ( = ?auto_437814 ?auto_437825 ) ) ( not ( = ?auto_437814 ?auto_437826 ) ) ( not ( = ?auto_437815 ?auto_437816 ) ) ( not ( = ?auto_437815 ?auto_437817 ) ) ( not ( = ?auto_437815 ?auto_437818 ) ) ( not ( = ?auto_437815 ?auto_437819 ) ) ( not ( = ?auto_437815 ?auto_437820 ) ) ( not ( = ?auto_437815 ?auto_437821 ) ) ( not ( = ?auto_437815 ?auto_437822 ) ) ( not ( = ?auto_437815 ?auto_437823 ) ) ( not ( = ?auto_437815 ?auto_437824 ) ) ( not ( = ?auto_437815 ?auto_437825 ) ) ( not ( = ?auto_437815 ?auto_437826 ) ) ( not ( = ?auto_437816 ?auto_437817 ) ) ( not ( = ?auto_437816 ?auto_437818 ) ) ( not ( = ?auto_437816 ?auto_437819 ) ) ( not ( = ?auto_437816 ?auto_437820 ) ) ( not ( = ?auto_437816 ?auto_437821 ) ) ( not ( = ?auto_437816 ?auto_437822 ) ) ( not ( = ?auto_437816 ?auto_437823 ) ) ( not ( = ?auto_437816 ?auto_437824 ) ) ( not ( = ?auto_437816 ?auto_437825 ) ) ( not ( = ?auto_437816 ?auto_437826 ) ) ( not ( = ?auto_437817 ?auto_437818 ) ) ( not ( = ?auto_437817 ?auto_437819 ) ) ( not ( = ?auto_437817 ?auto_437820 ) ) ( not ( = ?auto_437817 ?auto_437821 ) ) ( not ( = ?auto_437817 ?auto_437822 ) ) ( not ( = ?auto_437817 ?auto_437823 ) ) ( not ( = ?auto_437817 ?auto_437824 ) ) ( not ( = ?auto_437817 ?auto_437825 ) ) ( not ( = ?auto_437817 ?auto_437826 ) ) ( not ( = ?auto_437818 ?auto_437819 ) ) ( not ( = ?auto_437818 ?auto_437820 ) ) ( not ( = ?auto_437818 ?auto_437821 ) ) ( not ( = ?auto_437818 ?auto_437822 ) ) ( not ( = ?auto_437818 ?auto_437823 ) ) ( not ( = ?auto_437818 ?auto_437824 ) ) ( not ( = ?auto_437818 ?auto_437825 ) ) ( not ( = ?auto_437818 ?auto_437826 ) ) ( not ( = ?auto_437819 ?auto_437820 ) ) ( not ( = ?auto_437819 ?auto_437821 ) ) ( not ( = ?auto_437819 ?auto_437822 ) ) ( not ( = ?auto_437819 ?auto_437823 ) ) ( not ( = ?auto_437819 ?auto_437824 ) ) ( not ( = ?auto_437819 ?auto_437825 ) ) ( not ( = ?auto_437819 ?auto_437826 ) ) ( not ( = ?auto_437820 ?auto_437821 ) ) ( not ( = ?auto_437820 ?auto_437822 ) ) ( not ( = ?auto_437820 ?auto_437823 ) ) ( not ( = ?auto_437820 ?auto_437824 ) ) ( not ( = ?auto_437820 ?auto_437825 ) ) ( not ( = ?auto_437820 ?auto_437826 ) ) ( not ( = ?auto_437821 ?auto_437822 ) ) ( not ( = ?auto_437821 ?auto_437823 ) ) ( not ( = ?auto_437821 ?auto_437824 ) ) ( not ( = ?auto_437821 ?auto_437825 ) ) ( not ( = ?auto_437821 ?auto_437826 ) ) ( not ( = ?auto_437822 ?auto_437823 ) ) ( not ( = ?auto_437822 ?auto_437824 ) ) ( not ( = ?auto_437822 ?auto_437825 ) ) ( not ( = ?auto_437822 ?auto_437826 ) ) ( not ( = ?auto_437823 ?auto_437824 ) ) ( not ( = ?auto_437823 ?auto_437825 ) ) ( not ( = ?auto_437823 ?auto_437826 ) ) ( not ( = ?auto_437824 ?auto_437825 ) ) ( not ( = ?auto_437824 ?auto_437826 ) ) ( not ( = ?auto_437825 ?auto_437826 ) ) ( ON ?auto_437824 ?auto_437825 ) ( ON ?auto_437823 ?auto_437824 ) ( ON ?auto_437822 ?auto_437823 ) ( ON ?auto_437821 ?auto_437822 ) ( ON ?auto_437820 ?auto_437821 ) ( ON ?auto_437819 ?auto_437820 ) ( ON ?auto_437818 ?auto_437819 ) ( ON ?auto_437817 ?auto_437818 ) ( ON ?auto_437816 ?auto_437817 ) ( ON ?auto_437815 ?auto_437816 ) ( ON ?auto_437814 ?auto_437815 ) ( CLEAR ?auto_437812 ) ( ON ?auto_437813 ?auto_437814 ) ( CLEAR ?auto_437813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_437812 ?auto_437813 )
      ( MAKE-14PILE ?auto_437812 ?auto_437813 ?auto_437814 ?auto_437815 ?auto_437816 ?auto_437817 ?auto_437818 ?auto_437819 ?auto_437820 ?auto_437821 ?auto_437822 ?auto_437823 ?auto_437824 ?auto_437825 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437841 - BLOCK
      ?auto_437842 - BLOCK
      ?auto_437843 - BLOCK
      ?auto_437844 - BLOCK
      ?auto_437845 - BLOCK
      ?auto_437846 - BLOCK
      ?auto_437847 - BLOCK
      ?auto_437848 - BLOCK
      ?auto_437849 - BLOCK
      ?auto_437850 - BLOCK
      ?auto_437851 - BLOCK
      ?auto_437852 - BLOCK
      ?auto_437853 - BLOCK
      ?auto_437854 - BLOCK
    )
    :vars
    (
      ?auto_437855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437854 ?auto_437855 ) ( ON-TABLE ?auto_437841 ) ( not ( = ?auto_437841 ?auto_437842 ) ) ( not ( = ?auto_437841 ?auto_437843 ) ) ( not ( = ?auto_437841 ?auto_437844 ) ) ( not ( = ?auto_437841 ?auto_437845 ) ) ( not ( = ?auto_437841 ?auto_437846 ) ) ( not ( = ?auto_437841 ?auto_437847 ) ) ( not ( = ?auto_437841 ?auto_437848 ) ) ( not ( = ?auto_437841 ?auto_437849 ) ) ( not ( = ?auto_437841 ?auto_437850 ) ) ( not ( = ?auto_437841 ?auto_437851 ) ) ( not ( = ?auto_437841 ?auto_437852 ) ) ( not ( = ?auto_437841 ?auto_437853 ) ) ( not ( = ?auto_437841 ?auto_437854 ) ) ( not ( = ?auto_437841 ?auto_437855 ) ) ( not ( = ?auto_437842 ?auto_437843 ) ) ( not ( = ?auto_437842 ?auto_437844 ) ) ( not ( = ?auto_437842 ?auto_437845 ) ) ( not ( = ?auto_437842 ?auto_437846 ) ) ( not ( = ?auto_437842 ?auto_437847 ) ) ( not ( = ?auto_437842 ?auto_437848 ) ) ( not ( = ?auto_437842 ?auto_437849 ) ) ( not ( = ?auto_437842 ?auto_437850 ) ) ( not ( = ?auto_437842 ?auto_437851 ) ) ( not ( = ?auto_437842 ?auto_437852 ) ) ( not ( = ?auto_437842 ?auto_437853 ) ) ( not ( = ?auto_437842 ?auto_437854 ) ) ( not ( = ?auto_437842 ?auto_437855 ) ) ( not ( = ?auto_437843 ?auto_437844 ) ) ( not ( = ?auto_437843 ?auto_437845 ) ) ( not ( = ?auto_437843 ?auto_437846 ) ) ( not ( = ?auto_437843 ?auto_437847 ) ) ( not ( = ?auto_437843 ?auto_437848 ) ) ( not ( = ?auto_437843 ?auto_437849 ) ) ( not ( = ?auto_437843 ?auto_437850 ) ) ( not ( = ?auto_437843 ?auto_437851 ) ) ( not ( = ?auto_437843 ?auto_437852 ) ) ( not ( = ?auto_437843 ?auto_437853 ) ) ( not ( = ?auto_437843 ?auto_437854 ) ) ( not ( = ?auto_437843 ?auto_437855 ) ) ( not ( = ?auto_437844 ?auto_437845 ) ) ( not ( = ?auto_437844 ?auto_437846 ) ) ( not ( = ?auto_437844 ?auto_437847 ) ) ( not ( = ?auto_437844 ?auto_437848 ) ) ( not ( = ?auto_437844 ?auto_437849 ) ) ( not ( = ?auto_437844 ?auto_437850 ) ) ( not ( = ?auto_437844 ?auto_437851 ) ) ( not ( = ?auto_437844 ?auto_437852 ) ) ( not ( = ?auto_437844 ?auto_437853 ) ) ( not ( = ?auto_437844 ?auto_437854 ) ) ( not ( = ?auto_437844 ?auto_437855 ) ) ( not ( = ?auto_437845 ?auto_437846 ) ) ( not ( = ?auto_437845 ?auto_437847 ) ) ( not ( = ?auto_437845 ?auto_437848 ) ) ( not ( = ?auto_437845 ?auto_437849 ) ) ( not ( = ?auto_437845 ?auto_437850 ) ) ( not ( = ?auto_437845 ?auto_437851 ) ) ( not ( = ?auto_437845 ?auto_437852 ) ) ( not ( = ?auto_437845 ?auto_437853 ) ) ( not ( = ?auto_437845 ?auto_437854 ) ) ( not ( = ?auto_437845 ?auto_437855 ) ) ( not ( = ?auto_437846 ?auto_437847 ) ) ( not ( = ?auto_437846 ?auto_437848 ) ) ( not ( = ?auto_437846 ?auto_437849 ) ) ( not ( = ?auto_437846 ?auto_437850 ) ) ( not ( = ?auto_437846 ?auto_437851 ) ) ( not ( = ?auto_437846 ?auto_437852 ) ) ( not ( = ?auto_437846 ?auto_437853 ) ) ( not ( = ?auto_437846 ?auto_437854 ) ) ( not ( = ?auto_437846 ?auto_437855 ) ) ( not ( = ?auto_437847 ?auto_437848 ) ) ( not ( = ?auto_437847 ?auto_437849 ) ) ( not ( = ?auto_437847 ?auto_437850 ) ) ( not ( = ?auto_437847 ?auto_437851 ) ) ( not ( = ?auto_437847 ?auto_437852 ) ) ( not ( = ?auto_437847 ?auto_437853 ) ) ( not ( = ?auto_437847 ?auto_437854 ) ) ( not ( = ?auto_437847 ?auto_437855 ) ) ( not ( = ?auto_437848 ?auto_437849 ) ) ( not ( = ?auto_437848 ?auto_437850 ) ) ( not ( = ?auto_437848 ?auto_437851 ) ) ( not ( = ?auto_437848 ?auto_437852 ) ) ( not ( = ?auto_437848 ?auto_437853 ) ) ( not ( = ?auto_437848 ?auto_437854 ) ) ( not ( = ?auto_437848 ?auto_437855 ) ) ( not ( = ?auto_437849 ?auto_437850 ) ) ( not ( = ?auto_437849 ?auto_437851 ) ) ( not ( = ?auto_437849 ?auto_437852 ) ) ( not ( = ?auto_437849 ?auto_437853 ) ) ( not ( = ?auto_437849 ?auto_437854 ) ) ( not ( = ?auto_437849 ?auto_437855 ) ) ( not ( = ?auto_437850 ?auto_437851 ) ) ( not ( = ?auto_437850 ?auto_437852 ) ) ( not ( = ?auto_437850 ?auto_437853 ) ) ( not ( = ?auto_437850 ?auto_437854 ) ) ( not ( = ?auto_437850 ?auto_437855 ) ) ( not ( = ?auto_437851 ?auto_437852 ) ) ( not ( = ?auto_437851 ?auto_437853 ) ) ( not ( = ?auto_437851 ?auto_437854 ) ) ( not ( = ?auto_437851 ?auto_437855 ) ) ( not ( = ?auto_437852 ?auto_437853 ) ) ( not ( = ?auto_437852 ?auto_437854 ) ) ( not ( = ?auto_437852 ?auto_437855 ) ) ( not ( = ?auto_437853 ?auto_437854 ) ) ( not ( = ?auto_437853 ?auto_437855 ) ) ( not ( = ?auto_437854 ?auto_437855 ) ) ( ON ?auto_437853 ?auto_437854 ) ( ON ?auto_437852 ?auto_437853 ) ( ON ?auto_437851 ?auto_437852 ) ( ON ?auto_437850 ?auto_437851 ) ( ON ?auto_437849 ?auto_437850 ) ( ON ?auto_437848 ?auto_437849 ) ( ON ?auto_437847 ?auto_437848 ) ( ON ?auto_437846 ?auto_437847 ) ( ON ?auto_437845 ?auto_437846 ) ( ON ?auto_437844 ?auto_437845 ) ( ON ?auto_437843 ?auto_437844 ) ( CLEAR ?auto_437841 ) ( ON ?auto_437842 ?auto_437843 ) ( CLEAR ?auto_437842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_437841 ?auto_437842 )
      ( MAKE-14PILE ?auto_437841 ?auto_437842 ?auto_437843 ?auto_437844 ?auto_437845 ?auto_437846 ?auto_437847 ?auto_437848 ?auto_437849 ?auto_437850 ?auto_437851 ?auto_437852 ?auto_437853 ?auto_437854 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437870 - BLOCK
      ?auto_437871 - BLOCK
      ?auto_437872 - BLOCK
      ?auto_437873 - BLOCK
      ?auto_437874 - BLOCK
      ?auto_437875 - BLOCK
      ?auto_437876 - BLOCK
      ?auto_437877 - BLOCK
      ?auto_437878 - BLOCK
      ?auto_437879 - BLOCK
      ?auto_437880 - BLOCK
      ?auto_437881 - BLOCK
      ?auto_437882 - BLOCK
      ?auto_437883 - BLOCK
    )
    :vars
    (
      ?auto_437884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437883 ?auto_437884 ) ( not ( = ?auto_437870 ?auto_437871 ) ) ( not ( = ?auto_437870 ?auto_437872 ) ) ( not ( = ?auto_437870 ?auto_437873 ) ) ( not ( = ?auto_437870 ?auto_437874 ) ) ( not ( = ?auto_437870 ?auto_437875 ) ) ( not ( = ?auto_437870 ?auto_437876 ) ) ( not ( = ?auto_437870 ?auto_437877 ) ) ( not ( = ?auto_437870 ?auto_437878 ) ) ( not ( = ?auto_437870 ?auto_437879 ) ) ( not ( = ?auto_437870 ?auto_437880 ) ) ( not ( = ?auto_437870 ?auto_437881 ) ) ( not ( = ?auto_437870 ?auto_437882 ) ) ( not ( = ?auto_437870 ?auto_437883 ) ) ( not ( = ?auto_437870 ?auto_437884 ) ) ( not ( = ?auto_437871 ?auto_437872 ) ) ( not ( = ?auto_437871 ?auto_437873 ) ) ( not ( = ?auto_437871 ?auto_437874 ) ) ( not ( = ?auto_437871 ?auto_437875 ) ) ( not ( = ?auto_437871 ?auto_437876 ) ) ( not ( = ?auto_437871 ?auto_437877 ) ) ( not ( = ?auto_437871 ?auto_437878 ) ) ( not ( = ?auto_437871 ?auto_437879 ) ) ( not ( = ?auto_437871 ?auto_437880 ) ) ( not ( = ?auto_437871 ?auto_437881 ) ) ( not ( = ?auto_437871 ?auto_437882 ) ) ( not ( = ?auto_437871 ?auto_437883 ) ) ( not ( = ?auto_437871 ?auto_437884 ) ) ( not ( = ?auto_437872 ?auto_437873 ) ) ( not ( = ?auto_437872 ?auto_437874 ) ) ( not ( = ?auto_437872 ?auto_437875 ) ) ( not ( = ?auto_437872 ?auto_437876 ) ) ( not ( = ?auto_437872 ?auto_437877 ) ) ( not ( = ?auto_437872 ?auto_437878 ) ) ( not ( = ?auto_437872 ?auto_437879 ) ) ( not ( = ?auto_437872 ?auto_437880 ) ) ( not ( = ?auto_437872 ?auto_437881 ) ) ( not ( = ?auto_437872 ?auto_437882 ) ) ( not ( = ?auto_437872 ?auto_437883 ) ) ( not ( = ?auto_437872 ?auto_437884 ) ) ( not ( = ?auto_437873 ?auto_437874 ) ) ( not ( = ?auto_437873 ?auto_437875 ) ) ( not ( = ?auto_437873 ?auto_437876 ) ) ( not ( = ?auto_437873 ?auto_437877 ) ) ( not ( = ?auto_437873 ?auto_437878 ) ) ( not ( = ?auto_437873 ?auto_437879 ) ) ( not ( = ?auto_437873 ?auto_437880 ) ) ( not ( = ?auto_437873 ?auto_437881 ) ) ( not ( = ?auto_437873 ?auto_437882 ) ) ( not ( = ?auto_437873 ?auto_437883 ) ) ( not ( = ?auto_437873 ?auto_437884 ) ) ( not ( = ?auto_437874 ?auto_437875 ) ) ( not ( = ?auto_437874 ?auto_437876 ) ) ( not ( = ?auto_437874 ?auto_437877 ) ) ( not ( = ?auto_437874 ?auto_437878 ) ) ( not ( = ?auto_437874 ?auto_437879 ) ) ( not ( = ?auto_437874 ?auto_437880 ) ) ( not ( = ?auto_437874 ?auto_437881 ) ) ( not ( = ?auto_437874 ?auto_437882 ) ) ( not ( = ?auto_437874 ?auto_437883 ) ) ( not ( = ?auto_437874 ?auto_437884 ) ) ( not ( = ?auto_437875 ?auto_437876 ) ) ( not ( = ?auto_437875 ?auto_437877 ) ) ( not ( = ?auto_437875 ?auto_437878 ) ) ( not ( = ?auto_437875 ?auto_437879 ) ) ( not ( = ?auto_437875 ?auto_437880 ) ) ( not ( = ?auto_437875 ?auto_437881 ) ) ( not ( = ?auto_437875 ?auto_437882 ) ) ( not ( = ?auto_437875 ?auto_437883 ) ) ( not ( = ?auto_437875 ?auto_437884 ) ) ( not ( = ?auto_437876 ?auto_437877 ) ) ( not ( = ?auto_437876 ?auto_437878 ) ) ( not ( = ?auto_437876 ?auto_437879 ) ) ( not ( = ?auto_437876 ?auto_437880 ) ) ( not ( = ?auto_437876 ?auto_437881 ) ) ( not ( = ?auto_437876 ?auto_437882 ) ) ( not ( = ?auto_437876 ?auto_437883 ) ) ( not ( = ?auto_437876 ?auto_437884 ) ) ( not ( = ?auto_437877 ?auto_437878 ) ) ( not ( = ?auto_437877 ?auto_437879 ) ) ( not ( = ?auto_437877 ?auto_437880 ) ) ( not ( = ?auto_437877 ?auto_437881 ) ) ( not ( = ?auto_437877 ?auto_437882 ) ) ( not ( = ?auto_437877 ?auto_437883 ) ) ( not ( = ?auto_437877 ?auto_437884 ) ) ( not ( = ?auto_437878 ?auto_437879 ) ) ( not ( = ?auto_437878 ?auto_437880 ) ) ( not ( = ?auto_437878 ?auto_437881 ) ) ( not ( = ?auto_437878 ?auto_437882 ) ) ( not ( = ?auto_437878 ?auto_437883 ) ) ( not ( = ?auto_437878 ?auto_437884 ) ) ( not ( = ?auto_437879 ?auto_437880 ) ) ( not ( = ?auto_437879 ?auto_437881 ) ) ( not ( = ?auto_437879 ?auto_437882 ) ) ( not ( = ?auto_437879 ?auto_437883 ) ) ( not ( = ?auto_437879 ?auto_437884 ) ) ( not ( = ?auto_437880 ?auto_437881 ) ) ( not ( = ?auto_437880 ?auto_437882 ) ) ( not ( = ?auto_437880 ?auto_437883 ) ) ( not ( = ?auto_437880 ?auto_437884 ) ) ( not ( = ?auto_437881 ?auto_437882 ) ) ( not ( = ?auto_437881 ?auto_437883 ) ) ( not ( = ?auto_437881 ?auto_437884 ) ) ( not ( = ?auto_437882 ?auto_437883 ) ) ( not ( = ?auto_437882 ?auto_437884 ) ) ( not ( = ?auto_437883 ?auto_437884 ) ) ( ON ?auto_437882 ?auto_437883 ) ( ON ?auto_437881 ?auto_437882 ) ( ON ?auto_437880 ?auto_437881 ) ( ON ?auto_437879 ?auto_437880 ) ( ON ?auto_437878 ?auto_437879 ) ( ON ?auto_437877 ?auto_437878 ) ( ON ?auto_437876 ?auto_437877 ) ( ON ?auto_437875 ?auto_437876 ) ( ON ?auto_437874 ?auto_437875 ) ( ON ?auto_437873 ?auto_437874 ) ( ON ?auto_437872 ?auto_437873 ) ( ON ?auto_437871 ?auto_437872 ) ( ON ?auto_437870 ?auto_437871 ) ( CLEAR ?auto_437870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_437870 )
      ( MAKE-14PILE ?auto_437870 ?auto_437871 ?auto_437872 ?auto_437873 ?auto_437874 ?auto_437875 ?auto_437876 ?auto_437877 ?auto_437878 ?auto_437879 ?auto_437880 ?auto_437881 ?auto_437882 ?auto_437883 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_437899 - BLOCK
      ?auto_437900 - BLOCK
      ?auto_437901 - BLOCK
      ?auto_437902 - BLOCK
      ?auto_437903 - BLOCK
      ?auto_437904 - BLOCK
      ?auto_437905 - BLOCK
      ?auto_437906 - BLOCK
      ?auto_437907 - BLOCK
      ?auto_437908 - BLOCK
      ?auto_437909 - BLOCK
      ?auto_437910 - BLOCK
      ?auto_437911 - BLOCK
      ?auto_437912 - BLOCK
    )
    :vars
    (
      ?auto_437913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_437912 ?auto_437913 ) ( not ( = ?auto_437899 ?auto_437900 ) ) ( not ( = ?auto_437899 ?auto_437901 ) ) ( not ( = ?auto_437899 ?auto_437902 ) ) ( not ( = ?auto_437899 ?auto_437903 ) ) ( not ( = ?auto_437899 ?auto_437904 ) ) ( not ( = ?auto_437899 ?auto_437905 ) ) ( not ( = ?auto_437899 ?auto_437906 ) ) ( not ( = ?auto_437899 ?auto_437907 ) ) ( not ( = ?auto_437899 ?auto_437908 ) ) ( not ( = ?auto_437899 ?auto_437909 ) ) ( not ( = ?auto_437899 ?auto_437910 ) ) ( not ( = ?auto_437899 ?auto_437911 ) ) ( not ( = ?auto_437899 ?auto_437912 ) ) ( not ( = ?auto_437899 ?auto_437913 ) ) ( not ( = ?auto_437900 ?auto_437901 ) ) ( not ( = ?auto_437900 ?auto_437902 ) ) ( not ( = ?auto_437900 ?auto_437903 ) ) ( not ( = ?auto_437900 ?auto_437904 ) ) ( not ( = ?auto_437900 ?auto_437905 ) ) ( not ( = ?auto_437900 ?auto_437906 ) ) ( not ( = ?auto_437900 ?auto_437907 ) ) ( not ( = ?auto_437900 ?auto_437908 ) ) ( not ( = ?auto_437900 ?auto_437909 ) ) ( not ( = ?auto_437900 ?auto_437910 ) ) ( not ( = ?auto_437900 ?auto_437911 ) ) ( not ( = ?auto_437900 ?auto_437912 ) ) ( not ( = ?auto_437900 ?auto_437913 ) ) ( not ( = ?auto_437901 ?auto_437902 ) ) ( not ( = ?auto_437901 ?auto_437903 ) ) ( not ( = ?auto_437901 ?auto_437904 ) ) ( not ( = ?auto_437901 ?auto_437905 ) ) ( not ( = ?auto_437901 ?auto_437906 ) ) ( not ( = ?auto_437901 ?auto_437907 ) ) ( not ( = ?auto_437901 ?auto_437908 ) ) ( not ( = ?auto_437901 ?auto_437909 ) ) ( not ( = ?auto_437901 ?auto_437910 ) ) ( not ( = ?auto_437901 ?auto_437911 ) ) ( not ( = ?auto_437901 ?auto_437912 ) ) ( not ( = ?auto_437901 ?auto_437913 ) ) ( not ( = ?auto_437902 ?auto_437903 ) ) ( not ( = ?auto_437902 ?auto_437904 ) ) ( not ( = ?auto_437902 ?auto_437905 ) ) ( not ( = ?auto_437902 ?auto_437906 ) ) ( not ( = ?auto_437902 ?auto_437907 ) ) ( not ( = ?auto_437902 ?auto_437908 ) ) ( not ( = ?auto_437902 ?auto_437909 ) ) ( not ( = ?auto_437902 ?auto_437910 ) ) ( not ( = ?auto_437902 ?auto_437911 ) ) ( not ( = ?auto_437902 ?auto_437912 ) ) ( not ( = ?auto_437902 ?auto_437913 ) ) ( not ( = ?auto_437903 ?auto_437904 ) ) ( not ( = ?auto_437903 ?auto_437905 ) ) ( not ( = ?auto_437903 ?auto_437906 ) ) ( not ( = ?auto_437903 ?auto_437907 ) ) ( not ( = ?auto_437903 ?auto_437908 ) ) ( not ( = ?auto_437903 ?auto_437909 ) ) ( not ( = ?auto_437903 ?auto_437910 ) ) ( not ( = ?auto_437903 ?auto_437911 ) ) ( not ( = ?auto_437903 ?auto_437912 ) ) ( not ( = ?auto_437903 ?auto_437913 ) ) ( not ( = ?auto_437904 ?auto_437905 ) ) ( not ( = ?auto_437904 ?auto_437906 ) ) ( not ( = ?auto_437904 ?auto_437907 ) ) ( not ( = ?auto_437904 ?auto_437908 ) ) ( not ( = ?auto_437904 ?auto_437909 ) ) ( not ( = ?auto_437904 ?auto_437910 ) ) ( not ( = ?auto_437904 ?auto_437911 ) ) ( not ( = ?auto_437904 ?auto_437912 ) ) ( not ( = ?auto_437904 ?auto_437913 ) ) ( not ( = ?auto_437905 ?auto_437906 ) ) ( not ( = ?auto_437905 ?auto_437907 ) ) ( not ( = ?auto_437905 ?auto_437908 ) ) ( not ( = ?auto_437905 ?auto_437909 ) ) ( not ( = ?auto_437905 ?auto_437910 ) ) ( not ( = ?auto_437905 ?auto_437911 ) ) ( not ( = ?auto_437905 ?auto_437912 ) ) ( not ( = ?auto_437905 ?auto_437913 ) ) ( not ( = ?auto_437906 ?auto_437907 ) ) ( not ( = ?auto_437906 ?auto_437908 ) ) ( not ( = ?auto_437906 ?auto_437909 ) ) ( not ( = ?auto_437906 ?auto_437910 ) ) ( not ( = ?auto_437906 ?auto_437911 ) ) ( not ( = ?auto_437906 ?auto_437912 ) ) ( not ( = ?auto_437906 ?auto_437913 ) ) ( not ( = ?auto_437907 ?auto_437908 ) ) ( not ( = ?auto_437907 ?auto_437909 ) ) ( not ( = ?auto_437907 ?auto_437910 ) ) ( not ( = ?auto_437907 ?auto_437911 ) ) ( not ( = ?auto_437907 ?auto_437912 ) ) ( not ( = ?auto_437907 ?auto_437913 ) ) ( not ( = ?auto_437908 ?auto_437909 ) ) ( not ( = ?auto_437908 ?auto_437910 ) ) ( not ( = ?auto_437908 ?auto_437911 ) ) ( not ( = ?auto_437908 ?auto_437912 ) ) ( not ( = ?auto_437908 ?auto_437913 ) ) ( not ( = ?auto_437909 ?auto_437910 ) ) ( not ( = ?auto_437909 ?auto_437911 ) ) ( not ( = ?auto_437909 ?auto_437912 ) ) ( not ( = ?auto_437909 ?auto_437913 ) ) ( not ( = ?auto_437910 ?auto_437911 ) ) ( not ( = ?auto_437910 ?auto_437912 ) ) ( not ( = ?auto_437910 ?auto_437913 ) ) ( not ( = ?auto_437911 ?auto_437912 ) ) ( not ( = ?auto_437911 ?auto_437913 ) ) ( not ( = ?auto_437912 ?auto_437913 ) ) ( ON ?auto_437911 ?auto_437912 ) ( ON ?auto_437910 ?auto_437911 ) ( ON ?auto_437909 ?auto_437910 ) ( ON ?auto_437908 ?auto_437909 ) ( ON ?auto_437907 ?auto_437908 ) ( ON ?auto_437906 ?auto_437907 ) ( ON ?auto_437905 ?auto_437906 ) ( ON ?auto_437904 ?auto_437905 ) ( ON ?auto_437903 ?auto_437904 ) ( ON ?auto_437902 ?auto_437903 ) ( ON ?auto_437901 ?auto_437902 ) ( ON ?auto_437900 ?auto_437901 ) ( ON ?auto_437899 ?auto_437900 ) ( CLEAR ?auto_437899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_437899 )
      ( MAKE-14PILE ?auto_437899 ?auto_437900 ?auto_437901 ?auto_437902 ?auto_437903 ?auto_437904 ?auto_437905 ?auto_437906 ?auto_437907 ?auto_437908 ?auto_437909 ?auto_437910 ?auto_437911 ?auto_437912 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_437929 - BLOCK
      ?auto_437930 - BLOCK
      ?auto_437931 - BLOCK
      ?auto_437932 - BLOCK
      ?auto_437933 - BLOCK
      ?auto_437934 - BLOCK
      ?auto_437935 - BLOCK
      ?auto_437936 - BLOCK
      ?auto_437937 - BLOCK
      ?auto_437938 - BLOCK
      ?auto_437939 - BLOCK
      ?auto_437940 - BLOCK
      ?auto_437941 - BLOCK
      ?auto_437942 - BLOCK
      ?auto_437943 - BLOCK
    )
    :vars
    (
      ?auto_437944 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_437942 ) ( ON ?auto_437943 ?auto_437944 ) ( CLEAR ?auto_437943 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_437929 ) ( ON ?auto_437930 ?auto_437929 ) ( ON ?auto_437931 ?auto_437930 ) ( ON ?auto_437932 ?auto_437931 ) ( ON ?auto_437933 ?auto_437932 ) ( ON ?auto_437934 ?auto_437933 ) ( ON ?auto_437935 ?auto_437934 ) ( ON ?auto_437936 ?auto_437935 ) ( ON ?auto_437937 ?auto_437936 ) ( ON ?auto_437938 ?auto_437937 ) ( ON ?auto_437939 ?auto_437938 ) ( ON ?auto_437940 ?auto_437939 ) ( ON ?auto_437941 ?auto_437940 ) ( ON ?auto_437942 ?auto_437941 ) ( not ( = ?auto_437929 ?auto_437930 ) ) ( not ( = ?auto_437929 ?auto_437931 ) ) ( not ( = ?auto_437929 ?auto_437932 ) ) ( not ( = ?auto_437929 ?auto_437933 ) ) ( not ( = ?auto_437929 ?auto_437934 ) ) ( not ( = ?auto_437929 ?auto_437935 ) ) ( not ( = ?auto_437929 ?auto_437936 ) ) ( not ( = ?auto_437929 ?auto_437937 ) ) ( not ( = ?auto_437929 ?auto_437938 ) ) ( not ( = ?auto_437929 ?auto_437939 ) ) ( not ( = ?auto_437929 ?auto_437940 ) ) ( not ( = ?auto_437929 ?auto_437941 ) ) ( not ( = ?auto_437929 ?auto_437942 ) ) ( not ( = ?auto_437929 ?auto_437943 ) ) ( not ( = ?auto_437929 ?auto_437944 ) ) ( not ( = ?auto_437930 ?auto_437931 ) ) ( not ( = ?auto_437930 ?auto_437932 ) ) ( not ( = ?auto_437930 ?auto_437933 ) ) ( not ( = ?auto_437930 ?auto_437934 ) ) ( not ( = ?auto_437930 ?auto_437935 ) ) ( not ( = ?auto_437930 ?auto_437936 ) ) ( not ( = ?auto_437930 ?auto_437937 ) ) ( not ( = ?auto_437930 ?auto_437938 ) ) ( not ( = ?auto_437930 ?auto_437939 ) ) ( not ( = ?auto_437930 ?auto_437940 ) ) ( not ( = ?auto_437930 ?auto_437941 ) ) ( not ( = ?auto_437930 ?auto_437942 ) ) ( not ( = ?auto_437930 ?auto_437943 ) ) ( not ( = ?auto_437930 ?auto_437944 ) ) ( not ( = ?auto_437931 ?auto_437932 ) ) ( not ( = ?auto_437931 ?auto_437933 ) ) ( not ( = ?auto_437931 ?auto_437934 ) ) ( not ( = ?auto_437931 ?auto_437935 ) ) ( not ( = ?auto_437931 ?auto_437936 ) ) ( not ( = ?auto_437931 ?auto_437937 ) ) ( not ( = ?auto_437931 ?auto_437938 ) ) ( not ( = ?auto_437931 ?auto_437939 ) ) ( not ( = ?auto_437931 ?auto_437940 ) ) ( not ( = ?auto_437931 ?auto_437941 ) ) ( not ( = ?auto_437931 ?auto_437942 ) ) ( not ( = ?auto_437931 ?auto_437943 ) ) ( not ( = ?auto_437931 ?auto_437944 ) ) ( not ( = ?auto_437932 ?auto_437933 ) ) ( not ( = ?auto_437932 ?auto_437934 ) ) ( not ( = ?auto_437932 ?auto_437935 ) ) ( not ( = ?auto_437932 ?auto_437936 ) ) ( not ( = ?auto_437932 ?auto_437937 ) ) ( not ( = ?auto_437932 ?auto_437938 ) ) ( not ( = ?auto_437932 ?auto_437939 ) ) ( not ( = ?auto_437932 ?auto_437940 ) ) ( not ( = ?auto_437932 ?auto_437941 ) ) ( not ( = ?auto_437932 ?auto_437942 ) ) ( not ( = ?auto_437932 ?auto_437943 ) ) ( not ( = ?auto_437932 ?auto_437944 ) ) ( not ( = ?auto_437933 ?auto_437934 ) ) ( not ( = ?auto_437933 ?auto_437935 ) ) ( not ( = ?auto_437933 ?auto_437936 ) ) ( not ( = ?auto_437933 ?auto_437937 ) ) ( not ( = ?auto_437933 ?auto_437938 ) ) ( not ( = ?auto_437933 ?auto_437939 ) ) ( not ( = ?auto_437933 ?auto_437940 ) ) ( not ( = ?auto_437933 ?auto_437941 ) ) ( not ( = ?auto_437933 ?auto_437942 ) ) ( not ( = ?auto_437933 ?auto_437943 ) ) ( not ( = ?auto_437933 ?auto_437944 ) ) ( not ( = ?auto_437934 ?auto_437935 ) ) ( not ( = ?auto_437934 ?auto_437936 ) ) ( not ( = ?auto_437934 ?auto_437937 ) ) ( not ( = ?auto_437934 ?auto_437938 ) ) ( not ( = ?auto_437934 ?auto_437939 ) ) ( not ( = ?auto_437934 ?auto_437940 ) ) ( not ( = ?auto_437934 ?auto_437941 ) ) ( not ( = ?auto_437934 ?auto_437942 ) ) ( not ( = ?auto_437934 ?auto_437943 ) ) ( not ( = ?auto_437934 ?auto_437944 ) ) ( not ( = ?auto_437935 ?auto_437936 ) ) ( not ( = ?auto_437935 ?auto_437937 ) ) ( not ( = ?auto_437935 ?auto_437938 ) ) ( not ( = ?auto_437935 ?auto_437939 ) ) ( not ( = ?auto_437935 ?auto_437940 ) ) ( not ( = ?auto_437935 ?auto_437941 ) ) ( not ( = ?auto_437935 ?auto_437942 ) ) ( not ( = ?auto_437935 ?auto_437943 ) ) ( not ( = ?auto_437935 ?auto_437944 ) ) ( not ( = ?auto_437936 ?auto_437937 ) ) ( not ( = ?auto_437936 ?auto_437938 ) ) ( not ( = ?auto_437936 ?auto_437939 ) ) ( not ( = ?auto_437936 ?auto_437940 ) ) ( not ( = ?auto_437936 ?auto_437941 ) ) ( not ( = ?auto_437936 ?auto_437942 ) ) ( not ( = ?auto_437936 ?auto_437943 ) ) ( not ( = ?auto_437936 ?auto_437944 ) ) ( not ( = ?auto_437937 ?auto_437938 ) ) ( not ( = ?auto_437937 ?auto_437939 ) ) ( not ( = ?auto_437937 ?auto_437940 ) ) ( not ( = ?auto_437937 ?auto_437941 ) ) ( not ( = ?auto_437937 ?auto_437942 ) ) ( not ( = ?auto_437937 ?auto_437943 ) ) ( not ( = ?auto_437937 ?auto_437944 ) ) ( not ( = ?auto_437938 ?auto_437939 ) ) ( not ( = ?auto_437938 ?auto_437940 ) ) ( not ( = ?auto_437938 ?auto_437941 ) ) ( not ( = ?auto_437938 ?auto_437942 ) ) ( not ( = ?auto_437938 ?auto_437943 ) ) ( not ( = ?auto_437938 ?auto_437944 ) ) ( not ( = ?auto_437939 ?auto_437940 ) ) ( not ( = ?auto_437939 ?auto_437941 ) ) ( not ( = ?auto_437939 ?auto_437942 ) ) ( not ( = ?auto_437939 ?auto_437943 ) ) ( not ( = ?auto_437939 ?auto_437944 ) ) ( not ( = ?auto_437940 ?auto_437941 ) ) ( not ( = ?auto_437940 ?auto_437942 ) ) ( not ( = ?auto_437940 ?auto_437943 ) ) ( not ( = ?auto_437940 ?auto_437944 ) ) ( not ( = ?auto_437941 ?auto_437942 ) ) ( not ( = ?auto_437941 ?auto_437943 ) ) ( not ( = ?auto_437941 ?auto_437944 ) ) ( not ( = ?auto_437942 ?auto_437943 ) ) ( not ( = ?auto_437942 ?auto_437944 ) ) ( not ( = ?auto_437943 ?auto_437944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_437943 ?auto_437944 )
      ( !STACK ?auto_437943 ?auto_437942 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_437960 - BLOCK
      ?auto_437961 - BLOCK
      ?auto_437962 - BLOCK
      ?auto_437963 - BLOCK
      ?auto_437964 - BLOCK
      ?auto_437965 - BLOCK
      ?auto_437966 - BLOCK
      ?auto_437967 - BLOCK
      ?auto_437968 - BLOCK
      ?auto_437969 - BLOCK
      ?auto_437970 - BLOCK
      ?auto_437971 - BLOCK
      ?auto_437972 - BLOCK
      ?auto_437973 - BLOCK
      ?auto_437974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_437973 ) ( ON-TABLE ?auto_437974 ) ( CLEAR ?auto_437974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_437960 ) ( ON ?auto_437961 ?auto_437960 ) ( ON ?auto_437962 ?auto_437961 ) ( ON ?auto_437963 ?auto_437962 ) ( ON ?auto_437964 ?auto_437963 ) ( ON ?auto_437965 ?auto_437964 ) ( ON ?auto_437966 ?auto_437965 ) ( ON ?auto_437967 ?auto_437966 ) ( ON ?auto_437968 ?auto_437967 ) ( ON ?auto_437969 ?auto_437968 ) ( ON ?auto_437970 ?auto_437969 ) ( ON ?auto_437971 ?auto_437970 ) ( ON ?auto_437972 ?auto_437971 ) ( ON ?auto_437973 ?auto_437972 ) ( not ( = ?auto_437960 ?auto_437961 ) ) ( not ( = ?auto_437960 ?auto_437962 ) ) ( not ( = ?auto_437960 ?auto_437963 ) ) ( not ( = ?auto_437960 ?auto_437964 ) ) ( not ( = ?auto_437960 ?auto_437965 ) ) ( not ( = ?auto_437960 ?auto_437966 ) ) ( not ( = ?auto_437960 ?auto_437967 ) ) ( not ( = ?auto_437960 ?auto_437968 ) ) ( not ( = ?auto_437960 ?auto_437969 ) ) ( not ( = ?auto_437960 ?auto_437970 ) ) ( not ( = ?auto_437960 ?auto_437971 ) ) ( not ( = ?auto_437960 ?auto_437972 ) ) ( not ( = ?auto_437960 ?auto_437973 ) ) ( not ( = ?auto_437960 ?auto_437974 ) ) ( not ( = ?auto_437961 ?auto_437962 ) ) ( not ( = ?auto_437961 ?auto_437963 ) ) ( not ( = ?auto_437961 ?auto_437964 ) ) ( not ( = ?auto_437961 ?auto_437965 ) ) ( not ( = ?auto_437961 ?auto_437966 ) ) ( not ( = ?auto_437961 ?auto_437967 ) ) ( not ( = ?auto_437961 ?auto_437968 ) ) ( not ( = ?auto_437961 ?auto_437969 ) ) ( not ( = ?auto_437961 ?auto_437970 ) ) ( not ( = ?auto_437961 ?auto_437971 ) ) ( not ( = ?auto_437961 ?auto_437972 ) ) ( not ( = ?auto_437961 ?auto_437973 ) ) ( not ( = ?auto_437961 ?auto_437974 ) ) ( not ( = ?auto_437962 ?auto_437963 ) ) ( not ( = ?auto_437962 ?auto_437964 ) ) ( not ( = ?auto_437962 ?auto_437965 ) ) ( not ( = ?auto_437962 ?auto_437966 ) ) ( not ( = ?auto_437962 ?auto_437967 ) ) ( not ( = ?auto_437962 ?auto_437968 ) ) ( not ( = ?auto_437962 ?auto_437969 ) ) ( not ( = ?auto_437962 ?auto_437970 ) ) ( not ( = ?auto_437962 ?auto_437971 ) ) ( not ( = ?auto_437962 ?auto_437972 ) ) ( not ( = ?auto_437962 ?auto_437973 ) ) ( not ( = ?auto_437962 ?auto_437974 ) ) ( not ( = ?auto_437963 ?auto_437964 ) ) ( not ( = ?auto_437963 ?auto_437965 ) ) ( not ( = ?auto_437963 ?auto_437966 ) ) ( not ( = ?auto_437963 ?auto_437967 ) ) ( not ( = ?auto_437963 ?auto_437968 ) ) ( not ( = ?auto_437963 ?auto_437969 ) ) ( not ( = ?auto_437963 ?auto_437970 ) ) ( not ( = ?auto_437963 ?auto_437971 ) ) ( not ( = ?auto_437963 ?auto_437972 ) ) ( not ( = ?auto_437963 ?auto_437973 ) ) ( not ( = ?auto_437963 ?auto_437974 ) ) ( not ( = ?auto_437964 ?auto_437965 ) ) ( not ( = ?auto_437964 ?auto_437966 ) ) ( not ( = ?auto_437964 ?auto_437967 ) ) ( not ( = ?auto_437964 ?auto_437968 ) ) ( not ( = ?auto_437964 ?auto_437969 ) ) ( not ( = ?auto_437964 ?auto_437970 ) ) ( not ( = ?auto_437964 ?auto_437971 ) ) ( not ( = ?auto_437964 ?auto_437972 ) ) ( not ( = ?auto_437964 ?auto_437973 ) ) ( not ( = ?auto_437964 ?auto_437974 ) ) ( not ( = ?auto_437965 ?auto_437966 ) ) ( not ( = ?auto_437965 ?auto_437967 ) ) ( not ( = ?auto_437965 ?auto_437968 ) ) ( not ( = ?auto_437965 ?auto_437969 ) ) ( not ( = ?auto_437965 ?auto_437970 ) ) ( not ( = ?auto_437965 ?auto_437971 ) ) ( not ( = ?auto_437965 ?auto_437972 ) ) ( not ( = ?auto_437965 ?auto_437973 ) ) ( not ( = ?auto_437965 ?auto_437974 ) ) ( not ( = ?auto_437966 ?auto_437967 ) ) ( not ( = ?auto_437966 ?auto_437968 ) ) ( not ( = ?auto_437966 ?auto_437969 ) ) ( not ( = ?auto_437966 ?auto_437970 ) ) ( not ( = ?auto_437966 ?auto_437971 ) ) ( not ( = ?auto_437966 ?auto_437972 ) ) ( not ( = ?auto_437966 ?auto_437973 ) ) ( not ( = ?auto_437966 ?auto_437974 ) ) ( not ( = ?auto_437967 ?auto_437968 ) ) ( not ( = ?auto_437967 ?auto_437969 ) ) ( not ( = ?auto_437967 ?auto_437970 ) ) ( not ( = ?auto_437967 ?auto_437971 ) ) ( not ( = ?auto_437967 ?auto_437972 ) ) ( not ( = ?auto_437967 ?auto_437973 ) ) ( not ( = ?auto_437967 ?auto_437974 ) ) ( not ( = ?auto_437968 ?auto_437969 ) ) ( not ( = ?auto_437968 ?auto_437970 ) ) ( not ( = ?auto_437968 ?auto_437971 ) ) ( not ( = ?auto_437968 ?auto_437972 ) ) ( not ( = ?auto_437968 ?auto_437973 ) ) ( not ( = ?auto_437968 ?auto_437974 ) ) ( not ( = ?auto_437969 ?auto_437970 ) ) ( not ( = ?auto_437969 ?auto_437971 ) ) ( not ( = ?auto_437969 ?auto_437972 ) ) ( not ( = ?auto_437969 ?auto_437973 ) ) ( not ( = ?auto_437969 ?auto_437974 ) ) ( not ( = ?auto_437970 ?auto_437971 ) ) ( not ( = ?auto_437970 ?auto_437972 ) ) ( not ( = ?auto_437970 ?auto_437973 ) ) ( not ( = ?auto_437970 ?auto_437974 ) ) ( not ( = ?auto_437971 ?auto_437972 ) ) ( not ( = ?auto_437971 ?auto_437973 ) ) ( not ( = ?auto_437971 ?auto_437974 ) ) ( not ( = ?auto_437972 ?auto_437973 ) ) ( not ( = ?auto_437972 ?auto_437974 ) ) ( not ( = ?auto_437973 ?auto_437974 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_437974 )
      ( !STACK ?auto_437974 ?auto_437973 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_437990 - BLOCK
      ?auto_437991 - BLOCK
      ?auto_437992 - BLOCK
      ?auto_437993 - BLOCK
      ?auto_437994 - BLOCK
      ?auto_437995 - BLOCK
      ?auto_437996 - BLOCK
      ?auto_437997 - BLOCK
      ?auto_437998 - BLOCK
      ?auto_437999 - BLOCK
      ?auto_438000 - BLOCK
      ?auto_438001 - BLOCK
      ?auto_438002 - BLOCK
      ?auto_438003 - BLOCK
      ?auto_438004 - BLOCK
    )
    :vars
    (
      ?auto_438005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438004 ?auto_438005 ) ( ON-TABLE ?auto_437990 ) ( ON ?auto_437991 ?auto_437990 ) ( ON ?auto_437992 ?auto_437991 ) ( ON ?auto_437993 ?auto_437992 ) ( ON ?auto_437994 ?auto_437993 ) ( ON ?auto_437995 ?auto_437994 ) ( ON ?auto_437996 ?auto_437995 ) ( ON ?auto_437997 ?auto_437996 ) ( ON ?auto_437998 ?auto_437997 ) ( ON ?auto_437999 ?auto_437998 ) ( ON ?auto_438000 ?auto_437999 ) ( ON ?auto_438001 ?auto_438000 ) ( ON ?auto_438002 ?auto_438001 ) ( not ( = ?auto_437990 ?auto_437991 ) ) ( not ( = ?auto_437990 ?auto_437992 ) ) ( not ( = ?auto_437990 ?auto_437993 ) ) ( not ( = ?auto_437990 ?auto_437994 ) ) ( not ( = ?auto_437990 ?auto_437995 ) ) ( not ( = ?auto_437990 ?auto_437996 ) ) ( not ( = ?auto_437990 ?auto_437997 ) ) ( not ( = ?auto_437990 ?auto_437998 ) ) ( not ( = ?auto_437990 ?auto_437999 ) ) ( not ( = ?auto_437990 ?auto_438000 ) ) ( not ( = ?auto_437990 ?auto_438001 ) ) ( not ( = ?auto_437990 ?auto_438002 ) ) ( not ( = ?auto_437990 ?auto_438003 ) ) ( not ( = ?auto_437990 ?auto_438004 ) ) ( not ( = ?auto_437990 ?auto_438005 ) ) ( not ( = ?auto_437991 ?auto_437992 ) ) ( not ( = ?auto_437991 ?auto_437993 ) ) ( not ( = ?auto_437991 ?auto_437994 ) ) ( not ( = ?auto_437991 ?auto_437995 ) ) ( not ( = ?auto_437991 ?auto_437996 ) ) ( not ( = ?auto_437991 ?auto_437997 ) ) ( not ( = ?auto_437991 ?auto_437998 ) ) ( not ( = ?auto_437991 ?auto_437999 ) ) ( not ( = ?auto_437991 ?auto_438000 ) ) ( not ( = ?auto_437991 ?auto_438001 ) ) ( not ( = ?auto_437991 ?auto_438002 ) ) ( not ( = ?auto_437991 ?auto_438003 ) ) ( not ( = ?auto_437991 ?auto_438004 ) ) ( not ( = ?auto_437991 ?auto_438005 ) ) ( not ( = ?auto_437992 ?auto_437993 ) ) ( not ( = ?auto_437992 ?auto_437994 ) ) ( not ( = ?auto_437992 ?auto_437995 ) ) ( not ( = ?auto_437992 ?auto_437996 ) ) ( not ( = ?auto_437992 ?auto_437997 ) ) ( not ( = ?auto_437992 ?auto_437998 ) ) ( not ( = ?auto_437992 ?auto_437999 ) ) ( not ( = ?auto_437992 ?auto_438000 ) ) ( not ( = ?auto_437992 ?auto_438001 ) ) ( not ( = ?auto_437992 ?auto_438002 ) ) ( not ( = ?auto_437992 ?auto_438003 ) ) ( not ( = ?auto_437992 ?auto_438004 ) ) ( not ( = ?auto_437992 ?auto_438005 ) ) ( not ( = ?auto_437993 ?auto_437994 ) ) ( not ( = ?auto_437993 ?auto_437995 ) ) ( not ( = ?auto_437993 ?auto_437996 ) ) ( not ( = ?auto_437993 ?auto_437997 ) ) ( not ( = ?auto_437993 ?auto_437998 ) ) ( not ( = ?auto_437993 ?auto_437999 ) ) ( not ( = ?auto_437993 ?auto_438000 ) ) ( not ( = ?auto_437993 ?auto_438001 ) ) ( not ( = ?auto_437993 ?auto_438002 ) ) ( not ( = ?auto_437993 ?auto_438003 ) ) ( not ( = ?auto_437993 ?auto_438004 ) ) ( not ( = ?auto_437993 ?auto_438005 ) ) ( not ( = ?auto_437994 ?auto_437995 ) ) ( not ( = ?auto_437994 ?auto_437996 ) ) ( not ( = ?auto_437994 ?auto_437997 ) ) ( not ( = ?auto_437994 ?auto_437998 ) ) ( not ( = ?auto_437994 ?auto_437999 ) ) ( not ( = ?auto_437994 ?auto_438000 ) ) ( not ( = ?auto_437994 ?auto_438001 ) ) ( not ( = ?auto_437994 ?auto_438002 ) ) ( not ( = ?auto_437994 ?auto_438003 ) ) ( not ( = ?auto_437994 ?auto_438004 ) ) ( not ( = ?auto_437994 ?auto_438005 ) ) ( not ( = ?auto_437995 ?auto_437996 ) ) ( not ( = ?auto_437995 ?auto_437997 ) ) ( not ( = ?auto_437995 ?auto_437998 ) ) ( not ( = ?auto_437995 ?auto_437999 ) ) ( not ( = ?auto_437995 ?auto_438000 ) ) ( not ( = ?auto_437995 ?auto_438001 ) ) ( not ( = ?auto_437995 ?auto_438002 ) ) ( not ( = ?auto_437995 ?auto_438003 ) ) ( not ( = ?auto_437995 ?auto_438004 ) ) ( not ( = ?auto_437995 ?auto_438005 ) ) ( not ( = ?auto_437996 ?auto_437997 ) ) ( not ( = ?auto_437996 ?auto_437998 ) ) ( not ( = ?auto_437996 ?auto_437999 ) ) ( not ( = ?auto_437996 ?auto_438000 ) ) ( not ( = ?auto_437996 ?auto_438001 ) ) ( not ( = ?auto_437996 ?auto_438002 ) ) ( not ( = ?auto_437996 ?auto_438003 ) ) ( not ( = ?auto_437996 ?auto_438004 ) ) ( not ( = ?auto_437996 ?auto_438005 ) ) ( not ( = ?auto_437997 ?auto_437998 ) ) ( not ( = ?auto_437997 ?auto_437999 ) ) ( not ( = ?auto_437997 ?auto_438000 ) ) ( not ( = ?auto_437997 ?auto_438001 ) ) ( not ( = ?auto_437997 ?auto_438002 ) ) ( not ( = ?auto_437997 ?auto_438003 ) ) ( not ( = ?auto_437997 ?auto_438004 ) ) ( not ( = ?auto_437997 ?auto_438005 ) ) ( not ( = ?auto_437998 ?auto_437999 ) ) ( not ( = ?auto_437998 ?auto_438000 ) ) ( not ( = ?auto_437998 ?auto_438001 ) ) ( not ( = ?auto_437998 ?auto_438002 ) ) ( not ( = ?auto_437998 ?auto_438003 ) ) ( not ( = ?auto_437998 ?auto_438004 ) ) ( not ( = ?auto_437998 ?auto_438005 ) ) ( not ( = ?auto_437999 ?auto_438000 ) ) ( not ( = ?auto_437999 ?auto_438001 ) ) ( not ( = ?auto_437999 ?auto_438002 ) ) ( not ( = ?auto_437999 ?auto_438003 ) ) ( not ( = ?auto_437999 ?auto_438004 ) ) ( not ( = ?auto_437999 ?auto_438005 ) ) ( not ( = ?auto_438000 ?auto_438001 ) ) ( not ( = ?auto_438000 ?auto_438002 ) ) ( not ( = ?auto_438000 ?auto_438003 ) ) ( not ( = ?auto_438000 ?auto_438004 ) ) ( not ( = ?auto_438000 ?auto_438005 ) ) ( not ( = ?auto_438001 ?auto_438002 ) ) ( not ( = ?auto_438001 ?auto_438003 ) ) ( not ( = ?auto_438001 ?auto_438004 ) ) ( not ( = ?auto_438001 ?auto_438005 ) ) ( not ( = ?auto_438002 ?auto_438003 ) ) ( not ( = ?auto_438002 ?auto_438004 ) ) ( not ( = ?auto_438002 ?auto_438005 ) ) ( not ( = ?auto_438003 ?auto_438004 ) ) ( not ( = ?auto_438003 ?auto_438005 ) ) ( not ( = ?auto_438004 ?auto_438005 ) ) ( CLEAR ?auto_438002 ) ( ON ?auto_438003 ?auto_438004 ) ( CLEAR ?auto_438003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_437990 ?auto_437991 ?auto_437992 ?auto_437993 ?auto_437994 ?auto_437995 ?auto_437996 ?auto_437997 ?auto_437998 ?auto_437999 ?auto_438000 ?auto_438001 ?auto_438002 ?auto_438003 )
      ( MAKE-15PILE ?auto_437990 ?auto_437991 ?auto_437992 ?auto_437993 ?auto_437994 ?auto_437995 ?auto_437996 ?auto_437997 ?auto_437998 ?auto_437999 ?auto_438000 ?auto_438001 ?auto_438002 ?auto_438003 ?auto_438004 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438021 - BLOCK
      ?auto_438022 - BLOCK
      ?auto_438023 - BLOCK
      ?auto_438024 - BLOCK
      ?auto_438025 - BLOCK
      ?auto_438026 - BLOCK
      ?auto_438027 - BLOCK
      ?auto_438028 - BLOCK
      ?auto_438029 - BLOCK
      ?auto_438030 - BLOCK
      ?auto_438031 - BLOCK
      ?auto_438032 - BLOCK
      ?auto_438033 - BLOCK
      ?auto_438034 - BLOCK
      ?auto_438035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438035 ) ( ON-TABLE ?auto_438021 ) ( ON ?auto_438022 ?auto_438021 ) ( ON ?auto_438023 ?auto_438022 ) ( ON ?auto_438024 ?auto_438023 ) ( ON ?auto_438025 ?auto_438024 ) ( ON ?auto_438026 ?auto_438025 ) ( ON ?auto_438027 ?auto_438026 ) ( ON ?auto_438028 ?auto_438027 ) ( ON ?auto_438029 ?auto_438028 ) ( ON ?auto_438030 ?auto_438029 ) ( ON ?auto_438031 ?auto_438030 ) ( ON ?auto_438032 ?auto_438031 ) ( ON ?auto_438033 ?auto_438032 ) ( not ( = ?auto_438021 ?auto_438022 ) ) ( not ( = ?auto_438021 ?auto_438023 ) ) ( not ( = ?auto_438021 ?auto_438024 ) ) ( not ( = ?auto_438021 ?auto_438025 ) ) ( not ( = ?auto_438021 ?auto_438026 ) ) ( not ( = ?auto_438021 ?auto_438027 ) ) ( not ( = ?auto_438021 ?auto_438028 ) ) ( not ( = ?auto_438021 ?auto_438029 ) ) ( not ( = ?auto_438021 ?auto_438030 ) ) ( not ( = ?auto_438021 ?auto_438031 ) ) ( not ( = ?auto_438021 ?auto_438032 ) ) ( not ( = ?auto_438021 ?auto_438033 ) ) ( not ( = ?auto_438021 ?auto_438034 ) ) ( not ( = ?auto_438021 ?auto_438035 ) ) ( not ( = ?auto_438022 ?auto_438023 ) ) ( not ( = ?auto_438022 ?auto_438024 ) ) ( not ( = ?auto_438022 ?auto_438025 ) ) ( not ( = ?auto_438022 ?auto_438026 ) ) ( not ( = ?auto_438022 ?auto_438027 ) ) ( not ( = ?auto_438022 ?auto_438028 ) ) ( not ( = ?auto_438022 ?auto_438029 ) ) ( not ( = ?auto_438022 ?auto_438030 ) ) ( not ( = ?auto_438022 ?auto_438031 ) ) ( not ( = ?auto_438022 ?auto_438032 ) ) ( not ( = ?auto_438022 ?auto_438033 ) ) ( not ( = ?auto_438022 ?auto_438034 ) ) ( not ( = ?auto_438022 ?auto_438035 ) ) ( not ( = ?auto_438023 ?auto_438024 ) ) ( not ( = ?auto_438023 ?auto_438025 ) ) ( not ( = ?auto_438023 ?auto_438026 ) ) ( not ( = ?auto_438023 ?auto_438027 ) ) ( not ( = ?auto_438023 ?auto_438028 ) ) ( not ( = ?auto_438023 ?auto_438029 ) ) ( not ( = ?auto_438023 ?auto_438030 ) ) ( not ( = ?auto_438023 ?auto_438031 ) ) ( not ( = ?auto_438023 ?auto_438032 ) ) ( not ( = ?auto_438023 ?auto_438033 ) ) ( not ( = ?auto_438023 ?auto_438034 ) ) ( not ( = ?auto_438023 ?auto_438035 ) ) ( not ( = ?auto_438024 ?auto_438025 ) ) ( not ( = ?auto_438024 ?auto_438026 ) ) ( not ( = ?auto_438024 ?auto_438027 ) ) ( not ( = ?auto_438024 ?auto_438028 ) ) ( not ( = ?auto_438024 ?auto_438029 ) ) ( not ( = ?auto_438024 ?auto_438030 ) ) ( not ( = ?auto_438024 ?auto_438031 ) ) ( not ( = ?auto_438024 ?auto_438032 ) ) ( not ( = ?auto_438024 ?auto_438033 ) ) ( not ( = ?auto_438024 ?auto_438034 ) ) ( not ( = ?auto_438024 ?auto_438035 ) ) ( not ( = ?auto_438025 ?auto_438026 ) ) ( not ( = ?auto_438025 ?auto_438027 ) ) ( not ( = ?auto_438025 ?auto_438028 ) ) ( not ( = ?auto_438025 ?auto_438029 ) ) ( not ( = ?auto_438025 ?auto_438030 ) ) ( not ( = ?auto_438025 ?auto_438031 ) ) ( not ( = ?auto_438025 ?auto_438032 ) ) ( not ( = ?auto_438025 ?auto_438033 ) ) ( not ( = ?auto_438025 ?auto_438034 ) ) ( not ( = ?auto_438025 ?auto_438035 ) ) ( not ( = ?auto_438026 ?auto_438027 ) ) ( not ( = ?auto_438026 ?auto_438028 ) ) ( not ( = ?auto_438026 ?auto_438029 ) ) ( not ( = ?auto_438026 ?auto_438030 ) ) ( not ( = ?auto_438026 ?auto_438031 ) ) ( not ( = ?auto_438026 ?auto_438032 ) ) ( not ( = ?auto_438026 ?auto_438033 ) ) ( not ( = ?auto_438026 ?auto_438034 ) ) ( not ( = ?auto_438026 ?auto_438035 ) ) ( not ( = ?auto_438027 ?auto_438028 ) ) ( not ( = ?auto_438027 ?auto_438029 ) ) ( not ( = ?auto_438027 ?auto_438030 ) ) ( not ( = ?auto_438027 ?auto_438031 ) ) ( not ( = ?auto_438027 ?auto_438032 ) ) ( not ( = ?auto_438027 ?auto_438033 ) ) ( not ( = ?auto_438027 ?auto_438034 ) ) ( not ( = ?auto_438027 ?auto_438035 ) ) ( not ( = ?auto_438028 ?auto_438029 ) ) ( not ( = ?auto_438028 ?auto_438030 ) ) ( not ( = ?auto_438028 ?auto_438031 ) ) ( not ( = ?auto_438028 ?auto_438032 ) ) ( not ( = ?auto_438028 ?auto_438033 ) ) ( not ( = ?auto_438028 ?auto_438034 ) ) ( not ( = ?auto_438028 ?auto_438035 ) ) ( not ( = ?auto_438029 ?auto_438030 ) ) ( not ( = ?auto_438029 ?auto_438031 ) ) ( not ( = ?auto_438029 ?auto_438032 ) ) ( not ( = ?auto_438029 ?auto_438033 ) ) ( not ( = ?auto_438029 ?auto_438034 ) ) ( not ( = ?auto_438029 ?auto_438035 ) ) ( not ( = ?auto_438030 ?auto_438031 ) ) ( not ( = ?auto_438030 ?auto_438032 ) ) ( not ( = ?auto_438030 ?auto_438033 ) ) ( not ( = ?auto_438030 ?auto_438034 ) ) ( not ( = ?auto_438030 ?auto_438035 ) ) ( not ( = ?auto_438031 ?auto_438032 ) ) ( not ( = ?auto_438031 ?auto_438033 ) ) ( not ( = ?auto_438031 ?auto_438034 ) ) ( not ( = ?auto_438031 ?auto_438035 ) ) ( not ( = ?auto_438032 ?auto_438033 ) ) ( not ( = ?auto_438032 ?auto_438034 ) ) ( not ( = ?auto_438032 ?auto_438035 ) ) ( not ( = ?auto_438033 ?auto_438034 ) ) ( not ( = ?auto_438033 ?auto_438035 ) ) ( not ( = ?auto_438034 ?auto_438035 ) ) ( CLEAR ?auto_438033 ) ( ON ?auto_438034 ?auto_438035 ) ( CLEAR ?auto_438034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_438021 ?auto_438022 ?auto_438023 ?auto_438024 ?auto_438025 ?auto_438026 ?auto_438027 ?auto_438028 ?auto_438029 ?auto_438030 ?auto_438031 ?auto_438032 ?auto_438033 ?auto_438034 )
      ( MAKE-15PILE ?auto_438021 ?auto_438022 ?auto_438023 ?auto_438024 ?auto_438025 ?auto_438026 ?auto_438027 ?auto_438028 ?auto_438029 ?auto_438030 ?auto_438031 ?auto_438032 ?auto_438033 ?auto_438034 ?auto_438035 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438051 - BLOCK
      ?auto_438052 - BLOCK
      ?auto_438053 - BLOCK
      ?auto_438054 - BLOCK
      ?auto_438055 - BLOCK
      ?auto_438056 - BLOCK
      ?auto_438057 - BLOCK
      ?auto_438058 - BLOCK
      ?auto_438059 - BLOCK
      ?auto_438060 - BLOCK
      ?auto_438061 - BLOCK
      ?auto_438062 - BLOCK
      ?auto_438063 - BLOCK
      ?auto_438064 - BLOCK
      ?auto_438065 - BLOCK
    )
    :vars
    (
      ?auto_438066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438065 ?auto_438066 ) ( ON-TABLE ?auto_438051 ) ( ON ?auto_438052 ?auto_438051 ) ( ON ?auto_438053 ?auto_438052 ) ( ON ?auto_438054 ?auto_438053 ) ( ON ?auto_438055 ?auto_438054 ) ( ON ?auto_438056 ?auto_438055 ) ( ON ?auto_438057 ?auto_438056 ) ( ON ?auto_438058 ?auto_438057 ) ( ON ?auto_438059 ?auto_438058 ) ( ON ?auto_438060 ?auto_438059 ) ( ON ?auto_438061 ?auto_438060 ) ( ON ?auto_438062 ?auto_438061 ) ( not ( = ?auto_438051 ?auto_438052 ) ) ( not ( = ?auto_438051 ?auto_438053 ) ) ( not ( = ?auto_438051 ?auto_438054 ) ) ( not ( = ?auto_438051 ?auto_438055 ) ) ( not ( = ?auto_438051 ?auto_438056 ) ) ( not ( = ?auto_438051 ?auto_438057 ) ) ( not ( = ?auto_438051 ?auto_438058 ) ) ( not ( = ?auto_438051 ?auto_438059 ) ) ( not ( = ?auto_438051 ?auto_438060 ) ) ( not ( = ?auto_438051 ?auto_438061 ) ) ( not ( = ?auto_438051 ?auto_438062 ) ) ( not ( = ?auto_438051 ?auto_438063 ) ) ( not ( = ?auto_438051 ?auto_438064 ) ) ( not ( = ?auto_438051 ?auto_438065 ) ) ( not ( = ?auto_438051 ?auto_438066 ) ) ( not ( = ?auto_438052 ?auto_438053 ) ) ( not ( = ?auto_438052 ?auto_438054 ) ) ( not ( = ?auto_438052 ?auto_438055 ) ) ( not ( = ?auto_438052 ?auto_438056 ) ) ( not ( = ?auto_438052 ?auto_438057 ) ) ( not ( = ?auto_438052 ?auto_438058 ) ) ( not ( = ?auto_438052 ?auto_438059 ) ) ( not ( = ?auto_438052 ?auto_438060 ) ) ( not ( = ?auto_438052 ?auto_438061 ) ) ( not ( = ?auto_438052 ?auto_438062 ) ) ( not ( = ?auto_438052 ?auto_438063 ) ) ( not ( = ?auto_438052 ?auto_438064 ) ) ( not ( = ?auto_438052 ?auto_438065 ) ) ( not ( = ?auto_438052 ?auto_438066 ) ) ( not ( = ?auto_438053 ?auto_438054 ) ) ( not ( = ?auto_438053 ?auto_438055 ) ) ( not ( = ?auto_438053 ?auto_438056 ) ) ( not ( = ?auto_438053 ?auto_438057 ) ) ( not ( = ?auto_438053 ?auto_438058 ) ) ( not ( = ?auto_438053 ?auto_438059 ) ) ( not ( = ?auto_438053 ?auto_438060 ) ) ( not ( = ?auto_438053 ?auto_438061 ) ) ( not ( = ?auto_438053 ?auto_438062 ) ) ( not ( = ?auto_438053 ?auto_438063 ) ) ( not ( = ?auto_438053 ?auto_438064 ) ) ( not ( = ?auto_438053 ?auto_438065 ) ) ( not ( = ?auto_438053 ?auto_438066 ) ) ( not ( = ?auto_438054 ?auto_438055 ) ) ( not ( = ?auto_438054 ?auto_438056 ) ) ( not ( = ?auto_438054 ?auto_438057 ) ) ( not ( = ?auto_438054 ?auto_438058 ) ) ( not ( = ?auto_438054 ?auto_438059 ) ) ( not ( = ?auto_438054 ?auto_438060 ) ) ( not ( = ?auto_438054 ?auto_438061 ) ) ( not ( = ?auto_438054 ?auto_438062 ) ) ( not ( = ?auto_438054 ?auto_438063 ) ) ( not ( = ?auto_438054 ?auto_438064 ) ) ( not ( = ?auto_438054 ?auto_438065 ) ) ( not ( = ?auto_438054 ?auto_438066 ) ) ( not ( = ?auto_438055 ?auto_438056 ) ) ( not ( = ?auto_438055 ?auto_438057 ) ) ( not ( = ?auto_438055 ?auto_438058 ) ) ( not ( = ?auto_438055 ?auto_438059 ) ) ( not ( = ?auto_438055 ?auto_438060 ) ) ( not ( = ?auto_438055 ?auto_438061 ) ) ( not ( = ?auto_438055 ?auto_438062 ) ) ( not ( = ?auto_438055 ?auto_438063 ) ) ( not ( = ?auto_438055 ?auto_438064 ) ) ( not ( = ?auto_438055 ?auto_438065 ) ) ( not ( = ?auto_438055 ?auto_438066 ) ) ( not ( = ?auto_438056 ?auto_438057 ) ) ( not ( = ?auto_438056 ?auto_438058 ) ) ( not ( = ?auto_438056 ?auto_438059 ) ) ( not ( = ?auto_438056 ?auto_438060 ) ) ( not ( = ?auto_438056 ?auto_438061 ) ) ( not ( = ?auto_438056 ?auto_438062 ) ) ( not ( = ?auto_438056 ?auto_438063 ) ) ( not ( = ?auto_438056 ?auto_438064 ) ) ( not ( = ?auto_438056 ?auto_438065 ) ) ( not ( = ?auto_438056 ?auto_438066 ) ) ( not ( = ?auto_438057 ?auto_438058 ) ) ( not ( = ?auto_438057 ?auto_438059 ) ) ( not ( = ?auto_438057 ?auto_438060 ) ) ( not ( = ?auto_438057 ?auto_438061 ) ) ( not ( = ?auto_438057 ?auto_438062 ) ) ( not ( = ?auto_438057 ?auto_438063 ) ) ( not ( = ?auto_438057 ?auto_438064 ) ) ( not ( = ?auto_438057 ?auto_438065 ) ) ( not ( = ?auto_438057 ?auto_438066 ) ) ( not ( = ?auto_438058 ?auto_438059 ) ) ( not ( = ?auto_438058 ?auto_438060 ) ) ( not ( = ?auto_438058 ?auto_438061 ) ) ( not ( = ?auto_438058 ?auto_438062 ) ) ( not ( = ?auto_438058 ?auto_438063 ) ) ( not ( = ?auto_438058 ?auto_438064 ) ) ( not ( = ?auto_438058 ?auto_438065 ) ) ( not ( = ?auto_438058 ?auto_438066 ) ) ( not ( = ?auto_438059 ?auto_438060 ) ) ( not ( = ?auto_438059 ?auto_438061 ) ) ( not ( = ?auto_438059 ?auto_438062 ) ) ( not ( = ?auto_438059 ?auto_438063 ) ) ( not ( = ?auto_438059 ?auto_438064 ) ) ( not ( = ?auto_438059 ?auto_438065 ) ) ( not ( = ?auto_438059 ?auto_438066 ) ) ( not ( = ?auto_438060 ?auto_438061 ) ) ( not ( = ?auto_438060 ?auto_438062 ) ) ( not ( = ?auto_438060 ?auto_438063 ) ) ( not ( = ?auto_438060 ?auto_438064 ) ) ( not ( = ?auto_438060 ?auto_438065 ) ) ( not ( = ?auto_438060 ?auto_438066 ) ) ( not ( = ?auto_438061 ?auto_438062 ) ) ( not ( = ?auto_438061 ?auto_438063 ) ) ( not ( = ?auto_438061 ?auto_438064 ) ) ( not ( = ?auto_438061 ?auto_438065 ) ) ( not ( = ?auto_438061 ?auto_438066 ) ) ( not ( = ?auto_438062 ?auto_438063 ) ) ( not ( = ?auto_438062 ?auto_438064 ) ) ( not ( = ?auto_438062 ?auto_438065 ) ) ( not ( = ?auto_438062 ?auto_438066 ) ) ( not ( = ?auto_438063 ?auto_438064 ) ) ( not ( = ?auto_438063 ?auto_438065 ) ) ( not ( = ?auto_438063 ?auto_438066 ) ) ( not ( = ?auto_438064 ?auto_438065 ) ) ( not ( = ?auto_438064 ?auto_438066 ) ) ( not ( = ?auto_438065 ?auto_438066 ) ) ( ON ?auto_438064 ?auto_438065 ) ( CLEAR ?auto_438062 ) ( ON ?auto_438063 ?auto_438064 ) ( CLEAR ?auto_438063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_438051 ?auto_438052 ?auto_438053 ?auto_438054 ?auto_438055 ?auto_438056 ?auto_438057 ?auto_438058 ?auto_438059 ?auto_438060 ?auto_438061 ?auto_438062 ?auto_438063 )
      ( MAKE-15PILE ?auto_438051 ?auto_438052 ?auto_438053 ?auto_438054 ?auto_438055 ?auto_438056 ?auto_438057 ?auto_438058 ?auto_438059 ?auto_438060 ?auto_438061 ?auto_438062 ?auto_438063 ?auto_438064 ?auto_438065 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438082 - BLOCK
      ?auto_438083 - BLOCK
      ?auto_438084 - BLOCK
      ?auto_438085 - BLOCK
      ?auto_438086 - BLOCK
      ?auto_438087 - BLOCK
      ?auto_438088 - BLOCK
      ?auto_438089 - BLOCK
      ?auto_438090 - BLOCK
      ?auto_438091 - BLOCK
      ?auto_438092 - BLOCK
      ?auto_438093 - BLOCK
      ?auto_438094 - BLOCK
      ?auto_438095 - BLOCK
      ?auto_438096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438096 ) ( ON-TABLE ?auto_438082 ) ( ON ?auto_438083 ?auto_438082 ) ( ON ?auto_438084 ?auto_438083 ) ( ON ?auto_438085 ?auto_438084 ) ( ON ?auto_438086 ?auto_438085 ) ( ON ?auto_438087 ?auto_438086 ) ( ON ?auto_438088 ?auto_438087 ) ( ON ?auto_438089 ?auto_438088 ) ( ON ?auto_438090 ?auto_438089 ) ( ON ?auto_438091 ?auto_438090 ) ( ON ?auto_438092 ?auto_438091 ) ( ON ?auto_438093 ?auto_438092 ) ( not ( = ?auto_438082 ?auto_438083 ) ) ( not ( = ?auto_438082 ?auto_438084 ) ) ( not ( = ?auto_438082 ?auto_438085 ) ) ( not ( = ?auto_438082 ?auto_438086 ) ) ( not ( = ?auto_438082 ?auto_438087 ) ) ( not ( = ?auto_438082 ?auto_438088 ) ) ( not ( = ?auto_438082 ?auto_438089 ) ) ( not ( = ?auto_438082 ?auto_438090 ) ) ( not ( = ?auto_438082 ?auto_438091 ) ) ( not ( = ?auto_438082 ?auto_438092 ) ) ( not ( = ?auto_438082 ?auto_438093 ) ) ( not ( = ?auto_438082 ?auto_438094 ) ) ( not ( = ?auto_438082 ?auto_438095 ) ) ( not ( = ?auto_438082 ?auto_438096 ) ) ( not ( = ?auto_438083 ?auto_438084 ) ) ( not ( = ?auto_438083 ?auto_438085 ) ) ( not ( = ?auto_438083 ?auto_438086 ) ) ( not ( = ?auto_438083 ?auto_438087 ) ) ( not ( = ?auto_438083 ?auto_438088 ) ) ( not ( = ?auto_438083 ?auto_438089 ) ) ( not ( = ?auto_438083 ?auto_438090 ) ) ( not ( = ?auto_438083 ?auto_438091 ) ) ( not ( = ?auto_438083 ?auto_438092 ) ) ( not ( = ?auto_438083 ?auto_438093 ) ) ( not ( = ?auto_438083 ?auto_438094 ) ) ( not ( = ?auto_438083 ?auto_438095 ) ) ( not ( = ?auto_438083 ?auto_438096 ) ) ( not ( = ?auto_438084 ?auto_438085 ) ) ( not ( = ?auto_438084 ?auto_438086 ) ) ( not ( = ?auto_438084 ?auto_438087 ) ) ( not ( = ?auto_438084 ?auto_438088 ) ) ( not ( = ?auto_438084 ?auto_438089 ) ) ( not ( = ?auto_438084 ?auto_438090 ) ) ( not ( = ?auto_438084 ?auto_438091 ) ) ( not ( = ?auto_438084 ?auto_438092 ) ) ( not ( = ?auto_438084 ?auto_438093 ) ) ( not ( = ?auto_438084 ?auto_438094 ) ) ( not ( = ?auto_438084 ?auto_438095 ) ) ( not ( = ?auto_438084 ?auto_438096 ) ) ( not ( = ?auto_438085 ?auto_438086 ) ) ( not ( = ?auto_438085 ?auto_438087 ) ) ( not ( = ?auto_438085 ?auto_438088 ) ) ( not ( = ?auto_438085 ?auto_438089 ) ) ( not ( = ?auto_438085 ?auto_438090 ) ) ( not ( = ?auto_438085 ?auto_438091 ) ) ( not ( = ?auto_438085 ?auto_438092 ) ) ( not ( = ?auto_438085 ?auto_438093 ) ) ( not ( = ?auto_438085 ?auto_438094 ) ) ( not ( = ?auto_438085 ?auto_438095 ) ) ( not ( = ?auto_438085 ?auto_438096 ) ) ( not ( = ?auto_438086 ?auto_438087 ) ) ( not ( = ?auto_438086 ?auto_438088 ) ) ( not ( = ?auto_438086 ?auto_438089 ) ) ( not ( = ?auto_438086 ?auto_438090 ) ) ( not ( = ?auto_438086 ?auto_438091 ) ) ( not ( = ?auto_438086 ?auto_438092 ) ) ( not ( = ?auto_438086 ?auto_438093 ) ) ( not ( = ?auto_438086 ?auto_438094 ) ) ( not ( = ?auto_438086 ?auto_438095 ) ) ( not ( = ?auto_438086 ?auto_438096 ) ) ( not ( = ?auto_438087 ?auto_438088 ) ) ( not ( = ?auto_438087 ?auto_438089 ) ) ( not ( = ?auto_438087 ?auto_438090 ) ) ( not ( = ?auto_438087 ?auto_438091 ) ) ( not ( = ?auto_438087 ?auto_438092 ) ) ( not ( = ?auto_438087 ?auto_438093 ) ) ( not ( = ?auto_438087 ?auto_438094 ) ) ( not ( = ?auto_438087 ?auto_438095 ) ) ( not ( = ?auto_438087 ?auto_438096 ) ) ( not ( = ?auto_438088 ?auto_438089 ) ) ( not ( = ?auto_438088 ?auto_438090 ) ) ( not ( = ?auto_438088 ?auto_438091 ) ) ( not ( = ?auto_438088 ?auto_438092 ) ) ( not ( = ?auto_438088 ?auto_438093 ) ) ( not ( = ?auto_438088 ?auto_438094 ) ) ( not ( = ?auto_438088 ?auto_438095 ) ) ( not ( = ?auto_438088 ?auto_438096 ) ) ( not ( = ?auto_438089 ?auto_438090 ) ) ( not ( = ?auto_438089 ?auto_438091 ) ) ( not ( = ?auto_438089 ?auto_438092 ) ) ( not ( = ?auto_438089 ?auto_438093 ) ) ( not ( = ?auto_438089 ?auto_438094 ) ) ( not ( = ?auto_438089 ?auto_438095 ) ) ( not ( = ?auto_438089 ?auto_438096 ) ) ( not ( = ?auto_438090 ?auto_438091 ) ) ( not ( = ?auto_438090 ?auto_438092 ) ) ( not ( = ?auto_438090 ?auto_438093 ) ) ( not ( = ?auto_438090 ?auto_438094 ) ) ( not ( = ?auto_438090 ?auto_438095 ) ) ( not ( = ?auto_438090 ?auto_438096 ) ) ( not ( = ?auto_438091 ?auto_438092 ) ) ( not ( = ?auto_438091 ?auto_438093 ) ) ( not ( = ?auto_438091 ?auto_438094 ) ) ( not ( = ?auto_438091 ?auto_438095 ) ) ( not ( = ?auto_438091 ?auto_438096 ) ) ( not ( = ?auto_438092 ?auto_438093 ) ) ( not ( = ?auto_438092 ?auto_438094 ) ) ( not ( = ?auto_438092 ?auto_438095 ) ) ( not ( = ?auto_438092 ?auto_438096 ) ) ( not ( = ?auto_438093 ?auto_438094 ) ) ( not ( = ?auto_438093 ?auto_438095 ) ) ( not ( = ?auto_438093 ?auto_438096 ) ) ( not ( = ?auto_438094 ?auto_438095 ) ) ( not ( = ?auto_438094 ?auto_438096 ) ) ( not ( = ?auto_438095 ?auto_438096 ) ) ( ON ?auto_438095 ?auto_438096 ) ( CLEAR ?auto_438093 ) ( ON ?auto_438094 ?auto_438095 ) ( CLEAR ?auto_438094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_438082 ?auto_438083 ?auto_438084 ?auto_438085 ?auto_438086 ?auto_438087 ?auto_438088 ?auto_438089 ?auto_438090 ?auto_438091 ?auto_438092 ?auto_438093 ?auto_438094 )
      ( MAKE-15PILE ?auto_438082 ?auto_438083 ?auto_438084 ?auto_438085 ?auto_438086 ?auto_438087 ?auto_438088 ?auto_438089 ?auto_438090 ?auto_438091 ?auto_438092 ?auto_438093 ?auto_438094 ?auto_438095 ?auto_438096 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438112 - BLOCK
      ?auto_438113 - BLOCK
      ?auto_438114 - BLOCK
      ?auto_438115 - BLOCK
      ?auto_438116 - BLOCK
      ?auto_438117 - BLOCK
      ?auto_438118 - BLOCK
      ?auto_438119 - BLOCK
      ?auto_438120 - BLOCK
      ?auto_438121 - BLOCK
      ?auto_438122 - BLOCK
      ?auto_438123 - BLOCK
      ?auto_438124 - BLOCK
      ?auto_438125 - BLOCK
      ?auto_438126 - BLOCK
    )
    :vars
    (
      ?auto_438127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438126 ?auto_438127 ) ( ON-TABLE ?auto_438112 ) ( ON ?auto_438113 ?auto_438112 ) ( ON ?auto_438114 ?auto_438113 ) ( ON ?auto_438115 ?auto_438114 ) ( ON ?auto_438116 ?auto_438115 ) ( ON ?auto_438117 ?auto_438116 ) ( ON ?auto_438118 ?auto_438117 ) ( ON ?auto_438119 ?auto_438118 ) ( ON ?auto_438120 ?auto_438119 ) ( ON ?auto_438121 ?auto_438120 ) ( ON ?auto_438122 ?auto_438121 ) ( not ( = ?auto_438112 ?auto_438113 ) ) ( not ( = ?auto_438112 ?auto_438114 ) ) ( not ( = ?auto_438112 ?auto_438115 ) ) ( not ( = ?auto_438112 ?auto_438116 ) ) ( not ( = ?auto_438112 ?auto_438117 ) ) ( not ( = ?auto_438112 ?auto_438118 ) ) ( not ( = ?auto_438112 ?auto_438119 ) ) ( not ( = ?auto_438112 ?auto_438120 ) ) ( not ( = ?auto_438112 ?auto_438121 ) ) ( not ( = ?auto_438112 ?auto_438122 ) ) ( not ( = ?auto_438112 ?auto_438123 ) ) ( not ( = ?auto_438112 ?auto_438124 ) ) ( not ( = ?auto_438112 ?auto_438125 ) ) ( not ( = ?auto_438112 ?auto_438126 ) ) ( not ( = ?auto_438112 ?auto_438127 ) ) ( not ( = ?auto_438113 ?auto_438114 ) ) ( not ( = ?auto_438113 ?auto_438115 ) ) ( not ( = ?auto_438113 ?auto_438116 ) ) ( not ( = ?auto_438113 ?auto_438117 ) ) ( not ( = ?auto_438113 ?auto_438118 ) ) ( not ( = ?auto_438113 ?auto_438119 ) ) ( not ( = ?auto_438113 ?auto_438120 ) ) ( not ( = ?auto_438113 ?auto_438121 ) ) ( not ( = ?auto_438113 ?auto_438122 ) ) ( not ( = ?auto_438113 ?auto_438123 ) ) ( not ( = ?auto_438113 ?auto_438124 ) ) ( not ( = ?auto_438113 ?auto_438125 ) ) ( not ( = ?auto_438113 ?auto_438126 ) ) ( not ( = ?auto_438113 ?auto_438127 ) ) ( not ( = ?auto_438114 ?auto_438115 ) ) ( not ( = ?auto_438114 ?auto_438116 ) ) ( not ( = ?auto_438114 ?auto_438117 ) ) ( not ( = ?auto_438114 ?auto_438118 ) ) ( not ( = ?auto_438114 ?auto_438119 ) ) ( not ( = ?auto_438114 ?auto_438120 ) ) ( not ( = ?auto_438114 ?auto_438121 ) ) ( not ( = ?auto_438114 ?auto_438122 ) ) ( not ( = ?auto_438114 ?auto_438123 ) ) ( not ( = ?auto_438114 ?auto_438124 ) ) ( not ( = ?auto_438114 ?auto_438125 ) ) ( not ( = ?auto_438114 ?auto_438126 ) ) ( not ( = ?auto_438114 ?auto_438127 ) ) ( not ( = ?auto_438115 ?auto_438116 ) ) ( not ( = ?auto_438115 ?auto_438117 ) ) ( not ( = ?auto_438115 ?auto_438118 ) ) ( not ( = ?auto_438115 ?auto_438119 ) ) ( not ( = ?auto_438115 ?auto_438120 ) ) ( not ( = ?auto_438115 ?auto_438121 ) ) ( not ( = ?auto_438115 ?auto_438122 ) ) ( not ( = ?auto_438115 ?auto_438123 ) ) ( not ( = ?auto_438115 ?auto_438124 ) ) ( not ( = ?auto_438115 ?auto_438125 ) ) ( not ( = ?auto_438115 ?auto_438126 ) ) ( not ( = ?auto_438115 ?auto_438127 ) ) ( not ( = ?auto_438116 ?auto_438117 ) ) ( not ( = ?auto_438116 ?auto_438118 ) ) ( not ( = ?auto_438116 ?auto_438119 ) ) ( not ( = ?auto_438116 ?auto_438120 ) ) ( not ( = ?auto_438116 ?auto_438121 ) ) ( not ( = ?auto_438116 ?auto_438122 ) ) ( not ( = ?auto_438116 ?auto_438123 ) ) ( not ( = ?auto_438116 ?auto_438124 ) ) ( not ( = ?auto_438116 ?auto_438125 ) ) ( not ( = ?auto_438116 ?auto_438126 ) ) ( not ( = ?auto_438116 ?auto_438127 ) ) ( not ( = ?auto_438117 ?auto_438118 ) ) ( not ( = ?auto_438117 ?auto_438119 ) ) ( not ( = ?auto_438117 ?auto_438120 ) ) ( not ( = ?auto_438117 ?auto_438121 ) ) ( not ( = ?auto_438117 ?auto_438122 ) ) ( not ( = ?auto_438117 ?auto_438123 ) ) ( not ( = ?auto_438117 ?auto_438124 ) ) ( not ( = ?auto_438117 ?auto_438125 ) ) ( not ( = ?auto_438117 ?auto_438126 ) ) ( not ( = ?auto_438117 ?auto_438127 ) ) ( not ( = ?auto_438118 ?auto_438119 ) ) ( not ( = ?auto_438118 ?auto_438120 ) ) ( not ( = ?auto_438118 ?auto_438121 ) ) ( not ( = ?auto_438118 ?auto_438122 ) ) ( not ( = ?auto_438118 ?auto_438123 ) ) ( not ( = ?auto_438118 ?auto_438124 ) ) ( not ( = ?auto_438118 ?auto_438125 ) ) ( not ( = ?auto_438118 ?auto_438126 ) ) ( not ( = ?auto_438118 ?auto_438127 ) ) ( not ( = ?auto_438119 ?auto_438120 ) ) ( not ( = ?auto_438119 ?auto_438121 ) ) ( not ( = ?auto_438119 ?auto_438122 ) ) ( not ( = ?auto_438119 ?auto_438123 ) ) ( not ( = ?auto_438119 ?auto_438124 ) ) ( not ( = ?auto_438119 ?auto_438125 ) ) ( not ( = ?auto_438119 ?auto_438126 ) ) ( not ( = ?auto_438119 ?auto_438127 ) ) ( not ( = ?auto_438120 ?auto_438121 ) ) ( not ( = ?auto_438120 ?auto_438122 ) ) ( not ( = ?auto_438120 ?auto_438123 ) ) ( not ( = ?auto_438120 ?auto_438124 ) ) ( not ( = ?auto_438120 ?auto_438125 ) ) ( not ( = ?auto_438120 ?auto_438126 ) ) ( not ( = ?auto_438120 ?auto_438127 ) ) ( not ( = ?auto_438121 ?auto_438122 ) ) ( not ( = ?auto_438121 ?auto_438123 ) ) ( not ( = ?auto_438121 ?auto_438124 ) ) ( not ( = ?auto_438121 ?auto_438125 ) ) ( not ( = ?auto_438121 ?auto_438126 ) ) ( not ( = ?auto_438121 ?auto_438127 ) ) ( not ( = ?auto_438122 ?auto_438123 ) ) ( not ( = ?auto_438122 ?auto_438124 ) ) ( not ( = ?auto_438122 ?auto_438125 ) ) ( not ( = ?auto_438122 ?auto_438126 ) ) ( not ( = ?auto_438122 ?auto_438127 ) ) ( not ( = ?auto_438123 ?auto_438124 ) ) ( not ( = ?auto_438123 ?auto_438125 ) ) ( not ( = ?auto_438123 ?auto_438126 ) ) ( not ( = ?auto_438123 ?auto_438127 ) ) ( not ( = ?auto_438124 ?auto_438125 ) ) ( not ( = ?auto_438124 ?auto_438126 ) ) ( not ( = ?auto_438124 ?auto_438127 ) ) ( not ( = ?auto_438125 ?auto_438126 ) ) ( not ( = ?auto_438125 ?auto_438127 ) ) ( not ( = ?auto_438126 ?auto_438127 ) ) ( ON ?auto_438125 ?auto_438126 ) ( ON ?auto_438124 ?auto_438125 ) ( CLEAR ?auto_438122 ) ( ON ?auto_438123 ?auto_438124 ) ( CLEAR ?auto_438123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_438112 ?auto_438113 ?auto_438114 ?auto_438115 ?auto_438116 ?auto_438117 ?auto_438118 ?auto_438119 ?auto_438120 ?auto_438121 ?auto_438122 ?auto_438123 )
      ( MAKE-15PILE ?auto_438112 ?auto_438113 ?auto_438114 ?auto_438115 ?auto_438116 ?auto_438117 ?auto_438118 ?auto_438119 ?auto_438120 ?auto_438121 ?auto_438122 ?auto_438123 ?auto_438124 ?auto_438125 ?auto_438126 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438143 - BLOCK
      ?auto_438144 - BLOCK
      ?auto_438145 - BLOCK
      ?auto_438146 - BLOCK
      ?auto_438147 - BLOCK
      ?auto_438148 - BLOCK
      ?auto_438149 - BLOCK
      ?auto_438150 - BLOCK
      ?auto_438151 - BLOCK
      ?auto_438152 - BLOCK
      ?auto_438153 - BLOCK
      ?auto_438154 - BLOCK
      ?auto_438155 - BLOCK
      ?auto_438156 - BLOCK
      ?auto_438157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438157 ) ( ON-TABLE ?auto_438143 ) ( ON ?auto_438144 ?auto_438143 ) ( ON ?auto_438145 ?auto_438144 ) ( ON ?auto_438146 ?auto_438145 ) ( ON ?auto_438147 ?auto_438146 ) ( ON ?auto_438148 ?auto_438147 ) ( ON ?auto_438149 ?auto_438148 ) ( ON ?auto_438150 ?auto_438149 ) ( ON ?auto_438151 ?auto_438150 ) ( ON ?auto_438152 ?auto_438151 ) ( ON ?auto_438153 ?auto_438152 ) ( not ( = ?auto_438143 ?auto_438144 ) ) ( not ( = ?auto_438143 ?auto_438145 ) ) ( not ( = ?auto_438143 ?auto_438146 ) ) ( not ( = ?auto_438143 ?auto_438147 ) ) ( not ( = ?auto_438143 ?auto_438148 ) ) ( not ( = ?auto_438143 ?auto_438149 ) ) ( not ( = ?auto_438143 ?auto_438150 ) ) ( not ( = ?auto_438143 ?auto_438151 ) ) ( not ( = ?auto_438143 ?auto_438152 ) ) ( not ( = ?auto_438143 ?auto_438153 ) ) ( not ( = ?auto_438143 ?auto_438154 ) ) ( not ( = ?auto_438143 ?auto_438155 ) ) ( not ( = ?auto_438143 ?auto_438156 ) ) ( not ( = ?auto_438143 ?auto_438157 ) ) ( not ( = ?auto_438144 ?auto_438145 ) ) ( not ( = ?auto_438144 ?auto_438146 ) ) ( not ( = ?auto_438144 ?auto_438147 ) ) ( not ( = ?auto_438144 ?auto_438148 ) ) ( not ( = ?auto_438144 ?auto_438149 ) ) ( not ( = ?auto_438144 ?auto_438150 ) ) ( not ( = ?auto_438144 ?auto_438151 ) ) ( not ( = ?auto_438144 ?auto_438152 ) ) ( not ( = ?auto_438144 ?auto_438153 ) ) ( not ( = ?auto_438144 ?auto_438154 ) ) ( not ( = ?auto_438144 ?auto_438155 ) ) ( not ( = ?auto_438144 ?auto_438156 ) ) ( not ( = ?auto_438144 ?auto_438157 ) ) ( not ( = ?auto_438145 ?auto_438146 ) ) ( not ( = ?auto_438145 ?auto_438147 ) ) ( not ( = ?auto_438145 ?auto_438148 ) ) ( not ( = ?auto_438145 ?auto_438149 ) ) ( not ( = ?auto_438145 ?auto_438150 ) ) ( not ( = ?auto_438145 ?auto_438151 ) ) ( not ( = ?auto_438145 ?auto_438152 ) ) ( not ( = ?auto_438145 ?auto_438153 ) ) ( not ( = ?auto_438145 ?auto_438154 ) ) ( not ( = ?auto_438145 ?auto_438155 ) ) ( not ( = ?auto_438145 ?auto_438156 ) ) ( not ( = ?auto_438145 ?auto_438157 ) ) ( not ( = ?auto_438146 ?auto_438147 ) ) ( not ( = ?auto_438146 ?auto_438148 ) ) ( not ( = ?auto_438146 ?auto_438149 ) ) ( not ( = ?auto_438146 ?auto_438150 ) ) ( not ( = ?auto_438146 ?auto_438151 ) ) ( not ( = ?auto_438146 ?auto_438152 ) ) ( not ( = ?auto_438146 ?auto_438153 ) ) ( not ( = ?auto_438146 ?auto_438154 ) ) ( not ( = ?auto_438146 ?auto_438155 ) ) ( not ( = ?auto_438146 ?auto_438156 ) ) ( not ( = ?auto_438146 ?auto_438157 ) ) ( not ( = ?auto_438147 ?auto_438148 ) ) ( not ( = ?auto_438147 ?auto_438149 ) ) ( not ( = ?auto_438147 ?auto_438150 ) ) ( not ( = ?auto_438147 ?auto_438151 ) ) ( not ( = ?auto_438147 ?auto_438152 ) ) ( not ( = ?auto_438147 ?auto_438153 ) ) ( not ( = ?auto_438147 ?auto_438154 ) ) ( not ( = ?auto_438147 ?auto_438155 ) ) ( not ( = ?auto_438147 ?auto_438156 ) ) ( not ( = ?auto_438147 ?auto_438157 ) ) ( not ( = ?auto_438148 ?auto_438149 ) ) ( not ( = ?auto_438148 ?auto_438150 ) ) ( not ( = ?auto_438148 ?auto_438151 ) ) ( not ( = ?auto_438148 ?auto_438152 ) ) ( not ( = ?auto_438148 ?auto_438153 ) ) ( not ( = ?auto_438148 ?auto_438154 ) ) ( not ( = ?auto_438148 ?auto_438155 ) ) ( not ( = ?auto_438148 ?auto_438156 ) ) ( not ( = ?auto_438148 ?auto_438157 ) ) ( not ( = ?auto_438149 ?auto_438150 ) ) ( not ( = ?auto_438149 ?auto_438151 ) ) ( not ( = ?auto_438149 ?auto_438152 ) ) ( not ( = ?auto_438149 ?auto_438153 ) ) ( not ( = ?auto_438149 ?auto_438154 ) ) ( not ( = ?auto_438149 ?auto_438155 ) ) ( not ( = ?auto_438149 ?auto_438156 ) ) ( not ( = ?auto_438149 ?auto_438157 ) ) ( not ( = ?auto_438150 ?auto_438151 ) ) ( not ( = ?auto_438150 ?auto_438152 ) ) ( not ( = ?auto_438150 ?auto_438153 ) ) ( not ( = ?auto_438150 ?auto_438154 ) ) ( not ( = ?auto_438150 ?auto_438155 ) ) ( not ( = ?auto_438150 ?auto_438156 ) ) ( not ( = ?auto_438150 ?auto_438157 ) ) ( not ( = ?auto_438151 ?auto_438152 ) ) ( not ( = ?auto_438151 ?auto_438153 ) ) ( not ( = ?auto_438151 ?auto_438154 ) ) ( not ( = ?auto_438151 ?auto_438155 ) ) ( not ( = ?auto_438151 ?auto_438156 ) ) ( not ( = ?auto_438151 ?auto_438157 ) ) ( not ( = ?auto_438152 ?auto_438153 ) ) ( not ( = ?auto_438152 ?auto_438154 ) ) ( not ( = ?auto_438152 ?auto_438155 ) ) ( not ( = ?auto_438152 ?auto_438156 ) ) ( not ( = ?auto_438152 ?auto_438157 ) ) ( not ( = ?auto_438153 ?auto_438154 ) ) ( not ( = ?auto_438153 ?auto_438155 ) ) ( not ( = ?auto_438153 ?auto_438156 ) ) ( not ( = ?auto_438153 ?auto_438157 ) ) ( not ( = ?auto_438154 ?auto_438155 ) ) ( not ( = ?auto_438154 ?auto_438156 ) ) ( not ( = ?auto_438154 ?auto_438157 ) ) ( not ( = ?auto_438155 ?auto_438156 ) ) ( not ( = ?auto_438155 ?auto_438157 ) ) ( not ( = ?auto_438156 ?auto_438157 ) ) ( ON ?auto_438156 ?auto_438157 ) ( ON ?auto_438155 ?auto_438156 ) ( CLEAR ?auto_438153 ) ( ON ?auto_438154 ?auto_438155 ) ( CLEAR ?auto_438154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_438143 ?auto_438144 ?auto_438145 ?auto_438146 ?auto_438147 ?auto_438148 ?auto_438149 ?auto_438150 ?auto_438151 ?auto_438152 ?auto_438153 ?auto_438154 )
      ( MAKE-15PILE ?auto_438143 ?auto_438144 ?auto_438145 ?auto_438146 ?auto_438147 ?auto_438148 ?auto_438149 ?auto_438150 ?auto_438151 ?auto_438152 ?auto_438153 ?auto_438154 ?auto_438155 ?auto_438156 ?auto_438157 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438173 - BLOCK
      ?auto_438174 - BLOCK
      ?auto_438175 - BLOCK
      ?auto_438176 - BLOCK
      ?auto_438177 - BLOCK
      ?auto_438178 - BLOCK
      ?auto_438179 - BLOCK
      ?auto_438180 - BLOCK
      ?auto_438181 - BLOCK
      ?auto_438182 - BLOCK
      ?auto_438183 - BLOCK
      ?auto_438184 - BLOCK
      ?auto_438185 - BLOCK
      ?auto_438186 - BLOCK
      ?auto_438187 - BLOCK
    )
    :vars
    (
      ?auto_438188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438187 ?auto_438188 ) ( ON-TABLE ?auto_438173 ) ( ON ?auto_438174 ?auto_438173 ) ( ON ?auto_438175 ?auto_438174 ) ( ON ?auto_438176 ?auto_438175 ) ( ON ?auto_438177 ?auto_438176 ) ( ON ?auto_438178 ?auto_438177 ) ( ON ?auto_438179 ?auto_438178 ) ( ON ?auto_438180 ?auto_438179 ) ( ON ?auto_438181 ?auto_438180 ) ( ON ?auto_438182 ?auto_438181 ) ( not ( = ?auto_438173 ?auto_438174 ) ) ( not ( = ?auto_438173 ?auto_438175 ) ) ( not ( = ?auto_438173 ?auto_438176 ) ) ( not ( = ?auto_438173 ?auto_438177 ) ) ( not ( = ?auto_438173 ?auto_438178 ) ) ( not ( = ?auto_438173 ?auto_438179 ) ) ( not ( = ?auto_438173 ?auto_438180 ) ) ( not ( = ?auto_438173 ?auto_438181 ) ) ( not ( = ?auto_438173 ?auto_438182 ) ) ( not ( = ?auto_438173 ?auto_438183 ) ) ( not ( = ?auto_438173 ?auto_438184 ) ) ( not ( = ?auto_438173 ?auto_438185 ) ) ( not ( = ?auto_438173 ?auto_438186 ) ) ( not ( = ?auto_438173 ?auto_438187 ) ) ( not ( = ?auto_438173 ?auto_438188 ) ) ( not ( = ?auto_438174 ?auto_438175 ) ) ( not ( = ?auto_438174 ?auto_438176 ) ) ( not ( = ?auto_438174 ?auto_438177 ) ) ( not ( = ?auto_438174 ?auto_438178 ) ) ( not ( = ?auto_438174 ?auto_438179 ) ) ( not ( = ?auto_438174 ?auto_438180 ) ) ( not ( = ?auto_438174 ?auto_438181 ) ) ( not ( = ?auto_438174 ?auto_438182 ) ) ( not ( = ?auto_438174 ?auto_438183 ) ) ( not ( = ?auto_438174 ?auto_438184 ) ) ( not ( = ?auto_438174 ?auto_438185 ) ) ( not ( = ?auto_438174 ?auto_438186 ) ) ( not ( = ?auto_438174 ?auto_438187 ) ) ( not ( = ?auto_438174 ?auto_438188 ) ) ( not ( = ?auto_438175 ?auto_438176 ) ) ( not ( = ?auto_438175 ?auto_438177 ) ) ( not ( = ?auto_438175 ?auto_438178 ) ) ( not ( = ?auto_438175 ?auto_438179 ) ) ( not ( = ?auto_438175 ?auto_438180 ) ) ( not ( = ?auto_438175 ?auto_438181 ) ) ( not ( = ?auto_438175 ?auto_438182 ) ) ( not ( = ?auto_438175 ?auto_438183 ) ) ( not ( = ?auto_438175 ?auto_438184 ) ) ( not ( = ?auto_438175 ?auto_438185 ) ) ( not ( = ?auto_438175 ?auto_438186 ) ) ( not ( = ?auto_438175 ?auto_438187 ) ) ( not ( = ?auto_438175 ?auto_438188 ) ) ( not ( = ?auto_438176 ?auto_438177 ) ) ( not ( = ?auto_438176 ?auto_438178 ) ) ( not ( = ?auto_438176 ?auto_438179 ) ) ( not ( = ?auto_438176 ?auto_438180 ) ) ( not ( = ?auto_438176 ?auto_438181 ) ) ( not ( = ?auto_438176 ?auto_438182 ) ) ( not ( = ?auto_438176 ?auto_438183 ) ) ( not ( = ?auto_438176 ?auto_438184 ) ) ( not ( = ?auto_438176 ?auto_438185 ) ) ( not ( = ?auto_438176 ?auto_438186 ) ) ( not ( = ?auto_438176 ?auto_438187 ) ) ( not ( = ?auto_438176 ?auto_438188 ) ) ( not ( = ?auto_438177 ?auto_438178 ) ) ( not ( = ?auto_438177 ?auto_438179 ) ) ( not ( = ?auto_438177 ?auto_438180 ) ) ( not ( = ?auto_438177 ?auto_438181 ) ) ( not ( = ?auto_438177 ?auto_438182 ) ) ( not ( = ?auto_438177 ?auto_438183 ) ) ( not ( = ?auto_438177 ?auto_438184 ) ) ( not ( = ?auto_438177 ?auto_438185 ) ) ( not ( = ?auto_438177 ?auto_438186 ) ) ( not ( = ?auto_438177 ?auto_438187 ) ) ( not ( = ?auto_438177 ?auto_438188 ) ) ( not ( = ?auto_438178 ?auto_438179 ) ) ( not ( = ?auto_438178 ?auto_438180 ) ) ( not ( = ?auto_438178 ?auto_438181 ) ) ( not ( = ?auto_438178 ?auto_438182 ) ) ( not ( = ?auto_438178 ?auto_438183 ) ) ( not ( = ?auto_438178 ?auto_438184 ) ) ( not ( = ?auto_438178 ?auto_438185 ) ) ( not ( = ?auto_438178 ?auto_438186 ) ) ( not ( = ?auto_438178 ?auto_438187 ) ) ( not ( = ?auto_438178 ?auto_438188 ) ) ( not ( = ?auto_438179 ?auto_438180 ) ) ( not ( = ?auto_438179 ?auto_438181 ) ) ( not ( = ?auto_438179 ?auto_438182 ) ) ( not ( = ?auto_438179 ?auto_438183 ) ) ( not ( = ?auto_438179 ?auto_438184 ) ) ( not ( = ?auto_438179 ?auto_438185 ) ) ( not ( = ?auto_438179 ?auto_438186 ) ) ( not ( = ?auto_438179 ?auto_438187 ) ) ( not ( = ?auto_438179 ?auto_438188 ) ) ( not ( = ?auto_438180 ?auto_438181 ) ) ( not ( = ?auto_438180 ?auto_438182 ) ) ( not ( = ?auto_438180 ?auto_438183 ) ) ( not ( = ?auto_438180 ?auto_438184 ) ) ( not ( = ?auto_438180 ?auto_438185 ) ) ( not ( = ?auto_438180 ?auto_438186 ) ) ( not ( = ?auto_438180 ?auto_438187 ) ) ( not ( = ?auto_438180 ?auto_438188 ) ) ( not ( = ?auto_438181 ?auto_438182 ) ) ( not ( = ?auto_438181 ?auto_438183 ) ) ( not ( = ?auto_438181 ?auto_438184 ) ) ( not ( = ?auto_438181 ?auto_438185 ) ) ( not ( = ?auto_438181 ?auto_438186 ) ) ( not ( = ?auto_438181 ?auto_438187 ) ) ( not ( = ?auto_438181 ?auto_438188 ) ) ( not ( = ?auto_438182 ?auto_438183 ) ) ( not ( = ?auto_438182 ?auto_438184 ) ) ( not ( = ?auto_438182 ?auto_438185 ) ) ( not ( = ?auto_438182 ?auto_438186 ) ) ( not ( = ?auto_438182 ?auto_438187 ) ) ( not ( = ?auto_438182 ?auto_438188 ) ) ( not ( = ?auto_438183 ?auto_438184 ) ) ( not ( = ?auto_438183 ?auto_438185 ) ) ( not ( = ?auto_438183 ?auto_438186 ) ) ( not ( = ?auto_438183 ?auto_438187 ) ) ( not ( = ?auto_438183 ?auto_438188 ) ) ( not ( = ?auto_438184 ?auto_438185 ) ) ( not ( = ?auto_438184 ?auto_438186 ) ) ( not ( = ?auto_438184 ?auto_438187 ) ) ( not ( = ?auto_438184 ?auto_438188 ) ) ( not ( = ?auto_438185 ?auto_438186 ) ) ( not ( = ?auto_438185 ?auto_438187 ) ) ( not ( = ?auto_438185 ?auto_438188 ) ) ( not ( = ?auto_438186 ?auto_438187 ) ) ( not ( = ?auto_438186 ?auto_438188 ) ) ( not ( = ?auto_438187 ?auto_438188 ) ) ( ON ?auto_438186 ?auto_438187 ) ( ON ?auto_438185 ?auto_438186 ) ( ON ?auto_438184 ?auto_438185 ) ( CLEAR ?auto_438182 ) ( ON ?auto_438183 ?auto_438184 ) ( CLEAR ?auto_438183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_438173 ?auto_438174 ?auto_438175 ?auto_438176 ?auto_438177 ?auto_438178 ?auto_438179 ?auto_438180 ?auto_438181 ?auto_438182 ?auto_438183 )
      ( MAKE-15PILE ?auto_438173 ?auto_438174 ?auto_438175 ?auto_438176 ?auto_438177 ?auto_438178 ?auto_438179 ?auto_438180 ?auto_438181 ?auto_438182 ?auto_438183 ?auto_438184 ?auto_438185 ?auto_438186 ?auto_438187 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438204 - BLOCK
      ?auto_438205 - BLOCK
      ?auto_438206 - BLOCK
      ?auto_438207 - BLOCK
      ?auto_438208 - BLOCK
      ?auto_438209 - BLOCK
      ?auto_438210 - BLOCK
      ?auto_438211 - BLOCK
      ?auto_438212 - BLOCK
      ?auto_438213 - BLOCK
      ?auto_438214 - BLOCK
      ?auto_438215 - BLOCK
      ?auto_438216 - BLOCK
      ?auto_438217 - BLOCK
      ?auto_438218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438218 ) ( ON-TABLE ?auto_438204 ) ( ON ?auto_438205 ?auto_438204 ) ( ON ?auto_438206 ?auto_438205 ) ( ON ?auto_438207 ?auto_438206 ) ( ON ?auto_438208 ?auto_438207 ) ( ON ?auto_438209 ?auto_438208 ) ( ON ?auto_438210 ?auto_438209 ) ( ON ?auto_438211 ?auto_438210 ) ( ON ?auto_438212 ?auto_438211 ) ( ON ?auto_438213 ?auto_438212 ) ( not ( = ?auto_438204 ?auto_438205 ) ) ( not ( = ?auto_438204 ?auto_438206 ) ) ( not ( = ?auto_438204 ?auto_438207 ) ) ( not ( = ?auto_438204 ?auto_438208 ) ) ( not ( = ?auto_438204 ?auto_438209 ) ) ( not ( = ?auto_438204 ?auto_438210 ) ) ( not ( = ?auto_438204 ?auto_438211 ) ) ( not ( = ?auto_438204 ?auto_438212 ) ) ( not ( = ?auto_438204 ?auto_438213 ) ) ( not ( = ?auto_438204 ?auto_438214 ) ) ( not ( = ?auto_438204 ?auto_438215 ) ) ( not ( = ?auto_438204 ?auto_438216 ) ) ( not ( = ?auto_438204 ?auto_438217 ) ) ( not ( = ?auto_438204 ?auto_438218 ) ) ( not ( = ?auto_438205 ?auto_438206 ) ) ( not ( = ?auto_438205 ?auto_438207 ) ) ( not ( = ?auto_438205 ?auto_438208 ) ) ( not ( = ?auto_438205 ?auto_438209 ) ) ( not ( = ?auto_438205 ?auto_438210 ) ) ( not ( = ?auto_438205 ?auto_438211 ) ) ( not ( = ?auto_438205 ?auto_438212 ) ) ( not ( = ?auto_438205 ?auto_438213 ) ) ( not ( = ?auto_438205 ?auto_438214 ) ) ( not ( = ?auto_438205 ?auto_438215 ) ) ( not ( = ?auto_438205 ?auto_438216 ) ) ( not ( = ?auto_438205 ?auto_438217 ) ) ( not ( = ?auto_438205 ?auto_438218 ) ) ( not ( = ?auto_438206 ?auto_438207 ) ) ( not ( = ?auto_438206 ?auto_438208 ) ) ( not ( = ?auto_438206 ?auto_438209 ) ) ( not ( = ?auto_438206 ?auto_438210 ) ) ( not ( = ?auto_438206 ?auto_438211 ) ) ( not ( = ?auto_438206 ?auto_438212 ) ) ( not ( = ?auto_438206 ?auto_438213 ) ) ( not ( = ?auto_438206 ?auto_438214 ) ) ( not ( = ?auto_438206 ?auto_438215 ) ) ( not ( = ?auto_438206 ?auto_438216 ) ) ( not ( = ?auto_438206 ?auto_438217 ) ) ( not ( = ?auto_438206 ?auto_438218 ) ) ( not ( = ?auto_438207 ?auto_438208 ) ) ( not ( = ?auto_438207 ?auto_438209 ) ) ( not ( = ?auto_438207 ?auto_438210 ) ) ( not ( = ?auto_438207 ?auto_438211 ) ) ( not ( = ?auto_438207 ?auto_438212 ) ) ( not ( = ?auto_438207 ?auto_438213 ) ) ( not ( = ?auto_438207 ?auto_438214 ) ) ( not ( = ?auto_438207 ?auto_438215 ) ) ( not ( = ?auto_438207 ?auto_438216 ) ) ( not ( = ?auto_438207 ?auto_438217 ) ) ( not ( = ?auto_438207 ?auto_438218 ) ) ( not ( = ?auto_438208 ?auto_438209 ) ) ( not ( = ?auto_438208 ?auto_438210 ) ) ( not ( = ?auto_438208 ?auto_438211 ) ) ( not ( = ?auto_438208 ?auto_438212 ) ) ( not ( = ?auto_438208 ?auto_438213 ) ) ( not ( = ?auto_438208 ?auto_438214 ) ) ( not ( = ?auto_438208 ?auto_438215 ) ) ( not ( = ?auto_438208 ?auto_438216 ) ) ( not ( = ?auto_438208 ?auto_438217 ) ) ( not ( = ?auto_438208 ?auto_438218 ) ) ( not ( = ?auto_438209 ?auto_438210 ) ) ( not ( = ?auto_438209 ?auto_438211 ) ) ( not ( = ?auto_438209 ?auto_438212 ) ) ( not ( = ?auto_438209 ?auto_438213 ) ) ( not ( = ?auto_438209 ?auto_438214 ) ) ( not ( = ?auto_438209 ?auto_438215 ) ) ( not ( = ?auto_438209 ?auto_438216 ) ) ( not ( = ?auto_438209 ?auto_438217 ) ) ( not ( = ?auto_438209 ?auto_438218 ) ) ( not ( = ?auto_438210 ?auto_438211 ) ) ( not ( = ?auto_438210 ?auto_438212 ) ) ( not ( = ?auto_438210 ?auto_438213 ) ) ( not ( = ?auto_438210 ?auto_438214 ) ) ( not ( = ?auto_438210 ?auto_438215 ) ) ( not ( = ?auto_438210 ?auto_438216 ) ) ( not ( = ?auto_438210 ?auto_438217 ) ) ( not ( = ?auto_438210 ?auto_438218 ) ) ( not ( = ?auto_438211 ?auto_438212 ) ) ( not ( = ?auto_438211 ?auto_438213 ) ) ( not ( = ?auto_438211 ?auto_438214 ) ) ( not ( = ?auto_438211 ?auto_438215 ) ) ( not ( = ?auto_438211 ?auto_438216 ) ) ( not ( = ?auto_438211 ?auto_438217 ) ) ( not ( = ?auto_438211 ?auto_438218 ) ) ( not ( = ?auto_438212 ?auto_438213 ) ) ( not ( = ?auto_438212 ?auto_438214 ) ) ( not ( = ?auto_438212 ?auto_438215 ) ) ( not ( = ?auto_438212 ?auto_438216 ) ) ( not ( = ?auto_438212 ?auto_438217 ) ) ( not ( = ?auto_438212 ?auto_438218 ) ) ( not ( = ?auto_438213 ?auto_438214 ) ) ( not ( = ?auto_438213 ?auto_438215 ) ) ( not ( = ?auto_438213 ?auto_438216 ) ) ( not ( = ?auto_438213 ?auto_438217 ) ) ( not ( = ?auto_438213 ?auto_438218 ) ) ( not ( = ?auto_438214 ?auto_438215 ) ) ( not ( = ?auto_438214 ?auto_438216 ) ) ( not ( = ?auto_438214 ?auto_438217 ) ) ( not ( = ?auto_438214 ?auto_438218 ) ) ( not ( = ?auto_438215 ?auto_438216 ) ) ( not ( = ?auto_438215 ?auto_438217 ) ) ( not ( = ?auto_438215 ?auto_438218 ) ) ( not ( = ?auto_438216 ?auto_438217 ) ) ( not ( = ?auto_438216 ?auto_438218 ) ) ( not ( = ?auto_438217 ?auto_438218 ) ) ( ON ?auto_438217 ?auto_438218 ) ( ON ?auto_438216 ?auto_438217 ) ( ON ?auto_438215 ?auto_438216 ) ( CLEAR ?auto_438213 ) ( ON ?auto_438214 ?auto_438215 ) ( CLEAR ?auto_438214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_438204 ?auto_438205 ?auto_438206 ?auto_438207 ?auto_438208 ?auto_438209 ?auto_438210 ?auto_438211 ?auto_438212 ?auto_438213 ?auto_438214 )
      ( MAKE-15PILE ?auto_438204 ?auto_438205 ?auto_438206 ?auto_438207 ?auto_438208 ?auto_438209 ?auto_438210 ?auto_438211 ?auto_438212 ?auto_438213 ?auto_438214 ?auto_438215 ?auto_438216 ?auto_438217 ?auto_438218 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438234 - BLOCK
      ?auto_438235 - BLOCK
      ?auto_438236 - BLOCK
      ?auto_438237 - BLOCK
      ?auto_438238 - BLOCK
      ?auto_438239 - BLOCK
      ?auto_438240 - BLOCK
      ?auto_438241 - BLOCK
      ?auto_438242 - BLOCK
      ?auto_438243 - BLOCK
      ?auto_438244 - BLOCK
      ?auto_438245 - BLOCK
      ?auto_438246 - BLOCK
      ?auto_438247 - BLOCK
      ?auto_438248 - BLOCK
    )
    :vars
    (
      ?auto_438249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438248 ?auto_438249 ) ( ON-TABLE ?auto_438234 ) ( ON ?auto_438235 ?auto_438234 ) ( ON ?auto_438236 ?auto_438235 ) ( ON ?auto_438237 ?auto_438236 ) ( ON ?auto_438238 ?auto_438237 ) ( ON ?auto_438239 ?auto_438238 ) ( ON ?auto_438240 ?auto_438239 ) ( ON ?auto_438241 ?auto_438240 ) ( ON ?auto_438242 ?auto_438241 ) ( not ( = ?auto_438234 ?auto_438235 ) ) ( not ( = ?auto_438234 ?auto_438236 ) ) ( not ( = ?auto_438234 ?auto_438237 ) ) ( not ( = ?auto_438234 ?auto_438238 ) ) ( not ( = ?auto_438234 ?auto_438239 ) ) ( not ( = ?auto_438234 ?auto_438240 ) ) ( not ( = ?auto_438234 ?auto_438241 ) ) ( not ( = ?auto_438234 ?auto_438242 ) ) ( not ( = ?auto_438234 ?auto_438243 ) ) ( not ( = ?auto_438234 ?auto_438244 ) ) ( not ( = ?auto_438234 ?auto_438245 ) ) ( not ( = ?auto_438234 ?auto_438246 ) ) ( not ( = ?auto_438234 ?auto_438247 ) ) ( not ( = ?auto_438234 ?auto_438248 ) ) ( not ( = ?auto_438234 ?auto_438249 ) ) ( not ( = ?auto_438235 ?auto_438236 ) ) ( not ( = ?auto_438235 ?auto_438237 ) ) ( not ( = ?auto_438235 ?auto_438238 ) ) ( not ( = ?auto_438235 ?auto_438239 ) ) ( not ( = ?auto_438235 ?auto_438240 ) ) ( not ( = ?auto_438235 ?auto_438241 ) ) ( not ( = ?auto_438235 ?auto_438242 ) ) ( not ( = ?auto_438235 ?auto_438243 ) ) ( not ( = ?auto_438235 ?auto_438244 ) ) ( not ( = ?auto_438235 ?auto_438245 ) ) ( not ( = ?auto_438235 ?auto_438246 ) ) ( not ( = ?auto_438235 ?auto_438247 ) ) ( not ( = ?auto_438235 ?auto_438248 ) ) ( not ( = ?auto_438235 ?auto_438249 ) ) ( not ( = ?auto_438236 ?auto_438237 ) ) ( not ( = ?auto_438236 ?auto_438238 ) ) ( not ( = ?auto_438236 ?auto_438239 ) ) ( not ( = ?auto_438236 ?auto_438240 ) ) ( not ( = ?auto_438236 ?auto_438241 ) ) ( not ( = ?auto_438236 ?auto_438242 ) ) ( not ( = ?auto_438236 ?auto_438243 ) ) ( not ( = ?auto_438236 ?auto_438244 ) ) ( not ( = ?auto_438236 ?auto_438245 ) ) ( not ( = ?auto_438236 ?auto_438246 ) ) ( not ( = ?auto_438236 ?auto_438247 ) ) ( not ( = ?auto_438236 ?auto_438248 ) ) ( not ( = ?auto_438236 ?auto_438249 ) ) ( not ( = ?auto_438237 ?auto_438238 ) ) ( not ( = ?auto_438237 ?auto_438239 ) ) ( not ( = ?auto_438237 ?auto_438240 ) ) ( not ( = ?auto_438237 ?auto_438241 ) ) ( not ( = ?auto_438237 ?auto_438242 ) ) ( not ( = ?auto_438237 ?auto_438243 ) ) ( not ( = ?auto_438237 ?auto_438244 ) ) ( not ( = ?auto_438237 ?auto_438245 ) ) ( not ( = ?auto_438237 ?auto_438246 ) ) ( not ( = ?auto_438237 ?auto_438247 ) ) ( not ( = ?auto_438237 ?auto_438248 ) ) ( not ( = ?auto_438237 ?auto_438249 ) ) ( not ( = ?auto_438238 ?auto_438239 ) ) ( not ( = ?auto_438238 ?auto_438240 ) ) ( not ( = ?auto_438238 ?auto_438241 ) ) ( not ( = ?auto_438238 ?auto_438242 ) ) ( not ( = ?auto_438238 ?auto_438243 ) ) ( not ( = ?auto_438238 ?auto_438244 ) ) ( not ( = ?auto_438238 ?auto_438245 ) ) ( not ( = ?auto_438238 ?auto_438246 ) ) ( not ( = ?auto_438238 ?auto_438247 ) ) ( not ( = ?auto_438238 ?auto_438248 ) ) ( not ( = ?auto_438238 ?auto_438249 ) ) ( not ( = ?auto_438239 ?auto_438240 ) ) ( not ( = ?auto_438239 ?auto_438241 ) ) ( not ( = ?auto_438239 ?auto_438242 ) ) ( not ( = ?auto_438239 ?auto_438243 ) ) ( not ( = ?auto_438239 ?auto_438244 ) ) ( not ( = ?auto_438239 ?auto_438245 ) ) ( not ( = ?auto_438239 ?auto_438246 ) ) ( not ( = ?auto_438239 ?auto_438247 ) ) ( not ( = ?auto_438239 ?auto_438248 ) ) ( not ( = ?auto_438239 ?auto_438249 ) ) ( not ( = ?auto_438240 ?auto_438241 ) ) ( not ( = ?auto_438240 ?auto_438242 ) ) ( not ( = ?auto_438240 ?auto_438243 ) ) ( not ( = ?auto_438240 ?auto_438244 ) ) ( not ( = ?auto_438240 ?auto_438245 ) ) ( not ( = ?auto_438240 ?auto_438246 ) ) ( not ( = ?auto_438240 ?auto_438247 ) ) ( not ( = ?auto_438240 ?auto_438248 ) ) ( not ( = ?auto_438240 ?auto_438249 ) ) ( not ( = ?auto_438241 ?auto_438242 ) ) ( not ( = ?auto_438241 ?auto_438243 ) ) ( not ( = ?auto_438241 ?auto_438244 ) ) ( not ( = ?auto_438241 ?auto_438245 ) ) ( not ( = ?auto_438241 ?auto_438246 ) ) ( not ( = ?auto_438241 ?auto_438247 ) ) ( not ( = ?auto_438241 ?auto_438248 ) ) ( not ( = ?auto_438241 ?auto_438249 ) ) ( not ( = ?auto_438242 ?auto_438243 ) ) ( not ( = ?auto_438242 ?auto_438244 ) ) ( not ( = ?auto_438242 ?auto_438245 ) ) ( not ( = ?auto_438242 ?auto_438246 ) ) ( not ( = ?auto_438242 ?auto_438247 ) ) ( not ( = ?auto_438242 ?auto_438248 ) ) ( not ( = ?auto_438242 ?auto_438249 ) ) ( not ( = ?auto_438243 ?auto_438244 ) ) ( not ( = ?auto_438243 ?auto_438245 ) ) ( not ( = ?auto_438243 ?auto_438246 ) ) ( not ( = ?auto_438243 ?auto_438247 ) ) ( not ( = ?auto_438243 ?auto_438248 ) ) ( not ( = ?auto_438243 ?auto_438249 ) ) ( not ( = ?auto_438244 ?auto_438245 ) ) ( not ( = ?auto_438244 ?auto_438246 ) ) ( not ( = ?auto_438244 ?auto_438247 ) ) ( not ( = ?auto_438244 ?auto_438248 ) ) ( not ( = ?auto_438244 ?auto_438249 ) ) ( not ( = ?auto_438245 ?auto_438246 ) ) ( not ( = ?auto_438245 ?auto_438247 ) ) ( not ( = ?auto_438245 ?auto_438248 ) ) ( not ( = ?auto_438245 ?auto_438249 ) ) ( not ( = ?auto_438246 ?auto_438247 ) ) ( not ( = ?auto_438246 ?auto_438248 ) ) ( not ( = ?auto_438246 ?auto_438249 ) ) ( not ( = ?auto_438247 ?auto_438248 ) ) ( not ( = ?auto_438247 ?auto_438249 ) ) ( not ( = ?auto_438248 ?auto_438249 ) ) ( ON ?auto_438247 ?auto_438248 ) ( ON ?auto_438246 ?auto_438247 ) ( ON ?auto_438245 ?auto_438246 ) ( ON ?auto_438244 ?auto_438245 ) ( CLEAR ?auto_438242 ) ( ON ?auto_438243 ?auto_438244 ) ( CLEAR ?auto_438243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_438234 ?auto_438235 ?auto_438236 ?auto_438237 ?auto_438238 ?auto_438239 ?auto_438240 ?auto_438241 ?auto_438242 ?auto_438243 )
      ( MAKE-15PILE ?auto_438234 ?auto_438235 ?auto_438236 ?auto_438237 ?auto_438238 ?auto_438239 ?auto_438240 ?auto_438241 ?auto_438242 ?auto_438243 ?auto_438244 ?auto_438245 ?auto_438246 ?auto_438247 ?auto_438248 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438265 - BLOCK
      ?auto_438266 - BLOCK
      ?auto_438267 - BLOCK
      ?auto_438268 - BLOCK
      ?auto_438269 - BLOCK
      ?auto_438270 - BLOCK
      ?auto_438271 - BLOCK
      ?auto_438272 - BLOCK
      ?auto_438273 - BLOCK
      ?auto_438274 - BLOCK
      ?auto_438275 - BLOCK
      ?auto_438276 - BLOCK
      ?auto_438277 - BLOCK
      ?auto_438278 - BLOCK
      ?auto_438279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438279 ) ( ON-TABLE ?auto_438265 ) ( ON ?auto_438266 ?auto_438265 ) ( ON ?auto_438267 ?auto_438266 ) ( ON ?auto_438268 ?auto_438267 ) ( ON ?auto_438269 ?auto_438268 ) ( ON ?auto_438270 ?auto_438269 ) ( ON ?auto_438271 ?auto_438270 ) ( ON ?auto_438272 ?auto_438271 ) ( ON ?auto_438273 ?auto_438272 ) ( not ( = ?auto_438265 ?auto_438266 ) ) ( not ( = ?auto_438265 ?auto_438267 ) ) ( not ( = ?auto_438265 ?auto_438268 ) ) ( not ( = ?auto_438265 ?auto_438269 ) ) ( not ( = ?auto_438265 ?auto_438270 ) ) ( not ( = ?auto_438265 ?auto_438271 ) ) ( not ( = ?auto_438265 ?auto_438272 ) ) ( not ( = ?auto_438265 ?auto_438273 ) ) ( not ( = ?auto_438265 ?auto_438274 ) ) ( not ( = ?auto_438265 ?auto_438275 ) ) ( not ( = ?auto_438265 ?auto_438276 ) ) ( not ( = ?auto_438265 ?auto_438277 ) ) ( not ( = ?auto_438265 ?auto_438278 ) ) ( not ( = ?auto_438265 ?auto_438279 ) ) ( not ( = ?auto_438266 ?auto_438267 ) ) ( not ( = ?auto_438266 ?auto_438268 ) ) ( not ( = ?auto_438266 ?auto_438269 ) ) ( not ( = ?auto_438266 ?auto_438270 ) ) ( not ( = ?auto_438266 ?auto_438271 ) ) ( not ( = ?auto_438266 ?auto_438272 ) ) ( not ( = ?auto_438266 ?auto_438273 ) ) ( not ( = ?auto_438266 ?auto_438274 ) ) ( not ( = ?auto_438266 ?auto_438275 ) ) ( not ( = ?auto_438266 ?auto_438276 ) ) ( not ( = ?auto_438266 ?auto_438277 ) ) ( not ( = ?auto_438266 ?auto_438278 ) ) ( not ( = ?auto_438266 ?auto_438279 ) ) ( not ( = ?auto_438267 ?auto_438268 ) ) ( not ( = ?auto_438267 ?auto_438269 ) ) ( not ( = ?auto_438267 ?auto_438270 ) ) ( not ( = ?auto_438267 ?auto_438271 ) ) ( not ( = ?auto_438267 ?auto_438272 ) ) ( not ( = ?auto_438267 ?auto_438273 ) ) ( not ( = ?auto_438267 ?auto_438274 ) ) ( not ( = ?auto_438267 ?auto_438275 ) ) ( not ( = ?auto_438267 ?auto_438276 ) ) ( not ( = ?auto_438267 ?auto_438277 ) ) ( not ( = ?auto_438267 ?auto_438278 ) ) ( not ( = ?auto_438267 ?auto_438279 ) ) ( not ( = ?auto_438268 ?auto_438269 ) ) ( not ( = ?auto_438268 ?auto_438270 ) ) ( not ( = ?auto_438268 ?auto_438271 ) ) ( not ( = ?auto_438268 ?auto_438272 ) ) ( not ( = ?auto_438268 ?auto_438273 ) ) ( not ( = ?auto_438268 ?auto_438274 ) ) ( not ( = ?auto_438268 ?auto_438275 ) ) ( not ( = ?auto_438268 ?auto_438276 ) ) ( not ( = ?auto_438268 ?auto_438277 ) ) ( not ( = ?auto_438268 ?auto_438278 ) ) ( not ( = ?auto_438268 ?auto_438279 ) ) ( not ( = ?auto_438269 ?auto_438270 ) ) ( not ( = ?auto_438269 ?auto_438271 ) ) ( not ( = ?auto_438269 ?auto_438272 ) ) ( not ( = ?auto_438269 ?auto_438273 ) ) ( not ( = ?auto_438269 ?auto_438274 ) ) ( not ( = ?auto_438269 ?auto_438275 ) ) ( not ( = ?auto_438269 ?auto_438276 ) ) ( not ( = ?auto_438269 ?auto_438277 ) ) ( not ( = ?auto_438269 ?auto_438278 ) ) ( not ( = ?auto_438269 ?auto_438279 ) ) ( not ( = ?auto_438270 ?auto_438271 ) ) ( not ( = ?auto_438270 ?auto_438272 ) ) ( not ( = ?auto_438270 ?auto_438273 ) ) ( not ( = ?auto_438270 ?auto_438274 ) ) ( not ( = ?auto_438270 ?auto_438275 ) ) ( not ( = ?auto_438270 ?auto_438276 ) ) ( not ( = ?auto_438270 ?auto_438277 ) ) ( not ( = ?auto_438270 ?auto_438278 ) ) ( not ( = ?auto_438270 ?auto_438279 ) ) ( not ( = ?auto_438271 ?auto_438272 ) ) ( not ( = ?auto_438271 ?auto_438273 ) ) ( not ( = ?auto_438271 ?auto_438274 ) ) ( not ( = ?auto_438271 ?auto_438275 ) ) ( not ( = ?auto_438271 ?auto_438276 ) ) ( not ( = ?auto_438271 ?auto_438277 ) ) ( not ( = ?auto_438271 ?auto_438278 ) ) ( not ( = ?auto_438271 ?auto_438279 ) ) ( not ( = ?auto_438272 ?auto_438273 ) ) ( not ( = ?auto_438272 ?auto_438274 ) ) ( not ( = ?auto_438272 ?auto_438275 ) ) ( not ( = ?auto_438272 ?auto_438276 ) ) ( not ( = ?auto_438272 ?auto_438277 ) ) ( not ( = ?auto_438272 ?auto_438278 ) ) ( not ( = ?auto_438272 ?auto_438279 ) ) ( not ( = ?auto_438273 ?auto_438274 ) ) ( not ( = ?auto_438273 ?auto_438275 ) ) ( not ( = ?auto_438273 ?auto_438276 ) ) ( not ( = ?auto_438273 ?auto_438277 ) ) ( not ( = ?auto_438273 ?auto_438278 ) ) ( not ( = ?auto_438273 ?auto_438279 ) ) ( not ( = ?auto_438274 ?auto_438275 ) ) ( not ( = ?auto_438274 ?auto_438276 ) ) ( not ( = ?auto_438274 ?auto_438277 ) ) ( not ( = ?auto_438274 ?auto_438278 ) ) ( not ( = ?auto_438274 ?auto_438279 ) ) ( not ( = ?auto_438275 ?auto_438276 ) ) ( not ( = ?auto_438275 ?auto_438277 ) ) ( not ( = ?auto_438275 ?auto_438278 ) ) ( not ( = ?auto_438275 ?auto_438279 ) ) ( not ( = ?auto_438276 ?auto_438277 ) ) ( not ( = ?auto_438276 ?auto_438278 ) ) ( not ( = ?auto_438276 ?auto_438279 ) ) ( not ( = ?auto_438277 ?auto_438278 ) ) ( not ( = ?auto_438277 ?auto_438279 ) ) ( not ( = ?auto_438278 ?auto_438279 ) ) ( ON ?auto_438278 ?auto_438279 ) ( ON ?auto_438277 ?auto_438278 ) ( ON ?auto_438276 ?auto_438277 ) ( ON ?auto_438275 ?auto_438276 ) ( CLEAR ?auto_438273 ) ( ON ?auto_438274 ?auto_438275 ) ( CLEAR ?auto_438274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_438265 ?auto_438266 ?auto_438267 ?auto_438268 ?auto_438269 ?auto_438270 ?auto_438271 ?auto_438272 ?auto_438273 ?auto_438274 )
      ( MAKE-15PILE ?auto_438265 ?auto_438266 ?auto_438267 ?auto_438268 ?auto_438269 ?auto_438270 ?auto_438271 ?auto_438272 ?auto_438273 ?auto_438274 ?auto_438275 ?auto_438276 ?auto_438277 ?auto_438278 ?auto_438279 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438295 - BLOCK
      ?auto_438296 - BLOCK
      ?auto_438297 - BLOCK
      ?auto_438298 - BLOCK
      ?auto_438299 - BLOCK
      ?auto_438300 - BLOCK
      ?auto_438301 - BLOCK
      ?auto_438302 - BLOCK
      ?auto_438303 - BLOCK
      ?auto_438304 - BLOCK
      ?auto_438305 - BLOCK
      ?auto_438306 - BLOCK
      ?auto_438307 - BLOCK
      ?auto_438308 - BLOCK
      ?auto_438309 - BLOCK
    )
    :vars
    (
      ?auto_438310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438309 ?auto_438310 ) ( ON-TABLE ?auto_438295 ) ( ON ?auto_438296 ?auto_438295 ) ( ON ?auto_438297 ?auto_438296 ) ( ON ?auto_438298 ?auto_438297 ) ( ON ?auto_438299 ?auto_438298 ) ( ON ?auto_438300 ?auto_438299 ) ( ON ?auto_438301 ?auto_438300 ) ( ON ?auto_438302 ?auto_438301 ) ( not ( = ?auto_438295 ?auto_438296 ) ) ( not ( = ?auto_438295 ?auto_438297 ) ) ( not ( = ?auto_438295 ?auto_438298 ) ) ( not ( = ?auto_438295 ?auto_438299 ) ) ( not ( = ?auto_438295 ?auto_438300 ) ) ( not ( = ?auto_438295 ?auto_438301 ) ) ( not ( = ?auto_438295 ?auto_438302 ) ) ( not ( = ?auto_438295 ?auto_438303 ) ) ( not ( = ?auto_438295 ?auto_438304 ) ) ( not ( = ?auto_438295 ?auto_438305 ) ) ( not ( = ?auto_438295 ?auto_438306 ) ) ( not ( = ?auto_438295 ?auto_438307 ) ) ( not ( = ?auto_438295 ?auto_438308 ) ) ( not ( = ?auto_438295 ?auto_438309 ) ) ( not ( = ?auto_438295 ?auto_438310 ) ) ( not ( = ?auto_438296 ?auto_438297 ) ) ( not ( = ?auto_438296 ?auto_438298 ) ) ( not ( = ?auto_438296 ?auto_438299 ) ) ( not ( = ?auto_438296 ?auto_438300 ) ) ( not ( = ?auto_438296 ?auto_438301 ) ) ( not ( = ?auto_438296 ?auto_438302 ) ) ( not ( = ?auto_438296 ?auto_438303 ) ) ( not ( = ?auto_438296 ?auto_438304 ) ) ( not ( = ?auto_438296 ?auto_438305 ) ) ( not ( = ?auto_438296 ?auto_438306 ) ) ( not ( = ?auto_438296 ?auto_438307 ) ) ( not ( = ?auto_438296 ?auto_438308 ) ) ( not ( = ?auto_438296 ?auto_438309 ) ) ( not ( = ?auto_438296 ?auto_438310 ) ) ( not ( = ?auto_438297 ?auto_438298 ) ) ( not ( = ?auto_438297 ?auto_438299 ) ) ( not ( = ?auto_438297 ?auto_438300 ) ) ( not ( = ?auto_438297 ?auto_438301 ) ) ( not ( = ?auto_438297 ?auto_438302 ) ) ( not ( = ?auto_438297 ?auto_438303 ) ) ( not ( = ?auto_438297 ?auto_438304 ) ) ( not ( = ?auto_438297 ?auto_438305 ) ) ( not ( = ?auto_438297 ?auto_438306 ) ) ( not ( = ?auto_438297 ?auto_438307 ) ) ( not ( = ?auto_438297 ?auto_438308 ) ) ( not ( = ?auto_438297 ?auto_438309 ) ) ( not ( = ?auto_438297 ?auto_438310 ) ) ( not ( = ?auto_438298 ?auto_438299 ) ) ( not ( = ?auto_438298 ?auto_438300 ) ) ( not ( = ?auto_438298 ?auto_438301 ) ) ( not ( = ?auto_438298 ?auto_438302 ) ) ( not ( = ?auto_438298 ?auto_438303 ) ) ( not ( = ?auto_438298 ?auto_438304 ) ) ( not ( = ?auto_438298 ?auto_438305 ) ) ( not ( = ?auto_438298 ?auto_438306 ) ) ( not ( = ?auto_438298 ?auto_438307 ) ) ( not ( = ?auto_438298 ?auto_438308 ) ) ( not ( = ?auto_438298 ?auto_438309 ) ) ( not ( = ?auto_438298 ?auto_438310 ) ) ( not ( = ?auto_438299 ?auto_438300 ) ) ( not ( = ?auto_438299 ?auto_438301 ) ) ( not ( = ?auto_438299 ?auto_438302 ) ) ( not ( = ?auto_438299 ?auto_438303 ) ) ( not ( = ?auto_438299 ?auto_438304 ) ) ( not ( = ?auto_438299 ?auto_438305 ) ) ( not ( = ?auto_438299 ?auto_438306 ) ) ( not ( = ?auto_438299 ?auto_438307 ) ) ( not ( = ?auto_438299 ?auto_438308 ) ) ( not ( = ?auto_438299 ?auto_438309 ) ) ( not ( = ?auto_438299 ?auto_438310 ) ) ( not ( = ?auto_438300 ?auto_438301 ) ) ( not ( = ?auto_438300 ?auto_438302 ) ) ( not ( = ?auto_438300 ?auto_438303 ) ) ( not ( = ?auto_438300 ?auto_438304 ) ) ( not ( = ?auto_438300 ?auto_438305 ) ) ( not ( = ?auto_438300 ?auto_438306 ) ) ( not ( = ?auto_438300 ?auto_438307 ) ) ( not ( = ?auto_438300 ?auto_438308 ) ) ( not ( = ?auto_438300 ?auto_438309 ) ) ( not ( = ?auto_438300 ?auto_438310 ) ) ( not ( = ?auto_438301 ?auto_438302 ) ) ( not ( = ?auto_438301 ?auto_438303 ) ) ( not ( = ?auto_438301 ?auto_438304 ) ) ( not ( = ?auto_438301 ?auto_438305 ) ) ( not ( = ?auto_438301 ?auto_438306 ) ) ( not ( = ?auto_438301 ?auto_438307 ) ) ( not ( = ?auto_438301 ?auto_438308 ) ) ( not ( = ?auto_438301 ?auto_438309 ) ) ( not ( = ?auto_438301 ?auto_438310 ) ) ( not ( = ?auto_438302 ?auto_438303 ) ) ( not ( = ?auto_438302 ?auto_438304 ) ) ( not ( = ?auto_438302 ?auto_438305 ) ) ( not ( = ?auto_438302 ?auto_438306 ) ) ( not ( = ?auto_438302 ?auto_438307 ) ) ( not ( = ?auto_438302 ?auto_438308 ) ) ( not ( = ?auto_438302 ?auto_438309 ) ) ( not ( = ?auto_438302 ?auto_438310 ) ) ( not ( = ?auto_438303 ?auto_438304 ) ) ( not ( = ?auto_438303 ?auto_438305 ) ) ( not ( = ?auto_438303 ?auto_438306 ) ) ( not ( = ?auto_438303 ?auto_438307 ) ) ( not ( = ?auto_438303 ?auto_438308 ) ) ( not ( = ?auto_438303 ?auto_438309 ) ) ( not ( = ?auto_438303 ?auto_438310 ) ) ( not ( = ?auto_438304 ?auto_438305 ) ) ( not ( = ?auto_438304 ?auto_438306 ) ) ( not ( = ?auto_438304 ?auto_438307 ) ) ( not ( = ?auto_438304 ?auto_438308 ) ) ( not ( = ?auto_438304 ?auto_438309 ) ) ( not ( = ?auto_438304 ?auto_438310 ) ) ( not ( = ?auto_438305 ?auto_438306 ) ) ( not ( = ?auto_438305 ?auto_438307 ) ) ( not ( = ?auto_438305 ?auto_438308 ) ) ( not ( = ?auto_438305 ?auto_438309 ) ) ( not ( = ?auto_438305 ?auto_438310 ) ) ( not ( = ?auto_438306 ?auto_438307 ) ) ( not ( = ?auto_438306 ?auto_438308 ) ) ( not ( = ?auto_438306 ?auto_438309 ) ) ( not ( = ?auto_438306 ?auto_438310 ) ) ( not ( = ?auto_438307 ?auto_438308 ) ) ( not ( = ?auto_438307 ?auto_438309 ) ) ( not ( = ?auto_438307 ?auto_438310 ) ) ( not ( = ?auto_438308 ?auto_438309 ) ) ( not ( = ?auto_438308 ?auto_438310 ) ) ( not ( = ?auto_438309 ?auto_438310 ) ) ( ON ?auto_438308 ?auto_438309 ) ( ON ?auto_438307 ?auto_438308 ) ( ON ?auto_438306 ?auto_438307 ) ( ON ?auto_438305 ?auto_438306 ) ( ON ?auto_438304 ?auto_438305 ) ( CLEAR ?auto_438302 ) ( ON ?auto_438303 ?auto_438304 ) ( CLEAR ?auto_438303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_438295 ?auto_438296 ?auto_438297 ?auto_438298 ?auto_438299 ?auto_438300 ?auto_438301 ?auto_438302 ?auto_438303 )
      ( MAKE-15PILE ?auto_438295 ?auto_438296 ?auto_438297 ?auto_438298 ?auto_438299 ?auto_438300 ?auto_438301 ?auto_438302 ?auto_438303 ?auto_438304 ?auto_438305 ?auto_438306 ?auto_438307 ?auto_438308 ?auto_438309 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438326 - BLOCK
      ?auto_438327 - BLOCK
      ?auto_438328 - BLOCK
      ?auto_438329 - BLOCK
      ?auto_438330 - BLOCK
      ?auto_438331 - BLOCK
      ?auto_438332 - BLOCK
      ?auto_438333 - BLOCK
      ?auto_438334 - BLOCK
      ?auto_438335 - BLOCK
      ?auto_438336 - BLOCK
      ?auto_438337 - BLOCK
      ?auto_438338 - BLOCK
      ?auto_438339 - BLOCK
      ?auto_438340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438340 ) ( ON-TABLE ?auto_438326 ) ( ON ?auto_438327 ?auto_438326 ) ( ON ?auto_438328 ?auto_438327 ) ( ON ?auto_438329 ?auto_438328 ) ( ON ?auto_438330 ?auto_438329 ) ( ON ?auto_438331 ?auto_438330 ) ( ON ?auto_438332 ?auto_438331 ) ( ON ?auto_438333 ?auto_438332 ) ( not ( = ?auto_438326 ?auto_438327 ) ) ( not ( = ?auto_438326 ?auto_438328 ) ) ( not ( = ?auto_438326 ?auto_438329 ) ) ( not ( = ?auto_438326 ?auto_438330 ) ) ( not ( = ?auto_438326 ?auto_438331 ) ) ( not ( = ?auto_438326 ?auto_438332 ) ) ( not ( = ?auto_438326 ?auto_438333 ) ) ( not ( = ?auto_438326 ?auto_438334 ) ) ( not ( = ?auto_438326 ?auto_438335 ) ) ( not ( = ?auto_438326 ?auto_438336 ) ) ( not ( = ?auto_438326 ?auto_438337 ) ) ( not ( = ?auto_438326 ?auto_438338 ) ) ( not ( = ?auto_438326 ?auto_438339 ) ) ( not ( = ?auto_438326 ?auto_438340 ) ) ( not ( = ?auto_438327 ?auto_438328 ) ) ( not ( = ?auto_438327 ?auto_438329 ) ) ( not ( = ?auto_438327 ?auto_438330 ) ) ( not ( = ?auto_438327 ?auto_438331 ) ) ( not ( = ?auto_438327 ?auto_438332 ) ) ( not ( = ?auto_438327 ?auto_438333 ) ) ( not ( = ?auto_438327 ?auto_438334 ) ) ( not ( = ?auto_438327 ?auto_438335 ) ) ( not ( = ?auto_438327 ?auto_438336 ) ) ( not ( = ?auto_438327 ?auto_438337 ) ) ( not ( = ?auto_438327 ?auto_438338 ) ) ( not ( = ?auto_438327 ?auto_438339 ) ) ( not ( = ?auto_438327 ?auto_438340 ) ) ( not ( = ?auto_438328 ?auto_438329 ) ) ( not ( = ?auto_438328 ?auto_438330 ) ) ( not ( = ?auto_438328 ?auto_438331 ) ) ( not ( = ?auto_438328 ?auto_438332 ) ) ( not ( = ?auto_438328 ?auto_438333 ) ) ( not ( = ?auto_438328 ?auto_438334 ) ) ( not ( = ?auto_438328 ?auto_438335 ) ) ( not ( = ?auto_438328 ?auto_438336 ) ) ( not ( = ?auto_438328 ?auto_438337 ) ) ( not ( = ?auto_438328 ?auto_438338 ) ) ( not ( = ?auto_438328 ?auto_438339 ) ) ( not ( = ?auto_438328 ?auto_438340 ) ) ( not ( = ?auto_438329 ?auto_438330 ) ) ( not ( = ?auto_438329 ?auto_438331 ) ) ( not ( = ?auto_438329 ?auto_438332 ) ) ( not ( = ?auto_438329 ?auto_438333 ) ) ( not ( = ?auto_438329 ?auto_438334 ) ) ( not ( = ?auto_438329 ?auto_438335 ) ) ( not ( = ?auto_438329 ?auto_438336 ) ) ( not ( = ?auto_438329 ?auto_438337 ) ) ( not ( = ?auto_438329 ?auto_438338 ) ) ( not ( = ?auto_438329 ?auto_438339 ) ) ( not ( = ?auto_438329 ?auto_438340 ) ) ( not ( = ?auto_438330 ?auto_438331 ) ) ( not ( = ?auto_438330 ?auto_438332 ) ) ( not ( = ?auto_438330 ?auto_438333 ) ) ( not ( = ?auto_438330 ?auto_438334 ) ) ( not ( = ?auto_438330 ?auto_438335 ) ) ( not ( = ?auto_438330 ?auto_438336 ) ) ( not ( = ?auto_438330 ?auto_438337 ) ) ( not ( = ?auto_438330 ?auto_438338 ) ) ( not ( = ?auto_438330 ?auto_438339 ) ) ( not ( = ?auto_438330 ?auto_438340 ) ) ( not ( = ?auto_438331 ?auto_438332 ) ) ( not ( = ?auto_438331 ?auto_438333 ) ) ( not ( = ?auto_438331 ?auto_438334 ) ) ( not ( = ?auto_438331 ?auto_438335 ) ) ( not ( = ?auto_438331 ?auto_438336 ) ) ( not ( = ?auto_438331 ?auto_438337 ) ) ( not ( = ?auto_438331 ?auto_438338 ) ) ( not ( = ?auto_438331 ?auto_438339 ) ) ( not ( = ?auto_438331 ?auto_438340 ) ) ( not ( = ?auto_438332 ?auto_438333 ) ) ( not ( = ?auto_438332 ?auto_438334 ) ) ( not ( = ?auto_438332 ?auto_438335 ) ) ( not ( = ?auto_438332 ?auto_438336 ) ) ( not ( = ?auto_438332 ?auto_438337 ) ) ( not ( = ?auto_438332 ?auto_438338 ) ) ( not ( = ?auto_438332 ?auto_438339 ) ) ( not ( = ?auto_438332 ?auto_438340 ) ) ( not ( = ?auto_438333 ?auto_438334 ) ) ( not ( = ?auto_438333 ?auto_438335 ) ) ( not ( = ?auto_438333 ?auto_438336 ) ) ( not ( = ?auto_438333 ?auto_438337 ) ) ( not ( = ?auto_438333 ?auto_438338 ) ) ( not ( = ?auto_438333 ?auto_438339 ) ) ( not ( = ?auto_438333 ?auto_438340 ) ) ( not ( = ?auto_438334 ?auto_438335 ) ) ( not ( = ?auto_438334 ?auto_438336 ) ) ( not ( = ?auto_438334 ?auto_438337 ) ) ( not ( = ?auto_438334 ?auto_438338 ) ) ( not ( = ?auto_438334 ?auto_438339 ) ) ( not ( = ?auto_438334 ?auto_438340 ) ) ( not ( = ?auto_438335 ?auto_438336 ) ) ( not ( = ?auto_438335 ?auto_438337 ) ) ( not ( = ?auto_438335 ?auto_438338 ) ) ( not ( = ?auto_438335 ?auto_438339 ) ) ( not ( = ?auto_438335 ?auto_438340 ) ) ( not ( = ?auto_438336 ?auto_438337 ) ) ( not ( = ?auto_438336 ?auto_438338 ) ) ( not ( = ?auto_438336 ?auto_438339 ) ) ( not ( = ?auto_438336 ?auto_438340 ) ) ( not ( = ?auto_438337 ?auto_438338 ) ) ( not ( = ?auto_438337 ?auto_438339 ) ) ( not ( = ?auto_438337 ?auto_438340 ) ) ( not ( = ?auto_438338 ?auto_438339 ) ) ( not ( = ?auto_438338 ?auto_438340 ) ) ( not ( = ?auto_438339 ?auto_438340 ) ) ( ON ?auto_438339 ?auto_438340 ) ( ON ?auto_438338 ?auto_438339 ) ( ON ?auto_438337 ?auto_438338 ) ( ON ?auto_438336 ?auto_438337 ) ( ON ?auto_438335 ?auto_438336 ) ( CLEAR ?auto_438333 ) ( ON ?auto_438334 ?auto_438335 ) ( CLEAR ?auto_438334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_438326 ?auto_438327 ?auto_438328 ?auto_438329 ?auto_438330 ?auto_438331 ?auto_438332 ?auto_438333 ?auto_438334 )
      ( MAKE-15PILE ?auto_438326 ?auto_438327 ?auto_438328 ?auto_438329 ?auto_438330 ?auto_438331 ?auto_438332 ?auto_438333 ?auto_438334 ?auto_438335 ?auto_438336 ?auto_438337 ?auto_438338 ?auto_438339 ?auto_438340 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438356 - BLOCK
      ?auto_438357 - BLOCK
      ?auto_438358 - BLOCK
      ?auto_438359 - BLOCK
      ?auto_438360 - BLOCK
      ?auto_438361 - BLOCK
      ?auto_438362 - BLOCK
      ?auto_438363 - BLOCK
      ?auto_438364 - BLOCK
      ?auto_438365 - BLOCK
      ?auto_438366 - BLOCK
      ?auto_438367 - BLOCK
      ?auto_438368 - BLOCK
      ?auto_438369 - BLOCK
      ?auto_438370 - BLOCK
    )
    :vars
    (
      ?auto_438371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438370 ?auto_438371 ) ( ON-TABLE ?auto_438356 ) ( ON ?auto_438357 ?auto_438356 ) ( ON ?auto_438358 ?auto_438357 ) ( ON ?auto_438359 ?auto_438358 ) ( ON ?auto_438360 ?auto_438359 ) ( ON ?auto_438361 ?auto_438360 ) ( ON ?auto_438362 ?auto_438361 ) ( not ( = ?auto_438356 ?auto_438357 ) ) ( not ( = ?auto_438356 ?auto_438358 ) ) ( not ( = ?auto_438356 ?auto_438359 ) ) ( not ( = ?auto_438356 ?auto_438360 ) ) ( not ( = ?auto_438356 ?auto_438361 ) ) ( not ( = ?auto_438356 ?auto_438362 ) ) ( not ( = ?auto_438356 ?auto_438363 ) ) ( not ( = ?auto_438356 ?auto_438364 ) ) ( not ( = ?auto_438356 ?auto_438365 ) ) ( not ( = ?auto_438356 ?auto_438366 ) ) ( not ( = ?auto_438356 ?auto_438367 ) ) ( not ( = ?auto_438356 ?auto_438368 ) ) ( not ( = ?auto_438356 ?auto_438369 ) ) ( not ( = ?auto_438356 ?auto_438370 ) ) ( not ( = ?auto_438356 ?auto_438371 ) ) ( not ( = ?auto_438357 ?auto_438358 ) ) ( not ( = ?auto_438357 ?auto_438359 ) ) ( not ( = ?auto_438357 ?auto_438360 ) ) ( not ( = ?auto_438357 ?auto_438361 ) ) ( not ( = ?auto_438357 ?auto_438362 ) ) ( not ( = ?auto_438357 ?auto_438363 ) ) ( not ( = ?auto_438357 ?auto_438364 ) ) ( not ( = ?auto_438357 ?auto_438365 ) ) ( not ( = ?auto_438357 ?auto_438366 ) ) ( not ( = ?auto_438357 ?auto_438367 ) ) ( not ( = ?auto_438357 ?auto_438368 ) ) ( not ( = ?auto_438357 ?auto_438369 ) ) ( not ( = ?auto_438357 ?auto_438370 ) ) ( not ( = ?auto_438357 ?auto_438371 ) ) ( not ( = ?auto_438358 ?auto_438359 ) ) ( not ( = ?auto_438358 ?auto_438360 ) ) ( not ( = ?auto_438358 ?auto_438361 ) ) ( not ( = ?auto_438358 ?auto_438362 ) ) ( not ( = ?auto_438358 ?auto_438363 ) ) ( not ( = ?auto_438358 ?auto_438364 ) ) ( not ( = ?auto_438358 ?auto_438365 ) ) ( not ( = ?auto_438358 ?auto_438366 ) ) ( not ( = ?auto_438358 ?auto_438367 ) ) ( not ( = ?auto_438358 ?auto_438368 ) ) ( not ( = ?auto_438358 ?auto_438369 ) ) ( not ( = ?auto_438358 ?auto_438370 ) ) ( not ( = ?auto_438358 ?auto_438371 ) ) ( not ( = ?auto_438359 ?auto_438360 ) ) ( not ( = ?auto_438359 ?auto_438361 ) ) ( not ( = ?auto_438359 ?auto_438362 ) ) ( not ( = ?auto_438359 ?auto_438363 ) ) ( not ( = ?auto_438359 ?auto_438364 ) ) ( not ( = ?auto_438359 ?auto_438365 ) ) ( not ( = ?auto_438359 ?auto_438366 ) ) ( not ( = ?auto_438359 ?auto_438367 ) ) ( not ( = ?auto_438359 ?auto_438368 ) ) ( not ( = ?auto_438359 ?auto_438369 ) ) ( not ( = ?auto_438359 ?auto_438370 ) ) ( not ( = ?auto_438359 ?auto_438371 ) ) ( not ( = ?auto_438360 ?auto_438361 ) ) ( not ( = ?auto_438360 ?auto_438362 ) ) ( not ( = ?auto_438360 ?auto_438363 ) ) ( not ( = ?auto_438360 ?auto_438364 ) ) ( not ( = ?auto_438360 ?auto_438365 ) ) ( not ( = ?auto_438360 ?auto_438366 ) ) ( not ( = ?auto_438360 ?auto_438367 ) ) ( not ( = ?auto_438360 ?auto_438368 ) ) ( not ( = ?auto_438360 ?auto_438369 ) ) ( not ( = ?auto_438360 ?auto_438370 ) ) ( not ( = ?auto_438360 ?auto_438371 ) ) ( not ( = ?auto_438361 ?auto_438362 ) ) ( not ( = ?auto_438361 ?auto_438363 ) ) ( not ( = ?auto_438361 ?auto_438364 ) ) ( not ( = ?auto_438361 ?auto_438365 ) ) ( not ( = ?auto_438361 ?auto_438366 ) ) ( not ( = ?auto_438361 ?auto_438367 ) ) ( not ( = ?auto_438361 ?auto_438368 ) ) ( not ( = ?auto_438361 ?auto_438369 ) ) ( not ( = ?auto_438361 ?auto_438370 ) ) ( not ( = ?auto_438361 ?auto_438371 ) ) ( not ( = ?auto_438362 ?auto_438363 ) ) ( not ( = ?auto_438362 ?auto_438364 ) ) ( not ( = ?auto_438362 ?auto_438365 ) ) ( not ( = ?auto_438362 ?auto_438366 ) ) ( not ( = ?auto_438362 ?auto_438367 ) ) ( not ( = ?auto_438362 ?auto_438368 ) ) ( not ( = ?auto_438362 ?auto_438369 ) ) ( not ( = ?auto_438362 ?auto_438370 ) ) ( not ( = ?auto_438362 ?auto_438371 ) ) ( not ( = ?auto_438363 ?auto_438364 ) ) ( not ( = ?auto_438363 ?auto_438365 ) ) ( not ( = ?auto_438363 ?auto_438366 ) ) ( not ( = ?auto_438363 ?auto_438367 ) ) ( not ( = ?auto_438363 ?auto_438368 ) ) ( not ( = ?auto_438363 ?auto_438369 ) ) ( not ( = ?auto_438363 ?auto_438370 ) ) ( not ( = ?auto_438363 ?auto_438371 ) ) ( not ( = ?auto_438364 ?auto_438365 ) ) ( not ( = ?auto_438364 ?auto_438366 ) ) ( not ( = ?auto_438364 ?auto_438367 ) ) ( not ( = ?auto_438364 ?auto_438368 ) ) ( not ( = ?auto_438364 ?auto_438369 ) ) ( not ( = ?auto_438364 ?auto_438370 ) ) ( not ( = ?auto_438364 ?auto_438371 ) ) ( not ( = ?auto_438365 ?auto_438366 ) ) ( not ( = ?auto_438365 ?auto_438367 ) ) ( not ( = ?auto_438365 ?auto_438368 ) ) ( not ( = ?auto_438365 ?auto_438369 ) ) ( not ( = ?auto_438365 ?auto_438370 ) ) ( not ( = ?auto_438365 ?auto_438371 ) ) ( not ( = ?auto_438366 ?auto_438367 ) ) ( not ( = ?auto_438366 ?auto_438368 ) ) ( not ( = ?auto_438366 ?auto_438369 ) ) ( not ( = ?auto_438366 ?auto_438370 ) ) ( not ( = ?auto_438366 ?auto_438371 ) ) ( not ( = ?auto_438367 ?auto_438368 ) ) ( not ( = ?auto_438367 ?auto_438369 ) ) ( not ( = ?auto_438367 ?auto_438370 ) ) ( not ( = ?auto_438367 ?auto_438371 ) ) ( not ( = ?auto_438368 ?auto_438369 ) ) ( not ( = ?auto_438368 ?auto_438370 ) ) ( not ( = ?auto_438368 ?auto_438371 ) ) ( not ( = ?auto_438369 ?auto_438370 ) ) ( not ( = ?auto_438369 ?auto_438371 ) ) ( not ( = ?auto_438370 ?auto_438371 ) ) ( ON ?auto_438369 ?auto_438370 ) ( ON ?auto_438368 ?auto_438369 ) ( ON ?auto_438367 ?auto_438368 ) ( ON ?auto_438366 ?auto_438367 ) ( ON ?auto_438365 ?auto_438366 ) ( ON ?auto_438364 ?auto_438365 ) ( CLEAR ?auto_438362 ) ( ON ?auto_438363 ?auto_438364 ) ( CLEAR ?auto_438363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_438356 ?auto_438357 ?auto_438358 ?auto_438359 ?auto_438360 ?auto_438361 ?auto_438362 ?auto_438363 )
      ( MAKE-15PILE ?auto_438356 ?auto_438357 ?auto_438358 ?auto_438359 ?auto_438360 ?auto_438361 ?auto_438362 ?auto_438363 ?auto_438364 ?auto_438365 ?auto_438366 ?auto_438367 ?auto_438368 ?auto_438369 ?auto_438370 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438387 - BLOCK
      ?auto_438388 - BLOCK
      ?auto_438389 - BLOCK
      ?auto_438390 - BLOCK
      ?auto_438391 - BLOCK
      ?auto_438392 - BLOCK
      ?auto_438393 - BLOCK
      ?auto_438394 - BLOCK
      ?auto_438395 - BLOCK
      ?auto_438396 - BLOCK
      ?auto_438397 - BLOCK
      ?auto_438398 - BLOCK
      ?auto_438399 - BLOCK
      ?auto_438400 - BLOCK
      ?auto_438401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438401 ) ( ON-TABLE ?auto_438387 ) ( ON ?auto_438388 ?auto_438387 ) ( ON ?auto_438389 ?auto_438388 ) ( ON ?auto_438390 ?auto_438389 ) ( ON ?auto_438391 ?auto_438390 ) ( ON ?auto_438392 ?auto_438391 ) ( ON ?auto_438393 ?auto_438392 ) ( not ( = ?auto_438387 ?auto_438388 ) ) ( not ( = ?auto_438387 ?auto_438389 ) ) ( not ( = ?auto_438387 ?auto_438390 ) ) ( not ( = ?auto_438387 ?auto_438391 ) ) ( not ( = ?auto_438387 ?auto_438392 ) ) ( not ( = ?auto_438387 ?auto_438393 ) ) ( not ( = ?auto_438387 ?auto_438394 ) ) ( not ( = ?auto_438387 ?auto_438395 ) ) ( not ( = ?auto_438387 ?auto_438396 ) ) ( not ( = ?auto_438387 ?auto_438397 ) ) ( not ( = ?auto_438387 ?auto_438398 ) ) ( not ( = ?auto_438387 ?auto_438399 ) ) ( not ( = ?auto_438387 ?auto_438400 ) ) ( not ( = ?auto_438387 ?auto_438401 ) ) ( not ( = ?auto_438388 ?auto_438389 ) ) ( not ( = ?auto_438388 ?auto_438390 ) ) ( not ( = ?auto_438388 ?auto_438391 ) ) ( not ( = ?auto_438388 ?auto_438392 ) ) ( not ( = ?auto_438388 ?auto_438393 ) ) ( not ( = ?auto_438388 ?auto_438394 ) ) ( not ( = ?auto_438388 ?auto_438395 ) ) ( not ( = ?auto_438388 ?auto_438396 ) ) ( not ( = ?auto_438388 ?auto_438397 ) ) ( not ( = ?auto_438388 ?auto_438398 ) ) ( not ( = ?auto_438388 ?auto_438399 ) ) ( not ( = ?auto_438388 ?auto_438400 ) ) ( not ( = ?auto_438388 ?auto_438401 ) ) ( not ( = ?auto_438389 ?auto_438390 ) ) ( not ( = ?auto_438389 ?auto_438391 ) ) ( not ( = ?auto_438389 ?auto_438392 ) ) ( not ( = ?auto_438389 ?auto_438393 ) ) ( not ( = ?auto_438389 ?auto_438394 ) ) ( not ( = ?auto_438389 ?auto_438395 ) ) ( not ( = ?auto_438389 ?auto_438396 ) ) ( not ( = ?auto_438389 ?auto_438397 ) ) ( not ( = ?auto_438389 ?auto_438398 ) ) ( not ( = ?auto_438389 ?auto_438399 ) ) ( not ( = ?auto_438389 ?auto_438400 ) ) ( not ( = ?auto_438389 ?auto_438401 ) ) ( not ( = ?auto_438390 ?auto_438391 ) ) ( not ( = ?auto_438390 ?auto_438392 ) ) ( not ( = ?auto_438390 ?auto_438393 ) ) ( not ( = ?auto_438390 ?auto_438394 ) ) ( not ( = ?auto_438390 ?auto_438395 ) ) ( not ( = ?auto_438390 ?auto_438396 ) ) ( not ( = ?auto_438390 ?auto_438397 ) ) ( not ( = ?auto_438390 ?auto_438398 ) ) ( not ( = ?auto_438390 ?auto_438399 ) ) ( not ( = ?auto_438390 ?auto_438400 ) ) ( not ( = ?auto_438390 ?auto_438401 ) ) ( not ( = ?auto_438391 ?auto_438392 ) ) ( not ( = ?auto_438391 ?auto_438393 ) ) ( not ( = ?auto_438391 ?auto_438394 ) ) ( not ( = ?auto_438391 ?auto_438395 ) ) ( not ( = ?auto_438391 ?auto_438396 ) ) ( not ( = ?auto_438391 ?auto_438397 ) ) ( not ( = ?auto_438391 ?auto_438398 ) ) ( not ( = ?auto_438391 ?auto_438399 ) ) ( not ( = ?auto_438391 ?auto_438400 ) ) ( not ( = ?auto_438391 ?auto_438401 ) ) ( not ( = ?auto_438392 ?auto_438393 ) ) ( not ( = ?auto_438392 ?auto_438394 ) ) ( not ( = ?auto_438392 ?auto_438395 ) ) ( not ( = ?auto_438392 ?auto_438396 ) ) ( not ( = ?auto_438392 ?auto_438397 ) ) ( not ( = ?auto_438392 ?auto_438398 ) ) ( not ( = ?auto_438392 ?auto_438399 ) ) ( not ( = ?auto_438392 ?auto_438400 ) ) ( not ( = ?auto_438392 ?auto_438401 ) ) ( not ( = ?auto_438393 ?auto_438394 ) ) ( not ( = ?auto_438393 ?auto_438395 ) ) ( not ( = ?auto_438393 ?auto_438396 ) ) ( not ( = ?auto_438393 ?auto_438397 ) ) ( not ( = ?auto_438393 ?auto_438398 ) ) ( not ( = ?auto_438393 ?auto_438399 ) ) ( not ( = ?auto_438393 ?auto_438400 ) ) ( not ( = ?auto_438393 ?auto_438401 ) ) ( not ( = ?auto_438394 ?auto_438395 ) ) ( not ( = ?auto_438394 ?auto_438396 ) ) ( not ( = ?auto_438394 ?auto_438397 ) ) ( not ( = ?auto_438394 ?auto_438398 ) ) ( not ( = ?auto_438394 ?auto_438399 ) ) ( not ( = ?auto_438394 ?auto_438400 ) ) ( not ( = ?auto_438394 ?auto_438401 ) ) ( not ( = ?auto_438395 ?auto_438396 ) ) ( not ( = ?auto_438395 ?auto_438397 ) ) ( not ( = ?auto_438395 ?auto_438398 ) ) ( not ( = ?auto_438395 ?auto_438399 ) ) ( not ( = ?auto_438395 ?auto_438400 ) ) ( not ( = ?auto_438395 ?auto_438401 ) ) ( not ( = ?auto_438396 ?auto_438397 ) ) ( not ( = ?auto_438396 ?auto_438398 ) ) ( not ( = ?auto_438396 ?auto_438399 ) ) ( not ( = ?auto_438396 ?auto_438400 ) ) ( not ( = ?auto_438396 ?auto_438401 ) ) ( not ( = ?auto_438397 ?auto_438398 ) ) ( not ( = ?auto_438397 ?auto_438399 ) ) ( not ( = ?auto_438397 ?auto_438400 ) ) ( not ( = ?auto_438397 ?auto_438401 ) ) ( not ( = ?auto_438398 ?auto_438399 ) ) ( not ( = ?auto_438398 ?auto_438400 ) ) ( not ( = ?auto_438398 ?auto_438401 ) ) ( not ( = ?auto_438399 ?auto_438400 ) ) ( not ( = ?auto_438399 ?auto_438401 ) ) ( not ( = ?auto_438400 ?auto_438401 ) ) ( ON ?auto_438400 ?auto_438401 ) ( ON ?auto_438399 ?auto_438400 ) ( ON ?auto_438398 ?auto_438399 ) ( ON ?auto_438397 ?auto_438398 ) ( ON ?auto_438396 ?auto_438397 ) ( ON ?auto_438395 ?auto_438396 ) ( CLEAR ?auto_438393 ) ( ON ?auto_438394 ?auto_438395 ) ( CLEAR ?auto_438394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_438387 ?auto_438388 ?auto_438389 ?auto_438390 ?auto_438391 ?auto_438392 ?auto_438393 ?auto_438394 )
      ( MAKE-15PILE ?auto_438387 ?auto_438388 ?auto_438389 ?auto_438390 ?auto_438391 ?auto_438392 ?auto_438393 ?auto_438394 ?auto_438395 ?auto_438396 ?auto_438397 ?auto_438398 ?auto_438399 ?auto_438400 ?auto_438401 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438417 - BLOCK
      ?auto_438418 - BLOCK
      ?auto_438419 - BLOCK
      ?auto_438420 - BLOCK
      ?auto_438421 - BLOCK
      ?auto_438422 - BLOCK
      ?auto_438423 - BLOCK
      ?auto_438424 - BLOCK
      ?auto_438425 - BLOCK
      ?auto_438426 - BLOCK
      ?auto_438427 - BLOCK
      ?auto_438428 - BLOCK
      ?auto_438429 - BLOCK
      ?auto_438430 - BLOCK
      ?auto_438431 - BLOCK
    )
    :vars
    (
      ?auto_438432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438431 ?auto_438432 ) ( ON-TABLE ?auto_438417 ) ( ON ?auto_438418 ?auto_438417 ) ( ON ?auto_438419 ?auto_438418 ) ( ON ?auto_438420 ?auto_438419 ) ( ON ?auto_438421 ?auto_438420 ) ( ON ?auto_438422 ?auto_438421 ) ( not ( = ?auto_438417 ?auto_438418 ) ) ( not ( = ?auto_438417 ?auto_438419 ) ) ( not ( = ?auto_438417 ?auto_438420 ) ) ( not ( = ?auto_438417 ?auto_438421 ) ) ( not ( = ?auto_438417 ?auto_438422 ) ) ( not ( = ?auto_438417 ?auto_438423 ) ) ( not ( = ?auto_438417 ?auto_438424 ) ) ( not ( = ?auto_438417 ?auto_438425 ) ) ( not ( = ?auto_438417 ?auto_438426 ) ) ( not ( = ?auto_438417 ?auto_438427 ) ) ( not ( = ?auto_438417 ?auto_438428 ) ) ( not ( = ?auto_438417 ?auto_438429 ) ) ( not ( = ?auto_438417 ?auto_438430 ) ) ( not ( = ?auto_438417 ?auto_438431 ) ) ( not ( = ?auto_438417 ?auto_438432 ) ) ( not ( = ?auto_438418 ?auto_438419 ) ) ( not ( = ?auto_438418 ?auto_438420 ) ) ( not ( = ?auto_438418 ?auto_438421 ) ) ( not ( = ?auto_438418 ?auto_438422 ) ) ( not ( = ?auto_438418 ?auto_438423 ) ) ( not ( = ?auto_438418 ?auto_438424 ) ) ( not ( = ?auto_438418 ?auto_438425 ) ) ( not ( = ?auto_438418 ?auto_438426 ) ) ( not ( = ?auto_438418 ?auto_438427 ) ) ( not ( = ?auto_438418 ?auto_438428 ) ) ( not ( = ?auto_438418 ?auto_438429 ) ) ( not ( = ?auto_438418 ?auto_438430 ) ) ( not ( = ?auto_438418 ?auto_438431 ) ) ( not ( = ?auto_438418 ?auto_438432 ) ) ( not ( = ?auto_438419 ?auto_438420 ) ) ( not ( = ?auto_438419 ?auto_438421 ) ) ( not ( = ?auto_438419 ?auto_438422 ) ) ( not ( = ?auto_438419 ?auto_438423 ) ) ( not ( = ?auto_438419 ?auto_438424 ) ) ( not ( = ?auto_438419 ?auto_438425 ) ) ( not ( = ?auto_438419 ?auto_438426 ) ) ( not ( = ?auto_438419 ?auto_438427 ) ) ( not ( = ?auto_438419 ?auto_438428 ) ) ( not ( = ?auto_438419 ?auto_438429 ) ) ( not ( = ?auto_438419 ?auto_438430 ) ) ( not ( = ?auto_438419 ?auto_438431 ) ) ( not ( = ?auto_438419 ?auto_438432 ) ) ( not ( = ?auto_438420 ?auto_438421 ) ) ( not ( = ?auto_438420 ?auto_438422 ) ) ( not ( = ?auto_438420 ?auto_438423 ) ) ( not ( = ?auto_438420 ?auto_438424 ) ) ( not ( = ?auto_438420 ?auto_438425 ) ) ( not ( = ?auto_438420 ?auto_438426 ) ) ( not ( = ?auto_438420 ?auto_438427 ) ) ( not ( = ?auto_438420 ?auto_438428 ) ) ( not ( = ?auto_438420 ?auto_438429 ) ) ( not ( = ?auto_438420 ?auto_438430 ) ) ( not ( = ?auto_438420 ?auto_438431 ) ) ( not ( = ?auto_438420 ?auto_438432 ) ) ( not ( = ?auto_438421 ?auto_438422 ) ) ( not ( = ?auto_438421 ?auto_438423 ) ) ( not ( = ?auto_438421 ?auto_438424 ) ) ( not ( = ?auto_438421 ?auto_438425 ) ) ( not ( = ?auto_438421 ?auto_438426 ) ) ( not ( = ?auto_438421 ?auto_438427 ) ) ( not ( = ?auto_438421 ?auto_438428 ) ) ( not ( = ?auto_438421 ?auto_438429 ) ) ( not ( = ?auto_438421 ?auto_438430 ) ) ( not ( = ?auto_438421 ?auto_438431 ) ) ( not ( = ?auto_438421 ?auto_438432 ) ) ( not ( = ?auto_438422 ?auto_438423 ) ) ( not ( = ?auto_438422 ?auto_438424 ) ) ( not ( = ?auto_438422 ?auto_438425 ) ) ( not ( = ?auto_438422 ?auto_438426 ) ) ( not ( = ?auto_438422 ?auto_438427 ) ) ( not ( = ?auto_438422 ?auto_438428 ) ) ( not ( = ?auto_438422 ?auto_438429 ) ) ( not ( = ?auto_438422 ?auto_438430 ) ) ( not ( = ?auto_438422 ?auto_438431 ) ) ( not ( = ?auto_438422 ?auto_438432 ) ) ( not ( = ?auto_438423 ?auto_438424 ) ) ( not ( = ?auto_438423 ?auto_438425 ) ) ( not ( = ?auto_438423 ?auto_438426 ) ) ( not ( = ?auto_438423 ?auto_438427 ) ) ( not ( = ?auto_438423 ?auto_438428 ) ) ( not ( = ?auto_438423 ?auto_438429 ) ) ( not ( = ?auto_438423 ?auto_438430 ) ) ( not ( = ?auto_438423 ?auto_438431 ) ) ( not ( = ?auto_438423 ?auto_438432 ) ) ( not ( = ?auto_438424 ?auto_438425 ) ) ( not ( = ?auto_438424 ?auto_438426 ) ) ( not ( = ?auto_438424 ?auto_438427 ) ) ( not ( = ?auto_438424 ?auto_438428 ) ) ( not ( = ?auto_438424 ?auto_438429 ) ) ( not ( = ?auto_438424 ?auto_438430 ) ) ( not ( = ?auto_438424 ?auto_438431 ) ) ( not ( = ?auto_438424 ?auto_438432 ) ) ( not ( = ?auto_438425 ?auto_438426 ) ) ( not ( = ?auto_438425 ?auto_438427 ) ) ( not ( = ?auto_438425 ?auto_438428 ) ) ( not ( = ?auto_438425 ?auto_438429 ) ) ( not ( = ?auto_438425 ?auto_438430 ) ) ( not ( = ?auto_438425 ?auto_438431 ) ) ( not ( = ?auto_438425 ?auto_438432 ) ) ( not ( = ?auto_438426 ?auto_438427 ) ) ( not ( = ?auto_438426 ?auto_438428 ) ) ( not ( = ?auto_438426 ?auto_438429 ) ) ( not ( = ?auto_438426 ?auto_438430 ) ) ( not ( = ?auto_438426 ?auto_438431 ) ) ( not ( = ?auto_438426 ?auto_438432 ) ) ( not ( = ?auto_438427 ?auto_438428 ) ) ( not ( = ?auto_438427 ?auto_438429 ) ) ( not ( = ?auto_438427 ?auto_438430 ) ) ( not ( = ?auto_438427 ?auto_438431 ) ) ( not ( = ?auto_438427 ?auto_438432 ) ) ( not ( = ?auto_438428 ?auto_438429 ) ) ( not ( = ?auto_438428 ?auto_438430 ) ) ( not ( = ?auto_438428 ?auto_438431 ) ) ( not ( = ?auto_438428 ?auto_438432 ) ) ( not ( = ?auto_438429 ?auto_438430 ) ) ( not ( = ?auto_438429 ?auto_438431 ) ) ( not ( = ?auto_438429 ?auto_438432 ) ) ( not ( = ?auto_438430 ?auto_438431 ) ) ( not ( = ?auto_438430 ?auto_438432 ) ) ( not ( = ?auto_438431 ?auto_438432 ) ) ( ON ?auto_438430 ?auto_438431 ) ( ON ?auto_438429 ?auto_438430 ) ( ON ?auto_438428 ?auto_438429 ) ( ON ?auto_438427 ?auto_438428 ) ( ON ?auto_438426 ?auto_438427 ) ( ON ?auto_438425 ?auto_438426 ) ( ON ?auto_438424 ?auto_438425 ) ( CLEAR ?auto_438422 ) ( ON ?auto_438423 ?auto_438424 ) ( CLEAR ?auto_438423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_438417 ?auto_438418 ?auto_438419 ?auto_438420 ?auto_438421 ?auto_438422 ?auto_438423 )
      ( MAKE-15PILE ?auto_438417 ?auto_438418 ?auto_438419 ?auto_438420 ?auto_438421 ?auto_438422 ?auto_438423 ?auto_438424 ?auto_438425 ?auto_438426 ?auto_438427 ?auto_438428 ?auto_438429 ?auto_438430 ?auto_438431 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438448 - BLOCK
      ?auto_438449 - BLOCK
      ?auto_438450 - BLOCK
      ?auto_438451 - BLOCK
      ?auto_438452 - BLOCK
      ?auto_438453 - BLOCK
      ?auto_438454 - BLOCK
      ?auto_438455 - BLOCK
      ?auto_438456 - BLOCK
      ?auto_438457 - BLOCK
      ?auto_438458 - BLOCK
      ?auto_438459 - BLOCK
      ?auto_438460 - BLOCK
      ?auto_438461 - BLOCK
      ?auto_438462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438462 ) ( ON-TABLE ?auto_438448 ) ( ON ?auto_438449 ?auto_438448 ) ( ON ?auto_438450 ?auto_438449 ) ( ON ?auto_438451 ?auto_438450 ) ( ON ?auto_438452 ?auto_438451 ) ( ON ?auto_438453 ?auto_438452 ) ( not ( = ?auto_438448 ?auto_438449 ) ) ( not ( = ?auto_438448 ?auto_438450 ) ) ( not ( = ?auto_438448 ?auto_438451 ) ) ( not ( = ?auto_438448 ?auto_438452 ) ) ( not ( = ?auto_438448 ?auto_438453 ) ) ( not ( = ?auto_438448 ?auto_438454 ) ) ( not ( = ?auto_438448 ?auto_438455 ) ) ( not ( = ?auto_438448 ?auto_438456 ) ) ( not ( = ?auto_438448 ?auto_438457 ) ) ( not ( = ?auto_438448 ?auto_438458 ) ) ( not ( = ?auto_438448 ?auto_438459 ) ) ( not ( = ?auto_438448 ?auto_438460 ) ) ( not ( = ?auto_438448 ?auto_438461 ) ) ( not ( = ?auto_438448 ?auto_438462 ) ) ( not ( = ?auto_438449 ?auto_438450 ) ) ( not ( = ?auto_438449 ?auto_438451 ) ) ( not ( = ?auto_438449 ?auto_438452 ) ) ( not ( = ?auto_438449 ?auto_438453 ) ) ( not ( = ?auto_438449 ?auto_438454 ) ) ( not ( = ?auto_438449 ?auto_438455 ) ) ( not ( = ?auto_438449 ?auto_438456 ) ) ( not ( = ?auto_438449 ?auto_438457 ) ) ( not ( = ?auto_438449 ?auto_438458 ) ) ( not ( = ?auto_438449 ?auto_438459 ) ) ( not ( = ?auto_438449 ?auto_438460 ) ) ( not ( = ?auto_438449 ?auto_438461 ) ) ( not ( = ?auto_438449 ?auto_438462 ) ) ( not ( = ?auto_438450 ?auto_438451 ) ) ( not ( = ?auto_438450 ?auto_438452 ) ) ( not ( = ?auto_438450 ?auto_438453 ) ) ( not ( = ?auto_438450 ?auto_438454 ) ) ( not ( = ?auto_438450 ?auto_438455 ) ) ( not ( = ?auto_438450 ?auto_438456 ) ) ( not ( = ?auto_438450 ?auto_438457 ) ) ( not ( = ?auto_438450 ?auto_438458 ) ) ( not ( = ?auto_438450 ?auto_438459 ) ) ( not ( = ?auto_438450 ?auto_438460 ) ) ( not ( = ?auto_438450 ?auto_438461 ) ) ( not ( = ?auto_438450 ?auto_438462 ) ) ( not ( = ?auto_438451 ?auto_438452 ) ) ( not ( = ?auto_438451 ?auto_438453 ) ) ( not ( = ?auto_438451 ?auto_438454 ) ) ( not ( = ?auto_438451 ?auto_438455 ) ) ( not ( = ?auto_438451 ?auto_438456 ) ) ( not ( = ?auto_438451 ?auto_438457 ) ) ( not ( = ?auto_438451 ?auto_438458 ) ) ( not ( = ?auto_438451 ?auto_438459 ) ) ( not ( = ?auto_438451 ?auto_438460 ) ) ( not ( = ?auto_438451 ?auto_438461 ) ) ( not ( = ?auto_438451 ?auto_438462 ) ) ( not ( = ?auto_438452 ?auto_438453 ) ) ( not ( = ?auto_438452 ?auto_438454 ) ) ( not ( = ?auto_438452 ?auto_438455 ) ) ( not ( = ?auto_438452 ?auto_438456 ) ) ( not ( = ?auto_438452 ?auto_438457 ) ) ( not ( = ?auto_438452 ?auto_438458 ) ) ( not ( = ?auto_438452 ?auto_438459 ) ) ( not ( = ?auto_438452 ?auto_438460 ) ) ( not ( = ?auto_438452 ?auto_438461 ) ) ( not ( = ?auto_438452 ?auto_438462 ) ) ( not ( = ?auto_438453 ?auto_438454 ) ) ( not ( = ?auto_438453 ?auto_438455 ) ) ( not ( = ?auto_438453 ?auto_438456 ) ) ( not ( = ?auto_438453 ?auto_438457 ) ) ( not ( = ?auto_438453 ?auto_438458 ) ) ( not ( = ?auto_438453 ?auto_438459 ) ) ( not ( = ?auto_438453 ?auto_438460 ) ) ( not ( = ?auto_438453 ?auto_438461 ) ) ( not ( = ?auto_438453 ?auto_438462 ) ) ( not ( = ?auto_438454 ?auto_438455 ) ) ( not ( = ?auto_438454 ?auto_438456 ) ) ( not ( = ?auto_438454 ?auto_438457 ) ) ( not ( = ?auto_438454 ?auto_438458 ) ) ( not ( = ?auto_438454 ?auto_438459 ) ) ( not ( = ?auto_438454 ?auto_438460 ) ) ( not ( = ?auto_438454 ?auto_438461 ) ) ( not ( = ?auto_438454 ?auto_438462 ) ) ( not ( = ?auto_438455 ?auto_438456 ) ) ( not ( = ?auto_438455 ?auto_438457 ) ) ( not ( = ?auto_438455 ?auto_438458 ) ) ( not ( = ?auto_438455 ?auto_438459 ) ) ( not ( = ?auto_438455 ?auto_438460 ) ) ( not ( = ?auto_438455 ?auto_438461 ) ) ( not ( = ?auto_438455 ?auto_438462 ) ) ( not ( = ?auto_438456 ?auto_438457 ) ) ( not ( = ?auto_438456 ?auto_438458 ) ) ( not ( = ?auto_438456 ?auto_438459 ) ) ( not ( = ?auto_438456 ?auto_438460 ) ) ( not ( = ?auto_438456 ?auto_438461 ) ) ( not ( = ?auto_438456 ?auto_438462 ) ) ( not ( = ?auto_438457 ?auto_438458 ) ) ( not ( = ?auto_438457 ?auto_438459 ) ) ( not ( = ?auto_438457 ?auto_438460 ) ) ( not ( = ?auto_438457 ?auto_438461 ) ) ( not ( = ?auto_438457 ?auto_438462 ) ) ( not ( = ?auto_438458 ?auto_438459 ) ) ( not ( = ?auto_438458 ?auto_438460 ) ) ( not ( = ?auto_438458 ?auto_438461 ) ) ( not ( = ?auto_438458 ?auto_438462 ) ) ( not ( = ?auto_438459 ?auto_438460 ) ) ( not ( = ?auto_438459 ?auto_438461 ) ) ( not ( = ?auto_438459 ?auto_438462 ) ) ( not ( = ?auto_438460 ?auto_438461 ) ) ( not ( = ?auto_438460 ?auto_438462 ) ) ( not ( = ?auto_438461 ?auto_438462 ) ) ( ON ?auto_438461 ?auto_438462 ) ( ON ?auto_438460 ?auto_438461 ) ( ON ?auto_438459 ?auto_438460 ) ( ON ?auto_438458 ?auto_438459 ) ( ON ?auto_438457 ?auto_438458 ) ( ON ?auto_438456 ?auto_438457 ) ( ON ?auto_438455 ?auto_438456 ) ( CLEAR ?auto_438453 ) ( ON ?auto_438454 ?auto_438455 ) ( CLEAR ?auto_438454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_438448 ?auto_438449 ?auto_438450 ?auto_438451 ?auto_438452 ?auto_438453 ?auto_438454 )
      ( MAKE-15PILE ?auto_438448 ?auto_438449 ?auto_438450 ?auto_438451 ?auto_438452 ?auto_438453 ?auto_438454 ?auto_438455 ?auto_438456 ?auto_438457 ?auto_438458 ?auto_438459 ?auto_438460 ?auto_438461 ?auto_438462 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438478 - BLOCK
      ?auto_438479 - BLOCK
      ?auto_438480 - BLOCK
      ?auto_438481 - BLOCK
      ?auto_438482 - BLOCK
      ?auto_438483 - BLOCK
      ?auto_438484 - BLOCK
      ?auto_438485 - BLOCK
      ?auto_438486 - BLOCK
      ?auto_438487 - BLOCK
      ?auto_438488 - BLOCK
      ?auto_438489 - BLOCK
      ?auto_438490 - BLOCK
      ?auto_438491 - BLOCK
      ?auto_438492 - BLOCK
    )
    :vars
    (
      ?auto_438493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438492 ?auto_438493 ) ( ON-TABLE ?auto_438478 ) ( ON ?auto_438479 ?auto_438478 ) ( ON ?auto_438480 ?auto_438479 ) ( ON ?auto_438481 ?auto_438480 ) ( ON ?auto_438482 ?auto_438481 ) ( not ( = ?auto_438478 ?auto_438479 ) ) ( not ( = ?auto_438478 ?auto_438480 ) ) ( not ( = ?auto_438478 ?auto_438481 ) ) ( not ( = ?auto_438478 ?auto_438482 ) ) ( not ( = ?auto_438478 ?auto_438483 ) ) ( not ( = ?auto_438478 ?auto_438484 ) ) ( not ( = ?auto_438478 ?auto_438485 ) ) ( not ( = ?auto_438478 ?auto_438486 ) ) ( not ( = ?auto_438478 ?auto_438487 ) ) ( not ( = ?auto_438478 ?auto_438488 ) ) ( not ( = ?auto_438478 ?auto_438489 ) ) ( not ( = ?auto_438478 ?auto_438490 ) ) ( not ( = ?auto_438478 ?auto_438491 ) ) ( not ( = ?auto_438478 ?auto_438492 ) ) ( not ( = ?auto_438478 ?auto_438493 ) ) ( not ( = ?auto_438479 ?auto_438480 ) ) ( not ( = ?auto_438479 ?auto_438481 ) ) ( not ( = ?auto_438479 ?auto_438482 ) ) ( not ( = ?auto_438479 ?auto_438483 ) ) ( not ( = ?auto_438479 ?auto_438484 ) ) ( not ( = ?auto_438479 ?auto_438485 ) ) ( not ( = ?auto_438479 ?auto_438486 ) ) ( not ( = ?auto_438479 ?auto_438487 ) ) ( not ( = ?auto_438479 ?auto_438488 ) ) ( not ( = ?auto_438479 ?auto_438489 ) ) ( not ( = ?auto_438479 ?auto_438490 ) ) ( not ( = ?auto_438479 ?auto_438491 ) ) ( not ( = ?auto_438479 ?auto_438492 ) ) ( not ( = ?auto_438479 ?auto_438493 ) ) ( not ( = ?auto_438480 ?auto_438481 ) ) ( not ( = ?auto_438480 ?auto_438482 ) ) ( not ( = ?auto_438480 ?auto_438483 ) ) ( not ( = ?auto_438480 ?auto_438484 ) ) ( not ( = ?auto_438480 ?auto_438485 ) ) ( not ( = ?auto_438480 ?auto_438486 ) ) ( not ( = ?auto_438480 ?auto_438487 ) ) ( not ( = ?auto_438480 ?auto_438488 ) ) ( not ( = ?auto_438480 ?auto_438489 ) ) ( not ( = ?auto_438480 ?auto_438490 ) ) ( not ( = ?auto_438480 ?auto_438491 ) ) ( not ( = ?auto_438480 ?auto_438492 ) ) ( not ( = ?auto_438480 ?auto_438493 ) ) ( not ( = ?auto_438481 ?auto_438482 ) ) ( not ( = ?auto_438481 ?auto_438483 ) ) ( not ( = ?auto_438481 ?auto_438484 ) ) ( not ( = ?auto_438481 ?auto_438485 ) ) ( not ( = ?auto_438481 ?auto_438486 ) ) ( not ( = ?auto_438481 ?auto_438487 ) ) ( not ( = ?auto_438481 ?auto_438488 ) ) ( not ( = ?auto_438481 ?auto_438489 ) ) ( not ( = ?auto_438481 ?auto_438490 ) ) ( not ( = ?auto_438481 ?auto_438491 ) ) ( not ( = ?auto_438481 ?auto_438492 ) ) ( not ( = ?auto_438481 ?auto_438493 ) ) ( not ( = ?auto_438482 ?auto_438483 ) ) ( not ( = ?auto_438482 ?auto_438484 ) ) ( not ( = ?auto_438482 ?auto_438485 ) ) ( not ( = ?auto_438482 ?auto_438486 ) ) ( not ( = ?auto_438482 ?auto_438487 ) ) ( not ( = ?auto_438482 ?auto_438488 ) ) ( not ( = ?auto_438482 ?auto_438489 ) ) ( not ( = ?auto_438482 ?auto_438490 ) ) ( not ( = ?auto_438482 ?auto_438491 ) ) ( not ( = ?auto_438482 ?auto_438492 ) ) ( not ( = ?auto_438482 ?auto_438493 ) ) ( not ( = ?auto_438483 ?auto_438484 ) ) ( not ( = ?auto_438483 ?auto_438485 ) ) ( not ( = ?auto_438483 ?auto_438486 ) ) ( not ( = ?auto_438483 ?auto_438487 ) ) ( not ( = ?auto_438483 ?auto_438488 ) ) ( not ( = ?auto_438483 ?auto_438489 ) ) ( not ( = ?auto_438483 ?auto_438490 ) ) ( not ( = ?auto_438483 ?auto_438491 ) ) ( not ( = ?auto_438483 ?auto_438492 ) ) ( not ( = ?auto_438483 ?auto_438493 ) ) ( not ( = ?auto_438484 ?auto_438485 ) ) ( not ( = ?auto_438484 ?auto_438486 ) ) ( not ( = ?auto_438484 ?auto_438487 ) ) ( not ( = ?auto_438484 ?auto_438488 ) ) ( not ( = ?auto_438484 ?auto_438489 ) ) ( not ( = ?auto_438484 ?auto_438490 ) ) ( not ( = ?auto_438484 ?auto_438491 ) ) ( not ( = ?auto_438484 ?auto_438492 ) ) ( not ( = ?auto_438484 ?auto_438493 ) ) ( not ( = ?auto_438485 ?auto_438486 ) ) ( not ( = ?auto_438485 ?auto_438487 ) ) ( not ( = ?auto_438485 ?auto_438488 ) ) ( not ( = ?auto_438485 ?auto_438489 ) ) ( not ( = ?auto_438485 ?auto_438490 ) ) ( not ( = ?auto_438485 ?auto_438491 ) ) ( not ( = ?auto_438485 ?auto_438492 ) ) ( not ( = ?auto_438485 ?auto_438493 ) ) ( not ( = ?auto_438486 ?auto_438487 ) ) ( not ( = ?auto_438486 ?auto_438488 ) ) ( not ( = ?auto_438486 ?auto_438489 ) ) ( not ( = ?auto_438486 ?auto_438490 ) ) ( not ( = ?auto_438486 ?auto_438491 ) ) ( not ( = ?auto_438486 ?auto_438492 ) ) ( not ( = ?auto_438486 ?auto_438493 ) ) ( not ( = ?auto_438487 ?auto_438488 ) ) ( not ( = ?auto_438487 ?auto_438489 ) ) ( not ( = ?auto_438487 ?auto_438490 ) ) ( not ( = ?auto_438487 ?auto_438491 ) ) ( not ( = ?auto_438487 ?auto_438492 ) ) ( not ( = ?auto_438487 ?auto_438493 ) ) ( not ( = ?auto_438488 ?auto_438489 ) ) ( not ( = ?auto_438488 ?auto_438490 ) ) ( not ( = ?auto_438488 ?auto_438491 ) ) ( not ( = ?auto_438488 ?auto_438492 ) ) ( not ( = ?auto_438488 ?auto_438493 ) ) ( not ( = ?auto_438489 ?auto_438490 ) ) ( not ( = ?auto_438489 ?auto_438491 ) ) ( not ( = ?auto_438489 ?auto_438492 ) ) ( not ( = ?auto_438489 ?auto_438493 ) ) ( not ( = ?auto_438490 ?auto_438491 ) ) ( not ( = ?auto_438490 ?auto_438492 ) ) ( not ( = ?auto_438490 ?auto_438493 ) ) ( not ( = ?auto_438491 ?auto_438492 ) ) ( not ( = ?auto_438491 ?auto_438493 ) ) ( not ( = ?auto_438492 ?auto_438493 ) ) ( ON ?auto_438491 ?auto_438492 ) ( ON ?auto_438490 ?auto_438491 ) ( ON ?auto_438489 ?auto_438490 ) ( ON ?auto_438488 ?auto_438489 ) ( ON ?auto_438487 ?auto_438488 ) ( ON ?auto_438486 ?auto_438487 ) ( ON ?auto_438485 ?auto_438486 ) ( ON ?auto_438484 ?auto_438485 ) ( CLEAR ?auto_438482 ) ( ON ?auto_438483 ?auto_438484 ) ( CLEAR ?auto_438483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_438478 ?auto_438479 ?auto_438480 ?auto_438481 ?auto_438482 ?auto_438483 )
      ( MAKE-15PILE ?auto_438478 ?auto_438479 ?auto_438480 ?auto_438481 ?auto_438482 ?auto_438483 ?auto_438484 ?auto_438485 ?auto_438486 ?auto_438487 ?auto_438488 ?auto_438489 ?auto_438490 ?auto_438491 ?auto_438492 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438509 - BLOCK
      ?auto_438510 - BLOCK
      ?auto_438511 - BLOCK
      ?auto_438512 - BLOCK
      ?auto_438513 - BLOCK
      ?auto_438514 - BLOCK
      ?auto_438515 - BLOCK
      ?auto_438516 - BLOCK
      ?auto_438517 - BLOCK
      ?auto_438518 - BLOCK
      ?auto_438519 - BLOCK
      ?auto_438520 - BLOCK
      ?auto_438521 - BLOCK
      ?auto_438522 - BLOCK
      ?auto_438523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438523 ) ( ON-TABLE ?auto_438509 ) ( ON ?auto_438510 ?auto_438509 ) ( ON ?auto_438511 ?auto_438510 ) ( ON ?auto_438512 ?auto_438511 ) ( ON ?auto_438513 ?auto_438512 ) ( not ( = ?auto_438509 ?auto_438510 ) ) ( not ( = ?auto_438509 ?auto_438511 ) ) ( not ( = ?auto_438509 ?auto_438512 ) ) ( not ( = ?auto_438509 ?auto_438513 ) ) ( not ( = ?auto_438509 ?auto_438514 ) ) ( not ( = ?auto_438509 ?auto_438515 ) ) ( not ( = ?auto_438509 ?auto_438516 ) ) ( not ( = ?auto_438509 ?auto_438517 ) ) ( not ( = ?auto_438509 ?auto_438518 ) ) ( not ( = ?auto_438509 ?auto_438519 ) ) ( not ( = ?auto_438509 ?auto_438520 ) ) ( not ( = ?auto_438509 ?auto_438521 ) ) ( not ( = ?auto_438509 ?auto_438522 ) ) ( not ( = ?auto_438509 ?auto_438523 ) ) ( not ( = ?auto_438510 ?auto_438511 ) ) ( not ( = ?auto_438510 ?auto_438512 ) ) ( not ( = ?auto_438510 ?auto_438513 ) ) ( not ( = ?auto_438510 ?auto_438514 ) ) ( not ( = ?auto_438510 ?auto_438515 ) ) ( not ( = ?auto_438510 ?auto_438516 ) ) ( not ( = ?auto_438510 ?auto_438517 ) ) ( not ( = ?auto_438510 ?auto_438518 ) ) ( not ( = ?auto_438510 ?auto_438519 ) ) ( not ( = ?auto_438510 ?auto_438520 ) ) ( not ( = ?auto_438510 ?auto_438521 ) ) ( not ( = ?auto_438510 ?auto_438522 ) ) ( not ( = ?auto_438510 ?auto_438523 ) ) ( not ( = ?auto_438511 ?auto_438512 ) ) ( not ( = ?auto_438511 ?auto_438513 ) ) ( not ( = ?auto_438511 ?auto_438514 ) ) ( not ( = ?auto_438511 ?auto_438515 ) ) ( not ( = ?auto_438511 ?auto_438516 ) ) ( not ( = ?auto_438511 ?auto_438517 ) ) ( not ( = ?auto_438511 ?auto_438518 ) ) ( not ( = ?auto_438511 ?auto_438519 ) ) ( not ( = ?auto_438511 ?auto_438520 ) ) ( not ( = ?auto_438511 ?auto_438521 ) ) ( not ( = ?auto_438511 ?auto_438522 ) ) ( not ( = ?auto_438511 ?auto_438523 ) ) ( not ( = ?auto_438512 ?auto_438513 ) ) ( not ( = ?auto_438512 ?auto_438514 ) ) ( not ( = ?auto_438512 ?auto_438515 ) ) ( not ( = ?auto_438512 ?auto_438516 ) ) ( not ( = ?auto_438512 ?auto_438517 ) ) ( not ( = ?auto_438512 ?auto_438518 ) ) ( not ( = ?auto_438512 ?auto_438519 ) ) ( not ( = ?auto_438512 ?auto_438520 ) ) ( not ( = ?auto_438512 ?auto_438521 ) ) ( not ( = ?auto_438512 ?auto_438522 ) ) ( not ( = ?auto_438512 ?auto_438523 ) ) ( not ( = ?auto_438513 ?auto_438514 ) ) ( not ( = ?auto_438513 ?auto_438515 ) ) ( not ( = ?auto_438513 ?auto_438516 ) ) ( not ( = ?auto_438513 ?auto_438517 ) ) ( not ( = ?auto_438513 ?auto_438518 ) ) ( not ( = ?auto_438513 ?auto_438519 ) ) ( not ( = ?auto_438513 ?auto_438520 ) ) ( not ( = ?auto_438513 ?auto_438521 ) ) ( not ( = ?auto_438513 ?auto_438522 ) ) ( not ( = ?auto_438513 ?auto_438523 ) ) ( not ( = ?auto_438514 ?auto_438515 ) ) ( not ( = ?auto_438514 ?auto_438516 ) ) ( not ( = ?auto_438514 ?auto_438517 ) ) ( not ( = ?auto_438514 ?auto_438518 ) ) ( not ( = ?auto_438514 ?auto_438519 ) ) ( not ( = ?auto_438514 ?auto_438520 ) ) ( not ( = ?auto_438514 ?auto_438521 ) ) ( not ( = ?auto_438514 ?auto_438522 ) ) ( not ( = ?auto_438514 ?auto_438523 ) ) ( not ( = ?auto_438515 ?auto_438516 ) ) ( not ( = ?auto_438515 ?auto_438517 ) ) ( not ( = ?auto_438515 ?auto_438518 ) ) ( not ( = ?auto_438515 ?auto_438519 ) ) ( not ( = ?auto_438515 ?auto_438520 ) ) ( not ( = ?auto_438515 ?auto_438521 ) ) ( not ( = ?auto_438515 ?auto_438522 ) ) ( not ( = ?auto_438515 ?auto_438523 ) ) ( not ( = ?auto_438516 ?auto_438517 ) ) ( not ( = ?auto_438516 ?auto_438518 ) ) ( not ( = ?auto_438516 ?auto_438519 ) ) ( not ( = ?auto_438516 ?auto_438520 ) ) ( not ( = ?auto_438516 ?auto_438521 ) ) ( not ( = ?auto_438516 ?auto_438522 ) ) ( not ( = ?auto_438516 ?auto_438523 ) ) ( not ( = ?auto_438517 ?auto_438518 ) ) ( not ( = ?auto_438517 ?auto_438519 ) ) ( not ( = ?auto_438517 ?auto_438520 ) ) ( not ( = ?auto_438517 ?auto_438521 ) ) ( not ( = ?auto_438517 ?auto_438522 ) ) ( not ( = ?auto_438517 ?auto_438523 ) ) ( not ( = ?auto_438518 ?auto_438519 ) ) ( not ( = ?auto_438518 ?auto_438520 ) ) ( not ( = ?auto_438518 ?auto_438521 ) ) ( not ( = ?auto_438518 ?auto_438522 ) ) ( not ( = ?auto_438518 ?auto_438523 ) ) ( not ( = ?auto_438519 ?auto_438520 ) ) ( not ( = ?auto_438519 ?auto_438521 ) ) ( not ( = ?auto_438519 ?auto_438522 ) ) ( not ( = ?auto_438519 ?auto_438523 ) ) ( not ( = ?auto_438520 ?auto_438521 ) ) ( not ( = ?auto_438520 ?auto_438522 ) ) ( not ( = ?auto_438520 ?auto_438523 ) ) ( not ( = ?auto_438521 ?auto_438522 ) ) ( not ( = ?auto_438521 ?auto_438523 ) ) ( not ( = ?auto_438522 ?auto_438523 ) ) ( ON ?auto_438522 ?auto_438523 ) ( ON ?auto_438521 ?auto_438522 ) ( ON ?auto_438520 ?auto_438521 ) ( ON ?auto_438519 ?auto_438520 ) ( ON ?auto_438518 ?auto_438519 ) ( ON ?auto_438517 ?auto_438518 ) ( ON ?auto_438516 ?auto_438517 ) ( ON ?auto_438515 ?auto_438516 ) ( CLEAR ?auto_438513 ) ( ON ?auto_438514 ?auto_438515 ) ( CLEAR ?auto_438514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_438509 ?auto_438510 ?auto_438511 ?auto_438512 ?auto_438513 ?auto_438514 )
      ( MAKE-15PILE ?auto_438509 ?auto_438510 ?auto_438511 ?auto_438512 ?auto_438513 ?auto_438514 ?auto_438515 ?auto_438516 ?auto_438517 ?auto_438518 ?auto_438519 ?auto_438520 ?auto_438521 ?auto_438522 ?auto_438523 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438539 - BLOCK
      ?auto_438540 - BLOCK
      ?auto_438541 - BLOCK
      ?auto_438542 - BLOCK
      ?auto_438543 - BLOCK
      ?auto_438544 - BLOCK
      ?auto_438545 - BLOCK
      ?auto_438546 - BLOCK
      ?auto_438547 - BLOCK
      ?auto_438548 - BLOCK
      ?auto_438549 - BLOCK
      ?auto_438550 - BLOCK
      ?auto_438551 - BLOCK
      ?auto_438552 - BLOCK
      ?auto_438553 - BLOCK
    )
    :vars
    (
      ?auto_438554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438553 ?auto_438554 ) ( ON-TABLE ?auto_438539 ) ( ON ?auto_438540 ?auto_438539 ) ( ON ?auto_438541 ?auto_438540 ) ( ON ?auto_438542 ?auto_438541 ) ( not ( = ?auto_438539 ?auto_438540 ) ) ( not ( = ?auto_438539 ?auto_438541 ) ) ( not ( = ?auto_438539 ?auto_438542 ) ) ( not ( = ?auto_438539 ?auto_438543 ) ) ( not ( = ?auto_438539 ?auto_438544 ) ) ( not ( = ?auto_438539 ?auto_438545 ) ) ( not ( = ?auto_438539 ?auto_438546 ) ) ( not ( = ?auto_438539 ?auto_438547 ) ) ( not ( = ?auto_438539 ?auto_438548 ) ) ( not ( = ?auto_438539 ?auto_438549 ) ) ( not ( = ?auto_438539 ?auto_438550 ) ) ( not ( = ?auto_438539 ?auto_438551 ) ) ( not ( = ?auto_438539 ?auto_438552 ) ) ( not ( = ?auto_438539 ?auto_438553 ) ) ( not ( = ?auto_438539 ?auto_438554 ) ) ( not ( = ?auto_438540 ?auto_438541 ) ) ( not ( = ?auto_438540 ?auto_438542 ) ) ( not ( = ?auto_438540 ?auto_438543 ) ) ( not ( = ?auto_438540 ?auto_438544 ) ) ( not ( = ?auto_438540 ?auto_438545 ) ) ( not ( = ?auto_438540 ?auto_438546 ) ) ( not ( = ?auto_438540 ?auto_438547 ) ) ( not ( = ?auto_438540 ?auto_438548 ) ) ( not ( = ?auto_438540 ?auto_438549 ) ) ( not ( = ?auto_438540 ?auto_438550 ) ) ( not ( = ?auto_438540 ?auto_438551 ) ) ( not ( = ?auto_438540 ?auto_438552 ) ) ( not ( = ?auto_438540 ?auto_438553 ) ) ( not ( = ?auto_438540 ?auto_438554 ) ) ( not ( = ?auto_438541 ?auto_438542 ) ) ( not ( = ?auto_438541 ?auto_438543 ) ) ( not ( = ?auto_438541 ?auto_438544 ) ) ( not ( = ?auto_438541 ?auto_438545 ) ) ( not ( = ?auto_438541 ?auto_438546 ) ) ( not ( = ?auto_438541 ?auto_438547 ) ) ( not ( = ?auto_438541 ?auto_438548 ) ) ( not ( = ?auto_438541 ?auto_438549 ) ) ( not ( = ?auto_438541 ?auto_438550 ) ) ( not ( = ?auto_438541 ?auto_438551 ) ) ( not ( = ?auto_438541 ?auto_438552 ) ) ( not ( = ?auto_438541 ?auto_438553 ) ) ( not ( = ?auto_438541 ?auto_438554 ) ) ( not ( = ?auto_438542 ?auto_438543 ) ) ( not ( = ?auto_438542 ?auto_438544 ) ) ( not ( = ?auto_438542 ?auto_438545 ) ) ( not ( = ?auto_438542 ?auto_438546 ) ) ( not ( = ?auto_438542 ?auto_438547 ) ) ( not ( = ?auto_438542 ?auto_438548 ) ) ( not ( = ?auto_438542 ?auto_438549 ) ) ( not ( = ?auto_438542 ?auto_438550 ) ) ( not ( = ?auto_438542 ?auto_438551 ) ) ( not ( = ?auto_438542 ?auto_438552 ) ) ( not ( = ?auto_438542 ?auto_438553 ) ) ( not ( = ?auto_438542 ?auto_438554 ) ) ( not ( = ?auto_438543 ?auto_438544 ) ) ( not ( = ?auto_438543 ?auto_438545 ) ) ( not ( = ?auto_438543 ?auto_438546 ) ) ( not ( = ?auto_438543 ?auto_438547 ) ) ( not ( = ?auto_438543 ?auto_438548 ) ) ( not ( = ?auto_438543 ?auto_438549 ) ) ( not ( = ?auto_438543 ?auto_438550 ) ) ( not ( = ?auto_438543 ?auto_438551 ) ) ( not ( = ?auto_438543 ?auto_438552 ) ) ( not ( = ?auto_438543 ?auto_438553 ) ) ( not ( = ?auto_438543 ?auto_438554 ) ) ( not ( = ?auto_438544 ?auto_438545 ) ) ( not ( = ?auto_438544 ?auto_438546 ) ) ( not ( = ?auto_438544 ?auto_438547 ) ) ( not ( = ?auto_438544 ?auto_438548 ) ) ( not ( = ?auto_438544 ?auto_438549 ) ) ( not ( = ?auto_438544 ?auto_438550 ) ) ( not ( = ?auto_438544 ?auto_438551 ) ) ( not ( = ?auto_438544 ?auto_438552 ) ) ( not ( = ?auto_438544 ?auto_438553 ) ) ( not ( = ?auto_438544 ?auto_438554 ) ) ( not ( = ?auto_438545 ?auto_438546 ) ) ( not ( = ?auto_438545 ?auto_438547 ) ) ( not ( = ?auto_438545 ?auto_438548 ) ) ( not ( = ?auto_438545 ?auto_438549 ) ) ( not ( = ?auto_438545 ?auto_438550 ) ) ( not ( = ?auto_438545 ?auto_438551 ) ) ( not ( = ?auto_438545 ?auto_438552 ) ) ( not ( = ?auto_438545 ?auto_438553 ) ) ( not ( = ?auto_438545 ?auto_438554 ) ) ( not ( = ?auto_438546 ?auto_438547 ) ) ( not ( = ?auto_438546 ?auto_438548 ) ) ( not ( = ?auto_438546 ?auto_438549 ) ) ( not ( = ?auto_438546 ?auto_438550 ) ) ( not ( = ?auto_438546 ?auto_438551 ) ) ( not ( = ?auto_438546 ?auto_438552 ) ) ( not ( = ?auto_438546 ?auto_438553 ) ) ( not ( = ?auto_438546 ?auto_438554 ) ) ( not ( = ?auto_438547 ?auto_438548 ) ) ( not ( = ?auto_438547 ?auto_438549 ) ) ( not ( = ?auto_438547 ?auto_438550 ) ) ( not ( = ?auto_438547 ?auto_438551 ) ) ( not ( = ?auto_438547 ?auto_438552 ) ) ( not ( = ?auto_438547 ?auto_438553 ) ) ( not ( = ?auto_438547 ?auto_438554 ) ) ( not ( = ?auto_438548 ?auto_438549 ) ) ( not ( = ?auto_438548 ?auto_438550 ) ) ( not ( = ?auto_438548 ?auto_438551 ) ) ( not ( = ?auto_438548 ?auto_438552 ) ) ( not ( = ?auto_438548 ?auto_438553 ) ) ( not ( = ?auto_438548 ?auto_438554 ) ) ( not ( = ?auto_438549 ?auto_438550 ) ) ( not ( = ?auto_438549 ?auto_438551 ) ) ( not ( = ?auto_438549 ?auto_438552 ) ) ( not ( = ?auto_438549 ?auto_438553 ) ) ( not ( = ?auto_438549 ?auto_438554 ) ) ( not ( = ?auto_438550 ?auto_438551 ) ) ( not ( = ?auto_438550 ?auto_438552 ) ) ( not ( = ?auto_438550 ?auto_438553 ) ) ( not ( = ?auto_438550 ?auto_438554 ) ) ( not ( = ?auto_438551 ?auto_438552 ) ) ( not ( = ?auto_438551 ?auto_438553 ) ) ( not ( = ?auto_438551 ?auto_438554 ) ) ( not ( = ?auto_438552 ?auto_438553 ) ) ( not ( = ?auto_438552 ?auto_438554 ) ) ( not ( = ?auto_438553 ?auto_438554 ) ) ( ON ?auto_438552 ?auto_438553 ) ( ON ?auto_438551 ?auto_438552 ) ( ON ?auto_438550 ?auto_438551 ) ( ON ?auto_438549 ?auto_438550 ) ( ON ?auto_438548 ?auto_438549 ) ( ON ?auto_438547 ?auto_438548 ) ( ON ?auto_438546 ?auto_438547 ) ( ON ?auto_438545 ?auto_438546 ) ( ON ?auto_438544 ?auto_438545 ) ( CLEAR ?auto_438542 ) ( ON ?auto_438543 ?auto_438544 ) ( CLEAR ?auto_438543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_438539 ?auto_438540 ?auto_438541 ?auto_438542 ?auto_438543 )
      ( MAKE-15PILE ?auto_438539 ?auto_438540 ?auto_438541 ?auto_438542 ?auto_438543 ?auto_438544 ?auto_438545 ?auto_438546 ?auto_438547 ?auto_438548 ?auto_438549 ?auto_438550 ?auto_438551 ?auto_438552 ?auto_438553 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438570 - BLOCK
      ?auto_438571 - BLOCK
      ?auto_438572 - BLOCK
      ?auto_438573 - BLOCK
      ?auto_438574 - BLOCK
      ?auto_438575 - BLOCK
      ?auto_438576 - BLOCK
      ?auto_438577 - BLOCK
      ?auto_438578 - BLOCK
      ?auto_438579 - BLOCK
      ?auto_438580 - BLOCK
      ?auto_438581 - BLOCK
      ?auto_438582 - BLOCK
      ?auto_438583 - BLOCK
      ?auto_438584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438584 ) ( ON-TABLE ?auto_438570 ) ( ON ?auto_438571 ?auto_438570 ) ( ON ?auto_438572 ?auto_438571 ) ( ON ?auto_438573 ?auto_438572 ) ( not ( = ?auto_438570 ?auto_438571 ) ) ( not ( = ?auto_438570 ?auto_438572 ) ) ( not ( = ?auto_438570 ?auto_438573 ) ) ( not ( = ?auto_438570 ?auto_438574 ) ) ( not ( = ?auto_438570 ?auto_438575 ) ) ( not ( = ?auto_438570 ?auto_438576 ) ) ( not ( = ?auto_438570 ?auto_438577 ) ) ( not ( = ?auto_438570 ?auto_438578 ) ) ( not ( = ?auto_438570 ?auto_438579 ) ) ( not ( = ?auto_438570 ?auto_438580 ) ) ( not ( = ?auto_438570 ?auto_438581 ) ) ( not ( = ?auto_438570 ?auto_438582 ) ) ( not ( = ?auto_438570 ?auto_438583 ) ) ( not ( = ?auto_438570 ?auto_438584 ) ) ( not ( = ?auto_438571 ?auto_438572 ) ) ( not ( = ?auto_438571 ?auto_438573 ) ) ( not ( = ?auto_438571 ?auto_438574 ) ) ( not ( = ?auto_438571 ?auto_438575 ) ) ( not ( = ?auto_438571 ?auto_438576 ) ) ( not ( = ?auto_438571 ?auto_438577 ) ) ( not ( = ?auto_438571 ?auto_438578 ) ) ( not ( = ?auto_438571 ?auto_438579 ) ) ( not ( = ?auto_438571 ?auto_438580 ) ) ( not ( = ?auto_438571 ?auto_438581 ) ) ( not ( = ?auto_438571 ?auto_438582 ) ) ( not ( = ?auto_438571 ?auto_438583 ) ) ( not ( = ?auto_438571 ?auto_438584 ) ) ( not ( = ?auto_438572 ?auto_438573 ) ) ( not ( = ?auto_438572 ?auto_438574 ) ) ( not ( = ?auto_438572 ?auto_438575 ) ) ( not ( = ?auto_438572 ?auto_438576 ) ) ( not ( = ?auto_438572 ?auto_438577 ) ) ( not ( = ?auto_438572 ?auto_438578 ) ) ( not ( = ?auto_438572 ?auto_438579 ) ) ( not ( = ?auto_438572 ?auto_438580 ) ) ( not ( = ?auto_438572 ?auto_438581 ) ) ( not ( = ?auto_438572 ?auto_438582 ) ) ( not ( = ?auto_438572 ?auto_438583 ) ) ( not ( = ?auto_438572 ?auto_438584 ) ) ( not ( = ?auto_438573 ?auto_438574 ) ) ( not ( = ?auto_438573 ?auto_438575 ) ) ( not ( = ?auto_438573 ?auto_438576 ) ) ( not ( = ?auto_438573 ?auto_438577 ) ) ( not ( = ?auto_438573 ?auto_438578 ) ) ( not ( = ?auto_438573 ?auto_438579 ) ) ( not ( = ?auto_438573 ?auto_438580 ) ) ( not ( = ?auto_438573 ?auto_438581 ) ) ( not ( = ?auto_438573 ?auto_438582 ) ) ( not ( = ?auto_438573 ?auto_438583 ) ) ( not ( = ?auto_438573 ?auto_438584 ) ) ( not ( = ?auto_438574 ?auto_438575 ) ) ( not ( = ?auto_438574 ?auto_438576 ) ) ( not ( = ?auto_438574 ?auto_438577 ) ) ( not ( = ?auto_438574 ?auto_438578 ) ) ( not ( = ?auto_438574 ?auto_438579 ) ) ( not ( = ?auto_438574 ?auto_438580 ) ) ( not ( = ?auto_438574 ?auto_438581 ) ) ( not ( = ?auto_438574 ?auto_438582 ) ) ( not ( = ?auto_438574 ?auto_438583 ) ) ( not ( = ?auto_438574 ?auto_438584 ) ) ( not ( = ?auto_438575 ?auto_438576 ) ) ( not ( = ?auto_438575 ?auto_438577 ) ) ( not ( = ?auto_438575 ?auto_438578 ) ) ( not ( = ?auto_438575 ?auto_438579 ) ) ( not ( = ?auto_438575 ?auto_438580 ) ) ( not ( = ?auto_438575 ?auto_438581 ) ) ( not ( = ?auto_438575 ?auto_438582 ) ) ( not ( = ?auto_438575 ?auto_438583 ) ) ( not ( = ?auto_438575 ?auto_438584 ) ) ( not ( = ?auto_438576 ?auto_438577 ) ) ( not ( = ?auto_438576 ?auto_438578 ) ) ( not ( = ?auto_438576 ?auto_438579 ) ) ( not ( = ?auto_438576 ?auto_438580 ) ) ( not ( = ?auto_438576 ?auto_438581 ) ) ( not ( = ?auto_438576 ?auto_438582 ) ) ( not ( = ?auto_438576 ?auto_438583 ) ) ( not ( = ?auto_438576 ?auto_438584 ) ) ( not ( = ?auto_438577 ?auto_438578 ) ) ( not ( = ?auto_438577 ?auto_438579 ) ) ( not ( = ?auto_438577 ?auto_438580 ) ) ( not ( = ?auto_438577 ?auto_438581 ) ) ( not ( = ?auto_438577 ?auto_438582 ) ) ( not ( = ?auto_438577 ?auto_438583 ) ) ( not ( = ?auto_438577 ?auto_438584 ) ) ( not ( = ?auto_438578 ?auto_438579 ) ) ( not ( = ?auto_438578 ?auto_438580 ) ) ( not ( = ?auto_438578 ?auto_438581 ) ) ( not ( = ?auto_438578 ?auto_438582 ) ) ( not ( = ?auto_438578 ?auto_438583 ) ) ( not ( = ?auto_438578 ?auto_438584 ) ) ( not ( = ?auto_438579 ?auto_438580 ) ) ( not ( = ?auto_438579 ?auto_438581 ) ) ( not ( = ?auto_438579 ?auto_438582 ) ) ( not ( = ?auto_438579 ?auto_438583 ) ) ( not ( = ?auto_438579 ?auto_438584 ) ) ( not ( = ?auto_438580 ?auto_438581 ) ) ( not ( = ?auto_438580 ?auto_438582 ) ) ( not ( = ?auto_438580 ?auto_438583 ) ) ( not ( = ?auto_438580 ?auto_438584 ) ) ( not ( = ?auto_438581 ?auto_438582 ) ) ( not ( = ?auto_438581 ?auto_438583 ) ) ( not ( = ?auto_438581 ?auto_438584 ) ) ( not ( = ?auto_438582 ?auto_438583 ) ) ( not ( = ?auto_438582 ?auto_438584 ) ) ( not ( = ?auto_438583 ?auto_438584 ) ) ( ON ?auto_438583 ?auto_438584 ) ( ON ?auto_438582 ?auto_438583 ) ( ON ?auto_438581 ?auto_438582 ) ( ON ?auto_438580 ?auto_438581 ) ( ON ?auto_438579 ?auto_438580 ) ( ON ?auto_438578 ?auto_438579 ) ( ON ?auto_438577 ?auto_438578 ) ( ON ?auto_438576 ?auto_438577 ) ( ON ?auto_438575 ?auto_438576 ) ( CLEAR ?auto_438573 ) ( ON ?auto_438574 ?auto_438575 ) ( CLEAR ?auto_438574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_438570 ?auto_438571 ?auto_438572 ?auto_438573 ?auto_438574 )
      ( MAKE-15PILE ?auto_438570 ?auto_438571 ?auto_438572 ?auto_438573 ?auto_438574 ?auto_438575 ?auto_438576 ?auto_438577 ?auto_438578 ?auto_438579 ?auto_438580 ?auto_438581 ?auto_438582 ?auto_438583 ?auto_438584 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438600 - BLOCK
      ?auto_438601 - BLOCK
      ?auto_438602 - BLOCK
      ?auto_438603 - BLOCK
      ?auto_438604 - BLOCK
      ?auto_438605 - BLOCK
      ?auto_438606 - BLOCK
      ?auto_438607 - BLOCK
      ?auto_438608 - BLOCK
      ?auto_438609 - BLOCK
      ?auto_438610 - BLOCK
      ?auto_438611 - BLOCK
      ?auto_438612 - BLOCK
      ?auto_438613 - BLOCK
      ?auto_438614 - BLOCK
    )
    :vars
    (
      ?auto_438615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438614 ?auto_438615 ) ( ON-TABLE ?auto_438600 ) ( ON ?auto_438601 ?auto_438600 ) ( ON ?auto_438602 ?auto_438601 ) ( not ( = ?auto_438600 ?auto_438601 ) ) ( not ( = ?auto_438600 ?auto_438602 ) ) ( not ( = ?auto_438600 ?auto_438603 ) ) ( not ( = ?auto_438600 ?auto_438604 ) ) ( not ( = ?auto_438600 ?auto_438605 ) ) ( not ( = ?auto_438600 ?auto_438606 ) ) ( not ( = ?auto_438600 ?auto_438607 ) ) ( not ( = ?auto_438600 ?auto_438608 ) ) ( not ( = ?auto_438600 ?auto_438609 ) ) ( not ( = ?auto_438600 ?auto_438610 ) ) ( not ( = ?auto_438600 ?auto_438611 ) ) ( not ( = ?auto_438600 ?auto_438612 ) ) ( not ( = ?auto_438600 ?auto_438613 ) ) ( not ( = ?auto_438600 ?auto_438614 ) ) ( not ( = ?auto_438600 ?auto_438615 ) ) ( not ( = ?auto_438601 ?auto_438602 ) ) ( not ( = ?auto_438601 ?auto_438603 ) ) ( not ( = ?auto_438601 ?auto_438604 ) ) ( not ( = ?auto_438601 ?auto_438605 ) ) ( not ( = ?auto_438601 ?auto_438606 ) ) ( not ( = ?auto_438601 ?auto_438607 ) ) ( not ( = ?auto_438601 ?auto_438608 ) ) ( not ( = ?auto_438601 ?auto_438609 ) ) ( not ( = ?auto_438601 ?auto_438610 ) ) ( not ( = ?auto_438601 ?auto_438611 ) ) ( not ( = ?auto_438601 ?auto_438612 ) ) ( not ( = ?auto_438601 ?auto_438613 ) ) ( not ( = ?auto_438601 ?auto_438614 ) ) ( not ( = ?auto_438601 ?auto_438615 ) ) ( not ( = ?auto_438602 ?auto_438603 ) ) ( not ( = ?auto_438602 ?auto_438604 ) ) ( not ( = ?auto_438602 ?auto_438605 ) ) ( not ( = ?auto_438602 ?auto_438606 ) ) ( not ( = ?auto_438602 ?auto_438607 ) ) ( not ( = ?auto_438602 ?auto_438608 ) ) ( not ( = ?auto_438602 ?auto_438609 ) ) ( not ( = ?auto_438602 ?auto_438610 ) ) ( not ( = ?auto_438602 ?auto_438611 ) ) ( not ( = ?auto_438602 ?auto_438612 ) ) ( not ( = ?auto_438602 ?auto_438613 ) ) ( not ( = ?auto_438602 ?auto_438614 ) ) ( not ( = ?auto_438602 ?auto_438615 ) ) ( not ( = ?auto_438603 ?auto_438604 ) ) ( not ( = ?auto_438603 ?auto_438605 ) ) ( not ( = ?auto_438603 ?auto_438606 ) ) ( not ( = ?auto_438603 ?auto_438607 ) ) ( not ( = ?auto_438603 ?auto_438608 ) ) ( not ( = ?auto_438603 ?auto_438609 ) ) ( not ( = ?auto_438603 ?auto_438610 ) ) ( not ( = ?auto_438603 ?auto_438611 ) ) ( not ( = ?auto_438603 ?auto_438612 ) ) ( not ( = ?auto_438603 ?auto_438613 ) ) ( not ( = ?auto_438603 ?auto_438614 ) ) ( not ( = ?auto_438603 ?auto_438615 ) ) ( not ( = ?auto_438604 ?auto_438605 ) ) ( not ( = ?auto_438604 ?auto_438606 ) ) ( not ( = ?auto_438604 ?auto_438607 ) ) ( not ( = ?auto_438604 ?auto_438608 ) ) ( not ( = ?auto_438604 ?auto_438609 ) ) ( not ( = ?auto_438604 ?auto_438610 ) ) ( not ( = ?auto_438604 ?auto_438611 ) ) ( not ( = ?auto_438604 ?auto_438612 ) ) ( not ( = ?auto_438604 ?auto_438613 ) ) ( not ( = ?auto_438604 ?auto_438614 ) ) ( not ( = ?auto_438604 ?auto_438615 ) ) ( not ( = ?auto_438605 ?auto_438606 ) ) ( not ( = ?auto_438605 ?auto_438607 ) ) ( not ( = ?auto_438605 ?auto_438608 ) ) ( not ( = ?auto_438605 ?auto_438609 ) ) ( not ( = ?auto_438605 ?auto_438610 ) ) ( not ( = ?auto_438605 ?auto_438611 ) ) ( not ( = ?auto_438605 ?auto_438612 ) ) ( not ( = ?auto_438605 ?auto_438613 ) ) ( not ( = ?auto_438605 ?auto_438614 ) ) ( not ( = ?auto_438605 ?auto_438615 ) ) ( not ( = ?auto_438606 ?auto_438607 ) ) ( not ( = ?auto_438606 ?auto_438608 ) ) ( not ( = ?auto_438606 ?auto_438609 ) ) ( not ( = ?auto_438606 ?auto_438610 ) ) ( not ( = ?auto_438606 ?auto_438611 ) ) ( not ( = ?auto_438606 ?auto_438612 ) ) ( not ( = ?auto_438606 ?auto_438613 ) ) ( not ( = ?auto_438606 ?auto_438614 ) ) ( not ( = ?auto_438606 ?auto_438615 ) ) ( not ( = ?auto_438607 ?auto_438608 ) ) ( not ( = ?auto_438607 ?auto_438609 ) ) ( not ( = ?auto_438607 ?auto_438610 ) ) ( not ( = ?auto_438607 ?auto_438611 ) ) ( not ( = ?auto_438607 ?auto_438612 ) ) ( not ( = ?auto_438607 ?auto_438613 ) ) ( not ( = ?auto_438607 ?auto_438614 ) ) ( not ( = ?auto_438607 ?auto_438615 ) ) ( not ( = ?auto_438608 ?auto_438609 ) ) ( not ( = ?auto_438608 ?auto_438610 ) ) ( not ( = ?auto_438608 ?auto_438611 ) ) ( not ( = ?auto_438608 ?auto_438612 ) ) ( not ( = ?auto_438608 ?auto_438613 ) ) ( not ( = ?auto_438608 ?auto_438614 ) ) ( not ( = ?auto_438608 ?auto_438615 ) ) ( not ( = ?auto_438609 ?auto_438610 ) ) ( not ( = ?auto_438609 ?auto_438611 ) ) ( not ( = ?auto_438609 ?auto_438612 ) ) ( not ( = ?auto_438609 ?auto_438613 ) ) ( not ( = ?auto_438609 ?auto_438614 ) ) ( not ( = ?auto_438609 ?auto_438615 ) ) ( not ( = ?auto_438610 ?auto_438611 ) ) ( not ( = ?auto_438610 ?auto_438612 ) ) ( not ( = ?auto_438610 ?auto_438613 ) ) ( not ( = ?auto_438610 ?auto_438614 ) ) ( not ( = ?auto_438610 ?auto_438615 ) ) ( not ( = ?auto_438611 ?auto_438612 ) ) ( not ( = ?auto_438611 ?auto_438613 ) ) ( not ( = ?auto_438611 ?auto_438614 ) ) ( not ( = ?auto_438611 ?auto_438615 ) ) ( not ( = ?auto_438612 ?auto_438613 ) ) ( not ( = ?auto_438612 ?auto_438614 ) ) ( not ( = ?auto_438612 ?auto_438615 ) ) ( not ( = ?auto_438613 ?auto_438614 ) ) ( not ( = ?auto_438613 ?auto_438615 ) ) ( not ( = ?auto_438614 ?auto_438615 ) ) ( ON ?auto_438613 ?auto_438614 ) ( ON ?auto_438612 ?auto_438613 ) ( ON ?auto_438611 ?auto_438612 ) ( ON ?auto_438610 ?auto_438611 ) ( ON ?auto_438609 ?auto_438610 ) ( ON ?auto_438608 ?auto_438609 ) ( ON ?auto_438607 ?auto_438608 ) ( ON ?auto_438606 ?auto_438607 ) ( ON ?auto_438605 ?auto_438606 ) ( ON ?auto_438604 ?auto_438605 ) ( CLEAR ?auto_438602 ) ( ON ?auto_438603 ?auto_438604 ) ( CLEAR ?auto_438603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_438600 ?auto_438601 ?auto_438602 ?auto_438603 )
      ( MAKE-15PILE ?auto_438600 ?auto_438601 ?auto_438602 ?auto_438603 ?auto_438604 ?auto_438605 ?auto_438606 ?auto_438607 ?auto_438608 ?auto_438609 ?auto_438610 ?auto_438611 ?auto_438612 ?auto_438613 ?auto_438614 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438631 - BLOCK
      ?auto_438632 - BLOCK
      ?auto_438633 - BLOCK
      ?auto_438634 - BLOCK
      ?auto_438635 - BLOCK
      ?auto_438636 - BLOCK
      ?auto_438637 - BLOCK
      ?auto_438638 - BLOCK
      ?auto_438639 - BLOCK
      ?auto_438640 - BLOCK
      ?auto_438641 - BLOCK
      ?auto_438642 - BLOCK
      ?auto_438643 - BLOCK
      ?auto_438644 - BLOCK
      ?auto_438645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438645 ) ( ON-TABLE ?auto_438631 ) ( ON ?auto_438632 ?auto_438631 ) ( ON ?auto_438633 ?auto_438632 ) ( not ( = ?auto_438631 ?auto_438632 ) ) ( not ( = ?auto_438631 ?auto_438633 ) ) ( not ( = ?auto_438631 ?auto_438634 ) ) ( not ( = ?auto_438631 ?auto_438635 ) ) ( not ( = ?auto_438631 ?auto_438636 ) ) ( not ( = ?auto_438631 ?auto_438637 ) ) ( not ( = ?auto_438631 ?auto_438638 ) ) ( not ( = ?auto_438631 ?auto_438639 ) ) ( not ( = ?auto_438631 ?auto_438640 ) ) ( not ( = ?auto_438631 ?auto_438641 ) ) ( not ( = ?auto_438631 ?auto_438642 ) ) ( not ( = ?auto_438631 ?auto_438643 ) ) ( not ( = ?auto_438631 ?auto_438644 ) ) ( not ( = ?auto_438631 ?auto_438645 ) ) ( not ( = ?auto_438632 ?auto_438633 ) ) ( not ( = ?auto_438632 ?auto_438634 ) ) ( not ( = ?auto_438632 ?auto_438635 ) ) ( not ( = ?auto_438632 ?auto_438636 ) ) ( not ( = ?auto_438632 ?auto_438637 ) ) ( not ( = ?auto_438632 ?auto_438638 ) ) ( not ( = ?auto_438632 ?auto_438639 ) ) ( not ( = ?auto_438632 ?auto_438640 ) ) ( not ( = ?auto_438632 ?auto_438641 ) ) ( not ( = ?auto_438632 ?auto_438642 ) ) ( not ( = ?auto_438632 ?auto_438643 ) ) ( not ( = ?auto_438632 ?auto_438644 ) ) ( not ( = ?auto_438632 ?auto_438645 ) ) ( not ( = ?auto_438633 ?auto_438634 ) ) ( not ( = ?auto_438633 ?auto_438635 ) ) ( not ( = ?auto_438633 ?auto_438636 ) ) ( not ( = ?auto_438633 ?auto_438637 ) ) ( not ( = ?auto_438633 ?auto_438638 ) ) ( not ( = ?auto_438633 ?auto_438639 ) ) ( not ( = ?auto_438633 ?auto_438640 ) ) ( not ( = ?auto_438633 ?auto_438641 ) ) ( not ( = ?auto_438633 ?auto_438642 ) ) ( not ( = ?auto_438633 ?auto_438643 ) ) ( not ( = ?auto_438633 ?auto_438644 ) ) ( not ( = ?auto_438633 ?auto_438645 ) ) ( not ( = ?auto_438634 ?auto_438635 ) ) ( not ( = ?auto_438634 ?auto_438636 ) ) ( not ( = ?auto_438634 ?auto_438637 ) ) ( not ( = ?auto_438634 ?auto_438638 ) ) ( not ( = ?auto_438634 ?auto_438639 ) ) ( not ( = ?auto_438634 ?auto_438640 ) ) ( not ( = ?auto_438634 ?auto_438641 ) ) ( not ( = ?auto_438634 ?auto_438642 ) ) ( not ( = ?auto_438634 ?auto_438643 ) ) ( not ( = ?auto_438634 ?auto_438644 ) ) ( not ( = ?auto_438634 ?auto_438645 ) ) ( not ( = ?auto_438635 ?auto_438636 ) ) ( not ( = ?auto_438635 ?auto_438637 ) ) ( not ( = ?auto_438635 ?auto_438638 ) ) ( not ( = ?auto_438635 ?auto_438639 ) ) ( not ( = ?auto_438635 ?auto_438640 ) ) ( not ( = ?auto_438635 ?auto_438641 ) ) ( not ( = ?auto_438635 ?auto_438642 ) ) ( not ( = ?auto_438635 ?auto_438643 ) ) ( not ( = ?auto_438635 ?auto_438644 ) ) ( not ( = ?auto_438635 ?auto_438645 ) ) ( not ( = ?auto_438636 ?auto_438637 ) ) ( not ( = ?auto_438636 ?auto_438638 ) ) ( not ( = ?auto_438636 ?auto_438639 ) ) ( not ( = ?auto_438636 ?auto_438640 ) ) ( not ( = ?auto_438636 ?auto_438641 ) ) ( not ( = ?auto_438636 ?auto_438642 ) ) ( not ( = ?auto_438636 ?auto_438643 ) ) ( not ( = ?auto_438636 ?auto_438644 ) ) ( not ( = ?auto_438636 ?auto_438645 ) ) ( not ( = ?auto_438637 ?auto_438638 ) ) ( not ( = ?auto_438637 ?auto_438639 ) ) ( not ( = ?auto_438637 ?auto_438640 ) ) ( not ( = ?auto_438637 ?auto_438641 ) ) ( not ( = ?auto_438637 ?auto_438642 ) ) ( not ( = ?auto_438637 ?auto_438643 ) ) ( not ( = ?auto_438637 ?auto_438644 ) ) ( not ( = ?auto_438637 ?auto_438645 ) ) ( not ( = ?auto_438638 ?auto_438639 ) ) ( not ( = ?auto_438638 ?auto_438640 ) ) ( not ( = ?auto_438638 ?auto_438641 ) ) ( not ( = ?auto_438638 ?auto_438642 ) ) ( not ( = ?auto_438638 ?auto_438643 ) ) ( not ( = ?auto_438638 ?auto_438644 ) ) ( not ( = ?auto_438638 ?auto_438645 ) ) ( not ( = ?auto_438639 ?auto_438640 ) ) ( not ( = ?auto_438639 ?auto_438641 ) ) ( not ( = ?auto_438639 ?auto_438642 ) ) ( not ( = ?auto_438639 ?auto_438643 ) ) ( not ( = ?auto_438639 ?auto_438644 ) ) ( not ( = ?auto_438639 ?auto_438645 ) ) ( not ( = ?auto_438640 ?auto_438641 ) ) ( not ( = ?auto_438640 ?auto_438642 ) ) ( not ( = ?auto_438640 ?auto_438643 ) ) ( not ( = ?auto_438640 ?auto_438644 ) ) ( not ( = ?auto_438640 ?auto_438645 ) ) ( not ( = ?auto_438641 ?auto_438642 ) ) ( not ( = ?auto_438641 ?auto_438643 ) ) ( not ( = ?auto_438641 ?auto_438644 ) ) ( not ( = ?auto_438641 ?auto_438645 ) ) ( not ( = ?auto_438642 ?auto_438643 ) ) ( not ( = ?auto_438642 ?auto_438644 ) ) ( not ( = ?auto_438642 ?auto_438645 ) ) ( not ( = ?auto_438643 ?auto_438644 ) ) ( not ( = ?auto_438643 ?auto_438645 ) ) ( not ( = ?auto_438644 ?auto_438645 ) ) ( ON ?auto_438644 ?auto_438645 ) ( ON ?auto_438643 ?auto_438644 ) ( ON ?auto_438642 ?auto_438643 ) ( ON ?auto_438641 ?auto_438642 ) ( ON ?auto_438640 ?auto_438641 ) ( ON ?auto_438639 ?auto_438640 ) ( ON ?auto_438638 ?auto_438639 ) ( ON ?auto_438637 ?auto_438638 ) ( ON ?auto_438636 ?auto_438637 ) ( ON ?auto_438635 ?auto_438636 ) ( CLEAR ?auto_438633 ) ( ON ?auto_438634 ?auto_438635 ) ( CLEAR ?auto_438634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_438631 ?auto_438632 ?auto_438633 ?auto_438634 )
      ( MAKE-15PILE ?auto_438631 ?auto_438632 ?auto_438633 ?auto_438634 ?auto_438635 ?auto_438636 ?auto_438637 ?auto_438638 ?auto_438639 ?auto_438640 ?auto_438641 ?auto_438642 ?auto_438643 ?auto_438644 ?auto_438645 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438661 - BLOCK
      ?auto_438662 - BLOCK
      ?auto_438663 - BLOCK
      ?auto_438664 - BLOCK
      ?auto_438665 - BLOCK
      ?auto_438666 - BLOCK
      ?auto_438667 - BLOCK
      ?auto_438668 - BLOCK
      ?auto_438669 - BLOCK
      ?auto_438670 - BLOCK
      ?auto_438671 - BLOCK
      ?auto_438672 - BLOCK
      ?auto_438673 - BLOCK
      ?auto_438674 - BLOCK
      ?auto_438675 - BLOCK
    )
    :vars
    (
      ?auto_438676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438675 ?auto_438676 ) ( ON-TABLE ?auto_438661 ) ( ON ?auto_438662 ?auto_438661 ) ( not ( = ?auto_438661 ?auto_438662 ) ) ( not ( = ?auto_438661 ?auto_438663 ) ) ( not ( = ?auto_438661 ?auto_438664 ) ) ( not ( = ?auto_438661 ?auto_438665 ) ) ( not ( = ?auto_438661 ?auto_438666 ) ) ( not ( = ?auto_438661 ?auto_438667 ) ) ( not ( = ?auto_438661 ?auto_438668 ) ) ( not ( = ?auto_438661 ?auto_438669 ) ) ( not ( = ?auto_438661 ?auto_438670 ) ) ( not ( = ?auto_438661 ?auto_438671 ) ) ( not ( = ?auto_438661 ?auto_438672 ) ) ( not ( = ?auto_438661 ?auto_438673 ) ) ( not ( = ?auto_438661 ?auto_438674 ) ) ( not ( = ?auto_438661 ?auto_438675 ) ) ( not ( = ?auto_438661 ?auto_438676 ) ) ( not ( = ?auto_438662 ?auto_438663 ) ) ( not ( = ?auto_438662 ?auto_438664 ) ) ( not ( = ?auto_438662 ?auto_438665 ) ) ( not ( = ?auto_438662 ?auto_438666 ) ) ( not ( = ?auto_438662 ?auto_438667 ) ) ( not ( = ?auto_438662 ?auto_438668 ) ) ( not ( = ?auto_438662 ?auto_438669 ) ) ( not ( = ?auto_438662 ?auto_438670 ) ) ( not ( = ?auto_438662 ?auto_438671 ) ) ( not ( = ?auto_438662 ?auto_438672 ) ) ( not ( = ?auto_438662 ?auto_438673 ) ) ( not ( = ?auto_438662 ?auto_438674 ) ) ( not ( = ?auto_438662 ?auto_438675 ) ) ( not ( = ?auto_438662 ?auto_438676 ) ) ( not ( = ?auto_438663 ?auto_438664 ) ) ( not ( = ?auto_438663 ?auto_438665 ) ) ( not ( = ?auto_438663 ?auto_438666 ) ) ( not ( = ?auto_438663 ?auto_438667 ) ) ( not ( = ?auto_438663 ?auto_438668 ) ) ( not ( = ?auto_438663 ?auto_438669 ) ) ( not ( = ?auto_438663 ?auto_438670 ) ) ( not ( = ?auto_438663 ?auto_438671 ) ) ( not ( = ?auto_438663 ?auto_438672 ) ) ( not ( = ?auto_438663 ?auto_438673 ) ) ( not ( = ?auto_438663 ?auto_438674 ) ) ( not ( = ?auto_438663 ?auto_438675 ) ) ( not ( = ?auto_438663 ?auto_438676 ) ) ( not ( = ?auto_438664 ?auto_438665 ) ) ( not ( = ?auto_438664 ?auto_438666 ) ) ( not ( = ?auto_438664 ?auto_438667 ) ) ( not ( = ?auto_438664 ?auto_438668 ) ) ( not ( = ?auto_438664 ?auto_438669 ) ) ( not ( = ?auto_438664 ?auto_438670 ) ) ( not ( = ?auto_438664 ?auto_438671 ) ) ( not ( = ?auto_438664 ?auto_438672 ) ) ( not ( = ?auto_438664 ?auto_438673 ) ) ( not ( = ?auto_438664 ?auto_438674 ) ) ( not ( = ?auto_438664 ?auto_438675 ) ) ( not ( = ?auto_438664 ?auto_438676 ) ) ( not ( = ?auto_438665 ?auto_438666 ) ) ( not ( = ?auto_438665 ?auto_438667 ) ) ( not ( = ?auto_438665 ?auto_438668 ) ) ( not ( = ?auto_438665 ?auto_438669 ) ) ( not ( = ?auto_438665 ?auto_438670 ) ) ( not ( = ?auto_438665 ?auto_438671 ) ) ( not ( = ?auto_438665 ?auto_438672 ) ) ( not ( = ?auto_438665 ?auto_438673 ) ) ( not ( = ?auto_438665 ?auto_438674 ) ) ( not ( = ?auto_438665 ?auto_438675 ) ) ( not ( = ?auto_438665 ?auto_438676 ) ) ( not ( = ?auto_438666 ?auto_438667 ) ) ( not ( = ?auto_438666 ?auto_438668 ) ) ( not ( = ?auto_438666 ?auto_438669 ) ) ( not ( = ?auto_438666 ?auto_438670 ) ) ( not ( = ?auto_438666 ?auto_438671 ) ) ( not ( = ?auto_438666 ?auto_438672 ) ) ( not ( = ?auto_438666 ?auto_438673 ) ) ( not ( = ?auto_438666 ?auto_438674 ) ) ( not ( = ?auto_438666 ?auto_438675 ) ) ( not ( = ?auto_438666 ?auto_438676 ) ) ( not ( = ?auto_438667 ?auto_438668 ) ) ( not ( = ?auto_438667 ?auto_438669 ) ) ( not ( = ?auto_438667 ?auto_438670 ) ) ( not ( = ?auto_438667 ?auto_438671 ) ) ( not ( = ?auto_438667 ?auto_438672 ) ) ( not ( = ?auto_438667 ?auto_438673 ) ) ( not ( = ?auto_438667 ?auto_438674 ) ) ( not ( = ?auto_438667 ?auto_438675 ) ) ( not ( = ?auto_438667 ?auto_438676 ) ) ( not ( = ?auto_438668 ?auto_438669 ) ) ( not ( = ?auto_438668 ?auto_438670 ) ) ( not ( = ?auto_438668 ?auto_438671 ) ) ( not ( = ?auto_438668 ?auto_438672 ) ) ( not ( = ?auto_438668 ?auto_438673 ) ) ( not ( = ?auto_438668 ?auto_438674 ) ) ( not ( = ?auto_438668 ?auto_438675 ) ) ( not ( = ?auto_438668 ?auto_438676 ) ) ( not ( = ?auto_438669 ?auto_438670 ) ) ( not ( = ?auto_438669 ?auto_438671 ) ) ( not ( = ?auto_438669 ?auto_438672 ) ) ( not ( = ?auto_438669 ?auto_438673 ) ) ( not ( = ?auto_438669 ?auto_438674 ) ) ( not ( = ?auto_438669 ?auto_438675 ) ) ( not ( = ?auto_438669 ?auto_438676 ) ) ( not ( = ?auto_438670 ?auto_438671 ) ) ( not ( = ?auto_438670 ?auto_438672 ) ) ( not ( = ?auto_438670 ?auto_438673 ) ) ( not ( = ?auto_438670 ?auto_438674 ) ) ( not ( = ?auto_438670 ?auto_438675 ) ) ( not ( = ?auto_438670 ?auto_438676 ) ) ( not ( = ?auto_438671 ?auto_438672 ) ) ( not ( = ?auto_438671 ?auto_438673 ) ) ( not ( = ?auto_438671 ?auto_438674 ) ) ( not ( = ?auto_438671 ?auto_438675 ) ) ( not ( = ?auto_438671 ?auto_438676 ) ) ( not ( = ?auto_438672 ?auto_438673 ) ) ( not ( = ?auto_438672 ?auto_438674 ) ) ( not ( = ?auto_438672 ?auto_438675 ) ) ( not ( = ?auto_438672 ?auto_438676 ) ) ( not ( = ?auto_438673 ?auto_438674 ) ) ( not ( = ?auto_438673 ?auto_438675 ) ) ( not ( = ?auto_438673 ?auto_438676 ) ) ( not ( = ?auto_438674 ?auto_438675 ) ) ( not ( = ?auto_438674 ?auto_438676 ) ) ( not ( = ?auto_438675 ?auto_438676 ) ) ( ON ?auto_438674 ?auto_438675 ) ( ON ?auto_438673 ?auto_438674 ) ( ON ?auto_438672 ?auto_438673 ) ( ON ?auto_438671 ?auto_438672 ) ( ON ?auto_438670 ?auto_438671 ) ( ON ?auto_438669 ?auto_438670 ) ( ON ?auto_438668 ?auto_438669 ) ( ON ?auto_438667 ?auto_438668 ) ( ON ?auto_438666 ?auto_438667 ) ( ON ?auto_438665 ?auto_438666 ) ( ON ?auto_438664 ?auto_438665 ) ( CLEAR ?auto_438662 ) ( ON ?auto_438663 ?auto_438664 ) ( CLEAR ?auto_438663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_438661 ?auto_438662 ?auto_438663 )
      ( MAKE-15PILE ?auto_438661 ?auto_438662 ?auto_438663 ?auto_438664 ?auto_438665 ?auto_438666 ?auto_438667 ?auto_438668 ?auto_438669 ?auto_438670 ?auto_438671 ?auto_438672 ?auto_438673 ?auto_438674 ?auto_438675 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438692 - BLOCK
      ?auto_438693 - BLOCK
      ?auto_438694 - BLOCK
      ?auto_438695 - BLOCK
      ?auto_438696 - BLOCK
      ?auto_438697 - BLOCK
      ?auto_438698 - BLOCK
      ?auto_438699 - BLOCK
      ?auto_438700 - BLOCK
      ?auto_438701 - BLOCK
      ?auto_438702 - BLOCK
      ?auto_438703 - BLOCK
      ?auto_438704 - BLOCK
      ?auto_438705 - BLOCK
      ?auto_438706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438706 ) ( ON-TABLE ?auto_438692 ) ( ON ?auto_438693 ?auto_438692 ) ( not ( = ?auto_438692 ?auto_438693 ) ) ( not ( = ?auto_438692 ?auto_438694 ) ) ( not ( = ?auto_438692 ?auto_438695 ) ) ( not ( = ?auto_438692 ?auto_438696 ) ) ( not ( = ?auto_438692 ?auto_438697 ) ) ( not ( = ?auto_438692 ?auto_438698 ) ) ( not ( = ?auto_438692 ?auto_438699 ) ) ( not ( = ?auto_438692 ?auto_438700 ) ) ( not ( = ?auto_438692 ?auto_438701 ) ) ( not ( = ?auto_438692 ?auto_438702 ) ) ( not ( = ?auto_438692 ?auto_438703 ) ) ( not ( = ?auto_438692 ?auto_438704 ) ) ( not ( = ?auto_438692 ?auto_438705 ) ) ( not ( = ?auto_438692 ?auto_438706 ) ) ( not ( = ?auto_438693 ?auto_438694 ) ) ( not ( = ?auto_438693 ?auto_438695 ) ) ( not ( = ?auto_438693 ?auto_438696 ) ) ( not ( = ?auto_438693 ?auto_438697 ) ) ( not ( = ?auto_438693 ?auto_438698 ) ) ( not ( = ?auto_438693 ?auto_438699 ) ) ( not ( = ?auto_438693 ?auto_438700 ) ) ( not ( = ?auto_438693 ?auto_438701 ) ) ( not ( = ?auto_438693 ?auto_438702 ) ) ( not ( = ?auto_438693 ?auto_438703 ) ) ( not ( = ?auto_438693 ?auto_438704 ) ) ( not ( = ?auto_438693 ?auto_438705 ) ) ( not ( = ?auto_438693 ?auto_438706 ) ) ( not ( = ?auto_438694 ?auto_438695 ) ) ( not ( = ?auto_438694 ?auto_438696 ) ) ( not ( = ?auto_438694 ?auto_438697 ) ) ( not ( = ?auto_438694 ?auto_438698 ) ) ( not ( = ?auto_438694 ?auto_438699 ) ) ( not ( = ?auto_438694 ?auto_438700 ) ) ( not ( = ?auto_438694 ?auto_438701 ) ) ( not ( = ?auto_438694 ?auto_438702 ) ) ( not ( = ?auto_438694 ?auto_438703 ) ) ( not ( = ?auto_438694 ?auto_438704 ) ) ( not ( = ?auto_438694 ?auto_438705 ) ) ( not ( = ?auto_438694 ?auto_438706 ) ) ( not ( = ?auto_438695 ?auto_438696 ) ) ( not ( = ?auto_438695 ?auto_438697 ) ) ( not ( = ?auto_438695 ?auto_438698 ) ) ( not ( = ?auto_438695 ?auto_438699 ) ) ( not ( = ?auto_438695 ?auto_438700 ) ) ( not ( = ?auto_438695 ?auto_438701 ) ) ( not ( = ?auto_438695 ?auto_438702 ) ) ( not ( = ?auto_438695 ?auto_438703 ) ) ( not ( = ?auto_438695 ?auto_438704 ) ) ( not ( = ?auto_438695 ?auto_438705 ) ) ( not ( = ?auto_438695 ?auto_438706 ) ) ( not ( = ?auto_438696 ?auto_438697 ) ) ( not ( = ?auto_438696 ?auto_438698 ) ) ( not ( = ?auto_438696 ?auto_438699 ) ) ( not ( = ?auto_438696 ?auto_438700 ) ) ( not ( = ?auto_438696 ?auto_438701 ) ) ( not ( = ?auto_438696 ?auto_438702 ) ) ( not ( = ?auto_438696 ?auto_438703 ) ) ( not ( = ?auto_438696 ?auto_438704 ) ) ( not ( = ?auto_438696 ?auto_438705 ) ) ( not ( = ?auto_438696 ?auto_438706 ) ) ( not ( = ?auto_438697 ?auto_438698 ) ) ( not ( = ?auto_438697 ?auto_438699 ) ) ( not ( = ?auto_438697 ?auto_438700 ) ) ( not ( = ?auto_438697 ?auto_438701 ) ) ( not ( = ?auto_438697 ?auto_438702 ) ) ( not ( = ?auto_438697 ?auto_438703 ) ) ( not ( = ?auto_438697 ?auto_438704 ) ) ( not ( = ?auto_438697 ?auto_438705 ) ) ( not ( = ?auto_438697 ?auto_438706 ) ) ( not ( = ?auto_438698 ?auto_438699 ) ) ( not ( = ?auto_438698 ?auto_438700 ) ) ( not ( = ?auto_438698 ?auto_438701 ) ) ( not ( = ?auto_438698 ?auto_438702 ) ) ( not ( = ?auto_438698 ?auto_438703 ) ) ( not ( = ?auto_438698 ?auto_438704 ) ) ( not ( = ?auto_438698 ?auto_438705 ) ) ( not ( = ?auto_438698 ?auto_438706 ) ) ( not ( = ?auto_438699 ?auto_438700 ) ) ( not ( = ?auto_438699 ?auto_438701 ) ) ( not ( = ?auto_438699 ?auto_438702 ) ) ( not ( = ?auto_438699 ?auto_438703 ) ) ( not ( = ?auto_438699 ?auto_438704 ) ) ( not ( = ?auto_438699 ?auto_438705 ) ) ( not ( = ?auto_438699 ?auto_438706 ) ) ( not ( = ?auto_438700 ?auto_438701 ) ) ( not ( = ?auto_438700 ?auto_438702 ) ) ( not ( = ?auto_438700 ?auto_438703 ) ) ( not ( = ?auto_438700 ?auto_438704 ) ) ( not ( = ?auto_438700 ?auto_438705 ) ) ( not ( = ?auto_438700 ?auto_438706 ) ) ( not ( = ?auto_438701 ?auto_438702 ) ) ( not ( = ?auto_438701 ?auto_438703 ) ) ( not ( = ?auto_438701 ?auto_438704 ) ) ( not ( = ?auto_438701 ?auto_438705 ) ) ( not ( = ?auto_438701 ?auto_438706 ) ) ( not ( = ?auto_438702 ?auto_438703 ) ) ( not ( = ?auto_438702 ?auto_438704 ) ) ( not ( = ?auto_438702 ?auto_438705 ) ) ( not ( = ?auto_438702 ?auto_438706 ) ) ( not ( = ?auto_438703 ?auto_438704 ) ) ( not ( = ?auto_438703 ?auto_438705 ) ) ( not ( = ?auto_438703 ?auto_438706 ) ) ( not ( = ?auto_438704 ?auto_438705 ) ) ( not ( = ?auto_438704 ?auto_438706 ) ) ( not ( = ?auto_438705 ?auto_438706 ) ) ( ON ?auto_438705 ?auto_438706 ) ( ON ?auto_438704 ?auto_438705 ) ( ON ?auto_438703 ?auto_438704 ) ( ON ?auto_438702 ?auto_438703 ) ( ON ?auto_438701 ?auto_438702 ) ( ON ?auto_438700 ?auto_438701 ) ( ON ?auto_438699 ?auto_438700 ) ( ON ?auto_438698 ?auto_438699 ) ( ON ?auto_438697 ?auto_438698 ) ( ON ?auto_438696 ?auto_438697 ) ( ON ?auto_438695 ?auto_438696 ) ( CLEAR ?auto_438693 ) ( ON ?auto_438694 ?auto_438695 ) ( CLEAR ?auto_438694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_438692 ?auto_438693 ?auto_438694 )
      ( MAKE-15PILE ?auto_438692 ?auto_438693 ?auto_438694 ?auto_438695 ?auto_438696 ?auto_438697 ?auto_438698 ?auto_438699 ?auto_438700 ?auto_438701 ?auto_438702 ?auto_438703 ?auto_438704 ?auto_438705 ?auto_438706 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438722 - BLOCK
      ?auto_438723 - BLOCK
      ?auto_438724 - BLOCK
      ?auto_438725 - BLOCK
      ?auto_438726 - BLOCK
      ?auto_438727 - BLOCK
      ?auto_438728 - BLOCK
      ?auto_438729 - BLOCK
      ?auto_438730 - BLOCK
      ?auto_438731 - BLOCK
      ?auto_438732 - BLOCK
      ?auto_438733 - BLOCK
      ?auto_438734 - BLOCK
      ?auto_438735 - BLOCK
      ?auto_438736 - BLOCK
    )
    :vars
    (
      ?auto_438737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438736 ?auto_438737 ) ( ON-TABLE ?auto_438722 ) ( not ( = ?auto_438722 ?auto_438723 ) ) ( not ( = ?auto_438722 ?auto_438724 ) ) ( not ( = ?auto_438722 ?auto_438725 ) ) ( not ( = ?auto_438722 ?auto_438726 ) ) ( not ( = ?auto_438722 ?auto_438727 ) ) ( not ( = ?auto_438722 ?auto_438728 ) ) ( not ( = ?auto_438722 ?auto_438729 ) ) ( not ( = ?auto_438722 ?auto_438730 ) ) ( not ( = ?auto_438722 ?auto_438731 ) ) ( not ( = ?auto_438722 ?auto_438732 ) ) ( not ( = ?auto_438722 ?auto_438733 ) ) ( not ( = ?auto_438722 ?auto_438734 ) ) ( not ( = ?auto_438722 ?auto_438735 ) ) ( not ( = ?auto_438722 ?auto_438736 ) ) ( not ( = ?auto_438722 ?auto_438737 ) ) ( not ( = ?auto_438723 ?auto_438724 ) ) ( not ( = ?auto_438723 ?auto_438725 ) ) ( not ( = ?auto_438723 ?auto_438726 ) ) ( not ( = ?auto_438723 ?auto_438727 ) ) ( not ( = ?auto_438723 ?auto_438728 ) ) ( not ( = ?auto_438723 ?auto_438729 ) ) ( not ( = ?auto_438723 ?auto_438730 ) ) ( not ( = ?auto_438723 ?auto_438731 ) ) ( not ( = ?auto_438723 ?auto_438732 ) ) ( not ( = ?auto_438723 ?auto_438733 ) ) ( not ( = ?auto_438723 ?auto_438734 ) ) ( not ( = ?auto_438723 ?auto_438735 ) ) ( not ( = ?auto_438723 ?auto_438736 ) ) ( not ( = ?auto_438723 ?auto_438737 ) ) ( not ( = ?auto_438724 ?auto_438725 ) ) ( not ( = ?auto_438724 ?auto_438726 ) ) ( not ( = ?auto_438724 ?auto_438727 ) ) ( not ( = ?auto_438724 ?auto_438728 ) ) ( not ( = ?auto_438724 ?auto_438729 ) ) ( not ( = ?auto_438724 ?auto_438730 ) ) ( not ( = ?auto_438724 ?auto_438731 ) ) ( not ( = ?auto_438724 ?auto_438732 ) ) ( not ( = ?auto_438724 ?auto_438733 ) ) ( not ( = ?auto_438724 ?auto_438734 ) ) ( not ( = ?auto_438724 ?auto_438735 ) ) ( not ( = ?auto_438724 ?auto_438736 ) ) ( not ( = ?auto_438724 ?auto_438737 ) ) ( not ( = ?auto_438725 ?auto_438726 ) ) ( not ( = ?auto_438725 ?auto_438727 ) ) ( not ( = ?auto_438725 ?auto_438728 ) ) ( not ( = ?auto_438725 ?auto_438729 ) ) ( not ( = ?auto_438725 ?auto_438730 ) ) ( not ( = ?auto_438725 ?auto_438731 ) ) ( not ( = ?auto_438725 ?auto_438732 ) ) ( not ( = ?auto_438725 ?auto_438733 ) ) ( not ( = ?auto_438725 ?auto_438734 ) ) ( not ( = ?auto_438725 ?auto_438735 ) ) ( not ( = ?auto_438725 ?auto_438736 ) ) ( not ( = ?auto_438725 ?auto_438737 ) ) ( not ( = ?auto_438726 ?auto_438727 ) ) ( not ( = ?auto_438726 ?auto_438728 ) ) ( not ( = ?auto_438726 ?auto_438729 ) ) ( not ( = ?auto_438726 ?auto_438730 ) ) ( not ( = ?auto_438726 ?auto_438731 ) ) ( not ( = ?auto_438726 ?auto_438732 ) ) ( not ( = ?auto_438726 ?auto_438733 ) ) ( not ( = ?auto_438726 ?auto_438734 ) ) ( not ( = ?auto_438726 ?auto_438735 ) ) ( not ( = ?auto_438726 ?auto_438736 ) ) ( not ( = ?auto_438726 ?auto_438737 ) ) ( not ( = ?auto_438727 ?auto_438728 ) ) ( not ( = ?auto_438727 ?auto_438729 ) ) ( not ( = ?auto_438727 ?auto_438730 ) ) ( not ( = ?auto_438727 ?auto_438731 ) ) ( not ( = ?auto_438727 ?auto_438732 ) ) ( not ( = ?auto_438727 ?auto_438733 ) ) ( not ( = ?auto_438727 ?auto_438734 ) ) ( not ( = ?auto_438727 ?auto_438735 ) ) ( not ( = ?auto_438727 ?auto_438736 ) ) ( not ( = ?auto_438727 ?auto_438737 ) ) ( not ( = ?auto_438728 ?auto_438729 ) ) ( not ( = ?auto_438728 ?auto_438730 ) ) ( not ( = ?auto_438728 ?auto_438731 ) ) ( not ( = ?auto_438728 ?auto_438732 ) ) ( not ( = ?auto_438728 ?auto_438733 ) ) ( not ( = ?auto_438728 ?auto_438734 ) ) ( not ( = ?auto_438728 ?auto_438735 ) ) ( not ( = ?auto_438728 ?auto_438736 ) ) ( not ( = ?auto_438728 ?auto_438737 ) ) ( not ( = ?auto_438729 ?auto_438730 ) ) ( not ( = ?auto_438729 ?auto_438731 ) ) ( not ( = ?auto_438729 ?auto_438732 ) ) ( not ( = ?auto_438729 ?auto_438733 ) ) ( not ( = ?auto_438729 ?auto_438734 ) ) ( not ( = ?auto_438729 ?auto_438735 ) ) ( not ( = ?auto_438729 ?auto_438736 ) ) ( not ( = ?auto_438729 ?auto_438737 ) ) ( not ( = ?auto_438730 ?auto_438731 ) ) ( not ( = ?auto_438730 ?auto_438732 ) ) ( not ( = ?auto_438730 ?auto_438733 ) ) ( not ( = ?auto_438730 ?auto_438734 ) ) ( not ( = ?auto_438730 ?auto_438735 ) ) ( not ( = ?auto_438730 ?auto_438736 ) ) ( not ( = ?auto_438730 ?auto_438737 ) ) ( not ( = ?auto_438731 ?auto_438732 ) ) ( not ( = ?auto_438731 ?auto_438733 ) ) ( not ( = ?auto_438731 ?auto_438734 ) ) ( not ( = ?auto_438731 ?auto_438735 ) ) ( not ( = ?auto_438731 ?auto_438736 ) ) ( not ( = ?auto_438731 ?auto_438737 ) ) ( not ( = ?auto_438732 ?auto_438733 ) ) ( not ( = ?auto_438732 ?auto_438734 ) ) ( not ( = ?auto_438732 ?auto_438735 ) ) ( not ( = ?auto_438732 ?auto_438736 ) ) ( not ( = ?auto_438732 ?auto_438737 ) ) ( not ( = ?auto_438733 ?auto_438734 ) ) ( not ( = ?auto_438733 ?auto_438735 ) ) ( not ( = ?auto_438733 ?auto_438736 ) ) ( not ( = ?auto_438733 ?auto_438737 ) ) ( not ( = ?auto_438734 ?auto_438735 ) ) ( not ( = ?auto_438734 ?auto_438736 ) ) ( not ( = ?auto_438734 ?auto_438737 ) ) ( not ( = ?auto_438735 ?auto_438736 ) ) ( not ( = ?auto_438735 ?auto_438737 ) ) ( not ( = ?auto_438736 ?auto_438737 ) ) ( ON ?auto_438735 ?auto_438736 ) ( ON ?auto_438734 ?auto_438735 ) ( ON ?auto_438733 ?auto_438734 ) ( ON ?auto_438732 ?auto_438733 ) ( ON ?auto_438731 ?auto_438732 ) ( ON ?auto_438730 ?auto_438731 ) ( ON ?auto_438729 ?auto_438730 ) ( ON ?auto_438728 ?auto_438729 ) ( ON ?auto_438727 ?auto_438728 ) ( ON ?auto_438726 ?auto_438727 ) ( ON ?auto_438725 ?auto_438726 ) ( ON ?auto_438724 ?auto_438725 ) ( CLEAR ?auto_438722 ) ( ON ?auto_438723 ?auto_438724 ) ( CLEAR ?auto_438723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_438722 ?auto_438723 )
      ( MAKE-15PILE ?auto_438722 ?auto_438723 ?auto_438724 ?auto_438725 ?auto_438726 ?auto_438727 ?auto_438728 ?auto_438729 ?auto_438730 ?auto_438731 ?auto_438732 ?auto_438733 ?auto_438734 ?auto_438735 ?auto_438736 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438753 - BLOCK
      ?auto_438754 - BLOCK
      ?auto_438755 - BLOCK
      ?auto_438756 - BLOCK
      ?auto_438757 - BLOCK
      ?auto_438758 - BLOCK
      ?auto_438759 - BLOCK
      ?auto_438760 - BLOCK
      ?auto_438761 - BLOCK
      ?auto_438762 - BLOCK
      ?auto_438763 - BLOCK
      ?auto_438764 - BLOCK
      ?auto_438765 - BLOCK
      ?auto_438766 - BLOCK
      ?auto_438767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438767 ) ( ON-TABLE ?auto_438753 ) ( not ( = ?auto_438753 ?auto_438754 ) ) ( not ( = ?auto_438753 ?auto_438755 ) ) ( not ( = ?auto_438753 ?auto_438756 ) ) ( not ( = ?auto_438753 ?auto_438757 ) ) ( not ( = ?auto_438753 ?auto_438758 ) ) ( not ( = ?auto_438753 ?auto_438759 ) ) ( not ( = ?auto_438753 ?auto_438760 ) ) ( not ( = ?auto_438753 ?auto_438761 ) ) ( not ( = ?auto_438753 ?auto_438762 ) ) ( not ( = ?auto_438753 ?auto_438763 ) ) ( not ( = ?auto_438753 ?auto_438764 ) ) ( not ( = ?auto_438753 ?auto_438765 ) ) ( not ( = ?auto_438753 ?auto_438766 ) ) ( not ( = ?auto_438753 ?auto_438767 ) ) ( not ( = ?auto_438754 ?auto_438755 ) ) ( not ( = ?auto_438754 ?auto_438756 ) ) ( not ( = ?auto_438754 ?auto_438757 ) ) ( not ( = ?auto_438754 ?auto_438758 ) ) ( not ( = ?auto_438754 ?auto_438759 ) ) ( not ( = ?auto_438754 ?auto_438760 ) ) ( not ( = ?auto_438754 ?auto_438761 ) ) ( not ( = ?auto_438754 ?auto_438762 ) ) ( not ( = ?auto_438754 ?auto_438763 ) ) ( not ( = ?auto_438754 ?auto_438764 ) ) ( not ( = ?auto_438754 ?auto_438765 ) ) ( not ( = ?auto_438754 ?auto_438766 ) ) ( not ( = ?auto_438754 ?auto_438767 ) ) ( not ( = ?auto_438755 ?auto_438756 ) ) ( not ( = ?auto_438755 ?auto_438757 ) ) ( not ( = ?auto_438755 ?auto_438758 ) ) ( not ( = ?auto_438755 ?auto_438759 ) ) ( not ( = ?auto_438755 ?auto_438760 ) ) ( not ( = ?auto_438755 ?auto_438761 ) ) ( not ( = ?auto_438755 ?auto_438762 ) ) ( not ( = ?auto_438755 ?auto_438763 ) ) ( not ( = ?auto_438755 ?auto_438764 ) ) ( not ( = ?auto_438755 ?auto_438765 ) ) ( not ( = ?auto_438755 ?auto_438766 ) ) ( not ( = ?auto_438755 ?auto_438767 ) ) ( not ( = ?auto_438756 ?auto_438757 ) ) ( not ( = ?auto_438756 ?auto_438758 ) ) ( not ( = ?auto_438756 ?auto_438759 ) ) ( not ( = ?auto_438756 ?auto_438760 ) ) ( not ( = ?auto_438756 ?auto_438761 ) ) ( not ( = ?auto_438756 ?auto_438762 ) ) ( not ( = ?auto_438756 ?auto_438763 ) ) ( not ( = ?auto_438756 ?auto_438764 ) ) ( not ( = ?auto_438756 ?auto_438765 ) ) ( not ( = ?auto_438756 ?auto_438766 ) ) ( not ( = ?auto_438756 ?auto_438767 ) ) ( not ( = ?auto_438757 ?auto_438758 ) ) ( not ( = ?auto_438757 ?auto_438759 ) ) ( not ( = ?auto_438757 ?auto_438760 ) ) ( not ( = ?auto_438757 ?auto_438761 ) ) ( not ( = ?auto_438757 ?auto_438762 ) ) ( not ( = ?auto_438757 ?auto_438763 ) ) ( not ( = ?auto_438757 ?auto_438764 ) ) ( not ( = ?auto_438757 ?auto_438765 ) ) ( not ( = ?auto_438757 ?auto_438766 ) ) ( not ( = ?auto_438757 ?auto_438767 ) ) ( not ( = ?auto_438758 ?auto_438759 ) ) ( not ( = ?auto_438758 ?auto_438760 ) ) ( not ( = ?auto_438758 ?auto_438761 ) ) ( not ( = ?auto_438758 ?auto_438762 ) ) ( not ( = ?auto_438758 ?auto_438763 ) ) ( not ( = ?auto_438758 ?auto_438764 ) ) ( not ( = ?auto_438758 ?auto_438765 ) ) ( not ( = ?auto_438758 ?auto_438766 ) ) ( not ( = ?auto_438758 ?auto_438767 ) ) ( not ( = ?auto_438759 ?auto_438760 ) ) ( not ( = ?auto_438759 ?auto_438761 ) ) ( not ( = ?auto_438759 ?auto_438762 ) ) ( not ( = ?auto_438759 ?auto_438763 ) ) ( not ( = ?auto_438759 ?auto_438764 ) ) ( not ( = ?auto_438759 ?auto_438765 ) ) ( not ( = ?auto_438759 ?auto_438766 ) ) ( not ( = ?auto_438759 ?auto_438767 ) ) ( not ( = ?auto_438760 ?auto_438761 ) ) ( not ( = ?auto_438760 ?auto_438762 ) ) ( not ( = ?auto_438760 ?auto_438763 ) ) ( not ( = ?auto_438760 ?auto_438764 ) ) ( not ( = ?auto_438760 ?auto_438765 ) ) ( not ( = ?auto_438760 ?auto_438766 ) ) ( not ( = ?auto_438760 ?auto_438767 ) ) ( not ( = ?auto_438761 ?auto_438762 ) ) ( not ( = ?auto_438761 ?auto_438763 ) ) ( not ( = ?auto_438761 ?auto_438764 ) ) ( not ( = ?auto_438761 ?auto_438765 ) ) ( not ( = ?auto_438761 ?auto_438766 ) ) ( not ( = ?auto_438761 ?auto_438767 ) ) ( not ( = ?auto_438762 ?auto_438763 ) ) ( not ( = ?auto_438762 ?auto_438764 ) ) ( not ( = ?auto_438762 ?auto_438765 ) ) ( not ( = ?auto_438762 ?auto_438766 ) ) ( not ( = ?auto_438762 ?auto_438767 ) ) ( not ( = ?auto_438763 ?auto_438764 ) ) ( not ( = ?auto_438763 ?auto_438765 ) ) ( not ( = ?auto_438763 ?auto_438766 ) ) ( not ( = ?auto_438763 ?auto_438767 ) ) ( not ( = ?auto_438764 ?auto_438765 ) ) ( not ( = ?auto_438764 ?auto_438766 ) ) ( not ( = ?auto_438764 ?auto_438767 ) ) ( not ( = ?auto_438765 ?auto_438766 ) ) ( not ( = ?auto_438765 ?auto_438767 ) ) ( not ( = ?auto_438766 ?auto_438767 ) ) ( ON ?auto_438766 ?auto_438767 ) ( ON ?auto_438765 ?auto_438766 ) ( ON ?auto_438764 ?auto_438765 ) ( ON ?auto_438763 ?auto_438764 ) ( ON ?auto_438762 ?auto_438763 ) ( ON ?auto_438761 ?auto_438762 ) ( ON ?auto_438760 ?auto_438761 ) ( ON ?auto_438759 ?auto_438760 ) ( ON ?auto_438758 ?auto_438759 ) ( ON ?auto_438757 ?auto_438758 ) ( ON ?auto_438756 ?auto_438757 ) ( ON ?auto_438755 ?auto_438756 ) ( CLEAR ?auto_438753 ) ( ON ?auto_438754 ?auto_438755 ) ( CLEAR ?auto_438754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_438753 ?auto_438754 )
      ( MAKE-15PILE ?auto_438753 ?auto_438754 ?auto_438755 ?auto_438756 ?auto_438757 ?auto_438758 ?auto_438759 ?auto_438760 ?auto_438761 ?auto_438762 ?auto_438763 ?auto_438764 ?auto_438765 ?auto_438766 ?auto_438767 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438783 - BLOCK
      ?auto_438784 - BLOCK
      ?auto_438785 - BLOCK
      ?auto_438786 - BLOCK
      ?auto_438787 - BLOCK
      ?auto_438788 - BLOCK
      ?auto_438789 - BLOCK
      ?auto_438790 - BLOCK
      ?auto_438791 - BLOCK
      ?auto_438792 - BLOCK
      ?auto_438793 - BLOCK
      ?auto_438794 - BLOCK
      ?auto_438795 - BLOCK
      ?auto_438796 - BLOCK
      ?auto_438797 - BLOCK
    )
    :vars
    (
      ?auto_438798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_438797 ?auto_438798 ) ( not ( = ?auto_438783 ?auto_438784 ) ) ( not ( = ?auto_438783 ?auto_438785 ) ) ( not ( = ?auto_438783 ?auto_438786 ) ) ( not ( = ?auto_438783 ?auto_438787 ) ) ( not ( = ?auto_438783 ?auto_438788 ) ) ( not ( = ?auto_438783 ?auto_438789 ) ) ( not ( = ?auto_438783 ?auto_438790 ) ) ( not ( = ?auto_438783 ?auto_438791 ) ) ( not ( = ?auto_438783 ?auto_438792 ) ) ( not ( = ?auto_438783 ?auto_438793 ) ) ( not ( = ?auto_438783 ?auto_438794 ) ) ( not ( = ?auto_438783 ?auto_438795 ) ) ( not ( = ?auto_438783 ?auto_438796 ) ) ( not ( = ?auto_438783 ?auto_438797 ) ) ( not ( = ?auto_438783 ?auto_438798 ) ) ( not ( = ?auto_438784 ?auto_438785 ) ) ( not ( = ?auto_438784 ?auto_438786 ) ) ( not ( = ?auto_438784 ?auto_438787 ) ) ( not ( = ?auto_438784 ?auto_438788 ) ) ( not ( = ?auto_438784 ?auto_438789 ) ) ( not ( = ?auto_438784 ?auto_438790 ) ) ( not ( = ?auto_438784 ?auto_438791 ) ) ( not ( = ?auto_438784 ?auto_438792 ) ) ( not ( = ?auto_438784 ?auto_438793 ) ) ( not ( = ?auto_438784 ?auto_438794 ) ) ( not ( = ?auto_438784 ?auto_438795 ) ) ( not ( = ?auto_438784 ?auto_438796 ) ) ( not ( = ?auto_438784 ?auto_438797 ) ) ( not ( = ?auto_438784 ?auto_438798 ) ) ( not ( = ?auto_438785 ?auto_438786 ) ) ( not ( = ?auto_438785 ?auto_438787 ) ) ( not ( = ?auto_438785 ?auto_438788 ) ) ( not ( = ?auto_438785 ?auto_438789 ) ) ( not ( = ?auto_438785 ?auto_438790 ) ) ( not ( = ?auto_438785 ?auto_438791 ) ) ( not ( = ?auto_438785 ?auto_438792 ) ) ( not ( = ?auto_438785 ?auto_438793 ) ) ( not ( = ?auto_438785 ?auto_438794 ) ) ( not ( = ?auto_438785 ?auto_438795 ) ) ( not ( = ?auto_438785 ?auto_438796 ) ) ( not ( = ?auto_438785 ?auto_438797 ) ) ( not ( = ?auto_438785 ?auto_438798 ) ) ( not ( = ?auto_438786 ?auto_438787 ) ) ( not ( = ?auto_438786 ?auto_438788 ) ) ( not ( = ?auto_438786 ?auto_438789 ) ) ( not ( = ?auto_438786 ?auto_438790 ) ) ( not ( = ?auto_438786 ?auto_438791 ) ) ( not ( = ?auto_438786 ?auto_438792 ) ) ( not ( = ?auto_438786 ?auto_438793 ) ) ( not ( = ?auto_438786 ?auto_438794 ) ) ( not ( = ?auto_438786 ?auto_438795 ) ) ( not ( = ?auto_438786 ?auto_438796 ) ) ( not ( = ?auto_438786 ?auto_438797 ) ) ( not ( = ?auto_438786 ?auto_438798 ) ) ( not ( = ?auto_438787 ?auto_438788 ) ) ( not ( = ?auto_438787 ?auto_438789 ) ) ( not ( = ?auto_438787 ?auto_438790 ) ) ( not ( = ?auto_438787 ?auto_438791 ) ) ( not ( = ?auto_438787 ?auto_438792 ) ) ( not ( = ?auto_438787 ?auto_438793 ) ) ( not ( = ?auto_438787 ?auto_438794 ) ) ( not ( = ?auto_438787 ?auto_438795 ) ) ( not ( = ?auto_438787 ?auto_438796 ) ) ( not ( = ?auto_438787 ?auto_438797 ) ) ( not ( = ?auto_438787 ?auto_438798 ) ) ( not ( = ?auto_438788 ?auto_438789 ) ) ( not ( = ?auto_438788 ?auto_438790 ) ) ( not ( = ?auto_438788 ?auto_438791 ) ) ( not ( = ?auto_438788 ?auto_438792 ) ) ( not ( = ?auto_438788 ?auto_438793 ) ) ( not ( = ?auto_438788 ?auto_438794 ) ) ( not ( = ?auto_438788 ?auto_438795 ) ) ( not ( = ?auto_438788 ?auto_438796 ) ) ( not ( = ?auto_438788 ?auto_438797 ) ) ( not ( = ?auto_438788 ?auto_438798 ) ) ( not ( = ?auto_438789 ?auto_438790 ) ) ( not ( = ?auto_438789 ?auto_438791 ) ) ( not ( = ?auto_438789 ?auto_438792 ) ) ( not ( = ?auto_438789 ?auto_438793 ) ) ( not ( = ?auto_438789 ?auto_438794 ) ) ( not ( = ?auto_438789 ?auto_438795 ) ) ( not ( = ?auto_438789 ?auto_438796 ) ) ( not ( = ?auto_438789 ?auto_438797 ) ) ( not ( = ?auto_438789 ?auto_438798 ) ) ( not ( = ?auto_438790 ?auto_438791 ) ) ( not ( = ?auto_438790 ?auto_438792 ) ) ( not ( = ?auto_438790 ?auto_438793 ) ) ( not ( = ?auto_438790 ?auto_438794 ) ) ( not ( = ?auto_438790 ?auto_438795 ) ) ( not ( = ?auto_438790 ?auto_438796 ) ) ( not ( = ?auto_438790 ?auto_438797 ) ) ( not ( = ?auto_438790 ?auto_438798 ) ) ( not ( = ?auto_438791 ?auto_438792 ) ) ( not ( = ?auto_438791 ?auto_438793 ) ) ( not ( = ?auto_438791 ?auto_438794 ) ) ( not ( = ?auto_438791 ?auto_438795 ) ) ( not ( = ?auto_438791 ?auto_438796 ) ) ( not ( = ?auto_438791 ?auto_438797 ) ) ( not ( = ?auto_438791 ?auto_438798 ) ) ( not ( = ?auto_438792 ?auto_438793 ) ) ( not ( = ?auto_438792 ?auto_438794 ) ) ( not ( = ?auto_438792 ?auto_438795 ) ) ( not ( = ?auto_438792 ?auto_438796 ) ) ( not ( = ?auto_438792 ?auto_438797 ) ) ( not ( = ?auto_438792 ?auto_438798 ) ) ( not ( = ?auto_438793 ?auto_438794 ) ) ( not ( = ?auto_438793 ?auto_438795 ) ) ( not ( = ?auto_438793 ?auto_438796 ) ) ( not ( = ?auto_438793 ?auto_438797 ) ) ( not ( = ?auto_438793 ?auto_438798 ) ) ( not ( = ?auto_438794 ?auto_438795 ) ) ( not ( = ?auto_438794 ?auto_438796 ) ) ( not ( = ?auto_438794 ?auto_438797 ) ) ( not ( = ?auto_438794 ?auto_438798 ) ) ( not ( = ?auto_438795 ?auto_438796 ) ) ( not ( = ?auto_438795 ?auto_438797 ) ) ( not ( = ?auto_438795 ?auto_438798 ) ) ( not ( = ?auto_438796 ?auto_438797 ) ) ( not ( = ?auto_438796 ?auto_438798 ) ) ( not ( = ?auto_438797 ?auto_438798 ) ) ( ON ?auto_438796 ?auto_438797 ) ( ON ?auto_438795 ?auto_438796 ) ( ON ?auto_438794 ?auto_438795 ) ( ON ?auto_438793 ?auto_438794 ) ( ON ?auto_438792 ?auto_438793 ) ( ON ?auto_438791 ?auto_438792 ) ( ON ?auto_438790 ?auto_438791 ) ( ON ?auto_438789 ?auto_438790 ) ( ON ?auto_438788 ?auto_438789 ) ( ON ?auto_438787 ?auto_438788 ) ( ON ?auto_438786 ?auto_438787 ) ( ON ?auto_438785 ?auto_438786 ) ( ON ?auto_438784 ?auto_438785 ) ( ON ?auto_438783 ?auto_438784 ) ( CLEAR ?auto_438783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_438783 )
      ( MAKE-15PILE ?auto_438783 ?auto_438784 ?auto_438785 ?auto_438786 ?auto_438787 ?auto_438788 ?auto_438789 ?auto_438790 ?auto_438791 ?auto_438792 ?auto_438793 ?auto_438794 ?auto_438795 ?auto_438796 ?auto_438797 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438814 - BLOCK
      ?auto_438815 - BLOCK
      ?auto_438816 - BLOCK
      ?auto_438817 - BLOCK
      ?auto_438818 - BLOCK
      ?auto_438819 - BLOCK
      ?auto_438820 - BLOCK
      ?auto_438821 - BLOCK
      ?auto_438822 - BLOCK
      ?auto_438823 - BLOCK
      ?auto_438824 - BLOCK
      ?auto_438825 - BLOCK
      ?auto_438826 - BLOCK
      ?auto_438827 - BLOCK
      ?auto_438828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_438828 ) ( not ( = ?auto_438814 ?auto_438815 ) ) ( not ( = ?auto_438814 ?auto_438816 ) ) ( not ( = ?auto_438814 ?auto_438817 ) ) ( not ( = ?auto_438814 ?auto_438818 ) ) ( not ( = ?auto_438814 ?auto_438819 ) ) ( not ( = ?auto_438814 ?auto_438820 ) ) ( not ( = ?auto_438814 ?auto_438821 ) ) ( not ( = ?auto_438814 ?auto_438822 ) ) ( not ( = ?auto_438814 ?auto_438823 ) ) ( not ( = ?auto_438814 ?auto_438824 ) ) ( not ( = ?auto_438814 ?auto_438825 ) ) ( not ( = ?auto_438814 ?auto_438826 ) ) ( not ( = ?auto_438814 ?auto_438827 ) ) ( not ( = ?auto_438814 ?auto_438828 ) ) ( not ( = ?auto_438815 ?auto_438816 ) ) ( not ( = ?auto_438815 ?auto_438817 ) ) ( not ( = ?auto_438815 ?auto_438818 ) ) ( not ( = ?auto_438815 ?auto_438819 ) ) ( not ( = ?auto_438815 ?auto_438820 ) ) ( not ( = ?auto_438815 ?auto_438821 ) ) ( not ( = ?auto_438815 ?auto_438822 ) ) ( not ( = ?auto_438815 ?auto_438823 ) ) ( not ( = ?auto_438815 ?auto_438824 ) ) ( not ( = ?auto_438815 ?auto_438825 ) ) ( not ( = ?auto_438815 ?auto_438826 ) ) ( not ( = ?auto_438815 ?auto_438827 ) ) ( not ( = ?auto_438815 ?auto_438828 ) ) ( not ( = ?auto_438816 ?auto_438817 ) ) ( not ( = ?auto_438816 ?auto_438818 ) ) ( not ( = ?auto_438816 ?auto_438819 ) ) ( not ( = ?auto_438816 ?auto_438820 ) ) ( not ( = ?auto_438816 ?auto_438821 ) ) ( not ( = ?auto_438816 ?auto_438822 ) ) ( not ( = ?auto_438816 ?auto_438823 ) ) ( not ( = ?auto_438816 ?auto_438824 ) ) ( not ( = ?auto_438816 ?auto_438825 ) ) ( not ( = ?auto_438816 ?auto_438826 ) ) ( not ( = ?auto_438816 ?auto_438827 ) ) ( not ( = ?auto_438816 ?auto_438828 ) ) ( not ( = ?auto_438817 ?auto_438818 ) ) ( not ( = ?auto_438817 ?auto_438819 ) ) ( not ( = ?auto_438817 ?auto_438820 ) ) ( not ( = ?auto_438817 ?auto_438821 ) ) ( not ( = ?auto_438817 ?auto_438822 ) ) ( not ( = ?auto_438817 ?auto_438823 ) ) ( not ( = ?auto_438817 ?auto_438824 ) ) ( not ( = ?auto_438817 ?auto_438825 ) ) ( not ( = ?auto_438817 ?auto_438826 ) ) ( not ( = ?auto_438817 ?auto_438827 ) ) ( not ( = ?auto_438817 ?auto_438828 ) ) ( not ( = ?auto_438818 ?auto_438819 ) ) ( not ( = ?auto_438818 ?auto_438820 ) ) ( not ( = ?auto_438818 ?auto_438821 ) ) ( not ( = ?auto_438818 ?auto_438822 ) ) ( not ( = ?auto_438818 ?auto_438823 ) ) ( not ( = ?auto_438818 ?auto_438824 ) ) ( not ( = ?auto_438818 ?auto_438825 ) ) ( not ( = ?auto_438818 ?auto_438826 ) ) ( not ( = ?auto_438818 ?auto_438827 ) ) ( not ( = ?auto_438818 ?auto_438828 ) ) ( not ( = ?auto_438819 ?auto_438820 ) ) ( not ( = ?auto_438819 ?auto_438821 ) ) ( not ( = ?auto_438819 ?auto_438822 ) ) ( not ( = ?auto_438819 ?auto_438823 ) ) ( not ( = ?auto_438819 ?auto_438824 ) ) ( not ( = ?auto_438819 ?auto_438825 ) ) ( not ( = ?auto_438819 ?auto_438826 ) ) ( not ( = ?auto_438819 ?auto_438827 ) ) ( not ( = ?auto_438819 ?auto_438828 ) ) ( not ( = ?auto_438820 ?auto_438821 ) ) ( not ( = ?auto_438820 ?auto_438822 ) ) ( not ( = ?auto_438820 ?auto_438823 ) ) ( not ( = ?auto_438820 ?auto_438824 ) ) ( not ( = ?auto_438820 ?auto_438825 ) ) ( not ( = ?auto_438820 ?auto_438826 ) ) ( not ( = ?auto_438820 ?auto_438827 ) ) ( not ( = ?auto_438820 ?auto_438828 ) ) ( not ( = ?auto_438821 ?auto_438822 ) ) ( not ( = ?auto_438821 ?auto_438823 ) ) ( not ( = ?auto_438821 ?auto_438824 ) ) ( not ( = ?auto_438821 ?auto_438825 ) ) ( not ( = ?auto_438821 ?auto_438826 ) ) ( not ( = ?auto_438821 ?auto_438827 ) ) ( not ( = ?auto_438821 ?auto_438828 ) ) ( not ( = ?auto_438822 ?auto_438823 ) ) ( not ( = ?auto_438822 ?auto_438824 ) ) ( not ( = ?auto_438822 ?auto_438825 ) ) ( not ( = ?auto_438822 ?auto_438826 ) ) ( not ( = ?auto_438822 ?auto_438827 ) ) ( not ( = ?auto_438822 ?auto_438828 ) ) ( not ( = ?auto_438823 ?auto_438824 ) ) ( not ( = ?auto_438823 ?auto_438825 ) ) ( not ( = ?auto_438823 ?auto_438826 ) ) ( not ( = ?auto_438823 ?auto_438827 ) ) ( not ( = ?auto_438823 ?auto_438828 ) ) ( not ( = ?auto_438824 ?auto_438825 ) ) ( not ( = ?auto_438824 ?auto_438826 ) ) ( not ( = ?auto_438824 ?auto_438827 ) ) ( not ( = ?auto_438824 ?auto_438828 ) ) ( not ( = ?auto_438825 ?auto_438826 ) ) ( not ( = ?auto_438825 ?auto_438827 ) ) ( not ( = ?auto_438825 ?auto_438828 ) ) ( not ( = ?auto_438826 ?auto_438827 ) ) ( not ( = ?auto_438826 ?auto_438828 ) ) ( not ( = ?auto_438827 ?auto_438828 ) ) ( ON ?auto_438827 ?auto_438828 ) ( ON ?auto_438826 ?auto_438827 ) ( ON ?auto_438825 ?auto_438826 ) ( ON ?auto_438824 ?auto_438825 ) ( ON ?auto_438823 ?auto_438824 ) ( ON ?auto_438822 ?auto_438823 ) ( ON ?auto_438821 ?auto_438822 ) ( ON ?auto_438820 ?auto_438821 ) ( ON ?auto_438819 ?auto_438820 ) ( ON ?auto_438818 ?auto_438819 ) ( ON ?auto_438817 ?auto_438818 ) ( ON ?auto_438816 ?auto_438817 ) ( ON ?auto_438815 ?auto_438816 ) ( ON ?auto_438814 ?auto_438815 ) ( CLEAR ?auto_438814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_438814 )
      ( MAKE-15PILE ?auto_438814 ?auto_438815 ?auto_438816 ?auto_438817 ?auto_438818 ?auto_438819 ?auto_438820 ?auto_438821 ?auto_438822 ?auto_438823 ?auto_438824 ?auto_438825 ?auto_438826 ?auto_438827 ?auto_438828 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_438844 - BLOCK
      ?auto_438845 - BLOCK
      ?auto_438846 - BLOCK
      ?auto_438847 - BLOCK
      ?auto_438848 - BLOCK
      ?auto_438849 - BLOCK
      ?auto_438850 - BLOCK
      ?auto_438851 - BLOCK
      ?auto_438852 - BLOCK
      ?auto_438853 - BLOCK
      ?auto_438854 - BLOCK
      ?auto_438855 - BLOCK
      ?auto_438856 - BLOCK
      ?auto_438857 - BLOCK
      ?auto_438858 - BLOCK
    )
    :vars
    (
      ?auto_438859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_438844 ?auto_438845 ) ) ( not ( = ?auto_438844 ?auto_438846 ) ) ( not ( = ?auto_438844 ?auto_438847 ) ) ( not ( = ?auto_438844 ?auto_438848 ) ) ( not ( = ?auto_438844 ?auto_438849 ) ) ( not ( = ?auto_438844 ?auto_438850 ) ) ( not ( = ?auto_438844 ?auto_438851 ) ) ( not ( = ?auto_438844 ?auto_438852 ) ) ( not ( = ?auto_438844 ?auto_438853 ) ) ( not ( = ?auto_438844 ?auto_438854 ) ) ( not ( = ?auto_438844 ?auto_438855 ) ) ( not ( = ?auto_438844 ?auto_438856 ) ) ( not ( = ?auto_438844 ?auto_438857 ) ) ( not ( = ?auto_438844 ?auto_438858 ) ) ( not ( = ?auto_438845 ?auto_438846 ) ) ( not ( = ?auto_438845 ?auto_438847 ) ) ( not ( = ?auto_438845 ?auto_438848 ) ) ( not ( = ?auto_438845 ?auto_438849 ) ) ( not ( = ?auto_438845 ?auto_438850 ) ) ( not ( = ?auto_438845 ?auto_438851 ) ) ( not ( = ?auto_438845 ?auto_438852 ) ) ( not ( = ?auto_438845 ?auto_438853 ) ) ( not ( = ?auto_438845 ?auto_438854 ) ) ( not ( = ?auto_438845 ?auto_438855 ) ) ( not ( = ?auto_438845 ?auto_438856 ) ) ( not ( = ?auto_438845 ?auto_438857 ) ) ( not ( = ?auto_438845 ?auto_438858 ) ) ( not ( = ?auto_438846 ?auto_438847 ) ) ( not ( = ?auto_438846 ?auto_438848 ) ) ( not ( = ?auto_438846 ?auto_438849 ) ) ( not ( = ?auto_438846 ?auto_438850 ) ) ( not ( = ?auto_438846 ?auto_438851 ) ) ( not ( = ?auto_438846 ?auto_438852 ) ) ( not ( = ?auto_438846 ?auto_438853 ) ) ( not ( = ?auto_438846 ?auto_438854 ) ) ( not ( = ?auto_438846 ?auto_438855 ) ) ( not ( = ?auto_438846 ?auto_438856 ) ) ( not ( = ?auto_438846 ?auto_438857 ) ) ( not ( = ?auto_438846 ?auto_438858 ) ) ( not ( = ?auto_438847 ?auto_438848 ) ) ( not ( = ?auto_438847 ?auto_438849 ) ) ( not ( = ?auto_438847 ?auto_438850 ) ) ( not ( = ?auto_438847 ?auto_438851 ) ) ( not ( = ?auto_438847 ?auto_438852 ) ) ( not ( = ?auto_438847 ?auto_438853 ) ) ( not ( = ?auto_438847 ?auto_438854 ) ) ( not ( = ?auto_438847 ?auto_438855 ) ) ( not ( = ?auto_438847 ?auto_438856 ) ) ( not ( = ?auto_438847 ?auto_438857 ) ) ( not ( = ?auto_438847 ?auto_438858 ) ) ( not ( = ?auto_438848 ?auto_438849 ) ) ( not ( = ?auto_438848 ?auto_438850 ) ) ( not ( = ?auto_438848 ?auto_438851 ) ) ( not ( = ?auto_438848 ?auto_438852 ) ) ( not ( = ?auto_438848 ?auto_438853 ) ) ( not ( = ?auto_438848 ?auto_438854 ) ) ( not ( = ?auto_438848 ?auto_438855 ) ) ( not ( = ?auto_438848 ?auto_438856 ) ) ( not ( = ?auto_438848 ?auto_438857 ) ) ( not ( = ?auto_438848 ?auto_438858 ) ) ( not ( = ?auto_438849 ?auto_438850 ) ) ( not ( = ?auto_438849 ?auto_438851 ) ) ( not ( = ?auto_438849 ?auto_438852 ) ) ( not ( = ?auto_438849 ?auto_438853 ) ) ( not ( = ?auto_438849 ?auto_438854 ) ) ( not ( = ?auto_438849 ?auto_438855 ) ) ( not ( = ?auto_438849 ?auto_438856 ) ) ( not ( = ?auto_438849 ?auto_438857 ) ) ( not ( = ?auto_438849 ?auto_438858 ) ) ( not ( = ?auto_438850 ?auto_438851 ) ) ( not ( = ?auto_438850 ?auto_438852 ) ) ( not ( = ?auto_438850 ?auto_438853 ) ) ( not ( = ?auto_438850 ?auto_438854 ) ) ( not ( = ?auto_438850 ?auto_438855 ) ) ( not ( = ?auto_438850 ?auto_438856 ) ) ( not ( = ?auto_438850 ?auto_438857 ) ) ( not ( = ?auto_438850 ?auto_438858 ) ) ( not ( = ?auto_438851 ?auto_438852 ) ) ( not ( = ?auto_438851 ?auto_438853 ) ) ( not ( = ?auto_438851 ?auto_438854 ) ) ( not ( = ?auto_438851 ?auto_438855 ) ) ( not ( = ?auto_438851 ?auto_438856 ) ) ( not ( = ?auto_438851 ?auto_438857 ) ) ( not ( = ?auto_438851 ?auto_438858 ) ) ( not ( = ?auto_438852 ?auto_438853 ) ) ( not ( = ?auto_438852 ?auto_438854 ) ) ( not ( = ?auto_438852 ?auto_438855 ) ) ( not ( = ?auto_438852 ?auto_438856 ) ) ( not ( = ?auto_438852 ?auto_438857 ) ) ( not ( = ?auto_438852 ?auto_438858 ) ) ( not ( = ?auto_438853 ?auto_438854 ) ) ( not ( = ?auto_438853 ?auto_438855 ) ) ( not ( = ?auto_438853 ?auto_438856 ) ) ( not ( = ?auto_438853 ?auto_438857 ) ) ( not ( = ?auto_438853 ?auto_438858 ) ) ( not ( = ?auto_438854 ?auto_438855 ) ) ( not ( = ?auto_438854 ?auto_438856 ) ) ( not ( = ?auto_438854 ?auto_438857 ) ) ( not ( = ?auto_438854 ?auto_438858 ) ) ( not ( = ?auto_438855 ?auto_438856 ) ) ( not ( = ?auto_438855 ?auto_438857 ) ) ( not ( = ?auto_438855 ?auto_438858 ) ) ( not ( = ?auto_438856 ?auto_438857 ) ) ( not ( = ?auto_438856 ?auto_438858 ) ) ( not ( = ?auto_438857 ?auto_438858 ) ) ( ON ?auto_438844 ?auto_438859 ) ( not ( = ?auto_438858 ?auto_438859 ) ) ( not ( = ?auto_438857 ?auto_438859 ) ) ( not ( = ?auto_438856 ?auto_438859 ) ) ( not ( = ?auto_438855 ?auto_438859 ) ) ( not ( = ?auto_438854 ?auto_438859 ) ) ( not ( = ?auto_438853 ?auto_438859 ) ) ( not ( = ?auto_438852 ?auto_438859 ) ) ( not ( = ?auto_438851 ?auto_438859 ) ) ( not ( = ?auto_438850 ?auto_438859 ) ) ( not ( = ?auto_438849 ?auto_438859 ) ) ( not ( = ?auto_438848 ?auto_438859 ) ) ( not ( = ?auto_438847 ?auto_438859 ) ) ( not ( = ?auto_438846 ?auto_438859 ) ) ( not ( = ?auto_438845 ?auto_438859 ) ) ( not ( = ?auto_438844 ?auto_438859 ) ) ( ON ?auto_438845 ?auto_438844 ) ( ON ?auto_438846 ?auto_438845 ) ( ON ?auto_438847 ?auto_438846 ) ( ON ?auto_438848 ?auto_438847 ) ( ON ?auto_438849 ?auto_438848 ) ( ON ?auto_438850 ?auto_438849 ) ( ON ?auto_438851 ?auto_438850 ) ( ON ?auto_438852 ?auto_438851 ) ( ON ?auto_438853 ?auto_438852 ) ( ON ?auto_438854 ?auto_438853 ) ( ON ?auto_438855 ?auto_438854 ) ( ON ?auto_438856 ?auto_438855 ) ( ON ?auto_438857 ?auto_438856 ) ( ON ?auto_438858 ?auto_438857 ) ( CLEAR ?auto_438858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_438858 ?auto_438857 ?auto_438856 ?auto_438855 ?auto_438854 ?auto_438853 ?auto_438852 ?auto_438851 ?auto_438850 ?auto_438849 ?auto_438848 ?auto_438847 ?auto_438846 ?auto_438845 ?auto_438844 )
      ( MAKE-15PILE ?auto_438844 ?auto_438845 ?auto_438846 ?auto_438847 ?auto_438848 ?auto_438849 ?auto_438850 ?auto_438851 ?auto_438852 ?auto_438853 ?auto_438854 ?auto_438855 ?auto_438856 ?auto_438857 ?auto_438858 ) )
  )

)

