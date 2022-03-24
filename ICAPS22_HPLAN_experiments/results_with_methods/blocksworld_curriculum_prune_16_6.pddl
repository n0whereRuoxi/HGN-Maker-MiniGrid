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
      ?auto_502579 - BLOCK
    )
    :vars
    (
      ?auto_502580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502579 ?auto_502580 ) ( CLEAR ?auto_502579 ) ( HAND-EMPTY ) ( not ( = ?auto_502579 ?auto_502580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502579 ?auto_502580 )
      ( !PUTDOWN ?auto_502579 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_502586 - BLOCK
      ?auto_502587 - BLOCK
    )
    :vars
    (
      ?auto_502588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_502586 ) ( ON ?auto_502587 ?auto_502588 ) ( CLEAR ?auto_502587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_502586 ) ( not ( = ?auto_502586 ?auto_502587 ) ) ( not ( = ?auto_502586 ?auto_502588 ) ) ( not ( = ?auto_502587 ?auto_502588 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502587 ?auto_502588 )
      ( !STACK ?auto_502587 ?auto_502586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_502596 - BLOCK
      ?auto_502597 - BLOCK
    )
    :vars
    (
      ?auto_502598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502597 ?auto_502598 ) ( not ( = ?auto_502596 ?auto_502597 ) ) ( not ( = ?auto_502596 ?auto_502598 ) ) ( not ( = ?auto_502597 ?auto_502598 ) ) ( ON ?auto_502596 ?auto_502597 ) ( CLEAR ?auto_502596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_502596 )
      ( MAKE-2PILE ?auto_502596 ?auto_502597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_502607 - BLOCK
      ?auto_502608 - BLOCK
      ?auto_502609 - BLOCK
    )
    :vars
    (
      ?auto_502610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_502608 ) ( ON ?auto_502609 ?auto_502610 ) ( CLEAR ?auto_502609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_502607 ) ( ON ?auto_502608 ?auto_502607 ) ( not ( = ?auto_502607 ?auto_502608 ) ) ( not ( = ?auto_502607 ?auto_502609 ) ) ( not ( = ?auto_502607 ?auto_502610 ) ) ( not ( = ?auto_502608 ?auto_502609 ) ) ( not ( = ?auto_502608 ?auto_502610 ) ) ( not ( = ?auto_502609 ?auto_502610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502609 ?auto_502610 )
      ( !STACK ?auto_502609 ?auto_502608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_502621 - BLOCK
      ?auto_502622 - BLOCK
      ?auto_502623 - BLOCK
    )
    :vars
    (
      ?auto_502624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502623 ?auto_502624 ) ( ON-TABLE ?auto_502621 ) ( not ( = ?auto_502621 ?auto_502622 ) ) ( not ( = ?auto_502621 ?auto_502623 ) ) ( not ( = ?auto_502621 ?auto_502624 ) ) ( not ( = ?auto_502622 ?auto_502623 ) ) ( not ( = ?auto_502622 ?auto_502624 ) ) ( not ( = ?auto_502623 ?auto_502624 ) ) ( CLEAR ?auto_502621 ) ( ON ?auto_502622 ?auto_502623 ) ( CLEAR ?auto_502622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_502621 ?auto_502622 )
      ( MAKE-3PILE ?auto_502621 ?auto_502622 ?auto_502623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_502635 - BLOCK
      ?auto_502636 - BLOCK
      ?auto_502637 - BLOCK
    )
    :vars
    (
      ?auto_502638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502637 ?auto_502638 ) ( not ( = ?auto_502635 ?auto_502636 ) ) ( not ( = ?auto_502635 ?auto_502637 ) ) ( not ( = ?auto_502635 ?auto_502638 ) ) ( not ( = ?auto_502636 ?auto_502637 ) ) ( not ( = ?auto_502636 ?auto_502638 ) ) ( not ( = ?auto_502637 ?auto_502638 ) ) ( ON ?auto_502636 ?auto_502637 ) ( ON ?auto_502635 ?auto_502636 ) ( CLEAR ?auto_502635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_502635 )
      ( MAKE-3PILE ?auto_502635 ?auto_502636 ?auto_502637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_502650 - BLOCK
      ?auto_502651 - BLOCK
      ?auto_502652 - BLOCK
      ?auto_502653 - BLOCK
    )
    :vars
    (
      ?auto_502654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_502652 ) ( ON ?auto_502653 ?auto_502654 ) ( CLEAR ?auto_502653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_502650 ) ( ON ?auto_502651 ?auto_502650 ) ( ON ?auto_502652 ?auto_502651 ) ( not ( = ?auto_502650 ?auto_502651 ) ) ( not ( = ?auto_502650 ?auto_502652 ) ) ( not ( = ?auto_502650 ?auto_502653 ) ) ( not ( = ?auto_502650 ?auto_502654 ) ) ( not ( = ?auto_502651 ?auto_502652 ) ) ( not ( = ?auto_502651 ?auto_502653 ) ) ( not ( = ?auto_502651 ?auto_502654 ) ) ( not ( = ?auto_502652 ?auto_502653 ) ) ( not ( = ?auto_502652 ?auto_502654 ) ) ( not ( = ?auto_502653 ?auto_502654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502653 ?auto_502654 )
      ( !STACK ?auto_502653 ?auto_502652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_502668 - BLOCK
      ?auto_502669 - BLOCK
      ?auto_502670 - BLOCK
      ?auto_502671 - BLOCK
    )
    :vars
    (
      ?auto_502672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502671 ?auto_502672 ) ( ON-TABLE ?auto_502668 ) ( ON ?auto_502669 ?auto_502668 ) ( not ( = ?auto_502668 ?auto_502669 ) ) ( not ( = ?auto_502668 ?auto_502670 ) ) ( not ( = ?auto_502668 ?auto_502671 ) ) ( not ( = ?auto_502668 ?auto_502672 ) ) ( not ( = ?auto_502669 ?auto_502670 ) ) ( not ( = ?auto_502669 ?auto_502671 ) ) ( not ( = ?auto_502669 ?auto_502672 ) ) ( not ( = ?auto_502670 ?auto_502671 ) ) ( not ( = ?auto_502670 ?auto_502672 ) ) ( not ( = ?auto_502671 ?auto_502672 ) ) ( CLEAR ?auto_502669 ) ( ON ?auto_502670 ?auto_502671 ) ( CLEAR ?auto_502670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_502668 ?auto_502669 ?auto_502670 )
      ( MAKE-4PILE ?auto_502668 ?auto_502669 ?auto_502670 ?auto_502671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_502686 - BLOCK
      ?auto_502687 - BLOCK
      ?auto_502688 - BLOCK
      ?auto_502689 - BLOCK
    )
    :vars
    (
      ?auto_502690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502689 ?auto_502690 ) ( ON-TABLE ?auto_502686 ) ( not ( = ?auto_502686 ?auto_502687 ) ) ( not ( = ?auto_502686 ?auto_502688 ) ) ( not ( = ?auto_502686 ?auto_502689 ) ) ( not ( = ?auto_502686 ?auto_502690 ) ) ( not ( = ?auto_502687 ?auto_502688 ) ) ( not ( = ?auto_502687 ?auto_502689 ) ) ( not ( = ?auto_502687 ?auto_502690 ) ) ( not ( = ?auto_502688 ?auto_502689 ) ) ( not ( = ?auto_502688 ?auto_502690 ) ) ( not ( = ?auto_502689 ?auto_502690 ) ) ( ON ?auto_502688 ?auto_502689 ) ( CLEAR ?auto_502686 ) ( ON ?auto_502687 ?auto_502688 ) ( CLEAR ?auto_502687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_502686 ?auto_502687 )
      ( MAKE-4PILE ?auto_502686 ?auto_502687 ?auto_502688 ?auto_502689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_502704 - BLOCK
      ?auto_502705 - BLOCK
      ?auto_502706 - BLOCK
      ?auto_502707 - BLOCK
    )
    :vars
    (
      ?auto_502708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502707 ?auto_502708 ) ( not ( = ?auto_502704 ?auto_502705 ) ) ( not ( = ?auto_502704 ?auto_502706 ) ) ( not ( = ?auto_502704 ?auto_502707 ) ) ( not ( = ?auto_502704 ?auto_502708 ) ) ( not ( = ?auto_502705 ?auto_502706 ) ) ( not ( = ?auto_502705 ?auto_502707 ) ) ( not ( = ?auto_502705 ?auto_502708 ) ) ( not ( = ?auto_502706 ?auto_502707 ) ) ( not ( = ?auto_502706 ?auto_502708 ) ) ( not ( = ?auto_502707 ?auto_502708 ) ) ( ON ?auto_502706 ?auto_502707 ) ( ON ?auto_502705 ?auto_502706 ) ( ON ?auto_502704 ?auto_502705 ) ( CLEAR ?auto_502704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_502704 )
      ( MAKE-4PILE ?auto_502704 ?auto_502705 ?auto_502706 ?auto_502707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_502723 - BLOCK
      ?auto_502724 - BLOCK
      ?auto_502725 - BLOCK
      ?auto_502726 - BLOCK
      ?auto_502727 - BLOCK
    )
    :vars
    (
      ?auto_502728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_502726 ) ( ON ?auto_502727 ?auto_502728 ) ( CLEAR ?auto_502727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_502723 ) ( ON ?auto_502724 ?auto_502723 ) ( ON ?auto_502725 ?auto_502724 ) ( ON ?auto_502726 ?auto_502725 ) ( not ( = ?auto_502723 ?auto_502724 ) ) ( not ( = ?auto_502723 ?auto_502725 ) ) ( not ( = ?auto_502723 ?auto_502726 ) ) ( not ( = ?auto_502723 ?auto_502727 ) ) ( not ( = ?auto_502723 ?auto_502728 ) ) ( not ( = ?auto_502724 ?auto_502725 ) ) ( not ( = ?auto_502724 ?auto_502726 ) ) ( not ( = ?auto_502724 ?auto_502727 ) ) ( not ( = ?auto_502724 ?auto_502728 ) ) ( not ( = ?auto_502725 ?auto_502726 ) ) ( not ( = ?auto_502725 ?auto_502727 ) ) ( not ( = ?auto_502725 ?auto_502728 ) ) ( not ( = ?auto_502726 ?auto_502727 ) ) ( not ( = ?auto_502726 ?auto_502728 ) ) ( not ( = ?auto_502727 ?auto_502728 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502727 ?auto_502728 )
      ( !STACK ?auto_502727 ?auto_502726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_502745 - BLOCK
      ?auto_502746 - BLOCK
      ?auto_502747 - BLOCK
      ?auto_502748 - BLOCK
      ?auto_502749 - BLOCK
    )
    :vars
    (
      ?auto_502750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502749 ?auto_502750 ) ( ON-TABLE ?auto_502745 ) ( ON ?auto_502746 ?auto_502745 ) ( ON ?auto_502747 ?auto_502746 ) ( not ( = ?auto_502745 ?auto_502746 ) ) ( not ( = ?auto_502745 ?auto_502747 ) ) ( not ( = ?auto_502745 ?auto_502748 ) ) ( not ( = ?auto_502745 ?auto_502749 ) ) ( not ( = ?auto_502745 ?auto_502750 ) ) ( not ( = ?auto_502746 ?auto_502747 ) ) ( not ( = ?auto_502746 ?auto_502748 ) ) ( not ( = ?auto_502746 ?auto_502749 ) ) ( not ( = ?auto_502746 ?auto_502750 ) ) ( not ( = ?auto_502747 ?auto_502748 ) ) ( not ( = ?auto_502747 ?auto_502749 ) ) ( not ( = ?auto_502747 ?auto_502750 ) ) ( not ( = ?auto_502748 ?auto_502749 ) ) ( not ( = ?auto_502748 ?auto_502750 ) ) ( not ( = ?auto_502749 ?auto_502750 ) ) ( CLEAR ?auto_502747 ) ( ON ?auto_502748 ?auto_502749 ) ( CLEAR ?auto_502748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_502745 ?auto_502746 ?auto_502747 ?auto_502748 )
      ( MAKE-5PILE ?auto_502745 ?auto_502746 ?auto_502747 ?auto_502748 ?auto_502749 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_502767 - BLOCK
      ?auto_502768 - BLOCK
      ?auto_502769 - BLOCK
      ?auto_502770 - BLOCK
      ?auto_502771 - BLOCK
    )
    :vars
    (
      ?auto_502772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502771 ?auto_502772 ) ( ON-TABLE ?auto_502767 ) ( ON ?auto_502768 ?auto_502767 ) ( not ( = ?auto_502767 ?auto_502768 ) ) ( not ( = ?auto_502767 ?auto_502769 ) ) ( not ( = ?auto_502767 ?auto_502770 ) ) ( not ( = ?auto_502767 ?auto_502771 ) ) ( not ( = ?auto_502767 ?auto_502772 ) ) ( not ( = ?auto_502768 ?auto_502769 ) ) ( not ( = ?auto_502768 ?auto_502770 ) ) ( not ( = ?auto_502768 ?auto_502771 ) ) ( not ( = ?auto_502768 ?auto_502772 ) ) ( not ( = ?auto_502769 ?auto_502770 ) ) ( not ( = ?auto_502769 ?auto_502771 ) ) ( not ( = ?auto_502769 ?auto_502772 ) ) ( not ( = ?auto_502770 ?auto_502771 ) ) ( not ( = ?auto_502770 ?auto_502772 ) ) ( not ( = ?auto_502771 ?auto_502772 ) ) ( ON ?auto_502770 ?auto_502771 ) ( CLEAR ?auto_502768 ) ( ON ?auto_502769 ?auto_502770 ) ( CLEAR ?auto_502769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_502767 ?auto_502768 ?auto_502769 )
      ( MAKE-5PILE ?auto_502767 ?auto_502768 ?auto_502769 ?auto_502770 ?auto_502771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_502789 - BLOCK
      ?auto_502790 - BLOCK
      ?auto_502791 - BLOCK
      ?auto_502792 - BLOCK
      ?auto_502793 - BLOCK
    )
    :vars
    (
      ?auto_502794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502793 ?auto_502794 ) ( ON-TABLE ?auto_502789 ) ( not ( = ?auto_502789 ?auto_502790 ) ) ( not ( = ?auto_502789 ?auto_502791 ) ) ( not ( = ?auto_502789 ?auto_502792 ) ) ( not ( = ?auto_502789 ?auto_502793 ) ) ( not ( = ?auto_502789 ?auto_502794 ) ) ( not ( = ?auto_502790 ?auto_502791 ) ) ( not ( = ?auto_502790 ?auto_502792 ) ) ( not ( = ?auto_502790 ?auto_502793 ) ) ( not ( = ?auto_502790 ?auto_502794 ) ) ( not ( = ?auto_502791 ?auto_502792 ) ) ( not ( = ?auto_502791 ?auto_502793 ) ) ( not ( = ?auto_502791 ?auto_502794 ) ) ( not ( = ?auto_502792 ?auto_502793 ) ) ( not ( = ?auto_502792 ?auto_502794 ) ) ( not ( = ?auto_502793 ?auto_502794 ) ) ( ON ?auto_502792 ?auto_502793 ) ( ON ?auto_502791 ?auto_502792 ) ( CLEAR ?auto_502789 ) ( ON ?auto_502790 ?auto_502791 ) ( CLEAR ?auto_502790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_502789 ?auto_502790 )
      ( MAKE-5PILE ?auto_502789 ?auto_502790 ?auto_502791 ?auto_502792 ?auto_502793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_502811 - BLOCK
      ?auto_502812 - BLOCK
      ?auto_502813 - BLOCK
      ?auto_502814 - BLOCK
      ?auto_502815 - BLOCK
    )
    :vars
    (
      ?auto_502816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502815 ?auto_502816 ) ( not ( = ?auto_502811 ?auto_502812 ) ) ( not ( = ?auto_502811 ?auto_502813 ) ) ( not ( = ?auto_502811 ?auto_502814 ) ) ( not ( = ?auto_502811 ?auto_502815 ) ) ( not ( = ?auto_502811 ?auto_502816 ) ) ( not ( = ?auto_502812 ?auto_502813 ) ) ( not ( = ?auto_502812 ?auto_502814 ) ) ( not ( = ?auto_502812 ?auto_502815 ) ) ( not ( = ?auto_502812 ?auto_502816 ) ) ( not ( = ?auto_502813 ?auto_502814 ) ) ( not ( = ?auto_502813 ?auto_502815 ) ) ( not ( = ?auto_502813 ?auto_502816 ) ) ( not ( = ?auto_502814 ?auto_502815 ) ) ( not ( = ?auto_502814 ?auto_502816 ) ) ( not ( = ?auto_502815 ?auto_502816 ) ) ( ON ?auto_502814 ?auto_502815 ) ( ON ?auto_502813 ?auto_502814 ) ( ON ?auto_502812 ?auto_502813 ) ( ON ?auto_502811 ?auto_502812 ) ( CLEAR ?auto_502811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_502811 )
      ( MAKE-5PILE ?auto_502811 ?auto_502812 ?auto_502813 ?auto_502814 ?auto_502815 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_502834 - BLOCK
      ?auto_502835 - BLOCK
      ?auto_502836 - BLOCK
      ?auto_502837 - BLOCK
      ?auto_502838 - BLOCK
      ?auto_502839 - BLOCK
    )
    :vars
    (
      ?auto_502840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_502838 ) ( ON ?auto_502839 ?auto_502840 ) ( CLEAR ?auto_502839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_502834 ) ( ON ?auto_502835 ?auto_502834 ) ( ON ?auto_502836 ?auto_502835 ) ( ON ?auto_502837 ?auto_502836 ) ( ON ?auto_502838 ?auto_502837 ) ( not ( = ?auto_502834 ?auto_502835 ) ) ( not ( = ?auto_502834 ?auto_502836 ) ) ( not ( = ?auto_502834 ?auto_502837 ) ) ( not ( = ?auto_502834 ?auto_502838 ) ) ( not ( = ?auto_502834 ?auto_502839 ) ) ( not ( = ?auto_502834 ?auto_502840 ) ) ( not ( = ?auto_502835 ?auto_502836 ) ) ( not ( = ?auto_502835 ?auto_502837 ) ) ( not ( = ?auto_502835 ?auto_502838 ) ) ( not ( = ?auto_502835 ?auto_502839 ) ) ( not ( = ?auto_502835 ?auto_502840 ) ) ( not ( = ?auto_502836 ?auto_502837 ) ) ( not ( = ?auto_502836 ?auto_502838 ) ) ( not ( = ?auto_502836 ?auto_502839 ) ) ( not ( = ?auto_502836 ?auto_502840 ) ) ( not ( = ?auto_502837 ?auto_502838 ) ) ( not ( = ?auto_502837 ?auto_502839 ) ) ( not ( = ?auto_502837 ?auto_502840 ) ) ( not ( = ?auto_502838 ?auto_502839 ) ) ( not ( = ?auto_502838 ?auto_502840 ) ) ( not ( = ?auto_502839 ?auto_502840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502839 ?auto_502840 )
      ( !STACK ?auto_502839 ?auto_502838 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_502860 - BLOCK
      ?auto_502861 - BLOCK
      ?auto_502862 - BLOCK
      ?auto_502863 - BLOCK
      ?auto_502864 - BLOCK
      ?auto_502865 - BLOCK
    )
    :vars
    (
      ?auto_502866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502865 ?auto_502866 ) ( ON-TABLE ?auto_502860 ) ( ON ?auto_502861 ?auto_502860 ) ( ON ?auto_502862 ?auto_502861 ) ( ON ?auto_502863 ?auto_502862 ) ( not ( = ?auto_502860 ?auto_502861 ) ) ( not ( = ?auto_502860 ?auto_502862 ) ) ( not ( = ?auto_502860 ?auto_502863 ) ) ( not ( = ?auto_502860 ?auto_502864 ) ) ( not ( = ?auto_502860 ?auto_502865 ) ) ( not ( = ?auto_502860 ?auto_502866 ) ) ( not ( = ?auto_502861 ?auto_502862 ) ) ( not ( = ?auto_502861 ?auto_502863 ) ) ( not ( = ?auto_502861 ?auto_502864 ) ) ( not ( = ?auto_502861 ?auto_502865 ) ) ( not ( = ?auto_502861 ?auto_502866 ) ) ( not ( = ?auto_502862 ?auto_502863 ) ) ( not ( = ?auto_502862 ?auto_502864 ) ) ( not ( = ?auto_502862 ?auto_502865 ) ) ( not ( = ?auto_502862 ?auto_502866 ) ) ( not ( = ?auto_502863 ?auto_502864 ) ) ( not ( = ?auto_502863 ?auto_502865 ) ) ( not ( = ?auto_502863 ?auto_502866 ) ) ( not ( = ?auto_502864 ?auto_502865 ) ) ( not ( = ?auto_502864 ?auto_502866 ) ) ( not ( = ?auto_502865 ?auto_502866 ) ) ( CLEAR ?auto_502863 ) ( ON ?auto_502864 ?auto_502865 ) ( CLEAR ?auto_502864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_502860 ?auto_502861 ?auto_502862 ?auto_502863 ?auto_502864 )
      ( MAKE-6PILE ?auto_502860 ?auto_502861 ?auto_502862 ?auto_502863 ?auto_502864 ?auto_502865 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_502886 - BLOCK
      ?auto_502887 - BLOCK
      ?auto_502888 - BLOCK
      ?auto_502889 - BLOCK
      ?auto_502890 - BLOCK
      ?auto_502891 - BLOCK
    )
    :vars
    (
      ?auto_502892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502891 ?auto_502892 ) ( ON-TABLE ?auto_502886 ) ( ON ?auto_502887 ?auto_502886 ) ( ON ?auto_502888 ?auto_502887 ) ( not ( = ?auto_502886 ?auto_502887 ) ) ( not ( = ?auto_502886 ?auto_502888 ) ) ( not ( = ?auto_502886 ?auto_502889 ) ) ( not ( = ?auto_502886 ?auto_502890 ) ) ( not ( = ?auto_502886 ?auto_502891 ) ) ( not ( = ?auto_502886 ?auto_502892 ) ) ( not ( = ?auto_502887 ?auto_502888 ) ) ( not ( = ?auto_502887 ?auto_502889 ) ) ( not ( = ?auto_502887 ?auto_502890 ) ) ( not ( = ?auto_502887 ?auto_502891 ) ) ( not ( = ?auto_502887 ?auto_502892 ) ) ( not ( = ?auto_502888 ?auto_502889 ) ) ( not ( = ?auto_502888 ?auto_502890 ) ) ( not ( = ?auto_502888 ?auto_502891 ) ) ( not ( = ?auto_502888 ?auto_502892 ) ) ( not ( = ?auto_502889 ?auto_502890 ) ) ( not ( = ?auto_502889 ?auto_502891 ) ) ( not ( = ?auto_502889 ?auto_502892 ) ) ( not ( = ?auto_502890 ?auto_502891 ) ) ( not ( = ?auto_502890 ?auto_502892 ) ) ( not ( = ?auto_502891 ?auto_502892 ) ) ( ON ?auto_502890 ?auto_502891 ) ( CLEAR ?auto_502888 ) ( ON ?auto_502889 ?auto_502890 ) ( CLEAR ?auto_502889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_502886 ?auto_502887 ?auto_502888 ?auto_502889 )
      ( MAKE-6PILE ?auto_502886 ?auto_502887 ?auto_502888 ?auto_502889 ?auto_502890 ?auto_502891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_502912 - BLOCK
      ?auto_502913 - BLOCK
      ?auto_502914 - BLOCK
      ?auto_502915 - BLOCK
      ?auto_502916 - BLOCK
      ?auto_502917 - BLOCK
    )
    :vars
    (
      ?auto_502918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502917 ?auto_502918 ) ( ON-TABLE ?auto_502912 ) ( ON ?auto_502913 ?auto_502912 ) ( not ( = ?auto_502912 ?auto_502913 ) ) ( not ( = ?auto_502912 ?auto_502914 ) ) ( not ( = ?auto_502912 ?auto_502915 ) ) ( not ( = ?auto_502912 ?auto_502916 ) ) ( not ( = ?auto_502912 ?auto_502917 ) ) ( not ( = ?auto_502912 ?auto_502918 ) ) ( not ( = ?auto_502913 ?auto_502914 ) ) ( not ( = ?auto_502913 ?auto_502915 ) ) ( not ( = ?auto_502913 ?auto_502916 ) ) ( not ( = ?auto_502913 ?auto_502917 ) ) ( not ( = ?auto_502913 ?auto_502918 ) ) ( not ( = ?auto_502914 ?auto_502915 ) ) ( not ( = ?auto_502914 ?auto_502916 ) ) ( not ( = ?auto_502914 ?auto_502917 ) ) ( not ( = ?auto_502914 ?auto_502918 ) ) ( not ( = ?auto_502915 ?auto_502916 ) ) ( not ( = ?auto_502915 ?auto_502917 ) ) ( not ( = ?auto_502915 ?auto_502918 ) ) ( not ( = ?auto_502916 ?auto_502917 ) ) ( not ( = ?auto_502916 ?auto_502918 ) ) ( not ( = ?auto_502917 ?auto_502918 ) ) ( ON ?auto_502916 ?auto_502917 ) ( ON ?auto_502915 ?auto_502916 ) ( CLEAR ?auto_502913 ) ( ON ?auto_502914 ?auto_502915 ) ( CLEAR ?auto_502914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_502912 ?auto_502913 ?auto_502914 )
      ( MAKE-6PILE ?auto_502912 ?auto_502913 ?auto_502914 ?auto_502915 ?auto_502916 ?auto_502917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_502938 - BLOCK
      ?auto_502939 - BLOCK
      ?auto_502940 - BLOCK
      ?auto_502941 - BLOCK
      ?auto_502942 - BLOCK
      ?auto_502943 - BLOCK
    )
    :vars
    (
      ?auto_502944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502943 ?auto_502944 ) ( ON-TABLE ?auto_502938 ) ( not ( = ?auto_502938 ?auto_502939 ) ) ( not ( = ?auto_502938 ?auto_502940 ) ) ( not ( = ?auto_502938 ?auto_502941 ) ) ( not ( = ?auto_502938 ?auto_502942 ) ) ( not ( = ?auto_502938 ?auto_502943 ) ) ( not ( = ?auto_502938 ?auto_502944 ) ) ( not ( = ?auto_502939 ?auto_502940 ) ) ( not ( = ?auto_502939 ?auto_502941 ) ) ( not ( = ?auto_502939 ?auto_502942 ) ) ( not ( = ?auto_502939 ?auto_502943 ) ) ( not ( = ?auto_502939 ?auto_502944 ) ) ( not ( = ?auto_502940 ?auto_502941 ) ) ( not ( = ?auto_502940 ?auto_502942 ) ) ( not ( = ?auto_502940 ?auto_502943 ) ) ( not ( = ?auto_502940 ?auto_502944 ) ) ( not ( = ?auto_502941 ?auto_502942 ) ) ( not ( = ?auto_502941 ?auto_502943 ) ) ( not ( = ?auto_502941 ?auto_502944 ) ) ( not ( = ?auto_502942 ?auto_502943 ) ) ( not ( = ?auto_502942 ?auto_502944 ) ) ( not ( = ?auto_502943 ?auto_502944 ) ) ( ON ?auto_502942 ?auto_502943 ) ( ON ?auto_502941 ?auto_502942 ) ( ON ?auto_502940 ?auto_502941 ) ( CLEAR ?auto_502938 ) ( ON ?auto_502939 ?auto_502940 ) ( CLEAR ?auto_502939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_502938 ?auto_502939 )
      ( MAKE-6PILE ?auto_502938 ?auto_502939 ?auto_502940 ?auto_502941 ?auto_502942 ?auto_502943 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_502964 - BLOCK
      ?auto_502965 - BLOCK
      ?auto_502966 - BLOCK
      ?auto_502967 - BLOCK
      ?auto_502968 - BLOCK
      ?auto_502969 - BLOCK
    )
    :vars
    (
      ?auto_502970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_502969 ?auto_502970 ) ( not ( = ?auto_502964 ?auto_502965 ) ) ( not ( = ?auto_502964 ?auto_502966 ) ) ( not ( = ?auto_502964 ?auto_502967 ) ) ( not ( = ?auto_502964 ?auto_502968 ) ) ( not ( = ?auto_502964 ?auto_502969 ) ) ( not ( = ?auto_502964 ?auto_502970 ) ) ( not ( = ?auto_502965 ?auto_502966 ) ) ( not ( = ?auto_502965 ?auto_502967 ) ) ( not ( = ?auto_502965 ?auto_502968 ) ) ( not ( = ?auto_502965 ?auto_502969 ) ) ( not ( = ?auto_502965 ?auto_502970 ) ) ( not ( = ?auto_502966 ?auto_502967 ) ) ( not ( = ?auto_502966 ?auto_502968 ) ) ( not ( = ?auto_502966 ?auto_502969 ) ) ( not ( = ?auto_502966 ?auto_502970 ) ) ( not ( = ?auto_502967 ?auto_502968 ) ) ( not ( = ?auto_502967 ?auto_502969 ) ) ( not ( = ?auto_502967 ?auto_502970 ) ) ( not ( = ?auto_502968 ?auto_502969 ) ) ( not ( = ?auto_502968 ?auto_502970 ) ) ( not ( = ?auto_502969 ?auto_502970 ) ) ( ON ?auto_502968 ?auto_502969 ) ( ON ?auto_502967 ?auto_502968 ) ( ON ?auto_502966 ?auto_502967 ) ( ON ?auto_502965 ?auto_502966 ) ( ON ?auto_502964 ?auto_502965 ) ( CLEAR ?auto_502964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_502964 )
      ( MAKE-6PILE ?auto_502964 ?auto_502965 ?auto_502966 ?auto_502967 ?auto_502968 ?auto_502969 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_502991 - BLOCK
      ?auto_502992 - BLOCK
      ?auto_502993 - BLOCK
      ?auto_502994 - BLOCK
      ?auto_502995 - BLOCK
      ?auto_502996 - BLOCK
      ?auto_502997 - BLOCK
    )
    :vars
    (
      ?auto_502998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_502996 ) ( ON ?auto_502997 ?auto_502998 ) ( CLEAR ?auto_502997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_502991 ) ( ON ?auto_502992 ?auto_502991 ) ( ON ?auto_502993 ?auto_502992 ) ( ON ?auto_502994 ?auto_502993 ) ( ON ?auto_502995 ?auto_502994 ) ( ON ?auto_502996 ?auto_502995 ) ( not ( = ?auto_502991 ?auto_502992 ) ) ( not ( = ?auto_502991 ?auto_502993 ) ) ( not ( = ?auto_502991 ?auto_502994 ) ) ( not ( = ?auto_502991 ?auto_502995 ) ) ( not ( = ?auto_502991 ?auto_502996 ) ) ( not ( = ?auto_502991 ?auto_502997 ) ) ( not ( = ?auto_502991 ?auto_502998 ) ) ( not ( = ?auto_502992 ?auto_502993 ) ) ( not ( = ?auto_502992 ?auto_502994 ) ) ( not ( = ?auto_502992 ?auto_502995 ) ) ( not ( = ?auto_502992 ?auto_502996 ) ) ( not ( = ?auto_502992 ?auto_502997 ) ) ( not ( = ?auto_502992 ?auto_502998 ) ) ( not ( = ?auto_502993 ?auto_502994 ) ) ( not ( = ?auto_502993 ?auto_502995 ) ) ( not ( = ?auto_502993 ?auto_502996 ) ) ( not ( = ?auto_502993 ?auto_502997 ) ) ( not ( = ?auto_502993 ?auto_502998 ) ) ( not ( = ?auto_502994 ?auto_502995 ) ) ( not ( = ?auto_502994 ?auto_502996 ) ) ( not ( = ?auto_502994 ?auto_502997 ) ) ( not ( = ?auto_502994 ?auto_502998 ) ) ( not ( = ?auto_502995 ?auto_502996 ) ) ( not ( = ?auto_502995 ?auto_502997 ) ) ( not ( = ?auto_502995 ?auto_502998 ) ) ( not ( = ?auto_502996 ?auto_502997 ) ) ( not ( = ?auto_502996 ?auto_502998 ) ) ( not ( = ?auto_502997 ?auto_502998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_502997 ?auto_502998 )
      ( !STACK ?auto_502997 ?auto_502996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_503021 - BLOCK
      ?auto_503022 - BLOCK
      ?auto_503023 - BLOCK
      ?auto_503024 - BLOCK
      ?auto_503025 - BLOCK
      ?auto_503026 - BLOCK
      ?auto_503027 - BLOCK
    )
    :vars
    (
      ?auto_503028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503027 ?auto_503028 ) ( ON-TABLE ?auto_503021 ) ( ON ?auto_503022 ?auto_503021 ) ( ON ?auto_503023 ?auto_503022 ) ( ON ?auto_503024 ?auto_503023 ) ( ON ?auto_503025 ?auto_503024 ) ( not ( = ?auto_503021 ?auto_503022 ) ) ( not ( = ?auto_503021 ?auto_503023 ) ) ( not ( = ?auto_503021 ?auto_503024 ) ) ( not ( = ?auto_503021 ?auto_503025 ) ) ( not ( = ?auto_503021 ?auto_503026 ) ) ( not ( = ?auto_503021 ?auto_503027 ) ) ( not ( = ?auto_503021 ?auto_503028 ) ) ( not ( = ?auto_503022 ?auto_503023 ) ) ( not ( = ?auto_503022 ?auto_503024 ) ) ( not ( = ?auto_503022 ?auto_503025 ) ) ( not ( = ?auto_503022 ?auto_503026 ) ) ( not ( = ?auto_503022 ?auto_503027 ) ) ( not ( = ?auto_503022 ?auto_503028 ) ) ( not ( = ?auto_503023 ?auto_503024 ) ) ( not ( = ?auto_503023 ?auto_503025 ) ) ( not ( = ?auto_503023 ?auto_503026 ) ) ( not ( = ?auto_503023 ?auto_503027 ) ) ( not ( = ?auto_503023 ?auto_503028 ) ) ( not ( = ?auto_503024 ?auto_503025 ) ) ( not ( = ?auto_503024 ?auto_503026 ) ) ( not ( = ?auto_503024 ?auto_503027 ) ) ( not ( = ?auto_503024 ?auto_503028 ) ) ( not ( = ?auto_503025 ?auto_503026 ) ) ( not ( = ?auto_503025 ?auto_503027 ) ) ( not ( = ?auto_503025 ?auto_503028 ) ) ( not ( = ?auto_503026 ?auto_503027 ) ) ( not ( = ?auto_503026 ?auto_503028 ) ) ( not ( = ?auto_503027 ?auto_503028 ) ) ( CLEAR ?auto_503025 ) ( ON ?auto_503026 ?auto_503027 ) ( CLEAR ?auto_503026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_503021 ?auto_503022 ?auto_503023 ?auto_503024 ?auto_503025 ?auto_503026 )
      ( MAKE-7PILE ?auto_503021 ?auto_503022 ?auto_503023 ?auto_503024 ?auto_503025 ?auto_503026 ?auto_503027 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_503051 - BLOCK
      ?auto_503052 - BLOCK
      ?auto_503053 - BLOCK
      ?auto_503054 - BLOCK
      ?auto_503055 - BLOCK
      ?auto_503056 - BLOCK
      ?auto_503057 - BLOCK
    )
    :vars
    (
      ?auto_503058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503057 ?auto_503058 ) ( ON-TABLE ?auto_503051 ) ( ON ?auto_503052 ?auto_503051 ) ( ON ?auto_503053 ?auto_503052 ) ( ON ?auto_503054 ?auto_503053 ) ( not ( = ?auto_503051 ?auto_503052 ) ) ( not ( = ?auto_503051 ?auto_503053 ) ) ( not ( = ?auto_503051 ?auto_503054 ) ) ( not ( = ?auto_503051 ?auto_503055 ) ) ( not ( = ?auto_503051 ?auto_503056 ) ) ( not ( = ?auto_503051 ?auto_503057 ) ) ( not ( = ?auto_503051 ?auto_503058 ) ) ( not ( = ?auto_503052 ?auto_503053 ) ) ( not ( = ?auto_503052 ?auto_503054 ) ) ( not ( = ?auto_503052 ?auto_503055 ) ) ( not ( = ?auto_503052 ?auto_503056 ) ) ( not ( = ?auto_503052 ?auto_503057 ) ) ( not ( = ?auto_503052 ?auto_503058 ) ) ( not ( = ?auto_503053 ?auto_503054 ) ) ( not ( = ?auto_503053 ?auto_503055 ) ) ( not ( = ?auto_503053 ?auto_503056 ) ) ( not ( = ?auto_503053 ?auto_503057 ) ) ( not ( = ?auto_503053 ?auto_503058 ) ) ( not ( = ?auto_503054 ?auto_503055 ) ) ( not ( = ?auto_503054 ?auto_503056 ) ) ( not ( = ?auto_503054 ?auto_503057 ) ) ( not ( = ?auto_503054 ?auto_503058 ) ) ( not ( = ?auto_503055 ?auto_503056 ) ) ( not ( = ?auto_503055 ?auto_503057 ) ) ( not ( = ?auto_503055 ?auto_503058 ) ) ( not ( = ?auto_503056 ?auto_503057 ) ) ( not ( = ?auto_503056 ?auto_503058 ) ) ( not ( = ?auto_503057 ?auto_503058 ) ) ( ON ?auto_503056 ?auto_503057 ) ( CLEAR ?auto_503054 ) ( ON ?auto_503055 ?auto_503056 ) ( CLEAR ?auto_503055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_503051 ?auto_503052 ?auto_503053 ?auto_503054 ?auto_503055 )
      ( MAKE-7PILE ?auto_503051 ?auto_503052 ?auto_503053 ?auto_503054 ?auto_503055 ?auto_503056 ?auto_503057 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_503081 - BLOCK
      ?auto_503082 - BLOCK
      ?auto_503083 - BLOCK
      ?auto_503084 - BLOCK
      ?auto_503085 - BLOCK
      ?auto_503086 - BLOCK
      ?auto_503087 - BLOCK
    )
    :vars
    (
      ?auto_503088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503087 ?auto_503088 ) ( ON-TABLE ?auto_503081 ) ( ON ?auto_503082 ?auto_503081 ) ( ON ?auto_503083 ?auto_503082 ) ( not ( = ?auto_503081 ?auto_503082 ) ) ( not ( = ?auto_503081 ?auto_503083 ) ) ( not ( = ?auto_503081 ?auto_503084 ) ) ( not ( = ?auto_503081 ?auto_503085 ) ) ( not ( = ?auto_503081 ?auto_503086 ) ) ( not ( = ?auto_503081 ?auto_503087 ) ) ( not ( = ?auto_503081 ?auto_503088 ) ) ( not ( = ?auto_503082 ?auto_503083 ) ) ( not ( = ?auto_503082 ?auto_503084 ) ) ( not ( = ?auto_503082 ?auto_503085 ) ) ( not ( = ?auto_503082 ?auto_503086 ) ) ( not ( = ?auto_503082 ?auto_503087 ) ) ( not ( = ?auto_503082 ?auto_503088 ) ) ( not ( = ?auto_503083 ?auto_503084 ) ) ( not ( = ?auto_503083 ?auto_503085 ) ) ( not ( = ?auto_503083 ?auto_503086 ) ) ( not ( = ?auto_503083 ?auto_503087 ) ) ( not ( = ?auto_503083 ?auto_503088 ) ) ( not ( = ?auto_503084 ?auto_503085 ) ) ( not ( = ?auto_503084 ?auto_503086 ) ) ( not ( = ?auto_503084 ?auto_503087 ) ) ( not ( = ?auto_503084 ?auto_503088 ) ) ( not ( = ?auto_503085 ?auto_503086 ) ) ( not ( = ?auto_503085 ?auto_503087 ) ) ( not ( = ?auto_503085 ?auto_503088 ) ) ( not ( = ?auto_503086 ?auto_503087 ) ) ( not ( = ?auto_503086 ?auto_503088 ) ) ( not ( = ?auto_503087 ?auto_503088 ) ) ( ON ?auto_503086 ?auto_503087 ) ( ON ?auto_503085 ?auto_503086 ) ( CLEAR ?auto_503083 ) ( ON ?auto_503084 ?auto_503085 ) ( CLEAR ?auto_503084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_503081 ?auto_503082 ?auto_503083 ?auto_503084 )
      ( MAKE-7PILE ?auto_503081 ?auto_503082 ?auto_503083 ?auto_503084 ?auto_503085 ?auto_503086 ?auto_503087 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_503111 - BLOCK
      ?auto_503112 - BLOCK
      ?auto_503113 - BLOCK
      ?auto_503114 - BLOCK
      ?auto_503115 - BLOCK
      ?auto_503116 - BLOCK
      ?auto_503117 - BLOCK
    )
    :vars
    (
      ?auto_503118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503117 ?auto_503118 ) ( ON-TABLE ?auto_503111 ) ( ON ?auto_503112 ?auto_503111 ) ( not ( = ?auto_503111 ?auto_503112 ) ) ( not ( = ?auto_503111 ?auto_503113 ) ) ( not ( = ?auto_503111 ?auto_503114 ) ) ( not ( = ?auto_503111 ?auto_503115 ) ) ( not ( = ?auto_503111 ?auto_503116 ) ) ( not ( = ?auto_503111 ?auto_503117 ) ) ( not ( = ?auto_503111 ?auto_503118 ) ) ( not ( = ?auto_503112 ?auto_503113 ) ) ( not ( = ?auto_503112 ?auto_503114 ) ) ( not ( = ?auto_503112 ?auto_503115 ) ) ( not ( = ?auto_503112 ?auto_503116 ) ) ( not ( = ?auto_503112 ?auto_503117 ) ) ( not ( = ?auto_503112 ?auto_503118 ) ) ( not ( = ?auto_503113 ?auto_503114 ) ) ( not ( = ?auto_503113 ?auto_503115 ) ) ( not ( = ?auto_503113 ?auto_503116 ) ) ( not ( = ?auto_503113 ?auto_503117 ) ) ( not ( = ?auto_503113 ?auto_503118 ) ) ( not ( = ?auto_503114 ?auto_503115 ) ) ( not ( = ?auto_503114 ?auto_503116 ) ) ( not ( = ?auto_503114 ?auto_503117 ) ) ( not ( = ?auto_503114 ?auto_503118 ) ) ( not ( = ?auto_503115 ?auto_503116 ) ) ( not ( = ?auto_503115 ?auto_503117 ) ) ( not ( = ?auto_503115 ?auto_503118 ) ) ( not ( = ?auto_503116 ?auto_503117 ) ) ( not ( = ?auto_503116 ?auto_503118 ) ) ( not ( = ?auto_503117 ?auto_503118 ) ) ( ON ?auto_503116 ?auto_503117 ) ( ON ?auto_503115 ?auto_503116 ) ( ON ?auto_503114 ?auto_503115 ) ( CLEAR ?auto_503112 ) ( ON ?auto_503113 ?auto_503114 ) ( CLEAR ?auto_503113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_503111 ?auto_503112 ?auto_503113 )
      ( MAKE-7PILE ?auto_503111 ?auto_503112 ?auto_503113 ?auto_503114 ?auto_503115 ?auto_503116 ?auto_503117 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_503141 - BLOCK
      ?auto_503142 - BLOCK
      ?auto_503143 - BLOCK
      ?auto_503144 - BLOCK
      ?auto_503145 - BLOCK
      ?auto_503146 - BLOCK
      ?auto_503147 - BLOCK
    )
    :vars
    (
      ?auto_503148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503147 ?auto_503148 ) ( ON-TABLE ?auto_503141 ) ( not ( = ?auto_503141 ?auto_503142 ) ) ( not ( = ?auto_503141 ?auto_503143 ) ) ( not ( = ?auto_503141 ?auto_503144 ) ) ( not ( = ?auto_503141 ?auto_503145 ) ) ( not ( = ?auto_503141 ?auto_503146 ) ) ( not ( = ?auto_503141 ?auto_503147 ) ) ( not ( = ?auto_503141 ?auto_503148 ) ) ( not ( = ?auto_503142 ?auto_503143 ) ) ( not ( = ?auto_503142 ?auto_503144 ) ) ( not ( = ?auto_503142 ?auto_503145 ) ) ( not ( = ?auto_503142 ?auto_503146 ) ) ( not ( = ?auto_503142 ?auto_503147 ) ) ( not ( = ?auto_503142 ?auto_503148 ) ) ( not ( = ?auto_503143 ?auto_503144 ) ) ( not ( = ?auto_503143 ?auto_503145 ) ) ( not ( = ?auto_503143 ?auto_503146 ) ) ( not ( = ?auto_503143 ?auto_503147 ) ) ( not ( = ?auto_503143 ?auto_503148 ) ) ( not ( = ?auto_503144 ?auto_503145 ) ) ( not ( = ?auto_503144 ?auto_503146 ) ) ( not ( = ?auto_503144 ?auto_503147 ) ) ( not ( = ?auto_503144 ?auto_503148 ) ) ( not ( = ?auto_503145 ?auto_503146 ) ) ( not ( = ?auto_503145 ?auto_503147 ) ) ( not ( = ?auto_503145 ?auto_503148 ) ) ( not ( = ?auto_503146 ?auto_503147 ) ) ( not ( = ?auto_503146 ?auto_503148 ) ) ( not ( = ?auto_503147 ?auto_503148 ) ) ( ON ?auto_503146 ?auto_503147 ) ( ON ?auto_503145 ?auto_503146 ) ( ON ?auto_503144 ?auto_503145 ) ( ON ?auto_503143 ?auto_503144 ) ( CLEAR ?auto_503141 ) ( ON ?auto_503142 ?auto_503143 ) ( CLEAR ?auto_503142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_503141 ?auto_503142 )
      ( MAKE-7PILE ?auto_503141 ?auto_503142 ?auto_503143 ?auto_503144 ?auto_503145 ?auto_503146 ?auto_503147 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_503171 - BLOCK
      ?auto_503172 - BLOCK
      ?auto_503173 - BLOCK
      ?auto_503174 - BLOCK
      ?auto_503175 - BLOCK
      ?auto_503176 - BLOCK
      ?auto_503177 - BLOCK
    )
    :vars
    (
      ?auto_503178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503177 ?auto_503178 ) ( not ( = ?auto_503171 ?auto_503172 ) ) ( not ( = ?auto_503171 ?auto_503173 ) ) ( not ( = ?auto_503171 ?auto_503174 ) ) ( not ( = ?auto_503171 ?auto_503175 ) ) ( not ( = ?auto_503171 ?auto_503176 ) ) ( not ( = ?auto_503171 ?auto_503177 ) ) ( not ( = ?auto_503171 ?auto_503178 ) ) ( not ( = ?auto_503172 ?auto_503173 ) ) ( not ( = ?auto_503172 ?auto_503174 ) ) ( not ( = ?auto_503172 ?auto_503175 ) ) ( not ( = ?auto_503172 ?auto_503176 ) ) ( not ( = ?auto_503172 ?auto_503177 ) ) ( not ( = ?auto_503172 ?auto_503178 ) ) ( not ( = ?auto_503173 ?auto_503174 ) ) ( not ( = ?auto_503173 ?auto_503175 ) ) ( not ( = ?auto_503173 ?auto_503176 ) ) ( not ( = ?auto_503173 ?auto_503177 ) ) ( not ( = ?auto_503173 ?auto_503178 ) ) ( not ( = ?auto_503174 ?auto_503175 ) ) ( not ( = ?auto_503174 ?auto_503176 ) ) ( not ( = ?auto_503174 ?auto_503177 ) ) ( not ( = ?auto_503174 ?auto_503178 ) ) ( not ( = ?auto_503175 ?auto_503176 ) ) ( not ( = ?auto_503175 ?auto_503177 ) ) ( not ( = ?auto_503175 ?auto_503178 ) ) ( not ( = ?auto_503176 ?auto_503177 ) ) ( not ( = ?auto_503176 ?auto_503178 ) ) ( not ( = ?auto_503177 ?auto_503178 ) ) ( ON ?auto_503176 ?auto_503177 ) ( ON ?auto_503175 ?auto_503176 ) ( ON ?auto_503174 ?auto_503175 ) ( ON ?auto_503173 ?auto_503174 ) ( ON ?auto_503172 ?auto_503173 ) ( ON ?auto_503171 ?auto_503172 ) ( CLEAR ?auto_503171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_503171 )
      ( MAKE-7PILE ?auto_503171 ?auto_503172 ?auto_503173 ?auto_503174 ?auto_503175 ?auto_503176 ?auto_503177 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503202 - BLOCK
      ?auto_503203 - BLOCK
      ?auto_503204 - BLOCK
      ?auto_503205 - BLOCK
      ?auto_503206 - BLOCK
      ?auto_503207 - BLOCK
      ?auto_503208 - BLOCK
      ?auto_503209 - BLOCK
    )
    :vars
    (
      ?auto_503210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_503208 ) ( ON ?auto_503209 ?auto_503210 ) ( CLEAR ?auto_503209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_503202 ) ( ON ?auto_503203 ?auto_503202 ) ( ON ?auto_503204 ?auto_503203 ) ( ON ?auto_503205 ?auto_503204 ) ( ON ?auto_503206 ?auto_503205 ) ( ON ?auto_503207 ?auto_503206 ) ( ON ?auto_503208 ?auto_503207 ) ( not ( = ?auto_503202 ?auto_503203 ) ) ( not ( = ?auto_503202 ?auto_503204 ) ) ( not ( = ?auto_503202 ?auto_503205 ) ) ( not ( = ?auto_503202 ?auto_503206 ) ) ( not ( = ?auto_503202 ?auto_503207 ) ) ( not ( = ?auto_503202 ?auto_503208 ) ) ( not ( = ?auto_503202 ?auto_503209 ) ) ( not ( = ?auto_503202 ?auto_503210 ) ) ( not ( = ?auto_503203 ?auto_503204 ) ) ( not ( = ?auto_503203 ?auto_503205 ) ) ( not ( = ?auto_503203 ?auto_503206 ) ) ( not ( = ?auto_503203 ?auto_503207 ) ) ( not ( = ?auto_503203 ?auto_503208 ) ) ( not ( = ?auto_503203 ?auto_503209 ) ) ( not ( = ?auto_503203 ?auto_503210 ) ) ( not ( = ?auto_503204 ?auto_503205 ) ) ( not ( = ?auto_503204 ?auto_503206 ) ) ( not ( = ?auto_503204 ?auto_503207 ) ) ( not ( = ?auto_503204 ?auto_503208 ) ) ( not ( = ?auto_503204 ?auto_503209 ) ) ( not ( = ?auto_503204 ?auto_503210 ) ) ( not ( = ?auto_503205 ?auto_503206 ) ) ( not ( = ?auto_503205 ?auto_503207 ) ) ( not ( = ?auto_503205 ?auto_503208 ) ) ( not ( = ?auto_503205 ?auto_503209 ) ) ( not ( = ?auto_503205 ?auto_503210 ) ) ( not ( = ?auto_503206 ?auto_503207 ) ) ( not ( = ?auto_503206 ?auto_503208 ) ) ( not ( = ?auto_503206 ?auto_503209 ) ) ( not ( = ?auto_503206 ?auto_503210 ) ) ( not ( = ?auto_503207 ?auto_503208 ) ) ( not ( = ?auto_503207 ?auto_503209 ) ) ( not ( = ?auto_503207 ?auto_503210 ) ) ( not ( = ?auto_503208 ?auto_503209 ) ) ( not ( = ?auto_503208 ?auto_503210 ) ) ( not ( = ?auto_503209 ?auto_503210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_503209 ?auto_503210 )
      ( !STACK ?auto_503209 ?auto_503208 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503236 - BLOCK
      ?auto_503237 - BLOCK
      ?auto_503238 - BLOCK
      ?auto_503239 - BLOCK
      ?auto_503240 - BLOCK
      ?auto_503241 - BLOCK
      ?auto_503242 - BLOCK
      ?auto_503243 - BLOCK
    )
    :vars
    (
      ?auto_503244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503243 ?auto_503244 ) ( ON-TABLE ?auto_503236 ) ( ON ?auto_503237 ?auto_503236 ) ( ON ?auto_503238 ?auto_503237 ) ( ON ?auto_503239 ?auto_503238 ) ( ON ?auto_503240 ?auto_503239 ) ( ON ?auto_503241 ?auto_503240 ) ( not ( = ?auto_503236 ?auto_503237 ) ) ( not ( = ?auto_503236 ?auto_503238 ) ) ( not ( = ?auto_503236 ?auto_503239 ) ) ( not ( = ?auto_503236 ?auto_503240 ) ) ( not ( = ?auto_503236 ?auto_503241 ) ) ( not ( = ?auto_503236 ?auto_503242 ) ) ( not ( = ?auto_503236 ?auto_503243 ) ) ( not ( = ?auto_503236 ?auto_503244 ) ) ( not ( = ?auto_503237 ?auto_503238 ) ) ( not ( = ?auto_503237 ?auto_503239 ) ) ( not ( = ?auto_503237 ?auto_503240 ) ) ( not ( = ?auto_503237 ?auto_503241 ) ) ( not ( = ?auto_503237 ?auto_503242 ) ) ( not ( = ?auto_503237 ?auto_503243 ) ) ( not ( = ?auto_503237 ?auto_503244 ) ) ( not ( = ?auto_503238 ?auto_503239 ) ) ( not ( = ?auto_503238 ?auto_503240 ) ) ( not ( = ?auto_503238 ?auto_503241 ) ) ( not ( = ?auto_503238 ?auto_503242 ) ) ( not ( = ?auto_503238 ?auto_503243 ) ) ( not ( = ?auto_503238 ?auto_503244 ) ) ( not ( = ?auto_503239 ?auto_503240 ) ) ( not ( = ?auto_503239 ?auto_503241 ) ) ( not ( = ?auto_503239 ?auto_503242 ) ) ( not ( = ?auto_503239 ?auto_503243 ) ) ( not ( = ?auto_503239 ?auto_503244 ) ) ( not ( = ?auto_503240 ?auto_503241 ) ) ( not ( = ?auto_503240 ?auto_503242 ) ) ( not ( = ?auto_503240 ?auto_503243 ) ) ( not ( = ?auto_503240 ?auto_503244 ) ) ( not ( = ?auto_503241 ?auto_503242 ) ) ( not ( = ?auto_503241 ?auto_503243 ) ) ( not ( = ?auto_503241 ?auto_503244 ) ) ( not ( = ?auto_503242 ?auto_503243 ) ) ( not ( = ?auto_503242 ?auto_503244 ) ) ( not ( = ?auto_503243 ?auto_503244 ) ) ( CLEAR ?auto_503241 ) ( ON ?auto_503242 ?auto_503243 ) ( CLEAR ?auto_503242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_503236 ?auto_503237 ?auto_503238 ?auto_503239 ?auto_503240 ?auto_503241 ?auto_503242 )
      ( MAKE-8PILE ?auto_503236 ?auto_503237 ?auto_503238 ?auto_503239 ?auto_503240 ?auto_503241 ?auto_503242 ?auto_503243 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503270 - BLOCK
      ?auto_503271 - BLOCK
      ?auto_503272 - BLOCK
      ?auto_503273 - BLOCK
      ?auto_503274 - BLOCK
      ?auto_503275 - BLOCK
      ?auto_503276 - BLOCK
      ?auto_503277 - BLOCK
    )
    :vars
    (
      ?auto_503278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503277 ?auto_503278 ) ( ON-TABLE ?auto_503270 ) ( ON ?auto_503271 ?auto_503270 ) ( ON ?auto_503272 ?auto_503271 ) ( ON ?auto_503273 ?auto_503272 ) ( ON ?auto_503274 ?auto_503273 ) ( not ( = ?auto_503270 ?auto_503271 ) ) ( not ( = ?auto_503270 ?auto_503272 ) ) ( not ( = ?auto_503270 ?auto_503273 ) ) ( not ( = ?auto_503270 ?auto_503274 ) ) ( not ( = ?auto_503270 ?auto_503275 ) ) ( not ( = ?auto_503270 ?auto_503276 ) ) ( not ( = ?auto_503270 ?auto_503277 ) ) ( not ( = ?auto_503270 ?auto_503278 ) ) ( not ( = ?auto_503271 ?auto_503272 ) ) ( not ( = ?auto_503271 ?auto_503273 ) ) ( not ( = ?auto_503271 ?auto_503274 ) ) ( not ( = ?auto_503271 ?auto_503275 ) ) ( not ( = ?auto_503271 ?auto_503276 ) ) ( not ( = ?auto_503271 ?auto_503277 ) ) ( not ( = ?auto_503271 ?auto_503278 ) ) ( not ( = ?auto_503272 ?auto_503273 ) ) ( not ( = ?auto_503272 ?auto_503274 ) ) ( not ( = ?auto_503272 ?auto_503275 ) ) ( not ( = ?auto_503272 ?auto_503276 ) ) ( not ( = ?auto_503272 ?auto_503277 ) ) ( not ( = ?auto_503272 ?auto_503278 ) ) ( not ( = ?auto_503273 ?auto_503274 ) ) ( not ( = ?auto_503273 ?auto_503275 ) ) ( not ( = ?auto_503273 ?auto_503276 ) ) ( not ( = ?auto_503273 ?auto_503277 ) ) ( not ( = ?auto_503273 ?auto_503278 ) ) ( not ( = ?auto_503274 ?auto_503275 ) ) ( not ( = ?auto_503274 ?auto_503276 ) ) ( not ( = ?auto_503274 ?auto_503277 ) ) ( not ( = ?auto_503274 ?auto_503278 ) ) ( not ( = ?auto_503275 ?auto_503276 ) ) ( not ( = ?auto_503275 ?auto_503277 ) ) ( not ( = ?auto_503275 ?auto_503278 ) ) ( not ( = ?auto_503276 ?auto_503277 ) ) ( not ( = ?auto_503276 ?auto_503278 ) ) ( not ( = ?auto_503277 ?auto_503278 ) ) ( ON ?auto_503276 ?auto_503277 ) ( CLEAR ?auto_503274 ) ( ON ?auto_503275 ?auto_503276 ) ( CLEAR ?auto_503275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_503270 ?auto_503271 ?auto_503272 ?auto_503273 ?auto_503274 ?auto_503275 )
      ( MAKE-8PILE ?auto_503270 ?auto_503271 ?auto_503272 ?auto_503273 ?auto_503274 ?auto_503275 ?auto_503276 ?auto_503277 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503304 - BLOCK
      ?auto_503305 - BLOCK
      ?auto_503306 - BLOCK
      ?auto_503307 - BLOCK
      ?auto_503308 - BLOCK
      ?auto_503309 - BLOCK
      ?auto_503310 - BLOCK
      ?auto_503311 - BLOCK
    )
    :vars
    (
      ?auto_503312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503311 ?auto_503312 ) ( ON-TABLE ?auto_503304 ) ( ON ?auto_503305 ?auto_503304 ) ( ON ?auto_503306 ?auto_503305 ) ( ON ?auto_503307 ?auto_503306 ) ( not ( = ?auto_503304 ?auto_503305 ) ) ( not ( = ?auto_503304 ?auto_503306 ) ) ( not ( = ?auto_503304 ?auto_503307 ) ) ( not ( = ?auto_503304 ?auto_503308 ) ) ( not ( = ?auto_503304 ?auto_503309 ) ) ( not ( = ?auto_503304 ?auto_503310 ) ) ( not ( = ?auto_503304 ?auto_503311 ) ) ( not ( = ?auto_503304 ?auto_503312 ) ) ( not ( = ?auto_503305 ?auto_503306 ) ) ( not ( = ?auto_503305 ?auto_503307 ) ) ( not ( = ?auto_503305 ?auto_503308 ) ) ( not ( = ?auto_503305 ?auto_503309 ) ) ( not ( = ?auto_503305 ?auto_503310 ) ) ( not ( = ?auto_503305 ?auto_503311 ) ) ( not ( = ?auto_503305 ?auto_503312 ) ) ( not ( = ?auto_503306 ?auto_503307 ) ) ( not ( = ?auto_503306 ?auto_503308 ) ) ( not ( = ?auto_503306 ?auto_503309 ) ) ( not ( = ?auto_503306 ?auto_503310 ) ) ( not ( = ?auto_503306 ?auto_503311 ) ) ( not ( = ?auto_503306 ?auto_503312 ) ) ( not ( = ?auto_503307 ?auto_503308 ) ) ( not ( = ?auto_503307 ?auto_503309 ) ) ( not ( = ?auto_503307 ?auto_503310 ) ) ( not ( = ?auto_503307 ?auto_503311 ) ) ( not ( = ?auto_503307 ?auto_503312 ) ) ( not ( = ?auto_503308 ?auto_503309 ) ) ( not ( = ?auto_503308 ?auto_503310 ) ) ( not ( = ?auto_503308 ?auto_503311 ) ) ( not ( = ?auto_503308 ?auto_503312 ) ) ( not ( = ?auto_503309 ?auto_503310 ) ) ( not ( = ?auto_503309 ?auto_503311 ) ) ( not ( = ?auto_503309 ?auto_503312 ) ) ( not ( = ?auto_503310 ?auto_503311 ) ) ( not ( = ?auto_503310 ?auto_503312 ) ) ( not ( = ?auto_503311 ?auto_503312 ) ) ( ON ?auto_503310 ?auto_503311 ) ( ON ?auto_503309 ?auto_503310 ) ( CLEAR ?auto_503307 ) ( ON ?auto_503308 ?auto_503309 ) ( CLEAR ?auto_503308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_503304 ?auto_503305 ?auto_503306 ?auto_503307 ?auto_503308 )
      ( MAKE-8PILE ?auto_503304 ?auto_503305 ?auto_503306 ?auto_503307 ?auto_503308 ?auto_503309 ?auto_503310 ?auto_503311 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503338 - BLOCK
      ?auto_503339 - BLOCK
      ?auto_503340 - BLOCK
      ?auto_503341 - BLOCK
      ?auto_503342 - BLOCK
      ?auto_503343 - BLOCK
      ?auto_503344 - BLOCK
      ?auto_503345 - BLOCK
    )
    :vars
    (
      ?auto_503346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503345 ?auto_503346 ) ( ON-TABLE ?auto_503338 ) ( ON ?auto_503339 ?auto_503338 ) ( ON ?auto_503340 ?auto_503339 ) ( not ( = ?auto_503338 ?auto_503339 ) ) ( not ( = ?auto_503338 ?auto_503340 ) ) ( not ( = ?auto_503338 ?auto_503341 ) ) ( not ( = ?auto_503338 ?auto_503342 ) ) ( not ( = ?auto_503338 ?auto_503343 ) ) ( not ( = ?auto_503338 ?auto_503344 ) ) ( not ( = ?auto_503338 ?auto_503345 ) ) ( not ( = ?auto_503338 ?auto_503346 ) ) ( not ( = ?auto_503339 ?auto_503340 ) ) ( not ( = ?auto_503339 ?auto_503341 ) ) ( not ( = ?auto_503339 ?auto_503342 ) ) ( not ( = ?auto_503339 ?auto_503343 ) ) ( not ( = ?auto_503339 ?auto_503344 ) ) ( not ( = ?auto_503339 ?auto_503345 ) ) ( not ( = ?auto_503339 ?auto_503346 ) ) ( not ( = ?auto_503340 ?auto_503341 ) ) ( not ( = ?auto_503340 ?auto_503342 ) ) ( not ( = ?auto_503340 ?auto_503343 ) ) ( not ( = ?auto_503340 ?auto_503344 ) ) ( not ( = ?auto_503340 ?auto_503345 ) ) ( not ( = ?auto_503340 ?auto_503346 ) ) ( not ( = ?auto_503341 ?auto_503342 ) ) ( not ( = ?auto_503341 ?auto_503343 ) ) ( not ( = ?auto_503341 ?auto_503344 ) ) ( not ( = ?auto_503341 ?auto_503345 ) ) ( not ( = ?auto_503341 ?auto_503346 ) ) ( not ( = ?auto_503342 ?auto_503343 ) ) ( not ( = ?auto_503342 ?auto_503344 ) ) ( not ( = ?auto_503342 ?auto_503345 ) ) ( not ( = ?auto_503342 ?auto_503346 ) ) ( not ( = ?auto_503343 ?auto_503344 ) ) ( not ( = ?auto_503343 ?auto_503345 ) ) ( not ( = ?auto_503343 ?auto_503346 ) ) ( not ( = ?auto_503344 ?auto_503345 ) ) ( not ( = ?auto_503344 ?auto_503346 ) ) ( not ( = ?auto_503345 ?auto_503346 ) ) ( ON ?auto_503344 ?auto_503345 ) ( ON ?auto_503343 ?auto_503344 ) ( ON ?auto_503342 ?auto_503343 ) ( CLEAR ?auto_503340 ) ( ON ?auto_503341 ?auto_503342 ) ( CLEAR ?auto_503341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_503338 ?auto_503339 ?auto_503340 ?auto_503341 )
      ( MAKE-8PILE ?auto_503338 ?auto_503339 ?auto_503340 ?auto_503341 ?auto_503342 ?auto_503343 ?auto_503344 ?auto_503345 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503372 - BLOCK
      ?auto_503373 - BLOCK
      ?auto_503374 - BLOCK
      ?auto_503375 - BLOCK
      ?auto_503376 - BLOCK
      ?auto_503377 - BLOCK
      ?auto_503378 - BLOCK
      ?auto_503379 - BLOCK
    )
    :vars
    (
      ?auto_503380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503379 ?auto_503380 ) ( ON-TABLE ?auto_503372 ) ( ON ?auto_503373 ?auto_503372 ) ( not ( = ?auto_503372 ?auto_503373 ) ) ( not ( = ?auto_503372 ?auto_503374 ) ) ( not ( = ?auto_503372 ?auto_503375 ) ) ( not ( = ?auto_503372 ?auto_503376 ) ) ( not ( = ?auto_503372 ?auto_503377 ) ) ( not ( = ?auto_503372 ?auto_503378 ) ) ( not ( = ?auto_503372 ?auto_503379 ) ) ( not ( = ?auto_503372 ?auto_503380 ) ) ( not ( = ?auto_503373 ?auto_503374 ) ) ( not ( = ?auto_503373 ?auto_503375 ) ) ( not ( = ?auto_503373 ?auto_503376 ) ) ( not ( = ?auto_503373 ?auto_503377 ) ) ( not ( = ?auto_503373 ?auto_503378 ) ) ( not ( = ?auto_503373 ?auto_503379 ) ) ( not ( = ?auto_503373 ?auto_503380 ) ) ( not ( = ?auto_503374 ?auto_503375 ) ) ( not ( = ?auto_503374 ?auto_503376 ) ) ( not ( = ?auto_503374 ?auto_503377 ) ) ( not ( = ?auto_503374 ?auto_503378 ) ) ( not ( = ?auto_503374 ?auto_503379 ) ) ( not ( = ?auto_503374 ?auto_503380 ) ) ( not ( = ?auto_503375 ?auto_503376 ) ) ( not ( = ?auto_503375 ?auto_503377 ) ) ( not ( = ?auto_503375 ?auto_503378 ) ) ( not ( = ?auto_503375 ?auto_503379 ) ) ( not ( = ?auto_503375 ?auto_503380 ) ) ( not ( = ?auto_503376 ?auto_503377 ) ) ( not ( = ?auto_503376 ?auto_503378 ) ) ( not ( = ?auto_503376 ?auto_503379 ) ) ( not ( = ?auto_503376 ?auto_503380 ) ) ( not ( = ?auto_503377 ?auto_503378 ) ) ( not ( = ?auto_503377 ?auto_503379 ) ) ( not ( = ?auto_503377 ?auto_503380 ) ) ( not ( = ?auto_503378 ?auto_503379 ) ) ( not ( = ?auto_503378 ?auto_503380 ) ) ( not ( = ?auto_503379 ?auto_503380 ) ) ( ON ?auto_503378 ?auto_503379 ) ( ON ?auto_503377 ?auto_503378 ) ( ON ?auto_503376 ?auto_503377 ) ( ON ?auto_503375 ?auto_503376 ) ( CLEAR ?auto_503373 ) ( ON ?auto_503374 ?auto_503375 ) ( CLEAR ?auto_503374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_503372 ?auto_503373 ?auto_503374 )
      ( MAKE-8PILE ?auto_503372 ?auto_503373 ?auto_503374 ?auto_503375 ?auto_503376 ?auto_503377 ?auto_503378 ?auto_503379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503406 - BLOCK
      ?auto_503407 - BLOCK
      ?auto_503408 - BLOCK
      ?auto_503409 - BLOCK
      ?auto_503410 - BLOCK
      ?auto_503411 - BLOCK
      ?auto_503412 - BLOCK
      ?auto_503413 - BLOCK
    )
    :vars
    (
      ?auto_503414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503413 ?auto_503414 ) ( ON-TABLE ?auto_503406 ) ( not ( = ?auto_503406 ?auto_503407 ) ) ( not ( = ?auto_503406 ?auto_503408 ) ) ( not ( = ?auto_503406 ?auto_503409 ) ) ( not ( = ?auto_503406 ?auto_503410 ) ) ( not ( = ?auto_503406 ?auto_503411 ) ) ( not ( = ?auto_503406 ?auto_503412 ) ) ( not ( = ?auto_503406 ?auto_503413 ) ) ( not ( = ?auto_503406 ?auto_503414 ) ) ( not ( = ?auto_503407 ?auto_503408 ) ) ( not ( = ?auto_503407 ?auto_503409 ) ) ( not ( = ?auto_503407 ?auto_503410 ) ) ( not ( = ?auto_503407 ?auto_503411 ) ) ( not ( = ?auto_503407 ?auto_503412 ) ) ( not ( = ?auto_503407 ?auto_503413 ) ) ( not ( = ?auto_503407 ?auto_503414 ) ) ( not ( = ?auto_503408 ?auto_503409 ) ) ( not ( = ?auto_503408 ?auto_503410 ) ) ( not ( = ?auto_503408 ?auto_503411 ) ) ( not ( = ?auto_503408 ?auto_503412 ) ) ( not ( = ?auto_503408 ?auto_503413 ) ) ( not ( = ?auto_503408 ?auto_503414 ) ) ( not ( = ?auto_503409 ?auto_503410 ) ) ( not ( = ?auto_503409 ?auto_503411 ) ) ( not ( = ?auto_503409 ?auto_503412 ) ) ( not ( = ?auto_503409 ?auto_503413 ) ) ( not ( = ?auto_503409 ?auto_503414 ) ) ( not ( = ?auto_503410 ?auto_503411 ) ) ( not ( = ?auto_503410 ?auto_503412 ) ) ( not ( = ?auto_503410 ?auto_503413 ) ) ( not ( = ?auto_503410 ?auto_503414 ) ) ( not ( = ?auto_503411 ?auto_503412 ) ) ( not ( = ?auto_503411 ?auto_503413 ) ) ( not ( = ?auto_503411 ?auto_503414 ) ) ( not ( = ?auto_503412 ?auto_503413 ) ) ( not ( = ?auto_503412 ?auto_503414 ) ) ( not ( = ?auto_503413 ?auto_503414 ) ) ( ON ?auto_503412 ?auto_503413 ) ( ON ?auto_503411 ?auto_503412 ) ( ON ?auto_503410 ?auto_503411 ) ( ON ?auto_503409 ?auto_503410 ) ( ON ?auto_503408 ?auto_503409 ) ( CLEAR ?auto_503406 ) ( ON ?auto_503407 ?auto_503408 ) ( CLEAR ?auto_503407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_503406 ?auto_503407 )
      ( MAKE-8PILE ?auto_503406 ?auto_503407 ?auto_503408 ?auto_503409 ?auto_503410 ?auto_503411 ?auto_503412 ?auto_503413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_503440 - BLOCK
      ?auto_503441 - BLOCK
      ?auto_503442 - BLOCK
      ?auto_503443 - BLOCK
      ?auto_503444 - BLOCK
      ?auto_503445 - BLOCK
      ?auto_503446 - BLOCK
      ?auto_503447 - BLOCK
    )
    :vars
    (
      ?auto_503448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503447 ?auto_503448 ) ( not ( = ?auto_503440 ?auto_503441 ) ) ( not ( = ?auto_503440 ?auto_503442 ) ) ( not ( = ?auto_503440 ?auto_503443 ) ) ( not ( = ?auto_503440 ?auto_503444 ) ) ( not ( = ?auto_503440 ?auto_503445 ) ) ( not ( = ?auto_503440 ?auto_503446 ) ) ( not ( = ?auto_503440 ?auto_503447 ) ) ( not ( = ?auto_503440 ?auto_503448 ) ) ( not ( = ?auto_503441 ?auto_503442 ) ) ( not ( = ?auto_503441 ?auto_503443 ) ) ( not ( = ?auto_503441 ?auto_503444 ) ) ( not ( = ?auto_503441 ?auto_503445 ) ) ( not ( = ?auto_503441 ?auto_503446 ) ) ( not ( = ?auto_503441 ?auto_503447 ) ) ( not ( = ?auto_503441 ?auto_503448 ) ) ( not ( = ?auto_503442 ?auto_503443 ) ) ( not ( = ?auto_503442 ?auto_503444 ) ) ( not ( = ?auto_503442 ?auto_503445 ) ) ( not ( = ?auto_503442 ?auto_503446 ) ) ( not ( = ?auto_503442 ?auto_503447 ) ) ( not ( = ?auto_503442 ?auto_503448 ) ) ( not ( = ?auto_503443 ?auto_503444 ) ) ( not ( = ?auto_503443 ?auto_503445 ) ) ( not ( = ?auto_503443 ?auto_503446 ) ) ( not ( = ?auto_503443 ?auto_503447 ) ) ( not ( = ?auto_503443 ?auto_503448 ) ) ( not ( = ?auto_503444 ?auto_503445 ) ) ( not ( = ?auto_503444 ?auto_503446 ) ) ( not ( = ?auto_503444 ?auto_503447 ) ) ( not ( = ?auto_503444 ?auto_503448 ) ) ( not ( = ?auto_503445 ?auto_503446 ) ) ( not ( = ?auto_503445 ?auto_503447 ) ) ( not ( = ?auto_503445 ?auto_503448 ) ) ( not ( = ?auto_503446 ?auto_503447 ) ) ( not ( = ?auto_503446 ?auto_503448 ) ) ( not ( = ?auto_503447 ?auto_503448 ) ) ( ON ?auto_503446 ?auto_503447 ) ( ON ?auto_503445 ?auto_503446 ) ( ON ?auto_503444 ?auto_503445 ) ( ON ?auto_503443 ?auto_503444 ) ( ON ?auto_503442 ?auto_503443 ) ( ON ?auto_503441 ?auto_503442 ) ( ON ?auto_503440 ?auto_503441 ) ( CLEAR ?auto_503440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_503440 )
      ( MAKE-8PILE ?auto_503440 ?auto_503441 ?auto_503442 ?auto_503443 ?auto_503444 ?auto_503445 ?auto_503446 ?auto_503447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503475 - BLOCK
      ?auto_503476 - BLOCK
      ?auto_503477 - BLOCK
      ?auto_503478 - BLOCK
      ?auto_503479 - BLOCK
      ?auto_503480 - BLOCK
      ?auto_503481 - BLOCK
      ?auto_503482 - BLOCK
      ?auto_503483 - BLOCK
    )
    :vars
    (
      ?auto_503484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_503482 ) ( ON ?auto_503483 ?auto_503484 ) ( CLEAR ?auto_503483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_503475 ) ( ON ?auto_503476 ?auto_503475 ) ( ON ?auto_503477 ?auto_503476 ) ( ON ?auto_503478 ?auto_503477 ) ( ON ?auto_503479 ?auto_503478 ) ( ON ?auto_503480 ?auto_503479 ) ( ON ?auto_503481 ?auto_503480 ) ( ON ?auto_503482 ?auto_503481 ) ( not ( = ?auto_503475 ?auto_503476 ) ) ( not ( = ?auto_503475 ?auto_503477 ) ) ( not ( = ?auto_503475 ?auto_503478 ) ) ( not ( = ?auto_503475 ?auto_503479 ) ) ( not ( = ?auto_503475 ?auto_503480 ) ) ( not ( = ?auto_503475 ?auto_503481 ) ) ( not ( = ?auto_503475 ?auto_503482 ) ) ( not ( = ?auto_503475 ?auto_503483 ) ) ( not ( = ?auto_503475 ?auto_503484 ) ) ( not ( = ?auto_503476 ?auto_503477 ) ) ( not ( = ?auto_503476 ?auto_503478 ) ) ( not ( = ?auto_503476 ?auto_503479 ) ) ( not ( = ?auto_503476 ?auto_503480 ) ) ( not ( = ?auto_503476 ?auto_503481 ) ) ( not ( = ?auto_503476 ?auto_503482 ) ) ( not ( = ?auto_503476 ?auto_503483 ) ) ( not ( = ?auto_503476 ?auto_503484 ) ) ( not ( = ?auto_503477 ?auto_503478 ) ) ( not ( = ?auto_503477 ?auto_503479 ) ) ( not ( = ?auto_503477 ?auto_503480 ) ) ( not ( = ?auto_503477 ?auto_503481 ) ) ( not ( = ?auto_503477 ?auto_503482 ) ) ( not ( = ?auto_503477 ?auto_503483 ) ) ( not ( = ?auto_503477 ?auto_503484 ) ) ( not ( = ?auto_503478 ?auto_503479 ) ) ( not ( = ?auto_503478 ?auto_503480 ) ) ( not ( = ?auto_503478 ?auto_503481 ) ) ( not ( = ?auto_503478 ?auto_503482 ) ) ( not ( = ?auto_503478 ?auto_503483 ) ) ( not ( = ?auto_503478 ?auto_503484 ) ) ( not ( = ?auto_503479 ?auto_503480 ) ) ( not ( = ?auto_503479 ?auto_503481 ) ) ( not ( = ?auto_503479 ?auto_503482 ) ) ( not ( = ?auto_503479 ?auto_503483 ) ) ( not ( = ?auto_503479 ?auto_503484 ) ) ( not ( = ?auto_503480 ?auto_503481 ) ) ( not ( = ?auto_503480 ?auto_503482 ) ) ( not ( = ?auto_503480 ?auto_503483 ) ) ( not ( = ?auto_503480 ?auto_503484 ) ) ( not ( = ?auto_503481 ?auto_503482 ) ) ( not ( = ?auto_503481 ?auto_503483 ) ) ( not ( = ?auto_503481 ?auto_503484 ) ) ( not ( = ?auto_503482 ?auto_503483 ) ) ( not ( = ?auto_503482 ?auto_503484 ) ) ( not ( = ?auto_503483 ?auto_503484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_503483 ?auto_503484 )
      ( !STACK ?auto_503483 ?auto_503482 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503513 - BLOCK
      ?auto_503514 - BLOCK
      ?auto_503515 - BLOCK
      ?auto_503516 - BLOCK
      ?auto_503517 - BLOCK
      ?auto_503518 - BLOCK
      ?auto_503519 - BLOCK
      ?auto_503520 - BLOCK
      ?auto_503521 - BLOCK
    )
    :vars
    (
      ?auto_503522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503521 ?auto_503522 ) ( ON-TABLE ?auto_503513 ) ( ON ?auto_503514 ?auto_503513 ) ( ON ?auto_503515 ?auto_503514 ) ( ON ?auto_503516 ?auto_503515 ) ( ON ?auto_503517 ?auto_503516 ) ( ON ?auto_503518 ?auto_503517 ) ( ON ?auto_503519 ?auto_503518 ) ( not ( = ?auto_503513 ?auto_503514 ) ) ( not ( = ?auto_503513 ?auto_503515 ) ) ( not ( = ?auto_503513 ?auto_503516 ) ) ( not ( = ?auto_503513 ?auto_503517 ) ) ( not ( = ?auto_503513 ?auto_503518 ) ) ( not ( = ?auto_503513 ?auto_503519 ) ) ( not ( = ?auto_503513 ?auto_503520 ) ) ( not ( = ?auto_503513 ?auto_503521 ) ) ( not ( = ?auto_503513 ?auto_503522 ) ) ( not ( = ?auto_503514 ?auto_503515 ) ) ( not ( = ?auto_503514 ?auto_503516 ) ) ( not ( = ?auto_503514 ?auto_503517 ) ) ( not ( = ?auto_503514 ?auto_503518 ) ) ( not ( = ?auto_503514 ?auto_503519 ) ) ( not ( = ?auto_503514 ?auto_503520 ) ) ( not ( = ?auto_503514 ?auto_503521 ) ) ( not ( = ?auto_503514 ?auto_503522 ) ) ( not ( = ?auto_503515 ?auto_503516 ) ) ( not ( = ?auto_503515 ?auto_503517 ) ) ( not ( = ?auto_503515 ?auto_503518 ) ) ( not ( = ?auto_503515 ?auto_503519 ) ) ( not ( = ?auto_503515 ?auto_503520 ) ) ( not ( = ?auto_503515 ?auto_503521 ) ) ( not ( = ?auto_503515 ?auto_503522 ) ) ( not ( = ?auto_503516 ?auto_503517 ) ) ( not ( = ?auto_503516 ?auto_503518 ) ) ( not ( = ?auto_503516 ?auto_503519 ) ) ( not ( = ?auto_503516 ?auto_503520 ) ) ( not ( = ?auto_503516 ?auto_503521 ) ) ( not ( = ?auto_503516 ?auto_503522 ) ) ( not ( = ?auto_503517 ?auto_503518 ) ) ( not ( = ?auto_503517 ?auto_503519 ) ) ( not ( = ?auto_503517 ?auto_503520 ) ) ( not ( = ?auto_503517 ?auto_503521 ) ) ( not ( = ?auto_503517 ?auto_503522 ) ) ( not ( = ?auto_503518 ?auto_503519 ) ) ( not ( = ?auto_503518 ?auto_503520 ) ) ( not ( = ?auto_503518 ?auto_503521 ) ) ( not ( = ?auto_503518 ?auto_503522 ) ) ( not ( = ?auto_503519 ?auto_503520 ) ) ( not ( = ?auto_503519 ?auto_503521 ) ) ( not ( = ?auto_503519 ?auto_503522 ) ) ( not ( = ?auto_503520 ?auto_503521 ) ) ( not ( = ?auto_503520 ?auto_503522 ) ) ( not ( = ?auto_503521 ?auto_503522 ) ) ( CLEAR ?auto_503519 ) ( ON ?auto_503520 ?auto_503521 ) ( CLEAR ?auto_503520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_503513 ?auto_503514 ?auto_503515 ?auto_503516 ?auto_503517 ?auto_503518 ?auto_503519 ?auto_503520 )
      ( MAKE-9PILE ?auto_503513 ?auto_503514 ?auto_503515 ?auto_503516 ?auto_503517 ?auto_503518 ?auto_503519 ?auto_503520 ?auto_503521 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503551 - BLOCK
      ?auto_503552 - BLOCK
      ?auto_503553 - BLOCK
      ?auto_503554 - BLOCK
      ?auto_503555 - BLOCK
      ?auto_503556 - BLOCK
      ?auto_503557 - BLOCK
      ?auto_503558 - BLOCK
      ?auto_503559 - BLOCK
    )
    :vars
    (
      ?auto_503560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503559 ?auto_503560 ) ( ON-TABLE ?auto_503551 ) ( ON ?auto_503552 ?auto_503551 ) ( ON ?auto_503553 ?auto_503552 ) ( ON ?auto_503554 ?auto_503553 ) ( ON ?auto_503555 ?auto_503554 ) ( ON ?auto_503556 ?auto_503555 ) ( not ( = ?auto_503551 ?auto_503552 ) ) ( not ( = ?auto_503551 ?auto_503553 ) ) ( not ( = ?auto_503551 ?auto_503554 ) ) ( not ( = ?auto_503551 ?auto_503555 ) ) ( not ( = ?auto_503551 ?auto_503556 ) ) ( not ( = ?auto_503551 ?auto_503557 ) ) ( not ( = ?auto_503551 ?auto_503558 ) ) ( not ( = ?auto_503551 ?auto_503559 ) ) ( not ( = ?auto_503551 ?auto_503560 ) ) ( not ( = ?auto_503552 ?auto_503553 ) ) ( not ( = ?auto_503552 ?auto_503554 ) ) ( not ( = ?auto_503552 ?auto_503555 ) ) ( not ( = ?auto_503552 ?auto_503556 ) ) ( not ( = ?auto_503552 ?auto_503557 ) ) ( not ( = ?auto_503552 ?auto_503558 ) ) ( not ( = ?auto_503552 ?auto_503559 ) ) ( not ( = ?auto_503552 ?auto_503560 ) ) ( not ( = ?auto_503553 ?auto_503554 ) ) ( not ( = ?auto_503553 ?auto_503555 ) ) ( not ( = ?auto_503553 ?auto_503556 ) ) ( not ( = ?auto_503553 ?auto_503557 ) ) ( not ( = ?auto_503553 ?auto_503558 ) ) ( not ( = ?auto_503553 ?auto_503559 ) ) ( not ( = ?auto_503553 ?auto_503560 ) ) ( not ( = ?auto_503554 ?auto_503555 ) ) ( not ( = ?auto_503554 ?auto_503556 ) ) ( not ( = ?auto_503554 ?auto_503557 ) ) ( not ( = ?auto_503554 ?auto_503558 ) ) ( not ( = ?auto_503554 ?auto_503559 ) ) ( not ( = ?auto_503554 ?auto_503560 ) ) ( not ( = ?auto_503555 ?auto_503556 ) ) ( not ( = ?auto_503555 ?auto_503557 ) ) ( not ( = ?auto_503555 ?auto_503558 ) ) ( not ( = ?auto_503555 ?auto_503559 ) ) ( not ( = ?auto_503555 ?auto_503560 ) ) ( not ( = ?auto_503556 ?auto_503557 ) ) ( not ( = ?auto_503556 ?auto_503558 ) ) ( not ( = ?auto_503556 ?auto_503559 ) ) ( not ( = ?auto_503556 ?auto_503560 ) ) ( not ( = ?auto_503557 ?auto_503558 ) ) ( not ( = ?auto_503557 ?auto_503559 ) ) ( not ( = ?auto_503557 ?auto_503560 ) ) ( not ( = ?auto_503558 ?auto_503559 ) ) ( not ( = ?auto_503558 ?auto_503560 ) ) ( not ( = ?auto_503559 ?auto_503560 ) ) ( ON ?auto_503558 ?auto_503559 ) ( CLEAR ?auto_503556 ) ( ON ?auto_503557 ?auto_503558 ) ( CLEAR ?auto_503557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_503551 ?auto_503552 ?auto_503553 ?auto_503554 ?auto_503555 ?auto_503556 ?auto_503557 )
      ( MAKE-9PILE ?auto_503551 ?auto_503552 ?auto_503553 ?auto_503554 ?auto_503555 ?auto_503556 ?auto_503557 ?auto_503558 ?auto_503559 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503589 - BLOCK
      ?auto_503590 - BLOCK
      ?auto_503591 - BLOCK
      ?auto_503592 - BLOCK
      ?auto_503593 - BLOCK
      ?auto_503594 - BLOCK
      ?auto_503595 - BLOCK
      ?auto_503596 - BLOCK
      ?auto_503597 - BLOCK
    )
    :vars
    (
      ?auto_503598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503597 ?auto_503598 ) ( ON-TABLE ?auto_503589 ) ( ON ?auto_503590 ?auto_503589 ) ( ON ?auto_503591 ?auto_503590 ) ( ON ?auto_503592 ?auto_503591 ) ( ON ?auto_503593 ?auto_503592 ) ( not ( = ?auto_503589 ?auto_503590 ) ) ( not ( = ?auto_503589 ?auto_503591 ) ) ( not ( = ?auto_503589 ?auto_503592 ) ) ( not ( = ?auto_503589 ?auto_503593 ) ) ( not ( = ?auto_503589 ?auto_503594 ) ) ( not ( = ?auto_503589 ?auto_503595 ) ) ( not ( = ?auto_503589 ?auto_503596 ) ) ( not ( = ?auto_503589 ?auto_503597 ) ) ( not ( = ?auto_503589 ?auto_503598 ) ) ( not ( = ?auto_503590 ?auto_503591 ) ) ( not ( = ?auto_503590 ?auto_503592 ) ) ( not ( = ?auto_503590 ?auto_503593 ) ) ( not ( = ?auto_503590 ?auto_503594 ) ) ( not ( = ?auto_503590 ?auto_503595 ) ) ( not ( = ?auto_503590 ?auto_503596 ) ) ( not ( = ?auto_503590 ?auto_503597 ) ) ( not ( = ?auto_503590 ?auto_503598 ) ) ( not ( = ?auto_503591 ?auto_503592 ) ) ( not ( = ?auto_503591 ?auto_503593 ) ) ( not ( = ?auto_503591 ?auto_503594 ) ) ( not ( = ?auto_503591 ?auto_503595 ) ) ( not ( = ?auto_503591 ?auto_503596 ) ) ( not ( = ?auto_503591 ?auto_503597 ) ) ( not ( = ?auto_503591 ?auto_503598 ) ) ( not ( = ?auto_503592 ?auto_503593 ) ) ( not ( = ?auto_503592 ?auto_503594 ) ) ( not ( = ?auto_503592 ?auto_503595 ) ) ( not ( = ?auto_503592 ?auto_503596 ) ) ( not ( = ?auto_503592 ?auto_503597 ) ) ( not ( = ?auto_503592 ?auto_503598 ) ) ( not ( = ?auto_503593 ?auto_503594 ) ) ( not ( = ?auto_503593 ?auto_503595 ) ) ( not ( = ?auto_503593 ?auto_503596 ) ) ( not ( = ?auto_503593 ?auto_503597 ) ) ( not ( = ?auto_503593 ?auto_503598 ) ) ( not ( = ?auto_503594 ?auto_503595 ) ) ( not ( = ?auto_503594 ?auto_503596 ) ) ( not ( = ?auto_503594 ?auto_503597 ) ) ( not ( = ?auto_503594 ?auto_503598 ) ) ( not ( = ?auto_503595 ?auto_503596 ) ) ( not ( = ?auto_503595 ?auto_503597 ) ) ( not ( = ?auto_503595 ?auto_503598 ) ) ( not ( = ?auto_503596 ?auto_503597 ) ) ( not ( = ?auto_503596 ?auto_503598 ) ) ( not ( = ?auto_503597 ?auto_503598 ) ) ( ON ?auto_503596 ?auto_503597 ) ( ON ?auto_503595 ?auto_503596 ) ( CLEAR ?auto_503593 ) ( ON ?auto_503594 ?auto_503595 ) ( CLEAR ?auto_503594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_503589 ?auto_503590 ?auto_503591 ?auto_503592 ?auto_503593 ?auto_503594 )
      ( MAKE-9PILE ?auto_503589 ?auto_503590 ?auto_503591 ?auto_503592 ?auto_503593 ?auto_503594 ?auto_503595 ?auto_503596 ?auto_503597 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503627 - BLOCK
      ?auto_503628 - BLOCK
      ?auto_503629 - BLOCK
      ?auto_503630 - BLOCK
      ?auto_503631 - BLOCK
      ?auto_503632 - BLOCK
      ?auto_503633 - BLOCK
      ?auto_503634 - BLOCK
      ?auto_503635 - BLOCK
    )
    :vars
    (
      ?auto_503636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503635 ?auto_503636 ) ( ON-TABLE ?auto_503627 ) ( ON ?auto_503628 ?auto_503627 ) ( ON ?auto_503629 ?auto_503628 ) ( ON ?auto_503630 ?auto_503629 ) ( not ( = ?auto_503627 ?auto_503628 ) ) ( not ( = ?auto_503627 ?auto_503629 ) ) ( not ( = ?auto_503627 ?auto_503630 ) ) ( not ( = ?auto_503627 ?auto_503631 ) ) ( not ( = ?auto_503627 ?auto_503632 ) ) ( not ( = ?auto_503627 ?auto_503633 ) ) ( not ( = ?auto_503627 ?auto_503634 ) ) ( not ( = ?auto_503627 ?auto_503635 ) ) ( not ( = ?auto_503627 ?auto_503636 ) ) ( not ( = ?auto_503628 ?auto_503629 ) ) ( not ( = ?auto_503628 ?auto_503630 ) ) ( not ( = ?auto_503628 ?auto_503631 ) ) ( not ( = ?auto_503628 ?auto_503632 ) ) ( not ( = ?auto_503628 ?auto_503633 ) ) ( not ( = ?auto_503628 ?auto_503634 ) ) ( not ( = ?auto_503628 ?auto_503635 ) ) ( not ( = ?auto_503628 ?auto_503636 ) ) ( not ( = ?auto_503629 ?auto_503630 ) ) ( not ( = ?auto_503629 ?auto_503631 ) ) ( not ( = ?auto_503629 ?auto_503632 ) ) ( not ( = ?auto_503629 ?auto_503633 ) ) ( not ( = ?auto_503629 ?auto_503634 ) ) ( not ( = ?auto_503629 ?auto_503635 ) ) ( not ( = ?auto_503629 ?auto_503636 ) ) ( not ( = ?auto_503630 ?auto_503631 ) ) ( not ( = ?auto_503630 ?auto_503632 ) ) ( not ( = ?auto_503630 ?auto_503633 ) ) ( not ( = ?auto_503630 ?auto_503634 ) ) ( not ( = ?auto_503630 ?auto_503635 ) ) ( not ( = ?auto_503630 ?auto_503636 ) ) ( not ( = ?auto_503631 ?auto_503632 ) ) ( not ( = ?auto_503631 ?auto_503633 ) ) ( not ( = ?auto_503631 ?auto_503634 ) ) ( not ( = ?auto_503631 ?auto_503635 ) ) ( not ( = ?auto_503631 ?auto_503636 ) ) ( not ( = ?auto_503632 ?auto_503633 ) ) ( not ( = ?auto_503632 ?auto_503634 ) ) ( not ( = ?auto_503632 ?auto_503635 ) ) ( not ( = ?auto_503632 ?auto_503636 ) ) ( not ( = ?auto_503633 ?auto_503634 ) ) ( not ( = ?auto_503633 ?auto_503635 ) ) ( not ( = ?auto_503633 ?auto_503636 ) ) ( not ( = ?auto_503634 ?auto_503635 ) ) ( not ( = ?auto_503634 ?auto_503636 ) ) ( not ( = ?auto_503635 ?auto_503636 ) ) ( ON ?auto_503634 ?auto_503635 ) ( ON ?auto_503633 ?auto_503634 ) ( ON ?auto_503632 ?auto_503633 ) ( CLEAR ?auto_503630 ) ( ON ?auto_503631 ?auto_503632 ) ( CLEAR ?auto_503631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_503627 ?auto_503628 ?auto_503629 ?auto_503630 ?auto_503631 )
      ( MAKE-9PILE ?auto_503627 ?auto_503628 ?auto_503629 ?auto_503630 ?auto_503631 ?auto_503632 ?auto_503633 ?auto_503634 ?auto_503635 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503665 - BLOCK
      ?auto_503666 - BLOCK
      ?auto_503667 - BLOCK
      ?auto_503668 - BLOCK
      ?auto_503669 - BLOCK
      ?auto_503670 - BLOCK
      ?auto_503671 - BLOCK
      ?auto_503672 - BLOCK
      ?auto_503673 - BLOCK
    )
    :vars
    (
      ?auto_503674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503673 ?auto_503674 ) ( ON-TABLE ?auto_503665 ) ( ON ?auto_503666 ?auto_503665 ) ( ON ?auto_503667 ?auto_503666 ) ( not ( = ?auto_503665 ?auto_503666 ) ) ( not ( = ?auto_503665 ?auto_503667 ) ) ( not ( = ?auto_503665 ?auto_503668 ) ) ( not ( = ?auto_503665 ?auto_503669 ) ) ( not ( = ?auto_503665 ?auto_503670 ) ) ( not ( = ?auto_503665 ?auto_503671 ) ) ( not ( = ?auto_503665 ?auto_503672 ) ) ( not ( = ?auto_503665 ?auto_503673 ) ) ( not ( = ?auto_503665 ?auto_503674 ) ) ( not ( = ?auto_503666 ?auto_503667 ) ) ( not ( = ?auto_503666 ?auto_503668 ) ) ( not ( = ?auto_503666 ?auto_503669 ) ) ( not ( = ?auto_503666 ?auto_503670 ) ) ( not ( = ?auto_503666 ?auto_503671 ) ) ( not ( = ?auto_503666 ?auto_503672 ) ) ( not ( = ?auto_503666 ?auto_503673 ) ) ( not ( = ?auto_503666 ?auto_503674 ) ) ( not ( = ?auto_503667 ?auto_503668 ) ) ( not ( = ?auto_503667 ?auto_503669 ) ) ( not ( = ?auto_503667 ?auto_503670 ) ) ( not ( = ?auto_503667 ?auto_503671 ) ) ( not ( = ?auto_503667 ?auto_503672 ) ) ( not ( = ?auto_503667 ?auto_503673 ) ) ( not ( = ?auto_503667 ?auto_503674 ) ) ( not ( = ?auto_503668 ?auto_503669 ) ) ( not ( = ?auto_503668 ?auto_503670 ) ) ( not ( = ?auto_503668 ?auto_503671 ) ) ( not ( = ?auto_503668 ?auto_503672 ) ) ( not ( = ?auto_503668 ?auto_503673 ) ) ( not ( = ?auto_503668 ?auto_503674 ) ) ( not ( = ?auto_503669 ?auto_503670 ) ) ( not ( = ?auto_503669 ?auto_503671 ) ) ( not ( = ?auto_503669 ?auto_503672 ) ) ( not ( = ?auto_503669 ?auto_503673 ) ) ( not ( = ?auto_503669 ?auto_503674 ) ) ( not ( = ?auto_503670 ?auto_503671 ) ) ( not ( = ?auto_503670 ?auto_503672 ) ) ( not ( = ?auto_503670 ?auto_503673 ) ) ( not ( = ?auto_503670 ?auto_503674 ) ) ( not ( = ?auto_503671 ?auto_503672 ) ) ( not ( = ?auto_503671 ?auto_503673 ) ) ( not ( = ?auto_503671 ?auto_503674 ) ) ( not ( = ?auto_503672 ?auto_503673 ) ) ( not ( = ?auto_503672 ?auto_503674 ) ) ( not ( = ?auto_503673 ?auto_503674 ) ) ( ON ?auto_503672 ?auto_503673 ) ( ON ?auto_503671 ?auto_503672 ) ( ON ?auto_503670 ?auto_503671 ) ( ON ?auto_503669 ?auto_503670 ) ( CLEAR ?auto_503667 ) ( ON ?auto_503668 ?auto_503669 ) ( CLEAR ?auto_503668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_503665 ?auto_503666 ?auto_503667 ?auto_503668 )
      ( MAKE-9PILE ?auto_503665 ?auto_503666 ?auto_503667 ?auto_503668 ?auto_503669 ?auto_503670 ?auto_503671 ?auto_503672 ?auto_503673 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503703 - BLOCK
      ?auto_503704 - BLOCK
      ?auto_503705 - BLOCK
      ?auto_503706 - BLOCK
      ?auto_503707 - BLOCK
      ?auto_503708 - BLOCK
      ?auto_503709 - BLOCK
      ?auto_503710 - BLOCK
      ?auto_503711 - BLOCK
    )
    :vars
    (
      ?auto_503712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503711 ?auto_503712 ) ( ON-TABLE ?auto_503703 ) ( ON ?auto_503704 ?auto_503703 ) ( not ( = ?auto_503703 ?auto_503704 ) ) ( not ( = ?auto_503703 ?auto_503705 ) ) ( not ( = ?auto_503703 ?auto_503706 ) ) ( not ( = ?auto_503703 ?auto_503707 ) ) ( not ( = ?auto_503703 ?auto_503708 ) ) ( not ( = ?auto_503703 ?auto_503709 ) ) ( not ( = ?auto_503703 ?auto_503710 ) ) ( not ( = ?auto_503703 ?auto_503711 ) ) ( not ( = ?auto_503703 ?auto_503712 ) ) ( not ( = ?auto_503704 ?auto_503705 ) ) ( not ( = ?auto_503704 ?auto_503706 ) ) ( not ( = ?auto_503704 ?auto_503707 ) ) ( not ( = ?auto_503704 ?auto_503708 ) ) ( not ( = ?auto_503704 ?auto_503709 ) ) ( not ( = ?auto_503704 ?auto_503710 ) ) ( not ( = ?auto_503704 ?auto_503711 ) ) ( not ( = ?auto_503704 ?auto_503712 ) ) ( not ( = ?auto_503705 ?auto_503706 ) ) ( not ( = ?auto_503705 ?auto_503707 ) ) ( not ( = ?auto_503705 ?auto_503708 ) ) ( not ( = ?auto_503705 ?auto_503709 ) ) ( not ( = ?auto_503705 ?auto_503710 ) ) ( not ( = ?auto_503705 ?auto_503711 ) ) ( not ( = ?auto_503705 ?auto_503712 ) ) ( not ( = ?auto_503706 ?auto_503707 ) ) ( not ( = ?auto_503706 ?auto_503708 ) ) ( not ( = ?auto_503706 ?auto_503709 ) ) ( not ( = ?auto_503706 ?auto_503710 ) ) ( not ( = ?auto_503706 ?auto_503711 ) ) ( not ( = ?auto_503706 ?auto_503712 ) ) ( not ( = ?auto_503707 ?auto_503708 ) ) ( not ( = ?auto_503707 ?auto_503709 ) ) ( not ( = ?auto_503707 ?auto_503710 ) ) ( not ( = ?auto_503707 ?auto_503711 ) ) ( not ( = ?auto_503707 ?auto_503712 ) ) ( not ( = ?auto_503708 ?auto_503709 ) ) ( not ( = ?auto_503708 ?auto_503710 ) ) ( not ( = ?auto_503708 ?auto_503711 ) ) ( not ( = ?auto_503708 ?auto_503712 ) ) ( not ( = ?auto_503709 ?auto_503710 ) ) ( not ( = ?auto_503709 ?auto_503711 ) ) ( not ( = ?auto_503709 ?auto_503712 ) ) ( not ( = ?auto_503710 ?auto_503711 ) ) ( not ( = ?auto_503710 ?auto_503712 ) ) ( not ( = ?auto_503711 ?auto_503712 ) ) ( ON ?auto_503710 ?auto_503711 ) ( ON ?auto_503709 ?auto_503710 ) ( ON ?auto_503708 ?auto_503709 ) ( ON ?auto_503707 ?auto_503708 ) ( ON ?auto_503706 ?auto_503707 ) ( CLEAR ?auto_503704 ) ( ON ?auto_503705 ?auto_503706 ) ( CLEAR ?auto_503705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_503703 ?auto_503704 ?auto_503705 )
      ( MAKE-9PILE ?auto_503703 ?auto_503704 ?auto_503705 ?auto_503706 ?auto_503707 ?auto_503708 ?auto_503709 ?auto_503710 ?auto_503711 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503741 - BLOCK
      ?auto_503742 - BLOCK
      ?auto_503743 - BLOCK
      ?auto_503744 - BLOCK
      ?auto_503745 - BLOCK
      ?auto_503746 - BLOCK
      ?auto_503747 - BLOCK
      ?auto_503748 - BLOCK
      ?auto_503749 - BLOCK
    )
    :vars
    (
      ?auto_503750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503749 ?auto_503750 ) ( ON-TABLE ?auto_503741 ) ( not ( = ?auto_503741 ?auto_503742 ) ) ( not ( = ?auto_503741 ?auto_503743 ) ) ( not ( = ?auto_503741 ?auto_503744 ) ) ( not ( = ?auto_503741 ?auto_503745 ) ) ( not ( = ?auto_503741 ?auto_503746 ) ) ( not ( = ?auto_503741 ?auto_503747 ) ) ( not ( = ?auto_503741 ?auto_503748 ) ) ( not ( = ?auto_503741 ?auto_503749 ) ) ( not ( = ?auto_503741 ?auto_503750 ) ) ( not ( = ?auto_503742 ?auto_503743 ) ) ( not ( = ?auto_503742 ?auto_503744 ) ) ( not ( = ?auto_503742 ?auto_503745 ) ) ( not ( = ?auto_503742 ?auto_503746 ) ) ( not ( = ?auto_503742 ?auto_503747 ) ) ( not ( = ?auto_503742 ?auto_503748 ) ) ( not ( = ?auto_503742 ?auto_503749 ) ) ( not ( = ?auto_503742 ?auto_503750 ) ) ( not ( = ?auto_503743 ?auto_503744 ) ) ( not ( = ?auto_503743 ?auto_503745 ) ) ( not ( = ?auto_503743 ?auto_503746 ) ) ( not ( = ?auto_503743 ?auto_503747 ) ) ( not ( = ?auto_503743 ?auto_503748 ) ) ( not ( = ?auto_503743 ?auto_503749 ) ) ( not ( = ?auto_503743 ?auto_503750 ) ) ( not ( = ?auto_503744 ?auto_503745 ) ) ( not ( = ?auto_503744 ?auto_503746 ) ) ( not ( = ?auto_503744 ?auto_503747 ) ) ( not ( = ?auto_503744 ?auto_503748 ) ) ( not ( = ?auto_503744 ?auto_503749 ) ) ( not ( = ?auto_503744 ?auto_503750 ) ) ( not ( = ?auto_503745 ?auto_503746 ) ) ( not ( = ?auto_503745 ?auto_503747 ) ) ( not ( = ?auto_503745 ?auto_503748 ) ) ( not ( = ?auto_503745 ?auto_503749 ) ) ( not ( = ?auto_503745 ?auto_503750 ) ) ( not ( = ?auto_503746 ?auto_503747 ) ) ( not ( = ?auto_503746 ?auto_503748 ) ) ( not ( = ?auto_503746 ?auto_503749 ) ) ( not ( = ?auto_503746 ?auto_503750 ) ) ( not ( = ?auto_503747 ?auto_503748 ) ) ( not ( = ?auto_503747 ?auto_503749 ) ) ( not ( = ?auto_503747 ?auto_503750 ) ) ( not ( = ?auto_503748 ?auto_503749 ) ) ( not ( = ?auto_503748 ?auto_503750 ) ) ( not ( = ?auto_503749 ?auto_503750 ) ) ( ON ?auto_503748 ?auto_503749 ) ( ON ?auto_503747 ?auto_503748 ) ( ON ?auto_503746 ?auto_503747 ) ( ON ?auto_503745 ?auto_503746 ) ( ON ?auto_503744 ?auto_503745 ) ( ON ?auto_503743 ?auto_503744 ) ( CLEAR ?auto_503741 ) ( ON ?auto_503742 ?auto_503743 ) ( CLEAR ?auto_503742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_503741 ?auto_503742 )
      ( MAKE-9PILE ?auto_503741 ?auto_503742 ?auto_503743 ?auto_503744 ?auto_503745 ?auto_503746 ?auto_503747 ?auto_503748 ?auto_503749 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_503779 - BLOCK
      ?auto_503780 - BLOCK
      ?auto_503781 - BLOCK
      ?auto_503782 - BLOCK
      ?auto_503783 - BLOCK
      ?auto_503784 - BLOCK
      ?auto_503785 - BLOCK
      ?auto_503786 - BLOCK
      ?auto_503787 - BLOCK
    )
    :vars
    (
      ?auto_503788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503787 ?auto_503788 ) ( not ( = ?auto_503779 ?auto_503780 ) ) ( not ( = ?auto_503779 ?auto_503781 ) ) ( not ( = ?auto_503779 ?auto_503782 ) ) ( not ( = ?auto_503779 ?auto_503783 ) ) ( not ( = ?auto_503779 ?auto_503784 ) ) ( not ( = ?auto_503779 ?auto_503785 ) ) ( not ( = ?auto_503779 ?auto_503786 ) ) ( not ( = ?auto_503779 ?auto_503787 ) ) ( not ( = ?auto_503779 ?auto_503788 ) ) ( not ( = ?auto_503780 ?auto_503781 ) ) ( not ( = ?auto_503780 ?auto_503782 ) ) ( not ( = ?auto_503780 ?auto_503783 ) ) ( not ( = ?auto_503780 ?auto_503784 ) ) ( not ( = ?auto_503780 ?auto_503785 ) ) ( not ( = ?auto_503780 ?auto_503786 ) ) ( not ( = ?auto_503780 ?auto_503787 ) ) ( not ( = ?auto_503780 ?auto_503788 ) ) ( not ( = ?auto_503781 ?auto_503782 ) ) ( not ( = ?auto_503781 ?auto_503783 ) ) ( not ( = ?auto_503781 ?auto_503784 ) ) ( not ( = ?auto_503781 ?auto_503785 ) ) ( not ( = ?auto_503781 ?auto_503786 ) ) ( not ( = ?auto_503781 ?auto_503787 ) ) ( not ( = ?auto_503781 ?auto_503788 ) ) ( not ( = ?auto_503782 ?auto_503783 ) ) ( not ( = ?auto_503782 ?auto_503784 ) ) ( not ( = ?auto_503782 ?auto_503785 ) ) ( not ( = ?auto_503782 ?auto_503786 ) ) ( not ( = ?auto_503782 ?auto_503787 ) ) ( not ( = ?auto_503782 ?auto_503788 ) ) ( not ( = ?auto_503783 ?auto_503784 ) ) ( not ( = ?auto_503783 ?auto_503785 ) ) ( not ( = ?auto_503783 ?auto_503786 ) ) ( not ( = ?auto_503783 ?auto_503787 ) ) ( not ( = ?auto_503783 ?auto_503788 ) ) ( not ( = ?auto_503784 ?auto_503785 ) ) ( not ( = ?auto_503784 ?auto_503786 ) ) ( not ( = ?auto_503784 ?auto_503787 ) ) ( not ( = ?auto_503784 ?auto_503788 ) ) ( not ( = ?auto_503785 ?auto_503786 ) ) ( not ( = ?auto_503785 ?auto_503787 ) ) ( not ( = ?auto_503785 ?auto_503788 ) ) ( not ( = ?auto_503786 ?auto_503787 ) ) ( not ( = ?auto_503786 ?auto_503788 ) ) ( not ( = ?auto_503787 ?auto_503788 ) ) ( ON ?auto_503786 ?auto_503787 ) ( ON ?auto_503785 ?auto_503786 ) ( ON ?auto_503784 ?auto_503785 ) ( ON ?auto_503783 ?auto_503784 ) ( ON ?auto_503782 ?auto_503783 ) ( ON ?auto_503781 ?auto_503782 ) ( ON ?auto_503780 ?auto_503781 ) ( ON ?auto_503779 ?auto_503780 ) ( CLEAR ?auto_503779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_503779 )
      ( MAKE-9PILE ?auto_503779 ?auto_503780 ?auto_503781 ?auto_503782 ?auto_503783 ?auto_503784 ?auto_503785 ?auto_503786 ?auto_503787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_503818 - BLOCK
      ?auto_503819 - BLOCK
      ?auto_503820 - BLOCK
      ?auto_503821 - BLOCK
      ?auto_503822 - BLOCK
      ?auto_503823 - BLOCK
      ?auto_503824 - BLOCK
      ?auto_503825 - BLOCK
      ?auto_503826 - BLOCK
      ?auto_503827 - BLOCK
    )
    :vars
    (
      ?auto_503828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_503826 ) ( ON ?auto_503827 ?auto_503828 ) ( CLEAR ?auto_503827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_503818 ) ( ON ?auto_503819 ?auto_503818 ) ( ON ?auto_503820 ?auto_503819 ) ( ON ?auto_503821 ?auto_503820 ) ( ON ?auto_503822 ?auto_503821 ) ( ON ?auto_503823 ?auto_503822 ) ( ON ?auto_503824 ?auto_503823 ) ( ON ?auto_503825 ?auto_503824 ) ( ON ?auto_503826 ?auto_503825 ) ( not ( = ?auto_503818 ?auto_503819 ) ) ( not ( = ?auto_503818 ?auto_503820 ) ) ( not ( = ?auto_503818 ?auto_503821 ) ) ( not ( = ?auto_503818 ?auto_503822 ) ) ( not ( = ?auto_503818 ?auto_503823 ) ) ( not ( = ?auto_503818 ?auto_503824 ) ) ( not ( = ?auto_503818 ?auto_503825 ) ) ( not ( = ?auto_503818 ?auto_503826 ) ) ( not ( = ?auto_503818 ?auto_503827 ) ) ( not ( = ?auto_503818 ?auto_503828 ) ) ( not ( = ?auto_503819 ?auto_503820 ) ) ( not ( = ?auto_503819 ?auto_503821 ) ) ( not ( = ?auto_503819 ?auto_503822 ) ) ( not ( = ?auto_503819 ?auto_503823 ) ) ( not ( = ?auto_503819 ?auto_503824 ) ) ( not ( = ?auto_503819 ?auto_503825 ) ) ( not ( = ?auto_503819 ?auto_503826 ) ) ( not ( = ?auto_503819 ?auto_503827 ) ) ( not ( = ?auto_503819 ?auto_503828 ) ) ( not ( = ?auto_503820 ?auto_503821 ) ) ( not ( = ?auto_503820 ?auto_503822 ) ) ( not ( = ?auto_503820 ?auto_503823 ) ) ( not ( = ?auto_503820 ?auto_503824 ) ) ( not ( = ?auto_503820 ?auto_503825 ) ) ( not ( = ?auto_503820 ?auto_503826 ) ) ( not ( = ?auto_503820 ?auto_503827 ) ) ( not ( = ?auto_503820 ?auto_503828 ) ) ( not ( = ?auto_503821 ?auto_503822 ) ) ( not ( = ?auto_503821 ?auto_503823 ) ) ( not ( = ?auto_503821 ?auto_503824 ) ) ( not ( = ?auto_503821 ?auto_503825 ) ) ( not ( = ?auto_503821 ?auto_503826 ) ) ( not ( = ?auto_503821 ?auto_503827 ) ) ( not ( = ?auto_503821 ?auto_503828 ) ) ( not ( = ?auto_503822 ?auto_503823 ) ) ( not ( = ?auto_503822 ?auto_503824 ) ) ( not ( = ?auto_503822 ?auto_503825 ) ) ( not ( = ?auto_503822 ?auto_503826 ) ) ( not ( = ?auto_503822 ?auto_503827 ) ) ( not ( = ?auto_503822 ?auto_503828 ) ) ( not ( = ?auto_503823 ?auto_503824 ) ) ( not ( = ?auto_503823 ?auto_503825 ) ) ( not ( = ?auto_503823 ?auto_503826 ) ) ( not ( = ?auto_503823 ?auto_503827 ) ) ( not ( = ?auto_503823 ?auto_503828 ) ) ( not ( = ?auto_503824 ?auto_503825 ) ) ( not ( = ?auto_503824 ?auto_503826 ) ) ( not ( = ?auto_503824 ?auto_503827 ) ) ( not ( = ?auto_503824 ?auto_503828 ) ) ( not ( = ?auto_503825 ?auto_503826 ) ) ( not ( = ?auto_503825 ?auto_503827 ) ) ( not ( = ?auto_503825 ?auto_503828 ) ) ( not ( = ?auto_503826 ?auto_503827 ) ) ( not ( = ?auto_503826 ?auto_503828 ) ) ( not ( = ?auto_503827 ?auto_503828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_503827 ?auto_503828 )
      ( !STACK ?auto_503827 ?auto_503826 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_503860 - BLOCK
      ?auto_503861 - BLOCK
      ?auto_503862 - BLOCK
      ?auto_503863 - BLOCK
      ?auto_503864 - BLOCK
      ?auto_503865 - BLOCK
      ?auto_503866 - BLOCK
      ?auto_503867 - BLOCK
      ?auto_503868 - BLOCK
      ?auto_503869 - BLOCK
    )
    :vars
    (
      ?auto_503870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503869 ?auto_503870 ) ( ON-TABLE ?auto_503860 ) ( ON ?auto_503861 ?auto_503860 ) ( ON ?auto_503862 ?auto_503861 ) ( ON ?auto_503863 ?auto_503862 ) ( ON ?auto_503864 ?auto_503863 ) ( ON ?auto_503865 ?auto_503864 ) ( ON ?auto_503866 ?auto_503865 ) ( ON ?auto_503867 ?auto_503866 ) ( not ( = ?auto_503860 ?auto_503861 ) ) ( not ( = ?auto_503860 ?auto_503862 ) ) ( not ( = ?auto_503860 ?auto_503863 ) ) ( not ( = ?auto_503860 ?auto_503864 ) ) ( not ( = ?auto_503860 ?auto_503865 ) ) ( not ( = ?auto_503860 ?auto_503866 ) ) ( not ( = ?auto_503860 ?auto_503867 ) ) ( not ( = ?auto_503860 ?auto_503868 ) ) ( not ( = ?auto_503860 ?auto_503869 ) ) ( not ( = ?auto_503860 ?auto_503870 ) ) ( not ( = ?auto_503861 ?auto_503862 ) ) ( not ( = ?auto_503861 ?auto_503863 ) ) ( not ( = ?auto_503861 ?auto_503864 ) ) ( not ( = ?auto_503861 ?auto_503865 ) ) ( not ( = ?auto_503861 ?auto_503866 ) ) ( not ( = ?auto_503861 ?auto_503867 ) ) ( not ( = ?auto_503861 ?auto_503868 ) ) ( not ( = ?auto_503861 ?auto_503869 ) ) ( not ( = ?auto_503861 ?auto_503870 ) ) ( not ( = ?auto_503862 ?auto_503863 ) ) ( not ( = ?auto_503862 ?auto_503864 ) ) ( not ( = ?auto_503862 ?auto_503865 ) ) ( not ( = ?auto_503862 ?auto_503866 ) ) ( not ( = ?auto_503862 ?auto_503867 ) ) ( not ( = ?auto_503862 ?auto_503868 ) ) ( not ( = ?auto_503862 ?auto_503869 ) ) ( not ( = ?auto_503862 ?auto_503870 ) ) ( not ( = ?auto_503863 ?auto_503864 ) ) ( not ( = ?auto_503863 ?auto_503865 ) ) ( not ( = ?auto_503863 ?auto_503866 ) ) ( not ( = ?auto_503863 ?auto_503867 ) ) ( not ( = ?auto_503863 ?auto_503868 ) ) ( not ( = ?auto_503863 ?auto_503869 ) ) ( not ( = ?auto_503863 ?auto_503870 ) ) ( not ( = ?auto_503864 ?auto_503865 ) ) ( not ( = ?auto_503864 ?auto_503866 ) ) ( not ( = ?auto_503864 ?auto_503867 ) ) ( not ( = ?auto_503864 ?auto_503868 ) ) ( not ( = ?auto_503864 ?auto_503869 ) ) ( not ( = ?auto_503864 ?auto_503870 ) ) ( not ( = ?auto_503865 ?auto_503866 ) ) ( not ( = ?auto_503865 ?auto_503867 ) ) ( not ( = ?auto_503865 ?auto_503868 ) ) ( not ( = ?auto_503865 ?auto_503869 ) ) ( not ( = ?auto_503865 ?auto_503870 ) ) ( not ( = ?auto_503866 ?auto_503867 ) ) ( not ( = ?auto_503866 ?auto_503868 ) ) ( not ( = ?auto_503866 ?auto_503869 ) ) ( not ( = ?auto_503866 ?auto_503870 ) ) ( not ( = ?auto_503867 ?auto_503868 ) ) ( not ( = ?auto_503867 ?auto_503869 ) ) ( not ( = ?auto_503867 ?auto_503870 ) ) ( not ( = ?auto_503868 ?auto_503869 ) ) ( not ( = ?auto_503868 ?auto_503870 ) ) ( not ( = ?auto_503869 ?auto_503870 ) ) ( CLEAR ?auto_503867 ) ( ON ?auto_503868 ?auto_503869 ) ( CLEAR ?auto_503868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_503860 ?auto_503861 ?auto_503862 ?auto_503863 ?auto_503864 ?auto_503865 ?auto_503866 ?auto_503867 ?auto_503868 )
      ( MAKE-10PILE ?auto_503860 ?auto_503861 ?auto_503862 ?auto_503863 ?auto_503864 ?auto_503865 ?auto_503866 ?auto_503867 ?auto_503868 ?auto_503869 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_503902 - BLOCK
      ?auto_503903 - BLOCK
      ?auto_503904 - BLOCK
      ?auto_503905 - BLOCK
      ?auto_503906 - BLOCK
      ?auto_503907 - BLOCK
      ?auto_503908 - BLOCK
      ?auto_503909 - BLOCK
      ?auto_503910 - BLOCK
      ?auto_503911 - BLOCK
    )
    :vars
    (
      ?auto_503912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503911 ?auto_503912 ) ( ON-TABLE ?auto_503902 ) ( ON ?auto_503903 ?auto_503902 ) ( ON ?auto_503904 ?auto_503903 ) ( ON ?auto_503905 ?auto_503904 ) ( ON ?auto_503906 ?auto_503905 ) ( ON ?auto_503907 ?auto_503906 ) ( ON ?auto_503908 ?auto_503907 ) ( not ( = ?auto_503902 ?auto_503903 ) ) ( not ( = ?auto_503902 ?auto_503904 ) ) ( not ( = ?auto_503902 ?auto_503905 ) ) ( not ( = ?auto_503902 ?auto_503906 ) ) ( not ( = ?auto_503902 ?auto_503907 ) ) ( not ( = ?auto_503902 ?auto_503908 ) ) ( not ( = ?auto_503902 ?auto_503909 ) ) ( not ( = ?auto_503902 ?auto_503910 ) ) ( not ( = ?auto_503902 ?auto_503911 ) ) ( not ( = ?auto_503902 ?auto_503912 ) ) ( not ( = ?auto_503903 ?auto_503904 ) ) ( not ( = ?auto_503903 ?auto_503905 ) ) ( not ( = ?auto_503903 ?auto_503906 ) ) ( not ( = ?auto_503903 ?auto_503907 ) ) ( not ( = ?auto_503903 ?auto_503908 ) ) ( not ( = ?auto_503903 ?auto_503909 ) ) ( not ( = ?auto_503903 ?auto_503910 ) ) ( not ( = ?auto_503903 ?auto_503911 ) ) ( not ( = ?auto_503903 ?auto_503912 ) ) ( not ( = ?auto_503904 ?auto_503905 ) ) ( not ( = ?auto_503904 ?auto_503906 ) ) ( not ( = ?auto_503904 ?auto_503907 ) ) ( not ( = ?auto_503904 ?auto_503908 ) ) ( not ( = ?auto_503904 ?auto_503909 ) ) ( not ( = ?auto_503904 ?auto_503910 ) ) ( not ( = ?auto_503904 ?auto_503911 ) ) ( not ( = ?auto_503904 ?auto_503912 ) ) ( not ( = ?auto_503905 ?auto_503906 ) ) ( not ( = ?auto_503905 ?auto_503907 ) ) ( not ( = ?auto_503905 ?auto_503908 ) ) ( not ( = ?auto_503905 ?auto_503909 ) ) ( not ( = ?auto_503905 ?auto_503910 ) ) ( not ( = ?auto_503905 ?auto_503911 ) ) ( not ( = ?auto_503905 ?auto_503912 ) ) ( not ( = ?auto_503906 ?auto_503907 ) ) ( not ( = ?auto_503906 ?auto_503908 ) ) ( not ( = ?auto_503906 ?auto_503909 ) ) ( not ( = ?auto_503906 ?auto_503910 ) ) ( not ( = ?auto_503906 ?auto_503911 ) ) ( not ( = ?auto_503906 ?auto_503912 ) ) ( not ( = ?auto_503907 ?auto_503908 ) ) ( not ( = ?auto_503907 ?auto_503909 ) ) ( not ( = ?auto_503907 ?auto_503910 ) ) ( not ( = ?auto_503907 ?auto_503911 ) ) ( not ( = ?auto_503907 ?auto_503912 ) ) ( not ( = ?auto_503908 ?auto_503909 ) ) ( not ( = ?auto_503908 ?auto_503910 ) ) ( not ( = ?auto_503908 ?auto_503911 ) ) ( not ( = ?auto_503908 ?auto_503912 ) ) ( not ( = ?auto_503909 ?auto_503910 ) ) ( not ( = ?auto_503909 ?auto_503911 ) ) ( not ( = ?auto_503909 ?auto_503912 ) ) ( not ( = ?auto_503910 ?auto_503911 ) ) ( not ( = ?auto_503910 ?auto_503912 ) ) ( not ( = ?auto_503911 ?auto_503912 ) ) ( ON ?auto_503910 ?auto_503911 ) ( CLEAR ?auto_503908 ) ( ON ?auto_503909 ?auto_503910 ) ( CLEAR ?auto_503909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_503902 ?auto_503903 ?auto_503904 ?auto_503905 ?auto_503906 ?auto_503907 ?auto_503908 ?auto_503909 )
      ( MAKE-10PILE ?auto_503902 ?auto_503903 ?auto_503904 ?auto_503905 ?auto_503906 ?auto_503907 ?auto_503908 ?auto_503909 ?auto_503910 ?auto_503911 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_503944 - BLOCK
      ?auto_503945 - BLOCK
      ?auto_503946 - BLOCK
      ?auto_503947 - BLOCK
      ?auto_503948 - BLOCK
      ?auto_503949 - BLOCK
      ?auto_503950 - BLOCK
      ?auto_503951 - BLOCK
      ?auto_503952 - BLOCK
      ?auto_503953 - BLOCK
    )
    :vars
    (
      ?auto_503954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503953 ?auto_503954 ) ( ON-TABLE ?auto_503944 ) ( ON ?auto_503945 ?auto_503944 ) ( ON ?auto_503946 ?auto_503945 ) ( ON ?auto_503947 ?auto_503946 ) ( ON ?auto_503948 ?auto_503947 ) ( ON ?auto_503949 ?auto_503948 ) ( not ( = ?auto_503944 ?auto_503945 ) ) ( not ( = ?auto_503944 ?auto_503946 ) ) ( not ( = ?auto_503944 ?auto_503947 ) ) ( not ( = ?auto_503944 ?auto_503948 ) ) ( not ( = ?auto_503944 ?auto_503949 ) ) ( not ( = ?auto_503944 ?auto_503950 ) ) ( not ( = ?auto_503944 ?auto_503951 ) ) ( not ( = ?auto_503944 ?auto_503952 ) ) ( not ( = ?auto_503944 ?auto_503953 ) ) ( not ( = ?auto_503944 ?auto_503954 ) ) ( not ( = ?auto_503945 ?auto_503946 ) ) ( not ( = ?auto_503945 ?auto_503947 ) ) ( not ( = ?auto_503945 ?auto_503948 ) ) ( not ( = ?auto_503945 ?auto_503949 ) ) ( not ( = ?auto_503945 ?auto_503950 ) ) ( not ( = ?auto_503945 ?auto_503951 ) ) ( not ( = ?auto_503945 ?auto_503952 ) ) ( not ( = ?auto_503945 ?auto_503953 ) ) ( not ( = ?auto_503945 ?auto_503954 ) ) ( not ( = ?auto_503946 ?auto_503947 ) ) ( not ( = ?auto_503946 ?auto_503948 ) ) ( not ( = ?auto_503946 ?auto_503949 ) ) ( not ( = ?auto_503946 ?auto_503950 ) ) ( not ( = ?auto_503946 ?auto_503951 ) ) ( not ( = ?auto_503946 ?auto_503952 ) ) ( not ( = ?auto_503946 ?auto_503953 ) ) ( not ( = ?auto_503946 ?auto_503954 ) ) ( not ( = ?auto_503947 ?auto_503948 ) ) ( not ( = ?auto_503947 ?auto_503949 ) ) ( not ( = ?auto_503947 ?auto_503950 ) ) ( not ( = ?auto_503947 ?auto_503951 ) ) ( not ( = ?auto_503947 ?auto_503952 ) ) ( not ( = ?auto_503947 ?auto_503953 ) ) ( not ( = ?auto_503947 ?auto_503954 ) ) ( not ( = ?auto_503948 ?auto_503949 ) ) ( not ( = ?auto_503948 ?auto_503950 ) ) ( not ( = ?auto_503948 ?auto_503951 ) ) ( not ( = ?auto_503948 ?auto_503952 ) ) ( not ( = ?auto_503948 ?auto_503953 ) ) ( not ( = ?auto_503948 ?auto_503954 ) ) ( not ( = ?auto_503949 ?auto_503950 ) ) ( not ( = ?auto_503949 ?auto_503951 ) ) ( not ( = ?auto_503949 ?auto_503952 ) ) ( not ( = ?auto_503949 ?auto_503953 ) ) ( not ( = ?auto_503949 ?auto_503954 ) ) ( not ( = ?auto_503950 ?auto_503951 ) ) ( not ( = ?auto_503950 ?auto_503952 ) ) ( not ( = ?auto_503950 ?auto_503953 ) ) ( not ( = ?auto_503950 ?auto_503954 ) ) ( not ( = ?auto_503951 ?auto_503952 ) ) ( not ( = ?auto_503951 ?auto_503953 ) ) ( not ( = ?auto_503951 ?auto_503954 ) ) ( not ( = ?auto_503952 ?auto_503953 ) ) ( not ( = ?auto_503952 ?auto_503954 ) ) ( not ( = ?auto_503953 ?auto_503954 ) ) ( ON ?auto_503952 ?auto_503953 ) ( ON ?auto_503951 ?auto_503952 ) ( CLEAR ?auto_503949 ) ( ON ?auto_503950 ?auto_503951 ) ( CLEAR ?auto_503950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_503944 ?auto_503945 ?auto_503946 ?auto_503947 ?auto_503948 ?auto_503949 ?auto_503950 )
      ( MAKE-10PILE ?auto_503944 ?auto_503945 ?auto_503946 ?auto_503947 ?auto_503948 ?auto_503949 ?auto_503950 ?auto_503951 ?auto_503952 ?auto_503953 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_503986 - BLOCK
      ?auto_503987 - BLOCK
      ?auto_503988 - BLOCK
      ?auto_503989 - BLOCK
      ?auto_503990 - BLOCK
      ?auto_503991 - BLOCK
      ?auto_503992 - BLOCK
      ?auto_503993 - BLOCK
      ?auto_503994 - BLOCK
      ?auto_503995 - BLOCK
    )
    :vars
    (
      ?auto_503996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_503995 ?auto_503996 ) ( ON-TABLE ?auto_503986 ) ( ON ?auto_503987 ?auto_503986 ) ( ON ?auto_503988 ?auto_503987 ) ( ON ?auto_503989 ?auto_503988 ) ( ON ?auto_503990 ?auto_503989 ) ( not ( = ?auto_503986 ?auto_503987 ) ) ( not ( = ?auto_503986 ?auto_503988 ) ) ( not ( = ?auto_503986 ?auto_503989 ) ) ( not ( = ?auto_503986 ?auto_503990 ) ) ( not ( = ?auto_503986 ?auto_503991 ) ) ( not ( = ?auto_503986 ?auto_503992 ) ) ( not ( = ?auto_503986 ?auto_503993 ) ) ( not ( = ?auto_503986 ?auto_503994 ) ) ( not ( = ?auto_503986 ?auto_503995 ) ) ( not ( = ?auto_503986 ?auto_503996 ) ) ( not ( = ?auto_503987 ?auto_503988 ) ) ( not ( = ?auto_503987 ?auto_503989 ) ) ( not ( = ?auto_503987 ?auto_503990 ) ) ( not ( = ?auto_503987 ?auto_503991 ) ) ( not ( = ?auto_503987 ?auto_503992 ) ) ( not ( = ?auto_503987 ?auto_503993 ) ) ( not ( = ?auto_503987 ?auto_503994 ) ) ( not ( = ?auto_503987 ?auto_503995 ) ) ( not ( = ?auto_503987 ?auto_503996 ) ) ( not ( = ?auto_503988 ?auto_503989 ) ) ( not ( = ?auto_503988 ?auto_503990 ) ) ( not ( = ?auto_503988 ?auto_503991 ) ) ( not ( = ?auto_503988 ?auto_503992 ) ) ( not ( = ?auto_503988 ?auto_503993 ) ) ( not ( = ?auto_503988 ?auto_503994 ) ) ( not ( = ?auto_503988 ?auto_503995 ) ) ( not ( = ?auto_503988 ?auto_503996 ) ) ( not ( = ?auto_503989 ?auto_503990 ) ) ( not ( = ?auto_503989 ?auto_503991 ) ) ( not ( = ?auto_503989 ?auto_503992 ) ) ( not ( = ?auto_503989 ?auto_503993 ) ) ( not ( = ?auto_503989 ?auto_503994 ) ) ( not ( = ?auto_503989 ?auto_503995 ) ) ( not ( = ?auto_503989 ?auto_503996 ) ) ( not ( = ?auto_503990 ?auto_503991 ) ) ( not ( = ?auto_503990 ?auto_503992 ) ) ( not ( = ?auto_503990 ?auto_503993 ) ) ( not ( = ?auto_503990 ?auto_503994 ) ) ( not ( = ?auto_503990 ?auto_503995 ) ) ( not ( = ?auto_503990 ?auto_503996 ) ) ( not ( = ?auto_503991 ?auto_503992 ) ) ( not ( = ?auto_503991 ?auto_503993 ) ) ( not ( = ?auto_503991 ?auto_503994 ) ) ( not ( = ?auto_503991 ?auto_503995 ) ) ( not ( = ?auto_503991 ?auto_503996 ) ) ( not ( = ?auto_503992 ?auto_503993 ) ) ( not ( = ?auto_503992 ?auto_503994 ) ) ( not ( = ?auto_503992 ?auto_503995 ) ) ( not ( = ?auto_503992 ?auto_503996 ) ) ( not ( = ?auto_503993 ?auto_503994 ) ) ( not ( = ?auto_503993 ?auto_503995 ) ) ( not ( = ?auto_503993 ?auto_503996 ) ) ( not ( = ?auto_503994 ?auto_503995 ) ) ( not ( = ?auto_503994 ?auto_503996 ) ) ( not ( = ?auto_503995 ?auto_503996 ) ) ( ON ?auto_503994 ?auto_503995 ) ( ON ?auto_503993 ?auto_503994 ) ( ON ?auto_503992 ?auto_503993 ) ( CLEAR ?auto_503990 ) ( ON ?auto_503991 ?auto_503992 ) ( CLEAR ?auto_503991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_503986 ?auto_503987 ?auto_503988 ?auto_503989 ?auto_503990 ?auto_503991 )
      ( MAKE-10PILE ?auto_503986 ?auto_503987 ?auto_503988 ?auto_503989 ?auto_503990 ?auto_503991 ?auto_503992 ?auto_503993 ?auto_503994 ?auto_503995 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_504028 - BLOCK
      ?auto_504029 - BLOCK
      ?auto_504030 - BLOCK
      ?auto_504031 - BLOCK
      ?auto_504032 - BLOCK
      ?auto_504033 - BLOCK
      ?auto_504034 - BLOCK
      ?auto_504035 - BLOCK
      ?auto_504036 - BLOCK
      ?auto_504037 - BLOCK
    )
    :vars
    (
      ?auto_504038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504037 ?auto_504038 ) ( ON-TABLE ?auto_504028 ) ( ON ?auto_504029 ?auto_504028 ) ( ON ?auto_504030 ?auto_504029 ) ( ON ?auto_504031 ?auto_504030 ) ( not ( = ?auto_504028 ?auto_504029 ) ) ( not ( = ?auto_504028 ?auto_504030 ) ) ( not ( = ?auto_504028 ?auto_504031 ) ) ( not ( = ?auto_504028 ?auto_504032 ) ) ( not ( = ?auto_504028 ?auto_504033 ) ) ( not ( = ?auto_504028 ?auto_504034 ) ) ( not ( = ?auto_504028 ?auto_504035 ) ) ( not ( = ?auto_504028 ?auto_504036 ) ) ( not ( = ?auto_504028 ?auto_504037 ) ) ( not ( = ?auto_504028 ?auto_504038 ) ) ( not ( = ?auto_504029 ?auto_504030 ) ) ( not ( = ?auto_504029 ?auto_504031 ) ) ( not ( = ?auto_504029 ?auto_504032 ) ) ( not ( = ?auto_504029 ?auto_504033 ) ) ( not ( = ?auto_504029 ?auto_504034 ) ) ( not ( = ?auto_504029 ?auto_504035 ) ) ( not ( = ?auto_504029 ?auto_504036 ) ) ( not ( = ?auto_504029 ?auto_504037 ) ) ( not ( = ?auto_504029 ?auto_504038 ) ) ( not ( = ?auto_504030 ?auto_504031 ) ) ( not ( = ?auto_504030 ?auto_504032 ) ) ( not ( = ?auto_504030 ?auto_504033 ) ) ( not ( = ?auto_504030 ?auto_504034 ) ) ( not ( = ?auto_504030 ?auto_504035 ) ) ( not ( = ?auto_504030 ?auto_504036 ) ) ( not ( = ?auto_504030 ?auto_504037 ) ) ( not ( = ?auto_504030 ?auto_504038 ) ) ( not ( = ?auto_504031 ?auto_504032 ) ) ( not ( = ?auto_504031 ?auto_504033 ) ) ( not ( = ?auto_504031 ?auto_504034 ) ) ( not ( = ?auto_504031 ?auto_504035 ) ) ( not ( = ?auto_504031 ?auto_504036 ) ) ( not ( = ?auto_504031 ?auto_504037 ) ) ( not ( = ?auto_504031 ?auto_504038 ) ) ( not ( = ?auto_504032 ?auto_504033 ) ) ( not ( = ?auto_504032 ?auto_504034 ) ) ( not ( = ?auto_504032 ?auto_504035 ) ) ( not ( = ?auto_504032 ?auto_504036 ) ) ( not ( = ?auto_504032 ?auto_504037 ) ) ( not ( = ?auto_504032 ?auto_504038 ) ) ( not ( = ?auto_504033 ?auto_504034 ) ) ( not ( = ?auto_504033 ?auto_504035 ) ) ( not ( = ?auto_504033 ?auto_504036 ) ) ( not ( = ?auto_504033 ?auto_504037 ) ) ( not ( = ?auto_504033 ?auto_504038 ) ) ( not ( = ?auto_504034 ?auto_504035 ) ) ( not ( = ?auto_504034 ?auto_504036 ) ) ( not ( = ?auto_504034 ?auto_504037 ) ) ( not ( = ?auto_504034 ?auto_504038 ) ) ( not ( = ?auto_504035 ?auto_504036 ) ) ( not ( = ?auto_504035 ?auto_504037 ) ) ( not ( = ?auto_504035 ?auto_504038 ) ) ( not ( = ?auto_504036 ?auto_504037 ) ) ( not ( = ?auto_504036 ?auto_504038 ) ) ( not ( = ?auto_504037 ?auto_504038 ) ) ( ON ?auto_504036 ?auto_504037 ) ( ON ?auto_504035 ?auto_504036 ) ( ON ?auto_504034 ?auto_504035 ) ( ON ?auto_504033 ?auto_504034 ) ( CLEAR ?auto_504031 ) ( ON ?auto_504032 ?auto_504033 ) ( CLEAR ?auto_504032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_504028 ?auto_504029 ?auto_504030 ?auto_504031 ?auto_504032 )
      ( MAKE-10PILE ?auto_504028 ?auto_504029 ?auto_504030 ?auto_504031 ?auto_504032 ?auto_504033 ?auto_504034 ?auto_504035 ?auto_504036 ?auto_504037 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_504070 - BLOCK
      ?auto_504071 - BLOCK
      ?auto_504072 - BLOCK
      ?auto_504073 - BLOCK
      ?auto_504074 - BLOCK
      ?auto_504075 - BLOCK
      ?auto_504076 - BLOCK
      ?auto_504077 - BLOCK
      ?auto_504078 - BLOCK
      ?auto_504079 - BLOCK
    )
    :vars
    (
      ?auto_504080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504079 ?auto_504080 ) ( ON-TABLE ?auto_504070 ) ( ON ?auto_504071 ?auto_504070 ) ( ON ?auto_504072 ?auto_504071 ) ( not ( = ?auto_504070 ?auto_504071 ) ) ( not ( = ?auto_504070 ?auto_504072 ) ) ( not ( = ?auto_504070 ?auto_504073 ) ) ( not ( = ?auto_504070 ?auto_504074 ) ) ( not ( = ?auto_504070 ?auto_504075 ) ) ( not ( = ?auto_504070 ?auto_504076 ) ) ( not ( = ?auto_504070 ?auto_504077 ) ) ( not ( = ?auto_504070 ?auto_504078 ) ) ( not ( = ?auto_504070 ?auto_504079 ) ) ( not ( = ?auto_504070 ?auto_504080 ) ) ( not ( = ?auto_504071 ?auto_504072 ) ) ( not ( = ?auto_504071 ?auto_504073 ) ) ( not ( = ?auto_504071 ?auto_504074 ) ) ( not ( = ?auto_504071 ?auto_504075 ) ) ( not ( = ?auto_504071 ?auto_504076 ) ) ( not ( = ?auto_504071 ?auto_504077 ) ) ( not ( = ?auto_504071 ?auto_504078 ) ) ( not ( = ?auto_504071 ?auto_504079 ) ) ( not ( = ?auto_504071 ?auto_504080 ) ) ( not ( = ?auto_504072 ?auto_504073 ) ) ( not ( = ?auto_504072 ?auto_504074 ) ) ( not ( = ?auto_504072 ?auto_504075 ) ) ( not ( = ?auto_504072 ?auto_504076 ) ) ( not ( = ?auto_504072 ?auto_504077 ) ) ( not ( = ?auto_504072 ?auto_504078 ) ) ( not ( = ?auto_504072 ?auto_504079 ) ) ( not ( = ?auto_504072 ?auto_504080 ) ) ( not ( = ?auto_504073 ?auto_504074 ) ) ( not ( = ?auto_504073 ?auto_504075 ) ) ( not ( = ?auto_504073 ?auto_504076 ) ) ( not ( = ?auto_504073 ?auto_504077 ) ) ( not ( = ?auto_504073 ?auto_504078 ) ) ( not ( = ?auto_504073 ?auto_504079 ) ) ( not ( = ?auto_504073 ?auto_504080 ) ) ( not ( = ?auto_504074 ?auto_504075 ) ) ( not ( = ?auto_504074 ?auto_504076 ) ) ( not ( = ?auto_504074 ?auto_504077 ) ) ( not ( = ?auto_504074 ?auto_504078 ) ) ( not ( = ?auto_504074 ?auto_504079 ) ) ( not ( = ?auto_504074 ?auto_504080 ) ) ( not ( = ?auto_504075 ?auto_504076 ) ) ( not ( = ?auto_504075 ?auto_504077 ) ) ( not ( = ?auto_504075 ?auto_504078 ) ) ( not ( = ?auto_504075 ?auto_504079 ) ) ( not ( = ?auto_504075 ?auto_504080 ) ) ( not ( = ?auto_504076 ?auto_504077 ) ) ( not ( = ?auto_504076 ?auto_504078 ) ) ( not ( = ?auto_504076 ?auto_504079 ) ) ( not ( = ?auto_504076 ?auto_504080 ) ) ( not ( = ?auto_504077 ?auto_504078 ) ) ( not ( = ?auto_504077 ?auto_504079 ) ) ( not ( = ?auto_504077 ?auto_504080 ) ) ( not ( = ?auto_504078 ?auto_504079 ) ) ( not ( = ?auto_504078 ?auto_504080 ) ) ( not ( = ?auto_504079 ?auto_504080 ) ) ( ON ?auto_504078 ?auto_504079 ) ( ON ?auto_504077 ?auto_504078 ) ( ON ?auto_504076 ?auto_504077 ) ( ON ?auto_504075 ?auto_504076 ) ( ON ?auto_504074 ?auto_504075 ) ( CLEAR ?auto_504072 ) ( ON ?auto_504073 ?auto_504074 ) ( CLEAR ?auto_504073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_504070 ?auto_504071 ?auto_504072 ?auto_504073 )
      ( MAKE-10PILE ?auto_504070 ?auto_504071 ?auto_504072 ?auto_504073 ?auto_504074 ?auto_504075 ?auto_504076 ?auto_504077 ?auto_504078 ?auto_504079 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_504112 - BLOCK
      ?auto_504113 - BLOCK
      ?auto_504114 - BLOCK
      ?auto_504115 - BLOCK
      ?auto_504116 - BLOCK
      ?auto_504117 - BLOCK
      ?auto_504118 - BLOCK
      ?auto_504119 - BLOCK
      ?auto_504120 - BLOCK
      ?auto_504121 - BLOCK
    )
    :vars
    (
      ?auto_504122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504121 ?auto_504122 ) ( ON-TABLE ?auto_504112 ) ( ON ?auto_504113 ?auto_504112 ) ( not ( = ?auto_504112 ?auto_504113 ) ) ( not ( = ?auto_504112 ?auto_504114 ) ) ( not ( = ?auto_504112 ?auto_504115 ) ) ( not ( = ?auto_504112 ?auto_504116 ) ) ( not ( = ?auto_504112 ?auto_504117 ) ) ( not ( = ?auto_504112 ?auto_504118 ) ) ( not ( = ?auto_504112 ?auto_504119 ) ) ( not ( = ?auto_504112 ?auto_504120 ) ) ( not ( = ?auto_504112 ?auto_504121 ) ) ( not ( = ?auto_504112 ?auto_504122 ) ) ( not ( = ?auto_504113 ?auto_504114 ) ) ( not ( = ?auto_504113 ?auto_504115 ) ) ( not ( = ?auto_504113 ?auto_504116 ) ) ( not ( = ?auto_504113 ?auto_504117 ) ) ( not ( = ?auto_504113 ?auto_504118 ) ) ( not ( = ?auto_504113 ?auto_504119 ) ) ( not ( = ?auto_504113 ?auto_504120 ) ) ( not ( = ?auto_504113 ?auto_504121 ) ) ( not ( = ?auto_504113 ?auto_504122 ) ) ( not ( = ?auto_504114 ?auto_504115 ) ) ( not ( = ?auto_504114 ?auto_504116 ) ) ( not ( = ?auto_504114 ?auto_504117 ) ) ( not ( = ?auto_504114 ?auto_504118 ) ) ( not ( = ?auto_504114 ?auto_504119 ) ) ( not ( = ?auto_504114 ?auto_504120 ) ) ( not ( = ?auto_504114 ?auto_504121 ) ) ( not ( = ?auto_504114 ?auto_504122 ) ) ( not ( = ?auto_504115 ?auto_504116 ) ) ( not ( = ?auto_504115 ?auto_504117 ) ) ( not ( = ?auto_504115 ?auto_504118 ) ) ( not ( = ?auto_504115 ?auto_504119 ) ) ( not ( = ?auto_504115 ?auto_504120 ) ) ( not ( = ?auto_504115 ?auto_504121 ) ) ( not ( = ?auto_504115 ?auto_504122 ) ) ( not ( = ?auto_504116 ?auto_504117 ) ) ( not ( = ?auto_504116 ?auto_504118 ) ) ( not ( = ?auto_504116 ?auto_504119 ) ) ( not ( = ?auto_504116 ?auto_504120 ) ) ( not ( = ?auto_504116 ?auto_504121 ) ) ( not ( = ?auto_504116 ?auto_504122 ) ) ( not ( = ?auto_504117 ?auto_504118 ) ) ( not ( = ?auto_504117 ?auto_504119 ) ) ( not ( = ?auto_504117 ?auto_504120 ) ) ( not ( = ?auto_504117 ?auto_504121 ) ) ( not ( = ?auto_504117 ?auto_504122 ) ) ( not ( = ?auto_504118 ?auto_504119 ) ) ( not ( = ?auto_504118 ?auto_504120 ) ) ( not ( = ?auto_504118 ?auto_504121 ) ) ( not ( = ?auto_504118 ?auto_504122 ) ) ( not ( = ?auto_504119 ?auto_504120 ) ) ( not ( = ?auto_504119 ?auto_504121 ) ) ( not ( = ?auto_504119 ?auto_504122 ) ) ( not ( = ?auto_504120 ?auto_504121 ) ) ( not ( = ?auto_504120 ?auto_504122 ) ) ( not ( = ?auto_504121 ?auto_504122 ) ) ( ON ?auto_504120 ?auto_504121 ) ( ON ?auto_504119 ?auto_504120 ) ( ON ?auto_504118 ?auto_504119 ) ( ON ?auto_504117 ?auto_504118 ) ( ON ?auto_504116 ?auto_504117 ) ( ON ?auto_504115 ?auto_504116 ) ( CLEAR ?auto_504113 ) ( ON ?auto_504114 ?auto_504115 ) ( CLEAR ?auto_504114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_504112 ?auto_504113 ?auto_504114 )
      ( MAKE-10PILE ?auto_504112 ?auto_504113 ?auto_504114 ?auto_504115 ?auto_504116 ?auto_504117 ?auto_504118 ?auto_504119 ?auto_504120 ?auto_504121 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_504154 - BLOCK
      ?auto_504155 - BLOCK
      ?auto_504156 - BLOCK
      ?auto_504157 - BLOCK
      ?auto_504158 - BLOCK
      ?auto_504159 - BLOCK
      ?auto_504160 - BLOCK
      ?auto_504161 - BLOCK
      ?auto_504162 - BLOCK
      ?auto_504163 - BLOCK
    )
    :vars
    (
      ?auto_504164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504163 ?auto_504164 ) ( ON-TABLE ?auto_504154 ) ( not ( = ?auto_504154 ?auto_504155 ) ) ( not ( = ?auto_504154 ?auto_504156 ) ) ( not ( = ?auto_504154 ?auto_504157 ) ) ( not ( = ?auto_504154 ?auto_504158 ) ) ( not ( = ?auto_504154 ?auto_504159 ) ) ( not ( = ?auto_504154 ?auto_504160 ) ) ( not ( = ?auto_504154 ?auto_504161 ) ) ( not ( = ?auto_504154 ?auto_504162 ) ) ( not ( = ?auto_504154 ?auto_504163 ) ) ( not ( = ?auto_504154 ?auto_504164 ) ) ( not ( = ?auto_504155 ?auto_504156 ) ) ( not ( = ?auto_504155 ?auto_504157 ) ) ( not ( = ?auto_504155 ?auto_504158 ) ) ( not ( = ?auto_504155 ?auto_504159 ) ) ( not ( = ?auto_504155 ?auto_504160 ) ) ( not ( = ?auto_504155 ?auto_504161 ) ) ( not ( = ?auto_504155 ?auto_504162 ) ) ( not ( = ?auto_504155 ?auto_504163 ) ) ( not ( = ?auto_504155 ?auto_504164 ) ) ( not ( = ?auto_504156 ?auto_504157 ) ) ( not ( = ?auto_504156 ?auto_504158 ) ) ( not ( = ?auto_504156 ?auto_504159 ) ) ( not ( = ?auto_504156 ?auto_504160 ) ) ( not ( = ?auto_504156 ?auto_504161 ) ) ( not ( = ?auto_504156 ?auto_504162 ) ) ( not ( = ?auto_504156 ?auto_504163 ) ) ( not ( = ?auto_504156 ?auto_504164 ) ) ( not ( = ?auto_504157 ?auto_504158 ) ) ( not ( = ?auto_504157 ?auto_504159 ) ) ( not ( = ?auto_504157 ?auto_504160 ) ) ( not ( = ?auto_504157 ?auto_504161 ) ) ( not ( = ?auto_504157 ?auto_504162 ) ) ( not ( = ?auto_504157 ?auto_504163 ) ) ( not ( = ?auto_504157 ?auto_504164 ) ) ( not ( = ?auto_504158 ?auto_504159 ) ) ( not ( = ?auto_504158 ?auto_504160 ) ) ( not ( = ?auto_504158 ?auto_504161 ) ) ( not ( = ?auto_504158 ?auto_504162 ) ) ( not ( = ?auto_504158 ?auto_504163 ) ) ( not ( = ?auto_504158 ?auto_504164 ) ) ( not ( = ?auto_504159 ?auto_504160 ) ) ( not ( = ?auto_504159 ?auto_504161 ) ) ( not ( = ?auto_504159 ?auto_504162 ) ) ( not ( = ?auto_504159 ?auto_504163 ) ) ( not ( = ?auto_504159 ?auto_504164 ) ) ( not ( = ?auto_504160 ?auto_504161 ) ) ( not ( = ?auto_504160 ?auto_504162 ) ) ( not ( = ?auto_504160 ?auto_504163 ) ) ( not ( = ?auto_504160 ?auto_504164 ) ) ( not ( = ?auto_504161 ?auto_504162 ) ) ( not ( = ?auto_504161 ?auto_504163 ) ) ( not ( = ?auto_504161 ?auto_504164 ) ) ( not ( = ?auto_504162 ?auto_504163 ) ) ( not ( = ?auto_504162 ?auto_504164 ) ) ( not ( = ?auto_504163 ?auto_504164 ) ) ( ON ?auto_504162 ?auto_504163 ) ( ON ?auto_504161 ?auto_504162 ) ( ON ?auto_504160 ?auto_504161 ) ( ON ?auto_504159 ?auto_504160 ) ( ON ?auto_504158 ?auto_504159 ) ( ON ?auto_504157 ?auto_504158 ) ( ON ?auto_504156 ?auto_504157 ) ( CLEAR ?auto_504154 ) ( ON ?auto_504155 ?auto_504156 ) ( CLEAR ?auto_504155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_504154 ?auto_504155 )
      ( MAKE-10PILE ?auto_504154 ?auto_504155 ?auto_504156 ?auto_504157 ?auto_504158 ?auto_504159 ?auto_504160 ?auto_504161 ?auto_504162 ?auto_504163 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_504196 - BLOCK
      ?auto_504197 - BLOCK
      ?auto_504198 - BLOCK
      ?auto_504199 - BLOCK
      ?auto_504200 - BLOCK
      ?auto_504201 - BLOCK
      ?auto_504202 - BLOCK
      ?auto_504203 - BLOCK
      ?auto_504204 - BLOCK
      ?auto_504205 - BLOCK
    )
    :vars
    (
      ?auto_504206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504205 ?auto_504206 ) ( not ( = ?auto_504196 ?auto_504197 ) ) ( not ( = ?auto_504196 ?auto_504198 ) ) ( not ( = ?auto_504196 ?auto_504199 ) ) ( not ( = ?auto_504196 ?auto_504200 ) ) ( not ( = ?auto_504196 ?auto_504201 ) ) ( not ( = ?auto_504196 ?auto_504202 ) ) ( not ( = ?auto_504196 ?auto_504203 ) ) ( not ( = ?auto_504196 ?auto_504204 ) ) ( not ( = ?auto_504196 ?auto_504205 ) ) ( not ( = ?auto_504196 ?auto_504206 ) ) ( not ( = ?auto_504197 ?auto_504198 ) ) ( not ( = ?auto_504197 ?auto_504199 ) ) ( not ( = ?auto_504197 ?auto_504200 ) ) ( not ( = ?auto_504197 ?auto_504201 ) ) ( not ( = ?auto_504197 ?auto_504202 ) ) ( not ( = ?auto_504197 ?auto_504203 ) ) ( not ( = ?auto_504197 ?auto_504204 ) ) ( not ( = ?auto_504197 ?auto_504205 ) ) ( not ( = ?auto_504197 ?auto_504206 ) ) ( not ( = ?auto_504198 ?auto_504199 ) ) ( not ( = ?auto_504198 ?auto_504200 ) ) ( not ( = ?auto_504198 ?auto_504201 ) ) ( not ( = ?auto_504198 ?auto_504202 ) ) ( not ( = ?auto_504198 ?auto_504203 ) ) ( not ( = ?auto_504198 ?auto_504204 ) ) ( not ( = ?auto_504198 ?auto_504205 ) ) ( not ( = ?auto_504198 ?auto_504206 ) ) ( not ( = ?auto_504199 ?auto_504200 ) ) ( not ( = ?auto_504199 ?auto_504201 ) ) ( not ( = ?auto_504199 ?auto_504202 ) ) ( not ( = ?auto_504199 ?auto_504203 ) ) ( not ( = ?auto_504199 ?auto_504204 ) ) ( not ( = ?auto_504199 ?auto_504205 ) ) ( not ( = ?auto_504199 ?auto_504206 ) ) ( not ( = ?auto_504200 ?auto_504201 ) ) ( not ( = ?auto_504200 ?auto_504202 ) ) ( not ( = ?auto_504200 ?auto_504203 ) ) ( not ( = ?auto_504200 ?auto_504204 ) ) ( not ( = ?auto_504200 ?auto_504205 ) ) ( not ( = ?auto_504200 ?auto_504206 ) ) ( not ( = ?auto_504201 ?auto_504202 ) ) ( not ( = ?auto_504201 ?auto_504203 ) ) ( not ( = ?auto_504201 ?auto_504204 ) ) ( not ( = ?auto_504201 ?auto_504205 ) ) ( not ( = ?auto_504201 ?auto_504206 ) ) ( not ( = ?auto_504202 ?auto_504203 ) ) ( not ( = ?auto_504202 ?auto_504204 ) ) ( not ( = ?auto_504202 ?auto_504205 ) ) ( not ( = ?auto_504202 ?auto_504206 ) ) ( not ( = ?auto_504203 ?auto_504204 ) ) ( not ( = ?auto_504203 ?auto_504205 ) ) ( not ( = ?auto_504203 ?auto_504206 ) ) ( not ( = ?auto_504204 ?auto_504205 ) ) ( not ( = ?auto_504204 ?auto_504206 ) ) ( not ( = ?auto_504205 ?auto_504206 ) ) ( ON ?auto_504204 ?auto_504205 ) ( ON ?auto_504203 ?auto_504204 ) ( ON ?auto_504202 ?auto_504203 ) ( ON ?auto_504201 ?auto_504202 ) ( ON ?auto_504200 ?auto_504201 ) ( ON ?auto_504199 ?auto_504200 ) ( ON ?auto_504198 ?auto_504199 ) ( ON ?auto_504197 ?auto_504198 ) ( ON ?auto_504196 ?auto_504197 ) ( CLEAR ?auto_504196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_504196 )
      ( MAKE-10PILE ?auto_504196 ?auto_504197 ?auto_504198 ?auto_504199 ?auto_504200 ?auto_504201 ?auto_504202 ?auto_504203 ?auto_504204 ?auto_504205 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504239 - BLOCK
      ?auto_504240 - BLOCK
      ?auto_504241 - BLOCK
      ?auto_504242 - BLOCK
      ?auto_504243 - BLOCK
      ?auto_504244 - BLOCK
      ?auto_504245 - BLOCK
      ?auto_504246 - BLOCK
      ?auto_504247 - BLOCK
      ?auto_504248 - BLOCK
      ?auto_504249 - BLOCK
    )
    :vars
    (
      ?auto_504250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_504248 ) ( ON ?auto_504249 ?auto_504250 ) ( CLEAR ?auto_504249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_504239 ) ( ON ?auto_504240 ?auto_504239 ) ( ON ?auto_504241 ?auto_504240 ) ( ON ?auto_504242 ?auto_504241 ) ( ON ?auto_504243 ?auto_504242 ) ( ON ?auto_504244 ?auto_504243 ) ( ON ?auto_504245 ?auto_504244 ) ( ON ?auto_504246 ?auto_504245 ) ( ON ?auto_504247 ?auto_504246 ) ( ON ?auto_504248 ?auto_504247 ) ( not ( = ?auto_504239 ?auto_504240 ) ) ( not ( = ?auto_504239 ?auto_504241 ) ) ( not ( = ?auto_504239 ?auto_504242 ) ) ( not ( = ?auto_504239 ?auto_504243 ) ) ( not ( = ?auto_504239 ?auto_504244 ) ) ( not ( = ?auto_504239 ?auto_504245 ) ) ( not ( = ?auto_504239 ?auto_504246 ) ) ( not ( = ?auto_504239 ?auto_504247 ) ) ( not ( = ?auto_504239 ?auto_504248 ) ) ( not ( = ?auto_504239 ?auto_504249 ) ) ( not ( = ?auto_504239 ?auto_504250 ) ) ( not ( = ?auto_504240 ?auto_504241 ) ) ( not ( = ?auto_504240 ?auto_504242 ) ) ( not ( = ?auto_504240 ?auto_504243 ) ) ( not ( = ?auto_504240 ?auto_504244 ) ) ( not ( = ?auto_504240 ?auto_504245 ) ) ( not ( = ?auto_504240 ?auto_504246 ) ) ( not ( = ?auto_504240 ?auto_504247 ) ) ( not ( = ?auto_504240 ?auto_504248 ) ) ( not ( = ?auto_504240 ?auto_504249 ) ) ( not ( = ?auto_504240 ?auto_504250 ) ) ( not ( = ?auto_504241 ?auto_504242 ) ) ( not ( = ?auto_504241 ?auto_504243 ) ) ( not ( = ?auto_504241 ?auto_504244 ) ) ( not ( = ?auto_504241 ?auto_504245 ) ) ( not ( = ?auto_504241 ?auto_504246 ) ) ( not ( = ?auto_504241 ?auto_504247 ) ) ( not ( = ?auto_504241 ?auto_504248 ) ) ( not ( = ?auto_504241 ?auto_504249 ) ) ( not ( = ?auto_504241 ?auto_504250 ) ) ( not ( = ?auto_504242 ?auto_504243 ) ) ( not ( = ?auto_504242 ?auto_504244 ) ) ( not ( = ?auto_504242 ?auto_504245 ) ) ( not ( = ?auto_504242 ?auto_504246 ) ) ( not ( = ?auto_504242 ?auto_504247 ) ) ( not ( = ?auto_504242 ?auto_504248 ) ) ( not ( = ?auto_504242 ?auto_504249 ) ) ( not ( = ?auto_504242 ?auto_504250 ) ) ( not ( = ?auto_504243 ?auto_504244 ) ) ( not ( = ?auto_504243 ?auto_504245 ) ) ( not ( = ?auto_504243 ?auto_504246 ) ) ( not ( = ?auto_504243 ?auto_504247 ) ) ( not ( = ?auto_504243 ?auto_504248 ) ) ( not ( = ?auto_504243 ?auto_504249 ) ) ( not ( = ?auto_504243 ?auto_504250 ) ) ( not ( = ?auto_504244 ?auto_504245 ) ) ( not ( = ?auto_504244 ?auto_504246 ) ) ( not ( = ?auto_504244 ?auto_504247 ) ) ( not ( = ?auto_504244 ?auto_504248 ) ) ( not ( = ?auto_504244 ?auto_504249 ) ) ( not ( = ?auto_504244 ?auto_504250 ) ) ( not ( = ?auto_504245 ?auto_504246 ) ) ( not ( = ?auto_504245 ?auto_504247 ) ) ( not ( = ?auto_504245 ?auto_504248 ) ) ( not ( = ?auto_504245 ?auto_504249 ) ) ( not ( = ?auto_504245 ?auto_504250 ) ) ( not ( = ?auto_504246 ?auto_504247 ) ) ( not ( = ?auto_504246 ?auto_504248 ) ) ( not ( = ?auto_504246 ?auto_504249 ) ) ( not ( = ?auto_504246 ?auto_504250 ) ) ( not ( = ?auto_504247 ?auto_504248 ) ) ( not ( = ?auto_504247 ?auto_504249 ) ) ( not ( = ?auto_504247 ?auto_504250 ) ) ( not ( = ?auto_504248 ?auto_504249 ) ) ( not ( = ?auto_504248 ?auto_504250 ) ) ( not ( = ?auto_504249 ?auto_504250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_504249 ?auto_504250 )
      ( !STACK ?auto_504249 ?auto_504248 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504285 - BLOCK
      ?auto_504286 - BLOCK
      ?auto_504287 - BLOCK
      ?auto_504288 - BLOCK
      ?auto_504289 - BLOCK
      ?auto_504290 - BLOCK
      ?auto_504291 - BLOCK
      ?auto_504292 - BLOCK
      ?auto_504293 - BLOCK
      ?auto_504294 - BLOCK
      ?auto_504295 - BLOCK
    )
    :vars
    (
      ?auto_504296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504295 ?auto_504296 ) ( ON-TABLE ?auto_504285 ) ( ON ?auto_504286 ?auto_504285 ) ( ON ?auto_504287 ?auto_504286 ) ( ON ?auto_504288 ?auto_504287 ) ( ON ?auto_504289 ?auto_504288 ) ( ON ?auto_504290 ?auto_504289 ) ( ON ?auto_504291 ?auto_504290 ) ( ON ?auto_504292 ?auto_504291 ) ( ON ?auto_504293 ?auto_504292 ) ( not ( = ?auto_504285 ?auto_504286 ) ) ( not ( = ?auto_504285 ?auto_504287 ) ) ( not ( = ?auto_504285 ?auto_504288 ) ) ( not ( = ?auto_504285 ?auto_504289 ) ) ( not ( = ?auto_504285 ?auto_504290 ) ) ( not ( = ?auto_504285 ?auto_504291 ) ) ( not ( = ?auto_504285 ?auto_504292 ) ) ( not ( = ?auto_504285 ?auto_504293 ) ) ( not ( = ?auto_504285 ?auto_504294 ) ) ( not ( = ?auto_504285 ?auto_504295 ) ) ( not ( = ?auto_504285 ?auto_504296 ) ) ( not ( = ?auto_504286 ?auto_504287 ) ) ( not ( = ?auto_504286 ?auto_504288 ) ) ( not ( = ?auto_504286 ?auto_504289 ) ) ( not ( = ?auto_504286 ?auto_504290 ) ) ( not ( = ?auto_504286 ?auto_504291 ) ) ( not ( = ?auto_504286 ?auto_504292 ) ) ( not ( = ?auto_504286 ?auto_504293 ) ) ( not ( = ?auto_504286 ?auto_504294 ) ) ( not ( = ?auto_504286 ?auto_504295 ) ) ( not ( = ?auto_504286 ?auto_504296 ) ) ( not ( = ?auto_504287 ?auto_504288 ) ) ( not ( = ?auto_504287 ?auto_504289 ) ) ( not ( = ?auto_504287 ?auto_504290 ) ) ( not ( = ?auto_504287 ?auto_504291 ) ) ( not ( = ?auto_504287 ?auto_504292 ) ) ( not ( = ?auto_504287 ?auto_504293 ) ) ( not ( = ?auto_504287 ?auto_504294 ) ) ( not ( = ?auto_504287 ?auto_504295 ) ) ( not ( = ?auto_504287 ?auto_504296 ) ) ( not ( = ?auto_504288 ?auto_504289 ) ) ( not ( = ?auto_504288 ?auto_504290 ) ) ( not ( = ?auto_504288 ?auto_504291 ) ) ( not ( = ?auto_504288 ?auto_504292 ) ) ( not ( = ?auto_504288 ?auto_504293 ) ) ( not ( = ?auto_504288 ?auto_504294 ) ) ( not ( = ?auto_504288 ?auto_504295 ) ) ( not ( = ?auto_504288 ?auto_504296 ) ) ( not ( = ?auto_504289 ?auto_504290 ) ) ( not ( = ?auto_504289 ?auto_504291 ) ) ( not ( = ?auto_504289 ?auto_504292 ) ) ( not ( = ?auto_504289 ?auto_504293 ) ) ( not ( = ?auto_504289 ?auto_504294 ) ) ( not ( = ?auto_504289 ?auto_504295 ) ) ( not ( = ?auto_504289 ?auto_504296 ) ) ( not ( = ?auto_504290 ?auto_504291 ) ) ( not ( = ?auto_504290 ?auto_504292 ) ) ( not ( = ?auto_504290 ?auto_504293 ) ) ( not ( = ?auto_504290 ?auto_504294 ) ) ( not ( = ?auto_504290 ?auto_504295 ) ) ( not ( = ?auto_504290 ?auto_504296 ) ) ( not ( = ?auto_504291 ?auto_504292 ) ) ( not ( = ?auto_504291 ?auto_504293 ) ) ( not ( = ?auto_504291 ?auto_504294 ) ) ( not ( = ?auto_504291 ?auto_504295 ) ) ( not ( = ?auto_504291 ?auto_504296 ) ) ( not ( = ?auto_504292 ?auto_504293 ) ) ( not ( = ?auto_504292 ?auto_504294 ) ) ( not ( = ?auto_504292 ?auto_504295 ) ) ( not ( = ?auto_504292 ?auto_504296 ) ) ( not ( = ?auto_504293 ?auto_504294 ) ) ( not ( = ?auto_504293 ?auto_504295 ) ) ( not ( = ?auto_504293 ?auto_504296 ) ) ( not ( = ?auto_504294 ?auto_504295 ) ) ( not ( = ?auto_504294 ?auto_504296 ) ) ( not ( = ?auto_504295 ?auto_504296 ) ) ( CLEAR ?auto_504293 ) ( ON ?auto_504294 ?auto_504295 ) ( CLEAR ?auto_504294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_504285 ?auto_504286 ?auto_504287 ?auto_504288 ?auto_504289 ?auto_504290 ?auto_504291 ?auto_504292 ?auto_504293 ?auto_504294 )
      ( MAKE-11PILE ?auto_504285 ?auto_504286 ?auto_504287 ?auto_504288 ?auto_504289 ?auto_504290 ?auto_504291 ?auto_504292 ?auto_504293 ?auto_504294 ?auto_504295 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504331 - BLOCK
      ?auto_504332 - BLOCK
      ?auto_504333 - BLOCK
      ?auto_504334 - BLOCK
      ?auto_504335 - BLOCK
      ?auto_504336 - BLOCK
      ?auto_504337 - BLOCK
      ?auto_504338 - BLOCK
      ?auto_504339 - BLOCK
      ?auto_504340 - BLOCK
      ?auto_504341 - BLOCK
    )
    :vars
    (
      ?auto_504342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504341 ?auto_504342 ) ( ON-TABLE ?auto_504331 ) ( ON ?auto_504332 ?auto_504331 ) ( ON ?auto_504333 ?auto_504332 ) ( ON ?auto_504334 ?auto_504333 ) ( ON ?auto_504335 ?auto_504334 ) ( ON ?auto_504336 ?auto_504335 ) ( ON ?auto_504337 ?auto_504336 ) ( ON ?auto_504338 ?auto_504337 ) ( not ( = ?auto_504331 ?auto_504332 ) ) ( not ( = ?auto_504331 ?auto_504333 ) ) ( not ( = ?auto_504331 ?auto_504334 ) ) ( not ( = ?auto_504331 ?auto_504335 ) ) ( not ( = ?auto_504331 ?auto_504336 ) ) ( not ( = ?auto_504331 ?auto_504337 ) ) ( not ( = ?auto_504331 ?auto_504338 ) ) ( not ( = ?auto_504331 ?auto_504339 ) ) ( not ( = ?auto_504331 ?auto_504340 ) ) ( not ( = ?auto_504331 ?auto_504341 ) ) ( not ( = ?auto_504331 ?auto_504342 ) ) ( not ( = ?auto_504332 ?auto_504333 ) ) ( not ( = ?auto_504332 ?auto_504334 ) ) ( not ( = ?auto_504332 ?auto_504335 ) ) ( not ( = ?auto_504332 ?auto_504336 ) ) ( not ( = ?auto_504332 ?auto_504337 ) ) ( not ( = ?auto_504332 ?auto_504338 ) ) ( not ( = ?auto_504332 ?auto_504339 ) ) ( not ( = ?auto_504332 ?auto_504340 ) ) ( not ( = ?auto_504332 ?auto_504341 ) ) ( not ( = ?auto_504332 ?auto_504342 ) ) ( not ( = ?auto_504333 ?auto_504334 ) ) ( not ( = ?auto_504333 ?auto_504335 ) ) ( not ( = ?auto_504333 ?auto_504336 ) ) ( not ( = ?auto_504333 ?auto_504337 ) ) ( not ( = ?auto_504333 ?auto_504338 ) ) ( not ( = ?auto_504333 ?auto_504339 ) ) ( not ( = ?auto_504333 ?auto_504340 ) ) ( not ( = ?auto_504333 ?auto_504341 ) ) ( not ( = ?auto_504333 ?auto_504342 ) ) ( not ( = ?auto_504334 ?auto_504335 ) ) ( not ( = ?auto_504334 ?auto_504336 ) ) ( not ( = ?auto_504334 ?auto_504337 ) ) ( not ( = ?auto_504334 ?auto_504338 ) ) ( not ( = ?auto_504334 ?auto_504339 ) ) ( not ( = ?auto_504334 ?auto_504340 ) ) ( not ( = ?auto_504334 ?auto_504341 ) ) ( not ( = ?auto_504334 ?auto_504342 ) ) ( not ( = ?auto_504335 ?auto_504336 ) ) ( not ( = ?auto_504335 ?auto_504337 ) ) ( not ( = ?auto_504335 ?auto_504338 ) ) ( not ( = ?auto_504335 ?auto_504339 ) ) ( not ( = ?auto_504335 ?auto_504340 ) ) ( not ( = ?auto_504335 ?auto_504341 ) ) ( not ( = ?auto_504335 ?auto_504342 ) ) ( not ( = ?auto_504336 ?auto_504337 ) ) ( not ( = ?auto_504336 ?auto_504338 ) ) ( not ( = ?auto_504336 ?auto_504339 ) ) ( not ( = ?auto_504336 ?auto_504340 ) ) ( not ( = ?auto_504336 ?auto_504341 ) ) ( not ( = ?auto_504336 ?auto_504342 ) ) ( not ( = ?auto_504337 ?auto_504338 ) ) ( not ( = ?auto_504337 ?auto_504339 ) ) ( not ( = ?auto_504337 ?auto_504340 ) ) ( not ( = ?auto_504337 ?auto_504341 ) ) ( not ( = ?auto_504337 ?auto_504342 ) ) ( not ( = ?auto_504338 ?auto_504339 ) ) ( not ( = ?auto_504338 ?auto_504340 ) ) ( not ( = ?auto_504338 ?auto_504341 ) ) ( not ( = ?auto_504338 ?auto_504342 ) ) ( not ( = ?auto_504339 ?auto_504340 ) ) ( not ( = ?auto_504339 ?auto_504341 ) ) ( not ( = ?auto_504339 ?auto_504342 ) ) ( not ( = ?auto_504340 ?auto_504341 ) ) ( not ( = ?auto_504340 ?auto_504342 ) ) ( not ( = ?auto_504341 ?auto_504342 ) ) ( ON ?auto_504340 ?auto_504341 ) ( CLEAR ?auto_504338 ) ( ON ?auto_504339 ?auto_504340 ) ( CLEAR ?auto_504339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_504331 ?auto_504332 ?auto_504333 ?auto_504334 ?auto_504335 ?auto_504336 ?auto_504337 ?auto_504338 ?auto_504339 )
      ( MAKE-11PILE ?auto_504331 ?auto_504332 ?auto_504333 ?auto_504334 ?auto_504335 ?auto_504336 ?auto_504337 ?auto_504338 ?auto_504339 ?auto_504340 ?auto_504341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504377 - BLOCK
      ?auto_504378 - BLOCK
      ?auto_504379 - BLOCK
      ?auto_504380 - BLOCK
      ?auto_504381 - BLOCK
      ?auto_504382 - BLOCK
      ?auto_504383 - BLOCK
      ?auto_504384 - BLOCK
      ?auto_504385 - BLOCK
      ?auto_504386 - BLOCK
      ?auto_504387 - BLOCK
    )
    :vars
    (
      ?auto_504388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504387 ?auto_504388 ) ( ON-TABLE ?auto_504377 ) ( ON ?auto_504378 ?auto_504377 ) ( ON ?auto_504379 ?auto_504378 ) ( ON ?auto_504380 ?auto_504379 ) ( ON ?auto_504381 ?auto_504380 ) ( ON ?auto_504382 ?auto_504381 ) ( ON ?auto_504383 ?auto_504382 ) ( not ( = ?auto_504377 ?auto_504378 ) ) ( not ( = ?auto_504377 ?auto_504379 ) ) ( not ( = ?auto_504377 ?auto_504380 ) ) ( not ( = ?auto_504377 ?auto_504381 ) ) ( not ( = ?auto_504377 ?auto_504382 ) ) ( not ( = ?auto_504377 ?auto_504383 ) ) ( not ( = ?auto_504377 ?auto_504384 ) ) ( not ( = ?auto_504377 ?auto_504385 ) ) ( not ( = ?auto_504377 ?auto_504386 ) ) ( not ( = ?auto_504377 ?auto_504387 ) ) ( not ( = ?auto_504377 ?auto_504388 ) ) ( not ( = ?auto_504378 ?auto_504379 ) ) ( not ( = ?auto_504378 ?auto_504380 ) ) ( not ( = ?auto_504378 ?auto_504381 ) ) ( not ( = ?auto_504378 ?auto_504382 ) ) ( not ( = ?auto_504378 ?auto_504383 ) ) ( not ( = ?auto_504378 ?auto_504384 ) ) ( not ( = ?auto_504378 ?auto_504385 ) ) ( not ( = ?auto_504378 ?auto_504386 ) ) ( not ( = ?auto_504378 ?auto_504387 ) ) ( not ( = ?auto_504378 ?auto_504388 ) ) ( not ( = ?auto_504379 ?auto_504380 ) ) ( not ( = ?auto_504379 ?auto_504381 ) ) ( not ( = ?auto_504379 ?auto_504382 ) ) ( not ( = ?auto_504379 ?auto_504383 ) ) ( not ( = ?auto_504379 ?auto_504384 ) ) ( not ( = ?auto_504379 ?auto_504385 ) ) ( not ( = ?auto_504379 ?auto_504386 ) ) ( not ( = ?auto_504379 ?auto_504387 ) ) ( not ( = ?auto_504379 ?auto_504388 ) ) ( not ( = ?auto_504380 ?auto_504381 ) ) ( not ( = ?auto_504380 ?auto_504382 ) ) ( not ( = ?auto_504380 ?auto_504383 ) ) ( not ( = ?auto_504380 ?auto_504384 ) ) ( not ( = ?auto_504380 ?auto_504385 ) ) ( not ( = ?auto_504380 ?auto_504386 ) ) ( not ( = ?auto_504380 ?auto_504387 ) ) ( not ( = ?auto_504380 ?auto_504388 ) ) ( not ( = ?auto_504381 ?auto_504382 ) ) ( not ( = ?auto_504381 ?auto_504383 ) ) ( not ( = ?auto_504381 ?auto_504384 ) ) ( not ( = ?auto_504381 ?auto_504385 ) ) ( not ( = ?auto_504381 ?auto_504386 ) ) ( not ( = ?auto_504381 ?auto_504387 ) ) ( not ( = ?auto_504381 ?auto_504388 ) ) ( not ( = ?auto_504382 ?auto_504383 ) ) ( not ( = ?auto_504382 ?auto_504384 ) ) ( not ( = ?auto_504382 ?auto_504385 ) ) ( not ( = ?auto_504382 ?auto_504386 ) ) ( not ( = ?auto_504382 ?auto_504387 ) ) ( not ( = ?auto_504382 ?auto_504388 ) ) ( not ( = ?auto_504383 ?auto_504384 ) ) ( not ( = ?auto_504383 ?auto_504385 ) ) ( not ( = ?auto_504383 ?auto_504386 ) ) ( not ( = ?auto_504383 ?auto_504387 ) ) ( not ( = ?auto_504383 ?auto_504388 ) ) ( not ( = ?auto_504384 ?auto_504385 ) ) ( not ( = ?auto_504384 ?auto_504386 ) ) ( not ( = ?auto_504384 ?auto_504387 ) ) ( not ( = ?auto_504384 ?auto_504388 ) ) ( not ( = ?auto_504385 ?auto_504386 ) ) ( not ( = ?auto_504385 ?auto_504387 ) ) ( not ( = ?auto_504385 ?auto_504388 ) ) ( not ( = ?auto_504386 ?auto_504387 ) ) ( not ( = ?auto_504386 ?auto_504388 ) ) ( not ( = ?auto_504387 ?auto_504388 ) ) ( ON ?auto_504386 ?auto_504387 ) ( ON ?auto_504385 ?auto_504386 ) ( CLEAR ?auto_504383 ) ( ON ?auto_504384 ?auto_504385 ) ( CLEAR ?auto_504384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_504377 ?auto_504378 ?auto_504379 ?auto_504380 ?auto_504381 ?auto_504382 ?auto_504383 ?auto_504384 )
      ( MAKE-11PILE ?auto_504377 ?auto_504378 ?auto_504379 ?auto_504380 ?auto_504381 ?auto_504382 ?auto_504383 ?auto_504384 ?auto_504385 ?auto_504386 ?auto_504387 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504423 - BLOCK
      ?auto_504424 - BLOCK
      ?auto_504425 - BLOCK
      ?auto_504426 - BLOCK
      ?auto_504427 - BLOCK
      ?auto_504428 - BLOCK
      ?auto_504429 - BLOCK
      ?auto_504430 - BLOCK
      ?auto_504431 - BLOCK
      ?auto_504432 - BLOCK
      ?auto_504433 - BLOCK
    )
    :vars
    (
      ?auto_504434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504433 ?auto_504434 ) ( ON-TABLE ?auto_504423 ) ( ON ?auto_504424 ?auto_504423 ) ( ON ?auto_504425 ?auto_504424 ) ( ON ?auto_504426 ?auto_504425 ) ( ON ?auto_504427 ?auto_504426 ) ( ON ?auto_504428 ?auto_504427 ) ( not ( = ?auto_504423 ?auto_504424 ) ) ( not ( = ?auto_504423 ?auto_504425 ) ) ( not ( = ?auto_504423 ?auto_504426 ) ) ( not ( = ?auto_504423 ?auto_504427 ) ) ( not ( = ?auto_504423 ?auto_504428 ) ) ( not ( = ?auto_504423 ?auto_504429 ) ) ( not ( = ?auto_504423 ?auto_504430 ) ) ( not ( = ?auto_504423 ?auto_504431 ) ) ( not ( = ?auto_504423 ?auto_504432 ) ) ( not ( = ?auto_504423 ?auto_504433 ) ) ( not ( = ?auto_504423 ?auto_504434 ) ) ( not ( = ?auto_504424 ?auto_504425 ) ) ( not ( = ?auto_504424 ?auto_504426 ) ) ( not ( = ?auto_504424 ?auto_504427 ) ) ( not ( = ?auto_504424 ?auto_504428 ) ) ( not ( = ?auto_504424 ?auto_504429 ) ) ( not ( = ?auto_504424 ?auto_504430 ) ) ( not ( = ?auto_504424 ?auto_504431 ) ) ( not ( = ?auto_504424 ?auto_504432 ) ) ( not ( = ?auto_504424 ?auto_504433 ) ) ( not ( = ?auto_504424 ?auto_504434 ) ) ( not ( = ?auto_504425 ?auto_504426 ) ) ( not ( = ?auto_504425 ?auto_504427 ) ) ( not ( = ?auto_504425 ?auto_504428 ) ) ( not ( = ?auto_504425 ?auto_504429 ) ) ( not ( = ?auto_504425 ?auto_504430 ) ) ( not ( = ?auto_504425 ?auto_504431 ) ) ( not ( = ?auto_504425 ?auto_504432 ) ) ( not ( = ?auto_504425 ?auto_504433 ) ) ( not ( = ?auto_504425 ?auto_504434 ) ) ( not ( = ?auto_504426 ?auto_504427 ) ) ( not ( = ?auto_504426 ?auto_504428 ) ) ( not ( = ?auto_504426 ?auto_504429 ) ) ( not ( = ?auto_504426 ?auto_504430 ) ) ( not ( = ?auto_504426 ?auto_504431 ) ) ( not ( = ?auto_504426 ?auto_504432 ) ) ( not ( = ?auto_504426 ?auto_504433 ) ) ( not ( = ?auto_504426 ?auto_504434 ) ) ( not ( = ?auto_504427 ?auto_504428 ) ) ( not ( = ?auto_504427 ?auto_504429 ) ) ( not ( = ?auto_504427 ?auto_504430 ) ) ( not ( = ?auto_504427 ?auto_504431 ) ) ( not ( = ?auto_504427 ?auto_504432 ) ) ( not ( = ?auto_504427 ?auto_504433 ) ) ( not ( = ?auto_504427 ?auto_504434 ) ) ( not ( = ?auto_504428 ?auto_504429 ) ) ( not ( = ?auto_504428 ?auto_504430 ) ) ( not ( = ?auto_504428 ?auto_504431 ) ) ( not ( = ?auto_504428 ?auto_504432 ) ) ( not ( = ?auto_504428 ?auto_504433 ) ) ( not ( = ?auto_504428 ?auto_504434 ) ) ( not ( = ?auto_504429 ?auto_504430 ) ) ( not ( = ?auto_504429 ?auto_504431 ) ) ( not ( = ?auto_504429 ?auto_504432 ) ) ( not ( = ?auto_504429 ?auto_504433 ) ) ( not ( = ?auto_504429 ?auto_504434 ) ) ( not ( = ?auto_504430 ?auto_504431 ) ) ( not ( = ?auto_504430 ?auto_504432 ) ) ( not ( = ?auto_504430 ?auto_504433 ) ) ( not ( = ?auto_504430 ?auto_504434 ) ) ( not ( = ?auto_504431 ?auto_504432 ) ) ( not ( = ?auto_504431 ?auto_504433 ) ) ( not ( = ?auto_504431 ?auto_504434 ) ) ( not ( = ?auto_504432 ?auto_504433 ) ) ( not ( = ?auto_504432 ?auto_504434 ) ) ( not ( = ?auto_504433 ?auto_504434 ) ) ( ON ?auto_504432 ?auto_504433 ) ( ON ?auto_504431 ?auto_504432 ) ( ON ?auto_504430 ?auto_504431 ) ( CLEAR ?auto_504428 ) ( ON ?auto_504429 ?auto_504430 ) ( CLEAR ?auto_504429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_504423 ?auto_504424 ?auto_504425 ?auto_504426 ?auto_504427 ?auto_504428 ?auto_504429 )
      ( MAKE-11PILE ?auto_504423 ?auto_504424 ?auto_504425 ?auto_504426 ?auto_504427 ?auto_504428 ?auto_504429 ?auto_504430 ?auto_504431 ?auto_504432 ?auto_504433 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504469 - BLOCK
      ?auto_504470 - BLOCK
      ?auto_504471 - BLOCK
      ?auto_504472 - BLOCK
      ?auto_504473 - BLOCK
      ?auto_504474 - BLOCK
      ?auto_504475 - BLOCK
      ?auto_504476 - BLOCK
      ?auto_504477 - BLOCK
      ?auto_504478 - BLOCK
      ?auto_504479 - BLOCK
    )
    :vars
    (
      ?auto_504480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504479 ?auto_504480 ) ( ON-TABLE ?auto_504469 ) ( ON ?auto_504470 ?auto_504469 ) ( ON ?auto_504471 ?auto_504470 ) ( ON ?auto_504472 ?auto_504471 ) ( ON ?auto_504473 ?auto_504472 ) ( not ( = ?auto_504469 ?auto_504470 ) ) ( not ( = ?auto_504469 ?auto_504471 ) ) ( not ( = ?auto_504469 ?auto_504472 ) ) ( not ( = ?auto_504469 ?auto_504473 ) ) ( not ( = ?auto_504469 ?auto_504474 ) ) ( not ( = ?auto_504469 ?auto_504475 ) ) ( not ( = ?auto_504469 ?auto_504476 ) ) ( not ( = ?auto_504469 ?auto_504477 ) ) ( not ( = ?auto_504469 ?auto_504478 ) ) ( not ( = ?auto_504469 ?auto_504479 ) ) ( not ( = ?auto_504469 ?auto_504480 ) ) ( not ( = ?auto_504470 ?auto_504471 ) ) ( not ( = ?auto_504470 ?auto_504472 ) ) ( not ( = ?auto_504470 ?auto_504473 ) ) ( not ( = ?auto_504470 ?auto_504474 ) ) ( not ( = ?auto_504470 ?auto_504475 ) ) ( not ( = ?auto_504470 ?auto_504476 ) ) ( not ( = ?auto_504470 ?auto_504477 ) ) ( not ( = ?auto_504470 ?auto_504478 ) ) ( not ( = ?auto_504470 ?auto_504479 ) ) ( not ( = ?auto_504470 ?auto_504480 ) ) ( not ( = ?auto_504471 ?auto_504472 ) ) ( not ( = ?auto_504471 ?auto_504473 ) ) ( not ( = ?auto_504471 ?auto_504474 ) ) ( not ( = ?auto_504471 ?auto_504475 ) ) ( not ( = ?auto_504471 ?auto_504476 ) ) ( not ( = ?auto_504471 ?auto_504477 ) ) ( not ( = ?auto_504471 ?auto_504478 ) ) ( not ( = ?auto_504471 ?auto_504479 ) ) ( not ( = ?auto_504471 ?auto_504480 ) ) ( not ( = ?auto_504472 ?auto_504473 ) ) ( not ( = ?auto_504472 ?auto_504474 ) ) ( not ( = ?auto_504472 ?auto_504475 ) ) ( not ( = ?auto_504472 ?auto_504476 ) ) ( not ( = ?auto_504472 ?auto_504477 ) ) ( not ( = ?auto_504472 ?auto_504478 ) ) ( not ( = ?auto_504472 ?auto_504479 ) ) ( not ( = ?auto_504472 ?auto_504480 ) ) ( not ( = ?auto_504473 ?auto_504474 ) ) ( not ( = ?auto_504473 ?auto_504475 ) ) ( not ( = ?auto_504473 ?auto_504476 ) ) ( not ( = ?auto_504473 ?auto_504477 ) ) ( not ( = ?auto_504473 ?auto_504478 ) ) ( not ( = ?auto_504473 ?auto_504479 ) ) ( not ( = ?auto_504473 ?auto_504480 ) ) ( not ( = ?auto_504474 ?auto_504475 ) ) ( not ( = ?auto_504474 ?auto_504476 ) ) ( not ( = ?auto_504474 ?auto_504477 ) ) ( not ( = ?auto_504474 ?auto_504478 ) ) ( not ( = ?auto_504474 ?auto_504479 ) ) ( not ( = ?auto_504474 ?auto_504480 ) ) ( not ( = ?auto_504475 ?auto_504476 ) ) ( not ( = ?auto_504475 ?auto_504477 ) ) ( not ( = ?auto_504475 ?auto_504478 ) ) ( not ( = ?auto_504475 ?auto_504479 ) ) ( not ( = ?auto_504475 ?auto_504480 ) ) ( not ( = ?auto_504476 ?auto_504477 ) ) ( not ( = ?auto_504476 ?auto_504478 ) ) ( not ( = ?auto_504476 ?auto_504479 ) ) ( not ( = ?auto_504476 ?auto_504480 ) ) ( not ( = ?auto_504477 ?auto_504478 ) ) ( not ( = ?auto_504477 ?auto_504479 ) ) ( not ( = ?auto_504477 ?auto_504480 ) ) ( not ( = ?auto_504478 ?auto_504479 ) ) ( not ( = ?auto_504478 ?auto_504480 ) ) ( not ( = ?auto_504479 ?auto_504480 ) ) ( ON ?auto_504478 ?auto_504479 ) ( ON ?auto_504477 ?auto_504478 ) ( ON ?auto_504476 ?auto_504477 ) ( ON ?auto_504475 ?auto_504476 ) ( CLEAR ?auto_504473 ) ( ON ?auto_504474 ?auto_504475 ) ( CLEAR ?auto_504474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_504469 ?auto_504470 ?auto_504471 ?auto_504472 ?auto_504473 ?auto_504474 )
      ( MAKE-11PILE ?auto_504469 ?auto_504470 ?auto_504471 ?auto_504472 ?auto_504473 ?auto_504474 ?auto_504475 ?auto_504476 ?auto_504477 ?auto_504478 ?auto_504479 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504515 - BLOCK
      ?auto_504516 - BLOCK
      ?auto_504517 - BLOCK
      ?auto_504518 - BLOCK
      ?auto_504519 - BLOCK
      ?auto_504520 - BLOCK
      ?auto_504521 - BLOCK
      ?auto_504522 - BLOCK
      ?auto_504523 - BLOCK
      ?auto_504524 - BLOCK
      ?auto_504525 - BLOCK
    )
    :vars
    (
      ?auto_504526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504525 ?auto_504526 ) ( ON-TABLE ?auto_504515 ) ( ON ?auto_504516 ?auto_504515 ) ( ON ?auto_504517 ?auto_504516 ) ( ON ?auto_504518 ?auto_504517 ) ( not ( = ?auto_504515 ?auto_504516 ) ) ( not ( = ?auto_504515 ?auto_504517 ) ) ( not ( = ?auto_504515 ?auto_504518 ) ) ( not ( = ?auto_504515 ?auto_504519 ) ) ( not ( = ?auto_504515 ?auto_504520 ) ) ( not ( = ?auto_504515 ?auto_504521 ) ) ( not ( = ?auto_504515 ?auto_504522 ) ) ( not ( = ?auto_504515 ?auto_504523 ) ) ( not ( = ?auto_504515 ?auto_504524 ) ) ( not ( = ?auto_504515 ?auto_504525 ) ) ( not ( = ?auto_504515 ?auto_504526 ) ) ( not ( = ?auto_504516 ?auto_504517 ) ) ( not ( = ?auto_504516 ?auto_504518 ) ) ( not ( = ?auto_504516 ?auto_504519 ) ) ( not ( = ?auto_504516 ?auto_504520 ) ) ( not ( = ?auto_504516 ?auto_504521 ) ) ( not ( = ?auto_504516 ?auto_504522 ) ) ( not ( = ?auto_504516 ?auto_504523 ) ) ( not ( = ?auto_504516 ?auto_504524 ) ) ( not ( = ?auto_504516 ?auto_504525 ) ) ( not ( = ?auto_504516 ?auto_504526 ) ) ( not ( = ?auto_504517 ?auto_504518 ) ) ( not ( = ?auto_504517 ?auto_504519 ) ) ( not ( = ?auto_504517 ?auto_504520 ) ) ( not ( = ?auto_504517 ?auto_504521 ) ) ( not ( = ?auto_504517 ?auto_504522 ) ) ( not ( = ?auto_504517 ?auto_504523 ) ) ( not ( = ?auto_504517 ?auto_504524 ) ) ( not ( = ?auto_504517 ?auto_504525 ) ) ( not ( = ?auto_504517 ?auto_504526 ) ) ( not ( = ?auto_504518 ?auto_504519 ) ) ( not ( = ?auto_504518 ?auto_504520 ) ) ( not ( = ?auto_504518 ?auto_504521 ) ) ( not ( = ?auto_504518 ?auto_504522 ) ) ( not ( = ?auto_504518 ?auto_504523 ) ) ( not ( = ?auto_504518 ?auto_504524 ) ) ( not ( = ?auto_504518 ?auto_504525 ) ) ( not ( = ?auto_504518 ?auto_504526 ) ) ( not ( = ?auto_504519 ?auto_504520 ) ) ( not ( = ?auto_504519 ?auto_504521 ) ) ( not ( = ?auto_504519 ?auto_504522 ) ) ( not ( = ?auto_504519 ?auto_504523 ) ) ( not ( = ?auto_504519 ?auto_504524 ) ) ( not ( = ?auto_504519 ?auto_504525 ) ) ( not ( = ?auto_504519 ?auto_504526 ) ) ( not ( = ?auto_504520 ?auto_504521 ) ) ( not ( = ?auto_504520 ?auto_504522 ) ) ( not ( = ?auto_504520 ?auto_504523 ) ) ( not ( = ?auto_504520 ?auto_504524 ) ) ( not ( = ?auto_504520 ?auto_504525 ) ) ( not ( = ?auto_504520 ?auto_504526 ) ) ( not ( = ?auto_504521 ?auto_504522 ) ) ( not ( = ?auto_504521 ?auto_504523 ) ) ( not ( = ?auto_504521 ?auto_504524 ) ) ( not ( = ?auto_504521 ?auto_504525 ) ) ( not ( = ?auto_504521 ?auto_504526 ) ) ( not ( = ?auto_504522 ?auto_504523 ) ) ( not ( = ?auto_504522 ?auto_504524 ) ) ( not ( = ?auto_504522 ?auto_504525 ) ) ( not ( = ?auto_504522 ?auto_504526 ) ) ( not ( = ?auto_504523 ?auto_504524 ) ) ( not ( = ?auto_504523 ?auto_504525 ) ) ( not ( = ?auto_504523 ?auto_504526 ) ) ( not ( = ?auto_504524 ?auto_504525 ) ) ( not ( = ?auto_504524 ?auto_504526 ) ) ( not ( = ?auto_504525 ?auto_504526 ) ) ( ON ?auto_504524 ?auto_504525 ) ( ON ?auto_504523 ?auto_504524 ) ( ON ?auto_504522 ?auto_504523 ) ( ON ?auto_504521 ?auto_504522 ) ( ON ?auto_504520 ?auto_504521 ) ( CLEAR ?auto_504518 ) ( ON ?auto_504519 ?auto_504520 ) ( CLEAR ?auto_504519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_504515 ?auto_504516 ?auto_504517 ?auto_504518 ?auto_504519 )
      ( MAKE-11PILE ?auto_504515 ?auto_504516 ?auto_504517 ?auto_504518 ?auto_504519 ?auto_504520 ?auto_504521 ?auto_504522 ?auto_504523 ?auto_504524 ?auto_504525 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504561 - BLOCK
      ?auto_504562 - BLOCK
      ?auto_504563 - BLOCK
      ?auto_504564 - BLOCK
      ?auto_504565 - BLOCK
      ?auto_504566 - BLOCK
      ?auto_504567 - BLOCK
      ?auto_504568 - BLOCK
      ?auto_504569 - BLOCK
      ?auto_504570 - BLOCK
      ?auto_504571 - BLOCK
    )
    :vars
    (
      ?auto_504572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504571 ?auto_504572 ) ( ON-TABLE ?auto_504561 ) ( ON ?auto_504562 ?auto_504561 ) ( ON ?auto_504563 ?auto_504562 ) ( not ( = ?auto_504561 ?auto_504562 ) ) ( not ( = ?auto_504561 ?auto_504563 ) ) ( not ( = ?auto_504561 ?auto_504564 ) ) ( not ( = ?auto_504561 ?auto_504565 ) ) ( not ( = ?auto_504561 ?auto_504566 ) ) ( not ( = ?auto_504561 ?auto_504567 ) ) ( not ( = ?auto_504561 ?auto_504568 ) ) ( not ( = ?auto_504561 ?auto_504569 ) ) ( not ( = ?auto_504561 ?auto_504570 ) ) ( not ( = ?auto_504561 ?auto_504571 ) ) ( not ( = ?auto_504561 ?auto_504572 ) ) ( not ( = ?auto_504562 ?auto_504563 ) ) ( not ( = ?auto_504562 ?auto_504564 ) ) ( not ( = ?auto_504562 ?auto_504565 ) ) ( not ( = ?auto_504562 ?auto_504566 ) ) ( not ( = ?auto_504562 ?auto_504567 ) ) ( not ( = ?auto_504562 ?auto_504568 ) ) ( not ( = ?auto_504562 ?auto_504569 ) ) ( not ( = ?auto_504562 ?auto_504570 ) ) ( not ( = ?auto_504562 ?auto_504571 ) ) ( not ( = ?auto_504562 ?auto_504572 ) ) ( not ( = ?auto_504563 ?auto_504564 ) ) ( not ( = ?auto_504563 ?auto_504565 ) ) ( not ( = ?auto_504563 ?auto_504566 ) ) ( not ( = ?auto_504563 ?auto_504567 ) ) ( not ( = ?auto_504563 ?auto_504568 ) ) ( not ( = ?auto_504563 ?auto_504569 ) ) ( not ( = ?auto_504563 ?auto_504570 ) ) ( not ( = ?auto_504563 ?auto_504571 ) ) ( not ( = ?auto_504563 ?auto_504572 ) ) ( not ( = ?auto_504564 ?auto_504565 ) ) ( not ( = ?auto_504564 ?auto_504566 ) ) ( not ( = ?auto_504564 ?auto_504567 ) ) ( not ( = ?auto_504564 ?auto_504568 ) ) ( not ( = ?auto_504564 ?auto_504569 ) ) ( not ( = ?auto_504564 ?auto_504570 ) ) ( not ( = ?auto_504564 ?auto_504571 ) ) ( not ( = ?auto_504564 ?auto_504572 ) ) ( not ( = ?auto_504565 ?auto_504566 ) ) ( not ( = ?auto_504565 ?auto_504567 ) ) ( not ( = ?auto_504565 ?auto_504568 ) ) ( not ( = ?auto_504565 ?auto_504569 ) ) ( not ( = ?auto_504565 ?auto_504570 ) ) ( not ( = ?auto_504565 ?auto_504571 ) ) ( not ( = ?auto_504565 ?auto_504572 ) ) ( not ( = ?auto_504566 ?auto_504567 ) ) ( not ( = ?auto_504566 ?auto_504568 ) ) ( not ( = ?auto_504566 ?auto_504569 ) ) ( not ( = ?auto_504566 ?auto_504570 ) ) ( not ( = ?auto_504566 ?auto_504571 ) ) ( not ( = ?auto_504566 ?auto_504572 ) ) ( not ( = ?auto_504567 ?auto_504568 ) ) ( not ( = ?auto_504567 ?auto_504569 ) ) ( not ( = ?auto_504567 ?auto_504570 ) ) ( not ( = ?auto_504567 ?auto_504571 ) ) ( not ( = ?auto_504567 ?auto_504572 ) ) ( not ( = ?auto_504568 ?auto_504569 ) ) ( not ( = ?auto_504568 ?auto_504570 ) ) ( not ( = ?auto_504568 ?auto_504571 ) ) ( not ( = ?auto_504568 ?auto_504572 ) ) ( not ( = ?auto_504569 ?auto_504570 ) ) ( not ( = ?auto_504569 ?auto_504571 ) ) ( not ( = ?auto_504569 ?auto_504572 ) ) ( not ( = ?auto_504570 ?auto_504571 ) ) ( not ( = ?auto_504570 ?auto_504572 ) ) ( not ( = ?auto_504571 ?auto_504572 ) ) ( ON ?auto_504570 ?auto_504571 ) ( ON ?auto_504569 ?auto_504570 ) ( ON ?auto_504568 ?auto_504569 ) ( ON ?auto_504567 ?auto_504568 ) ( ON ?auto_504566 ?auto_504567 ) ( ON ?auto_504565 ?auto_504566 ) ( CLEAR ?auto_504563 ) ( ON ?auto_504564 ?auto_504565 ) ( CLEAR ?auto_504564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_504561 ?auto_504562 ?auto_504563 ?auto_504564 )
      ( MAKE-11PILE ?auto_504561 ?auto_504562 ?auto_504563 ?auto_504564 ?auto_504565 ?auto_504566 ?auto_504567 ?auto_504568 ?auto_504569 ?auto_504570 ?auto_504571 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504607 - BLOCK
      ?auto_504608 - BLOCK
      ?auto_504609 - BLOCK
      ?auto_504610 - BLOCK
      ?auto_504611 - BLOCK
      ?auto_504612 - BLOCK
      ?auto_504613 - BLOCK
      ?auto_504614 - BLOCK
      ?auto_504615 - BLOCK
      ?auto_504616 - BLOCK
      ?auto_504617 - BLOCK
    )
    :vars
    (
      ?auto_504618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504617 ?auto_504618 ) ( ON-TABLE ?auto_504607 ) ( ON ?auto_504608 ?auto_504607 ) ( not ( = ?auto_504607 ?auto_504608 ) ) ( not ( = ?auto_504607 ?auto_504609 ) ) ( not ( = ?auto_504607 ?auto_504610 ) ) ( not ( = ?auto_504607 ?auto_504611 ) ) ( not ( = ?auto_504607 ?auto_504612 ) ) ( not ( = ?auto_504607 ?auto_504613 ) ) ( not ( = ?auto_504607 ?auto_504614 ) ) ( not ( = ?auto_504607 ?auto_504615 ) ) ( not ( = ?auto_504607 ?auto_504616 ) ) ( not ( = ?auto_504607 ?auto_504617 ) ) ( not ( = ?auto_504607 ?auto_504618 ) ) ( not ( = ?auto_504608 ?auto_504609 ) ) ( not ( = ?auto_504608 ?auto_504610 ) ) ( not ( = ?auto_504608 ?auto_504611 ) ) ( not ( = ?auto_504608 ?auto_504612 ) ) ( not ( = ?auto_504608 ?auto_504613 ) ) ( not ( = ?auto_504608 ?auto_504614 ) ) ( not ( = ?auto_504608 ?auto_504615 ) ) ( not ( = ?auto_504608 ?auto_504616 ) ) ( not ( = ?auto_504608 ?auto_504617 ) ) ( not ( = ?auto_504608 ?auto_504618 ) ) ( not ( = ?auto_504609 ?auto_504610 ) ) ( not ( = ?auto_504609 ?auto_504611 ) ) ( not ( = ?auto_504609 ?auto_504612 ) ) ( not ( = ?auto_504609 ?auto_504613 ) ) ( not ( = ?auto_504609 ?auto_504614 ) ) ( not ( = ?auto_504609 ?auto_504615 ) ) ( not ( = ?auto_504609 ?auto_504616 ) ) ( not ( = ?auto_504609 ?auto_504617 ) ) ( not ( = ?auto_504609 ?auto_504618 ) ) ( not ( = ?auto_504610 ?auto_504611 ) ) ( not ( = ?auto_504610 ?auto_504612 ) ) ( not ( = ?auto_504610 ?auto_504613 ) ) ( not ( = ?auto_504610 ?auto_504614 ) ) ( not ( = ?auto_504610 ?auto_504615 ) ) ( not ( = ?auto_504610 ?auto_504616 ) ) ( not ( = ?auto_504610 ?auto_504617 ) ) ( not ( = ?auto_504610 ?auto_504618 ) ) ( not ( = ?auto_504611 ?auto_504612 ) ) ( not ( = ?auto_504611 ?auto_504613 ) ) ( not ( = ?auto_504611 ?auto_504614 ) ) ( not ( = ?auto_504611 ?auto_504615 ) ) ( not ( = ?auto_504611 ?auto_504616 ) ) ( not ( = ?auto_504611 ?auto_504617 ) ) ( not ( = ?auto_504611 ?auto_504618 ) ) ( not ( = ?auto_504612 ?auto_504613 ) ) ( not ( = ?auto_504612 ?auto_504614 ) ) ( not ( = ?auto_504612 ?auto_504615 ) ) ( not ( = ?auto_504612 ?auto_504616 ) ) ( not ( = ?auto_504612 ?auto_504617 ) ) ( not ( = ?auto_504612 ?auto_504618 ) ) ( not ( = ?auto_504613 ?auto_504614 ) ) ( not ( = ?auto_504613 ?auto_504615 ) ) ( not ( = ?auto_504613 ?auto_504616 ) ) ( not ( = ?auto_504613 ?auto_504617 ) ) ( not ( = ?auto_504613 ?auto_504618 ) ) ( not ( = ?auto_504614 ?auto_504615 ) ) ( not ( = ?auto_504614 ?auto_504616 ) ) ( not ( = ?auto_504614 ?auto_504617 ) ) ( not ( = ?auto_504614 ?auto_504618 ) ) ( not ( = ?auto_504615 ?auto_504616 ) ) ( not ( = ?auto_504615 ?auto_504617 ) ) ( not ( = ?auto_504615 ?auto_504618 ) ) ( not ( = ?auto_504616 ?auto_504617 ) ) ( not ( = ?auto_504616 ?auto_504618 ) ) ( not ( = ?auto_504617 ?auto_504618 ) ) ( ON ?auto_504616 ?auto_504617 ) ( ON ?auto_504615 ?auto_504616 ) ( ON ?auto_504614 ?auto_504615 ) ( ON ?auto_504613 ?auto_504614 ) ( ON ?auto_504612 ?auto_504613 ) ( ON ?auto_504611 ?auto_504612 ) ( ON ?auto_504610 ?auto_504611 ) ( CLEAR ?auto_504608 ) ( ON ?auto_504609 ?auto_504610 ) ( CLEAR ?auto_504609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_504607 ?auto_504608 ?auto_504609 )
      ( MAKE-11PILE ?auto_504607 ?auto_504608 ?auto_504609 ?auto_504610 ?auto_504611 ?auto_504612 ?auto_504613 ?auto_504614 ?auto_504615 ?auto_504616 ?auto_504617 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504653 - BLOCK
      ?auto_504654 - BLOCK
      ?auto_504655 - BLOCK
      ?auto_504656 - BLOCK
      ?auto_504657 - BLOCK
      ?auto_504658 - BLOCK
      ?auto_504659 - BLOCK
      ?auto_504660 - BLOCK
      ?auto_504661 - BLOCK
      ?auto_504662 - BLOCK
      ?auto_504663 - BLOCK
    )
    :vars
    (
      ?auto_504664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504663 ?auto_504664 ) ( ON-TABLE ?auto_504653 ) ( not ( = ?auto_504653 ?auto_504654 ) ) ( not ( = ?auto_504653 ?auto_504655 ) ) ( not ( = ?auto_504653 ?auto_504656 ) ) ( not ( = ?auto_504653 ?auto_504657 ) ) ( not ( = ?auto_504653 ?auto_504658 ) ) ( not ( = ?auto_504653 ?auto_504659 ) ) ( not ( = ?auto_504653 ?auto_504660 ) ) ( not ( = ?auto_504653 ?auto_504661 ) ) ( not ( = ?auto_504653 ?auto_504662 ) ) ( not ( = ?auto_504653 ?auto_504663 ) ) ( not ( = ?auto_504653 ?auto_504664 ) ) ( not ( = ?auto_504654 ?auto_504655 ) ) ( not ( = ?auto_504654 ?auto_504656 ) ) ( not ( = ?auto_504654 ?auto_504657 ) ) ( not ( = ?auto_504654 ?auto_504658 ) ) ( not ( = ?auto_504654 ?auto_504659 ) ) ( not ( = ?auto_504654 ?auto_504660 ) ) ( not ( = ?auto_504654 ?auto_504661 ) ) ( not ( = ?auto_504654 ?auto_504662 ) ) ( not ( = ?auto_504654 ?auto_504663 ) ) ( not ( = ?auto_504654 ?auto_504664 ) ) ( not ( = ?auto_504655 ?auto_504656 ) ) ( not ( = ?auto_504655 ?auto_504657 ) ) ( not ( = ?auto_504655 ?auto_504658 ) ) ( not ( = ?auto_504655 ?auto_504659 ) ) ( not ( = ?auto_504655 ?auto_504660 ) ) ( not ( = ?auto_504655 ?auto_504661 ) ) ( not ( = ?auto_504655 ?auto_504662 ) ) ( not ( = ?auto_504655 ?auto_504663 ) ) ( not ( = ?auto_504655 ?auto_504664 ) ) ( not ( = ?auto_504656 ?auto_504657 ) ) ( not ( = ?auto_504656 ?auto_504658 ) ) ( not ( = ?auto_504656 ?auto_504659 ) ) ( not ( = ?auto_504656 ?auto_504660 ) ) ( not ( = ?auto_504656 ?auto_504661 ) ) ( not ( = ?auto_504656 ?auto_504662 ) ) ( not ( = ?auto_504656 ?auto_504663 ) ) ( not ( = ?auto_504656 ?auto_504664 ) ) ( not ( = ?auto_504657 ?auto_504658 ) ) ( not ( = ?auto_504657 ?auto_504659 ) ) ( not ( = ?auto_504657 ?auto_504660 ) ) ( not ( = ?auto_504657 ?auto_504661 ) ) ( not ( = ?auto_504657 ?auto_504662 ) ) ( not ( = ?auto_504657 ?auto_504663 ) ) ( not ( = ?auto_504657 ?auto_504664 ) ) ( not ( = ?auto_504658 ?auto_504659 ) ) ( not ( = ?auto_504658 ?auto_504660 ) ) ( not ( = ?auto_504658 ?auto_504661 ) ) ( not ( = ?auto_504658 ?auto_504662 ) ) ( not ( = ?auto_504658 ?auto_504663 ) ) ( not ( = ?auto_504658 ?auto_504664 ) ) ( not ( = ?auto_504659 ?auto_504660 ) ) ( not ( = ?auto_504659 ?auto_504661 ) ) ( not ( = ?auto_504659 ?auto_504662 ) ) ( not ( = ?auto_504659 ?auto_504663 ) ) ( not ( = ?auto_504659 ?auto_504664 ) ) ( not ( = ?auto_504660 ?auto_504661 ) ) ( not ( = ?auto_504660 ?auto_504662 ) ) ( not ( = ?auto_504660 ?auto_504663 ) ) ( not ( = ?auto_504660 ?auto_504664 ) ) ( not ( = ?auto_504661 ?auto_504662 ) ) ( not ( = ?auto_504661 ?auto_504663 ) ) ( not ( = ?auto_504661 ?auto_504664 ) ) ( not ( = ?auto_504662 ?auto_504663 ) ) ( not ( = ?auto_504662 ?auto_504664 ) ) ( not ( = ?auto_504663 ?auto_504664 ) ) ( ON ?auto_504662 ?auto_504663 ) ( ON ?auto_504661 ?auto_504662 ) ( ON ?auto_504660 ?auto_504661 ) ( ON ?auto_504659 ?auto_504660 ) ( ON ?auto_504658 ?auto_504659 ) ( ON ?auto_504657 ?auto_504658 ) ( ON ?auto_504656 ?auto_504657 ) ( ON ?auto_504655 ?auto_504656 ) ( CLEAR ?auto_504653 ) ( ON ?auto_504654 ?auto_504655 ) ( CLEAR ?auto_504654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_504653 ?auto_504654 )
      ( MAKE-11PILE ?auto_504653 ?auto_504654 ?auto_504655 ?auto_504656 ?auto_504657 ?auto_504658 ?auto_504659 ?auto_504660 ?auto_504661 ?auto_504662 ?auto_504663 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_504699 - BLOCK
      ?auto_504700 - BLOCK
      ?auto_504701 - BLOCK
      ?auto_504702 - BLOCK
      ?auto_504703 - BLOCK
      ?auto_504704 - BLOCK
      ?auto_504705 - BLOCK
      ?auto_504706 - BLOCK
      ?auto_504707 - BLOCK
      ?auto_504708 - BLOCK
      ?auto_504709 - BLOCK
    )
    :vars
    (
      ?auto_504710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504709 ?auto_504710 ) ( not ( = ?auto_504699 ?auto_504700 ) ) ( not ( = ?auto_504699 ?auto_504701 ) ) ( not ( = ?auto_504699 ?auto_504702 ) ) ( not ( = ?auto_504699 ?auto_504703 ) ) ( not ( = ?auto_504699 ?auto_504704 ) ) ( not ( = ?auto_504699 ?auto_504705 ) ) ( not ( = ?auto_504699 ?auto_504706 ) ) ( not ( = ?auto_504699 ?auto_504707 ) ) ( not ( = ?auto_504699 ?auto_504708 ) ) ( not ( = ?auto_504699 ?auto_504709 ) ) ( not ( = ?auto_504699 ?auto_504710 ) ) ( not ( = ?auto_504700 ?auto_504701 ) ) ( not ( = ?auto_504700 ?auto_504702 ) ) ( not ( = ?auto_504700 ?auto_504703 ) ) ( not ( = ?auto_504700 ?auto_504704 ) ) ( not ( = ?auto_504700 ?auto_504705 ) ) ( not ( = ?auto_504700 ?auto_504706 ) ) ( not ( = ?auto_504700 ?auto_504707 ) ) ( not ( = ?auto_504700 ?auto_504708 ) ) ( not ( = ?auto_504700 ?auto_504709 ) ) ( not ( = ?auto_504700 ?auto_504710 ) ) ( not ( = ?auto_504701 ?auto_504702 ) ) ( not ( = ?auto_504701 ?auto_504703 ) ) ( not ( = ?auto_504701 ?auto_504704 ) ) ( not ( = ?auto_504701 ?auto_504705 ) ) ( not ( = ?auto_504701 ?auto_504706 ) ) ( not ( = ?auto_504701 ?auto_504707 ) ) ( not ( = ?auto_504701 ?auto_504708 ) ) ( not ( = ?auto_504701 ?auto_504709 ) ) ( not ( = ?auto_504701 ?auto_504710 ) ) ( not ( = ?auto_504702 ?auto_504703 ) ) ( not ( = ?auto_504702 ?auto_504704 ) ) ( not ( = ?auto_504702 ?auto_504705 ) ) ( not ( = ?auto_504702 ?auto_504706 ) ) ( not ( = ?auto_504702 ?auto_504707 ) ) ( not ( = ?auto_504702 ?auto_504708 ) ) ( not ( = ?auto_504702 ?auto_504709 ) ) ( not ( = ?auto_504702 ?auto_504710 ) ) ( not ( = ?auto_504703 ?auto_504704 ) ) ( not ( = ?auto_504703 ?auto_504705 ) ) ( not ( = ?auto_504703 ?auto_504706 ) ) ( not ( = ?auto_504703 ?auto_504707 ) ) ( not ( = ?auto_504703 ?auto_504708 ) ) ( not ( = ?auto_504703 ?auto_504709 ) ) ( not ( = ?auto_504703 ?auto_504710 ) ) ( not ( = ?auto_504704 ?auto_504705 ) ) ( not ( = ?auto_504704 ?auto_504706 ) ) ( not ( = ?auto_504704 ?auto_504707 ) ) ( not ( = ?auto_504704 ?auto_504708 ) ) ( not ( = ?auto_504704 ?auto_504709 ) ) ( not ( = ?auto_504704 ?auto_504710 ) ) ( not ( = ?auto_504705 ?auto_504706 ) ) ( not ( = ?auto_504705 ?auto_504707 ) ) ( not ( = ?auto_504705 ?auto_504708 ) ) ( not ( = ?auto_504705 ?auto_504709 ) ) ( not ( = ?auto_504705 ?auto_504710 ) ) ( not ( = ?auto_504706 ?auto_504707 ) ) ( not ( = ?auto_504706 ?auto_504708 ) ) ( not ( = ?auto_504706 ?auto_504709 ) ) ( not ( = ?auto_504706 ?auto_504710 ) ) ( not ( = ?auto_504707 ?auto_504708 ) ) ( not ( = ?auto_504707 ?auto_504709 ) ) ( not ( = ?auto_504707 ?auto_504710 ) ) ( not ( = ?auto_504708 ?auto_504709 ) ) ( not ( = ?auto_504708 ?auto_504710 ) ) ( not ( = ?auto_504709 ?auto_504710 ) ) ( ON ?auto_504708 ?auto_504709 ) ( ON ?auto_504707 ?auto_504708 ) ( ON ?auto_504706 ?auto_504707 ) ( ON ?auto_504705 ?auto_504706 ) ( ON ?auto_504704 ?auto_504705 ) ( ON ?auto_504703 ?auto_504704 ) ( ON ?auto_504702 ?auto_504703 ) ( ON ?auto_504701 ?auto_504702 ) ( ON ?auto_504700 ?auto_504701 ) ( ON ?auto_504699 ?auto_504700 ) ( CLEAR ?auto_504699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_504699 )
      ( MAKE-11PILE ?auto_504699 ?auto_504700 ?auto_504701 ?auto_504702 ?auto_504703 ?auto_504704 ?auto_504705 ?auto_504706 ?auto_504707 ?auto_504708 ?auto_504709 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_504746 - BLOCK
      ?auto_504747 - BLOCK
      ?auto_504748 - BLOCK
      ?auto_504749 - BLOCK
      ?auto_504750 - BLOCK
      ?auto_504751 - BLOCK
      ?auto_504752 - BLOCK
      ?auto_504753 - BLOCK
      ?auto_504754 - BLOCK
      ?auto_504755 - BLOCK
      ?auto_504756 - BLOCK
      ?auto_504757 - BLOCK
    )
    :vars
    (
      ?auto_504758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_504756 ) ( ON ?auto_504757 ?auto_504758 ) ( CLEAR ?auto_504757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_504746 ) ( ON ?auto_504747 ?auto_504746 ) ( ON ?auto_504748 ?auto_504747 ) ( ON ?auto_504749 ?auto_504748 ) ( ON ?auto_504750 ?auto_504749 ) ( ON ?auto_504751 ?auto_504750 ) ( ON ?auto_504752 ?auto_504751 ) ( ON ?auto_504753 ?auto_504752 ) ( ON ?auto_504754 ?auto_504753 ) ( ON ?auto_504755 ?auto_504754 ) ( ON ?auto_504756 ?auto_504755 ) ( not ( = ?auto_504746 ?auto_504747 ) ) ( not ( = ?auto_504746 ?auto_504748 ) ) ( not ( = ?auto_504746 ?auto_504749 ) ) ( not ( = ?auto_504746 ?auto_504750 ) ) ( not ( = ?auto_504746 ?auto_504751 ) ) ( not ( = ?auto_504746 ?auto_504752 ) ) ( not ( = ?auto_504746 ?auto_504753 ) ) ( not ( = ?auto_504746 ?auto_504754 ) ) ( not ( = ?auto_504746 ?auto_504755 ) ) ( not ( = ?auto_504746 ?auto_504756 ) ) ( not ( = ?auto_504746 ?auto_504757 ) ) ( not ( = ?auto_504746 ?auto_504758 ) ) ( not ( = ?auto_504747 ?auto_504748 ) ) ( not ( = ?auto_504747 ?auto_504749 ) ) ( not ( = ?auto_504747 ?auto_504750 ) ) ( not ( = ?auto_504747 ?auto_504751 ) ) ( not ( = ?auto_504747 ?auto_504752 ) ) ( not ( = ?auto_504747 ?auto_504753 ) ) ( not ( = ?auto_504747 ?auto_504754 ) ) ( not ( = ?auto_504747 ?auto_504755 ) ) ( not ( = ?auto_504747 ?auto_504756 ) ) ( not ( = ?auto_504747 ?auto_504757 ) ) ( not ( = ?auto_504747 ?auto_504758 ) ) ( not ( = ?auto_504748 ?auto_504749 ) ) ( not ( = ?auto_504748 ?auto_504750 ) ) ( not ( = ?auto_504748 ?auto_504751 ) ) ( not ( = ?auto_504748 ?auto_504752 ) ) ( not ( = ?auto_504748 ?auto_504753 ) ) ( not ( = ?auto_504748 ?auto_504754 ) ) ( not ( = ?auto_504748 ?auto_504755 ) ) ( not ( = ?auto_504748 ?auto_504756 ) ) ( not ( = ?auto_504748 ?auto_504757 ) ) ( not ( = ?auto_504748 ?auto_504758 ) ) ( not ( = ?auto_504749 ?auto_504750 ) ) ( not ( = ?auto_504749 ?auto_504751 ) ) ( not ( = ?auto_504749 ?auto_504752 ) ) ( not ( = ?auto_504749 ?auto_504753 ) ) ( not ( = ?auto_504749 ?auto_504754 ) ) ( not ( = ?auto_504749 ?auto_504755 ) ) ( not ( = ?auto_504749 ?auto_504756 ) ) ( not ( = ?auto_504749 ?auto_504757 ) ) ( not ( = ?auto_504749 ?auto_504758 ) ) ( not ( = ?auto_504750 ?auto_504751 ) ) ( not ( = ?auto_504750 ?auto_504752 ) ) ( not ( = ?auto_504750 ?auto_504753 ) ) ( not ( = ?auto_504750 ?auto_504754 ) ) ( not ( = ?auto_504750 ?auto_504755 ) ) ( not ( = ?auto_504750 ?auto_504756 ) ) ( not ( = ?auto_504750 ?auto_504757 ) ) ( not ( = ?auto_504750 ?auto_504758 ) ) ( not ( = ?auto_504751 ?auto_504752 ) ) ( not ( = ?auto_504751 ?auto_504753 ) ) ( not ( = ?auto_504751 ?auto_504754 ) ) ( not ( = ?auto_504751 ?auto_504755 ) ) ( not ( = ?auto_504751 ?auto_504756 ) ) ( not ( = ?auto_504751 ?auto_504757 ) ) ( not ( = ?auto_504751 ?auto_504758 ) ) ( not ( = ?auto_504752 ?auto_504753 ) ) ( not ( = ?auto_504752 ?auto_504754 ) ) ( not ( = ?auto_504752 ?auto_504755 ) ) ( not ( = ?auto_504752 ?auto_504756 ) ) ( not ( = ?auto_504752 ?auto_504757 ) ) ( not ( = ?auto_504752 ?auto_504758 ) ) ( not ( = ?auto_504753 ?auto_504754 ) ) ( not ( = ?auto_504753 ?auto_504755 ) ) ( not ( = ?auto_504753 ?auto_504756 ) ) ( not ( = ?auto_504753 ?auto_504757 ) ) ( not ( = ?auto_504753 ?auto_504758 ) ) ( not ( = ?auto_504754 ?auto_504755 ) ) ( not ( = ?auto_504754 ?auto_504756 ) ) ( not ( = ?auto_504754 ?auto_504757 ) ) ( not ( = ?auto_504754 ?auto_504758 ) ) ( not ( = ?auto_504755 ?auto_504756 ) ) ( not ( = ?auto_504755 ?auto_504757 ) ) ( not ( = ?auto_504755 ?auto_504758 ) ) ( not ( = ?auto_504756 ?auto_504757 ) ) ( not ( = ?auto_504756 ?auto_504758 ) ) ( not ( = ?auto_504757 ?auto_504758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_504757 ?auto_504758 )
      ( !STACK ?auto_504757 ?auto_504756 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_504796 - BLOCK
      ?auto_504797 - BLOCK
      ?auto_504798 - BLOCK
      ?auto_504799 - BLOCK
      ?auto_504800 - BLOCK
      ?auto_504801 - BLOCK
      ?auto_504802 - BLOCK
      ?auto_504803 - BLOCK
      ?auto_504804 - BLOCK
      ?auto_504805 - BLOCK
      ?auto_504806 - BLOCK
      ?auto_504807 - BLOCK
    )
    :vars
    (
      ?auto_504808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504807 ?auto_504808 ) ( ON-TABLE ?auto_504796 ) ( ON ?auto_504797 ?auto_504796 ) ( ON ?auto_504798 ?auto_504797 ) ( ON ?auto_504799 ?auto_504798 ) ( ON ?auto_504800 ?auto_504799 ) ( ON ?auto_504801 ?auto_504800 ) ( ON ?auto_504802 ?auto_504801 ) ( ON ?auto_504803 ?auto_504802 ) ( ON ?auto_504804 ?auto_504803 ) ( ON ?auto_504805 ?auto_504804 ) ( not ( = ?auto_504796 ?auto_504797 ) ) ( not ( = ?auto_504796 ?auto_504798 ) ) ( not ( = ?auto_504796 ?auto_504799 ) ) ( not ( = ?auto_504796 ?auto_504800 ) ) ( not ( = ?auto_504796 ?auto_504801 ) ) ( not ( = ?auto_504796 ?auto_504802 ) ) ( not ( = ?auto_504796 ?auto_504803 ) ) ( not ( = ?auto_504796 ?auto_504804 ) ) ( not ( = ?auto_504796 ?auto_504805 ) ) ( not ( = ?auto_504796 ?auto_504806 ) ) ( not ( = ?auto_504796 ?auto_504807 ) ) ( not ( = ?auto_504796 ?auto_504808 ) ) ( not ( = ?auto_504797 ?auto_504798 ) ) ( not ( = ?auto_504797 ?auto_504799 ) ) ( not ( = ?auto_504797 ?auto_504800 ) ) ( not ( = ?auto_504797 ?auto_504801 ) ) ( not ( = ?auto_504797 ?auto_504802 ) ) ( not ( = ?auto_504797 ?auto_504803 ) ) ( not ( = ?auto_504797 ?auto_504804 ) ) ( not ( = ?auto_504797 ?auto_504805 ) ) ( not ( = ?auto_504797 ?auto_504806 ) ) ( not ( = ?auto_504797 ?auto_504807 ) ) ( not ( = ?auto_504797 ?auto_504808 ) ) ( not ( = ?auto_504798 ?auto_504799 ) ) ( not ( = ?auto_504798 ?auto_504800 ) ) ( not ( = ?auto_504798 ?auto_504801 ) ) ( not ( = ?auto_504798 ?auto_504802 ) ) ( not ( = ?auto_504798 ?auto_504803 ) ) ( not ( = ?auto_504798 ?auto_504804 ) ) ( not ( = ?auto_504798 ?auto_504805 ) ) ( not ( = ?auto_504798 ?auto_504806 ) ) ( not ( = ?auto_504798 ?auto_504807 ) ) ( not ( = ?auto_504798 ?auto_504808 ) ) ( not ( = ?auto_504799 ?auto_504800 ) ) ( not ( = ?auto_504799 ?auto_504801 ) ) ( not ( = ?auto_504799 ?auto_504802 ) ) ( not ( = ?auto_504799 ?auto_504803 ) ) ( not ( = ?auto_504799 ?auto_504804 ) ) ( not ( = ?auto_504799 ?auto_504805 ) ) ( not ( = ?auto_504799 ?auto_504806 ) ) ( not ( = ?auto_504799 ?auto_504807 ) ) ( not ( = ?auto_504799 ?auto_504808 ) ) ( not ( = ?auto_504800 ?auto_504801 ) ) ( not ( = ?auto_504800 ?auto_504802 ) ) ( not ( = ?auto_504800 ?auto_504803 ) ) ( not ( = ?auto_504800 ?auto_504804 ) ) ( not ( = ?auto_504800 ?auto_504805 ) ) ( not ( = ?auto_504800 ?auto_504806 ) ) ( not ( = ?auto_504800 ?auto_504807 ) ) ( not ( = ?auto_504800 ?auto_504808 ) ) ( not ( = ?auto_504801 ?auto_504802 ) ) ( not ( = ?auto_504801 ?auto_504803 ) ) ( not ( = ?auto_504801 ?auto_504804 ) ) ( not ( = ?auto_504801 ?auto_504805 ) ) ( not ( = ?auto_504801 ?auto_504806 ) ) ( not ( = ?auto_504801 ?auto_504807 ) ) ( not ( = ?auto_504801 ?auto_504808 ) ) ( not ( = ?auto_504802 ?auto_504803 ) ) ( not ( = ?auto_504802 ?auto_504804 ) ) ( not ( = ?auto_504802 ?auto_504805 ) ) ( not ( = ?auto_504802 ?auto_504806 ) ) ( not ( = ?auto_504802 ?auto_504807 ) ) ( not ( = ?auto_504802 ?auto_504808 ) ) ( not ( = ?auto_504803 ?auto_504804 ) ) ( not ( = ?auto_504803 ?auto_504805 ) ) ( not ( = ?auto_504803 ?auto_504806 ) ) ( not ( = ?auto_504803 ?auto_504807 ) ) ( not ( = ?auto_504803 ?auto_504808 ) ) ( not ( = ?auto_504804 ?auto_504805 ) ) ( not ( = ?auto_504804 ?auto_504806 ) ) ( not ( = ?auto_504804 ?auto_504807 ) ) ( not ( = ?auto_504804 ?auto_504808 ) ) ( not ( = ?auto_504805 ?auto_504806 ) ) ( not ( = ?auto_504805 ?auto_504807 ) ) ( not ( = ?auto_504805 ?auto_504808 ) ) ( not ( = ?auto_504806 ?auto_504807 ) ) ( not ( = ?auto_504806 ?auto_504808 ) ) ( not ( = ?auto_504807 ?auto_504808 ) ) ( CLEAR ?auto_504805 ) ( ON ?auto_504806 ?auto_504807 ) ( CLEAR ?auto_504806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_504796 ?auto_504797 ?auto_504798 ?auto_504799 ?auto_504800 ?auto_504801 ?auto_504802 ?auto_504803 ?auto_504804 ?auto_504805 ?auto_504806 )
      ( MAKE-12PILE ?auto_504796 ?auto_504797 ?auto_504798 ?auto_504799 ?auto_504800 ?auto_504801 ?auto_504802 ?auto_504803 ?auto_504804 ?auto_504805 ?auto_504806 ?auto_504807 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_504846 - BLOCK
      ?auto_504847 - BLOCK
      ?auto_504848 - BLOCK
      ?auto_504849 - BLOCK
      ?auto_504850 - BLOCK
      ?auto_504851 - BLOCK
      ?auto_504852 - BLOCK
      ?auto_504853 - BLOCK
      ?auto_504854 - BLOCK
      ?auto_504855 - BLOCK
      ?auto_504856 - BLOCK
      ?auto_504857 - BLOCK
    )
    :vars
    (
      ?auto_504858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504857 ?auto_504858 ) ( ON-TABLE ?auto_504846 ) ( ON ?auto_504847 ?auto_504846 ) ( ON ?auto_504848 ?auto_504847 ) ( ON ?auto_504849 ?auto_504848 ) ( ON ?auto_504850 ?auto_504849 ) ( ON ?auto_504851 ?auto_504850 ) ( ON ?auto_504852 ?auto_504851 ) ( ON ?auto_504853 ?auto_504852 ) ( ON ?auto_504854 ?auto_504853 ) ( not ( = ?auto_504846 ?auto_504847 ) ) ( not ( = ?auto_504846 ?auto_504848 ) ) ( not ( = ?auto_504846 ?auto_504849 ) ) ( not ( = ?auto_504846 ?auto_504850 ) ) ( not ( = ?auto_504846 ?auto_504851 ) ) ( not ( = ?auto_504846 ?auto_504852 ) ) ( not ( = ?auto_504846 ?auto_504853 ) ) ( not ( = ?auto_504846 ?auto_504854 ) ) ( not ( = ?auto_504846 ?auto_504855 ) ) ( not ( = ?auto_504846 ?auto_504856 ) ) ( not ( = ?auto_504846 ?auto_504857 ) ) ( not ( = ?auto_504846 ?auto_504858 ) ) ( not ( = ?auto_504847 ?auto_504848 ) ) ( not ( = ?auto_504847 ?auto_504849 ) ) ( not ( = ?auto_504847 ?auto_504850 ) ) ( not ( = ?auto_504847 ?auto_504851 ) ) ( not ( = ?auto_504847 ?auto_504852 ) ) ( not ( = ?auto_504847 ?auto_504853 ) ) ( not ( = ?auto_504847 ?auto_504854 ) ) ( not ( = ?auto_504847 ?auto_504855 ) ) ( not ( = ?auto_504847 ?auto_504856 ) ) ( not ( = ?auto_504847 ?auto_504857 ) ) ( not ( = ?auto_504847 ?auto_504858 ) ) ( not ( = ?auto_504848 ?auto_504849 ) ) ( not ( = ?auto_504848 ?auto_504850 ) ) ( not ( = ?auto_504848 ?auto_504851 ) ) ( not ( = ?auto_504848 ?auto_504852 ) ) ( not ( = ?auto_504848 ?auto_504853 ) ) ( not ( = ?auto_504848 ?auto_504854 ) ) ( not ( = ?auto_504848 ?auto_504855 ) ) ( not ( = ?auto_504848 ?auto_504856 ) ) ( not ( = ?auto_504848 ?auto_504857 ) ) ( not ( = ?auto_504848 ?auto_504858 ) ) ( not ( = ?auto_504849 ?auto_504850 ) ) ( not ( = ?auto_504849 ?auto_504851 ) ) ( not ( = ?auto_504849 ?auto_504852 ) ) ( not ( = ?auto_504849 ?auto_504853 ) ) ( not ( = ?auto_504849 ?auto_504854 ) ) ( not ( = ?auto_504849 ?auto_504855 ) ) ( not ( = ?auto_504849 ?auto_504856 ) ) ( not ( = ?auto_504849 ?auto_504857 ) ) ( not ( = ?auto_504849 ?auto_504858 ) ) ( not ( = ?auto_504850 ?auto_504851 ) ) ( not ( = ?auto_504850 ?auto_504852 ) ) ( not ( = ?auto_504850 ?auto_504853 ) ) ( not ( = ?auto_504850 ?auto_504854 ) ) ( not ( = ?auto_504850 ?auto_504855 ) ) ( not ( = ?auto_504850 ?auto_504856 ) ) ( not ( = ?auto_504850 ?auto_504857 ) ) ( not ( = ?auto_504850 ?auto_504858 ) ) ( not ( = ?auto_504851 ?auto_504852 ) ) ( not ( = ?auto_504851 ?auto_504853 ) ) ( not ( = ?auto_504851 ?auto_504854 ) ) ( not ( = ?auto_504851 ?auto_504855 ) ) ( not ( = ?auto_504851 ?auto_504856 ) ) ( not ( = ?auto_504851 ?auto_504857 ) ) ( not ( = ?auto_504851 ?auto_504858 ) ) ( not ( = ?auto_504852 ?auto_504853 ) ) ( not ( = ?auto_504852 ?auto_504854 ) ) ( not ( = ?auto_504852 ?auto_504855 ) ) ( not ( = ?auto_504852 ?auto_504856 ) ) ( not ( = ?auto_504852 ?auto_504857 ) ) ( not ( = ?auto_504852 ?auto_504858 ) ) ( not ( = ?auto_504853 ?auto_504854 ) ) ( not ( = ?auto_504853 ?auto_504855 ) ) ( not ( = ?auto_504853 ?auto_504856 ) ) ( not ( = ?auto_504853 ?auto_504857 ) ) ( not ( = ?auto_504853 ?auto_504858 ) ) ( not ( = ?auto_504854 ?auto_504855 ) ) ( not ( = ?auto_504854 ?auto_504856 ) ) ( not ( = ?auto_504854 ?auto_504857 ) ) ( not ( = ?auto_504854 ?auto_504858 ) ) ( not ( = ?auto_504855 ?auto_504856 ) ) ( not ( = ?auto_504855 ?auto_504857 ) ) ( not ( = ?auto_504855 ?auto_504858 ) ) ( not ( = ?auto_504856 ?auto_504857 ) ) ( not ( = ?auto_504856 ?auto_504858 ) ) ( not ( = ?auto_504857 ?auto_504858 ) ) ( ON ?auto_504856 ?auto_504857 ) ( CLEAR ?auto_504854 ) ( ON ?auto_504855 ?auto_504856 ) ( CLEAR ?auto_504855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_504846 ?auto_504847 ?auto_504848 ?auto_504849 ?auto_504850 ?auto_504851 ?auto_504852 ?auto_504853 ?auto_504854 ?auto_504855 )
      ( MAKE-12PILE ?auto_504846 ?auto_504847 ?auto_504848 ?auto_504849 ?auto_504850 ?auto_504851 ?auto_504852 ?auto_504853 ?auto_504854 ?auto_504855 ?auto_504856 ?auto_504857 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_504896 - BLOCK
      ?auto_504897 - BLOCK
      ?auto_504898 - BLOCK
      ?auto_504899 - BLOCK
      ?auto_504900 - BLOCK
      ?auto_504901 - BLOCK
      ?auto_504902 - BLOCK
      ?auto_504903 - BLOCK
      ?auto_504904 - BLOCK
      ?auto_504905 - BLOCK
      ?auto_504906 - BLOCK
      ?auto_504907 - BLOCK
    )
    :vars
    (
      ?auto_504908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504907 ?auto_504908 ) ( ON-TABLE ?auto_504896 ) ( ON ?auto_504897 ?auto_504896 ) ( ON ?auto_504898 ?auto_504897 ) ( ON ?auto_504899 ?auto_504898 ) ( ON ?auto_504900 ?auto_504899 ) ( ON ?auto_504901 ?auto_504900 ) ( ON ?auto_504902 ?auto_504901 ) ( ON ?auto_504903 ?auto_504902 ) ( not ( = ?auto_504896 ?auto_504897 ) ) ( not ( = ?auto_504896 ?auto_504898 ) ) ( not ( = ?auto_504896 ?auto_504899 ) ) ( not ( = ?auto_504896 ?auto_504900 ) ) ( not ( = ?auto_504896 ?auto_504901 ) ) ( not ( = ?auto_504896 ?auto_504902 ) ) ( not ( = ?auto_504896 ?auto_504903 ) ) ( not ( = ?auto_504896 ?auto_504904 ) ) ( not ( = ?auto_504896 ?auto_504905 ) ) ( not ( = ?auto_504896 ?auto_504906 ) ) ( not ( = ?auto_504896 ?auto_504907 ) ) ( not ( = ?auto_504896 ?auto_504908 ) ) ( not ( = ?auto_504897 ?auto_504898 ) ) ( not ( = ?auto_504897 ?auto_504899 ) ) ( not ( = ?auto_504897 ?auto_504900 ) ) ( not ( = ?auto_504897 ?auto_504901 ) ) ( not ( = ?auto_504897 ?auto_504902 ) ) ( not ( = ?auto_504897 ?auto_504903 ) ) ( not ( = ?auto_504897 ?auto_504904 ) ) ( not ( = ?auto_504897 ?auto_504905 ) ) ( not ( = ?auto_504897 ?auto_504906 ) ) ( not ( = ?auto_504897 ?auto_504907 ) ) ( not ( = ?auto_504897 ?auto_504908 ) ) ( not ( = ?auto_504898 ?auto_504899 ) ) ( not ( = ?auto_504898 ?auto_504900 ) ) ( not ( = ?auto_504898 ?auto_504901 ) ) ( not ( = ?auto_504898 ?auto_504902 ) ) ( not ( = ?auto_504898 ?auto_504903 ) ) ( not ( = ?auto_504898 ?auto_504904 ) ) ( not ( = ?auto_504898 ?auto_504905 ) ) ( not ( = ?auto_504898 ?auto_504906 ) ) ( not ( = ?auto_504898 ?auto_504907 ) ) ( not ( = ?auto_504898 ?auto_504908 ) ) ( not ( = ?auto_504899 ?auto_504900 ) ) ( not ( = ?auto_504899 ?auto_504901 ) ) ( not ( = ?auto_504899 ?auto_504902 ) ) ( not ( = ?auto_504899 ?auto_504903 ) ) ( not ( = ?auto_504899 ?auto_504904 ) ) ( not ( = ?auto_504899 ?auto_504905 ) ) ( not ( = ?auto_504899 ?auto_504906 ) ) ( not ( = ?auto_504899 ?auto_504907 ) ) ( not ( = ?auto_504899 ?auto_504908 ) ) ( not ( = ?auto_504900 ?auto_504901 ) ) ( not ( = ?auto_504900 ?auto_504902 ) ) ( not ( = ?auto_504900 ?auto_504903 ) ) ( not ( = ?auto_504900 ?auto_504904 ) ) ( not ( = ?auto_504900 ?auto_504905 ) ) ( not ( = ?auto_504900 ?auto_504906 ) ) ( not ( = ?auto_504900 ?auto_504907 ) ) ( not ( = ?auto_504900 ?auto_504908 ) ) ( not ( = ?auto_504901 ?auto_504902 ) ) ( not ( = ?auto_504901 ?auto_504903 ) ) ( not ( = ?auto_504901 ?auto_504904 ) ) ( not ( = ?auto_504901 ?auto_504905 ) ) ( not ( = ?auto_504901 ?auto_504906 ) ) ( not ( = ?auto_504901 ?auto_504907 ) ) ( not ( = ?auto_504901 ?auto_504908 ) ) ( not ( = ?auto_504902 ?auto_504903 ) ) ( not ( = ?auto_504902 ?auto_504904 ) ) ( not ( = ?auto_504902 ?auto_504905 ) ) ( not ( = ?auto_504902 ?auto_504906 ) ) ( not ( = ?auto_504902 ?auto_504907 ) ) ( not ( = ?auto_504902 ?auto_504908 ) ) ( not ( = ?auto_504903 ?auto_504904 ) ) ( not ( = ?auto_504903 ?auto_504905 ) ) ( not ( = ?auto_504903 ?auto_504906 ) ) ( not ( = ?auto_504903 ?auto_504907 ) ) ( not ( = ?auto_504903 ?auto_504908 ) ) ( not ( = ?auto_504904 ?auto_504905 ) ) ( not ( = ?auto_504904 ?auto_504906 ) ) ( not ( = ?auto_504904 ?auto_504907 ) ) ( not ( = ?auto_504904 ?auto_504908 ) ) ( not ( = ?auto_504905 ?auto_504906 ) ) ( not ( = ?auto_504905 ?auto_504907 ) ) ( not ( = ?auto_504905 ?auto_504908 ) ) ( not ( = ?auto_504906 ?auto_504907 ) ) ( not ( = ?auto_504906 ?auto_504908 ) ) ( not ( = ?auto_504907 ?auto_504908 ) ) ( ON ?auto_504906 ?auto_504907 ) ( ON ?auto_504905 ?auto_504906 ) ( CLEAR ?auto_504903 ) ( ON ?auto_504904 ?auto_504905 ) ( CLEAR ?auto_504904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_504896 ?auto_504897 ?auto_504898 ?auto_504899 ?auto_504900 ?auto_504901 ?auto_504902 ?auto_504903 ?auto_504904 )
      ( MAKE-12PILE ?auto_504896 ?auto_504897 ?auto_504898 ?auto_504899 ?auto_504900 ?auto_504901 ?auto_504902 ?auto_504903 ?auto_504904 ?auto_504905 ?auto_504906 ?auto_504907 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_504946 - BLOCK
      ?auto_504947 - BLOCK
      ?auto_504948 - BLOCK
      ?auto_504949 - BLOCK
      ?auto_504950 - BLOCK
      ?auto_504951 - BLOCK
      ?auto_504952 - BLOCK
      ?auto_504953 - BLOCK
      ?auto_504954 - BLOCK
      ?auto_504955 - BLOCK
      ?auto_504956 - BLOCK
      ?auto_504957 - BLOCK
    )
    :vars
    (
      ?auto_504958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_504957 ?auto_504958 ) ( ON-TABLE ?auto_504946 ) ( ON ?auto_504947 ?auto_504946 ) ( ON ?auto_504948 ?auto_504947 ) ( ON ?auto_504949 ?auto_504948 ) ( ON ?auto_504950 ?auto_504949 ) ( ON ?auto_504951 ?auto_504950 ) ( ON ?auto_504952 ?auto_504951 ) ( not ( = ?auto_504946 ?auto_504947 ) ) ( not ( = ?auto_504946 ?auto_504948 ) ) ( not ( = ?auto_504946 ?auto_504949 ) ) ( not ( = ?auto_504946 ?auto_504950 ) ) ( not ( = ?auto_504946 ?auto_504951 ) ) ( not ( = ?auto_504946 ?auto_504952 ) ) ( not ( = ?auto_504946 ?auto_504953 ) ) ( not ( = ?auto_504946 ?auto_504954 ) ) ( not ( = ?auto_504946 ?auto_504955 ) ) ( not ( = ?auto_504946 ?auto_504956 ) ) ( not ( = ?auto_504946 ?auto_504957 ) ) ( not ( = ?auto_504946 ?auto_504958 ) ) ( not ( = ?auto_504947 ?auto_504948 ) ) ( not ( = ?auto_504947 ?auto_504949 ) ) ( not ( = ?auto_504947 ?auto_504950 ) ) ( not ( = ?auto_504947 ?auto_504951 ) ) ( not ( = ?auto_504947 ?auto_504952 ) ) ( not ( = ?auto_504947 ?auto_504953 ) ) ( not ( = ?auto_504947 ?auto_504954 ) ) ( not ( = ?auto_504947 ?auto_504955 ) ) ( not ( = ?auto_504947 ?auto_504956 ) ) ( not ( = ?auto_504947 ?auto_504957 ) ) ( not ( = ?auto_504947 ?auto_504958 ) ) ( not ( = ?auto_504948 ?auto_504949 ) ) ( not ( = ?auto_504948 ?auto_504950 ) ) ( not ( = ?auto_504948 ?auto_504951 ) ) ( not ( = ?auto_504948 ?auto_504952 ) ) ( not ( = ?auto_504948 ?auto_504953 ) ) ( not ( = ?auto_504948 ?auto_504954 ) ) ( not ( = ?auto_504948 ?auto_504955 ) ) ( not ( = ?auto_504948 ?auto_504956 ) ) ( not ( = ?auto_504948 ?auto_504957 ) ) ( not ( = ?auto_504948 ?auto_504958 ) ) ( not ( = ?auto_504949 ?auto_504950 ) ) ( not ( = ?auto_504949 ?auto_504951 ) ) ( not ( = ?auto_504949 ?auto_504952 ) ) ( not ( = ?auto_504949 ?auto_504953 ) ) ( not ( = ?auto_504949 ?auto_504954 ) ) ( not ( = ?auto_504949 ?auto_504955 ) ) ( not ( = ?auto_504949 ?auto_504956 ) ) ( not ( = ?auto_504949 ?auto_504957 ) ) ( not ( = ?auto_504949 ?auto_504958 ) ) ( not ( = ?auto_504950 ?auto_504951 ) ) ( not ( = ?auto_504950 ?auto_504952 ) ) ( not ( = ?auto_504950 ?auto_504953 ) ) ( not ( = ?auto_504950 ?auto_504954 ) ) ( not ( = ?auto_504950 ?auto_504955 ) ) ( not ( = ?auto_504950 ?auto_504956 ) ) ( not ( = ?auto_504950 ?auto_504957 ) ) ( not ( = ?auto_504950 ?auto_504958 ) ) ( not ( = ?auto_504951 ?auto_504952 ) ) ( not ( = ?auto_504951 ?auto_504953 ) ) ( not ( = ?auto_504951 ?auto_504954 ) ) ( not ( = ?auto_504951 ?auto_504955 ) ) ( not ( = ?auto_504951 ?auto_504956 ) ) ( not ( = ?auto_504951 ?auto_504957 ) ) ( not ( = ?auto_504951 ?auto_504958 ) ) ( not ( = ?auto_504952 ?auto_504953 ) ) ( not ( = ?auto_504952 ?auto_504954 ) ) ( not ( = ?auto_504952 ?auto_504955 ) ) ( not ( = ?auto_504952 ?auto_504956 ) ) ( not ( = ?auto_504952 ?auto_504957 ) ) ( not ( = ?auto_504952 ?auto_504958 ) ) ( not ( = ?auto_504953 ?auto_504954 ) ) ( not ( = ?auto_504953 ?auto_504955 ) ) ( not ( = ?auto_504953 ?auto_504956 ) ) ( not ( = ?auto_504953 ?auto_504957 ) ) ( not ( = ?auto_504953 ?auto_504958 ) ) ( not ( = ?auto_504954 ?auto_504955 ) ) ( not ( = ?auto_504954 ?auto_504956 ) ) ( not ( = ?auto_504954 ?auto_504957 ) ) ( not ( = ?auto_504954 ?auto_504958 ) ) ( not ( = ?auto_504955 ?auto_504956 ) ) ( not ( = ?auto_504955 ?auto_504957 ) ) ( not ( = ?auto_504955 ?auto_504958 ) ) ( not ( = ?auto_504956 ?auto_504957 ) ) ( not ( = ?auto_504956 ?auto_504958 ) ) ( not ( = ?auto_504957 ?auto_504958 ) ) ( ON ?auto_504956 ?auto_504957 ) ( ON ?auto_504955 ?auto_504956 ) ( ON ?auto_504954 ?auto_504955 ) ( CLEAR ?auto_504952 ) ( ON ?auto_504953 ?auto_504954 ) ( CLEAR ?auto_504953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_504946 ?auto_504947 ?auto_504948 ?auto_504949 ?auto_504950 ?auto_504951 ?auto_504952 ?auto_504953 )
      ( MAKE-12PILE ?auto_504946 ?auto_504947 ?auto_504948 ?auto_504949 ?auto_504950 ?auto_504951 ?auto_504952 ?auto_504953 ?auto_504954 ?auto_504955 ?auto_504956 ?auto_504957 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_504996 - BLOCK
      ?auto_504997 - BLOCK
      ?auto_504998 - BLOCK
      ?auto_504999 - BLOCK
      ?auto_505000 - BLOCK
      ?auto_505001 - BLOCK
      ?auto_505002 - BLOCK
      ?auto_505003 - BLOCK
      ?auto_505004 - BLOCK
      ?auto_505005 - BLOCK
      ?auto_505006 - BLOCK
      ?auto_505007 - BLOCK
    )
    :vars
    (
      ?auto_505008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505007 ?auto_505008 ) ( ON-TABLE ?auto_504996 ) ( ON ?auto_504997 ?auto_504996 ) ( ON ?auto_504998 ?auto_504997 ) ( ON ?auto_504999 ?auto_504998 ) ( ON ?auto_505000 ?auto_504999 ) ( ON ?auto_505001 ?auto_505000 ) ( not ( = ?auto_504996 ?auto_504997 ) ) ( not ( = ?auto_504996 ?auto_504998 ) ) ( not ( = ?auto_504996 ?auto_504999 ) ) ( not ( = ?auto_504996 ?auto_505000 ) ) ( not ( = ?auto_504996 ?auto_505001 ) ) ( not ( = ?auto_504996 ?auto_505002 ) ) ( not ( = ?auto_504996 ?auto_505003 ) ) ( not ( = ?auto_504996 ?auto_505004 ) ) ( not ( = ?auto_504996 ?auto_505005 ) ) ( not ( = ?auto_504996 ?auto_505006 ) ) ( not ( = ?auto_504996 ?auto_505007 ) ) ( not ( = ?auto_504996 ?auto_505008 ) ) ( not ( = ?auto_504997 ?auto_504998 ) ) ( not ( = ?auto_504997 ?auto_504999 ) ) ( not ( = ?auto_504997 ?auto_505000 ) ) ( not ( = ?auto_504997 ?auto_505001 ) ) ( not ( = ?auto_504997 ?auto_505002 ) ) ( not ( = ?auto_504997 ?auto_505003 ) ) ( not ( = ?auto_504997 ?auto_505004 ) ) ( not ( = ?auto_504997 ?auto_505005 ) ) ( not ( = ?auto_504997 ?auto_505006 ) ) ( not ( = ?auto_504997 ?auto_505007 ) ) ( not ( = ?auto_504997 ?auto_505008 ) ) ( not ( = ?auto_504998 ?auto_504999 ) ) ( not ( = ?auto_504998 ?auto_505000 ) ) ( not ( = ?auto_504998 ?auto_505001 ) ) ( not ( = ?auto_504998 ?auto_505002 ) ) ( not ( = ?auto_504998 ?auto_505003 ) ) ( not ( = ?auto_504998 ?auto_505004 ) ) ( not ( = ?auto_504998 ?auto_505005 ) ) ( not ( = ?auto_504998 ?auto_505006 ) ) ( not ( = ?auto_504998 ?auto_505007 ) ) ( not ( = ?auto_504998 ?auto_505008 ) ) ( not ( = ?auto_504999 ?auto_505000 ) ) ( not ( = ?auto_504999 ?auto_505001 ) ) ( not ( = ?auto_504999 ?auto_505002 ) ) ( not ( = ?auto_504999 ?auto_505003 ) ) ( not ( = ?auto_504999 ?auto_505004 ) ) ( not ( = ?auto_504999 ?auto_505005 ) ) ( not ( = ?auto_504999 ?auto_505006 ) ) ( not ( = ?auto_504999 ?auto_505007 ) ) ( not ( = ?auto_504999 ?auto_505008 ) ) ( not ( = ?auto_505000 ?auto_505001 ) ) ( not ( = ?auto_505000 ?auto_505002 ) ) ( not ( = ?auto_505000 ?auto_505003 ) ) ( not ( = ?auto_505000 ?auto_505004 ) ) ( not ( = ?auto_505000 ?auto_505005 ) ) ( not ( = ?auto_505000 ?auto_505006 ) ) ( not ( = ?auto_505000 ?auto_505007 ) ) ( not ( = ?auto_505000 ?auto_505008 ) ) ( not ( = ?auto_505001 ?auto_505002 ) ) ( not ( = ?auto_505001 ?auto_505003 ) ) ( not ( = ?auto_505001 ?auto_505004 ) ) ( not ( = ?auto_505001 ?auto_505005 ) ) ( not ( = ?auto_505001 ?auto_505006 ) ) ( not ( = ?auto_505001 ?auto_505007 ) ) ( not ( = ?auto_505001 ?auto_505008 ) ) ( not ( = ?auto_505002 ?auto_505003 ) ) ( not ( = ?auto_505002 ?auto_505004 ) ) ( not ( = ?auto_505002 ?auto_505005 ) ) ( not ( = ?auto_505002 ?auto_505006 ) ) ( not ( = ?auto_505002 ?auto_505007 ) ) ( not ( = ?auto_505002 ?auto_505008 ) ) ( not ( = ?auto_505003 ?auto_505004 ) ) ( not ( = ?auto_505003 ?auto_505005 ) ) ( not ( = ?auto_505003 ?auto_505006 ) ) ( not ( = ?auto_505003 ?auto_505007 ) ) ( not ( = ?auto_505003 ?auto_505008 ) ) ( not ( = ?auto_505004 ?auto_505005 ) ) ( not ( = ?auto_505004 ?auto_505006 ) ) ( not ( = ?auto_505004 ?auto_505007 ) ) ( not ( = ?auto_505004 ?auto_505008 ) ) ( not ( = ?auto_505005 ?auto_505006 ) ) ( not ( = ?auto_505005 ?auto_505007 ) ) ( not ( = ?auto_505005 ?auto_505008 ) ) ( not ( = ?auto_505006 ?auto_505007 ) ) ( not ( = ?auto_505006 ?auto_505008 ) ) ( not ( = ?auto_505007 ?auto_505008 ) ) ( ON ?auto_505006 ?auto_505007 ) ( ON ?auto_505005 ?auto_505006 ) ( ON ?auto_505004 ?auto_505005 ) ( ON ?auto_505003 ?auto_505004 ) ( CLEAR ?auto_505001 ) ( ON ?auto_505002 ?auto_505003 ) ( CLEAR ?auto_505002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_504996 ?auto_504997 ?auto_504998 ?auto_504999 ?auto_505000 ?auto_505001 ?auto_505002 )
      ( MAKE-12PILE ?auto_504996 ?auto_504997 ?auto_504998 ?auto_504999 ?auto_505000 ?auto_505001 ?auto_505002 ?auto_505003 ?auto_505004 ?auto_505005 ?auto_505006 ?auto_505007 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_505046 - BLOCK
      ?auto_505047 - BLOCK
      ?auto_505048 - BLOCK
      ?auto_505049 - BLOCK
      ?auto_505050 - BLOCK
      ?auto_505051 - BLOCK
      ?auto_505052 - BLOCK
      ?auto_505053 - BLOCK
      ?auto_505054 - BLOCK
      ?auto_505055 - BLOCK
      ?auto_505056 - BLOCK
      ?auto_505057 - BLOCK
    )
    :vars
    (
      ?auto_505058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505057 ?auto_505058 ) ( ON-TABLE ?auto_505046 ) ( ON ?auto_505047 ?auto_505046 ) ( ON ?auto_505048 ?auto_505047 ) ( ON ?auto_505049 ?auto_505048 ) ( ON ?auto_505050 ?auto_505049 ) ( not ( = ?auto_505046 ?auto_505047 ) ) ( not ( = ?auto_505046 ?auto_505048 ) ) ( not ( = ?auto_505046 ?auto_505049 ) ) ( not ( = ?auto_505046 ?auto_505050 ) ) ( not ( = ?auto_505046 ?auto_505051 ) ) ( not ( = ?auto_505046 ?auto_505052 ) ) ( not ( = ?auto_505046 ?auto_505053 ) ) ( not ( = ?auto_505046 ?auto_505054 ) ) ( not ( = ?auto_505046 ?auto_505055 ) ) ( not ( = ?auto_505046 ?auto_505056 ) ) ( not ( = ?auto_505046 ?auto_505057 ) ) ( not ( = ?auto_505046 ?auto_505058 ) ) ( not ( = ?auto_505047 ?auto_505048 ) ) ( not ( = ?auto_505047 ?auto_505049 ) ) ( not ( = ?auto_505047 ?auto_505050 ) ) ( not ( = ?auto_505047 ?auto_505051 ) ) ( not ( = ?auto_505047 ?auto_505052 ) ) ( not ( = ?auto_505047 ?auto_505053 ) ) ( not ( = ?auto_505047 ?auto_505054 ) ) ( not ( = ?auto_505047 ?auto_505055 ) ) ( not ( = ?auto_505047 ?auto_505056 ) ) ( not ( = ?auto_505047 ?auto_505057 ) ) ( not ( = ?auto_505047 ?auto_505058 ) ) ( not ( = ?auto_505048 ?auto_505049 ) ) ( not ( = ?auto_505048 ?auto_505050 ) ) ( not ( = ?auto_505048 ?auto_505051 ) ) ( not ( = ?auto_505048 ?auto_505052 ) ) ( not ( = ?auto_505048 ?auto_505053 ) ) ( not ( = ?auto_505048 ?auto_505054 ) ) ( not ( = ?auto_505048 ?auto_505055 ) ) ( not ( = ?auto_505048 ?auto_505056 ) ) ( not ( = ?auto_505048 ?auto_505057 ) ) ( not ( = ?auto_505048 ?auto_505058 ) ) ( not ( = ?auto_505049 ?auto_505050 ) ) ( not ( = ?auto_505049 ?auto_505051 ) ) ( not ( = ?auto_505049 ?auto_505052 ) ) ( not ( = ?auto_505049 ?auto_505053 ) ) ( not ( = ?auto_505049 ?auto_505054 ) ) ( not ( = ?auto_505049 ?auto_505055 ) ) ( not ( = ?auto_505049 ?auto_505056 ) ) ( not ( = ?auto_505049 ?auto_505057 ) ) ( not ( = ?auto_505049 ?auto_505058 ) ) ( not ( = ?auto_505050 ?auto_505051 ) ) ( not ( = ?auto_505050 ?auto_505052 ) ) ( not ( = ?auto_505050 ?auto_505053 ) ) ( not ( = ?auto_505050 ?auto_505054 ) ) ( not ( = ?auto_505050 ?auto_505055 ) ) ( not ( = ?auto_505050 ?auto_505056 ) ) ( not ( = ?auto_505050 ?auto_505057 ) ) ( not ( = ?auto_505050 ?auto_505058 ) ) ( not ( = ?auto_505051 ?auto_505052 ) ) ( not ( = ?auto_505051 ?auto_505053 ) ) ( not ( = ?auto_505051 ?auto_505054 ) ) ( not ( = ?auto_505051 ?auto_505055 ) ) ( not ( = ?auto_505051 ?auto_505056 ) ) ( not ( = ?auto_505051 ?auto_505057 ) ) ( not ( = ?auto_505051 ?auto_505058 ) ) ( not ( = ?auto_505052 ?auto_505053 ) ) ( not ( = ?auto_505052 ?auto_505054 ) ) ( not ( = ?auto_505052 ?auto_505055 ) ) ( not ( = ?auto_505052 ?auto_505056 ) ) ( not ( = ?auto_505052 ?auto_505057 ) ) ( not ( = ?auto_505052 ?auto_505058 ) ) ( not ( = ?auto_505053 ?auto_505054 ) ) ( not ( = ?auto_505053 ?auto_505055 ) ) ( not ( = ?auto_505053 ?auto_505056 ) ) ( not ( = ?auto_505053 ?auto_505057 ) ) ( not ( = ?auto_505053 ?auto_505058 ) ) ( not ( = ?auto_505054 ?auto_505055 ) ) ( not ( = ?auto_505054 ?auto_505056 ) ) ( not ( = ?auto_505054 ?auto_505057 ) ) ( not ( = ?auto_505054 ?auto_505058 ) ) ( not ( = ?auto_505055 ?auto_505056 ) ) ( not ( = ?auto_505055 ?auto_505057 ) ) ( not ( = ?auto_505055 ?auto_505058 ) ) ( not ( = ?auto_505056 ?auto_505057 ) ) ( not ( = ?auto_505056 ?auto_505058 ) ) ( not ( = ?auto_505057 ?auto_505058 ) ) ( ON ?auto_505056 ?auto_505057 ) ( ON ?auto_505055 ?auto_505056 ) ( ON ?auto_505054 ?auto_505055 ) ( ON ?auto_505053 ?auto_505054 ) ( ON ?auto_505052 ?auto_505053 ) ( CLEAR ?auto_505050 ) ( ON ?auto_505051 ?auto_505052 ) ( CLEAR ?auto_505051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_505046 ?auto_505047 ?auto_505048 ?auto_505049 ?auto_505050 ?auto_505051 )
      ( MAKE-12PILE ?auto_505046 ?auto_505047 ?auto_505048 ?auto_505049 ?auto_505050 ?auto_505051 ?auto_505052 ?auto_505053 ?auto_505054 ?auto_505055 ?auto_505056 ?auto_505057 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_505096 - BLOCK
      ?auto_505097 - BLOCK
      ?auto_505098 - BLOCK
      ?auto_505099 - BLOCK
      ?auto_505100 - BLOCK
      ?auto_505101 - BLOCK
      ?auto_505102 - BLOCK
      ?auto_505103 - BLOCK
      ?auto_505104 - BLOCK
      ?auto_505105 - BLOCK
      ?auto_505106 - BLOCK
      ?auto_505107 - BLOCK
    )
    :vars
    (
      ?auto_505108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505107 ?auto_505108 ) ( ON-TABLE ?auto_505096 ) ( ON ?auto_505097 ?auto_505096 ) ( ON ?auto_505098 ?auto_505097 ) ( ON ?auto_505099 ?auto_505098 ) ( not ( = ?auto_505096 ?auto_505097 ) ) ( not ( = ?auto_505096 ?auto_505098 ) ) ( not ( = ?auto_505096 ?auto_505099 ) ) ( not ( = ?auto_505096 ?auto_505100 ) ) ( not ( = ?auto_505096 ?auto_505101 ) ) ( not ( = ?auto_505096 ?auto_505102 ) ) ( not ( = ?auto_505096 ?auto_505103 ) ) ( not ( = ?auto_505096 ?auto_505104 ) ) ( not ( = ?auto_505096 ?auto_505105 ) ) ( not ( = ?auto_505096 ?auto_505106 ) ) ( not ( = ?auto_505096 ?auto_505107 ) ) ( not ( = ?auto_505096 ?auto_505108 ) ) ( not ( = ?auto_505097 ?auto_505098 ) ) ( not ( = ?auto_505097 ?auto_505099 ) ) ( not ( = ?auto_505097 ?auto_505100 ) ) ( not ( = ?auto_505097 ?auto_505101 ) ) ( not ( = ?auto_505097 ?auto_505102 ) ) ( not ( = ?auto_505097 ?auto_505103 ) ) ( not ( = ?auto_505097 ?auto_505104 ) ) ( not ( = ?auto_505097 ?auto_505105 ) ) ( not ( = ?auto_505097 ?auto_505106 ) ) ( not ( = ?auto_505097 ?auto_505107 ) ) ( not ( = ?auto_505097 ?auto_505108 ) ) ( not ( = ?auto_505098 ?auto_505099 ) ) ( not ( = ?auto_505098 ?auto_505100 ) ) ( not ( = ?auto_505098 ?auto_505101 ) ) ( not ( = ?auto_505098 ?auto_505102 ) ) ( not ( = ?auto_505098 ?auto_505103 ) ) ( not ( = ?auto_505098 ?auto_505104 ) ) ( not ( = ?auto_505098 ?auto_505105 ) ) ( not ( = ?auto_505098 ?auto_505106 ) ) ( not ( = ?auto_505098 ?auto_505107 ) ) ( not ( = ?auto_505098 ?auto_505108 ) ) ( not ( = ?auto_505099 ?auto_505100 ) ) ( not ( = ?auto_505099 ?auto_505101 ) ) ( not ( = ?auto_505099 ?auto_505102 ) ) ( not ( = ?auto_505099 ?auto_505103 ) ) ( not ( = ?auto_505099 ?auto_505104 ) ) ( not ( = ?auto_505099 ?auto_505105 ) ) ( not ( = ?auto_505099 ?auto_505106 ) ) ( not ( = ?auto_505099 ?auto_505107 ) ) ( not ( = ?auto_505099 ?auto_505108 ) ) ( not ( = ?auto_505100 ?auto_505101 ) ) ( not ( = ?auto_505100 ?auto_505102 ) ) ( not ( = ?auto_505100 ?auto_505103 ) ) ( not ( = ?auto_505100 ?auto_505104 ) ) ( not ( = ?auto_505100 ?auto_505105 ) ) ( not ( = ?auto_505100 ?auto_505106 ) ) ( not ( = ?auto_505100 ?auto_505107 ) ) ( not ( = ?auto_505100 ?auto_505108 ) ) ( not ( = ?auto_505101 ?auto_505102 ) ) ( not ( = ?auto_505101 ?auto_505103 ) ) ( not ( = ?auto_505101 ?auto_505104 ) ) ( not ( = ?auto_505101 ?auto_505105 ) ) ( not ( = ?auto_505101 ?auto_505106 ) ) ( not ( = ?auto_505101 ?auto_505107 ) ) ( not ( = ?auto_505101 ?auto_505108 ) ) ( not ( = ?auto_505102 ?auto_505103 ) ) ( not ( = ?auto_505102 ?auto_505104 ) ) ( not ( = ?auto_505102 ?auto_505105 ) ) ( not ( = ?auto_505102 ?auto_505106 ) ) ( not ( = ?auto_505102 ?auto_505107 ) ) ( not ( = ?auto_505102 ?auto_505108 ) ) ( not ( = ?auto_505103 ?auto_505104 ) ) ( not ( = ?auto_505103 ?auto_505105 ) ) ( not ( = ?auto_505103 ?auto_505106 ) ) ( not ( = ?auto_505103 ?auto_505107 ) ) ( not ( = ?auto_505103 ?auto_505108 ) ) ( not ( = ?auto_505104 ?auto_505105 ) ) ( not ( = ?auto_505104 ?auto_505106 ) ) ( not ( = ?auto_505104 ?auto_505107 ) ) ( not ( = ?auto_505104 ?auto_505108 ) ) ( not ( = ?auto_505105 ?auto_505106 ) ) ( not ( = ?auto_505105 ?auto_505107 ) ) ( not ( = ?auto_505105 ?auto_505108 ) ) ( not ( = ?auto_505106 ?auto_505107 ) ) ( not ( = ?auto_505106 ?auto_505108 ) ) ( not ( = ?auto_505107 ?auto_505108 ) ) ( ON ?auto_505106 ?auto_505107 ) ( ON ?auto_505105 ?auto_505106 ) ( ON ?auto_505104 ?auto_505105 ) ( ON ?auto_505103 ?auto_505104 ) ( ON ?auto_505102 ?auto_505103 ) ( ON ?auto_505101 ?auto_505102 ) ( CLEAR ?auto_505099 ) ( ON ?auto_505100 ?auto_505101 ) ( CLEAR ?auto_505100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_505096 ?auto_505097 ?auto_505098 ?auto_505099 ?auto_505100 )
      ( MAKE-12PILE ?auto_505096 ?auto_505097 ?auto_505098 ?auto_505099 ?auto_505100 ?auto_505101 ?auto_505102 ?auto_505103 ?auto_505104 ?auto_505105 ?auto_505106 ?auto_505107 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_505146 - BLOCK
      ?auto_505147 - BLOCK
      ?auto_505148 - BLOCK
      ?auto_505149 - BLOCK
      ?auto_505150 - BLOCK
      ?auto_505151 - BLOCK
      ?auto_505152 - BLOCK
      ?auto_505153 - BLOCK
      ?auto_505154 - BLOCK
      ?auto_505155 - BLOCK
      ?auto_505156 - BLOCK
      ?auto_505157 - BLOCK
    )
    :vars
    (
      ?auto_505158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505157 ?auto_505158 ) ( ON-TABLE ?auto_505146 ) ( ON ?auto_505147 ?auto_505146 ) ( ON ?auto_505148 ?auto_505147 ) ( not ( = ?auto_505146 ?auto_505147 ) ) ( not ( = ?auto_505146 ?auto_505148 ) ) ( not ( = ?auto_505146 ?auto_505149 ) ) ( not ( = ?auto_505146 ?auto_505150 ) ) ( not ( = ?auto_505146 ?auto_505151 ) ) ( not ( = ?auto_505146 ?auto_505152 ) ) ( not ( = ?auto_505146 ?auto_505153 ) ) ( not ( = ?auto_505146 ?auto_505154 ) ) ( not ( = ?auto_505146 ?auto_505155 ) ) ( not ( = ?auto_505146 ?auto_505156 ) ) ( not ( = ?auto_505146 ?auto_505157 ) ) ( not ( = ?auto_505146 ?auto_505158 ) ) ( not ( = ?auto_505147 ?auto_505148 ) ) ( not ( = ?auto_505147 ?auto_505149 ) ) ( not ( = ?auto_505147 ?auto_505150 ) ) ( not ( = ?auto_505147 ?auto_505151 ) ) ( not ( = ?auto_505147 ?auto_505152 ) ) ( not ( = ?auto_505147 ?auto_505153 ) ) ( not ( = ?auto_505147 ?auto_505154 ) ) ( not ( = ?auto_505147 ?auto_505155 ) ) ( not ( = ?auto_505147 ?auto_505156 ) ) ( not ( = ?auto_505147 ?auto_505157 ) ) ( not ( = ?auto_505147 ?auto_505158 ) ) ( not ( = ?auto_505148 ?auto_505149 ) ) ( not ( = ?auto_505148 ?auto_505150 ) ) ( not ( = ?auto_505148 ?auto_505151 ) ) ( not ( = ?auto_505148 ?auto_505152 ) ) ( not ( = ?auto_505148 ?auto_505153 ) ) ( not ( = ?auto_505148 ?auto_505154 ) ) ( not ( = ?auto_505148 ?auto_505155 ) ) ( not ( = ?auto_505148 ?auto_505156 ) ) ( not ( = ?auto_505148 ?auto_505157 ) ) ( not ( = ?auto_505148 ?auto_505158 ) ) ( not ( = ?auto_505149 ?auto_505150 ) ) ( not ( = ?auto_505149 ?auto_505151 ) ) ( not ( = ?auto_505149 ?auto_505152 ) ) ( not ( = ?auto_505149 ?auto_505153 ) ) ( not ( = ?auto_505149 ?auto_505154 ) ) ( not ( = ?auto_505149 ?auto_505155 ) ) ( not ( = ?auto_505149 ?auto_505156 ) ) ( not ( = ?auto_505149 ?auto_505157 ) ) ( not ( = ?auto_505149 ?auto_505158 ) ) ( not ( = ?auto_505150 ?auto_505151 ) ) ( not ( = ?auto_505150 ?auto_505152 ) ) ( not ( = ?auto_505150 ?auto_505153 ) ) ( not ( = ?auto_505150 ?auto_505154 ) ) ( not ( = ?auto_505150 ?auto_505155 ) ) ( not ( = ?auto_505150 ?auto_505156 ) ) ( not ( = ?auto_505150 ?auto_505157 ) ) ( not ( = ?auto_505150 ?auto_505158 ) ) ( not ( = ?auto_505151 ?auto_505152 ) ) ( not ( = ?auto_505151 ?auto_505153 ) ) ( not ( = ?auto_505151 ?auto_505154 ) ) ( not ( = ?auto_505151 ?auto_505155 ) ) ( not ( = ?auto_505151 ?auto_505156 ) ) ( not ( = ?auto_505151 ?auto_505157 ) ) ( not ( = ?auto_505151 ?auto_505158 ) ) ( not ( = ?auto_505152 ?auto_505153 ) ) ( not ( = ?auto_505152 ?auto_505154 ) ) ( not ( = ?auto_505152 ?auto_505155 ) ) ( not ( = ?auto_505152 ?auto_505156 ) ) ( not ( = ?auto_505152 ?auto_505157 ) ) ( not ( = ?auto_505152 ?auto_505158 ) ) ( not ( = ?auto_505153 ?auto_505154 ) ) ( not ( = ?auto_505153 ?auto_505155 ) ) ( not ( = ?auto_505153 ?auto_505156 ) ) ( not ( = ?auto_505153 ?auto_505157 ) ) ( not ( = ?auto_505153 ?auto_505158 ) ) ( not ( = ?auto_505154 ?auto_505155 ) ) ( not ( = ?auto_505154 ?auto_505156 ) ) ( not ( = ?auto_505154 ?auto_505157 ) ) ( not ( = ?auto_505154 ?auto_505158 ) ) ( not ( = ?auto_505155 ?auto_505156 ) ) ( not ( = ?auto_505155 ?auto_505157 ) ) ( not ( = ?auto_505155 ?auto_505158 ) ) ( not ( = ?auto_505156 ?auto_505157 ) ) ( not ( = ?auto_505156 ?auto_505158 ) ) ( not ( = ?auto_505157 ?auto_505158 ) ) ( ON ?auto_505156 ?auto_505157 ) ( ON ?auto_505155 ?auto_505156 ) ( ON ?auto_505154 ?auto_505155 ) ( ON ?auto_505153 ?auto_505154 ) ( ON ?auto_505152 ?auto_505153 ) ( ON ?auto_505151 ?auto_505152 ) ( ON ?auto_505150 ?auto_505151 ) ( CLEAR ?auto_505148 ) ( ON ?auto_505149 ?auto_505150 ) ( CLEAR ?auto_505149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_505146 ?auto_505147 ?auto_505148 ?auto_505149 )
      ( MAKE-12PILE ?auto_505146 ?auto_505147 ?auto_505148 ?auto_505149 ?auto_505150 ?auto_505151 ?auto_505152 ?auto_505153 ?auto_505154 ?auto_505155 ?auto_505156 ?auto_505157 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_505196 - BLOCK
      ?auto_505197 - BLOCK
      ?auto_505198 - BLOCK
      ?auto_505199 - BLOCK
      ?auto_505200 - BLOCK
      ?auto_505201 - BLOCK
      ?auto_505202 - BLOCK
      ?auto_505203 - BLOCK
      ?auto_505204 - BLOCK
      ?auto_505205 - BLOCK
      ?auto_505206 - BLOCK
      ?auto_505207 - BLOCK
    )
    :vars
    (
      ?auto_505208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505207 ?auto_505208 ) ( ON-TABLE ?auto_505196 ) ( ON ?auto_505197 ?auto_505196 ) ( not ( = ?auto_505196 ?auto_505197 ) ) ( not ( = ?auto_505196 ?auto_505198 ) ) ( not ( = ?auto_505196 ?auto_505199 ) ) ( not ( = ?auto_505196 ?auto_505200 ) ) ( not ( = ?auto_505196 ?auto_505201 ) ) ( not ( = ?auto_505196 ?auto_505202 ) ) ( not ( = ?auto_505196 ?auto_505203 ) ) ( not ( = ?auto_505196 ?auto_505204 ) ) ( not ( = ?auto_505196 ?auto_505205 ) ) ( not ( = ?auto_505196 ?auto_505206 ) ) ( not ( = ?auto_505196 ?auto_505207 ) ) ( not ( = ?auto_505196 ?auto_505208 ) ) ( not ( = ?auto_505197 ?auto_505198 ) ) ( not ( = ?auto_505197 ?auto_505199 ) ) ( not ( = ?auto_505197 ?auto_505200 ) ) ( not ( = ?auto_505197 ?auto_505201 ) ) ( not ( = ?auto_505197 ?auto_505202 ) ) ( not ( = ?auto_505197 ?auto_505203 ) ) ( not ( = ?auto_505197 ?auto_505204 ) ) ( not ( = ?auto_505197 ?auto_505205 ) ) ( not ( = ?auto_505197 ?auto_505206 ) ) ( not ( = ?auto_505197 ?auto_505207 ) ) ( not ( = ?auto_505197 ?auto_505208 ) ) ( not ( = ?auto_505198 ?auto_505199 ) ) ( not ( = ?auto_505198 ?auto_505200 ) ) ( not ( = ?auto_505198 ?auto_505201 ) ) ( not ( = ?auto_505198 ?auto_505202 ) ) ( not ( = ?auto_505198 ?auto_505203 ) ) ( not ( = ?auto_505198 ?auto_505204 ) ) ( not ( = ?auto_505198 ?auto_505205 ) ) ( not ( = ?auto_505198 ?auto_505206 ) ) ( not ( = ?auto_505198 ?auto_505207 ) ) ( not ( = ?auto_505198 ?auto_505208 ) ) ( not ( = ?auto_505199 ?auto_505200 ) ) ( not ( = ?auto_505199 ?auto_505201 ) ) ( not ( = ?auto_505199 ?auto_505202 ) ) ( not ( = ?auto_505199 ?auto_505203 ) ) ( not ( = ?auto_505199 ?auto_505204 ) ) ( not ( = ?auto_505199 ?auto_505205 ) ) ( not ( = ?auto_505199 ?auto_505206 ) ) ( not ( = ?auto_505199 ?auto_505207 ) ) ( not ( = ?auto_505199 ?auto_505208 ) ) ( not ( = ?auto_505200 ?auto_505201 ) ) ( not ( = ?auto_505200 ?auto_505202 ) ) ( not ( = ?auto_505200 ?auto_505203 ) ) ( not ( = ?auto_505200 ?auto_505204 ) ) ( not ( = ?auto_505200 ?auto_505205 ) ) ( not ( = ?auto_505200 ?auto_505206 ) ) ( not ( = ?auto_505200 ?auto_505207 ) ) ( not ( = ?auto_505200 ?auto_505208 ) ) ( not ( = ?auto_505201 ?auto_505202 ) ) ( not ( = ?auto_505201 ?auto_505203 ) ) ( not ( = ?auto_505201 ?auto_505204 ) ) ( not ( = ?auto_505201 ?auto_505205 ) ) ( not ( = ?auto_505201 ?auto_505206 ) ) ( not ( = ?auto_505201 ?auto_505207 ) ) ( not ( = ?auto_505201 ?auto_505208 ) ) ( not ( = ?auto_505202 ?auto_505203 ) ) ( not ( = ?auto_505202 ?auto_505204 ) ) ( not ( = ?auto_505202 ?auto_505205 ) ) ( not ( = ?auto_505202 ?auto_505206 ) ) ( not ( = ?auto_505202 ?auto_505207 ) ) ( not ( = ?auto_505202 ?auto_505208 ) ) ( not ( = ?auto_505203 ?auto_505204 ) ) ( not ( = ?auto_505203 ?auto_505205 ) ) ( not ( = ?auto_505203 ?auto_505206 ) ) ( not ( = ?auto_505203 ?auto_505207 ) ) ( not ( = ?auto_505203 ?auto_505208 ) ) ( not ( = ?auto_505204 ?auto_505205 ) ) ( not ( = ?auto_505204 ?auto_505206 ) ) ( not ( = ?auto_505204 ?auto_505207 ) ) ( not ( = ?auto_505204 ?auto_505208 ) ) ( not ( = ?auto_505205 ?auto_505206 ) ) ( not ( = ?auto_505205 ?auto_505207 ) ) ( not ( = ?auto_505205 ?auto_505208 ) ) ( not ( = ?auto_505206 ?auto_505207 ) ) ( not ( = ?auto_505206 ?auto_505208 ) ) ( not ( = ?auto_505207 ?auto_505208 ) ) ( ON ?auto_505206 ?auto_505207 ) ( ON ?auto_505205 ?auto_505206 ) ( ON ?auto_505204 ?auto_505205 ) ( ON ?auto_505203 ?auto_505204 ) ( ON ?auto_505202 ?auto_505203 ) ( ON ?auto_505201 ?auto_505202 ) ( ON ?auto_505200 ?auto_505201 ) ( ON ?auto_505199 ?auto_505200 ) ( CLEAR ?auto_505197 ) ( ON ?auto_505198 ?auto_505199 ) ( CLEAR ?auto_505198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_505196 ?auto_505197 ?auto_505198 )
      ( MAKE-12PILE ?auto_505196 ?auto_505197 ?auto_505198 ?auto_505199 ?auto_505200 ?auto_505201 ?auto_505202 ?auto_505203 ?auto_505204 ?auto_505205 ?auto_505206 ?auto_505207 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_505246 - BLOCK
      ?auto_505247 - BLOCK
      ?auto_505248 - BLOCK
      ?auto_505249 - BLOCK
      ?auto_505250 - BLOCK
      ?auto_505251 - BLOCK
      ?auto_505252 - BLOCK
      ?auto_505253 - BLOCK
      ?auto_505254 - BLOCK
      ?auto_505255 - BLOCK
      ?auto_505256 - BLOCK
      ?auto_505257 - BLOCK
    )
    :vars
    (
      ?auto_505258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505257 ?auto_505258 ) ( ON-TABLE ?auto_505246 ) ( not ( = ?auto_505246 ?auto_505247 ) ) ( not ( = ?auto_505246 ?auto_505248 ) ) ( not ( = ?auto_505246 ?auto_505249 ) ) ( not ( = ?auto_505246 ?auto_505250 ) ) ( not ( = ?auto_505246 ?auto_505251 ) ) ( not ( = ?auto_505246 ?auto_505252 ) ) ( not ( = ?auto_505246 ?auto_505253 ) ) ( not ( = ?auto_505246 ?auto_505254 ) ) ( not ( = ?auto_505246 ?auto_505255 ) ) ( not ( = ?auto_505246 ?auto_505256 ) ) ( not ( = ?auto_505246 ?auto_505257 ) ) ( not ( = ?auto_505246 ?auto_505258 ) ) ( not ( = ?auto_505247 ?auto_505248 ) ) ( not ( = ?auto_505247 ?auto_505249 ) ) ( not ( = ?auto_505247 ?auto_505250 ) ) ( not ( = ?auto_505247 ?auto_505251 ) ) ( not ( = ?auto_505247 ?auto_505252 ) ) ( not ( = ?auto_505247 ?auto_505253 ) ) ( not ( = ?auto_505247 ?auto_505254 ) ) ( not ( = ?auto_505247 ?auto_505255 ) ) ( not ( = ?auto_505247 ?auto_505256 ) ) ( not ( = ?auto_505247 ?auto_505257 ) ) ( not ( = ?auto_505247 ?auto_505258 ) ) ( not ( = ?auto_505248 ?auto_505249 ) ) ( not ( = ?auto_505248 ?auto_505250 ) ) ( not ( = ?auto_505248 ?auto_505251 ) ) ( not ( = ?auto_505248 ?auto_505252 ) ) ( not ( = ?auto_505248 ?auto_505253 ) ) ( not ( = ?auto_505248 ?auto_505254 ) ) ( not ( = ?auto_505248 ?auto_505255 ) ) ( not ( = ?auto_505248 ?auto_505256 ) ) ( not ( = ?auto_505248 ?auto_505257 ) ) ( not ( = ?auto_505248 ?auto_505258 ) ) ( not ( = ?auto_505249 ?auto_505250 ) ) ( not ( = ?auto_505249 ?auto_505251 ) ) ( not ( = ?auto_505249 ?auto_505252 ) ) ( not ( = ?auto_505249 ?auto_505253 ) ) ( not ( = ?auto_505249 ?auto_505254 ) ) ( not ( = ?auto_505249 ?auto_505255 ) ) ( not ( = ?auto_505249 ?auto_505256 ) ) ( not ( = ?auto_505249 ?auto_505257 ) ) ( not ( = ?auto_505249 ?auto_505258 ) ) ( not ( = ?auto_505250 ?auto_505251 ) ) ( not ( = ?auto_505250 ?auto_505252 ) ) ( not ( = ?auto_505250 ?auto_505253 ) ) ( not ( = ?auto_505250 ?auto_505254 ) ) ( not ( = ?auto_505250 ?auto_505255 ) ) ( not ( = ?auto_505250 ?auto_505256 ) ) ( not ( = ?auto_505250 ?auto_505257 ) ) ( not ( = ?auto_505250 ?auto_505258 ) ) ( not ( = ?auto_505251 ?auto_505252 ) ) ( not ( = ?auto_505251 ?auto_505253 ) ) ( not ( = ?auto_505251 ?auto_505254 ) ) ( not ( = ?auto_505251 ?auto_505255 ) ) ( not ( = ?auto_505251 ?auto_505256 ) ) ( not ( = ?auto_505251 ?auto_505257 ) ) ( not ( = ?auto_505251 ?auto_505258 ) ) ( not ( = ?auto_505252 ?auto_505253 ) ) ( not ( = ?auto_505252 ?auto_505254 ) ) ( not ( = ?auto_505252 ?auto_505255 ) ) ( not ( = ?auto_505252 ?auto_505256 ) ) ( not ( = ?auto_505252 ?auto_505257 ) ) ( not ( = ?auto_505252 ?auto_505258 ) ) ( not ( = ?auto_505253 ?auto_505254 ) ) ( not ( = ?auto_505253 ?auto_505255 ) ) ( not ( = ?auto_505253 ?auto_505256 ) ) ( not ( = ?auto_505253 ?auto_505257 ) ) ( not ( = ?auto_505253 ?auto_505258 ) ) ( not ( = ?auto_505254 ?auto_505255 ) ) ( not ( = ?auto_505254 ?auto_505256 ) ) ( not ( = ?auto_505254 ?auto_505257 ) ) ( not ( = ?auto_505254 ?auto_505258 ) ) ( not ( = ?auto_505255 ?auto_505256 ) ) ( not ( = ?auto_505255 ?auto_505257 ) ) ( not ( = ?auto_505255 ?auto_505258 ) ) ( not ( = ?auto_505256 ?auto_505257 ) ) ( not ( = ?auto_505256 ?auto_505258 ) ) ( not ( = ?auto_505257 ?auto_505258 ) ) ( ON ?auto_505256 ?auto_505257 ) ( ON ?auto_505255 ?auto_505256 ) ( ON ?auto_505254 ?auto_505255 ) ( ON ?auto_505253 ?auto_505254 ) ( ON ?auto_505252 ?auto_505253 ) ( ON ?auto_505251 ?auto_505252 ) ( ON ?auto_505250 ?auto_505251 ) ( ON ?auto_505249 ?auto_505250 ) ( ON ?auto_505248 ?auto_505249 ) ( CLEAR ?auto_505246 ) ( ON ?auto_505247 ?auto_505248 ) ( CLEAR ?auto_505247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_505246 ?auto_505247 )
      ( MAKE-12PILE ?auto_505246 ?auto_505247 ?auto_505248 ?auto_505249 ?auto_505250 ?auto_505251 ?auto_505252 ?auto_505253 ?auto_505254 ?auto_505255 ?auto_505256 ?auto_505257 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_505296 - BLOCK
      ?auto_505297 - BLOCK
      ?auto_505298 - BLOCK
      ?auto_505299 - BLOCK
      ?auto_505300 - BLOCK
      ?auto_505301 - BLOCK
      ?auto_505302 - BLOCK
      ?auto_505303 - BLOCK
      ?auto_505304 - BLOCK
      ?auto_505305 - BLOCK
      ?auto_505306 - BLOCK
      ?auto_505307 - BLOCK
    )
    :vars
    (
      ?auto_505308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505307 ?auto_505308 ) ( not ( = ?auto_505296 ?auto_505297 ) ) ( not ( = ?auto_505296 ?auto_505298 ) ) ( not ( = ?auto_505296 ?auto_505299 ) ) ( not ( = ?auto_505296 ?auto_505300 ) ) ( not ( = ?auto_505296 ?auto_505301 ) ) ( not ( = ?auto_505296 ?auto_505302 ) ) ( not ( = ?auto_505296 ?auto_505303 ) ) ( not ( = ?auto_505296 ?auto_505304 ) ) ( not ( = ?auto_505296 ?auto_505305 ) ) ( not ( = ?auto_505296 ?auto_505306 ) ) ( not ( = ?auto_505296 ?auto_505307 ) ) ( not ( = ?auto_505296 ?auto_505308 ) ) ( not ( = ?auto_505297 ?auto_505298 ) ) ( not ( = ?auto_505297 ?auto_505299 ) ) ( not ( = ?auto_505297 ?auto_505300 ) ) ( not ( = ?auto_505297 ?auto_505301 ) ) ( not ( = ?auto_505297 ?auto_505302 ) ) ( not ( = ?auto_505297 ?auto_505303 ) ) ( not ( = ?auto_505297 ?auto_505304 ) ) ( not ( = ?auto_505297 ?auto_505305 ) ) ( not ( = ?auto_505297 ?auto_505306 ) ) ( not ( = ?auto_505297 ?auto_505307 ) ) ( not ( = ?auto_505297 ?auto_505308 ) ) ( not ( = ?auto_505298 ?auto_505299 ) ) ( not ( = ?auto_505298 ?auto_505300 ) ) ( not ( = ?auto_505298 ?auto_505301 ) ) ( not ( = ?auto_505298 ?auto_505302 ) ) ( not ( = ?auto_505298 ?auto_505303 ) ) ( not ( = ?auto_505298 ?auto_505304 ) ) ( not ( = ?auto_505298 ?auto_505305 ) ) ( not ( = ?auto_505298 ?auto_505306 ) ) ( not ( = ?auto_505298 ?auto_505307 ) ) ( not ( = ?auto_505298 ?auto_505308 ) ) ( not ( = ?auto_505299 ?auto_505300 ) ) ( not ( = ?auto_505299 ?auto_505301 ) ) ( not ( = ?auto_505299 ?auto_505302 ) ) ( not ( = ?auto_505299 ?auto_505303 ) ) ( not ( = ?auto_505299 ?auto_505304 ) ) ( not ( = ?auto_505299 ?auto_505305 ) ) ( not ( = ?auto_505299 ?auto_505306 ) ) ( not ( = ?auto_505299 ?auto_505307 ) ) ( not ( = ?auto_505299 ?auto_505308 ) ) ( not ( = ?auto_505300 ?auto_505301 ) ) ( not ( = ?auto_505300 ?auto_505302 ) ) ( not ( = ?auto_505300 ?auto_505303 ) ) ( not ( = ?auto_505300 ?auto_505304 ) ) ( not ( = ?auto_505300 ?auto_505305 ) ) ( not ( = ?auto_505300 ?auto_505306 ) ) ( not ( = ?auto_505300 ?auto_505307 ) ) ( not ( = ?auto_505300 ?auto_505308 ) ) ( not ( = ?auto_505301 ?auto_505302 ) ) ( not ( = ?auto_505301 ?auto_505303 ) ) ( not ( = ?auto_505301 ?auto_505304 ) ) ( not ( = ?auto_505301 ?auto_505305 ) ) ( not ( = ?auto_505301 ?auto_505306 ) ) ( not ( = ?auto_505301 ?auto_505307 ) ) ( not ( = ?auto_505301 ?auto_505308 ) ) ( not ( = ?auto_505302 ?auto_505303 ) ) ( not ( = ?auto_505302 ?auto_505304 ) ) ( not ( = ?auto_505302 ?auto_505305 ) ) ( not ( = ?auto_505302 ?auto_505306 ) ) ( not ( = ?auto_505302 ?auto_505307 ) ) ( not ( = ?auto_505302 ?auto_505308 ) ) ( not ( = ?auto_505303 ?auto_505304 ) ) ( not ( = ?auto_505303 ?auto_505305 ) ) ( not ( = ?auto_505303 ?auto_505306 ) ) ( not ( = ?auto_505303 ?auto_505307 ) ) ( not ( = ?auto_505303 ?auto_505308 ) ) ( not ( = ?auto_505304 ?auto_505305 ) ) ( not ( = ?auto_505304 ?auto_505306 ) ) ( not ( = ?auto_505304 ?auto_505307 ) ) ( not ( = ?auto_505304 ?auto_505308 ) ) ( not ( = ?auto_505305 ?auto_505306 ) ) ( not ( = ?auto_505305 ?auto_505307 ) ) ( not ( = ?auto_505305 ?auto_505308 ) ) ( not ( = ?auto_505306 ?auto_505307 ) ) ( not ( = ?auto_505306 ?auto_505308 ) ) ( not ( = ?auto_505307 ?auto_505308 ) ) ( ON ?auto_505306 ?auto_505307 ) ( ON ?auto_505305 ?auto_505306 ) ( ON ?auto_505304 ?auto_505305 ) ( ON ?auto_505303 ?auto_505304 ) ( ON ?auto_505302 ?auto_505303 ) ( ON ?auto_505301 ?auto_505302 ) ( ON ?auto_505300 ?auto_505301 ) ( ON ?auto_505299 ?auto_505300 ) ( ON ?auto_505298 ?auto_505299 ) ( ON ?auto_505297 ?auto_505298 ) ( ON ?auto_505296 ?auto_505297 ) ( CLEAR ?auto_505296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_505296 )
      ( MAKE-12PILE ?auto_505296 ?auto_505297 ?auto_505298 ?auto_505299 ?auto_505300 ?auto_505301 ?auto_505302 ?auto_505303 ?auto_505304 ?auto_505305 ?auto_505306 ?auto_505307 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505347 - BLOCK
      ?auto_505348 - BLOCK
      ?auto_505349 - BLOCK
      ?auto_505350 - BLOCK
      ?auto_505351 - BLOCK
      ?auto_505352 - BLOCK
      ?auto_505353 - BLOCK
      ?auto_505354 - BLOCK
      ?auto_505355 - BLOCK
      ?auto_505356 - BLOCK
      ?auto_505357 - BLOCK
      ?auto_505358 - BLOCK
      ?auto_505359 - BLOCK
    )
    :vars
    (
      ?auto_505360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_505358 ) ( ON ?auto_505359 ?auto_505360 ) ( CLEAR ?auto_505359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_505347 ) ( ON ?auto_505348 ?auto_505347 ) ( ON ?auto_505349 ?auto_505348 ) ( ON ?auto_505350 ?auto_505349 ) ( ON ?auto_505351 ?auto_505350 ) ( ON ?auto_505352 ?auto_505351 ) ( ON ?auto_505353 ?auto_505352 ) ( ON ?auto_505354 ?auto_505353 ) ( ON ?auto_505355 ?auto_505354 ) ( ON ?auto_505356 ?auto_505355 ) ( ON ?auto_505357 ?auto_505356 ) ( ON ?auto_505358 ?auto_505357 ) ( not ( = ?auto_505347 ?auto_505348 ) ) ( not ( = ?auto_505347 ?auto_505349 ) ) ( not ( = ?auto_505347 ?auto_505350 ) ) ( not ( = ?auto_505347 ?auto_505351 ) ) ( not ( = ?auto_505347 ?auto_505352 ) ) ( not ( = ?auto_505347 ?auto_505353 ) ) ( not ( = ?auto_505347 ?auto_505354 ) ) ( not ( = ?auto_505347 ?auto_505355 ) ) ( not ( = ?auto_505347 ?auto_505356 ) ) ( not ( = ?auto_505347 ?auto_505357 ) ) ( not ( = ?auto_505347 ?auto_505358 ) ) ( not ( = ?auto_505347 ?auto_505359 ) ) ( not ( = ?auto_505347 ?auto_505360 ) ) ( not ( = ?auto_505348 ?auto_505349 ) ) ( not ( = ?auto_505348 ?auto_505350 ) ) ( not ( = ?auto_505348 ?auto_505351 ) ) ( not ( = ?auto_505348 ?auto_505352 ) ) ( not ( = ?auto_505348 ?auto_505353 ) ) ( not ( = ?auto_505348 ?auto_505354 ) ) ( not ( = ?auto_505348 ?auto_505355 ) ) ( not ( = ?auto_505348 ?auto_505356 ) ) ( not ( = ?auto_505348 ?auto_505357 ) ) ( not ( = ?auto_505348 ?auto_505358 ) ) ( not ( = ?auto_505348 ?auto_505359 ) ) ( not ( = ?auto_505348 ?auto_505360 ) ) ( not ( = ?auto_505349 ?auto_505350 ) ) ( not ( = ?auto_505349 ?auto_505351 ) ) ( not ( = ?auto_505349 ?auto_505352 ) ) ( not ( = ?auto_505349 ?auto_505353 ) ) ( not ( = ?auto_505349 ?auto_505354 ) ) ( not ( = ?auto_505349 ?auto_505355 ) ) ( not ( = ?auto_505349 ?auto_505356 ) ) ( not ( = ?auto_505349 ?auto_505357 ) ) ( not ( = ?auto_505349 ?auto_505358 ) ) ( not ( = ?auto_505349 ?auto_505359 ) ) ( not ( = ?auto_505349 ?auto_505360 ) ) ( not ( = ?auto_505350 ?auto_505351 ) ) ( not ( = ?auto_505350 ?auto_505352 ) ) ( not ( = ?auto_505350 ?auto_505353 ) ) ( not ( = ?auto_505350 ?auto_505354 ) ) ( not ( = ?auto_505350 ?auto_505355 ) ) ( not ( = ?auto_505350 ?auto_505356 ) ) ( not ( = ?auto_505350 ?auto_505357 ) ) ( not ( = ?auto_505350 ?auto_505358 ) ) ( not ( = ?auto_505350 ?auto_505359 ) ) ( not ( = ?auto_505350 ?auto_505360 ) ) ( not ( = ?auto_505351 ?auto_505352 ) ) ( not ( = ?auto_505351 ?auto_505353 ) ) ( not ( = ?auto_505351 ?auto_505354 ) ) ( not ( = ?auto_505351 ?auto_505355 ) ) ( not ( = ?auto_505351 ?auto_505356 ) ) ( not ( = ?auto_505351 ?auto_505357 ) ) ( not ( = ?auto_505351 ?auto_505358 ) ) ( not ( = ?auto_505351 ?auto_505359 ) ) ( not ( = ?auto_505351 ?auto_505360 ) ) ( not ( = ?auto_505352 ?auto_505353 ) ) ( not ( = ?auto_505352 ?auto_505354 ) ) ( not ( = ?auto_505352 ?auto_505355 ) ) ( not ( = ?auto_505352 ?auto_505356 ) ) ( not ( = ?auto_505352 ?auto_505357 ) ) ( not ( = ?auto_505352 ?auto_505358 ) ) ( not ( = ?auto_505352 ?auto_505359 ) ) ( not ( = ?auto_505352 ?auto_505360 ) ) ( not ( = ?auto_505353 ?auto_505354 ) ) ( not ( = ?auto_505353 ?auto_505355 ) ) ( not ( = ?auto_505353 ?auto_505356 ) ) ( not ( = ?auto_505353 ?auto_505357 ) ) ( not ( = ?auto_505353 ?auto_505358 ) ) ( not ( = ?auto_505353 ?auto_505359 ) ) ( not ( = ?auto_505353 ?auto_505360 ) ) ( not ( = ?auto_505354 ?auto_505355 ) ) ( not ( = ?auto_505354 ?auto_505356 ) ) ( not ( = ?auto_505354 ?auto_505357 ) ) ( not ( = ?auto_505354 ?auto_505358 ) ) ( not ( = ?auto_505354 ?auto_505359 ) ) ( not ( = ?auto_505354 ?auto_505360 ) ) ( not ( = ?auto_505355 ?auto_505356 ) ) ( not ( = ?auto_505355 ?auto_505357 ) ) ( not ( = ?auto_505355 ?auto_505358 ) ) ( not ( = ?auto_505355 ?auto_505359 ) ) ( not ( = ?auto_505355 ?auto_505360 ) ) ( not ( = ?auto_505356 ?auto_505357 ) ) ( not ( = ?auto_505356 ?auto_505358 ) ) ( not ( = ?auto_505356 ?auto_505359 ) ) ( not ( = ?auto_505356 ?auto_505360 ) ) ( not ( = ?auto_505357 ?auto_505358 ) ) ( not ( = ?auto_505357 ?auto_505359 ) ) ( not ( = ?auto_505357 ?auto_505360 ) ) ( not ( = ?auto_505358 ?auto_505359 ) ) ( not ( = ?auto_505358 ?auto_505360 ) ) ( not ( = ?auto_505359 ?auto_505360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_505359 ?auto_505360 )
      ( !STACK ?auto_505359 ?auto_505358 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505401 - BLOCK
      ?auto_505402 - BLOCK
      ?auto_505403 - BLOCK
      ?auto_505404 - BLOCK
      ?auto_505405 - BLOCK
      ?auto_505406 - BLOCK
      ?auto_505407 - BLOCK
      ?auto_505408 - BLOCK
      ?auto_505409 - BLOCK
      ?auto_505410 - BLOCK
      ?auto_505411 - BLOCK
      ?auto_505412 - BLOCK
      ?auto_505413 - BLOCK
    )
    :vars
    (
      ?auto_505414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505413 ?auto_505414 ) ( ON-TABLE ?auto_505401 ) ( ON ?auto_505402 ?auto_505401 ) ( ON ?auto_505403 ?auto_505402 ) ( ON ?auto_505404 ?auto_505403 ) ( ON ?auto_505405 ?auto_505404 ) ( ON ?auto_505406 ?auto_505405 ) ( ON ?auto_505407 ?auto_505406 ) ( ON ?auto_505408 ?auto_505407 ) ( ON ?auto_505409 ?auto_505408 ) ( ON ?auto_505410 ?auto_505409 ) ( ON ?auto_505411 ?auto_505410 ) ( not ( = ?auto_505401 ?auto_505402 ) ) ( not ( = ?auto_505401 ?auto_505403 ) ) ( not ( = ?auto_505401 ?auto_505404 ) ) ( not ( = ?auto_505401 ?auto_505405 ) ) ( not ( = ?auto_505401 ?auto_505406 ) ) ( not ( = ?auto_505401 ?auto_505407 ) ) ( not ( = ?auto_505401 ?auto_505408 ) ) ( not ( = ?auto_505401 ?auto_505409 ) ) ( not ( = ?auto_505401 ?auto_505410 ) ) ( not ( = ?auto_505401 ?auto_505411 ) ) ( not ( = ?auto_505401 ?auto_505412 ) ) ( not ( = ?auto_505401 ?auto_505413 ) ) ( not ( = ?auto_505401 ?auto_505414 ) ) ( not ( = ?auto_505402 ?auto_505403 ) ) ( not ( = ?auto_505402 ?auto_505404 ) ) ( not ( = ?auto_505402 ?auto_505405 ) ) ( not ( = ?auto_505402 ?auto_505406 ) ) ( not ( = ?auto_505402 ?auto_505407 ) ) ( not ( = ?auto_505402 ?auto_505408 ) ) ( not ( = ?auto_505402 ?auto_505409 ) ) ( not ( = ?auto_505402 ?auto_505410 ) ) ( not ( = ?auto_505402 ?auto_505411 ) ) ( not ( = ?auto_505402 ?auto_505412 ) ) ( not ( = ?auto_505402 ?auto_505413 ) ) ( not ( = ?auto_505402 ?auto_505414 ) ) ( not ( = ?auto_505403 ?auto_505404 ) ) ( not ( = ?auto_505403 ?auto_505405 ) ) ( not ( = ?auto_505403 ?auto_505406 ) ) ( not ( = ?auto_505403 ?auto_505407 ) ) ( not ( = ?auto_505403 ?auto_505408 ) ) ( not ( = ?auto_505403 ?auto_505409 ) ) ( not ( = ?auto_505403 ?auto_505410 ) ) ( not ( = ?auto_505403 ?auto_505411 ) ) ( not ( = ?auto_505403 ?auto_505412 ) ) ( not ( = ?auto_505403 ?auto_505413 ) ) ( not ( = ?auto_505403 ?auto_505414 ) ) ( not ( = ?auto_505404 ?auto_505405 ) ) ( not ( = ?auto_505404 ?auto_505406 ) ) ( not ( = ?auto_505404 ?auto_505407 ) ) ( not ( = ?auto_505404 ?auto_505408 ) ) ( not ( = ?auto_505404 ?auto_505409 ) ) ( not ( = ?auto_505404 ?auto_505410 ) ) ( not ( = ?auto_505404 ?auto_505411 ) ) ( not ( = ?auto_505404 ?auto_505412 ) ) ( not ( = ?auto_505404 ?auto_505413 ) ) ( not ( = ?auto_505404 ?auto_505414 ) ) ( not ( = ?auto_505405 ?auto_505406 ) ) ( not ( = ?auto_505405 ?auto_505407 ) ) ( not ( = ?auto_505405 ?auto_505408 ) ) ( not ( = ?auto_505405 ?auto_505409 ) ) ( not ( = ?auto_505405 ?auto_505410 ) ) ( not ( = ?auto_505405 ?auto_505411 ) ) ( not ( = ?auto_505405 ?auto_505412 ) ) ( not ( = ?auto_505405 ?auto_505413 ) ) ( not ( = ?auto_505405 ?auto_505414 ) ) ( not ( = ?auto_505406 ?auto_505407 ) ) ( not ( = ?auto_505406 ?auto_505408 ) ) ( not ( = ?auto_505406 ?auto_505409 ) ) ( not ( = ?auto_505406 ?auto_505410 ) ) ( not ( = ?auto_505406 ?auto_505411 ) ) ( not ( = ?auto_505406 ?auto_505412 ) ) ( not ( = ?auto_505406 ?auto_505413 ) ) ( not ( = ?auto_505406 ?auto_505414 ) ) ( not ( = ?auto_505407 ?auto_505408 ) ) ( not ( = ?auto_505407 ?auto_505409 ) ) ( not ( = ?auto_505407 ?auto_505410 ) ) ( not ( = ?auto_505407 ?auto_505411 ) ) ( not ( = ?auto_505407 ?auto_505412 ) ) ( not ( = ?auto_505407 ?auto_505413 ) ) ( not ( = ?auto_505407 ?auto_505414 ) ) ( not ( = ?auto_505408 ?auto_505409 ) ) ( not ( = ?auto_505408 ?auto_505410 ) ) ( not ( = ?auto_505408 ?auto_505411 ) ) ( not ( = ?auto_505408 ?auto_505412 ) ) ( not ( = ?auto_505408 ?auto_505413 ) ) ( not ( = ?auto_505408 ?auto_505414 ) ) ( not ( = ?auto_505409 ?auto_505410 ) ) ( not ( = ?auto_505409 ?auto_505411 ) ) ( not ( = ?auto_505409 ?auto_505412 ) ) ( not ( = ?auto_505409 ?auto_505413 ) ) ( not ( = ?auto_505409 ?auto_505414 ) ) ( not ( = ?auto_505410 ?auto_505411 ) ) ( not ( = ?auto_505410 ?auto_505412 ) ) ( not ( = ?auto_505410 ?auto_505413 ) ) ( not ( = ?auto_505410 ?auto_505414 ) ) ( not ( = ?auto_505411 ?auto_505412 ) ) ( not ( = ?auto_505411 ?auto_505413 ) ) ( not ( = ?auto_505411 ?auto_505414 ) ) ( not ( = ?auto_505412 ?auto_505413 ) ) ( not ( = ?auto_505412 ?auto_505414 ) ) ( not ( = ?auto_505413 ?auto_505414 ) ) ( CLEAR ?auto_505411 ) ( ON ?auto_505412 ?auto_505413 ) ( CLEAR ?auto_505412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_505401 ?auto_505402 ?auto_505403 ?auto_505404 ?auto_505405 ?auto_505406 ?auto_505407 ?auto_505408 ?auto_505409 ?auto_505410 ?auto_505411 ?auto_505412 )
      ( MAKE-13PILE ?auto_505401 ?auto_505402 ?auto_505403 ?auto_505404 ?auto_505405 ?auto_505406 ?auto_505407 ?auto_505408 ?auto_505409 ?auto_505410 ?auto_505411 ?auto_505412 ?auto_505413 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505455 - BLOCK
      ?auto_505456 - BLOCK
      ?auto_505457 - BLOCK
      ?auto_505458 - BLOCK
      ?auto_505459 - BLOCK
      ?auto_505460 - BLOCK
      ?auto_505461 - BLOCK
      ?auto_505462 - BLOCK
      ?auto_505463 - BLOCK
      ?auto_505464 - BLOCK
      ?auto_505465 - BLOCK
      ?auto_505466 - BLOCK
      ?auto_505467 - BLOCK
    )
    :vars
    (
      ?auto_505468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505467 ?auto_505468 ) ( ON-TABLE ?auto_505455 ) ( ON ?auto_505456 ?auto_505455 ) ( ON ?auto_505457 ?auto_505456 ) ( ON ?auto_505458 ?auto_505457 ) ( ON ?auto_505459 ?auto_505458 ) ( ON ?auto_505460 ?auto_505459 ) ( ON ?auto_505461 ?auto_505460 ) ( ON ?auto_505462 ?auto_505461 ) ( ON ?auto_505463 ?auto_505462 ) ( ON ?auto_505464 ?auto_505463 ) ( not ( = ?auto_505455 ?auto_505456 ) ) ( not ( = ?auto_505455 ?auto_505457 ) ) ( not ( = ?auto_505455 ?auto_505458 ) ) ( not ( = ?auto_505455 ?auto_505459 ) ) ( not ( = ?auto_505455 ?auto_505460 ) ) ( not ( = ?auto_505455 ?auto_505461 ) ) ( not ( = ?auto_505455 ?auto_505462 ) ) ( not ( = ?auto_505455 ?auto_505463 ) ) ( not ( = ?auto_505455 ?auto_505464 ) ) ( not ( = ?auto_505455 ?auto_505465 ) ) ( not ( = ?auto_505455 ?auto_505466 ) ) ( not ( = ?auto_505455 ?auto_505467 ) ) ( not ( = ?auto_505455 ?auto_505468 ) ) ( not ( = ?auto_505456 ?auto_505457 ) ) ( not ( = ?auto_505456 ?auto_505458 ) ) ( not ( = ?auto_505456 ?auto_505459 ) ) ( not ( = ?auto_505456 ?auto_505460 ) ) ( not ( = ?auto_505456 ?auto_505461 ) ) ( not ( = ?auto_505456 ?auto_505462 ) ) ( not ( = ?auto_505456 ?auto_505463 ) ) ( not ( = ?auto_505456 ?auto_505464 ) ) ( not ( = ?auto_505456 ?auto_505465 ) ) ( not ( = ?auto_505456 ?auto_505466 ) ) ( not ( = ?auto_505456 ?auto_505467 ) ) ( not ( = ?auto_505456 ?auto_505468 ) ) ( not ( = ?auto_505457 ?auto_505458 ) ) ( not ( = ?auto_505457 ?auto_505459 ) ) ( not ( = ?auto_505457 ?auto_505460 ) ) ( not ( = ?auto_505457 ?auto_505461 ) ) ( not ( = ?auto_505457 ?auto_505462 ) ) ( not ( = ?auto_505457 ?auto_505463 ) ) ( not ( = ?auto_505457 ?auto_505464 ) ) ( not ( = ?auto_505457 ?auto_505465 ) ) ( not ( = ?auto_505457 ?auto_505466 ) ) ( not ( = ?auto_505457 ?auto_505467 ) ) ( not ( = ?auto_505457 ?auto_505468 ) ) ( not ( = ?auto_505458 ?auto_505459 ) ) ( not ( = ?auto_505458 ?auto_505460 ) ) ( not ( = ?auto_505458 ?auto_505461 ) ) ( not ( = ?auto_505458 ?auto_505462 ) ) ( not ( = ?auto_505458 ?auto_505463 ) ) ( not ( = ?auto_505458 ?auto_505464 ) ) ( not ( = ?auto_505458 ?auto_505465 ) ) ( not ( = ?auto_505458 ?auto_505466 ) ) ( not ( = ?auto_505458 ?auto_505467 ) ) ( not ( = ?auto_505458 ?auto_505468 ) ) ( not ( = ?auto_505459 ?auto_505460 ) ) ( not ( = ?auto_505459 ?auto_505461 ) ) ( not ( = ?auto_505459 ?auto_505462 ) ) ( not ( = ?auto_505459 ?auto_505463 ) ) ( not ( = ?auto_505459 ?auto_505464 ) ) ( not ( = ?auto_505459 ?auto_505465 ) ) ( not ( = ?auto_505459 ?auto_505466 ) ) ( not ( = ?auto_505459 ?auto_505467 ) ) ( not ( = ?auto_505459 ?auto_505468 ) ) ( not ( = ?auto_505460 ?auto_505461 ) ) ( not ( = ?auto_505460 ?auto_505462 ) ) ( not ( = ?auto_505460 ?auto_505463 ) ) ( not ( = ?auto_505460 ?auto_505464 ) ) ( not ( = ?auto_505460 ?auto_505465 ) ) ( not ( = ?auto_505460 ?auto_505466 ) ) ( not ( = ?auto_505460 ?auto_505467 ) ) ( not ( = ?auto_505460 ?auto_505468 ) ) ( not ( = ?auto_505461 ?auto_505462 ) ) ( not ( = ?auto_505461 ?auto_505463 ) ) ( not ( = ?auto_505461 ?auto_505464 ) ) ( not ( = ?auto_505461 ?auto_505465 ) ) ( not ( = ?auto_505461 ?auto_505466 ) ) ( not ( = ?auto_505461 ?auto_505467 ) ) ( not ( = ?auto_505461 ?auto_505468 ) ) ( not ( = ?auto_505462 ?auto_505463 ) ) ( not ( = ?auto_505462 ?auto_505464 ) ) ( not ( = ?auto_505462 ?auto_505465 ) ) ( not ( = ?auto_505462 ?auto_505466 ) ) ( not ( = ?auto_505462 ?auto_505467 ) ) ( not ( = ?auto_505462 ?auto_505468 ) ) ( not ( = ?auto_505463 ?auto_505464 ) ) ( not ( = ?auto_505463 ?auto_505465 ) ) ( not ( = ?auto_505463 ?auto_505466 ) ) ( not ( = ?auto_505463 ?auto_505467 ) ) ( not ( = ?auto_505463 ?auto_505468 ) ) ( not ( = ?auto_505464 ?auto_505465 ) ) ( not ( = ?auto_505464 ?auto_505466 ) ) ( not ( = ?auto_505464 ?auto_505467 ) ) ( not ( = ?auto_505464 ?auto_505468 ) ) ( not ( = ?auto_505465 ?auto_505466 ) ) ( not ( = ?auto_505465 ?auto_505467 ) ) ( not ( = ?auto_505465 ?auto_505468 ) ) ( not ( = ?auto_505466 ?auto_505467 ) ) ( not ( = ?auto_505466 ?auto_505468 ) ) ( not ( = ?auto_505467 ?auto_505468 ) ) ( ON ?auto_505466 ?auto_505467 ) ( CLEAR ?auto_505464 ) ( ON ?auto_505465 ?auto_505466 ) ( CLEAR ?auto_505465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_505455 ?auto_505456 ?auto_505457 ?auto_505458 ?auto_505459 ?auto_505460 ?auto_505461 ?auto_505462 ?auto_505463 ?auto_505464 ?auto_505465 )
      ( MAKE-13PILE ?auto_505455 ?auto_505456 ?auto_505457 ?auto_505458 ?auto_505459 ?auto_505460 ?auto_505461 ?auto_505462 ?auto_505463 ?auto_505464 ?auto_505465 ?auto_505466 ?auto_505467 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505509 - BLOCK
      ?auto_505510 - BLOCK
      ?auto_505511 - BLOCK
      ?auto_505512 - BLOCK
      ?auto_505513 - BLOCK
      ?auto_505514 - BLOCK
      ?auto_505515 - BLOCK
      ?auto_505516 - BLOCK
      ?auto_505517 - BLOCK
      ?auto_505518 - BLOCK
      ?auto_505519 - BLOCK
      ?auto_505520 - BLOCK
      ?auto_505521 - BLOCK
    )
    :vars
    (
      ?auto_505522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505521 ?auto_505522 ) ( ON-TABLE ?auto_505509 ) ( ON ?auto_505510 ?auto_505509 ) ( ON ?auto_505511 ?auto_505510 ) ( ON ?auto_505512 ?auto_505511 ) ( ON ?auto_505513 ?auto_505512 ) ( ON ?auto_505514 ?auto_505513 ) ( ON ?auto_505515 ?auto_505514 ) ( ON ?auto_505516 ?auto_505515 ) ( ON ?auto_505517 ?auto_505516 ) ( not ( = ?auto_505509 ?auto_505510 ) ) ( not ( = ?auto_505509 ?auto_505511 ) ) ( not ( = ?auto_505509 ?auto_505512 ) ) ( not ( = ?auto_505509 ?auto_505513 ) ) ( not ( = ?auto_505509 ?auto_505514 ) ) ( not ( = ?auto_505509 ?auto_505515 ) ) ( not ( = ?auto_505509 ?auto_505516 ) ) ( not ( = ?auto_505509 ?auto_505517 ) ) ( not ( = ?auto_505509 ?auto_505518 ) ) ( not ( = ?auto_505509 ?auto_505519 ) ) ( not ( = ?auto_505509 ?auto_505520 ) ) ( not ( = ?auto_505509 ?auto_505521 ) ) ( not ( = ?auto_505509 ?auto_505522 ) ) ( not ( = ?auto_505510 ?auto_505511 ) ) ( not ( = ?auto_505510 ?auto_505512 ) ) ( not ( = ?auto_505510 ?auto_505513 ) ) ( not ( = ?auto_505510 ?auto_505514 ) ) ( not ( = ?auto_505510 ?auto_505515 ) ) ( not ( = ?auto_505510 ?auto_505516 ) ) ( not ( = ?auto_505510 ?auto_505517 ) ) ( not ( = ?auto_505510 ?auto_505518 ) ) ( not ( = ?auto_505510 ?auto_505519 ) ) ( not ( = ?auto_505510 ?auto_505520 ) ) ( not ( = ?auto_505510 ?auto_505521 ) ) ( not ( = ?auto_505510 ?auto_505522 ) ) ( not ( = ?auto_505511 ?auto_505512 ) ) ( not ( = ?auto_505511 ?auto_505513 ) ) ( not ( = ?auto_505511 ?auto_505514 ) ) ( not ( = ?auto_505511 ?auto_505515 ) ) ( not ( = ?auto_505511 ?auto_505516 ) ) ( not ( = ?auto_505511 ?auto_505517 ) ) ( not ( = ?auto_505511 ?auto_505518 ) ) ( not ( = ?auto_505511 ?auto_505519 ) ) ( not ( = ?auto_505511 ?auto_505520 ) ) ( not ( = ?auto_505511 ?auto_505521 ) ) ( not ( = ?auto_505511 ?auto_505522 ) ) ( not ( = ?auto_505512 ?auto_505513 ) ) ( not ( = ?auto_505512 ?auto_505514 ) ) ( not ( = ?auto_505512 ?auto_505515 ) ) ( not ( = ?auto_505512 ?auto_505516 ) ) ( not ( = ?auto_505512 ?auto_505517 ) ) ( not ( = ?auto_505512 ?auto_505518 ) ) ( not ( = ?auto_505512 ?auto_505519 ) ) ( not ( = ?auto_505512 ?auto_505520 ) ) ( not ( = ?auto_505512 ?auto_505521 ) ) ( not ( = ?auto_505512 ?auto_505522 ) ) ( not ( = ?auto_505513 ?auto_505514 ) ) ( not ( = ?auto_505513 ?auto_505515 ) ) ( not ( = ?auto_505513 ?auto_505516 ) ) ( not ( = ?auto_505513 ?auto_505517 ) ) ( not ( = ?auto_505513 ?auto_505518 ) ) ( not ( = ?auto_505513 ?auto_505519 ) ) ( not ( = ?auto_505513 ?auto_505520 ) ) ( not ( = ?auto_505513 ?auto_505521 ) ) ( not ( = ?auto_505513 ?auto_505522 ) ) ( not ( = ?auto_505514 ?auto_505515 ) ) ( not ( = ?auto_505514 ?auto_505516 ) ) ( not ( = ?auto_505514 ?auto_505517 ) ) ( not ( = ?auto_505514 ?auto_505518 ) ) ( not ( = ?auto_505514 ?auto_505519 ) ) ( not ( = ?auto_505514 ?auto_505520 ) ) ( not ( = ?auto_505514 ?auto_505521 ) ) ( not ( = ?auto_505514 ?auto_505522 ) ) ( not ( = ?auto_505515 ?auto_505516 ) ) ( not ( = ?auto_505515 ?auto_505517 ) ) ( not ( = ?auto_505515 ?auto_505518 ) ) ( not ( = ?auto_505515 ?auto_505519 ) ) ( not ( = ?auto_505515 ?auto_505520 ) ) ( not ( = ?auto_505515 ?auto_505521 ) ) ( not ( = ?auto_505515 ?auto_505522 ) ) ( not ( = ?auto_505516 ?auto_505517 ) ) ( not ( = ?auto_505516 ?auto_505518 ) ) ( not ( = ?auto_505516 ?auto_505519 ) ) ( not ( = ?auto_505516 ?auto_505520 ) ) ( not ( = ?auto_505516 ?auto_505521 ) ) ( not ( = ?auto_505516 ?auto_505522 ) ) ( not ( = ?auto_505517 ?auto_505518 ) ) ( not ( = ?auto_505517 ?auto_505519 ) ) ( not ( = ?auto_505517 ?auto_505520 ) ) ( not ( = ?auto_505517 ?auto_505521 ) ) ( not ( = ?auto_505517 ?auto_505522 ) ) ( not ( = ?auto_505518 ?auto_505519 ) ) ( not ( = ?auto_505518 ?auto_505520 ) ) ( not ( = ?auto_505518 ?auto_505521 ) ) ( not ( = ?auto_505518 ?auto_505522 ) ) ( not ( = ?auto_505519 ?auto_505520 ) ) ( not ( = ?auto_505519 ?auto_505521 ) ) ( not ( = ?auto_505519 ?auto_505522 ) ) ( not ( = ?auto_505520 ?auto_505521 ) ) ( not ( = ?auto_505520 ?auto_505522 ) ) ( not ( = ?auto_505521 ?auto_505522 ) ) ( ON ?auto_505520 ?auto_505521 ) ( ON ?auto_505519 ?auto_505520 ) ( CLEAR ?auto_505517 ) ( ON ?auto_505518 ?auto_505519 ) ( CLEAR ?auto_505518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_505509 ?auto_505510 ?auto_505511 ?auto_505512 ?auto_505513 ?auto_505514 ?auto_505515 ?auto_505516 ?auto_505517 ?auto_505518 )
      ( MAKE-13PILE ?auto_505509 ?auto_505510 ?auto_505511 ?auto_505512 ?auto_505513 ?auto_505514 ?auto_505515 ?auto_505516 ?auto_505517 ?auto_505518 ?auto_505519 ?auto_505520 ?auto_505521 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505563 - BLOCK
      ?auto_505564 - BLOCK
      ?auto_505565 - BLOCK
      ?auto_505566 - BLOCK
      ?auto_505567 - BLOCK
      ?auto_505568 - BLOCK
      ?auto_505569 - BLOCK
      ?auto_505570 - BLOCK
      ?auto_505571 - BLOCK
      ?auto_505572 - BLOCK
      ?auto_505573 - BLOCK
      ?auto_505574 - BLOCK
      ?auto_505575 - BLOCK
    )
    :vars
    (
      ?auto_505576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505575 ?auto_505576 ) ( ON-TABLE ?auto_505563 ) ( ON ?auto_505564 ?auto_505563 ) ( ON ?auto_505565 ?auto_505564 ) ( ON ?auto_505566 ?auto_505565 ) ( ON ?auto_505567 ?auto_505566 ) ( ON ?auto_505568 ?auto_505567 ) ( ON ?auto_505569 ?auto_505568 ) ( ON ?auto_505570 ?auto_505569 ) ( not ( = ?auto_505563 ?auto_505564 ) ) ( not ( = ?auto_505563 ?auto_505565 ) ) ( not ( = ?auto_505563 ?auto_505566 ) ) ( not ( = ?auto_505563 ?auto_505567 ) ) ( not ( = ?auto_505563 ?auto_505568 ) ) ( not ( = ?auto_505563 ?auto_505569 ) ) ( not ( = ?auto_505563 ?auto_505570 ) ) ( not ( = ?auto_505563 ?auto_505571 ) ) ( not ( = ?auto_505563 ?auto_505572 ) ) ( not ( = ?auto_505563 ?auto_505573 ) ) ( not ( = ?auto_505563 ?auto_505574 ) ) ( not ( = ?auto_505563 ?auto_505575 ) ) ( not ( = ?auto_505563 ?auto_505576 ) ) ( not ( = ?auto_505564 ?auto_505565 ) ) ( not ( = ?auto_505564 ?auto_505566 ) ) ( not ( = ?auto_505564 ?auto_505567 ) ) ( not ( = ?auto_505564 ?auto_505568 ) ) ( not ( = ?auto_505564 ?auto_505569 ) ) ( not ( = ?auto_505564 ?auto_505570 ) ) ( not ( = ?auto_505564 ?auto_505571 ) ) ( not ( = ?auto_505564 ?auto_505572 ) ) ( not ( = ?auto_505564 ?auto_505573 ) ) ( not ( = ?auto_505564 ?auto_505574 ) ) ( not ( = ?auto_505564 ?auto_505575 ) ) ( not ( = ?auto_505564 ?auto_505576 ) ) ( not ( = ?auto_505565 ?auto_505566 ) ) ( not ( = ?auto_505565 ?auto_505567 ) ) ( not ( = ?auto_505565 ?auto_505568 ) ) ( not ( = ?auto_505565 ?auto_505569 ) ) ( not ( = ?auto_505565 ?auto_505570 ) ) ( not ( = ?auto_505565 ?auto_505571 ) ) ( not ( = ?auto_505565 ?auto_505572 ) ) ( not ( = ?auto_505565 ?auto_505573 ) ) ( not ( = ?auto_505565 ?auto_505574 ) ) ( not ( = ?auto_505565 ?auto_505575 ) ) ( not ( = ?auto_505565 ?auto_505576 ) ) ( not ( = ?auto_505566 ?auto_505567 ) ) ( not ( = ?auto_505566 ?auto_505568 ) ) ( not ( = ?auto_505566 ?auto_505569 ) ) ( not ( = ?auto_505566 ?auto_505570 ) ) ( not ( = ?auto_505566 ?auto_505571 ) ) ( not ( = ?auto_505566 ?auto_505572 ) ) ( not ( = ?auto_505566 ?auto_505573 ) ) ( not ( = ?auto_505566 ?auto_505574 ) ) ( not ( = ?auto_505566 ?auto_505575 ) ) ( not ( = ?auto_505566 ?auto_505576 ) ) ( not ( = ?auto_505567 ?auto_505568 ) ) ( not ( = ?auto_505567 ?auto_505569 ) ) ( not ( = ?auto_505567 ?auto_505570 ) ) ( not ( = ?auto_505567 ?auto_505571 ) ) ( not ( = ?auto_505567 ?auto_505572 ) ) ( not ( = ?auto_505567 ?auto_505573 ) ) ( not ( = ?auto_505567 ?auto_505574 ) ) ( not ( = ?auto_505567 ?auto_505575 ) ) ( not ( = ?auto_505567 ?auto_505576 ) ) ( not ( = ?auto_505568 ?auto_505569 ) ) ( not ( = ?auto_505568 ?auto_505570 ) ) ( not ( = ?auto_505568 ?auto_505571 ) ) ( not ( = ?auto_505568 ?auto_505572 ) ) ( not ( = ?auto_505568 ?auto_505573 ) ) ( not ( = ?auto_505568 ?auto_505574 ) ) ( not ( = ?auto_505568 ?auto_505575 ) ) ( not ( = ?auto_505568 ?auto_505576 ) ) ( not ( = ?auto_505569 ?auto_505570 ) ) ( not ( = ?auto_505569 ?auto_505571 ) ) ( not ( = ?auto_505569 ?auto_505572 ) ) ( not ( = ?auto_505569 ?auto_505573 ) ) ( not ( = ?auto_505569 ?auto_505574 ) ) ( not ( = ?auto_505569 ?auto_505575 ) ) ( not ( = ?auto_505569 ?auto_505576 ) ) ( not ( = ?auto_505570 ?auto_505571 ) ) ( not ( = ?auto_505570 ?auto_505572 ) ) ( not ( = ?auto_505570 ?auto_505573 ) ) ( not ( = ?auto_505570 ?auto_505574 ) ) ( not ( = ?auto_505570 ?auto_505575 ) ) ( not ( = ?auto_505570 ?auto_505576 ) ) ( not ( = ?auto_505571 ?auto_505572 ) ) ( not ( = ?auto_505571 ?auto_505573 ) ) ( not ( = ?auto_505571 ?auto_505574 ) ) ( not ( = ?auto_505571 ?auto_505575 ) ) ( not ( = ?auto_505571 ?auto_505576 ) ) ( not ( = ?auto_505572 ?auto_505573 ) ) ( not ( = ?auto_505572 ?auto_505574 ) ) ( not ( = ?auto_505572 ?auto_505575 ) ) ( not ( = ?auto_505572 ?auto_505576 ) ) ( not ( = ?auto_505573 ?auto_505574 ) ) ( not ( = ?auto_505573 ?auto_505575 ) ) ( not ( = ?auto_505573 ?auto_505576 ) ) ( not ( = ?auto_505574 ?auto_505575 ) ) ( not ( = ?auto_505574 ?auto_505576 ) ) ( not ( = ?auto_505575 ?auto_505576 ) ) ( ON ?auto_505574 ?auto_505575 ) ( ON ?auto_505573 ?auto_505574 ) ( ON ?auto_505572 ?auto_505573 ) ( CLEAR ?auto_505570 ) ( ON ?auto_505571 ?auto_505572 ) ( CLEAR ?auto_505571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_505563 ?auto_505564 ?auto_505565 ?auto_505566 ?auto_505567 ?auto_505568 ?auto_505569 ?auto_505570 ?auto_505571 )
      ( MAKE-13PILE ?auto_505563 ?auto_505564 ?auto_505565 ?auto_505566 ?auto_505567 ?auto_505568 ?auto_505569 ?auto_505570 ?auto_505571 ?auto_505572 ?auto_505573 ?auto_505574 ?auto_505575 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505617 - BLOCK
      ?auto_505618 - BLOCK
      ?auto_505619 - BLOCK
      ?auto_505620 - BLOCK
      ?auto_505621 - BLOCK
      ?auto_505622 - BLOCK
      ?auto_505623 - BLOCK
      ?auto_505624 - BLOCK
      ?auto_505625 - BLOCK
      ?auto_505626 - BLOCK
      ?auto_505627 - BLOCK
      ?auto_505628 - BLOCK
      ?auto_505629 - BLOCK
    )
    :vars
    (
      ?auto_505630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505629 ?auto_505630 ) ( ON-TABLE ?auto_505617 ) ( ON ?auto_505618 ?auto_505617 ) ( ON ?auto_505619 ?auto_505618 ) ( ON ?auto_505620 ?auto_505619 ) ( ON ?auto_505621 ?auto_505620 ) ( ON ?auto_505622 ?auto_505621 ) ( ON ?auto_505623 ?auto_505622 ) ( not ( = ?auto_505617 ?auto_505618 ) ) ( not ( = ?auto_505617 ?auto_505619 ) ) ( not ( = ?auto_505617 ?auto_505620 ) ) ( not ( = ?auto_505617 ?auto_505621 ) ) ( not ( = ?auto_505617 ?auto_505622 ) ) ( not ( = ?auto_505617 ?auto_505623 ) ) ( not ( = ?auto_505617 ?auto_505624 ) ) ( not ( = ?auto_505617 ?auto_505625 ) ) ( not ( = ?auto_505617 ?auto_505626 ) ) ( not ( = ?auto_505617 ?auto_505627 ) ) ( not ( = ?auto_505617 ?auto_505628 ) ) ( not ( = ?auto_505617 ?auto_505629 ) ) ( not ( = ?auto_505617 ?auto_505630 ) ) ( not ( = ?auto_505618 ?auto_505619 ) ) ( not ( = ?auto_505618 ?auto_505620 ) ) ( not ( = ?auto_505618 ?auto_505621 ) ) ( not ( = ?auto_505618 ?auto_505622 ) ) ( not ( = ?auto_505618 ?auto_505623 ) ) ( not ( = ?auto_505618 ?auto_505624 ) ) ( not ( = ?auto_505618 ?auto_505625 ) ) ( not ( = ?auto_505618 ?auto_505626 ) ) ( not ( = ?auto_505618 ?auto_505627 ) ) ( not ( = ?auto_505618 ?auto_505628 ) ) ( not ( = ?auto_505618 ?auto_505629 ) ) ( not ( = ?auto_505618 ?auto_505630 ) ) ( not ( = ?auto_505619 ?auto_505620 ) ) ( not ( = ?auto_505619 ?auto_505621 ) ) ( not ( = ?auto_505619 ?auto_505622 ) ) ( not ( = ?auto_505619 ?auto_505623 ) ) ( not ( = ?auto_505619 ?auto_505624 ) ) ( not ( = ?auto_505619 ?auto_505625 ) ) ( not ( = ?auto_505619 ?auto_505626 ) ) ( not ( = ?auto_505619 ?auto_505627 ) ) ( not ( = ?auto_505619 ?auto_505628 ) ) ( not ( = ?auto_505619 ?auto_505629 ) ) ( not ( = ?auto_505619 ?auto_505630 ) ) ( not ( = ?auto_505620 ?auto_505621 ) ) ( not ( = ?auto_505620 ?auto_505622 ) ) ( not ( = ?auto_505620 ?auto_505623 ) ) ( not ( = ?auto_505620 ?auto_505624 ) ) ( not ( = ?auto_505620 ?auto_505625 ) ) ( not ( = ?auto_505620 ?auto_505626 ) ) ( not ( = ?auto_505620 ?auto_505627 ) ) ( not ( = ?auto_505620 ?auto_505628 ) ) ( not ( = ?auto_505620 ?auto_505629 ) ) ( not ( = ?auto_505620 ?auto_505630 ) ) ( not ( = ?auto_505621 ?auto_505622 ) ) ( not ( = ?auto_505621 ?auto_505623 ) ) ( not ( = ?auto_505621 ?auto_505624 ) ) ( not ( = ?auto_505621 ?auto_505625 ) ) ( not ( = ?auto_505621 ?auto_505626 ) ) ( not ( = ?auto_505621 ?auto_505627 ) ) ( not ( = ?auto_505621 ?auto_505628 ) ) ( not ( = ?auto_505621 ?auto_505629 ) ) ( not ( = ?auto_505621 ?auto_505630 ) ) ( not ( = ?auto_505622 ?auto_505623 ) ) ( not ( = ?auto_505622 ?auto_505624 ) ) ( not ( = ?auto_505622 ?auto_505625 ) ) ( not ( = ?auto_505622 ?auto_505626 ) ) ( not ( = ?auto_505622 ?auto_505627 ) ) ( not ( = ?auto_505622 ?auto_505628 ) ) ( not ( = ?auto_505622 ?auto_505629 ) ) ( not ( = ?auto_505622 ?auto_505630 ) ) ( not ( = ?auto_505623 ?auto_505624 ) ) ( not ( = ?auto_505623 ?auto_505625 ) ) ( not ( = ?auto_505623 ?auto_505626 ) ) ( not ( = ?auto_505623 ?auto_505627 ) ) ( not ( = ?auto_505623 ?auto_505628 ) ) ( not ( = ?auto_505623 ?auto_505629 ) ) ( not ( = ?auto_505623 ?auto_505630 ) ) ( not ( = ?auto_505624 ?auto_505625 ) ) ( not ( = ?auto_505624 ?auto_505626 ) ) ( not ( = ?auto_505624 ?auto_505627 ) ) ( not ( = ?auto_505624 ?auto_505628 ) ) ( not ( = ?auto_505624 ?auto_505629 ) ) ( not ( = ?auto_505624 ?auto_505630 ) ) ( not ( = ?auto_505625 ?auto_505626 ) ) ( not ( = ?auto_505625 ?auto_505627 ) ) ( not ( = ?auto_505625 ?auto_505628 ) ) ( not ( = ?auto_505625 ?auto_505629 ) ) ( not ( = ?auto_505625 ?auto_505630 ) ) ( not ( = ?auto_505626 ?auto_505627 ) ) ( not ( = ?auto_505626 ?auto_505628 ) ) ( not ( = ?auto_505626 ?auto_505629 ) ) ( not ( = ?auto_505626 ?auto_505630 ) ) ( not ( = ?auto_505627 ?auto_505628 ) ) ( not ( = ?auto_505627 ?auto_505629 ) ) ( not ( = ?auto_505627 ?auto_505630 ) ) ( not ( = ?auto_505628 ?auto_505629 ) ) ( not ( = ?auto_505628 ?auto_505630 ) ) ( not ( = ?auto_505629 ?auto_505630 ) ) ( ON ?auto_505628 ?auto_505629 ) ( ON ?auto_505627 ?auto_505628 ) ( ON ?auto_505626 ?auto_505627 ) ( ON ?auto_505625 ?auto_505626 ) ( CLEAR ?auto_505623 ) ( ON ?auto_505624 ?auto_505625 ) ( CLEAR ?auto_505624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_505617 ?auto_505618 ?auto_505619 ?auto_505620 ?auto_505621 ?auto_505622 ?auto_505623 ?auto_505624 )
      ( MAKE-13PILE ?auto_505617 ?auto_505618 ?auto_505619 ?auto_505620 ?auto_505621 ?auto_505622 ?auto_505623 ?auto_505624 ?auto_505625 ?auto_505626 ?auto_505627 ?auto_505628 ?auto_505629 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505671 - BLOCK
      ?auto_505672 - BLOCK
      ?auto_505673 - BLOCK
      ?auto_505674 - BLOCK
      ?auto_505675 - BLOCK
      ?auto_505676 - BLOCK
      ?auto_505677 - BLOCK
      ?auto_505678 - BLOCK
      ?auto_505679 - BLOCK
      ?auto_505680 - BLOCK
      ?auto_505681 - BLOCK
      ?auto_505682 - BLOCK
      ?auto_505683 - BLOCK
    )
    :vars
    (
      ?auto_505684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505683 ?auto_505684 ) ( ON-TABLE ?auto_505671 ) ( ON ?auto_505672 ?auto_505671 ) ( ON ?auto_505673 ?auto_505672 ) ( ON ?auto_505674 ?auto_505673 ) ( ON ?auto_505675 ?auto_505674 ) ( ON ?auto_505676 ?auto_505675 ) ( not ( = ?auto_505671 ?auto_505672 ) ) ( not ( = ?auto_505671 ?auto_505673 ) ) ( not ( = ?auto_505671 ?auto_505674 ) ) ( not ( = ?auto_505671 ?auto_505675 ) ) ( not ( = ?auto_505671 ?auto_505676 ) ) ( not ( = ?auto_505671 ?auto_505677 ) ) ( not ( = ?auto_505671 ?auto_505678 ) ) ( not ( = ?auto_505671 ?auto_505679 ) ) ( not ( = ?auto_505671 ?auto_505680 ) ) ( not ( = ?auto_505671 ?auto_505681 ) ) ( not ( = ?auto_505671 ?auto_505682 ) ) ( not ( = ?auto_505671 ?auto_505683 ) ) ( not ( = ?auto_505671 ?auto_505684 ) ) ( not ( = ?auto_505672 ?auto_505673 ) ) ( not ( = ?auto_505672 ?auto_505674 ) ) ( not ( = ?auto_505672 ?auto_505675 ) ) ( not ( = ?auto_505672 ?auto_505676 ) ) ( not ( = ?auto_505672 ?auto_505677 ) ) ( not ( = ?auto_505672 ?auto_505678 ) ) ( not ( = ?auto_505672 ?auto_505679 ) ) ( not ( = ?auto_505672 ?auto_505680 ) ) ( not ( = ?auto_505672 ?auto_505681 ) ) ( not ( = ?auto_505672 ?auto_505682 ) ) ( not ( = ?auto_505672 ?auto_505683 ) ) ( not ( = ?auto_505672 ?auto_505684 ) ) ( not ( = ?auto_505673 ?auto_505674 ) ) ( not ( = ?auto_505673 ?auto_505675 ) ) ( not ( = ?auto_505673 ?auto_505676 ) ) ( not ( = ?auto_505673 ?auto_505677 ) ) ( not ( = ?auto_505673 ?auto_505678 ) ) ( not ( = ?auto_505673 ?auto_505679 ) ) ( not ( = ?auto_505673 ?auto_505680 ) ) ( not ( = ?auto_505673 ?auto_505681 ) ) ( not ( = ?auto_505673 ?auto_505682 ) ) ( not ( = ?auto_505673 ?auto_505683 ) ) ( not ( = ?auto_505673 ?auto_505684 ) ) ( not ( = ?auto_505674 ?auto_505675 ) ) ( not ( = ?auto_505674 ?auto_505676 ) ) ( not ( = ?auto_505674 ?auto_505677 ) ) ( not ( = ?auto_505674 ?auto_505678 ) ) ( not ( = ?auto_505674 ?auto_505679 ) ) ( not ( = ?auto_505674 ?auto_505680 ) ) ( not ( = ?auto_505674 ?auto_505681 ) ) ( not ( = ?auto_505674 ?auto_505682 ) ) ( not ( = ?auto_505674 ?auto_505683 ) ) ( not ( = ?auto_505674 ?auto_505684 ) ) ( not ( = ?auto_505675 ?auto_505676 ) ) ( not ( = ?auto_505675 ?auto_505677 ) ) ( not ( = ?auto_505675 ?auto_505678 ) ) ( not ( = ?auto_505675 ?auto_505679 ) ) ( not ( = ?auto_505675 ?auto_505680 ) ) ( not ( = ?auto_505675 ?auto_505681 ) ) ( not ( = ?auto_505675 ?auto_505682 ) ) ( not ( = ?auto_505675 ?auto_505683 ) ) ( not ( = ?auto_505675 ?auto_505684 ) ) ( not ( = ?auto_505676 ?auto_505677 ) ) ( not ( = ?auto_505676 ?auto_505678 ) ) ( not ( = ?auto_505676 ?auto_505679 ) ) ( not ( = ?auto_505676 ?auto_505680 ) ) ( not ( = ?auto_505676 ?auto_505681 ) ) ( not ( = ?auto_505676 ?auto_505682 ) ) ( not ( = ?auto_505676 ?auto_505683 ) ) ( not ( = ?auto_505676 ?auto_505684 ) ) ( not ( = ?auto_505677 ?auto_505678 ) ) ( not ( = ?auto_505677 ?auto_505679 ) ) ( not ( = ?auto_505677 ?auto_505680 ) ) ( not ( = ?auto_505677 ?auto_505681 ) ) ( not ( = ?auto_505677 ?auto_505682 ) ) ( not ( = ?auto_505677 ?auto_505683 ) ) ( not ( = ?auto_505677 ?auto_505684 ) ) ( not ( = ?auto_505678 ?auto_505679 ) ) ( not ( = ?auto_505678 ?auto_505680 ) ) ( not ( = ?auto_505678 ?auto_505681 ) ) ( not ( = ?auto_505678 ?auto_505682 ) ) ( not ( = ?auto_505678 ?auto_505683 ) ) ( not ( = ?auto_505678 ?auto_505684 ) ) ( not ( = ?auto_505679 ?auto_505680 ) ) ( not ( = ?auto_505679 ?auto_505681 ) ) ( not ( = ?auto_505679 ?auto_505682 ) ) ( not ( = ?auto_505679 ?auto_505683 ) ) ( not ( = ?auto_505679 ?auto_505684 ) ) ( not ( = ?auto_505680 ?auto_505681 ) ) ( not ( = ?auto_505680 ?auto_505682 ) ) ( not ( = ?auto_505680 ?auto_505683 ) ) ( not ( = ?auto_505680 ?auto_505684 ) ) ( not ( = ?auto_505681 ?auto_505682 ) ) ( not ( = ?auto_505681 ?auto_505683 ) ) ( not ( = ?auto_505681 ?auto_505684 ) ) ( not ( = ?auto_505682 ?auto_505683 ) ) ( not ( = ?auto_505682 ?auto_505684 ) ) ( not ( = ?auto_505683 ?auto_505684 ) ) ( ON ?auto_505682 ?auto_505683 ) ( ON ?auto_505681 ?auto_505682 ) ( ON ?auto_505680 ?auto_505681 ) ( ON ?auto_505679 ?auto_505680 ) ( ON ?auto_505678 ?auto_505679 ) ( CLEAR ?auto_505676 ) ( ON ?auto_505677 ?auto_505678 ) ( CLEAR ?auto_505677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_505671 ?auto_505672 ?auto_505673 ?auto_505674 ?auto_505675 ?auto_505676 ?auto_505677 )
      ( MAKE-13PILE ?auto_505671 ?auto_505672 ?auto_505673 ?auto_505674 ?auto_505675 ?auto_505676 ?auto_505677 ?auto_505678 ?auto_505679 ?auto_505680 ?auto_505681 ?auto_505682 ?auto_505683 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505725 - BLOCK
      ?auto_505726 - BLOCK
      ?auto_505727 - BLOCK
      ?auto_505728 - BLOCK
      ?auto_505729 - BLOCK
      ?auto_505730 - BLOCK
      ?auto_505731 - BLOCK
      ?auto_505732 - BLOCK
      ?auto_505733 - BLOCK
      ?auto_505734 - BLOCK
      ?auto_505735 - BLOCK
      ?auto_505736 - BLOCK
      ?auto_505737 - BLOCK
    )
    :vars
    (
      ?auto_505738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505737 ?auto_505738 ) ( ON-TABLE ?auto_505725 ) ( ON ?auto_505726 ?auto_505725 ) ( ON ?auto_505727 ?auto_505726 ) ( ON ?auto_505728 ?auto_505727 ) ( ON ?auto_505729 ?auto_505728 ) ( not ( = ?auto_505725 ?auto_505726 ) ) ( not ( = ?auto_505725 ?auto_505727 ) ) ( not ( = ?auto_505725 ?auto_505728 ) ) ( not ( = ?auto_505725 ?auto_505729 ) ) ( not ( = ?auto_505725 ?auto_505730 ) ) ( not ( = ?auto_505725 ?auto_505731 ) ) ( not ( = ?auto_505725 ?auto_505732 ) ) ( not ( = ?auto_505725 ?auto_505733 ) ) ( not ( = ?auto_505725 ?auto_505734 ) ) ( not ( = ?auto_505725 ?auto_505735 ) ) ( not ( = ?auto_505725 ?auto_505736 ) ) ( not ( = ?auto_505725 ?auto_505737 ) ) ( not ( = ?auto_505725 ?auto_505738 ) ) ( not ( = ?auto_505726 ?auto_505727 ) ) ( not ( = ?auto_505726 ?auto_505728 ) ) ( not ( = ?auto_505726 ?auto_505729 ) ) ( not ( = ?auto_505726 ?auto_505730 ) ) ( not ( = ?auto_505726 ?auto_505731 ) ) ( not ( = ?auto_505726 ?auto_505732 ) ) ( not ( = ?auto_505726 ?auto_505733 ) ) ( not ( = ?auto_505726 ?auto_505734 ) ) ( not ( = ?auto_505726 ?auto_505735 ) ) ( not ( = ?auto_505726 ?auto_505736 ) ) ( not ( = ?auto_505726 ?auto_505737 ) ) ( not ( = ?auto_505726 ?auto_505738 ) ) ( not ( = ?auto_505727 ?auto_505728 ) ) ( not ( = ?auto_505727 ?auto_505729 ) ) ( not ( = ?auto_505727 ?auto_505730 ) ) ( not ( = ?auto_505727 ?auto_505731 ) ) ( not ( = ?auto_505727 ?auto_505732 ) ) ( not ( = ?auto_505727 ?auto_505733 ) ) ( not ( = ?auto_505727 ?auto_505734 ) ) ( not ( = ?auto_505727 ?auto_505735 ) ) ( not ( = ?auto_505727 ?auto_505736 ) ) ( not ( = ?auto_505727 ?auto_505737 ) ) ( not ( = ?auto_505727 ?auto_505738 ) ) ( not ( = ?auto_505728 ?auto_505729 ) ) ( not ( = ?auto_505728 ?auto_505730 ) ) ( not ( = ?auto_505728 ?auto_505731 ) ) ( not ( = ?auto_505728 ?auto_505732 ) ) ( not ( = ?auto_505728 ?auto_505733 ) ) ( not ( = ?auto_505728 ?auto_505734 ) ) ( not ( = ?auto_505728 ?auto_505735 ) ) ( not ( = ?auto_505728 ?auto_505736 ) ) ( not ( = ?auto_505728 ?auto_505737 ) ) ( not ( = ?auto_505728 ?auto_505738 ) ) ( not ( = ?auto_505729 ?auto_505730 ) ) ( not ( = ?auto_505729 ?auto_505731 ) ) ( not ( = ?auto_505729 ?auto_505732 ) ) ( not ( = ?auto_505729 ?auto_505733 ) ) ( not ( = ?auto_505729 ?auto_505734 ) ) ( not ( = ?auto_505729 ?auto_505735 ) ) ( not ( = ?auto_505729 ?auto_505736 ) ) ( not ( = ?auto_505729 ?auto_505737 ) ) ( not ( = ?auto_505729 ?auto_505738 ) ) ( not ( = ?auto_505730 ?auto_505731 ) ) ( not ( = ?auto_505730 ?auto_505732 ) ) ( not ( = ?auto_505730 ?auto_505733 ) ) ( not ( = ?auto_505730 ?auto_505734 ) ) ( not ( = ?auto_505730 ?auto_505735 ) ) ( not ( = ?auto_505730 ?auto_505736 ) ) ( not ( = ?auto_505730 ?auto_505737 ) ) ( not ( = ?auto_505730 ?auto_505738 ) ) ( not ( = ?auto_505731 ?auto_505732 ) ) ( not ( = ?auto_505731 ?auto_505733 ) ) ( not ( = ?auto_505731 ?auto_505734 ) ) ( not ( = ?auto_505731 ?auto_505735 ) ) ( not ( = ?auto_505731 ?auto_505736 ) ) ( not ( = ?auto_505731 ?auto_505737 ) ) ( not ( = ?auto_505731 ?auto_505738 ) ) ( not ( = ?auto_505732 ?auto_505733 ) ) ( not ( = ?auto_505732 ?auto_505734 ) ) ( not ( = ?auto_505732 ?auto_505735 ) ) ( not ( = ?auto_505732 ?auto_505736 ) ) ( not ( = ?auto_505732 ?auto_505737 ) ) ( not ( = ?auto_505732 ?auto_505738 ) ) ( not ( = ?auto_505733 ?auto_505734 ) ) ( not ( = ?auto_505733 ?auto_505735 ) ) ( not ( = ?auto_505733 ?auto_505736 ) ) ( not ( = ?auto_505733 ?auto_505737 ) ) ( not ( = ?auto_505733 ?auto_505738 ) ) ( not ( = ?auto_505734 ?auto_505735 ) ) ( not ( = ?auto_505734 ?auto_505736 ) ) ( not ( = ?auto_505734 ?auto_505737 ) ) ( not ( = ?auto_505734 ?auto_505738 ) ) ( not ( = ?auto_505735 ?auto_505736 ) ) ( not ( = ?auto_505735 ?auto_505737 ) ) ( not ( = ?auto_505735 ?auto_505738 ) ) ( not ( = ?auto_505736 ?auto_505737 ) ) ( not ( = ?auto_505736 ?auto_505738 ) ) ( not ( = ?auto_505737 ?auto_505738 ) ) ( ON ?auto_505736 ?auto_505737 ) ( ON ?auto_505735 ?auto_505736 ) ( ON ?auto_505734 ?auto_505735 ) ( ON ?auto_505733 ?auto_505734 ) ( ON ?auto_505732 ?auto_505733 ) ( ON ?auto_505731 ?auto_505732 ) ( CLEAR ?auto_505729 ) ( ON ?auto_505730 ?auto_505731 ) ( CLEAR ?auto_505730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_505725 ?auto_505726 ?auto_505727 ?auto_505728 ?auto_505729 ?auto_505730 )
      ( MAKE-13PILE ?auto_505725 ?auto_505726 ?auto_505727 ?auto_505728 ?auto_505729 ?auto_505730 ?auto_505731 ?auto_505732 ?auto_505733 ?auto_505734 ?auto_505735 ?auto_505736 ?auto_505737 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505779 - BLOCK
      ?auto_505780 - BLOCK
      ?auto_505781 - BLOCK
      ?auto_505782 - BLOCK
      ?auto_505783 - BLOCK
      ?auto_505784 - BLOCK
      ?auto_505785 - BLOCK
      ?auto_505786 - BLOCK
      ?auto_505787 - BLOCK
      ?auto_505788 - BLOCK
      ?auto_505789 - BLOCK
      ?auto_505790 - BLOCK
      ?auto_505791 - BLOCK
    )
    :vars
    (
      ?auto_505792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505791 ?auto_505792 ) ( ON-TABLE ?auto_505779 ) ( ON ?auto_505780 ?auto_505779 ) ( ON ?auto_505781 ?auto_505780 ) ( ON ?auto_505782 ?auto_505781 ) ( not ( = ?auto_505779 ?auto_505780 ) ) ( not ( = ?auto_505779 ?auto_505781 ) ) ( not ( = ?auto_505779 ?auto_505782 ) ) ( not ( = ?auto_505779 ?auto_505783 ) ) ( not ( = ?auto_505779 ?auto_505784 ) ) ( not ( = ?auto_505779 ?auto_505785 ) ) ( not ( = ?auto_505779 ?auto_505786 ) ) ( not ( = ?auto_505779 ?auto_505787 ) ) ( not ( = ?auto_505779 ?auto_505788 ) ) ( not ( = ?auto_505779 ?auto_505789 ) ) ( not ( = ?auto_505779 ?auto_505790 ) ) ( not ( = ?auto_505779 ?auto_505791 ) ) ( not ( = ?auto_505779 ?auto_505792 ) ) ( not ( = ?auto_505780 ?auto_505781 ) ) ( not ( = ?auto_505780 ?auto_505782 ) ) ( not ( = ?auto_505780 ?auto_505783 ) ) ( not ( = ?auto_505780 ?auto_505784 ) ) ( not ( = ?auto_505780 ?auto_505785 ) ) ( not ( = ?auto_505780 ?auto_505786 ) ) ( not ( = ?auto_505780 ?auto_505787 ) ) ( not ( = ?auto_505780 ?auto_505788 ) ) ( not ( = ?auto_505780 ?auto_505789 ) ) ( not ( = ?auto_505780 ?auto_505790 ) ) ( not ( = ?auto_505780 ?auto_505791 ) ) ( not ( = ?auto_505780 ?auto_505792 ) ) ( not ( = ?auto_505781 ?auto_505782 ) ) ( not ( = ?auto_505781 ?auto_505783 ) ) ( not ( = ?auto_505781 ?auto_505784 ) ) ( not ( = ?auto_505781 ?auto_505785 ) ) ( not ( = ?auto_505781 ?auto_505786 ) ) ( not ( = ?auto_505781 ?auto_505787 ) ) ( not ( = ?auto_505781 ?auto_505788 ) ) ( not ( = ?auto_505781 ?auto_505789 ) ) ( not ( = ?auto_505781 ?auto_505790 ) ) ( not ( = ?auto_505781 ?auto_505791 ) ) ( not ( = ?auto_505781 ?auto_505792 ) ) ( not ( = ?auto_505782 ?auto_505783 ) ) ( not ( = ?auto_505782 ?auto_505784 ) ) ( not ( = ?auto_505782 ?auto_505785 ) ) ( not ( = ?auto_505782 ?auto_505786 ) ) ( not ( = ?auto_505782 ?auto_505787 ) ) ( not ( = ?auto_505782 ?auto_505788 ) ) ( not ( = ?auto_505782 ?auto_505789 ) ) ( not ( = ?auto_505782 ?auto_505790 ) ) ( not ( = ?auto_505782 ?auto_505791 ) ) ( not ( = ?auto_505782 ?auto_505792 ) ) ( not ( = ?auto_505783 ?auto_505784 ) ) ( not ( = ?auto_505783 ?auto_505785 ) ) ( not ( = ?auto_505783 ?auto_505786 ) ) ( not ( = ?auto_505783 ?auto_505787 ) ) ( not ( = ?auto_505783 ?auto_505788 ) ) ( not ( = ?auto_505783 ?auto_505789 ) ) ( not ( = ?auto_505783 ?auto_505790 ) ) ( not ( = ?auto_505783 ?auto_505791 ) ) ( not ( = ?auto_505783 ?auto_505792 ) ) ( not ( = ?auto_505784 ?auto_505785 ) ) ( not ( = ?auto_505784 ?auto_505786 ) ) ( not ( = ?auto_505784 ?auto_505787 ) ) ( not ( = ?auto_505784 ?auto_505788 ) ) ( not ( = ?auto_505784 ?auto_505789 ) ) ( not ( = ?auto_505784 ?auto_505790 ) ) ( not ( = ?auto_505784 ?auto_505791 ) ) ( not ( = ?auto_505784 ?auto_505792 ) ) ( not ( = ?auto_505785 ?auto_505786 ) ) ( not ( = ?auto_505785 ?auto_505787 ) ) ( not ( = ?auto_505785 ?auto_505788 ) ) ( not ( = ?auto_505785 ?auto_505789 ) ) ( not ( = ?auto_505785 ?auto_505790 ) ) ( not ( = ?auto_505785 ?auto_505791 ) ) ( not ( = ?auto_505785 ?auto_505792 ) ) ( not ( = ?auto_505786 ?auto_505787 ) ) ( not ( = ?auto_505786 ?auto_505788 ) ) ( not ( = ?auto_505786 ?auto_505789 ) ) ( not ( = ?auto_505786 ?auto_505790 ) ) ( not ( = ?auto_505786 ?auto_505791 ) ) ( not ( = ?auto_505786 ?auto_505792 ) ) ( not ( = ?auto_505787 ?auto_505788 ) ) ( not ( = ?auto_505787 ?auto_505789 ) ) ( not ( = ?auto_505787 ?auto_505790 ) ) ( not ( = ?auto_505787 ?auto_505791 ) ) ( not ( = ?auto_505787 ?auto_505792 ) ) ( not ( = ?auto_505788 ?auto_505789 ) ) ( not ( = ?auto_505788 ?auto_505790 ) ) ( not ( = ?auto_505788 ?auto_505791 ) ) ( not ( = ?auto_505788 ?auto_505792 ) ) ( not ( = ?auto_505789 ?auto_505790 ) ) ( not ( = ?auto_505789 ?auto_505791 ) ) ( not ( = ?auto_505789 ?auto_505792 ) ) ( not ( = ?auto_505790 ?auto_505791 ) ) ( not ( = ?auto_505790 ?auto_505792 ) ) ( not ( = ?auto_505791 ?auto_505792 ) ) ( ON ?auto_505790 ?auto_505791 ) ( ON ?auto_505789 ?auto_505790 ) ( ON ?auto_505788 ?auto_505789 ) ( ON ?auto_505787 ?auto_505788 ) ( ON ?auto_505786 ?auto_505787 ) ( ON ?auto_505785 ?auto_505786 ) ( ON ?auto_505784 ?auto_505785 ) ( CLEAR ?auto_505782 ) ( ON ?auto_505783 ?auto_505784 ) ( CLEAR ?auto_505783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_505779 ?auto_505780 ?auto_505781 ?auto_505782 ?auto_505783 )
      ( MAKE-13PILE ?auto_505779 ?auto_505780 ?auto_505781 ?auto_505782 ?auto_505783 ?auto_505784 ?auto_505785 ?auto_505786 ?auto_505787 ?auto_505788 ?auto_505789 ?auto_505790 ?auto_505791 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505833 - BLOCK
      ?auto_505834 - BLOCK
      ?auto_505835 - BLOCK
      ?auto_505836 - BLOCK
      ?auto_505837 - BLOCK
      ?auto_505838 - BLOCK
      ?auto_505839 - BLOCK
      ?auto_505840 - BLOCK
      ?auto_505841 - BLOCK
      ?auto_505842 - BLOCK
      ?auto_505843 - BLOCK
      ?auto_505844 - BLOCK
      ?auto_505845 - BLOCK
    )
    :vars
    (
      ?auto_505846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505845 ?auto_505846 ) ( ON-TABLE ?auto_505833 ) ( ON ?auto_505834 ?auto_505833 ) ( ON ?auto_505835 ?auto_505834 ) ( not ( = ?auto_505833 ?auto_505834 ) ) ( not ( = ?auto_505833 ?auto_505835 ) ) ( not ( = ?auto_505833 ?auto_505836 ) ) ( not ( = ?auto_505833 ?auto_505837 ) ) ( not ( = ?auto_505833 ?auto_505838 ) ) ( not ( = ?auto_505833 ?auto_505839 ) ) ( not ( = ?auto_505833 ?auto_505840 ) ) ( not ( = ?auto_505833 ?auto_505841 ) ) ( not ( = ?auto_505833 ?auto_505842 ) ) ( not ( = ?auto_505833 ?auto_505843 ) ) ( not ( = ?auto_505833 ?auto_505844 ) ) ( not ( = ?auto_505833 ?auto_505845 ) ) ( not ( = ?auto_505833 ?auto_505846 ) ) ( not ( = ?auto_505834 ?auto_505835 ) ) ( not ( = ?auto_505834 ?auto_505836 ) ) ( not ( = ?auto_505834 ?auto_505837 ) ) ( not ( = ?auto_505834 ?auto_505838 ) ) ( not ( = ?auto_505834 ?auto_505839 ) ) ( not ( = ?auto_505834 ?auto_505840 ) ) ( not ( = ?auto_505834 ?auto_505841 ) ) ( not ( = ?auto_505834 ?auto_505842 ) ) ( not ( = ?auto_505834 ?auto_505843 ) ) ( not ( = ?auto_505834 ?auto_505844 ) ) ( not ( = ?auto_505834 ?auto_505845 ) ) ( not ( = ?auto_505834 ?auto_505846 ) ) ( not ( = ?auto_505835 ?auto_505836 ) ) ( not ( = ?auto_505835 ?auto_505837 ) ) ( not ( = ?auto_505835 ?auto_505838 ) ) ( not ( = ?auto_505835 ?auto_505839 ) ) ( not ( = ?auto_505835 ?auto_505840 ) ) ( not ( = ?auto_505835 ?auto_505841 ) ) ( not ( = ?auto_505835 ?auto_505842 ) ) ( not ( = ?auto_505835 ?auto_505843 ) ) ( not ( = ?auto_505835 ?auto_505844 ) ) ( not ( = ?auto_505835 ?auto_505845 ) ) ( not ( = ?auto_505835 ?auto_505846 ) ) ( not ( = ?auto_505836 ?auto_505837 ) ) ( not ( = ?auto_505836 ?auto_505838 ) ) ( not ( = ?auto_505836 ?auto_505839 ) ) ( not ( = ?auto_505836 ?auto_505840 ) ) ( not ( = ?auto_505836 ?auto_505841 ) ) ( not ( = ?auto_505836 ?auto_505842 ) ) ( not ( = ?auto_505836 ?auto_505843 ) ) ( not ( = ?auto_505836 ?auto_505844 ) ) ( not ( = ?auto_505836 ?auto_505845 ) ) ( not ( = ?auto_505836 ?auto_505846 ) ) ( not ( = ?auto_505837 ?auto_505838 ) ) ( not ( = ?auto_505837 ?auto_505839 ) ) ( not ( = ?auto_505837 ?auto_505840 ) ) ( not ( = ?auto_505837 ?auto_505841 ) ) ( not ( = ?auto_505837 ?auto_505842 ) ) ( not ( = ?auto_505837 ?auto_505843 ) ) ( not ( = ?auto_505837 ?auto_505844 ) ) ( not ( = ?auto_505837 ?auto_505845 ) ) ( not ( = ?auto_505837 ?auto_505846 ) ) ( not ( = ?auto_505838 ?auto_505839 ) ) ( not ( = ?auto_505838 ?auto_505840 ) ) ( not ( = ?auto_505838 ?auto_505841 ) ) ( not ( = ?auto_505838 ?auto_505842 ) ) ( not ( = ?auto_505838 ?auto_505843 ) ) ( not ( = ?auto_505838 ?auto_505844 ) ) ( not ( = ?auto_505838 ?auto_505845 ) ) ( not ( = ?auto_505838 ?auto_505846 ) ) ( not ( = ?auto_505839 ?auto_505840 ) ) ( not ( = ?auto_505839 ?auto_505841 ) ) ( not ( = ?auto_505839 ?auto_505842 ) ) ( not ( = ?auto_505839 ?auto_505843 ) ) ( not ( = ?auto_505839 ?auto_505844 ) ) ( not ( = ?auto_505839 ?auto_505845 ) ) ( not ( = ?auto_505839 ?auto_505846 ) ) ( not ( = ?auto_505840 ?auto_505841 ) ) ( not ( = ?auto_505840 ?auto_505842 ) ) ( not ( = ?auto_505840 ?auto_505843 ) ) ( not ( = ?auto_505840 ?auto_505844 ) ) ( not ( = ?auto_505840 ?auto_505845 ) ) ( not ( = ?auto_505840 ?auto_505846 ) ) ( not ( = ?auto_505841 ?auto_505842 ) ) ( not ( = ?auto_505841 ?auto_505843 ) ) ( not ( = ?auto_505841 ?auto_505844 ) ) ( not ( = ?auto_505841 ?auto_505845 ) ) ( not ( = ?auto_505841 ?auto_505846 ) ) ( not ( = ?auto_505842 ?auto_505843 ) ) ( not ( = ?auto_505842 ?auto_505844 ) ) ( not ( = ?auto_505842 ?auto_505845 ) ) ( not ( = ?auto_505842 ?auto_505846 ) ) ( not ( = ?auto_505843 ?auto_505844 ) ) ( not ( = ?auto_505843 ?auto_505845 ) ) ( not ( = ?auto_505843 ?auto_505846 ) ) ( not ( = ?auto_505844 ?auto_505845 ) ) ( not ( = ?auto_505844 ?auto_505846 ) ) ( not ( = ?auto_505845 ?auto_505846 ) ) ( ON ?auto_505844 ?auto_505845 ) ( ON ?auto_505843 ?auto_505844 ) ( ON ?auto_505842 ?auto_505843 ) ( ON ?auto_505841 ?auto_505842 ) ( ON ?auto_505840 ?auto_505841 ) ( ON ?auto_505839 ?auto_505840 ) ( ON ?auto_505838 ?auto_505839 ) ( ON ?auto_505837 ?auto_505838 ) ( CLEAR ?auto_505835 ) ( ON ?auto_505836 ?auto_505837 ) ( CLEAR ?auto_505836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_505833 ?auto_505834 ?auto_505835 ?auto_505836 )
      ( MAKE-13PILE ?auto_505833 ?auto_505834 ?auto_505835 ?auto_505836 ?auto_505837 ?auto_505838 ?auto_505839 ?auto_505840 ?auto_505841 ?auto_505842 ?auto_505843 ?auto_505844 ?auto_505845 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505887 - BLOCK
      ?auto_505888 - BLOCK
      ?auto_505889 - BLOCK
      ?auto_505890 - BLOCK
      ?auto_505891 - BLOCK
      ?auto_505892 - BLOCK
      ?auto_505893 - BLOCK
      ?auto_505894 - BLOCK
      ?auto_505895 - BLOCK
      ?auto_505896 - BLOCK
      ?auto_505897 - BLOCK
      ?auto_505898 - BLOCK
      ?auto_505899 - BLOCK
    )
    :vars
    (
      ?auto_505900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505899 ?auto_505900 ) ( ON-TABLE ?auto_505887 ) ( ON ?auto_505888 ?auto_505887 ) ( not ( = ?auto_505887 ?auto_505888 ) ) ( not ( = ?auto_505887 ?auto_505889 ) ) ( not ( = ?auto_505887 ?auto_505890 ) ) ( not ( = ?auto_505887 ?auto_505891 ) ) ( not ( = ?auto_505887 ?auto_505892 ) ) ( not ( = ?auto_505887 ?auto_505893 ) ) ( not ( = ?auto_505887 ?auto_505894 ) ) ( not ( = ?auto_505887 ?auto_505895 ) ) ( not ( = ?auto_505887 ?auto_505896 ) ) ( not ( = ?auto_505887 ?auto_505897 ) ) ( not ( = ?auto_505887 ?auto_505898 ) ) ( not ( = ?auto_505887 ?auto_505899 ) ) ( not ( = ?auto_505887 ?auto_505900 ) ) ( not ( = ?auto_505888 ?auto_505889 ) ) ( not ( = ?auto_505888 ?auto_505890 ) ) ( not ( = ?auto_505888 ?auto_505891 ) ) ( not ( = ?auto_505888 ?auto_505892 ) ) ( not ( = ?auto_505888 ?auto_505893 ) ) ( not ( = ?auto_505888 ?auto_505894 ) ) ( not ( = ?auto_505888 ?auto_505895 ) ) ( not ( = ?auto_505888 ?auto_505896 ) ) ( not ( = ?auto_505888 ?auto_505897 ) ) ( not ( = ?auto_505888 ?auto_505898 ) ) ( not ( = ?auto_505888 ?auto_505899 ) ) ( not ( = ?auto_505888 ?auto_505900 ) ) ( not ( = ?auto_505889 ?auto_505890 ) ) ( not ( = ?auto_505889 ?auto_505891 ) ) ( not ( = ?auto_505889 ?auto_505892 ) ) ( not ( = ?auto_505889 ?auto_505893 ) ) ( not ( = ?auto_505889 ?auto_505894 ) ) ( not ( = ?auto_505889 ?auto_505895 ) ) ( not ( = ?auto_505889 ?auto_505896 ) ) ( not ( = ?auto_505889 ?auto_505897 ) ) ( not ( = ?auto_505889 ?auto_505898 ) ) ( not ( = ?auto_505889 ?auto_505899 ) ) ( not ( = ?auto_505889 ?auto_505900 ) ) ( not ( = ?auto_505890 ?auto_505891 ) ) ( not ( = ?auto_505890 ?auto_505892 ) ) ( not ( = ?auto_505890 ?auto_505893 ) ) ( not ( = ?auto_505890 ?auto_505894 ) ) ( not ( = ?auto_505890 ?auto_505895 ) ) ( not ( = ?auto_505890 ?auto_505896 ) ) ( not ( = ?auto_505890 ?auto_505897 ) ) ( not ( = ?auto_505890 ?auto_505898 ) ) ( not ( = ?auto_505890 ?auto_505899 ) ) ( not ( = ?auto_505890 ?auto_505900 ) ) ( not ( = ?auto_505891 ?auto_505892 ) ) ( not ( = ?auto_505891 ?auto_505893 ) ) ( not ( = ?auto_505891 ?auto_505894 ) ) ( not ( = ?auto_505891 ?auto_505895 ) ) ( not ( = ?auto_505891 ?auto_505896 ) ) ( not ( = ?auto_505891 ?auto_505897 ) ) ( not ( = ?auto_505891 ?auto_505898 ) ) ( not ( = ?auto_505891 ?auto_505899 ) ) ( not ( = ?auto_505891 ?auto_505900 ) ) ( not ( = ?auto_505892 ?auto_505893 ) ) ( not ( = ?auto_505892 ?auto_505894 ) ) ( not ( = ?auto_505892 ?auto_505895 ) ) ( not ( = ?auto_505892 ?auto_505896 ) ) ( not ( = ?auto_505892 ?auto_505897 ) ) ( not ( = ?auto_505892 ?auto_505898 ) ) ( not ( = ?auto_505892 ?auto_505899 ) ) ( not ( = ?auto_505892 ?auto_505900 ) ) ( not ( = ?auto_505893 ?auto_505894 ) ) ( not ( = ?auto_505893 ?auto_505895 ) ) ( not ( = ?auto_505893 ?auto_505896 ) ) ( not ( = ?auto_505893 ?auto_505897 ) ) ( not ( = ?auto_505893 ?auto_505898 ) ) ( not ( = ?auto_505893 ?auto_505899 ) ) ( not ( = ?auto_505893 ?auto_505900 ) ) ( not ( = ?auto_505894 ?auto_505895 ) ) ( not ( = ?auto_505894 ?auto_505896 ) ) ( not ( = ?auto_505894 ?auto_505897 ) ) ( not ( = ?auto_505894 ?auto_505898 ) ) ( not ( = ?auto_505894 ?auto_505899 ) ) ( not ( = ?auto_505894 ?auto_505900 ) ) ( not ( = ?auto_505895 ?auto_505896 ) ) ( not ( = ?auto_505895 ?auto_505897 ) ) ( not ( = ?auto_505895 ?auto_505898 ) ) ( not ( = ?auto_505895 ?auto_505899 ) ) ( not ( = ?auto_505895 ?auto_505900 ) ) ( not ( = ?auto_505896 ?auto_505897 ) ) ( not ( = ?auto_505896 ?auto_505898 ) ) ( not ( = ?auto_505896 ?auto_505899 ) ) ( not ( = ?auto_505896 ?auto_505900 ) ) ( not ( = ?auto_505897 ?auto_505898 ) ) ( not ( = ?auto_505897 ?auto_505899 ) ) ( not ( = ?auto_505897 ?auto_505900 ) ) ( not ( = ?auto_505898 ?auto_505899 ) ) ( not ( = ?auto_505898 ?auto_505900 ) ) ( not ( = ?auto_505899 ?auto_505900 ) ) ( ON ?auto_505898 ?auto_505899 ) ( ON ?auto_505897 ?auto_505898 ) ( ON ?auto_505896 ?auto_505897 ) ( ON ?auto_505895 ?auto_505896 ) ( ON ?auto_505894 ?auto_505895 ) ( ON ?auto_505893 ?auto_505894 ) ( ON ?auto_505892 ?auto_505893 ) ( ON ?auto_505891 ?auto_505892 ) ( ON ?auto_505890 ?auto_505891 ) ( CLEAR ?auto_505888 ) ( ON ?auto_505889 ?auto_505890 ) ( CLEAR ?auto_505889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_505887 ?auto_505888 ?auto_505889 )
      ( MAKE-13PILE ?auto_505887 ?auto_505888 ?auto_505889 ?auto_505890 ?auto_505891 ?auto_505892 ?auto_505893 ?auto_505894 ?auto_505895 ?auto_505896 ?auto_505897 ?auto_505898 ?auto_505899 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505941 - BLOCK
      ?auto_505942 - BLOCK
      ?auto_505943 - BLOCK
      ?auto_505944 - BLOCK
      ?auto_505945 - BLOCK
      ?auto_505946 - BLOCK
      ?auto_505947 - BLOCK
      ?auto_505948 - BLOCK
      ?auto_505949 - BLOCK
      ?auto_505950 - BLOCK
      ?auto_505951 - BLOCK
      ?auto_505952 - BLOCK
      ?auto_505953 - BLOCK
    )
    :vars
    (
      ?auto_505954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_505953 ?auto_505954 ) ( ON-TABLE ?auto_505941 ) ( not ( = ?auto_505941 ?auto_505942 ) ) ( not ( = ?auto_505941 ?auto_505943 ) ) ( not ( = ?auto_505941 ?auto_505944 ) ) ( not ( = ?auto_505941 ?auto_505945 ) ) ( not ( = ?auto_505941 ?auto_505946 ) ) ( not ( = ?auto_505941 ?auto_505947 ) ) ( not ( = ?auto_505941 ?auto_505948 ) ) ( not ( = ?auto_505941 ?auto_505949 ) ) ( not ( = ?auto_505941 ?auto_505950 ) ) ( not ( = ?auto_505941 ?auto_505951 ) ) ( not ( = ?auto_505941 ?auto_505952 ) ) ( not ( = ?auto_505941 ?auto_505953 ) ) ( not ( = ?auto_505941 ?auto_505954 ) ) ( not ( = ?auto_505942 ?auto_505943 ) ) ( not ( = ?auto_505942 ?auto_505944 ) ) ( not ( = ?auto_505942 ?auto_505945 ) ) ( not ( = ?auto_505942 ?auto_505946 ) ) ( not ( = ?auto_505942 ?auto_505947 ) ) ( not ( = ?auto_505942 ?auto_505948 ) ) ( not ( = ?auto_505942 ?auto_505949 ) ) ( not ( = ?auto_505942 ?auto_505950 ) ) ( not ( = ?auto_505942 ?auto_505951 ) ) ( not ( = ?auto_505942 ?auto_505952 ) ) ( not ( = ?auto_505942 ?auto_505953 ) ) ( not ( = ?auto_505942 ?auto_505954 ) ) ( not ( = ?auto_505943 ?auto_505944 ) ) ( not ( = ?auto_505943 ?auto_505945 ) ) ( not ( = ?auto_505943 ?auto_505946 ) ) ( not ( = ?auto_505943 ?auto_505947 ) ) ( not ( = ?auto_505943 ?auto_505948 ) ) ( not ( = ?auto_505943 ?auto_505949 ) ) ( not ( = ?auto_505943 ?auto_505950 ) ) ( not ( = ?auto_505943 ?auto_505951 ) ) ( not ( = ?auto_505943 ?auto_505952 ) ) ( not ( = ?auto_505943 ?auto_505953 ) ) ( not ( = ?auto_505943 ?auto_505954 ) ) ( not ( = ?auto_505944 ?auto_505945 ) ) ( not ( = ?auto_505944 ?auto_505946 ) ) ( not ( = ?auto_505944 ?auto_505947 ) ) ( not ( = ?auto_505944 ?auto_505948 ) ) ( not ( = ?auto_505944 ?auto_505949 ) ) ( not ( = ?auto_505944 ?auto_505950 ) ) ( not ( = ?auto_505944 ?auto_505951 ) ) ( not ( = ?auto_505944 ?auto_505952 ) ) ( not ( = ?auto_505944 ?auto_505953 ) ) ( not ( = ?auto_505944 ?auto_505954 ) ) ( not ( = ?auto_505945 ?auto_505946 ) ) ( not ( = ?auto_505945 ?auto_505947 ) ) ( not ( = ?auto_505945 ?auto_505948 ) ) ( not ( = ?auto_505945 ?auto_505949 ) ) ( not ( = ?auto_505945 ?auto_505950 ) ) ( not ( = ?auto_505945 ?auto_505951 ) ) ( not ( = ?auto_505945 ?auto_505952 ) ) ( not ( = ?auto_505945 ?auto_505953 ) ) ( not ( = ?auto_505945 ?auto_505954 ) ) ( not ( = ?auto_505946 ?auto_505947 ) ) ( not ( = ?auto_505946 ?auto_505948 ) ) ( not ( = ?auto_505946 ?auto_505949 ) ) ( not ( = ?auto_505946 ?auto_505950 ) ) ( not ( = ?auto_505946 ?auto_505951 ) ) ( not ( = ?auto_505946 ?auto_505952 ) ) ( not ( = ?auto_505946 ?auto_505953 ) ) ( not ( = ?auto_505946 ?auto_505954 ) ) ( not ( = ?auto_505947 ?auto_505948 ) ) ( not ( = ?auto_505947 ?auto_505949 ) ) ( not ( = ?auto_505947 ?auto_505950 ) ) ( not ( = ?auto_505947 ?auto_505951 ) ) ( not ( = ?auto_505947 ?auto_505952 ) ) ( not ( = ?auto_505947 ?auto_505953 ) ) ( not ( = ?auto_505947 ?auto_505954 ) ) ( not ( = ?auto_505948 ?auto_505949 ) ) ( not ( = ?auto_505948 ?auto_505950 ) ) ( not ( = ?auto_505948 ?auto_505951 ) ) ( not ( = ?auto_505948 ?auto_505952 ) ) ( not ( = ?auto_505948 ?auto_505953 ) ) ( not ( = ?auto_505948 ?auto_505954 ) ) ( not ( = ?auto_505949 ?auto_505950 ) ) ( not ( = ?auto_505949 ?auto_505951 ) ) ( not ( = ?auto_505949 ?auto_505952 ) ) ( not ( = ?auto_505949 ?auto_505953 ) ) ( not ( = ?auto_505949 ?auto_505954 ) ) ( not ( = ?auto_505950 ?auto_505951 ) ) ( not ( = ?auto_505950 ?auto_505952 ) ) ( not ( = ?auto_505950 ?auto_505953 ) ) ( not ( = ?auto_505950 ?auto_505954 ) ) ( not ( = ?auto_505951 ?auto_505952 ) ) ( not ( = ?auto_505951 ?auto_505953 ) ) ( not ( = ?auto_505951 ?auto_505954 ) ) ( not ( = ?auto_505952 ?auto_505953 ) ) ( not ( = ?auto_505952 ?auto_505954 ) ) ( not ( = ?auto_505953 ?auto_505954 ) ) ( ON ?auto_505952 ?auto_505953 ) ( ON ?auto_505951 ?auto_505952 ) ( ON ?auto_505950 ?auto_505951 ) ( ON ?auto_505949 ?auto_505950 ) ( ON ?auto_505948 ?auto_505949 ) ( ON ?auto_505947 ?auto_505948 ) ( ON ?auto_505946 ?auto_505947 ) ( ON ?auto_505945 ?auto_505946 ) ( ON ?auto_505944 ?auto_505945 ) ( ON ?auto_505943 ?auto_505944 ) ( CLEAR ?auto_505941 ) ( ON ?auto_505942 ?auto_505943 ) ( CLEAR ?auto_505942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_505941 ?auto_505942 )
      ( MAKE-13PILE ?auto_505941 ?auto_505942 ?auto_505943 ?auto_505944 ?auto_505945 ?auto_505946 ?auto_505947 ?auto_505948 ?auto_505949 ?auto_505950 ?auto_505951 ?auto_505952 ?auto_505953 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_505995 - BLOCK
      ?auto_505996 - BLOCK
      ?auto_505997 - BLOCK
      ?auto_505998 - BLOCK
      ?auto_505999 - BLOCK
      ?auto_506000 - BLOCK
      ?auto_506001 - BLOCK
      ?auto_506002 - BLOCK
      ?auto_506003 - BLOCK
      ?auto_506004 - BLOCK
      ?auto_506005 - BLOCK
      ?auto_506006 - BLOCK
      ?auto_506007 - BLOCK
    )
    :vars
    (
      ?auto_506008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506007 ?auto_506008 ) ( not ( = ?auto_505995 ?auto_505996 ) ) ( not ( = ?auto_505995 ?auto_505997 ) ) ( not ( = ?auto_505995 ?auto_505998 ) ) ( not ( = ?auto_505995 ?auto_505999 ) ) ( not ( = ?auto_505995 ?auto_506000 ) ) ( not ( = ?auto_505995 ?auto_506001 ) ) ( not ( = ?auto_505995 ?auto_506002 ) ) ( not ( = ?auto_505995 ?auto_506003 ) ) ( not ( = ?auto_505995 ?auto_506004 ) ) ( not ( = ?auto_505995 ?auto_506005 ) ) ( not ( = ?auto_505995 ?auto_506006 ) ) ( not ( = ?auto_505995 ?auto_506007 ) ) ( not ( = ?auto_505995 ?auto_506008 ) ) ( not ( = ?auto_505996 ?auto_505997 ) ) ( not ( = ?auto_505996 ?auto_505998 ) ) ( not ( = ?auto_505996 ?auto_505999 ) ) ( not ( = ?auto_505996 ?auto_506000 ) ) ( not ( = ?auto_505996 ?auto_506001 ) ) ( not ( = ?auto_505996 ?auto_506002 ) ) ( not ( = ?auto_505996 ?auto_506003 ) ) ( not ( = ?auto_505996 ?auto_506004 ) ) ( not ( = ?auto_505996 ?auto_506005 ) ) ( not ( = ?auto_505996 ?auto_506006 ) ) ( not ( = ?auto_505996 ?auto_506007 ) ) ( not ( = ?auto_505996 ?auto_506008 ) ) ( not ( = ?auto_505997 ?auto_505998 ) ) ( not ( = ?auto_505997 ?auto_505999 ) ) ( not ( = ?auto_505997 ?auto_506000 ) ) ( not ( = ?auto_505997 ?auto_506001 ) ) ( not ( = ?auto_505997 ?auto_506002 ) ) ( not ( = ?auto_505997 ?auto_506003 ) ) ( not ( = ?auto_505997 ?auto_506004 ) ) ( not ( = ?auto_505997 ?auto_506005 ) ) ( not ( = ?auto_505997 ?auto_506006 ) ) ( not ( = ?auto_505997 ?auto_506007 ) ) ( not ( = ?auto_505997 ?auto_506008 ) ) ( not ( = ?auto_505998 ?auto_505999 ) ) ( not ( = ?auto_505998 ?auto_506000 ) ) ( not ( = ?auto_505998 ?auto_506001 ) ) ( not ( = ?auto_505998 ?auto_506002 ) ) ( not ( = ?auto_505998 ?auto_506003 ) ) ( not ( = ?auto_505998 ?auto_506004 ) ) ( not ( = ?auto_505998 ?auto_506005 ) ) ( not ( = ?auto_505998 ?auto_506006 ) ) ( not ( = ?auto_505998 ?auto_506007 ) ) ( not ( = ?auto_505998 ?auto_506008 ) ) ( not ( = ?auto_505999 ?auto_506000 ) ) ( not ( = ?auto_505999 ?auto_506001 ) ) ( not ( = ?auto_505999 ?auto_506002 ) ) ( not ( = ?auto_505999 ?auto_506003 ) ) ( not ( = ?auto_505999 ?auto_506004 ) ) ( not ( = ?auto_505999 ?auto_506005 ) ) ( not ( = ?auto_505999 ?auto_506006 ) ) ( not ( = ?auto_505999 ?auto_506007 ) ) ( not ( = ?auto_505999 ?auto_506008 ) ) ( not ( = ?auto_506000 ?auto_506001 ) ) ( not ( = ?auto_506000 ?auto_506002 ) ) ( not ( = ?auto_506000 ?auto_506003 ) ) ( not ( = ?auto_506000 ?auto_506004 ) ) ( not ( = ?auto_506000 ?auto_506005 ) ) ( not ( = ?auto_506000 ?auto_506006 ) ) ( not ( = ?auto_506000 ?auto_506007 ) ) ( not ( = ?auto_506000 ?auto_506008 ) ) ( not ( = ?auto_506001 ?auto_506002 ) ) ( not ( = ?auto_506001 ?auto_506003 ) ) ( not ( = ?auto_506001 ?auto_506004 ) ) ( not ( = ?auto_506001 ?auto_506005 ) ) ( not ( = ?auto_506001 ?auto_506006 ) ) ( not ( = ?auto_506001 ?auto_506007 ) ) ( not ( = ?auto_506001 ?auto_506008 ) ) ( not ( = ?auto_506002 ?auto_506003 ) ) ( not ( = ?auto_506002 ?auto_506004 ) ) ( not ( = ?auto_506002 ?auto_506005 ) ) ( not ( = ?auto_506002 ?auto_506006 ) ) ( not ( = ?auto_506002 ?auto_506007 ) ) ( not ( = ?auto_506002 ?auto_506008 ) ) ( not ( = ?auto_506003 ?auto_506004 ) ) ( not ( = ?auto_506003 ?auto_506005 ) ) ( not ( = ?auto_506003 ?auto_506006 ) ) ( not ( = ?auto_506003 ?auto_506007 ) ) ( not ( = ?auto_506003 ?auto_506008 ) ) ( not ( = ?auto_506004 ?auto_506005 ) ) ( not ( = ?auto_506004 ?auto_506006 ) ) ( not ( = ?auto_506004 ?auto_506007 ) ) ( not ( = ?auto_506004 ?auto_506008 ) ) ( not ( = ?auto_506005 ?auto_506006 ) ) ( not ( = ?auto_506005 ?auto_506007 ) ) ( not ( = ?auto_506005 ?auto_506008 ) ) ( not ( = ?auto_506006 ?auto_506007 ) ) ( not ( = ?auto_506006 ?auto_506008 ) ) ( not ( = ?auto_506007 ?auto_506008 ) ) ( ON ?auto_506006 ?auto_506007 ) ( ON ?auto_506005 ?auto_506006 ) ( ON ?auto_506004 ?auto_506005 ) ( ON ?auto_506003 ?auto_506004 ) ( ON ?auto_506002 ?auto_506003 ) ( ON ?auto_506001 ?auto_506002 ) ( ON ?auto_506000 ?auto_506001 ) ( ON ?auto_505999 ?auto_506000 ) ( ON ?auto_505998 ?auto_505999 ) ( ON ?auto_505997 ?auto_505998 ) ( ON ?auto_505996 ?auto_505997 ) ( ON ?auto_505995 ?auto_505996 ) ( CLEAR ?auto_505995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_505995 )
      ( MAKE-13PILE ?auto_505995 ?auto_505996 ?auto_505997 ?auto_505998 ?auto_505999 ?auto_506000 ?auto_506001 ?auto_506002 ?auto_506003 ?auto_506004 ?auto_506005 ?auto_506006 ?auto_506007 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506050 - BLOCK
      ?auto_506051 - BLOCK
      ?auto_506052 - BLOCK
      ?auto_506053 - BLOCK
      ?auto_506054 - BLOCK
      ?auto_506055 - BLOCK
      ?auto_506056 - BLOCK
      ?auto_506057 - BLOCK
      ?auto_506058 - BLOCK
      ?auto_506059 - BLOCK
      ?auto_506060 - BLOCK
      ?auto_506061 - BLOCK
      ?auto_506062 - BLOCK
      ?auto_506063 - BLOCK
    )
    :vars
    (
      ?auto_506064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_506062 ) ( ON ?auto_506063 ?auto_506064 ) ( CLEAR ?auto_506063 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_506050 ) ( ON ?auto_506051 ?auto_506050 ) ( ON ?auto_506052 ?auto_506051 ) ( ON ?auto_506053 ?auto_506052 ) ( ON ?auto_506054 ?auto_506053 ) ( ON ?auto_506055 ?auto_506054 ) ( ON ?auto_506056 ?auto_506055 ) ( ON ?auto_506057 ?auto_506056 ) ( ON ?auto_506058 ?auto_506057 ) ( ON ?auto_506059 ?auto_506058 ) ( ON ?auto_506060 ?auto_506059 ) ( ON ?auto_506061 ?auto_506060 ) ( ON ?auto_506062 ?auto_506061 ) ( not ( = ?auto_506050 ?auto_506051 ) ) ( not ( = ?auto_506050 ?auto_506052 ) ) ( not ( = ?auto_506050 ?auto_506053 ) ) ( not ( = ?auto_506050 ?auto_506054 ) ) ( not ( = ?auto_506050 ?auto_506055 ) ) ( not ( = ?auto_506050 ?auto_506056 ) ) ( not ( = ?auto_506050 ?auto_506057 ) ) ( not ( = ?auto_506050 ?auto_506058 ) ) ( not ( = ?auto_506050 ?auto_506059 ) ) ( not ( = ?auto_506050 ?auto_506060 ) ) ( not ( = ?auto_506050 ?auto_506061 ) ) ( not ( = ?auto_506050 ?auto_506062 ) ) ( not ( = ?auto_506050 ?auto_506063 ) ) ( not ( = ?auto_506050 ?auto_506064 ) ) ( not ( = ?auto_506051 ?auto_506052 ) ) ( not ( = ?auto_506051 ?auto_506053 ) ) ( not ( = ?auto_506051 ?auto_506054 ) ) ( not ( = ?auto_506051 ?auto_506055 ) ) ( not ( = ?auto_506051 ?auto_506056 ) ) ( not ( = ?auto_506051 ?auto_506057 ) ) ( not ( = ?auto_506051 ?auto_506058 ) ) ( not ( = ?auto_506051 ?auto_506059 ) ) ( not ( = ?auto_506051 ?auto_506060 ) ) ( not ( = ?auto_506051 ?auto_506061 ) ) ( not ( = ?auto_506051 ?auto_506062 ) ) ( not ( = ?auto_506051 ?auto_506063 ) ) ( not ( = ?auto_506051 ?auto_506064 ) ) ( not ( = ?auto_506052 ?auto_506053 ) ) ( not ( = ?auto_506052 ?auto_506054 ) ) ( not ( = ?auto_506052 ?auto_506055 ) ) ( not ( = ?auto_506052 ?auto_506056 ) ) ( not ( = ?auto_506052 ?auto_506057 ) ) ( not ( = ?auto_506052 ?auto_506058 ) ) ( not ( = ?auto_506052 ?auto_506059 ) ) ( not ( = ?auto_506052 ?auto_506060 ) ) ( not ( = ?auto_506052 ?auto_506061 ) ) ( not ( = ?auto_506052 ?auto_506062 ) ) ( not ( = ?auto_506052 ?auto_506063 ) ) ( not ( = ?auto_506052 ?auto_506064 ) ) ( not ( = ?auto_506053 ?auto_506054 ) ) ( not ( = ?auto_506053 ?auto_506055 ) ) ( not ( = ?auto_506053 ?auto_506056 ) ) ( not ( = ?auto_506053 ?auto_506057 ) ) ( not ( = ?auto_506053 ?auto_506058 ) ) ( not ( = ?auto_506053 ?auto_506059 ) ) ( not ( = ?auto_506053 ?auto_506060 ) ) ( not ( = ?auto_506053 ?auto_506061 ) ) ( not ( = ?auto_506053 ?auto_506062 ) ) ( not ( = ?auto_506053 ?auto_506063 ) ) ( not ( = ?auto_506053 ?auto_506064 ) ) ( not ( = ?auto_506054 ?auto_506055 ) ) ( not ( = ?auto_506054 ?auto_506056 ) ) ( not ( = ?auto_506054 ?auto_506057 ) ) ( not ( = ?auto_506054 ?auto_506058 ) ) ( not ( = ?auto_506054 ?auto_506059 ) ) ( not ( = ?auto_506054 ?auto_506060 ) ) ( not ( = ?auto_506054 ?auto_506061 ) ) ( not ( = ?auto_506054 ?auto_506062 ) ) ( not ( = ?auto_506054 ?auto_506063 ) ) ( not ( = ?auto_506054 ?auto_506064 ) ) ( not ( = ?auto_506055 ?auto_506056 ) ) ( not ( = ?auto_506055 ?auto_506057 ) ) ( not ( = ?auto_506055 ?auto_506058 ) ) ( not ( = ?auto_506055 ?auto_506059 ) ) ( not ( = ?auto_506055 ?auto_506060 ) ) ( not ( = ?auto_506055 ?auto_506061 ) ) ( not ( = ?auto_506055 ?auto_506062 ) ) ( not ( = ?auto_506055 ?auto_506063 ) ) ( not ( = ?auto_506055 ?auto_506064 ) ) ( not ( = ?auto_506056 ?auto_506057 ) ) ( not ( = ?auto_506056 ?auto_506058 ) ) ( not ( = ?auto_506056 ?auto_506059 ) ) ( not ( = ?auto_506056 ?auto_506060 ) ) ( not ( = ?auto_506056 ?auto_506061 ) ) ( not ( = ?auto_506056 ?auto_506062 ) ) ( not ( = ?auto_506056 ?auto_506063 ) ) ( not ( = ?auto_506056 ?auto_506064 ) ) ( not ( = ?auto_506057 ?auto_506058 ) ) ( not ( = ?auto_506057 ?auto_506059 ) ) ( not ( = ?auto_506057 ?auto_506060 ) ) ( not ( = ?auto_506057 ?auto_506061 ) ) ( not ( = ?auto_506057 ?auto_506062 ) ) ( not ( = ?auto_506057 ?auto_506063 ) ) ( not ( = ?auto_506057 ?auto_506064 ) ) ( not ( = ?auto_506058 ?auto_506059 ) ) ( not ( = ?auto_506058 ?auto_506060 ) ) ( not ( = ?auto_506058 ?auto_506061 ) ) ( not ( = ?auto_506058 ?auto_506062 ) ) ( not ( = ?auto_506058 ?auto_506063 ) ) ( not ( = ?auto_506058 ?auto_506064 ) ) ( not ( = ?auto_506059 ?auto_506060 ) ) ( not ( = ?auto_506059 ?auto_506061 ) ) ( not ( = ?auto_506059 ?auto_506062 ) ) ( not ( = ?auto_506059 ?auto_506063 ) ) ( not ( = ?auto_506059 ?auto_506064 ) ) ( not ( = ?auto_506060 ?auto_506061 ) ) ( not ( = ?auto_506060 ?auto_506062 ) ) ( not ( = ?auto_506060 ?auto_506063 ) ) ( not ( = ?auto_506060 ?auto_506064 ) ) ( not ( = ?auto_506061 ?auto_506062 ) ) ( not ( = ?auto_506061 ?auto_506063 ) ) ( not ( = ?auto_506061 ?auto_506064 ) ) ( not ( = ?auto_506062 ?auto_506063 ) ) ( not ( = ?auto_506062 ?auto_506064 ) ) ( not ( = ?auto_506063 ?auto_506064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_506063 ?auto_506064 )
      ( !STACK ?auto_506063 ?auto_506062 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506108 - BLOCK
      ?auto_506109 - BLOCK
      ?auto_506110 - BLOCK
      ?auto_506111 - BLOCK
      ?auto_506112 - BLOCK
      ?auto_506113 - BLOCK
      ?auto_506114 - BLOCK
      ?auto_506115 - BLOCK
      ?auto_506116 - BLOCK
      ?auto_506117 - BLOCK
      ?auto_506118 - BLOCK
      ?auto_506119 - BLOCK
      ?auto_506120 - BLOCK
      ?auto_506121 - BLOCK
    )
    :vars
    (
      ?auto_506122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506121 ?auto_506122 ) ( ON-TABLE ?auto_506108 ) ( ON ?auto_506109 ?auto_506108 ) ( ON ?auto_506110 ?auto_506109 ) ( ON ?auto_506111 ?auto_506110 ) ( ON ?auto_506112 ?auto_506111 ) ( ON ?auto_506113 ?auto_506112 ) ( ON ?auto_506114 ?auto_506113 ) ( ON ?auto_506115 ?auto_506114 ) ( ON ?auto_506116 ?auto_506115 ) ( ON ?auto_506117 ?auto_506116 ) ( ON ?auto_506118 ?auto_506117 ) ( ON ?auto_506119 ?auto_506118 ) ( not ( = ?auto_506108 ?auto_506109 ) ) ( not ( = ?auto_506108 ?auto_506110 ) ) ( not ( = ?auto_506108 ?auto_506111 ) ) ( not ( = ?auto_506108 ?auto_506112 ) ) ( not ( = ?auto_506108 ?auto_506113 ) ) ( not ( = ?auto_506108 ?auto_506114 ) ) ( not ( = ?auto_506108 ?auto_506115 ) ) ( not ( = ?auto_506108 ?auto_506116 ) ) ( not ( = ?auto_506108 ?auto_506117 ) ) ( not ( = ?auto_506108 ?auto_506118 ) ) ( not ( = ?auto_506108 ?auto_506119 ) ) ( not ( = ?auto_506108 ?auto_506120 ) ) ( not ( = ?auto_506108 ?auto_506121 ) ) ( not ( = ?auto_506108 ?auto_506122 ) ) ( not ( = ?auto_506109 ?auto_506110 ) ) ( not ( = ?auto_506109 ?auto_506111 ) ) ( not ( = ?auto_506109 ?auto_506112 ) ) ( not ( = ?auto_506109 ?auto_506113 ) ) ( not ( = ?auto_506109 ?auto_506114 ) ) ( not ( = ?auto_506109 ?auto_506115 ) ) ( not ( = ?auto_506109 ?auto_506116 ) ) ( not ( = ?auto_506109 ?auto_506117 ) ) ( not ( = ?auto_506109 ?auto_506118 ) ) ( not ( = ?auto_506109 ?auto_506119 ) ) ( not ( = ?auto_506109 ?auto_506120 ) ) ( not ( = ?auto_506109 ?auto_506121 ) ) ( not ( = ?auto_506109 ?auto_506122 ) ) ( not ( = ?auto_506110 ?auto_506111 ) ) ( not ( = ?auto_506110 ?auto_506112 ) ) ( not ( = ?auto_506110 ?auto_506113 ) ) ( not ( = ?auto_506110 ?auto_506114 ) ) ( not ( = ?auto_506110 ?auto_506115 ) ) ( not ( = ?auto_506110 ?auto_506116 ) ) ( not ( = ?auto_506110 ?auto_506117 ) ) ( not ( = ?auto_506110 ?auto_506118 ) ) ( not ( = ?auto_506110 ?auto_506119 ) ) ( not ( = ?auto_506110 ?auto_506120 ) ) ( not ( = ?auto_506110 ?auto_506121 ) ) ( not ( = ?auto_506110 ?auto_506122 ) ) ( not ( = ?auto_506111 ?auto_506112 ) ) ( not ( = ?auto_506111 ?auto_506113 ) ) ( not ( = ?auto_506111 ?auto_506114 ) ) ( not ( = ?auto_506111 ?auto_506115 ) ) ( not ( = ?auto_506111 ?auto_506116 ) ) ( not ( = ?auto_506111 ?auto_506117 ) ) ( not ( = ?auto_506111 ?auto_506118 ) ) ( not ( = ?auto_506111 ?auto_506119 ) ) ( not ( = ?auto_506111 ?auto_506120 ) ) ( not ( = ?auto_506111 ?auto_506121 ) ) ( not ( = ?auto_506111 ?auto_506122 ) ) ( not ( = ?auto_506112 ?auto_506113 ) ) ( not ( = ?auto_506112 ?auto_506114 ) ) ( not ( = ?auto_506112 ?auto_506115 ) ) ( not ( = ?auto_506112 ?auto_506116 ) ) ( not ( = ?auto_506112 ?auto_506117 ) ) ( not ( = ?auto_506112 ?auto_506118 ) ) ( not ( = ?auto_506112 ?auto_506119 ) ) ( not ( = ?auto_506112 ?auto_506120 ) ) ( not ( = ?auto_506112 ?auto_506121 ) ) ( not ( = ?auto_506112 ?auto_506122 ) ) ( not ( = ?auto_506113 ?auto_506114 ) ) ( not ( = ?auto_506113 ?auto_506115 ) ) ( not ( = ?auto_506113 ?auto_506116 ) ) ( not ( = ?auto_506113 ?auto_506117 ) ) ( not ( = ?auto_506113 ?auto_506118 ) ) ( not ( = ?auto_506113 ?auto_506119 ) ) ( not ( = ?auto_506113 ?auto_506120 ) ) ( not ( = ?auto_506113 ?auto_506121 ) ) ( not ( = ?auto_506113 ?auto_506122 ) ) ( not ( = ?auto_506114 ?auto_506115 ) ) ( not ( = ?auto_506114 ?auto_506116 ) ) ( not ( = ?auto_506114 ?auto_506117 ) ) ( not ( = ?auto_506114 ?auto_506118 ) ) ( not ( = ?auto_506114 ?auto_506119 ) ) ( not ( = ?auto_506114 ?auto_506120 ) ) ( not ( = ?auto_506114 ?auto_506121 ) ) ( not ( = ?auto_506114 ?auto_506122 ) ) ( not ( = ?auto_506115 ?auto_506116 ) ) ( not ( = ?auto_506115 ?auto_506117 ) ) ( not ( = ?auto_506115 ?auto_506118 ) ) ( not ( = ?auto_506115 ?auto_506119 ) ) ( not ( = ?auto_506115 ?auto_506120 ) ) ( not ( = ?auto_506115 ?auto_506121 ) ) ( not ( = ?auto_506115 ?auto_506122 ) ) ( not ( = ?auto_506116 ?auto_506117 ) ) ( not ( = ?auto_506116 ?auto_506118 ) ) ( not ( = ?auto_506116 ?auto_506119 ) ) ( not ( = ?auto_506116 ?auto_506120 ) ) ( not ( = ?auto_506116 ?auto_506121 ) ) ( not ( = ?auto_506116 ?auto_506122 ) ) ( not ( = ?auto_506117 ?auto_506118 ) ) ( not ( = ?auto_506117 ?auto_506119 ) ) ( not ( = ?auto_506117 ?auto_506120 ) ) ( not ( = ?auto_506117 ?auto_506121 ) ) ( not ( = ?auto_506117 ?auto_506122 ) ) ( not ( = ?auto_506118 ?auto_506119 ) ) ( not ( = ?auto_506118 ?auto_506120 ) ) ( not ( = ?auto_506118 ?auto_506121 ) ) ( not ( = ?auto_506118 ?auto_506122 ) ) ( not ( = ?auto_506119 ?auto_506120 ) ) ( not ( = ?auto_506119 ?auto_506121 ) ) ( not ( = ?auto_506119 ?auto_506122 ) ) ( not ( = ?auto_506120 ?auto_506121 ) ) ( not ( = ?auto_506120 ?auto_506122 ) ) ( not ( = ?auto_506121 ?auto_506122 ) ) ( CLEAR ?auto_506119 ) ( ON ?auto_506120 ?auto_506121 ) ( CLEAR ?auto_506120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_506108 ?auto_506109 ?auto_506110 ?auto_506111 ?auto_506112 ?auto_506113 ?auto_506114 ?auto_506115 ?auto_506116 ?auto_506117 ?auto_506118 ?auto_506119 ?auto_506120 )
      ( MAKE-14PILE ?auto_506108 ?auto_506109 ?auto_506110 ?auto_506111 ?auto_506112 ?auto_506113 ?auto_506114 ?auto_506115 ?auto_506116 ?auto_506117 ?auto_506118 ?auto_506119 ?auto_506120 ?auto_506121 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506166 - BLOCK
      ?auto_506167 - BLOCK
      ?auto_506168 - BLOCK
      ?auto_506169 - BLOCK
      ?auto_506170 - BLOCK
      ?auto_506171 - BLOCK
      ?auto_506172 - BLOCK
      ?auto_506173 - BLOCK
      ?auto_506174 - BLOCK
      ?auto_506175 - BLOCK
      ?auto_506176 - BLOCK
      ?auto_506177 - BLOCK
      ?auto_506178 - BLOCK
      ?auto_506179 - BLOCK
    )
    :vars
    (
      ?auto_506180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506179 ?auto_506180 ) ( ON-TABLE ?auto_506166 ) ( ON ?auto_506167 ?auto_506166 ) ( ON ?auto_506168 ?auto_506167 ) ( ON ?auto_506169 ?auto_506168 ) ( ON ?auto_506170 ?auto_506169 ) ( ON ?auto_506171 ?auto_506170 ) ( ON ?auto_506172 ?auto_506171 ) ( ON ?auto_506173 ?auto_506172 ) ( ON ?auto_506174 ?auto_506173 ) ( ON ?auto_506175 ?auto_506174 ) ( ON ?auto_506176 ?auto_506175 ) ( not ( = ?auto_506166 ?auto_506167 ) ) ( not ( = ?auto_506166 ?auto_506168 ) ) ( not ( = ?auto_506166 ?auto_506169 ) ) ( not ( = ?auto_506166 ?auto_506170 ) ) ( not ( = ?auto_506166 ?auto_506171 ) ) ( not ( = ?auto_506166 ?auto_506172 ) ) ( not ( = ?auto_506166 ?auto_506173 ) ) ( not ( = ?auto_506166 ?auto_506174 ) ) ( not ( = ?auto_506166 ?auto_506175 ) ) ( not ( = ?auto_506166 ?auto_506176 ) ) ( not ( = ?auto_506166 ?auto_506177 ) ) ( not ( = ?auto_506166 ?auto_506178 ) ) ( not ( = ?auto_506166 ?auto_506179 ) ) ( not ( = ?auto_506166 ?auto_506180 ) ) ( not ( = ?auto_506167 ?auto_506168 ) ) ( not ( = ?auto_506167 ?auto_506169 ) ) ( not ( = ?auto_506167 ?auto_506170 ) ) ( not ( = ?auto_506167 ?auto_506171 ) ) ( not ( = ?auto_506167 ?auto_506172 ) ) ( not ( = ?auto_506167 ?auto_506173 ) ) ( not ( = ?auto_506167 ?auto_506174 ) ) ( not ( = ?auto_506167 ?auto_506175 ) ) ( not ( = ?auto_506167 ?auto_506176 ) ) ( not ( = ?auto_506167 ?auto_506177 ) ) ( not ( = ?auto_506167 ?auto_506178 ) ) ( not ( = ?auto_506167 ?auto_506179 ) ) ( not ( = ?auto_506167 ?auto_506180 ) ) ( not ( = ?auto_506168 ?auto_506169 ) ) ( not ( = ?auto_506168 ?auto_506170 ) ) ( not ( = ?auto_506168 ?auto_506171 ) ) ( not ( = ?auto_506168 ?auto_506172 ) ) ( not ( = ?auto_506168 ?auto_506173 ) ) ( not ( = ?auto_506168 ?auto_506174 ) ) ( not ( = ?auto_506168 ?auto_506175 ) ) ( not ( = ?auto_506168 ?auto_506176 ) ) ( not ( = ?auto_506168 ?auto_506177 ) ) ( not ( = ?auto_506168 ?auto_506178 ) ) ( not ( = ?auto_506168 ?auto_506179 ) ) ( not ( = ?auto_506168 ?auto_506180 ) ) ( not ( = ?auto_506169 ?auto_506170 ) ) ( not ( = ?auto_506169 ?auto_506171 ) ) ( not ( = ?auto_506169 ?auto_506172 ) ) ( not ( = ?auto_506169 ?auto_506173 ) ) ( not ( = ?auto_506169 ?auto_506174 ) ) ( not ( = ?auto_506169 ?auto_506175 ) ) ( not ( = ?auto_506169 ?auto_506176 ) ) ( not ( = ?auto_506169 ?auto_506177 ) ) ( not ( = ?auto_506169 ?auto_506178 ) ) ( not ( = ?auto_506169 ?auto_506179 ) ) ( not ( = ?auto_506169 ?auto_506180 ) ) ( not ( = ?auto_506170 ?auto_506171 ) ) ( not ( = ?auto_506170 ?auto_506172 ) ) ( not ( = ?auto_506170 ?auto_506173 ) ) ( not ( = ?auto_506170 ?auto_506174 ) ) ( not ( = ?auto_506170 ?auto_506175 ) ) ( not ( = ?auto_506170 ?auto_506176 ) ) ( not ( = ?auto_506170 ?auto_506177 ) ) ( not ( = ?auto_506170 ?auto_506178 ) ) ( not ( = ?auto_506170 ?auto_506179 ) ) ( not ( = ?auto_506170 ?auto_506180 ) ) ( not ( = ?auto_506171 ?auto_506172 ) ) ( not ( = ?auto_506171 ?auto_506173 ) ) ( not ( = ?auto_506171 ?auto_506174 ) ) ( not ( = ?auto_506171 ?auto_506175 ) ) ( not ( = ?auto_506171 ?auto_506176 ) ) ( not ( = ?auto_506171 ?auto_506177 ) ) ( not ( = ?auto_506171 ?auto_506178 ) ) ( not ( = ?auto_506171 ?auto_506179 ) ) ( not ( = ?auto_506171 ?auto_506180 ) ) ( not ( = ?auto_506172 ?auto_506173 ) ) ( not ( = ?auto_506172 ?auto_506174 ) ) ( not ( = ?auto_506172 ?auto_506175 ) ) ( not ( = ?auto_506172 ?auto_506176 ) ) ( not ( = ?auto_506172 ?auto_506177 ) ) ( not ( = ?auto_506172 ?auto_506178 ) ) ( not ( = ?auto_506172 ?auto_506179 ) ) ( not ( = ?auto_506172 ?auto_506180 ) ) ( not ( = ?auto_506173 ?auto_506174 ) ) ( not ( = ?auto_506173 ?auto_506175 ) ) ( not ( = ?auto_506173 ?auto_506176 ) ) ( not ( = ?auto_506173 ?auto_506177 ) ) ( not ( = ?auto_506173 ?auto_506178 ) ) ( not ( = ?auto_506173 ?auto_506179 ) ) ( not ( = ?auto_506173 ?auto_506180 ) ) ( not ( = ?auto_506174 ?auto_506175 ) ) ( not ( = ?auto_506174 ?auto_506176 ) ) ( not ( = ?auto_506174 ?auto_506177 ) ) ( not ( = ?auto_506174 ?auto_506178 ) ) ( not ( = ?auto_506174 ?auto_506179 ) ) ( not ( = ?auto_506174 ?auto_506180 ) ) ( not ( = ?auto_506175 ?auto_506176 ) ) ( not ( = ?auto_506175 ?auto_506177 ) ) ( not ( = ?auto_506175 ?auto_506178 ) ) ( not ( = ?auto_506175 ?auto_506179 ) ) ( not ( = ?auto_506175 ?auto_506180 ) ) ( not ( = ?auto_506176 ?auto_506177 ) ) ( not ( = ?auto_506176 ?auto_506178 ) ) ( not ( = ?auto_506176 ?auto_506179 ) ) ( not ( = ?auto_506176 ?auto_506180 ) ) ( not ( = ?auto_506177 ?auto_506178 ) ) ( not ( = ?auto_506177 ?auto_506179 ) ) ( not ( = ?auto_506177 ?auto_506180 ) ) ( not ( = ?auto_506178 ?auto_506179 ) ) ( not ( = ?auto_506178 ?auto_506180 ) ) ( not ( = ?auto_506179 ?auto_506180 ) ) ( ON ?auto_506178 ?auto_506179 ) ( CLEAR ?auto_506176 ) ( ON ?auto_506177 ?auto_506178 ) ( CLEAR ?auto_506177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_506166 ?auto_506167 ?auto_506168 ?auto_506169 ?auto_506170 ?auto_506171 ?auto_506172 ?auto_506173 ?auto_506174 ?auto_506175 ?auto_506176 ?auto_506177 )
      ( MAKE-14PILE ?auto_506166 ?auto_506167 ?auto_506168 ?auto_506169 ?auto_506170 ?auto_506171 ?auto_506172 ?auto_506173 ?auto_506174 ?auto_506175 ?auto_506176 ?auto_506177 ?auto_506178 ?auto_506179 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506224 - BLOCK
      ?auto_506225 - BLOCK
      ?auto_506226 - BLOCK
      ?auto_506227 - BLOCK
      ?auto_506228 - BLOCK
      ?auto_506229 - BLOCK
      ?auto_506230 - BLOCK
      ?auto_506231 - BLOCK
      ?auto_506232 - BLOCK
      ?auto_506233 - BLOCK
      ?auto_506234 - BLOCK
      ?auto_506235 - BLOCK
      ?auto_506236 - BLOCK
      ?auto_506237 - BLOCK
    )
    :vars
    (
      ?auto_506238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506237 ?auto_506238 ) ( ON-TABLE ?auto_506224 ) ( ON ?auto_506225 ?auto_506224 ) ( ON ?auto_506226 ?auto_506225 ) ( ON ?auto_506227 ?auto_506226 ) ( ON ?auto_506228 ?auto_506227 ) ( ON ?auto_506229 ?auto_506228 ) ( ON ?auto_506230 ?auto_506229 ) ( ON ?auto_506231 ?auto_506230 ) ( ON ?auto_506232 ?auto_506231 ) ( ON ?auto_506233 ?auto_506232 ) ( not ( = ?auto_506224 ?auto_506225 ) ) ( not ( = ?auto_506224 ?auto_506226 ) ) ( not ( = ?auto_506224 ?auto_506227 ) ) ( not ( = ?auto_506224 ?auto_506228 ) ) ( not ( = ?auto_506224 ?auto_506229 ) ) ( not ( = ?auto_506224 ?auto_506230 ) ) ( not ( = ?auto_506224 ?auto_506231 ) ) ( not ( = ?auto_506224 ?auto_506232 ) ) ( not ( = ?auto_506224 ?auto_506233 ) ) ( not ( = ?auto_506224 ?auto_506234 ) ) ( not ( = ?auto_506224 ?auto_506235 ) ) ( not ( = ?auto_506224 ?auto_506236 ) ) ( not ( = ?auto_506224 ?auto_506237 ) ) ( not ( = ?auto_506224 ?auto_506238 ) ) ( not ( = ?auto_506225 ?auto_506226 ) ) ( not ( = ?auto_506225 ?auto_506227 ) ) ( not ( = ?auto_506225 ?auto_506228 ) ) ( not ( = ?auto_506225 ?auto_506229 ) ) ( not ( = ?auto_506225 ?auto_506230 ) ) ( not ( = ?auto_506225 ?auto_506231 ) ) ( not ( = ?auto_506225 ?auto_506232 ) ) ( not ( = ?auto_506225 ?auto_506233 ) ) ( not ( = ?auto_506225 ?auto_506234 ) ) ( not ( = ?auto_506225 ?auto_506235 ) ) ( not ( = ?auto_506225 ?auto_506236 ) ) ( not ( = ?auto_506225 ?auto_506237 ) ) ( not ( = ?auto_506225 ?auto_506238 ) ) ( not ( = ?auto_506226 ?auto_506227 ) ) ( not ( = ?auto_506226 ?auto_506228 ) ) ( not ( = ?auto_506226 ?auto_506229 ) ) ( not ( = ?auto_506226 ?auto_506230 ) ) ( not ( = ?auto_506226 ?auto_506231 ) ) ( not ( = ?auto_506226 ?auto_506232 ) ) ( not ( = ?auto_506226 ?auto_506233 ) ) ( not ( = ?auto_506226 ?auto_506234 ) ) ( not ( = ?auto_506226 ?auto_506235 ) ) ( not ( = ?auto_506226 ?auto_506236 ) ) ( not ( = ?auto_506226 ?auto_506237 ) ) ( not ( = ?auto_506226 ?auto_506238 ) ) ( not ( = ?auto_506227 ?auto_506228 ) ) ( not ( = ?auto_506227 ?auto_506229 ) ) ( not ( = ?auto_506227 ?auto_506230 ) ) ( not ( = ?auto_506227 ?auto_506231 ) ) ( not ( = ?auto_506227 ?auto_506232 ) ) ( not ( = ?auto_506227 ?auto_506233 ) ) ( not ( = ?auto_506227 ?auto_506234 ) ) ( not ( = ?auto_506227 ?auto_506235 ) ) ( not ( = ?auto_506227 ?auto_506236 ) ) ( not ( = ?auto_506227 ?auto_506237 ) ) ( not ( = ?auto_506227 ?auto_506238 ) ) ( not ( = ?auto_506228 ?auto_506229 ) ) ( not ( = ?auto_506228 ?auto_506230 ) ) ( not ( = ?auto_506228 ?auto_506231 ) ) ( not ( = ?auto_506228 ?auto_506232 ) ) ( not ( = ?auto_506228 ?auto_506233 ) ) ( not ( = ?auto_506228 ?auto_506234 ) ) ( not ( = ?auto_506228 ?auto_506235 ) ) ( not ( = ?auto_506228 ?auto_506236 ) ) ( not ( = ?auto_506228 ?auto_506237 ) ) ( not ( = ?auto_506228 ?auto_506238 ) ) ( not ( = ?auto_506229 ?auto_506230 ) ) ( not ( = ?auto_506229 ?auto_506231 ) ) ( not ( = ?auto_506229 ?auto_506232 ) ) ( not ( = ?auto_506229 ?auto_506233 ) ) ( not ( = ?auto_506229 ?auto_506234 ) ) ( not ( = ?auto_506229 ?auto_506235 ) ) ( not ( = ?auto_506229 ?auto_506236 ) ) ( not ( = ?auto_506229 ?auto_506237 ) ) ( not ( = ?auto_506229 ?auto_506238 ) ) ( not ( = ?auto_506230 ?auto_506231 ) ) ( not ( = ?auto_506230 ?auto_506232 ) ) ( not ( = ?auto_506230 ?auto_506233 ) ) ( not ( = ?auto_506230 ?auto_506234 ) ) ( not ( = ?auto_506230 ?auto_506235 ) ) ( not ( = ?auto_506230 ?auto_506236 ) ) ( not ( = ?auto_506230 ?auto_506237 ) ) ( not ( = ?auto_506230 ?auto_506238 ) ) ( not ( = ?auto_506231 ?auto_506232 ) ) ( not ( = ?auto_506231 ?auto_506233 ) ) ( not ( = ?auto_506231 ?auto_506234 ) ) ( not ( = ?auto_506231 ?auto_506235 ) ) ( not ( = ?auto_506231 ?auto_506236 ) ) ( not ( = ?auto_506231 ?auto_506237 ) ) ( not ( = ?auto_506231 ?auto_506238 ) ) ( not ( = ?auto_506232 ?auto_506233 ) ) ( not ( = ?auto_506232 ?auto_506234 ) ) ( not ( = ?auto_506232 ?auto_506235 ) ) ( not ( = ?auto_506232 ?auto_506236 ) ) ( not ( = ?auto_506232 ?auto_506237 ) ) ( not ( = ?auto_506232 ?auto_506238 ) ) ( not ( = ?auto_506233 ?auto_506234 ) ) ( not ( = ?auto_506233 ?auto_506235 ) ) ( not ( = ?auto_506233 ?auto_506236 ) ) ( not ( = ?auto_506233 ?auto_506237 ) ) ( not ( = ?auto_506233 ?auto_506238 ) ) ( not ( = ?auto_506234 ?auto_506235 ) ) ( not ( = ?auto_506234 ?auto_506236 ) ) ( not ( = ?auto_506234 ?auto_506237 ) ) ( not ( = ?auto_506234 ?auto_506238 ) ) ( not ( = ?auto_506235 ?auto_506236 ) ) ( not ( = ?auto_506235 ?auto_506237 ) ) ( not ( = ?auto_506235 ?auto_506238 ) ) ( not ( = ?auto_506236 ?auto_506237 ) ) ( not ( = ?auto_506236 ?auto_506238 ) ) ( not ( = ?auto_506237 ?auto_506238 ) ) ( ON ?auto_506236 ?auto_506237 ) ( ON ?auto_506235 ?auto_506236 ) ( CLEAR ?auto_506233 ) ( ON ?auto_506234 ?auto_506235 ) ( CLEAR ?auto_506234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_506224 ?auto_506225 ?auto_506226 ?auto_506227 ?auto_506228 ?auto_506229 ?auto_506230 ?auto_506231 ?auto_506232 ?auto_506233 ?auto_506234 )
      ( MAKE-14PILE ?auto_506224 ?auto_506225 ?auto_506226 ?auto_506227 ?auto_506228 ?auto_506229 ?auto_506230 ?auto_506231 ?auto_506232 ?auto_506233 ?auto_506234 ?auto_506235 ?auto_506236 ?auto_506237 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506282 - BLOCK
      ?auto_506283 - BLOCK
      ?auto_506284 - BLOCK
      ?auto_506285 - BLOCK
      ?auto_506286 - BLOCK
      ?auto_506287 - BLOCK
      ?auto_506288 - BLOCK
      ?auto_506289 - BLOCK
      ?auto_506290 - BLOCK
      ?auto_506291 - BLOCK
      ?auto_506292 - BLOCK
      ?auto_506293 - BLOCK
      ?auto_506294 - BLOCK
      ?auto_506295 - BLOCK
    )
    :vars
    (
      ?auto_506296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506295 ?auto_506296 ) ( ON-TABLE ?auto_506282 ) ( ON ?auto_506283 ?auto_506282 ) ( ON ?auto_506284 ?auto_506283 ) ( ON ?auto_506285 ?auto_506284 ) ( ON ?auto_506286 ?auto_506285 ) ( ON ?auto_506287 ?auto_506286 ) ( ON ?auto_506288 ?auto_506287 ) ( ON ?auto_506289 ?auto_506288 ) ( ON ?auto_506290 ?auto_506289 ) ( not ( = ?auto_506282 ?auto_506283 ) ) ( not ( = ?auto_506282 ?auto_506284 ) ) ( not ( = ?auto_506282 ?auto_506285 ) ) ( not ( = ?auto_506282 ?auto_506286 ) ) ( not ( = ?auto_506282 ?auto_506287 ) ) ( not ( = ?auto_506282 ?auto_506288 ) ) ( not ( = ?auto_506282 ?auto_506289 ) ) ( not ( = ?auto_506282 ?auto_506290 ) ) ( not ( = ?auto_506282 ?auto_506291 ) ) ( not ( = ?auto_506282 ?auto_506292 ) ) ( not ( = ?auto_506282 ?auto_506293 ) ) ( not ( = ?auto_506282 ?auto_506294 ) ) ( not ( = ?auto_506282 ?auto_506295 ) ) ( not ( = ?auto_506282 ?auto_506296 ) ) ( not ( = ?auto_506283 ?auto_506284 ) ) ( not ( = ?auto_506283 ?auto_506285 ) ) ( not ( = ?auto_506283 ?auto_506286 ) ) ( not ( = ?auto_506283 ?auto_506287 ) ) ( not ( = ?auto_506283 ?auto_506288 ) ) ( not ( = ?auto_506283 ?auto_506289 ) ) ( not ( = ?auto_506283 ?auto_506290 ) ) ( not ( = ?auto_506283 ?auto_506291 ) ) ( not ( = ?auto_506283 ?auto_506292 ) ) ( not ( = ?auto_506283 ?auto_506293 ) ) ( not ( = ?auto_506283 ?auto_506294 ) ) ( not ( = ?auto_506283 ?auto_506295 ) ) ( not ( = ?auto_506283 ?auto_506296 ) ) ( not ( = ?auto_506284 ?auto_506285 ) ) ( not ( = ?auto_506284 ?auto_506286 ) ) ( not ( = ?auto_506284 ?auto_506287 ) ) ( not ( = ?auto_506284 ?auto_506288 ) ) ( not ( = ?auto_506284 ?auto_506289 ) ) ( not ( = ?auto_506284 ?auto_506290 ) ) ( not ( = ?auto_506284 ?auto_506291 ) ) ( not ( = ?auto_506284 ?auto_506292 ) ) ( not ( = ?auto_506284 ?auto_506293 ) ) ( not ( = ?auto_506284 ?auto_506294 ) ) ( not ( = ?auto_506284 ?auto_506295 ) ) ( not ( = ?auto_506284 ?auto_506296 ) ) ( not ( = ?auto_506285 ?auto_506286 ) ) ( not ( = ?auto_506285 ?auto_506287 ) ) ( not ( = ?auto_506285 ?auto_506288 ) ) ( not ( = ?auto_506285 ?auto_506289 ) ) ( not ( = ?auto_506285 ?auto_506290 ) ) ( not ( = ?auto_506285 ?auto_506291 ) ) ( not ( = ?auto_506285 ?auto_506292 ) ) ( not ( = ?auto_506285 ?auto_506293 ) ) ( not ( = ?auto_506285 ?auto_506294 ) ) ( not ( = ?auto_506285 ?auto_506295 ) ) ( not ( = ?auto_506285 ?auto_506296 ) ) ( not ( = ?auto_506286 ?auto_506287 ) ) ( not ( = ?auto_506286 ?auto_506288 ) ) ( not ( = ?auto_506286 ?auto_506289 ) ) ( not ( = ?auto_506286 ?auto_506290 ) ) ( not ( = ?auto_506286 ?auto_506291 ) ) ( not ( = ?auto_506286 ?auto_506292 ) ) ( not ( = ?auto_506286 ?auto_506293 ) ) ( not ( = ?auto_506286 ?auto_506294 ) ) ( not ( = ?auto_506286 ?auto_506295 ) ) ( not ( = ?auto_506286 ?auto_506296 ) ) ( not ( = ?auto_506287 ?auto_506288 ) ) ( not ( = ?auto_506287 ?auto_506289 ) ) ( not ( = ?auto_506287 ?auto_506290 ) ) ( not ( = ?auto_506287 ?auto_506291 ) ) ( not ( = ?auto_506287 ?auto_506292 ) ) ( not ( = ?auto_506287 ?auto_506293 ) ) ( not ( = ?auto_506287 ?auto_506294 ) ) ( not ( = ?auto_506287 ?auto_506295 ) ) ( not ( = ?auto_506287 ?auto_506296 ) ) ( not ( = ?auto_506288 ?auto_506289 ) ) ( not ( = ?auto_506288 ?auto_506290 ) ) ( not ( = ?auto_506288 ?auto_506291 ) ) ( not ( = ?auto_506288 ?auto_506292 ) ) ( not ( = ?auto_506288 ?auto_506293 ) ) ( not ( = ?auto_506288 ?auto_506294 ) ) ( not ( = ?auto_506288 ?auto_506295 ) ) ( not ( = ?auto_506288 ?auto_506296 ) ) ( not ( = ?auto_506289 ?auto_506290 ) ) ( not ( = ?auto_506289 ?auto_506291 ) ) ( not ( = ?auto_506289 ?auto_506292 ) ) ( not ( = ?auto_506289 ?auto_506293 ) ) ( not ( = ?auto_506289 ?auto_506294 ) ) ( not ( = ?auto_506289 ?auto_506295 ) ) ( not ( = ?auto_506289 ?auto_506296 ) ) ( not ( = ?auto_506290 ?auto_506291 ) ) ( not ( = ?auto_506290 ?auto_506292 ) ) ( not ( = ?auto_506290 ?auto_506293 ) ) ( not ( = ?auto_506290 ?auto_506294 ) ) ( not ( = ?auto_506290 ?auto_506295 ) ) ( not ( = ?auto_506290 ?auto_506296 ) ) ( not ( = ?auto_506291 ?auto_506292 ) ) ( not ( = ?auto_506291 ?auto_506293 ) ) ( not ( = ?auto_506291 ?auto_506294 ) ) ( not ( = ?auto_506291 ?auto_506295 ) ) ( not ( = ?auto_506291 ?auto_506296 ) ) ( not ( = ?auto_506292 ?auto_506293 ) ) ( not ( = ?auto_506292 ?auto_506294 ) ) ( not ( = ?auto_506292 ?auto_506295 ) ) ( not ( = ?auto_506292 ?auto_506296 ) ) ( not ( = ?auto_506293 ?auto_506294 ) ) ( not ( = ?auto_506293 ?auto_506295 ) ) ( not ( = ?auto_506293 ?auto_506296 ) ) ( not ( = ?auto_506294 ?auto_506295 ) ) ( not ( = ?auto_506294 ?auto_506296 ) ) ( not ( = ?auto_506295 ?auto_506296 ) ) ( ON ?auto_506294 ?auto_506295 ) ( ON ?auto_506293 ?auto_506294 ) ( ON ?auto_506292 ?auto_506293 ) ( CLEAR ?auto_506290 ) ( ON ?auto_506291 ?auto_506292 ) ( CLEAR ?auto_506291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_506282 ?auto_506283 ?auto_506284 ?auto_506285 ?auto_506286 ?auto_506287 ?auto_506288 ?auto_506289 ?auto_506290 ?auto_506291 )
      ( MAKE-14PILE ?auto_506282 ?auto_506283 ?auto_506284 ?auto_506285 ?auto_506286 ?auto_506287 ?auto_506288 ?auto_506289 ?auto_506290 ?auto_506291 ?auto_506292 ?auto_506293 ?auto_506294 ?auto_506295 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506340 - BLOCK
      ?auto_506341 - BLOCK
      ?auto_506342 - BLOCK
      ?auto_506343 - BLOCK
      ?auto_506344 - BLOCK
      ?auto_506345 - BLOCK
      ?auto_506346 - BLOCK
      ?auto_506347 - BLOCK
      ?auto_506348 - BLOCK
      ?auto_506349 - BLOCK
      ?auto_506350 - BLOCK
      ?auto_506351 - BLOCK
      ?auto_506352 - BLOCK
      ?auto_506353 - BLOCK
    )
    :vars
    (
      ?auto_506354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506353 ?auto_506354 ) ( ON-TABLE ?auto_506340 ) ( ON ?auto_506341 ?auto_506340 ) ( ON ?auto_506342 ?auto_506341 ) ( ON ?auto_506343 ?auto_506342 ) ( ON ?auto_506344 ?auto_506343 ) ( ON ?auto_506345 ?auto_506344 ) ( ON ?auto_506346 ?auto_506345 ) ( ON ?auto_506347 ?auto_506346 ) ( not ( = ?auto_506340 ?auto_506341 ) ) ( not ( = ?auto_506340 ?auto_506342 ) ) ( not ( = ?auto_506340 ?auto_506343 ) ) ( not ( = ?auto_506340 ?auto_506344 ) ) ( not ( = ?auto_506340 ?auto_506345 ) ) ( not ( = ?auto_506340 ?auto_506346 ) ) ( not ( = ?auto_506340 ?auto_506347 ) ) ( not ( = ?auto_506340 ?auto_506348 ) ) ( not ( = ?auto_506340 ?auto_506349 ) ) ( not ( = ?auto_506340 ?auto_506350 ) ) ( not ( = ?auto_506340 ?auto_506351 ) ) ( not ( = ?auto_506340 ?auto_506352 ) ) ( not ( = ?auto_506340 ?auto_506353 ) ) ( not ( = ?auto_506340 ?auto_506354 ) ) ( not ( = ?auto_506341 ?auto_506342 ) ) ( not ( = ?auto_506341 ?auto_506343 ) ) ( not ( = ?auto_506341 ?auto_506344 ) ) ( not ( = ?auto_506341 ?auto_506345 ) ) ( not ( = ?auto_506341 ?auto_506346 ) ) ( not ( = ?auto_506341 ?auto_506347 ) ) ( not ( = ?auto_506341 ?auto_506348 ) ) ( not ( = ?auto_506341 ?auto_506349 ) ) ( not ( = ?auto_506341 ?auto_506350 ) ) ( not ( = ?auto_506341 ?auto_506351 ) ) ( not ( = ?auto_506341 ?auto_506352 ) ) ( not ( = ?auto_506341 ?auto_506353 ) ) ( not ( = ?auto_506341 ?auto_506354 ) ) ( not ( = ?auto_506342 ?auto_506343 ) ) ( not ( = ?auto_506342 ?auto_506344 ) ) ( not ( = ?auto_506342 ?auto_506345 ) ) ( not ( = ?auto_506342 ?auto_506346 ) ) ( not ( = ?auto_506342 ?auto_506347 ) ) ( not ( = ?auto_506342 ?auto_506348 ) ) ( not ( = ?auto_506342 ?auto_506349 ) ) ( not ( = ?auto_506342 ?auto_506350 ) ) ( not ( = ?auto_506342 ?auto_506351 ) ) ( not ( = ?auto_506342 ?auto_506352 ) ) ( not ( = ?auto_506342 ?auto_506353 ) ) ( not ( = ?auto_506342 ?auto_506354 ) ) ( not ( = ?auto_506343 ?auto_506344 ) ) ( not ( = ?auto_506343 ?auto_506345 ) ) ( not ( = ?auto_506343 ?auto_506346 ) ) ( not ( = ?auto_506343 ?auto_506347 ) ) ( not ( = ?auto_506343 ?auto_506348 ) ) ( not ( = ?auto_506343 ?auto_506349 ) ) ( not ( = ?auto_506343 ?auto_506350 ) ) ( not ( = ?auto_506343 ?auto_506351 ) ) ( not ( = ?auto_506343 ?auto_506352 ) ) ( not ( = ?auto_506343 ?auto_506353 ) ) ( not ( = ?auto_506343 ?auto_506354 ) ) ( not ( = ?auto_506344 ?auto_506345 ) ) ( not ( = ?auto_506344 ?auto_506346 ) ) ( not ( = ?auto_506344 ?auto_506347 ) ) ( not ( = ?auto_506344 ?auto_506348 ) ) ( not ( = ?auto_506344 ?auto_506349 ) ) ( not ( = ?auto_506344 ?auto_506350 ) ) ( not ( = ?auto_506344 ?auto_506351 ) ) ( not ( = ?auto_506344 ?auto_506352 ) ) ( not ( = ?auto_506344 ?auto_506353 ) ) ( not ( = ?auto_506344 ?auto_506354 ) ) ( not ( = ?auto_506345 ?auto_506346 ) ) ( not ( = ?auto_506345 ?auto_506347 ) ) ( not ( = ?auto_506345 ?auto_506348 ) ) ( not ( = ?auto_506345 ?auto_506349 ) ) ( not ( = ?auto_506345 ?auto_506350 ) ) ( not ( = ?auto_506345 ?auto_506351 ) ) ( not ( = ?auto_506345 ?auto_506352 ) ) ( not ( = ?auto_506345 ?auto_506353 ) ) ( not ( = ?auto_506345 ?auto_506354 ) ) ( not ( = ?auto_506346 ?auto_506347 ) ) ( not ( = ?auto_506346 ?auto_506348 ) ) ( not ( = ?auto_506346 ?auto_506349 ) ) ( not ( = ?auto_506346 ?auto_506350 ) ) ( not ( = ?auto_506346 ?auto_506351 ) ) ( not ( = ?auto_506346 ?auto_506352 ) ) ( not ( = ?auto_506346 ?auto_506353 ) ) ( not ( = ?auto_506346 ?auto_506354 ) ) ( not ( = ?auto_506347 ?auto_506348 ) ) ( not ( = ?auto_506347 ?auto_506349 ) ) ( not ( = ?auto_506347 ?auto_506350 ) ) ( not ( = ?auto_506347 ?auto_506351 ) ) ( not ( = ?auto_506347 ?auto_506352 ) ) ( not ( = ?auto_506347 ?auto_506353 ) ) ( not ( = ?auto_506347 ?auto_506354 ) ) ( not ( = ?auto_506348 ?auto_506349 ) ) ( not ( = ?auto_506348 ?auto_506350 ) ) ( not ( = ?auto_506348 ?auto_506351 ) ) ( not ( = ?auto_506348 ?auto_506352 ) ) ( not ( = ?auto_506348 ?auto_506353 ) ) ( not ( = ?auto_506348 ?auto_506354 ) ) ( not ( = ?auto_506349 ?auto_506350 ) ) ( not ( = ?auto_506349 ?auto_506351 ) ) ( not ( = ?auto_506349 ?auto_506352 ) ) ( not ( = ?auto_506349 ?auto_506353 ) ) ( not ( = ?auto_506349 ?auto_506354 ) ) ( not ( = ?auto_506350 ?auto_506351 ) ) ( not ( = ?auto_506350 ?auto_506352 ) ) ( not ( = ?auto_506350 ?auto_506353 ) ) ( not ( = ?auto_506350 ?auto_506354 ) ) ( not ( = ?auto_506351 ?auto_506352 ) ) ( not ( = ?auto_506351 ?auto_506353 ) ) ( not ( = ?auto_506351 ?auto_506354 ) ) ( not ( = ?auto_506352 ?auto_506353 ) ) ( not ( = ?auto_506352 ?auto_506354 ) ) ( not ( = ?auto_506353 ?auto_506354 ) ) ( ON ?auto_506352 ?auto_506353 ) ( ON ?auto_506351 ?auto_506352 ) ( ON ?auto_506350 ?auto_506351 ) ( ON ?auto_506349 ?auto_506350 ) ( CLEAR ?auto_506347 ) ( ON ?auto_506348 ?auto_506349 ) ( CLEAR ?auto_506348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_506340 ?auto_506341 ?auto_506342 ?auto_506343 ?auto_506344 ?auto_506345 ?auto_506346 ?auto_506347 ?auto_506348 )
      ( MAKE-14PILE ?auto_506340 ?auto_506341 ?auto_506342 ?auto_506343 ?auto_506344 ?auto_506345 ?auto_506346 ?auto_506347 ?auto_506348 ?auto_506349 ?auto_506350 ?auto_506351 ?auto_506352 ?auto_506353 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506398 - BLOCK
      ?auto_506399 - BLOCK
      ?auto_506400 - BLOCK
      ?auto_506401 - BLOCK
      ?auto_506402 - BLOCK
      ?auto_506403 - BLOCK
      ?auto_506404 - BLOCK
      ?auto_506405 - BLOCK
      ?auto_506406 - BLOCK
      ?auto_506407 - BLOCK
      ?auto_506408 - BLOCK
      ?auto_506409 - BLOCK
      ?auto_506410 - BLOCK
      ?auto_506411 - BLOCK
    )
    :vars
    (
      ?auto_506412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506411 ?auto_506412 ) ( ON-TABLE ?auto_506398 ) ( ON ?auto_506399 ?auto_506398 ) ( ON ?auto_506400 ?auto_506399 ) ( ON ?auto_506401 ?auto_506400 ) ( ON ?auto_506402 ?auto_506401 ) ( ON ?auto_506403 ?auto_506402 ) ( ON ?auto_506404 ?auto_506403 ) ( not ( = ?auto_506398 ?auto_506399 ) ) ( not ( = ?auto_506398 ?auto_506400 ) ) ( not ( = ?auto_506398 ?auto_506401 ) ) ( not ( = ?auto_506398 ?auto_506402 ) ) ( not ( = ?auto_506398 ?auto_506403 ) ) ( not ( = ?auto_506398 ?auto_506404 ) ) ( not ( = ?auto_506398 ?auto_506405 ) ) ( not ( = ?auto_506398 ?auto_506406 ) ) ( not ( = ?auto_506398 ?auto_506407 ) ) ( not ( = ?auto_506398 ?auto_506408 ) ) ( not ( = ?auto_506398 ?auto_506409 ) ) ( not ( = ?auto_506398 ?auto_506410 ) ) ( not ( = ?auto_506398 ?auto_506411 ) ) ( not ( = ?auto_506398 ?auto_506412 ) ) ( not ( = ?auto_506399 ?auto_506400 ) ) ( not ( = ?auto_506399 ?auto_506401 ) ) ( not ( = ?auto_506399 ?auto_506402 ) ) ( not ( = ?auto_506399 ?auto_506403 ) ) ( not ( = ?auto_506399 ?auto_506404 ) ) ( not ( = ?auto_506399 ?auto_506405 ) ) ( not ( = ?auto_506399 ?auto_506406 ) ) ( not ( = ?auto_506399 ?auto_506407 ) ) ( not ( = ?auto_506399 ?auto_506408 ) ) ( not ( = ?auto_506399 ?auto_506409 ) ) ( not ( = ?auto_506399 ?auto_506410 ) ) ( not ( = ?auto_506399 ?auto_506411 ) ) ( not ( = ?auto_506399 ?auto_506412 ) ) ( not ( = ?auto_506400 ?auto_506401 ) ) ( not ( = ?auto_506400 ?auto_506402 ) ) ( not ( = ?auto_506400 ?auto_506403 ) ) ( not ( = ?auto_506400 ?auto_506404 ) ) ( not ( = ?auto_506400 ?auto_506405 ) ) ( not ( = ?auto_506400 ?auto_506406 ) ) ( not ( = ?auto_506400 ?auto_506407 ) ) ( not ( = ?auto_506400 ?auto_506408 ) ) ( not ( = ?auto_506400 ?auto_506409 ) ) ( not ( = ?auto_506400 ?auto_506410 ) ) ( not ( = ?auto_506400 ?auto_506411 ) ) ( not ( = ?auto_506400 ?auto_506412 ) ) ( not ( = ?auto_506401 ?auto_506402 ) ) ( not ( = ?auto_506401 ?auto_506403 ) ) ( not ( = ?auto_506401 ?auto_506404 ) ) ( not ( = ?auto_506401 ?auto_506405 ) ) ( not ( = ?auto_506401 ?auto_506406 ) ) ( not ( = ?auto_506401 ?auto_506407 ) ) ( not ( = ?auto_506401 ?auto_506408 ) ) ( not ( = ?auto_506401 ?auto_506409 ) ) ( not ( = ?auto_506401 ?auto_506410 ) ) ( not ( = ?auto_506401 ?auto_506411 ) ) ( not ( = ?auto_506401 ?auto_506412 ) ) ( not ( = ?auto_506402 ?auto_506403 ) ) ( not ( = ?auto_506402 ?auto_506404 ) ) ( not ( = ?auto_506402 ?auto_506405 ) ) ( not ( = ?auto_506402 ?auto_506406 ) ) ( not ( = ?auto_506402 ?auto_506407 ) ) ( not ( = ?auto_506402 ?auto_506408 ) ) ( not ( = ?auto_506402 ?auto_506409 ) ) ( not ( = ?auto_506402 ?auto_506410 ) ) ( not ( = ?auto_506402 ?auto_506411 ) ) ( not ( = ?auto_506402 ?auto_506412 ) ) ( not ( = ?auto_506403 ?auto_506404 ) ) ( not ( = ?auto_506403 ?auto_506405 ) ) ( not ( = ?auto_506403 ?auto_506406 ) ) ( not ( = ?auto_506403 ?auto_506407 ) ) ( not ( = ?auto_506403 ?auto_506408 ) ) ( not ( = ?auto_506403 ?auto_506409 ) ) ( not ( = ?auto_506403 ?auto_506410 ) ) ( not ( = ?auto_506403 ?auto_506411 ) ) ( not ( = ?auto_506403 ?auto_506412 ) ) ( not ( = ?auto_506404 ?auto_506405 ) ) ( not ( = ?auto_506404 ?auto_506406 ) ) ( not ( = ?auto_506404 ?auto_506407 ) ) ( not ( = ?auto_506404 ?auto_506408 ) ) ( not ( = ?auto_506404 ?auto_506409 ) ) ( not ( = ?auto_506404 ?auto_506410 ) ) ( not ( = ?auto_506404 ?auto_506411 ) ) ( not ( = ?auto_506404 ?auto_506412 ) ) ( not ( = ?auto_506405 ?auto_506406 ) ) ( not ( = ?auto_506405 ?auto_506407 ) ) ( not ( = ?auto_506405 ?auto_506408 ) ) ( not ( = ?auto_506405 ?auto_506409 ) ) ( not ( = ?auto_506405 ?auto_506410 ) ) ( not ( = ?auto_506405 ?auto_506411 ) ) ( not ( = ?auto_506405 ?auto_506412 ) ) ( not ( = ?auto_506406 ?auto_506407 ) ) ( not ( = ?auto_506406 ?auto_506408 ) ) ( not ( = ?auto_506406 ?auto_506409 ) ) ( not ( = ?auto_506406 ?auto_506410 ) ) ( not ( = ?auto_506406 ?auto_506411 ) ) ( not ( = ?auto_506406 ?auto_506412 ) ) ( not ( = ?auto_506407 ?auto_506408 ) ) ( not ( = ?auto_506407 ?auto_506409 ) ) ( not ( = ?auto_506407 ?auto_506410 ) ) ( not ( = ?auto_506407 ?auto_506411 ) ) ( not ( = ?auto_506407 ?auto_506412 ) ) ( not ( = ?auto_506408 ?auto_506409 ) ) ( not ( = ?auto_506408 ?auto_506410 ) ) ( not ( = ?auto_506408 ?auto_506411 ) ) ( not ( = ?auto_506408 ?auto_506412 ) ) ( not ( = ?auto_506409 ?auto_506410 ) ) ( not ( = ?auto_506409 ?auto_506411 ) ) ( not ( = ?auto_506409 ?auto_506412 ) ) ( not ( = ?auto_506410 ?auto_506411 ) ) ( not ( = ?auto_506410 ?auto_506412 ) ) ( not ( = ?auto_506411 ?auto_506412 ) ) ( ON ?auto_506410 ?auto_506411 ) ( ON ?auto_506409 ?auto_506410 ) ( ON ?auto_506408 ?auto_506409 ) ( ON ?auto_506407 ?auto_506408 ) ( ON ?auto_506406 ?auto_506407 ) ( CLEAR ?auto_506404 ) ( ON ?auto_506405 ?auto_506406 ) ( CLEAR ?auto_506405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_506398 ?auto_506399 ?auto_506400 ?auto_506401 ?auto_506402 ?auto_506403 ?auto_506404 ?auto_506405 )
      ( MAKE-14PILE ?auto_506398 ?auto_506399 ?auto_506400 ?auto_506401 ?auto_506402 ?auto_506403 ?auto_506404 ?auto_506405 ?auto_506406 ?auto_506407 ?auto_506408 ?auto_506409 ?auto_506410 ?auto_506411 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506456 - BLOCK
      ?auto_506457 - BLOCK
      ?auto_506458 - BLOCK
      ?auto_506459 - BLOCK
      ?auto_506460 - BLOCK
      ?auto_506461 - BLOCK
      ?auto_506462 - BLOCK
      ?auto_506463 - BLOCK
      ?auto_506464 - BLOCK
      ?auto_506465 - BLOCK
      ?auto_506466 - BLOCK
      ?auto_506467 - BLOCK
      ?auto_506468 - BLOCK
      ?auto_506469 - BLOCK
    )
    :vars
    (
      ?auto_506470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506469 ?auto_506470 ) ( ON-TABLE ?auto_506456 ) ( ON ?auto_506457 ?auto_506456 ) ( ON ?auto_506458 ?auto_506457 ) ( ON ?auto_506459 ?auto_506458 ) ( ON ?auto_506460 ?auto_506459 ) ( ON ?auto_506461 ?auto_506460 ) ( not ( = ?auto_506456 ?auto_506457 ) ) ( not ( = ?auto_506456 ?auto_506458 ) ) ( not ( = ?auto_506456 ?auto_506459 ) ) ( not ( = ?auto_506456 ?auto_506460 ) ) ( not ( = ?auto_506456 ?auto_506461 ) ) ( not ( = ?auto_506456 ?auto_506462 ) ) ( not ( = ?auto_506456 ?auto_506463 ) ) ( not ( = ?auto_506456 ?auto_506464 ) ) ( not ( = ?auto_506456 ?auto_506465 ) ) ( not ( = ?auto_506456 ?auto_506466 ) ) ( not ( = ?auto_506456 ?auto_506467 ) ) ( not ( = ?auto_506456 ?auto_506468 ) ) ( not ( = ?auto_506456 ?auto_506469 ) ) ( not ( = ?auto_506456 ?auto_506470 ) ) ( not ( = ?auto_506457 ?auto_506458 ) ) ( not ( = ?auto_506457 ?auto_506459 ) ) ( not ( = ?auto_506457 ?auto_506460 ) ) ( not ( = ?auto_506457 ?auto_506461 ) ) ( not ( = ?auto_506457 ?auto_506462 ) ) ( not ( = ?auto_506457 ?auto_506463 ) ) ( not ( = ?auto_506457 ?auto_506464 ) ) ( not ( = ?auto_506457 ?auto_506465 ) ) ( not ( = ?auto_506457 ?auto_506466 ) ) ( not ( = ?auto_506457 ?auto_506467 ) ) ( not ( = ?auto_506457 ?auto_506468 ) ) ( not ( = ?auto_506457 ?auto_506469 ) ) ( not ( = ?auto_506457 ?auto_506470 ) ) ( not ( = ?auto_506458 ?auto_506459 ) ) ( not ( = ?auto_506458 ?auto_506460 ) ) ( not ( = ?auto_506458 ?auto_506461 ) ) ( not ( = ?auto_506458 ?auto_506462 ) ) ( not ( = ?auto_506458 ?auto_506463 ) ) ( not ( = ?auto_506458 ?auto_506464 ) ) ( not ( = ?auto_506458 ?auto_506465 ) ) ( not ( = ?auto_506458 ?auto_506466 ) ) ( not ( = ?auto_506458 ?auto_506467 ) ) ( not ( = ?auto_506458 ?auto_506468 ) ) ( not ( = ?auto_506458 ?auto_506469 ) ) ( not ( = ?auto_506458 ?auto_506470 ) ) ( not ( = ?auto_506459 ?auto_506460 ) ) ( not ( = ?auto_506459 ?auto_506461 ) ) ( not ( = ?auto_506459 ?auto_506462 ) ) ( not ( = ?auto_506459 ?auto_506463 ) ) ( not ( = ?auto_506459 ?auto_506464 ) ) ( not ( = ?auto_506459 ?auto_506465 ) ) ( not ( = ?auto_506459 ?auto_506466 ) ) ( not ( = ?auto_506459 ?auto_506467 ) ) ( not ( = ?auto_506459 ?auto_506468 ) ) ( not ( = ?auto_506459 ?auto_506469 ) ) ( not ( = ?auto_506459 ?auto_506470 ) ) ( not ( = ?auto_506460 ?auto_506461 ) ) ( not ( = ?auto_506460 ?auto_506462 ) ) ( not ( = ?auto_506460 ?auto_506463 ) ) ( not ( = ?auto_506460 ?auto_506464 ) ) ( not ( = ?auto_506460 ?auto_506465 ) ) ( not ( = ?auto_506460 ?auto_506466 ) ) ( not ( = ?auto_506460 ?auto_506467 ) ) ( not ( = ?auto_506460 ?auto_506468 ) ) ( not ( = ?auto_506460 ?auto_506469 ) ) ( not ( = ?auto_506460 ?auto_506470 ) ) ( not ( = ?auto_506461 ?auto_506462 ) ) ( not ( = ?auto_506461 ?auto_506463 ) ) ( not ( = ?auto_506461 ?auto_506464 ) ) ( not ( = ?auto_506461 ?auto_506465 ) ) ( not ( = ?auto_506461 ?auto_506466 ) ) ( not ( = ?auto_506461 ?auto_506467 ) ) ( not ( = ?auto_506461 ?auto_506468 ) ) ( not ( = ?auto_506461 ?auto_506469 ) ) ( not ( = ?auto_506461 ?auto_506470 ) ) ( not ( = ?auto_506462 ?auto_506463 ) ) ( not ( = ?auto_506462 ?auto_506464 ) ) ( not ( = ?auto_506462 ?auto_506465 ) ) ( not ( = ?auto_506462 ?auto_506466 ) ) ( not ( = ?auto_506462 ?auto_506467 ) ) ( not ( = ?auto_506462 ?auto_506468 ) ) ( not ( = ?auto_506462 ?auto_506469 ) ) ( not ( = ?auto_506462 ?auto_506470 ) ) ( not ( = ?auto_506463 ?auto_506464 ) ) ( not ( = ?auto_506463 ?auto_506465 ) ) ( not ( = ?auto_506463 ?auto_506466 ) ) ( not ( = ?auto_506463 ?auto_506467 ) ) ( not ( = ?auto_506463 ?auto_506468 ) ) ( not ( = ?auto_506463 ?auto_506469 ) ) ( not ( = ?auto_506463 ?auto_506470 ) ) ( not ( = ?auto_506464 ?auto_506465 ) ) ( not ( = ?auto_506464 ?auto_506466 ) ) ( not ( = ?auto_506464 ?auto_506467 ) ) ( not ( = ?auto_506464 ?auto_506468 ) ) ( not ( = ?auto_506464 ?auto_506469 ) ) ( not ( = ?auto_506464 ?auto_506470 ) ) ( not ( = ?auto_506465 ?auto_506466 ) ) ( not ( = ?auto_506465 ?auto_506467 ) ) ( not ( = ?auto_506465 ?auto_506468 ) ) ( not ( = ?auto_506465 ?auto_506469 ) ) ( not ( = ?auto_506465 ?auto_506470 ) ) ( not ( = ?auto_506466 ?auto_506467 ) ) ( not ( = ?auto_506466 ?auto_506468 ) ) ( not ( = ?auto_506466 ?auto_506469 ) ) ( not ( = ?auto_506466 ?auto_506470 ) ) ( not ( = ?auto_506467 ?auto_506468 ) ) ( not ( = ?auto_506467 ?auto_506469 ) ) ( not ( = ?auto_506467 ?auto_506470 ) ) ( not ( = ?auto_506468 ?auto_506469 ) ) ( not ( = ?auto_506468 ?auto_506470 ) ) ( not ( = ?auto_506469 ?auto_506470 ) ) ( ON ?auto_506468 ?auto_506469 ) ( ON ?auto_506467 ?auto_506468 ) ( ON ?auto_506466 ?auto_506467 ) ( ON ?auto_506465 ?auto_506466 ) ( ON ?auto_506464 ?auto_506465 ) ( ON ?auto_506463 ?auto_506464 ) ( CLEAR ?auto_506461 ) ( ON ?auto_506462 ?auto_506463 ) ( CLEAR ?auto_506462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_506456 ?auto_506457 ?auto_506458 ?auto_506459 ?auto_506460 ?auto_506461 ?auto_506462 )
      ( MAKE-14PILE ?auto_506456 ?auto_506457 ?auto_506458 ?auto_506459 ?auto_506460 ?auto_506461 ?auto_506462 ?auto_506463 ?auto_506464 ?auto_506465 ?auto_506466 ?auto_506467 ?auto_506468 ?auto_506469 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506514 - BLOCK
      ?auto_506515 - BLOCK
      ?auto_506516 - BLOCK
      ?auto_506517 - BLOCK
      ?auto_506518 - BLOCK
      ?auto_506519 - BLOCK
      ?auto_506520 - BLOCK
      ?auto_506521 - BLOCK
      ?auto_506522 - BLOCK
      ?auto_506523 - BLOCK
      ?auto_506524 - BLOCK
      ?auto_506525 - BLOCK
      ?auto_506526 - BLOCK
      ?auto_506527 - BLOCK
    )
    :vars
    (
      ?auto_506528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506527 ?auto_506528 ) ( ON-TABLE ?auto_506514 ) ( ON ?auto_506515 ?auto_506514 ) ( ON ?auto_506516 ?auto_506515 ) ( ON ?auto_506517 ?auto_506516 ) ( ON ?auto_506518 ?auto_506517 ) ( not ( = ?auto_506514 ?auto_506515 ) ) ( not ( = ?auto_506514 ?auto_506516 ) ) ( not ( = ?auto_506514 ?auto_506517 ) ) ( not ( = ?auto_506514 ?auto_506518 ) ) ( not ( = ?auto_506514 ?auto_506519 ) ) ( not ( = ?auto_506514 ?auto_506520 ) ) ( not ( = ?auto_506514 ?auto_506521 ) ) ( not ( = ?auto_506514 ?auto_506522 ) ) ( not ( = ?auto_506514 ?auto_506523 ) ) ( not ( = ?auto_506514 ?auto_506524 ) ) ( not ( = ?auto_506514 ?auto_506525 ) ) ( not ( = ?auto_506514 ?auto_506526 ) ) ( not ( = ?auto_506514 ?auto_506527 ) ) ( not ( = ?auto_506514 ?auto_506528 ) ) ( not ( = ?auto_506515 ?auto_506516 ) ) ( not ( = ?auto_506515 ?auto_506517 ) ) ( not ( = ?auto_506515 ?auto_506518 ) ) ( not ( = ?auto_506515 ?auto_506519 ) ) ( not ( = ?auto_506515 ?auto_506520 ) ) ( not ( = ?auto_506515 ?auto_506521 ) ) ( not ( = ?auto_506515 ?auto_506522 ) ) ( not ( = ?auto_506515 ?auto_506523 ) ) ( not ( = ?auto_506515 ?auto_506524 ) ) ( not ( = ?auto_506515 ?auto_506525 ) ) ( not ( = ?auto_506515 ?auto_506526 ) ) ( not ( = ?auto_506515 ?auto_506527 ) ) ( not ( = ?auto_506515 ?auto_506528 ) ) ( not ( = ?auto_506516 ?auto_506517 ) ) ( not ( = ?auto_506516 ?auto_506518 ) ) ( not ( = ?auto_506516 ?auto_506519 ) ) ( not ( = ?auto_506516 ?auto_506520 ) ) ( not ( = ?auto_506516 ?auto_506521 ) ) ( not ( = ?auto_506516 ?auto_506522 ) ) ( not ( = ?auto_506516 ?auto_506523 ) ) ( not ( = ?auto_506516 ?auto_506524 ) ) ( not ( = ?auto_506516 ?auto_506525 ) ) ( not ( = ?auto_506516 ?auto_506526 ) ) ( not ( = ?auto_506516 ?auto_506527 ) ) ( not ( = ?auto_506516 ?auto_506528 ) ) ( not ( = ?auto_506517 ?auto_506518 ) ) ( not ( = ?auto_506517 ?auto_506519 ) ) ( not ( = ?auto_506517 ?auto_506520 ) ) ( not ( = ?auto_506517 ?auto_506521 ) ) ( not ( = ?auto_506517 ?auto_506522 ) ) ( not ( = ?auto_506517 ?auto_506523 ) ) ( not ( = ?auto_506517 ?auto_506524 ) ) ( not ( = ?auto_506517 ?auto_506525 ) ) ( not ( = ?auto_506517 ?auto_506526 ) ) ( not ( = ?auto_506517 ?auto_506527 ) ) ( not ( = ?auto_506517 ?auto_506528 ) ) ( not ( = ?auto_506518 ?auto_506519 ) ) ( not ( = ?auto_506518 ?auto_506520 ) ) ( not ( = ?auto_506518 ?auto_506521 ) ) ( not ( = ?auto_506518 ?auto_506522 ) ) ( not ( = ?auto_506518 ?auto_506523 ) ) ( not ( = ?auto_506518 ?auto_506524 ) ) ( not ( = ?auto_506518 ?auto_506525 ) ) ( not ( = ?auto_506518 ?auto_506526 ) ) ( not ( = ?auto_506518 ?auto_506527 ) ) ( not ( = ?auto_506518 ?auto_506528 ) ) ( not ( = ?auto_506519 ?auto_506520 ) ) ( not ( = ?auto_506519 ?auto_506521 ) ) ( not ( = ?auto_506519 ?auto_506522 ) ) ( not ( = ?auto_506519 ?auto_506523 ) ) ( not ( = ?auto_506519 ?auto_506524 ) ) ( not ( = ?auto_506519 ?auto_506525 ) ) ( not ( = ?auto_506519 ?auto_506526 ) ) ( not ( = ?auto_506519 ?auto_506527 ) ) ( not ( = ?auto_506519 ?auto_506528 ) ) ( not ( = ?auto_506520 ?auto_506521 ) ) ( not ( = ?auto_506520 ?auto_506522 ) ) ( not ( = ?auto_506520 ?auto_506523 ) ) ( not ( = ?auto_506520 ?auto_506524 ) ) ( not ( = ?auto_506520 ?auto_506525 ) ) ( not ( = ?auto_506520 ?auto_506526 ) ) ( not ( = ?auto_506520 ?auto_506527 ) ) ( not ( = ?auto_506520 ?auto_506528 ) ) ( not ( = ?auto_506521 ?auto_506522 ) ) ( not ( = ?auto_506521 ?auto_506523 ) ) ( not ( = ?auto_506521 ?auto_506524 ) ) ( not ( = ?auto_506521 ?auto_506525 ) ) ( not ( = ?auto_506521 ?auto_506526 ) ) ( not ( = ?auto_506521 ?auto_506527 ) ) ( not ( = ?auto_506521 ?auto_506528 ) ) ( not ( = ?auto_506522 ?auto_506523 ) ) ( not ( = ?auto_506522 ?auto_506524 ) ) ( not ( = ?auto_506522 ?auto_506525 ) ) ( not ( = ?auto_506522 ?auto_506526 ) ) ( not ( = ?auto_506522 ?auto_506527 ) ) ( not ( = ?auto_506522 ?auto_506528 ) ) ( not ( = ?auto_506523 ?auto_506524 ) ) ( not ( = ?auto_506523 ?auto_506525 ) ) ( not ( = ?auto_506523 ?auto_506526 ) ) ( not ( = ?auto_506523 ?auto_506527 ) ) ( not ( = ?auto_506523 ?auto_506528 ) ) ( not ( = ?auto_506524 ?auto_506525 ) ) ( not ( = ?auto_506524 ?auto_506526 ) ) ( not ( = ?auto_506524 ?auto_506527 ) ) ( not ( = ?auto_506524 ?auto_506528 ) ) ( not ( = ?auto_506525 ?auto_506526 ) ) ( not ( = ?auto_506525 ?auto_506527 ) ) ( not ( = ?auto_506525 ?auto_506528 ) ) ( not ( = ?auto_506526 ?auto_506527 ) ) ( not ( = ?auto_506526 ?auto_506528 ) ) ( not ( = ?auto_506527 ?auto_506528 ) ) ( ON ?auto_506526 ?auto_506527 ) ( ON ?auto_506525 ?auto_506526 ) ( ON ?auto_506524 ?auto_506525 ) ( ON ?auto_506523 ?auto_506524 ) ( ON ?auto_506522 ?auto_506523 ) ( ON ?auto_506521 ?auto_506522 ) ( ON ?auto_506520 ?auto_506521 ) ( CLEAR ?auto_506518 ) ( ON ?auto_506519 ?auto_506520 ) ( CLEAR ?auto_506519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_506514 ?auto_506515 ?auto_506516 ?auto_506517 ?auto_506518 ?auto_506519 )
      ( MAKE-14PILE ?auto_506514 ?auto_506515 ?auto_506516 ?auto_506517 ?auto_506518 ?auto_506519 ?auto_506520 ?auto_506521 ?auto_506522 ?auto_506523 ?auto_506524 ?auto_506525 ?auto_506526 ?auto_506527 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506572 - BLOCK
      ?auto_506573 - BLOCK
      ?auto_506574 - BLOCK
      ?auto_506575 - BLOCK
      ?auto_506576 - BLOCK
      ?auto_506577 - BLOCK
      ?auto_506578 - BLOCK
      ?auto_506579 - BLOCK
      ?auto_506580 - BLOCK
      ?auto_506581 - BLOCK
      ?auto_506582 - BLOCK
      ?auto_506583 - BLOCK
      ?auto_506584 - BLOCK
      ?auto_506585 - BLOCK
    )
    :vars
    (
      ?auto_506586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506585 ?auto_506586 ) ( ON-TABLE ?auto_506572 ) ( ON ?auto_506573 ?auto_506572 ) ( ON ?auto_506574 ?auto_506573 ) ( ON ?auto_506575 ?auto_506574 ) ( not ( = ?auto_506572 ?auto_506573 ) ) ( not ( = ?auto_506572 ?auto_506574 ) ) ( not ( = ?auto_506572 ?auto_506575 ) ) ( not ( = ?auto_506572 ?auto_506576 ) ) ( not ( = ?auto_506572 ?auto_506577 ) ) ( not ( = ?auto_506572 ?auto_506578 ) ) ( not ( = ?auto_506572 ?auto_506579 ) ) ( not ( = ?auto_506572 ?auto_506580 ) ) ( not ( = ?auto_506572 ?auto_506581 ) ) ( not ( = ?auto_506572 ?auto_506582 ) ) ( not ( = ?auto_506572 ?auto_506583 ) ) ( not ( = ?auto_506572 ?auto_506584 ) ) ( not ( = ?auto_506572 ?auto_506585 ) ) ( not ( = ?auto_506572 ?auto_506586 ) ) ( not ( = ?auto_506573 ?auto_506574 ) ) ( not ( = ?auto_506573 ?auto_506575 ) ) ( not ( = ?auto_506573 ?auto_506576 ) ) ( not ( = ?auto_506573 ?auto_506577 ) ) ( not ( = ?auto_506573 ?auto_506578 ) ) ( not ( = ?auto_506573 ?auto_506579 ) ) ( not ( = ?auto_506573 ?auto_506580 ) ) ( not ( = ?auto_506573 ?auto_506581 ) ) ( not ( = ?auto_506573 ?auto_506582 ) ) ( not ( = ?auto_506573 ?auto_506583 ) ) ( not ( = ?auto_506573 ?auto_506584 ) ) ( not ( = ?auto_506573 ?auto_506585 ) ) ( not ( = ?auto_506573 ?auto_506586 ) ) ( not ( = ?auto_506574 ?auto_506575 ) ) ( not ( = ?auto_506574 ?auto_506576 ) ) ( not ( = ?auto_506574 ?auto_506577 ) ) ( not ( = ?auto_506574 ?auto_506578 ) ) ( not ( = ?auto_506574 ?auto_506579 ) ) ( not ( = ?auto_506574 ?auto_506580 ) ) ( not ( = ?auto_506574 ?auto_506581 ) ) ( not ( = ?auto_506574 ?auto_506582 ) ) ( not ( = ?auto_506574 ?auto_506583 ) ) ( not ( = ?auto_506574 ?auto_506584 ) ) ( not ( = ?auto_506574 ?auto_506585 ) ) ( not ( = ?auto_506574 ?auto_506586 ) ) ( not ( = ?auto_506575 ?auto_506576 ) ) ( not ( = ?auto_506575 ?auto_506577 ) ) ( not ( = ?auto_506575 ?auto_506578 ) ) ( not ( = ?auto_506575 ?auto_506579 ) ) ( not ( = ?auto_506575 ?auto_506580 ) ) ( not ( = ?auto_506575 ?auto_506581 ) ) ( not ( = ?auto_506575 ?auto_506582 ) ) ( not ( = ?auto_506575 ?auto_506583 ) ) ( not ( = ?auto_506575 ?auto_506584 ) ) ( not ( = ?auto_506575 ?auto_506585 ) ) ( not ( = ?auto_506575 ?auto_506586 ) ) ( not ( = ?auto_506576 ?auto_506577 ) ) ( not ( = ?auto_506576 ?auto_506578 ) ) ( not ( = ?auto_506576 ?auto_506579 ) ) ( not ( = ?auto_506576 ?auto_506580 ) ) ( not ( = ?auto_506576 ?auto_506581 ) ) ( not ( = ?auto_506576 ?auto_506582 ) ) ( not ( = ?auto_506576 ?auto_506583 ) ) ( not ( = ?auto_506576 ?auto_506584 ) ) ( not ( = ?auto_506576 ?auto_506585 ) ) ( not ( = ?auto_506576 ?auto_506586 ) ) ( not ( = ?auto_506577 ?auto_506578 ) ) ( not ( = ?auto_506577 ?auto_506579 ) ) ( not ( = ?auto_506577 ?auto_506580 ) ) ( not ( = ?auto_506577 ?auto_506581 ) ) ( not ( = ?auto_506577 ?auto_506582 ) ) ( not ( = ?auto_506577 ?auto_506583 ) ) ( not ( = ?auto_506577 ?auto_506584 ) ) ( not ( = ?auto_506577 ?auto_506585 ) ) ( not ( = ?auto_506577 ?auto_506586 ) ) ( not ( = ?auto_506578 ?auto_506579 ) ) ( not ( = ?auto_506578 ?auto_506580 ) ) ( not ( = ?auto_506578 ?auto_506581 ) ) ( not ( = ?auto_506578 ?auto_506582 ) ) ( not ( = ?auto_506578 ?auto_506583 ) ) ( not ( = ?auto_506578 ?auto_506584 ) ) ( not ( = ?auto_506578 ?auto_506585 ) ) ( not ( = ?auto_506578 ?auto_506586 ) ) ( not ( = ?auto_506579 ?auto_506580 ) ) ( not ( = ?auto_506579 ?auto_506581 ) ) ( not ( = ?auto_506579 ?auto_506582 ) ) ( not ( = ?auto_506579 ?auto_506583 ) ) ( not ( = ?auto_506579 ?auto_506584 ) ) ( not ( = ?auto_506579 ?auto_506585 ) ) ( not ( = ?auto_506579 ?auto_506586 ) ) ( not ( = ?auto_506580 ?auto_506581 ) ) ( not ( = ?auto_506580 ?auto_506582 ) ) ( not ( = ?auto_506580 ?auto_506583 ) ) ( not ( = ?auto_506580 ?auto_506584 ) ) ( not ( = ?auto_506580 ?auto_506585 ) ) ( not ( = ?auto_506580 ?auto_506586 ) ) ( not ( = ?auto_506581 ?auto_506582 ) ) ( not ( = ?auto_506581 ?auto_506583 ) ) ( not ( = ?auto_506581 ?auto_506584 ) ) ( not ( = ?auto_506581 ?auto_506585 ) ) ( not ( = ?auto_506581 ?auto_506586 ) ) ( not ( = ?auto_506582 ?auto_506583 ) ) ( not ( = ?auto_506582 ?auto_506584 ) ) ( not ( = ?auto_506582 ?auto_506585 ) ) ( not ( = ?auto_506582 ?auto_506586 ) ) ( not ( = ?auto_506583 ?auto_506584 ) ) ( not ( = ?auto_506583 ?auto_506585 ) ) ( not ( = ?auto_506583 ?auto_506586 ) ) ( not ( = ?auto_506584 ?auto_506585 ) ) ( not ( = ?auto_506584 ?auto_506586 ) ) ( not ( = ?auto_506585 ?auto_506586 ) ) ( ON ?auto_506584 ?auto_506585 ) ( ON ?auto_506583 ?auto_506584 ) ( ON ?auto_506582 ?auto_506583 ) ( ON ?auto_506581 ?auto_506582 ) ( ON ?auto_506580 ?auto_506581 ) ( ON ?auto_506579 ?auto_506580 ) ( ON ?auto_506578 ?auto_506579 ) ( ON ?auto_506577 ?auto_506578 ) ( CLEAR ?auto_506575 ) ( ON ?auto_506576 ?auto_506577 ) ( CLEAR ?auto_506576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_506572 ?auto_506573 ?auto_506574 ?auto_506575 ?auto_506576 )
      ( MAKE-14PILE ?auto_506572 ?auto_506573 ?auto_506574 ?auto_506575 ?auto_506576 ?auto_506577 ?auto_506578 ?auto_506579 ?auto_506580 ?auto_506581 ?auto_506582 ?auto_506583 ?auto_506584 ?auto_506585 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506630 - BLOCK
      ?auto_506631 - BLOCK
      ?auto_506632 - BLOCK
      ?auto_506633 - BLOCK
      ?auto_506634 - BLOCK
      ?auto_506635 - BLOCK
      ?auto_506636 - BLOCK
      ?auto_506637 - BLOCK
      ?auto_506638 - BLOCK
      ?auto_506639 - BLOCK
      ?auto_506640 - BLOCK
      ?auto_506641 - BLOCK
      ?auto_506642 - BLOCK
      ?auto_506643 - BLOCK
    )
    :vars
    (
      ?auto_506644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506643 ?auto_506644 ) ( ON-TABLE ?auto_506630 ) ( ON ?auto_506631 ?auto_506630 ) ( ON ?auto_506632 ?auto_506631 ) ( not ( = ?auto_506630 ?auto_506631 ) ) ( not ( = ?auto_506630 ?auto_506632 ) ) ( not ( = ?auto_506630 ?auto_506633 ) ) ( not ( = ?auto_506630 ?auto_506634 ) ) ( not ( = ?auto_506630 ?auto_506635 ) ) ( not ( = ?auto_506630 ?auto_506636 ) ) ( not ( = ?auto_506630 ?auto_506637 ) ) ( not ( = ?auto_506630 ?auto_506638 ) ) ( not ( = ?auto_506630 ?auto_506639 ) ) ( not ( = ?auto_506630 ?auto_506640 ) ) ( not ( = ?auto_506630 ?auto_506641 ) ) ( not ( = ?auto_506630 ?auto_506642 ) ) ( not ( = ?auto_506630 ?auto_506643 ) ) ( not ( = ?auto_506630 ?auto_506644 ) ) ( not ( = ?auto_506631 ?auto_506632 ) ) ( not ( = ?auto_506631 ?auto_506633 ) ) ( not ( = ?auto_506631 ?auto_506634 ) ) ( not ( = ?auto_506631 ?auto_506635 ) ) ( not ( = ?auto_506631 ?auto_506636 ) ) ( not ( = ?auto_506631 ?auto_506637 ) ) ( not ( = ?auto_506631 ?auto_506638 ) ) ( not ( = ?auto_506631 ?auto_506639 ) ) ( not ( = ?auto_506631 ?auto_506640 ) ) ( not ( = ?auto_506631 ?auto_506641 ) ) ( not ( = ?auto_506631 ?auto_506642 ) ) ( not ( = ?auto_506631 ?auto_506643 ) ) ( not ( = ?auto_506631 ?auto_506644 ) ) ( not ( = ?auto_506632 ?auto_506633 ) ) ( not ( = ?auto_506632 ?auto_506634 ) ) ( not ( = ?auto_506632 ?auto_506635 ) ) ( not ( = ?auto_506632 ?auto_506636 ) ) ( not ( = ?auto_506632 ?auto_506637 ) ) ( not ( = ?auto_506632 ?auto_506638 ) ) ( not ( = ?auto_506632 ?auto_506639 ) ) ( not ( = ?auto_506632 ?auto_506640 ) ) ( not ( = ?auto_506632 ?auto_506641 ) ) ( not ( = ?auto_506632 ?auto_506642 ) ) ( not ( = ?auto_506632 ?auto_506643 ) ) ( not ( = ?auto_506632 ?auto_506644 ) ) ( not ( = ?auto_506633 ?auto_506634 ) ) ( not ( = ?auto_506633 ?auto_506635 ) ) ( not ( = ?auto_506633 ?auto_506636 ) ) ( not ( = ?auto_506633 ?auto_506637 ) ) ( not ( = ?auto_506633 ?auto_506638 ) ) ( not ( = ?auto_506633 ?auto_506639 ) ) ( not ( = ?auto_506633 ?auto_506640 ) ) ( not ( = ?auto_506633 ?auto_506641 ) ) ( not ( = ?auto_506633 ?auto_506642 ) ) ( not ( = ?auto_506633 ?auto_506643 ) ) ( not ( = ?auto_506633 ?auto_506644 ) ) ( not ( = ?auto_506634 ?auto_506635 ) ) ( not ( = ?auto_506634 ?auto_506636 ) ) ( not ( = ?auto_506634 ?auto_506637 ) ) ( not ( = ?auto_506634 ?auto_506638 ) ) ( not ( = ?auto_506634 ?auto_506639 ) ) ( not ( = ?auto_506634 ?auto_506640 ) ) ( not ( = ?auto_506634 ?auto_506641 ) ) ( not ( = ?auto_506634 ?auto_506642 ) ) ( not ( = ?auto_506634 ?auto_506643 ) ) ( not ( = ?auto_506634 ?auto_506644 ) ) ( not ( = ?auto_506635 ?auto_506636 ) ) ( not ( = ?auto_506635 ?auto_506637 ) ) ( not ( = ?auto_506635 ?auto_506638 ) ) ( not ( = ?auto_506635 ?auto_506639 ) ) ( not ( = ?auto_506635 ?auto_506640 ) ) ( not ( = ?auto_506635 ?auto_506641 ) ) ( not ( = ?auto_506635 ?auto_506642 ) ) ( not ( = ?auto_506635 ?auto_506643 ) ) ( not ( = ?auto_506635 ?auto_506644 ) ) ( not ( = ?auto_506636 ?auto_506637 ) ) ( not ( = ?auto_506636 ?auto_506638 ) ) ( not ( = ?auto_506636 ?auto_506639 ) ) ( not ( = ?auto_506636 ?auto_506640 ) ) ( not ( = ?auto_506636 ?auto_506641 ) ) ( not ( = ?auto_506636 ?auto_506642 ) ) ( not ( = ?auto_506636 ?auto_506643 ) ) ( not ( = ?auto_506636 ?auto_506644 ) ) ( not ( = ?auto_506637 ?auto_506638 ) ) ( not ( = ?auto_506637 ?auto_506639 ) ) ( not ( = ?auto_506637 ?auto_506640 ) ) ( not ( = ?auto_506637 ?auto_506641 ) ) ( not ( = ?auto_506637 ?auto_506642 ) ) ( not ( = ?auto_506637 ?auto_506643 ) ) ( not ( = ?auto_506637 ?auto_506644 ) ) ( not ( = ?auto_506638 ?auto_506639 ) ) ( not ( = ?auto_506638 ?auto_506640 ) ) ( not ( = ?auto_506638 ?auto_506641 ) ) ( not ( = ?auto_506638 ?auto_506642 ) ) ( not ( = ?auto_506638 ?auto_506643 ) ) ( not ( = ?auto_506638 ?auto_506644 ) ) ( not ( = ?auto_506639 ?auto_506640 ) ) ( not ( = ?auto_506639 ?auto_506641 ) ) ( not ( = ?auto_506639 ?auto_506642 ) ) ( not ( = ?auto_506639 ?auto_506643 ) ) ( not ( = ?auto_506639 ?auto_506644 ) ) ( not ( = ?auto_506640 ?auto_506641 ) ) ( not ( = ?auto_506640 ?auto_506642 ) ) ( not ( = ?auto_506640 ?auto_506643 ) ) ( not ( = ?auto_506640 ?auto_506644 ) ) ( not ( = ?auto_506641 ?auto_506642 ) ) ( not ( = ?auto_506641 ?auto_506643 ) ) ( not ( = ?auto_506641 ?auto_506644 ) ) ( not ( = ?auto_506642 ?auto_506643 ) ) ( not ( = ?auto_506642 ?auto_506644 ) ) ( not ( = ?auto_506643 ?auto_506644 ) ) ( ON ?auto_506642 ?auto_506643 ) ( ON ?auto_506641 ?auto_506642 ) ( ON ?auto_506640 ?auto_506641 ) ( ON ?auto_506639 ?auto_506640 ) ( ON ?auto_506638 ?auto_506639 ) ( ON ?auto_506637 ?auto_506638 ) ( ON ?auto_506636 ?auto_506637 ) ( ON ?auto_506635 ?auto_506636 ) ( ON ?auto_506634 ?auto_506635 ) ( CLEAR ?auto_506632 ) ( ON ?auto_506633 ?auto_506634 ) ( CLEAR ?auto_506633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_506630 ?auto_506631 ?auto_506632 ?auto_506633 )
      ( MAKE-14PILE ?auto_506630 ?auto_506631 ?auto_506632 ?auto_506633 ?auto_506634 ?auto_506635 ?auto_506636 ?auto_506637 ?auto_506638 ?auto_506639 ?auto_506640 ?auto_506641 ?auto_506642 ?auto_506643 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506688 - BLOCK
      ?auto_506689 - BLOCK
      ?auto_506690 - BLOCK
      ?auto_506691 - BLOCK
      ?auto_506692 - BLOCK
      ?auto_506693 - BLOCK
      ?auto_506694 - BLOCK
      ?auto_506695 - BLOCK
      ?auto_506696 - BLOCK
      ?auto_506697 - BLOCK
      ?auto_506698 - BLOCK
      ?auto_506699 - BLOCK
      ?auto_506700 - BLOCK
      ?auto_506701 - BLOCK
    )
    :vars
    (
      ?auto_506702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506701 ?auto_506702 ) ( ON-TABLE ?auto_506688 ) ( ON ?auto_506689 ?auto_506688 ) ( not ( = ?auto_506688 ?auto_506689 ) ) ( not ( = ?auto_506688 ?auto_506690 ) ) ( not ( = ?auto_506688 ?auto_506691 ) ) ( not ( = ?auto_506688 ?auto_506692 ) ) ( not ( = ?auto_506688 ?auto_506693 ) ) ( not ( = ?auto_506688 ?auto_506694 ) ) ( not ( = ?auto_506688 ?auto_506695 ) ) ( not ( = ?auto_506688 ?auto_506696 ) ) ( not ( = ?auto_506688 ?auto_506697 ) ) ( not ( = ?auto_506688 ?auto_506698 ) ) ( not ( = ?auto_506688 ?auto_506699 ) ) ( not ( = ?auto_506688 ?auto_506700 ) ) ( not ( = ?auto_506688 ?auto_506701 ) ) ( not ( = ?auto_506688 ?auto_506702 ) ) ( not ( = ?auto_506689 ?auto_506690 ) ) ( not ( = ?auto_506689 ?auto_506691 ) ) ( not ( = ?auto_506689 ?auto_506692 ) ) ( not ( = ?auto_506689 ?auto_506693 ) ) ( not ( = ?auto_506689 ?auto_506694 ) ) ( not ( = ?auto_506689 ?auto_506695 ) ) ( not ( = ?auto_506689 ?auto_506696 ) ) ( not ( = ?auto_506689 ?auto_506697 ) ) ( not ( = ?auto_506689 ?auto_506698 ) ) ( not ( = ?auto_506689 ?auto_506699 ) ) ( not ( = ?auto_506689 ?auto_506700 ) ) ( not ( = ?auto_506689 ?auto_506701 ) ) ( not ( = ?auto_506689 ?auto_506702 ) ) ( not ( = ?auto_506690 ?auto_506691 ) ) ( not ( = ?auto_506690 ?auto_506692 ) ) ( not ( = ?auto_506690 ?auto_506693 ) ) ( not ( = ?auto_506690 ?auto_506694 ) ) ( not ( = ?auto_506690 ?auto_506695 ) ) ( not ( = ?auto_506690 ?auto_506696 ) ) ( not ( = ?auto_506690 ?auto_506697 ) ) ( not ( = ?auto_506690 ?auto_506698 ) ) ( not ( = ?auto_506690 ?auto_506699 ) ) ( not ( = ?auto_506690 ?auto_506700 ) ) ( not ( = ?auto_506690 ?auto_506701 ) ) ( not ( = ?auto_506690 ?auto_506702 ) ) ( not ( = ?auto_506691 ?auto_506692 ) ) ( not ( = ?auto_506691 ?auto_506693 ) ) ( not ( = ?auto_506691 ?auto_506694 ) ) ( not ( = ?auto_506691 ?auto_506695 ) ) ( not ( = ?auto_506691 ?auto_506696 ) ) ( not ( = ?auto_506691 ?auto_506697 ) ) ( not ( = ?auto_506691 ?auto_506698 ) ) ( not ( = ?auto_506691 ?auto_506699 ) ) ( not ( = ?auto_506691 ?auto_506700 ) ) ( not ( = ?auto_506691 ?auto_506701 ) ) ( not ( = ?auto_506691 ?auto_506702 ) ) ( not ( = ?auto_506692 ?auto_506693 ) ) ( not ( = ?auto_506692 ?auto_506694 ) ) ( not ( = ?auto_506692 ?auto_506695 ) ) ( not ( = ?auto_506692 ?auto_506696 ) ) ( not ( = ?auto_506692 ?auto_506697 ) ) ( not ( = ?auto_506692 ?auto_506698 ) ) ( not ( = ?auto_506692 ?auto_506699 ) ) ( not ( = ?auto_506692 ?auto_506700 ) ) ( not ( = ?auto_506692 ?auto_506701 ) ) ( not ( = ?auto_506692 ?auto_506702 ) ) ( not ( = ?auto_506693 ?auto_506694 ) ) ( not ( = ?auto_506693 ?auto_506695 ) ) ( not ( = ?auto_506693 ?auto_506696 ) ) ( not ( = ?auto_506693 ?auto_506697 ) ) ( not ( = ?auto_506693 ?auto_506698 ) ) ( not ( = ?auto_506693 ?auto_506699 ) ) ( not ( = ?auto_506693 ?auto_506700 ) ) ( not ( = ?auto_506693 ?auto_506701 ) ) ( not ( = ?auto_506693 ?auto_506702 ) ) ( not ( = ?auto_506694 ?auto_506695 ) ) ( not ( = ?auto_506694 ?auto_506696 ) ) ( not ( = ?auto_506694 ?auto_506697 ) ) ( not ( = ?auto_506694 ?auto_506698 ) ) ( not ( = ?auto_506694 ?auto_506699 ) ) ( not ( = ?auto_506694 ?auto_506700 ) ) ( not ( = ?auto_506694 ?auto_506701 ) ) ( not ( = ?auto_506694 ?auto_506702 ) ) ( not ( = ?auto_506695 ?auto_506696 ) ) ( not ( = ?auto_506695 ?auto_506697 ) ) ( not ( = ?auto_506695 ?auto_506698 ) ) ( not ( = ?auto_506695 ?auto_506699 ) ) ( not ( = ?auto_506695 ?auto_506700 ) ) ( not ( = ?auto_506695 ?auto_506701 ) ) ( not ( = ?auto_506695 ?auto_506702 ) ) ( not ( = ?auto_506696 ?auto_506697 ) ) ( not ( = ?auto_506696 ?auto_506698 ) ) ( not ( = ?auto_506696 ?auto_506699 ) ) ( not ( = ?auto_506696 ?auto_506700 ) ) ( not ( = ?auto_506696 ?auto_506701 ) ) ( not ( = ?auto_506696 ?auto_506702 ) ) ( not ( = ?auto_506697 ?auto_506698 ) ) ( not ( = ?auto_506697 ?auto_506699 ) ) ( not ( = ?auto_506697 ?auto_506700 ) ) ( not ( = ?auto_506697 ?auto_506701 ) ) ( not ( = ?auto_506697 ?auto_506702 ) ) ( not ( = ?auto_506698 ?auto_506699 ) ) ( not ( = ?auto_506698 ?auto_506700 ) ) ( not ( = ?auto_506698 ?auto_506701 ) ) ( not ( = ?auto_506698 ?auto_506702 ) ) ( not ( = ?auto_506699 ?auto_506700 ) ) ( not ( = ?auto_506699 ?auto_506701 ) ) ( not ( = ?auto_506699 ?auto_506702 ) ) ( not ( = ?auto_506700 ?auto_506701 ) ) ( not ( = ?auto_506700 ?auto_506702 ) ) ( not ( = ?auto_506701 ?auto_506702 ) ) ( ON ?auto_506700 ?auto_506701 ) ( ON ?auto_506699 ?auto_506700 ) ( ON ?auto_506698 ?auto_506699 ) ( ON ?auto_506697 ?auto_506698 ) ( ON ?auto_506696 ?auto_506697 ) ( ON ?auto_506695 ?auto_506696 ) ( ON ?auto_506694 ?auto_506695 ) ( ON ?auto_506693 ?auto_506694 ) ( ON ?auto_506692 ?auto_506693 ) ( ON ?auto_506691 ?auto_506692 ) ( CLEAR ?auto_506689 ) ( ON ?auto_506690 ?auto_506691 ) ( CLEAR ?auto_506690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_506688 ?auto_506689 ?auto_506690 )
      ( MAKE-14PILE ?auto_506688 ?auto_506689 ?auto_506690 ?auto_506691 ?auto_506692 ?auto_506693 ?auto_506694 ?auto_506695 ?auto_506696 ?auto_506697 ?auto_506698 ?auto_506699 ?auto_506700 ?auto_506701 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506746 - BLOCK
      ?auto_506747 - BLOCK
      ?auto_506748 - BLOCK
      ?auto_506749 - BLOCK
      ?auto_506750 - BLOCK
      ?auto_506751 - BLOCK
      ?auto_506752 - BLOCK
      ?auto_506753 - BLOCK
      ?auto_506754 - BLOCK
      ?auto_506755 - BLOCK
      ?auto_506756 - BLOCK
      ?auto_506757 - BLOCK
      ?auto_506758 - BLOCK
      ?auto_506759 - BLOCK
    )
    :vars
    (
      ?auto_506760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506759 ?auto_506760 ) ( ON-TABLE ?auto_506746 ) ( not ( = ?auto_506746 ?auto_506747 ) ) ( not ( = ?auto_506746 ?auto_506748 ) ) ( not ( = ?auto_506746 ?auto_506749 ) ) ( not ( = ?auto_506746 ?auto_506750 ) ) ( not ( = ?auto_506746 ?auto_506751 ) ) ( not ( = ?auto_506746 ?auto_506752 ) ) ( not ( = ?auto_506746 ?auto_506753 ) ) ( not ( = ?auto_506746 ?auto_506754 ) ) ( not ( = ?auto_506746 ?auto_506755 ) ) ( not ( = ?auto_506746 ?auto_506756 ) ) ( not ( = ?auto_506746 ?auto_506757 ) ) ( not ( = ?auto_506746 ?auto_506758 ) ) ( not ( = ?auto_506746 ?auto_506759 ) ) ( not ( = ?auto_506746 ?auto_506760 ) ) ( not ( = ?auto_506747 ?auto_506748 ) ) ( not ( = ?auto_506747 ?auto_506749 ) ) ( not ( = ?auto_506747 ?auto_506750 ) ) ( not ( = ?auto_506747 ?auto_506751 ) ) ( not ( = ?auto_506747 ?auto_506752 ) ) ( not ( = ?auto_506747 ?auto_506753 ) ) ( not ( = ?auto_506747 ?auto_506754 ) ) ( not ( = ?auto_506747 ?auto_506755 ) ) ( not ( = ?auto_506747 ?auto_506756 ) ) ( not ( = ?auto_506747 ?auto_506757 ) ) ( not ( = ?auto_506747 ?auto_506758 ) ) ( not ( = ?auto_506747 ?auto_506759 ) ) ( not ( = ?auto_506747 ?auto_506760 ) ) ( not ( = ?auto_506748 ?auto_506749 ) ) ( not ( = ?auto_506748 ?auto_506750 ) ) ( not ( = ?auto_506748 ?auto_506751 ) ) ( not ( = ?auto_506748 ?auto_506752 ) ) ( not ( = ?auto_506748 ?auto_506753 ) ) ( not ( = ?auto_506748 ?auto_506754 ) ) ( not ( = ?auto_506748 ?auto_506755 ) ) ( not ( = ?auto_506748 ?auto_506756 ) ) ( not ( = ?auto_506748 ?auto_506757 ) ) ( not ( = ?auto_506748 ?auto_506758 ) ) ( not ( = ?auto_506748 ?auto_506759 ) ) ( not ( = ?auto_506748 ?auto_506760 ) ) ( not ( = ?auto_506749 ?auto_506750 ) ) ( not ( = ?auto_506749 ?auto_506751 ) ) ( not ( = ?auto_506749 ?auto_506752 ) ) ( not ( = ?auto_506749 ?auto_506753 ) ) ( not ( = ?auto_506749 ?auto_506754 ) ) ( not ( = ?auto_506749 ?auto_506755 ) ) ( not ( = ?auto_506749 ?auto_506756 ) ) ( not ( = ?auto_506749 ?auto_506757 ) ) ( not ( = ?auto_506749 ?auto_506758 ) ) ( not ( = ?auto_506749 ?auto_506759 ) ) ( not ( = ?auto_506749 ?auto_506760 ) ) ( not ( = ?auto_506750 ?auto_506751 ) ) ( not ( = ?auto_506750 ?auto_506752 ) ) ( not ( = ?auto_506750 ?auto_506753 ) ) ( not ( = ?auto_506750 ?auto_506754 ) ) ( not ( = ?auto_506750 ?auto_506755 ) ) ( not ( = ?auto_506750 ?auto_506756 ) ) ( not ( = ?auto_506750 ?auto_506757 ) ) ( not ( = ?auto_506750 ?auto_506758 ) ) ( not ( = ?auto_506750 ?auto_506759 ) ) ( not ( = ?auto_506750 ?auto_506760 ) ) ( not ( = ?auto_506751 ?auto_506752 ) ) ( not ( = ?auto_506751 ?auto_506753 ) ) ( not ( = ?auto_506751 ?auto_506754 ) ) ( not ( = ?auto_506751 ?auto_506755 ) ) ( not ( = ?auto_506751 ?auto_506756 ) ) ( not ( = ?auto_506751 ?auto_506757 ) ) ( not ( = ?auto_506751 ?auto_506758 ) ) ( not ( = ?auto_506751 ?auto_506759 ) ) ( not ( = ?auto_506751 ?auto_506760 ) ) ( not ( = ?auto_506752 ?auto_506753 ) ) ( not ( = ?auto_506752 ?auto_506754 ) ) ( not ( = ?auto_506752 ?auto_506755 ) ) ( not ( = ?auto_506752 ?auto_506756 ) ) ( not ( = ?auto_506752 ?auto_506757 ) ) ( not ( = ?auto_506752 ?auto_506758 ) ) ( not ( = ?auto_506752 ?auto_506759 ) ) ( not ( = ?auto_506752 ?auto_506760 ) ) ( not ( = ?auto_506753 ?auto_506754 ) ) ( not ( = ?auto_506753 ?auto_506755 ) ) ( not ( = ?auto_506753 ?auto_506756 ) ) ( not ( = ?auto_506753 ?auto_506757 ) ) ( not ( = ?auto_506753 ?auto_506758 ) ) ( not ( = ?auto_506753 ?auto_506759 ) ) ( not ( = ?auto_506753 ?auto_506760 ) ) ( not ( = ?auto_506754 ?auto_506755 ) ) ( not ( = ?auto_506754 ?auto_506756 ) ) ( not ( = ?auto_506754 ?auto_506757 ) ) ( not ( = ?auto_506754 ?auto_506758 ) ) ( not ( = ?auto_506754 ?auto_506759 ) ) ( not ( = ?auto_506754 ?auto_506760 ) ) ( not ( = ?auto_506755 ?auto_506756 ) ) ( not ( = ?auto_506755 ?auto_506757 ) ) ( not ( = ?auto_506755 ?auto_506758 ) ) ( not ( = ?auto_506755 ?auto_506759 ) ) ( not ( = ?auto_506755 ?auto_506760 ) ) ( not ( = ?auto_506756 ?auto_506757 ) ) ( not ( = ?auto_506756 ?auto_506758 ) ) ( not ( = ?auto_506756 ?auto_506759 ) ) ( not ( = ?auto_506756 ?auto_506760 ) ) ( not ( = ?auto_506757 ?auto_506758 ) ) ( not ( = ?auto_506757 ?auto_506759 ) ) ( not ( = ?auto_506757 ?auto_506760 ) ) ( not ( = ?auto_506758 ?auto_506759 ) ) ( not ( = ?auto_506758 ?auto_506760 ) ) ( not ( = ?auto_506759 ?auto_506760 ) ) ( ON ?auto_506758 ?auto_506759 ) ( ON ?auto_506757 ?auto_506758 ) ( ON ?auto_506756 ?auto_506757 ) ( ON ?auto_506755 ?auto_506756 ) ( ON ?auto_506754 ?auto_506755 ) ( ON ?auto_506753 ?auto_506754 ) ( ON ?auto_506752 ?auto_506753 ) ( ON ?auto_506751 ?auto_506752 ) ( ON ?auto_506750 ?auto_506751 ) ( ON ?auto_506749 ?auto_506750 ) ( ON ?auto_506748 ?auto_506749 ) ( CLEAR ?auto_506746 ) ( ON ?auto_506747 ?auto_506748 ) ( CLEAR ?auto_506747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_506746 ?auto_506747 )
      ( MAKE-14PILE ?auto_506746 ?auto_506747 ?auto_506748 ?auto_506749 ?auto_506750 ?auto_506751 ?auto_506752 ?auto_506753 ?auto_506754 ?auto_506755 ?auto_506756 ?auto_506757 ?auto_506758 ?auto_506759 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_506804 - BLOCK
      ?auto_506805 - BLOCK
      ?auto_506806 - BLOCK
      ?auto_506807 - BLOCK
      ?auto_506808 - BLOCK
      ?auto_506809 - BLOCK
      ?auto_506810 - BLOCK
      ?auto_506811 - BLOCK
      ?auto_506812 - BLOCK
      ?auto_506813 - BLOCK
      ?auto_506814 - BLOCK
      ?auto_506815 - BLOCK
      ?auto_506816 - BLOCK
      ?auto_506817 - BLOCK
    )
    :vars
    (
      ?auto_506818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506817 ?auto_506818 ) ( not ( = ?auto_506804 ?auto_506805 ) ) ( not ( = ?auto_506804 ?auto_506806 ) ) ( not ( = ?auto_506804 ?auto_506807 ) ) ( not ( = ?auto_506804 ?auto_506808 ) ) ( not ( = ?auto_506804 ?auto_506809 ) ) ( not ( = ?auto_506804 ?auto_506810 ) ) ( not ( = ?auto_506804 ?auto_506811 ) ) ( not ( = ?auto_506804 ?auto_506812 ) ) ( not ( = ?auto_506804 ?auto_506813 ) ) ( not ( = ?auto_506804 ?auto_506814 ) ) ( not ( = ?auto_506804 ?auto_506815 ) ) ( not ( = ?auto_506804 ?auto_506816 ) ) ( not ( = ?auto_506804 ?auto_506817 ) ) ( not ( = ?auto_506804 ?auto_506818 ) ) ( not ( = ?auto_506805 ?auto_506806 ) ) ( not ( = ?auto_506805 ?auto_506807 ) ) ( not ( = ?auto_506805 ?auto_506808 ) ) ( not ( = ?auto_506805 ?auto_506809 ) ) ( not ( = ?auto_506805 ?auto_506810 ) ) ( not ( = ?auto_506805 ?auto_506811 ) ) ( not ( = ?auto_506805 ?auto_506812 ) ) ( not ( = ?auto_506805 ?auto_506813 ) ) ( not ( = ?auto_506805 ?auto_506814 ) ) ( not ( = ?auto_506805 ?auto_506815 ) ) ( not ( = ?auto_506805 ?auto_506816 ) ) ( not ( = ?auto_506805 ?auto_506817 ) ) ( not ( = ?auto_506805 ?auto_506818 ) ) ( not ( = ?auto_506806 ?auto_506807 ) ) ( not ( = ?auto_506806 ?auto_506808 ) ) ( not ( = ?auto_506806 ?auto_506809 ) ) ( not ( = ?auto_506806 ?auto_506810 ) ) ( not ( = ?auto_506806 ?auto_506811 ) ) ( not ( = ?auto_506806 ?auto_506812 ) ) ( not ( = ?auto_506806 ?auto_506813 ) ) ( not ( = ?auto_506806 ?auto_506814 ) ) ( not ( = ?auto_506806 ?auto_506815 ) ) ( not ( = ?auto_506806 ?auto_506816 ) ) ( not ( = ?auto_506806 ?auto_506817 ) ) ( not ( = ?auto_506806 ?auto_506818 ) ) ( not ( = ?auto_506807 ?auto_506808 ) ) ( not ( = ?auto_506807 ?auto_506809 ) ) ( not ( = ?auto_506807 ?auto_506810 ) ) ( not ( = ?auto_506807 ?auto_506811 ) ) ( not ( = ?auto_506807 ?auto_506812 ) ) ( not ( = ?auto_506807 ?auto_506813 ) ) ( not ( = ?auto_506807 ?auto_506814 ) ) ( not ( = ?auto_506807 ?auto_506815 ) ) ( not ( = ?auto_506807 ?auto_506816 ) ) ( not ( = ?auto_506807 ?auto_506817 ) ) ( not ( = ?auto_506807 ?auto_506818 ) ) ( not ( = ?auto_506808 ?auto_506809 ) ) ( not ( = ?auto_506808 ?auto_506810 ) ) ( not ( = ?auto_506808 ?auto_506811 ) ) ( not ( = ?auto_506808 ?auto_506812 ) ) ( not ( = ?auto_506808 ?auto_506813 ) ) ( not ( = ?auto_506808 ?auto_506814 ) ) ( not ( = ?auto_506808 ?auto_506815 ) ) ( not ( = ?auto_506808 ?auto_506816 ) ) ( not ( = ?auto_506808 ?auto_506817 ) ) ( not ( = ?auto_506808 ?auto_506818 ) ) ( not ( = ?auto_506809 ?auto_506810 ) ) ( not ( = ?auto_506809 ?auto_506811 ) ) ( not ( = ?auto_506809 ?auto_506812 ) ) ( not ( = ?auto_506809 ?auto_506813 ) ) ( not ( = ?auto_506809 ?auto_506814 ) ) ( not ( = ?auto_506809 ?auto_506815 ) ) ( not ( = ?auto_506809 ?auto_506816 ) ) ( not ( = ?auto_506809 ?auto_506817 ) ) ( not ( = ?auto_506809 ?auto_506818 ) ) ( not ( = ?auto_506810 ?auto_506811 ) ) ( not ( = ?auto_506810 ?auto_506812 ) ) ( not ( = ?auto_506810 ?auto_506813 ) ) ( not ( = ?auto_506810 ?auto_506814 ) ) ( not ( = ?auto_506810 ?auto_506815 ) ) ( not ( = ?auto_506810 ?auto_506816 ) ) ( not ( = ?auto_506810 ?auto_506817 ) ) ( not ( = ?auto_506810 ?auto_506818 ) ) ( not ( = ?auto_506811 ?auto_506812 ) ) ( not ( = ?auto_506811 ?auto_506813 ) ) ( not ( = ?auto_506811 ?auto_506814 ) ) ( not ( = ?auto_506811 ?auto_506815 ) ) ( not ( = ?auto_506811 ?auto_506816 ) ) ( not ( = ?auto_506811 ?auto_506817 ) ) ( not ( = ?auto_506811 ?auto_506818 ) ) ( not ( = ?auto_506812 ?auto_506813 ) ) ( not ( = ?auto_506812 ?auto_506814 ) ) ( not ( = ?auto_506812 ?auto_506815 ) ) ( not ( = ?auto_506812 ?auto_506816 ) ) ( not ( = ?auto_506812 ?auto_506817 ) ) ( not ( = ?auto_506812 ?auto_506818 ) ) ( not ( = ?auto_506813 ?auto_506814 ) ) ( not ( = ?auto_506813 ?auto_506815 ) ) ( not ( = ?auto_506813 ?auto_506816 ) ) ( not ( = ?auto_506813 ?auto_506817 ) ) ( not ( = ?auto_506813 ?auto_506818 ) ) ( not ( = ?auto_506814 ?auto_506815 ) ) ( not ( = ?auto_506814 ?auto_506816 ) ) ( not ( = ?auto_506814 ?auto_506817 ) ) ( not ( = ?auto_506814 ?auto_506818 ) ) ( not ( = ?auto_506815 ?auto_506816 ) ) ( not ( = ?auto_506815 ?auto_506817 ) ) ( not ( = ?auto_506815 ?auto_506818 ) ) ( not ( = ?auto_506816 ?auto_506817 ) ) ( not ( = ?auto_506816 ?auto_506818 ) ) ( not ( = ?auto_506817 ?auto_506818 ) ) ( ON ?auto_506816 ?auto_506817 ) ( ON ?auto_506815 ?auto_506816 ) ( ON ?auto_506814 ?auto_506815 ) ( ON ?auto_506813 ?auto_506814 ) ( ON ?auto_506812 ?auto_506813 ) ( ON ?auto_506811 ?auto_506812 ) ( ON ?auto_506810 ?auto_506811 ) ( ON ?auto_506809 ?auto_506810 ) ( ON ?auto_506808 ?auto_506809 ) ( ON ?auto_506807 ?auto_506808 ) ( ON ?auto_506806 ?auto_506807 ) ( ON ?auto_506805 ?auto_506806 ) ( ON ?auto_506804 ?auto_506805 ) ( CLEAR ?auto_506804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_506804 )
      ( MAKE-14PILE ?auto_506804 ?auto_506805 ?auto_506806 ?auto_506807 ?auto_506808 ?auto_506809 ?auto_506810 ?auto_506811 ?auto_506812 ?auto_506813 ?auto_506814 ?auto_506815 ?auto_506816 ?auto_506817 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_506863 - BLOCK
      ?auto_506864 - BLOCK
      ?auto_506865 - BLOCK
      ?auto_506866 - BLOCK
      ?auto_506867 - BLOCK
      ?auto_506868 - BLOCK
      ?auto_506869 - BLOCK
      ?auto_506870 - BLOCK
      ?auto_506871 - BLOCK
      ?auto_506872 - BLOCK
      ?auto_506873 - BLOCK
      ?auto_506874 - BLOCK
      ?auto_506875 - BLOCK
      ?auto_506876 - BLOCK
      ?auto_506877 - BLOCK
    )
    :vars
    (
      ?auto_506878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_506876 ) ( ON ?auto_506877 ?auto_506878 ) ( CLEAR ?auto_506877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_506863 ) ( ON ?auto_506864 ?auto_506863 ) ( ON ?auto_506865 ?auto_506864 ) ( ON ?auto_506866 ?auto_506865 ) ( ON ?auto_506867 ?auto_506866 ) ( ON ?auto_506868 ?auto_506867 ) ( ON ?auto_506869 ?auto_506868 ) ( ON ?auto_506870 ?auto_506869 ) ( ON ?auto_506871 ?auto_506870 ) ( ON ?auto_506872 ?auto_506871 ) ( ON ?auto_506873 ?auto_506872 ) ( ON ?auto_506874 ?auto_506873 ) ( ON ?auto_506875 ?auto_506874 ) ( ON ?auto_506876 ?auto_506875 ) ( not ( = ?auto_506863 ?auto_506864 ) ) ( not ( = ?auto_506863 ?auto_506865 ) ) ( not ( = ?auto_506863 ?auto_506866 ) ) ( not ( = ?auto_506863 ?auto_506867 ) ) ( not ( = ?auto_506863 ?auto_506868 ) ) ( not ( = ?auto_506863 ?auto_506869 ) ) ( not ( = ?auto_506863 ?auto_506870 ) ) ( not ( = ?auto_506863 ?auto_506871 ) ) ( not ( = ?auto_506863 ?auto_506872 ) ) ( not ( = ?auto_506863 ?auto_506873 ) ) ( not ( = ?auto_506863 ?auto_506874 ) ) ( not ( = ?auto_506863 ?auto_506875 ) ) ( not ( = ?auto_506863 ?auto_506876 ) ) ( not ( = ?auto_506863 ?auto_506877 ) ) ( not ( = ?auto_506863 ?auto_506878 ) ) ( not ( = ?auto_506864 ?auto_506865 ) ) ( not ( = ?auto_506864 ?auto_506866 ) ) ( not ( = ?auto_506864 ?auto_506867 ) ) ( not ( = ?auto_506864 ?auto_506868 ) ) ( not ( = ?auto_506864 ?auto_506869 ) ) ( not ( = ?auto_506864 ?auto_506870 ) ) ( not ( = ?auto_506864 ?auto_506871 ) ) ( not ( = ?auto_506864 ?auto_506872 ) ) ( not ( = ?auto_506864 ?auto_506873 ) ) ( not ( = ?auto_506864 ?auto_506874 ) ) ( not ( = ?auto_506864 ?auto_506875 ) ) ( not ( = ?auto_506864 ?auto_506876 ) ) ( not ( = ?auto_506864 ?auto_506877 ) ) ( not ( = ?auto_506864 ?auto_506878 ) ) ( not ( = ?auto_506865 ?auto_506866 ) ) ( not ( = ?auto_506865 ?auto_506867 ) ) ( not ( = ?auto_506865 ?auto_506868 ) ) ( not ( = ?auto_506865 ?auto_506869 ) ) ( not ( = ?auto_506865 ?auto_506870 ) ) ( not ( = ?auto_506865 ?auto_506871 ) ) ( not ( = ?auto_506865 ?auto_506872 ) ) ( not ( = ?auto_506865 ?auto_506873 ) ) ( not ( = ?auto_506865 ?auto_506874 ) ) ( not ( = ?auto_506865 ?auto_506875 ) ) ( not ( = ?auto_506865 ?auto_506876 ) ) ( not ( = ?auto_506865 ?auto_506877 ) ) ( not ( = ?auto_506865 ?auto_506878 ) ) ( not ( = ?auto_506866 ?auto_506867 ) ) ( not ( = ?auto_506866 ?auto_506868 ) ) ( not ( = ?auto_506866 ?auto_506869 ) ) ( not ( = ?auto_506866 ?auto_506870 ) ) ( not ( = ?auto_506866 ?auto_506871 ) ) ( not ( = ?auto_506866 ?auto_506872 ) ) ( not ( = ?auto_506866 ?auto_506873 ) ) ( not ( = ?auto_506866 ?auto_506874 ) ) ( not ( = ?auto_506866 ?auto_506875 ) ) ( not ( = ?auto_506866 ?auto_506876 ) ) ( not ( = ?auto_506866 ?auto_506877 ) ) ( not ( = ?auto_506866 ?auto_506878 ) ) ( not ( = ?auto_506867 ?auto_506868 ) ) ( not ( = ?auto_506867 ?auto_506869 ) ) ( not ( = ?auto_506867 ?auto_506870 ) ) ( not ( = ?auto_506867 ?auto_506871 ) ) ( not ( = ?auto_506867 ?auto_506872 ) ) ( not ( = ?auto_506867 ?auto_506873 ) ) ( not ( = ?auto_506867 ?auto_506874 ) ) ( not ( = ?auto_506867 ?auto_506875 ) ) ( not ( = ?auto_506867 ?auto_506876 ) ) ( not ( = ?auto_506867 ?auto_506877 ) ) ( not ( = ?auto_506867 ?auto_506878 ) ) ( not ( = ?auto_506868 ?auto_506869 ) ) ( not ( = ?auto_506868 ?auto_506870 ) ) ( not ( = ?auto_506868 ?auto_506871 ) ) ( not ( = ?auto_506868 ?auto_506872 ) ) ( not ( = ?auto_506868 ?auto_506873 ) ) ( not ( = ?auto_506868 ?auto_506874 ) ) ( not ( = ?auto_506868 ?auto_506875 ) ) ( not ( = ?auto_506868 ?auto_506876 ) ) ( not ( = ?auto_506868 ?auto_506877 ) ) ( not ( = ?auto_506868 ?auto_506878 ) ) ( not ( = ?auto_506869 ?auto_506870 ) ) ( not ( = ?auto_506869 ?auto_506871 ) ) ( not ( = ?auto_506869 ?auto_506872 ) ) ( not ( = ?auto_506869 ?auto_506873 ) ) ( not ( = ?auto_506869 ?auto_506874 ) ) ( not ( = ?auto_506869 ?auto_506875 ) ) ( not ( = ?auto_506869 ?auto_506876 ) ) ( not ( = ?auto_506869 ?auto_506877 ) ) ( not ( = ?auto_506869 ?auto_506878 ) ) ( not ( = ?auto_506870 ?auto_506871 ) ) ( not ( = ?auto_506870 ?auto_506872 ) ) ( not ( = ?auto_506870 ?auto_506873 ) ) ( not ( = ?auto_506870 ?auto_506874 ) ) ( not ( = ?auto_506870 ?auto_506875 ) ) ( not ( = ?auto_506870 ?auto_506876 ) ) ( not ( = ?auto_506870 ?auto_506877 ) ) ( not ( = ?auto_506870 ?auto_506878 ) ) ( not ( = ?auto_506871 ?auto_506872 ) ) ( not ( = ?auto_506871 ?auto_506873 ) ) ( not ( = ?auto_506871 ?auto_506874 ) ) ( not ( = ?auto_506871 ?auto_506875 ) ) ( not ( = ?auto_506871 ?auto_506876 ) ) ( not ( = ?auto_506871 ?auto_506877 ) ) ( not ( = ?auto_506871 ?auto_506878 ) ) ( not ( = ?auto_506872 ?auto_506873 ) ) ( not ( = ?auto_506872 ?auto_506874 ) ) ( not ( = ?auto_506872 ?auto_506875 ) ) ( not ( = ?auto_506872 ?auto_506876 ) ) ( not ( = ?auto_506872 ?auto_506877 ) ) ( not ( = ?auto_506872 ?auto_506878 ) ) ( not ( = ?auto_506873 ?auto_506874 ) ) ( not ( = ?auto_506873 ?auto_506875 ) ) ( not ( = ?auto_506873 ?auto_506876 ) ) ( not ( = ?auto_506873 ?auto_506877 ) ) ( not ( = ?auto_506873 ?auto_506878 ) ) ( not ( = ?auto_506874 ?auto_506875 ) ) ( not ( = ?auto_506874 ?auto_506876 ) ) ( not ( = ?auto_506874 ?auto_506877 ) ) ( not ( = ?auto_506874 ?auto_506878 ) ) ( not ( = ?auto_506875 ?auto_506876 ) ) ( not ( = ?auto_506875 ?auto_506877 ) ) ( not ( = ?auto_506875 ?auto_506878 ) ) ( not ( = ?auto_506876 ?auto_506877 ) ) ( not ( = ?auto_506876 ?auto_506878 ) ) ( not ( = ?auto_506877 ?auto_506878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_506877 ?auto_506878 )
      ( !STACK ?auto_506877 ?auto_506876 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_506925 - BLOCK
      ?auto_506926 - BLOCK
      ?auto_506927 - BLOCK
      ?auto_506928 - BLOCK
      ?auto_506929 - BLOCK
      ?auto_506930 - BLOCK
      ?auto_506931 - BLOCK
      ?auto_506932 - BLOCK
      ?auto_506933 - BLOCK
      ?auto_506934 - BLOCK
      ?auto_506935 - BLOCK
      ?auto_506936 - BLOCK
      ?auto_506937 - BLOCK
      ?auto_506938 - BLOCK
      ?auto_506939 - BLOCK
    )
    :vars
    (
      ?auto_506940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_506939 ?auto_506940 ) ( ON-TABLE ?auto_506925 ) ( ON ?auto_506926 ?auto_506925 ) ( ON ?auto_506927 ?auto_506926 ) ( ON ?auto_506928 ?auto_506927 ) ( ON ?auto_506929 ?auto_506928 ) ( ON ?auto_506930 ?auto_506929 ) ( ON ?auto_506931 ?auto_506930 ) ( ON ?auto_506932 ?auto_506931 ) ( ON ?auto_506933 ?auto_506932 ) ( ON ?auto_506934 ?auto_506933 ) ( ON ?auto_506935 ?auto_506934 ) ( ON ?auto_506936 ?auto_506935 ) ( ON ?auto_506937 ?auto_506936 ) ( not ( = ?auto_506925 ?auto_506926 ) ) ( not ( = ?auto_506925 ?auto_506927 ) ) ( not ( = ?auto_506925 ?auto_506928 ) ) ( not ( = ?auto_506925 ?auto_506929 ) ) ( not ( = ?auto_506925 ?auto_506930 ) ) ( not ( = ?auto_506925 ?auto_506931 ) ) ( not ( = ?auto_506925 ?auto_506932 ) ) ( not ( = ?auto_506925 ?auto_506933 ) ) ( not ( = ?auto_506925 ?auto_506934 ) ) ( not ( = ?auto_506925 ?auto_506935 ) ) ( not ( = ?auto_506925 ?auto_506936 ) ) ( not ( = ?auto_506925 ?auto_506937 ) ) ( not ( = ?auto_506925 ?auto_506938 ) ) ( not ( = ?auto_506925 ?auto_506939 ) ) ( not ( = ?auto_506925 ?auto_506940 ) ) ( not ( = ?auto_506926 ?auto_506927 ) ) ( not ( = ?auto_506926 ?auto_506928 ) ) ( not ( = ?auto_506926 ?auto_506929 ) ) ( not ( = ?auto_506926 ?auto_506930 ) ) ( not ( = ?auto_506926 ?auto_506931 ) ) ( not ( = ?auto_506926 ?auto_506932 ) ) ( not ( = ?auto_506926 ?auto_506933 ) ) ( not ( = ?auto_506926 ?auto_506934 ) ) ( not ( = ?auto_506926 ?auto_506935 ) ) ( not ( = ?auto_506926 ?auto_506936 ) ) ( not ( = ?auto_506926 ?auto_506937 ) ) ( not ( = ?auto_506926 ?auto_506938 ) ) ( not ( = ?auto_506926 ?auto_506939 ) ) ( not ( = ?auto_506926 ?auto_506940 ) ) ( not ( = ?auto_506927 ?auto_506928 ) ) ( not ( = ?auto_506927 ?auto_506929 ) ) ( not ( = ?auto_506927 ?auto_506930 ) ) ( not ( = ?auto_506927 ?auto_506931 ) ) ( not ( = ?auto_506927 ?auto_506932 ) ) ( not ( = ?auto_506927 ?auto_506933 ) ) ( not ( = ?auto_506927 ?auto_506934 ) ) ( not ( = ?auto_506927 ?auto_506935 ) ) ( not ( = ?auto_506927 ?auto_506936 ) ) ( not ( = ?auto_506927 ?auto_506937 ) ) ( not ( = ?auto_506927 ?auto_506938 ) ) ( not ( = ?auto_506927 ?auto_506939 ) ) ( not ( = ?auto_506927 ?auto_506940 ) ) ( not ( = ?auto_506928 ?auto_506929 ) ) ( not ( = ?auto_506928 ?auto_506930 ) ) ( not ( = ?auto_506928 ?auto_506931 ) ) ( not ( = ?auto_506928 ?auto_506932 ) ) ( not ( = ?auto_506928 ?auto_506933 ) ) ( not ( = ?auto_506928 ?auto_506934 ) ) ( not ( = ?auto_506928 ?auto_506935 ) ) ( not ( = ?auto_506928 ?auto_506936 ) ) ( not ( = ?auto_506928 ?auto_506937 ) ) ( not ( = ?auto_506928 ?auto_506938 ) ) ( not ( = ?auto_506928 ?auto_506939 ) ) ( not ( = ?auto_506928 ?auto_506940 ) ) ( not ( = ?auto_506929 ?auto_506930 ) ) ( not ( = ?auto_506929 ?auto_506931 ) ) ( not ( = ?auto_506929 ?auto_506932 ) ) ( not ( = ?auto_506929 ?auto_506933 ) ) ( not ( = ?auto_506929 ?auto_506934 ) ) ( not ( = ?auto_506929 ?auto_506935 ) ) ( not ( = ?auto_506929 ?auto_506936 ) ) ( not ( = ?auto_506929 ?auto_506937 ) ) ( not ( = ?auto_506929 ?auto_506938 ) ) ( not ( = ?auto_506929 ?auto_506939 ) ) ( not ( = ?auto_506929 ?auto_506940 ) ) ( not ( = ?auto_506930 ?auto_506931 ) ) ( not ( = ?auto_506930 ?auto_506932 ) ) ( not ( = ?auto_506930 ?auto_506933 ) ) ( not ( = ?auto_506930 ?auto_506934 ) ) ( not ( = ?auto_506930 ?auto_506935 ) ) ( not ( = ?auto_506930 ?auto_506936 ) ) ( not ( = ?auto_506930 ?auto_506937 ) ) ( not ( = ?auto_506930 ?auto_506938 ) ) ( not ( = ?auto_506930 ?auto_506939 ) ) ( not ( = ?auto_506930 ?auto_506940 ) ) ( not ( = ?auto_506931 ?auto_506932 ) ) ( not ( = ?auto_506931 ?auto_506933 ) ) ( not ( = ?auto_506931 ?auto_506934 ) ) ( not ( = ?auto_506931 ?auto_506935 ) ) ( not ( = ?auto_506931 ?auto_506936 ) ) ( not ( = ?auto_506931 ?auto_506937 ) ) ( not ( = ?auto_506931 ?auto_506938 ) ) ( not ( = ?auto_506931 ?auto_506939 ) ) ( not ( = ?auto_506931 ?auto_506940 ) ) ( not ( = ?auto_506932 ?auto_506933 ) ) ( not ( = ?auto_506932 ?auto_506934 ) ) ( not ( = ?auto_506932 ?auto_506935 ) ) ( not ( = ?auto_506932 ?auto_506936 ) ) ( not ( = ?auto_506932 ?auto_506937 ) ) ( not ( = ?auto_506932 ?auto_506938 ) ) ( not ( = ?auto_506932 ?auto_506939 ) ) ( not ( = ?auto_506932 ?auto_506940 ) ) ( not ( = ?auto_506933 ?auto_506934 ) ) ( not ( = ?auto_506933 ?auto_506935 ) ) ( not ( = ?auto_506933 ?auto_506936 ) ) ( not ( = ?auto_506933 ?auto_506937 ) ) ( not ( = ?auto_506933 ?auto_506938 ) ) ( not ( = ?auto_506933 ?auto_506939 ) ) ( not ( = ?auto_506933 ?auto_506940 ) ) ( not ( = ?auto_506934 ?auto_506935 ) ) ( not ( = ?auto_506934 ?auto_506936 ) ) ( not ( = ?auto_506934 ?auto_506937 ) ) ( not ( = ?auto_506934 ?auto_506938 ) ) ( not ( = ?auto_506934 ?auto_506939 ) ) ( not ( = ?auto_506934 ?auto_506940 ) ) ( not ( = ?auto_506935 ?auto_506936 ) ) ( not ( = ?auto_506935 ?auto_506937 ) ) ( not ( = ?auto_506935 ?auto_506938 ) ) ( not ( = ?auto_506935 ?auto_506939 ) ) ( not ( = ?auto_506935 ?auto_506940 ) ) ( not ( = ?auto_506936 ?auto_506937 ) ) ( not ( = ?auto_506936 ?auto_506938 ) ) ( not ( = ?auto_506936 ?auto_506939 ) ) ( not ( = ?auto_506936 ?auto_506940 ) ) ( not ( = ?auto_506937 ?auto_506938 ) ) ( not ( = ?auto_506937 ?auto_506939 ) ) ( not ( = ?auto_506937 ?auto_506940 ) ) ( not ( = ?auto_506938 ?auto_506939 ) ) ( not ( = ?auto_506938 ?auto_506940 ) ) ( not ( = ?auto_506939 ?auto_506940 ) ) ( CLEAR ?auto_506937 ) ( ON ?auto_506938 ?auto_506939 ) ( CLEAR ?auto_506938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_506925 ?auto_506926 ?auto_506927 ?auto_506928 ?auto_506929 ?auto_506930 ?auto_506931 ?auto_506932 ?auto_506933 ?auto_506934 ?auto_506935 ?auto_506936 ?auto_506937 ?auto_506938 )
      ( MAKE-15PILE ?auto_506925 ?auto_506926 ?auto_506927 ?auto_506928 ?auto_506929 ?auto_506930 ?auto_506931 ?auto_506932 ?auto_506933 ?auto_506934 ?auto_506935 ?auto_506936 ?auto_506937 ?auto_506938 ?auto_506939 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_506987 - BLOCK
      ?auto_506988 - BLOCK
      ?auto_506989 - BLOCK
      ?auto_506990 - BLOCK
      ?auto_506991 - BLOCK
      ?auto_506992 - BLOCK
      ?auto_506993 - BLOCK
      ?auto_506994 - BLOCK
      ?auto_506995 - BLOCK
      ?auto_506996 - BLOCK
      ?auto_506997 - BLOCK
      ?auto_506998 - BLOCK
      ?auto_506999 - BLOCK
      ?auto_507000 - BLOCK
      ?auto_507001 - BLOCK
    )
    :vars
    (
      ?auto_507002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507001 ?auto_507002 ) ( ON-TABLE ?auto_506987 ) ( ON ?auto_506988 ?auto_506987 ) ( ON ?auto_506989 ?auto_506988 ) ( ON ?auto_506990 ?auto_506989 ) ( ON ?auto_506991 ?auto_506990 ) ( ON ?auto_506992 ?auto_506991 ) ( ON ?auto_506993 ?auto_506992 ) ( ON ?auto_506994 ?auto_506993 ) ( ON ?auto_506995 ?auto_506994 ) ( ON ?auto_506996 ?auto_506995 ) ( ON ?auto_506997 ?auto_506996 ) ( ON ?auto_506998 ?auto_506997 ) ( not ( = ?auto_506987 ?auto_506988 ) ) ( not ( = ?auto_506987 ?auto_506989 ) ) ( not ( = ?auto_506987 ?auto_506990 ) ) ( not ( = ?auto_506987 ?auto_506991 ) ) ( not ( = ?auto_506987 ?auto_506992 ) ) ( not ( = ?auto_506987 ?auto_506993 ) ) ( not ( = ?auto_506987 ?auto_506994 ) ) ( not ( = ?auto_506987 ?auto_506995 ) ) ( not ( = ?auto_506987 ?auto_506996 ) ) ( not ( = ?auto_506987 ?auto_506997 ) ) ( not ( = ?auto_506987 ?auto_506998 ) ) ( not ( = ?auto_506987 ?auto_506999 ) ) ( not ( = ?auto_506987 ?auto_507000 ) ) ( not ( = ?auto_506987 ?auto_507001 ) ) ( not ( = ?auto_506987 ?auto_507002 ) ) ( not ( = ?auto_506988 ?auto_506989 ) ) ( not ( = ?auto_506988 ?auto_506990 ) ) ( not ( = ?auto_506988 ?auto_506991 ) ) ( not ( = ?auto_506988 ?auto_506992 ) ) ( not ( = ?auto_506988 ?auto_506993 ) ) ( not ( = ?auto_506988 ?auto_506994 ) ) ( not ( = ?auto_506988 ?auto_506995 ) ) ( not ( = ?auto_506988 ?auto_506996 ) ) ( not ( = ?auto_506988 ?auto_506997 ) ) ( not ( = ?auto_506988 ?auto_506998 ) ) ( not ( = ?auto_506988 ?auto_506999 ) ) ( not ( = ?auto_506988 ?auto_507000 ) ) ( not ( = ?auto_506988 ?auto_507001 ) ) ( not ( = ?auto_506988 ?auto_507002 ) ) ( not ( = ?auto_506989 ?auto_506990 ) ) ( not ( = ?auto_506989 ?auto_506991 ) ) ( not ( = ?auto_506989 ?auto_506992 ) ) ( not ( = ?auto_506989 ?auto_506993 ) ) ( not ( = ?auto_506989 ?auto_506994 ) ) ( not ( = ?auto_506989 ?auto_506995 ) ) ( not ( = ?auto_506989 ?auto_506996 ) ) ( not ( = ?auto_506989 ?auto_506997 ) ) ( not ( = ?auto_506989 ?auto_506998 ) ) ( not ( = ?auto_506989 ?auto_506999 ) ) ( not ( = ?auto_506989 ?auto_507000 ) ) ( not ( = ?auto_506989 ?auto_507001 ) ) ( not ( = ?auto_506989 ?auto_507002 ) ) ( not ( = ?auto_506990 ?auto_506991 ) ) ( not ( = ?auto_506990 ?auto_506992 ) ) ( not ( = ?auto_506990 ?auto_506993 ) ) ( not ( = ?auto_506990 ?auto_506994 ) ) ( not ( = ?auto_506990 ?auto_506995 ) ) ( not ( = ?auto_506990 ?auto_506996 ) ) ( not ( = ?auto_506990 ?auto_506997 ) ) ( not ( = ?auto_506990 ?auto_506998 ) ) ( not ( = ?auto_506990 ?auto_506999 ) ) ( not ( = ?auto_506990 ?auto_507000 ) ) ( not ( = ?auto_506990 ?auto_507001 ) ) ( not ( = ?auto_506990 ?auto_507002 ) ) ( not ( = ?auto_506991 ?auto_506992 ) ) ( not ( = ?auto_506991 ?auto_506993 ) ) ( not ( = ?auto_506991 ?auto_506994 ) ) ( not ( = ?auto_506991 ?auto_506995 ) ) ( not ( = ?auto_506991 ?auto_506996 ) ) ( not ( = ?auto_506991 ?auto_506997 ) ) ( not ( = ?auto_506991 ?auto_506998 ) ) ( not ( = ?auto_506991 ?auto_506999 ) ) ( not ( = ?auto_506991 ?auto_507000 ) ) ( not ( = ?auto_506991 ?auto_507001 ) ) ( not ( = ?auto_506991 ?auto_507002 ) ) ( not ( = ?auto_506992 ?auto_506993 ) ) ( not ( = ?auto_506992 ?auto_506994 ) ) ( not ( = ?auto_506992 ?auto_506995 ) ) ( not ( = ?auto_506992 ?auto_506996 ) ) ( not ( = ?auto_506992 ?auto_506997 ) ) ( not ( = ?auto_506992 ?auto_506998 ) ) ( not ( = ?auto_506992 ?auto_506999 ) ) ( not ( = ?auto_506992 ?auto_507000 ) ) ( not ( = ?auto_506992 ?auto_507001 ) ) ( not ( = ?auto_506992 ?auto_507002 ) ) ( not ( = ?auto_506993 ?auto_506994 ) ) ( not ( = ?auto_506993 ?auto_506995 ) ) ( not ( = ?auto_506993 ?auto_506996 ) ) ( not ( = ?auto_506993 ?auto_506997 ) ) ( not ( = ?auto_506993 ?auto_506998 ) ) ( not ( = ?auto_506993 ?auto_506999 ) ) ( not ( = ?auto_506993 ?auto_507000 ) ) ( not ( = ?auto_506993 ?auto_507001 ) ) ( not ( = ?auto_506993 ?auto_507002 ) ) ( not ( = ?auto_506994 ?auto_506995 ) ) ( not ( = ?auto_506994 ?auto_506996 ) ) ( not ( = ?auto_506994 ?auto_506997 ) ) ( not ( = ?auto_506994 ?auto_506998 ) ) ( not ( = ?auto_506994 ?auto_506999 ) ) ( not ( = ?auto_506994 ?auto_507000 ) ) ( not ( = ?auto_506994 ?auto_507001 ) ) ( not ( = ?auto_506994 ?auto_507002 ) ) ( not ( = ?auto_506995 ?auto_506996 ) ) ( not ( = ?auto_506995 ?auto_506997 ) ) ( not ( = ?auto_506995 ?auto_506998 ) ) ( not ( = ?auto_506995 ?auto_506999 ) ) ( not ( = ?auto_506995 ?auto_507000 ) ) ( not ( = ?auto_506995 ?auto_507001 ) ) ( not ( = ?auto_506995 ?auto_507002 ) ) ( not ( = ?auto_506996 ?auto_506997 ) ) ( not ( = ?auto_506996 ?auto_506998 ) ) ( not ( = ?auto_506996 ?auto_506999 ) ) ( not ( = ?auto_506996 ?auto_507000 ) ) ( not ( = ?auto_506996 ?auto_507001 ) ) ( not ( = ?auto_506996 ?auto_507002 ) ) ( not ( = ?auto_506997 ?auto_506998 ) ) ( not ( = ?auto_506997 ?auto_506999 ) ) ( not ( = ?auto_506997 ?auto_507000 ) ) ( not ( = ?auto_506997 ?auto_507001 ) ) ( not ( = ?auto_506997 ?auto_507002 ) ) ( not ( = ?auto_506998 ?auto_506999 ) ) ( not ( = ?auto_506998 ?auto_507000 ) ) ( not ( = ?auto_506998 ?auto_507001 ) ) ( not ( = ?auto_506998 ?auto_507002 ) ) ( not ( = ?auto_506999 ?auto_507000 ) ) ( not ( = ?auto_506999 ?auto_507001 ) ) ( not ( = ?auto_506999 ?auto_507002 ) ) ( not ( = ?auto_507000 ?auto_507001 ) ) ( not ( = ?auto_507000 ?auto_507002 ) ) ( not ( = ?auto_507001 ?auto_507002 ) ) ( ON ?auto_507000 ?auto_507001 ) ( CLEAR ?auto_506998 ) ( ON ?auto_506999 ?auto_507000 ) ( CLEAR ?auto_506999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_506987 ?auto_506988 ?auto_506989 ?auto_506990 ?auto_506991 ?auto_506992 ?auto_506993 ?auto_506994 ?auto_506995 ?auto_506996 ?auto_506997 ?auto_506998 ?auto_506999 )
      ( MAKE-15PILE ?auto_506987 ?auto_506988 ?auto_506989 ?auto_506990 ?auto_506991 ?auto_506992 ?auto_506993 ?auto_506994 ?auto_506995 ?auto_506996 ?auto_506997 ?auto_506998 ?auto_506999 ?auto_507000 ?auto_507001 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507049 - BLOCK
      ?auto_507050 - BLOCK
      ?auto_507051 - BLOCK
      ?auto_507052 - BLOCK
      ?auto_507053 - BLOCK
      ?auto_507054 - BLOCK
      ?auto_507055 - BLOCK
      ?auto_507056 - BLOCK
      ?auto_507057 - BLOCK
      ?auto_507058 - BLOCK
      ?auto_507059 - BLOCK
      ?auto_507060 - BLOCK
      ?auto_507061 - BLOCK
      ?auto_507062 - BLOCK
      ?auto_507063 - BLOCK
    )
    :vars
    (
      ?auto_507064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507063 ?auto_507064 ) ( ON-TABLE ?auto_507049 ) ( ON ?auto_507050 ?auto_507049 ) ( ON ?auto_507051 ?auto_507050 ) ( ON ?auto_507052 ?auto_507051 ) ( ON ?auto_507053 ?auto_507052 ) ( ON ?auto_507054 ?auto_507053 ) ( ON ?auto_507055 ?auto_507054 ) ( ON ?auto_507056 ?auto_507055 ) ( ON ?auto_507057 ?auto_507056 ) ( ON ?auto_507058 ?auto_507057 ) ( ON ?auto_507059 ?auto_507058 ) ( not ( = ?auto_507049 ?auto_507050 ) ) ( not ( = ?auto_507049 ?auto_507051 ) ) ( not ( = ?auto_507049 ?auto_507052 ) ) ( not ( = ?auto_507049 ?auto_507053 ) ) ( not ( = ?auto_507049 ?auto_507054 ) ) ( not ( = ?auto_507049 ?auto_507055 ) ) ( not ( = ?auto_507049 ?auto_507056 ) ) ( not ( = ?auto_507049 ?auto_507057 ) ) ( not ( = ?auto_507049 ?auto_507058 ) ) ( not ( = ?auto_507049 ?auto_507059 ) ) ( not ( = ?auto_507049 ?auto_507060 ) ) ( not ( = ?auto_507049 ?auto_507061 ) ) ( not ( = ?auto_507049 ?auto_507062 ) ) ( not ( = ?auto_507049 ?auto_507063 ) ) ( not ( = ?auto_507049 ?auto_507064 ) ) ( not ( = ?auto_507050 ?auto_507051 ) ) ( not ( = ?auto_507050 ?auto_507052 ) ) ( not ( = ?auto_507050 ?auto_507053 ) ) ( not ( = ?auto_507050 ?auto_507054 ) ) ( not ( = ?auto_507050 ?auto_507055 ) ) ( not ( = ?auto_507050 ?auto_507056 ) ) ( not ( = ?auto_507050 ?auto_507057 ) ) ( not ( = ?auto_507050 ?auto_507058 ) ) ( not ( = ?auto_507050 ?auto_507059 ) ) ( not ( = ?auto_507050 ?auto_507060 ) ) ( not ( = ?auto_507050 ?auto_507061 ) ) ( not ( = ?auto_507050 ?auto_507062 ) ) ( not ( = ?auto_507050 ?auto_507063 ) ) ( not ( = ?auto_507050 ?auto_507064 ) ) ( not ( = ?auto_507051 ?auto_507052 ) ) ( not ( = ?auto_507051 ?auto_507053 ) ) ( not ( = ?auto_507051 ?auto_507054 ) ) ( not ( = ?auto_507051 ?auto_507055 ) ) ( not ( = ?auto_507051 ?auto_507056 ) ) ( not ( = ?auto_507051 ?auto_507057 ) ) ( not ( = ?auto_507051 ?auto_507058 ) ) ( not ( = ?auto_507051 ?auto_507059 ) ) ( not ( = ?auto_507051 ?auto_507060 ) ) ( not ( = ?auto_507051 ?auto_507061 ) ) ( not ( = ?auto_507051 ?auto_507062 ) ) ( not ( = ?auto_507051 ?auto_507063 ) ) ( not ( = ?auto_507051 ?auto_507064 ) ) ( not ( = ?auto_507052 ?auto_507053 ) ) ( not ( = ?auto_507052 ?auto_507054 ) ) ( not ( = ?auto_507052 ?auto_507055 ) ) ( not ( = ?auto_507052 ?auto_507056 ) ) ( not ( = ?auto_507052 ?auto_507057 ) ) ( not ( = ?auto_507052 ?auto_507058 ) ) ( not ( = ?auto_507052 ?auto_507059 ) ) ( not ( = ?auto_507052 ?auto_507060 ) ) ( not ( = ?auto_507052 ?auto_507061 ) ) ( not ( = ?auto_507052 ?auto_507062 ) ) ( not ( = ?auto_507052 ?auto_507063 ) ) ( not ( = ?auto_507052 ?auto_507064 ) ) ( not ( = ?auto_507053 ?auto_507054 ) ) ( not ( = ?auto_507053 ?auto_507055 ) ) ( not ( = ?auto_507053 ?auto_507056 ) ) ( not ( = ?auto_507053 ?auto_507057 ) ) ( not ( = ?auto_507053 ?auto_507058 ) ) ( not ( = ?auto_507053 ?auto_507059 ) ) ( not ( = ?auto_507053 ?auto_507060 ) ) ( not ( = ?auto_507053 ?auto_507061 ) ) ( not ( = ?auto_507053 ?auto_507062 ) ) ( not ( = ?auto_507053 ?auto_507063 ) ) ( not ( = ?auto_507053 ?auto_507064 ) ) ( not ( = ?auto_507054 ?auto_507055 ) ) ( not ( = ?auto_507054 ?auto_507056 ) ) ( not ( = ?auto_507054 ?auto_507057 ) ) ( not ( = ?auto_507054 ?auto_507058 ) ) ( not ( = ?auto_507054 ?auto_507059 ) ) ( not ( = ?auto_507054 ?auto_507060 ) ) ( not ( = ?auto_507054 ?auto_507061 ) ) ( not ( = ?auto_507054 ?auto_507062 ) ) ( not ( = ?auto_507054 ?auto_507063 ) ) ( not ( = ?auto_507054 ?auto_507064 ) ) ( not ( = ?auto_507055 ?auto_507056 ) ) ( not ( = ?auto_507055 ?auto_507057 ) ) ( not ( = ?auto_507055 ?auto_507058 ) ) ( not ( = ?auto_507055 ?auto_507059 ) ) ( not ( = ?auto_507055 ?auto_507060 ) ) ( not ( = ?auto_507055 ?auto_507061 ) ) ( not ( = ?auto_507055 ?auto_507062 ) ) ( not ( = ?auto_507055 ?auto_507063 ) ) ( not ( = ?auto_507055 ?auto_507064 ) ) ( not ( = ?auto_507056 ?auto_507057 ) ) ( not ( = ?auto_507056 ?auto_507058 ) ) ( not ( = ?auto_507056 ?auto_507059 ) ) ( not ( = ?auto_507056 ?auto_507060 ) ) ( not ( = ?auto_507056 ?auto_507061 ) ) ( not ( = ?auto_507056 ?auto_507062 ) ) ( not ( = ?auto_507056 ?auto_507063 ) ) ( not ( = ?auto_507056 ?auto_507064 ) ) ( not ( = ?auto_507057 ?auto_507058 ) ) ( not ( = ?auto_507057 ?auto_507059 ) ) ( not ( = ?auto_507057 ?auto_507060 ) ) ( not ( = ?auto_507057 ?auto_507061 ) ) ( not ( = ?auto_507057 ?auto_507062 ) ) ( not ( = ?auto_507057 ?auto_507063 ) ) ( not ( = ?auto_507057 ?auto_507064 ) ) ( not ( = ?auto_507058 ?auto_507059 ) ) ( not ( = ?auto_507058 ?auto_507060 ) ) ( not ( = ?auto_507058 ?auto_507061 ) ) ( not ( = ?auto_507058 ?auto_507062 ) ) ( not ( = ?auto_507058 ?auto_507063 ) ) ( not ( = ?auto_507058 ?auto_507064 ) ) ( not ( = ?auto_507059 ?auto_507060 ) ) ( not ( = ?auto_507059 ?auto_507061 ) ) ( not ( = ?auto_507059 ?auto_507062 ) ) ( not ( = ?auto_507059 ?auto_507063 ) ) ( not ( = ?auto_507059 ?auto_507064 ) ) ( not ( = ?auto_507060 ?auto_507061 ) ) ( not ( = ?auto_507060 ?auto_507062 ) ) ( not ( = ?auto_507060 ?auto_507063 ) ) ( not ( = ?auto_507060 ?auto_507064 ) ) ( not ( = ?auto_507061 ?auto_507062 ) ) ( not ( = ?auto_507061 ?auto_507063 ) ) ( not ( = ?auto_507061 ?auto_507064 ) ) ( not ( = ?auto_507062 ?auto_507063 ) ) ( not ( = ?auto_507062 ?auto_507064 ) ) ( not ( = ?auto_507063 ?auto_507064 ) ) ( ON ?auto_507062 ?auto_507063 ) ( ON ?auto_507061 ?auto_507062 ) ( CLEAR ?auto_507059 ) ( ON ?auto_507060 ?auto_507061 ) ( CLEAR ?auto_507060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_507049 ?auto_507050 ?auto_507051 ?auto_507052 ?auto_507053 ?auto_507054 ?auto_507055 ?auto_507056 ?auto_507057 ?auto_507058 ?auto_507059 ?auto_507060 )
      ( MAKE-15PILE ?auto_507049 ?auto_507050 ?auto_507051 ?auto_507052 ?auto_507053 ?auto_507054 ?auto_507055 ?auto_507056 ?auto_507057 ?auto_507058 ?auto_507059 ?auto_507060 ?auto_507061 ?auto_507062 ?auto_507063 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507111 - BLOCK
      ?auto_507112 - BLOCK
      ?auto_507113 - BLOCK
      ?auto_507114 - BLOCK
      ?auto_507115 - BLOCK
      ?auto_507116 - BLOCK
      ?auto_507117 - BLOCK
      ?auto_507118 - BLOCK
      ?auto_507119 - BLOCK
      ?auto_507120 - BLOCK
      ?auto_507121 - BLOCK
      ?auto_507122 - BLOCK
      ?auto_507123 - BLOCK
      ?auto_507124 - BLOCK
      ?auto_507125 - BLOCK
    )
    :vars
    (
      ?auto_507126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507125 ?auto_507126 ) ( ON-TABLE ?auto_507111 ) ( ON ?auto_507112 ?auto_507111 ) ( ON ?auto_507113 ?auto_507112 ) ( ON ?auto_507114 ?auto_507113 ) ( ON ?auto_507115 ?auto_507114 ) ( ON ?auto_507116 ?auto_507115 ) ( ON ?auto_507117 ?auto_507116 ) ( ON ?auto_507118 ?auto_507117 ) ( ON ?auto_507119 ?auto_507118 ) ( ON ?auto_507120 ?auto_507119 ) ( not ( = ?auto_507111 ?auto_507112 ) ) ( not ( = ?auto_507111 ?auto_507113 ) ) ( not ( = ?auto_507111 ?auto_507114 ) ) ( not ( = ?auto_507111 ?auto_507115 ) ) ( not ( = ?auto_507111 ?auto_507116 ) ) ( not ( = ?auto_507111 ?auto_507117 ) ) ( not ( = ?auto_507111 ?auto_507118 ) ) ( not ( = ?auto_507111 ?auto_507119 ) ) ( not ( = ?auto_507111 ?auto_507120 ) ) ( not ( = ?auto_507111 ?auto_507121 ) ) ( not ( = ?auto_507111 ?auto_507122 ) ) ( not ( = ?auto_507111 ?auto_507123 ) ) ( not ( = ?auto_507111 ?auto_507124 ) ) ( not ( = ?auto_507111 ?auto_507125 ) ) ( not ( = ?auto_507111 ?auto_507126 ) ) ( not ( = ?auto_507112 ?auto_507113 ) ) ( not ( = ?auto_507112 ?auto_507114 ) ) ( not ( = ?auto_507112 ?auto_507115 ) ) ( not ( = ?auto_507112 ?auto_507116 ) ) ( not ( = ?auto_507112 ?auto_507117 ) ) ( not ( = ?auto_507112 ?auto_507118 ) ) ( not ( = ?auto_507112 ?auto_507119 ) ) ( not ( = ?auto_507112 ?auto_507120 ) ) ( not ( = ?auto_507112 ?auto_507121 ) ) ( not ( = ?auto_507112 ?auto_507122 ) ) ( not ( = ?auto_507112 ?auto_507123 ) ) ( not ( = ?auto_507112 ?auto_507124 ) ) ( not ( = ?auto_507112 ?auto_507125 ) ) ( not ( = ?auto_507112 ?auto_507126 ) ) ( not ( = ?auto_507113 ?auto_507114 ) ) ( not ( = ?auto_507113 ?auto_507115 ) ) ( not ( = ?auto_507113 ?auto_507116 ) ) ( not ( = ?auto_507113 ?auto_507117 ) ) ( not ( = ?auto_507113 ?auto_507118 ) ) ( not ( = ?auto_507113 ?auto_507119 ) ) ( not ( = ?auto_507113 ?auto_507120 ) ) ( not ( = ?auto_507113 ?auto_507121 ) ) ( not ( = ?auto_507113 ?auto_507122 ) ) ( not ( = ?auto_507113 ?auto_507123 ) ) ( not ( = ?auto_507113 ?auto_507124 ) ) ( not ( = ?auto_507113 ?auto_507125 ) ) ( not ( = ?auto_507113 ?auto_507126 ) ) ( not ( = ?auto_507114 ?auto_507115 ) ) ( not ( = ?auto_507114 ?auto_507116 ) ) ( not ( = ?auto_507114 ?auto_507117 ) ) ( not ( = ?auto_507114 ?auto_507118 ) ) ( not ( = ?auto_507114 ?auto_507119 ) ) ( not ( = ?auto_507114 ?auto_507120 ) ) ( not ( = ?auto_507114 ?auto_507121 ) ) ( not ( = ?auto_507114 ?auto_507122 ) ) ( not ( = ?auto_507114 ?auto_507123 ) ) ( not ( = ?auto_507114 ?auto_507124 ) ) ( not ( = ?auto_507114 ?auto_507125 ) ) ( not ( = ?auto_507114 ?auto_507126 ) ) ( not ( = ?auto_507115 ?auto_507116 ) ) ( not ( = ?auto_507115 ?auto_507117 ) ) ( not ( = ?auto_507115 ?auto_507118 ) ) ( not ( = ?auto_507115 ?auto_507119 ) ) ( not ( = ?auto_507115 ?auto_507120 ) ) ( not ( = ?auto_507115 ?auto_507121 ) ) ( not ( = ?auto_507115 ?auto_507122 ) ) ( not ( = ?auto_507115 ?auto_507123 ) ) ( not ( = ?auto_507115 ?auto_507124 ) ) ( not ( = ?auto_507115 ?auto_507125 ) ) ( not ( = ?auto_507115 ?auto_507126 ) ) ( not ( = ?auto_507116 ?auto_507117 ) ) ( not ( = ?auto_507116 ?auto_507118 ) ) ( not ( = ?auto_507116 ?auto_507119 ) ) ( not ( = ?auto_507116 ?auto_507120 ) ) ( not ( = ?auto_507116 ?auto_507121 ) ) ( not ( = ?auto_507116 ?auto_507122 ) ) ( not ( = ?auto_507116 ?auto_507123 ) ) ( not ( = ?auto_507116 ?auto_507124 ) ) ( not ( = ?auto_507116 ?auto_507125 ) ) ( not ( = ?auto_507116 ?auto_507126 ) ) ( not ( = ?auto_507117 ?auto_507118 ) ) ( not ( = ?auto_507117 ?auto_507119 ) ) ( not ( = ?auto_507117 ?auto_507120 ) ) ( not ( = ?auto_507117 ?auto_507121 ) ) ( not ( = ?auto_507117 ?auto_507122 ) ) ( not ( = ?auto_507117 ?auto_507123 ) ) ( not ( = ?auto_507117 ?auto_507124 ) ) ( not ( = ?auto_507117 ?auto_507125 ) ) ( not ( = ?auto_507117 ?auto_507126 ) ) ( not ( = ?auto_507118 ?auto_507119 ) ) ( not ( = ?auto_507118 ?auto_507120 ) ) ( not ( = ?auto_507118 ?auto_507121 ) ) ( not ( = ?auto_507118 ?auto_507122 ) ) ( not ( = ?auto_507118 ?auto_507123 ) ) ( not ( = ?auto_507118 ?auto_507124 ) ) ( not ( = ?auto_507118 ?auto_507125 ) ) ( not ( = ?auto_507118 ?auto_507126 ) ) ( not ( = ?auto_507119 ?auto_507120 ) ) ( not ( = ?auto_507119 ?auto_507121 ) ) ( not ( = ?auto_507119 ?auto_507122 ) ) ( not ( = ?auto_507119 ?auto_507123 ) ) ( not ( = ?auto_507119 ?auto_507124 ) ) ( not ( = ?auto_507119 ?auto_507125 ) ) ( not ( = ?auto_507119 ?auto_507126 ) ) ( not ( = ?auto_507120 ?auto_507121 ) ) ( not ( = ?auto_507120 ?auto_507122 ) ) ( not ( = ?auto_507120 ?auto_507123 ) ) ( not ( = ?auto_507120 ?auto_507124 ) ) ( not ( = ?auto_507120 ?auto_507125 ) ) ( not ( = ?auto_507120 ?auto_507126 ) ) ( not ( = ?auto_507121 ?auto_507122 ) ) ( not ( = ?auto_507121 ?auto_507123 ) ) ( not ( = ?auto_507121 ?auto_507124 ) ) ( not ( = ?auto_507121 ?auto_507125 ) ) ( not ( = ?auto_507121 ?auto_507126 ) ) ( not ( = ?auto_507122 ?auto_507123 ) ) ( not ( = ?auto_507122 ?auto_507124 ) ) ( not ( = ?auto_507122 ?auto_507125 ) ) ( not ( = ?auto_507122 ?auto_507126 ) ) ( not ( = ?auto_507123 ?auto_507124 ) ) ( not ( = ?auto_507123 ?auto_507125 ) ) ( not ( = ?auto_507123 ?auto_507126 ) ) ( not ( = ?auto_507124 ?auto_507125 ) ) ( not ( = ?auto_507124 ?auto_507126 ) ) ( not ( = ?auto_507125 ?auto_507126 ) ) ( ON ?auto_507124 ?auto_507125 ) ( ON ?auto_507123 ?auto_507124 ) ( ON ?auto_507122 ?auto_507123 ) ( CLEAR ?auto_507120 ) ( ON ?auto_507121 ?auto_507122 ) ( CLEAR ?auto_507121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_507111 ?auto_507112 ?auto_507113 ?auto_507114 ?auto_507115 ?auto_507116 ?auto_507117 ?auto_507118 ?auto_507119 ?auto_507120 ?auto_507121 )
      ( MAKE-15PILE ?auto_507111 ?auto_507112 ?auto_507113 ?auto_507114 ?auto_507115 ?auto_507116 ?auto_507117 ?auto_507118 ?auto_507119 ?auto_507120 ?auto_507121 ?auto_507122 ?auto_507123 ?auto_507124 ?auto_507125 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507173 - BLOCK
      ?auto_507174 - BLOCK
      ?auto_507175 - BLOCK
      ?auto_507176 - BLOCK
      ?auto_507177 - BLOCK
      ?auto_507178 - BLOCK
      ?auto_507179 - BLOCK
      ?auto_507180 - BLOCK
      ?auto_507181 - BLOCK
      ?auto_507182 - BLOCK
      ?auto_507183 - BLOCK
      ?auto_507184 - BLOCK
      ?auto_507185 - BLOCK
      ?auto_507186 - BLOCK
      ?auto_507187 - BLOCK
    )
    :vars
    (
      ?auto_507188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507187 ?auto_507188 ) ( ON-TABLE ?auto_507173 ) ( ON ?auto_507174 ?auto_507173 ) ( ON ?auto_507175 ?auto_507174 ) ( ON ?auto_507176 ?auto_507175 ) ( ON ?auto_507177 ?auto_507176 ) ( ON ?auto_507178 ?auto_507177 ) ( ON ?auto_507179 ?auto_507178 ) ( ON ?auto_507180 ?auto_507179 ) ( ON ?auto_507181 ?auto_507180 ) ( not ( = ?auto_507173 ?auto_507174 ) ) ( not ( = ?auto_507173 ?auto_507175 ) ) ( not ( = ?auto_507173 ?auto_507176 ) ) ( not ( = ?auto_507173 ?auto_507177 ) ) ( not ( = ?auto_507173 ?auto_507178 ) ) ( not ( = ?auto_507173 ?auto_507179 ) ) ( not ( = ?auto_507173 ?auto_507180 ) ) ( not ( = ?auto_507173 ?auto_507181 ) ) ( not ( = ?auto_507173 ?auto_507182 ) ) ( not ( = ?auto_507173 ?auto_507183 ) ) ( not ( = ?auto_507173 ?auto_507184 ) ) ( not ( = ?auto_507173 ?auto_507185 ) ) ( not ( = ?auto_507173 ?auto_507186 ) ) ( not ( = ?auto_507173 ?auto_507187 ) ) ( not ( = ?auto_507173 ?auto_507188 ) ) ( not ( = ?auto_507174 ?auto_507175 ) ) ( not ( = ?auto_507174 ?auto_507176 ) ) ( not ( = ?auto_507174 ?auto_507177 ) ) ( not ( = ?auto_507174 ?auto_507178 ) ) ( not ( = ?auto_507174 ?auto_507179 ) ) ( not ( = ?auto_507174 ?auto_507180 ) ) ( not ( = ?auto_507174 ?auto_507181 ) ) ( not ( = ?auto_507174 ?auto_507182 ) ) ( not ( = ?auto_507174 ?auto_507183 ) ) ( not ( = ?auto_507174 ?auto_507184 ) ) ( not ( = ?auto_507174 ?auto_507185 ) ) ( not ( = ?auto_507174 ?auto_507186 ) ) ( not ( = ?auto_507174 ?auto_507187 ) ) ( not ( = ?auto_507174 ?auto_507188 ) ) ( not ( = ?auto_507175 ?auto_507176 ) ) ( not ( = ?auto_507175 ?auto_507177 ) ) ( not ( = ?auto_507175 ?auto_507178 ) ) ( not ( = ?auto_507175 ?auto_507179 ) ) ( not ( = ?auto_507175 ?auto_507180 ) ) ( not ( = ?auto_507175 ?auto_507181 ) ) ( not ( = ?auto_507175 ?auto_507182 ) ) ( not ( = ?auto_507175 ?auto_507183 ) ) ( not ( = ?auto_507175 ?auto_507184 ) ) ( not ( = ?auto_507175 ?auto_507185 ) ) ( not ( = ?auto_507175 ?auto_507186 ) ) ( not ( = ?auto_507175 ?auto_507187 ) ) ( not ( = ?auto_507175 ?auto_507188 ) ) ( not ( = ?auto_507176 ?auto_507177 ) ) ( not ( = ?auto_507176 ?auto_507178 ) ) ( not ( = ?auto_507176 ?auto_507179 ) ) ( not ( = ?auto_507176 ?auto_507180 ) ) ( not ( = ?auto_507176 ?auto_507181 ) ) ( not ( = ?auto_507176 ?auto_507182 ) ) ( not ( = ?auto_507176 ?auto_507183 ) ) ( not ( = ?auto_507176 ?auto_507184 ) ) ( not ( = ?auto_507176 ?auto_507185 ) ) ( not ( = ?auto_507176 ?auto_507186 ) ) ( not ( = ?auto_507176 ?auto_507187 ) ) ( not ( = ?auto_507176 ?auto_507188 ) ) ( not ( = ?auto_507177 ?auto_507178 ) ) ( not ( = ?auto_507177 ?auto_507179 ) ) ( not ( = ?auto_507177 ?auto_507180 ) ) ( not ( = ?auto_507177 ?auto_507181 ) ) ( not ( = ?auto_507177 ?auto_507182 ) ) ( not ( = ?auto_507177 ?auto_507183 ) ) ( not ( = ?auto_507177 ?auto_507184 ) ) ( not ( = ?auto_507177 ?auto_507185 ) ) ( not ( = ?auto_507177 ?auto_507186 ) ) ( not ( = ?auto_507177 ?auto_507187 ) ) ( not ( = ?auto_507177 ?auto_507188 ) ) ( not ( = ?auto_507178 ?auto_507179 ) ) ( not ( = ?auto_507178 ?auto_507180 ) ) ( not ( = ?auto_507178 ?auto_507181 ) ) ( not ( = ?auto_507178 ?auto_507182 ) ) ( not ( = ?auto_507178 ?auto_507183 ) ) ( not ( = ?auto_507178 ?auto_507184 ) ) ( not ( = ?auto_507178 ?auto_507185 ) ) ( not ( = ?auto_507178 ?auto_507186 ) ) ( not ( = ?auto_507178 ?auto_507187 ) ) ( not ( = ?auto_507178 ?auto_507188 ) ) ( not ( = ?auto_507179 ?auto_507180 ) ) ( not ( = ?auto_507179 ?auto_507181 ) ) ( not ( = ?auto_507179 ?auto_507182 ) ) ( not ( = ?auto_507179 ?auto_507183 ) ) ( not ( = ?auto_507179 ?auto_507184 ) ) ( not ( = ?auto_507179 ?auto_507185 ) ) ( not ( = ?auto_507179 ?auto_507186 ) ) ( not ( = ?auto_507179 ?auto_507187 ) ) ( not ( = ?auto_507179 ?auto_507188 ) ) ( not ( = ?auto_507180 ?auto_507181 ) ) ( not ( = ?auto_507180 ?auto_507182 ) ) ( not ( = ?auto_507180 ?auto_507183 ) ) ( not ( = ?auto_507180 ?auto_507184 ) ) ( not ( = ?auto_507180 ?auto_507185 ) ) ( not ( = ?auto_507180 ?auto_507186 ) ) ( not ( = ?auto_507180 ?auto_507187 ) ) ( not ( = ?auto_507180 ?auto_507188 ) ) ( not ( = ?auto_507181 ?auto_507182 ) ) ( not ( = ?auto_507181 ?auto_507183 ) ) ( not ( = ?auto_507181 ?auto_507184 ) ) ( not ( = ?auto_507181 ?auto_507185 ) ) ( not ( = ?auto_507181 ?auto_507186 ) ) ( not ( = ?auto_507181 ?auto_507187 ) ) ( not ( = ?auto_507181 ?auto_507188 ) ) ( not ( = ?auto_507182 ?auto_507183 ) ) ( not ( = ?auto_507182 ?auto_507184 ) ) ( not ( = ?auto_507182 ?auto_507185 ) ) ( not ( = ?auto_507182 ?auto_507186 ) ) ( not ( = ?auto_507182 ?auto_507187 ) ) ( not ( = ?auto_507182 ?auto_507188 ) ) ( not ( = ?auto_507183 ?auto_507184 ) ) ( not ( = ?auto_507183 ?auto_507185 ) ) ( not ( = ?auto_507183 ?auto_507186 ) ) ( not ( = ?auto_507183 ?auto_507187 ) ) ( not ( = ?auto_507183 ?auto_507188 ) ) ( not ( = ?auto_507184 ?auto_507185 ) ) ( not ( = ?auto_507184 ?auto_507186 ) ) ( not ( = ?auto_507184 ?auto_507187 ) ) ( not ( = ?auto_507184 ?auto_507188 ) ) ( not ( = ?auto_507185 ?auto_507186 ) ) ( not ( = ?auto_507185 ?auto_507187 ) ) ( not ( = ?auto_507185 ?auto_507188 ) ) ( not ( = ?auto_507186 ?auto_507187 ) ) ( not ( = ?auto_507186 ?auto_507188 ) ) ( not ( = ?auto_507187 ?auto_507188 ) ) ( ON ?auto_507186 ?auto_507187 ) ( ON ?auto_507185 ?auto_507186 ) ( ON ?auto_507184 ?auto_507185 ) ( ON ?auto_507183 ?auto_507184 ) ( CLEAR ?auto_507181 ) ( ON ?auto_507182 ?auto_507183 ) ( CLEAR ?auto_507182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_507173 ?auto_507174 ?auto_507175 ?auto_507176 ?auto_507177 ?auto_507178 ?auto_507179 ?auto_507180 ?auto_507181 ?auto_507182 )
      ( MAKE-15PILE ?auto_507173 ?auto_507174 ?auto_507175 ?auto_507176 ?auto_507177 ?auto_507178 ?auto_507179 ?auto_507180 ?auto_507181 ?auto_507182 ?auto_507183 ?auto_507184 ?auto_507185 ?auto_507186 ?auto_507187 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507235 - BLOCK
      ?auto_507236 - BLOCK
      ?auto_507237 - BLOCK
      ?auto_507238 - BLOCK
      ?auto_507239 - BLOCK
      ?auto_507240 - BLOCK
      ?auto_507241 - BLOCK
      ?auto_507242 - BLOCK
      ?auto_507243 - BLOCK
      ?auto_507244 - BLOCK
      ?auto_507245 - BLOCK
      ?auto_507246 - BLOCK
      ?auto_507247 - BLOCK
      ?auto_507248 - BLOCK
      ?auto_507249 - BLOCK
    )
    :vars
    (
      ?auto_507250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507249 ?auto_507250 ) ( ON-TABLE ?auto_507235 ) ( ON ?auto_507236 ?auto_507235 ) ( ON ?auto_507237 ?auto_507236 ) ( ON ?auto_507238 ?auto_507237 ) ( ON ?auto_507239 ?auto_507238 ) ( ON ?auto_507240 ?auto_507239 ) ( ON ?auto_507241 ?auto_507240 ) ( ON ?auto_507242 ?auto_507241 ) ( not ( = ?auto_507235 ?auto_507236 ) ) ( not ( = ?auto_507235 ?auto_507237 ) ) ( not ( = ?auto_507235 ?auto_507238 ) ) ( not ( = ?auto_507235 ?auto_507239 ) ) ( not ( = ?auto_507235 ?auto_507240 ) ) ( not ( = ?auto_507235 ?auto_507241 ) ) ( not ( = ?auto_507235 ?auto_507242 ) ) ( not ( = ?auto_507235 ?auto_507243 ) ) ( not ( = ?auto_507235 ?auto_507244 ) ) ( not ( = ?auto_507235 ?auto_507245 ) ) ( not ( = ?auto_507235 ?auto_507246 ) ) ( not ( = ?auto_507235 ?auto_507247 ) ) ( not ( = ?auto_507235 ?auto_507248 ) ) ( not ( = ?auto_507235 ?auto_507249 ) ) ( not ( = ?auto_507235 ?auto_507250 ) ) ( not ( = ?auto_507236 ?auto_507237 ) ) ( not ( = ?auto_507236 ?auto_507238 ) ) ( not ( = ?auto_507236 ?auto_507239 ) ) ( not ( = ?auto_507236 ?auto_507240 ) ) ( not ( = ?auto_507236 ?auto_507241 ) ) ( not ( = ?auto_507236 ?auto_507242 ) ) ( not ( = ?auto_507236 ?auto_507243 ) ) ( not ( = ?auto_507236 ?auto_507244 ) ) ( not ( = ?auto_507236 ?auto_507245 ) ) ( not ( = ?auto_507236 ?auto_507246 ) ) ( not ( = ?auto_507236 ?auto_507247 ) ) ( not ( = ?auto_507236 ?auto_507248 ) ) ( not ( = ?auto_507236 ?auto_507249 ) ) ( not ( = ?auto_507236 ?auto_507250 ) ) ( not ( = ?auto_507237 ?auto_507238 ) ) ( not ( = ?auto_507237 ?auto_507239 ) ) ( not ( = ?auto_507237 ?auto_507240 ) ) ( not ( = ?auto_507237 ?auto_507241 ) ) ( not ( = ?auto_507237 ?auto_507242 ) ) ( not ( = ?auto_507237 ?auto_507243 ) ) ( not ( = ?auto_507237 ?auto_507244 ) ) ( not ( = ?auto_507237 ?auto_507245 ) ) ( not ( = ?auto_507237 ?auto_507246 ) ) ( not ( = ?auto_507237 ?auto_507247 ) ) ( not ( = ?auto_507237 ?auto_507248 ) ) ( not ( = ?auto_507237 ?auto_507249 ) ) ( not ( = ?auto_507237 ?auto_507250 ) ) ( not ( = ?auto_507238 ?auto_507239 ) ) ( not ( = ?auto_507238 ?auto_507240 ) ) ( not ( = ?auto_507238 ?auto_507241 ) ) ( not ( = ?auto_507238 ?auto_507242 ) ) ( not ( = ?auto_507238 ?auto_507243 ) ) ( not ( = ?auto_507238 ?auto_507244 ) ) ( not ( = ?auto_507238 ?auto_507245 ) ) ( not ( = ?auto_507238 ?auto_507246 ) ) ( not ( = ?auto_507238 ?auto_507247 ) ) ( not ( = ?auto_507238 ?auto_507248 ) ) ( not ( = ?auto_507238 ?auto_507249 ) ) ( not ( = ?auto_507238 ?auto_507250 ) ) ( not ( = ?auto_507239 ?auto_507240 ) ) ( not ( = ?auto_507239 ?auto_507241 ) ) ( not ( = ?auto_507239 ?auto_507242 ) ) ( not ( = ?auto_507239 ?auto_507243 ) ) ( not ( = ?auto_507239 ?auto_507244 ) ) ( not ( = ?auto_507239 ?auto_507245 ) ) ( not ( = ?auto_507239 ?auto_507246 ) ) ( not ( = ?auto_507239 ?auto_507247 ) ) ( not ( = ?auto_507239 ?auto_507248 ) ) ( not ( = ?auto_507239 ?auto_507249 ) ) ( not ( = ?auto_507239 ?auto_507250 ) ) ( not ( = ?auto_507240 ?auto_507241 ) ) ( not ( = ?auto_507240 ?auto_507242 ) ) ( not ( = ?auto_507240 ?auto_507243 ) ) ( not ( = ?auto_507240 ?auto_507244 ) ) ( not ( = ?auto_507240 ?auto_507245 ) ) ( not ( = ?auto_507240 ?auto_507246 ) ) ( not ( = ?auto_507240 ?auto_507247 ) ) ( not ( = ?auto_507240 ?auto_507248 ) ) ( not ( = ?auto_507240 ?auto_507249 ) ) ( not ( = ?auto_507240 ?auto_507250 ) ) ( not ( = ?auto_507241 ?auto_507242 ) ) ( not ( = ?auto_507241 ?auto_507243 ) ) ( not ( = ?auto_507241 ?auto_507244 ) ) ( not ( = ?auto_507241 ?auto_507245 ) ) ( not ( = ?auto_507241 ?auto_507246 ) ) ( not ( = ?auto_507241 ?auto_507247 ) ) ( not ( = ?auto_507241 ?auto_507248 ) ) ( not ( = ?auto_507241 ?auto_507249 ) ) ( not ( = ?auto_507241 ?auto_507250 ) ) ( not ( = ?auto_507242 ?auto_507243 ) ) ( not ( = ?auto_507242 ?auto_507244 ) ) ( not ( = ?auto_507242 ?auto_507245 ) ) ( not ( = ?auto_507242 ?auto_507246 ) ) ( not ( = ?auto_507242 ?auto_507247 ) ) ( not ( = ?auto_507242 ?auto_507248 ) ) ( not ( = ?auto_507242 ?auto_507249 ) ) ( not ( = ?auto_507242 ?auto_507250 ) ) ( not ( = ?auto_507243 ?auto_507244 ) ) ( not ( = ?auto_507243 ?auto_507245 ) ) ( not ( = ?auto_507243 ?auto_507246 ) ) ( not ( = ?auto_507243 ?auto_507247 ) ) ( not ( = ?auto_507243 ?auto_507248 ) ) ( not ( = ?auto_507243 ?auto_507249 ) ) ( not ( = ?auto_507243 ?auto_507250 ) ) ( not ( = ?auto_507244 ?auto_507245 ) ) ( not ( = ?auto_507244 ?auto_507246 ) ) ( not ( = ?auto_507244 ?auto_507247 ) ) ( not ( = ?auto_507244 ?auto_507248 ) ) ( not ( = ?auto_507244 ?auto_507249 ) ) ( not ( = ?auto_507244 ?auto_507250 ) ) ( not ( = ?auto_507245 ?auto_507246 ) ) ( not ( = ?auto_507245 ?auto_507247 ) ) ( not ( = ?auto_507245 ?auto_507248 ) ) ( not ( = ?auto_507245 ?auto_507249 ) ) ( not ( = ?auto_507245 ?auto_507250 ) ) ( not ( = ?auto_507246 ?auto_507247 ) ) ( not ( = ?auto_507246 ?auto_507248 ) ) ( not ( = ?auto_507246 ?auto_507249 ) ) ( not ( = ?auto_507246 ?auto_507250 ) ) ( not ( = ?auto_507247 ?auto_507248 ) ) ( not ( = ?auto_507247 ?auto_507249 ) ) ( not ( = ?auto_507247 ?auto_507250 ) ) ( not ( = ?auto_507248 ?auto_507249 ) ) ( not ( = ?auto_507248 ?auto_507250 ) ) ( not ( = ?auto_507249 ?auto_507250 ) ) ( ON ?auto_507248 ?auto_507249 ) ( ON ?auto_507247 ?auto_507248 ) ( ON ?auto_507246 ?auto_507247 ) ( ON ?auto_507245 ?auto_507246 ) ( ON ?auto_507244 ?auto_507245 ) ( CLEAR ?auto_507242 ) ( ON ?auto_507243 ?auto_507244 ) ( CLEAR ?auto_507243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_507235 ?auto_507236 ?auto_507237 ?auto_507238 ?auto_507239 ?auto_507240 ?auto_507241 ?auto_507242 ?auto_507243 )
      ( MAKE-15PILE ?auto_507235 ?auto_507236 ?auto_507237 ?auto_507238 ?auto_507239 ?auto_507240 ?auto_507241 ?auto_507242 ?auto_507243 ?auto_507244 ?auto_507245 ?auto_507246 ?auto_507247 ?auto_507248 ?auto_507249 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507297 - BLOCK
      ?auto_507298 - BLOCK
      ?auto_507299 - BLOCK
      ?auto_507300 - BLOCK
      ?auto_507301 - BLOCK
      ?auto_507302 - BLOCK
      ?auto_507303 - BLOCK
      ?auto_507304 - BLOCK
      ?auto_507305 - BLOCK
      ?auto_507306 - BLOCK
      ?auto_507307 - BLOCK
      ?auto_507308 - BLOCK
      ?auto_507309 - BLOCK
      ?auto_507310 - BLOCK
      ?auto_507311 - BLOCK
    )
    :vars
    (
      ?auto_507312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507311 ?auto_507312 ) ( ON-TABLE ?auto_507297 ) ( ON ?auto_507298 ?auto_507297 ) ( ON ?auto_507299 ?auto_507298 ) ( ON ?auto_507300 ?auto_507299 ) ( ON ?auto_507301 ?auto_507300 ) ( ON ?auto_507302 ?auto_507301 ) ( ON ?auto_507303 ?auto_507302 ) ( not ( = ?auto_507297 ?auto_507298 ) ) ( not ( = ?auto_507297 ?auto_507299 ) ) ( not ( = ?auto_507297 ?auto_507300 ) ) ( not ( = ?auto_507297 ?auto_507301 ) ) ( not ( = ?auto_507297 ?auto_507302 ) ) ( not ( = ?auto_507297 ?auto_507303 ) ) ( not ( = ?auto_507297 ?auto_507304 ) ) ( not ( = ?auto_507297 ?auto_507305 ) ) ( not ( = ?auto_507297 ?auto_507306 ) ) ( not ( = ?auto_507297 ?auto_507307 ) ) ( not ( = ?auto_507297 ?auto_507308 ) ) ( not ( = ?auto_507297 ?auto_507309 ) ) ( not ( = ?auto_507297 ?auto_507310 ) ) ( not ( = ?auto_507297 ?auto_507311 ) ) ( not ( = ?auto_507297 ?auto_507312 ) ) ( not ( = ?auto_507298 ?auto_507299 ) ) ( not ( = ?auto_507298 ?auto_507300 ) ) ( not ( = ?auto_507298 ?auto_507301 ) ) ( not ( = ?auto_507298 ?auto_507302 ) ) ( not ( = ?auto_507298 ?auto_507303 ) ) ( not ( = ?auto_507298 ?auto_507304 ) ) ( not ( = ?auto_507298 ?auto_507305 ) ) ( not ( = ?auto_507298 ?auto_507306 ) ) ( not ( = ?auto_507298 ?auto_507307 ) ) ( not ( = ?auto_507298 ?auto_507308 ) ) ( not ( = ?auto_507298 ?auto_507309 ) ) ( not ( = ?auto_507298 ?auto_507310 ) ) ( not ( = ?auto_507298 ?auto_507311 ) ) ( not ( = ?auto_507298 ?auto_507312 ) ) ( not ( = ?auto_507299 ?auto_507300 ) ) ( not ( = ?auto_507299 ?auto_507301 ) ) ( not ( = ?auto_507299 ?auto_507302 ) ) ( not ( = ?auto_507299 ?auto_507303 ) ) ( not ( = ?auto_507299 ?auto_507304 ) ) ( not ( = ?auto_507299 ?auto_507305 ) ) ( not ( = ?auto_507299 ?auto_507306 ) ) ( not ( = ?auto_507299 ?auto_507307 ) ) ( not ( = ?auto_507299 ?auto_507308 ) ) ( not ( = ?auto_507299 ?auto_507309 ) ) ( not ( = ?auto_507299 ?auto_507310 ) ) ( not ( = ?auto_507299 ?auto_507311 ) ) ( not ( = ?auto_507299 ?auto_507312 ) ) ( not ( = ?auto_507300 ?auto_507301 ) ) ( not ( = ?auto_507300 ?auto_507302 ) ) ( not ( = ?auto_507300 ?auto_507303 ) ) ( not ( = ?auto_507300 ?auto_507304 ) ) ( not ( = ?auto_507300 ?auto_507305 ) ) ( not ( = ?auto_507300 ?auto_507306 ) ) ( not ( = ?auto_507300 ?auto_507307 ) ) ( not ( = ?auto_507300 ?auto_507308 ) ) ( not ( = ?auto_507300 ?auto_507309 ) ) ( not ( = ?auto_507300 ?auto_507310 ) ) ( not ( = ?auto_507300 ?auto_507311 ) ) ( not ( = ?auto_507300 ?auto_507312 ) ) ( not ( = ?auto_507301 ?auto_507302 ) ) ( not ( = ?auto_507301 ?auto_507303 ) ) ( not ( = ?auto_507301 ?auto_507304 ) ) ( not ( = ?auto_507301 ?auto_507305 ) ) ( not ( = ?auto_507301 ?auto_507306 ) ) ( not ( = ?auto_507301 ?auto_507307 ) ) ( not ( = ?auto_507301 ?auto_507308 ) ) ( not ( = ?auto_507301 ?auto_507309 ) ) ( not ( = ?auto_507301 ?auto_507310 ) ) ( not ( = ?auto_507301 ?auto_507311 ) ) ( not ( = ?auto_507301 ?auto_507312 ) ) ( not ( = ?auto_507302 ?auto_507303 ) ) ( not ( = ?auto_507302 ?auto_507304 ) ) ( not ( = ?auto_507302 ?auto_507305 ) ) ( not ( = ?auto_507302 ?auto_507306 ) ) ( not ( = ?auto_507302 ?auto_507307 ) ) ( not ( = ?auto_507302 ?auto_507308 ) ) ( not ( = ?auto_507302 ?auto_507309 ) ) ( not ( = ?auto_507302 ?auto_507310 ) ) ( not ( = ?auto_507302 ?auto_507311 ) ) ( not ( = ?auto_507302 ?auto_507312 ) ) ( not ( = ?auto_507303 ?auto_507304 ) ) ( not ( = ?auto_507303 ?auto_507305 ) ) ( not ( = ?auto_507303 ?auto_507306 ) ) ( not ( = ?auto_507303 ?auto_507307 ) ) ( not ( = ?auto_507303 ?auto_507308 ) ) ( not ( = ?auto_507303 ?auto_507309 ) ) ( not ( = ?auto_507303 ?auto_507310 ) ) ( not ( = ?auto_507303 ?auto_507311 ) ) ( not ( = ?auto_507303 ?auto_507312 ) ) ( not ( = ?auto_507304 ?auto_507305 ) ) ( not ( = ?auto_507304 ?auto_507306 ) ) ( not ( = ?auto_507304 ?auto_507307 ) ) ( not ( = ?auto_507304 ?auto_507308 ) ) ( not ( = ?auto_507304 ?auto_507309 ) ) ( not ( = ?auto_507304 ?auto_507310 ) ) ( not ( = ?auto_507304 ?auto_507311 ) ) ( not ( = ?auto_507304 ?auto_507312 ) ) ( not ( = ?auto_507305 ?auto_507306 ) ) ( not ( = ?auto_507305 ?auto_507307 ) ) ( not ( = ?auto_507305 ?auto_507308 ) ) ( not ( = ?auto_507305 ?auto_507309 ) ) ( not ( = ?auto_507305 ?auto_507310 ) ) ( not ( = ?auto_507305 ?auto_507311 ) ) ( not ( = ?auto_507305 ?auto_507312 ) ) ( not ( = ?auto_507306 ?auto_507307 ) ) ( not ( = ?auto_507306 ?auto_507308 ) ) ( not ( = ?auto_507306 ?auto_507309 ) ) ( not ( = ?auto_507306 ?auto_507310 ) ) ( not ( = ?auto_507306 ?auto_507311 ) ) ( not ( = ?auto_507306 ?auto_507312 ) ) ( not ( = ?auto_507307 ?auto_507308 ) ) ( not ( = ?auto_507307 ?auto_507309 ) ) ( not ( = ?auto_507307 ?auto_507310 ) ) ( not ( = ?auto_507307 ?auto_507311 ) ) ( not ( = ?auto_507307 ?auto_507312 ) ) ( not ( = ?auto_507308 ?auto_507309 ) ) ( not ( = ?auto_507308 ?auto_507310 ) ) ( not ( = ?auto_507308 ?auto_507311 ) ) ( not ( = ?auto_507308 ?auto_507312 ) ) ( not ( = ?auto_507309 ?auto_507310 ) ) ( not ( = ?auto_507309 ?auto_507311 ) ) ( not ( = ?auto_507309 ?auto_507312 ) ) ( not ( = ?auto_507310 ?auto_507311 ) ) ( not ( = ?auto_507310 ?auto_507312 ) ) ( not ( = ?auto_507311 ?auto_507312 ) ) ( ON ?auto_507310 ?auto_507311 ) ( ON ?auto_507309 ?auto_507310 ) ( ON ?auto_507308 ?auto_507309 ) ( ON ?auto_507307 ?auto_507308 ) ( ON ?auto_507306 ?auto_507307 ) ( ON ?auto_507305 ?auto_507306 ) ( CLEAR ?auto_507303 ) ( ON ?auto_507304 ?auto_507305 ) ( CLEAR ?auto_507304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_507297 ?auto_507298 ?auto_507299 ?auto_507300 ?auto_507301 ?auto_507302 ?auto_507303 ?auto_507304 )
      ( MAKE-15PILE ?auto_507297 ?auto_507298 ?auto_507299 ?auto_507300 ?auto_507301 ?auto_507302 ?auto_507303 ?auto_507304 ?auto_507305 ?auto_507306 ?auto_507307 ?auto_507308 ?auto_507309 ?auto_507310 ?auto_507311 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507359 - BLOCK
      ?auto_507360 - BLOCK
      ?auto_507361 - BLOCK
      ?auto_507362 - BLOCK
      ?auto_507363 - BLOCK
      ?auto_507364 - BLOCK
      ?auto_507365 - BLOCK
      ?auto_507366 - BLOCK
      ?auto_507367 - BLOCK
      ?auto_507368 - BLOCK
      ?auto_507369 - BLOCK
      ?auto_507370 - BLOCK
      ?auto_507371 - BLOCK
      ?auto_507372 - BLOCK
      ?auto_507373 - BLOCK
    )
    :vars
    (
      ?auto_507374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507373 ?auto_507374 ) ( ON-TABLE ?auto_507359 ) ( ON ?auto_507360 ?auto_507359 ) ( ON ?auto_507361 ?auto_507360 ) ( ON ?auto_507362 ?auto_507361 ) ( ON ?auto_507363 ?auto_507362 ) ( ON ?auto_507364 ?auto_507363 ) ( not ( = ?auto_507359 ?auto_507360 ) ) ( not ( = ?auto_507359 ?auto_507361 ) ) ( not ( = ?auto_507359 ?auto_507362 ) ) ( not ( = ?auto_507359 ?auto_507363 ) ) ( not ( = ?auto_507359 ?auto_507364 ) ) ( not ( = ?auto_507359 ?auto_507365 ) ) ( not ( = ?auto_507359 ?auto_507366 ) ) ( not ( = ?auto_507359 ?auto_507367 ) ) ( not ( = ?auto_507359 ?auto_507368 ) ) ( not ( = ?auto_507359 ?auto_507369 ) ) ( not ( = ?auto_507359 ?auto_507370 ) ) ( not ( = ?auto_507359 ?auto_507371 ) ) ( not ( = ?auto_507359 ?auto_507372 ) ) ( not ( = ?auto_507359 ?auto_507373 ) ) ( not ( = ?auto_507359 ?auto_507374 ) ) ( not ( = ?auto_507360 ?auto_507361 ) ) ( not ( = ?auto_507360 ?auto_507362 ) ) ( not ( = ?auto_507360 ?auto_507363 ) ) ( not ( = ?auto_507360 ?auto_507364 ) ) ( not ( = ?auto_507360 ?auto_507365 ) ) ( not ( = ?auto_507360 ?auto_507366 ) ) ( not ( = ?auto_507360 ?auto_507367 ) ) ( not ( = ?auto_507360 ?auto_507368 ) ) ( not ( = ?auto_507360 ?auto_507369 ) ) ( not ( = ?auto_507360 ?auto_507370 ) ) ( not ( = ?auto_507360 ?auto_507371 ) ) ( not ( = ?auto_507360 ?auto_507372 ) ) ( not ( = ?auto_507360 ?auto_507373 ) ) ( not ( = ?auto_507360 ?auto_507374 ) ) ( not ( = ?auto_507361 ?auto_507362 ) ) ( not ( = ?auto_507361 ?auto_507363 ) ) ( not ( = ?auto_507361 ?auto_507364 ) ) ( not ( = ?auto_507361 ?auto_507365 ) ) ( not ( = ?auto_507361 ?auto_507366 ) ) ( not ( = ?auto_507361 ?auto_507367 ) ) ( not ( = ?auto_507361 ?auto_507368 ) ) ( not ( = ?auto_507361 ?auto_507369 ) ) ( not ( = ?auto_507361 ?auto_507370 ) ) ( not ( = ?auto_507361 ?auto_507371 ) ) ( not ( = ?auto_507361 ?auto_507372 ) ) ( not ( = ?auto_507361 ?auto_507373 ) ) ( not ( = ?auto_507361 ?auto_507374 ) ) ( not ( = ?auto_507362 ?auto_507363 ) ) ( not ( = ?auto_507362 ?auto_507364 ) ) ( not ( = ?auto_507362 ?auto_507365 ) ) ( not ( = ?auto_507362 ?auto_507366 ) ) ( not ( = ?auto_507362 ?auto_507367 ) ) ( not ( = ?auto_507362 ?auto_507368 ) ) ( not ( = ?auto_507362 ?auto_507369 ) ) ( not ( = ?auto_507362 ?auto_507370 ) ) ( not ( = ?auto_507362 ?auto_507371 ) ) ( not ( = ?auto_507362 ?auto_507372 ) ) ( not ( = ?auto_507362 ?auto_507373 ) ) ( not ( = ?auto_507362 ?auto_507374 ) ) ( not ( = ?auto_507363 ?auto_507364 ) ) ( not ( = ?auto_507363 ?auto_507365 ) ) ( not ( = ?auto_507363 ?auto_507366 ) ) ( not ( = ?auto_507363 ?auto_507367 ) ) ( not ( = ?auto_507363 ?auto_507368 ) ) ( not ( = ?auto_507363 ?auto_507369 ) ) ( not ( = ?auto_507363 ?auto_507370 ) ) ( not ( = ?auto_507363 ?auto_507371 ) ) ( not ( = ?auto_507363 ?auto_507372 ) ) ( not ( = ?auto_507363 ?auto_507373 ) ) ( not ( = ?auto_507363 ?auto_507374 ) ) ( not ( = ?auto_507364 ?auto_507365 ) ) ( not ( = ?auto_507364 ?auto_507366 ) ) ( not ( = ?auto_507364 ?auto_507367 ) ) ( not ( = ?auto_507364 ?auto_507368 ) ) ( not ( = ?auto_507364 ?auto_507369 ) ) ( not ( = ?auto_507364 ?auto_507370 ) ) ( not ( = ?auto_507364 ?auto_507371 ) ) ( not ( = ?auto_507364 ?auto_507372 ) ) ( not ( = ?auto_507364 ?auto_507373 ) ) ( not ( = ?auto_507364 ?auto_507374 ) ) ( not ( = ?auto_507365 ?auto_507366 ) ) ( not ( = ?auto_507365 ?auto_507367 ) ) ( not ( = ?auto_507365 ?auto_507368 ) ) ( not ( = ?auto_507365 ?auto_507369 ) ) ( not ( = ?auto_507365 ?auto_507370 ) ) ( not ( = ?auto_507365 ?auto_507371 ) ) ( not ( = ?auto_507365 ?auto_507372 ) ) ( not ( = ?auto_507365 ?auto_507373 ) ) ( not ( = ?auto_507365 ?auto_507374 ) ) ( not ( = ?auto_507366 ?auto_507367 ) ) ( not ( = ?auto_507366 ?auto_507368 ) ) ( not ( = ?auto_507366 ?auto_507369 ) ) ( not ( = ?auto_507366 ?auto_507370 ) ) ( not ( = ?auto_507366 ?auto_507371 ) ) ( not ( = ?auto_507366 ?auto_507372 ) ) ( not ( = ?auto_507366 ?auto_507373 ) ) ( not ( = ?auto_507366 ?auto_507374 ) ) ( not ( = ?auto_507367 ?auto_507368 ) ) ( not ( = ?auto_507367 ?auto_507369 ) ) ( not ( = ?auto_507367 ?auto_507370 ) ) ( not ( = ?auto_507367 ?auto_507371 ) ) ( not ( = ?auto_507367 ?auto_507372 ) ) ( not ( = ?auto_507367 ?auto_507373 ) ) ( not ( = ?auto_507367 ?auto_507374 ) ) ( not ( = ?auto_507368 ?auto_507369 ) ) ( not ( = ?auto_507368 ?auto_507370 ) ) ( not ( = ?auto_507368 ?auto_507371 ) ) ( not ( = ?auto_507368 ?auto_507372 ) ) ( not ( = ?auto_507368 ?auto_507373 ) ) ( not ( = ?auto_507368 ?auto_507374 ) ) ( not ( = ?auto_507369 ?auto_507370 ) ) ( not ( = ?auto_507369 ?auto_507371 ) ) ( not ( = ?auto_507369 ?auto_507372 ) ) ( not ( = ?auto_507369 ?auto_507373 ) ) ( not ( = ?auto_507369 ?auto_507374 ) ) ( not ( = ?auto_507370 ?auto_507371 ) ) ( not ( = ?auto_507370 ?auto_507372 ) ) ( not ( = ?auto_507370 ?auto_507373 ) ) ( not ( = ?auto_507370 ?auto_507374 ) ) ( not ( = ?auto_507371 ?auto_507372 ) ) ( not ( = ?auto_507371 ?auto_507373 ) ) ( not ( = ?auto_507371 ?auto_507374 ) ) ( not ( = ?auto_507372 ?auto_507373 ) ) ( not ( = ?auto_507372 ?auto_507374 ) ) ( not ( = ?auto_507373 ?auto_507374 ) ) ( ON ?auto_507372 ?auto_507373 ) ( ON ?auto_507371 ?auto_507372 ) ( ON ?auto_507370 ?auto_507371 ) ( ON ?auto_507369 ?auto_507370 ) ( ON ?auto_507368 ?auto_507369 ) ( ON ?auto_507367 ?auto_507368 ) ( ON ?auto_507366 ?auto_507367 ) ( CLEAR ?auto_507364 ) ( ON ?auto_507365 ?auto_507366 ) ( CLEAR ?auto_507365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_507359 ?auto_507360 ?auto_507361 ?auto_507362 ?auto_507363 ?auto_507364 ?auto_507365 )
      ( MAKE-15PILE ?auto_507359 ?auto_507360 ?auto_507361 ?auto_507362 ?auto_507363 ?auto_507364 ?auto_507365 ?auto_507366 ?auto_507367 ?auto_507368 ?auto_507369 ?auto_507370 ?auto_507371 ?auto_507372 ?auto_507373 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507421 - BLOCK
      ?auto_507422 - BLOCK
      ?auto_507423 - BLOCK
      ?auto_507424 - BLOCK
      ?auto_507425 - BLOCK
      ?auto_507426 - BLOCK
      ?auto_507427 - BLOCK
      ?auto_507428 - BLOCK
      ?auto_507429 - BLOCK
      ?auto_507430 - BLOCK
      ?auto_507431 - BLOCK
      ?auto_507432 - BLOCK
      ?auto_507433 - BLOCK
      ?auto_507434 - BLOCK
      ?auto_507435 - BLOCK
    )
    :vars
    (
      ?auto_507436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507435 ?auto_507436 ) ( ON-TABLE ?auto_507421 ) ( ON ?auto_507422 ?auto_507421 ) ( ON ?auto_507423 ?auto_507422 ) ( ON ?auto_507424 ?auto_507423 ) ( ON ?auto_507425 ?auto_507424 ) ( not ( = ?auto_507421 ?auto_507422 ) ) ( not ( = ?auto_507421 ?auto_507423 ) ) ( not ( = ?auto_507421 ?auto_507424 ) ) ( not ( = ?auto_507421 ?auto_507425 ) ) ( not ( = ?auto_507421 ?auto_507426 ) ) ( not ( = ?auto_507421 ?auto_507427 ) ) ( not ( = ?auto_507421 ?auto_507428 ) ) ( not ( = ?auto_507421 ?auto_507429 ) ) ( not ( = ?auto_507421 ?auto_507430 ) ) ( not ( = ?auto_507421 ?auto_507431 ) ) ( not ( = ?auto_507421 ?auto_507432 ) ) ( not ( = ?auto_507421 ?auto_507433 ) ) ( not ( = ?auto_507421 ?auto_507434 ) ) ( not ( = ?auto_507421 ?auto_507435 ) ) ( not ( = ?auto_507421 ?auto_507436 ) ) ( not ( = ?auto_507422 ?auto_507423 ) ) ( not ( = ?auto_507422 ?auto_507424 ) ) ( not ( = ?auto_507422 ?auto_507425 ) ) ( not ( = ?auto_507422 ?auto_507426 ) ) ( not ( = ?auto_507422 ?auto_507427 ) ) ( not ( = ?auto_507422 ?auto_507428 ) ) ( not ( = ?auto_507422 ?auto_507429 ) ) ( not ( = ?auto_507422 ?auto_507430 ) ) ( not ( = ?auto_507422 ?auto_507431 ) ) ( not ( = ?auto_507422 ?auto_507432 ) ) ( not ( = ?auto_507422 ?auto_507433 ) ) ( not ( = ?auto_507422 ?auto_507434 ) ) ( not ( = ?auto_507422 ?auto_507435 ) ) ( not ( = ?auto_507422 ?auto_507436 ) ) ( not ( = ?auto_507423 ?auto_507424 ) ) ( not ( = ?auto_507423 ?auto_507425 ) ) ( not ( = ?auto_507423 ?auto_507426 ) ) ( not ( = ?auto_507423 ?auto_507427 ) ) ( not ( = ?auto_507423 ?auto_507428 ) ) ( not ( = ?auto_507423 ?auto_507429 ) ) ( not ( = ?auto_507423 ?auto_507430 ) ) ( not ( = ?auto_507423 ?auto_507431 ) ) ( not ( = ?auto_507423 ?auto_507432 ) ) ( not ( = ?auto_507423 ?auto_507433 ) ) ( not ( = ?auto_507423 ?auto_507434 ) ) ( not ( = ?auto_507423 ?auto_507435 ) ) ( not ( = ?auto_507423 ?auto_507436 ) ) ( not ( = ?auto_507424 ?auto_507425 ) ) ( not ( = ?auto_507424 ?auto_507426 ) ) ( not ( = ?auto_507424 ?auto_507427 ) ) ( not ( = ?auto_507424 ?auto_507428 ) ) ( not ( = ?auto_507424 ?auto_507429 ) ) ( not ( = ?auto_507424 ?auto_507430 ) ) ( not ( = ?auto_507424 ?auto_507431 ) ) ( not ( = ?auto_507424 ?auto_507432 ) ) ( not ( = ?auto_507424 ?auto_507433 ) ) ( not ( = ?auto_507424 ?auto_507434 ) ) ( not ( = ?auto_507424 ?auto_507435 ) ) ( not ( = ?auto_507424 ?auto_507436 ) ) ( not ( = ?auto_507425 ?auto_507426 ) ) ( not ( = ?auto_507425 ?auto_507427 ) ) ( not ( = ?auto_507425 ?auto_507428 ) ) ( not ( = ?auto_507425 ?auto_507429 ) ) ( not ( = ?auto_507425 ?auto_507430 ) ) ( not ( = ?auto_507425 ?auto_507431 ) ) ( not ( = ?auto_507425 ?auto_507432 ) ) ( not ( = ?auto_507425 ?auto_507433 ) ) ( not ( = ?auto_507425 ?auto_507434 ) ) ( not ( = ?auto_507425 ?auto_507435 ) ) ( not ( = ?auto_507425 ?auto_507436 ) ) ( not ( = ?auto_507426 ?auto_507427 ) ) ( not ( = ?auto_507426 ?auto_507428 ) ) ( not ( = ?auto_507426 ?auto_507429 ) ) ( not ( = ?auto_507426 ?auto_507430 ) ) ( not ( = ?auto_507426 ?auto_507431 ) ) ( not ( = ?auto_507426 ?auto_507432 ) ) ( not ( = ?auto_507426 ?auto_507433 ) ) ( not ( = ?auto_507426 ?auto_507434 ) ) ( not ( = ?auto_507426 ?auto_507435 ) ) ( not ( = ?auto_507426 ?auto_507436 ) ) ( not ( = ?auto_507427 ?auto_507428 ) ) ( not ( = ?auto_507427 ?auto_507429 ) ) ( not ( = ?auto_507427 ?auto_507430 ) ) ( not ( = ?auto_507427 ?auto_507431 ) ) ( not ( = ?auto_507427 ?auto_507432 ) ) ( not ( = ?auto_507427 ?auto_507433 ) ) ( not ( = ?auto_507427 ?auto_507434 ) ) ( not ( = ?auto_507427 ?auto_507435 ) ) ( not ( = ?auto_507427 ?auto_507436 ) ) ( not ( = ?auto_507428 ?auto_507429 ) ) ( not ( = ?auto_507428 ?auto_507430 ) ) ( not ( = ?auto_507428 ?auto_507431 ) ) ( not ( = ?auto_507428 ?auto_507432 ) ) ( not ( = ?auto_507428 ?auto_507433 ) ) ( not ( = ?auto_507428 ?auto_507434 ) ) ( not ( = ?auto_507428 ?auto_507435 ) ) ( not ( = ?auto_507428 ?auto_507436 ) ) ( not ( = ?auto_507429 ?auto_507430 ) ) ( not ( = ?auto_507429 ?auto_507431 ) ) ( not ( = ?auto_507429 ?auto_507432 ) ) ( not ( = ?auto_507429 ?auto_507433 ) ) ( not ( = ?auto_507429 ?auto_507434 ) ) ( not ( = ?auto_507429 ?auto_507435 ) ) ( not ( = ?auto_507429 ?auto_507436 ) ) ( not ( = ?auto_507430 ?auto_507431 ) ) ( not ( = ?auto_507430 ?auto_507432 ) ) ( not ( = ?auto_507430 ?auto_507433 ) ) ( not ( = ?auto_507430 ?auto_507434 ) ) ( not ( = ?auto_507430 ?auto_507435 ) ) ( not ( = ?auto_507430 ?auto_507436 ) ) ( not ( = ?auto_507431 ?auto_507432 ) ) ( not ( = ?auto_507431 ?auto_507433 ) ) ( not ( = ?auto_507431 ?auto_507434 ) ) ( not ( = ?auto_507431 ?auto_507435 ) ) ( not ( = ?auto_507431 ?auto_507436 ) ) ( not ( = ?auto_507432 ?auto_507433 ) ) ( not ( = ?auto_507432 ?auto_507434 ) ) ( not ( = ?auto_507432 ?auto_507435 ) ) ( not ( = ?auto_507432 ?auto_507436 ) ) ( not ( = ?auto_507433 ?auto_507434 ) ) ( not ( = ?auto_507433 ?auto_507435 ) ) ( not ( = ?auto_507433 ?auto_507436 ) ) ( not ( = ?auto_507434 ?auto_507435 ) ) ( not ( = ?auto_507434 ?auto_507436 ) ) ( not ( = ?auto_507435 ?auto_507436 ) ) ( ON ?auto_507434 ?auto_507435 ) ( ON ?auto_507433 ?auto_507434 ) ( ON ?auto_507432 ?auto_507433 ) ( ON ?auto_507431 ?auto_507432 ) ( ON ?auto_507430 ?auto_507431 ) ( ON ?auto_507429 ?auto_507430 ) ( ON ?auto_507428 ?auto_507429 ) ( ON ?auto_507427 ?auto_507428 ) ( CLEAR ?auto_507425 ) ( ON ?auto_507426 ?auto_507427 ) ( CLEAR ?auto_507426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_507421 ?auto_507422 ?auto_507423 ?auto_507424 ?auto_507425 ?auto_507426 )
      ( MAKE-15PILE ?auto_507421 ?auto_507422 ?auto_507423 ?auto_507424 ?auto_507425 ?auto_507426 ?auto_507427 ?auto_507428 ?auto_507429 ?auto_507430 ?auto_507431 ?auto_507432 ?auto_507433 ?auto_507434 ?auto_507435 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507483 - BLOCK
      ?auto_507484 - BLOCK
      ?auto_507485 - BLOCK
      ?auto_507486 - BLOCK
      ?auto_507487 - BLOCK
      ?auto_507488 - BLOCK
      ?auto_507489 - BLOCK
      ?auto_507490 - BLOCK
      ?auto_507491 - BLOCK
      ?auto_507492 - BLOCK
      ?auto_507493 - BLOCK
      ?auto_507494 - BLOCK
      ?auto_507495 - BLOCK
      ?auto_507496 - BLOCK
      ?auto_507497 - BLOCK
    )
    :vars
    (
      ?auto_507498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507497 ?auto_507498 ) ( ON-TABLE ?auto_507483 ) ( ON ?auto_507484 ?auto_507483 ) ( ON ?auto_507485 ?auto_507484 ) ( ON ?auto_507486 ?auto_507485 ) ( not ( = ?auto_507483 ?auto_507484 ) ) ( not ( = ?auto_507483 ?auto_507485 ) ) ( not ( = ?auto_507483 ?auto_507486 ) ) ( not ( = ?auto_507483 ?auto_507487 ) ) ( not ( = ?auto_507483 ?auto_507488 ) ) ( not ( = ?auto_507483 ?auto_507489 ) ) ( not ( = ?auto_507483 ?auto_507490 ) ) ( not ( = ?auto_507483 ?auto_507491 ) ) ( not ( = ?auto_507483 ?auto_507492 ) ) ( not ( = ?auto_507483 ?auto_507493 ) ) ( not ( = ?auto_507483 ?auto_507494 ) ) ( not ( = ?auto_507483 ?auto_507495 ) ) ( not ( = ?auto_507483 ?auto_507496 ) ) ( not ( = ?auto_507483 ?auto_507497 ) ) ( not ( = ?auto_507483 ?auto_507498 ) ) ( not ( = ?auto_507484 ?auto_507485 ) ) ( not ( = ?auto_507484 ?auto_507486 ) ) ( not ( = ?auto_507484 ?auto_507487 ) ) ( not ( = ?auto_507484 ?auto_507488 ) ) ( not ( = ?auto_507484 ?auto_507489 ) ) ( not ( = ?auto_507484 ?auto_507490 ) ) ( not ( = ?auto_507484 ?auto_507491 ) ) ( not ( = ?auto_507484 ?auto_507492 ) ) ( not ( = ?auto_507484 ?auto_507493 ) ) ( not ( = ?auto_507484 ?auto_507494 ) ) ( not ( = ?auto_507484 ?auto_507495 ) ) ( not ( = ?auto_507484 ?auto_507496 ) ) ( not ( = ?auto_507484 ?auto_507497 ) ) ( not ( = ?auto_507484 ?auto_507498 ) ) ( not ( = ?auto_507485 ?auto_507486 ) ) ( not ( = ?auto_507485 ?auto_507487 ) ) ( not ( = ?auto_507485 ?auto_507488 ) ) ( not ( = ?auto_507485 ?auto_507489 ) ) ( not ( = ?auto_507485 ?auto_507490 ) ) ( not ( = ?auto_507485 ?auto_507491 ) ) ( not ( = ?auto_507485 ?auto_507492 ) ) ( not ( = ?auto_507485 ?auto_507493 ) ) ( not ( = ?auto_507485 ?auto_507494 ) ) ( not ( = ?auto_507485 ?auto_507495 ) ) ( not ( = ?auto_507485 ?auto_507496 ) ) ( not ( = ?auto_507485 ?auto_507497 ) ) ( not ( = ?auto_507485 ?auto_507498 ) ) ( not ( = ?auto_507486 ?auto_507487 ) ) ( not ( = ?auto_507486 ?auto_507488 ) ) ( not ( = ?auto_507486 ?auto_507489 ) ) ( not ( = ?auto_507486 ?auto_507490 ) ) ( not ( = ?auto_507486 ?auto_507491 ) ) ( not ( = ?auto_507486 ?auto_507492 ) ) ( not ( = ?auto_507486 ?auto_507493 ) ) ( not ( = ?auto_507486 ?auto_507494 ) ) ( not ( = ?auto_507486 ?auto_507495 ) ) ( not ( = ?auto_507486 ?auto_507496 ) ) ( not ( = ?auto_507486 ?auto_507497 ) ) ( not ( = ?auto_507486 ?auto_507498 ) ) ( not ( = ?auto_507487 ?auto_507488 ) ) ( not ( = ?auto_507487 ?auto_507489 ) ) ( not ( = ?auto_507487 ?auto_507490 ) ) ( not ( = ?auto_507487 ?auto_507491 ) ) ( not ( = ?auto_507487 ?auto_507492 ) ) ( not ( = ?auto_507487 ?auto_507493 ) ) ( not ( = ?auto_507487 ?auto_507494 ) ) ( not ( = ?auto_507487 ?auto_507495 ) ) ( not ( = ?auto_507487 ?auto_507496 ) ) ( not ( = ?auto_507487 ?auto_507497 ) ) ( not ( = ?auto_507487 ?auto_507498 ) ) ( not ( = ?auto_507488 ?auto_507489 ) ) ( not ( = ?auto_507488 ?auto_507490 ) ) ( not ( = ?auto_507488 ?auto_507491 ) ) ( not ( = ?auto_507488 ?auto_507492 ) ) ( not ( = ?auto_507488 ?auto_507493 ) ) ( not ( = ?auto_507488 ?auto_507494 ) ) ( not ( = ?auto_507488 ?auto_507495 ) ) ( not ( = ?auto_507488 ?auto_507496 ) ) ( not ( = ?auto_507488 ?auto_507497 ) ) ( not ( = ?auto_507488 ?auto_507498 ) ) ( not ( = ?auto_507489 ?auto_507490 ) ) ( not ( = ?auto_507489 ?auto_507491 ) ) ( not ( = ?auto_507489 ?auto_507492 ) ) ( not ( = ?auto_507489 ?auto_507493 ) ) ( not ( = ?auto_507489 ?auto_507494 ) ) ( not ( = ?auto_507489 ?auto_507495 ) ) ( not ( = ?auto_507489 ?auto_507496 ) ) ( not ( = ?auto_507489 ?auto_507497 ) ) ( not ( = ?auto_507489 ?auto_507498 ) ) ( not ( = ?auto_507490 ?auto_507491 ) ) ( not ( = ?auto_507490 ?auto_507492 ) ) ( not ( = ?auto_507490 ?auto_507493 ) ) ( not ( = ?auto_507490 ?auto_507494 ) ) ( not ( = ?auto_507490 ?auto_507495 ) ) ( not ( = ?auto_507490 ?auto_507496 ) ) ( not ( = ?auto_507490 ?auto_507497 ) ) ( not ( = ?auto_507490 ?auto_507498 ) ) ( not ( = ?auto_507491 ?auto_507492 ) ) ( not ( = ?auto_507491 ?auto_507493 ) ) ( not ( = ?auto_507491 ?auto_507494 ) ) ( not ( = ?auto_507491 ?auto_507495 ) ) ( not ( = ?auto_507491 ?auto_507496 ) ) ( not ( = ?auto_507491 ?auto_507497 ) ) ( not ( = ?auto_507491 ?auto_507498 ) ) ( not ( = ?auto_507492 ?auto_507493 ) ) ( not ( = ?auto_507492 ?auto_507494 ) ) ( not ( = ?auto_507492 ?auto_507495 ) ) ( not ( = ?auto_507492 ?auto_507496 ) ) ( not ( = ?auto_507492 ?auto_507497 ) ) ( not ( = ?auto_507492 ?auto_507498 ) ) ( not ( = ?auto_507493 ?auto_507494 ) ) ( not ( = ?auto_507493 ?auto_507495 ) ) ( not ( = ?auto_507493 ?auto_507496 ) ) ( not ( = ?auto_507493 ?auto_507497 ) ) ( not ( = ?auto_507493 ?auto_507498 ) ) ( not ( = ?auto_507494 ?auto_507495 ) ) ( not ( = ?auto_507494 ?auto_507496 ) ) ( not ( = ?auto_507494 ?auto_507497 ) ) ( not ( = ?auto_507494 ?auto_507498 ) ) ( not ( = ?auto_507495 ?auto_507496 ) ) ( not ( = ?auto_507495 ?auto_507497 ) ) ( not ( = ?auto_507495 ?auto_507498 ) ) ( not ( = ?auto_507496 ?auto_507497 ) ) ( not ( = ?auto_507496 ?auto_507498 ) ) ( not ( = ?auto_507497 ?auto_507498 ) ) ( ON ?auto_507496 ?auto_507497 ) ( ON ?auto_507495 ?auto_507496 ) ( ON ?auto_507494 ?auto_507495 ) ( ON ?auto_507493 ?auto_507494 ) ( ON ?auto_507492 ?auto_507493 ) ( ON ?auto_507491 ?auto_507492 ) ( ON ?auto_507490 ?auto_507491 ) ( ON ?auto_507489 ?auto_507490 ) ( ON ?auto_507488 ?auto_507489 ) ( CLEAR ?auto_507486 ) ( ON ?auto_507487 ?auto_507488 ) ( CLEAR ?auto_507487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_507483 ?auto_507484 ?auto_507485 ?auto_507486 ?auto_507487 )
      ( MAKE-15PILE ?auto_507483 ?auto_507484 ?auto_507485 ?auto_507486 ?auto_507487 ?auto_507488 ?auto_507489 ?auto_507490 ?auto_507491 ?auto_507492 ?auto_507493 ?auto_507494 ?auto_507495 ?auto_507496 ?auto_507497 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507545 - BLOCK
      ?auto_507546 - BLOCK
      ?auto_507547 - BLOCK
      ?auto_507548 - BLOCK
      ?auto_507549 - BLOCK
      ?auto_507550 - BLOCK
      ?auto_507551 - BLOCK
      ?auto_507552 - BLOCK
      ?auto_507553 - BLOCK
      ?auto_507554 - BLOCK
      ?auto_507555 - BLOCK
      ?auto_507556 - BLOCK
      ?auto_507557 - BLOCK
      ?auto_507558 - BLOCK
      ?auto_507559 - BLOCK
    )
    :vars
    (
      ?auto_507560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507559 ?auto_507560 ) ( ON-TABLE ?auto_507545 ) ( ON ?auto_507546 ?auto_507545 ) ( ON ?auto_507547 ?auto_507546 ) ( not ( = ?auto_507545 ?auto_507546 ) ) ( not ( = ?auto_507545 ?auto_507547 ) ) ( not ( = ?auto_507545 ?auto_507548 ) ) ( not ( = ?auto_507545 ?auto_507549 ) ) ( not ( = ?auto_507545 ?auto_507550 ) ) ( not ( = ?auto_507545 ?auto_507551 ) ) ( not ( = ?auto_507545 ?auto_507552 ) ) ( not ( = ?auto_507545 ?auto_507553 ) ) ( not ( = ?auto_507545 ?auto_507554 ) ) ( not ( = ?auto_507545 ?auto_507555 ) ) ( not ( = ?auto_507545 ?auto_507556 ) ) ( not ( = ?auto_507545 ?auto_507557 ) ) ( not ( = ?auto_507545 ?auto_507558 ) ) ( not ( = ?auto_507545 ?auto_507559 ) ) ( not ( = ?auto_507545 ?auto_507560 ) ) ( not ( = ?auto_507546 ?auto_507547 ) ) ( not ( = ?auto_507546 ?auto_507548 ) ) ( not ( = ?auto_507546 ?auto_507549 ) ) ( not ( = ?auto_507546 ?auto_507550 ) ) ( not ( = ?auto_507546 ?auto_507551 ) ) ( not ( = ?auto_507546 ?auto_507552 ) ) ( not ( = ?auto_507546 ?auto_507553 ) ) ( not ( = ?auto_507546 ?auto_507554 ) ) ( not ( = ?auto_507546 ?auto_507555 ) ) ( not ( = ?auto_507546 ?auto_507556 ) ) ( not ( = ?auto_507546 ?auto_507557 ) ) ( not ( = ?auto_507546 ?auto_507558 ) ) ( not ( = ?auto_507546 ?auto_507559 ) ) ( not ( = ?auto_507546 ?auto_507560 ) ) ( not ( = ?auto_507547 ?auto_507548 ) ) ( not ( = ?auto_507547 ?auto_507549 ) ) ( not ( = ?auto_507547 ?auto_507550 ) ) ( not ( = ?auto_507547 ?auto_507551 ) ) ( not ( = ?auto_507547 ?auto_507552 ) ) ( not ( = ?auto_507547 ?auto_507553 ) ) ( not ( = ?auto_507547 ?auto_507554 ) ) ( not ( = ?auto_507547 ?auto_507555 ) ) ( not ( = ?auto_507547 ?auto_507556 ) ) ( not ( = ?auto_507547 ?auto_507557 ) ) ( not ( = ?auto_507547 ?auto_507558 ) ) ( not ( = ?auto_507547 ?auto_507559 ) ) ( not ( = ?auto_507547 ?auto_507560 ) ) ( not ( = ?auto_507548 ?auto_507549 ) ) ( not ( = ?auto_507548 ?auto_507550 ) ) ( not ( = ?auto_507548 ?auto_507551 ) ) ( not ( = ?auto_507548 ?auto_507552 ) ) ( not ( = ?auto_507548 ?auto_507553 ) ) ( not ( = ?auto_507548 ?auto_507554 ) ) ( not ( = ?auto_507548 ?auto_507555 ) ) ( not ( = ?auto_507548 ?auto_507556 ) ) ( not ( = ?auto_507548 ?auto_507557 ) ) ( not ( = ?auto_507548 ?auto_507558 ) ) ( not ( = ?auto_507548 ?auto_507559 ) ) ( not ( = ?auto_507548 ?auto_507560 ) ) ( not ( = ?auto_507549 ?auto_507550 ) ) ( not ( = ?auto_507549 ?auto_507551 ) ) ( not ( = ?auto_507549 ?auto_507552 ) ) ( not ( = ?auto_507549 ?auto_507553 ) ) ( not ( = ?auto_507549 ?auto_507554 ) ) ( not ( = ?auto_507549 ?auto_507555 ) ) ( not ( = ?auto_507549 ?auto_507556 ) ) ( not ( = ?auto_507549 ?auto_507557 ) ) ( not ( = ?auto_507549 ?auto_507558 ) ) ( not ( = ?auto_507549 ?auto_507559 ) ) ( not ( = ?auto_507549 ?auto_507560 ) ) ( not ( = ?auto_507550 ?auto_507551 ) ) ( not ( = ?auto_507550 ?auto_507552 ) ) ( not ( = ?auto_507550 ?auto_507553 ) ) ( not ( = ?auto_507550 ?auto_507554 ) ) ( not ( = ?auto_507550 ?auto_507555 ) ) ( not ( = ?auto_507550 ?auto_507556 ) ) ( not ( = ?auto_507550 ?auto_507557 ) ) ( not ( = ?auto_507550 ?auto_507558 ) ) ( not ( = ?auto_507550 ?auto_507559 ) ) ( not ( = ?auto_507550 ?auto_507560 ) ) ( not ( = ?auto_507551 ?auto_507552 ) ) ( not ( = ?auto_507551 ?auto_507553 ) ) ( not ( = ?auto_507551 ?auto_507554 ) ) ( not ( = ?auto_507551 ?auto_507555 ) ) ( not ( = ?auto_507551 ?auto_507556 ) ) ( not ( = ?auto_507551 ?auto_507557 ) ) ( not ( = ?auto_507551 ?auto_507558 ) ) ( not ( = ?auto_507551 ?auto_507559 ) ) ( not ( = ?auto_507551 ?auto_507560 ) ) ( not ( = ?auto_507552 ?auto_507553 ) ) ( not ( = ?auto_507552 ?auto_507554 ) ) ( not ( = ?auto_507552 ?auto_507555 ) ) ( not ( = ?auto_507552 ?auto_507556 ) ) ( not ( = ?auto_507552 ?auto_507557 ) ) ( not ( = ?auto_507552 ?auto_507558 ) ) ( not ( = ?auto_507552 ?auto_507559 ) ) ( not ( = ?auto_507552 ?auto_507560 ) ) ( not ( = ?auto_507553 ?auto_507554 ) ) ( not ( = ?auto_507553 ?auto_507555 ) ) ( not ( = ?auto_507553 ?auto_507556 ) ) ( not ( = ?auto_507553 ?auto_507557 ) ) ( not ( = ?auto_507553 ?auto_507558 ) ) ( not ( = ?auto_507553 ?auto_507559 ) ) ( not ( = ?auto_507553 ?auto_507560 ) ) ( not ( = ?auto_507554 ?auto_507555 ) ) ( not ( = ?auto_507554 ?auto_507556 ) ) ( not ( = ?auto_507554 ?auto_507557 ) ) ( not ( = ?auto_507554 ?auto_507558 ) ) ( not ( = ?auto_507554 ?auto_507559 ) ) ( not ( = ?auto_507554 ?auto_507560 ) ) ( not ( = ?auto_507555 ?auto_507556 ) ) ( not ( = ?auto_507555 ?auto_507557 ) ) ( not ( = ?auto_507555 ?auto_507558 ) ) ( not ( = ?auto_507555 ?auto_507559 ) ) ( not ( = ?auto_507555 ?auto_507560 ) ) ( not ( = ?auto_507556 ?auto_507557 ) ) ( not ( = ?auto_507556 ?auto_507558 ) ) ( not ( = ?auto_507556 ?auto_507559 ) ) ( not ( = ?auto_507556 ?auto_507560 ) ) ( not ( = ?auto_507557 ?auto_507558 ) ) ( not ( = ?auto_507557 ?auto_507559 ) ) ( not ( = ?auto_507557 ?auto_507560 ) ) ( not ( = ?auto_507558 ?auto_507559 ) ) ( not ( = ?auto_507558 ?auto_507560 ) ) ( not ( = ?auto_507559 ?auto_507560 ) ) ( ON ?auto_507558 ?auto_507559 ) ( ON ?auto_507557 ?auto_507558 ) ( ON ?auto_507556 ?auto_507557 ) ( ON ?auto_507555 ?auto_507556 ) ( ON ?auto_507554 ?auto_507555 ) ( ON ?auto_507553 ?auto_507554 ) ( ON ?auto_507552 ?auto_507553 ) ( ON ?auto_507551 ?auto_507552 ) ( ON ?auto_507550 ?auto_507551 ) ( ON ?auto_507549 ?auto_507550 ) ( CLEAR ?auto_507547 ) ( ON ?auto_507548 ?auto_507549 ) ( CLEAR ?auto_507548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_507545 ?auto_507546 ?auto_507547 ?auto_507548 )
      ( MAKE-15PILE ?auto_507545 ?auto_507546 ?auto_507547 ?auto_507548 ?auto_507549 ?auto_507550 ?auto_507551 ?auto_507552 ?auto_507553 ?auto_507554 ?auto_507555 ?auto_507556 ?auto_507557 ?auto_507558 ?auto_507559 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507607 - BLOCK
      ?auto_507608 - BLOCK
      ?auto_507609 - BLOCK
      ?auto_507610 - BLOCK
      ?auto_507611 - BLOCK
      ?auto_507612 - BLOCK
      ?auto_507613 - BLOCK
      ?auto_507614 - BLOCK
      ?auto_507615 - BLOCK
      ?auto_507616 - BLOCK
      ?auto_507617 - BLOCK
      ?auto_507618 - BLOCK
      ?auto_507619 - BLOCK
      ?auto_507620 - BLOCK
      ?auto_507621 - BLOCK
    )
    :vars
    (
      ?auto_507622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507621 ?auto_507622 ) ( ON-TABLE ?auto_507607 ) ( ON ?auto_507608 ?auto_507607 ) ( not ( = ?auto_507607 ?auto_507608 ) ) ( not ( = ?auto_507607 ?auto_507609 ) ) ( not ( = ?auto_507607 ?auto_507610 ) ) ( not ( = ?auto_507607 ?auto_507611 ) ) ( not ( = ?auto_507607 ?auto_507612 ) ) ( not ( = ?auto_507607 ?auto_507613 ) ) ( not ( = ?auto_507607 ?auto_507614 ) ) ( not ( = ?auto_507607 ?auto_507615 ) ) ( not ( = ?auto_507607 ?auto_507616 ) ) ( not ( = ?auto_507607 ?auto_507617 ) ) ( not ( = ?auto_507607 ?auto_507618 ) ) ( not ( = ?auto_507607 ?auto_507619 ) ) ( not ( = ?auto_507607 ?auto_507620 ) ) ( not ( = ?auto_507607 ?auto_507621 ) ) ( not ( = ?auto_507607 ?auto_507622 ) ) ( not ( = ?auto_507608 ?auto_507609 ) ) ( not ( = ?auto_507608 ?auto_507610 ) ) ( not ( = ?auto_507608 ?auto_507611 ) ) ( not ( = ?auto_507608 ?auto_507612 ) ) ( not ( = ?auto_507608 ?auto_507613 ) ) ( not ( = ?auto_507608 ?auto_507614 ) ) ( not ( = ?auto_507608 ?auto_507615 ) ) ( not ( = ?auto_507608 ?auto_507616 ) ) ( not ( = ?auto_507608 ?auto_507617 ) ) ( not ( = ?auto_507608 ?auto_507618 ) ) ( not ( = ?auto_507608 ?auto_507619 ) ) ( not ( = ?auto_507608 ?auto_507620 ) ) ( not ( = ?auto_507608 ?auto_507621 ) ) ( not ( = ?auto_507608 ?auto_507622 ) ) ( not ( = ?auto_507609 ?auto_507610 ) ) ( not ( = ?auto_507609 ?auto_507611 ) ) ( not ( = ?auto_507609 ?auto_507612 ) ) ( not ( = ?auto_507609 ?auto_507613 ) ) ( not ( = ?auto_507609 ?auto_507614 ) ) ( not ( = ?auto_507609 ?auto_507615 ) ) ( not ( = ?auto_507609 ?auto_507616 ) ) ( not ( = ?auto_507609 ?auto_507617 ) ) ( not ( = ?auto_507609 ?auto_507618 ) ) ( not ( = ?auto_507609 ?auto_507619 ) ) ( not ( = ?auto_507609 ?auto_507620 ) ) ( not ( = ?auto_507609 ?auto_507621 ) ) ( not ( = ?auto_507609 ?auto_507622 ) ) ( not ( = ?auto_507610 ?auto_507611 ) ) ( not ( = ?auto_507610 ?auto_507612 ) ) ( not ( = ?auto_507610 ?auto_507613 ) ) ( not ( = ?auto_507610 ?auto_507614 ) ) ( not ( = ?auto_507610 ?auto_507615 ) ) ( not ( = ?auto_507610 ?auto_507616 ) ) ( not ( = ?auto_507610 ?auto_507617 ) ) ( not ( = ?auto_507610 ?auto_507618 ) ) ( not ( = ?auto_507610 ?auto_507619 ) ) ( not ( = ?auto_507610 ?auto_507620 ) ) ( not ( = ?auto_507610 ?auto_507621 ) ) ( not ( = ?auto_507610 ?auto_507622 ) ) ( not ( = ?auto_507611 ?auto_507612 ) ) ( not ( = ?auto_507611 ?auto_507613 ) ) ( not ( = ?auto_507611 ?auto_507614 ) ) ( not ( = ?auto_507611 ?auto_507615 ) ) ( not ( = ?auto_507611 ?auto_507616 ) ) ( not ( = ?auto_507611 ?auto_507617 ) ) ( not ( = ?auto_507611 ?auto_507618 ) ) ( not ( = ?auto_507611 ?auto_507619 ) ) ( not ( = ?auto_507611 ?auto_507620 ) ) ( not ( = ?auto_507611 ?auto_507621 ) ) ( not ( = ?auto_507611 ?auto_507622 ) ) ( not ( = ?auto_507612 ?auto_507613 ) ) ( not ( = ?auto_507612 ?auto_507614 ) ) ( not ( = ?auto_507612 ?auto_507615 ) ) ( not ( = ?auto_507612 ?auto_507616 ) ) ( not ( = ?auto_507612 ?auto_507617 ) ) ( not ( = ?auto_507612 ?auto_507618 ) ) ( not ( = ?auto_507612 ?auto_507619 ) ) ( not ( = ?auto_507612 ?auto_507620 ) ) ( not ( = ?auto_507612 ?auto_507621 ) ) ( not ( = ?auto_507612 ?auto_507622 ) ) ( not ( = ?auto_507613 ?auto_507614 ) ) ( not ( = ?auto_507613 ?auto_507615 ) ) ( not ( = ?auto_507613 ?auto_507616 ) ) ( not ( = ?auto_507613 ?auto_507617 ) ) ( not ( = ?auto_507613 ?auto_507618 ) ) ( not ( = ?auto_507613 ?auto_507619 ) ) ( not ( = ?auto_507613 ?auto_507620 ) ) ( not ( = ?auto_507613 ?auto_507621 ) ) ( not ( = ?auto_507613 ?auto_507622 ) ) ( not ( = ?auto_507614 ?auto_507615 ) ) ( not ( = ?auto_507614 ?auto_507616 ) ) ( not ( = ?auto_507614 ?auto_507617 ) ) ( not ( = ?auto_507614 ?auto_507618 ) ) ( not ( = ?auto_507614 ?auto_507619 ) ) ( not ( = ?auto_507614 ?auto_507620 ) ) ( not ( = ?auto_507614 ?auto_507621 ) ) ( not ( = ?auto_507614 ?auto_507622 ) ) ( not ( = ?auto_507615 ?auto_507616 ) ) ( not ( = ?auto_507615 ?auto_507617 ) ) ( not ( = ?auto_507615 ?auto_507618 ) ) ( not ( = ?auto_507615 ?auto_507619 ) ) ( not ( = ?auto_507615 ?auto_507620 ) ) ( not ( = ?auto_507615 ?auto_507621 ) ) ( not ( = ?auto_507615 ?auto_507622 ) ) ( not ( = ?auto_507616 ?auto_507617 ) ) ( not ( = ?auto_507616 ?auto_507618 ) ) ( not ( = ?auto_507616 ?auto_507619 ) ) ( not ( = ?auto_507616 ?auto_507620 ) ) ( not ( = ?auto_507616 ?auto_507621 ) ) ( not ( = ?auto_507616 ?auto_507622 ) ) ( not ( = ?auto_507617 ?auto_507618 ) ) ( not ( = ?auto_507617 ?auto_507619 ) ) ( not ( = ?auto_507617 ?auto_507620 ) ) ( not ( = ?auto_507617 ?auto_507621 ) ) ( not ( = ?auto_507617 ?auto_507622 ) ) ( not ( = ?auto_507618 ?auto_507619 ) ) ( not ( = ?auto_507618 ?auto_507620 ) ) ( not ( = ?auto_507618 ?auto_507621 ) ) ( not ( = ?auto_507618 ?auto_507622 ) ) ( not ( = ?auto_507619 ?auto_507620 ) ) ( not ( = ?auto_507619 ?auto_507621 ) ) ( not ( = ?auto_507619 ?auto_507622 ) ) ( not ( = ?auto_507620 ?auto_507621 ) ) ( not ( = ?auto_507620 ?auto_507622 ) ) ( not ( = ?auto_507621 ?auto_507622 ) ) ( ON ?auto_507620 ?auto_507621 ) ( ON ?auto_507619 ?auto_507620 ) ( ON ?auto_507618 ?auto_507619 ) ( ON ?auto_507617 ?auto_507618 ) ( ON ?auto_507616 ?auto_507617 ) ( ON ?auto_507615 ?auto_507616 ) ( ON ?auto_507614 ?auto_507615 ) ( ON ?auto_507613 ?auto_507614 ) ( ON ?auto_507612 ?auto_507613 ) ( ON ?auto_507611 ?auto_507612 ) ( ON ?auto_507610 ?auto_507611 ) ( CLEAR ?auto_507608 ) ( ON ?auto_507609 ?auto_507610 ) ( CLEAR ?auto_507609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_507607 ?auto_507608 ?auto_507609 )
      ( MAKE-15PILE ?auto_507607 ?auto_507608 ?auto_507609 ?auto_507610 ?auto_507611 ?auto_507612 ?auto_507613 ?auto_507614 ?auto_507615 ?auto_507616 ?auto_507617 ?auto_507618 ?auto_507619 ?auto_507620 ?auto_507621 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507669 - BLOCK
      ?auto_507670 - BLOCK
      ?auto_507671 - BLOCK
      ?auto_507672 - BLOCK
      ?auto_507673 - BLOCK
      ?auto_507674 - BLOCK
      ?auto_507675 - BLOCK
      ?auto_507676 - BLOCK
      ?auto_507677 - BLOCK
      ?auto_507678 - BLOCK
      ?auto_507679 - BLOCK
      ?auto_507680 - BLOCK
      ?auto_507681 - BLOCK
      ?auto_507682 - BLOCK
      ?auto_507683 - BLOCK
    )
    :vars
    (
      ?auto_507684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507683 ?auto_507684 ) ( ON-TABLE ?auto_507669 ) ( not ( = ?auto_507669 ?auto_507670 ) ) ( not ( = ?auto_507669 ?auto_507671 ) ) ( not ( = ?auto_507669 ?auto_507672 ) ) ( not ( = ?auto_507669 ?auto_507673 ) ) ( not ( = ?auto_507669 ?auto_507674 ) ) ( not ( = ?auto_507669 ?auto_507675 ) ) ( not ( = ?auto_507669 ?auto_507676 ) ) ( not ( = ?auto_507669 ?auto_507677 ) ) ( not ( = ?auto_507669 ?auto_507678 ) ) ( not ( = ?auto_507669 ?auto_507679 ) ) ( not ( = ?auto_507669 ?auto_507680 ) ) ( not ( = ?auto_507669 ?auto_507681 ) ) ( not ( = ?auto_507669 ?auto_507682 ) ) ( not ( = ?auto_507669 ?auto_507683 ) ) ( not ( = ?auto_507669 ?auto_507684 ) ) ( not ( = ?auto_507670 ?auto_507671 ) ) ( not ( = ?auto_507670 ?auto_507672 ) ) ( not ( = ?auto_507670 ?auto_507673 ) ) ( not ( = ?auto_507670 ?auto_507674 ) ) ( not ( = ?auto_507670 ?auto_507675 ) ) ( not ( = ?auto_507670 ?auto_507676 ) ) ( not ( = ?auto_507670 ?auto_507677 ) ) ( not ( = ?auto_507670 ?auto_507678 ) ) ( not ( = ?auto_507670 ?auto_507679 ) ) ( not ( = ?auto_507670 ?auto_507680 ) ) ( not ( = ?auto_507670 ?auto_507681 ) ) ( not ( = ?auto_507670 ?auto_507682 ) ) ( not ( = ?auto_507670 ?auto_507683 ) ) ( not ( = ?auto_507670 ?auto_507684 ) ) ( not ( = ?auto_507671 ?auto_507672 ) ) ( not ( = ?auto_507671 ?auto_507673 ) ) ( not ( = ?auto_507671 ?auto_507674 ) ) ( not ( = ?auto_507671 ?auto_507675 ) ) ( not ( = ?auto_507671 ?auto_507676 ) ) ( not ( = ?auto_507671 ?auto_507677 ) ) ( not ( = ?auto_507671 ?auto_507678 ) ) ( not ( = ?auto_507671 ?auto_507679 ) ) ( not ( = ?auto_507671 ?auto_507680 ) ) ( not ( = ?auto_507671 ?auto_507681 ) ) ( not ( = ?auto_507671 ?auto_507682 ) ) ( not ( = ?auto_507671 ?auto_507683 ) ) ( not ( = ?auto_507671 ?auto_507684 ) ) ( not ( = ?auto_507672 ?auto_507673 ) ) ( not ( = ?auto_507672 ?auto_507674 ) ) ( not ( = ?auto_507672 ?auto_507675 ) ) ( not ( = ?auto_507672 ?auto_507676 ) ) ( not ( = ?auto_507672 ?auto_507677 ) ) ( not ( = ?auto_507672 ?auto_507678 ) ) ( not ( = ?auto_507672 ?auto_507679 ) ) ( not ( = ?auto_507672 ?auto_507680 ) ) ( not ( = ?auto_507672 ?auto_507681 ) ) ( not ( = ?auto_507672 ?auto_507682 ) ) ( not ( = ?auto_507672 ?auto_507683 ) ) ( not ( = ?auto_507672 ?auto_507684 ) ) ( not ( = ?auto_507673 ?auto_507674 ) ) ( not ( = ?auto_507673 ?auto_507675 ) ) ( not ( = ?auto_507673 ?auto_507676 ) ) ( not ( = ?auto_507673 ?auto_507677 ) ) ( not ( = ?auto_507673 ?auto_507678 ) ) ( not ( = ?auto_507673 ?auto_507679 ) ) ( not ( = ?auto_507673 ?auto_507680 ) ) ( not ( = ?auto_507673 ?auto_507681 ) ) ( not ( = ?auto_507673 ?auto_507682 ) ) ( not ( = ?auto_507673 ?auto_507683 ) ) ( not ( = ?auto_507673 ?auto_507684 ) ) ( not ( = ?auto_507674 ?auto_507675 ) ) ( not ( = ?auto_507674 ?auto_507676 ) ) ( not ( = ?auto_507674 ?auto_507677 ) ) ( not ( = ?auto_507674 ?auto_507678 ) ) ( not ( = ?auto_507674 ?auto_507679 ) ) ( not ( = ?auto_507674 ?auto_507680 ) ) ( not ( = ?auto_507674 ?auto_507681 ) ) ( not ( = ?auto_507674 ?auto_507682 ) ) ( not ( = ?auto_507674 ?auto_507683 ) ) ( not ( = ?auto_507674 ?auto_507684 ) ) ( not ( = ?auto_507675 ?auto_507676 ) ) ( not ( = ?auto_507675 ?auto_507677 ) ) ( not ( = ?auto_507675 ?auto_507678 ) ) ( not ( = ?auto_507675 ?auto_507679 ) ) ( not ( = ?auto_507675 ?auto_507680 ) ) ( not ( = ?auto_507675 ?auto_507681 ) ) ( not ( = ?auto_507675 ?auto_507682 ) ) ( not ( = ?auto_507675 ?auto_507683 ) ) ( not ( = ?auto_507675 ?auto_507684 ) ) ( not ( = ?auto_507676 ?auto_507677 ) ) ( not ( = ?auto_507676 ?auto_507678 ) ) ( not ( = ?auto_507676 ?auto_507679 ) ) ( not ( = ?auto_507676 ?auto_507680 ) ) ( not ( = ?auto_507676 ?auto_507681 ) ) ( not ( = ?auto_507676 ?auto_507682 ) ) ( not ( = ?auto_507676 ?auto_507683 ) ) ( not ( = ?auto_507676 ?auto_507684 ) ) ( not ( = ?auto_507677 ?auto_507678 ) ) ( not ( = ?auto_507677 ?auto_507679 ) ) ( not ( = ?auto_507677 ?auto_507680 ) ) ( not ( = ?auto_507677 ?auto_507681 ) ) ( not ( = ?auto_507677 ?auto_507682 ) ) ( not ( = ?auto_507677 ?auto_507683 ) ) ( not ( = ?auto_507677 ?auto_507684 ) ) ( not ( = ?auto_507678 ?auto_507679 ) ) ( not ( = ?auto_507678 ?auto_507680 ) ) ( not ( = ?auto_507678 ?auto_507681 ) ) ( not ( = ?auto_507678 ?auto_507682 ) ) ( not ( = ?auto_507678 ?auto_507683 ) ) ( not ( = ?auto_507678 ?auto_507684 ) ) ( not ( = ?auto_507679 ?auto_507680 ) ) ( not ( = ?auto_507679 ?auto_507681 ) ) ( not ( = ?auto_507679 ?auto_507682 ) ) ( not ( = ?auto_507679 ?auto_507683 ) ) ( not ( = ?auto_507679 ?auto_507684 ) ) ( not ( = ?auto_507680 ?auto_507681 ) ) ( not ( = ?auto_507680 ?auto_507682 ) ) ( not ( = ?auto_507680 ?auto_507683 ) ) ( not ( = ?auto_507680 ?auto_507684 ) ) ( not ( = ?auto_507681 ?auto_507682 ) ) ( not ( = ?auto_507681 ?auto_507683 ) ) ( not ( = ?auto_507681 ?auto_507684 ) ) ( not ( = ?auto_507682 ?auto_507683 ) ) ( not ( = ?auto_507682 ?auto_507684 ) ) ( not ( = ?auto_507683 ?auto_507684 ) ) ( ON ?auto_507682 ?auto_507683 ) ( ON ?auto_507681 ?auto_507682 ) ( ON ?auto_507680 ?auto_507681 ) ( ON ?auto_507679 ?auto_507680 ) ( ON ?auto_507678 ?auto_507679 ) ( ON ?auto_507677 ?auto_507678 ) ( ON ?auto_507676 ?auto_507677 ) ( ON ?auto_507675 ?auto_507676 ) ( ON ?auto_507674 ?auto_507675 ) ( ON ?auto_507673 ?auto_507674 ) ( ON ?auto_507672 ?auto_507673 ) ( ON ?auto_507671 ?auto_507672 ) ( CLEAR ?auto_507669 ) ( ON ?auto_507670 ?auto_507671 ) ( CLEAR ?auto_507670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_507669 ?auto_507670 )
      ( MAKE-15PILE ?auto_507669 ?auto_507670 ?auto_507671 ?auto_507672 ?auto_507673 ?auto_507674 ?auto_507675 ?auto_507676 ?auto_507677 ?auto_507678 ?auto_507679 ?auto_507680 ?auto_507681 ?auto_507682 ?auto_507683 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_507731 - BLOCK
      ?auto_507732 - BLOCK
      ?auto_507733 - BLOCK
      ?auto_507734 - BLOCK
      ?auto_507735 - BLOCK
      ?auto_507736 - BLOCK
      ?auto_507737 - BLOCK
      ?auto_507738 - BLOCK
      ?auto_507739 - BLOCK
      ?auto_507740 - BLOCK
      ?auto_507741 - BLOCK
      ?auto_507742 - BLOCK
      ?auto_507743 - BLOCK
      ?auto_507744 - BLOCK
      ?auto_507745 - BLOCK
    )
    :vars
    (
      ?auto_507746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507745 ?auto_507746 ) ( not ( = ?auto_507731 ?auto_507732 ) ) ( not ( = ?auto_507731 ?auto_507733 ) ) ( not ( = ?auto_507731 ?auto_507734 ) ) ( not ( = ?auto_507731 ?auto_507735 ) ) ( not ( = ?auto_507731 ?auto_507736 ) ) ( not ( = ?auto_507731 ?auto_507737 ) ) ( not ( = ?auto_507731 ?auto_507738 ) ) ( not ( = ?auto_507731 ?auto_507739 ) ) ( not ( = ?auto_507731 ?auto_507740 ) ) ( not ( = ?auto_507731 ?auto_507741 ) ) ( not ( = ?auto_507731 ?auto_507742 ) ) ( not ( = ?auto_507731 ?auto_507743 ) ) ( not ( = ?auto_507731 ?auto_507744 ) ) ( not ( = ?auto_507731 ?auto_507745 ) ) ( not ( = ?auto_507731 ?auto_507746 ) ) ( not ( = ?auto_507732 ?auto_507733 ) ) ( not ( = ?auto_507732 ?auto_507734 ) ) ( not ( = ?auto_507732 ?auto_507735 ) ) ( not ( = ?auto_507732 ?auto_507736 ) ) ( not ( = ?auto_507732 ?auto_507737 ) ) ( not ( = ?auto_507732 ?auto_507738 ) ) ( not ( = ?auto_507732 ?auto_507739 ) ) ( not ( = ?auto_507732 ?auto_507740 ) ) ( not ( = ?auto_507732 ?auto_507741 ) ) ( not ( = ?auto_507732 ?auto_507742 ) ) ( not ( = ?auto_507732 ?auto_507743 ) ) ( not ( = ?auto_507732 ?auto_507744 ) ) ( not ( = ?auto_507732 ?auto_507745 ) ) ( not ( = ?auto_507732 ?auto_507746 ) ) ( not ( = ?auto_507733 ?auto_507734 ) ) ( not ( = ?auto_507733 ?auto_507735 ) ) ( not ( = ?auto_507733 ?auto_507736 ) ) ( not ( = ?auto_507733 ?auto_507737 ) ) ( not ( = ?auto_507733 ?auto_507738 ) ) ( not ( = ?auto_507733 ?auto_507739 ) ) ( not ( = ?auto_507733 ?auto_507740 ) ) ( not ( = ?auto_507733 ?auto_507741 ) ) ( not ( = ?auto_507733 ?auto_507742 ) ) ( not ( = ?auto_507733 ?auto_507743 ) ) ( not ( = ?auto_507733 ?auto_507744 ) ) ( not ( = ?auto_507733 ?auto_507745 ) ) ( not ( = ?auto_507733 ?auto_507746 ) ) ( not ( = ?auto_507734 ?auto_507735 ) ) ( not ( = ?auto_507734 ?auto_507736 ) ) ( not ( = ?auto_507734 ?auto_507737 ) ) ( not ( = ?auto_507734 ?auto_507738 ) ) ( not ( = ?auto_507734 ?auto_507739 ) ) ( not ( = ?auto_507734 ?auto_507740 ) ) ( not ( = ?auto_507734 ?auto_507741 ) ) ( not ( = ?auto_507734 ?auto_507742 ) ) ( not ( = ?auto_507734 ?auto_507743 ) ) ( not ( = ?auto_507734 ?auto_507744 ) ) ( not ( = ?auto_507734 ?auto_507745 ) ) ( not ( = ?auto_507734 ?auto_507746 ) ) ( not ( = ?auto_507735 ?auto_507736 ) ) ( not ( = ?auto_507735 ?auto_507737 ) ) ( not ( = ?auto_507735 ?auto_507738 ) ) ( not ( = ?auto_507735 ?auto_507739 ) ) ( not ( = ?auto_507735 ?auto_507740 ) ) ( not ( = ?auto_507735 ?auto_507741 ) ) ( not ( = ?auto_507735 ?auto_507742 ) ) ( not ( = ?auto_507735 ?auto_507743 ) ) ( not ( = ?auto_507735 ?auto_507744 ) ) ( not ( = ?auto_507735 ?auto_507745 ) ) ( not ( = ?auto_507735 ?auto_507746 ) ) ( not ( = ?auto_507736 ?auto_507737 ) ) ( not ( = ?auto_507736 ?auto_507738 ) ) ( not ( = ?auto_507736 ?auto_507739 ) ) ( not ( = ?auto_507736 ?auto_507740 ) ) ( not ( = ?auto_507736 ?auto_507741 ) ) ( not ( = ?auto_507736 ?auto_507742 ) ) ( not ( = ?auto_507736 ?auto_507743 ) ) ( not ( = ?auto_507736 ?auto_507744 ) ) ( not ( = ?auto_507736 ?auto_507745 ) ) ( not ( = ?auto_507736 ?auto_507746 ) ) ( not ( = ?auto_507737 ?auto_507738 ) ) ( not ( = ?auto_507737 ?auto_507739 ) ) ( not ( = ?auto_507737 ?auto_507740 ) ) ( not ( = ?auto_507737 ?auto_507741 ) ) ( not ( = ?auto_507737 ?auto_507742 ) ) ( not ( = ?auto_507737 ?auto_507743 ) ) ( not ( = ?auto_507737 ?auto_507744 ) ) ( not ( = ?auto_507737 ?auto_507745 ) ) ( not ( = ?auto_507737 ?auto_507746 ) ) ( not ( = ?auto_507738 ?auto_507739 ) ) ( not ( = ?auto_507738 ?auto_507740 ) ) ( not ( = ?auto_507738 ?auto_507741 ) ) ( not ( = ?auto_507738 ?auto_507742 ) ) ( not ( = ?auto_507738 ?auto_507743 ) ) ( not ( = ?auto_507738 ?auto_507744 ) ) ( not ( = ?auto_507738 ?auto_507745 ) ) ( not ( = ?auto_507738 ?auto_507746 ) ) ( not ( = ?auto_507739 ?auto_507740 ) ) ( not ( = ?auto_507739 ?auto_507741 ) ) ( not ( = ?auto_507739 ?auto_507742 ) ) ( not ( = ?auto_507739 ?auto_507743 ) ) ( not ( = ?auto_507739 ?auto_507744 ) ) ( not ( = ?auto_507739 ?auto_507745 ) ) ( not ( = ?auto_507739 ?auto_507746 ) ) ( not ( = ?auto_507740 ?auto_507741 ) ) ( not ( = ?auto_507740 ?auto_507742 ) ) ( not ( = ?auto_507740 ?auto_507743 ) ) ( not ( = ?auto_507740 ?auto_507744 ) ) ( not ( = ?auto_507740 ?auto_507745 ) ) ( not ( = ?auto_507740 ?auto_507746 ) ) ( not ( = ?auto_507741 ?auto_507742 ) ) ( not ( = ?auto_507741 ?auto_507743 ) ) ( not ( = ?auto_507741 ?auto_507744 ) ) ( not ( = ?auto_507741 ?auto_507745 ) ) ( not ( = ?auto_507741 ?auto_507746 ) ) ( not ( = ?auto_507742 ?auto_507743 ) ) ( not ( = ?auto_507742 ?auto_507744 ) ) ( not ( = ?auto_507742 ?auto_507745 ) ) ( not ( = ?auto_507742 ?auto_507746 ) ) ( not ( = ?auto_507743 ?auto_507744 ) ) ( not ( = ?auto_507743 ?auto_507745 ) ) ( not ( = ?auto_507743 ?auto_507746 ) ) ( not ( = ?auto_507744 ?auto_507745 ) ) ( not ( = ?auto_507744 ?auto_507746 ) ) ( not ( = ?auto_507745 ?auto_507746 ) ) ( ON ?auto_507744 ?auto_507745 ) ( ON ?auto_507743 ?auto_507744 ) ( ON ?auto_507742 ?auto_507743 ) ( ON ?auto_507741 ?auto_507742 ) ( ON ?auto_507740 ?auto_507741 ) ( ON ?auto_507739 ?auto_507740 ) ( ON ?auto_507738 ?auto_507739 ) ( ON ?auto_507737 ?auto_507738 ) ( ON ?auto_507736 ?auto_507737 ) ( ON ?auto_507735 ?auto_507736 ) ( ON ?auto_507734 ?auto_507735 ) ( ON ?auto_507733 ?auto_507734 ) ( ON ?auto_507732 ?auto_507733 ) ( ON ?auto_507731 ?auto_507732 ) ( CLEAR ?auto_507731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_507731 )
      ( MAKE-15PILE ?auto_507731 ?auto_507732 ?auto_507733 ?auto_507734 ?auto_507735 ?auto_507736 ?auto_507737 ?auto_507738 ?auto_507739 ?auto_507740 ?auto_507741 ?auto_507742 ?auto_507743 ?auto_507744 ?auto_507745 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_507794 - BLOCK
      ?auto_507795 - BLOCK
      ?auto_507796 - BLOCK
      ?auto_507797 - BLOCK
      ?auto_507798 - BLOCK
      ?auto_507799 - BLOCK
      ?auto_507800 - BLOCK
      ?auto_507801 - BLOCK
      ?auto_507802 - BLOCK
      ?auto_507803 - BLOCK
      ?auto_507804 - BLOCK
      ?auto_507805 - BLOCK
      ?auto_507806 - BLOCK
      ?auto_507807 - BLOCK
      ?auto_507808 - BLOCK
      ?auto_507809 - BLOCK
    )
    :vars
    (
      ?auto_507810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_507808 ) ( ON ?auto_507809 ?auto_507810 ) ( CLEAR ?auto_507809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_507794 ) ( ON ?auto_507795 ?auto_507794 ) ( ON ?auto_507796 ?auto_507795 ) ( ON ?auto_507797 ?auto_507796 ) ( ON ?auto_507798 ?auto_507797 ) ( ON ?auto_507799 ?auto_507798 ) ( ON ?auto_507800 ?auto_507799 ) ( ON ?auto_507801 ?auto_507800 ) ( ON ?auto_507802 ?auto_507801 ) ( ON ?auto_507803 ?auto_507802 ) ( ON ?auto_507804 ?auto_507803 ) ( ON ?auto_507805 ?auto_507804 ) ( ON ?auto_507806 ?auto_507805 ) ( ON ?auto_507807 ?auto_507806 ) ( ON ?auto_507808 ?auto_507807 ) ( not ( = ?auto_507794 ?auto_507795 ) ) ( not ( = ?auto_507794 ?auto_507796 ) ) ( not ( = ?auto_507794 ?auto_507797 ) ) ( not ( = ?auto_507794 ?auto_507798 ) ) ( not ( = ?auto_507794 ?auto_507799 ) ) ( not ( = ?auto_507794 ?auto_507800 ) ) ( not ( = ?auto_507794 ?auto_507801 ) ) ( not ( = ?auto_507794 ?auto_507802 ) ) ( not ( = ?auto_507794 ?auto_507803 ) ) ( not ( = ?auto_507794 ?auto_507804 ) ) ( not ( = ?auto_507794 ?auto_507805 ) ) ( not ( = ?auto_507794 ?auto_507806 ) ) ( not ( = ?auto_507794 ?auto_507807 ) ) ( not ( = ?auto_507794 ?auto_507808 ) ) ( not ( = ?auto_507794 ?auto_507809 ) ) ( not ( = ?auto_507794 ?auto_507810 ) ) ( not ( = ?auto_507795 ?auto_507796 ) ) ( not ( = ?auto_507795 ?auto_507797 ) ) ( not ( = ?auto_507795 ?auto_507798 ) ) ( not ( = ?auto_507795 ?auto_507799 ) ) ( not ( = ?auto_507795 ?auto_507800 ) ) ( not ( = ?auto_507795 ?auto_507801 ) ) ( not ( = ?auto_507795 ?auto_507802 ) ) ( not ( = ?auto_507795 ?auto_507803 ) ) ( not ( = ?auto_507795 ?auto_507804 ) ) ( not ( = ?auto_507795 ?auto_507805 ) ) ( not ( = ?auto_507795 ?auto_507806 ) ) ( not ( = ?auto_507795 ?auto_507807 ) ) ( not ( = ?auto_507795 ?auto_507808 ) ) ( not ( = ?auto_507795 ?auto_507809 ) ) ( not ( = ?auto_507795 ?auto_507810 ) ) ( not ( = ?auto_507796 ?auto_507797 ) ) ( not ( = ?auto_507796 ?auto_507798 ) ) ( not ( = ?auto_507796 ?auto_507799 ) ) ( not ( = ?auto_507796 ?auto_507800 ) ) ( not ( = ?auto_507796 ?auto_507801 ) ) ( not ( = ?auto_507796 ?auto_507802 ) ) ( not ( = ?auto_507796 ?auto_507803 ) ) ( not ( = ?auto_507796 ?auto_507804 ) ) ( not ( = ?auto_507796 ?auto_507805 ) ) ( not ( = ?auto_507796 ?auto_507806 ) ) ( not ( = ?auto_507796 ?auto_507807 ) ) ( not ( = ?auto_507796 ?auto_507808 ) ) ( not ( = ?auto_507796 ?auto_507809 ) ) ( not ( = ?auto_507796 ?auto_507810 ) ) ( not ( = ?auto_507797 ?auto_507798 ) ) ( not ( = ?auto_507797 ?auto_507799 ) ) ( not ( = ?auto_507797 ?auto_507800 ) ) ( not ( = ?auto_507797 ?auto_507801 ) ) ( not ( = ?auto_507797 ?auto_507802 ) ) ( not ( = ?auto_507797 ?auto_507803 ) ) ( not ( = ?auto_507797 ?auto_507804 ) ) ( not ( = ?auto_507797 ?auto_507805 ) ) ( not ( = ?auto_507797 ?auto_507806 ) ) ( not ( = ?auto_507797 ?auto_507807 ) ) ( not ( = ?auto_507797 ?auto_507808 ) ) ( not ( = ?auto_507797 ?auto_507809 ) ) ( not ( = ?auto_507797 ?auto_507810 ) ) ( not ( = ?auto_507798 ?auto_507799 ) ) ( not ( = ?auto_507798 ?auto_507800 ) ) ( not ( = ?auto_507798 ?auto_507801 ) ) ( not ( = ?auto_507798 ?auto_507802 ) ) ( not ( = ?auto_507798 ?auto_507803 ) ) ( not ( = ?auto_507798 ?auto_507804 ) ) ( not ( = ?auto_507798 ?auto_507805 ) ) ( not ( = ?auto_507798 ?auto_507806 ) ) ( not ( = ?auto_507798 ?auto_507807 ) ) ( not ( = ?auto_507798 ?auto_507808 ) ) ( not ( = ?auto_507798 ?auto_507809 ) ) ( not ( = ?auto_507798 ?auto_507810 ) ) ( not ( = ?auto_507799 ?auto_507800 ) ) ( not ( = ?auto_507799 ?auto_507801 ) ) ( not ( = ?auto_507799 ?auto_507802 ) ) ( not ( = ?auto_507799 ?auto_507803 ) ) ( not ( = ?auto_507799 ?auto_507804 ) ) ( not ( = ?auto_507799 ?auto_507805 ) ) ( not ( = ?auto_507799 ?auto_507806 ) ) ( not ( = ?auto_507799 ?auto_507807 ) ) ( not ( = ?auto_507799 ?auto_507808 ) ) ( not ( = ?auto_507799 ?auto_507809 ) ) ( not ( = ?auto_507799 ?auto_507810 ) ) ( not ( = ?auto_507800 ?auto_507801 ) ) ( not ( = ?auto_507800 ?auto_507802 ) ) ( not ( = ?auto_507800 ?auto_507803 ) ) ( not ( = ?auto_507800 ?auto_507804 ) ) ( not ( = ?auto_507800 ?auto_507805 ) ) ( not ( = ?auto_507800 ?auto_507806 ) ) ( not ( = ?auto_507800 ?auto_507807 ) ) ( not ( = ?auto_507800 ?auto_507808 ) ) ( not ( = ?auto_507800 ?auto_507809 ) ) ( not ( = ?auto_507800 ?auto_507810 ) ) ( not ( = ?auto_507801 ?auto_507802 ) ) ( not ( = ?auto_507801 ?auto_507803 ) ) ( not ( = ?auto_507801 ?auto_507804 ) ) ( not ( = ?auto_507801 ?auto_507805 ) ) ( not ( = ?auto_507801 ?auto_507806 ) ) ( not ( = ?auto_507801 ?auto_507807 ) ) ( not ( = ?auto_507801 ?auto_507808 ) ) ( not ( = ?auto_507801 ?auto_507809 ) ) ( not ( = ?auto_507801 ?auto_507810 ) ) ( not ( = ?auto_507802 ?auto_507803 ) ) ( not ( = ?auto_507802 ?auto_507804 ) ) ( not ( = ?auto_507802 ?auto_507805 ) ) ( not ( = ?auto_507802 ?auto_507806 ) ) ( not ( = ?auto_507802 ?auto_507807 ) ) ( not ( = ?auto_507802 ?auto_507808 ) ) ( not ( = ?auto_507802 ?auto_507809 ) ) ( not ( = ?auto_507802 ?auto_507810 ) ) ( not ( = ?auto_507803 ?auto_507804 ) ) ( not ( = ?auto_507803 ?auto_507805 ) ) ( not ( = ?auto_507803 ?auto_507806 ) ) ( not ( = ?auto_507803 ?auto_507807 ) ) ( not ( = ?auto_507803 ?auto_507808 ) ) ( not ( = ?auto_507803 ?auto_507809 ) ) ( not ( = ?auto_507803 ?auto_507810 ) ) ( not ( = ?auto_507804 ?auto_507805 ) ) ( not ( = ?auto_507804 ?auto_507806 ) ) ( not ( = ?auto_507804 ?auto_507807 ) ) ( not ( = ?auto_507804 ?auto_507808 ) ) ( not ( = ?auto_507804 ?auto_507809 ) ) ( not ( = ?auto_507804 ?auto_507810 ) ) ( not ( = ?auto_507805 ?auto_507806 ) ) ( not ( = ?auto_507805 ?auto_507807 ) ) ( not ( = ?auto_507805 ?auto_507808 ) ) ( not ( = ?auto_507805 ?auto_507809 ) ) ( not ( = ?auto_507805 ?auto_507810 ) ) ( not ( = ?auto_507806 ?auto_507807 ) ) ( not ( = ?auto_507806 ?auto_507808 ) ) ( not ( = ?auto_507806 ?auto_507809 ) ) ( not ( = ?auto_507806 ?auto_507810 ) ) ( not ( = ?auto_507807 ?auto_507808 ) ) ( not ( = ?auto_507807 ?auto_507809 ) ) ( not ( = ?auto_507807 ?auto_507810 ) ) ( not ( = ?auto_507808 ?auto_507809 ) ) ( not ( = ?auto_507808 ?auto_507810 ) ) ( not ( = ?auto_507809 ?auto_507810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_507809 ?auto_507810 )
      ( !STACK ?auto_507809 ?auto_507808 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_507827 - BLOCK
      ?auto_507828 - BLOCK
      ?auto_507829 - BLOCK
      ?auto_507830 - BLOCK
      ?auto_507831 - BLOCK
      ?auto_507832 - BLOCK
      ?auto_507833 - BLOCK
      ?auto_507834 - BLOCK
      ?auto_507835 - BLOCK
      ?auto_507836 - BLOCK
      ?auto_507837 - BLOCK
      ?auto_507838 - BLOCK
      ?auto_507839 - BLOCK
      ?auto_507840 - BLOCK
      ?auto_507841 - BLOCK
      ?auto_507842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_507841 ) ( ON-TABLE ?auto_507842 ) ( CLEAR ?auto_507842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_507827 ) ( ON ?auto_507828 ?auto_507827 ) ( ON ?auto_507829 ?auto_507828 ) ( ON ?auto_507830 ?auto_507829 ) ( ON ?auto_507831 ?auto_507830 ) ( ON ?auto_507832 ?auto_507831 ) ( ON ?auto_507833 ?auto_507832 ) ( ON ?auto_507834 ?auto_507833 ) ( ON ?auto_507835 ?auto_507834 ) ( ON ?auto_507836 ?auto_507835 ) ( ON ?auto_507837 ?auto_507836 ) ( ON ?auto_507838 ?auto_507837 ) ( ON ?auto_507839 ?auto_507838 ) ( ON ?auto_507840 ?auto_507839 ) ( ON ?auto_507841 ?auto_507840 ) ( not ( = ?auto_507827 ?auto_507828 ) ) ( not ( = ?auto_507827 ?auto_507829 ) ) ( not ( = ?auto_507827 ?auto_507830 ) ) ( not ( = ?auto_507827 ?auto_507831 ) ) ( not ( = ?auto_507827 ?auto_507832 ) ) ( not ( = ?auto_507827 ?auto_507833 ) ) ( not ( = ?auto_507827 ?auto_507834 ) ) ( not ( = ?auto_507827 ?auto_507835 ) ) ( not ( = ?auto_507827 ?auto_507836 ) ) ( not ( = ?auto_507827 ?auto_507837 ) ) ( not ( = ?auto_507827 ?auto_507838 ) ) ( not ( = ?auto_507827 ?auto_507839 ) ) ( not ( = ?auto_507827 ?auto_507840 ) ) ( not ( = ?auto_507827 ?auto_507841 ) ) ( not ( = ?auto_507827 ?auto_507842 ) ) ( not ( = ?auto_507828 ?auto_507829 ) ) ( not ( = ?auto_507828 ?auto_507830 ) ) ( not ( = ?auto_507828 ?auto_507831 ) ) ( not ( = ?auto_507828 ?auto_507832 ) ) ( not ( = ?auto_507828 ?auto_507833 ) ) ( not ( = ?auto_507828 ?auto_507834 ) ) ( not ( = ?auto_507828 ?auto_507835 ) ) ( not ( = ?auto_507828 ?auto_507836 ) ) ( not ( = ?auto_507828 ?auto_507837 ) ) ( not ( = ?auto_507828 ?auto_507838 ) ) ( not ( = ?auto_507828 ?auto_507839 ) ) ( not ( = ?auto_507828 ?auto_507840 ) ) ( not ( = ?auto_507828 ?auto_507841 ) ) ( not ( = ?auto_507828 ?auto_507842 ) ) ( not ( = ?auto_507829 ?auto_507830 ) ) ( not ( = ?auto_507829 ?auto_507831 ) ) ( not ( = ?auto_507829 ?auto_507832 ) ) ( not ( = ?auto_507829 ?auto_507833 ) ) ( not ( = ?auto_507829 ?auto_507834 ) ) ( not ( = ?auto_507829 ?auto_507835 ) ) ( not ( = ?auto_507829 ?auto_507836 ) ) ( not ( = ?auto_507829 ?auto_507837 ) ) ( not ( = ?auto_507829 ?auto_507838 ) ) ( not ( = ?auto_507829 ?auto_507839 ) ) ( not ( = ?auto_507829 ?auto_507840 ) ) ( not ( = ?auto_507829 ?auto_507841 ) ) ( not ( = ?auto_507829 ?auto_507842 ) ) ( not ( = ?auto_507830 ?auto_507831 ) ) ( not ( = ?auto_507830 ?auto_507832 ) ) ( not ( = ?auto_507830 ?auto_507833 ) ) ( not ( = ?auto_507830 ?auto_507834 ) ) ( not ( = ?auto_507830 ?auto_507835 ) ) ( not ( = ?auto_507830 ?auto_507836 ) ) ( not ( = ?auto_507830 ?auto_507837 ) ) ( not ( = ?auto_507830 ?auto_507838 ) ) ( not ( = ?auto_507830 ?auto_507839 ) ) ( not ( = ?auto_507830 ?auto_507840 ) ) ( not ( = ?auto_507830 ?auto_507841 ) ) ( not ( = ?auto_507830 ?auto_507842 ) ) ( not ( = ?auto_507831 ?auto_507832 ) ) ( not ( = ?auto_507831 ?auto_507833 ) ) ( not ( = ?auto_507831 ?auto_507834 ) ) ( not ( = ?auto_507831 ?auto_507835 ) ) ( not ( = ?auto_507831 ?auto_507836 ) ) ( not ( = ?auto_507831 ?auto_507837 ) ) ( not ( = ?auto_507831 ?auto_507838 ) ) ( not ( = ?auto_507831 ?auto_507839 ) ) ( not ( = ?auto_507831 ?auto_507840 ) ) ( not ( = ?auto_507831 ?auto_507841 ) ) ( not ( = ?auto_507831 ?auto_507842 ) ) ( not ( = ?auto_507832 ?auto_507833 ) ) ( not ( = ?auto_507832 ?auto_507834 ) ) ( not ( = ?auto_507832 ?auto_507835 ) ) ( not ( = ?auto_507832 ?auto_507836 ) ) ( not ( = ?auto_507832 ?auto_507837 ) ) ( not ( = ?auto_507832 ?auto_507838 ) ) ( not ( = ?auto_507832 ?auto_507839 ) ) ( not ( = ?auto_507832 ?auto_507840 ) ) ( not ( = ?auto_507832 ?auto_507841 ) ) ( not ( = ?auto_507832 ?auto_507842 ) ) ( not ( = ?auto_507833 ?auto_507834 ) ) ( not ( = ?auto_507833 ?auto_507835 ) ) ( not ( = ?auto_507833 ?auto_507836 ) ) ( not ( = ?auto_507833 ?auto_507837 ) ) ( not ( = ?auto_507833 ?auto_507838 ) ) ( not ( = ?auto_507833 ?auto_507839 ) ) ( not ( = ?auto_507833 ?auto_507840 ) ) ( not ( = ?auto_507833 ?auto_507841 ) ) ( not ( = ?auto_507833 ?auto_507842 ) ) ( not ( = ?auto_507834 ?auto_507835 ) ) ( not ( = ?auto_507834 ?auto_507836 ) ) ( not ( = ?auto_507834 ?auto_507837 ) ) ( not ( = ?auto_507834 ?auto_507838 ) ) ( not ( = ?auto_507834 ?auto_507839 ) ) ( not ( = ?auto_507834 ?auto_507840 ) ) ( not ( = ?auto_507834 ?auto_507841 ) ) ( not ( = ?auto_507834 ?auto_507842 ) ) ( not ( = ?auto_507835 ?auto_507836 ) ) ( not ( = ?auto_507835 ?auto_507837 ) ) ( not ( = ?auto_507835 ?auto_507838 ) ) ( not ( = ?auto_507835 ?auto_507839 ) ) ( not ( = ?auto_507835 ?auto_507840 ) ) ( not ( = ?auto_507835 ?auto_507841 ) ) ( not ( = ?auto_507835 ?auto_507842 ) ) ( not ( = ?auto_507836 ?auto_507837 ) ) ( not ( = ?auto_507836 ?auto_507838 ) ) ( not ( = ?auto_507836 ?auto_507839 ) ) ( not ( = ?auto_507836 ?auto_507840 ) ) ( not ( = ?auto_507836 ?auto_507841 ) ) ( not ( = ?auto_507836 ?auto_507842 ) ) ( not ( = ?auto_507837 ?auto_507838 ) ) ( not ( = ?auto_507837 ?auto_507839 ) ) ( not ( = ?auto_507837 ?auto_507840 ) ) ( not ( = ?auto_507837 ?auto_507841 ) ) ( not ( = ?auto_507837 ?auto_507842 ) ) ( not ( = ?auto_507838 ?auto_507839 ) ) ( not ( = ?auto_507838 ?auto_507840 ) ) ( not ( = ?auto_507838 ?auto_507841 ) ) ( not ( = ?auto_507838 ?auto_507842 ) ) ( not ( = ?auto_507839 ?auto_507840 ) ) ( not ( = ?auto_507839 ?auto_507841 ) ) ( not ( = ?auto_507839 ?auto_507842 ) ) ( not ( = ?auto_507840 ?auto_507841 ) ) ( not ( = ?auto_507840 ?auto_507842 ) ) ( not ( = ?auto_507841 ?auto_507842 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_507842 )
      ( !STACK ?auto_507842 ?auto_507841 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_507859 - BLOCK
      ?auto_507860 - BLOCK
      ?auto_507861 - BLOCK
      ?auto_507862 - BLOCK
      ?auto_507863 - BLOCK
      ?auto_507864 - BLOCK
      ?auto_507865 - BLOCK
      ?auto_507866 - BLOCK
      ?auto_507867 - BLOCK
      ?auto_507868 - BLOCK
      ?auto_507869 - BLOCK
      ?auto_507870 - BLOCK
      ?auto_507871 - BLOCK
      ?auto_507872 - BLOCK
      ?auto_507873 - BLOCK
      ?auto_507874 - BLOCK
    )
    :vars
    (
      ?auto_507875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507874 ?auto_507875 ) ( ON-TABLE ?auto_507859 ) ( ON ?auto_507860 ?auto_507859 ) ( ON ?auto_507861 ?auto_507860 ) ( ON ?auto_507862 ?auto_507861 ) ( ON ?auto_507863 ?auto_507862 ) ( ON ?auto_507864 ?auto_507863 ) ( ON ?auto_507865 ?auto_507864 ) ( ON ?auto_507866 ?auto_507865 ) ( ON ?auto_507867 ?auto_507866 ) ( ON ?auto_507868 ?auto_507867 ) ( ON ?auto_507869 ?auto_507868 ) ( ON ?auto_507870 ?auto_507869 ) ( ON ?auto_507871 ?auto_507870 ) ( ON ?auto_507872 ?auto_507871 ) ( not ( = ?auto_507859 ?auto_507860 ) ) ( not ( = ?auto_507859 ?auto_507861 ) ) ( not ( = ?auto_507859 ?auto_507862 ) ) ( not ( = ?auto_507859 ?auto_507863 ) ) ( not ( = ?auto_507859 ?auto_507864 ) ) ( not ( = ?auto_507859 ?auto_507865 ) ) ( not ( = ?auto_507859 ?auto_507866 ) ) ( not ( = ?auto_507859 ?auto_507867 ) ) ( not ( = ?auto_507859 ?auto_507868 ) ) ( not ( = ?auto_507859 ?auto_507869 ) ) ( not ( = ?auto_507859 ?auto_507870 ) ) ( not ( = ?auto_507859 ?auto_507871 ) ) ( not ( = ?auto_507859 ?auto_507872 ) ) ( not ( = ?auto_507859 ?auto_507873 ) ) ( not ( = ?auto_507859 ?auto_507874 ) ) ( not ( = ?auto_507859 ?auto_507875 ) ) ( not ( = ?auto_507860 ?auto_507861 ) ) ( not ( = ?auto_507860 ?auto_507862 ) ) ( not ( = ?auto_507860 ?auto_507863 ) ) ( not ( = ?auto_507860 ?auto_507864 ) ) ( not ( = ?auto_507860 ?auto_507865 ) ) ( not ( = ?auto_507860 ?auto_507866 ) ) ( not ( = ?auto_507860 ?auto_507867 ) ) ( not ( = ?auto_507860 ?auto_507868 ) ) ( not ( = ?auto_507860 ?auto_507869 ) ) ( not ( = ?auto_507860 ?auto_507870 ) ) ( not ( = ?auto_507860 ?auto_507871 ) ) ( not ( = ?auto_507860 ?auto_507872 ) ) ( not ( = ?auto_507860 ?auto_507873 ) ) ( not ( = ?auto_507860 ?auto_507874 ) ) ( not ( = ?auto_507860 ?auto_507875 ) ) ( not ( = ?auto_507861 ?auto_507862 ) ) ( not ( = ?auto_507861 ?auto_507863 ) ) ( not ( = ?auto_507861 ?auto_507864 ) ) ( not ( = ?auto_507861 ?auto_507865 ) ) ( not ( = ?auto_507861 ?auto_507866 ) ) ( not ( = ?auto_507861 ?auto_507867 ) ) ( not ( = ?auto_507861 ?auto_507868 ) ) ( not ( = ?auto_507861 ?auto_507869 ) ) ( not ( = ?auto_507861 ?auto_507870 ) ) ( not ( = ?auto_507861 ?auto_507871 ) ) ( not ( = ?auto_507861 ?auto_507872 ) ) ( not ( = ?auto_507861 ?auto_507873 ) ) ( not ( = ?auto_507861 ?auto_507874 ) ) ( not ( = ?auto_507861 ?auto_507875 ) ) ( not ( = ?auto_507862 ?auto_507863 ) ) ( not ( = ?auto_507862 ?auto_507864 ) ) ( not ( = ?auto_507862 ?auto_507865 ) ) ( not ( = ?auto_507862 ?auto_507866 ) ) ( not ( = ?auto_507862 ?auto_507867 ) ) ( not ( = ?auto_507862 ?auto_507868 ) ) ( not ( = ?auto_507862 ?auto_507869 ) ) ( not ( = ?auto_507862 ?auto_507870 ) ) ( not ( = ?auto_507862 ?auto_507871 ) ) ( not ( = ?auto_507862 ?auto_507872 ) ) ( not ( = ?auto_507862 ?auto_507873 ) ) ( not ( = ?auto_507862 ?auto_507874 ) ) ( not ( = ?auto_507862 ?auto_507875 ) ) ( not ( = ?auto_507863 ?auto_507864 ) ) ( not ( = ?auto_507863 ?auto_507865 ) ) ( not ( = ?auto_507863 ?auto_507866 ) ) ( not ( = ?auto_507863 ?auto_507867 ) ) ( not ( = ?auto_507863 ?auto_507868 ) ) ( not ( = ?auto_507863 ?auto_507869 ) ) ( not ( = ?auto_507863 ?auto_507870 ) ) ( not ( = ?auto_507863 ?auto_507871 ) ) ( not ( = ?auto_507863 ?auto_507872 ) ) ( not ( = ?auto_507863 ?auto_507873 ) ) ( not ( = ?auto_507863 ?auto_507874 ) ) ( not ( = ?auto_507863 ?auto_507875 ) ) ( not ( = ?auto_507864 ?auto_507865 ) ) ( not ( = ?auto_507864 ?auto_507866 ) ) ( not ( = ?auto_507864 ?auto_507867 ) ) ( not ( = ?auto_507864 ?auto_507868 ) ) ( not ( = ?auto_507864 ?auto_507869 ) ) ( not ( = ?auto_507864 ?auto_507870 ) ) ( not ( = ?auto_507864 ?auto_507871 ) ) ( not ( = ?auto_507864 ?auto_507872 ) ) ( not ( = ?auto_507864 ?auto_507873 ) ) ( not ( = ?auto_507864 ?auto_507874 ) ) ( not ( = ?auto_507864 ?auto_507875 ) ) ( not ( = ?auto_507865 ?auto_507866 ) ) ( not ( = ?auto_507865 ?auto_507867 ) ) ( not ( = ?auto_507865 ?auto_507868 ) ) ( not ( = ?auto_507865 ?auto_507869 ) ) ( not ( = ?auto_507865 ?auto_507870 ) ) ( not ( = ?auto_507865 ?auto_507871 ) ) ( not ( = ?auto_507865 ?auto_507872 ) ) ( not ( = ?auto_507865 ?auto_507873 ) ) ( not ( = ?auto_507865 ?auto_507874 ) ) ( not ( = ?auto_507865 ?auto_507875 ) ) ( not ( = ?auto_507866 ?auto_507867 ) ) ( not ( = ?auto_507866 ?auto_507868 ) ) ( not ( = ?auto_507866 ?auto_507869 ) ) ( not ( = ?auto_507866 ?auto_507870 ) ) ( not ( = ?auto_507866 ?auto_507871 ) ) ( not ( = ?auto_507866 ?auto_507872 ) ) ( not ( = ?auto_507866 ?auto_507873 ) ) ( not ( = ?auto_507866 ?auto_507874 ) ) ( not ( = ?auto_507866 ?auto_507875 ) ) ( not ( = ?auto_507867 ?auto_507868 ) ) ( not ( = ?auto_507867 ?auto_507869 ) ) ( not ( = ?auto_507867 ?auto_507870 ) ) ( not ( = ?auto_507867 ?auto_507871 ) ) ( not ( = ?auto_507867 ?auto_507872 ) ) ( not ( = ?auto_507867 ?auto_507873 ) ) ( not ( = ?auto_507867 ?auto_507874 ) ) ( not ( = ?auto_507867 ?auto_507875 ) ) ( not ( = ?auto_507868 ?auto_507869 ) ) ( not ( = ?auto_507868 ?auto_507870 ) ) ( not ( = ?auto_507868 ?auto_507871 ) ) ( not ( = ?auto_507868 ?auto_507872 ) ) ( not ( = ?auto_507868 ?auto_507873 ) ) ( not ( = ?auto_507868 ?auto_507874 ) ) ( not ( = ?auto_507868 ?auto_507875 ) ) ( not ( = ?auto_507869 ?auto_507870 ) ) ( not ( = ?auto_507869 ?auto_507871 ) ) ( not ( = ?auto_507869 ?auto_507872 ) ) ( not ( = ?auto_507869 ?auto_507873 ) ) ( not ( = ?auto_507869 ?auto_507874 ) ) ( not ( = ?auto_507869 ?auto_507875 ) ) ( not ( = ?auto_507870 ?auto_507871 ) ) ( not ( = ?auto_507870 ?auto_507872 ) ) ( not ( = ?auto_507870 ?auto_507873 ) ) ( not ( = ?auto_507870 ?auto_507874 ) ) ( not ( = ?auto_507870 ?auto_507875 ) ) ( not ( = ?auto_507871 ?auto_507872 ) ) ( not ( = ?auto_507871 ?auto_507873 ) ) ( not ( = ?auto_507871 ?auto_507874 ) ) ( not ( = ?auto_507871 ?auto_507875 ) ) ( not ( = ?auto_507872 ?auto_507873 ) ) ( not ( = ?auto_507872 ?auto_507874 ) ) ( not ( = ?auto_507872 ?auto_507875 ) ) ( not ( = ?auto_507873 ?auto_507874 ) ) ( not ( = ?auto_507873 ?auto_507875 ) ) ( not ( = ?auto_507874 ?auto_507875 ) ) ( CLEAR ?auto_507872 ) ( ON ?auto_507873 ?auto_507874 ) ( CLEAR ?auto_507873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_507859 ?auto_507860 ?auto_507861 ?auto_507862 ?auto_507863 ?auto_507864 ?auto_507865 ?auto_507866 ?auto_507867 ?auto_507868 ?auto_507869 ?auto_507870 ?auto_507871 ?auto_507872 ?auto_507873 )
      ( MAKE-16PILE ?auto_507859 ?auto_507860 ?auto_507861 ?auto_507862 ?auto_507863 ?auto_507864 ?auto_507865 ?auto_507866 ?auto_507867 ?auto_507868 ?auto_507869 ?auto_507870 ?auto_507871 ?auto_507872 ?auto_507873 ?auto_507874 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_507892 - BLOCK
      ?auto_507893 - BLOCK
      ?auto_507894 - BLOCK
      ?auto_507895 - BLOCK
      ?auto_507896 - BLOCK
      ?auto_507897 - BLOCK
      ?auto_507898 - BLOCK
      ?auto_507899 - BLOCK
      ?auto_507900 - BLOCK
      ?auto_507901 - BLOCK
      ?auto_507902 - BLOCK
      ?auto_507903 - BLOCK
      ?auto_507904 - BLOCK
      ?auto_507905 - BLOCK
      ?auto_507906 - BLOCK
      ?auto_507907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_507907 ) ( ON-TABLE ?auto_507892 ) ( ON ?auto_507893 ?auto_507892 ) ( ON ?auto_507894 ?auto_507893 ) ( ON ?auto_507895 ?auto_507894 ) ( ON ?auto_507896 ?auto_507895 ) ( ON ?auto_507897 ?auto_507896 ) ( ON ?auto_507898 ?auto_507897 ) ( ON ?auto_507899 ?auto_507898 ) ( ON ?auto_507900 ?auto_507899 ) ( ON ?auto_507901 ?auto_507900 ) ( ON ?auto_507902 ?auto_507901 ) ( ON ?auto_507903 ?auto_507902 ) ( ON ?auto_507904 ?auto_507903 ) ( ON ?auto_507905 ?auto_507904 ) ( not ( = ?auto_507892 ?auto_507893 ) ) ( not ( = ?auto_507892 ?auto_507894 ) ) ( not ( = ?auto_507892 ?auto_507895 ) ) ( not ( = ?auto_507892 ?auto_507896 ) ) ( not ( = ?auto_507892 ?auto_507897 ) ) ( not ( = ?auto_507892 ?auto_507898 ) ) ( not ( = ?auto_507892 ?auto_507899 ) ) ( not ( = ?auto_507892 ?auto_507900 ) ) ( not ( = ?auto_507892 ?auto_507901 ) ) ( not ( = ?auto_507892 ?auto_507902 ) ) ( not ( = ?auto_507892 ?auto_507903 ) ) ( not ( = ?auto_507892 ?auto_507904 ) ) ( not ( = ?auto_507892 ?auto_507905 ) ) ( not ( = ?auto_507892 ?auto_507906 ) ) ( not ( = ?auto_507892 ?auto_507907 ) ) ( not ( = ?auto_507893 ?auto_507894 ) ) ( not ( = ?auto_507893 ?auto_507895 ) ) ( not ( = ?auto_507893 ?auto_507896 ) ) ( not ( = ?auto_507893 ?auto_507897 ) ) ( not ( = ?auto_507893 ?auto_507898 ) ) ( not ( = ?auto_507893 ?auto_507899 ) ) ( not ( = ?auto_507893 ?auto_507900 ) ) ( not ( = ?auto_507893 ?auto_507901 ) ) ( not ( = ?auto_507893 ?auto_507902 ) ) ( not ( = ?auto_507893 ?auto_507903 ) ) ( not ( = ?auto_507893 ?auto_507904 ) ) ( not ( = ?auto_507893 ?auto_507905 ) ) ( not ( = ?auto_507893 ?auto_507906 ) ) ( not ( = ?auto_507893 ?auto_507907 ) ) ( not ( = ?auto_507894 ?auto_507895 ) ) ( not ( = ?auto_507894 ?auto_507896 ) ) ( not ( = ?auto_507894 ?auto_507897 ) ) ( not ( = ?auto_507894 ?auto_507898 ) ) ( not ( = ?auto_507894 ?auto_507899 ) ) ( not ( = ?auto_507894 ?auto_507900 ) ) ( not ( = ?auto_507894 ?auto_507901 ) ) ( not ( = ?auto_507894 ?auto_507902 ) ) ( not ( = ?auto_507894 ?auto_507903 ) ) ( not ( = ?auto_507894 ?auto_507904 ) ) ( not ( = ?auto_507894 ?auto_507905 ) ) ( not ( = ?auto_507894 ?auto_507906 ) ) ( not ( = ?auto_507894 ?auto_507907 ) ) ( not ( = ?auto_507895 ?auto_507896 ) ) ( not ( = ?auto_507895 ?auto_507897 ) ) ( not ( = ?auto_507895 ?auto_507898 ) ) ( not ( = ?auto_507895 ?auto_507899 ) ) ( not ( = ?auto_507895 ?auto_507900 ) ) ( not ( = ?auto_507895 ?auto_507901 ) ) ( not ( = ?auto_507895 ?auto_507902 ) ) ( not ( = ?auto_507895 ?auto_507903 ) ) ( not ( = ?auto_507895 ?auto_507904 ) ) ( not ( = ?auto_507895 ?auto_507905 ) ) ( not ( = ?auto_507895 ?auto_507906 ) ) ( not ( = ?auto_507895 ?auto_507907 ) ) ( not ( = ?auto_507896 ?auto_507897 ) ) ( not ( = ?auto_507896 ?auto_507898 ) ) ( not ( = ?auto_507896 ?auto_507899 ) ) ( not ( = ?auto_507896 ?auto_507900 ) ) ( not ( = ?auto_507896 ?auto_507901 ) ) ( not ( = ?auto_507896 ?auto_507902 ) ) ( not ( = ?auto_507896 ?auto_507903 ) ) ( not ( = ?auto_507896 ?auto_507904 ) ) ( not ( = ?auto_507896 ?auto_507905 ) ) ( not ( = ?auto_507896 ?auto_507906 ) ) ( not ( = ?auto_507896 ?auto_507907 ) ) ( not ( = ?auto_507897 ?auto_507898 ) ) ( not ( = ?auto_507897 ?auto_507899 ) ) ( not ( = ?auto_507897 ?auto_507900 ) ) ( not ( = ?auto_507897 ?auto_507901 ) ) ( not ( = ?auto_507897 ?auto_507902 ) ) ( not ( = ?auto_507897 ?auto_507903 ) ) ( not ( = ?auto_507897 ?auto_507904 ) ) ( not ( = ?auto_507897 ?auto_507905 ) ) ( not ( = ?auto_507897 ?auto_507906 ) ) ( not ( = ?auto_507897 ?auto_507907 ) ) ( not ( = ?auto_507898 ?auto_507899 ) ) ( not ( = ?auto_507898 ?auto_507900 ) ) ( not ( = ?auto_507898 ?auto_507901 ) ) ( not ( = ?auto_507898 ?auto_507902 ) ) ( not ( = ?auto_507898 ?auto_507903 ) ) ( not ( = ?auto_507898 ?auto_507904 ) ) ( not ( = ?auto_507898 ?auto_507905 ) ) ( not ( = ?auto_507898 ?auto_507906 ) ) ( not ( = ?auto_507898 ?auto_507907 ) ) ( not ( = ?auto_507899 ?auto_507900 ) ) ( not ( = ?auto_507899 ?auto_507901 ) ) ( not ( = ?auto_507899 ?auto_507902 ) ) ( not ( = ?auto_507899 ?auto_507903 ) ) ( not ( = ?auto_507899 ?auto_507904 ) ) ( not ( = ?auto_507899 ?auto_507905 ) ) ( not ( = ?auto_507899 ?auto_507906 ) ) ( not ( = ?auto_507899 ?auto_507907 ) ) ( not ( = ?auto_507900 ?auto_507901 ) ) ( not ( = ?auto_507900 ?auto_507902 ) ) ( not ( = ?auto_507900 ?auto_507903 ) ) ( not ( = ?auto_507900 ?auto_507904 ) ) ( not ( = ?auto_507900 ?auto_507905 ) ) ( not ( = ?auto_507900 ?auto_507906 ) ) ( not ( = ?auto_507900 ?auto_507907 ) ) ( not ( = ?auto_507901 ?auto_507902 ) ) ( not ( = ?auto_507901 ?auto_507903 ) ) ( not ( = ?auto_507901 ?auto_507904 ) ) ( not ( = ?auto_507901 ?auto_507905 ) ) ( not ( = ?auto_507901 ?auto_507906 ) ) ( not ( = ?auto_507901 ?auto_507907 ) ) ( not ( = ?auto_507902 ?auto_507903 ) ) ( not ( = ?auto_507902 ?auto_507904 ) ) ( not ( = ?auto_507902 ?auto_507905 ) ) ( not ( = ?auto_507902 ?auto_507906 ) ) ( not ( = ?auto_507902 ?auto_507907 ) ) ( not ( = ?auto_507903 ?auto_507904 ) ) ( not ( = ?auto_507903 ?auto_507905 ) ) ( not ( = ?auto_507903 ?auto_507906 ) ) ( not ( = ?auto_507903 ?auto_507907 ) ) ( not ( = ?auto_507904 ?auto_507905 ) ) ( not ( = ?auto_507904 ?auto_507906 ) ) ( not ( = ?auto_507904 ?auto_507907 ) ) ( not ( = ?auto_507905 ?auto_507906 ) ) ( not ( = ?auto_507905 ?auto_507907 ) ) ( not ( = ?auto_507906 ?auto_507907 ) ) ( CLEAR ?auto_507905 ) ( ON ?auto_507906 ?auto_507907 ) ( CLEAR ?auto_507906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_507892 ?auto_507893 ?auto_507894 ?auto_507895 ?auto_507896 ?auto_507897 ?auto_507898 ?auto_507899 ?auto_507900 ?auto_507901 ?auto_507902 ?auto_507903 ?auto_507904 ?auto_507905 ?auto_507906 )
      ( MAKE-16PILE ?auto_507892 ?auto_507893 ?auto_507894 ?auto_507895 ?auto_507896 ?auto_507897 ?auto_507898 ?auto_507899 ?auto_507900 ?auto_507901 ?auto_507902 ?auto_507903 ?auto_507904 ?auto_507905 ?auto_507906 ?auto_507907 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_507924 - BLOCK
      ?auto_507925 - BLOCK
      ?auto_507926 - BLOCK
      ?auto_507927 - BLOCK
      ?auto_507928 - BLOCK
      ?auto_507929 - BLOCK
      ?auto_507930 - BLOCK
      ?auto_507931 - BLOCK
      ?auto_507932 - BLOCK
      ?auto_507933 - BLOCK
      ?auto_507934 - BLOCK
      ?auto_507935 - BLOCK
      ?auto_507936 - BLOCK
      ?auto_507937 - BLOCK
      ?auto_507938 - BLOCK
      ?auto_507939 - BLOCK
    )
    :vars
    (
      ?auto_507940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_507939 ?auto_507940 ) ( ON-TABLE ?auto_507924 ) ( ON ?auto_507925 ?auto_507924 ) ( ON ?auto_507926 ?auto_507925 ) ( ON ?auto_507927 ?auto_507926 ) ( ON ?auto_507928 ?auto_507927 ) ( ON ?auto_507929 ?auto_507928 ) ( ON ?auto_507930 ?auto_507929 ) ( ON ?auto_507931 ?auto_507930 ) ( ON ?auto_507932 ?auto_507931 ) ( ON ?auto_507933 ?auto_507932 ) ( ON ?auto_507934 ?auto_507933 ) ( ON ?auto_507935 ?auto_507934 ) ( ON ?auto_507936 ?auto_507935 ) ( not ( = ?auto_507924 ?auto_507925 ) ) ( not ( = ?auto_507924 ?auto_507926 ) ) ( not ( = ?auto_507924 ?auto_507927 ) ) ( not ( = ?auto_507924 ?auto_507928 ) ) ( not ( = ?auto_507924 ?auto_507929 ) ) ( not ( = ?auto_507924 ?auto_507930 ) ) ( not ( = ?auto_507924 ?auto_507931 ) ) ( not ( = ?auto_507924 ?auto_507932 ) ) ( not ( = ?auto_507924 ?auto_507933 ) ) ( not ( = ?auto_507924 ?auto_507934 ) ) ( not ( = ?auto_507924 ?auto_507935 ) ) ( not ( = ?auto_507924 ?auto_507936 ) ) ( not ( = ?auto_507924 ?auto_507937 ) ) ( not ( = ?auto_507924 ?auto_507938 ) ) ( not ( = ?auto_507924 ?auto_507939 ) ) ( not ( = ?auto_507924 ?auto_507940 ) ) ( not ( = ?auto_507925 ?auto_507926 ) ) ( not ( = ?auto_507925 ?auto_507927 ) ) ( not ( = ?auto_507925 ?auto_507928 ) ) ( not ( = ?auto_507925 ?auto_507929 ) ) ( not ( = ?auto_507925 ?auto_507930 ) ) ( not ( = ?auto_507925 ?auto_507931 ) ) ( not ( = ?auto_507925 ?auto_507932 ) ) ( not ( = ?auto_507925 ?auto_507933 ) ) ( not ( = ?auto_507925 ?auto_507934 ) ) ( not ( = ?auto_507925 ?auto_507935 ) ) ( not ( = ?auto_507925 ?auto_507936 ) ) ( not ( = ?auto_507925 ?auto_507937 ) ) ( not ( = ?auto_507925 ?auto_507938 ) ) ( not ( = ?auto_507925 ?auto_507939 ) ) ( not ( = ?auto_507925 ?auto_507940 ) ) ( not ( = ?auto_507926 ?auto_507927 ) ) ( not ( = ?auto_507926 ?auto_507928 ) ) ( not ( = ?auto_507926 ?auto_507929 ) ) ( not ( = ?auto_507926 ?auto_507930 ) ) ( not ( = ?auto_507926 ?auto_507931 ) ) ( not ( = ?auto_507926 ?auto_507932 ) ) ( not ( = ?auto_507926 ?auto_507933 ) ) ( not ( = ?auto_507926 ?auto_507934 ) ) ( not ( = ?auto_507926 ?auto_507935 ) ) ( not ( = ?auto_507926 ?auto_507936 ) ) ( not ( = ?auto_507926 ?auto_507937 ) ) ( not ( = ?auto_507926 ?auto_507938 ) ) ( not ( = ?auto_507926 ?auto_507939 ) ) ( not ( = ?auto_507926 ?auto_507940 ) ) ( not ( = ?auto_507927 ?auto_507928 ) ) ( not ( = ?auto_507927 ?auto_507929 ) ) ( not ( = ?auto_507927 ?auto_507930 ) ) ( not ( = ?auto_507927 ?auto_507931 ) ) ( not ( = ?auto_507927 ?auto_507932 ) ) ( not ( = ?auto_507927 ?auto_507933 ) ) ( not ( = ?auto_507927 ?auto_507934 ) ) ( not ( = ?auto_507927 ?auto_507935 ) ) ( not ( = ?auto_507927 ?auto_507936 ) ) ( not ( = ?auto_507927 ?auto_507937 ) ) ( not ( = ?auto_507927 ?auto_507938 ) ) ( not ( = ?auto_507927 ?auto_507939 ) ) ( not ( = ?auto_507927 ?auto_507940 ) ) ( not ( = ?auto_507928 ?auto_507929 ) ) ( not ( = ?auto_507928 ?auto_507930 ) ) ( not ( = ?auto_507928 ?auto_507931 ) ) ( not ( = ?auto_507928 ?auto_507932 ) ) ( not ( = ?auto_507928 ?auto_507933 ) ) ( not ( = ?auto_507928 ?auto_507934 ) ) ( not ( = ?auto_507928 ?auto_507935 ) ) ( not ( = ?auto_507928 ?auto_507936 ) ) ( not ( = ?auto_507928 ?auto_507937 ) ) ( not ( = ?auto_507928 ?auto_507938 ) ) ( not ( = ?auto_507928 ?auto_507939 ) ) ( not ( = ?auto_507928 ?auto_507940 ) ) ( not ( = ?auto_507929 ?auto_507930 ) ) ( not ( = ?auto_507929 ?auto_507931 ) ) ( not ( = ?auto_507929 ?auto_507932 ) ) ( not ( = ?auto_507929 ?auto_507933 ) ) ( not ( = ?auto_507929 ?auto_507934 ) ) ( not ( = ?auto_507929 ?auto_507935 ) ) ( not ( = ?auto_507929 ?auto_507936 ) ) ( not ( = ?auto_507929 ?auto_507937 ) ) ( not ( = ?auto_507929 ?auto_507938 ) ) ( not ( = ?auto_507929 ?auto_507939 ) ) ( not ( = ?auto_507929 ?auto_507940 ) ) ( not ( = ?auto_507930 ?auto_507931 ) ) ( not ( = ?auto_507930 ?auto_507932 ) ) ( not ( = ?auto_507930 ?auto_507933 ) ) ( not ( = ?auto_507930 ?auto_507934 ) ) ( not ( = ?auto_507930 ?auto_507935 ) ) ( not ( = ?auto_507930 ?auto_507936 ) ) ( not ( = ?auto_507930 ?auto_507937 ) ) ( not ( = ?auto_507930 ?auto_507938 ) ) ( not ( = ?auto_507930 ?auto_507939 ) ) ( not ( = ?auto_507930 ?auto_507940 ) ) ( not ( = ?auto_507931 ?auto_507932 ) ) ( not ( = ?auto_507931 ?auto_507933 ) ) ( not ( = ?auto_507931 ?auto_507934 ) ) ( not ( = ?auto_507931 ?auto_507935 ) ) ( not ( = ?auto_507931 ?auto_507936 ) ) ( not ( = ?auto_507931 ?auto_507937 ) ) ( not ( = ?auto_507931 ?auto_507938 ) ) ( not ( = ?auto_507931 ?auto_507939 ) ) ( not ( = ?auto_507931 ?auto_507940 ) ) ( not ( = ?auto_507932 ?auto_507933 ) ) ( not ( = ?auto_507932 ?auto_507934 ) ) ( not ( = ?auto_507932 ?auto_507935 ) ) ( not ( = ?auto_507932 ?auto_507936 ) ) ( not ( = ?auto_507932 ?auto_507937 ) ) ( not ( = ?auto_507932 ?auto_507938 ) ) ( not ( = ?auto_507932 ?auto_507939 ) ) ( not ( = ?auto_507932 ?auto_507940 ) ) ( not ( = ?auto_507933 ?auto_507934 ) ) ( not ( = ?auto_507933 ?auto_507935 ) ) ( not ( = ?auto_507933 ?auto_507936 ) ) ( not ( = ?auto_507933 ?auto_507937 ) ) ( not ( = ?auto_507933 ?auto_507938 ) ) ( not ( = ?auto_507933 ?auto_507939 ) ) ( not ( = ?auto_507933 ?auto_507940 ) ) ( not ( = ?auto_507934 ?auto_507935 ) ) ( not ( = ?auto_507934 ?auto_507936 ) ) ( not ( = ?auto_507934 ?auto_507937 ) ) ( not ( = ?auto_507934 ?auto_507938 ) ) ( not ( = ?auto_507934 ?auto_507939 ) ) ( not ( = ?auto_507934 ?auto_507940 ) ) ( not ( = ?auto_507935 ?auto_507936 ) ) ( not ( = ?auto_507935 ?auto_507937 ) ) ( not ( = ?auto_507935 ?auto_507938 ) ) ( not ( = ?auto_507935 ?auto_507939 ) ) ( not ( = ?auto_507935 ?auto_507940 ) ) ( not ( = ?auto_507936 ?auto_507937 ) ) ( not ( = ?auto_507936 ?auto_507938 ) ) ( not ( = ?auto_507936 ?auto_507939 ) ) ( not ( = ?auto_507936 ?auto_507940 ) ) ( not ( = ?auto_507937 ?auto_507938 ) ) ( not ( = ?auto_507937 ?auto_507939 ) ) ( not ( = ?auto_507937 ?auto_507940 ) ) ( not ( = ?auto_507938 ?auto_507939 ) ) ( not ( = ?auto_507938 ?auto_507940 ) ) ( not ( = ?auto_507939 ?auto_507940 ) ) ( ON ?auto_507938 ?auto_507939 ) ( CLEAR ?auto_507936 ) ( ON ?auto_507937 ?auto_507938 ) ( CLEAR ?auto_507937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_507924 ?auto_507925 ?auto_507926 ?auto_507927 ?auto_507928 ?auto_507929 ?auto_507930 ?auto_507931 ?auto_507932 ?auto_507933 ?auto_507934 ?auto_507935 ?auto_507936 ?auto_507937 )
      ( MAKE-16PILE ?auto_507924 ?auto_507925 ?auto_507926 ?auto_507927 ?auto_507928 ?auto_507929 ?auto_507930 ?auto_507931 ?auto_507932 ?auto_507933 ?auto_507934 ?auto_507935 ?auto_507936 ?auto_507937 ?auto_507938 ?auto_507939 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_507957 - BLOCK
      ?auto_507958 - BLOCK
      ?auto_507959 - BLOCK
      ?auto_507960 - BLOCK
      ?auto_507961 - BLOCK
      ?auto_507962 - BLOCK
      ?auto_507963 - BLOCK
      ?auto_507964 - BLOCK
      ?auto_507965 - BLOCK
      ?auto_507966 - BLOCK
      ?auto_507967 - BLOCK
      ?auto_507968 - BLOCK
      ?auto_507969 - BLOCK
      ?auto_507970 - BLOCK
      ?auto_507971 - BLOCK
      ?auto_507972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_507972 ) ( ON-TABLE ?auto_507957 ) ( ON ?auto_507958 ?auto_507957 ) ( ON ?auto_507959 ?auto_507958 ) ( ON ?auto_507960 ?auto_507959 ) ( ON ?auto_507961 ?auto_507960 ) ( ON ?auto_507962 ?auto_507961 ) ( ON ?auto_507963 ?auto_507962 ) ( ON ?auto_507964 ?auto_507963 ) ( ON ?auto_507965 ?auto_507964 ) ( ON ?auto_507966 ?auto_507965 ) ( ON ?auto_507967 ?auto_507966 ) ( ON ?auto_507968 ?auto_507967 ) ( ON ?auto_507969 ?auto_507968 ) ( not ( = ?auto_507957 ?auto_507958 ) ) ( not ( = ?auto_507957 ?auto_507959 ) ) ( not ( = ?auto_507957 ?auto_507960 ) ) ( not ( = ?auto_507957 ?auto_507961 ) ) ( not ( = ?auto_507957 ?auto_507962 ) ) ( not ( = ?auto_507957 ?auto_507963 ) ) ( not ( = ?auto_507957 ?auto_507964 ) ) ( not ( = ?auto_507957 ?auto_507965 ) ) ( not ( = ?auto_507957 ?auto_507966 ) ) ( not ( = ?auto_507957 ?auto_507967 ) ) ( not ( = ?auto_507957 ?auto_507968 ) ) ( not ( = ?auto_507957 ?auto_507969 ) ) ( not ( = ?auto_507957 ?auto_507970 ) ) ( not ( = ?auto_507957 ?auto_507971 ) ) ( not ( = ?auto_507957 ?auto_507972 ) ) ( not ( = ?auto_507958 ?auto_507959 ) ) ( not ( = ?auto_507958 ?auto_507960 ) ) ( not ( = ?auto_507958 ?auto_507961 ) ) ( not ( = ?auto_507958 ?auto_507962 ) ) ( not ( = ?auto_507958 ?auto_507963 ) ) ( not ( = ?auto_507958 ?auto_507964 ) ) ( not ( = ?auto_507958 ?auto_507965 ) ) ( not ( = ?auto_507958 ?auto_507966 ) ) ( not ( = ?auto_507958 ?auto_507967 ) ) ( not ( = ?auto_507958 ?auto_507968 ) ) ( not ( = ?auto_507958 ?auto_507969 ) ) ( not ( = ?auto_507958 ?auto_507970 ) ) ( not ( = ?auto_507958 ?auto_507971 ) ) ( not ( = ?auto_507958 ?auto_507972 ) ) ( not ( = ?auto_507959 ?auto_507960 ) ) ( not ( = ?auto_507959 ?auto_507961 ) ) ( not ( = ?auto_507959 ?auto_507962 ) ) ( not ( = ?auto_507959 ?auto_507963 ) ) ( not ( = ?auto_507959 ?auto_507964 ) ) ( not ( = ?auto_507959 ?auto_507965 ) ) ( not ( = ?auto_507959 ?auto_507966 ) ) ( not ( = ?auto_507959 ?auto_507967 ) ) ( not ( = ?auto_507959 ?auto_507968 ) ) ( not ( = ?auto_507959 ?auto_507969 ) ) ( not ( = ?auto_507959 ?auto_507970 ) ) ( not ( = ?auto_507959 ?auto_507971 ) ) ( not ( = ?auto_507959 ?auto_507972 ) ) ( not ( = ?auto_507960 ?auto_507961 ) ) ( not ( = ?auto_507960 ?auto_507962 ) ) ( not ( = ?auto_507960 ?auto_507963 ) ) ( not ( = ?auto_507960 ?auto_507964 ) ) ( not ( = ?auto_507960 ?auto_507965 ) ) ( not ( = ?auto_507960 ?auto_507966 ) ) ( not ( = ?auto_507960 ?auto_507967 ) ) ( not ( = ?auto_507960 ?auto_507968 ) ) ( not ( = ?auto_507960 ?auto_507969 ) ) ( not ( = ?auto_507960 ?auto_507970 ) ) ( not ( = ?auto_507960 ?auto_507971 ) ) ( not ( = ?auto_507960 ?auto_507972 ) ) ( not ( = ?auto_507961 ?auto_507962 ) ) ( not ( = ?auto_507961 ?auto_507963 ) ) ( not ( = ?auto_507961 ?auto_507964 ) ) ( not ( = ?auto_507961 ?auto_507965 ) ) ( not ( = ?auto_507961 ?auto_507966 ) ) ( not ( = ?auto_507961 ?auto_507967 ) ) ( not ( = ?auto_507961 ?auto_507968 ) ) ( not ( = ?auto_507961 ?auto_507969 ) ) ( not ( = ?auto_507961 ?auto_507970 ) ) ( not ( = ?auto_507961 ?auto_507971 ) ) ( not ( = ?auto_507961 ?auto_507972 ) ) ( not ( = ?auto_507962 ?auto_507963 ) ) ( not ( = ?auto_507962 ?auto_507964 ) ) ( not ( = ?auto_507962 ?auto_507965 ) ) ( not ( = ?auto_507962 ?auto_507966 ) ) ( not ( = ?auto_507962 ?auto_507967 ) ) ( not ( = ?auto_507962 ?auto_507968 ) ) ( not ( = ?auto_507962 ?auto_507969 ) ) ( not ( = ?auto_507962 ?auto_507970 ) ) ( not ( = ?auto_507962 ?auto_507971 ) ) ( not ( = ?auto_507962 ?auto_507972 ) ) ( not ( = ?auto_507963 ?auto_507964 ) ) ( not ( = ?auto_507963 ?auto_507965 ) ) ( not ( = ?auto_507963 ?auto_507966 ) ) ( not ( = ?auto_507963 ?auto_507967 ) ) ( not ( = ?auto_507963 ?auto_507968 ) ) ( not ( = ?auto_507963 ?auto_507969 ) ) ( not ( = ?auto_507963 ?auto_507970 ) ) ( not ( = ?auto_507963 ?auto_507971 ) ) ( not ( = ?auto_507963 ?auto_507972 ) ) ( not ( = ?auto_507964 ?auto_507965 ) ) ( not ( = ?auto_507964 ?auto_507966 ) ) ( not ( = ?auto_507964 ?auto_507967 ) ) ( not ( = ?auto_507964 ?auto_507968 ) ) ( not ( = ?auto_507964 ?auto_507969 ) ) ( not ( = ?auto_507964 ?auto_507970 ) ) ( not ( = ?auto_507964 ?auto_507971 ) ) ( not ( = ?auto_507964 ?auto_507972 ) ) ( not ( = ?auto_507965 ?auto_507966 ) ) ( not ( = ?auto_507965 ?auto_507967 ) ) ( not ( = ?auto_507965 ?auto_507968 ) ) ( not ( = ?auto_507965 ?auto_507969 ) ) ( not ( = ?auto_507965 ?auto_507970 ) ) ( not ( = ?auto_507965 ?auto_507971 ) ) ( not ( = ?auto_507965 ?auto_507972 ) ) ( not ( = ?auto_507966 ?auto_507967 ) ) ( not ( = ?auto_507966 ?auto_507968 ) ) ( not ( = ?auto_507966 ?auto_507969 ) ) ( not ( = ?auto_507966 ?auto_507970 ) ) ( not ( = ?auto_507966 ?auto_507971 ) ) ( not ( = ?auto_507966 ?auto_507972 ) ) ( not ( = ?auto_507967 ?auto_507968 ) ) ( not ( = ?auto_507967 ?auto_507969 ) ) ( not ( = ?auto_507967 ?auto_507970 ) ) ( not ( = ?auto_507967 ?auto_507971 ) ) ( not ( = ?auto_507967 ?auto_507972 ) ) ( not ( = ?auto_507968 ?auto_507969 ) ) ( not ( = ?auto_507968 ?auto_507970 ) ) ( not ( = ?auto_507968 ?auto_507971 ) ) ( not ( = ?auto_507968 ?auto_507972 ) ) ( not ( = ?auto_507969 ?auto_507970 ) ) ( not ( = ?auto_507969 ?auto_507971 ) ) ( not ( = ?auto_507969 ?auto_507972 ) ) ( not ( = ?auto_507970 ?auto_507971 ) ) ( not ( = ?auto_507970 ?auto_507972 ) ) ( not ( = ?auto_507971 ?auto_507972 ) ) ( ON ?auto_507971 ?auto_507972 ) ( CLEAR ?auto_507969 ) ( ON ?auto_507970 ?auto_507971 ) ( CLEAR ?auto_507970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_507957 ?auto_507958 ?auto_507959 ?auto_507960 ?auto_507961 ?auto_507962 ?auto_507963 ?auto_507964 ?auto_507965 ?auto_507966 ?auto_507967 ?auto_507968 ?auto_507969 ?auto_507970 )
      ( MAKE-16PILE ?auto_507957 ?auto_507958 ?auto_507959 ?auto_507960 ?auto_507961 ?auto_507962 ?auto_507963 ?auto_507964 ?auto_507965 ?auto_507966 ?auto_507967 ?auto_507968 ?auto_507969 ?auto_507970 ?auto_507971 ?auto_507972 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_507989 - BLOCK
      ?auto_507990 - BLOCK
      ?auto_507991 - BLOCK
      ?auto_507992 - BLOCK
      ?auto_507993 - BLOCK
      ?auto_507994 - BLOCK
      ?auto_507995 - BLOCK
      ?auto_507996 - BLOCK
      ?auto_507997 - BLOCK
      ?auto_507998 - BLOCK
      ?auto_507999 - BLOCK
      ?auto_508000 - BLOCK
      ?auto_508001 - BLOCK
      ?auto_508002 - BLOCK
      ?auto_508003 - BLOCK
      ?auto_508004 - BLOCK
    )
    :vars
    (
      ?auto_508005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508004 ?auto_508005 ) ( ON-TABLE ?auto_507989 ) ( ON ?auto_507990 ?auto_507989 ) ( ON ?auto_507991 ?auto_507990 ) ( ON ?auto_507992 ?auto_507991 ) ( ON ?auto_507993 ?auto_507992 ) ( ON ?auto_507994 ?auto_507993 ) ( ON ?auto_507995 ?auto_507994 ) ( ON ?auto_507996 ?auto_507995 ) ( ON ?auto_507997 ?auto_507996 ) ( ON ?auto_507998 ?auto_507997 ) ( ON ?auto_507999 ?auto_507998 ) ( ON ?auto_508000 ?auto_507999 ) ( not ( = ?auto_507989 ?auto_507990 ) ) ( not ( = ?auto_507989 ?auto_507991 ) ) ( not ( = ?auto_507989 ?auto_507992 ) ) ( not ( = ?auto_507989 ?auto_507993 ) ) ( not ( = ?auto_507989 ?auto_507994 ) ) ( not ( = ?auto_507989 ?auto_507995 ) ) ( not ( = ?auto_507989 ?auto_507996 ) ) ( not ( = ?auto_507989 ?auto_507997 ) ) ( not ( = ?auto_507989 ?auto_507998 ) ) ( not ( = ?auto_507989 ?auto_507999 ) ) ( not ( = ?auto_507989 ?auto_508000 ) ) ( not ( = ?auto_507989 ?auto_508001 ) ) ( not ( = ?auto_507989 ?auto_508002 ) ) ( not ( = ?auto_507989 ?auto_508003 ) ) ( not ( = ?auto_507989 ?auto_508004 ) ) ( not ( = ?auto_507989 ?auto_508005 ) ) ( not ( = ?auto_507990 ?auto_507991 ) ) ( not ( = ?auto_507990 ?auto_507992 ) ) ( not ( = ?auto_507990 ?auto_507993 ) ) ( not ( = ?auto_507990 ?auto_507994 ) ) ( not ( = ?auto_507990 ?auto_507995 ) ) ( not ( = ?auto_507990 ?auto_507996 ) ) ( not ( = ?auto_507990 ?auto_507997 ) ) ( not ( = ?auto_507990 ?auto_507998 ) ) ( not ( = ?auto_507990 ?auto_507999 ) ) ( not ( = ?auto_507990 ?auto_508000 ) ) ( not ( = ?auto_507990 ?auto_508001 ) ) ( not ( = ?auto_507990 ?auto_508002 ) ) ( not ( = ?auto_507990 ?auto_508003 ) ) ( not ( = ?auto_507990 ?auto_508004 ) ) ( not ( = ?auto_507990 ?auto_508005 ) ) ( not ( = ?auto_507991 ?auto_507992 ) ) ( not ( = ?auto_507991 ?auto_507993 ) ) ( not ( = ?auto_507991 ?auto_507994 ) ) ( not ( = ?auto_507991 ?auto_507995 ) ) ( not ( = ?auto_507991 ?auto_507996 ) ) ( not ( = ?auto_507991 ?auto_507997 ) ) ( not ( = ?auto_507991 ?auto_507998 ) ) ( not ( = ?auto_507991 ?auto_507999 ) ) ( not ( = ?auto_507991 ?auto_508000 ) ) ( not ( = ?auto_507991 ?auto_508001 ) ) ( not ( = ?auto_507991 ?auto_508002 ) ) ( not ( = ?auto_507991 ?auto_508003 ) ) ( not ( = ?auto_507991 ?auto_508004 ) ) ( not ( = ?auto_507991 ?auto_508005 ) ) ( not ( = ?auto_507992 ?auto_507993 ) ) ( not ( = ?auto_507992 ?auto_507994 ) ) ( not ( = ?auto_507992 ?auto_507995 ) ) ( not ( = ?auto_507992 ?auto_507996 ) ) ( not ( = ?auto_507992 ?auto_507997 ) ) ( not ( = ?auto_507992 ?auto_507998 ) ) ( not ( = ?auto_507992 ?auto_507999 ) ) ( not ( = ?auto_507992 ?auto_508000 ) ) ( not ( = ?auto_507992 ?auto_508001 ) ) ( not ( = ?auto_507992 ?auto_508002 ) ) ( not ( = ?auto_507992 ?auto_508003 ) ) ( not ( = ?auto_507992 ?auto_508004 ) ) ( not ( = ?auto_507992 ?auto_508005 ) ) ( not ( = ?auto_507993 ?auto_507994 ) ) ( not ( = ?auto_507993 ?auto_507995 ) ) ( not ( = ?auto_507993 ?auto_507996 ) ) ( not ( = ?auto_507993 ?auto_507997 ) ) ( not ( = ?auto_507993 ?auto_507998 ) ) ( not ( = ?auto_507993 ?auto_507999 ) ) ( not ( = ?auto_507993 ?auto_508000 ) ) ( not ( = ?auto_507993 ?auto_508001 ) ) ( not ( = ?auto_507993 ?auto_508002 ) ) ( not ( = ?auto_507993 ?auto_508003 ) ) ( not ( = ?auto_507993 ?auto_508004 ) ) ( not ( = ?auto_507993 ?auto_508005 ) ) ( not ( = ?auto_507994 ?auto_507995 ) ) ( not ( = ?auto_507994 ?auto_507996 ) ) ( not ( = ?auto_507994 ?auto_507997 ) ) ( not ( = ?auto_507994 ?auto_507998 ) ) ( not ( = ?auto_507994 ?auto_507999 ) ) ( not ( = ?auto_507994 ?auto_508000 ) ) ( not ( = ?auto_507994 ?auto_508001 ) ) ( not ( = ?auto_507994 ?auto_508002 ) ) ( not ( = ?auto_507994 ?auto_508003 ) ) ( not ( = ?auto_507994 ?auto_508004 ) ) ( not ( = ?auto_507994 ?auto_508005 ) ) ( not ( = ?auto_507995 ?auto_507996 ) ) ( not ( = ?auto_507995 ?auto_507997 ) ) ( not ( = ?auto_507995 ?auto_507998 ) ) ( not ( = ?auto_507995 ?auto_507999 ) ) ( not ( = ?auto_507995 ?auto_508000 ) ) ( not ( = ?auto_507995 ?auto_508001 ) ) ( not ( = ?auto_507995 ?auto_508002 ) ) ( not ( = ?auto_507995 ?auto_508003 ) ) ( not ( = ?auto_507995 ?auto_508004 ) ) ( not ( = ?auto_507995 ?auto_508005 ) ) ( not ( = ?auto_507996 ?auto_507997 ) ) ( not ( = ?auto_507996 ?auto_507998 ) ) ( not ( = ?auto_507996 ?auto_507999 ) ) ( not ( = ?auto_507996 ?auto_508000 ) ) ( not ( = ?auto_507996 ?auto_508001 ) ) ( not ( = ?auto_507996 ?auto_508002 ) ) ( not ( = ?auto_507996 ?auto_508003 ) ) ( not ( = ?auto_507996 ?auto_508004 ) ) ( not ( = ?auto_507996 ?auto_508005 ) ) ( not ( = ?auto_507997 ?auto_507998 ) ) ( not ( = ?auto_507997 ?auto_507999 ) ) ( not ( = ?auto_507997 ?auto_508000 ) ) ( not ( = ?auto_507997 ?auto_508001 ) ) ( not ( = ?auto_507997 ?auto_508002 ) ) ( not ( = ?auto_507997 ?auto_508003 ) ) ( not ( = ?auto_507997 ?auto_508004 ) ) ( not ( = ?auto_507997 ?auto_508005 ) ) ( not ( = ?auto_507998 ?auto_507999 ) ) ( not ( = ?auto_507998 ?auto_508000 ) ) ( not ( = ?auto_507998 ?auto_508001 ) ) ( not ( = ?auto_507998 ?auto_508002 ) ) ( not ( = ?auto_507998 ?auto_508003 ) ) ( not ( = ?auto_507998 ?auto_508004 ) ) ( not ( = ?auto_507998 ?auto_508005 ) ) ( not ( = ?auto_507999 ?auto_508000 ) ) ( not ( = ?auto_507999 ?auto_508001 ) ) ( not ( = ?auto_507999 ?auto_508002 ) ) ( not ( = ?auto_507999 ?auto_508003 ) ) ( not ( = ?auto_507999 ?auto_508004 ) ) ( not ( = ?auto_507999 ?auto_508005 ) ) ( not ( = ?auto_508000 ?auto_508001 ) ) ( not ( = ?auto_508000 ?auto_508002 ) ) ( not ( = ?auto_508000 ?auto_508003 ) ) ( not ( = ?auto_508000 ?auto_508004 ) ) ( not ( = ?auto_508000 ?auto_508005 ) ) ( not ( = ?auto_508001 ?auto_508002 ) ) ( not ( = ?auto_508001 ?auto_508003 ) ) ( not ( = ?auto_508001 ?auto_508004 ) ) ( not ( = ?auto_508001 ?auto_508005 ) ) ( not ( = ?auto_508002 ?auto_508003 ) ) ( not ( = ?auto_508002 ?auto_508004 ) ) ( not ( = ?auto_508002 ?auto_508005 ) ) ( not ( = ?auto_508003 ?auto_508004 ) ) ( not ( = ?auto_508003 ?auto_508005 ) ) ( not ( = ?auto_508004 ?auto_508005 ) ) ( ON ?auto_508003 ?auto_508004 ) ( ON ?auto_508002 ?auto_508003 ) ( CLEAR ?auto_508000 ) ( ON ?auto_508001 ?auto_508002 ) ( CLEAR ?auto_508001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_507989 ?auto_507990 ?auto_507991 ?auto_507992 ?auto_507993 ?auto_507994 ?auto_507995 ?auto_507996 ?auto_507997 ?auto_507998 ?auto_507999 ?auto_508000 ?auto_508001 )
      ( MAKE-16PILE ?auto_507989 ?auto_507990 ?auto_507991 ?auto_507992 ?auto_507993 ?auto_507994 ?auto_507995 ?auto_507996 ?auto_507997 ?auto_507998 ?auto_507999 ?auto_508000 ?auto_508001 ?auto_508002 ?auto_508003 ?auto_508004 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508022 - BLOCK
      ?auto_508023 - BLOCK
      ?auto_508024 - BLOCK
      ?auto_508025 - BLOCK
      ?auto_508026 - BLOCK
      ?auto_508027 - BLOCK
      ?auto_508028 - BLOCK
      ?auto_508029 - BLOCK
      ?auto_508030 - BLOCK
      ?auto_508031 - BLOCK
      ?auto_508032 - BLOCK
      ?auto_508033 - BLOCK
      ?auto_508034 - BLOCK
      ?auto_508035 - BLOCK
      ?auto_508036 - BLOCK
      ?auto_508037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508037 ) ( ON-TABLE ?auto_508022 ) ( ON ?auto_508023 ?auto_508022 ) ( ON ?auto_508024 ?auto_508023 ) ( ON ?auto_508025 ?auto_508024 ) ( ON ?auto_508026 ?auto_508025 ) ( ON ?auto_508027 ?auto_508026 ) ( ON ?auto_508028 ?auto_508027 ) ( ON ?auto_508029 ?auto_508028 ) ( ON ?auto_508030 ?auto_508029 ) ( ON ?auto_508031 ?auto_508030 ) ( ON ?auto_508032 ?auto_508031 ) ( ON ?auto_508033 ?auto_508032 ) ( not ( = ?auto_508022 ?auto_508023 ) ) ( not ( = ?auto_508022 ?auto_508024 ) ) ( not ( = ?auto_508022 ?auto_508025 ) ) ( not ( = ?auto_508022 ?auto_508026 ) ) ( not ( = ?auto_508022 ?auto_508027 ) ) ( not ( = ?auto_508022 ?auto_508028 ) ) ( not ( = ?auto_508022 ?auto_508029 ) ) ( not ( = ?auto_508022 ?auto_508030 ) ) ( not ( = ?auto_508022 ?auto_508031 ) ) ( not ( = ?auto_508022 ?auto_508032 ) ) ( not ( = ?auto_508022 ?auto_508033 ) ) ( not ( = ?auto_508022 ?auto_508034 ) ) ( not ( = ?auto_508022 ?auto_508035 ) ) ( not ( = ?auto_508022 ?auto_508036 ) ) ( not ( = ?auto_508022 ?auto_508037 ) ) ( not ( = ?auto_508023 ?auto_508024 ) ) ( not ( = ?auto_508023 ?auto_508025 ) ) ( not ( = ?auto_508023 ?auto_508026 ) ) ( not ( = ?auto_508023 ?auto_508027 ) ) ( not ( = ?auto_508023 ?auto_508028 ) ) ( not ( = ?auto_508023 ?auto_508029 ) ) ( not ( = ?auto_508023 ?auto_508030 ) ) ( not ( = ?auto_508023 ?auto_508031 ) ) ( not ( = ?auto_508023 ?auto_508032 ) ) ( not ( = ?auto_508023 ?auto_508033 ) ) ( not ( = ?auto_508023 ?auto_508034 ) ) ( not ( = ?auto_508023 ?auto_508035 ) ) ( not ( = ?auto_508023 ?auto_508036 ) ) ( not ( = ?auto_508023 ?auto_508037 ) ) ( not ( = ?auto_508024 ?auto_508025 ) ) ( not ( = ?auto_508024 ?auto_508026 ) ) ( not ( = ?auto_508024 ?auto_508027 ) ) ( not ( = ?auto_508024 ?auto_508028 ) ) ( not ( = ?auto_508024 ?auto_508029 ) ) ( not ( = ?auto_508024 ?auto_508030 ) ) ( not ( = ?auto_508024 ?auto_508031 ) ) ( not ( = ?auto_508024 ?auto_508032 ) ) ( not ( = ?auto_508024 ?auto_508033 ) ) ( not ( = ?auto_508024 ?auto_508034 ) ) ( not ( = ?auto_508024 ?auto_508035 ) ) ( not ( = ?auto_508024 ?auto_508036 ) ) ( not ( = ?auto_508024 ?auto_508037 ) ) ( not ( = ?auto_508025 ?auto_508026 ) ) ( not ( = ?auto_508025 ?auto_508027 ) ) ( not ( = ?auto_508025 ?auto_508028 ) ) ( not ( = ?auto_508025 ?auto_508029 ) ) ( not ( = ?auto_508025 ?auto_508030 ) ) ( not ( = ?auto_508025 ?auto_508031 ) ) ( not ( = ?auto_508025 ?auto_508032 ) ) ( not ( = ?auto_508025 ?auto_508033 ) ) ( not ( = ?auto_508025 ?auto_508034 ) ) ( not ( = ?auto_508025 ?auto_508035 ) ) ( not ( = ?auto_508025 ?auto_508036 ) ) ( not ( = ?auto_508025 ?auto_508037 ) ) ( not ( = ?auto_508026 ?auto_508027 ) ) ( not ( = ?auto_508026 ?auto_508028 ) ) ( not ( = ?auto_508026 ?auto_508029 ) ) ( not ( = ?auto_508026 ?auto_508030 ) ) ( not ( = ?auto_508026 ?auto_508031 ) ) ( not ( = ?auto_508026 ?auto_508032 ) ) ( not ( = ?auto_508026 ?auto_508033 ) ) ( not ( = ?auto_508026 ?auto_508034 ) ) ( not ( = ?auto_508026 ?auto_508035 ) ) ( not ( = ?auto_508026 ?auto_508036 ) ) ( not ( = ?auto_508026 ?auto_508037 ) ) ( not ( = ?auto_508027 ?auto_508028 ) ) ( not ( = ?auto_508027 ?auto_508029 ) ) ( not ( = ?auto_508027 ?auto_508030 ) ) ( not ( = ?auto_508027 ?auto_508031 ) ) ( not ( = ?auto_508027 ?auto_508032 ) ) ( not ( = ?auto_508027 ?auto_508033 ) ) ( not ( = ?auto_508027 ?auto_508034 ) ) ( not ( = ?auto_508027 ?auto_508035 ) ) ( not ( = ?auto_508027 ?auto_508036 ) ) ( not ( = ?auto_508027 ?auto_508037 ) ) ( not ( = ?auto_508028 ?auto_508029 ) ) ( not ( = ?auto_508028 ?auto_508030 ) ) ( not ( = ?auto_508028 ?auto_508031 ) ) ( not ( = ?auto_508028 ?auto_508032 ) ) ( not ( = ?auto_508028 ?auto_508033 ) ) ( not ( = ?auto_508028 ?auto_508034 ) ) ( not ( = ?auto_508028 ?auto_508035 ) ) ( not ( = ?auto_508028 ?auto_508036 ) ) ( not ( = ?auto_508028 ?auto_508037 ) ) ( not ( = ?auto_508029 ?auto_508030 ) ) ( not ( = ?auto_508029 ?auto_508031 ) ) ( not ( = ?auto_508029 ?auto_508032 ) ) ( not ( = ?auto_508029 ?auto_508033 ) ) ( not ( = ?auto_508029 ?auto_508034 ) ) ( not ( = ?auto_508029 ?auto_508035 ) ) ( not ( = ?auto_508029 ?auto_508036 ) ) ( not ( = ?auto_508029 ?auto_508037 ) ) ( not ( = ?auto_508030 ?auto_508031 ) ) ( not ( = ?auto_508030 ?auto_508032 ) ) ( not ( = ?auto_508030 ?auto_508033 ) ) ( not ( = ?auto_508030 ?auto_508034 ) ) ( not ( = ?auto_508030 ?auto_508035 ) ) ( not ( = ?auto_508030 ?auto_508036 ) ) ( not ( = ?auto_508030 ?auto_508037 ) ) ( not ( = ?auto_508031 ?auto_508032 ) ) ( not ( = ?auto_508031 ?auto_508033 ) ) ( not ( = ?auto_508031 ?auto_508034 ) ) ( not ( = ?auto_508031 ?auto_508035 ) ) ( not ( = ?auto_508031 ?auto_508036 ) ) ( not ( = ?auto_508031 ?auto_508037 ) ) ( not ( = ?auto_508032 ?auto_508033 ) ) ( not ( = ?auto_508032 ?auto_508034 ) ) ( not ( = ?auto_508032 ?auto_508035 ) ) ( not ( = ?auto_508032 ?auto_508036 ) ) ( not ( = ?auto_508032 ?auto_508037 ) ) ( not ( = ?auto_508033 ?auto_508034 ) ) ( not ( = ?auto_508033 ?auto_508035 ) ) ( not ( = ?auto_508033 ?auto_508036 ) ) ( not ( = ?auto_508033 ?auto_508037 ) ) ( not ( = ?auto_508034 ?auto_508035 ) ) ( not ( = ?auto_508034 ?auto_508036 ) ) ( not ( = ?auto_508034 ?auto_508037 ) ) ( not ( = ?auto_508035 ?auto_508036 ) ) ( not ( = ?auto_508035 ?auto_508037 ) ) ( not ( = ?auto_508036 ?auto_508037 ) ) ( ON ?auto_508036 ?auto_508037 ) ( ON ?auto_508035 ?auto_508036 ) ( CLEAR ?auto_508033 ) ( ON ?auto_508034 ?auto_508035 ) ( CLEAR ?auto_508034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_508022 ?auto_508023 ?auto_508024 ?auto_508025 ?auto_508026 ?auto_508027 ?auto_508028 ?auto_508029 ?auto_508030 ?auto_508031 ?auto_508032 ?auto_508033 ?auto_508034 )
      ( MAKE-16PILE ?auto_508022 ?auto_508023 ?auto_508024 ?auto_508025 ?auto_508026 ?auto_508027 ?auto_508028 ?auto_508029 ?auto_508030 ?auto_508031 ?auto_508032 ?auto_508033 ?auto_508034 ?auto_508035 ?auto_508036 ?auto_508037 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508054 - BLOCK
      ?auto_508055 - BLOCK
      ?auto_508056 - BLOCK
      ?auto_508057 - BLOCK
      ?auto_508058 - BLOCK
      ?auto_508059 - BLOCK
      ?auto_508060 - BLOCK
      ?auto_508061 - BLOCK
      ?auto_508062 - BLOCK
      ?auto_508063 - BLOCK
      ?auto_508064 - BLOCK
      ?auto_508065 - BLOCK
      ?auto_508066 - BLOCK
      ?auto_508067 - BLOCK
      ?auto_508068 - BLOCK
      ?auto_508069 - BLOCK
    )
    :vars
    (
      ?auto_508070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508069 ?auto_508070 ) ( ON-TABLE ?auto_508054 ) ( ON ?auto_508055 ?auto_508054 ) ( ON ?auto_508056 ?auto_508055 ) ( ON ?auto_508057 ?auto_508056 ) ( ON ?auto_508058 ?auto_508057 ) ( ON ?auto_508059 ?auto_508058 ) ( ON ?auto_508060 ?auto_508059 ) ( ON ?auto_508061 ?auto_508060 ) ( ON ?auto_508062 ?auto_508061 ) ( ON ?auto_508063 ?auto_508062 ) ( ON ?auto_508064 ?auto_508063 ) ( not ( = ?auto_508054 ?auto_508055 ) ) ( not ( = ?auto_508054 ?auto_508056 ) ) ( not ( = ?auto_508054 ?auto_508057 ) ) ( not ( = ?auto_508054 ?auto_508058 ) ) ( not ( = ?auto_508054 ?auto_508059 ) ) ( not ( = ?auto_508054 ?auto_508060 ) ) ( not ( = ?auto_508054 ?auto_508061 ) ) ( not ( = ?auto_508054 ?auto_508062 ) ) ( not ( = ?auto_508054 ?auto_508063 ) ) ( not ( = ?auto_508054 ?auto_508064 ) ) ( not ( = ?auto_508054 ?auto_508065 ) ) ( not ( = ?auto_508054 ?auto_508066 ) ) ( not ( = ?auto_508054 ?auto_508067 ) ) ( not ( = ?auto_508054 ?auto_508068 ) ) ( not ( = ?auto_508054 ?auto_508069 ) ) ( not ( = ?auto_508054 ?auto_508070 ) ) ( not ( = ?auto_508055 ?auto_508056 ) ) ( not ( = ?auto_508055 ?auto_508057 ) ) ( not ( = ?auto_508055 ?auto_508058 ) ) ( not ( = ?auto_508055 ?auto_508059 ) ) ( not ( = ?auto_508055 ?auto_508060 ) ) ( not ( = ?auto_508055 ?auto_508061 ) ) ( not ( = ?auto_508055 ?auto_508062 ) ) ( not ( = ?auto_508055 ?auto_508063 ) ) ( not ( = ?auto_508055 ?auto_508064 ) ) ( not ( = ?auto_508055 ?auto_508065 ) ) ( not ( = ?auto_508055 ?auto_508066 ) ) ( not ( = ?auto_508055 ?auto_508067 ) ) ( not ( = ?auto_508055 ?auto_508068 ) ) ( not ( = ?auto_508055 ?auto_508069 ) ) ( not ( = ?auto_508055 ?auto_508070 ) ) ( not ( = ?auto_508056 ?auto_508057 ) ) ( not ( = ?auto_508056 ?auto_508058 ) ) ( not ( = ?auto_508056 ?auto_508059 ) ) ( not ( = ?auto_508056 ?auto_508060 ) ) ( not ( = ?auto_508056 ?auto_508061 ) ) ( not ( = ?auto_508056 ?auto_508062 ) ) ( not ( = ?auto_508056 ?auto_508063 ) ) ( not ( = ?auto_508056 ?auto_508064 ) ) ( not ( = ?auto_508056 ?auto_508065 ) ) ( not ( = ?auto_508056 ?auto_508066 ) ) ( not ( = ?auto_508056 ?auto_508067 ) ) ( not ( = ?auto_508056 ?auto_508068 ) ) ( not ( = ?auto_508056 ?auto_508069 ) ) ( not ( = ?auto_508056 ?auto_508070 ) ) ( not ( = ?auto_508057 ?auto_508058 ) ) ( not ( = ?auto_508057 ?auto_508059 ) ) ( not ( = ?auto_508057 ?auto_508060 ) ) ( not ( = ?auto_508057 ?auto_508061 ) ) ( not ( = ?auto_508057 ?auto_508062 ) ) ( not ( = ?auto_508057 ?auto_508063 ) ) ( not ( = ?auto_508057 ?auto_508064 ) ) ( not ( = ?auto_508057 ?auto_508065 ) ) ( not ( = ?auto_508057 ?auto_508066 ) ) ( not ( = ?auto_508057 ?auto_508067 ) ) ( not ( = ?auto_508057 ?auto_508068 ) ) ( not ( = ?auto_508057 ?auto_508069 ) ) ( not ( = ?auto_508057 ?auto_508070 ) ) ( not ( = ?auto_508058 ?auto_508059 ) ) ( not ( = ?auto_508058 ?auto_508060 ) ) ( not ( = ?auto_508058 ?auto_508061 ) ) ( not ( = ?auto_508058 ?auto_508062 ) ) ( not ( = ?auto_508058 ?auto_508063 ) ) ( not ( = ?auto_508058 ?auto_508064 ) ) ( not ( = ?auto_508058 ?auto_508065 ) ) ( not ( = ?auto_508058 ?auto_508066 ) ) ( not ( = ?auto_508058 ?auto_508067 ) ) ( not ( = ?auto_508058 ?auto_508068 ) ) ( not ( = ?auto_508058 ?auto_508069 ) ) ( not ( = ?auto_508058 ?auto_508070 ) ) ( not ( = ?auto_508059 ?auto_508060 ) ) ( not ( = ?auto_508059 ?auto_508061 ) ) ( not ( = ?auto_508059 ?auto_508062 ) ) ( not ( = ?auto_508059 ?auto_508063 ) ) ( not ( = ?auto_508059 ?auto_508064 ) ) ( not ( = ?auto_508059 ?auto_508065 ) ) ( not ( = ?auto_508059 ?auto_508066 ) ) ( not ( = ?auto_508059 ?auto_508067 ) ) ( not ( = ?auto_508059 ?auto_508068 ) ) ( not ( = ?auto_508059 ?auto_508069 ) ) ( not ( = ?auto_508059 ?auto_508070 ) ) ( not ( = ?auto_508060 ?auto_508061 ) ) ( not ( = ?auto_508060 ?auto_508062 ) ) ( not ( = ?auto_508060 ?auto_508063 ) ) ( not ( = ?auto_508060 ?auto_508064 ) ) ( not ( = ?auto_508060 ?auto_508065 ) ) ( not ( = ?auto_508060 ?auto_508066 ) ) ( not ( = ?auto_508060 ?auto_508067 ) ) ( not ( = ?auto_508060 ?auto_508068 ) ) ( not ( = ?auto_508060 ?auto_508069 ) ) ( not ( = ?auto_508060 ?auto_508070 ) ) ( not ( = ?auto_508061 ?auto_508062 ) ) ( not ( = ?auto_508061 ?auto_508063 ) ) ( not ( = ?auto_508061 ?auto_508064 ) ) ( not ( = ?auto_508061 ?auto_508065 ) ) ( not ( = ?auto_508061 ?auto_508066 ) ) ( not ( = ?auto_508061 ?auto_508067 ) ) ( not ( = ?auto_508061 ?auto_508068 ) ) ( not ( = ?auto_508061 ?auto_508069 ) ) ( not ( = ?auto_508061 ?auto_508070 ) ) ( not ( = ?auto_508062 ?auto_508063 ) ) ( not ( = ?auto_508062 ?auto_508064 ) ) ( not ( = ?auto_508062 ?auto_508065 ) ) ( not ( = ?auto_508062 ?auto_508066 ) ) ( not ( = ?auto_508062 ?auto_508067 ) ) ( not ( = ?auto_508062 ?auto_508068 ) ) ( not ( = ?auto_508062 ?auto_508069 ) ) ( not ( = ?auto_508062 ?auto_508070 ) ) ( not ( = ?auto_508063 ?auto_508064 ) ) ( not ( = ?auto_508063 ?auto_508065 ) ) ( not ( = ?auto_508063 ?auto_508066 ) ) ( not ( = ?auto_508063 ?auto_508067 ) ) ( not ( = ?auto_508063 ?auto_508068 ) ) ( not ( = ?auto_508063 ?auto_508069 ) ) ( not ( = ?auto_508063 ?auto_508070 ) ) ( not ( = ?auto_508064 ?auto_508065 ) ) ( not ( = ?auto_508064 ?auto_508066 ) ) ( not ( = ?auto_508064 ?auto_508067 ) ) ( not ( = ?auto_508064 ?auto_508068 ) ) ( not ( = ?auto_508064 ?auto_508069 ) ) ( not ( = ?auto_508064 ?auto_508070 ) ) ( not ( = ?auto_508065 ?auto_508066 ) ) ( not ( = ?auto_508065 ?auto_508067 ) ) ( not ( = ?auto_508065 ?auto_508068 ) ) ( not ( = ?auto_508065 ?auto_508069 ) ) ( not ( = ?auto_508065 ?auto_508070 ) ) ( not ( = ?auto_508066 ?auto_508067 ) ) ( not ( = ?auto_508066 ?auto_508068 ) ) ( not ( = ?auto_508066 ?auto_508069 ) ) ( not ( = ?auto_508066 ?auto_508070 ) ) ( not ( = ?auto_508067 ?auto_508068 ) ) ( not ( = ?auto_508067 ?auto_508069 ) ) ( not ( = ?auto_508067 ?auto_508070 ) ) ( not ( = ?auto_508068 ?auto_508069 ) ) ( not ( = ?auto_508068 ?auto_508070 ) ) ( not ( = ?auto_508069 ?auto_508070 ) ) ( ON ?auto_508068 ?auto_508069 ) ( ON ?auto_508067 ?auto_508068 ) ( ON ?auto_508066 ?auto_508067 ) ( CLEAR ?auto_508064 ) ( ON ?auto_508065 ?auto_508066 ) ( CLEAR ?auto_508065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_508054 ?auto_508055 ?auto_508056 ?auto_508057 ?auto_508058 ?auto_508059 ?auto_508060 ?auto_508061 ?auto_508062 ?auto_508063 ?auto_508064 ?auto_508065 )
      ( MAKE-16PILE ?auto_508054 ?auto_508055 ?auto_508056 ?auto_508057 ?auto_508058 ?auto_508059 ?auto_508060 ?auto_508061 ?auto_508062 ?auto_508063 ?auto_508064 ?auto_508065 ?auto_508066 ?auto_508067 ?auto_508068 ?auto_508069 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508087 - BLOCK
      ?auto_508088 - BLOCK
      ?auto_508089 - BLOCK
      ?auto_508090 - BLOCK
      ?auto_508091 - BLOCK
      ?auto_508092 - BLOCK
      ?auto_508093 - BLOCK
      ?auto_508094 - BLOCK
      ?auto_508095 - BLOCK
      ?auto_508096 - BLOCK
      ?auto_508097 - BLOCK
      ?auto_508098 - BLOCK
      ?auto_508099 - BLOCK
      ?auto_508100 - BLOCK
      ?auto_508101 - BLOCK
      ?auto_508102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508102 ) ( ON-TABLE ?auto_508087 ) ( ON ?auto_508088 ?auto_508087 ) ( ON ?auto_508089 ?auto_508088 ) ( ON ?auto_508090 ?auto_508089 ) ( ON ?auto_508091 ?auto_508090 ) ( ON ?auto_508092 ?auto_508091 ) ( ON ?auto_508093 ?auto_508092 ) ( ON ?auto_508094 ?auto_508093 ) ( ON ?auto_508095 ?auto_508094 ) ( ON ?auto_508096 ?auto_508095 ) ( ON ?auto_508097 ?auto_508096 ) ( not ( = ?auto_508087 ?auto_508088 ) ) ( not ( = ?auto_508087 ?auto_508089 ) ) ( not ( = ?auto_508087 ?auto_508090 ) ) ( not ( = ?auto_508087 ?auto_508091 ) ) ( not ( = ?auto_508087 ?auto_508092 ) ) ( not ( = ?auto_508087 ?auto_508093 ) ) ( not ( = ?auto_508087 ?auto_508094 ) ) ( not ( = ?auto_508087 ?auto_508095 ) ) ( not ( = ?auto_508087 ?auto_508096 ) ) ( not ( = ?auto_508087 ?auto_508097 ) ) ( not ( = ?auto_508087 ?auto_508098 ) ) ( not ( = ?auto_508087 ?auto_508099 ) ) ( not ( = ?auto_508087 ?auto_508100 ) ) ( not ( = ?auto_508087 ?auto_508101 ) ) ( not ( = ?auto_508087 ?auto_508102 ) ) ( not ( = ?auto_508088 ?auto_508089 ) ) ( not ( = ?auto_508088 ?auto_508090 ) ) ( not ( = ?auto_508088 ?auto_508091 ) ) ( not ( = ?auto_508088 ?auto_508092 ) ) ( not ( = ?auto_508088 ?auto_508093 ) ) ( not ( = ?auto_508088 ?auto_508094 ) ) ( not ( = ?auto_508088 ?auto_508095 ) ) ( not ( = ?auto_508088 ?auto_508096 ) ) ( not ( = ?auto_508088 ?auto_508097 ) ) ( not ( = ?auto_508088 ?auto_508098 ) ) ( not ( = ?auto_508088 ?auto_508099 ) ) ( not ( = ?auto_508088 ?auto_508100 ) ) ( not ( = ?auto_508088 ?auto_508101 ) ) ( not ( = ?auto_508088 ?auto_508102 ) ) ( not ( = ?auto_508089 ?auto_508090 ) ) ( not ( = ?auto_508089 ?auto_508091 ) ) ( not ( = ?auto_508089 ?auto_508092 ) ) ( not ( = ?auto_508089 ?auto_508093 ) ) ( not ( = ?auto_508089 ?auto_508094 ) ) ( not ( = ?auto_508089 ?auto_508095 ) ) ( not ( = ?auto_508089 ?auto_508096 ) ) ( not ( = ?auto_508089 ?auto_508097 ) ) ( not ( = ?auto_508089 ?auto_508098 ) ) ( not ( = ?auto_508089 ?auto_508099 ) ) ( not ( = ?auto_508089 ?auto_508100 ) ) ( not ( = ?auto_508089 ?auto_508101 ) ) ( not ( = ?auto_508089 ?auto_508102 ) ) ( not ( = ?auto_508090 ?auto_508091 ) ) ( not ( = ?auto_508090 ?auto_508092 ) ) ( not ( = ?auto_508090 ?auto_508093 ) ) ( not ( = ?auto_508090 ?auto_508094 ) ) ( not ( = ?auto_508090 ?auto_508095 ) ) ( not ( = ?auto_508090 ?auto_508096 ) ) ( not ( = ?auto_508090 ?auto_508097 ) ) ( not ( = ?auto_508090 ?auto_508098 ) ) ( not ( = ?auto_508090 ?auto_508099 ) ) ( not ( = ?auto_508090 ?auto_508100 ) ) ( not ( = ?auto_508090 ?auto_508101 ) ) ( not ( = ?auto_508090 ?auto_508102 ) ) ( not ( = ?auto_508091 ?auto_508092 ) ) ( not ( = ?auto_508091 ?auto_508093 ) ) ( not ( = ?auto_508091 ?auto_508094 ) ) ( not ( = ?auto_508091 ?auto_508095 ) ) ( not ( = ?auto_508091 ?auto_508096 ) ) ( not ( = ?auto_508091 ?auto_508097 ) ) ( not ( = ?auto_508091 ?auto_508098 ) ) ( not ( = ?auto_508091 ?auto_508099 ) ) ( not ( = ?auto_508091 ?auto_508100 ) ) ( not ( = ?auto_508091 ?auto_508101 ) ) ( not ( = ?auto_508091 ?auto_508102 ) ) ( not ( = ?auto_508092 ?auto_508093 ) ) ( not ( = ?auto_508092 ?auto_508094 ) ) ( not ( = ?auto_508092 ?auto_508095 ) ) ( not ( = ?auto_508092 ?auto_508096 ) ) ( not ( = ?auto_508092 ?auto_508097 ) ) ( not ( = ?auto_508092 ?auto_508098 ) ) ( not ( = ?auto_508092 ?auto_508099 ) ) ( not ( = ?auto_508092 ?auto_508100 ) ) ( not ( = ?auto_508092 ?auto_508101 ) ) ( not ( = ?auto_508092 ?auto_508102 ) ) ( not ( = ?auto_508093 ?auto_508094 ) ) ( not ( = ?auto_508093 ?auto_508095 ) ) ( not ( = ?auto_508093 ?auto_508096 ) ) ( not ( = ?auto_508093 ?auto_508097 ) ) ( not ( = ?auto_508093 ?auto_508098 ) ) ( not ( = ?auto_508093 ?auto_508099 ) ) ( not ( = ?auto_508093 ?auto_508100 ) ) ( not ( = ?auto_508093 ?auto_508101 ) ) ( not ( = ?auto_508093 ?auto_508102 ) ) ( not ( = ?auto_508094 ?auto_508095 ) ) ( not ( = ?auto_508094 ?auto_508096 ) ) ( not ( = ?auto_508094 ?auto_508097 ) ) ( not ( = ?auto_508094 ?auto_508098 ) ) ( not ( = ?auto_508094 ?auto_508099 ) ) ( not ( = ?auto_508094 ?auto_508100 ) ) ( not ( = ?auto_508094 ?auto_508101 ) ) ( not ( = ?auto_508094 ?auto_508102 ) ) ( not ( = ?auto_508095 ?auto_508096 ) ) ( not ( = ?auto_508095 ?auto_508097 ) ) ( not ( = ?auto_508095 ?auto_508098 ) ) ( not ( = ?auto_508095 ?auto_508099 ) ) ( not ( = ?auto_508095 ?auto_508100 ) ) ( not ( = ?auto_508095 ?auto_508101 ) ) ( not ( = ?auto_508095 ?auto_508102 ) ) ( not ( = ?auto_508096 ?auto_508097 ) ) ( not ( = ?auto_508096 ?auto_508098 ) ) ( not ( = ?auto_508096 ?auto_508099 ) ) ( not ( = ?auto_508096 ?auto_508100 ) ) ( not ( = ?auto_508096 ?auto_508101 ) ) ( not ( = ?auto_508096 ?auto_508102 ) ) ( not ( = ?auto_508097 ?auto_508098 ) ) ( not ( = ?auto_508097 ?auto_508099 ) ) ( not ( = ?auto_508097 ?auto_508100 ) ) ( not ( = ?auto_508097 ?auto_508101 ) ) ( not ( = ?auto_508097 ?auto_508102 ) ) ( not ( = ?auto_508098 ?auto_508099 ) ) ( not ( = ?auto_508098 ?auto_508100 ) ) ( not ( = ?auto_508098 ?auto_508101 ) ) ( not ( = ?auto_508098 ?auto_508102 ) ) ( not ( = ?auto_508099 ?auto_508100 ) ) ( not ( = ?auto_508099 ?auto_508101 ) ) ( not ( = ?auto_508099 ?auto_508102 ) ) ( not ( = ?auto_508100 ?auto_508101 ) ) ( not ( = ?auto_508100 ?auto_508102 ) ) ( not ( = ?auto_508101 ?auto_508102 ) ) ( ON ?auto_508101 ?auto_508102 ) ( ON ?auto_508100 ?auto_508101 ) ( ON ?auto_508099 ?auto_508100 ) ( CLEAR ?auto_508097 ) ( ON ?auto_508098 ?auto_508099 ) ( CLEAR ?auto_508098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_508087 ?auto_508088 ?auto_508089 ?auto_508090 ?auto_508091 ?auto_508092 ?auto_508093 ?auto_508094 ?auto_508095 ?auto_508096 ?auto_508097 ?auto_508098 )
      ( MAKE-16PILE ?auto_508087 ?auto_508088 ?auto_508089 ?auto_508090 ?auto_508091 ?auto_508092 ?auto_508093 ?auto_508094 ?auto_508095 ?auto_508096 ?auto_508097 ?auto_508098 ?auto_508099 ?auto_508100 ?auto_508101 ?auto_508102 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508119 - BLOCK
      ?auto_508120 - BLOCK
      ?auto_508121 - BLOCK
      ?auto_508122 - BLOCK
      ?auto_508123 - BLOCK
      ?auto_508124 - BLOCK
      ?auto_508125 - BLOCK
      ?auto_508126 - BLOCK
      ?auto_508127 - BLOCK
      ?auto_508128 - BLOCK
      ?auto_508129 - BLOCK
      ?auto_508130 - BLOCK
      ?auto_508131 - BLOCK
      ?auto_508132 - BLOCK
      ?auto_508133 - BLOCK
      ?auto_508134 - BLOCK
    )
    :vars
    (
      ?auto_508135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508134 ?auto_508135 ) ( ON-TABLE ?auto_508119 ) ( ON ?auto_508120 ?auto_508119 ) ( ON ?auto_508121 ?auto_508120 ) ( ON ?auto_508122 ?auto_508121 ) ( ON ?auto_508123 ?auto_508122 ) ( ON ?auto_508124 ?auto_508123 ) ( ON ?auto_508125 ?auto_508124 ) ( ON ?auto_508126 ?auto_508125 ) ( ON ?auto_508127 ?auto_508126 ) ( ON ?auto_508128 ?auto_508127 ) ( not ( = ?auto_508119 ?auto_508120 ) ) ( not ( = ?auto_508119 ?auto_508121 ) ) ( not ( = ?auto_508119 ?auto_508122 ) ) ( not ( = ?auto_508119 ?auto_508123 ) ) ( not ( = ?auto_508119 ?auto_508124 ) ) ( not ( = ?auto_508119 ?auto_508125 ) ) ( not ( = ?auto_508119 ?auto_508126 ) ) ( not ( = ?auto_508119 ?auto_508127 ) ) ( not ( = ?auto_508119 ?auto_508128 ) ) ( not ( = ?auto_508119 ?auto_508129 ) ) ( not ( = ?auto_508119 ?auto_508130 ) ) ( not ( = ?auto_508119 ?auto_508131 ) ) ( not ( = ?auto_508119 ?auto_508132 ) ) ( not ( = ?auto_508119 ?auto_508133 ) ) ( not ( = ?auto_508119 ?auto_508134 ) ) ( not ( = ?auto_508119 ?auto_508135 ) ) ( not ( = ?auto_508120 ?auto_508121 ) ) ( not ( = ?auto_508120 ?auto_508122 ) ) ( not ( = ?auto_508120 ?auto_508123 ) ) ( not ( = ?auto_508120 ?auto_508124 ) ) ( not ( = ?auto_508120 ?auto_508125 ) ) ( not ( = ?auto_508120 ?auto_508126 ) ) ( not ( = ?auto_508120 ?auto_508127 ) ) ( not ( = ?auto_508120 ?auto_508128 ) ) ( not ( = ?auto_508120 ?auto_508129 ) ) ( not ( = ?auto_508120 ?auto_508130 ) ) ( not ( = ?auto_508120 ?auto_508131 ) ) ( not ( = ?auto_508120 ?auto_508132 ) ) ( not ( = ?auto_508120 ?auto_508133 ) ) ( not ( = ?auto_508120 ?auto_508134 ) ) ( not ( = ?auto_508120 ?auto_508135 ) ) ( not ( = ?auto_508121 ?auto_508122 ) ) ( not ( = ?auto_508121 ?auto_508123 ) ) ( not ( = ?auto_508121 ?auto_508124 ) ) ( not ( = ?auto_508121 ?auto_508125 ) ) ( not ( = ?auto_508121 ?auto_508126 ) ) ( not ( = ?auto_508121 ?auto_508127 ) ) ( not ( = ?auto_508121 ?auto_508128 ) ) ( not ( = ?auto_508121 ?auto_508129 ) ) ( not ( = ?auto_508121 ?auto_508130 ) ) ( not ( = ?auto_508121 ?auto_508131 ) ) ( not ( = ?auto_508121 ?auto_508132 ) ) ( not ( = ?auto_508121 ?auto_508133 ) ) ( not ( = ?auto_508121 ?auto_508134 ) ) ( not ( = ?auto_508121 ?auto_508135 ) ) ( not ( = ?auto_508122 ?auto_508123 ) ) ( not ( = ?auto_508122 ?auto_508124 ) ) ( not ( = ?auto_508122 ?auto_508125 ) ) ( not ( = ?auto_508122 ?auto_508126 ) ) ( not ( = ?auto_508122 ?auto_508127 ) ) ( not ( = ?auto_508122 ?auto_508128 ) ) ( not ( = ?auto_508122 ?auto_508129 ) ) ( not ( = ?auto_508122 ?auto_508130 ) ) ( not ( = ?auto_508122 ?auto_508131 ) ) ( not ( = ?auto_508122 ?auto_508132 ) ) ( not ( = ?auto_508122 ?auto_508133 ) ) ( not ( = ?auto_508122 ?auto_508134 ) ) ( not ( = ?auto_508122 ?auto_508135 ) ) ( not ( = ?auto_508123 ?auto_508124 ) ) ( not ( = ?auto_508123 ?auto_508125 ) ) ( not ( = ?auto_508123 ?auto_508126 ) ) ( not ( = ?auto_508123 ?auto_508127 ) ) ( not ( = ?auto_508123 ?auto_508128 ) ) ( not ( = ?auto_508123 ?auto_508129 ) ) ( not ( = ?auto_508123 ?auto_508130 ) ) ( not ( = ?auto_508123 ?auto_508131 ) ) ( not ( = ?auto_508123 ?auto_508132 ) ) ( not ( = ?auto_508123 ?auto_508133 ) ) ( not ( = ?auto_508123 ?auto_508134 ) ) ( not ( = ?auto_508123 ?auto_508135 ) ) ( not ( = ?auto_508124 ?auto_508125 ) ) ( not ( = ?auto_508124 ?auto_508126 ) ) ( not ( = ?auto_508124 ?auto_508127 ) ) ( not ( = ?auto_508124 ?auto_508128 ) ) ( not ( = ?auto_508124 ?auto_508129 ) ) ( not ( = ?auto_508124 ?auto_508130 ) ) ( not ( = ?auto_508124 ?auto_508131 ) ) ( not ( = ?auto_508124 ?auto_508132 ) ) ( not ( = ?auto_508124 ?auto_508133 ) ) ( not ( = ?auto_508124 ?auto_508134 ) ) ( not ( = ?auto_508124 ?auto_508135 ) ) ( not ( = ?auto_508125 ?auto_508126 ) ) ( not ( = ?auto_508125 ?auto_508127 ) ) ( not ( = ?auto_508125 ?auto_508128 ) ) ( not ( = ?auto_508125 ?auto_508129 ) ) ( not ( = ?auto_508125 ?auto_508130 ) ) ( not ( = ?auto_508125 ?auto_508131 ) ) ( not ( = ?auto_508125 ?auto_508132 ) ) ( not ( = ?auto_508125 ?auto_508133 ) ) ( not ( = ?auto_508125 ?auto_508134 ) ) ( not ( = ?auto_508125 ?auto_508135 ) ) ( not ( = ?auto_508126 ?auto_508127 ) ) ( not ( = ?auto_508126 ?auto_508128 ) ) ( not ( = ?auto_508126 ?auto_508129 ) ) ( not ( = ?auto_508126 ?auto_508130 ) ) ( not ( = ?auto_508126 ?auto_508131 ) ) ( not ( = ?auto_508126 ?auto_508132 ) ) ( not ( = ?auto_508126 ?auto_508133 ) ) ( not ( = ?auto_508126 ?auto_508134 ) ) ( not ( = ?auto_508126 ?auto_508135 ) ) ( not ( = ?auto_508127 ?auto_508128 ) ) ( not ( = ?auto_508127 ?auto_508129 ) ) ( not ( = ?auto_508127 ?auto_508130 ) ) ( not ( = ?auto_508127 ?auto_508131 ) ) ( not ( = ?auto_508127 ?auto_508132 ) ) ( not ( = ?auto_508127 ?auto_508133 ) ) ( not ( = ?auto_508127 ?auto_508134 ) ) ( not ( = ?auto_508127 ?auto_508135 ) ) ( not ( = ?auto_508128 ?auto_508129 ) ) ( not ( = ?auto_508128 ?auto_508130 ) ) ( not ( = ?auto_508128 ?auto_508131 ) ) ( not ( = ?auto_508128 ?auto_508132 ) ) ( not ( = ?auto_508128 ?auto_508133 ) ) ( not ( = ?auto_508128 ?auto_508134 ) ) ( not ( = ?auto_508128 ?auto_508135 ) ) ( not ( = ?auto_508129 ?auto_508130 ) ) ( not ( = ?auto_508129 ?auto_508131 ) ) ( not ( = ?auto_508129 ?auto_508132 ) ) ( not ( = ?auto_508129 ?auto_508133 ) ) ( not ( = ?auto_508129 ?auto_508134 ) ) ( not ( = ?auto_508129 ?auto_508135 ) ) ( not ( = ?auto_508130 ?auto_508131 ) ) ( not ( = ?auto_508130 ?auto_508132 ) ) ( not ( = ?auto_508130 ?auto_508133 ) ) ( not ( = ?auto_508130 ?auto_508134 ) ) ( not ( = ?auto_508130 ?auto_508135 ) ) ( not ( = ?auto_508131 ?auto_508132 ) ) ( not ( = ?auto_508131 ?auto_508133 ) ) ( not ( = ?auto_508131 ?auto_508134 ) ) ( not ( = ?auto_508131 ?auto_508135 ) ) ( not ( = ?auto_508132 ?auto_508133 ) ) ( not ( = ?auto_508132 ?auto_508134 ) ) ( not ( = ?auto_508132 ?auto_508135 ) ) ( not ( = ?auto_508133 ?auto_508134 ) ) ( not ( = ?auto_508133 ?auto_508135 ) ) ( not ( = ?auto_508134 ?auto_508135 ) ) ( ON ?auto_508133 ?auto_508134 ) ( ON ?auto_508132 ?auto_508133 ) ( ON ?auto_508131 ?auto_508132 ) ( ON ?auto_508130 ?auto_508131 ) ( CLEAR ?auto_508128 ) ( ON ?auto_508129 ?auto_508130 ) ( CLEAR ?auto_508129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_508119 ?auto_508120 ?auto_508121 ?auto_508122 ?auto_508123 ?auto_508124 ?auto_508125 ?auto_508126 ?auto_508127 ?auto_508128 ?auto_508129 )
      ( MAKE-16PILE ?auto_508119 ?auto_508120 ?auto_508121 ?auto_508122 ?auto_508123 ?auto_508124 ?auto_508125 ?auto_508126 ?auto_508127 ?auto_508128 ?auto_508129 ?auto_508130 ?auto_508131 ?auto_508132 ?auto_508133 ?auto_508134 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508152 - BLOCK
      ?auto_508153 - BLOCK
      ?auto_508154 - BLOCK
      ?auto_508155 - BLOCK
      ?auto_508156 - BLOCK
      ?auto_508157 - BLOCK
      ?auto_508158 - BLOCK
      ?auto_508159 - BLOCK
      ?auto_508160 - BLOCK
      ?auto_508161 - BLOCK
      ?auto_508162 - BLOCK
      ?auto_508163 - BLOCK
      ?auto_508164 - BLOCK
      ?auto_508165 - BLOCK
      ?auto_508166 - BLOCK
      ?auto_508167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508167 ) ( ON-TABLE ?auto_508152 ) ( ON ?auto_508153 ?auto_508152 ) ( ON ?auto_508154 ?auto_508153 ) ( ON ?auto_508155 ?auto_508154 ) ( ON ?auto_508156 ?auto_508155 ) ( ON ?auto_508157 ?auto_508156 ) ( ON ?auto_508158 ?auto_508157 ) ( ON ?auto_508159 ?auto_508158 ) ( ON ?auto_508160 ?auto_508159 ) ( ON ?auto_508161 ?auto_508160 ) ( not ( = ?auto_508152 ?auto_508153 ) ) ( not ( = ?auto_508152 ?auto_508154 ) ) ( not ( = ?auto_508152 ?auto_508155 ) ) ( not ( = ?auto_508152 ?auto_508156 ) ) ( not ( = ?auto_508152 ?auto_508157 ) ) ( not ( = ?auto_508152 ?auto_508158 ) ) ( not ( = ?auto_508152 ?auto_508159 ) ) ( not ( = ?auto_508152 ?auto_508160 ) ) ( not ( = ?auto_508152 ?auto_508161 ) ) ( not ( = ?auto_508152 ?auto_508162 ) ) ( not ( = ?auto_508152 ?auto_508163 ) ) ( not ( = ?auto_508152 ?auto_508164 ) ) ( not ( = ?auto_508152 ?auto_508165 ) ) ( not ( = ?auto_508152 ?auto_508166 ) ) ( not ( = ?auto_508152 ?auto_508167 ) ) ( not ( = ?auto_508153 ?auto_508154 ) ) ( not ( = ?auto_508153 ?auto_508155 ) ) ( not ( = ?auto_508153 ?auto_508156 ) ) ( not ( = ?auto_508153 ?auto_508157 ) ) ( not ( = ?auto_508153 ?auto_508158 ) ) ( not ( = ?auto_508153 ?auto_508159 ) ) ( not ( = ?auto_508153 ?auto_508160 ) ) ( not ( = ?auto_508153 ?auto_508161 ) ) ( not ( = ?auto_508153 ?auto_508162 ) ) ( not ( = ?auto_508153 ?auto_508163 ) ) ( not ( = ?auto_508153 ?auto_508164 ) ) ( not ( = ?auto_508153 ?auto_508165 ) ) ( not ( = ?auto_508153 ?auto_508166 ) ) ( not ( = ?auto_508153 ?auto_508167 ) ) ( not ( = ?auto_508154 ?auto_508155 ) ) ( not ( = ?auto_508154 ?auto_508156 ) ) ( not ( = ?auto_508154 ?auto_508157 ) ) ( not ( = ?auto_508154 ?auto_508158 ) ) ( not ( = ?auto_508154 ?auto_508159 ) ) ( not ( = ?auto_508154 ?auto_508160 ) ) ( not ( = ?auto_508154 ?auto_508161 ) ) ( not ( = ?auto_508154 ?auto_508162 ) ) ( not ( = ?auto_508154 ?auto_508163 ) ) ( not ( = ?auto_508154 ?auto_508164 ) ) ( not ( = ?auto_508154 ?auto_508165 ) ) ( not ( = ?auto_508154 ?auto_508166 ) ) ( not ( = ?auto_508154 ?auto_508167 ) ) ( not ( = ?auto_508155 ?auto_508156 ) ) ( not ( = ?auto_508155 ?auto_508157 ) ) ( not ( = ?auto_508155 ?auto_508158 ) ) ( not ( = ?auto_508155 ?auto_508159 ) ) ( not ( = ?auto_508155 ?auto_508160 ) ) ( not ( = ?auto_508155 ?auto_508161 ) ) ( not ( = ?auto_508155 ?auto_508162 ) ) ( not ( = ?auto_508155 ?auto_508163 ) ) ( not ( = ?auto_508155 ?auto_508164 ) ) ( not ( = ?auto_508155 ?auto_508165 ) ) ( not ( = ?auto_508155 ?auto_508166 ) ) ( not ( = ?auto_508155 ?auto_508167 ) ) ( not ( = ?auto_508156 ?auto_508157 ) ) ( not ( = ?auto_508156 ?auto_508158 ) ) ( not ( = ?auto_508156 ?auto_508159 ) ) ( not ( = ?auto_508156 ?auto_508160 ) ) ( not ( = ?auto_508156 ?auto_508161 ) ) ( not ( = ?auto_508156 ?auto_508162 ) ) ( not ( = ?auto_508156 ?auto_508163 ) ) ( not ( = ?auto_508156 ?auto_508164 ) ) ( not ( = ?auto_508156 ?auto_508165 ) ) ( not ( = ?auto_508156 ?auto_508166 ) ) ( not ( = ?auto_508156 ?auto_508167 ) ) ( not ( = ?auto_508157 ?auto_508158 ) ) ( not ( = ?auto_508157 ?auto_508159 ) ) ( not ( = ?auto_508157 ?auto_508160 ) ) ( not ( = ?auto_508157 ?auto_508161 ) ) ( not ( = ?auto_508157 ?auto_508162 ) ) ( not ( = ?auto_508157 ?auto_508163 ) ) ( not ( = ?auto_508157 ?auto_508164 ) ) ( not ( = ?auto_508157 ?auto_508165 ) ) ( not ( = ?auto_508157 ?auto_508166 ) ) ( not ( = ?auto_508157 ?auto_508167 ) ) ( not ( = ?auto_508158 ?auto_508159 ) ) ( not ( = ?auto_508158 ?auto_508160 ) ) ( not ( = ?auto_508158 ?auto_508161 ) ) ( not ( = ?auto_508158 ?auto_508162 ) ) ( not ( = ?auto_508158 ?auto_508163 ) ) ( not ( = ?auto_508158 ?auto_508164 ) ) ( not ( = ?auto_508158 ?auto_508165 ) ) ( not ( = ?auto_508158 ?auto_508166 ) ) ( not ( = ?auto_508158 ?auto_508167 ) ) ( not ( = ?auto_508159 ?auto_508160 ) ) ( not ( = ?auto_508159 ?auto_508161 ) ) ( not ( = ?auto_508159 ?auto_508162 ) ) ( not ( = ?auto_508159 ?auto_508163 ) ) ( not ( = ?auto_508159 ?auto_508164 ) ) ( not ( = ?auto_508159 ?auto_508165 ) ) ( not ( = ?auto_508159 ?auto_508166 ) ) ( not ( = ?auto_508159 ?auto_508167 ) ) ( not ( = ?auto_508160 ?auto_508161 ) ) ( not ( = ?auto_508160 ?auto_508162 ) ) ( not ( = ?auto_508160 ?auto_508163 ) ) ( not ( = ?auto_508160 ?auto_508164 ) ) ( not ( = ?auto_508160 ?auto_508165 ) ) ( not ( = ?auto_508160 ?auto_508166 ) ) ( not ( = ?auto_508160 ?auto_508167 ) ) ( not ( = ?auto_508161 ?auto_508162 ) ) ( not ( = ?auto_508161 ?auto_508163 ) ) ( not ( = ?auto_508161 ?auto_508164 ) ) ( not ( = ?auto_508161 ?auto_508165 ) ) ( not ( = ?auto_508161 ?auto_508166 ) ) ( not ( = ?auto_508161 ?auto_508167 ) ) ( not ( = ?auto_508162 ?auto_508163 ) ) ( not ( = ?auto_508162 ?auto_508164 ) ) ( not ( = ?auto_508162 ?auto_508165 ) ) ( not ( = ?auto_508162 ?auto_508166 ) ) ( not ( = ?auto_508162 ?auto_508167 ) ) ( not ( = ?auto_508163 ?auto_508164 ) ) ( not ( = ?auto_508163 ?auto_508165 ) ) ( not ( = ?auto_508163 ?auto_508166 ) ) ( not ( = ?auto_508163 ?auto_508167 ) ) ( not ( = ?auto_508164 ?auto_508165 ) ) ( not ( = ?auto_508164 ?auto_508166 ) ) ( not ( = ?auto_508164 ?auto_508167 ) ) ( not ( = ?auto_508165 ?auto_508166 ) ) ( not ( = ?auto_508165 ?auto_508167 ) ) ( not ( = ?auto_508166 ?auto_508167 ) ) ( ON ?auto_508166 ?auto_508167 ) ( ON ?auto_508165 ?auto_508166 ) ( ON ?auto_508164 ?auto_508165 ) ( ON ?auto_508163 ?auto_508164 ) ( CLEAR ?auto_508161 ) ( ON ?auto_508162 ?auto_508163 ) ( CLEAR ?auto_508162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_508152 ?auto_508153 ?auto_508154 ?auto_508155 ?auto_508156 ?auto_508157 ?auto_508158 ?auto_508159 ?auto_508160 ?auto_508161 ?auto_508162 )
      ( MAKE-16PILE ?auto_508152 ?auto_508153 ?auto_508154 ?auto_508155 ?auto_508156 ?auto_508157 ?auto_508158 ?auto_508159 ?auto_508160 ?auto_508161 ?auto_508162 ?auto_508163 ?auto_508164 ?auto_508165 ?auto_508166 ?auto_508167 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508184 - BLOCK
      ?auto_508185 - BLOCK
      ?auto_508186 - BLOCK
      ?auto_508187 - BLOCK
      ?auto_508188 - BLOCK
      ?auto_508189 - BLOCK
      ?auto_508190 - BLOCK
      ?auto_508191 - BLOCK
      ?auto_508192 - BLOCK
      ?auto_508193 - BLOCK
      ?auto_508194 - BLOCK
      ?auto_508195 - BLOCK
      ?auto_508196 - BLOCK
      ?auto_508197 - BLOCK
      ?auto_508198 - BLOCK
      ?auto_508199 - BLOCK
    )
    :vars
    (
      ?auto_508200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508199 ?auto_508200 ) ( ON-TABLE ?auto_508184 ) ( ON ?auto_508185 ?auto_508184 ) ( ON ?auto_508186 ?auto_508185 ) ( ON ?auto_508187 ?auto_508186 ) ( ON ?auto_508188 ?auto_508187 ) ( ON ?auto_508189 ?auto_508188 ) ( ON ?auto_508190 ?auto_508189 ) ( ON ?auto_508191 ?auto_508190 ) ( ON ?auto_508192 ?auto_508191 ) ( not ( = ?auto_508184 ?auto_508185 ) ) ( not ( = ?auto_508184 ?auto_508186 ) ) ( not ( = ?auto_508184 ?auto_508187 ) ) ( not ( = ?auto_508184 ?auto_508188 ) ) ( not ( = ?auto_508184 ?auto_508189 ) ) ( not ( = ?auto_508184 ?auto_508190 ) ) ( not ( = ?auto_508184 ?auto_508191 ) ) ( not ( = ?auto_508184 ?auto_508192 ) ) ( not ( = ?auto_508184 ?auto_508193 ) ) ( not ( = ?auto_508184 ?auto_508194 ) ) ( not ( = ?auto_508184 ?auto_508195 ) ) ( not ( = ?auto_508184 ?auto_508196 ) ) ( not ( = ?auto_508184 ?auto_508197 ) ) ( not ( = ?auto_508184 ?auto_508198 ) ) ( not ( = ?auto_508184 ?auto_508199 ) ) ( not ( = ?auto_508184 ?auto_508200 ) ) ( not ( = ?auto_508185 ?auto_508186 ) ) ( not ( = ?auto_508185 ?auto_508187 ) ) ( not ( = ?auto_508185 ?auto_508188 ) ) ( not ( = ?auto_508185 ?auto_508189 ) ) ( not ( = ?auto_508185 ?auto_508190 ) ) ( not ( = ?auto_508185 ?auto_508191 ) ) ( not ( = ?auto_508185 ?auto_508192 ) ) ( not ( = ?auto_508185 ?auto_508193 ) ) ( not ( = ?auto_508185 ?auto_508194 ) ) ( not ( = ?auto_508185 ?auto_508195 ) ) ( not ( = ?auto_508185 ?auto_508196 ) ) ( not ( = ?auto_508185 ?auto_508197 ) ) ( not ( = ?auto_508185 ?auto_508198 ) ) ( not ( = ?auto_508185 ?auto_508199 ) ) ( not ( = ?auto_508185 ?auto_508200 ) ) ( not ( = ?auto_508186 ?auto_508187 ) ) ( not ( = ?auto_508186 ?auto_508188 ) ) ( not ( = ?auto_508186 ?auto_508189 ) ) ( not ( = ?auto_508186 ?auto_508190 ) ) ( not ( = ?auto_508186 ?auto_508191 ) ) ( not ( = ?auto_508186 ?auto_508192 ) ) ( not ( = ?auto_508186 ?auto_508193 ) ) ( not ( = ?auto_508186 ?auto_508194 ) ) ( not ( = ?auto_508186 ?auto_508195 ) ) ( not ( = ?auto_508186 ?auto_508196 ) ) ( not ( = ?auto_508186 ?auto_508197 ) ) ( not ( = ?auto_508186 ?auto_508198 ) ) ( not ( = ?auto_508186 ?auto_508199 ) ) ( not ( = ?auto_508186 ?auto_508200 ) ) ( not ( = ?auto_508187 ?auto_508188 ) ) ( not ( = ?auto_508187 ?auto_508189 ) ) ( not ( = ?auto_508187 ?auto_508190 ) ) ( not ( = ?auto_508187 ?auto_508191 ) ) ( not ( = ?auto_508187 ?auto_508192 ) ) ( not ( = ?auto_508187 ?auto_508193 ) ) ( not ( = ?auto_508187 ?auto_508194 ) ) ( not ( = ?auto_508187 ?auto_508195 ) ) ( not ( = ?auto_508187 ?auto_508196 ) ) ( not ( = ?auto_508187 ?auto_508197 ) ) ( not ( = ?auto_508187 ?auto_508198 ) ) ( not ( = ?auto_508187 ?auto_508199 ) ) ( not ( = ?auto_508187 ?auto_508200 ) ) ( not ( = ?auto_508188 ?auto_508189 ) ) ( not ( = ?auto_508188 ?auto_508190 ) ) ( not ( = ?auto_508188 ?auto_508191 ) ) ( not ( = ?auto_508188 ?auto_508192 ) ) ( not ( = ?auto_508188 ?auto_508193 ) ) ( not ( = ?auto_508188 ?auto_508194 ) ) ( not ( = ?auto_508188 ?auto_508195 ) ) ( not ( = ?auto_508188 ?auto_508196 ) ) ( not ( = ?auto_508188 ?auto_508197 ) ) ( not ( = ?auto_508188 ?auto_508198 ) ) ( not ( = ?auto_508188 ?auto_508199 ) ) ( not ( = ?auto_508188 ?auto_508200 ) ) ( not ( = ?auto_508189 ?auto_508190 ) ) ( not ( = ?auto_508189 ?auto_508191 ) ) ( not ( = ?auto_508189 ?auto_508192 ) ) ( not ( = ?auto_508189 ?auto_508193 ) ) ( not ( = ?auto_508189 ?auto_508194 ) ) ( not ( = ?auto_508189 ?auto_508195 ) ) ( not ( = ?auto_508189 ?auto_508196 ) ) ( not ( = ?auto_508189 ?auto_508197 ) ) ( not ( = ?auto_508189 ?auto_508198 ) ) ( not ( = ?auto_508189 ?auto_508199 ) ) ( not ( = ?auto_508189 ?auto_508200 ) ) ( not ( = ?auto_508190 ?auto_508191 ) ) ( not ( = ?auto_508190 ?auto_508192 ) ) ( not ( = ?auto_508190 ?auto_508193 ) ) ( not ( = ?auto_508190 ?auto_508194 ) ) ( not ( = ?auto_508190 ?auto_508195 ) ) ( not ( = ?auto_508190 ?auto_508196 ) ) ( not ( = ?auto_508190 ?auto_508197 ) ) ( not ( = ?auto_508190 ?auto_508198 ) ) ( not ( = ?auto_508190 ?auto_508199 ) ) ( not ( = ?auto_508190 ?auto_508200 ) ) ( not ( = ?auto_508191 ?auto_508192 ) ) ( not ( = ?auto_508191 ?auto_508193 ) ) ( not ( = ?auto_508191 ?auto_508194 ) ) ( not ( = ?auto_508191 ?auto_508195 ) ) ( not ( = ?auto_508191 ?auto_508196 ) ) ( not ( = ?auto_508191 ?auto_508197 ) ) ( not ( = ?auto_508191 ?auto_508198 ) ) ( not ( = ?auto_508191 ?auto_508199 ) ) ( not ( = ?auto_508191 ?auto_508200 ) ) ( not ( = ?auto_508192 ?auto_508193 ) ) ( not ( = ?auto_508192 ?auto_508194 ) ) ( not ( = ?auto_508192 ?auto_508195 ) ) ( not ( = ?auto_508192 ?auto_508196 ) ) ( not ( = ?auto_508192 ?auto_508197 ) ) ( not ( = ?auto_508192 ?auto_508198 ) ) ( not ( = ?auto_508192 ?auto_508199 ) ) ( not ( = ?auto_508192 ?auto_508200 ) ) ( not ( = ?auto_508193 ?auto_508194 ) ) ( not ( = ?auto_508193 ?auto_508195 ) ) ( not ( = ?auto_508193 ?auto_508196 ) ) ( not ( = ?auto_508193 ?auto_508197 ) ) ( not ( = ?auto_508193 ?auto_508198 ) ) ( not ( = ?auto_508193 ?auto_508199 ) ) ( not ( = ?auto_508193 ?auto_508200 ) ) ( not ( = ?auto_508194 ?auto_508195 ) ) ( not ( = ?auto_508194 ?auto_508196 ) ) ( not ( = ?auto_508194 ?auto_508197 ) ) ( not ( = ?auto_508194 ?auto_508198 ) ) ( not ( = ?auto_508194 ?auto_508199 ) ) ( not ( = ?auto_508194 ?auto_508200 ) ) ( not ( = ?auto_508195 ?auto_508196 ) ) ( not ( = ?auto_508195 ?auto_508197 ) ) ( not ( = ?auto_508195 ?auto_508198 ) ) ( not ( = ?auto_508195 ?auto_508199 ) ) ( not ( = ?auto_508195 ?auto_508200 ) ) ( not ( = ?auto_508196 ?auto_508197 ) ) ( not ( = ?auto_508196 ?auto_508198 ) ) ( not ( = ?auto_508196 ?auto_508199 ) ) ( not ( = ?auto_508196 ?auto_508200 ) ) ( not ( = ?auto_508197 ?auto_508198 ) ) ( not ( = ?auto_508197 ?auto_508199 ) ) ( not ( = ?auto_508197 ?auto_508200 ) ) ( not ( = ?auto_508198 ?auto_508199 ) ) ( not ( = ?auto_508198 ?auto_508200 ) ) ( not ( = ?auto_508199 ?auto_508200 ) ) ( ON ?auto_508198 ?auto_508199 ) ( ON ?auto_508197 ?auto_508198 ) ( ON ?auto_508196 ?auto_508197 ) ( ON ?auto_508195 ?auto_508196 ) ( ON ?auto_508194 ?auto_508195 ) ( CLEAR ?auto_508192 ) ( ON ?auto_508193 ?auto_508194 ) ( CLEAR ?auto_508193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_508184 ?auto_508185 ?auto_508186 ?auto_508187 ?auto_508188 ?auto_508189 ?auto_508190 ?auto_508191 ?auto_508192 ?auto_508193 )
      ( MAKE-16PILE ?auto_508184 ?auto_508185 ?auto_508186 ?auto_508187 ?auto_508188 ?auto_508189 ?auto_508190 ?auto_508191 ?auto_508192 ?auto_508193 ?auto_508194 ?auto_508195 ?auto_508196 ?auto_508197 ?auto_508198 ?auto_508199 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508217 - BLOCK
      ?auto_508218 - BLOCK
      ?auto_508219 - BLOCK
      ?auto_508220 - BLOCK
      ?auto_508221 - BLOCK
      ?auto_508222 - BLOCK
      ?auto_508223 - BLOCK
      ?auto_508224 - BLOCK
      ?auto_508225 - BLOCK
      ?auto_508226 - BLOCK
      ?auto_508227 - BLOCK
      ?auto_508228 - BLOCK
      ?auto_508229 - BLOCK
      ?auto_508230 - BLOCK
      ?auto_508231 - BLOCK
      ?auto_508232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508232 ) ( ON-TABLE ?auto_508217 ) ( ON ?auto_508218 ?auto_508217 ) ( ON ?auto_508219 ?auto_508218 ) ( ON ?auto_508220 ?auto_508219 ) ( ON ?auto_508221 ?auto_508220 ) ( ON ?auto_508222 ?auto_508221 ) ( ON ?auto_508223 ?auto_508222 ) ( ON ?auto_508224 ?auto_508223 ) ( ON ?auto_508225 ?auto_508224 ) ( not ( = ?auto_508217 ?auto_508218 ) ) ( not ( = ?auto_508217 ?auto_508219 ) ) ( not ( = ?auto_508217 ?auto_508220 ) ) ( not ( = ?auto_508217 ?auto_508221 ) ) ( not ( = ?auto_508217 ?auto_508222 ) ) ( not ( = ?auto_508217 ?auto_508223 ) ) ( not ( = ?auto_508217 ?auto_508224 ) ) ( not ( = ?auto_508217 ?auto_508225 ) ) ( not ( = ?auto_508217 ?auto_508226 ) ) ( not ( = ?auto_508217 ?auto_508227 ) ) ( not ( = ?auto_508217 ?auto_508228 ) ) ( not ( = ?auto_508217 ?auto_508229 ) ) ( not ( = ?auto_508217 ?auto_508230 ) ) ( not ( = ?auto_508217 ?auto_508231 ) ) ( not ( = ?auto_508217 ?auto_508232 ) ) ( not ( = ?auto_508218 ?auto_508219 ) ) ( not ( = ?auto_508218 ?auto_508220 ) ) ( not ( = ?auto_508218 ?auto_508221 ) ) ( not ( = ?auto_508218 ?auto_508222 ) ) ( not ( = ?auto_508218 ?auto_508223 ) ) ( not ( = ?auto_508218 ?auto_508224 ) ) ( not ( = ?auto_508218 ?auto_508225 ) ) ( not ( = ?auto_508218 ?auto_508226 ) ) ( not ( = ?auto_508218 ?auto_508227 ) ) ( not ( = ?auto_508218 ?auto_508228 ) ) ( not ( = ?auto_508218 ?auto_508229 ) ) ( not ( = ?auto_508218 ?auto_508230 ) ) ( not ( = ?auto_508218 ?auto_508231 ) ) ( not ( = ?auto_508218 ?auto_508232 ) ) ( not ( = ?auto_508219 ?auto_508220 ) ) ( not ( = ?auto_508219 ?auto_508221 ) ) ( not ( = ?auto_508219 ?auto_508222 ) ) ( not ( = ?auto_508219 ?auto_508223 ) ) ( not ( = ?auto_508219 ?auto_508224 ) ) ( not ( = ?auto_508219 ?auto_508225 ) ) ( not ( = ?auto_508219 ?auto_508226 ) ) ( not ( = ?auto_508219 ?auto_508227 ) ) ( not ( = ?auto_508219 ?auto_508228 ) ) ( not ( = ?auto_508219 ?auto_508229 ) ) ( not ( = ?auto_508219 ?auto_508230 ) ) ( not ( = ?auto_508219 ?auto_508231 ) ) ( not ( = ?auto_508219 ?auto_508232 ) ) ( not ( = ?auto_508220 ?auto_508221 ) ) ( not ( = ?auto_508220 ?auto_508222 ) ) ( not ( = ?auto_508220 ?auto_508223 ) ) ( not ( = ?auto_508220 ?auto_508224 ) ) ( not ( = ?auto_508220 ?auto_508225 ) ) ( not ( = ?auto_508220 ?auto_508226 ) ) ( not ( = ?auto_508220 ?auto_508227 ) ) ( not ( = ?auto_508220 ?auto_508228 ) ) ( not ( = ?auto_508220 ?auto_508229 ) ) ( not ( = ?auto_508220 ?auto_508230 ) ) ( not ( = ?auto_508220 ?auto_508231 ) ) ( not ( = ?auto_508220 ?auto_508232 ) ) ( not ( = ?auto_508221 ?auto_508222 ) ) ( not ( = ?auto_508221 ?auto_508223 ) ) ( not ( = ?auto_508221 ?auto_508224 ) ) ( not ( = ?auto_508221 ?auto_508225 ) ) ( not ( = ?auto_508221 ?auto_508226 ) ) ( not ( = ?auto_508221 ?auto_508227 ) ) ( not ( = ?auto_508221 ?auto_508228 ) ) ( not ( = ?auto_508221 ?auto_508229 ) ) ( not ( = ?auto_508221 ?auto_508230 ) ) ( not ( = ?auto_508221 ?auto_508231 ) ) ( not ( = ?auto_508221 ?auto_508232 ) ) ( not ( = ?auto_508222 ?auto_508223 ) ) ( not ( = ?auto_508222 ?auto_508224 ) ) ( not ( = ?auto_508222 ?auto_508225 ) ) ( not ( = ?auto_508222 ?auto_508226 ) ) ( not ( = ?auto_508222 ?auto_508227 ) ) ( not ( = ?auto_508222 ?auto_508228 ) ) ( not ( = ?auto_508222 ?auto_508229 ) ) ( not ( = ?auto_508222 ?auto_508230 ) ) ( not ( = ?auto_508222 ?auto_508231 ) ) ( not ( = ?auto_508222 ?auto_508232 ) ) ( not ( = ?auto_508223 ?auto_508224 ) ) ( not ( = ?auto_508223 ?auto_508225 ) ) ( not ( = ?auto_508223 ?auto_508226 ) ) ( not ( = ?auto_508223 ?auto_508227 ) ) ( not ( = ?auto_508223 ?auto_508228 ) ) ( not ( = ?auto_508223 ?auto_508229 ) ) ( not ( = ?auto_508223 ?auto_508230 ) ) ( not ( = ?auto_508223 ?auto_508231 ) ) ( not ( = ?auto_508223 ?auto_508232 ) ) ( not ( = ?auto_508224 ?auto_508225 ) ) ( not ( = ?auto_508224 ?auto_508226 ) ) ( not ( = ?auto_508224 ?auto_508227 ) ) ( not ( = ?auto_508224 ?auto_508228 ) ) ( not ( = ?auto_508224 ?auto_508229 ) ) ( not ( = ?auto_508224 ?auto_508230 ) ) ( not ( = ?auto_508224 ?auto_508231 ) ) ( not ( = ?auto_508224 ?auto_508232 ) ) ( not ( = ?auto_508225 ?auto_508226 ) ) ( not ( = ?auto_508225 ?auto_508227 ) ) ( not ( = ?auto_508225 ?auto_508228 ) ) ( not ( = ?auto_508225 ?auto_508229 ) ) ( not ( = ?auto_508225 ?auto_508230 ) ) ( not ( = ?auto_508225 ?auto_508231 ) ) ( not ( = ?auto_508225 ?auto_508232 ) ) ( not ( = ?auto_508226 ?auto_508227 ) ) ( not ( = ?auto_508226 ?auto_508228 ) ) ( not ( = ?auto_508226 ?auto_508229 ) ) ( not ( = ?auto_508226 ?auto_508230 ) ) ( not ( = ?auto_508226 ?auto_508231 ) ) ( not ( = ?auto_508226 ?auto_508232 ) ) ( not ( = ?auto_508227 ?auto_508228 ) ) ( not ( = ?auto_508227 ?auto_508229 ) ) ( not ( = ?auto_508227 ?auto_508230 ) ) ( not ( = ?auto_508227 ?auto_508231 ) ) ( not ( = ?auto_508227 ?auto_508232 ) ) ( not ( = ?auto_508228 ?auto_508229 ) ) ( not ( = ?auto_508228 ?auto_508230 ) ) ( not ( = ?auto_508228 ?auto_508231 ) ) ( not ( = ?auto_508228 ?auto_508232 ) ) ( not ( = ?auto_508229 ?auto_508230 ) ) ( not ( = ?auto_508229 ?auto_508231 ) ) ( not ( = ?auto_508229 ?auto_508232 ) ) ( not ( = ?auto_508230 ?auto_508231 ) ) ( not ( = ?auto_508230 ?auto_508232 ) ) ( not ( = ?auto_508231 ?auto_508232 ) ) ( ON ?auto_508231 ?auto_508232 ) ( ON ?auto_508230 ?auto_508231 ) ( ON ?auto_508229 ?auto_508230 ) ( ON ?auto_508228 ?auto_508229 ) ( ON ?auto_508227 ?auto_508228 ) ( CLEAR ?auto_508225 ) ( ON ?auto_508226 ?auto_508227 ) ( CLEAR ?auto_508226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_508217 ?auto_508218 ?auto_508219 ?auto_508220 ?auto_508221 ?auto_508222 ?auto_508223 ?auto_508224 ?auto_508225 ?auto_508226 )
      ( MAKE-16PILE ?auto_508217 ?auto_508218 ?auto_508219 ?auto_508220 ?auto_508221 ?auto_508222 ?auto_508223 ?auto_508224 ?auto_508225 ?auto_508226 ?auto_508227 ?auto_508228 ?auto_508229 ?auto_508230 ?auto_508231 ?auto_508232 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508249 - BLOCK
      ?auto_508250 - BLOCK
      ?auto_508251 - BLOCK
      ?auto_508252 - BLOCK
      ?auto_508253 - BLOCK
      ?auto_508254 - BLOCK
      ?auto_508255 - BLOCK
      ?auto_508256 - BLOCK
      ?auto_508257 - BLOCK
      ?auto_508258 - BLOCK
      ?auto_508259 - BLOCK
      ?auto_508260 - BLOCK
      ?auto_508261 - BLOCK
      ?auto_508262 - BLOCK
      ?auto_508263 - BLOCK
      ?auto_508264 - BLOCK
    )
    :vars
    (
      ?auto_508265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508264 ?auto_508265 ) ( ON-TABLE ?auto_508249 ) ( ON ?auto_508250 ?auto_508249 ) ( ON ?auto_508251 ?auto_508250 ) ( ON ?auto_508252 ?auto_508251 ) ( ON ?auto_508253 ?auto_508252 ) ( ON ?auto_508254 ?auto_508253 ) ( ON ?auto_508255 ?auto_508254 ) ( ON ?auto_508256 ?auto_508255 ) ( not ( = ?auto_508249 ?auto_508250 ) ) ( not ( = ?auto_508249 ?auto_508251 ) ) ( not ( = ?auto_508249 ?auto_508252 ) ) ( not ( = ?auto_508249 ?auto_508253 ) ) ( not ( = ?auto_508249 ?auto_508254 ) ) ( not ( = ?auto_508249 ?auto_508255 ) ) ( not ( = ?auto_508249 ?auto_508256 ) ) ( not ( = ?auto_508249 ?auto_508257 ) ) ( not ( = ?auto_508249 ?auto_508258 ) ) ( not ( = ?auto_508249 ?auto_508259 ) ) ( not ( = ?auto_508249 ?auto_508260 ) ) ( not ( = ?auto_508249 ?auto_508261 ) ) ( not ( = ?auto_508249 ?auto_508262 ) ) ( not ( = ?auto_508249 ?auto_508263 ) ) ( not ( = ?auto_508249 ?auto_508264 ) ) ( not ( = ?auto_508249 ?auto_508265 ) ) ( not ( = ?auto_508250 ?auto_508251 ) ) ( not ( = ?auto_508250 ?auto_508252 ) ) ( not ( = ?auto_508250 ?auto_508253 ) ) ( not ( = ?auto_508250 ?auto_508254 ) ) ( not ( = ?auto_508250 ?auto_508255 ) ) ( not ( = ?auto_508250 ?auto_508256 ) ) ( not ( = ?auto_508250 ?auto_508257 ) ) ( not ( = ?auto_508250 ?auto_508258 ) ) ( not ( = ?auto_508250 ?auto_508259 ) ) ( not ( = ?auto_508250 ?auto_508260 ) ) ( not ( = ?auto_508250 ?auto_508261 ) ) ( not ( = ?auto_508250 ?auto_508262 ) ) ( not ( = ?auto_508250 ?auto_508263 ) ) ( not ( = ?auto_508250 ?auto_508264 ) ) ( not ( = ?auto_508250 ?auto_508265 ) ) ( not ( = ?auto_508251 ?auto_508252 ) ) ( not ( = ?auto_508251 ?auto_508253 ) ) ( not ( = ?auto_508251 ?auto_508254 ) ) ( not ( = ?auto_508251 ?auto_508255 ) ) ( not ( = ?auto_508251 ?auto_508256 ) ) ( not ( = ?auto_508251 ?auto_508257 ) ) ( not ( = ?auto_508251 ?auto_508258 ) ) ( not ( = ?auto_508251 ?auto_508259 ) ) ( not ( = ?auto_508251 ?auto_508260 ) ) ( not ( = ?auto_508251 ?auto_508261 ) ) ( not ( = ?auto_508251 ?auto_508262 ) ) ( not ( = ?auto_508251 ?auto_508263 ) ) ( not ( = ?auto_508251 ?auto_508264 ) ) ( not ( = ?auto_508251 ?auto_508265 ) ) ( not ( = ?auto_508252 ?auto_508253 ) ) ( not ( = ?auto_508252 ?auto_508254 ) ) ( not ( = ?auto_508252 ?auto_508255 ) ) ( not ( = ?auto_508252 ?auto_508256 ) ) ( not ( = ?auto_508252 ?auto_508257 ) ) ( not ( = ?auto_508252 ?auto_508258 ) ) ( not ( = ?auto_508252 ?auto_508259 ) ) ( not ( = ?auto_508252 ?auto_508260 ) ) ( not ( = ?auto_508252 ?auto_508261 ) ) ( not ( = ?auto_508252 ?auto_508262 ) ) ( not ( = ?auto_508252 ?auto_508263 ) ) ( not ( = ?auto_508252 ?auto_508264 ) ) ( not ( = ?auto_508252 ?auto_508265 ) ) ( not ( = ?auto_508253 ?auto_508254 ) ) ( not ( = ?auto_508253 ?auto_508255 ) ) ( not ( = ?auto_508253 ?auto_508256 ) ) ( not ( = ?auto_508253 ?auto_508257 ) ) ( not ( = ?auto_508253 ?auto_508258 ) ) ( not ( = ?auto_508253 ?auto_508259 ) ) ( not ( = ?auto_508253 ?auto_508260 ) ) ( not ( = ?auto_508253 ?auto_508261 ) ) ( not ( = ?auto_508253 ?auto_508262 ) ) ( not ( = ?auto_508253 ?auto_508263 ) ) ( not ( = ?auto_508253 ?auto_508264 ) ) ( not ( = ?auto_508253 ?auto_508265 ) ) ( not ( = ?auto_508254 ?auto_508255 ) ) ( not ( = ?auto_508254 ?auto_508256 ) ) ( not ( = ?auto_508254 ?auto_508257 ) ) ( not ( = ?auto_508254 ?auto_508258 ) ) ( not ( = ?auto_508254 ?auto_508259 ) ) ( not ( = ?auto_508254 ?auto_508260 ) ) ( not ( = ?auto_508254 ?auto_508261 ) ) ( not ( = ?auto_508254 ?auto_508262 ) ) ( not ( = ?auto_508254 ?auto_508263 ) ) ( not ( = ?auto_508254 ?auto_508264 ) ) ( not ( = ?auto_508254 ?auto_508265 ) ) ( not ( = ?auto_508255 ?auto_508256 ) ) ( not ( = ?auto_508255 ?auto_508257 ) ) ( not ( = ?auto_508255 ?auto_508258 ) ) ( not ( = ?auto_508255 ?auto_508259 ) ) ( not ( = ?auto_508255 ?auto_508260 ) ) ( not ( = ?auto_508255 ?auto_508261 ) ) ( not ( = ?auto_508255 ?auto_508262 ) ) ( not ( = ?auto_508255 ?auto_508263 ) ) ( not ( = ?auto_508255 ?auto_508264 ) ) ( not ( = ?auto_508255 ?auto_508265 ) ) ( not ( = ?auto_508256 ?auto_508257 ) ) ( not ( = ?auto_508256 ?auto_508258 ) ) ( not ( = ?auto_508256 ?auto_508259 ) ) ( not ( = ?auto_508256 ?auto_508260 ) ) ( not ( = ?auto_508256 ?auto_508261 ) ) ( not ( = ?auto_508256 ?auto_508262 ) ) ( not ( = ?auto_508256 ?auto_508263 ) ) ( not ( = ?auto_508256 ?auto_508264 ) ) ( not ( = ?auto_508256 ?auto_508265 ) ) ( not ( = ?auto_508257 ?auto_508258 ) ) ( not ( = ?auto_508257 ?auto_508259 ) ) ( not ( = ?auto_508257 ?auto_508260 ) ) ( not ( = ?auto_508257 ?auto_508261 ) ) ( not ( = ?auto_508257 ?auto_508262 ) ) ( not ( = ?auto_508257 ?auto_508263 ) ) ( not ( = ?auto_508257 ?auto_508264 ) ) ( not ( = ?auto_508257 ?auto_508265 ) ) ( not ( = ?auto_508258 ?auto_508259 ) ) ( not ( = ?auto_508258 ?auto_508260 ) ) ( not ( = ?auto_508258 ?auto_508261 ) ) ( not ( = ?auto_508258 ?auto_508262 ) ) ( not ( = ?auto_508258 ?auto_508263 ) ) ( not ( = ?auto_508258 ?auto_508264 ) ) ( not ( = ?auto_508258 ?auto_508265 ) ) ( not ( = ?auto_508259 ?auto_508260 ) ) ( not ( = ?auto_508259 ?auto_508261 ) ) ( not ( = ?auto_508259 ?auto_508262 ) ) ( not ( = ?auto_508259 ?auto_508263 ) ) ( not ( = ?auto_508259 ?auto_508264 ) ) ( not ( = ?auto_508259 ?auto_508265 ) ) ( not ( = ?auto_508260 ?auto_508261 ) ) ( not ( = ?auto_508260 ?auto_508262 ) ) ( not ( = ?auto_508260 ?auto_508263 ) ) ( not ( = ?auto_508260 ?auto_508264 ) ) ( not ( = ?auto_508260 ?auto_508265 ) ) ( not ( = ?auto_508261 ?auto_508262 ) ) ( not ( = ?auto_508261 ?auto_508263 ) ) ( not ( = ?auto_508261 ?auto_508264 ) ) ( not ( = ?auto_508261 ?auto_508265 ) ) ( not ( = ?auto_508262 ?auto_508263 ) ) ( not ( = ?auto_508262 ?auto_508264 ) ) ( not ( = ?auto_508262 ?auto_508265 ) ) ( not ( = ?auto_508263 ?auto_508264 ) ) ( not ( = ?auto_508263 ?auto_508265 ) ) ( not ( = ?auto_508264 ?auto_508265 ) ) ( ON ?auto_508263 ?auto_508264 ) ( ON ?auto_508262 ?auto_508263 ) ( ON ?auto_508261 ?auto_508262 ) ( ON ?auto_508260 ?auto_508261 ) ( ON ?auto_508259 ?auto_508260 ) ( ON ?auto_508258 ?auto_508259 ) ( CLEAR ?auto_508256 ) ( ON ?auto_508257 ?auto_508258 ) ( CLEAR ?auto_508257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_508249 ?auto_508250 ?auto_508251 ?auto_508252 ?auto_508253 ?auto_508254 ?auto_508255 ?auto_508256 ?auto_508257 )
      ( MAKE-16PILE ?auto_508249 ?auto_508250 ?auto_508251 ?auto_508252 ?auto_508253 ?auto_508254 ?auto_508255 ?auto_508256 ?auto_508257 ?auto_508258 ?auto_508259 ?auto_508260 ?auto_508261 ?auto_508262 ?auto_508263 ?auto_508264 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508282 - BLOCK
      ?auto_508283 - BLOCK
      ?auto_508284 - BLOCK
      ?auto_508285 - BLOCK
      ?auto_508286 - BLOCK
      ?auto_508287 - BLOCK
      ?auto_508288 - BLOCK
      ?auto_508289 - BLOCK
      ?auto_508290 - BLOCK
      ?auto_508291 - BLOCK
      ?auto_508292 - BLOCK
      ?auto_508293 - BLOCK
      ?auto_508294 - BLOCK
      ?auto_508295 - BLOCK
      ?auto_508296 - BLOCK
      ?auto_508297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508297 ) ( ON-TABLE ?auto_508282 ) ( ON ?auto_508283 ?auto_508282 ) ( ON ?auto_508284 ?auto_508283 ) ( ON ?auto_508285 ?auto_508284 ) ( ON ?auto_508286 ?auto_508285 ) ( ON ?auto_508287 ?auto_508286 ) ( ON ?auto_508288 ?auto_508287 ) ( ON ?auto_508289 ?auto_508288 ) ( not ( = ?auto_508282 ?auto_508283 ) ) ( not ( = ?auto_508282 ?auto_508284 ) ) ( not ( = ?auto_508282 ?auto_508285 ) ) ( not ( = ?auto_508282 ?auto_508286 ) ) ( not ( = ?auto_508282 ?auto_508287 ) ) ( not ( = ?auto_508282 ?auto_508288 ) ) ( not ( = ?auto_508282 ?auto_508289 ) ) ( not ( = ?auto_508282 ?auto_508290 ) ) ( not ( = ?auto_508282 ?auto_508291 ) ) ( not ( = ?auto_508282 ?auto_508292 ) ) ( not ( = ?auto_508282 ?auto_508293 ) ) ( not ( = ?auto_508282 ?auto_508294 ) ) ( not ( = ?auto_508282 ?auto_508295 ) ) ( not ( = ?auto_508282 ?auto_508296 ) ) ( not ( = ?auto_508282 ?auto_508297 ) ) ( not ( = ?auto_508283 ?auto_508284 ) ) ( not ( = ?auto_508283 ?auto_508285 ) ) ( not ( = ?auto_508283 ?auto_508286 ) ) ( not ( = ?auto_508283 ?auto_508287 ) ) ( not ( = ?auto_508283 ?auto_508288 ) ) ( not ( = ?auto_508283 ?auto_508289 ) ) ( not ( = ?auto_508283 ?auto_508290 ) ) ( not ( = ?auto_508283 ?auto_508291 ) ) ( not ( = ?auto_508283 ?auto_508292 ) ) ( not ( = ?auto_508283 ?auto_508293 ) ) ( not ( = ?auto_508283 ?auto_508294 ) ) ( not ( = ?auto_508283 ?auto_508295 ) ) ( not ( = ?auto_508283 ?auto_508296 ) ) ( not ( = ?auto_508283 ?auto_508297 ) ) ( not ( = ?auto_508284 ?auto_508285 ) ) ( not ( = ?auto_508284 ?auto_508286 ) ) ( not ( = ?auto_508284 ?auto_508287 ) ) ( not ( = ?auto_508284 ?auto_508288 ) ) ( not ( = ?auto_508284 ?auto_508289 ) ) ( not ( = ?auto_508284 ?auto_508290 ) ) ( not ( = ?auto_508284 ?auto_508291 ) ) ( not ( = ?auto_508284 ?auto_508292 ) ) ( not ( = ?auto_508284 ?auto_508293 ) ) ( not ( = ?auto_508284 ?auto_508294 ) ) ( not ( = ?auto_508284 ?auto_508295 ) ) ( not ( = ?auto_508284 ?auto_508296 ) ) ( not ( = ?auto_508284 ?auto_508297 ) ) ( not ( = ?auto_508285 ?auto_508286 ) ) ( not ( = ?auto_508285 ?auto_508287 ) ) ( not ( = ?auto_508285 ?auto_508288 ) ) ( not ( = ?auto_508285 ?auto_508289 ) ) ( not ( = ?auto_508285 ?auto_508290 ) ) ( not ( = ?auto_508285 ?auto_508291 ) ) ( not ( = ?auto_508285 ?auto_508292 ) ) ( not ( = ?auto_508285 ?auto_508293 ) ) ( not ( = ?auto_508285 ?auto_508294 ) ) ( not ( = ?auto_508285 ?auto_508295 ) ) ( not ( = ?auto_508285 ?auto_508296 ) ) ( not ( = ?auto_508285 ?auto_508297 ) ) ( not ( = ?auto_508286 ?auto_508287 ) ) ( not ( = ?auto_508286 ?auto_508288 ) ) ( not ( = ?auto_508286 ?auto_508289 ) ) ( not ( = ?auto_508286 ?auto_508290 ) ) ( not ( = ?auto_508286 ?auto_508291 ) ) ( not ( = ?auto_508286 ?auto_508292 ) ) ( not ( = ?auto_508286 ?auto_508293 ) ) ( not ( = ?auto_508286 ?auto_508294 ) ) ( not ( = ?auto_508286 ?auto_508295 ) ) ( not ( = ?auto_508286 ?auto_508296 ) ) ( not ( = ?auto_508286 ?auto_508297 ) ) ( not ( = ?auto_508287 ?auto_508288 ) ) ( not ( = ?auto_508287 ?auto_508289 ) ) ( not ( = ?auto_508287 ?auto_508290 ) ) ( not ( = ?auto_508287 ?auto_508291 ) ) ( not ( = ?auto_508287 ?auto_508292 ) ) ( not ( = ?auto_508287 ?auto_508293 ) ) ( not ( = ?auto_508287 ?auto_508294 ) ) ( not ( = ?auto_508287 ?auto_508295 ) ) ( not ( = ?auto_508287 ?auto_508296 ) ) ( not ( = ?auto_508287 ?auto_508297 ) ) ( not ( = ?auto_508288 ?auto_508289 ) ) ( not ( = ?auto_508288 ?auto_508290 ) ) ( not ( = ?auto_508288 ?auto_508291 ) ) ( not ( = ?auto_508288 ?auto_508292 ) ) ( not ( = ?auto_508288 ?auto_508293 ) ) ( not ( = ?auto_508288 ?auto_508294 ) ) ( not ( = ?auto_508288 ?auto_508295 ) ) ( not ( = ?auto_508288 ?auto_508296 ) ) ( not ( = ?auto_508288 ?auto_508297 ) ) ( not ( = ?auto_508289 ?auto_508290 ) ) ( not ( = ?auto_508289 ?auto_508291 ) ) ( not ( = ?auto_508289 ?auto_508292 ) ) ( not ( = ?auto_508289 ?auto_508293 ) ) ( not ( = ?auto_508289 ?auto_508294 ) ) ( not ( = ?auto_508289 ?auto_508295 ) ) ( not ( = ?auto_508289 ?auto_508296 ) ) ( not ( = ?auto_508289 ?auto_508297 ) ) ( not ( = ?auto_508290 ?auto_508291 ) ) ( not ( = ?auto_508290 ?auto_508292 ) ) ( not ( = ?auto_508290 ?auto_508293 ) ) ( not ( = ?auto_508290 ?auto_508294 ) ) ( not ( = ?auto_508290 ?auto_508295 ) ) ( not ( = ?auto_508290 ?auto_508296 ) ) ( not ( = ?auto_508290 ?auto_508297 ) ) ( not ( = ?auto_508291 ?auto_508292 ) ) ( not ( = ?auto_508291 ?auto_508293 ) ) ( not ( = ?auto_508291 ?auto_508294 ) ) ( not ( = ?auto_508291 ?auto_508295 ) ) ( not ( = ?auto_508291 ?auto_508296 ) ) ( not ( = ?auto_508291 ?auto_508297 ) ) ( not ( = ?auto_508292 ?auto_508293 ) ) ( not ( = ?auto_508292 ?auto_508294 ) ) ( not ( = ?auto_508292 ?auto_508295 ) ) ( not ( = ?auto_508292 ?auto_508296 ) ) ( not ( = ?auto_508292 ?auto_508297 ) ) ( not ( = ?auto_508293 ?auto_508294 ) ) ( not ( = ?auto_508293 ?auto_508295 ) ) ( not ( = ?auto_508293 ?auto_508296 ) ) ( not ( = ?auto_508293 ?auto_508297 ) ) ( not ( = ?auto_508294 ?auto_508295 ) ) ( not ( = ?auto_508294 ?auto_508296 ) ) ( not ( = ?auto_508294 ?auto_508297 ) ) ( not ( = ?auto_508295 ?auto_508296 ) ) ( not ( = ?auto_508295 ?auto_508297 ) ) ( not ( = ?auto_508296 ?auto_508297 ) ) ( ON ?auto_508296 ?auto_508297 ) ( ON ?auto_508295 ?auto_508296 ) ( ON ?auto_508294 ?auto_508295 ) ( ON ?auto_508293 ?auto_508294 ) ( ON ?auto_508292 ?auto_508293 ) ( ON ?auto_508291 ?auto_508292 ) ( CLEAR ?auto_508289 ) ( ON ?auto_508290 ?auto_508291 ) ( CLEAR ?auto_508290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_508282 ?auto_508283 ?auto_508284 ?auto_508285 ?auto_508286 ?auto_508287 ?auto_508288 ?auto_508289 ?auto_508290 )
      ( MAKE-16PILE ?auto_508282 ?auto_508283 ?auto_508284 ?auto_508285 ?auto_508286 ?auto_508287 ?auto_508288 ?auto_508289 ?auto_508290 ?auto_508291 ?auto_508292 ?auto_508293 ?auto_508294 ?auto_508295 ?auto_508296 ?auto_508297 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508314 - BLOCK
      ?auto_508315 - BLOCK
      ?auto_508316 - BLOCK
      ?auto_508317 - BLOCK
      ?auto_508318 - BLOCK
      ?auto_508319 - BLOCK
      ?auto_508320 - BLOCK
      ?auto_508321 - BLOCK
      ?auto_508322 - BLOCK
      ?auto_508323 - BLOCK
      ?auto_508324 - BLOCK
      ?auto_508325 - BLOCK
      ?auto_508326 - BLOCK
      ?auto_508327 - BLOCK
      ?auto_508328 - BLOCK
      ?auto_508329 - BLOCK
    )
    :vars
    (
      ?auto_508330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508329 ?auto_508330 ) ( ON-TABLE ?auto_508314 ) ( ON ?auto_508315 ?auto_508314 ) ( ON ?auto_508316 ?auto_508315 ) ( ON ?auto_508317 ?auto_508316 ) ( ON ?auto_508318 ?auto_508317 ) ( ON ?auto_508319 ?auto_508318 ) ( ON ?auto_508320 ?auto_508319 ) ( not ( = ?auto_508314 ?auto_508315 ) ) ( not ( = ?auto_508314 ?auto_508316 ) ) ( not ( = ?auto_508314 ?auto_508317 ) ) ( not ( = ?auto_508314 ?auto_508318 ) ) ( not ( = ?auto_508314 ?auto_508319 ) ) ( not ( = ?auto_508314 ?auto_508320 ) ) ( not ( = ?auto_508314 ?auto_508321 ) ) ( not ( = ?auto_508314 ?auto_508322 ) ) ( not ( = ?auto_508314 ?auto_508323 ) ) ( not ( = ?auto_508314 ?auto_508324 ) ) ( not ( = ?auto_508314 ?auto_508325 ) ) ( not ( = ?auto_508314 ?auto_508326 ) ) ( not ( = ?auto_508314 ?auto_508327 ) ) ( not ( = ?auto_508314 ?auto_508328 ) ) ( not ( = ?auto_508314 ?auto_508329 ) ) ( not ( = ?auto_508314 ?auto_508330 ) ) ( not ( = ?auto_508315 ?auto_508316 ) ) ( not ( = ?auto_508315 ?auto_508317 ) ) ( not ( = ?auto_508315 ?auto_508318 ) ) ( not ( = ?auto_508315 ?auto_508319 ) ) ( not ( = ?auto_508315 ?auto_508320 ) ) ( not ( = ?auto_508315 ?auto_508321 ) ) ( not ( = ?auto_508315 ?auto_508322 ) ) ( not ( = ?auto_508315 ?auto_508323 ) ) ( not ( = ?auto_508315 ?auto_508324 ) ) ( not ( = ?auto_508315 ?auto_508325 ) ) ( not ( = ?auto_508315 ?auto_508326 ) ) ( not ( = ?auto_508315 ?auto_508327 ) ) ( not ( = ?auto_508315 ?auto_508328 ) ) ( not ( = ?auto_508315 ?auto_508329 ) ) ( not ( = ?auto_508315 ?auto_508330 ) ) ( not ( = ?auto_508316 ?auto_508317 ) ) ( not ( = ?auto_508316 ?auto_508318 ) ) ( not ( = ?auto_508316 ?auto_508319 ) ) ( not ( = ?auto_508316 ?auto_508320 ) ) ( not ( = ?auto_508316 ?auto_508321 ) ) ( not ( = ?auto_508316 ?auto_508322 ) ) ( not ( = ?auto_508316 ?auto_508323 ) ) ( not ( = ?auto_508316 ?auto_508324 ) ) ( not ( = ?auto_508316 ?auto_508325 ) ) ( not ( = ?auto_508316 ?auto_508326 ) ) ( not ( = ?auto_508316 ?auto_508327 ) ) ( not ( = ?auto_508316 ?auto_508328 ) ) ( not ( = ?auto_508316 ?auto_508329 ) ) ( not ( = ?auto_508316 ?auto_508330 ) ) ( not ( = ?auto_508317 ?auto_508318 ) ) ( not ( = ?auto_508317 ?auto_508319 ) ) ( not ( = ?auto_508317 ?auto_508320 ) ) ( not ( = ?auto_508317 ?auto_508321 ) ) ( not ( = ?auto_508317 ?auto_508322 ) ) ( not ( = ?auto_508317 ?auto_508323 ) ) ( not ( = ?auto_508317 ?auto_508324 ) ) ( not ( = ?auto_508317 ?auto_508325 ) ) ( not ( = ?auto_508317 ?auto_508326 ) ) ( not ( = ?auto_508317 ?auto_508327 ) ) ( not ( = ?auto_508317 ?auto_508328 ) ) ( not ( = ?auto_508317 ?auto_508329 ) ) ( not ( = ?auto_508317 ?auto_508330 ) ) ( not ( = ?auto_508318 ?auto_508319 ) ) ( not ( = ?auto_508318 ?auto_508320 ) ) ( not ( = ?auto_508318 ?auto_508321 ) ) ( not ( = ?auto_508318 ?auto_508322 ) ) ( not ( = ?auto_508318 ?auto_508323 ) ) ( not ( = ?auto_508318 ?auto_508324 ) ) ( not ( = ?auto_508318 ?auto_508325 ) ) ( not ( = ?auto_508318 ?auto_508326 ) ) ( not ( = ?auto_508318 ?auto_508327 ) ) ( not ( = ?auto_508318 ?auto_508328 ) ) ( not ( = ?auto_508318 ?auto_508329 ) ) ( not ( = ?auto_508318 ?auto_508330 ) ) ( not ( = ?auto_508319 ?auto_508320 ) ) ( not ( = ?auto_508319 ?auto_508321 ) ) ( not ( = ?auto_508319 ?auto_508322 ) ) ( not ( = ?auto_508319 ?auto_508323 ) ) ( not ( = ?auto_508319 ?auto_508324 ) ) ( not ( = ?auto_508319 ?auto_508325 ) ) ( not ( = ?auto_508319 ?auto_508326 ) ) ( not ( = ?auto_508319 ?auto_508327 ) ) ( not ( = ?auto_508319 ?auto_508328 ) ) ( not ( = ?auto_508319 ?auto_508329 ) ) ( not ( = ?auto_508319 ?auto_508330 ) ) ( not ( = ?auto_508320 ?auto_508321 ) ) ( not ( = ?auto_508320 ?auto_508322 ) ) ( not ( = ?auto_508320 ?auto_508323 ) ) ( not ( = ?auto_508320 ?auto_508324 ) ) ( not ( = ?auto_508320 ?auto_508325 ) ) ( not ( = ?auto_508320 ?auto_508326 ) ) ( not ( = ?auto_508320 ?auto_508327 ) ) ( not ( = ?auto_508320 ?auto_508328 ) ) ( not ( = ?auto_508320 ?auto_508329 ) ) ( not ( = ?auto_508320 ?auto_508330 ) ) ( not ( = ?auto_508321 ?auto_508322 ) ) ( not ( = ?auto_508321 ?auto_508323 ) ) ( not ( = ?auto_508321 ?auto_508324 ) ) ( not ( = ?auto_508321 ?auto_508325 ) ) ( not ( = ?auto_508321 ?auto_508326 ) ) ( not ( = ?auto_508321 ?auto_508327 ) ) ( not ( = ?auto_508321 ?auto_508328 ) ) ( not ( = ?auto_508321 ?auto_508329 ) ) ( not ( = ?auto_508321 ?auto_508330 ) ) ( not ( = ?auto_508322 ?auto_508323 ) ) ( not ( = ?auto_508322 ?auto_508324 ) ) ( not ( = ?auto_508322 ?auto_508325 ) ) ( not ( = ?auto_508322 ?auto_508326 ) ) ( not ( = ?auto_508322 ?auto_508327 ) ) ( not ( = ?auto_508322 ?auto_508328 ) ) ( not ( = ?auto_508322 ?auto_508329 ) ) ( not ( = ?auto_508322 ?auto_508330 ) ) ( not ( = ?auto_508323 ?auto_508324 ) ) ( not ( = ?auto_508323 ?auto_508325 ) ) ( not ( = ?auto_508323 ?auto_508326 ) ) ( not ( = ?auto_508323 ?auto_508327 ) ) ( not ( = ?auto_508323 ?auto_508328 ) ) ( not ( = ?auto_508323 ?auto_508329 ) ) ( not ( = ?auto_508323 ?auto_508330 ) ) ( not ( = ?auto_508324 ?auto_508325 ) ) ( not ( = ?auto_508324 ?auto_508326 ) ) ( not ( = ?auto_508324 ?auto_508327 ) ) ( not ( = ?auto_508324 ?auto_508328 ) ) ( not ( = ?auto_508324 ?auto_508329 ) ) ( not ( = ?auto_508324 ?auto_508330 ) ) ( not ( = ?auto_508325 ?auto_508326 ) ) ( not ( = ?auto_508325 ?auto_508327 ) ) ( not ( = ?auto_508325 ?auto_508328 ) ) ( not ( = ?auto_508325 ?auto_508329 ) ) ( not ( = ?auto_508325 ?auto_508330 ) ) ( not ( = ?auto_508326 ?auto_508327 ) ) ( not ( = ?auto_508326 ?auto_508328 ) ) ( not ( = ?auto_508326 ?auto_508329 ) ) ( not ( = ?auto_508326 ?auto_508330 ) ) ( not ( = ?auto_508327 ?auto_508328 ) ) ( not ( = ?auto_508327 ?auto_508329 ) ) ( not ( = ?auto_508327 ?auto_508330 ) ) ( not ( = ?auto_508328 ?auto_508329 ) ) ( not ( = ?auto_508328 ?auto_508330 ) ) ( not ( = ?auto_508329 ?auto_508330 ) ) ( ON ?auto_508328 ?auto_508329 ) ( ON ?auto_508327 ?auto_508328 ) ( ON ?auto_508326 ?auto_508327 ) ( ON ?auto_508325 ?auto_508326 ) ( ON ?auto_508324 ?auto_508325 ) ( ON ?auto_508323 ?auto_508324 ) ( ON ?auto_508322 ?auto_508323 ) ( CLEAR ?auto_508320 ) ( ON ?auto_508321 ?auto_508322 ) ( CLEAR ?auto_508321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_508314 ?auto_508315 ?auto_508316 ?auto_508317 ?auto_508318 ?auto_508319 ?auto_508320 ?auto_508321 )
      ( MAKE-16PILE ?auto_508314 ?auto_508315 ?auto_508316 ?auto_508317 ?auto_508318 ?auto_508319 ?auto_508320 ?auto_508321 ?auto_508322 ?auto_508323 ?auto_508324 ?auto_508325 ?auto_508326 ?auto_508327 ?auto_508328 ?auto_508329 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508347 - BLOCK
      ?auto_508348 - BLOCK
      ?auto_508349 - BLOCK
      ?auto_508350 - BLOCK
      ?auto_508351 - BLOCK
      ?auto_508352 - BLOCK
      ?auto_508353 - BLOCK
      ?auto_508354 - BLOCK
      ?auto_508355 - BLOCK
      ?auto_508356 - BLOCK
      ?auto_508357 - BLOCK
      ?auto_508358 - BLOCK
      ?auto_508359 - BLOCK
      ?auto_508360 - BLOCK
      ?auto_508361 - BLOCK
      ?auto_508362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508362 ) ( ON-TABLE ?auto_508347 ) ( ON ?auto_508348 ?auto_508347 ) ( ON ?auto_508349 ?auto_508348 ) ( ON ?auto_508350 ?auto_508349 ) ( ON ?auto_508351 ?auto_508350 ) ( ON ?auto_508352 ?auto_508351 ) ( ON ?auto_508353 ?auto_508352 ) ( not ( = ?auto_508347 ?auto_508348 ) ) ( not ( = ?auto_508347 ?auto_508349 ) ) ( not ( = ?auto_508347 ?auto_508350 ) ) ( not ( = ?auto_508347 ?auto_508351 ) ) ( not ( = ?auto_508347 ?auto_508352 ) ) ( not ( = ?auto_508347 ?auto_508353 ) ) ( not ( = ?auto_508347 ?auto_508354 ) ) ( not ( = ?auto_508347 ?auto_508355 ) ) ( not ( = ?auto_508347 ?auto_508356 ) ) ( not ( = ?auto_508347 ?auto_508357 ) ) ( not ( = ?auto_508347 ?auto_508358 ) ) ( not ( = ?auto_508347 ?auto_508359 ) ) ( not ( = ?auto_508347 ?auto_508360 ) ) ( not ( = ?auto_508347 ?auto_508361 ) ) ( not ( = ?auto_508347 ?auto_508362 ) ) ( not ( = ?auto_508348 ?auto_508349 ) ) ( not ( = ?auto_508348 ?auto_508350 ) ) ( not ( = ?auto_508348 ?auto_508351 ) ) ( not ( = ?auto_508348 ?auto_508352 ) ) ( not ( = ?auto_508348 ?auto_508353 ) ) ( not ( = ?auto_508348 ?auto_508354 ) ) ( not ( = ?auto_508348 ?auto_508355 ) ) ( not ( = ?auto_508348 ?auto_508356 ) ) ( not ( = ?auto_508348 ?auto_508357 ) ) ( not ( = ?auto_508348 ?auto_508358 ) ) ( not ( = ?auto_508348 ?auto_508359 ) ) ( not ( = ?auto_508348 ?auto_508360 ) ) ( not ( = ?auto_508348 ?auto_508361 ) ) ( not ( = ?auto_508348 ?auto_508362 ) ) ( not ( = ?auto_508349 ?auto_508350 ) ) ( not ( = ?auto_508349 ?auto_508351 ) ) ( not ( = ?auto_508349 ?auto_508352 ) ) ( not ( = ?auto_508349 ?auto_508353 ) ) ( not ( = ?auto_508349 ?auto_508354 ) ) ( not ( = ?auto_508349 ?auto_508355 ) ) ( not ( = ?auto_508349 ?auto_508356 ) ) ( not ( = ?auto_508349 ?auto_508357 ) ) ( not ( = ?auto_508349 ?auto_508358 ) ) ( not ( = ?auto_508349 ?auto_508359 ) ) ( not ( = ?auto_508349 ?auto_508360 ) ) ( not ( = ?auto_508349 ?auto_508361 ) ) ( not ( = ?auto_508349 ?auto_508362 ) ) ( not ( = ?auto_508350 ?auto_508351 ) ) ( not ( = ?auto_508350 ?auto_508352 ) ) ( not ( = ?auto_508350 ?auto_508353 ) ) ( not ( = ?auto_508350 ?auto_508354 ) ) ( not ( = ?auto_508350 ?auto_508355 ) ) ( not ( = ?auto_508350 ?auto_508356 ) ) ( not ( = ?auto_508350 ?auto_508357 ) ) ( not ( = ?auto_508350 ?auto_508358 ) ) ( not ( = ?auto_508350 ?auto_508359 ) ) ( not ( = ?auto_508350 ?auto_508360 ) ) ( not ( = ?auto_508350 ?auto_508361 ) ) ( not ( = ?auto_508350 ?auto_508362 ) ) ( not ( = ?auto_508351 ?auto_508352 ) ) ( not ( = ?auto_508351 ?auto_508353 ) ) ( not ( = ?auto_508351 ?auto_508354 ) ) ( not ( = ?auto_508351 ?auto_508355 ) ) ( not ( = ?auto_508351 ?auto_508356 ) ) ( not ( = ?auto_508351 ?auto_508357 ) ) ( not ( = ?auto_508351 ?auto_508358 ) ) ( not ( = ?auto_508351 ?auto_508359 ) ) ( not ( = ?auto_508351 ?auto_508360 ) ) ( not ( = ?auto_508351 ?auto_508361 ) ) ( not ( = ?auto_508351 ?auto_508362 ) ) ( not ( = ?auto_508352 ?auto_508353 ) ) ( not ( = ?auto_508352 ?auto_508354 ) ) ( not ( = ?auto_508352 ?auto_508355 ) ) ( not ( = ?auto_508352 ?auto_508356 ) ) ( not ( = ?auto_508352 ?auto_508357 ) ) ( not ( = ?auto_508352 ?auto_508358 ) ) ( not ( = ?auto_508352 ?auto_508359 ) ) ( not ( = ?auto_508352 ?auto_508360 ) ) ( not ( = ?auto_508352 ?auto_508361 ) ) ( not ( = ?auto_508352 ?auto_508362 ) ) ( not ( = ?auto_508353 ?auto_508354 ) ) ( not ( = ?auto_508353 ?auto_508355 ) ) ( not ( = ?auto_508353 ?auto_508356 ) ) ( not ( = ?auto_508353 ?auto_508357 ) ) ( not ( = ?auto_508353 ?auto_508358 ) ) ( not ( = ?auto_508353 ?auto_508359 ) ) ( not ( = ?auto_508353 ?auto_508360 ) ) ( not ( = ?auto_508353 ?auto_508361 ) ) ( not ( = ?auto_508353 ?auto_508362 ) ) ( not ( = ?auto_508354 ?auto_508355 ) ) ( not ( = ?auto_508354 ?auto_508356 ) ) ( not ( = ?auto_508354 ?auto_508357 ) ) ( not ( = ?auto_508354 ?auto_508358 ) ) ( not ( = ?auto_508354 ?auto_508359 ) ) ( not ( = ?auto_508354 ?auto_508360 ) ) ( not ( = ?auto_508354 ?auto_508361 ) ) ( not ( = ?auto_508354 ?auto_508362 ) ) ( not ( = ?auto_508355 ?auto_508356 ) ) ( not ( = ?auto_508355 ?auto_508357 ) ) ( not ( = ?auto_508355 ?auto_508358 ) ) ( not ( = ?auto_508355 ?auto_508359 ) ) ( not ( = ?auto_508355 ?auto_508360 ) ) ( not ( = ?auto_508355 ?auto_508361 ) ) ( not ( = ?auto_508355 ?auto_508362 ) ) ( not ( = ?auto_508356 ?auto_508357 ) ) ( not ( = ?auto_508356 ?auto_508358 ) ) ( not ( = ?auto_508356 ?auto_508359 ) ) ( not ( = ?auto_508356 ?auto_508360 ) ) ( not ( = ?auto_508356 ?auto_508361 ) ) ( not ( = ?auto_508356 ?auto_508362 ) ) ( not ( = ?auto_508357 ?auto_508358 ) ) ( not ( = ?auto_508357 ?auto_508359 ) ) ( not ( = ?auto_508357 ?auto_508360 ) ) ( not ( = ?auto_508357 ?auto_508361 ) ) ( not ( = ?auto_508357 ?auto_508362 ) ) ( not ( = ?auto_508358 ?auto_508359 ) ) ( not ( = ?auto_508358 ?auto_508360 ) ) ( not ( = ?auto_508358 ?auto_508361 ) ) ( not ( = ?auto_508358 ?auto_508362 ) ) ( not ( = ?auto_508359 ?auto_508360 ) ) ( not ( = ?auto_508359 ?auto_508361 ) ) ( not ( = ?auto_508359 ?auto_508362 ) ) ( not ( = ?auto_508360 ?auto_508361 ) ) ( not ( = ?auto_508360 ?auto_508362 ) ) ( not ( = ?auto_508361 ?auto_508362 ) ) ( ON ?auto_508361 ?auto_508362 ) ( ON ?auto_508360 ?auto_508361 ) ( ON ?auto_508359 ?auto_508360 ) ( ON ?auto_508358 ?auto_508359 ) ( ON ?auto_508357 ?auto_508358 ) ( ON ?auto_508356 ?auto_508357 ) ( ON ?auto_508355 ?auto_508356 ) ( CLEAR ?auto_508353 ) ( ON ?auto_508354 ?auto_508355 ) ( CLEAR ?auto_508354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_508347 ?auto_508348 ?auto_508349 ?auto_508350 ?auto_508351 ?auto_508352 ?auto_508353 ?auto_508354 )
      ( MAKE-16PILE ?auto_508347 ?auto_508348 ?auto_508349 ?auto_508350 ?auto_508351 ?auto_508352 ?auto_508353 ?auto_508354 ?auto_508355 ?auto_508356 ?auto_508357 ?auto_508358 ?auto_508359 ?auto_508360 ?auto_508361 ?auto_508362 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508379 - BLOCK
      ?auto_508380 - BLOCK
      ?auto_508381 - BLOCK
      ?auto_508382 - BLOCK
      ?auto_508383 - BLOCK
      ?auto_508384 - BLOCK
      ?auto_508385 - BLOCK
      ?auto_508386 - BLOCK
      ?auto_508387 - BLOCK
      ?auto_508388 - BLOCK
      ?auto_508389 - BLOCK
      ?auto_508390 - BLOCK
      ?auto_508391 - BLOCK
      ?auto_508392 - BLOCK
      ?auto_508393 - BLOCK
      ?auto_508394 - BLOCK
    )
    :vars
    (
      ?auto_508395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508394 ?auto_508395 ) ( ON-TABLE ?auto_508379 ) ( ON ?auto_508380 ?auto_508379 ) ( ON ?auto_508381 ?auto_508380 ) ( ON ?auto_508382 ?auto_508381 ) ( ON ?auto_508383 ?auto_508382 ) ( ON ?auto_508384 ?auto_508383 ) ( not ( = ?auto_508379 ?auto_508380 ) ) ( not ( = ?auto_508379 ?auto_508381 ) ) ( not ( = ?auto_508379 ?auto_508382 ) ) ( not ( = ?auto_508379 ?auto_508383 ) ) ( not ( = ?auto_508379 ?auto_508384 ) ) ( not ( = ?auto_508379 ?auto_508385 ) ) ( not ( = ?auto_508379 ?auto_508386 ) ) ( not ( = ?auto_508379 ?auto_508387 ) ) ( not ( = ?auto_508379 ?auto_508388 ) ) ( not ( = ?auto_508379 ?auto_508389 ) ) ( not ( = ?auto_508379 ?auto_508390 ) ) ( not ( = ?auto_508379 ?auto_508391 ) ) ( not ( = ?auto_508379 ?auto_508392 ) ) ( not ( = ?auto_508379 ?auto_508393 ) ) ( not ( = ?auto_508379 ?auto_508394 ) ) ( not ( = ?auto_508379 ?auto_508395 ) ) ( not ( = ?auto_508380 ?auto_508381 ) ) ( not ( = ?auto_508380 ?auto_508382 ) ) ( not ( = ?auto_508380 ?auto_508383 ) ) ( not ( = ?auto_508380 ?auto_508384 ) ) ( not ( = ?auto_508380 ?auto_508385 ) ) ( not ( = ?auto_508380 ?auto_508386 ) ) ( not ( = ?auto_508380 ?auto_508387 ) ) ( not ( = ?auto_508380 ?auto_508388 ) ) ( not ( = ?auto_508380 ?auto_508389 ) ) ( not ( = ?auto_508380 ?auto_508390 ) ) ( not ( = ?auto_508380 ?auto_508391 ) ) ( not ( = ?auto_508380 ?auto_508392 ) ) ( not ( = ?auto_508380 ?auto_508393 ) ) ( not ( = ?auto_508380 ?auto_508394 ) ) ( not ( = ?auto_508380 ?auto_508395 ) ) ( not ( = ?auto_508381 ?auto_508382 ) ) ( not ( = ?auto_508381 ?auto_508383 ) ) ( not ( = ?auto_508381 ?auto_508384 ) ) ( not ( = ?auto_508381 ?auto_508385 ) ) ( not ( = ?auto_508381 ?auto_508386 ) ) ( not ( = ?auto_508381 ?auto_508387 ) ) ( not ( = ?auto_508381 ?auto_508388 ) ) ( not ( = ?auto_508381 ?auto_508389 ) ) ( not ( = ?auto_508381 ?auto_508390 ) ) ( not ( = ?auto_508381 ?auto_508391 ) ) ( not ( = ?auto_508381 ?auto_508392 ) ) ( not ( = ?auto_508381 ?auto_508393 ) ) ( not ( = ?auto_508381 ?auto_508394 ) ) ( not ( = ?auto_508381 ?auto_508395 ) ) ( not ( = ?auto_508382 ?auto_508383 ) ) ( not ( = ?auto_508382 ?auto_508384 ) ) ( not ( = ?auto_508382 ?auto_508385 ) ) ( not ( = ?auto_508382 ?auto_508386 ) ) ( not ( = ?auto_508382 ?auto_508387 ) ) ( not ( = ?auto_508382 ?auto_508388 ) ) ( not ( = ?auto_508382 ?auto_508389 ) ) ( not ( = ?auto_508382 ?auto_508390 ) ) ( not ( = ?auto_508382 ?auto_508391 ) ) ( not ( = ?auto_508382 ?auto_508392 ) ) ( not ( = ?auto_508382 ?auto_508393 ) ) ( not ( = ?auto_508382 ?auto_508394 ) ) ( not ( = ?auto_508382 ?auto_508395 ) ) ( not ( = ?auto_508383 ?auto_508384 ) ) ( not ( = ?auto_508383 ?auto_508385 ) ) ( not ( = ?auto_508383 ?auto_508386 ) ) ( not ( = ?auto_508383 ?auto_508387 ) ) ( not ( = ?auto_508383 ?auto_508388 ) ) ( not ( = ?auto_508383 ?auto_508389 ) ) ( not ( = ?auto_508383 ?auto_508390 ) ) ( not ( = ?auto_508383 ?auto_508391 ) ) ( not ( = ?auto_508383 ?auto_508392 ) ) ( not ( = ?auto_508383 ?auto_508393 ) ) ( not ( = ?auto_508383 ?auto_508394 ) ) ( not ( = ?auto_508383 ?auto_508395 ) ) ( not ( = ?auto_508384 ?auto_508385 ) ) ( not ( = ?auto_508384 ?auto_508386 ) ) ( not ( = ?auto_508384 ?auto_508387 ) ) ( not ( = ?auto_508384 ?auto_508388 ) ) ( not ( = ?auto_508384 ?auto_508389 ) ) ( not ( = ?auto_508384 ?auto_508390 ) ) ( not ( = ?auto_508384 ?auto_508391 ) ) ( not ( = ?auto_508384 ?auto_508392 ) ) ( not ( = ?auto_508384 ?auto_508393 ) ) ( not ( = ?auto_508384 ?auto_508394 ) ) ( not ( = ?auto_508384 ?auto_508395 ) ) ( not ( = ?auto_508385 ?auto_508386 ) ) ( not ( = ?auto_508385 ?auto_508387 ) ) ( not ( = ?auto_508385 ?auto_508388 ) ) ( not ( = ?auto_508385 ?auto_508389 ) ) ( not ( = ?auto_508385 ?auto_508390 ) ) ( not ( = ?auto_508385 ?auto_508391 ) ) ( not ( = ?auto_508385 ?auto_508392 ) ) ( not ( = ?auto_508385 ?auto_508393 ) ) ( not ( = ?auto_508385 ?auto_508394 ) ) ( not ( = ?auto_508385 ?auto_508395 ) ) ( not ( = ?auto_508386 ?auto_508387 ) ) ( not ( = ?auto_508386 ?auto_508388 ) ) ( not ( = ?auto_508386 ?auto_508389 ) ) ( not ( = ?auto_508386 ?auto_508390 ) ) ( not ( = ?auto_508386 ?auto_508391 ) ) ( not ( = ?auto_508386 ?auto_508392 ) ) ( not ( = ?auto_508386 ?auto_508393 ) ) ( not ( = ?auto_508386 ?auto_508394 ) ) ( not ( = ?auto_508386 ?auto_508395 ) ) ( not ( = ?auto_508387 ?auto_508388 ) ) ( not ( = ?auto_508387 ?auto_508389 ) ) ( not ( = ?auto_508387 ?auto_508390 ) ) ( not ( = ?auto_508387 ?auto_508391 ) ) ( not ( = ?auto_508387 ?auto_508392 ) ) ( not ( = ?auto_508387 ?auto_508393 ) ) ( not ( = ?auto_508387 ?auto_508394 ) ) ( not ( = ?auto_508387 ?auto_508395 ) ) ( not ( = ?auto_508388 ?auto_508389 ) ) ( not ( = ?auto_508388 ?auto_508390 ) ) ( not ( = ?auto_508388 ?auto_508391 ) ) ( not ( = ?auto_508388 ?auto_508392 ) ) ( not ( = ?auto_508388 ?auto_508393 ) ) ( not ( = ?auto_508388 ?auto_508394 ) ) ( not ( = ?auto_508388 ?auto_508395 ) ) ( not ( = ?auto_508389 ?auto_508390 ) ) ( not ( = ?auto_508389 ?auto_508391 ) ) ( not ( = ?auto_508389 ?auto_508392 ) ) ( not ( = ?auto_508389 ?auto_508393 ) ) ( not ( = ?auto_508389 ?auto_508394 ) ) ( not ( = ?auto_508389 ?auto_508395 ) ) ( not ( = ?auto_508390 ?auto_508391 ) ) ( not ( = ?auto_508390 ?auto_508392 ) ) ( not ( = ?auto_508390 ?auto_508393 ) ) ( not ( = ?auto_508390 ?auto_508394 ) ) ( not ( = ?auto_508390 ?auto_508395 ) ) ( not ( = ?auto_508391 ?auto_508392 ) ) ( not ( = ?auto_508391 ?auto_508393 ) ) ( not ( = ?auto_508391 ?auto_508394 ) ) ( not ( = ?auto_508391 ?auto_508395 ) ) ( not ( = ?auto_508392 ?auto_508393 ) ) ( not ( = ?auto_508392 ?auto_508394 ) ) ( not ( = ?auto_508392 ?auto_508395 ) ) ( not ( = ?auto_508393 ?auto_508394 ) ) ( not ( = ?auto_508393 ?auto_508395 ) ) ( not ( = ?auto_508394 ?auto_508395 ) ) ( ON ?auto_508393 ?auto_508394 ) ( ON ?auto_508392 ?auto_508393 ) ( ON ?auto_508391 ?auto_508392 ) ( ON ?auto_508390 ?auto_508391 ) ( ON ?auto_508389 ?auto_508390 ) ( ON ?auto_508388 ?auto_508389 ) ( ON ?auto_508387 ?auto_508388 ) ( ON ?auto_508386 ?auto_508387 ) ( CLEAR ?auto_508384 ) ( ON ?auto_508385 ?auto_508386 ) ( CLEAR ?auto_508385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_508379 ?auto_508380 ?auto_508381 ?auto_508382 ?auto_508383 ?auto_508384 ?auto_508385 )
      ( MAKE-16PILE ?auto_508379 ?auto_508380 ?auto_508381 ?auto_508382 ?auto_508383 ?auto_508384 ?auto_508385 ?auto_508386 ?auto_508387 ?auto_508388 ?auto_508389 ?auto_508390 ?auto_508391 ?auto_508392 ?auto_508393 ?auto_508394 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508412 - BLOCK
      ?auto_508413 - BLOCK
      ?auto_508414 - BLOCK
      ?auto_508415 - BLOCK
      ?auto_508416 - BLOCK
      ?auto_508417 - BLOCK
      ?auto_508418 - BLOCK
      ?auto_508419 - BLOCK
      ?auto_508420 - BLOCK
      ?auto_508421 - BLOCK
      ?auto_508422 - BLOCK
      ?auto_508423 - BLOCK
      ?auto_508424 - BLOCK
      ?auto_508425 - BLOCK
      ?auto_508426 - BLOCK
      ?auto_508427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508427 ) ( ON-TABLE ?auto_508412 ) ( ON ?auto_508413 ?auto_508412 ) ( ON ?auto_508414 ?auto_508413 ) ( ON ?auto_508415 ?auto_508414 ) ( ON ?auto_508416 ?auto_508415 ) ( ON ?auto_508417 ?auto_508416 ) ( not ( = ?auto_508412 ?auto_508413 ) ) ( not ( = ?auto_508412 ?auto_508414 ) ) ( not ( = ?auto_508412 ?auto_508415 ) ) ( not ( = ?auto_508412 ?auto_508416 ) ) ( not ( = ?auto_508412 ?auto_508417 ) ) ( not ( = ?auto_508412 ?auto_508418 ) ) ( not ( = ?auto_508412 ?auto_508419 ) ) ( not ( = ?auto_508412 ?auto_508420 ) ) ( not ( = ?auto_508412 ?auto_508421 ) ) ( not ( = ?auto_508412 ?auto_508422 ) ) ( not ( = ?auto_508412 ?auto_508423 ) ) ( not ( = ?auto_508412 ?auto_508424 ) ) ( not ( = ?auto_508412 ?auto_508425 ) ) ( not ( = ?auto_508412 ?auto_508426 ) ) ( not ( = ?auto_508412 ?auto_508427 ) ) ( not ( = ?auto_508413 ?auto_508414 ) ) ( not ( = ?auto_508413 ?auto_508415 ) ) ( not ( = ?auto_508413 ?auto_508416 ) ) ( not ( = ?auto_508413 ?auto_508417 ) ) ( not ( = ?auto_508413 ?auto_508418 ) ) ( not ( = ?auto_508413 ?auto_508419 ) ) ( not ( = ?auto_508413 ?auto_508420 ) ) ( not ( = ?auto_508413 ?auto_508421 ) ) ( not ( = ?auto_508413 ?auto_508422 ) ) ( not ( = ?auto_508413 ?auto_508423 ) ) ( not ( = ?auto_508413 ?auto_508424 ) ) ( not ( = ?auto_508413 ?auto_508425 ) ) ( not ( = ?auto_508413 ?auto_508426 ) ) ( not ( = ?auto_508413 ?auto_508427 ) ) ( not ( = ?auto_508414 ?auto_508415 ) ) ( not ( = ?auto_508414 ?auto_508416 ) ) ( not ( = ?auto_508414 ?auto_508417 ) ) ( not ( = ?auto_508414 ?auto_508418 ) ) ( not ( = ?auto_508414 ?auto_508419 ) ) ( not ( = ?auto_508414 ?auto_508420 ) ) ( not ( = ?auto_508414 ?auto_508421 ) ) ( not ( = ?auto_508414 ?auto_508422 ) ) ( not ( = ?auto_508414 ?auto_508423 ) ) ( not ( = ?auto_508414 ?auto_508424 ) ) ( not ( = ?auto_508414 ?auto_508425 ) ) ( not ( = ?auto_508414 ?auto_508426 ) ) ( not ( = ?auto_508414 ?auto_508427 ) ) ( not ( = ?auto_508415 ?auto_508416 ) ) ( not ( = ?auto_508415 ?auto_508417 ) ) ( not ( = ?auto_508415 ?auto_508418 ) ) ( not ( = ?auto_508415 ?auto_508419 ) ) ( not ( = ?auto_508415 ?auto_508420 ) ) ( not ( = ?auto_508415 ?auto_508421 ) ) ( not ( = ?auto_508415 ?auto_508422 ) ) ( not ( = ?auto_508415 ?auto_508423 ) ) ( not ( = ?auto_508415 ?auto_508424 ) ) ( not ( = ?auto_508415 ?auto_508425 ) ) ( not ( = ?auto_508415 ?auto_508426 ) ) ( not ( = ?auto_508415 ?auto_508427 ) ) ( not ( = ?auto_508416 ?auto_508417 ) ) ( not ( = ?auto_508416 ?auto_508418 ) ) ( not ( = ?auto_508416 ?auto_508419 ) ) ( not ( = ?auto_508416 ?auto_508420 ) ) ( not ( = ?auto_508416 ?auto_508421 ) ) ( not ( = ?auto_508416 ?auto_508422 ) ) ( not ( = ?auto_508416 ?auto_508423 ) ) ( not ( = ?auto_508416 ?auto_508424 ) ) ( not ( = ?auto_508416 ?auto_508425 ) ) ( not ( = ?auto_508416 ?auto_508426 ) ) ( not ( = ?auto_508416 ?auto_508427 ) ) ( not ( = ?auto_508417 ?auto_508418 ) ) ( not ( = ?auto_508417 ?auto_508419 ) ) ( not ( = ?auto_508417 ?auto_508420 ) ) ( not ( = ?auto_508417 ?auto_508421 ) ) ( not ( = ?auto_508417 ?auto_508422 ) ) ( not ( = ?auto_508417 ?auto_508423 ) ) ( not ( = ?auto_508417 ?auto_508424 ) ) ( not ( = ?auto_508417 ?auto_508425 ) ) ( not ( = ?auto_508417 ?auto_508426 ) ) ( not ( = ?auto_508417 ?auto_508427 ) ) ( not ( = ?auto_508418 ?auto_508419 ) ) ( not ( = ?auto_508418 ?auto_508420 ) ) ( not ( = ?auto_508418 ?auto_508421 ) ) ( not ( = ?auto_508418 ?auto_508422 ) ) ( not ( = ?auto_508418 ?auto_508423 ) ) ( not ( = ?auto_508418 ?auto_508424 ) ) ( not ( = ?auto_508418 ?auto_508425 ) ) ( not ( = ?auto_508418 ?auto_508426 ) ) ( not ( = ?auto_508418 ?auto_508427 ) ) ( not ( = ?auto_508419 ?auto_508420 ) ) ( not ( = ?auto_508419 ?auto_508421 ) ) ( not ( = ?auto_508419 ?auto_508422 ) ) ( not ( = ?auto_508419 ?auto_508423 ) ) ( not ( = ?auto_508419 ?auto_508424 ) ) ( not ( = ?auto_508419 ?auto_508425 ) ) ( not ( = ?auto_508419 ?auto_508426 ) ) ( not ( = ?auto_508419 ?auto_508427 ) ) ( not ( = ?auto_508420 ?auto_508421 ) ) ( not ( = ?auto_508420 ?auto_508422 ) ) ( not ( = ?auto_508420 ?auto_508423 ) ) ( not ( = ?auto_508420 ?auto_508424 ) ) ( not ( = ?auto_508420 ?auto_508425 ) ) ( not ( = ?auto_508420 ?auto_508426 ) ) ( not ( = ?auto_508420 ?auto_508427 ) ) ( not ( = ?auto_508421 ?auto_508422 ) ) ( not ( = ?auto_508421 ?auto_508423 ) ) ( not ( = ?auto_508421 ?auto_508424 ) ) ( not ( = ?auto_508421 ?auto_508425 ) ) ( not ( = ?auto_508421 ?auto_508426 ) ) ( not ( = ?auto_508421 ?auto_508427 ) ) ( not ( = ?auto_508422 ?auto_508423 ) ) ( not ( = ?auto_508422 ?auto_508424 ) ) ( not ( = ?auto_508422 ?auto_508425 ) ) ( not ( = ?auto_508422 ?auto_508426 ) ) ( not ( = ?auto_508422 ?auto_508427 ) ) ( not ( = ?auto_508423 ?auto_508424 ) ) ( not ( = ?auto_508423 ?auto_508425 ) ) ( not ( = ?auto_508423 ?auto_508426 ) ) ( not ( = ?auto_508423 ?auto_508427 ) ) ( not ( = ?auto_508424 ?auto_508425 ) ) ( not ( = ?auto_508424 ?auto_508426 ) ) ( not ( = ?auto_508424 ?auto_508427 ) ) ( not ( = ?auto_508425 ?auto_508426 ) ) ( not ( = ?auto_508425 ?auto_508427 ) ) ( not ( = ?auto_508426 ?auto_508427 ) ) ( ON ?auto_508426 ?auto_508427 ) ( ON ?auto_508425 ?auto_508426 ) ( ON ?auto_508424 ?auto_508425 ) ( ON ?auto_508423 ?auto_508424 ) ( ON ?auto_508422 ?auto_508423 ) ( ON ?auto_508421 ?auto_508422 ) ( ON ?auto_508420 ?auto_508421 ) ( ON ?auto_508419 ?auto_508420 ) ( CLEAR ?auto_508417 ) ( ON ?auto_508418 ?auto_508419 ) ( CLEAR ?auto_508418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_508412 ?auto_508413 ?auto_508414 ?auto_508415 ?auto_508416 ?auto_508417 ?auto_508418 )
      ( MAKE-16PILE ?auto_508412 ?auto_508413 ?auto_508414 ?auto_508415 ?auto_508416 ?auto_508417 ?auto_508418 ?auto_508419 ?auto_508420 ?auto_508421 ?auto_508422 ?auto_508423 ?auto_508424 ?auto_508425 ?auto_508426 ?auto_508427 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508444 - BLOCK
      ?auto_508445 - BLOCK
      ?auto_508446 - BLOCK
      ?auto_508447 - BLOCK
      ?auto_508448 - BLOCK
      ?auto_508449 - BLOCK
      ?auto_508450 - BLOCK
      ?auto_508451 - BLOCK
      ?auto_508452 - BLOCK
      ?auto_508453 - BLOCK
      ?auto_508454 - BLOCK
      ?auto_508455 - BLOCK
      ?auto_508456 - BLOCK
      ?auto_508457 - BLOCK
      ?auto_508458 - BLOCK
      ?auto_508459 - BLOCK
    )
    :vars
    (
      ?auto_508460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508459 ?auto_508460 ) ( ON-TABLE ?auto_508444 ) ( ON ?auto_508445 ?auto_508444 ) ( ON ?auto_508446 ?auto_508445 ) ( ON ?auto_508447 ?auto_508446 ) ( ON ?auto_508448 ?auto_508447 ) ( not ( = ?auto_508444 ?auto_508445 ) ) ( not ( = ?auto_508444 ?auto_508446 ) ) ( not ( = ?auto_508444 ?auto_508447 ) ) ( not ( = ?auto_508444 ?auto_508448 ) ) ( not ( = ?auto_508444 ?auto_508449 ) ) ( not ( = ?auto_508444 ?auto_508450 ) ) ( not ( = ?auto_508444 ?auto_508451 ) ) ( not ( = ?auto_508444 ?auto_508452 ) ) ( not ( = ?auto_508444 ?auto_508453 ) ) ( not ( = ?auto_508444 ?auto_508454 ) ) ( not ( = ?auto_508444 ?auto_508455 ) ) ( not ( = ?auto_508444 ?auto_508456 ) ) ( not ( = ?auto_508444 ?auto_508457 ) ) ( not ( = ?auto_508444 ?auto_508458 ) ) ( not ( = ?auto_508444 ?auto_508459 ) ) ( not ( = ?auto_508444 ?auto_508460 ) ) ( not ( = ?auto_508445 ?auto_508446 ) ) ( not ( = ?auto_508445 ?auto_508447 ) ) ( not ( = ?auto_508445 ?auto_508448 ) ) ( not ( = ?auto_508445 ?auto_508449 ) ) ( not ( = ?auto_508445 ?auto_508450 ) ) ( not ( = ?auto_508445 ?auto_508451 ) ) ( not ( = ?auto_508445 ?auto_508452 ) ) ( not ( = ?auto_508445 ?auto_508453 ) ) ( not ( = ?auto_508445 ?auto_508454 ) ) ( not ( = ?auto_508445 ?auto_508455 ) ) ( not ( = ?auto_508445 ?auto_508456 ) ) ( not ( = ?auto_508445 ?auto_508457 ) ) ( not ( = ?auto_508445 ?auto_508458 ) ) ( not ( = ?auto_508445 ?auto_508459 ) ) ( not ( = ?auto_508445 ?auto_508460 ) ) ( not ( = ?auto_508446 ?auto_508447 ) ) ( not ( = ?auto_508446 ?auto_508448 ) ) ( not ( = ?auto_508446 ?auto_508449 ) ) ( not ( = ?auto_508446 ?auto_508450 ) ) ( not ( = ?auto_508446 ?auto_508451 ) ) ( not ( = ?auto_508446 ?auto_508452 ) ) ( not ( = ?auto_508446 ?auto_508453 ) ) ( not ( = ?auto_508446 ?auto_508454 ) ) ( not ( = ?auto_508446 ?auto_508455 ) ) ( not ( = ?auto_508446 ?auto_508456 ) ) ( not ( = ?auto_508446 ?auto_508457 ) ) ( not ( = ?auto_508446 ?auto_508458 ) ) ( not ( = ?auto_508446 ?auto_508459 ) ) ( not ( = ?auto_508446 ?auto_508460 ) ) ( not ( = ?auto_508447 ?auto_508448 ) ) ( not ( = ?auto_508447 ?auto_508449 ) ) ( not ( = ?auto_508447 ?auto_508450 ) ) ( not ( = ?auto_508447 ?auto_508451 ) ) ( not ( = ?auto_508447 ?auto_508452 ) ) ( not ( = ?auto_508447 ?auto_508453 ) ) ( not ( = ?auto_508447 ?auto_508454 ) ) ( not ( = ?auto_508447 ?auto_508455 ) ) ( not ( = ?auto_508447 ?auto_508456 ) ) ( not ( = ?auto_508447 ?auto_508457 ) ) ( not ( = ?auto_508447 ?auto_508458 ) ) ( not ( = ?auto_508447 ?auto_508459 ) ) ( not ( = ?auto_508447 ?auto_508460 ) ) ( not ( = ?auto_508448 ?auto_508449 ) ) ( not ( = ?auto_508448 ?auto_508450 ) ) ( not ( = ?auto_508448 ?auto_508451 ) ) ( not ( = ?auto_508448 ?auto_508452 ) ) ( not ( = ?auto_508448 ?auto_508453 ) ) ( not ( = ?auto_508448 ?auto_508454 ) ) ( not ( = ?auto_508448 ?auto_508455 ) ) ( not ( = ?auto_508448 ?auto_508456 ) ) ( not ( = ?auto_508448 ?auto_508457 ) ) ( not ( = ?auto_508448 ?auto_508458 ) ) ( not ( = ?auto_508448 ?auto_508459 ) ) ( not ( = ?auto_508448 ?auto_508460 ) ) ( not ( = ?auto_508449 ?auto_508450 ) ) ( not ( = ?auto_508449 ?auto_508451 ) ) ( not ( = ?auto_508449 ?auto_508452 ) ) ( not ( = ?auto_508449 ?auto_508453 ) ) ( not ( = ?auto_508449 ?auto_508454 ) ) ( not ( = ?auto_508449 ?auto_508455 ) ) ( not ( = ?auto_508449 ?auto_508456 ) ) ( not ( = ?auto_508449 ?auto_508457 ) ) ( not ( = ?auto_508449 ?auto_508458 ) ) ( not ( = ?auto_508449 ?auto_508459 ) ) ( not ( = ?auto_508449 ?auto_508460 ) ) ( not ( = ?auto_508450 ?auto_508451 ) ) ( not ( = ?auto_508450 ?auto_508452 ) ) ( not ( = ?auto_508450 ?auto_508453 ) ) ( not ( = ?auto_508450 ?auto_508454 ) ) ( not ( = ?auto_508450 ?auto_508455 ) ) ( not ( = ?auto_508450 ?auto_508456 ) ) ( not ( = ?auto_508450 ?auto_508457 ) ) ( not ( = ?auto_508450 ?auto_508458 ) ) ( not ( = ?auto_508450 ?auto_508459 ) ) ( not ( = ?auto_508450 ?auto_508460 ) ) ( not ( = ?auto_508451 ?auto_508452 ) ) ( not ( = ?auto_508451 ?auto_508453 ) ) ( not ( = ?auto_508451 ?auto_508454 ) ) ( not ( = ?auto_508451 ?auto_508455 ) ) ( not ( = ?auto_508451 ?auto_508456 ) ) ( not ( = ?auto_508451 ?auto_508457 ) ) ( not ( = ?auto_508451 ?auto_508458 ) ) ( not ( = ?auto_508451 ?auto_508459 ) ) ( not ( = ?auto_508451 ?auto_508460 ) ) ( not ( = ?auto_508452 ?auto_508453 ) ) ( not ( = ?auto_508452 ?auto_508454 ) ) ( not ( = ?auto_508452 ?auto_508455 ) ) ( not ( = ?auto_508452 ?auto_508456 ) ) ( not ( = ?auto_508452 ?auto_508457 ) ) ( not ( = ?auto_508452 ?auto_508458 ) ) ( not ( = ?auto_508452 ?auto_508459 ) ) ( not ( = ?auto_508452 ?auto_508460 ) ) ( not ( = ?auto_508453 ?auto_508454 ) ) ( not ( = ?auto_508453 ?auto_508455 ) ) ( not ( = ?auto_508453 ?auto_508456 ) ) ( not ( = ?auto_508453 ?auto_508457 ) ) ( not ( = ?auto_508453 ?auto_508458 ) ) ( not ( = ?auto_508453 ?auto_508459 ) ) ( not ( = ?auto_508453 ?auto_508460 ) ) ( not ( = ?auto_508454 ?auto_508455 ) ) ( not ( = ?auto_508454 ?auto_508456 ) ) ( not ( = ?auto_508454 ?auto_508457 ) ) ( not ( = ?auto_508454 ?auto_508458 ) ) ( not ( = ?auto_508454 ?auto_508459 ) ) ( not ( = ?auto_508454 ?auto_508460 ) ) ( not ( = ?auto_508455 ?auto_508456 ) ) ( not ( = ?auto_508455 ?auto_508457 ) ) ( not ( = ?auto_508455 ?auto_508458 ) ) ( not ( = ?auto_508455 ?auto_508459 ) ) ( not ( = ?auto_508455 ?auto_508460 ) ) ( not ( = ?auto_508456 ?auto_508457 ) ) ( not ( = ?auto_508456 ?auto_508458 ) ) ( not ( = ?auto_508456 ?auto_508459 ) ) ( not ( = ?auto_508456 ?auto_508460 ) ) ( not ( = ?auto_508457 ?auto_508458 ) ) ( not ( = ?auto_508457 ?auto_508459 ) ) ( not ( = ?auto_508457 ?auto_508460 ) ) ( not ( = ?auto_508458 ?auto_508459 ) ) ( not ( = ?auto_508458 ?auto_508460 ) ) ( not ( = ?auto_508459 ?auto_508460 ) ) ( ON ?auto_508458 ?auto_508459 ) ( ON ?auto_508457 ?auto_508458 ) ( ON ?auto_508456 ?auto_508457 ) ( ON ?auto_508455 ?auto_508456 ) ( ON ?auto_508454 ?auto_508455 ) ( ON ?auto_508453 ?auto_508454 ) ( ON ?auto_508452 ?auto_508453 ) ( ON ?auto_508451 ?auto_508452 ) ( ON ?auto_508450 ?auto_508451 ) ( CLEAR ?auto_508448 ) ( ON ?auto_508449 ?auto_508450 ) ( CLEAR ?auto_508449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_508444 ?auto_508445 ?auto_508446 ?auto_508447 ?auto_508448 ?auto_508449 )
      ( MAKE-16PILE ?auto_508444 ?auto_508445 ?auto_508446 ?auto_508447 ?auto_508448 ?auto_508449 ?auto_508450 ?auto_508451 ?auto_508452 ?auto_508453 ?auto_508454 ?auto_508455 ?auto_508456 ?auto_508457 ?auto_508458 ?auto_508459 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508477 - BLOCK
      ?auto_508478 - BLOCK
      ?auto_508479 - BLOCK
      ?auto_508480 - BLOCK
      ?auto_508481 - BLOCK
      ?auto_508482 - BLOCK
      ?auto_508483 - BLOCK
      ?auto_508484 - BLOCK
      ?auto_508485 - BLOCK
      ?auto_508486 - BLOCK
      ?auto_508487 - BLOCK
      ?auto_508488 - BLOCK
      ?auto_508489 - BLOCK
      ?auto_508490 - BLOCK
      ?auto_508491 - BLOCK
      ?auto_508492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508492 ) ( ON-TABLE ?auto_508477 ) ( ON ?auto_508478 ?auto_508477 ) ( ON ?auto_508479 ?auto_508478 ) ( ON ?auto_508480 ?auto_508479 ) ( ON ?auto_508481 ?auto_508480 ) ( not ( = ?auto_508477 ?auto_508478 ) ) ( not ( = ?auto_508477 ?auto_508479 ) ) ( not ( = ?auto_508477 ?auto_508480 ) ) ( not ( = ?auto_508477 ?auto_508481 ) ) ( not ( = ?auto_508477 ?auto_508482 ) ) ( not ( = ?auto_508477 ?auto_508483 ) ) ( not ( = ?auto_508477 ?auto_508484 ) ) ( not ( = ?auto_508477 ?auto_508485 ) ) ( not ( = ?auto_508477 ?auto_508486 ) ) ( not ( = ?auto_508477 ?auto_508487 ) ) ( not ( = ?auto_508477 ?auto_508488 ) ) ( not ( = ?auto_508477 ?auto_508489 ) ) ( not ( = ?auto_508477 ?auto_508490 ) ) ( not ( = ?auto_508477 ?auto_508491 ) ) ( not ( = ?auto_508477 ?auto_508492 ) ) ( not ( = ?auto_508478 ?auto_508479 ) ) ( not ( = ?auto_508478 ?auto_508480 ) ) ( not ( = ?auto_508478 ?auto_508481 ) ) ( not ( = ?auto_508478 ?auto_508482 ) ) ( not ( = ?auto_508478 ?auto_508483 ) ) ( not ( = ?auto_508478 ?auto_508484 ) ) ( not ( = ?auto_508478 ?auto_508485 ) ) ( not ( = ?auto_508478 ?auto_508486 ) ) ( not ( = ?auto_508478 ?auto_508487 ) ) ( not ( = ?auto_508478 ?auto_508488 ) ) ( not ( = ?auto_508478 ?auto_508489 ) ) ( not ( = ?auto_508478 ?auto_508490 ) ) ( not ( = ?auto_508478 ?auto_508491 ) ) ( not ( = ?auto_508478 ?auto_508492 ) ) ( not ( = ?auto_508479 ?auto_508480 ) ) ( not ( = ?auto_508479 ?auto_508481 ) ) ( not ( = ?auto_508479 ?auto_508482 ) ) ( not ( = ?auto_508479 ?auto_508483 ) ) ( not ( = ?auto_508479 ?auto_508484 ) ) ( not ( = ?auto_508479 ?auto_508485 ) ) ( not ( = ?auto_508479 ?auto_508486 ) ) ( not ( = ?auto_508479 ?auto_508487 ) ) ( not ( = ?auto_508479 ?auto_508488 ) ) ( not ( = ?auto_508479 ?auto_508489 ) ) ( not ( = ?auto_508479 ?auto_508490 ) ) ( not ( = ?auto_508479 ?auto_508491 ) ) ( not ( = ?auto_508479 ?auto_508492 ) ) ( not ( = ?auto_508480 ?auto_508481 ) ) ( not ( = ?auto_508480 ?auto_508482 ) ) ( not ( = ?auto_508480 ?auto_508483 ) ) ( not ( = ?auto_508480 ?auto_508484 ) ) ( not ( = ?auto_508480 ?auto_508485 ) ) ( not ( = ?auto_508480 ?auto_508486 ) ) ( not ( = ?auto_508480 ?auto_508487 ) ) ( not ( = ?auto_508480 ?auto_508488 ) ) ( not ( = ?auto_508480 ?auto_508489 ) ) ( not ( = ?auto_508480 ?auto_508490 ) ) ( not ( = ?auto_508480 ?auto_508491 ) ) ( not ( = ?auto_508480 ?auto_508492 ) ) ( not ( = ?auto_508481 ?auto_508482 ) ) ( not ( = ?auto_508481 ?auto_508483 ) ) ( not ( = ?auto_508481 ?auto_508484 ) ) ( not ( = ?auto_508481 ?auto_508485 ) ) ( not ( = ?auto_508481 ?auto_508486 ) ) ( not ( = ?auto_508481 ?auto_508487 ) ) ( not ( = ?auto_508481 ?auto_508488 ) ) ( not ( = ?auto_508481 ?auto_508489 ) ) ( not ( = ?auto_508481 ?auto_508490 ) ) ( not ( = ?auto_508481 ?auto_508491 ) ) ( not ( = ?auto_508481 ?auto_508492 ) ) ( not ( = ?auto_508482 ?auto_508483 ) ) ( not ( = ?auto_508482 ?auto_508484 ) ) ( not ( = ?auto_508482 ?auto_508485 ) ) ( not ( = ?auto_508482 ?auto_508486 ) ) ( not ( = ?auto_508482 ?auto_508487 ) ) ( not ( = ?auto_508482 ?auto_508488 ) ) ( not ( = ?auto_508482 ?auto_508489 ) ) ( not ( = ?auto_508482 ?auto_508490 ) ) ( not ( = ?auto_508482 ?auto_508491 ) ) ( not ( = ?auto_508482 ?auto_508492 ) ) ( not ( = ?auto_508483 ?auto_508484 ) ) ( not ( = ?auto_508483 ?auto_508485 ) ) ( not ( = ?auto_508483 ?auto_508486 ) ) ( not ( = ?auto_508483 ?auto_508487 ) ) ( not ( = ?auto_508483 ?auto_508488 ) ) ( not ( = ?auto_508483 ?auto_508489 ) ) ( not ( = ?auto_508483 ?auto_508490 ) ) ( not ( = ?auto_508483 ?auto_508491 ) ) ( not ( = ?auto_508483 ?auto_508492 ) ) ( not ( = ?auto_508484 ?auto_508485 ) ) ( not ( = ?auto_508484 ?auto_508486 ) ) ( not ( = ?auto_508484 ?auto_508487 ) ) ( not ( = ?auto_508484 ?auto_508488 ) ) ( not ( = ?auto_508484 ?auto_508489 ) ) ( not ( = ?auto_508484 ?auto_508490 ) ) ( not ( = ?auto_508484 ?auto_508491 ) ) ( not ( = ?auto_508484 ?auto_508492 ) ) ( not ( = ?auto_508485 ?auto_508486 ) ) ( not ( = ?auto_508485 ?auto_508487 ) ) ( not ( = ?auto_508485 ?auto_508488 ) ) ( not ( = ?auto_508485 ?auto_508489 ) ) ( not ( = ?auto_508485 ?auto_508490 ) ) ( not ( = ?auto_508485 ?auto_508491 ) ) ( not ( = ?auto_508485 ?auto_508492 ) ) ( not ( = ?auto_508486 ?auto_508487 ) ) ( not ( = ?auto_508486 ?auto_508488 ) ) ( not ( = ?auto_508486 ?auto_508489 ) ) ( not ( = ?auto_508486 ?auto_508490 ) ) ( not ( = ?auto_508486 ?auto_508491 ) ) ( not ( = ?auto_508486 ?auto_508492 ) ) ( not ( = ?auto_508487 ?auto_508488 ) ) ( not ( = ?auto_508487 ?auto_508489 ) ) ( not ( = ?auto_508487 ?auto_508490 ) ) ( not ( = ?auto_508487 ?auto_508491 ) ) ( not ( = ?auto_508487 ?auto_508492 ) ) ( not ( = ?auto_508488 ?auto_508489 ) ) ( not ( = ?auto_508488 ?auto_508490 ) ) ( not ( = ?auto_508488 ?auto_508491 ) ) ( not ( = ?auto_508488 ?auto_508492 ) ) ( not ( = ?auto_508489 ?auto_508490 ) ) ( not ( = ?auto_508489 ?auto_508491 ) ) ( not ( = ?auto_508489 ?auto_508492 ) ) ( not ( = ?auto_508490 ?auto_508491 ) ) ( not ( = ?auto_508490 ?auto_508492 ) ) ( not ( = ?auto_508491 ?auto_508492 ) ) ( ON ?auto_508491 ?auto_508492 ) ( ON ?auto_508490 ?auto_508491 ) ( ON ?auto_508489 ?auto_508490 ) ( ON ?auto_508488 ?auto_508489 ) ( ON ?auto_508487 ?auto_508488 ) ( ON ?auto_508486 ?auto_508487 ) ( ON ?auto_508485 ?auto_508486 ) ( ON ?auto_508484 ?auto_508485 ) ( ON ?auto_508483 ?auto_508484 ) ( CLEAR ?auto_508481 ) ( ON ?auto_508482 ?auto_508483 ) ( CLEAR ?auto_508482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_508477 ?auto_508478 ?auto_508479 ?auto_508480 ?auto_508481 ?auto_508482 )
      ( MAKE-16PILE ?auto_508477 ?auto_508478 ?auto_508479 ?auto_508480 ?auto_508481 ?auto_508482 ?auto_508483 ?auto_508484 ?auto_508485 ?auto_508486 ?auto_508487 ?auto_508488 ?auto_508489 ?auto_508490 ?auto_508491 ?auto_508492 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508509 - BLOCK
      ?auto_508510 - BLOCK
      ?auto_508511 - BLOCK
      ?auto_508512 - BLOCK
      ?auto_508513 - BLOCK
      ?auto_508514 - BLOCK
      ?auto_508515 - BLOCK
      ?auto_508516 - BLOCK
      ?auto_508517 - BLOCK
      ?auto_508518 - BLOCK
      ?auto_508519 - BLOCK
      ?auto_508520 - BLOCK
      ?auto_508521 - BLOCK
      ?auto_508522 - BLOCK
      ?auto_508523 - BLOCK
      ?auto_508524 - BLOCK
    )
    :vars
    (
      ?auto_508525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508524 ?auto_508525 ) ( ON-TABLE ?auto_508509 ) ( ON ?auto_508510 ?auto_508509 ) ( ON ?auto_508511 ?auto_508510 ) ( ON ?auto_508512 ?auto_508511 ) ( not ( = ?auto_508509 ?auto_508510 ) ) ( not ( = ?auto_508509 ?auto_508511 ) ) ( not ( = ?auto_508509 ?auto_508512 ) ) ( not ( = ?auto_508509 ?auto_508513 ) ) ( not ( = ?auto_508509 ?auto_508514 ) ) ( not ( = ?auto_508509 ?auto_508515 ) ) ( not ( = ?auto_508509 ?auto_508516 ) ) ( not ( = ?auto_508509 ?auto_508517 ) ) ( not ( = ?auto_508509 ?auto_508518 ) ) ( not ( = ?auto_508509 ?auto_508519 ) ) ( not ( = ?auto_508509 ?auto_508520 ) ) ( not ( = ?auto_508509 ?auto_508521 ) ) ( not ( = ?auto_508509 ?auto_508522 ) ) ( not ( = ?auto_508509 ?auto_508523 ) ) ( not ( = ?auto_508509 ?auto_508524 ) ) ( not ( = ?auto_508509 ?auto_508525 ) ) ( not ( = ?auto_508510 ?auto_508511 ) ) ( not ( = ?auto_508510 ?auto_508512 ) ) ( not ( = ?auto_508510 ?auto_508513 ) ) ( not ( = ?auto_508510 ?auto_508514 ) ) ( not ( = ?auto_508510 ?auto_508515 ) ) ( not ( = ?auto_508510 ?auto_508516 ) ) ( not ( = ?auto_508510 ?auto_508517 ) ) ( not ( = ?auto_508510 ?auto_508518 ) ) ( not ( = ?auto_508510 ?auto_508519 ) ) ( not ( = ?auto_508510 ?auto_508520 ) ) ( not ( = ?auto_508510 ?auto_508521 ) ) ( not ( = ?auto_508510 ?auto_508522 ) ) ( not ( = ?auto_508510 ?auto_508523 ) ) ( not ( = ?auto_508510 ?auto_508524 ) ) ( not ( = ?auto_508510 ?auto_508525 ) ) ( not ( = ?auto_508511 ?auto_508512 ) ) ( not ( = ?auto_508511 ?auto_508513 ) ) ( not ( = ?auto_508511 ?auto_508514 ) ) ( not ( = ?auto_508511 ?auto_508515 ) ) ( not ( = ?auto_508511 ?auto_508516 ) ) ( not ( = ?auto_508511 ?auto_508517 ) ) ( not ( = ?auto_508511 ?auto_508518 ) ) ( not ( = ?auto_508511 ?auto_508519 ) ) ( not ( = ?auto_508511 ?auto_508520 ) ) ( not ( = ?auto_508511 ?auto_508521 ) ) ( not ( = ?auto_508511 ?auto_508522 ) ) ( not ( = ?auto_508511 ?auto_508523 ) ) ( not ( = ?auto_508511 ?auto_508524 ) ) ( not ( = ?auto_508511 ?auto_508525 ) ) ( not ( = ?auto_508512 ?auto_508513 ) ) ( not ( = ?auto_508512 ?auto_508514 ) ) ( not ( = ?auto_508512 ?auto_508515 ) ) ( not ( = ?auto_508512 ?auto_508516 ) ) ( not ( = ?auto_508512 ?auto_508517 ) ) ( not ( = ?auto_508512 ?auto_508518 ) ) ( not ( = ?auto_508512 ?auto_508519 ) ) ( not ( = ?auto_508512 ?auto_508520 ) ) ( not ( = ?auto_508512 ?auto_508521 ) ) ( not ( = ?auto_508512 ?auto_508522 ) ) ( not ( = ?auto_508512 ?auto_508523 ) ) ( not ( = ?auto_508512 ?auto_508524 ) ) ( not ( = ?auto_508512 ?auto_508525 ) ) ( not ( = ?auto_508513 ?auto_508514 ) ) ( not ( = ?auto_508513 ?auto_508515 ) ) ( not ( = ?auto_508513 ?auto_508516 ) ) ( not ( = ?auto_508513 ?auto_508517 ) ) ( not ( = ?auto_508513 ?auto_508518 ) ) ( not ( = ?auto_508513 ?auto_508519 ) ) ( not ( = ?auto_508513 ?auto_508520 ) ) ( not ( = ?auto_508513 ?auto_508521 ) ) ( not ( = ?auto_508513 ?auto_508522 ) ) ( not ( = ?auto_508513 ?auto_508523 ) ) ( not ( = ?auto_508513 ?auto_508524 ) ) ( not ( = ?auto_508513 ?auto_508525 ) ) ( not ( = ?auto_508514 ?auto_508515 ) ) ( not ( = ?auto_508514 ?auto_508516 ) ) ( not ( = ?auto_508514 ?auto_508517 ) ) ( not ( = ?auto_508514 ?auto_508518 ) ) ( not ( = ?auto_508514 ?auto_508519 ) ) ( not ( = ?auto_508514 ?auto_508520 ) ) ( not ( = ?auto_508514 ?auto_508521 ) ) ( not ( = ?auto_508514 ?auto_508522 ) ) ( not ( = ?auto_508514 ?auto_508523 ) ) ( not ( = ?auto_508514 ?auto_508524 ) ) ( not ( = ?auto_508514 ?auto_508525 ) ) ( not ( = ?auto_508515 ?auto_508516 ) ) ( not ( = ?auto_508515 ?auto_508517 ) ) ( not ( = ?auto_508515 ?auto_508518 ) ) ( not ( = ?auto_508515 ?auto_508519 ) ) ( not ( = ?auto_508515 ?auto_508520 ) ) ( not ( = ?auto_508515 ?auto_508521 ) ) ( not ( = ?auto_508515 ?auto_508522 ) ) ( not ( = ?auto_508515 ?auto_508523 ) ) ( not ( = ?auto_508515 ?auto_508524 ) ) ( not ( = ?auto_508515 ?auto_508525 ) ) ( not ( = ?auto_508516 ?auto_508517 ) ) ( not ( = ?auto_508516 ?auto_508518 ) ) ( not ( = ?auto_508516 ?auto_508519 ) ) ( not ( = ?auto_508516 ?auto_508520 ) ) ( not ( = ?auto_508516 ?auto_508521 ) ) ( not ( = ?auto_508516 ?auto_508522 ) ) ( not ( = ?auto_508516 ?auto_508523 ) ) ( not ( = ?auto_508516 ?auto_508524 ) ) ( not ( = ?auto_508516 ?auto_508525 ) ) ( not ( = ?auto_508517 ?auto_508518 ) ) ( not ( = ?auto_508517 ?auto_508519 ) ) ( not ( = ?auto_508517 ?auto_508520 ) ) ( not ( = ?auto_508517 ?auto_508521 ) ) ( not ( = ?auto_508517 ?auto_508522 ) ) ( not ( = ?auto_508517 ?auto_508523 ) ) ( not ( = ?auto_508517 ?auto_508524 ) ) ( not ( = ?auto_508517 ?auto_508525 ) ) ( not ( = ?auto_508518 ?auto_508519 ) ) ( not ( = ?auto_508518 ?auto_508520 ) ) ( not ( = ?auto_508518 ?auto_508521 ) ) ( not ( = ?auto_508518 ?auto_508522 ) ) ( not ( = ?auto_508518 ?auto_508523 ) ) ( not ( = ?auto_508518 ?auto_508524 ) ) ( not ( = ?auto_508518 ?auto_508525 ) ) ( not ( = ?auto_508519 ?auto_508520 ) ) ( not ( = ?auto_508519 ?auto_508521 ) ) ( not ( = ?auto_508519 ?auto_508522 ) ) ( not ( = ?auto_508519 ?auto_508523 ) ) ( not ( = ?auto_508519 ?auto_508524 ) ) ( not ( = ?auto_508519 ?auto_508525 ) ) ( not ( = ?auto_508520 ?auto_508521 ) ) ( not ( = ?auto_508520 ?auto_508522 ) ) ( not ( = ?auto_508520 ?auto_508523 ) ) ( not ( = ?auto_508520 ?auto_508524 ) ) ( not ( = ?auto_508520 ?auto_508525 ) ) ( not ( = ?auto_508521 ?auto_508522 ) ) ( not ( = ?auto_508521 ?auto_508523 ) ) ( not ( = ?auto_508521 ?auto_508524 ) ) ( not ( = ?auto_508521 ?auto_508525 ) ) ( not ( = ?auto_508522 ?auto_508523 ) ) ( not ( = ?auto_508522 ?auto_508524 ) ) ( not ( = ?auto_508522 ?auto_508525 ) ) ( not ( = ?auto_508523 ?auto_508524 ) ) ( not ( = ?auto_508523 ?auto_508525 ) ) ( not ( = ?auto_508524 ?auto_508525 ) ) ( ON ?auto_508523 ?auto_508524 ) ( ON ?auto_508522 ?auto_508523 ) ( ON ?auto_508521 ?auto_508522 ) ( ON ?auto_508520 ?auto_508521 ) ( ON ?auto_508519 ?auto_508520 ) ( ON ?auto_508518 ?auto_508519 ) ( ON ?auto_508517 ?auto_508518 ) ( ON ?auto_508516 ?auto_508517 ) ( ON ?auto_508515 ?auto_508516 ) ( ON ?auto_508514 ?auto_508515 ) ( CLEAR ?auto_508512 ) ( ON ?auto_508513 ?auto_508514 ) ( CLEAR ?auto_508513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_508509 ?auto_508510 ?auto_508511 ?auto_508512 ?auto_508513 )
      ( MAKE-16PILE ?auto_508509 ?auto_508510 ?auto_508511 ?auto_508512 ?auto_508513 ?auto_508514 ?auto_508515 ?auto_508516 ?auto_508517 ?auto_508518 ?auto_508519 ?auto_508520 ?auto_508521 ?auto_508522 ?auto_508523 ?auto_508524 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508542 - BLOCK
      ?auto_508543 - BLOCK
      ?auto_508544 - BLOCK
      ?auto_508545 - BLOCK
      ?auto_508546 - BLOCK
      ?auto_508547 - BLOCK
      ?auto_508548 - BLOCK
      ?auto_508549 - BLOCK
      ?auto_508550 - BLOCK
      ?auto_508551 - BLOCK
      ?auto_508552 - BLOCK
      ?auto_508553 - BLOCK
      ?auto_508554 - BLOCK
      ?auto_508555 - BLOCK
      ?auto_508556 - BLOCK
      ?auto_508557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508557 ) ( ON-TABLE ?auto_508542 ) ( ON ?auto_508543 ?auto_508542 ) ( ON ?auto_508544 ?auto_508543 ) ( ON ?auto_508545 ?auto_508544 ) ( not ( = ?auto_508542 ?auto_508543 ) ) ( not ( = ?auto_508542 ?auto_508544 ) ) ( not ( = ?auto_508542 ?auto_508545 ) ) ( not ( = ?auto_508542 ?auto_508546 ) ) ( not ( = ?auto_508542 ?auto_508547 ) ) ( not ( = ?auto_508542 ?auto_508548 ) ) ( not ( = ?auto_508542 ?auto_508549 ) ) ( not ( = ?auto_508542 ?auto_508550 ) ) ( not ( = ?auto_508542 ?auto_508551 ) ) ( not ( = ?auto_508542 ?auto_508552 ) ) ( not ( = ?auto_508542 ?auto_508553 ) ) ( not ( = ?auto_508542 ?auto_508554 ) ) ( not ( = ?auto_508542 ?auto_508555 ) ) ( not ( = ?auto_508542 ?auto_508556 ) ) ( not ( = ?auto_508542 ?auto_508557 ) ) ( not ( = ?auto_508543 ?auto_508544 ) ) ( not ( = ?auto_508543 ?auto_508545 ) ) ( not ( = ?auto_508543 ?auto_508546 ) ) ( not ( = ?auto_508543 ?auto_508547 ) ) ( not ( = ?auto_508543 ?auto_508548 ) ) ( not ( = ?auto_508543 ?auto_508549 ) ) ( not ( = ?auto_508543 ?auto_508550 ) ) ( not ( = ?auto_508543 ?auto_508551 ) ) ( not ( = ?auto_508543 ?auto_508552 ) ) ( not ( = ?auto_508543 ?auto_508553 ) ) ( not ( = ?auto_508543 ?auto_508554 ) ) ( not ( = ?auto_508543 ?auto_508555 ) ) ( not ( = ?auto_508543 ?auto_508556 ) ) ( not ( = ?auto_508543 ?auto_508557 ) ) ( not ( = ?auto_508544 ?auto_508545 ) ) ( not ( = ?auto_508544 ?auto_508546 ) ) ( not ( = ?auto_508544 ?auto_508547 ) ) ( not ( = ?auto_508544 ?auto_508548 ) ) ( not ( = ?auto_508544 ?auto_508549 ) ) ( not ( = ?auto_508544 ?auto_508550 ) ) ( not ( = ?auto_508544 ?auto_508551 ) ) ( not ( = ?auto_508544 ?auto_508552 ) ) ( not ( = ?auto_508544 ?auto_508553 ) ) ( not ( = ?auto_508544 ?auto_508554 ) ) ( not ( = ?auto_508544 ?auto_508555 ) ) ( not ( = ?auto_508544 ?auto_508556 ) ) ( not ( = ?auto_508544 ?auto_508557 ) ) ( not ( = ?auto_508545 ?auto_508546 ) ) ( not ( = ?auto_508545 ?auto_508547 ) ) ( not ( = ?auto_508545 ?auto_508548 ) ) ( not ( = ?auto_508545 ?auto_508549 ) ) ( not ( = ?auto_508545 ?auto_508550 ) ) ( not ( = ?auto_508545 ?auto_508551 ) ) ( not ( = ?auto_508545 ?auto_508552 ) ) ( not ( = ?auto_508545 ?auto_508553 ) ) ( not ( = ?auto_508545 ?auto_508554 ) ) ( not ( = ?auto_508545 ?auto_508555 ) ) ( not ( = ?auto_508545 ?auto_508556 ) ) ( not ( = ?auto_508545 ?auto_508557 ) ) ( not ( = ?auto_508546 ?auto_508547 ) ) ( not ( = ?auto_508546 ?auto_508548 ) ) ( not ( = ?auto_508546 ?auto_508549 ) ) ( not ( = ?auto_508546 ?auto_508550 ) ) ( not ( = ?auto_508546 ?auto_508551 ) ) ( not ( = ?auto_508546 ?auto_508552 ) ) ( not ( = ?auto_508546 ?auto_508553 ) ) ( not ( = ?auto_508546 ?auto_508554 ) ) ( not ( = ?auto_508546 ?auto_508555 ) ) ( not ( = ?auto_508546 ?auto_508556 ) ) ( not ( = ?auto_508546 ?auto_508557 ) ) ( not ( = ?auto_508547 ?auto_508548 ) ) ( not ( = ?auto_508547 ?auto_508549 ) ) ( not ( = ?auto_508547 ?auto_508550 ) ) ( not ( = ?auto_508547 ?auto_508551 ) ) ( not ( = ?auto_508547 ?auto_508552 ) ) ( not ( = ?auto_508547 ?auto_508553 ) ) ( not ( = ?auto_508547 ?auto_508554 ) ) ( not ( = ?auto_508547 ?auto_508555 ) ) ( not ( = ?auto_508547 ?auto_508556 ) ) ( not ( = ?auto_508547 ?auto_508557 ) ) ( not ( = ?auto_508548 ?auto_508549 ) ) ( not ( = ?auto_508548 ?auto_508550 ) ) ( not ( = ?auto_508548 ?auto_508551 ) ) ( not ( = ?auto_508548 ?auto_508552 ) ) ( not ( = ?auto_508548 ?auto_508553 ) ) ( not ( = ?auto_508548 ?auto_508554 ) ) ( not ( = ?auto_508548 ?auto_508555 ) ) ( not ( = ?auto_508548 ?auto_508556 ) ) ( not ( = ?auto_508548 ?auto_508557 ) ) ( not ( = ?auto_508549 ?auto_508550 ) ) ( not ( = ?auto_508549 ?auto_508551 ) ) ( not ( = ?auto_508549 ?auto_508552 ) ) ( not ( = ?auto_508549 ?auto_508553 ) ) ( not ( = ?auto_508549 ?auto_508554 ) ) ( not ( = ?auto_508549 ?auto_508555 ) ) ( not ( = ?auto_508549 ?auto_508556 ) ) ( not ( = ?auto_508549 ?auto_508557 ) ) ( not ( = ?auto_508550 ?auto_508551 ) ) ( not ( = ?auto_508550 ?auto_508552 ) ) ( not ( = ?auto_508550 ?auto_508553 ) ) ( not ( = ?auto_508550 ?auto_508554 ) ) ( not ( = ?auto_508550 ?auto_508555 ) ) ( not ( = ?auto_508550 ?auto_508556 ) ) ( not ( = ?auto_508550 ?auto_508557 ) ) ( not ( = ?auto_508551 ?auto_508552 ) ) ( not ( = ?auto_508551 ?auto_508553 ) ) ( not ( = ?auto_508551 ?auto_508554 ) ) ( not ( = ?auto_508551 ?auto_508555 ) ) ( not ( = ?auto_508551 ?auto_508556 ) ) ( not ( = ?auto_508551 ?auto_508557 ) ) ( not ( = ?auto_508552 ?auto_508553 ) ) ( not ( = ?auto_508552 ?auto_508554 ) ) ( not ( = ?auto_508552 ?auto_508555 ) ) ( not ( = ?auto_508552 ?auto_508556 ) ) ( not ( = ?auto_508552 ?auto_508557 ) ) ( not ( = ?auto_508553 ?auto_508554 ) ) ( not ( = ?auto_508553 ?auto_508555 ) ) ( not ( = ?auto_508553 ?auto_508556 ) ) ( not ( = ?auto_508553 ?auto_508557 ) ) ( not ( = ?auto_508554 ?auto_508555 ) ) ( not ( = ?auto_508554 ?auto_508556 ) ) ( not ( = ?auto_508554 ?auto_508557 ) ) ( not ( = ?auto_508555 ?auto_508556 ) ) ( not ( = ?auto_508555 ?auto_508557 ) ) ( not ( = ?auto_508556 ?auto_508557 ) ) ( ON ?auto_508556 ?auto_508557 ) ( ON ?auto_508555 ?auto_508556 ) ( ON ?auto_508554 ?auto_508555 ) ( ON ?auto_508553 ?auto_508554 ) ( ON ?auto_508552 ?auto_508553 ) ( ON ?auto_508551 ?auto_508552 ) ( ON ?auto_508550 ?auto_508551 ) ( ON ?auto_508549 ?auto_508550 ) ( ON ?auto_508548 ?auto_508549 ) ( ON ?auto_508547 ?auto_508548 ) ( CLEAR ?auto_508545 ) ( ON ?auto_508546 ?auto_508547 ) ( CLEAR ?auto_508546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_508542 ?auto_508543 ?auto_508544 ?auto_508545 ?auto_508546 )
      ( MAKE-16PILE ?auto_508542 ?auto_508543 ?auto_508544 ?auto_508545 ?auto_508546 ?auto_508547 ?auto_508548 ?auto_508549 ?auto_508550 ?auto_508551 ?auto_508552 ?auto_508553 ?auto_508554 ?auto_508555 ?auto_508556 ?auto_508557 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508574 - BLOCK
      ?auto_508575 - BLOCK
      ?auto_508576 - BLOCK
      ?auto_508577 - BLOCK
      ?auto_508578 - BLOCK
      ?auto_508579 - BLOCK
      ?auto_508580 - BLOCK
      ?auto_508581 - BLOCK
      ?auto_508582 - BLOCK
      ?auto_508583 - BLOCK
      ?auto_508584 - BLOCK
      ?auto_508585 - BLOCK
      ?auto_508586 - BLOCK
      ?auto_508587 - BLOCK
      ?auto_508588 - BLOCK
      ?auto_508589 - BLOCK
    )
    :vars
    (
      ?auto_508590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508589 ?auto_508590 ) ( ON-TABLE ?auto_508574 ) ( ON ?auto_508575 ?auto_508574 ) ( ON ?auto_508576 ?auto_508575 ) ( not ( = ?auto_508574 ?auto_508575 ) ) ( not ( = ?auto_508574 ?auto_508576 ) ) ( not ( = ?auto_508574 ?auto_508577 ) ) ( not ( = ?auto_508574 ?auto_508578 ) ) ( not ( = ?auto_508574 ?auto_508579 ) ) ( not ( = ?auto_508574 ?auto_508580 ) ) ( not ( = ?auto_508574 ?auto_508581 ) ) ( not ( = ?auto_508574 ?auto_508582 ) ) ( not ( = ?auto_508574 ?auto_508583 ) ) ( not ( = ?auto_508574 ?auto_508584 ) ) ( not ( = ?auto_508574 ?auto_508585 ) ) ( not ( = ?auto_508574 ?auto_508586 ) ) ( not ( = ?auto_508574 ?auto_508587 ) ) ( not ( = ?auto_508574 ?auto_508588 ) ) ( not ( = ?auto_508574 ?auto_508589 ) ) ( not ( = ?auto_508574 ?auto_508590 ) ) ( not ( = ?auto_508575 ?auto_508576 ) ) ( not ( = ?auto_508575 ?auto_508577 ) ) ( not ( = ?auto_508575 ?auto_508578 ) ) ( not ( = ?auto_508575 ?auto_508579 ) ) ( not ( = ?auto_508575 ?auto_508580 ) ) ( not ( = ?auto_508575 ?auto_508581 ) ) ( not ( = ?auto_508575 ?auto_508582 ) ) ( not ( = ?auto_508575 ?auto_508583 ) ) ( not ( = ?auto_508575 ?auto_508584 ) ) ( not ( = ?auto_508575 ?auto_508585 ) ) ( not ( = ?auto_508575 ?auto_508586 ) ) ( not ( = ?auto_508575 ?auto_508587 ) ) ( not ( = ?auto_508575 ?auto_508588 ) ) ( not ( = ?auto_508575 ?auto_508589 ) ) ( not ( = ?auto_508575 ?auto_508590 ) ) ( not ( = ?auto_508576 ?auto_508577 ) ) ( not ( = ?auto_508576 ?auto_508578 ) ) ( not ( = ?auto_508576 ?auto_508579 ) ) ( not ( = ?auto_508576 ?auto_508580 ) ) ( not ( = ?auto_508576 ?auto_508581 ) ) ( not ( = ?auto_508576 ?auto_508582 ) ) ( not ( = ?auto_508576 ?auto_508583 ) ) ( not ( = ?auto_508576 ?auto_508584 ) ) ( not ( = ?auto_508576 ?auto_508585 ) ) ( not ( = ?auto_508576 ?auto_508586 ) ) ( not ( = ?auto_508576 ?auto_508587 ) ) ( not ( = ?auto_508576 ?auto_508588 ) ) ( not ( = ?auto_508576 ?auto_508589 ) ) ( not ( = ?auto_508576 ?auto_508590 ) ) ( not ( = ?auto_508577 ?auto_508578 ) ) ( not ( = ?auto_508577 ?auto_508579 ) ) ( not ( = ?auto_508577 ?auto_508580 ) ) ( not ( = ?auto_508577 ?auto_508581 ) ) ( not ( = ?auto_508577 ?auto_508582 ) ) ( not ( = ?auto_508577 ?auto_508583 ) ) ( not ( = ?auto_508577 ?auto_508584 ) ) ( not ( = ?auto_508577 ?auto_508585 ) ) ( not ( = ?auto_508577 ?auto_508586 ) ) ( not ( = ?auto_508577 ?auto_508587 ) ) ( not ( = ?auto_508577 ?auto_508588 ) ) ( not ( = ?auto_508577 ?auto_508589 ) ) ( not ( = ?auto_508577 ?auto_508590 ) ) ( not ( = ?auto_508578 ?auto_508579 ) ) ( not ( = ?auto_508578 ?auto_508580 ) ) ( not ( = ?auto_508578 ?auto_508581 ) ) ( not ( = ?auto_508578 ?auto_508582 ) ) ( not ( = ?auto_508578 ?auto_508583 ) ) ( not ( = ?auto_508578 ?auto_508584 ) ) ( not ( = ?auto_508578 ?auto_508585 ) ) ( not ( = ?auto_508578 ?auto_508586 ) ) ( not ( = ?auto_508578 ?auto_508587 ) ) ( not ( = ?auto_508578 ?auto_508588 ) ) ( not ( = ?auto_508578 ?auto_508589 ) ) ( not ( = ?auto_508578 ?auto_508590 ) ) ( not ( = ?auto_508579 ?auto_508580 ) ) ( not ( = ?auto_508579 ?auto_508581 ) ) ( not ( = ?auto_508579 ?auto_508582 ) ) ( not ( = ?auto_508579 ?auto_508583 ) ) ( not ( = ?auto_508579 ?auto_508584 ) ) ( not ( = ?auto_508579 ?auto_508585 ) ) ( not ( = ?auto_508579 ?auto_508586 ) ) ( not ( = ?auto_508579 ?auto_508587 ) ) ( not ( = ?auto_508579 ?auto_508588 ) ) ( not ( = ?auto_508579 ?auto_508589 ) ) ( not ( = ?auto_508579 ?auto_508590 ) ) ( not ( = ?auto_508580 ?auto_508581 ) ) ( not ( = ?auto_508580 ?auto_508582 ) ) ( not ( = ?auto_508580 ?auto_508583 ) ) ( not ( = ?auto_508580 ?auto_508584 ) ) ( not ( = ?auto_508580 ?auto_508585 ) ) ( not ( = ?auto_508580 ?auto_508586 ) ) ( not ( = ?auto_508580 ?auto_508587 ) ) ( not ( = ?auto_508580 ?auto_508588 ) ) ( not ( = ?auto_508580 ?auto_508589 ) ) ( not ( = ?auto_508580 ?auto_508590 ) ) ( not ( = ?auto_508581 ?auto_508582 ) ) ( not ( = ?auto_508581 ?auto_508583 ) ) ( not ( = ?auto_508581 ?auto_508584 ) ) ( not ( = ?auto_508581 ?auto_508585 ) ) ( not ( = ?auto_508581 ?auto_508586 ) ) ( not ( = ?auto_508581 ?auto_508587 ) ) ( not ( = ?auto_508581 ?auto_508588 ) ) ( not ( = ?auto_508581 ?auto_508589 ) ) ( not ( = ?auto_508581 ?auto_508590 ) ) ( not ( = ?auto_508582 ?auto_508583 ) ) ( not ( = ?auto_508582 ?auto_508584 ) ) ( not ( = ?auto_508582 ?auto_508585 ) ) ( not ( = ?auto_508582 ?auto_508586 ) ) ( not ( = ?auto_508582 ?auto_508587 ) ) ( not ( = ?auto_508582 ?auto_508588 ) ) ( not ( = ?auto_508582 ?auto_508589 ) ) ( not ( = ?auto_508582 ?auto_508590 ) ) ( not ( = ?auto_508583 ?auto_508584 ) ) ( not ( = ?auto_508583 ?auto_508585 ) ) ( not ( = ?auto_508583 ?auto_508586 ) ) ( not ( = ?auto_508583 ?auto_508587 ) ) ( not ( = ?auto_508583 ?auto_508588 ) ) ( not ( = ?auto_508583 ?auto_508589 ) ) ( not ( = ?auto_508583 ?auto_508590 ) ) ( not ( = ?auto_508584 ?auto_508585 ) ) ( not ( = ?auto_508584 ?auto_508586 ) ) ( not ( = ?auto_508584 ?auto_508587 ) ) ( not ( = ?auto_508584 ?auto_508588 ) ) ( not ( = ?auto_508584 ?auto_508589 ) ) ( not ( = ?auto_508584 ?auto_508590 ) ) ( not ( = ?auto_508585 ?auto_508586 ) ) ( not ( = ?auto_508585 ?auto_508587 ) ) ( not ( = ?auto_508585 ?auto_508588 ) ) ( not ( = ?auto_508585 ?auto_508589 ) ) ( not ( = ?auto_508585 ?auto_508590 ) ) ( not ( = ?auto_508586 ?auto_508587 ) ) ( not ( = ?auto_508586 ?auto_508588 ) ) ( not ( = ?auto_508586 ?auto_508589 ) ) ( not ( = ?auto_508586 ?auto_508590 ) ) ( not ( = ?auto_508587 ?auto_508588 ) ) ( not ( = ?auto_508587 ?auto_508589 ) ) ( not ( = ?auto_508587 ?auto_508590 ) ) ( not ( = ?auto_508588 ?auto_508589 ) ) ( not ( = ?auto_508588 ?auto_508590 ) ) ( not ( = ?auto_508589 ?auto_508590 ) ) ( ON ?auto_508588 ?auto_508589 ) ( ON ?auto_508587 ?auto_508588 ) ( ON ?auto_508586 ?auto_508587 ) ( ON ?auto_508585 ?auto_508586 ) ( ON ?auto_508584 ?auto_508585 ) ( ON ?auto_508583 ?auto_508584 ) ( ON ?auto_508582 ?auto_508583 ) ( ON ?auto_508581 ?auto_508582 ) ( ON ?auto_508580 ?auto_508581 ) ( ON ?auto_508579 ?auto_508580 ) ( ON ?auto_508578 ?auto_508579 ) ( CLEAR ?auto_508576 ) ( ON ?auto_508577 ?auto_508578 ) ( CLEAR ?auto_508577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_508574 ?auto_508575 ?auto_508576 ?auto_508577 )
      ( MAKE-16PILE ?auto_508574 ?auto_508575 ?auto_508576 ?auto_508577 ?auto_508578 ?auto_508579 ?auto_508580 ?auto_508581 ?auto_508582 ?auto_508583 ?auto_508584 ?auto_508585 ?auto_508586 ?auto_508587 ?auto_508588 ?auto_508589 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508607 - BLOCK
      ?auto_508608 - BLOCK
      ?auto_508609 - BLOCK
      ?auto_508610 - BLOCK
      ?auto_508611 - BLOCK
      ?auto_508612 - BLOCK
      ?auto_508613 - BLOCK
      ?auto_508614 - BLOCK
      ?auto_508615 - BLOCK
      ?auto_508616 - BLOCK
      ?auto_508617 - BLOCK
      ?auto_508618 - BLOCK
      ?auto_508619 - BLOCK
      ?auto_508620 - BLOCK
      ?auto_508621 - BLOCK
      ?auto_508622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508622 ) ( ON-TABLE ?auto_508607 ) ( ON ?auto_508608 ?auto_508607 ) ( ON ?auto_508609 ?auto_508608 ) ( not ( = ?auto_508607 ?auto_508608 ) ) ( not ( = ?auto_508607 ?auto_508609 ) ) ( not ( = ?auto_508607 ?auto_508610 ) ) ( not ( = ?auto_508607 ?auto_508611 ) ) ( not ( = ?auto_508607 ?auto_508612 ) ) ( not ( = ?auto_508607 ?auto_508613 ) ) ( not ( = ?auto_508607 ?auto_508614 ) ) ( not ( = ?auto_508607 ?auto_508615 ) ) ( not ( = ?auto_508607 ?auto_508616 ) ) ( not ( = ?auto_508607 ?auto_508617 ) ) ( not ( = ?auto_508607 ?auto_508618 ) ) ( not ( = ?auto_508607 ?auto_508619 ) ) ( not ( = ?auto_508607 ?auto_508620 ) ) ( not ( = ?auto_508607 ?auto_508621 ) ) ( not ( = ?auto_508607 ?auto_508622 ) ) ( not ( = ?auto_508608 ?auto_508609 ) ) ( not ( = ?auto_508608 ?auto_508610 ) ) ( not ( = ?auto_508608 ?auto_508611 ) ) ( not ( = ?auto_508608 ?auto_508612 ) ) ( not ( = ?auto_508608 ?auto_508613 ) ) ( not ( = ?auto_508608 ?auto_508614 ) ) ( not ( = ?auto_508608 ?auto_508615 ) ) ( not ( = ?auto_508608 ?auto_508616 ) ) ( not ( = ?auto_508608 ?auto_508617 ) ) ( not ( = ?auto_508608 ?auto_508618 ) ) ( not ( = ?auto_508608 ?auto_508619 ) ) ( not ( = ?auto_508608 ?auto_508620 ) ) ( not ( = ?auto_508608 ?auto_508621 ) ) ( not ( = ?auto_508608 ?auto_508622 ) ) ( not ( = ?auto_508609 ?auto_508610 ) ) ( not ( = ?auto_508609 ?auto_508611 ) ) ( not ( = ?auto_508609 ?auto_508612 ) ) ( not ( = ?auto_508609 ?auto_508613 ) ) ( not ( = ?auto_508609 ?auto_508614 ) ) ( not ( = ?auto_508609 ?auto_508615 ) ) ( not ( = ?auto_508609 ?auto_508616 ) ) ( not ( = ?auto_508609 ?auto_508617 ) ) ( not ( = ?auto_508609 ?auto_508618 ) ) ( not ( = ?auto_508609 ?auto_508619 ) ) ( not ( = ?auto_508609 ?auto_508620 ) ) ( not ( = ?auto_508609 ?auto_508621 ) ) ( not ( = ?auto_508609 ?auto_508622 ) ) ( not ( = ?auto_508610 ?auto_508611 ) ) ( not ( = ?auto_508610 ?auto_508612 ) ) ( not ( = ?auto_508610 ?auto_508613 ) ) ( not ( = ?auto_508610 ?auto_508614 ) ) ( not ( = ?auto_508610 ?auto_508615 ) ) ( not ( = ?auto_508610 ?auto_508616 ) ) ( not ( = ?auto_508610 ?auto_508617 ) ) ( not ( = ?auto_508610 ?auto_508618 ) ) ( not ( = ?auto_508610 ?auto_508619 ) ) ( not ( = ?auto_508610 ?auto_508620 ) ) ( not ( = ?auto_508610 ?auto_508621 ) ) ( not ( = ?auto_508610 ?auto_508622 ) ) ( not ( = ?auto_508611 ?auto_508612 ) ) ( not ( = ?auto_508611 ?auto_508613 ) ) ( not ( = ?auto_508611 ?auto_508614 ) ) ( not ( = ?auto_508611 ?auto_508615 ) ) ( not ( = ?auto_508611 ?auto_508616 ) ) ( not ( = ?auto_508611 ?auto_508617 ) ) ( not ( = ?auto_508611 ?auto_508618 ) ) ( not ( = ?auto_508611 ?auto_508619 ) ) ( not ( = ?auto_508611 ?auto_508620 ) ) ( not ( = ?auto_508611 ?auto_508621 ) ) ( not ( = ?auto_508611 ?auto_508622 ) ) ( not ( = ?auto_508612 ?auto_508613 ) ) ( not ( = ?auto_508612 ?auto_508614 ) ) ( not ( = ?auto_508612 ?auto_508615 ) ) ( not ( = ?auto_508612 ?auto_508616 ) ) ( not ( = ?auto_508612 ?auto_508617 ) ) ( not ( = ?auto_508612 ?auto_508618 ) ) ( not ( = ?auto_508612 ?auto_508619 ) ) ( not ( = ?auto_508612 ?auto_508620 ) ) ( not ( = ?auto_508612 ?auto_508621 ) ) ( not ( = ?auto_508612 ?auto_508622 ) ) ( not ( = ?auto_508613 ?auto_508614 ) ) ( not ( = ?auto_508613 ?auto_508615 ) ) ( not ( = ?auto_508613 ?auto_508616 ) ) ( not ( = ?auto_508613 ?auto_508617 ) ) ( not ( = ?auto_508613 ?auto_508618 ) ) ( not ( = ?auto_508613 ?auto_508619 ) ) ( not ( = ?auto_508613 ?auto_508620 ) ) ( not ( = ?auto_508613 ?auto_508621 ) ) ( not ( = ?auto_508613 ?auto_508622 ) ) ( not ( = ?auto_508614 ?auto_508615 ) ) ( not ( = ?auto_508614 ?auto_508616 ) ) ( not ( = ?auto_508614 ?auto_508617 ) ) ( not ( = ?auto_508614 ?auto_508618 ) ) ( not ( = ?auto_508614 ?auto_508619 ) ) ( not ( = ?auto_508614 ?auto_508620 ) ) ( not ( = ?auto_508614 ?auto_508621 ) ) ( not ( = ?auto_508614 ?auto_508622 ) ) ( not ( = ?auto_508615 ?auto_508616 ) ) ( not ( = ?auto_508615 ?auto_508617 ) ) ( not ( = ?auto_508615 ?auto_508618 ) ) ( not ( = ?auto_508615 ?auto_508619 ) ) ( not ( = ?auto_508615 ?auto_508620 ) ) ( not ( = ?auto_508615 ?auto_508621 ) ) ( not ( = ?auto_508615 ?auto_508622 ) ) ( not ( = ?auto_508616 ?auto_508617 ) ) ( not ( = ?auto_508616 ?auto_508618 ) ) ( not ( = ?auto_508616 ?auto_508619 ) ) ( not ( = ?auto_508616 ?auto_508620 ) ) ( not ( = ?auto_508616 ?auto_508621 ) ) ( not ( = ?auto_508616 ?auto_508622 ) ) ( not ( = ?auto_508617 ?auto_508618 ) ) ( not ( = ?auto_508617 ?auto_508619 ) ) ( not ( = ?auto_508617 ?auto_508620 ) ) ( not ( = ?auto_508617 ?auto_508621 ) ) ( not ( = ?auto_508617 ?auto_508622 ) ) ( not ( = ?auto_508618 ?auto_508619 ) ) ( not ( = ?auto_508618 ?auto_508620 ) ) ( not ( = ?auto_508618 ?auto_508621 ) ) ( not ( = ?auto_508618 ?auto_508622 ) ) ( not ( = ?auto_508619 ?auto_508620 ) ) ( not ( = ?auto_508619 ?auto_508621 ) ) ( not ( = ?auto_508619 ?auto_508622 ) ) ( not ( = ?auto_508620 ?auto_508621 ) ) ( not ( = ?auto_508620 ?auto_508622 ) ) ( not ( = ?auto_508621 ?auto_508622 ) ) ( ON ?auto_508621 ?auto_508622 ) ( ON ?auto_508620 ?auto_508621 ) ( ON ?auto_508619 ?auto_508620 ) ( ON ?auto_508618 ?auto_508619 ) ( ON ?auto_508617 ?auto_508618 ) ( ON ?auto_508616 ?auto_508617 ) ( ON ?auto_508615 ?auto_508616 ) ( ON ?auto_508614 ?auto_508615 ) ( ON ?auto_508613 ?auto_508614 ) ( ON ?auto_508612 ?auto_508613 ) ( ON ?auto_508611 ?auto_508612 ) ( CLEAR ?auto_508609 ) ( ON ?auto_508610 ?auto_508611 ) ( CLEAR ?auto_508610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_508607 ?auto_508608 ?auto_508609 ?auto_508610 )
      ( MAKE-16PILE ?auto_508607 ?auto_508608 ?auto_508609 ?auto_508610 ?auto_508611 ?auto_508612 ?auto_508613 ?auto_508614 ?auto_508615 ?auto_508616 ?auto_508617 ?auto_508618 ?auto_508619 ?auto_508620 ?auto_508621 ?auto_508622 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508639 - BLOCK
      ?auto_508640 - BLOCK
      ?auto_508641 - BLOCK
      ?auto_508642 - BLOCK
      ?auto_508643 - BLOCK
      ?auto_508644 - BLOCK
      ?auto_508645 - BLOCK
      ?auto_508646 - BLOCK
      ?auto_508647 - BLOCK
      ?auto_508648 - BLOCK
      ?auto_508649 - BLOCK
      ?auto_508650 - BLOCK
      ?auto_508651 - BLOCK
      ?auto_508652 - BLOCK
      ?auto_508653 - BLOCK
      ?auto_508654 - BLOCK
    )
    :vars
    (
      ?auto_508655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508654 ?auto_508655 ) ( ON-TABLE ?auto_508639 ) ( ON ?auto_508640 ?auto_508639 ) ( not ( = ?auto_508639 ?auto_508640 ) ) ( not ( = ?auto_508639 ?auto_508641 ) ) ( not ( = ?auto_508639 ?auto_508642 ) ) ( not ( = ?auto_508639 ?auto_508643 ) ) ( not ( = ?auto_508639 ?auto_508644 ) ) ( not ( = ?auto_508639 ?auto_508645 ) ) ( not ( = ?auto_508639 ?auto_508646 ) ) ( not ( = ?auto_508639 ?auto_508647 ) ) ( not ( = ?auto_508639 ?auto_508648 ) ) ( not ( = ?auto_508639 ?auto_508649 ) ) ( not ( = ?auto_508639 ?auto_508650 ) ) ( not ( = ?auto_508639 ?auto_508651 ) ) ( not ( = ?auto_508639 ?auto_508652 ) ) ( not ( = ?auto_508639 ?auto_508653 ) ) ( not ( = ?auto_508639 ?auto_508654 ) ) ( not ( = ?auto_508639 ?auto_508655 ) ) ( not ( = ?auto_508640 ?auto_508641 ) ) ( not ( = ?auto_508640 ?auto_508642 ) ) ( not ( = ?auto_508640 ?auto_508643 ) ) ( not ( = ?auto_508640 ?auto_508644 ) ) ( not ( = ?auto_508640 ?auto_508645 ) ) ( not ( = ?auto_508640 ?auto_508646 ) ) ( not ( = ?auto_508640 ?auto_508647 ) ) ( not ( = ?auto_508640 ?auto_508648 ) ) ( not ( = ?auto_508640 ?auto_508649 ) ) ( not ( = ?auto_508640 ?auto_508650 ) ) ( not ( = ?auto_508640 ?auto_508651 ) ) ( not ( = ?auto_508640 ?auto_508652 ) ) ( not ( = ?auto_508640 ?auto_508653 ) ) ( not ( = ?auto_508640 ?auto_508654 ) ) ( not ( = ?auto_508640 ?auto_508655 ) ) ( not ( = ?auto_508641 ?auto_508642 ) ) ( not ( = ?auto_508641 ?auto_508643 ) ) ( not ( = ?auto_508641 ?auto_508644 ) ) ( not ( = ?auto_508641 ?auto_508645 ) ) ( not ( = ?auto_508641 ?auto_508646 ) ) ( not ( = ?auto_508641 ?auto_508647 ) ) ( not ( = ?auto_508641 ?auto_508648 ) ) ( not ( = ?auto_508641 ?auto_508649 ) ) ( not ( = ?auto_508641 ?auto_508650 ) ) ( not ( = ?auto_508641 ?auto_508651 ) ) ( not ( = ?auto_508641 ?auto_508652 ) ) ( not ( = ?auto_508641 ?auto_508653 ) ) ( not ( = ?auto_508641 ?auto_508654 ) ) ( not ( = ?auto_508641 ?auto_508655 ) ) ( not ( = ?auto_508642 ?auto_508643 ) ) ( not ( = ?auto_508642 ?auto_508644 ) ) ( not ( = ?auto_508642 ?auto_508645 ) ) ( not ( = ?auto_508642 ?auto_508646 ) ) ( not ( = ?auto_508642 ?auto_508647 ) ) ( not ( = ?auto_508642 ?auto_508648 ) ) ( not ( = ?auto_508642 ?auto_508649 ) ) ( not ( = ?auto_508642 ?auto_508650 ) ) ( not ( = ?auto_508642 ?auto_508651 ) ) ( not ( = ?auto_508642 ?auto_508652 ) ) ( not ( = ?auto_508642 ?auto_508653 ) ) ( not ( = ?auto_508642 ?auto_508654 ) ) ( not ( = ?auto_508642 ?auto_508655 ) ) ( not ( = ?auto_508643 ?auto_508644 ) ) ( not ( = ?auto_508643 ?auto_508645 ) ) ( not ( = ?auto_508643 ?auto_508646 ) ) ( not ( = ?auto_508643 ?auto_508647 ) ) ( not ( = ?auto_508643 ?auto_508648 ) ) ( not ( = ?auto_508643 ?auto_508649 ) ) ( not ( = ?auto_508643 ?auto_508650 ) ) ( not ( = ?auto_508643 ?auto_508651 ) ) ( not ( = ?auto_508643 ?auto_508652 ) ) ( not ( = ?auto_508643 ?auto_508653 ) ) ( not ( = ?auto_508643 ?auto_508654 ) ) ( not ( = ?auto_508643 ?auto_508655 ) ) ( not ( = ?auto_508644 ?auto_508645 ) ) ( not ( = ?auto_508644 ?auto_508646 ) ) ( not ( = ?auto_508644 ?auto_508647 ) ) ( not ( = ?auto_508644 ?auto_508648 ) ) ( not ( = ?auto_508644 ?auto_508649 ) ) ( not ( = ?auto_508644 ?auto_508650 ) ) ( not ( = ?auto_508644 ?auto_508651 ) ) ( not ( = ?auto_508644 ?auto_508652 ) ) ( not ( = ?auto_508644 ?auto_508653 ) ) ( not ( = ?auto_508644 ?auto_508654 ) ) ( not ( = ?auto_508644 ?auto_508655 ) ) ( not ( = ?auto_508645 ?auto_508646 ) ) ( not ( = ?auto_508645 ?auto_508647 ) ) ( not ( = ?auto_508645 ?auto_508648 ) ) ( not ( = ?auto_508645 ?auto_508649 ) ) ( not ( = ?auto_508645 ?auto_508650 ) ) ( not ( = ?auto_508645 ?auto_508651 ) ) ( not ( = ?auto_508645 ?auto_508652 ) ) ( not ( = ?auto_508645 ?auto_508653 ) ) ( not ( = ?auto_508645 ?auto_508654 ) ) ( not ( = ?auto_508645 ?auto_508655 ) ) ( not ( = ?auto_508646 ?auto_508647 ) ) ( not ( = ?auto_508646 ?auto_508648 ) ) ( not ( = ?auto_508646 ?auto_508649 ) ) ( not ( = ?auto_508646 ?auto_508650 ) ) ( not ( = ?auto_508646 ?auto_508651 ) ) ( not ( = ?auto_508646 ?auto_508652 ) ) ( not ( = ?auto_508646 ?auto_508653 ) ) ( not ( = ?auto_508646 ?auto_508654 ) ) ( not ( = ?auto_508646 ?auto_508655 ) ) ( not ( = ?auto_508647 ?auto_508648 ) ) ( not ( = ?auto_508647 ?auto_508649 ) ) ( not ( = ?auto_508647 ?auto_508650 ) ) ( not ( = ?auto_508647 ?auto_508651 ) ) ( not ( = ?auto_508647 ?auto_508652 ) ) ( not ( = ?auto_508647 ?auto_508653 ) ) ( not ( = ?auto_508647 ?auto_508654 ) ) ( not ( = ?auto_508647 ?auto_508655 ) ) ( not ( = ?auto_508648 ?auto_508649 ) ) ( not ( = ?auto_508648 ?auto_508650 ) ) ( not ( = ?auto_508648 ?auto_508651 ) ) ( not ( = ?auto_508648 ?auto_508652 ) ) ( not ( = ?auto_508648 ?auto_508653 ) ) ( not ( = ?auto_508648 ?auto_508654 ) ) ( not ( = ?auto_508648 ?auto_508655 ) ) ( not ( = ?auto_508649 ?auto_508650 ) ) ( not ( = ?auto_508649 ?auto_508651 ) ) ( not ( = ?auto_508649 ?auto_508652 ) ) ( not ( = ?auto_508649 ?auto_508653 ) ) ( not ( = ?auto_508649 ?auto_508654 ) ) ( not ( = ?auto_508649 ?auto_508655 ) ) ( not ( = ?auto_508650 ?auto_508651 ) ) ( not ( = ?auto_508650 ?auto_508652 ) ) ( not ( = ?auto_508650 ?auto_508653 ) ) ( not ( = ?auto_508650 ?auto_508654 ) ) ( not ( = ?auto_508650 ?auto_508655 ) ) ( not ( = ?auto_508651 ?auto_508652 ) ) ( not ( = ?auto_508651 ?auto_508653 ) ) ( not ( = ?auto_508651 ?auto_508654 ) ) ( not ( = ?auto_508651 ?auto_508655 ) ) ( not ( = ?auto_508652 ?auto_508653 ) ) ( not ( = ?auto_508652 ?auto_508654 ) ) ( not ( = ?auto_508652 ?auto_508655 ) ) ( not ( = ?auto_508653 ?auto_508654 ) ) ( not ( = ?auto_508653 ?auto_508655 ) ) ( not ( = ?auto_508654 ?auto_508655 ) ) ( ON ?auto_508653 ?auto_508654 ) ( ON ?auto_508652 ?auto_508653 ) ( ON ?auto_508651 ?auto_508652 ) ( ON ?auto_508650 ?auto_508651 ) ( ON ?auto_508649 ?auto_508650 ) ( ON ?auto_508648 ?auto_508649 ) ( ON ?auto_508647 ?auto_508648 ) ( ON ?auto_508646 ?auto_508647 ) ( ON ?auto_508645 ?auto_508646 ) ( ON ?auto_508644 ?auto_508645 ) ( ON ?auto_508643 ?auto_508644 ) ( ON ?auto_508642 ?auto_508643 ) ( CLEAR ?auto_508640 ) ( ON ?auto_508641 ?auto_508642 ) ( CLEAR ?auto_508641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_508639 ?auto_508640 ?auto_508641 )
      ( MAKE-16PILE ?auto_508639 ?auto_508640 ?auto_508641 ?auto_508642 ?auto_508643 ?auto_508644 ?auto_508645 ?auto_508646 ?auto_508647 ?auto_508648 ?auto_508649 ?auto_508650 ?auto_508651 ?auto_508652 ?auto_508653 ?auto_508654 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508672 - BLOCK
      ?auto_508673 - BLOCK
      ?auto_508674 - BLOCK
      ?auto_508675 - BLOCK
      ?auto_508676 - BLOCK
      ?auto_508677 - BLOCK
      ?auto_508678 - BLOCK
      ?auto_508679 - BLOCK
      ?auto_508680 - BLOCK
      ?auto_508681 - BLOCK
      ?auto_508682 - BLOCK
      ?auto_508683 - BLOCK
      ?auto_508684 - BLOCK
      ?auto_508685 - BLOCK
      ?auto_508686 - BLOCK
      ?auto_508687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508687 ) ( ON-TABLE ?auto_508672 ) ( ON ?auto_508673 ?auto_508672 ) ( not ( = ?auto_508672 ?auto_508673 ) ) ( not ( = ?auto_508672 ?auto_508674 ) ) ( not ( = ?auto_508672 ?auto_508675 ) ) ( not ( = ?auto_508672 ?auto_508676 ) ) ( not ( = ?auto_508672 ?auto_508677 ) ) ( not ( = ?auto_508672 ?auto_508678 ) ) ( not ( = ?auto_508672 ?auto_508679 ) ) ( not ( = ?auto_508672 ?auto_508680 ) ) ( not ( = ?auto_508672 ?auto_508681 ) ) ( not ( = ?auto_508672 ?auto_508682 ) ) ( not ( = ?auto_508672 ?auto_508683 ) ) ( not ( = ?auto_508672 ?auto_508684 ) ) ( not ( = ?auto_508672 ?auto_508685 ) ) ( not ( = ?auto_508672 ?auto_508686 ) ) ( not ( = ?auto_508672 ?auto_508687 ) ) ( not ( = ?auto_508673 ?auto_508674 ) ) ( not ( = ?auto_508673 ?auto_508675 ) ) ( not ( = ?auto_508673 ?auto_508676 ) ) ( not ( = ?auto_508673 ?auto_508677 ) ) ( not ( = ?auto_508673 ?auto_508678 ) ) ( not ( = ?auto_508673 ?auto_508679 ) ) ( not ( = ?auto_508673 ?auto_508680 ) ) ( not ( = ?auto_508673 ?auto_508681 ) ) ( not ( = ?auto_508673 ?auto_508682 ) ) ( not ( = ?auto_508673 ?auto_508683 ) ) ( not ( = ?auto_508673 ?auto_508684 ) ) ( not ( = ?auto_508673 ?auto_508685 ) ) ( not ( = ?auto_508673 ?auto_508686 ) ) ( not ( = ?auto_508673 ?auto_508687 ) ) ( not ( = ?auto_508674 ?auto_508675 ) ) ( not ( = ?auto_508674 ?auto_508676 ) ) ( not ( = ?auto_508674 ?auto_508677 ) ) ( not ( = ?auto_508674 ?auto_508678 ) ) ( not ( = ?auto_508674 ?auto_508679 ) ) ( not ( = ?auto_508674 ?auto_508680 ) ) ( not ( = ?auto_508674 ?auto_508681 ) ) ( not ( = ?auto_508674 ?auto_508682 ) ) ( not ( = ?auto_508674 ?auto_508683 ) ) ( not ( = ?auto_508674 ?auto_508684 ) ) ( not ( = ?auto_508674 ?auto_508685 ) ) ( not ( = ?auto_508674 ?auto_508686 ) ) ( not ( = ?auto_508674 ?auto_508687 ) ) ( not ( = ?auto_508675 ?auto_508676 ) ) ( not ( = ?auto_508675 ?auto_508677 ) ) ( not ( = ?auto_508675 ?auto_508678 ) ) ( not ( = ?auto_508675 ?auto_508679 ) ) ( not ( = ?auto_508675 ?auto_508680 ) ) ( not ( = ?auto_508675 ?auto_508681 ) ) ( not ( = ?auto_508675 ?auto_508682 ) ) ( not ( = ?auto_508675 ?auto_508683 ) ) ( not ( = ?auto_508675 ?auto_508684 ) ) ( not ( = ?auto_508675 ?auto_508685 ) ) ( not ( = ?auto_508675 ?auto_508686 ) ) ( not ( = ?auto_508675 ?auto_508687 ) ) ( not ( = ?auto_508676 ?auto_508677 ) ) ( not ( = ?auto_508676 ?auto_508678 ) ) ( not ( = ?auto_508676 ?auto_508679 ) ) ( not ( = ?auto_508676 ?auto_508680 ) ) ( not ( = ?auto_508676 ?auto_508681 ) ) ( not ( = ?auto_508676 ?auto_508682 ) ) ( not ( = ?auto_508676 ?auto_508683 ) ) ( not ( = ?auto_508676 ?auto_508684 ) ) ( not ( = ?auto_508676 ?auto_508685 ) ) ( not ( = ?auto_508676 ?auto_508686 ) ) ( not ( = ?auto_508676 ?auto_508687 ) ) ( not ( = ?auto_508677 ?auto_508678 ) ) ( not ( = ?auto_508677 ?auto_508679 ) ) ( not ( = ?auto_508677 ?auto_508680 ) ) ( not ( = ?auto_508677 ?auto_508681 ) ) ( not ( = ?auto_508677 ?auto_508682 ) ) ( not ( = ?auto_508677 ?auto_508683 ) ) ( not ( = ?auto_508677 ?auto_508684 ) ) ( not ( = ?auto_508677 ?auto_508685 ) ) ( not ( = ?auto_508677 ?auto_508686 ) ) ( not ( = ?auto_508677 ?auto_508687 ) ) ( not ( = ?auto_508678 ?auto_508679 ) ) ( not ( = ?auto_508678 ?auto_508680 ) ) ( not ( = ?auto_508678 ?auto_508681 ) ) ( not ( = ?auto_508678 ?auto_508682 ) ) ( not ( = ?auto_508678 ?auto_508683 ) ) ( not ( = ?auto_508678 ?auto_508684 ) ) ( not ( = ?auto_508678 ?auto_508685 ) ) ( not ( = ?auto_508678 ?auto_508686 ) ) ( not ( = ?auto_508678 ?auto_508687 ) ) ( not ( = ?auto_508679 ?auto_508680 ) ) ( not ( = ?auto_508679 ?auto_508681 ) ) ( not ( = ?auto_508679 ?auto_508682 ) ) ( not ( = ?auto_508679 ?auto_508683 ) ) ( not ( = ?auto_508679 ?auto_508684 ) ) ( not ( = ?auto_508679 ?auto_508685 ) ) ( not ( = ?auto_508679 ?auto_508686 ) ) ( not ( = ?auto_508679 ?auto_508687 ) ) ( not ( = ?auto_508680 ?auto_508681 ) ) ( not ( = ?auto_508680 ?auto_508682 ) ) ( not ( = ?auto_508680 ?auto_508683 ) ) ( not ( = ?auto_508680 ?auto_508684 ) ) ( not ( = ?auto_508680 ?auto_508685 ) ) ( not ( = ?auto_508680 ?auto_508686 ) ) ( not ( = ?auto_508680 ?auto_508687 ) ) ( not ( = ?auto_508681 ?auto_508682 ) ) ( not ( = ?auto_508681 ?auto_508683 ) ) ( not ( = ?auto_508681 ?auto_508684 ) ) ( not ( = ?auto_508681 ?auto_508685 ) ) ( not ( = ?auto_508681 ?auto_508686 ) ) ( not ( = ?auto_508681 ?auto_508687 ) ) ( not ( = ?auto_508682 ?auto_508683 ) ) ( not ( = ?auto_508682 ?auto_508684 ) ) ( not ( = ?auto_508682 ?auto_508685 ) ) ( not ( = ?auto_508682 ?auto_508686 ) ) ( not ( = ?auto_508682 ?auto_508687 ) ) ( not ( = ?auto_508683 ?auto_508684 ) ) ( not ( = ?auto_508683 ?auto_508685 ) ) ( not ( = ?auto_508683 ?auto_508686 ) ) ( not ( = ?auto_508683 ?auto_508687 ) ) ( not ( = ?auto_508684 ?auto_508685 ) ) ( not ( = ?auto_508684 ?auto_508686 ) ) ( not ( = ?auto_508684 ?auto_508687 ) ) ( not ( = ?auto_508685 ?auto_508686 ) ) ( not ( = ?auto_508685 ?auto_508687 ) ) ( not ( = ?auto_508686 ?auto_508687 ) ) ( ON ?auto_508686 ?auto_508687 ) ( ON ?auto_508685 ?auto_508686 ) ( ON ?auto_508684 ?auto_508685 ) ( ON ?auto_508683 ?auto_508684 ) ( ON ?auto_508682 ?auto_508683 ) ( ON ?auto_508681 ?auto_508682 ) ( ON ?auto_508680 ?auto_508681 ) ( ON ?auto_508679 ?auto_508680 ) ( ON ?auto_508678 ?auto_508679 ) ( ON ?auto_508677 ?auto_508678 ) ( ON ?auto_508676 ?auto_508677 ) ( ON ?auto_508675 ?auto_508676 ) ( CLEAR ?auto_508673 ) ( ON ?auto_508674 ?auto_508675 ) ( CLEAR ?auto_508674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_508672 ?auto_508673 ?auto_508674 )
      ( MAKE-16PILE ?auto_508672 ?auto_508673 ?auto_508674 ?auto_508675 ?auto_508676 ?auto_508677 ?auto_508678 ?auto_508679 ?auto_508680 ?auto_508681 ?auto_508682 ?auto_508683 ?auto_508684 ?auto_508685 ?auto_508686 ?auto_508687 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508704 - BLOCK
      ?auto_508705 - BLOCK
      ?auto_508706 - BLOCK
      ?auto_508707 - BLOCK
      ?auto_508708 - BLOCK
      ?auto_508709 - BLOCK
      ?auto_508710 - BLOCK
      ?auto_508711 - BLOCK
      ?auto_508712 - BLOCK
      ?auto_508713 - BLOCK
      ?auto_508714 - BLOCK
      ?auto_508715 - BLOCK
      ?auto_508716 - BLOCK
      ?auto_508717 - BLOCK
      ?auto_508718 - BLOCK
      ?auto_508719 - BLOCK
    )
    :vars
    (
      ?auto_508720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508719 ?auto_508720 ) ( ON-TABLE ?auto_508704 ) ( not ( = ?auto_508704 ?auto_508705 ) ) ( not ( = ?auto_508704 ?auto_508706 ) ) ( not ( = ?auto_508704 ?auto_508707 ) ) ( not ( = ?auto_508704 ?auto_508708 ) ) ( not ( = ?auto_508704 ?auto_508709 ) ) ( not ( = ?auto_508704 ?auto_508710 ) ) ( not ( = ?auto_508704 ?auto_508711 ) ) ( not ( = ?auto_508704 ?auto_508712 ) ) ( not ( = ?auto_508704 ?auto_508713 ) ) ( not ( = ?auto_508704 ?auto_508714 ) ) ( not ( = ?auto_508704 ?auto_508715 ) ) ( not ( = ?auto_508704 ?auto_508716 ) ) ( not ( = ?auto_508704 ?auto_508717 ) ) ( not ( = ?auto_508704 ?auto_508718 ) ) ( not ( = ?auto_508704 ?auto_508719 ) ) ( not ( = ?auto_508704 ?auto_508720 ) ) ( not ( = ?auto_508705 ?auto_508706 ) ) ( not ( = ?auto_508705 ?auto_508707 ) ) ( not ( = ?auto_508705 ?auto_508708 ) ) ( not ( = ?auto_508705 ?auto_508709 ) ) ( not ( = ?auto_508705 ?auto_508710 ) ) ( not ( = ?auto_508705 ?auto_508711 ) ) ( not ( = ?auto_508705 ?auto_508712 ) ) ( not ( = ?auto_508705 ?auto_508713 ) ) ( not ( = ?auto_508705 ?auto_508714 ) ) ( not ( = ?auto_508705 ?auto_508715 ) ) ( not ( = ?auto_508705 ?auto_508716 ) ) ( not ( = ?auto_508705 ?auto_508717 ) ) ( not ( = ?auto_508705 ?auto_508718 ) ) ( not ( = ?auto_508705 ?auto_508719 ) ) ( not ( = ?auto_508705 ?auto_508720 ) ) ( not ( = ?auto_508706 ?auto_508707 ) ) ( not ( = ?auto_508706 ?auto_508708 ) ) ( not ( = ?auto_508706 ?auto_508709 ) ) ( not ( = ?auto_508706 ?auto_508710 ) ) ( not ( = ?auto_508706 ?auto_508711 ) ) ( not ( = ?auto_508706 ?auto_508712 ) ) ( not ( = ?auto_508706 ?auto_508713 ) ) ( not ( = ?auto_508706 ?auto_508714 ) ) ( not ( = ?auto_508706 ?auto_508715 ) ) ( not ( = ?auto_508706 ?auto_508716 ) ) ( not ( = ?auto_508706 ?auto_508717 ) ) ( not ( = ?auto_508706 ?auto_508718 ) ) ( not ( = ?auto_508706 ?auto_508719 ) ) ( not ( = ?auto_508706 ?auto_508720 ) ) ( not ( = ?auto_508707 ?auto_508708 ) ) ( not ( = ?auto_508707 ?auto_508709 ) ) ( not ( = ?auto_508707 ?auto_508710 ) ) ( not ( = ?auto_508707 ?auto_508711 ) ) ( not ( = ?auto_508707 ?auto_508712 ) ) ( not ( = ?auto_508707 ?auto_508713 ) ) ( not ( = ?auto_508707 ?auto_508714 ) ) ( not ( = ?auto_508707 ?auto_508715 ) ) ( not ( = ?auto_508707 ?auto_508716 ) ) ( not ( = ?auto_508707 ?auto_508717 ) ) ( not ( = ?auto_508707 ?auto_508718 ) ) ( not ( = ?auto_508707 ?auto_508719 ) ) ( not ( = ?auto_508707 ?auto_508720 ) ) ( not ( = ?auto_508708 ?auto_508709 ) ) ( not ( = ?auto_508708 ?auto_508710 ) ) ( not ( = ?auto_508708 ?auto_508711 ) ) ( not ( = ?auto_508708 ?auto_508712 ) ) ( not ( = ?auto_508708 ?auto_508713 ) ) ( not ( = ?auto_508708 ?auto_508714 ) ) ( not ( = ?auto_508708 ?auto_508715 ) ) ( not ( = ?auto_508708 ?auto_508716 ) ) ( not ( = ?auto_508708 ?auto_508717 ) ) ( not ( = ?auto_508708 ?auto_508718 ) ) ( not ( = ?auto_508708 ?auto_508719 ) ) ( not ( = ?auto_508708 ?auto_508720 ) ) ( not ( = ?auto_508709 ?auto_508710 ) ) ( not ( = ?auto_508709 ?auto_508711 ) ) ( not ( = ?auto_508709 ?auto_508712 ) ) ( not ( = ?auto_508709 ?auto_508713 ) ) ( not ( = ?auto_508709 ?auto_508714 ) ) ( not ( = ?auto_508709 ?auto_508715 ) ) ( not ( = ?auto_508709 ?auto_508716 ) ) ( not ( = ?auto_508709 ?auto_508717 ) ) ( not ( = ?auto_508709 ?auto_508718 ) ) ( not ( = ?auto_508709 ?auto_508719 ) ) ( not ( = ?auto_508709 ?auto_508720 ) ) ( not ( = ?auto_508710 ?auto_508711 ) ) ( not ( = ?auto_508710 ?auto_508712 ) ) ( not ( = ?auto_508710 ?auto_508713 ) ) ( not ( = ?auto_508710 ?auto_508714 ) ) ( not ( = ?auto_508710 ?auto_508715 ) ) ( not ( = ?auto_508710 ?auto_508716 ) ) ( not ( = ?auto_508710 ?auto_508717 ) ) ( not ( = ?auto_508710 ?auto_508718 ) ) ( not ( = ?auto_508710 ?auto_508719 ) ) ( not ( = ?auto_508710 ?auto_508720 ) ) ( not ( = ?auto_508711 ?auto_508712 ) ) ( not ( = ?auto_508711 ?auto_508713 ) ) ( not ( = ?auto_508711 ?auto_508714 ) ) ( not ( = ?auto_508711 ?auto_508715 ) ) ( not ( = ?auto_508711 ?auto_508716 ) ) ( not ( = ?auto_508711 ?auto_508717 ) ) ( not ( = ?auto_508711 ?auto_508718 ) ) ( not ( = ?auto_508711 ?auto_508719 ) ) ( not ( = ?auto_508711 ?auto_508720 ) ) ( not ( = ?auto_508712 ?auto_508713 ) ) ( not ( = ?auto_508712 ?auto_508714 ) ) ( not ( = ?auto_508712 ?auto_508715 ) ) ( not ( = ?auto_508712 ?auto_508716 ) ) ( not ( = ?auto_508712 ?auto_508717 ) ) ( not ( = ?auto_508712 ?auto_508718 ) ) ( not ( = ?auto_508712 ?auto_508719 ) ) ( not ( = ?auto_508712 ?auto_508720 ) ) ( not ( = ?auto_508713 ?auto_508714 ) ) ( not ( = ?auto_508713 ?auto_508715 ) ) ( not ( = ?auto_508713 ?auto_508716 ) ) ( not ( = ?auto_508713 ?auto_508717 ) ) ( not ( = ?auto_508713 ?auto_508718 ) ) ( not ( = ?auto_508713 ?auto_508719 ) ) ( not ( = ?auto_508713 ?auto_508720 ) ) ( not ( = ?auto_508714 ?auto_508715 ) ) ( not ( = ?auto_508714 ?auto_508716 ) ) ( not ( = ?auto_508714 ?auto_508717 ) ) ( not ( = ?auto_508714 ?auto_508718 ) ) ( not ( = ?auto_508714 ?auto_508719 ) ) ( not ( = ?auto_508714 ?auto_508720 ) ) ( not ( = ?auto_508715 ?auto_508716 ) ) ( not ( = ?auto_508715 ?auto_508717 ) ) ( not ( = ?auto_508715 ?auto_508718 ) ) ( not ( = ?auto_508715 ?auto_508719 ) ) ( not ( = ?auto_508715 ?auto_508720 ) ) ( not ( = ?auto_508716 ?auto_508717 ) ) ( not ( = ?auto_508716 ?auto_508718 ) ) ( not ( = ?auto_508716 ?auto_508719 ) ) ( not ( = ?auto_508716 ?auto_508720 ) ) ( not ( = ?auto_508717 ?auto_508718 ) ) ( not ( = ?auto_508717 ?auto_508719 ) ) ( not ( = ?auto_508717 ?auto_508720 ) ) ( not ( = ?auto_508718 ?auto_508719 ) ) ( not ( = ?auto_508718 ?auto_508720 ) ) ( not ( = ?auto_508719 ?auto_508720 ) ) ( ON ?auto_508718 ?auto_508719 ) ( ON ?auto_508717 ?auto_508718 ) ( ON ?auto_508716 ?auto_508717 ) ( ON ?auto_508715 ?auto_508716 ) ( ON ?auto_508714 ?auto_508715 ) ( ON ?auto_508713 ?auto_508714 ) ( ON ?auto_508712 ?auto_508713 ) ( ON ?auto_508711 ?auto_508712 ) ( ON ?auto_508710 ?auto_508711 ) ( ON ?auto_508709 ?auto_508710 ) ( ON ?auto_508708 ?auto_508709 ) ( ON ?auto_508707 ?auto_508708 ) ( ON ?auto_508706 ?auto_508707 ) ( CLEAR ?auto_508704 ) ( ON ?auto_508705 ?auto_508706 ) ( CLEAR ?auto_508705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_508704 ?auto_508705 )
      ( MAKE-16PILE ?auto_508704 ?auto_508705 ?auto_508706 ?auto_508707 ?auto_508708 ?auto_508709 ?auto_508710 ?auto_508711 ?auto_508712 ?auto_508713 ?auto_508714 ?auto_508715 ?auto_508716 ?auto_508717 ?auto_508718 ?auto_508719 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508737 - BLOCK
      ?auto_508738 - BLOCK
      ?auto_508739 - BLOCK
      ?auto_508740 - BLOCK
      ?auto_508741 - BLOCK
      ?auto_508742 - BLOCK
      ?auto_508743 - BLOCK
      ?auto_508744 - BLOCK
      ?auto_508745 - BLOCK
      ?auto_508746 - BLOCK
      ?auto_508747 - BLOCK
      ?auto_508748 - BLOCK
      ?auto_508749 - BLOCK
      ?auto_508750 - BLOCK
      ?auto_508751 - BLOCK
      ?auto_508752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508752 ) ( ON-TABLE ?auto_508737 ) ( not ( = ?auto_508737 ?auto_508738 ) ) ( not ( = ?auto_508737 ?auto_508739 ) ) ( not ( = ?auto_508737 ?auto_508740 ) ) ( not ( = ?auto_508737 ?auto_508741 ) ) ( not ( = ?auto_508737 ?auto_508742 ) ) ( not ( = ?auto_508737 ?auto_508743 ) ) ( not ( = ?auto_508737 ?auto_508744 ) ) ( not ( = ?auto_508737 ?auto_508745 ) ) ( not ( = ?auto_508737 ?auto_508746 ) ) ( not ( = ?auto_508737 ?auto_508747 ) ) ( not ( = ?auto_508737 ?auto_508748 ) ) ( not ( = ?auto_508737 ?auto_508749 ) ) ( not ( = ?auto_508737 ?auto_508750 ) ) ( not ( = ?auto_508737 ?auto_508751 ) ) ( not ( = ?auto_508737 ?auto_508752 ) ) ( not ( = ?auto_508738 ?auto_508739 ) ) ( not ( = ?auto_508738 ?auto_508740 ) ) ( not ( = ?auto_508738 ?auto_508741 ) ) ( not ( = ?auto_508738 ?auto_508742 ) ) ( not ( = ?auto_508738 ?auto_508743 ) ) ( not ( = ?auto_508738 ?auto_508744 ) ) ( not ( = ?auto_508738 ?auto_508745 ) ) ( not ( = ?auto_508738 ?auto_508746 ) ) ( not ( = ?auto_508738 ?auto_508747 ) ) ( not ( = ?auto_508738 ?auto_508748 ) ) ( not ( = ?auto_508738 ?auto_508749 ) ) ( not ( = ?auto_508738 ?auto_508750 ) ) ( not ( = ?auto_508738 ?auto_508751 ) ) ( not ( = ?auto_508738 ?auto_508752 ) ) ( not ( = ?auto_508739 ?auto_508740 ) ) ( not ( = ?auto_508739 ?auto_508741 ) ) ( not ( = ?auto_508739 ?auto_508742 ) ) ( not ( = ?auto_508739 ?auto_508743 ) ) ( not ( = ?auto_508739 ?auto_508744 ) ) ( not ( = ?auto_508739 ?auto_508745 ) ) ( not ( = ?auto_508739 ?auto_508746 ) ) ( not ( = ?auto_508739 ?auto_508747 ) ) ( not ( = ?auto_508739 ?auto_508748 ) ) ( not ( = ?auto_508739 ?auto_508749 ) ) ( not ( = ?auto_508739 ?auto_508750 ) ) ( not ( = ?auto_508739 ?auto_508751 ) ) ( not ( = ?auto_508739 ?auto_508752 ) ) ( not ( = ?auto_508740 ?auto_508741 ) ) ( not ( = ?auto_508740 ?auto_508742 ) ) ( not ( = ?auto_508740 ?auto_508743 ) ) ( not ( = ?auto_508740 ?auto_508744 ) ) ( not ( = ?auto_508740 ?auto_508745 ) ) ( not ( = ?auto_508740 ?auto_508746 ) ) ( not ( = ?auto_508740 ?auto_508747 ) ) ( not ( = ?auto_508740 ?auto_508748 ) ) ( not ( = ?auto_508740 ?auto_508749 ) ) ( not ( = ?auto_508740 ?auto_508750 ) ) ( not ( = ?auto_508740 ?auto_508751 ) ) ( not ( = ?auto_508740 ?auto_508752 ) ) ( not ( = ?auto_508741 ?auto_508742 ) ) ( not ( = ?auto_508741 ?auto_508743 ) ) ( not ( = ?auto_508741 ?auto_508744 ) ) ( not ( = ?auto_508741 ?auto_508745 ) ) ( not ( = ?auto_508741 ?auto_508746 ) ) ( not ( = ?auto_508741 ?auto_508747 ) ) ( not ( = ?auto_508741 ?auto_508748 ) ) ( not ( = ?auto_508741 ?auto_508749 ) ) ( not ( = ?auto_508741 ?auto_508750 ) ) ( not ( = ?auto_508741 ?auto_508751 ) ) ( not ( = ?auto_508741 ?auto_508752 ) ) ( not ( = ?auto_508742 ?auto_508743 ) ) ( not ( = ?auto_508742 ?auto_508744 ) ) ( not ( = ?auto_508742 ?auto_508745 ) ) ( not ( = ?auto_508742 ?auto_508746 ) ) ( not ( = ?auto_508742 ?auto_508747 ) ) ( not ( = ?auto_508742 ?auto_508748 ) ) ( not ( = ?auto_508742 ?auto_508749 ) ) ( not ( = ?auto_508742 ?auto_508750 ) ) ( not ( = ?auto_508742 ?auto_508751 ) ) ( not ( = ?auto_508742 ?auto_508752 ) ) ( not ( = ?auto_508743 ?auto_508744 ) ) ( not ( = ?auto_508743 ?auto_508745 ) ) ( not ( = ?auto_508743 ?auto_508746 ) ) ( not ( = ?auto_508743 ?auto_508747 ) ) ( not ( = ?auto_508743 ?auto_508748 ) ) ( not ( = ?auto_508743 ?auto_508749 ) ) ( not ( = ?auto_508743 ?auto_508750 ) ) ( not ( = ?auto_508743 ?auto_508751 ) ) ( not ( = ?auto_508743 ?auto_508752 ) ) ( not ( = ?auto_508744 ?auto_508745 ) ) ( not ( = ?auto_508744 ?auto_508746 ) ) ( not ( = ?auto_508744 ?auto_508747 ) ) ( not ( = ?auto_508744 ?auto_508748 ) ) ( not ( = ?auto_508744 ?auto_508749 ) ) ( not ( = ?auto_508744 ?auto_508750 ) ) ( not ( = ?auto_508744 ?auto_508751 ) ) ( not ( = ?auto_508744 ?auto_508752 ) ) ( not ( = ?auto_508745 ?auto_508746 ) ) ( not ( = ?auto_508745 ?auto_508747 ) ) ( not ( = ?auto_508745 ?auto_508748 ) ) ( not ( = ?auto_508745 ?auto_508749 ) ) ( not ( = ?auto_508745 ?auto_508750 ) ) ( not ( = ?auto_508745 ?auto_508751 ) ) ( not ( = ?auto_508745 ?auto_508752 ) ) ( not ( = ?auto_508746 ?auto_508747 ) ) ( not ( = ?auto_508746 ?auto_508748 ) ) ( not ( = ?auto_508746 ?auto_508749 ) ) ( not ( = ?auto_508746 ?auto_508750 ) ) ( not ( = ?auto_508746 ?auto_508751 ) ) ( not ( = ?auto_508746 ?auto_508752 ) ) ( not ( = ?auto_508747 ?auto_508748 ) ) ( not ( = ?auto_508747 ?auto_508749 ) ) ( not ( = ?auto_508747 ?auto_508750 ) ) ( not ( = ?auto_508747 ?auto_508751 ) ) ( not ( = ?auto_508747 ?auto_508752 ) ) ( not ( = ?auto_508748 ?auto_508749 ) ) ( not ( = ?auto_508748 ?auto_508750 ) ) ( not ( = ?auto_508748 ?auto_508751 ) ) ( not ( = ?auto_508748 ?auto_508752 ) ) ( not ( = ?auto_508749 ?auto_508750 ) ) ( not ( = ?auto_508749 ?auto_508751 ) ) ( not ( = ?auto_508749 ?auto_508752 ) ) ( not ( = ?auto_508750 ?auto_508751 ) ) ( not ( = ?auto_508750 ?auto_508752 ) ) ( not ( = ?auto_508751 ?auto_508752 ) ) ( ON ?auto_508751 ?auto_508752 ) ( ON ?auto_508750 ?auto_508751 ) ( ON ?auto_508749 ?auto_508750 ) ( ON ?auto_508748 ?auto_508749 ) ( ON ?auto_508747 ?auto_508748 ) ( ON ?auto_508746 ?auto_508747 ) ( ON ?auto_508745 ?auto_508746 ) ( ON ?auto_508744 ?auto_508745 ) ( ON ?auto_508743 ?auto_508744 ) ( ON ?auto_508742 ?auto_508743 ) ( ON ?auto_508741 ?auto_508742 ) ( ON ?auto_508740 ?auto_508741 ) ( ON ?auto_508739 ?auto_508740 ) ( CLEAR ?auto_508737 ) ( ON ?auto_508738 ?auto_508739 ) ( CLEAR ?auto_508738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_508737 ?auto_508738 )
      ( MAKE-16PILE ?auto_508737 ?auto_508738 ?auto_508739 ?auto_508740 ?auto_508741 ?auto_508742 ?auto_508743 ?auto_508744 ?auto_508745 ?auto_508746 ?auto_508747 ?auto_508748 ?auto_508749 ?auto_508750 ?auto_508751 ?auto_508752 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508769 - BLOCK
      ?auto_508770 - BLOCK
      ?auto_508771 - BLOCK
      ?auto_508772 - BLOCK
      ?auto_508773 - BLOCK
      ?auto_508774 - BLOCK
      ?auto_508775 - BLOCK
      ?auto_508776 - BLOCK
      ?auto_508777 - BLOCK
      ?auto_508778 - BLOCK
      ?auto_508779 - BLOCK
      ?auto_508780 - BLOCK
      ?auto_508781 - BLOCK
      ?auto_508782 - BLOCK
      ?auto_508783 - BLOCK
      ?auto_508784 - BLOCK
    )
    :vars
    (
      ?auto_508785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_508784 ?auto_508785 ) ( not ( = ?auto_508769 ?auto_508770 ) ) ( not ( = ?auto_508769 ?auto_508771 ) ) ( not ( = ?auto_508769 ?auto_508772 ) ) ( not ( = ?auto_508769 ?auto_508773 ) ) ( not ( = ?auto_508769 ?auto_508774 ) ) ( not ( = ?auto_508769 ?auto_508775 ) ) ( not ( = ?auto_508769 ?auto_508776 ) ) ( not ( = ?auto_508769 ?auto_508777 ) ) ( not ( = ?auto_508769 ?auto_508778 ) ) ( not ( = ?auto_508769 ?auto_508779 ) ) ( not ( = ?auto_508769 ?auto_508780 ) ) ( not ( = ?auto_508769 ?auto_508781 ) ) ( not ( = ?auto_508769 ?auto_508782 ) ) ( not ( = ?auto_508769 ?auto_508783 ) ) ( not ( = ?auto_508769 ?auto_508784 ) ) ( not ( = ?auto_508769 ?auto_508785 ) ) ( not ( = ?auto_508770 ?auto_508771 ) ) ( not ( = ?auto_508770 ?auto_508772 ) ) ( not ( = ?auto_508770 ?auto_508773 ) ) ( not ( = ?auto_508770 ?auto_508774 ) ) ( not ( = ?auto_508770 ?auto_508775 ) ) ( not ( = ?auto_508770 ?auto_508776 ) ) ( not ( = ?auto_508770 ?auto_508777 ) ) ( not ( = ?auto_508770 ?auto_508778 ) ) ( not ( = ?auto_508770 ?auto_508779 ) ) ( not ( = ?auto_508770 ?auto_508780 ) ) ( not ( = ?auto_508770 ?auto_508781 ) ) ( not ( = ?auto_508770 ?auto_508782 ) ) ( not ( = ?auto_508770 ?auto_508783 ) ) ( not ( = ?auto_508770 ?auto_508784 ) ) ( not ( = ?auto_508770 ?auto_508785 ) ) ( not ( = ?auto_508771 ?auto_508772 ) ) ( not ( = ?auto_508771 ?auto_508773 ) ) ( not ( = ?auto_508771 ?auto_508774 ) ) ( not ( = ?auto_508771 ?auto_508775 ) ) ( not ( = ?auto_508771 ?auto_508776 ) ) ( not ( = ?auto_508771 ?auto_508777 ) ) ( not ( = ?auto_508771 ?auto_508778 ) ) ( not ( = ?auto_508771 ?auto_508779 ) ) ( not ( = ?auto_508771 ?auto_508780 ) ) ( not ( = ?auto_508771 ?auto_508781 ) ) ( not ( = ?auto_508771 ?auto_508782 ) ) ( not ( = ?auto_508771 ?auto_508783 ) ) ( not ( = ?auto_508771 ?auto_508784 ) ) ( not ( = ?auto_508771 ?auto_508785 ) ) ( not ( = ?auto_508772 ?auto_508773 ) ) ( not ( = ?auto_508772 ?auto_508774 ) ) ( not ( = ?auto_508772 ?auto_508775 ) ) ( not ( = ?auto_508772 ?auto_508776 ) ) ( not ( = ?auto_508772 ?auto_508777 ) ) ( not ( = ?auto_508772 ?auto_508778 ) ) ( not ( = ?auto_508772 ?auto_508779 ) ) ( not ( = ?auto_508772 ?auto_508780 ) ) ( not ( = ?auto_508772 ?auto_508781 ) ) ( not ( = ?auto_508772 ?auto_508782 ) ) ( not ( = ?auto_508772 ?auto_508783 ) ) ( not ( = ?auto_508772 ?auto_508784 ) ) ( not ( = ?auto_508772 ?auto_508785 ) ) ( not ( = ?auto_508773 ?auto_508774 ) ) ( not ( = ?auto_508773 ?auto_508775 ) ) ( not ( = ?auto_508773 ?auto_508776 ) ) ( not ( = ?auto_508773 ?auto_508777 ) ) ( not ( = ?auto_508773 ?auto_508778 ) ) ( not ( = ?auto_508773 ?auto_508779 ) ) ( not ( = ?auto_508773 ?auto_508780 ) ) ( not ( = ?auto_508773 ?auto_508781 ) ) ( not ( = ?auto_508773 ?auto_508782 ) ) ( not ( = ?auto_508773 ?auto_508783 ) ) ( not ( = ?auto_508773 ?auto_508784 ) ) ( not ( = ?auto_508773 ?auto_508785 ) ) ( not ( = ?auto_508774 ?auto_508775 ) ) ( not ( = ?auto_508774 ?auto_508776 ) ) ( not ( = ?auto_508774 ?auto_508777 ) ) ( not ( = ?auto_508774 ?auto_508778 ) ) ( not ( = ?auto_508774 ?auto_508779 ) ) ( not ( = ?auto_508774 ?auto_508780 ) ) ( not ( = ?auto_508774 ?auto_508781 ) ) ( not ( = ?auto_508774 ?auto_508782 ) ) ( not ( = ?auto_508774 ?auto_508783 ) ) ( not ( = ?auto_508774 ?auto_508784 ) ) ( not ( = ?auto_508774 ?auto_508785 ) ) ( not ( = ?auto_508775 ?auto_508776 ) ) ( not ( = ?auto_508775 ?auto_508777 ) ) ( not ( = ?auto_508775 ?auto_508778 ) ) ( not ( = ?auto_508775 ?auto_508779 ) ) ( not ( = ?auto_508775 ?auto_508780 ) ) ( not ( = ?auto_508775 ?auto_508781 ) ) ( not ( = ?auto_508775 ?auto_508782 ) ) ( not ( = ?auto_508775 ?auto_508783 ) ) ( not ( = ?auto_508775 ?auto_508784 ) ) ( not ( = ?auto_508775 ?auto_508785 ) ) ( not ( = ?auto_508776 ?auto_508777 ) ) ( not ( = ?auto_508776 ?auto_508778 ) ) ( not ( = ?auto_508776 ?auto_508779 ) ) ( not ( = ?auto_508776 ?auto_508780 ) ) ( not ( = ?auto_508776 ?auto_508781 ) ) ( not ( = ?auto_508776 ?auto_508782 ) ) ( not ( = ?auto_508776 ?auto_508783 ) ) ( not ( = ?auto_508776 ?auto_508784 ) ) ( not ( = ?auto_508776 ?auto_508785 ) ) ( not ( = ?auto_508777 ?auto_508778 ) ) ( not ( = ?auto_508777 ?auto_508779 ) ) ( not ( = ?auto_508777 ?auto_508780 ) ) ( not ( = ?auto_508777 ?auto_508781 ) ) ( not ( = ?auto_508777 ?auto_508782 ) ) ( not ( = ?auto_508777 ?auto_508783 ) ) ( not ( = ?auto_508777 ?auto_508784 ) ) ( not ( = ?auto_508777 ?auto_508785 ) ) ( not ( = ?auto_508778 ?auto_508779 ) ) ( not ( = ?auto_508778 ?auto_508780 ) ) ( not ( = ?auto_508778 ?auto_508781 ) ) ( not ( = ?auto_508778 ?auto_508782 ) ) ( not ( = ?auto_508778 ?auto_508783 ) ) ( not ( = ?auto_508778 ?auto_508784 ) ) ( not ( = ?auto_508778 ?auto_508785 ) ) ( not ( = ?auto_508779 ?auto_508780 ) ) ( not ( = ?auto_508779 ?auto_508781 ) ) ( not ( = ?auto_508779 ?auto_508782 ) ) ( not ( = ?auto_508779 ?auto_508783 ) ) ( not ( = ?auto_508779 ?auto_508784 ) ) ( not ( = ?auto_508779 ?auto_508785 ) ) ( not ( = ?auto_508780 ?auto_508781 ) ) ( not ( = ?auto_508780 ?auto_508782 ) ) ( not ( = ?auto_508780 ?auto_508783 ) ) ( not ( = ?auto_508780 ?auto_508784 ) ) ( not ( = ?auto_508780 ?auto_508785 ) ) ( not ( = ?auto_508781 ?auto_508782 ) ) ( not ( = ?auto_508781 ?auto_508783 ) ) ( not ( = ?auto_508781 ?auto_508784 ) ) ( not ( = ?auto_508781 ?auto_508785 ) ) ( not ( = ?auto_508782 ?auto_508783 ) ) ( not ( = ?auto_508782 ?auto_508784 ) ) ( not ( = ?auto_508782 ?auto_508785 ) ) ( not ( = ?auto_508783 ?auto_508784 ) ) ( not ( = ?auto_508783 ?auto_508785 ) ) ( not ( = ?auto_508784 ?auto_508785 ) ) ( ON ?auto_508783 ?auto_508784 ) ( ON ?auto_508782 ?auto_508783 ) ( ON ?auto_508781 ?auto_508782 ) ( ON ?auto_508780 ?auto_508781 ) ( ON ?auto_508779 ?auto_508780 ) ( ON ?auto_508778 ?auto_508779 ) ( ON ?auto_508777 ?auto_508778 ) ( ON ?auto_508776 ?auto_508777 ) ( ON ?auto_508775 ?auto_508776 ) ( ON ?auto_508774 ?auto_508775 ) ( ON ?auto_508773 ?auto_508774 ) ( ON ?auto_508772 ?auto_508773 ) ( ON ?auto_508771 ?auto_508772 ) ( ON ?auto_508770 ?auto_508771 ) ( ON ?auto_508769 ?auto_508770 ) ( CLEAR ?auto_508769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_508769 )
      ( MAKE-16PILE ?auto_508769 ?auto_508770 ?auto_508771 ?auto_508772 ?auto_508773 ?auto_508774 ?auto_508775 ?auto_508776 ?auto_508777 ?auto_508778 ?auto_508779 ?auto_508780 ?auto_508781 ?auto_508782 ?auto_508783 ?auto_508784 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508802 - BLOCK
      ?auto_508803 - BLOCK
      ?auto_508804 - BLOCK
      ?auto_508805 - BLOCK
      ?auto_508806 - BLOCK
      ?auto_508807 - BLOCK
      ?auto_508808 - BLOCK
      ?auto_508809 - BLOCK
      ?auto_508810 - BLOCK
      ?auto_508811 - BLOCK
      ?auto_508812 - BLOCK
      ?auto_508813 - BLOCK
      ?auto_508814 - BLOCK
      ?auto_508815 - BLOCK
      ?auto_508816 - BLOCK
      ?auto_508817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_508817 ) ( not ( = ?auto_508802 ?auto_508803 ) ) ( not ( = ?auto_508802 ?auto_508804 ) ) ( not ( = ?auto_508802 ?auto_508805 ) ) ( not ( = ?auto_508802 ?auto_508806 ) ) ( not ( = ?auto_508802 ?auto_508807 ) ) ( not ( = ?auto_508802 ?auto_508808 ) ) ( not ( = ?auto_508802 ?auto_508809 ) ) ( not ( = ?auto_508802 ?auto_508810 ) ) ( not ( = ?auto_508802 ?auto_508811 ) ) ( not ( = ?auto_508802 ?auto_508812 ) ) ( not ( = ?auto_508802 ?auto_508813 ) ) ( not ( = ?auto_508802 ?auto_508814 ) ) ( not ( = ?auto_508802 ?auto_508815 ) ) ( not ( = ?auto_508802 ?auto_508816 ) ) ( not ( = ?auto_508802 ?auto_508817 ) ) ( not ( = ?auto_508803 ?auto_508804 ) ) ( not ( = ?auto_508803 ?auto_508805 ) ) ( not ( = ?auto_508803 ?auto_508806 ) ) ( not ( = ?auto_508803 ?auto_508807 ) ) ( not ( = ?auto_508803 ?auto_508808 ) ) ( not ( = ?auto_508803 ?auto_508809 ) ) ( not ( = ?auto_508803 ?auto_508810 ) ) ( not ( = ?auto_508803 ?auto_508811 ) ) ( not ( = ?auto_508803 ?auto_508812 ) ) ( not ( = ?auto_508803 ?auto_508813 ) ) ( not ( = ?auto_508803 ?auto_508814 ) ) ( not ( = ?auto_508803 ?auto_508815 ) ) ( not ( = ?auto_508803 ?auto_508816 ) ) ( not ( = ?auto_508803 ?auto_508817 ) ) ( not ( = ?auto_508804 ?auto_508805 ) ) ( not ( = ?auto_508804 ?auto_508806 ) ) ( not ( = ?auto_508804 ?auto_508807 ) ) ( not ( = ?auto_508804 ?auto_508808 ) ) ( not ( = ?auto_508804 ?auto_508809 ) ) ( not ( = ?auto_508804 ?auto_508810 ) ) ( not ( = ?auto_508804 ?auto_508811 ) ) ( not ( = ?auto_508804 ?auto_508812 ) ) ( not ( = ?auto_508804 ?auto_508813 ) ) ( not ( = ?auto_508804 ?auto_508814 ) ) ( not ( = ?auto_508804 ?auto_508815 ) ) ( not ( = ?auto_508804 ?auto_508816 ) ) ( not ( = ?auto_508804 ?auto_508817 ) ) ( not ( = ?auto_508805 ?auto_508806 ) ) ( not ( = ?auto_508805 ?auto_508807 ) ) ( not ( = ?auto_508805 ?auto_508808 ) ) ( not ( = ?auto_508805 ?auto_508809 ) ) ( not ( = ?auto_508805 ?auto_508810 ) ) ( not ( = ?auto_508805 ?auto_508811 ) ) ( not ( = ?auto_508805 ?auto_508812 ) ) ( not ( = ?auto_508805 ?auto_508813 ) ) ( not ( = ?auto_508805 ?auto_508814 ) ) ( not ( = ?auto_508805 ?auto_508815 ) ) ( not ( = ?auto_508805 ?auto_508816 ) ) ( not ( = ?auto_508805 ?auto_508817 ) ) ( not ( = ?auto_508806 ?auto_508807 ) ) ( not ( = ?auto_508806 ?auto_508808 ) ) ( not ( = ?auto_508806 ?auto_508809 ) ) ( not ( = ?auto_508806 ?auto_508810 ) ) ( not ( = ?auto_508806 ?auto_508811 ) ) ( not ( = ?auto_508806 ?auto_508812 ) ) ( not ( = ?auto_508806 ?auto_508813 ) ) ( not ( = ?auto_508806 ?auto_508814 ) ) ( not ( = ?auto_508806 ?auto_508815 ) ) ( not ( = ?auto_508806 ?auto_508816 ) ) ( not ( = ?auto_508806 ?auto_508817 ) ) ( not ( = ?auto_508807 ?auto_508808 ) ) ( not ( = ?auto_508807 ?auto_508809 ) ) ( not ( = ?auto_508807 ?auto_508810 ) ) ( not ( = ?auto_508807 ?auto_508811 ) ) ( not ( = ?auto_508807 ?auto_508812 ) ) ( not ( = ?auto_508807 ?auto_508813 ) ) ( not ( = ?auto_508807 ?auto_508814 ) ) ( not ( = ?auto_508807 ?auto_508815 ) ) ( not ( = ?auto_508807 ?auto_508816 ) ) ( not ( = ?auto_508807 ?auto_508817 ) ) ( not ( = ?auto_508808 ?auto_508809 ) ) ( not ( = ?auto_508808 ?auto_508810 ) ) ( not ( = ?auto_508808 ?auto_508811 ) ) ( not ( = ?auto_508808 ?auto_508812 ) ) ( not ( = ?auto_508808 ?auto_508813 ) ) ( not ( = ?auto_508808 ?auto_508814 ) ) ( not ( = ?auto_508808 ?auto_508815 ) ) ( not ( = ?auto_508808 ?auto_508816 ) ) ( not ( = ?auto_508808 ?auto_508817 ) ) ( not ( = ?auto_508809 ?auto_508810 ) ) ( not ( = ?auto_508809 ?auto_508811 ) ) ( not ( = ?auto_508809 ?auto_508812 ) ) ( not ( = ?auto_508809 ?auto_508813 ) ) ( not ( = ?auto_508809 ?auto_508814 ) ) ( not ( = ?auto_508809 ?auto_508815 ) ) ( not ( = ?auto_508809 ?auto_508816 ) ) ( not ( = ?auto_508809 ?auto_508817 ) ) ( not ( = ?auto_508810 ?auto_508811 ) ) ( not ( = ?auto_508810 ?auto_508812 ) ) ( not ( = ?auto_508810 ?auto_508813 ) ) ( not ( = ?auto_508810 ?auto_508814 ) ) ( not ( = ?auto_508810 ?auto_508815 ) ) ( not ( = ?auto_508810 ?auto_508816 ) ) ( not ( = ?auto_508810 ?auto_508817 ) ) ( not ( = ?auto_508811 ?auto_508812 ) ) ( not ( = ?auto_508811 ?auto_508813 ) ) ( not ( = ?auto_508811 ?auto_508814 ) ) ( not ( = ?auto_508811 ?auto_508815 ) ) ( not ( = ?auto_508811 ?auto_508816 ) ) ( not ( = ?auto_508811 ?auto_508817 ) ) ( not ( = ?auto_508812 ?auto_508813 ) ) ( not ( = ?auto_508812 ?auto_508814 ) ) ( not ( = ?auto_508812 ?auto_508815 ) ) ( not ( = ?auto_508812 ?auto_508816 ) ) ( not ( = ?auto_508812 ?auto_508817 ) ) ( not ( = ?auto_508813 ?auto_508814 ) ) ( not ( = ?auto_508813 ?auto_508815 ) ) ( not ( = ?auto_508813 ?auto_508816 ) ) ( not ( = ?auto_508813 ?auto_508817 ) ) ( not ( = ?auto_508814 ?auto_508815 ) ) ( not ( = ?auto_508814 ?auto_508816 ) ) ( not ( = ?auto_508814 ?auto_508817 ) ) ( not ( = ?auto_508815 ?auto_508816 ) ) ( not ( = ?auto_508815 ?auto_508817 ) ) ( not ( = ?auto_508816 ?auto_508817 ) ) ( ON ?auto_508816 ?auto_508817 ) ( ON ?auto_508815 ?auto_508816 ) ( ON ?auto_508814 ?auto_508815 ) ( ON ?auto_508813 ?auto_508814 ) ( ON ?auto_508812 ?auto_508813 ) ( ON ?auto_508811 ?auto_508812 ) ( ON ?auto_508810 ?auto_508811 ) ( ON ?auto_508809 ?auto_508810 ) ( ON ?auto_508808 ?auto_508809 ) ( ON ?auto_508807 ?auto_508808 ) ( ON ?auto_508806 ?auto_508807 ) ( ON ?auto_508805 ?auto_508806 ) ( ON ?auto_508804 ?auto_508805 ) ( ON ?auto_508803 ?auto_508804 ) ( ON ?auto_508802 ?auto_508803 ) ( CLEAR ?auto_508802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_508802 )
      ( MAKE-16PILE ?auto_508802 ?auto_508803 ?auto_508804 ?auto_508805 ?auto_508806 ?auto_508807 ?auto_508808 ?auto_508809 ?auto_508810 ?auto_508811 ?auto_508812 ?auto_508813 ?auto_508814 ?auto_508815 ?auto_508816 ?auto_508817 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_508834 - BLOCK
      ?auto_508835 - BLOCK
      ?auto_508836 - BLOCK
      ?auto_508837 - BLOCK
      ?auto_508838 - BLOCK
      ?auto_508839 - BLOCK
      ?auto_508840 - BLOCK
      ?auto_508841 - BLOCK
      ?auto_508842 - BLOCK
      ?auto_508843 - BLOCK
      ?auto_508844 - BLOCK
      ?auto_508845 - BLOCK
      ?auto_508846 - BLOCK
      ?auto_508847 - BLOCK
      ?auto_508848 - BLOCK
      ?auto_508849 - BLOCK
    )
    :vars
    (
      ?auto_508850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_508834 ?auto_508835 ) ) ( not ( = ?auto_508834 ?auto_508836 ) ) ( not ( = ?auto_508834 ?auto_508837 ) ) ( not ( = ?auto_508834 ?auto_508838 ) ) ( not ( = ?auto_508834 ?auto_508839 ) ) ( not ( = ?auto_508834 ?auto_508840 ) ) ( not ( = ?auto_508834 ?auto_508841 ) ) ( not ( = ?auto_508834 ?auto_508842 ) ) ( not ( = ?auto_508834 ?auto_508843 ) ) ( not ( = ?auto_508834 ?auto_508844 ) ) ( not ( = ?auto_508834 ?auto_508845 ) ) ( not ( = ?auto_508834 ?auto_508846 ) ) ( not ( = ?auto_508834 ?auto_508847 ) ) ( not ( = ?auto_508834 ?auto_508848 ) ) ( not ( = ?auto_508834 ?auto_508849 ) ) ( not ( = ?auto_508835 ?auto_508836 ) ) ( not ( = ?auto_508835 ?auto_508837 ) ) ( not ( = ?auto_508835 ?auto_508838 ) ) ( not ( = ?auto_508835 ?auto_508839 ) ) ( not ( = ?auto_508835 ?auto_508840 ) ) ( not ( = ?auto_508835 ?auto_508841 ) ) ( not ( = ?auto_508835 ?auto_508842 ) ) ( not ( = ?auto_508835 ?auto_508843 ) ) ( not ( = ?auto_508835 ?auto_508844 ) ) ( not ( = ?auto_508835 ?auto_508845 ) ) ( not ( = ?auto_508835 ?auto_508846 ) ) ( not ( = ?auto_508835 ?auto_508847 ) ) ( not ( = ?auto_508835 ?auto_508848 ) ) ( not ( = ?auto_508835 ?auto_508849 ) ) ( not ( = ?auto_508836 ?auto_508837 ) ) ( not ( = ?auto_508836 ?auto_508838 ) ) ( not ( = ?auto_508836 ?auto_508839 ) ) ( not ( = ?auto_508836 ?auto_508840 ) ) ( not ( = ?auto_508836 ?auto_508841 ) ) ( not ( = ?auto_508836 ?auto_508842 ) ) ( not ( = ?auto_508836 ?auto_508843 ) ) ( not ( = ?auto_508836 ?auto_508844 ) ) ( not ( = ?auto_508836 ?auto_508845 ) ) ( not ( = ?auto_508836 ?auto_508846 ) ) ( not ( = ?auto_508836 ?auto_508847 ) ) ( not ( = ?auto_508836 ?auto_508848 ) ) ( not ( = ?auto_508836 ?auto_508849 ) ) ( not ( = ?auto_508837 ?auto_508838 ) ) ( not ( = ?auto_508837 ?auto_508839 ) ) ( not ( = ?auto_508837 ?auto_508840 ) ) ( not ( = ?auto_508837 ?auto_508841 ) ) ( not ( = ?auto_508837 ?auto_508842 ) ) ( not ( = ?auto_508837 ?auto_508843 ) ) ( not ( = ?auto_508837 ?auto_508844 ) ) ( not ( = ?auto_508837 ?auto_508845 ) ) ( not ( = ?auto_508837 ?auto_508846 ) ) ( not ( = ?auto_508837 ?auto_508847 ) ) ( not ( = ?auto_508837 ?auto_508848 ) ) ( not ( = ?auto_508837 ?auto_508849 ) ) ( not ( = ?auto_508838 ?auto_508839 ) ) ( not ( = ?auto_508838 ?auto_508840 ) ) ( not ( = ?auto_508838 ?auto_508841 ) ) ( not ( = ?auto_508838 ?auto_508842 ) ) ( not ( = ?auto_508838 ?auto_508843 ) ) ( not ( = ?auto_508838 ?auto_508844 ) ) ( not ( = ?auto_508838 ?auto_508845 ) ) ( not ( = ?auto_508838 ?auto_508846 ) ) ( not ( = ?auto_508838 ?auto_508847 ) ) ( not ( = ?auto_508838 ?auto_508848 ) ) ( not ( = ?auto_508838 ?auto_508849 ) ) ( not ( = ?auto_508839 ?auto_508840 ) ) ( not ( = ?auto_508839 ?auto_508841 ) ) ( not ( = ?auto_508839 ?auto_508842 ) ) ( not ( = ?auto_508839 ?auto_508843 ) ) ( not ( = ?auto_508839 ?auto_508844 ) ) ( not ( = ?auto_508839 ?auto_508845 ) ) ( not ( = ?auto_508839 ?auto_508846 ) ) ( not ( = ?auto_508839 ?auto_508847 ) ) ( not ( = ?auto_508839 ?auto_508848 ) ) ( not ( = ?auto_508839 ?auto_508849 ) ) ( not ( = ?auto_508840 ?auto_508841 ) ) ( not ( = ?auto_508840 ?auto_508842 ) ) ( not ( = ?auto_508840 ?auto_508843 ) ) ( not ( = ?auto_508840 ?auto_508844 ) ) ( not ( = ?auto_508840 ?auto_508845 ) ) ( not ( = ?auto_508840 ?auto_508846 ) ) ( not ( = ?auto_508840 ?auto_508847 ) ) ( not ( = ?auto_508840 ?auto_508848 ) ) ( not ( = ?auto_508840 ?auto_508849 ) ) ( not ( = ?auto_508841 ?auto_508842 ) ) ( not ( = ?auto_508841 ?auto_508843 ) ) ( not ( = ?auto_508841 ?auto_508844 ) ) ( not ( = ?auto_508841 ?auto_508845 ) ) ( not ( = ?auto_508841 ?auto_508846 ) ) ( not ( = ?auto_508841 ?auto_508847 ) ) ( not ( = ?auto_508841 ?auto_508848 ) ) ( not ( = ?auto_508841 ?auto_508849 ) ) ( not ( = ?auto_508842 ?auto_508843 ) ) ( not ( = ?auto_508842 ?auto_508844 ) ) ( not ( = ?auto_508842 ?auto_508845 ) ) ( not ( = ?auto_508842 ?auto_508846 ) ) ( not ( = ?auto_508842 ?auto_508847 ) ) ( not ( = ?auto_508842 ?auto_508848 ) ) ( not ( = ?auto_508842 ?auto_508849 ) ) ( not ( = ?auto_508843 ?auto_508844 ) ) ( not ( = ?auto_508843 ?auto_508845 ) ) ( not ( = ?auto_508843 ?auto_508846 ) ) ( not ( = ?auto_508843 ?auto_508847 ) ) ( not ( = ?auto_508843 ?auto_508848 ) ) ( not ( = ?auto_508843 ?auto_508849 ) ) ( not ( = ?auto_508844 ?auto_508845 ) ) ( not ( = ?auto_508844 ?auto_508846 ) ) ( not ( = ?auto_508844 ?auto_508847 ) ) ( not ( = ?auto_508844 ?auto_508848 ) ) ( not ( = ?auto_508844 ?auto_508849 ) ) ( not ( = ?auto_508845 ?auto_508846 ) ) ( not ( = ?auto_508845 ?auto_508847 ) ) ( not ( = ?auto_508845 ?auto_508848 ) ) ( not ( = ?auto_508845 ?auto_508849 ) ) ( not ( = ?auto_508846 ?auto_508847 ) ) ( not ( = ?auto_508846 ?auto_508848 ) ) ( not ( = ?auto_508846 ?auto_508849 ) ) ( not ( = ?auto_508847 ?auto_508848 ) ) ( not ( = ?auto_508847 ?auto_508849 ) ) ( not ( = ?auto_508848 ?auto_508849 ) ) ( ON ?auto_508834 ?auto_508850 ) ( not ( = ?auto_508849 ?auto_508850 ) ) ( not ( = ?auto_508848 ?auto_508850 ) ) ( not ( = ?auto_508847 ?auto_508850 ) ) ( not ( = ?auto_508846 ?auto_508850 ) ) ( not ( = ?auto_508845 ?auto_508850 ) ) ( not ( = ?auto_508844 ?auto_508850 ) ) ( not ( = ?auto_508843 ?auto_508850 ) ) ( not ( = ?auto_508842 ?auto_508850 ) ) ( not ( = ?auto_508841 ?auto_508850 ) ) ( not ( = ?auto_508840 ?auto_508850 ) ) ( not ( = ?auto_508839 ?auto_508850 ) ) ( not ( = ?auto_508838 ?auto_508850 ) ) ( not ( = ?auto_508837 ?auto_508850 ) ) ( not ( = ?auto_508836 ?auto_508850 ) ) ( not ( = ?auto_508835 ?auto_508850 ) ) ( not ( = ?auto_508834 ?auto_508850 ) ) ( ON ?auto_508835 ?auto_508834 ) ( ON ?auto_508836 ?auto_508835 ) ( ON ?auto_508837 ?auto_508836 ) ( ON ?auto_508838 ?auto_508837 ) ( ON ?auto_508839 ?auto_508838 ) ( ON ?auto_508840 ?auto_508839 ) ( ON ?auto_508841 ?auto_508840 ) ( ON ?auto_508842 ?auto_508841 ) ( ON ?auto_508843 ?auto_508842 ) ( ON ?auto_508844 ?auto_508843 ) ( ON ?auto_508845 ?auto_508844 ) ( ON ?auto_508846 ?auto_508845 ) ( ON ?auto_508847 ?auto_508846 ) ( ON ?auto_508848 ?auto_508847 ) ( ON ?auto_508849 ?auto_508848 ) ( CLEAR ?auto_508849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_508849 ?auto_508848 ?auto_508847 ?auto_508846 ?auto_508845 ?auto_508844 ?auto_508843 ?auto_508842 ?auto_508841 ?auto_508840 ?auto_508839 ?auto_508838 ?auto_508837 ?auto_508836 ?auto_508835 ?auto_508834 )
      ( MAKE-16PILE ?auto_508834 ?auto_508835 ?auto_508836 ?auto_508837 ?auto_508838 ?auto_508839 ?auto_508840 ?auto_508841 ?auto_508842 ?auto_508843 ?auto_508844 ?auto_508845 ?auto_508846 ?auto_508847 ?auto_508848 ?auto_508849 ) )
  )

)

