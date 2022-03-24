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
      ?auto_37700 - BLOCK
      ?auto_37701 - BLOCK
      ?auto_37702 - BLOCK
      ?auto_37703 - BLOCK
      ?auto_37704 - BLOCK
      ?auto_37705 - BLOCK
    )
    :vars
    (
      ?auto_37706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37706 ?auto_37705 ) ( CLEAR ?auto_37706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37700 ) ( ON ?auto_37701 ?auto_37700 ) ( ON ?auto_37702 ?auto_37701 ) ( ON ?auto_37703 ?auto_37702 ) ( ON ?auto_37704 ?auto_37703 ) ( ON ?auto_37705 ?auto_37704 ) ( not ( = ?auto_37700 ?auto_37701 ) ) ( not ( = ?auto_37700 ?auto_37702 ) ) ( not ( = ?auto_37700 ?auto_37703 ) ) ( not ( = ?auto_37700 ?auto_37704 ) ) ( not ( = ?auto_37700 ?auto_37705 ) ) ( not ( = ?auto_37700 ?auto_37706 ) ) ( not ( = ?auto_37701 ?auto_37702 ) ) ( not ( = ?auto_37701 ?auto_37703 ) ) ( not ( = ?auto_37701 ?auto_37704 ) ) ( not ( = ?auto_37701 ?auto_37705 ) ) ( not ( = ?auto_37701 ?auto_37706 ) ) ( not ( = ?auto_37702 ?auto_37703 ) ) ( not ( = ?auto_37702 ?auto_37704 ) ) ( not ( = ?auto_37702 ?auto_37705 ) ) ( not ( = ?auto_37702 ?auto_37706 ) ) ( not ( = ?auto_37703 ?auto_37704 ) ) ( not ( = ?auto_37703 ?auto_37705 ) ) ( not ( = ?auto_37703 ?auto_37706 ) ) ( not ( = ?auto_37704 ?auto_37705 ) ) ( not ( = ?auto_37704 ?auto_37706 ) ) ( not ( = ?auto_37705 ?auto_37706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37706 ?auto_37705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37708 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37708 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_37708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37709 - BLOCK
    )
    :vars
    (
      ?auto_37710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37709 ?auto_37710 ) ( CLEAR ?auto_37709 ) ( HAND-EMPTY ) ( not ( = ?auto_37709 ?auto_37710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37709 ?auto_37710 )
      ( MAKE-1PILE ?auto_37709 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37716 - BLOCK
      ?auto_37717 - BLOCK
      ?auto_37718 - BLOCK
      ?auto_37719 - BLOCK
      ?auto_37720 - BLOCK
    )
    :vars
    (
      ?auto_37721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37721 ?auto_37720 ) ( CLEAR ?auto_37721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37716 ) ( ON ?auto_37717 ?auto_37716 ) ( ON ?auto_37718 ?auto_37717 ) ( ON ?auto_37719 ?auto_37718 ) ( ON ?auto_37720 ?auto_37719 ) ( not ( = ?auto_37716 ?auto_37717 ) ) ( not ( = ?auto_37716 ?auto_37718 ) ) ( not ( = ?auto_37716 ?auto_37719 ) ) ( not ( = ?auto_37716 ?auto_37720 ) ) ( not ( = ?auto_37716 ?auto_37721 ) ) ( not ( = ?auto_37717 ?auto_37718 ) ) ( not ( = ?auto_37717 ?auto_37719 ) ) ( not ( = ?auto_37717 ?auto_37720 ) ) ( not ( = ?auto_37717 ?auto_37721 ) ) ( not ( = ?auto_37718 ?auto_37719 ) ) ( not ( = ?auto_37718 ?auto_37720 ) ) ( not ( = ?auto_37718 ?auto_37721 ) ) ( not ( = ?auto_37719 ?auto_37720 ) ) ( not ( = ?auto_37719 ?auto_37721 ) ) ( not ( = ?auto_37720 ?auto_37721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37721 ?auto_37720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37722 - BLOCK
      ?auto_37723 - BLOCK
      ?auto_37724 - BLOCK
      ?auto_37725 - BLOCK
      ?auto_37726 - BLOCK
    )
    :vars
    (
      ?auto_37727 - BLOCK
      ?auto_37728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37727 ?auto_37726 ) ( CLEAR ?auto_37727 ) ( ON-TABLE ?auto_37722 ) ( ON ?auto_37723 ?auto_37722 ) ( ON ?auto_37724 ?auto_37723 ) ( ON ?auto_37725 ?auto_37724 ) ( ON ?auto_37726 ?auto_37725 ) ( not ( = ?auto_37722 ?auto_37723 ) ) ( not ( = ?auto_37722 ?auto_37724 ) ) ( not ( = ?auto_37722 ?auto_37725 ) ) ( not ( = ?auto_37722 ?auto_37726 ) ) ( not ( = ?auto_37722 ?auto_37727 ) ) ( not ( = ?auto_37723 ?auto_37724 ) ) ( not ( = ?auto_37723 ?auto_37725 ) ) ( not ( = ?auto_37723 ?auto_37726 ) ) ( not ( = ?auto_37723 ?auto_37727 ) ) ( not ( = ?auto_37724 ?auto_37725 ) ) ( not ( = ?auto_37724 ?auto_37726 ) ) ( not ( = ?auto_37724 ?auto_37727 ) ) ( not ( = ?auto_37725 ?auto_37726 ) ) ( not ( = ?auto_37725 ?auto_37727 ) ) ( not ( = ?auto_37726 ?auto_37727 ) ) ( HOLDING ?auto_37728 ) ( not ( = ?auto_37722 ?auto_37728 ) ) ( not ( = ?auto_37723 ?auto_37728 ) ) ( not ( = ?auto_37724 ?auto_37728 ) ) ( not ( = ?auto_37725 ?auto_37728 ) ) ( not ( = ?auto_37726 ?auto_37728 ) ) ( not ( = ?auto_37727 ?auto_37728 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_37728 )
      ( MAKE-5PILE ?auto_37722 ?auto_37723 ?auto_37724 ?auto_37725 ?auto_37726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37729 - BLOCK
      ?auto_37730 - BLOCK
      ?auto_37731 - BLOCK
      ?auto_37732 - BLOCK
      ?auto_37733 - BLOCK
    )
    :vars
    (
      ?auto_37735 - BLOCK
      ?auto_37734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37735 ?auto_37733 ) ( ON-TABLE ?auto_37729 ) ( ON ?auto_37730 ?auto_37729 ) ( ON ?auto_37731 ?auto_37730 ) ( ON ?auto_37732 ?auto_37731 ) ( ON ?auto_37733 ?auto_37732 ) ( not ( = ?auto_37729 ?auto_37730 ) ) ( not ( = ?auto_37729 ?auto_37731 ) ) ( not ( = ?auto_37729 ?auto_37732 ) ) ( not ( = ?auto_37729 ?auto_37733 ) ) ( not ( = ?auto_37729 ?auto_37735 ) ) ( not ( = ?auto_37730 ?auto_37731 ) ) ( not ( = ?auto_37730 ?auto_37732 ) ) ( not ( = ?auto_37730 ?auto_37733 ) ) ( not ( = ?auto_37730 ?auto_37735 ) ) ( not ( = ?auto_37731 ?auto_37732 ) ) ( not ( = ?auto_37731 ?auto_37733 ) ) ( not ( = ?auto_37731 ?auto_37735 ) ) ( not ( = ?auto_37732 ?auto_37733 ) ) ( not ( = ?auto_37732 ?auto_37735 ) ) ( not ( = ?auto_37733 ?auto_37735 ) ) ( not ( = ?auto_37729 ?auto_37734 ) ) ( not ( = ?auto_37730 ?auto_37734 ) ) ( not ( = ?auto_37731 ?auto_37734 ) ) ( not ( = ?auto_37732 ?auto_37734 ) ) ( not ( = ?auto_37733 ?auto_37734 ) ) ( not ( = ?auto_37735 ?auto_37734 ) ) ( ON ?auto_37734 ?auto_37735 ) ( CLEAR ?auto_37734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37729 ?auto_37730 ?auto_37731 ?auto_37732 ?auto_37733 ?auto_37735 )
      ( MAKE-5PILE ?auto_37729 ?auto_37730 ?auto_37731 ?auto_37732 ?auto_37733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37738 - BLOCK
      ?auto_37739 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37739 ) ( CLEAR ?auto_37738 ) ( ON-TABLE ?auto_37738 ) ( not ( = ?auto_37738 ?auto_37739 ) ) )
    :subtasks
    ( ( !STACK ?auto_37739 ?auto_37738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37740 - BLOCK
      ?auto_37741 - BLOCK
    )
    :vars
    (
      ?auto_37742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37740 ) ( ON-TABLE ?auto_37740 ) ( not ( = ?auto_37740 ?auto_37741 ) ) ( ON ?auto_37741 ?auto_37742 ) ( CLEAR ?auto_37741 ) ( HAND-EMPTY ) ( not ( = ?auto_37740 ?auto_37742 ) ) ( not ( = ?auto_37741 ?auto_37742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37741 ?auto_37742 )
      ( MAKE-2PILE ?auto_37740 ?auto_37741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37743 - BLOCK
      ?auto_37744 - BLOCK
    )
    :vars
    (
      ?auto_37745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37743 ?auto_37744 ) ) ( ON ?auto_37744 ?auto_37745 ) ( CLEAR ?auto_37744 ) ( not ( = ?auto_37743 ?auto_37745 ) ) ( not ( = ?auto_37744 ?auto_37745 ) ) ( HOLDING ?auto_37743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37743 )
      ( MAKE-2PILE ?auto_37743 ?auto_37744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37746 - BLOCK
      ?auto_37747 - BLOCK
    )
    :vars
    (
      ?auto_37748 - BLOCK
      ?auto_37750 - BLOCK
      ?auto_37751 - BLOCK
      ?auto_37749 - BLOCK
      ?auto_37752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37746 ?auto_37747 ) ) ( ON ?auto_37747 ?auto_37748 ) ( not ( = ?auto_37746 ?auto_37748 ) ) ( not ( = ?auto_37747 ?auto_37748 ) ) ( ON ?auto_37746 ?auto_37747 ) ( CLEAR ?auto_37746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37750 ) ( ON ?auto_37751 ?auto_37750 ) ( ON ?auto_37749 ?auto_37751 ) ( ON ?auto_37752 ?auto_37749 ) ( ON ?auto_37748 ?auto_37752 ) ( not ( = ?auto_37750 ?auto_37751 ) ) ( not ( = ?auto_37750 ?auto_37749 ) ) ( not ( = ?auto_37750 ?auto_37752 ) ) ( not ( = ?auto_37750 ?auto_37748 ) ) ( not ( = ?auto_37750 ?auto_37747 ) ) ( not ( = ?auto_37750 ?auto_37746 ) ) ( not ( = ?auto_37751 ?auto_37749 ) ) ( not ( = ?auto_37751 ?auto_37752 ) ) ( not ( = ?auto_37751 ?auto_37748 ) ) ( not ( = ?auto_37751 ?auto_37747 ) ) ( not ( = ?auto_37751 ?auto_37746 ) ) ( not ( = ?auto_37749 ?auto_37752 ) ) ( not ( = ?auto_37749 ?auto_37748 ) ) ( not ( = ?auto_37749 ?auto_37747 ) ) ( not ( = ?auto_37749 ?auto_37746 ) ) ( not ( = ?auto_37752 ?auto_37748 ) ) ( not ( = ?auto_37752 ?auto_37747 ) ) ( not ( = ?auto_37752 ?auto_37746 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37750 ?auto_37751 ?auto_37749 ?auto_37752 ?auto_37748 ?auto_37747 )
      ( MAKE-2PILE ?auto_37746 ?auto_37747 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37757 - BLOCK
      ?auto_37758 - BLOCK
      ?auto_37759 - BLOCK
      ?auto_37760 - BLOCK
    )
    :vars
    (
      ?auto_37761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37761 ?auto_37760 ) ( CLEAR ?auto_37761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37757 ) ( ON ?auto_37758 ?auto_37757 ) ( ON ?auto_37759 ?auto_37758 ) ( ON ?auto_37760 ?auto_37759 ) ( not ( = ?auto_37757 ?auto_37758 ) ) ( not ( = ?auto_37757 ?auto_37759 ) ) ( not ( = ?auto_37757 ?auto_37760 ) ) ( not ( = ?auto_37757 ?auto_37761 ) ) ( not ( = ?auto_37758 ?auto_37759 ) ) ( not ( = ?auto_37758 ?auto_37760 ) ) ( not ( = ?auto_37758 ?auto_37761 ) ) ( not ( = ?auto_37759 ?auto_37760 ) ) ( not ( = ?auto_37759 ?auto_37761 ) ) ( not ( = ?auto_37760 ?auto_37761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37761 ?auto_37760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37762 - BLOCK
      ?auto_37763 - BLOCK
      ?auto_37764 - BLOCK
      ?auto_37765 - BLOCK
    )
    :vars
    (
      ?auto_37766 - BLOCK
      ?auto_37767 - BLOCK
      ?auto_37768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37766 ?auto_37765 ) ( CLEAR ?auto_37766 ) ( ON-TABLE ?auto_37762 ) ( ON ?auto_37763 ?auto_37762 ) ( ON ?auto_37764 ?auto_37763 ) ( ON ?auto_37765 ?auto_37764 ) ( not ( = ?auto_37762 ?auto_37763 ) ) ( not ( = ?auto_37762 ?auto_37764 ) ) ( not ( = ?auto_37762 ?auto_37765 ) ) ( not ( = ?auto_37762 ?auto_37766 ) ) ( not ( = ?auto_37763 ?auto_37764 ) ) ( not ( = ?auto_37763 ?auto_37765 ) ) ( not ( = ?auto_37763 ?auto_37766 ) ) ( not ( = ?auto_37764 ?auto_37765 ) ) ( not ( = ?auto_37764 ?auto_37766 ) ) ( not ( = ?auto_37765 ?auto_37766 ) ) ( HOLDING ?auto_37767 ) ( CLEAR ?auto_37768 ) ( not ( = ?auto_37762 ?auto_37767 ) ) ( not ( = ?auto_37762 ?auto_37768 ) ) ( not ( = ?auto_37763 ?auto_37767 ) ) ( not ( = ?auto_37763 ?auto_37768 ) ) ( not ( = ?auto_37764 ?auto_37767 ) ) ( not ( = ?auto_37764 ?auto_37768 ) ) ( not ( = ?auto_37765 ?auto_37767 ) ) ( not ( = ?auto_37765 ?auto_37768 ) ) ( not ( = ?auto_37766 ?auto_37767 ) ) ( not ( = ?auto_37766 ?auto_37768 ) ) ( not ( = ?auto_37767 ?auto_37768 ) ) )
    :subtasks
    ( ( !STACK ?auto_37767 ?auto_37768 )
      ( MAKE-4PILE ?auto_37762 ?auto_37763 ?auto_37764 ?auto_37765 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38368 - BLOCK
      ?auto_38369 - BLOCK
      ?auto_38370 - BLOCK
      ?auto_38371 - BLOCK
    )
    :vars
    (
      ?auto_38372 - BLOCK
      ?auto_38373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38372 ?auto_38371 ) ( ON-TABLE ?auto_38368 ) ( ON ?auto_38369 ?auto_38368 ) ( ON ?auto_38370 ?auto_38369 ) ( ON ?auto_38371 ?auto_38370 ) ( not ( = ?auto_38368 ?auto_38369 ) ) ( not ( = ?auto_38368 ?auto_38370 ) ) ( not ( = ?auto_38368 ?auto_38371 ) ) ( not ( = ?auto_38368 ?auto_38372 ) ) ( not ( = ?auto_38369 ?auto_38370 ) ) ( not ( = ?auto_38369 ?auto_38371 ) ) ( not ( = ?auto_38369 ?auto_38372 ) ) ( not ( = ?auto_38370 ?auto_38371 ) ) ( not ( = ?auto_38370 ?auto_38372 ) ) ( not ( = ?auto_38371 ?auto_38372 ) ) ( not ( = ?auto_38368 ?auto_38373 ) ) ( not ( = ?auto_38369 ?auto_38373 ) ) ( not ( = ?auto_38370 ?auto_38373 ) ) ( not ( = ?auto_38371 ?auto_38373 ) ) ( not ( = ?auto_38372 ?auto_38373 ) ) ( ON ?auto_38373 ?auto_38372 ) ( CLEAR ?auto_38373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38368 ?auto_38369 ?auto_38370 ?auto_38371 ?auto_38372 )
      ( MAKE-4PILE ?auto_38368 ?auto_38369 ?auto_38370 ?auto_38371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37776 - BLOCK
      ?auto_37777 - BLOCK
      ?auto_37778 - BLOCK
      ?auto_37779 - BLOCK
    )
    :vars
    (
      ?auto_37780 - BLOCK
      ?auto_37781 - BLOCK
      ?auto_37782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37780 ?auto_37779 ) ( ON-TABLE ?auto_37776 ) ( ON ?auto_37777 ?auto_37776 ) ( ON ?auto_37778 ?auto_37777 ) ( ON ?auto_37779 ?auto_37778 ) ( not ( = ?auto_37776 ?auto_37777 ) ) ( not ( = ?auto_37776 ?auto_37778 ) ) ( not ( = ?auto_37776 ?auto_37779 ) ) ( not ( = ?auto_37776 ?auto_37780 ) ) ( not ( = ?auto_37777 ?auto_37778 ) ) ( not ( = ?auto_37777 ?auto_37779 ) ) ( not ( = ?auto_37777 ?auto_37780 ) ) ( not ( = ?auto_37778 ?auto_37779 ) ) ( not ( = ?auto_37778 ?auto_37780 ) ) ( not ( = ?auto_37779 ?auto_37780 ) ) ( not ( = ?auto_37776 ?auto_37781 ) ) ( not ( = ?auto_37776 ?auto_37782 ) ) ( not ( = ?auto_37777 ?auto_37781 ) ) ( not ( = ?auto_37777 ?auto_37782 ) ) ( not ( = ?auto_37778 ?auto_37781 ) ) ( not ( = ?auto_37778 ?auto_37782 ) ) ( not ( = ?auto_37779 ?auto_37781 ) ) ( not ( = ?auto_37779 ?auto_37782 ) ) ( not ( = ?auto_37780 ?auto_37781 ) ) ( not ( = ?auto_37780 ?auto_37782 ) ) ( not ( = ?auto_37781 ?auto_37782 ) ) ( ON ?auto_37781 ?auto_37780 ) ( CLEAR ?auto_37781 ) ( HOLDING ?auto_37782 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37782 )
      ( MAKE-4PILE ?auto_37776 ?auto_37777 ?auto_37778 ?auto_37779 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37783 - BLOCK
      ?auto_37784 - BLOCK
      ?auto_37785 - BLOCK
      ?auto_37786 - BLOCK
    )
    :vars
    (
      ?auto_37788 - BLOCK
      ?auto_37789 - BLOCK
      ?auto_37787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37788 ?auto_37786 ) ( ON-TABLE ?auto_37783 ) ( ON ?auto_37784 ?auto_37783 ) ( ON ?auto_37785 ?auto_37784 ) ( ON ?auto_37786 ?auto_37785 ) ( not ( = ?auto_37783 ?auto_37784 ) ) ( not ( = ?auto_37783 ?auto_37785 ) ) ( not ( = ?auto_37783 ?auto_37786 ) ) ( not ( = ?auto_37783 ?auto_37788 ) ) ( not ( = ?auto_37784 ?auto_37785 ) ) ( not ( = ?auto_37784 ?auto_37786 ) ) ( not ( = ?auto_37784 ?auto_37788 ) ) ( not ( = ?auto_37785 ?auto_37786 ) ) ( not ( = ?auto_37785 ?auto_37788 ) ) ( not ( = ?auto_37786 ?auto_37788 ) ) ( not ( = ?auto_37783 ?auto_37789 ) ) ( not ( = ?auto_37783 ?auto_37787 ) ) ( not ( = ?auto_37784 ?auto_37789 ) ) ( not ( = ?auto_37784 ?auto_37787 ) ) ( not ( = ?auto_37785 ?auto_37789 ) ) ( not ( = ?auto_37785 ?auto_37787 ) ) ( not ( = ?auto_37786 ?auto_37789 ) ) ( not ( = ?auto_37786 ?auto_37787 ) ) ( not ( = ?auto_37788 ?auto_37789 ) ) ( not ( = ?auto_37788 ?auto_37787 ) ) ( not ( = ?auto_37789 ?auto_37787 ) ) ( ON ?auto_37789 ?auto_37788 ) ( ON ?auto_37787 ?auto_37789 ) ( CLEAR ?auto_37787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37783 ?auto_37784 ?auto_37785 ?auto_37786 ?auto_37788 ?auto_37789 )
      ( MAKE-4PILE ?auto_37783 ?auto_37784 ?auto_37785 ?auto_37786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37793 - BLOCK
      ?auto_37794 - BLOCK
      ?auto_37795 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37795 ) ( CLEAR ?auto_37794 ) ( ON-TABLE ?auto_37793 ) ( ON ?auto_37794 ?auto_37793 ) ( not ( = ?auto_37793 ?auto_37794 ) ) ( not ( = ?auto_37793 ?auto_37795 ) ) ( not ( = ?auto_37794 ?auto_37795 ) ) )
    :subtasks
    ( ( !STACK ?auto_37795 ?auto_37794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37796 - BLOCK
      ?auto_37797 - BLOCK
      ?auto_37798 - BLOCK
    )
    :vars
    (
      ?auto_37799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37797 ) ( ON-TABLE ?auto_37796 ) ( ON ?auto_37797 ?auto_37796 ) ( not ( = ?auto_37796 ?auto_37797 ) ) ( not ( = ?auto_37796 ?auto_37798 ) ) ( not ( = ?auto_37797 ?auto_37798 ) ) ( ON ?auto_37798 ?auto_37799 ) ( CLEAR ?auto_37798 ) ( HAND-EMPTY ) ( not ( = ?auto_37796 ?auto_37799 ) ) ( not ( = ?auto_37797 ?auto_37799 ) ) ( not ( = ?auto_37798 ?auto_37799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37798 ?auto_37799 )
      ( MAKE-3PILE ?auto_37796 ?auto_37797 ?auto_37798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37800 - BLOCK
      ?auto_37801 - BLOCK
      ?auto_37802 - BLOCK
    )
    :vars
    (
      ?auto_37803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37800 ) ( not ( = ?auto_37800 ?auto_37801 ) ) ( not ( = ?auto_37800 ?auto_37802 ) ) ( not ( = ?auto_37801 ?auto_37802 ) ) ( ON ?auto_37802 ?auto_37803 ) ( CLEAR ?auto_37802 ) ( not ( = ?auto_37800 ?auto_37803 ) ) ( not ( = ?auto_37801 ?auto_37803 ) ) ( not ( = ?auto_37802 ?auto_37803 ) ) ( HOLDING ?auto_37801 ) ( CLEAR ?auto_37800 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37800 ?auto_37801 )
      ( MAKE-3PILE ?auto_37800 ?auto_37801 ?auto_37802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37804 - BLOCK
      ?auto_37805 - BLOCK
      ?auto_37806 - BLOCK
    )
    :vars
    (
      ?auto_37807 - BLOCK
      ?auto_37809 - BLOCK
      ?auto_37810 - BLOCK
      ?auto_37808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37804 ) ( not ( = ?auto_37804 ?auto_37805 ) ) ( not ( = ?auto_37804 ?auto_37806 ) ) ( not ( = ?auto_37805 ?auto_37806 ) ) ( ON ?auto_37806 ?auto_37807 ) ( not ( = ?auto_37804 ?auto_37807 ) ) ( not ( = ?auto_37805 ?auto_37807 ) ) ( not ( = ?auto_37806 ?auto_37807 ) ) ( CLEAR ?auto_37804 ) ( ON ?auto_37805 ?auto_37806 ) ( CLEAR ?auto_37805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37809 ) ( ON ?auto_37810 ?auto_37809 ) ( ON ?auto_37808 ?auto_37810 ) ( ON ?auto_37807 ?auto_37808 ) ( not ( = ?auto_37809 ?auto_37810 ) ) ( not ( = ?auto_37809 ?auto_37808 ) ) ( not ( = ?auto_37809 ?auto_37807 ) ) ( not ( = ?auto_37809 ?auto_37806 ) ) ( not ( = ?auto_37809 ?auto_37805 ) ) ( not ( = ?auto_37810 ?auto_37808 ) ) ( not ( = ?auto_37810 ?auto_37807 ) ) ( not ( = ?auto_37810 ?auto_37806 ) ) ( not ( = ?auto_37810 ?auto_37805 ) ) ( not ( = ?auto_37808 ?auto_37807 ) ) ( not ( = ?auto_37808 ?auto_37806 ) ) ( not ( = ?auto_37808 ?auto_37805 ) ) ( not ( = ?auto_37804 ?auto_37809 ) ) ( not ( = ?auto_37804 ?auto_37810 ) ) ( not ( = ?auto_37804 ?auto_37808 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37809 ?auto_37810 ?auto_37808 ?auto_37807 ?auto_37806 )
      ( MAKE-3PILE ?auto_37804 ?auto_37805 ?auto_37806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37811 - BLOCK
      ?auto_37812 - BLOCK
      ?auto_37813 - BLOCK
    )
    :vars
    (
      ?auto_37814 - BLOCK
      ?auto_37817 - BLOCK
      ?auto_37815 - BLOCK
      ?auto_37816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37811 ?auto_37812 ) ) ( not ( = ?auto_37811 ?auto_37813 ) ) ( not ( = ?auto_37812 ?auto_37813 ) ) ( ON ?auto_37813 ?auto_37814 ) ( not ( = ?auto_37811 ?auto_37814 ) ) ( not ( = ?auto_37812 ?auto_37814 ) ) ( not ( = ?auto_37813 ?auto_37814 ) ) ( ON ?auto_37812 ?auto_37813 ) ( CLEAR ?auto_37812 ) ( ON-TABLE ?auto_37817 ) ( ON ?auto_37815 ?auto_37817 ) ( ON ?auto_37816 ?auto_37815 ) ( ON ?auto_37814 ?auto_37816 ) ( not ( = ?auto_37817 ?auto_37815 ) ) ( not ( = ?auto_37817 ?auto_37816 ) ) ( not ( = ?auto_37817 ?auto_37814 ) ) ( not ( = ?auto_37817 ?auto_37813 ) ) ( not ( = ?auto_37817 ?auto_37812 ) ) ( not ( = ?auto_37815 ?auto_37816 ) ) ( not ( = ?auto_37815 ?auto_37814 ) ) ( not ( = ?auto_37815 ?auto_37813 ) ) ( not ( = ?auto_37815 ?auto_37812 ) ) ( not ( = ?auto_37816 ?auto_37814 ) ) ( not ( = ?auto_37816 ?auto_37813 ) ) ( not ( = ?auto_37816 ?auto_37812 ) ) ( not ( = ?auto_37811 ?auto_37817 ) ) ( not ( = ?auto_37811 ?auto_37815 ) ) ( not ( = ?auto_37811 ?auto_37816 ) ) ( HOLDING ?auto_37811 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37811 )
      ( MAKE-3PILE ?auto_37811 ?auto_37812 ?auto_37813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37818 - BLOCK
      ?auto_37819 - BLOCK
      ?auto_37820 - BLOCK
    )
    :vars
    (
      ?auto_37822 - BLOCK
      ?auto_37823 - BLOCK
      ?auto_37821 - BLOCK
      ?auto_37824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37818 ?auto_37819 ) ) ( not ( = ?auto_37818 ?auto_37820 ) ) ( not ( = ?auto_37819 ?auto_37820 ) ) ( ON ?auto_37820 ?auto_37822 ) ( not ( = ?auto_37818 ?auto_37822 ) ) ( not ( = ?auto_37819 ?auto_37822 ) ) ( not ( = ?auto_37820 ?auto_37822 ) ) ( ON ?auto_37819 ?auto_37820 ) ( ON-TABLE ?auto_37823 ) ( ON ?auto_37821 ?auto_37823 ) ( ON ?auto_37824 ?auto_37821 ) ( ON ?auto_37822 ?auto_37824 ) ( not ( = ?auto_37823 ?auto_37821 ) ) ( not ( = ?auto_37823 ?auto_37824 ) ) ( not ( = ?auto_37823 ?auto_37822 ) ) ( not ( = ?auto_37823 ?auto_37820 ) ) ( not ( = ?auto_37823 ?auto_37819 ) ) ( not ( = ?auto_37821 ?auto_37824 ) ) ( not ( = ?auto_37821 ?auto_37822 ) ) ( not ( = ?auto_37821 ?auto_37820 ) ) ( not ( = ?auto_37821 ?auto_37819 ) ) ( not ( = ?auto_37824 ?auto_37822 ) ) ( not ( = ?auto_37824 ?auto_37820 ) ) ( not ( = ?auto_37824 ?auto_37819 ) ) ( not ( = ?auto_37818 ?auto_37823 ) ) ( not ( = ?auto_37818 ?auto_37821 ) ) ( not ( = ?auto_37818 ?auto_37824 ) ) ( ON ?auto_37818 ?auto_37819 ) ( CLEAR ?auto_37818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37823 ?auto_37821 ?auto_37824 ?auto_37822 ?auto_37820 ?auto_37819 )
      ( MAKE-3PILE ?auto_37818 ?auto_37819 ?auto_37820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37828 - BLOCK
      ?auto_37829 - BLOCK
      ?auto_37830 - BLOCK
    )
    :vars
    (
      ?auto_37831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37831 ?auto_37830 ) ( CLEAR ?auto_37831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37828 ) ( ON ?auto_37829 ?auto_37828 ) ( ON ?auto_37830 ?auto_37829 ) ( not ( = ?auto_37828 ?auto_37829 ) ) ( not ( = ?auto_37828 ?auto_37830 ) ) ( not ( = ?auto_37828 ?auto_37831 ) ) ( not ( = ?auto_37829 ?auto_37830 ) ) ( not ( = ?auto_37829 ?auto_37831 ) ) ( not ( = ?auto_37830 ?auto_37831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37831 ?auto_37830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37832 - BLOCK
      ?auto_37833 - BLOCK
      ?auto_37834 - BLOCK
    )
    :vars
    (
      ?auto_37835 - BLOCK
      ?auto_37836 - BLOCK
      ?auto_37837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37835 ?auto_37834 ) ( CLEAR ?auto_37835 ) ( ON-TABLE ?auto_37832 ) ( ON ?auto_37833 ?auto_37832 ) ( ON ?auto_37834 ?auto_37833 ) ( not ( = ?auto_37832 ?auto_37833 ) ) ( not ( = ?auto_37832 ?auto_37834 ) ) ( not ( = ?auto_37832 ?auto_37835 ) ) ( not ( = ?auto_37833 ?auto_37834 ) ) ( not ( = ?auto_37833 ?auto_37835 ) ) ( not ( = ?auto_37834 ?auto_37835 ) ) ( HOLDING ?auto_37836 ) ( CLEAR ?auto_37837 ) ( not ( = ?auto_37832 ?auto_37836 ) ) ( not ( = ?auto_37832 ?auto_37837 ) ) ( not ( = ?auto_37833 ?auto_37836 ) ) ( not ( = ?auto_37833 ?auto_37837 ) ) ( not ( = ?auto_37834 ?auto_37836 ) ) ( not ( = ?auto_37834 ?auto_37837 ) ) ( not ( = ?auto_37835 ?auto_37836 ) ) ( not ( = ?auto_37835 ?auto_37837 ) ) ( not ( = ?auto_37836 ?auto_37837 ) ) )
    :subtasks
    ( ( !STACK ?auto_37836 ?auto_37837 )
      ( MAKE-3PILE ?auto_37832 ?auto_37833 ?auto_37834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37838 - BLOCK
      ?auto_37839 - BLOCK
      ?auto_37840 - BLOCK
    )
    :vars
    (
      ?auto_37843 - BLOCK
      ?auto_37842 - BLOCK
      ?auto_37841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37843 ?auto_37840 ) ( ON-TABLE ?auto_37838 ) ( ON ?auto_37839 ?auto_37838 ) ( ON ?auto_37840 ?auto_37839 ) ( not ( = ?auto_37838 ?auto_37839 ) ) ( not ( = ?auto_37838 ?auto_37840 ) ) ( not ( = ?auto_37838 ?auto_37843 ) ) ( not ( = ?auto_37839 ?auto_37840 ) ) ( not ( = ?auto_37839 ?auto_37843 ) ) ( not ( = ?auto_37840 ?auto_37843 ) ) ( CLEAR ?auto_37842 ) ( not ( = ?auto_37838 ?auto_37841 ) ) ( not ( = ?auto_37838 ?auto_37842 ) ) ( not ( = ?auto_37839 ?auto_37841 ) ) ( not ( = ?auto_37839 ?auto_37842 ) ) ( not ( = ?auto_37840 ?auto_37841 ) ) ( not ( = ?auto_37840 ?auto_37842 ) ) ( not ( = ?auto_37843 ?auto_37841 ) ) ( not ( = ?auto_37843 ?auto_37842 ) ) ( not ( = ?auto_37841 ?auto_37842 ) ) ( ON ?auto_37841 ?auto_37843 ) ( CLEAR ?auto_37841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37838 ?auto_37839 ?auto_37840 ?auto_37843 )
      ( MAKE-3PILE ?auto_37838 ?auto_37839 ?auto_37840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37844 - BLOCK
      ?auto_37845 - BLOCK
      ?auto_37846 - BLOCK
    )
    :vars
    (
      ?auto_37848 - BLOCK
      ?auto_37849 - BLOCK
      ?auto_37847 - BLOCK
      ?auto_37850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37848 ?auto_37846 ) ( ON-TABLE ?auto_37844 ) ( ON ?auto_37845 ?auto_37844 ) ( ON ?auto_37846 ?auto_37845 ) ( not ( = ?auto_37844 ?auto_37845 ) ) ( not ( = ?auto_37844 ?auto_37846 ) ) ( not ( = ?auto_37844 ?auto_37848 ) ) ( not ( = ?auto_37845 ?auto_37846 ) ) ( not ( = ?auto_37845 ?auto_37848 ) ) ( not ( = ?auto_37846 ?auto_37848 ) ) ( not ( = ?auto_37844 ?auto_37849 ) ) ( not ( = ?auto_37844 ?auto_37847 ) ) ( not ( = ?auto_37845 ?auto_37849 ) ) ( not ( = ?auto_37845 ?auto_37847 ) ) ( not ( = ?auto_37846 ?auto_37849 ) ) ( not ( = ?auto_37846 ?auto_37847 ) ) ( not ( = ?auto_37848 ?auto_37849 ) ) ( not ( = ?auto_37848 ?auto_37847 ) ) ( not ( = ?auto_37849 ?auto_37847 ) ) ( ON ?auto_37849 ?auto_37848 ) ( CLEAR ?auto_37849 ) ( HOLDING ?auto_37847 ) ( CLEAR ?auto_37850 ) ( ON-TABLE ?auto_37850 ) ( not ( = ?auto_37850 ?auto_37847 ) ) ( not ( = ?auto_37844 ?auto_37850 ) ) ( not ( = ?auto_37845 ?auto_37850 ) ) ( not ( = ?auto_37846 ?auto_37850 ) ) ( not ( = ?auto_37848 ?auto_37850 ) ) ( not ( = ?auto_37849 ?auto_37850 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37850 ?auto_37847 )
      ( MAKE-3PILE ?auto_37844 ?auto_37845 ?auto_37846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38542 - BLOCK
      ?auto_38543 - BLOCK
      ?auto_38544 - BLOCK
    )
    :vars
    (
      ?auto_38547 - BLOCK
      ?auto_38545 - BLOCK
      ?auto_38546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38547 ?auto_38544 ) ( ON-TABLE ?auto_38542 ) ( ON ?auto_38543 ?auto_38542 ) ( ON ?auto_38544 ?auto_38543 ) ( not ( = ?auto_38542 ?auto_38543 ) ) ( not ( = ?auto_38542 ?auto_38544 ) ) ( not ( = ?auto_38542 ?auto_38547 ) ) ( not ( = ?auto_38543 ?auto_38544 ) ) ( not ( = ?auto_38543 ?auto_38547 ) ) ( not ( = ?auto_38544 ?auto_38547 ) ) ( not ( = ?auto_38542 ?auto_38545 ) ) ( not ( = ?auto_38542 ?auto_38546 ) ) ( not ( = ?auto_38543 ?auto_38545 ) ) ( not ( = ?auto_38543 ?auto_38546 ) ) ( not ( = ?auto_38544 ?auto_38545 ) ) ( not ( = ?auto_38544 ?auto_38546 ) ) ( not ( = ?auto_38547 ?auto_38545 ) ) ( not ( = ?auto_38547 ?auto_38546 ) ) ( not ( = ?auto_38545 ?auto_38546 ) ) ( ON ?auto_38545 ?auto_38547 ) ( ON ?auto_38546 ?auto_38545 ) ( CLEAR ?auto_38546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38542 ?auto_38543 ?auto_38544 ?auto_38547 ?auto_38545 )
      ( MAKE-3PILE ?auto_38542 ?auto_38543 ?auto_38544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37858 - BLOCK
      ?auto_37859 - BLOCK
      ?auto_37860 - BLOCK
    )
    :vars
    (
      ?auto_37862 - BLOCK
      ?auto_37861 - BLOCK
      ?auto_37863 - BLOCK
      ?auto_37864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37862 ?auto_37860 ) ( ON-TABLE ?auto_37858 ) ( ON ?auto_37859 ?auto_37858 ) ( ON ?auto_37860 ?auto_37859 ) ( not ( = ?auto_37858 ?auto_37859 ) ) ( not ( = ?auto_37858 ?auto_37860 ) ) ( not ( = ?auto_37858 ?auto_37862 ) ) ( not ( = ?auto_37859 ?auto_37860 ) ) ( not ( = ?auto_37859 ?auto_37862 ) ) ( not ( = ?auto_37860 ?auto_37862 ) ) ( not ( = ?auto_37858 ?auto_37861 ) ) ( not ( = ?auto_37858 ?auto_37863 ) ) ( not ( = ?auto_37859 ?auto_37861 ) ) ( not ( = ?auto_37859 ?auto_37863 ) ) ( not ( = ?auto_37860 ?auto_37861 ) ) ( not ( = ?auto_37860 ?auto_37863 ) ) ( not ( = ?auto_37862 ?auto_37861 ) ) ( not ( = ?auto_37862 ?auto_37863 ) ) ( not ( = ?auto_37861 ?auto_37863 ) ) ( ON ?auto_37861 ?auto_37862 ) ( not ( = ?auto_37864 ?auto_37863 ) ) ( not ( = ?auto_37858 ?auto_37864 ) ) ( not ( = ?auto_37859 ?auto_37864 ) ) ( not ( = ?auto_37860 ?auto_37864 ) ) ( not ( = ?auto_37862 ?auto_37864 ) ) ( not ( = ?auto_37861 ?auto_37864 ) ) ( ON ?auto_37863 ?auto_37861 ) ( CLEAR ?auto_37863 ) ( HOLDING ?auto_37864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37864 )
      ( MAKE-3PILE ?auto_37858 ?auto_37859 ?auto_37860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37865 - BLOCK
      ?auto_37866 - BLOCK
      ?auto_37867 - BLOCK
    )
    :vars
    (
      ?auto_37871 - BLOCK
      ?auto_37869 - BLOCK
      ?auto_37868 - BLOCK
      ?auto_37870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37871 ?auto_37867 ) ( ON-TABLE ?auto_37865 ) ( ON ?auto_37866 ?auto_37865 ) ( ON ?auto_37867 ?auto_37866 ) ( not ( = ?auto_37865 ?auto_37866 ) ) ( not ( = ?auto_37865 ?auto_37867 ) ) ( not ( = ?auto_37865 ?auto_37871 ) ) ( not ( = ?auto_37866 ?auto_37867 ) ) ( not ( = ?auto_37866 ?auto_37871 ) ) ( not ( = ?auto_37867 ?auto_37871 ) ) ( not ( = ?auto_37865 ?auto_37869 ) ) ( not ( = ?auto_37865 ?auto_37868 ) ) ( not ( = ?auto_37866 ?auto_37869 ) ) ( not ( = ?auto_37866 ?auto_37868 ) ) ( not ( = ?auto_37867 ?auto_37869 ) ) ( not ( = ?auto_37867 ?auto_37868 ) ) ( not ( = ?auto_37871 ?auto_37869 ) ) ( not ( = ?auto_37871 ?auto_37868 ) ) ( not ( = ?auto_37869 ?auto_37868 ) ) ( ON ?auto_37869 ?auto_37871 ) ( not ( = ?auto_37870 ?auto_37868 ) ) ( not ( = ?auto_37865 ?auto_37870 ) ) ( not ( = ?auto_37866 ?auto_37870 ) ) ( not ( = ?auto_37867 ?auto_37870 ) ) ( not ( = ?auto_37871 ?auto_37870 ) ) ( not ( = ?auto_37869 ?auto_37870 ) ) ( ON ?auto_37868 ?auto_37869 ) ( ON ?auto_37870 ?auto_37868 ) ( CLEAR ?auto_37870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37865 ?auto_37866 ?auto_37867 ?auto_37871 ?auto_37869 ?auto_37868 )
      ( MAKE-3PILE ?auto_37865 ?auto_37866 ?auto_37867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37876 - BLOCK
      ?auto_37877 - BLOCK
      ?auto_37878 - BLOCK
      ?auto_37879 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37879 ) ( CLEAR ?auto_37878 ) ( ON-TABLE ?auto_37876 ) ( ON ?auto_37877 ?auto_37876 ) ( ON ?auto_37878 ?auto_37877 ) ( not ( = ?auto_37876 ?auto_37877 ) ) ( not ( = ?auto_37876 ?auto_37878 ) ) ( not ( = ?auto_37876 ?auto_37879 ) ) ( not ( = ?auto_37877 ?auto_37878 ) ) ( not ( = ?auto_37877 ?auto_37879 ) ) ( not ( = ?auto_37878 ?auto_37879 ) ) )
    :subtasks
    ( ( !STACK ?auto_37879 ?auto_37878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37880 - BLOCK
      ?auto_37881 - BLOCK
      ?auto_37882 - BLOCK
      ?auto_37883 - BLOCK
    )
    :vars
    (
      ?auto_37884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37882 ) ( ON-TABLE ?auto_37880 ) ( ON ?auto_37881 ?auto_37880 ) ( ON ?auto_37882 ?auto_37881 ) ( not ( = ?auto_37880 ?auto_37881 ) ) ( not ( = ?auto_37880 ?auto_37882 ) ) ( not ( = ?auto_37880 ?auto_37883 ) ) ( not ( = ?auto_37881 ?auto_37882 ) ) ( not ( = ?auto_37881 ?auto_37883 ) ) ( not ( = ?auto_37882 ?auto_37883 ) ) ( ON ?auto_37883 ?auto_37884 ) ( CLEAR ?auto_37883 ) ( HAND-EMPTY ) ( not ( = ?auto_37880 ?auto_37884 ) ) ( not ( = ?auto_37881 ?auto_37884 ) ) ( not ( = ?auto_37882 ?auto_37884 ) ) ( not ( = ?auto_37883 ?auto_37884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37883 ?auto_37884 )
      ( MAKE-4PILE ?auto_37880 ?auto_37881 ?auto_37882 ?auto_37883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37885 - BLOCK
      ?auto_37886 - BLOCK
      ?auto_37887 - BLOCK
      ?auto_37888 - BLOCK
    )
    :vars
    (
      ?auto_37889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37885 ) ( ON ?auto_37886 ?auto_37885 ) ( not ( = ?auto_37885 ?auto_37886 ) ) ( not ( = ?auto_37885 ?auto_37887 ) ) ( not ( = ?auto_37885 ?auto_37888 ) ) ( not ( = ?auto_37886 ?auto_37887 ) ) ( not ( = ?auto_37886 ?auto_37888 ) ) ( not ( = ?auto_37887 ?auto_37888 ) ) ( ON ?auto_37888 ?auto_37889 ) ( CLEAR ?auto_37888 ) ( not ( = ?auto_37885 ?auto_37889 ) ) ( not ( = ?auto_37886 ?auto_37889 ) ) ( not ( = ?auto_37887 ?auto_37889 ) ) ( not ( = ?auto_37888 ?auto_37889 ) ) ( HOLDING ?auto_37887 ) ( CLEAR ?auto_37886 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37885 ?auto_37886 ?auto_37887 )
      ( MAKE-4PILE ?auto_37885 ?auto_37886 ?auto_37887 ?auto_37888 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37890 - BLOCK
      ?auto_37891 - BLOCK
      ?auto_37892 - BLOCK
      ?auto_37893 - BLOCK
    )
    :vars
    (
      ?auto_37894 - BLOCK
      ?auto_37895 - BLOCK
      ?auto_37896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37890 ) ( ON ?auto_37891 ?auto_37890 ) ( not ( = ?auto_37890 ?auto_37891 ) ) ( not ( = ?auto_37890 ?auto_37892 ) ) ( not ( = ?auto_37890 ?auto_37893 ) ) ( not ( = ?auto_37891 ?auto_37892 ) ) ( not ( = ?auto_37891 ?auto_37893 ) ) ( not ( = ?auto_37892 ?auto_37893 ) ) ( ON ?auto_37893 ?auto_37894 ) ( not ( = ?auto_37890 ?auto_37894 ) ) ( not ( = ?auto_37891 ?auto_37894 ) ) ( not ( = ?auto_37892 ?auto_37894 ) ) ( not ( = ?auto_37893 ?auto_37894 ) ) ( CLEAR ?auto_37891 ) ( ON ?auto_37892 ?auto_37893 ) ( CLEAR ?auto_37892 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37895 ) ( ON ?auto_37896 ?auto_37895 ) ( ON ?auto_37894 ?auto_37896 ) ( not ( = ?auto_37895 ?auto_37896 ) ) ( not ( = ?auto_37895 ?auto_37894 ) ) ( not ( = ?auto_37895 ?auto_37893 ) ) ( not ( = ?auto_37895 ?auto_37892 ) ) ( not ( = ?auto_37896 ?auto_37894 ) ) ( not ( = ?auto_37896 ?auto_37893 ) ) ( not ( = ?auto_37896 ?auto_37892 ) ) ( not ( = ?auto_37890 ?auto_37895 ) ) ( not ( = ?auto_37890 ?auto_37896 ) ) ( not ( = ?auto_37891 ?auto_37895 ) ) ( not ( = ?auto_37891 ?auto_37896 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37895 ?auto_37896 ?auto_37894 ?auto_37893 )
      ( MAKE-4PILE ?auto_37890 ?auto_37891 ?auto_37892 ?auto_37893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37897 - BLOCK
      ?auto_37898 - BLOCK
      ?auto_37899 - BLOCK
      ?auto_37900 - BLOCK
    )
    :vars
    (
      ?auto_37903 - BLOCK
      ?auto_37902 - BLOCK
      ?auto_37901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37897 ) ( not ( = ?auto_37897 ?auto_37898 ) ) ( not ( = ?auto_37897 ?auto_37899 ) ) ( not ( = ?auto_37897 ?auto_37900 ) ) ( not ( = ?auto_37898 ?auto_37899 ) ) ( not ( = ?auto_37898 ?auto_37900 ) ) ( not ( = ?auto_37899 ?auto_37900 ) ) ( ON ?auto_37900 ?auto_37903 ) ( not ( = ?auto_37897 ?auto_37903 ) ) ( not ( = ?auto_37898 ?auto_37903 ) ) ( not ( = ?auto_37899 ?auto_37903 ) ) ( not ( = ?auto_37900 ?auto_37903 ) ) ( ON ?auto_37899 ?auto_37900 ) ( CLEAR ?auto_37899 ) ( ON-TABLE ?auto_37902 ) ( ON ?auto_37901 ?auto_37902 ) ( ON ?auto_37903 ?auto_37901 ) ( not ( = ?auto_37902 ?auto_37901 ) ) ( not ( = ?auto_37902 ?auto_37903 ) ) ( not ( = ?auto_37902 ?auto_37900 ) ) ( not ( = ?auto_37902 ?auto_37899 ) ) ( not ( = ?auto_37901 ?auto_37903 ) ) ( not ( = ?auto_37901 ?auto_37900 ) ) ( not ( = ?auto_37901 ?auto_37899 ) ) ( not ( = ?auto_37897 ?auto_37902 ) ) ( not ( = ?auto_37897 ?auto_37901 ) ) ( not ( = ?auto_37898 ?auto_37902 ) ) ( not ( = ?auto_37898 ?auto_37901 ) ) ( HOLDING ?auto_37898 ) ( CLEAR ?auto_37897 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37897 ?auto_37898 )
      ( MAKE-4PILE ?auto_37897 ?auto_37898 ?auto_37899 ?auto_37900 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37904 - BLOCK
      ?auto_37905 - BLOCK
      ?auto_37906 - BLOCK
      ?auto_37907 - BLOCK
    )
    :vars
    (
      ?auto_37909 - BLOCK
      ?auto_37908 - BLOCK
      ?auto_37910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37904 ) ( not ( = ?auto_37904 ?auto_37905 ) ) ( not ( = ?auto_37904 ?auto_37906 ) ) ( not ( = ?auto_37904 ?auto_37907 ) ) ( not ( = ?auto_37905 ?auto_37906 ) ) ( not ( = ?auto_37905 ?auto_37907 ) ) ( not ( = ?auto_37906 ?auto_37907 ) ) ( ON ?auto_37907 ?auto_37909 ) ( not ( = ?auto_37904 ?auto_37909 ) ) ( not ( = ?auto_37905 ?auto_37909 ) ) ( not ( = ?auto_37906 ?auto_37909 ) ) ( not ( = ?auto_37907 ?auto_37909 ) ) ( ON ?auto_37906 ?auto_37907 ) ( ON-TABLE ?auto_37908 ) ( ON ?auto_37910 ?auto_37908 ) ( ON ?auto_37909 ?auto_37910 ) ( not ( = ?auto_37908 ?auto_37910 ) ) ( not ( = ?auto_37908 ?auto_37909 ) ) ( not ( = ?auto_37908 ?auto_37907 ) ) ( not ( = ?auto_37908 ?auto_37906 ) ) ( not ( = ?auto_37910 ?auto_37909 ) ) ( not ( = ?auto_37910 ?auto_37907 ) ) ( not ( = ?auto_37910 ?auto_37906 ) ) ( not ( = ?auto_37904 ?auto_37908 ) ) ( not ( = ?auto_37904 ?auto_37910 ) ) ( not ( = ?auto_37905 ?auto_37908 ) ) ( not ( = ?auto_37905 ?auto_37910 ) ) ( CLEAR ?auto_37904 ) ( ON ?auto_37905 ?auto_37906 ) ( CLEAR ?auto_37905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37908 ?auto_37910 ?auto_37909 ?auto_37907 ?auto_37906 )
      ( MAKE-4PILE ?auto_37904 ?auto_37905 ?auto_37906 ?auto_37907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37911 - BLOCK
      ?auto_37912 - BLOCK
      ?auto_37913 - BLOCK
      ?auto_37914 - BLOCK
    )
    :vars
    (
      ?auto_37915 - BLOCK
      ?auto_37916 - BLOCK
      ?auto_37917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37911 ?auto_37912 ) ) ( not ( = ?auto_37911 ?auto_37913 ) ) ( not ( = ?auto_37911 ?auto_37914 ) ) ( not ( = ?auto_37912 ?auto_37913 ) ) ( not ( = ?auto_37912 ?auto_37914 ) ) ( not ( = ?auto_37913 ?auto_37914 ) ) ( ON ?auto_37914 ?auto_37915 ) ( not ( = ?auto_37911 ?auto_37915 ) ) ( not ( = ?auto_37912 ?auto_37915 ) ) ( not ( = ?auto_37913 ?auto_37915 ) ) ( not ( = ?auto_37914 ?auto_37915 ) ) ( ON ?auto_37913 ?auto_37914 ) ( ON-TABLE ?auto_37916 ) ( ON ?auto_37917 ?auto_37916 ) ( ON ?auto_37915 ?auto_37917 ) ( not ( = ?auto_37916 ?auto_37917 ) ) ( not ( = ?auto_37916 ?auto_37915 ) ) ( not ( = ?auto_37916 ?auto_37914 ) ) ( not ( = ?auto_37916 ?auto_37913 ) ) ( not ( = ?auto_37917 ?auto_37915 ) ) ( not ( = ?auto_37917 ?auto_37914 ) ) ( not ( = ?auto_37917 ?auto_37913 ) ) ( not ( = ?auto_37911 ?auto_37916 ) ) ( not ( = ?auto_37911 ?auto_37917 ) ) ( not ( = ?auto_37912 ?auto_37916 ) ) ( not ( = ?auto_37912 ?auto_37917 ) ) ( ON ?auto_37912 ?auto_37913 ) ( CLEAR ?auto_37912 ) ( HOLDING ?auto_37911 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37911 )
      ( MAKE-4PILE ?auto_37911 ?auto_37912 ?auto_37913 ?auto_37914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37918 - BLOCK
      ?auto_37919 - BLOCK
      ?auto_37920 - BLOCK
      ?auto_37921 - BLOCK
    )
    :vars
    (
      ?auto_37924 - BLOCK
      ?auto_37923 - BLOCK
      ?auto_37922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37918 ?auto_37919 ) ) ( not ( = ?auto_37918 ?auto_37920 ) ) ( not ( = ?auto_37918 ?auto_37921 ) ) ( not ( = ?auto_37919 ?auto_37920 ) ) ( not ( = ?auto_37919 ?auto_37921 ) ) ( not ( = ?auto_37920 ?auto_37921 ) ) ( ON ?auto_37921 ?auto_37924 ) ( not ( = ?auto_37918 ?auto_37924 ) ) ( not ( = ?auto_37919 ?auto_37924 ) ) ( not ( = ?auto_37920 ?auto_37924 ) ) ( not ( = ?auto_37921 ?auto_37924 ) ) ( ON ?auto_37920 ?auto_37921 ) ( ON-TABLE ?auto_37923 ) ( ON ?auto_37922 ?auto_37923 ) ( ON ?auto_37924 ?auto_37922 ) ( not ( = ?auto_37923 ?auto_37922 ) ) ( not ( = ?auto_37923 ?auto_37924 ) ) ( not ( = ?auto_37923 ?auto_37921 ) ) ( not ( = ?auto_37923 ?auto_37920 ) ) ( not ( = ?auto_37922 ?auto_37924 ) ) ( not ( = ?auto_37922 ?auto_37921 ) ) ( not ( = ?auto_37922 ?auto_37920 ) ) ( not ( = ?auto_37918 ?auto_37923 ) ) ( not ( = ?auto_37918 ?auto_37922 ) ) ( not ( = ?auto_37919 ?auto_37923 ) ) ( not ( = ?auto_37919 ?auto_37922 ) ) ( ON ?auto_37919 ?auto_37920 ) ( ON ?auto_37918 ?auto_37919 ) ( CLEAR ?auto_37918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37923 ?auto_37922 ?auto_37924 ?auto_37921 ?auto_37920 ?auto_37919 )
      ( MAKE-4PILE ?auto_37918 ?auto_37919 ?auto_37920 ?auto_37921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37927 - BLOCK
      ?auto_37928 - BLOCK
    )
    :vars
    (
      ?auto_37929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37929 ?auto_37928 ) ( CLEAR ?auto_37929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37927 ) ( ON ?auto_37928 ?auto_37927 ) ( not ( = ?auto_37927 ?auto_37928 ) ) ( not ( = ?auto_37927 ?auto_37929 ) ) ( not ( = ?auto_37928 ?auto_37929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37929 ?auto_37928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37930 - BLOCK
      ?auto_37931 - BLOCK
    )
    :vars
    (
      ?auto_37932 - BLOCK
      ?auto_37933 - BLOCK
      ?auto_37934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37932 ?auto_37931 ) ( CLEAR ?auto_37932 ) ( ON-TABLE ?auto_37930 ) ( ON ?auto_37931 ?auto_37930 ) ( not ( = ?auto_37930 ?auto_37931 ) ) ( not ( = ?auto_37930 ?auto_37932 ) ) ( not ( = ?auto_37931 ?auto_37932 ) ) ( HOLDING ?auto_37933 ) ( CLEAR ?auto_37934 ) ( not ( = ?auto_37930 ?auto_37933 ) ) ( not ( = ?auto_37930 ?auto_37934 ) ) ( not ( = ?auto_37931 ?auto_37933 ) ) ( not ( = ?auto_37931 ?auto_37934 ) ) ( not ( = ?auto_37932 ?auto_37933 ) ) ( not ( = ?auto_37932 ?auto_37934 ) ) ( not ( = ?auto_37933 ?auto_37934 ) ) )
    :subtasks
    ( ( !STACK ?auto_37933 ?auto_37934 )
      ( MAKE-2PILE ?auto_37930 ?auto_37931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37935 - BLOCK
      ?auto_37936 - BLOCK
    )
    :vars
    (
      ?auto_37938 - BLOCK
      ?auto_37937 - BLOCK
      ?auto_37939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37938 ?auto_37936 ) ( ON-TABLE ?auto_37935 ) ( ON ?auto_37936 ?auto_37935 ) ( not ( = ?auto_37935 ?auto_37936 ) ) ( not ( = ?auto_37935 ?auto_37938 ) ) ( not ( = ?auto_37936 ?auto_37938 ) ) ( CLEAR ?auto_37937 ) ( not ( = ?auto_37935 ?auto_37939 ) ) ( not ( = ?auto_37935 ?auto_37937 ) ) ( not ( = ?auto_37936 ?auto_37939 ) ) ( not ( = ?auto_37936 ?auto_37937 ) ) ( not ( = ?auto_37938 ?auto_37939 ) ) ( not ( = ?auto_37938 ?auto_37937 ) ) ( not ( = ?auto_37939 ?auto_37937 ) ) ( ON ?auto_37939 ?auto_37938 ) ( CLEAR ?auto_37939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37935 ?auto_37936 ?auto_37938 )
      ( MAKE-2PILE ?auto_37935 ?auto_37936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37940 - BLOCK
      ?auto_37941 - BLOCK
    )
    :vars
    (
      ?auto_37943 - BLOCK
      ?auto_37944 - BLOCK
      ?auto_37942 - BLOCK
      ?auto_37946 - BLOCK
      ?auto_37945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37943 ?auto_37941 ) ( ON-TABLE ?auto_37940 ) ( ON ?auto_37941 ?auto_37940 ) ( not ( = ?auto_37940 ?auto_37941 ) ) ( not ( = ?auto_37940 ?auto_37943 ) ) ( not ( = ?auto_37941 ?auto_37943 ) ) ( not ( = ?auto_37940 ?auto_37944 ) ) ( not ( = ?auto_37940 ?auto_37942 ) ) ( not ( = ?auto_37941 ?auto_37944 ) ) ( not ( = ?auto_37941 ?auto_37942 ) ) ( not ( = ?auto_37943 ?auto_37944 ) ) ( not ( = ?auto_37943 ?auto_37942 ) ) ( not ( = ?auto_37944 ?auto_37942 ) ) ( ON ?auto_37944 ?auto_37943 ) ( CLEAR ?auto_37944 ) ( HOLDING ?auto_37942 ) ( CLEAR ?auto_37946 ) ( ON-TABLE ?auto_37945 ) ( ON ?auto_37946 ?auto_37945 ) ( not ( = ?auto_37945 ?auto_37946 ) ) ( not ( = ?auto_37945 ?auto_37942 ) ) ( not ( = ?auto_37946 ?auto_37942 ) ) ( not ( = ?auto_37940 ?auto_37946 ) ) ( not ( = ?auto_37940 ?auto_37945 ) ) ( not ( = ?auto_37941 ?auto_37946 ) ) ( not ( = ?auto_37941 ?auto_37945 ) ) ( not ( = ?auto_37943 ?auto_37946 ) ) ( not ( = ?auto_37943 ?auto_37945 ) ) ( not ( = ?auto_37944 ?auto_37946 ) ) ( not ( = ?auto_37944 ?auto_37945 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37945 ?auto_37946 ?auto_37942 )
      ( MAKE-2PILE ?auto_37940 ?auto_37941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37947 - BLOCK
      ?auto_37948 - BLOCK
    )
    :vars
    (
      ?auto_37953 - BLOCK
      ?auto_37952 - BLOCK
      ?auto_37950 - BLOCK
      ?auto_37951 - BLOCK
      ?auto_37949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37953 ?auto_37948 ) ( ON-TABLE ?auto_37947 ) ( ON ?auto_37948 ?auto_37947 ) ( not ( = ?auto_37947 ?auto_37948 ) ) ( not ( = ?auto_37947 ?auto_37953 ) ) ( not ( = ?auto_37948 ?auto_37953 ) ) ( not ( = ?auto_37947 ?auto_37952 ) ) ( not ( = ?auto_37947 ?auto_37950 ) ) ( not ( = ?auto_37948 ?auto_37952 ) ) ( not ( = ?auto_37948 ?auto_37950 ) ) ( not ( = ?auto_37953 ?auto_37952 ) ) ( not ( = ?auto_37953 ?auto_37950 ) ) ( not ( = ?auto_37952 ?auto_37950 ) ) ( ON ?auto_37952 ?auto_37953 ) ( CLEAR ?auto_37951 ) ( ON-TABLE ?auto_37949 ) ( ON ?auto_37951 ?auto_37949 ) ( not ( = ?auto_37949 ?auto_37951 ) ) ( not ( = ?auto_37949 ?auto_37950 ) ) ( not ( = ?auto_37951 ?auto_37950 ) ) ( not ( = ?auto_37947 ?auto_37951 ) ) ( not ( = ?auto_37947 ?auto_37949 ) ) ( not ( = ?auto_37948 ?auto_37951 ) ) ( not ( = ?auto_37948 ?auto_37949 ) ) ( not ( = ?auto_37953 ?auto_37951 ) ) ( not ( = ?auto_37953 ?auto_37949 ) ) ( not ( = ?auto_37952 ?auto_37951 ) ) ( not ( = ?auto_37952 ?auto_37949 ) ) ( ON ?auto_37950 ?auto_37952 ) ( CLEAR ?auto_37950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37947 ?auto_37948 ?auto_37953 ?auto_37952 )
      ( MAKE-2PILE ?auto_37947 ?auto_37948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37954 - BLOCK
      ?auto_37955 - BLOCK
    )
    :vars
    (
      ?auto_37958 - BLOCK
      ?auto_37960 - BLOCK
      ?auto_37959 - BLOCK
      ?auto_37956 - BLOCK
      ?auto_37957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37958 ?auto_37955 ) ( ON-TABLE ?auto_37954 ) ( ON ?auto_37955 ?auto_37954 ) ( not ( = ?auto_37954 ?auto_37955 ) ) ( not ( = ?auto_37954 ?auto_37958 ) ) ( not ( = ?auto_37955 ?auto_37958 ) ) ( not ( = ?auto_37954 ?auto_37960 ) ) ( not ( = ?auto_37954 ?auto_37959 ) ) ( not ( = ?auto_37955 ?auto_37960 ) ) ( not ( = ?auto_37955 ?auto_37959 ) ) ( not ( = ?auto_37958 ?auto_37960 ) ) ( not ( = ?auto_37958 ?auto_37959 ) ) ( not ( = ?auto_37960 ?auto_37959 ) ) ( ON ?auto_37960 ?auto_37958 ) ( ON-TABLE ?auto_37956 ) ( not ( = ?auto_37956 ?auto_37957 ) ) ( not ( = ?auto_37956 ?auto_37959 ) ) ( not ( = ?auto_37957 ?auto_37959 ) ) ( not ( = ?auto_37954 ?auto_37957 ) ) ( not ( = ?auto_37954 ?auto_37956 ) ) ( not ( = ?auto_37955 ?auto_37957 ) ) ( not ( = ?auto_37955 ?auto_37956 ) ) ( not ( = ?auto_37958 ?auto_37957 ) ) ( not ( = ?auto_37958 ?auto_37956 ) ) ( not ( = ?auto_37960 ?auto_37957 ) ) ( not ( = ?auto_37960 ?auto_37956 ) ) ( ON ?auto_37959 ?auto_37960 ) ( CLEAR ?auto_37959 ) ( HOLDING ?auto_37957 ) ( CLEAR ?auto_37956 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37956 ?auto_37957 )
      ( MAKE-2PILE ?auto_37954 ?auto_37955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38732 - BLOCK
      ?auto_38733 - BLOCK
    )
    :vars
    (
      ?auto_38736 - BLOCK
      ?auto_38735 - BLOCK
      ?auto_38734 - BLOCK
      ?auto_38737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38736 ?auto_38733 ) ( ON-TABLE ?auto_38732 ) ( ON ?auto_38733 ?auto_38732 ) ( not ( = ?auto_38732 ?auto_38733 ) ) ( not ( = ?auto_38732 ?auto_38736 ) ) ( not ( = ?auto_38733 ?auto_38736 ) ) ( not ( = ?auto_38732 ?auto_38735 ) ) ( not ( = ?auto_38732 ?auto_38734 ) ) ( not ( = ?auto_38733 ?auto_38735 ) ) ( not ( = ?auto_38733 ?auto_38734 ) ) ( not ( = ?auto_38736 ?auto_38735 ) ) ( not ( = ?auto_38736 ?auto_38734 ) ) ( not ( = ?auto_38735 ?auto_38734 ) ) ( ON ?auto_38735 ?auto_38736 ) ( not ( = ?auto_38737 ?auto_38734 ) ) ( not ( = ?auto_38732 ?auto_38737 ) ) ( not ( = ?auto_38733 ?auto_38737 ) ) ( not ( = ?auto_38736 ?auto_38737 ) ) ( not ( = ?auto_38735 ?auto_38737 ) ) ( ON ?auto_38734 ?auto_38735 ) ( ON ?auto_38737 ?auto_38734 ) ( CLEAR ?auto_38737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38732 ?auto_38733 ?auto_38736 ?auto_38735 ?auto_38734 )
      ( MAKE-2PILE ?auto_38732 ?auto_38733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37968 - BLOCK
      ?auto_37969 - BLOCK
    )
    :vars
    (
      ?auto_37973 - BLOCK
      ?auto_37970 - BLOCK
      ?auto_37974 - BLOCK
      ?auto_37972 - BLOCK
      ?auto_37971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37973 ?auto_37969 ) ( ON-TABLE ?auto_37968 ) ( ON ?auto_37969 ?auto_37968 ) ( not ( = ?auto_37968 ?auto_37969 ) ) ( not ( = ?auto_37968 ?auto_37973 ) ) ( not ( = ?auto_37969 ?auto_37973 ) ) ( not ( = ?auto_37968 ?auto_37970 ) ) ( not ( = ?auto_37968 ?auto_37974 ) ) ( not ( = ?auto_37969 ?auto_37970 ) ) ( not ( = ?auto_37969 ?auto_37974 ) ) ( not ( = ?auto_37973 ?auto_37970 ) ) ( not ( = ?auto_37973 ?auto_37974 ) ) ( not ( = ?auto_37970 ?auto_37974 ) ) ( ON ?auto_37970 ?auto_37973 ) ( not ( = ?auto_37972 ?auto_37971 ) ) ( not ( = ?auto_37972 ?auto_37974 ) ) ( not ( = ?auto_37971 ?auto_37974 ) ) ( not ( = ?auto_37968 ?auto_37971 ) ) ( not ( = ?auto_37968 ?auto_37972 ) ) ( not ( = ?auto_37969 ?auto_37971 ) ) ( not ( = ?auto_37969 ?auto_37972 ) ) ( not ( = ?auto_37973 ?auto_37971 ) ) ( not ( = ?auto_37973 ?auto_37972 ) ) ( not ( = ?auto_37970 ?auto_37971 ) ) ( not ( = ?auto_37970 ?auto_37972 ) ) ( ON ?auto_37974 ?auto_37970 ) ( ON ?auto_37971 ?auto_37974 ) ( CLEAR ?auto_37971 ) ( HOLDING ?auto_37972 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37972 )
      ( MAKE-2PILE ?auto_37968 ?auto_37969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37975 - BLOCK
      ?auto_37976 - BLOCK
    )
    :vars
    (
      ?auto_37981 - BLOCK
      ?auto_37977 - BLOCK
      ?auto_37978 - BLOCK
      ?auto_37980 - BLOCK
      ?auto_37979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37981 ?auto_37976 ) ( ON-TABLE ?auto_37975 ) ( ON ?auto_37976 ?auto_37975 ) ( not ( = ?auto_37975 ?auto_37976 ) ) ( not ( = ?auto_37975 ?auto_37981 ) ) ( not ( = ?auto_37976 ?auto_37981 ) ) ( not ( = ?auto_37975 ?auto_37977 ) ) ( not ( = ?auto_37975 ?auto_37978 ) ) ( not ( = ?auto_37976 ?auto_37977 ) ) ( not ( = ?auto_37976 ?auto_37978 ) ) ( not ( = ?auto_37981 ?auto_37977 ) ) ( not ( = ?auto_37981 ?auto_37978 ) ) ( not ( = ?auto_37977 ?auto_37978 ) ) ( ON ?auto_37977 ?auto_37981 ) ( not ( = ?auto_37980 ?auto_37979 ) ) ( not ( = ?auto_37980 ?auto_37978 ) ) ( not ( = ?auto_37979 ?auto_37978 ) ) ( not ( = ?auto_37975 ?auto_37979 ) ) ( not ( = ?auto_37975 ?auto_37980 ) ) ( not ( = ?auto_37976 ?auto_37979 ) ) ( not ( = ?auto_37976 ?auto_37980 ) ) ( not ( = ?auto_37981 ?auto_37979 ) ) ( not ( = ?auto_37981 ?auto_37980 ) ) ( not ( = ?auto_37977 ?auto_37979 ) ) ( not ( = ?auto_37977 ?auto_37980 ) ) ( ON ?auto_37978 ?auto_37977 ) ( ON ?auto_37979 ?auto_37978 ) ( ON ?auto_37980 ?auto_37979 ) ( CLEAR ?auto_37980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37975 ?auto_37976 ?auto_37981 ?auto_37977 ?auto_37978 ?auto_37979 )
      ( MAKE-2PILE ?auto_37975 ?auto_37976 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37987 - BLOCK
      ?auto_37988 - BLOCK
      ?auto_37989 - BLOCK
      ?auto_37990 - BLOCK
      ?auto_37991 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_37991 ) ( CLEAR ?auto_37990 ) ( ON-TABLE ?auto_37987 ) ( ON ?auto_37988 ?auto_37987 ) ( ON ?auto_37989 ?auto_37988 ) ( ON ?auto_37990 ?auto_37989 ) ( not ( = ?auto_37987 ?auto_37988 ) ) ( not ( = ?auto_37987 ?auto_37989 ) ) ( not ( = ?auto_37987 ?auto_37990 ) ) ( not ( = ?auto_37987 ?auto_37991 ) ) ( not ( = ?auto_37988 ?auto_37989 ) ) ( not ( = ?auto_37988 ?auto_37990 ) ) ( not ( = ?auto_37988 ?auto_37991 ) ) ( not ( = ?auto_37989 ?auto_37990 ) ) ( not ( = ?auto_37989 ?auto_37991 ) ) ( not ( = ?auto_37990 ?auto_37991 ) ) )
    :subtasks
    ( ( !STACK ?auto_37991 ?auto_37990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37992 - BLOCK
      ?auto_37993 - BLOCK
      ?auto_37994 - BLOCK
      ?auto_37995 - BLOCK
      ?auto_37996 - BLOCK
    )
    :vars
    (
      ?auto_37997 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37995 ) ( ON-TABLE ?auto_37992 ) ( ON ?auto_37993 ?auto_37992 ) ( ON ?auto_37994 ?auto_37993 ) ( ON ?auto_37995 ?auto_37994 ) ( not ( = ?auto_37992 ?auto_37993 ) ) ( not ( = ?auto_37992 ?auto_37994 ) ) ( not ( = ?auto_37992 ?auto_37995 ) ) ( not ( = ?auto_37992 ?auto_37996 ) ) ( not ( = ?auto_37993 ?auto_37994 ) ) ( not ( = ?auto_37993 ?auto_37995 ) ) ( not ( = ?auto_37993 ?auto_37996 ) ) ( not ( = ?auto_37994 ?auto_37995 ) ) ( not ( = ?auto_37994 ?auto_37996 ) ) ( not ( = ?auto_37995 ?auto_37996 ) ) ( ON ?auto_37996 ?auto_37997 ) ( CLEAR ?auto_37996 ) ( HAND-EMPTY ) ( not ( = ?auto_37992 ?auto_37997 ) ) ( not ( = ?auto_37993 ?auto_37997 ) ) ( not ( = ?auto_37994 ?auto_37997 ) ) ( not ( = ?auto_37995 ?auto_37997 ) ) ( not ( = ?auto_37996 ?auto_37997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37996 ?auto_37997 )
      ( MAKE-5PILE ?auto_37992 ?auto_37993 ?auto_37994 ?auto_37995 ?auto_37996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37998 - BLOCK
      ?auto_37999 - BLOCK
      ?auto_38000 - BLOCK
      ?auto_38001 - BLOCK
      ?auto_38002 - BLOCK
    )
    :vars
    (
      ?auto_38003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37998 ) ( ON ?auto_37999 ?auto_37998 ) ( ON ?auto_38000 ?auto_37999 ) ( not ( = ?auto_37998 ?auto_37999 ) ) ( not ( = ?auto_37998 ?auto_38000 ) ) ( not ( = ?auto_37998 ?auto_38001 ) ) ( not ( = ?auto_37998 ?auto_38002 ) ) ( not ( = ?auto_37999 ?auto_38000 ) ) ( not ( = ?auto_37999 ?auto_38001 ) ) ( not ( = ?auto_37999 ?auto_38002 ) ) ( not ( = ?auto_38000 ?auto_38001 ) ) ( not ( = ?auto_38000 ?auto_38002 ) ) ( not ( = ?auto_38001 ?auto_38002 ) ) ( ON ?auto_38002 ?auto_38003 ) ( CLEAR ?auto_38002 ) ( not ( = ?auto_37998 ?auto_38003 ) ) ( not ( = ?auto_37999 ?auto_38003 ) ) ( not ( = ?auto_38000 ?auto_38003 ) ) ( not ( = ?auto_38001 ?auto_38003 ) ) ( not ( = ?auto_38002 ?auto_38003 ) ) ( HOLDING ?auto_38001 ) ( CLEAR ?auto_38000 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37998 ?auto_37999 ?auto_38000 ?auto_38001 )
      ( MAKE-5PILE ?auto_37998 ?auto_37999 ?auto_38000 ?auto_38001 ?auto_38002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38004 - BLOCK
      ?auto_38005 - BLOCK
      ?auto_38006 - BLOCK
      ?auto_38007 - BLOCK
      ?auto_38008 - BLOCK
    )
    :vars
    (
      ?auto_38009 - BLOCK
      ?auto_38010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38004 ) ( ON ?auto_38005 ?auto_38004 ) ( ON ?auto_38006 ?auto_38005 ) ( not ( = ?auto_38004 ?auto_38005 ) ) ( not ( = ?auto_38004 ?auto_38006 ) ) ( not ( = ?auto_38004 ?auto_38007 ) ) ( not ( = ?auto_38004 ?auto_38008 ) ) ( not ( = ?auto_38005 ?auto_38006 ) ) ( not ( = ?auto_38005 ?auto_38007 ) ) ( not ( = ?auto_38005 ?auto_38008 ) ) ( not ( = ?auto_38006 ?auto_38007 ) ) ( not ( = ?auto_38006 ?auto_38008 ) ) ( not ( = ?auto_38007 ?auto_38008 ) ) ( ON ?auto_38008 ?auto_38009 ) ( not ( = ?auto_38004 ?auto_38009 ) ) ( not ( = ?auto_38005 ?auto_38009 ) ) ( not ( = ?auto_38006 ?auto_38009 ) ) ( not ( = ?auto_38007 ?auto_38009 ) ) ( not ( = ?auto_38008 ?auto_38009 ) ) ( CLEAR ?auto_38006 ) ( ON ?auto_38007 ?auto_38008 ) ( CLEAR ?auto_38007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38010 ) ( ON ?auto_38009 ?auto_38010 ) ( not ( = ?auto_38010 ?auto_38009 ) ) ( not ( = ?auto_38010 ?auto_38008 ) ) ( not ( = ?auto_38010 ?auto_38007 ) ) ( not ( = ?auto_38004 ?auto_38010 ) ) ( not ( = ?auto_38005 ?auto_38010 ) ) ( not ( = ?auto_38006 ?auto_38010 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38010 ?auto_38009 ?auto_38008 )
      ( MAKE-5PILE ?auto_38004 ?auto_38005 ?auto_38006 ?auto_38007 ?auto_38008 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38011 - BLOCK
      ?auto_38012 - BLOCK
      ?auto_38013 - BLOCK
      ?auto_38014 - BLOCK
      ?auto_38015 - BLOCK
    )
    :vars
    (
      ?auto_38017 - BLOCK
      ?auto_38016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38011 ) ( ON ?auto_38012 ?auto_38011 ) ( not ( = ?auto_38011 ?auto_38012 ) ) ( not ( = ?auto_38011 ?auto_38013 ) ) ( not ( = ?auto_38011 ?auto_38014 ) ) ( not ( = ?auto_38011 ?auto_38015 ) ) ( not ( = ?auto_38012 ?auto_38013 ) ) ( not ( = ?auto_38012 ?auto_38014 ) ) ( not ( = ?auto_38012 ?auto_38015 ) ) ( not ( = ?auto_38013 ?auto_38014 ) ) ( not ( = ?auto_38013 ?auto_38015 ) ) ( not ( = ?auto_38014 ?auto_38015 ) ) ( ON ?auto_38015 ?auto_38017 ) ( not ( = ?auto_38011 ?auto_38017 ) ) ( not ( = ?auto_38012 ?auto_38017 ) ) ( not ( = ?auto_38013 ?auto_38017 ) ) ( not ( = ?auto_38014 ?auto_38017 ) ) ( not ( = ?auto_38015 ?auto_38017 ) ) ( ON ?auto_38014 ?auto_38015 ) ( CLEAR ?auto_38014 ) ( ON-TABLE ?auto_38016 ) ( ON ?auto_38017 ?auto_38016 ) ( not ( = ?auto_38016 ?auto_38017 ) ) ( not ( = ?auto_38016 ?auto_38015 ) ) ( not ( = ?auto_38016 ?auto_38014 ) ) ( not ( = ?auto_38011 ?auto_38016 ) ) ( not ( = ?auto_38012 ?auto_38016 ) ) ( not ( = ?auto_38013 ?auto_38016 ) ) ( HOLDING ?auto_38013 ) ( CLEAR ?auto_38012 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38011 ?auto_38012 ?auto_38013 )
      ( MAKE-5PILE ?auto_38011 ?auto_38012 ?auto_38013 ?auto_38014 ?auto_38015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38018 - BLOCK
      ?auto_38019 - BLOCK
      ?auto_38020 - BLOCK
      ?auto_38021 - BLOCK
      ?auto_38022 - BLOCK
    )
    :vars
    (
      ?auto_38023 - BLOCK
      ?auto_38024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38018 ) ( ON ?auto_38019 ?auto_38018 ) ( not ( = ?auto_38018 ?auto_38019 ) ) ( not ( = ?auto_38018 ?auto_38020 ) ) ( not ( = ?auto_38018 ?auto_38021 ) ) ( not ( = ?auto_38018 ?auto_38022 ) ) ( not ( = ?auto_38019 ?auto_38020 ) ) ( not ( = ?auto_38019 ?auto_38021 ) ) ( not ( = ?auto_38019 ?auto_38022 ) ) ( not ( = ?auto_38020 ?auto_38021 ) ) ( not ( = ?auto_38020 ?auto_38022 ) ) ( not ( = ?auto_38021 ?auto_38022 ) ) ( ON ?auto_38022 ?auto_38023 ) ( not ( = ?auto_38018 ?auto_38023 ) ) ( not ( = ?auto_38019 ?auto_38023 ) ) ( not ( = ?auto_38020 ?auto_38023 ) ) ( not ( = ?auto_38021 ?auto_38023 ) ) ( not ( = ?auto_38022 ?auto_38023 ) ) ( ON ?auto_38021 ?auto_38022 ) ( ON-TABLE ?auto_38024 ) ( ON ?auto_38023 ?auto_38024 ) ( not ( = ?auto_38024 ?auto_38023 ) ) ( not ( = ?auto_38024 ?auto_38022 ) ) ( not ( = ?auto_38024 ?auto_38021 ) ) ( not ( = ?auto_38018 ?auto_38024 ) ) ( not ( = ?auto_38019 ?auto_38024 ) ) ( not ( = ?auto_38020 ?auto_38024 ) ) ( CLEAR ?auto_38019 ) ( ON ?auto_38020 ?auto_38021 ) ( CLEAR ?auto_38020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38024 ?auto_38023 ?auto_38022 ?auto_38021 )
      ( MAKE-5PILE ?auto_38018 ?auto_38019 ?auto_38020 ?auto_38021 ?auto_38022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38025 - BLOCK
      ?auto_38026 - BLOCK
      ?auto_38027 - BLOCK
      ?auto_38028 - BLOCK
      ?auto_38029 - BLOCK
    )
    :vars
    (
      ?auto_38030 - BLOCK
      ?auto_38031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38025 ) ( not ( = ?auto_38025 ?auto_38026 ) ) ( not ( = ?auto_38025 ?auto_38027 ) ) ( not ( = ?auto_38025 ?auto_38028 ) ) ( not ( = ?auto_38025 ?auto_38029 ) ) ( not ( = ?auto_38026 ?auto_38027 ) ) ( not ( = ?auto_38026 ?auto_38028 ) ) ( not ( = ?auto_38026 ?auto_38029 ) ) ( not ( = ?auto_38027 ?auto_38028 ) ) ( not ( = ?auto_38027 ?auto_38029 ) ) ( not ( = ?auto_38028 ?auto_38029 ) ) ( ON ?auto_38029 ?auto_38030 ) ( not ( = ?auto_38025 ?auto_38030 ) ) ( not ( = ?auto_38026 ?auto_38030 ) ) ( not ( = ?auto_38027 ?auto_38030 ) ) ( not ( = ?auto_38028 ?auto_38030 ) ) ( not ( = ?auto_38029 ?auto_38030 ) ) ( ON ?auto_38028 ?auto_38029 ) ( ON-TABLE ?auto_38031 ) ( ON ?auto_38030 ?auto_38031 ) ( not ( = ?auto_38031 ?auto_38030 ) ) ( not ( = ?auto_38031 ?auto_38029 ) ) ( not ( = ?auto_38031 ?auto_38028 ) ) ( not ( = ?auto_38025 ?auto_38031 ) ) ( not ( = ?auto_38026 ?auto_38031 ) ) ( not ( = ?auto_38027 ?auto_38031 ) ) ( ON ?auto_38027 ?auto_38028 ) ( CLEAR ?auto_38027 ) ( HOLDING ?auto_38026 ) ( CLEAR ?auto_38025 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38025 ?auto_38026 )
      ( MAKE-5PILE ?auto_38025 ?auto_38026 ?auto_38027 ?auto_38028 ?auto_38029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38032 - BLOCK
      ?auto_38033 - BLOCK
      ?auto_38034 - BLOCK
      ?auto_38035 - BLOCK
      ?auto_38036 - BLOCK
    )
    :vars
    (
      ?auto_38038 - BLOCK
      ?auto_38037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38032 ) ( not ( = ?auto_38032 ?auto_38033 ) ) ( not ( = ?auto_38032 ?auto_38034 ) ) ( not ( = ?auto_38032 ?auto_38035 ) ) ( not ( = ?auto_38032 ?auto_38036 ) ) ( not ( = ?auto_38033 ?auto_38034 ) ) ( not ( = ?auto_38033 ?auto_38035 ) ) ( not ( = ?auto_38033 ?auto_38036 ) ) ( not ( = ?auto_38034 ?auto_38035 ) ) ( not ( = ?auto_38034 ?auto_38036 ) ) ( not ( = ?auto_38035 ?auto_38036 ) ) ( ON ?auto_38036 ?auto_38038 ) ( not ( = ?auto_38032 ?auto_38038 ) ) ( not ( = ?auto_38033 ?auto_38038 ) ) ( not ( = ?auto_38034 ?auto_38038 ) ) ( not ( = ?auto_38035 ?auto_38038 ) ) ( not ( = ?auto_38036 ?auto_38038 ) ) ( ON ?auto_38035 ?auto_38036 ) ( ON-TABLE ?auto_38037 ) ( ON ?auto_38038 ?auto_38037 ) ( not ( = ?auto_38037 ?auto_38038 ) ) ( not ( = ?auto_38037 ?auto_38036 ) ) ( not ( = ?auto_38037 ?auto_38035 ) ) ( not ( = ?auto_38032 ?auto_38037 ) ) ( not ( = ?auto_38033 ?auto_38037 ) ) ( not ( = ?auto_38034 ?auto_38037 ) ) ( ON ?auto_38034 ?auto_38035 ) ( CLEAR ?auto_38032 ) ( ON ?auto_38033 ?auto_38034 ) ( CLEAR ?auto_38033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38037 ?auto_38038 ?auto_38036 ?auto_38035 ?auto_38034 )
      ( MAKE-5PILE ?auto_38032 ?auto_38033 ?auto_38034 ?auto_38035 ?auto_38036 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38039 - BLOCK
      ?auto_38040 - BLOCK
      ?auto_38041 - BLOCK
      ?auto_38042 - BLOCK
      ?auto_38043 - BLOCK
    )
    :vars
    (
      ?auto_38044 - BLOCK
      ?auto_38045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38039 ?auto_38040 ) ) ( not ( = ?auto_38039 ?auto_38041 ) ) ( not ( = ?auto_38039 ?auto_38042 ) ) ( not ( = ?auto_38039 ?auto_38043 ) ) ( not ( = ?auto_38040 ?auto_38041 ) ) ( not ( = ?auto_38040 ?auto_38042 ) ) ( not ( = ?auto_38040 ?auto_38043 ) ) ( not ( = ?auto_38041 ?auto_38042 ) ) ( not ( = ?auto_38041 ?auto_38043 ) ) ( not ( = ?auto_38042 ?auto_38043 ) ) ( ON ?auto_38043 ?auto_38044 ) ( not ( = ?auto_38039 ?auto_38044 ) ) ( not ( = ?auto_38040 ?auto_38044 ) ) ( not ( = ?auto_38041 ?auto_38044 ) ) ( not ( = ?auto_38042 ?auto_38044 ) ) ( not ( = ?auto_38043 ?auto_38044 ) ) ( ON ?auto_38042 ?auto_38043 ) ( ON-TABLE ?auto_38045 ) ( ON ?auto_38044 ?auto_38045 ) ( not ( = ?auto_38045 ?auto_38044 ) ) ( not ( = ?auto_38045 ?auto_38043 ) ) ( not ( = ?auto_38045 ?auto_38042 ) ) ( not ( = ?auto_38039 ?auto_38045 ) ) ( not ( = ?auto_38040 ?auto_38045 ) ) ( not ( = ?auto_38041 ?auto_38045 ) ) ( ON ?auto_38041 ?auto_38042 ) ( ON ?auto_38040 ?auto_38041 ) ( CLEAR ?auto_38040 ) ( HOLDING ?auto_38039 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38039 )
      ( MAKE-5PILE ?auto_38039 ?auto_38040 ?auto_38041 ?auto_38042 ?auto_38043 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38046 - BLOCK
      ?auto_38047 - BLOCK
      ?auto_38048 - BLOCK
      ?auto_38049 - BLOCK
      ?auto_38050 - BLOCK
    )
    :vars
    (
      ?auto_38051 - BLOCK
      ?auto_38052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38046 ?auto_38047 ) ) ( not ( = ?auto_38046 ?auto_38048 ) ) ( not ( = ?auto_38046 ?auto_38049 ) ) ( not ( = ?auto_38046 ?auto_38050 ) ) ( not ( = ?auto_38047 ?auto_38048 ) ) ( not ( = ?auto_38047 ?auto_38049 ) ) ( not ( = ?auto_38047 ?auto_38050 ) ) ( not ( = ?auto_38048 ?auto_38049 ) ) ( not ( = ?auto_38048 ?auto_38050 ) ) ( not ( = ?auto_38049 ?auto_38050 ) ) ( ON ?auto_38050 ?auto_38051 ) ( not ( = ?auto_38046 ?auto_38051 ) ) ( not ( = ?auto_38047 ?auto_38051 ) ) ( not ( = ?auto_38048 ?auto_38051 ) ) ( not ( = ?auto_38049 ?auto_38051 ) ) ( not ( = ?auto_38050 ?auto_38051 ) ) ( ON ?auto_38049 ?auto_38050 ) ( ON-TABLE ?auto_38052 ) ( ON ?auto_38051 ?auto_38052 ) ( not ( = ?auto_38052 ?auto_38051 ) ) ( not ( = ?auto_38052 ?auto_38050 ) ) ( not ( = ?auto_38052 ?auto_38049 ) ) ( not ( = ?auto_38046 ?auto_38052 ) ) ( not ( = ?auto_38047 ?auto_38052 ) ) ( not ( = ?auto_38048 ?auto_38052 ) ) ( ON ?auto_38048 ?auto_38049 ) ( ON ?auto_38047 ?auto_38048 ) ( ON ?auto_38046 ?auto_38047 ) ( CLEAR ?auto_38046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38052 ?auto_38051 ?auto_38050 ?auto_38049 ?auto_38048 ?auto_38047 )
      ( MAKE-5PILE ?auto_38046 ?auto_38047 ?auto_38048 ?auto_38049 ?auto_38050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38054 - BLOCK
    )
    :vars
    (
      ?auto_38055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38055 ?auto_38054 ) ( CLEAR ?auto_38055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38054 ) ( not ( = ?auto_38054 ?auto_38055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38055 ?auto_38054 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38056 - BLOCK
    )
    :vars
    (
      ?auto_38057 - BLOCK
      ?auto_38058 - BLOCK
      ?auto_38059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38057 ?auto_38056 ) ( CLEAR ?auto_38057 ) ( ON-TABLE ?auto_38056 ) ( not ( = ?auto_38056 ?auto_38057 ) ) ( HOLDING ?auto_38058 ) ( CLEAR ?auto_38059 ) ( not ( = ?auto_38056 ?auto_38058 ) ) ( not ( = ?auto_38056 ?auto_38059 ) ) ( not ( = ?auto_38057 ?auto_38058 ) ) ( not ( = ?auto_38057 ?auto_38059 ) ) ( not ( = ?auto_38058 ?auto_38059 ) ) )
    :subtasks
    ( ( !STACK ?auto_38058 ?auto_38059 )
      ( MAKE-1PILE ?auto_38056 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38060 - BLOCK
    )
    :vars
    (
      ?auto_38062 - BLOCK
      ?auto_38061 - BLOCK
      ?auto_38063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38062 ?auto_38060 ) ( ON-TABLE ?auto_38060 ) ( not ( = ?auto_38060 ?auto_38062 ) ) ( CLEAR ?auto_38061 ) ( not ( = ?auto_38060 ?auto_38063 ) ) ( not ( = ?auto_38060 ?auto_38061 ) ) ( not ( = ?auto_38062 ?auto_38063 ) ) ( not ( = ?auto_38062 ?auto_38061 ) ) ( not ( = ?auto_38063 ?auto_38061 ) ) ( ON ?auto_38063 ?auto_38062 ) ( CLEAR ?auto_38063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38060 ?auto_38062 )
      ( MAKE-1PILE ?auto_38060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38064 - BLOCK
    )
    :vars
    (
      ?auto_38066 - BLOCK
      ?auto_38065 - BLOCK
      ?auto_38067 - BLOCK
      ?auto_38069 - BLOCK
      ?auto_38070 - BLOCK
      ?auto_38068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38066 ?auto_38064 ) ( ON-TABLE ?auto_38064 ) ( not ( = ?auto_38064 ?auto_38066 ) ) ( not ( = ?auto_38064 ?auto_38065 ) ) ( not ( = ?auto_38064 ?auto_38067 ) ) ( not ( = ?auto_38066 ?auto_38065 ) ) ( not ( = ?auto_38066 ?auto_38067 ) ) ( not ( = ?auto_38065 ?auto_38067 ) ) ( ON ?auto_38065 ?auto_38066 ) ( CLEAR ?auto_38065 ) ( HOLDING ?auto_38067 ) ( CLEAR ?auto_38069 ) ( ON-TABLE ?auto_38070 ) ( ON ?auto_38068 ?auto_38070 ) ( ON ?auto_38069 ?auto_38068 ) ( not ( = ?auto_38070 ?auto_38068 ) ) ( not ( = ?auto_38070 ?auto_38069 ) ) ( not ( = ?auto_38070 ?auto_38067 ) ) ( not ( = ?auto_38068 ?auto_38069 ) ) ( not ( = ?auto_38068 ?auto_38067 ) ) ( not ( = ?auto_38069 ?auto_38067 ) ) ( not ( = ?auto_38064 ?auto_38069 ) ) ( not ( = ?auto_38064 ?auto_38070 ) ) ( not ( = ?auto_38064 ?auto_38068 ) ) ( not ( = ?auto_38066 ?auto_38069 ) ) ( not ( = ?auto_38066 ?auto_38070 ) ) ( not ( = ?auto_38066 ?auto_38068 ) ) ( not ( = ?auto_38065 ?auto_38069 ) ) ( not ( = ?auto_38065 ?auto_38070 ) ) ( not ( = ?auto_38065 ?auto_38068 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38070 ?auto_38068 ?auto_38069 ?auto_38067 )
      ( MAKE-1PILE ?auto_38064 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38071 - BLOCK
    )
    :vars
    (
      ?auto_38072 - BLOCK
      ?auto_38074 - BLOCK
      ?auto_38077 - BLOCK
      ?auto_38075 - BLOCK
      ?auto_38076 - BLOCK
      ?auto_38073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38072 ?auto_38071 ) ( ON-TABLE ?auto_38071 ) ( not ( = ?auto_38071 ?auto_38072 ) ) ( not ( = ?auto_38071 ?auto_38074 ) ) ( not ( = ?auto_38071 ?auto_38077 ) ) ( not ( = ?auto_38072 ?auto_38074 ) ) ( not ( = ?auto_38072 ?auto_38077 ) ) ( not ( = ?auto_38074 ?auto_38077 ) ) ( ON ?auto_38074 ?auto_38072 ) ( CLEAR ?auto_38075 ) ( ON-TABLE ?auto_38076 ) ( ON ?auto_38073 ?auto_38076 ) ( ON ?auto_38075 ?auto_38073 ) ( not ( = ?auto_38076 ?auto_38073 ) ) ( not ( = ?auto_38076 ?auto_38075 ) ) ( not ( = ?auto_38076 ?auto_38077 ) ) ( not ( = ?auto_38073 ?auto_38075 ) ) ( not ( = ?auto_38073 ?auto_38077 ) ) ( not ( = ?auto_38075 ?auto_38077 ) ) ( not ( = ?auto_38071 ?auto_38075 ) ) ( not ( = ?auto_38071 ?auto_38076 ) ) ( not ( = ?auto_38071 ?auto_38073 ) ) ( not ( = ?auto_38072 ?auto_38075 ) ) ( not ( = ?auto_38072 ?auto_38076 ) ) ( not ( = ?auto_38072 ?auto_38073 ) ) ( not ( = ?auto_38074 ?auto_38075 ) ) ( not ( = ?auto_38074 ?auto_38076 ) ) ( not ( = ?auto_38074 ?auto_38073 ) ) ( ON ?auto_38077 ?auto_38074 ) ( CLEAR ?auto_38077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38071 ?auto_38072 ?auto_38074 )
      ( MAKE-1PILE ?auto_38071 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38078 - BLOCK
    )
    :vars
    (
      ?auto_38081 - BLOCK
      ?auto_38079 - BLOCK
      ?auto_38083 - BLOCK
      ?auto_38084 - BLOCK
      ?auto_38080 - BLOCK
      ?auto_38082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38081 ?auto_38078 ) ( ON-TABLE ?auto_38078 ) ( not ( = ?auto_38078 ?auto_38081 ) ) ( not ( = ?auto_38078 ?auto_38079 ) ) ( not ( = ?auto_38078 ?auto_38083 ) ) ( not ( = ?auto_38081 ?auto_38079 ) ) ( not ( = ?auto_38081 ?auto_38083 ) ) ( not ( = ?auto_38079 ?auto_38083 ) ) ( ON ?auto_38079 ?auto_38081 ) ( ON-TABLE ?auto_38084 ) ( ON ?auto_38080 ?auto_38084 ) ( not ( = ?auto_38084 ?auto_38080 ) ) ( not ( = ?auto_38084 ?auto_38082 ) ) ( not ( = ?auto_38084 ?auto_38083 ) ) ( not ( = ?auto_38080 ?auto_38082 ) ) ( not ( = ?auto_38080 ?auto_38083 ) ) ( not ( = ?auto_38082 ?auto_38083 ) ) ( not ( = ?auto_38078 ?auto_38082 ) ) ( not ( = ?auto_38078 ?auto_38084 ) ) ( not ( = ?auto_38078 ?auto_38080 ) ) ( not ( = ?auto_38081 ?auto_38082 ) ) ( not ( = ?auto_38081 ?auto_38084 ) ) ( not ( = ?auto_38081 ?auto_38080 ) ) ( not ( = ?auto_38079 ?auto_38082 ) ) ( not ( = ?auto_38079 ?auto_38084 ) ) ( not ( = ?auto_38079 ?auto_38080 ) ) ( ON ?auto_38083 ?auto_38079 ) ( CLEAR ?auto_38083 ) ( HOLDING ?auto_38082 ) ( CLEAR ?auto_38080 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38084 ?auto_38080 ?auto_38082 )
      ( MAKE-1PILE ?auto_38078 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38085 - BLOCK
    )
    :vars
    (
      ?auto_38086 - BLOCK
      ?auto_38087 - BLOCK
      ?auto_38089 - BLOCK
      ?auto_38088 - BLOCK
      ?auto_38090 - BLOCK
      ?auto_38091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38086 ?auto_38085 ) ( ON-TABLE ?auto_38085 ) ( not ( = ?auto_38085 ?auto_38086 ) ) ( not ( = ?auto_38085 ?auto_38087 ) ) ( not ( = ?auto_38085 ?auto_38089 ) ) ( not ( = ?auto_38086 ?auto_38087 ) ) ( not ( = ?auto_38086 ?auto_38089 ) ) ( not ( = ?auto_38087 ?auto_38089 ) ) ( ON ?auto_38087 ?auto_38086 ) ( ON-TABLE ?auto_38088 ) ( ON ?auto_38090 ?auto_38088 ) ( not ( = ?auto_38088 ?auto_38090 ) ) ( not ( = ?auto_38088 ?auto_38091 ) ) ( not ( = ?auto_38088 ?auto_38089 ) ) ( not ( = ?auto_38090 ?auto_38091 ) ) ( not ( = ?auto_38090 ?auto_38089 ) ) ( not ( = ?auto_38091 ?auto_38089 ) ) ( not ( = ?auto_38085 ?auto_38091 ) ) ( not ( = ?auto_38085 ?auto_38088 ) ) ( not ( = ?auto_38085 ?auto_38090 ) ) ( not ( = ?auto_38086 ?auto_38091 ) ) ( not ( = ?auto_38086 ?auto_38088 ) ) ( not ( = ?auto_38086 ?auto_38090 ) ) ( not ( = ?auto_38087 ?auto_38091 ) ) ( not ( = ?auto_38087 ?auto_38088 ) ) ( not ( = ?auto_38087 ?auto_38090 ) ) ( ON ?auto_38089 ?auto_38087 ) ( CLEAR ?auto_38090 ) ( ON ?auto_38091 ?auto_38089 ) ( CLEAR ?auto_38091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38085 ?auto_38086 ?auto_38087 ?auto_38089 )
      ( MAKE-1PILE ?auto_38085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38092 - BLOCK
    )
    :vars
    (
      ?auto_38093 - BLOCK
      ?auto_38094 - BLOCK
      ?auto_38096 - BLOCK
      ?auto_38095 - BLOCK
      ?auto_38098 - BLOCK
      ?auto_38097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38093 ?auto_38092 ) ( ON-TABLE ?auto_38092 ) ( not ( = ?auto_38092 ?auto_38093 ) ) ( not ( = ?auto_38092 ?auto_38094 ) ) ( not ( = ?auto_38092 ?auto_38096 ) ) ( not ( = ?auto_38093 ?auto_38094 ) ) ( not ( = ?auto_38093 ?auto_38096 ) ) ( not ( = ?auto_38094 ?auto_38096 ) ) ( ON ?auto_38094 ?auto_38093 ) ( ON-TABLE ?auto_38095 ) ( not ( = ?auto_38095 ?auto_38098 ) ) ( not ( = ?auto_38095 ?auto_38097 ) ) ( not ( = ?auto_38095 ?auto_38096 ) ) ( not ( = ?auto_38098 ?auto_38097 ) ) ( not ( = ?auto_38098 ?auto_38096 ) ) ( not ( = ?auto_38097 ?auto_38096 ) ) ( not ( = ?auto_38092 ?auto_38097 ) ) ( not ( = ?auto_38092 ?auto_38095 ) ) ( not ( = ?auto_38092 ?auto_38098 ) ) ( not ( = ?auto_38093 ?auto_38097 ) ) ( not ( = ?auto_38093 ?auto_38095 ) ) ( not ( = ?auto_38093 ?auto_38098 ) ) ( not ( = ?auto_38094 ?auto_38097 ) ) ( not ( = ?auto_38094 ?auto_38095 ) ) ( not ( = ?auto_38094 ?auto_38098 ) ) ( ON ?auto_38096 ?auto_38094 ) ( ON ?auto_38097 ?auto_38096 ) ( CLEAR ?auto_38097 ) ( HOLDING ?auto_38098 ) ( CLEAR ?auto_38095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38095 ?auto_38098 )
      ( MAKE-1PILE ?auto_38092 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38945 - BLOCK
    )
    :vars
    (
      ?auto_38948 - BLOCK
      ?auto_38946 - BLOCK
      ?auto_38950 - BLOCK
      ?auto_38949 - BLOCK
      ?auto_38947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38948 ?auto_38945 ) ( ON-TABLE ?auto_38945 ) ( not ( = ?auto_38945 ?auto_38948 ) ) ( not ( = ?auto_38945 ?auto_38946 ) ) ( not ( = ?auto_38945 ?auto_38950 ) ) ( not ( = ?auto_38948 ?auto_38946 ) ) ( not ( = ?auto_38948 ?auto_38950 ) ) ( not ( = ?auto_38946 ?auto_38950 ) ) ( ON ?auto_38946 ?auto_38948 ) ( not ( = ?auto_38949 ?auto_38947 ) ) ( not ( = ?auto_38949 ?auto_38950 ) ) ( not ( = ?auto_38947 ?auto_38950 ) ) ( not ( = ?auto_38945 ?auto_38947 ) ) ( not ( = ?auto_38945 ?auto_38949 ) ) ( not ( = ?auto_38948 ?auto_38947 ) ) ( not ( = ?auto_38948 ?auto_38949 ) ) ( not ( = ?auto_38946 ?auto_38947 ) ) ( not ( = ?auto_38946 ?auto_38949 ) ) ( ON ?auto_38950 ?auto_38946 ) ( ON ?auto_38947 ?auto_38950 ) ( ON ?auto_38949 ?auto_38947 ) ( CLEAR ?auto_38949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38945 ?auto_38948 ?auto_38946 ?auto_38950 ?auto_38947 )
      ( MAKE-1PILE ?auto_38945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38106 - BLOCK
    )
    :vars
    (
      ?auto_38108 - BLOCK
      ?auto_38107 - BLOCK
      ?auto_38110 - BLOCK
      ?auto_38109 - BLOCK
      ?auto_38111 - BLOCK
      ?auto_38112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38108 ?auto_38106 ) ( ON-TABLE ?auto_38106 ) ( not ( = ?auto_38106 ?auto_38108 ) ) ( not ( = ?auto_38106 ?auto_38107 ) ) ( not ( = ?auto_38106 ?auto_38110 ) ) ( not ( = ?auto_38108 ?auto_38107 ) ) ( not ( = ?auto_38108 ?auto_38110 ) ) ( not ( = ?auto_38107 ?auto_38110 ) ) ( ON ?auto_38107 ?auto_38108 ) ( not ( = ?auto_38109 ?auto_38111 ) ) ( not ( = ?auto_38109 ?auto_38112 ) ) ( not ( = ?auto_38109 ?auto_38110 ) ) ( not ( = ?auto_38111 ?auto_38112 ) ) ( not ( = ?auto_38111 ?auto_38110 ) ) ( not ( = ?auto_38112 ?auto_38110 ) ) ( not ( = ?auto_38106 ?auto_38112 ) ) ( not ( = ?auto_38106 ?auto_38109 ) ) ( not ( = ?auto_38106 ?auto_38111 ) ) ( not ( = ?auto_38108 ?auto_38112 ) ) ( not ( = ?auto_38108 ?auto_38109 ) ) ( not ( = ?auto_38108 ?auto_38111 ) ) ( not ( = ?auto_38107 ?auto_38112 ) ) ( not ( = ?auto_38107 ?auto_38109 ) ) ( not ( = ?auto_38107 ?auto_38111 ) ) ( ON ?auto_38110 ?auto_38107 ) ( ON ?auto_38112 ?auto_38110 ) ( ON ?auto_38111 ?auto_38112 ) ( CLEAR ?auto_38111 ) ( HOLDING ?auto_38109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38109 )
      ( MAKE-1PILE ?auto_38106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38113 - BLOCK
    )
    :vars
    (
      ?auto_38117 - BLOCK
      ?auto_38119 - BLOCK
      ?auto_38118 - BLOCK
      ?auto_38116 - BLOCK
      ?auto_38114 - BLOCK
      ?auto_38115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38117 ?auto_38113 ) ( ON-TABLE ?auto_38113 ) ( not ( = ?auto_38113 ?auto_38117 ) ) ( not ( = ?auto_38113 ?auto_38119 ) ) ( not ( = ?auto_38113 ?auto_38118 ) ) ( not ( = ?auto_38117 ?auto_38119 ) ) ( not ( = ?auto_38117 ?auto_38118 ) ) ( not ( = ?auto_38119 ?auto_38118 ) ) ( ON ?auto_38119 ?auto_38117 ) ( not ( = ?auto_38116 ?auto_38114 ) ) ( not ( = ?auto_38116 ?auto_38115 ) ) ( not ( = ?auto_38116 ?auto_38118 ) ) ( not ( = ?auto_38114 ?auto_38115 ) ) ( not ( = ?auto_38114 ?auto_38118 ) ) ( not ( = ?auto_38115 ?auto_38118 ) ) ( not ( = ?auto_38113 ?auto_38115 ) ) ( not ( = ?auto_38113 ?auto_38116 ) ) ( not ( = ?auto_38113 ?auto_38114 ) ) ( not ( = ?auto_38117 ?auto_38115 ) ) ( not ( = ?auto_38117 ?auto_38116 ) ) ( not ( = ?auto_38117 ?auto_38114 ) ) ( not ( = ?auto_38119 ?auto_38115 ) ) ( not ( = ?auto_38119 ?auto_38116 ) ) ( not ( = ?auto_38119 ?auto_38114 ) ) ( ON ?auto_38118 ?auto_38119 ) ( ON ?auto_38115 ?auto_38118 ) ( ON ?auto_38114 ?auto_38115 ) ( ON ?auto_38116 ?auto_38114 ) ( CLEAR ?auto_38116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38113 ?auto_38117 ?auto_38119 ?auto_38118 ?auto_38115 ?auto_38114 )
      ( MAKE-1PILE ?auto_38113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38126 - BLOCK
      ?auto_38127 - BLOCK
      ?auto_38128 - BLOCK
      ?auto_38129 - BLOCK
      ?auto_38130 - BLOCK
      ?auto_38131 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_38131 ) ( CLEAR ?auto_38130 ) ( ON-TABLE ?auto_38126 ) ( ON ?auto_38127 ?auto_38126 ) ( ON ?auto_38128 ?auto_38127 ) ( ON ?auto_38129 ?auto_38128 ) ( ON ?auto_38130 ?auto_38129 ) ( not ( = ?auto_38126 ?auto_38127 ) ) ( not ( = ?auto_38126 ?auto_38128 ) ) ( not ( = ?auto_38126 ?auto_38129 ) ) ( not ( = ?auto_38126 ?auto_38130 ) ) ( not ( = ?auto_38126 ?auto_38131 ) ) ( not ( = ?auto_38127 ?auto_38128 ) ) ( not ( = ?auto_38127 ?auto_38129 ) ) ( not ( = ?auto_38127 ?auto_38130 ) ) ( not ( = ?auto_38127 ?auto_38131 ) ) ( not ( = ?auto_38128 ?auto_38129 ) ) ( not ( = ?auto_38128 ?auto_38130 ) ) ( not ( = ?auto_38128 ?auto_38131 ) ) ( not ( = ?auto_38129 ?auto_38130 ) ) ( not ( = ?auto_38129 ?auto_38131 ) ) ( not ( = ?auto_38130 ?auto_38131 ) ) )
    :subtasks
    ( ( !STACK ?auto_38131 ?auto_38130 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38132 - BLOCK
      ?auto_38133 - BLOCK
      ?auto_38134 - BLOCK
      ?auto_38135 - BLOCK
      ?auto_38136 - BLOCK
      ?auto_38137 - BLOCK
    )
    :vars
    (
      ?auto_38138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38136 ) ( ON-TABLE ?auto_38132 ) ( ON ?auto_38133 ?auto_38132 ) ( ON ?auto_38134 ?auto_38133 ) ( ON ?auto_38135 ?auto_38134 ) ( ON ?auto_38136 ?auto_38135 ) ( not ( = ?auto_38132 ?auto_38133 ) ) ( not ( = ?auto_38132 ?auto_38134 ) ) ( not ( = ?auto_38132 ?auto_38135 ) ) ( not ( = ?auto_38132 ?auto_38136 ) ) ( not ( = ?auto_38132 ?auto_38137 ) ) ( not ( = ?auto_38133 ?auto_38134 ) ) ( not ( = ?auto_38133 ?auto_38135 ) ) ( not ( = ?auto_38133 ?auto_38136 ) ) ( not ( = ?auto_38133 ?auto_38137 ) ) ( not ( = ?auto_38134 ?auto_38135 ) ) ( not ( = ?auto_38134 ?auto_38136 ) ) ( not ( = ?auto_38134 ?auto_38137 ) ) ( not ( = ?auto_38135 ?auto_38136 ) ) ( not ( = ?auto_38135 ?auto_38137 ) ) ( not ( = ?auto_38136 ?auto_38137 ) ) ( ON ?auto_38137 ?auto_38138 ) ( CLEAR ?auto_38137 ) ( HAND-EMPTY ) ( not ( = ?auto_38132 ?auto_38138 ) ) ( not ( = ?auto_38133 ?auto_38138 ) ) ( not ( = ?auto_38134 ?auto_38138 ) ) ( not ( = ?auto_38135 ?auto_38138 ) ) ( not ( = ?auto_38136 ?auto_38138 ) ) ( not ( = ?auto_38137 ?auto_38138 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38137 ?auto_38138 )
      ( MAKE-6PILE ?auto_38132 ?auto_38133 ?auto_38134 ?auto_38135 ?auto_38136 ?auto_38137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38139 - BLOCK
      ?auto_38140 - BLOCK
      ?auto_38141 - BLOCK
      ?auto_38142 - BLOCK
      ?auto_38143 - BLOCK
      ?auto_38144 - BLOCK
    )
    :vars
    (
      ?auto_38145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38139 ) ( ON ?auto_38140 ?auto_38139 ) ( ON ?auto_38141 ?auto_38140 ) ( ON ?auto_38142 ?auto_38141 ) ( not ( = ?auto_38139 ?auto_38140 ) ) ( not ( = ?auto_38139 ?auto_38141 ) ) ( not ( = ?auto_38139 ?auto_38142 ) ) ( not ( = ?auto_38139 ?auto_38143 ) ) ( not ( = ?auto_38139 ?auto_38144 ) ) ( not ( = ?auto_38140 ?auto_38141 ) ) ( not ( = ?auto_38140 ?auto_38142 ) ) ( not ( = ?auto_38140 ?auto_38143 ) ) ( not ( = ?auto_38140 ?auto_38144 ) ) ( not ( = ?auto_38141 ?auto_38142 ) ) ( not ( = ?auto_38141 ?auto_38143 ) ) ( not ( = ?auto_38141 ?auto_38144 ) ) ( not ( = ?auto_38142 ?auto_38143 ) ) ( not ( = ?auto_38142 ?auto_38144 ) ) ( not ( = ?auto_38143 ?auto_38144 ) ) ( ON ?auto_38144 ?auto_38145 ) ( CLEAR ?auto_38144 ) ( not ( = ?auto_38139 ?auto_38145 ) ) ( not ( = ?auto_38140 ?auto_38145 ) ) ( not ( = ?auto_38141 ?auto_38145 ) ) ( not ( = ?auto_38142 ?auto_38145 ) ) ( not ( = ?auto_38143 ?auto_38145 ) ) ( not ( = ?auto_38144 ?auto_38145 ) ) ( HOLDING ?auto_38143 ) ( CLEAR ?auto_38142 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38139 ?auto_38140 ?auto_38141 ?auto_38142 ?auto_38143 )
      ( MAKE-6PILE ?auto_38139 ?auto_38140 ?auto_38141 ?auto_38142 ?auto_38143 ?auto_38144 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38146 - BLOCK
      ?auto_38147 - BLOCK
      ?auto_38148 - BLOCK
      ?auto_38149 - BLOCK
      ?auto_38150 - BLOCK
      ?auto_38151 - BLOCK
    )
    :vars
    (
      ?auto_38152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38146 ) ( ON ?auto_38147 ?auto_38146 ) ( ON ?auto_38148 ?auto_38147 ) ( ON ?auto_38149 ?auto_38148 ) ( not ( = ?auto_38146 ?auto_38147 ) ) ( not ( = ?auto_38146 ?auto_38148 ) ) ( not ( = ?auto_38146 ?auto_38149 ) ) ( not ( = ?auto_38146 ?auto_38150 ) ) ( not ( = ?auto_38146 ?auto_38151 ) ) ( not ( = ?auto_38147 ?auto_38148 ) ) ( not ( = ?auto_38147 ?auto_38149 ) ) ( not ( = ?auto_38147 ?auto_38150 ) ) ( not ( = ?auto_38147 ?auto_38151 ) ) ( not ( = ?auto_38148 ?auto_38149 ) ) ( not ( = ?auto_38148 ?auto_38150 ) ) ( not ( = ?auto_38148 ?auto_38151 ) ) ( not ( = ?auto_38149 ?auto_38150 ) ) ( not ( = ?auto_38149 ?auto_38151 ) ) ( not ( = ?auto_38150 ?auto_38151 ) ) ( ON ?auto_38151 ?auto_38152 ) ( not ( = ?auto_38146 ?auto_38152 ) ) ( not ( = ?auto_38147 ?auto_38152 ) ) ( not ( = ?auto_38148 ?auto_38152 ) ) ( not ( = ?auto_38149 ?auto_38152 ) ) ( not ( = ?auto_38150 ?auto_38152 ) ) ( not ( = ?auto_38151 ?auto_38152 ) ) ( CLEAR ?auto_38149 ) ( ON ?auto_38150 ?auto_38151 ) ( CLEAR ?auto_38150 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38152 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38152 ?auto_38151 )
      ( MAKE-6PILE ?auto_38146 ?auto_38147 ?auto_38148 ?auto_38149 ?auto_38150 ?auto_38151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38153 - BLOCK
      ?auto_38154 - BLOCK
      ?auto_38155 - BLOCK
      ?auto_38156 - BLOCK
      ?auto_38157 - BLOCK
      ?auto_38158 - BLOCK
    )
    :vars
    (
      ?auto_38159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38153 ) ( ON ?auto_38154 ?auto_38153 ) ( ON ?auto_38155 ?auto_38154 ) ( not ( = ?auto_38153 ?auto_38154 ) ) ( not ( = ?auto_38153 ?auto_38155 ) ) ( not ( = ?auto_38153 ?auto_38156 ) ) ( not ( = ?auto_38153 ?auto_38157 ) ) ( not ( = ?auto_38153 ?auto_38158 ) ) ( not ( = ?auto_38154 ?auto_38155 ) ) ( not ( = ?auto_38154 ?auto_38156 ) ) ( not ( = ?auto_38154 ?auto_38157 ) ) ( not ( = ?auto_38154 ?auto_38158 ) ) ( not ( = ?auto_38155 ?auto_38156 ) ) ( not ( = ?auto_38155 ?auto_38157 ) ) ( not ( = ?auto_38155 ?auto_38158 ) ) ( not ( = ?auto_38156 ?auto_38157 ) ) ( not ( = ?auto_38156 ?auto_38158 ) ) ( not ( = ?auto_38157 ?auto_38158 ) ) ( ON ?auto_38158 ?auto_38159 ) ( not ( = ?auto_38153 ?auto_38159 ) ) ( not ( = ?auto_38154 ?auto_38159 ) ) ( not ( = ?auto_38155 ?auto_38159 ) ) ( not ( = ?auto_38156 ?auto_38159 ) ) ( not ( = ?auto_38157 ?auto_38159 ) ) ( not ( = ?auto_38158 ?auto_38159 ) ) ( ON ?auto_38157 ?auto_38158 ) ( CLEAR ?auto_38157 ) ( ON-TABLE ?auto_38159 ) ( HOLDING ?auto_38156 ) ( CLEAR ?auto_38155 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38153 ?auto_38154 ?auto_38155 ?auto_38156 )
      ( MAKE-6PILE ?auto_38153 ?auto_38154 ?auto_38155 ?auto_38156 ?auto_38157 ?auto_38158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38160 - BLOCK
      ?auto_38161 - BLOCK
      ?auto_38162 - BLOCK
      ?auto_38163 - BLOCK
      ?auto_38164 - BLOCK
      ?auto_38165 - BLOCK
    )
    :vars
    (
      ?auto_38166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38160 ) ( ON ?auto_38161 ?auto_38160 ) ( ON ?auto_38162 ?auto_38161 ) ( not ( = ?auto_38160 ?auto_38161 ) ) ( not ( = ?auto_38160 ?auto_38162 ) ) ( not ( = ?auto_38160 ?auto_38163 ) ) ( not ( = ?auto_38160 ?auto_38164 ) ) ( not ( = ?auto_38160 ?auto_38165 ) ) ( not ( = ?auto_38161 ?auto_38162 ) ) ( not ( = ?auto_38161 ?auto_38163 ) ) ( not ( = ?auto_38161 ?auto_38164 ) ) ( not ( = ?auto_38161 ?auto_38165 ) ) ( not ( = ?auto_38162 ?auto_38163 ) ) ( not ( = ?auto_38162 ?auto_38164 ) ) ( not ( = ?auto_38162 ?auto_38165 ) ) ( not ( = ?auto_38163 ?auto_38164 ) ) ( not ( = ?auto_38163 ?auto_38165 ) ) ( not ( = ?auto_38164 ?auto_38165 ) ) ( ON ?auto_38165 ?auto_38166 ) ( not ( = ?auto_38160 ?auto_38166 ) ) ( not ( = ?auto_38161 ?auto_38166 ) ) ( not ( = ?auto_38162 ?auto_38166 ) ) ( not ( = ?auto_38163 ?auto_38166 ) ) ( not ( = ?auto_38164 ?auto_38166 ) ) ( not ( = ?auto_38165 ?auto_38166 ) ) ( ON ?auto_38164 ?auto_38165 ) ( ON-TABLE ?auto_38166 ) ( CLEAR ?auto_38162 ) ( ON ?auto_38163 ?auto_38164 ) ( CLEAR ?auto_38163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38166 ?auto_38165 ?auto_38164 )
      ( MAKE-6PILE ?auto_38160 ?auto_38161 ?auto_38162 ?auto_38163 ?auto_38164 ?auto_38165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38167 - BLOCK
      ?auto_38168 - BLOCK
      ?auto_38169 - BLOCK
      ?auto_38170 - BLOCK
      ?auto_38171 - BLOCK
      ?auto_38172 - BLOCK
    )
    :vars
    (
      ?auto_38173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38167 ) ( ON ?auto_38168 ?auto_38167 ) ( not ( = ?auto_38167 ?auto_38168 ) ) ( not ( = ?auto_38167 ?auto_38169 ) ) ( not ( = ?auto_38167 ?auto_38170 ) ) ( not ( = ?auto_38167 ?auto_38171 ) ) ( not ( = ?auto_38167 ?auto_38172 ) ) ( not ( = ?auto_38168 ?auto_38169 ) ) ( not ( = ?auto_38168 ?auto_38170 ) ) ( not ( = ?auto_38168 ?auto_38171 ) ) ( not ( = ?auto_38168 ?auto_38172 ) ) ( not ( = ?auto_38169 ?auto_38170 ) ) ( not ( = ?auto_38169 ?auto_38171 ) ) ( not ( = ?auto_38169 ?auto_38172 ) ) ( not ( = ?auto_38170 ?auto_38171 ) ) ( not ( = ?auto_38170 ?auto_38172 ) ) ( not ( = ?auto_38171 ?auto_38172 ) ) ( ON ?auto_38172 ?auto_38173 ) ( not ( = ?auto_38167 ?auto_38173 ) ) ( not ( = ?auto_38168 ?auto_38173 ) ) ( not ( = ?auto_38169 ?auto_38173 ) ) ( not ( = ?auto_38170 ?auto_38173 ) ) ( not ( = ?auto_38171 ?auto_38173 ) ) ( not ( = ?auto_38172 ?auto_38173 ) ) ( ON ?auto_38171 ?auto_38172 ) ( ON-TABLE ?auto_38173 ) ( ON ?auto_38170 ?auto_38171 ) ( CLEAR ?auto_38170 ) ( HOLDING ?auto_38169 ) ( CLEAR ?auto_38168 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38167 ?auto_38168 ?auto_38169 )
      ( MAKE-6PILE ?auto_38167 ?auto_38168 ?auto_38169 ?auto_38170 ?auto_38171 ?auto_38172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38174 - BLOCK
      ?auto_38175 - BLOCK
      ?auto_38176 - BLOCK
      ?auto_38177 - BLOCK
      ?auto_38178 - BLOCK
      ?auto_38179 - BLOCK
    )
    :vars
    (
      ?auto_38180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38174 ) ( ON ?auto_38175 ?auto_38174 ) ( not ( = ?auto_38174 ?auto_38175 ) ) ( not ( = ?auto_38174 ?auto_38176 ) ) ( not ( = ?auto_38174 ?auto_38177 ) ) ( not ( = ?auto_38174 ?auto_38178 ) ) ( not ( = ?auto_38174 ?auto_38179 ) ) ( not ( = ?auto_38175 ?auto_38176 ) ) ( not ( = ?auto_38175 ?auto_38177 ) ) ( not ( = ?auto_38175 ?auto_38178 ) ) ( not ( = ?auto_38175 ?auto_38179 ) ) ( not ( = ?auto_38176 ?auto_38177 ) ) ( not ( = ?auto_38176 ?auto_38178 ) ) ( not ( = ?auto_38176 ?auto_38179 ) ) ( not ( = ?auto_38177 ?auto_38178 ) ) ( not ( = ?auto_38177 ?auto_38179 ) ) ( not ( = ?auto_38178 ?auto_38179 ) ) ( ON ?auto_38179 ?auto_38180 ) ( not ( = ?auto_38174 ?auto_38180 ) ) ( not ( = ?auto_38175 ?auto_38180 ) ) ( not ( = ?auto_38176 ?auto_38180 ) ) ( not ( = ?auto_38177 ?auto_38180 ) ) ( not ( = ?auto_38178 ?auto_38180 ) ) ( not ( = ?auto_38179 ?auto_38180 ) ) ( ON ?auto_38178 ?auto_38179 ) ( ON-TABLE ?auto_38180 ) ( ON ?auto_38177 ?auto_38178 ) ( CLEAR ?auto_38175 ) ( ON ?auto_38176 ?auto_38177 ) ( CLEAR ?auto_38176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38180 ?auto_38179 ?auto_38178 ?auto_38177 )
      ( MAKE-6PILE ?auto_38174 ?auto_38175 ?auto_38176 ?auto_38177 ?auto_38178 ?auto_38179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38181 - BLOCK
      ?auto_38182 - BLOCK
      ?auto_38183 - BLOCK
      ?auto_38184 - BLOCK
      ?auto_38185 - BLOCK
      ?auto_38186 - BLOCK
    )
    :vars
    (
      ?auto_38187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38181 ) ( not ( = ?auto_38181 ?auto_38182 ) ) ( not ( = ?auto_38181 ?auto_38183 ) ) ( not ( = ?auto_38181 ?auto_38184 ) ) ( not ( = ?auto_38181 ?auto_38185 ) ) ( not ( = ?auto_38181 ?auto_38186 ) ) ( not ( = ?auto_38182 ?auto_38183 ) ) ( not ( = ?auto_38182 ?auto_38184 ) ) ( not ( = ?auto_38182 ?auto_38185 ) ) ( not ( = ?auto_38182 ?auto_38186 ) ) ( not ( = ?auto_38183 ?auto_38184 ) ) ( not ( = ?auto_38183 ?auto_38185 ) ) ( not ( = ?auto_38183 ?auto_38186 ) ) ( not ( = ?auto_38184 ?auto_38185 ) ) ( not ( = ?auto_38184 ?auto_38186 ) ) ( not ( = ?auto_38185 ?auto_38186 ) ) ( ON ?auto_38186 ?auto_38187 ) ( not ( = ?auto_38181 ?auto_38187 ) ) ( not ( = ?auto_38182 ?auto_38187 ) ) ( not ( = ?auto_38183 ?auto_38187 ) ) ( not ( = ?auto_38184 ?auto_38187 ) ) ( not ( = ?auto_38185 ?auto_38187 ) ) ( not ( = ?auto_38186 ?auto_38187 ) ) ( ON ?auto_38185 ?auto_38186 ) ( ON-TABLE ?auto_38187 ) ( ON ?auto_38184 ?auto_38185 ) ( ON ?auto_38183 ?auto_38184 ) ( CLEAR ?auto_38183 ) ( HOLDING ?auto_38182 ) ( CLEAR ?auto_38181 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38181 ?auto_38182 )
      ( MAKE-6PILE ?auto_38181 ?auto_38182 ?auto_38183 ?auto_38184 ?auto_38185 ?auto_38186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38188 - BLOCK
      ?auto_38189 - BLOCK
      ?auto_38190 - BLOCK
      ?auto_38191 - BLOCK
      ?auto_38192 - BLOCK
      ?auto_38193 - BLOCK
    )
    :vars
    (
      ?auto_38194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38188 ) ( not ( = ?auto_38188 ?auto_38189 ) ) ( not ( = ?auto_38188 ?auto_38190 ) ) ( not ( = ?auto_38188 ?auto_38191 ) ) ( not ( = ?auto_38188 ?auto_38192 ) ) ( not ( = ?auto_38188 ?auto_38193 ) ) ( not ( = ?auto_38189 ?auto_38190 ) ) ( not ( = ?auto_38189 ?auto_38191 ) ) ( not ( = ?auto_38189 ?auto_38192 ) ) ( not ( = ?auto_38189 ?auto_38193 ) ) ( not ( = ?auto_38190 ?auto_38191 ) ) ( not ( = ?auto_38190 ?auto_38192 ) ) ( not ( = ?auto_38190 ?auto_38193 ) ) ( not ( = ?auto_38191 ?auto_38192 ) ) ( not ( = ?auto_38191 ?auto_38193 ) ) ( not ( = ?auto_38192 ?auto_38193 ) ) ( ON ?auto_38193 ?auto_38194 ) ( not ( = ?auto_38188 ?auto_38194 ) ) ( not ( = ?auto_38189 ?auto_38194 ) ) ( not ( = ?auto_38190 ?auto_38194 ) ) ( not ( = ?auto_38191 ?auto_38194 ) ) ( not ( = ?auto_38192 ?auto_38194 ) ) ( not ( = ?auto_38193 ?auto_38194 ) ) ( ON ?auto_38192 ?auto_38193 ) ( ON-TABLE ?auto_38194 ) ( ON ?auto_38191 ?auto_38192 ) ( ON ?auto_38190 ?auto_38191 ) ( CLEAR ?auto_38188 ) ( ON ?auto_38189 ?auto_38190 ) ( CLEAR ?auto_38189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38194 ?auto_38193 ?auto_38192 ?auto_38191 ?auto_38190 )
      ( MAKE-6PILE ?auto_38188 ?auto_38189 ?auto_38190 ?auto_38191 ?auto_38192 ?auto_38193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38195 - BLOCK
      ?auto_38196 - BLOCK
      ?auto_38197 - BLOCK
      ?auto_38198 - BLOCK
      ?auto_38199 - BLOCK
      ?auto_38200 - BLOCK
    )
    :vars
    (
      ?auto_38201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38195 ?auto_38196 ) ) ( not ( = ?auto_38195 ?auto_38197 ) ) ( not ( = ?auto_38195 ?auto_38198 ) ) ( not ( = ?auto_38195 ?auto_38199 ) ) ( not ( = ?auto_38195 ?auto_38200 ) ) ( not ( = ?auto_38196 ?auto_38197 ) ) ( not ( = ?auto_38196 ?auto_38198 ) ) ( not ( = ?auto_38196 ?auto_38199 ) ) ( not ( = ?auto_38196 ?auto_38200 ) ) ( not ( = ?auto_38197 ?auto_38198 ) ) ( not ( = ?auto_38197 ?auto_38199 ) ) ( not ( = ?auto_38197 ?auto_38200 ) ) ( not ( = ?auto_38198 ?auto_38199 ) ) ( not ( = ?auto_38198 ?auto_38200 ) ) ( not ( = ?auto_38199 ?auto_38200 ) ) ( ON ?auto_38200 ?auto_38201 ) ( not ( = ?auto_38195 ?auto_38201 ) ) ( not ( = ?auto_38196 ?auto_38201 ) ) ( not ( = ?auto_38197 ?auto_38201 ) ) ( not ( = ?auto_38198 ?auto_38201 ) ) ( not ( = ?auto_38199 ?auto_38201 ) ) ( not ( = ?auto_38200 ?auto_38201 ) ) ( ON ?auto_38199 ?auto_38200 ) ( ON-TABLE ?auto_38201 ) ( ON ?auto_38198 ?auto_38199 ) ( ON ?auto_38197 ?auto_38198 ) ( ON ?auto_38196 ?auto_38197 ) ( CLEAR ?auto_38196 ) ( HOLDING ?auto_38195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38195 )
      ( MAKE-6PILE ?auto_38195 ?auto_38196 ?auto_38197 ?auto_38198 ?auto_38199 ?auto_38200 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_38202 - BLOCK
      ?auto_38203 - BLOCK
      ?auto_38204 - BLOCK
      ?auto_38205 - BLOCK
      ?auto_38206 - BLOCK
      ?auto_38207 - BLOCK
    )
    :vars
    (
      ?auto_38208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38202 ?auto_38203 ) ) ( not ( = ?auto_38202 ?auto_38204 ) ) ( not ( = ?auto_38202 ?auto_38205 ) ) ( not ( = ?auto_38202 ?auto_38206 ) ) ( not ( = ?auto_38202 ?auto_38207 ) ) ( not ( = ?auto_38203 ?auto_38204 ) ) ( not ( = ?auto_38203 ?auto_38205 ) ) ( not ( = ?auto_38203 ?auto_38206 ) ) ( not ( = ?auto_38203 ?auto_38207 ) ) ( not ( = ?auto_38204 ?auto_38205 ) ) ( not ( = ?auto_38204 ?auto_38206 ) ) ( not ( = ?auto_38204 ?auto_38207 ) ) ( not ( = ?auto_38205 ?auto_38206 ) ) ( not ( = ?auto_38205 ?auto_38207 ) ) ( not ( = ?auto_38206 ?auto_38207 ) ) ( ON ?auto_38207 ?auto_38208 ) ( not ( = ?auto_38202 ?auto_38208 ) ) ( not ( = ?auto_38203 ?auto_38208 ) ) ( not ( = ?auto_38204 ?auto_38208 ) ) ( not ( = ?auto_38205 ?auto_38208 ) ) ( not ( = ?auto_38206 ?auto_38208 ) ) ( not ( = ?auto_38207 ?auto_38208 ) ) ( ON ?auto_38206 ?auto_38207 ) ( ON-TABLE ?auto_38208 ) ( ON ?auto_38205 ?auto_38206 ) ( ON ?auto_38204 ?auto_38205 ) ( ON ?auto_38203 ?auto_38204 ) ( ON ?auto_38202 ?auto_38203 ) ( CLEAR ?auto_38202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38208 ?auto_38207 ?auto_38206 ?auto_38205 ?auto_38204 ?auto_38203 )
      ( MAKE-6PILE ?auto_38202 ?auto_38203 ?auto_38204 ?auto_38205 ?auto_38206 ?auto_38207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38289 - BLOCK
    )
    :vars
    (
      ?auto_38290 - BLOCK
      ?auto_38291 - BLOCK
      ?auto_38292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38289 ?auto_38290 ) ( CLEAR ?auto_38289 ) ( not ( = ?auto_38289 ?auto_38290 ) ) ( HOLDING ?auto_38291 ) ( CLEAR ?auto_38292 ) ( not ( = ?auto_38289 ?auto_38291 ) ) ( not ( = ?auto_38289 ?auto_38292 ) ) ( not ( = ?auto_38290 ?auto_38291 ) ) ( not ( = ?auto_38290 ?auto_38292 ) ) ( not ( = ?auto_38291 ?auto_38292 ) ) )
    :subtasks
    ( ( !STACK ?auto_38291 ?auto_38292 )
      ( MAKE-1PILE ?auto_38289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38293 - BLOCK
    )
    :vars
    (
      ?auto_38295 - BLOCK
      ?auto_38294 - BLOCK
      ?auto_38296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38293 ?auto_38295 ) ( not ( = ?auto_38293 ?auto_38295 ) ) ( CLEAR ?auto_38294 ) ( not ( = ?auto_38293 ?auto_38296 ) ) ( not ( = ?auto_38293 ?auto_38294 ) ) ( not ( = ?auto_38295 ?auto_38296 ) ) ( not ( = ?auto_38295 ?auto_38294 ) ) ( not ( = ?auto_38296 ?auto_38294 ) ) ( ON ?auto_38296 ?auto_38293 ) ( CLEAR ?auto_38296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38295 ?auto_38293 )
      ( MAKE-1PILE ?auto_38293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38297 - BLOCK
    )
    :vars
    (
      ?auto_38300 - BLOCK
      ?auto_38298 - BLOCK
      ?auto_38299 - BLOCK
      ?auto_38302 - BLOCK
      ?auto_38303 - BLOCK
      ?auto_38301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38297 ?auto_38300 ) ( not ( = ?auto_38297 ?auto_38300 ) ) ( not ( = ?auto_38297 ?auto_38298 ) ) ( not ( = ?auto_38297 ?auto_38299 ) ) ( not ( = ?auto_38300 ?auto_38298 ) ) ( not ( = ?auto_38300 ?auto_38299 ) ) ( not ( = ?auto_38298 ?auto_38299 ) ) ( ON ?auto_38298 ?auto_38297 ) ( CLEAR ?auto_38298 ) ( ON-TABLE ?auto_38300 ) ( HOLDING ?auto_38299 ) ( CLEAR ?auto_38302 ) ( ON-TABLE ?auto_38303 ) ( ON ?auto_38301 ?auto_38303 ) ( ON ?auto_38302 ?auto_38301 ) ( not ( = ?auto_38303 ?auto_38301 ) ) ( not ( = ?auto_38303 ?auto_38302 ) ) ( not ( = ?auto_38303 ?auto_38299 ) ) ( not ( = ?auto_38301 ?auto_38302 ) ) ( not ( = ?auto_38301 ?auto_38299 ) ) ( not ( = ?auto_38302 ?auto_38299 ) ) ( not ( = ?auto_38297 ?auto_38302 ) ) ( not ( = ?auto_38297 ?auto_38303 ) ) ( not ( = ?auto_38297 ?auto_38301 ) ) ( not ( = ?auto_38300 ?auto_38302 ) ) ( not ( = ?auto_38300 ?auto_38303 ) ) ( not ( = ?auto_38300 ?auto_38301 ) ) ( not ( = ?auto_38298 ?auto_38302 ) ) ( not ( = ?auto_38298 ?auto_38303 ) ) ( not ( = ?auto_38298 ?auto_38301 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38303 ?auto_38301 ?auto_38302 ?auto_38299 )
      ( MAKE-1PILE ?auto_38297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38304 - BLOCK
    )
    :vars
    (
      ?auto_38310 - BLOCK
      ?auto_38305 - BLOCK
      ?auto_38307 - BLOCK
      ?auto_38308 - BLOCK
      ?auto_38306 - BLOCK
      ?auto_38309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38304 ?auto_38310 ) ( not ( = ?auto_38304 ?auto_38310 ) ) ( not ( = ?auto_38304 ?auto_38305 ) ) ( not ( = ?auto_38304 ?auto_38307 ) ) ( not ( = ?auto_38310 ?auto_38305 ) ) ( not ( = ?auto_38310 ?auto_38307 ) ) ( not ( = ?auto_38305 ?auto_38307 ) ) ( ON ?auto_38305 ?auto_38304 ) ( ON-TABLE ?auto_38310 ) ( CLEAR ?auto_38308 ) ( ON-TABLE ?auto_38306 ) ( ON ?auto_38309 ?auto_38306 ) ( ON ?auto_38308 ?auto_38309 ) ( not ( = ?auto_38306 ?auto_38309 ) ) ( not ( = ?auto_38306 ?auto_38308 ) ) ( not ( = ?auto_38306 ?auto_38307 ) ) ( not ( = ?auto_38309 ?auto_38308 ) ) ( not ( = ?auto_38309 ?auto_38307 ) ) ( not ( = ?auto_38308 ?auto_38307 ) ) ( not ( = ?auto_38304 ?auto_38308 ) ) ( not ( = ?auto_38304 ?auto_38306 ) ) ( not ( = ?auto_38304 ?auto_38309 ) ) ( not ( = ?auto_38310 ?auto_38308 ) ) ( not ( = ?auto_38310 ?auto_38306 ) ) ( not ( = ?auto_38310 ?auto_38309 ) ) ( not ( = ?auto_38305 ?auto_38308 ) ) ( not ( = ?auto_38305 ?auto_38306 ) ) ( not ( = ?auto_38305 ?auto_38309 ) ) ( ON ?auto_38307 ?auto_38305 ) ( CLEAR ?auto_38307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38310 ?auto_38304 ?auto_38305 )
      ( MAKE-1PILE ?auto_38304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38311 - BLOCK
    )
    :vars
    (
      ?auto_38314 - BLOCK
      ?auto_38315 - BLOCK
      ?auto_38317 - BLOCK
      ?auto_38316 - BLOCK
      ?auto_38313 - BLOCK
      ?auto_38312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38311 ?auto_38314 ) ( not ( = ?auto_38311 ?auto_38314 ) ) ( not ( = ?auto_38311 ?auto_38315 ) ) ( not ( = ?auto_38311 ?auto_38317 ) ) ( not ( = ?auto_38314 ?auto_38315 ) ) ( not ( = ?auto_38314 ?auto_38317 ) ) ( not ( = ?auto_38315 ?auto_38317 ) ) ( ON ?auto_38315 ?auto_38311 ) ( ON-TABLE ?auto_38314 ) ( ON-TABLE ?auto_38316 ) ( ON ?auto_38313 ?auto_38316 ) ( not ( = ?auto_38316 ?auto_38313 ) ) ( not ( = ?auto_38316 ?auto_38312 ) ) ( not ( = ?auto_38316 ?auto_38317 ) ) ( not ( = ?auto_38313 ?auto_38312 ) ) ( not ( = ?auto_38313 ?auto_38317 ) ) ( not ( = ?auto_38312 ?auto_38317 ) ) ( not ( = ?auto_38311 ?auto_38312 ) ) ( not ( = ?auto_38311 ?auto_38316 ) ) ( not ( = ?auto_38311 ?auto_38313 ) ) ( not ( = ?auto_38314 ?auto_38312 ) ) ( not ( = ?auto_38314 ?auto_38316 ) ) ( not ( = ?auto_38314 ?auto_38313 ) ) ( not ( = ?auto_38315 ?auto_38312 ) ) ( not ( = ?auto_38315 ?auto_38316 ) ) ( not ( = ?auto_38315 ?auto_38313 ) ) ( ON ?auto_38317 ?auto_38315 ) ( CLEAR ?auto_38317 ) ( HOLDING ?auto_38312 ) ( CLEAR ?auto_38313 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38316 ?auto_38313 ?auto_38312 )
      ( MAKE-1PILE ?auto_38311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38318 - BLOCK
    )
    :vars
    (
      ?auto_38322 - BLOCK
      ?auto_38320 - BLOCK
      ?auto_38321 - BLOCK
      ?auto_38319 - BLOCK
      ?auto_38323 - BLOCK
      ?auto_38324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38318 ?auto_38322 ) ( not ( = ?auto_38318 ?auto_38322 ) ) ( not ( = ?auto_38318 ?auto_38320 ) ) ( not ( = ?auto_38318 ?auto_38321 ) ) ( not ( = ?auto_38322 ?auto_38320 ) ) ( not ( = ?auto_38322 ?auto_38321 ) ) ( not ( = ?auto_38320 ?auto_38321 ) ) ( ON ?auto_38320 ?auto_38318 ) ( ON-TABLE ?auto_38322 ) ( ON-TABLE ?auto_38319 ) ( ON ?auto_38323 ?auto_38319 ) ( not ( = ?auto_38319 ?auto_38323 ) ) ( not ( = ?auto_38319 ?auto_38324 ) ) ( not ( = ?auto_38319 ?auto_38321 ) ) ( not ( = ?auto_38323 ?auto_38324 ) ) ( not ( = ?auto_38323 ?auto_38321 ) ) ( not ( = ?auto_38324 ?auto_38321 ) ) ( not ( = ?auto_38318 ?auto_38324 ) ) ( not ( = ?auto_38318 ?auto_38319 ) ) ( not ( = ?auto_38318 ?auto_38323 ) ) ( not ( = ?auto_38322 ?auto_38324 ) ) ( not ( = ?auto_38322 ?auto_38319 ) ) ( not ( = ?auto_38322 ?auto_38323 ) ) ( not ( = ?auto_38320 ?auto_38324 ) ) ( not ( = ?auto_38320 ?auto_38319 ) ) ( not ( = ?auto_38320 ?auto_38323 ) ) ( ON ?auto_38321 ?auto_38320 ) ( CLEAR ?auto_38323 ) ( ON ?auto_38324 ?auto_38321 ) ( CLEAR ?auto_38324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38322 ?auto_38318 ?auto_38320 ?auto_38321 )
      ( MAKE-1PILE ?auto_38318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38325 - BLOCK
    )
    :vars
    (
      ?auto_38331 - BLOCK
      ?auto_38327 - BLOCK
      ?auto_38330 - BLOCK
      ?auto_38328 - BLOCK
      ?auto_38329 - BLOCK
      ?auto_38326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38325 ?auto_38331 ) ( not ( = ?auto_38325 ?auto_38331 ) ) ( not ( = ?auto_38325 ?auto_38327 ) ) ( not ( = ?auto_38325 ?auto_38330 ) ) ( not ( = ?auto_38331 ?auto_38327 ) ) ( not ( = ?auto_38331 ?auto_38330 ) ) ( not ( = ?auto_38327 ?auto_38330 ) ) ( ON ?auto_38327 ?auto_38325 ) ( ON-TABLE ?auto_38331 ) ( ON-TABLE ?auto_38328 ) ( not ( = ?auto_38328 ?auto_38329 ) ) ( not ( = ?auto_38328 ?auto_38326 ) ) ( not ( = ?auto_38328 ?auto_38330 ) ) ( not ( = ?auto_38329 ?auto_38326 ) ) ( not ( = ?auto_38329 ?auto_38330 ) ) ( not ( = ?auto_38326 ?auto_38330 ) ) ( not ( = ?auto_38325 ?auto_38326 ) ) ( not ( = ?auto_38325 ?auto_38328 ) ) ( not ( = ?auto_38325 ?auto_38329 ) ) ( not ( = ?auto_38331 ?auto_38326 ) ) ( not ( = ?auto_38331 ?auto_38328 ) ) ( not ( = ?auto_38331 ?auto_38329 ) ) ( not ( = ?auto_38327 ?auto_38326 ) ) ( not ( = ?auto_38327 ?auto_38328 ) ) ( not ( = ?auto_38327 ?auto_38329 ) ) ( ON ?auto_38330 ?auto_38327 ) ( ON ?auto_38326 ?auto_38330 ) ( CLEAR ?auto_38326 ) ( HOLDING ?auto_38329 ) ( CLEAR ?auto_38328 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38328 ?auto_38329 )
      ( MAKE-1PILE ?auto_38325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38332 - BLOCK
    )
    :vars
    (
      ?auto_38335 - BLOCK
      ?auto_38338 - BLOCK
      ?auto_38337 - BLOCK
      ?auto_38333 - BLOCK
      ?auto_38334 - BLOCK
      ?auto_38336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38332 ?auto_38335 ) ( not ( = ?auto_38332 ?auto_38335 ) ) ( not ( = ?auto_38332 ?auto_38338 ) ) ( not ( = ?auto_38332 ?auto_38337 ) ) ( not ( = ?auto_38335 ?auto_38338 ) ) ( not ( = ?auto_38335 ?auto_38337 ) ) ( not ( = ?auto_38338 ?auto_38337 ) ) ( ON ?auto_38338 ?auto_38332 ) ( ON-TABLE ?auto_38335 ) ( ON-TABLE ?auto_38333 ) ( not ( = ?auto_38333 ?auto_38334 ) ) ( not ( = ?auto_38333 ?auto_38336 ) ) ( not ( = ?auto_38333 ?auto_38337 ) ) ( not ( = ?auto_38334 ?auto_38336 ) ) ( not ( = ?auto_38334 ?auto_38337 ) ) ( not ( = ?auto_38336 ?auto_38337 ) ) ( not ( = ?auto_38332 ?auto_38336 ) ) ( not ( = ?auto_38332 ?auto_38333 ) ) ( not ( = ?auto_38332 ?auto_38334 ) ) ( not ( = ?auto_38335 ?auto_38336 ) ) ( not ( = ?auto_38335 ?auto_38333 ) ) ( not ( = ?auto_38335 ?auto_38334 ) ) ( not ( = ?auto_38338 ?auto_38336 ) ) ( not ( = ?auto_38338 ?auto_38333 ) ) ( not ( = ?auto_38338 ?auto_38334 ) ) ( ON ?auto_38337 ?auto_38338 ) ( ON ?auto_38336 ?auto_38337 ) ( CLEAR ?auto_38333 ) ( ON ?auto_38334 ?auto_38336 ) ( CLEAR ?auto_38334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38335 ?auto_38332 ?auto_38338 ?auto_38337 ?auto_38336 )
      ( MAKE-1PILE ?auto_38332 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38339 - BLOCK
    )
    :vars
    (
      ?auto_38345 - BLOCK
      ?auto_38342 - BLOCK
      ?auto_38344 - BLOCK
      ?auto_38340 - BLOCK
      ?auto_38343 - BLOCK
      ?auto_38341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38339 ?auto_38345 ) ( not ( = ?auto_38339 ?auto_38345 ) ) ( not ( = ?auto_38339 ?auto_38342 ) ) ( not ( = ?auto_38339 ?auto_38344 ) ) ( not ( = ?auto_38345 ?auto_38342 ) ) ( not ( = ?auto_38345 ?auto_38344 ) ) ( not ( = ?auto_38342 ?auto_38344 ) ) ( ON ?auto_38342 ?auto_38339 ) ( ON-TABLE ?auto_38345 ) ( not ( = ?auto_38340 ?auto_38343 ) ) ( not ( = ?auto_38340 ?auto_38341 ) ) ( not ( = ?auto_38340 ?auto_38344 ) ) ( not ( = ?auto_38343 ?auto_38341 ) ) ( not ( = ?auto_38343 ?auto_38344 ) ) ( not ( = ?auto_38341 ?auto_38344 ) ) ( not ( = ?auto_38339 ?auto_38341 ) ) ( not ( = ?auto_38339 ?auto_38340 ) ) ( not ( = ?auto_38339 ?auto_38343 ) ) ( not ( = ?auto_38345 ?auto_38341 ) ) ( not ( = ?auto_38345 ?auto_38340 ) ) ( not ( = ?auto_38345 ?auto_38343 ) ) ( not ( = ?auto_38342 ?auto_38341 ) ) ( not ( = ?auto_38342 ?auto_38340 ) ) ( not ( = ?auto_38342 ?auto_38343 ) ) ( ON ?auto_38344 ?auto_38342 ) ( ON ?auto_38341 ?auto_38344 ) ( ON ?auto_38343 ?auto_38341 ) ( CLEAR ?auto_38343 ) ( HOLDING ?auto_38340 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38340 )
      ( MAKE-1PILE ?auto_38339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38346 - BLOCK
    )
    :vars
    (
      ?auto_38351 - BLOCK
      ?auto_38350 - BLOCK
      ?auto_38348 - BLOCK
      ?auto_38347 - BLOCK
      ?auto_38349 - BLOCK
      ?auto_38352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38346 ?auto_38351 ) ( not ( = ?auto_38346 ?auto_38351 ) ) ( not ( = ?auto_38346 ?auto_38350 ) ) ( not ( = ?auto_38346 ?auto_38348 ) ) ( not ( = ?auto_38351 ?auto_38350 ) ) ( not ( = ?auto_38351 ?auto_38348 ) ) ( not ( = ?auto_38350 ?auto_38348 ) ) ( ON ?auto_38350 ?auto_38346 ) ( ON-TABLE ?auto_38351 ) ( not ( = ?auto_38347 ?auto_38349 ) ) ( not ( = ?auto_38347 ?auto_38352 ) ) ( not ( = ?auto_38347 ?auto_38348 ) ) ( not ( = ?auto_38349 ?auto_38352 ) ) ( not ( = ?auto_38349 ?auto_38348 ) ) ( not ( = ?auto_38352 ?auto_38348 ) ) ( not ( = ?auto_38346 ?auto_38352 ) ) ( not ( = ?auto_38346 ?auto_38347 ) ) ( not ( = ?auto_38346 ?auto_38349 ) ) ( not ( = ?auto_38351 ?auto_38352 ) ) ( not ( = ?auto_38351 ?auto_38347 ) ) ( not ( = ?auto_38351 ?auto_38349 ) ) ( not ( = ?auto_38350 ?auto_38352 ) ) ( not ( = ?auto_38350 ?auto_38347 ) ) ( not ( = ?auto_38350 ?auto_38349 ) ) ( ON ?auto_38348 ?auto_38350 ) ( ON ?auto_38352 ?auto_38348 ) ( ON ?auto_38349 ?auto_38352 ) ( ON ?auto_38347 ?auto_38349 ) ( CLEAR ?auto_38347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38351 ?auto_38346 ?auto_38350 ?auto_38348 ?auto_38352 ?auto_38349 )
      ( MAKE-1PILE ?auto_38346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38362 - BLOCK
      ?auto_38363 - BLOCK
      ?auto_38364 - BLOCK
      ?auto_38365 - BLOCK
    )
    :vars
    (
      ?auto_38366 - BLOCK
      ?auto_38367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38366 ?auto_38365 ) ( CLEAR ?auto_38366 ) ( ON-TABLE ?auto_38362 ) ( ON ?auto_38363 ?auto_38362 ) ( ON ?auto_38364 ?auto_38363 ) ( ON ?auto_38365 ?auto_38364 ) ( not ( = ?auto_38362 ?auto_38363 ) ) ( not ( = ?auto_38362 ?auto_38364 ) ) ( not ( = ?auto_38362 ?auto_38365 ) ) ( not ( = ?auto_38362 ?auto_38366 ) ) ( not ( = ?auto_38363 ?auto_38364 ) ) ( not ( = ?auto_38363 ?auto_38365 ) ) ( not ( = ?auto_38363 ?auto_38366 ) ) ( not ( = ?auto_38364 ?auto_38365 ) ) ( not ( = ?auto_38364 ?auto_38366 ) ) ( not ( = ?auto_38365 ?auto_38366 ) ) ( HOLDING ?auto_38367 ) ( not ( = ?auto_38362 ?auto_38367 ) ) ( not ( = ?auto_38363 ?auto_38367 ) ) ( not ( = ?auto_38364 ?auto_38367 ) ) ( not ( = ?auto_38365 ?auto_38367 ) ) ( not ( = ?auto_38366 ?auto_38367 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_38367 )
      ( MAKE-4PILE ?auto_38362 ?auto_38363 ?auto_38364 ?auto_38365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38435 - BLOCK
      ?auto_38436 - BLOCK
    )
    :vars
    (
      ?auto_38437 - BLOCK
      ?auto_38440 - BLOCK
      ?auto_38439 - BLOCK
      ?auto_38438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38435 ?auto_38436 ) ) ( ON ?auto_38436 ?auto_38437 ) ( not ( = ?auto_38435 ?auto_38437 ) ) ( not ( = ?auto_38436 ?auto_38437 ) ) ( ON ?auto_38435 ?auto_38436 ) ( CLEAR ?auto_38435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38440 ) ( ON ?auto_38439 ?auto_38440 ) ( ON ?auto_38438 ?auto_38439 ) ( ON ?auto_38437 ?auto_38438 ) ( not ( = ?auto_38440 ?auto_38439 ) ) ( not ( = ?auto_38440 ?auto_38438 ) ) ( not ( = ?auto_38440 ?auto_38437 ) ) ( not ( = ?auto_38440 ?auto_38436 ) ) ( not ( = ?auto_38440 ?auto_38435 ) ) ( not ( = ?auto_38439 ?auto_38438 ) ) ( not ( = ?auto_38439 ?auto_38437 ) ) ( not ( = ?auto_38439 ?auto_38436 ) ) ( not ( = ?auto_38439 ?auto_38435 ) ) ( not ( = ?auto_38438 ?auto_38437 ) ) ( not ( = ?auto_38438 ?auto_38436 ) ) ( not ( = ?auto_38438 ?auto_38435 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38440 ?auto_38439 ?auto_38438 ?auto_38437 ?auto_38436 )
      ( MAKE-2PILE ?auto_38435 ?auto_38436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38443 - BLOCK
      ?auto_38444 - BLOCK
    )
    :vars
    (
      ?auto_38445 - BLOCK
      ?auto_38446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38443 ?auto_38444 ) ) ( ON ?auto_38444 ?auto_38445 ) ( CLEAR ?auto_38444 ) ( not ( = ?auto_38443 ?auto_38445 ) ) ( not ( = ?auto_38444 ?auto_38445 ) ) ( ON ?auto_38443 ?auto_38446 ) ( CLEAR ?auto_38443 ) ( HAND-EMPTY ) ( not ( = ?auto_38443 ?auto_38446 ) ) ( not ( = ?auto_38444 ?auto_38446 ) ) ( not ( = ?auto_38445 ?auto_38446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38443 ?auto_38446 )
      ( MAKE-2PILE ?auto_38443 ?auto_38444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38447 - BLOCK
      ?auto_38448 - BLOCK
    )
    :vars
    (
      ?auto_38449 - BLOCK
      ?auto_38450 - BLOCK
      ?auto_38452 - BLOCK
      ?auto_38453 - BLOCK
      ?auto_38451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38447 ?auto_38448 ) ) ( not ( = ?auto_38447 ?auto_38449 ) ) ( not ( = ?auto_38448 ?auto_38449 ) ) ( ON ?auto_38447 ?auto_38450 ) ( CLEAR ?auto_38447 ) ( not ( = ?auto_38447 ?auto_38450 ) ) ( not ( = ?auto_38448 ?auto_38450 ) ) ( not ( = ?auto_38449 ?auto_38450 ) ) ( HOLDING ?auto_38448 ) ( CLEAR ?auto_38449 ) ( ON-TABLE ?auto_38452 ) ( ON ?auto_38453 ?auto_38452 ) ( ON ?auto_38451 ?auto_38453 ) ( ON ?auto_38449 ?auto_38451 ) ( not ( = ?auto_38452 ?auto_38453 ) ) ( not ( = ?auto_38452 ?auto_38451 ) ) ( not ( = ?auto_38452 ?auto_38449 ) ) ( not ( = ?auto_38452 ?auto_38448 ) ) ( not ( = ?auto_38453 ?auto_38451 ) ) ( not ( = ?auto_38453 ?auto_38449 ) ) ( not ( = ?auto_38453 ?auto_38448 ) ) ( not ( = ?auto_38451 ?auto_38449 ) ) ( not ( = ?auto_38451 ?auto_38448 ) ) ( not ( = ?auto_38447 ?auto_38452 ) ) ( not ( = ?auto_38447 ?auto_38453 ) ) ( not ( = ?auto_38447 ?auto_38451 ) ) ( not ( = ?auto_38450 ?auto_38452 ) ) ( not ( = ?auto_38450 ?auto_38453 ) ) ( not ( = ?auto_38450 ?auto_38451 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38452 ?auto_38453 ?auto_38451 ?auto_38449 ?auto_38448 )
      ( MAKE-2PILE ?auto_38447 ?auto_38448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38454 - BLOCK
      ?auto_38455 - BLOCK
    )
    :vars
    (
      ?auto_38460 - BLOCK
      ?auto_38457 - BLOCK
      ?auto_38458 - BLOCK
      ?auto_38459 - BLOCK
      ?auto_38456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38454 ?auto_38455 ) ) ( not ( = ?auto_38454 ?auto_38460 ) ) ( not ( = ?auto_38455 ?auto_38460 ) ) ( ON ?auto_38454 ?auto_38457 ) ( not ( = ?auto_38454 ?auto_38457 ) ) ( not ( = ?auto_38455 ?auto_38457 ) ) ( not ( = ?auto_38460 ?auto_38457 ) ) ( CLEAR ?auto_38460 ) ( ON-TABLE ?auto_38458 ) ( ON ?auto_38459 ?auto_38458 ) ( ON ?auto_38456 ?auto_38459 ) ( ON ?auto_38460 ?auto_38456 ) ( not ( = ?auto_38458 ?auto_38459 ) ) ( not ( = ?auto_38458 ?auto_38456 ) ) ( not ( = ?auto_38458 ?auto_38460 ) ) ( not ( = ?auto_38458 ?auto_38455 ) ) ( not ( = ?auto_38459 ?auto_38456 ) ) ( not ( = ?auto_38459 ?auto_38460 ) ) ( not ( = ?auto_38459 ?auto_38455 ) ) ( not ( = ?auto_38456 ?auto_38460 ) ) ( not ( = ?auto_38456 ?auto_38455 ) ) ( not ( = ?auto_38454 ?auto_38458 ) ) ( not ( = ?auto_38454 ?auto_38459 ) ) ( not ( = ?auto_38454 ?auto_38456 ) ) ( not ( = ?auto_38457 ?auto_38458 ) ) ( not ( = ?auto_38457 ?auto_38459 ) ) ( not ( = ?auto_38457 ?auto_38456 ) ) ( ON ?auto_38455 ?auto_38454 ) ( CLEAR ?auto_38455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38457 ?auto_38454 )
      ( MAKE-2PILE ?auto_38454 ?auto_38455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38461 - BLOCK
      ?auto_38462 - BLOCK
    )
    :vars
    (
      ?auto_38467 - BLOCK
      ?auto_38466 - BLOCK
      ?auto_38463 - BLOCK
      ?auto_38465 - BLOCK
      ?auto_38464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38461 ?auto_38462 ) ) ( not ( = ?auto_38461 ?auto_38467 ) ) ( not ( = ?auto_38462 ?auto_38467 ) ) ( ON ?auto_38461 ?auto_38466 ) ( not ( = ?auto_38461 ?auto_38466 ) ) ( not ( = ?auto_38462 ?auto_38466 ) ) ( not ( = ?auto_38467 ?auto_38466 ) ) ( ON-TABLE ?auto_38463 ) ( ON ?auto_38465 ?auto_38463 ) ( ON ?auto_38464 ?auto_38465 ) ( not ( = ?auto_38463 ?auto_38465 ) ) ( not ( = ?auto_38463 ?auto_38464 ) ) ( not ( = ?auto_38463 ?auto_38467 ) ) ( not ( = ?auto_38463 ?auto_38462 ) ) ( not ( = ?auto_38465 ?auto_38464 ) ) ( not ( = ?auto_38465 ?auto_38467 ) ) ( not ( = ?auto_38465 ?auto_38462 ) ) ( not ( = ?auto_38464 ?auto_38467 ) ) ( not ( = ?auto_38464 ?auto_38462 ) ) ( not ( = ?auto_38461 ?auto_38463 ) ) ( not ( = ?auto_38461 ?auto_38465 ) ) ( not ( = ?auto_38461 ?auto_38464 ) ) ( not ( = ?auto_38466 ?auto_38463 ) ) ( not ( = ?auto_38466 ?auto_38465 ) ) ( not ( = ?auto_38466 ?auto_38464 ) ) ( ON ?auto_38462 ?auto_38461 ) ( CLEAR ?auto_38462 ) ( ON-TABLE ?auto_38466 ) ( HOLDING ?auto_38467 ) ( CLEAR ?auto_38464 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38463 ?auto_38465 ?auto_38464 ?auto_38467 )
      ( MAKE-2PILE ?auto_38461 ?auto_38462 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38468 - BLOCK
      ?auto_38469 - BLOCK
    )
    :vars
    (
      ?auto_38470 - BLOCK
      ?auto_38473 - BLOCK
      ?auto_38472 - BLOCK
      ?auto_38471 - BLOCK
      ?auto_38474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38468 ?auto_38469 ) ) ( not ( = ?auto_38468 ?auto_38470 ) ) ( not ( = ?auto_38469 ?auto_38470 ) ) ( ON ?auto_38468 ?auto_38473 ) ( not ( = ?auto_38468 ?auto_38473 ) ) ( not ( = ?auto_38469 ?auto_38473 ) ) ( not ( = ?auto_38470 ?auto_38473 ) ) ( ON-TABLE ?auto_38472 ) ( ON ?auto_38471 ?auto_38472 ) ( ON ?auto_38474 ?auto_38471 ) ( not ( = ?auto_38472 ?auto_38471 ) ) ( not ( = ?auto_38472 ?auto_38474 ) ) ( not ( = ?auto_38472 ?auto_38470 ) ) ( not ( = ?auto_38472 ?auto_38469 ) ) ( not ( = ?auto_38471 ?auto_38474 ) ) ( not ( = ?auto_38471 ?auto_38470 ) ) ( not ( = ?auto_38471 ?auto_38469 ) ) ( not ( = ?auto_38474 ?auto_38470 ) ) ( not ( = ?auto_38474 ?auto_38469 ) ) ( not ( = ?auto_38468 ?auto_38472 ) ) ( not ( = ?auto_38468 ?auto_38471 ) ) ( not ( = ?auto_38468 ?auto_38474 ) ) ( not ( = ?auto_38473 ?auto_38472 ) ) ( not ( = ?auto_38473 ?auto_38471 ) ) ( not ( = ?auto_38473 ?auto_38474 ) ) ( ON ?auto_38469 ?auto_38468 ) ( ON-TABLE ?auto_38473 ) ( CLEAR ?auto_38474 ) ( ON ?auto_38470 ?auto_38469 ) ( CLEAR ?auto_38470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38473 ?auto_38468 ?auto_38469 )
      ( MAKE-2PILE ?auto_38468 ?auto_38469 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38475 - BLOCK
      ?auto_38476 - BLOCK
    )
    :vars
    (
      ?auto_38477 - BLOCK
      ?auto_38479 - BLOCK
      ?auto_38481 - BLOCK
      ?auto_38478 - BLOCK
      ?auto_38480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38475 ?auto_38476 ) ) ( not ( = ?auto_38475 ?auto_38477 ) ) ( not ( = ?auto_38476 ?auto_38477 ) ) ( ON ?auto_38475 ?auto_38479 ) ( not ( = ?auto_38475 ?auto_38479 ) ) ( not ( = ?auto_38476 ?auto_38479 ) ) ( not ( = ?auto_38477 ?auto_38479 ) ) ( ON-TABLE ?auto_38481 ) ( ON ?auto_38478 ?auto_38481 ) ( not ( = ?auto_38481 ?auto_38478 ) ) ( not ( = ?auto_38481 ?auto_38480 ) ) ( not ( = ?auto_38481 ?auto_38477 ) ) ( not ( = ?auto_38481 ?auto_38476 ) ) ( not ( = ?auto_38478 ?auto_38480 ) ) ( not ( = ?auto_38478 ?auto_38477 ) ) ( not ( = ?auto_38478 ?auto_38476 ) ) ( not ( = ?auto_38480 ?auto_38477 ) ) ( not ( = ?auto_38480 ?auto_38476 ) ) ( not ( = ?auto_38475 ?auto_38481 ) ) ( not ( = ?auto_38475 ?auto_38478 ) ) ( not ( = ?auto_38475 ?auto_38480 ) ) ( not ( = ?auto_38479 ?auto_38481 ) ) ( not ( = ?auto_38479 ?auto_38478 ) ) ( not ( = ?auto_38479 ?auto_38480 ) ) ( ON ?auto_38476 ?auto_38475 ) ( ON-TABLE ?auto_38479 ) ( ON ?auto_38477 ?auto_38476 ) ( CLEAR ?auto_38477 ) ( HOLDING ?auto_38480 ) ( CLEAR ?auto_38478 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38481 ?auto_38478 ?auto_38480 )
      ( MAKE-2PILE ?auto_38475 ?auto_38476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38482 - BLOCK
      ?auto_38483 - BLOCK
    )
    :vars
    (
      ?auto_38486 - BLOCK
      ?auto_38484 - BLOCK
      ?auto_38485 - BLOCK
      ?auto_38488 - BLOCK
      ?auto_38487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38482 ?auto_38483 ) ) ( not ( = ?auto_38482 ?auto_38486 ) ) ( not ( = ?auto_38483 ?auto_38486 ) ) ( ON ?auto_38482 ?auto_38484 ) ( not ( = ?auto_38482 ?auto_38484 ) ) ( not ( = ?auto_38483 ?auto_38484 ) ) ( not ( = ?auto_38486 ?auto_38484 ) ) ( ON-TABLE ?auto_38485 ) ( ON ?auto_38488 ?auto_38485 ) ( not ( = ?auto_38485 ?auto_38488 ) ) ( not ( = ?auto_38485 ?auto_38487 ) ) ( not ( = ?auto_38485 ?auto_38486 ) ) ( not ( = ?auto_38485 ?auto_38483 ) ) ( not ( = ?auto_38488 ?auto_38487 ) ) ( not ( = ?auto_38488 ?auto_38486 ) ) ( not ( = ?auto_38488 ?auto_38483 ) ) ( not ( = ?auto_38487 ?auto_38486 ) ) ( not ( = ?auto_38487 ?auto_38483 ) ) ( not ( = ?auto_38482 ?auto_38485 ) ) ( not ( = ?auto_38482 ?auto_38488 ) ) ( not ( = ?auto_38482 ?auto_38487 ) ) ( not ( = ?auto_38484 ?auto_38485 ) ) ( not ( = ?auto_38484 ?auto_38488 ) ) ( not ( = ?auto_38484 ?auto_38487 ) ) ( ON ?auto_38483 ?auto_38482 ) ( ON-TABLE ?auto_38484 ) ( ON ?auto_38486 ?auto_38483 ) ( CLEAR ?auto_38488 ) ( ON ?auto_38487 ?auto_38486 ) ( CLEAR ?auto_38487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38484 ?auto_38482 ?auto_38483 ?auto_38486 )
      ( MAKE-2PILE ?auto_38482 ?auto_38483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38489 - BLOCK
      ?auto_38490 - BLOCK
    )
    :vars
    (
      ?auto_38494 - BLOCK
      ?auto_38491 - BLOCK
      ?auto_38495 - BLOCK
      ?auto_38492 - BLOCK
      ?auto_38493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38489 ?auto_38490 ) ) ( not ( = ?auto_38489 ?auto_38494 ) ) ( not ( = ?auto_38490 ?auto_38494 ) ) ( ON ?auto_38489 ?auto_38491 ) ( not ( = ?auto_38489 ?auto_38491 ) ) ( not ( = ?auto_38490 ?auto_38491 ) ) ( not ( = ?auto_38494 ?auto_38491 ) ) ( ON-TABLE ?auto_38495 ) ( not ( = ?auto_38495 ?auto_38492 ) ) ( not ( = ?auto_38495 ?auto_38493 ) ) ( not ( = ?auto_38495 ?auto_38494 ) ) ( not ( = ?auto_38495 ?auto_38490 ) ) ( not ( = ?auto_38492 ?auto_38493 ) ) ( not ( = ?auto_38492 ?auto_38494 ) ) ( not ( = ?auto_38492 ?auto_38490 ) ) ( not ( = ?auto_38493 ?auto_38494 ) ) ( not ( = ?auto_38493 ?auto_38490 ) ) ( not ( = ?auto_38489 ?auto_38495 ) ) ( not ( = ?auto_38489 ?auto_38492 ) ) ( not ( = ?auto_38489 ?auto_38493 ) ) ( not ( = ?auto_38491 ?auto_38495 ) ) ( not ( = ?auto_38491 ?auto_38492 ) ) ( not ( = ?auto_38491 ?auto_38493 ) ) ( ON ?auto_38490 ?auto_38489 ) ( ON-TABLE ?auto_38491 ) ( ON ?auto_38494 ?auto_38490 ) ( ON ?auto_38493 ?auto_38494 ) ( CLEAR ?auto_38493 ) ( HOLDING ?auto_38492 ) ( CLEAR ?auto_38495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38495 ?auto_38492 )
      ( MAKE-2PILE ?auto_38489 ?auto_38490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38496 - BLOCK
      ?auto_38497 - BLOCK
    )
    :vars
    (
      ?auto_38498 - BLOCK
      ?auto_38502 - BLOCK
      ?auto_38501 - BLOCK
      ?auto_38500 - BLOCK
      ?auto_38499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38496 ?auto_38497 ) ) ( not ( = ?auto_38496 ?auto_38498 ) ) ( not ( = ?auto_38497 ?auto_38498 ) ) ( ON ?auto_38496 ?auto_38502 ) ( not ( = ?auto_38496 ?auto_38502 ) ) ( not ( = ?auto_38497 ?auto_38502 ) ) ( not ( = ?auto_38498 ?auto_38502 ) ) ( ON-TABLE ?auto_38501 ) ( not ( = ?auto_38501 ?auto_38500 ) ) ( not ( = ?auto_38501 ?auto_38499 ) ) ( not ( = ?auto_38501 ?auto_38498 ) ) ( not ( = ?auto_38501 ?auto_38497 ) ) ( not ( = ?auto_38500 ?auto_38499 ) ) ( not ( = ?auto_38500 ?auto_38498 ) ) ( not ( = ?auto_38500 ?auto_38497 ) ) ( not ( = ?auto_38499 ?auto_38498 ) ) ( not ( = ?auto_38499 ?auto_38497 ) ) ( not ( = ?auto_38496 ?auto_38501 ) ) ( not ( = ?auto_38496 ?auto_38500 ) ) ( not ( = ?auto_38496 ?auto_38499 ) ) ( not ( = ?auto_38502 ?auto_38501 ) ) ( not ( = ?auto_38502 ?auto_38500 ) ) ( not ( = ?auto_38502 ?auto_38499 ) ) ( ON ?auto_38497 ?auto_38496 ) ( ON-TABLE ?auto_38502 ) ( ON ?auto_38498 ?auto_38497 ) ( ON ?auto_38499 ?auto_38498 ) ( CLEAR ?auto_38501 ) ( ON ?auto_38500 ?auto_38499 ) ( CLEAR ?auto_38500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38502 ?auto_38496 ?auto_38497 ?auto_38498 ?auto_38499 )
      ( MAKE-2PILE ?auto_38496 ?auto_38497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38503 - BLOCK
      ?auto_38504 - BLOCK
    )
    :vars
    (
      ?auto_38508 - BLOCK
      ?auto_38507 - BLOCK
      ?auto_38505 - BLOCK
      ?auto_38509 - BLOCK
      ?auto_38506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38503 ?auto_38504 ) ) ( not ( = ?auto_38503 ?auto_38508 ) ) ( not ( = ?auto_38504 ?auto_38508 ) ) ( ON ?auto_38503 ?auto_38507 ) ( not ( = ?auto_38503 ?auto_38507 ) ) ( not ( = ?auto_38504 ?auto_38507 ) ) ( not ( = ?auto_38508 ?auto_38507 ) ) ( not ( = ?auto_38505 ?auto_38509 ) ) ( not ( = ?auto_38505 ?auto_38506 ) ) ( not ( = ?auto_38505 ?auto_38508 ) ) ( not ( = ?auto_38505 ?auto_38504 ) ) ( not ( = ?auto_38509 ?auto_38506 ) ) ( not ( = ?auto_38509 ?auto_38508 ) ) ( not ( = ?auto_38509 ?auto_38504 ) ) ( not ( = ?auto_38506 ?auto_38508 ) ) ( not ( = ?auto_38506 ?auto_38504 ) ) ( not ( = ?auto_38503 ?auto_38505 ) ) ( not ( = ?auto_38503 ?auto_38509 ) ) ( not ( = ?auto_38503 ?auto_38506 ) ) ( not ( = ?auto_38507 ?auto_38505 ) ) ( not ( = ?auto_38507 ?auto_38509 ) ) ( not ( = ?auto_38507 ?auto_38506 ) ) ( ON ?auto_38504 ?auto_38503 ) ( ON-TABLE ?auto_38507 ) ( ON ?auto_38508 ?auto_38504 ) ( ON ?auto_38506 ?auto_38508 ) ( ON ?auto_38509 ?auto_38506 ) ( CLEAR ?auto_38509 ) ( HOLDING ?auto_38505 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38505 )
      ( MAKE-2PILE ?auto_38503 ?auto_38504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38510 - BLOCK
      ?auto_38511 - BLOCK
    )
    :vars
    (
      ?auto_38514 - BLOCK
      ?auto_38516 - BLOCK
      ?auto_38513 - BLOCK
      ?auto_38515 - BLOCK
      ?auto_38512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38510 ?auto_38511 ) ) ( not ( = ?auto_38510 ?auto_38514 ) ) ( not ( = ?auto_38511 ?auto_38514 ) ) ( ON ?auto_38510 ?auto_38516 ) ( not ( = ?auto_38510 ?auto_38516 ) ) ( not ( = ?auto_38511 ?auto_38516 ) ) ( not ( = ?auto_38514 ?auto_38516 ) ) ( not ( = ?auto_38513 ?auto_38515 ) ) ( not ( = ?auto_38513 ?auto_38512 ) ) ( not ( = ?auto_38513 ?auto_38514 ) ) ( not ( = ?auto_38513 ?auto_38511 ) ) ( not ( = ?auto_38515 ?auto_38512 ) ) ( not ( = ?auto_38515 ?auto_38514 ) ) ( not ( = ?auto_38515 ?auto_38511 ) ) ( not ( = ?auto_38512 ?auto_38514 ) ) ( not ( = ?auto_38512 ?auto_38511 ) ) ( not ( = ?auto_38510 ?auto_38513 ) ) ( not ( = ?auto_38510 ?auto_38515 ) ) ( not ( = ?auto_38510 ?auto_38512 ) ) ( not ( = ?auto_38516 ?auto_38513 ) ) ( not ( = ?auto_38516 ?auto_38515 ) ) ( not ( = ?auto_38516 ?auto_38512 ) ) ( ON ?auto_38511 ?auto_38510 ) ( ON-TABLE ?auto_38516 ) ( ON ?auto_38514 ?auto_38511 ) ( ON ?auto_38512 ?auto_38514 ) ( ON ?auto_38515 ?auto_38512 ) ( ON ?auto_38513 ?auto_38515 ) ( CLEAR ?auto_38513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38516 ?auto_38510 ?auto_38511 ?auto_38514 ?auto_38512 ?auto_38515 )
      ( MAKE-2PILE ?auto_38510 ?auto_38511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38536 - BLOCK
      ?auto_38537 - BLOCK
      ?auto_38538 - BLOCK
    )
    :vars
    (
      ?auto_38540 - BLOCK
      ?auto_38539 - BLOCK
      ?auto_38541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38540 ?auto_38538 ) ( ON-TABLE ?auto_38536 ) ( ON ?auto_38537 ?auto_38536 ) ( ON ?auto_38538 ?auto_38537 ) ( not ( = ?auto_38536 ?auto_38537 ) ) ( not ( = ?auto_38536 ?auto_38538 ) ) ( not ( = ?auto_38536 ?auto_38540 ) ) ( not ( = ?auto_38537 ?auto_38538 ) ) ( not ( = ?auto_38537 ?auto_38540 ) ) ( not ( = ?auto_38538 ?auto_38540 ) ) ( not ( = ?auto_38536 ?auto_38539 ) ) ( not ( = ?auto_38536 ?auto_38541 ) ) ( not ( = ?auto_38537 ?auto_38539 ) ) ( not ( = ?auto_38537 ?auto_38541 ) ) ( not ( = ?auto_38538 ?auto_38539 ) ) ( not ( = ?auto_38538 ?auto_38541 ) ) ( not ( = ?auto_38540 ?auto_38539 ) ) ( not ( = ?auto_38540 ?auto_38541 ) ) ( not ( = ?auto_38539 ?auto_38541 ) ) ( ON ?auto_38539 ?auto_38540 ) ( CLEAR ?auto_38539 ) ( HOLDING ?auto_38541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38541 )
      ( MAKE-3PILE ?auto_38536 ?auto_38537 ?auto_38538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38601 - BLOCK
      ?auto_38602 - BLOCK
      ?auto_38603 - BLOCK
    )
    :vars
    (
      ?auto_38604 - BLOCK
      ?auto_38606 - BLOCK
      ?auto_38605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38601 ) ( not ( = ?auto_38601 ?auto_38602 ) ) ( not ( = ?auto_38601 ?auto_38603 ) ) ( not ( = ?auto_38602 ?auto_38603 ) ) ( ON ?auto_38603 ?auto_38604 ) ( not ( = ?auto_38601 ?auto_38604 ) ) ( not ( = ?auto_38602 ?auto_38604 ) ) ( not ( = ?auto_38603 ?auto_38604 ) ) ( CLEAR ?auto_38601 ) ( ON ?auto_38602 ?auto_38603 ) ( CLEAR ?auto_38602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38606 ) ( ON ?auto_38605 ?auto_38606 ) ( ON ?auto_38604 ?auto_38605 ) ( not ( = ?auto_38606 ?auto_38605 ) ) ( not ( = ?auto_38606 ?auto_38604 ) ) ( not ( = ?auto_38606 ?auto_38603 ) ) ( not ( = ?auto_38606 ?auto_38602 ) ) ( not ( = ?auto_38605 ?auto_38604 ) ) ( not ( = ?auto_38605 ?auto_38603 ) ) ( not ( = ?auto_38605 ?auto_38602 ) ) ( not ( = ?auto_38601 ?auto_38606 ) ) ( not ( = ?auto_38601 ?auto_38605 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38606 ?auto_38605 ?auto_38604 ?auto_38603 )
      ( MAKE-3PILE ?auto_38601 ?auto_38602 ?auto_38603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38607 - BLOCK
      ?auto_38608 - BLOCK
      ?auto_38609 - BLOCK
    )
    :vars
    (
      ?auto_38610 - BLOCK
      ?auto_38611 - BLOCK
      ?auto_38612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38607 ?auto_38608 ) ) ( not ( = ?auto_38607 ?auto_38609 ) ) ( not ( = ?auto_38608 ?auto_38609 ) ) ( ON ?auto_38609 ?auto_38610 ) ( not ( = ?auto_38607 ?auto_38610 ) ) ( not ( = ?auto_38608 ?auto_38610 ) ) ( not ( = ?auto_38609 ?auto_38610 ) ) ( ON ?auto_38608 ?auto_38609 ) ( CLEAR ?auto_38608 ) ( ON-TABLE ?auto_38611 ) ( ON ?auto_38612 ?auto_38611 ) ( ON ?auto_38610 ?auto_38612 ) ( not ( = ?auto_38611 ?auto_38612 ) ) ( not ( = ?auto_38611 ?auto_38610 ) ) ( not ( = ?auto_38611 ?auto_38609 ) ) ( not ( = ?auto_38611 ?auto_38608 ) ) ( not ( = ?auto_38612 ?auto_38610 ) ) ( not ( = ?auto_38612 ?auto_38609 ) ) ( not ( = ?auto_38612 ?auto_38608 ) ) ( not ( = ?auto_38607 ?auto_38611 ) ) ( not ( = ?auto_38607 ?auto_38612 ) ) ( HOLDING ?auto_38607 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38607 )
      ( MAKE-3PILE ?auto_38607 ?auto_38608 ?auto_38609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38613 - BLOCK
      ?auto_38614 - BLOCK
      ?auto_38615 - BLOCK
    )
    :vars
    (
      ?auto_38617 - BLOCK
      ?auto_38618 - BLOCK
      ?auto_38616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38613 ?auto_38614 ) ) ( not ( = ?auto_38613 ?auto_38615 ) ) ( not ( = ?auto_38614 ?auto_38615 ) ) ( ON ?auto_38615 ?auto_38617 ) ( not ( = ?auto_38613 ?auto_38617 ) ) ( not ( = ?auto_38614 ?auto_38617 ) ) ( not ( = ?auto_38615 ?auto_38617 ) ) ( ON ?auto_38614 ?auto_38615 ) ( ON-TABLE ?auto_38618 ) ( ON ?auto_38616 ?auto_38618 ) ( ON ?auto_38617 ?auto_38616 ) ( not ( = ?auto_38618 ?auto_38616 ) ) ( not ( = ?auto_38618 ?auto_38617 ) ) ( not ( = ?auto_38618 ?auto_38615 ) ) ( not ( = ?auto_38618 ?auto_38614 ) ) ( not ( = ?auto_38616 ?auto_38617 ) ) ( not ( = ?auto_38616 ?auto_38615 ) ) ( not ( = ?auto_38616 ?auto_38614 ) ) ( not ( = ?auto_38613 ?auto_38618 ) ) ( not ( = ?auto_38613 ?auto_38616 ) ) ( ON ?auto_38613 ?auto_38614 ) ( CLEAR ?auto_38613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38618 ?auto_38616 ?auto_38617 ?auto_38615 ?auto_38614 )
      ( MAKE-3PILE ?auto_38613 ?auto_38614 ?auto_38615 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38622 - BLOCK
      ?auto_38623 - BLOCK
      ?auto_38624 - BLOCK
    )
    :vars
    (
      ?auto_38625 - BLOCK
      ?auto_38627 - BLOCK
      ?auto_38626 - BLOCK
      ?auto_38628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38622 ?auto_38623 ) ) ( not ( = ?auto_38622 ?auto_38624 ) ) ( not ( = ?auto_38623 ?auto_38624 ) ) ( ON ?auto_38624 ?auto_38625 ) ( not ( = ?auto_38622 ?auto_38625 ) ) ( not ( = ?auto_38623 ?auto_38625 ) ) ( not ( = ?auto_38624 ?auto_38625 ) ) ( ON ?auto_38623 ?auto_38624 ) ( CLEAR ?auto_38623 ) ( ON-TABLE ?auto_38627 ) ( ON ?auto_38626 ?auto_38627 ) ( ON ?auto_38625 ?auto_38626 ) ( not ( = ?auto_38627 ?auto_38626 ) ) ( not ( = ?auto_38627 ?auto_38625 ) ) ( not ( = ?auto_38627 ?auto_38624 ) ) ( not ( = ?auto_38627 ?auto_38623 ) ) ( not ( = ?auto_38626 ?auto_38625 ) ) ( not ( = ?auto_38626 ?auto_38624 ) ) ( not ( = ?auto_38626 ?auto_38623 ) ) ( not ( = ?auto_38622 ?auto_38627 ) ) ( not ( = ?auto_38622 ?auto_38626 ) ) ( ON ?auto_38622 ?auto_38628 ) ( CLEAR ?auto_38622 ) ( HAND-EMPTY ) ( not ( = ?auto_38622 ?auto_38628 ) ) ( not ( = ?auto_38623 ?auto_38628 ) ) ( not ( = ?auto_38624 ?auto_38628 ) ) ( not ( = ?auto_38625 ?auto_38628 ) ) ( not ( = ?auto_38627 ?auto_38628 ) ) ( not ( = ?auto_38626 ?auto_38628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38622 ?auto_38628 )
      ( MAKE-3PILE ?auto_38622 ?auto_38623 ?auto_38624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38629 - BLOCK
      ?auto_38630 - BLOCK
      ?auto_38631 - BLOCK
    )
    :vars
    (
      ?auto_38633 - BLOCK
      ?auto_38635 - BLOCK
      ?auto_38632 - BLOCK
      ?auto_38634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38629 ?auto_38630 ) ) ( not ( = ?auto_38629 ?auto_38631 ) ) ( not ( = ?auto_38630 ?auto_38631 ) ) ( ON ?auto_38631 ?auto_38633 ) ( not ( = ?auto_38629 ?auto_38633 ) ) ( not ( = ?auto_38630 ?auto_38633 ) ) ( not ( = ?auto_38631 ?auto_38633 ) ) ( ON-TABLE ?auto_38635 ) ( ON ?auto_38632 ?auto_38635 ) ( ON ?auto_38633 ?auto_38632 ) ( not ( = ?auto_38635 ?auto_38632 ) ) ( not ( = ?auto_38635 ?auto_38633 ) ) ( not ( = ?auto_38635 ?auto_38631 ) ) ( not ( = ?auto_38635 ?auto_38630 ) ) ( not ( = ?auto_38632 ?auto_38633 ) ) ( not ( = ?auto_38632 ?auto_38631 ) ) ( not ( = ?auto_38632 ?auto_38630 ) ) ( not ( = ?auto_38629 ?auto_38635 ) ) ( not ( = ?auto_38629 ?auto_38632 ) ) ( ON ?auto_38629 ?auto_38634 ) ( CLEAR ?auto_38629 ) ( not ( = ?auto_38629 ?auto_38634 ) ) ( not ( = ?auto_38630 ?auto_38634 ) ) ( not ( = ?auto_38631 ?auto_38634 ) ) ( not ( = ?auto_38633 ?auto_38634 ) ) ( not ( = ?auto_38635 ?auto_38634 ) ) ( not ( = ?auto_38632 ?auto_38634 ) ) ( HOLDING ?auto_38630 ) ( CLEAR ?auto_38631 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38635 ?auto_38632 ?auto_38633 ?auto_38631 ?auto_38630 )
      ( MAKE-3PILE ?auto_38629 ?auto_38630 ?auto_38631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38636 - BLOCK
      ?auto_38637 - BLOCK
      ?auto_38638 - BLOCK
    )
    :vars
    (
      ?auto_38639 - BLOCK
      ?auto_38641 - BLOCK
      ?auto_38642 - BLOCK
      ?auto_38640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38636 ?auto_38637 ) ) ( not ( = ?auto_38636 ?auto_38638 ) ) ( not ( = ?auto_38637 ?auto_38638 ) ) ( ON ?auto_38638 ?auto_38639 ) ( not ( = ?auto_38636 ?auto_38639 ) ) ( not ( = ?auto_38637 ?auto_38639 ) ) ( not ( = ?auto_38638 ?auto_38639 ) ) ( ON-TABLE ?auto_38641 ) ( ON ?auto_38642 ?auto_38641 ) ( ON ?auto_38639 ?auto_38642 ) ( not ( = ?auto_38641 ?auto_38642 ) ) ( not ( = ?auto_38641 ?auto_38639 ) ) ( not ( = ?auto_38641 ?auto_38638 ) ) ( not ( = ?auto_38641 ?auto_38637 ) ) ( not ( = ?auto_38642 ?auto_38639 ) ) ( not ( = ?auto_38642 ?auto_38638 ) ) ( not ( = ?auto_38642 ?auto_38637 ) ) ( not ( = ?auto_38636 ?auto_38641 ) ) ( not ( = ?auto_38636 ?auto_38642 ) ) ( ON ?auto_38636 ?auto_38640 ) ( not ( = ?auto_38636 ?auto_38640 ) ) ( not ( = ?auto_38637 ?auto_38640 ) ) ( not ( = ?auto_38638 ?auto_38640 ) ) ( not ( = ?auto_38639 ?auto_38640 ) ) ( not ( = ?auto_38641 ?auto_38640 ) ) ( not ( = ?auto_38642 ?auto_38640 ) ) ( CLEAR ?auto_38638 ) ( ON ?auto_38637 ?auto_38636 ) ( CLEAR ?auto_38637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38640 ?auto_38636 )
      ( MAKE-3PILE ?auto_38636 ?auto_38637 ?auto_38638 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38643 - BLOCK
      ?auto_38644 - BLOCK
      ?auto_38645 - BLOCK
    )
    :vars
    (
      ?auto_38646 - BLOCK
      ?auto_38649 - BLOCK
      ?auto_38648 - BLOCK
      ?auto_38647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38643 ?auto_38644 ) ) ( not ( = ?auto_38643 ?auto_38645 ) ) ( not ( = ?auto_38644 ?auto_38645 ) ) ( not ( = ?auto_38643 ?auto_38646 ) ) ( not ( = ?auto_38644 ?auto_38646 ) ) ( not ( = ?auto_38645 ?auto_38646 ) ) ( ON-TABLE ?auto_38649 ) ( ON ?auto_38648 ?auto_38649 ) ( ON ?auto_38646 ?auto_38648 ) ( not ( = ?auto_38649 ?auto_38648 ) ) ( not ( = ?auto_38649 ?auto_38646 ) ) ( not ( = ?auto_38649 ?auto_38645 ) ) ( not ( = ?auto_38649 ?auto_38644 ) ) ( not ( = ?auto_38648 ?auto_38646 ) ) ( not ( = ?auto_38648 ?auto_38645 ) ) ( not ( = ?auto_38648 ?auto_38644 ) ) ( not ( = ?auto_38643 ?auto_38649 ) ) ( not ( = ?auto_38643 ?auto_38648 ) ) ( ON ?auto_38643 ?auto_38647 ) ( not ( = ?auto_38643 ?auto_38647 ) ) ( not ( = ?auto_38644 ?auto_38647 ) ) ( not ( = ?auto_38645 ?auto_38647 ) ) ( not ( = ?auto_38646 ?auto_38647 ) ) ( not ( = ?auto_38649 ?auto_38647 ) ) ( not ( = ?auto_38648 ?auto_38647 ) ) ( ON ?auto_38644 ?auto_38643 ) ( CLEAR ?auto_38644 ) ( ON-TABLE ?auto_38647 ) ( HOLDING ?auto_38645 ) ( CLEAR ?auto_38646 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38649 ?auto_38648 ?auto_38646 ?auto_38645 )
      ( MAKE-3PILE ?auto_38643 ?auto_38644 ?auto_38645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38650 - BLOCK
      ?auto_38651 - BLOCK
      ?auto_38652 - BLOCK
    )
    :vars
    (
      ?auto_38654 - BLOCK
      ?auto_38655 - BLOCK
      ?auto_38656 - BLOCK
      ?auto_38653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38650 ?auto_38651 ) ) ( not ( = ?auto_38650 ?auto_38652 ) ) ( not ( = ?auto_38651 ?auto_38652 ) ) ( not ( = ?auto_38650 ?auto_38654 ) ) ( not ( = ?auto_38651 ?auto_38654 ) ) ( not ( = ?auto_38652 ?auto_38654 ) ) ( ON-TABLE ?auto_38655 ) ( ON ?auto_38656 ?auto_38655 ) ( ON ?auto_38654 ?auto_38656 ) ( not ( = ?auto_38655 ?auto_38656 ) ) ( not ( = ?auto_38655 ?auto_38654 ) ) ( not ( = ?auto_38655 ?auto_38652 ) ) ( not ( = ?auto_38655 ?auto_38651 ) ) ( not ( = ?auto_38656 ?auto_38654 ) ) ( not ( = ?auto_38656 ?auto_38652 ) ) ( not ( = ?auto_38656 ?auto_38651 ) ) ( not ( = ?auto_38650 ?auto_38655 ) ) ( not ( = ?auto_38650 ?auto_38656 ) ) ( ON ?auto_38650 ?auto_38653 ) ( not ( = ?auto_38650 ?auto_38653 ) ) ( not ( = ?auto_38651 ?auto_38653 ) ) ( not ( = ?auto_38652 ?auto_38653 ) ) ( not ( = ?auto_38654 ?auto_38653 ) ) ( not ( = ?auto_38655 ?auto_38653 ) ) ( not ( = ?auto_38656 ?auto_38653 ) ) ( ON ?auto_38651 ?auto_38650 ) ( ON-TABLE ?auto_38653 ) ( CLEAR ?auto_38654 ) ( ON ?auto_38652 ?auto_38651 ) ( CLEAR ?auto_38652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38653 ?auto_38650 ?auto_38651 )
      ( MAKE-3PILE ?auto_38650 ?auto_38651 ?auto_38652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38657 - BLOCK
      ?auto_38658 - BLOCK
      ?auto_38659 - BLOCK
    )
    :vars
    (
      ?auto_38663 - BLOCK
      ?auto_38662 - BLOCK
      ?auto_38660 - BLOCK
      ?auto_38661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38657 ?auto_38658 ) ) ( not ( = ?auto_38657 ?auto_38659 ) ) ( not ( = ?auto_38658 ?auto_38659 ) ) ( not ( = ?auto_38657 ?auto_38663 ) ) ( not ( = ?auto_38658 ?auto_38663 ) ) ( not ( = ?auto_38659 ?auto_38663 ) ) ( ON-TABLE ?auto_38662 ) ( ON ?auto_38660 ?auto_38662 ) ( not ( = ?auto_38662 ?auto_38660 ) ) ( not ( = ?auto_38662 ?auto_38663 ) ) ( not ( = ?auto_38662 ?auto_38659 ) ) ( not ( = ?auto_38662 ?auto_38658 ) ) ( not ( = ?auto_38660 ?auto_38663 ) ) ( not ( = ?auto_38660 ?auto_38659 ) ) ( not ( = ?auto_38660 ?auto_38658 ) ) ( not ( = ?auto_38657 ?auto_38662 ) ) ( not ( = ?auto_38657 ?auto_38660 ) ) ( ON ?auto_38657 ?auto_38661 ) ( not ( = ?auto_38657 ?auto_38661 ) ) ( not ( = ?auto_38658 ?auto_38661 ) ) ( not ( = ?auto_38659 ?auto_38661 ) ) ( not ( = ?auto_38663 ?auto_38661 ) ) ( not ( = ?auto_38662 ?auto_38661 ) ) ( not ( = ?auto_38660 ?auto_38661 ) ) ( ON ?auto_38658 ?auto_38657 ) ( ON-TABLE ?auto_38661 ) ( ON ?auto_38659 ?auto_38658 ) ( CLEAR ?auto_38659 ) ( HOLDING ?auto_38663 ) ( CLEAR ?auto_38660 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38662 ?auto_38660 ?auto_38663 )
      ( MAKE-3PILE ?auto_38657 ?auto_38658 ?auto_38659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38664 - BLOCK
      ?auto_38665 - BLOCK
      ?auto_38666 - BLOCK
    )
    :vars
    (
      ?auto_38668 - BLOCK
      ?auto_38669 - BLOCK
      ?auto_38667 - BLOCK
      ?auto_38670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38664 ?auto_38665 ) ) ( not ( = ?auto_38664 ?auto_38666 ) ) ( not ( = ?auto_38665 ?auto_38666 ) ) ( not ( = ?auto_38664 ?auto_38668 ) ) ( not ( = ?auto_38665 ?auto_38668 ) ) ( not ( = ?auto_38666 ?auto_38668 ) ) ( ON-TABLE ?auto_38669 ) ( ON ?auto_38667 ?auto_38669 ) ( not ( = ?auto_38669 ?auto_38667 ) ) ( not ( = ?auto_38669 ?auto_38668 ) ) ( not ( = ?auto_38669 ?auto_38666 ) ) ( not ( = ?auto_38669 ?auto_38665 ) ) ( not ( = ?auto_38667 ?auto_38668 ) ) ( not ( = ?auto_38667 ?auto_38666 ) ) ( not ( = ?auto_38667 ?auto_38665 ) ) ( not ( = ?auto_38664 ?auto_38669 ) ) ( not ( = ?auto_38664 ?auto_38667 ) ) ( ON ?auto_38664 ?auto_38670 ) ( not ( = ?auto_38664 ?auto_38670 ) ) ( not ( = ?auto_38665 ?auto_38670 ) ) ( not ( = ?auto_38666 ?auto_38670 ) ) ( not ( = ?auto_38668 ?auto_38670 ) ) ( not ( = ?auto_38669 ?auto_38670 ) ) ( not ( = ?auto_38667 ?auto_38670 ) ) ( ON ?auto_38665 ?auto_38664 ) ( ON-TABLE ?auto_38670 ) ( ON ?auto_38666 ?auto_38665 ) ( CLEAR ?auto_38667 ) ( ON ?auto_38668 ?auto_38666 ) ( CLEAR ?auto_38668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38670 ?auto_38664 ?auto_38665 ?auto_38666 )
      ( MAKE-3PILE ?auto_38664 ?auto_38665 ?auto_38666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38671 - BLOCK
      ?auto_38672 - BLOCK
      ?auto_38673 - BLOCK
    )
    :vars
    (
      ?auto_38676 - BLOCK
      ?auto_38675 - BLOCK
      ?auto_38674 - BLOCK
      ?auto_38677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38671 ?auto_38672 ) ) ( not ( = ?auto_38671 ?auto_38673 ) ) ( not ( = ?auto_38672 ?auto_38673 ) ) ( not ( = ?auto_38671 ?auto_38676 ) ) ( not ( = ?auto_38672 ?auto_38676 ) ) ( not ( = ?auto_38673 ?auto_38676 ) ) ( ON-TABLE ?auto_38675 ) ( not ( = ?auto_38675 ?auto_38674 ) ) ( not ( = ?auto_38675 ?auto_38676 ) ) ( not ( = ?auto_38675 ?auto_38673 ) ) ( not ( = ?auto_38675 ?auto_38672 ) ) ( not ( = ?auto_38674 ?auto_38676 ) ) ( not ( = ?auto_38674 ?auto_38673 ) ) ( not ( = ?auto_38674 ?auto_38672 ) ) ( not ( = ?auto_38671 ?auto_38675 ) ) ( not ( = ?auto_38671 ?auto_38674 ) ) ( ON ?auto_38671 ?auto_38677 ) ( not ( = ?auto_38671 ?auto_38677 ) ) ( not ( = ?auto_38672 ?auto_38677 ) ) ( not ( = ?auto_38673 ?auto_38677 ) ) ( not ( = ?auto_38676 ?auto_38677 ) ) ( not ( = ?auto_38675 ?auto_38677 ) ) ( not ( = ?auto_38674 ?auto_38677 ) ) ( ON ?auto_38672 ?auto_38671 ) ( ON-TABLE ?auto_38677 ) ( ON ?auto_38673 ?auto_38672 ) ( ON ?auto_38676 ?auto_38673 ) ( CLEAR ?auto_38676 ) ( HOLDING ?auto_38674 ) ( CLEAR ?auto_38675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38675 ?auto_38674 )
      ( MAKE-3PILE ?auto_38671 ?auto_38672 ?auto_38673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38678 - BLOCK
      ?auto_38679 - BLOCK
      ?auto_38680 - BLOCK
    )
    :vars
    (
      ?auto_38684 - BLOCK
      ?auto_38681 - BLOCK
      ?auto_38682 - BLOCK
      ?auto_38683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38678 ?auto_38679 ) ) ( not ( = ?auto_38678 ?auto_38680 ) ) ( not ( = ?auto_38679 ?auto_38680 ) ) ( not ( = ?auto_38678 ?auto_38684 ) ) ( not ( = ?auto_38679 ?auto_38684 ) ) ( not ( = ?auto_38680 ?auto_38684 ) ) ( ON-TABLE ?auto_38681 ) ( not ( = ?auto_38681 ?auto_38682 ) ) ( not ( = ?auto_38681 ?auto_38684 ) ) ( not ( = ?auto_38681 ?auto_38680 ) ) ( not ( = ?auto_38681 ?auto_38679 ) ) ( not ( = ?auto_38682 ?auto_38684 ) ) ( not ( = ?auto_38682 ?auto_38680 ) ) ( not ( = ?auto_38682 ?auto_38679 ) ) ( not ( = ?auto_38678 ?auto_38681 ) ) ( not ( = ?auto_38678 ?auto_38682 ) ) ( ON ?auto_38678 ?auto_38683 ) ( not ( = ?auto_38678 ?auto_38683 ) ) ( not ( = ?auto_38679 ?auto_38683 ) ) ( not ( = ?auto_38680 ?auto_38683 ) ) ( not ( = ?auto_38684 ?auto_38683 ) ) ( not ( = ?auto_38681 ?auto_38683 ) ) ( not ( = ?auto_38682 ?auto_38683 ) ) ( ON ?auto_38679 ?auto_38678 ) ( ON-TABLE ?auto_38683 ) ( ON ?auto_38680 ?auto_38679 ) ( ON ?auto_38684 ?auto_38680 ) ( CLEAR ?auto_38681 ) ( ON ?auto_38682 ?auto_38684 ) ( CLEAR ?auto_38682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38683 ?auto_38678 ?auto_38679 ?auto_38680 ?auto_38684 )
      ( MAKE-3PILE ?auto_38678 ?auto_38679 ?auto_38680 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38685 - BLOCK
      ?auto_38686 - BLOCK
      ?auto_38687 - BLOCK
    )
    :vars
    (
      ?auto_38690 - BLOCK
      ?auto_38688 - BLOCK
      ?auto_38689 - BLOCK
      ?auto_38691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38685 ?auto_38686 ) ) ( not ( = ?auto_38685 ?auto_38687 ) ) ( not ( = ?auto_38686 ?auto_38687 ) ) ( not ( = ?auto_38685 ?auto_38690 ) ) ( not ( = ?auto_38686 ?auto_38690 ) ) ( not ( = ?auto_38687 ?auto_38690 ) ) ( not ( = ?auto_38688 ?auto_38689 ) ) ( not ( = ?auto_38688 ?auto_38690 ) ) ( not ( = ?auto_38688 ?auto_38687 ) ) ( not ( = ?auto_38688 ?auto_38686 ) ) ( not ( = ?auto_38689 ?auto_38690 ) ) ( not ( = ?auto_38689 ?auto_38687 ) ) ( not ( = ?auto_38689 ?auto_38686 ) ) ( not ( = ?auto_38685 ?auto_38688 ) ) ( not ( = ?auto_38685 ?auto_38689 ) ) ( ON ?auto_38685 ?auto_38691 ) ( not ( = ?auto_38685 ?auto_38691 ) ) ( not ( = ?auto_38686 ?auto_38691 ) ) ( not ( = ?auto_38687 ?auto_38691 ) ) ( not ( = ?auto_38690 ?auto_38691 ) ) ( not ( = ?auto_38688 ?auto_38691 ) ) ( not ( = ?auto_38689 ?auto_38691 ) ) ( ON ?auto_38686 ?auto_38685 ) ( ON-TABLE ?auto_38691 ) ( ON ?auto_38687 ?auto_38686 ) ( ON ?auto_38690 ?auto_38687 ) ( ON ?auto_38689 ?auto_38690 ) ( CLEAR ?auto_38689 ) ( HOLDING ?auto_38688 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38688 )
      ( MAKE-3PILE ?auto_38685 ?auto_38686 ?auto_38687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38692 - BLOCK
      ?auto_38693 - BLOCK
      ?auto_38694 - BLOCK
    )
    :vars
    (
      ?auto_38697 - BLOCK
      ?auto_38695 - BLOCK
      ?auto_38696 - BLOCK
      ?auto_38698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38692 ?auto_38693 ) ) ( not ( = ?auto_38692 ?auto_38694 ) ) ( not ( = ?auto_38693 ?auto_38694 ) ) ( not ( = ?auto_38692 ?auto_38697 ) ) ( not ( = ?auto_38693 ?auto_38697 ) ) ( not ( = ?auto_38694 ?auto_38697 ) ) ( not ( = ?auto_38695 ?auto_38696 ) ) ( not ( = ?auto_38695 ?auto_38697 ) ) ( not ( = ?auto_38695 ?auto_38694 ) ) ( not ( = ?auto_38695 ?auto_38693 ) ) ( not ( = ?auto_38696 ?auto_38697 ) ) ( not ( = ?auto_38696 ?auto_38694 ) ) ( not ( = ?auto_38696 ?auto_38693 ) ) ( not ( = ?auto_38692 ?auto_38695 ) ) ( not ( = ?auto_38692 ?auto_38696 ) ) ( ON ?auto_38692 ?auto_38698 ) ( not ( = ?auto_38692 ?auto_38698 ) ) ( not ( = ?auto_38693 ?auto_38698 ) ) ( not ( = ?auto_38694 ?auto_38698 ) ) ( not ( = ?auto_38697 ?auto_38698 ) ) ( not ( = ?auto_38695 ?auto_38698 ) ) ( not ( = ?auto_38696 ?auto_38698 ) ) ( ON ?auto_38693 ?auto_38692 ) ( ON-TABLE ?auto_38698 ) ( ON ?auto_38694 ?auto_38693 ) ( ON ?auto_38697 ?auto_38694 ) ( ON ?auto_38696 ?auto_38697 ) ( ON ?auto_38695 ?auto_38696 ) ( CLEAR ?auto_38695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38698 ?auto_38692 ?auto_38693 ?auto_38694 ?auto_38697 ?auto_38696 )
      ( MAKE-3PILE ?auto_38692 ?auto_38693 ?auto_38694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38714 - BLOCK
      ?auto_38715 - BLOCK
    )
    :vars
    (
      ?auto_38716 - BLOCK
      ?auto_38717 - BLOCK
      ?auto_38718 - BLOCK
      ?auto_38719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38716 ?auto_38715 ) ( ON-TABLE ?auto_38714 ) ( ON ?auto_38715 ?auto_38714 ) ( not ( = ?auto_38714 ?auto_38715 ) ) ( not ( = ?auto_38714 ?auto_38716 ) ) ( not ( = ?auto_38715 ?auto_38716 ) ) ( not ( = ?auto_38714 ?auto_38717 ) ) ( not ( = ?auto_38714 ?auto_38718 ) ) ( not ( = ?auto_38715 ?auto_38717 ) ) ( not ( = ?auto_38715 ?auto_38718 ) ) ( not ( = ?auto_38716 ?auto_38717 ) ) ( not ( = ?auto_38716 ?auto_38718 ) ) ( not ( = ?auto_38717 ?auto_38718 ) ) ( ON ?auto_38717 ?auto_38716 ) ( CLEAR ?auto_38717 ) ( HOLDING ?auto_38718 ) ( CLEAR ?auto_38719 ) ( ON-TABLE ?auto_38719 ) ( not ( = ?auto_38719 ?auto_38718 ) ) ( not ( = ?auto_38714 ?auto_38719 ) ) ( not ( = ?auto_38715 ?auto_38719 ) ) ( not ( = ?auto_38716 ?auto_38719 ) ) ( not ( = ?auto_38717 ?auto_38719 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38719 ?auto_38718 )
      ( MAKE-2PILE ?auto_38714 ?auto_38715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38720 - BLOCK
      ?auto_38721 - BLOCK
    )
    :vars
    (
      ?auto_38723 - BLOCK
      ?auto_38722 - BLOCK
      ?auto_38725 - BLOCK
      ?auto_38724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38723 ?auto_38721 ) ( ON-TABLE ?auto_38720 ) ( ON ?auto_38721 ?auto_38720 ) ( not ( = ?auto_38720 ?auto_38721 ) ) ( not ( = ?auto_38720 ?auto_38723 ) ) ( not ( = ?auto_38721 ?auto_38723 ) ) ( not ( = ?auto_38720 ?auto_38722 ) ) ( not ( = ?auto_38720 ?auto_38725 ) ) ( not ( = ?auto_38721 ?auto_38722 ) ) ( not ( = ?auto_38721 ?auto_38725 ) ) ( not ( = ?auto_38723 ?auto_38722 ) ) ( not ( = ?auto_38723 ?auto_38725 ) ) ( not ( = ?auto_38722 ?auto_38725 ) ) ( ON ?auto_38722 ?auto_38723 ) ( CLEAR ?auto_38724 ) ( ON-TABLE ?auto_38724 ) ( not ( = ?auto_38724 ?auto_38725 ) ) ( not ( = ?auto_38720 ?auto_38724 ) ) ( not ( = ?auto_38721 ?auto_38724 ) ) ( not ( = ?auto_38723 ?auto_38724 ) ) ( not ( = ?auto_38722 ?auto_38724 ) ) ( ON ?auto_38725 ?auto_38722 ) ( CLEAR ?auto_38725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38720 ?auto_38721 ?auto_38723 ?auto_38722 )
      ( MAKE-2PILE ?auto_38720 ?auto_38721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38726 - BLOCK
      ?auto_38727 - BLOCK
    )
    :vars
    (
      ?auto_38731 - BLOCK
      ?auto_38729 - BLOCK
      ?auto_38728 - BLOCK
      ?auto_38730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38731 ?auto_38727 ) ( ON-TABLE ?auto_38726 ) ( ON ?auto_38727 ?auto_38726 ) ( not ( = ?auto_38726 ?auto_38727 ) ) ( not ( = ?auto_38726 ?auto_38731 ) ) ( not ( = ?auto_38727 ?auto_38731 ) ) ( not ( = ?auto_38726 ?auto_38729 ) ) ( not ( = ?auto_38726 ?auto_38728 ) ) ( not ( = ?auto_38727 ?auto_38729 ) ) ( not ( = ?auto_38727 ?auto_38728 ) ) ( not ( = ?auto_38731 ?auto_38729 ) ) ( not ( = ?auto_38731 ?auto_38728 ) ) ( not ( = ?auto_38729 ?auto_38728 ) ) ( ON ?auto_38729 ?auto_38731 ) ( not ( = ?auto_38730 ?auto_38728 ) ) ( not ( = ?auto_38726 ?auto_38730 ) ) ( not ( = ?auto_38727 ?auto_38730 ) ) ( not ( = ?auto_38731 ?auto_38730 ) ) ( not ( = ?auto_38729 ?auto_38730 ) ) ( ON ?auto_38728 ?auto_38729 ) ( CLEAR ?auto_38728 ) ( HOLDING ?auto_38730 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38730 )
      ( MAKE-2PILE ?auto_38726 ?auto_38727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38740 - BLOCK
      ?auto_38741 - BLOCK
    )
    :vars
    (
      ?auto_38744 - BLOCK
      ?auto_38743 - BLOCK
      ?auto_38745 - BLOCK
      ?auto_38742 - BLOCK
      ?auto_38746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38744 ?auto_38741 ) ( ON-TABLE ?auto_38740 ) ( ON ?auto_38741 ?auto_38740 ) ( not ( = ?auto_38740 ?auto_38741 ) ) ( not ( = ?auto_38740 ?auto_38744 ) ) ( not ( = ?auto_38741 ?auto_38744 ) ) ( not ( = ?auto_38740 ?auto_38743 ) ) ( not ( = ?auto_38740 ?auto_38745 ) ) ( not ( = ?auto_38741 ?auto_38743 ) ) ( not ( = ?auto_38741 ?auto_38745 ) ) ( not ( = ?auto_38744 ?auto_38743 ) ) ( not ( = ?auto_38744 ?auto_38745 ) ) ( not ( = ?auto_38743 ?auto_38745 ) ) ( ON ?auto_38743 ?auto_38744 ) ( not ( = ?auto_38742 ?auto_38745 ) ) ( not ( = ?auto_38740 ?auto_38742 ) ) ( not ( = ?auto_38741 ?auto_38742 ) ) ( not ( = ?auto_38744 ?auto_38742 ) ) ( not ( = ?auto_38743 ?auto_38742 ) ) ( ON ?auto_38745 ?auto_38743 ) ( CLEAR ?auto_38745 ) ( ON ?auto_38742 ?auto_38746 ) ( CLEAR ?auto_38742 ) ( HAND-EMPTY ) ( not ( = ?auto_38740 ?auto_38746 ) ) ( not ( = ?auto_38741 ?auto_38746 ) ) ( not ( = ?auto_38744 ?auto_38746 ) ) ( not ( = ?auto_38743 ?auto_38746 ) ) ( not ( = ?auto_38745 ?auto_38746 ) ) ( not ( = ?auto_38742 ?auto_38746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38742 ?auto_38746 )
      ( MAKE-2PILE ?auto_38740 ?auto_38741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38747 - BLOCK
      ?auto_38748 - BLOCK
    )
    :vars
    (
      ?auto_38752 - BLOCK
      ?auto_38750 - BLOCK
      ?auto_38751 - BLOCK
      ?auto_38753 - BLOCK
      ?auto_38749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38752 ?auto_38748 ) ( ON-TABLE ?auto_38747 ) ( ON ?auto_38748 ?auto_38747 ) ( not ( = ?auto_38747 ?auto_38748 ) ) ( not ( = ?auto_38747 ?auto_38752 ) ) ( not ( = ?auto_38748 ?auto_38752 ) ) ( not ( = ?auto_38747 ?auto_38750 ) ) ( not ( = ?auto_38747 ?auto_38751 ) ) ( not ( = ?auto_38748 ?auto_38750 ) ) ( not ( = ?auto_38748 ?auto_38751 ) ) ( not ( = ?auto_38752 ?auto_38750 ) ) ( not ( = ?auto_38752 ?auto_38751 ) ) ( not ( = ?auto_38750 ?auto_38751 ) ) ( ON ?auto_38750 ?auto_38752 ) ( not ( = ?auto_38753 ?auto_38751 ) ) ( not ( = ?auto_38747 ?auto_38753 ) ) ( not ( = ?auto_38748 ?auto_38753 ) ) ( not ( = ?auto_38752 ?auto_38753 ) ) ( not ( = ?auto_38750 ?auto_38753 ) ) ( ON ?auto_38753 ?auto_38749 ) ( CLEAR ?auto_38753 ) ( not ( = ?auto_38747 ?auto_38749 ) ) ( not ( = ?auto_38748 ?auto_38749 ) ) ( not ( = ?auto_38752 ?auto_38749 ) ) ( not ( = ?auto_38750 ?auto_38749 ) ) ( not ( = ?auto_38751 ?auto_38749 ) ) ( not ( = ?auto_38753 ?auto_38749 ) ) ( HOLDING ?auto_38751 ) ( CLEAR ?auto_38750 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38747 ?auto_38748 ?auto_38752 ?auto_38750 ?auto_38751 )
      ( MAKE-2PILE ?auto_38747 ?auto_38748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38793 - BLOCK
      ?auto_38794 - BLOCK
      ?auto_38795 - BLOCK
      ?auto_38796 - BLOCK
    )
    :vars
    (
      ?auto_38797 - BLOCK
      ?auto_38798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38793 ) ( ON ?auto_38794 ?auto_38793 ) ( not ( = ?auto_38793 ?auto_38794 ) ) ( not ( = ?auto_38793 ?auto_38795 ) ) ( not ( = ?auto_38793 ?auto_38796 ) ) ( not ( = ?auto_38794 ?auto_38795 ) ) ( not ( = ?auto_38794 ?auto_38796 ) ) ( not ( = ?auto_38795 ?auto_38796 ) ) ( ON ?auto_38796 ?auto_38797 ) ( not ( = ?auto_38793 ?auto_38797 ) ) ( not ( = ?auto_38794 ?auto_38797 ) ) ( not ( = ?auto_38795 ?auto_38797 ) ) ( not ( = ?auto_38796 ?auto_38797 ) ) ( CLEAR ?auto_38794 ) ( ON ?auto_38795 ?auto_38796 ) ( CLEAR ?auto_38795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38798 ) ( ON ?auto_38797 ?auto_38798 ) ( not ( = ?auto_38798 ?auto_38797 ) ) ( not ( = ?auto_38798 ?auto_38796 ) ) ( not ( = ?auto_38798 ?auto_38795 ) ) ( not ( = ?auto_38793 ?auto_38798 ) ) ( not ( = ?auto_38794 ?auto_38798 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38798 ?auto_38797 ?auto_38796 )
      ( MAKE-4PILE ?auto_38793 ?auto_38794 ?auto_38795 ?auto_38796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38799 - BLOCK
      ?auto_38800 - BLOCK
      ?auto_38801 - BLOCK
      ?auto_38802 - BLOCK
    )
    :vars
    (
      ?auto_38803 - BLOCK
      ?auto_38804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38799 ) ( not ( = ?auto_38799 ?auto_38800 ) ) ( not ( = ?auto_38799 ?auto_38801 ) ) ( not ( = ?auto_38799 ?auto_38802 ) ) ( not ( = ?auto_38800 ?auto_38801 ) ) ( not ( = ?auto_38800 ?auto_38802 ) ) ( not ( = ?auto_38801 ?auto_38802 ) ) ( ON ?auto_38802 ?auto_38803 ) ( not ( = ?auto_38799 ?auto_38803 ) ) ( not ( = ?auto_38800 ?auto_38803 ) ) ( not ( = ?auto_38801 ?auto_38803 ) ) ( not ( = ?auto_38802 ?auto_38803 ) ) ( ON ?auto_38801 ?auto_38802 ) ( CLEAR ?auto_38801 ) ( ON-TABLE ?auto_38804 ) ( ON ?auto_38803 ?auto_38804 ) ( not ( = ?auto_38804 ?auto_38803 ) ) ( not ( = ?auto_38804 ?auto_38802 ) ) ( not ( = ?auto_38804 ?auto_38801 ) ) ( not ( = ?auto_38799 ?auto_38804 ) ) ( not ( = ?auto_38800 ?auto_38804 ) ) ( HOLDING ?auto_38800 ) ( CLEAR ?auto_38799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38799 ?auto_38800 )
      ( MAKE-4PILE ?auto_38799 ?auto_38800 ?auto_38801 ?auto_38802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38805 - BLOCK
      ?auto_38806 - BLOCK
      ?auto_38807 - BLOCK
      ?auto_38808 - BLOCK
    )
    :vars
    (
      ?auto_38809 - BLOCK
      ?auto_38810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_38805 ) ( not ( = ?auto_38805 ?auto_38806 ) ) ( not ( = ?auto_38805 ?auto_38807 ) ) ( not ( = ?auto_38805 ?auto_38808 ) ) ( not ( = ?auto_38806 ?auto_38807 ) ) ( not ( = ?auto_38806 ?auto_38808 ) ) ( not ( = ?auto_38807 ?auto_38808 ) ) ( ON ?auto_38808 ?auto_38809 ) ( not ( = ?auto_38805 ?auto_38809 ) ) ( not ( = ?auto_38806 ?auto_38809 ) ) ( not ( = ?auto_38807 ?auto_38809 ) ) ( not ( = ?auto_38808 ?auto_38809 ) ) ( ON ?auto_38807 ?auto_38808 ) ( ON-TABLE ?auto_38810 ) ( ON ?auto_38809 ?auto_38810 ) ( not ( = ?auto_38810 ?auto_38809 ) ) ( not ( = ?auto_38810 ?auto_38808 ) ) ( not ( = ?auto_38810 ?auto_38807 ) ) ( not ( = ?auto_38805 ?auto_38810 ) ) ( not ( = ?auto_38806 ?auto_38810 ) ) ( CLEAR ?auto_38805 ) ( ON ?auto_38806 ?auto_38807 ) ( CLEAR ?auto_38806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38810 ?auto_38809 ?auto_38808 ?auto_38807 )
      ( MAKE-4PILE ?auto_38805 ?auto_38806 ?auto_38807 ?auto_38808 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38811 - BLOCK
      ?auto_38812 - BLOCK
      ?auto_38813 - BLOCK
      ?auto_38814 - BLOCK
    )
    :vars
    (
      ?auto_38816 - BLOCK
      ?auto_38815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38811 ?auto_38812 ) ) ( not ( = ?auto_38811 ?auto_38813 ) ) ( not ( = ?auto_38811 ?auto_38814 ) ) ( not ( = ?auto_38812 ?auto_38813 ) ) ( not ( = ?auto_38812 ?auto_38814 ) ) ( not ( = ?auto_38813 ?auto_38814 ) ) ( ON ?auto_38814 ?auto_38816 ) ( not ( = ?auto_38811 ?auto_38816 ) ) ( not ( = ?auto_38812 ?auto_38816 ) ) ( not ( = ?auto_38813 ?auto_38816 ) ) ( not ( = ?auto_38814 ?auto_38816 ) ) ( ON ?auto_38813 ?auto_38814 ) ( ON-TABLE ?auto_38815 ) ( ON ?auto_38816 ?auto_38815 ) ( not ( = ?auto_38815 ?auto_38816 ) ) ( not ( = ?auto_38815 ?auto_38814 ) ) ( not ( = ?auto_38815 ?auto_38813 ) ) ( not ( = ?auto_38811 ?auto_38815 ) ) ( not ( = ?auto_38812 ?auto_38815 ) ) ( ON ?auto_38812 ?auto_38813 ) ( CLEAR ?auto_38812 ) ( HOLDING ?auto_38811 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38811 )
      ( MAKE-4PILE ?auto_38811 ?auto_38812 ?auto_38813 ?auto_38814 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38817 - BLOCK
      ?auto_38818 - BLOCK
      ?auto_38819 - BLOCK
      ?auto_38820 - BLOCK
    )
    :vars
    (
      ?auto_38822 - BLOCK
      ?auto_38821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38817 ?auto_38818 ) ) ( not ( = ?auto_38817 ?auto_38819 ) ) ( not ( = ?auto_38817 ?auto_38820 ) ) ( not ( = ?auto_38818 ?auto_38819 ) ) ( not ( = ?auto_38818 ?auto_38820 ) ) ( not ( = ?auto_38819 ?auto_38820 ) ) ( ON ?auto_38820 ?auto_38822 ) ( not ( = ?auto_38817 ?auto_38822 ) ) ( not ( = ?auto_38818 ?auto_38822 ) ) ( not ( = ?auto_38819 ?auto_38822 ) ) ( not ( = ?auto_38820 ?auto_38822 ) ) ( ON ?auto_38819 ?auto_38820 ) ( ON-TABLE ?auto_38821 ) ( ON ?auto_38822 ?auto_38821 ) ( not ( = ?auto_38821 ?auto_38822 ) ) ( not ( = ?auto_38821 ?auto_38820 ) ) ( not ( = ?auto_38821 ?auto_38819 ) ) ( not ( = ?auto_38817 ?auto_38821 ) ) ( not ( = ?auto_38818 ?auto_38821 ) ) ( ON ?auto_38818 ?auto_38819 ) ( ON ?auto_38817 ?auto_38818 ) ( CLEAR ?auto_38817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38821 ?auto_38822 ?auto_38820 ?auto_38819 ?auto_38818 )
      ( MAKE-4PILE ?auto_38817 ?auto_38818 ?auto_38819 ?auto_38820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38827 - BLOCK
      ?auto_38828 - BLOCK
      ?auto_38829 - BLOCK
      ?auto_38830 - BLOCK
    )
    :vars
    (
      ?auto_38832 - BLOCK
      ?auto_38831 - BLOCK
      ?auto_38833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38827 ?auto_38828 ) ) ( not ( = ?auto_38827 ?auto_38829 ) ) ( not ( = ?auto_38827 ?auto_38830 ) ) ( not ( = ?auto_38828 ?auto_38829 ) ) ( not ( = ?auto_38828 ?auto_38830 ) ) ( not ( = ?auto_38829 ?auto_38830 ) ) ( ON ?auto_38830 ?auto_38832 ) ( not ( = ?auto_38827 ?auto_38832 ) ) ( not ( = ?auto_38828 ?auto_38832 ) ) ( not ( = ?auto_38829 ?auto_38832 ) ) ( not ( = ?auto_38830 ?auto_38832 ) ) ( ON ?auto_38829 ?auto_38830 ) ( ON-TABLE ?auto_38831 ) ( ON ?auto_38832 ?auto_38831 ) ( not ( = ?auto_38831 ?auto_38832 ) ) ( not ( = ?auto_38831 ?auto_38830 ) ) ( not ( = ?auto_38831 ?auto_38829 ) ) ( not ( = ?auto_38827 ?auto_38831 ) ) ( not ( = ?auto_38828 ?auto_38831 ) ) ( ON ?auto_38828 ?auto_38829 ) ( CLEAR ?auto_38828 ) ( ON ?auto_38827 ?auto_38833 ) ( CLEAR ?auto_38827 ) ( HAND-EMPTY ) ( not ( = ?auto_38827 ?auto_38833 ) ) ( not ( = ?auto_38828 ?auto_38833 ) ) ( not ( = ?auto_38829 ?auto_38833 ) ) ( not ( = ?auto_38830 ?auto_38833 ) ) ( not ( = ?auto_38832 ?auto_38833 ) ) ( not ( = ?auto_38831 ?auto_38833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38827 ?auto_38833 )
      ( MAKE-4PILE ?auto_38827 ?auto_38828 ?auto_38829 ?auto_38830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38834 - BLOCK
      ?auto_38835 - BLOCK
      ?auto_38836 - BLOCK
      ?auto_38837 - BLOCK
    )
    :vars
    (
      ?auto_38839 - BLOCK
      ?auto_38838 - BLOCK
      ?auto_38840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38834 ?auto_38835 ) ) ( not ( = ?auto_38834 ?auto_38836 ) ) ( not ( = ?auto_38834 ?auto_38837 ) ) ( not ( = ?auto_38835 ?auto_38836 ) ) ( not ( = ?auto_38835 ?auto_38837 ) ) ( not ( = ?auto_38836 ?auto_38837 ) ) ( ON ?auto_38837 ?auto_38839 ) ( not ( = ?auto_38834 ?auto_38839 ) ) ( not ( = ?auto_38835 ?auto_38839 ) ) ( not ( = ?auto_38836 ?auto_38839 ) ) ( not ( = ?auto_38837 ?auto_38839 ) ) ( ON ?auto_38836 ?auto_38837 ) ( ON-TABLE ?auto_38838 ) ( ON ?auto_38839 ?auto_38838 ) ( not ( = ?auto_38838 ?auto_38839 ) ) ( not ( = ?auto_38838 ?auto_38837 ) ) ( not ( = ?auto_38838 ?auto_38836 ) ) ( not ( = ?auto_38834 ?auto_38838 ) ) ( not ( = ?auto_38835 ?auto_38838 ) ) ( ON ?auto_38834 ?auto_38840 ) ( CLEAR ?auto_38834 ) ( not ( = ?auto_38834 ?auto_38840 ) ) ( not ( = ?auto_38835 ?auto_38840 ) ) ( not ( = ?auto_38836 ?auto_38840 ) ) ( not ( = ?auto_38837 ?auto_38840 ) ) ( not ( = ?auto_38839 ?auto_38840 ) ) ( not ( = ?auto_38838 ?auto_38840 ) ) ( HOLDING ?auto_38835 ) ( CLEAR ?auto_38836 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38838 ?auto_38839 ?auto_38837 ?auto_38836 ?auto_38835 )
      ( MAKE-4PILE ?auto_38834 ?auto_38835 ?auto_38836 ?auto_38837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38841 - BLOCK
      ?auto_38842 - BLOCK
      ?auto_38843 - BLOCK
      ?auto_38844 - BLOCK
    )
    :vars
    (
      ?auto_38847 - BLOCK
      ?auto_38845 - BLOCK
      ?auto_38846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38841 ?auto_38842 ) ) ( not ( = ?auto_38841 ?auto_38843 ) ) ( not ( = ?auto_38841 ?auto_38844 ) ) ( not ( = ?auto_38842 ?auto_38843 ) ) ( not ( = ?auto_38842 ?auto_38844 ) ) ( not ( = ?auto_38843 ?auto_38844 ) ) ( ON ?auto_38844 ?auto_38847 ) ( not ( = ?auto_38841 ?auto_38847 ) ) ( not ( = ?auto_38842 ?auto_38847 ) ) ( not ( = ?auto_38843 ?auto_38847 ) ) ( not ( = ?auto_38844 ?auto_38847 ) ) ( ON ?auto_38843 ?auto_38844 ) ( ON-TABLE ?auto_38845 ) ( ON ?auto_38847 ?auto_38845 ) ( not ( = ?auto_38845 ?auto_38847 ) ) ( not ( = ?auto_38845 ?auto_38844 ) ) ( not ( = ?auto_38845 ?auto_38843 ) ) ( not ( = ?auto_38841 ?auto_38845 ) ) ( not ( = ?auto_38842 ?auto_38845 ) ) ( ON ?auto_38841 ?auto_38846 ) ( not ( = ?auto_38841 ?auto_38846 ) ) ( not ( = ?auto_38842 ?auto_38846 ) ) ( not ( = ?auto_38843 ?auto_38846 ) ) ( not ( = ?auto_38844 ?auto_38846 ) ) ( not ( = ?auto_38847 ?auto_38846 ) ) ( not ( = ?auto_38845 ?auto_38846 ) ) ( CLEAR ?auto_38843 ) ( ON ?auto_38842 ?auto_38841 ) ( CLEAR ?auto_38842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38846 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38846 ?auto_38841 )
      ( MAKE-4PILE ?auto_38841 ?auto_38842 ?auto_38843 ?auto_38844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38848 - BLOCK
      ?auto_38849 - BLOCK
      ?auto_38850 - BLOCK
      ?auto_38851 - BLOCK
    )
    :vars
    (
      ?auto_38853 - BLOCK
      ?auto_38854 - BLOCK
      ?auto_38852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38848 ?auto_38849 ) ) ( not ( = ?auto_38848 ?auto_38850 ) ) ( not ( = ?auto_38848 ?auto_38851 ) ) ( not ( = ?auto_38849 ?auto_38850 ) ) ( not ( = ?auto_38849 ?auto_38851 ) ) ( not ( = ?auto_38850 ?auto_38851 ) ) ( ON ?auto_38851 ?auto_38853 ) ( not ( = ?auto_38848 ?auto_38853 ) ) ( not ( = ?auto_38849 ?auto_38853 ) ) ( not ( = ?auto_38850 ?auto_38853 ) ) ( not ( = ?auto_38851 ?auto_38853 ) ) ( ON-TABLE ?auto_38854 ) ( ON ?auto_38853 ?auto_38854 ) ( not ( = ?auto_38854 ?auto_38853 ) ) ( not ( = ?auto_38854 ?auto_38851 ) ) ( not ( = ?auto_38854 ?auto_38850 ) ) ( not ( = ?auto_38848 ?auto_38854 ) ) ( not ( = ?auto_38849 ?auto_38854 ) ) ( ON ?auto_38848 ?auto_38852 ) ( not ( = ?auto_38848 ?auto_38852 ) ) ( not ( = ?auto_38849 ?auto_38852 ) ) ( not ( = ?auto_38850 ?auto_38852 ) ) ( not ( = ?auto_38851 ?auto_38852 ) ) ( not ( = ?auto_38853 ?auto_38852 ) ) ( not ( = ?auto_38854 ?auto_38852 ) ) ( ON ?auto_38849 ?auto_38848 ) ( CLEAR ?auto_38849 ) ( ON-TABLE ?auto_38852 ) ( HOLDING ?auto_38850 ) ( CLEAR ?auto_38851 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38854 ?auto_38853 ?auto_38851 ?auto_38850 )
      ( MAKE-4PILE ?auto_38848 ?auto_38849 ?auto_38850 ?auto_38851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38855 - BLOCK
      ?auto_38856 - BLOCK
      ?auto_38857 - BLOCK
      ?auto_38858 - BLOCK
    )
    :vars
    (
      ?auto_38859 - BLOCK
      ?auto_38861 - BLOCK
      ?auto_38860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38855 ?auto_38856 ) ) ( not ( = ?auto_38855 ?auto_38857 ) ) ( not ( = ?auto_38855 ?auto_38858 ) ) ( not ( = ?auto_38856 ?auto_38857 ) ) ( not ( = ?auto_38856 ?auto_38858 ) ) ( not ( = ?auto_38857 ?auto_38858 ) ) ( ON ?auto_38858 ?auto_38859 ) ( not ( = ?auto_38855 ?auto_38859 ) ) ( not ( = ?auto_38856 ?auto_38859 ) ) ( not ( = ?auto_38857 ?auto_38859 ) ) ( not ( = ?auto_38858 ?auto_38859 ) ) ( ON-TABLE ?auto_38861 ) ( ON ?auto_38859 ?auto_38861 ) ( not ( = ?auto_38861 ?auto_38859 ) ) ( not ( = ?auto_38861 ?auto_38858 ) ) ( not ( = ?auto_38861 ?auto_38857 ) ) ( not ( = ?auto_38855 ?auto_38861 ) ) ( not ( = ?auto_38856 ?auto_38861 ) ) ( ON ?auto_38855 ?auto_38860 ) ( not ( = ?auto_38855 ?auto_38860 ) ) ( not ( = ?auto_38856 ?auto_38860 ) ) ( not ( = ?auto_38857 ?auto_38860 ) ) ( not ( = ?auto_38858 ?auto_38860 ) ) ( not ( = ?auto_38859 ?auto_38860 ) ) ( not ( = ?auto_38861 ?auto_38860 ) ) ( ON ?auto_38856 ?auto_38855 ) ( ON-TABLE ?auto_38860 ) ( CLEAR ?auto_38858 ) ( ON ?auto_38857 ?auto_38856 ) ( CLEAR ?auto_38857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38860 ?auto_38855 ?auto_38856 )
      ( MAKE-4PILE ?auto_38855 ?auto_38856 ?auto_38857 ?auto_38858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38862 - BLOCK
      ?auto_38863 - BLOCK
      ?auto_38864 - BLOCK
      ?auto_38865 - BLOCK
    )
    :vars
    (
      ?auto_38866 - BLOCK
      ?auto_38868 - BLOCK
      ?auto_38867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38862 ?auto_38863 ) ) ( not ( = ?auto_38862 ?auto_38864 ) ) ( not ( = ?auto_38862 ?auto_38865 ) ) ( not ( = ?auto_38863 ?auto_38864 ) ) ( not ( = ?auto_38863 ?auto_38865 ) ) ( not ( = ?auto_38864 ?auto_38865 ) ) ( not ( = ?auto_38862 ?auto_38866 ) ) ( not ( = ?auto_38863 ?auto_38866 ) ) ( not ( = ?auto_38864 ?auto_38866 ) ) ( not ( = ?auto_38865 ?auto_38866 ) ) ( ON-TABLE ?auto_38868 ) ( ON ?auto_38866 ?auto_38868 ) ( not ( = ?auto_38868 ?auto_38866 ) ) ( not ( = ?auto_38868 ?auto_38865 ) ) ( not ( = ?auto_38868 ?auto_38864 ) ) ( not ( = ?auto_38862 ?auto_38868 ) ) ( not ( = ?auto_38863 ?auto_38868 ) ) ( ON ?auto_38862 ?auto_38867 ) ( not ( = ?auto_38862 ?auto_38867 ) ) ( not ( = ?auto_38863 ?auto_38867 ) ) ( not ( = ?auto_38864 ?auto_38867 ) ) ( not ( = ?auto_38865 ?auto_38867 ) ) ( not ( = ?auto_38866 ?auto_38867 ) ) ( not ( = ?auto_38868 ?auto_38867 ) ) ( ON ?auto_38863 ?auto_38862 ) ( ON-TABLE ?auto_38867 ) ( ON ?auto_38864 ?auto_38863 ) ( CLEAR ?auto_38864 ) ( HOLDING ?auto_38865 ) ( CLEAR ?auto_38866 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38868 ?auto_38866 ?auto_38865 )
      ( MAKE-4PILE ?auto_38862 ?auto_38863 ?auto_38864 ?auto_38865 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38869 - BLOCK
      ?auto_38870 - BLOCK
      ?auto_38871 - BLOCK
      ?auto_38872 - BLOCK
    )
    :vars
    (
      ?auto_38873 - BLOCK
      ?auto_38874 - BLOCK
      ?auto_38875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38869 ?auto_38870 ) ) ( not ( = ?auto_38869 ?auto_38871 ) ) ( not ( = ?auto_38869 ?auto_38872 ) ) ( not ( = ?auto_38870 ?auto_38871 ) ) ( not ( = ?auto_38870 ?auto_38872 ) ) ( not ( = ?auto_38871 ?auto_38872 ) ) ( not ( = ?auto_38869 ?auto_38873 ) ) ( not ( = ?auto_38870 ?auto_38873 ) ) ( not ( = ?auto_38871 ?auto_38873 ) ) ( not ( = ?auto_38872 ?auto_38873 ) ) ( ON-TABLE ?auto_38874 ) ( ON ?auto_38873 ?auto_38874 ) ( not ( = ?auto_38874 ?auto_38873 ) ) ( not ( = ?auto_38874 ?auto_38872 ) ) ( not ( = ?auto_38874 ?auto_38871 ) ) ( not ( = ?auto_38869 ?auto_38874 ) ) ( not ( = ?auto_38870 ?auto_38874 ) ) ( ON ?auto_38869 ?auto_38875 ) ( not ( = ?auto_38869 ?auto_38875 ) ) ( not ( = ?auto_38870 ?auto_38875 ) ) ( not ( = ?auto_38871 ?auto_38875 ) ) ( not ( = ?auto_38872 ?auto_38875 ) ) ( not ( = ?auto_38873 ?auto_38875 ) ) ( not ( = ?auto_38874 ?auto_38875 ) ) ( ON ?auto_38870 ?auto_38869 ) ( ON-TABLE ?auto_38875 ) ( ON ?auto_38871 ?auto_38870 ) ( CLEAR ?auto_38873 ) ( ON ?auto_38872 ?auto_38871 ) ( CLEAR ?auto_38872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38875 ?auto_38869 ?auto_38870 ?auto_38871 )
      ( MAKE-4PILE ?auto_38869 ?auto_38870 ?auto_38871 ?auto_38872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38876 - BLOCK
      ?auto_38877 - BLOCK
      ?auto_38878 - BLOCK
      ?auto_38879 - BLOCK
    )
    :vars
    (
      ?auto_38882 - BLOCK
      ?auto_38881 - BLOCK
      ?auto_38880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38876 ?auto_38877 ) ) ( not ( = ?auto_38876 ?auto_38878 ) ) ( not ( = ?auto_38876 ?auto_38879 ) ) ( not ( = ?auto_38877 ?auto_38878 ) ) ( not ( = ?auto_38877 ?auto_38879 ) ) ( not ( = ?auto_38878 ?auto_38879 ) ) ( not ( = ?auto_38876 ?auto_38882 ) ) ( not ( = ?auto_38877 ?auto_38882 ) ) ( not ( = ?auto_38878 ?auto_38882 ) ) ( not ( = ?auto_38879 ?auto_38882 ) ) ( ON-TABLE ?auto_38881 ) ( not ( = ?auto_38881 ?auto_38882 ) ) ( not ( = ?auto_38881 ?auto_38879 ) ) ( not ( = ?auto_38881 ?auto_38878 ) ) ( not ( = ?auto_38876 ?auto_38881 ) ) ( not ( = ?auto_38877 ?auto_38881 ) ) ( ON ?auto_38876 ?auto_38880 ) ( not ( = ?auto_38876 ?auto_38880 ) ) ( not ( = ?auto_38877 ?auto_38880 ) ) ( not ( = ?auto_38878 ?auto_38880 ) ) ( not ( = ?auto_38879 ?auto_38880 ) ) ( not ( = ?auto_38882 ?auto_38880 ) ) ( not ( = ?auto_38881 ?auto_38880 ) ) ( ON ?auto_38877 ?auto_38876 ) ( ON-TABLE ?auto_38880 ) ( ON ?auto_38878 ?auto_38877 ) ( ON ?auto_38879 ?auto_38878 ) ( CLEAR ?auto_38879 ) ( HOLDING ?auto_38882 ) ( CLEAR ?auto_38881 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38881 ?auto_38882 )
      ( MAKE-4PILE ?auto_38876 ?auto_38877 ?auto_38878 ?auto_38879 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38883 - BLOCK
      ?auto_38884 - BLOCK
      ?auto_38885 - BLOCK
      ?auto_38886 - BLOCK
    )
    :vars
    (
      ?auto_38888 - BLOCK
      ?auto_38889 - BLOCK
      ?auto_38887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38883 ?auto_38884 ) ) ( not ( = ?auto_38883 ?auto_38885 ) ) ( not ( = ?auto_38883 ?auto_38886 ) ) ( not ( = ?auto_38884 ?auto_38885 ) ) ( not ( = ?auto_38884 ?auto_38886 ) ) ( not ( = ?auto_38885 ?auto_38886 ) ) ( not ( = ?auto_38883 ?auto_38888 ) ) ( not ( = ?auto_38884 ?auto_38888 ) ) ( not ( = ?auto_38885 ?auto_38888 ) ) ( not ( = ?auto_38886 ?auto_38888 ) ) ( ON-TABLE ?auto_38889 ) ( not ( = ?auto_38889 ?auto_38888 ) ) ( not ( = ?auto_38889 ?auto_38886 ) ) ( not ( = ?auto_38889 ?auto_38885 ) ) ( not ( = ?auto_38883 ?auto_38889 ) ) ( not ( = ?auto_38884 ?auto_38889 ) ) ( ON ?auto_38883 ?auto_38887 ) ( not ( = ?auto_38883 ?auto_38887 ) ) ( not ( = ?auto_38884 ?auto_38887 ) ) ( not ( = ?auto_38885 ?auto_38887 ) ) ( not ( = ?auto_38886 ?auto_38887 ) ) ( not ( = ?auto_38888 ?auto_38887 ) ) ( not ( = ?auto_38889 ?auto_38887 ) ) ( ON ?auto_38884 ?auto_38883 ) ( ON-TABLE ?auto_38887 ) ( ON ?auto_38885 ?auto_38884 ) ( ON ?auto_38886 ?auto_38885 ) ( CLEAR ?auto_38889 ) ( ON ?auto_38888 ?auto_38886 ) ( CLEAR ?auto_38888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38887 ?auto_38883 ?auto_38884 ?auto_38885 ?auto_38886 )
      ( MAKE-4PILE ?auto_38883 ?auto_38884 ?auto_38885 ?auto_38886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38890 - BLOCK
      ?auto_38891 - BLOCK
      ?auto_38892 - BLOCK
      ?auto_38893 - BLOCK
    )
    :vars
    (
      ?auto_38894 - BLOCK
      ?auto_38896 - BLOCK
      ?auto_38895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38890 ?auto_38891 ) ) ( not ( = ?auto_38890 ?auto_38892 ) ) ( not ( = ?auto_38890 ?auto_38893 ) ) ( not ( = ?auto_38891 ?auto_38892 ) ) ( not ( = ?auto_38891 ?auto_38893 ) ) ( not ( = ?auto_38892 ?auto_38893 ) ) ( not ( = ?auto_38890 ?auto_38894 ) ) ( not ( = ?auto_38891 ?auto_38894 ) ) ( not ( = ?auto_38892 ?auto_38894 ) ) ( not ( = ?auto_38893 ?auto_38894 ) ) ( not ( = ?auto_38896 ?auto_38894 ) ) ( not ( = ?auto_38896 ?auto_38893 ) ) ( not ( = ?auto_38896 ?auto_38892 ) ) ( not ( = ?auto_38890 ?auto_38896 ) ) ( not ( = ?auto_38891 ?auto_38896 ) ) ( ON ?auto_38890 ?auto_38895 ) ( not ( = ?auto_38890 ?auto_38895 ) ) ( not ( = ?auto_38891 ?auto_38895 ) ) ( not ( = ?auto_38892 ?auto_38895 ) ) ( not ( = ?auto_38893 ?auto_38895 ) ) ( not ( = ?auto_38894 ?auto_38895 ) ) ( not ( = ?auto_38896 ?auto_38895 ) ) ( ON ?auto_38891 ?auto_38890 ) ( ON-TABLE ?auto_38895 ) ( ON ?auto_38892 ?auto_38891 ) ( ON ?auto_38893 ?auto_38892 ) ( ON ?auto_38894 ?auto_38893 ) ( CLEAR ?auto_38894 ) ( HOLDING ?auto_38896 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38896 )
      ( MAKE-4PILE ?auto_38890 ?auto_38891 ?auto_38892 ?auto_38893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38897 - BLOCK
      ?auto_38898 - BLOCK
      ?auto_38899 - BLOCK
      ?auto_38900 - BLOCK
    )
    :vars
    (
      ?auto_38902 - BLOCK
      ?auto_38903 - BLOCK
      ?auto_38901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_38897 ?auto_38898 ) ) ( not ( = ?auto_38897 ?auto_38899 ) ) ( not ( = ?auto_38897 ?auto_38900 ) ) ( not ( = ?auto_38898 ?auto_38899 ) ) ( not ( = ?auto_38898 ?auto_38900 ) ) ( not ( = ?auto_38899 ?auto_38900 ) ) ( not ( = ?auto_38897 ?auto_38902 ) ) ( not ( = ?auto_38898 ?auto_38902 ) ) ( not ( = ?auto_38899 ?auto_38902 ) ) ( not ( = ?auto_38900 ?auto_38902 ) ) ( not ( = ?auto_38903 ?auto_38902 ) ) ( not ( = ?auto_38903 ?auto_38900 ) ) ( not ( = ?auto_38903 ?auto_38899 ) ) ( not ( = ?auto_38897 ?auto_38903 ) ) ( not ( = ?auto_38898 ?auto_38903 ) ) ( ON ?auto_38897 ?auto_38901 ) ( not ( = ?auto_38897 ?auto_38901 ) ) ( not ( = ?auto_38898 ?auto_38901 ) ) ( not ( = ?auto_38899 ?auto_38901 ) ) ( not ( = ?auto_38900 ?auto_38901 ) ) ( not ( = ?auto_38902 ?auto_38901 ) ) ( not ( = ?auto_38903 ?auto_38901 ) ) ( ON ?auto_38898 ?auto_38897 ) ( ON-TABLE ?auto_38901 ) ( ON ?auto_38899 ?auto_38898 ) ( ON ?auto_38900 ?auto_38899 ) ( ON ?auto_38902 ?auto_38900 ) ( ON ?auto_38903 ?auto_38902 ) ( CLEAR ?auto_38903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_38901 ?auto_38897 ?auto_38898 ?auto_38899 ?auto_38900 ?auto_38902 )
      ( MAKE-4PILE ?auto_38897 ?auto_38898 ?auto_38899 ?auto_38900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38915 - BLOCK
    )
    :vars
    (
      ?auto_38917 - BLOCK
      ?auto_38916 - BLOCK
      ?auto_38918 - BLOCK
      ?auto_38920 - BLOCK
      ?auto_38919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38917 ?auto_38915 ) ( ON-TABLE ?auto_38915 ) ( not ( = ?auto_38915 ?auto_38917 ) ) ( not ( = ?auto_38915 ?auto_38916 ) ) ( not ( = ?auto_38915 ?auto_38918 ) ) ( not ( = ?auto_38917 ?auto_38916 ) ) ( not ( = ?auto_38917 ?auto_38918 ) ) ( not ( = ?auto_38916 ?auto_38918 ) ) ( ON ?auto_38916 ?auto_38917 ) ( CLEAR ?auto_38916 ) ( HOLDING ?auto_38918 ) ( CLEAR ?auto_38920 ) ( ON-TABLE ?auto_38919 ) ( ON ?auto_38920 ?auto_38919 ) ( not ( = ?auto_38919 ?auto_38920 ) ) ( not ( = ?auto_38919 ?auto_38918 ) ) ( not ( = ?auto_38920 ?auto_38918 ) ) ( not ( = ?auto_38915 ?auto_38920 ) ) ( not ( = ?auto_38915 ?auto_38919 ) ) ( not ( = ?auto_38917 ?auto_38920 ) ) ( not ( = ?auto_38917 ?auto_38919 ) ) ( not ( = ?auto_38916 ?auto_38920 ) ) ( not ( = ?auto_38916 ?auto_38919 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38919 ?auto_38920 ?auto_38918 )
      ( MAKE-1PILE ?auto_38915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38921 - BLOCK
    )
    :vars
    (
      ?auto_38923 - BLOCK
      ?auto_38922 - BLOCK
      ?auto_38924 - BLOCK
      ?auto_38926 - BLOCK
      ?auto_38925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38923 ?auto_38921 ) ( ON-TABLE ?auto_38921 ) ( not ( = ?auto_38921 ?auto_38923 ) ) ( not ( = ?auto_38921 ?auto_38922 ) ) ( not ( = ?auto_38921 ?auto_38924 ) ) ( not ( = ?auto_38923 ?auto_38922 ) ) ( not ( = ?auto_38923 ?auto_38924 ) ) ( not ( = ?auto_38922 ?auto_38924 ) ) ( ON ?auto_38922 ?auto_38923 ) ( CLEAR ?auto_38926 ) ( ON-TABLE ?auto_38925 ) ( ON ?auto_38926 ?auto_38925 ) ( not ( = ?auto_38925 ?auto_38926 ) ) ( not ( = ?auto_38925 ?auto_38924 ) ) ( not ( = ?auto_38926 ?auto_38924 ) ) ( not ( = ?auto_38921 ?auto_38926 ) ) ( not ( = ?auto_38921 ?auto_38925 ) ) ( not ( = ?auto_38923 ?auto_38926 ) ) ( not ( = ?auto_38923 ?auto_38925 ) ) ( not ( = ?auto_38922 ?auto_38926 ) ) ( not ( = ?auto_38922 ?auto_38925 ) ) ( ON ?auto_38924 ?auto_38922 ) ( CLEAR ?auto_38924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38921 ?auto_38923 ?auto_38922 )
      ( MAKE-1PILE ?auto_38921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38927 - BLOCK
    )
    :vars
    (
      ?auto_38928 - BLOCK
      ?auto_38929 - BLOCK
      ?auto_38931 - BLOCK
      ?auto_38930 - BLOCK
      ?auto_38932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38928 ?auto_38927 ) ( ON-TABLE ?auto_38927 ) ( not ( = ?auto_38927 ?auto_38928 ) ) ( not ( = ?auto_38927 ?auto_38929 ) ) ( not ( = ?auto_38927 ?auto_38931 ) ) ( not ( = ?auto_38928 ?auto_38929 ) ) ( not ( = ?auto_38928 ?auto_38931 ) ) ( not ( = ?auto_38929 ?auto_38931 ) ) ( ON ?auto_38929 ?auto_38928 ) ( ON-TABLE ?auto_38930 ) ( not ( = ?auto_38930 ?auto_38932 ) ) ( not ( = ?auto_38930 ?auto_38931 ) ) ( not ( = ?auto_38932 ?auto_38931 ) ) ( not ( = ?auto_38927 ?auto_38932 ) ) ( not ( = ?auto_38927 ?auto_38930 ) ) ( not ( = ?auto_38928 ?auto_38932 ) ) ( not ( = ?auto_38928 ?auto_38930 ) ) ( not ( = ?auto_38929 ?auto_38932 ) ) ( not ( = ?auto_38929 ?auto_38930 ) ) ( ON ?auto_38931 ?auto_38929 ) ( CLEAR ?auto_38931 ) ( HOLDING ?auto_38932 ) ( CLEAR ?auto_38930 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38930 ?auto_38932 )
      ( MAKE-1PILE ?auto_38927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38933 - BLOCK
    )
    :vars
    (
      ?auto_38936 - BLOCK
      ?auto_38938 - BLOCK
      ?auto_38934 - BLOCK
      ?auto_38935 - BLOCK
      ?auto_38937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38936 ?auto_38933 ) ( ON-TABLE ?auto_38933 ) ( not ( = ?auto_38933 ?auto_38936 ) ) ( not ( = ?auto_38933 ?auto_38938 ) ) ( not ( = ?auto_38933 ?auto_38934 ) ) ( not ( = ?auto_38936 ?auto_38938 ) ) ( not ( = ?auto_38936 ?auto_38934 ) ) ( not ( = ?auto_38938 ?auto_38934 ) ) ( ON ?auto_38938 ?auto_38936 ) ( ON-TABLE ?auto_38935 ) ( not ( = ?auto_38935 ?auto_38937 ) ) ( not ( = ?auto_38935 ?auto_38934 ) ) ( not ( = ?auto_38937 ?auto_38934 ) ) ( not ( = ?auto_38933 ?auto_38937 ) ) ( not ( = ?auto_38933 ?auto_38935 ) ) ( not ( = ?auto_38936 ?auto_38937 ) ) ( not ( = ?auto_38936 ?auto_38935 ) ) ( not ( = ?auto_38938 ?auto_38937 ) ) ( not ( = ?auto_38938 ?auto_38935 ) ) ( ON ?auto_38934 ?auto_38938 ) ( CLEAR ?auto_38935 ) ( ON ?auto_38937 ?auto_38934 ) ( CLEAR ?auto_38937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_38933 ?auto_38936 ?auto_38938 ?auto_38934 )
      ( MAKE-1PILE ?auto_38933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38939 - BLOCK
    )
    :vars
    (
      ?auto_38942 - BLOCK
      ?auto_38941 - BLOCK
      ?auto_38943 - BLOCK
      ?auto_38940 - BLOCK
      ?auto_38944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38942 ?auto_38939 ) ( ON-TABLE ?auto_38939 ) ( not ( = ?auto_38939 ?auto_38942 ) ) ( not ( = ?auto_38939 ?auto_38941 ) ) ( not ( = ?auto_38939 ?auto_38943 ) ) ( not ( = ?auto_38942 ?auto_38941 ) ) ( not ( = ?auto_38942 ?auto_38943 ) ) ( not ( = ?auto_38941 ?auto_38943 ) ) ( ON ?auto_38941 ?auto_38942 ) ( not ( = ?auto_38940 ?auto_38944 ) ) ( not ( = ?auto_38940 ?auto_38943 ) ) ( not ( = ?auto_38944 ?auto_38943 ) ) ( not ( = ?auto_38939 ?auto_38944 ) ) ( not ( = ?auto_38939 ?auto_38940 ) ) ( not ( = ?auto_38942 ?auto_38944 ) ) ( not ( = ?auto_38942 ?auto_38940 ) ) ( not ( = ?auto_38941 ?auto_38944 ) ) ( not ( = ?auto_38941 ?auto_38940 ) ) ( ON ?auto_38943 ?auto_38941 ) ( ON ?auto_38944 ?auto_38943 ) ( CLEAR ?auto_38944 ) ( HOLDING ?auto_38940 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38940 )
      ( MAKE-1PILE ?auto_38939 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38952 - BLOCK
    )
    :vars
    (
      ?auto_38957 - BLOCK
      ?auto_38956 - BLOCK
      ?auto_38953 - BLOCK
      ?auto_38955 - BLOCK
      ?auto_38954 - BLOCK
      ?auto_38958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38957 ?auto_38952 ) ( ON-TABLE ?auto_38952 ) ( not ( = ?auto_38952 ?auto_38957 ) ) ( not ( = ?auto_38952 ?auto_38956 ) ) ( not ( = ?auto_38952 ?auto_38953 ) ) ( not ( = ?auto_38957 ?auto_38956 ) ) ( not ( = ?auto_38957 ?auto_38953 ) ) ( not ( = ?auto_38956 ?auto_38953 ) ) ( ON ?auto_38956 ?auto_38957 ) ( not ( = ?auto_38955 ?auto_38954 ) ) ( not ( = ?auto_38955 ?auto_38953 ) ) ( not ( = ?auto_38954 ?auto_38953 ) ) ( not ( = ?auto_38952 ?auto_38954 ) ) ( not ( = ?auto_38952 ?auto_38955 ) ) ( not ( = ?auto_38957 ?auto_38954 ) ) ( not ( = ?auto_38957 ?auto_38955 ) ) ( not ( = ?auto_38956 ?auto_38954 ) ) ( not ( = ?auto_38956 ?auto_38955 ) ) ( ON ?auto_38953 ?auto_38956 ) ( ON ?auto_38954 ?auto_38953 ) ( CLEAR ?auto_38954 ) ( ON ?auto_38955 ?auto_38958 ) ( CLEAR ?auto_38955 ) ( HAND-EMPTY ) ( not ( = ?auto_38952 ?auto_38958 ) ) ( not ( = ?auto_38957 ?auto_38958 ) ) ( not ( = ?auto_38956 ?auto_38958 ) ) ( not ( = ?auto_38953 ?auto_38958 ) ) ( not ( = ?auto_38955 ?auto_38958 ) ) ( not ( = ?auto_38954 ?auto_38958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38955 ?auto_38958 )
      ( MAKE-1PILE ?auto_38952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38959 - BLOCK
    )
    :vars
    (
      ?auto_38963 - BLOCK
      ?auto_38965 - BLOCK
      ?auto_38961 - BLOCK
      ?auto_38962 - BLOCK
      ?auto_38964 - BLOCK
      ?auto_38960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38963 ?auto_38959 ) ( ON-TABLE ?auto_38959 ) ( not ( = ?auto_38959 ?auto_38963 ) ) ( not ( = ?auto_38959 ?auto_38965 ) ) ( not ( = ?auto_38959 ?auto_38961 ) ) ( not ( = ?auto_38963 ?auto_38965 ) ) ( not ( = ?auto_38963 ?auto_38961 ) ) ( not ( = ?auto_38965 ?auto_38961 ) ) ( ON ?auto_38965 ?auto_38963 ) ( not ( = ?auto_38962 ?auto_38964 ) ) ( not ( = ?auto_38962 ?auto_38961 ) ) ( not ( = ?auto_38964 ?auto_38961 ) ) ( not ( = ?auto_38959 ?auto_38964 ) ) ( not ( = ?auto_38959 ?auto_38962 ) ) ( not ( = ?auto_38963 ?auto_38964 ) ) ( not ( = ?auto_38963 ?auto_38962 ) ) ( not ( = ?auto_38965 ?auto_38964 ) ) ( not ( = ?auto_38965 ?auto_38962 ) ) ( ON ?auto_38961 ?auto_38965 ) ( ON ?auto_38962 ?auto_38960 ) ( CLEAR ?auto_38962 ) ( not ( = ?auto_38959 ?auto_38960 ) ) ( not ( = ?auto_38963 ?auto_38960 ) ) ( not ( = ?auto_38965 ?auto_38960 ) ) ( not ( = ?auto_38961 ?auto_38960 ) ) ( not ( = ?auto_38962 ?auto_38960 ) ) ( not ( = ?auto_38964 ?auto_38960 ) ) ( HOLDING ?auto_38964 ) ( CLEAR ?auto_38961 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_38959 ?auto_38963 ?auto_38965 ?auto_38961 ?auto_38964 )
      ( MAKE-1PILE ?auto_38959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_38966 - BLOCK
    )
    :vars
    (
      ?auto_38969 - BLOCK
      ?auto_38968 - BLOCK
      ?auto_38971 - BLOCK
      ?auto_38967 - BLOCK
      ?auto_38972 - BLOCK
      ?auto_38970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38969 ?auto_38966 ) ( ON-TABLE ?auto_38966 ) ( not ( = ?auto_38966 ?auto_38969 ) ) ( not ( = ?auto_38966 ?auto_38968 ) ) ( not ( = ?auto_38966 ?auto_38971 ) ) ( not ( = ?auto_38969 ?auto_38968 ) ) ( not ( = ?auto_38969 ?auto_38971 ) ) ( not ( = ?auto_38968 ?auto_38971 ) ) ( ON ?auto_38968 ?auto_38969 ) ( not ( = ?auto_38967 ?auto_38972 ) ) ( not ( = ?auto_38967 ?auto_38971 ) ) ( not ( = ?auto_38972 ?auto_38971 ) ) ( not ( = ?auto_38966 ?auto_38972 ) ) ( not ( = ?auto_38966 ?auto_38967 ) ) ( not ( = ?auto_38969 ?auto_38972 ) ) ( not ( = ?auto_38969 ?auto_38967 ) ) ( not ( = ?auto_38968 ?auto_38972 ) ) ( not ( = ?auto_38968 ?auto_38967 ) ) ( ON ?auto_38971 ?auto_38968 ) ( ON ?auto_38967 ?auto_38970 ) ( not ( = ?auto_38966 ?auto_38970 ) ) ( not ( = ?auto_38969 ?auto_38970 ) ) ( not ( = ?auto_38968 ?auto_38970 ) ) ( not ( = ?auto_38971 ?auto_38970 ) ) ( not ( = ?auto_38967 ?auto_38970 ) ) ( not ( = ?auto_38972 ?auto_38970 ) ) ( CLEAR ?auto_38971 ) ( ON ?auto_38972 ?auto_38967 ) ( CLEAR ?auto_38972 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38970 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38970 ?auto_38967 )
      ( MAKE-1PILE ?auto_38966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39006 - BLOCK
      ?auto_39007 - BLOCK
      ?auto_39008 - BLOCK
      ?auto_39009 - BLOCK
      ?auto_39010 - BLOCK
    )
    :vars
    (
      ?auto_39011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39006 ) ( ON ?auto_39007 ?auto_39006 ) ( ON ?auto_39008 ?auto_39007 ) ( not ( = ?auto_39006 ?auto_39007 ) ) ( not ( = ?auto_39006 ?auto_39008 ) ) ( not ( = ?auto_39006 ?auto_39009 ) ) ( not ( = ?auto_39006 ?auto_39010 ) ) ( not ( = ?auto_39007 ?auto_39008 ) ) ( not ( = ?auto_39007 ?auto_39009 ) ) ( not ( = ?auto_39007 ?auto_39010 ) ) ( not ( = ?auto_39008 ?auto_39009 ) ) ( not ( = ?auto_39008 ?auto_39010 ) ) ( not ( = ?auto_39009 ?auto_39010 ) ) ( ON ?auto_39010 ?auto_39011 ) ( not ( = ?auto_39006 ?auto_39011 ) ) ( not ( = ?auto_39007 ?auto_39011 ) ) ( not ( = ?auto_39008 ?auto_39011 ) ) ( not ( = ?auto_39009 ?auto_39011 ) ) ( not ( = ?auto_39010 ?auto_39011 ) ) ( CLEAR ?auto_39008 ) ( ON ?auto_39009 ?auto_39010 ) ( CLEAR ?auto_39009 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39011 ?auto_39010 )
      ( MAKE-5PILE ?auto_39006 ?auto_39007 ?auto_39008 ?auto_39009 ?auto_39010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39012 - BLOCK
      ?auto_39013 - BLOCK
      ?auto_39014 - BLOCK
      ?auto_39015 - BLOCK
      ?auto_39016 - BLOCK
    )
    :vars
    (
      ?auto_39017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39012 ) ( ON ?auto_39013 ?auto_39012 ) ( not ( = ?auto_39012 ?auto_39013 ) ) ( not ( = ?auto_39012 ?auto_39014 ) ) ( not ( = ?auto_39012 ?auto_39015 ) ) ( not ( = ?auto_39012 ?auto_39016 ) ) ( not ( = ?auto_39013 ?auto_39014 ) ) ( not ( = ?auto_39013 ?auto_39015 ) ) ( not ( = ?auto_39013 ?auto_39016 ) ) ( not ( = ?auto_39014 ?auto_39015 ) ) ( not ( = ?auto_39014 ?auto_39016 ) ) ( not ( = ?auto_39015 ?auto_39016 ) ) ( ON ?auto_39016 ?auto_39017 ) ( not ( = ?auto_39012 ?auto_39017 ) ) ( not ( = ?auto_39013 ?auto_39017 ) ) ( not ( = ?auto_39014 ?auto_39017 ) ) ( not ( = ?auto_39015 ?auto_39017 ) ) ( not ( = ?auto_39016 ?auto_39017 ) ) ( ON ?auto_39015 ?auto_39016 ) ( CLEAR ?auto_39015 ) ( ON-TABLE ?auto_39017 ) ( HOLDING ?auto_39014 ) ( CLEAR ?auto_39013 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39012 ?auto_39013 ?auto_39014 )
      ( MAKE-5PILE ?auto_39012 ?auto_39013 ?auto_39014 ?auto_39015 ?auto_39016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39018 - BLOCK
      ?auto_39019 - BLOCK
      ?auto_39020 - BLOCK
      ?auto_39021 - BLOCK
      ?auto_39022 - BLOCK
    )
    :vars
    (
      ?auto_39023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39018 ) ( ON ?auto_39019 ?auto_39018 ) ( not ( = ?auto_39018 ?auto_39019 ) ) ( not ( = ?auto_39018 ?auto_39020 ) ) ( not ( = ?auto_39018 ?auto_39021 ) ) ( not ( = ?auto_39018 ?auto_39022 ) ) ( not ( = ?auto_39019 ?auto_39020 ) ) ( not ( = ?auto_39019 ?auto_39021 ) ) ( not ( = ?auto_39019 ?auto_39022 ) ) ( not ( = ?auto_39020 ?auto_39021 ) ) ( not ( = ?auto_39020 ?auto_39022 ) ) ( not ( = ?auto_39021 ?auto_39022 ) ) ( ON ?auto_39022 ?auto_39023 ) ( not ( = ?auto_39018 ?auto_39023 ) ) ( not ( = ?auto_39019 ?auto_39023 ) ) ( not ( = ?auto_39020 ?auto_39023 ) ) ( not ( = ?auto_39021 ?auto_39023 ) ) ( not ( = ?auto_39022 ?auto_39023 ) ) ( ON ?auto_39021 ?auto_39022 ) ( ON-TABLE ?auto_39023 ) ( CLEAR ?auto_39019 ) ( ON ?auto_39020 ?auto_39021 ) ( CLEAR ?auto_39020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39023 ?auto_39022 ?auto_39021 )
      ( MAKE-5PILE ?auto_39018 ?auto_39019 ?auto_39020 ?auto_39021 ?auto_39022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39024 - BLOCK
      ?auto_39025 - BLOCK
      ?auto_39026 - BLOCK
      ?auto_39027 - BLOCK
      ?auto_39028 - BLOCK
    )
    :vars
    (
      ?auto_39029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39024 ) ( not ( = ?auto_39024 ?auto_39025 ) ) ( not ( = ?auto_39024 ?auto_39026 ) ) ( not ( = ?auto_39024 ?auto_39027 ) ) ( not ( = ?auto_39024 ?auto_39028 ) ) ( not ( = ?auto_39025 ?auto_39026 ) ) ( not ( = ?auto_39025 ?auto_39027 ) ) ( not ( = ?auto_39025 ?auto_39028 ) ) ( not ( = ?auto_39026 ?auto_39027 ) ) ( not ( = ?auto_39026 ?auto_39028 ) ) ( not ( = ?auto_39027 ?auto_39028 ) ) ( ON ?auto_39028 ?auto_39029 ) ( not ( = ?auto_39024 ?auto_39029 ) ) ( not ( = ?auto_39025 ?auto_39029 ) ) ( not ( = ?auto_39026 ?auto_39029 ) ) ( not ( = ?auto_39027 ?auto_39029 ) ) ( not ( = ?auto_39028 ?auto_39029 ) ) ( ON ?auto_39027 ?auto_39028 ) ( ON-TABLE ?auto_39029 ) ( ON ?auto_39026 ?auto_39027 ) ( CLEAR ?auto_39026 ) ( HOLDING ?auto_39025 ) ( CLEAR ?auto_39024 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39024 ?auto_39025 )
      ( MAKE-5PILE ?auto_39024 ?auto_39025 ?auto_39026 ?auto_39027 ?auto_39028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39030 - BLOCK
      ?auto_39031 - BLOCK
      ?auto_39032 - BLOCK
      ?auto_39033 - BLOCK
      ?auto_39034 - BLOCK
    )
    :vars
    (
      ?auto_39035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39030 ) ( not ( = ?auto_39030 ?auto_39031 ) ) ( not ( = ?auto_39030 ?auto_39032 ) ) ( not ( = ?auto_39030 ?auto_39033 ) ) ( not ( = ?auto_39030 ?auto_39034 ) ) ( not ( = ?auto_39031 ?auto_39032 ) ) ( not ( = ?auto_39031 ?auto_39033 ) ) ( not ( = ?auto_39031 ?auto_39034 ) ) ( not ( = ?auto_39032 ?auto_39033 ) ) ( not ( = ?auto_39032 ?auto_39034 ) ) ( not ( = ?auto_39033 ?auto_39034 ) ) ( ON ?auto_39034 ?auto_39035 ) ( not ( = ?auto_39030 ?auto_39035 ) ) ( not ( = ?auto_39031 ?auto_39035 ) ) ( not ( = ?auto_39032 ?auto_39035 ) ) ( not ( = ?auto_39033 ?auto_39035 ) ) ( not ( = ?auto_39034 ?auto_39035 ) ) ( ON ?auto_39033 ?auto_39034 ) ( ON-TABLE ?auto_39035 ) ( ON ?auto_39032 ?auto_39033 ) ( CLEAR ?auto_39030 ) ( ON ?auto_39031 ?auto_39032 ) ( CLEAR ?auto_39031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39035 ?auto_39034 ?auto_39033 ?auto_39032 )
      ( MAKE-5PILE ?auto_39030 ?auto_39031 ?auto_39032 ?auto_39033 ?auto_39034 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39036 - BLOCK
      ?auto_39037 - BLOCK
      ?auto_39038 - BLOCK
      ?auto_39039 - BLOCK
      ?auto_39040 - BLOCK
    )
    :vars
    (
      ?auto_39041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39036 ?auto_39037 ) ) ( not ( = ?auto_39036 ?auto_39038 ) ) ( not ( = ?auto_39036 ?auto_39039 ) ) ( not ( = ?auto_39036 ?auto_39040 ) ) ( not ( = ?auto_39037 ?auto_39038 ) ) ( not ( = ?auto_39037 ?auto_39039 ) ) ( not ( = ?auto_39037 ?auto_39040 ) ) ( not ( = ?auto_39038 ?auto_39039 ) ) ( not ( = ?auto_39038 ?auto_39040 ) ) ( not ( = ?auto_39039 ?auto_39040 ) ) ( ON ?auto_39040 ?auto_39041 ) ( not ( = ?auto_39036 ?auto_39041 ) ) ( not ( = ?auto_39037 ?auto_39041 ) ) ( not ( = ?auto_39038 ?auto_39041 ) ) ( not ( = ?auto_39039 ?auto_39041 ) ) ( not ( = ?auto_39040 ?auto_39041 ) ) ( ON ?auto_39039 ?auto_39040 ) ( ON-TABLE ?auto_39041 ) ( ON ?auto_39038 ?auto_39039 ) ( ON ?auto_39037 ?auto_39038 ) ( CLEAR ?auto_39037 ) ( HOLDING ?auto_39036 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39036 )
      ( MAKE-5PILE ?auto_39036 ?auto_39037 ?auto_39038 ?auto_39039 ?auto_39040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39042 - BLOCK
      ?auto_39043 - BLOCK
      ?auto_39044 - BLOCK
      ?auto_39045 - BLOCK
      ?auto_39046 - BLOCK
    )
    :vars
    (
      ?auto_39047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39042 ?auto_39043 ) ) ( not ( = ?auto_39042 ?auto_39044 ) ) ( not ( = ?auto_39042 ?auto_39045 ) ) ( not ( = ?auto_39042 ?auto_39046 ) ) ( not ( = ?auto_39043 ?auto_39044 ) ) ( not ( = ?auto_39043 ?auto_39045 ) ) ( not ( = ?auto_39043 ?auto_39046 ) ) ( not ( = ?auto_39044 ?auto_39045 ) ) ( not ( = ?auto_39044 ?auto_39046 ) ) ( not ( = ?auto_39045 ?auto_39046 ) ) ( ON ?auto_39046 ?auto_39047 ) ( not ( = ?auto_39042 ?auto_39047 ) ) ( not ( = ?auto_39043 ?auto_39047 ) ) ( not ( = ?auto_39044 ?auto_39047 ) ) ( not ( = ?auto_39045 ?auto_39047 ) ) ( not ( = ?auto_39046 ?auto_39047 ) ) ( ON ?auto_39045 ?auto_39046 ) ( ON-TABLE ?auto_39047 ) ( ON ?auto_39044 ?auto_39045 ) ( ON ?auto_39043 ?auto_39044 ) ( ON ?auto_39042 ?auto_39043 ) ( CLEAR ?auto_39042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39047 ?auto_39046 ?auto_39045 ?auto_39044 ?auto_39043 )
      ( MAKE-5PILE ?auto_39042 ?auto_39043 ?auto_39044 ?auto_39045 ?auto_39046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39053 - BLOCK
      ?auto_39054 - BLOCK
      ?auto_39055 - BLOCK
      ?auto_39056 - BLOCK
      ?auto_39057 - BLOCK
    )
    :vars
    (
      ?auto_39058 - BLOCK
      ?auto_39059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39053 ?auto_39054 ) ) ( not ( = ?auto_39053 ?auto_39055 ) ) ( not ( = ?auto_39053 ?auto_39056 ) ) ( not ( = ?auto_39053 ?auto_39057 ) ) ( not ( = ?auto_39054 ?auto_39055 ) ) ( not ( = ?auto_39054 ?auto_39056 ) ) ( not ( = ?auto_39054 ?auto_39057 ) ) ( not ( = ?auto_39055 ?auto_39056 ) ) ( not ( = ?auto_39055 ?auto_39057 ) ) ( not ( = ?auto_39056 ?auto_39057 ) ) ( ON ?auto_39057 ?auto_39058 ) ( not ( = ?auto_39053 ?auto_39058 ) ) ( not ( = ?auto_39054 ?auto_39058 ) ) ( not ( = ?auto_39055 ?auto_39058 ) ) ( not ( = ?auto_39056 ?auto_39058 ) ) ( not ( = ?auto_39057 ?auto_39058 ) ) ( ON ?auto_39056 ?auto_39057 ) ( ON-TABLE ?auto_39058 ) ( ON ?auto_39055 ?auto_39056 ) ( ON ?auto_39054 ?auto_39055 ) ( CLEAR ?auto_39054 ) ( ON ?auto_39053 ?auto_39059 ) ( CLEAR ?auto_39053 ) ( HAND-EMPTY ) ( not ( = ?auto_39053 ?auto_39059 ) ) ( not ( = ?auto_39054 ?auto_39059 ) ) ( not ( = ?auto_39055 ?auto_39059 ) ) ( not ( = ?auto_39056 ?auto_39059 ) ) ( not ( = ?auto_39057 ?auto_39059 ) ) ( not ( = ?auto_39058 ?auto_39059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39053 ?auto_39059 )
      ( MAKE-5PILE ?auto_39053 ?auto_39054 ?auto_39055 ?auto_39056 ?auto_39057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39060 - BLOCK
      ?auto_39061 - BLOCK
      ?auto_39062 - BLOCK
      ?auto_39063 - BLOCK
      ?auto_39064 - BLOCK
    )
    :vars
    (
      ?auto_39066 - BLOCK
      ?auto_39065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39060 ?auto_39061 ) ) ( not ( = ?auto_39060 ?auto_39062 ) ) ( not ( = ?auto_39060 ?auto_39063 ) ) ( not ( = ?auto_39060 ?auto_39064 ) ) ( not ( = ?auto_39061 ?auto_39062 ) ) ( not ( = ?auto_39061 ?auto_39063 ) ) ( not ( = ?auto_39061 ?auto_39064 ) ) ( not ( = ?auto_39062 ?auto_39063 ) ) ( not ( = ?auto_39062 ?auto_39064 ) ) ( not ( = ?auto_39063 ?auto_39064 ) ) ( ON ?auto_39064 ?auto_39066 ) ( not ( = ?auto_39060 ?auto_39066 ) ) ( not ( = ?auto_39061 ?auto_39066 ) ) ( not ( = ?auto_39062 ?auto_39066 ) ) ( not ( = ?auto_39063 ?auto_39066 ) ) ( not ( = ?auto_39064 ?auto_39066 ) ) ( ON ?auto_39063 ?auto_39064 ) ( ON-TABLE ?auto_39066 ) ( ON ?auto_39062 ?auto_39063 ) ( ON ?auto_39060 ?auto_39065 ) ( CLEAR ?auto_39060 ) ( not ( = ?auto_39060 ?auto_39065 ) ) ( not ( = ?auto_39061 ?auto_39065 ) ) ( not ( = ?auto_39062 ?auto_39065 ) ) ( not ( = ?auto_39063 ?auto_39065 ) ) ( not ( = ?auto_39064 ?auto_39065 ) ) ( not ( = ?auto_39066 ?auto_39065 ) ) ( HOLDING ?auto_39061 ) ( CLEAR ?auto_39062 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39066 ?auto_39064 ?auto_39063 ?auto_39062 ?auto_39061 )
      ( MAKE-5PILE ?auto_39060 ?auto_39061 ?auto_39062 ?auto_39063 ?auto_39064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39067 - BLOCK
      ?auto_39068 - BLOCK
      ?auto_39069 - BLOCK
      ?auto_39070 - BLOCK
      ?auto_39071 - BLOCK
    )
    :vars
    (
      ?auto_39072 - BLOCK
      ?auto_39073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39067 ?auto_39068 ) ) ( not ( = ?auto_39067 ?auto_39069 ) ) ( not ( = ?auto_39067 ?auto_39070 ) ) ( not ( = ?auto_39067 ?auto_39071 ) ) ( not ( = ?auto_39068 ?auto_39069 ) ) ( not ( = ?auto_39068 ?auto_39070 ) ) ( not ( = ?auto_39068 ?auto_39071 ) ) ( not ( = ?auto_39069 ?auto_39070 ) ) ( not ( = ?auto_39069 ?auto_39071 ) ) ( not ( = ?auto_39070 ?auto_39071 ) ) ( ON ?auto_39071 ?auto_39072 ) ( not ( = ?auto_39067 ?auto_39072 ) ) ( not ( = ?auto_39068 ?auto_39072 ) ) ( not ( = ?auto_39069 ?auto_39072 ) ) ( not ( = ?auto_39070 ?auto_39072 ) ) ( not ( = ?auto_39071 ?auto_39072 ) ) ( ON ?auto_39070 ?auto_39071 ) ( ON-TABLE ?auto_39072 ) ( ON ?auto_39069 ?auto_39070 ) ( ON ?auto_39067 ?auto_39073 ) ( not ( = ?auto_39067 ?auto_39073 ) ) ( not ( = ?auto_39068 ?auto_39073 ) ) ( not ( = ?auto_39069 ?auto_39073 ) ) ( not ( = ?auto_39070 ?auto_39073 ) ) ( not ( = ?auto_39071 ?auto_39073 ) ) ( not ( = ?auto_39072 ?auto_39073 ) ) ( CLEAR ?auto_39069 ) ( ON ?auto_39068 ?auto_39067 ) ( CLEAR ?auto_39068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39073 ?auto_39067 )
      ( MAKE-5PILE ?auto_39067 ?auto_39068 ?auto_39069 ?auto_39070 ?auto_39071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39074 - BLOCK
      ?auto_39075 - BLOCK
      ?auto_39076 - BLOCK
      ?auto_39077 - BLOCK
      ?auto_39078 - BLOCK
    )
    :vars
    (
      ?auto_39079 - BLOCK
      ?auto_39080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39074 ?auto_39075 ) ) ( not ( = ?auto_39074 ?auto_39076 ) ) ( not ( = ?auto_39074 ?auto_39077 ) ) ( not ( = ?auto_39074 ?auto_39078 ) ) ( not ( = ?auto_39075 ?auto_39076 ) ) ( not ( = ?auto_39075 ?auto_39077 ) ) ( not ( = ?auto_39075 ?auto_39078 ) ) ( not ( = ?auto_39076 ?auto_39077 ) ) ( not ( = ?auto_39076 ?auto_39078 ) ) ( not ( = ?auto_39077 ?auto_39078 ) ) ( ON ?auto_39078 ?auto_39079 ) ( not ( = ?auto_39074 ?auto_39079 ) ) ( not ( = ?auto_39075 ?auto_39079 ) ) ( not ( = ?auto_39076 ?auto_39079 ) ) ( not ( = ?auto_39077 ?auto_39079 ) ) ( not ( = ?auto_39078 ?auto_39079 ) ) ( ON ?auto_39077 ?auto_39078 ) ( ON-TABLE ?auto_39079 ) ( ON ?auto_39074 ?auto_39080 ) ( not ( = ?auto_39074 ?auto_39080 ) ) ( not ( = ?auto_39075 ?auto_39080 ) ) ( not ( = ?auto_39076 ?auto_39080 ) ) ( not ( = ?auto_39077 ?auto_39080 ) ) ( not ( = ?auto_39078 ?auto_39080 ) ) ( not ( = ?auto_39079 ?auto_39080 ) ) ( ON ?auto_39075 ?auto_39074 ) ( CLEAR ?auto_39075 ) ( ON-TABLE ?auto_39080 ) ( HOLDING ?auto_39076 ) ( CLEAR ?auto_39077 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39079 ?auto_39078 ?auto_39077 ?auto_39076 )
      ( MAKE-5PILE ?auto_39074 ?auto_39075 ?auto_39076 ?auto_39077 ?auto_39078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39081 - BLOCK
      ?auto_39082 - BLOCK
      ?auto_39083 - BLOCK
      ?auto_39084 - BLOCK
      ?auto_39085 - BLOCK
    )
    :vars
    (
      ?auto_39087 - BLOCK
      ?auto_39086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39081 ?auto_39082 ) ) ( not ( = ?auto_39081 ?auto_39083 ) ) ( not ( = ?auto_39081 ?auto_39084 ) ) ( not ( = ?auto_39081 ?auto_39085 ) ) ( not ( = ?auto_39082 ?auto_39083 ) ) ( not ( = ?auto_39082 ?auto_39084 ) ) ( not ( = ?auto_39082 ?auto_39085 ) ) ( not ( = ?auto_39083 ?auto_39084 ) ) ( not ( = ?auto_39083 ?auto_39085 ) ) ( not ( = ?auto_39084 ?auto_39085 ) ) ( ON ?auto_39085 ?auto_39087 ) ( not ( = ?auto_39081 ?auto_39087 ) ) ( not ( = ?auto_39082 ?auto_39087 ) ) ( not ( = ?auto_39083 ?auto_39087 ) ) ( not ( = ?auto_39084 ?auto_39087 ) ) ( not ( = ?auto_39085 ?auto_39087 ) ) ( ON ?auto_39084 ?auto_39085 ) ( ON-TABLE ?auto_39087 ) ( ON ?auto_39081 ?auto_39086 ) ( not ( = ?auto_39081 ?auto_39086 ) ) ( not ( = ?auto_39082 ?auto_39086 ) ) ( not ( = ?auto_39083 ?auto_39086 ) ) ( not ( = ?auto_39084 ?auto_39086 ) ) ( not ( = ?auto_39085 ?auto_39086 ) ) ( not ( = ?auto_39087 ?auto_39086 ) ) ( ON ?auto_39082 ?auto_39081 ) ( ON-TABLE ?auto_39086 ) ( CLEAR ?auto_39084 ) ( ON ?auto_39083 ?auto_39082 ) ( CLEAR ?auto_39083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39086 ?auto_39081 ?auto_39082 )
      ( MAKE-5PILE ?auto_39081 ?auto_39082 ?auto_39083 ?auto_39084 ?auto_39085 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39088 - BLOCK
      ?auto_39089 - BLOCK
      ?auto_39090 - BLOCK
      ?auto_39091 - BLOCK
      ?auto_39092 - BLOCK
    )
    :vars
    (
      ?auto_39093 - BLOCK
      ?auto_39094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39088 ?auto_39089 ) ) ( not ( = ?auto_39088 ?auto_39090 ) ) ( not ( = ?auto_39088 ?auto_39091 ) ) ( not ( = ?auto_39088 ?auto_39092 ) ) ( not ( = ?auto_39089 ?auto_39090 ) ) ( not ( = ?auto_39089 ?auto_39091 ) ) ( not ( = ?auto_39089 ?auto_39092 ) ) ( not ( = ?auto_39090 ?auto_39091 ) ) ( not ( = ?auto_39090 ?auto_39092 ) ) ( not ( = ?auto_39091 ?auto_39092 ) ) ( ON ?auto_39092 ?auto_39093 ) ( not ( = ?auto_39088 ?auto_39093 ) ) ( not ( = ?auto_39089 ?auto_39093 ) ) ( not ( = ?auto_39090 ?auto_39093 ) ) ( not ( = ?auto_39091 ?auto_39093 ) ) ( not ( = ?auto_39092 ?auto_39093 ) ) ( ON-TABLE ?auto_39093 ) ( ON ?auto_39088 ?auto_39094 ) ( not ( = ?auto_39088 ?auto_39094 ) ) ( not ( = ?auto_39089 ?auto_39094 ) ) ( not ( = ?auto_39090 ?auto_39094 ) ) ( not ( = ?auto_39091 ?auto_39094 ) ) ( not ( = ?auto_39092 ?auto_39094 ) ) ( not ( = ?auto_39093 ?auto_39094 ) ) ( ON ?auto_39089 ?auto_39088 ) ( ON-TABLE ?auto_39094 ) ( ON ?auto_39090 ?auto_39089 ) ( CLEAR ?auto_39090 ) ( HOLDING ?auto_39091 ) ( CLEAR ?auto_39092 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39093 ?auto_39092 ?auto_39091 )
      ( MAKE-5PILE ?auto_39088 ?auto_39089 ?auto_39090 ?auto_39091 ?auto_39092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39095 - BLOCK
      ?auto_39096 - BLOCK
      ?auto_39097 - BLOCK
      ?auto_39098 - BLOCK
      ?auto_39099 - BLOCK
    )
    :vars
    (
      ?auto_39100 - BLOCK
      ?auto_39101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39095 ?auto_39096 ) ) ( not ( = ?auto_39095 ?auto_39097 ) ) ( not ( = ?auto_39095 ?auto_39098 ) ) ( not ( = ?auto_39095 ?auto_39099 ) ) ( not ( = ?auto_39096 ?auto_39097 ) ) ( not ( = ?auto_39096 ?auto_39098 ) ) ( not ( = ?auto_39096 ?auto_39099 ) ) ( not ( = ?auto_39097 ?auto_39098 ) ) ( not ( = ?auto_39097 ?auto_39099 ) ) ( not ( = ?auto_39098 ?auto_39099 ) ) ( ON ?auto_39099 ?auto_39100 ) ( not ( = ?auto_39095 ?auto_39100 ) ) ( not ( = ?auto_39096 ?auto_39100 ) ) ( not ( = ?auto_39097 ?auto_39100 ) ) ( not ( = ?auto_39098 ?auto_39100 ) ) ( not ( = ?auto_39099 ?auto_39100 ) ) ( ON-TABLE ?auto_39100 ) ( ON ?auto_39095 ?auto_39101 ) ( not ( = ?auto_39095 ?auto_39101 ) ) ( not ( = ?auto_39096 ?auto_39101 ) ) ( not ( = ?auto_39097 ?auto_39101 ) ) ( not ( = ?auto_39098 ?auto_39101 ) ) ( not ( = ?auto_39099 ?auto_39101 ) ) ( not ( = ?auto_39100 ?auto_39101 ) ) ( ON ?auto_39096 ?auto_39095 ) ( ON-TABLE ?auto_39101 ) ( ON ?auto_39097 ?auto_39096 ) ( CLEAR ?auto_39099 ) ( ON ?auto_39098 ?auto_39097 ) ( CLEAR ?auto_39098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39101 ?auto_39095 ?auto_39096 ?auto_39097 )
      ( MAKE-5PILE ?auto_39095 ?auto_39096 ?auto_39097 ?auto_39098 ?auto_39099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39102 - BLOCK
      ?auto_39103 - BLOCK
      ?auto_39104 - BLOCK
      ?auto_39105 - BLOCK
      ?auto_39106 - BLOCK
    )
    :vars
    (
      ?auto_39108 - BLOCK
      ?auto_39107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39102 ?auto_39103 ) ) ( not ( = ?auto_39102 ?auto_39104 ) ) ( not ( = ?auto_39102 ?auto_39105 ) ) ( not ( = ?auto_39102 ?auto_39106 ) ) ( not ( = ?auto_39103 ?auto_39104 ) ) ( not ( = ?auto_39103 ?auto_39105 ) ) ( not ( = ?auto_39103 ?auto_39106 ) ) ( not ( = ?auto_39104 ?auto_39105 ) ) ( not ( = ?auto_39104 ?auto_39106 ) ) ( not ( = ?auto_39105 ?auto_39106 ) ) ( not ( = ?auto_39102 ?auto_39108 ) ) ( not ( = ?auto_39103 ?auto_39108 ) ) ( not ( = ?auto_39104 ?auto_39108 ) ) ( not ( = ?auto_39105 ?auto_39108 ) ) ( not ( = ?auto_39106 ?auto_39108 ) ) ( ON-TABLE ?auto_39108 ) ( ON ?auto_39102 ?auto_39107 ) ( not ( = ?auto_39102 ?auto_39107 ) ) ( not ( = ?auto_39103 ?auto_39107 ) ) ( not ( = ?auto_39104 ?auto_39107 ) ) ( not ( = ?auto_39105 ?auto_39107 ) ) ( not ( = ?auto_39106 ?auto_39107 ) ) ( not ( = ?auto_39108 ?auto_39107 ) ) ( ON ?auto_39103 ?auto_39102 ) ( ON-TABLE ?auto_39107 ) ( ON ?auto_39104 ?auto_39103 ) ( ON ?auto_39105 ?auto_39104 ) ( CLEAR ?auto_39105 ) ( HOLDING ?auto_39106 ) ( CLEAR ?auto_39108 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39108 ?auto_39106 )
      ( MAKE-5PILE ?auto_39102 ?auto_39103 ?auto_39104 ?auto_39105 ?auto_39106 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39109 - BLOCK
      ?auto_39110 - BLOCK
      ?auto_39111 - BLOCK
      ?auto_39112 - BLOCK
      ?auto_39113 - BLOCK
    )
    :vars
    (
      ?auto_39114 - BLOCK
      ?auto_39115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39109 ?auto_39110 ) ) ( not ( = ?auto_39109 ?auto_39111 ) ) ( not ( = ?auto_39109 ?auto_39112 ) ) ( not ( = ?auto_39109 ?auto_39113 ) ) ( not ( = ?auto_39110 ?auto_39111 ) ) ( not ( = ?auto_39110 ?auto_39112 ) ) ( not ( = ?auto_39110 ?auto_39113 ) ) ( not ( = ?auto_39111 ?auto_39112 ) ) ( not ( = ?auto_39111 ?auto_39113 ) ) ( not ( = ?auto_39112 ?auto_39113 ) ) ( not ( = ?auto_39109 ?auto_39114 ) ) ( not ( = ?auto_39110 ?auto_39114 ) ) ( not ( = ?auto_39111 ?auto_39114 ) ) ( not ( = ?auto_39112 ?auto_39114 ) ) ( not ( = ?auto_39113 ?auto_39114 ) ) ( ON-TABLE ?auto_39114 ) ( ON ?auto_39109 ?auto_39115 ) ( not ( = ?auto_39109 ?auto_39115 ) ) ( not ( = ?auto_39110 ?auto_39115 ) ) ( not ( = ?auto_39111 ?auto_39115 ) ) ( not ( = ?auto_39112 ?auto_39115 ) ) ( not ( = ?auto_39113 ?auto_39115 ) ) ( not ( = ?auto_39114 ?auto_39115 ) ) ( ON ?auto_39110 ?auto_39109 ) ( ON-TABLE ?auto_39115 ) ( ON ?auto_39111 ?auto_39110 ) ( ON ?auto_39112 ?auto_39111 ) ( CLEAR ?auto_39114 ) ( ON ?auto_39113 ?auto_39112 ) ( CLEAR ?auto_39113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39115 ?auto_39109 ?auto_39110 ?auto_39111 ?auto_39112 )
      ( MAKE-5PILE ?auto_39109 ?auto_39110 ?auto_39111 ?auto_39112 ?auto_39113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39116 - BLOCK
      ?auto_39117 - BLOCK
      ?auto_39118 - BLOCK
      ?auto_39119 - BLOCK
      ?auto_39120 - BLOCK
    )
    :vars
    (
      ?auto_39121 - BLOCK
      ?auto_39122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39116 ?auto_39117 ) ) ( not ( = ?auto_39116 ?auto_39118 ) ) ( not ( = ?auto_39116 ?auto_39119 ) ) ( not ( = ?auto_39116 ?auto_39120 ) ) ( not ( = ?auto_39117 ?auto_39118 ) ) ( not ( = ?auto_39117 ?auto_39119 ) ) ( not ( = ?auto_39117 ?auto_39120 ) ) ( not ( = ?auto_39118 ?auto_39119 ) ) ( not ( = ?auto_39118 ?auto_39120 ) ) ( not ( = ?auto_39119 ?auto_39120 ) ) ( not ( = ?auto_39116 ?auto_39121 ) ) ( not ( = ?auto_39117 ?auto_39121 ) ) ( not ( = ?auto_39118 ?auto_39121 ) ) ( not ( = ?auto_39119 ?auto_39121 ) ) ( not ( = ?auto_39120 ?auto_39121 ) ) ( ON ?auto_39116 ?auto_39122 ) ( not ( = ?auto_39116 ?auto_39122 ) ) ( not ( = ?auto_39117 ?auto_39122 ) ) ( not ( = ?auto_39118 ?auto_39122 ) ) ( not ( = ?auto_39119 ?auto_39122 ) ) ( not ( = ?auto_39120 ?auto_39122 ) ) ( not ( = ?auto_39121 ?auto_39122 ) ) ( ON ?auto_39117 ?auto_39116 ) ( ON-TABLE ?auto_39122 ) ( ON ?auto_39118 ?auto_39117 ) ( ON ?auto_39119 ?auto_39118 ) ( ON ?auto_39120 ?auto_39119 ) ( CLEAR ?auto_39120 ) ( HOLDING ?auto_39121 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39121 )
      ( MAKE-5PILE ?auto_39116 ?auto_39117 ?auto_39118 ?auto_39119 ?auto_39120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39123 - BLOCK
      ?auto_39124 - BLOCK
      ?auto_39125 - BLOCK
      ?auto_39126 - BLOCK
      ?auto_39127 - BLOCK
    )
    :vars
    (
      ?auto_39128 - BLOCK
      ?auto_39129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39123 ?auto_39124 ) ) ( not ( = ?auto_39123 ?auto_39125 ) ) ( not ( = ?auto_39123 ?auto_39126 ) ) ( not ( = ?auto_39123 ?auto_39127 ) ) ( not ( = ?auto_39124 ?auto_39125 ) ) ( not ( = ?auto_39124 ?auto_39126 ) ) ( not ( = ?auto_39124 ?auto_39127 ) ) ( not ( = ?auto_39125 ?auto_39126 ) ) ( not ( = ?auto_39125 ?auto_39127 ) ) ( not ( = ?auto_39126 ?auto_39127 ) ) ( not ( = ?auto_39123 ?auto_39128 ) ) ( not ( = ?auto_39124 ?auto_39128 ) ) ( not ( = ?auto_39125 ?auto_39128 ) ) ( not ( = ?auto_39126 ?auto_39128 ) ) ( not ( = ?auto_39127 ?auto_39128 ) ) ( ON ?auto_39123 ?auto_39129 ) ( not ( = ?auto_39123 ?auto_39129 ) ) ( not ( = ?auto_39124 ?auto_39129 ) ) ( not ( = ?auto_39125 ?auto_39129 ) ) ( not ( = ?auto_39126 ?auto_39129 ) ) ( not ( = ?auto_39127 ?auto_39129 ) ) ( not ( = ?auto_39128 ?auto_39129 ) ) ( ON ?auto_39124 ?auto_39123 ) ( ON-TABLE ?auto_39129 ) ( ON ?auto_39125 ?auto_39124 ) ( ON ?auto_39126 ?auto_39125 ) ( ON ?auto_39127 ?auto_39126 ) ( ON ?auto_39128 ?auto_39127 ) ( CLEAR ?auto_39128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39129 ?auto_39123 ?auto_39124 ?auto_39125 ?auto_39126 ?auto_39127 )
      ( MAKE-5PILE ?auto_39123 ?auto_39124 ?auto_39125 ?auto_39126 ?auto_39127 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39142 - BLOCK
      ?auto_39143 - BLOCK
      ?auto_39144 - BLOCK
      ?auto_39145 - BLOCK
      ?auto_39146 - BLOCK
      ?auto_39147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39146 ) ( ON-TABLE ?auto_39142 ) ( ON ?auto_39143 ?auto_39142 ) ( ON ?auto_39144 ?auto_39143 ) ( ON ?auto_39145 ?auto_39144 ) ( ON ?auto_39146 ?auto_39145 ) ( not ( = ?auto_39142 ?auto_39143 ) ) ( not ( = ?auto_39142 ?auto_39144 ) ) ( not ( = ?auto_39142 ?auto_39145 ) ) ( not ( = ?auto_39142 ?auto_39146 ) ) ( not ( = ?auto_39142 ?auto_39147 ) ) ( not ( = ?auto_39143 ?auto_39144 ) ) ( not ( = ?auto_39143 ?auto_39145 ) ) ( not ( = ?auto_39143 ?auto_39146 ) ) ( not ( = ?auto_39143 ?auto_39147 ) ) ( not ( = ?auto_39144 ?auto_39145 ) ) ( not ( = ?auto_39144 ?auto_39146 ) ) ( not ( = ?auto_39144 ?auto_39147 ) ) ( not ( = ?auto_39145 ?auto_39146 ) ) ( not ( = ?auto_39145 ?auto_39147 ) ) ( not ( = ?auto_39146 ?auto_39147 ) ) ( ON-TABLE ?auto_39147 ) ( CLEAR ?auto_39147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_39147 )
      ( MAKE-6PILE ?auto_39142 ?auto_39143 ?auto_39144 ?auto_39145 ?auto_39146 ?auto_39147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39148 - BLOCK
      ?auto_39149 - BLOCK
      ?auto_39150 - BLOCK
      ?auto_39151 - BLOCK
      ?auto_39152 - BLOCK
      ?auto_39153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39148 ) ( ON ?auto_39149 ?auto_39148 ) ( ON ?auto_39150 ?auto_39149 ) ( ON ?auto_39151 ?auto_39150 ) ( not ( = ?auto_39148 ?auto_39149 ) ) ( not ( = ?auto_39148 ?auto_39150 ) ) ( not ( = ?auto_39148 ?auto_39151 ) ) ( not ( = ?auto_39148 ?auto_39152 ) ) ( not ( = ?auto_39148 ?auto_39153 ) ) ( not ( = ?auto_39149 ?auto_39150 ) ) ( not ( = ?auto_39149 ?auto_39151 ) ) ( not ( = ?auto_39149 ?auto_39152 ) ) ( not ( = ?auto_39149 ?auto_39153 ) ) ( not ( = ?auto_39150 ?auto_39151 ) ) ( not ( = ?auto_39150 ?auto_39152 ) ) ( not ( = ?auto_39150 ?auto_39153 ) ) ( not ( = ?auto_39151 ?auto_39152 ) ) ( not ( = ?auto_39151 ?auto_39153 ) ) ( not ( = ?auto_39152 ?auto_39153 ) ) ( ON-TABLE ?auto_39153 ) ( CLEAR ?auto_39153 ) ( HOLDING ?auto_39152 ) ( CLEAR ?auto_39151 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39148 ?auto_39149 ?auto_39150 ?auto_39151 ?auto_39152 )
      ( MAKE-6PILE ?auto_39148 ?auto_39149 ?auto_39150 ?auto_39151 ?auto_39152 ?auto_39153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39154 - BLOCK
      ?auto_39155 - BLOCK
      ?auto_39156 - BLOCK
      ?auto_39157 - BLOCK
      ?auto_39158 - BLOCK
      ?auto_39159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39154 ) ( ON ?auto_39155 ?auto_39154 ) ( ON ?auto_39156 ?auto_39155 ) ( ON ?auto_39157 ?auto_39156 ) ( not ( = ?auto_39154 ?auto_39155 ) ) ( not ( = ?auto_39154 ?auto_39156 ) ) ( not ( = ?auto_39154 ?auto_39157 ) ) ( not ( = ?auto_39154 ?auto_39158 ) ) ( not ( = ?auto_39154 ?auto_39159 ) ) ( not ( = ?auto_39155 ?auto_39156 ) ) ( not ( = ?auto_39155 ?auto_39157 ) ) ( not ( = ?auto_39155 ?auto_39158 ) ) ( not ( = ?auto_39155 ?auto_39159 ) ) ( not ( = ?auto_39156 ?auto_39157 ) ) ( not ( = ?auto_39156 ?auto_39158 ) ) ( not ( = ?auto_39156 ?auto_39159 ) ) ( not ( = ?auto_39157 ?auto_39158 ) ) ( not ( = ?auto_39157 ?auto_39159 ) ) ( not ( = ?auto_39158 ?auto_39159 ) ) ( ON-TABLE ?auto_39159 ) ( CLEAR ?auto_39157 ) ( ON ?auto_39158 ?auto_39159 ) ( CLEAR ?auto_39158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39159 )
      ( MAKE-6PILE ?auto_39154 ?auto_39155 ?auto_39156 ?auto_39157 ?auto_39158 ?auto_39159 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39160 - BLOCK
      ?auto_39161 - BLOCK
      ?auto_39162 - BLOCK
      ?auto_39163 - BLOCK
      ?auto_39164 - BLOCK
      ?auto_39165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39160 ) ( ON ?auto_39161 ?auto_39160 ) ( ON ?auto_39162 ?auto_39161 ) ( not ( = ?auto_39160 ?auto_39161 ) ) ( not ( = ?auto_39160 ?auto_39162 ) ) ( not ( = ?auto_39160 ?auto_39163 ) ) ( not ( = ?auto_39160 ?auto_39164 ) ) ( not ( = ?auto_39160 ?auto_39165 ) ) ( not ( = ?auto_39161 ?auto_39162 ) ) ( not ( = ?auto_39161 ?auto_39163 ) ) ( not ( = ?auto_39161 ?auto_39164 ) ) ( not ( = ?auto_39161 ?auto_39165 ) ) ( not ( = ?auto_39162 ?auto_39163 ) ) ( not ( = ?auto_39162 ?auto_39164 ) ) ( not ( = ?auto_39162 ?auto_39165 ) ) ( not ( = ?auto_39163 ?auto_39164 ) ) ( not ( = ?auto_39163 ?auto_39165 ) ) ( not ( = ?auto_39164 ?auto_39165 ) ) ( ON-TABLE ?auto_39165 ) ( ON ?auto_39164 ?auto_39165 ) ( CLEAR ?auto_39164 ) ( HOLDING ?auto_39163 ) ( CLEAR ?auto_39162 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39160 ?auto_39161 ?auto_39162 ?auto_39163 )
      ( MAKE-6PILE ?auto_39160 ?auto_39161 ?auto_39162 ?auto_39163 ?auto_39164 ?auto_39165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39166 - BLOCK
      ?auto_39167 - BLOCK
      ?auto_39168 - BLOCK
      ?auto_39169 - BLOCK
      ?auto_39170 - BLOCK
      ?auto_39171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39166 ) ( ON ?auto_39167 ?auto_39166 ) ( ON ?auto_39168 ?auto_39167 ) ( not ( = ?auto_39166 ?auto_39167 ) ) ( not ( = ?auto_39166 ?auto_39168 ) ) ( not ( = ?auto_39166 ?auto_39169 ) ) ( not ( = ?auto_39166 ?auto_39170 ) ) ( not ( = ?auto_39166 ?auto_39171 ) ) ( not ( = ?auto_39167 ?auto_39168 ) ) ( not ( = ?auto_39167 ?auto_39169 ) ) ( not ( = ?auto_39167 ?auto_39170 ) ) ( not ( = ?auto_39167 ?auto_39171 ) ) ( not ( = ?auto_39168 ?auto_39169 ) ) ( not ( = ?auto_39168 ?auto_39170 ) ) ( not ( = ?auto_39168 ?auto_39171 ) ) ( not ( = ?auto_39169 ?auto_39170 ) ) ( not ( = ?auto_39169 ?auto_39171 ) ) ( not ( = ?auto_39170 ?auto_39171 ) ) ( ON-TABLE ?auto_39171 ) ( ON ?auto_39170 ?auto_39171 ) ( CLEAR ?auto_39168 ) ( ON ?auto_39169 ?auto_39170 ) ( CLEAR ?auto_39169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39171 ?auto_39170 )
      ( MAKE-6PILE ?auto_39166 ?auto_39167 ?auto_39168 ?auto_39169 ?auto_39170 ?auto_39171 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39172 - BLOCK
      ?auto_39173 - BLOCK
      ?auto_39174 - BLOCK
      ?auto_39175 - BLOCK
      ?auto_39176 - BLOCK
      ?auto_39177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39172 ) ( ON ?auto_39173 ?auto_39172 ) ( not ( = ?auto_39172 ?auto_39173 ) ) ( not ( = ?auto_39172 ?auto_39174 ) ) ( not ( = ?auto_39172 ?auto_39175 ) ) ( not ( = ?auto_39172 ?auto_39176 ) ) ( not ( = ?auto_39172 ?auto_39177 ) ) ( not ( = ?auto_39173 ?auto_39174 ) ) ( not ( = ?auto_39173 ?auto_39175 ) ) ( not ( = ?auto_39173 ?auto_39176 ) ) ( not ( = ?auto_39173 ?auto_39177 ) ) ( not ( = ?auto_39174 ?auto_39175 ) ) ( not ( = ?auto_39174 ?auto_39176 ) ) ( not ( = ?auto_39174 ?auto_39177 ) ) ( not ( = ?auto_39175 ?auto_39176 ) ) ( not ( = ?auto_39175 ?auto_39177 ) ) ( not ( = ?auto_39176 ?auto_39177 ) ) ( ON-TABLE ?auto_39177 ) ( ON ?auto_39176 ?auto_39177 ) ( ON ?auto_39175 ?auto_39176 ) ( CLEAR ?auto_39175 ) ( HOLDING ?auto_39174 ) ( CLEAR ?auto_39173 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39172 ?auto_39173 ?auto_39174 )
      ( MAKE-6PILE ?auto_39172 ?auto_39173 ?auto_39174 ?auto_39175 ?auto_39176 ?auto_39177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39178 - BLOCK
      ?auto_39179 - BLOCK
      ?auto_39180 - BLOCK
      ?auto_39181 - BLOCK
      ?auto_39182 - BLOCK
      ?auto_39183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39178 ) ( ON ?auto_39179 ?auto_39178 ) ( not ( = ?auto_39178 ?auto_39179 ) ) ( not ( = ?auto_39178 ?auto_39180 ) ) ( not ( = ?auto_39178 ?auto_39181 ) ) ( not ( = ?auto_39178 ?auto_39182 ) ) ( not ( = ?auto_39178 ?auto_39183 ) ) ( not ( = ?auto_39179 ?auto_39180 ) ) ( not ( = ?auto_39179 ?auto_39181 ) ) ( not ( = ?auto_39179 ?auto_39182 ) ) ( not ( = ?auto_39179 ?auto_39183 ) ) ( not ( = ?auto_39180 ?auto_39181 ) ) ( not ( = ?auto_39180 ?auto_39182 ) ) ( not ( = ?auto_39180 ?auto_39183 ) ) ( not ( = ?auto_39181 ?auto_39182 ) ) ( not ( = ?auto_39181 ?auto_39183 ) ) ( not ( = ?auto_39182 ?auto_39183 ) ) ( ON-TABLE ?auto_39183 ) ( ON ?auto_39182 ?auto_39183 ) ( ON ?auto_39181 ?auto_39182 ) ( CLEAR ?auto_39179 ) ( ON ?auto_39180 ?auto_39181 ) ( CLEAR ?auto_39180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39183 ?auto_39182 ?auto_39181 )
      ( MAKE-6PILE ?auto_39178 ?auto_39179 ?auto_39180 ?auto_39181 ?auto_39182 ?auto_39183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39184 - BLOCK
      ?auto_39185 - BLOCK
      ?auto_39186 - BLOCK
      ?auto_39187 - BLOCK
      ?auto_39188 - BLOCK
      ?auto_39189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39184 ) ( not ( = ?auto_39184 ?auto_39185 ) ) ( not ( = ?auto_39184 ?auto_39186 ) ) ( not ( = ?auto_39184 ?auto_39187 ) ) ( not ( = ?auto_39184 ?auto_39188 ) ) ( not ( = ?auto_39184 ?auto_39189 ) ) ( not ( = ?auto_39185 ?auto_39186 ) ) ( not ( = ?auto_39185 ?auto_39187 ) ) ( not ( = ?auto_39185 ?auto_39188 ) ) ( not ( = ?auto_39185 ?auto_39189 ) ) ( not ( = ?auto_39186 ?auto_39187 ) ) ( not ( = ?auto_39186 ?auto_39188 ) ) ( not ( = ?auto_39186 ?auto_39189 ) ) ( not ( = ?auto_39187 ?auto_39188 ) ) ( not ( = ?auto_39187 ?auto_39189 ) ) ( not ( = ?auto_39188 ?auto_39189 ) ) ( ON-TABLE ?auto_39189 ) ( ON ?auto_39188 ?auto_39189 ) ( ON ?auto_39187 ?auto_39188 ) ( ON ?auto_39186 ?auto_39187 ) ( CLEAR ?auto_39186 ) ( HOLDING ?auto_39185 ) ( CLEAR ?auto_39184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39184 ?auto_39185 )
      ( MAKE-6PILE ?auto_39184 ?auto_39185 ?auto_39186 ?auto_39187 ?auto_39188 ?auto_39189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39190 - BLOCK
      ?auto_39191 - BLOCK
      ?auto_39192 - BLOCK
      ?auto_39193 - BLOCK
      ?auto_39194 - BLOCK
      ?auto_39195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39190 ) ( not ( = ?auto_39190 ?auto_39191 ) ) ( not ( = ?auto_39190 ?auto_39192 ) ) ( not ( = ?auto_39190 ?auto_39193 ) ) ( not ( = ?auto_39190 ?auto_39194 ) ) ( not ( = ?auto_39190 ?auto_39195 ) ) ( not ( = ?auto_39191 ?auto_39192 ) ) ( not ( = ?auto_39191 ?auto_39193 ) ) ( not ( = ?auto_39191 ?auto_39194 ) ) ( not ( = ?auto_39191 ?auto_39195 ) ) ( not ( = ?auto_39192 ?auto_39193 ) ) ( not ( = ?auto_39192 ?auto_39194 ) ) ( not ( = ?auto_39192 ?auto_39195 ) ) ( not ( = ?auto_39193 ?auto_39194 ) ) ( not ( = ?auto_39193 ?auto_39195 ) ) ( not ( = ?auto_39194 ?auto_39195 ) ) ( ON-TABLE ?auto_39195 ) ( ON ?auto_39194 ?auto_39195 ) ( ON ?auto_39193 ?auto_39194 ) ( ON ?auto_39192 ?auto_39193 ) ( CLEAR ?auto_39190 ) ( ON ?auto_39191 ?auto_39192 ) ( CLEAR ?auto_39191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39195 ?auto_39194 ?auto_39193 ?auto_39192 )
      ( MAKE-6PILE ?auto_39190 ?auto_39191 ?auto_39192 ?auto_39193 ?auto_39194 ?auto_39195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39196 - BLOCK
      ?auto_39197 - BLOCK
      ?auto_39198 - BLOCK
      ?auto_39199 - BLOCK
      ?auto_39200 - BLOCK
      ?auto_39201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39196 ?auto_39197 ) ) ( not ( = ?auto_39196 ?auto_39198 ) ) ( not ( = ?auto_39196 ?auto_39199 ) ) ( not ( = ?auto_39196 ?auto_39200 ) ) ( not ( = ?auto_39196 ?auto_39201 ) ) ( not ( = ?auto_39197 ?auto_39198 ) ) ( not ( = ?auto_39197 ?auto_39199 ) ) ( not ( = ?auto_39197 ?auto_39200 ) ) ( not ( = ?auto_39197 ?auto_39201 ) ) ( not ( = ?auto_39198 ?auto_39199 ) ) ( not ( = ?auto_39198 ?auto_39200 ) ) ( not ( = ?auto_39198 ?auto_39201 ) ) ( not ( = ?auto_39199 ?auto_39200 ) ) ( not ( = ?auto_39199 ?auto_39201 ) ) ( not ( = ?auto_39200 ?auto_39201 ) ) ( ON-TABLE ?auto_39201 ) ( ON ?auto_39200 ?auto_39201 ) ( ON ?auto_39199 ?auto_39200 ) ( ON ?auto_39198 ?auto_39199 ) ( ON ?auto_39197 ?auto_39198 ) ( CLEAR ?auto_39197 ) ( HOLDING ?auto_39196 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39196 )
      ( MAKE-6PILE ?auto_39196 ?auto_39197 ?auto_39198 ?auto_39199 ?auto_39200 ?auto_39201 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39202 - BLOCK
      ?auto_39203 - BLOCK
      ?auto_39204 - BLOCK
      ?auto_39205 - BLOCK
      ?auto_39206 - BLOCK
      ?auto_39207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39202 ?auto_39203 ) ) ( not ( = ?auto_39202 ?auto_39204 ) ) ( not ( = ?auto_39202 ?auto_39205 ) ) ( not ( = ?auto_39202 ?auto_39206 ) ) ( not ( = ?auto_39202 ?auto_39207 ) ) ( not ( = ?auto_39203 ?auto_39204 ) ) ( not ( = ?auto_39203 ?auto_39205 ) ) ( not ( = ?auto_39203 ?auto_39206 ) ) ( not ( = ?auto_39203 ?auto_39207 ) ) ( not ( = ?auto_39204 ?auto_39205 ) ) ( not ( = ?auto_39204 ?auto_39206 ) ) ( not ( = ?auto_39204 ?auto_39207 ) ) ( not ( = ?auto_39205 ?auto_39206 ) ) ( not ( = ?auto_39205 ?auto_39207 ) ) ( not ( = ?auto_39206 ?auto_39207 ) ) ( ON-TABLE ?auto_39207 ) ( ON ?auto_39206 ?auto_39207 ) ( ON ?auto_39205 ?auto_39206 ) ( ON ?auto_39204 ?auto_39205 ) ( ON ?auto_39203 ?auto_39204 ) ( ON ?auto_39202 ?auto_39203 ) ( CLEAR ?auto_39202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39207 ?auto_39206 ?auto_39205 ?auto_39204 ?auto_39203 )
      ( MAKE-6PILE ?auto_39202 ?auto_39203 ?auto_39204 ?auto_39205 ?auto_39206 ?auto_39207 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39214 - BLOCK
      ?auto_39215 - BLOCK
      ?auto_39216 - BLOCK
      ?auto_39217 - BLOCK
      ?auto_39218 - BLOCK
      ?auto_39219 - BLOCK
    )
    :vars
    (
      ?auto_39220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39214 ?auto_39215 ) ) ( not ( = ?auto_39214 ?auto_39216 ) ) ( not ( = ?auto_39214 ?auto_39217 ) ) ( not ( = ?auto_39214 ?auto_39218 ) ) ( not ( = ?auto_39214 ?auto_39219 ) ) ( not ( = ?auto_39215 ?auto_39216 ) ) ( not ( = ?auto_39215 ?auto_39217 ) ) ( not ( = ?auto_39215 ?auto_39218 ) ) ( not ( = ?auto_39215 ?auto_39219 ) ) ( not ( = ?auto_39216 ?auto_39217 ) ) ( not ( = ?auto_39216 ?auto_39218 ) ) ( not ( = ?auto_39216 ?auto_39219 ) ) ( not ( = ?auto_39217 ?auto_39218 ) ) ( not ( = ?auto_39217 ?auto_39219 ) ) ( not ( = ?auto_39218 ?auto_39219 ) ) ( ON-TABLE ?auto_39219 ) ( ON ?auto_39218 ?auto_39219 ) ( ON ?auto_39217 ?auto_39218 ) ( ON ?auto_39216 ?auto_39217 ) ( ON ?auto_39215 ?auto_39216 ) ( CLEAR ?auto_39215 ) ( ON ?auto_39214 ?auto_39220 ) ( CLEAR ?auto_39214 ) ( HAND-EMPTY ) ( not ( = ?auto_39214 ?auto_39220 ) ) ( not ( = ?auto_39215 ?auto_39220 ) ) ( not ( = ?auto_39216 ?auto_39220 ) ) ( not ( = ?auto_39217 ?auto_39220 ) ) ( not ( = ?auto_39218 ?auto_39220 ) ) ( not ( = ?auto_39219 ?auto_39220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39214 ?auto_39220 )
      ( MAKE-6PILE ?auto_39214 ?auto_39215 ?auto_39216 ?auto_39217 ?auto_39218 ?auto_39219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39221 - BLOCK
      ?auto_39222 - BLOCK
      ?auto_39223 - BLOCK
      ?auto_39224 - BLOCK
      ?auto_39225 - BLOCK
      ?auto_39226 - BLOCK
    )
    :vars
    (
      ?auto_39227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39221 ?auto_39222 ) ) ( not ( = ?auto_39221 ?auto_39223 ) ) ( not ( = ?auto_39221 ?auto_39224 ) ) ( not ( = ?auto_39221 ?auto_39225 ) ) ( not ( = ?auto_39221 ?auto_39226 ) ) ( not ( = ?auto_39222 ?auto_39223 ) ) ( not ( = ?auto_39222 ?auto_39224 ) ) ( not ( = ?auto_39222 ?auto_39225 ) ) ( not ( = ?auto_39222 ?auto_39226 ) ) ( not ( = ?auto_39223 ?auto_39224 ) ) ( not ( = ?auto_39223 ?auto_39225 ) ) ( not ( = ?auto_39223 ?auto_39226 ) ) ( not ( = ?auto_39224 ?auto_39225 ) ) ( not ( = ?auto_39224 ?auto_39226 ) ) ( not ( = ?auto_39225 ?auto_39226 ) ) ( ON-TABLE ?auto_39226 ) ( ON ?auto_39225 ?auto_39226 ) ( ON ?auto_39224 ?auto_39225 ) ( ON ?auto_39223 ?auto_39224 ) ( ON ?auto_39221 ?auto_39227 ) ( CLEAR ?auto_39221 ) ( not ( = ?auto_39221 ?auto_39227 ) ) ( not ( = ?auto_39222 ?auto_39227 ) ) ( not ( = ?auto_39223 ?auto_39227 ) ) ( not ( = ?auto_39224 ?auto_39227 ) ) ( not ( = ?auto_39225 ?auto_39227 ) ) ( not ( = ?auto_39226 ?auto_39227 ) ) ( HOLDING ?auto_39222 ) ( CLEAR ?auto_39223 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39226 ?auto_39225 ?auto_39224 ?auto_39223 ?auto_39222 )
      ( MAKE-6PILE ?auto_39221 ?auto_39222 ?auto_39223 ?auto_39224 ?auto_39225 ?auto_39226 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39228 - BLOCK
      ?auto_39229 - BLOCK
      ?auto_39230 - BLOCK
      ?auto_39231 - BLOCK
      ?auto_39232 - BLOCK
      ?auto_39233 - BLOCK
    )
    :vars
    (
      ?auto_39234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39228 ?auto_39229 ) ) ( not ( = ?auto_39228 ?auto_39230 ) ) ( not ( = ?auto_39228 ?auto_39231 ) ) ( not ( = ?auto_39228 ?auto_39232 ) ) ( not ( = ?auto_39228 ?auto_39233 ) ) ( not ( = ?auto_39229 ?auto_39230 ) ) ( not ( = ?auto_39229 ?auto_39231 ) ) ( not ( = ?auto_39229 ?auto_39232 ) ) ( not ( = ?auto_39229 ?auto_39233 ) ) ( not ( = ?auto_39230 ?auto_39231 ) ) ( not ( = ?auto_39230 ?auto_39232 ) ) ( not ( = ?auto_39230 ?auto_39233 ) ) ( not ( = ?auto_39231 ?auto_39232 ) ) ( not ( = ?auto_39231 ?auto_39233 ) ) ( not ( = ?auto_39232 ?auto_39233 ) ) ( ON-TABLE ?auto_39233 ) ( ON ?auto_39232 ?auto_39233 ) ( ON ?auto_39231 ?auto_39232 ) ( ON ?auto_39230 ?auto_39231 ) ( ON ?auto_39228 ?auto_39234 ) ( not ( = ?auto_39228 ?auto_39234 ) ) ( not ( = ?auto_39229 ?auto_39234 ) ) ( not ( = ?auto_39230 ?auto_39234 ) ) ( not ( = ?auto_39231 ?auto_39234 ) ) ( not ( = ?auto_39232 ?auto_39234 ) ) ( not ( = ?auto_39233 ?auto_39234 ) ) ( CLEAR ?auto_39230 ) ( ON ?auto_39229 ?auto_39228 ) ( CLEAR ?auto_39229 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39234 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39234 ?auto_39228 )
      ( MAKE-6PILE ?auto_39228 ?auto_39229 ?auto_39230 ?auto_39231 ?auto_39232 ?auto_39233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39235 - BLOCK
      ?auto_39236 - BLOCK
      ?auto_39237 - BLOCK
      ?auto_39238 - BLOCK
      ?auto_39239 - BLOCK
      ?auto_39240 - BLOCK
    )
    :vars
    (
      ?auto_39241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39235 ?auto_39236 ) ) ( not ( = ?auto_39235 ?auto_39237 ) ) ( not ( = ?auto_39235 ?auto_39238 ) ) ( not ( = ?auto_39235 ?auto_39239 ) ) ( not ( = ?auto_39235 ?auto_39240 ) ) ( not ( = ?auto_39236 ?auto_39237 ) ) ( not ( = ?auto_39236 ?auto_39238 ) ) ( not ( = ?auto_39236 ?auto_39239 ) ) ( not ( = ?auto_39236 ?auto_39240 ) ) ( not ( = ?auto_39237 ?auto_39238 ) ) ( not ( = ?auto_39237 ?auto_39239 ) ) ( not ( = ?auto_39237 ?auto_39240 ) ) ( not ( = ?auto_39238 ?auto_39239 ) ) ( not ( = ?auto_39238 ?auto_39240 ) ) ( not ( = ?auto_39239 ?auto_39240 ) ) ( ON-TABLE ?auto_39240 ) ( ON ?auto_39239 ?auto_39240 ) ( ON ?auto_39238 ?auto_39239 ) ( ON ?auto_39235 ?auto_39241 ) ( not ( = ?auto_39235 ?auto_39241 ) ) ( not ( = ?auto_39236 ?auto_39241 ) ) ( not ( = ?auto_39237 ?auto_39241 ) ) ( not ( = ?auto_39238 ?auto_39241 ) ) ( not ( = ?auto_39239 ?auto_39241 ) ) ( not ( = ?auto_39240 ?auto_39241 ) ) ( ON ?auto_39236 ?auto_39235 ) ( CLEAR ?auto_39236 ) ( ON-TABLE ?auto_39241 ) ( HOLDING ?auto_39237 ) ( CLEAR ?auto_39238 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39240 ?auto_39239 ?auto_39238 ?auto_39237 )
      ( MAKE-6PILE ?auto_39235 ?auto_39236 ?auto_39237 ?auto_39238 ?auto_39239 ?auto_39240 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39242 - BLOCK
      ?auto_39243 - BLOCK
      ?auto_39244 - BLOCK
      ?auto_39245 - BLOCK
      ?auto_39246 - BLOCK
      ?auto_39247 - BLOCK
    )
    :vars
    (
      ?auto_39248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39242 ?auto_39243 ) ) ( not ( = ?auto_39242 ?auto_39244 ) ) ( not ( = ?auto_39242 ?auto_39245 ) ) ( not ( = ?auto_39242 ?auto_39246 ) ) ( not ( = ?auto_39242 ?auto_39247 ) ) ( not ( = ?auto_39243 ?auto_39244 ) ) ( not ( = ?auto_39243 ?auto_39245 ) ) ( not ( = ?auto_39243 ?auto_39246 ) ) ( not ( = ?auto_39243 ?auto_39247 ) ) ( not ( = ?auto_39244 ?auto_39245 ) ) ( not ( = ?auto_39244 ?auto_39246 ) ) ( not ( = ?auto_39244 ?auto_39247 ) ) ( not ( = ?auto_39245 ?auto_39246 ) ) ( not ( = ?auto_39245 ?auto_39247 ) ) ( not ( = ?auto_39246 ?auto_39247 ) ) ( ON-TABLE ?auto_39247 ) ( ON ?auto_39246 ?auto_39247 ) ( ON ?auto_39245 ?auto_39246 ) ( ON ?auto_39242 ?auto_39248 ) ( not ( = ?auto_39242 ?auto_39248 ) ) ( not ( = ?auto_39243 ?auto_39248 ) ) ( not ( = ?auto_39244 ?auto_39248 ) ) ( not ( = ?auto_39245 ?auto_39248 ) ) ( not ( = ?auto_39246 ?auto_39248 ) ) ( not ( = ?auto_39247 ?auto_39248 ) ) ( ON ?auto_39243 ?auto_39242 ) ( ON-TABLE ?auto_39248 ) ( CLEAR ?auto_39245 ) ( ON ?auto_39244 ?auto_39243 ) ( CLEAR ?auto_39244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39248 ?auto_39242 ?auto_39243 )
      ( MAKE-6PILE ?auto_39242 ?auto_39243 ?auto_39244 ?auto_39245 ?auto_39246 ?auto_39247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39249 - BLOCK
      ?auto_39250 - BLOCK
      ?auto_39251 - BLOCK
      ?auto_39252 - BLOCK
      ?auto_39253 - BLOCK
      ?auto_39254 - BLOCK
    )
    :vars
    (
      ?auto_39255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39249 ?auto_39250 ) ) ( not ( = ?auto_39249 ?auto_39251 ) ) ( not ( = ?auto_39249 ?auto_39252 ) ) ( not ( = ?auto_39249 ?auto_39253 ) ) ( not ( = ?auto_39249 ?auto_39254 ) ) ( not ( = ?auto_39250 ?auto_39251 ) ) ( not ( = ?auto_39250 ?auto_39252 ) ) ( not ( = ?auto_39250 ?auto_39253 ) ) ( not ( = ?auto_39250 ?auto_39254 ) ) ( not ( = ?auto_39251 ?auto_39252 ) ) ( not ( = ?auto_39251 ?auto_39253 ) ) ( not ( = ?auto_39251 ?auto_39254 ) ) ( not ( = ?auto_39252 ?auto_39253 ) ) ( not ( = ?auto_39252 ?auto_39254 ) ) ( not ( = ?auto_39253 ?auto_39254 ) ) ( ON-TABLE ?auto_39254 ) ( ON ?auto_39253 ?auto_39254 ) ( ON ?auto_39249 ?auto_39255 ) ( not ( = ?auto_39249 ?auto_39255 ) ) ( not ( = ?auto_39250 ?auto_39255 ) ) ( not ( = ?auto_39251 ?auto_39255 ) ) ( not ( = ?auto_39252 ?auto_39255 ) ) ( not ( = ?auto_39253 ?auto_39255 ) ) ( not ( = ?auto_39254 ?auto_39255 ) ) ( ON ?auto_39250 ?auto_39249 ) ( ON-TABLE ?auto_39255 ) ( ON ?auto_39251 ?auto_39250 ) ( CLEAR ?auto_39251 ) ( HOLDING ?auto_39252 ) ( CLEAR ?auto_39253 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39254 ?auto_39253 ?auto_39252 )
      ( MAKE-6PILE ?auto_39249 ?auto_39250 ?auto_39251 ?auto_39252 ?auto_39253 ?auto_39254 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39256 - BLOCK
      ?auto_39257 - BLOCK
      ?auto_39258 - BLOCK
      ?auto_39259 - BLOCK
      ?auto_39260 - BLOCK
      ?auto_39261 - BLOCK
    )
    :vars
    (
      ?auto_39262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39256 ?auto_39257 ) ) ( not ( = ?auto_39256 ?auto_39258 ) ) ( not ( = ?auto_39256 ?auto_39259 ) ) ( not ( = ?auto_39256 ?auto_39260 ) ) ( not ( = ?auto_39256 ?auto_39261 ) ) ( not ( = ?auto_39257 ?auto_39258 ) ) ( not ( = ?auto_39257 ?auto_39259 ) ) ( not ( = ?auto_39257 ?auto_39260 ) ) ( not ( = ?auto_39257 ?auto_39261 ) ) ( not ( = ?auto_39258 ?auto_39259 ) ) ( not ( = ?auto_39258 ?auto_39260 ) ) ( not ( = ?auto_39258 ?auto_39261 ) ) ( not ( = ?auto_39259 ?auto_39260 ) ) ( not ( = ?auto_39259 ?auto_39261 ) ) ( not ( = ?auto_39260 ?auto_39261 ) ) ( ON-TABLE ?auto_39261 ) ( ON ?auto_39260 ?auto_39261 ) ( ON ?auto_39256 ?auto_39262 ) ( not ( = ?auto_39256 ?auto_39262 ) ) ( not ( = ?auto_39257 ?auto_39262 ) ) ( not ( = ?auto_39258 ?auto_39262 ) ) ( not ( = ?auto_39259 ?auto_39262 ) ) ( not ( = ?auto_39260 ?auto_39262 ) ) ( not ( = ?auto_39261 ?auto_39262 ) ) ( ON ?auto_39257 ?auto_39256 ) ( ON-TABLE ?auto_39262 ) ( ON ?auto_39258 ?auto_39257 ) ( CLEAR ?auto_39260 ) ( ON ?auto_39259 ?auto_39258 ) ( CLEAR ?auto_39259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39262 ?auto_39256 ?auto_39257 ?auto_39258 )
      ( MAKE-6PILE ?auto_39256 ?auto_39257 ?auto_39258 ?auto_39259 ?auto_39260 ?auto_39261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39263 - BLOCK
      ?auto_39264 - BLOCK
      ?auto_39265 - BLOCK
      ?auto_39266 - BLOCK
      ?auto_39267 - BLOCK
      ?auto_39268 - BLOCK
    )
    :vars
    (
      ?auto_39269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39263 ?auto_39264 ) ) ( not ( = ?auto_39263 ?auto_39265 ) ) ( not ( = ?auto_39263 ?auto_39266 ) ) ( not ( = ?auto_39263 ?auto_39267 ) ) ( not ( = ?auto_39263 ?auto_39268 ) ) ( not ( = ?auto_39264 ?auto_39265 ) ) ( not ( = ?auto_39264 ?auto_39266 ) ) ( not ( = ?auto_39264 ?auto_39267 ) ) ( not ( = ?auto_39264 ?auto_39268 ) ) ( not ( = ?auto_39265 ?auto_39266 ) ) ( not ( = ?auto_39265 ?auto_39267 ) ) ( not ( = ?auto_39265 ?auto_39268 ) ) ( not ( = ?auto_39266 ?auto_39267 ) ) ( not ( = ?auto_39266 ?auto_39268 ) ) ( not ( = ?auto_39267 ?auto_39268 ) ) ( ON-TABLE ?auto_39268 ) ( ON ?auto_39263 ?auto_39269 ) ( not ( = ?auto_39263 ?auto_39269 ) ) ( not ( = ?auto_39264 ?auto_39269 ) ) ( not ( = ?auto_39265 ?auto_39269 ) ) ( not ( = ?auto_39266 ?auto_39269 ) ) ( not ( = ?auto_39267 ?auto_39269 ) ) ( not ( = ?auto_39268 ?auto_39269 ) ) ( ON ?auto_39264 ?auto_39263 ) ( ON-TABLE ?auto_39269 ) ( ON ?auto_39265 ?auto_39264 ) ( ON ?auto_39266 ?auto_39265 ) ( CLEAR ?auto_39266 ) ( HOLDING ?auto_39267 ) ( CLEAR ?auto_39268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39268 ?auto_39267 )
      ( MAKE-6PILE ?auto_39263 ?auto_39264 ?auto_39265 ?auto_39266 ?auto_39267 ?auto_39268 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39270 - BLOCK
      ?auto_39271 - BLOCK
      ?auto_39272 - BLOCK
      ?auto_39273 - BLOCK
      ?auto_39274 - BLOCK
      ?auto_39275 - BLOCK
    )
    :vars
    (
      ?auto_39276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39270 ?auto_39271 ) ) ( not ( = ?auto_39270 ?auto_39272 ) ) ( not ( = ?auto_39270 ?auto_39273 ) ) ( not ( = ?auto_39270 ?auto_39274 ) ) ( not ( = ?auto_39270 ?auto_39275 ) ) ( not ( = ?auto_39271 ?auto_39272 ) ) ( not ( = ?auto_39271 ?auto_39273 ) ) ( not ( = ?auto_39271 ?auto_39274 ) ) ( not ( = ?auto_39271 ?auto_39275 ) ) ( not ( = ?auto_39272 ?auto_39273 ) ) ( not ( = ?auto_39272 ?auto_39274 ) ) ( not ( = ?auto_39272 ?auto_39275 ) ) ( not ( = ?auto_39273 ?auto_39274 ) ) ( not ( = ?auto_39273 ?auto_39275 ) ) ( not ( = ?auto_39274 ?auto_39275 ) ) ( ON-TABLE ?auto_39275 ) ( ON ?auto_39270 ?auto_39276 ) ( not ( = ?auto_39270 ?auto_39276 ) ) ( not ( = ?auto_39271 ?auto_39276 ) ) ( not ( = ?auto_39272 ?auto_39276 ) ) ( not ( = ?auto_39273 ?auto_39276 ) ) ( not ( = ?auto_39274 ?auto_39276 ) ) ( not ( = ?auto_39275 ?auto_39276 ) ) ( ON ?auto_39271 ?auto_39270 ) ( ON-TABLE ?auto_39276 ) ( ON ?auto_39272 ?auto_39271 ) ( ON ?auto_39273 ?auto_39272 ) ( CLEAR ?auto_39275 ) ( ON ?auto_39274 ?auto_39273 ) ( CLEAR ?auto_39274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39276 ?auto_39270 ?auto_39271 ?auto_39272 ?auto_39273 )
      ( MAKE-6PILE ?auto_39270 ?auto_39271 ?auto_39272 ?auto_39273 ?auto_39274 ?auto_39275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39277 - BLOCK
      ?auto_39278 - BLOCK
      ?auto_39279 - BLOCK
      ?auto_39280 - BLOCK
      ?auto_39281 - BLOCK
      ?auto_39282 - BLOCK
    )
    :vars
    (
      ?auto_39283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39277 ?auto_39278 ) ) ( not ( = ?auto_39277 ?auto_39279 ) ) ( not ( = ?auto_39277 ?auto_39280 ) ) ( not ( = ?auto_39277 ?auto_39281 ) ) ( not ( = ?auto_39277 ?auto_39282 ) ) ( not ( = ?auto_39278 ?auto_39279 ) ) ( not ( = ?auto_39278 ?auto_39280 ) ) ( not ( = ?auto_39278 ?auto_39281 ) ) ( not ( = ?auto_39278 ?auto_39282 ) ) ( not ( = ?auto_39279 ?auto_39280 ) ) ( not ( = ?auto_39279 ?auto_39281 ) ) ( not ( = ?auto_39279 ?auto_39282 ) ) ( not ( = ?auto_39280 ?auto_39281 ) ) ( not ( = ?auto_39280 ?auto_39282 ) ) ( not ( = ?auto_39281 ?auto_39282 ) ) ( ON ?auto_39277 ?auto_39283 ) ( not ( = ?auto_39277 ?auto_39283 ) ) ( not ( = ?auto_39278 ?auto_39283 ) ) ( not ( = ?auto_39279 ?auto_39283 ) ) ( not ( = ?auto_39280 ?auto_39283 ) ) ( not ( = ?auto_39281 ?auto_39283 ) ) ( not ( = ?auto_39282 ?auto_39283 ) ) ( ON ?auto_39278 ?auto_39277 ) ( ON-TABLE ?auto_39283 ) ( ON ?auto_39279 ?auto_39278 ) ( ON ?auto_39280 ?auto_39279 ) ( ON ?auto_39281 ?auto_39280 ) ( CLEAR ?auto_39281 ) ( HOLDING ?auto_39282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39282 )
      ( MAKE-6PILE ?auto_39277 ?auto_39278 ?auto_39279 ?auto_39280 ?auto_39281 ?auto_39282 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39284 - BLOCK
      ?auto_39285 - BLOCK
      ?auto_39286 - BLOCK
      ?auto_39287 - BLOCK
      ?auto_39288 - BLOCK
      ?auto_39289 - BLOCK
    )
    :vars
    (
      ?auto_39290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39284 ?auto_39285 ) ) ( not ( = ?auto_39284 ?auto_39286 ) ) ( not ( = ?auto_39284 ?auto_39287 ) ) ( not ( = ?auto_39284 ?auto_39288 ) ) ( not ( = ?auto_39284 ?auto_39289 ) ) ( not ( = ?auto_39285 ?auto_39286 ) ) ( not ( = ?auto_39285 ?auto_39287 ) ) ( not ( = ?auto_39285 ?auto_39288 ) ) ( not ( = ?auto_39285 ?auto_39289 ) ) ( not ( = ?auto_39286 ?auto_39287 ) ) ( not ( = ?auto_39286 ?auto_39288 ) ) ( not ( = ?auto_39286 ?auto_39289 ) ) ( not ( = ?auto_39287 ?auto_39288 ) ) ( not ( = ?auto_39287 ?auto_39289 ) ) ( not ( = ?auto_39288 ?auto_39289 ) ) ( ON ?auto_39284 ?auto_39290 ) ( not ( = ?auto_39284 ?auto_39290 ) ) ( not ( = ?auto_39285 ?auto_39290 ) ) ( not ( = ?auto_39286 ?auto_39290 ) ) ( not ( = ?auto_39287 ?auto_39290 ) ) ( not ( = ?auto_39288 ?auto_39290 ) ) ( not ( = ?auto_39289 ?auto_39290 ) ) ( ON ?auto_39285 ?auto_39284 ) ( ON-TABLE ?auto_39290 ) ( ON ?auto_39286 ?auto_39285 ) ( ON ?auto_39287 ?auto_39286 ) ( ON ?auto_39288 ?auto_39287 ) ( ON ?auto_39289 ?auto_39288 ) ( CLEAR ?auto_39289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39290 ?auto_39284 ?auto_39285 ?auto_39286 ?auto_39287 ?auto_39288 )
      ( MAKE-6PILE ?auto_39284 ?auto_39285 ?auto_39286 ?auto_39287 ?auto_39288 ?auto_39289 ) )
  )

)

