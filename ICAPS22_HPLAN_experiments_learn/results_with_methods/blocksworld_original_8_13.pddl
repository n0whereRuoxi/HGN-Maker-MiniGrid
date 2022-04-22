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
      ?auto_187753 - BLOCK
      ?auto_187754 - BLOCK
      ?auto_187755 - BLOCK
      ?auto_187756 - BLOCK
      ?auto_187757 - BLOCK
      ?auto_187758 - BLOCK
      ?auto_187759 - BLOCK
      ?auto_187760 - BLOCK
    )
    :vars
    (
      ?auto_187761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187761 ?auto_187760 ) ( CLEAR ?auto_187761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187753 ) ( ON ?auto_187754 ?auto_187753 ) ( ON ?auto_187755 ?auto_187754 ) ( ON ?auto_187756 ?auto_187755 ) ( ON ?auto_187757 ?auto_187756 ) ( ON ?auto_187758 ?auto_187757 ) ( ON ?auto_187759 ?auto_187758 ) ( ON ?auto_187760 ?auto_187759 ) ( not ( = ?auto_187753 ?auto_187754 ) ) ( not ( = ?auto_187753 ?auto_187755 ) ) ( not ( = ?auto_187753 ?auto_187756 ) ) ( not ( = ?auto_187753 ?auto_187757 ) ) ( not ( = ?auto_187753 ?auto_187758 ) ) ( not ( = ?auto_187753 ?auto_187759 ) ) ( not ( = ?auto_187753 ?auto_187760 ) ) ( not ( = ?auto_187753 ?auto_187761 ) ) ( not ( = ?auto_187754 ?auto_187755 ) ) ( not ( = ?auto_187754 ?auto_187756 ) ) ( not ( = ?auto_187754 ?auto_187757 ) ) ( not ( = ?auto_187754 ?auto_187758 ) ) ( not ( = ?auto_187754 ?auto_187759 ) ) ( not ( = ?auto_187754 ?auto_187760 ) ) ( not ( = ?auto_187754 ?auto_187761 ) ) ( not ( = ?auto_187755 ?auto_187756 ) ) ( not ( = ?auto_187755 ?auto_187757 ) ) ( not ( = ?auto_187755 ?auto_187758 ) ) ( not ( = ?auto_187755 ?auto_187759 ) ) ( not ( = ?auto_187755 ?auto_187760 ) ) ( not ( = ?auto_187755 ?auto_187761 ) ) ( not ( = ?auto_187756 ?auto_187757 ) ) ( not ( = ?auto_187756 ?auto_187758 ) ) ( not ( = ?auto_187756 ?auto_187759 ) ) ( not ( = ?auto_187756 ?auto_187760 ) ) ( not ( = ?auto_187756 ?auto_187761 ) ) ( not ( = ?auto_187757 ?auto_187758 ) ) ( not ( = ?auto_187757 ?auto_187759 ) ) ( not ( = ?auto_187757 ?auto_187760 ) ) ( not ( = ?auto_187757 ?auto_187761 ) ) ( not ( = ?auto_187758 ?auto_187759 ) ) ( not ( = ?auto_187758 ?auto_187760 ) ) ( not ( = ?auto_187758 ?auto_187761 ) ) ( not ( = ?auto_187759 ?auto_187760 ) ) ( not ( = ?auto_187759 ?auto_187761 ) ) ( not ( = ?auto_187760 ?auto_187761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187761 ?auto_187760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187763 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_187763 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_187763 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187764 - BLOCK
    )
    :vars
    (
      ?auto_187765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187764 ?auto_187765 ) ( CLEAR ?auto_187764 ) ( HAND-EMPTY ) ( not ( = ?auto_187764 ?auto_187765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187764 ?auto_187765 )
      ( MAKE-1PILE ?auto_187764 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187773 - BLOCK
      ?auto_187774 - BLOCK
      ?auto_187775 - BLOCK
      ?auto_187776 - BLOCK
      ?auto_187777 - BLOCK
      ?auto_187778 - BLOCK
      ?auto_187779 - BLOCK
    )
    :vars
    (
      ?auto_187780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187780 ?auto_187779 ) ( CLEAR ?auto_187780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187773 ) ( ON ?auto_187774 ?auto_187773 ) ( ON ?auto_187775 ?auto_187774 ) ( ON ?auto_187776 ?auto_187775 ) ( ON ?auto_187777 ?auto_187776 ) ( ON ?auto_187778 ?auto_187777 ) ( ON ?auto_187779 ?auto_187778 ) ( not ( = ?auto_187773 ?auto_187774 ) ) ( not ( = ?auto_187773 ?auto_187775 ) ) ( not ( = ?auto_187773 ?auto_187776 ) ) ( not ( = ?auto_187773 ?auto_187777 ) ) ( not ( = ?auto_187773 ?auto_187778 ) ) ( not ( = ?auto_187773 ?auto_187779 ) ) ( not ( = ?auto_187773 ?auto_187780 ) ) ( not ( = ?auto_187774 ?auto_187775 ) ) ( not ( = ?auto_187774 ?auto_187776 ) ) ( not ( = ?auto_187774 ?auto_187777 ) ) ( not ( = ?auto_187774 ?auto_187778 ) ) ( not ( = ?auto_187774 ?auto_187779 ) ) ( not ( = ?auto_187774 ?auto_187780 ) ) ( not ( = ?auto_187775 ?auto_187776 ) ) ( not ( = ?auto_187775 ?auto_187777 ) ) ( not ( = ?auto_187775 ?auto_187778 ) ) ( not ( = ?auto_187775 ?auto_187779 ) ) ( not ( = ?auto_187775 ?auto_187780 ) ) ( not ( = ?auto_187776 ?auto_187777 ) ) ( not ( = ?auto_187776 ?auto_187778 ) ) ( not ( = ?auto_187776 ?auto_187779 ) ) ( not ( = ?auto_187776 ?auto_187780 ) ) ( not ( = ?auto_187777 ?auto_187778 ) ) ( not ( = ?auto_187777 ?auto_187779 ) ) ( not ( = ?auto_187777 ?auto_187780 ) ) ( not ( = ?auto_187778 ?auto_187779 ) ) ( not ( = ?auto_187778 ?auto_187780 ) ) ( not ( = ?auto_187779 ?auto_187780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187780 ?auto_187779 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187781 - BLOCK
      ?auto_187782 - BLOCK
      ?auto_187783 - BLOCK
      ?auto_187784 - BLOCK
      ?auto_187785 - BLOCK
      ?auto_187786 - BLOCK
      ?auto_187787 - BLOCK
    )
    :vars
    (
      ?auto_187788 - BLOCK
      ?auto_187789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187788 ?auto_187787 ) ( CLEAR ?auto_187788 ) ( ON-TABLE ?auto_187781 ) ( ON ?auto_187782 ?auto_187781 ) ( ON ?auto_187783 ?auto_187782 ) ( ON ?auto_187784 ?auto_187783 ) ( ON ?auto_187785 ?auto_187784 ) ( ON ?auto_187786 ?auto_187785 ) ( ON ?auto_187787 ?auto_187786 ) ( not ( = ?auto_187781 ?auto_187782 ) ) ( not ( = ?auto_187781 ?auto_187783 ) ) ( not ( = ?auto_187781 ?auto_187784 ) ) ( not ( = ?auto_187781 ?auto_187785 ) ) ( not ( = ?auto_187781 ?auto_187786 ) ) ( not ( = ?auto_187781 ?auto_187787 ) ) ( not ( = ?auto_187781 ?auto_187788 ) ) ( not ( = ?auto_187782 ?auto_187783 ) ) ( not ( = ?auto_187782 ?auto_187784 ) ) ( not ( = ?auto_187782 ?auto_187785 ) ) ( not ( = ?auto_187782 ?auto_187786 ) ) ( not ( = ?auto_187782 ?auto_187787 ) ) ( not ( = ?auto_187782 ?auto_187788 ) ) ( not ( = ?auto_187783 ?auto_187784 ) ) ( not ( = ?auto_187783 ?auto_187785 ) ) ( not ( = ?auto_187783 ?auto_187786 ) ) ( not ( = ?auto_187783 ?auto_187787 ) ) ( not ( = ?auto_187783 ?auto_187788 ) ) ( not ( = ?auto_187784 ?auto_187785 ) ) ( not ( = ?auto_187784 ?auto_187786 ) ) ( not ( = ?auto_187784 ?auto_187787 ) ) ( not ( = ?auto_187784 ?auto_187788 ) ) ( not ( = ?auto_187785 ?auto_187786 ) ) ( not ( = ?auto_187785 ?auto_187787 ) ) ( not ( = ?auto_187785 ?auto_187788 ) ) ( not ( = ?auto_187786 ?auto_187787 ) ) ( not ( = ?auto_187786 ?auto_187788 ) ) ( not ( = ?auto_187787 ?auto_187788 ) ) ( HOLDING ?auto_187789 ) ( not ( = ?auto_187781 ?auto_187789 ) ) ( not ( = ?auto_187782 ?auto_187789 ) ) ( not ( = ?auto_187783 ?auto_187789 ) ) ( not ( = ?auto_187784 ?auto_187789 ) ) ( not ( = ?auto_187785 ?auto_187789 ) ) ( not ( = ?auto_187786 ?auto_187789 ) ) ( not ( = ?auto_187787 ?auto_187789 ) ) ( not ( = ?auto_187788 ?auto_187789 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_187789 )
      ( MAKE-7PILE ?auto_187781 ?auto_187782 ?auto_187783 ?auto_187784 ?auto_187785 ?auto_187786 ?auto_187787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187790 - BLOCK
      ?auto_187791 - BLOCK
      ?auto_187792 - BLOCK
      ?auto_187793 - BLOCK
      ?auto_187794 - BLOCK
      ?auto_187795 - BLOCK
      ?auto_187796 - BLOCK
    )
    :vars
    (
      ?auto_187798 - BLOCK
      ?auto_187797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187798 ?auto_187796 ) ( ON-TABLE ?auto_187790 ) ( ON ?auto_187791 ?auto_187790 ) ( ON ?auto_187792 ?auto_187791 ) ( ON ?auto_187793 ?auto_187792 ) ( ON ?auto_187794 ?auto_187793 ) ( ON ?auto_187795 ?auto_187794 ) ( ON ?auto_187796 ?auto_187795 ) ( not ( = ?auto_187790 ?auto_187791 ) ) ( not ( = ?auto_187790 ?auto_187792 ) ) ( not ( = ?auto_187790 ?auto_187793 ) ) ( not ( = ?auto_187790 ?auto_187794 ) ) ( not ( = ?auto_187790 ?auto_187795 ) ) ( not ( = ?auto_187790 ?auto_187796 ) ) ( not ( = ?auto_187790 ?auto_187798 ) ) ( not ( = ?auto_187791 ?auto_187792 ) ) ( not ( = ?auto_187791 ?auto_187793 ) ) ( not ( = ?auto_187791 ?auto_187794 ) ) ( not ( = ?auto_187791 ?auto_187795 ) ) ( not ( = ?auto_187791 ?auto_187796 ) ) ( not ( = ?auto_187791 ?auto_187798 ) ) ( not ( = ?auto_187792 ?auto_187793 ) ) ( not ( = ?auto_187792 ?auto_187794 ) ) ( not ( = ?auto_187792 ?auto_187795 ) ) ( not ( = ?auto_187792 ?auto_187796 ) ) ( not ( = ?auto_187792 ?auto_187798 ) ) ( not ( = ?auto_187793 ?auto_187794 ) ) ( not ( = ?auto_187793 ?auto_187795 ) ) ( not ( = ?auto_187793 ?auto_187796 ) ) ( not ( = ?auto_187793 ?auto_187798 ) ) ( not ( = ?auto_187794 ?auto_187795 ) ) ( not ( = ?auto_187794 ?auto_187796 ) ) ( not ( = ?auto_187794 ?auto_187798 ) ) ( not ( = ?auto_187795 ?auto_187796 ) ) ( not ( = ?auto_187795 ?auto_187798 ) ) ( not ( = ?auto_187796 ?auto_187798 ) ) ( not ( = ?auto_187790 ?auto_187797 ) ) ( not ( = ?auto_187791 ?auto_187797 ) ) ( not ( = ?auto_187792 ?auto_187797 ) ) ( not ( = ?auto_187793 ?auto_187797 ) ) ( not ( = ?auto_187794 ?auto_187797 ) ) ( not ( = ?auto_187795 ?auto_187797 ) ) ( not ( = ?auto_187796 ?auto_187797 ) ) ( not ( = ?auto_187798 ?auto_187797 ) ) ( ON ?auto_187797 ?auto_187798 ) ( CLEAR ?auto_187797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187790 ?auto_187791 ?auto_187792 ?auto_187793 ?auto_187794 ?auto_187795 ?auto_187796 ?auto_187798 )
      ( MAKE-7PILE ?auto_187790 ?auto_187791 ?auto_187792 ?auto_187793 ?auto_187794 ?auto_187795 ?auto_187796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187801 - BLOCK
      ?auto_187802 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_187802 ) ( CLEAR ?auto_187801 ) ( ON-TABLE ?auto_187801 ) ( not ( = ?auto_187801 ?auto_187802 ) ) )
    :subtasks
    ( ( !STACK ?auto_187802 ?auto_187801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187803 - BLOCK
      ?auto_187804 - BLOCK
    )
    :vars
    (
      ?auto_187805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187803 ) ( ON-TABLE ?auto_187803 ) ( not ( = ?auto_187803 ?auto_187804 ) ) ( ON ?auto_187804 ?auto_187805 ) ( CLEAR ?auto_187804 ) ( HAND-EMPTY ) ( not ( = ?auto_187803 ?auto_187805 ) ) ( not ( = ?auto_187804 ?auto_187805 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187804 ?auto_187805 )
      ( MAKE-2PILE ?auto_187803 ?auto_187804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187806 - BLOCK
      ?auto_187807 - BLOCK
    )
    :vars
    (
      ?auto_187808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187806 ?auto_187807 ) ) ( ON ?auto_187807 ?auto_187808 ) ( CLEAR ?auto_187807 ) ( not ( = ?auto_187806 ?auto_187808 ) ) ( not ( = ?auto_187807 ?auto_187808 ) ) ( HOLDING ?auto_187806 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187806 )
      ( MAKE-2PILE ?auto_187806 ?auto_187807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187809 - BLOCK
      ?auto_187810 - BLOCK
    )
    :vars
    (
      ?auto_187811 - BLOCK
      ?auto_187814 - BLOCK
      ?auto_187817 - BLOCK
      ?auto_187815 - BLOCK
      ?auto_187812 - BLOCK
      ?auto_187816 - BLOCK
      ?auto_187813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187809 ?auto_187810 ) ) ( ON ?auto_187810 ?auto_187811 ) ( not ( = ?auto_187809 ?auto_187811 ) ) ( not ( = ?auto_187810 ?auto_187811 ) ) ( ON ?auto_187809 ?auto_187810 ) ( CLEAR ?auto_187809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187814 ) ( ON ?auto_187817 ?auto_187814 ) ( ON ?auto_187815 ?auto_187817 ) ( ON ?auto_187812 ?auto_187815 ) ( ON ?auto_187816 ?auto_187812 ) ( ON ?auto_187813 ?auto_187816 ) ( ON ?auto_187811 ?auto_187813 ) ( not ( = ?auto_187814 ?auto_187817 ) ) ( not ( = ?auto_187814 ?auto_187815 ) ) ( not ( = ?auto_187814 ?auto_187812 ) ) ( not ( = ?auto_187814 ?auto_187816 ) ) ( not ( = ?auto_187814 ?auto_187813 ) ) ( not ( = ?auto_187814 ?auto_187811 ) ) ( not ( = ?auto_187814 ?auto_187810 ) ) ( not ( = ?auto_187814 ?auto_187809 ) ) ( not ( = ?auto_187817 ?auto_187815 ) ) ( not ( = ?auto_187817 ?auto_187812 ) ) ( not ( = ?auto_187817 ?auto_187816 ) ) ( not ( = ?auto_187817 ?auto_187813 ) ) ( not ( = ?auto_187817 ?auto_187811 ) ) ( not ( = ?auto_187817 ?auto_187810 ) ) ( not ( = ?auto_187817 ?auto_187809 ) ) ( not ( = ?auto_187815 ?auto_187812 ) ) ( not ( = ?auto_187815 ?auto_187816 ) ) ( not ( = ?auto_187815 ?auto_187813 ) ) ( not ( = ?auto_187815 ?auto_187811 ) ) ( not ( = ?auto_187815 ?auto_187810 ) ) ( not ( = ?auto_187815 ?auto_187809 ) ) ( not ( = ?auto_187812 ?auto_187816 ) ) ( not ( = ?auto_187812 ?auto_187813 ) ) ( not ( = ?auto_187812 ?auto_187811 ) ) ( not ( = ?auto_187812 ?auto_187810 ) ) ( not ( = ?auto_187812 ?auto_187809 ) ) ( not ( = ?auto_187816 ?auto_187813 ) ) ( not ( = ?auto_187816 ?auto_187811 ) ) ( not ( = ?auto_187816 ?auto_187810 ) ) ( not ( = ?auto_187816 ?auto_187809 ) ) ( not ( = ?auto_187813 ?auto_187811 ) ) ( not ( = ?auto_187813 ?auto_187810 ) ) ( not ( = ?auto_187813 ?auto_187809 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187814 ?auto_187817 ?auto_187815 ?auto_187812 ?auto_187816 ?auto_187813 ?auto_187811 ?auto_187810 )
      ( MAKE-2PILE ?auto_187809 ?auto_187810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187824 - BLOCK
      ?auto_187825 - BLOCK
      ?auto_187826 - BLOCK
      ?auto_187827 - BLOCK
      ?auto_187828 - BLOCK
      ?auto_187829 - BLOCK
    )
    :vars
    (
      ?auto_187830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187830 ?auto_187829 ) ( CLEAR ?auto_187830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187824 ) ( ON ?auto_187825 ?auto_187824 ) ( ON ?auto_187826 ?auto_187825 ) ( ON ?auto_187827 ?auto_187826 ) ( ON ?auto_187828 ?auto_187827 ) ( ON ?auto_187829 ?auto_187828 ) ( not ( = ?auto_187824 ?auto_187825 ) ) ( not ( = ?auto_187824 ?auto_187826 ) ) ( not ( = ?auto_187824 ?auto_187827 ) ) ( not ( = ?auto_187824 ?auto_187828 ) ) ( not ( = ?auto_187824 ?auto_187829 ) ) ( not ( = ?auto_187824 ?auto_187830 ) ) ( not ( = ?auto_187825 ?auto_187826 ) ) ( not ( = ?auto_187825 ?auto_187827 ) ) ( not ( = ?auto_187825 ?auto_187828 ) ) ( not ( = ?auto_187825 ?auto_187829 ) ) ( not ( = ?auto_187825 ?auto_187830 ) ) ( not ( = ?auto_187826 ?auto_187827 ) ) ( not ( = ?auto_187826 ?auto_187828 ) ) ( not ( = ?auto_187826 ?auto_187829 ) ) ( not ( = ?auto_187826 ?auto_187830 ) ) ( not ( = ?auto_187827 ?auto_187828 ) ) ( not ( = ?auto_187827 ?auto_187829 ) ) ( not ( = ?auto_187827 ?auto_187830 ) ) ( not ( = ?auto_187828 ?auto_187829 ) ) ( not ( = ?auto_187828 ?auto_187830 ) ) ( not ( = ?auto_187829 ?auto_187830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187830 ?auto_187829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187831 - BLOCK
      ?auto_187832 - BLOCK
      ?auto_187833 - BLOCK
      ?auto_187834 - BLOCK
      ?auto_187835 - BLOCK
      ?auto_187836 - BLOCK
    )
    :vars
    (
      ?auto_187837 - BLOCK
      ?auto_187838 - BLOCK
      ?auto_187839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187837 ?auto_187836 ) ( CLEAR ?auto_187837 ) ( ON-TABLE ?auto_187831 ) ( ON ?auto_187832 ?auto_187831 ) ( ON ?auto_187833 ?auto_187832 ) ( ON ?auto_187834 ?auto_187833 ) ( ON ?auto_187835 ?auto_187834 ) ( ON ?auto_187836 ?auto_187835 ) ( not ( = ?auto_187831 ?auto_187832 ) ) ( not ( = ?auto_187831 ?auto_187833 ) ) ( not ( = ?auto_187831 ?auto_187834 ) ) ( not ( = ?auto_187831 ?auto_187835 ) ) ( not ( = ?auto_187831 ?auto_187836 ) ) ( not ( = ?auto_187831 ?auto_187837 ) ) ( not ( = ?auto_187832 ?auto_187833 ) ) ( not ( = ?auto_187832 ?auto_187834 ) ) ( not ( = ?auto_187832 ?auto_187835 ) ) ( not ( = ?auto_187832 ?auto_187836 ) ) ( not ( = ?auto_187832 ?auto_187837 ) ) ( not ( = ?auto_187833 ?auto_187834 ) ) ( not ( = ?auto_187833 ?auto_187835 ) ) ( not ( = ?auto_187833 ?auto_187836 ) ) ( not ( = ?auto_187833 ?auto_187837 ) ) ( not ( = ?auto_187834 ?auto_187835 ) ) ( not ( = ?auto_187834 ?auto_187836 ) ) ( not ( = ?auto_187834 ?auto_187837 ) ) ( not ( = ?auto_187835 ?auto_187836 ) ) ( not ( = ?auto_187835 ?auto_187837 ) ) ( not ( = ?auto_187836 ?auto_187837 ) ) ( HOLDING ?auto_187838 ) ( CLEAR ?auto_187839 ) ( not ( = ?auto_187831 ?auto_187838 ) ) ( not ( = ?auto_187831 ?auto_187839 ) ) ( not ( = ?auto_187832 ?auto_187838 ) ) ( not ( = ?auto_187832 ?auto_187839 ) ) ( not ( = ?auto_187833 ?auto_187838 ) ) ( not ( = ?auto_187833 ?auto_187839 ) ) ( not ( = ?auto_187834 ?auto_187838 ) ) ( not ( = ?auto_187834 ?auto_187839 ) ) ( not ( = ?auto_187835 ?auto_187838 ) ) ( not ( = ?auto_187835 ?auto_187839 ) ) ( not ( = ?auto_187836 ?auto_187838 ) ) ( not ( = ?auto_187836 ?auto_187839 ) ) ( not ( = ?auto_187837 ?auto_187838 ) ) ( not ( = ?auto_187837 ?auto_187839 ) ) ( not ( = ?auto_187838 ?auto_187839 ) ) )
    :subtasks
    ( ( !STACK ?auto_187838 ?auto_187839 )
      ( MAKE-6PILE ?auto_187831 ?auto_187832 ?auto_187833 ?auto_187834 ?auto_187835 ?auto_187836 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187840 - BLOCK
      ?auto_187841 - BLOCK
      ?auto_187842 - BLOCK
      ?auto_187843 - BLOCK
      ?auto_187844 - BLOCK
      ?auto_187845 - BLOCK
    )
    :vars
    (
      ?auto_187848 - BLOCK
      ?auto_187847 - BLOCK
      ?auto_187846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187848 ?auto_187845 ) ( ON-TABLE ?auto_187840 ) ( ON ?auto_187841 ?auto_187840 ) ( ON ?auto_187842 ?auto_187841 ) ( ON ?auto_187843 ?auto_187842 ) ( ON ?auto_187844 ?auto_187843 ) ( ON ?auto_187845 ?auto_187844 ) ( not ( = ?auto_187840 ?auto_187841 ) ) ( not ( = ?auto_187840 ?auto_187842 ) ) ( not ( = ?auto_187840 ?auto_187843 ) ) ( not ( = ?auto_187840 ?auto_187844 ) ) ( not ( = ?auto_187840 ?auto_187845 ) ) ( not ( = ?auto_187840 ?auto_187848 ) ) ( not ( = ?auto_187841 ?auto_187842 ) ) ( not ( = ?auto_187841 ?auto_187843 ) ) ( not ( = ?auto_187841 ?auto_187844 ) ) ( not ( = ?auto_187841 ?auto_187845 ) ) ( not ( = ?auto_187841 ?auto_187848 ) ) ( not ( = ?auto_187842 ?auto_187843 ) ) ( not ( = ?auto_187842 ?auto_187844 ) ) ( not ( = ?auto_187842 ?auto_187845 ) ) ( not ( = ?auto_187842 ?auto_187848 ) ) ( not ( = ?auto_187843 ?auto_187844 ) ) ( not ( = ?auto_187843 ?auto_187845 ) ) ( not ( = ?auto_187843 ?auto_187848 ) ) ( not ( = ?auto_187844 ?auto_187845 ) ) ( not ( = ?auto_187844 ?auto_187848 ) ) ( not ( = ?auto_187845 ?auto_187848 ) ) ( CLEAR ?auto_187847 ) ( not ( = ?auto_187840 ?auto_187846 ) ) ( not ( = ?auto_187840 ?auto_187847 ) ) ( not ( = ?auto_187841 ?auto_187846 ) ) ( not ( = ?auto_187841 ?auto_187847 ) ) ( not ( = ?auto_187842 ?auto_187846 ) ) ( not ( = ?auto_187842 ?auto_187847 ) ) ( not ( = ?auto_187843 ?auto_187846 ) ) ( not ( = ?auto_187843 ?auto_187847 ) ) ( not ( = ?auto_187844 ?auto_187846 ) ) ( not ( = ?auto_187844 ?auto_187847 ) ) ( not ( = ?auto_187845 ?auto_187846 ) ) ( not ( = ?auto_187845 ?auto_187847 ) ) ( not ( = ?auto_187848 ?auto_187846 ) ) ( not ( = ?auto_187848 ?auto_187847 ) ) ( not ( = ?auto_187846 ?auto_187847 ) ) ( ON ?auto_187846 ?auto_187848 ) ( CLEAR ?auto_187846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187840 ?auto_187841 ?auto_187842 ?auto_187843 ?auto_187844 ?auto_187845 ?auto_187848 )
      ( MAKE-6PILE ?auto_187840 ?auto_187841 ?auto_187842 ?auto_187843 ?auto_187844 ?auto_187845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187849 - BLOCK
      ?auto_187850 - BLOCK
      ?auto_187851 - BLOCK
      ?auto_187852 - BLOCK
      ?auto_187853 - BLOCK
      ?auto_187854 - BLOCK
    )
    :vars
    (
      ?auto_187857 - BLOCK
      ?auto_187856 - BLOCK
      ?auto_187855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187857 ?auto_187854 ) ( ON-TABLE ?auto_187849 ) ( ON ?auto_187850 ?auto_187849 ) ( ON ?auto_187851 ?auto_187850 ) ( ON ?auto_187852 ?auto_187851 ) ( ON ?auto_187853 ?auto_187852 ) ( ON ?auto_187854 ?auto_187853 ) ( not ( = ?auto_187849 ?auto_187850 ) ) ( not ( = ?auto_187849 ?auto_187851 ) ) ( not ( = ?auto_187849 ?auto_187852 ) ) ( not ( = ?auto_187849 ?auto_187853 ) ) ( not ( = ?auto_187849 ?auto_187854 ) ) ( not ( = ?auto_187849 ?auto_187857 ) ) ( not ( = ?auto_187850 ?auto_187851 ) ) ( not ( = ?auto_187850 ?auto_187852 ) ) ( not ( = ?auto_187850 ?auto_187853 ) ) ( not ( = ?auto_187850 ?auto_187854 ) ) ( not ( = ?auto_187850 ?auto_187857 ) ) ( not ( = ?auto_187851 ?auto_187852 ) ) ( not ( = ?auto_187851 ?auto_187853 ) ) ( not ( = ?auto_187851 ?auto_187854 ) ) ( not ( = ?auto_187851 ?auto_187857 ) ) ( not ( = ?auto_187852 ?auto_187853 ) ) ( not ( = ?auto_187852 ?auto_187854 ) ) ( not ( = ?auto_187852 ?auto_187857 ) ) ( not ( = ?auto_187853 ?auto_187854 ) ) ( not ( = ?auto_187853 ?auto_187857 ) ) ( not ( = ?auto_187854 ?auto_187857 ) ) ( not ( = ?auto_187849 ?auto_187856 ) ) ( not ( = ?auto_187849 ?auto_187855 ) ) ( not ( = ?auto_187850 ?auto_187856 ) ) ( not ( = ?auto_187850 ?auto_187855 ) ) ( not ( = ?auto_187851 ?auto_187856 ) ) ( not ( = ?auto_187851 ?auto_187855 ) ) ( not ( = ?auto_187852 ?auto_187856 ) ) ( not ( = ?auto_187852 ?auto_187855 ) ) ( not ( = ?auto_187853 ?auto_187856 ) ) ( not ( = ?auto_187853 ?auto_187855 ) ) ( not ( = ?auto_187854 ?auto_187856 ) ) ( not ( = ?auto_187854 ?auto_187855 ) ) ( not ( = ?auto_187857 ?auto_187856 ) ) ( not ( = ?auto_187857 ?auto_187855 ) ) ( not ( = ?auto_187856 ?auto_187855 ) ) ( ON ?auto_187856 ?auto_187857 ) ( CLEAR ?auto_187856 ) ( HOLDING ?auto_187855 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187855 )
      ( MAKE-6PILE ?auto_187849 ?auto_187850 ?auto_187851 ?auto_187852 ?auto_187853 ?auto_187854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187858 - BLOCK
      ?auto_187859 - BLOCK
      ?auto_187860 - BLOCK
      ?auto_187861 - BLOCK
      ?auto_187862 - BLOCK
      ?auto_187863 - BLOCK
    )
    :vars
    (
      ?auto_187865 - BLOCK
      ?auto_187864 - BLOCK
      ?auto_187866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187865 ?auto_187863 ) ( ON-TABLE ?auto_187858 ) ( ON ?auto_187859 ?auto_187858 ) ( ON ?auto_187860 ?auto_187859 ) ( ON ?auto_187861 ?auto_187860 ) ( ON ?auto_187862 ?auto_187861 ) ( ON ?auto_187863 ?auto_187862 ) ( not ( = ?auto_187858 ?auto_187859 ) ) ( not ( = ?auto_187858 ?auto_187860 ) ) ( not ( = ?auto_187858 ?auto_187861 ) ) ( not ( = ?auto_187858 ?auto_187862 ) ) ( not ( = ?auto_187858 ?auto_187863 ) ) ( not ( = ?auto_187858 ?auto_187865 ) ) ( not ( = ?auto_187859 ?auto_187860 ) ) ( not ( = ?auto_187859 ?auto_187861 ) ) ( not ( = ?auto_187859 ?auto_187862 ) ) ( not ( = ?auto_187859 ?auto_187863 ) ) ( not ( = ?auto_187859 ?auto_187865 ) ) ( not ( = ?auto_187860 ?auto_187861 ) ) ( not ( = ?auto_187860 ?auto_187862 ) ) ( not ( = ?auto_187860 ?auto_187863 ) ) ( not ( = ?auto_187860 ?auto_187865 ) ) ( not ( = ?auto_187861 ?auto_187862 ) ) ( not ( = ?auto_187861 ?auto_187863 ) ) ( not ( = ?auto_187861 ?auto_187865 ) ) ( not ( = ?auto_187862 ?auto_187863 ) ) ( not ( = ?auto_187862 ?auto_187865 ) ) ( not ( = ?auto_187863 ?auto_187865 ) ) ( not ( = ?auto_187858 ?auto_187864 ) ) ( not ( = ?auto_187858 ?auto_187866 ) ) ( not ( = ?auto_187859 ?auto_187864 ) ) ( not ( = ?auto_187859 ?auto_187866 ) ) ( not ( = ?auto_187860 ?auto_187864 ) ) ( not ( = ?auto_187860 ?auto_187866 ) ) ( not ( = ?auto_187861 ?auto_187864 ) ) ( not ( = ?auto_187861 ?auto_187866 ) ) ( not ( = ?auto_187862 ?auto_187864 ) ) ( not ( = ?auto_187862 ?auto_187866 ) ) ( not ( = ?auto_187863 ?auto_187864 ) ) ( not ( = ?auto_187863 ?auto_187866 ) ) ( not ( = ?auto_187865 ?auto_187864 ) ) ( not ( = ?auto_187865 ?auto_187866 ) ) ( not ( = ?auto_187864 ?auto_187866 ) ) ( ON ?auto_187864 ?auto_187865 ) ( ON ?auto_187866 ?auto_187864 ) ( CLEAR ?auto_187866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187858 ?auto_187859 ?auto_187860 ?auto_187861 ?auto_187862 ?auto_187863 ?auto_187865 ?auto_187864 )
      ( MAKE-6PILE ?auto_187858 ?auto_187859 ?auto_187860 ?auto_187861 ?auto_187862 ?auto_187863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_187870 - BLOCK
      ?auto_187871 - BLOCK
      ?auto_187872 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_187872 ) ( CLEAR ?auto_187871 ) ( ON-TABLE ?auto_187870 ) ( ON ?auto_187871 ?auto_187870 ) ( not ( = ?auto_187870 ?auto_187871 ) ) ( not ( = ?auto_187870 ?auto_187872 ) ) ( not ( = ?auto_187871 ?auto_187872 ) ) )
    :subtasks
    ( ( !STACK ?auto_187872 ?auto_187871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_187873 - BLOCK
      ?auto_187874 - BLOCK
      ?auto_187875 - BLOCK
    )
    :vars
    (
      ?auto_187876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187874 ) ( ON-TABLE ?auto_187873 ) ( ON ?auto_187874 ?auto_187873 ) ( not ( = ?auto_187873 ?auto_187874 ) ) ( not ( = ?auto_187873 ?auto_187875 ) ) ( not ( = ?auto_187874 ?auto_187875 ) ) ( ON ?auto_187875 ?auto_187876 ) ( CLEAR ?auto_187875 ) ( HAND-EMPTY ) ( not ( = ?auto_187873 ?auto_187876 ) ) ( not ( = ?auto_187874 ?auto_187876 ) ) ( not ( = ?auto_187875 ?auto_187876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187875 ?auto_187876 )
      ( MAKE-3PILE ?auto_187873 ?auto_187874 ?auto_187875 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_187877 - BLOCK
      ?auto_187878 - BLOCK
      ?auto_187879 - BLOCK
    )
    :vars
    (
      ?auto_187880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187877 ) ( not ( = ?auto_187877 ?auto_187878 ) ) ( not ( = ?auto_187877 ?auto_187879 ) ) ( not ( = ?auto_187878 ?auto_187879 ) ) ( ON ?auto_187879 ?auto_187880 ) ( CLEAR ?auto_187879 ) ( not ( = ?auto_187877 ?auto_187880 ) ) ( not ( = ?auto_187878 ?auto_187880 ) ) ( not ( = ?auto_187879 ?auto_187880 ) ) ( HOLDING ?auto_187878 ) ( CLEAR ?auto_187877 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187877 ?auto_187878 )
      ( MAKE-3PILE ?auto_187877 ?auto_187878 ?auto_187879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_187881 - BLOCK
      ?auto_187882 - BLOCK
      ?auto_187883 - BLOCK
    )
    :vars
    (
      ?auto_187884 - BLOCK
      ?auto_187886 - BLOCK
      ?auto_187888 - BLOCK
      ?auto_187887 - BLOCK
      ?auto_187885 - BLOCK
      ?auto_187889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187881 ) ( not ( = ?auto_187881 ?auto_187882 ) ) ( not ( = ?auto_187881 ?auto_187883 ) ) ( not ( = ?auto_187882 ?auto_187883 ) ) ( ON ?auto_187883 ?auto_187884 ) ( not ( = ?auto_187881 ?auto_187884 ) ) ( not ( = ?auto_187882 ?auto_187884 ) ) ( not ( = ?auto_187883 ?auto_187884 ) ) ( CLEAR ?auto_187881 ) ( ON ?auto_187882 ?auto_187883 ) ( CLEAR ?auto_187882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187886 ) ( ON ?auto_187888 ?auto_187886 ) ( ON ?auto_187887 ?auto_187888 ) ( ON ?auto_187885 ?auto_187887 ) ( ON ?auto_187889 ?auto_187885 ) ( ON ?auto_187884 ?auto_187889 ) ( not ( = ?auto_187886 ?auto_187888 ) ) ( not ( = ?auto_187886 ?auto_187887 ) ) ( not ( = ?auto_187886 ?auto_187885 ) ) ( not ( = ?auto_187886 ?auto_187889 ) ) ( not ( = ?auto_187886 ?auto_187884 ) ) ( not ( = ?auto_187886 ?auto_187883 ) ) ( not ( = ?auto_187886 ?auto_187882 ) ) ( not ( = ?auto_187888 ?auto_187887 ) ) ( not ( = ?auto_187888 ?auto_187885 ) ) ( not ( = ?auto_187888 ?auto_187889 ) ) ( not ( = ?auto_187888 ?auto_187884 ) ) ( not ( = ?auto_187888 ?auto_187883 ) ) ( not ( = ?auto_187888 ?auto_187882 ) ) ( not ( = ?auto_187887 ?auto_187885 ) ) ( not ( = ?auto_187887 ?auto_187889 ) ) ( not ( = ?auto_187887 ?auto_187884 ) ) ( not ( = ?auto_187887 ?auto_187883 ) ) ( not ( = ?auto_187887 ?auto_187882 ) ) ( not ( = ?auto_187885 ?auto_187889 ) ) ( not ( = ?auto_187885 ?auto_187884 ) ) ( not ( = ?auto_187885 ?auto_187883 ) ) ( not ( = ?auto_187885 ?auto_187882 ) ) ( not ( = ?auto_187889 ?auto_187884 ) ) ( not ( = ?auto_187889 ?auto_187883 ) ) ( not ( = ?auto_187889 ?auto_187882 ) ) ( not ( = ?auto_187881 ?auto_187886 ) ) ( not ( = ?auto_187881 ?auto_187888 ) ) ( not ( = ?auto_187881 ?auto_187887 ) ) ( not ( = ?auto_187881 ?auto_187885 ) ) ( not ( = ?auto_187881 ?auto_187889 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187886 ?auto_187888 ?auto_187887 ?auto_187885 ?auto_187889 ?auto_187884 ?auto_187883 )
      ( MAKE-3PILE ?auto_187881 ?auto_187882 ?auto_187883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_187890 - BLOCK
      ?auto_187891 - BLOCK
      ?auto_187892 - BLOCK
    )
    :vars
    (
      ?auto_187893 - BLOCK
      ?auto_187896 - BLOCK
      ?auto_187894 - BLOCK
      ?auto_187897 - BLOCK
      ?auto_187898 - BLOCK
      ?auto_187895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187890 ?auto_187891 ) ) ( not ( = ?auto_187890 ?auto_187892 ) ) ( not ( = ?auto_187891 ?auto_187892 ) ) ( ON ?auto_187892 ?auto_187893 ) ( not ( = ?auto_187890 ?auto_187893 ) ) ( not ( = ?auto_187891 ?auto_187893 ) ) ( not ( = ?auto_187892 ?auto_187893 ) ) ( ON ?auto_187891 ?auto_187892 ) ( CLEAR ?auto_187891 ) ( ON-TABLE ?auto_187896 ) ( ON ?auto_187894 ?auto_187896 ) ( ON ?auto_187897 ?auto_187894 ) ( ON ?auto_187898 ?auto_187897 ) ( ON ?auto_187895 ?auto_187898 ) ( ON ?auto_187893 ?auto_187895 ) ( not ( = ?auto_187896 ?auto_187894 ) ) ( not ( = ?auto_187896 ?auto_187897 ) ) ( not ( = ?auto_187896 ?auto_187898 ) ) ( not ( = ?auto_187896 ?auto_187895 ) ) ( not ( = ?auto_187896 ?auto_187893 ) ) ( not ( = ?auto_187896 ?auto_187892 ) ) ( not ( = ?auto_187896 ?auto_187891 ) ) ( not ( = ?auto_187894 ?auto_187897 ) ) ( not ( = ?auto_187894 ?auto_187898 ) ) ( not ( = ?auto_187894 ?auto_187895 ) ) ( not ( = ?auto_187894 ?auto_187893 ) ) ( not ( = ?auto_187894 ?auto_187892 ) ) ( not ( = ?auto_187894 ?auto_187891 ) ) ( not ( = ?auto_187897 ?auto_187898 ) ) ( not ( = ?auto_187897 ?auto_187895 ) ) ( not ( = ?auto_187897 ?auto_187893 ) ) ( not ( = ?auto_187897 ?auto_187892 ) ) ( not ( = ?auto_187897 ?auto_187891 ) ) ( not ( = ?auto_187898 ?auto_187895 ) ) ( not ( = ?auto_187898 ?auto_187893 ) ) ( not ( = ?auto_187898 ?auto_187892 ) ) ( not ( = ?auto_187898 ?auto_187891 ) ) ( not ( = ?auto_187895 ?auto_187893 ) ) ( not ( = ?auto_187895 ?auto_187892 ) ) ( not ( = ?auto_187895 ?auto_187891 ) ) ( not ( = ?auto_187890 ?auto_187896 ) ) ( not ( = ?auto_187890 ?auto_187894 ) ) ( not ( = ?auto_187890 ?auto_187897 ) ) ( not ( = ?auto_187890 ?auto_187898 ) ) ( not ( = ?auto_187890 ?auto_187895 ) ) ( HOLDING ?auto_187890 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187890 )
      ( MAKE-3PILE ?auto_187890 ?auto_187891 ?auto_187892 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_187899 - BLOCK
      ?auto_187900 - BLOCK
      ?auto_187901 - BLOCK
    )
    :vars
    (
      ?auto_187903 - BLOCK
      ?auto_187907 - BLOCK
      ?auto_187902 - BLOCK
      ?auto_187906 - BLOCK
      ?auto_187904 - BLOCK
      ?auto_187905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187899 ?auto_187900 ) ) ( not ( = ?auto_187899 ?auto_187901 ) ) ( not ( = ?auto_187900 ?auto_187901 ) ) ( ON ?auto_187901 ?auto_187903 ) ( not ( = ?auto_187899 ?auto_187903 ) ) ( not ( = ?auto_187900 ?auto_187903 ) ) ( not ( = ?auto_187901 ?auto_187903 ) ) ( ON ?auto_187900 ?auto_187901 ) ( ON-TABLE ?auto_187907 ) ( ON ?auto_187902 ?auto_187907 ) ( ON ?auto_187906 ?auto_187902 ) ( ON ?auto_187904 ?auto_187906 ) ( ON ?auto_187905 ?auto_187904 ) ( ON ?auto_187903 ?auto_187905 ) ( not ( = ?auto_187907 ?auto_187902 ) ) ( not ( = ?auto_187907 ?auto_187906 ) ) ( not ( = ?auto_187907 ?auto_187904 ) ) ( not ( = ?auto_187907 ?auto_187905 ) ) ( not ( = ?auto_187907 ?auto_187903 ) ) ( not ( = ?auto_187907 ?auto_187901 ) ) ( not ( = ?auto_187907 ?auto_187900 ) ) ( not ( = ?auto_187902 ?auto_187906 ) ) ( not ( = ?auto_187902 ?auto_187904 ) ) ( not ( = ?auto_187902 ?auto_187905 ) ) ( not ( = ?auto_187902 ?auto_187903 ) ) ( not ( = ?auto_187902 ?auto_187901 ) ) ( not ( = ?auto_187902 ?auto_187900 ) ) ( not ( = ?auto_187906 ?auto_187904 ) ) ( not ( = ?auto_187906 ?auto_187905 ) ) ( not ( = ?auto_187906 ?auto_187903 ) ) ( not ( = ?auto_187906 ?auto_187901 ) ) ( not ( = ?auto_187906 ?auto_187900 ) ) ( not ( = ?auto_187904 ?auto_187905 ) ) ( not ( = ?auto_187904 ?auto_187903 ) ) ( not ( = ?auto_187904 ?auto_187901 ) ) ( not ( = ?auto_187904 ?auto_187900 ) ) ( not ( = ?auto_187905 ?auto_187903 ) ) ( not ( = ?auto_187905 ?auto_187901 ) ) ( not ( = ?auto_187905 ?auto_187900 ) ) ( not ( = ?auto_187899 ?auto_187907 ) ) ( not ( = ?auto_187899 ?auto_187902 ) ) ( not ( = ?auto_187899 ?auto_187906 ) ) ( not ( = ?auto_187899 ?auto_187904 ) ) ( not ( = ?auto_187899 ?auto_187905 ) ) ( ON ?auto_187899 ?auto_187900 ) ( CLEAR ?auto_187899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187907 ?auto_187902 ?auto_187906 ?auto_187904 ?auto_187905 ?auto_187903 ?auto_187901 ?auto_187900 )
      ( MAKE-3PILE ?auto_187899 ?auto_187900 ?auto_187901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187913 - BLOCK
      ?auto_187914 - BLOCK
      ?auto_187915 - BLOCK
      ?auto_187916 - BLOCK
      ?auto_187917 - BLOCK
    )
    :vars
    (
      ?auto_187918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187918 ?auto_187917 ) ( CLEAR ?auto_187918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187913 ) ( ON ?auto_187914 ?auto_187913 ) ( ON ?auto_187915 ?auto_187914 ) ( ON ?auto_187916 ?auto_187915 ) ( ON ?auto_187917 ?auto_187916 ) ( not ( = ?auto_187913 ?auto_187914 ) ) ( not ( = ?auto_187913 ?auto_187915 ) ) ( not ( = ?auto_187913 ?auto_187916 ) ) ( not ( = ?auto_187913 ?auto_187917 ) ) ( not ( = ?auto_187913 ?auto_187918 ) ) ( not ( = ?auto_187914 ?auto_187915 ) ) ( not ( = ?auto_187914 ?auto_187916 ) ) ( not ( = ?auto_187914 ?auto_187917 ) ) ( not ( = ?auto_187914 ?auto_187918 ) ) ( not ( = ?auto_187915 ?auto_187916 ) ) ( not ( = ?auto_187915 ?auto_187917 ) ) ( not ( = ?auto_187915 ?auto_187918 ) ) ( not ( = ?auto_187916 ?auto_187917 ) ) ( not ( = ?auto_187916 ?auto_187918 ) ) ( not ( = ?auto_187917 ?auto_187918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187918 ?auto_187917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187919 - BLOCK
      ?auto_187920 - BLOCK
      ?auto_187921 - BLOCK
      ?auto_187922 - BLOCK
      ?auto_187923 - BLOCK
    )
    :vars
    (
      ?auto_187924 - BLOCK
      ?auto_187925 - BLOCK
      ?auto_187926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187924 ?auto_187923 ) ( CLEAR ?auto_187924 ) ( ON-TABLE ?auto_187919 ) ( ON ?auto_187920 ?auto_187919 ) ( ON ?auto_187921 ?auto_187920 ) ( ON ?auto_187922 ?auto_187921 ) ( ON ?auto_187923 ?auto_187922 ) ( not ( = ?auto_187919 ?auto_187920 ) ) ( not ( = ?auto_187919 ?auto_187921 ) ) ( not ( = ?auto_187919 ?auto_187922 ) ) ( not ( = ?auto_187919 ?auto_187923 ) ) ( not ( = ?auto_187919 ?auto_187924 ) ) ( not ( = ?auto_187920 ?auto_187921 ) ) ( not ( = ?auto_187920 ?auto_187922 ) ) ( not ( = ?auto_187920 ?auto_187923 ) ) ( not ( = ?auto_187920 ?auto_187924 ) ) ( not ( = ?auto_187921 ?auto_187922 ) ) ( not ( = ?auto_187921 ?auto_187923 ) ) ( not ( = ?auto_187921 ?auto_187924 ) ) ( not ( = ?auto_187922 ?auto_187923 ) ) ( not ( = ?auto_187922 ?auto_187924 ) ) ( not ( = ?auto_187923 ?auto_187924 ) ) ( HOLDING ?auto_187925 ) ( CLEAR ?auto_187926 ) ( not ( = ?auto_187919 ?auto_187925 ) ) ( not ( = ?auto_187919 ?auto_187926 ) ) ( not ( = ?auto_187920 ?auto_187925 ) ) ( not ( = ?auto_187920 ?auto_187926 ) ) ( not ( = ?auto_187921 ?auto_187925 ) ) ( not ( = ?auto_187921 ?auto_187926 ) ) ( not ( = ?auto_187922 ?auto_187925 ) ) ( not ( = ?auto_187922 ?auto_187926 ) ) ( not ( = ?auto_187923 ?auto_187925 ) ) ( not ( = ?auto_187923 ?auto_187926 ) ) ( not ( = ?auto_187924 ?auto_187925 ) ) ( not ( = ?auto_187924 ?auto_187926 ) ) ( not ( = ?auto_187925 ?auto_187926 ) ) )
    :subtasks
    ( ( !STACK ?auto_187925 ?auto_187926 )
      ( MAKE-5PILE ?auto_187919 ?auto_187920 ?auto_187921 ?auto_187922 ?auto_187923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187927 - BLOCK
      ?auto_187928 - BLOCK
      ?auto_187929 - BLOCK
      ?auto_187930 - BLOCK
      ?auto_187931 - BLOCK
    )
    :vars
    (
      ?auto_187933 - BLOCK
      ?auto_187932 - BLOCK
      ?auto_187934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187933 ?auto_187931 ) ( ON-TABLE ?auto_187927 ) ( ON ?auto_187928 ?auto_187927 ) ( ON ?auto_187929 ?auto_187928 ) ( ON ?auto_187930 ?auto_187929 ) ( ON ?auto_187931 ?auto_187930 ) ( not ( = ?auto_187927 ?auto_187928 ) ) ( not ( = ?auto_187927 ?auto_187929 ) ) ( not ( = ?auto_187927 ?auto_187930 ) ) ( not ( = ?auto_187927 ?auto_187931 ) ) ( not ( = ?auto_187927 ?auto_187933 ) ) ( not ( = ?auto_187928 ?auto_187929 ) ) ( not ( = ?auto_187928 ?auto_187930 ) ) ( not ( = ?auto_187928 ?auto_187931 ) ) ( not ( = ?auto_187928 ?auto_187933 ) ) ( not ( = ?auto_187929 ?auto_187930 ) ) ( not ( = ?auto_187929 ?auto_187931 ) ) ( not ( = ?auto_187929 ?auto_187933 ) ) ( not ( = ?auto_187930 ?auto_187931 ) ) ( not ( = ?auto_187930 ?auto_187933 ) ) ( not ( = ?auto_187931 ?auto_187933 ) ) ( CLEAR ?auto_187932 ) ( not ( = ?auto_187927 ?auto_187934 ) ) ( not ( = ?auto_187927 ?auto_187932 ) ) ( not ( = ?auto_187928 ?auto_187934 ) ) ( not ( = ?auto_187928 ?auto_187932 ) ) ( not ( = ?auto_187929 ?auto_187934 ) ) ( not ( = ?auto_187929 ?auto_187932 ) ) ( not ( = ?auto_187930 ?auto_187934 ) ) ( not ( = ?auto_187930 ?auto_187932 ) ) ( not ( = ?auto_187931 ?auto_187934 ) ) ( not ( = ?auto_187931 ?auto_187932 ) ) ( not ( = ?auto_187933 ?auto_187934 ) ) ( not ( = ?auto_187933 ?auto_187932 ) ) ( not ( = ?auto_187934 ?auto_187932 ) ) ( ON ?auto_187934 ?auto_187933 ) ( CLEAR ?auto_187934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187927 ?auto_187928 ?auto_187929 ?auto_187930 ?auto_187931 ?auto_187933 )
      ( MAKE-5PILE ?auto_187927 ?auto_187928 ?auto_187929 ?auto_187930 ?auto_187931 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187935 - BLOCK
      ?auto_187936 - BLOCK
      ?auto_187937 - BLOCK
      ?auto_187938 - BLOCK
      ?auto_187939 - BLOCK
    )
    :vars
    (
      ?auto_187940 - BLOCK
      ?auto_187941 - BLOCK
      ?auto_187942 - BLOCK
      ?auto_187943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187940 ?auto_187939 ) ( ON-TABLE ?auto_187935 ) ( ON ?auto_187936 ?auto_187935 ) ( ON ?auto_187937 ?auto_187936 ) ( ON ?auto_187938 ?auto_187937 ) ( ON ?auto_187939 ?auto_187938 ) ( not ( = ?auto_187935 ?auto_187936 ) ) ( not ( = ?auto_187935 ?auto_187937 ) ) ( not ( = ?auto_187935 ?auto_187938 ) ) ( not ( = ?auto_187935 ?auto_187939 ) ) ( not ( = ?auto_187935 ?auto_187940 ) ) ( not ( = ?auto_187936 ?auto_187937 ) ) ( not ( = ?auto_187936 ?auto_187938 ) ) ( not ( = ?auto_187936 ?auto_187939 ) ) ( not ( = ?auto_187936 ?auto_187940 ) ) ( not ( = ?auto_187937 ?auto_187938 ) ) ( not ( = ?auto_187937 ?auto_187939 ) ) ( not ( = ?auto_187937 ?auto_187940 ) ) ( not ( = ?auto_187938 ?auto_187939 ) ) ( not ( = ?auto_187938 ?auto_187940 ) ) ( not ( = ?auto_187939 ?auto_187940 ) ) ( not ( = ?auto_187935 ?auto_187941 ) ) ( not ( = ?auto_187935 ?auto_187942 ) ) ( not ( = ?auto_187936 ?auto_187941 ) ) ( not ( = ?auto_187936 ?auto_187942 ) ) ( not ( = ?auto_187937 ?auto_187941 ) ) ( not ( = ?auto_187937 ?auto_187942 ) ) ( not ( = ?auto_187938 ?auto_187941 ) ) ( not ( = ?auto_187938 ?auto_187942 ) ) ( not ( = ?auto_187939 ?auto_187941 ) ) ( not ( = ?auto_187939 ?auto_187942 ) ) ( not ( = ?auto_187940 ?auto_187941 ) ) ( not ( = ?auto_187940 ?auto_187942 ) ) ( not ( = ?auto_187941 ?auto_187942 ) ) ( ON ?auto_187941 ?auto_187940 ) ( CLEAR ?auto_187941 ) ( HOLDING ?auto_187942 ) ( CLEAR ?auto_187943 ) ( ON-TABLE ?auto_187943 ) ( not ( = ?auto_187943 ?auto_187942 ) ) ( not ( = ?auto_187935 ?auto_187943 ) ) ( not ( = ?auto_187936 ?auto_187943 ) ) ( not ( = ?auto_187937 ?auto_187943 ) ) ( not ( = ?auto_187938 ?auto_187943 ) ) ( not ( = ?auto_187939 ?auto_187943 ) ) ( not ( = ?auto_187940 ?auto_187943 ) ) ( not ( = ?auto_187941 ?auto_187943 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187943 ?auto_187942 )
      ( MAKE-5PILE ?auto_187935 ?auto_187936 ?auto_187937 ?auto_187938 ?auto_187939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187944 - BLOCK
      ?auto_187945 - BLOCK
      ?auto_187946 - BLOCK
      ?auto_187947 - BLOCK
      ?auto_187948 - BLOCK
    )
    :vars
    (
      ?auto_187949 - BLOCK
      ?auto_187950 - BLOCK
      ?auto_187952 - BLOCK
      ?auto_187951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187949 ?auto_187948 ) ( ON-TABLE ?auto_187944 ) ( ON ?auto_187945 ?auto_187944 ) ( ON ?auto_187946 ?auto_187945 ) ( ON ?auto_187947 ?auto_187946 ) ( ON ?auto_187948 ?auto_187947 ) ( not ( = ?auto_187944 ?auto_187945 ) ) ( not ( = ?auto_187944 ?auto_187946 ) ) ( not ( = ?auto_187944 ?auto_187947 ) ) ( not ( = ?auto_187944 ?auto_187948 ) ) ( not ( = ?auto_187944 ?auto_187949 ) ) ( not ( = ?auto_187945 ?auto_187946 ) ) ( not ( = ?auto_187945 ?auto_187947 ) ) ( not ( = ?auto_187945 ?auto_187948 ) ) ( not ( = ?auto_187945 ?auto_187949 ) ) ( not ( = ?auto_187946 ?auto_187947 ) ) ( not ( = ?auto_187946 ?auto_187948 ) ) ( not ( = ?auto_187946 ?auto_187949 ) ) ( not ( = ?auto_187947 ?auto_187948 ) ) ( not ( = ?auto_187947 ?auto_187949 ) ) ( not ( = ?auto_187948 ?auto_187949 ) ) ( not ( = ?auto_187944 ?auto_187950 ) ) ( not ( = ?auto_187944 ?auto_187952 ) ) ( not ( = ?auto_187945 ?auto_187950 ) ) ( not ( = ?auto_187945 ?auto_187952 ) ) ( not ( = ?auto_187946 ?auto_187950 ) ) ( not ( = ?auto_187946 ?auto_187952 ) ) ( not ( = ?auto_187947 ?auto_187950 ) ) ( not ( = ?auto_187947 ?auto_187952 ) ) ( not ( = ?auto_187948 ?auto_187950 ) ) ( not ( = ?auto_187948 ?auto_187952 ) ) ( not ( = ?auto_187949 ?auto_187950 ) ) ( not ( = ?auto_187949 ?auto_187952 ) ) ( not ( = ?auto_187950 ?auto_187952 ) ) ( ON ?auto_187950 ?auto_187949 ) ( CLEAR ?auto_187951 ) ( ON-TABLE ?auto_187951 ) ( not ( = ?auto_187951 ?auto_187952 ) ) ( not ( = ?auto_187944 ?auto_187951 ) ) ( not ( = ?auto_187945 ?auto_187951 ) ) ( not ( = ?auto_187946 ?auto_187951 ) ) ( not ( = ?auto_187947 ?auto_187951 ) ) ( not ( = ?auto_187948 ?auto_187951 ) ) ( not ( = ?auto_187949 ?auto_187951 ) ) ( not ( = ?auto_187950 ?auto_187951 ) ) ( ON ?auto_187952 ?auto_187950 ) ( CLEAR ?auto_187952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187944 ?auto_187945 ?auto_187946 ?auto_187947 ?auto_187948 ?auto_187949 ?auto_187950 )
      ( MAKE-5PILE ?auto_187944 ?auto_187945 ?auto_187946 ?auto_187947 ?auto_187948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187953 - BLOCK
      ?auto_187954 - BLOCK
      ?auto_187955 - BLOCK
      ?auto_187956 - BLOCK
      ?auto_187957 - BLOCK
    )
    :vars
    (
      ?auto_187958 - BLOCK
      ?auto_187960 - BLOCK
      ?auto_187961 - BLOCK
      ?auto_187959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187958 ?auto_187957 ) ( ON-TABLE ?auto_187953 ) ( ON ?auto_187954 ?auto_187953 ) ( ON ?auto_187955 ?auto_187954 ) ( ON ?auto_187956 ?auto_187955 ) ( ON ?auto_187957 ?auto_187956 ) ( not ( = ?auto_187953 ?auto_187954 ) ) ( not ( = ?auto_187953 ?auto_187955 ) ) ( not ( = ?auto_187953 ?auto_187956 ) ) ( not ( = ?auto_187953 ?auto_187957 ) ) ( not ( = ?auto_187953 ?auto_187958 ) ) ( not ( = ?auto_187954 ?auto_187955 ) ) ( not ( = ?auto_187954 ?auto_187956 ) ) ( not ( = ?auto_187954 ?auto_187957 ) ) ( not ( = ?auto_187954 ?auto_187958 ) ) ( not ( = ?auto_187955 ?auto_187956 ) ) ( not ( = ?auto_187955 ?auto_187957 ) ) ( not ( = ?auto_187955 ?auto_187958 ) ) ( not ( = ?auto_187956 ?auto_187957 ) ) ( not ( = ?auto_187956 ?auto_187958 ) ) ( not ( = ?auto_187957 ?auto_187958 ) ) ( not ( = ?auto_187953 ?auto_187960 ) ) ( not ( = ?auto_187953 ?auto_187961 ) ) ( not ( = ?auto_187954 ?auto_187960 ) ) ( not ( = ?auto_187954 ?auto_187961 ) ) ( not ( = ?auto_187955 ?auto_187960 ) ) ( not ( = ?auto_187955 ?auto_187961 ) ) ( not ( = ?auto_187956 ?auto_187960 ) ) ( not ( = ?auto_187956 ?auto_187961 ) ) ( not ( = ?auto_187957 ?auto_187960 ) ) ( not ( = ?auto_187957 ?auto_187961 ) ) ( not ( = ?auto_187958 ?auto_187960 ) ) ( not ( = ?auto_187958 ?auto_187961 ) ) ( not ( = ?auto_187960 ?auto_187961 ) ) ( ON ?auto_187960 ?auto_187958 ) ( not ( = ?auto_187959 ?auto_187961 ) ) ( not ( = ?auto_187953 ?auto_187959 ) ) ( not ( = ?auto_187954 ?auto_187959 ) ) ( not ( = ?auto_187955 ?auto_187959 ) ) ( not ( = ?auto_187956 ?auto_187959 ) ) ( not ( = ?auto_187957 ?auto_187959 ) ) ( not ( = ?auto_187958 ?auto_187959 ) ) ( not ( = ?auto_187960 ?auto_187959 ) ) ( ON ?auto_187961 ?auto_187960 ) ( CLEAR ?auto_187961 ) ( HOLDING ?auto_187959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187959 )
      ( MAKE-5PILE ?auto_187953 ?auto_187954 ?auto_187955 ?auto_187956 ?auto_187957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187962 - BLOCK
      ?auto_187963 - BLOCK
      ?auto_187964 - BLOCK
      ?auto_187965 - BLOCK
      ?auto_187966 - BLOCK
    )
    :vars
    (
      ?auto_187968 - BLOCK
      ?auto_187969 - BLOCK
      ?auto_187967 - BLOCK
      ?auto_187970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187968 ?auto_187966 ) ( ON-TABLE ?auto_187962 ) ( ON ?auto_187963 ?auto_187962 ) ( ON ?auto_187964 ?auto_187963 ) ( ON ?auto_187965 ?auto_187964 ) ( ON ?auto_187966 ?auto_187965 ) ( not ( = ?auto_187962 ?auto_187963 ) ) ( not ( = ?auto_187962 ?auto_187964 ) ) ( not ( = ?auto_187962 ?auto_187965 ) ) ( not ( = ?auto_187962 ?auto_187966 ) ) ( not ( = ?auto_187962 ?auto_187968 ) ) ( not ( = ?auto_187963 ?auto_187964 ) ) ( not ( = ?auto_187963 ?auto_187965 ) ) ( not ( = ?auto_187963 ?auto_187966 ) ) ( not ( = ?auto_187963 ?auto_187968 ) ) ( not ( = ?auto_187964 ?auto_187965 ) ) ( not ( = ?auto_187964 ?auto_187966 ) ) ( not ( = ?auto_187964 ?auto_187968 ) ) ( not ( = ?auto_187965 ?auto_187966 ) ) ( not ( = ?auto_187965 ?auto_187968 ) ) ( not ( = ?auto_187966 ?auto_187968 ) ) ( not ( = ?auto_187962 ?auto_187969 ) ) ( not ( = ?auto_187962 ?auto_187967 ) ) ( not ( = ?auto_187963 ?auto_187969 ) ) ( not ( = ?auto_187963 ?auto_187967 ) ) ( not ( = ?auto_187964 ?auto_187969 ) ) ( not ( = ?auto_187964 ?auto_187967 ) ) ( not ( = ?auto_187965 ?auto_187969 ) ) ( not ( = ?auto_187965 ?auto_187967 ) ) ( not ( = ?auto_187966 ?auto_187969 ) ) ( not ( = ?auto_187966 ?auto_187967 ) ) ( not ( = ?auto_187968 ?auto_187969 ) ) ( not ( = ?auto_187968 ?auto_187967 ) ) ( not ( = ?auto_187969 ?auto_187967 ) ) ( ON ?auto_187969 ?auto_187968 ) ( not ( = ?auto_187970 ?auto_187967 ) ) ( not ( = ?auto_187962 ?auto_187970 ) ) ( not ( = ?auto_187963 ?auto_187970 ) ) ( not ( = ?auto_187964 ?auto_187970 ) ) ( not ( = ?auto_187965 ?auto_187970 ) ) ( not ( = ?auto_187966 ?auto_187970 ) ) ( not ( = ?auto_187968 ?auto_187970 ) ) ( not ( = ?auto_187969 ?auto_187970 ) ) ( ON ?auto_187967 ?auto_187969 ) ( ON ?auto_187970 ?auto_187967 ) ( CLEAR ?auto_187970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187962 ?auto_187963 ?auto_187964 ?auto_187965 ?auto_187966 ?auto_187968 ?auto_187969 ?auto_187967 )
      ( MAKE-5PILE ?auto_187962 ?auto_187963 ?auto_187964 ?auto_187965 ?auto_187966 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_187975 - BLOCK
      ?auto_187976 - BLOCK
      ?auto_187977 - BLOCK
      ?auto_187978 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_187978 ) ( CLEAR ?auto_187977 ) ( ON-TABLE ?auto_187975 ) ( ON ?auto_187976 ?auto_187975 ) ( ON ?auto_187977 ?auto_187976 ) ( not ( = ?auto_187975 ?auto_187976 ) ) ( not ( = ?auto_187975 ?auto_187977 ) ) ( not ( = ?auto_187975 ?auto_187978 ) ) ( not ( = ?auto_187976 ?auto_187977 ) ) ( not ( = ?auto_187976 ?auto_187978 ) ) ( not ( = ?auto_187977 ?auto_187978 ) ) )
    :subtasks
    ( ( !STACK ?auto_187978 ?auto_187977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_187979 - BLOCK
      ?auto_187980 - BLOCK
      ?auto_187981 - BLOCK
      ?auto_187982 - BLOCK
    )
    :vars
    (
      ?auto_187983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187981 ) ( ON-TABLE ?auto_187979 ) ( ON ?auto_187980 ?auto_187979 ) ( ON ?auto_187981 ?auto_187980 ) ( not ( = ?auto_187979 ?auto_187980 ) ) ( not ( = ?auto_187979 ?auto_187981 ) ) ( not ( = ?auto_187979 ?auto_187982 ) ) ( not ( = ?auto_187980 ?auto_187981 ) ) ( not ( = ?auto_187980 ?auto_187982 ) ) ( not ( = ?auto_187981 ?auto_187982 ) ) ( ON ?auto_187982 ?auto_187983 ) ( CLEAR ?auto_187982 ) ( HAND-EMPTY ) ( not ( = ?auto_187979 ?auto_187983 ) ) ( not ( = ?auto_187980 ?auto_187983 ) ) ( not ( = ?auto_187981 ?auto_187983 ) ) ( not ( = ?auto_187982 ?auto_187983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187982 ?auto_187983 )
      ( MAKE-4PILE ?auto_187979 ?auto_187980 ?auto_187981 ?auto_187982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_187984 - BLOCK
      ?auto_187985 - BLOCK
      ?auto_187986 - BLOCK
      ?auto_187987 - BLOCK
    )
    :vars
    (
      ?auto_187988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187984 ) ( ON ?auto_187985 ?auto_187984 ) ( not ( = ?auto_187984 ?auto_187985 ) ) ( not ( = ?auto_187984 ?auto_187986 ) ) ( not ( = ?auto_187984 ?auto_187987 ) ) ( not ( = ?auto_187985 ?auto_187986 ) ) ( not ( = ?auto_187985 ?auto_187987 ) ) ( not ( = ?auto_187986 ?auto_187987 ) ) ( ON ?auto_187987 ?auto_187988 ) ( CLEAR ?auto_187987 ) ( not ( = ?auto_187984 ?auto_187988 ) ) ( not ( = ?auto_187985 ?auto_187988 ) ) ( not ( = ?auto_187986 ?auto_187988 ) ) ( not ( = ?auto_187987 ?auto_187988 ) ) ( HOLDING ?auto_187986 ) ( CLEAR ?auto_187985 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187984 ?auto_187985 ?auto_187986 )
      ( MAKE-4PILE ?auto_187984 ?auto_187985 ?auto_187986 ?auto_187987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_187989 - BLOCK
      ?auto_187990 - BLOCK
      ?auto_187991 - BLOCK
      ?auto_187992 - BLOCK
    )
    :vars
    (
      ?auto_187993 - BLOCK
      ?auto_187997 - BLOCK
      ?auto_187996 - BLOCK
      ?auto_187994 - BLOCK
      ?auto_187995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187989 ) ( ON ?auto_187990 ?auto_187989 ) ( not ( = ?auto_187989 ?auto_187990 ) ) ( not ( = ?auto_187989 ?auto_187991 ) ) ( not ( = ?auto_187989 ?auto_187992 ) ) ( not ( = ?auto_187990 ?auto_187991 ) ) ( not ( = ?auto_187990 ?auto_187992 ) ) ( not ( = ?auto_187991 ?auto_187992 ) ) ( ON ?auto_187992 ?auto_187993 ) ( not ( = ?auto_187989 ?auto_187993 ) ) ( not ( = ?auto_187990 ?auto_187993 ) ) ( not ( = ?auto_187991 ?auto_187993 ) ) ( not ( = ?auto_187992 ?auto_187993 ) ) ( CLEAR ?auto_187990 ) ( ON ?auto_187991 ?auto_187992 ) ( CLEAR ?auto_187991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187997 ) ( ON ?auto_187996 ?auto_187997 ) ( ON ?auto_187994 ?auto_187996 ) ( ON ?auto_187995 ?auto_187994 ) ( ON ?auto_187993 ?auto_187995 ) ( not ( = ?auto_187997 ?auto_187996 ) ) ( not ( = ?auto_187997 ?auto_187994 ) ) ( not ( = ?auto_187997 ?auto_187995 ) ) ( not ( = ?auto_187997 ?auto_187993 ) ) ( not ( = ?auto_187997 ?auto_187992 ) ) ( not ( = ?auto_187997 ?auto_187991 ) ) ( not ( = ?auto_187996 ?auto_187994 ) ) ( not ( = ?auto_187996 ?auto_187995 ) ) ( not ( = ?auto_187996 ?auto_187993 ) ) ( not ( = ?auto_187996 ?auto_187992 ) ) ( not ( = ?auto_187996 ?auto_187991 ) ) ( not ( = ?auto_187994 ?auto_187995 ) ) ( not ( = ?auto_187994 ?auto_187993 ) ) ( not ( = ?auto_187994 ?auto_187992 ) ) ( not ( = ?auto_187994 ?auto_187991 ) ) ( not ( = ?auto_187995 ?auto_187993 ) ) ( not ( = ?auto_187995 ?auto_187992 ) ) ( not ( = ?auto_187995 ?auto_187991 ) ) ( not ( = ?auto_187989 ?auto_187997 ) ) ( not ( = ?auto_187989 ?auto_187996 ) ) ( not ( = ?auto_187989 ?auto_187994 ) ) ( not ( = ?auto_187989 ?auto_187995 ) ) ( not ( = ?auto_187990 ?auto_187997 ) ) ( not ( = ?auto_187990 ?auto_187996 ) ) ( not ( = ?auto_187990 ?auto_187994 ) ) ( not ( = ?auto_187990 ?auto_187995 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187997 ?auto_187996 ?auto_187994 ?auto_187995 ?auto_187993 ?auto_187992 )
      ( MAKE-4PILE ?auto_187989 ?auto_187990 ?auto_187991 ?auto_187992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_187998 - BLOCK
      ?auto_187999 - BLOCK
      ?auto_188000 - BLOCK
      ?auto_188001 - BLOCK
    )
    :vars
    (
      ?auto_188004 - BLOCK
      ?auto_188003 - BLOCK
      ?auto_188006 - BLOCK
      ?auto_188005 - BLOCK
      ?auto_188002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187998 ) ( not ( = ?auto_187998 ?auto_187999 ) ) ( not ( = ?auto_187998 ?auto_188000 ) ) ( not ( = ?auto_187998 ?auto_188001 ) ) ( not ( = ?auto_187999 ?auto_188000 ) ) ( not ( = ?auto_187999 ?auto_188001 ) ) ( not ( = ?auto_188000 ?auto_188001 ) ) ( ON ?auto_188001 ?auto_188004 ) ( not ( = ?auto_187998 ?auto_188004 ) ) ( not ( = ?auto_187999 ?auto_188004 ) ) ( not ( = ?auto_188000 ?auto_188004 ) ) ( not ( = ?auto_188001 ?auto_188004 ) ) ( ON ?auto_188000 ?auto_188001 ) ( CLEAR ?auto_188000 ) ( ON-TABLE ?auto_188003 ) ( ON ?auto_188006 ?auto_188003 ) ( ON ?auto_188005 ?auto_188006 ) ( ON ?auto_188002 ?auto_188005 ) ( ON ?auto_188004 ?auto_188002 ) ( not ( = ?auto_188003 ?auto_188006 ) ) ( not ( = ?auto_188003 ?auto_188005 ) ) ( not ( = ?auto_188003 ?auto_188002 ) ) ( not ( = ?auto_188003 ?auto_188004 ) ) ( not ( = ?auto_188003 ?auto_188001 ) ) ( not ( = ?auto_188003 ?auto_188000 ) ) ( not ( = ?auto_188006 ?auto_188005 ) ) ( not ( = ?auto_188006 ?auto_188002 ) ) ( not ( = ?auto_188006 ?auto_188004 ) ) ( not ( = ?auto_188006 ?auto_188001 ) ) ( not ( = ?auto_188006 ?auto_188000 ) ) ( not ( = ?auto_188005 ?auto_188002 ) ) ( not ( = ?auto_188005 ?auto_188004 ) ) ( not ( = ?auto_188005 ?auto_188001 ) ) ( not ( = ?auto_188005 ?auto_188000 ) ) ( not ( = ?auto_188002 ?auto_188004 ) ) ( not ( = ?auto_188002 ?auto_188001 ) ) ( not ( = ?auto_188002 ?auto_188000 ) ) ( not ( = ?auto_187998 ?auto_188003 ) ) ( not ( = ?auto_187998 ?auto_188006 ) ) ( not ( = ?auto_187998 ?auto_188005 ) ) ( not ( = ?auto_187998 ?auto_188002 ) ) ( not ( = ?auto_187999 ?auto_188003 ) ) ( not ( = ?auto_187999 ?auto_188006 ) ) ( not ( = ?auto_187999 ?auto_188005 ) ) ( not ( = ?auto_187999 ?auto_188002 ) ) ( HOLDING ?auto_187999 ) ( CLEAR ?auto_187998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187998 ?auto_187999 )
      ( MAKE-4PILE ?auto_187998 ?auto_187999 ?auto_188000 ?auto_188001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188007 - BLOCK
      ?auto_188008 - BLOCK
      ?auto_188009 - BLOCK
      ?auto_188010 - BLOCK
    )
    :vars
    (
      ?auto_188012 - BLOCK
      ?auto_188015 - BLOCK
      ?auto_188011 - BLOCK
      ?auto_188014 - BLOCK
      ?auto_188013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188007 ) ( not ( = ?auto_188007 ?auto_188008 ) ) ( not ( = ?auto_188007 ?auto_188009 ) ) ( not ( = ?auto_188007 ?auto_188010 ) ) ( not ( = ?auto_188008 ?auto_188009 ) ) ( not ( = ?auto_188008 ?auto_188010 ) ) ( not ( = ?auto_188009 ?auto_188010 ) ) ( ON ?auto_188010 ?auto_188012 ) ( not ( = ?auto_188007 ?auto_188012 ) ) ( not ( = ?auto_188008 ?auto_188012 ) ) ( not ( = ?auto_188009 ?auto_188012 ) ) ( not ( = ?auto_188010 ?auto_188012 ) ) ( ON ?auto_188009 ?auto_188010 ) ( ON-TABLE ?auto_188015 ) ( ON ?auto_188011 ?auto_188015 ) ( ON ?auto_188014 ?auto_188011 ) ( ON ?auto_188013 ?auto_188014 ) ( ON ?auto_188012 ?auto_188013 ) ( not ( = ?auto_188015 ?auto_188011 ) ) ( not ( = ?auto_188015 ?auto_188014 ) ) ( not ( = ?auto_188015 ?auto_188013 ) ) ( not ( = ?auto_188015 ?auto_188012 ) ) ( not ( = ?auto_188015 ?auto_188010 ) ) ( not ( = ?auto_188015 ?auto_188009 ) ) ( not ( = ?auto_188011 ?auto_188014 ) ) ( not ( = ?auto_188011 ?auto_188013 ) ) ( not ( = ?auto_188011 ?auto_188012 ) ) ( not ( = ?auto_188011 ?auto_188010 ) ) ( not ( = ?auto_188011 ?auto_188009 ) ) ( not ( = ?auto_188014 ?auto_188013 ) ) ( not ( = ?auto_188014 ?auto_188012 ) ) ( not ( = ?auto_188014 ?auto_188010 ) ) ( not ( = ?auto_188014 ?auto_188009 ) ) ( not ( = ?auto_188013 ?auto_188012 ) ) ( not ( = ?auto_188013 ?auto_188010 ) ) ( not ( = ?auto_188013 ?auto_188009 ) ) ( not ( = ?auto_188007 ?auto_188015 ) ) ( not ( = ?auto_188007 ?auto_188011 ) ) ( not ( = ?auto_188007 ?auto_188014 ) ) ( not ( = ?auto_188007 ?auto_188013 ) ) ( not ( = ?auto_188008 ?auto_188015 ) ) ( not ( = ?auto_188008 ?auto_188011 ) ) ( not ( = ?auto_188008 ?auto_188014 ) ) ( not ( = ?auto_188008 ?auto_188013 ) ) ( CLEAR ?auto_188007 ) ( ON ?auto_188008 ?auto_188009 ) ( CLEAR ?auto_188008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188015 ?auto_188011 ?auto_188014 ?auto_188013 ?auto_188012 ?auto_188010 ?auto_188009 )
      ( MAKE-4PILE ?auto_188007 ?auto_188008 ?auto_188009 ?auto_188010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188016 - BLOCK
      ?auto_188017 - BLOCK
      ?auto_188018 - BLOCK
      ?auto_188019 - BLOCK
    )
    :vars
    (
      ?auto_188020 - BLOCK
      ?auto_188022 - BLOCK
      ?auto_188023 - BLOCK
      ?auto_188024 - BLOCK
      ?auto_188021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188016 ?auto_188017 ) ) ( not ( = ?auto_188016 ?auto_188018 ) ) ( not ( = ?auto_188016 ?auto_188019 ) ) ( not ( = ?auto_188017 ?auto_188018 ) ) ( not ( = ?auto_188017 ?auto_188019 ) ) ( not ( = ?auto_188018 ?auto_188019 ) ) ( ON ?auto_188019 ?auto_188020 ) ( not ( = ?auto_188016 ?auto_188020 ) ) ( not ( = ?auto_188017 ?auto_188020 ) ) ( not ( = ?auto_188018 ?auto_188020 ) ) ( not ( = ?auto_188019 ?auto_188020 ) ) ( ON ?auto_188018 ?auto_188019 ) ( ON-TABLE ?auto_188022 ) ( ON ?auto_188023 ?auto_188022 ) ( ON ?auto_188024 ?auto_188023 ) ( ON ?auto_188021 ?auto_188024 ) ( ON ?auto_188020 ?auto_188021 ) ( not ( = ?auto_188022 ?auto_188023 ) ) ( not ( = ?auto_188022 ?auto_188024 ) ) ( not ( = ?auto_188022 ?auto_188021 ) ) ( not ( = ?auto_188022 ?auto_188020 ) ) ( not ( = ?auto_188022 ?auto_188019 ) ) ( not ( = ?auto_188022 ?auto_188018 ) ) ( not ( = ?auto_188023 ?auto_188024 ) ) ( not ( = ?auto_188023 ?auto_188021 ) ) ( not ( = ?auto_188023 ?auto_188020 ) ) ( not ( = ?auto_188023 ?auto_188019 ) ) ( not ( = ?auto_188023 ?auto_188018 ) ) ( not ( = ?auto_188024 ?auto_188021 ) ) ( not ( = ?auto_188024 ?auto_188020 ) ) ( not ( = ?auto_188024 ?auto_188019 ) ) ( not ( = ?auto_188024 ?auto_188018 ) ) ( not ( = ?auto_188021 ?auto_188020 ) ) ( not ( = ?auto_188021 ?auto_188019 ) ) ( not ( = ?auto_188021 ?auto_188018 ) ) ( not ( = ?auto_188016 ?auto_188022 ) ) ( not ( = ?auto_188016 ?auto_188023 ) ) ( not ( = ?auto_188016 ?auto_188024 ) ) ( not ( = ?auto_188016 ?auto_188021 ) ) ( not ( = ?auto_188017 ?auto_188022 ) ) ( not ( = ?auto_188017 ?auto_188023 ) ) ( not ( = ?auto_188017 ?auto_188024 ) ) ( not ( = ?auto_188017 ?auto_188021 ) ) ( ON ?auto_188017 ?auto_188018 ) ( CLEAR ?auto_188017 ) ( HOLDING ?auto_188016 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188016 )
      ( MAKE-4PILE ?auto_188016 ?auto_188017 ?auto_188018 ?auto_188019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188025 - BLOCK
      ?auto_188026 - BLOCK
      ?auto_188027 - BLOCK
      ?auto_188028 - BLOCK
    )
    :vars
    (
      ?auto_188029 - BLOCK
      ?auto_188033 - BLOCK
      ?auto_188032 - BLOCK
      ?auto_188031 - BLOCK
      ?auto_188030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188025 ?auto_188026 ) ) ( not ( = ?auto_188025 ?auto_188027 ) ) ( not ( = ?auto_188025 ?auto_188028 ) ) ( not ( = ?auto_188026 ?auto_188027 ) ) ( not ( = ?auto_188026 ?auto_188028 ) ) ( not ( = ?auto_188027 ?auto_188028 ) ) ( ON ?auto_188028 ?auto_188029 ) ( not ( = ?auto_188025 ?auto_188029 ) ) ( not ( = ?auto_188026 ?auto_188029 ) ) ( not ( = ?auto_188027 ?auto_188029 ) ) ( not ( = ?auto_188028 ?auto_188029 ) ) ( ON ?auto_188027 ?auto_188028 ) ( ON-TABLE ?auto_188033 ) ( ON ?auto_188032 ?auto_188033 ) ( ON ?auto_188031 ?auto_188032 ) ( ON ?auto_188030 ?auto_188031 ) ( ON ?auto_188029 ?auto_188030 ) ( not ( = ?auto_188033 ?auto_188032 ) ) ( not ( = ?auto_188033 ?auto_188031 ) ) ( not ( = ?auto_188033 ?auto_188030 ) ) ( not ( = ?auto_188033 ?auto_188029 ) ) ( not ( = ?auto_188033 ?auto_188028 ) ) ( not ( = ?auto_188033 ?auto_188027 ) ) ( not ( = ?auto_188032 ?auto_188031 ) ) ( not ( = ?auto_188032 ?auto_188030 ) ) ( not ( = ?auto_188032 ?auto_188029 ) ) ( not ( = ?auto_188032 ?auto_188028 ) ) ( not ( = ?auto_188032 ?auto_188027 ) ) ( not ( = ?auto_188031 ?auto_188030 ) ) ( not ( = ?auto_188031 ?auto_188029 ) ) ( not ( = ?auto_188031 ?auto_188028 ) ) ( not ( = ?auto_188031 ?auto_188027 ) ) ( not ( = ?auto_188030 ?auto_188029 ) ) ( not ( = ?auto_188030 ?auto_188028 ) ) ( not ( = ?auto_188030 ?auto_188027 ) ) ( not ( = ?auto_188025 ?auto_188033 ) ) ( not ( = ?auto_188025 ?auto_188032 ) ) ( not ( = ?auto_188025 ?auto_188031 ) ) ( not ( = ?auto_188025 ?auto_188030 ) ) ( not ( = ?auto_188026 ?auto_188033 ) ) ( not ( = ?auto_188026 ?auto_188032 ) ) ( not ( = ?auto_188026 ?auto_188031 ) ) ( not ( = ?auto_188026 ?auto_188030 ) ) ( ON ?auto_188026 ?auto_188027 ) ( ON ?auto_188025 ?auto_188026 ) ( CLEAR ?auto_188025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188033 ?auto_188032 ?auto_188031 ?auto_188030 ?auto_188029 ?auto_188028 ?auto_188027 ?auto_188026 )
      ( MAKE-4PILE ?auto_188025 ?auto_188026 ?auto_188027 ?auto_188028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188038 - BLOCK
      ?auto_188039 - BLOCK
      ?auto_188040 - BLOCK
      ?auto_188041 - BLOCK
    )
    :vars
    (
      ?auto_188042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188042 ?auto_188041 ) ( CLEAR ?auto_188042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188038 ) ( ON ?auto_188039 ?auto_188038 ) ( ON ?auto_188040 ?auto_188039 ) ( ON ?auto_188041 ?auto_188040 ) ( not ( = ?auto_188038 ?auto_188039 ) ) ( not ( = ?auto_188038 ?auto_188040 ) ) ( not ( = ?auto_188038 ?auto_188041 ) ) ( not ( = ?auto_188038 ?auto_188042 ) ) ( not ( = ?auto_188039 ?auto_188040 ) ) ( not ( = ?auto_188039 ?auto_188041 ) ) ( not ( = ?auto_188039 ?auto_188042 ) ) ( not ( = ?auto_188040 ?auto_188041 ) ) ( not ( = ?auto_188040 ?auto_188042 ) ) ( not ( = ?auto_188041 ?auto_188042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188042 ?auto_188041 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188043 - BLOCK
      ?auto_188044 - BLOCK
      ?auto_188045 - BLOCK
      ?auto_188046 - BLOCK
    )
    :vars
    (
      ?auto_188047 - BLOCK
      ?auto_188048 - BLOCK
      ?auto_188049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188047 ?auto_188046 ) ( CLEAR ?auto_188047 ) ( ON-TABLE ?auto_188043 ) ( ON ?auto_188044 ?auto_188043 ) ( ON ?auto_188045 ?auto_188044 ) ( ON ?auto_188046 ?auto_188045 ) ( not ( = ?auto_188043 ?auto_188044 ) ) ( not ( = ?auto_188043 ?auto_188045 ) ) ( not ( = ?auto_188043 ?auto_188046 ) ) ( not ( = ?auto_188043 ?auto_188047 ) ) ( not ( = ?auto_188044 ?auto_188045 ) ) ( not ( = ?auto_188044 ?auto_188046 ) ) ( not ( = ?auto_188044 ?auto_188047 ) ) ( not ( = ?auto_188045 ?auto_188046 ) ) ( not ( = ?auto_188045 ?auto_188047 ) ) ( not ( = ?auto_188046 ?auto_188047 ) ) ( HOLDING ?auto_188048 ) ( CLEAR ?auto_188049 ) ( not ( = ?auto_188043 ?auto_188048 ) ) ( not ( = ?auto_188043 ?auto_188049 ) ) ( not ( = ?auto_188044 ?auto_188048 ) ) ( not ( = ?auto_188044 ?auto_188049 ) ) ( not ( = ?auto_188045 ?auto_188048 ) ) ( not ( = ?auto_188045 ?auto_188049 ) ) ( not ( = ?auto_188046 ?auto_188048 ) ) ( not ( = ?auto_188046 ?auto_188049 ) ) ( not ( = ?auto_188047 ?auto_188048 ) ) ( not ( = ?auto_188047 ?auto_188049 ) ) ( not ( = ?auto_188048 ?auto_188049 ) ) )
    :subtasks
    ( ( !STACK ?auto_188048 ?auto_188049 )
      ( MAKE-4PILE ?auto_188043 ?auto_188044 ?auto_188045 ?auto_188046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188050 - BLOCK
      ?auto_188051 - BLOCK
      ?auto_188052 - BLOCK
      ?auto_188053 - BLOCK
    )
    :vars
    (
      ?auto_188056 - BLOCK
      ?auto_188055 - BLOCK
      ?auto_188054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188056 ?auto_188053 ) ( ON-TABLE ?auto_188050 ) ( ON ?auto_188051 ?auto_188050 ) ( ON ?auto_188052 ?auto_188051 ) ( ON ?auto_188053 ?auto_188052 ) ( not ( = ?auto_188050 ?auto_188051 ) ) ( not ( = ?auto_188050 ?auto_188052 ) ) ( not ( = ?auto_188050 ?auto_188053 ) ) ( not ( = ?auto_188050 ?auto_188056 ) ) ( not ( = ?auto_188051 ?auto_188052 ) ) ( not ( = ?auto_188051 ?auto_188053 ) ) ( not ( = ?auto_188051 ?auto_188056 ) ) ( not ( = ?auto_188052 ?auto_188053 ) ) ( not ( = ?auto_188052 ?auto_188056 ) ) ( not ( = ?auto_188053 ?auto_188056 ) ) ( CLEAR ?auto_188055 ) ( not ( = ?auto_188050 ?auto_188054 ) ) ( not ( = ?auto_188050 ?auto_188055 ) ) ( not ( = ?auto_188051 ?auto_188054 ) ) ( not ( = ?auto_188051 ?auto_188055 ) ) ( not ( = ?auto_188052 ?auto_188054 ) ) ( not ( = ?auto_188052 ?auto_188055 ) ) ( not ( = ?auto_188053 ?auto_188054 ) ) ( not ( = ?auto_188053 ?auto_188055 ) ) ( not ( = ?auto_188056 ?auto_188054 ) ) ( not ( = ?auto_188056 ?auto_188055 ) ) ( not ( = ?auto_188054 ?auto_188055 ) ) ( ON ?auto_188054 ?auto_188056 ) ( CLEAR ?auto_188054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188050 ?auto_188051 ?auto_188052 ?auto_188053 ?auto_188056 )
      ( MAKE-4PILE ?auto_188050 ?auto_188051 ?auto_188052 ?auto_188053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188057 - BLOCK
      ?auto_188058 - BLOCK
      ?auto_188059 - BLOCK
      ?auto_188060 - BLOCK
    )
    :vars
    (
      ?auto_188062 - BLOCK
      ?auto_188061 - BLOCK
      ?auto_188063 - BLOCK
      ?auto_188065 - BLOCK
      ?auto_188064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188062 ?auto_188060 ) ( ON-TABLE ?auto_188057 ) ( ON ?auto_188058 ?auto_188057 ) ( ON ?auto_188059 ?auto_188058 ) ( ON ?auto_188060 ?auto_188059 ) ( not ( = ?auto_188057 ?auto_188058 ) ) ( not ( = ?auto_188057 ?auto_188059 ) ) ( not ( = ?auto_188057 ?auto_188060 ) ) ( not ( = ?auto_188057 ?auto_188062 ) ) ( not ( = ?auto_188058 ?auto_188059 ) ) ( not ( = ?auto_188058 ?auto_188060 ) ) ( not ( = ?auto_188058 ?auto_188062 ) ) ( not ( = ?auto_188059 ?auto_188060 ) ) ( not ( = ?auto_188059 ?auto_188062 ) ) ( not ( = ?auto_188060 ?auto_188062 ) ) ( not ( = ?auto_188057 ?auto_188061 ) ) ( not ( = ?auto_188057 ?auto_188063 ) ) ( not ( = ?auto_188058 ?auto_188061 ) ) ( not ( = ?auto_188058 ?auto_188063 ) ) ( not ( = ?auto_188059 ?auto_188061 ) ) ( not ( = ?auto_188059 ?auto_188063 ) ) ( not ( = ?auto_188060 ?auto_188061 ) ) ( not ( = ?auto_188060 ?auto_188063 ) ) ( not ( = ?auto_188062 ?auto_188061 ) ) ( not ( = ?auto_188062 ?auto_188063 ) ) ( not ( = ?auto_188061 ?auto_188063 ) ) ( ON ?auto_188061 ?auto_188062 ) ( CLEAR ?auto_188061 ) ( HOLDING ?auto_188063 ) ( CLEAR ?auto_188065 ) ( ON-TABLE ?auto_188064 ) ( ON ?auto_188065 ?auto_188064 ) ( not ( = ?auto_188064 ?auto_188065 ) ) ( not ( = ?auto_188064 ?auto_188063 ) ) ( not ( = ?auto_188065 ?auto_188063 ) ) ( not ( = ?auto_188057 ?auto_188065 ) ) ( not ( = ?auto_188057 ?auto_188064 ) ) ( not ( = ?auto_188058 ?auto_188065 ) ) ( not ( = ?auto_188058 ?auto_188064 ) ) ( not ( = ?auto_188059 ?auto_188065 ) ) ( not ( = ?auto_188059 ?auto_188064 ) ) ( not ( = ?auto_188060 ?auto_188065 ) ) ( not ( = ?auto_188060 ?auto_188064 ) ) ( not ( = ?auto_188062 ?auto_188065 ) ) ( not ( = ?auto_188062 ?auto_188064 ) ) ( not ( = ?auto_188061 ?auto_188065 ) ) ( not ( = ?auto_188061 ?auto_188064 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188064 ?auto_188065 ?auto_188063 )
      ( MAKE-4PILE ?auto_188057 ?auto_188058 ?auto_188059 ?auto_188060 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188066 - BLOCK
      ?auto_188067 - BLOCK
      ?auto_188068 - BLOCK
      ?auto_188069 - BLOCK
    )
    :vars
    (
      ?auto_188071 - BLOCK
      ?auto_188074 - BLOCK
      ?auto_188070 - BLOCK
      ?auto_188072 - BLOCK
      ?auto_188073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188071 ?auto_188069 ) ( ON-TABLE ?auto_188066 ) ( ON ?auto_188067 ?auto_188066 ) ( ON ?auto_188068 ?auto_188067 ) ( ON ?auto_188069 ?auto_188068 ) ( not ( = ?auto_188066 ?auto_188067 ) ) ( not ( = ?auto_188066 ?auto_188068 ) ) ( not ( = ?auto_188066 ?auto_188069 ) ) ( not ( = ?auto_188066 ?auto_188071 ) ) ( not ( = ?auto_188067 ?auto_188068 ) ) ( not ( = ?auto_188067 ?auto_188069 ) ) ( not ( = ?auto_188067 ?auto_188071 ) ) ( not ( = ?auto_188068 ?auto_188069 ) ) ( not ( = ?auto_188068 ?auto_188071 ) ) ( not ( = ?auto_188069 ?auto_188071 ) ) ( not ( = ?auto_188066 ?auto_188074 ) ) ( not ( = ?auto_188066 ?auto_188070 ) ) ( not ( = ?auto_188067 ?auto_188074 ) ) ( not ( = ?auto_188067 ?auto_188070 ) ) ( not ( = ?auto_188068 ?auto_188074 ) ) ( not ( = ?auto_188068 ?auto_188070 ) ) ( not ( = ?auto_188069 ?auto_188074 ) ) ( not ( = ?auto_188069 ?auto_188070 ) ) ( not ( = ?auto_188071 ?auto_188074 ) ) ( not ( = ?auto_188071 ?auto_188070 ) ) ( not ( = ?auto_188074 ?auto_188070 ) ) ( ON ?auto_188074 ?auto_188071 ) ( CLEAR ?auto_188072 ) ( ON-TABLE ?auto_188073 ) ( ON ?auto_188072 ?auto_188073 ) ( not ( = ?auto_188073 ?auto_188072 ) ) ( not ( = ?auto_188073 ?auto_188070 ) ) ( not ( = ?auto_188072 ?auto_188070 ) ) ( not ( = ?auto_188066 ?auto_188072 ) ) ( not ( = ?auto_188066 ?auto_188073 ) ) ( not ( = ?auto_188067 ?auto_188072 ) ) ( not ( = ?auto_188067 ?auto_188073 ) ) ( not ( = ?auto_188068 ?auto_188072 ) ) ( not ( = ?auto_188068 ?auto_188073 ) ) ( not ( = ?auto_188069 ?auto_188072 ) ) ( not ( = ?auto_188069 ?auto_188073 ) ) ( not ( = ?auto_188071 ?auto_188072 ) ) ( not ( = ?auto_188071 ?auto_188073 ) ) ( not ( = ?auto_188074 ?auto_188072 ) ) ( not ( = ?auto_188074 ?auto_188073 ) ) ( ON ?auto_188070 ?auto_188074 ) ( CLEAR ?auto_188070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188066 ?auto_188067 ?auto_188068 ?auto_188069 ?auto_188071 ?auto_188074 )
      ( MAKE-4PILE ?auto_188066 ?auto_188067 ?auto_188068 ?auto_188069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188075 - BLOCK
      ?auto_188076 - BLOCK
      ?auto_188077 - BLOCK
      ?auto_188078 - BLOCK
    )
    :vars
    (
      ?auto_188080 - BLOCK
      ?auto_188081 - BLOCK
      ?auto_188079 - BLOCK
      ?auto_188083 - BLOCK
      ?auto_188082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188080 ?auto_188078 ) ( ON-TABLE ?auto_188075 ) ( ON ?auto_188076 ?auto_188075 ) ( ON ?auto_188077 ?auto_188076 ) ( ON ?auto_188078 ?auto_188077 ) ( not ( = ?auto_188075 ?auto_188076 ) ) ( not ( = ?auto_188075 ?auto_188077 ) ) ( not ( = ?auto_188075 ?auto_188078 ) ) ( not ( = ?auto_188075 ?auto_188080 ) ) ( not ( = ?auto_188076 ?auto_188077 ) ) ( not ( = ?auto_188076 ?auto_188078 ) ) ( not ( = ?auto_188076 ?auto_188080 ) ) ( not ( = ?auto_188077 ?auto_188078 ) ) ( not ( = ?auto_188077 ?auto_188080 ) ) ( not ( = ?auto_188078 ?auto_188080 ) ) ( not ( = ?auto_188075 ?auto_188081 ) ) ( not ( = ?auto_188075 ?auto_188079 ) ) ( not ( = ?auto_188076 ?auto_188081 ) ) ( not ( = ?auto_188076 ?auto_188079 ) ) ( not ( = ?auto_188077 ?auto_188081 ) ) ( not ( = ?auto_188077 ?auto_188079 ) ) ( not ( = ?auto_188078 ?auto_188081 ) ) ( not ( = ?auto_188078 ?auto_188079 ) ) ( not ( = ?auto_188080 ?auto_188081 ) ) ( not ( = ?auto_188080 ?auto_188079 ) ) ( not ( = ?auto_188081 ?auto_188079 ) ) ( ON ?auto_188081 ?auto_188080 ) ( ON-TABLE ?auto_188083 ) ( not ( = ?auto_188083 ?auto_188082 ) ) ( not ( = ?auto_188083 ?auto_188079 ) ) ( not ( = ?auto_188082 ?auto_188079 ) ) ( not ( = ?auto_188075 ?auto_188082 ) ) ( not ( = ?auto_188075 ?auto_188083 ) ) ( not ( = ?auto_188076 ?auto_188082 ) ) ( not ( = ?auto_188076 ?auto_188083 ) ) ( not ( = ?auto_188077 ?auto_188082 ) ) ( not ( = ?auto_188077 ?auto_188083 ) ) ( not ( = ?auto_188078 ?auto_188082 ) ) ( not ( = ?auto_188078 ?auto_188083 ) ) ( not ( = ?auto_188080 ?auto_188082 ) ) ( not ( = ?auto_188080 ?auto_188083 ) ) ( not ( = ?auto_188081 ?auto_188082 ) ) ( not ( = ?auto_188081 ?auto_188083 ) ) ( ON ?auto_188079 ?auto_188081 ) ( CLEAR ?auto_188079 ) ( HOLDING ?auto_188082 ) ( CLEAR ?auto_188083 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188083 ?auto_188082 )
      ( MAKE-4PILE ?auto_188075 ?auto_188076 ?auto_188077 ?auto_188078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188084 - BLOCK
      ?auto_188085 - BLOCK
      ?auto_188086 - BLOCK
      ?auto_188087 - BLOCK
    )
    :vars
    (
      ?auto_188088 - BLOCK
      ?auto_188091 - BLOCK
      ?auto_188090 - BLOCK
      ?auto_188089 - BLOCK
      ?auto_188092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188088 ?auto_188087 ) ( ON-TABLE ?auto_188084 ) ( ON ?auto_188085 ?auto_188084 ) ( ON ?auto_188086 ?auto_188085 ) ( ON ?auto_188087 ?auto_188086 ) ( not ( = ?auto_188084 ?auto_188085 ) ) ( not ( = ?auto_188084 ?auto_188086 ) ) ( not ( = ?auto_188084 ?auto_188087 ) ) ( not ( = ?auto_188084 ?auto_188088 ) ) ( not ( = ?auto_188085 ?auto_188086 ) ) ( not ( = ?auto_188085 ?auto_188087 ) ) ( not ( = ?auto_188085 ?auto_188088 ) ) ( not ( = ?auto_188086 ?auto_188087 ) ) ( not ( = ?auto_188086 ?auto_188088 ) ) ( not ( = ?auto_188087 ?auto_188088 ) ) ( not ( = ?auto_188084 ?auto_188091 ) ) ( not ( = ?auto_188084 ?auto_188090 ) ) ( not ( = ?auto_188085 ?auto_188091 ) ) ( not ( = ?auto_188085 ?auto_188090 ) ) ( not ( = ?auto_188086 ?auto_188091 ) ) ( not ( = ?auto_188086 ?auto_188090 ) ) ( not ( = ?auto_188087 ?auto_188091 ) ) ( not ( = ?auto_188087 ?auto_188090 ) ) ( not ( = ?auto_188088 ?auto_188091 ) ) ( not ( = ?auto_188088 ?auto_188090 ) ) ( not ( = ?auto_188091 ?auto_188090 ) ) ( ON ?auto_188091 ?auto_188088 ) ( ON-TABLE ?auto_188089 ) ( not ( = ?auto_188089 ?auto_188092 ) ) ( not ( = ?auto_188089 ?auto_188090 ) ) ( not ( = ?auto_188092 ?auto_188090 ) ) ( not ( = ?auto_188084 ?auto_188092 ) ) ( not ( = ?auto_188084 ?auto_188089 ) ) ( not ( = ?auto_188085 ?auto_188092 ) ) ( not ( = ?auto_188085 ?auto_188089 ) ) ( not ( = ?auto_188086 ?auto_188092 ) ) ( not ( = ?auto_188086 ?auto_188089 ) ) ( not ( = ?auto_188087 ?auto_188092 ) ) ( not ( = ?auto_188087 ?auto_188089 ) ) ( not ( = ?auto_188088 ?auto_188092 ) ) ( not ( = ?auto_188088 ?auto_188089 ) ) ( not ( = ?auto_188091 ?auto_188092 ) ) ( not ( = ?auto_188091 ?auto_188089 ) ) ( ON ?auto_188090 ?auto_188091 ) ( CLEAR ?auto_188089 ) ( ON ?auto_188092 ?auto_188090 ) ( CLEAR ?auto_188092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188084 ?auto_188085 ?auto_188086 ?auto_188087 ?auto_188088 ?auto_188091 ?auto_188090 )
      ( MAKE-4PILE ?auto_188084 ?auto_188085 ?auto_188086 ?auto_188087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188093 - BLOCK
      ?auto_188094 - BLOCK
      ?auto_188095 - BLOCK
      ?auto_188096 - BLOCK
    )
    :vars
    (
      ?auto_188100 - BLOCK
      ?auto_188097 - BLOCK
      ?auto_188101 - BLOCK
      ?auto_188098 - BLOCK
      ?auto_188099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188100 ?auto_188096 ) ( ON-TABLE ?auto_188093 ) ( ON ?auto_188094 ?auto_188093 ) ( ON ?auto_188095 ?auto_188094 ) ( ON ?auto_188096 ?auto_188095 ) ( not ( = ?auto_188093 ?auto_188094 ) ) ( not ( = ?auto_188093 ?auto_188095 ) ) ( not ( = ?auto_188093 ?auto_188096 ) ) ( not ( = ?auto_188093 ?auto_188100 ) ) ( not ( = ?auto_188094 ?auto_188095 ) ) ( not ( = ?auto_188094 ?auto_188096 ) ) ( not ( = ?auto_188094 ?auto_188100 ) ) ( not ( = ?auto_188095 ?auto_188096 ) ) ( not ( = ?auto_188095 ?auto_188100 ) ) ( not ( = ?auto_188096 ?auto_188100 ) ) ( not ( = ?auto_188093 ?auto_188097 ) ) ( not ( = ?auto_188093 ?auto_188101 ) ) ( not ( = ?auto_188094 ?auto_188097 ) ) ( not ( = ?auto_188094 ?auto_188101 ) ) ( not ( = ?auto_188095 ?auto_188097 ) ) ( not ( = ?auto_188095 ?auto_188101 ) ) ( not ( = ?auto_188096 ?auto_188097 ) ) ( not ( = ?auto_188096 ?auto_188101 ) ) ( not ( = ?auto_188100 ?auto_188097 ) ) ( not ( = ?auto_188100 ?auto_188101 ) ) ( not ( = ?auto_188097 ?auto_188101 ) ) ( ON ?auto_188097 ?auto_188100 ) ( not ( = ?auto_188098 ?auto_188099 ) ) ( not ( = ?auto_188098 ?auto_188101 ) ) ( not ( = ?auto_188099 ?auto_188101 ) ) ( not ( = ?auto_188093 ?auto_188099 ) ) ( not ( = ?auto_188093 ?auto_188098 ) ) ( not ( = ?auto_188094 ?auto_188099 ) ) ( not ( = ?auto_188094 ?auto_188098 ) ) ( not ( = ?auto_188095 ?auto_188099 ) ) ( not ( = ?auto_188095 ?auto_188098 ) ) ( not ( = ?auto_188096 ?auto_188099 ) ) ( not ( = ?auto_188096 ?auto_188098 ) ) ( not ( = ?auto_188100 ?auto_188099 ) ) ( not ( = ?auto_188100 ?auto_188098 ) ) ( not ( = ?auto_188097 ?auto_188099 ) ) ( not ( = ?auto_188097 ?auto_188098 ) ) ( ON ?auto_188101 ?auto_188097 ) ( ON ?auto_188099 ?auto_188101 ) ( CLEAR ?auto_188099 ) ( HOLDING ?auto_188098 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188098 )
      ( MAKE-4PILE ?auto_188093 ?auto_188094 ?auto_188095 ?auto_188096 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188102 - BLOCK
      ?auto_188103 - BLOCK
      ?auto_188104 - BLOCK
      ?auto_188105 - BLOCK
    )
    :vars
    (
      ?auto_188110 - BLOCK
      ?auto_188108 - BLOCK
      ?auto_188106 - BLOCK
      ?auto_188109 - BLOCK
      ?auto_188107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188110 ?auto_188105 ) ( ON-TABLE ?auto_188102 ) ( ON ?auto_188103 ?auto_188102 ) ( ON ?auto_188104 ?auto_188103 ) ( ON ?auto_188105 ?auto_188104 ) ( not ( = ?auto_188102 ?auto_188103 ) ) ( not ( = ?auto_188102 ?auto_188104 ) ) ( not ( = ?auto_188102 ?auto_188105 ) ) ( not ( = ?auto_188102 ?auto_188110 ) ) ( not ( = ?auto_188103 ?auto_188104 ) ) ( not ( = ?auto_188103 ?auto_188105 ) ) ( not ( = ?auto_188103 ?auto_188110 ) ) ( not ( = ?auto_188104 ?auto_188105 ) ) ( not ( = ?auto_188104 ?auto_188110 ) ) ( not ( = ?auto_188105 ?auto_188110 ) ) ( not ( = ?auto_188102 ?auto_188108 ) ) ( not ( = ?auto_188102 ?auto_188106 ) ) ( not ( = ?auto_188103 ?auto_188108 ) ) ( not ( = ?auto_188103 ?auto_188106 ) ) ( not ( = ?auto_188104 ?auto_188108 ) ) ( not ( = ?auto_188104 ?auto_188106 ) ) ( not ( = ?auto_188105 ?auto_188108 ) ) ( not ( = ?auto_188105 ?auto_188106 ) ) ( not ( = ?auto_188110 ?auto_188108 ) ) ( not ( = ?auto_188110 ?auto_188106 ) ) ( not ( = ?auto_188108 ?auto_188106 ) ) ( ON ?auto_188108 ?auto_188110 ) ( not ( = ?auto_188109 ?auto_188107 ) ) ( not ( = ?auto_188109 ?auto_188106 ) ) ( not ( = ?auto_188107 ?auto_188106 ) ) ( not ( = ?auto_188102 ?auto_188107 ) ) ( not ( = ?auto_188102 ?auto_188109 ) ) ( not ( = ?auto_188103 ?auto_188107 ) ) ( not ( = ?auto_188103 ?auto_188109 ) ) ( not ( = ?auto_188104 ?auto_188107 ) ) ( not ( = ?auto_188104 ?auto_188109 ) ) ( not ( = ?auto_188105 ?auto_188107 ) ) ( not ( = ?auto_188105 ?auto_188109 ) ) ( not ( = ?auto_188110 ?auto_188107 ) ) ( not ( = ?auto_188110 ?auto_188109 ) ) ( not ( = ?auto_188108 ?auto_188107 ) ) ( not ( = ?auto_188108 ?auto_188109 ) ) ( ON ?auto_188106 ?auto_188108 ) ( ON ?auto_188107 ?auto_188106 ) ( ON ?auto_188109 ?auto_188107 ) ( CLEAR ?auto_188109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188102 ?auto_188103 ?auto_188104 ?auto_188105 ?auto_188110 ?auto_188108 ?auto_188106 ?auto_188107 )
      ( MAKE-4PILE ?auto_188102 ?auto_188103 ?auto_188104 ?auto_188105 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188116 - BLOCK
      ?auto_188117 - BLOCK
      ?auto_188118 - BLOCK
      ?auto_188119 - BLOCK
      ?auto_188120 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188120 ) ( CLEAR ?auto_188119 ) ( ON-TABLE ?auto_188116 ) ( ON ?auto_188117 ?auto_188116 ) ( ON ?auto_188118 ?auto_188117 ) ( ON ?auto_188119 ?auto_188118 ) ( not ( = ?auto_188116 ?auto_188117 ) ) ( not ( = ?auto_188116 ?auto_188118 ) ) ( not ( = ?auto_188116 ?auto_188119 ) ) ( not ( = ?auto_188116 ?auto_188120 ) ) ( not ( = ?auto_188117 ?auto_188118 ) ) ( not ( = ?auto_188117 ?auto_188119 ) ) ( not ( = ?auto_188117 ?auto_188120 ) ) ( not ( = ?auto_188118 ?auto_188119 ) ) ( not ( = ?auto_188118 ?auto_188120 ) ) ( not ( = ?auto_188119 ?auto_188120 ) ) )
    :subtasks
    ( ( !STACK ?auto_188120 ?auto_188119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188121 - BLOCK
      ?auto_188122 - BLOCK
      ?auto_188123 - BLOCK
      ?auto_188124 - BLOCK
      ?auto_188125 - BLOCK
    )
    :vars
    (
      ?auto_188126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188124 ) ( ON-TABLE ?auto_188121 ) ( ON ?auto_188122 ?auto_188121 ) ( ON ?auto_188123 ?auto_188122 ) ( ON ?auto_188124 ?auto_188123 ) ( not ( = ?auto_188121 ?auto_188122 ) ) ( not ( = ?auto_188121 ?auto_188123 ) ) ( not ( = ?auto_188121 ?auto_188124 ) ) ( not ( = ?auto_188121 ?auto_188125 ) ) ( not ( = ?auto_188122 ?auto_188123 ) ) ( not ( = ?auto_188122 ?auto_188124 ) ) ( not ( = ?auto_188122 ?auto_188125 ) ) ( not ( = ?auto_188123 ?auto_188124 ) ) ( not ( = ?auto_188123 ?auto_188125 ) ) ( not ( = ?auto_188124 ?auto_188125 ) ) ( ON ?auto_188125 ?auto_188126 ) ( CLEAR ?auto_188125 ) ( HAND-EMPTY ) ( not ( = ?auto_188121 ?auto_188126 ) ) ( not ( = ?auto_188122 ?auto_188126 ) ) ( not ( = ?auto_188123 ?auto_188126 ) ) ( not ( = ?auto_188124 ?auto_188126 ) ) ( not ( = ?auto_188125 ?auto_188126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188125 ?auto_188126 )
      ( MAKE-5PILE ?auto_188121 ?auto_188122 ?auto_188123 ?auto_188124 ?auto_188125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188127 - BLOCK
      ?auto_188128 - BLOCK
      ?auto_188129 - BLOCK
      ?auto_188130 - BLOCK
      ?auto_188131 - BLOCK
    )
    :vars
    (
      ?auto_188132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188127 ) ( ON ?auto_188128 ?auto_188127 ) ( ON ?auto_188129 ?auto_188128 ) ( not ( = ?auto_188127 ?auto_188128 ) ) ( not ( = ?auto_188127 ?auto_188129 ) ) ( not ( = ?auto_188127 ?auto_188130 ) ) ( not ( = ?auto_188127 ?auto_188131 ) ) ( not ( = ?auto_188128 ?auto_188129 ) ) ( not ( = ?auto_188128 ?auto_188130 ) ) ( not ( = ?auto_188128 ?auto_188131 ) ) ( not ( = ?auto_188129 ?auto_188130 ) ) ( not ( = ?auto_188129 ?auto_188131 ) ) ( not ( = ?auto_188130 ?auto_188131 ) ) ( ON ?auto_188131 ?auto_188132 ) ( CLEAR ?auto_188131 ) ( not ( = ?auto_188127 ?auto_188132 ) ) ( not ( = ?auto_188128 ?auto_188132 ) ) ( not ( = ?auto_188129 ?auto_188132 ) ) ( not ( = ?auto_188130 ?auto_188132 ) ) ( not ( = ?auto_188131 ?auto_188132 ) ) ( HOLDING ?auto_188130 ) ( CLEAR ?auto_188129 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188127 ?auto_188128 ?auto_188129 ?auto_188130 )
      ( MAKE-5PILE ?auto_188127 ?auto_188128 ?auto_188129 ?auto_188130 ?auto_188131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188133 - BLOCK
      ?auto_188134 - BLOCK
      ?auto_188135 - BLOCK
      ?auto_188136 - BLOCK
      ?auto_188137 - BLOCK
    )
    :vars
    (
      ?auto_188138 - BLOCK
      ?auto_188140 - BLOCK
      ?auto_188139 - BLOCK
      ?auto_188141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188133 ) ( ON ?auto_188134 ?auto_188133 ) ( ON ?auto_188135 ?auto_188134 ) ( not ( = ?auto_188133 ?auto_188134 ) ) ( not ( = ?auto_188133 ?auto_188135 ) ) ( not ( = ?auto_188133 ?auto_188136 ) ) ( not ( = ?auto_188133 ?auto_188137 ) ) ( not ( = ?auto_188134 ?auto_188135 ) ) ( not ( = ?auto_188134 ?auto_188136 ) ) ( not ( = ?auto_188134 ?auto_188137 ) ) ( not ( = ?auto_188135 ?auto_188136 ) ) ( not ( = ?auto_188135 ?auto_188137 ) ) ( not ( = ?auto_188136 ?auto_188137 ) ) ( ON ?auto_188137 ?auto_188138 ) ( not ( = ?auto_188133 ?auto_188138 ) ) ( not ( = ?auto_188134 ?auto_188138 ) ) ( not ( = ?auto_188135 ?auto_188138 ) ) ( not ( = ?auto_188136 ?auto_188138 ) ) ( not ( = ?auto_188137 ?auto_188138 ) ) ( CLEAR ?auto_188135 ) ( ON ?auto_188136 ?auto_188137 ) ( CLEAR ?auto_188136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188140 ) ( ON ?auto_188139 ?auto_188140 ) ( ON ?auto_188141 ?auto_188139 ) ( ON ?auto_188138 ?auto_188141 ) ( not ( = ?auto_188140 ?auto_188139 ) ) ( not ( = ?auto_188140 ?auto_188141 ) ) ( not ( = ?auto_188140 ?auto_188138 ) ) ( not ( = ?auto_188140 ?auto_188137 ) ) ( not ( = ?auto_188140 ?auto_188136 ) ) ( not ( = ?auto_188139 ?auto_188141 ) ) ( not ( = ?auto_188139 ?auto_188138 ) ) ( not ( = ?auto_188139 ?auto_188137 ) ) ( not ( = ?auto_188139 ?auto_188136 ) ) ( not ( = ?auto_188141 ?auto_188138 ) ) ( not ( = ?auto_188141 ?auto_188137 ) ) ( not ( = ?auto_188141 ?auto_188136 ) ) ( not ( = ?auto_188133 ?auto_188140 ) ) ( not ( = ?auto_188133 ?auto_188139 ) ) ( not ( = ?auto_188133 ?auto_188141 ) ) ( not ( = ?auto_188134 ?auto_188140 ) ) ( not ( = ?auto_188134 ?auto_188139 ) ) ( not ( = ?auto_188134 ?auto_188141 ) ) ( not ( = ?auto_188135 ?auto_188140 ) ) ( not ( = ?auto_188135 ?auto_188139 ) ) ( not ( = ?auto_188135 ?auto_188141 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188140 ?auto_188139 ?auto_188141 ?auto_188138 ?auto_188137 )
      ( MAKE-5PILE ?auto_188133 ?auto_188134 ?auto_188135 ?auto_188136 ?auto_188137 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188142 - BLOCK
      ?auto_188143 - BLOCK
      ?auto_188144 - BLOCK
      ?auto_188145 - BLOCK
      ?auto_188146 - BLOCK
    )
    :vars
    (
      ?auto_188147 - BLOCK
      ?auto_188149 - BLOCK
      ?auto_188148 - BLOCK
      ?auto_188150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188142 ) ( ON ?auto_188143 ?auto_188142 ) ( not ( = ?auto_188142 ?auto_188143 ) ) ( not ( = ?auto_188142 ?auto_188144 ) ) ( not ( = ?auto_188142 ?auto_188145 ) ) ( not ( = ?auto_188142 ?auto_188146 ) ) ( not ( = ?auto_188143 ?auto_188144 ) ) ( not ( = ?auto_188143 ?auto_188145 ) ) ( not ( = ?auto_188143 ?auto_188146 ) ) ( not ( = ?auto_188144 ?auto_188145 ) ) ( not ( = ?auto_188144 ?auto_188146 ) ) ( not ( = ?auto_188145 ?auto_188146 ) ) ( ON ?auto_188146 ?auto_188147 ) ( not ( = ?auto_188142 ?auto_188147 ) ) ( not ( = ?auto_188143 ?auto_188147 ) ) ( not ( = ?auto_188144 ?auto_188147 ) ) ( not ( = ?auto_188145 ?auto_188147 ) ) ( not ( = ?auto_188146 ?auto_188147 ) ) ( ON ?auto_188145 ?auto_188146 ) ( CLEAR ?auto_188145 ) ( ON-TABLE ?auto_188149 ) ( ON ?auto_188148 ?auto_188149 ) ( ON ?auto_188150 ?auto_188148 ) ( ON ?auto_188147 ?auto_188150 ) ( not ( = ?auto_188149 ?auto_188148 ) ) ( not ( = ?auto_188149 ?auto_188150 ) ) ( not ( = ?auto_188149 ?auto_188147 ) ) ( not ( = ?auto_188149 ?auto_188146 ) ) ( not ( = ?auto_188149 ?auto_188145 ) ) ( not ( = ?auto_188148 ?auto_188150 ) ) ( not ( = ?auto_188148 ?auto_188147 ) ) ( not ( = ?auto_188148 ?auto_188146 ) ) ( not ( = ?auto_188148 ?auto_188145 ) ) ( not ( = ?auto_188150 ?auto_188147 ) ) ( not ( = ?auto_188150 ?auto_188146 ) ) ( not ( = ?auto_188150 ?auto_188145 ) ) ( not ( = ?auto_188142 ?auto_188149 ) ) ( not ( = ?auto_188142 ?auto_188148 ) ) ( not ( = ?auto_188142 ?auto_188150 ) ) ( not ( = ?auto_188143 ?auto_188149 ) ) ( not ( = ?auto_188143 ?auto_188148 ) ) ( not ( = ?auto_188143 ?auto_188150 ) ) ( not ( = ?auto_188144 ?auto_188149 ) ) ( not ( = ?auto_188144 ?auto_188148 ) ) ( not ( = ?auto_188144 ?auto_188150 ) ) ( HOLDING ?auto_188144 ) ( CLEAR ?auto_188143 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188142 ?auto_188143 ?auto_188144 )
      ( MAKE-5PILE ?auto_188142 ?auto_188143 ?auto_188144 ?auto_188145 ?auto_188146 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188151 - BLOCK
      ?auto_188152 - BLOCK
      ?auto_188153 - BLOCK
      ?auto_188154 - BLOCK
      ?auto_188155 - BLOCK
    )
    :vars
    (
      ?auto_188157 - BLOCK
      ?auto_188158 - BLOCK
      ?auto_188159 - BLOCK
      ?auto_188156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188151 ) ( ON ?auto_188152 ?auto_188151 ) ( not ( = ?auto_188151 ?auto_188152 ) ) ( not ( = ?auto_188151 ?auto_188153 ) ) ( not ( = ?auto_188151 ?auto_188154 ) ) ( not ( = ?auto_188151 ?auto_188155 ) ) ( not ( = ?auto_188152 ?auto_188153 ) ) ( not ( = ?auto_188152 ?auto_188154 ) ) ( not ( = ?auto_188152 ?auto_188155 ) ) ( not ( = ?auto_188153 ?auto_188154 ) ) ( not ( = ?auto_188153 ?auto_188155 ) ) ( not ( = ?auto_188154 ?auto_188155 ) ) ( ON ?auto_188155 ?auto_188157 ) ( not ( = ?auto_188151 ?auto_188157 ) ) ( not ( = ?auto_188152 ?auto_188157 ) ) ( not ( = ?auto_188153 ?auto_188157 ) ) ( not ( = ?auto_188154 ?auto_188157 ) ) ( not ( = ?auto_188155 ?auto_188157 ) ) ( ON ?auto_188154 ?auto_188155 ) ( ON-TABLE ?auto_188158 ) ( ON ?auto_188159 ?auto_188158 ) ( ON ?auto_188156 ?auto_188159 ) ( ON ?auto_188157 ?auto_188156 ) ( not ( = ?auto_188158 ?auto_188159 ) ) ( not ( = ?auto_188158 ?auto_188156 ) ) ( not ( = ?auto_188158 ?auto_188157 ) ) ( not ( = ?auto_188158 ?auto_188155 ) ) ( not ( = ?auto_188158 ?auto_188154 ) ) ( not ( = ?auto_188159 ?auto_188156 ) ) ( not ( = ?auto_188159 ?auto_188157 ) ) ( not ( = ?auto_188159 ?auto_188155 ) ) ( not ( = ?auto_188159 ?auto_188154 ) ) ( not ( = ?auto_188156 ?auto_188157 ) ) ( not ( = ?auto_188156 ?auto_188155 ) ) ( not ( = ?auto_188156 ?auto_188154 ) ) ( not ( = ?auto_188151 ?auto_188158 ) ) ( not ( = ?auto_188151 ?auto_188159 ) ) ( not ( = ?auto_188151 ?auto_188156 ) ) ( not ( = ?auto_188152 ?auto_188158 ) ) ( not ( = ?auto_188152 ?auto_188159 ) ) ( not ( = ?auto_188152 ?auto_188156 ) ) ( not ( = ?auto_188153 ?auto_188158 ) ) ( not ( = ?auto_188153 ?auto_188159 ) ) ( not ( = ?auto_188153 ?auto_188156 ) ) ( CLEAR ?auto_188152 ) ( ON ?auto_188153 ?auto_188154 ) ( CLEAR ?auto_188153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188158 ?auto_188159 ?auto_188156 ?auto_188157 ?auto_188155 ?auto_188154 )
      ( MAKE-5PILE ?auto_188151 ?auto_188152 ?auto_188153 ?auto_188154 ?auto_188155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188160 - BLOCK
      ?auto_188161 - BLOCK
      ?auto_188162 - BLOCK
      ?auto_188163 - BLOCK
      ?auto_188164 - BLOCK
    )
    :vars
    (
      ?auto_188165 - BLOCK
      ?auto_188168 - BLOCK
      ?auto_188167 - BLOCK
      ?auto_188166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188160 ) ( not ( = ?auto_188160 ?auto_188161 ) ) ( not ( = ?auto_188160 ?auto_188162 ) ) ( not ( = ?auto_188160 ?auto_188163 ) ) ( not ( = ?auto_188160 ?auto_188164 ) ) ( not ( = ?auto_188161 ?auto_188162 ) ) ( not ( = ?auto_188161 ?auto_188163 ) ) ( not ( = ?auto_188161 ?auto_188164 ) ) ( not ( = ?auto_188162 ?auto_188163 ) ) ( not ( = ?auto_188162 ?auto_188164 ) ) ( not ( = ?auto_188163 ?auto_188164 ) ) ( ON ?auto_188164 ?auto_188165 ) ( not ( = ?auto_188160 ?auto_188165 ) ) ( not ( = ?auto_188161 ?auto_188165 ) ) ( not ( = ?auto_188162 ?auto_188165 ) ) ( not ( = ?auto_188163 ?auto_188165 ) ) ( not ( = ?auto_188164 ?auto_188165 ) ) ( ON ?auto_188163 ?auto_188164 ) ( ON-TABLE ?auto_188168 ) ( ON ?auto_188167 ?auto_188168 ) ( ON ?auto_188166 ?auto_188167 ) ( ON ?auto_188165 ?auto_188166 ) ( not ( = ?auto_188168 ?auto_188167 ) ) ( not ( = ?auto_188168 ?auto_188166 ) ) ( not ( = ?auto_188168 ?auto_188165 ) ) ( not ( = ?auto_188168 ?auto_188164 ) ) ( not ( = ?auto_188168 ?auto_188163 ) ) ( not ( = ?auto_188167 ?auto_188166 ) ) ( not ( = ?auto_188167 ?auto_188165 ) ) ( not ( = ?auto_188167 ?auto_188164 ) ) ( not ( = ?auto_188167 ?auto_188163 ) ) ( not ( = ?auto_188166 ?auto_188165 ) ) ( not ( = ?auto_188166 ?auto_188164 ) ) ( not ( = ?auto_188166 ?auto_188163 ) ) ( not ( = ?auto_188160 ?auto_188168 ) ) ( not ( = ?auto_188160 ?auto_188167 ) ) ( not ( = ?auto_188160 ?auto_188166 ) ) ( not ( = ?auto_188161 ?auto_188168 ) ) ( not ( = ?auto_188161 ?auto_188167 ) ) ( not ( = ?auto_188161 ?auto_188166 ) ) ( not ( = ?auto_188162 ?auto_188168 ) ) ( not ( = ?auto_188162 ?auto_188167 ) ) ( not ( = ?auto_188162 ?auto_188166 ) ) ( ON ?auto_188162 ?auto_188163 ) ( CLEAR ?auto_188162 ) ( HOLDING ?auto_188161 ) ( CLEAR ?auto_188160 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188160 ?auto_188161 )
      ( MAKE-5PILE ?auto_188160 ?auto_188161 ?auto_188162 ?auto_188163 ?auto_188164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188169 - BLOCK
      ?auto_188170 - BLOCK
      ?auto_188171 - BLOCK
      ?auto_188172 - BLOCK
      ?auto_188173 - BLOCK
    )
    :vars
    (
      ?auto_188174 - BLOCK
      ?auto_188176 - BLOCK
      ?auto_188175 - BLOCK
      ?auto_188177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188169 ) ( not ( = ?auto_188169 ?auto_188170 ) ) ( not ( = ?auto_188169 ?auto_188171 ) ) ( not ( = ?auto_188169 ?auto_188172 ) ) ( not ( = ?auto_188169 ?auto_188173 ) ) ( not ( = ?auto_188170 ?auto_188171 ) ) ( not ( = ?auto_188170 ?auto_188172 ) ) ( not ( = ?auto_188170 ?auto_188173 ) ) ( not ( = ?auto_188171 ?auto_188172 ) ) ( not ( = ?auto_188171 ?auto_188173 ) ) ( not ( = ?auto_188172 ?auto_188173 ) ) ( ON ?auto_188173 ?auto_188174 ) ( not ( = ?auto_188169 ?auto_188174 ) ) ( not ( = ?auto_188170 ?auto_188174 ) ) ( not ( = ?auto_188171 ?auto_188174 ) ) ( not ( = ?auto_188172 ?auto_188174 ) ) ( not ( = ?auto_188173 ?auto_188174 ) ) ( ON ?auto_188172 ?auto_188173 ) ( ON-TABLE ?auto_188176 ) ( ON ?auto_188175 ?auto_188176 ) ( ON ?auto_188177 ?auto_188175 ) ( ON ?auto_188174 ?auto_188177 ) ( not ( = ?auto_188176 ?auto_188175 ) ) ( not ( = ?auto_188176 ?auto_188177 ) ) ( not ( = ?auto_188176 ?auto_188174 ) ) ( not ( = ?auto_188176 ?auto_188173 ) ) ( not ( = ?auto_188176 ?auto_188172 ) ) ( not ( = ?auto_188175 ?auto_188177 ) ) ( not ( = ?auto_188175 ?auto_188174 ) ) ( not ( = ?auto_188175 ?auto_188173 ) ) ( not ( = ?auto_188175 ?auto_188172 ) ) ( not ( = ?auto_188177 ?auto_188174 ) ) ( not ( = ?auto_188177 ?auto_188173 ) ) ( not ( = ?auto_188177 ?auto_188172 ) ) ( not ( = ?auto_188169 ?auto_188176 ) ) ( not ( = ?auto_188169 ?auto_188175 ) ) ( not ( = ?auto_188169 ?auto_188177 ) ) ( not ( = ?auto_188170 ?auto_188176 ) ) ( not ( = ?auto_188170 ?auto_188175 ) ) ( not ( = ?auto_188170 ?auto_188177 ) ) ( not ( = ?auto_188171 ?auto_188176 ) ) ( not ( = ?auto_188171 ?auto_188175 ) ) ( not ( = ?auto_188171 ?auto_188177 ) ) ( ON ?auto_188171 ?auto_188172 ) ( CLEAR ?auto_188169 ) ( ON ?auto_188170 ?auto_188171 ) ( CLEAR ?auto_188170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188176 ?auto_188175 ?auto_188177 ?auto_188174 ?auto_188173 ?auto_188172 ?auto_188171 )
      ( MAKE-5PILE ?auto_188169 ?auto_188170 ?auto_188171 ?auto_188172 ?auto_188173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188178 - BLOCK
      ?auto_188179 - BLOCK
      ?auto_188180 - BLOCK
      ?auto_188181 - BLOCK
      ?auto_188182 - BLOCK
    )
    :vars
    (
      ?auto_188183 - BLOCK
      ?auto_188186 - BLOCK
      ?auto_188184 - BLOCK
      ?auto_188185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188178 ?auto_188179 ) ) ( not ( = ?auto_188178 ?auto_188180 ) ) ( not ( = ?auto_188178 ?auto_188181 ) ) ( not ( = ?auto_188178 ?auto_188182 ) ) ( not ( = ?auto_188179 ?auto_188180 ) ) ( not ( = ?auto_188179 ?auto_188181 ) ) ( not ( = ?auto_188179 ?auto_188182 ) ) ( not ( = ?auto_188180 ?auto_188181 ) ) ( not ( = ?auto_188180 ?auto_188182 ) ) ( not ( = ?auto_188181 ?auto_188182 ) ) ( ON ?auto_188182 ?auto_188183 ) ( not ( = ?auto_188178 ?auto_188183 ) ) ( not ( = ?auto_188179 ?auto_188183 ) ) ( not ( = ?auto_188180 ?auto_188183 ) ) ( not ( = ?auto_188181 ?auto_188183 ) ) ( not ( = ?auto_188182 ?auto_188183 ) ) ( ON ?auto_188181 ?auto_188182 ) ( ON-TABLE ?auto_188186 ) ( ON ?auto_188184 ?auto_188186 ) ( ON ?auto_188185 ?auto_188184 ) ( ON ?auto_188183 ?auto_188185 ) ( not ( = ?auto_188186 ?auto_188184 ) ) ( not ( = ?auto_188186 ?auto_188185 ) ) ( not ( = ?auto_188186 ?auto_188183 ) ) ( not ( = ?auto_188186 ?auto_188182 ) ) ( not ( = ?auto_188186 ?auto_188181 ) ) ( not ( = ?auto_188184 ?auto_188185 ) ) ( not ( = ?auto_188184 ?auto_188183 ) ) ( not ( = ?auto_188184 ?auto_188182 ) ) ( not ( = ?auto_188184 ?auto_188181 ) ) ( not ( = ?auto_188185 ?auto_188183 ) ) ( not ( = ?auto_188185 ?auto_188182 ) ) ( not ( = ?auto_188185 ?auto_188181 ) ) ( not ( = ?auto_188178 ?auto_188186 ) ) ( not ( = ?auto_188178 ?auto_188184 ) ) ( not ( = ?auto_188178 ?auto_188185 ) ) ( not ( = ?auto_188179 ?auto_188186 ) ) ( not ( = ?auto_188179 ?auto_188184 ) ) ( not ( = ?auto_188179 ?auto_188185 ) ) ( not ( = ?auto_188180 ?auto_188186 ) ) ( not ( = ?auto_188180 ?auto_188184 ) ) ( not ( = ?auto_188180 ?auto_188185 ) ) ( ON ?auto_188180 ?auto_188181 ) ( ON ?auto_188179 ?auto_188180 ) ( CLEAR ?auto_188179 ) ( HOLDING ?auto_188178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188178 )
      ( MAKE-5PILE ?auto_188178 ?auto_188179 ?auto_188180 ?auto_188181 ?auto_188182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_188187 - BLOCK
      ?auto_188188 - BLOCK
      ?auto_188189 - BLOCK
      ?auto_188190 - BLOCK
      ?auto_188191 - BLOCK
    )
    :vars
    (
      ?auto_188194 - BLOCK
      ?auto_188193 - BLOCK
      ?auto_188192 - BLOCK
      ?auto_188195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188187 ?auto_188188 ) ) ( not ( = ?auto_188187 ?auto_188189 ) ) ( not ( = ?auto_188187 ?auto_188190 ) ) ( not ( = ?auto_188187 ?auto_188191 ) ) ( not ( = ?auto_188188 ?auto_188189 ) ) ( not ( = ?auto_188188 ?auto_188190 ) ) ( not ( = ?auto_188188 ?auto_188191 ) ) ( not ( = ?auto_188189 ?auto_188190 ) ) ( not ( = ?auto_188189 ?auto_188191 ) ) ( not ( = ?auto_188190 ?auto_188191 ) ) ( ON ?auto_188191 ?auto_188194 ) ( not ( = ?auto_188187 ?auto_188194 ) ) ( not ( = ?auto_188188 ?auto_188194 ) ) ( not ( = ?auto_188189 ?auto_188194 ) ) ( not ( = ?auto_188190 ?auto_188194 ) ) ( not ( = ?auto_188191 ?auto_188194 ) ) ( ON ?auto_188190 ?auto_188191 ) ( ON-TABLE ?auto_188193 ) ( ON ?auto_188192 ?auto_188193 ) ( ON ?auto_188195 ?auto_188192 ) ( ON ?auto_188194 ?auto_188195 ) ( not ( = ?auto_188193 ?auto_188192 ) ) ( not ( = ?auto_188193 ?auto_188195 ) ) ( not ( = ?auto_188193 ?auto_188194 ) ) ( not ( = ?auto_188193 ?auto_188191 ) ) ( not ( = ?auto_188193 ?auto_188190 ) ) ( not ( = ?auto_188192 ?auto_188195 ) ) ( not ( = ?auto_188192 ?auto_188194 ) ) ( not ( = ?auto_188192 ?auto_188191 ) ) ( not ( = ?auto_188192 ?auto_188190 ) ) ( not ( = ?auto_188195 ?auto_188194 ) ) ( not ( = ?auto_188195 ?auto_188191 ) ) ( not ( = ?auto_188195 ?auto_188190 ) ) ( not ( = ?auto_188187 ?auto_188193 ) ) ( not ( = ?auto_188187 ?auto_188192 ) ) ( not ( = ?auto_188187 ?auto_188195 ) ) ( not ( = ?auto_188188 ?auto_188193 ) ) ( not ( = ?auto_188188 ?auto_188192 ) ) ( not ( = ?auto_188188 ?auto_188195 ) ) ( not ( = ?auto_188189 ?auto_188193 ) ) ( not ( = ?auto_188189 ?auto_188192 ) ) ( not ( = ?auto_188189 ?auto_188195 ) ) ( ON ?auto_188189 ?auto_188190 ) ( ON ?auto_188188 ?auto_188189 ) ( ON ?auto_188187 ?auto_188188 ) ( CLEAR ?auto_188187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188193 ?auto_188192 ?auto_188195 ?auto_188194 ?auto_188191 ?auto_188190 ?auto_188189 ?auto_188188 )
      ( MAKE-5PILE ?auto_188187 ?auto_188188 ?auto_188189 ?auto_188190 ?auto_188191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188199 - BLOCK
      ?auto_188200 - BLOCK
      ?auto_188201 - BLOCK
    )
    :vars
    (
      ?auto_188202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188202 ?auto_188201 ) ( CLEAR ?auto_188202 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188199 ) ( ON ?auto_188200 ?auto_188199 ) ( ON ?auto_188201 ?auto_188200 ) ( not ( = ?auto_188199 ?auto_188200 ) ) ( not ( = ?auto_188199 ?auto_188201 ) ) ( not ( = ?auto_188199 ?auto_188202 ) ) ( not ( = ?auto_188200 ?auto_188201 ) ) ( not ( = ?auto_188200 ?auto_188202 ) ) ( not ( = ?auto_188201 ?auto_188202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188202 ?auto_188201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188203 - BLOCK
      ?auto_188204 - BLOCK
      ?auto_188205 - BLOCK
    )
    :vars
    (
      ?auto_188206 - BLOCK
      ?auto_188207 - BLOCK
      ?auto_188208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188206 ?auto_188205 ) ( CLEAR ?auto_188206 ) ( ON-TABLE ?auto_188203 ) ( ON ?auto_188204 ?auto_188203 ) ( ON ?auto_188205 ?auto_188204 ) ( not ( = ?auto_188203 ?auto_188204 ) ) ( not ( = ?auto_188203 ?auto_188205 ) ) ( not ( = ?auto_188203 ?auto_188206 ) ) ( not ( = ?auto_188204 ?auto_188205 ) ) ( not ( = ?auto_188204 ?auto_188206 ) ) ( not ( = ?auto_188205 ?auto_188206 ) ) ( HOLDING ?auto_188207 ) ( CLEAR ?auto_188208 ) ( not ( = ?auto_188203 ?auto_188207 ) ) ( not ( = ?auto_188203 ?auto_188208 ) ) ( not ( = ?auto_188204 ?auto_188207 ) ) ( not ( = ?auto_188204 ?auto_188208 ) ) ( not ( = ?auto_188205 ?auto_188207 ) ) ( not ( = ?auto_188205 ?auto_188208 ) ) ( not ( = ?auto_188206 ?auto_188207 ) ) ( not ( = ?auto_188206 ?auto_188208 ) ) ( not ( = ?auto_188207 ?auto_188208 ) ) )
    :subtasks
    ( ( !STACK ?auto_188207 ?auto_188208 )
      ( MAKE-3PILE ?auto_188203 ?auto_188204 ?auto_188205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188209 - BLOCK
      ?auto_188210 - BLOCK
      ?auto_188211 - BLOCK
    )
    :vars
    (
      ?auto_188212 - BLOCK
      ?auto_188214 - BLOCK
      ?auto_188213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188212 ?auto_188211 ) ( ON-TABLE ?auto_188209 ) ( ON ?auto_188210 ?auto_188209 ) ( ON ?auto_188211 ?auto_188210 ) ( not ( = ?auto_188209 ?auto_188210 ) ) ( not ( = ?auto_188209 ?auto_188211 ) ) ( not ( = ?auto_188209 ?auto_188212 ) ) ( not ( = ?auto_188210 ?auto_188211 ) ) ( not ( = ?auto_188210 ?auto_188212 ) ) ( not ( = ?auto_188211 ?auto_188212 ) ) ( CLEAR ?auto_188214 ) ( not ( = ?auto_188209 ?auto_188213 ) ) ( not ( = ?auto_188209 ?auto_188214 ) ) ( not ( = ?auto_188210 ?auto_188213 ) ) ( not ( = ?auto_188210 ?auto_188214 ) ) ( not ( = ?auto_188211 ?auto_188213 ) ) ( not ( = ?auto_188211 ?auto_188214 ) ) ( not ( = ?auto_188212 ?auto_188213 ) ) ( not ( = ?auto_188212 ?auto_188214 ) ) ( not ( = ?auto_188213 ?auto_188214 ) ) ( ON ?auto_188213 ?auto_188212 ) ( CLEAR ?auto_188213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188209 ?auto_188210 ?auto_188211 ?auto_188212 )
      ( MAKE-3PILE ?auto_188209 ?auto_188210 ?auto_188211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188215 - BLOCK
      ?auto_188216 - BLOCK
      ?auto_188217 - BLOCK
    )
    :vars
    (
      ?auto_188218 - BLOCK
      ?auto_188219 - BLOCK
      ?auto_188220 - BLOCK
      ?auto_188221 - BLOCK
      ?auto_188223 - BLOCK
      ?auto_188222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188218 ?auto_188217 ) ( ON-TABLE ?auto_188215 ) ( ON ?auto_188216 ?auto_188215 ) ( ON ?auto_188217 ?auto_188216 ) ( not ( = ?auto_188215 ?auto_188216 ) ) ( not ( = ?auto_188215 ?auto_188217 ) ) ( not ( = ?auto_188215 ?auto_188218 ) ) ( not ( = ?auto_188216 ?auto_188217 ) ) ( not ( = ?auto_188216 ?auto_188218 ) ) ( not ( = ?auto_188217 ?auto_188218 ) ) ( not ( = ?auto_188215 ?auto_188219 ) ) ( not ( = ?auto_188215 ?auto_188220 ) ) ( not ( = ?auto_188216 ?auto_188219 ) ) ( not ( = ?auto_188216 ?auto_188220 ) ) ( not ( = ?auto_188217 ?auto_188219 ) ) ( not ( = ?auto_188217 ?auto_188220 ) ) ( not ( = ?auto_188218 ?auto_188219 ) ) ( not ( = ?auto_188218 ?auto_188220 ) ) ( not ( = ?auto_188219 ?auto_188220 ) ) ( ON ?auto_188219 ?auto_188218 ) ( CLEAR ?auto_188219 ) ( HOLDING ?auto_188220 ) ( CLEAR ?auto_188221 ) ( ON-TABLE ?auto_188223 ) ( ON ?auto_188222 ?auto_188223 ) ( ON ?auto_188221 ?auto_188222 ) ( not ( = ?auto_188223 ?auto_188222 ) ) ( not ( = ?auto_188223 ?auto_188221 ) ) ( not ( = ?auto_188223 ?auto_188220 ) ) ( not ( = ?auto_188222 ?auto_188221 ) ) ( not ( = ?auto_188222 ?auto_188220 ) ) ( not ( = ?auto_188221 ?auto_188220 ) ) ( not ( = ?auto_188215 ?auto_188221 ) ) ( not ( = ?auto_188215 ?auto_188223 ) ) ( not ( = ?auto_188215 ?auto_188222 ) ) ( not ( = ?auto_188216 ?auto_188221 ) ) ( not ( = ?auto_188216 ?auto_188223 ) ) ( not ( = ?auto_188216 ?auto_188222 ) ) ( not ( = ?auto_188217 ?auto_188221 ) ) ( not ( = ?auto_188217 ?auto_188223 ) ) ( not ( = ?auto_188217 ?auto_188222 ) ) ( not ( = ?auto_188218 ?auto_188221 ) ) ( not ( = ?auto_188218 ?auto_188223 ) ) ( not ( = ?auto_188218 ?auto_188222 ) ) ( not ( = ?auto_188219 ?auto_188221 ) ) ( not ( = ?auto_188219 ?auto_188223 ) ) ( not ( = ?auto_188219 ?auto_188222 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188223 ?auto_188222 ?auto_188221 ?auto_188220 )
      ( MAKE-3PILE ?auto_188215 ?auto_188216 ?auto_188217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188224 - BLOCK
      ?auto_188225 - BLOCK
      ?auto_188226 - BLOCK
    )
    :vars
    (
      ?auto_188231 - BLOCK
      ?auto_188230 - BLOCK
      ?auto_188229 - BLOCK
      ?auto_188232 - BLOCK
      ?auto_188228 - BLOCK
      ?auto_188227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188231 ?auto_188226 ) ( ON-TABLE ?auto_188224 ) ( ON ?auto_188225 ?auto_188224 ) ( ON ?auto_188226 ?auto_188225 ) ( not ( = ?auto_188224 ?auto_188225 ) ) ( not ( = ?auto_188224 ?auto_188226 ) ) ( not ( = ?auto_188224 ?auto_188231 ) ) ( not ( = ?auto_188225 ?auto_188226 ) ) ( not ( = ?auto_188225 ?auto_188231 ) ) ( not ( = ?auto_188226 ?auto_188231 ) ) ( not ( = ?auto_188224 ?auto_188230 ) ) ( not ( = ?auto_188224 ?auto_188229 ) ) ( not ( = ?auto_188225 ?auto_188230 ) ) ( not ( = ?auto_188225 ?auto_188229 ) ) ( not ( = ?auto_188226 ?auto_188230 ) ) ( not ( = ?auto_188226 ?auto_188229 ) ) ( not ( = ?auto_188231 ?auto_188230 ) ) ( not ( = ?auto_188231 ?auto_188229 ) ) ( not ( = ?auto_188230 ?auto_188229 ) ) ( ON ?auto_188230 ?auto_188231 ) ( CLEAR ?auto_188232 ) ( ON-TABLE ?auto_188228 ) ( ON ?auto_188227 ?auto_188228 ) ( ON ?auto_188232 ?auto_188227 ) ( not ( = ?auto_188228 ?auto_188227 ) ) ( not ( = ?auto_188228 ?auto_188232 ) ) ( not ( = ?auto_188228 ?auto_188229 ) ) ( not ( = ?auto_188227 ?auto_188232 ) ) ( not ( = ?auto_188227 ?auto_188229 ) ) ( not ( = ?auto_188232 ?auto_188229 ) ) ( not ( = ?auto_188224 ?auto_188232 ) ) ( not ( = ?auto_188224 ?auto_188228 ) ) ( not ( = ?auto_188224 ?auto_188227 ) ) ( not ( = ?auto_188225 ?auto_188232 ) ) ( not ( = ?auto_188225 ?auto_188228 ) ) ( not ( = ?auto_188225 ?auto_188227 ) ) ( not ( = ?auto_188226 ?auto_188232 ) ) ( not ( = ?auto_188226 ?auto_188228 ) ) ( not ( = ?auto_188226 ?auto_188227 ) ) ( not ( = ?auto_188231 ?auto_188232 ) ) ( not ( = ?auto_188231 ?auto_188228 ) ) ( not ( = ?auto_188231 ?auto_188227 ) ) ( not ( = ?auto_188230 ?auto_188232 ) ) ( not ( = ?auto_188230 ?auto_188228 ) ) ( not ( = ?auto_188230 ?auto_188227 ) ) ( ON ?auto_188229 ?auto_188230 ) ( CLEAR ?auto_188229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188224 ?auto_188225 ?auto_188226 ?auto_188231 ?auto_188230 )
      ( MAKE-3PILE ?auto_188224 ?auto_188225 ?auto_188226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188233 - BLOCK
      ?auto_188234 - BLOCK
      ?auto_188235 - BLOCK
    )
    :vars
    (
      ?auto_188239 - BLOCK
      ?auto_188238 - BLOCK
      ?auto_188240 - BLOCK
      ?auto_188241 - BLOCK
      ?auto_188236 - BLOCK
      ?auto_188237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188239 ?auto_188235 ) ( ON-TABLE ?auto_188233 ) ( ON ?auto_188234 ?auto_188233 ) ( ON ?auto_188235 ?auto_188234 ) ( not ( = ?auto_188233 ?auto_188234 ) ) ( not ( = ?auto_188233 ?auto_188235 ) ) ( not ( = ?auto_188233 ?auto_188239 ) ) ( not ( = ?auto_188234 ?auto_188235 ) ) ( not ( = ?auto_188234 ?auto_188239 ) ) ( not ( = ?auto_188235 ?auto_188239 ) ) ( not ( = ?auto_188233 ?auto_188238 ) ) ( not ( = ?auto_188233 ?auto_188240 ) ) ( not ( = ?auto_188234 ?auto_188238 ) ) ( not ( = ?auto_188234 ?auto_188240 ) ) ( not ( = ?auto_188235 ?auto_188238 ) ) ( not ( = ?auto_188235 ?auto_188240 ) ) ( not ( = ?auto_188239 ?auto_188238 ) ) ( not ( = ?auto_188239 ?auto_188240 ) ) ( not ( = ?auto_188238 ?auto_188240 ) ) ( ON ?auto_188238 ?auto_188239 ) ( ON-TABLE ?auto_188241 ) ( ON ?auto_188236 ?auto_188241 ) ( not ( = ?auto_188241 ?auto_188236 ) ) ( not ( = ?auto_188241 ?auto_188237 ) ) ( not ( = ?auto_188241 ?auto_188240 ) ) ( not ( = ?auto_188236 ?auto_188237 ) ) ( not ( = ?auto_188236 ?auto_188240 ) ) ( not ( = ?auto_188237 ?auto_188240 ) ) ( not ( = ?auto_188233 ?auto_188237 ) ) ( not ( = ?auto_188233 ?auto_188241 ) ) ( not ( = ?auto_188233 ?auto_188236 ) ) ( not ( = ?auto_188234 ?auto_188237 ) ) ( not ( = ?auto_188234 ?auto_188241 ) ) ( not ( = ?auto_188234 ?auto_188236 ) ) ( not ( = ?auto_188235 ?auto_188237 ) ) ( not ( = ?auto_188235 ?auto_188241 ) ) ( not ( = ?auto_188235 ?auto_188236 ) ) ( not ( = ?auto_188239 ?auto_188237 ) ) ( not ( = ?auto_188239 ?auto_188241 ) ) ( not ( = ?auto_188239 ?auto_188236 ) ) ( not ( = ?auto_188238 ?auto_188237 ) ) ( not ( = ?auto_188238 ?auto_188241 ) ) ( not ( = ?auto_188238 ?auto_188236 ) ) ( ON ?auto_188240 ?auto_188238 ) ( CLEAR ?auto_188240 ) ( HOLDING ?auto_188237 ) ( CLEAR ?auto_188236 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188241 ?auto_188236 ?auto_188237 )
      ( MAKE-3PILE ?auto_188233 ?auto_188234 ?auto_188235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188242 - BLOCK
      ?auto_188243 - BLOCK
      ?auto_188244 - BLOCK
    )
    :vars
    (
      ?auto_188249 - BLOCK
      ?auto_188248 - BLOCK
      ?auto_188247 - BLOCK
      ?auto_188246 - BLOCK
      ?auto_188250 - BLOCK
      ?auto_188245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188249 ?auto_188244 ) ( ON-TABLE ?auto_188242 ) ( ON ?auto_188243 ?auto_188242 ) ( ON ?auto_188244 ?auto_188243 ) ( not ( = ?auto_188242 ?auto_188243 ) ) ( not ( = ?auto_188242 ?auto_188244 ) ) ( not ( = ?auto_188242 ?auto_188249 ) ) ( not ( = ?auto_188243 ?auto_188244 ) ) ( not ( = ?auto_188243 ?auto_188249 ) ) ( not ( = ?auto_188244 ?auto_188249 ) ) ( not ( = ?auto_188242 ?auto_188248 ) ) ( not ( = ?auto_188242 ?auto_188247 ) ) ( not ( = ?auto_188243 ?auto_188248 ) ) ( not ( = ?auto_188243 ?auto_188247 ) ) ( not ( = ?auto_188244 ?auto_188248 ) ) ( not ( = ?auto_188244 ?auto_188247 ) ) ( not ( = ?auto_188249 ?auto_188248 ) ) ( not ( = ?auto_188249 ?auto_188247 ) ) ( not ( = ?auto_188248 ?auto_188247 ) ) ( ON ?auto_188248 ?auto_188249 ) ( ON-TABLE ?auto_188246 ) ( ON ?auto_188250 ?auto_188246 ) ( not ( = ?auto_188246 ?auto_188250 ) ) ( not ( = ?auto_188246 ?auto_188245 ) ) ( not ( = ?auto_188246 ?auto_188247 ) ) ( not ( = ?auto_188250 ?auto_188245 ) ) ( not ( = ?auto_188250 ?auto_188247 ) ) ( not ( = ?auto_188245 ?auto_188247 ) ) ( not ( = ?auto_188242 ?auto_188245 ) ) ( not ( = ?auto_188242 ?auto_188246 ) ) ( not ( = ?auto_188242 ?auto_188250 ) ) ( not ( = ?auto_188243 ?auto_188245 ) ) ( not ( = ?auto_188243 ?auto_188246 ) ) ( not ( = ?auto_188243 ?auto_188250 ) ) ( not ( = ?auto_188244 ?auto_188245 ) ) ( not ( = ?auto_188244 ?auto_188246 ) ) ( not ( = ?auto_188244 ?auto_188250 ) ) ( not ( = ?auto_188249 ?auto_188245 ) ) ( not ( = ?auto_188249 ?auto_188246 ) ) ( not ( = ?auto_188249 ?auto_188250 ) ) ( not ( = ?auto_188248 ?auto_188245 ) ) ( not ( = ?auto_188248 ?auto_188246 ) ) ( not ( = ?auto_188248 ?auto_188250 ) ) ( ON ?auto_188247 ?auto_188248 ) ( CLEAR ?auto_188250 ) ( ON ?auto_188245 ?auto_188247 ) ( CLEAR ?auto_188245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188242 ?auto_188243 ?auto_188244 ?auto_188249 ?auto_188248 ?auto_188247 )
      ( MAKE-3PILE ?auto_188242 ?auto_188243 ?auto_188244 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188251 - BLOCK
      ?auto_188252 - BLOCK
      ?auto_188253 - BLOCK
    )
    :vars
    (
      ?auto_188258 - BLOCK
      ?auto_188254 - BLOCK
      ?auto_188256 - BLOCK
      ?auto_188259 - BLOCK
      ?auto_188255 - BLOCK
      ?auto_188257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188258 ?auto_188253 ) ( ON-TABLE ?auto_188251 ) ( ON ?auto_188252 ?auto_188251 ) ( ON ?auto_188253 ?auto_188252 ) ( not ( = ?auto_188251 ?auto_188252 ) ) ( not ( = ?auto_188251 ?auto_188253 ) ) ( not ( = ?auto_188251 ?auto_188258 ) ) ( not ( = ?auto_188252 ?auto_188253 ) ) ( not ( = ?auto_188252 ?auto_188258 ) ) ( not ( = ?auto_188253 ?auto_188258 ) ) ( not ( = ?auto_188251 ?auto_188254 ) ) ( not ( = ?auto_188251 ?auto_188256 ) ) ( not ( = ?auto_188252 ?auto_188254 ) ) ( not ( = ?auto_188252 ?auto_188256 ) ) ( not ( = ?auto_188253 ?auto_188254 ) ) ( not ( = ?auto_188253 ?auto_188256 ) ) ( not ( = ?auto_188258 ?auto_188254 ) ) ( not ( = ?auto_188258 ?auto_188256 ) ) ( not ( = ?auto_188254 ?auto_188256 ) ) ( ON ?auto_188254 ?auto_188258 ) ( ON-TABLE ?auto_188259 ) ( not ( = ?auto_188259 ?auto_188255 ) ) ( not ( = ?auto_188259 ?auto_188257 ) ) ( not ( = ?auto_188259 ?auto_188256 ) ) ( not ( = ?auto_188255 ?auto_188257 ) ) ( not ( = ?auto_188255 ?auto_188256 ) ) ( not ( = ?auto_188257 ?auto_188256 ) ) ( not ( = ?auto_188251 ?auto_188257 ) ) ( not ( = ?auto_188251 ?auto_188259 ) ) ( not ( = ?auto_188251 ?auto_188255 ) ) ( not ( = ?auto_188252 ?auto_188257 ) ) ( not ( = ?auto_188252 ?auto_188259 ) ) ( not ( = ?auto_188252 ?auto_188255 ) ) ( not ( = ?auto_188253 ?auto_188257 ) ) ( not ( = ?auto_188253 ?auto_188259 ) ) ( not ( = ?auto_188253 ?auto_188255 ) ) ( not ( = ?auto_188258 ?auto_188257 ) ) ( not ( = ?auto_188258 ?auto_188259 ) ) ( not ( = ?auto_188258 ?auto_188255 ) ) ( not ( = ?auto_188254 ?auto_188257 ) ) ( not ( = ?auto_188254 ?auto_188259 ) ) ( not ( = ?auto_188254 ?auto_188255 ) ) ( ON ?auto_188256 ?auto_188254 ) ( ON ?auto_188257 ?auto_188256 ) ( CLEAR ?auto_188257 ) ( HOLDING ?auto_188255 ) ( CLEAR ?auto_188259 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188259 ?auto_188255 )
      ( MAKE-3PILE ?auto_188251 ?auto_188252 ?auto_188253 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188260 - BLOCK
      ?auto_188261 - BLOCK
      ?auto_188262 - BLOCK
    )
    :vars
    (
      ?auto_188263 - BLOCK
      ?auto_188266 - BLOCK
      ?auto_188265 - BLOCK
      ?auto_188264 - BLOCK
      ?auto_188267 - BLOCK
      ?auto_188268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188263 ?auto_188262 ) ( ON-TABLE ?auto_188260 ) ( ON ?auto_188261 ?auto_188260 ) ( ON ?auto_188262 ?auto_188261 ) ( not ( = ?auto_188260 ?auto_188261 ) ) ( not ( = ?auto_188260 ?auto_188262 ) ) ( not ( = ?auto_188260 ?auto_188263 ) ) ( not ( = ?auto_188261 ?auto_188262 ) ) ( not ( = ?auto_188261 ?auto_188263 ) ) ( not ( = ?auto_188262 ?auto_188263 ) ) ( not ( = ?auto_188260 ?auto_188266 ) ) ( not ( = ?auto_188260 ?auto_188265 ) ) ( not ( = ?auto_188261 ?auto_188266 ) ) ( not ( = ?auto_188261 ?auto_188265 ) ) ( not ( = ?auto_188262 ?auto_188266 ) ) ( not ( = ?auto_188262 ?auto_188265 ) ) ( not ( = ?auto_188263 ?auto_188266 ) ) ( not ( = ?auto_188263 ?auto_188265 ) ) ( not ( = ?auto_188266 ?auto_188265 ) ) ( ON ?auto_188266 ?auto_188263 ) ( ON-TABLE ?auto_188264 ) ( not ( = ?auto_188264 ?auto_188267 ) ) ( not ( = ?auto_188264 ?auto_188268 ) ) ( not ( = ?auto_188264 ?auto_188265 ) ) ( not ( = ?auto_188267 ?auto_188268 ) ) ( not ( = ?auto_188267 ?auto_188265 ) ) ( not ( = ?auto_188268 ?auto_188265 ) ) ( not ( = ?auto_188260 ?auto_188268 ) ) ( not ( = ?auto_188260 ?auto_188264 ) ) ( not ( = ?auto_188260 ?auto_188267 ) ) ( not ( = ?auto_188261 ?auto_188268 ) ) ( not ( = ?auto_188261 ?auto_188264 ) ) ( not ( = ?auto_188261 ?auto_188267 ) ) ( not ( = ?auto_188262 ?auto_188268 ) ) ( not ( = ?auto_188262 ?auto_188264 ) ) ( not ( = ?auto_188262 ?auto_188267 ) ) ( not ( = ?auto_188263 ?auto_188268 ) ) ( not ( = ?auto_188263 ?auto_188264 ) ) ( not ( = ?auto_188263 ?auto_188267 ) ) ( not ( = ?auto_188266 ?auto_188268 ) ) ( not ( = ?auto_188266 ?auto_188264 ) ) ( not ( = ?auto_188266 ?auto_188267 ) ) ( ON ?auto_188265 ?auto_188266 ) ( ON ?auto_188268 ?auto_188265 ) ( CLEAR ?auto_188264 ) ( ON ?auto_188267 ?auto_188268 ) ( CLEAR ?auto_188267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188260 ?auto_188261 ?auto_188262 ?auto_188263 ?auto_188266 ?auto_188265 ?auto_188268 )
      ( MAKE-3PILE ?auto_188260 ?auto_188261 ?auto_188262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188269 - BLOCK
      ?auto_188270 - BLOCK
      ?auto_188271 - BLOCK
    )
    :vars
    (
      ?auto_188276 - BLOCK
      ?auto_188273 - BLOCK
      ?auto_188275 - BLOCK
      ?auto_188277 - BLOCK
      ?auto_188272 - BLOCK
      ?auto_188274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188276 ?auto_188271 ) ( ON-TABLE ?auto_188269 ) ( ON ?auto_188270 ?auto_188269 ) ( ON ?auto_188271 ?auto_188270 ) ( not ( = ?auto_188269 ?auto_188270 ) ) ( not ( = ?auto_188269 ?auto_188271 ) ) ( not ( = ?auto_188269 ?auto_188276 ) ) ( not ( = ?auto_188270 ?auto_188271 ) ) ( not ( = ?auto_188270 ?auto_188276 ) ) ( not ( = ?auto_188271 ?auto_188276 ) ) ( not ( = ?auto_188269 ?auto_188273 ) ) ( not ( = ?auto_188269 ?auto_188275 ) ) ( not ( = ?auto_188270 ?auto_188273 ) ) ( not ( = ?auto_188270 ?auto_188275 ) ) ( not ( = ?auto_188271 ?auto_188273 ) ) ( not ( = ?auto_188271 ?auto_188275 ) ) ( not ( = ?auto_188276 ?auto_188273 ) ) ( not ( = ?auto_188276 ?auto_188275 ) ) ( not ( = ?auto_188273 ?auto_188275 ) ) ( ON ?auto_188273 ?auto_188276 ) ( not ( = ?auto_188277 ?auto_188272 ) ) ( not ( = ?auto_188277 ?auto_188274 ) ) ( not ( = ?auto_188277 ?auto_188275 ) ) ( not ( = ?auto_188272 ?auto_188274 ) ) ( not ( = ?auto_188272 ?auto_188275 ) ) ( not ( = ?auto_188274 ?auto_188275 ) ) ( not ( = ?auto_188269 ?auto_188274 ) ) ( not ( = ?auto_188269 ?auto_188277 ) ) ( not ( = ?auto_188269 ?auto_188272 ) ) ( not ( = ?auto_188270 ?auto_188274 ) ) ( not ( = ?auto_188270 ?auto_188277 ) ) ( not ( = ?auto_188270 ?auto_188272 ) ) ( not ( = ?auto_188271 ?auto_188274 ) ) ( not ( = ?auto_188271 ?auto_188277 ) ) ( not ( = ?auto_188271 ?auto_188272 ) ) ( not ( = ?auto_188276 ?auto_188274 ) ) ( not ( = ?auto_188276 ?auto_188277 ) ) ( not ( = ?auto_188276 ?auto_188272 ) ) ( not ( = ?auto_188273 ?auto_188274 ) ) ( not ( = ?auto_188273 ?auto_188277 ) ) ( not ( = ?auto_188273 ?auto_188272 ) ) ( ON ?auto_188275 ?auto_188273 ) ( ON ?auto_188274 ?auto_188275 ) ( ON ?auto_188272 ?auto_188274 ) ( CLEAR ?auto_188272 ) ( HOLDING ?auto_188277 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188277 )
      ( MAKE-3PILE ?auto_188269 ?auto_188270 ?auto_188271 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188278 - BLOCK
      ?auto_188279 - BLOCK
      ?auto_188280 - BLOCK
    )
    :vars
    (
      ?auto_188284 - BLOCK
      ?auto_188283 - BLOCK
      ?auto_188285 - BLOCK
      ?auto_188282 - BLOCK
      ?auto_188281 - BLOCK
      ?auto_188286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188284 ?auto_188280 ) ( ON-TABLE ?auto_188278 ) ( ON ?auto_188279 ?auto_188278 ) ( ON ?auto_188280 ?auto_188279 ) ( not ( = ?auto_188278 ?auto_188279 ) ) ( not ( = ?auto_188278 ?auto_188280 ) ) ( not ( = ?auto_188278 ?auto_188284 ) ) ( not ( = ?auto_188279 ?auto_188280 ) ) ( not ( = ?auto_188279 ?auto_188284 ) ) ( not ( = ?auto_188280 ?auto_188284 ) ) ( not ( = ?auto_188278 ?auto_188283 ) ) ( not ( = ?auto_188278 ?auto_188285 ) ) ( not ( = ?auto_188279 ?auto_188283 ) ) ( not ( = ?auto_188279 ?auto_188285 ) ) ( not ( = ?auto_188280 ?auto_188283 ) ) ( not ( = ?auto_188280 ?auto_188285 ) ) ( not ( = ?auto_188284 ?auto_188283 ) ) ( not ( = ?auto_188284 ?auto_188285 ) ) ( not ( = ?auto_188283 ?auto_188285 ) ) ( ON ?auto_188283 ?auto_188284 ) ( not ( = ?auto_188282 ?auto_188281 ) ) ( not ( = ?auto_188282 ?auto_188286 ) ) ( not ( = ?auto_188282 ?auto_188285 ) ) ( not ( = ?auto_188281 ?auto_188286 ) ) ( not ( = ?auto_188281 ?auto_188285 ) ) ( not ( = ?auto_188286 ?auto_188285 ) ) ( not ( = ?auto_188278 ?auto_188286 ) ) ( not ( = ?auto_188278 ?auto_188282 ) ) ( not ( = ?auto_188278 ?auto_188281 ) ) ( not ( = ?auto_188279 ?auto_188286 ) ) ( not ( = ?auto_188279 ?auto_188282 ) ) ( not ( = ?auto_188279 ?auto_188281 ) ) ( not ( = ?auto_188280 ?auto_188286 ) ) ( not ( = ?auto_188280 ?auto_188282 ) ) ( not ( = ?auto_188280 ?auto_188281 ) ) ( not ( = ?auto_188284 ?auto_188286 ) ) ( not ( = ?auto_188284 ?auto_188282 ) ) ( not ( = ?auto_188284 ?auto_188281 ) ) ( not ( = ?auto_188283 ?auto_188286 ) ) ( not ( = ?auto_188283 ?auto_188282 ) ) ( not ( = ?auto_188283 ?auto_188281 ) ) ( ON ?auto_188285 ?auto_188283 ) ( ON ?auto_188286 ?auto_188285 ) ( ON ?auto_188281 ?auto_188286 ) ( ON ?auto_188282 ?auto_188281 ) ( CLEAR ?auto_188282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188278 ?auto_188279 ?auto_188280 ?auto_188284 ?auto_188283 ?auto_188285 ?auto_188286 ?auto_188281 )
      ( MAKE-3PILE ?auto_188278 ?auto_188279 ?auto_188280 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188293 - BLOCK
      ?auto_188294 - BLOCK
      ?auto_188295 - BLOCK
      ?auto_188296 - BLOCK
      ?auto_188297 - BLOCK
      ?auto_188298 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188298 ) ( CLEAR ?auto_188297 ) ( ON-TABLE ?auto_188293 ) ( ON ?auto_188294 ?auto_188293 ) ( ON ?auto_188295 ?auto_188294 ) ( ON ?auto_188296 ?auto_188295 ) ( ON ?auto_188297 ?auto_188296 ) ( not ( = ?auto_188293 ?auto_188294 ) ) ( not ( = ?auto_188293 ?auto_188295 ) ) ( not ( = ?auto_188293 ?auto_188296 ) ) ( not ( = ?auto_188293 ?auto_188297 ) ) ( not ( = ?auto_188293 ?auto_188298 ) ) ( not ( = ?auto_188294 ?auto_188295 ) ) ( not ( = ?auto_188294 ?auto_188296 ) ) ( not ( = ?auto_188294 ?auto_188297 ) ) ( not ( = ?auto_188294 ?auto_188298 ) ) ( not ( = ?auto_188295 ?auto_188296 ) ) ( not ( = ?auto_188295 ?auto_188297 ) ) ( not ( = ?auto_188295 ?auto_188298 ) ) ( not ( = ?auto_188296 ?auto_188297 ) ) ( not ( = ?auto_188296 ?auto_188298 ) ) ( not ( = ?auto_188297 ?auto_188298 ) ) )
    :subtasks
    ( ( !STACK ?auto_188298 ?auto_188297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188299 - BLOCK
      ?auto_188300 - BLOCK
      ?auto_188301 - BLOCK
      ?auto_188302 - BLOCK
      ?auto_188303 - BLOCK
      ?auto_188304 - BLOCK
    )
    :vars
    (
      ?auto_188305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188303 ) ( ON-TABLE ?auto_188299 ) ( ON ?auto_188300 ?auto_188299 ) ( ON ?auto_188301 ?auto_188300 ) ( ON ?auto_188302 ?auto_188301 ) ( ON ?auto_188303 ?auto_188302 ) ( not ( = ?auto_188299 ?auto_188300 ) ) ( not ( = ?auto_188299 ?auto_188301 ) ) ( not ( = ?auto_188299 ?auto_188302 ) ) ( not ( = ?auto_188299 ?auto_188303 ) ) ( not ( = ?auto_188299 ?auto_188304 ) ) ( not ( = ?auto_188300 ?auto_188301 ) ) ( not ( = ?auto_188300 ?auto_188302 ) ) ( not ( = ?auto_188300 ?auto_188303 ) ) ( not ( = ?auto_188300 ?auto_188304 ) ) ( not ( = ?auto_188301 ?auto_188302 ) ) ( not ( = ?auto_188301 ?auto_188303 ) ) ( not ( = ?auto_188301 ?auto_188304 ) ) ( not ( = ?auto_188302 ?auto_188303 ) ) ( not ( = ?auto_188302 ?auto_188304 ) ) ( not ( = ?auto_188303 ?auto_188304 ) ) ( ON ?auto_188304 ?auto_188305 ) ( CLEAR ?auto_188304 ) ( HAND-EMPTY ) ( not ( = ?auto_188299 ?auto_188305 ) ) ( not ( = ?auto_188300 ?auto_188305 ) ) ( not ( = ?auto_188301 ?auto_188305 ) ) ( not ( = ?auto_188302 ?auto_188305 ) ) ( not ( = ?auto_188303 ?auto_188305 ) ) ( not ( = ?auto_188304 ?auto_188305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188304 ?auto_188305 )
      ( MAKE-6PILE ?auto_188299 ?auto_188300 ?auto_188301 ?auto_188302 ?auto_188303 ?auto_188304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188306 - BLOCK
      ?auto_188307 - BLOCK
      ?auto_188308 - BLOCK
      ?auto_188309 - BLOCK
      ?auto_188310 - BLOCK
      ?auto_188311 - BLOCK
    )
    :vars
    (
      ?auto_188312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188306 ) ( ON ?auto_188307 ?auto_188306 ) ( ON ?auto_188308 ?auto_188307 ) ( ON ?auto_188309 ?auto_188308 ) ( not ( = ?auto_188306 ?auto_188307 ) ) ( not ( = ?auto_188306 ?auto_188308 ) ) ( not ( = ?auto_188306 ?auto_188309 ) ) ( not ( = ?auto_188306 ?auto_188310 ) ) ( not ( = ?auto_188306 ?auto_188311 ) ) ( not ( = ?auto_188307 ?auto_188308 ) ) ( not ( = ?auto_188307 ?auto_188309 ) ) ( not ( = ?auto_188307 ?auto_188310 ) ) ( not ( = ?auto_188307 ?auto_188311 ) ) ( not ( = ?auto_188308 ?auto_188309 ) ) ( not ( = ?auto_188308 ?auto_188310 ) ) ( not ( = ?auto_188308 ?auto_188311 ) ) ( not ( = ?auto_188309 ?auto_188310 ) ) ( not ( = ?auto_188309 ?auto_188311 ) ) ( not ( = ?auto_188310 ?auto_188311 ) ) ( ON ?auto_188311 ?auto_188312 ) ( CLEAR ?auto_188311 ) ( not ( = ?auto_188306 ?auto_188312 ) ) ( not ( = ?auto_188307 ?auto_188312 ) ) ( not ( = ?auto_188308 ?auto_188312 ) ) ( not ( = ?auto_188309 ?auto_188312 ) ) ( not ( = ?auto_188310 ?auto_188312 ) ) ( not ( = ?auto_188311 ?auto_188312 ) ) ( HOLDING ?auto_188310 ) ( CLEAR ?auto_188309 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188306 ?auto_188307 ?auto_188308 ?auto_188309 ?auto_188310 )
      ( MAKE-6PILE ?auto_188306 ?auto_188307 ?auto_188308 ?auto_188309 ?auto_188310 ?auto_188311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188313 - BLOCK
      ?auto_188314 - BLOCK
      ?auto_188315 - BLOCK
      ?auto_188316 - BLOCK
      ?auto_188317 - BLOCK
      ?auto_188318 - BLOCK
    )
    :vars
    (
      ?auto_188319 - BLOCK
      ?auto_188321 - BLOCK
      ?auto_188320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188313 ) ( ON ?auto_188314 ?auto_188313 ) ( ON ?auto_188315 ?auto_188314 ) ( ON ?auto_188316 ?auto_188315 ) ( not ( = ?auto_188313 ?auto_188314 ) ) ( not ( = ?auto_188313 ?auto_188315 ) ) ( not ( = ?auto_188313 ?auto_188316 ) ) ( not ( = ?auto_188313 ?auto_188317 ) ) ( not ( = ?auto_188313 ?auto_188318 ) ) ( not ( = ?auto_188314 ?auto_188315 ) ) ( not ( = ?auto_188314 ?auto_188316 ) ) ( not ( = ?auto_188314 ?auto_188317 ) ) ( not ( = ?auto_188314 ?auto_188318 ) ) ( not ( = ?auto_188315 ?auto_188316 ) ) ( not ( = ?auto_188315 ?auto_188317 ) ) ( not ( = ?auto_188315 ?auto_188318 ) ) ( not ( = ?auto_188316 ?auto_188317 ) ) ( not ( = ?auto_188316 ?auto_188318 ) ) ( not ( = ?auto_188317 ?auto_188318 ) ) ( ON ?auto_188318 ?auto_188319 ) ( not ( = ?auto_188313 ?auto_188319 ) ) ( not ( = ?auto_188314 ?auto_188319 ) ) ( not ( = ?auto_188315 ?auto_188319 ) ) ( not ( = ?auto_188316 ?auto_188319 ) ) ( not ( = ?auto_188317 ?auto_188319 ) ) ( not ( = ?auto_188318 ?auto_188319 ) ) ( CLEAR ?auto_188316 ) ( ON ?auto_188317 ?auto_188318 ) ( CLEAR ?auto_188317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188321 ) ( ON ?auto_188320 ?auto_188321 ) ( ON ?auto_188319 ?auto_188320 ) ( not ( = ?auto_188321 ?auto_188320 ) ) ( not ( = ?auto_188321 ?auto_188319 ) ) ( not ( = ?auto_188321 ?auto_188318 ) ) ( not ( = ?auto_188321 ?auto_188317 ) ) ( not ( = ?auto_188320 ?auto_188319 ) ) ( not ( = ?auto_188320 ?auto_188318 ) ) ( not ( = ?auto_188320 ?auto_188317 ) ) ( not ( = ?auto_188313 ?auto_188321 ) ) ( not ( = ?auto_188313 ?auto_188320 ) ) ( not ( = ?auto_188314 ?auto_188321 ) ) ( not ( = ?auto_188314 ?auto_188320 ) ) ( not ( = ?auto_188315 ?auto_188321 ) ) ( not ( = ?auto_188315 ?auto_188320 ) ) ( not ( = ?auto_188316 ?auto_188321 ) ) ( not ( = ?auto_188316 ?auto_188320 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188321 ?auto_188320 ?auto_188319 ?auto_188318 )
      ( MAKE-6PILE ?auto_188313 ?auto_188314 ?auto_188315 ?auto_188316 ?auto_188317 ?auto_188318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188322 - BLOCK
      ?auto_188323 - BLOCK
      ?auto_188324 - BLOCK
      ?auto_188325 - BLOCK
      ?auto_188326 - BLOCK
      ?auto_188327 - BLOCK
    )
    :vars
    (
      ?auto_188328 - BLOCK
      ?auto_188329 - BLOCK
      ?auto_188330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188322 ) ( ON ?auto_188323 ?auto_188322 ) ( ON ?auto_188324 ?auto_188323 ) ( not ( = ?auto_188322 ?auto_188323 ) ) ( not ( = ?auto_188322 ?auto_188324 ) ) ( not ( = ?auto_188322 ?auto_188325 ) ) ( not ( = ?auto_188322 ?auto_188326 ) ) ( not ( = ?auto_188322 ?auto_188327 ) ) ( not ( = ?auto_188323 ?auto_188324 ) ) ( not ( = ?auto_188323 ?auto_188325 ) ) ( not ( = ?auto_188323 ?auto_188326 ) ) ( not ( = ?auto_188323 ?auto_188327 ) ) ( not ( = ?auto_188324 ?auto_188325 ) ) ( not ( = ?auto_188324 ?auto_188326 ) ) ( not ( = ?auto_188324 ?auto_188327 ) ) ( not ( = ?auto_188325 ?auto_188326 ) ) ( not ( = ?auto_188325 ?auto_188327 ) ) ( not ( = ?auto_188326 ?auto_188327 ) ) ( ON ?auto_188327 ?auto_188328 ) ( not ( = ?auto_188322 ?auto_188328 ) ) ( not ( = ?auto_188323 ?auto_188328 ) ) ( not ( = ?auto_188324 ?auto_188328 ) ) ( not ( = ?auto_188325 ?auto_188328 ) ) ( not ( = ?auto_188326 ?auto_188328 ) ) ( not ( = ?auto_188327 ?auto_188328 ) ) ( ON ?auto_188326 ?auto_188327 ) ( CLEAR ?auto_188326 ) ( ON-TABLE ?auto_188329 ) ( ON ?auto_188330 ?auto_188329 ) ( ON ?auto_188328 ?auto_188330 ) ( not ( = ?auto_188329 ?auto_188330 ) ) ( not ( = ?auto_188329 ?auto_188328 ) ) ( not ( = ?auto_188329 ?auto_188327 ) ) ( not ( = ?auto_188329 ?auto_188326 ) ) ( not ( = ?auto_188330 ?auto_188328 ) ) ( not ( = ?auto_188330 ?auto_188327 ) ) ( not ( = ?auto_188330 ?auto_188326 ) ) ( not ( = ?auto_188322 ?auto_188329 ) ) ( not ( = ?auto_188322 ?auto_188330 ) ) ( not ( = ?auto_188323 ?auto_188329 ) ) ( not ( = ?auto_188323 ?auto_188330 ) ) ( not ( = ?auto_188324 ?auto_188329 ) ) ( not ( = ?auto_188324 ?auto_188330 ) ) ( not ( = ?auto_188325 ?auto_188329 ) ) ( not ( = ?auto_188325 ?auto_188330 ) ) ( HOLDING ?auto_188325 ) ( CLEAR ?auto_188324 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188322 ?auto_188323 ?auto_188324 ?auto_188325 )
      ( MAKE-6PILE ?auto_188322 ?auto_188323 ?auto_188324 ?auto_188325 ?auto_188326 ?auto_188327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188331 - BLOCK
      ?auto_188332 - BLOCK
      ?auto_188333 - BLOCK
      ?auto_188334 - BLOCK
      ?auto_188335 - BLOCK
      ?auto_188336 - BLOCK
    )
    :vars
    (
      ?auto_188339 - BLOCK
      ?auto_188337 - BLOCK
      ?auto_188338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188331 ) ( ON ?auto_188332 ?auto_188331 ) ( ON ?auto_188333 ?auto_188332 ) ( not ( = ?auto_188331 ?auto_188332 ) ) ( not ( = ?auto_188331 ?auto_188333 ) ) ( not ( = ?auto_188331 ?auto_188334 ) ) ( not ( = ?auto_188331 ?auto_188335 ) ) ( not ( = ?auto_188331 ?auto_188336 ) ) ( not ( = ?auto_188332 ?auto_188333 ) ) ( not ( = ?auto_188332 ?auto_188334 ) ) ( not ( = ?auto_188332 ?auto_188335 ) ) ( not ( = ?auto_188332 ?auto_188336 ) ) ( not ( = ?auto_188333 ?auto_188334 ) ) ( not ( = ?auto_188333 ?auto_188335 ) ) ( not ( = ?auto_188333 ?auto_188336 ) ) ( not ( = ?auto_188334 ?auto_188335 ) ) ( not ( = ?auto_188334 ?auto_188336 ) ) ( not ( = ?auto_188335 ?auto_188336 ) ) ( ON ?auto_188336 ?auto_188339 ) ( not ( = ?auto_188331 ?auto_188339 ) ) ( not ( = ?auto_188332 ?auto_188339 ) ) ( not ( = ?auto_188333 ?auto_188339 ) ) ( not ( = ?auto_188334 ?auto_188339 ) ) ( not ( = ?auto_188335 ?auto_188339 ) ) ( not ( = ?auto_188336 ?auto_188339 ) ) ( ON ?auto_188335 ?auto_188336 ) ( ON-TABLE ?auto_188337 ) ( ON ?auto_188338 ?auto_188337 ) ( ON ?auto_188339 ?auto_188338 ) ( not ( = ?auto_188337 ?auto_188338 ) ) ( not ( = ?auto_188337 ?auto_188339 ) ) ( not ( = ?auto_188337 ?auto_188336 ) ) ( not ( = ?auto_188337 ?auto_188335 ) ) ( not ( = ?auto_188338 ?auto_188339 ) ) ( not ( = ?auto_188338 ?auto_188336 ) ) ( not ( = ?auto_188338 ?auto_188335 ) ) ( not ( = ?auto_188331 ?auto_188337 ) ) ( not ( = ?auto_188331 ?auto_188338 ) ) ( not ( = ?auto_188332 ?auto_188337 ) ) ( not ( = ?auto_188332 ?auto_188338 ) ) ( not ( = ?auto_188333 ?auto_188337 ) ) ( not ( = ?auto_188333 ?auto_188338 ) ) ( not ( = ?auto_188334 ?auto_188337 ) ) ( not ( = ?auto_188334 ?auto_188338 ) ) ( CLEAR ?auto_188333 ) ( ON ?auto_188334 ?auto_188335 ) ( CLEAR ?auto_188334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188337 ?auto_188338 ?auto_188339 ?auto_188336 ?auto_188335 )
      ( MAKE-6PILE ?auto_188331 ?auto_188332 ?auto_188333 ?auto_188334 ?auto_188335 ?auto_188336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188340 - BLOCK
      ?auto_188341 - BLOCK
      ?auto_188342 - BLOCK
      ?auto_188343 - BLOCK
      ?auto_188344 - BLOCK
      ?auto_188345 - BLOCK
    )
    :vars
    (
      ?auto_188348 - BLOCK
      ?auto_188347 - BLOCK
      ?auto_188346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188340 ) ( ON ?auto_188341 ?auto_188340 ) ( not ( = ?auto_188340 ?auto_188341 ) ) ( not ( = ?auto_188340 ?auto_188342 ) ) ( not ( = ?auto_188340 ?auto_188343 ) ) ( not ( = ?auto_188340 ?auto_188344 ) ) ( not ( = ?auto_188340 ?auto_188345 ) ) ( not ( = ?auto_188341 ?auto_188342 ) ) ( not ( = ?auto_188341 ?auto_188343 ) ) ( not ( = ?auto_188341 ?auto_188344 ) ) ( not ( = ?auto_188341 ?auto_188345 ) ) ( not ( = ?auto_188342 ?auto_188343 ) ) ( not ( = ?auto_188342 ?auto_188344 ) ) ( not ( = ?auto_188342 ?auto_188345 ) ) ( not ( = ?auto_188343 ?auto_188344 ) ) ( not ( = ?auto_188343 ?auto_188345 ) ) ( not ( = ?auto_188344 ?auto_188345 ) ) ( ON ?auto_188345 ?auto_188348 ) ( not ( = ?auto_188340 ?auto_188348 ) ) ( not ( = ?auto_188341 ?auto_188348 ) ) ( not ( = ?auto_188342 ?auto_188348 ) ) ( not ( = ?auto_188343 ?auto_188348 ) ) ( not ( = ?auto_188344 ?auto_188348 ) ) ( not ( = ?auto_188345 ?auto_188348 ) ) ( ON ?auto_188344 ?auto_188345 ) ( ON-TABLE ?auto_188347 ) ( ON ?auto_188346 ?auto_188347 ) ( ON ?auto_188348 ?auto_188346 ) ( not ( = ?auto_188347 ?auto_188346 ) ) ( not ( = ?auto_188347 ?auto_188348 ) ) ( not ( = ?auto_188347 ?auto_188345 ) ) ( not ( = ?auto_188347 ?auto_188344 ) ) ( not ( = ?auto_188346 ?auto_188348 ) ) ( not ( = ?auto_188346 ?auto_188345 ) ) ( not ( = ?auto_188346 ?auto_188344 ) ) ( not ( = ?auto_188340 ?auto_188347 ) ) ( not ( = ?auto_188340 ?auto_188346 ) ) ( not ( = ?auto_188341 ?auto_188347 ) ) ( not ( = ?auto_188341 ?auto_188346 ) ) ( not ( = ?auto_188342 ?auto_188347 ) ) ( not ( = ?auto_188342 ?auto_188346 ) ) ( not ( = ?auto_188343 ?auto_188347 ) ) ( not ( = ?auto_188343 ?auto_188346 ) ) ( ON ?auto_188343 ?auto_188344 ) ( CLEAR ?auto_188343 ) ( HOLDING ?auto_188342 ) ( CLEAR ?auto_188341 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188340 ?auto_188341 ?auto_188342 )
      ( MAKE-6PILE ?auto_188340 ?auto_188341 ?auto_188342 ?auto_188343 ?auto_188344 ?auto_188345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188349 - BLOCK
      ?auto_188350 - BLOCK
      ?auto_188351 - BLOCK
      ?auto_188352 - BLOCK
      ?auto_188353 - BLOCK
      ?auto_188354 - BLOCK
    )
    :vars
    (
      ?auto_188355 - BLOCK
      ?auto_188357 - BLOCK
      ?auto_188356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188349 ) ( ON ?auto_188350 ?auto_188349 ) ( not ( = ?auto_188349 ?auto_188350 ) ) ( not ( = ?auto_188349 ?auto_188351 ) ) ( not ( = ?auto_188349 ?auto_188352 ) ) ( not ( = ?auto_188349 ?auto_188353 ) ) ( not ( = ?auto_188349 ?auto_188354 ) ) ( not ( = ?auto_188350 ?auto_188351 ) ) ( not ( = ?auto_188350 ?auto_188352 ) ) ( not ( = ?auto_188350 ?auto_188353 ) ) ( not ( = ?auto_188350 ?auto_188354 ) ) ( not ( = ?auto_188351 ?auto_188352 ) ) ( not ( = ?auto_188351 ?auto_188353 ) ) ( not ( = ?auto_188351 ?auto_188354 ) ) ( not ( = ?auto_188352 ?auto_188353 ) ) ( not ( = ?auto_188352 ?auto_188354 ) ) ( not ( = ?auto_188353 ?auto_188354 ) ) ( ON ?auto_188354 ?auto_188355 ) ( not ( = ?auto_188349 ?auto_188355 ) ) ( not ( = ?auto_188350 ?auto_188355 ) ) ( not ( = ?auto_188351 ?auto_188355 ) ) ( not ( = ?auto_188352 ?auto_188355 ) ) ( not ( = ?auto_188353 ?auto_188355 ) ) ( not ( = ?auto_188354 ?auto_188355 ) ) ( ON ?auto_188353 ?auto_188354 ) ( ON-TABLE ?auto_188357 ) ( ON ?auto_188356 ?auto_188357 ) ( ON ?auto_188355 ?auto_188356 ) ( not ( = ?auto_188357 ?auto_188356 ) ) ( not ( = ?auto_188357 ?auto_188355 ) ) ( not ( = ?auto_188357 ?auto_188354 ) ) ( not ( = ?auto_188357 ?auto_188353 ) ) ( not ( = ?auto_188356 ?auto_188355 ) ) ( not ( = ?auto_188356 ?auto_188354 ) ) ( not ( = ?auto_188356 ?auto_188353 ) ) ( not ( = ?auto_188349 ?auto_188357 ) ) ( not ( = ?auto_188349 ?auto_188356 ) ) ( not ( = ?auto_188350 ?auto_188357 ) ) ( not ( = ?auto_188350 ?auto_188356 ) ) ( not ( = ?auto_188351 ?auto_188357 ) ) ( not ( = ?auto_188351 ?auto_188356 ) ) ( not ( = ?auto_188352 ?auto_188357 ) ) ( not ( = ?auto_188352 ?auto_188356 ) ) ( ON ?auto_188352 ?auto_188353 ) ( CLEAR ?auto_188350 ) ( ON ?auto_188351 ?auto_188352 ) ( CLEAR ?auto_188351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188357 ?auto_188356 ?auto_188355 ?auto_188354 ?auto_188353 ?auto_188352 )
      ( MAKE-6PILE ?auto_188349 ?auto_188350 ?auto_188351 ?auto_188352 ?auto_188353 ?auto_188354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188358 - BLOCK
      ?auto_188359 - BLOCK
      ?auto_188360 - BLOCK
      ?auto_188361 - BLOCK
      ?auto_188362 - BLOCK
      ?auto_188363 - BLOCK
    )
    :vars
    (
      ?auto_188364 - BLOCK
      ?auto_188366 - BLOCK
      ?auto_188365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188358 ) ( not ( = ?auto_188358 ?auto_188359 ) ) ( not ( = ?auto_188358 ?auto_188360 ) ) ( not ( = ?auto_188358 ?auto_188361 ) ) ( not ( = ?auto_188358 ?auto_188362 ) ) ( not ( = ?auto_188358 ?auto_188363 ) ) ( not ( = ?auto_188359 ?auto_188360 ) ) ( not ( = ?auto_188359 ?auto_188361 ) ) ( not ( = ?auto_188359 ?auto_188362 ) ) ( not ( = ?auto_188359 ?auto_188363 ) ) ( not ( = ?auto_188360 ?auto_188361 ) ) ( not ( = ?auto_188360 ?auto_188362 ) ) ( not ( = ?auto_188360 ?auto_188363 ) ) ( not ( = ?auto_188361 ?auto_188362 ) ) ( not ( = ?auto_188361 ?auto_188363 ) ) ( not ( = ?auto_188362 ?auto_188363 ) ) ( ON ?auto_188363 ?auto_188364 ) ( not ( = ?auto_188358 ?auto_188364 ) ) ( not ( = ?auto_188359 ?auto_188364 ) ) ( not ( = ?auto_188360 ?auto_188364 ) ) ( not ( = ?auto_188361 ?auto_188364 ) ) ( not ( = ?auto_188362 ?auto_188364 ) ) ( not ( = ?auto_188363 ?auto_188364 ) ) ( ON ?auto_188362 ?auto_188363 ) ( ON-TABLE ?auto_188366 ) ( ON ?auto_188365 ?auto_188366 ) ( ON ?auto_188364 ?auto_188365 ) ( not ( = ?auto_188366 ?auto_188365 ) ) ( not ( = ?auto_188366 ?auto_188364 ) ) ( not ( = ?auto_188366 ?auto_188363 ) ) ( not ( = ?auto_188366 ?auto_188362 ) ) ( not ( = ?auto_188365 ?auto_188364 ) ) ( not ( = ?auto_188365 ?auto_188363 ) ) ( not ( = ?auto_188365 ?auto_188362 ) ) ( not ( = ?auto_188358 ?auto_188366 ) ) ( not ( = ?auto_188358 ?auto_188365 ) ) ( not ( = ?auto_188359 ?auto_188366 ) ) ( not ( = ?auto_188359 ?auto_188365 ) ) ( not ( = ?auto_188360 ?auto_188366 ) ) ( not ( = ?auto_188360 ?auto_188365 ) ) ( not ( = ?auto_188361 ?auto_188366 ) ) ( not ( = ?auto_188361 ?auto_188365 ) ) ( ON ?auto_188361 ?auto_188362 ) ( ON ?auto_188360 ?auto_188361 ) ( CLEAR ?auto_188360 ) ( HOLDING ?auto_188359 ) ( CLEAR ?auto_188358 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188358 ?auto_188359 )
      ( MAKE-6PILE ?auto_188358 ?auto_188359 ?auto_188360 ?auto_188361 ?auto_188362 ?auto_188363 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188367 - BLOCK
      ?auto_188368 - BLOCK
      ?auto_188369 - BLOCK
      ?auto_188370 - BLOCK
      ?auto_188371 - BLOCK
      ?auto_188372 - BLOCK
    )
    :vars
    (
      ?auto_188374 - BLOCK
      ?auto_188373 - BLOCK
      ?auto_188375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188367 ) ( not ( = ?auto_188367 ?auto_188368 ) ) ( not ( = ?auto_188367 ?auto_188369 ) ) ( not ( = ?auto_188367 ?auto_188370 ) ) ( not ( = ?auto_188367 ?auto_188371 ) ) ( not ( = ?auto_188367 ?auto_188372 ) ) ( not ( = ?auto_188368 ?auto_188369 ) ) ( not ( = ?auto_188368 ?auto_188370 ) ) ( not ( = ?auto_188368 ?auto_188371 ) ) ( not ( = ?auto_188368 ?auto_188372 ) ) ( not ( = ?auto_188369 ?auto_188370 ) ) ( not ( = ?auto_188369 ?auto_188371 ) ) ( not ( = ?auto_188369 ?auto_188372 ) ) ( not ( = ?auto_188370 ?auto_188371 ) ) ( not ( = ?auto_188370 ?auto_188372 ) ) ( not ( = ?auto_188371 ?auto_188372 ) ) ( ON ?auto_188372 ?auto_188374 ) ( not ( = ?auto_188367 ?auto_188374 ) ) ( not ( = ?auto_188368 ?auto_188374 ) ) ( not ( = ?auto_188369 ?auto_188374 ) ) ( not ( = ?auto_188370 ?auto_188374 ) ) ( not ( = ?auto_188371 ?auto_188374 ) ) ( not ( = ?auto_188372 ?auto_188374 ) ) ( ON ?auto_188371 ?auto_188372 ) ( ON-TABLE ?auto_188373 ) ( ON ?auto_188375 ?auto_188373 ) ( ON ?auto_188374 ?auto_188375 ) ( not ( = ?auto_188373 ?auto_188375 ) ) ( not ( = ?auto_188373 ?auto_188374 ) ) ( not ( = ?auto_188373 ?auto_188372 ) ) ( not ( = ?auto_188373 ?auto_188371 ) ) ( not ( = ?auto_188375 ?auto_188374 ) ) ( not ( = ?auto_188375 ?auto_188372 ) ) ( not ( = ?auto_188375 ?auto_188371 ) ) ( not ( = ?auto_188367 ?auto_188373 ) ) ( not ( = ?auto_188367 ?auto_188375 ) ) ( not ( = ?auto_188368 ?auto_188373 ) ) ( not ( = ?auto_188368 ?auto_188375 ) ) ( not ( = ?auto_188369 ?auto_188373 ) ) ( not ( = ?auto_188369 ?auto_188375 ) ) ( not ( = ?auto_188370 ?auto_188373 ) ) ( not ( = ?auto_188370 ?auto_188375 ) ) ( ON ?auto_188370 ?auto_188371 ) ( ON ?auto_188369 ?auto_188370 ) ( CLEAR ?auto_188367 ) ( ON ?auto_188368 ?auto_188369 ) ( CLEAR ?auto_188368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188373 ?auto_188375 ?auto_188374 ?auto_188372 ?auto_188371 ?auto_188370 ?auto_188369 )
      ( MAKE-6PILE ?auto_188367 ?auto_188368 ?auto_188369 ?auto_188370 ?auto_188371 ?auto_188372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188376 - BLOCK
      ?auto_188377 - BLOCK
      ?auto_188378 - BLOCK
      ?auto_188379 - BLOCK
      ?auto_188380 - BLOCK
      ?auto_188381 - BLOCK
    )
    :vars
    (
      ?auto_188382 - BLOCK
      ?auto_188384 - BLOCK
      ?auto_188383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188376 ?auto_188377 ) ) ( not ( = ?auto_188376 ?auto_188378 ) ) ( not ( = ?auto_188376 ?auto_188379 ) ) ( not ( = ?auto_188376 ?auto_188380 ) ) ( not ( = ?auto_188376 ?auto_188381 ) ) ( not ( = ?auto_188377 ?auto_188378 ) ) ( not ( = ?auto_188377 ?auto_188379 ) ) ( not ( = ?auto_188377 ?auto_188380 ) ) ( not ( = ?auto_188377 ?auto_188381 ) ) ( not ( = ?auto_188378 ?auto_188379 ) ) ( not ( = ?auto_188378 ?auto_188380 ) ) ( not ( = ?auto_188378 ?auto_188381 ) ) ( not ( = ?auto_188379 ?auto_188380 ) ) ( not ( = ?auto_188379 ?auto_188381 ) ) ( not ( = ?auto_188380 ?auto_188381 ) ) ( ON ?auto_188381 ?auto_188382 ) ( not ( = ?auto_188376 ?auto_188382 ) ) ( not ( = ?auto_188377 ?auto_188382 ) ) ( not ( = ?auto_188378 ?auto_188382 ) ) ( not ( = ?auto_188379 ?auto_188382 ) ) ( not ( = ?auto_188380 ?auto_188382 ) ) ( not ( = ?auto_188381 ?auto_188382 ) ) ( ON ?auto_188380 ?auto_188381 ) ( ON-TABLE ?auto_188384 ) ( ON ?auto_188383 ?auto_188384 ) ( ON ?auto_188382 ?auto_188383 ) ( not ( = ?auto_188384 ?auto_188383 ) ) ( not ( = ?auto_188384 ?auto_188382 ) ) ( not ( = ?auto_188384 ?auto_188381 ) ) ( not ( = ?auto_188384 ?auto_188380 ) ) ( not ( = ?auto_188383 ?auto_188382 ) ) ( not ( = ?auto_188383 ?auto_188381 ) ) ( not ( = ?auto_188383 ?auto_188380 ) ) ( not ( = ?auto_188376 ?auto_188384 ) ) ( not ( = ?auto_188376 ?auto_188383 ) ) ( not ( = ?auto_188377 ?auto_188384 ) ) ( not ( = ?auto_188377 ?auto_188383 ) ) ( not ( = ?auto_188378 ?auto_188384 ) ) ( not ( = ?auto_188378 ?auto_188383 ) ) ( not ( = ?auto_188379 ?auto_188384 ) ) ( not ( = ?auto_188379 ?auto_188383 ) ) ( ON ?auto_188379 ?auto_188380 ) ( ON ?auto_188378 ?auto_188379 ) ( ON ?auto_188377 ?auto_188378 ) ( CLEAR ?auto_188377 ) ( HOLDING ?auto_188376 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188376 )
      ( MAKE-6PILE ?auto_188376 ?auto_188377 ?auto_188378 ?auto_188379 ?auto_188380 ?auto_188381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_188385 - BLOCK
      ?auto_188386 - BLOCK
      ?auto_188387 - BLOCK
      ?auto_188388 - BLOCK
      ?auto_188389 - BLOCK
      ?auto_188390 - BLOCK
    )
    :vars
    (
      ?auto_188392 - BLOCK
      ?auto_188391 - BLOCK
      ?auto_188393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188385 ?auto_188386 ) ) ( not ( = ?auto_188385 ?auto_188387 ) ) ( not ( = ?auto_188385 ?auto_188388 ) ) ( not ( = ?auto_188385 ?auto_188389 ) ) ( not ( = ?auto_188385 ?auto_188390 ) ) ( not ( = ?auto_188386 ?auto_188387 ) ) ( not ( = ?auto_188386 ?auto_188388 ) ) ( not ( = ?auto_188386 ?auto_188389 ) ) ( not ( = ?auto_188386 ?auto_188390 ) ) ( not ( = ?auto_188387 ?auto_188388 ) ) ( not ( = ?auto_188387 ?auto_188389 ) ) ( not ( = ?auto_188387 ?auto_188390 ) ) ( not ( = ?auto_188388 ?auto_188389 ) ) ( not ( = ?auto_188388 ?auto_188390 ) ) ( not ( = ?auto_188389 ?auto_188390 ) ) ( ON ?auto_188390 ?auto_188392 ) ( not ( = ?auto_188385 ?auto_188392 ) ) ( not ( = ?auto_188386 ?auto_188392 ) ) ( not ( = ?auto_188387 ?auto_188392 ) ) ( not ( = ?auto_188388 ?auto_188392 ) ) ( not ( = ?auto_188389 ?auto_188392 ) ) ( not ( = ?auto_188390 ?auto_188392 ) ) ( ON ?auto_188389 ?auto_188390 ) ( ON-TABLE ?auto_188391 ) ( ON ?auto_188393 ?auto_188391 ) ( ON ?auto_188392 ?auto_188393 ) ( not ( = ?auto_188391 ?auto_188393 ) ) ( not ( = ?auto_188391 ?auto_188392 ) ) ( not ( = ?auto_188391 ?auto_188390 ) ) ( not ( = ?auto_188391 ?auto_188389 ) ) ( not ( = ?auto_188393 ?auto_188392 ) ) ( not ( = ?auto_188393 ?auto_188390 ) ) ( not ( = ?auto_188393 ?auto_188389 ) ) ( not ( = ?auto_188385 ?auto_188391 ) ) ( not ( = ?auto_188385 ?auto_188393 ) ) ( not ( = ?auto_188386 ?auto_188391 ) ) ( not ( = ?auto_188386 ?auto_188393 ) ) ( not ( = ?auto_188387 ?auto_188391 ) ) ( not ( = ?auto_188387 ?auto_188393 ) ) ( not ( = ?auto_188388 ?auto_188391 ) ) ( not ( = ?auto_188388 ?auto_188393 ) ) ( ON ?auto_188388 ?auto_188389 ) ( ON ?auto_188387 ?auto_188388 ) ( ON ?auto_188386 ?auto_188387 ) ( ON ?auto_188385 ?auto_188386 ) ( CLEAR ?auto_188385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188391 ?auto_188393 ?auto_188392 ?auto_188390 ?auto_188389 ?auto_188388 ?auto_188387 ?auto_188386 )
      ( MAKE-6PILE ?auto_188385 ?auto_188386 ?auto_188387 ?auto_188388 ?auto_188389 ?auto_188390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188396 - BLOCK
      ?auto_188397 - BLOCK
    )
    :vars
    (
      ?auto_188398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188398 ?auto_188397 ) ( CLEAR ?auto_188398 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188396 ) ( ON ?auto_188397 ?auto_188396 ) ( not ( = ?auto_188396 ?auto_188397 ) ) ( not ( = ?auto_188396 ?auto_188398 ) ) ( not ( = ?auto_188397 ?auto_188398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188398 ?auto_188397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188399 - BLOCK
      ?auto_188400 - BLOCK
    )
    :vars
    (
      ?auto_188401 - BLOCK
      ?auto_188402 - BLOCK
      ?auto_188403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188401 ?auto_188400 ) ( CLEAR ?auto_188401 ) ( ON-TABLE ?auto_188399 ) ( ON ?auto_188400 ?auto_188399 ) ( not ( = ?auto_188399 ?auto_188400 ) ) ( not ( = ?auto_188399 ?auto_188401 ) ) ( not ( = ?auto_188400 ?auto_188401 ) ) ( HOLDING ?auto_188402 ) ( CLEAR ?auto_188403 ) ( not ( = ?auto_188399 ?auto_188402 ) ) ( not ( = ?auto_188399 ?auto_188403 ) ) ( not ( = ?auto_188400 ?auto_188402 ) ) ( not ( = ?auto_188400 ?auto_188403 ) ) ( not ( = ?auto_188401 ?auto_188402 ) ) ( not ( = ?auto_188401 ?auto_188403 ) ) ( not ( = ?auto_188402 ?auto_188403 ) ) )
    :subtasks
    ( ( !STACK ?auto_188402 ?auto_188403 )
      ( MAKE-2PILE ?auto_188399 ?auto_188400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188404 - BLOCK
      ?auto_188405 - BLOCK
    )
    :vars
    (
      ?auto_188408 - BLOCK
      ?auto_188406 - BLOCK
      ?auto_188407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188408 ?auto_188405 ) ( ON-TABLE ?auto_188404 ) ( ON ?auto_188405 ?auto_188404 ) ( not ( = ?auto_188404 ?auto_188405 ) ) ( not ( = ?auto_188404 ?auto_188408 ) ) ( not ( = ?auto_188405 ?auto_188408 ) ) ( CLEAR ?auto_188406 ) ( not ( = ?auto_188404 ?auto_188407 ) ) ( not ( = ?auto_188404 ?auto_188406 ) ) ( not ( = ?auto_188405 ?auto_188407 ) ) ( not ( = ?auto_188405 ?auto_188406 ) ) ( not ( = ?auto_188408 ?auto_188407 ) ) ( not ( = ?auto_188408 ?auto_188406 ) ) ( not ( = ?auto_188407 ?auto_188406 ) ) ( ON ?auto_188407 ?auto_188408 ) ( CLEAR ?auto_188407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188404 ?auto_188405 ?auto_188408 )
      ( MAKE-2PILE ?auto_188404 ?auto_188405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188409 - BLOCK
      ?auto_188410 - BLOCK
    )
    :vars
    (
      ?auto_188413 - BLOCK
      ?auto_188412 - BLOCK
      ?auto_188411 - BLOCK
      ?auto_188417 - BLOCK
      ?auto_188416 - BLOCK
      ?auto_188414 - BLOCK
      ?auto_188415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188413 ?auto_188410 ) ( ON-TABLE ?auto_188409 ) ( ON ?auto_188410 ?auto_188409 ) ( not ( = ?auto_188409 ?auto_188410 ) ) ( not ( = ?auto_188409 ?auto_188413 ) ) ( not ( = ?auto_188410 ?auto_188413 ) ) ( not ( = ?auto_188409 ?auto_188412 ) ) ( not ( = ?auto_188409 ?auto_188411 ) ) ( not ( = ?auto_188410 ?auto_188412 ) ) ( not ( = ?auto_188410 ?auto_188411 ) ) ( not ( = ?auto_188413 ?auto_188412 ) ) ( not ( = ?auto_188413 ?auto_188411 ) ) ( not ( = ?auto_188412 ?auto_188411 ) ) ( ON ?auto_188412 ?auto_188413 ) ( CLEAR ?auto_188412 ) ( HOLDING ?auto_188411 ) ( CLEAR ?auto_188417 ) ( ON-TABLE ?auto_188416 ) ( ON ?auto_188414 ?auto_188416 ) ( ON ?auto_188415 ?auto_188414 ) ( ON ?auto_188417 ?auto_188415 ) ( not ( = ?auto_188416 ?auto_188414 ) ) ( not ( = ?auto_188416 ?auto_188415 ) ) ( not ( = ?auto_188416 ?auto_188417 ) ) ( not ( = ?auto_188416 ?auto_188411 ) ) ( not ( = ?auto_188414 ?auto_188415 ) ) ( not ( = ?auto_188414 ?auto_188417 ) ) ( not ( = ?auto_188414 ?auto_188411 ) ) ( not ( = ?auto_188415 ?auto_188417 ) ) ( not ( = ?auto_188415 ?auto_188411 ) ) ( not ( = ?auto_188417 ?auto_188411 ) ) ( not ( = ?auto_188409 ?auto_188417 ) ) ( not ( = ?auto_188409 ?auto_188416 ) ) ( not ( = ?auto_188409 ?auto_188414 ) ) ( not ( = ?auto_188409 ?auto_188415 ) ) ( not ( = ?auto_188410 ?auto_188417 ) ) ( not ( = ?auto_188410 ?auto_188416 ) ) ( not ( = ?auto_188410 ?auto_188414 ) ) ( not ( = ?auto_188410 ?auto_188415 ) ) ( not ( = ?auto_188413 ?auto_188417 ) ) ( not ( = ?auto_188413 ?auto_188416 ) ) ( not ( = ?auto_188413 ?auto_188414 ) ) ( not ( = ?auto_188413 ?auto_188415 ) ) ( not ( = ?auto_188412 ?auto_188417 ) ) ( not ( = ?auto_188412 ?auto_188416 ) ) ( not ( = ?auto_188412 ?auto_188414 ) ) ( not ( = ?auto_188412 ?auto_188415 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188416 ?auto_188414 ?auto_188415 ?auto_188417 ?auto_188411 )
      ( MAKE-2PILE ?auto_188409 ?auto_188410 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188418 - BLOCK
      ?auto_188419 - BLOCK
    )
    :vars
    (
      ?auto_188425 - BLOCK
      ?auto_188421 - BLOCK
      ?auto_188422 - BLOCK
      ?auto_188424 - BLOCK
      ?auto_188420 - BLOCK
      ?auto_188426 - BLOCK
      ?auto_188423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188425 ?auto_188419 ) ( ON-TABLE ?auto_188418 ) ( ON ?auto_188419 ?auto_188418 ) ( not ( = ?auto_188418 ?auto_188419 ) ) ( not ( = ?auto_188418 ?auto_188425 ) ) ( not ( = ?auto_188419 ?auto_188425 ) ) ( not ( = ?auto_188418 ?auto_188421 ) ) ( not ( = ?auto_188418 ?auto_188422 ) ) ( not ( = ?auto_188419 ?auto_188421 ) ) ( not ( = ?auto_188419 ?auto_188422 ) ) ( not ( = ?auto_188425 ?auto_188421 ) ) ( not ( = ?auto_188425 ?auto_188422 ) ) ( not ( = ?auto_188421 ?auto_188422 ) ) ( ON ?auto_188421 ?auto_188425 ) ( CLEAR ?auto_188424 ) ( ON-TABLE ?auto_188420 ) ( ON ?auto_188426 ?auto_188420 ) ( ON ?auto_188423 ?auto_188426 ) ( ON ?auto_188424 ?auto_188423 ) ( not ( = ?auto_188420 ?auto_188426 ) ) ( not ( = ?auto_188420 ?auto_188423 ) ) ( not ( = ?auto_188420 ?auto_188424 ) ) ( not ( = ?auto_188420 ?auto_188422 ) ) ( not ( = ?auto_188426 ?auto_188423 ) ) ( not ( = ?auto_188426 ?auto_188424 ) ) ( not ( = ?auto_188426 ?auto_188422 ) ) ( not ( = ?auto_188423 ?auto_188424 ) ) ( not ( = ?auto_188423 ?auto_188422 ) ) ( not ( = ?auto_188424 ?auto_188422 ) ) ( not ( = ?auto_188418 ?auto_188424 ) ) ( not ( = ?auto_188418 ?auto_188420 ) ) ( not ( = ?auto_188418 ?auto_188426 ) ) ( not ( = ?auto_188418 ?auto_188423 ) ) ( not ( = ?auto_188419 ?auto_188424 ) ) ( not ( = ?auto_188419 ?auto_188420 ) ) ( not ( = ?auto_188419 ?auto_188426 ) ) ( not ( = ?auto_188419 ?auto_188423 ) ) ( not ( = ?auto_188425 ?auto_188424 ) ) ( not ( = ?auto_188425 ?auto_188420 ) ) ( not ( = ?auto_188425 ?auto_188426 ) ) ( not ( = ?auto_188425 ?auto_188423 ) ) ( not ( = ?auto_188421 ?auto_188424 ) ) ( not ( = ?auto_188421 ?auto_188420 ) ) ( not ( = ?auto_188421 ?auto_188426 ) ) ( not ( = ?auto_188421 ?auto_188423 ) ) ( ON ?auto_188422 ?auto_188421 ) ( CLEAR ?auto_188422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188418 ?auto_188419 ?auto_188425 ?auto_188421 )
      ( MAKE-2PILE ?auto_188418 ?auto_188419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188427 - BLOCK
      ?auto_188428 - BLOCK
    )
    :vars
    (
      ?auto_188432 - BLOCK
      ?auto_188429 - BLOCK
      ?auto_188431 - BLOCK
      ?auto_188433 - BLOCK
      ?auto_188430 - BLOCK
      ?auto_188434 - BLOCK
      ?auto_188435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188432 ?auto_188428 ) ( ON-TABLE ?auto_188427 ) ( ON ?auto_188428 ?auto_188427 ) ( not ( = ?auto_188427 ?auto_188428 ) ) ( not ( = ?auto_188427 ?auto_188432 ) ) ( not ( = ?auto_188428 ?auto_188432 ) ) ( not ( = ?auto_188427 ?auto_188429 ) ) ( not ( = ?auto_188427 ?auto_188431 ) ) ( not ( = ?auto_188428 ?auto_188429 ) ) ( not ( = ?auto_188428 ?auto_188431 ) ) ( not ( = ?auto_188432 ?auto_188429 ) ) ( not ( = ?auto_188432 ?auto_188431 ) ) ( not ( = ?auto_188429 ?auto_188431 ) ) ( ON ?auto_188429 ?auto_188432 ) ( ON-TABLE ?auto_188433 ) ( ON ?auto_188430 ?auto_188433 ) ( ON ?auto_188434 ?auto_188430 ) ( not ( = ?auto_188433 ?auto_188430 ) ) ( not ( = ?auto_188433 ?auto_188434 ) ) ( not ( = ?auto_188433 ?auto_188435 ) ) ( not ( = ?auto_188433 ?auto_188431 ) ) ( not ( = ?auto_188430 ?auto_188434 ) ) ( not ( = ?auto_188430 ?auto_188435 ) ) ( not ( = ?auto_188430 ?auto_188431 ) ) ( not ( = ?auto_188434 ?auto_188435 ) ) ( not ( = ?auto_188434 ?auto_188431 ) ) ( not ( = ?auto_188435 ?auto_188431 ) ) ( not ( = ?auto_188427 ?auto_188435 ) ) ( not ( = ?auto_188427 ?auto_188433 ) ) ( not ( = ?auto_188427 ?auto_188430 ) ) ( not ( = ?auto_188427 ?auto_188434 ) ) ( not ( = ?auto_188428 ?auto_188435 ) ) ( not ( = ?auto_188428 ?auto_188433 ) ) ( not ( = ?auto_188428 ?auto_188430 ) ) ( not ( = ?auto_188428 ?auto_188434 ) ) ( not ( = ?auto_188432 ?auto_188435 ) ) ( not ( = ?auto_188432 ?auto_188433 ) ) ( not ( = ?auto_188432 ?auto_188430 ) ) ( not ( = ?auto_188432 ?auto_188434 ) ) ( not ( = ?auto_188429 ?auto_188435 ) ) ( not ( = ?auto_188429 ?auto_188433 ) ) ( not ( = ?auto_188429 ?auto_188430 ) ) ( not ( = ?auto_188429 ?auto_188434 ) ) ( ON ?auto_188431 ?auto_188429 ) ( CLEAR ?auto_188431 ) ( HOLDING ?auto_188435 ) ( CLEAR ?auto_188434 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188433 ?auto_188430 ?auto_188434 ?auto_188435 )
      ( MAKE-2PILE ?auto_188427 ?auto_188428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188436 - BLOCK
      ?auto_188437 - BLOCK
    )
    :vars
    (
      ?auto_188439 - BLOCK
      ?auto_188441 - BLOCK
      ?auto_188443 - BLOCK
      ?auto_188438 - BLOCK
      ?auto_188442 - BLOCK
      ?auto_188444 - BLOCK
      ?auto_188440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188439 ?auto_188437 ) ( ON-TABLE ?auto_188436 ) ( ON ?auto_188437 ?auto_188436 ) ( not ( = ?auto_188436 ?auto_188437 ) ) ( not ( = ?auto_188436 ?auto_188439 ) ) ( not ( = ?auto_188437 ?auto_188439 ) ) ( not ( = ?auto_188436 ?auto_188441 ) ) ( not ( = ?auto_188436 ?auto_188443 ) ) ( not ( = ?auto_188437 ?auto_188441 ) ) ( not ( = ?auto_188437 ?auto_188443 ) ) ( not ( = ?auto_188439 ?auto_188441 ) ) ( not ( = ?auto_188439 ?auto_188443 ) ) ( not ( = ?auto_188441 ?auto_188443 ) ) ( ON ?auto_188441 ?auto_188439 ) ( ON-TABLE ?auto_188438 ) ( ON ?auto_188442 ?auto_188438 ) ( ON ?auto_188444 ?auto_188442 ) ( not ( = ?auto_188438 ?auto_188442 ) ) ( not ( = ?auto_188438 ?auto_188444 ) ) ( not ( = ?auto_188438 ?auto_188440 ) ) ( not ( = ?auto_188438 ?auto_188443 ) ) ( not ( = ?auto_188442 ?auto_188444 ) ) ( not ( = ?auto_188442 ?auto_188440 ) ) ( not ( = ?auto_188442 ?auto_188443 ) ) ( not ( = ?auto_188444 ?auto_188440 ) ) ( not ( = ?auto_188444 ?auto_188443 ) ) ( not ( = ?auto_188440 ?auto_188443 ) ) ( not ( = ?auto_188436 ?auto_188440 ) ) ( not ( = ?auto_188436 ?auto_188438 ) ) ( not ( = ?auto_188436 ?auto_188442 ) ) ( not ( = ?auto_188436 ?auto_188444 ) ) ( not ( = ?auto_188437 ?auto_188440 ) ) ( not ( = ?auto_188437 ?auto_188438 ) ) ( not ( = ?auto_188437 ?auto_188442 ) ) ( not ( = ?auto_188437 ?auto_188444 ) ) ( not ( = ?auto_188439 ?auto_188440 ) ) ( not ( = ?auto_188439 ?auto_188438 ) ) ( not ( = ?auto_188439 ?auto_188442 ) ) ( not ( = ?auto_188439 ?auto_188444 ) ) ( not ( = ?auto_188441 ?auto_188440 ) ) ( not ( = ?auto_188441 ?auto_188438 ) ) ( not ( = ?auto_188441 ?auto_188442 ) ) ( not ( = ?auto_188441 ?auto_188444 ) ) ( ON ?auto_188443 ?auto_188441 ) ( CLEAR ?auto_188444 ) ( ON ?auto_188440 ?auto_188443 ) ( CLEAR ?auto_188440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188436 ?auto_188437 ?auto_188439 ?auto_188441 ?auto_188443 )
      ( MAKE-2PILE ?auto_188436 ?auto_188437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188445 - BLOCK
      ?auto_188446 - BLOCK
    )
    :vars
    (
      ?auto_188449 - BLOCK
      ?auto_188448 - BLOCK
      ?auto_188453 - BLOCK
      ?auto_188452 - BLOCK
      ?auto_188451 - BLOCK
      ?auto_188450 - BLOCK
      ?auto_188447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188449 ?auto_188446 ) ( ON-TABLE ?auto_188445 ) ( ON ?auto_188446 ?auto_188445 ) ( not ( = ?auto_188445 ?auto_188446 ) ) ( not ( = ?auto_188445 ?auto_188449 ) ) ( not ( = ?auto_188446 ?auto_188449 ) ) ( not ( = ?auto_188445 ?auto_188448 ) ) ( not ( = ?auto_188445 ?auto_188453 ) ) ( not ( = ?auto_188446 ?auto_188448 ) ) ( not ( = ?auto_188446 ?auto_188453 ) ) ( not ( = ?auto_188449 ?auto_188448 ) ) ( not ( = ?auto_188449 ?auto_188453 ) ) ( not ( = ?auto_188448 ?auto_188453 ) ) ( ON ?auto_188448 ?auto_188449 ) ( ON-TABLE ?auto_188452 ) ( ON ?auto_188451 ?auto_188452 ) ( not ( = ?auto_188452 ?auto_188451 ) ) ( not ( = ?auto_188452 ?auto_188450 ) ) ( not ( = ?auto_188452 ?auto_188447 ) ) ( not ( = ?auto_188452 ?auto_188453 ) ) ( not ( = ?auto_188451 ?auto_188450 ) ) ( not ( = ?auto_188451 ?auto_188447 ) ) ( not ( = ?auto_188451 ?auto_188453 ) ) ( not ( = ?auto_188450 ?auto_188447 ) ) ( not ( = ?auto_188450 ?auto_188453 ) ) ( not ( = ?auto_188447 ?auto_188453 ) ) ( not ( = ?auto_188445 ?auto_188447 ) ) ( not ( = ?auto_188445 ?auto_188452 ) ) ( not ( = ?auto_188445 ?auto_188451 ) ) ( not ( = ?auto_188445 ?auto_188450 ) ) ( not ( = ?auto_188446 ?auto_188447 ) ) ( not ( = ?auto_188446 ?auto_188452 ) ) ( not ( = ?auto_188446 ?auto_188451 ) ) ( not ( = ?auto_188446 ?auto_188450 ) ) ( not ( = ?auto_188449 ?auto_188447 ) ) ( not ( = ?auto_188449 ?auto_188452 ) ) ( not ( = ?auto_188449 ?auto_188451 ) ) ( not ( = ?auto_188449 ?auto_188450 ) ) ( not ( = ?auto_188448 ?auto_188447 ) ) ( not ( = ?auto_188448 ?auto_188452 ) ) ( not ( = ?auto_188448 ?auto_188451 ) ) ( not ( = ?auto_188448 ?auto_188450 ) ) ( ON ?auto_188453 ?auto_188448 ) ( ON ?auto_188447 ?auto_188453 ) ( CLEAR ?auto_188447 ) ( HOLDING ?auto_188450 ) ( CLEAR ?auto_188451 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188452 ?auto_188451 ?auto_188450 )
      ( MAKE-2PILE ?auto_188445 ?auto_188446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188454 - BLOCK
      ?auto_188455 - BLOCK
    )
    :vars
    (
      ?auto_188460 - BLOCK
      ?auto_188458 - BLOCK
      ?auto_188457 - BLOCK
      ?auto_188459 - BLOCK
      ?auto_188461 - BLOCK
      ?auto_188456 - BLOCK
      ?auto_188462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188460 ?auto_188455 ) ( ON-TABLE ?auto_188454 ) ( ON ?auto_188455 ?auto_188454 ) ( not ( = ?auto_188454 ?auto_188455 ) ) ( not ( = ?auto_188454 ?auto_188460 ) ) ( not ( = ?auto_188455 ?auto_188460 ) ) ( not ( = ?auto_188454 ?auto_188458 ) ) ( not ( = ?auto_188454 ?auto_188457 ) ) ( not ( = ?auto_188455 ?auto_188458 ) ) ( not ( = ?auto_188455 ?auto_188457 ) ) ( not ( = ?auto_188460 ?auto_188458 ) ) ( not ( = ?auto_188460 ?auto_188457 ) ) ( not ( = ?auto_188458 ?auto_188457 ) ) ( ON ?auto_188458 ?auto_188460 ) ( ON-TABLE ?auto_188459 ) ( ON ?auto_188461 ?auto_188459 ) ( not ( = ?auto_188459 ?auto_188461 ) ) ( not ( = ?auto_188459 ?auto_188456 ) ) ( not ( = ?auto_188459 ?auto_188462 ) ) ( not ( = ?auto_188459 ?auto_188457 ) ) ( not ( = ?auto_188461 ?auto_188456 ) ) ( not ( = ?auto_188461 ?auto_188462 ) ) ( not ( = ?auto_188461 ?auto_188457 ) ) ( not ( = ?auto_188456 ?auto_188462 ) ) ( not ( = ?auto_188456 ?auto_188457 ) ) ( not ( = ?auto_188462 ?auto_188457 ) ) ( not ( = ?auto_188454 ?auto_188462 ) ) ( not ( = ?auto_188454 ?auto_188459 ) ) ( not ( = ?auto_188454 ?auto_188461 ) ) ( not ( = ?auto_188454 ?auto_188456 ) ) ( not ( = ?auto_188455 ?auto_188462 ) ) ( not ( = ?auto_188455 ?auto_188459 ) ) ( not ( = ?auto_188455 ?auto_188461 ) ) ( not ( = ?auto_188455 ?auto_188456 ) ) ( not ( = ?auto_188460 ?auto_188462 ) ) ( not ( = ?auto_188460 ?auto_188459 ) ) ( not ( = ?auto_188460 ?auto_188461 ) ) ( not ( = ?auto_188460 ?auto_188456 ) ) ( not ( = ?auto_188458 ?auto_188462 ) ) ( not ( = ?auto_188458 ?auto_188459 ) ) ( not ( = ?auto_188458 ?auto_188461 ) ) ( not ( = ?auto_188458 ?auto_188456 ) ) ( ON ?auto_188457 ?auto_188458 ) ( ON ?auto_188462 ?auto_188457 ) ( CLEAR ?auto_188461 ) ( ON ?auto_188456 ?auto_188462 ) ( CLEAR ?auto_188456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188454 ?auto_188455 ?auto_188460 ?auto_188458 ?auto_188457 ?auto_188462 )
      ( MAKE-2PILE ?auto_188454 ?auto_188455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188463 - BLOCK
      ?auto_188464 - BLOCK
    )
    :vars
    (
      ?auto_188465 - BLOCK
      ?auto_188466 - BLOCK
      ?auto_188467 - BLOCK
      ?auto_188468 - BLOCK
      ?auto_188470 - BLOCK
      ?auto_188471 - BLOCK
      ?auto_188469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188465 ?auto_188464 ) ( ON-TABLE ?auto_188463 ) ( ON ?auto_188464 ?auto_188463 ) ( not ( = ?auto_188463 ?auto_188464 ) ) ( not ( = ?auto_188463 ?auto_188465 ) ) ( not ( = ?auto_188464 ?auto_188465 ) ) ( not ( = ?auto_188463 ?auto_188466 ) ) ( not ( = ?auto_188463 ?auto_188467 ) ) ( not ( = ?auto_188464 ?auto_188466 ) ) ( not ( = ?auto_188464 ?auto_188467 ) ) ( not ( = ?auto_188465 ?auto_188466 ) ) ( not ( = ?auto_188465 ?auto_188467 ) ) ( not ( = ?auto_188466 ?auto_188467 ) ) ( ON ?auto_188466 ?auto_188465 ) ( ON-TABLE ?auto_188468 ) ( not ( = ?auto_188468 ?auto_188470 ) ) ( not ( = ?auto_188468 ?auto_188471 ) ) ( not ( = ?auto_188468 ?auto_188469 ) ) ( not ( = ?auto_188468 ?auto_188467 ) ) ( not ( = ?auto_188470 ?auto_188471 ) ) ( not ( = ?auto_188470 ?auto_188469 ) ) ( not ( = ?auto_188470 ?auto_188467 ) ) ( not ( = ?auto_188471 ?auto_188469 ) ) ( not ( = ?auto_188471 ?auto_188467 ) ) ( not ( = ?auto_188469 ?auto_188467 ) ) ( not ( = ?auto_188463 ?auto_188469 ) ) ( not ( = ?auto_188463 ?auto_188468 ) ) ( not ( = ?auto_188463 ?auto_188470 ) ) ( not ( = ?auto_188463 ?auto_188471 ) ) ( not ( = ?auto_188464 ?auto_188469 ) ) ( not ( = ?auto_188464 ?auto_188468 ) ) ( not ( = ?auto_188464 ?auto_188470 ) ) ( not ( = ?auto_188464 ?auto_188471 ) ) ( not ( = ?auto_188465 ?auto_188469 ) ) ( not ( = ?auto_188465 ?auto_188468 ) ) ( not ( = ?auto_188465 ?auto_188470 ) ) ( not ( = ?auto_188465 ?auto_188471 ) ) ( not ( = ?auto_188466 ?auto_188469 ) ) ( not ( = ?auto_188466 ?auto_188468 ) ) ( not ( = ?auto_188466 ?auto_188470 ) ) ( not ( = ?auto_188466 ?auto_188471 ) ) ( ON ?auto_188467 ?auto_188466 ) ( ON ?auto_188469 ?auto_188467 ) ( ON ?auto_188471 ?auto_188469 ) ( CLEAR ?auto_188471 ) ( HOLDING ?auto_188470 ) ( CLEAR ?auto_188468 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188468 ?auto_188470 )
      ( MAKE-2PILE ?auto_188463 ?auto_188464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188472 - BLOCK
      ?auto_188473 - BLOCK
    )
    :vars
    (
      ?auto_188474 - BLOCK
      ?auto_188477 - BLOCK
      ?auto_188479 - BLOCK
      ?auto_188480 - BLOCK
      ?auto_188476 - BLOCK
      ?auto_188475 - BLOCK
      ?auto_188478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188474 ?auto_188473 ) ( ON-TABLE ?auto_188472 ) ( ON ?auto_188473 ?auto_188472 ) ( not ( = ?auto_188472 ?auto_188473 ) ) ( not ( = ?auto_188472 ?auto_188474 ) ) ( not ( = ?auto_188473 ?auto_188474 ) ) ( not ( = ?auto_188472 ?auto_188477 ) ) ( not ( = ?auto_188472 ?auto_188479 ) ) ( not ( = ?auto_188473 ?auto_188477 ) ) ( not ( = ?auto_188473 ?auto_188479 ) ) ( not ( = ?auto_188474 ?auto_188477 ) ) ( not ( = ?auto_188474 ?auto_188479 ) ) ( not ( = ?auto_188477 ?auto_188479 ) ) ( ON ?auto_188477 ?auto_188474 ) ( ON-TABLE ?auto_188480 ) ( not ( = ?auto_188480 ?auto_188476 ) ) ( not ( = ?auto_188480 ?auto_188475 ) ) ( not ( = ?auto_188480 ?auto_188478 ) ) ( not ( = ?auto_188480 ?auto_188479 ) ) ( not ( = ?auto_188476 ?auto_188475 ) ) ( not ( = ?auto_188476 ?auto_188478 ) ) ( not ( = ?auto_188476 ?auto_188479 ) ) ( not ( = ?auto_188475 ?auto_188478 ) ) ( not ( = ?auto_188475 ?auto_188479 ) ) ( not ( = ?auto_188478 ?auto_188479 ) ) ( not ( = ?auto_188472 ?auto_188478 ) ) ( not ( = ?auto_188472 ?auto_188480 ) ) ( not ( = ?auto_188472 ?auto_188476 ) ) ( not ( = ?auto_188472 ?auto_188475 ) ) ( not ( = ?auto_188473 ?auto_188478 ) ) ( not ( = ?auto_188473 ?auto_188480 ) ) ( not ( = ?auto_188473 ?auto_188476 ) ) ( not ( = ?auto_188473 ?auto_188475 ) ) ( not ( = ?auto_188474 ?auto_188478 ) ) ( not ( = ?auto_188474 ?auto_188480 ) ) ( not ( = ?auto_188474 ?auto_188476 ) ) ( not ( = ?auto_188474 ?auto_188475 ) ) ( not ( = ?auto_188477 ?auto_188478 ) ) ( not ( = ?auto_188477 ?auto_188480 ) ) ( not ( = ?auto_188477 ?auto_188476 ) ) ( not ( = ?auto_188477 ?auto_188475 ) ) ( ON ?auto_188479 ?auto_188477 ) ( ON ?auto_188478 ?auto_188479 ) ( ON ?auto_188475 ?auto_188478 ) ( CLEAR ?auto_188480 ) ( ON ?auto_188476 ?auto_188475 ) ( CLEAR ?auto_188476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188472 ?auto_188473 ?auto_188474 ?auto_188477 ?auto_188479 ?auto_188478 ?auto_188475 )
      ( MAKE-2PILE ?auto_188472 ?auto_188473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188481 - BLOCK
      ?auto_188482 - BLOCK
    )
    :vars
    (
      ?auto_188484 - BLOCK
      ?auto_188488 - BLOCK
      ?auto_188489 - BLOCK
      ?auto_188487 - BLOCK
      ?auto_188485 - BLOCK
      ?auto_188486 - BLOCK
      ?auto_188483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188484 ?auto_188482 ) ( ON-TABLE ?auto_188481 ) ( ON ?auto_188482 ?auto_188481 ) ( not ( = ?auto_188481 ?auto_188482 ) ) ( not ( = ?auto_188481 ?auto_188484 ) ) ( not ( = ?auto_188482 ?auto_188484 ) ) ( not ( = ?auto_188481 ?auto_188488 ) ) ( not ( = ?auto_188481 ?auto_188489 ) ) ( not ( = ?auto_188482 ?auto_188488 ) ) ( not ( = ?auto_188482 ?auto_188489 ) ) ( not ( = ?auto_188484 ?auto_188488 ) ) ( not ( = ?auto_188484 ?auto_188489 ) ) ( not ( = ?auto_188488 ?auto_188489 ) ) ( ON ?auto_188488 ?auto_188484 ) ( not ( = ?auto_188487 ?auto_188485 ) ) ( not ( = ?auto_188487 ?auto_188486 ) ) ( not ( = ?auto_188487 ?auto_188483 ) ) ( not ( = ?auto_188487 ?auto_188489 ) ) ( not ( = ?auto_188485 ?auto_188486 ) ) ( not ( = ?auto_188485 ?auto_188483 ) ) ( not ( = ?auto_188485 ?auto_188489 ) ) ( not ( = ?auto_188486 ?auto_188483 ) ) ( not ( = ?auto_188486 ?auto_188489 ) ) ( not ( = ?auto_188483 ?auto_188489 ) ) ( not ( = ?auto_188481 ?auto_188483 ) ) ( not ( = ?auto_188481 ?auto_188487 ) ) ( not ( = ?auto_188481 ?auto_188485 ) ) ( not ( = ?auto_188481 ?auto_188486 ) ) ( not ( = ?auto_188482 ?auto_188483 ) ) ( not ( = ?auto_188482 ?auto_188487 ) ) ( not ( = ?auto_188482 ?auto_188485 ) ) ( not ( = ?auto_188482 ?auto_188486 ) ) ( not ( = ?auto_188484 ?auto_188483 ) ) ( not ( = ?auto_188484 ?auto_188487 ) ) ( not ( = ?auto_188484 ?auto_188485 ) ) ( not ( = ?auto_188484 ?auto_188486 ) ) ( not ( = ?auto_188488 ?auto_188483 ) ) ( not ( = ?auto_188488 ?auto_188487 ) ) ( not ( = ?auto_188488 ?auto_188485 ) ) ( not ( = ?auto_188488 ?auto_188486 ) ) ( ON ?auto_188489 ?auto_188488 ) ( ON ?auto_188483 ?auto_188489 ) ( ON ?auto_188486 ?auto_188483 ) ( ON ?auto_188485 ?auto_188486 ) ( CLEAR ?auto_188485 ) ( HOLDING ?auto_188487 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188487 )
      ( MAKE-2PILE ?auto_188481 ?auto_188482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188490 - BLOCK
      ?auto_188491 - BLOCK
    )
    :vars
    (
      ?auto_188497 - BLOCK
      ?auto_188498 - BLOCK
      ?auto_188493 - BLOCK
      ?auto_188496 - BLOCK
      ?auto_188494 - BLOCK
      ?auto_188492 - BLOCK
      ?auto_188495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188497 ?auto_188491 ) ( ON-TABLE ?auto_188490 ) ( ON ?auto_188491 ?auto_188490 ) ( not ( = ?auto_188490 ?auto_188491 ) ) ( not ( = ?auto_188490 ?auto_188497 ) ) ( not ( = ?auto_188491 ?auto_188497 ) ) ( not ( = ?auto_188490 ?auto_188498 ) ) ( not ( = ?auto_188490 ?auto_188493 ) ) ( not ( = ?auto_188491 ?auto_188498 ) ) ( not ( = ?auto_188491 ?auto_188493 ) ) ( not ( = ?auto_188497 ?auto_188498 ) ) ( not ( = ?auto_188497 ?auto_188493 ) ) ( not ( = ?auto_188498 ?auto_188493 ) ) ( ON ?auto_188498 ?auto_188497 ) ( not ( = ?auto_188496 ?auto_188494 ) ) ( not ( = ?auto_188496 ?auto_188492 ) ) ( not ( = ?auto_188496 ?auto_188495 ) ) ( not ( = ?auto_188496 ?auto_188493 ) ) ( not ( = ?auto_188494 ?auto_188492 ) ) ( not ( = ?auto_188494 ?auto_188495 ) ) ( not ( = ?auto_188494 ?auto_188493 ) ) ( not ( = ?auto_188492 ?auto_188495 ) ) ( not ( = ?auto_188492 ?auto_188493 ) ) ( not ( = ?auto_188495 ?auto_188493 ) ) ( not ( = ?auto_188490 ?auto_188495 ) ) ( not ( = ?auto_188490 ?auto_188496 ) ) ( not ( = ?auto_188490 ?auto_188494 ) ) ( not ( = ?auto_188490 ?auto_188492 ) ) ( not ( = ?auto_188491 ?auto_188495 ) ) ( not ( = ?auto_188491 ?auto_188496 ) ) ( not ( = ?auto_188491 ?auto_188494 ) ) ( not ( = ?auto_188491 ?auto_188492 ) ) ( not ( = ?auto_188497 ?auto_188495 ) ) ( not ( = ?auto_188497 ?auto_188496 ) ) ( not ( = ?auto_188497 ?auto_188494 ) ) ( not ( = ?auto_188497 ?auto_188492 ) ) ( not ( = ?auto_188498 ?auto_188495 ) ) ( not ( = ?auto_188498 ?auto_188496 ) ) ( not ( = ?auto_188498 ?auto_188494 ) ) ( not ( = ?auto_188498 ?auto_188492 ) ) ( ON ?auto_188493 ?auto_188498 ) ( ON ?auto_188495 ?auto_188493 ) ( ON ?auto_188492 ?auto_188495 ) ( ON ?auto_188494 ?auto_188492 ) ( ON ?auto_188496 ?auto_188494 ) ( CLEAR ?auto_188496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188490 ?auto_188491 ?auto_188497 ?auto_188498 ?auto_188493 ?auto_188495 ?auto_188492 ?auto_188494 )
      ( MAKE-2PILE ?auto_188490 ?auto_188491 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188506 - BLOCK
      ?auto_188507 - BLOCK
      ?auto_188508 - BLOCK
      ?auto_188509 - BLOCK
      ?auto_188510 - BLOCK
      ?auto_188511 - BLOCK
      ?auto_188512 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188512 ) ( CLEAR ?auto_188511 ) ( ON-TABLE ?auto_188506 ) ( ON ?auto_188507 ?auto_188506 ) ( ON ?auto_188508 ?auto_188507 ) ( ON ?auto_188509 ?auto_188508 ) ( ON ?auto_188510 ?auto_188509 ) ( ON ?auto_188511 ?auto_188510 ) ( not ( = ?auto_188506 ?auto_188507 ) ) ( not ( = ?auto_188506 ?auto_188508 ) ) ( not ( = ?auto_188506 ?auto_188509 ) ) ( not ( = ?auto_188506 ?auto_188510 ) ) ( not ( = ?auto_188506 ?auto_188511 ) ) ( not ( = ?auto_188506 ?auto_188512 ) ) ( not ( = ?auto_188507 ?auto_188508 ) ) ( not ( = ?auto_188507 ?auto_188509 ) ) ( not ( = ?auto_188507 ?auto_188510 ) ) ( not ( = ?auto_188507 ?auto_188511 ) ) ( not ( = ?auto_188507 ?auto_188512 ) ) ( not ( = ?auto_188508 ?auto_188509 ) ) ( not ( = ?auto_188508 ?auto_188510 ) ) ( not ( = ?auto_188508 ?auto_188511 ) ) ( not ( = ?auto_188508 ?auto_188512 ) ) ( not ( = ?auto_188509 ?auto_188510 ) ) ( not ( = ?auto_188509 ?auto_188511 ) ) ( not ( = ?auto_188509 ?auto_188512 ) ) ( not ( = ?auto_188510 ?auto_188511 ) ) ( not ( = ?auto_188510 ?auto_188512 ) ) ( not ( = ?auto_188511 ?auto_188512 ) ) )
    :subtasks
    ( ( !STACK ?auto_188512 ?auto_188511 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188513 - BLOCK
      ?auto_188514 - BLOCK
      ?auto_188515 - BLOCK
      ?auto_188516 - BLOCK
      ?auto_188517 - BLOCK
      ?auto_188518 - BLOCK
      ?auto_188519 - BLOCK
    )
    :vars
    (
      ?auto_188520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188518 ) ( ON-TABLE ?auto_188513 ) ( ON ?auto_188514 ?auto_188513 ) ( ON ?auto_188515 ?auto_188514 ) ( ON ?auto_188516 ?auto_188515 ) ( ON ?auto_188517 ?auto_188516 ) ( ON ?auto_188518 ?auto_188517 ) ( not ( = ?auto_188513 ?auto_188514 ) ) ( not ( = ?auto_188513 ?auto_188515 ) ) ( not ( = ?auto_188513 ?auto_188516 ) ) ( not ( = ?auto_188513 ?auto_188517 ) ) ( not ( = ?auto_188513 ?auto_188518 ) ) ( not ( = ?auto_188513 ?auto_188519 ) ) ( not ( = ?auto_188514 ?auto_188515 ) ) ( not ( = ?auto_188514 ?auto_188516 ) ) ( not ( = ?auto_188514 ?auto_188517 ) ) ( not ( = ?auto_188514 ?auto_188518 ) ) ( not ( = ?auto_188514 ?auto_188519 ) ) ( not ( = ?auto_188515 ?auto_188516 ) ) ( not ( = ?auto_188515 ?auto_188517 ) ) ( not ( = ?auto_188515 ?auto_188518 ) ) ( not ( = ?auto_188515 ?auto_188519 ) ) ( not ( = ?auto_188516 ?auto_188517 ) ) ( not ( = ?auto_188516 ?auto_188518 ) ) ( not ( = ?auto_188516 ?auto_188519 ) ) ( not ( = ?auto_188517 ?auto_188518 ) ) ( not ( = ?auto_188517 ?auto_188519 ) ) ( not ( = ?auto_188518 ?auto_188519 ) ) ( ON ?auto_188519 ?auto_188520 ) ( CLEAR ?auto_188519 ) ( HAND-EMPTY ) ( not ( = ?auto_188513 ?auto_188520 ) ) ( not ( = ?auto_188514 ?auto_188520 ) ) ( not ( = ?auto_188515 ?auto_188520 ) ) ( not ( = ?auto_188516 ?auto_188520 ) ) ( not ( = ?auto_188517 ?auto_188520 ) ) ( not ( = ?auto_188518 ?auto_188520 ) ) ( not ( = ?auto_188519 ?auto_188520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188519 ?auto_188520 )
      ( MAKE-7PILE ?auto_188513 ?auto_188514 ?auto_188515 ?auto_188516 ?auto_188517 ?auto_188518 ?auto_188519 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188521 - BLOCK
      ?auto_188522 - BLOCK
      ?auto_188523 - BLOCK
      ?auto_188524 - BLOCK
      ?auto_188525 - BLOCK
      ?auto_188526 - BLOCK
      ?auto_188527 - BLOCK
    )
    :vars
    (
      ?auto_188528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188521 ) ( ON ?auto_188522 ?auto_188521 ) ( ON ?auto_188523 ?auto_188522 ) ( ON ?auto_188524 ?auto_188523 ) ( ON ?auto_188525 ?auto_188524 ) ( not ( = ?auto_188521 ?auto_188522 ) ) ( not ( = ?auto_188521 ?auto_188523 ) ) ( not ( = ?auto_188521 ?auto_188524 ) ) ( not ( = ?auto_188521 ?auto_188525 ) ) ( not ( = ?auto_188521 ?auto_188526 ) ) ( not ( = ?auto_188521 ?auto_188527 ) ) ( not ( = ?auto_188522 ?auto_188523 ) ) ( not ( = ?auto_188522 ?auto_188524 ) ) ( not ( = ?auto_188522 ?auto_188525 ) ) ( not ( = ?auto_188522 ?auto_188526 ) ) ( not ( = ?auto_188522 ?auto_188527 ) ) ( not ( = ?auto_188523 ?auto_188524 ) ) ( not ( = ?auto_188523 ?auto_188525 ) ) ( not ( = ?auto_188523 ?auto_188526 ) ) ( not ( = ?auto_188523 ?auto_188527 ) ) ( not ( = ?auto_188524 ?auto_188525 ) ) ( not ( = ?auto_188524 ?auto_188526 ) ) ( not ( = ?auto_188524 ?auto_188527 ) ) ( not ( = ?auto_188525 ?auto_188526 ) ) ( not ( = ?auto_188525 ?auto_188527 ) ) ( not ( = ?auto_188526 ?auto_188527 ) ) ( ON ?auto_188527 ?auto_188528 ) ( CLEAR ?auto_188527 ) ( not ( = ?auto_188521 ?auto_188528 ) ) ( not ( = ?auto_188522 ?auto_188528 ) ) ( not ( = ?auto_188523 ?auto_188528 ) ) ( not ( = ?auto_188524 ?auto_188528 ) ) ( not ( = ?auto_188525 ?auto_188528 ) ) ( not ( = ?auto_188526 ?auto_188528 ) ) ( not ( = ?auto_188527 ?auto_188528 ) ) ( HOLDING ?auto_188526 ) ( CLEAR ?auto_188525 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188521 ?auto_188522 ?auto_188523 ?auto_188524 ?auto_188525 ?auto_188526 )
      ( MAKE-7PILE ?auto_188521 ?auto_188522 ?auto_188523 ?auto_188524 ?auto_188525 ?auto_188526 ?auto_188527 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188529 - BLOCK
      ?auto_188530 - BLOCK
      ?auto_188531 - BLOCK
      ?auto_188532 - BLOCK
      ?auto_188533 - BLOCK
      ?auto_188534 - BLOCK
      ?auto_188535 - BLOCK
    )
    :vars
    (
      ?auto_188536 - BLOCK
      ?auto_188537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188529 ) ( ON ?auto_188530 ?auto_188529 ) ( ON ?auto_188531 ?auto_188530 ) ( ON ?auto_188532 ?auto_188531 ) ( ON ?auto_188533 ?auto_188532 ) ( not ( = ?auto_188529 ?auto_188530 ) ) ( not ( = ?auto_188529 ?auto_188531 ) ) ( not ( = ?auto_188529 ?auto_188532 ) ) ( not ( = ?auto_188529 ?auto_188533 ) ) ( not ( = ?auto_188529 ?auto_188534 ) ) ( not ( = ?auto_188529 ?auto_188535 ) ) ( not ( = ?auto_188530 ?auto_188531 ) ) ( not ( = ?auto_188530 ?auto_188532 ) ) ( not ( = ?auto_188530 ?auto_188533 ) ) ( not ( = ?auto_188530 ?auto_188534 ) ) ( not ( = ?auto_188530 ?auto_188535 ) ) ( not ( = ?auto_188531 ?auto_188532 ) ) ( not ( = ?auto_188531 ?auto_188533 ) ) ( not ( = ?auto_188531 ?auto_188534 ) ) ( not ( = ?auto_188531 ?auto_188535 ) ) ( not ( = ?auto_188532 ?auto_188533 ) ) ( not ( = ?auto_188532 ?auto_188534 ) ) ( not ( = ?auto_188532 ?auto_188535 ) ) ( not ( = ?auto_188533 ?auto_188534 ) ) ( not ( = ?auto_188533 ?auto_188535 ) ) ( not ( = ?auto_188534 ?auto_188535 ) ) ( ON ?auto_188535 ?auto_188536 ) ( not ( = ?auto_188529 ?auto_188536 ) ) ( not ( = ?auto_188530 ?auto_188536 ) ) ( not ( = ?auto_188531 ?auto_188536 ) ) ( not ( = ?auto_188532 ?auto_188536 ) ) ( not ( = ?auto_188533 ?auto_188536 ) ) ( not ( = ?auto_188534 ?auto_188536 ) ) ( not ( = ?auto_188535 ?auto_188536 ) ) ( CLEAR ?auto_188533 ) ( ON ?auto_188534 ?auto_188535 ) ( CLEAR ?auto_188534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188537 ) ( ON ?auto_188536 ?auto_188537 ) ( not ( = ?auto_188537 ?auto_188536 ) ) ( not ( = ?auto_188537 ?auto_188535 ) ) ( not ( = ?auto_188537 ?auto_188534 ) ) ( not ( = ?auto_188529 ?auto_188537 ) ) ( not ( = ?auto_188530 ?auto_188537 ) ) ( not ( = ?auto_188531 ?auto_188537 ) ) ( not ( = ?auto_188532 ?auto_188537 ) ) ( not ( = ?auto_188533 ?auto_188537 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188537 ?auto_188536 ?auto_188535 )
      ( MAKE-7PILE ?auto_188529 ?auto_188530 ?auto_188531 ?auto_188532 ?auto_188533 ?auto_188534 ?auto_188535 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188538 - BLOCK
      ?auto_188539 - BLOCK
      ?auto_188540 - BLOCK
      ?auto_188541 - BLOCK
      ?auto_188542 - BLOCK
      ?auto_188543 - BLOCK
      ?auto_188544 - BLOCK
    )
    :vars
    (
      ?auto_188546 - BLOCK
      ?auto_188545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188538 ) ( ON ?auto_188539 ?auto_188538 ) ( ON ?auto_188540 ?auto_188539 ) ( ON ?auto_188541 ?auto_188540 ) ( not ( = ?auto_188538 ?auto_188539 ) ) ( not ( = ?auto_188538 ?auto_188540 ) ) ( not ( = ?auto_188538 ?auto_188541 ) ) ( not ( = ?auto_188538 ?auto_188542 ) ) ( not ( = ?auto_188538 ?auto_188543 ) ) ( not ( = ?auto_188538 ?auto_188544 ) ) ( not ( = ?auto_188539 ?auto_188540 ) ) ( not ( = ?auto_188539 ?auto_188541 ) ) ( not ( = ?auto_188539 ?auto_188542 ) ) ( not ( = ?auto_188539 ?auto_188543 ) ) ( not ( = ?auto_188539 ?auto_188544 ) ) ( not ( = ?auto_188540 ?auto_188541 ) ) ( not ( = ?auto_188540 ?auto_188542 ) ) ( not ( = ?auto_188540 ?auto_188543 ) ) ( not ( = ?auto_188540 ?auto_188544 ) ) ( not ( = ?auto_188541 ?auto_188542 ) ) ( not ( = ?auto_188541 ?auto_188543 ) ) ( not ( = ?auto_188541 ?auto_188544 ) ) ( not ( = ?auto_188542 ?auto_188543 ) ) ( not ( = ?auto_188542 ?auto_188544 ) ) ( not ( = ?auto_188543 ?auto_188544 ) ) ( ON ?auto_188544 ?auto_188546 ) ( not ( = ?auto_188538 ?auto_188546 ) ) ( not ( = ?auto_188539 ?auto_188546 ) ) ( not ( = ?auto_188540 ?auto_188546 ) ) ( not ( = ?auto_188541 ?auto_188546 ) ) ( not ( = ?auto_188542 ?auto_188546 ) ) ( not ( = ?auto_188543 ?auto_188546 ) ) ( not ( = ?auto_188544 ?auto_188546 ) ) ( ON ?auto_188543 ?auto_188544 ) ( CLEAR ?auto_188543 ) ( ON-TABLE ?auto_188545 ) ( ON ?auto_188546 ?auto_188545 ) ( not ( = ?auto_188545 ?auto_188546 ) ) ( not ( = ?auto_188545 ?auto_188544 ) ) ( not ( = ?auto_188545 ?auto_188543 ) ) ( not ( = ?auto_188538 ?auto_188545 ) ) ( not ( = ?auto_188539 ?auto_188545 ) ) ( not ( = ?auto_188540 ?auto_188545 ) ) ( not ( = ?auto_188541 ?auto_188545 ) ) ( not ( = ?auto_188542 ?auto_188545 ) ) ( HOLDING ?auto_188542 ) ( CLEAR ?auto_188541 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188538 ?auto_188539 ?auto_188540 ?auto_188541 ?auto_188542 )
      ( MAKE-7PILE ?auto_188538 ?auto_188539 ?auto_188540 ?auto_188541 ?auto_188542 ?auto_188543 ?auto_188544 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188547 - BLOCK
      ?auto_188548 - BLOCK
      ?auto_188549 - BLOCK
      ?auto_188550 - BLOCK
      ?auto_188551 - BLOCK
      ?auto_188552 - BLOCK
      ?auto_188553 - BLOCK
    )
    :vars
    (
      ?auto_188554 - BLOCK
      ?auto_188555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188547 ) ( ON ?auto_188548 ?auto_188547 ) ( ON ?auto_188549 ?auto_188548 ) ( ON ?auto_188550 ?auto_188549 ) ( not ( = ?auto_188547 ?auto_188548 ) ) ( not ( = ?auto_188547 ?auto_188549 ) ) ( not ( = ?auto_188547 ?auto_188550 ) ) ( not ( = ?auto_188547 ?auto_188551 ) ) ( not ( = ?auto_188547 ?auto_188552 ) ) ( not ( = ?auto_188547 ?auto_188553 ) ) ( not ( = ?auto_188548 ?auto_188549 ) ) ( not ( = ?auto_188548 ?auto_188550 ) ) ( not ( = ?auto_188548 ?auto_188551 ) ) ( not ( = ?auto_188548 ?auto_188552 ) ) ( not ( = ?auto_188548 ?auto_188553 ) ) ( not ( = ?auto_188549 ?auto_188550 ) ) ( not ( = ?auto_188549 ?auto_188551 ) ) ( not ( = ?auto_188549 ?auto_188552 ) ) ( not ( = ?auto_188549 ?auto_188553 ) ) ( not ( = ?auto_188550 ?auto_188551 ) ) ( not ( = ?auto_188550 ?auto_188552 ) ) ( not ( = ?auto_188550 ?auto_188553 ) ) ( not ( = ?auto_188551 ?auto_188552 ) ) ( not ( = ?auto_188551 ?auto_188553 ) ) ( not ( = ?auto_188552 ?auto_188553 ) ) ( ON ?auto_188553 ?auto_188554 ) ( not ( = ?auto_188547 ?auto_188554 ) ) ( not ( = ?auto_188548 ?auto_188554 ) ) ( not ( = ?auto_188549 ?auto_188554 ) ) ( not ( = ?auto_188550 ?auto_188554 ) ) ( not ( = ?auto_188551 ?auto_188554 ) ) ( not ( = ?auto_188552 ?auto_188554 ) ) ( not ( = ?auto_188553 ?auto_188554 ) ) ( ON ?auto_188552 ?auto_188553 ) ( ON-TABLE ?auto_188555 ) ( ON ?auto_188554 ?auto_188555 ) ( not ( = ?auto_188555 ?auto_188554 ) ) ( not ( = ?auto_188555 ?auto_188553 ) ) ( not ( = ?auto_188555 ?auto_188552 ) ) ( not ( = ?auto_188547 ?auto_188555 ) ) ( not ( = ?auto_188548 ?auto_188555 ) ) ( not ( = ?auto_188549 ?auto_188555 ) ) ( not ( = ?auto_188550 ?auto_188555 ) ) ( not ( = ?auto_188551 ?auto_188555 ) ) ( CLEAR ?auto_188550 ) ( ON ?auto_188551 ?auto_188552 ) ( CLEAR ?auto_188551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188555 ?auto_188554 ?auto_188553 ?auto_188552 )
      ( MAKE-7PILE ?auto_188547 ?auto_188548 ?auto_188549 ?auto_188550 ?auto_188551 ?auto_188552 ?auto_188553 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188556 - BLOCK
      ?auto_188557 - BLOCK
      ?auto_188558 - BLOCK
      ?auto_188559 - BLOCK
      ?auto_188560 - BLOCK
      ?auto_188561 - BLOCK
      ?auto_188562 - BLOCK
    )
    :vars
    (
      ?auto_188564 - BLOCK
      ?auto_188563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188556 ) ( ON ?auto_188557 ?auto_188556 ) ( ON ?auto_188558 ?auto_188557 ) ( not ( = ?auto_188556 ?auto_188557 ) ) ( not ( = ?auto_188556 ?auto_188558 ) ) ( not ( = ?auto_188556 ?auto_188559 ) ) ( not ( = ?auto_188556 ?auto_188560 ) ) ( not ( = ?auto_188556 ?auto_188561 ) ) ( not ( = ?auto_188556 ?auto_188562 ) ) ( not ( = ?auto_188557 ?auto_188558 ) ) ( not ( = ?auto_188557 ?auto_188559 ) ) ( not ( = ?auto_188557 ?auto_188560 ) ) ( not ( = ?auto_188557 ?auto_188561 ) ) ( not ( = ?auto_188557 ?auto_188562 ) ) ( not ( = ?auto_188558 ?auto_188559 ) ) ( not ( = ?auto_188558 ?auto_188560 ) ) ( not ( = ?auto_188558 ?auto_188561 ) ) ( not ( = ?auto_188558 ?auto_188562 ) ) ( not ( = ?auto_188559 ?auto_188560 ) ) ( not ( = ?auto_188559 ?auto_188561 ) ) ( not ( = ?auto_188559 ?auto_188562 ) ) ( not ( = ?auto_188560 ?auto_188561 ) ) ( not ( = ?auto_188560 ?auto_188562 ) ) ( not ( = ?auto_188561 ?auto_188562 ) ) ( ON ?auto_188562 ?auto_188564 ) ( not ( = ?auto_188556 ?auto_188564 ) ) ( not ( = ?auto_188557 ?auto_188564 ) ) ( not ( = ?auto_188558 ?auto_188564 ) ) ( not ( = ?auto_188559 ?auto_188564 ) ) ( not ( = ?auto_188560 ?auto_188564 ) ) ( not ( = ?auto_188561 ?auto_188564 ) ) ( not ( = ?auto_188562 ?auto_188564 ) ) ( ON ?auto_188561 ?auto_188562 ) ( ON-TABLE ?auto_188563 ) ( ON ?auto_188564 ?auto_188563 ) ( not ( = ?auto_188563 ?auto_188564 ) ) ( not ( = ?auto_188563 ?auto_188562 ) ) ( not ( = ?auto_188563 ?auto_188561 ) ) ( not ( = ?auto_188556 ?auto_188563 ) ) ( not ( = ?auto_188557 ?auto_188563 ) ) ( not ( = ?auto_188558 ?auto_188563 ) ) ( not ( = ?auto_188559 ?auto_188563 ) ) ( not ( = ?auto_188560 ?auto_188563 ) ) ( ON ?auto_188560 ?auto_188561 ) ( CLEAR ?auto_188560 ) ( HOLDING ?auto_188559 ) ( CLEAR ?auto_188558 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188556 ?auto_188557 ?auto_188558 ?auto_188559 )
      ( MAKE-7PILE ?auto_188556 ?auto_188557 ?auto_188558 ?auto_188559 ?auto_188560 ?auto_188561 ?auto_188562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188565 - BLOCK
      ?auto_188566 - BLOCK
      ?auto_188567 - BLOCK
      ?auto_188568 - BLOCK
      ?auto_188569 - BLOCK
      ?auto_188570 - BLOCK
      ?auto_188571 - BLOCK
    )
    :vars
    (
      ?auto_188573 - BLOCK
      ?auto_188572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188565 ) ( ON ?auto_188566 ?auto_188565 ) ( ON ?auto_188567 ?auto_188566 ) ( not ( = ?auto_188565 ?auto_188566 ) ) ( not ( = ?auto_188565 ?auto_188567 ) ) ( not ( = ?auto_188565 ?auto_188568 ) ) ( not ( = ?auto_188565 ?auto_188569 ) ) ( not ( = ?auto_188565 ?auto_188570 ) ) ( not ( = ?auto_188565 ?auto_188571 ) ) ( not ( = ?auto_188566 ?auto_188567 ) ) ( not ( = ?auto_188566 ?auto_188568 ) ) ( not ( = ?auto_188566 ?auto_188569 ) ) ( not ( = ?auto_188566 ?auto_188570 ) ) ( not ( = ?auto_188566 ?auto_188571 ) ) ( not ( = ?auto_188567 ?auto_188568 ) ) ( not ( = ?auto_188567 ?auto_188569 ) ) ( not ( = ?auto_188567 ?auto_188570 ) ) ( not ( = ?auto_188567 ?auto_188571 ) ) ( not ( = ?auto_188568 ?auto_188569 ) ) ( not ( = ?auto_188568 ?auto_188570 ) ) ( not ( = ?auto_188568 ?auto_188571 ) ) ( not ( = ?auto_188569 ?auto_188570 ) ) ( not ( = ?auto_188569 ?auto_188571 ) ) ( not ( = ?auto_188570 ?auto_188571 ) ) ( ON ?auto_188571 ?auto_188573 ) ( not ( = ?auto_188565 ?auto_188573 ) ) ( not ( = ?auto_188566 ?auto_188573 ) ) ( not ( = ?auto_188567 ?auto_188573 ) ) ( not ( = ?auto_188568 ?auto_188573 ) ) ( not ( = ?auto_188569 ?auto_188573 ) ) ( not ( = ?auto_188570 ?auto_188573 ) ) ( not ( = ?auto_188571 ?auto_188573 ) ) ( ON ?auto_188570 ?auto_188571 ) ( ON-TABLE ?auto_188572 ) ( ON ?auto_188573 ?auto_188572 ) ( not ( = ?auto_188572 ?auto_188573 ) ) ( not ( = ?auto_188572 ?auto_188571 ) ) ( not ( = ?auto_188572 ?auto_188570 ) ) ( not ( = ?auto_188565 ?auto_188572 ) ) ( not ( = ?auto_188566 ?auto_188572 ) ) ( not ( = ?auto_188567 ?auto_188572 ) ) ( not ( = ?auto_188568 ?auto_188572 ) ) ( not ( = ?auto_188569 ?auto_188572 ) ) ( ON ?auto_188569 ?auto_188570 ) ( CLEAR ?auto_188567 ) ( ON ?auto_188568 ?auto_188569 ) ( CLEAR ?auto_188568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188572 ?auto_188573 ?auto_188571 ?auto_188570 ?auto_188569 )
      ( MAKE-7PILE ?auto_188565 ?auto_188566 ?auto_188567 ?auto_188568 ?auto_188569 ?auto_188570 ?auto_188571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188574 - BLOCK
      ?auto_188575 - BLOCK
      ?auto_188576 - BLOCK
      ?auto_188577 - BLOCK
      ?auto_188578 - BLOCK
      ?auto_188579 - BLOCK
      ?auto_188580 - BLOCK
    )
    :vars
    (
      ?auto_188582 - BLOCK
      ?auto_188581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188574 ) ( ON ?auto_188575 ?auto_188574 ) ( not ( = ?auto_188574 ?auto_188575 ) ) ( not ( = ?auto_188574 ?auto_188576 ) ) ( not ( = ?auto_188574 ?auto_188577 ) ) ( not ( = ?auto_188574 ?auto_188578 ) ) ( not ( = ?auto_188574 ?auto_188579 ) ) ( not ( = ?auto_188574 ?auto_188580 ) ) ( not ( = ?auto_188575 ?auto_188576 ) ) ( not ( = ?auto_188575 ?auto_188577 ) ) ( not ( = ?auto_188575 ?auto_188578 ) ) ( not ( = ?auto_188575 ?auto_188579 ) ) ( not ( = ?auto_188575 ?auto_188580 ) ) ( not ( = ?auto_188576 ?auto_188577 ) ) ( not ( = ?auto_188576 ?auto_188578 ) ) ( not ( = ?auto_188576 ?auto_188579 ) ) ( not ( = ?auto_188576 ?auto_188580 ) ) ( not ( = ?auto_188577 ?auto_188578 ) ) ( not ( = ?auto_188577 ?auto_188579 ) ) ( not ( = ?auto_188577 ?auto_188580 ) ) ( not ( = ?auto_188578 ?auto_188579 ) ) ( not ( = ?auto_188578 ?auto_188580 ) ) ( not ( = ?auto_188579 ?auto_188580 ) ) ( ON ?auto_188580 ?auto_188582 ) ( not ( = ?auto_188574 ?auto_188582 ) ) ( not ( = ?auto_188575 ?auto_188582 ) ) ( not ( = ?auto_188576 ?auto_188582 ) ) ( not ( = ?auto_188577 ?auto_188582 ) ) ( not ( = ?auto_188578 ?auto_188582 ) ) ( not ( = ?auto_188579 ?auto_188582 ) ) ( not ( = ?auto_188580 ?auto_188582 ) ) ( ON ?auto_188579 ?auto_188580 ) ( ON-TABLE ?auto_188581 ) ( ON ?auto_188582 ?auto_188581 ) ( not ( = ?auto_188581 ?auto_188582 ) ) ( not ( = ?auto_188581 ?auto_188580 ) ) ( not ( = ?auto_188581 ?auto_188579 ) ) ( not ( = ?auto_188574 ?auto_188581 ) ) ( not ( = ?auto_188575 ?auto_188581 ) ) ( not ( = ?auto_188576 ?auto_188581 ) ) ( not ( = ?auto_188577 ?auto_188581 ) ) ( not ( = ?auto_188578 ?auto_188581 ) ) ( ON ?auto_188578 ?auto_188579 ) ( ON ?auto_188577 ?auto_188578 ) ( CLEAR ?auto_188577 ) ( HOLDING ?auto_188576 ) ( CLEAR ?auto_188575 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188574 ?auto_188575 ?auto_188576 )
      ( MAKE-7PILE ?auto_188574 ?auto_188575 ?auto_188576 ?auto_188577 ?auto_188578 ?auto_188579 ?auto_188580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188583 - BLOCK
      ?auto_188584 - BLOCK
      ?auto_188585 - BLOCK
      ?auto_188586 - BLOCK
      ?auto_188587 - BLOCK
      ?auto_188588 - BLOCK
      ?auto_188589 - BLOCK
    )
    :vars
    (
      ?auto_188591 - BLOCK
      ?auto_188590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188583 ) ( ON ?auto_188584 ?auto_188583 ) ( not ( = ?auto_188583 ?auto_188584 ) ) ( not ( = ?auto_188583 ?auto_188585 ) ) ( not ( = ?auto_188583 ?auto_188586 ) ) ( not ( = ?auto_188583 ?auto_188587 ) ) ( not ( = ?auto_188583 ?auto_188588 ) ) ( not ( = ?auto_188583 ?auto_188589 ) ) ( not ( = ?auto_188584 ?auto_188585 ) ) ( not ( = ?auto_188584 ?auto_188586 ) ) ( not ( = ?auto_188584 ?auto_188587 ) ) ( not ( = ?auto_188584 ?auto_188588 ) ) ( not ( = ?auto_188584 ?auto_188589 ) ) ( not ( = ?auto_188585 ?auto_188586 ) ) ( not ( = ?auto_188585 ?auto_188587 ) ) ( not ( = ?auto_188585 ?auto_188588 ) ) ( not ( = ?auto_188585 ?auto_188589 ) ) ( not ( = ?auto_188586 ?auto_188587 ) ) ( not ( = ?auto_188586 ?auto_188588 ) ) ( not ( = ?auto_188586 ?auto_188589 ) ) ( not ( = ?auto_188587 ?auto_188588 ) ) ( not ( = ?auto_188587 ?auto_188589 ) ) ( not ( = ?auto_188588 ?auto_188589 ) ) ( ON ?auto_188589 ?auto_188591 ) ( not ( = ?auto_188583 ?auto_188591 ) ) ( not ( = ?auto_188584 ?auto_188591 ) ) ( not ( = ?auto_188585 ?auto_188591 ) ) ( not ( = ?auto_188586 ?auto_188591 ) ) ( not ( = ?auto_188587 ?auto_188591 ) ) ( not ( = ?auto_188588 ?auto_188591 ) ) ( not ( = ?auto_188589 ?auto_188591 ) ) ( ON ?auto_188588 ?auto_188589 ) ( ON-TABLE ?auto_188590 ) ( ON ?auto_188591 ?auto_188590 ) ( not ( = ?auto_188590 ?auto_188591 ) ) ( not ( = ?auto_188590 ?auto_188589 ) ) ( not ( = ?auto_188590 ?auto_188588 ) ) ( not ( = ?auto_188583 ?auto_188590 ) ) ( not ( = ?auto_188584 ?auto_188590 ) ) ( not ( = ?auto_188585 ?auto_188590 ) ) ( not ( = ?auto_188586 ?auto_188590 ) ) ( not ( = ?auto_188587 ?auto_188590 ) ) ( ON ?auto_188587 ?auto_188588 ) ( ON ?auto_188586 ?auto_188587 ) ( CLEAR ?auto_188584 ) ( ON ?auto_188585 ?auto_188586 ) ( CLEAR ?auto_188585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188590 ?auto_188591 ?auto_188589 ?auto_188588 ?auto_188587 ?auto_188586 )
      ( MAKE-7PILE ?auto_188583 ?auto_188584 ?auto_188585 ?auto_188586 ?auto_188587 ?auto_188588 ?auto_188589 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188592 - BLOCK
      ?auto_188593 - BLOCK
      ?auto_188594 - BLOCK
      ?auto_188595 - BLOCK
      ?auto_188596 - BLOCK
      ?auto_188597 - BLOCK
      ?auto_188598 - BLOCK
    )
    :vars
    (
      ?auto_188600 - BLOCK
      ?auto_188599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188592 ) ( not ( = ?auto_188592 ?auto_188593 ) ) ( not ( = ?auto_188592 ?auto_188594 ) ) ( not ( = ?auto_188592 ?auto_188595 ) ) ( not ( = ?auto_188592 ?auto_188596 ) ) ( not ( = ?auto_188592 ?auto_188597 ) ) ( not ( = ?auto_188592 ?auto_188598 ) ) ( not ( = ?auto_188593 ?auto_188594 ) ) ( not ( = ?auto_188593 ?auto_188595 ) ) ( not ( = ?auto_188593 ?auto_188596 ) ) ( not ( = ?auto_188593 ?auto_188597 ) ) ( not ( = ?auto_188593 ?auto_188598 ) ) ( not ( = ?auto_188594 ?auto_188595 ) ) ( not ( = ?auto_188594 ?auto_188596 ) ) ( not ( = ?auto_188594 ?auto_188597 ) ) ( not ( = ?auto_188594 ?auto_188598 ) ) ( not ( = ?auto_188595 ?auto_188596 ) ) ( not ( = ?auto_188595 ?auto_188597 ) ) ( not ( = ?auto_188595 ?auto_188598 ) ) ( not ( = ?auto_188596 ?auto_188597 ) ) ( not ( = ?auto_188596 ?auto_188598 ) ) ( not ( = ?auto_188597 ?auto_188598 ) ) ( ON ?auto_188598 ?auto_188600 ) ( not ( = ?auto_188592 ?auto_188600 ) ) ( not ( = ?auto_188593 ?auto_188600 ) ) ( not ( = ?auto_188594 ?auto_188600 ) ) ( not ( = ?auto_188595 ?auto_188600 ) ) ( not ( = ?auto_188596 ?auto_188600 ) ) ( not ( = ?auto_188597 ?auto_188600 ) ) ( not ( = ?auto_188598 ?auto_188600 ) ) ( ON ?auto_188597 ?auto_188598 ) ( ON-TABLE ?auto_188599 ) ( ON ?auto_188600 ?auto_188599 ) ( not ( = ?auto_188599 ?auto_188600 ) ) ( not ( = ?auto_188599 ?auto_188598 ) ) ( not ( = ?auto_188599 ?auto_188597 ) ) ( not ( = ?auto_188592 ?auto_188599 ) ) ( not ( = ?auto_188593 ?auto_188599 ) ) ( not ( = ?auto_188594 ?auto_188599 ) ) ( not ( = ?auto_188595 ?auto_188599 ) ) ( not ( = ?auto_188596 ?auto_188599 ) ) ( ON ?auto_188596 ?auto_188597 ) ( ON ?auto_188595 ?auto_188596 ) ( ON ?auto_188594 ?auto_188595 ) ( CLEAR ?auto_188594 ) ( HOLDING ?auto_188593 ) ( CLEAR ?auto_188592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188592 ?auto_188593 )
      ( MAKE-7PILE ?auto_188592 ?auto_188593 ?auto_188594 ?auto_188595 ?auto_188596 ?auto_188597 ?auto_188598 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188601 - BLOCK
      ?auto_188602 - BLOCK
      ?auto_188603 - BLOCK
      ?auto_188604 - BLOCK
      ?auto_188605 - BLOCK
      ?auto_188606 - BLOCK
      ?auto_188607 - BLOCK
    )
    :vars
    (
      ?auto_188609 - BLOCK
      ?auto_188608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188601 ) ( not ( = ?auto_188601 ?auto_188602 ) ) ( not ( = ?auto_188601 ?auto_188603 ) ) ( not ( = ?auto_188601 ?auto_188604 ) ) ( not ( = ?auto_188601 ?auto_188605 ) ) ( not ( = ?auto_188601 ?auto_188606 ) ) ( not ( = ?auto_188601 ?auto_188607 ) ) ( not ( = ?auto_188602 ?auto_188603 ) ) ( not ( = ?auto_188602 ?auto_188604 ) ) ( not ( = ?auto_188602 ?auto_188605 ) ) ( not ( = ?auto_188602 ?auto_188606 ) ) ( not ( = ?auto_188602 ?auto_188607 ) ) ( not ( = ?auto_188603 ?auto_188604 ) ) ( not ( = ?auto_188603 ?auto_188605 ) ) ( not ( = ?auto_188603 ?auto_188606 ) ) ( not ( = ?auto_188603 ?auto_188607 ) ) ( not ( = ?auto_188604 ?auto_188605 ) ) ( not ( = ?auto_188604 ?auto_188606 ) ) ( not ( = ?auto_188604 ?auto_188607 ) ) ( not ( = ?auto_188605 ?auto_188606 ) ) ( not ( = ?auto_188605 ?auto_188607 ) ) ( not ( = ?auto_188606 ?auto_188607 ) ) ( ON ?auto_188607 ?auto_188609 ) ( not ( = ?auto_188601 ?auto_188609 ) ) ( not ( = ?auto_188602 ?auto_188609 ) ) ( not ( = ?auto_188603 ?auto_188609 ) ) ( not ( = ?auto_188604 ?auto_188609 ) ) ( not ( = ?auto_188605 ?auto_188609 ) ) ( not ( = ?auto_188606 ?auto_188609 ) ) ( not ( = ?auto_188607 ?auto_188609 ) ) ( ON ?auto_188606 ?auto_188607 ) ( ON-TABLE ?auto_188608 ) ( ON ?auto_188609 ?auto_188608 ) ( not ( = ?auto_188608 ?auto_188609 ) ) ( not ( = ?auto_188608 ?auto_188607 ) ) ( not ( = ?auto_188608 ?auto_188606 ) ) ( not ( = ?auto_188601 ?auto_188608 ) ) ( not ( = ?auto_188602 ?auto_188608 ) ) ( not ( = ?auto_188603 ?auto_188608 ) ) ( not ( = ?auto_188604 ?auto_188608 ) ) ( not ( = ?auto_188605 ?auto_188608 ) ) ( ON ?auto_188605 ?auto_188606 ) ( ON ?auto_188604 ?auto_188605 ) ( ON ?auto_188603 ?auto_188604 ) ( CLEAR ?auto_188601 ) ( ON ?auto_188602 ?auto_188603 ) ( CLEAR ?auto_188602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188608 ?auto_188609 ?auto_188607 ?auto_188606 ?auto_188605 ?auto_188604 ?auto_188603 )
      ( MAKE-7PILE ?auto_188601 ?auto_188602 ?auto_188603 ?auto_188604 ?auto_188605 ?auto_188606 ?auto_188607 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188610 - BLOCK
      ?auto_188611 - BLOCK
      ?auto_188612 - BLOCK
      ?auto_188613 - BLOCK
      ?auto_188614 - BLOCK
      ?auto_188615 - BLOCK
      ?auto_188616 - BLOCK
    )
    :vars
    (
      ?auto_188617 - BLOCK
      ?auto_188618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188610 ?auto_188611 ) ) ( not ( = ?auto_188610 ?auto_188612 ) ) ( not ( = ?auto_188610 ?auto_188613 ) ) ( not ( = ?auto_188610 ?auto_188614 ) ) ( not ( = ?auto_188610 ?auto_188615 ) ) ( not ( = ?auto_188610 ?auto_188616 ) ) ( not ( = ?auto_188611 ?auto_188612 ) ) ( not ( = ?auto_188611 ?auto_188613 ) ) ( not ( = ?auto_188611 ?auto_188614 ) ) ( not ( = ?auto_188611 ?auto_188615 ) ) ( not ( = ?auto_188611 ?auto_188616 ) ) ( not ( = ?auto_188612 ?auto_188613 ) ) ( not ( = ?auto_188612 ?auto_188614 ) ) ( not ( = ?auto_188612 ?auto_188615 ) ) ( not ( = ?auto_188612 ?auto_188616 ) ) ( not ( = ?auto_188613 ?auto_188614 ) ) ( not ( = ?auto_188613 ?auto_188615 ) ) ( not ( = ?auto_188613 ?auto_188616 ) ) ( not ( = ?auto_188614 ?auto_188615 ) ) ( not ( = ?auto_188614 ?auto_188616 ) ) ( not ( = ?auto_188615 ?auto_188616 ) ) ( ON ?auto_188616 ?auto_188617 ) ( not ( = ?auto_188610 ?auto_188617 ) ) ( not ( = ?auto_188611 ?auto_188617 ) ) ( not ( = ?auto_188612 ?auto_188617 ) ) ( not ( = ?auto_188613 ?auto_188617 ) ) ( not ( = ?auto_188614 ?auto_188617 ) ) ( not ( = ?auto_188615 ?auto_188617 ) ) ( not ( = ?auto_188616 ?auto_188617 ) ) ( ON ?auto_188615 ?auto_188616 ) ( ON-TABLE ?auto_188618 ) ( ON ?auto_188617 ?auto_188618 ) ( not ( = ?auto_188618 ?auto_188617 ) ) ( not ( = ?auto_188618 ?auto_188616 ) ) ( not ( = ?auto_188618 ?auto_188615 ) ) ( not ( = ?auto_188610 ?auto_188618 ) ) ( not ( = ?auto_188611 ?auto_188618 ) ) ( not ( = ?auto_188612 ?auto_188618 ) ) ( not ( = ?auto_188613 ?auto_188618 ) ) ( not ( = ?auto_188614 ?auto_188618 ) ) ( ON ?auto_188614 ?auto_188615 ) ( ON ?auto_188613 ?auto_188614 ) ( ON ?auto_188612 ?auto_188613 ) ( ON ?auto_188611 ?auto_188612 ) ( CLEAR ?auto_188611 ) ( HOLDING ?auto_188610 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188610 )
      ( MAKE-7PILE ?auto_188610 ?auto_188611 ?auto_188612 ?auto_188613 ?auto_188614 ?auto_188615 ?auto_188616 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188619 - BLOCK
      ?auto_188620 - BLOCK
      ?auto_188621 - BLOCK
      ?auto_188622 - BLOCK
      ?auto_188623 - BLOCK
      ?auto_188624 - BLOCK
      ?auto_188625 - BLOCK
    )
    :vars
    (
      ?auto_188627 - BLOCK
      ?auto_188626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188619 ?auto_188620 ) ) ( not ( = ?auto_188619 ?auto_188621 ) ) ( not ( = ?auto_188619 ?auto_188622 ) ) ( not ( = ?auto_188619 ?auto_188623 ) ) ( not ( = ?auto_188619 ?auto_188624 ) ) ( not ( = ?auto_188619 ?auto_188625 ) ) ( not ( = ?auto_188620 ?auto_188621 ) ) ( not ( = ?auto_188620 ?auto_188622 ) ) ( not ( = ?auto_188620 ?auto_188623 ) ) ( not ( = ?auto_188620 ?auto_188624 ) ) ( not ( = ?auto_188620 ?auto_188625 ) ) ( not ( = ?auto_188621 ?auto_188622 ) ) ( not ( = ?auto_188621 ?auto_188623 ) ) ( not ( = ?auto_188621 ?auto_188624 ) ) ( not ( = ?auto_188621 ?auto_188625 ) ) ( not ( = ?auto_188622 ?auto_188623 ) ) ( not ( = ?auto_188622 ?auto_188624 ) ) ( not ( = ?auto_188622 ?auto_188625 ) ) ( not ( = ?auto_188623 ?auto_188624 ) ) ( not ( = ?auto_188623 ?auto_188625 ) ) ( not ( = ?auto_188624 ?auto_188625 ) ) ( ON ?auto_188625 ?auto_188627 ) ( not ( = ?auto_188619 ?auto_188627 ) ) ( not ( = ?auto_188620 ?auto_188627 ) ) ( not ( = ?auto_188621 ?auto_188627 ) ) ( not ( = ?auto_188622 ?auto_188627 ) ) ( not ( = ?auto_188623 ?auto_188627 ) ) ( not ( = ?auto_188624 ?auto_188627 ) ) ( not ( = ?auto_188625 ?auto_188627 ) ) ( ON ?auto_188624 ?auto_188625 ) ( ON-TABLE ?auto_188626 ) ( ON ?auto_188627 ?auto_188626 ) ( not ( = ?auto_188626 ?auto_188627 ) ) ( not ( = ?auto_188626 ?auto_188625 ) ) ( not ( = ?auto_188626 ?auto_188624 ) ) ( not ( = ?auto_188619 ?auto_188626 ) ) ( not ( = ?auto_188620 ?auto_188626 ) ) ( not ( = ?auto_188621 ?auto_188626 ) ) ( not ( = ?auto_188622 ?auto_188626 ) ) ( not ( = ?auto_188623 ?auto_188626 ) ) ( ON ?auto_188623 ?auto_188624 ) ( ON ?auto_188622 ?auto_188623 ) ( ON ?auto_188621 ?auto_188622 ) ( ON ?auto_188620 ?auto_188621 ) ( ON ?auto_188619 ?auto_188620 ) ( CLEAR ?auto_188619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188626 ?auto_188627 ?auto_188625 ?auto_188624 ?auto_188623 ?auto_188622 ?auto_188621 ?auto_188620 )
      ( MAKE-7PILE ?auto_188619 ?auto_188620 ?auto_188621 ?auto_188622 ?auto_188623 ?auto_188624 ?auto_188625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188629 - BLOCK
    )
    :vars
    (
      ?auto_188630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188630 ?auto_188629 ) ( CLEAR ?auto_188630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188629 ) ( not ( = ?auto_188629 ?auto_188630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188630 ?auto_188629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188631 - BLOCK
    )
    :vars
    (
      ?auto_188632 - BLOCK
      ?auto_188633 - BLOCK
      ?auto_188634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188632 ?auto_188631 ) ( CLEAR ?auto_188632 ) ( ON-TABLE ?auto_188631 ) ( not ( = ?auto_188631 ?auto_188632 ) ) ( HOLDING ?auto_188633 ) ( CLEAR ?auto_188634 ) ( not ( = ?auto_188631 ?auto_188633 ) ) ( not ( = ?auto_188631 ?auto_188634 ) ) ( not ( = ?auto_188632 ?auto_188633 ) ) ( not ( = ?auto_188632 ?auto_188634 ) ) ( not ( = ?auto_188633 ?auto_188634 ) ) )
    :subtasks
    ( ( !STACK ?auto_188633 ?auto_188634 )
      ( MAKE-1PILE ?auto_188631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188635 - BLOCK
    )
    :vars
    (
      ?auto_188636 - BLOCK
      ?auto_188637 - BLOCK
      ?auto_188638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188636 ?auto_188635 ) ( ON-TABLE ?auto_188635 ) ( not ( = ?auto_188635 ?auto_188636 ) ) ( CLEAR ?auto_188637 ) ( not ( = ?auto_188635 ?auto_188638 ) ) ( not ( = ?auto_188635 ?auto_188637 ) ) ( not ( = ?auto_188636 ?auto_188638 ) ) ( not ( = ?auto_188636 ?auto_188637 ) ) ( not ( = ?auto_188638 ?auto_188637 ) ) ( ON ?auto_188638 ?auto_188636 ) ( CLEAR ?auto_188638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188635 ?auto_188636 )
      ( MAKE-1PILE ?auto_188635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188639 - BLOCK
    )
    :vars
    (
      ?auto_188640 - BLOCK
      ?auto_188642 - BLOCK
      ?auto_188641 - BLOCK
      ?auto_188647 - BLOCK
      ?auto_188643 - BLOCK
      ?auto_188644 - BLOCK
      ?auto_188645 - BLOCK
      ?auto_188646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188640 ?auto_188639 ) ( ON-TABLE ?auto_188639 ) ( not ( = ?auto_188639 ?auto_188640 ) ) ( not ( = ?auto_188639 ?auto_188642 ) ) ( not ( = ?auto_188639 ?auto_188641 ) ) ( not ( = ?auto_188640 ?auto_188642 ) ) ( not ( = ?auto_188640 ?auto_188641 ) ) ( not ( = ?auto_188642 ?auto_188641 ) ) ( ON ?auto_188642 ?auto_188640 ) ( CLEAR ?auto_188642 ) ( HOLDING ?auto_188641 ) ( CLEAR ?auto_188647 ) ( ON-TABLE ?auto_188643 ) ( ON ?auto_188644 ?auto_188643 ) ( ON ?auto_188645 ?auto_188644 ) ( ON ?auto_188646 ?auto_188645 ) ( ON ?auto_188647 ?auto_188646 ) ( not ( = ?auto_188643 ?auto_188644 ) ) ( not ( = ?auto_188643 ?auto_188645 ) ) ( not ( = ?auto_188643 ?auto_188646 ) ) ( not ( = ?auto_188643 ?auto_188647 ) ) ( not ( = ?auto_188643 ?auto_188641 ) ) ( not ( = ?auto_188644 ?auto_188645 ) ) ( not ( = ?auto_188644 ?auto_188646 ) ) ( not ( = ?auto_188644 ?auto_188647 ) ) ( not ( = ?auto_188644 ?auto_188641 ) ) ( not ( = ?auto_188645 ?auto_188646 ) ) ( not ( = ?auto_188645 ?auto_188647 ) ) ( not ( = ?auto_188645 ?auto_188641 ) ) ( not ( = ?auto_188646 ?auto_188647 ) ) ( not ( = ?auto_188646 ?auto_188641 ) ) ( not ( = ?auto_188647 ?auto_188641 ) ) ( not ( = ?auto_188639 ?auto_188647 ) ) ( not ( = ?auto_188639 ?auto_188643 ) ) ( not ( = ?auto_188639 ?auto_188644 ) ) ( not ( = ?auto_188639 ?auto_188645 ) ) ( not ( = ?auto_188639 ?auto_188646 ) ) ( not ( = ?auto_188640 ?auto_188647 ) ) ( not ( = ?auto_188640 ?auto_188643 ) ) ( not ( = ?auto_188640 ?auto_188644 ) ) ( not ( = ?auto_188640 ?auto_188645 ) ) ( not ( = ?auto_188640 ?auto_188646 ) ) ( not ( = ?auto_188642 ?auto_188647 ) ) ( not ( = ?auto_188642 ?auto_188643 ) ) ( not ( = ?auto_188642 ?auto_188644 ) ) ( not ( = ?auto_188642 ?auto_188645 ) ) ( not ( = ?auto_188642 ?auto_188646 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188643 ?auto_188644 ?auto_188645 ?auto_188646 ?auto_188647 ?auto_188641 )
      ( MAKE-1PILE ?auto_188639 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188648 - BLOCK
    )
    :vars
    (
      ?auto_188656 - BLOCK
      ?auto_188654 - BLOCK
      ?auto_188653 - BLOCK
      ?auto_188651 - BLOCK
      ?auto_188655 - BLOCK
      ?auto_188652 - BLOCK
      ?auto_188649 - BLOCK
      ?auto_188650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188656 ?auto_188648 ) ( ON-TABLE ?auto_188648 ) ( not ( = ?auto_188648 ?auto_188656 ) ) ( not ( = ?auto_188648 ?auto_188654 ) ) ( not ( = ?auto_188648 ?auto_188653 ) ) ( not ( = ?auto_188656 ?auto_188654 ) ) ( not ( = ?auto_188656 ?auto_188653 ) ) ( not ( = ?auto_188654 ?auto_188653 ) ) ( ON ?auto_188654 ?auto_188656 ) ( CLEAR ?auto_188651 ) ( ON-TABLE ?auto_188655 ) ( ON ?auto_188652 ?auto_188655 ) ( ON ?auto_188649 ?auto_188652 ) ( ON ?auto_188650 ?auto_188649 ) ( ON ?auto_188651 ?auto_188650 ) ( not ( = ?auto_188655 ?auto_188652 ) ) ( not ( = ?auto_188655 ?auto_188649 ) ) ( not ( = ?auto_188655 ?auto_188650 ) ) ( not ( = ?auto_188655 ?auto_188651 ) ) ( not ( = ?auto_188655 ?auto_188653 ) ) ( not ( = ?auto_188652 ?auto_188649 ) ) ( not ( = ?auto_188652 ?auto_188650 ) ) ( not ( = ?auto_188652 ?auto_188651 ) ) ( not ( = ?auto_188652 ?auto_188653 ) ) ( not ( = ?auto_188649 ?auto_188650 ) ) ( not ( = ?auto_188649 ?auto_188651 ) ) ( not ( = ?auto_188649 ?auto_188653 ) ) ( not ( = ?auto_188650 ?auto_188651 ) ) ( not ( = ?auto_188650 ?auto_188653 ) ) ( not ( = ?auto_188651 ?auto_188653 ) ) ( not ( = ?auto_188648 ?auto_188651 ) ) ( not ( = ?auto_188648 ?auto_188655 ) ) ( not ( = ?auto_188648 ?auto_188652 ) ) ( not ( = ?auto_188648 ?auto_188649 ) ) ( not ( = ?auto_188648 ?auto_188650 ) ) ( not ( = ?auto_188656 ?auto_188651 ) ) ( not ( = ?auto_188656 ?auto_188655 ) ) ( not ( = ?auto_188656 ?auto_188652 ) ) ( not ( = ?auto_188656 ?auto_188649 ) ) ( not ( = ?auto_188656 ?auto_188650 ) ) ( not ( = ?auto_188654 ?auto_188651 ) ) ( not ( = ?auto_188654 ?auto_188655 ) ) ( not ( = ?auto_188654 ?auto_188652 ) ) ( not ( = ?auto_188654 ?auto_188649 ) ) ( not ( = ?auto_188654 ?auto_188650 ) ) ( ON ?auto_188653 ?auto_188654 ) ( CLEAR ?auto_188653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188648 ?auto_188656 ?auto_188654 )
      ( MAKE-1PILE ?auto_188648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188657 - BLOCK
    )
    :vars
    (
      ?auto_188660 - BLOCK
      ?auto_188658 - BLOCK
      ?auto_188664 - BLOCK
      ?auto_188659 - BLOCK
      ?auto_188665 - BLOCK
      ?auto_188661 - BLOCK
      ?auto_188662 - BLOCK
      ?auto_188663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188660 ?auto_188657 ) ( ON-TABLE ?auto_188657 ) ( not ( = ?auto_188657 ?auto_188660 ) ) ( not ( = ?auto_188657 ?auto_188658 ) ) ( not ( = ?auto_188657 ?auto_188664 ) ) ( not ( = ?auto_188660 ?auto_188658 ) ) ( not ( = ?auto_188660 ?auto_188664 ) ) ( not ( = ?auto_188658 ?auto_188664 ) ) ( ON ?auto_188658 ?auto_188660 ) ( ON-TABLE ?auto_188659 ) ( ON ?auto_188665 ?auto_188659 ) ( ON ?auto_188661 ?auto_188665 ) ( ON ?auto_188662 ?auto_188661 ) ( not ( = ?auto_188659 ?auto_188665 ) ) ( not ( = ?auto_188659 ?auto_188661 ) ) ( not ( = ?auto_188659 ?auto_188662 ) ) ( not ( = ?auto_188659 ?auto_188663 ) ) ( not ( = ?auto_188659 ?auto_188664 ) ) ( not ( = ?auto_188665 ?auto_188661 ) ) ( not ( = ?auto_188665 ?auto_188662 ) ) ( not ( = ?auto_188665 ?auto_188663 ) ) ( not ( = ?auto_188665 ?auto_188664 ) ) ( not ( = ?auto_188661 ?auto_188662 ) ) ( not ( = ?auto_188661 ?auto_188663 ) ) ( not ( = ?auto_188661 ?auto_188664 ) ) ( not ( = ?auto_188662 ?auto_188663 ) ) ( not ( = ?auto_188662 ?auto_188664 ) ) ( not ( = ?auto_188663 ?auto_188664 ) ) ( not ( = ?auto_188657 ?auto_188663 ) ) ( not ( = ?auto_188657 ?auto_188659 ) ) ( not ( = ?auto_188657 ?auto_188665 ) ) ( not ( = ?auto_188657 ?auto_188661 ) ) ( not ( = ?auto_188657 ?auto_188662 ) ) ( not ( = ?auto_188660 ?auto_188663 ) ) ( not ( = ?auto_188660 ?auto_188659 ) ) ( not ( = ?auto_188660 ?auto_188665 ) ) ( not ( = ?auto_188660 ?auto_188661 ) ) ( not ( = ?auto_188660 ?auto_188662 ) ) ( not ( = ?auto_188658 ?auto_188663 ) ) ( not ( = ?auto_188658 ?auto_188659 ) ) ( not ( = ?auto_188658 ?auto_188665 ) ) ( not ( = ?auto_188658 ?auto_188661 ) ) ( not ( = ?auto_188658 ?auto_188662 ) ) ( ON ?auto_188664 ?auto_188658 ) ( CLEAR ?auto_188664 ) ( HOLDING ?auto_188663 ) ( CLEAR ?auto_188662 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188659 ?auto_188665 ?auto_188661 ?auto_188662 ?auto_188663 )
      ( MAKE-1PILE ?auto_188657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188666 - BLOCK
    )
    :vars
    (
      ?auto_188672 - BLOCK
      ?auto_188673 - BLOCK
      ?auto_188670 - BLOCK
      ?auto_188671 - BLOCK
      ?auto_188667 - BLOCK
      ?auto_188674 - BLOCK
      ?auto_188668 - BLOCK
      ?auto_188669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188672 ?auto_188666 ) ( ON-TABLE ?auto_188666 ) ( not ( = ?auto_188666 ?auto_188672 ) ) ( not ( = ?auto_188666 ?auto_188673 ) ) ( not ( = ?auto_188666 ?auto_188670 ) ) ( not ( = ?auto_188672 ?auto_188673 ) ) ( not ( = ?auto_188672 ?auto_188670 ) ) ( not ( = ?auto_188673 ?auto_188670 ) ) ( ON ?auto_188673 ?auto_188672 ) ( ON-TABLE ?auto_188671 ) ( ON ?auto_188667 ?auto_188671 ) ( ON ?auto_188674 ?auto_188667 ) ( ON ?auto_188668 ?auto_188674 ) ( not ( = ?auto_188671 ?auto_188667 ) ) ( not ( = ?auto_188671 ?auto_188674 ) ) ( not ( = ?auto_188671 ?auto_188668 ) ) ( not ( = ?auto_188671 ?auto_188669 ) ) ( not ( = ?auto_188671 ?auto_188670 ) ) ( not ( = ?auto_188667 ?auto_188674 ) ) ( not ( = ?auto_188667 ?auto_188668 ) ) ( not ( = ?auto_188667 ?auto_188669 ) ) ( not ( = ?auto_188667 ?auto_188670 ) ) ( not ( = ?auto_188674 ?auto_188668 ) ) ( not ( = ?auto_188674 ?auto_188669 ) ) ( not ( = ?auto_188674 ?auto_188670 ) ) ( not ( = ?auto_188668 ?auto_188669 ) ) ( not ( = ?auto_188668 ?auto_188670 ) ) ( not ( = ?auto_188669 ?auto_188670 ) ) ( not ( = ?auto_188666 ?auto_188669 ) ) ( not ( = ?auto_188666 ?auto_188671 ) ) ( not ( = ?auto_188666 ?auto_188667 ) ) ( not ( = ?auto_188666 ?auto_188674 ) ) ( not ( = ?auto_188666 ?auto_188668 ) ) ( not ( = ?auto_188672 ?auto_188669 ) ) ( not ( = ?auto_188672 ?auto_188671 ) ) ( not ( = ?auto_188672 ?auto_188667 ) ) ( not ( = ?auto_188672 ?auto_188674 ) ) ( not ( = ?auto_188672 ?auto_188668 ) ) ( not ( = ?auto_188673 ?auto_188669 ) ) ( not ( = ?auto_188673 ?auto_188671 ) ) ( not ( = ?auto_188673 ?auto_188667 ) ) ( not ( = ?auto_188673 ?auto_188674 ) ) ( not ( = ?auto_188673 ?auto_188668 ) ) ( ON ?auto_188670 ?auto_188673 ) ( CLEAR ?auto_188668 ) ( ON ?auto_188669 ?auto_188670 ) ( CLEAR ?auto_188669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188666 ?auto_188672 ?auto_188673 ?auto_188670 )
      ( MAKE-1PILE ?auto_188666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188675 - BLOCK
    )
    :vars
    (
      ?auto_188681 - BLOCK
      ?auto_188680 - BLOCK
      ?auto_188678 - BLOCK
      ?auto_188677 - BLOCK
      ?auto_188679 - BLOCK
      ?auto_188682 - BLOCK
      ?auto_188676 - BLOCK
      ?auto_188683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188681 ?auto_188675 ) ( ON-TABLE ?auto_188675 ) ( not ( = ?auto_188675 ?auto_188681 ) ) ( not ( = ?auto_188675 ?auto_188680 ) ) ( not ( = ?auto_188675 ?auto_188678 ) ) ( not ( = ?auto_188681 ?auto_188680 ) ) ( not ( = ?auto_188681 ?auto_188678 ) ) ( not ( = ?auto_188680 ?auto_188678 ) ) ( ON ?auto_188680 ?auto_188681 ) ( ON-TABLE ?auto_188677 ) ( ON ?auto_188679 ?auto_188677 ) ( ON ?auto_188682 ?auto_188679 ) ( not ( = ?auto_188677 ?auto_188679 ) ) ( not ( = ?auto_188677 ?auto_188682 ) ) ( not ( = ?auto_188677 ?auto_188676 ) ) ( not ( = ?auto_188677 ?auto_188683 ) ) ( not ( = ?auto_188677 ?auto_188678 ) ) ( not ( = ?auto_188679 ?auto_188682 ) ) ( not ( = ?auto_188679 ?auto_188676 ) ) ( not ( = ?auto_188679 ?auto_188683 ) ) ( not ( = ?auto_188679 ?auto_188678 ) ) ( not ( = ?auto_188682 ?auto_188676 ) ) ( not ( = ?auto_188682 ?auto_188683 ) ) ( not ( = ?auto_188682 ?auto_188678 ) ) ( not ( = ?auto_188676 ?auto_188683 ) ) ( not ( = ?auto_188676 ?auto_188678 ) ) ( not ( = ?auto_188683 ?auto_188678 ) ) ( not ( = ?auto_188675 ?auto_188683 ) ) ( not ( = ?auto_188675 ?auto_188677 ) ) ( not ( = ?auto_188675 ?auto_188679 ) ) ( not ( = ?auto_188675 ?auto_188682 ) ) ( not ( = ?auto_188675 ?auto_188676 ) ) ( not ( = ?auto_188681 ?auto_188683 ) ) ( not ( = ?auto_188681 ?auto_188677 ) ) ( not ( = ?auto_188681 ?auto_188679 ) ) ( not ( = ?auto_188681 ?auto_188682 ) ) ( not ( = ?auto_188681 ?auto_188676 ) ) ( not ( = ?auto_188680 ?auto_188683 ) ) ( not ( = ?auto_188680 ?auto_188677 ) ) ( not ( = ?auto_188680 ?auto_188679 ) ) ( not ( = ?auto_188680 ?auto_188682 ) ) ( not ( = ?auto_188680 ?auto_188676 ) ) ( ON ?auto_188678 ?auto_188680 ) ( ON ?auto_188683 ?auto_188678 ) ( CLEAR ?auto_188683 ) ( HOLDING ?auto_188676 ) ( CLEAR ?auto_188682 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188677 ?auto_188679 ?auto_188682 ?auto_188676 )
      ( MAKE-1PILE ?auto_188675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188684 - BLOCK
    )
    :vars
    (
      ?auto_188692 - BLOCK
      ?auto_188686 - BLOCK
      ?auto_188685 - BLOCK
      ?auto_188688 - BLOCK
      ?auto_188690 - BLOCK
      ?auto_188687 - BLOCK
      ?auto_188691 - BLOCK
      ?auto_188689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188692 ?auto_188684 ) ( ON-TABLE ?auto_188684 ) ( not ( = ?auto_188684 ?auto_188692 ) ) ( not ( = ?auto_188684 ?auto_188686 ) ) ( not ( = ?auto_188684 ?auto_188685 ) ) ( not ( = ?auto_188692 ?auto_188686 ) ) ( not ( = ?auto_188692 ?auto_188685 ) ) ( not ( = ?auto_188686 ?auto_188685 ) ) ( ON ?auto_188686 ?auto_188692 ) ( ON-TABLE ?auto_188688 ) ( ON ?auto_188690 ?auto_188688 ) ( ON ?auto_188687 ?auto_188690 ) ( not ( = ?auto_188688 ?auto_188690 ) ) ( not ( = ?auto_188688 ?auto_188687 ) ) ( not ( = ?auto_188688 ?auto_188691 ) ) ( not ( = ?auto_188688 ?auto_188689 ) ) ( not ( = ?auto_188688 ?auto_188685 ) ) ( not ( = ?auto_188690 ?auto_188687 ) ) ( not ( = ?auto_188690 ?auto_188691 ) ) ( not ( = ?auto_188690 ?auto_188689 ) ) ( not ( = ?auto_188690 ?auto_188685 ) ) ( not ( = ?auto_188687 ?auto_188691 ) ) ( not ( = ?auto_188687 ?auto_188689 ) ) ( not ( = ?auto_188687 ?auto_188685 ) ) ( not ( = ?auto_188691 ?auto_188689 ) ) ( not ( = ?auto_188691 ?auto_188685 ) ) ( not ( = ?auto_188689 ?auto_188685 ) ) ( not ( = ?auto_188684 ?auto_188689 ) ) ( not ( = ?auto_188684 ?auto_188688 ) ) ( not ( = ?auto_188684 ?auto_188690 ) ) ( not ( = ?auto_188684 ?auto_188687 ) ) ( not ( = ?auto_188684 ?auto_188691 ) ) ( not ( = ?auto_188692 ?auto_188689 ) ) ( not ( = ?auto_188692 ?auto_188688 ) ) ( not ( = ?auto_188692 ?auto_188690 ) ) ( not ( = ?auto_188692 ?auto_188687 ) ) ( not ( = ?auto_188692 ?auto_188691 ) ) ( not ( = ?auto_188686 ?auto_188689 ) ) ( not ( = ?auto_188686 ?auto_188688 ) ) ( not ( = ?auto_188686 ?auto_188690 ) ) ( not ( = ?auto_188686 ?auto_188687 ) ) ( not ( = ?auto_188686 ?auto_188691 ) ) ( ON ?auto_188685 ?auto_188686 ) ( ON ?auto_188689 ?auto_188685 ) ( CLEAR ?auto_188687 ) ( ON ?auto_188691 ?auto_188689 ) ( CLEAR ?auto_188691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188684 ?auto_188692 ?auto_188686 ?auto_188685 ?auto_188689 )
      ( MAKE-1PILE ?auto_188684 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188693 - BLOCK
    )
    :vars
    (
      ?auto_188699 - BLOCK
      ?auto_188701 - BLOCK
      ?auto_188697 - BLOCK
      ?auto_188695 - BLOCK
      ?auto_188694 - BLOCK
      ?auto_188698 - BLOCK
      ?auto_188696 - BLOCK
      ?auto_188700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188699 ?auto_188693 ) ( ON-TABLE ?auto_188693 ) ( not ( = ?auto_188693 ?auto_188699 ) ) ( not ( = ?auto_188693 ?auto_188701 ) ) ( not ( = ?auto_188693 ?auto_188697 ) ) ( not ( = ?auto_188699 ?auto_188701 ) ) ( not ( = ?auto_188699 ?auto_188697 ) ) ( not ( = ?auto_188701 ?auto_188697 ) ) ( ON ?auto_188701 ?auto_188699 ) ( ON-TABLE ?auto_188695 ) ( ON ?auto_188694 ?auto_188695 ) ( not ( = ?auto_188695 ?auto_188694 ) ) ( not ( = ?auto_188695 ?auto_188698 ) ) ( not ( = ?auto_188695 ?auto_188696 ) ) ( not ( = ?auto_188695 ?auto_188700 ) ) ( not ( = ?auto_188695 ?auto_188697 ) ) ( not ( = ?auto_188694 ?auto_188698 ) ) ( not ( = ?auto_188694 ?auto_188696 ) ) ( not ( = ?auto_188694 ?auto_188700 ) ) ( not ( = ?auto_188694 ?auto_188697 ) ) ( not ( = ?auto_188698 ?auto_188696 ) ) ( not ( = ?auto_188698 ?auto_188700 ) ) ( not ( = ?auto_188698 ?auto_188697 ) ) ( not ( = ?auto_188696 ?auto_188700 ) ) ( not ( = ?auto_188696 ?auto_188697 ) ) ( not ( = ?auto_188700 ?auto_188697 ) ) ( not ( = ?auto_188693 ?auto_188700 ) ) ( not ( = ?auto_188693 ?auto_188695 ) ) ( not ( = ?auto_188693 ?auto_188694 ) ) ( not ( = ?auto_188693 ?auto_188698 ) ) ( not ( = ?auto_188693 ?auto_188696 ) ) ( not ( = ?auto_188699 ?auto_188700 ) ) ( not ( = ?auto_188699 ?auto_188695 ) ) ( not ( = ?auto_188699 ?auto_188694 ) ) ( not ( = ?auto_188699 ?auto_188698 ) ) ( not ( = ?auto_188699 ?auto_188696 ) ) ( not ( = ?auto_188701 ?auto_188700 ) ) ( not ( = ?auto_188701 ?auto_188695 ) ) ( not ( = ?auto_188701 ?auto_188694 ) ) ( not ( = ?auto_188701 ?auto_188698 ) ) ( not ( = ?auto_188701 ?auto_188696 ) ) ( ON ?auto_188697 ?auto_188701 ) ( ON ?auto_188700 ?auto_188697 ) ( ON ?auto_188696 ?auto_188700 ) ( CLEAR ?auto_188696 ) ( HOLDING ?auto_188698 ) ( CLEAR ?auto_188694 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188695 ?auto_188694 ?auto_188698 )
      ( MAKE-1PILE ?auto_188693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188702 - BLOCK
    )
    :vars
    (
      ?auto_188705 - BLOCK
      ?auto_188703 - BLOCK
      ?auto_188706 - BLOCK
      ?auto_188709 - BLOCK
      ?auto_188710 - BLOCK
      ?auto_188704 - BLOCK
      ?auto_188707 - BLOCK
      ?auto_188708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188705 ?auto_188702 ) ( ON-TABLE ?auto_188702 ) ( not ( = ?auto_188702 ?auto_188705 ) ) ( not ( = ?auto_188702 ?auto_188703 ) ) ( not ( = ?auto_188702 ?auto_188706 ) ) ( not ( = ?auto_188705 ?auto_188703 ) ) ( not ( = ?auto_188705 ?auto_188706 ) ) ( not ( = ?auto_188703 ?auto_188706 ) ) ( ON ?auto_188703 ?auto_188705 ) ( ON-TABLE ?auto_188709 ) ( ON ?auto_188710 ?auto_188709 ) ( not ( = ?auto_188709 ?auto_188710 ) ) ( not ( = ?auto_188709 ?auto_188704 ) ) ( not ( = ?auto_188709 ?auto_188707 ) ) ( not ( = ?auto_188709 ?auto_188708 ) ) ( not ( = ?auto_188709 ?auto_188706 ) ) ( not ( = ?auto_188710 ?auto_188704 ) ) ( not ( = ?auto_188710 ?auto_188707 ) ) ( not ( = ?auto_188710 ?auto_188708 ) ) ( not ( = ?auto_188710 ?auto_188706 ) ) ( not ( = ?auto_188704 ?auto_188707 ) ) ( not ( = ?auto_188704 ?auto_188708 ) ) ( not ( = ?auto_188704 ?auto_188706 ) ) ( not ( = ?auto_188707 ?auto_188708 ) ) ( not ( = ?auto_188707 ?auto_188706 ) ) ( not ( = ?auto_188708 ?auto_188706 ) ) ( not ( = ?auto_188702 ?auto_188708 ) ) ( not ( = ?auto_188702 ?auto_188709 ) ) ( not ( = ?auto_188702 ?auto_188710 ) ) ( not ( = ?auto_188702 ?auto_188704 ) ) ( not ( = ?auto_188702 ?auto_188707 ) ) ( not ( = ?auto_188705 ?auto_188708 ) ) ( not ( = ?auto_188705 ?auto_188709 ) ) ( not ( = ?auto_188705 ?auto_188710 ) ) ( not ( = ?auto_188705 ?auto_188704 ) ) ( not ( = ?auto_188705 ?auto_188707 ) ) ( not ( = ?auto_188703 ?auto_188708 ) ) ( not ( = ?auto_188703 ?auto_188709 ) ) ( not ( = ?auto_188703 ?auto_188710 ) ) ( not ( = ?auto_188703 ?auto_188704 ) ) ( not ( = ?auto_188703 ?auto_188707 ) ) ( ON ?auto_188706 ?auto_188703 ) ( ON ?auto_188708 ?auto_188706 ) ( ON ?auto_188707 ?auto_188708 ) ( CLEAR ?auto_188710 ) ( ON ?auto_188704 ?auto_188707 ) ( CLEAR ?auto_188704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188702 ?auto_188705 ?auto_188703 ?auto_188706 ?auto_188708 ?auto_188707 )
      ( MAKE-1PILE ?auto_188702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188711 - BLOCK
    )
    :vars
    (
      ?auto_188717 - BLOCK
      ?auto_188712 - BLOCK
      ?auto_188713 - BLOCK
      ?auto_188718 - BLOCK
      ?auto_188719 - BLOCK
      ?auto_188715 - BLOCK
      ?auto_188716 - BLOCK
      ?auto_188714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188717 ?auto_188711 ) ( ON-TABLE ?auto_188711 ) ( not ( = ?auto_188711 ?auto_188717 ) ) ( not ( = ?auto_188711 ?auto_188712 ) ) ( not ( = ?auto_188711 ?auto_188713 ) ) ( not ( = ?auto_188717 ?auto_188712 ) ) ( not ( = ?auto_188717 ?auto_188713 ) ) ( not ( = ?auto_188712 ?auto_188713 ) ) ( ON ?auto_188712 ?auto_188717 ) ( ON-TABLE ?auto_188718 ) ( not ( = ?auto_188718 ?auto_188719 ) ) ( not ( = ?auto_188718 ?auto_188715 ) ) ( not ( = ?auto_188718 ?auto_188716 ) ) ( not ( = ?auto_188718 ?auto_188714 ) ) ( not ( = ?auto_188718 ?auto_188713 ) ) ( not ( = ?auto_188719 ?auto_188715 ) ) ( not ( = ?auto_188719 ?auto_188716 ) ) ( not ( = ?auto_188719 ?auto_188714 ) ) ( not ( = ?auto_188719 ?auto_188713 ) ) ( not ( = ?auto_188715 ?auto_188716 ) ) ( not ( = ?auto_188715 ?auto_188714 ) ) ( not ( = ?auto_188715 ?auto_188713 ) ) ( not ( = ?auto_188716 ?auto_188714 ) ) ( not ( = ?auto_188716 ?auto_188713 ) ) ( not ( = ?auto_188714 ?auto_188713 ) ) ( not ( = ?auto_188711 ?auto_188714 ) ) ( not ( = ?auto_188711 ?auto_188718 ) ) ( not ( = ?auto_188711 ?auto_188719 ) ) ( not ( = ?auto_188711 ?auto_188715 ) ) ( not ( = ?auto_188711 ?auto_188716 ) ) ( not ( = ?auto_188717 ?auto_188714 ) ) ( not ( = ?auto_188717 ?auto_188718 ) ) ( not ( = ?auto_188717 ?auto_188719 ) ) ( not ( = ?auto_188717 ?auto_188715 ) ) ( not ( = ?auto_188717 ?auto_188716 ) ) ( not ( = ?auto_188712 ?auto_188714 ) ) ( not ( = ?auto_188712 ?auto_188718 ) ) ( not ( = ?auto_188712 ?auto_188719 ) ) ( not ( = ?auto_188712 ?auto_188715 ) ) ( not ( = ?auto_188712 ?auto_188716 ) ) ( ON ?auto_188713 ?auto_188712 ) ( ON ?auto_188714 ?auto_188713 ) ( ON ?auto_188716 ?auto_188714 ) ( ON ?auto_188715 ?auto_188716 ) ( CLEAR ?auto_188715 ) ( HOLDING ?auto_188719 ) ( CLEAR ?auto_188718 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188718 ?auto_188719 )
      ( MAKE-1PILE ?auto_188711 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188720 - BLOCK
    )
    :vars
    (
      ?auto_188721 - BLOCK
      ?auto_188723 - BLOCK
      ?auto_188725 - BLOCK
      ?auto_188727 - BLOCK
      ?auto_188722 - BLOCK
      ?auto_188724 - BLOCK
      ?auto_188726 - BLOCK
      ?auto_188728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188721 ?auto_188720 ) ( ON-TABLE ?auto_188720 ) ( not ( = ?auto_188720 ?auto_188721 ) ) ( not ( = ?auto_188720 ?auto_188723 ) ) ( not ( = ?auto_188720 ?auto_188725 ) ) ( not ( = ?auto_188721 ?auto_188723 ) ) ( not ( = ?auto_188721 ?auto_188725 ) ) ( not ( = ?auto_188723 ?auto_188725 ) ) ( ON ?auto_188723 ?auto_188721 ) ( ON-TABLE ?auto_188727 ) ( not ( = ?auto_188727 ?auto_188722 ) ) ( not ( = ?auto_188727 ?auto_188724 ) ) ( not ( = ?auto_188727 ?auto_188726 ) ) ( not ( = ?auto_188727 ?auto_188728 ) ) ( not ( = ?auto_188727 ?auto_188725 ) ) ( not ( = ?auto_188722 ?auto_188724 ) ) ( not ( = ?auto_188722 ?auto_188726 ) ) ( not ( = ?auto_188722 ?auto_188728 ) ) ( not ( = ?auto_188722 ?auto_188725 ) ) ( not ( = ?auto_188724 ?auto_188726 ) ) ( not ( = ?auto_188724 ?auto_188728 ) ) ( not ( = ?auto_188724 ?auto_188725 ) ) ( not ( = ?auto_188726 ?auto_188728 ) ) ( not ( = ?auto_188726 ?auto_188725 ) ) ( not ( = ?auto_188728 ?auto_188725 ) ) ( not ( = ?auto_188720 ?auto_188728 ) ) ( not ( = ?auto_188720 ?auto_188727 ) ) ( not ( = ?auto_188720 ?auto_188722 ) ) ( not ( = ?auto_188720 ?auto_188724 ) ) ( not ( = ?auto_188720 ?auto_188726 ) ) ( not ( = ?auto_188721 ?auto_188728 ) ) ( not ( = ?auto_188721 ?auto_188727 ) ) ( not ( = ?auto_188721 ?auto_188722 ) ) ( not ( = ?auto_188721 ?auto_188724 ) ) ( not ( = ?auto_188721 ?auto_188726 ) ) ( not ( = ?auto_188723 ?auto_188728 ) ) ( not ( = ?auto_188723 ?auto_188727 ) ) ( not ( = ?auto_188723 ?auto_188722 ) ) ( not ( = ?auto_188723 ?auto_188724 ) ) ( not ( = ?auto_188723 ?auto_188726 ) ) ( ON ?auto_188725 ?auto_188723 ) ( ON ?auto_188728 ?auto_188725 ) ( ON ?auto_188726 ?auto_188728 ) ( ON ?auto_188724 ?auto_188726 ) ( CLEAR ?auto_188727 ) ( ON ?auto_188722 ?auto_188724 ) ( CLEAR ?auto_188722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188720 ?auto_188721 ?auto_188723 ?auto_188725 ?auto_188728 ?auto_188726 ?auto_188724 )
      ( MAKE-1PILE ?auto_188720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188729 - BLOCK
    )
    :vars
    (
      ?auto_188737 - BLOCK
      ?auto_188736 - BLOCK
      ?auto_188733 - BLOCK
      ?auto_188734 - BLOCK
      ?auto_188735 - BLOCK
      ?auto_188732 - BLOCK
      ?auto_188731 - BLOCK
      ?auto_188730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188737 ?auto_188729 ) ( ON-TABLE ?auto_188729 ) ( not ( = ?auto_188729 ?auto_188737 ) ) ( not ( = ?auto_188729 ?auto_188736 ) ) ( not ( = ?auto_188729 ?auto_188733 ) ) ( not ( = ?auto_188737 ?auto_188736 ) ) ( not ( = ?auto_188737 ?auto_188733 ) ) ( not ( = ?auto_188736 ?auto_188733 ) ) ( ON ?auto_188736 ?auto_188737 ) ( not ( = ?auto_188734 ?auto_188735 ) ) ( not ( = ?auto_188734 ?auto_188732 ) ) ( not ( = ?auto_188734 ?auto_188731 ) ) ( not ( = ?auto_188734 ?auto_188730 ) ) ( not ( = ?auto_188734 ?auto_188733 ) ) ( not ( = ?auto_188735 ?auto_188732 ) ) ( not ( = ?auto_188735 ?auto_188731 ) ) ( not ( = ?auto_188735 ?auto_188730 ) ) ( not ( = ?auto_188735 ?auto_188733 ) ) ( not ( = ?auto_188732 ?auto_188731 ) ) ( not ( = ?auto_188732 ?auto_188730 ) ) ( not ( = ?auto_188732 ?auto_188733 ) ) ( not ( = ?auto_188731 ?auto_188730 ) ) ( not ( = ?auto_188731 ?auto_188733 ) ) ( not ( = ?auto_188730 ?auto_188733 ) ) ( not ( = ?auto_188729 ?auto_188730 ) ) ( not ( = ?auto_188729 ?auto_188734 ) ) ( not ( = ?auto_188729 ?auto_188735 ) ) ( not ( = ?auto_188729 ?auto_188732 ) ) ( not ( = ?auto_188729 ?auto_188731 ) ) ( not ( = ?auto_188737 ?auto_188730 ) ) ( not ( = ?auto_188737 ?auto_188734 ) ) ( not ( = ?auto_188737 ?auto_188735 ) ) ( not ( = ?auto_188737 ?auto_188732 ) ) ( not ( = ?auto_188737 ?auto_188731 ) ) ( not ( = ?auto_188736 ?auto_188730 ) ) ( not ( = ?auto_188736 ?auto_188734 ) ) ( not ( = ?auto_188736 ?auto_188735 ) ) ( not ( = ?auto_188736 ?auto_188732 ) ) ( not ( = ?auto_188736 ?auto_188731 ) ) ( ON ?auto_188733 ?auto_188736 ) ( ON ?auto_188730 ?auto_188733 ) ( ON ?auto_188731 ?auto_188730 ) ( ON ?auto_188732 ?auto_188731 ) ( ON ?auto_188735 ?auto_188732 ) ( CLEAR ?auto_188735 ) ( HOLDING ?auto_188734 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188734 )
      ( MAKE-1PILE ?auto_188729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188738 - BLOCK
    )
    :vars
    (
      ?auto_188739 - BLOCK
      ?auto_188742 - BLOCK
      ?auto_188740 - BLOCK
      ?auto_188746 - BLOCK
      ?auto_188745 - BLOCK
      ?auto_188743 - BLOCK
      ?auto_188741 - BLOCK
      ?auto_188744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188739 ?auto_188738 ) ( ON-TABLE ?auto_188738 ) ( not ( = ?auto_188738 ?auto_188739 ) ) ( not ( = ?auto_188738 ?auto_188742 ) ) ( not ( = ?auto_188738 ?auto_188740 ) ) ( not ( = ?auto_188739 ?auto_188742 ) ) ( not ( = ?auto_188739 ?auto_188740 ) ) ( not ( = ?auto_188742 ?auto_188740 ) ) ( ON ?auto_188742 ?auto_188739 ) ( not ( = ?auto_188746 ?auto_188745 ) ) ( not ( = ?auto_188746 ?auto_188743 ) ) ( not ( = ?auto_188746 ?auto_188741 ) ) ( not ( = ?auto_188746 ?auto_188744 ) ) ( not ( = ?auto_188746 ?auto_188740 ) ) ( not ( = ?auto_188745 ?auto_188743 ) ) ( not ( = ?auto_188745 ?auto_188741 ) ) ( not ( = ?auto_188745 ?auto_188744 ) ) ( not ( = ?auto_188745 ?auto_188740 ) ) ( not ( = ?auto_188743 ?auto_188741 ) ) ( not ( = ?auto_188743 ?auto_188744 ) ) ( not ( = ?auto_188743 ?auto_188740 ) ) ( not ( = ?auto_188741 ?auto_188744 ) ) ( not ( = ?auto_188741 ?auto_188740 ) ) ( not ( = ?auto_188744 ?auto_188740 ) ) ( not ( = ?auto_188738 ?auto_188744 ) ) ( not ( = ?auto_188738 ?auto_188746 ) ) ( not ( = ?auto_188738 ?auto_188745 ) ) ( not ( = ?auto_188738 ?auto_188743 ) ) ( not ( = ?auto_188738 ?auto_188741 ) ) ( not ( = ?auto_188739 ?auto_188744 ) ) ( not ( = ?auto_188739 ?auto_188746 ) ) ( not ( = ?auto_188739 ?auto_188745 ) ) ( not ( = ?auto_188739 ?auto_188743 ) ) ( not ( = ?auto_188739 ?auto_188741 ) ) ( not ( = ?auto_188742 ?auto_188744 ) ) ( not ( = ?auto_188742 ?auto_188746 ) ) ( not ( = ?auto_188742 ?auto_188745 ) ) ( not ( = ?auto_188742 ?auto_188743 ) ) ( not ( = ?auto_188742 ?auto_188741 ) ) ( ON ?auto_188740 ?auto_188742 ) ( ON ?auto_188744 ?auto_188740 ) ( ON ?auto_188741 ?auto_188744 ) ( ON ?auto_188743 ?auto_188741 ) ( ON ?auto_188745 ?auto_188743 ) ( ON ?auto_188746 ?auto_188745 ) ( CLEAR ?auto_188746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188738 ?auto_188739 ?auto_188742 ?auto_188740 ?auto_188744 ?auto_188741 ?auto_188743 ?auto_188745 )
      ( MAKE-1PILE ?auto_188738 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188755 - BLOCK
      ?auto_188756 - BLOCK
      ?auto_188757 - BLOCK
      ?auto_188758 - BLOCK
      ?auto_188759 - BLOCK
      ?auto_188760 - BLOCK
      ?auto_188761 - BLOCK
      ?auto_188762 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_188762 ) ( CLEAR ?auto_188761 ) ( ON-TABLE ?auto_188755 ) ( ON ?auto_188756 ?auto_188755 ) ( ON ?auto_188757 ?auto_188756 ) ( ON ?auto_188758 ?auto_188757 ) ( ON ?auto_188759 ?auto_188758 ) ( ON ?auto_188760 ?auto_188759 ) ( ON ?auto_188761 ?auto_188760 ) ( not ( = ?auto_188755 ?auto_188756 ) ) ( not ( = ?auto_188755 ?auto_188757 ) ) ( not ( = ?auto_188755 ?auto_188758 ) ) ( not ( = ?auto_188755 ?auto_188759 ) ) ( not ( = ?auto_188755 ?auto_188760 ) ) ( not ( = ?auto_188755 ?auto_188761 ) ) ( not ( = ?auto_188755 ?auto_188762 ) ) ( not ( = ?auto_188756 ?auto_188757 ) ) ( not ( = ?auto_188756 ?auto_188758 ) ) ( not ( = ?auto_188756 ?auto_188759 ) ) ( not ( = ?auto_188756 ?auto_188760 ) ) ( not ( = ?auto_188756 ?auto_188761 ) ) ( not ( = ?auto_188756 ?auto_188762 ) ) ( not ( = ?auto_188757 ?auto_188758 ) ) ( not ( = ?auto_188757 ?auto_188759 ) ) ( not ( = ?auto_188757 ?auto_188760 ) ) ( not ( = ?auto_188757 ?auto_188761 ) ) ( not ( = ?auto_188757 ?auto_188762 ) ) ( not ( = ?auto_188758 ?auto_188759 ) ) ( not ( = ?auto_188758 ?auto_188760 ) ) ( not ( = ?auto_188758 ?auto_188761 ) ) ( not ( = ?auto_188758 ?auto_188762 ) ) ( not ( = ?auto_188759 ?auto_188760 ) ) ( not ( = ?auto_188759 ?auto_188761 ) ) ( not ( = ?auto_188759 ?auto_188762 ) ) ( not ( = ?auto_188760 ?auto_188761 ) ) ( not ( = ?auto_188760 ?auto_188762 ) ) ( not ( = ?auto_188761 ?auto_188762 ) ) )
    :subtasks
    ( ( !STACK ?auto_188762 ?auto_188761 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188763 - BLOCK
      ?auto_188764 - BLOCK
      ?auto_188765 - BLOCK
      ?auto_188766 - BLOCK
      ?auto_188767 - BLOCK
      ?auto_188768 - BLOCK
      ?auto_188769 - BLOCK
      ?auto_188770 - BLOCK
    )
    :vars
    (
      ?auto_188771 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188769 ) ( ON-TABLE ?auto_188763 ) ( ON ?auto_188764 ?auto_188763 ) ( ON ?auto_188765 ?auto_188764 ) ( ON ?auto_188766 ?auto_188765 ) ( ON ?auto_188767 ?auto_188766 ) ( ON ?auto_188768 ?auto_188767 ) ( ON ?auto_188769 ?auto_188768 ) ( not ( = ?auto_188763 ?auto_188764 ) ) ( not ( = ?auto_188763 ?auto_188765 ) ) ( not ( = ?auto_188763 ?auto_188766 ) ) ( not ( = ?auto_188763 ?auto_188767 ) ) ( not ( = ?auto_188763 ?auto_188768 ) ) ( not ( = ?auto_188763 ?auto_188769 ) ) ( not ( = ?auto_188763 ?auto_188770 ) ) ( not ( = ?auto_188764 ?auto_188765 ) ) ( not ( = ?auto_188764 ?auto_188766 ) ) ( not ( = ?auto_188764 ?auto_188767 ) ) ( not ( = ?auto_188764 ?auto_188768 ) ) ( not ( = ?auto_188764 ?auto_188769 ) ) ( not ( = ?auto_188764 ?auto_188770 ) ) ( not ( = ?auto_188765 ?auto_188766 ) ) ( not ( = ?auto_188765 ?auto_188767 ) ) ( not ( = ?auto_188765 ?auto_188768 ) ) ( not ( = ?auto_188765 ?auto_188769 ) ) ( not ( = ?auto_188765 ?auto_188770 ) ) ( not ( = ?auto_188766 ?auto_188767 ) ) ( not ( = ?auto_188766 ?auto_188768 ) ) ( not ( = ?auto_188766 ?auto_188769 ) ) ( not ( = ?auto_188766 ?auto_188770 ) ) ( not ( = ?auto_188767 ?auto_188768 ) ) ( not ( = ?auto_188767 ?auto_188769 ) ) ( not ( = ?auto_188767 ?auto_188770 ) ) ( not ( = ?auto_188768 ?auto_188769 ) ) ( not ( = ?auto_188768 ?auto_188770 ) ) ( not ( = ?auto_188769 ?auto_188770 ) ) ( ON ?auto_188770 ?auto_188771 ) ( CLEAR ?auto_188770 ) ( HAND-EMPTY ) ( not ( = ?auto_188763 ?auto_188771 ) ) ( not ( = ?auto_188764 ?auto_188771 ) ) ( not ( = ?auto_188765 ?auto_188771 ) ) ( not ( = ?auto_188766 ?auto_188771 ) ) ( not ( = ?auto_188767 ?auto_188771 ) ) ( not ( = ?auto_188768 ?auto_188771 ) ) ( not ( = ?auto_188769 ?auto_188771 ) ) ( not ( = ?auto_188770 ?auto_188771 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188770 ?auto_188771 )
      ( MAKE-8PILE ?auto_188763 ?auto_188764 ?auto_188765 ?auto_188766 ?auto_188767 ?auto_188768 ?auto_188769 ?auto_188770 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188772 - BLOCK
      ?auto_188773 - BLOCK
      ?auto_188774 - BLOCK
      ?auto_188775 - BLOCK
      ?auto_188776 - BLOCK
      ?auto_188777 - BLOCK
      ?auto_188778 - BLOCK
      ?auto_188779 - BLOCK
    )
    :vars
    (
      ?auto_188780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188772 ) ( ON ?auto_188773 ?auto_188772 ) ( ON ?auto_188774 ?auto_188773 ) ( ON ?auto_188775 ?auto_188774 ) ( ON ?auto_188776 ?auto_188775 ) ( ON ?auto_188777 ?auto_188776 ) ( not ( = ?auto_188772 ?auto_188773 ) ) ( not ( = ?auto_188772 ?auto_188774 ) ) ( not ( = ?auto_188772 ?auto_188775 ) ) ( not ( = ?auto_188772 ?auto_188776 ) ) ( not ( = ?auto_188772 ?auto_188777 ) ) ( not ( = ?auto_188772 ?auto_188778 ) ) ( not ( = ?auto_188772 ?auto_188779 ) ) ( not ( = ?auto_188773 ?auto_188774 ) ) ( not ( = ?auto_188773 ?auto_188775 ) ) ( not ( = ?auto_188773 ?auto_188776 ) ) ( not ( = ?auto_188773 ?auto_188777 ) ) ( not ( = ?auto_188773 ?auto_188778 ) ) ( not ( = ?auto_188773 ?auto_188779 ) ) ( not ( = ?auto_188774 ?auto_188775 ) ) ( not ( = ?auto_188774 ?auto_188776 ) ) ( not ( = ?auto_188774 ?auto_188777 ) ) ( not ( = ?auto_188774 ?auto_188778 ) ) ( not ( = ?auto_188774 ?auto_188779 ) ) ( not ( = ?auto_188775 ?auto_188776 ) ) ( not ( = ?auto_188775 ?auto_188777 ) ) ( not ( = ?auto_188775 ?auto_188778 ) ) ( not ( = ?auto_188775 ?auto_188779 ) ) ( not ( = ?auto_188776 ?auto_188777 ) ) ( not ( = ?auto_188776 ?auto_188778 ) ) ( not ( = ?auto_188776 ?auto_188779 ) ) ( not ( = ?auto_188777 ?auto_188778 ) ) ( not ( = ?auto_188777 ?auto_188779 ) ) ( not ( = ?auto_188778 ?auto_188779 ) ) ( ON ?auto_188779 ?auto_188780 ) ( CLEAR ?auto_188779 ) ( not ( = ?auto_188772 ?auto_188780 ) ) ( not ( = ?auto_188773 ?auto_188780 ) ) ( not ( = ?auto_188774 ?auto_188780 ) ) ( not ( = ?auto_188775 ?auto_188780 ) ) ( not ( = ?auto_188776 ?auto_188780 ) ) ( not ( = ?auto_188777 ?auto_188780 ) ) ( not ( = ?auto_188778 ?auto_188780 ) ) ( not ( = ?auto_188779 ?auto_188780 ) ) ( HOLDING ?auto_188778 ) ( CLEAR ?auto_188777 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188772 ?auto_188773 ?auto_188774 ?auto_188775 ?auto_188776 ?auto_188777 ?auto_188778 )
      ( MAKE-8PILE ?auto_188772 ?auto_188773 ?auto_188774 ?auto_188775 ?auto_188776 ?auto_188777 ?auto_188778 ?auto_188779 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188781 - BLOCK
      ?auto_188782 - BLOCK
      ?auto_188783 - BLOCK
      ?auto_188784 - BLOCK
      ?auto_188785 - BLOCK
      ?auto_188786 - BLOCK
      ?auto_188787 - BLOCK
      ?auto_188788 - BLOCK
    )
    :vars
    (
      ?auto_188789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188781 ) ( ON ?auto_188782 ?auto_188781 ) ( ON ?auto_188783 ?auto_188782 ) ( ON ?auto_188784 ?auto_188783 ) ( ON ?auto_188785 ?auto_188784 ) ( ON ?auto_188786 ?auto_188785 ) ( not ( = ?auto_188781 ?auto_188782 ) ) ( not ( = ?auto_188781 ?auto_188783 ) ) ( not ( = ?auto_188781 ?auto_188784 ) ) ( not ( = ?auto_188781 ?auto_188785 ) ) ( not ( = ?auto_188781 ?auto_188786 ) ) ( not ( = ?auto_188781 ?auto_188787 ) ) ( not ( = ?auto_188781 ?auto_188788 ) ) ( not ( = ?auto_188782 ?auto_188783 ) ) ( not ( = ?auto_188782 ?auto_188784 ) ) ( not ( = ?auto_188782 ?auto_188785 ) ) ( not ( = ?auto_188782 ?auto_188786 ) ) ( not ( = ?auto_188782 ?auto_188787 ) ) ( not ( = ?auto_188782 ?auto_188788 ) ) ( not ( = ?auto_188783 ?auto_188784 ) ) ( not ( = ?auto_188783 ?auto_188785 ) ) ( not ( = ?auto_188783 ?auto_188786 ) ) ( not ( = ?auto_188783 ?auto_188787 ) ) ( not ( = ?auto_188783 ?auto_188788 ) ) ( not ( = ?auto_188784 ?auto_188785 ) ) ( not ( = ?auto_188784 ?auto_188786 ) ) ( not ( = ?auto_188784 ?auto_188787 ) ) ( not ( = ?auto_188784 ?auto_188788 ) ) ( not ( = ?auto_188785 ?auto_188786 ) ) ( not ( = ?auto_188785 ?auto_188787 ) ) ( not ( = ?auto_188785 ?auto_188788 ) ) ( not ( = ?auto_188786 ?auto_188787 ) ) ( not ( = ?auto_188786 ?auto_188788 ) ) ( not ( = ?auto_188787 ?auto_188788 ) ) ( ON ?auto_188788 ?auto_188789 ) ( not ( = ?auto_188781 ?auto_188789 ) ) ( not ( = ?auto_188782 ?auto_188789 ) ) ( not ( = ?auto_188783 ?auto_188789 ) ) ( not ( = ?auto_188784 ?auto_188789 ) ) ( not ( = ?auto_188785 ?auto_188789 ) ) ( not ( = ?auto_188786 ?auto_188789 ) ) ( not ( = ?auto_188787 ?auto_188789 ) ) ( not ( = ?auto_188788 ?auto_188789 ) ) ( CLEAR ?auto_188786 ) ( ON ?auto_188787 ?auto_188788 ) ( CLEAR ?auto_188787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188789 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188789 ?auto_188788 )
      ( MAKE-8PILE ?auto_188781 ?auto_188782 ?auto_188783 ?auto_188784 ?auto_188785 ?auto_188786 ?auto_188787 ?auto_188788 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188790 - BLOCK
      ?auto_188791 - BLOCK
      ?auto_188792 - BLOCK
      ?auto_188793 - BLOCK
      ?auto_188794 - BLOCK
      ?auto_188795 - BLOCK
      ?auto_188796 - BLOCK
      ?auto_188797 - BLOCK
    )
    :vars
    (
      ?auto_188798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188790 ) ( ON ?auto_188791 ?auto_188790 ) ( ON ?auto_188792 ?auto_188791 ) ( ON ?auto_188793 ?auto_188792 ) ( ON ?auto_188794 ?auto_188793 ) ( not ( = ?auto_188790 ?auto_188791 ) ) ( not ( = ?auto_188790 ?auto_188792 ) ) ( not ( = ?auto_188790 ?auto_188793 ) ) ( not ( = ?auto_188790 ?auto_188794 ) ) ( not ( = ?auto_188790 ?auto_188795 ) ) ( not ( = ?auto_188790 ?auto_188796 ) ) ( not ( = ?auto_188790 ?auto_188797 ) ) ( not ( = ?auto_188791 ?auto_188792 ) ) ( not ( = ?auto_188791 ?auto_188793 ) ) ( not ( = ?auto_188791 ?auto_188794 ) ) ( not ( = ?auto_188791 ?auto_188795 ) ) ( not ( = ?auto_188791 ?auto_188796 ) ) ( not ( = ?auto_188791 ?auto_188797 ) ) ( not ( = ?auto_188792 ?auto_188793 ) ) ( not ( = ?auto_188792 ?auto_188794 ) ) ( not ( = ?auto_188792 ?auto_188795 ) ) ( not ( = ?auto_188792 ?auto_188796 ) ) ( not ( = ?auto_188792 ?auto_188797 ) ) ( not ( = ?auto_188793 ?auto_188794 ) ) ( not ( = ?auto_188793 ?auto_188795 ) ) ( not ( = ?auto_188793 ?auto_188796 ) ) ( not ( = ?auto_188793 ?auto_188797 ) ) ( not ( = ?auto_188794 ?auto_188795 ) ) ( not ( = ?auto_188794 ?auto_188796 ) ) ( not ( = ?auto_188794 ?auto_188797 ) ) ( not ( = ?auto_188795 ?auto_188796 ) ) ( not ( = ?auto_188795 ?auto_188797 ) ) ( not ( = ?auto_188796 ?auto_188797 ) ) ( ON ?auto_188797 ?auto_188798 ) ( not ( = ?auto_188790 ?auto_188798 ) ) ( not ( = ?auto_188791 ?auto_188798 ) ) ( not ( = ?auto_188792 ?auto_188798 ) ) ( not ( = ?auto_188793 ?auto_188798 ) ) ( not ( = ?auto_188794 ?auto_188798 ) ) ( not ( = ?auto_188795 ?auto_188798 ) ) ( not ( = ?auto_188796 ?auto_188798 ) ) ( not ( = ?auto_188797 ?auto_188798 ) ) ( ON ?auto_188796 ?auto_188797 ) ( CLEAR ?auto_188796 ) ( ON-TABLE ?auto_188798 ) ( HOLDING ?auto_188795 ) ( CLEAR ?auto_188794 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188790 ?auto_188791 ?auto_188792 ?auto_188793 ?auto_188794 ?auto_188795 )
      ( MAKE-8PILE ?auto_188790 ?auto_188791 ?auto_188792 ?auto_188793 ?auto_188794 ?auto_188795 ?auto_188796 ?auto_188797 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188799 - BLOCK
      ?auto_188800 - BLOCK
      ?auto_188801 - BLOCK
      ?auto_188802 - BLOCK
      ?auto_188803 - BLOCK
      ?auto_188804 - BLOCK
      ?auto_188805 - BLOCK
      ?auto_188806 - BLOCK
    )
    :vars
    (
      ?auto_188807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188799 ) ( ON ?auto_188800 ?auto_188799 ) ( ON ?auto_188801 ?auto_188800 ) ( ON ?auto_188802 ?auto_188801 ) ( ON ?auto_188803 ?auto_188802 ) ( not ( = ?auto_188799 ?auto_188800 ) ) ( not ( = ?auto_188799 ?auto_188801 ) ) ( not ( = ?auto_188799 ?auto_188802 ) ) ( not ( = ?auto_188799 ?auto_188803 ) ) ( not ( = ?auto_188799 ?auto_188804 ) ) ( not ( = ?auto_188799 ?auto_188805 ) ) ( not ( = ?auto_188799 ?auto_188806 ) ) ( not ( = ?auto_188800 ?auto_188801 ) ) ( not ( = ?auto_188800 ?auto_188802 ) ) ( not ( = ?auto_188800 ?auto_188803 ) ) ( not ( = ?auto_188800 ?auto_188804 ) ) ( not ( = ?auto_188800 ?auto_188805 ) ) ( not ( = ?auto_188800 ?auto_188806 ) ) ( not ( = ?auto_188801 ?auto_188802 ) ) ( not ( = ?auto_188801 ?auto_188803 ) ) ( not ( = ?auto_188801 ?auto_188804 ) ) ( not ( = ?auto_188801 ?auto_188805 ) ) ( not ( = ?auto_188801 ?auto_188806 ) ) ( not ( = ?auto_188802 ?auto_188803 ) ) ( not ( = ?auto_188802 ?auto_188804 ) ) ( not ( = ?auto_188802 ?auto_188805 ) ) ( not ( = ?auto_188802 ?auto_188806 ) ) ( not ( = ?auto_188803 ?auto_188804 ) ) ( not ( = ?auto_188803 ?auto_188805 ) ) ( not ( = ?auto_188803 ?auto_188806 ) ) ( not ( = ?auto_188804 ?auto_188805 ) ) ( not ( = ?auto_188804 ?auto_188806 ) ) ( not ( = ?auto_188805 ?auto_188806 ) ) ( ON ?auto_188806 ?auto_188807 ) ( not ( = ?auto_188799 ?auto_188807 ) ) ( not ( = ?auto_188800 ?auto_188807 ) ) ( not ( = ?auto_188801 ?auto_188807 ) ) ( not ( = ?auto_188802 ?auto_188807 ) ) ( not ( = ?auto_188803 ?auto_188807 ) ) ( not ( = ?auto_188804 ?auto_188807 ) ) ( not ( = ?auto_188805 ?auto_188807 ) ) ( not ( = ?auto_188806 ?auto_188807 ) ) ( ON ?auto_188805 ?auto_188806 ) ( ON-TABLE ?auto_188807 ) ( CLEAR ?auto_188803 ) ( ON ?auto_188804 ?auto_188805 ) ( CLEAR ?auto_188804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188807 ?auto_188806 ?auto_188805 )
      ( MAKE-8PILE ?auto_188799 ?auto_188800 ?auto_188801 ?auto_188802 ?auto_188803 ?auto_188804 ?auto_188805 ?auto_188806 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188808 - BLOCK
      ?auto_188809 - BLOCK
      ?auto_188810 - BLOCK
      ?auto_188811 - BLOCK
      ?auto_188812 - BLOCK
      ?auto_188813 - BLOCK
      ?auto_188814 - BLOCK
      ?auto_188815 - BLOCK
    )
    :vars
    (
      ?auto_188816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188808 ) ( ON ?auto_188809 ?auto_188808 ) ( ON ?auto_188810 ?auto_188809 ) ( ON ?auto_188811 ?auto_188810 ) ( not ( = ?auto_188808 ?auto_188809 ) ) ( not ( = ?auto_188808 ?auto_188810 ) ) ( not ( = ?auto_188808 ?auto_188811 ) ) ( not ( = ?auto_188808 ?auto_188812 ) ) ( not ( = ?auto_188808 ?auto_188813 ) ) ( not ( = ?auto_188808 ?auto_188814 ) ) ( not ( = ?auto_188808 ?auto_188815 ) ) ( not ( = ?auto_188809 ?auto_188810 ) ) ( not ( = ?auto_188809 ?auto_188811 ) ) ( not ( = ?auto_188809 ?auto_188812 ) ) ( not ( = ?auto_188809 ?auto_188813 ) ) ( not ( = ?auto_188809 ?auto_188814 ) ) ( not ( = ?auto_188809 ?auto_188815 ) ) ( not ( = ?auto_188810 ?auto_188811 ) ) ( not ( = ?auto_188810 ?auto_188812 ) ) ( not ( = ?auto_188810 ?auto_188813 ) ) ( not ( = ?auto_188810 ?auto_188814 ) ) ( not ( = ?auto_188810 ?auto_188815 ) ) ( not ( = ?auto_188811 ?auto_188812 ) ) ( not ( = ?auto_188811 ?auto_188813 ) ) ( not ( = ?auto_188811 ?auto_188814 ) ) ( not ( = ?auto_188811 ?auto_188815 ) ) ( not ( = ?auto_188812 ?auto_188813 ) ) ( not ( = ?auto_188812 ?auto_188814 ) ) ( not ( = ?auto_188812 ?auto_188815 ) ) ( not ( = ?auto_188813 ?auto_188814 ) ) ( not ( = ?auto_188813 ?auto_188815 ) ) ( not ( = ?auto_188814 ?auto_188815 ) ) ( ON ?auto_188815 ?auto_188816 ) ( not ( = ?auto_188808 ?auto_188816 ) ) ( not ( = ?auto_188809 ?auto_188816 ) ) ( not ( = ?auto_188810 ?auto_188816 ) ) ( not ( = ?auto_188811 ?auto_188816 ) ) ( not ( = ?auto_188812 ?auto_188816 ) ) ( not ( = ?auto_188813 ?auto_188816 ) ) ( not ( = ?auto_188814 ?auto_188816 ) ) ( not ( = ?auto_188815 ?auto_188816 ) ) ( ON ?auto_188814 ?auto_188815 ) ( ON-TABLE ?auto_188816 ) ( ON ?auto_188813 ?auto_188814 ) ( CLEAR ?auto_188813 ) ( HOLDING ?auto_188812 ) ( CLEAR ?auto_188811 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188808 ?auto_188809 ?auto_188810 ?auto_188811 ?auto_188812 )
      ( MAKE-8PILE ?auto_188808 ?auto_188809 ?auto_188810 ?auto_188811 ?auto_188812 ?auto_188813 ?auto_188814 ?auto_188815 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188817 - BLOCK
      ?auto_188818 - BLOCK
      ?auto_188819 - BLOCK
      ?auto_188820 - BLOCK
      ?auto_188821 - BLOCK
      ?auto_188822 - BLOCK
      ?auto_188823 - BLOCK
      ?auto_188824 - BLOCK
    )
    :vars
    (
      ?auto_188825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188817 ) ( ON ?auto_188818 ?auto_188817 ) ( ON ?auto_188819 ?auto_188818 ) ( ON ?auto_188820 ?auto_188819 ) ( not ( = ?auto_188817 ?auto_188818 ) ) ( not ( = ?auto_188817 ?auto_188819 ) ) ( not ( = ?auto_188817 ?auto_188820 ) ) ( not ( = ?auto_188817 ?auto_188821 ) ) ( not ( = ?auto_188817 ?auto_188822 ) ) ( not ( = ?auto_188817 ?auto_188823 ) ) ( not ( = ?auto_188817 ?auto_188824 ) ) ( not ( = ?auto_188818 ?auto_188819 ) ) ( not ( = ?auto_188818 ?auto_188820 ) ) ( not ( = ?auto_188818 ?auto_188821 ) ) ( not ( = ?auto_188818 ?auto_188822 ) ) ( not ( = ?auto_188818 ?auto_188823 ) ) ( not ( = ?auto_188818 ?auto_188824 ) ) ( not ( = ?auto_188819 ?auto_188820 ) ) ( not ( = ?auto_188819 ?auto_188821 ) ) ( not ( = ?auto_188819 ?auto_188822 ) ) ( not ( = ?auto_188819 ?auto_188823 ) ) ( not ( = ?auto_188819 ?auto_188824 ) ) ( not ( = ?auto_188820 ?auto_188821 ) ) ( not ( = ?auto_188820 ?auto_188822 ) ) ( not ( = ?auto_188820 ?auto_188823 ) ) ( not ( = ?auto_188820 ?auto_188824 ) ) ( not ( = ?auto_188821 ?auto_188822 ) ) ( not ( = ?auto_188821 ?auto_188823 ) ) ( not ( = ?auto_188821 ?auto_188824 ) ) ( not ( = ?auto_188822 ?auto_188823 ) ) ( not ( = ?auto_188822 ?auto_188824 ) ) ( not ( = ?auto_188823 ?auto_188824 ) ) ( ON ?auto_188824 ?auto_188825 ) ( not ( = ?auto_188817 ?auto_188825 ) ) ( not ( = ?auto_188818 ?auto_188825 ) ) ( not ( = ?auto_188819 ?auto_188825 ) ) ( not ( = ?auto_188820 ?auto_188825 ) ) ( not ( = ?auto_188821 ?auto_188825 ) ) ( not ( = ?auto_188822 ?auto_188825 ) ) ( not ( = ?auto_188823 ?auto_188825 ) ) ( not ( = ?auto_188824 ?auto_188825 ) ) ( ON ?auto_188823 ?auto_188824 ) ( ON-TABLE ?auto_188825 ) ( ON ?auto_188822 ?auto_188823 ) ( CLEAR ?auto_188820 ) ( ON ?auto_188821 ?auto_188822 ) ( CLEAR ?auto_188821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188825 ?auto_188824 ?auto_188823 ?auto_188822 )
      ( MAKE-8PILE ?auto_188817 ?auto_188818 ?auto_188819 ?auto_188820 ?auto_188821 ?auto_188822 ?auto_188823 ?auto_188824 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188826 - BLOCK
      ?auto_188827 - BLOCK
      ?auto_188828 - BLOCK
      ?auto_188829 - BLOCK
      ?auto_188830 - BLOCK
      ?auto_188831 - BLOCK
      ?auto_188832 - BLOCK
      ?auto_188833 - BLOCK
    )
    :vars
    (
      ?auto_188834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188826 ) ( ON ?auto_188827 ?auto_188826 ) ( ON ?auto_188828 ?auto_188827 ) ( not ( = ?auto_188826 ?auto_188827 ) ) ( not ( = ?auto_188826 ?auto_188828 ) ) ( not ( = ?auto_188826 ?auto_188829 ) ) ( not ( = ?auto_188826 ?auto_188830 ) ) ( not ( = ?auto_188826 ?auto_188831 ) ) ( not ( = ?auto_188826 ?auto_188832 ) ) ( not ( = ?auto_188826 ?auto_188833 ) ) ( not ( = ?auto_188827 ?auto_188828 ) ) ( not ( = ?auto_188827 ?auto_188829 ) ) ( not ( = ?auto_188827 ?auto_188830 ) ) ( not ( = ?auto_188827 ?auto_188831 ) ) ( not ( = ?auto_188827 ?auto_188832 ) ) ( not ( = ?auto_188827 ?auto_188833 ) ) ( not ( = ?auto_188828 ?auto_188829 ) ) ( not ( = ?auto_188828 ?auto_188830 ) ) ( not ( = ?auto_188828 ?auto_188831 ) ) ( not ( = ?auto_188828 ?auto_188832 ) ) ( not ( = ?auto_188828 ?auto_188833 ) ) ( not ( = ?auto_188829 ?auto_188830 ) ) ( not ( = ?auto_188829 ?auto_188831 ) ) ( not ( = ?auto_188829 ?auto_188832 ) ) ( not ( = ?auto_188829 ?auto_188833 ) ) ( not ( = ?auto_188830 ?auto_188831 ) ) ( not ( = ?auto_188830 ?auto_188832 ) ) ( not ( = ?auto_188830 ?auto_188833 ) ) ( not ( = ?auto_188831 ?auto_188832 ) ) ( not ( = ?auto_188831 ?auto_188833 ) ) ( not ( = ?auto_188832 ?auto_188833 ) ) ( ON ?auto_188833 ?auto_188834 ) ( not ( = ?auto_188826 ?auto_188834 ) ) ( not ( = ?auto_188827 ?auto_188834 ) ) ( not ( = ?auto_188828 ?auto_188834 ) ) ( not ( = ?auto_188829 ?auto_188834 ) ) ( not ( = ?auto_188830 ?auto_188834 ) ) ( not ( = ?auto_188831 ?auto_188834 ) ) ( not ( = ?auto_188832 ?auto_188834 ) ) ( not ( = ?auto_188833 ?auto_188834 ) ) ( ON ?auto_188832 ?auto_188833 ) ( ON-TABLE ?auto_188834 ) ( ON ?auto_188831 ?auto_188832 ) ( ON ?auto_188830 ?auto_188831 ) ( CLEAR ?auto_188830 ) ( HOLDING ?auto_188829 ) ( CLEAR ?auto_188828 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188826 ?auto_188827 ?auto_188828 ?auto_188829 )
      ( MAKE-8PILE ?auto_188826 ?auto_188827 ?auto_188828 ?auto_188829 ?auto_188830 ?auto_188831 ?auto_188832 ?auto_188833 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188835 - BLOCK
      ?auto_188836 - BLOCK
      ?auto_188837 - BLOCK
      ?auto_188838 - BLOCK
      ?auto_188839 - BLOCK
      ?auto_188840 - BLOCK
      ?auto_188841 - BLOCK
      ?auto_188842 - BLOCK
    )
    :vars
    (
      ?auto_188843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188835 ) ( ON ?auto_188836 ?auto_188835 ) ( ON ?auto_188837 ?auto_188836 ) ( not ( = ?auto_188835 ?auto_188836 ) ) ( not ( = ?auto_188835 ?auto_188837 ) ) ( not ( = ?auto_188835 ?auto_188838 ) ) ( not ( = ?auto_188835 ?auto_188839 ) ) ( not ( = ?auto_188835 ?auto_188840 ) ) ( not ( = ?auto_188835 ?auto_188841 ) ) ( not ( = ?auto_188835 ?auto_188842 ) ) ( not ( = ?auto_188836 ?auto_188837 ) ) ( not ( = ?auto_188836 ?auto_188838 ) ) ( not ( = ?auto_188836 ?auto_188839 ) ) ( not ( = ?auto_188836 ?auto_188840 ) ) ( not ( = ?auto_188836 ?auto_188841 ) ) ( not ( = ?auto_188836 ?auto_188842 ) ) ( not ( = ?auto_188837 ?auto_188838 ) ) ( not ( = ?auto_188837 ?auto_188839 ) ) ( not ( = ?auto_188837 ?auto_188840 ) ) ( not ( = ?auto_188837 ?auto_188841 ) ) ( not ( = ?auto_188837 ?auto_188842 ) ) ( not ( = ?auto_188838 ?auto_188839 ) ) ( not ( = ?auto_188838 ?auto_188840 ) ) ( not ( = ?auto_188838 ?auto_188841 ) ) ( not ( = ?auto_188838 ?auto_188842 ) ) ( not ( = ?auto_188839 ?auto_188840 ) ) ( not ( = ?auto_188839 ?auto_188841 ) ) ( not ( = ?auto_188839 ?auto_188842 ) ) ( not ( = ?auto_188840 ?auto_188841 ) ) ( not ( = ?auto_188840 ?auto_188842 ) ) ( not ( = ?auto_188841 ?auto_188842 ) ) ( ON ?auto_188842 ?auto_188843 ) ( not ( = ?auto_188835 ?auto_188843 ) ) ( not ( = ?auto_188836 ?auto_188843 ) ) ( not ( = ?auto_188837 ?auto_188843 ) ) ( not ( = ?auto_188838 ?auto_188843 ) ) ( not ( = ?auto_188839 ?auto_188843 ) ) ( not ( = ?auto_188840 ?auto_188843 ) ) ( not ( = ?auto_188841 ?auto_188843 ) ) ( not ( = ?auto_188842 ?auto_188843 ) ) ( ON ?auto_188841 ?auto_188842 ) ( ON-TABLE ?auto_188843 ) ( ON ?auto_188840 ?auto_188841 ) ( ON ?auto_188839 ?auto_188840 ) ( CLEAR ?auto_188837 ) ( ON ?auto_188838 ?auto_188839 ) ( CLEAR ?auto_188838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188843 ?auto_188842 ?auto_188841 ?auto_188840 ?auto_188839 )
      ( MAKE-8PILE ?auto_188835 ?auto_188836 ?auto_188837 ?auto_188838 ?auto_188839 ?auto_188840 ?auto_188841 ?auto_188842 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188844 - BLOCK
      ?auto_188845 - BLOCK
      ?auto_188846 - BLOCK
      ?auto_188847 - BLOCK
      ?auto_188848 - BLOCK
      ?auto_188849 - BLOCK
      ?auto_188850 - BLOCK
      ?auto_188851 - BLOCK
    )
    :vars
    (
      ?auto_188852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188844 ) ( ON ?auto_188845 ?auto_188844 ) ( not ( = ?auto_188844 ?auto_188845 ) ) ( not ( = ?auto_188844 ?auto_188846 ) ) ( not ( = ?auto_188844 ?auto_188847 ) ) ( not ( = ?auto_188844 ?auto_188848 ) ) ( not ( = ?auto_188844 ?auto_188849 ) ) ( not ( = ?auto_188844 ?auto_188850 ) ) ( not ( = ?auto_188844 ?auto_188851 ) ) ( not ( = ?auto_188845 ?auto_188846 ) ) ( not ( = ?auto_188845 ?auto_188847 ) ) ( not ( = ?auto_188845 ?auto_188848 ) ) ( not ( = ?auto_188845 ?auto_188849 ) ) ( not ( = ?auto_188845 ?auto_188850 ) ) ( not ( = ?auto_188845 ?auto_188851 ) ) ( not ( = ?auto_188846 ?auto_188847 ) ) ( not ( = ?auto_188846 ?auto_188848 ) ) ( not ( = ?auto_188846 ?auto_188849 ) ) ( not ( = ?auto_188846 ?auto_188850 ) ) ( not ( = ?auto_188846 ?auto_188851 ) ) ( not ( = ?auto_188847 ?auto_188848 ) ) ( not ( = ?auto_188847 ?auto_188849 ) ) ( not ( = ?auto_188847 ?auto_188850 ) ) ( not ( = ?auto_188847 ?auto_188851 ) ) ( not ( = ?auto_188848 ?auto_188849 ) ) ( not ( = ?auto_188848 ?auto_188850 ) ) ( not ( = ?auto_188848 ?auto_188851 ) ) ( not ( = ?auto_188849 ?auto_188850 ) ) ( not ( = ?auto_188849 ?auto_188851 ) ) ( not ( = ?auto_188850 ?auto_188851 ) ) ( ON ?auto_188851 ?auto_188852 ) ( not ( = ?auto_188844 ?auto_188852 ) ) ( not ( = ?auto_188845 ?auto_188852 ) ) ( not ( = ?auto_188846 ?auto_188852 ) ) ( not ( = ?auto_188847 ?auto_188852 ) ) ( not ( = ?auto_188848 ?auto_188852 ) ) ( not ( = ?auto_188849 ?auto_188852 ) ) ( not ( = ?auto_188850 ?auto_188852 ) ) ( not ( = ?auto_188851 ?auto_188852 ) ) ( ON ?auto_188850 ?auto_188851 ) ( ON-TABLE ?auto_188852 ) ( ON ?auto_188849 ?auto_188850 ) ( ON ?auto_188848 ?auto_188849 ) ( ON ?auto_188847 ?auto_188848 ) ( CLEAR ?auto_188847 ) ( HOLDING ?auto_188846 ) ( CLEAR ?auto_188845 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188844 ?auto_188845 ?auto_188846 )
      ( MAKE-8PILE ?auto_188844 ?auto_188845 ?auto_188846 ?auto_188847 ?auto_188848 ?auto_188849 ?auto_188850 ?auto_188851 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188853 - BLOCK
      ?auto_188854 - BLOCK
      ?auto_188855 - BLOCK
      ?auto_188856 - BLOCK
      ?auto_188857 - BLOCK
      ?auto_188858 - BLOCK
      ?auto_188859 - BLOCK
      ?auto_188860 - BLOCK
    )
    :vars
    (
      ?auto_188861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188853 ) ( ON ?auto_188854 ?auto_188853 ) ( not ( = ?auto_188853 ?auto_188854 ) ) ( not ( = ?auto_188853 ?auto_188855 ) ) ( not ( = ?auto_188853 ?auto_188856 ) ) ( not ( = ?auto_188853 ?auto_188857 ) ) ( not ( = ?auto_188853 ?auto_188858 ) ) ( not ( = ?auto_188853 ?auto_188859 ) ) ( not ( = ?auto_188853 ?auto_188860 ) ) ( not ( = ?auto_188854 ?auto_188855 ) ) ( not ( = ?auto_188854 ?auto_188856 ) ) ( not ( = ?auto_188854 ?auto_188857 ) ) ( not ( = ?auto_188854 ?auto_188858 ) ) ( not ( = ?auto_188854 ?auto_188859 ) ) ( not ( = ?auto_188854 ?auto_188860 ) ) ( not ( = ?auto_188855 ?auto_188856 ) ) ( not ( = ?auto_188855 ?auto_188857 ) ) ( not ( = ?auto_188855 ?auto_188858 ) ) ( not ( = ?auto_188855 ?auto_188859 ) ) ( not ( = ?auto_188855 ?auto_188860 ) ) ( not ( = ?auto_188856 ?auto_188857 ) ) ( not ( = ?auto_188856 ?auto_188858 ) ) ( not ( = ?auto_188856 ?auto_188859 ) ) ( not ( = ?auto_188856 ?auto_188860 ) ) ( not ( = ?auto_188857 ?auto_188858 ) ) ( not ( = ?auto_188857 ?auto_188859 ) ) ( not ( = ?auto_188857 ?auto_188860 ) ) ( not ( = ?auto_188858 ?auto_188859 ) ) ( not ( = ?auto_188858 ?auto_188860 ) ) ( not ( = ?auto_188859 ?auto_188860 ) ) ( ON ?auto_188860 ?auto_188861 ) ( not ( = ?auto_188853 ?auto_188861 ) ) ( not ( = ?auto_188854 ?auto_188861 ) ) ( not ( = ?auto_188855 ?auto_188861 ) ) ( not ( = ?auto_188856 ?auto_188861 ) ) ( not ( = ?auto_188857 ?auto_188861 ) ) ( not ( = ?auto_188858 ?auto_188861 ) ) ( not ( = ?auto_188859 ?auto_188861 ) ) ( not ( = ?auto_188860 ?auto_188861 ) ) ( ON ?auto_188859 ?auto_188860 ) ( ON-TABLE ?auto_188861 ) ( ON ?auto_188858 ?auto_188859 ) ( ON ?auto_188857 ?auto_188858 ) ( ON ?auto_188856 ?auto_188857 ) ( CLEAR ?auto_188854 ) ( ON ?auto_188855 ?auto_188856 ) ( CLEAR ?auto_188855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188861 ?auto_188860 ?auto_188859 ?auto_188858 ?auto_188857 ?auto_188856 )
      ( MAKE-8PILE ?auto_188853 ?auto_188854 ?auto_188855 ?auto_188856 ?auto_188857 ?auto_188858 ?auto_188859 ?auto_188860 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188862 - BLOCK
      ?auto_188863 - BLOCK
      ?auto_188864 - BLOCK
      ?auto_188865 - BLOCK
      ?auto_188866 - BLOCK
      ?auto_188867 - BLOCK
      ?auto_188868 - BLOCK
      ?auto_188869 - BLOCK
    )
    :vars
    (
      ?auto_188870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188862 ) ( not ( = ?auto_188862 ?auto_188863 ) ) ( not ( = ?auto_188862 ?auto_188864 ) ) ( not ( = ?auto_188862 ?auto_188865 ) ) ( not ( = ?auto_188862 ?auto_188866 ) ) ( not ( = ?auto_188862 ?auto_188867 ) ) ( not ( = ?auto_188862 ?auto_188868 ) ) ( not ( = ?auto_188862 ?auto_188869 ) ) ( not ( = ?auto_188863 ?auto_188864 ) ) ( not ( = ?auto_188863 ?auto_188865 ) ) ( not ( = ?auto_188863 ?auto_188866 ) ) ( not ( = ?auto_188863 ?auto_188867 ) ) ( not ( = ?auto_188863 ?auto_188868 ) ) ( not ( = ?auto_188863 ?auto_188869 ) ) ( not ( = ?auto_188864 ?auto_188865 ) ) ( not ( = ?auto_188864 ?auto_188866 ) ) ( not ( = ?auto_188864 ?auto_188867 ) ) ( not ( = ?auto_188864 ?auto_188868 ) ) ( not ( = ?auto_188864 ?auto_188869 ) ) ( not ( = ?auto_188865 ?auto_188866 ) ) ( not ( = ?auto_188865 ?auto_188867 ) ) ( not ( = ?auto_188865 ?auto_188868 ) ) ( not ( = ?auto_188865 ?auto_188869 ) ) ( not ( = ?auto_188866 ?auto_188867 ) ) ( not ( = ?auto_188866 ?auto_188868 ) ) ( not ( = ?auto_188866 ?auto_188869 ) ) ( not ( = ?auto_188867 ?auto_188868 ) ) ( not ( = ?auto_188867 ?auto_188869 ) ) ( not ( = ?auto_188868 ?auto_188869 ) ) ( ON ?auto_188869 ?auto_188870 ) ( not ( = ?auto_188862 ?auto_188870 ) ) ( not ( = ?auto_188863 ?auto_188870 ) ) ( not ( = ?auto_188864 ?auto_188870 ) ) ( not ( = ?auto_188865 ?auto_188870 ) ) ( not ( = ?auto_188866 ?auto_188870 ) ) ( not ( = ?auto_188867 ?auto_188870 ) ) ( not ( = ?auto_188868 ?auto_188870 ) ) ( not ( = ?auto_188869 ?auto_188870 ) ) ( ON ?auto_188868 ?auto_188869 ) ( ON-TABLE ?auto_188870 ) ( ON ?auto_188867 ?auto_188868 ) ( ON ?auto_188866 ?auto_188867 ) ( ON ?auto_188865 ?auto_188866 ) ( ON ?auto_188864 ?auto_188865 ) ( CLEAR ?auto_188864 ) ( HOLDING ?auto_188863 ) ( CLEAR ?auto_188862 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188862 ?auto_188863 )
      ( MAKE-8PILE ?auto_188862 ?auto_188863 ?auto_188864 ?auto_188865 ?auto_188866 ?auto_188867 ?auto_188868 ?auto_188869 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188871 - BLOCK
      ?auto_188872 - BLOCK
      ?auto_188873 - BLOCK
      ?auto_188874 - BLOCK
      ?auto_188875 - BLOCK
      ?auto_188876 - BLOCK
      ?auto_188877 - BLOCK
      ?auto_188878 - BLOCK
    )
    :vars
    (
      ?auto_188879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188871 ) ( not ( = ?auto_188871 ?auto_188872 ) ) ( not ( = ?auto_188871 ?auto_188873 ) ) ( not ( = ?auto_188871 ?auto_188874 ) ) ( not ( = ?auto_188871 ?auto_188875 ) ) ( not ( = ?auto_188871 ?auto_188876 ) ) ( not ( = ?auto_188871 ?auto_188877 ) ) ( not ( = ?auto_188871 ?auto_188878 ) ) ( not ( = ?auto_188872 ?auto_188873 ) ) ( not ( = ?auto_188872 ?auto_188874 ) ) ( not ( = ?auto_188872 ?auto_188875 ) ) ( not ( = ?auto_188872 ?auto_188876 ) ) ( not ( = ?auto_188872 ?auto_188877 ) ) ( not ( = ?auto_188872 ?auto_188878 ) ) ( not ( = ?auto_188873 ?auto_188874 ) ) ( not ( = ?auto_188873 ?auto_188875 ) ) ( not ( = ?auto_188873 ?auto_188876 ) ) ( not ( = ?auto_188873 ?auto_188877 ) ) ( not ( = ?auto_188873 ?auto_188878 ) ) ( not ( = ?auto_188874 ?auto_188875 ) ) ( not ( = ?auto_188874 ?auto_188876 ) ) ( not ( = ?auto_188874 ?auto_188877 ) ) ( not ( = ?auto_188874 ?auto_188878 ) ) ( not ( = ?auto_188875 ?auto_188876 ) ) ( not ( = ?auto_188875 ?auto_188877 ) ) ( not ( = ?auto_188875 ?auto_188878 ) ) ( not ( = ?auto_188876 ?auto_188877 ) ) ( not ( = ?auto_188876 ?auto_188878 ) ) ( not ( = ?auto_188877 ?auto_188878 ) ) ( ON ?auto_188878 ?auto_188879 ) ( not ( = ?auto_188871 ?auto_188879 ) ) ( not ( = ?auto_188872 ?auto_188879 ) ) ( not ( = ?auto_188873 ?auto_188879 ) ) ( not ( = ?auto_188874 ?auto_188879 ) ) ( not ( = ?auto_188875 ?auto_188879 ) ) ( not ( = ?auto_188876 ?auto_188879 ) ) ( not ( = ?auto_188877 ?auto_188879 ) ) ( not ( = ?auto_188878 ?auto_188879 ) ) ( ON ?auto_188877 ?auto_188878 ) ( ON-TABLE ?auto_188879 ) ( ON ?auto_188876 ?auto_188877 ) ( ON ?auto_188875 ?auto_188876 ) ( ON ?auto_188874 ?auto_188875 ) ( ON ?auto_188873 ?auto_188874 ) ( CLEAR ?auto_188871 ) ( ON ?auto_188872 ?auto_188873 ) ( CLEAR ?auto_188872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188879 ?auto_188878 ?auto_188877 ?auto_188876 ?auto_188875 ?auto_188874 ?auto_188873 )
      ( MAKE-8PILE ?auto_188871 ?auto_188872 ?auto_188873 ?auto_188874 ?auto_188875 ?auto_188876 ?auto_188877 ?auto_188878 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188880 - BLOCK
      ?auto_188881 - BLOCK
      ?auto_188882 - BLOCK
      ?auto_188883 - BLOCK
      ?auto_188884 - BLOCK
      ?auto_188885 - BLOCK
      ?auto_188886 - BLOCK
      ?auto_188887 - BLOCK
    )
    :vars
    (
      ?auto_188888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188880 ?auto_188881 ) ) ( not ( = ?auto_188880 ?auto_188882 ) ) ( not ( = ?auto_188880 ?auto_188883 ) ) ( not ( = ?auto_188880 ?auto_188884 ) ) ( not ( = ?auto_188880 ?auto_188885 ) ) ( not ( = ?auto_188880 ?auto_188886 ) ) ( not ( = ?auto_188880 ?auto_188887 ) ) ( not ( = ?auto_188881 ?auto_188882 ) ) ( not ( = ?auto_188881 ?auto_188883 ) ) ( not ( = ?auto_188881 ?auto_188884 ) ) ( not ( = ?auto_188881 ?auto_188885 ) ) ( not ( = ?auto_188881 ?auto_188886 ) ) ( not ( = ?auto_188881 ?auto_188887 ) ) ( not ( = ?auto_188882 ?auto_188883 ) ) ( not ( = ?auto_188882 ?auto_188884 ) ) ( not ( = ?auto_188882 ?auto_188885 ) ) ( not ( = ?auto_188882 ?auto_188886 ) ) ( not ( = ?auto_188882 ?auto_188887 ) ) ( not ( = ?auto_188883 ?auto_188884 ) ) ( not ( = ?auto_188883 ?auto_188885 ) ) ( not ( = ?auto_188883 ?auto_188886 ) ) ( not ( = ?auto_188883 ?auto_188887 ) ) ( not ( = ?auto_188884 ?auto_188885 ) ) ( not ( = ?auto_188884 ?auto_188886 ) ) ( not ( = ?auto_188884 ?auto_188887 ) ) ( not ( = ?auto_188885 ?auto_188886 ) ) ( not ( = ?auto_188885 ?auto_188887 ) ) ( not ( = ?auto_188886 ?auto_188887 ) ) ( ON ?auto_188887 ?auto_188888 ) ( not ( = ?auto_188880 ?auto_188888 ) ) ( not ( = ?auto_188881 ?auto_188888 ) ) ( not ( = ?auto_188882 ?auto_188888 ) ) ( not ( = ?auto_188883 ?auto_188888 ) ) ( not ( = ?auto_188884 ?auto_188888 ) ) ( not ( = ?auto_188885 ?auto_188888 ) ) ( not ( = ?auto_188886 ?auto_188888 ) ) ( not ( = ?auto_188887 ?auto_188888 ) ) ( ON ?auto_188886 ?auto_188887 ) ( ON-TABLE ?auto_188888 ) ( ON ?auto_188885 ?auto_188886 ) ( ON ?auto_188884 ?auto_188885 ) ( ON ?auto_188883 ?auto_188884 ) ( ON ?auto_188882 ?auto_188883 ) ( ON ?auto_188881 ?auto_188882 ) ( CLEAR ?auto_188881 ) ( HOLDING ?auto_188880 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188880 )
      ( MAKE-8PILE ?auto_188880 ?auto_188881 ?auto_188882 ?auto_188883 ?auto_188884 ?auto_188885 ?auto_188886 ?auto_188887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188889 - BLOCK
      ?auto_188890 - BLOCK
      ?auto_188891 - BLOCK
      ?auto_188892 - BLOCK
      ?auto_188893 - BLOCK
      ?auto_188894 - BLOCK
      ?auto_188895 - BLOCK
      ?auto_188896 - BLOCK
    )
    :vars
    (
      ?auto_188897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188889 ?auto_188890 ) ) ( not ( = ?auto_188889 ?auto_188891 ) ) ( not ( = ?auto_188889 ?auto_188892 ) ) ( not ( = ?auto_188889 ?auto_188893 ) ) ( not ( = ?auto_188889 ?auto_188894 ) ) ( not ( = ?auto_188889 ?auto_188895 ) ) ( not ( = ?auto_188889 ?auto_188896 ) ) ( not ( = ?auto_188890 ?auto_188891 ) ) ( not ( = ?auto_188890 ?auto_188892 ) ) ( not ( = ?auto_188890 ?auto_188893 ) ) ( not ( = ?auto_188890 ?auto_188894 ) ) ( not ( = ?auto_188890 ?auto_188895 ) ) ( not ( = ?auto_188890 ?auto_188896 ) ) ( not ( = ?auto_188891 ?auto_188892 ) ) ( not ( = ?auto_188891 ?auto_188893 ) ) ( not ( = ?auto_188891 ?auto_188894 ) ) ( not ( = ?auto_188891 ?auto_188895 ) ) ( not ( = ?auto_188891 ?auto_188896 ) ) ( not ( = ?auto_188892 ?auto_188893 ) ) ( not ( = ?auto_188892 ?auto_188894 ) ) ( not ( = ?auto_188892 ?auto_188895 ) ) ( not ( = ?auto_188892 ?auto_188896 ) ) ( not ( = ?auto_188893 ?auto_188894 ) ) ( not ( = ?auto_188893 ?auto_188895 ) ) ( not ( = ?auto_188893 ?auto_188896 ) ) ( not ( = ?auto_188894 ?auto_188895 ) ) ( not ( = ?auto_188894 ?auto_188896 ) ) ( not ( = ?auto_188895 ?auto_188896 ) ) ( ON ?auto_188896 ?auto_188897 ) ( not ( = ?auto_188889 ?auto_188897 ) ) ( not ( = ?auto_188890 ?auto_188897 ) ) ( not ( = ?auto_188891 ?auto_188897 ) ) ( not ( = ?auto_188892 ?auto_188897 ) ) ( not ( = ?auto_188893 ?auto_188897 ) ) ( not ( = ?auto_188894 ?auto_188897 ) ) ( not ( = ?auto_188895 ?auto_188897 ) ) ( not ( = ?auto_188896 ?auto_188897 ) ) ( ON ?auto_188895 ?auto_188896 ) ( ON-TABLE ?auto_188897 ) ( ON ?auto_188894 ?auto_188895 ) ( ON ?auto_188893 ?auto_188894 ) ( ON ?auto_188892 ?auto_188893 ) ( ON ?auto_188891 ?auto_188892 ) ( ON ?auto_188890 ?auto_188891 ) ( ON ?auto_188889 ?auto_188890 ) ( CLEAR ?auto_188889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188897 ?auto_188896 ?auto_188895 ?auto_188894 ?auto_188893 ?auto_188892 ?auto_188891 ?auto_188890 )
      ( MAKE-8PILE ?auto_188889 ?auto_188890 ?auto_188891 ?auto_188892 ?auto_188893 ?auto_188894 ?auto_188895 ?auto_188896 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188905 - BLOCK
      ?auto_188906 - BLOCK
      ?auto_188907 - BLOCK
      ?auto_188908 - BLOCK
      ?auto_188909 - BLOCK
      ?auto_188910 - BLOCK
      ?auto_188911 - BLOCK
    )
    :vars
    (
      ?auto_188912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188912 ?auto_188911 ) ( CLEAR ?auto_188912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188905 ) ( ON ?auto_188906 ?auto_188905 ) ( ON ?auto_188907 ?auto_188906 ) ( ON ?auto_188908 ?auto_188907 ) ( ON ?auto_188909 ?auto_188908 ) ( ON ?auto_188910 ?auto_188909 ) ( ON ?auto_188911 ?auto_188910 ) ( not ( = ?auto_188905 ?auto_188906 ) ) ( not ( = ?auto_188905 ?auto_188907 ) ) ( not ( = ?auto_188905 ?auto_188908 ) ) ( not ( = ?auto_188905 ?auto_188909 ) ) ( not ( = ?auto_188905 ?auto_188910 ) ) ( not ( = ?auto_188905 ?auto_188911 ) ) ( not ( = ?auto_188905 ?auto_188912 ) ) ( not ( = ?auto_188906 ?auto_188907 ) ) ( not ( = ?auto_188906 ?auto_188908 ) ) ( not ( = ?auto_188906 ?auto_188909 ) ) ( not ( = ?auto_188906 ?auto_188910 ) ) ( not ( = ?auto_188906 ?auto_188911 ) ) ( not ( = ?auto_188906 ?auto_188912 ) ) ( not ( = ?auto_188907 ?auto_188908 ) ) ( not ( = ?auto_188907 ?auto_188909 ) ) ( not ( = ?auto_188907 ?auto_188910 ) ) ( not ( = ?auto_188907 ?auto_188911 ) ) ( not ( = ?auto_188907 ?auto_188912 ) ) ( not ( = ?auto_188908 ?auto_188909 ) ) ( not ( = ?auto_188908 ?auto_188910 ) ) ( not ( = ?auto_188908 ?auto_188911 ) ) ( not ( = ?auto_188908 ?auto_188912 ) ) ( not ( = ?auto_188909 ?auto_188910 ) ) ( not ( = ?auto_188909 ?auto_188911 ) ) ( not ( = ?auto_188909 ?auto_188912 ) ) ( not ( = ?auto_188910 ?auto_188911 ) ) ( not ( = ?auto_188910 ?auto_188912 ) ) ( not ( = ?auto_188911 ?auto_188912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188912 ?auto_188911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188930 - BLOCK
      ?auto_188931 - BLOCK
      ?auto_188932 - BLOCK
      ?auto_188933 - BLOCK
      ?auto_188934 - BLOCK
      ?auto_188935 - BLOCK
      ?auto_188936 - BLOCK
    )
    :vars
    (
      ?auto_188937 - BLOCK
      ?auto_188938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188930 ) ( ON ?auto_188931 ?auto_188930 ) ( ON ?auto_188932 ?auto_188931 ) ( ON ?auto_188933 ?auto_188932 ) ( ON ?auto_188934 ?auto_188933 ) ( ON ?auto_188935 ?auto_188934 ) ( not ( = ?auto_188930 ?auto_188931 ) ) ( not ( = ?auto_188930 ?auto_188932 ) ) ( not ( = ?auto_188930 ?auto_188933 ) ) ( not ( = ?auto_188930 ?auto_188934 ) ) ( not ( = ?auto_188930 ?auto_188935 ) ) ( not ( = ?auto_188930 ?auto_188936 ) ) ( not ( = ?auto_188930 ?auto_188937 ) ) ( not ( = ?auto_188931 ?auto_188932 ) ) ( not ( = ?auto_188931 ?auto_188933 ) ) ( not ( = ?auto_188931 ?auto_188934 ) ) ( not ( = ?auto_188931 ?auto_188935 ) ) ( not ( = ?auto_188931 ?auto_188936 ) ) ( not ( = ?auto_188931 ?auto_188937 ) ) ( not ( = ?auto_188932 ?auto_188933 ) ) ( not ( = ?auto_188932 ?auto_188934 ) ) ( not ( = ?auto_188932 ?auto_188935 ) ) ( not ( = ?auto_188932 ?auto_188936 ) ) ( not ( = ?auto_188932 ?auto_188937 ) ) ( not ( = ?auto_188933 ?auto_188934 ) ) ( not ( = ?auto_188933 ?auto_188935 ) ) ( not ( = ?auto_188933 ?auto_188936 ) ) ( not ( = ?auto_188933 ?auto_188937 ) ) ( not ( = ?auto_188934 ?auto_188935 ) ) ( not ( = ?auto_188934 ?auto_188936 ) ) ( not ( = ?auto_188934 ?auto_188937 ) ) ( not ( = ?auto_188935 ?auto_188936 ) ) ( not ( = ?auto_188935 ?auto_188937 ) ) ( not ( = ?auto_188936 ?auto_188937 ) ) ( ON ?auto_188937 ?auto_188938 ) ( CLEAR ?auto_188937 ) ( not ( = ?auto_188930 ?auto_188938 ) ) ( not ( = ?auto_188931 ?auto_188938 ) ) ( not ( = ?auto_188932 ?auto_188938 ) ) ( not ( = ?auto_188933 ?auto_188938 ) ) ( not ( = ?auto_188934 ?auto_188938 ) ) ( not ( = ?auto_188935 ?auto_188938 ) ) ( not ( = ?auto_188936 ?auto_188938 ) ) ( not ( = ?auto_188937 ?auto_188938 ) ) ( HOLDING ?auto_188936 ) ( CLEAR ?auto_188935 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188930 ?auto_188931 ?auto_188932 ?auto_188933 ?auto_188934 ?auto_188935 ?auto_188936 ?auto_188937 )
      ( MAKE-7PILE ?auto_188930 ?auto_188931 ?auto_188932 ?auto_188933 ?auto_188934 ?auto_188935 ?auto_188936 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188939 - BLOCK
      ?auto_188940 - BLOCK
      ?auto_188941 - BLOCK
      ?auto_188942 - BLOCK
      ?auto_188943 - BLOCK
      ?auto_188944 - BLOCK
      ?auto_188945 - BLOCK
    )
    :vars
    (
      ?auto_188947 - BLOCK
      ?auto_188946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188939 ) ( ON ?auto_188940 ?auto_188939 ) ( ON ?auto_188941 ?auto_188940 ) ( ON ?auto_188942 ?auto_188941 ) ( ON ?auto_188943 ?auto_188942 ) ( ON ?auto_188944 ?auto_188943 ) ( not ( = ?auto_188939 ?auto_188940 ) ) ( not ( = ?auto_188939 ?auto_188941 ) ) ( not ( = ?auto_188939 ?auto_188942 ) ) ( not ( = ?auto_188939 ?auto_188943 ) ) ( not ( = ?auto_188939 ?auto_188944 ) ) ( not ( = ?auto_188939 ?auto_188945 ) ) ( not ( = ?auto_188939 ?auto_188947 ) ) ( not ( = ?auto_188940 ?auto_188941 ) ) ( not ( = ?auto_188940 ?auto_188942 ) ) ( not ( = ?auto_188940 ?auto_188943 ) ) ( not ( = ?auto_188940 ?auto_188944 ) ) ( not ( = ?auto_188940 ?auto_188945 ) ) ( not ( = ?auto_188940 ?auto_188947 ) ) ( not ( = ?auto_188941 ?auto_188942 ) ) ( not ( = ?auto_188941 ?auto_188943 ) ) ( not ( = ?auto_188941 ?auto_188944 ) ) ( not ( = ?auto_188941 ?auto_188945 ) ) ( not ( = ?auto_188941 ?auto_188947 ) ) ( not ( = ?auto_188942 ?auto_188943 ) ) ( not ( = ?auto_188942 ?auto_188944 ) ) ( not ( = ?auto_188942 ?auto_188945 ) ) ( not ( = ?auto_188942 ?auto_188947 ) ) ( not ( = ?auto_188943 ?auto_188944 ) ) ( not ( = ?auto_188943 ?auto_188945 ) ) ( not ( = ?auto_188943 ?auto_188947 ) ) ( not ( = ?auto_188944 ?auto_188945 ) ) ( not ( = ?auto_188944 ?auto_188947 ) ) ( not ( = ?auto_188945 ?auto_188947 ) ) ( ON ?auto_188947 ?auto_188946 ) ( not ( = ?auto_188939 ?auto_188946 ) ) ( not ( = ?auto_188940 ?auto_188946 ) ) ( not ( = ?auto_188941 ?auto_188946 ) ) ( not ( = ?auto_188942 ?auto_188946 ) ) ( not ( = ?auto_188943 ?auto_188946 ) ) ( not ( = ?auto_188944 ?auto_188946 ) ) ( not ( = ?auto_188945 ?auto_188946 ) ) ( not ( = ?auto_188947 ?auto_188946 ) ) ( CLEAR ?auto_188944 ) ( ON ?auto_188945 ?auto_188947 ) ( CLEAR ?auto_188945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188946 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188946 ?auto_188947 )
      ( MAKE-7PILE ?auto_188939 ?auto_188940 ?auto_188941 ?auto_188942 ?auto_188943 ?auto_188944 ?auto_188945 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188948 - BLOCK
      ?auto_188949 - BLOCK
      ?auto_188950 - BLOCK
      ?auto_188951 - BLOCK
      ?auto_188952 - BLOCK
      ?auto_188953 - BLOCK
      ?auto_188954 - BLOCK
    )
    :vars
    (
      ?auto_188955 - BLOCK
      ?auto_188956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188948 ) ( ON ?auto_188949 ?auto_188948 ) ( ON ?auto_188950 ?auto_188949 ) ( ON ?auto_188951 ?auto_188950 ) ( ON ?auto_188952 ?auto_188951 ) ( not ( = ?auto_188948 ?auto_188949 ) ) ( not ( = ?auto_188948 ?auto_188950 ) ) ( not ( = ?auto_188948 ?auto_188951 ) ) ( not ( = ?auto_188948 ?auto_188952 ) ) ( not ( = ?auto_188948 ?auto_188953 ) ) ( not ( = ?auto_188948 ?auto_188954 ) ) ( not ( = ?auto_188948 ?auto_188955 ) ) ( not ( = ?auto_188949 ?auto_188950 ) ) ( not ( = ?auto_188949 ?auto_188951 ) ) ( not ( = ?auto_188949 ?auto_188952 ) ) ( not ( = ?auto_188949 ?auto_188953 ) ) ( not ( = ?auto_188949 ?auto_188954 ) ) ( not ( = ?auto_188949 ?auto_188955 ) ) ( not ( = ?auto_188950 ?auto_188951 ) ) ( not ( = ?auto_188950 ?auto_188952 ) ) ( not ( = ?auto_188950 ?auto_188953 ) ) ( not ( = ?auto_188950 ?auto_188954 ) ) ( not ( = ?auto_188950 ?auto_188955 ) ) ( not ( = ?auto_188951 ?auto_188952 ) ) ( not ( = ?auto_188951 ?auto_188953 ) ) ( not ( = ?auto_188951 ?auto_188954 ) ) ( not ( = ?auto_188951 ?auto_188955 ) ) ( not ( = ?auto_188952 ?auto_188953 ) ) ( not ( = ?auto_188952 ?auto_188954 ) ) ( not ( = ?auto_188952 ?auto_188955 ) ) ( not ( = ?auto_188953 ?auto_188954 ) ) ( not ( = ?auto_188953 ?auto_188955 ) ) ( not ( = ?auto_188954 ?auto_188955 ) ) ( ON ?auto_188955 ?auto_188956 ) ( not ( = ?auto_188948 ?auto_188956 ) ) ( not ( = ?auto_188949 ?auto_188956 ) ) ( not ( = ?auto_188950 ?auto_188956 ) ) ( not ( = ?auto_188951 ?auto_188956 ) ) ( not ( = ?auto_188952 ?auto_188956 ) ) ( not ( = ?auto_188953 ?auto_188956 ) ) ( not ( = ?auto_188954 ?auto_188956 ) ) ( not ( = ?auto_188955 ?auto_188956 ) ) ( ON ?auto_188954 ?auto_188955 ) ( CLEAR ?auto_188954 ) ( ON-TABLE ?auto_188956 ) ( HOLDING ?auto_188953 ) ( CLEAR ?auto_188952 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188948 ?auto_188949 ?auto_188950 ?auto_188951 ?auto_188952 ?auto_188953 )
      ( MAKE-7PILE ?auto_188948 ?auto_188949 ?auto_188950 ?auto_188951 ?auto_188952 ?auto_188953 ?auto_188954 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188957 - BLOCK
      ?auto_188958 - BLOCK
      ?auto_188959 - BLOCK
      ?auto_188960 - BLOCK
      ?auto_188961 - BLOCK
      ?auto_188962 - BLOCK
      ?auto_188963 - BLOCK
    )
    :vars
    (
      ?auto_188965 - BLOCK
      ?auto_188964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188957 ) ( ON ?auto_188958 ?auto_188957 ) ( ON ?auto_188959 ?auto_188958 ) ( ON ?auto_188960 ?auto_188959 ) ( ON ?auto_188961 ?auto_188960 ) ( not ( = ?auto_188957 ?auto_188958 ) ) ( not ( = ?auto_188957 ?auto_188959 ) ) ( not ( = ?auto_188957 ?auto_188960 ) ) ( not ( = ?auto_188957 ?auto_188961 ) ) ( not ( = ?auto_188957 ?auto_188962 ) ) ( not ( = ?auto_188957 ?auto_188963 ) ) ( not ( = ?auto_188957 ?auto_188965 ) ) ( not ( = ?auto_188958 ?auto_188959 ) ) ( not ( = ?auto_188958 ?auto_188960 ) ) ( not ( = ?auto_188958 ?auto_188961 ) ) ( not ( = ?auto_188958 ?auto_188962 ) ) ( not ( = ?auto_188958 ?auto_188963 ) ) ( not ( = ?auto_188958 ?auto_188965 ) ) ( not ( = ?auto_188959 ?auto_188960 ) ) ( not ( = ?auto_188959 ?auto_188961 ) ) ( not ( = ?auto_188959 ?auto_188962 ) ) ( not ( = ?auto_188959 ?auto_188963 ) ) ( not ( = ?auto_188959 ?auto_188965 ) ) ( not ( = ?auto_188960 ?auto_188961 ) ) ( not ( = ?auto_188960 ?auto_188962 ) ) ( not ( = ?auto_188960 ?auto_188963 ) ) ( not ( = ?auto_188960 ?auto_188965 ) ) ( not ( = ?auto_188961 ?auto_188962 ) ) ( not ( = ?auto_188961 ?auto_188963 ) ) ( not ( = ?auto_188961 ?auto_188965 ) ) ( not ( = ?auto_188962 ?auto_188963 ) ) ( not ( = ?auto_188962 ?auto_188965 ) ) ( not ( = ?auto_188963 ?auto_188965 ) ) ( ON ?auto_188965 ?auto_188964 ) ( not ( = ?auto_188957 ?auto_188964 ) ) ( not ( = ?auto_188958 ?auto_188964 ) ) ( not ( = ?auto_188959 ?auto_188964 ) ) ( not ( = ?auto_188960 ?auto_188964 ) ) ( not ( = ?auto_188961 ?auto_188964 ) ) ( not ( = ?auto_188962 ?auto_188964 ) ) ( not ( = ?auto_188963 ?auto_188964 ) ) ( not ( = ?auto_188965 ?auto_188964 ) ) ( ON ?auto_188963 ?auto_188965 ) ( ON-TABLE ?auto_188964 ) ( CLEAR ?auto_188961 ) ( ON ?auto_188962 ?auto_188963 ) ( CLEAR ?auto_188962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188964 ?auto_188965 ?auto_188963 )
      ( MAKE-7PILE ?auto_188957 ?auto_188958 ?auto_188959 ?auto_188960 ?auto_188961 ?auto_188962 ?auto_188963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188966 - BLOCK
      ?auto_188967 - BLOCK
      ?auto_188968 - BLOCK
      ?auto_188969 - BLOCK
      ?auto_188970 - BLOCK
      ?auto_188971 - BLOCK
      ?auto_188972 - BLOCK
    )
    :vars
    (
      ?auto_188973 - BLOCK
      ?auto_188974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188966 ) ( ON ?auto_188967 ?auto_188966 ) ( ON ?auto_188968 ?auto_188967 ) ( ON ?auto_188969 ?auto_188968 ) ( not ( = ?auto_188966 ?auto_188967 ) ) ( not ( = ?auto_188966 ?auto_188968 ) ) ( not ( = ?auto_188966 ?auto_188969 ) ) ( not ( = ?auto_188966 ?auto_188970 ) ) ( not ( = ?auto_188966 ?auto_188971 ) ) ( not ( = ?auto_188966 ?auto_188972 ) ) ( not ( = ?auto_188966 ?auto_188973 ) ) ( not ( = ?auto_188967 ?auto_188968 ) ) ( not ( = ?auto_188967 ?auto_188969 ) ) ( not ( = ?auto_188967 ?auto_188970 ) ) ( not ( = ?auto_188967 ?auto_188971 ) ) ( not ( = ?auto_188967 ?auto_188972 ) ) ( not ( = ?auto_188967 ?auto_188973 ) ) ( not ( = ?auto_188968 ?auto_188969 ) ) ( not ( = ?auto_188968 ?auto_188970 ) ) ( not ( = ?auto_188968 ?auto_188971 ) ) ( not ( = ?auto_188968 ?auto_188972 ) ) ( not ( = ?auto_188968 ?auto_188973 ) ) ( not ( = ?auto_188969 ?auto_188970 ) ) ( not ( = ?auto_188969 ?auto_188971 ) ) ( not ( = ?auto_188969 ?auto_188972 ) ) ( not ( = ?auto_188969 ?auto_188973 ) ) ( not ( = ?auto_188970 ?auto_188971 ) ) ( not ( = ?auto_188970 ?auto_188972 ) ) ( not ( = ?auto_188970 ?auto_188973 ) ) ( not ( = ?auto_188971 ?auto_188972 ) ) ( not ( = ?auto_188971 ?auto_188973 ) ) ( not ( = ?auto_188972 ?auto_188973 ) ) ( ON ?auto_188973 ?auto_188974 ) ( not ( = ?auto_188966 ?auto_188974 ) ) ( not ( = ?auto_188967 ?auto_188974 ) ) ( not ( = ?auto_188968 ?auto_188974 ) ) ( not ( = ?auto_188969 ?auto_188974 ) ) ( not ( = ?auto_188970 ?auto_188974 ) ) ( not ( = ?auto_188971 ?auto_188974 ) ) ( not ( = ?auto_188972 ?auto_188974 ) ) ( not ( = ?auto_188973 ?auto_188974 ) ) ( ON ?auto_188972 ?auto_188973 ) ( ON-TABLE ?auto_188974 ) ( ON ?auto_188971 ?auto_188972 ) ( CLEAR ?auto_188971 ) ( HOLDING ?auto_188970 ) ( CLEAR ?auto_188969 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188966 ?auto_188967 ?auto_188968 ?auto_188969 ?auto_188970 )
      ( MAKE-7PILE ?auto_188966 ?auto_188967 ?auto_188968 ?auto_188969 ?auto_188970 ?auto_188971 ?auto_188972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188975 - BLOCK
      ?auto_188976 - BLOCK
      ?auto_188977 - BLOCK
      ?auto_188978 - BLOCK
      ?auto_188979 - BLOCK
      ?auto_188980 - BLOCK
      ?auto_188981 - BLOCK
    )
    :vars
    (
      ?auto_188983 - BLOCK
      ?auto_188982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188975 ) ( ON ?auto_188976 ?auto_188975 ) ( ON ?auto_188977 ?auto_188976 ) ( ON ?auto_188978 ?auto_188977 ) ( not ( = ?auto_188975 ?auto_188976 ) ) ( not ( = ?auto_188975 ?auto_188977 ) ) ( not ( = ?auto_188975 ?auto_188978 ) ) ( not ( = ?auto_188975 ?auto_188979 ) ) ( not ( = ?auto_188975 ?auto_188980 ) ) ( not ( = ?auto_188975 ?auto_188981 ) ) ( not ( = ?auto_188975 ?auto_188983 ) ) ( not ( = ?auto_188976 ?auto_188977 ) ) ( not ( = ?auto_188976 ?auto_188978 ) ) ( not ( = ?auto_188976 ?auto_188979 ) ) ( not ( = ?auto_188976 ?auto_188980 ) ) ( not ( = ?auto_188976 ?auto_188981 ) ) ( not ( = ?auto_188976 ?auto_188983 ) ) ( not ( = ?auto_188977 ?auto_188978 ) ) ( not ( = ?auto_188977 ?auto_188979 ) ) ( not ( = ?auto_188977 ?auto_188980 ) ) ( not ( = ?auto_188977 ?auto_188981 ) ) ( not ( = ?auto_188977 ?auto_188983 ) ) ( not ( = ?auto_188978 ?auto_188979 ) ) ( not ( = ?auto_188978 ?auto_188980 ) ) ( not ( = ?auto_188978 ?auto_188981 ) ) ( not ( = ?auto_188978 ?auto_188983 ) ) ( not ( = ?auto_188979 ?auto_188980 ) ) ( not ( = ?auto_188979 ?auto_188981 ) ) ( not ( = ?auto_188979 ?auto_188983 ) ) ( not ( = ?auto_188980 ?auto_188981 ) ) ( not ( = ?auto_188980 ?auto_188983 ) ) ( not ( = ?auto_188981 ?auto_188983 ) ) ( ON ?auto_188983 ?auto_188982 ) ( not ( = ?auto_188975 ?auto_188982 ) ) ( not ( = ?auto_188976 ?auto_188982 ) ) ( not ( = ?auto_188977 ?auto_188982 ) ) ( not ( = ?auto_188978 ?auto_188982 ) ) ( not ( = ?auto_188979 ?auto_188982 ) ) ( not ( = ?auto_188980 ?auto_188982 ) ) ( not ( = ?auto_188981 ?auto_188982 ) ) ( not ( = ?auto_188983 ?auto_188982 ) ) ( ON ?auto_188981 ?auto_188983 ) ( ON-TABLE ?auto_188982 ) ( ON ?auto_188980 ?auto_188981 ) ( CLEAR ?auto_188978 ) ( ON ?auto_188979 ?auto_188980 ) ( CLEAR ?auto_188979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188982 ?auto_188983 ?auto_188981 ?auto_188980 )
      ( MAKE-7PILE ?auto_188975 ?auto_188976 ?auto_188977 ?auto_188978 ?auto_188979 ?auto_188980 ?auto_188981 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188984 - BLOCK
      ?auto_188985 - BLOCK
      ?auto_188986 - BLOCK
      ?auto_188987 - BLOCK
      ?auto_188988 - BLOCK
      ?auto_188989 - BLOCK
      ?auto_188990 - BLOCK
    )
    :vars
    (
      ?auto_188991 - BLOCK
      ?auto_188992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188984 ) ( ON ?auto_188985 ?auto_188984 ) ( ON ?auto_188986 ?auto_188985 ) ( not ( = ?auto_188984 ?auto_188985 ) ) ( not ( = ?auto_188984 ?auto_188986 ) ) ( not ( = ?auto_188984 ?auto_188987 ) ) ( not ( = ?auto_188984 ?auto_188988 ) ) ( not ( = ?auto_188984 ?auto_188989 ) ) ( not ( = ?auto_188984 ?auto_188990 ) ) ( not ( = ?auto_188984 ?auto_188991 ) ) ( not ( = ?auto_188985 ?auto_188986 ) ) ( not ( = ?auto_188985 ?auto_188987 ) ) ( not ( = ?auto_188985 ?auto_188988 ) ) ( not ( = ?auto_188985 ?auto_188989 ) ) ( not ( = ?auto_188985 ?auto_188990 ) ) ( not ( = ?auto_188985 ?auto_188991 ) ) ( not ( = ?auto_188986 ?auto_188987 ) ) ( not ( = ?auto_188986 ?auto_188988 ) ) ( not ( = ?auto_188986 ?auto_188989 ) ) ( not ( = ?auto_188986 ?auto_188990 ) ) ( not ( = ?auto_188986 ?auto_188991 ) ) ( not ( = ?auto_188987 ?auto_188988 ) ) ( not ( = ?auto_188987 ?auto_188989 ) ) ( not ( = ?auto_188987 ?auto_188990 ) ) ( not ( = ?auto_188987 ?auto_188991 ) ) ( not ( = ?auto_188988 ?auto_188989 ) ) ( not ( = ?auto_188988 ?auto_188990 ) ) ( not ( = ?auto_188988 ?auto_188991 ) ) ( not ( = ?auto_188989 ?auto_188990 ) ) ( not ( = ?auto_188989 ?auto_188991 ) ) ( not ( = ?auto_188990 ?auto_188991 ) ) ( ON ?auto_188991 ?auto_188992 ) ( not ( = ?auto_188984 ?auto_188992 ) ) ( not ( = ?auto_188985 ?auto_188992 ) ) ( not ( = ?auto_188986 ?auto_188992 ) ) ( not ( = ?auto_188987 ?auto_188992 ) ) ( not ( = ?auto_188988 ?auto_188992 ) ) ( not ( = ?auto_188989 ?auto_188992 ) ) ( not ( = ?auto_188990 ?auto_188992 ) ) ( not ( = ?auto_188991 ?auto_188992 ) ) ( ON ?auto_188990 ?auto_188991 ) ( ON-TABLE ?auto_188992 ) ( ON ?auto_188989 ?auto_188990 ) ( ON ?auto_188988 ?auto_188989 ) ( CLEAR ?auto_188988 ) ( HOLDING ?auto_188987 ) ( CLEAR ?auto_188986 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188984 ?auto_188985 ?auto_188986 ?auto_188987 )
      ( MAKE-7PILE ?auto_188984 ?auto_188985 ?auto_188986 ?auto_188987 ?auto_188988 ?auto_188989 ?auto_188990 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_188993 - BLOCK
      ?auto_188994 - BLOCK
      ?auto_188995 - BLOCK
      ?auto_188996 - BLOCK
      ?auto_188997 - BLOCK
      ?auto_188998 - BLOCK
      ?auto_188999 - BLOCK
    )
    :vars
    (
      ?auto_189000 - BLOCK
      ?auto_189001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_188993 ) ( ON ?auto_188994 ?auto_188993 ) ( ON ?auto_188995 ?auto_188994 ) ( not ( = ?auto_188993 ?auto_188994 ) ) ( not ( = ?auto_188993 ?auto_188995 ) ) ( not ( = ?auto_188993 ?auto_188996 ) ) ( not ( = ?auto_188993 ?auto_188997 ) ) ( not ( = ?auto_188993 ?auto_188998 ) ) ( not ( = ?auto_188993 ?auto_188999 ) ) ( not ( = ?auto_188993 ?auto_189000 ) ) ( not ( = ?auto_188994 ?auto_188995 ) ) ( not ( = ?auto_188994 ?auto_188996 ) ) ( not ( = ?auto_188994 ?auto_188997 ) ) ( not ( = ?auto_188994 ?auto_188998 ) ) ( not ( = ?auto_188994 ?auto_188999 ) ) ( not ( = ?auto_188994 ?auto_189000 ) ) ( not ( = ?auto_188995 ?auto_188996 ) ) ( not ( = ?auto_188995 ?auto_188997 ) ) ( not ( = ?auto_188995 ?auto_188998 ) ) ( not ( = ?auto_188995 ?auto_188999 ) ) ( not ( = ?auto_188995 ?auto_189000 ) ) ( not ( = ?auto_188996 ?auto_188997 ) ) ( not ( = ?auto_188996 ?auto_188998 ) ) ( not ( = ?auto_188996 ?auto_188999 ) ) ( not ( = ?auto_188996 ?auto_189000 ) ) ( not ( = ?auto_188997 ?auto_188998 ) ) ( not ( = ?auto_188997 ?auto_188999 ) ) ( not ( = ?auto_188997 ?auto_189000 ) ) ( not ( = ?auto_188998 ?auto_188999 ) ) ( not ( = ?auto_188998 ?auto_189000 ) ) ( not ( = ?auto_188999 ?auto_189000 ) ) ( ON ?auto_189000 ?auto_189001 ) ( not ( = ?auto_188993 ?auto_189001 ) ) ( not ( = ?auto_188994 ?auto_189001 ) ) ( not ( = ?auto_188995 ?auto_189001 ) ) ( not ( = ?auto_188996 ?auto_189001 ) ) ( not ( = ?auto_188997 ?auto_189001 ) ) ( not ( = ?auto_188998 ?auto_189001 ) ) ( not ( = ?auto_188999 ?auto_189001 ) ) ( not ( = ?auto_189000 ?auto_189001 ) ) ( ON ?auto_188999 ?auto_189000 ) ( ON-TABLE ?auto_189001 ) ( ON ?auto_188998 ?auto_188999 ) ( ON ?auto_188997 ?auto_188998 ) ( CLEAR ?auto_188995 ) ( ON ?auto_188996 ?auto_188997 ) ( CLEAR ?auto_188996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189001 ?auto_189000 ?auto_188999 ?auto_188998 ?auto_188997 )
      ( MAKE-7PILE ?auto_188993 ?auto_188994 ?auto_188995 ?auto_188996 ?auto_188997 ?auto_188998 ?auto_188999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189002 - BLOCK
      ?auto_189003 - BLOCK
      ?auto_189004 - BLOCK
      ?auto_189005 - BLOCK
      ?auto_189006 - BLOCK
      ?auto_189007 - BLOCK
      ?auto_189008 - BLOCK
    )
    :vars
    (
      ?auto_189009 - BLOCK
      ?auto_189010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189002 ) ( ON ?auto_189003 ?auto_189002 ) ( not ( = ?auto_189002 ?auto_189003 ) ) ( not ( = ?auto_189002 ?auto_189004 ) ) ( not ( = ?auto_189002 ?auto_189005 ) ) ( not ( = ?auto_189002 ?auto_189006 ) ) ( not ( = ?auto_189002 ?auto_189007 ) ) ( not ( = ?auto_189002 ?auto_189008 ) ) ( not ( = ?auto_189002 ?auto_189009 ) ) ( not ( = ?auto_189003 ?auto_189004 ) ) ( not ( = ?auto_189003 ?auto_189005 ) ) ( not ( = ?auto_189003 ?auto_189006 ) ) ( not ( = ?auto_189003 ?auto_189007 ) ) ( not ( = ?auto_189003 ?auto_189008 ) ) ( not ( = ?auto_189003 ?auto_189009 ) ) ( not ( = ?auto_189004 ?auto_189005 ) ) ( not ( = ?auto_189004 ?auto_189006 ) ) ( not ( = ?auto_189004 ?auto_189007 ) ) ( not ( = ?auto_189004 ?auto_189008 ) ) ( not ( = ?auto_189004 ?auto_189009 ) ) ( not ( = ?auto_189005 ?auto_189006 ) ) ( not ( = ?auto_189005 ?auto_189007 ) ) ( not ( = ?auto_189005 ?auto_189008 ) ) ( not ( = ?auto_189005 ?auto_189009 ) ) ( not ( = ?auto_189006 ?auto_189007 ) ) ( not ( = ?auto_189006 ?auto_189008 ) ) ( not ( = ?auto_189006 ?auto_189009 ) ) ( not ( = ?auto_189007 ?auto_189008 ) ) ( not ( = ?auto_189007 ?auto_189009 ) ) ( not ( = ?auto_189008 ?auto_189009 ) ) ( ON ?auto_189009 ?auto_189010 ) ( not ( = ?auto_189002 ?auto_189010 ) ) ( not ( = ?auto_189003 ?auto_189010 ) ) ( not ( = ?auto_189004 ?auto_189010 ) ) ( not ( = ?auto_189005 ?auto_189010 ) ) ( not ( = ?auto_189006 ?auto_189010 ) ) ( not ( = ?auto_189007 ?auto_189010 ) ) ( not ( = ?auto_189008 ?auto_189010 ) ) ( not ( = ?auto_189009 ?auto_189010 ) ) ( ON ?auto_189008 ?auto_189009 ) ( ON-TABLE ?auto_189010 ) ( ON ?auto_189007 ?auto_189008 ) ( ON ?auto_189006 ?auto_189007 ) ( ON ?auto_189005 ?auto_189006 ) ( CLEAR ?auto_189005 ) ( HOLDING ?auto_189004 ) ( CLEAR ?auto_189003 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189002 ?auto_189003 ?auto_189004 )
      ( MAKE-7PILE ?auto_189002 ?auto_189003 ?auto_189004 ?auto_189005 ?auto_189006 ?auto_189007 ?auto_189008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189011 - BLOCK
      ?auto_189012 - BLOCK
      ?auto_189013 - BLOCK
      ?auto_189014 - BLOCK
      ?auto_189015 - BLOCK
      ?auto_189016 - BLOCK
      ?auto_189017 - BLOCK
    )
    :vars
    (
      ?auto_189019 - BLOCK
      ?auto_189018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189011 ) ( ON ?auto_189012 ?auto_189011 ) ( not ( = ?auto_189011 ?auto_189012 ) ) ( not ( = ?auto_189011 ?auto_189013 ) ) ( not ( = ?auto_189011 ?auto_189014 ) ) ( not ( = ?auto_189011 ?auto_189015 ) ) ( not ( = ?auto_189011 ?auto_189016 ) ) ( not ( = ?auto_189011 ?auto_189017 ) ) ( not ( = ?auto_189011 ?auto_189019 ) ) ( not ( = ?auto_189012 ?auto_189013 ) ) ( not ( = ?auto_189012 ?auto_189014 ) ) ( not ( = ?auto_189012 ?auto_189015 ) ) ( not ( = ?auto_189012 ?auto_189016 ) ) ( not ( = ?auto_189012 ?auto_189017 ) ) ( not ( = ?auto_189012 ?auto_189019 ) ) ( not ( = ?auto_189013 ?auto_189014 ) ) ( not ( = ?auto_189013 ?auto_189015 ) ) ( not ( = ?auto_189013 ?auto_189016 ) ) ( not ( = ?auto_189013 ?auto_189017 ) ) ( not ( = ?auto_189013 ?auto_189019 ) ) ( not ( = ?auto_189014 ?auto_189015 ) ) ( not ( = ?auto_189014 ?auto_189016 ) ) ( not ( = ?auto_189014 ?auto_189017 ) ) ( not ( = ?auto_189014 ?auto_189019 ) ) ( not ( = ?auto_189015 ?auto_189016 ) ) ( not ( = ?auto_189015 ?auto_189017 ) ) ( not ( = ?auto_189015 ?auto_189019 ) ) ( not ( = ?auto_189016 ?auto_189017 ) ) ( not ( = ?auto_189016 ?auto_189019 ) ) ( not ( = ?auto_189017 ?auto_189019 ) ) ( ON ?auto_189019 ?auto_189018 ) ( not ( = ?auto_189011 ?auto_189018 ) ) ( not ( = ?auto_189012 ?auto_189018 ) ) ( not ( = ?auto_189013 ?auto_189018 ) ) ( not ( = ?auto_189014 ?auto_189018 ) ) ( not ( = ?auto_189015 ?auto_189018 ) ) ( not ( = ?auto_189016 ?auto_189018 ) ) ( not ( = ?auto_189017 ?auto_189018 ) ) ( not ( = ?auto_189019 ?auto_189018 ) ) ( ON ?auto_189017 ?auto_189019 ) ( ON-TABLE ?auto_189018 ) ( ON ?auto_189016 ?auto_189017 ) ( ON ?auto_189015 ?auto_189016 ) ( ON ?auto_189014 ?auto_189015 ) ( CLEAR ?auto_189012 ) ( ON ?auto_189013 ?auto_189014 ) ( CLEAR ?auto_189013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189018 ?auto_189019 ?auto_189017 ?auto_189016 ?auto_189015 ?auto_189014 )
      ( MAKE-7PILE ?auto_189011 ?auto_189012 ?auto_189013 ?auto_189014 ?auto_189015 ?auto_189016 ?auto_189017 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189020 - BLOCK
      ?auto_189021 - BLOCK
      ?auto_189022 - BLOCK
      ?auto_189023 - BLOCK
      ?auto_189024 - BLOCK
      ?auto_189025 - BLOCK
      ?auto_189026 - BLOCK
    )
    :vars
    (
      ?auto_189027 - BLOCK
      ?auto_189028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189020 ) ( not ( = ?auto_189020 ?auto_189021 ) ) ( not ( = ?auto_189020 ?auto_189022 ) ) ( not ( = ?auto_189020 ?auto_189023 ) ) ( not ( = ?auto_189020 ?auto_189024 ) ) ( not ( = ?auto_189020 ?auto_189025 ) ) ( not ( = ?auto_189020 ?auto_189026 ) ) ( not ( = ?auto_189020 ?auto_189027 ) ) ( not ( = ?auto_189021 ?auto_189022 ) ) ( not ( = ?auto_189021 ?auto_189023 ) ) ( not ( = ?auto_189021 ?auto_189024 ) ) ( not ( = ?auto_189021 ?auto_189025 ) ) ( not ( = ?auto_189021 ?auto_189026 ) ) ( not ( = ?auto_189021 ?auto_189027 ) ) ( not ( = ?auto_189022 ?auto_189023 ) ) ( not ( = ?auto_189022 ?auto_189024 ) ) ( not ( = ?auto_189022 ?auto_189025 ) ) ( not ( = ?auto_189022 ?auto_189026 ) ) ( not ( = ?auto_189022 ?auto_189027 ) ) ( not ( = ?auto_189023 ?auto_189024 ) ) ( not ( = ?auto_189023 ?auto_189025 ) ) ( not ( = ?auto_189023 ?auto_189026 ) ) ( not ( = ?auto_189023 ?auto_189027 ) ) ( not ( = ?auto_189024 ?auto_189025 ) ) ( not ( = ?auto_189024 ?auto_189026 ) ) ( not ( = ?auto_189024 ?auto_189027 ) ) ( not ( = ?auto_189025 ?auto_189026 ) ) ( not ( = ?auto_189025 ?auto_189027 ) ) ( not ( = ?auto_189026 ?auto_189027 ) ) ( ON ?auto_189027 ?auto_189028 ) ( not ( = ?auto_189020 ?auto_189028 ) ) ( not ( = ?auto_189021 ?auto_189028 ) ) ( not ( = ?auto_189022 ?auto_189028 ) ) ( not ( = ?auto_189023 ?auto_189028 ) ) ( not ( = ?auto_189024 ?auto_189028 ) ) ( not ( = ?auto_189025 ?auto_189028 ) ) ( not ( = ?auto_189026 ?auto_189028 ) ) ( not ( = ?auto_189027 ?auto_189028 ) ) ( ON ?auto_189026 ?auto_189027 ) ( ON-TABLE ?auto_189028 ) ( ON ?auto_189025 ?auto_189026 ) ( ON ?auto_189024 ?auto_189025 ) ( ON ?auto_189023 ?auto_189024 ) ( ON ?auto_189022 ?auto_189023 ) ( CLEAR ?auto_189022 ) ( HOLDING ?auto_189021 ) ( CLEAR ?auto_189020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189020 ?auto_189021 )
      ( MAKE-7PILE ?auto_189020 ?auto_189021 ?auto_189022 ?auto_189023 ?auto_189024 ?auto_189025 ?auto_189026 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189029 - BLOCK
      ?auto_189030 - BLOCK
      ?auto_189031 - BLOCK
      ?auto_189032 - BLOCK
      ?auto_189033 - BLOCK
      ?auto_189034 - BLOCK
      ?auto_189035 - BLOCK
    )
    :vars
    (
      ?auto_189036 - BLOCK
      ?auto_189037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189029 ) ( not ( = ?auto_189029 ?auto_189030 ) ) ( not ( = ?auto_189029 ?auto_189031 ) ) ( not ( = ?auto_189029 ?auto_189032 ) ) ( not ( = ?auto_189029 ?auto_189033 ) ) ( not ( = ?auto_189029 ?auto_189034 ) ) ( not ( = ?auto_189029 ?auto_189035 ) ) ( not ( = ?auto_189029 ?auto_189036 ) ) ( not ( = ?auto_189030 ?auto_189031 ) ) ( not ( = ?auto_189030 ?auto_189032 ) ) ( not ( = ?auto_189030 ?auto_189033 ) ) ( not ( = ?auto_189030 ?auto_189034 ) ) ( not ( = ?auto_189030 ?auto_189035 ) ) ( not ( = ?auto_189030 ?auto_189036 ) ) ( not ( = ?auto_189031 ?auto_189032 ) ) ( not ( = ?auto_189031 ?auto_189033 ) ) ( not ( = ?auto_189031 ?auto_189034 ) ) ( not ( = ?auto_189031 ?auto_189035 ) ) ( not ( = ?auto_189031 ?auto_189036 ) ) ( not ( = ?auto_189032 ?auto_189033 ) ) ( not ( = ?auto_189032 ?auto_189034 ) ) ( not ( = ?auto_189032 ?auto_189035 ) ) ( not ( = ?auto_189032 ?auto_189036 ) ) ( not ( = ?auto_189033 ?auto_189034 ) ) ( not ( = ?auto_189033 ?auto_189035 ) ) ( not ( = ?auto_189033 ?auto_189036 ) ) ( not ( = ?auto_189034 ?auto_189035 ) ) ( not ( = ?auto_189034 ?auto_189036 ) ) ( not ( = ?auto_189035 ?auto_189036 ) ) ( ON ?auto_189036 ?auto_189037 ) ( not ( = ?auto_189029 ?auto_189037 ) ) ( not ( = ?auto_189030 ?auto_189037 ) ) ( not ( = ?auto_189031 ?auto_189037 ) ) ( not ( = ?auto_189032 ?auto_189037 ) ) ( not ( = ?auto_189033 ?auto_189037 ) ) ( not ( = ?auto_189034 ?auto_189037 ) ) ( not ( = ?auto_189035 ?auto_189037 ) ) ( not ( = ?auto_189036 ?auto_189037 ) ) ( ON ?auto_189035 ?auto_189036 ) ( ON-TABLE ?auto_189037 ) ( ON ?auto_189034 ?auto_189035 ) ( ON ?auto_189033 ?auto_189034 ) ( ON ?auto_189032 ?auto_189033 ) ( ON ?auto_189031 ?auto_189032 ) ( CLEAR ?auto_189029 ) ( ON ?auto_189030 ?auto_189031 ) ( CLEAR ?auto_189030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189037 ?auto_189036 ?auto_189035 ?auto_189034 ?auto_189033 ?auto_189032 ?auto_189031 )
      ( MAKE-7PILE ?auto_189029 ?auto_189030 ?auto_189031 ?auto_189032 ?auto_189033 ?auto_189034 ?auto_189035 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189038 - BLOCK
      ?auto_189039 - BLOCK
      ?auto_189040 - BLOCK
      ?auto_189041 - BLOCK
      ?auto_189042 - BLOCK
      ?auto_189043 - BLOCK
      ?auto_189044 - BLOCK
    )
    :vars
    (
      ?auto_189046 - BLOCK
      ?auto_189045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189038 ?auto_189039 ) ) ( not ( = ?auto_189038 ?auto_189040 ) ) ( not ( = ?auto_189038 ?auto_189041 ) ) ( not ( = ?auto_189038 ?auto_189042 ) ) ( not ( = ?auto_189038 ?auto_189043 ) ) ( not ( = ?auto_189038 ?auto_189044 ) ) ( not ( = ?auto_189038 ?auto_189046 ) ) ( not ( = ?auto_189039 ?auto_189040 ) ) ( not ( = ?auto_189039 ?auto_189041 ) ) ( not ( = ?auto_189039 ?auto_189042 ) ) ( not ( = ?auto_189039 ?auto_189043 ) ) ( not ( = ?auto_189039 ?auto_189044 ) ) ( not ( = ?auto_189039 ?auto_189046 ) ) ( not ( = ?auto_189040 ?auto_189041 ) ) ( not ( = ?auto_189040 ?auto_189042 ) ) ( not ( = ?auto_189040 ?auto_189043 ) ) ( not ( = ?auto_189040 ?auto_189044 ) ) ( not ( = ?auto_189040 ?auto_189046 ) ) ( not ( = ?auto_189041 ?auto_189042 ) ) ( not ( = ?auto_189041 ?auto_189043 ) ) ( not ( = ?auto_189041 ?auto_189044 ) ) ( not ( = ?auto_189041 ?auto_189046 ) ) ( not ( = ?auto_189042 ?auto_189043 ) ) ( not ( = ?auto_189042 ?auto_189044 ) ) ( not ( = ?auto_189042 ?auto_189046 ) ) ( not ( = ?auto_189043 ?auto_189044 ) ) ( not ( = ?auto_189043 ?auto_189046 ) ) ( not ( = ?auto_189044 ?auto_189046 ) ) ( ON ?auto_189046 ?auto_189045 ) ( not ( = ?auto_189038 ?auto_189045 ) ) ( not ( = ?auto_189039 ?auto_189045 ) ) ( not ( = ?auto_189040 ?auto_189045 ) ) ( not ( = ?auto_189041 ?auto_189045 ) ) ( not ( = ?auto_189042 ?auto_189045 ) ) ( not ( = ?auto_189043 ?auto_189045 ) ) ( not ( = ?auto_189044 ?auto_189045 ) ) ( not ( = ?auto_189046 ?auto_189045 ) ) ( ON ?auto_189044 ?auto_189046 ) ( ON-TABLE ?auto_189045 ) ( ON ?auto_189043 ?auto_189044 ) ( ON ?auto_189042 ?auto_189043 ) ( ON ?auto_189041 ?auto_189042 ) ( ON ?auto_189040 ?auto_189041 ) ( ON ?auto_189039 ?auto_189040 ) ( CLEAR ?auto_189039 ) ( HOLDING ?auto_189038 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189038 )
      ( MAKE-7PILE ?auto_189038 ?auto_189039 ?auto_189040 ?auto_189041 ?auto_189042 ?auto_189043 ?auto_189044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189047 - BLOCK
      ?auto_189048 - BLOCK
      ?auto_189049 - BLOCK
      ?auto_189050 - BLOCK
      ?auto_189051 - BLOCK
      ?auto_189052 - BLOCK
      ?auto_189053 - BLOCK
    )
    :vars
    (
      ?auto_189054 - BLOCK
      ?auto_189055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189047 ?auto_189048 ) ) ( not ( = ?auto_189047 ?auto_189049 ) ) ( not ( = ?auto_189047 ?auto_189050 ) ) ( not ( = ?auto_189047 ?auto_189051 ) ) ( not ( = ?auto_189047 ?auto_189052 ) ) ( not ( = ?auto_189047 ?auto_189053 ) ) ( not ( = ?auto_189047 ?auto_189054 ) ) ( not ( = ?auto_189048 ?auto_189049 ) ) ( not ( = ?auto_189048 ?auto_189050 ) ) ( not ( = ?auto_189048 ?auto_189051 ) ) ( not ( = ?auto_189048 ?auto_189052 ) ) ( not ( = ?auto_189048 ?auto_189053 ) ) ( not ( = ?auto_189048 ?auto_189054 ) ) ( not ( = ?auto_189049 ?auto_189050 ) ) ( not ( = ?auto_189049 ?auto_189051 ) ) ( not ( = ?auto_189049 ?auto_189052 ) ) ( not ( = ?auto_189049 ?auto_189053 ) ) ( not ( = ?auto_189049 ?auto_189054 ) ) ( not ( = ?auto_189050 ?auto_189051 ) ) ( not ( = ?auto_189050 ?auto_189052 ) ) ( not ( = ?auto_189050 ?auto_189053 ) ) ( not ( = ?auto_189050 ?auto_189054 ) ) ( not ( = ?auto_189051 ?auto_189052 ) ) ( not ( = ?auto_189051 ?auto_189053 ) ) ( not ( = ?auto_189051 ?auto_189054 ) ) ( not ( = ?auto_189052 ?auto_189053 ) ) ( not ( = ?auto_189052 ?auto_189054 ) ) ( not ( = ?auto_189053 ?auto_189054 ) ) ( ON ?auto_189054 ?auto_189055 ) ( not ( = ?auto_189047 ?auto_189055 ) ) ( not ( = ?auto_189048 ?auto_189055 ) ) ( not ( = ?auto_189049 ?auto_189055 ) ) ( not ( = ?auto_189050 ?auto_189055 ) ) ( not ( = ?auto_189051 ?auto_189055 ) ) ( not ( = ?auto_189052 ?auto_189055 ) ) ( not ( = ?auto_189053 ?auto_189055 ) ) ( not ( = ?auto_189054 ?auto_189055 ) ) ( ON ?auto_189053 ?auto_189054 ) ( ON-TABLE ?auto_189055 ) ( ON ?auto_189052 ?auto_189053 ) ( ON ?auto_189051 ?auto_189052 ) ( ON ?auto_189050 ?auto_189051 ) ( ON ?auto_189049 ?auto_189050 ) ( ON ?auto_189048 ?auto_189049 ) ( ON ?auto_189047 ?auto_189048 ) ( CLEAR ?auto_189047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189055 ?auto_189054 ?auto_189053 ?auto_189052 ?auto_189051 ?auto_189050 ?auto_189049 ?auto_189048 )
      ( MAKE-7PILE ?auto_189047 ?auto_189048 ?auto_189049 ?auto_189050 ?auto_189051 ?auto_189052 ?auto_189053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189057 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_189057 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_189057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189058 - BLOCK
    )
    :vars
    (
      ?auto_189059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189058 ?auto_189059 ) ( CLEAR ?auto_189058 ) ( HAND-EMPTY ) ( not ( = ?auto_189058 ?auto_189059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189058 ?auto_189059 )
      ( MAKE-1PILE ?auto_189058 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189060 - BLOCK
    )
    :vars
    (
      ?auto_189061 - BLOCK
      ?auto_189067 - BLOCK
      ?auto_189062 - BLOCK
      ?auto_189065 - BLOCK
      ?auto_189066 - BLOCK
      ?auto_189064 - BLOCK
      ?auto_189063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189060 ?auto_189061 ) ) ( HOLDING ?auto_189060 ) ( CLEAR ?auto_189061 ) ( ON-TABLE ?auto_189067 ) ( ON ?auto_189062 ?auto_189067 ) ( ON ?auto_189065 ?auto_189062 ) ( ON ?auto_189066 ?auto_189065 ) ( ON ?auto_189064 ?auto_189066 ) ( ON ?auto_189063 ?auto_189064 ) ( ON ?auto_189061 ?auto_189063 ) ( not ( = ?auto_189067 ?auto_189062 ) ) ( not ( = ?auto_189067 ?auto_189065 ) ) ( not ( = ?auto_189067 ?auto_189066 ) ) ( not ( = ?auto_189067 ?auto_189064 ) ) ( not ( = ?auto_189067 ?auto_189063 ) ) ( not ( = ?auto_189067 ?auto_189061 ) ) ( not ( = ?auto_189067 ?auto_189060 ) ) ( not ( = ?auto_189062 ?auto_189065 ) ) ( not ( = ?auto_189062 ?auto_189066 ) ) ( not ( = ?auto_189062 ?auto_189064 ) ) ( not ( = ?auto_189062 ?auto_189063 ) ) ( not ( = ?auto_189062 ?auto_189061 ) ) ( not ( = ?auto_189062 ?auto_189060 ) ) ( not ( = ?auto_189065 ?auto_189066 ) ) ( not ( = ?auto_189065 ?auto_189064 ) ) ( not ( = ?auto_189065 ?auto_189063 ) ) ( not ( = ?auto_189065 ?auto_189061 ) ) ( not ( = ?auto_189065 ?auto_189060 ) ) ( not ( = ?auto_189066 ?auto_189064 ) ) ( not ( = ?auto_189066 ?auto_189063 ) ) ( not ( = ?auto_189066 ?auto_189061 ) ) ( not ( = ?auto_189066 ?auto_189060 ) ) ( not ( = ?auto_189064 ?auto_189063 ) ) ( not ( = ?auto_189064 ?auto_189061 ) ) ( not ( = ?auto_189064 ?auto_189060 ) ) ( not ( = ?auto_189063 ?auto_189061 ) ) ( not ( = ?auto_189063 ?auto_189060 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189067 ?auto_189062 ?auto_189065 ?auto_189066 ?auto_189064 ?auto_189063 ?auto_189061 ?auto_189060 )
      ( MAKE-1PILE ?auto_189060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189068 - BLOCK
    )
    :vars
    (
      ?auto_189074 - BLOCK
      ?auto_189075 - BLOCK
      ?auto_189072 - BLOCK
      ?auto_189071 - BLOCK
      ?auto_189073 - BLOCK
      ?auto_189070 - BLOCK
      ?auto_189069 - BLOCK
      ?auto_189076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189068 ?auto_189074 ) ) ( CLEAR ?auto_189074 ) ( ON-TABLE ?auto_189075 ) ( ON ?auto_189072 ?auto_189075 ) ( ON ?auto_189071 ?auto_189072 ) ( ON ?auto_189073 ?auto_189071 ) ( ON ?auto_189070 ?auto_189073 ) ( ON ?auto_189069 ?auto_189070 ) ( ON ?auto_189074 ?auto_189069 ) ( not ( = ?auto_189075 ?auto_189072 ) ) ( not ( = ?auto_189075 ?auto_189071 ) ) ( not ( = ?auto_189075 ?auto_189073 ) ) ( not ( = ?auto_189075 ?auto_189070 ) ) ( not ( = ?auto_189075 ?auto_189069 ) ) ( not ( = ?auto_189075 ?auto_189074 ) ) ( not ( = ?auto_189075 ?auto_189068 ) ) ( not ( = ?auto_189072 ?auto_189071 ) ) ( not ( = ?auto_189072 ?auto_189073 ) ) ( not ( = ?auto_189072 ?auto_189070 ) ) ( not ( = ?auto_189072 ?auto_189069 ) ) ( not ( = ?auto_189072 ?auto_189074 ) ) ( not ( = ?auto_189072 ?auto_189068 ) ) ( not ( = ?auto_189071 ?auto_189073 ) ) ( not ( = ?auto_189071 ?auto_189070 ) ) ( not ( = ?auto_189071 ?auto_189069 ) ) ( not ( = ?auto_189071 ?auto_189074 ) ) ( not ( = ?auto_189071 ?auto_189068 ) ) ( not ( = ?auto_189073 ?auto_189070 ) ) ( not ( = ?auto_189073 ?auto_189069 ) ) ( not ( = ?auto_189073 ?auto_189074 ) ) ( not ( = ?auto_189073 ?auto_189068 ) ) ( not ( = ?auto_189070 ?auto_189069 ) ) ( not ( = ?auto_189070 ?auto_189074 ) ) ( not ( = ?auto_189070 ?auto_189068 ) ) ( not ( = ?auto_189069 ?auto_189074 ) ) ( not ( = ?auto_189069 ?auto_189068 ) ) ( ON ?auto_189068 ?auto_189076 ) ( CLEAR ?auto_189068 ) ( HAND-EMPTY ) ( not ( = ?auto_189068 ?auto_189076 ) ) ( not ( = ?auto_189074 ?auto_189076 ) ) ( not ( = ?auto_189075 ?auto_189076 ) ) ( not ( = ?auto_189072 ?auto_189076 ) ) ( not ( = ?auto_189071 ?auto_189076 ) ) ( not ( = ?auto_189073 ?auto_189076 ) ) ( not ( = ?auto_189070 ?auto_189076 ) ) ( not ( = ?auto_189069 ?auto_189076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189068 ?auto_189076 )
      ( MAKE-1PILE ?auto_189068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189077 - BLOCK
    )
    :vars
    (
      ?auto_189084 - BLOCK
      ?auto_189085 - BLOCK
      ?auto_189078 - BLOCK
      ?auto_189081 - BLOCK
      ?auto_189079 - BLOCK
      ?auto_189080 - BLOCK
      ?auto_189083 - BLOCK
      ?auto_189082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189077 ?auto_189084 ) ) ( ON-TABLE ?auto_189085 ) ( ON ?auto_189078 ?auto_189085 ) ( ON ?auto_189081 ?auto_189078 ) ( ON ?auto_189079 ?auto_189081 ) ( ON ?auto_189080 ?auto_189079 ) ( ON ?auto_189083 ?auto_189080 ) ( not ( = ?auto_189085 ?auto_189078 ) ) ( not ( = ?auto_189085 ?auto_189081 ) ) ( not ( = ?auto_189085 ?auto_189079 ) ) ( not ( = ?auto_189085 ?auto_189080 ) ) ( not ( = ?auto_189085 ?auto_189083 ) ) ( not ( = ?auto_189085 ?auto_189084 ) ) ( not ( = ?auto_189085 ?auto_189077 ) ) ( not ( = ?auto_189078 ?auto_189081 ) ) ( not ( = ?auto_189078 ?auto_189079 ) ) ( not ( = ?auto_189078 ?auto_189080 ) ) ( not ( = ?auto_189078 ?auto_189083 ) ) ( not ( = ?auto_189078 ?auto_189084 ) ) ( not ( = ?auto_189078 ?auto_189077 ) ) ( not ( = ?auto_189081 ?auto_189079 ) ) ( not ( = ?auto_189081 ?auto_189080 ) ) ( not ( = ?auto_189081 ?auto_189083 ) ) ( not ( = ?auto_189081 ?auto_189084 ) ) ( not ( = ?auto_189081 ?auto_189077 ) ) ( not ( = ?auto_189079 ?auto_189080 ) ) ( not ( = ?auto_189079 ?auto_189083 ) ) ( not ( = ?auto_189079 ?auto_189084 ) ) ( not ( = ?auto_189079 ?auto_189077 ) ) ( not ( = ?auto_189080 ?auto_189083 ) ) ( not ( = ?auto_189080 ?auto_189084 ) ) ( not ( = ?auto_189080 ?auto_189077 ) ) ( not ( = ?auto_189083 ?auto_189084 ) ) ( not ( = ?auto_189083 ?auto_189077 ) ) ( ON ?auto_189077 ?auto_189082 ) ( CLEAR ?auto_189077 ) ( not ( = ?auto_189077 ?auto_189082 ) ) ( not ( = ?auto_189084 ?auto_189082 ) ) ( not ( = ?auto_189085 ?auto_189082 ) ) ( not ( = ?auto_189078 ?auto_189082 ) ) ( not ( = ?auto_189081 ?auto_189082 ) ) ( not ( = ?auto_189079 ?auto_189082 ) ) ( not ( = ?auto_189080 ?auto_189082 ) ) ( not ( = ?auto_189083 ?auto_189082 ) ) ( HOLDING ?auto_189084 ) ( CLEAR ?auto_189083 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189085 ?auto_189078 ?auto_189081 ?auto_189079 ?auto_189080 ?auto_189083 ?auto_189084 )
      ( MAKE-1PILE ?auto_189077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189086 - BLOCK
    )
    :vars
    (
      ?auto_189087 - BLOCK
      ?auto_189094 - BLOCK
      ?auto_189088 - BLOCK
      ?auto_189090 - BLOCK
      ?auto_189091 - BLOCK
      ?auto_189089 - BLOCK
      ?auto_189092 - BLOCK
      ?auto_189093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189086 ?auto_189087 ) ) ( ON-TABLE ?auto_189094 ) ( ON ?auto_189088 ?auto_189094 ) ( ON ?auto_189090 ?auto_189088 ) ( ON ?auto_189091 ?auto_189090 ) ( ON ?auto_189089 ?auto_189091 ) ( ON ?auto_189092 ?auto_189089 ) ( not ( = ?auto_189094 ?auto_189088 ) ) ( not ( = ?auto_189094 ?auto_189090 ) ) ( not ( = ?auto_189094 ?auto_189091 ) ) ( not ( = ?auto_189094 ?auto_189089 ) ) ( not ( = ?auto_189094 ?auto_189092 ) ) ( not ( = ?auto_189094 ?auto_189087 ) ) ( not ( = ?auto_189094 ?auto_189086 ) ) ( not ( = ?auto_189088 ?auto_189090 ) ) ( not ( = ?auto_189088 ?auto_189091 ) ) ( not ( = ?auto_189088 ?auto_189089 ) ) ( not ( = ?auto_189088 ?auto_189092 ) ) ( not ( = ?auto_189088 ?auto_189087 ) ) ( not ( = ?auto_189088 ?auto_189086 ) ) ( not ( = ?auto_189090 ?auto_189091 ) ) ( not ( = ?auto_189090 ?auto_189089 ) ) ( not ( = ?auto_189090 ?auto_189092 ) ) ( not ( = ?auto_189090 ?auto_189087 ) ) ( not ( = ?auto_189090 ?auto_189086 ) ) ( not ( = ?auto_189091 ?auto_189089 ) ) ( not ( = ?auto_189091 ?auto_189092 ) ) ( not ( = ?auto_189091 ?auto_189087 ) ) ( not ( = ?auto_189091 ?auto_189086 ) ) ( not ( = ?auto_189089 ?auto_189092 ) ) ( not ( = ?auto_189089 ?auto_189087 ) ) ( not ( = ?auto_189089 ?auto_189086 ) ) ( not ( = ?auto_189092 ?auto_189087 ) ) ( not ( = ?auto_189092 ?auto_189086 ) ) ( ON ?auto_189086 ?auto_189093 ) ( not ( = ?auto_189086 ?auto_189093 ) ) ( not ( = ?auto_189087 ?auto_189093 ) ) ( not ( = ?auto_189094 ?auto_189093 ) ) ( not ( = ?auto_189088 ?auto_189093 ) ) ( not ( = ?auto_189090 ?auto_189093 ) ) ( not ( = ?auto_189091 ?auto_189093 ) ) ( not ( = ?auto_189089 ?auto_189093 ) ) ( not ( = ?auto_189092 ?auto_189093 ) ) ( CLEAR ?auto_189092 ) ( ON ?auto_189087 ?auto_189086 ) ( CLEAR ?auto_189087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189093 ?auto_189086 )
      ( MAKE-1PILE ?auto_189086 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189095 - BLOCK
    )
    :vars
    (
      ?auto_189098 - BLOCK
      ?auto_189096 - BLOCK
      ?auto_189102 - BLOCK
      ?auto_189097 - BLOCK
      ?auto_189101 - BLOCK
      ?auto_189100 - BLOCK
      ?auto_189099 - BLOCK
      ?auto_189103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189095 ?auto_189098 ) ) ( ON-TABLE ?auto_189096 ) ( ON ?auto_189102 ?auto_189096 ) ( ON ?auto_189097 ?auto_189102 ) ( ON ?auto_189101 ?auto_189097 ) ( ON ?auto_189100 ?auto_189101 ) ( not ( = ?auto_189096 ?auto_189102 ) ) ( not ( = ?auto_189096 ?auto_189097 ) ) ( not ( = ?auto_189096 ?auto_189101 ) ) ( not ( = ?auto_189096 ?auto_189100 ) ) ( not ( = ?auto_189096 ?auto_189099 ) ) ( not ( = ?auto_189096 ?auto_189098 ) ) ( not ( = ?auto_189096 ?auto_189095 ) ) ( not ( = ?auto_189102 ?auto_189097 ) ) ( not ( = ?auto_189102 ?auto_189101 ) ) ( not ( = ?auto_189102 ?auto_189100 ) ) ( not ( = ?auto_189102 ?auto_189099 ) ) ( not ( = ?auto_189102 ?auto_189098 ) ) ( not ( = ?auto_189102 ?auto_189095 ) ) ( not ( = ?auto_189097 ?auto_189101 ) ) ( not ( = ?auto_189097 ?auto_189100 ) ) ( not ( = ?auto_189097 ?auto_189099 ) ) ( not ( = ?auto_189097 ?auto_189098 ) ) ( not ( = ?auto_189097 ?auto_189095 ) ) ( not ( = ?auto_189101 ?auto_189100 ) ) ( not ( = ?auto_189101 ?auto_189099 ) ) ( not ( = ?auto_189101 ?auto_189098 ) ) ( not ( = ?auto_189101 ?auto_189095 ) ) ( not ( = ?auto_189100 ?auto_189099 ) ) ( not ( = ?auto_189100 ?auto_189098 ) ) ( not ( = ?auto_189100 ?auto_189095 ) ) ( not ( = ?auto_189099 ?auto_189098 ) ) ( not ( = ?auto_189099 ?auto_189095 ) ) ( ON ?auto_189095 ?auto_189103 ) ( not ( = ?auto_189095 ?auto_189103 ) ) ( not ( = ?auto_189098 ?auto_189103 ) ) ( not ( = ?auto_189096 ?auto_189103 ) ) ( not ( = ?auto_189102 ?auto_189103 ) ) ( not ( = ?auto_189097 ?auto_189103 ) ) ( not ( = ?auto_189101 ?auto_189103 ) ) ( not ( = ?auto_189100 ?auto_189103 ) ) ( not ( = ?auto_189099 ?auto_189103 ) ) ( ON ?auto_189098 ?auto_189095 ) ( CLEAR ?auto_189098 ) ( ON-TABLE ?auto_189103 ) ( HOLDING ?auto_189099 ) ( CLEAR ?auto_189100 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189096 ?auto_189102 ?auto_189097 ?auto_189101 ?auto_189100 ?auto_189099 )
      ( MAKE-1PILE ?auto_189095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189104 - BLOCK
    )
    :vars
    (
      ?auto_189110 - BLOCK
      ?auto_189108 - BLOCK
      ?auto_189112 - BLOCK
      ?auto_189107 - BLOCK
      ?auto_189109 - BLOCK
      ?auto_189105 - BLOCK
      ?auto_189111 - BLOCK
      ?auto_189106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189104 ?auto_189110 ) ) ( ON-TABLE ?auto_189108 ) ( ON ?auto_189112 ?auto_189108 ) ( ON ?auto_189107 ?auto_189112 ) ( ON ?auto_189109 ?auto_189107 ) ( ON ?auto_189105 ?auto_189109 ) ( not ( = ?auto_189108 ?auto_189112 ) ) ( not ( = ?auto_189108 ?auto_189107 ) ) ( not ( = ?auto_189108 ?auto_189109 ) ) ( not ( = ?auto_189108 ?auto_189105 ) ) ( not ( = ?auto_189108 ?auto_189111 ) ) ( not ( = ?auto_189108 ?auto_189110 ) ) ( not ( = ?auto_189108 ?auto_189104 ) ) ( not ( = ?auto_189112 ?auto_189107 ) ) ( not ( = ?auto_189112 ?auto_189109 ) ) ( not ( = ?auto_189112 ?auto_189105 ) ) ( not ( = ?auto_189112 ?auto_189111 ) ) ( not ( = ?auto_189112 ?auto_189110 ) ) ( not ( = ?auto_189112 ?auto_189104 ) ) ( not ( = ?auto_189107 ?auto_189109 ) ) ( not ( = ?auto_189107 ?auto_189105 ) ) ( not ( = ?auto_189107 ?auto_189111 ) ) ( not ( = ?auto_189107 ?auto_189110 ) ) ( not ( = ?auto_189107 ?auto_189104 ) ) ( not ( = ?auto_189109 ?auto_189105 ) ) ( not ( = ?auto_189109 ?auto_189111 ) ) ( not ( = ?auto_189109 ?auto_189110 ) ) ( not ( = ?auto_189109 ?auto_189104 ) ) ( not ( = ?auto_189105 ?auto_189111 ) ) ( not ( = ?auto_189105 ?auto_189110 ) ) ( not ( = ?auto_189105 ?auto_189104 ) ) ( not ( = ?auto_189111 ?auto_189110 ) ) ( not ( = ?auto_189111 ?auto_189104 ) ) ( ON ?auto_189104 ?auto_189106 ) ( not ( = ?auto_189104 ?auto_189106 ) ) ( not ( = ?auto_189110 ?auto_189106 ) ) ( not ( = ?auto_189108 ?auto_189106 ) ) ( not ( = ?auto_189112 ?auto_189106 ) ) ( not ( = ?auto_189107 ?auto_189106 ) ) ( not ( = ?auto_189109 ?auto_189106 ) ) ( not ( = ?auto_189105 ?auto_189106 ) ) ( not ( = ?auto_189111 ?auto_189106 ) ) ( ON ?auto_189110 ?auto_189104 ) ( ON-TABLE ?auto_189106 ) ( CLEAR ?auto_189105 ) ( ON ?auto_189111 ?auto_189110 ) ( CLEAR ?auto_189111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189106 ?auto_189104 ?auto_189110 )
      ( MAKE-1PILE ?auto_189104 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189113 - BLOCK
    )
    :vars
    (
      ?auto_189115 - BLOCK
      ?auto_189119 - BLOCK
      ?auto_189121 - BLOCK
      ?auto_189116 - BLOCK
      ?auto_189114 - BLOCK
      ?auto_189118 - BLOCK
      ?auto_189117 - BLOCK
      ?auto_189120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189113 ?auto_189115 ) ) ( ON-TABLE ?auto_189119 ) ( ON ?auto_189121 ?auto_189119 ) ( ON ?auto_189116 ?auto_189121 ) ( ON ?auto_189114 ?auto_189116 ) ( not ( = ?auto_189119 ?auto_189121 ) ) ( not ( = ?auto_189119 ?auto_189116 ) ) ( not ( = ?auto_189119 ?auto_189114 ) ) ( not ( = ?auto_189119 ?auto_189118 ) ) ( not ( = ?auto_189119 ?auto_189117 ) ) ( not ( = ?auto_189119 ?auto_189115 ) ) ( not ( = ?auto_189119 ?auto_189113 ) ) ( not ( = ?auto_189121 ?auto_189116 ) ) ( not ( = ?auto_189121 ?auto_189114 ) ) ( not ( = ?auto_189121 ?auto_189118 ) ) ( not ( = ?auto_189121 ?auto_189117 ) ) ( not ( = ?auto_189121 ?auto_189115 ) ) ( not ( = ?auto_189121 ?auto_189113 ) ) ( not ( = ?auto_189116 ?auto_189114 ) ) ( not ( = ?auto_189116 ?auto_189118 ) ) ( not ( = ?auto_189116 ?auto_189117 ) ) ( not ( = ?auto_189116 ?auto_189115 ) ) ( not ( = ?auto_189116 ?auto_189113 ) ) ( not ( = ?auto_189114 ?auto_189118 ) ) ( not ( = ?auto_189114 ?auto_189117 ) ) ( not ( = ?auto_189114 ?auto_189115 ) ) ( not ( = ?auto_189114 ?auto_189113 ) ) ( not ( = ?auto_189118 ?auto_189117 ) ) ( not ( = ?auto_189118 ?auto_189115 ) ) ( not ( = ?auto_189118 ?auto_189113 ) ) ( not ( = ?auto_189117 ?auto_189115 ) ) ( not ( = ?auto_189117 ?auto_189113 ) ) ( ON ?auto_189113 ?auto_189120 ) ( not ( = ?auto_189113 ?auto_189120 ) ) ( not ( = ?auto_189115 ?auto_189120 ) ) ( not ( = ?auto_189119 ?auto_189120 ) ) ( not ( = ?auto_189121 ?auto_189120 ) ) ( not ( = ?auto_189116 ?auto_189120 ) ) ( not ( = ?auto_189114 ?auto_189120 ) ) ( not ( = ?auto_189118 ?auto_189120 ) ) ( not ( = ?auto_189117 ?auto_189120 ) ) ( ON ?auto_189115 ?auto_189113 ) ( ON-TABLE ?auto_189120 ) ( ON ?auto_189117 ?auto_189115 ) ( CLEAR ?auto_189117 ) ( HOLDING ?auto_189118 ) ( CLEAR ?auto_189114 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189119 ?auto_189121 ?auto_189116 ?auto_189114 ?auto_189118 )
      ( MAKE-1PILE ?auto_189113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189122 - BLOCK
    )
    :vars
    (
      ?auto_189124 - BLOCK
      ?auto_189129 - BLOCK
      ?auto_189128 - BLOCK
      ?auto_189125 - BLOCK
      ?auto_189127 - BLOCK
      ?auto_189130 - BLOCK
      ?auto_189123 - BLOCK
      ?auto_189126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189122 ?auto_189124 ) ) ( ON-TABLE ?auto_189129 ) ( ON ?auto_189128 ?auto_189129 ) ( ON ?auto_189125 ?auto_189128 ) ( ON ?auto_189127 ?auto_189125 ) ( not ( = ?auto_189129 ?auto_189128 ) ) ( not ( = ?auto_189129 ?auto_189125 ) ) ( not ( = ?auto_189129 ?auto_189127 ) ) ( not ( = ?auto_189129 ?auto_189130 ) ) ( not ( = ?auto_189129 ?auto_189123 ) ) ( not ( = ?auto_189129 ?auto_189124 ) ) ( not ( = ?auto_189129 ?auto_189122 ) ) ( not ( = ?auto_189128 ?auto_189125 ) ) ( not ( = ?auto_189128 ?auto_189127 ) ) ( not ( = ?auto_189128 ?auto_189130 ) ) ( not ( = ?auto_189128 ?auto_189123 ) ) ( not ( = ?auto_189128 ?auto_189124 ) ) ( not ( = ?auto_189128 ?auto_189122 ) ) ( not ( = ?auto_189125 ?auto_189127 ) ) ( not ( = ?auto_189125 ?auto_189130 ) ) ( not ( = ?auto_189125 ?auto_189123 ) ) ( not ( = ?auto_189125 ?auto_189124 ) ) ( not ( = ?auto_189125 ?auto_189122 ) ) ( not ( = ?auto_189127 ?auto_189130 ) ) ( not ( = ?auto_189127 ?auto_189123 ) ) ( not ( = ?auto_189127 ?auto_189124 ) ) ( not ( = ?auto_189127 ?auto_189122 ) ) ( not ( = ?auto_189130 ?auto_189123 ) ) ( not ( = ?auto_189130 ?auto_189124 ) ) ( not ( = ?auto_189130 ?auto_189122 ) ) ( not ( = ?auto_189123 ?auto_189124 ) ) ( not ( = ?auto_189123 ?auto_189122 ) ) ( ON ?auto_189122 ?auto_189126 ) ( not ( = ?auto_189122 ?auto_189126 ) ) ( not ( = ?auto_189124 ?auto_189126 ) ) ( not ( = ?auto_189129 ?auto_189126 ) ) ( not ( = ?auto_189128 ?auto_189126 ) ) ( not ( = ?auto_189125 ?auto_189126 ) ) ( not ( = ?auto_189127 ?auto_189126 ) ) ( not ( = ?auto_189130 ?auto_189126 ) ) ( not ( = ?auto_189123 ?auto_189126 ) ) ( ON ?auto_189124 ?auto_189122 ) ( ON-TABLE ?auto_189126 ) ( ON ?auto_189123 ?auto_189124 ) ( CLEAR ?auto_189127 ) ( ON ?auto_189130 ?auto_189123 ) ( CLEAR ?auto_189130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189126 ?auto_189122 ?auto_189124 ?auto_189123 )
      ( MAKE-1PILE ?auto_189122 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189131 - BLOCK
    )
    :vars
    (
      ?auto_189133 - BLOCK
      ?auto_189136 - BLOCK
      ?auto_189139 - BLOCK
      ?auto_189138 - BLOCK
      ?auto_189137 - BLOCK
      ?auto_189132 - BLOCK
      ?auto_189135 - BLOCK
      ?auto_189134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189131 ?auto_189133 ) ) ( ON-TABLE ?auto_189136 ) ( ON ?auto_189139 ?auto_189136 ) ( ON ?auto_189138 ?auto_189139 ) ( not ( = ?auto_189136 ?auto_189139 ) ) ( not ( = ?auto_189136 ?auto_189138 ) ) ( not ( = ?auto_189136 ?auto_189137 ) ) ( not ( = ?auto_189136 ?auto_189132 ) ) ( not ( = ?auto_189136 ?auto_189135 ) ) ( not ( = ?auto_189136 ?auto_189133 ) ) ( not ( = ?auto_189136 ?auto_189131 ) ) ( not ( = ?auto_189139 ?auto_189138 ) ) ( not ( = ?auto_189139 ?auto_189137 ) ) ( not ( = ?auto_189139 ?auto_189132 ) ) ( not ( = ?auto_189139 ?auto_189135 ) ) ( not ( = ?auto_189139 ?auto_189133 ) ) ( not ( = ?auto_189139 ?auto_189131 ) ) ( not ( = ?auto_189138 ?auto_189137 ) ) ( not ( = ?auto_189138 ?auto_189132 ) ) ( not ( = ?auto_189138 ?auto_189135 ) ) ( not ( = ?auto_189138 ?auto_189133 ) ) ( not ( = ?auto_189138 ?auto_189131 ) ) ( not ( = ?auto_189137 ?auto_189132 ) ) ( not ( = ?auto_189137 ?auto_189135 ) ) ( not ( = ?auto_189137 ?auto_189133 ) ) ( not ( = ?auto_189137 ?auto_189131 ) ) ( not ( = ?auto_189132 ?auto_189135 ) ) ( not ( = ?auto_189132 ?auto_189133 ) ) ( not ( = ?auto_189132 ?auto_189131 ) ) ( not ( = ?auto_189135 ?auto_189133 ) ) ( not ( = ?auto_189135 ?auto_189131 ) ) ( ON ?auto_189131 ?auto_189134 ) ( not ( = ?auto_189131 ?auto_189134 ) ) ( not ( = ?auto_189133 ?auto_189134 ) ) ( not ( = ?auto_189136 ?auto_189134 ) ) ( not ( = ?auto_189139 ?auto_189134 ) ) ( not ( = ?auto_189138 ?auto_189134 ) ) ( not ( = ?auto_189137 ?auto_189134 ) ) ( not ( = ?auto_189132 ?auto_189134 ) ) ( not ( = ?auto_189135 ?auto_189134 ) ) ( ON ?auto_189133 ?auto_189131 ) ( ON-TABLE ?auto_189134 ) ( ON ?auto_189135 ?auto_189133 ) ( ON ?auto_189132 ?auto_189135 ) ( CLEAR ?auto_189132 ) ( HOLDING ?auto_189137 ) ( CLEAR ?auto_189138 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189136 ?auto_189139 ?auto_189138 ?auto_189137 )
      ( MAKE-1PILE ?auto_189131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189140 - BLOCK
    )
    :vars
    (
      ?auto_189144 - BLOCK
      ?auto_189142 - BLOCK
      ?auto_189145 - BLOCK
      ?auto_189141 - BLOCK
      ?auto_189148 - BLOCK
      ?auto_189147 - BLOCK
      ?auto_189143 - BLOCK
      ?auto_189146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189140 ?auto_189144 ) ) ( ON-TABLE ?auto_189142 ) ( ON ?auto_189145 ?auto_189142 ) ( ON ?auto_189141 ?auto_189145 ) ( not ( = ?auto_189142 ?auto_189145 ) ) ( not ( = ?auto_189142 ?auto_189141 ) ) ( not ( = ?auto_189142 ?auto_189148 ) ) ( not ( = ?auto_189142 ?auto_189147 ) ) ( not ( = ?auto_189142 ?auto_189143 ) ) ( not ( = ?auto_189142 ?auto_189144 ) ) ( not ( = ?auto_189142 ?auto_189140 ) ) ( not ( = ?auto_189145 ?auto_189141 ) ) ( not ( = ?auto_189145 ?auto_189148 ) ) ( not ( = ?auto_189145 ?auto_189147 ) ) ( not ( = ?auto_189145 ?auto_189143 ) ) ( not ( = ?auto_189145 ?auto_189144 ) ) ( not ( = ?auto_189145 ?auto_189140 ) ) ( not ( = ?auto_189141 ?auto_189148 ) ) ( not ( = ?auto_189141 ?auto_189147 ) ) ( not ( = ?auto_189141 ?auto_189143 ) ) ( not ( = ?auto_189141 ?auto_189144 ) ) ( not ( = ?auto_189141 ?auto_189140 ) ) ( not ( = ?auto_189148 ?auto_189147 ) ) ( not ( = ?auto_189148 ?auto_189143 ) ) ( not ( = ?auto_189148 ?auto_189144 ) ) ( not ( = ?auto_189148 ?auto_189140 ) ) ( not ( = ?auto_189147 ?auto_189143 ) ) ( not ( = ?auto_189147 ?auto_189144 ) ) ( not ( = ?auto_189147 ?auto_189140 ) ) ( not ( = ?auto_189143 ?auto_189144 ) ) ( not ( = ?auto_189143 ?auto_189140 ) ) ( ON ?auto_189140 ?auto_189146 ) ( not ( = ?auto_189140 ?auto_189146 ) ) ( not ( = ?auto_189144 ?auto_189146 ) ) ( not ( = ?auto_189142 ?auto_189146 ) ) ( not ( = ?auto_189145 ?auto_189146 ) ) ( not ( = ?auto_189141 ?auto_189146 ) ) ( not ( = ?auto_189148 ?auto_189146 ) ) ( not ( = ?auto_189147 ?auto_189146 ) ) ( not ( = ?auto_189143 ?auto_189146 ) ) ( ON ?auto_189144 ?auto_189140 ) ( ON-TABLE ?auto_189146 ) ( ON ?auto_189143 ?auto_189144 ) ( ON ?auto_189147 ?auto_189143 ) ( CLEAR ?auto_189141 ) ( ON ?auto_189148 ?auto_189147 ) ( CLEAR ?auto_189148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189146 ?auto_189140 ?auto_189144 ?auto_189143 ?auto_189147 )
      ( MAKE-1PILE ?auto_189140 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189149 - BLOCK
    )
    :vars
    (
      ?auto_189156 - BLOCK
      ?auto_189152 - BLOCK
      ?auto_189157 - BLOCK
      ?auto_189155 - BLOCK
      ?auto_189151 - BLOCK
      ?auto_189153 - BLOCK
      ?auto_189154 - BLOCK
      ?auto_189150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189149 ?auto_189156 ) ) ( ON-TABLE ?auto_189152 ) ( ON ?auto_189157 ?auto_189152 ) ( not ( = ?auto_189152 ?auto_189157 ) ) ( not ( = ?auto_189152 ?auto_189155 ) ) ( not ( = ?auto_189152 ?auto_189151 ) ) ( not ( = ?auto_189152 ?auto_189153 ) ) ( not ( = ?auto_189152 ?auto_189154 ) ) ( not ( = ?auto_189152 ?auto_189156 ) ) ( not ( = ?auto_189152 ?auto_189149 ) ) ( not ( = ?auto_189157 ?auto_189155 ) ) ( not ( = ?auto_189157 ?auto_189151 ) ) ( not ( = ?auto_189157 ?auto_189153 ) ) ( not ( = ?auto_189157 ?auto_189154 ) ) ( not ( = ?auto_189157 ?auto_189156 ) ) ( not ( = ?auto_189157 ?auto_189149 ) ) ( not ( = ?auto_189155 ?auto_189151 ) ) ( not ( = ?auto_189155 ?auto_189153 ) ) ( not ( = ?auto_189155 ?auto_189154 ) ) ( not ( = ?auto_189155 ?auto_189156 ) ) ( not ( = ?auto_189155 ?auto_189149 ) ) ( not ( = ?auto_189151 ?auto_189153 ) ) ( not ( = ?auto_189151 ?auto_189154 ) ) ( not ( = ?auto_189151 ?auto_189156 ) ) ( not ( = ?auto_189151 ?auto_189149 ) ) ( not ( = ?auto_189153 ?auto_189154 ) ) ( not ( = ?auto_189153 ?auto_189156 ) ) ( not ( = ?auto_189153 ?auto_189149 ) ) ( not ( = ?auto_189154 ?auto_189156 ) ) ( not ( = ?auto_189154 ?auto_189149 ) ) ( ON ?auto_189149 ?auto_189150 ) ( not ( = ?auto_189149 ?auto_189150 ) ) ( not ( = ?auto_189156 ?auto_189150 ) ) ( not ( = ?auto_189152 ?auto_189150 ) ) ( not ( = ?auto_189157 ?auto_189150 ) ) ( not ( = ?auto_189155 ?auto_189150 ) ) ( not ( = ?auto_189151 ?auto_189150 ) ) ( not ( = ?auto_189153 ?auto_189150 ) ) ( not ( = ?auto_189154 ?auto_189150 ) ) ( ON ?auto_189156 ?auto_189149 ) ( ON-TABLE ?auto_189150 ) ( ON ?auto_189154 ?auto_189156 ) ( ON ?auto_189153 ?auto_189154 ) ( ON ?auto_189151 ?auto_189153 ) ( CLEAR ?auto_189151 ) ( HOLDING ?auto_189155 ) ( CLEAR ?auto_189157 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189152 ?auto_189157 ?auto_189155 )
      ( MAKE-1PILE ?auto_189149 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189158 - BLOCK
    )
    :vars
    (
      ?auto_189165 - BLOCK
      ?auto_189162 - BLOCK
      ?auto_189166 - BLOCK
      ?auto_189159 - BLOCK
      ?auto_189164 - BLOCK
      ?auto_189163 - BLOCK
      ?auto_189160 - BLOCK
      ?auto_189161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189158 ?auto_189165 ) ) ( ON-TABLE ?auto_189162 ) ( ON ?auto_189166 ?auto_189162 ) ( not ( = ?auto_189162 ?auto_189166 ) ) ( not ( = ?auto_189162 ?auto_189159 ) ) ( not ( = ?auto_189162 ?auto_189164 ) ) ( not ( = ?auto_189162 ?auto_189163 ) ) ( not ( = ?auto_189162 ?auto_189160 ) ) ( not ( = ?auto_189162 ?auto_189165 ) ) ( not ( = ?auto_189162 ?auto_189158 ) ) ( not ( = ?auto_189166 ?auto_189159 ) ) ( not ( = ?auto_189166 ?auto_189164 ) ) ( not ( = ?auto_189166 ?auto_189163 ) ) ( not ( = ?auto_189166 ?auto_189160 ) ) ( not ( = ?auto_189166 ?auto_189165 ) ) ( not ( = ?auto_189166 ?auto_189158 ) ) ( not ( = ?auto_189159 ?auto_189164 ) ) ( not ( = ?auto_189159 ?auto_189163 ) ) ( not ( = ?auto_189159 ?auto_189160 ) ) ( not ( = ?auto_189159 ?auto_189165 ) ) ( not ( = ?auto_189159 ?auto_189158 ) ) ( not ( = ?auto_189164 ?auto_189163 ) ) ( not ( = ?auto_189164 ?auto_189160 ) ) ( not ( = ?auto_189164 ?auto_189165 ) ) ( not ( = ?auto_189164 ?auto_189158 ) ) ( not ( = ?auto_189163 ?auto_189160 ) ) ( not ( = ?auto_189163 ?auto_189165 ) ) ( not ( = ?auto_189163 ?auto_189158 ) ) ( not ( = ?auto_189160 ?auto_189165 ) ) ( not ( = ?auto_189160 ?auto_189158 ) ) ( ON ?auto_189158 ?auto_189161 ) ( not ( = ?auto_189158 ?auto_189161 ) ) ( not ( = ?auto_189165 ?auto_189161 ) ) ( not ( = ?auto_189162 ?auto_189161 ) ) ( not ( = ?auto_189166 ?auto_189161 ) ) ( not ( = ?auto_189159 ?auto_189161 ) ) ( not ( = ?auto_189164 ?auto_189161 ) ) ( not ( = ?auto_189163 ?auto_189161 ) ) ( not ( = ?auto_189160 ?auto_189161 ) ) ( ON ?auto_189165 ?auto_189158 ) ( ON-TABLE ?auto_189161 ) ( ON ?auto_189160 ?auto_189165 ) ( ON ?auto_189163 ?auto_189160 ) ( ON ?auto_189164 ?auto_189163 ) ( CLEAR ?auto_189166 ) ( ON ?auto_189159 ?auto_189164 ) ( CLEAR ?auto_189159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189161 ?auto_189158 ?auto_189165 ?auto_189160 ?auto_189163 ?auto_189164 )
      ( MAKE-1PILE ?auto_189158 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189167 - BLOCK
    )
    :vars
    (
      ?auto_189172 - BLOCK
      ?auto_189173 - BLOCK
      ?auto_189171 - BLOCK
      ?auto_189175 - BLOCK
      ?auto_189170 - BLOCK
      ?auto_189174 - BLOCK
      ?auto_189169 - BLOCK
      ?auto_189168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189167 ?auto_189172 ) ) ( ON-TABLE ?auto_189173 ) ( not ( = ?auto_189173 ?auto_189171 ) ) ( not ( = ?auto_189173 ?auto_189175 ) ) ( not ( = ?auto_189173 ?auto_189170 ) ) ( not ( = ?auto_189173 ?auto_189174 ) ) ( not ( = ?auto_189173 ?auto_189169 ) ) ( not ( = ?auto_189173 ?auto_189172 ) ) ( not ( = ?auto_189173 ?auto_189167 ) ) ( not ( = ?auto_189171 ?auto_189175 ) ) ( not ( = ?auto_189171 ?auto_189170 ) ) ( not ( = ?auto_189171 ?auto_189174 ) ) ( not ( = ?auto_189171 ?auto_189169 ) ) ( not ( = ?auto_189171 ?auto_189172 ) ) ( not ( = ?auto_189171 ?auto_189167 ) ) ( not ( = ?auto_189175 ?auto_189170 ) ) ( not ( = ?auto_189175 ?auto_189174 ) ) ( not ( = ?auto_189175 ?auto_189169 ) ) ( not ( = ?auto_189175 ?auto_189172 ) ) ( not ( = ?auto_189175 ?auto_189167 ) ) ( not ( = ?auto_189170 ?auto_189174 ) ) ( not ( = ?auto_189170 ?auto_189169 ) ) ( not ( = ?auto_189170 ?auto_189172 ) ) ( not ( = ?auto_189170 ?auto_189167 ) ) ( not ( = ?auto_189174 ?auto_189169 ) ) ( not ( = ?auto_189174 ?auto_189172 ) ) ( not ( = ?auto_189174 ?auto_189167 ) ) ( not ( = ?auto_189169 ?auto_189172 ) ) ( not ( = ?auto_189169 ?auto_189167 ) ) ( ON ?auto_189167 ?auto_189168 ) ( not ( = ?auto_189167 ?auto_189168 ) ) ( not ( = ?auto_189172 ?auto_189168 ) ) ( not ( = ?auto_189173 ?auto_189168 ) ) ( not ( = ?auto_189171 ?auto_189168 ) ) ( not ( = ?auto_189175 ?auto_189168 ) ) ( not ( = ?auto_189170 ?auto_189168 ) ) ( not ( = ?auto_189174 ?auto_189168 ) ) ( not ( = ?auto_189169 ?auto_189168 ) ) ( ON ?auto_189172 ?auto_189167 ) ( ON-TABLE ?auto_189168 ) ( ON ?auto_189169 ?auto_189172 ) ( ON ?auto_189174 ?auto_189169 ) ( ON ?auto_189170 ?auto_189174 ) ( ON ?auto_189175 ?auto_189170 ) ( CLEAR ?auto_189175 ) ( HOLDING ?auto_189171 ) ( CLEAR ?auto_189173 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189173 ?auto_189171 )
      ( MAKE-1PILE ?auto_189167 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189176 - BLOCK
    )
    :vars
    (
      ?auto_189180 - BLOCK
      ?auto_189181 - BLOCK
      ?auto_189182 - BLOCK
      ?auto_189183 - BLOCK
      ?auto_189179 - BLOCK
      ?auto_189184 - BLOCK
      ?auto_189177 - BLOCK
      ?auto_189178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189176 ?auto_189180 ) ) ( ON-TABLE ?auto_189181 ) ( not ( = ?auto_189181 ?auto_189182 ) ) ( not ( = ?auto_189181 ?auto_189183 ) ) ( not ( = ?auto_189181 ?auto_189179 ) ) ( not ( = ?auto_189181 ?auto_189184 ) ) ( not ( = ?auto_189181 ?auto_189177 ) ) ( not ( = ?auto_189181 ?auto_189180 ) ) ( not ( = ?auto_189181 ?auto_189176 ) ) ( not ( = ?auto_189182 ?auto_189183 ) ) ( not ( = ?auto_189182 ?auto_189179 ) ) ( not ( = ?auto_189182 ?auto_189184 ) ) ( not ( = ?auto_189182 ?auto_189177 ) ) ( not ( = ?auto_189182 ?auto_189180 ) ) ( not ( = ?auto_189182 ?auto_189176 ) ) ( not ( = ?auto_189183 ?auto_189179 ) ) ( not ( = ?auto_189183 ?auto_189184 ) ) ( not ( = ?auto_189183 ?auto_189177 ) ) ( not ( = ?auto_189183 ?auto_189180 ) ) ( not ( = ?auto_189183 ?auto_189176 ) ) ( not ( = ?auto_189179 ?auto_189184 ) ) ( not ( = ?auto_189179 ?auto_189177 ) ) ( not ( = ?auto_189179 ?auto_189180 ) ) ( not ( = ?auto_189179 ?auto_189176 ) ) ( not ( = ?auto_189184 ?auto_189177 ) ) ( not ( = ?auto_189184 ?auto_189180 ) ) ( not ( = ?auto_189184 ?auto_189176 ) ) ( not ( = ?auto_189177 ?auto_189180 ) ) ( not ( = ?auto_189177 ?auto_189176 ) ) ( ON ?auto_189176 ?auto_189178 ) ( not ( = ?auto_189176 ?auto_189178 ) ) ( not ( = ?auto_189180 ?auto_189178 ) ) ( not ( = ?auto_189181 ?auto_189178 ) ) ( not ( = ?auto_189182 ?auto_189178 ) ) ( not ( = ?auto_189183 ?auto_189178 ) ) ( not ( = ?auto_189179 ?auto_189178 ) ) ( not ( = ?auto_189184 ?auto_189178 ) ) ( not ( = ?auto_189177 ?auto_189178 ) ) ( ON ?auto_189180 ?auto_189176 ) ( ON-TABLE ?auto_189178 ) ( ON ?auto_189177 ?auto_189180 ) ( ON ?auto_189184 ?auto_189177 ) ( ON ?auto_189179 ?auto_189184 ) ( ON ?auto_189183 ?auto_189179 ) ( CLEAR ?auto_189181 ) ( ON ?auto_189182 ?auto_189183 ) ( CLEAR ?auto_189182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189178 ?auto_189176 ?auto_189180 ?auto_189177 ?auto_189184 ?auto_189179 ?auto_189183 )
      ( MAKE-1PILE ?auto_189176 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189185 - BLOCK
    )
    :vars
    (
      ?auto_189189 - BLOCK
      ?auto_189187 - BLOCK
      ?auto_189191 - BLOCK
      ?auto_189188 - BLOCK
      ?auto_189193 - BLOCK
      ?auto_189186 - BLOCK
      ?auto_189192 - BLOCK
      ?auto_189190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189185 ?auto_189189 ) ) ( not ( = ?auto_189187 ?auto_189191 ) ) ( not ( = ?auto_189187 ?auto_189188 ) ) ( not ( = ?auto_189187 ?auto_189193 ) ) ( not ( = ?auto_189187 ?auto_189186 ) ) ( not ( = ?auto_189187 ?auto_189192 ) ) ( not ( = ?auto_189187 ?auto_189189 ) ) ( not ( = ?auto_189187 ?auto_189185 ) ) ( not ( = ?auto_189191 ?auto_189188 ) ) ( not ( = ?auto_189191 ?auto_189193 ) ) ( not ( = ?auto_189191 ?auto_189186 ) ) ( not ( = ?auto_189191 ?auto_189192 ) ) ( not ( = ?auto_189191 ?auto_189189 ) ) ( not ( = ?auto_189191 ?auto_189185 ) ) ( not ( = ?auto_189188 ?auto_189193 ) ) ( not ( = ?auto_189188 ?auto_189186 ) ) ( not ( = ?auto_189188 ?auto_189192 ) ) ( not ( = ?auto_189188 ?auto_189189 ) ) ( not ( = ?auto_189188 ?auto_189185 ) ) ( not ( = ?auto_189193 ?auto_189186 ) ) ( not ( = ?auto_189193 ?auto_189192 ) ) ( not ( = ?auto_189193 ?auto_189189 ) ) ( not ( = ?auto_189193 ?auto_189185 ) ) ( not ( = ?auto_189186 ?auto_189192 ) ) ( not ( = ?auto_189186 ?auto_189189 ) ) ( not ( = ?auto_189186 ?auto_189185 ) ) ( not ( = ?auto_189192 ?auto_189189 ) ) ( not ( = ?auto_189192 ?auto_189185 ) ) ( ON ?auto_189185 ?auto_189190 ) ( not ( = ?auto_189185 ?auto_189190 ) ) ( not ( = ?auto_189189 ?auto_189190 ) ) ( not ( = ?auto_189187 ?auto_189190 ) ) ( not ( = ?auto_189191 ?auto_189190 ) ) ( not ( = ?auto_189188 ?auto_189190 ) ) ( not ( = ?auto_189193 ?auto_189190 ) ) ( not ( = ?auto_189186 ?auto_189190 ) ) ( not ( = ?auto_189192 ?auto_189190 ) ) ( ON ?auto_189189 ?auto_189185 ) ( ON-TABLE ?auto_189190 ) ( ON ?auto_189192 ?auto_189189 ) ( ON ?auto_189186 ?auto_189192 ) ( ON ?auto_189193 ?auto_189186 ) ( ON ?auto_189188 ?auto_189193 ) ( ON ?auto_189191 ?auto_189188 ) ( CLEAR ?auto_189191 ) ( HOLDING ?auto_189187 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189187 )
      ( MAKE-1PILE ?auto_189185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_189194 - BLOCK
    )
    :vars
    (
      ?auto_189198 - BLOCK
      ?auto_189202 - BLOCK
      ?auto_189197 - BLOCK
      ?auto_189199 - BLOCK
      ?auto_189195 - BLOCK
      ?auto_189201 - BLOCK
      ?auto_189196 - BLOCK
      ?auto_189200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189194 ?auto_189198 ) ) ( not ( = ?auto_189202 ?auto_189197 ) ) ( not ( = ?auto_189202 ?auto_189199 ) ) ( not ( = ?auto_189202 ?auto_189195 ) ) ( not ( = ?auto_189202 ?auto_189201 ) ) ( not ( = ?auto_189202 ?auto_189196 ) ) ( not ( = ?auto_189202 ?auto_189198 ) ) ( not ( = ?auto_189202 ?auto_189194 ) ) ( not ( = ?auto_189197 ?auto_189199 ) ) ( not ( = ?auto_189197 ?auto_189195 ) ) ( not ( = ?auto_189197 ?auto_189201 ) ) ( not ( = ?auto_189197 ?auto_189196 ) ) ( not ( = ?auto_189197 ?auto_189198 ) ) ( not ( = ?auto_189197 ?auto_189194 ) ) ( not ( = ?auto_189199 ?auto_189195 ) ) ( not ( = ?auto_189199 ?auto_189201 ) ) ( not ( = ?auto_189199 ?auto_189196 ) ) ( not ( = ?auto_189199 ?auto_189198 ) ) ( not ( = ?auto_189199 ?auto_189194 ) ) ( not ( = ?auto_189195 ?auto_189201 ) ) ( not ( = ?auto_189195 ?auto_189196 ) ) ( not ( = ?auto_189195 ?auto_189198 ) ) ( not ( = ?auto_189195 ?auto_189194 ) ) ( not ( = ?auto_189201 ?auto_189196 ) ) ( not ( = ?auto_189201 ?auto_189198 ) ) ( not ( = ?auto_189201 ?auto_189194 ) ) ( not ( = ?auto_189196 ?auto_189198 ) ) ( not ( = ?auto_189196 ?auto_189194 ) ) ( ON ?auto_189194 ?auto_189200 ) ( not ( = ?auto_189194 ?auto_189200 ) ) ( not ( = ?auto_189198 ?auto_189200 ) ) ( not ( = ?auto_189202 ?auto_189200 ) ) ( not ( = ?auto_189197 ?auto_189200 ) ) ( not ( = ?auto_189199 ?auto_189200 ) ) ( not ( = ?auto_189195 ?auto_189200 ) ) ( not ( = ?auto_189201 ?auto_189200 ) ) ( not ( = ?auto_189196 ?auto_189200 ) ) ( ON ?auto_189198 ?auto_189194 ) ( ON-TABLE ?auto_189200 ) ( ON ?auto_189196 ?auto_189198 ) ( ON ?auto_189201 ?auto_189196 ) ( ON ?auto_189195 ?auto_189201 ) ( ON ?auto_189199 ?auto_189195 ) ( ON ?auto_189197 ?auto_189199 ) ( ON ?auto_189202 ?auto_189197 ) ( CLEAR ?auto_189202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189200 ?auto_189194 ?auto_189198 ?auto_189196 ?auto_189201 ?auto_189195 ?auto_189199 ?auto_189197 )
      ( MAKE-1PILE ?auto_189194 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189209 - BLOCK
      ?auto_189210 - BLOCK
      ?auto_189211 - BLOCK
      ?auto_189212 - BLOCK
      ?auto_189213 - BLOCK
      ?auto_189214 - BLOCK
    )
    :vars
    (
      ?auto_189215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189215 ?auto_189214 ) ( CLEAR ?auto_189215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189209 ) ( ON ?auto_189210 ?auto_189209 ) ( ON ?auto_189211 ?auto_189210 ) ( ON ?auto_189212 ?auto_189211 ) ( ON ?auto_189213 ?auto_189212 ) ( ON ?auto_189214 ?auto_189213 ) ( not ( = ?auto_189209 ?auto_189210 ) ) ( not ( = ?auto_189209 ?auto_189211 ) ) ( not ( = ?auto_189209 ?auto_189212 ) ) ( not ( = ?auto_189209 ?auto_189213 ) ) ( not ( = ?auto_189209 ?auto_189214 ) ) ( not ( = ?auto_189209 ?auto_189215 ) ) ( not ( = ?auto_189210 ?auto_189211 ) ) ( not ( = ?auto_189210 ?auto_189212 ) ) ( not ( = ?auto_189210 ?auto_189213 ) ) ( not ( = ?auto_189210 ?auto_189214 ) ) ( not ( = ?auto_189210 ?auto_189215 ) ) ( not ( = ?auto_189211 ?auto_189212 ) ) ( not ( = ?auto_189211 ?auto_189213 ) ) ( not ( = ?auto_189211 ?auto_189214 ) ) ( not ( = ?auto_189211 ?auto_189215 ) ) ( not ( = ?auto_189212 ?auto_189213 ) ) ( not ( = ?auto_189212 ?auto_189214 ) ) ( not ( = ?auto_189212 ?auto_189215 ) ) ( not ( = ?auto_189213 ?auto_189214 ) ) ( not ( = ?auto_189213 ?auto_189215 ) ) ( not ( = ?auto_189214 ?auto_189215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189215 ?auto_189214 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189216 - BLOCK
      ?auto_189217 - BLOCK
      ?auto_189218 - BLOCK
      ?auto_189219 - BLOCK
      ?auto_189220 - BLOCK
      ?auto_189221 - BLOCK
    )
    :vars
    (
      ?auto_189222 - BLOCK
      ?auto_189223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189222 ?auto_189221 ) ( CLEAR ?auto_189222 ) ( ON-TABLE ?auto_189216 ) ( ON ?auto_189217 ?auto_189216 ) ( ON ?auto_189218 ?auto_189217 ) ( ON ?auto_189219 ?auto_189218 ) ( ON ?auto_189220 ?auto_189219 ) ( ON ?auto_189221 ?auto_189220 ) ( not ( = ?auto_189216 ?auto_189217 ) ) ( not ( = ?auto_189216 ?auto_189218 ) ) ( not ( = ?auto_189216 ?auto_189219 ) ) ( not ( = ?auto_189216 ?auto_189220 ) ) ( not ( = ?auto_189216 ?auto_189221 ) ) ( not ( = ?auto_189216 ?auto_189222 ) ) ( not ( = ?auto_189217 ?auto_189218 ) ) ( not ( = ?auto_189217 ?auto_189219 ) ) ( not ( = ?auto_189217 ?auto_189220 ) ) ( not ( = ?auto_189217 ?auto_189221 ) ) ( not ( = ?auto_189217 ?auto_189222 ) ) ( not ( = ?auto_189218 ?auto_189219 ) ) ( not ( = ?auto_189218 ?auto_189220 ) ) ( not ( = ?auto_189218 ?auto_189221 ) ) ( not ( = ?auto_189218 ?auto_189222 ) ) ( not ( = ?auto_189219 ?auto_189220 ) ) ( not ( = ?auto_189219 ?auto_189221 ) ) ( not ( = ?auto_189219 ?auto_189222 ) ) ( not ( = ?auto_189220 ?auto_189221 ) ) ( not ( = ?auto_189220 ?auto_189222 ) ) ( not ( = ?auto_189221 ?auto_189222 ) ) ( HOLDING ?auto_189223 ) ( not ( = ?auto_189216 ?auto_189223 ) ) ( not ( = ?auto_189217 ?auto_189223 ) ) ( not ( = ?auto_189218 ?auto_189223 ) ) ( not ( = ?auto_189219 ?auto_189223 ) ) ( not ( = ?auto_189220 ?auto_189223 ) ) ( not ( = ?auto_189221 ?auto_189223 ) ) ( not ( = ?auto_189222 ?auto_189223 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_189223 )
      ( MAKE-6PILE ?auto_189216 ?auto_189217 ?auto_189218 ?auto_189219 ?auto_189220 ?auto_189221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189224 - BLOCK
      ?auto_189225 - BLOCK
      ?auto_189226 - BLOCK
      ?auto_189227 - BLOCK
      ?auto_189228 - BLOCK
      ?auto_189229 - BLOCK
    )
    :vars
    (
      ?auto_189230 - BLOCK
      ?auto_189231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189230 ?auto_189229 ) ( ON-TABLE ?auto_189224 ) ( ON ?auto_189225 ?auto_189224 ) ( ON ?auto_189226 ?auto_189225 ) ( ON ?auto_189227 ?auto_189226 ) ( ON ?auto_189228 ?auto_189227 ) ( ON ?auto_189229 ?auto_189228 ) ( not ( = ?auto_189224 ?auto_189225 ) ) ( not ( = ?auto_189224 ?auto_189226 ) ) ( not ( = ?auto_189224 ?auto_189227 ) ) ( not ( = ?auto_189224 ?auto_189228 ) ) ( not ( = ?auto_189224 ?auto_189229 ) ) ( not ( = ?auto_189224 ?auto_189230 ) ) ( not ( = ?auto_189225 ?auto_189226 ) ) ( not ( = ?auto_189225 ?auto_189227 ) ) ( not ( = ?auto_189225 ?auto_189228 ) ) ( not ( = ?auto_189225 ?auto_189229 ) ) ( not ( = ?auto_189225 ?auto_189230 ) ) ( not ( = ?auto_189226 ?auto_189227 ) ) ( not ( = ?auto_189226 ?auto_189228 ) ) ( not ( = ?auto_189226 ?auto_189229 ) ) ( not ( = ?auto_189226 ?auto_189230 ) ) ( not ( = ?auto_189227 ?auto_189228 ) ) ( not ( = ?auto_189227 ?auto_189229 ) ) ( not ( = ?auto_189227 ?auto_189230 ) ) ( not ( = ?auto_189228 ?auto_189229 ) ) ( not ( = ?auto_189228 ?auto_189230 ) ) ( not ( = ?auto_189229 ?auto_189230 ) ) ( not ( = ?auto_189224 ?auto_189231 ) ) ( not ( = ?auto_189225 ?auto_189231 ) ) ( not ( = ?auto_189226 ?auto_189231 ) ) ( not ( = ?auto_189227 ?auto_189231 ) ) ( not ( = ?auto_189228 ?auto_189231 ) ) ( not ( = ?auto_189229 ?auto_189231 ) ) ( not ( = ?auto_189230 ?auto_189231 ) ) ( ON ?auto_189231 ?auto_189230 ) ( CLEAR ?auto_189231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189224 ?auto_189225 ?auto_189226 ?auto_189227 ?auto_189228 ?auto_189229 ?auto_189230 )
      ( MAKE-6PILE ?auto_189224 ?auto_189225 ?auto_189226 ?auto_189227 ?auto_189228 ?auto_189229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189232 - BLOCK
      ?auto_189233 - BLOCK
      ?auto_189234 - BLOCK
      ?auto_189235 - BLOCK
      ?auto_189236 - BLOCK
      ?auto_189237 - BLOCK
    )
    :vars
    (
      ?auto_189238 - BLOCK
      ?auto_189239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189238 ?auto_189237 ) ( ON-TABLE ?auto_189232 ) ( ON ?auto_189233 ?auto_189232 ) ( ON ?auto_189234 ?auto_189233 ) ( ON ?auto_189235 ?auto_189234 ) ( ON ?auto_189236 ?auto_189235 ) ( ON ?auto_189237 ?auto_189236 ) ( not ( = ?auto_189232 ?auto_189233 ) ) ( not ( = ?auto_189232 ?auto_189234 ) ) ( not ( = ?auto_189232 ?auto_189235 ) ) ( not ( = ?auto_189232 ?auto_189236 ) ) ( not ( = ?auto_189232 ?auto_189237 ) ) ( not ( = ?auto_189232 ?auto_189238 ) ) ( not ( = ?auto_189233 ?auto_189234 ) ) ( not ( = ?auto_189233 ?auto_189235 ) ) ( not ( = ?auto_189233 ?auto_189236 ) ) ( not ( = ?auto_189233 ?auto_189237 ) ) ( not ( = ?auto_189233 ?auto_189238 ) ) ( not ( = ?auto_189234 ?auto_189235 ) ) ( not ( = ?auto_189234 ?auto_189236 ) ) ( not ( = ?auto_189234 ?auto_189237 ) ) ( not ( = ?auto_189234 ?auto_189238 ) ) ( not ( = ?auto_189235 ?auto_189236 ) ) ( not ( = ?auto_189235 ?auto_189237 ) ) ( not ( = ?auto_189235 ?auto_189238 ) ) ( not ( = ?auto_189236 ?auto_189237 ) ) ( not ( = ?auto_189236 ?auto_189238 ) ) ( not ( = ?auto_189237 ?auto_189238 ) ) ( not ( = ?auto_189232 ?auto_189239 ) ) ( not ( = ?auto_189233 ?auto_189239 ) ) ( not ( = ?auto_189234 ?auto_189239 ) ) ( not ( = ?auto_189235 ?auto_189239 ) ) ( not ( = ?auto_189236 ?auto_189239 ) ) ( not ( = ?auto_189237 ?auto_189239 ) ) ( not ( = ?auto_189238 ?auto_189239 ) ) ( HOLDING ?auto_189239 ) ( CLEAR ?auto_189238 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189232 ?auto_189233 ?auto_189234 ?auto_189235 ?auto_189236 ?auto_189237 ?auto_189238 ?auto_189239 )
      ( MAKE-6PILE ?auto_189232 ?auto_189233 ?auto_189234 ?auto_189235 ?auto_189236 ?auto_189237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189240 - BLOCK
      ?auto_189241 - BLOCK
      ?auto_189242 - BLOCK
      ?auto_189243 - BLOCK
      ?auto_189244 - BLOCK
      ?auto_189245 - BLOCK
    )
    :vars
    (
      ?auto_189246 - BLOCK
      ?auto_189247 - BLOCK
      ?auto_189248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189246 ?auto_189245 ) ( ON-TABLE ?auto_189240 ) ( ON ?auto_189241 ?auto_189240 ) ( ON ?auto_189242 ?auto_189241 ) ( ON ?auto_189243 ?auto_189242 ) ( ON ?auto_189244 ?auto_189243 ) ( ON ?auto_189245 ?auto_189244 ) ( not ( = ?auto_189240 ?auto_189241 ) ) ( not ( = ?auto_189240 ?auto_189242 ) ) ( not ( = ?auto_189240 ?auto_189243 ) ) ( not ( = ?auto_189240 ?auto_189244 ) ) ( not ( = ?auto_189240 ?auto_189245 ) ) ( not ( = ?auto_189240 ?auto_189246 ) ) ( not ( = ?auto_189241 ?auto_189242 ) ) ( not ( = ?auto_189241 ?auto_189243 ) ) ( not ( = ?auto_189241 ?auto_189244 ) ) ( not ( = ?auto_189241 ?auto_189245 ) ) ( not ( = ?auto_189241 ?auto_189246 ) ) ( not ( = ?auto_189242 ?auto_189243 ) ) ( not ( = ?auto_189242 ?auto_189244 ) ) ( not ( = ?auto_189242 ?auto_189245 ) ) ( not ( = ?auto_189242 ?auto_189246 ) ) ( not ( = ?auto_189243 ?auto_189244 ) ) ( not ( = ?auto_189243 ?auto_189245 ) ) ( not ( = ?auto_189243 ?auto_189246 ) ) ( not ( = ?auto_189244 ?auto_189245 ) ) ( not ( = ?auto_189244 ?auto_189246 ) ) ( not ( = ?auto_189245 ?auto_189246 ) ) ( not ( = ?auto_189240 ?auto_189247 ) ) ( not ( = ?auto_189241 ?auto_189247 ) ) ( not ( = ?auto_189242 ?auto_189247 ) ) ( not ( = ?auto_189243 ?auto_189247 ) ) ( not ( = ?auto_189244 ?auto_189247 ) ) ( not ( = ?auto_189245 ?auto_189247 ) ) ( not ( = ?auto_189246 ?auto_189247 ) ) ( CLEAR ?auto_189246 ) ( ON ?auto_189247 ?auto_189248 ) ( CLEAR ?auto_189247 ) ( HAND-EMPTY ) ( not ( = ?auto_189240 ?auto_189248 ) ) ( not ( = ?auto_189241 ?auto_189248 ) ) ( not ( = ?auto_189242 ?auto_189248 ) ) ( not ( = ?auto_189243 ?auto_189248 ) ) ( not ( = ?auto_189244 ?auto_189248 ) ) ( not ( = ?auto_189245 ?auto_189248 ) ) ( not ( = ?auto_189246 ?auto_189248 ) ) ( not ( = ?auto_189247 ?auto_189248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189247 ?auto_189248 )
      ( MAKE-6PILE ?auto_189240 ?auto_189241 ?auto_189242 ?auto_189243 ?auto_189244 ?auto_189245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189267 - BLOCK
      ?auto_189268 - BLOCK
      ?auto_189269 - BLOCK
      ?auto_189270 - BLOCK
      ?auto_189271 - BLOCK
      ?auto_189272 - BLOCK
    )
    :vars
    (
      ?auto_189273 - BLOCK
      ?auto_189275 - BLOCK
      ?auto_189274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189267 ) ( ON ?auto_189268 ?auto_189267 ) ( ON ?auto_189269 ?auto_189268 ) ( ON ?auto_189270 ?auto_189269 ) ( ON ?auto_189271 ?auto_189270 ) ( not ( = ?auto_189267 ?auto_189268 ) ) ( not ( = ?auto_189267 ?auto_189269 ) ) ( not ( = ?auto_189267 ?auto_189270 ) ) ( not ( = ?auto_189267 ?auto_189271 ) ) ( not ( = ?auto_189267 ?auto_189272 ) ) ( not ( = ?auto_189267 ?auto_189273 ) ) ( not ( = ?auto_189268 ?auto_189269 ) ) ( not ( = ?auto_189268 ?auto_189270 ) ) ( not ( = ?auto_189268 ?auto_189271 ) ) ( not ( = ?auto_189268 ?auto_189272 ) ) ( not ( = ?auto_189268 ?auto_189273 ) ) ( not ( = ?auto_189269 ?auto_189270 ) ) ( not ( = ?auto_189269 ?auto_189271 ) ) ( not ( = ?auto_189269 ?auto_189272 ) ) ( not ( = ?auto_189269 ?auto_189273 ) ) ( not ( = ?auto_189270 ?auto_189271 ) ) ( not ( = ?auto_189270 ?auto_189272 ) ) ( not ( = ?auto_189270 ?auto_189273 ) ) ( not ( = ?auto_189271 ?auto_189272 ) ) ( not ( = ?auto_189271 ?auto_189273 ) ) ( not ( = ?auto_189272 ?auto_189273 ) ) ( not ( = ?auto_189267 ?auto_189275 ) ) ( not ( = ?auto_189268 ?auto_189275 ) ) ( not ( = ?auto_189269 ?auto_189275 ) ) ( not ( = ?auto_189270 ?auto_189275 ) ) ( not ( = ?auto_189271 ?auto_189275 ) ) ( not ( = ?auto_189272 ?auto_189275 ) ) ( not ( = ?auto_189273 ?auto_189275 ) ) ( ON ?auto_189275 ?auto_189274 ) ( not ( = ?auto_189267 ?auto_189274 ) ) ( not ( = ?auto_189268 ?auto_189274 ) ) ( not ( = ?auto_189269 ?auto_189274 ) ) ( not ( = ?auto_189270 ?auto_189274 ) ) ( not ( = ?auto_189271 ?auto_189274 ) ) ( not ( = ?auto_189272 ?auto_189274 ) ) ( not ( = ?auto_189273 ?auto_189274 ) ) ( not ( = ?auto_189275 ?auto_189274 ) ) ( ON ?auto_189273 ?auto_189275 ) ( CLEAR ?auto_189273 ) ( HOLDING ?auto_189272 ) ( CLEAR ?auto_189271 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189267 ?auto_189268 ?auto_189269 ?auto_189270 ?auto_189271 ?auto_189272 ?auto_189273 )
      ( MAKE-6PILE ?auto_189267 ?auto_189268 ?auto_189269 ?auto_189270 ?auto_189271 ?auto_189272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189276 - BLOCK
      ?auto_189277 - BLOCK
      ?auto_189278 - BLOCK
      ?auto_189279 - BLOCK
      ?auto_189280 - BLOCK
      ?auto_189281 - BLOCK
    )
    :vars
    (
      ?auto_189282 - BLOCK
      ?auto_189283 - BLOCK
      ?auto_189284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189276 ) ( ON ?auto_189277 ?auto_189276 ) ( ON ?auto_189278 ?auto_189277 ) ( ON ?auto_189279 ?auto_189278 ) ( ON ?auto_189280 ?auto_189279 ) ( not ( = ?auto_189276 ?auto_189277 ) ) ( not ( = ?auto_189276 ?auto_189278 ) ) ( not ( = ?auto_189276 ?auto_189279 ) ) ( not ( = ?auto_189276 ?auto_189280 ) ) ( not ( = ?auto_189276 ?auto_189281 ) ) ( not ( = ?auto_189276 ?auto_189282 ) ) ( not ( = ?auto_189277 ?auto_189278 ) ) ( not ( = ?auto_189277 ?auto_189279 ) ) ( not ( = ?auto_189277 ?auto_189280 ) ) ( not ( = ?auto_189277 ?auto_189281 ) ) ( not ( = ?auto_189277 ?auto_189282 ) ) ( not ( = ?auto_189278 ?auto_189279 ) ) ( not ( = ?auto_189278 ?auto_189280 ) ) ( not ( = ?auto_189278 ?auto_189281 ) ) ( not ( = ?auto_189278 ?auto_189282 ) ) ( not ( = ?auto_189279 ?auto_189280 ) ) ( not ( = ?auto_189279 ?auto_189281 ) ) ( not ( = ?auto_189279 ?auto_189282 ) ) ( not ( = ?auto_189280 ?auto_189281 ) ) ( not ( = ?auto_189280 ?auto_189282 ) ) ( not ( = ?auto_189281 ?auto_189282 ) ) ( not ( = ?auto_189276 ?auto_189283 ) ) ( not ( = ?auto_189277 ?auto_189283 ) ) ( not ( = ?auto_189278 ?auto_189283 ) ) ( not ( = ?auto_189279 ?auto_189283 ) ) ( not ( = ?auto_189280 ?auto_189283 ) ) ( not ( = ?auto_189281 ?auto_189283 ) ) ( not ( = ?auto_189282 ?auto_189283 ) ) ( ON ?auto_189283 ?auto_189284 ) ( not ( = ?auto_189276 ?auto_189284 ) ) ( not ( = ?auto_189277 ?auto_189284 ) ) ( not ( = ?auto_189278 ?auto_189284 ) ) ( not ( = ?auto_189279 ?auto_189284 ) ) ( not ( = ?auto_189280 ?auto_189284 ) ) ( not ( = ?auto_189281 ?auto_189284 ) ) ( not ( = ?auto_189282 ?auto_189284 ) ) ( not ( = ?auto_189283 ?auto_189284 ) ) ( ON ?auto_189282 ?auto_189283 ) ( CLEAR ?auto_189280 ) ( ON ?auto_189281 ?auto_189282 ) ( CLEAR ?auto_189281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189284 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189284 ?auto_189283 ?auto_189282 )
      ( MAKE-6PILE ?auto_189276 ?auto_189277 ?auto_189278 ?auto_189279 ?auto_189280 ?auto_189281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189285 - BLOCK
      ?auto_189286 - BLOCK
      ?auto_189287 - BLOCK
      ?auto_189288 - BLOCK
      ?auto_189289 - BLOCK
      ?auto_189290 - BLOCK
    )
    :vars
    (
      ?auto_189291 - BLOCK
      ?auto_189292 - BLOCK
      ?auto_189293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189285 ) ( ON ?auto_189286 ?auto_189285 ) ( ON ?auto_189287 ?auto_189286 ) ( ON ?auto_189288 ?auto_189287 ) ( not ( = ?auto_189285 ?auto_189286 ) ) ( not ( = ?auto_189285 ?auto_189287 ) ) ( not ( = ?auto_189285 ?auto_189288 ) ) ( not ( = ?auto_189285 ?auto_189289 ) ) ( not ( = ?auto_189285 ?auto_189290 ) ) ( not ( = ?auto_189285 ?auto_189291 ) ) ( not ( = ?auto_189286 ?auto_189287 ) ) ( not ( = ?auto_189286 ?auto_189288 ) ) ( not ( = ?auto_189286 ?auto_189289 ) ) ( not ( = ?auto_189286 ?auto_189290 ) ) ( not ( = ?auto_189286 ?auto_189291 ) ) ( not ( = ?auto_189287 ?auto_189288 ) ) ( not ( = ?auto_189287 ?auto_189289 ) ) ( not ( = ?auto_189287 ?auto_189290 ) ) ( not ( = ?auto_189287 ?auto_189291 ) ) ( not ( = ?auto_189288 ?auto_189289 ) ) ( not ( = ?auto_189288 ?auto_189290 ) ) ( not ( = ?auto_189288 ?auto_189291 ) ) ( not ( = ?auto_189289 ?auto_189290 ) ) ( not ( = ?auto_189289 ?auto_189291 ) ) ( not ( = ?auto_189290 ?auto_189291 ) ) ( not ( = ?auto_189285 ?auto_189292 ) ) ( not ( = ?auto_189286 ?auto_189292 ) ) ( not ( = ?auto_189287 ?auto_189292 ) ) ( not ( = ?auto_189288 ?auto_189292 ) ) ( not ( = ?auto_189289 ?auto_189292 ) ) ( not ( = ?auto_189290 ?auto_189292 ) ) ( not ( = ?auto_189291 ?auto_189292 ) ) ( ON ?auto_189292 ?auto_189293 ) ( not ( = ?auto_189285 ?auto_189293 ) ) ( not ( = ?auto_189286 ?auto_189293 ) ) ( not ( = ?auto_189287 ?auto_189293 ) ) ( not ( = ?auto_189288 ?auto_189293 ) ) ( not ( = ?auto_189289 ?auto_189293 ) ) ( not ( = ?auto_189290 ?auto_189293 ) ) ( not ( = ?auto_189291 ?auto_189293 ) ) ( not ( = ?auto_189292 ?auto_189293 ) ) ( ON ?auto_189291 ?auto_189292 ) ( ON ?auto_189290 ?auto_189291 ) ( CLEAR ?auto_189290 ) ( ON-TABLE ?auto_189293 ) ( HOLDING ?auto_189289 ) ( CLEAR ?auto_189288 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189285 ?auto_189286 ?auto_189287 ?auto_189288 ?auto_189289 )
      ( MAKE-6PILE ?auto_189285 ?auto_189286 ?auto_189287 ?auto_189288 ?auto_189289 ?auto_189290 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189294 - BLOCK
      ?auto_189295 - BLOCK
      ?auto_189296 - BLOCK
      ?auto_189297 - BLOCK
      ?auto_189298 - BLOCK
      ?auto_189299 - BLOCK
    )
    :vars
    (
      ?auto_189301 - BLOCK
      ?auto_189302 - BLOCK
      ?auto_189300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189294 ) ( ON ?auto_189295 ?auto_189294 ) ( ON ?auto_189296 ?auto_189295 ) ( ON ?auto_189297 ?auto_189296 ) ( not ( = ?auto_189294 ?auto_189295 ) ) ( not ( = ?auto_189294 ?auto_189296 ) ) ( not ( = ?auto_189294 ?auto_189297 ) ) ( not ( = ?auto_189294 ?auto_189298 ) ) ( not ( = ?auto_189294 ?auto_189299 ) ) ( not ( = ?auto_189294 ?auto_189301 ) ) ( not ( = ?auto_189295 ?auto_189296 ) ) ( not ( = ?auto_189295 ?auto_189297 ) ) ( not ( = ?auto_189295 ?auto_189298 ) ) ( not ( = ?auto_189295 ?auto_189299 ) ) ( not ( = ?auto_189295 ?auto_189301 ) ) ( not ( = ?auto_189296 ?auto_189297 ) ) ( not ( = ?auto_189296 ?auto_189298 ) ) ( not ( = ?auto_189296 ?auto_189299 ) ) ( not ( = ?auto_189296 ?auto_189301 ) ) ( not ( = ?auto_189297 ?auto_189298 ) ) ( not ( = ?auto_189297 ?auto_189299 ) ) ( not ( = ?auto_189297 ?auto_189301 ) ) ( not ( = ?auto_189298 ?auto_189299 ) ) ( not ( = ?auto_189298 ?auto_189301 ) ) ( not ( = ?auto_189299 ?auto_189301 ) ) ( not ( = ?auto_189294 ?auto_189302 ) ) ( not ( = ?auto_189295 ?auto_189302 ) ) ( not ( = ?auto_189296 ?auto_189302 ) ) ( not ( = ?auto_189297 ?auto_189302 ) ) ( not ( = ?auto_189298 ?auto_189302 ) ) ( not ( = ?auto_189299 ?auto_189302 ) ) ( not ( = ?auto_189301 ?auto_189302 ) ) ( ON ?auto_189302 ?auto_189300 ) ( not ( = ?auto_189294 ?auto_189300 ) ) ( not ( = ?auto_189295 ?auto_189300 ) ) ( not ( = ?auto_189296 ?auto_189300 ) ) ( not ( = ?auto_189297 ?auto_189300 ) ) ( not ( = ?auto_189298 ?auto_189300 ) ) ( not ( = ?auto_189299 ?auto_189300 ) ) ( not ( = ?auto_189301 ?auto_189300 ) ) ( not ( = ?auto_189302 ?auto_189300 ) ) ( ON ?auto_189301 ?auto_189302 ) ( ON ?auto_189299 ?auto_189301 ) ( ON-TABLE ?auto_189300 ) ( CLEAR ?auto_189297 ) ( ON ?auto_189298 ?auto_189299 ) ( CLEAR ?auto_189298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189300 ?auto_189302 ?auto_189301 ?auto_189299 )
      ( MAKE-6PILE ?auto_189294 ?auto_189295 ?auto_189296 ?auto_189297 ?auto_189298 ?auto_189299 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189303 - BLOCK
      ?auto_189304 - BLOCK
      ?auto_189305 - BLOCK
      ?auto_189306 - BLOCK
      ?auto_189307 - BLOCK
      ?auto_189308 - BLOCK
    )
    :vars
    (
      ?auto_189311 - BLOCK
      ?auto_189309 - BLOCK
      ?auto_189310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189303 ) ( ON ?auto_189304 ?auto_189303 ) ( ON ?auto_189305 ?auto_189304 ) ( not ( = ?auto_189303 ?auto_189304 ) ) ( not ( = ?auto_189303 ?auto_189305 ) ) ( not ( = ?auto_189303 ?auto_189306 ) ) ( not ( = ?auto_189303 ?auto_189307 ) ) ( not ( = ?auto_189303 ?auto_189308 ) ) ( not ( = ?auto_189303 ?auto_189311 ) ) ( not ( = ?auto_189304 ?auto_189305 ) ) ( not ( = ?auto_189304 ?auto_189306 ) ) ( not ( = ?auto_189304 ?auto_189307 ) ) ( not ( = ?auto_189304 ?auto_189308 ) ) ( not ( = ?auto_189304 ?auto_189311 ) ) ( not ( = ?auto_189305 ?auto_189306 ) ) ( not ( = ?auto_189305 ?auto_189307 ) ) ( not ( = ?auto_189305 ?auto_189308 ) ) ( not ( = ?auto_189305 ?auto_189311 ) ) ( not ( = ?auto_189306 ?auto_189307 ) ) ( not ( = ?auto_189306 ?auto_189308 ) ) ( not ( = ?auto_189306 ?auto_189311 ) ) ( not ( = ?auto_189307 ?auto_189308 ) ) ( not ( = ?auto_189307 ?auto_189311 ) ) ( not ( = ?auto_189308 ?auto_189311 ) ) ( not ( = ?auto_189303 ?auto_189309 ) ) ( not ( = ?auto_189304 ?auto_189309 ) ) ( not ( = ?auto_189305 ?auto_189309 ) ) ( not ( = ?auto_189306 ?auto_189309 ) ) ( not ( = ?auto_189307 ?auto_189309 ) ) ( not ( = ?auto_189308 ?auto_189309 ) ) ( not ( = ?auto_189311 ?auto_189309 ) ) ( ON ?auto_189309 ?auto_189310 ) ( not ( = ?auto_189303 ?auto_189310 ) ) ( not ( = ?auto_189304 ?auto_189310 ) ) ( not ( = ?auto_189305 ?auto_189310 ) ) ( not ( = ?auto_189306 ?auto_189310 ) ) ( not ( = ?auto_189307 ?auto_189310 ) ) ( not ( = ?auto_189308 ?auto_189310 ) ) ( not ( = ?auto_189311 ?auto_189310 ) ) ( not ( = ?auto_189309 ?auto_189310 ) ) ( ON ?auto_189311 ?auto_189309 ) ( ON ?auto_189308 ?auto_189311 ) ( ON-TABLE ?auto_189310 ) ( ON ?auto_189307 ?auto_189308 ) ( CLEAR ?auto_189307 ) ( HOLDING ?auto_189306 ) ( CLEAR ?auto_189305 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189303 ?auto_189304 ?auto_189305 ?auto_189306 )
      ( MAKE-6PILE ?auto_189303 ?auto_189304 ?auto_189305 ?auto_189306 ?auto_189307 ?auto_189308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189312 - BLOCK
      ?auto_189313 - BLOCK
      ?auto_189314 - BLOCK
      ?auto_189315 - BLOCK
      ?auto_189316 - BLOCK
      ?auto_189317 - BLOCK
    )
    :vars
    (
      ?auto_189320 - BLOCK
      ?auto_189319 - BLOCK
      ?auto_189318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189312 ) ( ON ?auto_189313 ?auto_189312 ) ( ON ?auto_189314 ?auto_189313 ) ( not ( = ?auto_189312 ?auto_189313 ) ) ( not ( = ?auto_189312 ?auto_189314 ) ) ( not ( = ?auto_189312 ?auto_189315 ) ) ( not ( = ?auto_189312 ?auto_189316 ) ) ( not ( = ?auto_189312 ?auto_189317 ) ) ( not ( = ?auto_189312 ?auto_189320 ) ) ( not ( = ?auto_189313 ?auto_189314 ) ) ( not ( = ?auto_189313 ?auto_189315 ) ) ( not ( = ?auto_189313 ?auto_189316 ) ) ( not ( = ?auto_189313 ?auto_189317 ) ) ( not ( = ?auto_189313 ?auto_189320 ) ) ( not ( = ?auto_189314 ?auto_189315 ) ) ( not ( = ?auto_189314 ?auto_189316 ) ) ( not ( = ?auto_189314 ?auto_189317 ) ) ( not ( = ?auto_189314 ?auto_189320 ) ) ( not ( = ?auto_189315 ?auto_189316 ) ) ( not ( = ?auto_189315 ?auto_189317 ) ) ( not ( = ?auto_189315 ?auto_189320 ) ) ( not ( = ?auto_189316 ?auto_189317 ) ) ( not ( = ?auto_189316 ?auto_189320 ) ) ( not ( = ?auto_189317 ?auto_189320 ) ) ( not ( = ?auto_189312 ?auto_189319 ) ) ( not ( = ?auto_189313 ?auto_189319 ) ) ( not ( = ?auto_189314 ?auto_189319 ) ) ( not ( = ?auto_189315 ?auto_189319 ) ) ( not ( = ?auto_189316 ?auto_189319 ) ) ( not ( = ?auto_189317 ?auto_189319 ) ) ( not ( = ?auto_189320 ?auto_189319 ) ) ( ON ?auto_189319 ?auto_189318 ) ( not ( = ?auto_189312 ?auto_189318 ) ) ( not ( = ?auto_189313 ?auto_189318 ) ) ( not ( = ?auto_189314 ?auto_189318 ) ) ( not ( = ?auto_189315 ?auto_189318 ) ) ( not ( = ?auto_189316 ?auto_189318 ) ) ( not ( = ?auto_189317 ?auto_189318 ) ) ( not ( = ?auto_189320 ?auto_189318 ) ) ( not ( = ?auto_189319 ?auto_189318 ) ) ( ON ?auto_189320 ?auto_189319 ) ( ON ?auto_189317 ?auto_189320 ) ( ON-TABLE ?auto_189318 ) ( ON ?auto_189316 ?auto_189317 ) ( CLEAR ?auto_189314 ) ( ON ?auto_189315 ?auto_189316 ) ( CLEAR ?auto_189315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189318 ?auto_189319 ?auto_189320 ?auto_189317 ?auto_189316 )
      ( MAKE-6PILE ?auto_189312 ?auto_189313 ?auto_189314 ?auto_189315 ?auto_189316 ?auto_189317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189321 - BLOCK
      ?auto_189322 - BLOCK
      ?auto_189323 - BLOCK
      ?auto_189324 - BLOCK
      ?auto_189325 - BLOCK
      ?auto_189326 - BLOCK
    )
    :vars
    (
      ?auto_189327 - BLOCK
      ?auto_189328 - BLOCK
      ?auto_189329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189321 ) ( ON ?auto_189322 ?auto_189321 ) ( not ( = ?auto_189321 ?auto_189322 ) ) ( not ( = ?auto_189321 ?auto_189323 ) ) ( not ( = ?auto_189321 ?auto_189324 ) ) ( not ( = ?auto_189321 ?auto_189325 ) ) ( not ( = ?auto_189321 ?auto_189326 ) ) ( not ( = ?auto_189321 ?auto_189327 ) ) ( not ( = ?auto_189322 ?auto_189323 ) ) ( not ( = ?auto_189322 ?auto_189324 ) ) ( not ( = ?auto_189322 ?auto_189325 ) ) ( not ( = ?auto_189322 ?auto_189326 ) ) ( not ( = ?auto_189322 ?auto_189327 ) ) ( not ( = ?auto_189323 ?auto_189324 ) ) ( not ( = ?auto_189323 ?auto_189325 ) ) ( not ( = ?auto_189323 ?auto_189326 ) ) ( not ( = ?auto_189323 ?auto_189327 ) ) ( not ( = ?auto_189324 ?auto_189325 ) ) ( not ( = ?auto_189324 ?auto_189326 ) ) ( not ( = ?auto_189324 ?auto_189327 ) ) ( not ( = ?auto_189325 ?auto_189326 ) ) ( not ( = ?auto_189325 ?auto_189327 ) ) ( not ( = ?auto_189326 ?auto_189327 ) ) ( not ( = ?auto_189321 ?auto_189328 ) ) ( not ( = ?auto_189322 ?auto_189328 ) ) ( not ( = ?auto_189323 ?auto_189328 ) ) ( not ( = ?auto_189324 ?auto_189328 ) ) ( not ( = ?auto_189325 ?auto_189328 ) ) ( not ( = ?auto_189326 ?auto_189328 ) ) ( not ( = ?auto_189327 ?auto_189328 ) ) ( ON ?auto_189328 ?auto_189329 ) ( not ( = ?auto_189321 ?auto_189329 ) ) ( not ( = ?auto_189322 ?auto_189329 ) ) ( not ( = ?auto_189323 ?auto_189329 ) ) ( not ( = ?auto_189324 ?auto_189329 ) ) ( not ( = ?auto_189325 ?auto_189329 ) ) ( not ( = ?auto_189326 ?auto_189329 ) ) ( not ( = ?auto_189327 ?auto_189329 ) ) ( not ( = ?auto_189328 ?auto_189329 ) ) ( ON ?auto_189327 ?auto_189328 ) ( ON ?auto_189326 ?auto_189327 ) ( ON-TABLE ?auto_189329 ) ( ON ?auto_189325 ?auto_189326 ) ( ON ?auto_189324 ?auto_189325 ) ( CLEAR ?auto_189324 ) ( HOLDING ?auto_189323 ) ( CLEAR ?auto_189322 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189321 ?auto_189322 ?auto_189323 )
      ( MAKE-6PILE ?auto_189321 ?auto_189322 ?auto_189323 ?auto_189324 ?auto_189325 ?auto_189326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189330 - BLOCK
      ?auto_189331 - BLOCK
      ?auto_189332 - BLOCK
      ?auto_189333 - BLOCK
      ?auto_189334 - BLOCK
      ?auto_189335 - BLOCK
    )
    :vars
    (
      ?auto_189338 - BLOCK
      ?auto_189336 - BLOCK
      ?auto_189337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189330 ) ( ON ?auto_189331 ?auto_189330 ) ( not ( = ?auto_189330 ?auto_189331 ) ) ( not ( = ?auto_189330 ?auto_189332 ) ) ( not ( = ?auto_189330 ?auto_189333 ) ) ( not ( = ?auto_189330 ?auto_189334 ) ) ( not ( = ?auto_189330 ?auto_189335 ) ) ( not ( = ?auto_189330 ?auto_189338 ) ) ( not ( = ?auto_189331 ?auto_189332 ) ) ( not ( = ?auto_189331 ?auto_189333 ) ) ( not ( = ?auto_189331 ?auto_189334 ) ) ( not ( = ?auto_189331 ?auto_189335 ) ) ( not ( = ?auto_189331 ?auto_189338 ) ) ( not ( = ?auto_189332 ?auto_189333 ) ) ( not ( = ?auto_189332 ?auto_189334 ) ) ( not ( = ?auto_189332 ?auto_189335 ) ) ( not ( = ?auto_189332 ?auto_189338 ) ) ( not ( = ?auto_189333 ?auto_189334 ) ) ( not ( = ?auto_189333 ?auto_189335 ) ) ( not ( = ?auto_189333 ?auto_189338 ) ) ( not ( = ?auto_189334 ?auto_189335 ) ) ( not ( = ?auto_189334 ?auto_189338 ) ) ( not ( = ?auto_189335 ?auto_189338 ) ) ( not ( = ?auto_189330 ?auto_189336 ) ) ( not ( = ?auto_189331 ?auto_189336 ) ) ( not ( = ?auto_189332 ?auto_189336 ) ) ( not ( = ?auto_189333 ?auto_189336 ) ) ( not ( = ?auto_189334 ?auto_189336 ) ) ( not ( = ?auto_189335 ?auto_189336 ) ) ( not ( = ?auto_189338 ?auto_189336 ) ) ( ON ?auto_189336 ?auto_189337 ) ( not ( = ?auto_189330 ?auto_189337 ) ) ( not ( = ?auto_189331 ?auto_189337 ) ) ( not ( = ?auto_189332 ?auto_189337 ) ) ( not ( = ?auto_189333 ?auto_189337 ) ) ( not ( = ?auto_189334 ?auto_189337 ) ) ( not ( = ?auto_189335 ?auto_189337 ) ) ( not ( = ?auto_189338 ?auto_189337 ) ) ( not ( = ?auto_189336 ?auto_189337 ) ) ( ON ?auto_189338 ?auto_189336 ) ( ON ?auto_189335 ?auto_189338 ) ( ON-TABLE ?auto_189337 ) ( ON ?auto_189334 ?auto_189335 ) ( ON ?auto_189333 ?auto_189334 ) ( CLEAR ?auto_189331 ) ( ON ?auto_189332 ?auto_189333 ) ( CLEAR ?auto_189332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189337 ?auto_189336 ?auto_189338 ?auto_189335 ?auto_189334 ?auto_189333 )
      ( MAKE-6PILE ?auto_189330 ?auto_189331 ?auto_189332 ?auto_189333 ?auto_189334 ?auto_189335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189339 - BLOCK
      ?auto_189340 - BLOCK
      ?auto_189341 - BLOCK
      ?auto_189342 - BLOCK
      ?auto_189343 - BLOCK
      ?auto_189344 - BLOCK
    )
    :vars
    (
      ?auto_189346 - BLOCK
      ?auto_189345 - BLOCK
      ?auto_189347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189339 ) ( not ( = ?auto_189339 ?auto_189340 ) ) ( not ( = ?auto_189339 ?auto_189341 ) ) ( not ( = ?auto_189339 ?auto_189342 ) ) ( not ( = ?auto_189339 ?auto_189343 ) ) ( not ( = ?auto_189339 ?auto_189344 ) ) ( not ( = ?auto_189339 ?auto_189346 ) ) ( not ( = ?auto_189340 ?auto_189341 ) ) ( not ( = ?auto_189340 ?auto_189342 ) ) ( not ( = ?auto_189340 ?auto_189343 ) ) ( not ( = ?auto_189340 ?auto_189344 ) ) ( not ( = ?auto_189340 ?auto_189346 ) ) ( not ( = ?auto_189341 ?auto_189342 ) ) ( not ( = ?auto_189341 ?auto_189343 ) ) ( not ( = ?auto_189341 ?auto_189344 ) ) ( not ( = ?auto_189341 ?auto_189346 ) ) ( not ( = ?auto_189342 ?auto_189343 ) ) ( not ( = ?auto_189342 ?auto_189344 ) ) ( not ( = ?auto_189342 ?auto_189346 ) ) ( not ( = ?auto_189343 ?auto_189344 ) ) ( not ( = ?auto_189343 ?auto_189346 ) ) ( not ( = ?auto_189344 ?auto_189346 ) ) ( not ( = ?auto_189339 ?auto_189345 ) ) ( not ( = ?auto_189340 ?auto_189345 ) ) ( not ( = ?auto_189341 ?auto_189345 ) ) ( not ( = ?auto_189342 ?auto_189345 ) ) ( not ( = ?auto_189343 ?auto_189345 ) ) ( not ( = ?auto_189344 ?auto_189345 ) ) ( not ( = ?auto_189346 ?auto_189345 ) ) ( ON ?auto_189345 ?auto_189347 ) ( not ( = ?auto_189339 ?auto_189347 ) ) ( not ( = ?auto_189340 ?auto_189347 ) ) ( not ( = ?auto_189341 ?auto_189347 ) ) ( not ( = ?auto_189342 ?auto_189347 ) ) ( not ( = ?auto_189343 ?auto_189347 ) ) ( not ( = ?auto_189344 ?auto_189347 ) ) ( not ( = ?auto_189346 ?auto_189347 ) ) ( not ( = ?auto_189345 ?auto_189347 ) ) ( ON ?auto_189346 ?auto_189345 ) ( ON ?auto_189344 ?auto_189346 ) ( ON-TABLE ?auto_189347 ) ( ON ?auto_189343 ?auto_189344 ) ( ON ?auto_189342 ?auto_189343 ) ( ON ?auto_189341 ?auto_189342 ) ( CLEAR ?auto_189341 ) ( HOLDING ?auto_189340 ) ( CLEAR ?auto_189339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189339 ?auto_189340 )
      ( MAKE-6PILE ?auto_189339 ?auto_189340 ?auto_189341 ?auto_189342 ?auto_189343 ?auto_189344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189348 - BLOCK
      ?auto_189349 - BLOCK
      ?auto_189350 - BLOCK
      ?auto_189351 - BLOCK
      ?auto_189352 - BLOCK
      ?auto_189353 - BLOCK
    )
    :vars
    (
      ?auto_189356 - BLOCK
      ?auto_189354 - BLOCK
      ?auto_189355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189348 ) ( not ( = ?auto_189348 ?auto_189349 ) ) ( not ( = ?auto_189348 ?auto_189350 ) ) ( not ( = ?auto_189348 ?auto_189351 ) ) ( not ( = ?auto_189348 ?auto_189352 ) ) ( not ( = ?auto_189348 ?auto_189353 ) ) ( not ( = ?auto_189348 ?auto_189356 ) ) ( not ( = ?auto_189349 ?auto_189350 ) ) ( not ( = ?auto_189349 ?auto_189351 ) ) ( not ( = ?auto_189349 ?auto_189352 ) ) ( not ( = ?auto_189349 ?auto_189353 ) ) ( not ( = ?auto_189349 ?auto_189356 ) ) ( not ( = ?auto_189350 ?auto_189351 ) ) ( not ( = ?auto_189350 ?auto_189352 ) ) ( not ( = ?auto_189350 ?auto_189353 ) ) ( not ( = ?auto_189350 ?auto_189356 ) ) ( not ( = ?auto_189351 ?auto_189352 ) ) ( not ( = ?auto_189351 ?auto_189353 ) ) ( not ( = ?auto_189351 ?auto_189356 ) ) ( not ( = ?auto_189352 ?auto_189353 ) ) ( not ( = ?auto_189352 ?auto_189356 ) ) ( not ( = ?auto_189353 ?auto_189356 ) ) ( not ( = ?auto_189348 ?auto_189354 ) ) ( not ( = ?auto_189349 ?auto_189354 ) ) ( not ( = ?auto_189350 ?auto_189354 ) ) ( not ( = ?auto_189351 ?auto_189354 ) ) ( not ( = ?auto_189352 ?auto_189354 ) ) ( not ( = ?auto_189353 ?auto_189354 ) ) ( not ( = ?auto_189356 ?auto_189354 ) ) ( ON ?auto_189354 ?auto_189355 ) ( not ( = ?auto_189348 ?auto_189355 ) ) ( not ( = ?auto_189349 ?auto_189355 ) ) ( not ( = ?auto_189350 ?auto_189355 ) ) ( not ( = ?auto_189351 ?auto_189355 ) ) ( not ( = ?auto_189352 ?auto_189355 ) ) ( not ( = ?auto_189353 ?auto_189355 ) ) ( not ( = ?auto_189356 ?auto_189355 ) ) ( not ( = ?auto_189354 ?auto_189355 ) ) ( ON ?auto_189356 ?auto_189354 ) ( ON ?auto_189353 ?auto_189356 ) ( ON-TABLE ?auto_189355 ) ( ON ?auto_189352 ?auto_189353 ) ( ON ?auto_189351 ?auto_189352 ) ( ON ?auto_189350 ?auto_189351 ) ( CLEAR ?auto_189348 ) ( ON ?auto_189349 ?auto_189350 ) ( CLEAR ?auto_189349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189355 ?auto_189354 ?auto_189356 ?auto_189353 ?auto_189352 ?auto_189351 ?auto_189350 )
      ( MAKE-6PILE ?auto_189348 ?auto_189349 ?auto_189350 ?auto_189351 ?auto_189352 ?auto_189353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189357 - BLOCK
      ?auto_189358 - BLOCK
      ?auto_189359 - BLOCK
      ?auto_189360 - BLOCK
      ?auto_189361 - BLOCK
      ?auto_189362 - BLOCK
    )
    :vars
    (
      ?auto_189365 - BLOCK
      ?auto_189363 - BLOCK
      ?auto_189364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189357 ?auto_189358 ) ) ( not ( = ?auto_189357 ?auto_189359 ) ) ( not ( = ?auto_189357 ?auto_189360 ) ) ( not ( = ?auto_189357 ?auto_189361 ) ) ( not ( = ?auto_189357 ?auto_189362 ) ) ( not ( = ?auto_189357 ?auto_189365 ) ) ( not ( = ?auto_189358 ?auto_189359 ) ) ( not ( = ?auto_189358 ?auto_189360 ) ) ( not ( = ?auto_189358 ?auto_189361 ) ) ( not ( = ?auto_189358 ?auto_189362 ) ) ( not ( = ?auto_189358 ?auto_189365 ) ) ( not ( = ?auto_189359 ?auto_189360 ) ) ( not ( = ?auto_189359 ?auto_189361 ) ) ( not ( = ?auto_189359 ?auto_189362 ) ) ( not ( = ?auto_189359 ?auto_189365 ) ) ( not ( = ?auto_189360 ?auto_189361 ) ) ( not ( = ?auto_189360 ?auto_189362 ) ) ( not ( = ?auto_189360 ?auto_189365 ) ) ( not ( = ?auto_189361 ?auto_189362 ) ) ( not ( = ?auto_189361 ?auto_189365 ) ) ( not ( = ?auto_189362 ?auto_189365 ) ) ( not ( = ?auto_189357 ?auto_189363 ) ) ( not ( = ?auto_189358 ?auto_189363 ) ) ( not ( = ?auto_189359 ?auto_189363 ) ) ( not ( = ?auto_189360 ?auto_189363 ) ) ( not ( = ?auto_189361 ?auto_189363 ) ) ( not ( = ?auto_189362 ?auto_189363 ) ) ( not ( = ?auto_189365 ?auto_189363 ) ) ( ON ?auto_189363 ?auto_189364 ) ( not ( = ?auto_189357 ?auto_189364 ) ) ( not ( = ?auto_189358 ?auto_189364 ) ) ( not ( = ?auto_189359 ?auto_189364 ) ) ( not ( = ?auto_189360 ?auto_189364 ) ) ( not ( = ?auto_189361 ?auto_189364 ) ) ( not ( = ?auto_189362 ?auto_189364 ) ) ( not ( = ?auto_189365 ?auto_189364 ) ) ( not ( = ?auto_189363 ?auto_189364 ) ) ( ON ?auto_189365 ?auto_189363 ) ( ON ?auto_189362 ?auto_189365 ) ( ON-TABLE ?auto_189364 ) ( ON ?auto_189361 ?auto_189362 ) ( ON ?auto_189360 ?auto_189361 ) ( ON ?auto_189359 ?auto_189360 ) ( ON ?auto_189358 ?auto_189359 ) ( CLEAR ?auto_189358 ) ( HOLDING ?auto_189357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189357 )
      ( MAKE-6PILE ?auto_189357 ?auto_189358 ?auto_189359 ?auto_189360 ?auto_189361 ?auto_189362 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189366 - BLOCK
      ?auto_189367 - BLOCK
      ?auto_189368 - BLOCK
      ?auto_189369 - BLOCK
      ?auto_189370 - BLOCK
      ?auto_189371 - BLOCK
    )
    :vars
    (
      ?auto_189373 - BLOCK
      ?auto_189374 - BLOCK
      ?auto_189372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189366 ?auto_189367 ) ) ( not ( = ?auto_189366 ?auto_189368 ) ) ( not ( = ?auto_189366 ?auto_189369 ) ) ( not ( = ?auto_189366 ?auto_189370 ) ) ( not ( = ?auto_189366 ?auto_189371 ) ) ( not ( = ?auto_189366 ?auto_189373 ) ) ( not ( = ?auto_189367 ?auto_189368 ) ) ( not ( = ?auto_189367 ?auto_189369 ) ) ( not ( = ?auto_189367 ?auto_189370 ) ) ( not ( = ?auto_189367 ?auto_189371 ) ) ( not ( = ?auto_189367 ?auto_189373 ) ) ( not ( = ?auto_189368 ?auto_189369 ) ) ( not ( = ?auto_189368 ?auto_189370 ) ) ( not ( = ?auto_189368 ?auto_189371 ) ) ( not ( = ?auto_189368 ?auto_189373 ) ) ( not ( = ?auto_189369 ?auto_189370 ) ) ( not ( = ?auto_189369 ?auto_189371 ) ) ( not ( = ?auto_189369 ?auto_189373 ) ) ( not ( = ?auto_189370 ?auto_189371 ) ) ( not ( = ?auto_189370 ?auto_189373 ) ) ( not ( = ?auto_189371 ?auto_189373 ) ) ( not ( = ?auto_189366 ?auto_189374 ) ) ( not ( = ?auto_189367 ?auto_189374 ) ) ( not ( = ?auto_189368 ?auto_189374 ) ) ( not ( = ?auto_189369 ?auto_189374 ) ) ( not ( = ?auto_189370 ?auto_189374 ) ) ( not ( = ?auto_189371 ?auto_189374 ) ) ( not ( = ?auto_189373 ?auto_189374 ) ) ( ON ?auto_189374 ?auto_189372 ) ( not ( = ?auto_189366 ?auto_189372 ) ) ( not ( = ?auto_189367 ?auto_189372 ) ) ( not ( = ?auto_189368 ?auto_189372 ) ) ( not ( = ?auto_189369 ?auto_189372 ) ) ( not ( = ?auto_189370 ?auto_189372 ) ) ( not ( = ?auto_189371 ?auto_189372 ) ) ( not ( = ?auto_189373 ?auto_189372 ) ) ( not ( = ?auto_189374 ?auto_189372 ) ) ( ON ?auto_189373 ?auto_189374 ) ( ON ?auto_189371 ?auto_189373 ) ( ON-TABLE ?auto_189372 ) ( ON ?auto_189370 ?auto_189371 ) ( ON ?auto_189369 ?auto_189370 ) ( ON ?auto_189368 ?auto_189369 ) ( ON ?auto_189367 ?auto_189368 ) ( ON ?auto_189366 ?auto_189367 ) ( CLEAR ?auto_189366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189372 ?auto_189374 ?auto_189373 ?auto_189371 ?auto_189370 ?auto_189369 ?auto_189368 ?auto_189367 )
      ( MAKE-6PILE ?auto_189366 ?auto_189367 ?auto_189368 ?auto_189369 ?auto_189370 ?auto_189371 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189377 - BLOCK
      ?auto_189378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_189378 ) ( CLEAR ?auto_189377 ) ( ON-TABLE ?auto_189377 ) ( not ( = ?auto_189377 ?auto_189378 ) ) )
    :subtasks
    ( ( !STACK ?auto_189378 ?auto_189377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189379 - BLOCK
      ?auto_189380 - BLOCK
    )
    :vars
    (
      ?auto_189381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189379 ) ( ON-TABLE ?auto_189379 ) ( not ( = ?auto_189379 ?auto_189380 ) ) ( ON ?auto_189380 ?auto_189381 ) ( CLEAR ?auto_189380 ) ( HAND-EMPTY ) ( not ( = ?auto_189379 ?auto_189381 ) ) ( not ( = ?auto_189380 ?auto_189381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189380 ?auto_189381 )
      ( MAKE-2PILE ?auto_189379 ?auto_189380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189382 - BLOCK
      ?auto_189383 - BLOCK
    )
    :vars
    (
      ?auto_189384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189382 ?auto_189383 ) ) ( ON ?auto_189383 ?auto_189384 ) ( CLEAR ?auto_189383 ) ( not ( = ?auto_189382 ?auto_189384 ) ) ( not ( = ?auto_189383 ?auto_189384 ) ) ( HOLDING ?auto_189382 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189382 )
      ( MAKE-2PILE ?auto_189382 ?auto_189383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189385 - BLOCK
      ?auto_189386 - BLOCK
    )
    :vars
    (
      ?auto_189387 - BLOCK
      ?auto_189392 - BLOCK
      ?auto_189391 - BLOCK
      ?auto_189389 - BLOCK
      ?auto_189390 - BLOCK
      ?auto_189388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189385 ?auto_189386 ) ) ( ON ?auto_189386 ?auto_189387 ) ( not ( = ?auto_189385 ?auto_189387 ) ) ( not ( = ?auto_189386 ?auto_189387 ) ) ( ON ?auto_189385 ?auto_189386 ) ( CLEAR ?auto_189385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189392 ) ( ON ?auto_189391 ?auto_189392 ) ( ON ?auto_189389 ?auto_189391 ) ( ON ?auto_189390 ?auto_189389 ) ( ON ?auto_189388 ?auto_189390 ) ( ON ?auto_189387 ?auto_189388 ) ( not ( = ?auto_189392 ?auto_189391 ) ) ( not ( = ?auto_189392 ?auto_189389 ) ) ( not ( = ?auto_189392 ?auto_189390 ) ) ( not ( = ?auto_189392 ?auto_189388 ) ) ( not ( = ?auto_189392 ?auto_189387 ) ) ( not ( = ?auto_189392 ?auto_189386 ) ) ( not ( = ?auto_189392 ?auto_189385 ) ) ( not ( = ?auto_189391 ?auto_189389 ) ) ( not ( = ?auto_189391 ?auto_189390 ) ) ( not ( = ?auto_189391 ?auto_189388 ) ) ( not ( = ?auto_189391 ?auto_189387 ) ) ( not ( = ?auto_189391 ?auto_189386 ) ) ( not ( = ?auto_189391 ?auto_189385 ) ) ( not ( = ?auto_189389 ?auto_189390 ) ) ( not ( = ?auto_189389 ?auto_189388 ) ) ( not ( = ?auto_189389 ?auto_189387 ) ) ( not ( = ?auto_189389 ?auto_189386 ) ) ( not ( = ?auto_189389 ?auto_189385 ) ) ( not ( = ?auto_189390 ?auto_189388 ) ) ( not ( = ?auto_189390 ?auto_189387 ) ) ( not ( = ?auto_189390 ?auto_189386 ) ) ( not ( = ?auto_189390 ?auto_189385 ) ) ( not ( = ?auto_189388 ?auto_189387 ) ) ( not ( = ?auto_189388 ?auto_189386 ) ) ( not ( = ?auto_189388 ?auto_189385 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189392 ?auto_189391 ?auto_189389 ?auto_189390 ?auto_189388 ?auto_189387 ?auto_189386 )
      ( MAKE-2PILE ?auto_189385 ?auto_189386 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189393 - BLOCK
      ?auto_189394 - BLOCK
    )
    :vars
    (
      ?auto_189396 - BLOCK
      ?auto_189397 - BLOCK
      ?auto_189400 - BLOCK
      ?auto_189399 - BLOCK
      ?auto_189398 - BLOCK
      ?auto_189395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189393 ?auto_189394 ) ) ( ON ?auto_189394 ?auto_189396 ) ( not ( = ?auto_189393 ?auto_189396 ) ) ( not ( = ?auto_189394 ?auto_189396 ) ) ( ON-TABLE ?auto_189397 ) ( ON ?auto_189400 ?auto_189397 ) ( ON ?auto_189399 ?auto_189400 ) ( ON ?auto_189398 ?auto_189399 ) ( ON ?auto_189395 ?auto_189398 ) ( ON ?auto_189396 ?auto_189395 ) ( not ( = ?auto_189397 ?auto_189400 ) ) ( not ( = ?auto_189397 ?auto_189399 ) ) ( not ( = ?auto_189397 ?auto_189398 ) ) ( not ( = ?auto_189397 ?auto_189395 ) ) ( not ( = ?auto_189397 ?auto_189396 ) ) ( not ( = ?auto_189397 ?auto_189394 ) ) ( not ( = ?auto_189397 ?auto_189393 ) ) ( not ( = ?auto_189400 ?auto_189399 ) ) ( not ( = ?auto_189400 ?auto_189398 ) ) ( not ( = ?auto_189400 ?auto_189395 ) ) ( not ( = ?auto_189400 ?auto_189396 ) ) ( not ( = ?auto_189400 ?auto_189394 ) ) ( not ( = ?auto_189400 ?auto_189393 ) ) ( not ( = ?auto_189399 ?auto_189398 ) ) ( not ( = ?auto_189399 ?auto_189395 ) ) ( not ( = ?auto_189399 ?auto_189396 ) ) ( not ( = ?auto_189399 ?auto_189394 ) ) ( not ( = ?auto_189399 ?auto_189393 ) ) ( not ( = ?auto_189398 ?auto_189395 ) ) ( not ( = ?auto_189398 ?auto_189396 ) ) ( not ( = ?auto_189398 ?auto_189394 ) ) ( not ( = ?auto_189398 ?auto_189393 ) ) ( not ( = ?auto_189395 ?auto_189396 ) ) ( not ( = ?auto_189395 ?auto_189394 ) ) ( not ( = ?auto_189395 ?auto_189393 ) ) ( HOLDING ?auto_189393 ) ( CLEAR ?auto_189394 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189397 ?auto_189400 ?auto_189399 ?auto_189398 ?auto_189395 ?auto_189396 ?auto_189394 ?auto_189393 )
      ( MAKE-2PILE ?auto_189393 ?auto_189394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189401 - BLOCK
      ?auto_189402 - BLOCK
    )
    :vars
    (
      ?auto_189407 - BLOCK
      ?auto_189408 - BLOCK
      ?auto_189405 - BLOCK
      ?auto_189403 - BLOCK
      ?auto_189406 - BLOCK
      ?auto_189404 - BLOCK
      ?auto_189409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189401 ?auto_189402 ) ) ( ON ?auto_189402 ?auto_189407 ) ( not ( = ?auto_189401 ?auto_189407 ) ) ( not ( = ?auto_189402 ?auto_189407 ) ) ( ON-TABLE ?auto_189408 ) ( ON ?auto_189405 ?auto_189408 ) ( ON ?auto_189403 ?auto_189405 ) ( ON ?auto_189406 ?auto_189403 ) ( ON ?auto_189404 ?auto_189406 ) ( ON ?auto_189407 ?auto_189404 ) ( not ( = ?auto_189408 ?auto_189405 ) ) ( not ( = ?auto_189408 ?auto_189403 ) ) ( not ( = ?auto_189408 ?auto_189406 ) ) ( not ( = ?auto_189408 ?auto_189404 ) ) ( not ( = ?auto_189408 ?auto_189407 ) ) ( not ( = ?auto_189408 ?auto_189402 ) ) ( not ( = ?auto_189408 ?auto_189401 ) ) ( not ( = ?auto_189405 ?auto_189403 ) ) ( not ( = ?auto_189405 ?auto_189406 ) ) ( not ( = ?auto_189405 ?auto_189404 ) ) ( not ( = ?auto_189405 ?auto_189407 ) ) ( not ( = ?auto_189405 ?auto_189402 ) ) ( not ( = ?auto_189405 ?auto_189401 ) ) ( not ( = ?auto_189403 ?auto_189406 ) ) ( not ( = ?auto_189403 ?auto_189404 ) ) ( not ( = ?auto_189403 ?auto_189407 ) ) ( not ( = ?auto_189403 ?auto_189402 ) ) ( not ( = ?auto_189403 ?auto_189401 ) ) ( not ( = ?auto_189406 ?auto_189404 ) ) ( not ( = ?auto_189406 ?auto_189407 ) ) ( not ( = ?auto_189406 ?auto_189402 ) ) ( not ( = ?auto_189406 ?auto_189401 ) ) ( not ( = ?auto_189404 ?auto_189407 ) ) ( not ( = ?auto_189404 ?auto_189402 ) ) ( not ( = ?auto_189404 ?auto_189401 ) ) ( CLEAR ?auto_189402 ) ( ON ?auto_189401 ?auto_189409 ) ( CLEAR ?auto_189401 ) ( HAND-EMPTY ) ( not ( = ?auto_189401 ?auto_189409 ) ) ( not ( = ?auto_189402 ?auto_189409 ) ) ( not ( = ?auto_189407 ?auto_189409 ) ) ( not ( = ?auto_189408 ?auto_189409 ) ) ( not ( = ?auto_189405 ?auto_189409 ) ) ( not ( = ?auto_189403 ?auto_189409 ) ) ( not ( = ?auto_189406 ?auto_189409 ) ) ( not ( = ?auto_189404 ?auto_189409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189401 ?auto_189409 )
      ( MAKE-2PILE ?auto_189401 ?auto_189402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189410 - BLOCK
      ?auto_189411 - BLOCK
    )
    :vars
    (
      ?auto_189417 - BLOCK
      ?auto_189414 - BLOCK
      ?auto_189412 - BLOCK
      ?auto_189416 - BLOCK
      ?auto_189418 - BLOCK
      ?auto_189413 - BLOCK
      ?auto_189415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189410 ?auto_189411 ) ) ( not ( = ?auto_189410 ?auto_189417 ) ) ( not ( = ?auto_189411 ?auto_189417 ) ) ( ON-TABLE ?auto_189414 ) ( ON ?auto_189412 ?auto_189414 ) ( ON ?auto_189416 ?auto_189412 ) ( ON ?auto_189418 ?auto_189416 ) ( ON ?auto_189413 ?auto_189418 ) ( ON ?auto_189417 ?auto_189413 ) ( not ( = ?auto_189414 ?auto_189412 ) ) ( not ( = ?auto_189414 ?auto_189416 ) ) ( not ( = ?auto_189414 ?auto_189418 ) ) ( not ( = ?auto_189414 ?auto_189413 ) ) ( not ( = ?auto_189414 ?auto_189417 ) ) ( not ( = ?auto_189414 ?auto_189411 ) ) ( not ( = ?auto_189414 ?auto_189410 ) ) ( not ( = ?auto_189412 ?auto_189416 ) ) ( not ( = ?auto_189412 ?auto_189418 ) ) ( not ( = ?auto_189412 ?auto_189413 ) ) ( not ( = ?auto_189412 ?auto_189417 ) ) ( not ( = ?auto_189412 ?auto_189411 ) ) ( not ( = ?auto_189412 ?auto_189410 ) ) ( not ( = ?auto_189416 ?auto_189418 ) ) ( not ( = ?auto_189416 ?auto_189413 ) ) ( not ( = ?auto_189416 ?auto_189417 ) ) ( not ( = ?auto_189416 ?auto_189411 ) ) ( not ( = ?auto_189416 ?auto_189410 ) ) ( not ( = ?auto_189418 ?auto_189413 ) ) ( not ( = ?auto_189418 ?auto_189417 ) ) ( not ( = ?auto_189418 ?auto_189411 ) ) ( not ( = ?auto_189418 ?auto_189410 ) ) ( not ( = ?auto_189413 ?auto_189417 ) ) ( not ( = ?auto_189413 ?auto_189411 ) ) ( not ( = ?auto_189413 ?auto_189410 ) ) ( ON ?auto_189410 ?auto_189415 ) ( CLEAR ?auto_189410 ) ( not ( = ?auto_189410 ?auto_189415 ) ) ( not ( = ?auto_189411 ?auto_189415 ) ) ( not ( = ?auto_189417 ?auto_189415 ) ) ( not ( = ?auto_189414 ?auto_189415 ) ) ( not ( = ?auto_189412 ?auto_189415 ) ) ( not ( = ?auto_189416 ?auto_189415 ) ) ( not ( = ?auto_189418 ?auto_189415 ) ) ( not ( = ?auto_189413 ?auto_189415 ) ) ( HOLDING ?auto_189411 ) ( CLEAR ?auto_189417 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189414 ?auto_189412 ?auto_189416 ?auto_189418 ?auto_189413 ?auto_189417 ?auto_189411 )
      ( MAKE-2PILE ?auto_189410 ?auto_189411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189419 - BLOCK
      ?auto_189420 - BLOCK
    )
    :vars
    (
      ?auto_189421 - BLOCK
      ?auto_189422 - BLOCK
      ?auto_189425 - BLOCK
      ?auto_189427 - BLOCK
      ?auto_189423 - BLOCK
      ?auto_189424 - BLOCK
      ?auto_189426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189419 ?auto_189420 ) ) ( not ( = ?auto_189419 ?auto_189421 ) ) ( not ( = ?auto_189420 ?auto_189421 ) ) ( ON-TABLE ?auto_189422 ) ( ON ?auto_189425 ?auto_189422 ) ( ON ?auto_189427 ?auto_189425 ) ( ON ?auto_189423 ?auto_189427 ) ( ON ?auto_189424 ?auto_189423 ) ( ON ?auto_189421 ?auto_189424 ) ( not ( = ?auto_189422 ?auto_189425 ) ) ( not ( = ?auto_189422 ?auto_189427 ) ) ( not ( = ?auto_189422 ?auto_189423 ) ) ( not ( = ?auto_189422 ?auto_189424 ) ) ( not ( = ?auto_189422 ?auto_189421 ) ) ( not ( = ?auto_189422 ?auto_189420 ) ) ( not ( = ?auto_189422 ?auto_189419 ) ) ( not ( = ?auto_189425 ?auto_189427 ) ) ( not ( = ?auto_189425 ?auto_189423 ) ) ( not ( = ?auto_189425 ?auto_189424 ) ) ( not ( = ?auto_189425 ?auto_189421 ) ) ( not ( = ?auto_189425 ?auto_189420 ) ) ( not ( = ?auto_189425 ?auto_189419 ) ) ( not ( = ?auto_189427 ?auto_189423 ) ) ( not ( = ?auto_189427 ?auto_189424 ) ) ( not ( = ?auto_189427 ?auto_189421 ) ) ( not ( = ?auto_189427 ?auto_189420 ) ) ( not ( = ?auto_189427 ?auto_189419 ) ) ( not ( = ?auto_189423 ?auto_189424 ) ) ( not ( = ?auto_189423 ?auto_189421 ) ) ( not ( = ?auto_189423 ?auto_189420 ) ) ( not ( = ?auto_189423 ?auto_189419 ) ) ( not ( = ?auto_189424 ?auto_189421 ) ) ( not ( = ?auto_189424 ?auto_189420 ) ) ( not ( = ?auto_189424 ?auto_189419 ) ) ( ON ?auto_189419 ?auto_189426 ) ( not ( = ?auto_189419 ?auto_189426 ) ) ( not ( = ?auto_189420 ?auto_189426 ) ) ( not ( = ?auto_189421 ?auto_189426 ) ) ( not ( = ?auto_189422 ?auto_189426 ) ) ( not ( = ?auto_189425 ?auto_189426 ) ) ( not ( = ?auto_189427 ?auto_189426 ) ) ( not ( = ?auto_189423 ?auto_189426 ) ) ( not ( = ?auto_189424 ?auto_189426 ) ) ( CLEAR ?auto_189421 ) ( ON ?auto_189420 ?auto_189419 ) ( CLEAR ?auto_189420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189426 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189426 ?auto_189419 )
      ( MAKE-2PILE ?auto_189419 ?auto_189420 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189428 - BLOCK
      ?auto_189429 - BLOCK
    )
    :vars
    (
      ?auto_189436 - BLOCK
      ?auto_189431 - BLOCK
      ?auto_189435 - BLOCK
      ?auto_189434 - BLOCK
      ?auto_189433 - BLOCK
      ?auto_189432 - BLOCK
      ?auto_189430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189428 ?auto_189429 ) ) ( not ( = ?auto_189428 ?auto_189436 ) ) ( not ( = ?auto_189429 ?auto_189436 ) ) ( ON-TABLE ?auto_189431 ) ( ON ?auto_189435 ?auto_189431 ) ( ON ?auto_189434 ?auto_189435 ) ( ON ?auto_189433 ?auto_189434 ) ( ON ?auto_189432 ?auto_189433 ) ( not ( = ?auto_189431 ?auto_189435 ) ) ( not ( = ?auto_189431 ?auto_189434 ) ) ( not ( = ?auto_189431 ?auto_189433 ) ) ( not ( = ?auto_189431 ?auto_189432 ) ) ( not ( = ?auto_189431 ?auto_189436 ) ) ( not ( = ?auto_189431 ?auto_189429 ) ) ( not ( = ?auto_189431 ?auto_189428 ) ) ( not ( = ?auto_189435 ?auto_189434 ) ) ( not ( = ?auto_189435 ?auto_189433 ) ) ( not ( = ?auto_189435 ?auto_189432 ) ) ( not ( = ?auto_189435 ?auto_189436 ) ) ( not ( = ?auto_189435 ?auto_189429 ) ) ( not ( = ?auto_189435 ?auto_189428 ) ) ( not ( = ?auto_189434 ?auto_189433 ) ) ( not ( = ?auto_189434 ?auto_189432 ) ) ( not ( = ?auto_189434 ?auto_189436 ) ) ( not ( = ?auto_189434 ?auto_189429 ) ) ( not ( = ?auto_189434 ?auto_189428 ) ) ( not ( = ?auto_189433 ?auto_189432 ) ) ( not ( = ?auto_189433 ?auto_189436 ) ) ( not ( = ?auto_189433 ?auto_189429 ) ) ( not ( = ?auto_189433 ?auto_189428 ) ) ( not ( = ?auto_189432 ?auto_189436 ) ) ( not ( = ?auto_189432 ?auto_189429 ) ) ( not ( = ?auto_189432 ?auto_189428 ) ) ( ON ?auto_189428 ?auto_189430 ) ( not ( = ?auto_189428 ?auto_189430 ) ) ( not ( = ?auto_189429 ?auto_189430 ) ) ( not ( = ?auto_189436 ?auto_189430 ) ) ( not ( = ?auto_189431 ?auto_189430 ) ) ( not ( = ?auto_189435 ?auto_189430 ) ) ( not ( = ?auto_189434 ?auto_189430 ) ) ( not ( = ?auto_189433 ?auto_189430 ) ) ( not ( = ?auto_189432 ?auto_189430 ) ) ( ON ?auto_189429 ?auto_189428 ) ( CLEAR ?auto_189429 ) ( ON-TABLE ?auto_189430 ) ( HOLDING ?auto_189436 ) ( CLEAR ?auto_189432 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189431 ?auto_189435 ?auto_189434 ?auto_189433 ?auto_189432 ?auto_189436 )
      ( MAKE-2PILE ?auto_189428 ?auto_189429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189437 - BLOCK
      ?auto_189438 - BLOCK
    )
    :vars
    (
      ?auto_189439 - BLOCK
      ?auto_189441 - BLOCK
      ?auto_189444 - BLOCK
      ?auto_189443 - BLOCK
      ?auto_189440 - BLOCK
      ?auto_189445 - BLOCK
      ?auto_189442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189437 ?auto_189438 ) ) ( not ( = ?auto_189437 ?auto_189439 ) ) ( not ( = ?auto_189438 ?auto_189439 ) ) ( ON-TABLE ?auto_189441 ) ( ON ?auto_189444 ?auto_189441 ) ( ON ?auto_189443 ?auto_189444 ) ( ON ?auto_189440 ?auto_189443 ) ( ON ?auto_189445 ?auto_189440 ) ( not ( = ?auto_189441 ?auto_189444 ) ) ( not ( = ?auto_189441 ?auto_189443 ) ) ( not ( = ?auto_189441 ?auto_189440 ) ) ( not ( = ?auto_189441 ?auto_189445 ) ) ( not ( = ?auto_189441 ?auto_189439 ) ) ( not ( = ?auto_189441 ?auto_189438 ) ) ( not ( = ?auto_189441 ?auto_189437 ) ) ( not ( = ?auto_189444 ?auto_189443 ) ) ( not ( = ?auto_189444 ?auto_189440 ) ) ( not ( = ?auto_189444 ?auto_189445 ) ) ( not ( = ?auto_189444 ?auto_189439 ) ) ( not ( = ?auto_189444 ?auto_189438 ) ) ( not ( = ?auto_189444 ?auto_189437 ) ) ( not ( = ?auto_189443 ?auto_189440 ) ) ( not ( = ?auto_189443 ?auto_189445 ) ) ( not ( = ?auto_189443 ?auto_189439 ) ) ( not ( = ?auto_189443 ?auto_189438 ) ) ( not ( = ?auto_189443 ?auto_189437 ) ) ( not ( = ?auto_189440 ?auto_189445 ) ) ( not ( = ?auto_189440 ?auto_189439 ) ) ( not ( = ?auto_189440 ?auto_189438 ) ) ( not ( = ?auto_189440 ?auto_189437 ) ) ( not ( = ?auto_189445 ?auto_189439 ) ) ( not ( = ?auto_189445 ?auto_189438 ) ) ( not ( = ?auto_189445 ?auto_189437 ) ) ( ON ?auto_189437 ?auto_189442 ) ( not ( = ?auto_189437 ?auto_189442 ) ) ( not ( = ?auto_189438 ?auto_189442 ) ) ( not ( = ?auto_189439 ?auto_189442 ) ) ( not ( = ?auto_189441 ?auto_189442 ) ) ( not ( = ?auto_189444 ?auto_189442 ) ) ( not ( = ?auto_189443 ?auto_189442 ) ) ( not ( = ?auto_189440 ?auto_189442 ) ) ( not ( = ?auto_189445 ?auto_189442 ) ) ( ON ?auto_189438 ?auto_189437 ) ( ON-TABLE ?auto_189442 ) ( CLEAR ?auto_189445 ) ( ON ?auto_189439 ?auto_189438 ) ( CLEAR ?auto_189439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189442 ?auto_189437 ?auto_189438 )
      ( MAKE-2PILE ?auto_189437 ?auto_189438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189446 - BLOCK
      ?auto_189447 - BLOCK
    )
    :vars
    (
      ?auto_189450 - BLOCK
      ?auto_189451 - BLOCK
      ?auto_189452 - BLOCK
      ?auto_189448 - BLOCK
      ?auto_189454 - BLOCK
      ?auto_189449 - BLOCK
      ?auto_189453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189446 ?auto_189447 ) ) ( not ( = ?auto_189446 ?auto_189450 ) ) ( not ( = ?auto_189447 ?auto_189450 ) ) ( ON-TABLE ?auto_189451 ) ( ON ?auto_189452 ?auto_189451 ) ( ON ?auto_189448 ?auto_189452 ) ( ON ?auto_189454 ?auto_189448 ) ( not ( = ?auto_189451 ?auto_189452 ) ) ( not ( = ?auto_189451 ?auto_189448 ) ) ( not ( = ?auto_189451 ?auto_189454 ) ) ( not ( = ?auto_189451 ?auto_189449 ) ) ( not ( = ?auto_189451 ?auto_189450 ) ) ( not ( = ?auto_189451 ?auto_189447 ) ) ( not ( = ?auto_189451 ?auto_189446 ) ) ( not ( = ?auto_189452 ?auto_189448 ) ) ( not ( = ?auto_189452 ?auto_189454 ) ) ( not ( = ?auto_189452 ?auto_189449 ) ) ( not ( = ?auto_189452 ?auto_189450 ) ) ( not ( = ?auto_189452 ?auto_189447 ) ) ( not ( = ?auto_189452 ?auto_189446 ) ) ( not ( = ?auto_189448 ?auto_189454 ) ) ( not ( = ?auto_189448 ?auto_189449 ) ) ( not ( = ?auto_189448 ?auto_189450 ) ) ( not ( = ?auto_189448 ?auto_189447 ) ) ( not ( = ?auto_189448 ?auto_189446 ) ) ( not ( = ?auto_189454 ?auto_189449 ) ) ( not ( = ?auto_189454 ?auto_189450 ) ) ( not ( = ?auto_189454 ?auto_189447 ) ) ( not ( = ?auto_189454 ?auto_189446 ) ) ( not ( = ?auto_189449 ?auto_189450 ) ) ( not ( = ?auto_189449 ?auto_189447 ) ) ( not ( = ?auto_189449 ?auto_189446 ) ) ( ON ?auto_189446 ?auto_189453 ) ( not ( = ?auto_189446 ?auto_189453 ) ) ( not ( = ?auto_189447 ?auto_189453 ) ) ( not ( = ?auto_189450 ?auto_189453 ) ) ( not ( = ?auto_189451 ?auto_189453 ) ) ( not ( = ?auto_189452 ?auto_189453 ) ) ( not ( = ?auto_189448 ?auto_189453 ) ) ( not ( = ?auto_189454 ?auto_189453 ) ) ( not ( = ?auto_189449 ?auto_189453 ) ) ( ON ?auto_189447 ?auto_189446 ) ( ON-TABLE ?auto_189453 ) ( ON ?auto_189450 ?auto_189447 ) ( CLEAR ?auto_189450 ) ( HOLDING ?auto_189449 ) ( CLEAR ?auto_189454 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189451 ?auto_189452 ?auto_189448 ?auto_189454 ?auto_189449 )
      ( MAKE-2PILE ?auto_189446 ?auto_189447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189455 - BLOCK
      ?auto_189456 - BLOCK
    )
    :vars
    (
      ?auto_189457 - BLOCK
      ?auto_189462 - BLOCK
      ?auto_189459 - BLOCK
      ?auto_189458 - BLOCK
      ?auto_189460 - BLOCK
      ?auto_189461 - BLOCK
      ?auto_189463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189455 ?auto_189456 ) ) ( not ( = ?auto_189455 ?auto_189457 ) ) ( not ( = ?auto_189456 ?auto_189457 ) ) ( ON-TABLE ?auto_189462 ) ( ON ?auto_189459 ?auto_189462 ) ( ON ?auto_189458 ?auto_189459 ) ( ON ?auto_189460 ?auto_189458 ) ( not ( = ?auto_189462 ?auto_189459 ) ) ( not ( = ?auto_189462 ?auto_189458 ) ) ( not ( = ?auto_189462 ?auto_189460 ) ) ( not ( = ?auto_189462 ?auto_189461 ) ) ( not ( = ?auto_189462 ?auto_189457 ) ) ( not ( = ?auto_189462 ?auto_189456 ) ) ( not ( = ?auto_189462 ?auto_189455 ) ) ( not ( = ?auto_189459 ?auto_189458 ) ) ( not ( = ?auto_189459 ?auto_189460 ) ) ( not ( = ?auto_189459 ?auto_189461 ) ) ( not ( = ?auto_189459 ?auto_189457 ) ) ( not ( = ?auto_189459 ?auto_189456 ) ) ( not ( = ?auto_189459 ?auto_189455 ) ) ( not ( = ?auto_189458 ?auto_189460 ) ) ( not ( = ?auto_189458 ?auto_189461 ) ) ( not ( = ?auto_189458 ?auto_189457 ) ) ( not ( = ?auto_189458 ?auto_189456 ) ) ( not ( = ?auto_189458 ?auto_189455 ) ) ( not ( = ?auto_189460 ?auto_189461 ) ) ( not ( = ?auto_189460 ?auto_189457 ) ) ( not ( = ?auto_189460 ?auto_189456 ) ) ( not ( = ?auto_189460 ?auto_189455 ) ) ( not ( = ?auto_189461 ?auto_189457 ) ) ( not ( = ?auto_189461 ?auto_189456 ) ) ( not ( = ?auto_189461 ?auto_189455 ) ) ( ON ?auto_189455 ?auto_189463 ) ( not ( = ?auto_189455 ?auto_189463 ) ) ( not ( = ?auto_189456 ?auto_189463 ) ) ( not ( = ?auto_189457 ?auto_189463 ) ) ( not ( = ?auto_189462 ?auto_189463 ) ) ( not ( = ?auto_189459 ?auto_189463 ) ) ( not ( = ?auto_189458 ?auto_189463 ) ) ( not ( = ?auto_189460 ?auto_189463 ) ) ( not ( = ?auto_189461 ?auto_189463 ) ) ( ON ?auto_189456 ?auto_189455 ) ( ON-TABLE ?auto_189463 ) ( ON ?auto_189457 ?auto_189456 ) ( CLEAR ?auto_189460 ) ( ON ?auto_189461 ?auto_189457 ) ( CLEAR ?auto_189461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189463 ?auto_189455 ?auto_189456 ?auto_189457 )
      ( MAKE-2PILE ?auto_189455 ?auto_189456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189464 - BLOCK
      ?auto_189465 - BLOCK
    )
    :vars
    (
      ?auto_189469 - BLOCK
      ?auto_189468 - BLOCK
      ?auto_189472 - BLOCK
      ?auto_189467 - BLOCK
      ?auto_189471 - BLOCK
      ?auto_189466 - BLOCK
      ?auto_189470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189464 ?auto_189465 ) ) ( not ( = ?auto_189464 ?auto_189469 ) ) ( not ( = ?auto_189465 ?auto_189469 ) ) ( ON-TABLE ?auto_189468 ) ( ON ?auto_189472 ?auto_189468 ) ( ON ?auto_189467 ?auto_189472 ) ( not ( = ?auto_189468 ?auto_189472 ) ) ( not ( = ?auto_189468 ?auto_189467 ) ) ( not ( = ?auto_189468 ?auto_189471 ) ) ( not ( = ?auto_189468 ?auto_189466 ) ) ( not ( = ?auto_189468 ?auto_189469 ) ) ( not ( = ?auto_189468 ?auto_189465 ) ) ( not ( = ?auto_189468 ?auto_189464 ) ) ( not ( = ?auto_189472 ?auto_189467 ) ) ( not ( = ?auto_189472 ?auto_189471 ) ) ( not ( = ?auto_189472 ?auto_189466 ) ) ( not ( = ?auto_189472 ?auto_189469 ) ) ( not ( = ?auto_189472 ?auto_189465 ) ) ( not ( = ?auto_189472 ?auto_189464 ) ) ( not ( = ?auto_189467 ?auto_189471 ) ) ( not ( = ?auto_189467 ?auto_189466 ) ) ( not ( = ?auto_189467 ?auto_189469 ) ) ( not ( = ?auto_189467 ?auto_189465 ) ) ( not ( = ?auto_189467 ?auto_189464 ) ) ( not ( = ?auto_189471 ?auto_189466 ) ) ( not ( = ?auto_189471 ?auto_189469 ) ) ( not ( = ?auto_189471 ?auto_189465 ) ) ( not ( = ?auto_189471 ?auto_189464 ) ) ( not ( = ?auto_189466 ?auto_189469 ) ) ( not ( = ?auto_189466 ?auto_189465 ) ) ( not ( = ?auto_189466 ?auto_189464 ) ) ( ON ?auto_189464 ?auto_189470 ) ( not ( = ?auto_189464 ?auto_189470 ) ) ( not ( = ?auto_189465 ?auto_189470 ) ) ( not ( = ?auto_189469 ?auto_189470 ) ) ( not ( = ?auto_189468 ?auto_189470 ) ) ( not ( = ?auto_189472 ?auto_189470 ) ) ( not ( = ?auto_189467 ?auto_189470 ) ) ( not ( = ?auto_189471 ?auto_189470 ) ) ( not ( = ?auto_189466 ?auto_189470 ) ) ( ON ?auto_189465 ?auto_189464 ) ( ON-TABLE ?auto_189470 ) ( ON ?auto_189469 ?auto_189465 ) ( ON ?auto_189466 ?auto_189469 ) ( CLEAR ?auto_189466 ) ( HOLDING ?auto_189471 ) ( CLEAR ?auto_189467 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189468 ?auto_189472 ?auto_189467 ?auto_189471 )
      ( MAKE-2PILE ?auto_189464 ?auto_189465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189473 - BLOCK
      ?auto_189474 - BLOCK
    )
    :vars
    (
      ?auto_189475 - BLOCK
      ?auto_189480 - BLOCK
      ?auto_189476 - BLOCK
      ?auto_189477 - BLOCK
      ?auto_189479 - BLOCK
      ?auto_189481 - BLOCK
      ?auto_189478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189473 ?auto_189474 ) ) ( not ( = ?auto_189473 ?auto_189475 ) ) ( not ( = ?auto_189474 ?auto_189475 ) ) ( ON-TABLE ?auto_189480 ) ( ON ?auto_189476 ?auto_189480 ) ( ON ?auto_189477 ?auto_189476 ) ( not ( = ?auto_189480 ?auto_189476 ) ) ( not ( = ?auto_189480 ?auto_189477 ) ) ( not ( = ?auto_189480 ?auto_189479 ) ) ( not ( = ?auto_189480 ?auto_189481 ) ) ( not ( = ?auto_189480 ?auto_189475 ) ) ( not ( = ?auto_189480 ?auto_189474 ) ) ( not ( = ?auto_189480 ?auto_189473 ) ) ( not ( = ?auto_189476 ?auto_189477 ) ) ( not ( = ?auto_189476 ?auto_189479 ) ) ( not ( = ?auto_189476 ?auto_189481 ) ) ( not ( = ?auto_189476 ?auto_189475 ) ) ( not ( = ?auto_189476 ?auto_189474 ) ) ( not ( = ?auto_189476 ?auto_189473 ) ) ( not ( = ?auto_189477 ?auto_189479 ) ) ( not ( = ?auto_189477 ?auto_189481 ) ) ( not ( = ?auto_189477 ?auto_189475 ) ) ( not ( = ?auto_189477 ?auto_189474 ) ) ( not ( = ?auto_189477 ?auto_189473 ) ) ( not ( = ?auto_189479 ?auto_189481 ) ) ( not ( = ?auto_189479 ?auto_189475 ) ) ( not ( = ?auto_189479 ?auto_189474 ) ) ( not ( = ?auto_189479 ?auto_189473 ) ) ( not ( = ?auto_189481 ?auto_189475 ) ) ( not ( = ?auto_189481 ?auto_189474 ) ) ( not ( = ?auto_189481 ?auto_189473 ) ) ( ON ?auto_189473 ?auto_189478 ) ( not ( = ?auto_189473 ?auto_189478 ) ) ( not ( = ?auto_189474 ?auto_189478 ) ) ( not ( = ?auto_189475 ?auto_189478 ) ) ( not ( = ?auto_189480 ?auto_189478 ) ) ( not ( = ?auto_189476 ?auto_189478 ) ) ( not ( = ?auto_189477 ?auto_189478 ) ) ( not ( = ?auto_189479 ?auto_189478 ) ) ( not ( = ?auto_189481 ?auto_189478 ) ) ( ON ?auto_189474 ?auto_189473 ) ( ON-TABLE ?auto_189478 ) ( ON ?auto_189475 ?auto_189474 ) ( ON ?auto_189481 ?auto_189475 ) ( CLEAR ?auto_189477 ) ( ON ?auto_189479 ?auto_189481 ) ( CLEAR ?auto_189479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189478 ?auto_189473 ?auto_189474 ?auto_189475 ?auto_189481 )
      ( MAKE-2PILE ?auto_189473 ?auto_189474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189482 - BLOCK
      ?auto_189483 - BLOCK
    )
    :vars
    (
      ?auto_189485 - BLOCK
      ?auto_189484 - BLOCK
      ?auto_189488 - BLOCK
      ?auto_189486 - BLOCK
      ?auto_189490 - BLOCK
      ?auto_189489 - BLOCK
      ?auto_189487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189482 ?auto_189483 ) ) ( not ( = ?auto_189482 ?auto_189485 ) ) ( not ( = ?auto_189483 ?auto_189485 ) ) ( ON-TABLE ?auto_189484 ) ( ON ?auto_189488 ?auto_189484 ) ( not ( = ?auto_189484 ?auto_189488 ) ) ( not ( = ?auto_189484 ?auto_189486 ) ) ( not ( = ?auto_189484 ?auto_189490 ) ) ( not ( = ?auto_189484 ?auto_189489 ) ) ( not ( = ?auto_189484 ?auto_189485 ) ) ( not ( = ?auto_189484 ?auto_189483 ) ) ( not ( = ?auto_189484 ?auto_189482 ) ) ( not ( = ?auto_189488 ?auto_189486 ) ) ( not ( = ?auto_189488 ?auto_189490 ) ) ( not ( = ?auto_189488 ?auto_189489 ) ) ( not ( = ?auto_189488 ?auto_189485 ) ) ( not ( = ?auto_189488 ?auto_189483 ) ) ( not ( = ?auto_189488 ?auto_189482 ) ) ( not ( = ?auto_189486 ?auto_189490 ) ) ( not ( = ?auto_189486 ?auto_189489 ) ) ( not ( = ?auto_189486 ?auto_189485 ) ) ( not ( = ?auto_189486 ?auto_189483 ) ) ( not ( = ?auto_189486 ?auto_189482 ) ) ( not ( = ?auto_189490 ?auto_189489 ) ) ( not ( = ?auto_189490 ?auto_189485 ) ) ( not ( = ?auto_189490 ?auto_189483 ) ) ( not ( = ?auto_189490 ?auto_189482 ) ) ( not ( = ?auto_189489 ?auto_189485 ) ) ( not ( = ?auto_189489 ?auto_189483 ) ) ( not ( = ?auto_189489 ?auto_189482 ) ) ( ON ?auto_189482 ?auto_189487 ) ( not ( = ?auto_189482 ?auto_189487 ) ) ( not ( = ?auto_189483 ?auto_189487 ) ) ( not ( = ?auto_189485 ?auto_189487 ) ) ( not ( = ?auto_189484 ?auto_189487 ) ) ( not ( = ?auto_189488 ?auto_189487 ) ) ( not ( = ?auto_189486 ?auto_189487 ) ) ( not ( = ?auto_189490 ?auto_189487 ) ) ( not ( = ?auto_189489 ?auto_189487 ) ) ( ON ?auto_189483 ?auto_189482 ) ( ON-TABLE ?auto_189487 ) ( ON ?auto_189485 ?auto_189483 ) ( ON ?auto_189489 ?auto_189485 ) ( ON ?auto_189490 ?auto_189489 ) ( CLEAR ?auto_189490 ) ( HOLDING ?auto_189486 ) ( CLEAR ?auto_189488 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189484 ?auto_189488 ?auto_189486 )
      ( MAKE-2PILE ?auto_189482 ?auto_189483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189491 - BLOCK
      ?auto_189492 - BLOCK
    )
    :vars
    (
      ?auto_189494 - BLOCK
      ?auto_189499 - BLOCK
      ?auto_189495 - BLOCK
      ?auto_189493 - BLOCK
      ?auto_189497 - BLOCK
      ?auto_189498 - BLOCK
      ?auto_189496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189491 ?auto_189492 ) ) ( not ( = ?auto_189491 ?auto_189494 ) ) ( not ( = ?auto_189492 ?auto_189494 ) ) ( ON-TABLE ?auto_189499 ) ( ON ?auto_189495 ?auto_189499 ) ( not ( = ?auto_189499 ?auto_189495 ) ) ( not ( = ?auto_189499 ?auto_189493 ) ) ( not ( = ?auto_189499 ?auto_189497 ) ) ( not ( = ?auto_189499 ?auto_189498 ) ) ( not ( = ?auto_189499 ?auto_189494 ) ) ( not ( = ?auto_189499 ?auto_189492 ) ) ( not ( = ?auto_189499 ?auto_189491 ) ) ( not ( = ?auto_189495 ?auto_189493 ) ) ( not ( = ?auto_189495 ?auto_189497 ) ) ( not ( = ?auto_189495 ?auto_189498 ) ) ( not ( = ?auto_189495 ?auto_189494 ) ) ( not ( = ?auto_189495 ?auto_189492 ) ) ( not ( = ?auto_189495 ?auto_189491 ) ) ( not ( = ?auto_189493 ?auto_189497 ) ) ( not ( = ?auto_189493 ?auto_189498 ) ) ( not ( = ?auto_189493 ?auto_189494 ) ) ( not ( = ?auto_189493 ?auto_189492 ) ) ( not ( = ?auto_189493 ?auto_189491 ) ) ( not ( = ?auto_189497 ?auto_189498 ) ) ( not ( = ?auto_189497 ?auto_189494 ) ) ( not ( = ?auto_189497 ?auto_189492 ) ) ( not ( = ?auto_189497 ?auto_189491 ) ) ( not ( = ?auto_189498 ?auto_189494 ) ) ( not ( = ?auto_189498 ?auto_189492 ) ) ( not ( = ?auto_189498 ?auto_189491 ) ) ( ON ?auto_189491 ?auto_189496 ) ( not ( = ?auto_189491 ?auto_189496 ) ) ( not ( = ?auto_189492 ?auto_189496 ) ) ( not ( = ?auto_189494 ?auto_189496 ) ) ( not ( = ?auto_189499 ?auto_189496 ) ) ( not ( = ?auto_189495 ?auto_189496 ) ) ( not ( = ?auto_189493 ?auto_189496 ) ) ( not ( = ?auto_189497 ?auto_189496 ) ) ( not ( = ?auto_189498 ?auto_189496 ) ) ( ON ?auto_189492 ?auto_189491 ) ( ON-TABLE ?auto_189496 ) ( ON ?auto_189494 ?auto_189492 ) ( ON ?auto_189498 ?auto_189494 ) ( ON ?auto_189497 ?auto_189498 ) ( CLEAR ?auto_189495 ) ( ON ?auto_189493 ?auto_189497 ) ( CLEAR ?auto_189493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189496 ?auto_189491 ?auto_189492 ?auto_189494 ?auto_189498 ?auto_189497 )
      ( MAKE-2PILE ?auto_189491 ?auto_189492 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189500 - BLOCK
      ?auto_189501 - BLOCK
    )
    :vars
    (
      ?auto_189505 - BLOCK
      ?auto_189508 - BLOCK
      ?auto_189502 - BLOCK
      ?auto_189503 - BLOCK
      ?auto_189504 - BLOCK
      ?auto_189507 - BLOCK
      ?auto_189506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189500 ?auto_189501 ) ) ( not ( = ?auto_189500 ?auto_189505 ) ) ( not ( = ?auto_189501 ?auto_189505 ) ) ( ON-TABLE ?auto_189508 ) ( not ( = ?auto_189508 ?auto_189502 ) ) ( not ( = ?auto_189508 ?auto_189503 ) ) ( not ( = ?auto_189508 ?auto_189504 ) ) ( not ( = ?auto_189508 ?auto_189507 ) ) ( not ( = ?auto_189508 ?auto_189505 ) ) ( not ( = ?auto_189508 ?auto_189501 ) ) ( not ( = ?auto_189508 ?auto_189500 ) ) ( not ( = ?auto_189502 ?auto_189503 ) ) ( not ( = ?auto_189502 ?auto_189504 ) ) ( not ( = ?auto_189502 ?auto_189507 ) ) ( not ( = ?auto_189502 ?auto_189505 ) ) ( not ( = ?auto_189502 ?auto_189501 ) ) ( not ( = ?auto_189502 ?auto_189500 ) ) ( not ( = ?auto_189503 ?auto_189504 ) ) ( not ( = ?auto_189503 ?auto_189507 ) ) ( not ( = ?auto_189503 ?auto_189505 ) ) ( not ( = ?auto_189503 ?auto_189501 ) ) ( not ( = ?auto_189503 ?auto_189500 ) ) ( not ( = ?auto_189504 ?auto_189507 ) ) ( not ( = ?auto_189504 ?auto_189505 ) ) ( not ( = ?auto_189504 ?auto_189501 ) ) ( not ( = ?auto_189504 ?auto_189500 ) ) ( not ( = ?auto_189507 ?auto_189505 ) ) ( not ( = ?auto_189507 ?auto_189501 ) ) ( not ( = ?auto_189507 ?auto_189500 ) ) ( ON ?auto_189500 ?auto_189506 ) ( not ( = ?auto_189500 ?auto_189506 ) ) ( not ( = ?auto_189501 ?auto_189506 ) ) ( not ( = ?auto_189505 ?auto_189506 ) ) ( not ( = ?auto_189508 ?auto_189506 ) ) ( not ( = ?auto_189502 ?auto_189506 ) ) ( not ( = ?auto_189503 ?auto_189506 ) ) ( not ( = ?auto_189504 ?auto_189506 ) ) ( not ( = ?auto_189507 ?auto_189506 ) ) ( ON ?auto_189501 ?auto_189500 ) ( ON-TABLE ?auto_189506 ) ( ON ?auto_189505 ?auto_189501 ) ( ON ?auto_189507 ?auto_189505 ) ( ON ?auto_189504 ?auto_189507 ) ( ON ?auto_189503 ?auto_189504 ) ( CLEAR ?auto_189503 ) ( HOLDING ?auto_189502 ) ( CLEAR ?auto_189508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189508 ?auto_189502 )
      ( MAKE-2PILE ?auto_189500 ?auto_189501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189509 - BLOCK
      ?auto_189510 - BLOCK
    )
    :vars
    (
      ?auto_189516 - BLOCK
      ?auto_189512 - BLOCK
      ?auto_189517 - BLOCK
      ?auto_189515 - BLOCK
      ?auto_189513 - BLOCK
      ?auto_189511 - BLOCK
      ?auto_189514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189509 ?auto_189510 ) ) ( not ( = ?auto_189509 ?auto_189516 ) ) ( not ( = ?auto_189510 ?auto_189516 ) ) ( ON-TABLE ?auto_189512 ) ( not ( = ?auto_189512 ?auto_189517 ) ) ( not ( = ?auto_189512 ?auto_189515 ) ) ( not ( = ?auto_189512 ?auto_189513 ) ) ( not ( = ?auto_189512 ?auto_189511 ) ) ( not ( = ?auto_189512 ?auto_189516 ) ) ( not ( = ?auto_189512 ?auto_189510 ) ) ( not ( = ?auto_189512 ?auto_189509 ) ) ( not ( = ?auto_189517 ?auto_189515 ) ) ( not ( = ?auto_189517 ?auto_189513 ) ) ( not ( = ?auto_189517 ?auto_189511 ) ) ( not ( = ?auto_189517 ?auto_189516 ) ) ( not ( = ?auto_189517 ?auto_189510 ) ) ( not ( = ?auto_189517 ?auto_189509 ) ) ( not ( = ?auto_189515 ?auto_189513 ) ) ( not ( = ?auto_189515 ?auto_189511 ) ) ( not ( = ?auto_189515 ?auto_189516 ) ) ( not ( = ?auto_189515 ?auto_189510 ) ) ( not ( = ?auto_189515 ?auto_189509 ) ) ( not ( = ?auto_189513 ?auto_189511 ) ) ( not ( = ?auto_189513 ?auto_189516 ) ) ( not ( = ?auto_189513 ?auto_189510 ) ) ( not ( = ?auto_189513 ?auto_189509 ) ) ( not ( = ?auto_189511 ?auto_189516 ) ) ( not ( = ?auto_189511 ?auto_189510 ) ) ( not ( = ?auto_189511 ?auto_189509 ) ) ( ON ?auto_189509 ?auto_189514 ) ( not ( = ?auto_189509 ?auto_189514 ) ) ( not ( = ?auto_189510 ?auto_189514 ) ) ( not ( = ?auto_189516 ?auto_189514 ) ) ( not ( = ?auto_189512 ?auto_189514 ) ) ( not ( = ?auto_189517 ?auto_189514 ) ) ( not ( = ?auto_189515 ?auto_189514 ) ) ( not ( = ?auto_189513 ?auto_189514 ) ) ( not ( = ?auto_189511 ?auto_189514 ) ) ( ON ?auto_189510 ?auto_189509 ) ( ON-TABLE ?auto_189514 ) ( ON ?auto_189516 ?auto_189510 ) ( ON ?auto_189511 ?auto_189516 ) ( ON ?auto_189513 ?auto_189511 ) ( ON ?auto_189515 ?auto_189513 ) ( CLEAR ?auto_189512 ) ( ON ?auto_189517 ?auto_189515 ) ( CLEAR ?auto_189517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189514 ?auto_189509 ?auto_189510 ?auto_189516 ?auto_189511 ?auto_189513 ?auto_189515 )
      ( MAKE-2PILE ?auto_189509 ?auto_189510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189518 - BLOCK
      ?auto_189519 - BLOCK
    )
    :vars
    (
      ?auto_189522 - BLOCK
      ?auto_189525 - BLOCK
      ?auto_189526 - BLOCK
      ?auto_189521 - BLOCK
      ?auto_189523 - BLOCK
      ?auto_189520 - BLOCK
      ?auto_189524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189518 ?auto_189519 ) ) ( not ( = ?auto_189518 ?auto_189522 ) ) ( not ( = ?auto_189519 ?auto_189522 ) ) ( not ( = ?auto_189525 ?auto_189526 ) ) ( not ( = ?auto_189525 ?auto_189521 ) ) ( not ( = ?auto_189525 ?auto_189523 ) ) ( not ( = ?auto_189525 ?auto_189520 ) ) ( not ( = ?auto_189525 ?auto_189522 ) ) ( not ( = ?auto_189525 ?auto_189519 ) ) ( not ( = ?auto_189525 ?auto_189518 ) ) ( not ( = ?auto_189526 ?auto_189521 ) ) ( not ( = ?auto_189526 ?auto_189523 ) ) ( not ( = ?auto_189526 ?auto_189520 ) ) ( not ( = ?auto_189526 ?auto_189522 ) ) ( not ( = ?auto_189526 ?auto_189519 ) ) ( not ( = ?auto_189526 ?auto_189518 ) ) ( not ( = ?auto_189521 ?auto_189523 ) ) ( not ( = ?auto_189521 ?auto_189520 ) ) ( not ( = ?auto_189521 ?auto_189522 ) ) ( not ( = ?auto_189521 ?auto_189519 ) ) ( not ( = ?auto_189521 ?auto_189518 ) ) ( not ( = ?auto_189523 ?auto_189520 ) ) ( not ( = ?auto_189523 ?auto_189522 ) ) ( not ( = ?auto_189523 ?auto_189519 ) ) ( not ( = ?auto_189523 ?auto_189518 ) ) ( not ( = ?auto_189520 ?auto_189522 ) ) ( not ( = ?auto_189520 ?auto_189519 ) ) ( not ( = ?auto_189520 ?auto_189518 ) ) ( ON ?auto_189518 ?auto_189524 ) ( not ( = ?auto_189518 ?auto_189524 ) ) ( not ( = ?auto_189519 ?auto_189524 ) ) ( not ( = ?auto_189522 ?auto_189524 ) ) ( not ( = ?auto_189525 ?auto_189524 ) ) ( not ( = ?auto_189526 ?auto_189524 ) ) ( not ( = ?auto_189521 ?auto_189524 ) ) ( not ( = ?auto_189523 ?auto_189524 ) ) ( not ( = ?auto_189520 ?auto_189524 ) ) ( ON ?auto_189519 ?auto_189518 ) ( ON-TABLE ?auto_189524 ) ( ON ?auto_189522 ?auto_189519 ) ( ON ?auto_189520 ?auto_189522 ) ( ON ?auto_189523 ?auto_189520 ) ( ON ?auto_189521 ?auto_189523 ) ( ON ?auto_189526 ?auto_189521 ) ( CLEAR ?auto_189526 ) ( HOLDING ?auto_189525 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189525 )
      ( MAKE-2PILE ?auto_189518 ?auto_189519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_189527 - BLOCK
      ?auto_189528 - BLOCK
    )
    :vars
    (
      ?auto_189534 - BLOCK
      ?auto_189535 - BLOCK
      ?auto_189529 - BLOCK
      ?auto_189531 - BLOCK
      ?auto_189532 - BLOCK
      ?auto_189533 - BLOCK
      ?auto_189530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189527 ?auto_189528 ) ) ( not ( = ?auto_189527 ?auto_189534 ) ) ( not ( = ?auto_189528 ?auto_189534 ) ) ( not ( = ?auto_189535 ?auto_189529 ) ) ( not ( = ?auto_189535 ?auto_189531 ) ) ( not ( = ?auto_189535 ?auto_189532 ) ) ( not ( = ?auto_189535 ?auto_189533 ) ) ( not ( = ?auto_189535 ?auto_189534 ) ) ( not ( = ?auto_189535 ?auto_189528 ) ) ( not ( = ?auto_189535 ?auto_189527 ) ) ( not ( = ?auto_189529 ?auto_189531 ) ) ( not ( = ?auto_189529 ?auto_189532 ) ) ( not ( = ?auto_189529 ?auto_189533 ) ) ( not ( = ?auto_189529 ?auto_189534 ) ) ( not ( = ?auto_189529 ?auto_189528 ) ) ( not ( = ?auto_189529 ?auto_189527 ) ) ( not ( = ?auto_189531 ?auto_189532 ) ) ( not ( = ?auto_189531 ?auto_189533 ) ) ( not ( = ?auto_189531 ?auto_189534 ) ) ( not ( = ?auto_189531 ?auto_189528 ) ) ( not ( = ?auto_189531 ?auto_189527 ) ) ( not ( = ?auto_189532 ?auto_189533 ) ) ( not ( = ?auto_189532 ?auto_189534 ) ) ( not ( = ?auto_189532 ?auto_189528 ) ) ( not ( = ?auto_189532 ?auto_189527 ) ) ( not ( = ?auto_189533 ?auto_189534 ) ) ( not ( = ?auto_189533 ?auto_189528 ) ) ( not ( = ?auto_189533 ?auto_189527 ) ) ( ON ?auto_189527 ?auto_189530 ) ( not ( = ?auto_189527 ?auto_189530 ) ) ( not ( = ?auto_189528 ?auto_189530 ) ) ( not ( = ?auto_189534 ?auto_189530 ) ) ( not ( = ?auto_189535 ?auto_189530 ) ) ( not ( = ?auto_189529 ?auto_189530 ) ) ( not ( = ?auto_189531 ?auto_189530 ) ) ( not ( = ?auto_189532 ?auto_189530 ) ) ( not ( = ?auto_189533 ?auto_189530 ) ) ( ON ?auto_189528 ?auto_189527 ) ( ON-TABLE ?auto_189530 ) ( ON ?auto_189534 ?auto_189528 ) ( ON ?auto_189533 ?auto_189534 ) ( ON ?auto_189532 ?auto_189533 ) ( ON ?auto_189531 ?auto_189532 ) ( ON ?auto_189529 ?auto_189531 ) ( ON ?auto_189535 ?auto_189529 ) ( CLEAR ?auto_189535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189530 ?auto_189527 ?auto_189528 ?auto_189534 ?auto_189533 ?auto_189532 ?auto_189531 ?auto_189529 )
      ( MAKE-2PILE ?auto_189527 ?auto_189528 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189541 - BLOCK
      ?auto_189542 - BLOCK
      ?auto_189543 - BLOCK
      ?auto_189544 - BLOCK
      ?auto_189545 - BLOCK
    )
    :vars
    (
      ?auto_189546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189546 ?auto_189545 ) ( CLEAR ?auto_189546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189541 ) ( ON ?auto_189542 ?auto_189541 ) ( ON ?auto_189543 ?auto_189542 ) ( ON ?auto_189544 ?auto_189543 ) ( ON ?auto_189545 ?auto_189544 ) ( not ( = ?auto_189541 ?auto_189542 ) ) ( not ( = ?auto_189541 ?auto_189543 ) ) ( not ( = ?auto_189541 ?auto_189544 ) ) ( not ( = ?auto_189541 ?auto_189545 ) ) ( not ( = ?auto_189541 ?auto_189546 ) ) ( not ( = ?auto_189542 ?auto_189543 ) ) ( not ( = ?auto_189542 ?auto_189544 ) ) ( not ( = ?auto_189542 ?auto_189545 ) ) ( not ( = ?auto_189542 ?auto_189546 ) ) ( not ( = ?auto_189543 ?auto_189544 ) ) ( not ( = ?auto_189543 ?auto_189545 ) ) ( not ( = ?auto_189543 ?auto_189546 ) ) ( not ( = ?auto_189544 ?auto_189545 ) ) ( not ( = ?auto_189544 ?auto_189546 ) ) ( not ( = ?auto_189545 ?auto_189546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189546 ?auto_189545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189547 - BLOCK
      ?auto_189548 - BLOCK
      ?auto_189549 - BLOCK
      ?auto_189550 - BLOCK
      ?auto_189551 - BLOCK
    )
    :vars
    (
      ?auto_189552 - BLOCK
      ?auto_189553 - BLOCK
      ?auto_189554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189552 ?auto_189551 ) ( CLEAR ?auto_189552 ) ( ON-TABLE ?auto_189547 ) ( ON ?auto_189548 ?auto_189547 ) ( ON ?auto_189549 ?auto_189548 ) ( ON ?auto_189550 ?auto_189549 ) ( ON ?auto_189551 ?auto_189550 ) ( not ( = ?auto_189547 ?auto_189548 ) ) ( not ( = ?auto_189547 ?auto_189549 ) ) ( not ( = ?auto_189547 ?auto_189550 ) ) ( not ( = ?auto_189547 ?auto_189551 ) ) ( not ( = ?auto_189547 ?auto_189552 ) ) ( not ( = ?auto_189548 ?auto_189549 ) ) ( not ( = ?auto_189548 ?auto_189550 ) ) ( not ( = ?auto_189548 ?auto_189551 ) ) ( not ( = ?auto_189548 ?auto_189552 ) ) ( not ( = ?auto_189549 ?auto_189550 ) ) ( not ( = ?auto_189549 ?auto_189551 ) ) ( not ( = ?auto_189549 ?auto_189552 ) ) ( not ( = ?auto_189550 ?auto_189551 ) ) ( not ( = ?auto_189550 ?auto_189552 ) ) ( not ( = ?auto_189551 ?auto_189552 ) ) ( HOLDING ?auto_189553 ) ( CLEAR ?auto_189554 ) ( not ( = ?auto_189547 ?auto_189553 ) ) ( not ( = ?auto_189547 ?auto_189554 ) ) ( not ( = ?auto_189548 ?auto_189553 ) ) ( not ( = ?auto_189548 ?auto_189554 ) ) ( not ( = ?auto_189549 ?auto_189553 ) ) ( not ( = ?auto_189549 ?auto_189554 ) ) ( not ( = ?auto_189550 ?auto_189553 ) ) ( not ( = ?auto_189550 ?auto_189554 ) ) ( not ( = ?auto_189551 ?auto_189553 ) ) ( not ( = ?auto_189551 ?auto_189554 ) ) ( not ( = ?auto_189552 ?auto_189553 ) ) ( not ( = ?auto_189552 ?auto_189554 ) ) ( not ( = ?auto_189553 ?auto_189554 ) ) )
    :subtasks
    ( ( !STACK ?auto_189553 ?auto_189554 )
      ( MAKE-5PILE ?auto_189547 ?auto_189548 ?auto_189549 ?auto_189550 ?auto_189551 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189555 - BLOCK
      ?auto_189556 - BLOCK
      ?auto_189557 - BLOCK
      ?auto_189558 - BLOCK
      ?auto_189559 - BLOCK
    )
    :vars
    (
      ?auto_189562 - BLOCK
      ?auto_189560 - BLOCK
      ?auto_189561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189562 ?auto_189559 ) ( ON-TABLE ?auto_189555 ) ( ON ?auto_189556 ?auto_189555 ) ( ON ?auto_189557 ?auto_189556 ) ( ON ?auto_189558 ?auto_189557 ) ( ON ?auto_189559 ?auto_189558 ) ( not ( = ?auto_189555 ?auto_189556 ) ) ( not ( = ?auto_189555 ?auto_189557 ) ) ( not ( = ?auto_189555 ?auto_189558 ) ) ( not ( = ?auto_189555 ?auto_189559 ) ) ( not ( = ?auto_189555 ?auto_189562 ) ) ( not ( = ?auto_189556 ?auto_189557 ) ) ( not ( = ?auto_189556 ?auto_189558 ) ) ( not ( = ?auto_189556 ?auto_189559 ) ) ( not ( = ?auto_189556 ?auto_189562 ) ) ( not ( = ?auto_189557 ?auto_189558 ) ) ( not ( = ?auto_189557 ?auto_189559 ) ) ( not ( = ?auto_189557 ?auto_189562 ) ) ( not ( = ?auto_189558 ?auto_189559 ) ) ( not ( = ?auto_189558 ?auto_189562 ) ) ( not ( = ?auto_189559 ?auto_189562 ) ) ( CLEAR ?auto_189560 ) ( not ( = ?auto_189555 ?auto_189561 ) ) ( not ( = ?auto_189555 ?auto_189560 ) ) ( not ( = ?auto_189556 ?auto_189561 ) ) ( not ( = ?auto_189556 ?auto_189560 ) ) ( not ( = ?auto_189557 ?auto_189561 ) ) ( not ( = ?auto_189557 ?auto_189560 ) ) ( not ( = ?auto_189558 ?auto_189561 ) ) ( not ( = ?auto_189558 ?auto_189560 ) ) ( not ( = ?auto_189559 ?auto_189561 ) ) ( not ( = ?auto_189559 ?auto_189560 ) ) ( not ( = ?auto_189562 ?auto_189561 ) ) ( not ( = ?auto_189562 ?auto_189560 ) ) ( not ( = ?auto_189561 ?auto_189560 ) ) ( ON ?auto_189561 ?auto_189562 ) ( CLEAR ?auto_189561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189555 ?auto_189556 ?auto_189557 ?auto_189558 ?auto_189559 ?auto_189562 )
      ( MAKE-5PILE ?auto_189555 ?auto_189556 ?auto_189557 ?auto_189558 ?auto_189559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189563 - BLOCK
      ?auto_189564 - BLOCK
      ?auto_189565 - BLOCK
      ?auto_189566 - BLOCK
      ?auto_189567 - BLOCK
    )
    :vars
    (
      ?auto_189570 - BLOCK
      ?auto_189568 - BLOCK
      ?auto_189569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189570 ?auto_189567 ) ( ON-TABLE ?auto_189563 ) ( ON ?auto_189564 ?auto_189563 ) ( ON ?auto_189565 ?auto_189564 ) ( ON ?auto_189566 ?auto_189565 ) ( ON ?auto_189567 ?auto_189566 ) ( not ( = ?auto_189563 ?auto_189564 ) ) ( not ( = ?auto_189563 ?auto_189565 ) ) ( not ( = ?auto_189563 ?auto_189566 ) ) ( not ( = ?auto_189563 ?auto_189567 ) ) ( not ( = ?auto_189563 ?auto_189570 ) ) ( not ( = ?auto_189564 ?auto_189565 ) ) ( not ( = ?auto_189564 ?auto_189566 ) ) ( not ( = ?auto_189564 ?auto_189567 ) ) ( not ( = ?auto_189564 ?auto_189570 ) ) ( not ( = ?auto_189565 ?auto_189566 ) ) ( not ( = ?auto_189565 ?auto_189567 ) ) ( not ( = ?auto_189565 ?auto_189570 ) ) ( not ( = ?auto_189566 ?auto_189567 ) ) ( not ( = ?auto_189566 ?auto_189570 ) ) ( not ( = ?auto_189567 ?auto_189570 ) ) ( not ( = ?auto_189563 ?auto_189568 ) ) ( not ( = ?auto_189563 ?auto_189569 ) ) ( not ( = ?auto_189564 ?auto_189568 ) ) ( not ( = ?auto_189564 ?auto_189569 ) ) ( not ( = ?auto_189565 ?auto_189568 ) ) ( not ( = ?auto_189565 ?auto_189569 ) ) ( not ( = ?auto_189566 ?auto_189568 ) ) ( not ( = ?auto_189566 ?auto_189569 ) ) ( not ( = ?auto_189567 ?auto_189568 ) ) ( not ( = ?auto_189567 ?auto_189569 ) ) ( not ( = ?auto_189570 ?auto_189568 ) ) ( not ( = ?auto_189570 ?auto_189569 ) ) ( not ( = ?auto_189568 ?auto_189569 ) ) ( ON ?auto_189568 ?auto_189570 ) ( CLEAR ?auto_189568 ) ( HOLDING ?auto_189569 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189569 )
      ( MAKE-5PILE ?auto_189563 ?auto_189564 ?auto_189565 ?auto_189566 ?auto_189567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189571 - BLOCK
      ?auto_189572 - BLOCK
      ?auto_189573 - BLOCK
      ?auto_189574 - BLOCK
      ?auto_189575 - BLOCK
    )
    :vars
    (
      ?auto_189577 - BLOCK
      ?auto_189578 - BLOCK
      ?auto_189576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189577 ?auto_189575 ) ( ON-TABLE ?auto_189571 ) ( ON ?auto_189572 ?auto_189571 ) ( ON ?auto_189573 ?auto_189572 ) ( ON ?auto_189574 ?auto_189573 ) ( ON ?auto_189575 ?auto_189574 ) ( not ( = ?auto_189571 ?auto_189572 ) ) ( not ( = ?auto_189571 ?auto_189573 ) ) ( not ( = ?auto_189571 ?auto_189574 ) ) ( not ( = ?auto_189571 ?auto_189575 ) ) ( not ( = ?auto_189571 ?auto_189577 ) ) ( not ( = ?auto_189572 ?auto_189573 ) ) ( not ( = ?auto_189572 ?auto_189574 ) ) ( not ( = ?auto_189572 ?auto_189575 ) ) ( not ( = ?auto_189572 ?auto_189577 ) ) ( not ( = ?auto_189573 ?auto_189574 ) ) ( not ( = ?auto_189573 ?auto_189575 ) ) ( not ( = ?auto_189573 ?auto_189577 ) ) ( not ( = ?auto_189574 ?auto_189575 ) ) ( not ( = ?auto_189574 ?auto_189577 ) ) ( not ( = ?auto_189575 ?auto_189577 ) ) ( not ( = ?auto_189571 ?auto_189578 ) ) ( not ( = ?auto_189571 ?auto_189576 ) ) ( not ( = ?auto_189572 ?auto_189578 ) ) ( not ( = ?auto_189572 ?auto_189576 ) ) ( not ( = ?auto_189573 ?auto_189578 ) ) ( not ( = ?auto_189573 ?auto_189576 ) ) ( not ( = ?auto_189574 ?auto_189578 ) ) ( not ( = ?auto_189574 ?auto_189576 ) ) ( not ( = ?auto_189575 ?auto_189578 ) ) ( not ( = ?auto_189575 ?auto_189576 ) ) ( not ( = ?auto_189577 ?auto_189578 ) ) ( not ( = ?auto_189577 ?auto_189576 ) ) ( not ( = ?auto_189578 ?auto_189576 ) ) ( ON ?auto_189578 ?auto_189577 ) ( ON ?auto_189576 ?auto_189578 ) ( CLEAR ?auto_189576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189571 ?auto_189572 ?auto_189573 ?auto_189574 ?auto_189575 ?auto_189577 ?auto_189578 )
      ( MAKE-5PILE ?auto_189571 ?auto_189572 ?auto_189573 ?auto_189574 ?auto_189575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189579 - BLOCK
      ?auto_189580 - BLOCK
      ?auto_189581 - BLOCK
      ?auto_189582 - BLOCK
      ?auto_189583 - BLOCK
    )
    :vars
    (
      ?auto_189585 - BLOCK
      ?auto_189584 - BLOCK
      ?auto_189586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189585 ?auto_189583 ) ( ON-TABLE ?auto_189579 ) ( ON ?auto_189580 ?auto_189579 ) ( ON ?auto_189581 ?auto_189580 ) ( ON ?auto_189582 ?auto_189581 ) ( ON ?auto_189583 ?auto_189582 ) ( not ( = ?auto_189579 ?auto_189580 ) ) ( not ( = ?auto_189579 ?auto_189581 ) ) ( not ( = ?auto_189579 ?auto_189582 ) ) ( not ( = ?auto_189579 ?auto_189583 ) ) ( not ( = ?auto_189579 ?auto_189585 ) ) ( not ( = ?auto_189580 ?auto_189581 ) ) ( not ( = ?auto_189580 ?auto_189582 ) ) ( not ( = ?auto_189580 ?auto_189583 ) ) ( not ( = ?auto_189580 ?auto_189585 ) ) ( not ( = ?auto_189581 ?auto_189582 ) ) ( not ( = ?auto_189581 ?auto_189583 ) ) ( not ( = ?auto_189581 ?auto_189585 ) ) ( not ( = ?auto_189582 ?auto_189583 ) ) ( not ( = ?auto_189582 ?auto_189585 ) ) ( not ( = ?auto_189583 ?auto_189585 ) ) ( not ( = ?auto_189579 ?auto_189584 ) ) ( not ( = ?auto_189579 ?auto_189586 ) ) ( not ( = ?auto_189580 ?auto_189584 ) ) ( not ( = ?auto_189580 ?auto_189586 ) ) ( not ( = ?auto_189581 ?auto_189584 ) ) ( not ( = ?auto_189581 ?auto_189586 ) ) ( not ( = ?auto_189582 ?auto_189584 ) ) ( not ( = ?auto_189582 ?auto_189586 ) ) ( not ( = ?auto_189583 ?auto_189584 ) ) ( not ( = ?auto_189583 ?auto_189586 ) ) ( not ( = ?auto_189585 ?auto_189584 ) ) ( not ( = ?auto_189585 ?auto_189586 ) ) ( not ( = ?auto_189584 ?auto_189586 ) ) ( ON ?auto_189584 ?auto_189585 ) ( HOLDING ?auto_189586 ) ( CLEAR ?auto_189584 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189579 ?auto_189580 ?auto_189581 ?auto_189582 ?auto_189583 ?auto_189585 ?auto_189584 ?auto_189586 )
      ( MAKE-5PILE ?auto_189579 ?auto_189580 ?auto_189581 ?auto_189582 ?auto_189583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189587 - BLOCK
      ?auto_189588 - BLOCK
      ?auto_189589 - BLOCK
      ?auto_189590 - BLOCK
      ?auto_189591 - BLOCK
    )
    :vars
    (
      ?auto_189594 - BLOCK
      ?auto_189593 - BLOCK
      ?auto_189592 - BLOCK
      ?auto_189595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189594 ?auto_189591 ) ( ON-TABLE ?auto_189587 ) ( ON ?auto_189588 ?auto_189587 ) ( ON ?auto_189589 ?auto_189588 ) ( ON ?auto_189590 ?auto_189589 ) ( ON ?auto_189591 ?auto_189590 ) ( not ( = ?auto_189587 ?auto_189588 ) ) ( not ( = ?auto_189587 ?auto_189589 ) ) ( not ( = ?auto_189587 ?auto_189590 ) ) ( not ( = ?auto_189587 ?auto_189591 ) ) ( not ( = ?auto_189587 ?auto_189594 ) ) ( not ( = ?auto_189588 ?auto_189589 ) ) ( not ( = ?auto_189588 ?auto_189590 ) ) ( not ( = ?auto_189588 ?auto_189591 ) ) ( not ( = ?auto_189588 ?auto_189594 ) ) ( not ( = ?auto_189589 ?auto_189590 ) ) ( not ( = ?auto_189589 ?auto_189591 ) ) ( not ( = ?auto_189589 ?auto_189594 ) ) ( not ( = ?auto_189590 ?auto_189591 ) ) ( not ( = ?auto_189590 ?auto_189594 ) ) ( not ( = ?auto_189591 ?auto_189594 ) ) ( not ( = ?auto_189587 ?auto_189593 ) ) ( not ( = ?auto_189587 ?auto_189592 ) ) ( not ( = ?auto_189588 ?auto_189593 ) ) ( not ( = ?auto_189588 ?auto_189592 ) ) ( not ( = ?auto_189589 ?auto_189593 ) ) ( not ( = ?auto_189589 ?auto_189592 ) ) ( not ( = ?auto_189590 ?auto_189593 ) ) ( not ( = ?auto_189590 ?auto_189592 ) ) ( not ( = ?auto_189591 ?auto_189593 ) ) ( not ( = ?auto_189591 ?auto_189592 ) ) ( not ( = ?auto_189594 ?auto_189593 ) ) ( not ( = ?auto_189594 ?auto_189592 ) ) ( not ( = ?auto_189593 ?auto_189592 ) ) ( ON ?auto_189593 ?auto_189594 ) ( CLEAR ?auto_189593 ) ( ON ?auto_189592 ?auto_189595 ) ( CLEAR ?auto_189592 ) ( HAND-EMPTY ) ( not ( = ?auto_189587 ?auto_189595 ) ) ( not ( = ?auto_189588 ?auto_189595 ) ) ( not ( = ?auto_189589 ?auto_189595 ) ) ( not ( = ?auto_189590 ?auto_189595 ) ) ( not ( = ?auto_189591 ?auto_189595 ) ) ( not ( = ?auto_189594 ?auto_189595 ) ) ( not ( = ?auto_189593 ?auto_189595 ) ) ( not ( = ?auto_189592 ?auto_189595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189592 ?auto_189595 )
      ( MAKE-5PILE ?auto_189587 ?auto_189588 ?auto_189589 ?auto_189590 ?auto_189591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189596 - BLOCK
      ?auto_189597 - BLOCK
      ?auto_189598 - BLOCK
      ?auto_189599 - BLOCK
      ?auto_189600 - BLOCK
    )
    :vars
    (
      ?auto_189601 - BLOCK
      ?auto_189602 - BLOCK
      ?auto_189603 - BLOCK
      ?auto_189604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189601 ?auto_189600 ) ( ON-TABLE ?auto_189596 ) ( ON ?auto_189597 ?auto_189596 ) ( ON ?auto_189598 ?auto_189597 ) ( ON ?auto_189599 ?auto_189598 ) ( ON ?auto_189600 ?auto_189599 ) ( not ( = ?auto_189596 ?auto_189597 ) ) ( not ( = ?auto_189596 ?auto_189598 ) ) ( not ( = ?auto_189596 ?auto_189599 ) ) ( not ( = ?auto_189596 ?auto_189600 ) ) ( not ( = ?auto_189596 ?auto_189601 ) ) ( not ( = ?auto_189597 ?auto_189598 ) ) ( not ( = ?auto_189597 ?auto_189599 ) ) ( not ( = ?auto_189597 ?auto_189600 ) ) ( not ( = ?auto_189597 ?auto_189601 ) ) ( not ( = ?auto_189598 ?auto_189599 ) ) ( not ( = ?auto_189598 ?auto_189600 ) ) ( not ( = ?auto_189598 ?auto_189601 ) ) ( not ( = ?auto_189599 ?auto_189600 ) ) ( not ( = ?auto_189599 ?auto_189601 ) ) ( not ( = ?auto_189600 ?auto_189601 ) ) ( not ( = ?auto_189596 ?auto_189602 ) ) ( not ( = ?auto_189596 ?auto_189603 ) ) ( not ( = ?auto_189597 ?auto_189602 ) ) ( not ( = ?auto_189597 ?auto_189603 ) ) ( not ( = ?auto_189598 ?auto_189602 ) ) ( not ( = ?auto_189598 ?auto_189603 ) ) ( not ( = ?auto_189599 ?auto_189602 ) ) ( not ( = ?auto_189599 ?auto_189603 ) ) ( not ( = ?auto_189600 ?auto_189602 ) ) ( not ( = ?auto_189600 ?auto_189603 ) ) ( not ( = ?auto_189601 ?auto_189602 ) ) ( not ( = ?auto_189601 ?auto_189603 ) ) ( not ( = ?auto_189602 ?auto_189603 ) ) ( ON ?auto_189603 ?auto_189604 ) ( CLEAR ?auto_189603 ) ( not ( = ?auto_189596 ?auto_189604 ) ) ( not ( = ?auto_189597 ?auto_189604 ) ) ( not ( = ?auto_189598 ?auto_189604 ) ) ( not ( = ?auto_189599 ?auto_189604 ) ) ( not ( = ?auto_189600 ?auto_189604 ) ) ( not ( = ?auto_189601 ?auto_189604 ) ) ( not ( = ?auto_189602 ?auto_189604 ) ) ( not ( = ?auto_189603 ?auto_189604 ) ) ( HOLDING ?auto_189602 ) ( CLEAR ?auto_189601 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189596 ?auto_189597 ?auto_189598 ?auto_189599 ?auto_189600 ?auto_189601 ?auto_189602 )
      ( MAKE-5PILE ?auto_189596 ?auto_189597 ?auto_189598 ?auto_189599 ?auto_189600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189605 - BLOCK
      ?auto_189606 - BLOCK
      ?auto_189607 - BLOCK
      ?auto_189608 - BLOCK
      ?auto_189609 - BLOCK
    )
    :vars
    (
      ?auto_189611 - BLOCK
      ?auto_189610 - BLOCK
      ?auto_189613 - BLOCK
      ?auto_189612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189611 ?auto_189609 ) ( ON-TABLE ?auto_189605 ) ( ON ?auto_189606 ?auto_189605 ) ( ON ?auto_189607 ?auto_189606 ) ( ON ?auto_189608 ?auto_189607 ) ( ON ?auto_189609 ?auto_189608 ) ( not ( = ?auto_189605 ?auto_189606 ) ) ( not ( = ?auto_189605 ?auto_189607 ) ) ( not ( = ?auto_189605 ?auto_189608 ) ) ( not ( = ?auto_189605 ?auto_189609 ) ) ( not ( = ?auto_189605 ?auto_189611 ) ) ( not ( = ?auto_189606 ?auto_189607 ) ) ( not ( = ?auto_189606 ?auto_189608 ) ) ( not ( = ?auto_189606 ?auto_189609 ) ) ( not ( = ?auto_189606 ?auto_189611 ) ) ( not ( = ?auto_189607 ?auto_189608 ) ) ( not ( = ?auto_189607 ?auto_189609 ) ) ( not ( = ?auto_189607 ?auto_189611 ) ) ( not ( = ?auto_189608 ?auto_189609 ) ) ( not ( = ?auto_189608 ?auto_189611 ) ) ( not ( = ?auto_189609 ?auto_189611 ) ) ( not ( = ?auto_189605 ?auto_189610 ) ) ( not ( = ?auto_189605 ?auto_189613 ) ) ( not ( = ?auto_189606 ?auto_189610 ) ) ( not ( = ?auto_189606 ?auto_189613 ) ) ( not ( = ?auto_189607 ?auto_189610 ) ) ( not ( = ?auto_189607 ?auto_189613 ) ) ( not ( = ?auto_189608 ?auto_189610 ) ) ( not ( = ?auto_189608 ?auto_189613 ) ) ( not ( = ?auto_189609 ?auto_189610 ) ) ( not ( = ?auto_189609 ?auto_189613 ) ) ( not ( = ?auto_189611 ?auto_189610 ) ) ( not ( = ?auto_189611 ?auto_189613 ) ) ( not ( = ?auto_189610 ?auto_189613 ) ) ( ON ?auto_189613 ?auto_189612 ) ( not ( = ?auto_189605 ?auto_189612 ) ) ( not ( = ?auto_189606 ?auto_189612 ) ) ( not ( = ?auto_189607 ?auto_189612 ) ) ( not ( = ?auto_189608 ?auto_189612 ) ) ( not ( = ?auto_189609 ?auto_189612 ) ) ( not ( = ?auto_189611 ?auto_189612 ) ) ( not ( = ?auto_189610 ?auto_189612 ) ) ( not ( = ?auto_189613 ?auto_189612 ) ) ( CLEAR ?auto_189611 ) ( ON ?auto_189610 ?auto_189613 ) ( CLEAR ?auto_189610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189612 ?auto_189613 )
      ( MAKE-5PILE ?auto_189605 ?auto_189606 ?auto_189607 ?auto_189608 ?auto_189609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189632 - BLOCK
      ?auto_189633 - BLOCK
      ?auto_189634 - BLOCK
      ?auto_189635 - BLOCK
      ?auto_189636 - BLOCK
    )
    :vars
    (
      ?auto_189637 - BLOCK
      ?auto_189639 - BLOCK
      ?auto_189638 - BLOCK
      ?auto_189640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189632 ) ( ON ?auto_189633 ?auto_189632 ) ( ON ?auto_189634 ?auto_189633 ) ( ON ?auto_189635 ?auto_189634 ) ( not ( = ?auto_189632 ?auto_189633 ) ) ( not ( = ?auto_189632 ?auto_189634 ) ) ( not ( = ?auto_189632 ?auto_189635 ) ) ( not ( = ?auto_189632 ?auto_189636 ) ) ( not ( = ?auto_189632 ?auto_189637 ) ) ( not ( = ?auto_189633 ?auto_189634 ) ) ( not ( = ?auto_189633 ?auto_189635 ) ) ( not ( = ?auto_189633 ?auto_189636 ) ) ( not ( = ?auto_189633 ?auto_189637 ) ) ( not ( = ?auto_189634 ?auto_189635 ) ) ( not ( = ?auto_189634 ?auto_189636 ) ) ( not ( = ?auto_189634 ?auto_189637 ) ) ( not ( = ?auto_189635 ?auto_189636 ) ) ( not ( = ?auto_189635 ?auto_189637 ) ) ( not ( = ?auto_189636 ?auto_189637 ) ) ( not ( = ?auto_189632 ?auto_189639 ) ) ( not ( = ?auto_189632 ?auto_189638 ) ) ( not ( = ?auto_189633 ?auto_189639 ) ) ( not ( = ?auto_189633 ?auto_189638 ) ) ( not ( = ?auto_189634 ?auto_189639 ) ) ( not ( = ?auto_189634 ?auto_189638 ) ) ( not ( = ?auto_189635 ?auto_189639 ) ) ( not ( = ?auto_189635 ?auto_189638 ) ) ( not ( = ?auto_189636 ?auto_189639 ) ) ( not ( = ?auto_189636 ?auto_189638 ) ) ( not ( = ?auto_189637 ?auto_189639 ) ) ( not ( = ?auto_189637 ?auto_189638 ) ) ( not ( = ?auto_189639 ?auto_189638 ) ) ( ON ?auto_189638 ?auto_189640 ) ( not ( = ?auto_189632 ?auto_189640 ) ) ( not ( = ?auto_189633 ?auto_189640 ) ) ( not ( = ?auto_189634 ?auto_189640 ) ) ( not ( = ?auto_189635 ?auto_189640 ) ) ( not ( = ?auto_189636 ?auto_189640 ) ) ( not ( = ?auto_189637 ?auto_189640 ) ) ( not ( = ?auto_189639 ?auto_189640 ) ) ( not ( = ?auto_189638 ?auto_189640 ) ) ( ON ?auto_189639 ?auto_189638 ) ( ON-TABLE ?auto_189640 ) ( ON ?auto_189637 ?auto_189639 ) ( CLEAR ?auto_189637 ) ( HOLDING ?auto_189636 ) ( CLEAR ?auto_189635 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189632 ?auto_189633 ?auto_189634 ?auto_189635 ?auto_189636 ?auto_189637 )
      ( MAKE-5PILE ?auto_189632 ?auto_189633 ?auto_189634 ?auto_189635 ?auto_189636 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189641 - BLOCK
      ?auto_189642 - BLOCK
      ?auto_189643 - BLOCK
      ?auto_189644 - BLOCK
      ?auto_189645 - BLOCK
    )
    :vars
    (
      ?auto_189646 - BLOCK
      ?auto_189647 - BLOCK
      ?auto_189648 - BLOCK
      ?auto_189649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189641 ) ( ON ?auto_189642 ?auto_189641 ) ( ON ?auto_189643 ?auto_189642 ) ( ON ?auto_189644 ?auto_189643 ) ( not ( = ?auto_189641 ?auto_189642 ) ) ( not ( = ?auto_189641 ?auto_189643 ) ) ( not ( = ?auto_189641 ?auto_189644 ) ) ( not ( = ?auto_189641 ?auto_189645 ) ) ( not ( = ?auto_189641 ?auto_189646 ) ) ( not ( = ?auto_189642 ?auto_189643 ) ) ( not ( = ?auto_189642 ?auto_189644 ) ) ( not ( = ?auto_189642 ?auto_189645 ) ) ( not ( = ?auto_189642 ?auto_189646 ) ) ( not ( = ?auto_189643 ?auto_189644 ) ) ( not ( = ?auto_189643 ?auto_189645 ) ) ( not ( = ?auto_189643 ?auto_189646 ) ) ( not ( = ?auto_189644 ?auto_189645 ) ) ( not ( = ?auto_189644 ?auto_189646 ) ) ( not ( = ?auto_189645 ?auto_189646 ) ) ( not ( = ?auto_189641 ?auto_189647 ) ) ( not ( = ?auto_189641 ?auto_189648 ) ) ( not ( = ?auto_189642 ?auto_189647 ) ) ( not ( = ?auto_189642 ?auto_189648 ) ) ( not ( = ?auto_189643 ?auto_189647 ) ) ( not ( = ?auto_189643 ?auto_189648 ) ) ( not ( = ?auto_189644 ?auto_189647 ) ) ( not ( = ?auto_189644 ?auto_189648 ) ) ( not ( = ?auto_189645 ?auto_189647 ) ) ( not ( = ?auto_189645 ?auto_189648 ) ) ( not ( = ?auto_189646 ?auto_189647 ) ) ( not ( = ?auto_189646 ?auto_189648 ) ) ( not ( = ?auto_189647 ?auto_189648 ) ) ( ON ?auto_189648 ?auto_189649 ) ( not ( = ?auto_189641 ?auto_189649 ) ) ( not ( = ?auto_189642 ?auto_189649 ) ) ( not ( = ?auto_189643 ?auto_189649 ) ) ( not ( = ?auto_189644 ?auto_189649 ) ) ( not ( = ?auto_189645 ?auto_189649 ) ) ( not ( = ?auto_189646 ?auto_189649 ) ) ( not ( = ?auto_189647 ?auto_189649 ) ) ( not ( = ?auto_189648 ?auto_189649 ) ) ( ON ?auto_189647 ?auto_189648 ) ( ON-TABLE ?auto_189649 ) ( ON ?auto_189646 ?auto_189647 ) ( CLEAR ?auto_189644 ) ( ON ?auto_189645 ?auto_189646 ) ( CLEAR ?auto_189645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189649 ?auto_189648 ?auto_189647 ?auto_189646 )
      ( MAKE-5PILE ?auto_189641 ?auto_189642 ?auto_189643 ?auto_189644 ?auto_189645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189650 - BLOCK
      ?auto_189651 - BLOCK
      ?auto_189652 - BLOCK
      ?auto_189653 - BLOCK
      ?auto_189654 - BLOCK
    )
    :vars
    (
      ?auto_189656 - BLOCK
      ?auto_189655 - BLOCK
      ?auto_189658 - BLOCK
      ?auto_189657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189650 ) ( ON ?auto_189651 ?auto_189650 ) ( ON ?auto_189652 ?auto_189651 ) ( not ( = ?auto_189650 ?auto_189651 ) ) ( not ( = ?auto_189650 ?auto_189652 ) ) ( not ( = ?auto_189650 ?auto_189653 ) ) ( not ( = ?auto_189650 ?auto_189654 ) ) ( not ( = ?auto_189650 ?auto_189656 ) ) ( not ( = ?auto_189651 ?auto_189652 ) ) ( not ( = ?auto_189651 ?auto_189653 ) ) ( not ( = ?auto_189651 ?auto_189654 ) ) ( not ( = ?auto_189651 ?auto_189656 ) ) ( not ( = ?auto_189652 ?auto_189653 ) ) ( not ( = ?auto_189652 ?auto_189654 ) ) ( not ( = ?auto_189652 ?auto_189656 ) ) ( not ( = ?auto_189653 ?auto_189654 ) ) ( not ( = ?auto_189653 ?auto_189656 ) ) ( not ( = ?auto_189654 ?auto_189656 ) ) ( not ( = ?auto_189650 ?auto_189655 ) ) ( not ( = ?auto_189650 ?auto_189658 ) ) ( not ( = ?auto_189651 ?auto_189655 ) ) ( not ( = ?auto_189651 ?auto_189658 ) ) ( not ( = ?auto_189652 ?auto_189655 ) ) ( not ( = ?auto_189652 ?auto_189658 ) ) ( not ( = ?auto_189653 ?auto_189655 ) ) ( not ( = ?auto_189653 ?auto_189658 ) ) ( not ( = ?auto_189654 ?auto_189655 ) ) ( not ( = ?auto_189654 ?auto_189658 ) ) ( not ( = ?auto_189656 ?auto_189655 ) ) ( not ( = ?auto_189656 ?auto_189658 ) ) ( not ( = ?auto_189655 ?auto_189658 ) ) ( ON ?auto_189658 ?auto_189657 ) ( not ( = ?auto_189650 ?auto_189657 ) ) ( not ( = ?auto_189651 ?auto_189657 ) ) ( not ( = ?auto_189652 ?auto_189657 ) ) ( not ( = ?auto_189653 ?auto_189657 ) ) ( not ( = ?auto_189654 ?auto_189657 ) ) ( not ( = ?auto_189656 ?auto_189657 ) ) ( not ( = ?auto_189655 ?auto_189657 ) ) ( not ( = ?auto_189658 ?auto_189657 ) ) ( ON ?auto_189655 ?auto_189658 ) ( ON-TABLE ?auto_189657 ) ( ON ?auto_189656 ?auto_189655 ) ( ON ?auto_189654 ?auto_189656 ) ( CLEAR ?auto_189654 ) ( HOLDING ?auto_189653 ) ( CLEAR ?auto_189652 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189650 ?auto_189651 ?auto_189652 ?auto_189653 )
      ( MAKE-5PILE ?auto_189650 ?auto_189651 ?auto_189652 ?auto_189653 ?auto_189654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189659 - BLOCK
      ?auto_189660 - BLOCK
      ?auto_189661 - BLOCK
      ?auto_189662 - BLOCK
      ?auto_189663 - BLOCK
    )
    :vars
    (
      ?auto_189667 - BLOCK
      ?auto_189665 - BLOCK
      ?auto_189664 - BLOCK
      ?auto_189666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189659 ) ( ON ?auto_189660 ?auto_189659 ) ( ON ?auto_189661 ?auto_189660 ) ( not ( = ?auto_189659 ?auto_189660 ) ) ( not ( = ?auto_189659 ?auto_189661 ) ) ( not ( = ?auto_189659 ?auto_189662 ) ) ( not ( = ?auto_189659 ?auto_189663 ) ) ( not ( = ?auto_189659 ?auto_189667 ) ) ( not ( = ?auto_189660 ?auto_189661 ) ) ( not ( = ?auto_189660 ?auto_189662 ) ) ( not ( = ?auto_189660 ?auto_189663 ) ) ( not ( = ?auto_189660 ?auto_189667 ) ) ( not ( = ?auto_189661 ?auto_189662 ) ) ( not ( = ?auto_189661 ?auto_189663 ) ) ( not ( = ?auto_189661 ?auto_189667 ) ) ( not ( = ?auto_189662 ?auto_189663 ) ) ( not ( = ?auto_189662 ?auto_189667 ) ) ( not ( = ?auto_189663 ?auto_189667 ) ) ( not ( = ?auto_189659 ?auto_189665 ) ) ( not ( = ?auto_189659 ?auto_189664 ) ) ( not ( = ?auto_189660 ?auto_189665 ) ) ( not ( = ?auto_189660 ?auto_189664 ) ) ( not ( = ?auto_189661 ?auto_189665 ) ) ( not ( = ?auto_189661 ?auto_189664 ) ) ( not ( = ?auto_189662 ?auto_189665 ) ) ( not ( = ?auto_189662 ?auto_189664 ) ) ( not ( = ?auto_189663 ?auto_189665 ) ) ( not ( = ?auto_189663 ?auto_189664 ) ) ( not ( = ?auto_189667 ?auto_189665 ) ) ( not ( = ?auto_189667 ?auto_189664 ) ) ( not ( = ?auto_189665 ?auto_189664 ) ) ( ON ?auto_189664 ?auto_189666 ) ( not ( = ?auto_189659 ?auto_189666 ) ) ( not ( = ?auto_189660 ?auto_189666 ) ) ( not ( = ?auto_189661 ?auto_189666 ) ) ( not ( = ?auto_189662 ?auto_189666 ) ) ( not ( = ?auto_189663 ?auto_189666 ) ) ( not ( = ?auto_189667 ?auto_189666 ) ) ( not ( = ?auto_189665 ?auto_189666 ) ) ( not ( = ?auto_189664 ?auto_189666 ) ) ( ON ?auto_189665 ?auto_189664 ) ( ON-TABLE ?auto_189666 ) ( ON ?auto_189667 ?auto_189665 ) ( ON ?auto_189663 ?auto_189667 ) ( CLEAR ?auto_189661 ) ( ON ?auto_189662 ?auto_189663 ) ( CLEAR ?auto_189662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189666 ?auto_189664 ?auto_189665 ?auto_189667 ?auto_189663 )
      ( MAKE-5PILE ?auto_189659 ?auto_189660 ?auto_189661 ?auto_189662 ?auto_189663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189668 - BLOCK
      ?auto_189669 - BLOCK
      ?auto_189670 - BLOCK
      ?auto_189671 - BLOCK
      ?auto_189672 - BLOCK
    )
    :vars
    (
      ?auto_189676 - BLOCK
      ?auto_189673 - BLOCK
      ?auto_189674 - BLOCK
      ?auto_189675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189668 ) ( ON ?auto_189669 ?auto_189668 ) ( not ( = ?auto_189668 ?auto_189669 ) ) ( not ( = ?auto_189668 ?auto_189670 ) ) ( not ( = ?auto_189668 ?auto_189671 ) ) ( not ( = ?auto_189668 ?auto_189672 ) ) ( not ( = ?auto_189668 ?auto_189676 ) ) ( not ( = ?auto_189669 ?auto_189670 ) ) ( not ( = ?auto_189669 ?auto_189671 ) ) ( not ( = ?auto_189669 ?auto_189672 ) ) ( not ( = ?auto_189669 ?auto_189676 ) ) ( not ( = ?auto_189670 ?auto_189671 ) ) ( not ( = ?auto_189670 ?auto_189672 ) ) ( not ( = ?auto_189670 ?auto_189676 ) ) ( not ( = ?auto_189671 ?auto_189672 ) ) ( not ( = ?auto_189671 ?auto_189676 ) ) ( not ( = ?auto_189672 ?auto_189676 ) ) ( not ( = ?auto_189668 ?auto_189673 ) ) ( not ( = ?auto_189668 ?auto_189674 ) ) ( not ( = ?auto_189669 ?auto_189673 ) ) ( not ( = ?auto_189669 ?auto_189674 ) ) ( not ( = ?auto_189670 ?auto_189673 ) ) ( not ( = ?auto_189670 ?auto_189674 ) ) ( not ( = ?auto_189671 ?auto_189673 ) ) ( not ( = ?auto_189671 ?auto_189674 ) ) ( not ( = ?auto_189672 ?auto_189673 ) ) ( not ( = ?auto_189672 ?auto_189674 ) ) ( not ( = ?auto_189676 ?auto_189673 ) ) ( not ( = ?auto_189676 ?auto_189674 ) ) ( not ( = ?auto_189673 ?auto_189674 ) ) ( ON ?auto_189674 ?auto_189675 ) ( not ( = ?auto_189668 ?auto_189675 ) ) ( not ( = ?auto_189669 ?auto_189675 ) ) ( not ( = ?auto_189670 ?auto_189675 ) ) ( not ( = ?auto_189671 ?auto_189675 ) ) ( not ( = ?auto_189672 ?auto_189675 ) ) ( not ( = ?auto_189676 ?auto_189675 ) ) ( not ( = ?auto_189673 ?auto_189675 ) ) ( not ( = ?auto_189674 ?auto_189675 ) ) ( ON ?auto_189673 ?auto_189674 ) ( ON-TABLE ?auto_189675 ) ( ON ?auto_189676 ?auto_189673 ) ( ON ?auto_189672 ?auto_189676 ) ( ON ?auto_189671 ?auto_189672 ) ( CLEAR ?auto_189671 ) ( HOLDING ?auto_189670 ) ( CLEAR ?auto_189669 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189668 ?auto_189669 ?auto_189670 )
      ( MAKE-5PILE ?auto_189668 ?auto_189669 ?auto_189670 ?auto_189671 ?auto_189672 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189677 - BLOCK
      ?auto_189678 - BLOCK
      ?auto_189679 - BLOCK
      ?auto_189680 - BLOCK
      ?auto_189681 - BLOCK
    )
    :vars
    (
      ?auto_189683 - BLOCK
      ?auto_189682 - BLOCK
      ?auto_189685 - BLOCK
      ?auto_189684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189677 ) ( ON ?auto_189678 ?auto_189677 ) ( not ( = ?auto_189677 ?auto_189678 ) ) ( not ( = ?auto_189677 ?auto_189679 ) ) ( not ( = ?auto_189677 ?auto_189680 ) ) ( not ( = ?auto_189677 ?auto_189681 ) ) ( not ( = ?auto_189677 ?auto_189683 ) ) ( not ( = ?auto_189678 ?auto_189679 ) ) ( not ( = ?auto_189678 ?auto_189680 ) ) ( not ( = ?auto_189678 ?auto_189681 ) ) ( not ( = ?auto_189678 ?auto_189683 ) ) ( not ( = ?auto_189679 ?auto_189680 ) ) ( not ( = ?auto_189679 ?auto_189681 ) ) ( not ( = ?auto_189679 ?auto_189683 ) ) ( not ( = ?auto_189680 ?auto_189681 ) ) ( not ( = ?auto_189680 ?auto_189683 ) ) ( not ( = ?auto_189681 ?auto_189683 ) ) ( not ( = ?auto_189677 ?auto_189682 ) ) ( not ( = ?auto_189677 ?auto_189685 ) ) ( not ( = ?auto_189678 ?auto_189682 ) ) ( not ( = ?auto_189678 ?auto_189685 ) ) ( not ( = ?auto_189679 ?auto_189682 ) ) ( not ( = ?auto_189679 ?auto_189685 ) ) ( not ( = ?auto_189680 ?auto_189682 ) ) ( not ( = ?auto_189680 ?auto_189685 ) ) ( not ( = ?auto_189681 ?auto_189682 ) ) ( not ( = ?auto_189681 ?auto_189685 ) ) ( not ( = ?auto_189683 ?auto_189682 ) ) ( not ( = ?auto_189683 ?auto_189685 ) ) ( not ( = ?auto_189682 ?auto_189685 ) ) ( ON ?auto_189685 ?auto_189684 ) ( not ( = ?auto_189677 ?auto_189684 ) ) ( not ( = ?auto_189678 ?auto_189684 ) ) ( not ( = ?auto_189679 ?auto_189684 ) ) ( not ( = ?auto_189680 ?auto_189684 ) ) ( not ( = ?auto_189681 ?auto_189684 ) ) ( not ( = ?auto_189683 ?auto_189684 ) ) ( not ( = ?auto_189682 ?auto_189684 ) ) ( not ( = ?auto_189685 ?auto_189684 ) ) ( ON ?auto_189682 ?auto_189685 ) ( ON-TABLE ?auto_189684 ) ( ON ?auto_189683 ?auto_189682 ) ( ON ?auto_189681 ?auto_189683 ) ( ON ?auto_189680 ?auto_189681 ) ( CLEAR ?auto_189678 ) ( ON ?auto_189679 ?auto_189680 ) ( CLEAR ?auto_189679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189684 ?auto_189685 ?auto_189682 ?auto_189683 ?auto_189681 ?auto_189680 )
      ( MAKE-5PILE ?auto_189677 ?auto_189678 ?auto_189679 ?auto_189680 ?auto_189681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189686 - BLOCK
      ?auto_189687 - BLOCK
      ?auto_189688 - BLOCK
      ?auto_189689 - BLOCK
      ?auto_189690 - BLOCK
    )
    :vars
    (
      ?auto_189692 - BLOCK
      ?auto_189693 - BLOCK
      ?auto_189691 - BLOCK
      ?auto_189694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189686 ) ( not ( = ?auto_189686 ?auto_189687 ) ) ( not ( = ?auto_189686 ?auto_189688 ) ) ( not ( = ?auto_189686 ?auto_189689 ) ) ( not ( = ?auto_189686 ?auto_189690 ) ) ( not ( = ?auto_189686 ?auto_189692 ) ) ( not ( = ?auto_189687 ?auto_189688 ) ) ( not ( = ?auto_189687 ?auto_189689 ) ) ( not ( = ?auto_189687 ?auto_189690 ) ) ( not ( = ?auto_189687 ?auto_189692 ) ) ( not ( = ?auto_189688 ?auto_189689 ) ) ( not ( = ?auto_189688 ?auto_189690 ) ) ( not ( = ?auto_189688 ?auto_189692 ) ) ( not ( = ?auto_189689 ?auto_189690 ) ) ( not ( = ?auto_189689 ?auto_189692 ) ) ( not ( = ?auto_189690 ?auto_189692 ) ) ( not ( = ?auto_189686 ?auto_189693 ) ) ( not ( = ?auto_189686 ?auto_189691 ) ) ( not ( = ?auto_189687 ?auto_189693 ) ) ( not ( = ?auto_189687 ?auto_189691 ) ) ( not ( = ?auto_189688 ?auto_189693 ) ) ( not ( = ?auto_189688 ?auto_189691 ) ) ( not ( = ?auto_189689 ?auto_189693 ) ) ( not ( = ?auto_189689 ?auto_189691 ) ) ( not ( = ?auto_189690 ?auto_189693 ) ) ( not ( = ?auto_189690 ?auto_189691 ) ) ( not ( = ?auto_189692 ?auto_189693 ) ) ( not ( = ?auto_189692 ?auto_189691 ) ) ( not ( = ?auto_189693 ?auto_189691 ) ) ( ON ?auto_189691 ?auto_189694 ) ( not ( = ?auto_189686 ?auto_189694 ) ) ( not ( = ?auto_189687 ?auto_189694 ) ) ( not ( = ?auto_189688 ?auto_189694 ) ) ( not ( = ?auto_189689 ?auto_189694 ) ) ( not ( = ?auto_189690 ?auto_189694 ) ) ( not ( = ?auto_189692 ?auto_189694 ) ) ( not ( = ?auto_189693 ?auto_189694 ) ) ( not ( = ?auto_189691 ?auto_189694 ) ) ( ON ?auto_189693 ?auto_189691 ) ( ON-TABLE ?auto_189694 ) ( ON ?auto_189692 ?auto_189693 ) ( ON ?auto_189690 ?auto_189692 ) ( ON ?auto_189689 ?auto_189690 ) ( ON ?auto_189688 ?auto_189689 ) ( CLEAR ?auto_189688 ) ( HOLDING ?auto_189687 ) ( CLEAR ?auto_189686 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189686 ?auto_189687 )
      ( MAKE-5PILE ?auto_189686 ?auto_189687 ?auto_189688 ?auto_189689 ?auto_189690 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189695 - BLOCK
      ?auto_189696 - BLOCK
      ?auto_189697 - BLOCK
      ?auto_189698 - BLOCK
      ?auto_189699 - BLOCK
    )
    :vars
    (
      ?auto_189701 - BLOCK
      ?auto_189700 - BLOCK
      ?auto_189702 - BLOCK
      ?auto_189703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189695 ) ( not ( = ?auto_189695 ?auto_189696 ) ) ( not ( = ?auto_189695 ?auto_189697 ) ) ( not ( = ?auto_189695 ?auto_189698 ) ) ( not ( = ?auto_189695 ?auto_189699 ) ) ( not ( = ?auto_189695 ?auto_189701 ) ) ( not ( = ?auto_189696 ?auto_189697 ) ) ( not ( = ?auto_189696 ?auto_189698 ) ) ( not ( = ?auto_189696 ?auto_189699 ) ) ( not ( = ?auto_189696 ?auto_189701 ) ) ( not ( = ?auto_189697 ?auto_189698 ) ) ( not ( = ?auto_189697 ?auto_189699 ) ) ( not ( = ?auto_189697 ?auto_189701 ) ) ( not ( = ?auto_189698 ?auto_189699 ) ) ( not ( = ?auto_189698 ?auto_189701 ) ) ( not ( = ?auto_189699 ?auto_189701 ) ) ( not ( = ?auto_189695 ?auto_189700 ) ) ( not ( = ?auto_189695 ?auto_189702 ) ) ( not ( = ?auto_189696 ?auto_189700 ) ) ( not ( = ?auto_189696 ?auto_189702 ) ) ( not ( = ?auto_189697 ?auto_189700 ) ) ( not ( = ?auto_189697 ?auto_189702 ) ) ( not ( = ?auto_189698 ?auto_189700 ) ) ( not ( = ?auto_189698 ?auto_189702 ) ) ( not ( = ?auto_189699 ?auto_189700 ) ) ( not ( = ?auto_189699 ?auto_189702 ) ) ( not ( = ?auto_189701 ?auto_189700 ) ) ( not ( = ?auto_189701 ?auto_189702 ) ) ( not ( = ?auto_189700 ?auto_189702 ) ) ( ON ?auto_189702 ?auto_189703 ) ( not ( = ?auto_189695 ?auto_189703 ) ) ( not ( = ?auto_189696 ?auto_189703 ) ) ( not ( = ?auto_189697 ?auto_189703 ) ) ( not ( = ?auto_189698 ?auto_189703 ) ) ( not ( = ?auto_189699 ?auto_189703 ) ) ( not ( = ?auto_189701 ?auto_189703 ) ) ( not ( = ?auto_189700 ?auto_189703 ) ) ( not ( = ?auto_189702 ?auto_189703 ) ) ( ON ?auto_189700 ?auto_189702 ) ( ON-TABLE ?auto_189703 ) ( ON ?auto_189701 ?auto_189700 ) ( ON ?auto_189699 ?auto_189701 ) ( ON ?auto_189698 ?auto_189699 ) ( ON ?auto_189697 ?auto_189698 ) ( CLEAR ?auto_189695 ) ( ON ?auto_189696 ?auto_189697 ) ( CLEAR ?auto_189696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189703 ?auto_189702 ?auto_189700 ?auto_189701 ?auto_189699 ?auto_189698 ?auto_189697 )
      ( MAKE-5PILE ?auto_189695 ?auto_189696 ?auto_189697 ?auto_189698 ?auto_189699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189704 - BLOCK
      ?auto_189705 - BLOCK
      ?auto_189706 - BLOCK
      ?auto_189707 - BLOCK
      ?auto_189708 - BLOCK
    )
    :vars
    (
      ?auto_189710 - BLOCK
      ?auto_189709 - BLOCK
      ?auto_189712 - BLOCK
      ?auto_189711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189704 ?auto_189705 ) ) ( not ( = ?auto_189704 ?auto_189706 ) ) ( not ( = ?auto_189704 ?auto_189707 ) ) ( not ( = ?auto_189704 ?auto_189708 ) ) ( not ( = ?auto_189704 ?auto_189710 ) ) ( not ( = ?auto_189705 ?auto_189706 ) ) ( not ( = ?auto_189705 ?auto_189707 ) ) ( not ( = ?auto_189705 ?auto_189708 ) ) ( not ( = ?auto_189705 ?auto_189710 ) ) ( not ( = ?auto_189706 ?auto_189707 ) ) ( not ( = ?auto_189706 ?auto_189708 ) ) ( not ( = ?auto_189706 ?auto_189710 ) ) ( not ( = ?auto_189707 ?auto_189708 ) ) ( not ( = ?auto_189707 ?auto_189710 ) ) ( not ( = ?auto_189708 ?auto_189710 ) ) ( not ( = ?auto_189704 ?auto_189709 ) ) ( not ( = ?auto_189704 ?auto_189712 ) ) ( not ( = ?auto_189705 ?auto_189709 ) ) ( not ( = ?auto_189705 ?auto_189712 ) ) ( not ( = ?auto_189706 ?auto_189709 ) ) ( not ( = ?auto_189706 ?auto_189712 ) ) ( not ( = ?auto_189707 ?auto_189709 ) ) ( not ( = ?auto_189707 ?auto_189712 ) ) ( not ( = ?auto_189708 ?auto_189709 ) ) ( not ( = ?auto_189708 ?auto_189712 ) ) ( not ( = ?auto_189710 ?auto_189709 ) ) ( not ( = ?auto_189710 ?auto_189712 ) ) ( not ( = ?auto_189709 ?auto_189712 ) ) ( ON ?auto_189712 ?auto_189711 ) ( not ( = ?auto_189704 ?auto_189711 ) ) ( not ( = ?auto_189705 ?auto_189711 ) ) ( not ( = ?auto_189706 ?auto_189711 ) ) ( not ( = ?auto_189707 ?auto_189711 ) ) ( not ( = ?auto_189708 ?auto_189711 ) ) ( not ( = ?auto_189710 ?auto_189711 ) ) ( not ( = ?auto_189709 ?auto_189711 ) ) ( not ( = ?auto_189712 ?auto_189711 ) ) ( ON ?auto_189709 ?auto_189712 ) ( ON-TABLE ?auto_189711 ) ( ON ?auto_189710 ?auto_189709 ) ( ON ?auto_189708 ?auto_189710 ) ( ON ?auto_189707 ?auto_189708 ) ( ON ?auto_189706 ?auto_189707 ) ( ON ?auto_189705 ?auto_189706 ) ( CLEAR ?auto_189705 ) ( HOLDING ?auto_189704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189704 )
      ( MAKE-5PILE ?auto_189704 ?auto_189705 ?auto_189706 ?auto_189707 ?auto_189708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189713 - BLOCK
      ?auto_189714 - BLOCK
      ?auto_189715 - BLOCK
      ?auto_189716 - BLOCK
      ?auto_189717 - BLOCK
    )
    :vars
    (
      ?auto_189718 - BLOCK
      ?auto_189720 - BLOCK
      ?auto_189721 - BLOCK
      ?auto_189719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189713 ?auto_189714 ) ) ( not ( = ?auto_189713 ?auto_189715 ) ) ( not ( = ?auto_189713 ?auto_189716 ) ) ( not ( = ?auto_189713 ?auto_189717 ) ) ( not ( = ?auto_189713 ?auto_189718 ) ) ( not ( = ?auto_189714 ?auto_189715 ) ) ( not ( = ?auto_189714 ?auto_189716 ) ) ( not ( = ?auto_189714 ?auto_189717 ) ) ( not ( = ?auto_189714 ?auto_189718 ) ) ( not ( = ?auto_189715 ?auto_189716 ) ) ( not ( = ?auto_189715 ?auto_189717 ) ) ( not ( = ?auto_189715 ?auto_189718 ) ) ( not ( = ?auto_189716 ?auto_189717 ) ) ( not ( = ?auto_189716 ?auto_189718 ) ) ( not ( = ?auto_189717 ?auto_189718 ) ) ( not ( = ?auto_189713 ?auto_189720 ) ) ( not ( = ?auto_189713 ?auto_189721 ) ) ( not ( = ?auto_189714 ?auto_189720 ) ) ( not ( = ?auto_189714 ?auto_189721 ) ) ( not ( = ?auto_189715 ?auto_189720 ) ) ( not ( = ?auto_189715 ?auto_189721 ) ) ( not ( = ?auto_189716 ?auto_189720 ) ) ( not ( = ?auto_189716 ?auto_189721 ) ) ( not ( = ?auto_189717 ?auto_189720 ) ) ( not ( = ?auto_189717 ?auto_189721 ) ) ( not ( = ?auto_189718 ?auto_189720 ) ) ( not ( = ?auto_189718 ?auto_189721 ) ) ( not ( = ?auto_189720 ?auto_189721 ) ) ( ON ?auto_189721 ?auto_189719 ) ( not ( = ?auto_189713 ?auto_189719 ) ) ( not ( = ?auto_189714 ?auto_189719 ) ) ( not ( = ?auto_189715 ?auto_189719 ) ) ( not ( = ?auto_189716 ?auto_189719 ) ) ( not ( = ?auto_189717 ?auto_189719 ) ) ( not ( = ?auto_189718 ?auto_189719 ) ) ( not ( = ?auto_189720 ?auto_189719 ) ) ( not ( = ?auto_189721 ?auto_189719 ) ) ( ON ?auto_189720 ?auto_189721 ) ( ON-TABLE ?auto_189719 ) ( ON ?auto_189718 ?auto_189720 ) ( ON ?auto_189717 ?auto_189718 ) ( ON ?auto_189716 ?auto_189717 ) ( ON ?auto_189715 ?auto_189716 ) ( ON ?auto_189714 ?auto_189715 ) ( ON ?auto_189713 ?auto_189714 ) ( CLEAR ?auto_189713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189719 ?auto_189721 ?auto_189720 ?auto_189718 ?auto_189717 ?auto_189716 ?auto_189715 ?auto_189714 )
      ( MAKE-5PILE ?auto_189713 ?auto_189714 ?auto_189715 ?auto_189716 ?auto_189717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189725 - BLOCK
      ?auto_189726 - BLOCK
      ?auto_189727 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_189727 ) ( CLEAR ?auto_189726 ) ( ON-TABLE ?auto_189725 ) ( ON ?auto_189726 ?auto_189725 ) ( not ( = ?auto_189725 ?auto_189726 ) ) ( not ( = ?auto_189725 ?auto_189727 ) ) ( not ( = ?auto_189726 ?auto_189727 ) ) )
    :subtasks
    ( ( !STACK ?auto_189727 ?auto_189726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189728 - BLOCK
      ?auto_189729 - BLOCK
      ?auto_189730 - BLOCK
    )
    :vars
    (
      ?auto_189731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189729 ) ( ON-TABLE ?auto_189728 ) ( ON ?auto_189729 ?auto_189728 ) ( not ( = ?auto_189728 ?auto_189729 ) ) ( not ( = ?auto_189728 ?auto_189730 ) ) ( not ( = ?auto_189729 ?auto_189730 ) ) ( ON ?auto_189730 ?auto_189731 ) ( CLEAR ?auto_189730 ) ( HAND-EMPTY ) ( not ( = ?auto_189728 ?auto_189731 ) ) ( not ( = ?auto_189729 ?auto_189731 ) ) ( not ( = ?auto_189730 ?auto_189731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189730 ?auto_189731 )
      ( MAKE-3PILE ?auto_189728 ?auto_189729 ?auto_189730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189732 - BLOCK
      ?auto_189733 - BLOCK
      ?auto_189734 - BLOCK
    )
    :vars
    (
      ?auto_189735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189732 ) ( not ( = ?auto_189732 ?auto_189733 ) ) ( not ( = ?auto_189732 ?auto_189734 ) ) ( not ( = ?auto_189733 ?auto_189734 ) ) ( ON ?auto_189734 ?auto_189735 ) ( CLEAR ?auto_189734 ) ( not ( = ?auto_189732 ?auto_189735 ) ) ( not ( = ?auto_189733 ?auto_189735 ) ) ( not ( = ?auto_189734 ?auto_189735 ) ) ( HOLDING ?auto_189733 ) ( CLEAR ?auto_189732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189732 ?auto_189733 )
      ( MAKE-3PILE ?auto_189732 ?auto_189733 ?auto_189734 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189736 - BLOCK
      ?auto_189737 - BLOCK
      ?auto_189738 - BLOCK
    )
    :vars
    (
      ?auto_189739 - BLOCK
      ?auto_189740 - BLOCK
      ?auto_189742 - BLOCK
      ?auto_189741 - BLOCK
      ?auto_189743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_189736 ) ( not ( = ?auto_189736 ?auto_189737 ) ) ( not ( = ?auto_189736 ?auto_189738 ) ) ( not ( = ?auto_189737 ?auto_189738 ) ) ( ON ?auto_189738 ?auto_189739 ) ( not ( = ?auto_189736 ?auto_189739 ) ) ( not ( = ?auto_189737 ?auto_189739 ) ) ( not ( = ?auto_189738 ?auto_189739 ) ) ( CLEAR ?auto_189736 ) ( ON ?auto_189737 ?auto_189738 ) ( CLEAR ?auto_189737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189740 ) ( ON ?auto_189742 ?auto_189740 ) ( ON ?auto_189741 ?auto_189742 ) ( ON ?auto_189743 ?auto_189741 ) ( ON ?auto_189739 ?auto_189743 ) ( not ( = ?auto_189740 ?auto_189742 ) ) ( not ( = ?auto_189740 ?auto_189741 ) ) ( not ( = ?auto_189740 ?auto_189743 ) ) ( not ( = ?auto_189740 ?auto_189739 ) ) ( not ( = ?auto_189740 ?auto_189738 ) ) ( not ( = ?auto_189740 ?auto_189737 ) ) ( not ( = ?auto_189742 ?auto_189741 ) ) ( not ( = ?auto_189742 ?auto_189743 ) ) ( not ( = ?auto_189742 ?auto_189739 ) ) ( not ( = ?auto_189742 ?auto_189738 ) ) ( not ( = ?auto_189742 ?auto_189737 ) ) ( not ( = ?auto_189741 ?auto_189743 ) ) ( not ( = ?auto_189741 ?auto_189739 ) ) ( not ( = ?auto_189741 ?auto_189738 ) ) ( not ( = ?auto_189741 ?auto_189737 ) ) ( not ( = ?auto_189743 ?auto_189739 ) ) ( not ( = ?auto_189743 ?auto_189738 ) ) ( not ( = ?auto_189743 ?auto_189737 ) ) ( not ( = ?auto_189736 ?auto_189740 ) ) ( not ( = ?auto_189736 ?auto_189742 ) ) ( not ( = ?auto_189736 ?auto_189741 ) ) ( not ( = ?auto_189736 ?auto_189743 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189740 ?auto_189742 ?auto_189741 ?auto_189743 ?auto_189739 ?auto_189738 )
      ( MAKE-3PILE ?auto_189736 ?auto_189737 ?auto_189738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189744 - BLOCK
      ?auto_189745 - BLOCK
      ?auto_189746 - BLOCK
    )
    :vars
    (
      ?auto_189747 - BLOCK
      ?auto_189748 - BLOCK
      ?auto_189751 - BLOCK
      ?auto_189750 - BLOCK
      ?auto_189749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189744 ?auto_189745 ) ) ( not ( = ?auto_189744 ?auto_189746 ) ) ( not ( = ?auto_189745 ?auto_189746 ) ) ( ON ?auto_189746 ?auto_189747 ) ( not ( = ?auto_189744 ?auto_189747 ) ) ( not ( = ?auto_189745 ?auto_189747 ) ) ( not ( = ?auto_189746 ?auto_189747 ) ) ( ON ?auto_189745 ?auto_189746 ) ( CLEAR ?auto_189745 ) ( ON-TABLE ?auto_189748 ) ( ON ?auto_189751 ?auto_189748 ) ( ON ?auto_189750 ?auto_189751 ) ( ON ?auto_189749 ?auto_189750 ) ( ON ?auto_189747 ?auto_189749 ) ( not ( = ?auto_189748 ?auto_189751 ) ) ( not ( = ?auto_189748 ?auto_189750 ) ) ( not ( = ?auto_189748 ?auto_189749 ) ) ( not ( = ?auto_189748 ?auto_189747 ) ) ( not ( = ?auto_189748 ?auto_189746 ) ) ( not ( = ?auto_189748 ?auto_189745 ) ) ( not ( = ?auto_189751 ?auto_189750 ) ) ( not ( = ?auto_189751 ?auto_189749 ) ) ( not ( = ?auto_189751 ?auto_189747 ) ) ( not ( = ?auto_189751 ?auto_189746 ) ) ( not ( = ?auto_189751 ?auto_189745 ) ) ( not ( = ?auto_189750 ?auto_189749 ) ) ( not ( = ?auto_189750 ?auto_189747 ) ) ( not ( = ?auto_189750 ?auto_189746 ) ) ( not ( = ?auto_189750 ?auto_189745 ) ) ( not ( = ?auto_189749 ?auto_189747 ) ) ( not ( = ?auto_189749 ?auto_189746 ) ) ( not ( = ?auto_189749 ?auto_189745 ) ) ( not ( = ?auto_189744 ?auto_189748 ) ) ( not ( = ?auto_189744 ?auto_189751 ) ) ( not ( = ?auto_189744 ?auto_189750 ) ) ( not ( = ?auto_189744 ?auto_189749 ) ) ( HOLDING ?auto_189744 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189744 )
      ( MAKE-3PILE ?auto_189744 ?auto_189745 ?auto_189746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189752 - BLOCK
      ?auto_189753 - BLOCK
      ?auto_189754 - BLOCK
    )
    :vars
    (
      ?auto_189756 - BLOCK
      ?auto_189759 - BLOCK
      ?auto_189757 - BLOCK
      ?auto_189755 - BLOCK
      ?auto_189758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189752 ?auto_189753 ) ) ( not ( = ?auto_189752 ?auto_189754 ) ) ( not ( = ?auto_189753 ?auto_189754 ) ) ( ON ?auto_189754 ?auto_189756 ) ( not ( = ?auto_189752 ?auto_189756 ) ) ( not ( = ?auto_189753 ?auto_189756 ) ) ( not ( = ?auto_189754 ?auto_189756 ) ) ( ON ?auto_189753 ?auto_189754 ) ( ON-TABLE ?auto_189759 ) ( ON ?auto_189757 ?auto_189759 ) ( ON ?auto_189755 ?auto_189757 ) ( ON ?auto_189758 ?auto_189755 ) ( ON ?auto_189756 ?auto_189758 ) ( not ( = ?auto_189759 ?auto_189757 ) ) ( not ( = ?auto_189759 ?auto_189755 ) ) ( not ( = ?auto_189759 ?auto_189758 ) ) ( not ( = ?auto_189759 ?auto_189756 ) ) ( not ( = ?auto_189759 ?auto_189754 ) ) ( not ( = ?auto_189759 ?auto_189753 ) ) ( not ( = ?auto_189757 ?auto_189755 ) ) ( not ( = ?auto_189757 ?auto_189758 ) ) ( not ( = ?auto_189757 ?auto_189756 ) ) ( not ( = ?auto_189757 ?auto_189754 ) ) ( not ( = ?auto_189757 ?auto_189753 ) ) ( not ( = ?auto_189755 ?auto_189758 ) ) ( not ( = ?auto_189755 ?auto_189756 ) ) ( not ( = ?auto_189755 ?auto_189754 ) ) ( not ( = ?auto_189755 ?auto_189753 ) ) ( not ( = ?auto_189758 ?auto_189756 ) ) ( not ( = ?auto_189758 ?auto_189754 ) ) ( not ( = ?auto_189758 ?auto_189753 ) ) ( not ( = ?auto_189752 ?auto_189759 ) ) ( not ( = ?auto_189752 ?auto_189757 ) ) ( not ( = ?auto_189752 ?auto_189755 ) ) ( not ( = ?auto_189752 ?auto_189758 ) ) ( ON ?auto_189752 ?auto_189753 ) ( CLEAR ?auto_189752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189759 ?auto_189757 ?auto_189755 ?auto_189758 ?auto_189756 ?auto_189754 ?auto_189753 )
      ( MAKE-3PILE ?auto_189752 ?auto_189753 ?auto_189754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189760 - BLOCK
      ?auto_189761 - BLOCK
      ?auto_189762 - BLOCK
    )
    :vars
    (
      ?auto_189764 - BLOCK
      ?auto_189766 - BLOCK
      ?auto_189767 - BLOCK
      ?auto_189763 - BLOCK
      ?auto_189765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189760 ?auto_189761 ) ) ( not ( = ?auto_189760 ?auto_189762 ) ) ( not ( = ?auto_189761 ?auto_189762 ) ) ( ON ?auto_189762 ?auto_189764 ) ( not ( = ?auto_189760 ?auto_189764 ) ) ( not ( = ?auto_189761 ?auto_189764 ) ) ( not ( = ?auto_189762 ?auto_189764 ) ) ( ON ?auto_189761 ?auto_189762 ) ( ON-TABLE ?auto_189766 ) ( ON ?auto_189767 ?auto_189766 ) ( ON ?auto_189763 ?auto_189767 ) ( ON ?auto_189765 ?auto_189763 ) ( ON ?auto_189764 ?auto_189765 ) ( not ( = ?auto_189766 ?auto_189767 ) ) ( not ( = ?auto_189766 ?auto_189763 ) ) ( not ( = ?auto_189766 ?auto_189765 ) ) ( not ( = ?auto_189766 ?auto_189764 ) ) ( not ( = ?auto_189766 ?auto_189762 ) ) ( not ( = ?auto_189766 ?auto_189761 ) ) ( not ( = ?auto_189767 ?auto_189763 ) ) ( not ( = ?auto_189767 ?auto_189765 ) ) ( not ( = ?auto_189767 ?auto_189764 ) ) ( not ( = ?auto_189767 ?auto_189762 ) ) ( not ( = ?auto_189767 ?auto_189761 ) ) ( not ( = ?auto_189763 ?auto_189765 ) ) ( not ( = ?auto_189763 ?auto_189764 ) ) ( not ( = ?auto_189763 ?auto_189762 ) ) ( not ( = ?auto_189763 ?auto_189761 ) ) ( not ( = ?auto_189765 ?auto_189764 ) ) ( not ( = ?auto_189765 ?auto_189762 ) ) ( not ( = ?auto_189765 ?auto_189761 ) ) ( not ( = ?auto_189760 ?auto_189766 ) ) ( not ( = ?auto_189760 ?auto_189767 ) ) ( not ( = ?auto_189760 ?auto_189763 ) ) ( not ( = ?auto_189760 ?auto_189765 ) ) ( HOLDING ?auto_189760 ) ( CLEAR ?auto_189761 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189766 ?auto_189767 ?auto_189763 ?auto_189765 ?auto_189764 ?auto_189762 ?auto_189761 ?auto_189760 )
      ( MAKE-3PILE ?auto_189760 ?auto_189761 ?auto_189762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189768 - BLOCK
      ?auto_189769 - BLOCK
      ?auto_189770 - BLOCK
    )
    :vars
    (
      ?auto_189771 - BLOCK
      ?auto_189774 - BLOCK
      ?auto_189775 - BLOCK
      ?auto_189773 - BLOCK
      ?auto_189772 - BLOCK
      ?auto_189776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189768 ?auto_189769 ) ) ( not ( = ?auto_189768 ?auto_189770 ) ) ( not ( = ?auto_189769 ?auto_189770 ) ) ( ON ?auto_189770 ?auto_189771 ) ( not ( = ?auto_189768 ?auto_189771 ) ) ( not ( = ?auto_189769 ?auto_189771 ) ) ( not ( = ?auto_189770 ?auto_189771 ) ) ( ON ?auto_189769 ?auto_189770 ) ( ON-TABLE ?auto_189774 ) ( ON ?auto_189775 ?auto_189774 ) ( ON ?auto_189773 ?auto_189775 ) ( ON ?auto_189772 ?auto_189773 ) ( ON ?auto_189771 ?auto_189772 ) ( not ( = ?auto_189774 ?auto_189775 ) ) ( not ( = ?auto_189774 ?auto_189773 ) ) ( not ( = ?auto_189774 ?auto_189772 ) ) ( not ( = ?auto_189774 ?auto_189771 ) ) ( not ( = ?auto_189774 ?auto_189770 ) ) ( not ( = ?auto_189774 ?auto_189769 ) ) ( not ( = ?auto_189775 ?auto_189773 ) ) ( not ( = ?auto_189775 ?auto_189772 ) ) ( not ( = ?auto_189775 ?auto_189771 ) ) ( not ( = ?auto_189775 ?auto_189770 ) ) ( not ( = ?auto_189775 ?auto_189769 ) ) ( not ( = ?auto_189773 ?auto_189772 ) ) ( not ( = ?auto_189773 ?auto_189771 ) ) ( not ( = ?auto_189773 ?auto_189770 ) ) ( not ( = ?auto_189773 ?auto_189769 ) ) ( not ( = ?auto_189772 ?auto_189771 ) ) ( not ( = ?auto_189772 ?auto_189770 ) ) ( not ( = ?auto_189772 ?auto_189769 ) ) ( not ( = ?auto_189768 ?auto_189774 ) ) ( not ( = ?auto_189768 ?auto_189775 ) ) ( not ( = ?auto_189768 ?auto_189773 ) ) ( not ( = ?auto_189768 ?auto_189772 ) ) ( CLEAR ?auto_189769 ) ( ON ?auto_189768 ?auto_189776 ) ( CLEAR ?auto_189768 ) ( HAND-EMPTY ) ( not ( = ?auto_189768 ?auto_189776 ) ) ( not ( = ?auto_189769 ?auto_189776 ) ) ( not ( = ?auto_189770 ?auto_189776 ) ) ( not ( = ?auto_189771 ?auto_189776 ) ) ( not ( = ?auto_189774 ?auto_189776 ) ) ( not ( = ?auto_189775 ?auto_189776 ) ) ( not ( = ?auto_189773 ?auto_189776 ) ) ( not ( = ?auto_189772 ?auto_189776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189768 ?auto_189776 )
      ( MAKE-3PILE ?auto_189768 ?auto_189769 ?auto_189770 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189777 - BLOCK
      ?auto_189778 - BLOCK
      ?auto_189779 - BLOCK
    )
    :vars
    (
      ?auto_189780 - BLOCK
      ?auto_189784 - BLOCK
      ?auto_189783 - BLOCK
      ?auto_189781 - BLOCK
      ?auto_189782 - BLOCK
      ?auto_189785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189777 ?auto_189778 ) ) ( not ( = ?auto_189777 ?auto_189779 ) ) ( not ( = ?auto_189778 ?auto_189779 ) ) ( ON ?auto_189779 ?auto_189780 ) ( not ( = ?auto_189777 ?auto_189780 ) ) ( not ( = ?auto_189778 ?auto_189780 ) ) ( not ( = ?auto_189779 ?auto_189780 ) ) ( ON-TABLE ?auto_189784 ) ( ON ?auto_189783 ?auto_189784 ) ( ON ?auto_189781 ?auto_189783 ) ( ON ?auto_189782 ?auto_189781 ) ( ON ?auto_189780 ?auto_189782 ) ( not ( = ?auto_189784 ?auto_189783 ) ) ( not ( = ?auto_189784 ?auto_189781 ) ) ( not ( = ?auto_189784 ?auto_189782 ) ) ( not ( = ?auto_189784 ?auto_189780 ) ) ( not ( = ?auto_189784 ?auto_189779 ) ) ( not ( = ?auto_189784 ?auto_189778 ) ) ( not ( = ?auto_189783 ?auto_189781 ) ) ( not ( = ?auto_189783 ?auto_189782 ) ) ( not ( = ?auto_189783 ?auto_189780 ) ) ( not ( = ?auto_189783 ?auto_189779 ) ) ( not ( = ?auto_189783 ?auto_189778 ) ) ( not ( = ?auto_189781 ?auto_189782 ) ) ( not ( = ?auto_189781 ?auto_189780 ) ) ( not ( = ?auto_189781 ?auto_189779 ) ) ( not ( = ?auto_189781 ?auto_189778 ) ) ( not ( = ?auto_189782 ?auto_189780 ) ) ( not ( = ?auto_189782 ?auto_189779 ) ) ( not ( = ?auto_189782 ?auto_189778 ) ) ( not ( = ?auto_189777 ?auto_189784 ) ) ( not ( = ?auto_189777 ?auto_189783 ) ) ( not ( = ?auto_189777 ?auto_189781 ) ) ( not ( = ?auto_189777 ?auto_189782 ) ) ( ON ?auto_189777 ?auto_189785 ) ( CLEAR ?auto_189777 ) ( not ( = ?auto_189777 ?auto_189785 ) ) ( not ( = ?auto_189778 ?auto_189785 ) ) ( not ( = ?auto_189779 ?auto_189785 ) ) ( not ( = ?auto_189780 ?auto_189785 ) ) ( not ( = ?auto_189784 ?auto_189785 ) ) ( not ( = ?auto_189783 ?auto_189785 ) ) ( not ( = ?auto_189781 ?auto_189785 ) ) ( not ( = ?auto_189782 ?auto_189785 ) ) ( HOLDING ?auto_189778 ) ( CLEAR ?auto_189779 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189784 ?auto_189783 ?auto_189781 ?auto_189782 ?auto_189780 ?auto_189779 ?auto_189778 )
      ( MAKE-3PILE ?auto_189777 ?auto_189778 ?auto_189779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189786 - BLOCK
      ?auto_189787 - BLOCK
      ?auto_189788 - BLOCK
    )
    :vars
    (
      ?auto_189793 - BLOCK
      ?auto_189791 - BLOCK
      ?auto_189790 - BLOCK
      ?auto_189792 - BLOCK
      ?auto_189794 - BLOCK
      ?auto_189789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189786 ?auto_189787 ) ) ( not ( = ?auto_189786 ?auto_189788 ) ) ( not ( = ?auto_189787 ?auto_189788 ) ) ( ON ?auto_189788 ?auto_189793 ) ( not ( = ?auto_189786 ?auto_189793 ) ) ( not ( = ?auto_189787 ?auto_189793 ) ) ( not ( = ?auto_189788 ?auto_189793 ) ) ( ON-TABLE ?auto_189791 ) ( ON ?auto_189790 ?auto_189791 ) ( ON ?auto_189792 ?auto_189790 ) ( ON ?auto_189794 ?auto_189792 ) ( ON ?auto_189793 ?auto_189794 ) ( not ( = ?auto_189791 ?auto_189790 ) ) ( not ( = ?auto_189791 ?auto_189792 ) ) ( not ( = ?auto_189791 ?auto_189794 ) ) ( not ( = ?auto_189791 ?auto_189793 ) ) ( not ( = ?auto_189791 ?auto_189788 ) ) ( not ( = ?auto_189791 ?auto_189787 ) ) ( not ( = ?auto_189790 ?auto_189792 ) ) ( not ( = ?auto_189790 ?auto_189794 ) ) ( not ( = ?auto_189790 ?auto_189793 ) ) ( not ( = ?auto_189790 ?auto_189788 ) ) ( not ( = ?auto_189790 ?auto_189787 ) ) ( not ( = ?auto_189792 ?auto_189794 ) ) ( not ( = ?auto_189792 ?auto_189793 ) ) ( not ( = ?auto_189792 ?auto_189788 ) ) ( not ( = ?auto_189792 ?auto_189787 ) ) ( not ( = ?auto_189794 ?auto_189793 ) ) ( not ( = ?auto_189794 ?auto_189788 ) ) ( not ( = ?auto_189794 ?auto_189787 ) ) ( not ( = ?auto_189786 ?auto_189791 ) ) ( not ( = ?auto_189786 ?auto_189790 ) ) ( not ( = ?auto_189786 ?auto_189792 ) ) ( not ( = ?auto_189786 ?auto_189794 ) ) ( ON ?auto_189786 ?auto_189789 ) ( not ( = ?auto_189786 ?auto_189789 ) ) ( not ( = ?auto_189787 ?auto_189789 ) ) ( not ( = ?auto_189788 ?auto_189789 ) ) ( not ( = ?auto_189793 ?auto_189789 ) ) ( not ( = ?auto_189791 ?auto_189789 ) ) ( not ( = ?auto_189790 ?auto_189789 ) ) ( not ( = ?auto_189792 ?auto_189789 ) ) ( not ( = ?auto_189794 ?auto_189789 ) ) ( CLEAR ?auto_189788 ) ( ON ?auto_189787 ?auto_189786 ) ( CLEAR ?auto_189787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189789 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189789 ?auto_189786 )
      ( MAKE-3PILE ?auto_189786 ?auto_189787 ?auto_189788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189795 - BLOCK
      ?auto_189796 - BLOCK
      ?auto_189797 - BLOCK
    )
    :vars
    (
      ?auto_189803 - BLOCK
      ?auto_189798 - BLOCK
      ?auto_189799 - BLOCK
      ?auto_189802 - BLOCK
      ?auto_189801 - BLOCK
      ?auto_189800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189795 ?auto_189796 ) ) ( not ( = ?auto_189795 ?auto_189797 ) ) ( not ( = ?auto_189796 ?auto_189797 ) ) ( not ( = ?auto_189795 ?auto_189803 ) ) ( not ( = ?auto_189796 ?auto_189803 ) ) ( not ( = ?auto_189797 ?auto_189803 ) ) ( ON-TABLE ?auto_189798 ) ( ON ?auto_189799 ?auto_189798 ) ( ON ?auto_189802 ?auto_189799 ) ( ON ?auto_189801 ?auto_189802 ) ( ON ?auto_189803 ?auto_189801 ) ( not ( = ?auto_189798 ?auto_189799 ) ) ( not ( = ?auto_189798 ?auto_189802 ) ) ( not ( = ?auto_189798 ?auto_189801 ) ) ( not ( = ?auto_189798 ?auto_189803 ) ) ( not ( = ?auto_189798 ?auto_189797 ) ) ( not ( = ?auto_189798 ?auto_189796 ) ) ( not ( = ?auto_189799 ?auto_189802 ) ) ( not ( = ?auto_189799 ?auto_189801 ) ) ( not ( = ?auto_189799 ?auto_189803 ) ) ( not ( = ?auto_189799 ?auto_189797 ) ) ( not ( = ?auto_189799 ?auto_189796 ) ) ( not ( = ?auto_189802 ?auto_189801 ) ) ( not ( = ?auto_189802 ?auto_189803 ) ) ( not ( = ?auto_189802 ?auto_189797 ) ) ( not ( = ?auto_189802 ?auto_189796 ) ) ( not ( = ?auto_189801 ?auto_189803 ) ) ( not ( = ?auto_189801 ?auto_189797 ) ) ( not ( = ?auto_189801 ?auto_189796 ) ) ( not ( = ?auto_189795 ?auto_189798 ) ) ( not ( = ?auto_189795 ?auto_189799 ) ) ( not ( = ?auto_189795 ?auto_189802 ) ) ( not ( = ?auto_189795 ?auto_189801 ) ) ( ON ?auto_189795 ?auto_189800 ) ( not ( = ?auto_189795 ?auto_189800 ) ) ( not ( = ?auto_189796 ?auto_189800 ) ) ( not ( = ?auto_189797 ?auto_189800 ) ) ( not ( = ?auto_189803 ?auto_189800 ) ) ( not ( = ?auto_189798 ?auto_189800 ) ) ( not ( = ?auto_189799 ?auto_189800 ) ) ( not ( = ?auto_189802 ?auto_189800 ) ) ( not ( = ?auto_189801 ?auto_189800 ) ) ( ON ?auto_189796 ?auto_189795 ) ( CLEAR ?auto_189796 ) ( ON-TABLE ?auto_189800 ) ( HOLDING ?auto_189797 ) ( CLEAR ?auto_189803 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189798 ?auto_189799 ?auto_189802 ?auto_189801 ?auto_189803 ?auto_189797 )
      ( MAKE-3PILE ?auto_189795 ?auto_189796 ?auto_189797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189804 - BLOCK
      ?auto_189805 - BLOCK
      ?auto_189806 - BLOCK
    )
    :vars
    (
      ?auto_189812 - BLOCK
      ?auto_189809 - BLOCK
      ?auto_189807 - BLOCK
      ?auto_189810 - BLOCK
      ?auto_189808 - BLOCK
      ?auto_189811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189804 ?auto_189805 ) ) ( not ( = ?auto_189804 ?auto_189806 ) ) ( not ( = ?auto_189805 ?auto_189806 ) ) ( not ( = ?auto_189804 ?auto_189812 ) ) ( not ( = ?auto_189805 ?auto_189812 ) ) ( not ( = ?auto_189806 ?auto_189812 ) ) ( ON-TABLE ?auto_189809 ) ( ON ?auto_189807 ?auto_189809 ) ( ON ?auto_189810 ?auto_189807 ) ( ON ?auto_189808 ?auto_189810 ) ( ON ?auto_189812 ?auto_189808 ) ( not ( = ?auto_189809 ?auto_189807 ) ) ( not ( = ?auto_189809 ?auto_189810 ) ) ( not ( = ?auto_189809 ?auto_189808 ) ) ( not ( = ?auto_189809 ?auto_189812 ) ) ( not ( = ?auto_189809 ?auto_189806 ) ) ( not ( = ?auto_189809 ?auto_189805 ) ) ( not ( = ?auto_189807 ?auto_189810 ) ) ( not ( = ?auto_189807 ?auto_189808 ) ) ( not ( = ?auto_189807 ?auto_189812 ) ) ( not ( = ?auto_189807 ?auto_189806 ) ) ( not ( = ?auto_189807 ?auto_189805 ) ) ( not ( = ?auto_189810 ?auto_189808 ) ) ( not ( = ?auto_189810 ?auto_189812 ) ) ( not ( = ?auto_189810 ?auto_189806 ) ) ( not ( = ?auto_189810 ?auto_189805 ) ) ( not ( = ?auto_189808 ?auto_189812 ) ) ( not ( = ?auto_189808 ?auto_189806 ) ) ( not ( = ?auto_189808 ?auto_189805 ) ) ( not ( = ?auto_189804 ?auto_189809 ) ) ( not ( = ?auto_189804 ?auto_189807 ) ) ( not ( = ?auto_189804 ?auto_189810 ) ) ( not ( = ?auto_189804 ?auto_189808 ) ) ( ON ?auto_189804 ?auto_189811 ) ( not ( = ?auto_189804 ?auto_189811 ) ) ( not ( = ?auto_189805 ?auto_189811 ) ) ( not ( = ?auto_189806 ?auto_189811 ) ) ( not ( = ?auto_189812 ?auto_189811 ) ) ( not ( = ?auto_189809 ?auto_189811 ) ) ( not ( = ?auto_189807 ?auto_189811 ) ) ( not ( = ?auto_189810 ?auto_189811 ) ) ( not ( = ?auto_189808 ?auto_189811 ) ) ( ON ?auto_189805 ?auto_189804 ) ( ON-TABLE ?auto_189811 ) ( CLEAR ?auto_189812 ) ( ON ?auto_189806 ?auto_189805 ) ( CLEAR ?auto_189806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189811 ?auto_189804 ?auto_189805 )
      ( MAKE-3PILE ?auto_189804 ?auto_189805 ?auto_189806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189813 - BLOCK
      ?auto_189814 - BLOCK
      ?auto_189815 - BLOCK
    )
    :vars
    (
      ?auto_189819 - BLOCK
      ?auto_189820 - BLOCK
      ?auto_189817 - BLOCK
      ?auto_189816 - BLOCK
      ?auto_189821 - BLOCK
      ?auto_189818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189813 ?auto_189814 ) ) ( not ( = ?auto_189813 ?auto_189815 ) ) ( not ( = ?auto_189814 ?auto_189815 ) ) ( not ( = ?auto_189813 ?auto_189819 ) ) ( not ( = ?auto_189814 ?auto_189819 ) ) ( not ( = ?auto_189815 ?auto_189819 ) ) ( ON-TABLE ?auto_189820 ) ( ON ?auto_189817 ?auto_189820 ) ( ON ?auto_189816 ?auto_189817 ) ( ON ?auto_189821 ?auto_189816 ) ( not ( = ?auto_189820 ?auto_189817 ) ) ( not ( = ?auto_189820 ?auto_189816 ) ) ( not ( = ?auto_189820 ?auto_189821 ) ) ( not ( = ?auto_189820 ?auto_189819 ) ) ( not ( = ?auto_189820 ?auto_189815 ) ) ( not ( = ?auto_189820 ?auto_189814 ) ) ( not ( = ?auto_189817 ?auto_189816 ) ) ( not ( = ?auto_189817 ?auto_189821 ) ) ( not ( = ?auto_189817 ?auto_189819 ) ) ( not ( = ?auto_189817 ?auto_189815 ) ) ( not ( = ?auto_189817 ?auto_189814 ) ) ( not ( = ?auto_189816 ?auto_189821 ) ) ( not ( = ?auto_189816 ?auto_189819 ) ) ( not ( = ?auto_189816 ?auto_189815 ) ) ( not ( = ?auto_189816 ?auto_189814 ) ) ( not ( = ?auto_189821 ?auto_189819 ) ) ( not ( = ?auto_189821 ?auto_189815 ) ) ( not ( = ?auto_189821 ?auto_189814 ) ) ( not ( = ?auto_189813 ?auto_189820 ) ) ( not ( = ?auto_189813 ?auto_189817 ) ) ( not ( = ?auto_189813 ?auto_189816 ) ) ( not ( = ?auto_189813 ?auto_189821 ) ) ( ON ?auto_189813 ?auto_189818 ) ( not ( = ?auto_189813 ?auto_189818 ) ) ( not ( = ?auto_189814 ?auto_189818 ) ) ( not ( = ?auto_189815 ?auto_189818 ) ) ( not ( = ?auto_189819 ?auto_189818 ) ) ( not ( = ?auto_189820 ?auto_189818 ) ) ( not ( = ?auto_189817 ?auto_189818 ) ) ( not ( = ?auto_189816 ?auto_189818 ) ) ( not ( = ?auto_189821 ?auto_189818 ) ) ( ON ?auto_189814 ?auto_189813 ) ( ON-TABLE ?auto_189818 ) ( ON ?auto_189815 ?auto_189814 ) ( CLEAR ?auto_189815 ) ( HOLDING ?auto_189819 ) ( CLEAR ?auto_189821 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189820 ?auto_189817 ?auto_189816 ?auto_189821 ?auto_189819 )
      ( MAKE-3PILE ?auto_189813 ?auto_189814 ?auto_189815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189822 - BLOCK
      ?auto_189823 - BLOCK
      ?auto_189824 - BLOCK
    )
    :vars
    (
      ?auto_189825 - BLOCK
      ?auto_189828 - BLOCK
      ?auto_189829 - BLOCK
      ?auto_189826 - BLOCK
      ?auto_189830 - BLOCK
      ?auto_189827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189822 ?auto_189823 ) ) ( not ( = ?auto_189822 ?auto_189824 ) ) ( not ( = ?auto_189823 ?auto_189824 ) ) ( not ( = ?auto_189822 ?auto_189825 ) ) ( not ( = ?auto_189823 ?auto_189825 ) ) ( not ( = ?auto_189824 ?auto_189825 ) ) ( ON-TABLE ?auto_189828 ) ( ON ?auto_189829 ?auto_189828 ) ( ON ?auto_189826 ?auto_189829 ) ( ON ?auto_189830 ?auto_189826 ) ( not ( = ?auto_189828 ?auto_189829 ) ) ( not ( = ?auto_189828 ?auto_189826 ) ) ( not ( = ?auto_189828 ?auto_189830 ) ) ( not ( = ?auto_189828 ?auto_189825 ) ) ( not ( = ?auto_189828 ?auto_189824 ) ) ( not ( = ?auto_189828 ?auto_189823 ) ) ( not ( = ?auto_189829 ?auto_189826 ) ) ( not ( = ?auto_189829 ?auto_189830 ) ) ( not ( = ?auto_189829 ?auto_189825 ) ) ( not ( = ?auto_189829 ?auto_189824 ) ) ( not ( = ?auto_189829 ?auto_189823 ) ) ( not ( = ?auto_189826 ?auto_189830 ) ) ( not ( = ?auto_189826 ?auto_189825 ) ) ( not ( = ?auto_189826 ?auto_189824 ) ) ( not ( = ?auto_189826 ?auto_189823 ) ) ( not ( = ?auto_189830 ?auto_189825 ) ) ( not ( = ?auto_189830 ?auto_189824 ) ) ( not ( = ?auto_189830 ?auto_189823 ) ) ( not ( = ?auto_189822 ?auto_189828 ) ) ( not ( = ?auto_189822 ?auto_189829 ) ) ( not ( = ?auto_189822 ?auto_189826 ) ) ( not ( = ?auto_189822 ?auto_189830 ) ) ( ON ?auto_189822 ?auto_189827 ) ( not ( = ?auto_189822 ?auto_189827 ) ) ( not ( = ?auto_189823 ?auto_189827 ) ) ( not ( = ?auto_189824 ?auto_189827 ) ) ( not ( = ?auto_189825 ?auto_189827 ) ) ( not ( = ?auto_189828 ?auto_189827 ) ) ( not ( = ?auto_189829 ?auto_189827 ) ) ( not ( = ?auto_189826 ?auto_189827 ) ) ( not ( = ?auto_189830 ?auto_189827 ) ) ( ON ?auto_189823 ?auto_189822 ) ( ON-TABLE ?auto_189827 ) ( ON ?auto_189824 ?auto_189823 ) ( CLEAR ?auto_189830 ) ( ON ?auto_189825 ?auto_189824 ) ( CLEAR ?auto_189825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189827 ?auto_189822 ?auto_189823 ?auto_189824 )
      ( MAKE-3PILE ?auto_189822 ?auto_189823 ?auto_189824 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189831 - BLOCK
      ?auto_189832 - BLOCK
      ?auto_189833 - BLOCK
    )
    :vars
    (
      ?auto_189838 - BLOCK
      ?auto_189835 - BLOCK
      ?auto_189837 - BLOCK
      ?auto_189836 - BLOCK
      ?auto_189834 - BLOCK
      ?auto_189839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189831 ?auto_189832 ) ) ( not ( = ?auto_189831 ?auto_189833 ) ) ( not ( = ?auto_189832 ?auto_189833 ) ) ( not ( = ?auto_189831 ?auto_189838 ) ) ( not ( = ?auto_189832 ?auto_189838 ) ) ( not ( = ?auto_189833 ?auto_189838 ) ) ( ON-TABLE ?auto_189835 ) ( ON ?auto_189837 ?auto_189835 ) ( ON ?auto_189836 ?auto_189837 ) ( not ( = ?auto_189835 ?auto_189837 ) ) ( not ( = ?auto_189835 ?auto_189836 ) ) ( not ( = ?auto_189835 ?auto_189834 ) ) ( not ( = ?auto_189835 ?auto_189838 ) ) ( not ( = ?auto_189835 ?auto_189833 ) ) ( not ( = ?auto_189835 ?auto_189832 ) ) ( not ( = ?auto_189837 ?auto_189836 ) ) ( not ( = ?auto_189837 ?auto_189834 ) ) ( not ( = ?auto_189837 ?auto_189838 ) ) ( not ( = ?auto_189837 ?auto_189833 ) ) ( not ( = ?auto_189837 ?auto_189832 ) ) ( not ( = ?auto_189836 ?auto_189834 ) ) ( not ( = ?auto_189836 ?auto_189838 ) ) ( not ( = ?auto_189836 ?auto_189833 ) ) ( not ( = ?auto_189836 ?auto_189832 ) ) ( not ( = ?auto_189834 ?auto_189838 ) ) ( not ( = ?auto_189834 ?auto_189833 ) ) ( not ( = ?auto_189834 ?auto_189832 ) ) ( not ( = ?auto_189831 ?auto_189835 ) ) ( not ( = ?auto_189831 ?auto_189837 ) ) ( not ( = ?auto_189831 ?auto_189836 ) ) ( not ( = ?auto_189831 ?auto_189834 ) ) ( ON ?auto_189831 ?auto_189839 ) ( not ( = ?auto_189831 ?auto_189839 ) ) ( not ( = ?auto_189832 ?auto_189839 ) ) ( not ( = ?auto_189833 ?auto_189839 ) ) ( not ( = ?auto_189838 ?auto_189839 ) ) ( not ( = ?auto_189835 ?auto_189839 ) ) ( not ( = ?auto_189837 ?auto_189839 ) ) ( not ( = ?auto_189836 ?auto_189839 ) ) ( not ( = ?auto_189834 ?auto_189839 ) ) ( ON ?auto_189832 ?auto_189831 ) ( ON-TABLE ?auto_189839 ) ( ON ?auto_189833 ?auto_189832 ) ( ON ?auto_189838 ?auto_189833 ) ( CLEAR ?auto_189838 ) ( HOLDING ?auto_189834 ) ( CLEAR ?auto_189836 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189835 ?auto_189837 ?auto_189836 ?auto_189834 )
      ( MAKE-3PILE ?auto_189831 ?auto_189832 ?auto_189833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189840 - BLOCK
      ?auto_189841 - BLOCK
      ?auto_189842 - BLOCK
    )
    :vars
    (
      ?auto_189843 - BLOCK
      ?auto_189846 - BLOCK
      ?auto_189845 - BLOCK
      ?auto_189848 - BLOCK
      ?auto_189844 - BLOCK
      ?auto_189847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189840 ?auto_189841 ) ) ( not ( = ?auto_189840 ?auto_189842 ) ) ( not ( = ?auto_189841 ?auto_189842 ) ) ( not ( = ?auto_189840 ?auto_189843 ) ) ( not ( = ?auto_189841 ?auto_189843 ) ) ( not ( = ?auto_189842 ?auto_189843 ) ) ( ON-TABLE ?auto_189846 ) ( ON ?auto_189845 ?auto_189846 ) ( ON ?auto_189848 ?auto_189845 ) ( not ( = ?auto_189846 ?auto_189845 ) ) ( not ( = ?auto_189846 ?auto_189848 ) ) ( not ( = ?auto_189846 ?auto_189844 ) ) ( not ( = ?auto_189846 ?auto_189843 ) ) ( not ( = ?auto_189846 ?auto_189842 ) ) ( not ( = ?auto_189846 ?auto_189841 ) ) ( not ( = ?auto_189845 ?auto_189848 ) ) ( not ( = ?auto_189845 ?auto_189844 ) ) ( not ( = ?auto_189845 ?auto_189843 ) ) ( not ( = ?auto_189845 ?auto_189842 ) ) ( not ( = ?auto_189845 ?auto_189841 ) ) ( not ( = ?auto_189848 ?auto_189844 ) ) ( not ( = ?auto_189848 ?auto_189843 ) ) ( not ( = ?auto_189848 ?auto_189842 ) ) ( not ( = ?auto_189848 ?auto_189841 ) ) ( not ( = ?auto_189844 ?auto_189843 ) ) ( not ( = ?auto_189844 ?auto_189842 ) ) ( not ( = ?auto_189844 ?auto_189841 ) ) ( not ( = ?auto_189840 ?auto_189846 ) ) ( not ( = ?auto_189840 ?auto_189845 ) ) ( not ( = ?auto_189840 ?auto_189848 ) ) ( not ( = ?auto_189840 ?auto_189844 ) ) ( ON ?auto_189840 ?auto_189847 ) ( not ( = ?auto_189840 ?auto_189847 ) ) ( not ( = ?auto_189841 ?auto_189847 ) ) ( not ( = ?auto_189842 ?auto_189847 ) ) ( not ( = ?auto_189843 ?auto_189847 ) ) ( not ( = ?auto_189846 ?auto_189847 ) ) ( not ( = ?auto_189845 ?auto_189847 ) ) ( not ( = ?auto_189848 ?auto_189847 ) ) ( not ( = ?auto_189844 ?auto_189847 ) ) ( ON ?auto_189841 ?auto_189840 ) ( ON-TABLE ?auto_189847 ) ( ON ?auto_189842 ?auto_189841 ) ( ON ?auto_189843 ?auto_189842 ) ( CLEAR ?auto_189848 ) ( ON ?auto_189844 ?auto_189843 ) ( CLEAR ?auto_189844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189847 ?auto_189840 ?auto_189841 ?auto_189842 ?auto_189843 )
      ( MAKE-3PILE ?auto_189840 ?auto_189841 ?auto_189842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189849 - BLOCK
      ?auto_189850 - BLOCK
      ?auto_189851 - BLOCK
    )
    :vars
    (
      ?auto_189852 - BLOCK
      ?auto_189855 - BLOCK
      ?auto_189857 - BLOCK
      ?auto_189853 - BLOCK
      ?auto_189856 - BLOCK
      ?auto_189854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189849 ?auto_189850 ) ) ( not ( = ?auto_189849 ?auto_189851 ) ) ( not ( = ?auto_189850 ?auto_189851 ) ) ( not ( = ?auto_189849 ?auto_189852 ) ) ( not ( = ?auto_189850 ?auto_189852 ) ) ( not ( = ?auto_189851 ?auto_189852 ) ) ( ON-TABLE ?auto_189855 ) ( ON ?auto_189857 ?auto_189855 ) ( not ( = ?auto_189855 ?auto_189857 ) ) ( not ( = ?auto_189855 ?auto_189853 ) ) ( not ( = ?auto_189855 ?auto_189856 ) ) ( not ( = ?auto_189855 ?auto_189852 ) ) ( not ( = ?auto_189855 ?auto_189851 ) ) ( not ( = ?auto_189855 ?auto_189850 ) ) ( not ( = ?auto_189857 ?auto_189853 ) ) ( not ( = ?auto_189857 ?auto_189856 ) ) ( not ( = ?auto_189857 ?auto_189852 ) ) ( not ( = ?auto_189857 ?auto_189851 ) ) ( not ( = ?auto_189857 ?auto_189850 ) ) ( not ( = ?auto_189853 ?auto_189856 ) ) ( not ( = ?auto_189853 ?auto_189852 ) ) ( not ( = ?auto_189853 ?auto_189851 ) ) ( not ( = ?auto_189853 ?auto_189850 ) ) ( not ( = ?auto_189856 ?auto_189852 ) ) ( not ( = ?auto_189856 ?auto_189851 ) ) ( not ( = ?auto_189856 ?auto_189850 ) ) ( not ( = ?auto_189849 ?auto_189855 ) ) ( not ( = ?auto_189849 ?auto_189857 ) ) ( not ( = ?auto_189849 ?auto_189853 ) ) ( not ( = ?auto_189849 ?auto_189856 ) ) ( ON ?auto_189849 ?auto_189854 ) ( not ( = ?auto_189849 ?auto_189854 ) ) ( not ( = ?auto_189850 ?auto_189854 ) ) ( not ( = ?auto_189851 ?auto_189854 ) ) ( not ( = ?auto_189852 ?auto_189854 ) ) ( not ( = ?auto_189855 ?auto_189854 ) ) ( not ( = ?auto_189857 ?auto_189854 ) ) ( not ( = ?auto_189853 ?auto_189854 ) ) ( not ( = ?auto_189856 ?auto_189854 ) ) ( ON ?auto_189850 ?auto_189849 ) ( ON-TABLE ?auto_189854 ) ( ON ?auto_189851 ?auto_189850 ) ( ON ?auto_189852 ?auto_189851 ) ( ON ?auto_189856 ?auto_189852 ) ( CLEAR ?auto_189856 ) ( HOLDING ?auto_189853 ) ( CLEAR ?auto_189857 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189855 ?auto_189857 ?auto_189853 )
      ( MAKE-3PILE ?auto_189849 ?auto_189850 ?auto_189851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189858 - BLOCK
      ?auto_189859 - BLOCK
      ?auto_189860 - BLOCK
    )
    :vars
    (
      ?auto_189865 - BLOCK
      ?auto_189863 - BLOCK
      ?auto_189861 - BLOCK
      ?auto_189862 - BLOCK
      ?auto_189864 - BLOCK
      ?auto_189866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189858 ?auto_189859 ) ) ( not ( = ?auto_189858 ?auto_189860 ) ) ( not ( = ?auto_189859 ?auto_189860 ) ) ( not ( = ?auto_189858 ?auto_189865 ) ) ( not ( = ?auto_189859 ?auto_189865 ) ) ( not ( = ?auto_189860 ?auto_189865 ) ) ( ON-TABLE ?auto_189863 ) ( ON ?auto_189861 ?auto_189863 ) ( not ( = ?auto_189863 ?auto_189861 ) ) ( not ( = ?auto_189863 ?auto_189862 ) ) ( not ( = ?auto_189863 ?auto_189864 ) ) ( not ( = ?auto_189863 ?auto_189865 ) ) ( not ( = ?auto_189863 ?auto_189860 ) ) ( not ( = ?auto_189863 ?auto_189859 ) ) ( not ( = ?auto_189861 ?auto_189862 ) ) ( not ( = ?auto_189861 ?auto_189864 ) ) ( not ( = ?auto_189861 ?auto_189865 ) ) ( not ( = ?auto_189861 ?auto_189860 ) ) ( not ( = ?auto_189861 ?auto_189859 ) ) ( not ( = ?auto_189862 ?auto_189864 ) ) ( not ( = ?auto_189862 ?auto_189865 ) ) ( not ( = ?auto_189862 ?auto_189860 ) ) ( not ( = ?auto_189862 ?auto_189859 ) ) ( not ( = ?auto_189864 ?auto_189865 ) ) ( not ( = ?auto_189864 ?auto_189860 ) ) ( not ( = ?auto_189864 ?auto_189859 ) ) ( not ( = ?auto_189858 ?auto_189863 ) ) ( not ( = ?auto_189858 ?auto_189861 ) ) ( not ( = ?auto_189858 ?auto_189862 ) ) ( not ( = ?auto_189858 ?auto_189864 ) ) ( ON ?auto_189858 ?auto_189866 ) ( not ( = ?auto_189858 ?auto_189866 ) ) ( not ( = ?auto_189859 ?auto_189866 ) ) ( not ( = ?auto_189860 ?auto_189866 ) ) ( not ( = ?auto_189865 ?auto_189866 ) ) ( not ( = ?auto_189863 ?auto_189866 ) ) ( not ( = ?auto_189861 ?auto_189866 ) ) ( not ( = ?auto_189862 ?auto_189866 ) ) ( not ( = ?auto_189864 ?auto_189866 ) ) ( ON ?auto_189859 ?auto_189858 ) ( ON-TABLE ?auto_189866 ) ( ON ?auto_189860 ?auto_189859 ) ( ON ?auto_189865 ?auto_189860 ) ( ON ?auto_189864 ?auto_189865 ) ( CLEAR ?auto_189861 ) ( ON ?auto_189862 ?auto_189864 ) ( CLEAR ?auto_189862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189866 ?auto_189858 ?auto_189859 ?auto_189860 ?auto_189865 ?auto_189864 )
      ( MAKE-3PILE ?auto_189858 ?auto_189859 ?auto_189860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189867 - BLOCK
      ?auto_189868 - BLOCK
      ?auto_189869 - BLOCK
    )
    :vars
    (
      ?auto_189873 - BLOCK
      ?auto_189874 - BLOCK
      ?auto_189872 - BLOCK
      ?auto_189870 - BLOCK
      ?auto_189875 - BLOCK
      ?auto_189871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189867 ?auto_189868 ) ) ( not ( = ?auto_189867 ?auto_189869 ) ) ( not ( = ?auto_189868 ?auto_189869 ) ) ( not ( = ?auto_189867 ?auto_189873 ) ) ( not ( = ?auto_189868 ?auto_189873 ) ) ( not ( = ?auto_189869 ?auto_189873 ) ) ( ON-TABLE ?auto_189874 ) ( not ( = ?auto_189874 ?auto_189872 ) ) ( not ( = ?auto_189874 ?auto_189870 ) ) ( not ( = ?auto_189874 ?auto_189875 ) ) ( not ( = ?auto_189874 ?auto_189873 ) ) ( not ( = ?auto_189874 ?auto_189869 ) ) ( not ( = ?auto_189874 ?auto_189868 ) ) ( not ( = ?auto_189872 ?auto_189870 ) ) ( not ( = ?auto_189872 ?auto_189875 ) ) ( not ( = ?auto_189872 ?auto_189873 ) ) ( not ( = ?auto_189872 ?auto_189869 ) ) ( not ( = ?auto_189872 ?auto_189868 ) ) ( not ( = ?auto_189870 ?auto_189875 ) ) ( not ( = ?auto_189870 ?auto_189873 ) ) ( not ( = ?auto_189870 ?auto_189869 ) ) ( not ( = ?auto_189870 ?auto_189868 ) ) ( not ( = ?auto_189875 ?auto_189873 ) ) ( not ( = ?auto_189875 ?auto_189869 ) ) ( not ( = ?auto_189875 ?auto_189868 ) ) ( not ( = ?auto_189867 ?auto_189874 ) ) ( not ( = ?auto_189867 ?auto_189872 ) ) ( not ( = ?auto_189867 ?auto_189870 ) ) ( not ( = ?auto_189867 ?auto_189875 ) ) ( ON ?auto_189867 ?auto_189871 ) ( not ( = ?auto_189867 ?auto_189871 ) ) ( not ( = ?auto_189868 ?auto_189871 ) ) ( not ( = ?auto_189869 ?auto_189871 ) ) ( not ( = ?auto_189873 ?auto_189871 ) ) ( not ( = ?auto_189874 ?auto_189871 ) ) ( not ( = ?auto_189872 ?auto_189871 ) ) ( not ( = ?auto_189870 ?auto_189871 ) ) ( not ( = ?auto_189875 ?auto_189871 ) ) ( ON ?auto_189868 ?auto_189867 ) ( ON-TABLE ?auto_189871 ) ( ON ?auto_189869 ?auto_189868 ) ( ON ?auto_189873 ?auto_189869 ) ( ON ?auto_189875 ?auto_189873 ) ( ON ?auto_189870 ?auto_189875 ) ( CLEAR ?auto_189870 ) ( HOLDING ?auto_189872 ) ( CLEAR ?auto_189874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189874 ?auto_189872 )
      ( MAKE-3PILE ?auto_189867 ?auto_189868 ?auto_189869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189876 - BLOCK
      ?auto_189877 - BLOCK
      ?auto_189878 - BLOCK
    )
    :vars
    (
      ?auto_189883 - BLOCK
      ?auto_189880 - BLOCK
      ?auto_189884 - BLOCK
      ?auto_189881 - BLOCK
      ?auto_189879 - BLOCK
      ?auto_189882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189876 ?auto_189877 ) ) ( not ( = ?auto_189876 ?auto_189878 ) ) ( not ( = ?auto_189877 ?auto_189878 ) ) ( not ( = ?auto_189876 ?auto_189883 ) ) ( not ( = ?auto_189877 ?auto_189883 ) ) ( not ( = ?auto_189878 ?auto_189883 ) ) ( ON-TABLE ?auto_189880 ) ( not ( = ?auto_189880 ?auto_189884 ) ) ( not ( = ?auto_189880 ?auto_189881 ) ) ( not ( = ?auto_189880 ?auto_189879 ) ) ( not ( = ?auto_189880 ?auto_189883 ) ) ( not ( = ?auto_189880 ?auto_189878 ) ) ( not ( = ?auto_189880 ?auto_189877 ) ) ( not ( = ?auto_189884 ?auto_189881 ) ) ( not ( = ?auto_189884 ?auto_189879 ) ) ( not ( = ?auto_189884 ?auto_189883 ) ) ( not ( = ?auto_189884 ?auto_189878 ) ) ( not ( = ?auto_189884 ?auto_189877 ) ) ( not ( = ?auto_189881 ?auto_189879 ) ) ( not ( = ?auto_189881 ?auto_189883 ) ) ( not ( = ?auto_189881 ?auto_189878 ) ) ( not ( = ?auto_189881 ?auto_189877 ) ) ( not ( = ?auto_189879 ?auto_189883 ) ) ( not ( = ?auto_189879 ?auto_189878 ) ) ( not ( = ?auto_189879 ?auto_189877 ) ) ( not ( = ?auto_189876 ?auto_189880 ) ) ( not ( = ?auto_189876 ?auto_189884 ) ) ( not ( = ?auto_189876 ?auto_189881 ) ) ( not ( = ?auto_189876 ?auto_189879 ) ) ( ON ?auto_189876 ?auto_189882 ) ( not ( = ?auto_189876 ?auto_189882 ) ) ( not ( = ?auto_189877 ?auto_189882 ) ) ( not ( = ?auto_189878 ?auto_189882 ) ) ( not ( = ?auto_189883 ?auto_189882 ) ) ( not ( = ?auto_189880 ?auto_189882 ) ) ( not ( = ?auto_189884 ?auto_189882 ) ) ( not ( = ?auto_189881 ?auto_189882 ) ) ( not ( = ?auto_189879 ?auto_189882 ) ) ( ON ?auto_189877 ?auto_189876 ) ( ON-TABLE ?auto_189882 ) ( ON ?auto_189878 ?auto_189877 ) ( ON ?auto_189883 ?auto_189878 ) ( ON ?auto_189879 ?auto_189883 ) ( ON ?auto_189881 ?auto_189879 ) ( CLEAR ?auto_189880 ) ( ON ?auto_189884 ?auto_189881 ) ( CLEAR ?auto_189884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189882 ?auto_189876 ?auto_189877 ?auto_189878 ?auto_189883 ?auto_189879 ?auto_189881 )
      ( MAKE-3PILE ?auto_189876 ?auto_189877 ?auto_189878 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189885 - BLOCK
      ?auto_189886 - BLOCK
      ?auto_189887 - BLOCK
    )
    :vars
    (
      ?auto_189892 - BLOCK
      ?auto_189888 - BLOCK
      ?auto_189891 - BLOCK
      ?auto_189889 - BLOCK
      ?auto_189893 - BLOCK
      ?auto_189890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189885 ?auto_189886 ) ) ( not ( = ?auto_189885 ?auto_189887 ) ) ( not ( = ?auto_189886 ?auto_189887 ) ) ( not ( = ?auto_189885 ?auto_189892 ) ) ( not ( = ?auto_189886 ?auto_189892 ) ) ( not ( = ?auto_189887 ?auto_189892 ) ) ( not ( = ?auto_189888 ?auto_189891 ) ) ( not ( = ?auto_189888 ?auto_189889 ) ) ( not ( = ?auto_189888 ?auto_189893 ) ) ( not ( = ?auto_189888 ?auto_189892 ) ) ( not ( = ?auto_189888 ?auto_189887 ) ) ( not ( = ?auto_189888 ?auto_189886 ) ) ( not ( = ?auto_189891 ?auto_189889 ) ) ( not ( = ?auto_189891 ?auto_189893 ) ) ( not ( = ?auto_189891 ?auto_189892 ) ) ( not ( = ?auto_189891 ?auto_189887 ) ) ( not ( = ?auto_189891 ?auto_189886 ) ) ( not ( = ?auto_189889 ?auto_189893 ) ) ( not ( = ?auto_189889 ?auto_189892 ) ) ( not ( = ?auto_189889 ?auto_189887 ) ) ( not ( = ?auto_189889 ?auto_189886 ) ) ( not ( = ?auto_189893 ?auto_189892 ) ) ( not ( = ?auto_189893 ?auto_189887 ) ) ( not ( = ?auto_189893 ?auto_189886 ) ) ( not ( = ?auto_189885 ?auto_189888 ) ) ( not ( = ?auto_189885 ?auto_189891 ) ) ( not ( = ?auto_189885 ?auto_189889 ) ) ( not ( = ?auto_189885 ?auto_189893 ) ) ( ON ?auto_189885 ?auto_189890 ) ( not ( = ?auto_189885 ?auto_189890 ) ) ( not ( = ?auto_189886 ?auto_189890 ) ) ( not ( = ?auto_189887 ?auto_189890 ) ) ( not ( = ?auto_189892 ?auto_189890 ) ) ( not ( = ?auto_189888 ?auto_189890 ) ) ( not ( = ?auto_189891 ?auto_189890 ) ) ( not ( = ?auto_189889 ?auto_189890 ) ) ( not ( = ?auto_189893 ?auto_189890 ) ) ( ON ?auto_189886 ?auto_189885 ) ( ON-TABLE ?auto_189890 ) ( ON ?auto_189887 ?auto_189886 ) ( ON ?auto_189892 ?auto_189887 ) ( ON ?auto_189893 ?auto_189892 ) ( ON ?auto_189889 ?auto_189893 ) ( ON ?auto_189891 ?auto_189889 ) ( CLEAR ?auto_189891 ) ( HOLDING ?auto_189888 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189888 )
      ( MAKE-3PILE ?auto_189885 ?auto_189886 ?auto_189887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_189894 - BLOCK
      ?auto_189895 - BLOCK
      ?auto_189896 - BLOCK
    )
    :vars
    (
      ?auto_189897 - BLOCK
      ?auto_189902 - BLOCK
      ?auto_189901 - BLOCK
      ?auto_189898 - BLOCK
      ?auto_189899 - BLOCK
      ?auto_189900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_189894 ?auto_189895 ) ) ( not ( = ?auto_189894 ?auto_189896 ) ) ( not ( = ?auto_189895 ?auto_189896 ) ) ( not ( = ?auto_189894 ?auto_189897 ) ) ( not ( = ?auto_189895 ?auto_189897 ) ) ( not ( = ?auto_189896 ?auto_189897 ) ) ( not ( = ?auto_189902 ?auto_189901 ) ) ( not ( = ?auto_189902 ?auto_189898 ) ) ( not ( = ?auto_189902 ?auto_189899 ) ) ( not ( = ?auto_189902 ?auto_189897 ) ) ( not ( = ?auto_189902 ?auto_189896 ) ) ( not ( = ?auto_189902 ?auto_189895 ) ) ( not ( = ?auto_189901 ?auto_189898 ) ) ( not ( = ?auto_189901 ?auto_189899 ) ) ( not ( = ?auto_189901 ?auto_189897 ) ) ( not ( = ?auto_189901 ?auto_189896 ) ) ( not ( = ?auto_189901 ?auto_189895 ) ) ( not ( = ?auto_189898 ?auto_189899 ) ) ( not ( = ?auto_189898 ?auto_189897 ) ) ( not ( = ?auto_189898 ?auto_189896 ) ) ( not ( = ?auto_189898 ?auto_189895 ) ) ( not ( = ?auto_189899 ?auto_189897 ) ) ( not ( = ?auto_189899 ?auto_189896 ) ) ( not ( = ?auto_189899 ?auto_189895 ) ) ( not ( = ?auto_189894 ?auto_189902 ) ) ( not ( = ?auto_189894 ?auto_189901 ) ) ( not ( = ?auto_189894 ?auto_189898 ) ) ( not ( = ?auto_189894 ?auto_189899 ) ) ( ON ?auto_189894 ?auto_189900 ) ( not ( = ?auto_189894 ?auto_189900 ) ) ( not ( = ?auto_189895 ?auto_189900 ) ) ( not ( = ?auto_189896 ?auto_189900 ) ) ( not ( = ?auto_189897 ?auto_189900 ) ) ( not ( = ?auto_189902 ?auto_189900 ) ) ( not ( = ?auto_189901 ?auto_189900 ) ) ( not ( = ?auto_189898 ?auto_189900 ) ) ( not ( = ?auto_189899 ?auto_189900 ) ) ( ON ?auto_189895 ?auto_189894 ) ( ON-TABLE ?auto_189900 ) ( ON ?auto_189896 ?auto_189895 ) ( ON ?auto_189897 ?auto_189896 ) ( ON ?auto_189899 ?auto_189897 ) ( ON ?auto_189898 ?auto_189899 ) ( ON ?auto_189901 ?auto_189898 ) ( ON ?auto_189902 ?auto_189901 ) ( CLEAR ?auto_189902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189900 ?auto_189894 ?auto_189895 ?auto_189896 ?auto_189897 ?auto_189899 ?auto_189898 ?auto_189901 )
      ( MAKE-3PILE ?auto_189894 ?auto_189895 ?auto_189896 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189907 - BLOCK
      ?auto_189908 - BLOCK
      ?auto_189909 - BLOCK
      ?auto_189910 - BLOCK
    )
    :vars
    (
      ?auto_189911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189911 ?auto_189910 ) ( CLEAR ?auto_189911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189907 ) ( ON ?auto_189908 ?auto_189907 ) ( ON ?auto_189909 ?auto_189908 ) ( ON ?auto_189910 ?auto_189909 ) ( not ( = ?auto_189907 ?auto_189908 ) ) ( not ( = ?auto_189907 ?auto_189909 ) ) ( not ( = ?auto_189907 ?auto_189910 ) ) ( not ( = ?auto_189907 ?auto_189911 ) ) ( not ( = ?auto_189908 ?auto_189909 ) ) ( not ( = ?auto_189908 ?auto_189910 ) ) ( not ( = ?auto_189908 ?auto_189911 ) ) ( not ( = ?auto_189909 ?auto_189910 ) ) ( not ( = ?auto_189909 ?auto_189911 ) ) ( not ( = ?auto_189910 ?auto_189911 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189911 ?auto_189910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189912 - BLOCK
      ?auto_189913 - BLOCK
      ?auto_189914 - BLOCK
      ?auto_189915 - BLOCK
    )
    :vars
    (
      ?auto_189916 - BLOCK
      ?auto_189917 - BLOCK
      ?auto_189918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189916 ?auto_189915 ) ( CLEAR ?auto_189916 ) ( ON-TABLE ?auto_189912 ) ( ON ?auto_189913 ?auto_189912 ) ( ON ?auto_189914 ?auto_189913 ) ( ON ?auto_189915 ?auto_189914 ) ( not ( = ?auto_189912 ?auto_189913 ) ) ( not ( = ?auto_189912 ?auto_189914 ) ) ( not ( = ?auto_189912 ?auto_189915 ) ) ( not ( = ?auto_189912 ?auto_189916 ) ) ( not ( = ?auto_189913 ?auto_189914 ) ) ( not ( = ?auto_189913 ?auto_189915 ) ) ( not ( = ?auto_189913 ?auto_189916 ) ) ( not ( = ?auto_189914 ?auto_189915 ) ) ( not ( = ?auto_189914 ?auto_189916 ) ) ( not ( = ?auto_189915 ?auto_189916 ) ) ( HOLDING ?auto_189917 ) ( CLEAR ?auto_189918 ) ( not ( = ?auto_189912 ?auto_189917 ) ) ( not ( = ?auto_189912 ?auto_189918 ) ) ( not ( = ?auto_189913 ?auto_189917 ) ) ( not ( = ?auto_189913 ?auto_189918 ) ) ( not ( = ?auto_189914 ?auto_189917 ) ) ( not ( = ?auto_189914 ?auto_189918 ) ) ( not ( = ?auto_189915 ?auto_189917 ) ) ( not ( = ?auto_189915 ?auto_189918 ) ) ( not ( = ?auto_189916 ?auto_189917 ) ) ( not ( = ?auto_189916 ?auto_189918 ) ) ( not ( = ?auto_189917 ?auto_189918 ) ) )
    :subtasks
    ( ( !STACK ?auto_189917 ?auto_189918 )
      ( MAKE-4PILE ?auto_189912 ?auto_189913 ?auto_189914 ?auto_189915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189919 - BLOCK
      ?auto_189920 - BLOCK
      ?auto_189921 - BLOCK
      ?auto_189922 - BLOCK
    )
    :vars
    (
      ?auto_189924 - BLOCK
      ?auto_189923 - BLOCK
      ?auto_189925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189924 ?auto_189922 ) ( ON-TABLE ?auto_189919 ) ( ON ?auto_189920 ?auto_189919 ) ( ON ?auto_189921 ?auto_189920 ) ( ON ?auto_189922 ?auto_189921 ) ( not ( = ?auto_189919 ?auto_189920 ) ) ( not ( = ?auto_189919 ?auto_189921 ) ) ( not ( = ?auto_189919 ?auto_189922 ) ) ( not ( = ?auto_189919 ?auto_189924 ) ) ( not ( = ?auto_189920 ?auto_189921 ) ) ( not ( = ?auto_189920 ?auto_189922 ) ) ( not ( = ?auto_189920 ?auto_189924 ) ) ( not ( = ?auto_189921 ?auto_189922 ) ) ( not ( = ?auto_189921 ?auto_189924 ) ) ( not ( = ?auto_189922 ?auto_189924 ) ) ( CLEAR ?auto_189923 ) ( not ( = ?auto_189919 ?auto_189925 ) ) ( not ( = ?auto_189919 ?auto_189923 ) ) ( not ( = ?auto_189920 ?auto_189925 ) ) ( not ( = ?auto_189920 ?auto_189923 ) ) ( not ( = ?auto_189921 ?auto_189925 ) ) ( not ( = ?auto_189921 ?auto_189923 ) ) ( not ( = ?auto_189922 ?auto_189925 ) ) ( not ( = ?auto_189922 ?auto_189923 ) ) ( not ( = ?auto_189924 ?auto_189925 ) ) ( not ( = ?auto_189924 ?auto_189923 ) ) ( not ( = ?auto_189925 ?auto_189923 ) ) ( ON ?auto_189925 ?auto_189924 ) ( CLEAR ?auto_189925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189919 ?auto_189920 ?auto_189921 ?auto_189922 ?auto_189924 )
      ( MAKE-4PILE ?auto_189919 ?auto_189920 ?auto_189921 ?auto_189922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189926 - BLOCK
      ?auto_189927 - BLOCK
      ?auto_189928 - BLOCK
      ?auto_189929 - BLOCK
    )
    :vars
    (
      ?auto_189930 - BLOCK
      ?auto_189932 - BLOCK
      ?auto_189931 - BLOCK
      ?auto_189933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189930 ?auto_189929 ) ( ON-TABLE ?auto_189926 ) ( ON ?auto_189927 ?auto_189926 ) ( ON ?auto_189928 ?auto_189927 ) ( ON ?auto_189929 ?auto_189928 ) ( not ( = ?auto_189926 ?auto_189927 ) ) ( not ( = ?auto_189926 ?auto_189928 ) ) ( not ( = ?auto_189926 ?auto_189929 ) ) ( not ( = ?auto_189926 ?auto_189930 ) ) ( not ( = ?auto_189927 ?auto_189928 ) ) ( not ( = ?auto_189927 ?auto_189929 ) ) ( not ( = ?auto_189927 ?auto_189930 ) ) ( not ( = ?auto_189928 ?auto_189929 ) ) ( not ( = ?auto_189928 ?auto_189930 ) ) ( not ( = ?auto_189929 ?auto_189930 ) ) ( not ( = ?auto_189926 ?auto_189932 ) ) ( not ( = ?auto_189926 ?auto_189931 ) ) ( not ( = ?auto_189927 ?auto_189932 ) ) ( not ( = ?auto_189927 ?auto_189931 ) ) ( not ( = ?auto_189928 ?auto_189932 ) ) ( not ( = ?auto_189928 ?auto_189931 ) ) ( not ( = ?auto_189929 ?auto_189932 ) ) ( not ( = ?auto_189929 ?auto_189931 ) ) ( not ( = ?auto_189930 ?auto_189932 ) ) ( not ( = ?auto_189930 ?auto_189931 ) ) ( not ( = ?auto_189932 ?auto_189931 ) ) ( ON ?auto_189932 ?auto_189930 ) ( CLEAR ?auto_189932 ) ( HOLDING ?auto_189931 ) ( CLEAR ?auto_189933 ) ( ON-TABLE ?auto_189933 ) ( not ( = ?auto_189933 ?auto_189931 ) ) ( not ( = ?auto_189926 ?auto_189933 ) ) ( not ( = ?auto_189927 ?auto_189933 ) ) ( not ( = ?auto_189928 ?auto_189933 ) ) ( not ( = ?auto_189929 ?auto_189933 ) ) ( not ( = ?auto_189930 ?auto_189933 ) ) ( not ( = ?auto_189932 ?auto_189933 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189933 ?auto_189931 )
      ( MAKE-4PILE ?auto_189926 ?auto_189927 ?auto_189928 ?auto_189929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189934 - BLOCK
      ?auto_189935 - BLOCK
      ?auto_189936 - BLOCK
      ?auto_189937 - BLOCK
    )
    :vars
    (
      ?auto_189941 - BLOCK
      ?auto_189938 - BLOCK
      ?auto_189940 - BLOCK
      ?auto_189939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189941 ?auto_189937 ) ( ON-TABLE ?auto_189934 ) ( ON ?auto_189935 ?auto_189934 ) ( ON ?auto_189936 ?auto_189935 ) ( ON ?auto_189937 ?auto_189936 ) ( not ( = ?auto_189934 ?auto_189935 ) ) ( not ( = ?auto_189934 ?auto_189936 ) ) ( not ( = ?auto_189934 ?auto_189937 ) ) ( not ( = ?auto_189934 ?auto_189941 ) ) ( not ( = ?auto_189935 ?auto_189936 ) ) ( not ( = ?auto_189935 ?auto_189937 ) ) ( not ( = ?auto_189935 ?auto_189941 ) ) ( not ( = ?auto_189936 ?auto_189937 ) ) ( not ( = ?auto_189936 ?auto_189941 ) ) ( not ( = ?auto_189937 ?auto_189941 ) ) ( not ( = ?auto_189934 ?auto_189938 ) ) ( not ( = ?auto_189934 ?auto_189940 ) ) ( not ( = ?auto_189935 ?auto_189938 ) ) ( not ( = ?auto_189935 ?auto_189940 ) ) ( not ( = ?auto_189936 ?auto_189938 ) ) ( not ( = ?auto_189936 ?auto_189940 ) ) ( not ( = ?auto_189937 ?auto_189938 ) ) ( not ( = ?auto_189937 ?auto_189940 ) ) ( not ( = ?auto_189941 ?auto_189938 ) ) ( not ( = ?auto_189941 ?auto_189940 ) ) ( not ( = ?auto_189938 ?auto_189940 ) ) ( ON ?auto_189938 ?auto_189941 ) ( CLEAR ?auto_189939 ) ( ON-TABLE ?auto_189939 ) ( not ( = ?auto_189939 ?auto_189940 ) ) ( not ( = ?auto_189934 ?auto_189939 ) ) ( not ( = ?auto_189935 ?auto_189939 ) ) ( not ( = ?auto_189936 ?auto_189939 ) ) ( not ( = ?auto_189937 ?auto_189939 ) ) ( not ( = ?auto_189941 ?auto_189939 ) ) ( not ( = ?auto_189938 ?auto_189939 ) ) ( ON ?auto_189940 ?auto_189938 ) ( CLEAR ?auto_189940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189934 ?auto_189935 ?auto_189936 ?auto_189937 ?auto_189941 ?auto_189938 )
      ( MAKE-4PILE ?auto_189934 ?auto_189935 ?auto_189936 ?auto_189937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189942 - BLOCK
      ?auto_189943 - BLOCK
      ?auto_189944 - BLOCK
      ?auto_189945 - BLOCK
    )
    :vars
    (
      ?auto_189949 - BLOCK
      ?auto_189946 - BLOCK
      ?auto_189947 - BLOCK
      ?auto_189948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189949 ?auto_189945 ) ( ON-TABLE ?auto_189942 ) ( ON ?auto_189943 ?auto_189942 ) ( ON ?auto_189944 ?auto_189943 ) ( ON ?auto_189945 ?auto_189944 ) ( not ( = ?auto_189942 ?auto_189943 ) ) ( not ( = ?auto_189942 ?auto_189944 ) ) ( not ( = ?auto_189942 ?auto_189945 ) ) ( not ( = ?auto_189942 ?auto_189949 ) ) ( not ( = ?auto_189943 ?auto_189944 ) ) ( not ( = ?auto_189943 ?auto_189945 ) ) ( not ( = ?auto_189943 ?auto_189949 ) ) ( not ( = ?auto_189944 ?auto_189945 ) ) ( not ( = ?auto_189944 ?auto_189949 ) ) ( not ( = ?auto_189945 ?auto_189949 ) ) ( not ( = ?auto_189942 ?auto_189946 ) ) ( not ( = ?auto_189942 ?auto_189947 ) ) ( not ( = ?auto_189943 ?auto_189946 ) ) ( not ( = ?auto_189943 ?auto_189947 ) ) ( not ( = ?auto_189944 ?auto_189946 ) ) ( not ( = ?auto_189944 ?auto_189947 ) ) ( not ( = ?auto_189945 ?auto_189946 ) ) ( not ( = ?auto_189945 ?auto_189947 ) ) ( not ( = ?auto_189949 ?auto_189946 ) ) ( not ( = ?auto_189949 ?auto_189947 ) ) ( not ( = ?auto_189946 ?auto_189947 ) ) ( ON ?auto_189946 ?auto_189949 ) ( not ( = ?auto_189948 ?auto_189947 ) ) ( not ( = ?auto_189942 ?auto_189948 ) ) ( not ( = ?auto_189943 ?auto_189948 ) ) ( not ( = ?auto_189944 ?auto_189948 ) ) ( not ( = ?auto_189945 ?auto_189948 ) ) ( not ( = ?auto_189949 ?auto_189948 ) ) ( not ( = ?auto_189946 ?auto_189948 ) ) ( ON ?auto_189947 ?auto_189946 ) ( CLEAR ?auto_189947 ) ( HOLDING ?auto_189948 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189948 )
      ( MAKE-4PILE ?auto_189942 ?auto_189943 ?auto_189944 ?auto_189945 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189950 - BLOCK
      ?auto_189951 - BLOCK
      ?auto_189952 - BLOCK
      ?auto_189953 - BLOCK
    )
    :vars
    (
      ?auto_189957 - BLOCK
      ?auto_189955 - BLOCK
      ?auto_189956 - BLOCK
      ?auto_189954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189957 ?auto_189953 ) ( ON-TABLE ?auto_189950 ) ( ON ?auto_189951 ?auto_189950 ) ( ON ?auto_189952 ?auto_189951 ) ( ON ?auto_189953 ?auto_189952 ) ( not ( = ?auto_189950 ?auto_189951 ) ) ( not ( = ?auto_189950 ?auto_189952 ) ) ( not ( = ?auto_189950 ?auto_189953 ) ) ( not ( = ?auto_189950 ?auto_189957 ) ) ( not ( = ?auto_189951 ?auto_189952 ) ) ( not ( = ?auto_189951 ?auto_189953 ) ) ( not ( = ?auto_189951 ?auto_189957 ) ) ( not ( = ?auto_189952 ?auto_189953 ) ) ( not ( = ?auto_189952 ?auto_189957 ) ) ( not ( = ?auto_189953 ?auto_189957 ) ) ( not ( = ?auto_189950 ?auto_189955 ) ) ( not ( = ?auto_189950 ?auto_189956 ) ) ( not ( = ?auto_189951 ?auto_189955 ) ) ( not ( = ?auto_189951 ?auto_189956 ) ) ( not ( = ?auto_189952 ?auto_189955 ) ) ( not ( = ?auto_189952 ?auto_189956 ) ) ( not ( = ?auto_189953 ?auto_189955 ) ) ( not ( = ?auto_189953 ?auto_189956 ) ) ( not ( = ?auto_189957 ?auto_189955 ) ) ( not ( = ?auto_189957 ?auto_189956 ) ) ( not ( = ?auto_189955 ?auto_189956 ) ) ( ON ?auto_189955 ?auto_189957 ) ( not ( = ?auto_189954 ?auto_189956 ) ) ( not ( = ?auto_189950 ?auto_189954 ) ) ( not ( = ?auto_189951 ?auto_189954 ) ) ( not ( = ?auto_189952 ?auto_189954 ) ) ( not ( = ?auto_189953 ?auto_189954 ) ) ( not ( = ?auto_189957 ?auto_189954 ) ) ( not ( = ?auto_189955 ?auto_189954 ) ) ( ON ?auto_189956 ?auto_189955 ) ( ON ?auto_189954 ?auto_189956 ) ( CLEAR ?auto_189954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189950 ?auto_189951 ?auto_189952 ?auto_189953 ?auto_189957 ?auto_189955 ?auto_189956 )
      ( MAKE-4PILE ?auto_189950 ?auto_189951 ?auto_189952 ?auto_189953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189958 - BLOCK
      ?auto_189959 - BLOCK
      ?auto_189960 - BLOCK
      ?auto_189961 - BLOCK
    )
    :vars
    (
      ?auto_189963 - BLOCK
      ?auto_189964 - BLOCK
      ?auto_189965 - BLOCK
      ?auto_189962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189963 ?auto_189961 ) ( ON-TABLE ?auto_189958 ) ( ON ?auto_189959 ?auto_189958 ) ( ON ?auto_189960 ?auto_189959 ) ( ON ?auto_189961 ?auto_189960 ) ( not ( = ?auto_189958 ?auto_189959 ) ) ( not ( = ?auto_189958 ?auto_189960 ) ) ( not ( = ?auto_189958 ?auto_189961 ) ) ( not ( = ?auto_189958 ?auto_189963 ) ) ( not ( = ?auto_189959 ?auto_189960 ) ) ( not ( = ?auto_189959 ?auto_189961 ) ) ( not ( = ?auto_189959 ?auto_189963 ) ) ( not ( = ?auto_189960 ?auto_189961 ) ) ( not ( = ?auto_189960 ?auto_189963 ) ) ( not ( = ?auto_189961 ?auto_189963 ) ) ( not ( = ?auto_189958 ?auto_189964 ) ) ( not ( = ?auto_189958 ?auto_189965 ) ) ( not ( = ?auto_189959 ?auto_189964 ) ) ( not ( = ?auto_189959 ?auto_189965 ) ) ( not ( = ?auto_189960 ?auto_189964 ) ) ( not ( = ?auto_189960 ?auto_189965 ) ) ( not ( = ?auto_189961 ?auto_189964 ) ) ( not ( = ?auto_189961 ?auto_189965 ) ) ( not ( = ?auto_189963 ?auto_189964 ) ) ( not ( = ?auto_189963 ?auto_189965 ) ) ( not ( = ?auto_189964 ?auto_189965 ) ) ( ON ?auto_189964 ?auto_189963 ) ( not ( = ?auto_189962 ?auto_189965 ) ) ( not ( = ?auto_189958 ?auto_189962 ) ) ( not ( = ?auto_189959 ?auto_189962 ) ) ( not ( = ?auto_189960 ?auto_189962 ) ) ( not ( = ?auto_189961 ?auto_189962 ) ) ( not ( = ?auto_189963 ?auto_189962 ) ) ( not ( = ?auto_189964 ?auto_189962 ) ) ( ON ?auto_189965 ?auto_189964 ) ( HOLDING ?auto_189962 ) ( CLEAR ?auto_189965 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189958 ?auto_189959 ?auto_189960 ?auto_189961 ?auto_189963 ?auto_189964 ?auto_189965 ?auto_189962 )
      ( MAKE-4PILE ?auto_189958 ?auto_189959 ?auto_189960 ?auto_189961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189966 - BLOCK
      ?auto_189967 - BLOCK
      ?auto_189968 - BLOCK
      ?auto_189969 - BLOCK
    )
    :vars
    (
      ?auto_189973 - BLOCK
      ?auto_189970 - BLOCK
      ?auto_189971 - BLOCK
      ?auto_189972 - BLOCK
      ?auto_189974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189973 ?auto_189969 ) ( ON-TABLE ?auto_189966 ) ( ON ?auto_189967 ?auto_189966 ) ( ON ?auto_189968 ?auto_189967 ) ( ON ?auto_189969 ?auto_189968 ) ( not ( = ?auto_189966 ?auto_189967 ) ) ( not ( = ?auto_189966 ?auto_189968 ) ) ( not ( = ?auto_189966 ?auto_189969 ) ) ( not ( = ?auto_189966 ?auto_189973 ) ) ( not ( = ?auto_189967 ?auto_189968 ) ) ( not ( = ?auto_189967 ?auto_189969 ) ) ( not ( = ?auto_189967 ?auto_189973 ) ) ( not ( = ?auto_189968 ?auto_189969 ) ) ( not ( = ?auto_189968 ?auto_189973 ) ) ( not ( = ?auto_189969 ?auto_189973 ) ) ( not ( = ?auto_189966 ?auto_189970 ) ) ( not ( = ?auto_189966 ?auto_189971 ) ) ( not ( = ?auto_189967 ?auto_189970 ) ) ( not ( = ?auto_189967 ?auto_189971 ) ) ( not ( = ?auto_189968 ?auto_189970 ) ) ( not ( = ?auto_189968 ?auto_189971 ) ) ( not ( = ?auto_189969 ?auto_189970 ) ) ( not ( = ?auto_189969 ?auto_189971 ) ) ( not ( = ?auto_189973 ?auto_189970 ) ) ( not ( = ?auto_189973 ?auto_189971 ) ) ( not ( = ?auto_189970 ?auto_189971 ) ) ( ON ?auto_189970 ?auto_189973 ) ( not ( = ?auto_189972 ?auto_189971 ) ) ( not ( = ?auto_189966 ?auto_189972 ) ) ( not ( = ?auto_189967 ?auto_189972 ) ) ( not ( = ?auto_189968 ?auto_189972 ) ) ( not ( = ?auto_189969 ?auto_189972 ) ) ( not ( = ?auto_189973 ?auto_189972 ) ) ( not ( = ?auto_189970 ?auto_189972 ) ) ( ON ?auto_189971 ?auto_189970 ) ( CLEAR ?auto_189971 ) ( ON ?auto_189972 ?auto_189974 ) ( CLEAR ?auto_189972 ) ( HAND-EMPTY ) ( not ( = ?auto_189966 ?auto_189974 ) ) ( not ( = ?auto_189967 ?auto_189974 ) ) ( not ( = ?auto_189968 ?auto_189974 ) ) ( not ( = ?auto_189969 ?auto_189974 ) ) ( not ( = ?auto_189973 ?auto_189974 ) ) ( not ( = ?auto_189970 ?auto_189974 ) ) ( not ( = ?auto_189971 ?auto_189974 ) ) ( not ( = ?auto_189972 ?auto_189974 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189972 ?auto_189974 )
      ( MAKE-4PILE ?auto_189966 ?auto_189967 ?auto_189968 ?auto_189969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189975 - BLOCK
      ?auto_189976 - BLOCK
      ?auto_189977 - BLOCK
      ?auto_189978 - BLOCK
    )
    :vars
    (
      ?auto_189981 - BLOCK
      ?auto_189980 - BLOCK
      ?auto_189979 - BLOCK
      ?auto_189983 - BLOCK
      ?auto_189982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189981 ?auto_189978 ) ( ON-TABLE ?auto_189975 ) ( ON ?auto_189976 ?auto_189975 ) ( ON ?auto_189977 ?auto_189976 ) ( ON ?auto_189978 ?auto_189977 ) ( not ( = ?auto_189975 ?auto_189976 ) ) ( not ( = ?auto_189975 ?auto_189977 ) ) ( not ( = ?auto_189975 ?auto_189978 ) ) ( not ( = ?auto_189975 ?auto_189981 ) ) ( not ( = ?auto_189976 ?auto_189977 ) ) ( not ( = ?auto_189976 ?auto_189978 ) ) ( not ( = ?auto_189976 ?auto_189981 ) ) ( not ( = ?auto_189977 ?auto_189978 ) ) ( not ( = ?auto_189977 ?auto_189981 ) ) ( not ( = ?auto_189978 ?auto_189981 ) ) ( not ( = ?auto_189975 ?auto_189980 ) ) ( not ( = ?auto_189975 ?auto_189979 ) ) ( not ( = ?auto_189976 ?auto_189980 ) ) ( not ( = ?auto_189976 ?auto_189979 ) ) ( not ( = ?auto_189977 ?auto_189980 ) ) ( not ( = ?auto_189977 ?auto_189979 ) ) ( not ( = ?auto_189978 ?auto_189980 ) ) ( not ( = ?auto_189978 ?auto_189979 ) ) ( not ( = ?auto_189981 ?auto_189980 ) ) ( not ( = ?auto_189981 ?auto_189979 ) ) ( not ( = ?auto_189980 ?auto_189979 ) ) ( ON ?auto_189980 ?auto_189981 ) ( not ( = ?auto_189983 ?auto_189979 ) ) ( not ( = ?auto_189975 ?auto_189983 ) ) ( not ( = ?auto_189976 ?auto_189983 ) ) ( not ( = ?auto_189977 ?auto_189983 ) ) ( not ( = ?auto_189978 ?auto_189983 ) ) ( not ( = ?auto_189981 ?auto_189983 ) ) ( not ( = ?auto_189980 ?auto_189983 ) ) ( ON ?auto_189983 ?auto_189982 ) ( CLEAR ?auto_189983 ) ( not ( = ?auto_189975 ?auto_189982 ) ) ( not ( = ?auto_189976 ?auto_189982 ) ) ( not ( = ?auto_189977 ?auto_189982 ) ) ( not ( = ?auto_189978 ?auto_189982 ) ) ( not ( = ?auto_189981 ?auto_189982 ) ) ( not ( = ?auto_189980 ?auto_189982 ) ) ( not ( = ?auto_189979 ?auto_189982 ) ) ( not ( = ?auto_189983 ?auto_189982 ) ) ( HOLDING ?auto_189979 ) ( CLEAR ?auto_189980 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189975 ?auto_189976 ?auto_189977 ?auto_189978 ?auto_189981 ?auto_189980 ?auto_189979 )
      ( MAKE-4PILE ?auto_189975 ?auto_189976 ?auto_189977 ?auto_189978 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189984 - BLOCK
      ?auto_189985 - BLOCK
      ?auto_189986 - BLOCK
      ?auto_189987 - BLOCK
    )
    :vars
    (
      ?auto_189990 - BLOCK
      ?auto_189991 - BLOCK
      ?auto_189988 - BLOCK
      ?auto_189989 - BLOCK
      ?auto_189992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189990 ?auto_189987 ) ( ON-TABLE ?auto_189984 ) ( ON ?auto_189985 ?auto_189984 ) ( ON ?auto_189986 ?auto_189985 ) ( ON ?auto_189987 ?auto_189986 ) ( not ( = ?auto_189984 ?auto_189985 ) ) ( not ( = ?auto_189984 ?auto_189986 ) ) ( not ( = ?auto_189984 ?auto_189987 ) ) ( not ( = ?auto_189984 ?auto_189990 ) ) ( not ( = ?auto_189985 ?auto_189986 ) ) ( not ( = ?auto_189985 ?auto_189987 ) ) ( not ( = ?auto_189985 ?auto_189990 ) ) ( not ( = ?auto_189986 ?auto_189987 ) ) ( not ( = ?auto_189986 ?auto_189990 ) ) ( not ( = ?auto_189987 ?auto_189990 ) ) ( not ( = ?auto_189984 ?auto_189991 ) ) ( not ( = ?auto_189984 ?auto_189988 ) ) ( not ( = ?auto_189985 ?auto_189991 ) ) ( not ( = ?auto_189985 ?auto_189988 ) ) ( not ( = ?auto_189986 ?auto_189991 ) ) ( not ( = ?auto_189986 ?auto_189988 ) ) ( not ( = ?auto_189987 ?auto_189991 ) ) ( not ( = ?auto_189987 ?auto_189988 ) ) ( not ( = ?auto_189990 ?auto_189991 ) ) ( not ( = ?auto_189990 ?auto_189988 ) ) ( not ( = ?auto_189991 ?auto_189988 ) ) ( ON ?auto_189991 ?auto_189990 ) ( not ( = ?auto_189989 ?auto_189988 ) ) ( not ( = ?auto_189984 ?auto_189989 ) ) ( not ( = ?auto_189985 ?auto_189989 ) ) ( not ( = ?auto_189986 ?auto_189989 ) ) ( not ( = ?auto_189987 ?auto_189989 ) ) ( not ( = ?auto_189990 ?auto_189989 ) ) ( not ( = ?auto_189991 ?auto_189989 ) ) ( ON ?auto_189989 ?auto_189992 ) ( not ( = ?auto_189984 ?auto_189992 ) ) ( not ( = ?auto_189985 ?auto_189992 ) ) ( not ( = ?auto_189986 ?auto_189992 ) ) ( not ( = ?auto_189987 ?auto_189992 ) ) ( not ( = ?auto_189990 ?auto_189992 ) ) ( not ( = ?auto_189991 ?auto_189992 ) ) ( not ( = ?auto_189988 ?auto_189992 ) ) ( not ( = ?auto_189989 ?auto_189992 ) ) ( CLEAR ?auto_189991 ) ( ON ?auto_189988 ?auto_189989 ) ( CLEAR ?auto_189988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189992 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189992 ?auto_189989 )
      ( MAKE-4PILE ?auto_189984 ?auto_189985 ?auto_189986 ?auto_189987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189993 - BLOCK
      ?auto_189994 - BLOCK
      ?auto_189995 - BLOCK
      ?auto_189996 - BLOCK
    )
    :vars
    (
      ?auto_189997 - BLOCK
      ?auto_189998 - BLOCK
      ?auto_189999 - BLOCK
      ?auto_190001 - BLOCK
      ?auto_190000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189997 ?auto_189996 ) ( ON-TABLE ?auto_189993 ) ( ON ?auto_189994 ?auto_189993 ) ( ON ?auto_189995 ?auto_189994 ) ( ON ?auto_189996 ?auto_189995 ) ( not ( = ?auto_189993 ?auto_189994 ) ) ( not ( = ?auto_189993 ?auto_189995 ) ) ( not ( = ?auto_189993 ?auto_189996 ) ) ( not ( = ?auto_189993 ?auto_189997 ) ) ( not ( = ?auto_189994 ?auto_189995 ) ) ( not ( = ?auto_189994 ?auto_189996 ) ) ( not ( = ?auto_189994 ?auto_189997 ) ) ( not ( = ?auto_189995 ?auto_189996 ) ) ( not ( = ?auto_189995 ?auto_189997 ) ) ( not ( = ?auto_189996 ?auto_189997 ) ) ( not ( = ?auto_189993 ?auto_189998 ) ) ( not ( = ?auto_189993 ?auto_189999 ) ) ( not ( = ?auto_189994 ?auto_189998 ) ) ( not ( = ?auto_189994 ?auto_189999 ) ) ( not ( = ?auto_189995 ?auto_189998 ) ) ( not ( = ?auto_189995 ?auto_189999 ) ) ( not ( = ?auto_189996 ?auto_189998 ) ) ( not ( = ?auto_189996 ?auto_189999 ) ) ( not ( = ?auto_189997 ?auto_189998 ) ) ( not ( = ?auto_189997 ?auto_189999 ) ) ( not ( = ?auto_189998 ?auto_189999 ) ) ( not ( = ?auto_190001 ?auto_189999 ) ) ( not ( = ?auto_189993 ?auto_190001 ) ) ( not ( = ?auto_189994 ?auto_190001 ) ) ( not ( = ?auto_189995 ?auto_190001 ) ) ( not ( = ?auto_189996 ?auto_190001 ) ) ( not ( = ?auto_189997 ?auto_190001 ) ) ( not ( = ?auto_189998 ?auto_190001 ) ) ( ON ?auto_190001 ?auto_190000 ) ( not ( = ?auto_189993 ?auto_190000 ) ) ( not ( = ?auto_189994 ?auto_190000 ) ) ( not ( = ?auto_189995 ?auto_190000 ) ) ( not ( = ?auto_189996 ?auto_190000 ) ) ( not ( = ?auto_189997 ?auto_190000 ) ) ( not ( = ?auto_189998 ?auto_190000 ) ) ( not ( = ?auto_189999 ?auto_190000 ) ) ( not ( = ?auto_190001 ?auto_190000 ) ) ( ON ?auto_189999 ?auto_190001 ) ( CLEAR ?auto_189999 ) ( ON-TABLE ?auto_190000 ) ( HOLDING ?auto_189998 ) ( CLEAR ?auto_189997 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189993 ?auto_189994 ?auto_189995 ?auto_189996 ?auto_189997 ?auto_189998 )
      ( MAKE-4PILE ?auto_189993 ?auto_189994 ?auto_189995 ?auto_189996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190002 - BLOCK
      ?auto_190003 - BLOCK
      ?auto_190004 - BLOCK
      ?auto_190005 - BLOCK
    )
    :vars
    (
      ?auto_190010 - BLOCK
      ?auto_190006 - BLOCK
      ?auto_190009 - BLOCK
      ?auto_190008 - BLOCK
      ?auto_190007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190010 ?auto_190005 ) ( ON-TABLE ?auto_190002 ) ( ON ?auto_190003 ?auto_190002 ) ( ON ?auto_190004 ?auto_190003 ) ( ON ?auto_190005 ?auto_190004 ) ( not ( = ?auto_190002 ?auto_190003 ) ) ( not ( = ?auto_190002 ?auto_190004 ) ) ( not ( = ?auto_190002 ?auto_190005 ) ) ( not ( = ?auto_190002 ?auto_190010 ) ) ( not ( = ?auto_190003 ?auto_190004 ) ) ( not ( = ?auto_190003 ?auto_190005 ) ) ( not ( = ?auto_190003 ?auto_190010 ) ) ( not ( = ?auto_190004 ?auto_190005 ) ) ( not ( = ?auto_190004 ?auto_190010 ) ) ( not ( = ?auto_190005 ?auto_190010 ) ) ( not ( = ?auto_190002 ?auto_190006 ) ) ( not ( = ?auto_190002 ?auto_190009 ) ) ( not ( = ?auto_190003 ?auto_190006 ) ) ( not ( = ?auto_190003 ?auto_190009 ) ) ( not ( = ?auto_190004 ?auto_190006 ) ) ( not ( = ?auto_190004 ?auto_190009 ) ) ( not ( = ?auto_190005 ?auto_190006 ) ) ( not ( = ?auto_190005 ?auto_190009 ) ) ( not ( = ?auto_190010 ?auto_190006 ) ) ( not ( = ?auto_190010 ?auto_190009 ) ) ( not ( = ?auto_190006 ?auto_190009 ) ) ( not ( = ?auto_190008 ?auto_190009 ) ) ( not ( = ?auto_190002 ?auto_190008 ) ) ( not ( = ?auto_190003 ?auto_190008 ) ) ( not ( = ?auto_190004 ?auto_190008 ) ) ( not ( = ?auto_190005 ?auto_190008 ) ) ( not ( = ?auto_190010 ?auto_190008 ) ) ( not ( = ?auto_190006 ?auto_190008 ) ) ( ON ?auto_190008 ?auto_190007 ) ( not ( = ?auto_190002 ?auto_190007 ) ) ( not ( = ?auto_190003 ?auto_190007 ) ) ( not ( = ?auto_190004 ?auto_190007 ) ) ( not ( = ?auto_190005 ?auto_190007 ) ) ( not ( = ?auto_190010 ?auto_190007 ) ) ( not ( = ?auto_190006 ?auto_190007 ) ) ( not ( = ?auto_190009 ?auto_190007 ) ) ( not ( = ?auto_190008 ?auto_190007 ) ) ( ON ?auto_190009 ?auto_190008 ) ( ON-TABLE ?auto_190007 ) ( CLEAR ?auto_190010 ) ( ON ?auto_190006 ?auto_190009 ) ( CLEAR ?auto_190006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190007 ?auto_190008 ?auto_190009 )
      ( MAKE-4PILE ?auto_190002 ?auto_190003 ?auto_190004 ?auto_190005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190029 - BLOCK
      ?auto_190030 - BLOCK
      ?auto_190031 - BLOCK
      ?auto_190032 - BLOCK
    )
    :vars
    (
      ?auto_190036 - BLOCK
      ?auto_190037 - BLOCK
      ?auto_190034 - BLOCK
      ?auto_190035 - BLOCK
      ?auto_190033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190029 ) ( ON ?auto_190030 ?auto_190029 ) ( ON ?auto_190031 ?auto_190030 ) ( not ( = ?auto_190029 ?auto_190030 ) ) ( not ( = ?auto_190029 ?auto_190031 ) ) ( not ( = ?auto_190029 ?auto_190032 ) ) ( not ( = ?auto_190029 ?auto_190036 ) ) ( not ( = ?auto_190030 ?auto_190031 ) ) ( not ( = ?auto_190030 ?auto_190032 ) ) ( not ( = ?auto_190030 ?auto_190036 ) ) ( not ( = ?auto_190031 ?auto_190032 ) ) ( not ( = ?auto_190031 ?auto_190036 ) ) ( not ( = ?auto_190032 ?auto_190036 ) ) ( not ( = ?auto_190029 ?auto_190037 ) ) ( not ( = ?auto_190029 ?auto_190034 ) ) ( not ( = ?auto_190030 ?auto_190037 ) ) ( not ( = ?auto_190030 ?auto_190034 ) ) ( not ( = ?auto_190031 ?auto_190037 ) ) ( not ( = ?auto_190031 ?auto_190034 ) ) ( not ( = ?auto_190032 ?auto_190037 ) ) ( not ( = ?auto_190032 ?auto_190034 ) ) ( not ( = ?auto_190036 ?auto_190037 ) ) ( not ( = ?auto_190036 ?auto_190034 ) ) ( not ( = ?auto_190037 ?auto_190034 ) ) ( not ( = ?auto_190035 ?auto_190034 ) ) ( not ( = ?auto_190029 ?auto_190035 ) ) ( not ( = ?auto_190030 ?auto_190035 ) ) ( not ( = ?auto_190031 ?auto_190035 ) ) ( not ( = ?auto_190032 ?auto_190035 ) ) ( not ( = ?auto_190036 ?auto_190035 ) ) ( not ( = ?auto_190037 ?auto_190035 ) ) ( ON ?auto_190035 ?auto_190033 ) ( not ( = ?auto_190029 ?auto_190033 ) ) ( not ( = ?auto_190030 ?auto_190033 ) ) ( not ( = ?auto_190031 ?auto_190033 ) ) ( not ( = ?auto_190032 ?auto_190033 ) ) ( not ( = ?auto_190036 ?auto_190033 ) ) ( not ( = ?auto_190037 ?auto_190033 ) ) ( not ( = ?auto_190034 ?auto_190033 ) ) ( not ( = ?auto_190035 ?auto_190033 ) ) ( ON ?auto_190034 ?auto_190035 ) ( ON-TABLE ?auto_190033 ) ( ON ?auto_190037 ?auto_190034 ) ( ON ?auto_190036 ?auto_190037 ) ( CLEAR ?auto_190036 ) ( HOLDING ?auto_190032 ) ( CLEAR ?auto_190031 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190029 ?auto_190030 ?auto_190031 ?auto_190032 ?auto_190036 )
      ( MAKE-4PILE ?auto_190029 ?auto_190030 ?auto_190031 ?auto_190032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190038 - BLOCK
      ?auto_190039 - BLOCK
      ?auto_190040 - BLOCK
      ?auto_190041 - BLOCK
    )
    :vars
    (
      ?auto_190043 - BLOCK
      ?auto_190044 - BLOCK
      ?auto_190046 - BLOCK
      ?auto_190045 - BLOCK
      ?auto_190042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190038 ) ( ON ?auto_190039 ?auto_190038 ) ( ON ?auto_190040 ?auto_190039 ) ( not ( = ?auto_190038 ?auto_190039 ) ) ( not ( = ?auto_190038 ?auto_190040 ) ) ( not ( = ?auto_190038 ?auto_190041 ) ) ( not ( = ?auto_190038 ?auto_190043 ) ) ( not ( = ?auto_190039 ?auto_190040 ) ) ( not ( = ?auto_190039 ?auto_190041 ) ) ( not ( = ?auto_190039 ?auto_190043 ) ) ( not ( = ?auto_190040 ?auto_190041 ) ) ( not ( = ?auto_190040 ?auto_190043 ) ) ( not ( = ?auto_190041 ?auto_190043 ) ) ( not ( = ?auto_190038 ?auto_190044 ) ) ( not ( = ?auto_190038 ?auto_190046 ) ) ( not ( = ?auto_190039 ?auto_190044 ) ) ( not ( = ?auto_190039 ?auto_190046 ) ) ( not ( = ?auto_190040 ?auto_190044 ) ) ( not ( = ?auto_190040 ?auto_190046 ) ) ( not ( = ?auto_190041 ?auto_190044 ) ) ( not ( = ?auto_190041 ?auto_190046 ) ) ( not ( = ?auto_190043 ?auto_190044 ) ) ( not ( = ?auto_190043 ?auto_190046 ) ) ( not ( = ?auto_190044 ?auto_190046 ) ) ( not ( = ?auto_190045 ?auto_190046 ) ) ( not ( = ?auto_190038 ?auto_190045 ) ) ( not ( = ?auto_190039 ?auto_190045 ) ) ( not ( = ?auto_190040 ?auto_190045 ) ) ( not ( = ?auto_190041 ?auto_190045 ) ) ( not ( = ?auto_190043 ?auto_190045 ) ) ( not ( = ?auto_190044 ?auto_190045 ) ) ( ON ?auto_190045 ?auto_190042 ) ( not ( = ?auto_190038 ?auto_190042 ) ) ( not ( = ?auto_190039 ?auto_190042 ) ) ( not ( = ?auto_190040 ?auto_190042 ) ) ( not ( = ?auto_190041 ?auto_190042 ) ) ( not ( = ?auto_190043 ?auto_190042 ) ) ( not ( = ?auto_190044 ?auto_190042 ) ) ( not ( = ?auto_190046 ?auto_190042 ) ) ( not ( = ?auto_190045 ?auto_190042 ) ) ( ON ?auto_190046 ?auto_190045 ) ( ON-TABLE ?auto_190042 ) ( ON ?auto_190044 ?auto_190046 ) ( ON ?auto_190043 ?auto_190044 ) ( CLEAR ?auto_190040 ) ( ON ?auto_190041 ?auto_190043 ) ( CLEAR ?auto_190041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190042 ?auto_190045 ?auto_190046 ?auto_190044 ?auto_190043 )
      ( MAKE-4PILE ?auto_190038 ?auto_190039 ?auto_190040 ?auto_190041 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190047 - BLOCK
      ?auto_190048 - BLOCK
      ?auto_190049 - BLOCK
      ?auto_190050 - BLOCK
    )
    :vars
    (
      ?auto_190054 - BLOCK
      ?auto_190053 - BLOCK
      ?auto_190055 - BLOCK
      ?auto_190051 - BLOCK
      ?auto_190052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190047 ) ( ON ?auto_190048 ?auto_190047 ) ( not ( = ?auto_190047 ?auto_190048 ) ) ( not ( = ?auto_190047 ?auto_190049 ) ) ( not ( = ?auto_190047 ?auto_190050 ) ) ( not ( = ?auto_190047 ?auto_190054 ) ) ( not ( = ?auto_190048 ?auto_190049 ) ) ( not ( = ?auto_190048 ?auto_190050 ) ) ( not ( = ?auto_190048 ?auto_190054 ) ) ( not ( = ?auto_190049 ?auto_190050 ) ) ( not ( = ?auto_190049 ?auto_190054 ) ) ( not ( = ?auto_190050 ?auto_190054 ) ) ( not ( = ?auto_190047 ?auto_190053 ) ) ( not ( = ?auto_190047 ?auto_190055 ) ) ( not ( = ?auto_190048 ?auto_190053 ) ) ( not ( = ?auto_190048 ?auto_190055 ) ) ( not ( = ?auto_190049 ?auto_190053 ) ) ( not ( = ?auto_190049 ?auto_190055 ) ) ( not ( = ?auto_190050 ?auto_190053 ) ) ( not ( = ?auto_190050 ?auto_190055 ) ) ( not ( = ?auto_190054 ?auto_190053 ) ) ( not ( = ?auto_190054 ?auto_190055 ) ) ( not ( = ?auto_190053 ?auto_190055 ) ) ( not ( = ?auto_190051 ?auto_190055 ) ) ( not ( = ?auto_190047 ?auto_190051 ) ) ( not ( = ?auto_190048 ?auto_190051 ) ) ( not ( = ?auto_190049 ?auto_190051 ) ) ( not ( = ?auto_190050 ?auto_190051 ) ) ( not ( = ?auto_190054 ?auto_190051 ) ) ( not ( = ?auto_190053 ?auto_190051 ) ) ( ON ?auto_190051 ?auto_190052 ) ( not ( = ?auto_190047 ?auto_190052 ) ) ( not ( = ?auto_190048 ?auto_190052 ) ) ( not ( = ?auto_190049 ?auto_190052 ) ) ( not ( = ?auto_190050 ?auto_190052 ) ) ( not ( = ?auto_190054 ?auto_190052 ) ) ( not ( = ?auto_190053 ?auto_190052 ) ) ( not ( = ?auto_190055 ?auto_190052 ) ) ( not ( = ?auto_190051 ?auto_190052 ) ) ( ON ?auto_190055 ?auto_190051 ) ( ON-TABLE ?auto_190052 ) ( ON ?auto_190053 ?auto_190055 ) ( ON ?auto_190054 ?auto_190053 ) ( ON ?auto_190050 ?auto_190054 ) ( CLEAR ?auto_190050 ) ( HOLDING ?auto_190049 ) ( CLEAR ?auto_190048 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190047 ?auto_190048 ?auto_190049 )
      ( MAKE-4PILE ?auto_190047 ?auto_190048 ?auto_190049 ?auto_190050 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190056 - BLOCK
      ?auto_190057 - BLOCK
      ?auto_190058 - BLOCK
      ?auto_190059 - BLOCK
    )
    :vars
    (
      ?auto_190060 - BLOCK
      ?auto_190062 - BLOCK
      ?auto_190064 - BLOCK
      ?auto_190063 - BLOCK
      ?auto_190061 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190056 ) ( ON ?auto_190057 ?auto_190056 ) ( not ( = ?auto_190056 ?auto_190057 ) ) ( not ( = ?auto_190056 ?auto_190058 ) ) ( not ( = ?auto_190056 ?auto_190059 ) ) ( not ( = ?auto_190056 ?auto_190060 ) ) ( not ( = ?auto_190057 ?auto_190058 ) ) ( not ( = ?auto_190057 ?auto_190059 ) ) ( not ( = ?auto_190057 ?auto_190060 ) ) ( not ( = ?auto_190058 ?auto_190059 ) ) ( not ( = ?auto_190058 ?auto_190060 ) ) ( not ( = ?auto_190059 ?auto_190060 ) ) ( not ( = ?auto_190056 ?auto_190062 ) ) ( not ( = ?auto_190056 ?auto_190064 ) ) ( not ( = ?auto_190057 ?auto_190062 ) ) ( not ( = ?auto_190057 ?auto_190064 ) ) ( not ( = ?auto_190058 ?auto_190062 ) ) ( not ( = ?auto_190058 ?auto_190064 ) ) ( not ( = ?auto_190059 ?auto_190062 ) ) ( not ( = ?auto_190059 ?auto_190064 ) ) ( not ( = ?auto_190060 ?auto_190062 ) ) ( not ( = ?auto_190060 ?auto_190064 ) ) ( not ( = ?auto_190062 ?auto_190064 ) ) ( not ( = ?auto_190063 ?auto_190064 ) ) ( not ( = ?auto_190056 ?auto_190063 ) ) ( not ( = ?auto_190057 ?auto_190063 ) ) ( not ( = ?auto_190058 ?auto_190063 ) ) ( not ( = ?auto_190059 ?auto_190063 ) ) ( not ( = ?auto_190060 ?auto_190063 ) ) ( not ( = ?auto_190062 ?auto_190063 ) ) ( ON ?auto_190063 ?auto_190061 ) ( not ( = ?auto_190056 ?auto_190061 ) ) ( not ( = ?auto_190057 ?auto_190061 ) ) ( not ( = ?auto_190058 ?auto_190061 ) ) ( not ( = ?auto_190059 ?auto_190061 ) ) ( not ( = ?auto_190060 ?auto_190061 ) ) ( not ( = ?auto_190062 ?auto_190061 ) ) ( not ( = ?auto_190064 ?auto_190061 ) ) ( not ( = ?auto_190063 ?auto_190061 ) ) ( ON ?auto_190064 ?auto_190063 ) ( ON-TABLE ?auto_190061 ) ( ON ?auto_190062 ?auto_190064 ) ( ON ?auto_190060 ?auto_190062 ) ( ON ?auto_190059 ?auto_190060 ) ( CLEAR ?auto_190057 ) ( ON ?auto_190058 ?auto_190059 ) ( CLEAR ?auto_190058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190061 ?auto_190063 ?auto_190064 ?auto_190062 ?auto_190060 ?auto_190059 )
      ( MAKE-4PILE ?auto_190056 ?auto_190057 ?auto_190058 ?auto_190059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190065 - BLOCK
      ?auto_190066 - BLOCK
      ?auto_190067 - BLOCK
      ?auto_190068 - BLOCK
    )
    :vars
    (
      ?auto_190069 - BLOCK
      ?auto_190073 - BLOCK
      ?auto_190072 - BLOCK
      ?auto_190070 - BLOCK
      ?auto_190071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190065 ) ( not ( = ?auto_190065 ?auto_190066 ) ) ( not ( = ?auto_190065 ?auto_190067 ) ) ( not ( = ?auto_190065 ?auto_190068 ) ) ( not ( = ?auto_190065 ?auto_190069 ) ) ( not ( = ?auto_190066 ?auto_190067 ) ) ( not ( = ?auto_190066 ?auto_190068 ) ) ( not ( = ?auto_190066 ?auto_190069 ) ) ( not ( = ?auto_190067 ?auto_190068 ) ) ( not ( = ?auto_190067 ?auto_190069 ) ) ( not ( = ?auto_190068 ?auto_190069 ) ) ( not ( = ?auto_190065 ?auto_190073 ) ) ( not ( = ?auto_190065 ?auto_190072 ) ) ( not ( = ?auto_190066 ?auto_190073 ) ) ( not ( = ?auto_190066 ?auto_190072 ) ) ( not ( = ?auto_190067 ?auto_190073 ) ) ( not ( = ?auto_190067 ?auto_190072 ) ) ( not ( = ?auto_190068 ?auto_190073 ) ) ( not ( = ?auto_190068 ?auto_190072 ) ) ( not ( = ?auto_190069 ?auto_190073 ) ) ( not ( = ?auto_190069 ?auto_190072 ) ) ( not ( = ?auto_190073 ?auto_190072 ) ) ( not ( = ?auto_190070 ?auto_190072 ) ) ( not ( = ?auto_190065 ?auto_190070 ) ) ( not ( = ?auto_190066 ?auto_190070 ) ) ( not ( = ?auto_190067 ?auto_190070 ) ) ( not ( = ?auto_190068 ?auto_190070 ) ) ( not ( = ?auto_190069 ?auto_190070 ) ) ( not ( = ?auto_190073 ?auto_190070 ) ) ( ON ?auto_190070 ?auto_190071 ) ( not ( = ?auto_190065 ?auto_190071 ) ) ( not ( = ?auto_190066 ?auto_190071 ) ) ( not ( = ?auto_190067 ?auto_190071 ) ) ( not ( = ?auto_190068 ?auto_190071 ) ) ( not ( = ?auto_190069 ?auto_190071 ) ) ( not ( = ?auto_190073 ?auto_190071 ) ) ( not ( = ?auto_190072 ?auto_190071 ) ) ( not ( = ?auto_190070 ?auto_190071 ) ) ( ON ?auto_190072 ?auto_190070 ) ( ON-TABLE ?auto_190071 ) ( ON ?auto_190073 ?auto_190072 ) ( ON ?auto_190069 ?auto_190073 ) ( ON ?auto_190068 ?auto_190069 ) ( ON ?auto_190067 ?auto_190068 ) ( CLEAR ?auto_190067 ) ( HOLDING ?auto_190066 ) ( CLEAR ?auto_190065 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190065 ?auto_190066 )
      ( MAKE-4PILE ?auto_190065 ?auto_190066 ?auto_190067 ?auto_190068 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190074 - BLOCK
      ?auto_190075 - BLOCK
      ?auto_190076 - BLOCK
      ?auto_190077 - BLOCK
    )
    :vars
    (
      ?auto_190080 - BLOCK
      ?auto_190079 - BLOCK
      ?auto_190078 - BLOCK
      ?auto_190082 - BLOCK
      ?auto_190081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190074 ) ( not ( = ?auto_190074 ?auto_190075 ) ) ( not ( = ?auto_190074 ?auto_190076 ) ) ( not ( = ?auto_190074 ?auto_190077 ) ) ( not ( = ?auto_190074 ?auto_190080 ) ) ( not ( = ?auto_190075 ?auto_190076 ) ) ( not ( = ?auto_190075 ?auto_190077 ) ) ( not ( = ?auto_190075 ?auto_190080 ) ) ( not ( = ?auto_190076 ?auto_190077 ) ) ( not ( = ?auto_190076 ?auto_190080 ) ) ( not ( = ?auto_190077 ?auto_190080 ) ) ( not ( = ?auto_190074 ?auto_190079 ) ) ( not ( = ?auto_190074 ?auto_190078 ) ) ( not ( = ?auto_190075 ?auto_190079 ) ) ( not ( = ?auto_190075 ?auto_190078 ) ) ( not ( = ?auto_190076 ?auto_190079 ) ) ( not ( = ?auto_190076 ?auto_190078 ) ) ( not ( = ?auto_190077 ?auto_190079 ) ) ( not ( = ?auto_190077 ?auto_190078 ) ) ( not ( = ?auto_190080 ?auto_190079 ) ) ( not ( = ?auto_190080 ?auto_190078 ) ) ( not ( = ?auto_190079 ?auto_190078 ) ) ( not ( = ?auto_190082 ?auto_190078 ) ) ( not ( = ?auto_190074 ?auto_190082 ) ) ( not ( = ?auto_190075 ?auto_190082 ) ) ( not ( = ?auto_190076 ?auto_190082 ) ) ( not ( = ?auto_190077 ?auto_190082 ) ) ( not ( = ?auto_190080 ?auto_190082 ) ) ( not ( = ?auto_190079 ?auto_190082 ) ) ( ON ?auto_190082 ?auto_190081 ) ( not ( = ?auto_190074 ?auto_190081 ) ) ( not ( = ?auto_190075 ?auto_190081 ) ) ( not ( = ?auto_190076 ?auto_190081 ) ) ( not ( = ?auto_190077 ?auto_190081 ) ) ( not ( = ?auto_190080 ?auto_190081 ) ) ( not ( = ?auto_190079 ?auto_190081 ) ) ( not ( = ?auto_190078 ?auto_190081 ) ) ( not ( = ?auto_190082 ?auto_190081 ) ) ( ON ?auto_190078 ?auto_190082 ) ( ON-TABLE ?auto_190081 ) ( ON ?auto_190079 ?auto_190078 ) ( ON ?auto_190080 ?auto_190079 ) ( ON ?auto_190077 ?auto_190080 ) ( ON ?auto_190076 ?auto_190077 ) ( CLEAR ?auto_190074 ) ( ON ?auto_190075 ?auto_190076 ) ( CLEAR ?auto_190075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190081 ?auto_190082 ?auto_190078 ?auto_190079 ?auto_190080 ?auto_190077 ?auto_190076 )
      ( MAKE-4PILE ?auto_190074 ?auto_190075 ?auto_190076 ?auto_190077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190083 - BLOCK
      ?auto_190084 - BLOCK
      ?auto_190085 - BLOCK
      ?auto_190086 - BLOCK
    )
    :vars
    (
      ?auto_190089 - BLOCK
      ?auto_190091 - BLOCK
      ?auto_190087 - BLOCK
      ?auto_190088 - BLOCK
      ?auto_190090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190083 ?auto_190084 ) ) ( not ( = ?auto_190083 ?auto_190085 ) ) ( not ( = ?auto_190083 ?auto_190086 ) ) ( not ( = ?auto_190083 ?auto_190089 ) ) ( not ( = ?auto_190084 ?auto_190085 ) ) ( not ( = ?auto_190084 ?auto_190086 ) ) ( not ( = ?auto_190084 ?auto_190089 ) ) ( not ( = ?auto_190085 ?auto_190086 ) ) ( not ( = ?auto_190085 ?auto_190089 ) ) ( not ( = ?auto_190086 ?auto_190089 ) ) ( not ( = ?auto_190083 ?auto_190091 ) ) ( not ( = ?auto_190083 ?auto_190087 ) ) ( not ( = ?auto_190084 ?auto_190091 ) ) ( not ( = ?auto_190084 ?auto_190087 ) ) ( not ( = ?auto_190085 ?auto_190091 ) ) ( not ( = ?auto_190085 ?auto_190087 ) ) ( not ( = ?auto_190086 ?auto_190091 ) ) ( not ( = ?auto_190086 ?auto_190087 ) ) ( not ( = ?auto_190089 ?auto_190091 ) ) ( not ( = ?auto_190089 ?auto_190087 ) ) ( not ( = ?auto_190091 ?auto_190087 ) ) ( not ( = ?auto_190088 ?auto_190087 ) ) ( not ( = ?auto_190083 ?auto_190088 ) ) ( not ( = ?auto_190084 ?auto_190088 ) ) ( not ( = ?auto_190085 ?auto_190088 ) ) ( not ( = ?auto_190086 ?auto_190088 ) ) ( not ( = ?auto_190089 ?auto_190088 ) ) ( not ( = ?auto_190091 ?auto_190088 ) ) ( ON ?auto_190088 ?auto_190090 ) ( not ( = ?auto_190083 ?auto_190090 ) ) ( not ( = ?auto_190084 ?auto_190090 ) ) ( not ( = ?auto_190085 ?auto_190090 ) ) ( not ( = ?auto_190086 ?auto_190090 ) ) ( not ( = ?auto_190089 ?auto_190090 ) ) ( not ( = ?auto_190091 ?auto_190090 ) ) ( not ( = ?auto_190087 ?auto_190090 ) ) ( not ( = ?auto_190088 ?auto_190090 ) ) ( ON ?auto_190087 ?auto_190088 ) ( ON-TABLE ?auto_190090 ) ( ON ?auto_190091 ?auto_190087 ) ( ON ?auto_190089 ?auto_190091 ) ( ON ?auto_190086 ?auto_190089 ) ( ON ?auto_190085 ?auto_190086 ) ( ON ?auto_190084 ?auto_190085 ) ( CLEAR ?auto_190084 ) ( HOLDING ?auto_190083 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190083 )
      ( MAKE-4PILE ?auto_190083 ?auto_190084 ?auto_190085 ?auto_190086 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190092 - BLOCK
      ?auto_190093 - BLOCK
      ?auto_190094 - BLOCK
      ?auto_190095 - BLOCK
    )
    :vars
    (
      ?auto_190098 - BLOCK
      ?auto_190097 - BLOCK
      ?auto_190099 - BLOCK
      ?auto_190100 - BLOCK
      ?auto_190096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190092 ?auto_190093 ) ) ( not ( = ?auto_190092 ?auto_190094 ) ) ( not ( = ?auto_190092 ?auto_190095 ) ) ( not ( = ?auto_190092 ?auto_190098 ) ) ( not ( = ?auto_190093 ?auto_190094 ) ) ( not ( = ?auto_190093 ?auto_190095 ) ) ( not ( = ?auto_190093 ?auto_190098 ) ) ( not ( = ?auto_190094 ?auto_190095 ) ) ( not ( = ?auto_190094 ?auto_190098 ) ) ( not ( = ?auto_190095 ?auto_190098 ) ) ( not ( = ?auto_190092 ?auto_190097 ) ) ( not ( = ?auto_190092 ?auto_190099 ) ) ( not ( = ?auto_190093 ?auto_190097 ) ) ( not ( = ?auto_190093 ?auto_190099 ) ) ( not ( = ?auto_190094 ?auto_190097 ) ) ( not ( = ?auto_190094 ?auto_190099 ) ) ( not ( = ?auto_190095 ?auto_190097 ) ) ( not ( = ?auto_190095 ?auto_190099 ) ) ( not ( = ?auto_190098 ?auto_190097 ) ) ( not ( = ?auto_190098 ?auto_190099 ) ) ( not ( = ?auto_190097 ?auto_190099 ) ) ( not ( = ?auto_190100 ?auto_190099 ) ) ( not ( = ?auto_190092 ?auto_190100 ) ) ( not ( = ?auto_190093 ?auto_190100 ) ) ( not ( = ?auto_190094 ?auto_190100 ) ) ( not ( = ?auto_190095 ?auto_190100 ) ) ( not ( = ?auto_190098 ?auto_190100 ) ) ( not ( = ?auto_190097 ?auto_190100 ) ) ( ON ?auto_190100 ?auto_190096 ) ( not ( = ?auto_190092 ?auto_190096 ) ) ( not ( = ?auto_190093 ?auto_190096 ) ) ( not ( = ?auto_190094 ?auto_190096 ) ) ( not ( = ?auto_190095 ?auto_190096 ) ) ( not ( = ?auto_190098 ?auto_190096 ) ) ( not ( = ?auto_190097 ?auto_190096 ) ) ( not ( = ?auto_190099 ?auto_190096 ) ) ( not ( = ?auto_190100 ?auto_190096 ) ) ( ON ?auto_190099 ?auto_190100 ) ( ON-TABLE ?auto_190096 ) ( ON ?auto_190097 ?auto_190099 ) ( ON ?auto_190098 ?auto_190097 ) ( ON ?auto_190095 ?auto_190098 ) ( ON ?auto_190094 ?auto_190095 ) ( ON ?auto_190093 ?auto_190094 ) ( ON ?auto_190092 ?auto_190093 ) ( CLEAR ?auto_190092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190096 ?auto_190100 ?auto_190099 ?auto_190097 ?auto_190098 ?auto_190095 ?auto_190094 ?auto_190093 )
      ( MAKE-4PILE ?auto_190092 ?auto_190093 ?auto_190094 ?auto_190095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190105 - BLOCK
      ?auto_190106 - BLOCK
      ?auto_190107 - BLOCK
      ?auto_190108 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_190108 ) ( CLEAR ?auto_190107 ) ( ON-TABLE ?auto_190105 ) ( ON ?auto_190106 ?auto_190105 ) ( ON ?auto_190107 ?auto_190106 ) ( not ( = ?auto_190105 ?auto_190106 ) ) ( not ( = ?auto_190105 ?auto_190107 ) ) ( not ( = ?auto_190105 ?auto_190108 ) ) ( not ( = ?auto_190106 ?auto_190107 ) ) ( not ( = ?auto_190106 ?auto_190108 ) ) ( not ( = ?auto_190107 ?auto_190108 ) ) )
    :subtasks
    ( ( !STACK ?auto_190108 ?auto_190107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190109 - BLOCK
      ?auto_190110 - BLOCK
      ?auto_190111 - BLOCK
      ?auto_190112 - BLOCK
    )
    :vars
    (
      ?auto_190113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_190111 ) ( ON-TABLE ?auto_190109 ) ( ON ?auto_190110 ?auto_190109 ) ( ON ?auto_190111 ?auto_190110 ) ( not ( = ?auto_190109 ?auto_190110 ) ) ( not ( = ?auto_190109 ?auto_190111 ) ) ( not ( = ?auto_190109 ?auto_190112 ) ) ( not ( = ?auto_190110 ?auto_190111 ) ) ( not ( = ?auto_190110 ?auto_190112 ) ) ( not ( = ?auto_190111 ?auto_190112 ) ) ( ON ?auto_190112 ?auto_190113 ) ( CLEAR ?auto_190112 ) ( HAND-EMPTY ) ( not ( = ?auto_190109 ?auto_190113 ) ) ( not ( = ?auto_190110 ?auto_190113 ) ) ( not ( = ?auto_190111 ?auto_190113 ) ) ( not ( = ?auto_190112 ?auto_190113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190112 ?auto_190113 )
      ( MAKE-4PILE ?auto_190109 ?auto_190110 ?auto_190111 ?auto_190112 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190114 - BLOCK
      ?auto_190115 - BLOCK
      ?auto_190116 - BLOCK
      ?auto_190117 - BLOCK
    )
    :vars
    (
      ?auto_190118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190114 ) ( ON ?auto_190115 ?auto_190114 ) ( not ( = ?auto_190114 ?auto_190115 ) ) ( not ( = ?auto_190114 ?auto_190116 ) ) ( not ( = ?auto_190114 ?auto_190117 ) ) ( not ( = ?auto_190115 ?auto_190116 ) ) ( not ( = ?auto_190115 ?auto_190117 ) ) ( not ( = ?auto_190116 ?auto_190117 ) ) ( ON ?auto_190117 ?auto_190118 ) ( CLEAR ?auto_190117 ) ( not ( = ?auto_190114 ?auto_190118 ) ) ( not ( = ?auto_190115 ?auto_190118 ) ) ( not ( = ?auto_190116 ?auto_190118 ) ) ( not ( = ?auto_190117 ?auto_190118 ) ) ( HOLDING ?auto_190116 ) ( CLEAR ?auto_190115 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190114 ?auto_190115 ?auto_190116 )
      ( MAKE-4PILE ?auto_190114 ?auto_190115 ?auto_190116 ?auto_190117 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190119 - BLOCK
      ?auto_190120 - BLOCK
      ?auto_190121 - BLOCK
      ?auto_190122 - BLOCK
    )
    :vars
    (
      ?auto_190123 - BLOCK
      ?auto_190125 - BLOCK
      ?auto_190126 - BLOCK
      ?auto_190124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190119 ) ( ON ?auto_190120 ?auto_190119 ) ( not ( = ?auto_190119 ?auto_190120 ) ) ( not ( = ?auto_190119 ?auto_190121 ) ) ( not ( = ?auto_190119 ?auto_190122 ) ) ( not ( = ?auto_190120 ?auto_190121 ) ) ( not ( = ?auto_190120 ?auto_190122 ) ) ( not ( = ?auto_190121 ?auto_190122 ) ) ( ON ?auto_190122 ?auto_190123 ) ( not ( = ?auto_190119 ?auto_190123 ) ) ( not ( = ?auto_190120 ?auto_190123 ) ) ( not ( = ?auto_190121 ?auto_190123 ) ) ( not ( = ?auto_190122 ?auto_190123 ) ) ( CLEAR ?auto_190120 ) ( ON ?auto_190121 ?auto_190122 ) ( CLEAR ?auto_190121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190125 ) ( ON ?auto_190126 ?auto_190125 ) ( ON ?auto_190124 ?auto_190126 ) ( ON ?auto_190123 ?auto_190124 ) ( not ( = ?auto_190125 ?auto_190126 ) ) ( not ( = ?auto_190125 ?auto_190124 ) ) ( not ( = ?auto_190125 ?auto_190123 ) ) ( not ( = ?auto_190125 ?auto_190122 ) ) ( not ( = ?auto_190125 ?auto_190121 ) ) ( not ( = ?auto_190126 ?auto_190124 ) ) ( not ( = ?auto_190126 ?auto_190123 ) ) ( not ( = ?auto_190126 ?auto_190122 ) ) ( not ( = ?auto_190126 ?auto_190121 ) ) ( not ( = ?auto_190124 ?auto_190123 ) ) ( not ( = ?auto_190124 ?auto_190122 ) ) ( not ( = ?auto_190124 ?auto_190121 ) ) ( not ( = ?auto_190119 ?auto_190125 ) ) ( not ( = ?auto_190119 ?auto_190126 ) ) ( not ( = ?auto_190119 ?auto_190124 ) ) ( not ( = ?auto_190120 ?auto_190125 ) ) ( not ( = ?auto_190120 ?auto_190126 ) ) ( not ( = ?auto_190120 ?auto_190124 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190125 ?auto_190126 ?auto_190124 ?auto_190123 ?auto_190122 )
      ( MAKE-4PILE ?auto_190119 ?auto_190120 ?auto_190121 ?auto_190122 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190127 - BLOCK
      ?auto_190128 - BLOCK
      ?auto_190129 - BLOCK
      ?auto_190130 - BLOCK
    )
    :vars
    (
      ?auto_190131 - BLOCK
      ?auto_190132 - BLOCK
      ?auto_190134 - BLOCK
      ?auto_190133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190127 ) ( not ( = ?auto_190127 ?auto_190128 ) ) ( not ( = ?auto_190127 ?auto_190129 ) ) ( not ( = ?auto_190127 ?auto_190130 ) ) ( not ( = ?auto_190128 ?auto_190129 ) ) ( not ( = ?auto_190128 ?auto_190130 ) ) ( not ( = ?auto_190129 ?auto_190130 ) ) ( ON ?auto_190130 ?auto_190131 ) ( not ( = ?auto_190127 ?auto_190131 ) ) ( not ( = ?auto_190128 ?auto_190131 ) ) ( not ( = ?auto_190129 ?auto_190131 ) ) ( not ( = ?auto_190130 ?auto_190131 ) ) ( ON ?auto_190129 ?auto_190130 ) ( CLEAR ?auto_190129 ) ( ON-TABLE ?auto_190132 ) ( ON ?auto_190134 ?auto_190132 ) ( ON ?auto_190133 ?auto_190134 ) ( ON ?auto_190131 ?auto_190133 ) ( not ( = ?auto_190132 ?auto_190134 ) ) ( not ( = ?auto_190132 ?auto_190133 ) ) ( not ( = ?auto_190132 ?auto_190131 ) ) ( not ( = ?auto_190132 ?auto_190130 ) ) ( not ( = ?auto_190132 ?auto_190129 ) ) ( not ( = ?auto_190134 ?auto_190133 ) ) ( not ( = ?auto_190134 ?auto_190131 ) ) ( not ( = ?auto_190134 ?auto_190130 ) ) ( not ( = ?auto_190134 ?auto_190129 ) ) ( not ( = ?auto_190133 ?auto_190131 ) ) ( not ( = ?auto_190133 ?auto_190130 ) ) ( not ( = ?auto_190133 ?auto_190129 ) ) ( not ( = ?auto_190127 ?auto_190132 ) ) ( not ( = ?auto_190127 ?auto_190134 ) ) ( not ( = ?auto_190127 ?auto_190133 ) ) ( not ( = ?auto_190128 ?auto_190132 ) ) ( not ( = ?auto_190128 ?auto_190134 ) ) ( not ( = ?auto_190128 ?auto_190133 ) ) ( HOLDING ?auto_190128 ) ( CLEAR ?auto_190127 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190127 ?auto_190128 )
      ( MAKE-4PILE ?auto_190127 ?auto_190128 ?auto_190129 ?auto_190130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190135 - BLOCK
      ?auto_190136 - BLOCK
      ?auto_190137 - BLOCK
      ?auto_190138 - BLOCK
    )
    :vars
    (
      ?auto_190140 - BLOCK
      ?auto_190142 - BLOCK
      ?auto_190139 - BLOCK
      ?auto_190141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190135 ) ( not ( = ?auto_190135 ?auto_190136 ) ) ( not ( = ?auto_190135 ?auto_190137 ) ) ( not ( = ?auto_190135 ?auto_190138 ) ) ( not ( = ?auto_190136 ?auto_190137 ) ) ( not ( = ?auto_190136 ?auto_190138 ) ) ( not ( = ?auto_190137 ?auto_190138 ) ) ( ON ?auto_190138 ?auto_190140 ) ( not ( = ?auto_190135 ?auto_190140 ) ) ( not ( = ?auto_190136 ?auto_190140 ) ) ( not ( = ?auto_190137 ?auto_190140 ) ) ( not ( = ?auto_190138 ?auto_190140 ) ) ( ON ?auto_190137 ?auto_190138 ) ( ON-TABLE ?auto_190142 ) ( ON ?auto_190139 ?auto_190142 ) ( ON ?auto_190141 ?auto_190139 ) ( ON ?auto_190140 ?auto_190141 ) ( not ( = ?auto_190142 ?auto_190139 ) ) ( not ( = ?auto_190142 ?auto_190141 ) ) ( not ( = ?auto_190142 ?auto_190140 ) ) ( not ( = ?auto_190142 ?auto_190138 ) ) ( not ( = ?auto_190142 ?auto_190137 ) ) ( not ( = ?auto_190139 ?auto_190141 ) ) ( not ( = ?auto_190139 ?auto_190140 ) ) ( not ( = ?auto_190139 ?auto_190138 ) ) ( not ( = ?auto_190139 ?auto_190137 ) ) ( not ( = ?auto_190141 ?auto_190140 ) ) ( not ( = ?auto_190141 ?auto_190138 ) ) ( not ( = ?auto_190141 ?auto_190137 ) ) ( not ( = ?auto_190135 ?auto_190142 ) ) ( not ( = ?auto_190135 ?auto_190139 ) ) ( not ( = ?auto_190135 ?auto_190141 ) ) ( not ( = ?auto_190136 ?auto_190142 ) ) ( not ( = ?auto_190136 ?auto_190139 ) ) ( not ( = ?auto_190136 ?auto_190141 ) ) ( CLEAR ?auto_190135 ) ( ON ?auto_190136 ?auto_190137 ) ( CLEAR ?auto_190136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190142 ?auto_190139 ?auto_190141 ?auto_190140 ?auto_190138 ?auto_190137 )
      ( MAKE-4PILE ?auto_190135 ?auto_190136 ?auto_190137 ?auto_190138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190143 - BLOCK
      ?auto_190144 - BLOCK
      ?auto_190145 - BLOCK
      ?auto_190146 - BLOCK
    )
    :vars
    (
      ?auto_190148 - BLOCK
      ?auto_190149 - BLOCK
      ?auto_190147 - BLOCK
      ?auto_190150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190143 ?auto_190144 ) ) ( not ( = ?auto_190143 ?auto_190145 ) ) ( not ( = ?auto_190143 ?auto_190146 ) ) ( not ( = ?auto_190144 ?auto_190145 ) ) ( not ( = ?auto_190144 ?auto_190146 ) ) ( not ( = ?auto_190145 ?auto_190146 ) ) ( ON ?auto_190146 ?auto_190148 ) ( not ( = ?auto_190143 ?auto_190148 ) ) ( not ( = ?auto_190144 ?auto_190148 ) ) ( not ( = ?auto_190145 ?auto_190148 ) ) ( not ( = ?auto_190146 ?auto_190148 ) ) ( ON ?auto_190145 ?auto_190146 ) ( ON-TABLE ?auto_190149 ) ( ON ?auto_190147 ?auto_190149 ) ( ON ?auto_190150 ?auto_190147 ) ( ON ?auto_190148 ?auto_190150 ) ( not ( = ?auto_190149 ?auto_190147 ) ) ( not ( = ?auto_190149 ?auto_190150 ) ) ( not ( = ?auto_190149 ?auto_190148 ) ) ( not ( = ?auto_190149 ?auto_190146 ) ) ( not ( = ?auto_190149 ?auto_190145 ) ) ( not ( = ?auto_190147 ?auto_190150 ) ) ( not ( = ?auto_190147 ?auto_190148 ) ) ( not ( = ?auto_190147 ?auto_190146 ) ) ( not ( = ?auto_190147 ?auto_190145 ) ) ( not ( = ?auto_190150 ?auto_190148 ) ) ( not ( = ?auto_190150 ?auto_190146 ) ) ( not ( = ?auto_190150 ?auto_190145 ) ) ( not ( = ?auto_190143 ?auto_190149 ) ) ( not ( = ?auto_190143 ?auto_190147 ) ) ( not ( = ?auto_190143 ?auto_190150 ) ) ( not ( = ?auto_190144 ?auto_190149 ) ) ( not ( = ?auto_190144 ?auto_190147 ) ) ( not ( = ?auto_190144 ?auto_190150 ) ) ( ON ?auto_190144 ?auto_190145 ) ( CLEAR ?auto_190144 ) ( HOLDING ?auto_190143 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190143 )
      ( MAKE-4PILE ?auto_190143 ?auto_190144 ?auto_190145 ?auto_190146 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190151 - BLOCK
      ?auto_190152 - BLOCK
      ?auto_190153 - BLOCK
      ?auto_190154 - BLOCK
    )
    :vars
    (
      ?auto_190158 - BLOCK
      ?auto_190157 - BLOCK
      ?auto_190156 - BLOCK
      ?auto_190155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190151 ?auto_190152 ) ) ( not ( = ?auto_190151 ?auto_190153 ) ) ( not ( = ?auto_190151 ?auto_190154 ) ) ( not ( = ?auto_190152 ?auto_190153 ) ) ( not ( = ?auto_190152 ?auto_190154 ) ) ( not ( = ?auto_190153 ?auto_190154 ) ) ( ON ?auto_190154 ?auto_190158 ) ( not ( = ?auto_190151 ?auto_190158 ) ) ( not ( = ?auto_190152 ?auto_190158 ) ) ( not ( = ?auto_190153 ?auto_190158 ) ) ( not ( = ?auto_190154 ?auto_190158 ) ) ( ON ?auto_190153 ?auto_190154 ) ( ON-TABLE ?auto_190157 ) ( ON ?auto_190156 ?auto_190157 ) ( ON ?auto_190155 ?auto_190156 ) ( ON ?auto_190158 ?auto_190155 ) ( not ( = ?auto_190157 ?auto_190156 ) ) ( not ( = ?auto_190157 ?auto_190155 ) ) ( not ( = ?auto_190157 ?auto_190158 ) ) ( not ( = ?auto_190157 ?auto_190154 ) ) ( not ( = ?auto_190157 ?auto_190153 ) ) ( not ( = ?auto_190156 ?auto_190155 ) ) ( not ( = ?auto_190156 ?auto_190158 ) ) ( not ( = ?auto_190156 ?auto_190154 ) ) ( not ( = ?auto_190156 ?auto_190153 ) ) ( not ( = ?auto_190155 ?auto_190158 ) ) ( not ( = ?auto_190155 ?auto_190154 ) ) ( not ( = ?auto_190155 ?auto_190153 ) ) ( not ( = ?auto_190151 ?auto_190157 ) ) ( not ( = ?auto_190151 ?auto_190156 ) ) ( not ( = ?auto_190151 ?auto_190155 ) ) ( not ( = ?auto_190152 ?auto_190157 ) ) ( not ( = ?auto_190152 ?auto_190156 ) ) ( not ( = ?auto_190152 ?auto_190155 ) ) ( ON ?auto_190152 ?auto_190153 ) ( ON ?auto_190151 ?auto_190152 ) ( CLEAR ?auto_190151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190157 ?auto_190156 ?auto_190155 ?auto_190158 ?auto_190154 ?auto_190153 ?auto_190152 )
      ( MAKE-4PILE ?auto_190151 ?auto_190152 ?auto_190153 ?auto_190154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190159 - BLOCK
      ?auto_190160 - BLOCK
      ?auto_190161 - BLOCK
      ?auto_190162 - BLOCK
    )
    :vars
    (
      ?auto_190164 - BLOCK
      ?auto_190166 - BLOCK
      ?auto_190163 - BLOCK
      ?auto_190165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190159 ?auto_190160 ) ) ( not ( = ?auto_190159 ?auto_190161 ) ) ( not ( = ?auto_190159 ?auto_190162 ) ) ( not ( = ?auto_190160 ?auto_190161 ) ) ( not ( = ?auto_190160 ?auto_190162 ) ) ( not ( = ?auto_190161 ?auto_190162 ) ) ( ON ?auto_190162 ?auto_190164 ) ( not ( = ?auto_190159 ?auto_190164 ) ) ( not ( = ?auto_190160 ?auto_190164 ) ) ( not ( = ?auto_190161 ?auto_190164 ) ) ( not ( = ?auto_190162 ?auto_190164 ) ) ( ON ?auto_190161 ?auto_190162 ) ( ON-TABLE ?auto_190166 ) ( ON ?auto_190163 ?auto_190166 ) ( ON ?auto_190165 ?auto_190163 ) ( ON ?auto_190164 ?auto_190165 ) ( not ( = ?auto_190166 ?auto_190163 ) ) ( not ( = ?auto_190166 ?auto_190165 ) ) ( not ( = ?auto_190166 ?auto_190164 ) ) ( not ( = ?auto_190166 ?auto_190162 ) ) ( not ( = ?auto_190166 ?auto_190161 ) ) ( not ( = ?auto_190163 ?auto_190165 ) ) ( not ( = ?auto_190163 ?auto_190164 ) ) ( not ( = ?auto_190163 ?auto_190162 ) ) ( not ( = ?auto_190163 ?auto_190161 ) ) ( not ( = ?auto_190165 ?auto_190164 ) ) ( not ( = ?auto_190165 ?auto_190162 ) ) ( not ( = ?auto_190165 ?auto_190161 ) ) ( not ( = ?auto_190159 ?auto_190166 ) ) ( not ( = ?auto_190159 ?auto_190163 ) ) ( not ( = ?auto_190159 ?auto_190165 ) ) ( not ( = ?auto_190160 ?auto_190166 ) ) ( not ( = ?auto_190160 ?auto_190163 ) ) ( not ( = ?auto_190160 ?auto_190165 ) ) ( ON ?auto_190160 ?auto_190161 ) ( HOLDING ?auto_190159 ) ( CLEAR ?auto_190160 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190166 ?auto_190163 ?auto_190165 ?auto_190164 ?auto_190162 ?auto_190161 ?auto_190160 ?auto_190159 )
      ( MAKE-4PILE ?auto_190159 ?auto_190160 ?auto_190161 ?auto_190162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190167 - BLOCK
      ?auto_190168 - BLOCK
      ?auto_190169 - BLOCK
      ?auto_190170 - BLOCK
    )
    :vars
    (
      ?auto_190171 - BLOCK
      ?auto_190173 - BLOCK
      ?auto_190172 - BLOCK
      ?auto_190174 - BLOCK
      ?auto_190175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190167 ?auto_190168 ) ) ( not ( = ?auto_190167 ?auto_190169 ) ) ( not ( = ?auto_190167 ?auto_190170 ) ) ( not ( = ?auto_190168 ?auto_190169 ) ) ( not ( = ?auto_190168 ?auto_190170 ) ) ( not ( = ?auto_190169 ?auto_190170 ) ) ( ON ?auto_190170 ?auto_190171 ) ( not ( = ?auto_190167 ?auto_190171 ) ) ( not ( = ?auto_190168 ?auto_190171 ) ) ( not ( = ?auto_190169 ?auto_190171 ) ) ( not ( = ?auto_190170 ?auto_190171 ) ) ( ON ?auto_190169 ?auto_190170 ) ( ON-TABLE ?auto_190173 ) ( ON ?auto_190172 ?auto_190173 ) ( ON ?auto_190174 ?auto_190172 ) ( ON ?auto_190171 ?auto_190174 ) ( not ( = ?auto_190173 ?auto_190172 ) ) ( not ( = ?auto_190173 ?auto_190174 ) ) ( not ( = ?auto_190173 ?auto_190171 ) ) ( not ( = ?auto_190173 ?auto_190170 ) ) ( not ( = ?auto_190173 ?auto_190169 ) ) ( not ( = ?auto_190172 ?auto_190174 ) ) ( not ( = ?auto_190172 ?auto_190171 ) ) ( not ( = ?auto_190172 ?auto_190170 ) ) ( not ( = ?auto_190172 ?auto_190169 ) ) ( not ( = ?auto_190174 ?auto_190171 ) ) ( not ( = ?auto_190174 ?auto_190170 ) ) ( not ( = ?auto_190174 ?auto_190169 ) ) ( not ( = ?auto_190167 ?auto_190173 ) ) ( not ( = ?auto_190167 ?auto_190172 ) ) ( not ( = ?auto_190167 ?auto_190174 ) ) ( not ( = ?auto_190168 ?auto_190173 ) ) ( not ( = ?auto_190168 ?auto_190172 ) ) ( not ( = ?auto_190168 ?auto_190174 ) ) ( ON ?auto_190168 ?auto_190169 ) ( CLEAR ?auto_190168 ) ( ON ?auto_190167 ?auto_190175 ) ( CLEAR ?auto_190167 ) ( HAND-EMPTY ) ( not ( = ?auto_190167 ?auto_190175 ) ) ( not ( = ?auto_190168 ?auto_190175 ) ) ( not ( = ?auto_190169 ?auto_190175 ) ) ( not ( = ?auto_190170 ?auto_190175 ) ) ( not ( = ?auto_190171 ?auto_190175 ) ) ( not ( = ?auto_190173 ?auto_190175 ) ) ( not ( = ?auto_190172 ?auto_190175 ) ) ( not ( = ?auto_190174 ?auto_190175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190167 ?auto_190175 )
      ( MAKE-4PILE ?auto_190167 ?auto_190168 ?auto_190169 ?auto_190170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190176 - BLOCK
      ?auto_190177 - BLOCK
      ?auto_190178 - BLOCK
      ?auto_190179 - BLOCK
    )
    :vars
    (
      ?auto_190183 - BLOCK
      ?auto_190181 - BLOCK
      ?auto_190180 - BLOCK
      ?auto_190184 - BLOCK
      ?auto_190182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190176 ?auto_190177 ) ) ( not ( = ?auto_190176 ?auto_190178 ) ) ( not ( = ?auto_190176 ?auto_190179 ) ) ( not ( = ?auto_190177 ?auto_190178 ) ) ( not ( = ?auto_190177 ?auto_190179 ) ) ( not ( = ?auto_190178 ?auto_190179 ) ) ( ON ?auto_190179 ?auto_190183 ) ( not ( = ?auto_190176 ?auto_190183 ) ) ( not ( = ?auto_190177 ?auto_190183 ) ) ( not ( = ?auto_190178 ?auto_190183 ) ) ( not ( = ?auto_190179 ?auto_190183 ) ) ( ON ?auto_190178 ?auto_190179 ) ( ON-TABLE ?auto_190181 ) ( ON ?auto_190180 ?auto_190181 ) ( ON ?auto_190184 ?auto_190180 ) ( ON ?auto_190183 ?auto_190184 ) ( not ( = ?auto_190181 ?auto_190180 ) ) ( not ( = ?auto_190181 ?auto_190184 ) ) ( not ( = ?auto_190181 ?auto_190183 ) ) ( not ( = ?auto_190181 ?auto_190179 ) ) ( not ( = ?auto_190181 ?auto_190178 ) ) ( not ( = ?auto_190180 ?auto_190184 ) ) ( not ( = ?auto_190180 ?auto_190183 ) ) ( not ( = ?auto_190180 ?auto_190179 ) ) ( not ( = ?auto_190180 ?auto_190178 ) ) ( not ( = ?auto_190184 ?auto_190183 ) ) ( not ( = ?auto_190184 ?auto_190179 ) ) ( not ( = ?auto_190184 ?auto_190178 ) ) ( not ( = ?auto_190176 ?auto_190181 ) ) ( not ( = ?auto_190176 ?auto_190180 ) ) ( not ( = ?auto_190176 ?auto_190184 ) ) ( not ( = ?auto_190177 ?auto_190181 ) ) ( not ( = ?auto_190177 ?auto_190180 ) ) ( not ( = ?auto_190177 ?auto_190184 ) ) ( ON ?auto_190176 ?auto_190182 ) ( CLEAR ?auto_190176 ) ( not ( = ?auto_190176 ?auto_190182 ) ) ( not ( = ?auto_190177 ?auto_190182 ) ) ( not ( = ?auto_190178 ?auto_190182 ) ) ( not ( = ?auto_190179 ?auto_190182 ) ) ( not ( = ?auto_190183 ?auto_190182 ) ) ( not ( = ?auto_190181 ?auto_190182 ) ) ( not ( = ?auto_190180 ?auto_190182 ) ) ( not ( = ?auto_190184 ?auto_190182 ) ) ( HOLDING ?auto_190177 ) ( CLEAR ?auto_190178 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190181 ?auto_190180 ?auto_190184 ?auto_190183 ?auto_190179 ?auto_190178 ?auto_190177 )
      ( MAKE-4PILE ?auto_190176 ?auto_190177 ?auto_190178 ?auto_190179 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190185 - BLOCK
      ?auto_190186 - BLOCK
      ?auto_190187 - BLOCK
      ?auto_190188 - BLOCK
    )
    :vars
    (
      ?auto_190190 - BLOCK
      ?auto_190192 - BLOCK
      ?auto_190189 - BLOCK
      ?auto_190193 - BLOCK
      ?auto_190191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190185 ?auto_190186 ) ) ( not ( = ?auto_190185 ?auto_190187 ) ) ( not ( = ?auto_190185 ?auto_190188 ) ) ( not ( = ?auto_190186 ?auto_190187 ) ) ( not ( = ?auto_190186 ?auto_190188 ) ) ( not ( = ?auto_190187 ?auto_190188 ) ) ( ON ?auto_190188 ?auto_190190 ) ( not ( = ?auto_190185 ?auto_190190 ) ) ( not ( = ?auto_190186 ?auto_190190 ) ) ( not ( = ?auto_190187 ?auto_190190 ) ) ( not ( = ?auto_190188 ?auto_190190 ) ) ( ON ?auto_190187 ?auto_190188 ) ( ON-TABLE ?auto_190192 ) ( ON ?auto_190189 ?auto_190192 ) ( ON ?auto_190193 ?auto_190189 ) ( ON ?auto_190190 ?auto_190193 ) ( not ( = ?auto_190192 ?auto_190189 ) ) ( not ( = ?auto_190192 ?auto_190193 ) ) ( not ( = ?auto_190192 ?auto_190190 ) ) ( not ( = ?auto_190192 ?auto_190188 ) ) ( not ( = ?auto_190192 ?auto_190187 ) ) ( not ( = ?auto_190189 ?auto_190193 ) ) ( not ( = ?auto_190189 ?auto_190190 ) ) ( not ( = ?auto_190189 ?auto_190188 ) ) ( not ( = ?auto_190189 ?auto_190187 ) ) ( not ( = ?auto_190193 ?auto_190190 ) ) ( not ( = ?auto_190193 ?auto_190188 ) ) ( not ( = ?auto_190193 ?auto_190187 ) ) ( not ( = ?auto_190185 ?auto_190192 ) ) ( not ( = ?auto_190185 ?auto_190189 ) ) ( not ( = ?auto_190185 ?auto_190193 ) ) ( not ( = ?auto_190186 ?auto_190192 ) ) ( not ( = ?auto_190186 ?auto_190189 ) ) ( not ( = ?auto_190186 ?auto_190193 ) ) ( ON ?auto_190185 ?auto_190191 ) ( not ( = ?auto_190185 ?auto_190191 ) ) ( not ( = ?auto_190186 ?auto_190191 ) ) ( not ( = ?auto_190187 ?auto_190191 ) ) ( not ( = ?auto_190188 ?auto_190191 ) ) ( not ( = ?auto_190190 ?auto_190191 ) ) ( not ( = ?auto_190192 ?auto_190191 ) ) ( not ( = ?auto_190189 ?auto_190191 ) ) ( not ( = ?auto_190193 ?auto_190191 ) ) ( CLEAR ?auto_190187 ) ( ON ?auto_190186 ?auto_190185 ) ( CLEAR ?auto_190186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190191 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190191 ?auto_190185 )
      ( MAKE-4PILE ?auto_190185 ?auto_190186 ?auto_190187 ?auto_190188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190194 - BLOCK
      ?auto_190195 - BLOCK
      ?auto_190196 - BLOCK
      ?auto_190197 - BLOCK
    )
    :vars
    (
      ?auto_190198 - BLOCK
      ?auto_190202 - BLOCK
      ?auto_190201 - BLOCK
      ?auto_190199 - BLOCK
      ?auto_190200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190194 ?auto_190195 ) ) ( not ( = ?auto_190194 ?auto_190196 ) ) ( not ( = ?auto_190194 ?auto_190197 ) ) ( not ( = ?auto_190195 ?auto_190196 ) ) ( not ( = ?auto_190195 ?auto_190197 ) ) ( not ( = ?auto_190196 ?auto_190197 ) ) ( ON ?auto_190197 ?auto_190198 ) ( not ( = ?auto_190194 ?auto_190198 ) ) ( not ( = ?auto_190195 ?auto_190198 ) ) ( not ( = ?auto_190196 ?auto_190198 ) ) ( not ( = ?auto_190197 ?auto_190198 ) ) ( ON-TABLE ?auto_190202 ) ( ON ?auto_190201 ?auto_190202 ) ( ON ?auto_190199 ?auto_190201 ) ( ON ?auto_190198 ?auto_190199 ) ( not ( = ?auto_190202 ?auto_190201 ) ) ( not ( = ?auto_190202 ?auto_190199 ) ) ( not ( = ?auto_190202 ?auto_190198 ) ) ( not ( = ?auto_190202 ?auto_190197 ) ) ( not ( = ?auto_190202 ?auto_190196 ) ) ( not ( = ?auto_190201 ?auto_190199 ) ) ( not ( = ?auto_190201 ?auto_190198 ) ) ( not ( = ?auto_190201 ?auto_190197 ) ) ( not ( = ?auto_190201 ?auto_190196 ) ) ( not ( = ?auto_190199 ?auto_190198 ) ) ( not ( = ?auto_190199 ?auto_190197 ) ) ( not ( = ?auto_190199 ?auto_190196 ) ) ( not ( = ?auto_190194 ?auto_190202 ) ) ( not ( = ?auto_190194 ?auto_190201 ) ) ( not ( = ?auto_190194 ?auto_190199 ) ) ( not ( = ?auto_190195 ?auto_190202 ) ) ( not ( = ?auto_190195 ?auto_190201 ) ) ( not ( = ?auto_190195 ?auto_190199 ) ) ( ON ?auto_190194 ?auto_190200 ) ( not ( = ?auto_190194 ?auto_190200 ) ) ( not ( = ?auto_190195 ?auto_190200 ) ) ( not ( = ?auto_190196 ?auto_190200 ) ) ( not ( = ?auto_190197 ?auto_190200 ) ) ( not ( = ?auto_190198 ?auto_190200 ) ) ( not ( = ?auto_190202 ?auto_190200 ) ) ( not ( = ?auto_190201 ?auto_190200 ) ) ( not ( = ?auto_190199 ?auto_190200 ) ) ( ON ?auto_190195 ?auto_190194 ) ( CLEAR ?auto_190195 ) ( ON-TABLE ?auto_190200 ) ( HOLDING ?auto_190196 ) ( CLEAR ?auto_190197 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190202 ?auto_190201 ?auto_190199 ?auto_190198 ?auto_190197 ?auto_190196 )
      ( MAKE-4PILE ?auto_190194 ?auto_190195 ?auto_190196 ?auto_190197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190203 - BLOCK
      ?auto_190204 - BLOCK
      ?auto_190205 - BLOCK
      ?auto_190206 - BLOCK
    )
    :vars
    (
      ?auto_190207 - BLOCK
      ?auto_190208 - BLOCK
      ?auto_190210 - BLOCK
      ?auto_190211 - BLOCK
      ?auto_190209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190203 ?auto_190204 ) ) ( not ( = ?auto_190203 ?auto_190205 ) ) ( not ( = ?auto_190203 ?auto_190206 ) ) ( not ( = ?auto_190204 ?auto_190205 ) ) ( not ( = ?auto_190204 ?auto_190206 ) ) ( not ( = ?auto_190205 ?auto_190206 ) ) ( ON ?auto_190206 ?auto_190207 ) ( not ( = ?auto_190203 ?auto_190207 ) ) ( not ( = ?auto_190204 ?auto_190207 ) ) ( not ( = ?auto_190205 ?auto_190207 ) ) ( not ( = ?auto_190206 ?auto_190207 ) ) ( ON-TABLE ?auto_190208 ) ( ON ?auto_190210 ?auto_190208 ) ( ON ?auto_190211 ?auto_190210 ) ( ON ?auto_190207 ?auto_190211 ) ( not ( = ?auto_190208 ?auto_190210 ) ) ( not ( = ?auto_190208 ?auto_190211 ) ) ( not ( = ?auto_190208 ?auto_190207 ) ) ( not ( = ?auto_190208 ?auto_190206 ) ) ( not ( = ?auto_190208 ?auto_190205 ) ) ( not ( = ?auto_190210 ?auto_190211 ) ) ( not ( = ?auto_190210 ?auto_190207 ) ) ( not ( = ?auto_190210 ?auto_190206 ) ) ( not ( = ?auto_190210 ?auto_190205 ) ) ( not ( = ?auto_190211 ?auto_190207 ) ) ( not ( = ?auto_190211 ?auto_190206 ) ) ( not ( = ?auto_190211 ?auto_190205 ) ) ( not ( = ?auto_190203 ?auto_190208 ) ) ( not ( = ?auto_190203 ?auto_190210 ) ) ( not ( = ?auto_190203 ?auto_190211 ) ) ( not ( = ?auto_190204 ?auto_190208 ) ) ( not ( = ?auto_190204 ?auto_190210 ) ) ( not ( = ?auto_190204 ?auto_190211 ) ) ( ON ?auto_190203 ?auto_190209 ) ( not ( = ?auto_190203 ?auto_190209 ) ) ( not ( = ?auto_190204 ?auto_190209 ) ) ( not ( = ?auto_190205 ?auto_190209 ) ) ( not ( = ?auto_190206 ?auto_190209 ) ) ( not ( = ?auto_190207 ?auto_190209 ) ) ( not ( = ?auto_190208 ?auto_190209 ) ) ( not ( = ?auto_190210 ?auto_190209 ) ) ( not ( = ?auto_190211 ?auto_190209 ) ) ( ON ?auto_190204 ?auto_190203 ) ( ON-TABLE ?auto_190209 ) ( CLEAR ?auto_190206 ) ( ON ?auto_190205 ?auto_190204 ) ( CLEAR ?auto_190205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190209 ?auto_190203 ?auto_190204 )
      ( MAKE-4PILE ?auto_190203 ?auto_190204 ?auto_190205 ?auto_190206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190212 - BLOCK
      ?auto_190213 - BLOCK
      ?auto_190214 - BLOCK
      ?auto_190215 - BLOCK
    )
    :vars
    (
      ?auto_190216 - BLOCK
      ?auto_190219 - BLOCK
      ?auto_190220 - BLOCK
      ?auto_190218 - BLOCK
      ?auto_190217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190212 ?auto_190213 ) ) ( not ( = ?auto_190212 ?auto_190214 ) ) ( not ( = ?auto_190212 ?auto_190215 ) ) ( not ( = ?auto_190213 ?auto_190214 ) ) ( not ( = ?auto_190213 ?auto_190215 ) ) ( not ( = ?auto_190214 ?auto_190215 ) ) ( not ( = ?auto_190212 ?auto_190216 ) ) ( not ( = ?auto_190213 ?auto_190216 ) ) ( not ( = ?auto_190214 ?auto_190216 ) ) ( not ( = ?auto_190215 ?auto_190216 ) ) ( ON-TABLE ?auto_190219 ) ( ON ?auto_190220 ?auto_190219 ) ( ON ?auto_190218 ?auto_190220 ) ( ON ?auto_190216 ?auto_190218 ) ( not ( = ?auto_190219 ?auto_190220 ) ) ( not ( = ?auto_190219 ?auto_190218 ) ) ( not ( = ?auto_190219 ?auto_190216 ) ) ( not ( = ?auto_190219 ?auto_190215 ) ) ( not ( = ?auto_190219 ?auto_190214 ) ) ( not ( = ?auto_190220 ?auto_190218 ) ) ( not ( = ?auto_190220 ?auto_190216 ) ) ( not ( = ?auto_190220 ?auto_190215 ) ) ( not ( = ?auto_190220 ?auto_190214 ) ) ( not ( = ?auto_190218 ?auto_190216 ) ) ( not ( = ?auto_190218 ?auto_190215 ) ) ( not ( = ?auto_190218 ?auto_190214 ) ) ( not ( = ?auto_190212 ?auto_190219 ) ) ( not ( = ?auto_190212 ?auto_190220 ) ) ( not ( = ?auto_190212 ?auto_190218 ) ) ( not ( = ?auto_190213 ?auto_190219 ) ) ( not ( = ?auto_190213 ?auto_190220 ) ) ( not ( = ?auto_190213 ?auto_190218 ) ) ( ON ?auto_190212 ?auto_190217 ) ( not ( = ?auto_190212 ?auto_190217 ) ) ( not ( = ?auto_190213 ?auto_190217 ) ) ( not ( = ?auto_190214 ?auto_190217 ) ) ( not ( = ?auto_190215 ?auto_190217 ) ) ( not ( = ?auto_190216 ?auto_190217 ) ) ( not ( = ?auto_190219 ?auto_190217 ) ) ( not ( = ?auto_190220 ?auto_190217 ) ) ( not ( = ?auto_190218 ?auto_190217 ) ) ( ON ?auto_190213 ?auto_190212 ) ( ON-TABLE ?auto_190217 ) ( ON ?auto_190214 ?auto_190213 ) ( CLEAR ?auto_190214 ) ( HOLDING ?auto_190215 ) ( CLEAR ?auto_190216 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190219 ?auto_190220 ?auto_190218 ?auto_190216 ?auto_190215 )
      ( MAKE-4PILE ?auto_190212 ?auto_190213 ?auto_190214 ?auto_190215 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190221 - BLOCK
      ?auto_190222 - BLOCK
      ?auto_190223 - BLOCK
      ?auto_190224 - BLOCK
    )
    :vars
    (
      ?auto_190225 - BLOCK
      ?auto_190228 - BLOCK
      ?auto_190226 - BLOCK
      ?auto_190229 - BLOCK
      ?auto_190227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190221 ?auto_190222 ) ) ( not ( = ?auto_190221 ?auto_190223 ) ) ( not ( = ?auto_190221 ?auto_190224 ) ) ( not ( = ?auto_190222 ?auto_190223 ) ) ( not ( = ?auto_190222 ?auto_190224 ) ) ( not ( = ?auto_190223 ?auto_190224 ) ) ( not ( = ?auto_190221 ?auto_190225 ) ) ( not ( = ?auto_190222 ?auto_190225 ) ) ( not ( = ?auto_190223 ?auto_190225 ) ) ( not ( = ?auto_190224 ?auto_190225 ) ) ( ON-TABLE ?auto_190228 ) ( ON ?auto_190226 ?auto_190228 ) ( ON ?auto_190229 ?auto_190226 ) ( ON ?auto_190225 ?auto_190229 ) ( not ( = ?auto_190228 ?auto_190226 ) ) ( not ( = ?auto_190228 ?auto_190229 ) ) ( not ( = ?auto_190228 ?auto_190225 ) ) ( not ( = ?auto_190228 ?auto_190224 ) ) ( not ( = ?auto_190228 ?auto_190223 ) ) ( not ( = ?auto_190226 ?auto_190229 ) ) ( not ( = ?auto_190226 ?auto_190225 ) ) ( not ( = ?auto_190226 ?auto_190224 ) ) ( not ( = ?auto_190226 ?auto_190223 ) ) ( not ( = ?auto_190229 ?auto_190225 ) ) ( not ( = ?auto_190229 ?auto_190224 ) ) ( not ( = ?auto_190229 ?auto_190223 ) ) ( not ( = ?auto_190221 ?auto_190228 ) ) ( not ( = ?auto_190221 ?auto_190226 ) ) ( not ( = ?auto_190221 ?auto_190229 ) ) ( not ( = ?auto_190222 ?auto_190228 ) ) ( not ( = ?auto_190222 ?auto_190226 ) ) ( not ( = ?auto_190222 ?auto_190229 ) ) ( ON ?auto_190221 ?auto_190227 ) ( not ( = ?auto_190221 ?auto_190227 ) ) ( not ( = ?auto_190222 ?auto_190227 ) ) ( not ( = ?auto_190223 ?auto_190227 ) ) ( not ( = ?auto_190224 ?auto_190227 ) ) ( not ( = ?auto_190225 ?auto_190227 ) ) ( not ( = ?auto_190228 ?auto_190227 ) ) ( not ( = ?auto_190226 ?auto_190227 ) ) ( not ( = ?auto_190229 ?auto_190227 ) ) ( ON ?auto_190222 ?auto_190221 ) ( ON-TABLE ?auto_190227 ) ( ON ?auto_190223 ?auto_190222 ) ( CLEAR ?auto_190225 ) ( ON ?auto_190224 ?auto_190223 ) ( CLEAR ?auto_190224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190227 ?auto_190221 ?auto_190222 ?auto_190223 )
      ( MAKE-4PILE ?auto_190221 ?auto_190222 ?auto_190223 ?auto_190224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190230 - BLOCK
      ?auto_190231 - BLOCK
      ?auto_190232 - BLOCK
      ?auto_190233 - BLOCK
    )
    :vars
    (
      ?auto_190236 - BLOCK
      ?auto_190238 - BLOCK
      ?auto_190237 - BLOCK
      ?auto_190234 - BLOCK
      ?auto_190235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190230 ?auto_190231 ) ) ( not ( = ?auto_190230 ?auto_190232 ) ) ( not ( = ?auto_190230 ?auto_190233 ) ) ( not ( = ?auto_190231 ?auto_190232 ) ) ( not ( = ?auto_190231 ?auto_190233 ) ) ( not ( = ?auto_190232 ?auto_190233 ) ) ( not ( = ?auto_190230 ?auto_190236 ) ) ( not ( = ?auto_190231 ?auto_190236 ) ) ( not ( = ?auto_190232 ?auto_190236 ) ) ( not ( = ?auto_190233 ?auto_190236 ) ) ( ON-TABLE ?auto_190238 ) ( ON ?auto_190237 ?auto_190238 ) ( ON ?auto_190234 ?auto_190237 ) ( not ( = ?auto_190238 ?auto_190237 ) ) ( not ( = ?auto_190238 ?auto_190234 ) ) ( not ( = ?auto_190238 ?auto_190236 ) ) ( not ( = ?auto_190238 ?auto_190233 ) ) ( not ( = ?auto_190238 ?auto_190232 ) ) ( not ( = ?auto_190237 ?auto_190234 ) ) ( not ( = ?auto_190237 ?auto_190236 ) ) ( not ( = ?auto_190237 ?auto_190233 ) ) ( not ( = ?auto_190237 ?auto_190232 ) ) ( not ( = ?auto_190234 ?auto_190236 ) ) ( not ( = ?auto_190234 ?auto_190233 ) ) ( not ( = ?auto_190234 ?auto_190232 ) ) ( not ( = ?auto_190230 ?auto_190238 ) ) ( not ( = ?auto_190230 ?auto_190237 ) ) ( not ( = ?auto_190230 ?auto_190234 ) ) ( not ( = ?auto_190231 ?auto_190238 ) ) ( not ( = ?auto_190231 ?auto_190237 ) ) ( not ( = ?auto_190231 ?auto_190234 ) ) ( ON ?auto_190230 ?auto_190235 ) ( not ( = ?auto_190230 ?auto_190235 ) ) ( not ( = ?auto_190231 ?auto_190235 ) ) ( not ( = ?auto_190232 ?auto_190235 ) ) ( not ( = ?auto_190233 ?auto_190235 ) ) ( not ( = ?auto_190236 ?auto_190235 ) ) ( not ( = ?auto_190238 ?auto_190235 ) ) ( not ( = ?auto_190237 ?auto_190235 ) ) ( not ( = ?auto_190234 ?auto_190235 ) ) ( ON ?auto_190231 ?auto_190230 ) ( ON-TABLE ?auto_190235 ) ( ON ?auto_190232 ?auto_190231 ) ( ON ?auto_190233 ?auto_190232 ) ( CLEAR ?auto_190233 ) ( HOLDING ?auto_190236 ) ( CLEAR ?auto_190234 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190238 ?auto_190237 ?auto_190234 ?auto_190236 )
      ( MAKE-4PILE ?auto_190230 ?auto_190231 ?auto_190232 ?auto_190233 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190239 - BLOCK
      ?auto_190240 - BLOCK
      ?auto_190241 - BLOCK
      ?auto_190242 - BLOCK
    )
    :vars
    (
      ?auto_190247 - BLOCK
      ?auto_190245 - BLOCK
      ?auto_190244 - BLOCK
      ?auto_190246 - BLOCK
      ?auto_190243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190239 ?auto_190240 ) ) ( not ( = ?auto_190239 ?auto_190241 ) ) ( not ( = ?auto_190239 ?auto_190242 ) ) ( not ( = ?auto_190240 ?auto_190241 ) ) ( not ( = ?auto_190240 ?auto_190242 ) ) ( not ( = ?auto_190241 ?auto_190242 ) ) ( not ( = ?auto_190239 ?auto_190247 ) ) ( not ( = ?auto_190240 ?auto_190247 ) ) ( not ( = ?auto_190241 ?auto_190247 ) ) ( not ( = ?auto_190242 ?auto_190247 ) ) ( ON-TABLE ?auto_190245 ) ( ON ?auto_190244 ?auto_190245 ) ( ON ?auto_190246 ?auto_190244 ) ( not ( = ?auto_190245 ?auto_190244 ) ) ( not ( = ?auto_190245 ?auto_190246 ) ) ( not ( = ?auto_190245 ?auto_190247 ) ) ( not ( = ?auto_190245 ?auto_190242 ) ) ( not ( = ?auto_190245 ?auto_190241 ) ) ( not ( = ?auto_190244 ?auto_190246 ) ) ( not ( = ?auto_190244 ?auto_190247 ) ) ( not ( = ?auto_190244 ?auto_190242 ) ) ( not ( = ?auto_190244 ?auto_190241 ) ) ( not ( = ?auto_190246 ?auto_190247 ) ) ( not ( = ?auto_190246 ?auto_190242 ) ) ( not ( = ?auto_190246 ?auto_190241 ) ) ( not ( = ?auto_190239 ?auto_190245 ) ) ( not ( = ?auto_190239 ?auto_190244 ) ) ( not ( = ?auto_190239 ?auto_190246 ) ) ( not ( = ?auto_190240 ?auto_190245 ) ) ( not ( = ?auto_190240 ?auto_190244 ) ) ( not ( = ?auto_190240 ?auto_190246 ) ) ( ON ?auto_190239 ?auto_190243 ) ( not ( = ?auto_190239 ?auto_190243 ) ) ( not ( = ?auto_190240 ?auto_190243 ) ) ( not ( = ?auto_190241 ?auto_190243 ) ) ( not ( = ?auto_190242 ?auto_190243 ) ) ( not ( = ?auto_190247 ?auto_190243 ) ) ( not ( = ?auto_190245 ?auto_190243 ) ) ( not ( = ?auto_190244 ?auto_190243 ) ) ( not ( = ?auto_190246 ?auto_190243 ) ) ( ON ?auto_190240 ?auto_190239 ) ( ON-TABLE ?auto_190243 ) ( ON ?auto_190241 ?auto_190240 ) ( ON ?auto_190242 ?auto_190241 ) ( CLEAR ?auto_190246 ) ( ON ?auto_190247 ?auto_190242 ) ( CLEAR ?auto_190247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190243 ?auto_190239 ?auto_190240 ?auto_190241 ?auto_190242 )
      ( MAKE-4PILE ?auto_190239 ?auto_190240 ?auto_190241 ?auto_190242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190248 - BLOCK
      ?auto_190249 - BLOCK
      ?auto_190250 - BLOCK
      ?auto_190251 - BLOCK
    )
    :vars
    (
      ?auto_190253 - BLOCK
      ?auto_190252 - BLOCK
      ?auto_190254 - BLOCK
      ?auto_190256 - BLOCK
      ?auto_190255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190248 ?auto_190249 ) ) ( not ( = ?auto_190248 ?auto_190250 ) ) ( not ( = ?auto_190248 ?auto_190251 ) ) ( not ( = ?auto_190249 ?auto_190250 ) ) ( not ( = ?auto_190249 ?auto_190251 ) ) ( not ( = ?auto_190250 ?auto_190251 ) ) ( not ( = ?auto_190248 ?auto_190253 ) ) ( not ( = ?auto_190249 ?auto_190253 ) ) ( not ( = ?auto_190250 ?auto_190253 ) ) ( not ( = ?auto_190251 ?auto_190253 ) ) ( ON-TABLE ?auto_190252 ) ( ON ?auto_190254 ?auto_190252 ) ( not ( = ?auto_190252 ?auto_190254 ) ) ( not ( = ?auto_190252 ?auto_190256 ) ) ( not ( = ?auto_190252 ?auto_190253 ) ) ( not ( = ?auto_190252 ?auto_190251 ) ) ( not ( = ?auto_190252 ?auto_190250 ) ) ( not ( = ?auto_190254 ?auto_190256 ) ) ( not ( = ?auto_190254 ?auto_190253 ) ) ( not ( = ?auto_190254 ?auto_190251 ) ) ( not ( = ?auto_190254 ?auto_190250 ) ) ( not ( = ?auto_190256 ?auto_190253 ) ) ( not ( = ?auto_190256 ?auto_190251 ) ) ( not ( = ?auto_190256 ?auto_190250 ) ) ( not ( = ?auto_190248 ?auto_190252 ) ) ( not ( = ?auto_190248 ?auto_190254 ) ) ( not ( = ?auto_190248 ?auto_190256 ) ) ( not ( = ?auto_190249 ?auto_190252 ) ) ( not ( = ?auto_190249 ?auto_190254 ) ) ( not ( = ?auto_190249 ?auto_190256 ) ) ( ON ?auto_190248 ?auto_190255 ) ( not ( = ?auto_190248 ?auto_190255 ) ) ( not ( = ?auto_190249 ?auto_190255 ) ) ( not ( = ?auto_190250 ?auto_190255 ) ) ( not ( = ?auto_190251 ?auto_190255 ) ) ( not ( = ?auto_190253 ?auto_190255 ) ) ( not ( = ?auto_190252 ?auto_190255 ) ) ( not ( = ?auto_190254 ?auto_190255 ) ) ( not ( = ?auto_190256 ?auto_190255 ) ) ( ON ?auto_190249 ?auto_190248 ) ( ON-TABLE ?auto_190255 ) ( ON ?auto_190250 ?auto_190249 ) ( ON ?auto_190251 ?auto_190250 ) ( ON ?auto_190253 ?auto_190251 ) ( CLEAR ?auto_190253 ) ( HOLDING ?auto_190256 ) ( CLEAR ?auto_190254 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190252 ?auto_190254 ?auto_190256 )
      ( MAKE-4PILE ?auto_190248 ?auto_190249 ?auto_190250 ?auto_190251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190257 - BLOCK
      ?auto_190258 - BLOCK
      ?auto_190259 - BLOCK
      ?auto_190260 - BLOCK
    )
    :vars
    (
      ?auto_190263 - BLOCK
      ?auto_190265 - BLOCK
      ?auto_190264 - BLOCK
      ?auto_190262 - BLOCK
      ?auto_190261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190257 ?auto_190258 ) ) ( not ( = ?auto_190257 ?auto_190259 ) ) ( not ( = ?auto_190257 ?auto_190260 ) ) ( not ( = ?auto_190258 ?auto_190259 ) ) ( not ( = ?auto_190258 ?auto_190260 ) ) ( not ( = ?auto_190259 ?auto_190260 ) ) ( not ( = ?auto_190257 ?auto_190263 ) ) ( not ( = ?auto_190258 ?auto_190263 ) ) ( not ( = ?auto_190259 ?auto_190263 ) ) ( not ( = ?auto_190260 ?auto_190263 ) ) ( ON-TABLE ?auto_190265 ) ( ON ?auto_190264 ?auto_190265 ) ( not ( = ?auto_190265 ?auto_190264 ) ) ( not ( = ?auto_190265 ?auto_190262 ) ) ( not ( = ?auto_190265 ?auto_190263 ) ) ( not ( = ?auto_190265 ?auto_190260 ) ) ( not ( = ?auto_190265 ?auto_190259 ) ) ( not ( = ?auto_190264 ?auto_190262 ) ) ( not ( = ?auto_190264 ?auto_190263 ) ) ( not ( = ?auto_190264 ?auto_190260 ) ) ( not ( = ?auto_190264 ?auto_190259 ) ) ( not ( = ?auto_190262 ?auto_190263 ) ) ( not ( = ?auto_190262 ?auto_190260 ) ) ( not ( = ?auto_190262 ?auto_190259 ) ) ( not ( = ?auto_190257 ?auto_190265 ) ) ( not ( = ?auto_190257 ?auto_190264 ) ) ( not ( = ?auto_190257 ?auto_190262 ) ) ( not ( = ?auto_190258 ?auto_190265 ) ) ( not ( = ?auto_190258 ?auto_190264 ) ) ( not ( = ?auto_190258 ?auto_190262 ) ) ( ON ?auto_190257 ?auto_190261 ) ( not ( = ?auto_190257 ?auto_190261 ) ) ( not ( = ?auto_190258 ?auto_190261 ) ) ( not ( = ?auto_190259 ?auto_190261 ) ) ( not ( = ?auto_190260 ?auto_190261 ) ) ( not ( = ?auto_190263 ?auto_190261 ) ) ( not ( = ?auto_190265 ?auto_190261 ) ) ( not ( = ?auto_190264 ?auto_190261 ) ) ( not ( = ?auto_190262 ?auto_190261 ) ) ( ON ?auto_190258 ?auto_190257 ) ( ON-TABLE ?auto_190261 ) ( ON ?auto_190259 ?auto_190258 ) ( ON ?auto_190260 ?auto_190259 ) ( ON ?auto_190263 ?auto_190260 ) ( CLEAR ?auto_190264 ) ( ON ?auto_190262 ?auto_190263 ) ( CLEAR ?auto_190262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190261 ?auto_190257 ?auto_190258 ?auto_190259 ?auto_190260 ?auto_190263 )
      ( MAKE-4PILE ?auto_190257 ?auto_190258 ?auto_190259 ?auto_190260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190266 - BLOCK
      ?auto_190267 - BLOCK
      ?auto_190268 - BLOCK
      ?auto_190269 - BLOCK
    )
    :vars
    (
      ?auto_190271 - BLOCK
      ?auto_190270 - BLOCK
      ?auto_190274 - BLOCK
      ?auto_190273 - BLOCK
      ?auto_190272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190266 ?auto_190267 ) ) ( not ( = ?auto_190266 ?auto_190268 ) ) ( not ( = ?auto_190266 ?auto_190269 ) ) ( not ( = ?auto_190267 ?auto_190268 ) ) ( not ( = ?auto_190267 ?auto_190269 ) ) ( not ( = ?auto_190268 ?auto_190269 ) ) ( not ( = ?auto_190266 ?auto_190271 ) ) ( not ( = ?auto_190267 ?auto_190271 ) ) ( not ( = ?auto_190268 ?auto_190271 ) ) ( not ( = ?auto_190269 ?auto_190271 ) ) ( ON-TABLE ?auto_190270 ) ( not ( = ?auto_190270 ?auto_190274 ) ) ( not ( = ?auto_190270 ?auto_190273 ) ) ( not ( = ?auto_190270 ?auto_190271 ) ) ( not ( = ?auto_190270 ?auto_190269 ) ) ( not ( = ?auto_190270 ?auto_190268 ) ) ( not ( = ?auto_190274 ?auto_190273 ) ) ( not ( = ?auto_190274 ?auto_190271 ) ) ( not ( = ?auto_190274 ?auto_190269 ) ) ( not ( = ?auto_190274 ?auto_190268 ) ) ( not ( = ?auto_190273 ?auto_190271 ) ) ( not ( = ?auto_190273 ?auto_190269 ) ) ( not ( = ?auto_190273 ?auto_190268 ) ) ( not ( = ?auto_190266 ?auto_190270 ) ) ( not ( = ?auto_190266 ?auto_190274 ) ) ( not ( = ?auto_190266 ?auto_190273 ) ) ( not ( = ?auto_190267 ?auto_190270 ) ) ( not ( = ?auto_190267 ?auto_190274 ) ) ( not ( = ?auto_190267 ?auto_190273 ) ) ( ON ?auto_190266 ?auto_190272 ) ( not ( = ?auto_190266 ?auto_190272 ) ) ( not ( = ?auto_190267 ?auto_190272 ) ) ( not ( = ?auto_190268 ?auto_190272 ) ) ( not ( = ?auto_190269 ?auto_190272 ) ) ( not ( = ?auto_190271 ?auto_190272 ) ) ( not ( = ?auto_190270 ?auto_190272 ) ) ( not ( = ?auto_190274 ?auto_190272 ) ) ( not ( = ?auto_190273 ?auto_190272 ) ) ( ON ?auto_190267 ?auto_190266 ) ( ON-TABLE ?auto_190272 ) ( ON ?auto_190268 ?auto_190267 ) ( ON ?auto_190269 ?auto_190268 ) ( ON ?auto_190271 ?auto_190269 ) ( ON ?auto_190273 ?auto_190271 ) ( CLEAR ?auto_190273 ) ( HOLDING ?auto_190274 ) ( CLEAR ?auto_190270 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190270 ?auto_190274 )
      ( MAKE-4PILE ?auto_190266 ?auto_190267 ?auto_190268 ?auto_190269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190275 - BLOCK
      ?auto_190276 - BLOCK
      ?auto_190277 - BLOCK
      ?auto_190278 - BLOCK
    )
    :vars
    (
      ?auto_190283 - BLOCK
      ?auto_190280 - BLOCK
      ?auto_190282 - BLOCK
      ?auto_190279 - BLOCK
      ?auto_190281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190275 ?auto_190276 ) ) ( not ( = ?auto_190275 ?auto_190277 ) ) ( not ( = ?auto_190275 ?auto_190278 ) ) ( not ( = ?auto_190276 ?auto_190277 ) ) ( not ( = ?auto_190276 ?auto_190278 ) ) ( not ( = ?auto_190277 ?auto_190278 ) ) ( not ( = ?auto_190275 ?auto_190283 ) ) ( not ( = ?auto_190276 ?auto_190283 ) ) ( not ( = ?auto_190277 ?auto_190283 ) ) ( not ( = ?auto_190278 ?auto_190283 ) ) ( ON-TABLE ?auto_190280 ) ( not ( = ?auto_190280 ?auto_190282 ) ) ( not ( = ?auto_190280 ?auto_190279 ) ) ( not ( = ?auto_190280 ?auto_190283 ) ) ( not ( = ?auto_190280 ?auto_190278 ) ) ( not ( = ?auto_190280 ?auto_190277 ) ) ( not ( = ?auto_190282 ?auto_190279 ) ) ( not ( = ?auto_190282 ?auto_190283 ) ) ( not ( = ?auto_190282 ?auto_190278 ) ) ( not ( = ?auto_190282 ?auto_190277 ) ) ( not ( = ?auto_190279 ?auto_190283 ) ) ( not ( = ?auto_190279 ?auto_190278 ) ) ( not ( = ?auto_190279 ?auto_190277 ) ) ( not ( = ?auto_190275 ?auto_190280 ) ) ( not ( = ?auto_190275 ?auto_190282 ) ) ( not ( = ?auto_190275 ?auto_190279 ) ) ( not ( = ?auto_190276 ?auto_190280 ) ) ( not ( = ?auto_190276 ?auto_190282 ) ) ( not ( = ?auto_190276 ?auto_190279 ) ) ( ON ?auto_190275 ?auto_190281 ) ( not ( = ?auto_190275 ?auto_190281 ) ) ( not ( = ?auto_190276 ?auto_190281 ) ) ( not ( = ?auto_190277 ?auto_190281 ) ) ( not ( = ?auto_190278 ?auto_190281 ) ) ( not ( = ?auto_190283 ?auto_190281 ) ) ( not ( = ?auto_190280 ?auto_190281 ) ) ( not ( = ?auto_190282 ?auto_190281 ) ) ( not ( = ?auto_190279 ?auto_190281 ) ) ( ON ?auto_190276 ?auto_190275 ) ( ON-TABLE ?auto_190281 ) ( ON ?auto_190277 ?auto_190276 ) ( ON ?auto_190278 ?auto_190277 ) ( ON ?auto_190283 ?auto_190278 ) ( ON ?auto_190279 ?auto_190283 ) ( CLEAR ?auto_190280 ) ( ON ?auto_190282 ?auto_190279 ) ( CLEAR ?auto_190282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190281 ?auto_190275 ?auto_190276 ?auto_190277 ?auto_190278 ?auto_190283 ?auto_190279 )
      ( MAKE-4PILE ?auto_190275 ?auto_190276 ?auto_190277 ?auto_190278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190284 - BLOCK
      ?auto_190285 - BLOCK
      ?auto_190286 - BLOCK
      ?auto_190287 - BLOCK
    )
    :vars
    (
      ?auto_190292 - BLOCK
      ?auto_190289 - BLOCK
      ?auto_190288 - BLOCK
      ?auto_190290 - BLOCK
      ?auto_190291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190284 ?auto_190285 ) ) ( not ( = ?auto_190284 ?auto_190286 ) ) ( not ( = ?auto_190284 ?auto_190287 ) ) ( not ( = ?auto_190285 ?auto_190286 ) ) ( not ( = ?auto_190285 ?auto_190287 ) ) ( not ( = ?auto_190286 ?auto_190287 ) ) ( not ( = ?auto_190284 ?auto_190292 ) ) ( not ( = ?auto_190285 ?auto_190292 ) ) ( not ( = ?auto_190286 ?auto_190292 ) ) ( not ( = ?auto_190287 ?auto_190292 ) ) ( not ( = ?auto_190289 ?auto_190288 ) ) ( not ( = ?auto_190289 ?auto_190290 ) ) ( not ( = ?auto_190289 ?auto_190292 ) ) ( not ( = ?auto_190289 ?auto_190287 ) ) ( not ( = ?auto_190289 ?auto_190286 ) ) ( not ( = ?auto_190288 ?auto_190290 ) ) ( not ( = ?auto_190288 ?auto_190292 ) ) ( not ( = ?auto_190288 ?auto_190287 ) ) ( not ( = ?auto_190288 ?auto_190286 ) ) ( not ( = ?auto_190290 ?auto_190292 ) ) ( not ( = ?auto_190290 ?auto_190287 ) ) ( not ( = ?auto_190290 ?auto_190286 ) ) ( not ( = ?auto_190284 ?auto_190289 ) ) ( not ( = ?auto_190284 ?auto_190288 ) ) ( not ( = ?auto_190284 ?auto_190290 ) ) ( not ( = ?auto_190285 ?auto_190289 ) ) ( not ( = ?auto_190285 ?auto_190288 ) ) ( not ( = ?auto_190285 ?auto_190290 ) ) ( ON ?auto_190284 ?auto_190291 ) ( not ( = ?auto_190284 ?auto_190291 ) ) ( not ( = ?auto_190285 ?auto_190291 ) ) ( not ( = ?auto_190286 ?auto_190291 ) ) ( not ( = ?auto_190287 ?auto_190291 ) ) ( not ( = ?auto_190292 ?auto_190291 ) ) ( not ( = ?auto_190289 ?auto_190291 ) ) ( not ( = ?auto_190288 ?auto_190291 ) ) ( not ( = ?auto_190290 ?auto_190291 ) ) ( ON ?auto_190285 ?auto_190284 ) ( ON-TABLE ?auto_190291 ) ( ON ?auto_190286 ?auto_190285 ) ( ON ?auto_190287 ?auto_190286 ) ( ON ?auto_190292 ?auto_190287 ) ( ON ?auto_190290 ?auto_190292 ) ( ON ?auto_190288 ?auto_190290 ) ( CLEAR ?auto_190288 ) ( HOLDING ?auto_190289 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190289 )
      ( MAKE-4PILE ?auto_190284 ?auto_190285 ?auto_190286 ?auto_190287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_190293 - BLOCK
      ?auto_190294 - BLOCK
      ?auto_190295 - BLOCK
      ?auto_190296 - BLOCK
    )
    :vars
    (
      ?auto_190298 - BLOCK
      ?auto_190297 - BLOCK
      ?auto_190299 - BLOCK
      ?auto_190300 - BLOCK
      ?auto_190301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190293 ?auto_190294 ) ) ( not ( = ?auto_190293 ?auto_190295 ) ) ( not ( = ?auto_190293 ?auto_190296 ) ) ( not ( = ?auto_190294 ?auto_190295 ) ) ( not ( = ?auto_190294 ?auto_190296 ) ) ( not ( = ?auto_190295 ?auto_190296 ) ) ( not ( = ?auto_190293 ?auto_190298 ) ) ( not ( = ?auto_190294 ?auto_190298 ) ) ( not ( = ?auto_190295 ?auto_190298 ) ) ( not ( = ?auto_190296 ?auto_190298 ) ) ( not ( = ?auto_190297 ?auto_190299 ) ) ( not ( = ?auto_190297 ?auto_190300 ) ) ( not ( = ?auto_190297 ?auto_190298 ) ) ( not ( = ?auto_190297 ?auto_190296 ) ) ( not ( = ?auto_190297 ?auto_190295 ) ) ( not ( = ?auto_190299 ?auto_190300 ) ) ( not ( = ?auto_190299 ?auto_190298 ) ) ( not ( = ?auto_190299 ?auto_190296 ) ) ( not ( = ?auto_190299 ?auto_190295 ) ) ( not ( = ?auto_190300 ?auto_190298 ) ) ( not ( = ?auto_190300 ?auto_190296 ) ) ( not ( = ?auto_190300 ?auto_190295 ) ) ( not ( = ?auto_190293 ?auto_190297 ) ) ( not ( = ?auto_190293 ?auto_190299 ) ) ( not ( = ?auto_190293 ?auto_190300 ) ) ( not ( = ?auto_190294 ?auto_190297 ) ) ( not ( = ?auto_190294 ?auto_190299 ) ) ( not ( = ?auto_190294 ?auto_190300 ) ) ( ON ?auto_190293 ?auto_190301 ) ( not ( = ?auto_190293 ?auto_190301 ) ) ( not ( = ?auto_190294 ?auto_190301 ) ) ( not ( = ?auto_190295 ?auto_190301 ) ) ( not ( = ?auto_190296 ?auto_190301 ) ) ( not ( = ?auto_190298 ?auto_190301 ) ) ( not ( = ?auto_190297 ?auto_190301 ) ) ( not ( = ?auto_190299 ?auto_190301 ) ) ( not ( = ?auto_190300 ?auto_190301 ) ) ( ON ?auto_190294 ?auto_190293 ) ( ON-TABLE ?auto_190301 ) ( ON ?auto_190295 ?auto_190294 ) ( ON ?auto_190296 ?auto_190295 ) ( ON ?auto_190298 ?auto_190296 ) ( ON ?auto_190300 ?auto_190298 ) ( ON ?auto_190299 ?auto_190300 ) ( ON ?auto_190297 ?auto_190299 ) ( CLEAR ?auto_190297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190301 ?auto_190293 ?auto_190294 ?auto_190295 ?auto_190296 ?auto_190298 ?auto_190300 ?auto_190299 )
      ( MAKE-4PILE ?auto_190293 ?auto_190294 ?auto_190295 ?auto_190296 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190305 - BLOCK
      ?auto_190306 - BLOCK
      ?auto_190307 - BLOCK
    )
    :vars
    (
      ?auto_190308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190308 ?auto_190307 ) ( CLEAR ?auto_190308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190305 ) ( ON ?auto_190306 ?auto_190305 ) ( ON ?auto_190307 ?auto_190306 ) ( not ( = ?auto_190305 ?auto_190306 ) ) ( not ( = ?auto_190305 ?auto_190307 ) ) ( not ( = ?auto_190305 ?auto_190308 ) ) ( not ( = ?auto_190306 ?auto_190307 ) ) ( not ( = ?auto_190306 ?auto_190308 ) ) ( not ( = ?auto_190307 ?auto_190308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190308 ?auto_190307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190309 - BLOCK
      ?auto_190310 - BLOCK
      ?auto_190311 - BLOCK
    )
    :vars
    (
      ?auto_190312 - BLOCK
      ?auto_190313 - BLOCK
      ?auto_190314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190312 ?auto_190311 ) ( CLEAR ?auto_190312 ) ( ON-TABLE ?auto_190309 ) ( ON ?auto_190310 ?auto_190309 ) ( ON ?auto_190311 ?auto_190310 ) ( not ( = ?auto_190309 ?auto_190310 ) ) ( not ( = ?auto_190309 ?auto_190311 ) ) ( not ( = ?auto_190309 ?auto_190312 ) ) ( not ( = ?auto_190310 ?auto_190311 ) ) ( not ( = ?auto_190310 ?auto_190312 ) ) ( not ( = ?auto_190311 ?auto_190312 ) ) ( HOLDING ?auto_190313 ) ( CLEAR ?auto_190314 ) ( not ( = ?auto_190309 ?auto_190313 ) ) ( not ( = ?auto_190309 ?auto_190314 ) ) ( not ( = ?auto_190310 ?auto_190313 ) ) ( not ( = ?auto_190310 ?auto_190314 ) ) ( not ( = ?auto_190311 ?auto_190313 ) ) ( not ( = ?auto_190311 ?auto_190314 ) ) ( not ( = ?auto_190312 ?auto_190313 ) ) ( not ( = ?auto_190312 ?auto_190314 ) ) ( not ( = ?auto_190313 ?auto_190314 ) ) )
    :subtasks
    ( ( !STACK ?auto_190313 ?auto_190314 )
      ( MAKE-3PILE ?auto_190309 ?auto_190310 ?auto_190311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190315 - BLOCK
      ?auto_190316 - BLOCK
      ?auto_190317 - BLOCK
    )
    :vars
    (
      ?auto_190319 - BLOCK
      ?auto_190318 - BLOCK
      ?auto_190320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190319 ?auto_190317 ) ( ON-TABLE ?auto_190315 ) ( ON ?auto_190316 ?auto_190315 ) ( ON ?auto_190317 ?auto_190316 ) ( not ( = ?auto_190315 ?auto_190316 ) ) ( not ( = ?auto_190315 ?auto_190317 ) ) ( not ( = ?auto_190315 ?auto_190319 ) ) ( not ( = ?auto_190316 ?auto_190317 ) ) ( not ( = ?auto_190316 ?auto_190319 ) ) ( not ( = ?auto_190317 ?auto_190319 ) ) ( CLEAR ?auto_190318 ) ( not ( = ?auto_190315 ?auto_190320 ) ) ( not ( = ?auto_190315 ?auto_190318 ) ) ( not ( = ?auto_190316 ?auto_190320 ) ) ( not ( = ?auto_190316 ?auto_190318 ) ) ( not ( = ?auto_190317 ?auto_190320 ) ) ( not ( = ?auto_190317 ?auto_190318 ) ) ( not ( = ?auto_190319 ?auto_190320 ) ) ( not ( = ?auto_190319 ?auto_190318 ) ) ( not ( = ?auto_190320 ?auto_190318 ) ) ( ON ?auto_190320 ?auto_190319 ) ( CLEAR ?auto_190320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190315 ?auto_190316 ?auto_190317 ?auto_190319 )
      ( MAKE-3PILE ?auto_190315 ?auto_190316 ?auto_190317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190321 - BLOCK
      ?auto_190322 - BLOCK
      ?auto_190323 - BLOCK
    )
    :vars
    (
      ?auto_190324 - BLOCK
      ?auto_190325 - BLOCK
      ?auto_190326 - BLOCK
      ?auto_190327 - BLOCK
      ?auto_190328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190324 ?auto_190323 ) ( ON-TABLE ?auto_190321 ) ( ON ?auto_190322 ?auto_190321 ) ( ON ?auto_190323 ?auto_190322 ) ( not ( = ?auto_190321 ?auto_190322 ) ) ( not ( = ?auto_190321 ?auto_190323 ) ) ( not ( = ?auto_190321 ?auto_190324 ) ) ( not ( = ?auto_190322 ?auto_190323 ) ) ( not ( = ?auto_190322 ?auto_190324 ) ) ( not ( = ?auto_190323 ?auto_190324 ) ) ( not ( = ?auto_190321 ?auto_190325 ) ) ( not ( = ?auto_190321 ?auto_190326 ) ) ( not ( = ?auto_190322 ?auto_190325 ) ) ( not ( = ?auto_190322 ?auto_190326 ) ) ( not ( = ?auto_190323 ?auto_190325 ) ) ( not ( = ?auto_190323 ?auto_190326 ) ) ( not ( = ?auto_190324 ?auto_190325 ) ) ( not ( = ?auto_190324 ?auto_190326 ) ) ( not ( = ?auto_190325 ?auto_190326 ) ) ( ON ?auto_190325 ?auto_190324 ) ( CLEAR ?auto_190325 ) ( HOLDING ?auto_190326 ) ( CLEAR ?auto_190327 ) ( ON-TABLE ?auto_190328 ) ( ON ?auto_190327 ?auto_190328 ) ( not ( = ?auto_190328 ?auto_190327 ) ) ( not ( = ?auto_190328 ?auto_190326 ) ) ( not ( = ?auto_190327 ?auto_190326 ) ) ( not ( = ?auto_190321 ?auto_190327 ) ) ( not ( = ?auto_190321 ?auto_190328 ) ) ( not ( = ?auto_190322 ?auto_190327 ) ) ( not ( = ?auto_190322 ?auto_190328 ) ) ( not ( = ?auto_190323 ?auto_190327 ) ) ( not ( = ?auto_190323 ?auto_190328 ) ) ( not ( = ?auto_190324 ?auto_190327 ) ) ( not ( = ?auto_190324 ?auto_190328 ) ) ( not ( = ?auto_190325 ?auto_190327 ) ) ( not ( = ?auto_190325 ?auto_190328 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190328 ?auto_190327 ?auto_190326 )
      ( MAKE-3PILE ?auto_190321 ?auto_190322 ?auto_190323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190329 - BLOCK
      ?auto_190330 - BLOCK
      ?auto_190331 - BLOCK
    )
    :vars
    (
      ?auto_190336 - BLOCK
      ?auto_190334 - BLOCK
      ?auto_190335 - BLOCK
      ?auto_190332 - BLOCK
      ?auto_190333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190336 ?auto_190331 ) ( ON-TABLE ?auto_190329 ) ( ON ?auto_190330 ?auto_190329 ) ( ON ?auto_190331 ?auto_190330 ) ( not ( = ?auto_190329 ?auto_190330 ) ) ( not ( = ?auto_190329 ?auto_190331 ) ) ( not ( = ?auto_190329 ?auto_190336 ) ) ( not ( = ?auto_190330 ?auto_190331 ) ) ( not ( = ?auto_190330 ?auto_190336 ) ) ( not ( = ?auto_190331 ?auto_190336 ) ) ( not ( = ?auto_190329 ?auto_190334 ) ) ( not ( = ?auto_190329 ?auto_190335 ) ) ( not ( = ?auto_190330 ?auto_190334 ) ) ( not ( = ?auto_190330 ?auto_190335 ) ) ( not ( = ?auto_190331 ?auto_190334 ) ) ( not ( = ?auto_190331 ?auto_190335 ) ) ( not ( = ?auto_190336 ?auto_190334 ) ) ( not ( = ?auto_190336 ?auto_190335 ) ) ( not ( = ?auto_190334 ?auto_190335 ) ) ( ON ?auto_190334 ?auto_190336 ) ( CLEAR ?auto_190332 ) ( ON-TABLE ?auto_190333 ) ( ON ?auto_190332 ?auto_190333 ) ( not ( = ?auto_190333 ?auto_190332 ) ) ( not ( = ?auto_190333 ?auto_190335 ) ) ( not ( = ?auto_190332 ?auto_190335 ) ) ( not ( = ?auto_190329 ?auto_190332 ) ) ( not ( = ?auto_190329 ?auto_190333 ) ) ( not ( = ?auto_190330 ?auto_190332 ) ) ( not ( = ?auto_190330 ?auto_190333 ) ) ( not ( = ?auto_190331 ?auto_190332 ) ) ( not ( = ?auto_190331 ?auto_190333 ) ) ( not ( = ?auto_190336 ?auto_190332 ) ) ( not ( = ?auto_190336 ?auto_190333 ) ) ( not ( = ?auto_190334 ?auto_190332 ) ) ( not ( = ?auto_190334 ?auto_190333 ) ) ( ON ?auto_190335 ?auto_190334 ) ( CLEAR ?auto_190335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190329 ?auto_190330 ?auto_190331 ?auto_190336 ?auto_190334 )
      ( MAKE-3PILE ?auto_190329 ?auto_190330 ?auto_190331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190337 - BLOCK
      ?auto_190338 - BLOCK
      ?auto_190339 - BLOCK
    )
    :vars
    (
      ?auto_190341 - BLOCK
      ?auto_190342 - BLOCK
      ?auto_190340 - BLOCK
      ?auto_190343 - BLOCK
      ?auto_190344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190341 ?auto_190339 ) ( ON-TABLE ?auto_190337 ) ( ON ?auto_190338 ?auto_190337 ) ( ON ?auto_190339 ?auto_190338 ) ( not ( = ?auto_190337 ?auto_190338 ) ) ( not ( = ?auto_190337 ?auto_190339 ) ) ( not ( = ?auto_190337 ?auto_190341 ) ) ( not ( = ?auto_190338 ?auto_190339 ) ) ( not ( = ?auto_190338 ?auto_190341 ) ) ( not ( = ?auto_190339 ?auto_190341 ) ) ( not ( = ?auto_190337 ?auto_190342 ) ) ( not ( = ?auto_190337 ?auto_190340 ) ) ( not ( = ?auto_190338 ?auto_190342 ) ) ( not ( = ?auto_190338 ?auto_190340 ) ) ( not ( = ?auto_190339 ?auto_190342 ) ) ( not ( = ?auto_190339 ?auto_190340 ) ) ( not ( = ?auto_190341 ?auto_190342 ) ) ( not ( = ?auto_190341 ?auto_190340 ) ) ( not ( = ?auto_190342 ?auto_190340 ) ) ( ON ?auto_190342 ?auto_190341 ) ( ON-TABLE ?auto_190343 ) ( not ( = ?auto_190343 ?auto_190344 ) ) ( not ( = ?auto_190343 ?auto_190340 ) ) ( not ( = ?auto_190344 ?auto_190340 ) ) ( not ( = ?auto_190337 ?auto_190344 ) ) ( not ( = ?auto_190337 ?auto_190343 ) ) ( not ( = ?auto_190338 ?auto_190344 ) ) ( not ( = ?auto_190338 ?auto_190343 ) ) ( not ( = ?auto_190339 ?auto_190344 ) ) ( not ( = ?auto_190339 ?auto_190343 ) ) ( not ( = ?auto_190341 ?auto_190344 ) ) ( not ( = ?auto_190341 ?auto_190343 ) ) ( not ( = ?auto_190342 ?auto_190344 ) ) ( not ( = ?auto_190342 ?auto_190343 ) ) ( ON ?auto_190340 ?auto_190342 ) ( CLEAR ?auto_190340 ) ( HOLDING ?auto_190344 ) ( CLEAR ?auto_190343 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190343 ?auto_190344 )
      ( MAKE-3PILE ?auto_190337 ?auto_190338 ?auto_190339 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190345 - BLOCK
      ?auto_190346 - BLOCK
      ?auto_190347 - BLOCK
    )
    :vars
    (
      ?auto_190352 - BLOCK
      ?auto_190350 - BLOCK
      ?auto_190349 - BLOCK
      ?auto_190351 - BLOCK
      ?auto_190348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190352 ?auto_190347 ) ( ON-TABLE ?auto_190345 ) ( ON ?auto_190346 ?auto_190345 ) ( ON ?auto_190347 ?auto_190346 ) ( not ( = ?auto_190345 ?auto_190346 ) ) ( not ( = ?auto_190345 ?auto_190347 ) ) ( not ( = ?auto_190345 ?auto_190352 ) ) ( not ( = ?auto_190346 ?auto_190347 ) ) ( not ( = ?auto_190346 ?auto_190352 ) ) ( not ( = ?auto_190347 ?auto_190352 ) ) ( not ( = ?auto_190345 ?auto_190350 ) ) ( not ( = ?auto_190345 ?auto_190349 ) ) ( not ( = ?auto_190346 ?auto_190350 ) ) ( not ( = ?auto_190346 ?auto_190349 ) ) ( not ( = ?auto_190347 ?auto_190350 ) ) ( not ( = ?auto_190347 ?auto_190349 ) ) ( not ( = ?auto_190352 ?auto_190350 ) ) ( not ( = ?auto_190352 ?auto_190349 ) ) ( not ( = ?auto_190350 ?auto_190349 ) ) ( ON ?auto_190350 ?auto_190352 ) ( ON-TABLE ?auto_190351 ) ( not ( = ?auto_190351 ?auto_190348 ) ) ( not ( = ?auto_190351 ?auto_190349 ) ) ( not ( = ?auto_190348 ?auto_190349 ) ) ( not ( = ?auto_190345 ?auto_190348 ) ) ( not ( = ?auto_190345 ?auto_190351 ) ) ( not ( = ?auto_190346 ?auto_190348 ) ) ( not ( = ?auto_190346 ?auto_190351 ) ) ( not ( = ?auto_190347 ?auto_190348 ) ) ( not ( = ?auto_190347 ?auto_190351 ) ) ( not ( = ?auto_190352 ?auto_190348 ) ) ( not ( = ?auto_190352 ?auto_190351 ) ) ( not ( = ?auto_190350 ?auto_190348 ) ) ( not ( = ?auto_190350 ?auto_190351 ) ) ( ON ?auto_190349 ?auto_190350 ) ( CLEAR ?auto_190351 ) ( ON ?auto_190348 ?auto_190349 ) ( CLEAR ?auto_190348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190345 ?auto_190346 ?auto_190347 ?auto_190352 ?auto_190350 ?auto_190349 )
      ( MAKE-3PILE ?auto_190345 ?auto_190346 ?auto_190347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190353 - BLOCK
      ?auto_190354 - BLOCK
      ?auto_190355 - BLOCK
    )
    :vars
    (
      ?auto_190359 - BLOCK
      ?auto_190360 - BLOCK
      ?auto_190358 - BLOCK
      ?auto_190356 - BLOCK
      ?auto_190357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190359 ?auto_190355 ) ( ON-TABLE ?auto_190353 ) ( ON ?auto_190354 ?auto_190353 ) ( ON ?auto_190355 ?auto_190354 ) ( not ( = ?auto_190353 ?auto_190354 ) ) ( not ( = ?auto_190353 ?auto_190355 ) ) ( not ( = ?auto_190353 ?auto_190359 ) ) ( not ( = ?auto_190354 ?auto_190355 ) ) ( not ( = ?auto_190354 ?auto_190359 ) ) ( not ( = ?auto_190355 ?auto_190359 ) ) ( not ( = ?auto_190353 ?auto_190360 ) ) ( not ( = ?auto_190353 ?auto_190358 ) ) ( not ( = ?auto_190354 ?auto_190360 ) ) ( not ( = ?auto_190354 ?auto_190358 ) ) ( not ( = ?auto_190355 ?auto_190360 ) ) ( not ( = ?auto_190355 ?auto_190358 ) ) ( not ( = ?auto_190359 ?auto_190360 ) ) ( not ( = ?auto_190359 ?auto_190358 ) ) ( not ( = ?auto_190360 ?auto_190358 ) ) ( ON ?auto_190360 ?auto_190359 ) ( not ( = ?auto_190356 ?auto_190357 ) ) ( not ( = ?auto_190356 ?auto_190358 ) ) ( not ( = ?auto_190357 ?auto_190358 ) ) ( not ( = ?auto_190353 ?auto_190357 ) ) ( not ( = ?auto_190353 ?auto_190356 ) ) ( not ( = ?auto_190354 ?auto_190357 ) ) ( not ( = ?auto_190354 ?auto_190356 ) ) ( not ( = ?auto_190355 ?auto_190357 ) ) ( not ( = ?auto_190355 ?auto_190356 ) ) ( not ( = ?auto_190359 ?auto_190357 ) ) ( not ( = ?auto_190359 ?auto_190356 ) ) ( not ( = ?auto_190360 ?auto_190357 ) ) ( not ( = ?auto_190360 ?auto_190356 ) ) ( ON ?auto_190358 ?auto_190360 ) ( ON ?auto_190357 ?auto_190358 ) ( CLEAR ?auto_190357 ) ( HOLDING ?auto_190356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190356 )
      ( MAKE-3PILE ?auto_190353 ?auto_190354 ?auto_190355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190361 - BLOCK
      ?auto_190362 - BLOCK
      ?auto_190363 - BLOCK
    )
    :vars
    (
      ?auto_190365 - BLOCK
      ?auto_190364 - BLOCK
      ?auto_190367 - BLOCK
      ?auto_190368 - BLOCK
      ?auto_190366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190365 ?auto_190363 ) ( ON-TABLE ?auto_190361 ) ( ON ?auto_190362 ?auto_190361 ) ( ON ?auto_190363 ?auto_190362 ) ( not ( = ?auto_190361 ?auto_190362 ) ) ( not ( = ?auto_190361 ?auto_190363 ) ) ( not ( = ?auto_190361 ?auto_190365 ) ) ( not ( = ?auto_190362 ?auto_190363 ) ) ( not ( = ?auto_190362 ?auto_190365 ) ) ( not ( = ?auto_190363 ?auto_190365 ) ) ( not ( = ?auto_190361 ?auto_190364 ) ) ( not ( = ?auto_190361 ?auto_190367 ) ) ( not ( = ?auto_190362 ?auto_190364 ) ) ( not ( = ?auto_190362 ?auto_190367 ) ) ( not ( = ?auto_190363 ?auto_190364 ) ) ( not ( = ?auto_190363 ?auto_190367 ) ) ( not ( = ?auto_190365 ?auto_190364 ) ) ( not ( = ?auto_190365 ?auto_190367 ) ) ( not ( = ?auto_190364 ?auto_190367 ) ) ( ON ?auto_190364 ?auto_190365 ) ( not ( = ?auto_190368 ?auto_190366 ) ) ( not ( = ?auto_190368 ?auto_190367 ) ) ( not ( = ?auto_190366 ?auto_190367 ) ) ( not ( = ?auto_190361 ?auto_190366 ) ) ( not ( = ?auto_190361 ?auto_190368 ) ) ( not ( = ?auto_190362 ?auto_190366 ) ) ( not ( = ?auto_190362 ?auto_190368 ) ) ( not ( = ?auto_190363 ?auto_190366 ) ) ( not ( = ?auto_190363 ?auto_190368 ) ) ( not ( = ?auto_190365 ?auto_190366 ) ) ( not ( = ?auto_190365 ?auto_190368 ) ) ( not ( = ?auto_190364 ?auto_190366 ) ) ( not ( = ?auto_190364 ?auto_190368 ) ) ( ON ?auto_190367 ?auto_190364 ) ( ON ?auto_190366 ?auto_190367 ) ( ON ?auto_190368 ?auto_190366 ) ( CLEAR ?auto_190368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190361 ?auto_190362 ?auto_190363 ?auto_190365 ?auto_190364 ?auto_190367 ?auto_190366 )
      ( MAKE-3PILE ?auto_190361 ?auto_190362 ?auto_190363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190369 - BLOCK
      ?auto_190370 - BLOCK
      ?auto_190371 - BLOCK
    )
    :vars
    (
      ?auto_190375 - BLOCK
      ?auto_190374 - BLOCK
      ?auto_190376 - BLOCK
      ?auto_190373 - BLOCK
      ?auto_190372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190375 ?auto_190371 ) ( ON-TABLE ?auto_190369 ) ( ON ?auto_190370 ?auto_190369 ) ( ON ?auto_190371 ?auto_190370 ) ( not ( = ?auto_190369 ?auto_190370 ) ) ( not ( = ?auto_190369 ?auto_190371 ) ) ( not ( = ?auto_190369 ?auto_190375 ) ) ( not ( = ?auto_190370 ?auto_190371 ) ) ( not ( = ?auto_190370 ?auto_190375 ) ) ( not ( = ?auto_190371 ?auto_190375 ) ) ( not ( = ?auto_190369 ?auto_190374 ) ) ( not ( = ?auto_190369 ?auto_190376 ) ) ( not ( = ?auto_190370 ?auto_190374 ) ) ( not ( = ?auto_190370 ?auto_190376 ) ) ( not ( = ?auto_190371 ?auto_190374 ) ) ( not ( = ?auto_190371 ?auto_190376 ) ) ( not ( = ?auto_190375 ?auto_190374 ) ) ( not ( = ?auto_190375 ?auto_190376 ) ) ( not ( = ?auto_190374 ?auto_190376 ) ) ( ON ?auto_190374 ?auto_190375 ) ( not ( = ?auto_190373 ?auto_190372 ) ) ( not ( = ?auto_190373 ?auto_190376 ) ) ( not ( = ?auto_190372 ?auto_190376 ) ) ( not ( = ?auto_190369 ?auto_190372 ) ) ( not ( = ?auto_190369 ?auto_190373 ) ) ( not ( = ?auto_190370 ?auto_190372 ) ) ( not ( = ?auto_190370 ?auto_190373 ) ) ( not ( = ?auto_190371 ?auto_190372 ) ) ( not ( = ?auto_190371 ?auto_190373 ) ) ( not ( = ?auto_190375 ?auto_190372 ) ) ( not ( = ?auto_190375 ?auto_190373 ) ) ( not ( = ?auto_190374 ?auto_190372 ) ) ( not ( = ?auto_190374 ?auto_190373 ) ) ( ON ?auto_190376 ?auto_190374 ) ( ON ?auto_190372 ?auto_190376 ) ( HOLDING ?auto_190373 ) ( CLEAR ?auto_190372 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190369 ?auto_190370 ?auto_190371 ?auto_190375 ?auto_190374 ?auto_190376 ?auto_190372 ?auto_190373 )
      ( MAKE-3PILE ?auto_190369 ?auto_190370 ?auto_190371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190377 - BLOCK
      ?auto_190378 - BLOCK
      ?auto_190379 - BLOCK
    )
    :vars
    (
      ?auto_190383 - BLOCK
      ?auto_190384 - BLOCK
      ?auto_190381 - BLOCK
      ?auto_190380 - BLOCK
      ?auto_190382 - BLOCK
      ?auto_190385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190383 ?auto_190379 ) ( ON-TABLE ?auto_190377 ) ( ON ?auto_190378 ?auto_190377 ) ( ON ?auto_190379 ?auto_190378 ) ( not ( = ?auto_190377 ?auto_190378 ) ) ( not ( = ?auto_190377 ?auto_190379 ) ) ( not ( = ?auto_190377 ?auto_190383 ) ) ( not ( = ?auto_190378 ?auto_190379 ) ) ( not ( = ?auto_190378 ?auto_190383 ) ) ( not ( = ?auto_190379 ?auto_190383 ) ) ( not ( = ?auto_190377 ?auto_190384 ) ) ( not ( = ?auto_190377 ?auto_190381 ) ) ( not ( = ?auto_190378 ?auto_190384 ) ) ( not ( = ?auto_190378 ?auto_190381 ) ) ( not ( = ?auto_190379 ?auto_190384 ) ) ( not ( = ?auto_190379 ?auto_190381 ) ) ( not ( = ?auto_190383 ?auto_190384 ) ) ( not ( = ?auto_190383 ?auto_190381 ) ) ( not ( = ?auto_190384 ?auto_190381 ) ) ( ON ?auto_190384 ?auto_190383 ) ( not ( = ?auto_190380 ?auto_190382 ) ) ( not ( = ?auto_190380 ?auto_190381 ) ) ( not ( = ?auto_190382 ?auto_190381 ) ) ( not ( = ?auto_190377 ?auto_190382 ) ) ( not ( = ?auto_190377 ?auto_190380 ) ) ( not ( = ?auto_190378 ?auto_190382 ) ) ( not ( = ?auto_190378 ?auto_190380 ) ) ( not ( = ?auto_190379 ?auto_190382 ) ) ( not ( = ?auto_190379 ?auto_190380 ) ) ( not ( = ?auto_190383 ?auto_190382 ) ) ( not ( = ?auto_190383 ?auto_190380 ) ) ( not ( = ?auto_190384 ?auto_190382 ) ) ( not ( = ?auto_190384 ?auto_190380 ) ) ( ON ?auto_190381 ?auto_190384 ) ( ON ?auto_190382 ?auto_190381 ) ( CLEAR ?auto_190382 ) ( ON ?auto_190380 ?auto_190385 ) ( CLEAR ?auto_190380 ) ( HAND-EMPTY ) ( not ( = ?auto_190377 ?auto_190385 ) ) ( not ( = ?auto_190378 ?auto_190385 ) ) ( not ( = ?auto_190379 ?auto_190385 ) ) ( not ( = ?auto_190383 ?auto_190385 ) ) ( not ( = ?auto_190384 ?auto_190385 ) ) ( not ( = ?auto_190381 ?auto_190385 ) ) ( not ( = ?auto_190380 ?auto_190385 ) ) ( not ( = ?auto_190382 ?auto_190385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190380 ?auto_190385 )
      ( MAKE-3PILE ?auto_190377 ?auto_190378 ?auto_190379 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190386 - BLOCK
      ?auto_190387 - BLOCK
      ?auto_190388 - BLOCK
    )
    :vars
    (
      ?auto_190390 - BLOCK
      ?auto_190394 - BLOCK
      ?auto_190392 - BLOCK
      ?auto_190389 - BLOCK
      ?auto_190393 - BLOCK
      ?auto_190391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190390 ?auto_190388 ) ( ON-TABLE ?auto_190386 ) ( ON ?auto_190387 ?auto_190386 ) ( ON ?auto_190388 ?auto_190387 ) ( not ( = ?auto_190386 ?auto_190387 ) ) ( not ( = ?auto_190386 ?auto_190388 ) ) ( not ( = ?auto_190386 ?auto_190390 ) ) ( not ( = ?auto_190387 ?auto_190388 ) ) ( not ( = ?auto_190387 ?auto_190390 ) ) ( not ( = ?auto_190388 ?auto_190390 ) ) ( not ( = ?auto_190386 ?auto_190394 ) ) ( not ( = ?auto_190386 ?auto_190392 ) ) ( not ( = ?auto_190387 ?auto_190394 ) ) ( not ( = ?auto_190387 ?auto_190392 ) ) ( not ( = ?auto_190388 ?auto_190394 ) ) ( not ( = ?auto_190388 ?auto_190392 ) ) ( not ( = ?auto_190390 ?auto_190394 ) ) ( not ( = ?auto_190390 ?auto_190392 ) ) ( not ( = ?auto_190394 ?auto_190392 ) ) ( ON ?auto_190394 ?auto_190390 ) ( not ( = ?auto_190389 ?auto_190393 ) ) ( not ( = ?auto_190389 ?auto_190392 ) ) ( not ( = ?auto_190393 ?auto_190392 ) ) ( not ( = ?auto_190386 ?auto_190393 ) ) ( not ( = ?auto_190386 ?auto_190389 ) ) ( not ( = ?auto_190387 ?auto_190393 ) ) ( not ( = ?auto_190387 ?auto_190389 ) ) ( not ( = ?auto_190388 ?auto_190393 ) ) ( not ( = ?auto_190388 ?auto_190389 ) ) ( not ( = ?auto_190390 ?auto_190393 ) ) ( not ( = ?auto_190390 ?auto_190389 ) ) ( not ( = ?auto_190394 ?auto_190393 ) ) ( not ( = ?auto_190394 ?auto_190389 ) ) ( ON ?auto_190392 ?auto_190394 ) ( ON ?auto_190389 ?auto_190391 ) ( CLEAR ?auto_190389 ) ( not ( = ?auto_190386 ?auto_190391 ) ) ( not ( = ?auto_190387 ?auto_190391 ) ) ( not ( = ?auto_190388 ?auto_190391 ) ) ( not ( = ?auto_190390 ?auto_190391 ) ) ( not ( = ?auto_190394 ?auto_190391 ) ) ( not ( = ?auto_190392 ?auto_190391 ) ) ( not ( = ?auto_190389 ?auto_190391 ) ) ( not ( = ?auto_190393 ?auto_190391 ) ) ( HOLDING ?auto_190393 ) ( CLEAR ?auto_190392 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190386 ?auto_190387 ?auto_190388 ?auto_190390 ?auto_190394 ?auto_190392 ?auto_190393 )
      ( MAKE-3PILE ?auto_190386 ?auto_190387 ?auto_190388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190395 - BLOCK
      ?auto_190396 - BLOCK
      ?auto_190397 - BLOCK
    )
    :vars
    (
      ?auto_190398 - BLOCK
      ?auto_190402 - BLOCK
      ?auto_190403 - BLOCK
      ?auto_190401 - BLOCK
      ?auto_190399 - BLOCK
      ?auto_190400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190398 ?auto_190397 ) ( ON-TABLE ?auto_190395 ) ( ON ?auto_190396 ?auto_190395 ) ( ON ?auto_190397 ?auto_190396 ) ( not ( = ?auto_190395 ?auto_190396 ) ) ( not ( = ?auto_190395 ?auto_190397 ) ) ( not ( = ?auto_190395 ?auto_190398 ) ) ( not ( = ?auto_190396 ?auto_190397 ) ) ( not ( = ?auto_190396 ?auto_190398 ) ) ( not ( = ?auto_190397 ?auto_190398 ) ) ( not ( = ?auto_190395 ?auto_190402 ) ) ( not ( = ?auto_190395 ?auto_190403 ) ) ( not ( = ?auto_190396 ?auto_190402 ) ) ( not ( = ?auto_190396 ?auto_190403 ) ) ( not ( = ?auto_190397 ?auto_190402 ) ) ( not ( = ?auto_190397 ?auto_190403 ) ) ( not ( = ?auto_190398 ?auto_190402 ) ) ( not ( = ?auto_190398 ?auto_190403 ) ) ( not ( = ?auto_190402 ?auto_190403 ) ) ( ON ?auto_190402 ?auto_190398 ) ( not ( = ?auto_190401 ?auto_190399 ) ) ( not ( = ?auto_190401 ?auto_190403 ) ) ( not ( = ?auto_190399 ?auto_190403 ) ) ( not ( = ?auto_190395 ?auto_190399 ) ) ( not ( = ?auto_190395 ?auto_190401 ) ) ( not ( = ?auto_190396 ?auto_190399 ) ) ( not ( = ?auto_190396 ?auto_190401 ) ) ( not ( = ?auto_190397 ?auto_190399 ) ) ( not ( = ?auto_190397 ?auto_190401 ) ) ( not ( = ?auto_190398 ?auto_190399 ) ) ( not ( = ?auto_190398 ?auto_190401 ) ) ( not ( = ?auto_190402 ?auto_190399 ) ) ( not ( = ?auto_190402 ?auto_190401 ) ) ( ON ?auto_190403 ?auto_190402 ) ( ON ?auto_190401 ?auto_190400 ) ( not ( = ?auto_190395 ?auto_190400 ) ) ( not ( = ?auto_190396 ?auto_190400 ) ) ( not ( = ?auto_190397 ?auto_190400 ) ) ( not ( = ?auto_190398 ?auto_190400 ) ) ( not ( = ?auto_190402 ?auto_190400 ) ) ( not ( = ?auto_190403 ?auto_190400 ) ) ( not ( = ?auto_190401 ?auto_190400 ) ) ( not ( = ?auto_190399 ?auto_190400 ) ) ( CLEAR ?auto_190403 ) ( ON ?auto_190399 ?auto_190401 ) ( CLEAR ?auto_190399 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190400 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190400 ?auto_190401 )
      ( MAKE-3PILE ?auto_190395 ?auto_190396 ?auto_190397 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190404 - BLOCK
      ?auto_190405 - BLOCK
      ?auto_190406 - BLOCK
    )
    :vars
    (
      ?auto_190408 - BLOCK
      ?auto_190407 - BLOCK
      ?auto_190411 - BLOCK
      ?auto_190410 - BLOCK
      ?auto_190409 - BLOCK
      ?auto_190412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190408 ?auto_190406 ) ( ON-TABLE ?auto_190404 ) ( ON ?auto_190405 ?auto_190404 ) ( ON ?auto_190406 ?auto_190405 ) ( not ( = ?auto_190404 ?auto_190405 ) ) ( not ( = ?auto_190404 ?auto_190406 ) ) ( not ( = ?auto_190404 ?auto_190408 ) ) ( not ( = ?auto_190405 ?auto_190406 ) ) ( not ( = ?auto_190405 ?auto_190408 ) ) ( not ( = ?auto_190406 ?auto_190408 ) ) ( not ( = ?auto_190404 ?auto_190407 ) ) ( not ( = ?auto_190404 ?auto_190411 ) ) ( not ( = ?auto_190405 ?auto_190407 ) ) ( not ( = ?auto_190405 ?auto_190411 ) ) ( not ( = ?auto_190406 ?auto_190407 ) ) ( not ( = ?auto_190406 ?auto_190411 ) ) ( not ( = ?auto_190408 ?auto_190407 ) ) ( not ( = ?auto_190408 ?auto_190411 ) ) ( not ( = ?auto_190407 ?auto_190411 ) ) ( ON ?auto_190407 ?auto_190408 ) ( not ( = ?auto_190410 ?auto_190409 ) ) ( not ( = ?auto_190410 ?auto_190411 ) ) ( not ( = ?auto_190409 ?auto_190411 ) ) ( not ( = ?auto_190404 ?auto_190409 ) ) ( not ( = ?auto_190404 ?auto_190410 ) ) ( not ( = ?auto_190405 ?auto_190409 ) ) ( not ( = ?auto_190405 ?auto_190410 ) ) ( not ( = ?auto_190406 ?auto_190409 ) ) ( not ( = ?auto_190406 ?auto_190410 ) ) ( not ( = ?auto_190408 ?auto_190409 ) ) ( not ( = ?auto_190408 ?auto_190410 ) ) ( not ( = ?auto_190407 ?auto_190409 ) ) ( not ( = ?auto_190407 ?auto_190410 ) ) ( ON ?auto_190410 ?auto_190412 ) ( not ( = ?auto_190404 ?auto_190412 ) ) ( not ( = ?auto_190405 ?auto_190412 ) ) ( not ( = ?auto_190406 ?auto_190412 ) ) ( not ( = ?auto_190408 ?auto_190412 ) ) ( not ( = ?auto_190407 ?auto_190412 ) ) ( not ( = ?auto_190411 ?auto_190412 ) ) ( not ( = ?auto_190410 ?auto_190412 ) ) ( not ( = ?auto_190409 ?auto_190412 ) ) ( ON ?auto_190409 ?auto_190410 ) ( CLEAR ?auto_190409 ) ( ON-TABLE ?auto_190412 ) ( HOLDING ?auto_190411 ) ( CLEAR ?auto_190407 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190404 ?auto_190405 ?auto_190406 ?auto_190408 ?auto_190407 ?auto_190411 )
      ( MAKE-3PILE ?auto_190404 ?auto_190405 ?auto_190406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190413 - BLOCK
      ?auto_190414 - BLOCK
      ?auto_190415 - BLOCK
    )
    :vars
    (
      ?auto_190419 - BLOCK
      ?auto_190417 - BLOCK
      ?auto_190418 - BLOCK
      ?auto_190421 - BLOCK
      ?auto_190416 - BLOCK
      ?auto_190420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190419 ?auto_190415 ) ( ON-TABLE ?auto_190413 ) ( ON ?auto_190414 ?auto_190413 ) ( ON ?auto_190415 ?auto_190414 ) ( not ( = ?auto_190413 ?auto_190414 ) ) ( not ( = ?auto_190413 ?auto_190415 ) ) ( not ( = ?auto_190413 ?auto_190419 ) ) ( not ( = ?auto_190414 ?auto_190415 ) ) ( not ( = ?auto_190414 ?auto_190419 ) ) ( not ( = ?auto_190415 ?auto_190419 ) ) ( not ( = ?auto_190413 ?auto_190417 ) ) ( not ( = ?auto_190413 ?auto_190418 ) ) ( not ( = ?auto_190414 ?auto_190417 ) ) ( not ( = ?auto_190414 ?auto_190418 ) ) ( not ( = ?auto_190415 ?auto_190417 ) ) ( not ( = ?auto_190415 ?auto_190418 ) ) ( not ( = ?auto_190419 ?auto_190417 ) ) ( not ( = ?auto_190419 ?auto_190418 ) ) ( not ( = ?auto_190417 ?auto_190418 ) ) ( ON ?auto_190417 ?auto_190419 ) ( not ( = ?auto_190421 ?auto_190416 ) ) ( not ( = ?auto_190421 ?auto_190418 ) ) ( not ( = ?auto_190416 ?auto_190418 ) ) ( not ( = ?auto_190413 ?auto_190416 ) ) ( not ( = ?auto_190413 ?auto_190421 ) ) ( not ( = ?auto_190414 ?auto_190416 ) ) ( not ( = ?auto_190414 ?auto_190421 ) ) ( not ( = ?auto_190415 ?auto_190416 ) ) ( not ( = ?auto_190415 ?auto_190421 ) ) ( not ( = ?auto_190419 ?auto_190416 ) ) ( not ( = ?auto_190419 ?auto_190421 ) ) ( not ( = ?auto_190417 ?auto_190416 ) ) ( not ( = ?auto_190417 ?auto_190421 ) ) ( ON ?auto_190421 ?auto_190420 ) ( not ( = ?auto_190413 ?auto_190420 ) ) ( not ( = ?auto_190414 ?auto_190420 ) ) ( not ( = ?auto_190415 ?auto_190420 ) ) ( not ( = ?auto_190419 ?auto_190420 ) ) ( not ( = ?auto_190417 ?auto_190420 ) ) ( not ( = ?auto_190418 ?auto_190420 ) ) ( not ( = ?auto_190421 ?auto_190420 ) ) ( not ( = ?auto_190416 ?auto_190420 ) ) ( ON ?auto_190416 ?auto_190421 ) ( ON-TABLE ?auto_190420 ) ( CLEAR ?auto_190417 ) ( ON ?auto_190418 ?auto_190416 ) ( CLEAR ?auto_190418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190420 ?auto_190421 ?auto_190416 )
      ( MAKE-3PILE ?auto_190413 ?auto_190414 ?auto_190415 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190422 - BLOCK
      ?auto_190423 - BLOCK
      ?auto_190424 - BLOCK
    )
    :vars
    (
      ?auto_190430 - BLOCK
      ?auto_190426 - BLOCK
      ?auto_190427 - BLOCK
      ?auto_190428 - BLOCK
      ?auto_190425 - BLOCK
      ?auto_190429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190430 ?auto_190424 ) ( ON-TABLE ?auto_190422 ) ( ON ?auto_190423 ?auto_190422 ) ( ON ?auto_190424 ?auto_190423 ) ( not ( = ?auto_190422 ?auto_190423 ) ) ( not ( = ?auto_190422 ?auto_190424 ) ) ( not ( = ?auto_190422 ?auto_190430 ) ) ( not ( = ?auto_190423 ?auto_190424 ) ) ( not ( = ?auto_190423 ?auto_190430 ) ) ( not ( = ?auto_190424 ?auto_190430 ) ) ( not ( = ?auto_190422 ?auto_190426 ) ) ( not ( = ?auto_190422 ?auto_190427 ) ) ( not ( = ?auto_190423 ?auto_190426 ) ) ( not ( = ?auto_190423 ?auto_190427 ) ) ( not ( = ?auto_190424 ?auto_190426 ) ) ( not ( = ?auto_190424 ?auto_190427 ) ) ( not ( = ?auto_190430 ?auto_190426 ) ) ( not ( = ?auto_190430 ?auto_190427 ) ) ( not ( = ?auto_190426 ?auto_190427 ) ) ( not ( = ?auto_190428 ?auto_190425 ) ) ( not ( = ?auto_190428 ?auto_190427 ) ) ( not ( = ?auto_190425 ?auto_190427 ) ) ( not ( = ?auto_190422 ?auto_190425 ) ) ( not ( = ?auto_190422 ?auto_190428 ) ) ( not ( = ?auto_190423 ?auto_190425 ) ) ( not ( = ?auto_190423 ?auto_190428 ) ) ( not ( = ?auto_190424 ?auto_190425 ) ) ( not ( = ?auto_190424 ?auto_190428 ) ) ( not ( = ?auto_190430 ?auto_190425 ) ) ( not ( = ?auto_190430 ?auto_190428 ) ) ( not ( = ?auto_190426 ?auto_190425 ) ) ( not ( = ?auto_190426 ?auto_190428 ) ) ( ON ?auto_190428 ?auto_190429 ) ( not ( = ?auto_190422 ?auto_190429 ) ) ( not ( = ?auto_190423 ?auto_190429 ) ) ( not ( = ?auto_190424 ?auto_190429 ) ) ( not ( = ?auto_190430 ?auto_190429 ) ) ( not ( = ?auto_190426 ?auto_190429 ) ) ( not ( = ?auto_190427 ?auto_190429 ) ) ( not ( = ?auto_190428 ?auto_190429 ) ) ( not ( = ?auto_190425 ?auto_190429 ) ) ( ON ?auto_190425 ?auto_190428 ) ( ON-TABLE ?auto_190429 ) ( ON ?auto_190427 ?auto_190425 ) ( CLEAR ?auto_190427 ) ( HOLDING ?auto_190426 ) ( CLEAR ?auto_190430 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190422 ?auto_190423 ?auto_190424 ?auto_190430 ?auto_190426 )
      ( MAKE-3PILE ?auto_190422 ?auto_190423 ?auto_190424 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190431 - BLOCK
      ?auto_190432 - BLOCK
      ?auto_190433 - BLOCK
    )
    :vars
    (
      ?auto_190436 - BLOCK
      ?auto_190434 - BLOCK
      ?auto_190435 - BLOCK
      ?auto_190439 - BLOCK
      ?auto_190437 - BLOCK
      ?auto_190438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190436 ?auto_190433 ) ( ON-TABLE ?auto_190431 ) ( ON ?auto_190432 ?auto_190431 ) ( ON ?auto_190433 ?auto_190432 ) ( not ( = ?auto_190431 ?auto_190432 ) ) ( not ( = ?auto_190431 ?auto_190433 ) ) ( not ( = ?auto_190431 ?auto_190436 ) ) ( not ( = ?auto_190432 ?auto_190433 ) ) ( not ( = ?auto_190432 ?auto_190436 ) ) ( not ( = ?auto_190433 ?auto_190436 ) ) ( not ( = ?auto_190431 ?auto_190434 ) ) ( not ( = ?auto_190431 ?auto_190435 ) ) ( not ( = ?auto_190432 ?auto_190434 ) ) ( not ( = ?auto_190432 ?auto_190435 ) ) ( not ( = ?auto_190433 ?auto_190434 ) ) ( not ( = ?auto_190433 ?auto_190435 ) ) ( not ( = ?auto_190436 ?auto_190434 ) ) ( not ( = ?auto_190436 ?auto_190435 ) ) ( not ( = ?auto_190434 ?auto_190435 ) ) ( not ( = ?auto_190439 ?auto_190437 ) ) ( not ( = ?auto_190439 ?auto_190435 ) ) ( not ( = ?auto_190437 ?auto_190435 ) ) ( not ( = ?auto_190431 ?auto_190437 ) ) ( not ( = ?auto_190431 ?auto_190439 ) ) ( not ( = ?auto_190432 ?auto_190437 ) ) ( not ( = ?auto_190432 ?auto_190439 ) ) ( not ( = ?auto_190433 ?auto_190437 ) ) ( not ( = ?auto_190433 ?auto_190439 ) ) ( not ( = ?auto_190436 ?auto_190437 ) ) ( not ( = ?auto_190436 ?auto_190439 ) ) ( not ( = ?auto_190434 ?auto_190437 ) ) ( not ( = ?auto_190434 ?auto_190439 ) ) ( ON ?auto_190439 ?auto_190438 ) ( not ( = ?auto_190431 ?auto_190438 ) ) ( not ( = ?auto_190432 ?auto_190438 ) ) ( not ( = ?auto_190433 ?auto_190438 ) ) ( not ( = ?auto_190436 ?auto_190438 ) ) ( not ( = ?auto_190434 ?auto_190438 ) ) ( not ( = ?auto_190435 ?auto_190438 ) ) ( not ( = ?auto_190439 ?auto_190438 ) ) ( not ( = ?auto_190437 ?auto_190438 ) ) ( ON ?auto_190437 ?auto_190439 ) ( ON-TABLE ?auto_190438 ) ( ON ?auto_190435 ?auto_190437 ) ( CLEAR ?auto_190436 ) ( ON ?auto_190434 ?auto_190435 ) ( CLEAR ?auto_190434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190438 ?auto_190439 ?auto_190437 ?auto_190435 )
      ( MAKE-3PILE ?auto_190431 ?auto_190432 ?auto_190433 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190458 - BLOCK
      ?auto_190459 - BLOCK
      ?auto_190460 - BLOCK
    )
    :vars
    (
      ?auto_190465 - BLOCK
      ?auto_190461 - BLOCK
      ?auto_190466 - BLOCK
      ?auto_190462 - BLOCK
      ?auto_190463 - BLOCK
      ?auto_190464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190458 ) ( ON ?auto_190459 ?auto_190458 ) ( not ( = ?auto_190458 ?auto_190459 ) ) ( not ( = ?auto_190458 ?auto_190460 ) ) ( not ( = ?auto_190458 ?auto_190465 ) ) ( not ( = ?auto_190459 ?auto_190460 ) ) ( not ( = ?auto_190459 ?auto_190465 ) ) ( not ( = ?auto_190460 ?auto_190465 ) ) ( not ( = ?auto_190458 ?auto_190461 ) ) ( not ( = ?auto_190458 ?auto_190466 ) ) ( not ( = ?auto_190459 ?auto_190461 ) ) ( not ( = ?auto_190459 ?auto_190466 ) ) ( not ( = ?auto_190460 ?auto_190461 ) ) ( not ( = ?auto_190460 ?auto_190466 ) ) ( not ( = ?auto_190465 ?auto_190461 ) ) ( not ( = ?auto_190465 ?auto_190466 ) ) ( not ( = ?auto_190461 ?auto_190466 ) ) ( not ( = ?auto_190462 ?auto_190463 ) ) ( not ( = ?auto_190462 ?auto_190466 ) ) ( not ( = ?auto_190463 ?auto_190466 ) ) ( not ( = ?auto_190458 ?auto_190463 ) ) ( not ( = ?auto_190458 ?auto_190462 ) ) ( not ( = ?auto_190459 ?auto_190463 ) ) ( not ( = ?auto_190459 ?auto_190462 ) ) ( not ( = ?auto_190460 ?auto_190463 ) ) ( not ( = ?auto_190460 ?auto_190462 ) ) ( not ( = ?auto_190465 ?auto_190463 ) ) ( not ( = ?auto_190465 ?auto_190462 ) ) ( not ( = ?auto_190461 ?auto_190463 ) ) ( not ( = ?auto_190461 ?auto_190462 ) ) ( ON ?auto_190462 ?auto_190464 ) ( not ( = ?auto_190458 ?auto_190464 ) ) ( not ( = ?auto_190459 ?auto_190464 ) ) ( not ( = ?auto_190460 ?auto_190464 ) ) ( not ( = ?auto_190465 ?auto_190464 ) ) ( not ( = ?auto_190461 ?auto_190464 ) ) ( not ( = ?auto_190466 ?auto_190464 ) ) ( not ( = ?auto_190462 ?auto_190464 ) ) ( not ( = ?auto_190463 ?auto_190464 ) ) ( ON ?auto_190463 ?auto_190462 ) ( ON-TABLE ?auto_190464 ) ( ON ?auto_190466 ?auto_190463 ) ( ON ?auto_190461 ?auto_190466 ) ( ON ?auto_190465 ?auto_190461 ) ( CLEAR ?auto_190465 ) ( HOLDING ?auto_190460 ) ( CLEAR ?auto_190459 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190458 ?auto_190459 ?auto_190460 ?auto_190465 )
      ( MAKE-3PILE ?auto_190458 ?auto_190459 ?auto_190460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190467 - BLOCK
      ?auto_190468 - BLOCK
      ?auto_190469 - BLOCK
    )
    :vars
    (
      ?auto_190475 - BLOCK
      ?auto_190474 - BLOCK
      ?auto_190470 - BLOCK
      ?auto_190472 - BLOCK
      ?auto_190473 - BLOCK
      ?auto_190471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190467 ) ( ON ?auto_190468 ?auto_190467 ) ( not ( = ?auto_190467 ?auto_190468 ) ) ( not ( = ?auto_190467 ?auto_190469 ) ) ( not ( = ?auto_190467 ?auto_190475 ) ) ( not ( = ?auto_190468 ?auto_190469 ) ) ( not ( = ?auto_190468 ?auto_190475 ) ) ( not ( = ?auto_190469 ?auto_190475 ) ) ( not ( = ?auto_190467 ?auto_190474 ) ) ( not ( = ?auto_190467 ?auto_190470 ) ) ( not ( = ?auto_190468 ?auto_190474 ) ) ( not ( = ?auto_190468 ?auto_190470 ) ) ( not ( = ?auto_190469 ?auto_190474 ) ) ( not ( = ?auto_190469 ?auto_190470 ) ) ( not ( = ?auto_190475 ?auto_190474 ) ) ( not ( = ?auto_190475 ?auto_190470 ) ) ( not ( = ?auto_190474 ?auto_190470 ) ) ( not ( = ?auto_190472 ?auto_190473 ) ) ( not ( = ?auto_190472 ?auto_190470 ) ) ( not ( = ?auto_190473 ?auto_190470 ) ) ( not ( = ?auto_190467 ?auto_190473 ) ) ( not ( = ?auto_190467 ?auto_190472 ) ) ( not ( = ?auto_190468 ?auto_190473 ) ) ( not ( = ?auto_190468 ?auto_190472 ) ) ( not ( = ?auto_190469 ?auto_190473 ) ) ( not ( = ?auto_190469 ?auto_190472 ) ) ( not ( = ?auto_190475 ?auto_190473 ) ) ( not ( = ?auto_190475 ?auto_190472 ) ) ( not ( = ?auto_190474 ?auto_190473 ) ) ( not ( = ?auto_190474 ?auto_190472 ) ) ( ON ?auto_190472 ?auto_190471 ) ( not ( = ?auto_190467 ?auto_190471 ) ) ( not ( = ?auto_190468 ?auto_190471 ) ) ( not ( = ?auto_190469 ?auto_190471 ) ) ( not ( = ?auto_190475 ?auto_190471 ) ) ( not ( = ?auto_190474 ?auto_190471 ) ) ( not ( = ?auto_190470 ?auto_190471 ) ) ( not ( = ?auto_190472 ?auto_190471 ) ) ( not ( = ?auto_190473 ?auto_190471 ) ) ( ON ?auto_190473 ?auto_190472 ) ( ON-TABLE ?auto_190471 ) ( ON ?auto_190470 ?auto_190473 ) ( ON ?auto_190474 ?auto_190470 ) ( ON ?auto_190475 ?auto_190474 ) ( CLEAR ?auto_190468 ) ( ON ?auto_190469 ?auto_190475 ) ( CLEAR ?auto_190469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190471 ?auto_190472 ?auto_190473 ?auto_190470 ?auto_190474 ?auto_190475 )
      ( MAKE-3PILE ?auto_190467 ?auto_190468 ?auto_190469 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190476 - BLOCK
      ?auto_190477 - BLOCK
      ?auto_190478 - BLOCK
    )
    :vars
    (
      ?auto_190482 - BLOCK
      ?auto_190480 - BLOCK
      ?auto_190484 - BLOCK
      ?auto_190479 - BLOCK
      ?auto_190481 - BLOCK
      ?auto_190483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190476 ) ( not ( = ?auto_190476 ?auto_190477 ) ) ( not ( = ?auto_190476 ?auto_190478 ) ) ( not ( = ?auto_190476 ?auto_190482 ) ) ( not ( = ?auto_190477 ?auto_190478 ) ) ( not ( = ?auto_190477 ?auto_190482 ) ) ( not ( = ?auto_190478 ?auto_190482 ) ) ( not ( = ?auto_190476 ?auto_190480 ) ) ( not ( = ?auto_190476 ?auto_190484 ) ) ( not ( = ?auto_190477 ?auto_190480 ) ) ( not ( = ?auto_190477 ?auto_190484 ) ) ( not ( = ?auto_190478 ?auto_190480 ) ) ( not ( = ?auto_190478 ?auto_190484 ) ) ( not ( = ?auto_190482 ?auto_190480 ) ) ( not ( = ?auto_190482 ?auto_190484 ) ) ( not ( = ?auto_190480 ?auto_190484 ) ) ( not ( = ?auto_190479 ?auto_190481 ) ) ( not ( = ?auto_190479 ?auto_190484 ) ) ( not ( = ?auto_190481 ?auto_190484 ) ) ( not ( = ?auto_190476 ?auto_190481 ) ) ( not ( = ?auto_190476 ?auto_190479 ) ) ( not ( = ?auto_190477 ?auto_190481 ) ) ( not ( = ?auto_190477 ?auto_190479 ) ) ( not ( = ?auto_190478 ?auto_190481 ) ) ( not ( = ?auto_190478 ?auto_190479 ) ) ( not ( = ?auto_190482 ?auto_190481 ) ) ( not ( = ?auto_190482 ?auto_190479 ) ) ( not ( = ?auto_190480 ?auto_190481 ) ) ( not ( = ?auto_190480 ?auto_190479 ) ) ( ON ?auto_190479 ?auto_190483 ) ( not ( = ?auto_190476 ?auto_190483 ) ) ( not ( = ?auto_190477 ?auto_190483 ) ) ( not ( = ?auto_190478 ?auto_190483 ) ) ( not ( = ?auto_190482 ?auto_190483 ) ) ( not ( = ?auto_190480 ?auto_190483 ) ) ( not ( = ?auto_190484 ?auto_190483 ) ) ( not ( = ?auto_190479 ?auto_190483 ) ) ( not ( = ?auto_190481 ?auto_190483 ) ) ( ON ?auto_190481 ?auto_190479 ) ( ON-TABLE ?auto_190483 ) ( ON ?auto_190484 ?auto_190481 ) ( ON ?auto_190480 ?auto_190484 ) ( ON ?auto_190482 ?auto_190480 ) ( ON ?auto_190478 ?auto_190482 ) ( CLEAR ?auto_190478 ) ( HOLDING ?auto_190477 ) ( CLEAR ?auto_190476 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190476 ?auto_190477 )
      ( MAKE-3PILE ?auto_190476 ?auto_190477 ?auto_190478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190485 - BLOCK
      ?auto_190486 - BLOCK
      ?auto_190487 - BLOCK
    )
    :vars
    (
      ?auto_190488 - BLOCK
      ?auto_190492 - BLOCK
      ?auto_190493 - BLOCK
      ?auto_190491 - BLOCK
      ?auto_190490 - BLOCK
      ?auto_190489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190485 ) ( not ( = ?auto_190485 ?auto_190486 ) ) ( not ( = ?auto_190485 ?auto_190487 ) ) ( not ( = ?auto_190485 ?auto_190488 ) ) ( not ( = ?auto_190486 ?auto_190487 ) ) ( not ( = ?auto_190486 ?auto_190488 ) ) ( not ( = ?auto_190487 ?auto_190488 ) ) ( not ( = ?auto_190485 ?auto_190492 ) ) ( not ( = ?auto_190485 ?auto_190493 ) ) ( not ( = ?auto_190486 ?auto_190492 ) ) ( not ( = ?auto_190486 ?auto_190493 ) ) ( not ( = ?auto_190487 ?auto_190492 ) ) ( not ( = ?auto_190487 ?auto_190493 ) ) ( not ( = ?auto_190488 ?auto_190492 ) ) ( not ( = ?auto_190488 ?auto_190493 ) ) ( not ( = ?auto_190492 ?auto_190493 ) ) ( not ( = ?auto_190491 ?auto_190490 ) ) ( not ( = ?auto_190491 ?auto_190493 ) ) ( not ( = ?auto_190490 ?auto_190493 ) ) ( not ( = ?auto_190485 ?auto_190490 ) ) ( not ( = ?auto_190485 ?auto_190491 ) ) ( not ( = ?auto_190486 ?auto_190490 ) ) ( not ( = ?auto_190486 ?auto_190491 ) ) ( not ( = ?auto_190487 ?auto_190490 ) ) ( not ( = ?auto_190487 ?auto_190491 ) ) ( not ( = ?auto_190488 ?auto_190490 ) ) ( not ( = ?auto_190488 ?auto_190491 ) ) ( not ( = ?auto_190492 ?auto_190490 ) ) ( not ( = ?auto_190492 ?auto_190491 ) ) ( ON ?auto_190491 ?auto_190489 ) ( not ( = ?auto_190485 ?auto_190489 ) ) ( not ( = ?auto_190486 ?auto_190489 ) ) ( not ( = ?auto_190487 ?auto_190489 ) ) ( not ( = ?auto_190488 ?auto_190489 ) ) ( not ( = ?auto_190492 ?auto_190489 ) ) ( not ( = ?auto_190493 ?auto_190489 ) ) ( not ( = ?auto_190491 ?auto_190489 ) ) ( not ( = ?auto_190490 ?auto_190489 ) ) ( ON ?auto_190490 ?auto_190491 ) ( ON-TABLE ?auto_190489 ) ( ON ?auto_190493 ?auto_190490 ) ( ON ?auto_190492 ?auto_190493 ) ( ON ?auto_190488 ?auto_190492 ) ( ON ?auto_190487 ?auto_190488 ) ( CLEAR ?auto_190485 ) ( ON ?auto_190486 ?auto_190487 ) ( CLEAR ?auto_190486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190489 ?auto_190491 ?auto_190490 ?auto_190493 ?auto_190492 ?auto_190488 ?auto_190487 )
      ( MAKE-3PILE ?auto_190485 ?auto_190486 ?auto_190487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190494 - BLOCK
      ?auto_190495 - BLOCK
      ?auto_190496 - BLOCK
    )
    :vars
    (
      ?auto_190499 - BLOCK
      ?auto_190502 - BLOCK
      ?auto_190501 - BLOCK
      ?auto_190498 - BLOCK
      ?auto_190500 - BLOCK
      ?auto_190497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190494 ?auto_190495 ) ) ( not ( = ?auto_190494 ?auto_190496 ) ) ( not ( = ?auto_190494 ?auto_190499 ) ) ( not ( = ?auto_190495 ?auto_190496 ) ) ( not ( = ?auto_190495 ?auto_190499 ) ) ( not ( = ?auto_190496 ?auto_190499 ) ) ( not ( = ?auto_190494 ?auto_190502 ) ) ( not ( = ?auto_190494 ?auto_190501 ) ) ( not ( = ?auto_190495 ?auto_190502 ) ) ( not ( = ?auto_190495 ?auto_190501 ) ) ( not ( = ?auto_190496 ?auto_190502 ) ) ( not ( = ?auto_190496 ?auto_190501 ) ) ( not ( = ?auto_190499 ?auto_190502 ) ) ( not ( = ?auto_190499 ?auto_190501 ) ) ( not ( = ?auto_190502 ?auto_190501 ) ) ( not ( = ?auto_190498 ?auto_190500 ) ) ( not ( = ?auto_190498 ?auto_190501 ) ) ( not ( = ?auto_190500 ?auto_190501 ) ) ( not ( = ?auto_190494 ?auto_190500 ) ) ( not ( = ?auto_190494 ?auto_190498 ) ) ( not ( = ?auto_190495 ?auto_190500 ) ) ( not ( = ?auto_190495 ?auto_190498 ) ) ( not ( = ?auto_190496 ?auto_190500 ) ) ( not ( = ?auto_190496 ?auto_190498 ) ) ( not ( = ?auto_190499 ?auto_190500 ) ) ( not ( = ?auto_190499 ?auto_190498 ) ) ( not ( = ?auto_190502 ?auto_190500 ) ) ( not ( = ?auto_190502 ?auto_190498 ) ) ( ON ?auto_190498 ?auto_190497 ) ( not ( = ?auto_190494 ?auto_190497 ) ) ( not ( = ?auto_190495 ?auto_190497 ) ) ( not ( = ?auto_190496 ?auto_190497 ) ) ( not ( = ?auto_190499 ?auto_190497 ) ) ( not ( = ?auto_190502 ?auto_190497 ) ) ( not ( = ?auto_190501 ?auto_190497 ) ) ( not ( = ?auto_190498 ?auto_190497 ) ) ( not ( = ?auto_190500 ?auto_190497 ) ) ( ON ?auto_190500 ?auto_190498 ) ( ON-TABLE ?auto_190497 ) ( ON ?auto_190501 ?auto_190500 ) ( ON ?auto_190502 ?auto_190501 ) ( ON ?auto_190499 ?auto_190502 ) ( ON ?auto_190496 ?auto_190499 ) ( ON ?auto_190495 ?auto_190496 ) ( CLEAR ?auto_190495 ) ( HOLDING ?auto_190494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190494 )
      ( MAKE-3PILE ?auto_190494 ?auto_190495 ?auto_190496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_190503 - BLOCK
      ?auto_190504 - BLOCK
      ?auto_190505 - BLOCK
    )
    :vars
    (
      ?auto_190511 - BLOCK
      ?auto_190508 - BLOCK
      ?auto_190510 - BLOCK
      ?auto_190506 - BLOCK
      ?auto_190507 - BLOCK
      ?auto_190509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190503 ?auto_190504 ) ) ( not ( = ?auto_190503 ?auto_190505 ) ) ( not ( = ?auto_190503 ?auto_190511 ) ) ( not ( = ?auto_190504 ?auto_190505 ) ) ( not ( = ?auto_190504 ?auto_190511 ) ) ( not ( = ?auto_190505 ?auto_190511 ) ) ( not ( = ?auto_190503 ?auto_190508 ) ) ( not ( = ?auto_190503 ?auto_190510 ) ) ( not ( = ?auto_190504 ?auto_190508 ) ) ( not ( = ?auto_190504 ?auto_190510 ) ) ( not ( = ?auto_190505 ?auto_190508 ) ) ( not ( = ?auto_190505 ?auto_190510 ) ) ( not ( = ?auto_190511 ?auto_190508 ) ) ( not ( = ?auto_190511 ?auto_190510 ) ) ( not ( = ?auto_190508 ?auto_190510 ) ) ( not ( = ?auto_190506 ?auto_190507 ) ) ( not ( = ?auto_190506 ?auto_190510 ) ) ( not ( = ?auto_190507 ?auto_190510 ) ) ( not ( = ?auto_190503 ?auto_190507 ) ) ( not ( = ?auto_190503 ?auto_190506 ) ) ( not ( = ?auto_190504 ?auto_190507 ) ) ( not ( = ?auto_190504 ?auto_190506 ) ) ( not ( = ?auto_190505 ?auto_190507 ) ) ( not ( = ?auto_190505 ?auto_190506 ) ) ( not ( = ?auto_190511 ?auto_190507 ) ) ( not ( = ?auto_190511 ?auto_190506 ) ) ( not ( = ?auto_190508 ?auto_190507 ) ) ( not ( = ?auto_190508 ?auto_190506 ) ) ( ON ?auto_190506 ?auto_190509 ) ( not ( = ?auto_190503 ?auto_190509 ) ) ( not ( = ?auto_190504 ?auto_190509 ) ) ( not ( = ?auto_190505 ?auto_190509 ) ) ( not ( = ?auto_190511 ?auto_190509 ) ) ( not ( = ?auto_190508 ?auto_190509 ) ) ( not ( = ?auto_190510 ?auto_190509 ) ) ( not ( = ?auto_190506 ?auto_190509 ) ) ( not ( = ?auto_190507 ?auto_190509 ) ) ( ON ?auto_190507 ?auto_190506 ) ( ON-TABLE ?auto_190509 ) ( ON ?auto_190510 ?auto_190507 ) ( ON ?auto_190508 ?auto_190510 ) ( ON ?auto_190511 ?auto_190508 ) ( ON ?auto_190505 ?auto_190511 ) ( ON ?auto_190504 ?auto_190505 ) ( ON ?auto_190503 ?auto_190504 ) ( CLEAR ?auto_190503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190509 ?auto_190506 ?auto_190507 ?auto_190510 ?auto_190508 ?auto_190511 ?auto_190505 ?auto_190504 )
      ( MAKE-3PILE ?auto_190503 ?auto_190504 ?auto_190505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190517 - BLOCK
      ?auto_190518 - BLOCK
      ?auto_190519 - BLOCK
      ?auto_190520 - BLOCK
      ?auto_190521 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_190521 ) ( CLEAR ?auto_190520 ) ( ON-TABLE ?auto_190517 ) ( ON ?auto_190518 ?auto_190517 ) ( ON ?auto_190519 ?auto_190518 ) ( ON ?auto_190520 ?auto_190519 ) ( not ( = ?auto_190517 ?auto_190518 ) ) ( not ( = ?auto_190517 ?auto_190519 ) ) ( not ( = ?auto_190517 ?auto_190520 ) ) ( not ( = ?auto_190517 ?auto_190521 ) ) ( not ( = ?auto_190518 ?auto_190519 ) ) ( not ( = ?auto_190518 ?auto_190520 ) ) ( not ( = ?auto_190518 ?auto_190521 ) ) ( not ( = ?auto_190519 ?auto_190520 ) ) ( not ( = ?auto_190519 ?auto_190521 ) ) ( not ( = ?auto_190520 ?auto_190521 ) ) )
    :subtasks
    ( ( !STACK ?auto_190521 ?auto_190520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190522 - BLOCK
      ?auto_190523 - BLOCK
      ?auto_190524 - BLOCK
      ?auto_190525 - BLOCK
      ?auto_190526 - BLOCK
    )
    :vars
    (
      ?auto_190527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_190525 ) ( ON-TABLE ?auto_190522 ) ( ON ?auto_190523 ?auto_190522 ) ( ON ?auto_190524 ?auto_190523 ) ( ON ?auto_190525 ?auto_190524 ) ( not ( = ?auto_190522 ?auto_190523 ) ) ( not ( = ?auto_190522 ?auto_190524 ) ) ( not ( = ?auto_190522 ?auto_190525 ) ) ( not ( = ?auto_190522 ?auto_190526 ) ) ( not ( = ?auto_190523 ?auto_190524 ) ) ( not ( = ?auto_190523 ?auto_190525 ) ) ( not ( = ?auto_190523 ?auto_190526 ) ) ( not ( = ?auto_190524 ?auto_190525 ) ) ( not ( = ?auto_190524 ?auto_190526 ) ) ( not ( = ?auto_190525 ?auto_190526 ) ) ( ON ?auto_190526 ?auto_190527 ) ( CLEAR ?auto_190526 ) ( HAND-EMPTY ) ( not ( = ?auto_190522 ?auto_190527 ) ) ( not ( = ?auto_190523 ?auto_190527 ) ) ( not ( = ?auto_190524 ?auto_190527 ) ) ( not ( = ?auto_190525 ?auto_190527 ) ) ( not ( = ?auto_190526 ?auto_190527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190526 ?auto_190527 )
      ( MAKE-5PILE ?auto_190522 ?auto_190523 ?auto_190524 ?auto_190525 ?auto_190526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190528 - BLOCK
      ?auto_190529 - BLOCK
      ?auto_190530 - BLOCK
      ?auto_190531 - BLOCK
      ?auto_190532 - BLOCK
    )
    :vars
    (
      ?auto_190533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190528 ) ( ON ?auto_190529 ?auto_190528 ) ( ON ?auto_190530 ?auto_190529 ) ( not ( = ?auto_190528 ?auto_190529 ) ) ( not ( = ?auto_190528 ?auto_190530 ) ) ( not ( = ?auto_190528 ?auto_190531 ) ) ( not ( = ?auto_190528 ?auto_190532 ) ) ( not ( = ?auto_190529 ?auto_190530 ) ) ( not ( = ?auto_190529 ?auto_190531 ) ) ( not ( = ?auto_190529 ?auto_190532 ) ) ( not ( = ?auto_190530 ?auto_190531 ) ) ( not ( = ?auto_190530 ?auto_190532 ) ) ( not ( = ?auto_190531 ?auto_190532 ) ) ( ON ?auto_190532 ?auto_190533 ) ( CLEAR ?auto_190532 ) ( not ( = ?auto_190528 ?auto_190533 ) ) ( not ( = ?auto_190529 ?auto_190533 ) ) ( not ( = ?auto_190530 ?auto_190533 ) ) ( not ( = ?auto_190531 ?auto_190533 ) ) ( not ( = ?auto_190532 ?auto_190533 ) ) ( HOLDING ?auto_190531 ) ( CLEAR ?auto_190530 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190528 ?auto_190529 ?auto_190530 ?auto_190531 )
      ( MAKE-5PILE ?auto_190528 ?auto_190529 ?auto_190530 ?auto_190531 ?auto_190532 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190534 - BLOCK
      ?auto_190535 - BLOCK
      ?auto_190536 - BLOCK
      ?auto_190537 - BLOCK
      ?auto_190538 - BLOCK
    )
    :vars
    (
      ?auto_190539 - BLOCK
      ?auto_190541 - BLOCK
      ?auto_190540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190534 ) ( ON ?auto_190535 ?auto_190534 ) ( ON ?auto_190536 ?auto_190535 ) ( not ( = ?auto_190534 ?auto_190535 ) ) ( not ( = ?auto_190534 ?auto_190536 ) ) ( not ( = ?auto_190534 ?auto_190537 ) ) ( not ( = ?auto_190534 ?auto_190538 ) ) ( not ( = ?auto_190535 ?auto_190536 ) ) ( not ( = ?auto_190535 ?auto_190537 ) ) ( not ( = ?auto_190535 ?auto_190538 ) ) ( not ( = ?auto_190536 ?auto_190537 ) ) ( not ( = ?auto_190536 ?auto_190538 ) ) ( not ( = ?auto_190537 ?auto_190538 ) ) ( ON ?auto_190538 ?auto_190539 ) ( not ( = ?auto_190534 ?auto_190539 ) ) ( not ( = ?auto_190535 ?auto_190539 ) ) ( not ( = ?auto_190536 ?auto_190539 ) ) ( not ( = ?auto_190537 ?auto_190539 ) ) ( not ( = ?auto_190538 ?auto_190539 ) ) ( CLEAR ?auto_190536 ) ( ON ?auto_190537 ?auto_190538 ) ( CLEAR ?auto_190537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190541 ) ( ON ?auto_190540 ?auto_190541 ) ( ON ?auto_190539 ?auto_190540 ) ( not ( = ?auto_190541 ?auto_190540 ) ) ( not ( = ?auto_190541 ?auto_190539 ) ) ( not ( = ?auto_190541 ?auto_190538 ) ) ( not ( = ?auto_190541 ?auto_190537 ) ) ( not ( = ?auto_190540 ?auto_190539 ) ) ( not ( = ?auto_190540 ?auto_190538 ) ) ( not ( = ?auto_190540 ?auto_190537 ) ) ( not ( = ?auto_190534 ?auto_190541 ) ) ( not ( = ?auto_190534 ?auto_190540 ) ) ( not ( = ?auto_190535 ?auto_190541 ) ) ( not ( = ?auto_190535 ?auto_190540 ) ) ( not ( = ?auto_190536 ?auto_190541 ) ) ( not ( = ?auto_190536 ?auto_190540 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190541 ?auto_190540 ?auto_190539 ?auto_190538 )
      ( MAKE-5PILE ?auto_190534 ?auto_190535 ?auto_190536 ?auto_190537 ?auto_190538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190542 - BLOCK
      ?auto_190543 - BLOCK
      ?auto_190544 - BLOCK
      ?auto_190545 - BLOCK
      ?auto_190546 - BLOCK
    )
    :vars
    (
      ?auto_190549 - BLOCK
      ?auto_190547 - BLOCK
      ?auto_190548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190542 ) ( ON ?auto_190543 ?auto_190542 ) ( not ( = ?auto_190542 ?auto_190543 ) ) ( not ( = ?auto_190542 ?auto_190544 ) ) ( not ( = ?auto_190542 ?auto_190545 ) ) ( not ( = ?auto_190542 ?auto_190546 ) ) ( not ( = ?auto_190543 ?auto_190544 ) ) ( not ( = ?auto_190543 ?auto_190545 ) ) ( not ( = ?auto_190543 ?auto_190546 ) ) ( not ( = ?auto_190544 ?auto_190545 ) ) ( not ( = ?auto_190544 ?auto_190546 ) ) ( not ( = ?auto_190545 ?auto_190546 ) ) ( ON ?auto_190546 ?auto_190549 ) ( not ( = ?auto_190542 ?auto_190549 ) ) ( not ( = ?auto_190543 ?auto_190549 ) ) ( not ( = ?auto_190544 ?auto_190549 ) ) ( not ( = ?auto_190545 ?auto_190549 ) ) ( not ( = ?auto_190546 ?auto_190549 ) ) ( ON ?auto_190545 ?auto_190546 ) ( CLEAR ?auto_190545 ) ( ON-TABLE ?auto_190547 ) ( ON ?auto_190548 ?auto_190547 ) ( ON ?auto_190549 ?auto_190548 ) ( not ( = ?auto_190547 ?auto_190548 ) ) ( not ( = ?auto_190547 ?auto_190549 ) ) ( not ( = ?auto_190547 ?auto_190546 ) ) ( not ( = ?auto_190547 ?auto_190545 ) ) ( not ( = ?auto_190548 ?auto_190549 ) ) ( not ( = ?auto_190548 ?auto_190546 ) ) ( not ( = ?auto_190548 ?auto_190545 ) ) ( not ( = ?auto_190542 ?auto_190547 ) ) ( not ( = ?auto_190542 ?auto_190548 ) ) ( not ( = ?auto_190543 ?auto_190547 ) ) ( not ( = ?auto_190543 ?auto_190548 ) ) ( not ( = ?auto_190544 ?auto_190547 ) ) ( not ( = ?auto_190544 ?auto_190548 ) ) ( HOLDING ?auto_190544 ) ( CLEAR ?auto_190543 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190542 ?auto_190543 ?auto_190544 )
      ( MAKE-5PILE ?auto_190542 ?auto_190543 ?auto_190544 ?auto_190545 ?auto_190546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190550 - BLOCK
      ?auto_190551 - BLOCK
      ?auto_190552 - BLOCK
      ?auto_190553 - BLOCK
      ?auto_190554 - BLOCK
    )
    :vars
    (
      ?auto_190556 - BLOCK
      ?auto_190555 - BLOCK
      ?auto_190557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190550 ) ( ON ?auto_190551 ?auto_190550 ) ( not ( = ?auto_190550 ?auto_190551 ) ) ( not ( = ?auto_190550 ?auto_190552 ) ) ( not ( = ?auto_190550 ?auto_190553 ) ) ( not ( = ?auto_190550 ?auto_190554 ) ) ( not ( = ?auto_190551 ?auto_190552 ) ) ( not ( = ?auto_190551 ?auto_190553 ) ) ( not ( = ?auto_190551 ?auto_190554 ) ) ( not ( = ?auto_190552 ?auto_190553 ) ) ( not ( = ?auto_190552 ?auto_190554 ) ) ( not ( = ?auto_190553 ?auto_190554 ) ) ( ON ?auto_190554 ?auto_190556 ) ( not ( = ?auto_190550 ?auto_190556 ) ) ( not ( = ?auto_190551 ?auto_190556 ) ) ( not ( = ?auto_190552 ?auto_190556 ) ) ( not ( = ?auto_190553 ?auto_190556 ) ) ( not ( = ?auto_190554 ?auto_190556 ) ) ( ON ?auto_190553 ?auto_190554 ) ( ON-TABLE ?auto_190555 ) ( ON ?auto_190557 ?auto_190555 ) ( ON ?auto_190556 ?auto_190557 ) ( not ( = ?auto_190555 ?auto_190557 ) ) ( not ( = ?auto_190555 ?auto_190556 ) ) ( not ( = ?auto_190555 ?auto_190554 ) ) ( not ( = ?auto_190555 ?auto_190553 ) ) ( not ( = ?auto_190557 ?auto_190556 ) ) ( not ( = ?auto_190557 ?auto_190554 ) ) ( not ( = ?auto_190557 ?auto_190553 ) ) ( not ( = ?auto_190550 ?auto_190555 ) ) ( not ( = ?auto_190550 ?auto_190557 ) ) ( not ( = ?auto_190551 ?auto_190555 ) ) ( not ( = ?auto_190551 ?auto_190557 ) ) ( not ( = ?auto_190552 ?auto_190555 ) ) ( not ( = ?auto_190552 ?auto_190557 ) ) ( CLEAR ?auto_190551 ) ( ON ?auto_190552 ?auto_190553 ) ( CLEAR ?auto_190552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190555 ?auto_190557 ?auto_190556 ?auto_190554 ?auto_190553 )
      ( MAKE-5PILE ?auto_190550 ?auto_190551 ?auto_190552 ?auto_190553 ?auto_190554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190558 - BLOCK
      ?auto_190559 - BLOCK
      ?auto_190560 - BLOCK
      ?auto_190561 - BLOCK
      ?auto_190562 - BLOCK
    )
    :vars
    (
      ?auto_190564 - BLOCK
      ?auto_190563 - BLOCK
      ?auto_190565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190558 ) ( not ( = ?auto_190558 ?auto_190559 ) ) ( not ( = ?auto_190558 ?auto_190560 ) ) ( not ( = ?auto_190558 ?auto_190561 ) ) ( not ( = ?auto_190558 ?auto_190562 ) ) ( not ( = ?auto_190559 ?auto_190560 ) ) ( not ( = ?auto_190559 ?auto_190561 ) ) ( not ( = ?auto_190559 ?auto_190562 ) ) ( not ( = ?auto_190560 ?auto_190561 ) ) ( not ( = ?auto_190560 ?auto_190562 ) ) ( not ( = ?auto_190561 ?auto_190562 ) ) ( ON ?auto_190562 ?auto_190564 ) ( not ( = ?auto_190558 ?auto_190564 ) ) ( not ( = ?auto_190559 ?auto_190564 ) ) ( not ( = ?auto_190560 ?auto_190564 ) ) ( not ( = ?auto_190561 ?auto_190564 ) ) ( not ( = ?auto_190562 ?auto_190564 ) ) ( ON ?auto_190561 ?auto_190562 ) ( ON-TABLE ?auto_190563 ) ( ON ?auto_190565 ?auto_190563 ) ( ON ?auto_190564 ?auto_190565 ) ( not ( = ?auto_190563 ?auto_190565 ) ) ( not ( = ?auto_190563 ?auto_190564 ) ) ( not ( = ?auto_190563 ?auto_190562 ) ) ( not ( = ?auto_190563 ?auto_190561 ) ) ( not ( = ?auto_190565 ?auto_190564 ) ) ( not ( = ?auto_190565 ?auto_190562 ) ) ( not ( = ?auto_190565 ?auto_190561 ) ) ( not ( = ?auto_190558 ?auto_190563 ) ) ( not ( = ?auto_190558 ?auto_190565 ) ) ( not ( = ?auto_190559 ?auto_190563 ) ) ( not ( = ?auto_190559 ?auto_190565 ) ) ( not ( = ?auto_190560 ?auto_190563 ) ) ( not ( = ?auto_190560 ?auto_190565 ) ) ( ON ?auto_190560 ?auto_190561 ) ( CLEAR ?auto_190560 ) ( HOLDING ?auto_190559 ) ( CLEAR ?auto_190558 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190558 ?auto_190559 )
      ( MAKE-5PILE ?auto_190558 ?auto_190559 ?auto_190560 ?auto_190561 ?auto_190562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190566 - BLOCK
      ?auto_190567 - BLOCK
      ?auto_190568 - BLOCK
      ?auto_190569 - BLOCK
      ?auto_190570 - BLOCK
    )
    :vars
    (
      ?auto_190572 - BLOCK
      ?auto_190571 - BLOCK
      ?auto_190573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190566 ) ( not ( = ?auto_190566 ?auto_190567 ) ) ( not ( = ?auto_190566 ?auto_190568 ) ) ( not ( = ?auto_190566 ?auto_190569 ) ) ( not ( = ?auto_190566 ?auto_190570 ) ) ( not ( = ?auto_190567 ?auto_190568 ) ) ( not ( = ?auto_190567 ?auto_190569 ) ) ( not ( = ?auto_190567 ?auto_190570 ) ) ( not ( = ?auto_190568 ?auto_190569 ) ) ( not ( = ?auto_190568 ?auto_190570 ) ) ( not ( = ?auto_190569 ?auto_190570 ) ) ( ON ?auto_190570 ?auto_190572 ) ( not ( = ?auto_190566 ?auto_190572 ) ) ( not ( = ?auto_190567 ?auto_190572 ) ) ( not ( = ?auto_190568 ?auto_190572 ) ) ( not ( = ?auto_190569 ?auto_190572 ) ) ( not ( = ?auto_190570 ?auto_190572 ) ) ( ON ?auto_190569 ?auto_190570 ) ( ON-TABLE ?auto_190571 ) ( ON ?auto_190573 ?auto_190571 ) ( ON ?auto_190572 ?auto_190573 ) ( not ( = ?auto_190571 ?auto_190573 ) ) ( not ( = ?auto_190571 ?auto_190572 ) ) ( not ( = ?auto_190571 ?auto_190570 ) ) ( not ( = ?auto_190571 ?auto_190569 ) ) ( not ( = ?auto_190573 ?auto_190572 ) ) ( not ( = ?auto_190573 ?auto_190570 ) ) ( not ( = ?auto_190573 ?auto_190569 ) ) ( not ( = ?auto_190566 ?auto_190571 ) ) ( not ( = ?auto_190566 ?auto_190573 ) ) ( not ( = ?auto_190567 ?auto_190571 ) ) ( not ( = ?auto_190567 ?auto_190573 ) ) ( not ( = ?auto_190568 ?auto_190571 ) ) ( not ( = ?auto_190568 ?auto_190573 ) ) ( ON ?auto_190568 ?auto_190569 ) ( CLEAR ?auto_190566 ) ( ON ?auto_190567 ?auto_190568 ) ( CLEAR ?auto_190567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190571 ?auto_190573 ?auto_190572 ?auto_190570 ?auto_190569 ?auto_190568 )
      ( MAKE-5PILE ?auto_190566 ?auto_190567 ?auto_190568 ?auto_190569 ?auto_190570 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190574 - BLOCK
      ?auto_190575 - BLOCK
      ?auto_190576 - BLOCK
      ?auto_190577 - BLOCK
      ?auto_190578 - BLOCK
    )
    :vars
    (
      ?auto_190579 - BLOCK
      ?auto_190580 - BLOCK
      ?auto_190581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190574 ?auto_190575 ) ) ( not ( = ?auto_190574 ?auto_190576 ) ) ( not ( = ?auto_190574 ?auto_190577 ) ) ( not ( = ?auto_190574 ?auto_190578 ) ) ( not ( = ?auto_190575 ?auto_190576 ) ) ( not ( = ?auto_190575 ?auto_190577 ) ) ( not ( = ?auto_190575 ?auto_190578 ) ) ( not ( = ?auto_190576 ?auto_190577 ) ) ( not ( = ?auto_190576 ?auto_190578 ) ) ( not ( = ?auto_190577 ?auto_190578 ) ) ( ON ?auto_190578 ?auto_190579 ) ( not ( = ?auto_190574 ?auto_190579 ) ) ( not ( = ?auto_190575 ?auto_190579 ) ) ( not ( = ?auto_190576 ?auto_190579 ) ) ( not ( = ?auto_190577 ?auto_190579 ) ) ( not ( = ?auto_190578 ?auto_190579 ) ) ( ON ?auto_190577 ?auto_190578 ) ( ON-TABLE ?auto_190580 ) ( ON ?auto_190581 ?auto_190580 ) ( ON ?auto_190579 ?auto_190581 ) ( not ( = ?auto_190580 ?auto_190581 ) ) ( not ( = ?auto_190580 ?auto_190579 ) ) ( not ( = ?auto_190580 ?auto_190578 ) ) ( not ( = ?auto_190580 ?auto_190577 ) ) ( not ( = ?auto_190581 ?auto_190579 ) ) ( not ( = ?auto_190581 ?auto_190578 ) ) ( not ( = ?auto_190581 ?auto_190577 ) ) ( not ( = ?auto_190574 ?auto_190580 ) ) ( not ( = ?auto_190574 ?auto_190581 ) ) ( not ( = ?auto_190575 ?auto_190580 ) ) ( not ( = ?auto_190575 ?auto_190581 ) ) ( not ( = ?auto_190576 ?auto_190580 ) ) ( not ( = ?auto_190576 ?auto_190581 ) ) ( ON ?auto_190576 ?auto_190577 ) ( ON ?auto_190575 ?auto_190576 ) ( CLEAR ?auto_190575 ) ( HOLDING ?auto_190574 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190574 )
      ( MAKE-5PILE ?auto_190574 ?auto_190575 ?auto_190576 ?auto_190577 ?auto_190578 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190582 - BLOCK
      ?auto_190583 - BLOCK
      ?auto_190584 - BLOCK
      ?auto_190585 - BLOCK
      ?auto_190586 - BLOCK
    )
    :vars
    (
      ?auto_190587 - BLOCK
      ?auto_190589 - BLOCK
      ?auto_190588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190582 ?auto_190583 ) ) ( not ( = ?auto_190582 ?auto_190584 ) ) ( not ( = ?auto_190582 ?auto_190585 ) ) ( not ( = ?auto_190582 ?auto_190586 ) ) ( not ( = ?auto_190583 ?auto_190584 ) ) ( not ( = ?auto_190583 ?auto_190585 ) ) ( not ( = ?auto_190583 ?auto_190586 ) ) ( not ( = ?auto_190584 ?auto_190585 ) ) ( not ( = ?auto_190584 ?auto_190586 ) ) ( not ( = ?auto_190585 ?auto_190586 ) ) ( ON ?auto_190586 ?auto_190587 ) ( not ( = ?auto_190582 ?auto_190587 ) ) ( not ( = ?auto_190583 ?auto_190587 ) ) ( not ( = ?auto_190584 ?auto_190587 ) ) ( not ( = ?auto_190585 ?auto_190587 ) ) ( not ( = ?auto_190586 ?auto_190587 ) ) ( ON ?auto_190585 ?auto_190586 ) ( ON-TABLE ?auto_190589 ) ( ON ?auto_190588 ?auto_190589 ) ( ON ?auto_190587 ?auto_190588 ) ( not ( = ?auto_190589 ?auto_190588 ) ) ( not ( = ?auto_190589 ?auto_190587 ) ) ( not ( = ?auto_190589 ?auto_190586 ) ) ( not ( = ?auto_190589 ?auto_190585 ) ) ( not ( = ?auto_190588 ?auto_190587 ) ) ( not ( = ?auto_190588 ?auto_190586 ) ) ( not ( = ?auto_190588 ?auto_190585 ) ) ( not ( = ?auto_190582 ?auto_190589 ) ) ( not ( = ?auto_190582 ?auto_190588 ) ) ( not ( = ?auto_190583 ?auto_190589 ) ) ( not ( = ?auto_190583 ?auto_190588 ) ) ( not ( = ?auto_190584 ?auto_190589 ) ) ( not ( = ?auto_190584 ?auto_190588 ) ) ( ON ?auto_190584 ?auto_190585 ) ( ON ?auto_190583 ?auto_190584 ) ( ON ?auto_190582 ?auto_190583 ) ( CLEAR ?auto_190582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190589 ?auto_190588 ?auto_190587 ?auto_190586 ?auto_190585 ?auto_190584 ?auto_190583 )
      ( MAKE-5PILE ?auto_190582 ?auto_190583 ?auto_190584 ?auto_190585 ?auto_190586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190590 - BLOCK
      ?auto_190591 - BLOCK
      ?auto_190592 - BLOCK
      ?auto_190593 - BLOCK
      ?auto_190594 - BLOCK
    )
    :vars
    (
      ?auto_190595 - BLOCK
      ?auto_190596 - BLOCK
      ?auto_190597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190590 ?auto_190591 ) ) ( not ( = ?auto_190590 ?auto_190592 ) ) ( not ( = ?auto_190590 ?auto_190593 ) ) ( not ( = ?auto_190590 ?auto_190594 ) ) ( not ( = ?auto_190591 ?auto_190592 ) ) ( not ( = ?auto_190591 ?auto_190593 ) ) ( not ( = ?auto_190591 ?auto_190594 ) ) ( not ( = ?auto_190592 ?auto_190593 ) ) ( not ( = ?auto_190592 ?auto_190594 ) ) ( not ( = ?auto_190593 ?auto_190594 ) ) ( ON ?auto_190594 ?auto_190595 ) ( not ( = ?auto_190590 ?auto_190595 ) ) ( not ( = ?auto_190591 ?auto_190595 ) ) ( not ( = ?auto_190592 ?auto_190595 ) ) ( not ( = ?auto_190593 ?auto_190595 ) ) ( not ( = ?auto_190594 ?auto_190595 ) ) ( ON ?auto_190593 ?auto_190594 ) ( ON-TABLE ?auto_190596 ) ( ON ?auto_190597 ?auto_190596 ) ( ON ?auto_190595 ?auto_190597 ) ( not ( = ?auto_190596 ?auto_190597 ) ) ( not ( = ?auto_190596 ?auto_190595 ) ) ( not ( = ?auto_190596 ?auto_190594 ) ) ( not ( = ?auto_190596 ?auto_190593 ) ) ( not ( = ?auto_190597 ?auto_190595 ) ) ( not ( = ?auto_190597 ?auto_190594 ) ) ( not ( = ?auto_190597 ?auto_190593 ) ) ( not ( = ?auto_190590 ?auto_190596 ) ) ( not ( = ?auto_190590 ?auto_190597 ) ) ( not ( = ?auto_190591 ?auto_190596 ) ) ( not ( = ?auto_190591 ?auto_190597 ) ) ( not ( = ?auto_190592 ?auto_190596 ) ) ( not ( = ?auto_190592 ?auto_190597 ) ) ( ON ?auto_190592 ?auto_190593 ) ( ON ?auto_190591 ?auto_190592 ) ( HOLDING ?auto_190590 ) ( CLEAR ?auto_190591 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190596 ?auto_190597 ?auto_190595 ?auto_190594 ?auto_190593 ?auto_190592 ?auto_190591 ?auto_190590 )
      ( MAKE-5PILE ?auto_190590 ?auto_190591 ?auto_190592 ?auto_190593 ?auto_190594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190598 - BLOCK
      ?auto_190599 - BLOCK
      ?auto_190600 - BLOCK
      ?auto_190601 - BLOCK
      ?auto_190602 - BLOCK
    )
    :vars
    (
      ?auto_190603 - BLOCK
      ?auto_190604 - BLOCK
      ?auto_190605 - BLOCK
      ?auto_190606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190598 ?auto_190599 ) ) ( not ( = ?auto_190598 ?auto_190600 ) ) ( not ( = ?auto_190598 ?auto_190601 ) ) ( not ( = ?auto_190598 ?auto_190602 ) ) ( not ( = ?auto_190599 ?auto_190600 ) ) ( not ( = ?auto_190599 ?auto_190601 ) ) ( not ( = ?auto_190599 ?auto_190602 ) ) ( not ( = ?auto_190600 ?auto_190601 ) ) ( not ( = ?auto_190600 ?auto_190602 ) ) ( not ( = ?auto_190601 ?auto_190602 ) ) ( ON ?auto_190602 ?auto_190603 ) ( not ( = ?auto_190598 ?auto_190603 ) ) ( not ( = ?auto_190599 ?auto_190603 ) ) ( not ( = ?auto_190600 ?auto_190603 ) ) ( not ( = ?auto_190601 ?auto_190603 ) ) ( not ( = ?auto_190602 ?auto_190603 ) ) ( ON ?auto_190601 ?auto_190602 ) ( ON-TABLE ?auto_190604 ) ( ON ?auto_190605 ?auto_190604 ) ( ON ?auto_190603 ?auto_190605 ) ( not ( = ?auto_190604 ?auto_190605 ) ) ( not ( = ?auto_190604 ?auto_190603 ) ) ( not ( = ?auto_190604 ?auto_190602 ) ) ( not ( = ?auto_190604 ?auto_190601 ) ) ( not ( = ?auto_190605 ?auto_190603 ) ) ( not ( = ?auto_190605 ?auto_190602 ) ) ( not ( = ?auto_190605 ?auto_190601 ) ) ( not ( = ?auto_190598 ?auto_190604 ) ) ( not ( = ?auto_190598 ?auto_190605 ) ) ( not ( = ?auto_190599 ?auto_190604 ) ) ( not ( = ?auto_190599 ?auto_190605 ) ) ( not ( = ?auto_190600 ?auto_190604 ) ) ( not ( = ?auto_190600 ?auto_190605 ) ) ( ON ?auto_190600 ?auto_190601 ) ( ON ?auto_190599 ?auto_190600 ) ( CLEAR ?auto_190599 ) ( ON ?auto_190598 ?auto_190606 ) ( CLEAR ?auto_190598 ) ( HAND-EMPTY ) ( not ( = ?auto_190598 ?auto_190606 ) ) ( not ( = ?auto_190599 ?auto_190606 ) ) ( not ( = ?auto_190600 ?auto_190606 ) ) ( not ( = ?auto_190601 ?auto_190606 ) ) ( not ( = ?auto_190602 ?auto_190606 ) ) ( not ( = ?auto_190603 ?auto_190606 ) ) ( not ( = ?auto_190604 ?auto_190606 ) ) ( not ( = ?auto_190605 ?auto_190606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190598 ?auto_190606 )
      ( MAKE-5PILE ?auto_190598 ?auto_190599 ?auto_190600 ?auto_190601 ?auto_190602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190607 - BLOCK
      ?auto_190608 - BLOCK
      ?auto_190609 - BLOCK
      ?auto_190610 - BLOCK
      ?auto_190611 - BLOCK
    )
    :vars
    (
      ?auto_190612 - BLOCK
      ?auto_190613 - BLOCK
      ?auto_190615 - BLOCK
      ?auto_190614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190607 ?auto_190608 ) ) ( not ( = ?auto_190607 ?auto_190609 ) ) ( not ( = ?auto_190607 ?auto_190610 ) ) ( not ( = ?auto_190607 ?auto_190611 ) ) ( not ( = ?auto_190608 ?auto_190609 ) ) ( not ( = ?auto_190608 ?auto_190610 ) ) ( not ( = ?auto_190608 ?auto_190611 ) ) ( not ( = ?auto_190609 ?auto_190610 ) ) ( not ( = ?auto_190609 ?auto_190611 ) ) ( not ( = ?auto_190610 ?auto_190611 ) ) ( ON ?auto_190611 ?auto_190612 ) ( not ( = ?auto_190607 ?auto_190612 ) ) ( not ( = ?auto_190608 ?auto_190612 ) ) ( not ( = ?auto_190609 ?auto_190612 ) ) ( not ( = ?auto_190610 ?auto_190612 ) ) ( not ( = ?auto_190611 ?auto_190612 ) ) ( ON ?auto_190610 ?auto_190611 ) ( ON-TABLE ?auto_190613 ) ( ON ?auto_190615 ?auto_190613 ) ( ON ?auto_190612 ?auto_190615 ) ( not ( = ?auto_190613 ?auto_190615 ) ) ( not ( = ?auto_190613 ?auto_190612 ) ) ( not ( = ?auto_190613 ?auto_190611 ) ) ( not ( = ?auto_190613 ?auto_190610 ) ) ( not ( = ?auto_190615 ?auto_190612 ) ) ( not ( = ?auto_190615 ?auto_190611 ) ) ( not ( = ?auto_190615 ?auto_190610 ) ) ( not ( = ?auto_190607 ?auto_190613 ) ) ( not ( = ?auto_190607 ?auto_190615 ) ) ( not ( = ?auto_190608 ?auto_190613 ) ) ( not ( = ?auto_190608 ?auto_190615 ) ) ( not ( = ?auto_190609 ?auto_190613 ) ) ( not ( = ?auto_190609 ?auto_190615 ) ) ( ON ?auto_190609 ?auto_190610 ) ( ON ?auto_190607 ?auto_190614 ) ( CLEAR ?auto_190607 ) ( not ( = ?auto_190607 ?auto_190614 ) ) ( not ( = ?auto_190608 ?auto_190614 ) ) ( not ( = ?auto_190609 ?auto_190614 ) ) ( not ( = ?auto_190610 ?auto_190614 ) ) ( not ( = ?auto_190611 ?auto_190614 ) ) ( not ( = ?auto_190612 ?auto_190614 ) ) ( not ( = ?auto_190613 ?auto_190614 ) ) ( not ( = ?auto_190615 ?auto_190614 ) ) ( HOLDING ?auto_190608 ) ( CLEAR ?auto_190609 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190613 ?auto_190615 ?auto_190612 ?auto_190611 ?auto_190610 ?auto_190609 ?auto_190608 )
      ( MAKE-5PILE ?auto_190607 ?auto_190608 ?auto_190609 ?auto_190610 ?auto_190611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190616 - BLOCK
      ?auto_190617 - BLOCK
      ?auto_190618 - BLOCK
      ?auto_190619 - BLOCK
      ?auto_190620 - BLOCK
    )
    :vars
    (
      ?auto_190624 - BLOCK
      ?auto_190622 - BLOCK
      ?auto_190621 - BLOCK
      ?auto_190623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190616 ?auto_190617 ) ) ( not ( = ?auto_190616 ?auto_190618 ) ) ( not ( = ?auto_190616 ?auto_190619 ) ) ( not ( = ?auto_190616 ?auto_190620 ) ) ( not ( = ?auto_190617 ?auto_190618 ) ) ( not ( = ?auto_190617 ?auto_190619 ) ) ( not ( = ?auto_190617 ?auto_190620 ) ) ( not ( = ?auto_190618 ?auto_190619 ) ) ( not ( = ?auto_190618 ?auto_190620 ) ) ( not ( = ?auto_190619 ?auto_190620 ) ) ( ON ?auto_190620 ?auto_190624 ) ( not ( = ?auto_190616 ?auto_190624 ) ) ( not ( = ?auto_190617 ?auto_190624 ) ) ( not ( = ?auto_190618 ?auto_190624 ) ) ( not ( = ?auto_190619 ?auto_190624 ) ) ( not ( = ?auto_190620 ?auto_190624 ) ) ( ON ?auto_190619 ?auto_190620 ) ( ON-TABLE ?auto_190622 ) ( ON ?auto_190621 ?auto_190622 ) ( ON ?auto_190624 ?auto_190621 ) ( not ( = ?auto_190622 ?auto_190621 ) ) ( not ( = ?auto_190622 ?auto_190624 ) ) ( not ( = ?auto_190622 ?auto_190620 ) ) ( not ( = ?auto_190622 ?auto_190619 ) ) ( not ( = ?auto_190621 ?auto_190624 ) ) ( not ( = ?auto_190621 ?auto_190620 ) ) ( not ( = ?auto_190621 ?auto_190619 ) ) ( not ( = ?auto_190616 ?auto_190622 ) ) ( not ( = ?auto_190616 ?auto_190621 ) ) ( not ( = ?auto_190617 ?auto_190622 ) ) ( not ( = ?auto_190617 ?auto_190621 ) ) ( not ( = ?auto_190618 ?auto_190622 ) ) ( not ( = ?auto_190618 ?auto_190621 ) ) ( ON ?auto_190618 ?auto_190619 ) ( ON ?auto_190616 ?auto_190623 ) ( not ( = ?auto_190616 ?auto_190623 ) ) ( not ( = ?auto_190617 ?auto_190623 ) ) ( not ( = ?auto_190618 ?auto_190623 ) ) ( not ( = ?auto_190619 ?auto_190623 ) ) ( not ( = ?auto_190620 ?auto_190623 ) ) ( not ( = ?auto_190624 ?auto_190623 ) ) ( not ( = ?auto_190622 ?auto_190623 ) ) ( not ( = ?auto_190621 ?auto_190623 ) ) ( CLEAR ?auto_190618 ) ( ON ?auto_190617 ?auto_190616 ) ( CLEAR ?auto_190617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190623 ?auto_190616 )
      ( MAKE-5PILE ?auto_190616 ?auto_190617 ?auto_190618 ?auto_190619 ?auto_190620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190625 - BLOCK
      ?auto_190626 - BLOCK
      ?auto_190627 - BLOCK
      ?auto_190628 - BLOCK
      ?auto_190629 - BLOCK
    )
    :vars
    (
      ?auto_190632 - BLOCK
      ?auto_190630 - BLOCK
      ?auto_190633 - BLOCK
      ?auto_190631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190625 ?auto_190626 ) ) ( not ( = ?auto_190625 ?auto_190627 ) ) ( not ( = ?auto_190625 ?auto_190628 ) ) ( not ( = ?auto_190625 ?auto_190629 ) ) ( not ( = ?auto_190626 ?auto_190627 ) ) ( not ( = ?auto_190626 ?auto_190628 ) ) ( not ( = ?auto_190626 ?auto_190629 ) ) ( not ( = ?auto_190627 ?auto_190628 ) ) ( not ( = ?auto_190627 ?auto_190629 ) ) ( not ( = ?auto_190628 ?auto_190629 ) ) ( ON ?auto_190629 ?auto_190632 ) ( not ( = ?auto_190625 ?auto_190632 ) ) ( not ( = ?auto_190626 ?auto_190632 ) ) ( not ( = ?auto_190627 ?auto_190632 ) ) ( not ( = ?auto_190628 ?auto_190632 ) ) ( not ( = ?auto_190629 ?auto_190632 ) ) ( ON ?auto_190628 ?auto_190629 ) ( ON-TABLE ?auto_190630 ) ( ON ?auto_190633 ?auto_190630 ) ( ON ?auto_190632 ?auto_190633 ) ( not ( = ?auto_190630 ?auto_190633 ) ) ( not ( = ?auto_190630 ?auto_190632 ) ) ( not ( = ?auto_190630 ?auto_190629 ) ) ( not ( = ?auto_190630 ?auto_190628 ) ) ( not ( = ?auto_190633 ?auto_190632 ) ) ( not ( = ?auto_190633 ?auto_190629 ) ) ( not ( = ?auto_190633 ?auto_190628 ) ) ( not ( = ?auto_190625 ?auto_190630 ) ) ( not ( = ?auto_190625 ?auto_190633 ) ) ( not ( = ?auto_190626 ?auto_190630 ) ) ( not ( = ?auto_190626 ?auto_190633 ) ) ( not ( = ?auto_190627 ?auto_190630 ) ) ( not ( = ?auto_190627 ?auto_190633 ) ) ( ON ?auto_190625 ?auto_190631 ) ( not ( = ?auto_190625 ?auto_190631 ) ) ( not ( = ?auto_190626 ?auto_190631 ) ) ( not ( = ?auto_190627 ?auto_190631 ) ) ( not ( = ?auto_190628 ?auto_190631 ) ) ( not ( = ?auto_190629 ?auto_190631 ) ) ( not ( = ?auto_190632 ?auto_190631 ) ) ( not ( = ?auto_190630 ?auto_190631 ) ) ( not ( = ?auto_190633 ?auto_190631 ) ) ( ON ?auto_190626 ?auto_190625 ) ( CLEAR ?auto_190626 ) ( ON-TABLE ?auto_190631 ) ( HOLDING ?auto_190627 ) ( CLEAR ?auto_190628 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190630 ?auto_190633 ?auto_190632 ?auto_190629 ?auto_190628 ?auto_190627 )
      ( MAKE-5PILE ?auto_190625 ?auto_190626 ?auto_190627 ?auto_190628 ?auto_190629 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190634 - BLOCK
      ?auto_190635 - BLOCK
      ?auto_190636 - BLOCK
      ?auto_190637 - BLOCK
      ?auto_190638 - BLOCK
    )
    :vars
    (
      ?auto_190641 - BLOCK
      ?auto_190639 - BLOCK
      ?auto_190640 - BLOCK
      ?auto_190642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190634 ?auto_190635 ) ) ( not ( = ?auto_190634 ?auto_190636 ) ) ( not ( = ?auto_190634 ?auto_190637 ) ) ( not ( = ?auto_190634 ?auto_190638 ) ) ( not ( = ?auto_190635 ?auto_190636 ) ) ( not ( = ?auto_190635 ?auto_190637 ) ) ( not ( = ?auto_190635 ?auto_190638 ) ) ( not ( = ?auto_190636 ?auto_190637 ) ) ( not ( = ?auto_190636 ?auto_190638 ) ) ( not ( = ?auto_190637 ?auto_190638 ) ) ( ON ?auto_190638 ?auto_190641 ) ( not ( = ?auto_190634 ?auto_190641 ) ) ( not ( = ?auto_190635 ?auto_190641 ) ) ( not ( = ?auto_190636 ?auto_190641 ) ) ( not ( = ?auto_190637 ?auto_190641 ) ) ( not ( = ?auto_190638 ?auto_190641 ) ) ( ON ?auto_190637 ?auto_190638 ) ( ON-TABLE ?auto_190639 ) ( ON ?auto_190640 ?auto_190639 ) ( ON ?auto_190641 ?auto_190640 ) ( not ( = ?auto_190639 ?auto_190640 ) ) ( not ( = ?auto_190639 ?auto_190641 ) ) ( not ( = ?auto_190639 ?auto_190638 ) ) ( not ( = ?auto_190639 ?auto_190637 ) ) ( not ( = ?auto_190640 ?auto_190641 ) ) ( not ( = ?auto_190640 ?auto_190638 ) ) ( not ( = ?auto_190640 ?auto_190637 ) ) ( not ( = ?auto_190634 ?auto_190639 ) ) ( not ( = ?auto_190634 ?auto_190640 ) ) ( not ( = ?auto_190635 ?auto_190639 ) ) ( not ( = ?auto_190635 ?auto_190640 ) ) ( not ( = ?auto_190636 ?auto_190639 ) ) ( not ( = ?auto_190636 ?auto_190640 ) ) ( ON ?auto_190634 ?auto_190642 ) ( not ( = ?auto_190634 ?auto_190642 ) ) ( not ( = ?auto_190635 ?auto_190642 ) ) ( not ( = ?auto_190636 ?auto_190642 ) ) ( not ( = ?auto_190637 ?auto_190642 ) ) ( not ( = ?auto_190638 ?auto_190642 ) ) ( not ( = ?auto_190641 ?auto_190642 ) ) ( not ( = ?auto_190639 ?auto_190642 ) ) ( not ( = ?auto_190640 ?auto_190642 ) ) ( ON ?auto_190635 ?auto_190634 ) ( ON-TABLE ?auto_190642 ) ( CLEAR ?auto_190637 ) ( ON ?auto_190636 ?auto_190635 ) ( CLEAR ?auto_190636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190642 ?auto_190634 ?auto_190635 )
      ( MAKE-5PILE ?auto_190634 ?auto_190635 ?auto_190636 ?auto_190637 ?auto_190638 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190643 - BLOCK
      ?auto_190644 - BLOCK
      ?auto_190645 - BLOCK
      ?auto_190646 - BLOCK
      ?auto_190647 - BLOCK
    )
    :vars
    (
      ?auto_190650 - BLOCK
      ?auto_190648 - BLOCK
      ?auto_190649 - BLOCK
      ?auto_190651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190643 ?auto_190644 ) ) ( not ( = ?auto_190643 ?auto_190645 ) ) ( not ( = ?auto_190643 ?auto_190646 ) ) ( not ( = ?auto_190643 ?auto_190647 ) ) ( not ( = ?auto_190644 ?auto_190645 ) ) ( not ( = ?auto_190644 ?auto_190646 ) ) ( not ( = ?auto_190644 ?auto_190647 ) ) ( not ( = ?auto_190645 ?auto_190646 ) ) ( not ( = ?auto_190645 ?auto_190647 ) ) ( not ( = ?auto_190646 ?auto_190647 ) ) ( ON ?auto_190647 ?auto_190650 ) ( not ( = ?auto_190643 ?auto_190650 ) ) ( not ( = ?auto_190644 ?auto_190650 ) ) ( not ( = ?auto_190645 ?auto_190650 ) ) ( not ( = ?auto_190646 ?auto_190650 ) ) ( not ( = ?auto_190647 ?auto_190650 ) ) ( ON-TABLE ?auto_190648 ) ( ON ?auto_190649 ?auto_190648 ) ( ON ?auto_190650 ?auto_190649 ) ( not ( = ?auto_190648 ?auto_190649 ) ) ( not ( = ?auto_190648 ?auto_190650 ) ) ( not ( = ?auto_190648 ?auto_190647 ) ) ( not ( = ?auto_190648 ?auto_190646 ) ) ( not ( = ?auto_190649 ?auto_190650 ) ) ( not ( = ?auto_190649 ?auto_190647 ) ) ( not ( = ?auto_190649 ?auto_190646 ) ) ( not ( = ?auto_190643 ?auto_190648 ) ) ( not ( = ?auto_190643 ?auto_190649 ) ) ( not ( = ?auto_190644 ?auto_190648 ) ) ( not ( = ?auto_190644 ?auto_190649 ) ) ( not ( = ?auto_190645 ?auto_190648 ) ) ( not ( = ?auto_190645 ?auto_190649 ) ) ( ON ?auto_190643 ?auto_190651 ) ( not ( = ?auto_190643 ?auto_190651 ) ) ( not ( = ?auto_190644 ?auto_190651 ) ) ( not ( = ?auto_190645 ?auto_190651 ) ) ( not ( = ?auto_190646 ?auto_190651 ) ) ( not ( = ?auto_190647 ?auto_190651 ) ) ( not ( = ?auto_190650 ?auto_190651 ) ) ( not ( = ?auto_190648 ?auto_190651 ) ) ( not ( = ?auto_190649 ?auto_190651 ) ) ( ON ?auto_190644 ?auto_190643 ) ( ON-TABLE ?auto_190651 ) ( ON ?auto_190645 ?auto_190644 ) ( CLEAR ?auto_190645 ) ( HOLDING ?auto_190646 ) ( CLEAR ?auto_190647 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190648 ?auto_190649 ?auto_190650 ?auto_190647 ?auto_190646 )
      ( MAKE-5PILE ?auto_190643 ?auto_190644 ?auto_190645 ?auto_190646 ?auto_190647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190652 - BLOCK
      ?auto_190653 - BLOCK
      ?auto_190654 - BLOCK
      ?auto_190655 - BLOCK
      ?auto_190656 - BLOCK
    )
    :vars
    (
      ?auto_190660 - BLOCK
      ?auto_190657 - BLOCK
      ?auto_190658 - BLOCK
      ?auto_190659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190652 ?auto_190653 ) ) ( not ( = ?auto_190652 ?auto_190654 ) ) ( not ( = ?auto_190652 ?auto_190655 ) ) ( not ( = ?auto_190652 ?auto_190656 ) ) ( not ( = ?auto_190653 ?auto_190654 ) ) ( not ( = ?auto_190653 ?auto_190655 ) ) ( not ( = ?auto_190653 ?auto_190656 ) ) ( not ( = ?auto_190654 ?auto_190655 ) ) ( not ( = ?auto_190654 ?auto_190656 ) ) ( not ( = ?auto_190655 ?auto_190656 ) ) ( ON ?auto_190656 ?auto_190660 ) ( not ( = ?auto_190652 ?auto_190660 ) ) ( not ( = ?auto_190653 ?auto_190660 ) ) ( not ( = ?auto_190654 ?auto_190660 ) ) ( not ( = ?auto_190655 ?auto_190660 ) ) ( not ( = ?auto_190656 ?auto_190660 ) ) ( ON-TABLE ?auto_190657 ) ( ON ?auto_190658 ?auto_190657 ) ( ON ?auto_190660 ?auto_190658 ) ( not ( = ?auto_190657 ?auto_190658 ) ) ( not ( = ?auto_190657 ?auto_190660 ) ) ( not ( = ?auto_190657 ?auto_190656 ) ) ( not ( = ?auto_190657 ?auto_190655 ) ) ( not ( = ?auto_190658 ?auto_190660 ) ) ( not ( = ?auto_190658 ?auto_190656 ) ) ( not ( = ?auto_190658 ?auto_190655 ) ) ( not ( = ?auto_190652 ?auto_190657 ) ) ( not ( = ?auto_190652 ?auto_190658 ) ) ( not ( = ?auto_190653 ?auto_190657 ) ) ( not ( = ?auto_190653 ?auto_190658 ) ) ( not ( = ?auto_190654 ?auto_190657 ) ) ( not ( = ?auto_190654 ?auto_190658 ) ) ( ON ?auto_190652 ?auto_190659 ) ( not ( = ?auto_190652 ?auto_190659 ) ) ( not ( = ?auto_190653 ?auto_190659 ) ) ( not ( = ?auto_190654 ?auto_190659 ) ) ( not ( = ?auto_190655 ?auto_190659 ) ) ( not ( = ?auto_190656 ?auto_190659 ) ) ( not ( = ?auto_190660 ?auto_190659 ) ) ( not ( = ?auto_190657 ?auto_190659 ) ) ( not ( = ?auto_190658 ?auto_190659 ) ) ( ON ?auto_190653 ?auto_190652 ) ( ON-TABLE ?auto_190659 ) ( ON ?auto_190654 ?auto_190653 ) ( CLEAR ?auto_190656 ) ( ON ?auto_190655 ?auto_190654 ) ( CLEAR ?auto_190655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190659 ?auto_190652 ?auto_190653 ?auto_190654 )
      ( MAKE-5PILE ?auto_190652 ?auto_190653 ?auto_190654 ?auto_190655 ?auto_190656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190661 - BLOCK
      ?auto_190662 - BLOCK
      ?auto_190663 - BLOCK
      ?auto_190664 - BLOCK
      ?auto_190665 - BLOCK
    )
    :vars
    (
      ?auto_190667 - BLOCK
      ?auto_190669 - BLOCK
      ?auto_190668 - BLOCK
      ?auto_190666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190661 ?auto_190662 ) ) ( not ( = ?auto_190661 ?auto_190663 ) ) ( not ( = ?auto_190661 ?auto_190664 ) ) ( not ( = ?auto_190661 ?auto_190665 ) ) ( not ( = ?auto_190662 ?auto_190663 ) ) ( not ( = ?auto_190662 ?auto_190664 ) ) ( not ( = ?auto_190662 ?auto_190665 ) ) ( not ( = ?auto_190663 ?auto_190664 ) ) ( not ( = ?auto_190663 ?auto_190665 ) ) ( not ( = ?auto_190664 ?auto_190665 ) ) ( not ( = ?auto_190661 ?auto_190667 ) ) ( not ( = ?auto_190662 ?auto_190667 ) ) ( not ( = ?auto_190663 ?auto_190667 ) ) ( not ( = ?auto_190664 ?auto_190667 ) ) ( not ( = ?auto_190665 ?auto_190667 ) ) ( ON-TABLE ?auto_190669 ) ( ON ?auto_190668 ?auto_190669 ) ( ON ?auto_190667 ?auto_190668 ) ( not ( = ?auto_190669 ?auto_190668 ) ) ( not ( = ?auto_190669 ?auto_190667 ) ) ( not ( = ?auto_190669 ?auto_190665 ) ) ( not ( = ?auto_190669 ?auto_190664 ) ) ( not ( = ?auto_190668 ?auto_190667 ) ) ( not ( = ?auto_190668 ?auto_190665 ) ) ( not ( = ?auto_190668 ?auto_190664 ) ) ( not ( = ?auto_190661 ?auto_190669 ) ) ( not ( = ?auto_190661 ?auto_190668 ) ) ( not ( = ?auto_190662 ?auto_190669 ) ) ( not ( = ?auto_190662 ?auto_190668 ) ) ( not ( = ?auto_190663 ?auto_190669 ) ) ( not ( = ?auto_190663 ?auto_190668 ) ) ( ON ?auto_190661 ?auto_190666 ) ( not ( = ?auto_190661 ?auto_190666 ) ) ( not ( = ?auto_190662 ?auto_190666 ) ) ( not ( = ?auto_190663 ?auto_190666 ) ) ( not ( = ?auto_190664 ?auto_190666 ) ) ( not ( = ?auto_190665 ?auto_190666 ) ) ( not ( = ?auto_190667 ?auto_190666 ) ) ( not ( = ?auto_190669 ?auto_190666 ) ) ( not ( = ?auto_190668 ?auto_190666 ) ) ( ON ?auto_190662 ?auto_190661 ) ( ON-TABLE ?auto_190666 ) ( ON ?auto_190663 ?auto_190662 ) ( ON ?auto_190664 ?auto_190663 ) ( CLEAR ?auto_190664 ) ( HOLDING ?auto_190665 ) ( CLEAR ?auto_190667 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190669 ?auto_190668 ?auto_190667 ?auto_190665 )
      ( MAKE-5PILE ?auto_190661 ?auto_190662 ?auto_190663 ?auto_190664 ?auto_190665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190670 - BLOCK
      ?auto_190671 - BLOCK
      ?auto_190672 - BLOCK
      ?auto_190673 - BLOCK
      ?auto_190674 - BLOCK
    )
    :vars
    (
      ?auto_190677 - BLOCK
      ?auto_190678 - BLOCK
      ?auto_190675 - BLOCK
      ?auto_190676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190670 ?auto_190671 ) ) ( not ( = ?auto_190670 ?auto_190672 ) ) ( not ( = ?auto_190670 ?auto_190673 ) ) ( not ( = ?auto_190670 ?auto_190674 ) ) ( not ( = ?auto_190671 ?auto_190672 ) ) ( not ( = ?auto_190671 ?auto_190673 ) ) ( not ( = ?auto_190671 ?auto_190674 ) ) ( not ( = ?auto_190672 ?auto_190673 ) ) ( not ( = ?auto_190672 ?auto_190674 ) ) ( not ( = ?auto_190673 ?auto_190674 ) ) ( not ( = ?auto_190670 ?auto_190677 ) ) ( not ( = ?auto_190671 ?auto_190677 ) ) ( not ( = ?auto_190672 ?auto_190677 ) ) ( not ( = ?auto_190673 ?auto_190677 ) ) ( not ( = ?auto_190674 ?auto_190677 ) ) ( ON-TABLE ?auto_190678 ) ( ON ?auto_190675 ?auto_190678 ) ( ON ?auto_190677 ?auto_190675 ) ( not ( = ?auto_190678 ?auto_190675 ) ) ( not ( = ?auto_190678 ?auto_190677 ) ) ( not ( = ?auto_190678 ?auto_190674 ) ) ( not ( = ?auto_190678 ?auto_190673 ) ) ( not ( = ?auto_190675 ?auto_190677 ) ) ( not ( = ?auto_190675 ?auto_190674 ) ) ( not ( = ?auto_190675 ?auto_190673 ) ) ( not ( = ?auto_190670 ?auto_190678 ) ) ( not ( = ?auto_190670 ?auto_190675 ) ) ( not ( = ?auto_190671 ?auto_190678 ) ) ( not ( = ?auto_190671 ?auto_190675 ) ) ( not ( = ?auto_190672 ?auto_190678 ) ) ( not ( = ?auto_190672 ?auto_190675 ) ) ( ON ?auto_190670 ?auto_190676 ) ( not ( = ?auto_190670 ?auto_190676 ) ) ( not ( = ?auto_190671 ?auto_190676 ) ) ( not ( = ?auto_190672 ?auto_190676 ) ) ( not ( = ?auto_190673 ?auto_190676 ) ) ( not ( = ?auto_190674 ?auto_190676 ) ) ( not ( = ?auto_190677 ?auto_190676 ) ) ( not ( = ?auto_190678 ?auto_190676 ) ) ( not ( = ?auto_190675 ?auto_190676 ) ) ( ON ?auto_190671 ?auto_190670 ) ( ON-TABLE ?auto_190676 ) ( ON ?auto_190672 ?auto_190671 ) ( ON ?auto_190673 ?auto_190672 ) ( CLEAR ?auto_190677 ) ( ON ?auto_190674 ?auto_190673 ) ( CLEAR ?auto_190674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190676 ?auto_190670 ?auto_190671 ?auto_190672 ?auto_190673 )
      ( MAKE-5PILE ?auto_190670 ?auto_190671 ?auto_190672 ?auto_190673 ?auto_190674 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190679 - BLOCK
      ?auto_190680 - BLOCK
      ?auto_190681 - BLOCK
      ?auto_190682 - BLOCK
      ?auto_190683 - BLOCK
    )
    :vars
    (
      ?auto_190685 - BLOCK
      ?auto_190684 - BLOCK
      ?auto_190687 - BLOCK
      ?auto_190686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190679 ?auto_190680 ) ) ( not ( = ?auto_190679 ?auto_190681 ) ) ( not ( = ?auto_190679 ?auto_190682 ) ) ( not ( = ?auto_190679 ?auto_190683 ) ) ( not ( = ?auto_190680 ?auto_190681 ) ) ( not ( = ?auto_190680 ?auto_190682 ) ) ( not ( = ?auto_190680 ?auto_190683 ) ) ( not ( = ?auto_190681 ?auto_190682 ) ) ( not ( = ?auto_190681 ?auto_190683 ) ) ( not ( = ?auto_190682 ?auto_190683 ) ) ( not ( = ?auto_190679 ?auto_190685 ) ) ( not ( = ?auto_190680 ?auto_190685 ) ) ( not ( = ?auto_190681 ?auto_190685 ) ) ( not ( = ?auto_190682 ?auto_190685 ) ) ( not ( = ?auto_190683 ?auto_190685 ) ) ( ON-TABLE ?auto_190684 ) ( ON ?auto_190687 ?auto_190684 ) ( not ( = ?auto_190684 ?auto_190687 ) ) ( not ( = ?auto_190684 ?auto_190685 ) ) ( not ( = ?auto_190684 ?auto_190683 ) ) ( not ( = ?auto_190684 ?auto_190682 ) ) ( not ( = ?auto_190687 ?auto_190685 ) ) ( not ( = ?auto_190687 ?auto_190683 ) ) ( not ( = ?auto_190687 ?auto_190682 ) ) ( not ( = ?auto_190679 ?auto_190684 ) ) ( not ( = ?auto_190679 ?auto_190687 ) ) ( not ( = ?auto_190680 ?auto_190684 ) ) ( not ( = ?auto_190680 ?auto_190687 ) ) ( not ( = ?auto_190681 ?auto_190684 ) ) ( not ( = ?auto_190681 ?auto_190687 ) ) ( ON ?auto_190679 ?auto_190686 ) ( not ( = ?auto_190679 ?auto_190686 ) ) ( not ( = ?auto_190680 ?auto_190686 ) ) ( not ( = ?auto_190681 ?auto_190686 ) ) ( not ( = ?auto_190682 ?auto_190686 ) ) ( not ( = ?auto_190683 ?auto_190686 ) ) ( not ( = ?auto_190685 ?auto_190686 ) ) ( not ( = ?auto_190684 ?auto_190686 ) ) ( not ( = ?auto_190687 ?auto_190686 ) ) ( ON ?auto_190680 ?auto_190679 ) ( ON-TABLE ?auto_190686 ) ( ON ?auto_190681 ?auto_190680 ) ( ON ?auto_190682 ?auto_190681 ) ( ON ?auto_190683 ?auto_190682 ) ( CLEAR ?auto_190683 ) ( HOLDING ?auto_190685 ) ( CLEAR ?auto_190687 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190684 ?auto_190687 ?auto_190685 )
      ( MAKE-5PILE ?auto_190679 ?auto_190680 ?auto_190681 ?auto_190682 ?auto_190683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190688 - BLOCK
      ?auto_190689 - BLOCK
      ?auto_190690 - BLOCK
      ?auto_190691 - BLOCK
      ?auto_190692 - BLOCK
    )
    :vars
    (
      ?auto_190693 - BLOCK
      ?auto_190696 - BLOCK
      ?auto_190694 - BLOCK
      ?auto_190695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190688 ?auto_190689 ) ) ( not ( = ?auto_190688 ?auto_190690 ) ) ( not ( = ?auto_190688 ?auto_190691 ) ) ( not ( = ?auto_190688 ?auto_190692 ) ) ( not ( = ?auto_190689 ?auto_190690 ) ) ( not ( = ?auto_190689 ?auto_190691 ) ) ( not ( = ?auto_190689 ?auto_190692 ) ) ( not ( = ?auto_190690 ?auto_190691 ) ) ( not ( = ?auto_190690 ?auto_190692 ) ) ( not ( = ?auto_190691 ?auto_190692 ) ) ( not ( = ?auto_190688 ?auto_190693 ) ) ( not ( = ?auto_190689 ?auto_190693 ) ) ( not ( = ?auto_190690 ?auto_190693 ) ) ( not ( = ?auto_190691 ?auto_190693 ) ) ( not ( = ?auto_190692 ?auto_190693 ) ) ( ON-TABLE ?auto_190696 ) ( ON ?auto_190694 ?auto_190696 ) ( not ( = ?auto_190696 ?auto_190694 ) ) ( not ( = ?auto_190696 ?auto_190693 ) ) ( not ( = ?auto_190696 ?auto_190692 ) ) ( not ( = ?auto_190696 ?auto_190691 ) ) ( not ( = ?auto_190694 ?auto_190693 ) ) ( not ( = ?auto_190694 ?auto_190692 ) ) ( not ( = ?auto_190694 ?auto_190691 ) ) ( not ( = ?auto_190688 ?auto_190696 ) ) ( not ( = ?auto_190688 ?auto_190694 ) ) ( not ( = ?auto_190689 ?auto_190696 ) ) ( not ( = ?auto_190689 ?auto_190694 ) ) ( not ( = ?auto_190690 ?auto_190696 ) ) ( not ( = ?auto_190690 ?auto_190694 ) ) ( ON ?auto_190688 ?auto_190695 ) ( not ( = ?auto_190688 ?auto_190695 ) ) ( not ( = ?auto_190689 ?auto_190695 ) ) ( not ( = ?auto_190690 ?auto_190695 ) ) ( not ( = ?auto_190691 ?auto_190695 ) ) ( not ( = ?auto_190692 ?auto_190695 ) ) ( not ( = ?auto_190693 ?auto_190695 ) ) ( not ( = ?auto_190696 ?auto_190695 ) ) ( not ( = ?auto_190694 ?auto_190695 ) ) ( ON ?auto_190689 ?auto_190688 ) ( ON-TABLE ?auto_190695 ) ( ON ?auto_190690 ?auto_190689 ) ( ON ?auto_190691 ?auto_190690 ) ( ON ?auto_190692 ?auto_190691 ) ( CLEAR ?auto_190694 ) ( ON ?auto_190693 ?auto_190692 ) ( CLEAR ?auto_190693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190695 ?auto_190688 ?auto_190689 ?auto_190690 ?auto_190691 ?auto_190692 )
      ( MAKE-5PILE ?auto_190688 ?auto_190689 ?auto_190690 ?auto_190691 ?auto_190692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190697 - BLOCK
      ?auto_190698 - BLOCK
      ?auto_190699 - BLOCK
      ?auto_190700 - BLOCK
      ?auto_190701 - BLOCK
    )
    :vars
    (
      ?auto_190703 - BLOCK
      ?auto_190704 - BLOCK
      ?auto_190702 - BLOCK
      ?auto_190705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190697 ?auto_190698 ) ) ( not ( = ?auto_190697 ?auto_190699 ) ) ( not ( = ?auto_190697 ?auto_190700 ) ) ( not ( = ?auto_190697 ?auto_190701 ) ) ( not ( = ?auto_190698 ?auto_190699 ) ) ( not ( = ?auto_190698 ?auto_190700 ) ) ( not ( = ?auto_190698 ?auto_190701 ) ) ( not ( = ?auto_190699 ?auto_190700 ) ) ( not ( = ?auto_190699 ?auto_190701 ) ) ( not ( = ?auto_190700 ?auto_190701 ) ) ( not ( = ?auto_190697 ?auto_190703 ) ) ( not ( = ?auto_190698 ?auto_190703 ) ) ( not ( = ?auto_190699 ?auto_190703 ) ) ( not ( = ?auto_190700 ?auto_190703 ) ) ( not ( = ?auto_190701 ?auto_190703 ) ) ( ON-TABLE ?auto_190704 ) ( not ( = ?auto_190704 ?auto_190702 ) ) ( not ( = ?auto_190704 ?auto_190703 ) ) ( not ( = ?auto_190704 ?auto_190701 ) ) ( not ( = ?auto_190704 ?auto_190700 ) ) ( not ( = ?auto_190702 ?auto_190703 ) ) ( not ( = ?auto_190702 ?auto_190701 ) ) ( not ( = ?auto_190702 ?auto_190700 ) ) ( not ( = ?auto_190697 ?auto_190704 ) ) ( not ( = ?auto_190697 ?auto_190702 ) ) ( not ( = ?auto_190698 ?auto_190704 ) ) ( not ( = ?auto_190698 ?auto_190702 ) ) ( not ( = ?auto_190699 ?auto_190704 ) ) ( not ( = ?auto_190699 ?auto_190702 ) ) ( ON ?auto_190697 ?auto_190705 ) ( not ( = ?auto_190697 ?auto_190705 ) ) ( not ( = ?auto_190698 ?auto_190705 ) ) ( not ( = ?auto_190699 ?auto_190705 ) ) ( not ( = ?auto_190700 ?auto_190705 ) ) ( not ( = ?auto_190701 ?auto_190705 ) ) ( not ( = ?auto_190703 ?auto_190705 ) ) ( not ( = ?auto_190704 ?auto_190705 ) ) ( not ( = ?auto_190702 ?auto_190705 ) ) ( ON ?auto_190698 ?auto_190697 ) ( ON-TABLE ?auto_190705 ) ( ON ?auto_190699 ?auto_190698 ) ( ON ?auto_190700 ?auto_190699 ) ( ON ?auto_190701 ?auto_190700 ) ( ON ?auto_190703 ?auto_190701 ) ( CLEAR ?auto_190703 ) ( HOLDING ?auto_190702 ) ( CLEAR ?auto_190704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190704 ?auto_190702 )
      ( MAKE-5PILE ?auto_190697 ?auto_190698 ?auto_190699 ?auto_190700 ?auto_190701 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190706 - BLOCK
      ?auto_190707 - BLOCK
      ?auto_190708 - BLOCK
      ?auto_190709 - BLOCK
      ?auto_190710 - BLOCK
    )
    :vars
    (
      ?auto_190711 - BLOCK
      ?auto_190713 - BLOCK
      ?auto_190712 - BLOCK
      ?auto_190714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190706 ?auto_190707 ) ) ( not ( = ?auto_190706 ?auto_190708 ) ) ( not ( = ?auto_190706 ?auto_190709 ) ) ( not ( = ?auto_190706 ?auto_190710 ) ) ( not ( = ?auto_190707 ?auto_190708 ) ) ( not ( = ?auto_190707 ?auto_190709 ) ) ( not ( = ?auto_190707 ?auto_190710 ) ) ( not ( = ?auto_190708 ?auto_190709 ) ) ( not ( = ?auto_190708 ?auto_190710 ) ) ( not ( = ?auto_190709 ?auto_190710 ) ) ( not ( = ?auto_190706 ?auto_190711 ) ) ( not ( = ?auto_190707 ?auto_190711 ) ) ( not ( = ?auto_190708 ?auto_190711 ) ) ( not ( = ?auto_190709 ?auto_190711 ) ) ( not ( = ?auto_190710 ?auto_190711 ) ) ( ON-TABLE ?auto_190713 ) ( not ( = ?auto_190713 ?auto_190712 ) ) ( not ( = ?auto_190713 ?auto_190711 ) ) ( not ( = ?auto_190713 ?auto_190710 ) ) ( not ( = ?auto_190713 ?auto_190709 ) ) ( not ( = ?auto_190712 ?auto_190711 ) ) ( not ( = ?auto_190712 ?auto_190710 ) ) ( not ( = ?auto_190712 ?auto_190709 ) ) ( not ( = ?auto_190706 ?auto_190713 ) ) ( not ( = ?auto_190706 ?auto_190712 ) ) ( not ( = ?auto_190707 ?auto_190713 ) ) ( not ( = ?auto_190707 ?auto_190712 ) ) ( not ( = ?auto_190708 ?auto_190713 ) ) ( not ( = ?auto_190708 ?auto_190712 ) ) ( ON ?auto_190706 ?auto_190714 ) ( not ( = ?auto_190706 ?auto_190714 ) ) ( not ( = ?auto_190707 ?auto_190714 ) ) ( not ( = ?auto_190708 ?auto_190714 ) ) ( not ( = ?auto_190709 ?auto_190714 ) ) ( not ( = ?auto_190710 ?auto_190714 ) ) ( not ( = ?auto_190711 ?auto_190714 ) ) ( not ( = ?auto_190713 ?auto_190714 ) ) ( not ( = ?auto_190712 ?auto_190714 ) ) ( ON ?auto_190707 ?auto_190706 ) ( ON-TABLE ?auto_190714 ) ( ON ?auto_190708 ?auto_190707 ) ( ON ?auto_190709 ?auto_190708 ) ( ON ?auto_190710 ?auto_190709 ) ( ON ?auto_190711 ?auto_190710 ) ( CLEAR ?auto_190713 ) ( ON ?auto_190712 ?auto_190711 ) ( CLEAR ?auto_190712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190714 ?auto_190706 ?auto_190707 ?auto_190708 ?auto_190709 ?auto_190710 ?auto_190711 )
      ( MAKE-5PILE ?auto_190706 ?auto_190707 ?auto_190708 ?auto_190709 ?auto_190710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190715 - BLOCK
      ?auto_190716 - BLOCK
      ?auto_190717 - BLOCK
      ?auto_190718 - BLOCK
      ?auto_190719 - BLOCK
    )
    :vars
    (
      ?auto_190720 - BLOCK
      ?auto_190722 - BLOCK
      ?auto_190721 - BLOCK
      ?auto_190723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190715 ?auto_190716 ) ) ( not ( = ?auto_190715 ?auto_190717 ) ) ( not ( = ?auto_190715 ?auto_190718 ) ) ( not ( = ?auto_190715 ?auto_190719 ) ) ( not ( = ?auto_190716 ?auto_190717 ) ) ( not ( = ?auto_190716 ?auto_190718 ) ) ( not ( = ?auto_190716 ?auto_190719 ) ) ( not ( = ?auto_190717 ?auto_190718 ) ) ( not ( = ?auto_190717 ?auto_190719 ) ) ( not ( = ?auto_190718 ?auto_190719 ) ) ( not ( = ?auto_190715 ?auto_190720 ) ) ( not ( = ?auto_190716 ?auto_190720 ) ) ( not ( = ?auto_190717 ?auto_190720 ) ) ( not ( = ?auto_190718 ?auto_190720 ) ) ( not ( = ?auto_190719 ?auto_190720 ) ) ( not ( = ?auto_190722 ?auto_190721 ) ) ( not ( = ?auto_190722 ?auto_190720 ) ) ( not ( = ?auto_190722 ?auto_190719 ) ) ( not ( = ?auto_190722 ?auto_190718 ) ) ( not ( = ?auto_190721 ?auto_190720 ) ) ( not ( = ?auto_190721 ?auto_190719 ) ) ( not ( = ?auto_190721 ?auto_190718 ) ) ( not ( = ?auto_190715 ?auto_190722 ) ) ( not ( = ?auto_190715 ?auto_190721 ) ) ( not ( = ?auto_190716 ?auto_190722 ) ) ( not ( = ?auto_190716 ?auto_190721 ) ) ( not ( = ?auto_190717 ?auto_190722 ) ) ( not ( = ?auto_190717 ?auto_190721 ) ) ( ON ?auto_190715 ?auto_190723 ) ( not ( = ?auto_190715 ?auto_190723 ) ) ( not ( = ?auto_190716 ?auto_190723 ) ) ( not ( = ?auto_190717 ?auto_190723 ) ) ( not ( = ?auto_190718 ?auto_190723 ) ) ( not ( = ?auto_190719 ?auto_190723 ) ) ( not ( = ?auto_190720 ?auto_190723 ) ) ( not ( = ?auto_190722 ?auto_190723 ) ) ( not ( = ?auto_190721 ?auto_190723 ) ) ( ON ?auto_190716 ?auto_190715 ) ( ON-TABLE ?auto_190723 ) ( ON ?auto_190717 ?auto_190716 ) ( ON ?auto_190718 ?auto_190717 ) ( ON ?auto_190719 ?auto_190718 ) ( ON ?auto_190720 ?auto_190719 ) ( ON ?auto_190721 ?auto_190720 ) ( CLEAR ?auto_190721 ) ( HOLDING ?auto_190722 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190722 )
      ( MAKE-5PILE ?auto_190715 ?auto_190716 ?auto_190717 ?auto_190718 ?auto_190719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_190724 - BLOCK
      ?auto_190725 - BLOCK
      ?auto_190726 - BLOCK
      ?auto_190727 - BLOCK
      ?auto_190728 - BLOCK
    )
    :vars
    (
      ?auto_190730 - BLOCK
      ?auto_190729 - BLOCK
      ?auto_190731 - BLOCK
      ?auto_190732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190724 ?auto_190725 ) ) ( not ( = ?auto_190724 ?auto_190726 ) ) ( not ( = ?auto_190724 ?auto_190727 ) ) ( not ( = ?auto_190724 ?auto_190728 ) ) ( not ( = ?auto_190725 ?auto_190726 ) ) ( not ( = ?auto_190725 ?auto_190727 ) ) ( not ( = ?auto_190725 ?auto_190728 ) ) ( not ( = ?auto_190726 ?auto_190727 ) ) ( not ( = ?auto_190726 ?auto_190728 ) ) ( not ( = ?auto_190727 ?auto_190728 ) ) ( not ( = ?auto_190724 ?auto_190730 ) ) ( not ( = ?auto_190725 ?auto_190730 ) ) ( not ( = ?auto_190726 ?auto_190730 ) ) ( not ( = ?auto_190727 ?auto_190730 ) ) ( not ( = ?auto_190728 ?auto_190730 ) ) ( not ( = ?auto_190729 ?auto_190731 ) ) ( not ( = ?auto_190729 ?auto_190730 ) ) ( not ( = ?auto_190729 ?auto_190728 ) ) ( not ( = ?auto_190729 ?auto_190727 ) ) ( not ( = ?auto_190731 ?auto_190730 ) ) ( not ( = ?auto_190731 ?auto_190728 ) ) ( not ( = ?auto_190731 ?auto_190727 ) ) ( not ( = ?auto_190724 ?auto_190729 ) ) ( not ( = ?auto_190724 ?auto_190731 ) ) ( not ( = ?auto_190725 ?auto_190729 ) ) ( not ( = ?auto_190725 ?auto_190731 ) ) ( not ( = ?auto_190726 ?auto_190729 ) ) ( not ( = ?auto_190726 ?auto_190731 ) ) ( ON ?auto_190724 ?auto_190732 ) ( not ( = ?auto_190724 ?auto_190732 ) ) ( not ( = ?auto_190725 ?auto_190732 ) ) ( not ( = ?auto_190726 ?auto_190732 ) ) ( not ( = ?auto_190727 ?auto_190732 ) ) ( not ( = ?auto_190728 ?auto_190732 ) ) ( not ( = ?auto_190730 ?auto_190732 ) ) ( not ( = ?auto_190729 ?auto_190732 ) ) ( not ( = ?auto_190731 ?auto_190732 ) ) ( ON ?auto_190725 ?auto_190724 ) ( ON-TABLE ?auto_190732 ) ( ON ?auto_190726 ?auto_190725 ) ( ON ?auto_190727 ?auto_190726 ) ( ON ?auto_190728 ?auto_190727 ) ( ON ?auto_190730 ?auto_190728 ) ( ON ?auto_190731 ?auto_190730 ) ( ON ?auto_190729 ?auto_190731 ) ( CLEAR ?auto_190729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190732 ?auto_190724 ?auto_190725 ?auto_190726 ?auto_190727 ?auto_190728 ?auto_190730 ?auto_190731 )
      ( MAKE-5PILE ?auto_190724 ?auto_190725 ?auto_190726 ?auto_190727 ?auto_190728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190735 - BLOCK
      ?auto_190736 - BLOCK
    )
    :vars
    (
      ?auto_190737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190737 ?auto_190736 ) ( CLEAR ?auto_190737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190735 ) ( ON ?auto_190736 ?auto_190735 ) ( not ( = ?auto_190735 ?auto_190736 ) ) ( not ( = ?auto_190735 ?auto_190737 ) ) ( not ( = ?auto_190736 ?auto_190737 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190737 ?auto_190736 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190738 - BLOCK
      ?auto_190739 - BLOCK
    )
    :vars
    (
      ?auto_190740 - BLOCK
      ?auto_190741 - BLOCK
      ?auto_190742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190740 ?auto_190739 ) ( CLEAR ?auto_190740 ) ( ON-TABLE ?auto_190738 ) ( ON ?auto_190739 ?auto_190738 ) ( not ( = ?auto_190738 ?auto_190739 ) ) ( not ( = ?auto_190738 ?auto_190740 ) ) ( not ( = ?auto_190739 ?auto_190740 ) ) ( HOLDING ?auto_190741 ) ( CLEAR ?auto_190742 ) ( not ( = ?auto_190738 ?auto_190741 ) ) ( not ( = ?auto_190738 ?auto_190742 ) ) ( not ( = ?auto_190739 ?auto_190741 ) ) ( not ( = ?auto_190739 ?auto_190742 ) ) ( not ( = ?auto_190740 ?auto_190741 ) ) ( not ( = ?auto_190740 ?auto_190742 ) ) ( not ( = ?auto_190741 ?auto_190742 ) ) )
    :subtasks
    ( ( !STACK ?auto_190741 ?auto_190742 )
      ( MAKE-2PILE ?auto_190738 ?auto_190739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190743 - BLOCK
      ?auto_190744 - BLOCK
    )
    :vars
    (
      ?auto_190747 - BLOCK
      ?auto_190746 - BLOCK
      ?auto_190745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190747 ?auto_190744 ) ( ON-TABLE ?auto_190743 ) ( ON ?auto_190744 ?auto_190743 ) ( not ( = ?auto_190743 ?auto_190744 ) ) ( not ( = ?auto_190743 ?auto_190747 ) ) ( not ( = ?auto_190744 ?auto_190747 ) ) ( CLEAR ?auto_190746 ) ( not ( = ?auto_190743 ?auto_190745 ) ) ( not ( = ?auto_190743 ?auto_190746 ) ) ( not ( = ?auto_190744 ?auto_190745 ) ) ( not ( = ?auto_190744 ?auto_190746 ) ) ( not ( = ?auto_190747 ?auto_190745 ) ) ( not ( = ?auto_190747 ?auto_190746 ) ) ( not ( = ?auto_190745 ?auto_190746 ) ) ( ON ?auto_190745 ?auto_190747 ) ( CLEAR ?auto_190745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190743 ?auto_190744 ?auto_190747 )
      ( MAKE-2PILE ?auto_190743 ?auto_190744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190748 - BLOCK
      ?auto_190749 - BLOCK
    )
    :vars
    (
      ?auto_190751 - BLOCK
      ?auto_190750 - BLOCK
      ?auto_190752 - BLOCK
      ?auto_190753 - BLOCK
      ?auto_190755 - BLOCK
      ?auto_190754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190751 ?auto_190749 ) ( ON-TABLE ?auto_190748 ) ( ON ?auto_190749 ?auto_190748 ) ( not ( = ?auto_190748 ?auto_190749 ) ) ( not ( = ?auto_190748 ?auto_190751 ) ) ( not ( = ?auto_190749 ?auto_190751 ) ) ( not ( = ?auto_190748 ?auto_190750 ) ) ( not ( = ?auto_190748 ?auto_190752 ) ) ( not ( = ?auto_190749 ?auto_190750 ) ) ( not ( = ?auto_190749 ?auto_190752 ) ) ( not ( = ?auto_190751 ?auto_190750 ) ) ( not ( = ?auto_190751 ?auto_190752 ) ) ( not ( = ?auto_190750 ?auto_190752 ) ) ( ON ?auto_190750 ?auto_190751 ) ( CLEAR ?auto_190750 ) ( HOLDING ?auto_190752 ) ( CLEAR ?auto_190753 ) ( ON-TABLE ?auto_190755 ) ( ON ?auto_190754 ?auto_190755 ) ( ON ?auto_190753 ?auto_190754 ) ( not ( = ?auto_190755 ?auto_190754 ) ) ( not ( = ?auto_190755 ?auto_190753 ) ) ( not ( = ?auto_190755 ?auto_190752 ) ) ( not ( = ?auto_190754 ?auto_190753 ) ) ( not ( = ?auto_190754 ?auto_190752 ) ) ( not ( = ?auto_190753 ?auto_190752 ) ) ( not ( = ?auto_190748 ?auto_190753 ) ) ( not ( = ?auto_190748 ?auto_190755 ) ) ( not ( = ?auto_190748 ?auto_190754 ) ) ( not ( = ?auto_190749 ?auto_190753 ) ) ( not ( = ?auto_190749 ?auto_190755 ) ) ( not ( = ?auto_190749 ?auto_190754 ) ) ( not ( = ?auto_190751 ?auto_190753 ) ) ( not ( = ?auto_190751 ?auto_190755 ) ) ( not ( = ?auto_190751 ?auto_190754 ) ) ( not ( = ?auto_190750 ?auto_190753 ) ) ( not ( = ?auto_190750 ?auto_190755 ) ) ( not ( = ?auto_190750 ?auto_190754 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190755 ?auto_190754 ?auto_190753 ?auto_190752 )
      ( MAKE-2PILE ?auto_190748 ?auto_190749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190756 - BLOCK
      ?auto_190757 - BLOCK
    )
    :vars
    (
      ?auto_190763 - BLOCK
      ?auto_190762 - BLOCK
      ?auto_190759 - BLOCK
      ?auto_190761 - BLOCK
      ?auto_190760 - BLOCK
      ?auto_190758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190763 ?auto_190757 ) ( ON-TABLE ?auto_190756 ) ( ON ?auto_190757 ?auto_190756 ) ( not ( = ?auto_190756 ?auto_190757 ) ) ( not ( = ?auto_190756 ?auto_190763 ) ) ( not ( = ?auto_190757 ?auto_190763 ) ) ( not ( = ?auto_190756 ?auto_190762 ) ) ( not ( = ?auto_190756 ?auto_190759 ) ) ( not ( = ?auto_190757 ?auto_190762 ) ) ( not ( = ?auto_190757 ?auto_190759 ) ) ( not ( = ?auto_190763 ?auto_190762 ) ) ( not ( = ?auto_190763 ?auto_190759 ) ) ( not ( = ?auto_190762 ?auto_190759 ) ) ( ON ?auto_190762 ?auto_190763 ) ( CLEAR ?auto_190761 ) ( ON-TABLE ?auto_190760 ) ( ON ?auto_190758 ?auto_190760 ) ( ON ?auto_190761 ?auto_190758 ) ( not ( = ?auto_190760 ?auto_190758 ) ) ( not ( = ?auto_190760 ?auto_190761 ) ) ( not ( = ?auto_190760 ?auto_190759 ) ) ( not ( = ?auto_190758 ?auto_190761 ) ) ( not ( = ?auto_190758 ?auto_190759 ) ) ( not ( = ?auto_190761 ?auto_190759 ) ) ( not ( = ?auto_190756 ?auto_190761 ) ) ( not ( = ?auto_190756 ?auto_190760 ) ) ( not ( = ?auto_190756 ?auto_190758 ) ) ( not ( = ?auto_190757 ?auto_190761 ) ) ( not ( = ?auto_190757 ?auto_190760 ) ) ( not ( = ?auto_190757 ?auto_190758 ) ) ( not ( = ?auto_190763 ?auto_190761 ) ) ( not ( = ?auto_190763 ?auto_190760 ) ) ( not ( = ?auto_190763 ?auto_190758 ) ) ( not ( = ?auto_190762 ?auto_190761 ) ) ( not ( = ?auto_190762 ?auto_190760 ) ) ( not ( = ?auto_190762 ?auto_190758 ) ) ( ON ?auto_190759 ?auto_190762 ) ( CLEAR ?auto_190759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190756 ?auto_190757 ?auto_190763 ?auto_190762 )
      ( MAKE-2PILE ?auto_190756 ?auto_190757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190764 - BLOCK
      ?auto_190765 - BLOCK
    )
    :vars
    (
      ?auto_190766 - BLOCK
      ?auto_190769 - BLOCK
      ?auto_190770 - BLOCK
      ?auto_190767 - BLOCK
      ?auto_190771 - BLOCK
      ?auto_190768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190766 ?auto_190765 ) ( ON-TABLE ?auto_190764 ) ( ON ?auto_190765 ?auto_190764 ) ( not ( = ?auto_190764 ?auto_190765 ) ) ( not ( = ?auto_190764 ?auto_190766 ) ) ( not ( = ?auto_190765 ?auto_190766 ) ) ( not ( = ?auto_190764 ?auto_190769 ) ) ( not ( = ?auto_190764 ?auto_190770 ) ) ( not ( = ?auto_190765 ?auto_190769 ) ) ( not ( = ?auto_190765 ?auto_190770 ) ) ( not ( = ?auto_190766 ?auto_190769 ) ) ( not ( = ?auto_190766 ?auto_190770 ) ) ( not ( = ?auto_190769 ?auto_190770 ) ) ( ON ?auto_190769 ?auto_190766 ) ( ON-TABLE ?auto_190767 ) ( ON ?auto_190771 ?auto_190767 ) ( not ( = ?auto_190767 ?auto_190771 ) ) ( not ( = ?auto_190767 ?auto_190768 ) ) ( not ( = ?auto_190767 ?auto_190770 ) ) ( not ( = ?auto_190771 ?auto_190768 ) ) ( not ( = ?auto_190771 ?auto_190770 ) ) ( not ( = ?auto_190768 ?auto_190770 ) ) ( not ( = ?auto_190764 ?auto_190768 ) ) ( not ( = ?auto_190764 ?auto_190767 ) ) ( not ( = ?auto_190764 ?auto_190771 ) ) ( not ( = ?auto_190765 ?auto_190768 ) ) ( not ( = ?auto_190765 ?auto_190767 ) ) ( not ( = ?auto_190765 ?auto_190771 ) ) ( not ( = ?auto_190766 ?auto_190768 ) ) ( not ( = ?auto_190766 ?auto_190767 ) ) ( not ( = ?auto_190766 ?auto_190771 ) ) ( not ( = ?auto_190769 ?auto_190768 ) ) ( not ( = ?auto_190769 ?auto_190767 ) ) ( not ( = ?auto_190769 ?auto_190771 ) ) ( ON ?auto_190770 ?auto_190769 ) ( CLEAR ?auto_190770 ) ( HOLDING ?auto_190768 ) ( CLEAR ?auto_190771 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190767 ?auto_190771 ?auto_190768 )
      ( MAKE-2PILE ?auto_190764 ?auto_190765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190772 - BLOCK
      ?auto_190773 - BLOCK
    )
    :vars
    (
      ?auto_190776 - BLOCK
      ?auto_190779 - BLOCK
      ?auto_190774 - BLOCK
      ?auto_190778 - BLOCK
      ?auto_190775 - BLOCK
      ?auto_190777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190776 ?auto_190773 ) ( ON-TABLE ?auto_190772 ) ( ON ?auto_190773 ?auto_190772 ) ( not ( = ?auto_190772 ?auto_190773 ) ) ( not ( = ?auto_190772 ?auto_190776 ) ) ( not ( = ?auto_190773 ?auto_190776 ) ) ( not ( = ?auto_190772 ?auto_190779 ) ) ( not ( = ?auto_190772 ?auto_190774 ) ) ( not ( = ?auto_190773 ?auto_190779 ) ) ( not ( = ?auto_190773 ?auto_190774 ) ) ( not ( = ?auto_190776 ?auto_190779 ) ) ( not ( = ?auto_190776 ?auto_190774 ) ) ( not ( = ?auto_190779 ?auto_190774 ) ) ( ON ?auto_190779 ?auto_190776 ) ( ON-TABLE ?auto_190778 ) ( ON ?auto_190775 ?auto_190778 ) ( not ( = ?auto_190778 ?auto_190775 ) ) ( not ( = ?auto_190778 ?auto_190777 ) ) ( not ( = ?auto_190778 ?auto_190774 ) ) ( not ( = ?auto_190775 ?auto_190777 ) ) ( not ( = ?auto_190775 ?auto_190774 ) ) ( not ( = ?auto_190777 ?auto_190774 ) ) ( not ( = ?auto_190772 ?auto_190777 ) ) ( not ( = ?auto_190772 ?auto_190778 ) ) ( not ( = ?auto_190772 ?auto_190775 ) ) ( not ( = ?auto_190773 ?auto_190777 ) ) ( not ( = ?auto_190773 ?auto_190778 ) ) ( not ( = ?auto_190773 ?auto_190775 ) ) ( not ( = ?auto_190776 ?auto_190777 ) ) ( not ( = ?auto_190776 ?auto_190778 ) ) ( not ( = ?auto_190776 ?auto_190775 ) ) ( not ( = ?auto_190779 ?auto_190777 ) ) ( not ( = ?auto_190779 ?auto_190778 ) ) ( not ( = ?auto_190779 ?auto_190775 ) ) ( ON ?auto_190774 ?auto_190779 ) ( CLEAR ?auto_190775 ) ( ON ?auto_190777 ?auto_190774 ) ( CLEAR ?auto_190777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190772 ?auto_190773 ?auto_190776 ?auto_190779 ?auto_190774 )
      ( MAKE-2PILE ?auto_190772 ?auto_190773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190780 - BLOCK
      ?auto_190781 - BLOCK
    )
    :vars
    (
      ?auto_190786 - BLOCK
      ?auto_190784 - BLOCK
      ?auto_190783 - BLOCK
      ?auto_190785 - BLOCK
      ?auto_190782 - BLOCK
      ?auto_190787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190786 ?auto_190781 ) ( ON-TABLE ?auto_190780 ) ( ON ?auto_190781 ?auto_190780 ) ( not ( = ?auto_190780 ?auto_190781 ) ) ( not ( = ?auto_190780 ?auto_190786 ) ) ( not ( = ?auto_190781 ?auto_190786 ) ) ( not ( = ?auto_190780 ?auto_190784 ) ) ( not ( = ?auto_190780 ?auto_190783 ) ) ( not ( = ?auto_190781 ?auto_190784 ) ) ( not ( = ?auto_190781 ?auto_190783 ) ) ( not ( = ?auto_190786 ?auto_190784 ) ) ( not ( = ?auto_190786 ?auto_190783 ) ) ( not ( = ?auto_190784 ?auto_190783 ) ) ( ON ?auto_190784 ?auto_190786 ) ( ON-TABLE ?auto_190785 ) ( not ( = ?auto_190785 ?auto_190782 ) ) ( not ( = ?auto_190785 ?auto_190787 ) ) ( not ( = ?auto_190785 ?auto_190783 ) ) ( not ( = ?auto_190782 ?auto_190787 ) ) ( not ( = ?auto_190782 ?auto_190783 ) ) ( not ( = ?auto_190787 ?auto_190783 ) ) ( not ( = ?auto_190780 ?auto_190787 ) ) ( not ( = ?auto_190780 ?auto_190785 ) ) ( not ( = ?auto_190780 ?auto_190782 ) ) ( not ( = ?auto_190781 ?auto_190787 ) ) ( not ( = ?auto_190781 ?auto_190785 ) ) ( not ( = ?auto_190781 ?auto_190782 ) ) ( not ( = ?auto_190786 ?auto_190787 ) ) ( not ( = ?auto_190786 ?auto_190785 ) ) ( not ( = ?auto_190786 ?auto_190782 ) ) ( not ( = ?auto_190784 ?auto_190787 ) ) ( not ( = ?auto_190784 ?auto_190785 ) ) ( not ( = ?auto_190784 ?auto_190782 ) ) ( ON ?auto_190783 ?auto_190784 ) ( ON ?auto_190787 ?auto_190783 ) ( CLEAR ?auto_190787 ) ( HOLDING ?auto_190782 ) ( CLEAR ?auto_190785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190785 ?auto_190782 )
      ( MAKE-2PILE ?auto_190780 ?auto_190781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190788 - BLOCK
      ?auto_190789 - BLOCK
    )
    :vars
    (
      ?auto_190791 - BLOCK
      ?auto_190790 - BLOCK
      ?auto_190795 - BLOCK
      ?auto_190792 - BLOCK
      ?auto_190793 - BLOCK
      ?auto_190794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190791 ?auto_190789 ) ( ON-TABLE ?auto_190788 ) ( ON ?auto_190789 ?auto_190788 ) ( not ( = ?auto_190788 ?auto_190789 ) ) ( not ( = ?auto_190788 ?auto_190791 ) ) ( not ( = ?auto_190789 ?auto_190791 ) ) ( not ( = ?auto_190788 ?auto_190790 ) ) ( not ( = ?auto_190788 ?auto_190795 ) ) ( not ( = ?auto_190789 ?auto_190790 ) ) ( not ( = ?auto_190789 ?auto_190795 ) ) ( not ( = ?auto_190791 ?auto_190790 ) ) ( not ( = ?auto_190791 ?auto_190795 ) ) ( not ( = ?auto_190790 ?auto_190795 ) ) ( ON ?auto_190790 ?auto_190791 ) ( ON-TABLE ?auto_190792 ) ( not ( = ?auto_190792 ?auto_190793 ) ) ( not ( = ?auto_190792 ?auto_190794 ) ) ( not ( = ?auto_190792 ?auto_190795 ) ) ( not ( = ?auto_190793 ?auto_190794 ) ) ( not ( = ?auto_190793 ?auto_190795 ) ) ( not ( = ?auto_190794 ?auto_190795 ) ) ( not ( = ?auto_190788 ?auto_190794 ) ) ( not ( = ?auto_190788 ?auto_190792 ) ) ( not ( = ?auto_190788 ?auto_190793 ) ) ( not ( = ?auto_190789 ?auto_190794 ) ) ( not ( = ?auto_190789 ?auto_190792 ) ) ( not ( = ?auto_190789 ?auto_190793 ) ) ( not ( = ?auto_190791 ?auto_190794 ) ) ( not ( = ?auto_190791 ?auto_190792 ) ) ( not ( = ?auto_190791 ?auto_190793 ) ) ( not ( = ?auto_190790 ?auto_190794 ) ) ( not ( = ?auto_190790 ?auto_190792 ) ) ( not ( = ?auto_190790 ?auto_190793 ) ) ( ON ?auto_190795 ?auto_190790 ) ( ON ?auto_190794 ?auto_190795 ) ( CLEAR ?auto_190792 ) ( ON ?auto_190793 ?auto_190794 ) ( CLEAR ?auto_190793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190788 ?auto_190789 ?auto_190791 ?auto_190790 ?auto_190795 ?auto_190794 )
      ( MAKE-2PILE ?auto_190788 ?auto_190789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190796 - BLOCK
      ?auto_190797 - BLOCK
    )
    :vars
    (
      ?auto_190802 - BLOCK
      ?auto_190798 - BLOCK
      ?auto_190803 - BLOCK
      ?auto_190801 - BLOCK
      ?auto_190799 - BLOCK
      ?auto_190800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190802 ?auto_190797 ) ( ON-TABLE ?auto_190796 ) ( ON ?auto_190797 ?auto_190796 ) ( not ( = ?auto_190796 ?auto_190797 ) ) ( not ( = ?auto_190796 ?auto_190802 ) ) ( not ( = ?auto_190797 ?auto_190802 ) ) ( not ( = ?auto_190796 ?auto_190798 ) ) ( not ( = ?auto_190796 ?auto_190803 ) ) ( not ( = ?auto_190797 ?auto_190798 ) ) ( not ( = ?auto_190797 ?auto_190803 ) ) ( not ( = ?auto_190802 ?auto_190798 ) ) ( not ( = ?auto_190802 ?auto_190803 ) ) ( not ( = ?auto_190798 ?auto_190803 ) ) ( ON ?auto_190798 ?auto_190802 ) ( not ( = ?auto_190801 ?auto_190799 ) ) ( not ( = ?auto_190801 ?auto_190800 ) ) ( not ( = ?auto_190801 ?auto_190803 ) ) ( not ( = ?auto_190799 ?auto_190800 ) ) ( not ( = ?auto_190799 ?auto_190803 ) ) ( not ( = ?auto_190800 ?auto_190803 ) ) ( not ( = ?auto_190796 ?auto_190800 ) ) ( not ( = ?auto_190796 ?auto_190801 ) ) ( not ( = ?auto_190796 ?auto_190799 ) ) ( not ( = ?auto_190797 ?auto_190800 ) ) ( not ( = ?auto_190797 ?auto_190801 ) ) ( not ( = ?auto_190797 ?auto_190799 ) ) ( not ( = ?auto_190802 ?auto_190800 ) ) ( not ( = ?auto_190802 ?auto_190801 ) ) ( not ( = ?auto_190802 ?auto_190799 ) ) ( not ( = ?auto_190798 ?auto_190800 ) ) ( not ( = ?auto_190798 ?auto_190801 ) ) ( not ( = ?auto_190798 ?auto_190799 ) ) ( ON ?auto_190803 ?auto_190798 ) ( ON ?auto_190800 ?auto_190803 ) ( ON ?auto_190799 ?auto_190800 ) ( CLEAR ?auto_190799 ) ( HOLDING ?auto_190801 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190801 )
      ( MAKE-2PILE ?auto_190796 ?auto_190797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190804 - BLOCK
      ?auto_190805 - BLOCK
    )
    :vars
    (
      ?auto_190810 - BLOCK
      ?auto_190811 - BLOCK
      ?auto_190808 - BLOCK
      ?auto_190809 - BLOCK
      ?auto_190806 - BLOCK
      ?auto_190807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190810 ?auto_190805 ) ( ON-TABLE ?auto_190804 ) ( ON ?auto_190805 ?auto_190804 ) ( not ( = ?auto_190804 ?auto_190805 ) ) ( not ( = ?auto_190804 ?auto_190810 ) ) ( not ( = ?auto_190805 ?auto_190810 ) ) ( not ( = ?auto_190804 ?auto_190811 ) ) ( not ( = ?auto_190804 ?auto_190808 ) ) ( not ( = ?auto_190805 ?auto_190811 ) ) ( not ( = ?auto_190805 ?auto_190808 ) ) ( not ( = ?auto_190810 ?auto_190811 ) ) ( not ( = ?auto_190810 ?auto_190808 ) ) ( not ( = ?auto_190811 ?auto_190808 ) ) ( ON ?auto_190811 ?auto_190810 ) ( not ( = ?auto_190809 ?auto_190806 ) ) ( not ( = ?auto_190809 ?auto_190807 ) ) ( not ( = ?auto_190809 ?auto_190808 ) ) ( not ( = ?auto_190806 ?auto_190807 ) ) ( not ( = ?auto_190806 ?auto_190808 ) ) ( not ( = ?auto_190807 ?auto_190808 ) ) ( not ( = ?auto_190804 ?auto_190807 ) ) ( not ( = ?auto_190804 ?auto_190809 ) ) ( not ( = ?auto_190804 ?auto_190806 ) ) ( not ( = ?auto_190805 ?auto_190807 ) ) ( not ( = ?auto_190805 ?auto_190809 ) ) ( not ( = ?auto_190805 ?auto_190806 ) ) ( not ( = ?auto_190810 ?auto_190807 ) ) ( not ( = ?auto_190810 ?auto_190809 ) ) ( not ( = ?auto_190810 ?auto_190806 ) ) ( not ( = ?auto_190811 ?auto_190807 ) ) ( not ( = ?auto_190811 ?auto_190809 ) ) ( not ( = ?auto_190811 ?auto_190806 ) ) ( ON ?auto_190808 ?auto_190811 ) ( ON ?auto_190807 ?auto_190808 ) ( ON ?auto_190806 ?auto_190807 ) ( ON ?auto_190809 ?auto_190806 ) ( CLEAR ?auto_190809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190804 ?auto_190805 ?auto_190810 ?auto_190811 ?auto_190808 ?auto_190807 ?auto_190806 )
      ( MAKE-2PILE ?auto_190804 ?auto_190805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190812 - BLOCK
      ?auto_190813 - BLOCK
    )
    :vars
    (
      ?auto_190818 - BLOCK
      ?auto_190814 - BLOCK
      ?auto_190816 - BLOCK
      ?auto_190817 - BLOCK
      ?auto_190819 - BLOCK
      ?auto_190815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190818 ?auto_190813 ) ( ON-TABLE ?auto_190812 ) ( ON ?auto_190813 ?auto_190812 ) ( not ( = ?auto_190812 ?auto_190813 ) ) ( not ( = ?auto_190812 ?auto_190818 ) ) ( not ( = ?auto_190813 ?auto_190818 ) ) ( not ( = ?auto_190812 ?auto_190814 ) ) ( not ( = ?auto_190812 ?auto_190816 ) ) ( not ( = ?auto_190813 ?auto_190814 ) ) ( not ( = ?auto_190813 ?auto_190816 ) ) ( not ( = ?auto_190818 ?auto_190814 ) ) ( not ( = ?auto_190818 ?auto_190816 ) ) ( not ( = ?auto_190814 ?auto_190816 ) ) ( ON ?auto_190814 ?auto_190818 ) ( not ( = ?auto_190817 ?auto_190819 ) ) ( not ( = ?auto_190817 ?auto_190815 ) ) ( not ( = ?auto_190817 ?auto_190816 ) ) ( not ( = ?auto_190819 ?auto_190815 ) ) ( not ( = ?auto_190819 ?auto_190816 ) ) ( not ( = ?auto_190815 ?auto_190816 ) ) ( not ( = ?auto_190812 ?auto_190815 ) ) ( not ( = ?auto_190812 ?auto_190817 ) ) ( not ( = ?auto_190812 ?auto_190819 ) ) ( not ( = ?auto_190813 ?auto_190815 ) ) ( not ( = ?auto_190813 ?auto_190817 ) ) ( not ( = ?auto_190813 ?auto_190819 ) ) ( not ( = ?auto_190818 ?auto_190815 ) ) ( not ( = ?auto_190818 ?auto_190817 ) ) ( not ( = ?auto_190818 ?auto_190819 ) ) ( not ( = ?auto_190814 ?auto_190815 ) ) ( not ( = ?auto_190814 ?auto_190817 ) ) ( not ( = ?auto_190814 ?auto_190819 ) ) ( ON ?auto_190816 ?auto_190814 ) ( ON ?auto_190815 ?auto_190816 ) ( ON ?auto_190819 ?auto_190815 ) ( HOLDING ?auto_190817 ) ( CLEAR ?auto_190819 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190812 ?auto_190813 ?auto_190818 ?auto_190814 ?auto_190816 ?auto_190815 ?auto_190819 ?auto_190817 )
      ( MAKE-2PILE ?auto_190812 ?auto_190813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190820 - BLOCK
      ?auto_190821 - BLOCK
    )
    :vars
    (
      ?auto_190825 - BLOCK
      ?auto_190827 - BLOCK
      ?auto_190823 - BLOCK
      ?auto_190824 - BLOCK
      ?auto_190822 - BLOCK
      ?auto_190826 - BLOCK
      ?auto_190828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190825 ?auto_190821 ) ( ON-TABLE ?auto_190820 ) ( ON ?auto_190821 ?auto_190820 ) ( not ( = ?auto_190820 ?auto_190821 ) ) ( not ( = ?auto_190820 ?auto_190825 ) ) ( not ( = ?auto_190821 ?auto_190825 ) ) ( not ( = ?auto_190820 ?auto_190827 ) ) ( not ( = ?auto_190820 ?auto_190823 ) ) ( not ( = ?auto_190821 ?auto_190827 ) ) ( not ( = ?auto_190821 ?auto_190823 ) ) ( not ( = ?auto_190825 ?auto_190827 ) ) ( not ( = ?auto_190825 ?auto_190823 ) ) ( not ( = ?auto_190827 ?auto_190823 ) ) ( ON ?auto_190827 ?auto_190825 ) ( not ( = ?auto_190824 ?auto_190822 ) ) ( not ( = ?auto_190824 ?auto_190826 ) ) ( not ( = ?auto_190824 ?auto_190823 ) ) ( not ( = ?auto_190822 ?auto_190826 ) ) ( not ( = ?auto_190822 ?auto_190823 ) ) ( not ( = ?auto_190826 ?auto_190823 ) ) ( not ( = ?auto_190820 ?auto_190826 ) ) ( not ( = ?auto_190820 ?auto_190824 ) ) ( not ( = ?auto_190820 ?auto_190822 ) ) ( not ( = ?auto_190821 ?auto_190826 ) ) ( not ( = ?auto_190821 ?auto_190824 ) ) ( not ( = ?auto_190821 ?auto_190822 ) ) ( not ( = ?auto_190825 ?auto_190826 ) ) ( not ( = ?auto_190825 ?auto_190824 ) ) ( not ( = ?auto_190825 ?auto_190822 ) ) ( not ( = ?auto_190827 ?auto_190826 ) ) ( not ( = ?auto_190827 ?auto_190824 ) ) ( not ( = ?auto_190827 ?auto_190822 ) ) ( ON ?auto_190823 ?auto_190827 ) ( ON ?auto_190826 ?auto_190823 ) ( ON ?auto_190822 ?auto_190826 ) ( CLEAR ?auto_190822 ) ( ON ?auto_190824 ?auto_190828 ) ( CLEAR ?auto_190824 ) ( HAND-EMPTY ) ( not ( = ?auto_190820 ?auto_190828 ) ) ( not ( = ?auto_190821 ?auto_190828 ) ) ( not ( = ?auto_190825 ?auto_190828 ) ) ( not ( = ?auto_190827 ?auto_190828 ) ) ( not ( = ?auto_190823 ?auto_190828 ) ) ( not ( = ?auto_190824 ?auto_190828 ) ) ( not ( = ?auto_190822 ?auto_190828 ) ) ( not ( = ?auto_190826 ?auto_190828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190824 ?auto_190828 )
      ( MAKE-2PILE ?auto_190820 ?auto_190821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190829 - BLOCK
      ?auto_190830 - BLOCK
    )
    :vars
    (
      ?auto_190832 - BLOCK
      ?auto_190835 - BLOCK
      ?auto_190836 - BLOCK
      ?auto_190831 - BLOCK
      ?auto_190837 - BLOCK
      ?auto_190834 - BLOCK
      ?auto_190833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190832 ?auto_190830 ) ( ON-TABLE ?auto_190829 ) ( ON ?auto_190830 ?auto_190829 ) ( not ( = ?auto_190829 ?auto_190830 ) ) ( not ( = ?auto_190829 ?auto_190832 ) ) ( not ( = ?auto_190830 ?auto_190832 ) ) ( not ( = ?auto_190829 ?auto_190835 ) ) ( not ( = ?auto_190829 ?auto_190836 ) ) ( not ( = ?auto_190830 ?auto_190835 ) ) ( not ( = ?auto_190830 ?auto_190836 ) ) ( not ( = ?auto_190832 ?auto_190835 ) ) ( not ( = ?auto_190832 ?auto_190836 ) ) ( not ( = ?auto_190835 ?auto_190836 ) ) ( ON ?auto_190835 ?auto_190832 ) ( not ( = ?auto_190831 ?auto_190837 ) ) ( not ( = ?auto_190831 ?auto_190834 ) ) ( not ( = ?auto_190831 ?auto_190836 ) ) ( not ( = ?auto_190837 ?auto_190834 ) ) ( not ( = ?auto_190837 ?auto_190836 ) ) ( not ( = ?auto_190834 ?auto_190836 ) ) ( not ( = ?auto_190829 ?auto_190834 ) ) ( not ( = ?auto_190829 ?auto_190831 ) ) ( not ( = ?auto_190829 ?auto_190837 ) ) ( not ( = ?auto_190830 ?auto_190834 ) ) ( not ( = ?auto_190830 ?auto_190831 ) ) ( not ( = ?auto_190830 ?auto_190837 ) ) ( not ( = ?auto_190832 ?auto_190834 ) ) ( not ( = ?auto_190832 ?auto_190831 ) ) ( not ( = ?auto_190832 ?auto_190837 ) ) ( not ( = ?auto_190835 ?auto_190834 ) ) ( not ( = ?auto_190835 ?auto_190831 ) ) ( not ( = ?auto_190835 ?auto_190837 ) ) ( ON ?auto_190836 ?auto_190835 ) ( ON ?auto_190834 ?auto_190836 ) ( ON ?auto_190831 ?auto_190833 ) ( CLEAR ?auto_190831 ) ( not ( = ?auto_190829 ?auto_190833 ) ) ( not ( = ?auto_190830 ?auto_190833 ) ) ( not ( = ?auto_190832 ?auto_190833 ) ) ( not ( = ?auto_190835 ?auto_190833 ) ) ( not ( = ?auto_190836 ?auto_190833 ) ) ( not ( = ?auto_190831 ?auto_190833 ) ) ( not ( = ?auto_190837 ?auto_190833 ) ) ( not ( = ?auto_190834 ?auto_190833 ) ) ( HOLDING ?auto_190837 ) ( CLEAR ?auto_190834 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190829 ?auto_190830 ?auto_190832 ?auto_190835 ?auto_190836 ?auto_190834 ?auto_190837 )
      ( MAKE-2PILE ?auto_190829 ?auto_190830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190838 - BLOCK
      ?auto_190839 - BLOCK
    )
    :vars
    (
      ?auto_190842 - BLOCK
      ?auto_190844 - BLOCK
      ?auto_190840 - BLOCK
      ?auto_190841 - BLOCK
      ?auto_190845 - BLOCK
      ?auto_190846 - BLOCK
      ?auto_190843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190842 ?auto_190839 ) ( ON-TABLE ?auto_190838 ) ( ON ?auto_190839 ?auto_190838 ) ( not ( = ?auto_190838 ?auto_190839 ) ) ( not ( = ?auto_190838 ?auto_190842 ) ) ( not ( = ?auto_190839 ?auto_190842 ) ) ( not ( = ?auto_190838 ?auto_190844 ) ) ( not ( = ?auto_190838 ?auto_190840 ) ) ( not ( = ?auto_190839 ?auto_190844 ) ) ( not ( = ?auto_190839 ?auto_190840 ) ) ( not ( = ?auto_190842 ?auto_190844 ) ) ( not ( = ?auto_190842 ?auto_190840 ) ) ( not ( = ?auto_190844 ?auto_190840 ) ) ( ON ?auto_190844 ?auto_190842 ) ( not ( = ?auto_190841 ?auto_190845 ) ) ( not ( = ?auto_190841 ?auto_190846 ) ) ( not ( = ?auto_190841 ?auto_190840 ) ) ( not ( = ?auto_190845 ?auto_190846 ) ) ( not ( = ?auto_190845 ?auto_190840 ) ) ( not ( = ?auto_190846 ?auto_190840 ) ) ( not ( = ?auto_190838 ?auto_190846 ) ) ( not ( = ?auto_190838 ?auto_190841 ) ) ( not ( = ?auto_190838 ?auto_190845 ) ) ( not ( = ?auto_190839 ?auto_190846 ) ) ( not ( = ?auto_190839 ?auto_190841 ) ) ( not ( = ?auto_190839 ?auto_190845 ) ) ( not ( = ?auto_190842 ?auto_190846 ) ) ( not ( = ?auto_190842 ?auto_190841 ) ) ( not ( = ?auto_190842 ?auto_190845 ) ) ( not ( = ?auto_190844 ?auto_190846 ) ) ( not ( = ?auto_190844 ?auto_190841 ) ) ( not ( = ?auto_190844 ?auto_190845 ) ) ( ON ?auto_190840 ?auto_190844 ) ( ON ?auto_190846 ?auto_190840 ) ( ON ?auto_190841 ?auto_190843 ) ( not ( = ?auto_190838 ?auto_190843 ) ) ( not ( = ?auto_190839 ?auto_190843 ) ) ( not ( = ?auto_190842 ?auto_190843 ) ) ( not ( = ?auto_190844 ?auto_190843 ) ) ( not ( = ?auto_190840 ?auto_190843 ) ) ( not ( = ?auto_190841 ?auto_190843 ) ) ( not ( = ?auto_190845 ?auto_190843 ) ) ( not ( = ?auto_190846 ?auto_190843 ) ) ( CLEAR ?auto_190846 ) ( ON ?auto_190845 ?auto_190841 ) ( CLEAR ?auto_190845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190843 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190843 ?auto_190841 )
      ( MAKE-2PILE ?auto_190838 ?auto_190839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190847 - BLOCK
      ?auto_190848 - BLOCK
    )
    :vars
    (
      ?auto_190852 - BLOCK
      ?auto_190849 - BLOCK
      ?auto_190853 - BLOCK
      ?auto_190851 - BLOCK
      ?auto_190850 - BLOCK
      ?auto_190855 - BLOCK
      ?auto_190854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190852 ?auto_190848 ) ( ON-TABLE ?auto_190847 ) ( ON ?auto_190848 ?auto_190847 ) ( not ( = ?auto_190847 ?auto_190848 ) ) ( not ( = ?auto_190847 ?auto_190852 ) ) ( not ( = ?auto_190848 ?auto_190852 ) ) ( not ( = ?auto_190847 ?auto_190849 ) ) ( not ( = ?auto_190847 ?auto_190853 ) ) ( not ( = ?auto_190848 ?auto_190849 ) ) ( not ( = ?auto_190848 ?auto_190853 ) ) ( not ( = ?auto_190852 ?auto_190849 ) ) ( not ( = ?auto_190852 ?auto_190853 ) ) ( not ( = ?auto_190849 ?auto_190853 ) ) ( ON ?auto_190849 ?auto_190852 ) ( not ( = ?auto_190851 ?auto_190850 ) ) ( not ( = ?auto_190851 ?auto_190855 ) ) ( not ( = ?auto_190851 ?auto_190853 ) ) ( not ( = ?auto_190850 ?auto_190855 ) ) ( not ( = ?auto_190850 ?auto_190853 ) ) ( not ( = ?auto_190855 ?auto_190853 ) ) ( not ( = ?auto_190847 ?auto_190855 ) ) ( not ( = ?auto_190847 ?auto_190851 ) ) ( not ( = ?auto_190847 ?auto_190850 ) ) ( not ( = ?auto_190848 ?auto_190855 ) ) ( not ( = ?auto_190848 ?auto_190851 ) ) ( not ( = ?auto_190848 ?auto_190850 ) ) ( not ( = ?auto_190852 ?auto_190855 ) ) ( not ( = ?auto_190852 ?auto_190851 ) ) ( not ( = ?auto_190852 ?auto_190850 ) ) ( not ( = ?auto_190849 ?auto_190855 ) ) ( not ( = ?auto_190849 ?auto_190851 ) ) ( not ( = ?auto_190849 ?auto_190850 ) ) ( ON ?auto_190853 ?auto_190849 ) ( ON ?auto_190851 ?auto_190854 ) ( not ( = ?auto_190847 ?auto_190854 ) ) ( not ( = ?auto_190848 ?auto_190854 ) ) ( not ( = ?auto_190852 ?auto_190854 ) ) ( not ( = ?auto_190849 ?auto_190854 ) ) ( not ( = ?auto_190853 ?auto_190854 ) ) ( not ( = ?auto_190851 ?auto_190854 ) ) ( not ( = ?auto_190850 ?auto_190854 ) ) ( not ( = ?auto_190855 ?auto_190854 ) ) ( ON ?auto_190850 ?auto_190851 ) ( CLEAR ?auto_190850 ) ( ON-TABLE ?auto_190854 ) ( HOLDING ?auto_190855 ) ( CLEAR ?auto_190853 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190847 ?auto_190848 ?auto_190852 ?auto_190849 ?auto_190853 ?auto_190855 )
      ( MAKE-2PILE ?auto_190847 ?auto_190848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190856 - BLOCK
      ?auto_190857 - BLOCK
    )
    :vars
    (
      ?auto_190859 - BLOCK
      ?auto_190863 - BLOCK
      ?auto_190860 - BLOCK
      ?auto_190864 - BLOCK
      ?auto_190858 - BLOCK
      ?auto_190862 - BLOCK
      ?auto_190861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190859 ?auto_190857 ) ( ON-TABLE ?auto_190856 ) ( ON ?auto_190857 ?auto_190856 ) ( not ( = ?auto_190856 ?auto_190857 ) ) ( not ( = ?auto_190856 ?auto_190859 ) ) ( not ( = ?auto_190857 ?auto_190859 ) ) ( not ( = ?auto_190856 ?auto_190863 ) ) ( not ( = ?auto_190856 ?auto_190860 ) ) ( not ( = ?auto_190857 ?auto_190863 ) ) ( not ( = ?auto_190857 ?auto_190860 ) ) ( not ( = ?auto_190859 ?auto_190863 ) ) ( not ( = ?auto_190859 ?auto_190860 ) ) ( not ( = ?auto_190863 ?auto_190860 ) ) ( ON ?auto_190863 ?auto_190859 ) ( not ( = ?auto_190864 ?auto_190858 ) ) ( not ( = ?auto_190864 ?auto_190862 ) ) ( not ( = ?auto_190864 ?auto_190860 ) ) ( not ( = ?auto_190858 ?auto_190862 ) ) ( not ( = ?auto_190858 ?auto_190860 ) ) ( not ( = ?auto_190862 ?auto_190860 ) ) ( not ( = ?auto_190856 ?auto_190862 ) ) ( not ( = ?auto_190856 ?auto_190864 ) ) ( not ( = ?auto_190856 ?auto_190858 ) ) ( not ( = ?auto_190857 ?auto_190862 ) ) ( not ( = ?auto_190857 ?auto_190864 ) ) ( not ( = ?auto_190857 ?auto_190858 ) ) ( not ( = ?auto_190859 ?auto_190862 ) ) ( not ( = ?auto_190859 ?auto_190864 ) ) ( not ( = ?auto_190859 ?auto_190858 ) ) ( not ( = ?auto_190863 ?auto_190862 ) ) ( not ( = ?auto_190863 ?auto_190864 ) ) ( not ( = ?auto_190863 ?auto_190858 ) ) ( ON ?auto_190860 ?auto_190863 ) ( ON ?auto_190864 ?auto_190861 ) ( not ( = ?auto_190856 ?auto_190861 ) ) ( not ( = ?auto_190857 ?auto_190861 ) ) ( not ( = ?auto_190859 ?auto_190861 ) ) ( not ( = ?auto_190863 ?auto_190861 ) ) ( not ( = ?auto_190860 ?auto_190861 ) ) ( not ( = ?auto_190864 ?auto_190861 ) ) ( not ( = ?auto_190858 ?auto_190861 ) ) ( not ( = ?auto_190862 ?auto_190861 ) ) ( ON ?auto_190858 ?auto_190864 ) ( ON-TABLE ?auto_190861 ) ( CLEAR ?auto_190860 ) ( ON ?auto_190862 ?auto_190858 ) ( CLEAR ?auto_190862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190861 ?auto_190864 ?auto_190858 )
      ( MAKE-2PILE ?auto_190856 ?auto_190857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190865 - BLOCK
      ?auto_190866 - BLOCK
    )
    :vars
    (
      ?auto_190869 - BLOCK
      ?auto_190870 - BLOCK
      ?auto_190871 - BLOCK
      ?auto_190873 - BLOCK
      ?auto_190868 - BLOCK
      ?auto_190872 - BLOCK
      ?auto_190867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190869 ?auto_190866 ) ( ON-TABLE ?auto_190865 ) ( ON ?auto_190866 ?auto_190865 ) ( not ( = ?auto_190865 ?auto_190866 ) ) ( not ( = ?auto_190865 ?auto_190869 ) ) ( not ( = ?auto_190866 ?auto_190869 ) ) ( not ( = ?auto_190865 ?auto_190870 ) ) ( not ( = ?auto_190865 ?auto_190871 ) ) ( not ( = ?auto_190866 ?auto_190870 ) ) ( not ( = ?auto_190866 ?auto_190871 ) ) ( not ( = ?auto_190869 ?auto_190870 ) ) ( not ( = ?auto_190869 ?auto_190871 ) ) ( not ( = ?auto_190870 ?auto_190871 ) ) ( ON ?auto_190870 ?auto_190869 ) ( not ( = ?auto_190873 ?auto_190868 ) ) ( not ( = ?auto_190873 ?auto_190872 ) ) ( not ( = ?auto_190873 ?auto_190871 ) ) ( not ( = ?auto_190868 ?auto_190872 ) ) ( not ( = ?auto_190868 ?auto_190871 ) ) ( not ( = ?auto_190872 ?auto_190871 ) ) ( not ( = ?auto_190865 ?auto_190872 ) ) ( not ( = ?auto_190865 ?auto_190873 ) ) ( not ( = ?auto_190865 ?auto_190868 ) ) ( not ( = ?auto_190866 ?auto_190872 ) ) ( not ( = ?auto_190866 ?auto_190873 ) ) ( not ( = ?auto_190866 ?auto_190868 ) ) ( not ( = ?auto_190869 ?auto_190872 ) ) ( not ( = ?auto_190869 ?auto_190873 ) ) ( not ( = ?auto_190869 ?auto_190868 ) ) ( not ( = ?auto_190870 ?auto_190872 ) ) ( not ( = ?auto_190870 ?auto_190873 ) ) ( not ( = ?auto_190870 ?auto_190868 ) ) ( ON ?auto_190873 ?auto_190867 ) ( not ( = ?auto_190865 ?auto_190867 ) ) ( not ( = ?auto_190866 ?auto_190867 ) ) ( not ( = ?auto_190869 ?auto_190867 ) ) ( not ( = ?auto_190870 ?auto_190867 ) ) ( not ( = ?auto_190871 ?auto_190867 ) ) ( not ( = ?auto_190873 ?auto_190867 ) ) ( not ( = ?auto_190868 ?auto_190867 ) ) ( not ( = ?auto_190872 ?auto_190867 ) ) ( ON ?auto_190868 ?auto_190873 ) ( ON-TABLE ?auto_190867 ) ( ON ?auto_190872 ?auto_190868 ) ( CLEAR ?auto_190872 ) ( HOLDING ?auto_190871 ) ( CLEAR ?auto_190870 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190865 ?auto_190866 ?auto_190869 ?auto_190870 ?auto_190871 )
      ( MAKE-2PILE ?auto_190865 ?auto_190866 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190874 - BLOCK
      ?auto_190875 - BLOCK
    )
    :vars
    (
      ?auto_190878 - BLOCK
      ?auto_190876 - BLOCK
      ?auto_190881 - BLOCK
      ?auto_190880 - BLOCK
      ?auto_190882 - BLOCK
      ?auto_190877 - BLOCK
      ?auto_190879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190878 ?auto_190875 ) ( ON-TABLE ?auto_190874 ) ( ON ?auto_190875 ?auto_190874 ) ( not ( = ?auto_190874 ?auto_190875 ) ) ( not ( = ?auto_190874 ?auto_190878 ) ) ( not ( = ?auto_190875 ?auto_190878 ) ) ( not ( = ?auto_190874 ?auto_190876 ) ) ( not ( = ?auto_190874 ?auto_190881 ) ) ( not ( = ?auto_190875 ?auto_190876 ) ) ( not ( = ?auto_190875 ?auto_190881 ) ) ( not ( = ?auto_190878 ?auto_190876 ) ) ( not ( = ?auto_190878 ?auto_190881 ) ) ( not ( = ?auto_190876 ?auto_190881 ) ) ( ON ?auto_190876 ?auto_190878 ) ( not ( = ?auto_190880 ?auto_190882 ) ) ( not ( = ?auto_190880 ?auto_190877 ) ) ( not ( = ?auto_190880 ?auto_190881 ) ) ( not ( = ?auto_190882 ?auto_190877 ) ) ( not ( = ?auto_190882 ?auto_190881 ) ) ( not ( = ?auto_190877 ?auto_190881 ) ) ( not ( = ?auto_190874 ?auto_190877 ) ) ( not ( = ?auto_190874 ?auto_190880 ) ) ( not ( = ?auto_190874 ?auto_190882 ) ) ( not ( = ?auto_190875 ?auto_190877 ) ) ( not ( = ?auto_190875 ?auto_190880 ) ) ( not ( = ?auto_190875 ?auto_190882 ) ) ( not ( = ?auto_190878 ?auto_190877 ) ) ( not ( = ?auto_190878 ?auto_190880 ) ) ( not ( = ?auto_190878 ?auto_190882 ) ) ( not ( = ?auto_190876 ?auto_190877 ) ) ( not ( = ?auto_190876 ?auto_190880 ) ) ( not ( = ?auto_190876 ?auto_190882 ) ) ( ON ?auto_190880 ?auto_190879 ) ( not ( = ?auto_190874 ?auto_190879 ) ) ( not ( = ?auto_190875 ?auto_190879 ) ) ( not ( = ?auto_190878 ?auto_190879 ) ) ( not ( = ?auto_190876 ?auto_190879 ) ) ( not ( = ?auto_190881 ?auto_190879 ) ) ( not ( = ?auto_190880 ?auto_190879 ) ) ( not ( = ?auto_190882 ?auto_190879 ) ) ( not ( = ?auto_190877 ?auto_190879 ) ) ( ON ?auto_190882 ?auto_190880 ) ( ON-TABLE ?auto_190879 ) ( ON ?auto_190877 ?auto_190882 ) ( CLEAR ?auto_190876 ) ( ON ?auto_190881 ?auto_190877 ) ( CLEAR ?auto_190881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190879 ?auto_190880 ?auto_190882 ?auto_190877 )
      ( MAKE-2PILE ?auto_190874 ?auto_190875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190883 - BLOCK
      ?auto_190884 - BLOCK
    )
    :vars
    (
      ?auto_190889 - BLOCK
      ?auto_190891 - BLOCK
      ?auto_190886 - BLOCK
      ?auto_190885 - BLOCK
      ?auto_190890 - BLOCK
      ?auto_190888 - BLOCK
      ?auto_190887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190889 ?auto_190884 ) ( ON-TABLE ?auto_190883 ) ( ON ?auto_190884 ?auto_190883 ) ( not ( = ?auto_190883 ?auto_190884 ) ) ( not ( = ?auto_190883 ?auto_190889 ) ) ( not ( = ?auto_190884 ?auto_190889 ) ) ( not ( = ?auto_190883 ?auto_190891 ) ) ( not ( = ?auto_190883 ?auto_190886 ) ) ( not ( = ?auto_190884 ?auto_190891 ) ) ( not ( = ?auto_190884 ?auto_190886 ) ) ( not ( = ?auto_190889 ?auto_190891 ) ) ( not ( = ?auto_190889 ?auto_190886 ) ) ( not ( = ?auto_190891 ?auto_190886 ) ) ( not ( = ?auto_190885 ?auto_190890 ) ) ( not ( = ?auto_190885 ?auto_190888 ) ) ( not ( = ?auto_190885 ?auto_190886 ) ) ( not ( = ?auto_190890 ?auto_190888 ) ) ( not ( = ?auto_190890 ?auto_190886 ) ) ( not ( = ?auto_190888 ?auto_190886 ) ) ( not ( = ?auto_190883 ?auto_190888 ) ) ( not ( = ?auto_190883 ?auto_190885 ) ) ( not ( = ?auto_190883 ?auto_190890 ) ) ( not ( = ?auto_190884 ?auto_190888 ) ) ( not ( = ?auto_190884 ?auto_190885 ) ) ( not ( = ?auto_190884 ?auto_190890 ) ) ( not ( = ?auto_190889 ?auto_190888 ) ) ( not ( = ?auto_190889 ?auto_190885 ) ) ( not ( = ?auto_190889 ?auto_190890 ) ) ( not ( = ?auto_190891 ?auto_190888 ) ) ( not ( = ?auto_190891 ?auto_190885 ) ) ( not ( = ?auto_190891 ?auto_190890 ) ) ( ON ?auto_190885 ?auto_190887 ) ( not ( = ?auto_190883 ?auto_190887 ) ) ( not ( = ?auto_190884 ?auto_190887 ) ) ( not ( = ?auto_190889 ?auto_190887 ) ) ( not ( = ?auto_190891 ?auto_190887 ) ) ( not ( = ?auto_190886 ?auto_190887 ) ) ( not ( = ?auto_190885 ?auto_190887 ) ) ( not ( = ?auto_190890 ?auto_190887 ) ) ( not ( = ?auto_190888 ?auto_190887 ) ) ( ON ?auto_190890 ?auto_190885 ) ( ON-TABLE ?auto_190887 ) ( ON ?auto_190888 ?auto_190890 ) ( ON ?auto_190886 ?auto_190888 ) ( CLEAR ?auto_190886 ) ( HOLDING ?auto_190891 ) ( CLEAR ?auto_190889 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190883 ?auto_190884 ?auto_190889 ?auto_190891 )
      ( MAKE-2PILE ?auto_190883 ?auto_190884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190892 - BLOCK
      ?auto_190893 - BLOCK
    )
    :vars
    (
      ?auto_190900 - BLOCK
      ?auto_190894 - BLOCK
      ?auto_190899 - BLOCK
      ?auto_190898 - BLOCK
      ?auto_190896 - BLOCK
      ?auto_190895 - BLOCK
      ?auto_190897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190900 ?auto_190893 ) ( ON-TABLE ?auto_190892 ) ( ON ?auto_190893 ?auto_190892 ) ( not ( = ?auto_190892 ?auto_190893 ) ) ( not ( = ?auto_190892 ?auto_190900 ) ) ( not ( = ?auto_190893 ?auto_190900 ) ) ( not ( = ?auto_190892 ?auto_190894 ) ) ( not ( = ?auto_190892 ?auto_190899 ) ) ( not ( = ?auto_190893 ?auto_190894 ) ) ( not ( = ?auto_190893 ?auto_190899 ) ) ( not ( = ?auto_190900 ?auto_190894 ) ) ( not ( = ?auto_190900 ?auto_190899 ) ) ( not ( = ?auto_190894 ?auto_190899 ) ) ( not ( = ?auto_190898 ?auto_190896 ) ) ( not ( = ?auto_190898 ?auto_190895 ) ) ( not ( = ?auto_190898 ?auto_190899 ) ) ( not ( = ?auto_190896 ?auto_190895 ) ) ( not ( = ?auto_190896 ?auto_190899 ) ) ( not ( = ?auto_190895 ?auto_190899 ) ) ( not ( = ?auto_190892 ?auto_190895 ) ) ( not ( = ?auto_190892 ?auto_190898 ) ) ( not ( = ?auto_190892 ?auto_190896 ) ) ( not ( = ?auto_190893 ?auto_190895 ) ) ( not ( = ?auto_190893 ?auto_190898 ) ) ( not ( = ?auto_190893 ?auto_190896 ) ) ( not ( = ?auto_190900 ?auto_190895 ) ) ( not ( = ?auto_190900 ?auto_190898 ) ) ( not ( = ?auto_190900 ?auto_190896 ) ) ( not ( = ?auto_190894 ?auto_190895 ) ) ( not ( = ?auto_190894 ?auto_190898 ) ) ( not ( = ?auto_190894 ?auto_190896 ) ) ( ON ?auto_190898 ?auto_190897 ) ( not ( = ?auto_190892 ?auto_190897 ) ) ( not ( = ?auto_190893 ?auto_190897 ) ) ( not ( = ?auto_190900 ?auto_190897 ) ) ( not ( = ?auto_190894 ?auto_190897 ) ) ( not ( = ?auto_190899 ?auto_190897 ) ) ( not ( = ?auto_190898 ?auto_190897 ) ) ( not ( = ?auto_190896 ?auto_190897 ) ) ( not ( = ?auto_190895 ?auto_190897 ) ) ( ON ?auto_190896 ?auto_190898 ) ( ON-TABLE ?auto_190897 ) ( ON ?auto_190895 ?auto_190896 ) ( ON ?auto_190899 ?auto_190895 ) ( CLEAR ?auto_190900 ) ( ON ?auto_190894 ?auto_190899 ) ( CLEAR ?auto_190894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190897 ?auto_190898 ?auto_190896 ?auto_190895 ?auto_190899 )
      ( MAKE-2PILE ?auto_190892 ?auto_190893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190919 - BLOCK
      ?auto_190920 - BLOCK
    )
    :vars
    (
      ?auto_190926 - BLOCK
      ?auto_190925 - BLOCK
      ?auto_190923 - BLOCK
      ?auto_190927 - BLOCK
      ?auto_190924 - BLOCK
      ?auto_190921 - BLOCK
      ?auto_190922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190919 ) ( not ( = ?auto_190919 ?auto_190920 ) ) ( not ( = ?auto_190919 ?auto_190926 ) ) ( not ( = ?auto_190920 ?auto_190926 ) ) ( not ( = ?auto_190919 ?auto_190925 ) ) ( not ( = ?auto_190919 ?auto_190923 ) ) ( not ( = ?auto_190920 ?auto_190925 ) ) ( not ( = ?auto_190920 ?auto_190923 ) ) ( not ( = ?auto_190926 ?auto_190925 ) ) ( not ( = ?auto_190926 ?auto_190923 ) ) ( not ( = ?auto_190925 ?auto_190923 ) ) ( not ( = ?auto_190927 ?auto_190924 ) ) ( not ( = ?auto_190927 ?auto_190921 ) ) ( not ( = ?auto_190927 ?auto_190923 ) ) ( not ( = ?auto_190924 ?auto_190921 ) ) ( not ( = ?auto_190924 ?auto_190923 ) ) ( not ( = ?auto_190921 ?auto_190923 ) ) ( not ( = ?auto_190919 ?auto_190921 ) ) ( not ( = ?auto_190919 ?auto_190927 ) ) ( not ( = ?auto_190919 ?auto_190924 ) ) ( not ( = ?auto_190920 ?auto_190921 ) ) ( not ( = ?auto_190920 ?auto_190927 ) ) ( not ( = ?auto_190920 ?auto_190924 ) ) ( not ( = ?auto_190926 ?auto_190921 ) ) ( not ( = ?auto_190926 ?auto_190927 ) ) ( not ( = ?auto_190926 ?auto_190924 ) ) ( not ( = ?auto_190925 ?auto_190921 ) ) ( not ( = ?auto_190925 ?auto_190927 ) ) ( not ( = ?auto_190925 ?auto_190924 ) ) ( ON ?auto_190927 ?auto_190922 ) ( not ( = ?auto_190919 ?auto_190922 ) ) ( not ( = ?auto_190920 ?auto_190922 ) ) ( not ( = ?auto_190926 ?auto_190922 ) ) ( not ( = ?auto_190925 ?auto_190922 ) ) ( not ( = ?auto_190923 ?auto_190922 ) ) ( not ( = ?auto_190927 ?auto_190922 ) ) ( not ( = ?auto_190924 ?auto_190922 ) ) ( not ( = ?auto_190921 ?auto_190922 ) ) ( ON ?auto_190924 ?auto_190927 ) ( ON-TABLE ?auto_190922 ) ( ON ?auto_190921 ?auto_190924 ) ( ON ?auto_190923 ?auto_190921 ) ( ON ?auto_190925 ?auto_190923 ) ( ON ?auto_190926 ?auto_190925 ) ( CLEAR ?auto_190926 ) ( HOLDING ?auto_190920 ) ( CLEAR ?auto_190919 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190919 ?auto_190920 ?auto_190926 )
      ( MAKE-2PILE ?auto_190919 ?auto_190920 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190928 - BLOCK
      ?auto_190929 - BLOCK
    )
    :vars
    (
      ?auto_190936 - BLOCK
      ?auto_190935 - BLOCK
      ?auto_190933 - BLOCK
      ?auto_190932 - BLOCK
      ?auto_190934 - BLOCK
      ?auto_190931 - BLOCK
      ?auto_190930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190928 ) ( not ( = ?auto_190928 ?auto_190929 ) ) ( not ( = ?auto_190928 ?auto_190936 ) ) ( not ( = ?auto_190929 ?auto_190936 ) ) ( not ( = ?auto_190928 ?auto_190935 ) ) ( not ( = ?auto_190928 ?auto_190933 ) ) ( not ( = ?auto_190929 ?auto_190935 ) ) ( not ( = ?auto_190929 ?auto_190933 ) ) ( not ( = ?auto_190936 ?auto_190935 ) ) ( not ( = ?auto_190936 ?auto_190933 ) ) ( not ( = ?auto_190935 ?auto_190933 ) ) ( not ( = ?auto_190932 ?auto_190934 ) ) ( not ( = ?auto_190932 ?auto_190931 ) ) ( not ( = ?auto_190932 ?auto_190933 ) ) ( not ( = ?auto_190934 ?auto_190931 ) ) ( not ( = ?auto_190934 ?auto_190933 ) ) ( not ( = ?auto_190931 ?auto_190933 ) ) ( not ( = ?auto_190928 ?auto_190931 ) ) ( not ( = ?auto_190928 ?auto_190932 ) ) ( not ( = ?auto_190928 ?auto_190934 ) ) ( not ( = ?auto_190929 ?auto_190931 ) ) ( not ( = ?auto_190929 ?auto_190932 ) ) ( not ( = ?auto_190929 ?auto_190934 ) ) ( not ( = ?auto_190936 ?auto_190931 ) ) ( not ( = ?auto_190936 ?auto_190932 ) ) ( not ( = ?auto_190936 ?auto_190934 ) ) ( not ( = ?auto_190935 ?auto_190931 ) ) ( not ( = ?auto_190935 ?auto_190932 ) ) ( not ( = ?auto_190935 ?auto_190934 ) ) ( ON ?auto_190932 ?auto_190930 ) ( not ( = ?auto_190928 ?auto_190930 ) ) ( not ( = ?auto_190929 ?auto_190930 ) ) ( not ( = ?auto_190936 ?auto_190930 ) ) ( not ( = ?auto_190935 ?auto_190930 ) ) ( not ( = ?auto_190933 ?auto_190930 ) ) ( not ( = ?auto_190932 ?auto_190930 ) ) ( not ( = ?auto_190934 ?auto_190930 ) ) ( not ( = ?auto_190931 ?auto_190930 ) ) ( ON ?auto_190934 ?auto_190932 ) ( ON-TABLE ?auto_190930 ) ( ON ?auto_190931 ?auto_190934 ) ( ON ?auto_190933 ?auto_190931 ) ( ON ?auto_190935 ?auto_190933 ) ( ON ?auto_190936 ?auto_190935 ) ( CLEAR ?auto_190928 ) ( ON ?auto_190929 ?auto_190936 ) ( CLEAR ?auto_190929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190930 ?auto_190932 ?auto_190934 ?auto_190931 ?auto_190933 ?auto_190935 ?auto_190936 )
      ( MAKE-2PILE ?auto_190928 ?auto_190929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190937 - BLOCK
      ?auto_190938 - BLOCK
    )
    :vars
    (
      ?auto_190942 - BLOCK
      ?auto_190945 - BLOCK
      ?auto_190944 - BLOCK
      ?auto_190943 - BLOCK
      ?auto_190940 - BLOCK
      ?auto_190941 - BLOCK
      ?auto_190939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190937 ?auto_190938 ) ) ( not ( = ?auto_190937 ?auto_190942 ) ) ( not ( = ?auto_190938 ?auto_190942 ) ) ( not ( = ?auto_190937 ?auto_190945 ) ) ( not ( = ?auto_190937 ?auto_190944 ) ) ( not ( = ?auto_190938 ?auto_190945 ) ) ( not ( = ?auto_190938 ?auto_190944 ) ) ( not ( = ?auto_190942 ?auto_190945 ) ) ( not ( = ?auto_190942 ?auto_190944 ) ) ( not ( = ?auto_190945 ?auto_190944 ) ) ( not ( = ?auto_190943 ?auto_190940 ) ) ( not ( = ?auto_190943 ?auto_190941 ) ) ( not ( = ?auto_190943 ?auto_190944 ) ) ( not ( = ?auto_190940 ?auto_190941 ) ) ( not ( = ?auto_190940 ?auto_190944 ) ) ( not ( = ?auto_190941 ?auto_190944 ) ) ( not ( = ?auto_190937 ?auto_190941 ) ) ( not ( = ?auto_190937 ?auto_190943 ) ) ( not ( = ?auto_190937 ?auto_190940 ) ) ( not ( = ?auto_190938 ?auto_190941 ) ) ( not ( = ?auto_190938 ?auto_190943 ) ) ( not ( = ?auto_190938 ?auto_190940 ) ) ( not ( = ?auto_190942 ?auto_190941 ) ) ( not ( = ?auto_190942 ?auto_190943 ) ) ( not ( = ?auto_190942 ?auto_190940 ) ) ( not ( = ?auto_190945 ?auto_190941 ) ) ( not ( = ?auto_190945 ?auto_190943 ) ) ( not ( = ?auto_190945 ?auto_190940 ) ) ( ON ?auto_190943 ?auto_190939 ) ( not ( = ?auto_190937 ?auto_190939 ) ) ( not ( = ?auto_190938 ?auto_190939 ) ) ( not ( = ?auto_190942 ?auto_190939 ) ) ( not ( = ?auto_190945 ?auto_190939 ) ) ( not ( = ?auto_190944 ?auto_190939 ) ) ( not ( = ?auto_190943 ?auto_190939 ) ) ( not ( = ?auto_190940 ?auto_190939 ) ) ( not ( = ?auto_190941 ?auto_190939 ) ) ( ON ?auto_190940 ?auto_190943 ) ( ON-TABLE ?auto_190939 ) ( ON ?auto_190941 ?auto_190940 ) ( ON ?auto_190944 ?auto_190941 ) ( ON ?auto_190945 ?auto_190944 ) ( ON ?auto_190942 ?auto_190945 ) ( ON ?auto_190938 ?auto_190942 ) ( CLEAR ?auto_190938 ) ( HOLDING ?auto_190937 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190937 )
      ( MAKE-2PILE ?auto_190937 ?auto_190938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190946 - BLOCK
      ?auto_190947 - BLOCK
    )
    :vars
    (
      ?auto_190953 - BLOCK
      ?auto_190952 - BLOCK
      ?auto_190950 - BLOCK
      ?auto_190948 - BLOCK
      ?auto_190954 - BLOCK
      ?auto_190949 - BLOCK
      ?auto_190951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190946 ?auto_190947 ) ) ( not ( = ?auto_190946 ?auto_190953 ) ) ( not ( = ?auto_190947 ?auto_190953 ) ) ( not ( = ?auto_190946 ?auto_190952 ) ) ( not ( = ?auto_190946 ?auto_190950 ) ) ( not ( = ?auto_190947 ?auto_190952 ) ) ( not ( = ?auto_190947 ?auto_190950 ) ) ( not ( = ?auto_190953 ?auto_190952 ) ) ( not ( = ?auto_190953 ?auto_190950 ) ) ( not ( = ?auto_190952 ?auto_190950 ) ) ( not ( = ?auto_190948 ?auto_190954 ) ) ( not ( = ?auto_190948 ?auto_190949 ) ) ( not ( = ?auto_190948 ?auto_190950 ) ) ( not ( = ?auto_190954 ?auto_190949 ) ) ( not ( = ?auto_190954 ?auto_190950 ) ) ( not ( = ?auto_190949 ?auto_190950 ) ) ( not ( = ?auto_190946 ?auto_190949 ) ) ( not ( = ?auto_190946 ?auto_190948 ) ) ( not ( = ?auto_190946 ?auto_190954 ) ) ( not ( = ?auto_190947 ?auto_190949 ) ) ( not ( = ?auto_190947 ?auto_190948 ) ) ( not ( = ?auto_190947 ?auto_190954 ) ) ( not ( = ?auto_190953 ?auto_190949 ) ) ( not ( = ?auto_190953 ?auto_190948 ) ) ( not ( = ?auto_190953 ?auto_190954 ) ) ( not ( = ?auto_190952 ?auto_190949 ) ) ( not ( = ?auto_190952 ?auto_190948 ) ) ( not ( = ?auto_190952 ?auto_190954 ) ) ( ON ?auto_190948 ?auto_190951 ) ( not ( = ?auto_190946 ?auto_190951 ) ) ( not ( = ?auto_190947 ?auto_190951 ) ) ( not ( = ?auto_190953 ?auto_190951 ) ) ( not ( = ?auto_190952 ?auto_190951 ) ) ( not ( = ?auto_190950 ?auto_190951 ) ) ( not ( = ?auto_190948 ?auto_190951 ) ) ( not ( = ?auto_190954 ?auto_190951 ) ) ( not ( = ?auto_190949 ?auto_190951 ) ) ( ON ?auto_190954 ?auto_190948 ) ( ON-TABLE ?auto_190951 ) ( ON ?auto_190949 ?auto_190954 ) ( ON ?auto_190950 ?auto_190949 ) ( ON ?auto_190952 ?auto_190950 ) ( ON ?auto_190953 ?auto_190952 ) ( ON ?auto_190947 ?auto_190953 ) ( ON ?auto_190946 ?auto_190947 ) ( CLEAR ?auto_190946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190951 ?auto_190948 ?auto_190954 ?auto_190949 ?auto_190950 ?auto_190952 ?auto_190953 ?auto_190947 )
      ( MAKE-2PILE ?auto_190946 ?auto_190947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_190961 - BLOCK
      ?auto_190962 - BLOCK
      ?auto_190963 - BLOCK
      ?auto_190964 - BLOCK
      ?auto_190965 - BLOCK
      ?auto_190966 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_190966 ) ( CLEAR ?auto_190965 ) ( ON-TABLE ?auto_190961 ) ( ON ?auto_190962 ?auto_190961 ) ( ON ?auto_190963 ?auto_190962 ) ( ON ?auto_190964 ?auto_190963 ) ( ON ?auto_190965 ?auto_190964 ) ( not ( = ?auto_190961 ?auto_190962 ) ) ( not ( = ?auto_190961 ?auto_190963 ) ) ( not ( = ?auto_190961 ?auto_190964 ) ) ( not ( = ?auto_190961 ?auto_190965 ) ) ( not ( = ?auto_190961 ?auto_190966 ) ) ( not ( = ?auto_190962 ?auto_190963 ) ) ( not ( = ?auto_190962 ?auto_190964 ) ) ( not ( = ?auto_190962 ?auto_190965 ) ) ( not ( = ?auto_190962 ?auto_190966 ) ) ( not ( = ?auto_190963 ?auto_190964 ) ) ( not ( = ?auto_190963 ?auto_190965 ) ) ( not ( = ?auto_190963 ?auto_190966 ) ) ( not ( = ?auto_190964 ?auto_190965 ) ) ( not ( = ?auto_190964 ?auto_190966 ) ) ( not ( = ?auto_190965 ?auto_190966 ) ) )
    :subtasks
    ( ( !STACK ?auto_190966 ?auto_190965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_190967 - BLOCK
      ?auto_190968 - BLOCK
      ?auto_190969 - BLOCK
      ?auto_190970 - BLOCK
      ?auto_190971 - BLOCK
      ?auto_190972 - BLOCK
    )
    :vars
    (
      ?auto_190973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_190971 ) ( ON-TABLE ?auto_190967 ) ( ON ?auto_190968 ?auto_190967 ) ( ON ?auto_190969 ?auto_190968 ) ( ON ?auto_190970 ?auto_190969 ) ( ON ?auto_190971 ?auto_190970 ) ( not ( = ?auto_190967 ?auto_190968 ) ) ( not ( = ?auto_190967 ?auto_190969 ) ) ( not ( = ?auto_190967 ?auto_190970 ) ) ( not ( = ?auto_190967 ?auto_190971 ) ) ( not ( = ?auto_190967 ?auto_190972 ) ) ( not ( = ?auto_190968 ?auto_190969 ) ) ( not ( = ?auto_190968 ?auto_190970 ) ) ( not ( = ?auto_190968 ?auto_190971 ) ) ( not ( = ?auto_190968 ?auto_190972 ) ) ( not ( = ?auto_190969 ?auto_190970 ) ) ( not ( = ?auto_190969 ?auto_190971 ) ) ( not ( = ?auto_190969 ?auto_190972 ) ) ( not ( = ?auto_190970 ?auto_190971 ) ) ( not ( = ?auto_190970 ?auto_190972 ) ) ( not ( = ?auto_190971 ?auto_190972 ) ) ( ON ?auto_190972 ?auto_190973 ) ( CLEAR ?auto_190972 ) ( HAND-EMPTY ) ( not ( = ?auto_190967 ?auto_190973 ) ) ( not ( = ?auto_190968 ?auto_190973 ) ) ( not ( = ?auto_190969 ?auto_190973 ) ) ( not ( = ?auto_190970 ?auto_190973 ) ) ( not ( = ?auto_190971 ?auto_190973 ) ) ( not ( = ?auto_190972 ?auto_190973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190972 ?auto_190973 )
      ( MAKE-6PILE ?auto_190967 ?auto_190968 ?auto_190969 ?auto_190970 ?auto_190971 ?auto_190972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_190974 - BLOCK
      ?auto_190975 - BLOCK
      ?auto_190976 - BLOCK
      ?auto_190977 - BLOCK
      ?auto_190978 - BLOCK
      ?auto_190979 - BLOCK
    )
    :vars
    (
      ?auto_190980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190974 ) ( ON ?auto_190975 ?auto_190974 ) ( ON ?auto_190976 ?auto_190975 ) ( ON ?auto_190977 ?auto_190976 ) ( not ( = ?auto_190974 ?auto_190975 ) ) ( not ( = ?auto_190974 ?auto_190976 ) ) ( not ( = ?auto_190974 ?auto_190977 ) ) ( not ( = ?auto_190974 ?auto_190978 ) ) ( not ( = ?auto_190974 ?auto_190979 ) ) ( not ( = ?auto_190975 ?auto_190976 ) ) ( not ( = ?auto_190975 ?auto_190977 ) ) ( not ( = ?auto_190975 ?auto_190978 ) ) ( not ( = ?auto_190975 ?auto_190979 ) ) ( not ( = ?auto_190976 ?auto_190977 ) ) ( not ( = ?auto_190976 ?auto_190978 ) ) ( not ( = ?auto_190976 ?auto_190979 ) ) ( not ( = ?auto_190977 ?auto_190978 ) ) ( not ( = ?auto_190977 ?auto_190979 ) ) ( not ( = ?auto_190978 ?auto_190979 ) ) ( ON ?auto_190979 ?auto_190980 ) ( CLEAR ?auto_190979 ) ( not ( = ?auto_190974 ?auto_190980 ) ) ( not ( = ?auto_190975 ?auto_190980 ) ) ( not ( = ?auto_190976 ?auto_190980 ) ) ( not ( = ?auto_190977 ?auto_190980 ) ) ( not ( = ?auto_190978 ?auto_190980 ) ) ( not ( = ?auto_190979 ?auto_190980 ) ) ( HOLDING ?auto_190978 ) ( CLEAR ?auto_190977 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190974 ?auto_190975 ?auto_190976 ?auto_190977 ?auto_190978 )
      ( MAKE-6PILE ?auto_190974 ?auto_190975 ?auto_190976 ?auto_190977 ?auto_190978 ?auto_190979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_190981 - BLOCK
      ?auto_190982 - BLOCK
      ?auto_190983 - BLOCK
      ?auto_190984 - BLOCK
      ?auto_190985 - BLOCK
      ?auto_190986 - BLOCK
    )
    :vars
    (
      ?auto_190987 - BLOCK
      ?auto_190988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190981 ) ( ON ?auto_190982 ?auto_190981 ) ( ON ?auto_190983 ?auto_190982 ) ( ON ?auto_190984 ?auto_190983 ) ( not ( = ?auto_190981 ?auto_190982 ) ) ( not ( = ?auto_190981 ?auto_190983 ) ) ( not ( = ?auto_190981 ?auto_190984 ) ) ( not ( = ?auto_190981 ?auto_190985 ) ) ( not ( = ?auto_190981 ?auto_190986 ) ) ( not ( = ?auto_190982 ?auto_190983 ) ) ( not ( = ?auto_190982 ?auto_190984 ) ) ( not ( = ?auto_190982 ?auto_190985 ) ) ( not ( = ?auto_190982 ?auto_190986 ) ) ( not ( = ?auto_190983 ?auto_190984 ) ) ( not ( = ?auto_190983 ?auto_190985 ) ) ( not ( = ?auto_190983 ?auto_190986 ) ) ( not ( = ?auto_190984 ?auto_190985 ) ) ( not ( = ?auto_190984 ?auto_190986 ) ) ( not ( = ?auto_190985 ?auto_190986 ) ) ( ON ?auto_190986 ?auto_190987 ) ( not ( = ?auto_190981 ?auto_190987 ) ) ( not ( = ?auto_190982 ?auto_190987 ) ) ( not ( = ?auto_190983 ?auto_190987 ) ) ( not ( = ?auto_190984 ?auto_190987 ) ) ( not ( = ?auto_190985 ?auto_190987 ) ) ( not ( = ?auto_190986 ?auto_190987 ) ) ( CLEAR ?auto_190984 ) ( ON ?auto_190985 ?auto_190986 ) ( CLEAR ?auto_190985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190988 ) ( ON ?auto_190987 ?auto_190988 ) ( not ( = ?auto_190988 ?auto_190987 ) ) ( not ( = ?auto_190988 ?auto_190986 ) ) ( not ( = ?auto_190988 ?auto_190985 ) ) ( not ( = ?auto_190981 ?auto_190988 ) ) ( not ( = ?auto_190982 ?auto_190988 ) ) ( not ( = ?auto_190983 ?auto_190988 ) ) ( not ( = ?auto_190984 ?auto_190988 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190988 ?auto_190987 ?auto_190986 )
      ( MAKE-6PILE ?auto_190981 ?auto_190982 ?auto_190983 ?auto_190984 ?auto_190985 ?auto_190986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_190989 - BLOCK
      ?auto_190990 - BLOCK
      ?auto_190991 - BLOCK
      ?auto_190992 - BLOCK
      ?auto_190993 - BLOCK
      ?auto_190994 - BLOCK
    )
    :vars
    (
      ?auto_190995 - BLOCK
      ?auto_190996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190989 ) ( ON ?auto_190990 ?auto_190989 ) ( ON ?auto_190991 ?auto_190990 ) ( not ( = ?auto_190989 ?auto_190990 ) ) ( not ( = ?auto_190989 ?auto_190991 ) ) ( not ( = ?auto_190989 ?auto_190992 ) ) ( not ( = ?auto_190989 ?auto_190993 ) ) ( not ( = ?auto_190989 ?auto_190994 ) ) ( not ( = ?auto_190990 ?auto_190991 ) ) ( not ( = ?auto_190990 ?auto_190992 ) ) ( not ( = ?auto_190990 ?auto_190993 ) ) ( not ( = ?auto_190990 ?auto_190994 ) ) ( not ( = ?auto_190991 ?auto_190992 ) ) ( not ( = ?auto_190991 ?auto_190993 ) ) ( not ( = ?auto_190991 ?auto_190994 ) ) ( not ( = ?auto_190992 ?auto_190993 ) ) ( not ( = ?auto_190992 ?auto_190994 ) ) ( not ( = ?auto_190993 ?auto_190994 ) ) ( ON ?auto_190994 ?auto_190995 ) ( not ( = ?auto_190989 ?auto_190995 ) ) ( not ( = ?auto_190990 ?auto_190995 ) ) ( not ( = ?auto_190991 ?auto_190995 ) ) ( not ( = ?auto_190992 ?auto_190995 ) ) ( not ( = ?auto_190993 ?auto_190995 ) ) ( not ( = ?auto_190994 ?auto_190995 ) ) ( ON ?auto_190993 ?auto_190994 ) ( CLEAR ?auto_190993 ) ( ON-TABLE ?auto_190996 ) ( ON ?auto_190995 ?auto_190996 ) ( not ( = ?auto_190996 ?auto_190995 ) ) ( not ( = ?auto_190996 ?auto_190994 ) ) ( not ( = ?auto_190996 ?auto_190993 ) ) ( not ( = ?auto_190989 ?auto_190996 ) ) ( not ( = ?auto_190990 ?auto_190996 ) ) ( not ( = ?auto_190991 ?auto_190996 ) ) ( not ( = ?auto_190992 ?auto_190996 ) ) ( HOLDING ?auto_190992 ) ( CLEAR ?auto_190991 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190989 ?auto_190990 ?auto_190991 ?auto_190992 )
      ( MAKE-6PILE ?auto_190989 ?auto_190990 ?auto_190991 ?auto_190992 ?auto_190993 ?auto_190994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_190997 - BLOCK
      ?auto_190998 - BLOCK
      ?auto_190999 - BLOCK
      ?auto_191000 - BLOCK
      ?auto_191001 - BLOCK
      ?auto_191002 - BLOCK
    )
    :vars
    (
      ?auto_191003 - BLOCK
      ?auto_191004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_190997 ) ( ON ?auto_190998 ?auto_190997 ) ( ON ?auto_190999 ?auto_190998 ) ( not ( = ?auto_190997 ?auto_190998 ) ) ( not ( = ?auto_190997 ?auto_190999 ) ) ( not ( = ?auto_190997 ?auto_191000 ) ) ( not ( = ?auto_190997 ?auto_191001 ) ) ( not ( = ?auto_190997 ?auto_191002 ) ) ( not ( = ?auto_190998 ?auto_190999 ) ) ( not ( = ?auto_190998 ?auto_191000 ) ) ( not ( = ?auto_190998 ?auto_191001 ) ) ( not ( = ?auto_190998 ?auto_191002 ) ) ( not ( = ?auto_190999 ?auto_191000 ) ) ( not ( = ?auto_190999 ?auto_191001 ) ) ( not ( = ?auto_190999 ?auto_191002 ) ) ( not ( = ?auto_191000 ?auto_191001 ) ) ( not ( = ?auto_191000 ?auto_191002 ) ) ( not ( = ?auto_191001 ?auto_191002 ) ) ( ON ?auto_191002 ?auto_191003 ) ( not ( = ?auto_190997 ?auto_191003 ) ) ( not ( = ?auto_190998 ?auto_191003 ) ) ( not ( = ?auto_190999 ?auto_191003 ) ) ( not ( = ?auto_191000 ?auto_191003 ) ) ( not ( = ?auto_191001 ?auto_191003 ) ) ( not ( = ?auto_191002 ?auto_191003 ) ) ( ON ?auto_191001 ?auto_191002 ) ( ON-TABLE ?auto_191004 ) ( ON ?auto_191003 ?auto_191004 ) ( not ( = ?auto_191004 ?auto_191003 ) ) ( not ( = ?auto_191004 ?auto_191002 ) ) ( not ( = ?auto_191004 ?auto_191001 ) ) ( not ( = ?auto_190997 ?auto_191004 ) ) ( not ( = ?auto_190998 ?auto_191004 ) ) ( not ( = ?auto_190999 ?auto_191004 ) ) ( not ( = ?auto_191000 ?auto_191004 ) ) ( CLEAR ?auto_190999 ) ( ON ?auto_191000 ?auto_191001 ) ( CLEAR ?auto_191000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191004 ?auto_191003 ?auto_191002 ?auto_191001 )
      ( MAKE-6PILE ?auto_190997 ?auto_190998 ?auto_190999 ?auto_191000 ?auto_191001 ?auto_191002 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191005 - BLOCK
      ?auto_191006 - BLOCK
      ?auto_191007 - BLOCK
      ?auto_191008 - BLOCK
      ?auto_191009 - BLOCK
      ?auto_191010 - BLOCK
    )
    :vars
    (
      ?auto_191012 - BLOCK
      ?auto_191011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191005 ) ( ON ?auto_191006 ?auto_191005 ) ( not ( = ?auto_191005 ?auto_191006 ) ) ( not ( = ?auto_191005 ?auto_191007 ) ) ( not ( = ?auto_191005 ?auto_191008 ) ) ( not ( = ?auto_191005 ?auto_191009 ) ) ( not ( = ?auto_191005 ?auto_191010 ) ) ( not ( = ?auto_191006 ?auto_191007 ) ) ( not ( = ?auto_191006 ?auto_191008 ) ) ( not ( = ?auto_191006 ?auto_191009 ) ) ( not ( = ?auto_191006 ?auto_191010 ) ) ( not ( = ?auto_191007 ?auto_191008 ) ) ( not ( = ?auto_191007 ?auto_191009 ) ) ( not ( = ?auto_191007 ?auto_191010 ) ) ( not ( = ?auto_191008 ?auto_191009 ) ) ( not ( = ?auto_191008 ?auto_191010 ) ) ( not ( = ?auto_191009 ?auto_191010 ) ) ( ON ?auto_191010 ?auto_191012 ) ( not ( = ?auto_191005 ?auto_191012 ) ) ( not ( = ?auto_191006 ?auto_191012 ) ) ( not ( = ?auto_191007 ?auto_191012 ) ) ( not ( = ?auto_191008 ?auto_191012 ) ) ( not ( = ?auto_191009 ?auto_191012 ) ) ( not ( = ?auto_191010 ?auto_191012 ) ) ( ON ?auto_191009 ?auto_191010 ) ( ON-TABLE ?auto_191011 ) ( ON ?auto_191012 ?auto_191011 ) ( not ( = ?auto_191011 ?auto_191012 ) ) ( not ( = ?auto_191011 ?auto_191010 ) ) ( not ( = ?auto_191011 ?auto_191009 ) ) ( not ( = ?auto_191005 ?auto_191011 ) ) ( not ( = ?auto_191006 ?auto_191011 ) ) ( not ( = ?auto_191007 ?auto_191011 ) ) ( not ( = ?auto_191008 ?auto_191011 ) ) ( ON ?auto_191008 ?auto_191009 ) ( CLEAR ?auto_191008 ) ( HOLDING ?auto_191007 ) ( CLEAR ?auto_191006 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191005 ?auto_191006 ?auto_191007 )
      ( MAKE-6PILE ?auto_191005 ?auto_191006 ?auto_191007 ?auto_191008 ?auto_191009 ?auto_191010 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191013 - BLOCK
      ?auto_191014 - BLOCK
      ?auto_191015 - BLOCK
      ?auto_191016 - BLOCK
      ?auto_191017 - BLOCK
      ?auto_191018 - BLOCK
    )
    :vars
    (
      ?auto_191020 - BLOCK
      ?auto_191019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191013 ) ( ON ?auto_191014 ?auto_191013 ) ( not ( = ?auto_191013 ?auto_191014 ) ) ( not ( = ?auto_191013 ?auto_191015 ) ) ( not ( = ?auto_191013 ?auto_191016 ) ) ( not ( = ?auto_191013 ?auto_191017 ) ) ( not ( = ?auto_191013 ?auto_191018 ) ) ( not ( = ?auto_191014 ?auto_191015 ) ) ( not ( = ?auto_191014 ?auto_191016 ) ) ( not ( = ?auto_191014 ?auto_191017 ) ) ( not ( = ?auto_191014 ?auto_191018 ) ) ( not ( = ?auto_191015 ?auto_191016 ) ) ( not ( = ?auto_191015 ?auto_191017 ) ) ( not ( = ?auto_191015 ?auto_191018 ) ) ( not ( = ?auto_191016 ?auto_191017 ) ) ( not ( = ?auto_191016 ?auto_191018 ) ) ( not ( = ?auto_191017 ?auto_191018 ) ) ( ON ?auto_191018 ?auto_191020 ) ( not ( = ?auto_191013 ?auto_191020 ) ) ( not ( = ?auto_191014 ?auto_191020 ) ) ( not ( = ?auto_191015 ?auto_191020 ) ) ( not ( = ?auto_191016 ?auto_191020 ) ) ( not ( = ?auto_191017 ?auto_191020 ) ) ( not ( = ?auto_191018 ?auto_191020 ) ) ( ON ?auto_191017 ?auto_191018 ) ( ON-TABLE ?auto_191019 ) ( ON ?auto_191020 ?auto_191019 ) ( not ( = ?auto_191019 ?auto_191020 ) ) ( not ( = ?auto_191019 ?auto_191018 ) ) ( not ( = ?auto_191019 ?auto_191017 ) ) ( not ( = ?auto_191013 ?auto_191019 ) ) ( not ( = ?auto_191014 ?auto_191019 ) ) ( not ( = ?auto_191015 ?auto_191019 ) ) ( not ( = ?auto_191016 ?auto_191019 ) ) ( ON ?auto_191016 ?auto_191017 ) ( CLEAR ?auto_191014 ) ( ON ?auto_191015 ?auto_191016 ) ( CLEAR ?auto_191015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191019 ?auto_191020 ?auto_191018 ?auto_191017 ?auto_191016 )
      ( MAKE-6PILE ?auto_191013 ?auto_191014 ?auto_191015 ?auto_191016 ?auto_191017 ?auto_191018 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191021 - BLOCK
      ?auto_191022 - BLOCK
      ?auto_191023 - BLOCK
      ?auto_191024 - BLOCK
      ?auto_191025 - BLOCK
      ?auto_191026 - BLOCK
    )
    :vars
    (
      ?auto_191027 - BLOCK
      ?auto_191028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191021 ) ( not ( = ?auto_191021 ?auto_191022 ) ) ( not ( = ?auto_191021 ?auto_191023 ) ) ( not ( = ?auto_191021 ?auto_191024 ) ) ( not ( = ?auto_191021 ?auto_191025 ) ) ( not ( = ?auto_191021 ?auto_191026 ) ) ( not ( = ?auto_191022 ?auto_191023 ) ) ( not ( = ?auto_191022 ?auto_191024 ) ) ( not ( = ?auto_191022 ?auto_191025 ) ) ( not ( = ?auto_191022 ?auto_191026 ) ) ( not ( = ?auto_191023 ?auto_191024 ) ) ( not ( = ?auto_191023 ?auto_191025 ) ) ( not ( = ?auto_191023 ?auto_191026 ) ) ( not ( = ?auto_191024 ?auto_191025 ) ) ( not ( = ?auto_191024 ?auto_191026 ) ) ( not ( = ?auto_191025 ?auto_191026 ) ) ( ON ?auto_191026 ?auto_191027 ) ( not ( = ?auto_191021 ?auto_191027 ) ) ( not ( = ?auto_191022 ?auto_191027 ) ) ( not ( = ?auto_191023 ?auto_191027 ) ) ( not ( = ?auto_191024 ?auto_191027 ) ) ( not ( = ?auto_191025 ?auto_191027 ) ) ( not ( = ?auto_191026 ?auto_191027 ) ) ( ON ?auto_191025 ?auto_191026 ) ( ON-TABLE ?auto_191028 ) ( ON ?auto_191027 ?auto_191028 ) ( not ( = ?auto_191028 ?auto_191027 ) ) ( not ( = ?auto_191028 ?auto_191026 ) ) ( not ( = ?auto_191028 ?auto_191025 ) ) ( not ( = ?auto_191021 ?auto_191028 ) ) ( not ( = ?auto_191022 ?auto_191028 ) ) ( not ( = ?auto_191023 ?auto_191028 ) ) ( not ( = ?auto_191024 ?auto_191028 ) ) ( ON ?auto_191024 ?auto_191025 ) ( ON ?auto_191023 ?auto_191024 ) ( CLEAR ?auto_191023 ) ( HOLDING ?auto_191022 ) ( CLEAR ?auto_191021 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191021 ?auto_191022 )
      ( MAKE-6PILE ?auto_191021 ?auto_191022 ?auto_191023 ?auto_191024 ?auto_191025 ?auto_191026 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191029 - BLOCK
      ?auto_191030 - BLOCK
      ?auto_191031 - BLOCK
      ?auto_191032 - BLOCK
      ?auto_191033 - BLOCK
      ?auto_191034 - BLOCK
    )
    :vars
    (
      ?auto_191035 - BLOCK
      ?auto_191036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191029 ) ( not ( = ?auto_191029 ?auto_191030 ) ) ( not ( = ?auto_191029 ?auto_191031 ) ) ( not ( = ?auto_191029 ?auto_191032 ) ) ( not ( = ?auto_191029 ?auto_191033 ) ) ( not ( = ?auto_191029 ?auto_191034 ) ) ( not ( = ?auto_191030 ?auto_191031 ) ) ( not ( = ?auto_191030 ?auto_191032 ) ) ( not ( = ?auto_191030 ?auto_191033 ) ) ( not ( = ?auto_191030 ?auto_191034 ) ) ( not ( = ?auto_191031 ?auto_191032 ) ) ( not ( = ?auto_191031 ?auto_191033 ) ) ( not ( = ?auto_191031 ?auto_191034 ) ) ( not ( = ?auto_191032 ?auto_191033 ) ) ( not ( = ?auto_191032 ?auto_191034 ) ) ( not ( = ?auto_191033 ?auto_191034 ) ) ( ON ?auto_191034 ?auto_191035 ) ( not ( = ?auto_191029 ?auto_191035 ) ) ( not ( = ?auto_191030 ?auto_191035 ) ) ( not ( = ?auto_191031 ?auto_191035 ) ) ( not ( = ?auto_191032 ?auto_191035 ) ) ( not ( = ?auto_191033 ?auto_191035 ) ) ( not ( = ?auto_191034 ?auto_191035 ) ) ( ON ?auto_191033 ?auto_191034 ) ( ON-TABLE ?auto_191036 ) ( ON ?auto_191035 ?auto_191036 ) ( not ( = ?auto_191036 ?auto_191035 ) ) ( not ( = ?auto_191036 ?auto_191034 ) ) ( not ( = ?auto_191036 ?auto_191033 ) ) ( not ( = ?auto_191029 ?auto_191036 ) ) ( not ( = ?auto_191030 ?auto_191036 ) ) ( not ( = ?auto_191031 ?auto_191036 ) ) ( not ( = ?auto_191032 ?auto_191036 ) ) ( ON ?auto_191032 ?auto_191033 ) ( ON ?auto_191031 ?auto_191032 ) ( CLEAR ?auto_191029 ) ( ON ?auto_191030 ?auto_191031 ) ( CLEAR ?auto_191030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191036 ?auto_191035 ?auto_191034 ?auto_191033 ?auto_191032 ?auto_191031 )
      ( MAKE-6PILE ?auto_191029 ?auto_191030 ?auto_191031 ?auto_191032 ?auto_191033 ?auto_191034 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191037 - BLOCK
      ?auto_191038 - BLOCK
      ?auto_191039 - BLOCK
      ?auto_191040 - BLOCK
      ?auto_191041 - BLOCK
      ?auto_191042 - BLOCK
    )
    :vars
    (
      ?auto_191043 - BLOCK
      ?auto_191044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191037 ?auto_191038 ) ) ( not ( = ?auto_191037 ?auto_191039 ) ) ( not ( = ?auto_191037 ?auto_191040 ) ) ( not ( = ?auto_191037 ?auto_191041 ) ) ( not ( = ?auto_191037 ?auto_191042 ) ) ( not ( = ?auto_191038 ?auto_191039 ) ) ( not ( = ?auto_191038 ?auto_191040 ) ) ( not ( = ?auto_191038 ?auto_191041 ) ) ( not ( = ?auto_191038 ?auto_191042 ) ) ( not ( = ?auto_191039 ?auto_191040 ) ) ( not ( = ?auto_191039 ?auto_191041 ) ) ( not ( = ?auto_191039 ?auto_191042 ) ) ( not ( = ?auto_191040 ?auto_191041 ) ) ( not ( = ?auto_191040 ?auto_191042 ) ) ( not ( = ?auto_191041 ?auto_191042 ) ) ( ON ?auto_191042 ?auto_191043 ) ( not ( = ?auto_191037 ?auto_191043 ) ) ( not ( = ?auto_191038 ?auto_191043 ) ) ( not ( = ?auto_191039 ?auto_191043 ) ) ( not ( = ?auto_191040 ?auto_191043 ) ) ( not ( = ?auto_191041 ?auto_191043 ) ) ( not ( = ?auto_191042 ?auto_191043 ) ) ( ON ?auto_191041 ?auto_191042 ) ( ON-TABLE ?auto_191044 ) ( ON ?auto_191043 ?auto_191044 ) ( not ( = ?auto_191044 ?auto_191043 ) ) ( not ( = ?auto_191044 ?auto_191042 ) ) ( not ( = ?auto_191044 ?auto_191041 ) ) ( not ( = ?auto_191037 ?auto_191044 ) ) ( not ( = ?auto_191038 ?auto_191044 ) ) ( not ( = ?auto_191039 ?auto_191044 ) ) ( not ( = ?auto_191040 ?auto_191044 ) ) ( ON ?auto_191040 ?auto_191041 ) ( ON ?auto_191039 ?auto_191040 ) ( ON ?auto_191038 ?auto_191039 ) ( CLEAR ?auto_191038 ) ( HOLDING ?auto_191037 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191037 )
      ( MAKE-6PILE ?auto_191037 ?auto_191038 ?auto_191039 ?auto_191040 ?auto_191041 ?auto_191042 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191045 - BLOCK
      ?auto_191046 - BLOCK
      ?auto_191047 - BLOCK
      ?auto_191048 - BLOCK
      ?auto_191049 - BLOCK
      ?auto_191050 - BLOCK
    )
    :vars
    (
      ?auto_191052 - BLOCK
      ?auto_191051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191045 ?auto_191046 ) ) ( not ( = ?auto_191045 ?auto_191047 ) ) ( not ( = ?auto_191045 ?auto_191048 ) ) ( not ( = ?auto_191045 ?auto_191049 ) ) ( not ( = ?auto_191045 ?auto_191050 ) ) ( not ( = ?auto_191046 ?auto_191047 ) ) ( not ( = ?auto_191046 ?auto_191048 ) ) ( not ( = ?auto_191046 ?auto_191049 ) ) ( not ( = ?auto_191046 ?auto_191050 ) ) ( not ( = ?auto_191047 ?auto_191048 ) ) ( not ( = ?auto_191047 ?auto_191049 ) ) ( not ( = ?auto_191047 ?auto_191050 ) ) ( not ( = ?auto_191048 ?auto_191049 ) ) ( not ( = ?auto_191048 ?auto_191050 ) ) ( not ( = ?auto_191049 ?auto_191050 ) ) ( ON ?auto_191050 ?auto_191052 ) ( not ( = ?auto_191045 ?auto_191052 ) ) ( not ( = ?auto_191046 ?auto_191052 ) ) ( not ( = ?auto_191047 ?auto_191052 ) ) ( not ( = ?auto_191048 ?auto_191052 ) ) ( not ( = ?auto_191049 ?auto_191052 ) ) ( not ( = ?auto_191050 ?auto_191052 ) ) ( ON ?auto_191049 ?auto_191050 ) ( ON-TABLE ?auto_191051 ) ( ON ?auto_191052 ?auto_191051 ) ( not ( = ?auto_191051 ?auto_191052 ) ) ( not ( = ?auto_191051 ?auto_191050 ) ) ( not ( = ?auto_191051 ?auto_191049 ) ) ( not ( = ?auto_191045 ?auto_191051 ) ) ( not ( = ?auto_191046 ?auto_191051 ) ) ( not ( = ?auto_191047 ?auto_191051 ) ) ( not ( = ?auto_191048 ?auto_191051 ) ) ( ON ?auto_191048 ?auto_191049 ) ( ON ?auto_191047 ?auto_191048 ) ( ON ?auto_191046 ?auto_191047 ) ( ON ?auto_191045 ?auto_191046 ) ( CLEAR ?auto_191045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191051 ?auto_191052 ?auto_191050 ?auto_191049 ?auto_191048 ?auto_191047 ?auto_191046 )
      ( MAKE-6PILE ?auto_191045 ?auto_191046 ?auto_191047 ?auto_191048 ?auto_191049 ?auto_191050 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191053 - BLOCK
      ?auto_191054 - BLOCK
      ?auto_191055 - BLOCK
      ?auto_191056 - BLOCK
      ?auto_191057 - BLOCK
      ?auto_191058 - BLOCK
    )
    :vars
    (
      ?auto_191059 - BLOCK
      ?auto_191060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191053 ?auto_191054 ) ) ( not ( = ?auto_191053 ?auto_191055 ) ) ( not ( = ?auto_191053 ?auto_191056 ) ) ( not ( = ?auto_191053 ?auto_191057 ) ) ( not ( = ?auto_191053 ?auto_191058 ) ) ( not ( = ?auto_191054 ?auto_191055 ) ) ( not ( = ?auto_191054 ?auto_191056 ) ) ( not ( = ?auto_191054 ?auto_191057 ) ) ( not ( = ?auto_191054 ?auto_191058 ) ) ( not ( = ?auto_191055 ?auto_191056 ) ) ( not ( = ?auto_191055 ?auto_191057 ) ) ( not ( = ?auto_191055 ?auto_191058 ) ) ( not ( = ?auto_191056 ?auto_191057 ) ) ( not ( = ?auto_191056 ?auto_191058 ) ) ( not ( = ?auto_191057 ?auto_191058 ) ) ( ON ?auto_191058 ?auto_191059 ) ( not ( = ?auto_191053 ?auto_191059 ) ) ( not ( = ?auto_191054 ?auto_191059 ) ) ( not ( = ?auto_191055 ?auto_191059 ) ) ( not ( = ?auto_191056 ?auto_191059 ) ) ( not ( = ?auto_191057 ?auto_191059 ) ) ( not ( = ?auto_191058 ?auto_191059 ) ) ( ON ?auto_191057 ?auto_191058 ) ( ON-TABLE ?auto_191060 ) ( ON ?auto_191059 ?auto_191060 ) ( not ( = ?auto_191060 ?auto_191059 ) ) ( not ( = ?auto_191060 ?auto_191058 ) ) ( not ( = ?auto_191060 ?auto_191057 ) ) ( not ( = ?auto_191053 ?auto_191060 ) ) ( not ( = ?auto_191054 ?auto_191060 ) ) ( not ( = ?auto_191055 ?auto_191060 ) ) ( not ( = ?auto_191056 ?auto_191060 ) ) ( ON ?auto_191056 ?auto_191057 ) ( ON ?auto_191055 ?auto_191056 ) ( ON ?auto_191054 ?auto_191055 ) ( HOLDING ?auto_191053 ) ( CLEAR ?auto_191054 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191060 ?auto_191059 ?auto_191058 ?auto_191057 ?auto_191056 ?auto_191055 ?auto_191054 ?auto_191053 )
      ( MAKE-6PILE ?auto_191053 ?auto_191054 ?auto_191055 ?auto_191056 ?auto_191057 ?auto_191058 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191061 - BLOCK
      ?auto_191062 - BLOCK
      ?auto_191063 - BLOCK
      ?auto_191064 - BLOCK
      ?auto_191065 - BLOCK
      ?auto_191066 - BLOCK
    )
    :vars
    (
      ?auto_191067 - BLOCK
      ?auto_191068 - BLOCK
      ?auto_191069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191061 ?auto_191062 ) ) ( not ( = ?auto_191061 ?auto_191063 ) ) ( not ( = ?auto_191061 ?auto_191064 ) ) ( not ( = ?auto_191061 ?auto_191065 ) ) ( not ( = ?auto_191061 ?auto_191066 ) ) ( not ( = ?auto_191062 ?auto_191063 ) ) ( not ( = ?auto_191062 ?auto_191064 ) ) ( not ( = ?auto_191062 ?auto_191065 ) ) ( not ( = ?auto_191062 ?auto_191066 ) ) ( not ( = ?auto_191063 ?auto_191064 ) ) ( not ( = ?auto_191063 ?auto_191065 ) ) ( not ( = ?auto_191063 ?auto_191066 ) ) ( not ( = ?auto_191064 ?auto_191065 ) ) ( not ( = ?auto_191064 ?auto_191066 ) ) ( not ( = ?auto_191065 ?auto_191066 ) ) ( ON ?auto_191066 ?auto_191067 ) ( not ( = ?auto_191061 ?auto_191067 ) ) ( not ( = ?auto_191062 ?auto_191067 ) ) ( not ( = ?auto_191063 ?auto_191067 ) ) ( not ( = ?auto_191064 ?auto_191067 ) ) ( not ( = ?auto_191065 ?auto_191067 ) ) ( not ( = ?auto_191066 ?auto_191067 ) ) ( ON ?auto_191065 ?auto_191066 ) ( ON-TABLE ?auto_191068 ) ( ON ?auto_191067 ?auto_191068 ) ( not ( = ?auto_191068 ?auto_191067 ) ) ( not ( = ?auto_191068 ?auto_191066 ) ) ( not ( = ?auto_191068 ?auto_191065 ) ) ( not ( = ?auto_191061 ?auto_191068 ) ) ( not ( = ?auto_191062 ?auto_191068 ) ) ( not ( = ?auto_191063 ?auto_191068 ) ) ( not ( = ?auto_191064 ?auto_191068 ) ) ( ON ?auto_191064 ?auto_191065 ) ( ON ?auto_191063 ?auto_191064 ) ( ON ?auto_191062 ?auto_191063 ) ( CLEAR ?auto_191062 ) ( ON ?auto_191061 ?auto_191069 ) ( CLEAR ?auto_191061 ) ( HAND-EMPTY ) ( not ( = ?auto_191061 ?auto_191069 ) ) ( not ( = ?auto_191062 ?auto_191069 ) ) ( not ( = ?auto_191063 ?auto_191069 ) ) ( not ( = ?auto_191064 ?auto_191069 ) ) ( not ( = ?auto_191065 ?auto_191069 ) ) ( not ( = ?auto_191066 ?auto_191069 ) ) ( not ( = ?auto_191067 ?auto_191069 ) ) ( not ( = ?auto_191068 ?auto_191069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191061 ?auto_191069 )
      ( MAKE-6PILE ?auto_191061 ?auto_191062 ?auto_191063 ?auto_191064 ?auto_191065 ?auto_191066 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191070 - BLOCK
      ?auto_191071 - BLOCK
      ?auto_191072 - BLOCK
      ?auto_191073 - BLOCK
      ?auto_191074 - BLOCK
      ?auto_191075 - BLOCK
    )
    :vars
    (
      ?auto_191078 - BLOCK
      ?auto_191077 - BLOCK
      ?auto_191076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191070 ?auto_191071 ) ) ( not ( = ?auto_191070 ?auto_191072 ) ) ( not ( = ?auto_191070 ?auto_191073 ) ) ( not ( = ?auto_191070 ?auto_191074 ) ) ( not ( = ?auto_191070 ?auto_191075 ) ) ( not ( = ?auto_191071 ?auto_191072 ) ) ( not ( = ?auto_191071 ?auto_191073 ) ) ( not ( = ?auto_191071 ?auto_191074 ) ) ( not ( = ?auto_191071 ?auto_191075 ) ) ( not ( = ?auto_191072 ?auto_191073 ) ) ( not ( = ?auto_191072 ?auto_191074 ) ) ( not ( = ?auto_191072 ?auto_191075 ) ) ( not ( = ?auto_191073 ?auto_191074 ) ) ( not ( = ?auto_191073 ?auto_191075 ) ) ( not ( = ?auto_191074 ?auto_191075 ) ) ( ON ?auto_191075 ?auto_191078 ) ( not ( = ?auto_191070 ?auto_191078 ) ) ( not ( = ?auto_191071 ?auto_191078 ) ) ( not ( = ?auto_191072 ?auto_191078 ) ) ( not ( = ?auto_191073 ?auto_191078 ) ) ( not ( = ?auto_191074 ?auto_191078 ) ) ( not ( = ?auto_191075 ?auto_191078 ) ) ( ON ?auto_191074 ?auto_191075 ) ( ON-TABLE ?auto_191077 ) ( ON ?auto_191078 ?auto_191077 ) ( not ( = ?auto_191077 ?auto_191078 ) ) ( not ( = ?auto_191077 ?auto_191075 ) ) ( not ( = ?auto_191077 ?auto_191074 ) ) ( not ( = ?auto_191070 ?auto_191077 ) ) ( not ( = ?auto_191071 ?auto_191077 ) ) ( not ( = ?auto_191072 ?auto_191077 ) ) ( not ( = ?auto_191073 ?auto_191077 ) ) ( ON ?auto_191073 ?auto_191074 ) ( ON ?auto_191072 ?auto_191073 ) ( ON ?auto_191070 ?auto_191076 ) ( CLEAR ?auto_191070 ) ( not ( = ?auto_191070 ?auto_191076 ) ) ( not ( = ?auto_191071 ?auto_191076 ) ) ( not ( = ?auto_191072 ?auto_191076 ) ) ( not ( = ?auto_191073 ?auto_191076 ) ) ( not ( = ?auto_191074 ?auto_191076 ) ) ( not ( = ?auto_191075 ?auto_191076 ) ) ( not ( = ?auto_191078 ?auto_191076 ) ) ( not ( = ?auto_191077 ?auto_191076 ) ) ( HOLDING ?auto_191071 ) ( CLEAR ?auto_191072 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191077 ?auto_191078 ?auto_191075 ?auto_191074 ?auto_191073 ?auto_191072 ?auto_191071 )
      ( MAKE-6PILE ?auto_191070 ?auto_191071 ?auto_191072 ?auto_191073 ?auto_191074 ?auto_191075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191079 - BLOCK
      ?auto_191080 - BLOCK
      ?auto_191081 - BLOCK
      ?auto_191082 - BLOCK
      ?auto_191083 - BLOCK
      ?auto_191084 - BLOCK
    )
    :vars
    (
      ?auto_191087 - BLOCK
      ?auto_191086 - BLOCK
      ?auto_191085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191079 ?auto_191080 ) ) ( not ( = ?auto_191079 ?auto_191081 ) ) ( not ( = ?auto_191079 ?auto_191082 ) ) ( not ( = ?auto_191079 ?auto_191083 ) ) ( not ( = ?auto_191079 ?auto_191084 ) ) ( not ( = ?auto_191080 ?auto_191081 ) ) ( not ( = ?auto_191080 ?auto_191082 ) ) ( not ( = ?auto_191080 ?auto_191083 ) ) ( not ( = ?auto_191080 ?auto_191084 ) ) ( not ( = ?auto_191081 ?auto_191082 ) ) ( not ( = ?auto_191081 ?auto_191083 ) ) ( not ( = ?auto_191081 ?auto_191084 ) ) ( not ( = ?auto_191082 ?auto_191083 ) ) ( not ( = ?auto_191082 ?auto_191084 ) ) ( not ( = ?auto_191083 ?auto_191084 ) ) ( ON ?auto_191084 ?auto_191087 ) ( not ( = ?auto_191079 ?auto_191087 ) ) ( not ( = ?auto_191080 ?auto_191087 ) ) ( not ( = ?auto_191081 ?auto_191087 ) ) ( not ( = ?auto_191082 ?auto_191087 ) ) ( not ( = ?auto_191083 ?auto_191087 ) ) ( not ( = ?auto_191084 ?auto_191087 ) ) ( ON ?auto_191083 ?auto_191084 ) ( ON-TABLE ?auto_191086 ) ( ON ?auto_191087 ?auto_191086 ) ( not ( = ?auto_191086 ?auto_191087 ) ) ( not ( = ?auto_191086 ?auto_191084 ) ) ( not ( = ?auto_191086 ?auto_191083 ) ) ( not ( = ?auto_191079 ?auto_191086 ) ) ( not ( = ?auto_191080 ?auto_191086 ) ) ( not ( = ?auto_191081 ?auto_191086 ) ) ( not ( = ?auto_191082 ?auto_191086 ) ) ( ON ?auto_191082 ?auto_191083 ) ( ON ?auto_191081 ?auto_191082 ) ( ON ?auto_191079 ?auto_191085 ) ( not ( = ?auto_191079 ?auto_191085 ) ) ( not ( = ?auto_191080 ?auto_191085 ) ) ( not ( = ?auto_191081 ?auto_191085 ) ) ( not ( = ?auto_191082 ?auto_191085 ) ) ( not ( = ?auto_191083 ?auto_191085 ) ) ( not ( = ?auto_191084 ?auto_191085 ) ) ( not ( = ?auto_191087 ?auto_191085 ) ) ( not ( = ?auto_191086 ?auto_191085 ) ) ( CLEAR ?auto_191081 ) ( ON ?auto_191080 ?auto_191079 ) ( CLEAR ?auto_191080 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191085 ?auto_191079 )
      ( MAKE-6PILE ?auto_191079 ?auto_191080 ?auto_191081 ?auto_191082 ?auto_191083 ?auto_191084 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191088 - BLOCK
      ?auto_191089 - BLOCK
      ?auto_191090 - BLOCK
      ?auto_191091 - BLOCK
      ?auto_191092 - BLOCK
      ?auto_191093 - BLOCK
    )
    :vars
    (
      ?auto_191096 - BLOCK
      ?auto_191095 - BLOCK
      ?auto_191094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191088 ?auto_191089 ) ) ( not ( = ?auto_191088 ?auto_191090 ) ) ( not ( = ?auto_191088 ?auto_191091 ) ) ( not ( = ?auto_191088 ?auto_191092 ) ) ( not ( = ?auto_191088 ?auto_191093 ) ) ( not ( = ?auto_191089 ?auto_191090 ) ) ( not ( = ?auto_191089 ?auto_191091 ) ) ( not ( = ?auto_191089 ?auto_191092 ) ) ( not ( = ?auto_191089 ?auto_191093 ) ) ( not ( = ?auto_191090 ?auto_191091 ) ) ( not ( = ?auto_191090 ?auto_191092 ) ) ( not ( = ?auto_191090 ?auto_191093 ) ) ( not ( = ?auto_191091 ?auto_191092 ) ) ( not ( = ?auto_191091 ?auto_191093 ) ) ( not ( = ?auto_191092 ?auto_191093 ) ) ( ON ?auto_191093 ?auto_191096 ) ( not ( = ?auto_191088 ?auto_191096 ) ) ( not ( = ?auto_191089 ?auto_191096 ) ) ( not ( = ?auto_191090 ?auto_191096 ) ) ( not ( = ?auto_191091 ?auto_191096 ) ) ( not ( = ?auto_191092 ?auto_191096 ) ) ( not ( = ?auto_191093 ?auto_191096 ) ) ( ON ?auto_191092 ?auto_191093 ) ( ON-TABLE ?auto_191095 ) ( ON ?auto_191096 ?auto_191095 ) ( not ( = ?auto_191095 ?auto_191096 ) ) ( not ( = ?auto_191095 ?auto_191093 ) ) ( not ( = ?auto_191095 ?auto_191092 ) ) ( not ( = ?auto_191088 ?auto_191095 ) ) ( not ( = ?auto_191089 ?auto_191095 ) ) ( not ( = ?auto_191090 ?auto_191095 ) ) ( not ( = ?auto_191091 ?auto_191095 ) ) ( ON ?auto_191091 ?auto_191092 ) ( ON ?auto_191088 ?auto_191094 ) ( not ( = ?auto_191088 ?auto_191094 ) ) ( not ( = ?auto_191089 ?auto_191094 ) ) ( not ( = ?auto_191090 ?auto_191094 ) ) ( not ( = ?auto_191091 ?auto_191094 ) ) ( not ( = ?auto_191092 ?auto_191094 ) ) ( not ( = ?auto_191093 ?auto_191094 ) ) ( not ( = ?auto_191096 ?auto_191094 ) ) ( not ( = ?auto_191095 ?auto_191094 ) ) ( ON ?auto_191089 ?auto_191088 ) ( CLEAR ?auto_191089 ) ( ON-TABLE ?auto_191094 ) ( HOLDING ?auto_191090 ) ( CLEAR ?auto_191091 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191095 ?auto_191096 ?auto_191093 ?auto_191092 ?auto_191091 ?auto_191090 )
      ( MAKE-6PILE ?auto_191088 ?auto_191089 ?auto_191090 ?auto_191091 ?auto_191092 ?auto_191093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191097 - BLOCK
      ?auto_191098 - BLOCK
      ?auto_191099 - BLOCK
      ?auto_191100 - BLOCK
      ?auto_191101 - BLOCK
      ?auto_191102 - BLOCK
    )
    :vars
    (
      ?auto_191104 - BLOCK
      ?auto_191105 - BLOCK
      ?auto_191103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191097 ?auto_191098 ) ) ( not ( = ?auto_191097 ?auto_191099 ) ) ( not ( = ?auto_191097 ?auto_191100 ) ) ( not ( = ?auto_191097 ?auto_191101 ) ) ( not ( = ?auto_191097 ?auto_191102 ) ) ( not ( = ?auto_191098 ?auto_191099 ) ) ( not ( = ?auto_191098 ?auto_191100 ) ) ( not ( = ?auto_191098 ?auto_191101 ) ) ( not ( = ?auto_191098 ?auto_191102 ) ) ( not ( = ?auto_191099 ?auto_191100 ) ) ( not ( = ?auto_191099 ?auto_191101 ) ) ( not ( = ?auto_191099 ?auto_191102 ) ) ( not ( = ?auto_191100 ?auto_191101 ) ) ( not ( = ?auto_191100 ?auto_191102 ) ) ( not ( = ?auto_191101 ?auto_191102 ) ) ( ON ?auto_191102 ?auto_191104 ) ( not ( = ?auto_191097 ?auto_191104 ) ) ( not ( = ?auto_191098 ?auto_191104 ) ) ( not ( = ?auto_191099 ?auto_191104 ) ) ( not ( = ?auto_191100 ?auto_191104 ) ) ( not ( = ?auto_191101 ?auto_191104 ) ) ( not ( = ?auto_191102 ?auto_191104 ) ) ( ON ?auto_191101 ?auto_191102 ) ( ON-TABLE ?auto_191105 ) ( ON ?auto_191104 ?auto_191105 ) ( not ( = ?auto_191105 ?auto_191104 ) ) ( not ( = ?auto_191105 ?auto_191102 ) ) ( not ( = ?auto_191105 ?auto_191101 ) ) ( not ( = ?auto_191097 ?auto_191105 ) ) ( not ( = ?auto_191098 ?auto_191105 ) ) ( not ( = ?auto_191099 ?auto_191105 ) ) ( not ( = ?auto_191100 ?auto_191105 ) ) ( ON ?auto_191100 ?auto_191101 ) ( ON ?auto_191097 ?auto_191103 ) ( not ( = ?auto_191097 ?auto_191103 ) ) ( not ( = ?auto_191098 ?auto_191103 ) ) ( not ( = ?auto_191099 ?auto_191103 ) ) ( not ( = ?auto_191100 ?auto_191103 ) ) ( not ( = ?auto_191101 ?auto_191103 ) ) ( not ( = ?auto_191102 ?auto_191103 ) ) ( not ( = ?auto_191104 ?auto_191103 ) ) ( not ( = ?auto_191105 ?auto_191103 ) ) ( ON ?auto_191098 ?auto_191097 ) ( ON-TABLE ?auto_191103 ) ( CLEAR ?auto_191100 ) ( ON ?auto_191099 ?auto_191098 ) ( CLEAR ?auto_191099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191103 ?auto_191097 ?auto_191098 )
      ( MAKE-6PILE ?auto_191097 ?auto_191098 ?auto_191099 ?auto_191100 ?auto_191101 ?auto_191102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191106 - BLOCK
      ?auto_191107 - BLOCK
      ?auto_191108 - BLOCK
      ?auto_191109 - BLOCK
      ?auto_191110 - BLOCK
      ?auto_191111 - BLOCK
    )
    :vars
    (
      ?auto_191113 - BLOCK
      ?auto_191112 - BLOCK
      ?auto_191114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191106 ?auto_191107 ) ) ( not ( = ?auto_191106 ?auto_191108 ) ) ( not ( = ?auto_191106 ?auto_191109 ) ) ( not ( = ?auto_191106 ?auto_191110 ) ) ( not ( = ?auto_191106 ?auto_191111 ) ) ( not ( = ?auto_191107 ?auto_191108 ) ) ( not ( = ?auto_191107 ?auto_191109 ) ) ( not ( = ?auto_191107 ?auto_191110 ) ) ( not ( = ?auto_191107 ?auto_191111 ) ) ( not ( = ?auto_191108 ?auto_191109 ) ) ( not ( = ?auto_191108 ?auto_191110 ) ) ( not ( = ?auto_191108 ?auto_191111 ) ) ( not ( = ?auto_191109 ?auto_191110 ) ) ( not ( = ?auto_191109 ?auto_191111 ) ) ( not ( = ?auto_191110 ?auto_191111 ) ) ( ON ?auto_191111 ?auto_191113 ) ( not ( = ?auto_191106 ?auto_191113 ) ) ( not ( = ?auto_191107 ?auto_191113 ) ) ( not ( = ?auto_191108 ?auto_191113 ) ) ( not ( = ?auto_191109 ?auto_191113 ) ) ( not ( = ?auto_191110 ?auto_191113 ) ) ( not ( = ?auto_191111 ?auto_191113 ) ) ( ON ?auto_191110 ?auto_191111 ) ( ON-TABLE ?auto_191112 ) ( ON ?auto_191113 ?auto_191112 ) ( not ( = ?auto_191112 ?auto_191113 ) ) ( not ( = ?auto_191112 ?auto_191111 ) ) ( not ( = ?auto_191112 ?auto_191110 ) ) ( not ( = ?auto_191106 ?auto_191112 ) ) ( not ( = ?auto_191107 ?auto_191112 ) ) ( not ( = ?auto_191108 ?auto_191112 ) ) ( not ( = ?auto_191109 ?auto_191112 ) ) ( ON ?auto_191106 ?auto_191114 ) ( not ( = ?auto_191106 ?auto_191114 ) ) ( not ( = ?auto_191107 ?auto_191114 ) ) ( not ( = ?auto_191108 ?auto_191114 ) ) ( not ( = ?auto_191109 ?auto_191114 ) ) ( not ( = ?auto_191110 ?auto_191114 ) ) ( not ( = ?auto_191111 ?auto_191114 ) ) ( not ( = ?auto_191113 ?auto_191114 ) ) ( not ( = ?auto_191112 ?auto_191114 ) ) ( ON ?auto_191107 ?auto_191106 ) ( ON-TABLE ?auto_191114 ) ( ON ?auto_191108 ?auto_191107 ) ( CLEAR ?auto_191108 ) ( HOLDING ?auto_191109 ) ( CLEAR ?auto_191110 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191112 ?auto_191113 ?auto_191111 ?auto_191110 ?auto_191109 )
      ( MAKE-6PILE ?auto_191106 ?auto_191107 ?auto_191108 ?auto_191109 ?auto_191110 ?auto_191111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191115 - BLOCK
      ?auto_191116 - BLOCK
      ?auto_191117 - BLOCK
      ?auto_191118 - BLOCK
      ?auto_191119 - BLOCK
      ?auto_191120 - BLOCK
    )
    :vars
    (
      ?auto_191123 - BLOCK
      ?auto_191122 - BLOCK
      ?auto_191121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191115 ?auto_191116 ) ) ( not ( = ?auto_191115 ?auto_191117 ) ) ( not ( = ?auto_191115 ?auto_191118 ) ) ( not ( = ?auto_191115 ?auto_191119 ) ) ( not ( = ?auto_191115 ?auto_191120 ) ) ( not ( = ?auto_191116 ?auto_191117 ) ) ( not ( = ?auto_191116 ?auto_191118 ) ) ( not ( = ?auto_191116 ?auto_191119 ) ) ( not ( = ?auto_191116 ?auto_191120 ) ) ( not ( = ?auto_191117 ?auto_191118 ) ) ( not ( = ?auto_191117 ?auto_191119 ) ) ( not ( = ?auto_191117 ?auto_191120 ) ) ( not ( = ?auto_191118 ?auto_191119 ) ) ( not ( = ?auto_191118 ?auto_191120 ) ) ( not ( = ?auto_191119 ?auto_191120 ) ) ( ON ?auto_191120 ?auto_191123 ) ( not ( = ?auto_191115 ?auto_191123 ) ) ( not ( = ?auto_191116 ?auto_191123 ) ) ( not ( = ?auto_191117 ?auto_191123 ) ) ( not ( = ?auto_191118 ?auto_191123 ) ) ( not ( = ?auto_191119 ?auto_191123 ) ) ( not ( = ?auto_191120 ?auto_191123 ) ) ( ON ?auto_191119 ?auto_191120 ) ( ON-TABLE ?auto_191122 ) ( ON ?auto_191123 ?auto_191122 ) ( not ( = ?auto_191122 ?auto_191123 ) ) ( not ( = ?auto_191122 ?auto_191120 ) ) ( not ( = ?auto_191122 ?auto_191119 ) ) ( not ( = ?auto_191115 ?auto_191122 ) ) ( not ( = ?auto_191116 ?auto_191122 ) ) ( not ( = ?auto_191117 ?auto_191122 ) ) ( not ( = ?auto_191118 ?auto_191122 ) ) ( ON ?auto_191115 ?auto_191121 ) ( not ( = ?auto_191115 ?auto_191121 ) ) ( not ( = ?auto_191116 ?auto_191121 ) ) ( not ( = ?auto_191117 ?auto_191121 ) ) ( not ( = ?auto_191118 ?auto_191121 ) ) ( not ( = ?auto_191119 ?auto_191121 ) ) ( not ( = ?auto_191120 ?auto_191121 ) ) ( not ( = ?auto_191123 ?auto_191121 ) ) ( not ( = ?auto_191122 ?auto_191121 ) ) ( ON ?auto_191116 ?auto_191115 ) ( ON-TABLE ?auto_191121 ) ( ON ?auto_191117 ?auto_191116 ) ( CLEAR ?auto_191119 ) ( ON ?auto_191118 ?auto_191117 ) ( CLEAR ?auto_191118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191121 ?auto_191115 ?auto_191116 ?auto_191117 )
      ( MAKE-6PILE ?auto_191115 ?auto_191116 ?auto_191117 ?auto_191118 ?auto_191119 ?auto_191120 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191124 - BLOCK
      ?auto_191125 - BLOCK
      ?auto_191126 - BLOCK
      ?auto_191127 - BLOCK
      ?auto_191128 - BLOCK
      ?auto_191129 - BLOCK
    )
    :vars
    (
      ?auto_191130 - BLOCK
      ?auto_191132 - BLOCK
      ?auto_191131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191124 ?auto_191125 ) ) ( not ( = ?auto_191124 ?auto_191126 ) ) ( not ( = ?auto_191124 ?auto_191127 ) ) ( not ( = ?auto_191124 ?auto_191128 ) ) ( not ( = ?auto_191124 ?auto_191129 ) ) ( not ( = ?auto_191125 ?auto_191126 ) ) ( not ( = ?auto_191125 ?auto_191127 ) ) ( not ( = ?auto_191125 ?auto_191128 ) ) ( not ( = ?auto_191125 ?auto_191129 ) ) ( not ( = ?auto_191126 ?auto_191127 ) ) ( not ( = ?auto_191126 ?auto_191128 ) ) ( not ( = ?auto_191126 ?auto_191129 ) ) ( not ( = ?auto_191127 ?auto_191128 ) ) ( not ( = ?auto_191127 ?auto_191129 ) ) ( not ( = ?auto_191128 ?auto_191129 ) ) ( ON ?auto_191129 ?auto_191130 ) ( not ( = ?auto_191124 ?auto_191130 ) ) ( not ( = ?auto_191125 ?auto_191130 ) ) ( not ( = ?auto_191126 ?auto_191130 ) ) ( not ( = ?auto_191127 ?auto_191130 ) ) ( not ( = ?auto_191128 ?auto_191130 ) ) ( not ( = ?auto_191129 ?auto_191130 ) ) ( ON-TABLE ?auto_191132 ) ( ON ?auto_191130 ?auto_191132 ) ( not ( = ?auto_191132 ?auto_191130 ) ) ( not ( = ?auto_191132 ?auto_191129 ) ) ( not ( = ?auto_191132 ?auto_191128 ) ) ( not ( = ?auto_191124 ?auto_191132 ) ) ( not ( = ?auto_191125 ?auto_191132 ) ) ( not ( = ?auto_191126 ?auto_191132 ) ) ( not ( = ?auto_191127 ?auto_191132 ) ) ( ON ?auto_191124 ?auto_191131 ) ( not ( = ?auto_191124 ?auto_191131 ) ) ( not ( = ?auto_191125 ?auto_191131 ) ) ( not ( = ?auto_191126 ?auto_191131 ) ) ( not ( = ?auto_191127 ?auto_191131 ) ) ( not ( = ?auto_191128 ?auto_191131 ) ) ( not ( = ?auto_191129 ?auto_191131 ) ) ( not ( = ?auto_191130 ?auto_191131 ) ) ( not ( = ?auto_191132 ?auto_191131 ) ) ( ON ?auto_191125 ?auto_191124 ) ( ON-TABLE ?auto_191131 ) ( ON ?auto_191126 ?auto_191125 ) ( ON ?auto_191127 ?auto_191126 ) ( CLEAR ?auto_191127 ) ( HOLDING ?auto_191128 ) ( CLEAR ?auto_191129 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191132 ?auto_191130 ?auto_191129 ?auto_191128 )
      ( MAKE-6PILE ?auto_191124 ?auto_191125 ?auto_191126 ?auto_191127 ?auto_191128 ?auto_191129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191133 - BLOCK
      ?auto_191134 - BLOCK
      ?auto_191135 - BLOCK
      ?auto_191136 - BLOCK
      ?auto_191137 - BLOCK
      ?auto_191138 - BLOCK
    )
    :vars
    (
      ?auto_191140 - BLOCK
      ?auto_191139 - BLOCK
      ?auto_191141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191133 ?auto_191134 ) ) ( not ( = ?auto_191133 ?auto_191135 ) ) ( not ( = ?auto_191133 ?auto_191136 ) ) ( not ( = ?auto_191133 ?auto_191137 ) ) ( not ( = ?auto_191133 ?auto_191138 ) ) ( not ( = ?auto_191134 ?auto_191135 ) ) ( not ( = ?auto_191134 ?auto_191136 ) ) ( not ( = ?auto_191134 ?auto_191137 ) ) ( not ( = ?auto_191134 ?auto_191138 ) ) ( not ( = ?auto_191135 ?auto_191136 ) ) ( not ( = ?auto_191135 ?auto_191137 ) ) ( not ( = ?auto_191135 ?auto_191138 ) ) ( not ( = ?auto_191136 ?auto_191137 ) ) ( not ( = ?auto_191136 ?auto_191138 ) ) ( not ( = ?auto_191137 ?auto_191138 ) ) ( ON ?auto_191138 ?auto_191140 ) ( not ( = ?auto_191133 ?auto_191140 ) ) ( not ( = ?auto_191134 ?auto_191140 ) ) ( not ( = ?auto_191135 ?auto_191140 ) ) ( not ( = ?auto_191136 ?auto_191140 ) ) ( not ( = ?auto_191137 ?auto_191140 ) ) ( not ( = ?auto_191138 ?auto_191140 ) ) ( ON-TABLE ?auto_191139 ) ( ON ?auto_191140 ?auto_191139 ) ( not ( = ?auto_191139 ?auto_191140 ) ) ( not ( = ?auto_191139 ?auto_191138 ) ) ( not ( = ?auto_191139 ?auto_191137 ) ) ( not ( = ?auto_191133 ?auto_191139 ) ) ( not ( = ?auto_191134 ?auto_191139 ) ) ( not ( = ?auto_191135 ?auto_191139 ) ) ( not ( = ?auto_191136 ?auto_191139 ) ) ( ON ?auto_191133 ?auto_191141 ) ( not ( = ?auto_191133 ?auto_191141 ) ) ( not ( = ?auto_191134 ?auto_191141 ) ) ( not ( = ?auto_191135 ?auto_191141 ) ) ( not ( = ?auto_191136 ?auto_191141 ) ) ( not ( = ?auto_191137 ?auto_191141 ) ) ( not ( = ?auto_191138 ?auto_191141 ) ) ( not ( = ?auto_191140 ?auto_191141 ) ) ( not ( = ?auto_191139 ?auto_191141 ) ) ( ON ?auto_191134 ?auto_191133 ) ( ON-TABLE ?auto_191141 ) ( ON ?auto_191135 ?auto_191134 ) ( ON ?auto_191136 ?auto_191135 ) ( CLEAR ?auto_191138 ) ( ON ?auto_191137 ?auto_191136 ) ( CLEAR ?auto_191137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191141 ?auto_191133 ?auto_191134 ?auto_191135 ?auto_191136 )
      ( MAKE-6PILE ?auto_191133 ?auto_191134 ?auto_191135 ?auto_191136 ?auto_191137 ?auto_191138 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191142 - BLOCK
      ?auto_191143 - BLOCK
      ?auto_191144 - BLOCK
      ?auto_191145 - BLOCK
      ?auto_191146 - BLOCK
      ?auto_191147 - BLOCK
    )
    :vars
    (
      ?auto_191148 - BLOCK
      ?auto_191150 - BLOCK
      ?auto_191149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191142 ?auto_191143 ) ) ( not ( = ?auto_191142 ?auto_191144 ) ) ( not ( = ?auto_191142 ?auto_191145 ) ) ( not ( = ?auto_191142 ?auto_191146 ) ) ( not ( = ?auto_191142 ?auto_191147 ) ) ( not ( = ?auto_191143 ?auto_191144 ) ) ( not ( = ?auto_191143 ?auto_191145 ) ) ( not ( = ?auto_191143 ?auto_191146 ) ) ( not ( = ?auto_191143 ?auto_191147 ) ) ( not ( = ?auto_191144 ?auto_191145 ) ) ( not ( = ?auto_191144 ?auto_191146 ) ) ( not ( = ?auto_191144 ?auto_191147 ) ) ( not ( = ?auto_191145 ?auto_191146 ) ) ( not ( = ?auto_191145 ?auto_191147 ) ) ( not ( = ?auto_191146 ?auto_191147 ) ) ( not ( = ?auto_191142 ?auto_191148 ) ) ( not ( = ?auto_191143 ?auto_191148 ) ) ( not ( = ?auto_191144 ?auto_191148 ) ) ( not ( = ?auto_191145 ?auto_191148 ) ) ( not ( = ?auto_191146 ?auto_191148 ) ) ( not ( = ?auto_191147 ?auto_191148 ) ) ( ON-TABLE ?auto_191150 ) ( ON ?auto_191148 ?auto_191150 ) ( not ( = ?auto_191150 ?auto_191148 ) ) ( not ( = ?auto_191150 ?auto_191147 ) ) ( not ( = ?auto_191150 ?auto_191146 ) ) ( not ( = ?auto_191142 ?auto_191150 ) ) ( not ( = ?auto_191143 ?auto_191150 ) ) ( not ( = ?auto_191144 ?auto_191150 ) ) ( not ( = ?auto_191145 ?auto_191150 ) ) ( ON ?auto_191142 ?auto_191149 ) ( not ( = ?auto_191142 ?auto_191149 ) ) ( not ( = ?auto_191143 ?auto_191149 ) ) ( not ( = ?auto_191144 ?auto_191149 ) ) ( not ( = ?auto_191145 ?auto_191149 ) ) ( not ( = ?auto_191146 ?auto_191149 ) ) ( not ( = ?auto_191147 ?auto_191149 ) ) ( not ( = ?auto_191148 ?auto_191149 ) ) ( not ( = ?auto_191150 ?auto_191149 ) ) ( ON ?auto_191143 ?auto_191142 ) ( ON-TABLE ?auto_191149 ) ( ON ?auto_191144 ?auto_191143 ) ( ON ?auto_191145 ?auto_191144 ) ( ON ?auto_191146 ?auto_191145 ) ( CLEAR ?auto_191146 ) ( HOLDING ?auto_191147 ) ( CLEAR ?auto_191148 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191150 ?auto_191148 ?auto_191147 )
      ( MAKE-6PILE ?auto_191142 ?auto_191143 ?auto_191144 ?auto_191145 ?auto_191146 ?auto_191147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191151 - BLOCK
      ?auto_191152 - BLOCK
      ?auto_191153 - BLOCK
      ?auto_191154 - BLOCK
      ?auto_191155 - BLOCK
      ?auto_191156 - BLOCK
    )
    :vars
    (
      ?auto_191157 - BLOCK
      ?auto_191159 - BLOCK
      ?auto_191158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191151 ?auto_191152 ) ) ( not ( = ?auto_191151 ?auto_191153 ) ) ( not ( = ?auto_191151 ?auto_191154 ) ) ( not ( = ?auto_191151 ?auto_191155 ) ) ( not ( = ?auto_191151 ?auto_191156 ) ) ( not ( = ?auto_191152 ?auto_191153 ) ) ( not ( = ?auto_191152 ?auto_191154 ) ) ( not ( = ?auto_191152 ?auto_191155 ) ) ( not ( = ?auto_191152 ?auto_191156 ) ) ( not ( = ?auto_191153 ?auto_191154 ) ) ( not ( = ?auto_191153 ?auto_191155 ) ) ( not ( = ?auto_191153 ?auto_191156 ) ) ( not ( = ?auto_191154 ?auto_191155 ) ) ( not ( = ?auto_191154 ?auto_191156 ) ) ( not ( = ?auto_191155 ?auto_191156 ) ) ( not ( = ?auto_191151 ?auto_191157 ) ) ( not ( = ?auto_191152 ?auto_191157 ) ) ( not ( = ?auto_191153 ?auto_191157 ) ) ( not ( = ?auto_191154 ?auto_191157 ) ) ( not ( = ?auto_191155 ?auto_191157 ) ) ( not ( = ?auto_191156 ?auto_191157 ) ) ( ON-TABLE ?auto_191159 ) ( ON ?auto_191157 ?auto_191159 ) ( not ( = ?auto_191159 ?auto_191157 ) ) ( not ( = ?auto_191159 ?auto_191156 ) ) ( not ( = ?auto_191159 ?auto_191155 ) ) ( not ( = ?auto_191151 ?auto_191159 ) ) ( not ( = ?auto_191152 ?auto_191159 ) ) ( not ( = ?auto_191153 ?auto_191159 ) ) ( not ( = ?auto_191154 ?auto_191159 ) ) ( ON ?auto_191151 ?auto_191158 ) ( not ( = ?auto_191151 ?auto_191158 ) ) ( not ( = ?auto_191152 ?auto_191158 ) ) ( not ( = ?auto_191153 ?auto_191158 ) ) ( not ( = ?auto_191154 ?auto_191158 ) ) ( not ( = ?auto_191155 ?auto_191158 ) ) ( not ( = ?auto_191156 ?auto_191158 ) ) ( not ( = ?auto_191157 ?auto_191158 ) ) ( not ( = ?auto_191159 ?auto_191158 ) ) ( ON ?auto_191152 ?auto_191151 ) ( ON-TABLE ?auto_191158 ) ( ON ?auto_191153 ?auto_191152 ) ( ON ?auto_191154 ?auto_191153 ) ( ON ?auto_191155 ?auto_191154 ) ( CLEAR ?auto_191157 ) ( ON ?auto_191156 ?auto_191155 ) ( CLEAR ?auto_191156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191158 ?auto_191151 ?auto_191152 ?auto_191153 ?auto_191154 ?auto_191155 )
      ( MAKE-6PILE ?auto_191151 ?auto_191152 ?auto_191153 ?auto_191154 ?auto_191155 ?auto_191156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191160 - BLOCK
      ?auto_191161 - BLOCK
      ?auto_191162 - BLOCK
      ?auto_191163 - BLOCK
      ?auto_191164 - BLOCK
      ?auto_191165 - BLOCK
    )
    :vars
    (
      ?auto_191167 - BLOCK
      ?auto_191166 - BLOCK
      ?auto_191168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191160 ?auto_191161 ) ) ( not ( = ?auto_191160 ?auto_191162 ) ) ( not ( = ?auto_191160 ?auto_191163 ) ) ( not ( = ?auto_191160 ?auto_191164 ) ) ( not ( = ?auto_191160 ?auto_191165 ) ) ( not ( = ?auto_191161 ?auto_191162 ) ) ( not ( = ?auto_191161 ?auto_191163 ) ) ( not ( = ?auto_191161 ?auto_191164 ) ) ( not ( = ?auto_191161 ?auto_191165 ) ) ( not ( = ?auto_191162 ?auto_191163 ) ) ( not ( = ?auto_191162 ?auto_191164 ) ) ( not ( = ?auto_191162 ?auto_191165 ) ) ( not ( = ?auto_191163 ?auto_191164 ) ) ( not ( = ?auto_191163 ?auto_191165 ) ) ( not ( = ?auto_191164 ?auto_191165 ) ) ( not ( = ?auto_191160 ?auto_191167 ) ) ( not ( = ?auto_191161 ?auto_191167 ) ) ( not ( = ?auto_191162 ?auto_191167 ) ) ( not ( = ?auto_191163 ?auto_191167 ) ) ( not ( = ?auto_191164 ?auto_191167 ) ) ( not ( = ?auto_191165 ?auto_191167 ) ) ( ON-TABLE ?auto_191166 ) ( not ( = ?auto_191166 ?auto_191167 ) ) ( not ( = ?auto_191166 ?auto_191165 ) ) ( not ( = ?auto_191166 ?auto_191164 ) ) ( not ( = ?auto_191160 ?auto_191166 ) ) ( not ( = ?auto_191161 ?auto_191166 ) ) ( not ( = ?auto_191162 ?auto_191166 ) ) ( not ( = ?auto_191163 ?auto_191166 ) ) ( ON ?auto_191160 ?auto_191168 ) ( not ( = ?auto_191160 ?auto_191168 ) ) ( not ( = ?auto_191161 ?auto_191168 ) ) ( not ( = ?auto_191162 ?auto_191168 ) ) ( not ( = ?auto_191163 ?auto_191168 ) ) ( not ( = ?auto_191164 ?auto_191168 ) ) ( not ( = ?auto_191165 ?auto_191168 ) ) ( not ( = ?auto_191167 ?auto_191168 ) ) ( not ( = ?auto_191166 ?auto_191168 ) ) ( ON ?auto_191161 ?auto_191160 ) ( ON-TABLE ?auto_191168 ) ( ON ?auto_191162 ?auto_191161 ) ( ON ?auto_191163 ?auto_191162 ) ( ON ?auto_191164 ?auto_191163 ) ( ON ?auto_191165 ?auto_191164 ) ( CLEAR ?auto_191165 ) ( HOLDING ?auto_191167 ) ( CLEAR ?auto_191166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191166 ?auto_191167 )
      ( MAKE-6PILE ?auto_191160 ?auto_191161 ?auto_191162 ?auto_191163 ?auto_191164 ?auto_191165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191169 - BLOCK
      ?auto_191170 - BLOCK
      ?auto_191171 - BLOCK
      ?auto_191172 - BLOCK
      ?auto_191173 - BLOCK
      ?auto_191174 - BLOCK
    )
    :vars
    (
      ?auto_191176 - BLOCK
      ?auto_191177 - BLOCK
      ?auto_191175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191169 ?auto_191170 ) ) ( not ( = ?auto_191169 ?auto_191171 ) ) ( not ( = ?auto_191169 ?auto_191172 ) ) ( not ( = ?auto_191169 ?auto_191173 ) ) ( not ( = ?auto_191169 ?auto_191174 ) ) ( not ( = ?auto_191170 ?auto_191171 ) ) ( not ( = ?auto_191170 ?auto_191172 ) ) ( not ( = ?auto_191170 ?auto_191173 ) ) ( not ( = ?auto_191170 ?auto_191174 ) ) ( not ( = ?auto_191171 ?auto_191172 ) ) ( not ( = ?auto_191171 ?auto_191173 ) ) ( not ( = ?auto_191171 ?auto_191174 ) ) ( not ( = ?auto_191172 ?auto_191173 ) ) ( not ( = ?auto_191172 ?auto_191174 ) ) ( not ( = ?auto_191173 ?auto_191174 ) ) ( not ( = ?auto_191169 ?auto_191176 ) ) ( not ( = ?auto_191170 ?auto_191176 ) ) ( not ( = ?auto_191171 ?auto_191176 ) ) ( not ( = ?auto_191172 ?auto_191176 ) ) ( not ( = ?auto_191173 ?auto_191176 ) ) ( not ( = ?auto_191174 ?auto_191176 ) ) ( ON-TABLE ?auto_191177 ) ( not ( = ?auto_191177 ?auto_191176 ) ) ( not ( = ?auto_191177 ?auto_191174 ) ) ( not ( = ?auto_191177 ?auto_191173 ) ) ( not ( = ?auto_191169 ?auto_191177 ) ) ( not ( = ?auto_191170 ?auto_191177 ) ) ( not ( = ?auto_191171 ?auto_191177 ) ) ( not ( = ?auto_191172 ?auto_191177 ) ) ( ON ?auto_191169 ?auto_191175 ) ( not ( = ?auto_191169 ?auto_191175 ) ) ( not ( = ?auto_191170 ?auto_191175 ) ) ( not ( = ?auto_191171 ?auto_191175 ) ) ( not ( = ?auto_191172 ?auto_191175 ) ) ( not ( = ?auto_191173 ?auto_191175 ) ) ( not ( = ?auto_191174 ?auto_191175 ) ) ( not ( = ?auto_191176 ?auto_191175 ) ) ( not ( = ?auto_191177 ?auto_191175 ) ) ( ON ?auto_191170 ?auto_191169 ) ( ON-TABLE ?auto_191175 ) ( ON ?auto_191171 ?auto_191170 ) ( ON ?auto_191172 ?auto_191171 ) ( ON ?auto_191173 ?auto_191172 ) ( ON ?auto_191174 ?auto_191173 ) ( CLEAR ?auto_191177 ) ( ON ?auto_191176 ?auto_191174 ) ( CLEAR ?auto_191176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191175 ?auto_191169 ?auto_191170 ?auto_191171 ?auto_191172 ?auto_191173 ?auto_191174 )
      ( MAKE-6PILE ?auto_191169 ?auto_191170 ?auto_191171 ?auto_191172 ?auto_191173 ?auto_191174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191178 - BLOCK
      ?auto_191179 - BLOCK
      ?auto_191180 - BLOCK
      ?auto_191181 - BLOCK
      ?auto_191182 - BLOCK
      ?auto_191183 - BLOCK
    )
    :vars
    (
      ?auto_191184 - BLOCK
      ?auto_191185 - BLOCK
      ?auto_191186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191178 ?auto_191179 ) ) ( not ( = ?auto_191178 ?auto_191180 ) ) ( not ( = ?auto_191178 ?auto_191181 ) ) ( not ( = ?auto_191178 ?auto_191182 ) ) ( not ( = ?auto_191178 ?auto_191183 ) ) ( not ( = ?auto_191179 ?auto_191180 ) ) ( not ( = ?auto_191179 ?auto_191181 ) ) ( not ( = ?auto_191179 ?auto_191182 ) ) ( not ( = ?auto_191179 ?auto_191183 ) ) ( not ( = ?auto_191180 ?auto_191181 ) ) ( not ( = ?auto_191180 ?auto_191182 ) ) ( not ( = ?auto_191180 ?auto_191183 ) ) ( not ( = ?auto_191181 ?auto_191182 ) ) ( not ( = ?auto_191181 ?auto_191183 ) ) ( not ( = ?auto_191182 ?auto_191183 ) ) ( not ( = ?auto_191178 ?auto_191184 ) ) ( not ( = ?auto_191179 ?auto_191184 ) ) ( not ( = ?auto_191180 ?auto_191184 ) ) ( not ( = ?auto_191181 ?auto_191184 ) ) ( not ( = ?auto_191182 ?auto_191184 ) ) ( not ( = ?auto_191183 ?auto_191184 ) ) ( not ( = ?auto_191185 ?auto_191184 ) ) ( not ( = ?auto_191185 ?auto_191183 ) ) ( not ( = ?auto_191185 ?auto_191182 ) ) ( not ( = ?auto_191178 ?auto_191185 ) ) ( not ( = ?auto_191179 ?auto_191185 ) ) ( not ( = ?auto_191180 ?auto_191185 ) ) ( not ( = ?auto_191181 ?auto_191185 ) ) ( ON ?auto_191178 ?auto_191186 ) ( not ( = ?auto_191178 ?auto_191186 ) ) ( not ( = ?auto_191179 ?auto_191186 ) ) ( not ( = ?auto_191180 ?auto_191186 ) ) ( not ( = ?auto_191181 ?auto_191186 ) ) ( not ( = ?auto_191182 ?auto_191186 ) ) ( not ( = ?auto_191183 ?auto_191186 ) ) ( not ( = ?auto_191184 ?auto_191186 ) ) ( not ( = ?auto_191185 ?auto_191186 ) ) ( ON ?auto_191179 ?auto_191178 ) ( ON-TABLE ?auto_191186 ) ( ON ?auto_191180 ?auto_191179 ) ( ON ?auto_191181 ?auto_191180 ) ( ON ?auto_191182 ?auto_191181 ) ( ON ?auto_191183 ?auto_191182 ) ( ON ?auto_191184 ?auto_191183 ) ( CLEAR ?auto_191184 ) ( HOLDING ?auto_191185 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191185 )
      ( MAKE-6PILE ?auto_191178 ?auto_191179 ?auto_191180 ?auto_191181 ?auto_191182 ?auto_191183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_191187 - BLOCK
      ?auto_191188 - BLOCK
      ?auto_191189 - BLOCK
      ?auto_191190 - BLOCK
      ?auto_191191 - BLOCK
      ?auto_191192 - BLOCK
    )
    :vars
    (
      ?auto_191195 - BLOCK
      ?auto_191194 - BLOCK
      ?auto_191193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191187 ?auto_191188 ) ) ( not ( = ?auto_191187 ?auto_191189 ) ) ( not ( = ?auto_191187 ?auto_191190 ) ) ( not ( = ?auto_191187 ?auto_191191 ) ) ( not ( = ?auto_191187 ?auto_191192 ) ) ( not ( = ?auto_191188 ?auto_191189 ) ) ( not ( = ?auto_191188 ?auto_191190 ) ) ( not ( = ?auto_191188 ?auto_191191 ) ) ( not ( = ?auto_191188 ?auto_191192 ) ) ( not ( = ?auto_191189 ?auto_191190 ) ) ( not ( = ?auto_191189 ?auto_191191 ) ) ( not ( = ?auto_191189 ?auto_191192 ) ) ( not ( = ?auto_191190 ?auto_191191 ) ) ( not ( = ?auto_191190 ?auto_191192 ) ) ( not ( = ?auto_191191 ?auto_191192 ) ) ( not ( = ?auto_191187 ?auto_191195 ) ) ( not ( = ?auto_191188 ?auto_191195 ) ) ( not ( = ?auto_191189 ?auto_191195 ) ) ( not ( = ?auto_191190 ?auto_191195 ) ) ( not ( = ?auto_191191 ?auto_191195 ) ) ( not ( = ?auto_191192 ?auto_191195 ) ) ( not ( = ?auto_191194 ?auto_191195 ) ) ( not ( = ?auto_191194 ?auto_191192 ) ) ( not ( = ?auto_191194 ?auto_191191 ) ) ( not ( = ?auto_191187 ?auto_191194 ) ) ( not ( = ?auto_191188 ?auto_191194 ) ) ( not ( = ?auto_191189 ?auto_191194 ) ) ( not ( = ?auto_191190 ?auto_191194 ) ) ( ON ?auto_191187 ?auto_191193 ) ( not ( = ?auto_191187 ?auto_191193 ) ) ( not ( = ?auto_191188 ?auto_191193 ) ) ( not ( = ?auto_191189 ?auto_191193 ) ) ( not ( = ?auto_191190 ?auto_191193 ) ) ( not ( = ?auto_191191 ?auto_191193 ) ) ( not ( = ?auto_191192 ?auto_191193 ) ) ( not ( = ?auto_191195 ?auto_191193 ) ) ( not ( = ?auto_191194 ?auto_191193 ) ) ( ON ?auto_191188 ?auto_191187 ) ( ON-TABLE ?auto_191193 ) ( ON ?auto_191189 ?auto_191188 ) ( ON ?auto_191190 ?auto_191189 ) ( ON ?auto_191191 ?auto_191190 ) ( ON ?auto_191192 ?auto_191191 ) ( ON ?auto_191195 ?auto_191192 ) ( ON ?auto_191194 ?auto_191195 ) ( CLEAR ?auto_191194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191193 ?auto_191187 ?auto_191188 ?auto_191189 ?auto_191190 ?auto_191191 ?auto_191192 ?auto_191195 )
      ( MAKE-6PILE ?auto_191187 ?auto_191188 ?auto_191189 ?auto_191190 ?auto_191191 ?auto_191192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191197 - BLOCK
    )
    :vars
    (
      ?auto_191198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191198 ?auto_191197 ) ( CLEAR ?auto_191198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191197 ) ( not ( = ?auto_191197 ?auto_191198 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191198 ?auto_191197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191199 - BLOCK
    )
    :vars
    (
      ?auto_191200 - BLOCK
      ?auto_191201 - BLOCK
      ?auto_191202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191200 ?auto_191199 ) ( CLEAR ?auto_191200 ) ( ON-TABLE ?auto_191199 ) ( not ( = ?auto_191199 ?auto_191200 ) ) ( HOLDING ?auto_191201 ) ( CLEAR ?auto_191202 ) ( not ( = ?auto_191199 ?auto_191201 ) ) ( not ( = ?auto_191199 ?auto_191202 ) ) ( not ( = ?auto_191200 ?auto_191201 ) ) ( not ( = ?auto_191200 ?auto_191202 ) ) ( not ( = ?auto_191201 ?auto_191202 ) ) )
    :subtasks
    ( ( !STACK ?auto_191201 ?auto_191202 )
      ( MAKE-1PILE ?auto_191199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191203 - BLOCK
    )
    :vars
    (
      ?auto_191205 - BLOCK
      ?auto_191206 - BLOCK
      ?auto_191204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191205 ?auto_191203 ) ( ON-TABLE ?auto_191203 ) ( not ( = ?auto_191203 ?auto_191205 ) ) ( CLEAR ?auto_191206 ) ( not ( = ?auto_191203 ?auto_191204 ) ) ( not ( = ?auto_191203 ?auto_191206 ) ) ( not ( = ?auto_191205 ?auto_191204 ) ) ( not ( = ?auto_191205 ?auto_191206 ) ) ( not ( = ?auto_191204 ?auto_191206 ) ) ( ON ?auto_191204 ?auto_191205 ) ( CLEAR ?auto_191204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191203 ?auto_191205 )
      ( MAKE-1PILE ?auto_191203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191207 - BLOCK
    )
    :vars
    (
      ?auto_191208 - BLOCK
      ?auto_191209 - BLOCK
      ?auto_191210 - BLOCK
      ?auto_191212 - BLOCK
      ?auto_191213 - BLOCK
      ?auto_191214 - BLOCK
      ?auto_191211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191208 ?auto_191207 ) ( ON-TABLE ?auto_191207 ) ( not ( = ?auto_191207 ?auto_191208 ) ) ( not ( = ?auto_191207 ?auto_191209 ) ) ( not ( = ?auto_191207 ?auto_191210 ) ) ( not ( = ?auto_191208 ?auto_191209 ) ) ( not ( = ?auto_191208 ?auto_191210 ) ) ( not ( = ?auto_191209 ?auto_191210 ) ) ( ON ?auto_191209 ?auto_191208 ) ( CLEAR ?auto_191209 ) ( HOLDING ?auto_191210 ) ( CLEAR ?auto_191212 ) ( ON-TABLE ?auto_191213 ) ( ON ?auto_191214 ?auto_191213 ) ( ON ?auto_191211 ?auto_191214 ) ( ON ?auto_191212 ?auto_191211 ) ( not ( = ?auto_191213 ?auto_191214 ) ) ( not ( = ?auto_191213 ?auto_191211 ) ) ( not ( = ?auto_191213 ?auto_191212 ) ) ( not ( = ?auto_191213 ?auto_191210 ) ) ( not ( = ?auto_191214 ?auto_191211 ) ) ( not ( = ?auto_191214 ?auto_191212 ) ) ( not ( = ?auto_191214 ?auto_191210 ) ) ( not ( = ?auto_191211 ?auto_191212 ) ) ( not ( = ?auto_191211 ?auto_191210 ) ) ( not ( = ?auto_191212 ?auto_191210 ) ) ( not ( = ?auto_191207 ?auto_191212 ) ) ( not ( = ?auto_191207 ?auto_191213 ) ) ( not ( = ?auto_191207 ?auto_191214 ) ) ( not ( = ?auto_191207 ?auto_191211 ) ) ( not ( = ?auto_191208 ?auto_191212 ) ) ( not ( = ?auto_191208 ?auto_191213 ) ) ( not ( = ?auto_191208 ?auto_191214 ) ) ( not ( = ?auto_191208 ?auto_191211 ) ) ( not ( = ?auto_191209 ?auto_191212 ) ) ( not ( = ?auto_191209 ?auto_191213 ) ) ( not ( = ?auto_191209 ?auto_191214 ) ) ( not ( = ?auto_191209 ?auto_191211 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191213 ?auto_191214 ?auto_191211 ?auto_191212 ?auto_191210 )
      ( MAKE-1PILE ?auto_191207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191215 - BLOCK
    )
    :vars
    (
      ?auto_191216 - BLOCK
      ?auto_191219 - BLOCK
      ?auto_191222 - BLOCK
      ?auto_191218 - BLOCK
      ?auto_191220 - BLOCK
      ?auto_191217 - BLOCK
      ?auto_191221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191216 ?auto_191215 ) ( ON-TABLE ?auto_191215 ) ( not ( = ?auto_191215 ?auto_191216 ) ) ( not ( = ?auto_191215 ?auto_191219 ) ) ( not ( = ?auto_191215 ?auto_191222 ) ) ( not ( = ?auto_191216 ?auto_191219 ) ) ( not ( = ?auto_191216 ?auto_191222 ) ) ( not ( = ?auto_191219 ?auto_191222 ) ) ( ON ?auto_191219 ?auto_191216 ) ( CLEAR ?auto_191218 ) ( ON-TABLE ?auto_191220 ) ( ON ?auto_191217 ?auto_191220 ) ( ON ?auto_191221 ?auto_191217 ) ( ON ?auto_191218 ?auto_191221 ) ( not ( = ?auto_191220 ?auto_191217 ) ) ( not ( = ?auto_191220 ?auto_191221 ) ) ( not ( = ?auto_191220 ?auto_191218 ) ) ( not ( = ?auto_191220 ?auto_191222 ) ) ( not ( = ?auto_191217 ?auto_191221 ) ) ( not ( = ?auto_191217 ?auto_191218 ) ) ( not ( = ?auto_191217 ?auto_191222 ) ) ( not ( = ?auto_191221 ?auto_191218 ) ) ( not ( = ?auto_191221 ?auto_191222 ) ) ( not ( = ?auto_191218 ?auto_191222 ) ) ( not ( = ?auto_191215 ?auto_191218 ) ) ( not ( = ?auto_191215 ?auto_191220 ) ) ( not ( = ?auto_191215 ?auto_191217 ) ) ( not ( = ?auto_191215 ?auto_191221 ) ) ( not ( = ?auto_191216 ?auto_191218 ) ) ( not ( = ?auto_191216 ?auto_191220 ) ) ( not ( = ?auto_191216 ?auto_191217 ) ) ( not ( = ?auto_191216 ?auto_191221 ) ) ( not ( = ?auto_191219 ?auto_191218 ) ) ( not ( = ?auto_191219 ?auto_191220 ) ) ( not ( = ?auto_191219 ?auto_191217 ) ) ( not ( = ?auto_191219 ?auto_191221 ) ) ( ON ?auto_191222 ?auto_191219 ) ( CLEAR ?auto_191222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191215 ?auto_191216 ?auto_191219 )
      ( MAKE-1PILE ?auto_191215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191223 - BLOCK
    )
    :vars
    (
      ?auto_191229 - BLOCK
      ?auto_191224 - BLOCK
      ?auto_191228 - BLOCK
      ?auto_191230 - BLOCK
      ?auto_191226 - BLOCK
      ?auto_191227 - BLOCK
      ?auto_191225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191229 ?auto_191223 ) ( ON-TABLE ?auto_191223 ) ( not ( = ?auto_191223 ?auto_191229 ) ) ( not ( = ?auto_191223 ?auto_191224 ) ) ( not ( = ?auto_191223 ?auto_191228 ) ) ( not ( = ?auto_191229 ?auto_191224 ) ) ( not ( = ?auto_191229 ?auto_191228 ) ) ( not ( = ?auto_191224 ?auto_191228 ) ) ( ON ?auto_191224 ?auto_191229 ) ( ON-TABLE ?auto_191230 ) ( ON ?auto_191226 ?auto_191230 ) ( ON ?auto_191227 ?auto_191226 ) ( not ( = ?auto_191230 ?auto_191226 ) ) ( not ( = ?auto_191230 ?auto_191227 ) ) ( not ( = ?auto_191230 ?auto_191225 ) ) ( not ( = ?auto_191230 ?auto_191228 ) ) ( not ( = ?auto_191226 ?auto_191227 ) ) ( not ( = ?auto_191226 ?auto_191225 ) ) ( not ( = ?auto_191226 ?auto_191228 ) ) ( not ( = ?auto_191227 ?auto_191225 ) ) ( not ( = ?auto_191227 ?auto_191228 ) ) ( not ( = ?auto_191225 ?auto_191228 ) ) ( not ( = ?auto_191223 ?auto_191225 ) ) ( not ( = ?auto_191223 ?auto_191230 ) ) ( not ( = ?auto_191223 ?auto_191226 ) ) ( not ( = ?auto_191223 ?auto_191227 ) ) ( not ( = ?auto_191229 ?auto_191225 ) ) ( not ( = ?auto_191229 ?auto_191230 ) ) ( not ( = ?auto_191229 ?auto_191226 ) ) ( not ( = ?auto_191229 ?auto_191227 ) ) ( not ( = ?auto_191224 ?auto_191225 ) ) ( not ( = ?auto_191224 ?auto_191230 ) ) ( not ( = ?auto_191224 ?auto_191226 ) ) ( not ( = ?auto_191224 ?auto_191227 ) ) ( ON ?auto_191228 ?auto_191224 ) ( CLEAR ?auto_191228 ) ( HOLDING ?auto_191225 ) ( CLEAR ?auto_191227 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191230 ?auto_191226 ?auto_191227 ?auto_191225 )
      ( MAKE-1PILE ?auto_191223 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191231 - BLOCK
    )
    :vars
    (
      ?auto_191235 - BLOCK
      ?auto_191238 - BLOCK
      ?auto_191233 - BLOCK
      ?auto_191234 - BLOCK
      ?auto_191236 - BLOCK
      ?auto_191237 - BLOCK
      ?auto_191232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191235 ?auto_191231 ) ( ON-TABLE ?auto_191231 ) ( not ( = ?auto_191231 ?auto_191235 ) ) ( not ( = ?auto_191231 ?auto_191238 ) ) ( not ( = ?auto_191231 ?auto_191233 ) ) ( not ( = ?auto_191235 ?auto_191238 ) ) ( not ( = ?auto_191235 ?auto_191233 ) ) ( not ( = ?auto_191238 ?auto_191233 ) ) ( ON ?auto_191238 ?auto_191235 ) ( ON-TABLE ?auto_191234 ) ( ON ?auto_191236 ?auto_191234 ) ( ON ?auto_191237 ?auto_191236 ) ( not ( = ?auto_191234 ?auto_191236 ) ) ( not ( = ?auto_191234 ?auto_191237 ) ) ( not ( = ?auto_191234 ?auto_191232 ) ) ( not ( = ?auto_191234 ?auto_191233 ) ) ( not ( = ?auto_191236 ?auto_191237 ) ) ( not ( = ?auto_191236 ?auto_191232 ) ) ( not ( = ?auto_191236 ?auto_191233 ) ) ( not ( = ?auto_191237 ?auto_191232 ) ) ( not ( = ?auto_191237 ?auto_191233 ) ) ( not ( = ?auto_191232 ?auto_191233 ) ) ( not ( = ?auto_191231 ?auto_191232 ) ) ( not ( = ?auto_191231 ?auto_191234 ) ) ( not ( = ?auto_191231 ?auto_191236 ) ) ( not ( = ?auto_191231 ?auto_191237 ) ) ( not ( = ?auto_191235 ?auto_191232 ) ) ( not ( = ?auto_191235 ?auto_191234 ) ) ( not ( = ?auto_191235 ?auto_191236 ) ) ( not ( = ?auto_191235 ?auto_191237 ) ) ( not ( = ?auto_191238 ?auto_191232 ) ) ( not ( = ?auto_191238 ?auto_191234 ) ) ( not ( = ?auto_191238 ?auto_191236 ) ) ( not ( = ?auto_191238 ?auto_191237 ) ) ( ON ?auto_191233 ?auto_191238 ) ( CLEAR ?auto_191237 ) ( ON ?auto_191232 ?auto_191233 ) ( CLEAR ?auto_191232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191231 ?auto_191235 ?auto_191238 ?auto_191233 )
      ( MAKE-1PILE ?auto_191231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191239 - BLOCK
    )
    :vars
    (
      ?auto_191243 - BLOCK
      ?auto_191246 - BLOCK
      ?auto_191244 - BLOCK
      ?auto_191240 - BLOCK
      ?auto_191241 - BLOCK
      ?auto_191242 - BLOCK
      ?auto_191245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191243 ?auto_191239 ) ( ON-TABLE ?auto_191239 ) ( not ( = ?auto_191239 ?auto_191243 ) ) ( not ( = ?auto_191239 ?auto_191246 ) ) ( not ( = ?auto_191239 ?auto_191244 ) ) ( not ( = ?auto_191243 ?auto_191246 ) ) ( not ( = ?auto_191243 ?auto_191244 ) ) ( not ( = ?auto_191246 ?auto_191244 ) ) ( ON ?auto_191246 ?auto_191243 ) ( ON-TABLE ?auto_191240 ) ( ON ?auto_191241 ?auto_191240 ) ( not ( = ?auto_191240 ?auto_191241 ) ) ( not ( = ?auto_191240 ?auto_191242 ) ) ( not ( = ?auto_191240 ?auto_191245 ) ) ( not ( = ?auto_191240 ?auto_191244 ) ) ( not ( = ?auto_191241 ?auto_191242 ) ) ( not ( = ?auto_191241 ?auto_191245 ) ) ( not ( = ?auto_191241 ?auto_191244 ) ) ( not ( = ?auto_191242 ?auto_191245 ) ) ( not ( = ?auto_191242 ?auto_191244 ) ) ( not ( = ?auto_191245 ?auto_191244 ) ) ( not ( = ?auto_191239 ?auto_191245 ) ) ( not ( = ?auto_191239 ?auto_191240 ) ) ( not ( = ?auto_191239 ?auto_191241 ) ) ( not ( = ?auto_191239 ?auto_191242 ) ) ( not ( = ?auto_191243 ?auto_191245 ) ) ( not ( = ?auto_191243 ?auto_191240 ) ) ( not ( = ?auto_191243 ?auto_191241 ) ) ( not ( = ?auto_191243 ?auto_191242 ) ) ( not ( = ?auto_191246 ?auto_191245 ) ) ( not ( = ?auto_191246 ?auto_191240 ) ) ( not ( = ?auto_191246 ?auto_191241 ) ) ( not ( = ?auto_191246 ?auto_191242 ) ) ( ON ?auto_191244 ?auto_191246 ) ( ON ?auto_191245 ?auto_191244 ) ( CLEAR ?auto_191245 ) ( HOLDING ?auto_191242 ) ( CLEAR ?auto_191241 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191240 ?auto_191241 ?auto_191242 )
      ( MAKE-1PILE ?auto_191239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191247 - BLOCK
    )
    :vars
    (
      ?auto_191249 - BLOCK
      ?auto_191250 - BLOCK
      ?auto_191254 - BLOCK
      ?auto_191253 - BLOCK
      ?auto_191251 - BLOCK
      ?auto_191252 - BLOCK
      ?auto_191248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191249 ?auto_191247 ) ( ON-TABLE ?auto_191247 ) ( not ( = ?auto_191247 ?auto_191249 ) ) ( not ( = ?auto_191247 ?auto_191250 ) ) ( not ( = ?auto_191247 ?auto_191254 ) ) ( not ( = ?auto_191249 ?auto_191250 ) ) ( not ( = ?auto_191249 ?auto_191254 ) ) ( not ( = ?auto_191250 ?auto_191254 ) ) ( ON ?auto_191250 ?auto_191249 ) ( ON-TABLE ?auto_191253 ) ( ON ?auto_191251 ?auto_191253 ) ( not ( = ?auto_191253 ?auto_191251 ) ) ( not ( = ?auto_191253 ?auto_191252 ) ) ( not ( = ?auto_191253 ?auto_191248 ) ) ( not ( = ?auto_191253 ?auto_191254 ) ) ( not ( = ?auto_191251 ?auto_191252 ) ) ( not ( = ?auto_191251 ?auto_191248 ) ) ( not ( = ?auto_191251 ?auto_191254 ) ) ( not ( = ?auto_191252 ?auto_191248 ) ) ( not ( = ?auto_191252 ?auto_191254 ) ) ( not ( = ?auto_191248 ?auto_191254 ) ) ( not ( = ?auto_191247 ?auto_191248 ) ) ( not ( = ?auto_191247 ?auto_191253 ) ) ( not ( = ?auto_191247 ?auto_191251 ) ) ( not ( = ?auto_191247 ?auto_191252 ) ) ( not ( = ?auto_191249 ?auto_191248 ) ) ( not ( = ?auto_191249 ?auto_191253 ) ) ( not ( = ?auto_191249 ?auto_191251 ) ) ( not ( = ?auto_191249 ?auto_191252 ) ) ( not ( = ?auto_191250 ?auto_191248 ) ) ( not ( = ?auto_191250 ?auto_191253 ) ) ( not ( = ?auto_191250 ?auto_191251 ) ) ( not ( = ?auto_191250 ?auto_191252 ) ) ( ON ?auto_191254 ?auto_191250 ) ( ON ?auto_191248 ?auto_191254 ) ( CLEAR ?auto_191251 ) ( ON ?auto_191252 ?auto_191248 ) ( CLEAR ?auto_191252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191247 ?auto_191249 ?auto_191250 ?auto_191254 ?auto_191248 )
      ( MAKE-1PILE ?auto_191247 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191255 - BLOCK
    )
    :vars
    (
      ?auto_191256 - BLOCK
      ?auto_191258 - BLOCK
      ?auto_191261 - BLOCK
      ?auto_191262 - BLOCK
      ?auto_191257 - BLOCK
      ?auto_191259 - BLOCK
      ?auto_191260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191256 ?auto_191255 ) ( ON-TABLE ?auto_191255 ) ( not ( = ?auto_191255 ?auto_191256 ) ) ( not ( = ?auto_191255 ?auto_191258 ) ) ( not ( = ?auto_191255 ?auto_191261 ) ) ( not ( = ?auto_191256 ?auto_191258 ) ) ( not ( = ?auto_191256 ?auto_191261 ) ) ( not ( = ?auto_191258 ?auto_191261 ) ) ( ON ?auto_191258 ?auto_191256 ) ( ON-TABLE ?auto_191262 ) ( not ( = ?auto_191262 ?auto_191257 ) ) ( not ( = ?auto_191262 ?auto_191259 ) ) ( not ( = ?auto_191262 ?auto_191260 ) ) ( not ( = ?auto_191262 ?auto_191261 ) ) ( not ( = ?auto_191257 ?auto_191259 ) ) ( not ( = ?auto_191257 ?auto_191260 ) ) ( not ( = ?auto_191257 ?auto_191261 ) ) ( not ( = ?auto_191259 ?auto_191260 ) ) ( not ( = ?auto_191259 ?auto_191261 ) ) ( not ( = ?auto_191260 ?auto_191261 ) ) ( not ( = ?auto_191255 ?auto_191260 ) ) ( not ( = ?auto_191255 ?auto_191262 ) ) ( not ( = ?auto_191255 ?auto_191257 ) ) ( not ( = ?auto_191255 ?auto_191259 ) ) ( not ( = ?auto_191256 ?auto_191260 ) ) ( not ( = ?auto_191256 ?auto_191262 ) ) ( not ( = ?auto_191256 ?auto_191257 ) ) ( not ( = ?auto_191256 ?auto_191259 ) ) ( not ( = ?auto_191258 ?auto_191260 ) ) ( not ( = ?auto_191258 ?auto_191262 ) ) ( not ( = ?auto_191258 ?auto_191257 ) ) ( not ( = ?auto_191258 ?auto_191259 ) ) ( ON ?auto_191261 ?auto_191258 ) ( ON ?auto_191260 ?auto_191261 ) ( ON ?auto_191259 ?auto_191260 ) ( CLEAR ?auto_191259 ) ( HOLDING ?auto_191257 ) ( CLEAR ?auto_191262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191262 ?auto_191257 )
      ( MAKE-1PILE ?auto_191255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191263 - BLOCK
    )
    :vars
    (
      ?auto_191269 - BLOCK
      ?auto_191266 - BLOCK
      ?auto_191268 - BLOCK
      ?auto_191264 - BLOCK
      ?auto_191270 - BLOCK
      ?auto_191267 - BLOCK
      ?auto_191265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191269 ?auto_191263 ) ( ON-TABLE ?auto_191263 ) ( not ( = ?auto_191263 ?auto_191269 ) ) ( not ( = ?auto_191263 ?auto_191266 ) ) ( not ( = ?auto_191263 ?auto_191268 ) ) ( not ( = ?auto_191269 ?auto_191266 ) ) ( not ( = ?auto_191269 ?auto_191268 ) ) ( not ( = ?auto_191266 ?auto_191268 ) ) ( ON ?auto_191266 ?auto_191269 ) ( ON-TABLE ?auto_191264 ) ( not ( = ?auto_191264 ?auto_191270 ) ) ( not ( = ?auto_191264 ?auto_191267 ) ) ( not ( = ?auto_191264 ?auto_191265 ) ) ( not ( = ?auto_191264 ?auto_191268 ) ) ( not ( = ?auto_191270 ?auto_191267 ) ) ( not ( = ?auto_191270 ?auto_191265 ) ) ( not ( = ?auto_191270 ?auto_191268 ) ) ( not ( = ?auto_191267 ?auto_191265 ) ) ( not ( = ?auto_191267 ?auto_191268 ) ) ( not ( = ?auto_191265 ?auto_191268 ) ) ( not ( = ?auto_191263 ?auto_191265 ) ) ( not ( = ?auto_191263 ?auto_191264 ) ) ( not ( = ?auto_191263 ?auto_191270 ) ) ( not ( = ?auto_191263 ?auto_191267 ) ) ( not ( = ?auto_191269 ?auto_191265 ) ) ( not ( = ?auto_191269 ?auto_191264 ) ) ( not ( = ?auto_191269 ?auto_191270 ) ) ( not ( = ?auto_191269 ?auto_191267 ) ) ( not ( = ?auto_191266 ?auto_191265 ) ) ( not ( = ?auto_191266 ?auto_191264 ) ) ( not ( = ?auto_191266 ?auto_191270 ) ) ( not ( = ?auto_191266 ?auto_191267 ) ) ( ON ?auto_191268 ?auto_191266 ) ( ON ?auto_191265 ?auto_191268 ) ( ON ?auto_191267 ?auto_191265 ) ( CLEAR ?auto_191264 ) ( ON ?auto_191270 ?auto_191267 ) ( CLEAR ?auto_191270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191263 ?auto_191269 ?auto_191266 ?auto_191268 ?auto_191265 ?auto_191267 )
      ( MAKE-1PILE ?auto_191263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191271 - BLOCK
    )
    :vars
    (
      ?auto_191278 - BLOCK
      ?auto_191272 - BLOCK
      ?auto_191274 - BLOCK
      ?auto_191277 - BLOCK
      ?auto_191276 - BLOCK
      ?auto_191275 - BLOCK
      ?auto_191273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191278 ?auto_191271 ) ( ON-TABLE ?auto_191271 ) ( not ( = ?auto_191271 ?auto_191278 ) ) ( not ( = ?auto_191271 ?auto_191272 ) ) ( not ( = ?auto_191271 ?auto_191274 ) ) ( not ( = ?auto_191278 ?auto_191272 ) ) ( not ( = ?auto_191278 ?auto_191274 ) ) ( not ( = ?auto_191272 ?auto_191274 ) ) ( ON ?auto_191272 ?auto_191278 ) ( not ( = ?auto_191277 ?auto_191276 ) ) ( not ( = ?auto_191277 ?auto_191275 ) ) ( not ( = ?auto_191277 ?auto_191273 ) ) ( not ( = ?auto_191277 ?auto_191274 ) ) ( not ( = ?auto_191276 ?auto_191275 ) ) ( not ( = ?auto_191276 ?auto_191273 ) ) ( not ( = ?auto_191276 ?auto_191274 ) ) ( not ( = ?auto_191275 ?auto_191273 ) ) ( not ( = ?auto_191275 ?auto_191274 ) ) ( not ( = ?auto_191273 ?auto_191274 ) ) ( not ( = ?auto_191271 ?auto_191273 ) ) ( not ( = ?auto_191271 ?auto_191277 ) ) ( not ( = ?auto_191271 ?auto_191276 ) ) ( not ( = ?auto_191271 ?auto_191275 ) ) ( not ( = ?auto_191278 ?auto_191273 ) ) ( not ( = ?auto_191278 ?auto_191277 ) ) ( not ( = ?auto_191278 ?auto_191276 ) ) ( not ( = ?auto_191278 ?auto_191275 ) ) ( not ( = ?auto_191272 ?auto_191273 ) ) ( not ( = ?auto_191272 ?auto_191277 ) ) ( not ( = ?auto_191272 ?auto_191276 ) ) ( not ( = ?auto_191272 ?auto_191275 ) ) ( ON ?auto_191274 ?auto_191272 ) ( ON ?auto_191273 ?auto_191274 ) ( ON ?auto_191275 ?auto_191273 ) ( ON ?auto_191276 ?auto_191275 ) ( CLEAR ?auto_191276 ) ( HOLDING ?auto_191277 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191277 )
      ( MAKE-1PILE ?auto_191271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191279 - BLOCK
    )
    :vars
    (
      ?auto_191281 - BLOCK
      ?auto_191284 - BLOCK
      ?auto_191286 - BLOCK
      ?auto_191283 - BLOCK
      ?auto_191285 - BLOCK
      ?auto_191282 - BLOCK
      ?auto_191280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191281 ?auto_191279 ) ( ON-TABLE ?auto_191279 ) ( not ( = ?auto_191279 ?auto_191281 ) ) ( not ( = ?auto_191279 ?auto_191284 ) ) ( not ( = ?auto_191279 ?auto_191286 ) ) ( not ( = ?auto_191281 ?auto_191284 ) ) ( not ( = ?auto_191281 ?auto_191286 ) ) ( not ( = ?auto_191284 ?auto_191286 ) ) ( ON ?auto_191284 ?auto_191281 ) ( not ( = ?auto_191283 ?auto_191285 ) ) ( not ( = ?auto_191283 ?auto_191282 ) ) ( not ( = ?auto_191283 ?auto_191280 ) ) ( not ( = ?auto_191283 ?auto_191286 ) ) ( not ( = ?auto_191285 ?auto_191282 ) ) ( not ( = ?auto_191285 ?auto_191280 ) ) ( not ( = ?auto_191285 ?auto_191286 ) ) ( not ( = ?auto_191282 ?auto_191280 ) ) ( not ( = ?auto_191282 ?auto_191286 ) ) ( not ( = ?auto_191280 ?auto_191286 ) ) ( not ( = ?auto_191279 ?auto_191280 ) ) ( not ( = ?auto_191279 ?auto_191283 ) ) ( not ( = ?auto_191279 ?auto_191285 ) ) ( not ( = ?auto_191279 ?auto_191282 ) ) ( not ( = ?auto_191281 ?auto_191280 ) ) ( not ( = ?auto_191281 ?auto_191283 ) ) ( not ( = ?auto_191281 ?auto_191285 ) ) ( not ( = ?auto_191281 ?auto_191282 ) ) ( not ( = ?auto_191284 ?auto_191280 ) ) ( not ( = ?auto_191284 ?auto_191283 ) ) ( not ( = ?auto_191284 ?auto_191285 ) ) ( not ( = ?auto_191284 ?auto_191282 ) ) ( ON ?auto_191286 ?auto_191284 ) ( ON ?auto_191280 ?auto_191286 ) ( ON ?auto_191282 ?auto_191280 ) ( ON ?auto_191285 ?auto_191282 ) ( ON ?auto_191283 ?auto_191285 ) ( CLEAR ?auto_191283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191279 ?auto_191281 ?auto_191284 ?auto_191286 ?auto_191280 ?auto_191282 ?auto_191285 )
      ( MAKE-1PILE ?auto_191279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191287 - BLOCK
    )
    :vars
    (
      ?auto_191290 - BLOCK
      ?auto_191292 - BLOCK
      ?auto_191291 - BLOCK
      ?auto_191288 - BLOCK
      ?auto_191289 - BLOCK
      ?auto_191293 - BLOCK
      ?auto_191294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191290 ?auto_191287 ) ( ON-TABLE ?auto_191287 ) ( not ( = ?auto_191287 ?auto_191290 ) ) ( not ( = ?auto_191287 ?auto_191292 ) ) ( not ( = ?auto_191287 ?auto_191291 ) ) ( not ( = ?auto_191290 ?auto_191292 ) ) ( not ( = ?auto_191290 ?auto_191291 ) ) ( not ( = ?auto_191292 ?auto_191291 ) ) ( ON ?auto_191292 ?auto_191290 ) ( not ( = ?auto_191288 ?auto_191289 ) ) ( not ( = ?auto_191288 ?auto_191293 ) ) ( not ( = ?auto_191288 ?auto_191294 ) ) ( not ( = ?auto_191288 ?auto_191291 ) ) ( not ( = ?auto_191289 ?auto_191293 ) ) ( not ( = ?auto_191289 ?auto_191294 ) ) ( not ( = ?auto_191289 ?auto_191291 ) ) ( not ( = ?auto_191293 ?auto_191294 ) ) ( not ( = ?auto_191293 ?auto_191291 ) ) ( not ( = ?auto_191294 ?auto_191291 ) ) ( not ( = ?auto_191287 ?auto_191294 ) ) ( not ( = ?auto_191287 ?auto_191288 ) ) ( not ( = ?auto_191287 ?auto_191289 ) ) ( not ( = ?auto_191287 ?auto_191293 ) ) ( not ( = ?auto_191290 ?auto_191294 ) ) ( not ( = ?auto_191290 ?auto_191288 ) ) ( not ( = ?auto_191290 ?auto_191289 ) ) ( not ( = ?auto_191290 ?auto_191293 ) ) ( not ( = ?auto_191292 ?auto_191294 ) ) ( not ( = ?auto_191292 ?auto_191288 ) ) ( not ( = ?auto_191292 ?auto_191289 ) ) ( not ( = ?auto_191292 ?auto_191293 ) ) ( ON ?auto_191291 ?auto_191292 ) ( ON ?auto_191294 ?auto_191291 ) ( ON ?auto_191293 ?auto_191294 ) ( ON ?auto_191289 ?auto_191293 ) ( HOLDING ?auto_191288 ) ( CLEAR ?auto_191289 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191287 ?auto_191290 ?auto_191292 ?auto_191291 ?auto_191294 ?auto_191293 ?auto_191289 ?auto_191288 )
      ( MAKE-1PILE ?auto_191287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191295 - BLOCK
    )
    :vars
    (
      ?auto_191299 - BLOCK
      ?auto_191296 - BLOCK
      ?auto_191301 - BLOCK
      ?auto_191300 - BLOCK
      ?auto_191298 - BLOCK
      ?auto_191302 - BLOCK
      ?auto_191297 - BLOCK
      ?auto_191303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191299 ?auto_191295 ) ( ON-TABLE ?auto_191295 ) ( not ( = ?auto_191295 ?auto_191299 ) ) ( not ( = ?auto_191295 ?auto_191296 ) ) ( not ( = ?auto_191295 ?auto_191301 ) ) ( not ( = ?auto_191299 ?auto_191296 ) ) ( not ( = ?auto_191299 ?auto_191301 ) ) ( not ( = ?auto_191296 ?auto_191301 ) ) ( ON ?auto_191296 ?auto_191299 ) ( not ( = ?auto_191300 ?auto_191298 ) ) ( not ( = ?auto_191300 ?auto_191302 ) ) ( not ( = ?auto_191300 ?auto_191297 ) ) ( not ( = ?auto_191300 ?auto_191301 ) ) ( not ( = ?auto_191298 ?auto_191302 ) ) ( not ( = ?auto_191298 ?auto_191297 ) ) ( not ( = ?auto_191298 ?auto_191301 ) ) ( not ( = ?auto_191302 ?auto_191297 ) ) ( not ( = ?auto_191302 ?auto_191301 ) ) ( not ( = ?auto_191297 ?auto_191301 ) ) ( not ( = ?auto_191295 ?auto_191297 ) ) ( not ( = ?auto_191295 ?auto_191300 ) ) ( not ( = ?auto_191295 ?auto_191298 ) ) ( not ( = ?auto_191295 ?auto_191302 ) ) ( not ( = ?auto_191299 ?auto_191297 ) ) ( not ( = ?auto_191299 ?auto_191300 ) ) ( not ( = ?auto_191299 ?auto_191298 ) ) ( not ( = ?auto_191299 ?auto_191302 ) ) ( not ( = ?auto_191296 ?auto_191297 ) ) ( not ( = ?auto_191296 ?auto_191300 ) ) ( not ( = ?auto_191296 ?auto_191298 ) ) ( not ( = ?auto_191296 ?auto_191302 ) ) ( ON ?auto_191301 ?auto_191296 ) ( ON ?auto_191297 ?auto_191301 ) ( ON ?auto_191302 ?auto_191297 ) ( ON ?auto_191298 ?auto_191302 ) ( CLEAR ?auto_191298 ) ( ON ?auto_191300 ?auto_191303 ) ( CLEAR ?auto_191300 ) ( HAND-EMPTY ) ( not ( = ?auto_191295 ?auto_191303 ) ) ( not ( = ?auto_191299 ?auto_191303 ) ) ( not ( = ?auto_191296 ?auto_191303 ) ) ( not ( = ?auto_191301 ?auto_191303 ) ) ( not ( = ?auto_191300 ?auto_191303 ) ) ( not ( = ?auto_191298 ?auto_191303 ) ) ( not ( = ?auto_191302 ?auto_191303 ) ) ( not ( = ?auto_191297 ?auto_191303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191300 ?auto_191303 )
      ( MAKE-1PILE ?auto_191295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191304 - BLOCK
    )
    :vars
    (
      ?auto_191310 - BLOCK
      ?auto_191305 - BLOCK
      ?auto_191309 - BLOCK
      ?auto_191307 - BLOCK
      ?auto_191311 - BLOCK
      ?auto_191306 - BLOCK
      ?auto_191312 - BLOCK
      ?auto_191308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191310 ?auto_191304 ) ( ON-TABLE ?auto_191304 ) ( not ( = ?auto_191304 ?auto_191310 ) ) ( not ( = ?auto_191304 ?auto_191305 ) ) ( not ( = ?auto_191304 ?auto_191309 ) ) ( not ( = ?auto_191310 ?auto_191305 ) ) ( not ( = ?auto_191310 ?auto_191309 ) ) ( not ( = ?auto_191305 ?auto_191309 ) ) ( ON ?auto_191305 ?auto_191310 ) ( not ( = ?auto_191307 ?auto_191311 ) ) ( not ( = ?auto_191307 ?auto_191306 ) ) ( not ( = ?auto_191307 ?auto_191312 ) ) ( not ( = ?auto_191307 ?auto_191309 ) ) ( not ( = ?auto_191311 ?auto_191306 ) ) ( not ( = ?auto_191311 ?auto_191312 ) ) ( not ( = ?auto_191311 ?auto_191309 ) ) ( not ( = ?auto_191306 ?auto_191312 ) ) ( not ( = ?auto_191306 ?auto_191309 ) ) ( not ( = ?auto_191312 ?auto_191309 ) ) ( not ( = ?auto_191304 ?auto_191312 ) ) ( not ( = ?auto_191304 ?auto_191307 ) ) ( not ( = ?auto_191304 ?auto_191311 ) ) ( not ( = ?auto_191304 ?auto_191306 ) ) ( not ( = ?auto_191310 ?auto_191312 ) ) ( not ( = ?auto_191310 ?auto_191307 ) ) ( not ( = ?auto_191310 ?auto_191311 ) ) ( not ( = ?auto_191310 ?auto_191306 ) ) ( not ( = ?auto_191305 ?auto_191312 ) ) ( not ( = ?auto_191305 ?auto_191307 ) ) ( not ( = ?auto_191305 ?auto_191311 ) ) ( not ( = ?auto_191305 ?auto_191306 ) ) ( ON ?auto_191309 ?auto_191305 ) ( ON ?auto_191312 ?auto_191309 ) ( ON ?auto_191306 ?auto_191312 ) ( ON ?auto_191307 ?auto_191308 ) ( CLEAR ?auto_191307 ) ( not ( = ?auto_191304 ?auto_191308 ) ) ( not ( = ?auto_191310 ?auto_191308 ) ) ( not ( = ?auto_191305 ?auto_191308 ) ) ( not ( = ?auto_191309 ?auto_191308 ) ) ( not ( = ?auto_191307 ?auto_191308 ) ) ( not ( = ?auto_191311 ?auto_191308 ) ) ( not ( = ?auto_191306 ?auto_191308 ) ) ( not ( = ?auto_191312 ?auto_191308 ) ) ( HOLDING ?auto_191311 ) ( CLEAR ?auto_191306 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191304 ?auto_191310 ?auto_191305 ?auto_191309 ?auto_191312 ?auto_191306 ?auto_191311 )
      ( MAKE-1PILE ?auto_191304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191313 - BLOCK
    )
    :vars
    (
      ?auto_191317 - BLOCK
      ?auto_191316 - BLOCK
      ?auto_191315 - BLOCK
      ?auto_191320 - BLOCK
      ?auto_191319 - BLOCK
      ?auto_191318 - BLOCK
      ?auto_191314 - BLOCK
      ?auto_191321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191317 ?auto_191313 ) ( ON-TABLE ?auto_191313 ) ( not ( = ?auto_191313 ?auto_191317 ) ) ( not ( = ?auto_191313 ?auto_191316 ) ) ( not ( = ?auto_191313 ?auto_191315 ) ) ( not ( = ?auto_191317 ?auto_191316 ) ) ( not ( = ?auto_191317 ?auto_191315 ) ) ( not ( = ?auto_191316 ?auto_191315 ) ) ( ON ?auto_191316 ?auto_191317 ) ( not ( = ?auto_191320 ?auto_191319 ) ) ( not ( = ?auto_191320 ?auto_191318 ) ) ( not ( = ?auto_191320 ?auto_191314 ) ) ( not ( = ?auto_191320 ?auto_191315 ) ) ( not ( = ?auto_191319 ?auto_191318 ) ) ( not ( = ?auto_191319 ?auto_191314 ) ) ( not ( = ?auto_191319 ?auto_191315 ) ) ( not ( = ?auto_191318 ?auto_191314 ) ) ( not ( = ?auto_191318 ?auto_191315 ) ) ( not ( = ?auto_191314 ?auto_191315 ) ) ( not ( = ?auto_191313 ?auto_191314 ) ) ( not ( = ?auto_191313 ?auto_191320 ) ) ( not ( = ?auto_191313 ?auto_191319 ) ) ( not ( = ?auto_191313 ?auto_191318 ) ) ( not ( = ?auto_191317 ?auto_191314 ) ) ( not ( = ?auto_191317 ?auto_191320 ) ) ( not ( = ?auto_191317 ?auto_191319 ) ) ( not ( = ?auto_191317 ?auto_191318 ) ) ( not ( = ?auto_191316 ?auto_191314 ) ) ( not ( = ?auto_191316 ?auto_191320 ) ) ( not ( = ?auto_191316 ?auto_191319 ) ) ( not ( = ?auto_191316 ?auto_191318 ) ) ( ON ?auto_191315 ?auto_191316 ) ( ON ?auto_191314 ?auto_191315 ) ( ON ?auto_191318 ?auto_191314 ) ( ON ?auto_191320 ?auto_191321 ) ( not ( = ?auto_191313 ?auto_191321 ) ) ( not ( = ?auto_191317 ?auto_191321 ) ) ( not ( = ?auto_191316 ?auto_191321 ) ) ( not ( = ?auto_191315 ?auto_191321 ) ) ( not ( = ?auto_191320 ?auto_191321 ) ) ( not ( = ?auto_191319 ?auto_191321 ) ) ( not ( = ?auto_191318 ?auto_191321 ) ) ( not ( = ?auto_191314 ?auto_191321 ) ) ( CLEAR ?auto_191318 ) ( ON ?auto_191319 ?auto_191320 ) ( CLEAR ?auto_191319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191321 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191321 ?auto_191320 )
      ( MAKE-1PILE ?auto_191313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191322 - BLOCK
    )
    :vars
    (
      ?auto_191325 - BLOCK
      ?auto_191330 - BLOCK
      ?auto_191326 - BLOCK
      ?auto_191323 - BLOCK
      ?auto_191324 - BLOCK
      ?auto_191329 - BLOCK
      ?auto_191328 - BLOCK
      ?auto_191327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191325 ?auto_191322 ) ( ON-TABLE ?auto_191322 ) ( not ( = ?auto_191322 ?auto_191325 ) ) ( not ( = ?auto_191322 ?auto_191330 ) ) ( not ( = ?auto_191322 ?auto_191326 ) ) ( not ( = ?auto_191325 ?auto_191330 ) ) ( not ( = ?auto_191325 ?auto_191326 ) ) ( not ( = ?auto_191330 ?auto_191326 ) ) ( ON ?auto_191330 ?auto_191325 ) ( not ( = ?auto_191323 ?auto_191324 ) ) ( not ( = ?auto_191323 ?auto_191329 ) ) ( not ( = ?auto_191323 ?auto_191328 ) ) ( not ( = ?auto_191323 ?auto_191326 ) ) ( not ( = ?auto_191324 ?auto_191329 ) ) ( not ( = ?auto_191324 ?auto_191328 ) ) ( not ( = ?auto_191324 ?auto_191326 ) ) ( not ( = ?auto_191329 ?auto_191328 ) ) ( not ( = ?auto_191329 ?auto_191326 ) ) ( not ( = ?auto_191328 ?auto_191326 ) ) ( not ( = ?auto_191322 ?auto_191328 ) ) ( not ( = ?auto_191322 ?auto_191323 ) ) ( not ( = ?auto_191322 ?auto_191324 ) ) ( not ( = ?auto_191322 ?auto_191329 ) ) ( not ( = ?auto_191325 ?auto_191328 ) ) ( not ( = ?auto_191325 ?auto_191323 ) ) ( not ( = ?auto_191325 ?auto_191324 ) ) ( not ( = ?auto_191325 ?auto_191329 ) ) ( not ( = ?auto_191330 ?auto_191328 ) ) ( not ( = ?auto_191330 ?auto_191323 ) ) ( not ( = ?auto_191330 ?auto_191324 ) ) ( not ( = ?auto_191330 ?auto_191329 ) ) ( ON ?auto_191326 ?auto_191330 ) ( ON ?auto_191328 ?auto_191326 ) ( ON ?auto_191323 ?auto_191327 ) ( not ( = ?auto_191322 ?auto_191327 ) ) ( not ( = ?auto_191325 ?auto_191327 ) ) ( not ( = ?auto_191330 ?auto_191327 ) ) ( not ( = ?auto_191326 ?auto_191327 ) ) ( not ( = ?auto_191323 ?auto_191327 ) ) ( not ( = ?auto_191324 ?auto_191327 ) ) ( not ( = ?auto_191329 ?auto_191327 ) ) ( not ( = ?auto_191328 ?auto_191327 ) ) ( ON ?auto_191324 ?auto_191323 ) ( CLEAR ?auto_191324 ) ( ON-TABLE ?auto_191327 ) ( HOLDING ?auto_191329 ) ( CLEAR ?auto_191328 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191322 ?auto_191325 ?auto_191330 ?auto_191326 ?auto_191328 ?auto_191329 )
      ( MAKE-1PILE ?auto_191322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191331 - BLOCK
    )
    :vars
    (
      ?auto_191334 - BLOCK
      ?auto_191335 - BLOCK
      ?auto_191336 - BLOCK
      ?auto_191337 - BLOCK
      ?auto_191333 - BLOCK
      ?auto_191338 - BLOCK
      ?auto_191332 - BLOCK
      ?auto_191339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191334 ?auto_191331 ) ( ON-TABLE ?auto_191331 ) ( not ( = ?auto_191331 ?auto_191334 ) ) ( not ( = ?auto_191331 ?auto_191335 ) ) ( not ( = ?auto_191331 ?auto_191336 ) ) ( not ( = ?auto_191334 ?auto_191335 ) ) ( not ( = ?auto_191334 ?auto_191336 ) ) ( not ( = ?auto_191335 ?auto_191336 ) ) ( ON ?auto_191335 ?auto_191334 ) ( not ( = ?auto_191337 ?auto_191333 ) ) ( not ( = ?auto_191337 ?auto_191338 ) ) ( not ( = ?auto_191337 ?auto_191332 ) ) ( not ( = ?auto_191337 ?auto_191336 ) ) ( not ( = ?auto_191333 ?auto_191338 ) ) ( not ( = ?auto_191333 ?auto_191332 ) ) ( not ( = ?auto_191333 ?auto_191336 ) ) ( not ( = ?auto_191338 ?auto_191332 ) ) ( not ( = ?auto_191338 ?auto_191336 ) ) ( not ( = ?auto_191332 ?auto_191336 ) ) ( not ( = ?auto_191331 ?auto_191332 ) ) ( not ( = ?auto_191331 ?auto_191337 ) ) ( not ( = ?auto_191331 ?auto_191333 ) ) ( not ( = ?auto_191331 ?auto_191338 ) ) ( not ( = ?auto_191334 ?auto_191332 ) ) ( not ( = ?auto_191334 ?auto_191337 ) ) ( not ( = ?auto_191334 ?auto_191333 ) ) ( not ( = ?auto_191334 ?auto_191338 ) ) ( not ( = ?auto_191335 ?auto_191332 ) ) ( not ( = ?auto_191335 ?auto_191337 ) ) ( not ( = ?auto_191335 ?auto_191333 ) ) ( not ( = ?auto_191335 ?auto_191338 ) ) ( ON ?auto_191336 ?auto_191335 ) ( ON ?auto_191332 ?auto_191336 ) ( ON ?auto_191337 ?auto_191339 ) ( not ( = ?auto_191331 ?auto_191339 ) ) ( not ( = ?auto_191334 ?auto_191339 ) ) ( not ( = ?auto_191335 ?auto_191339 ) ) ( not ( = ?auto_191336 ?auto_191339 ) ) ( not ( = ?auto_191337 ?auto_191339 ) ) ( not ( = ?auto_191333 ?auto_191339 ) ) ( not ( = ?auto_191338 ?auto_191339 ) ) ( not ( = ?auto_191332 ?auto_191339 ) ) ( ON ?auto_191333 ?auto_191337 ) ( ON-TABLE ?auto_191339 ) ( CLEAR ?auto_191332 ) ( ON ?auto_191338 ?auto_191333 ) ( CLEAR ?auto_191338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191339 ?auto_191337 ?auto_191333 )
      ( MAKE-1PILE ?auto_191331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191340 - BLOCK
    )
    :vars
    (
      ?auto_191342 - BLOCK
      ?auto_191347 - BLOCK
      ?auto_191346 - BLOCK
      ?auto_191343 - BLOCK
      ?auto_191348 - BLOCK
      ?auto_191345 - BLOCK
      ?auto_191344 - BLOCK
      ?auto_191341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191342 ?auto_191340 ) ( ON-TABLE ?auto_191340 ) ( not ( = ?auto_191340 ?auto_191342 ) ) ( not ( = ?auto_191340 ?auto_191347 ) ) ( not ( = ?auto_191340 ?auto_191346 ) ) ( not ( = ?auto_191342 ?auto_191347 ) ) ( not ( = ?auto_191342 ?auto_191346 ) ) ( not ( = ?auto_191347 ?auto_191346 ) ) ( ON ?auto_191347 ?auto_191342 ) ( not ( = ?auto_191343 ?auto_191348 ) ) ( not ( = ?auto_191343 ?auto_191345 ) ) ( not ( = ?auto_191343 ?auto_191344 ) ) ( not ( = ?auto_191343 ?auto_191346 ) ) ( not ( = ?auto_191348 ?auto_191345 ) ) ( not ( = ?auto_191348 ?auto_191344 ) ) ( not ( = ?auto_191348 ?auto_191346 ) ) ( not ( = ?auto_191345 ?auto_191344 ) ) ( not ( = ?auto_191345 ?auto_191346 ) ) ( not ( = ?auto_191344 ?auto_191346 ) ) ( not ( = ?auto_191340 ?auto_191344 ) ) ( not ( = ?auto_191340 ?auto_191343 ) ) ( not ( = ?auto_191340 ?auto_191348 ) ) ( not ( = ?auto_191340 ?auto_191345 ) ) ( not ( = ?auto_191342 ?auto_191344 ) ) ( not ( = ?auto_191342 ?auto_191343 ) ) ( not ( = ?auto_191342 ?auto_191348 ) ) ( not ( = ?auto_191342 ?auto_191345 ) ) ( not ( = ?auto_191347 ?auto_191344 ) ) ( not ( = ?auto_191347 ?auto_191343 ) ) ( not ( = ?auto_191347 ?auto_191348 ) ) ( not ( = ?auto_191347 ?auto_191345 ) ) ( ON ?auto_191346 ?auto_191347 ) ( ON ?auto_191343 ?auto_191341 ) ( not ( = ?auto_191340 ?auto_191341 ) ) ( not ( = ?auto_191342 ?auto_191341 ) ) ( not ( = ?auto_191347 ?auto_191341 ) ) ( not ( = ?auto_191346 ?auto_191341 ) ) ( not ( = ?auto_191343 ?auto_191341 ) ) ( not ( = ?auto_191348 ?auto_191341 ) ) ( not ( = ?auto_191345 ?auto_191341 ) ) ( not ( = ?auto_191344 ?auto_191341 ) ) ( ON ?auto_191348 ?auto_191343 ) ( ON-TABLE ?auto_191341 ) ( ON ?auto_191345 ?auto_191348 ) ( CLEAR ?auto_191345 ) ( HOLDING ?auto_191344 ) ( CLEAR ?auto_191346 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191340 ?auto_191342 ?auto_191347 ?auto_191346 ?auto_191344 )
      ( MAKE-1PILE ?auto_191340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191349 - BLOCK
    )
    :vars
    (
      ?auto_191351 - BLOCK
      ?auto_191352 - BLOCK
      ?auto_191350 - BLOCK
      ?auto_191353 - BLOCK
      ?auto_191354 - BLOCK
      ?auto_191356 - BLOCK
      ?auto_191355 - BLOCK
      ?auto_191357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191351 ?auto_191349 ) ( ON-TABLE ?auto_191349 ) ( not ( = ?auto_191349 ?auto_191351 ) ) ( not ( = ?auto_191349 ?auto_191352 ) ) ( not ( = ?auto_191349 ?auto_191350 ) ) ( not ( = ?auto_191351 ?auto_191352 ) ) ( not ( = ?auto_191351 ?auto_191350 ) ) ( not ( = ?auto_191352 ?auto_191350 ) ) ( ON ?auto_191352 ?auto_191351 ) ( not ( = ?auto_191353 ?auto_191354 ) ) ( not ( = ?auto_191353 ?auto_191356 ) ) ( not ( = ?auto_191353 ?auto_191355 ) ) ( not ( = ?auto_191353 ?auto_191350 ) ) ( not ( = ?auto_191354 ?auto_191356 ) ) ( not ( = ?auto_191354 ?auto_191355 ) ) ( not ( = ?auto_191354 ?auto_191350 ) ) ( not ( = ?auto_191356 ?auto_191355 ) ) ( not ( = ?auto_191356 ?auto_191350 ) ) ( not ( = ?auto_191355 ?auto_191350 ) ) ( not ( = ?auto_191349 ?auto_191355 ) ) ( not ( = ?auto_191349 ?auto_191353 ) ) ( not ( = ?auto_191349 ?auto_191354 ) ) ( not ( = ?auto_191349 ?auto_191356 ) ) ( not ( = ?auto_191351 ?auto_191355 ) ) ( not ( = ?auto_191351 ?auto_191353 ) ) ( not ( = ?auto_191351 ?auto_191354 ) ) ( not ( = ?auto_191351 ?auto_191356 ) ) ( not ( = ?auto_191352 ?auto_191355 ) ) ( not ( = ?auto_191352 ?auto_191353 ) ) ( not ( = ?auto_191352 ?auto_191354 ) ) ( not ( = ?auto_191352 ?auto_191356 ) ) ( ON ?auto_191350 ?auto_191352 ) ( ON ?auto_191353 ?auto_191357 ) ( not ( = ?auto_191349 ?auto_191357 ) ) ( not ( = ?auto_191351 ?auto_191357 ) ) ( not ( = ?auto_191352 ?auto_191357 ) ) ( not ( = ?auto_191350 ?auto_191357 ) ) ( not ( = ?auto_191353 ?auto_191357 ) ) ( not ( = ?auto_191354 ?auto_191357 ) ) ( not ( = ?auto_191356 ?auto_191357 ) ) ( not ( = ?auto_191355 ?auto_191357 ) ) ( ON ?auto_191354 ?auto_191353 ) ( ON-TABLE ?auto_191357 ) ( ON ?auto_191356 ?auto_191354 ) ( CLEAR ?auto_191350 ) ( ON ?auto_191355 ?auto_191356 ) ( CLEAR ?auto_191355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191357 ?auto_191353 ?auto_191354 ?auto_191356 )
      ( MAKE-1PILE ?auto_191349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191358 - BLOCK
    )
    :vars
    (
      ?auto_191362 - BLOCK
      ?auto_191360 - BLOCK
      ?auto_191366 - BLOCK
      ?auto_191359 - BLOCK
      ?auto_191361 - BLOCK
      ?auto_191364 - BLOCK
      ?auto_191363 - BLOCK
      ?auto_191365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191362 ?auto_191358 ) ( ON-TABLE ?auto_191358 ) ( not ( = ?auto_191358 ?auto_191362 ) ) ( not ( = ?auto_191358 ?auto_191360 ) ) ( not ( = ?auto_191358 ?auto_191366 ) ) ( not ( = ?auto_191362 ?auto_191360 ) ) ( not ( = ?auto_191362 ?auto_191366 ) ) ( not ( = ?auto_191360 ?auto_191366 ) ) ( ON ?auto_191360 ?auto_191362 ) ( not ( = ?auto_191359 ?auto_191361 ) ) ( not ( = ?auto_191359 ?auto_191364 ) ) ( not ( = ?auto_191359 ?auto_191363 ) ) ( not ( = ?auto_191359 ?auto_191366 ) ) ( not ( = ?auto_191361 ?auto_191364 ) ) ( not ( = ?auto_191361 ?auto_191363 ) ) ( not ( = ?auto_191361 ?auto_191366 ) ) ( not ( = ?auto_191364 ?auto_191363 ) ) ( not ( = ?auto_191364 ?auto_191366 ) ) ( not ( = ?auto_191363 ?auto_191366 ) ) ( not ( = ?auto_191358 ?auto_191363 ) ) ( not ( = ?auto_191358 ?auto_191359 ) ) ( not ( = ?auto_191358 ?auto_191361 ) ) ( not ( = ?auto_191358 ?auto_191364 ) ) ( not ( = ?auto_191362 ?auto_191363 ) ) ( not ( = ?auto_191362 ?auto_191359 ) ) ( not ( = ?auto_191362 ?auto_191361 ) ) ( not ( = ?auto_191362 ?auto_191364 ) ) ( not ( = ?auto_191360 ?auto_191363 ) ) ( not ( = ?auto_191360 ?auto_191359 ) ) ( not ( = ?auto_191360 ?auto_191361 ) ) ( not ( = ?auto_191360 ?auto_191364 ) ) ( ON ?auto_191359 ?auto_191365 ) ( not ( = ?auto_191358 ?auto_191365 ) ) ( not ( = ?auto_191362 ?auto_191365 ) ) ( not ( = ?auto_191360 ?auto_191365 ) ) ( not ( = ?auto_191366 ?auto_191365 ) ) ( not ( = ?auto_191359 ?auto_191365 ) ) ( not ( = ?auto_191361 ?auto_191365 ) ) ( not ( = ?auto_191364 ?auto_191365 ) ) ( not ( = ?auto_191363 ?auto_191365 ) ) ( ON ?auto_191361 ?auto_191359 ) ( ON-TABLE ?auto_191365 ) ( ON ?auto_191364 ?auto_191361 ) ( ON ?auto_191363 ?auto_191364 ) ( CLEAR ?auto_191363 ) ( HOLDING ?auto_191366 ) ( CLEAR ?auto_191360 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191358 ?auto_191362 ?auto_191360 ?auto_191366 )
      ( MAKE-1PILE ?auto_191358 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191367 - BLOCK
    )
    :vars
    (
      ?auto_191370 - BLOCK
      ?auto_191369 - BLOCK
      ?auto_191368 - BLOCK
      ?auto_191375 - BLOCK
      ?auto_191371 - BLOCK
      ?auto_191372 - BLOCK
      ?auto_191374 - BLOCK
      ?auto_191373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191370 ?auto_191367 ) ( ON-TABLE ?auto_191367 ) ( not ( = ?auto_191367 ?auto_191370 ) ) ( not ( = ?auto_191367 ?auto_191369 ) ) ( not ( = ?auto_191367 ?auto_191368 ) ) ( not ( = ?auto_191370 ?auto_191369 ) ) ( not ( = ?auto_191370 ?auto_191368 ) ) ( not ( = ?auto_191369 ?auto_191368 ) ) ( ON ?auto_191369 ?auto_191370 ) ( not ( = ?auto_191375 ?auto_191371 ) ) ( not ( = ?auto_191375 ?auto_191372 ) ) ( not ( = ?auto_191375 ?auto_191374 ) ) ( not ( = ?auto_191375 ?auto_191368 ) ) ( not ( = ?auto_191371 ?auto_191372 ) ) ( not ( = ?auto_191371 ?auto_191374 ) ) ( not ( = ?auto_191371 ?auto_191368 ) ) ( not ( = ?auto_191372 ?auto_191374 ) ) ( not ( = ?auto_191372 ?auto_191368 ) ) ( not ( = ?auto_191374 ?auto_191368 ) ) ( not ( = ?auto_191367 ?auto_191374 ) ) ( not ( = ?auto_191367 ?auto_191375 ) ) ( not ( = ?auto_191367 ?auto_191371 ) ) ( not ( = ?auto_191367 ?auto_191372 ) ) ( not ( = ?auto_191370 ?auto_191374 ) ) ( not ( = ?auto_191370 ?auto_191375 ) ) ( not ( = ?auto_191370 ?auto_191371 ) ) ( not ( = ?auto_191370 ?auto_191372 ) ) ( not ( = ?auto_191369 ?auto_191374 ) ) ( not ( = ?auto_191369 ?auto_191375 ) ) ( not ( = ?auto_191369 ?auto_191371 ) ) ( not ( = ?auto_191369 ?auto_191372 ) ) ( ON ?auto_191375 ?auto_191373 ) ( not ( = ?auto_191367 ?auto_191373 ) ) ( not ( = ?auto_191370 ?auto_191373 ) ) ( not ( = ?auto_191369 ?auto_191373 ) ) ( not ( = ?auto_191368 ?auto_191373 ) ) ( not ( = ?auto_191375 ?auto_191373 ) ) ( not ( = ?auto_191371 ?auto_191373 ) ) ( not ( = ?auto_191372 ?auto_191373 ) ) ( not ( = ?auto_191374 ?auto_191373 ) ) ( ON ?auto_191371 ?auto_191375 ) ( ON-TABLE ?auto_191373 ) ( ON ?auto_191372 ?auto_191371 ) ( ON ?auto_191374 ?auto_191372 ) ( CLEAR ?auto_191369 ) ( ON ?auto_191368 ?auto_191374 ) ( CLEAR ?auto_191368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191373 ?auto_191375 ?auto_191371 ?auto_191372 ?auto_191374 )
      ( MAKE-1PILE ?auto_191367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191376 - BLOCK
    )
    :vars
    (
      ?auto_191383 - BLOCK
      ?auto_191381 - BLOCK
      ?auto_191377 - BLOCK
      ?auto_191384 - BLOCK
      ?auto_191378 - BLOCK
      ?auto_191379 - BLOCK
      ?auto_191380 - BLOCK
      ?auto_191382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191383 ?auto_191376 ) ( ON-TABLE ?auto_191376 ) ( not ( = ?auto_191376 ?auto_191383 ) ) ( not ( = ?auto_191376 ?auto_191381 ) ) ( not ( = ?auto_191376 ?auto_191377 ) ) ( not ( = ?auto_191383 ?auto_191381 ) ) ( not ( = ?auto_191383 ?auto_191377 ) ) ( not ( = ?auto_191381 ?auto_191377 ) ) ( not ( = ?auto_191384 ?auto_191378 ) ) ( not ( = ?auto_191384 ?auto_191379 ) ) ( not ( = ?auto_191384 ?auto_191380 ) ) ( not ( = ?auto_191384 ?auto_191377 ) ) ( not ( = ?auto_191378 ?auto_191379 ) ) ( not ( = ?auto_191378 ?auto_191380 ) ) ( not ( = ?auto_191378 ?auto_191377 ) ) ( not ( = ?auto_191379 ?auto_191380 ) ) ( not ( = ?auto_191379 ?auto_191377 ) ) ( not ( = ?auto_191380 ?auto_191377 ) ) ( not ( = ?auto_191376 ?auto_191380 ) ) ( not ( = ?auto_191376 ?auto_191384 ) ) ( not ( = ?auto_191376 ?auto_191378 ) ) ( not ( = ?auto_191376 ?auto_191379 ) ) ( not ( = ?auto_191383 ?auto_191380 ) ) ( not ( = ?auto_191383 ?auto_191384 ) ) ( not ( = ?auto_191383 ?auto_191378 ) ) ( not ( = ?auto_191383 ?auto_191379 ) ) ( not ( = ?auto_191381 ?auto_191380 ) ) ( not ( = ?auto_191381 ?auto_191384 ) ) ( not ( = ?auto_191381 ?auto_191378 ) ) ( not ( = ?auto_191381 ?auto_191379 ) ) ( ON ?auto_191384 ?auto_191382 ) ( not ( = ?auto_191376 ?auto_191382 ) ) ( not ( = ?auto_191383 ?auto_191382 ) ) ( not ( = ?auto_191381 ?auto_191382 ) ) ( not ( = ?auto_191377 ?auto_191382 ) ) ( not ( = ?auto_191384 ?auto_191382 ) ) ( not ( = ?auto_191378 ?auto_191382 ) ) ( not ( = ?auto_191379 ?auto_191382 ) ) ( not ( = ?auto_191380 ?auto_191382 ) ) ( ON ?auto_191378 ?auto_191384 ) ( ON-TABLE ?auto_191382 ) ( ON ?auto_191379 ?auto_191378 ) ( ON ?auto_191380 ?auto_191379 ) ( ON ?auto_191377 ?auto_191380 ) ( CLEAR ?auto_191377 ) ( HOLDING ?auto_191381 ) ( CLEAR ?auto_191383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191376 ?auto_191383 ?auto_191381 )
      ( MAKE-1PILE ?auto_191376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191385 - BLOCK
    )
    :vars
    (
      ?auto_191388 - BLOCK
      ?auto_191391 - BLOCK
      ?auto_191393 - BLOCK
      ?auto_191392 - BLOCK
      ?auto_191389 - BLOCK
      ?auto_191387 - BLOCK
      ?auto_191390 - BLOCK
      ?auto_191386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191388 ?auto_191385 ) ( ON-TABLE ?auto_191385 ) ( not ( = ?auto_191385 ?auto_191388 ) ) ( not ( = ?auto_191385 ?auto_191391 ) ) ( not ( = ?auto_191385 ?auto_191393 ) ) ( not ( = ?auto_191388 ?auto_191391 ) ) ( not ( = ?auto_191388 ?auto_191393 ) ) ( not ( = ?auto_191391 ?auto_191393 ) ) ( not ( = ?auto_191392 ?auto_191389 ) ) ( not ( = ?auto_191392 ?auto_191387 ) ) ( not ( = ?auto_191392 ?auto_191390 ) ) ( not ( = ?auto_191392 ?auto_191393 ) ) ( not ( = ?auto_191389 ?auto_191387 ) ) ( not ( = ?auto_191389 ?auto_191390 ) ) ( not ( = ?auto_191389 ?auto_191393 ) ) ( not ( = ?auto_191387 ?auto_191390 ) ) ( not ( = ?auto_191387 ?auto_191393 ) ) ( not ( = ?auto_191390 ?auto_191393 ) ) ( not ( = ?auto_191385 ?auto_191390 ) ) ( not ( = ?auto_191385 ?auto_191392 ) ) ( not ( = ?auto_191385 ?auto_191389 ) ) ( not ( = ?auto_191385 ?auto_191387 ) ) ( not ( = ?auto_191388 ?auto_191390 ) ) ( not ( = ?auto_191388 ?auto_191392 ) ) ( not ( = ?auto_191388 ?auto_191389 ) ) ( not ( = ?auto_191388 ?auto_191387 ) ) ( not ( = ?auto_191391 ?auto_191390 ) ) ( not ( = ?auto_191391 ?auto_191392 ) ) ( not ( = ?auto_191391 ?auto_191389 ) ) ( not ( = ?auto_191391 ?auto_191387 ) ) ( ON ?auto_191392 ?auto_191386 ) ( not ( = ?auto_191385 ?auto_191386 ) ) ( not ( = ?auto_191388 ?auto_191386 ) ) ( not ( = ?auto_191391 ?auto_191386 ) ) ( not ( = ?auto_191393 ?auto_191386 ) ) ( not ( = ?auto_191392 ?auto_191386 ) ) ( not ( = ?auto_191389 ?auto_191386 ) ) ( not ( = ?auto_191387 ?auto_191386 ) ) ( not ( = ?auto_191390 ?auto_191386 ) ) ( ON ?auto_191389 ?auto_191392 ) ( ON-TABLE ?auto_191386 ) ( ON ?auto_191387 ?auto_191389 ) ( ON ?auto_191390 ?auto_191387 ) ( ON ?auto_191393 ?auto_191390 ) ( CLEAR ?auto_191388 ) ( ON ?auto_191391 ?auto_191393 ) ( CLEAR ?auto_191391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191386 ?auto_191392 ?auto_191389 ?auto_191387 ?auto_191390 ?auto_191393 )
      ( MAKE-1PILE ?auto_191385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191412 - BLOCK
    )
    :vars
    (
      ?auto_191417 - BLOCK
      ?auto_191414 - BLOCK
      ?auto_191418 - BLOCK
      ?auto_191420 - BLOCK
      ?auto_191415 - BLOCK
      ?auto_191419 - BLOCK
      ?auto_191413 - BLOCK
      ?auto_191416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191412 ?auto_191417 ) ) ( not ( = ?auto_191412 ?auto_191414 ) ) ( not ( = ?auto_191412 ?auto_191418 ) ) ( not ( = ?auto_191417 ?auto_191414 ) ) ( not ( = ?auto_191417 ?auto_191418 ) ) ( not ( = ?auto_191414 ?auto_191418 ) ) ( not ( = ?auto_191420 ?auto_191415 ) ) ( not ( = ?auto_191420 ?auto_191419 ) ) ( not ( = ?auto_191420 ?auto_191413 ) ) ( not ( = ?auto_191420 ?auto_191418 ) ) ( not ( = ?auto_191415 ?auto_191419 ) ) ( not ( = ?auto_191415 ?auto_191413 ) ) ( not ( = ?auto_191415 ?auto_191418 ) ) ( not ( = ?auto_191419 ?auto_191413 ) ) ( not ( = ?auto_191419 ?auto_191418 ) ) ( not ( = ?auto_191413 ?auto_191418 ) ) ( not ( = ?auto_191412 ?auto_191413 ) ) ( not ( = ?auto_191412 ?auto_191420 ) ) ( not ( = ?auto_191412 ?auto_191415 ) ) ( not ( = ?auto_191412 ?auto_191419 ) ) ( not ( = ?auto_191417 ?auto_191413 ) ) ( not ( = ?auto_191417 ?auto_191420 ) ) ( not ( = ?auto_191417 ?auto_191415 ) ) ( not ( = ?auto_191417 ?auto_191419 ) ) ( not ( = ?auto_191414 ?auto_191413 ) ) ( not ( = ?auto_191414 ?auto_191420 ) ) ( not ( = ?auto_191414 ?auto_191415 ) ) ( not ( = ?auto_191414 ?auto_191419 ) ) ( ON ?auto_191420 ?auto_191416 ) ( not ( = ?auto_191412 ?auto_191416 ) ) ( not ( = ?auto_191417 ?auto_191416 ) ) ( not ( = ?auto_191414 ?auto_191416 ) ) ( not ( = ?auto_191418 ?auto_191416 ) ) ( not ( = ?auto_191420 ?auto_191416 ) ) ( not ( = ?auto_191415 ?auto_191416 ) ) ( not ( = ?auto_191419 ?auto_191416 ) ) ( not ( = ?auto_191413 ?auto_191416 ) ) ( ON ?auto_191415 ?auto_191420 ) ( ON-TABLE ?auto_191416 ) ( ON ?auto_191419 ?auto_191415 ) ( ON ?auto_191413 ?auto_191419 ) ( ON ?auto_191418 ?auto_191413 ) ( ON ?auto_191414 ?auto_191418 ) ( ON ?auto_191417 ?auto_191414 ) ( CLEAR ?auto_191417 ) ( HOLDING ?auto_191412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191412 ?auto_191417 )
      ( MAKE-1PILE ?auto_191412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191421 - BLOCK
    )
    :vars
    (
      ?auto_191423 - BLOCK
      ?auto_191424 - BLOCK
      ?auto_191429 - BLOCK
      ?auto_191422 - BLOCK
      ?auto_191426 - BLOCK
      ?auto_191428 - BLOCK
      ?auto_191425 - BLOCK
      ?auto_191427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191421 ?auto_191423 ) ) ( not ( = ?auto_191421 ?auto_191424 ) ) ( not ( = ?auto_191421 ?auto_191429 ) ) ( not ( = ?auto_191423 ?auto_191424 ) ) ( not ( = ?auto_191423 ?auto_191429 ) ) ( not ( = ?auto_191424 ?auto_191429 ) ) ( not ( = ?auto_191422 ?auto_191426 ) ) ( not ( = ?auto_191422 ?auto_191428 ) ) ( not ( = ?auto_191422 ?auto_191425 ) ) ( not ( = ?auto_191422 ?auto_191429 ) ) ( not ( = ?auto_191426 ?auto_191428 ) ) ( not ( = ?auto_191426 ?auto_191425 ) ) ( not ( = ?auto_191426 ?auto_191429 ) ) ( not ( = ?auto_191428 ?auto_191425 ) ) ( not ( = ?auto_191428 ?auto_191429 ) ) ( not ( = ?auto_191425 ?auto_191429 ) ) ( not ( = ?auto_191421 ?auto_191425 ) ) ( not ( = ?auto_191421 ?auto_191422 ) ) ( not ( = ?auto_191421 ?auto_191426 ) ) ( not ( = ?auto_191421 ?auto_191428 ) ) ( not ( = ?auto_191423 ?auto_191425 ) ) ( not ( = ?auto_191423 ?auto_191422 ) ) ( not ( = ?auto_191423 ?auto_191426 ) ) ( not ( = ?auto_191423 ?auto_191428 ) ) ( not ( = ?auto_191424 ?auto_191425 ) ) ( not ( = ?auto_191424 ?auto_191422 ) ) ( not ( = ?auto_191424 ?auto_191426 ) ) ( not ( = ?auto_191424 ?auto_191428 ) ) ( ON ?auto_191422 ?auto_191427 ) ( not ( = ?auto_191421 ?auto_191427 ) ) ( not ( = ?auto_191423 ?auto_191427 ) ) ( not ( = ?auto_191424 ?auto_191427 ) ) ( not ( = ?auto_191429 ?auto_191427 ) ) ( not ( = ?auto_191422 ?auto_191427 ) ) ( not ( = ?auto_191426 ?auto_191427 ) ) ( not ( = ?auto_191428 ?auto_191427 ) ) ( not ( = ?auto_191425 ?auto_191427 ) ) ( ON ?auto_191426 ?auto_191422 ) ( ON-TABLE ?auto_191427 ) ( ON ?auto_191428 ?auto_191426 ) ( ON ?auto_191425 ?auto_191428 ) ( ON ?auto_191429 ?auto_191425 ) ( ON ?auto_191424 ?auto_191429 ) ( ON ?auto_191423 ?auto_191424 ) ( ON ?auto_191421 ?auto_191423 ) ( CLEAR ?auto_191421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191427 ?auto_191422 ?auto_191426 ?auto_191428 ?auto_191425 ?auto_191429 ?auto_191424 ?auto_191423 )
      ( MAKE-1PILE ?auto_191421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191437 - BLOCK
      ?auto_191438 - BLOCK
      ?auto_191439 - BLOCK
      ?auto_191440 - BLOCK
      ?auto_191441 - BLOCK
      ?auto_191442 - BLOCK
      ?auto_191443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_191443 ) ( CLEAR ?auto_191442 ) ( ON-TABLE ?auto_191437 ) ( ON ?auto_191438 ?auto_191437 ) ( ON ?auto_191439 ?auto_191438 ) ( ON ?auto_191440 ?auto_191439 ) ( ON ?auto_191441 ?auto_191440 ) ( ON ?auto_191442 ?auto_191441 ) ( not ( = ?auto_191437 ?auto_191438 ) ) ( not ( = ?auto_191437 ?auto_191439 ) ) ( not ( = ?auto_191437 ?auto_191440 ) ) ( not ( = ?auto_191437 ?auto_191441 ) ) ( not ( = ?auto_191437 ?auto_191442 ) ) ( not ( = ?auto_191437 ?auto_191443 ) ) ( not ( = ?auto_191438 ?auto_191439 ) ) ( not ( = ?auto_191438 ?auto_191440 ) ) ( not ( = ?auto_191438 ?auto_191441 ) ) ( not ( = ?auto_191438 ?auto_191442 ) ) ( not ( = ?auto_191438 ?auto_191443 ) ) ( not ( = ?auto_191439 ?auto_191440 ) ) ( not ( = ?auto_191439 ?auto_191441 ) ) ( not ( = ?auto_191439 ?auto_191442 ) ) ( not ( = ?auto_191439 ?auto_191443 ) ) ( not ( = ?auto_191440 ?auto_191441 ) ) ( not ( = ?auto_191440 ?auto_191442 ) ) ( not ( = ?auto_191440 ?auto_191443 ) ) ( not ( = ?auto_191441 ?auto_191442 ) ) ( not ( = ?auto_191441 ?auto_191443 ) ) ( not ( = ?auto_191442 ?auto_191443 ) ) )
    :subtasks
    ( ( !STACK ?auto_191443 ?auto_191442 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191444 - BLOCK
      ?auto_191445 - BLOCK
      ?auto_191446 - BLOCK
      ?auto_191447 - BLOCK
      ?auto_191448 - BLOCK
      ?auto_191449 - BLOCK
      ?auto_191450 - BLOCK
    )
    :vars
    (
      ?auto_191451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191449 ) ( ON-TABLE ?auto_191444 ) ( ON ?auto_191445 ?auto_191444 ) ( ON ?auto_191446 ?auto_191445 ) ( ON ?auto_191447 ?auto_191446 ) ( ON ?auto_191448 ?auto_191447 ) ( ON ?auto_191449 ?auto_191448 ) ( not ( = ?auto_191444 ?auto_191445 ) ) ( not ( = ?auto_191444 ?auto_191446 ) ) ( not ( = ?auto_191444 ?auto_191447 ) ) ( not ( = ?auto_191444 ?auto_191448 ) ) ( not ( = ?auto_191444 ?auto_191449 ) ) ( not ( = ?auto_191444 ?auto_191450 ) ) ( not ( = ?auto_191445 ?auto_191446 ) ) ( not ( = ?auto_191445 ?auto_191447 ) ) ( not ( = ?auto_191445 ?auto_191448 ) ) ( not ( = ?auto_191445 ?auto_191449 ) ) ( not ( = ?auto_191445 ?auto_191450 ) ) ( not ( = ?auto_191446 ?auto_191447 ) ) ( not ( = ?auto_191446 ?auto_191448 ) ) ( not ( = ?auto_191446 ?auto_191449 ) ) ( not ( = ?auto_191446 ?auto_191450 ) ) ( not ( = ?auto_191447 ?auto_191448 ) ) ( not ( = ?auto_191447 ?auto_191449 ) ) ( not ( = ?auto_191447 ?auto_191450 ) ) ( not ( = ?auto_191448 ?auto_191449 ) ) ( not ( = ?auto_191448 ?auto_191450 ) ) ( not ( = ?auto_191449 ?auto_191450 ) ) ( ON ?auto_191450 ?auto_191451 ) ( CLEAR ?auto_191450 ) ( HAND-EMPTY ) ( not ( = ?auto_191444 ?auto_191451 ) ) ( not ( = ?auto_191445 ?auto_191451 ) ) ( not ( = ?auto_191446 ?auto_191451 ) ) ( not ( = ?auto_191447 ?auto_191451 ) ) ( not ( = ?auto_191448 ?auto_191451 ) ) ( not ( = ?auto_191449 ?auto_191451 ) ) ( not ( = ?auto_191450 ?auto_191451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191450 ?auto_191451 )
      ( MAKE-7PILE ?auto_191444 ?auto_191445 ?auto_191446 ?auto_191447 ?auto_191448 ?auto_191449 ?auto_191450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191452 - BLOCK
      ?auto_191453 - BLOCK
      ?auto_191454 - BLOCK
      ?auto_191455 - BLOCK
      ?auto_191456 - BLOCK
      ?auto_191457 - BLOCK
      ?auto_191458 - BLOCK
    )
    :vars
    (
      ?auto_191459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191452 ) ( ON ?auto_191453 ?auto_191452 ) ( ON ?auto_191454 ?auto_191453 ) ( ON ?auto_191455 ?auto_191454 ) ( ON ?auto_191456 ?auto_191455 ) ( not ( = ?auto_191452 ?auto_191453 ) ) ( not ( = ?auto_191452 ?auto_191454 ) ) ( not ( = ?auto_191452 ?auto_191455 ) ) ( not ( = ?auto_191452 ?auto_191456 ) ) ( not ( = ?auto_191452 ?auto_191457 ) ) ( not ( = ?auto_191452 ?auto_191458 ) ) ( not ( = ?auto_191453 ?auto_191454 ) ) ( not ( = ?auto_191453 ?auto_191455 ) ) ( not ( = ?auto_191453 ?auto_191456 ) ) ( not ( = ?auto_191453 ?auto_191457 ) ) ( not ( = ?auto_191453 ?auto_191458 ) ) ( not ( = ?auto_191454 ?auto_191455 ) ) ( not ( = ?auto_191454 ?auto_191456 ) ) ( not ( = ?auto_191454 ?auto_191457 ) ) ( not ( = ?auto_191454 ?auto_191458 ) ) ( not ( = ?auto_191455 ?auto_191456 ) ) ( not ( = ?auto_191455 ?auto_191457 ) ) ( not ( = ?auto_191455 ?auto_191458 ) ) ( not ( = ?auto_191456 ?auto_191457 ) ) ( not ( = ?auto_191456 ?auto_191458 ) ) ( not ( = ?auto_191457 ?auto_191458 ) ) ( ON ?auto_191458 ?auto_191459 ) ( CLEAR ?auto_191458 ) ( not ( = ?auto_191452 ?auto_191459 ) ) ( not ( = ?auto_191453 ?auto_191459 ) ) ( not ( = ?auto_191454 ?auto_191459 ) ) ( not ( = ?auto_191455 ?auto_191459 ) ) ( not ( = ?auto_191456 ?auto_191459 ) ) ( not ( = ?auto_191457 ?auto_191459 ) ) ( not ( = ?auto_191458 ?auto_191459 ) ) ( HOLDING ?auto_191457 ) ( CLEAR ?auto_191456 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191452 ?auto_191453 ?auto_191454 ?auto_191455 ?auto_191456 ?auto_191457 )
      ( MAKE-7PILE ?auto_191452 ?auto_191453 ?auto_191454 ?auto_191455 ?auto_191456 ?auto_191457 ?auto_191458 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191460 - BLOCK
      ?auto_191461 - BLOCK
      ?auto_191462 - BLOCK
      ?auto_191463 - BLOCK
      ?auto_191464 - BLOCK
      ?auto_191465 - BLOCK
      ?auto_191466 - BLOCK
    )
    :vars
    (
      ?auto_191467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191460 ) ( ON ?auto_191461 ?auto_191460 ) ( ON ?auto_191462 ?auto_191461 ) ( ON ?auto_191463 ?auto_191462 ) ( ON ?auto_191464 ?auto_191463 ) ( not ( = ?auto_191460 ?auto_191461 ) ) ( not ( = ?auto_191460 ?auto_191462 ) ) ( not ( = ?auto_191460 ?auto_191463 ) ) ( not ( = ?auto_191460 ?auto_191464 ) ) ( not ( = ?auto_191460 ?auto_191465 ) ) ( not ( = ?auto_191460 ?auto_191466 ) ) ( not ( = ?auto_191461 ?auto_191462 ) ) ( not ( = ?auto_191461 ?auto_191463 ) ) ( not ( = ?auto_191461 ?auto_191464 ) ) ( not ( = ?auto_191461 ?auto_191465 ) ) ( not ( = ?auto_191461 ?auto_191466 ) ) ( not ( = ?auto_191462 ?auto_191463 ) ) ( not ( = ?auto_191462 ?auto_191464 ) ) ( not ( = ?auto_191462 ?auto_191465 ) ) ( not ( = ?auto_191462 ?auto_191466 ) ) ( not ( = ?auto_191463 ?auto_191464 ) ) ( not ( = ?auto_191463 ?auto_191465 ) ) ( not ( = ?auto_191463 ?auto_191466 ) ) ( not ( = ?auto_191464 ?auto_191465 ) ) ( not ( = ?auto_191464 ?auto_191466 ) ) ( not ( = ?auto_191465 ?auto_191466 ) ) ( ON ?auto_191466 ?auto_191467 ) ( not ( = ?auto_191460 ?auto_191467 ) ) ( not ( = ?auto_191461 ?auto_191467 ) ) ( not ( = ?auto_191462 ?auto_191467 ) ) ( not ( = ?auto_191463 ?auto_191467 ) ) ( not ( = ?auto_191464 ?auto_191467 ) ) ( not ( = ?auto_191465 ?auto_191467 ) ) ( not ( = ?auto_191466 ?auto_191467 ) ) ( CLEAR ?auto_191464 ) ( ON ?auto_191465 ?auto_191466 ) ( CLEAR ?auto_191465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191467 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191467 ?auto_191466 )
      ( MAKE-7PILE ?auto_191460 ?auto_191461 ?auto_191462 ?auto_191463 ?auto_191464 ?auto_191465 ?auto_191466 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191468 - BLOCK
      ?auto_191469 - BLOCK
      ?auto_191470 - BLOCK
      ?auto_191471 - BLOCK
      ?auto_191472 - BLOCK
      ?auto_191473 - BLOCK
      ?auto_191474 - BLOCK
    )
    :vars
    (
      ?auto_191475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191468 ) ( ON ?auto_191469 ?auto_191468 ) ( ON ?auto_191470 ?auto_191469 ) ( ON ?auto_191471 ?auto_191470 ) ( not ( = ?auto_191468 ?auto_191469 ) ) ( not ( = ?auto_191468 ?auto_191470 ) ) ( not ( = ?auto_191468 ?auto_191471 ) ) ( not ( = ?auto_191468 ?auto_191472 ) ) ( not ( = ?auto_191468 ?auto_191473 ) ) ( not ( = ?auto_191468 ?auto_191474 ) ) ( not ( = ?auto_191469 ?auto_191470 ) ) ( not ( = ?auto_191469 ?auto_191471 ) ) ( not ( = ?auto_191469 ?auto_191472 ) ) ( not ( = ?auto_191469 ?auto_191473 ) ) ( not ( = ?auto_191469 ?auto_191474 ) ) ( not ( = ?auto_191470 ?auto_191471 ) ) ( not ( = ?auto_191470 ?auto_191472 ) ) ( not ( = ?auto_191470 ?auto_191473 ) ) ( not ( = ?auto_191470 ?auto_191474 ) ) ( not ( = ?auto_191471 ?auto_191472 ) ) ( not ( = ?auto_191471 ?auto_191473 ) ) ( not ( = ?auto_191471 ?auto_191474 ) ) ( not ( = ?auto_191472 ?auto_191473 ) ) ( not ( = ?auto_191472 ?auto_191474 ) ) ( not ( = ?auto_191473 ?auto_191474 ) ) ( ON ?auto_191474 ?auto_191475 ) ( not ( = ?auto_191468 ?auto_191475 ) ) ( not ( = ?auto_191469 ?auto_191475 ) ) ( not ( = ?auto_191470 ?auto_191475 ) ) ( not ( = ?auto_191471 ?auto_191475 ) ) ( not ( = ?auto_191472 ?auto_191475 ) ) ( not ( = ?auto_191473 ?auto_191475 ) ) ( not ( = ?auto_191474 ?auto_191475 ) ) ( ON ?auto_191473 ?auto_191474 ) ( CLEAR ?auto_191473 ) ( ON-TABLE ?auto_191475 ) ( HOLDING ?auto_191472 ) ( CLEAR ?auto_191471 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191468 ?auto_191469 ?auto_191470 ?auto_191471 ?auto_191472 )
      ( MAKE-7PILE ?auto_191468 ?auto_191469 ?auto_191470 ?auto_191471 ?auto_191472 ?auto_191473 ?auto_191474 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191476 - BLOCK
      ?auto_191477 - BLOCK
      ?auto_191478 - BLOCK
      ?auto_191479 - BLOCK
      ?auto_191480 - BLOCK
      ?auto_191481 - BLOCK
      ?auto_191482 - BLOCK
    )
    :vars
    (
      ?auto_191483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191476 ) ( ON ?auto_191477 ?auto_191476 ) ( ON ?auto_191478 ?auto_191477 ) ( ON ?auto_191479 ?auto_191478 ) ( not ( = ?auto_191476 ?auto_191477 ) ) ( not ( = ?auto_191476 ?auto_191478 ) ) ( not ( = ?auto_191476 ?auto_191479 ) ) ( not ( = ?auto_191476 ?auto_191480 ) ) ( not ( = ?auto_191476 ?auto_191481 ) ) ( not ( = ?auto_191476 ?auto_191482 ) ) ( not ( = ?auto_191477 ?auto_191478 ) ) ( not ( = ?auto_191477 ?auto_191479 ) ) ( not ( = ?auto_191477 ?auto_191480 ) ) ( not ( = ?auto_191477 ?auto_191481 ) ) ( not ( = ?auto_191477 ?auto_191482 ) ) ( not ( = ?auto_191478 ?auto_191479 ) ) ( not ( = ?auto_191478 ?auto_191480 ) ) ( not ( = ?auto_191478 ?auto_191481 ) ) ( not ( = ?auto_191478 ?auto_191482 ) ) ( not ( = ?auto_191479 ?auto_191480 ) ) ( not ( = ?auto_191479 ?auto_191481 ) ) ( not ( = ?auto_191479 ?auto_191482 ) ) ( not ( = ?auto_191480 ?auto_191481 ) ) ( not ( = ?auto_191480 ?auto_191482 ) ) ( not ( = ?auto_191481 ?auto_191482 ) ) ( ON ?auto_191482 ?auto_191483 ) ( not ( = ?auto_191476 ?auto_191483 ) ) ( not ( = ?auto_191477 ?auto_191483 ) ) ( not ( = ?auto_191478 ?auto_191483 ) ) ( not ( = ?auto_191479 ?auto_191483 ) ) ( not ( = ?auto_191480 ?auto_191483 ) ) ( not ( = ?auto_191481 ?auto_191483 ) ) ( not ( = ?auto_191482 ?auto_191483 ) ) ( ON ?auto_191481 ?auto_191482 ) ( ON-TABLE ?auto_191483 ) ( CLEAR ?auto_191479 ) ( ON ?auto_191480 ?auto_191481 ) ( CLEAR ?auto_191480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191483 ?auto_191482 ?auto_191481 )
      ( MAKE-7PILE ?auto_191476 ?auto_191477 ?auto_191478 ?auto_191479 ?auto_191480 ?auto_191481 ?auto_191482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191484 - BLOCK
      ?auto_191485 - BLOCK
      ?auto_191486 - BLOCK
      ?auto_191487 - BLOCK
      ?auto_191488 - BLOCK
      ?auto_191489 - BLOCK
      ?auto_191490 - BLOCK
    )
    :vars
    (
      ?auto_191491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191484 ) ( ON ?auto_191485 ?auto_191484 ) ( ON ?auto_191486 ?auto_191485 ) ( not ( = ?auto_191484 ?auto_191485 ) ) ( not ( = ?auto_191484 ?auto_191486 ) ) ( not ( = ?auto_191484 ?auto_191487 ) ) ( not ( = ?auto_191484 ?auto_191488 ) ) ( not ( = ?auto_191484 ?auto_191489 ) ) ( not ( = ?auto_191484 ?auto_191490 ) ) ( not ( = ?auto_191485 ?auto_191486 ) ) ( not ( = ?auto_191485 ?auto_191487 ) ) ( not ( = ?auto_191485 ?auto_191488 ) ) ( not ( = ?auto_191485 ?auto_191489 ) ) ( not ( = ?auto_191485 ?auto_191490 ) ) ( not ( = ?auto_191486 ?auto_191487 ) ) ( not ( = ?auto_191486 ?auto_191488 ) ) ( not ( = ?auto_191486 ?auto_191489 ) ) ( not ( = ?auto_191486 ?auto_191490 ) ) ( not ( = ?auto_191487 ?auto_191488 ) ) ( not ( = ?auto_191487 ?auto_191489 ) ) ( not ( = ?auto_191487 ?auto_191490 ) ) ( not ( = ?auto_191488 ?auto_191489 ) ) ( not ( = ?auto_191488 ?auto_191490 ) ) ( not ( = ?auto_191489 ?auto_191490 ) ) ( ON ?auto_191490 ?auto_191491 ) ( not ( = ?auto_191484 ?auto_191491 ) ) ( not ( = ?auto_191485 ?auto_191491 ) ) ( not ( = ?auto_191486 ?auto_191491 ) ) ( not ( = ?auto_191487 ?auto_191491 ) ) ( not ( = ?auto_191488 ?auto_191491 ) ) ( not ( = ?auto_191489 ?auto_191491 ) ) ( not ( = ?auto_191490 ?auto_191491 ) ) ( ON ?auto_191489 ?auto_191490 ) ( ON-TABLE ?auto_191491 ) ( ON ?auto_191488 ?auto_191489 ) ( CLEAR ?auto_191488 ) ( HOLDING ?auto_191487 ) ( CLEAR ?auto_191486 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191484 ?auto_191485 ?auto_191486 ?auto_191487 )
      ( MAKE-7PILE ?auto_191484 ?auto_191485 ?auto_191486 ?auto_191487 ?auto_191488 ?auto_191489 ?auto_191490 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191492 - BLOCK
      ?auto_191493 - BLOCK
      ?auto_191494 - BLOCK
      ?auto_191495 - BLOCK
      ?auto_191496 - BLOCK
      ?auto_191497 - BLOCK
      ?auto_191498 - BLOCK
    )
    :vars
    (
      ?auto_191499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191492 ) ( ON ?auto_191493 ?auto_191492 ) ( ON ?auto_191494 ?auto_191493 ) ( not ( = ?auto_191492 ?auto_191493 ) ) ( not ( = ?auto_191492 ?auto_191494 ) ) ( not ( = ?auto_191492 ?auto_191495 ) ) ( not ( = ?auto_191492 ?auto_191496 ) ) ( not ( = ?auto_191492 ?auto_191497 ) ) ( not ( = ?auto_191492 ?auto_191498 ) ) ( not ( = ?auto_191493 ?auto_191494 ) ) ( not ( = ?auto_191493 ?auto_191495 ) ) ( not ( = ?auto_191493 ?auto_191496 ) ) ( not ( = ?auto_191493 ?auto_191497 ) ) ( not ( = ?auto_191493 ?auto_191498 ) ) ( not ( = ?auto_191494 ?auto_191495 ) ) ( not ( = ?auto_191494 ?auto_191496 ) ) ( not ( = ?auto_191494 ?auto_191497 ) ) ( not ( = ?auto_191494 ?auto_191498 ) ) ( not ( = ?auto_191495 ?auto_191496 ) ) ( not ( = ?auto_191495 ?auto_191497 ) ) ( not ( = ?auto_191495 ?auto_191498 ) ) ( not ( = ?auto_191496 ?auto_191497 ) ) ( not ( = ?auto_191496 ?auto_191498 ) ) ( not ( = ?auto_191497 ?auto_191498 ) ) ( ON ?auto_191498 ?auto_191499 ) ( not ( = ?auto_191492 ?auto_191499 ) ) ( not ( = ?auto_191493 ?auto_191499 ) ) ( not ( = ?auto_191494 ?auto_191499 ) ) ( not ( = ?auto_191495 ?auto_191499 ) ) ( not ( = ?auto_191496 ?auto_191499 ) ) ( not ( = ?auto_191497 ?auto_191499 ) ) ( not ( = ?auto_191498 ?auto_191499 ) ) ( ON ?auto_191497 ?auto_191498 ) ( ON-TABLE ?auto_191499 ) ( ON ?auto_191496 ?auto_191497 ) ( CLEAR ?auto_191494 ) ( ON ?auto_191495 ?auto_191496 ) ( CLEAR ?auto_191495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191499 ?auto_191498 ?auto_191497 ?auto_191496 )
      ( MAKE-7PILE ?auto_191492 ?auto_191493 ?auto_191494 ?auto_191495 ?auto_191496 ?auto_191497 ?auto_191498 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191500 - BLOCK
      ?auto_191501 - BLOCK
      ?auto_191502 - BLOCK
      ?auto_191503 - BLOCK
      ?auto_191504 - BLOCK
      ?auto_191505 - BLOCK
      ?auto_191506 - BLOCK
    )
    :vars
    (
      ?auto_191507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191500 ) ( ON ?auto_191501 ?auto_191500 ) ( not ( = ?auto_191500 ?auto_191501 ) ) ( not ( = ?auto_191500 ?auto_191502 ) ) ( not ( = ?auto_191500 ?auto_191503 ) ) ( not ( = ?auto_191500 ?auto_191504 ) ) ( not ( = ?auto_191500 ?auto_191505 ) ) ( not ( = ?auto_191500 ?auto_191506 ) ) ( not ( = ?auto_191501 ?auto_191502 ) ) ( not ( = ?auto_191501 ?auto_191503 ) ) ( not ( = ?auto_191501 ?auto_191504 ) ) ( not ( = ?auto_191501 ?auto_191505 ) ) ( not ( = ?auto_191501 ?auto_191506 ) ) ( not ( = ?auto_191502 ?auto_191503 ) ) ( not ( = ?auto_191502 ?auto_191504 ) ) ( not ( = ?auto_191502 ?auto_191505 ) ) ( not ( = ?auto_191502 ?auto_191506 ) ) ( not ( = ?auto_191503 ?auto_191504 ) ) ( not ( = ?auto_191503 ?auto_191505 ) ) ( not ( = ?auto_191503 ?auto_191506 ) ) ( not ( = ?auto_191504 ?auto_191505 ) ) ( not ( = ?auto_191504 ?auto_191506 ) ) ( not ( = ?auto_191505 ?auto_191506 ) ) ( ON ?auto_191506 ?auto_191507 ) ( not ( = ?auto_191500 ?auto_191507 ) ) ( not ( = ?auto_191501 ?auto_191507 ) ) ( not ( = ?auto_191502 ?auto_191507 ) ) ( not ( = ?auto_191503 ?auto_191507 ) ) ( not ( = ?auto_191504 ?auto_191507 ) ) ( not ( = ?auto_191505 ?auto_191507 ) ) ( not ( = ?auto_191506 ?auto_191507 ) ) ( ON ?auto_191505 ?auto_191506 ) ( ON-TABLE ?auto_191507 ) ( ON ?auto_191504 ?auto_191505 ) ( ON ?auto_191503 ?auto_191504 ) ( CLEAR ?auto_191503 ) ( HOLDING ?auto_191502 ) ( CLEAR ?auto_191501 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191500 ?auto_191501 ?auto_191502 )
      ( MAKE-7PILE ?auto_191500 ?auto_191501 ?auto_191502 ?auto_191503 ?auto_191504 ?auto_191505 ?auto_191506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191508 - BLOCK
      ?auto_191509 - BLOCK
      ?auto_191510 - BLOCK
      ?auto_191511 - BLOCK
      ?auto_191512 - BLOCK
      ?auto_191513 - BLOCK
      ?auto_191514 - BLOCK
    )
    :vars
    (
      ?auto_191515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191508 ) ( ON ?auto_191509 ?auto_191508 ) ( not ( = ?auto_191508 ?auto_191509 ) ) ( not ( = ?auto_191508 ?auto_191510 ) ) ( not ( = ?auto_191508 ?auto_191511 ) ) ( not ( = ?auto_191508 ?auto_191512 ) ) ( not ( = ?auto_191508 ?auto_191513 ) ) ( not ( = ?auto_191508 ?auto_191514 ) ) ( not ( = ?auto_191509 ?auto_191510 ) ) ( not ( = ?auto_191509 ?auto_191511 ) ) ( not ( = ?auto_191509 ?auto_191512 ) ) ( not ( = ?auto_191509 ?auto_191513 ) ) ( not ( = ?auto_191509 ?auto_191514 ) ) ( not ( = ?auto_191510 ?auto_191511 ) ) ( not ( = ?auto_191510 ?auto_191512 ) ) ( not ( = ?auto_191510 ?auto_191513 ) ) ( not ( = ?auto_191510 ?auto_191514 ) ) ( not ( = ?auto_191511 ?auto_191512 ) ) ( not ( = ?auto_191511 ?auto_191513 ) ) ( not ( = ?auto_191511 ?auto_191514 ) ) ( not ( = ?auto_191512 ?auto_191513 ) ) ( not ( = ?auto_191512 ?auto_191514 ) ) ( not ( = ?auto_191513 ?auto_191514 ) ) ( ON ?auto_191514 ?auto_191515 ) ( not ( = ?auto_191508 ?auto_191515 ) ) ( not ( = ?auto_191509 ?auto_191515 ) ) ( not ( = ?auto_191510 ?auto_191515 ) ) ( not ( = ?auto_191511 ?auto_191515 ) ) ( not ( = ?auto_191512 ?auto_191515 ) ) ( not ( = ?auto_191513 ?auto_191515 ) ) ( not ( = ?auto_191514 ?auto_191515 ) ) ( ON ?auto_191513 ?auto_191514 ) ( ON-TABLE ?auto_191515 ) ( ON ?auto_191512 ?auto_191513 ) ( ON ?auto_191511 ?auto_191512 ) ( CLEAR ?auto_191509 ) ( ON ?auto_191510 ?auto_191511 ) ( CLEAR ?auto_191510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191515 ?auto_191514 ?auto_191513 ?auto_191512 ?auto_191511 )
      ( MAKE-7PILE ?auto_191508 ?auto_191509 ?auto_191510 ?auto_191511 ?auto_191512 ?auto_191513 ?auto_191514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191516 - BLOCK
      ?auto_191517 - BLOCK
      ?auto_191518 - BLOCK
      ?auto_191519 - BLOCK
      ?auto_191520 - BLOCK
      ?auto_191521 - BLOCK
      ?auto_191522 - BLOCK
    )
    :vars
    (
      ?auto_191523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191516 ) ( not ( = ?auto_191516 ?auto_191517 ) ) ( not ( = ?auto_191516 ?auto_191518 ) ) ( not ( = ?auto_191516 ?auto_191519 ) ) ( not ( = ?auto_191516 ?auto_191520 ) ) ( not ( = ?auto_191516 ?auto_191521 ) ) ( not ( = ?auto_191516 ?auto_191522 ) ) ( not ( = ?auto_191517 ?auto_191518 ) ) ( not ( = ?auto_191517 ?auto_191519 ) ) ( not ( = ?auto_191517 ?auto_191520 ) ) ( not ( = ?auto_191517 ?auto_191521 ) ) ( not ( = ?auto_191517 ?auto_191522 ) ) ( not ( = ?auto_191518 ?auto_191519 ) ) ( not ( = ?auto_191518 ?auto_191520 ) ) ( not ( = ?auto_191518 ?auto_191521 ) ) ( not ( = ?auto_191518 ?auto_191522 ) ) ( not ( = ?auto_191519 ?auto_191520 ) ) ( not ( = ?auto_191519 ?auto_191521 ) ) ( not ( = ?auto_191519 ?auto_191522 ) ) ( not ( = ?auto_191520 ?auto_191521 ) ) ( not ( = ?auto_191520 ?auto_191522 ) ) ( not ( = ?auto_191521 ?auto_191522 ) ) ( ON ?auto_191522 ?auto_191523 ) ( not ( = ?auto_191516 ?auto_191523 ) ) ( not ( = ?auto_191517 ?auto_191523 ) ) ( not ( = ?auto_191518 ?auto_191523 ) ) ( not ( = ?auto_191519 ?auto_191523 ) ) ( not ( = ?auto_191520 ?auto_191523 ) ) ( not ( = ?auto_191521 ?auto_191523 ) ) ( not ( = ?auto_191522 ?auto_191523 ) ) ( ON ?auto_191521 ?auto_191522 ) ( ON-TABLE ?auto_191523 ) ( ON ?auto_191520 ?auto_191521 ) ( ON ?auto_191519 ?auto_191520 ) ( ON ?auto_191518 ?auto_191519 ) ( CLEAR ?auto_191518 ) ( HOLDING ?auto_191517 ) ( CLEAR ?auto_191516 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191516 ?auto_191517 )
      ( MAKE-7PILE ?auto_191516 ?auto_191517 ?auto_191518 ?auto_191519 ?auto_191520 ?auto_191521 ?auto_191522 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191524 - BLOCK
      ?auto_191525 - BLOCK
      ?auto_191526 - BLOCK
      ?auto_191527 - BLOCK
      ?auto_191528 - BLOCK
      ?auto_191529 - BLOCK
      ?auto_191530 - BLOCK
    )
    :vars
    (
      ?auto_191531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191524 ) ( not ( = ?auto_191524 ?auto_191525 ) ) ( not ( = ?auto_191524 ?auto_191526 ) ) ( not ( = ?auto_191524 ?auto_191527 ) ) ( not ( = ?auto_191524 ?auto_191528 ) ) ( not ( = ?auto_191524 ?auto_191529 ) ) ( not ( = ?auto_191524 ?auto_191530 ) ) ( not ( = ?auto_191525 ?auto_191526 ) ) ( not ( = ?auto_191525 ?auto_191527 ) ) ( not ( = ?auto_191525 ?auto_191528 ) ) ( not ( = ?auto_191525 ?auto_191529 ) ) ( not ( = ?auto_191525 ?auto_191530 ) ) ( not ( = ?auto_191526 ?auto_191527 ) ) ( not ( = ?auto_191526 ?auto_191528 ) ) ( not ( = ?auto_191526 ?auto_191529 ) ) ( not ( = ?auto_191526 ?auto_191530 ) ) ( not ( = ?auto_191527 ?auto_191528 ) ) ( not ( = ?auto_191527 ?auto_191529 ) ) ( not ( = ?auto_191527 ?auto_191530 ) ) ( not ( = ?auto_191528 ?auto_191529 ) ) ( not ( = ?auto_191528 ?auto_191530 ) ) ( not ( = ?auto_191529 ?auto_191530 ) ) ( ON ?auto_191530 ?auto_191531 ) ( not ( = ?auto_191524 ?auto_191531 ) ) ( not ( = ?auto_191525 ?auto_191531 ) ) ( not ( = ?auto_191526 ?auto_191531 ) ) ( not ( = ?auto_191527 ?auto_191531 ) ) ( not ( = ?auto_191528 ?auto_191531 ) ) ( not ( = ?auto_191529 ?auto_191531 ) ) ( not ( = ?auto_191530 ?auto_191531 ) ) ( ON ?auto_191529 ?auto_191530 ) ( ON-TABLE ?auto_191531 ) ( ON ?auto_191528 ?auto_191529 ) ( ON ?auto_191527 ?auto_191528 ) ( ON ?auto_191526 ?auto_191527 ) ( CLEAR ?auto_191524 ) ( ON ?auto_191525 ?auto_191526 ) ( CLEAR ?auto_191525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191531 ?auto_191530 ?auto_191529 ?auto_191528 ?auto_191527 ?auto_191526 )
      ( MAKE-7PILE ?auto_191524 ?auto_191525 ?auto_191526 ?auto_191527 ?auto_191528 ?auto_191529 ?auto_191530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191532 - BLOCK
      ?auto_191533 - BLOCK
      ?auto_191534 - BLOCK
      ?auto_191535 - BLOCK
      ?auto_191536 - BLOCK
      ?auto_191537 - BLOCK
      ?auto_191538 - BLOCK
    )
    :vars
    (
      ?auto_191539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191532 ?auto_191533 ) ) ( not ( = ?auto_191532 ?auto_191534 ) ) ( not ( = ?auto_191532 ?auto_191535 ) ) ( not ( = ?auto_191532 ?auto_191536 ) ) ( not ( = ?auto_191532 ?auto_191537 ) ) ( not ( = ?auto_191532 ?auto_191538 ) ) ( not ( = ?auto_191533 ?auto_191534 ) ) ( not ( = ?auto_191533 ?auto_191535 ) ) ( not ( = ?auto_191533 ?auto_191536 ) ) ( not ( = ?auto_191533 ?auto_191537 ) ) ( not ( = ?auto_191533 ?auto_191538 ) ) ( not ( = ?auto_191534 ?auto_191535 ) ) ( not ( = ?auto_191534 ?auto_191536 ) ) ( not ( = ?auto_191534 ?auto_191537 ) ) ( not ( = ?auto_191534 ?auto_191538 ) ) ( not ( = ?auto_191535 ?auto_191536 ) ) ( not ( = ?auto_191535 ?auto_191537 ) ) ( not ( = ?auto_191535 ?auto_191538 ) ) ( not ( = ?auto_191536 ?auto_191537 ) ) ( not ( = ?auto_191536 ?auto_191538 ) ) ( not ( = ?auto_191537 ?auto_191538 ) ) ( ON ?auto_191538 ?auto_191539 ) ( not ( = ?auto_191532 ?auto_191539 ) ) ( not ( = ?auto_191533 ?auto_191539 ) ) ( not ( = ?auto_191534 ?auto_191539 ) ) ( not ( = ?auto_191535 ?auto_191539 ) ) ( not ( = ?auto_191536 ?auto_191539 ) ) ( not ( = ?auto_191537 ?auto_191539 ) ) ( not ( = ?auto_191538 ?auto_191539 ) ) ( ON ?auto_191537 ?auto_191538 ) ( ON-TABLE ?auto_191539 ) ( ON ?auto_191536 ?auto_191537 ) ( ON ?auto_191535 ?auto_191536 ) ( ON ?auto_191534 ?auto_191535 ) ( ON ?auto_191533 ?auto_191534 ) ( CLEAR ?auto_191533 ) ( HOLDING ?auto_191532 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191532 )
      ( MAKE-7PILE ?auto_191532 ?auto_191533 ?auto_191534 ?auto_191535 ?auto_191536 ?auto_191537 ?auto_191538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191540 - BLOCK
      ?auto_191541 - BLOCK
      ?auto_191542 - BLOCK
      ?auto_191543 - BLOCK
      ?auto_191544 - BLOCK
      ?auto_191545 - BLOCK
      ?auto_191546 - BLOCK
    )
    :vars
    (
      ?auto_191547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191540 ?auto_191541 ) ) ( not ( = ?auto_191540 ?auto_191542 ) ) ( not ( = ?auto_191540 ?auto_191543 ) ) ( not ( = ?auto_191540 ?auto_191544 ) ) ( not ( = ?auto_191540 ?auto_191545 ) ) ( not ( = ?auto_191540 ?auto_191546 ) ) ( not ( = ?auto_191541 ?auto_191542 ) ) ( not ( = ?auto_191541 ?auto_191543 ) ) ( not ( = ?auto_191541 ?auto_191544 ) ) ( not ( = ?auto_191541 ?auto_191545 ) ) ( not ( = ?auto_191541 ?auto_191546 ) ) ( not ( = ?auto_191542 ?auto_191543 ) ) ( not ( = ?auto_191542 ?auto_191544 ) ) ( not ( = ?auto_191542 ?auto_191545 ) ) ( not ( = ?auto_191542 ?auto_191546 ) ) ( not ( = ?auto_191543 ?auto_191544 ) ) ( not ( = ?auto_191543 ?auto_191545 ) ) ( not ( = ?auto_191543 ?auto_191546 ) ) ( not ( = ?auto_191544 ?auto_191545 ) ) ( not ( = ?auto_191544 ?auto_191546 ) ) ( not ( = ?auto_191545 ?auto_191546 ) ) ( ON ?auto_191546 ?auto_191547 ) ( not ( = ?auto_191540 ?auto_191547 ) ) ( not ( = ?auto_191541 ?auto_191547 ) ) ( not ( = ?auto_191542 ?auto_191547 ) ) ( not ( = ?auto_191543 ?auto_191547 ) ) ( not ( = ?auto_191544 ?auto_191547 ) ) ( not ( = ?auto_191545 ?auto_191547 ) ) ( not ( = ?auto_191546 ?auto_191547 ) ) ( ON ?auto_191545 ?auto_191546 ) ( ON-TABLE ?auto_191547 ) ( ON ?auto_191544 ?auto_191545 ) ( ON ?auto_191543 ?auto_191544 ) ( ON ?auto_191542 ?auto_191543 ) ( ON ?auto_191541 ?auto_191542 ) ( ON ?auto_191540 ?auto_191541 ) ( CLEAR ?auto_191540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191547 ?auto_191546 ?auto_191545 ?auto_191544 ?auto_191543 ?auto_191542 ?auto_191541 )
      ( MAKE-7PILE ?auto_191540 ?auto_191541 ?auto_191542 ?auto_191543 ?auto_191544 ?auto_191545 ?auto_191546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191548 - BLOCK
      ?auto_191549 - BLOCK
      ?auto_191550 - BLOCK
      ?auto_191551 - BLOCK
      ?auto_191552 - BLOCK
      ?auto_191553 - BLOCK
      ?auto_191554 - BLOCK
    )
    :vars
    (
      ?auto_191555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191548 ?auto_191549 ) ) ( not ( = ?auto_191548 ?auto_191550 ) ) ( not ( = ?auto_191548 ?auto_191551 ) ) ( not ( = ?auto_191548 ?auto_191552 ) ) ( not ( = ?auto_191548 ?auto_191553 ) ) ( not ( = ?auto_191548 ?auto_191554 ) ) ( not ( = ?auto_191549 ?auto_191550 ) ) ( not ( = ?auto_191549 ?auto_191551 ) ) ( not ( = ?auto_191549 ?auto_191552 ) ) ( not ( = ?auto_191549 ?auto_191553 ) ) ( not ( = ?auto_191549 ?auto_191554 ) ) ( not ( = ?auto_191550 ?auto_191551 ) ) ( not ( = ?auto_191550 ?auto_191552 ) ) ( not ( = ?auto_191550 ?auto_191553 ) ) ( not ( = ?auto_191550 ?auto_191554 ) ) ( not ( = ?auto_191551 ?auto_191552 ) ) ( not ( = ?auto_191551 ?auto_191553 ) ) ( not ( = ?auto_191551 ?auto_191554 ) ) ( not ( = ?auto_191552 ?auto_191553 ) ) ( not ( = ?auto_191552 ?auto_191554 ) ) ( not ( = ?auto_191553 ?auto_191554 ) ) ( ON ?auto_191554 ?auto_191555 ) ( not ( = ?auto_191548 ?auto_191555 ) ) ( not ( = ?auto_191549 ?auto_191555 ) ) ( not ( = ?auto_191550 ?auto_191555 ) ) ( not ( = ?auto_191551 ?auto_191555 ) ) ( not ( = ?auto_191552 ?auto_191555 ) ) ( not ( = ?auto_191553 ?auto_191555 ) ) ( not ( = ?auto_191554 ?auto_191555 ) ) ( ON ?auto_191553 ?auto_191554 ) ( ON-TABLE ?auto_191555 ) ( ON ?auto_191552 ?auto_191553 ) ( ON ?auto_191551 ?auto_191552 ) ( ON ?auto_191550 ?auto_191551 ) ( ON ?auto_191549 ?auto_191550 ) ( HOLDING ?auto_191548 ) ( CLEAR ?auto_191549 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191555 ?auto_191554 ?auto_191553 ?auto_191552 ?auto_191551 ?auto_191550 ?auto_191549 ?auto_191548 )
      ( MAKE-7PILE ?auto_191548 ?auto_191549 ?auto_191550 ?auto_191551 ?auto_191552 ?auto_191553 ?auto_191554 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191556 - BLOCK
      ?auto_191557 - BLOCK
      ?auto_191558 - BLOCK
      ?auto_191559 - BLOCK
      ?auto_191560 - BLOCK
      ?auto_191561 - BLOCK
      ?auto_191562 - BLOCK
    )
    :vars
    (
      ?auto_191563 - BLOCK
      ?auto_191564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191556 ?auto_191557 ) ) ( not ( = ?auto_191556 ?auto_191558 ) ) ( not ( = ?auto_191556 ?auto_191559 ) ) ( not ( = ?auto_191556 ?auto_191560 ) ) ( not ( = ?auto_191556 ?auto_191561 ) ) ( not ( = ?auto_191556 ?auto_191562 ) ) ( not ( = ?auto_191557 ?auto_191558 ) ) ( not ( = ?auto_191557 ?auto_191559 ) ) ( not ( = ?auto_191557 ?auto_191560 ) ) ( not ( = ?auto_191557 ?auto_191561 ) ) ( not ( = ?auto_191557 ?auto_191562 ) ) ( not ( = ?auto_191558 ?auto_191559 ) ) ( not ( = ?auto_191558 ?auto_191560 ) ) ( not ( = ?auto_191558 ?auto_191561 ) ) ( not ( = ?auto_191558 ?auto_191562 ) ) ( not ( = ?auto_191559 ?auto_191560 ) ) ( not ( = ?auto_191559 ?auto_191561 ) ) ( not ( = ?auto_191559 ?auto_191562 ) ) ( not ( = ?auto_191560 ?auto_191561 ) ) ( not ( = ?auto_191560 ?auto_191562 ) ) ( not ( = ?auto_191561 ?auto_191562 ) ) ( ON ?auto_191562 ?auto_191563 ) ( not ( = ?auto_191556 ?auto_191563 ) ) ( not ( = ?auto_191557 ?auto_191563 ) ) ( not ( = ?auto_191558 ?auto_191563 ) ) ( not ( = ?auto_191559 ?auto_191563 ) ) ( not ( = ?auto_191560 ?auto_191563 ) ) ( not ( = ?auto_191561 ?auto_191563 ) ) ( not ( = ?auto_191562 ?auto_191563 ) ) ( ON ?auto_191561 ?auto_191562 ) ( ON-TABLE ?auto_191563 ) ( ON ?auto_191560 ?auto_191561 ) ( ON ?auto_191559 ?auto_191560 ) ( ON ?auto_191558 ?auto_191559 ) ( ON ?auto_191557 ?auto_191558 ) ( CLEAR ?auto_191557 ) ( ON ?auto_191556 ?auto_191564 ) ( CLEAR ?auto_191556 ) ( HAND-EMPTY ) ( not ( = ?auto_191556 ?auto_191564 ) ) ( not ( = ?auto_191557 ?auto_191564 ) ) ( not ( = ?auto_191558 ?auto_191564 ) ) ( not ( = ?auto_191559 ?auto_191564 ) ) ( not ( = ?auto_191560 ?auto_191564 ) ) ( not ( = ?auto_191561 ?auto_191564 ) ) ( not ( = ?auto_191562 ?auto_191564 ) ) ( not ( = ?auto_191563 ?auto_191564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191556 ?auto_191564 )
      ( MAKE-7PILE ?auto_191556 ?auto_191557 ?auto_191558 ?auto_191559 ?auto_191560 ?auto_191561 ?auto_191562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191565 - BLOCK
      ?auto_191566 - BLOCK
      ?auto_191567 - BLOCK
      ?auto_191568 - BLOCK
      ?auto_191569 - BLOCK
      ?auto_191570 - BLOCK
      ?auto_191571 - BLOCK
    )
    :vars
    (
      ?auto_191573 - BLOCK
      ?auto_191572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191565 ?auto_191566 ) ) ( not ( = ?auto_191565 ?auto_191567 ) ) ( not ( = ?auto_191565 ?auto_191568 ) ) ( not ( = ?auto_191565 ?auto_191569 ) ) ( not ( = ?auto_191565 ?auto_191570 ) ) ( not ( = ?auto_191565 ?auto_191571 ) ) ( not ( = ?auto_191566 ?auto_191567 ) ) ( not ( = ?auto_191566 ?auto_191568 ) ) ( not ( = ?auto_191566 ?auto_191569 ) ) ( not ( = ?auto_191566 ?auto_191570 ) ) ( not ( = ?auto_191566 ?auto_191571 ) ) ( not ( = ?auto_191567 ?auto_191568 ) ) ( not ( = ?auto_191567 ?auto_191569 ) ) ( not ( = ?auto_191567 ?auto_191570 ) ) ( not ( = ?auto_191567 ?auto_191571 ) ) ( not ( = ?auto_191568 ?auto_191569 ) ) ( not ( = ?auto_191568 ?auto_191570 ) ) ( not ( = ?auto_191568 ?auto_191571 ) ) ( not ( = ?auto_191569 ?auto_191570 ) ) ( not ( = ?auto_191569 ?auto_191571 ) ) ( not ( = ?auto_191570 ?auto_191571 ) ) ( ON ?auto_191571 ?auto_191573 ) ( not ( = ?auto_191565 ?auto_191573 ) ) ( not ( = ?auto_191566 ?auto_191573 ) ) ( not ( = ?auto_191567 ?auto_191573 ) ) ( not ( = ?auto_191568 ?auto_191573 ) ) ( not ( = ?auto_191569 ?auto_191573 ) ) ( not ( = ?auto_191570 ?auto_191573 ) ) ( not ( = ?auto_191571 ?auto_191573 ) ) ( ON ?auto_191570 ?auto_191571 ) ( ON-TABLE ?auto_191573 ) ( ON ?auto_191569 ?auto_191570 ) ( ON ?auto_191568 ?auto_191569 ) ( ON ?auto_191567 ?auto_191568 ) ( ON ?auto_191565 ?auto_191572 ) ( CLEAR ?auto_191565 ) ( not ( = ?auto_191565 ?auto_191572 ) ) ( not ( = ?auto_191566 ?auto_191572 ) ) ( not ( = ?auto_191567 ?auto_191572 ) ) ( not ( = ?auto_191568 ?auto_191572 ) ) ( not ( = ?auto_191569 ?auto_191572 ) ) ( not ( = ?auto_191570 ?auto_191572 ) ) ( not ( = ?auto_191571 ?auto_191572 ) ) ( not ( = ?auto_191573 ?auto_191572 ) ) ( HOLDING ?auto_191566 ) ( CLEAR ?auto_191567 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191573 ?auto_191571 ?auto_191570 ?auto_191569 ?auto_191568 ?auto_191567 ?auto_191566 )
      ( MAKE-7PILE ?auto_191565 ?auto_191566 ?auto_191567 ?auto_191568 ?auto_191569 ?auto_191570 ?auto_191571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191574 - BLOCK
      ?auto_191575 - BLOCK
      ?auto_191576 - BLOCK
      ?auto_191577 - BLOCK
      ?auto_191578 - BLOCK
      ?auto_191579 - BLOCK
      ?auto_191580 - BLOCK
    )
    :vars
    (
      ?auto_191581 - BLOCK
      ?auto_191582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191574 ?auto_191575 ) ) ( not ( = ?auto_191574 ?auto_191576 ) ) ( not ( = ?auto_191574 ?auto_191577 ) ) ( not ( = ?auto_191574 ?auto_191578 ) ) ( not ( = ?auto_191574 ?auto_191579 ) ) ( not ( = ?auto_191574 ?auto_191580 ) ) ( not ( = ?auto_191575 ?auto_191576 ) ) ( not ( = ?auto_191575 ?auto_191577 ) ) ( not ( = ?auto_191575 ?auto_191578 ) ) ( not ( = ?auto_191575 ?auto_191579 ) ) ( not ( = ?auto_191575 ?auto_191580 ) ) ( not ( = ?auto_191576 ?auto_191577 ) ) ( not ( = ?auto_191576 ?auto_191578 ) ) ( not ( = ?auto_191576 ?auto_191579 ) ) ( not ( = ?auto_191576 ?auto_191580 ) ) ( not ( = ?auto_191577 ?auto_191578 ) ) ( not ( = ?auto_191577 ?auto_191579 ) ) ( not ( = ?auto_191577 ?auto_191580 ) ) ( not ( = ?auto_191578 ?auto_191579 ) ) ( not ( = ?auto_191578 ?auto_191580 ) ) ( not ( = ?auto_191579 ?auto_191580 ) ) ( ON ?auto_191580 ?auto_191581 ) ( not ( = ?auto_191574 ?auto_191581 ) ) ( not ( = ?auto_191575 ?auto_191581 ) ) ( not ( = ?auto_191576 ?auto_191581 ) ) ( not ( = ?auto_191577 ?auto_191581 ) ) ( not ( = ?auto_191578 ?auto_191581 ) ) ( not ( = ?auto_191579 ?auto_191581 ) ) ( not ( = ?auto_191580 ?auto_191581 ) ) ( ON ?auto_191579 ?auto_191580 ) ( ON-TABLE ?auto_191581 ) ( ON ?auto_191578 ?auto_191579 ) ( ON ?auto_191577 ?auto_191578 ) ( ON ?auto_191576 ?auto_191577 ) ( ON ?auto_191574 ?auto_191582 ) ( not ( = ?auto_191574 ?auto_191582 ) ) ( not ( = ?auto_191575 ?auto_191582 ) ) ( not ( = ?auto_191576 ?auto_191582 ) ) ( not ( = ?auto_191577 ?auto_191582 ) ) ( not ( = ?auto_191578 ?auto_191582 ) ) ( not ( = ?auto_191579 ?auto_191582 ) ) ( not ( = ?auto_191580 ?auto_191582 ) ) ( not ( = ?auto_191581 ?auto_191582 ) ) ( CLEAR ?auto_191576 ) ( ON ?auto_191575 ?auto_191574 ) ( CLEAR ?auto_191575 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191582 ?auto_191574 )
      ( MAKE-7PILE ?auto_191574 ?auto_191575 ?auto_191576 ?auto_191577 ?auto_191578 ?auto_191579 ?auto_191580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191583 - BLOCK
      ?auto_191584 - BLOCK
      ?auto_191585 - BLOCK
      ?auto_191586 - BLOCK
      ?auto_191587 - BLOCK
      ?auto_191588 - BLOCK
      ?auto_191589 - BLOCK
    )
    :vars
    (
      ?auto_191591 - BLOCK
      ?auto_191590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191583 ?auto_191584 ) ) ( not ( = ?auto_191583 ?auto_191585 ) ) ( not ( = ?auto_191583 ?auto_191586 ) ) ( not ( = ?auto_191583 ?auto_191587 ) ) ( not ( = ?auto_191583 ?auto_191588 ) ) ( not ( = ?auto_191583 ?auto_191589 ) ) ( not ( = ?auto_191584 ?auto_191585 ) ) ( not ( = ?auto_191584 ?auto_191586 ) ) ( not ( = ?auto_191584 ?auto_191587 ) ) ( not ( = ?auto_191584 ?auto_191588 ) ) ( not ( = ?auto_191584 ?auto_191589 ) ) ( not ( = ?auto_191585 ?auto_191586 ) ) ( not ( = ?auto_191585 ?auto_191587 ) ) ( not ( = ?auto_191585 ?auto_191588 ) ) ( not ( = ?auto_191585 ?auto_191589 ) ) ( not ( = ?auto_191586 ?auto_191587 ) ) ( not ( = ?auto_191586 ?auto_191588 ) ) ( not ( = ?auto_191586 ?auto_191589 ) ) ( not ( = ?auto_191587 ?auto_191588 ) ) ( not ( = ?auto_191587 ?auto_191589 ) ) ( not ( = ?auto_191588 ?auto_191589 ) ) ( ON ?auto_191589 ?auto_191591 ) ( not ( = ?auto_191583 ?auto_191591 ) ) ( not ( = ?auto_191584 ?auto_191591 ) ) ( not ( = ?auto_191585 ?auto_191591 ) ) ( not ( = ?auto_191586 ?auto_191591 ) ) ( not ( = ?auto_191587 ?auto_191591 ) ) ( not ( = ?auto_191588 ?auto_191591 ) ) ( not ( = ?auto_191589 ?auto_191591 ) ) ( ON ?auto_191588 ?auto_191589 ) ( ON-TABLE ?auto_191591 ) ( ON ?auto_191587 ?auto_191588 ) ( ON ?auto_191586 ?auto_191587 ) ( ON ?auto_191583 ?auto_191590 ) ( not ( = ?auto_191583 ?auto_191590 ) ) ( not ( = ?auto_191584 ?auto_191590 ) ) ( not ( = ?auto_191585 ?auto_191590 ) ) ( not ( = ?auto_191586 ?auto_191590 ) ) ( not ( = ?auto_191587 ?auto_191590 ) ) ( not ( = ?auto_191588 ?auto_191590 ) ) ( not ( = ?auto_191589 ?auto_191590 ) ) ( not ( = ?auto_191591 ?auto_191590 ) ) ( ON ?auto_191584 ?auto_191583 ) ( CLEAR ?auto_191584 ) ( ON-TABLE ?auto_191590 ) ( HOLDING ?auto_191585 ) ( CLEAR ?auto_191586 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191591 ?auto_191589 ?auto_191588 ?auto_191587 ?auto_191586 ?auto_191585 )
      ( MAKE-7PILE ?auto_191583 ?auto_191584 ?auto_191585 ?auto_191586 ?auto_191587 ?auto_191588 ?auto_191589 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191592 - BLOCK
      ?auto_191593 - BLOCK
      ?auto_191594 - BLOCK
      ?auto_191595 - BLOCK
      ?auto_191596 - BLOCK
      ?auto_191597 - BLOCK
      ?auto_191598 - BLOCK
    )
    :vars
    (
      ?auto_191599 - BLOCK
      ?auto_191600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191592 ?auto_191593 ) ) ( not ( = ?auto_191592 ?auto_191594 ) ) ( not ( = ?auto_191592 ?auto_191595 ) ) ( not ( = ?auto_191592 ?auto_191596 ) ) ( not ( = ?auto_191592 ?auto_191597 ) ) ( not ( = ?auto_191592 ?auto_191598 ) ) ( not ( = ?auto_191593 ?auto_191594 ) ) ( not ( = ?auto_191593 ?auto_191595 ) ) ( not ( = ?auto_191593 ?auto_191596 ) ) ( not ( = ?auto_191593 ?auto_191597 ) ) ( not ( = ?auto_191593 ?auto_191598 ) ) ( not ( = ?auto_191594 ?auto_191595 ) ) ( not ( = ?auto_191594 ?auto_191596 ) ) ( not ( = ?auto_191594 ?auto_191597 ) ) ( not ( = ?auto_191594 ?auto_191598 ) ) ( not ( = ?auto_191595 ?auto_191596 ) ) ( not ( = ?auto_191595 ?auto_191597 ) ) ( not ( = ?auto_191595 ?auto_191598 ) ) ( not ( = ?auto_191596 ?auto_191597 ) ) ( not ( = ?auto_191596 ?auto_191598 ) ) ( not ( = ?auto_191597 ?auto_191598 ) ) ( ON ?auto_191598 ?auto_191599 ) ( not ( = ?auto_191592 ?auto_191599 ) ) ( not ( = ?auto_191593 ?auto_191599 ) ) ( not ( = ?auto_191594 ?auto_191599 ) ) ( not ( = ?auto_191595 ?auto_191599 ) ) ( not ( = ?auto_191596 ?auto_191599 ) ) ( not ( = ?auto_191597 ?auto_191599 ) ) ( not ( = ?auto_191598 ?auto_191599 ) ) ( ON ?auto_191597 ?auto_191598 ) ( ON-TABLE ?auto_191599 ) ( ON ?auto_191596 ?auto_191597 ) ( ON ?auto_191595 ?auto_191596 ) ( ON ?auto_191592 ?auto_191600 ) ( not ( = ?auto_191592 ?auto_191600 ) ) ( not ( = ?auto_191593 ?auto_191600 ) ) ( not ( = ?auto_191594 ?auto_191600 ) ) ( not ( = ?auto_191595 ?auto_191600 ) ) ( not ( = ?auto_191596 ?auto_191600 ) ) ( not ( = ?auto_191597 ?auto_191600 ) ) ( not ( = ?auto_191598 ?auto_191600 ) ) ( not ( = ?auto_191599 ?auto_191600 ) ) ( ON ?auto_191593 ?auto_191592 ) ( ON-TABLE ?auto_191600 ) ( CLEAR ?auto_191595 ) ( ON ?auto_191594 ?auto_191593 ) ( CLEAR ?auto_191594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191600 ?auto_191592 ?auto_191593 )
      ( MAKE-7PILE ?auto_191592 ?auto_191593 ?auto_191594 ?auto_191595 ?auto_191596 ?auto_191597 ?auto_191598 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191601 - BLOCK
      ?auto_191602 - BLOCK
      ?auto_191603 - BLOCK
      ?auto_191604 - BLOCK
      ?auto_191605 - BLOCK
      ?auto_191606 - BLOCK
      ?auto_191607 - BLOCK
    )
    :vars
    (
      ?auto_191609 - BLOCK
      ?auto_191608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191601 ?auto_191602 ) ) ( not ( = ?auto_191601 ?auto_191603 ) ) ( not ( = ?auto_191601 ?auto_191604 ) ) ( not ( = ?auto_191601 ?auto_191605 ) ) ( not ( = ?auto_191601 ?auto_191606 ) ) ( not ( = ?auto_191601 ?auto_191607 ) ) ( not ( = ?auto_191602 ?auto_191603 ) ) ( not ( = ?auto_191602 ?auto_191604 ) ) ( not ( = ?auto_191602 ?auto_191605 ) ) ( not ( = ?auto_191602 ?auto_191606 ) ) ( not ( = ?auto_191602 ?auto_191607 ) ) ( not ( = ?auto_191603 ?auto_191604 ) ) ( not ( = ?auto_191603 ?auto_191605 ) ) ( not ( = ?auto_191603 ?auto_191606 ) ) ( not ( = ?auto_191603 ?auto_191607 ) ) ( not ( = ?auto_191604 ?auto_191605 ) ) ( not ( = ?auto_191604 ?auto_191606 ) ) ( not ( = ?auto_191604 ?auto_191607 ) ) ( not ( = ?auto_191605 ?auto_191606 ) ) ( not ( = ?auto_191605 ?auto_191607 ) ) ( not ( = ?auto_191606 ?auto_191607 ) ) ( ON ?auto_191607 ?auto_191609 ) ( not ( = ?auto_191601 ?auto_191609 ) ) ( not ( = ?auto_191602 ?auto_191609 ) ) ( not ( = ?auto_191603 ?auto_191609 ) ) ( not ( = ?auto_191604 ?auto_191609 ) ) ( not ( = ?auto_191605 ?auto_191609 ) ) ( not ( = ?auto_191606 ?auto_191609 ) ) ( not ( = ?auto_191607 ?auto_191609 ) ) ( ON ?auto_191606 ?auto_191607 ) ( ON-TABLE ?auto_191609 ) ( ON ?auto_191605 ?auto_191606 ) ( ON ?auto_191601 ?auto_191608 ) ( not ( = ?auto_191601 ?auto_191608 ) ) ( not ( = ?auto_191602 ?auto_191608 ) ) ( not ( = ?auto_191603 ?auto_191608 ) ) ( not ( = ?auto_191604 ?auto_191608 ) ) ( not ( = ?auto_191605 ?auto_191608 ) ) ( not ( = ?auto_191606 ?auto_191608 ) ) ( not ( = ?auto_191607 ?auto_191608 ) ) ( not ( = ?auto_191609 ?auto_191608 ) ) ( ON ?auto_191602 ?auto_191601 ) ( ON-TABLE ?auto_191608 ) ( ON ?auto_191603 ?auto_191602 ) ( CLEAR ?auto_191603 ) ( HOLDING ?auto_191604 ) ( CLEAR ?auto_191605 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191609 ?auto_191607 ?auto_191606 ?auto_191605 ?auto_191604 )
      ( MAKE-7PILE ?auto_191601 ?auto_191602 ?auto_191603 ?auto_191604 ?auto_191605 ?auto_191606 ?auto_191607 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191610 - BLOCK
      ?auto_191611 - BLOCK
      ?auto_191612 - BLOCK
      ?auto_191613 - BLOCK
      ?auto_191614 - BLOCK
      ?auto_191615 - BLOCK
      ?auto_191616 - BLOCK
    )
    :vars
    (
      ?auto_191617 - BLOCK
      ?auto_191618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191610 ?auto_191611 ) ) ( not ( = ?auto_191610 ?auto_191612 ) ) ( not ( = ?auto_191610 ?auto_191613 ) ) ( not ( = ?auto_191610 ?auto_191614 ) ) ( not ( = ?auto_191610 ?auto_191615 ) ) ( not ( = ?auto_191610 ?auto_191616 ) ) ( not ( = ?auto_191611 ?auto_191612 ) ) ( not ( = ?auto_191611 ?auto_191613 ) ) ( not ( = ?auto_191611 ?auto_191614 ) ) ( not ( = ?auto_191611 ?auto_191615 ) ) ( not ( = ?auto_191611 ?auto_191616 ) ) ( not ( = ?auto_191612 ?auto_191613 ) ) ( not ( = ?auto_191612 ?auto_191614 ) ) ( not ( = ?auto_191612 ?auto_191615 ) ) ( not ( = ?auto_191612 ?auto_191616 ) ) ( not ( = ?auto_191613 ?auto_191614 ) ) ( not ( = ?auto_191613 ?auto_191615 ) ) ( not ( = ?auto_191613 ?auto_191616 ) ) ( not ( = ?auto_191614 ?auto_191615 ) ) ( not ( = ?auto_191614 ?auto_191616 ) ) ( not ( = ?auto_191615 ?auto_191616 ) ) ( ON ?auto_191616 ?auto_191617 ) ( not ( = ?auto_191610 ?auto_191617 ) ) ( not ( = ?auto_191611 ?auto_191617 ) ) ( not ( = ?auto_191612 ?auto_191617 ) ) ( not ( = ?auto_191613 ?auto_191617 ) ) ( not ( = ?auto_191614 ?auto_191617 ) ) ( not ( = ?auto_191615 ?auto_191617 ) ) ( not ( = ?auto_191616 ?auto_191617 ) ) ( ON ?auto_191615 ?auto_191616 ) ( ON-TABLE ?auto_191617 ) ( ON ?auto_191614 ?auto_191615 ) ( ON ?auto_191610 ?auto_191618 ) ( not ( = ?auto_191610 ?auto_191618 ) ) ( not ( = ?auto_191611 ?auto_191618 ) ) ( not ( = ?auto_191612 ?auto_191618 ) ) ( not ( = ?auto_191613 ?auto_191618 ) ) ( not ( = ?auto_191614 ?auto_191618 ) ) ( not ( = ?auto_191615 ?auto_191618 ) ) ( not ( = ?auto_191616 ?auto_191618 ) ) ( not ( = ?auto_191617 ?auto_191618 ) ) ( ON ?auto_191611 ?auto_191610 ) ( ON-TABLE ?auto_191618 ) ( ON ?auto_191612 ?auto_191611 ) ( CLEAR ?auto_191614 ) ( ON ?auto_191613 ?auto_191612 ) ( CLEAR ?auto_191613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191618 ?auto_191610 ?auto_191611 ?auto_191612 )
      ( MAKE-7PILE ?auto_191610 ?auto_191611 ?auto_191612 ?auto_191613 ?auto_191614 ?auto_191615 ?auto_191616 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191619 - BLOCK
      ?auto_191620 - BLOCK
      ?auto_191621 - BLOCK
      ?auto_191622 - BLOCK
      ?auto_191623 - BLOCK
      ?auto_191624 - BLOCK
      ?auto_191625 - BLOCK
    )
    :vars
    (
      ?auto_191627 - BLOCK
      ?auto_191626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191619 ?auto_191620 ) ) ( not ( = ?auto_191619 ?auto_191621 ) ) ( not ( = ?auto_191619 ?auto_191622 ) ) ( not ( = ?auto_191619 ?auto_191623 ) ) ( not ( = ?auto_191619 ?auto_191624 ) ) ( not ( = ?auto_191619 ?auto_191625 ) ) ( not ( = ?auto_191620 ?auto_191621 ) ) ( not ( = ?auto_191620 ?auto_191622 ) ) ( not ( = ?auto_191620 ?auto_191623 ) ) ( not ( = ?auto_191620 ?auto_191624 ) ) ( not ( = ?auto_191620 ?auto_191625 ) ) ( not ( = ?auto_191621 ?auto_191622 ) ) ( not ( = ?auto_191621 ?auto_191623 ) ) ( not ( = ?auto_191621 ?auto_191624 ) ) ( not ( = ?auto_191621 ?auto_191625 ) ) ( not ( = ?auto_191622 ?auto_191623 ) ) ( not ( = ?auto_191622 ?auto_191624 ) ) ( not ( = ?auto_191622 ?auto_191625 ) ) ( not ( = ?auto_191623 ?auto_191624 ) ) ( not ( = ?auto_191623 ?auto_191625 ) ) ( not ( = ?auto_191624 ?auto_191625 ) ) ( ON ?auto_191625 ?auto_191627 ) ( not ( = ?auto_191619 ?auto_191627 ) ) ( not ( = ?auto_191620 ?auto_191627 ) ) ( not ( = ?auto_191621 ?auto_191627 ) ) ( not ( = ?auto_191622 ?auto_191627 ) ) ( not ( = ?auto_191623 ?auto_191627 ) ) ( not ( = ?auto_191624 ?auto_191627 ) ) ( not ( = ?auto_191625 ?auto_191627 ) ) ( ON ?auto_191624 ?auto_191625 ) ( ON-TABLE ?auto_191627 ) ( ON ?auto_191619 ?auto_191626 ) ( not ( = ?auto_191619 ?auto_191626 ) ) ( not ( = ?auto_191620 ?auto_191626 ) ) ( not ( = ?auto_191621 ?auto_191626 ) ) ( not ( = ?auto_191622 ?auto_191626 ) ) ( not ( = ?auto_191623 ?auto_191626 ) ) ( not ( = ?auto_191624 ?auto_191626 ) ) ( not ( = ?auto_191625 ?auto_191626 ) ) ( not ( = ?auto_191627 ?auto_191626 ) ) ( ON ?auto_191620 ?auto_191619 ) ( ON-TABLE ?auto_191626 ) ( ON ?auto_191621 ?auto_191620 ) ( ON ?auto_191622 ?auto_191621 ) ( CLEAR ?auto_191622 ) ( HOLDING ?auto_191623 ) ( CLEAR ?auto_191624 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191627 ?auto_191625 ?auto_191624 ?auto_191623 )
      ( MAKE-7PILE ?auto_191619 ?auto_191620 ?auto_191621 ?auto_191622 ?auto_191623 ?auto_191624 ?auto_191625 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191628 - BLOCK
      ?auto_191629 - BLOCK
      ?auto_191630 - BLOCK
      ?auto_191631 - BLOCK
      ?auto_191632 - BLOCK
      ?auto_191633 - BLOCK
      ?auto_191634 - BLOCK
    )
    :vars
    (
      ?auto_191635 - BLOCK
      ?auto_191636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191628 ?auto_191629 ) ) ( not ( = ?auto_191628 ?auto_191630 ) ) ( not ( = ?auto_191628 ?auto_191631 ) ) ( not ( = ?auto_191628 ?auto_191632 ) ) ( not ( = ?auto_191628 ?auto_191633 ) ) ( not ( = ?auto_191628 ?auto_191634 ) ) ( not ( = ?auto_191629 ?auto_191630 ) ) ( not ( = ?auto_191629 ?auto_191631 ) ) ( not ( = ?auto_191629 ?auto_191632 ) ) ( not ( = ?auto_191629 ?auto_191633 ) ) ( not ( = ?auto_191629 ?auto_191634 ) ) ( not ( = ?auto_191630 ?auto_191631 ) ) ( not ( = ?auto_191630 ?auto_191632 ) ) ( not ( = ?auto_191630 ?auto_191633 ) ) ( not ( = ?auto_191630 ?auto_191634 ) ) ( not ( = ?auto_191631 ?auto_191632 ) ) ( not ( = ?auto_191631 ?auto_191633 ) ) ( not ( = ?auto_191631 ?auto_191634 ) ) ( not ( = ?auto_191632 ?auto_191633 ) ) ( not ( = ?auto_191632 ?auto_191634 ) ) ( not ( = ?auto_191633 ?auto_191634 ) ) ( ON ?auto_191634 ?auto_191635 ) ( not ( = ?auto_191628 ?auto_191635 ) ) ( not ( = ?auto_191629 ?auto_191635 ) ) ( not ( = ?auto_191630 ?auto_191635 ) ) ( not ( = ?auto_191631 ?auto_191635 ) ) ( not ( = ?auto_191632 ?auto_191635 ) ) ( not ( = ?auto_191633 ?auto_191635 ) ) ( not ( = ?auto_191634 ?auto_191635 ) ) ( ON ?auto_191633 ?auto_191634 ) ( ON-TABLE ?auto_191635 ) ( ON ?auto_191628 ?auto_191636 ) ( not ( = ?auto_191628 ?auto_191636 ) ) ( not ( = ?auto_191629 ?auto_191636 ) ) ( not ( = ?auto_191630 ?auto_191636 ) ) ( not ( = ?auto_191631 ?auto_191636 ) ) ( not ( = ?auto_191632 ?auto_191636 ) ) ( not ( = ?auto_191633 ?auto_191636 ) ) ( not ( = ?auto_191634 ?auto_191636 ) ) ( not ( = ?auto_191635 ?auto_191636 ) ) ( ON ?auto_191629 ?auto_191628 ) ( ON-TABLE ?auto_191636 ) ( ON ?auto_191630 ?auto_191629 ) ( ON ?auto_191631 ?auto_191630 ) ( CLEAR ?auto_191633 ) ( ON ?auto_191632 ?auto_191631 ) ( CLEAR ?auto_191632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191636 ?auto_191628 ?auto_191629 ?auto_191630 ?auto_191631 )
      ( MAKE-7PILE ?auto_191628 ?auto_191629 ?auto_191630 ?auto_191631 ?auto_191632 ?auto_191633 ?auto_191634 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191637 - BLOCK
      ?auto_191638 - BLOCK
      ?auto_191639 - BLOCK
      ?auto_191640 - BLOCK
      ?auto_191641 - BLOCK
      ?auto_191642 - BLOCK
      ?auto_191643 - BLOCK
    )
    :vars
    (
      ?auto_191644 - BLOCK
      ?auto_191645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191637 ?auto_191638 ) ) ( not ( = ?auto_191637 ?auto_191639 ) ) ( not ( = ?auto_191637 ?auto_191640 ) ) ( not ( = ?auto_191637 ?auto_191641 ) ) ( not ( = ?auto_191637 ?auto_191642 ) ) ( not ( = ?auto_191637 ?auto_191643 ) ) ( not ( = ?auto_191638 ?auto_191639 ) ) ( not ( = ?auto_191638 ?auto_191640 ) ) ( not ( = ?auto_191638 ?auto_191641 ) ) ( not ( = ?auto_191638 ?auto_191642 ) ) ( not ( = ?auto_191638 ?auto_191643 ) ) ( not ( = ?auto_191639 ?auto_191640 ) ) ( not ( = ?auto_191639 ?auto_191641 ) ) ( not ( = ?auto_191639 ?auto_191642 ) ) ( not ( = ?auto_191639 ?auto_191643 ) ) ( not ( = ?auto_191640 ?auto_191641 ) ) ( not ( = ?auto_191640 ?auto_191642 ) ) ( not ( = ?auto_191640 ?auto_191643 ) ) ( not ( = ?auto_191641 ?auto_191642 ) ) ( not ( = ?auto_191641 ?auto_191643 ) ) ( not ( = ?auto_191642 ?auto_191643 ) ) ( ON ?auto_191643 ?auto_191644 ) ( not ( = ?auto_191637 ?auto_191644 ) ) ( not ( = ?auto_191638 ?auto_191644 ) ) ( not ( = ?auto_191639 ?auto_191644 ) ) ( not ( = ?auto_191640 ?auto_191644 ) ) ( not ( = ?auto_191641 ?auto_191644 ) ) ( not ( = ?auto_191642 ?auto_191644 ) ) ( not ( = ?auto_191643 ?auto_191644 ) ) ( ON-TABLE ?auto_191644 ) ( ON ?auto_191637 ?auto_191645 ) ( not ( = ?auto_191637 ?auto_191645 ) ) ( not ( = ?auto_191638 ?auto_191645 ) ) ( not ( = ?auto_191639 ?auto_191645 ) ) ( not ( = ?auto_191640 ?auto_191645 ) ) ( not ( = ?auto_191641 ?auto_191645 ) ) ( not ( = ?auto_191642 ?auto_191645 ) ) ( not ( = ?auto_191643 ?auto_191645 ) ) ( not ( = ?auto_191644 ?auto_191645 ) ) ( ON ?auto_191638 ?auto_191637 ) ( ON-TABLE ?auto_191645 ) ( ON ?auto_191639 ?auto_191638 ) ( ON ?auto_191640 ?auto_191639 ) ( ON ?auto_191641 ?auto_191640 ) ( CLEAR ?auto_191641 ) ( HOLDING ?auto_191642 ) ( CLEAR ?auto_191643 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191644 ?auto_191643 ?auto_191642 )
      ( MAKE-7PILE ?auto_191637 ?auto_191638 ?auto_191639 ?auto_191640 ?auto_191641 ?auto_191642 ?auto_191643 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191646 - BLOCK
      ?auto_191647 - BLOCK
      ?auto_191648 - BLOCK
      ?auto_191649 - BLOCK
      ?auto_191650 - BLOCK
      ?auto_191651 - BLOCK
      ?auto_191652 - BLOCK
    )
    :vars
    (
      ?auto_191653 - BLOCK
      ?auto_191654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191646 ?auto_191647 ) ) ( not ( = ?auto_191646 ?auto_191648 ) ) ( not ( = ?auto_191646 ?auto_191649 ) ) ( not ( = ?auto_191646 ?auto_191650 ) ) ( not ( = ?auto_191646 ?auto_191651 ) ) ( not ( = ?auto_191646 ?auto_191652 ) ) ( not ( = ?auto_191647 ?auto_191648 ) ) ( not ( = ?auto_191647 ?auto_191649 ) ) ( not ( = ?auto_191647 ?auto_191650 ) ) ( not ( = ?auto_191647 ?auto_191651 ) ) ( not ( = ?auto_191647 ?auto_191652 ) ) ( not ( = ?auto_191648 ?auto_191649 ) ) ( not ( = ?auto_191648 ?auto_191650 ) ) ( not ( = ?auto_191648 ?auto_191651 ) ) ( not ( = ?auto_191648 ?auto_191652 ) ) ( not ( = ?auto_191649 ?auto_191650 ) ) ( not ( = ?auto_191649 ?auto_191651 ) ) ( not ( = ?auto_191649 ?auto_191652 ) ) ( not ( = ?auto_191650 ?auto_191651 ) ) ( not ( = ?auto_191650 ?auto_191652 ) ) ( not ( = ?auto_191651 ?auto_191652 ) ) ( ON ?auto_191652 ?auto_191653 ) ( not ( = ?auto_191646 ?auto_191653 ) ) ( not ( = ?auto_191647 ?auto_191653 ) ) ( not ( = ?auto_191648 ?auto_191653 ) ) ( not ( = ?auto_191649 ?auto_191653 ) ) ( not ( = ?auto_191650 ?auto_191653 ) ) ( not ( = ?auto_191651 ?auto_191653 ) ) ( not ( = ?auto_191652 ?auto_191653 ) ) ( ON-TABLE ?auto_191653 ) ( ON ?auto_191646 ?auto_191654 ) ( not ( = ?auto_191646 ?auto_191654 ) ) ( not ( = ?auto_191647 ?auto_191654 ) ) ( not ( = ?auto_191648 ?auto_191654 ) ) ( not ( = ?auto_191649 ?auto_191654 ) ) ( not ( = ?auto_191650 ?auto_191654 ) ) ( not ( = ?auto_191651 ?auto_191654 ) ) ( not ( = ?auto_191652 ?auto_191654 ) ) ( not ( = ?auto_191653 ?auto_191654 ) ) ( ON ?auto_191647 ?auto_191646 ) ( ON-TABLE ?auto_191654 ) ( ON ?auto_191648 ?auto_191647 ) ( ON ?auto_191649 ?auto_191648 ) ( ON ?auto_191650 ?auto_191649 ) ( CLEAR ?auto_191652 ) ( ON ?auto_191651 ?auto_191650 ) ( CLEAR ?auto_191651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191654 ?auto_191646 ?auto_191647 ?auto_191648 ?auto_191649 ?auto_191650 )
      ( MAKE-7PILE ?auto_191646 ?auto_191647 ?auto_191648 ?auto_191649 ?auto_191650 ?auto_191651 ?auto_191652 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191655 - BLOCK
      ?auto_191656 - BLOCK
      ?auto_191657 - BLOCK
      ?auto_191658 - BLOCK
      ?auto_191659 - BLOCK
      ?auto_191660 - BLOCK
      ?auto_191661 - BLOCK
    )
    :vars
    (
      ?auto_191663 - BLOCK
      ?auto_191662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191655 ?auto_191656 ) ) ( not ( = ?auto_191655 ?auto_191657 ) ) ( not ( = ?auto_191655 ?auto_191658 ) ) ( not ( = ?auto_191655 ?auto_191659 ) ) ( not ( = ?auto_191655 ?auto_191660 ) ) ( not ( = ?auto_191655 ?auto_191661 ) ) ( not ( = ?auto_191656 ?auto_191657 ) ) ( not ( = ?auto_191656 ?auto_191658 ) ) ( not ( = ?auto_191656 ?auto_191659 ) ) ( not ( = ?auto_191656 ?auto_191660 ) ) ( not ( = ?auto_191656 ?auto_191661 ) ) ( not ( = ?auto_191657 ?auto_191658 ) ) ( not ( = ?auto_191657 ?auto_191659 ) ) ( not ( = ?auto_191657 ?auto_191660 ) ) ( not ( = ?auto_191657 ?auto_191661 ) ) ( not ( = ?auto_191658 ?auto_191659 ) ) ( not ( = ?auto_191658 ?auto_191660 ) ) ( not ( = ?auto_191658 ?auto_191661 ) ) ( not ( = ?auto_191659 ?auto_191660 ) ) ( not ( = ?auto_191659 ?auto_191661 ) ) ( not ( = ?auto_191660 ?auto_191661 ) ) ( not ( = ?auto_191655 ?auto_191663 ) ) ( not ( = ?auto_191656 ?auto_191663 ) ) ( not ( = ?auto_191657 ?auto_191663 ) ) ( not ( = ?auto_191658 ?auto_191663 ) ) ( not ( = ?auto_191659 ?auto_191663 ) ) ( not ( = ?auto_191660 ?auto_191663 ) ) ( not ( = ?auto_191661 ?auto_191663 ) ) ( ON-TABLE ?auto_191663 ) ( ON ?auto_191655 ?auto_191662 ) ( not ( = ?auto_191655 ?auto_191662 ) ) ( not ( = ?auto_191656 ?auto_191662 ) ) ( not ( = ?auto_191657 ?auto_191662 ) ) ( not ( = ?auto_191658 ?auto_191662 ) ) ( not ( = ?auto_191659 ?auto_191662 ) ) ( not ( = ?auto_191660 ?auto_191662 ) ) ( not ( = ?auto_191661 ?auto_191662 ) ) ( not ( = ?auto_191663 ?auto_191662 ) ) ( ON ?auto_191656 ?auto_191655 ) ( ON-TABLE ?auto_191662 ) ( ON ?auto_191657 ?auto_191656 ) ( ON ?auto_191658 ?auto_191657 ) ( ON ?auto_191659 ?auto_191658 ) ( ON ?auto_191660 ?auto_191659 ) ( CLEAR ?auto_191660 ) ( HOLDING ?auto_191661 ) ( CLEAR ?auto_191663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191663 ?auto_191661 )
      ( MAKE-7PILE ?auto_191655 ?auto_191656 ?auto_191657 ?auto_191658 ?auto_191659 ?auto_191660 ?auto_191661 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191664 - BLOCK
      ?auto_191665 - BLOCK
      ?auto_191666 - BLOCK
      ?auto_191667 - BLOCK
      ?auto_191668 - BLOCK
      ?auto_191669 - BLOCK
      ?auto_191670 - BLOCK
    )
    :vars
    (
      ?auto_191672 - BLOCK
      ?auto_191671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191664 ?auto_191665 ) ) ( not ( = ?auto_191664 ?auto_191666 ) ) ( not ( = ?auto_191664 ?auto_191667 ) ) ( not ( = ?auto_191664 ?auto_191668 ) ) ( not ( = ?auto_191664 ?auto_191669 ) ) ( not ( = ?auto_191664 ?auto_191670 ) ) ( not ( = ?auto_191665 ?auto_191666 ) ) ( not ( = ?auto_191665 ?auto_191667 ) ) ( not ( = ?auto_191665 ?auto_191668 ) ) ( not ( = ?auto_191665 ?auto_191669 ) ) ( not ( = ?auto_191665 ?auto_191670 ) ) ( not ( = ?auto_191666 ?auto_191667 ) ) ( not ( = ?auto_191666 ?auto_191668 ) ) ( not ( = ?auto_191666 ?auto_191669 ) ) ( not ( = ?auto_191666 ?auto_191670 ) ) ( not ( = ?auto_191667 ?auto_191668 ) ) ( not ( = ?auto_191667 ?auto_191669 ) ) ( not ( = ?auto_191667 ?auto_191670 ) ) ( not ( = ?auto_191668 ?auto_191669 ) ) ( not ( = ?auto_191668 ?auto_191670 ) ) ( not ( = ?auto_191669 ?auto_191670 ) ) ( not ( = ?auto_191664 ?auto_191672 ) ) ( not ( = ?auto_191665 ?auto_191672 ) ) ( not ( = ?auto_191666 ?auto_191672 ) ) ( not ( = ?auto_191667 ?auto_191672 ) ) ( not ( = ?auto_191668 ?auto_191672 ) ) ( not ( = ?auto_191669 ?auto_191672 ) ) ( not ( = ?auto_191670 ?auto_191672 ) ) ( ON-TABLE ?auto_191672 ) ( ON ?auto_191664 ?auto_191671 ) ( not ( = ?auto_191664 ?auto_191671 ) ) ( not ( = ?auto_191665 ?auto_191671 ) ) ( not ( = ?auto_191666 ?auto_191671 ) ) ( not ( = ?auto_191667 ?auto_191671 ) ) ( not ( = ?auto_191668 ?auto_191671 ) ) ( not ( = ?auto_191669 ?auto_191671 ) ) ( not ( = ?auto_191670 ?auto_191671 ) ) ( not ( = ?auto_191672 ?auto_191671 ) ) ( ON ?auto_191665 ?auto_191664 ) ( ON-TABLE ?auto_191671 ) ( ON ?auto_191666 ?auto_191665 ) ( ON ?auto_191667 ?auto_191666 ) ( ON ?auto_191668 ?auto_191667 ) ( ON ?auto_191669 ?auto_191668 ) ( CLEAR ?auto_191672 ) ( ON ?auto_191670 ?auto_191669 ) ( CLEAR ?auto_191670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191671 ?auto_191664 ?auto_191665 ?auto_191666 ?auto_191667 ?auto_191668 ?auto_191669 )
      ( MAKE-7PILE ?auto_191664 ?auto_191665 ?auto_191666 ?auto_191667 ?auto_191668 ?auto_191669 ?auto_191670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191673 - BLOCK
      ?auto_191674 - BLOCK
      ?auto_191675 - BLOCK
      ?auto_191676 - BLOCK
      ?auto_191677 - BLOCK
      ?auto_191678 - BLOCK
      ?auto_191679 - BLOCK
    )
    :vars
    (
      ?auto_191681 - BLOCK
      ?auto_191680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191673 ?auto_191674 ) ) ( not ( = ?auto_191673 ?auto_191675 ) ) ( not ( = ?auto_191673 ?auto_191676 ) ) ( not ( = ?auto_191673 ?auto_191677 ) ) ( not ( = ?auto_191673 ?auto_191678 ) ) ( not ( = ?auto_191673 ?auto_191679 ) ) ( not ( = ?auto_191674 ?auto_191675 ) ) ( not ( = ?auto_191674 ?auto_191676 ) ) ( not ( = ?auto_191674 ?auto_191677 ) ) ( not ( = ?auto_191674 ?auto_191678 ) ) ( not ( = ?auto_191674 ?auto_191679 ) ) ( not ( = ?auto_191675 ?auto_191676 ) ) ( not ( = ?auto_191675 ?auto_191677 ) ) ( not ( = ?auto_191675 ?auto_191678 ) ) ( not ( = ?auto_191675 ?auto_191679 ) ) ( not ( = ?auto_191676 ?auto_191677 ) ) ( not ( = ?auto_191676 ?auto_191678 ) ) ( not ( = ?auto_191676 ?auto_191679 ) ) ( not ( = ?auto_191677 ?auto_191678 ) ) ( not ( = ?auto_191677 ?auto_191679 ) ) ( not ( = ?auto_191678 ?auto_191679 ) ) ( not ( = ?auto_191673 ?auto_191681 ) ) ( not ( = ?auto_191674 ?auto_191681 ) ) ( not ( = ?auto_191675 ?auto_191681 ) ) ( not ( = ?auto_191676 ?auto_191681 ) ) ( not ( = ?auto_191677 ?auto_191681 ) ) ( not ( = ?auto_191678 ?auto_191681 ) ) ( not ( = ?auto_191679 ?auto_191681 ) ) ( ON ?auto_191673 ?auto_191680 ) ( not ( = ?auto_191673 ?auto_191680 ) ) ( not ( = ?auto_191674 ?auto_191680 ) ) ( not ( = ?auto_191675 ?auto_191680 ) ) ( not ( = ?auto_191676 ?auto_191680 ) ) ( not ( = ?auto_191677 ?auto_191680 ) ) ( not ( = ?auto_191678 ?auto_191680 ) ) ( not ( = ?auto_191679 ?auto_191680 ) ) ( not ( = ?auto_191681 ?auto_191680 ) ) ( ON ?auto_191674 ?auto_191673 ) ( ON-TABLE ?auto_191680 ) ( ON ?auto_191675 ?auto_191674 ) ( ON ?auto_191676 ?auto_191675 ) ( ON ?auto_191677 ?auto_191676 ) ( ON ?auto_191678 ?auto_191677 ) ( ON ?auto_191679 ?auto_191678 ) ( CLEAR ?auto_191679 ) ( HOLDING ?auto_191681 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191681 )
      ( MAKE-7PILE ?auto_191673 ?auto_191674 ?auto_191675 ?auto_191676 ?auto_191677 ?auto_191678 ?auto_191679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191682 - BLOCK
      ?auto_191683 - BLOCK
      ?auto_191684 - BLOCK
      ?auto_191685 - BLOCK
      ?auto_191686 - BLOCK
      ?auto_191687 - BLOCK
      ?auto_191688 - BLOCK
    )
    :vars
    (
      ?auto_191690 - BLOCK
      ?auto_191689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191682 ?auto_191683 ) ) ( not ( = ?auto_191682 ?auto_191684 ) ) ( not ( = ?auto_191682 ?auto_191685 ) ) ( not ( = ?auto_191682 ?auto_191686 ) ) ( not ( = ?auto_191682 ?auto_191687 ) ) ( not ( = ?auto_191682 ?auto_191688 ) ) ( not ( = ?auto_191683 ?auto_191684 ) ) ( not ( = ?auto_191683 ?auto_191685 ) ) ( not ( = ?auto_191683 ?auto_191686 ) ) ( not ( = ?auto_191683 ?auto_191687 ) ) ( not ( = ?auto_191683 ?auto_191688 ) ) ( not ( = ?auto_191684 ?auto_191685 ) ) ( not ( = ?auto_191684 ?auto_191686 ) ) ( not ( = ?auto_191684 ?auto_191687 ) ) ( not ( = ?auto_191684 ?auto_191688 ) ) ( not ( = ?auto_191685 ?auto_191686 ) ) ( not ( = ?auto_191685 ?auto_191687 ) ) ( not ( = ?auto_191685 ?auto_191688 ) ) ( not ( = ?auto_191686 ?auto_191687 ) ) ( not ( = ?auto_191686 ?auto_191688 ) ) ( not ( = ?auto_191687 ?auto_191688 ) ) ( not ( = ?auto_191682 ?auto_191690 ) ) ( not ( = ?auto_191683 ?auto_191690 ) ) ( not ( = ?auto_191684 ?auto_191690 ) ) ( not ( = ?auto_191685 ?auto_191690 ) ) ( not ( = ?auto_191686 ?auto_191690 ) ) ( not ( = ?auto_191687 ?auto_191690 ) ) ( not ( = ?auto_191688 ?auto_191690 ) ) ( ON ?auto_191682 ?auto_191689 ) ( not ( = ?auto_191682 ?auto_191689 ) ) ( not ( = ?auto_191683 ?auto_191689 ) ) ( not ( = ?auto_191684 ?auto_191689 ) ) ( not ( = ?auto_191685 ?auto_191689 ) ) ( not ( = ?auto_191686 ?auto_191689 ) ) ( not ( = ?auto_191687 ?auto_191689 ) ) ( not ( = ?auto_191688 ?auto_191689 ) ) ( not ( = ?auto_191690 ?auto_191689 ) ) ( ON ?auto_191683 ?auto_191682 ) ( ON-TABLE ?auto_191689 ) ( ON ?auto_191684 ?auto_191683 ) ( ON ?auto_191685 ?auto_191684 ) ( ON ?auto_191686 ?auto_191685 ) ( ON ?auto_191687 ?auto_191686 ) ( ON ?auto_191688 ?auto_191687 ) ( ON ?auto_191690 ?auto_191688 ) ( CLEAR ?auto_191690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191689 ?auto_191682 ?auto_191683 ?auto_191684 ?auto_191685 ?auto_191686 ?auto_191687 ?auto_191688 )
      ( MAKE-7PILE ?auto_191682 ?auto_191683 ?auto_191684 ?auto_191685 ?auto_191686 ?auto_191687 ?auto_191688 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191699 - BLOCK
      ?auto_191700 - BLOCK
      ?auto_191701 - BLOCK
      ?auto_191702 - BLOCK
      ?auto_191703 - BLOCK
      ?auto_191704 - BLOCK
      ?auto_191705 - BLOCK
      ?auto_191706 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_191706 ) ( CLEAR ?auto_191705 ) ( ON-TABLE ?auto_191699 ) ( ON ?auto_191700 ?auto_191699 ) ( ON ?auto_191701 ?auto_191700 ) ( ON ?auto_191702 ?auto_191701 ) ( ON ?auto_191703 ?auto_191702 ) ( ON ?auto_191704 ?auto_191703 ) ( ON ?auto_191705 ?auto_191704 ) ( not ( = ?auto_191699 ?auto_191700 ) ) ( not ( = ?auto_191699 ?auto_191701 ) ) ( not ( = ?auto_191699 ?auto_191702 ) ) ( not ( = ?auto_191699 ?auto_191703 ) ) ( not ( = ?auto_191699 ?auto_191704 ) ) ( not ( = ?auto_191699 ?auto_191705 ) ) ( not ( = ?auto_191699 ?auto_191706 ) ) ( not ( = ?auto_191700 ?auto_191701 ) ) ( not ( = ?auto_191700 ?auto_191702 ) ) ( not ( = ?auto_191700 ?auto_191703 ) ) ( not ( = ?auto_191700 ?auto_191704 ) ) ( not ( = ?auto_191700 ?auto_191705 ) ) ( not ( = ?auto_191700 ?auto_191706 ) ) ( not ( = ?auto_191701 ?auto_191702 ) ) ( not ( = ?auto_191701 ?auto_191703 ) ) ( not ( = ?auto_191701 ?auto_191704 ) ) ( not ( = ?auto_191701 ?auto_191705 ) ) ( not ( = ?auto_191701 ?auto_191706 ) ) ( not ( = ?auto_191702 ?auto_191703 ) ) ( not ( = ?auto_191702 ?auto_191704 ) ) ( not ( = ?auto_191702 ?auto_191705 ) ) ( not ( = ?auto_191702 ?auto_191706 ) ) ( not ( = ?auto_191703 ?auto_191704 ) ) ( not ( = ?auto_191703 ?auto_191705 ) ) ( not ( = ?auto_191703 ?auto_191706 ) ) ( not ( = ?auto_191704 ?auto_191705 ) ) ( not ( = ?auto_191704 ?auto_191706 ) ) ( not ( = ?auto_191705 ?auto_191706 ) ) )
    :subtasks
    ( ( !STACK ?auto_191706 ?auto_191705 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191707 - BLOCK
      ?auto_191708 - BLOCK
      ?auto_191709 - BLOCK
      ?auto_191710 - BLOCK
      ?auto_191711 - BLOCK
      ?auto_191712 - BLOCK
      ?auto_191713 - BLOCK
      ?auto_191714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191713 ) ( ON-TABLE ?auto_191707 ) ( ON ?auto_191708 ?auto_191707 ) ( ON ?auto_191709 ?auto_191708 ) ( ON ?auto_191710 ?auto_191709 ) ( ON ?auto_191711 ?auto_191710 ) ( ON ?auto_191712 ?auto_191711 ) ( ON ?auto_191713 ?auto_191712 ) ( not ( = ?auto_191707 ?auto_191708 ) ) ( not ( = ?auto_191707 ?auto_191709 ) ) ( not ( = ?auto_191707 ?auto_191710 ) ) ( not ( = ?auto_191707 ?auto_191711 ) ) ( not ( = ?auto_191707 ?auto_191712 ) ) ( not ( = ?auto_191707 ?auto_191713 ) ) ( not ( = ?auto_191707 ?auto_191714 ) ) ( not ( = ?auto_191708 ?auto_191709 ) ) ( not ( = ?auto_191708 ?auto_191710 ) ) ( not ( = ?auto_191708 ?auto_191711 ) ) ( not ( = ?auto_191708 ?auto_191712 ) ) ( not ( = ?auto_191708 ?auto_191713 ) ) ( not ( = ?auto_191708 ?auto_191714 ) ) ( not ( = ?auto_191709 ?auto_191710 ) ) ( not ( = ?auto_191709 ?auto_191711 ) ) ( not ( = ?auto_191709 ?auto_191712 ) ) ( not ( = ?auto_191709 ?auto_191713 ) ) ( not ( = ?auto_191709 ?auto_191714 ) ) ( not ( = ?auto_191710 ?auto_191711 ) ) ( not ( = ?auto_191710 ?auto_191712 ) ) ( not ( = ?auto_191710 ?auto_191713 ) ) ( not ( = ?auto_191710 ?auto_191714 ) ) ( not ( = ?auto_191711 ?auto_191712 ) ) ( not ( = ?auto_191711 ?auto_191713 ) ) ( not ( = ?auto_191711 ?auto_191714 ) ) ( not ( = ?auto_191712 ?auto_191713 ) ) ( not ( = ?auto_191712 ?auto_191714 ) ) ( not ( = ?auto_191713 ?auto_191714 ) ) ( ON-TABLE ?auto_191714 ) ( CLEAR ?auto_191714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_191714 )
      ( MAKE-8PILE ?auto_191707 ?auto_191708 ?auto_191709 ?auto_191710 ?auto_191711 ?auto_191712 ?auto_191713 ?auto_191714 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191715 - BLOCK
      ?auto_191716 - BLOCK
      ?auto_191717 - BLOCK
      ?auto_191718 - BLOCK
      ?auto_191719 - BLOCK
      ?auto_191720 - BLOCK
      ?auto_191721 - BLOCK
      ?auto_191722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191715 ) ( ON ?auto_191716 ?auto_191715 ) ( ON ?auto_191717 ?auto_191716 ) ( ON ?auto_191718 ?auto_191717 ) ( ON ?auto_191719 ?auto_191718 ) ( ON ?auto_191720 ?auto_191719 ) ( not ( = ?auto_191715 ?auto_191716 ) ) ( not ( = ?auto_191715 ?auto_191717 ) ) ( not ( = ?auto_191715 ?auto_191718 ) ) ( not ( = ?auto_191715 ?auto_191719 ) ) ( not ( = ?auto_191715 ?auto_191720 ) ) ( not ( = ?auto_191715 ?auto_191721 ) ) ( not ( = ?auto_191715 ?auto_191722 ) ) ( not ( = ?auto_191716 ?auto_191717 ) ) ( not ( = ?auto_191716 ?auto_191718 ) ) ( not ( = ?auto_191716 ?auto_191719 ) ) ( not ( = ?auto_191716 ?auto_191720 ) ) ( not ( = ?auto_191716 ?auto_191721 ) ) ( not ( = ?auto_191716 ?auto_191722 ) ) ( not ( = ?auto_191717 ?auto_191718 ) ) ( not ( = ?auto_191717 ?auto_191719 ) ) ( not ( = ?auto_191717 ?auto_191720 ) ) ( not ( = ?auto_191717 ?auto_191721 ) ) ( not ( = ?auto_191717 ?auto_191722 ) ) ( not ( = ?auto_191718 ?auto_191719 ) ) ( not ( = ?auto_191718 ?auto_191720 ) ) ( not ( = ?auto_191718 ?auto_191721 ) ) ( not ( = ?auto_191718 ?auto_191722 ) ) ( not ( = ?auto_191719 ?auto_191720 ) ) ( not ( = ?auto_191719 ?auto_191721 ) ) ( not ( = ?auto_191719 ?auto_191722 ) ) ( not ( = ?auto_191720 ?auto_191721 ) ) ( not ( = ?auto_191720 ?auto_191722 ) ) ( not ( = ?auto_191721 ?auto_191722 ) ) ( ON-TABLE ?auto_191722 ) ( CLEAR ?auto_191722 ) ( HOLDING ?auto_191721 ) ( CLEAR ?auto_191720 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191715 ?auto_191716 ?auto_191717 ?auto_191718 ?auto_191719 ?auto_191720 ?auto_191721 )
      ( MAKE-8PILE ?auto_191715 ?auto_191716 ?auto_191717 ?auto_191718 ?auto_191719 ?auto_191720 ?auto_191721 ?auto_191722 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191723 - BLOCK
      ?auto_191724 - BLOCK
      ?auto_191725 - BLOCK
      ?auto_191726 - BLOCK
      ?auto_191727 - BLOCK
      ?auto_191728 - BLOCK
      ?auto_191729 - BLOCK
      ?auto_191730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191723 ) ( ON ?auto_191724 ?auto_191723 ) ( ON ?auto_191725 ?auto_191724 ) ( ON ?auto_191726 ?auto_191725 ) ( ON ?auto_191727 ?auto_191726 ) ( ON ?auto_191728 ?auto_191727 ) ( not ( = ?auto_191723 ?auto_191724 ) ) ( not ( = ?auto_191723 ?auto_191725 ) ) ( not ( = ?auto_191723 ?auto_191726 ) ) ( not ( = ?auto_191723 ?auto_191727 ) ) ( not ( = ?auto_191723 ?auto_191728 ) ) ( not ( = ?auto_191723 ?auto_191729 ) ) ( not ( = ?auto_191723 ?auto_191730 ) ) ( not ( = ?auto_191724 ?auto_191725 ) ) ( not ( = ?auto_191724 ?auto_191726 ) ) ( not ( = ?auto_191724 ?auto_191727 ) ) ( not ( = ?auto_191724 ?auto_191728 ) ) ( not ( = ?auto_191724 ?auto_191729 ) ) ( not ( = ?auto_191724 ?auto_191730 ) ) ( not ( = ?auto_191725 ?auto_191726 ) ) ( not ( = ?auto_191725 ?auto_191727 ) ) ( not ( = ?auto_191725 ?auto_191728 ) ) ( not ( = ?auto_191725 ?auto_191729 ) ) ( not ( = ?auto_191725 ?auto_191730 ) ) ( not ( = ?auto_191726 ?auto_191727 ) ) ( not ( = ?auto_191726 ?auto_191728 ) ) ( not ( = ?auto_191726 ?auto_191729 ) ) ( not ( = ?auto_191726 ?auto_191730 ) ) ( not ( = ?auto_191727 ?auto_191728 ) ) ( not ( = ?auto_191727 ?auto_191729 ) ) ( not ( = ?auto_191727 ?auto_191730 ) ) ( not ( = ?auto_191728 ?auto_191729 ) ) ( not ( = ?auto_191728 ?auto_191730 ) ) ( not ( = ?auto_191729 ?auto_191730 ) ) ( ON-TABLE ?auto_191730 ) ( CLEAR ?auto_191728 ) ( ON ?auto_191729 ?auto_191730 ) ( CLEAR ?auto_191729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191730 )
      ( MAKE-8PILE ?auto_191723 ?auto_191724 ?auto_191725 ?auto_191726 ?auto_191727 ?auto_191728 ?auto_191729 ?auto_191730 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191731 - BLOCK
      ?auto_191732 - BLOCK
      ?auto_191733 - BLOCK
      ?auto_191734 - BLOCK
      ?auto_191735 - BLOCK
      ?auto_191736 - BLOCK
      ?auto_191737 - BLOCK
      ?auto_191738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191731 ) ( ON ?auto_191732 ?auto_191731 ) ( ON ?auto_191733 ?auto_191732 ) ( ON ?auto_191734 ?auto_191733 ) ( ON ?auto_191735 ?auto_191734 ) ( not ( = ?auto_191731 ?auto_191732 ) ) ( not ( = ?auto_191731 ?auto_191733 ) ) ( not ( = ?auto_191731 ?auto_191734 ) ) ( not ( = ?auto_191731 ?auto_191735 ) ) ( not ( = ?auto_191731 ?auto_191736 ) ) ( not ( = ?auto_191731 ?auto_191737 ) ) ( not ( = ?auto_191731 ?auto_191738 ) ) ( not ( = ?auto_191732 ?auto_191733 ) ) ( not ( = ?auto_191732 ?auto_191734 ) ) ( not ( = ?auto_191732 ?auto_191735 ) ) ( not ( = ?auto_191732 ?auto_191736 ) ) ( not ( = ?auto_191732 ?auto_191737 ) ) ( not ( = ?auto_191732 ?auto_191738 ) ) ( not ( = ?auto_191733 ?auto_191734 ) ) ( not ( = ?auto_191733 ?auto_191735 ) ) ( not ( = ?auto_191733 ?auto_191736 ) ) ( not ( = ?auto_191733 ?auto_191737 ) ) ( not ( = ?auto_191733 ?auto_191738 ) ) ( not ( = ?auto_191734 ?auto_191735 ) ) ( not ( = ?auto_191734 ?auto_191736 ) ) ( not ( = ?auto_191734 ?auto_191737 ) ) ( not ( = ?auto_191734 ?auto_191738 ) ) ( not ( = ?auto_191735 ?auto_191736 ) ) ( not ( = ?auto_191735 ?auto_191737 ) ) ( not ( = ?auto_191735 ?auto_191738 ) ) ( not ( = ?auto_191736 ?auto_191737 ) ) ( not ( = ?auto_191736 ?auto_191738 ) ) ( not ( = ?auto_191737 ?auto_191738 ) ) ( ON-TABLE ?auto_191738 ) ( ON ?auto_191737 ?auto_191738 ) ( CLEAR ?auto_191737 ) ( HOLDING ?auto_191736 ) ( CLEAR ?auto_191735 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191731 ?auto_191732 ?auto_191733 ?auto_191734 ?auto_191735 ?auto_191736 )
      ( MAKE-8PILE ?auto_191731 ?auto_191732 ?auto_191733 ?auto_191734 ?auto_191735 ?auto_191736 ?auto_191737 ?auto_191738 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191739 - BLOCK
      ?auto_191740 - BLOCK
      ?auto_191741 - BLOCK
      ?auto_191742 - BLOCK
      ?auto_191743 - BLOCK
      ?auto_191744 - BLOCK
      ?auto_191745 - BLOCK
      ?auto_191746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191739 ) ( ON ?auto_191740 ?auto_191739 ) ( ON ?auto_191741 ?auto_191740 ) ( ON ?auto_191742 ?auto_191741 ) ( ON ?auto_191743 ?auto_191742 ) ( not ( = ?auto_191739 ?auto_191740 ) ) ( not ( = ?auto_191739 ?auto_191741 ) ) ( not ( = ?auto_191739 ?auto_191742 ) ) ( not ( = ?auto_191739 ?auto_191743 ) ) ( not ( = ?auto_191739 ?auto_191744 ) ) ( not ( = ?auto_191739 ?auto_191745 ) ) ( not ( = ?auto_191739 ?auto_191746 ) ) ( not ( = ?auto_191740 ?auto_191741 ) ) ( not ( = ?auto_191740 ?auto_191742 ) ) ( not ( = ?auto_191740 ?auto_191743 ) ) ( not ( = ?auto_191740 ?auto_191744 ) ) ( not ( = ?auto_191740 ?auto_191745 ) ) ( not ( = ?auto_191740 ?auto_191746 ) ) ( not ( = ?auto_191741 ?auto_191742 ) ) ( not ( = ?auto_191741 ?auto_191743 ) ) ( not ( = ?auto_191741 ?auto_191744 ) ) ( not ( = ?auto_191741 ?auto_191745 ) ) ( not ( = ?auto_191741 ?auto_191746 ) ) ( not ( = ?auto_191742 ?auto_191743 ) ) ( not ( = ?auto_191742 ?auto_191744 ) ) ( not ( = ?auto_191742 ?auto_191745 ) ) ( not ( = ?auto_191742 ?auto_191746 ) ) ( not ( = ?auto_191743 ?auto_191744 ) ) ( not ( = ?auto_191743 ?auto_191745 ) ) ( not ( = ?auto_191743 ?auto_191746 ) ) ( not ( = ?auto_191744 ?auto_191745 ) ) ( not ( = ?auto_191744 ?auto_191746 ) ) ( not ( = ?auto_191745 ?auto_191746 ) ) ( ON-TABLE ?auto_191746 ) ( ON ?auto_191745 ?auto_191746 ) ( CLEAR ?auto_191743 ) ( ON ?auto_191744 ?auto_191745 ) ( CLEAR ?auto_191744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191746 ?auto_191745 )
      ( MAKE-8PILE ?auto_191739 ?auto_191740 ?auto_191741 ?auto_191742 ?auto_191743 ?auto_191744 ?auto_191745 ?auto_191746 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191747 - BLOCK
      ?auto_191748 - BLOCK
      ?auto_191749 - BLOCK
      ?auto_191750 - BLOCK
      ?auto_191751 - BLOCK
      ?auto_191752 - BLOCK
      ?auto_191753 - BLOCK
      ?auto_191754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191747 ) ( ON ?auto_191748 ?auto_191747 ) ( ON ?auto_191749 ?auto_191748 ) ( ON ?auto_191750 ?auto_191749 ) ( not ( = ?auto_191747 ?auto_191748 ) ) ( not ( = ?auto_191747 ?auto_191749 ) ) ( not ( = ?auto_191747 ?auto_191750 ) ) ( not ( = ?auto_191747 ?auto_191751 ) ) ( not ( = ?auto_191747 ?auto_191752 ) ) ( not ( = ?auto_191747 ?auto_191753 ) ) ( not ( = ?auto_191747 ?auto_191754 ) ) ( not ( = ?auto_191748 ?auto_191749 ) ) ( not ( = ?auto_191748 ?auto_191750 ) ) ( not ( = ?auto_191748 ?auto_191751 ) ) ( not ( = ?auto_191748 ?auto_191752 ) ) ( not ( = ?auto_191748 ?auto_191753 ) ) ( not ( = ?auto_191748 ?auto_191754 ) ) ( not ( = ?auto_191749 ?auto_191750 ) ) ( not ( = ?auto_191749 ?auto_191751 ) ) ( not ( = ?auto_191749 ?auto_191752 ) ) ( not ( = ?auto_191749 ?auto_191753 ) ) ( not ( = ?auto_191749 ?auto_191754 ) ) ( not ( = ?auto_191750 ?auto_191751 ) ) ( not ( = ?auto_191750 ?auto_191752 ) ) ( not ( = ?auto_191750 ?auto_191753 ) ) ( not ( = ?auto_191750 ?auto_191754 ) ) ( not ( = ?auto_191751 ?auto_191752 ) ) ( not ( = ?auto_191751 ?auto_191753 ) ) ( not ( = ?auto_191751 ?auto_191754 ) ) ( not ( = ?auto_191752 ?auto_191753 ) ) ( not ( = ?auto_191752 ?auto_191754 ) ) ( not ( = ?auto_191753 ?auto_191754 ) ) ( ON-TABLE ?auto_191754 ) ( ON ?auto_191753 ?auto_191754 ) ( ON ?auto_191752 ?auto_191753 ) ( CLEAR ?auto_191752 ) ( HOLDING ?auto_191751 ) ( CLEAR ?auto_191750 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191747 ?auto_191748 ?auto_191749 ?auto_191750 ?auto_191751 )
      ( MAKE-8PILE ?auto_191747 ?auto_191748 ?auto_191749 ?auto_191750 ?auto_191751 ?auto_191752 ?auto_191753 ?auto_191754 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191755 - BLOCK
      ?auto_191756 - BLOCK
      ?auto_191757 - BLOCK
      ?auto_191758 - BLOCK
      ?auto_191759 - BLOCK
      ?auto_191760 - BLOCK
      ?auto_191761 - BLOCK
      ?auto_191762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191755 ) ( ON ?auto_191756 ?auto_191755 ) ( ON ?auto_191757 ?auto_191756 ) ( ON ?auto_191758 ?auto_191757 ) ( not ( = ?auto_191755 ?auto_191756 ) ) ( not ( = ?auto_191755 ?auto_191757 ) ) ( not ( = ?auto_191755 ?auto_191758 ) ) ( not ( = ?auto_191755 ?auto_191759 ) ) ( not ( = ?auto_191755 ?auto_191760 ) ) ( not ( = ?auto_191755 ?auto_191761 ) ) ( not ( = ?auto_191755 ?auto_191762 ) ) ( not ( = ?auto_191756 ?auto_191757 ) ) ( not ( = ?auto_191756 ?auto_191758 ) ) ( not ( = ?auto_191756 ?auto_191759 ) ) ( not ( = ?auto_191756 ?auto_191760 ) ) ( not ( = ?auto_191756 ?auto_191761 ) ) ( not ( = ?auto_191756 ?auto_191762 ) ) ( not ( = ?auto_191757 ?auto_191758 ) ) ( not ( = ?auto_191757 ?auto_191759 ) ) ( not ( = ?auto_191757 ?auto_191760 ) ) ( not ( = ?auto_191757 ?auto_191761 ) ) ( not ( = ?auto_191757 ?auto_191762 ) ) ( not ( = ?auto_191758 ?auto_191759 ) ) ( not ( = ?auto_191758 ?auto_191760 ) ) ( not ( = ?auto_191758 ?auto_191761 ) ) ( not ( = ?auto_191758 ?auto_191762 ) ) ( not ( = ?auto_191759 ?auto_191760 ) ) ( not ( = ?auto_191759 ?auto_191761 ) ) ( not ( = ?auto_191759 ?auto_191762 ) ) ( not ( = ?auto_191760 ?auto_191761 ) ) ( not ( = ?auto_191760 ?auto_191762 ) ) ( not ( = ?auto_191761 ?auto_191762 ) ) ( ON-TABLE ?auto_191762 ) ( ON ?auto_191761 ?auto_191762 ) ( ON ?auto_191760 ?auto_191761 ) ( CLEAR ?auto_191758 ) ( ON ?auto_191759 ?auto_191760 ) ( CLEAR ?auto_191759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191762 ?auto_191761 ?auto_191760 )
      ( MAKE-8PILE ?auto_191755 ?auto_191756 ?auto_191757 ?auto_191758 ?auto_191759 ?auto_191760 ?auto_191761 ?auto_191762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191763 - BLOCK
      ?auto_191764 - BLOCK
      ?auto_191765 - BLOCK
      ?auto_191766 - BLOCK
      ?auto_191767 - BLOCK
      ?auto_191768 - BLOCK
      ?auto_191769 - BLOCK
      ?auto_191770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191763 ) ( ON ?auto_191764 ?auto_191763 ) ( ON ?auto_191765 ?auto_191764 ) ( not ( = ?auto_191763 ?auto_191764 ) ) ( not ( = ?auto_191763 ?auto_191765 ) ) ( not ( = ?auto_191763 ?auto_191766 ) ) ( not ( = ?auto_191763 ?auto_191767 ) ) ( not ( = ?auto_191763 ?auto_191768 ) ) ( not ( = ?auto_191763 ?auto_191769 ) ) ( not ( = ?auto_191763 ?auto_191770 ) ) ( not ( = ?auto_191764 ?auto_191765 ) ) ( not ( = ?auto_191764 ?auto_191766 ) ) ( not ( = ?auto_191764 ?auto_191767 ) ) ( not ( = ?auto_191764 ?auto_191768 ) ) ( not ( = ?auto_191764 ?auto_191769 ) ) ( not ( = ?auto_191764 ?auto_191770 ) ) ( not ( = ?auto_191765 ?auto_191766 ) ) ( not ( = ?auto_191765 ?auto_191767 ) ) ( not ( = ?auto_191765 ?auto_191768 ) ) ( not ( = ?auto_191765 ?auto_191769 ) ) ( not ( = ?auto_191765 ?auto_191770 ) ) ( not ( = ?auto_191766 ?auto_191767 ) ) ( not ( = ?auto_191766 ?auto_191768 ) ) ( not ( = ?auto_191766 ?auto_191769 ) ) ( not ( = ?auto_191766 ?auto_191770 ) ) ( not ( = ?auto_191767 ?auto_191768 ) ) ( not ( = ?auto_191767 ?auto_191769 ) ) ( not ( = ?auto_191767 ?auto_191770 ) ) ( not ( = ?auto_191768 ?auto_191769 ) ) ( not ( = ?auto_191768 ?auto_191770 ) ) ( not ( = ?auto_191769 ?auto_191770 ) ) ( ON-TABLE ?auto_191770 ) ( ON ?auto_191769 ?auto_191770 ) ( ON ?auto_191768 ?auto_191769 ) ( ON ?auto_191767 ?auto_191768 ) ( CLEAR ?auto_191767 ) ( HOLDING ?auto_191766 ) ( CLEAR ?auto_191765 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191763 ?auto_191764 ?auto_191765 ?auto_191766 )
      ( MAKE-8PILE ?auto_191763 ?auto_191764 ?auto_191765 ?auto_191766 ?auto_191767 ?auto_191768 ?auto_191769 ?auto_191770 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191771 - BLOCK
      ?auto_191772 - BLOCK
      ?auto_191773 - BLOCK
      ?auto_191774 - BLOCK
      ?auto_191775 - BLOCK
      ?auto_191776 - BLOCK
      ?auto_191777 - BLOCK
      ?auto_191778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191771 ) ( ON ?auto_191772 ?auto_191771 ) ( ON ?auto_191773 ?auto_191772 ) ( not ( = ?auto_191771 ?auto_191772 ) ) ( not ( = ?auto_191771 ?auto_191773 ) ) ( not ( = ?auto_191771 ?auto_191774 ) ) ( not ( = ?auto_191771 ?auto_191775 ) ) ( not ( = ?auto_191771 ?auto_191776 ) ) ( not ( = ?auto_191771 ?auto_191777 ) ) ( not ( = ?auto_191771 ?auto_191778 ) ) ( not ( = ?auto_191772 ?auto_191773 ) ) ( not ( = ?auto_191772 ?auto_191774 ) ) ( not ( = ?auto_191772 ?auto_191775 ) ) ( not ( = ?auto_191772 ?auto_191776 ) ) ( not ( = ?auto_191772 ?auto_191777 ) ) ( not ( = ?auto_191772 ?auto_191778 ) ) ( not ( = ?auto_191773 ?auto_191774 ) ) ( not ( = ?auto_191773 ?auto_191775 ) ) ( not ( = ?auto_191773 ?auto_191776 ) ) ( not ( = ?auto_191773 ?auto_191777 ) ) ( not ( = ?auto_191773 ?auto_191778 ) ) ( not ( = ?auto_191774 ?auto_191775 ) ) ( not ( = ?auto_191774 ?auto_191776 ) ) ( not ( = ?auto_191774 ?auto_191777 ) ) ( not ( = ?auto_191774 ?auto_191778 ) ) ( not ( = ?auto_191775 ?auto_191776 ) ) ( not ( = ?auto_191775 ?auto_191777 ) ) ( not ( = ?auto_191775 ?auto_191778 ) ) ( not ( = ?auto_191776 ?auto_191777 ) ) ( not ( = ?auto_191776 ?auto_191778 ) ) ( not ( = ?auto_191777 ?auto_191778 ) ) ( ON-TABLE ?auto_191778 ) ( ON ?auto_191777 ?auto_191778 ) ( ON ?auto_191776 ?auto_191777 ) ( ON ?auto_191775 ?auto_191776 ) ( CLEAR ?auto_191773 ) ( ON ?auto_191774 ?auto_191775 ) ( CLEAR ?auto_191774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191778 ?auto_191777 ?auto_191776 ?auto_191775 )
      ( MAKE-8PILE ?auto_191771 ?auto_191772 ?auto_191773 ?auto_191774 ?auto_191775 ?auto_191776 ?auto_191777 ?auto_191778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191779 - BLOCK
      ?auto_191780 - BLOCK
      ?auto_191781 - BLOCK
      ?auto_191782 - BLOCK
      ?auto_191783 - BLOCK
      ?auto_191784 - BLOCK
      ?auto_191785 - BLOCK
      ?auto_191786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191779 ) ( ON ?auto_191780 ?auto_191779 ) ( not ( = ?auto_191779 ?auto_191780 ) ) ( not ( = ?auto_191779 ?auto_191781 ) ) ( not ( = ?auto_191779 ?auto_191782 ) ) ( not ( = ?auto_191779 ?auto_191783 ) ) ( not ( = ?auto_191779 ?auto_191784 ) ) ( not ( = ?auto_191779 ?auto_191785 ) ) ( not ( = ?auto_191779 ?auto_191786 ) ) ( not ( = ?auto_191780 ?auto_191781 ) ) ( not ( = ?auto_191780 ?auto_191782 ) ) ( not ( = ?auto_191780 ?auto_191783 ) ) ( not ( = ?auto_191780 ?auto_191784 ) ) ( not ( = ?auto_191780 ?auto_191785 ) ) ( not ( = ?auto_191780 ?auto_191786 ) ) ( not ( = ?auto_191781 ?auto_191782 ) ) ( not ( = ?auto_191781 ?auto_191783 ) ) ( not ( = ?auto_191781 ?auto_191784 ) ) ( not ( = ?auto_191781 ?auto_191785 ) ) ( not ( = ?auto_191781 ?auto_191786 ) ) ( not ( = ?auto_191782 ?auto_191783 ) ) ( not ( = ?auto_191782 ?auto_191784 ) ) ( not ( = ?auto_191782 ?auto_191785 ) ) ( not ( = ?auto_191782 ?auto_191786 ) ) ( not ( = ?auto_191783 ?auto_191784 ) ) ( not ( = ?auto_191783 ?auto_191785 ) ) ( not ( = ?auto_191783 ?auto_191786 ) ) ( not ( = ?auto_191784 ?auto_191785 ) ) ( not ( = ?auto_191784 ?auto_191786 ) ) ( not ( = ?auto_191785 ?auto_191786 ) ) ( ON-TABLE ?auto_191786 ) ( ON ?auto_191785 ?auto_191786 ) ( ON ?auto_191784 ?auto_191785 ) ( ON ?auto_191783 ?auto_191784 ) ( ON ?auto_191782 ?auto_191783 ) ( CLEAR ?auto_191782 ) ( HOLDING ?auto_191781 ) ( CLEAR ?auto_191780 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191779 ?auto_191780 ?auto_191781 )
      ( MAKE-8PILE ?auto_191779 ?auto_191780 ?auto_191781 ?auto_191782 ?auto_191783 ?auto_191784 ?auto_191785 ?auto_191786 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191787 - BLOCK
      ?auto_191788 - BLOCK
      ?auto_191789 - BLOCK
      ?auto_191790 - BLOCK
      ?auto_191791 - BLOCK
      ?auto_191792 - BLOCK
      ?auto_191793 - BLOCK
      ?auto_191794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191787 ) ( ON ?auto_191788 ?auto_191787 ) ( not ( = ?auto_191787 ?auto_191788 ) ) ( not ( = ?auto_191787 ?auto_191789 ) ) ( not ( = ?auto_191787 ?auto_191790 ) ) ( not ( = ?auto_191787 ?auto_191791 ) ) ( not ( = ?auto_191787 ?auto_191792 ) ) ( not ( = ?auto_191787 ?auto_191793 ) ) ( not ( = ?auto_191787 ?auto_191794 ) ) ( not ( = ?auto_191788 ?auto_191789 ) ) ( not ( = ?auto_191788 ?auto_191790 ) ) ( not ( = ?auto_191788 ?auto_191791 ) ) ( not ( = ?auto_191788 ?auto_191792 ) ) ( not ( = ?auto_191788 ?auto_191793 ) ) ( not ( = ?auto_191788 ?auto_191794 ) ) ( not ( = ?auto_191789 ?auto_191790 ) ) ( not ( = ?auto_191789 ?auto_191791 ) ) ( not ( = ?auto_191789 ?auto_191792 ) ) ( not ( = ?auto_191789 ?auto_191793 ) ) ( not ( = ?auto_191789 ?auto_191794 ) ) ( not ( = ?auto_191790 ?auto_191791 ) ) ( not ( = ?auto_191790 ?auto_191792 ) ) ( not ( = ?auto_191790 ?auto_191793 ) ) ( not ( = ?auto_191790 ?auto_191794 ) ) ( not ( = ?auto_191791 ?auto_191792 ) ) ( not ( = ?auto_191791 ?auto_191793 ) ) ( not ( = ?auto_191791 ?auto_191794 ) ) ( not ( = ?auto_191792 ?auto_191793 ) ) ( not ( = ?auto_191792 ?auto_191794 ) ) ( not ( = ?auto_191793 ?auto_191794 ) ) ( ON-TABLE ?auto_191794 ) ( ON ?auto_191793 ?auto_191794 ) ( ON ?auto_191792 ?auto_191793 ) ( ON ?auto_191791 ?auto_191792 ) ( ON ?auto_191790 ?auto_191791 ) ( CLEAR ?auto_191788 ) ( ON ?auto_191789 ?auto_191790 ) ( CLEAR ?auto_191789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191794 ?auto_191793 ?auto_191792 ?auto_191791 ?auto_191790 )
      ( MAKE-8PILE ?auto_191787 ?auto_191788 ?auto_191789 ?auto_191790 ?auto_191791 ?auto_191792 ?auto_191793 ?auto_191794 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191795 - BLOCK
      ?auto_191796 - BLOCK
      ?auto_191797 - BLOCK
      ?auto_191798 - BLOCK
      ?auto_191799 - BLOCK
      ?auto_191800 - BLOCK
      ?auto_191801 - BLOCK
      ?auto_191802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191795 ) ( not ( = ?auto_191795 ?auto_191796 ) ) ( not ( = ?auto_191795 ?auto_191797 ) ) ( not ( = ?auto_191795 ?auto_191798 ) ) ( not ( = ?auto_191795 ?auto_191799 ) ) ( not ( = ?auto_191795 ?auto_191800 ) ) ( not ( = ?auto_191795 ?auto_191801 ) ) ( not ( = ?auto_191795 ?auto_191802 ) ) ( not ( = ?auto_191796 ?auto_191797 ) ) ( not ( = ?auto_191796 ?auto_191798 ) ) ( not ( = ?auto_191796 ?auto_191799 ) ) ( not ( = ?auto_191796 ?auto_191800 ) ) ( not ( = ?auto_191796 ?auto_191801 ) ) ( not ( = ?auto_191796 ?auto_191802 ) ) ( not ( = ?auto_191797 ?auto_191798 ) ) ( not ( = ?auto_191797 ?auto_191799 ) ) ( not ( = ?auto_191797 ?auto_191800 ) ) ( not ( = ?auto_191797 ?auto_191801 ) ) ( not ( = ?auto_191797 ?auto_191802 ) ) ( not ( = ?auto_191798 ?auto_191799 ) ) ( not ( = ?auto_191798 ?auto_191800 ) ) ( not ( = ?auto_191798 ?auto_191801 ) ) ( not ( = ?auto_191798 ?auto_191802 ) ) ( not ( = ?auto_191799 ?auto_191800 ) ) ( not ( = ?auto_191799 ?auto_191801 ) ) ( not ( = ?auto_191799 ?auto_191802 ) ) ( not ( = ?auto_191800 ?auto_191801 ) ) ( not ( = ?auto_191800 ?auto_191802 ) ) ( not ( = ?auto_191801 ?auto_191802 ) ) ( ON-TABLE ?auto_191802 ) ( ON ?auto_191801 ?auto_191802 ) ( ON ?auto_191800 ?auto_191801 ) ( ON ?auto_191799 ?auto_191800 ) ( ON ?auto_191798 ?auto_191799 ) ( ON ?auto_191797 ?auto_191798 ) ( CLEAR ?auto_191797 ) ( HOLDING ?auto_191796 ) ( CLEAR ?auto_191795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191795 ?auto_191796 )
      ( MAKE-8PILE ?auto_191795 ?auto_191796 ?auto_191797 ?auto_191798 ?auto_191799 ?auto_191800 ?auto_191801 ?auto_191802 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191803 - BLOCK
      ?auto_191804 - BLOCK
      ?auto_191805 - BLOCK
      ?auto_191806 - BLOCK
      ?auto_191807 - BLOCK
      ?auto_191808 - BLOCK
      ?auto_191809 - BLOCK
      ?auto_191810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191803 ) ( not ( = ?auto_191803 ?auto_191804 ) ) ( not ( = ?auto_191803 ?auto_191805 ) ) ( not ( = ?auto_191803 ?auto_191806 ) ) ( not ( = ?auto_191803 ?auto_191807 ) ) ( not ( = ?auto_191803 ?auto_191808 ) ) ( not ( = ?auto_191803 ?auto_191809 ) ) ( not ( = ?auto_191803 ?auto_191810 ) ) ( not ( = ?auto_191804 ?auto_191805 ) ) ( not ( = ?auto_191804 ?auto_191806 ) ) ( not ( = ?auto_191804 ?auto_191807 ) ) ( not ( = ?auto_191804 ?auto_191808 ) ) ( not ( = ?auto_191804 ?auto_191809 ) ) ( not ( = ?auto_191804 ?auto_191810 ) ) ( not ( = ?auto_191805 ?auto_191806 ) ) ( not ( = ?auto_191805 ?auto_191807 ) ) ( not ( = ?auto_191805 ?auto_191808 ) ) ( not ( = ?auto_191805 ?auto_191809 ) ) ( not ( = ?auto_191805 ?auto_191810 ) ) ( not ( = ?auto_191806 ?auto_191807 ) ) ( not ( = ?auto_191806 ?auto_191808 ) ) ( not ( = ?auto_191806 ?auto_191809 ) ) ( not ( = ?auto_191806 ?auto_191810 ) ) ( not ( = ?auto_191807 ?auto_191808 ) ) ( not ( = ?auto_191807 ?auto_191809 ) ) ( not ( = ?auto_191807 ?auto_191810 ) ) ( not ( = ?auto_191808 ?auto_191809 ) ) ( not ( = ?auto_191808 ?auto_191810 ) ) ( not ( = ?auto_191809 ?auto_191810 ) ) ( ON-TABLE ?auto_191810 ) ( ON ?auto_191809 ?auto_191810 ) ( ON ?auto_191808 ?auto_191809 ) ( ON ?auto_191807 ?auto_191808 ) ( ON ?auto_191806 ?auto_191807 ) ( ON ?auto_191805 ?auto_191806 ) ( CLEAR ?auto_191803 ) ( ON ?auto_191804 ?auto_191805 ) ( CLEAR ?auto_191804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191810 ?auto_191809 ?auto_191808 ?auto_191807 ?auto_191806 ?auto_191805 )
      ( MAKE-8PILE ?auto_191803 ?auto_191804 ?auto_191805 ?auto_191806 ?auto_191807 ?auto_191808 ?auto_191809 ?auto_191810 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191811 - BLOCK
      ?auto_191812 - BLOCK
      ?auto_191813 - BLOCK
      ?auto_191814 - BLOCK
      ?auto_191815 - BLOCK
      ?auto_191816 - BLOCK
      ?auto_191817 - BLOCK
      ?auto_191818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191811 ?auto_191812 ) ) ( not ( = ?auto_191811 ?auto_191813 ) ) ( not ( = ?auto_191811 ?auto_191814 ) ) ( not ( = ?auto_191811 ?auto_191815 ) ) ( not ( = ?auto_191811 ?auto_191816 ) ) ( not ( = ?auto_191811 ?auto_191817 ) ) ( not ( = ?auto_191811 ?auto_191818 ) ) ( not ( = ?auto_191812 ?auto_191813 ) ) ( not ( = ?auto_191812 ?auto_191814 ) ) ( not ( = ?auto_191812 ?auto_191815 ) ) ( not ( = ?auto_191812 ?auto_191816 ) ) ( not ( = ?auto_191812 ?auto_191817 ) ) ( not ( = ?auto_191812 ?auto_191818 ) ) ( not ( = ?auto_191813 ?auto_191814 ) ) ( not ( = ?auto_191813 ?auto_191815 ) ) ( not ( = ?auto_191813 ?auto_191816 ) ) ( not ( = ?auto_191813 ?auto_191817 ) ) ( not ( = ?auto_191813 ?auto_191818 ) ) ( not ( = ?auto_191814 ?auto_191815 ) ) ( not ( = ?auto_191814 ?auto_191816 ) ) ( not ( = ?auto_191814 ?auto_191817 ) ) ( not ( = ?auto_191814 ?auto_191818 ) ) ( not ( = ?auto_191815 ?auto_191816 ) ) ( not ( = ?auto_191815 ?auto_191817 ) ) ( not ( = ?auto_191815 ?auto_191818 ) ) ( not ( = ?auto_191816 ?auto_191817 ) ) ( not ( = ?auto_191816 ?auto_191818 ) ) ( not ( = ?auto_191817 ?auto_191818 ) ) ( ON-TABLE ?auto_191818 ) ( ON ?auto_191817 ?auto_191818 ) ( ON ?auto_191816 ?auto_191817 ) ( ON ?auto_191815 ?auto_191816 ) ( ON ?auto_191814 ?auto_191815 ) ( ON ?auto_191813 ?auto_191814 ) ( ON ?auto_191812 ?auto_191813 ) ( CLEAR ?auto_191812 ) ( HOLDING ?auto_191811 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191811 )
      ( MAKE-8PILE ?auto_191811 ?auto_191812 ?auto_191813 ?auto_191814 ?auto_191815 ?auto_191816 ?auto_191817 ?auto_191818 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191819 - BLOCK
      ?auto_191820 - BLOCK
      ?auto_191821 - BLOCK
      ?auto_191822 - BLOCK
      ?auto_191823 - BLOCK
      ?auto_191824 - BLOCK
      ?auto_191825 - BLOCK
      ?auto_191826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191819 ?auto_191820 ) ) ( not ( = ?auto_191819 ?auto_191821 ) ) ( not ( = ?auto_191819 ?auto_191822 ) ) ( not ( = ?auto_191819 ?auto_191823 ) ) ( not ( = ?auto_191819 ?auto_191824 ) ) ( not ( = ?auto_191819 ?auto_191825 ) ) ( not ( = ?auto_191819 ?auto_191826 ) ) ( not ( = ?auto_191820 ?auto_191821 ) ) ( not ( = ?auto_191820 ?auto_191822 ) ) ( not ( = ?auto_191820 ?auto_191823 ) ) ( not ( = ?auto_191820 ?auto_191824 ) ) ( not ( = ?auto_191820 ?auto_191825 ) ) ( not ( = ?auto_191820 ?auto_191826 ) ) ( not ( = ?auto_191821 ?auto_191822 ) ) ( not ( = ?auto_191821 ?auto_191823 ) ) ( not ( = ?auto_191821 ?auto_191824 ) ) ( not ( = ?auto_191821 ?auto_191825 ) ) ( not ( = ?auto_191821 ?auto_191826 ) ) ( not ( = ?auto_191822 ?auto_191823 ) ) ( not ( = ?auto_191822 ?auto_191824 ) ) ( not ( = ?auto_191822 ?auto_191825 ) ) ( not ( = ?auto_191822 ?auto_191826 ) ) ( not ( = ?auto_191823 ?auto_191824 ) ) ( not ( = ?auto_191823 ?auto_191825 ) ) ( not ( = ?auto_191823 ?auto_191826 ) ) ( not ( = ?auto_191824 ?auto_191825 ) ) ( not ( = ?auto_191824 ?auto_191826 ) ) ( not ( = ?auto_191825 ?auto_191826 ) ) ( ON-TABLE ?auto_191826 ) ( ON ?auto_191825 ?auto_191826 ) ( ON ?auto_191824 ?auto_191825 ) ( ON ?auto_191823 ?auto_191824 ) ( ON ?auto_191822 ?auto_191823 ) ( ON ?auto_191821 ?auto_191822 ) ( ON ?auto_191820 ?auto_191821 ) ( ON ?auto_191819 ?auto_191820 ) ( CLEAR ?auto_191819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191826 ?auto_191825 ?auto_191824 ?auto_191823 ?auto_191822 ?auto_191821 ?auto_191820 )
      ( MAKE-8PILE ?auto_191819 ?auto_191820 ?auto_191821 ?auto_191822 ?auto_191823 ?auto_191824 ?auto_191825 ?auto_191826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191827 - BLOCK
      ?auto_191828 - BLOCK
      ?auto_191829 - BLOCK
      ?auto_191830 - BLOCK
      ?auto_191831 - BLOCK
      ?auto_191832 - BLOCK
      ?auto_191833 - BLOCK
      ?auto_191834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191827 ?auto_191828 ) ) ( not ( = ?auto_191827 ?auto_191829 ) ) ( not ( = ?auto_191827 ?auto_191830 ) ) ( not ( = ?auto_191827 ?auto_191831 ) ) ( not ( = ?auto_191827 ?auto_191832 ) ) ( not ( = ?auto_191827 ?auto_191833 ) ) ( not ( = ?auto_191827 ?auto_191834 ) ) ( not ( = ?auto_191828 ?auto_191829 ) ) ( not ( = ?auto_191828 ?auto_191830 ) ) ( not ( = ?auto_191828 ?auto_191831 ) ) ( not ( = ?auto_191828 ?auto_191832 ) ) ( not ( = ?auto_191828 ?auto_191833 ) ) ( not ( = ?auto_191828 ?auto_191834 ) ) ( not ( = ?auto_191829 ?auto_191830 ) ) ( not ( = ?auto_191829 ?auto_191831 ) ) ( not ( = ?auto_191829 ?auto_191832 ) ) ( not ( = ?auto_191829 ?auto_191833 ) ) ( not ( = ?auto_191829 ?auto_191834 ) ) ( not ( = ?auto_191830 ?auto_191831 ) ) ( not ( = ?auto_191830 ?auto_191832 ) ) ( not ( = ?auto_191830 ?auto_191833 ) ) ( not ( = ?auto_191830 ?auto_191834 ) ) ( not ( = ?auto_191831 ?auto_191832 ) ) ( not ( = ?auto_191831 ?auto_191833 ) ) ( not ( = ?auto_191831 ?auto_191834 ) ) ( not ( = ?auto_191832 ?auto_191833 ) ) ( not ( = ?auto_191832 ?auto_191834 ) ) ( not ( = ?auto_191833 ?auto_191834 ) ) ( ON-TABLE ?auto_191834 ) ( ON ?auto_191833 ?auto_191834 ) ( ON ?auto_191832 ?auto_191833 ) ( ON ?auto_191831 ?auto_191832 ) ( ON ?auto_191830 ?auto_191831 ) ( ON ?auto_191829 ?auto_191830 ) ( ON ?auto_191828 ?auto_191829 ) ( HOLDING ?auto_191827 ) ( CLEAR ?auto_191828 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191834 ?auto_191833 ?auto_191832 ?auto_191831 ?auto_191830 ?auto_191829 ?auto_191828 ?auto_191827 )
      ( MAKE-8PILE ?auto_191827 ?auto_191828 ?auto_191829 ?auto_191830 ?auto_191831 ?auto_191832 ?auto_191833 ?auto_191834 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191835 - BLOCK
      ?auto_191836 - BLOCK
      ?auto_191837 - BLOCK
      ?auto_191838 - BLOCK
      ?auto_191839 - BLOCK
      ?auto_191840 - BLOCK
      ?auto_191841 - BLOCK
      ?auto_191842 - BLOCK
    )
    :vars
    (
      ?auto_191843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191835 ?auto_191836 ) ) ( not ( = ?auto_191835 ?auto_191837 ) ) ( not ( = ?auto_191835 ?auto_191838 ) ) ( not ( = ?auto_191835 ?auto_191839 ) ) ( not ( = ?auto_191835 ?auto_191840 ) ) ( not ( = ?auto_191835 ?auto_191841 ) ) ( not ( = ?auto_191835 ?auto_191842 ) ) ( not ( = ?auto_191836 ?auto_191837 ) ) ( not ( = ?auto_191836 ?auto_191838 ) ) ( not ( = ?auto_191836 ?auto_191839 ) ) ( not ( = ?auto_191836 ?auto_191840 ) ) ( not ( = ?auto_191836 ?auto_191841 ) ) ( not ( = ?auto_191836 ?auto_191842 ) ) ( not ( = ?auto_191837 ?auto_191838 ) ) ( not ( = ?auto_191837 ?auto_191839 ) ) ( not ( = ?auto_191837 ?auto_191840 ) ) ( not ( = ?auto_191837 ?auto_191841 ) ) ( not ( = ?auto_191837 ?auto_191842 ) ) ( not ( = ?auto_191838 ?auto_191839 ) ) ( not ( = ?auto_191838 ?auto_191840 ) ) ( not ( = ?auto_191838 ?auto_191841 ) ) ( not ( = ?auto_191838 ?auto_191842 ) ) ( not ( = ?auto_191839 ?auto_191840 ) ) ( not ( = ?auto_191839 ?auto_191841 ) ) ( not ( = ?auto_191839 ?auto_191842 ) ) ( not ( = ?auto_191840 ?auto_191841 ) ) ( not ( = ?auto_191840 ?auto_191842 ) ) ( not ( = ?auto_191841 ?auto_191842 ) ) ( ON-TABLE ?auto_191842 ) ( ON ?auto_191841 ?auto_191842 ) ( ON ?auto_191840 ?auto_191841 ) ( ON ?auto_191839 ?auto_191840 ) ( ON ?auto_191838 ?auto_191839 ) ( ON ?auto_191837 ?auto_191838 ) ( ON ?auto_191836 ?auto_191837 ) ( CLEAR ?auto_191836 ) ( ON ?auto_191835 ?auto_191843 ) ( CLEAR ?auto_191835 ) ( HAND-EMPTY ) ( not ( = ?auto_191835 ?auto_191843 ) ) ( not ( = ?auto_191836 ?auto_191843 ) ) ( not ( = ?auto_191837 ?auto_191843 ) ) ( not ( = ?auto_191838 ?auto_191843 ) ) ( not ( = ?auto_191839 ?auto_191843 ) ) ( not ( = ?auto_191840 ?auto_191843 ) ) ( not ( = ?auto_191841 ?auto_191843 ) ) ( not ( = ?auto_191842 ?auto_191843 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191835 ?auto_191843 )
      ( MAKE-8PILE ?auto_191835 ?auto_191836 ?auto_191837 ?auto_191838 ?auto_191839 ?auto_191840 ?auto_191841 ?auto_191842 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191844 - BLOCK
      ?auto_191845 - BLOCK
      ?auto_191846 - BLOCK
      ?auto_191847 - BLOCK
      ?auto_191848 - BLOCK
      ?auto_191849 - BLOCK
      ?auto_191850 - BLOCK
      ?auto_191851 - BLOCK
    )
    :vars
    (
      ?auto_191852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191844 ?auto_191845 ) ) ( not ( = ?auto_191844 ?auto_191846 ) ) ( not ( = ?auto_191844 ?auto_191847 ) ) ( not ( = ?auto_191844 ?auto_191848 ) ) ( not ( = ?auto_191844 ?auto_191849 ) ) ( not ( = ?auto_191844 ?auto_191850 ) ) ( not ( = ?auto_191844 ?auto_191851 ) ) ( not ( = ?auto_191845 ?auto_191846 ) ) ( not ( = ?auto_191845 ?auto_191847 ) ) ( not ( = ?auto_191845 ?auto_191848 ) ) ( not ( = ?auto_191845 ?auto_191849 ) ) ( not ( = ?auto_191845 ?auto_191850 ) ) ( not ( = ?auto_191845 ?auto_191851 ) ) ( not ( = ?auto_191846 ?auto_191847 ) ) ( not ( = ?auto_191846 ?auto_191848 ) ) ( not ( = ?auto_191846 ?auto_191849 ) ) ( not ( = ?auto_191846 ?auto_191850 ) ) ( not ( = ?auto_191846 ?auto_191851 ) ) ( not ( = ?auto_191847 ?auto_191848 ) ) ( not ( = ?auto_191847 ?auto_191849 ) ) ( not ( = ?auto_191847 ?auto_191850 ) ) ( not ( = ?auto_191847 ?auto_191851 ) ) ( not ( = ?auto_191848 ?auto_191849 ) ) ( not ( = ?auto_191848 ?auto_191850 ) ) ( not ( = ?auto_191848 ?auto_191851 ) ) ( not ( = ?auto_191849 ?auto_191850 ) ) ( not ( = ?auto_191849 ?auto_191851 ) ) ( not ( = ?auto_191850 ?auto_191851 ) ) ( ON-TABLE ?auto_191851 ) ( ON ?auto_191850 ?auto_191851 ) ( ON ?auto_191849 ?auto_191850 ) ( ON ?auto_191848 ?auto_191849 ) ( ON ?auto_191847 ?auto_191848 ) ( ON ?auto_191846 ?auto_191847 ) ( ON ?auto_191844 ?auto_191852 ) ( CLEAR ?auto_191844 ) ( not ( = ?auto_191844 ?auto_191852 ) ) ( not ( = ?auto_191845 ?auto_191852 ) ) ( not ( = ?auto_191846 ?auto_191852 ) ) ( not ( = ?auto_191847 ?auto_191852 ) ) ( not ( = ?auto_191848 ?auto_191852 ) ) ( not ( = ?auto_191849 ?auto_191852 ) ) ( not ( = ?auto_191850 ?auto_191852 ) ) ( not ( = ?auto_191851 ?auto_191852 ) ) ( HOLDING ?auto_191845 ) ( CLEAR ?auto_191846 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191851 ?auto_191850 ?auto_191849 ?auto_191848 ?auto_191847 ?auto_191846 ?auto_191845 )
      ( MAKE-8PILE ?auto_191844 ?auto_191845 ?auto_191846 ?auto_191847 ?auto_191848 ?auto_191849 ?auto_191850 ?auto_191851 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191853 - BLOCK
      ?auto_191854 - BLOCK
      ?auto_191855 - BLOCK
      ?auto_191856 - BLOCK
      ?auto_191857 - BLOCK
      ?auto_191858 - BLOCK
      ?auto_191859 - BLOCK
      ?auto_191860 - BLOCK
    )
    :vars
    (
      ?auto_191861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191853 ?auto_191854 ) ) ( not ( = ?auto_191853 ?auto_191855 ) ) ( not ( = ?auto_191853 ?auto_191856 ) ) ( not ( = ?auto_191853 ?auto_191857 ) ) ( not ( = ?auto_191853 ?auto_191858 ) ) ( not ( = ?auto_191853 ?auto_191859 ) ) ( not ( = ?auto_191853 ?auto_191860 ) ) ( not ( = ?auto_191854 ?auto_191855 ) ) ( not ( = ?auto_191854 ?auto_191856 ) ) ( not ( = ?auto_191854 ?auto_191857 ) ) ( not ( = ?auto_191854 ?auto_191858 ) ) ( not ( = ?auto_191854 ?auto_191859 ) ) ( not ( = ?auto_191854 ?auto_191860 ) ) ( not ( = ?auto_191855 ?auto_191856 ) ) ( not ( = ?auto_191855 ?auto_191857 ) ) ( not ( = ?auto_191855 ?auto_191858 ) ) ( not ( = ?auto_191855 ?auto_191859 ) ) ( not ( = ?auto_191855 ?auto_191860 ) ) ( not ( = ?auto_191856 ?auto_191857 ) ) ( not ( = ?auto_191856 ?auto_191858 ) ) ( not ( = ?auto_191856 ?auto_191859 ) ) ( not ( = ?auto_191856 ?auto_191860 ) ) ( not ( = ?auto_191857 ?auto_191858 ) ) ( not ( = ?auto_191857 ?auto_191859 ) ) ( not ( = ?auto_191857 ?auto_191860 ) ) ( not ( = ?auto_191858 ?auto_191859 ) ) ( not ( = ?auto_191858 ?auto_191860 ) ) ( not ( = ?auto_191859 ?auto_191860 ) ) ( ON-TABLE ?auto_191860 ) ( ON ?auto_191859 ?auto_191860 ) ( ON ?auto_191858 ?auto_191859 ) ( ON ?auto_191857 ?auto_191858 ) ( ON ?auto_191856 ?auto_191857 ) ( ON ?auto_191855 ?auto_191856 ) ( ON ?auto_191853 ?auto_191861 ) ( not ( = ?auto_191853 ?auto_191861 ) ) ( not ( = ?auto_191854 ?auto_191861 ) ) ( not ( = ?auto_191855 ?auto_191861 ) ) ( not ( = ?auto_191856 ?auto_191861 ) ) ( not ( = ?auto_191857 ?auto_191861 ) ) ( not ( = ?auto_191858 ?auto_191861 ) ) ( not ( = ?auto_191859 ?auto_191861 ) ) ( not ( = ?auto_191860 ?auto_191861 ) ) ( CLEAR ?auto_191855 ) ( ON ?auto_191854 ?auto_191853 ) ( CLEAR ?auto_191854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191861 ?auto_191853 )
      ( MAKE-8PILE ?auto_191853 ?auto_191854 ?auto_191855 ?auto_191856 ?auto_191857 ?auto_191858 ?auto_191859 ?auto_191860 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191862 - BLOCK
      ?auto_191863 - BLOCK
      ?auto_191864 - BLOCK
      ?auto_191865 - BLOCK
      ?auto_191866 - BLOCK
      ?auto_191867 - BLOCK
      ?auto_191868 - BLOCK
      ?auto_191869 - BLOCK
    )
    :vars
    (
      ?auto_191870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191862 ?auto_191863 ) ) ( not ( = ?auto_191862 ?auto_191864 ) ) ( not ( = ?auto_191862 ?auto_191865 ) ) ( not ( = ?auto_191862 ?auto_191866 ) ) ( not ( = ?auto_191862 ?auto_191867 ) ) ( not ( = ?auto_191862 ?auto_191868 ) ) ( not ( = ?auto_191862 ?auto_191869 ) ) ( not ( = ?auto_191863 ?auto_191864 ) ) ( not ( = ?auto_191863 ?auto_191865 ) ) ( not ( = ?auto_191863 ?auto_191866 ) ) ( not ( = ?auto_191863 ?auto_191867 ) ) ( not ( = ?auto_191863 ?auto_191868 ) ) ( not ( = ?auto_191863 ?auto_191869 ) ) ( not ( = ?auto_191864 ?auto_191865 ) ) ( not ( = ?auto_191864 ?auto_191866 ) ) ( not ( = ?auto_191864 ?auto_191867 ) ) ( not ( = ?auto_191864 ?auto_191868 ) ) ( not ( = ?auto_191864 ?auto_191869 ) ) ( not ( = ?auto_191865 ?auto_191866 ) ) ( not ( = ?auto_191865 ?auto_191867 ) ) ( not ( = ?auto_191865 ?auto_191868 ) ) ( not ( = ?auto_191865 ?auto_191869 ) ) ( not ( = ?auto_191866 ?auto_191867 ) ) ( not ( = ?auto_191866 ?auto_191868 ) ) ( not ( = ?auto_191866 ?auto_191869 ) ) ( not ( = ?auto_191867 ?auto_191868 ) ) ( not ( = ?auto_191867 ?auto_191869 ) ) ( not ( = ?auto_191868 ?auto_191869 ) ) ( ON-TABLE ?auto_191869 ) ( ON ?auto_191868 ?auto_191869 ) ( ON ?auto_191867 ?auto_191868 ) ( ON ?auto_191866 ?auto_191867 ) ( ON ?auto_191865 ?auto_191866 ) ( ON ?auto_191862 ?auto_191870 ) ( not ( = ?auto_191862 ?auto_191870 ) ) ( not ( = ?auto_191863 ?auto_191870 ) ) ( not ( = ?auto_191864 ?auto_191870 ) ) ( not ( = ?auto_191865 ?auto_191870 ) ) ( not ( = ?auto_191866 ?auto_191870 ) ) ( not ( = ?auto_191867 ?auto_191870 ) ) ( not ( = ?auto_191868 ?auto_191870 ) ) ( not ( = ?auto_191869 ?auto_191870 ) ) ( ON ?auto_191863 ?auto_191862 ) ( CLEAR ?auto_191863 ) ( ON-TABLE ?auto_191870 ) ( HOLDING ?auto_191864 ) ( CLEAR ?auto_191865 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191869 ?auto_191868 ?auto_191867 ?auto_191866 ?auto_191865 ?auto_191864 )
      ( MAKE-8PILE ?auto_191862 ?auto_191863 ?auto_191864 ?auto_191865 ?auto_191866 ?auto_191867 ?auto_191868 ?auto_191869 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191871 - BLOCK
      ?auto_191872 - BLOCK
      ?auto_191873 - BLOCK
      ?auto_191874 - BLOCK
      ?auto_191875 - BLOCK
      ?auto_191876 - BLOCK
      ?auto_191877 - BLOCK
      ?auto_191878 - BLOCK
    )
    :vars
    (
      ?auto_191879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191871 ?auto_191872 ) ) ( not ( = ?auto_191871 ?auto_191873 ) ) ( not ( = ?auto_191871 ?auto_191874 ) ) ( not ( = ?auto_191871 ?auto_191875 ) ) ( not ( = ?auto_191871 ?auto_191876 ) ) ( not ( = ?auto_191871 ?auto_191877 ) ) ( not ( = ?auto_191871 ?auto_191878 ) ) ( not ( = ?auto_191872 ?auto_191873 ) ) ( not ( = ?auto_191872 ?auto_191874 ) ) ( not ( = ?auto_191872 ?auto_191875 ) ) ( not ( = ?auto_191872 ?auto_191876 ) ) ( not ( = ?auto_191872 ?auto_191877 ) ) ( not ( = ?auto_191872 ?auto_191878 ) ) ( not ( = ?auto_191873 ?auto_191874 ) ) ( not ( = ?auto_191873 ?auto_191875 ) ) ( not ( = ?auto_191873 ?auto_191876 ) ) ( not ( = ?auto_191873 ?auto_191877 ) ) ( not ( = ?auto_191873 ?auto_191878 ) ) ( not ( = ?auto_191874 ?auto_191875 ) ) ( not ( = ?auto_191874 ?auto_191876 ) ) ( not ( = ?auto_191874 ?auto_191877 ) ) ( not ( = ?auto_191874 ?auto_191878 ) ) ( not ( = ?auto_191875 ?auto_191876 ) ) ( not ( = ?auto_191875 ?auto_191877 ) ) ( not ( = ?auto_191875 ?auto_191878 ) ) ( not ( = ?auto_191876 ?auto_191877 ) ) ( not ( = ?auto_191876 ?auto_191878 ) ) ( not ( = ?auto_191877 ?auto_191878 ) ) ( ON-TABLE ?auto_191878 ) ( ON ?auto_191877 ?auto_191878 ) ( ON ?auto_191876 ?auto_191877 ) ( ON ?auto_191875 ?auto_191876 ) ( ON ?auto_191874 ?auto_191875 ) ( ON ?auto_191871 ?auto_191879 ) ( not ( = ?auto_191871 ?auto_191879 ) ) ( not ( = ?auto_191872 ?auto_191879 ) ) ( not ( = ?auto_191873 ?auto_191879 ) ) ( not ( = ?auto_191874 ?auto_191879 ) ) ( not ( = ?auto_191875 ?auto_191879 ) ) ( not ( = ?auto_191876 ?auto_191879 ) ) ( not ( = ?auto_191877 ?auto_191879 ) ) ( not ( = ?auto_191878 ?auto_191879 ) ) ( ON ?auto_191872 ?auto_191871 ) ( ON-TABLE ?auto_191879 ) ( CLEAR ?auto_191874 ) ( ON ?auto_191873 ?auto_191872 ) ( CLEAR ?auto_191873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191879 ?auto_191871 ?auto_191872 )
      ( MAKE-8PILE ?auto_191871 ?auto_191872 ?auto_191873 ?auto_191874 ?auto_191875 ?auto_191876 ?auto_191877 ?auto_191878 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191880 - BLOCK
      ?auto_191881 - BLOCK
      ?auto_191882 - BLOCK
      ?auto_191883 - BLOCK
      ?auto_191884 - BLOCK
      ?auto_191885 - BLOCK
      ?auto_191886 - BLOCK
      ?auto_191887 - BLOCK
    )
    :vars
    (
      ?auto_191888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191880 ?auto_191881 ) ) ( not ( = ?auto_191880 ?auto_191882 ) ) ( not ( = ?auto_191880 ?auto_191883 ) ) ( not ( = ?auto_191880 ?auto_191884 ) ) ( not ( = ?auto_191880 ?auto_191885 ) ) ( not ( = ?auto_191880 ?auto_191886 ) ) ( not ( = ?auto_191880 ?auto_191887 ) ) ( not ( = ?auto_191881 ?auto_191882 ) ) ( not ( = ?auto_191881 ?auto_191883 ) ) ( not ( = ?auto_191881 ?auto_191884 ) ) ( not ( = ?auto_191881 ?auto_191885 ) ) ( not ( = ?auto_191881 ?auto_191886 ) ) ( not ( = ?auto_191881 ?auto_191887 ) ) ( not ( = ?auto_191882 ?auto_191883 ) ) ( not ( = ?auto_191882 ?auto_191884 ) ) ( not ( = ?auto_191882 ?auto_191885 ) ) ( not ( = ?auto_191882 ?auto_191886 ) ) ( not ( = ?auto_191882 ?auto_191887 ) ) ( not ( = ?auto_191883 ?auto_191884 ) ) ( not ( = ?auto_191883 ?auto_191885 ) ) ( not ( = ?auto_191883 ?auto_191886 ) ) ( not ( = ?auto_191883 ?auto_191887 ) ) ( not ( = ?auto_191884 ?auto_191885 ) ) ( not ( = ?auto_191884 ?auto_191886 ) ) ( not ( = ?auto_191884 ?auto_191887 ) ) ( not ( = ?auto_191885 ?auto_191886 ) ) ( not ( = ?auto_191885 ?auto_191887 ) ) ( not ( = ?auto_191886 ?auto_191887 ) ) ( ON-TABLE ?auto_191887 ) ( ON ?auto_191886 ?auto_191887 ) ( ON ?auto_191885 ?auto_191886 ) ( ON ?auto_191884 ?auto_191885 ) ( ON ?auto_191880 ?auto_191888 ) ( not ( = ?auto_191880 ?auto_191888 ) ) ( not ( = ?auto_191881 ?auto_191888 ) ) ( not ( = ?auto_191882 ?auto_191888 ) ) ( not ( = ?auto_191883 ?auto_191888 ) ) ( not ( = ?auto_191884 ?auto_191888 ) ) ( not ( = ?auto_191885 ?auto_191888 ) ) ( not ( = ?auto_191886 ?auto_191888 ) ) ( not ( = ?auto_191887 ?auto_191888 ) ) ( ON ?auto_191881 ?auto_191880 ) ( ON-TABLE ?auto_191888 ) ( ON ?auto_191882 ?auto_191881 ) ( CLEAR ?auto_191882 ) ( HOLDING ?auto_191883 ) ( CLEAR ?auto_191884 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191887 ?auto_191886 ?auto_191885 ?auto_191884 ?auto_191883 )
      ( MAKE-8PILE ?auto_191880 ?auto_191881 ?auto_191882 ?auto_191883 ?auto_191884 ?auto_191885 ?auto_191886 ?auto_191887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191889 - BLOCK
      ?auto_191890 - BLOCK
      ?auto_191891 - BLOCK
      ?auto_191892 - BLOCK
      ?auto_191893 - BLOCK
      ?auto_191894 - BLOCK
      ?auto_191895 - BLOCK
      ?auto_191896 - BLOCK
    )
    :vars
    (
      ?auto_191897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191889 ?auto_191890 ) ) ( not ( = ?auto_191889 ?auto_191891 ) ) ( not ( = ?auto_191889 ?auto_191892 ) ) ( not ( = ?auto_191889 ?auto_191893 ) ) ( not ( = ?auto_191889 ?auto_191894 ) ) ( not ( = ?auto_191889 ?auto_191895 ) ) ( not ( = ?auto_191889 ?auto_191896 ) ) ( not ( = ?auto_191890 ?auto_191891 ) ) ( not ( = ?auto_191890 ?auto_191892 ) ) ( not ( = ?auto_191890 ?auto_191893 ) ) ( not ( = ?auto_191890 ?auto_191894 ) ) ( not ( = ?auto_191890 ?auto_191895 ) ) ( not ( = ?auto_191890 ?auto_191896 ) ) ( not ( = ?auto_191891 ?auto_191892 ) ) ( not ( = ?auto_191891 ?auto_191893 ) ) ( not ( = ?auto_191891 ?auto_191894 ) ) ( not ( = ?auto_191891 ?auto_191895 ) ) ( not ( = ?auto_191891 ?auto_191896 ) ) ( not ( = ?auto_191892 ?auto_191893 ) ) ( not ( = ?auto_191892 ?auto_191894 ) ) ( not ( = ?auto_191892 ?auto_191895 ) ) ( not ( = ?auto_191892 ?auto_191896 ) ) ( not ( = ?auto_191893 ?auto_191894 ) ) ( not ( = ?auto_191893 ?auto_191895 ) ) ( not ( = ?auto_191893 ?auto_191896 ) ) ( not ( = ?auto_191894 ?auto_191895 ) ) ( not ( = ?auto_191894 ?auto_191896 ) ) ( not ( = ?auto_191895 ?auto_191896 ) ) ( ON-TABLE ?auto_191896 ) ( ON ?auto_191895 ?auto_191896 ) ( ON ?auto_191894 ?auto_191895 ) ( ON ?auto_191893 ?auto_191894 ) ( ON ?auto_191889 ?auto_191897 ) ( not ( = ?auto_191889 ?auto_191897 ) ) ( not ( = ?auto_191890 ?auto_191897 ) ) ( not ( = ?auto_191891 ?auto_191897 ) ) ( not ( = ?auto_191892 ?auto_191897 ) ) ( not ( = ?auto_191893 ?auto_191897 ) ) ( not ( = ?auto_191894 ?auto_191897 ) ) ( not ( = ?auto_191895 ?auto_191897 ) ) ( not ( = ?auto_191896 ?auto_191897 ) ) ( ON ?auto_191890 ?auto_191889 ) ( ON-TABLE ?auto_191897 ) ( ON ?auto_191891 ?auto_191890 ) ( CLEAR ?auto_191893 ) ( ON ?auto_191892 ?auto_191891 ) ( CLEAR ?auto_191892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191897 ?auto_191889 ?auto_191890 ?auto_191891 )
      ( MAKE-8PILE ?auto_191889 ?auto_191890 ?auto_191891 ?auto_191892 ?auto_191893 ?auto_191894 ?auto_191895 ?auto_191896 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191898 - BLOCK
      ?auto_191899 - BLOCK
      ?auto_191900 - BLOCK
      ?auto_191901 - BLOCK
      ?auto_191902 - BLOCK
      ?auto_191903 - BLOCK
      ?auto_191904 - BLOCK
      ?auto_191905 - BLOCK
    )
    :vars
    (
      ?auto_191906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191898 ?auto_191899 ) ) ( not ( = ?auto_191898 ?auto_191900 ) ) ( not ( = ?auto_191898 ?auto_191901 ) ) ( not ( = ?auto_191898 ?auto_191902 ) ) ( not ( = ?auto_191898 ?auto_191903 ) ) ( not ( = ?auto_191898 ?auto_191904 ) ) ( not ( = ?auto_191898 ?auto_191905 ) ) ( not ( = ?auto_191899 ?auto_191900 ) ) ( not ( = ?auto_191899 ?auto_191901 ) ) ( not ( = ?auto_191899 ?auto_191902 ) ) ( not ( = ?auto_191899 ?auto_191903 ) ) ( not ( = ?auto_191899 ?auto_191904 ) ) ( not ( = ?auto_191899 ?auto_191905 ) ) ( not ( = ?auto_191900 ?auto_191901 ) ) ( not ( = ?auto_191900 ?auto_191902 ) ) ( not ( = ?auto_191900 ?auto_191903 ) ) ( not ( = ?auto_191900 ?auto_191904 ) ) ( not ( = ?auto_191900 ?auto_191905 ) ) ( not ( = ?auto_191901 ?auto_191902 ) ) ( not ( = ?auto_191901 ?auto_191903 ) ) ( not ( = ?auto_191901 ?auto_191904 ) ) ( not ( = ?auto_191901 ?auto_191905 ) ) ( not ( = ?auto_191902 ?auto_191903 ) ) ( not ( = ?auto_191902 ?auto_191904 ) ) ( not ( = ?auto_191902 ?auto_191905 ) ) ( not ( = ?auto_191903 ?auto_191904 ) ) ( not ( = ?auto_191903 ?auto_191905 ) ) ( not ( = ?auto_191904 ?auto_191905 ) ) ( ON-TABLE ?auto_191905 ) ( ON ?auto_191904 ?auto_191905 ) ( ON ?auto_191903 ?auto_191904 ) ( ON ?auto_191898 ?auto_191906 ) ( not ( = ?auto_191898 ?auto_191906 ) ) ( not ( = ?auto_191899 ?auto_191906 ) ) ( not ( = ?auto_191900 ?auto_191906 ) ) ( not ( = ?auto_191901 ?auto_191906 ) ) ( not ( = ?auto_191902 ?auto_191906 ) ) ( not ( = ?auto_191903 ?auto_191906 ) ) ( not ( = ?auto_191904 ?auto_191906 ) ) ( not ( = ?auto_191905 ?auto_191906 ) ) ( ON ?auto_191899 ?auto_191898 ) ( ON-TABLE ?auto_191906 ) ( ON ?auto_191900 ?auto_191899 ) ( ON ?auto_191901 ?auto_191900 ) ( CLEAR ?auto_191901 ) ( HOLDING ?auto_191902 ) ( CLEAR ?auto_191903 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191905 ?auto_191904 ?auto_191903 ?auto_191902 )
      ( MAKE-8PILE ?auto_191898 ?auto_191899 ?auto_191900 ?auto_191901 ?auto_191902 ?auto_191903 ?auto_191904 ?auto_191905 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191907 - BLOCK
      ?auto_191908 - BLOCK
      ?auto_191909 - BLOCK
      ?auto_191910 - BLOCK
      ?auto_191911 - BLOCK
      ?auto_191912 - BLOCK
      ?auto_191913 - BLOCK
      ?auto_191914 - BLOCK
    )
    :vars
    (
      ?auto_191915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191907 ?auto_191908 ) ) ( not ( = ?auto_191907 ?auto_191909 ) ) ( not ( = ?auto_191907 ?auto_191910 ) ) ( not ( = ?auto_191907 ?auto_191911 ) ) ( not ( = ?auto_191907 ?auto_191912 ) ) ( not ( = ?auto_191907 ?auto_191913 ) ) ( not ( = ?auto_191907 ?auto_191914 ) ) ( not ( = ?auto_191908 ?auto_191909 ) ) ( not ( = ?auto_191908 ?auto_191910 ) ) ( not ( = ?auto_191908 ?auto_191911 ) ) ( not ( = ?auto_191908 ?auto_191912 ) ) ( not ( = ?auto_191908 ?auto_191913 ) ) ( not ( = ?auto_191908 ?auto_191914 ) ) ( not ( = ?auto_191909 ?auto_191910 ) ) ( not ( = ?auto_191909 ?auto_191911 ) ) ( not ( = ?auto_191909 ?auto_191912 ) ) ( not ( = ?auto_191909 ?auto_191913 ) ) ( not ( = ?auto_191909 ?auto_191914 ) ) ( not ( = ?auto_191910 ?auto_191911 ) ) ( not ( = ?auto_191910 ?auto_191912 ) ) ( not ( = ?auto_191910 ?auto_191913 ) ) ( not ( = ?auto_191910 ?auto_191914 ) ) ( not ( = ?auto_191911 ?auto_191912 ) ) ( not ( = ?auto_191911 ?auto_191913 ) ) ( not ( = ?auto_191911 ?auto_191914 ) ) ( not ( = ?auto_191912 ?auto_191913 ) ) ( not ( = ?auto_191912 ?auto_191914 ) ) ( not ( = ?auto_191913 ?auto_191914 ) ) ( ON-TABLE ?auto_191914 ) ( ON ?auto_191913 ?auto_191914 ) ( ON ?auto_191912 ?auto_191913 ) ( ON ?auto_191907 ?auto_191915 ) ( not ( = ?auto_191907 ?auto_191915 ) ) ( not ( = ?auto_191908 ?auto_191915 ) ) ( not ( = ?auto_191909 ?auto_191915 ) ) ( not ( = ?auto_191910 ?auto_191915 ) ) ( not ( = ?auto_191911 ?auto_191915 ) ) ( not ( = ?auto_191912 ?auto_191915 ) ) ( not ( = ?auto_191913 ?auto_191915 ) ) ( not ( = ?auto_191914 ?auto_191915 ) ) ( ON ?auto_191908 ?auto_191907 ) ( ON-TABLE ?auto_191915 ) ( ON ?auto_191909 ?auto_191908 ) ( ON ?auto_191910 ?auto_191909 ) ( CLEAR ?auto_191912 ) ( ON ?auto_191911 ?auto_191910 ) ( CLEAR ?auto_191911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191915 ?auto_191907 ?auto_191908 ?auto_191909 ?auto_191910 )
      ( MAKE-8PILE ?auto_191907 ?auto_191908 ?auto_191909 ?auto_191910 ?auto_191911 ?auto_191912 ?auto_191913 ?auto_191914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191916 - BLOCK
      ?auto_191917 - BLOCK
      ?auto_191918 - BLOCK
      ?auto_191919 - BLOCK
      ?auto_191920 - BLOCK
      ?auto_191921 - BLOCK
      ?auto_191922 - BLOCK
      ?auto_191923 - BLOCK
    )
    :vars
    (
      ?auto_191924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191916 ?auto_191917 ) ) ( not ( = ?auto_191916 ?auto_191918 ) ) ( not ( = ?auto_191916 ?auto_191919 ) ) ( not ( = ?auto_191916 ?auto_191920 ) ) ( not ( = ?auto_191916 ?auto_191921 ) ) ( not ( = ?auto_191916 ?auto_191922 ) ) ( not ( = ?auto_191916 ?auto_191923 ) ) ( not ( = ?auto_191917 ?auto_191918 ) ) ( not ( = ?auto_191917 ?auto_191919 ) ) ( not ( = ?auto_191917 ?auto_191920 ) ) ( not ( = ?auto_191917 ?auto_191921 ) ) ( not ( = ?auto_191917 ?auto_191922 ) ) ( not ( = ?auto_191917 ?auto_191923 ) ) ( not ( = ?auto_191918 ?auto_191919 ) ) ( not ( = ?auto_191918 ?auto_191920 ) ) ( not ( = ?auto_191918 ?auto_191921 ) ) ( not ( = ?auto_191918 ?auto_191922 ) ) ( not ( = ?auto_191918 ?auto_191923 ) ) ( not ( = ?auto_191919 ?auto_191920 ) ) ( not ( = ?auto_191919 ?auto_191921 ) ) ( not ( = ?auto_191919 ?auto_191922 ) ) ( not ( = ?auto_191919 ?auto_191923 ) ) ( not ( = ?auto_191920 ?auto_191921 ) ) ( not ( = ?auto_191920 ?auto_191922 ) ) ( not ( = ?auto_191920 ?auto_191923 ) ) ( not ( = ?auto_191921 ?auto_191922 ) ) ( not ( = ?auto_191921 ?auto_191923 ) ) ( not ( = ?auto_191922 ?auto_191923 ) ) ( ON-TABLE ?auto_191923 ) ( ON ?auto_191922 ?auto_191923 ) ( ON ?auto_191916 ?auto_191924 ) ( not ( = ?auto_191916 ?auto_191924 ) ) ( not ( = ?auto_191917 ?auto_191924 ) ) ( not ( = ?auto_191918 ?auto_191924 ) ) ( not ( = ?auto_191919 ?auto_191924 ) ) ( not ( = ?auto_191920 ?auto_191924 ) ) ( not ( = ?auto_191921 ?auto_191924 ) ) ( not ( = ?auto_191922 ?auto_191924 ) ) ( not ( = ?auto_191923 ?auto_191924 ) ) ( ON ?auto_191917 ?auto_191916 ) ( ON-TABLE ?auto_191924 ) ( ON ?auto_191918 ?auto_191917 ) ( ON ?auto_191919 ?auto_191918 ) ( ON ?auto_191920 ?auto_191919 ) ( CLEAR ?auto_191920 ) ( HOLDING ?auto_191921 ) ( CLEAR ?auto_191922 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191923 ?auto_191922 ?auto_191921 )
      ( MAKE-8PILE ?auto_191916 ?auto_191917 ?auto_191918 ?auto_191919 ?auto_191920 ?auto_191921 ?auto_191922 ?auto_191923 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191925 - BLOCK
      ?auto_191926 - BLOCK
      ?auto_191927 - BLOCK
      ?auto_191928 - BLOCK
      ?auto_191929 - BLOCK
      ?auto_191930 - BLOCK
      ?auto_191931 - BLOCK
      ?auto_191932 - BLOCK
    )
    :vars
    (
      ?auto_191933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191925 ?auto_191926 ) ) ( not ( = ?auto_191925 ?auto_191927 ) ) ( not ( = ?auto_191925 ?auto_191928 ) ) ( not ( = ?auto_191925 ?auto_191929 ) ) ( not ( = ?auto_191925 ?auto_191930 ) ) ( not ( = ?auto_191925 ?auto_191931 ) ) ( not ( = ?auto_191925 ?auto_191932 ) ) ( not ( = ?auto_191926 ?auto_191927 ) ) ( not ( = ?auto_191926 ?auto_191928 ) ) ( not ( = ?auto_191926 ?auto_191929 ) ) ( not ( = ?auto_191926 ?auto_191930 ) ) ( not ( = ?auto_191926 ?auto_191931 ) ) ( not ( = ?auto_191926 ?auto_191932 ) ) ( not ( = ?auto_191927 ?auto_191928 ) ) ( not ( = ?auto_191927 ?auto_191929 ) ) ( not ( = ?auto_191927 ?auto_191930 ) ) ( not ( = ?auto_191927 ?auto_191931 ) ) ( not ( = ?auto_191927 ?auto_191932 ) ) ( not ( = ?auto_191928 ?auto_191929 ) ) ( not ( = ?auto_191928 ?auto_191930 ) ) ( not ( = ?auto_191928 ?auto_191931 ) ) ( not ( = ?auto_191928 ?auto_191932 ) ) ( not ( = ?auto_191929 ?auto_191930 ) ) ( not ( = ?auto_191929 ?auto_191931 ) ) ( not ( = ?auto_191929 ?auto_191932 ) ) ( not ( = ?auto_191930 ?auto_191931 ) ) ( not ( = ?auto_191930 ?auto_191932 ) ) ( not ( = ?auto_191931 ?auto_191932 ) ) ( ON-TABLE ?auto_191932 ) ( ON ?auto_191931 ?auto_191932 ) ( ON ?auto_191925 ?auto_191933 ) ( not ( = ?auto_191925 ?auto_191933 ) ) ( not ( = ?auto_191926 ?auto_191933 ) ) ( not ( = ?auto_191927 ?auto_191933 ) ) ( not ( = ?auto_191928 ?auto_191933 ) ) ( not ( = ?auto_191929 ?auto_191933 ) ) ( not ( = ?auto_191930 ?auto_191933 ) ) ( not ( = ?auto_191931 ?auto_191933 ) ) ( not ( = ?auto_191932 ?auto_191933 ) ) ( ON ?auto_191926 ?auto_191925 ) ( ON-TABLE ?auto_191933 ) ( ON ?auto_191927 ?auto_191926 ) ( ON ?auto_191928 ?auto_191927 ) ( ON ?auto_191929 ?auto_191928 ) ( CLEAR ?auto_191931 ) ( ON ?auto_191930 ?auto_191929 ) ( CLEAR ?auto_191930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191933 ?auto_191925 ?auto_191926 ?auto_191927 ?auto_191928 ?auto_191929 )
      ( MAKE-8PILE ?auto_191925 ?auto_191926 ?auto_191927 ?auto_191928 ?auto_191929 ?auto_191930 ?auto_191931 ?auto_191932 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191934 - BLOCK
      ?auto_191935 - BLOCK
      ?auto_191936 - BLOCK
      ?auto_191937 - BLOCK
      ?auto_191938 - BLOCK
      ?auto_191939 - BLOCK
      ?auto_191940 - BLOCK
      ?auto_191941 - BLOCK
    )
    :vars
    (
      ?auto_191942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191934 ?auto_191935 ) ) ( not ( = ?auto_191934 ?auto_191936 ) ) ( not ( = ?auto_191934 ?auto_191937 ) ) ( not ( = ?auto_191934 ?auto_191938 ) ) ( not ( = ?auto_191934 ?auto_191939 ) ) ( not ( = ?auto_191934 ?auto_191940 ) ) ( not ( = ?auto_191934 ?auto_191941 ) ) ( not ( = ?auto_191935 ?auto_191936 ) ) ( not ( = ?auto_191935 ?auto_191937 ) ) ( not ( = ?auto_191935 ?auto_191938 ) ) ( not ( = ?auto_191935 ?auto_191939 ) ) ( not ( = ?auto_191935 ?auto_191940 ) ) ( not ( = ?auto_191935 ?auto_191941 ) ) ( not ( = ?auto_191936 ?auto_191937 ) ) ( not ( = ?auto_191936 ?auto_191938 ) ) ( not ( = ?auto_191936 ?auto_191939 ) ) ( not ( = ?auto_191936 ?auto_191940 ) ) ( not ( = ?auto_191936 ?auto_191941 ) ) ( not ( = ?auto_191937 ?auto_191938 ) ) ( not ( = ?auto_191937 ?auto_191939 ) ) ( not ( = ?auto_191937 ?auto_191940 ) ) ( not ( = ?auto_191937 ?auto_191941 ) ) ( not ( = ?auto_191938 ?auto_191939 ) ) ( not ( = ?auto_191938 ?auto_191940 ) ) ( not ( = ?auto_191938 ?auto_191941 ) ) ( not ( = ?auto_191939 ?auto_191940 ) ) ( not ( = ?auto_191939 ?auto_191941 ) ) ( not ( = ?auto_191940 ?auto_191941 ) ) ( ON-TABLE ?auto_191941 ) ( ON ?auto_191934 ?auto_191942 ) ( not ( = ?auto_191934 ?auto_191942 ) ) ( not ( = ?auto_191935 ?auto_191942 ) ) ( not ( = ?auto_191936 ?auto_191942 ) ) ( not ( = ?auto_191937 ?auto_191942 ) ) ( not ( = ?auto_191938 ?auto_191942 ) ) ( not ( = ?auto_191939 ?auto_191942 ) ) ( not ( = ?auto_191940 ?auto_191942 ) ) ( not ( = ?auto_191941 ?auto_191942 ) ) ( ON ?auto_191935 ?auto_191934 ) ( ON-TABLE ?auto_191942 ) ( ON ?auto_191936 ?auto_191935 ) ( ON ?auto_191937 ?auto_191936 ) ( ON ?auto_191938 ?auto_191937 ) ( ON ?auto_191939 ?auto_191938 ) ( CLEAR ?auto_191939 ) ( HOLDING ?auto_191940 ) ( CLEAR ?auto_191941 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191941 ?auto_191940 )
      ( MAKE-8PILE ?auto_191934 ?auto_191935 ?auto_191936 ?auto_191937 ?auto_191938 ?auto_191939 ?auto_191940 ?auto_191941 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191943 - BLOCK
      ?auto_191944 - BLOCK
      ?auto_191945 - BLOCK
      ?auto_191946 - BLOCK
      ?auto_191947 - BLOCK
      ?auto_191948 - BLOCK
      ?auto_191949 - BLOCK
      ?auto_191950 - BLOCK
    )
    :vars
    (
      ?auto_191951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191943 ?auto_191944 ) ) ( not ( = ?auto_191943 ?auto_191945 ) ) ( not ( = ?auto_191943 ?auto_191946 ) ) ( not ( = ?auto_191943 ?auto_191947 ) ) ( not ( = ?auto_191943 ?auto_191948 ) ) ( not ( = ?auto_191943 ?auto_191949 ) ) ( not ( = ?auto_191943 ?auto_191950 ) ) ( not ( = ?auto_191944 ?auto_191945 ) ) ( not ( = ?auto_191944 ?auto_191946 ) ) ( not ( = ?auto_191944 ?auto_191947 ) ) ( not ( = ?auto_191944 ?auto_191948 ) ) ( not ( = ?auto_191944 ?auto_191949 ) ) ( not ( = ?auto_191944 ?auto_191950 ) ) ( not ( = ?auto_191945 ?auto_191946 ) ) ( not ( = ?auto_191945 ?auto_191947 ) ) ( not ( = ?auto_191945 ?auto_191948 ) ) ( not ( = ?auto_191945 ?auto_191949 ) ) ( not ( = ?auto_191945 ?auto_191950 ) ) ( not ( = ?auto_191946 ?auto_191947 ) ) ( not ( = ?auto_191946 ?auto_191948 ) ) ( not ( = ?auto_191946 ?auto_191949 ) ) ( not ( = ?auto_191946 ?auto_191950 ) ) ( not ( = ?auto_191947 ?auto_191948 ) ) ( not ( = ?auto_191947 ?auto_191949 ) ) ( not ( = ?auto_191947 ?auto_191950 ) ) ( not ( = ?auto_191948 ?auto_191949 ) ) ( not ( = ?auto_191948 ?auto_191950 ) ) ( not ( = ?auto_191949 ?auto_191950 ) ) ( ON-TABLE ?auto_191950 ) ( ON ?auto_191943 ?auto_191951 ) ( not ( = ?auto_191943 ?auto_191951 ) ) ( not ( = ?auto_191944 ?auto_191951 ) ) ( not ( = ?auto_191945 ?auto_191951 ) ) ( not ( = ?auto_191946 ?auto_191951 ) ) ( not ( = ?auto_191947 ?auto_191951 ) ) ( not ( = ?auto_191948 ?auto_191951 ) ) ( not ( = ?auto_191949 ?auto_191951 ) ) ( not ( = ?auto_191950 ?auto_191951 ) ) ( ON ?auto_191944 ?auto_191943 ) ( ON-TABLE ?auto_191951 ) ( ON ?auto_191945 ?auto_191944 ) ( ON ?auto_191946 ?auto_191945 ) ( ON ?auto_191947 ?auto_191946 ) ( ON ?auto_191948 ?auto_191947 ) ( CLEAR ?auto_191950 ) ( ON ?auto_191949 ?auto_191948 ) ( CLEAR ?auto_191949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191951 ?auto_191943 ?auto_191944 ?auto_191945 ?auto_191946 ?auto_191947 ?auto_191948 )
      ( MAKE-8PILE ?auto_191943 ?auto_191944 ?auto_191945 ?auto_191946 ?auto_191947 ?auto_191948 ?auto_191949 ?auto_191950 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191952 - BLOCK
      ?auto_191953 - BLOCK
      ?auto_191954 - BLOCK
      ?auto_191955 - BLOCK
      ?auto_191956 - BLOCK
      ?auto_191957 - BLOCK
      ?auto_191958 - BLOCK
      ?auto_191959 - BLOCK
    )
    :vars
    (
      ?auto_191960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191952 ?auto_191953 ) ) ( not ( = ?auto_191952 ?auto_191954 ) ) ( not ( = ?auto_191952 ?auto_191955 ) ) ( not ( = ?auto_191952 ?auto_191956 ) ) ( not ( = ?auto_191952 ?auto_191957 ) ) ( not ( = ?auto_191952 ?auto_191958 ) ) ( not ( = ?auto_191952 ?auto_191959 ) ) ( not ( = ?auto_191953 ?auto_191954 ) ) ( not ( = ?auto_191953 ?auto_191955 ) ) ( not ( = ?auto_191953 ?auto_191956 ) ) ( not ( = ?auto_191953 ?auto_191957 ) ) ( not ( = ?auto_191953 ?auto_191958 ) ) ( not ( = ?auto_191953 ?auto_191959 ) ) ( not ( = ?auto_191954 ?auto_191955 ) ) ( not ( = ?auto_191954 ?auto_191956 ) ) ( not ( = ?auto_191954 ?auto_191957 ) ) ( not ( = ?auto_191954 ?auto_191958 ) ) ( not ( = ?auto_191954 ?auto_191959 ) ) ( not ( = ?auto_191955 ?auto_191956 ) ) ( not ( = ?auto_191955 ?auto_191957 ) ) ( not ( = ?auto_191955 ?auto_191958 ) ) ( not ( = ?auto_191955 ?auto_191959 ) ) ( not ( = ?auto_191956 ?auto_191957 ) ) ( not ( = ?auto_191956 ?auto_191958 ) ) ( not ( = ?auto_191956 ?auto_191959 ) ) ( not ( = ?auto_191957 ?auto_191958 ) ) ( not ( = ?auto_191957 ?auto_191959 ) ) ( not ( = ?auto_191958 ?auto_191959 ) ) ( ON ?auto_191952 ?auto_191960 ) ( not ( = ?auto_191952 ?auto_191960 ) ) ( not ( = ?auto_191953 ?auto_191960 ) ) ( not ( = ?auto_191954 ?auto_191960 ) ) ( not ( = ?auto_191955 ?auto_191960 ) ) ( not ( = ?auto_191956 ?auto_191960 ) ) ( not ( = ?auto_191957 ?auto_191960 ) ) ( not ( = ?auto_191958 ?auto_191960 ) ) ( not ( = ?auto_191959 ?auto_191960 ) ) ( ON ?auto_191953 ?auto_191952 ) ( ON-TABLE ?auto_191960 ) ( ON ?auto_191954 ?auto_191953 ) ( ON ?auto_191955 ?auto_191954 ) ( ON ?auto_191956 ?auto_191955 ) ( ON ?auto_191957 ?auto_191956 ) ( ON ?auto_191958 ?auto_191957 ) ( CLEAR ?auto_191958 ) ( HOLDING ?auto_191959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191959 )
      ( MAKE-8PILE ?auto_191952 ?auto_191953 ?auto_191954 ?auto_191955 ?auto_191956 ?auto_191957 ?auto_191958 ?auto_191959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_191961 - BLOCK
      ?auto_191962 - BLOCK
      ?auto_191963 - BLOCK
      ?auto_191964 - BLOCK
      ?auto_191965 - BLOCK
      ?auto_191966 - BLOCK
      ?auto_191967 - BLOCK
      ?auto_191968 - BLOCK
    )
    :vars
    (
      ?auto_191969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191961 ?auto_191962 ) ) ( not ( = ?auto_191961 ?auto_191963 ) ) ( not ( = ?auto_191961 ?auto_191964 ) ) ( not ( = ?auto_191961 ?auto_191965 ) ) ( not ( = ?auto_191961 ?auto_191966 ) ) ( not ( = ?auto_191961 ?auto_191967 ) ) ( not ( = ?auto_191961 ?auto_191968 ) ) ( not ( = ?auto_191962 ?auto_191963 ) ) ( not ( = ?auto_191962 ?auto_191964 ) ) ( not ( = ?auto_191962 ?auto_191965 ) ) ( not ( = ?auto_191962 ?auto_191966 ) ) ( not ( = ?auto_191962 ?auto_191967 ) ) ( not ( = ?auto_191962 ?auto_191968 ) ) ( not ( = ?auto_191963 ?auto_191964 ) ) ( not ( = ?auto_191963 ?auto_191965 ) ) ( not ( = ?auto_191963 ?auto_191966 ) ) ( not ( = ?auto_191963 ?auto_191967 ) ) ( not ( = ?auto_191963 ?auto_191968 ) ) ( not ( = ?auto_191964 ?auto_191965 ) ) ( not ( = ?auto_191964 ?auto_191966 ) ) ( not ( = ?auto_191964 ?auto_191967 ) ) ( not ( = ?auto_191964 ?auto_191968 ) ) ( not ( = ?auto_191965 ?auto_191966 ) ) ( not ( = ?auto_191965 ?auto_191967 ) ) ( not ( = ?auto_191965 ?auto_191968 ) ) ( not ( = ?auto_191966 ?auto_191967 ) ) ( not ( = ?auto_191966 ?auto_191968 ) ) ( not ( = ?auto_191967 ?auto_191968 ) ) ( ON ?auto_191961 ?auto_191969 ) ( not ( = ?auto_191961 ?auto_191969 ) ) ( not ( = ?auto_191962 ?auto_191969 ) ) ( not ( = ?auto_191963 ?auto_191969 ) ) ( not ( = ?auto_191964 ?auto_191969 ) ) ( not ( = ?auto_191965 ?auto_191969 ) ) ( not ( = ?auto_191966 ?auto_191969 ) ) ( not ( = ?auto_191967 ?auto_191969 ) ) ( not ( = ?auto_191968 ?auto_191969 ) ) ( ON ?auto_191962 ?auto_191961 ) ( ON-TABLE ?auto_191969 ) ( ON ?auto_191963 ?auto_191962 ) ( ON ?auto_191964 ?auto_191963 ) ( ON ?auto_191965 ?auto_191964 ) ( ON ?auto_191966 ?auto_191965 ) ( ON ?auto_191967 ?auto_191966 ) ( ON ?auto_191968 ?auto_191967 ) ( CLEAR ?auto_191968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191969 ?auto_191961 ?auto_191962 ?auto_191963 ?auto_191964 ?auto_191965 ?auto_191966 ?auto_191967 )
      ( MAKE-8PILE ?auto_191961 ?auto_191962 ?auto_191963 ?auto_191964 ?auto_191965 ?auto_191966 ?auto_191967 ?auto_191968 ) )
  )

)

