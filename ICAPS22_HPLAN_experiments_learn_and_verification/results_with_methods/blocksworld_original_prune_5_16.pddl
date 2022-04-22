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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30757 - BLOCK
      ?auto_30758 - BLOCK
      ?auto_30759 - BLOCK
      ?auto_30760 - BLOCK
      ?auto_30761 - BLOCK
    )
    :vars
    (
      ?auto_30762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30762 ?auto_30761 ) ( CLEAR ?auto_30762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30757 ) ( ON ?auto_30758 ?auto_30757 ) ( ON ?auto_30759 ?auto_30758 ) ( ON ?auto_30760 ?auto_30759 ) ( ON ?auto_30761 ?auto_30760 ) ( not ( = ?auto_30757 ?auto_30758 ) ) ( not ( = ?auto_30757 ?auto_30759 ) ) ( not ( = ?auto_30757 ?auto_30760 ) ) ( not ( = ?auto_30757 ?auto_30761 ) ) ( not ( = ?auto_30757 ?auto_30762 ) ) ( not ( = ?auto_30758 ?auto_30759 ) ) ( not ( = ?auto_30758 ?auto_30760 ) ) ( not ( = ?auto_30758 ?auto_30761 ) ) ( not ( = ?auto_30758 ?auto_30762 ) ) ( not ( = ?auto_30759 ?auto_30760 ) ) ( not ( = ?auto_30759 ?auto_30761 ) ) ( not ( = ?auto_30759 ?auto_30762 ) ) ( not ( = ?auto_30760 ?auto_30761 ) ) ( not ( = ?auto_30760 ?auto_30762 ) ) ( not ( = ?auto_30761 ?auto_30762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30762 ?auto_30761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30764 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30764 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_30764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30765 - BLOCK
    )
    :vars
    (
      ?auto_30766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30765 ?auto_30766 ) ( CLEAR ?auto_30765 ) ( HAND-EMPTY ) ( not ( = ?auto_30765 ?auto_30766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30765 ?auto_30766 )
      ( MAKE-1PILE ?auto_30765 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30771 - BLOCK
      ?auto_30772 - BLOCK
      ?auto_30773 - BLOCK
      ?auto_30774 - BLOCK
    )
    :vars
    (
      ?auto_30775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30775 ?auto_30774 ) ( CLEAR ?auto_30775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30771 ) ( ON ?auto_30772 ?auto_30771 ) ( ON ?auto_30773 ?auto_30772 ) ( ON ?auto_30774 ?auto_30773 ) ( not ( = ?auto_30771 ?auto_30772 ) ) ( not ( = ?auto_30771 ?auto_30773 ) ) ( not ( = ?auto_30771 ?auto_30774 ) ) ( not ( = ?auto_30771 ?auto_30775 ) ) ( not ( = ?auto_30772 ?auto_30773 ) ) ( not ( = ?auto_30772 ?auto_30774 ) ) ( not ( = ?auto_30772 ?auto_30775 ) ) ( not ( = ?auto_30773 ?auto_30774 ) ) ( not ( = ?auto_30773 ?auto_30775 ) ) ( not ( = ?auto_30774 ?auto_30775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30775 ?auto_30774 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30776 - BLOCK
      ?auto_30777 - BLOCK
      ?auto_30778 - BLOCK
      ?auto_30779 - BLOCK
    )
    :vars
    (
      ?auto_30780 - BLOCK
      ?auto_30781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30780 ?auto_30779 ) ( CLEAR ?auto_30780 ) ( ON-TABLE ?auto_30776 ) ( ON ?auto_30777 ?auto_30776 ) ( ON ?auto_30778 ?auto_30777 ) ( ON ?auto_30779 ?auto_30778 ) ( not ( = ?auto_30776 ?auto_30777 ) ) ( not ( = ?auto_30776 ?auto_30778 ) ) ( not ( = ?auto_30776 ?auto_30779 ) ) ( not ( = ?auto_30776 ?auto_30780 ) ) ( not ( = ?auto_30777 ?auto_30778 ) ) ( not ( = ?auto_30777 ?auto_30779 ) ) ( not ( = ?auto_30777 ?auto_30780 ) ) ( not ( = ?auto_30778 ?auto_30779 ) ) ( not ( = ?auto_30778 ?auto_30780 ) ) ( not ( = ?auto_30779 ?auto_30780 ) ) ( HOLDING ?auto_30781 ) ( not ( = ?auto_30776 ?auto_30781 ) ) ( not ( = ?auto_30777 ?auto_30781 ) ) ( not ( = ?auto_30778 ?auto_30781 ) ) ( not ( = ?auto_30779 ?auto_30781 ) ) ( not ( = ?auto_30780 ?auto_30781 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_30781 )
      ( MAKE-4PILE ?auto_30776 ?auto_30777 ?auto_30778 ?auto_30779 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30782 - BLOCK
      ?auto_30783 - BLOCK
      ?auto_30784 - BLOCK
      ?auto_30785 - BLOCK
    )
    :vars
    (
      ?auto_30786 - BLOCK
      ?auto_30787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30786 ?auto_30785 ) ( ON-TABLE ?auto_30782 ) ( ON ?auto_30783 ?auto_30782 ) ( ON ?auto_30784 ?auto_30783 ) ( ON ?auto_30785 ?auto_30784 ) ( not ( = ?auto_30782 ?auto_30783 ) ) ( not ( = ?auto_30782 ?auto_30784 ) ) ( not ( = ?auto_30782 ?auto_30785 ) ) ( not ( = ?auto_30782 ?auto_30786 ) ) ( not ( = ?auto_30783 ?auto_30784 ) ) ( not ( = ?auto_30783 ?auto_30785 ) ) ( not ( = ?auto_30783 ?auto_30786 ) ) ( not ( = ?auto_30784 ?auto_30785 ) ) ( not ( = ?auto_30784 ?auto_30786 ) ) ( not ( = ?auto_30785 ?auto_30786 ) ) ( not ( = ?auto_30782 ?auto_30787 ) ) ( not ( = ?auto_30783 ?auto_30787 ) ) ( not ( = ?auto_30784 ?auto_30787 ) ) ( not ( = ?auto_30785 ?auto_30787 ) ) ( not ( = ?auto_30786 ?auto_30787 ) ) ( ON ?auto_30787 ?auto_30786 ) ( CLEAR ?auto_30787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30782 ?auto_30783 ?auto_30784 ?auto_30785 ?auto_30786 )
      ( MAKE-4PILE ?auto_30782 ?auto_30783 ?auto_30784 ?auto_30785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30790 - BLOCK
      ?auto_30791 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30791 ) ( CLEAR ?auto_30790 ) ( ON-TABLE ?auto_30790 ) ( not ( = ?auto_30790 ?auto_30791 ) ) )
    :subtasks
    ( ( !STACK ?auto_30791 ?auto_30790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30792 - BLOCK
      ?auto_30793 - BLOCK
    )
    :vars
    (
      ?auto_30794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30792 ) ( ON-TABLE ?auto_30792 ) ( not ( = ?auto_30792 ?auto_30793 ) ) ( ON ?auto_30793 ?auto_30794 ) ( CLEAR ?auto_30793 ) ( HAND-EMPTY ) ( not ( = ?auto_30792 ?auto_30794 ) ) ( not ( = ?auto_30793 ?auto_30794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30793 ?auto_30794 )
      ( MAKE-2PILE ?auto_30792 ?auto_30793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30795 - BLOCK
      ?auto_30796 - BLOCK
    )
    :vars
    (
      ?auto_30797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30795 ?auto_30796 ) ) ( ON ?auto_30796 ?auto_30797 ) ( CLEAR ?auto_30796 ) ( not ( = ?auto_30795 ?auto_30797 ) ) ( not ( = ?auto_30796 ?auto_30797 ) ) ( HOLDING ?auto_30795 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30795 )
      ( MAKE-2PILE ?auto_30795 ?auto_30796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30798 - BLOCK
      ?auto_30799 - BLOCK
    )
    :vars
    (
      ?auto_30800 - BLOCK
      ?auto_30801 - BLOCK
      ?auto_30803 - BLOCK
      ?auto_30802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30798 ?auto_30799 ) ) ( ON ?auto_30799 ?auto_30800 ) ( not ( = ?auto_30798 ?auto_30800 ) ) ( not ( = ?auto_30799 ?auto_30800 ) ) ( ON ?auto_30798 ?auto_30799 ) ( CLEAR ?auto_30798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30801 ) ( ON ?auto_30803 ?auto_30801 ) ( ON ?auto_30802 ?auto_30803 ) ( ON ?auto_30800 ?auto_30802 ) ( not ( = ?auto_30801 ?auto_30803 ) ) ( not ( = ?auto_30801 ?auto_30802 ) ) ( not ( = ?auto_30801 ?auto_30800 ) ) ( not ( = ?auto_30801 ?auto_30799 ) ) ( not ( = ?auto_30801 ?auto_30798 ) ) ( not ( = ?auto_30803 ?auto_30802 ) ) ( not ( = ?auto_30803 ?auto_30800 ) ) ( not ( = ?auto_30803 ?auto_30799 ) ) ( not ( = ?auto_30803 ?auto_30798 ) ) ( not ( = ?auto_30802 ?auto_30800 ) ) ( not ( = ?auto_30802 ?auto_30799 ) ) ( not ( = ?auto_30802 ?auto_30798 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30801 ?auto_30803 ?auto_30802 ?auto_30800 ?auto_30799 )
      ( MAKE-2PILE ?auto_30798 ?auto_30799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30807 - BLOCK
      ?auto_30808 - BLOCK
      ?auto_30809 - BLOCK
    )
    :vars
    (
      ?auto_30810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30810 ?auto_30809 ) ( CLEAR ?auto_30810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30807 ) ( ON ?auto_30808 ?auto_30807 ) ( ON ?auto_30809 ?auto_30808 ) ( not ( = ?auto_30807 ?auto_30808 ) ) ( not ( = ?auto_30807 ?auto_30809 ) ) ( not ( = ?auto_30807 ?auto_30810 ) ) ( not ( = ?auto_30808 ?auto_30809 ) ) ( not ( = ?auto_30808 ?auto_30810 ) ) ( not ( = ?auto_30809 ?auto_30810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30810 ?auto_30809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30811 - BLOCK
      ?auto_30812 - BLOCK
      ?auto_30813 - BLOCK
    )
    :vars
    (
      ?auto_30814 - BLOCK
      ?auto_30815 - BLOCK
      ?auto_30816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30814 ?auto_30813 ) ( CLEAR ?auto_30814 ) ( ON-TABLE ?auto_30811 ) ( ON ?auto_30812 ?auto_30811 ) ( ON ?auto_30813 ?auto_30812 ) ( not ( = ?auto_30811 ?auto_30812 ) ) ( not ( = ?auto_30811 ?auto_30813 ) ) ( not ( = ?auto_30811 ?auto_30814 ) ) ( not ( = ?auto_30812 ?auto_30813 ) ) ( not ( = ?auto_30812 ?auto_30814 ) ) ( not ( = ?auto_30813 ?auto_30814 ) ) ( HOLDING ?auto_30815 ) ( CLEAR ?auto_30816 ) ( not ( = ?auto_30811 ?auto_30815 ) ) ( not ( = ?auto_30811 ?auto_30816 ) ) ( not ( = ?auto_30812 ?auto_30815 ) ) ( not ( = ?auto_30812 ?auto_30816 ) ) ( not ( = ?auto_30813 ?auto_30815 ) ) ( not ( = ?auto_30813 ?auto_30816 ) ) ( not ( = ?auto_30814 ?auto_30815 ) ) ( not ( = ?auto_30814 ?auto_30816 ) ) ( not ( = ?auto_30815 ?auto_30816 ) ) )
    :subtasks
    ( ( !STACK ?auto_30815 ?auto_30816 )
      ( MAKE-3PILE ?auto_30811 ?auto_30812 ?auto_30813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31179 - BLOCK
      ?auto_31180 - BLOCK
      ?auto_31181 - BLOCK
    )
    :vars
    (
      ?auto_31183 - BLOCK
      ?auto_31182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31183 ?auto_31181 ) ( ON-TABLE ?auto_31179 ) ( ON ?auto_31180 ?auto_31179 ) ( ON ?auto_31181 ?auto_31180 ) ( not ( = ?auto_31179 ?auto_31180 ) ) ( not ( = ?auto_31179 ?auto_31181 ) ) ( not ( = ?auto_31179 ?auto_31183 ) ) ( not ( = ?auto_31180 ?auto_31181 ) ) ( not ( = ?auto_31180 ?auto_31183 ) ) ( not ( = ?auto_31181 ?auto_31183 ) ) ( not ( = ?auto_31179 ?auto_31182 ) ) ( not ( = ?auto_31180 ?auto_31182 ) ) ( not ( = ?auto_31181 ?auto_31182 ) ) ( not ( = ?auto_31183 ?auto_31182 ) ) ( ON ?auto_31182 ?auto_31183 ) ( CLEAR ?auto_31182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31179 ?auto_31180 ?auto_31181 ?auto_31183 )
      ( MAKE-3PILE ?auto_31179 ?auto_31180 ?auto_31181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30823 - BLOCK
      ?auto_30824 - BLOCK
      ?auto_30825 - BLOCK
    )
    :vars
    (
      ?auto_30828 - BLOCK
      ?auto_30826 - BLOCK
      ?auto_30827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30828 ?auto_30825 ) ( ON-TABLE ?auto_30823 ) ( ON ?auto_30824 ?auto_30823 ) ( ON ?auto_30825 ?auto_30824 ) ( not ( = ?auto_30823 ?auto_30824 ) ) ( not ( = ?auto_30823 ?auto_30825 ) ) ( not ( = ?auto_30823 ?auto_30828 ) ) ( not ( = ?auto_30824 ?auto_30825 ) ) ( not ( = ?auto_30824 ?auto_30828 ) ) ( not ( = ?auto_30825 ?auto_30828 ) ) ( not ( = ?auto_30823 ?auto_30826 ) ) ( not ( = ?auto_30823 ?auto_30827 ) ) ( not ( = ?auto_30824 ?auto_30826 ) ) ( not ( = ?auto_30824 ?auto_30827 ) ) ( not ( = ?auto_30825 ?auto_30826 ) ) ( not ( = ?auto_30825 ?auto_30827 ) ) ( not ( = ?auto_30828 ?auto_30826 ) ) ( not ( = ?auto_30828 ?auto_30827 ) ) ( not ( = ?auto_30826 ?auto_30827 ) ) ( ON ?auto_30826 ?auto_30828 ) ( CLEAR ?auto_30826 ) ( HOLDING ?auto_30827 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30827 )
      ( MAKE-3PILE ?auto_30823 ?auto_30824 ?auto_30825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30829 - BLOCK
      ?auto_30830 - BLOCK
      ?auto_30831 - BLOCK
    )
    :vars
    (
      ?auto_30834 - BLOCK
      ?auto_30833 - BLOCK
      ?auto_30832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30834 ?auto_30831 ) ( ON-TABLE ?auto_30829 ) ( ON ?auto_30830 ?auto_30829 ) ( ON ?auto_30831 ?auto_30830 ) ( not ( = ?auto_30829 ?auto_30830 ) ) ( not ( = ?auto_30829 ?auto_30831 ) ) ( not ( = ?auto_30829 ?auto_30834 ) ) ( not ( = ?auto_30830 ?auto_30831 ) ) ( not ( = ?auto_30830 ?auto_30834 ) ) ( not ( = ?auto_30831 ?auto_30834 ) ) ( not ( = ?auto_30829 ?auto_30833 ) ) ( not ( = ?auto_30829 ?auto_30832 ) ) ( not ( = ?auto_30830 ?auto_30833 ) ) ( not ( = ?auto_30830 ?auto_30832 ) ) ( not ( = ?auto_30831 ?auto_30833 ) ) ( not ( = ?auto_30831 ?auto_30832 ) ) ( not ( = ?auto_30834 ?auto_30833 ) ) ( not ( = ?auto_30834 ?auto_30832 ) ) ( not ( = ?auto_30833 ?auto_30832 ) ) ( ON ?auto_30833 ?auto_30834 ) ( ON ?auto_30832 ?auto_30833 ) ( CLEAR ?auto_30832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30829 ?auto_30830 ?auto_30831 ?auto_30834 ?auto_30833 )
      ( MAKE-3PILE ?auto_30829 ?auto_30830 ?auto_30831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30838 - BLOCK
      ?auto_30839 - BLOCK
      ?auto_30840 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30840 ) ( CLEAR ?auto_30839 ) ( ON-TABLE ?auto_30838 ) ( ON ?auto_30839 ?auto_30838 ) ( not ( = ?auto_30838 ?auto_30839 ) ) ( not ( = ?auto_30838 ?auto_30840 ) ) ( not ( = ?auto_30839 ?auto_30840 ) ) )
    :subtasks
    ( ( !STACK ?auto_30840 ?auto_30839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30841 - BLOCK
      ?auto_30842 - BLOCK
      ?auto_30843 - BLOCK
    )
    :vars
    (
      ?auto_30844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30842 ) ( ON-TABLE ?auto_30841 ) ( ON ?auto_30842 ?auto_30841 ) ( not ( = ?auto_30841 ?auto_30842 ) ) ( not ( = ?auto_30841 ?auto_30843 ) ) ( not ( = ?auto_30842 ?auto_30843 ) ) ( ON ?auto_30843 ?auto_30844 ) ( CLEAR ?auto_30843 ) ( HAND-EMPTY ) ( not ( = ?auto_30841 ?auto_30844 ) ) ( not ( = ?auto_30842 ?auto_30844 ) ) ( not ( = ?auto_30843 ?auto_30844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30843 ?auto_30844 )
      ( MAKE-3PILE ?auto_30841 ?auto_30842 ?auto_30843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30845 - BLOCK
      ?auto_30846 - BLOCK
      ?auto_30847 - BLOCK
    )
    :vars
    (
      ?auto_30848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30845 ) ( not ( = ?auto_30845 ?auto_30846 ) ) ( not ( = ?auto_30845 ?auto_30847 ) ) ( not ( = ?auto_30846 ?auto_30847 ) ) ( ON ?auto_30847 ?auto_30848 ) ( CLEAR ?auto_30847 ) ( not ( = ?auto_30845 ?auto_30848 ) ) ( not ( = ?auto_30846 ?auto_30848 ) ) ( not ( = ?auto_30847 ?auto_30848 ) ) ( HOLDING ?auto_30846 ) ( CLEAR ?auto_30845 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30845 ?auto_30846 )
      ( MAKE-3PILE ?auto_30845 ?auto_30846 ?auto_30847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30849 - BLOCK
      ?auto_30850 - BLOCK
      ?auto_30851 - BLOCK
    )
    :vars
    (
      ?auto_30852 - BLOCK
      ?auto_30854 - BLOCK
      ?auto_30853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30849 ) ( not ( = ?auto_30849 ?auto_30850 ) ) ( not ( = ?auto_30849 ?auto_30851 ) ) ( not ( = ?auto_30850 ?auto_30851 ) ) ( ON ?auto_30851 ?auto_30852 ) ( not ( = ?auto_30849 ?auto_30852 ) ) ( not ( = ?auto_30850 ?auto_30852 ) ) ( not ( = ?auto_30851 ?auto_30852 ) ) ( CLEAR ?auto_30849 ) ( ON ?auto_30850 ?auto_30851 ) ( CLEAR ?auto_30850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30854 ) ( ON ?auto_30853 ?auto_30854 ) ( ON ?auto_30852 ?auto_30853 ) ( not ( = ?auto_30854 ?auto_30853 ) ) ( not ( = ?auto_30854 ?auto_30852 ) ) ( not ( = ?auto_30854 ?auto_30851 ) ) ( not ( = ?auto_30854 ?auto_30850 ) ) ( not ( = ?auto_30853 ?auto_30852 ) ) ( not ( = ?auto_30853 ?auto_30851 ) ) ( not ( = ?auto_30853 ?auto_30850 ) ) ( not ( = ?auto_30849 ?auto_30854 ) ) ( not ( = ?auto_30849 ?auto_30853 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30854 ?auto_30853 ?auto_30852 ?auto_30851 )
      ( MAKE-3PILE ?auto_30849 ?auto_30850 ?auto_30851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30855 - BLOCK
      ?auto_30856 - BLOCK
      ?auto_30857 - BLOCK
    )
    :vars
    (
      ?auto_30858 - BLOCK
      ?auto_30860 - BLOCK
      ?auto_30859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30855 ?auto_30856 ) ) ( not ( = ?auto_30855 ?auto_30857 ) ) ( not ( = ?auto_30856 ?auto_30857 ) ) ( ON ?auto_30857 ?auto_30858 ) ( not ( = ?auto_30855 ?auto_30858 ) ) ( not ( = ?auto_30856 ?auto_30858 ) ) ( not ( = ?auto_30857 ?auto_30858 ) ) ( ON ?auto_30856 ?auto_30857 ) ( CLEAR ?auto_30856 ) ( ON-TABLE ?auto_30860 ) ( ON ?auto_30859 ?auto_30860 ) ( ON ?auto_30858 ?auto_30859 ) ( not ( = ?auto_30860 ?auto_30859 ) ) ( not ( = ?auto_30860 ?auto_30858 ) ) ( not ( = ?auto_30860 ?auto_30857 ) ) ( not ( = ?auto_30860 ?auto_30856 ) ) ( not ( = ?auto_30859 ?auto_30858 ) ) ( not ( = ?auto_30859 ?auto_30857 ) ) ( not ( = ?auto_30859 ?auto_30856 ) ) ( not ( = ?auto_30855 ?auto_30860 ) ) ( not ( = ?auto_30855 ?auto_30859 ) ) ( HOLDING ?auto_30855 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30855 )
      ( MAKE-3PILE ?auto_30855 ?auto_30856 ?auto_30857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30861 - BLOCK
      ?auto_30862 - BLOCK
      ?auto_30863 - BLOCK
    )
    :vars
    (
      ?auto_30866 - BLOCK
      ?auto_30865 - BLOCK
      ?auto_30864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30861 ?auto_30862 ) ) ( not ( = ?auto_30861 ?auto_30863 ) ) ( not ( = ?auto_30862 ?auto_30863 ) ) ( ON ?auto_30863 ?auto_30866 ) ( not ( = ?auto_30861 ?auto_30866 ) ) ( not ( = ?auto_30862 ?auto_30866 ) ) ( not ( = ?auto_30863 ?auto_30866 ) ) ( ON ?auto_30862 ?auto_30863 ) ( ON-TABLE ?auto_30865 ) ( ON ?auto_30864 ?auto_30865 ) ( ON ?auto_30866 ?auto_30864 ) ( not ( = ?auto_30865 ?auto_30864 ) ) ( not ( = ?auto_30865 ?auto_30866 ) ) ( not ( = ?auto_30865 ?auto_30863 ) ) ( not ( = ?auto_30865 ?auto_30862 ) ) ( not ( = ?auto_30864 ?auto_30866 ) ) ( not ( = ?auto_30864 ?auto_30863 ) ) ( not ( = ?auto_30864 ?auto_30862 ) ) ( not ( = ?auto_30861 ?auto_30865 ) ) ( not ( = ?auto_30861 ?auto_30864 ) ) ( ON ?auto_30861 ?auto_30862 ) ( CLEAR ?auto_30861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30865 ?auto_30864 ?auto_30866 ?auto_30863 ?auto_30862 )
      ( MAKE-3PILE ?auto_30861 ?auto_30862 ?auto_30863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30869 - BLOCK
      ?auto_30870 - BLOCK
    )
    :vars
    (
      ?auto_30871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30871 ?auto_30870 ) ( CLEAR ?auto_30871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30869 ) ( ON ?auto_30870 ?auto_30869 ) ( not ( = ?auto_30869 ?auto_30870 ) ) ( not ( = ?auto_30869 ?auto_30871 ) ) ( not ( = ?auto_30870 ?auto_30871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30871 ?auto_30870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30872 - BLOCK
      ?auto_30873 - BLOCK
    )
    :vars
    (
      ?auto_30874 - BLOCK
      ?auto_30875 - BLOCK
      ?auto_30876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30874 ?auto_30873 ) ( CLEAR ?auto_30874 ) ( ON-TABLE ?auto_30872 ) ( ON ?auto_30873 ?auto_30872 ) ( not ( = ?auto_30872 ?auto_30873 ) ) ( not ( = ?auto_30872 ?auto_30874 ) ) ( not ( = ?auto_30873 ?auto_30874 ) ) ( HOLDING ?auto_30875 ) ( CLEAR ?auto_30876 ) ( not ( = ?auto_30872 ?auto_30875 ) ) ( not ( = ?auto_30872 ?auto_30876 ) ) ( not ( = ?auto_30873 ?auto_30875 ) ) ( not ( = ?auto_30873 ?auto_30876 ) ) ( not ( = ?auto_30874 ?auto_30875 ) ) ( not ( = ?auto_30874 ?auto_30876 ) ) ( not ( = ?auto_30875 ?auto_30876 ) ) )
    :subtasks
    ( ( !STACK ?auto_30875 ?auto_30876 )
      ( MAKE-2PILE ?auto_30872 ?auto_30873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30877 - BLOCK
      ?auto_30878 - BLOCK
    )
    :vars
    (
      ?auto_30880 - BLOCK
      ?auto_30881 - BLOCK
      ?auto_30879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30880 ?auto_30878 ) ( ON-TABLE ?auto_30877 ) ( ON ?auto_30878 ?auto_30877 ) ( not ( = ?auto_30877 ?auto_30878 ) ) ( not ( = ?auto_30877 ?auto_30880 ) ) ( not ( = ?auto_30878 ?auto_30880 ) ) ( CLEAR ?auto_30881 ) ( not ( = ?auto_30877 ?auto_30879 ) ) ( not ( = ?auto_30877 ?auto_30881 ) ) ( not ( = ?auto_30878 ?auto_30879 ) ) ( not ( = ?auto_30878 ?auto_30881 ) ) ( not ( = ?auto_30880 ?auto_30879 ) ) ( not ( = ?auto_30880 ?auto_30881 ) ) ( not ( = ?auto_30879 ?auto_30881 ) ) ( ON ?auto_30879 ?auto_30880 ) ( CLEAR ?auto_30879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30877 ?auto_30878 ?auto_30880 )
      ( MAKE-2PILE ?auto_30877 ?auto_30878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30882 - BLOCK
      ?auto_30883 - BLOCK
    )
    :vars
    (
      ?auto_30885 - BLOCK
      ?auto_30886 - BLOCK
      ?auto_30884 - BLOCK
      ?auto_30887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30885 ?auto_30883 ) ( ON-TABLE ?auto_30882 ) ( ON ?auto_30883 ?auto_30882 ) ( not ( = ?auto_30882 ?auto_30883 ) ) ( not ( = ?auto_30882 ?auto_30885 ) ) ( not ( = ?auto_30883 ?auto_30885 ) ) ( not ( = ?auto_30882 ?auto_30886 ) ) ( not ( = ?auto_30882 ?auto_30884 ) ) ( not ( = ?auto_30883 ?auto_30886 ) ) ( not ( = ?auto_30883 ?auto_30884 ) ) ( not ( = ?auto_30885 ?auto_30886 ) ) ( not ( = ?auto_30885 ?auto_30884 ) ) ( not ( = ?auto_30886 ?auto_30884 ) ) ( ON ?auto_30886 ?auto_30885 ) ( CLEAR ?auto_30886 ) ( HOLDING ?auto_30884 ) ( CLEAR ?auto_30887 ) ( ON-TABLE ?auto_30887 ) ( not ( = ?auto_30887 ?auto_30884 ) ) ( not ( = ?auto_30882 ?auto_30887 ) ) ( not ( = ?auto_30883 ?auto_30887 ) ) ( not ( = ?auto_30885 ?auto_30887 ) ) ( not ( = ?auto_30886 ?auto_30887 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30887 ?auto_30884 )
      ( MAKE-2PILE ?auto_30882 ?auto_30883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31306 - BLOCK
      ?auto_31307 - BLOCK
    )
    :vars
    (
      ?auto_31309 - BLOCK
      ?auto_31308 - BLOCK
      ?auto_31310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31309 ?auto_31307 ) ( ON-TABLE ?auto_31306 ) ( ON ?auto_31307 ?auto_31306 ) ( not ( = ?auto_31306 ?auto_31307 ) ) ( not ( = ?auto_31306 ?auto_31309 ) ) ( not ( = ?auto_31307 ?auto_31309 ) ) ( not ( = ?auto_31306 ?auto_31308 ) ) ( not ( = ?auto_31306 ?auto_31310 ) ) ( not ( = ?auto_31307 ?auto_31308 ) ) ( not ( = ?auto_31307 ?auto_31310 ) ) ( not ( = ?auto_31309 ?auto_31308 ) ) ( not ( = ?auto_31309 ?auto_31310 ) ) ( not ( = ?auto_31308 ?auto_31310 ) ) ( ON ?auto_31308 ?auto_31309 ) ( ON ?auto_31310 ?auto_31308 ) ( CLEAR ?auto_31310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31306 ?auto_31307 ?auto_31309 ?auto_31308 )
      ( MAKE-2PILE ?auto_31306 ?auto_31307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30894 - BLOCK
      ?auto_30895 - BLOCK
    )
    :vars
    (
      ?auto_30898 - BLOCK
      ?auto_30899 - BLOCK
      ?auto_30897 - BLOCK
      ?auto_30896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30898 ?auto_30895 ) ( ON-TABLE ?auto_30894 ) ( ON ?auto_30895 ?auto_30894 ) ( not ( = ?auto_30894 ?auto_30895 ) ) ( not ( = ?auto_30894 ?auto_30898 ) ) ( not ( = ?auto_30895 ?auto_30898 ) ) ( not ( = ?auto_30894 ?auto_30899 ) ) ( not ( = ?auto_30894 ?auto_30897 ) ) ( not ( = ?auto_30895 ?auto_30899 ) ) ( not ( = ?auto_30895 ?auto_30897 ) ) ( not ( = ?auto_30898 ?auto_30899 ) ) ( not ( = ?auto_30898 ?auto_30897 ) ) ( not ( = ?auto_30899 ?auto_30897 ) ) ( ON ?auto_30899 ?auto_30898 ) ( not ( = ?auto_30896 ?auto_30897 ) ) ( not ( = ?auto_30894 ?auto_30896 ) ) ( not ( = ?auto_30895 ?auto_30896 ) ) ( not ( = ?auto_30898 ?auto_30896 ) ) ( not ( = ?auto_30899 ?auto_30896 ) ) ( ON ?auto_30897 ?auto_30899 ) ( CLEAR ?auto_30897 ) ( HOLDING ?auto_30896 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30896 )
      ( MAKE-2PILE ?auto_30894 ?auto_30895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30900 - BLOCK
      ?auto_30901 - BLOCK
    )
    :vars
    (
      ?auto_30904 - BLOCK
      ?auto_30903 - BLOCK
      ?auto_30902 - BLOCK
      ?auto_30905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30904 ?auto_30901 ) ( ON-TABLE ?auto_30900 ) ( ON ?auto_30901 ?auto_30900 ) ( not ( = ?auto_30900 ?auto_30901 ) ) ( not ( = ?auto_30900 ?auto_30904 ) ) ( not ( = ?auto_30901 ?auto_30904 ) ) ( not ( = ?auto_30900 ?auto_30903 ) ) ( not ( = ?auto_30900 ?auto_30902 ) ) ( not ( = ?auto_30901 ?auto_30903 ) ) ( not ( = ?auto_30901 ?auto_30902 ) ) ( not ( = ?auto_30904 ?auto_30903 ) ) ( not ( = ?auto_30904 ?auto_30902 ) ) ( not ( = ?auto_30903 ?auto_30902 ) ) ( ON ?auto_30903 ?auto_30904 ) ( not ( = ?auto_30905 ?auto_30902 ) ) ( not ( = ?auto_30900 ?auto_30905 ) ) ( not ( = ?auto_30901 ?auto_30905 ) ) ( not ( = ?auto_30904 ?auto_30905 ) ) ( not ( = ?auto_30903 ?auto_30905 ) ) ( ON ?auto_30902 ?auto_30903 ) ( ON ?auto_30905 ?auto_30902 ) ( CLEAR ?auto_30905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30900 ?auto_30901 ?auto_30904 ?auto_30903 ?auto_30902 )
      ( MAKE-2PILE ?auto_30900 ?auto_30901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30910 - BLOCK
      ?auto_30911 - BLOCK
      ?auto_30912 - BLOCK
      ?auto_30913 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30913 ) ( CLEAR ?auto_30912 ) ( ON-TABLE ?auto_30910 ) ( ON ?auto_30911 ?auto_30910 ) ( ON ?auto_30912 ?auto_30911 ) ( not ( = ?auto_30910 ?auto_30911 ) ) ( not ( = ?auto_30910 ?auto_30912 ) ) ( not ( = ?auto_30910 ?auto_30913 ) ) ( not ( = ?auto_30911 ?auto_30912 ) ) ( not ( = ?auto_30911 ?auto_30913 ) ) ( not ( = ?auto_30912 ?auto_30913 ) ) )
    :subtasks
    ( ( !STACK ?auto_30913 ?auto_30912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30914 - BLOCK
      ?auto_30915 - BLOCK
      ?auto_30916 - BLOCK
      ?auto_30917 - BLOCK
    )
    :vars
    (
      ?auto_30918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30916 ) ( ON-TABLE ?auto_30914 ) ( ON ?auto_30915 ?auto_30914 ) ( ON ?auto_30916 ?auto_30915 ) ( not ( = ?auto_30914 ?auto_30915 ) ) ( not ( = ?auto_30914 ?auto_30916 ) ) ( not ( = ?auto_30914 ?auto_30917 ) ) ( not ( = ?auto_30915 ?auto_30916 ) ) ( not ( = ?auto_30915 ?auto_30917 ) ) ( not ( = ?auto_30916 ?auto_30917 ) ) ( ON ?auto_30917 ?auto_30918 ) ( CLEAR ?auto_30917 ) ( HAND-EMPTY ) ( not ( = ?auto_30914 ?auto_30918 ) ) ( not ( = ?auto_30915 ?auto_30918 ) ) ( not ( = ?auto_30916 ?auto_30918 ) ) ( not ( = ?auto_30917 ?auto_30918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30917 ?auto_30918 )
      ( MAKE-4PILE ?auto_30914 ?auto_30915 ?auto_30916 ?auto_30917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30919 - BLOCK
      ?auto_30920 - BLOCK
      ?auto_30921 - BLOCK
      ?auto_30922 - BLOCK
    )
    :vars
    (
      ?auto_30923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30919 ) ( ON ?auto_30920 ?auto_30919 ) ( not ( = ?auto_30919 ?auto_30920 ) ) ( not ( = ?auto_30919 ?auto_30921 ) ) ( not ( = ?auto_30919 ?auto_30922 ) ) ( not ( = ?auto_30920 ?auto_30921 ) ) ( not ( = ?auto_30920 ?auto_30922 ) ) ( not ( = ?auto_30921 ?auto_30922 ) ) ( ON ?auto_30922 ?auto_30923 ) ( CLEAR ?auto_30922 ) ( not ( = ?auto_30919 ?auto_30923 ) ) ( not ( = ?auto_30920 ?auto_30923 ) ) ( not ( = ?auto_30921 ?auto_30923 ) ) ( not ( = ?auto_30922 ?auto_30923 ) ) ( HOLDING ?auto_30921 ) ( CLEAR ?auto_30920 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30919 ?auto_30920 ?auto_30921 )
      ( MAKE-4PILE ?auto_30919 ?auto_30920 ?auto_30921 ?auto_30922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30924 - BLOCK
      ?auto_30925 - BLOCK
      ?auto_30926 - BLOCK
      ?auto_30927 - BLOCK
    )
    :vars
    (
      ?auto_30928 - BLOCK
      ?auto_30929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30924 ) ( ON ?auto_30925 ?auto_30924 ) ( not ( = ?auto_30924 ?auto_30925 ) ) ( not ( = ?auto_30924 ?auto_30926 ) ) ( not ( = ?auto_30924 ?auto_30927 ) ) ( not ( = ?auto_30925 ?auto_30926 ) ) ( not ( = ?auto_30925 ?auto_30927 ) ) ( not ( = ?auto_30926 ?auto_30927 ) ) ( ON ?auto_30927 ?auto_30928 ) ( not ( = ?auto_30924 ?auto_30928 ) ) ( not ( = ?auto_30925 ?auto_30928 ) ) ( not ( = ?auto_30926 ?auto_30928 ) ) ( not ( = ?auto_30927 ?auto_30928 ) ) ( CLEAR ?auto_30925 ) ( ON ?auto_30926 ?auto_30927 ) ( CLEAR ?auto_30926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30929 ) ( ON ?auto_30928 ?auto_30929 ) ( not ( = ?auto_30929 ?auto_30928 ) ) ( not ( = ?auto_30929 ?auto_30927 ) ) ( not ( = ?auto_30929 ?auto_30926 ) ) ( not ( = ?auto_30924 ?auto_30929 ) ) ( not ( = ?auto_30925 ?auto_30929 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30929 ?auto_30928 ?auto_30927 )
      ( MAKE-4PILE ?auto_30924 ?auto_30925 ?auto_30926 ?auto_30927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30930 - BLOCK
      ?auto_30931 - BLOCK
      ?auto_30932 - BLOCK
      ?auto_30933 - BLOCK
    )
    :vars
    (
      ?auto_30934 - BLOCK
      ?auto_30935 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30930 ) ( not ( = ?auto_30930 ?auto_30931 ) ) ( not ( = ?auto_30930 ?auto_30932 ) ) ( not ( = ?auto_30930 ?auto_30933 ) ) ( not ( = ?auto_30931 ?auto_30932 ) ) ( not ( = ?auto_30931 ?auto_30933 ) ) ( not ( = ?auto_30932 ?auto_30933 ) ) ( ON ?auto_30933 ?auto_30934 ) ( not ( = ?auto_30930 ?auto_30934 ) ) ( not ( = ?auto_30931 ?auto_30934 ) ) ( not ( = ?auto_30932 ?auto_30934 ) ) ( not ( = ?auto_30933 ?auto_30934 ) ) ( ON ?auto_30932 ?auto_30933 ) ( CLEAR ?auto_30932 ) ( ON-TABLE ?auto_30935 ) ( ON ?auto_30934 ?auto_30935 ) ( not ( = ?auto_30935 ?auto_30934 ) ) ( not ( = ?auto_30935 ?auto_30933 ) ) ( not ( = ?auto_30935 ?auto_30932 ) ) ( not ( = ?auto_30930 ?auto_30935 ) ) ( not ( = ?auto_30931 ?auto_30935 ) ) ( HOLDING ?auto_30931 ) ( CLEAR ?auto_30930 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30930 ?auto_30931 )
      ( MAKE-4PILE ?auto_30930 ?auto_30931 ?auto_30932 ?auto_30933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30936 - BLOCK
      ?auto_30937 - BLOCK
      ?auto_30938 - BLOCK
      ?auto_30939 - BLOCK
    )
    :vars
    (
      ?auto_30941 - BLOCK
      ?auto_30940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30936 ) ( not ( = ?auto_30936 ?auto_30937 ) ) ( not ( = ?auto_30936 ?auto_30938 ) ) ( not ( = ?auto_30936 ?auto_30939 ) ) ( not ( = ?auto_30937 ?auto_30938 ) ) ( not ( = ?auto_30937 ?auto_30939 ) ) ( not ( = ?auto_30938 ?auto_30939 ) ) ( ON ?auto_30939 ?auto_30941 ) ( not ( = ?auto_30936 ?auto_30941 ) ) ( not ( = ?auto_30937 ?auto_30941 ) ) ( not ( = ?auto_30938 ?auto_30941 ) ) ( not ( = ?auto_30939 ?auto_30941 ) ) ( ON ?auto_30938 ?auto_30939 ) ( ON-TABLE ?auto_30940 ) ( ON ?auto_30941 ?auto_30940 ) ( not ( = ?auto_30940 ?auto_30941 ) ) ( not ( = ?auto_30940 ?auto_30939 ) ) ( not ( = ?auto_30940 ?auto_30938 ) ) ( not ( = ?auto_30936 ?auto_30940 ) ) ( not ( = ?auto_30937 ?auto_30940 ) ) ( CLEAR ?auto_30936 ) ( ON ?auto_30937 ?auto_30938 ) ( CLEAR ?auto_30937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30940 ?auto_30941 ?auto_30939 ?auto_30938 )
      ( MAKE-4PILE ?auto_30936 ?auto_30937 ?auto_30938 ?auto_30939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30942 - BLOCK
      ?auto_30943 - BLOCK
      ?auto_30944 - BLOCK
      ?auto_30945 - BLOCK
    )
    :vars
    (
      ?auto_30947 - BLOCK
      ?auto_30946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30942 ?auto_30943 ) ) ( not ( = ?auto_30942 ?auto_30944 ) ) ( not ( = ?auto_30942 ?auto_30945 ) ) ( not ( = ?auto_30943 ?auto_30944 ) ) ( not ( = ?auto_30943 ?auto_30945 ) ) ( not ( = ?auto_30944 ?auto_30945 ) ) ( ON ?auto_30945 ?auto_30947 ) ( not ( = ?auto_30942 ?auto_30947 ) ) ( not ( = ?auto_30943 ?auto_30947 ) ) ( not ( = ?auto_30944 ?auto_30947 ) ) ( not ( = ?auto_30945 ?auto_30947 ) ) ( ON ?auto_30944 ?auto_30945 ) ( ON-TABLE ?auto_30946 ) ( ON ?auto_30947 ?auto_30946 ) ( not ( = ?auto_30946 ?auto_30947 ) ) ( not ( = ?auto_30946 ?auto_30945 ) ) ( not ( = ?auto_30946 ?auto_30944 ) ) ( not ( = ?auto_30942 ?auto_30946 ) ) ( not ( = ?auto_30943 ?auto_30946 ) ) ( ON ?auto_30943 ?auto_30944 ) ( CLEAR ?auto_30943 ) ( HOLDING ?auto_30942 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30942 )
      ( MAKE-4PILE ?auto_30942 ?auto_30943 ?auto_30944 ?auto_30945 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30948 - BLOCK
      ?auto_30949 - BLOCK
      ?auto_30950 - BLOCK
      ?auto_30951 - BLOCK
    )
    :vars
    (
      ?auto_30952 - BLOCK
      ?auto_30953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30948 ?auto_30949 ) ) ( not ( = ?auto_30948 ?auto_30950 ) ) ( not ( = ?auto_30948 ?auto_30951 ) ) ( not ( = ?auto_30949 ?auto_30950 ) ) ( not ( = ?auto_30949 ?auto_30951 ) ) ( not ( = ?auto_30950 ?auto_30951 ) ) ( ON ?auto_30951 ?auto_30952 ) ( not ( = ?auto_30948 ?auto_30952 ) ) ( not ( = ?auto_30949 ?auto_30952 ) ) ( not ( = ?auto_30950 ?auto_30952 ) ) ( not ( = ?auto_30951 ?auto_30952 ) ) ( ON ?auto_30950 ?auto_30951 ) ( ON-TABLE ?auto_30953 ) ( ON ?auto_30952 ?auto_30953 ) ( not ( = ?auto_30953 ?auto_30952 ) ) ( not ( = ?auto_30953 ?auto_30951 ) ) ( not ( = ?auto_30953 ?auto_30950 ) ) ( not ( = ?auto_30948 ?auto_30953 ) ) ( not ( = ?auto_30949 ?auto_30953 ) ) ( ON ?auto_30949 ?auto_30950 ) ( ON ?auto_30948 ?auto_30949 ) ( CLEAR ?auto_30948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30953 ?auto_30952 ?auto_30951 ?auto_30950 ?auto_30949 )
      ( MAKE-4PILE ?auto_30948 ?auto_30949 ?auto_30950 ?auto_30951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30955 - BLOCK
    )
    :vars
    (
      ?auto_30956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30956 ?auto_30955 ) ( CLEAR ?auto_30956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30955 ) ( not ( = ?auto_30955 ?auto_30956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30956 ?auto_30955 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30957 - BLOCK
    )
    :vars
    (
      ?auto_30958 - BLOCK
      ?auto_30959 - BLOCK
      ?auto_30960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30958 ?auto_30957 ) ( CLEAR ?auto_30958 ) ( ON-TABLE ?auto_30957 ) ( not ( = ?auto_30957 ?auto_30958 ) ) ( HOLDING ?auto_30959 ) ( CLEAR ?auto_30960 ) ( not ( = ?auto_30957 ?auto_30959 ) ) ( not ( = ?auto_30957 ?auto_30960 ) ) ( not ( = ?auto_30958 ?auto_30959 ) ) ( not ( = ?auto_30958 ?auto_30960 ) ) ( not ( = ?auto_30959 ?auto_30960 ) ) )
    :subtasks
    ( ( !STACK ?auto_30959 ?auto_30960 )
      ( MAKE-1PILE ?auto_30957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30961 - BLOCK
    )
    :vars
    (
      ?auto_30964 - BLOCK
      ?auto_30962 - BLOCK
      ?auto_30963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30964 ?auto_30961 ) ( ON-TABLE ?auto_30961 ) ( not ( = ?auto_30961 ?auto_30964 ) ) ( CLEAR ?auto_30962 ) ( not ( = ?auto_30961 ?auto_30963 ) ) ( not ( = ?auto_30961 ?auto_30962 ) ) ( not ( = ?auto_30964 ?auto_30963 ) ) ( not ( = ?auto_30964 ?auto_30962 ) ) ( not ( = ?auto_30963 ?auto_30962 ) ) ( ON ?auto_30963 ?auto_30964 ) ( CLEAR ?auto_30963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30961 ?auto_30964 )
      ( MAKE-1PILE ?auto_30961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30965 - BLOCK
    )
    :vars
    (
      ?auto_30967 - BLOCK
      ?auto_30968 - BLOCK
      ?auto_30966 - BLOCK
      ?auto_30969 - BLOCK
      ?auto_30970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30967 ?auto_30965 ) ( ON-TABLE ?auto_30965 ) ( not ( = ?auto_30965 ?auto_30967 ) ) ( not ( = ?auto_30965 ?auto_30968 ) ) ( not ( = ?auto_30965 ?auto_30966 ) ) ( not ( = ?auto_30967 ?auto_30968 ) ) ( not ( = ?auto_30967 ?auto_30966 ) ) ( not ( = ?auto_30968 ?auto_30966 ) ) ( ON ?auto_30968 ?auto_30967 ) ( CLEAR ?auto_30968 ) ( HOLDING ?auto_30966 ) ( CLEAR ?auto_30969 ) ( ON-TABLE ?auto_30970 ) ( ON ?auto_30969 ?auto_30970 ) ( not ( = ?auto_30970 ?auto_30969 ) ) ( not ( = ?auto_30970 ?auto_30966 ) ) ( not ( = ?auto_30969 ?auto_30966 ) ) ( not ( = ?auto_30965 ?auto_30969 ) ) ( not ( = ?auto_30965 ?auto_30970 ) ) ( not ( = ?auto_30967 ?auto_30969 ) ) ( not ( = ?auto_30967 ?auto_30970 ) ) ( not ( = ?auto_30968 ?auto_30969 ) ) ( not ( = ?auto_30968 ?auto_30970 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30970 ?auto_30969 ?auto_30966 )
      ( MAKE-1PILE ?auto_30965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30971 - BLOCK
    )
    :vars
    (
      ?auto_30976 - BLOCK
      ?auto_30975 - BLOCK
      ?auto_30972 - BLOCK
      ?auto_30974 - BLOCK
      ?auto_30973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30976 ?auto_30971 ) ( ON-TABLE ?auto_30971 ) ( not ( = ?auto_30971 ?auto_30976 ) ) ( not ( = ?auto_30971 ?auto_30975 ) ) ( not ( = ?auto_30971 ?auto_30972 ) ) ( not ( = ?auto_30976 ?auto_30975 ) ) ( not ( = ?auto_30976 ?auto_30972 ) ) ( not ( = ?auto_30975 ?auto_30972 ) ) ( ON ?auto_30975 ?auto_30976 ) ( CLEAR ?auto_30974 ) ( ON-TABLE ?auto_30973 ) ( ON ?auto_30974 ?auto_30973 ) ( not ( = ?auto_30973 ?auto_30974 ) ) ( not ( = ?auto_30973 ?auto_30972 ) ) ( not ( = ?auto_30974 ?auto_30972 ) ) ( not ( = ?auto_30971 ?auto_30974 ) ) ( not ( = ?auto_30971 ?auto_30973 ) ) ( not ( = ?auto_30976 ?auto_30974 ) ) ( not ( = ?auto_30976 ?auto_30973 ) ) ( not ( = ?auto_30975 ?auto_30974 ) ) ( not ( = ?auto_30975 ?auto_30973 ) ) ( ON ?auto_30972 ?auto_30975 ) ( CLEAR ?auto_30972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30971 ?auto_30976 ?auto_30975 )
      ( MAKE-1PILE ?auto_30971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30977 - BLOCK
    )
    :vars
    (
      ?auto_30981 - BLOCK
      ?auto_30978 - BLOCK
      ?auto_30982 - BLOCK
      ?auto_30980 - BLOCK
      ?auto_30979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30981 ?auto_30977 ) ( ON-TABLE ?auto_30977 ) ( not ( = ?auto_30977 ?auto_30981 ) ) ( not ( = ?auto_30977 ?auto_30978 ) ) ( not ( = ?auto_30977 ?auto_30982 ) ) ( not ( = ?auto_30981 ?auto_30978 ) ) ( not ( = ?auto_30981 ?auto_30982 ) ) ( not ( = ?auto_30978 ?auto_30982 ) ) ( ON ?auto_30978 ?auto_30981 ) ( ON-TABLE ?auto_30980 ) ( not ( = ?auto_30980 ?auto_30979 ) ) ( not ( = ?auto_30980 ?auto_30982 ) ) ( not ( = ?auto_30979 ?auto_30982 ) ) ( not ( = ?auto_30977 ?auto_30979 ) ) ( not ( = ?auto_30977 ?auto_30980 ) ) ( not ( = ?auto_30981 ?auto_30979 ) ) ( not ( = ?auto_30981 ?auto_30980 ) ) ( not ( = ?auto_30978 ?auto_30979 ) ) ( not ( = ?auto_30978 ?auto_30980 ) ) ( ON ?auto_30982 ?auto_30978 ) ( CLEAR ?auto_30982 ) ( HOLDING ?auto_30979 ) ( CLEAR ?auto_30980 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30980 ?auto_30979 )
      ( MAKE-1PILE ?auto_30977 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31446 - BLOCK
    )
    :vars
    (
      ?auto_31450 - BLOCK
      ?auto_31449 - BLOCK
      ?auto_31447 - BLOCK
      ?auto_31448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31450 ?auto_31446 ) ( ON-TABLE ?auto_31446 ) ( not ( = ?auto_31446 ?auto_31450 ) ) ( not ( = ?auto_31446 ?auto_31449 ) ) ( not ( = ?auto_31446 ?auto_31447 ) ) ( not ( = ?auto_31450 ?auto_31449 ) ) ( not ( = ?auto_31450 ?auto_31447 ) ) ( not ( = ?auto_31449 ?auto_31447 ) ) ( ON ?auto_31449 ?auto_31450 ) ( not ( = ?auto_31448 ?auto_31447 ) ) ( not ( = ?auto_31446 ?auto_31448 ) ) ( not ( = ?auto_31450 ?auto_31448 ) ) ( not ( = ?auto_31449 ?auto_31448 ) ) ( ON ?auto_31447 ?auto_31449 ) ( ON ?auto_31448 ?auto_31447 ) ( CLEAR ?auto_31448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31446 ?auto_31450 ?auto_31449 ?auto_31447 )
      ( MAKE-1PILE ?auto_31446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30989 - BLOCK
    )
    :vars
    (
      ?auto_30991 - BLOCK
      ?auto_30990 - BLOCK
      ?auto_30992 - BLOCK
      ?auto_30994 - BLOCK
      ?auto_30993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30991 ?auto_30989 ) ( ON-TABLE ?auto_30989 ) ( not ( = ?auto_30989 ?auto_30991 ) ) ( not ( = ?auto_30989 ?auto_30990 ) ) ( not ( = ?auto_30989 ?auto_30992 ) ) ( not ( = ?auto_30991 ?auto_30990 ) ) ( not ( = ?auto_30991 ?auto_30992 ) ) ( not ( = ?auto_30990 ?auto_30992 ) ) ( ON ?auto_30990 ?auto_30991 ) ( not ( = ?auto_30994 ?auto_30993 ) ) ( not ( = ?auto_30994 ?auto_30992 ) ) ( not ( = ?auto_30993 ?auto_30992 ) ) ( not ( = ?auto_30989 ?auto_30993 ) ) ( not ( = ?auto_30989 ?auto_30994 ) ) ( not ( = ?auto_30991 ?auto_30993 ) ) ( not ( = ?auto_30991 ?auto_30994 ) ) ( not ( = ?auto_30990 ?auto_30993 ) ) ( not ( = ?auto_30990 ?auto_30994 ) ) ( ON ?auto_30992 ?auto_30990 ) ( ON ?auto_30993 ?auto_30992 ) ( CLEAR ?auto_30993 ) ( HOLDING ?auto_30994 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30994 )
      ( MAKE-1PILE ?auto_30989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30995 - BLOCK
    )
    :vars
    (
      ?auto_30996 - BLOCK
      ?auto_31000 - BLOCK
      ?auto_30997 - BLOCK
      ?auto_30998 - BLOCK
      ?auto_30999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30996 ?auto_30995 ) ( ON-TABLE ?auto_30995 ) ( not ( = ?auto_30995 ?auto_30996 ) ) ( not ( = ?auto_30995 ?auto_31000 ) ) ( not ( = ?auto_30995 ?auto_30997 ) ) ( not ( = ?auto_30996 ?auto_31000 ) ) ( not ( = ?auto_30996 ?auto_30997 ) ) ( not ( = ?auto_31000 ?auto_30997 ) ) ( ON ?auto_31000 ?auto_30996 ) ( not ( = ?auto_30998 ?auto_30999 ) ) ( not ( = ?auto_30998 ?auto_30997 ) ) ( not ( = ?auto_30999 ?auto_30997 ) ) ( not ( = ?auto_30995 ?auto_30999 ) ) ( not ( = ?auto_30995 ?auto_30998 ) ) ( not ( = ?auto_30996 ?auto_30999 ) ) ( not ( = ?auto_30996 ?auto_30998 ) ) ( not ( = ?auto_31000 ?auto_30999 ) ) ( not ( = ?auto_31000 ?auto_30998 ) ) ( ON ?auto_30997 ?auto_31000 ) ( ON ?auto_30999 ?auto_30997 ) ( ON ?auto_30998 ?auto_30999 ) ( CLEAR ?auto_30998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30995 ?auto_30996 ?auto_31000 ?auto_30997 ?auto_30999 )
      ( MAKE-1PILE ?auto_30995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31006 - BLOCK
      ?auto_31007 - BLOCK
      ?auto_31008 - BLOCK
      ?auto_31009 - BLOCK
      ?auto_31010 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31010 ) ( CLEAR ?auto_31009 ) ( ON-TABLE ?auto_31006 ) ( ON ?auto_31007 ?auto_31006 ) ( ON ?auto_31008 ?auto_31007 ) ( ON ?auto_31009 ?auto_31008 ) ( not ( = ?auto_31006 ?auto_31007 ) ) ( not ( = ?auto_31006 ?auto_31008 ) ) ( not ( = ?auto_31006 ?auto_31009 ) ) ( not ( = ?auto_31006 ?auto_31010 ) ) ( not ( = ?auto_31007 ?auto_31008 ) ) ( not ( = ?auto_31007 ?auto_31009 ) ) ( not ( = ?auto_31007 ?auto_31010 ) ) ( not ( = ?auto_31008 ?auto_31009 ) ) ( not ( = ?auto_31008 ?auto_31010 ) ) ( not ( = ?auto_31009 ?auto_31010 ) ) )
    :subtasks
    ( ( !STACK ?auto_31010 ?auto_31009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31011 - BLOCK
      ?auto_31012 - BLOCK
      ?auto_31013 - BLOCK
      ?auto_31014 - BLOCK
      ?auto_31015 - BLOCK
    )
    :vars
    (
      ?auto_31016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31014 ) ( ON-TABLE ?auto_31011 ) ( ON ?auto_31012 ?auto_31011 ) ( ON ?auto_31013 ?auto_31012 ) ( ON ?auto_31014 ?auto_31013 ) ( not ( = ?auto_31011 ?auto_31012 ) ) ( not ( = ?auto_31011 ?auto_31013 ) ) ( not ( = ?auto_31011 ?auto_31014 ) ) ( not ( = ?auto_31011 ?auto_31015 ) ) ( not ( = ?auto_31012 ?auto_31013 ) ) ( not ( = ?auto_31012 ?auto_31014 ) ) ( not ( = ?auto_31012 ?auto_31015 ) ) ( not ( = ?auto_31013 ?auto_31014 ) ) ( not ( = ?auto_31013 ?auto_31015 ) ) ( not ( = ?auto_31014 ?auto_31015 ) ) ( ON ?auto_31015 ?auto_31016 ) ( CLEAR ?auto_31015 ) ( HAND-EMPTY ) ( not ( = ?auto_31011 ?auto_31016 ) ) ( not ( = ?auto_31012 ?auto_31016 ) ) ( not ( = ?auto_31013 ?auto_31016 ) ) ( not ( = ?auto_31014 ?auto_31016 ) ) ( not ( = ?auto_31015 ?auto_31016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31015 ?auto_31016 )
      ( MAKE-5PILE ?auto_31011 ?auto_31012 ?auto_31013 ?auto_31014 ?auto_31015 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31017 - BLOCK
      ?auto_31018 - BLOCK
      ?auto_31019 - BLOCK
      ?auto_31020 - BLOCK
      ?auto_31021 - BLOCK
    )
    :vars
    (
      ?auto_31022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31017 ) ( ON ?auto_31018 ?auto_31017 ) ( ON ?auto_31019 ?auto_31018 ) ( not ( = ?auto_31017 ?auto_31018 ) ) ( not ( = ?auto_31017 ?auto_31019 ) ) ( not ( = ?auto_31017 ?auto_31020 ) ) ( not ( = ?auto_31017 ?auto_31021 ) ) ( not ( = ?auto_31018 ?auto_31019 ) ) ( not ( = ?auto_31018 ?auto_31020 ) ) ( not ( = ?auto_31018 ?auto_31021 ) ) ( not ( = ?auto_31019 ?auto_31020 ) ) ( not ( = ?auto_31019 ?auto_31021 ) ) ( not ( = ?auto_31020 ?auto_31021 ) ) ( ON ?auto_31021 ?auto_31022 ) ( CLEAR ?auto_31021 ) ( not ( = ?auto_31017 ?auto_31022 ) ) ( not ( = ?auto_31018 ?auto_31022 ) ) ( not ( = ?auto_31019 ?auto_31022 ) ) ( not ( = ?auto_31020 ?auto_31022 ) ) ( not ( = ?auto_31021 ?auto_31022 ) ) ( HOLDING ?auto_31020 ) ( CLEAR ?auto_31019 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31017 ?auto_31018 ?auto_31019 ?auto_31020 )
      ( MAKE-5PILE ?auto_31017 ?auto_31018 ?auto_31019 ?auto_31020 ?auto_31021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31023 - BLOCK
      ?auto_31024 - BLOCK
      ?auto_31025 - BLOCK
      ?auto_31026 - BLOCK
      ?auto_31027 - BLOCK
    )
    :vars
    (
      ?auto_31028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31023 ) ( ON ?auto_31024 ?auto_31023 ) ( ON ?auto_31025 ?auto_31024 ) ( not ( = ?auto_31023 ?auto_31024 ) ) ( not ( = ?auto_31023 ?auto_31025 ) ) ( not ( = ?auto_31023 ?auto_31026 ) ) ( not ( = ?auto_31023 ?auto_31027 ) ) ( not ( = ?auto_31024 ?auto_31025 ) ) ( not ( = ?auto_31024 ?auto_31026 ) ) ( not ( = ?auto_31024 ?auto_31027 ) ) ( not ( = ?auto_31025 ?auto_31026 ) ) ( not ( = ?auto_31025 ?auto_31027 ) ) ( not ( = ?auto_31026 ?auto_31027 ) ) ( ON ?auto_31027 ?auto_31028 ) ( not ( = ?auto_31023 ?auto_31028 ) ) ( not ( = ?auto_31024 ?auto_31028 ) ) ( not ( = ?auto_31025 ?auto_31028 ) ) ( not ( = ?auto_31026 ?auto_31028 ) ) ( not ( = ?auto_31027 ?auto_31028 ) ) ( CLEAR ?auto_31025 ) ( ON ?auto_31026 ?auto_31027 ) ( CLEAR ?auto_31026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31028 ?auto_31027 )
      ( MAKE-5PILE ?auto_31023 ?auto_31024 ?auto_31025 ?auto_31026 ?auto_31027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31029 - BLOCK
      ?auto_31030 - BLOCK
      ?auto_31031 - BLOCK
      ?auto_31032 - BLOCK
      ?auto_31033 - BLOCK
    )
    :vars
    (
      ?auto_31034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31029 ) ( ON ?auto_31030 ?auto_31029 ) ( not ( = ?auto_31029 ?auto_31030 ) ) ( not ( = ?auto_31029 ?auto_31031 ) ) ( not ( = ?auto_31029 ?auto_31032 ) ) ( not ( = ?auto_31029 ?auto_31033 ) ) ( not ( = ?auto_31030 ?auto_31031 ) ) ( not ( = ?auto_31030 ?auto_31032 ) ) ( not ( = ?auto_31030 ?auto_31033 ) ) ( not ( = ?auto_31031 ?auto_31032 ) ) ( not ( = ?auto_31031 ?auto_31033 ) ) ( not ( = ?auto_31032 ?auto_31033 ) ) ( ON ?auto_31033 ?auto_31034 ) ( not ( = ?auto_31029 ?auto_31034 ) ) ( not ( = ?auto_31030 ?auto_31034 ) ) ( not ( = ?auto_31031 ?auto_31034 ) ) ( not ( = ?auto_31032 ?auto_31034 ) ) ( not ( = ?auto_31033 ?auto_31034 ) ) ( ON ?auto_31032 ?auto_31033 ) ( CLEAR ?auto_31032 ) ( ON-TABLE ?auto_31034 ) ( HOLDING ?auto_31031 ) ( CLEAR ?auto_31030 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31029 ?auto_31030 ?auto_31031 )
      ( MAKE-5PILE ?auto_31029 ?auto_31030 ?auto_31031 ?auto_31032 ?auto_31033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31035 - BLOCK
      ?auto_31036 - BLOCK
      ?auto_31037 - BLOCK
      ?auto_31038 - BLOCK
      ?auto_31039 - BLOCK
    )
    :vars
    (
      ?auto_31040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31035 ) ( ON ?auto_31036 ?auto_31035 ) ( not ( = ?auto_31035 ?auto_31036 ) ) ( not ( = ?auto_31035 ?auto_31037 ) ) ( not ( = ?auto_31035 ?auto_31038 ) ) ( not ( = ?auto_31035 ?auto_31039 ) ) ( not ( = ?auto_31036 ?auto_31037 ) ) ( not ( = ?auto_31036 ?auto_31038 ) ) ( not ( = ?auto_31036 ?auto_31039 ) ) ( not ( = ?auto_31037 ?auto_31038 ) ) ( not ( = ?auto_31037 ?auto_31039 ) ) ( not ( = ?auto_31038 ?auto_31039 ) ) ( ON ?auto_31039 ?auto_31040 ) ( not ( = ?auto_31035 ?auto_31040 ) ) ( not ( = ?auto_31036 ?auto_31040 ) ) ( not ( = ?auto_31037 ?auto_31040 ) ) ( not ( = ?auto_31038 ?auto_31040 ) ) ( not ( = ?auto_31039 ?auto_31040 ) ) ( ON ?auto_31038 ?auto_31039 ) ( ON-TABLE ?auto_31040 ) ( CLEAR ?auto_31036 ) ( ON ?auto_31037 ?auto_31038 ) ( CLEAR ?auto_31037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31040 ?auto_31039 ?auto_31038 )
      ( MAKE-5PILE ?auto_31035 ?auto_31036 ?auto_31037 ?auto_31038 ?auto_31039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31041 - BLOCK
      ?auto_31042 - BLOCK
      ?auto_31043 - BLOCK
      ?auto_31044 - BLOCK
      ?auto_31045 - BLOCK
    )
    :vars
    (
      ?auto_31046 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31041 ) ( not ( = ?auto_31041 ?auto_31042 ) ) ( not ( = ?auto_31041 ?auto_31043 ) ) ( not ( = ?auto_31041 ?auto_31044 ) ) ( not ( = ?auto_31041 ?auto_31045 ) ) ( not ( = ?auto_31042 ?auto_31043 ) ) ( not ( = ?auto_31042 ?auto_31044 ) ) ( not ( = ?auto_31042 ?auto_31045 ) ) ( not ( = ?auto_31043 ?auto_31044 ) ) ( not ( = ?auto_31043 ?auto_31045 ) ) ( not ( = ?auto_31044 ?auto_31045 ) ) ( ON ?auto_31045 ?auto_31046 ) ( not ( = ?auto_31041 ?auto_31046 ) ) ( not ( = ?auto_31042 ?auto_31046 ) ) ( not ( = ?auto_31043 ?auto_31046 ) ) ( not ( = ?auto_31044 ?auto_31046 ) ) ( not ( = ?auto_31045 ?auto_31046 ) ) ( ON ?auto_31044 ?auto_31045 ) ( ON-TABLE ?auto_31046 ) ( ON ?auto_31043 ?auto_31044 ) ( CLEAR ?auto_31043 ) ( HOLDING ?auto_31042 ) ( CLEAR ?auto_31041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31041 ?auto_31042 )
      ( MAKE-5PILE ?auto_31041 ?auto_31042 ?auto_31043 ?auto_31044 ?auto_31045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31047 - BLOCK
      ?auto_31048 - BLOCK
      ?auto_31049 - BLOCK
      ?auto_31050 - BLOCK
      ?auto_31051 - BLOCK
    )
    :vars
    (
      ?auto_31052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31047 ) ( not ( = ?auto_31047 ?auto_31048 ) ) ( not ( = ?auto_31047 ?auto_31049 ) ) ( not ( = ?auto_31047 ?auto_31050 ) ) ( not ( = ?auto_31047 ?auto_31051 ) ) ( not ( = ?auto_31048 ?auto_31049 ) ) ( not ( = ?auto_31048 ?auto_31050 ) ) ( not ( = ?auto_31048 ?auto_31051 ) ) ( not ( = ?auto_31049 ?auto_31050 ) ) ( not ( = ?auto_31049 ?auto_31051 ) ) ( not ( = ?auto_31050 ?auto_31051 ) ) ( ON ?auto_31051 ?auto_31052 ) ( not ( = ?auto_31047 ?auto_31052 ) ) ( not ( = ?auto_31048 ?auto_31052 ) ) ( not ( = ?auto_31049 ?auto_31052 ) ) ( not ( = ?auto_31050 ?auto_31052 ) ) ( not ( = ?auto_31051 ?auto_31052 ) ) ( ON ?auto_31050 ?auto_31051 ) ( ON-TABLE ?auto_31052 ) ( ON ?auto_31049 ?auto_31050 ) ( CLEAR ?auto_31047 ) ( ON ?auto_31048 ?auto_31049 ) ( CLEAR ?auto_31048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31052 ?auto_31051 ?auto_31050 ?auto_31049 )
      ( MAKE-5PILE ?auto_31047 ?auto_31048 ?auto_31049 ?auto_31050 ?auto_31051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31053 - BLOCK
      ?auto_31054 - BLOCK
      ?auto_31055 - BLOCK
      ?auto_31056 - BLOCK
      ?auto_31057 - BLOCK
    )
    :vars
    (
      ?auto_31058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31053 ?auto_31054 ) ) ( not ( = ?auto_31053 ?auto_31055 ) ) ( not ( = ?auto_31053 ?auto_31056 ) ) ( not ( = ?auto_31053 ?auto_31057 ) ) ( not ( = ?auto_31054 ?auto_31055 ) ) ( not ( = ?auto_31054 ?auto_31056 ) ) ( not ( = ?auto_31054 ?auto_31057 ) ) ( not ( = ?auto_31055 ?auto_31056 ) ) ( not ( = ?auto_31055 ?auto_31057 ) ) ( not ( = ?auto_31056 ?auto_31057 ) ) ( ON ?auto_31057 ?auto_31058 ) ( not ( = ?auto_31053 ?auto_31058 ) ) ( not ( = ?auto_31054 ?auto_31058 ) ) ( not ( = ?auto_31055 ?auto_31058 ) ) ( not ( = ?auto_31056 ?auto_31058 ) ) ( not ( = ?auto_31057 ?auto_31058 ) ) ( ON ?auto_31056 ?auto_31057 ) ( ON-TABLE ?auto_31058 ) ( ON ?auto_31055 ?auto_31056 ) ( ON ?auto_31054 ?auto_31055 ) ( CLEAR ?auto_31054 ) ( HOLDING ?auto_31053 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31053 )
      ( MAKE-5PILE ?auto_31053 ?auto_31054 ?auto_31055 ?auto_31056 ?auto_31057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31059 - BLOCK
      ?auto_31060 - BLOCK
      ?auto_31061 - BLOCK
      ?auto_31062 - BLOCK
      ?auto_31063 - BLOCK
    )
    :vars
    (
      ?auto_31064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31059 ?auto_31060 ) ) ( not ( = ?auto_31059 ?auto_31061 ) ) ( not ( = ?auto_31059 ?auto_31062 ) ) ( not ( = ?auto_31059 ?auto_31063 ) ) ( not ( = ?auto_31060 ?auto_31061 ) ) ( not ( = ?auto_31060 ?auto_31062 ) ) ( not ( = ?auto_31060 ?auto_31063 ) ) ( not ( = ?auto_31061 ?auto_31062 ) ) ( not ( = ?auto_31061 ?auto_31063 ) ) ( not ( = ?auto_31062 ?auto_31063 ) ) ( ON ?auto_31063 ?auto_31064 ) ( not ( = ?auto_31059 ?auto_31064 ) ) ( not ( = ?auto_31060 ?auto_31064 ) ) ( not ( = ?auto_31061 ?auto_31064 ) ) ( not ( = ?auto_31062 ?auto_31064 ) ) ( not ( = ?auto_31063 ?auto_31064 ) ) ( ON ?auto_31062 ?auto_31063 ) ( ON-TABLE ?auto_31064 ) ( ON ?auto_31061 ?auto_31062 ) ( ON ?auto_31060 ?auto_31061 ) ( ON ?auto_31059 ?auto_31060 ) ( CLEAR ?auto_31059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31064 ?auto_31063 ?auto_31062 ?auto_31061 ?auto_31060 )
      ( MAKE-5PILE ?auto_31059 ?auto_31060 ?auto_31061 ?auto_31062 ?auto_31063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31123 - BLOCK
    )
    :vars
    (
      ?auto_31124 - BLOCK
      ?auto_31125 - BLOCK
      ?auto_31126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31123 ?auto_31124 ) ( CLEAR ?auto_31123 ) ( not ( = ?auto_31123 ?auto_31124 ) ) ( HOLDING ?auto_31125 ) ( CLEAR ?auto_31126 ) ( not ( = ?auto_31123 ?auto_31125 ) ) ( not ( = ?auto_31123 ?auto_31126 ) ) ( not ( = ?auto_31124 ?auto_31125 ) ) ( not ( = ?auto_31124 ?auto_31126 ) ) ( not ( = ?auto_31125 ?auto_31126 ) ) )
    :subtasks
    ( ( !STACK ?auto_31125 ?auto_31126 )
      ( MAKE-1PILE ?auto_31123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31127 - BLOCK
    )
    :vars
    (
      ?auto_31129 - BLOCK
      ?auto_31130 - BLOCK
      ?auto_31128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31127 ?auto_31129 ) ( not ( = ?auto_31127 ?auto_31129 ) ) ( CLEAR ?auto_31130 ) ( not ( = ?auto_31127 ?auto_31128 ) ) ( not ( = ?auto_31127 ?auto_31130 ) ) ( not ( = ?auto_31129 ?auto_31128 ) ) ( not ( = ?auto_31129 ?auto_31130 ) ) ( not ( = ?auto_31128 ?auto_31130 ) ) ( ON ?auto_31128 ?auto_31127 ) ( CLEAR ?auto_31128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31129 ?auto_31127 )
      ( MAKE-1PILE ?auto_31127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31131 - BLOCK
    )
    :vars
    (
      ?auto_31133 - BLOCK
      ?auto_31132 - BLOCK
      ?auto_31134 - BLOCK
      ?auto_31135 - BLOCK
      ?auto_31136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31131 ?auto_31133 ) ( not ( = ?auto_31131 ?auto_31133 ) ) ( not ( = ?auto_31131 ?auto_31132 ) ) ( not ( = ?auto_31131 ?auto_31134 ) ) ( not ( = ?auto_31133 ?auto_31132 ) ) ( not ( = ?auto_31133 ?auto_31134 ) ) ( not ( = ?auto_31132 ?auto_31134 ) ) ( ON ?auto_31132 ?auto_31131 ) ( CLEAR ?auto_31132 ) ( ON-TABLE ?auto_31133 ) ( HOLDING ?auto_31134 ) ( CLEAR ?auto_31135 ) ( ON-TABLE ?auto_31136 ) ( ON ?auto_31135 ?auto_31136 ) ( not ( = ?auto_31136 ?auto_31135 ) ) ( not ( = ?auto_31136 ?auto_31134 ) ) ( not ( = ?auto_31135 ?auto_31134 ) ) ( not ( = ?auto_31131 ?auto_31135 ) ) ( not ( = ?auto_31131 ?auto_31136 ) ) ( not ( = ?auto_31133 ?auto_31135 ) ) ( not ( = ?auto_31133 ?auto_31136 ) ) ( not ( = ?auto_31132 ?auto_31135 ) ) ( not ( = ?auto_31132 ?auto_31136 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31136 ?auto_31135 ?auto_31134 )
      ( MAKE-1PILE ?auto_31131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31137 - BLOCK
    )
    :vars
    (
      ?auto_31139 - BLOCK
      ?auto_31140 - BLOCK
      ?auto_31142 - BLOCK
      ?auto_31141 - BLOCK
      ?auto_31138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31137 ?auto_31139 ) ( not ( = ?auto_31137 ?auto_31139 ) ) ( not ( = ?auto_31137 ?auto_31140 ) ) ( not ( = ?auto_31137 ?auto_31142 ) ) ( not ( = ?auto_31139 ?auto_31140 ) ) ( not ( = ?auto_31139 ?auto_31142 ) ) ( not ( = ?auto_31140 ?auto_31142 ) ) ( ON ?auto_31140 ?auto_31137 ) ( ON-TABLE ?auto_31139 ) ( CLEAR ?auto_31141 ) ( ON-TABLE ?auto_31138 ) ( ON ?auto_31141 ?auto_31138 ) ( not ( = ?auto_31138 ?auto_31141 ) ) ( not ( = ?auto_31138 ?auto_31142 ) ) ( not ( = ?auto_31141 ?auto_31142 ) ) ( not ( = ?auto_31137 ?auto_31141 ) ) ( not ( = ?auto_31137 ?auto_31138 ) ) ( not ( = ?auto_31139 ?auto_31141 ) ) ( not ( = ?auto_31139 ?auto_31138 ) ) ( not ( = ?auto_31140 ?auto_31141 ) ) ( not ( = ?auto_31140 ?auto_31138 ) ) ( ON ?auto_31142 ?auto_31140 ) ( CLEAR ?auto_31142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31139 ?auto_31137 ?auto_31140 )
      ( MAKE-1PILE ?auto_31137 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31143 - BLOCK
    )
    :vars
    (
      ?auto_31145 - BLOCK
      ?auto_31147 - BLOCK
      ?auto_31146 - BLOCK
      ?auto_31148 - BLOCK
      ?auto_31144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31143 ?auto_31145 ) ( not ( = ?auto_31143 ?auto_31145 ) ) ( not ( = ?auto_31143 ?auto_31147 ) ) ( not ( = ?auto_31143 ?auto_31146 ) ) ( not ( = ?auto_31145 ?auto_31147 ) ) ( not ( = ?auto_31145 ?auto_31146 ) ) ( not ( = ?auto_31147 ?auto_31146 ) ) ( ON ?auto_31147 ?auto_31143 ) ( ON-TABLE ?auto_31145 ) ( ON-TABLE ?auto_31148 ) ( not ( = ?auto_31148 ?auto_31144 ) ) ( not ( = ?auto_31148 ?auto_31146 ) ) ( not ( = ?auto_31144 ?auto_31146 ) ) ( not ( = ?auto_31143 ?auto_31144 ) ) ( not ( = ?auto_31143 ?auto_31148 ) ) ( not ( = ?auto_31145 ?auto_31144 ) ) ( not ( = ?auto_31145 ?auto_31148 ) ) ( not ( = ?auto_31147 ?auto_31144 ) ) ( not ( = ?auto_31147 ?auto_31148 ) ) ( ON ?auto_31146 ?auto_31147 ) ( CLEAR ?auto_31146 ) ( HOLDING ?auto_31144 ) ( CLEAR ?auto_31148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31148 ?auto_31144 )
      ( MAKE-1PILE ?auto_31143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31149 - BLOCK
    )
    :vars
    (
      ?auto_31152 - BLOCK
      ?auto_31153 - BLOCK
      ?auto_31150 - BLOCK
      ?auto_31154 - BLOCK
      ?auto_31151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31149 ?auto_31152 ) ( not ( = ?auto_31149 ?auto_31152 ) ) ( not ( = ?auto_31149 ?auto_31153 ) ) ( not ( = ?auto_31149 ?auto_31150 ) ) ( not ( = ?auto_31152 ?auto_31153 ) ) ( not ( = ?auto_31152 ?auto_31150 ) ) ( not ( = ?auto_31153 ?auto_31150 ) ) ( ON ?auto_31153 ?auto_31149 ) ( ON-TABLE ?auto_31152 ) ( ON-TABLE ?auto_31154 ) ( not ( = ?auto_31154 ?auto_31151 ) ) ( not ( = ?auto_31154 ?auto_31150 ) ) ( not ( = ?auto_31151 ?auto_31150 ) ) ( not ( = ?auto_31149 ?auto_31151 ) ) ( not ( = ?auto_31149 ?auto_31154 ) ) ( not ( = ?auto_31152 ?auto_31151 ) ) ( not ( = ?auto_31152 ?auto_31154 ) ) ( not ( = ?auto_31153 ?auto_31151 ) ) ( not ( = ?auto_31153 ?auto_31154 ) ) ( ON ?auto_31150 ?auto_31153 ) ( CLEAR ?auto_31154 ) ( ON ?auto_31151 ?auto_31150 ) ( CLEAR ?auto_31151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31152 ?auto_31149 ?auto_31153 ?auto_31150 )
      ( MAKE-1PILE ?auto_31149 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31155 - BLOCK
    )
    :vars
    (
      ?auto_31158 - BLOCK
      ?auto_31160 - BLOCK
      ?auto_31159 - BLOCK
      ?auto_31157 - BLOCK
      ?auto_31156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31155 ?auto_31158 ) ( not ( = ?auto_31155 ?auto_31158 ) ) ( not ( = ?auto_31155 ?auto_31160 ) ) ( not ( = ?auto_31155 ?auto_31159 ) ) ( not ( = ?auto_31158 ?auto_31160 ) ) ( not ( = ?auto_31158 ?auto_31159 ) ) ( not ( = ?auto_31160 ?auto_31159 ) ) ( ON ?auto_31160 ?auto_31155 ) ( ON-TABLE ?auto_31158 ) ( not ( = ?auto_31157 ?auto_31156 ) ) ( not ( = ?auto_31157 ?auto_31159 ) ) ( not ( = ?auto_31156 ?auto_31159 ) ) ( not ( = ?auto_31155 ?auto_31156 ) ) ( not ( = ?auto_31155 ?auto_31157 ) ) ( not ( = ?auto_31158 ?auto_31156 ) ) ( not ( = ?auto_31158 ?auto_31157 ) ) ( not ( = ?auto_31160 ?auto_31156 ) ) ( not ( = ?auto_31160 ?auto_31157 ) ) ( ON ?auto_31159 ?auto_31160 ) ( ON ?auto_31156 ?auto_31159 ) ( CLEAR ?auto_31156 ) ( HOLDING ?auto_31157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31157 )
      ( MAKE-1PILE ?auto_31155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31161 - BLOCK
    )
    :vars
    (
      ?auto_31166 - BLOCK
      ?auto_31162 - BLOCK
      ?auto_31164 - BLOCK
      ?auto_31165 - BLOCK
      ?auto_31163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31161 ?auto_31166 ) ( not ( = ?auto_31161 ?auto_31166 ) ) ( not ( = ?auto_31161 ?auto_31162 ) ) ( not ( = ?auto_31161 ?auto_31164 ) ) ( not ( = ?auto_31166 ?auto_31162 ) ) ( not ( = ?auto_31166 ?auto_31164 ) ) ( not ( = ?auto_31162 ?auto_31164 ) ) ( ON ?auto_31162 ?auto_31161 ) ( ON-TABLE ?auto_31166 ) ( not ( = ?auto_31165 ?auto_31163 ) ) ( not ( = ?auto_31165 ?auto_31164 ) ) ( not ( = ?auto_31163 ?auto_31164 ) ) ( not ( = ?auto_31161 ?auto_31163 ) ) ( not ( = ?auto_31161 ?auto_31165 ) ) ( not ( = ?auto_31166 ?auto_31163 ) ) ( not ( = ?auto_31166 ?auto_31165 ) ) ( not ( = ?auto_31162 ?auto_31163 ) ) ( not ( = ?auto_31162 ?auto_31165 ) ) ( ON ?auto_31164 ?auto_31162 ) ( ON ?auto_31163 ?auto_31164 ) ( ON ?auto_31165 ?auto_31163 ) ( CLEAR ?auto_31165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31166 ?auto_31161 ?auto_31162 ?auto_31164 ?auto_31163 )
      ( MAKE-1PILE ?auto_31161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31174 - BLOCK
      ?auto_31175 - BLOCK
      ?auto_31176 - BLOCK
    )
    :vars
    (
      ?auto_31177 - BLOCK
      ?auto_31178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31177 ?auto_31176 ) ( CLEAR ?auto_31177 ) ( ON-TABLE ?auto_31174 ) ( ON ?auto_31175 ?auto_31174 ) ( ON ?auto_31176 ?auto_31175 ) ( not ( = ?auto_31174 ?auto_31175 ) ) ( not ( = ?auto_31174 ?auto_31176 ) ) ( not ( = ?auto_31174 ?auto_31177 ) ) ( not ( = ?auto_31175 ?auto_31176 ) ) ( not ( = ?auto_31175 ?auto_31177 ) ) ( not ( = ?auto_31176 ?auto_31177 ) ) ( HOLDING ?auto_31178 ) ( not ( = ?auto_31174 ?auto_31178 ) ) ( not ( = ?auto_31175 ?auto_31178 ) ) ( not ( = ?auto_31176 ?auto_31178 ) ) ( not ( = ?auto_31177 ?auto_31178 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_31178 )
      ( MAKE-3PILE ?auto_31174 ?auto_31175 ?auto_31176 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31227 - BLOCK
      ?auto_31228 - BLOCK
    )
    :vars
    (
      ?auto_31229 - BLOCK
      ?auto_31230 - BLOCK
      ?auto_31231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31227 ?auto_31228 ) ) ( ON ?auto_31228 ?auto_31229 ) ( not ( = ?auto_31227 ?auto_31229 ) ) ( not ( = ?auto_31228 ?auto_31229 ) ) ( ON ?auto_31227 ?auto_31228 ) ( CLEAR ?auto_31227 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31230 ) ( ON ?auto_31231 ?auto_31230 ) ( ON ?auto_31229 ?auto_31231 ) ( not ( = ?auto_31230 ?auto_31231 ) ) ( not ( = ?auto_31230 ?auto_31229 ) ) ( not ( = ?auto_31230 ?auto_31228 ) ) ( not ( = ?auto_31230 ?auto_31227 ) ) ( not ( = ?auto_31231 ?auto_31229 ) ) ( not ( = ?auto_31231 ?auto_31228 ) ) ( not ( = ?auto_31231 ?auto_31227 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31230 ?auto_31231 ?auto_31229 ?auto_31228 )
      ( MAKE-2PILE ?auto_31227 ?auto_31228 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31234 - BLOCK
      ?auto_31235 - BLOCK
    )
    :vars
    (
      ?auto_31236 - BLOCK
      ?auto_31237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31234 ?auto_31235 ) ) ( ON ?auto_31235 ?auto_31236 ) ( CLEAR ?auto_31235 ) ( not ( = ?auto_31234 ?auto_31236 ) ) ( not ( = ?auto_31235 ?auto_31236 ) ) ( ON ?auto_31234 ?auto_31237 ) ( CLEAR ?auto_31234 ) ( HAND-EMPTY ) ( not ( = ?auto_31234 ?auto_31237 ) ) ( not ( = ?auto_31235 ?auto_31237 ) ) ( not ( = ?auto_31236 ?auto_31237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31234 ?auto_31237 )
      ( MAKE-2PILE ?auto_31234 ?auto_31235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31238 - BLOCK
      ?auto_31239 - BLOCK
    )
    :vars
    (
      ?auto_31241 - BLOCK
      ?auto_31240 - BLOCK
      ?auto_31243 - BLOCK
      ?auto_31242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31238 ?auto_31239 ) ) ( not ( = ?auto_31238 ?auto_31241 ) ) ( not ( = ?auto_31239 ?auto_31241 ) ) ( ON ?auto_31238 ?auto_31240 ) ( CLEAR ?auto_31238 ) ( not ( = ?auto_31238 ?auto_31240 ) ) ( not ( = ?auto_31239 ?auto_31240 ) ) ( not ( = ?auto_31241 ?auto_31240 ) ) ( HOLDING ?auto_31239 ) ( CLEAR ?auto_31241 ) ( ON-TABLE ?auto_31243 ) ( ON ?auto_31242 ?auto_31243 ) ( ON ?auto_31241 ?auto_31242 ) ( not ( = ?auto_31243 ?auto_31242 ) ) ( not ( = ?auto_31243 ?auto_31241 ) ) ( not ( = ?auto_31243 ?auto_31239 ) ) ( not ( = ?auto_31242 ?auto_31241 ) ) ( not ( = ?auto_31242 ?auto_31239 ) ) ( not ( = ?auto_31238 ?auto_31243 ) ) ( not ( = ?auto_31238 ?auto_31242 ) ) ( not ( = ?auto_31240 ?auto_31243 ) ) ( not ( = ?auto_31240 ?auto_31242 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31243 ?auto_31242 ?auto_31241 ?auto_31239 )
      ( MAKE-2PILE ?auto_31238 ?auto_31239 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31244 - BLOCK
      ?auto_31245 - BLOCK
    )
    :vars
    (
      ?auto_31246 - BLOCK
      ?auto_31248 - BLOCK
      ?auto_31247 - BLOCK
      ?auto_31249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31244 ?auto_31245 ) ) ( not ( = ?auto_31244 ?auto_31246 ) ) ( not ( = ?auto_31245 ?auto_31246 ) ) ( ON ?auto_31244 ?auto_31248 ) ( not ( = ?auto_31244 ?auto_31248 ) ) ( not ( = ?auto_31245 ?auto_31248 ) ) ( not ( = ?auto_31246 ?auto_31248 ) ) ( CLEAR ?auto_31246 ) ( ON-TABLE ?auto_31247 ) ( ON ?auto_31249 ?auto_31247 ) ( ON ?auto_31246 ?auto_31249 ) ( not ( = ?auto_31247 ?auto_31249 ) ) ( not ( = ?auto_31247 ?auto_31246 ) ) ( not ( = ?auto_31247 ?auto_31245 ) ) ( not ( = ?auto_31249 ?auto_31246 ) ) ( not ( = ?auto_31249 ?auto_31245 ) ) ( not ( = ?auto_31244 ?auto_31247 ) ) ( not ( = ?auto_31244 ?auto_31249 ) ) ( not ( = ?auto_31248 ?auto_31247 ) ) ( not ( = ?auto_31248 ?auto_31249 ) ) ( ON ?auto_31245 ?auto_31244 ) ( CLEAR ?auto_31245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31248 ?auto_31244 )
      ( MAKE-2PILE ?auto_31244 ?auto_31245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31250 - BLOCK
      ?auto_31251 - BLOCK
    )
    :vars
    (
      ?auto_31253 - BLOCK
      ?auto_31255 - BLOCK
      ?auto_31254 - BLOCK
      ?auto_31252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31250 ?auto_31251 ) ) ( not ( = ?auto_31250 ?auto_31253 ) ) ( not ( = ?auto_31251 ?auto_31253 ) ) ( ON ?auto_31250 ?auto_31255 ) ( not ( = ?auto_31250 ?auto_31255 ) ) ( not ( = ?auto_31251 ?auto_31255 ) ) ( not ( = ?auto_31253 ?auto_31255 ) ) ( ON-TABLE ?auto_31254 ) ( ON ?auto_31252 ?auto_31254 ) ( not ( = ?auto_31254 ?auto_31252 ) ) ( not ( = ?auto_31254 ?auto_31253 ) ) ( not ( = ?auto_31254 ?auto_31251 ) ) ( not ( = ?auto_31252 ?auto_31253 ) ) ( not ( = ?auto_31252 ?auto_31251 ) ) ( not ( = ?auto_31250 ?auto_31254 ) ) ( not ( = ?auto_31250 ?auto_31252 ) ) ( not ( = ?auto_31255 ?auto_31254 ) ) ( not ( = ?auto_31255 ?auto_31252 ) ) ( ON ?auto_31251 ?auto_31250 ) ( CLEAR ?auto_31251 ) ( ON-TABLE ?auto_31255 ) ( HOLDING ?auto_31253 ) ( CLEAR ?auto_31252 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31254 ?auto_31252 ?auto_31253 )
      ( MAKE-2PILE ?auto_31250 ?auto_31251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31256 - BLOCK
      ?auto_31257 - BLOCK
    )
    :vars
    (
      ?auto_31260 - BLOCK
      ?auto_31258 - BLOCK
      ?auto_31261 - BLOCK
      ?auto_31259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31256 ?auto_31257 ) ) ( not ( = ?auto_31256 ?auto_31260 ) ) ( not ( = ?auto_31257 ?auto_31260 ) ) ( ON ?auto_31256 ?auto_31258 ) ( not ( = ?auto_31256 ?auto_31258 ) ) ( not ( = ?auto_31257 ?auto_31258 ) ) ( not ( = ?auto_31260 ?auto_31258 ) ) ( ON-TABLE ?auto_31261 ) ( ON ?auto_31259 ?auto_31261 ) ( not ( = ?auto_31261 ?auto_31259 ) ) ( not ( = ?auto_31261 ?auto_31260 ) ) ( not ( = ?auto_31261 ?auto_31257 ) ) ( not ( = ?auto_31259 ?auto_31260 ) ) ( not ( = ?auto_31259 ?auto_31257 ) ) ( not ( = ?auto_31256 ?auto_31261 ) ) ( not ( = ?auto_31256 ?auto_31259 ) ) ( not ( = ?auto_31258 ?auto_31261 ) ) ( not ( = ?auto_31258 ?auto_31259 ) ) ( ON ?auto_31257 ?auto_31256 ) ( ON-TABLE ?auto_31258 ) ( CLEAR ?auto_31259 ) ( ON ?auto_31260 ?auto_31257 ) ( CLEAR ?auto_31260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31258 ?auto_31256 ?auto_31257 )
      ( MAKE-2PILE ?auto_31256 ?auto_31257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31262 - BLOCK
      ?auto_31263 - BLOCK
    )
    :vars
    (
      ?auto_31265 - BLOCK
      ?auto_31266 - BLOCK
      ?auto_31264 - BLOCK
      ?auto_31267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31262 ?auto_31263 ) ) ( not ( = ?auto_31262 ?auto_31265 ) ) ( not ( = ?auto_31263 ?auto_31265 ) ) ( ON ?auto_31262 ?auto_31266 ) ( not ( = ?auto_31262 ?auto_31266 ) ) ( not ( = ?auto_31263 ?auto_31266 ) ) ( not ( = ?auto_31265 ?auto_31266 ) ) ( ON-TABLE ?auto_31264 ) ( not ( = ?auto_31264 ?auto_31267 ) ) ( not ( = ?auto_31264 ?auto_31265 ) ) ( not ( = ?auto_31264 ?auto_31263 ) ) ( not ( = ?auto_31267 ?auto_31265 ) ) ( not ( = ?auto_31267 ?auto_31263 ) ) ( not ( = ?auto_31262 ?auto_31264 ) ) ( not ( = ?auto_31262 ?auto_31267 ) ) ( not ( = ?auto_31266 ?auto_31264 ) ) ( not ( = ?auto_31266 ?auto_31267 ) ) ( ON ?auto_31263 ?auto_31262 ) ( ON-TABLE ?auto_31266 ) ( ON ?auto_31265 ?auto_31263 ) ( CLEAR ?auto_31265 ) ( HOLDING ?auto_31267 ) ( CLEAR ?auto_31264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31264 ?auto_31267 )
      ( MAKE-2PILE ?auto_31262 ?auto_31263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31268 - BLOCK
      ?auto_31269 - BLOCK
    )
    :vars
    (
      ?auto_31272 - BLOCK
      ?auto_31273 - BLOCK
      ?auto_31271 - BLOCK
      ?auto_31270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31268 ?auto_31269 ) ) ( not ( = ?auto_31268 ?auto_31272 ) ) ( not ( = ?auto_31269 ?auto_31272 ) ) ( ON ?auto_31268 ?auto_31273 ) ( not ( = ?auto_31268 ?auto_31273 ) ) ( not ( = ?auto_31269 ?auto_31273 ) ) ( not ( = ?auto_31272 ?auto_31273 ) ) ( ON-TABLE ?auto_31271 ) ( not ( = ?auto_31271 ?auto_31270 ) ) ( not ( = ?auto_31271 ?auto_31272 ) ) ( not ( = ?auto_31271 ?auto_31269 ) ) ( not ( = ?auto_31270 ?auto_31272 ) ) ( not ( = ?auto_31270 ?auto_31269 ) ) ( not ( = ?auto_31268 ?auto_31271 ) ) ( not ( = ?auto_31268 ?auto_31270 ) ) ( not ( = ?auto_31273 ?auto_31271 ) ) ( not ( = ?auto_31273 ?auto_31270 ) ) ( ON ?auto_31269 ?auto_31268 ) ( ON-TABLE ?auto_31273 ) ( ON ?auto_31272 ?auto_31269 ) ( CLEAR ?auto_31271 ) ( ON ?auto_31270 ?auto_31272 ) ( CLEAR ?auto_31270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31273 ?auto_31268 ?auto_31269 ?auto_31272 )
      ( MAKE-2PILE ?auto_31268 ?auto_31269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31274 - BLOCK
      ?auto_31275 - BLOCK
    )
    :vars
    (
      ?auto_31276 - BLOCK
      ?auto_31279 - BLOCK
      ?auto_31278 - BLOCK
      ?auto_31277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31274 ?auto_31275 ) ) ( not ( = ?auto_31274 ?auto_31276 ) ) ( not ( = ?auto_31275 ?auto_31276 ) ) ( ON ?auto_31274 ?auto_31279 ) ( not ( = ?auto_31274 ?auto_31279 ) ) ( not ( = ?auto_31275 ?auto_31279 ) ) ( not ( = ?auto_31276 ?auto_31279 ) ) ( not ( = ?auto_31278 ?auto_31277 ) ) ( not ( = ?auto_31278 ?auto_31276 ) ) ( not ( = ?auto_31278 ?auto_31275 ) ) ( not ( = ?auto_31277 ?auto_31276 ) ) ( not ( = ?auto_31277 ?auto_31275 ) ) ( not ( = ?auto_31274 ?auto_31278 ) ) ( not ( = ?auto_31274 ?auto_31277 ) ) ( not ( = ?auto_31279 ?auto_31278 ) ) ( not ( = ?auto_31279 ?auto_31277 ) ) ( ON ?auto_31275 ?auto_31274 ) ( ON-TABLE ?auto_31279 ) ( ON ?auto_31276 ?auto_31275 ) ( ON ?auto_31277 ?auto_31276 ) ( CLEAR ?auto_31277 ) ( HOLDING ?auto_31278 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31278 )
      ( MAKE-2PILE ?auto_31274 ?auto_31275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31280 - BLOCK
      ?auto_31281 - BLOCK
    )
    :vars
    (
      ?auto_31282 - BLOCK
      ?auto_31283 - BLOCK
      ?auto_31284 - BLOCK
      ?auto_31285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31280 ?auto_31281 ) ) ( not ( = ?auto_31280 ?auto_31282 ) ) ( not ( = ?auto_31281 ?auto_31282 ) ) ( ON ?auto_31280 ?auto_31283 ) ( not ( = ?auto_31280 ?auto_31283 ) ) ( not ( = ?auto_31281 ?auto_31283 ) ) ( not ( = ?auto_31282 ?auto_31283 ) ) ( not ( = ?auto_31284 ?auto_31285 ) ) ( not ( = ?auto_31284 ?auto_31282 ) ) ( not ( = ?auto_31284 ?auto_31281 ) ) ( not ( = ?auto_31285 ?auto_31282 ) ) ( not ( = ?auto_31285 ?auto_31281 ) ) ( not ( = ?auto_31280 ?auto_31284 ) ) ( not ( = ?auto_31280 ?auto_31285 ) ) ( not ( = ?auto_31283 ?auto_31284 ) ) ( not ( = ?auto_31283 ?auto_31285 ) ) ( ON ?auto_31281 ?auto_31280 ) ( ON-TABLE ?auto_31283 ) ( ON ?auto_31282 ?auto_31281 ) ( ON ?auto_31285 ?auto_31282 ) ( ON ?auto_31284 ?auto_31285 ) ( CLEAR ?auto_31284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31283 ?auto_31280 ?auto_31281 ?auto_31282 ?auto_31285 )
      ( MAKE-2PILE ?auto_31280 ?auto_31281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31301 - BLOCK
      ?auto_31302 - BLOCK
    )
    :vars
    (
      ?auto_31304 - BLOCK
      ?auto_31303 - BLOCK
      ?auto_31305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31304 ?auto_31302 ) ( ON-TABLE ?auto_31301 ) ( ON ?auto_31302 ?auto_31301 ) ( not ( = ?auto_31301 ?auto_31302 ) ) ( not ( = ?auto_31301 ?auto_31304 ) ) ( not ( = ?auto_31302 ?auto_31304 ) ) ( not ( = ?auto_31301 ?auto_31303 ) ) ( not ( = ?auto_31301 ?auto_31305 ) ) ( not ( = ?auto_31302 ?auto_31303 ) ) ( not ( = ?auto_31302 ?auto_31305 ) ) ( not ( = ?auto_31304 ?auto_31303 ) ) ( not ( = ?auto_31304 ?auto_31305 ) ) ( not ( = ?auto_31303 ?auto_31305 ) ) ( ON ?auto_31303 ?auto_31304 ) ( CLEAR ?auto_31303 ) ( HOLDING ?auto_31305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31305 )
      ( MAKE-2PILE ?auto_31301 ?auto_31302 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31348 - BLOCK
      ?auto_31349 - BLOCK
      ?auto_31350 - BLOCK
    )
    :vars
    (
      ?auto_31351 - BLOCK
      ?auto_31352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31348 ) ( not ( = ?auto_31348 ?auto_31349 ) ) ( not ( = ?auto_31348 ?auto_31350 ) ) ( not ( = ?auto_31349 ?auto_31350 ) ) ( ON ?auto_31350 ?auto_31351 ) ( not ( = ?auto_31348 ?auto_31351 ) ) ( not ( = ?auto_31349 ?auto_31351 ) ) ( not ( = ?auto_31350 ?auto_31351 ) ) ( CLEAR ?auto_31348 ) ( ON ?auto_31349 ?auto_31350 ) ( CLEAR ?auto_31349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31352 ) ( ON ?auto_31351 ?auto_31352 ) ( not ( = ?auto_31352 ?auto_31351 ) ) ( not ( = ?auto_31352 ?auto_31350 ) ) ( not ( = ?auto_31352 ?auto_31349 ) ) ( not ( = ?auto_31348 ?auto_31352 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31352 ?auto_31351 ?auto_31350 )
      ( MAKE-3PILE ?auto_31348 ?auto_31349 ?auto_31350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31353 - BLOCK
      ?auto_31354 - BLOCK
      ?auto_31355 - BLOCK
    )
    :vars
    (
      ?auto_31356 - BLOCK
      ?auto_31357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31353 ?auto_31354 ) ) ( not ( = ?auto_31353 ?auto_31355 ) ) ( not ( = ?auto_31354 ?auto_31355 ) ) ( ON ?auto_31355 ?auto_31356 ) ( not ( = ?auto_31353 ?auto_31356 ) ) ( not ( = ?auto_31354 ?auto_31356 ) ) ( not ( = ?auto_31355 ?auto_31356 ) ) ( ON ?auto_31354 ?auto_31355 ) ( CLEAR ?auto_31354 ) ( ON-TABLE ?auto_31357 ) ( ON ?auto_31356 ?auto_31357 ) ( not ( = ?auto_31357 ?auto_31356 ) ) ( not ( = ?auto_31357 ?auto_31355 ) ) ( not ( = ?auto_31357 ?auto_31354 ) ) ( not ( = ?auto_31353 ?auto_31357 ) ) ( HOLDING ?auto_31353 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31353 )
      ( MAKE-3PILE ?auto_31353 ?auto_31354 ?auto_31355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31358 - BLOCK
      ?auto_31359 - BLOCK
      ?auto_31360 - BLOCK
    )
    :vars
    (
      ?auto_31362 - BLOCK
      ?auto_31361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31358 ?auto_31359 ) ) ( not ( = ?auto_31358 ?auto_31360 ) ) ( not ( = ?auto_31359 ?auto_31360 ) ) ( ON ?auto_31360 ?auto_31362 ) ( not ( = ?auto_31358 ?auto_31362 ) ) ( not ( = ?auto_31359 ?auto_31362 ) ) ( not ( = ?auto_31360 ?auto_31362 ) ) ( ON ?auto_31359 ?auto_31360 ) ( ON-TABLE ?auto_31361 ) ( ON ?auto_31362 ?auto_31361 ) ( not ( = ?auto_31361 ?auto_31362 ) ) ( not ( = ?auto_31361 ?auto_31360 ) ) ( not ( = ?auto_31361 ?auto_31359 ) ) ( not ( = ?auto_31358 ?auto_31361 ) ) ( ON ?auto_31358 ?auto_31359 ) ( CLEAR ?auto_31358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31361 ?auto_31362 ?auto_31360 ?auto_31359 )
      ( MAKE-3PILE ?auto_31358 ?auto_31359 ?auto_31360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31366 - BLOCK
      ?auto_31367 - BLOCK
      ?auto_31368 - BLOCK
    )
    :vars
    (
      ?auto_31370 - BLOCK
      ?auto_31369 - BLOCK
      ?auto_31371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31366 ?auto_31367 ) ) ( not ( = ?auto_31366 ?auto_31368 ) ) ( not ( = ?auto_31367 ?auto_31368 ) ) ( ON ?auto_31368 ?auto_31370 ) ( not ( = ?auto_31366 ?auto_31370 ) ) ( not ( = ?auto_31367 ?auto_31370 ) ) ( not ( = ?auto_31368 ?auto_31370 ) ) ( ON ?auto_31367 ?auto_31368 ) ( CLEAR ?auto_31367 ) ( ON-TABLE ?auto_31369 ) ( ON ?auto_31370 ?auto_31369 ) ( not ( = ?auto_31369 ?auto_31370 ) ) ( not ( = ?auto_31369 ?auto_31368 ) ) ( not ( = ?auto_31369 ?auto_31367 ) ) ( not ( = ?auto_31366 ?auto_31369 ) ) ( ON ?auto_31366 ?auto_31371 ) ( CLEAR ?auto_31366 ) ( HAND-EMPTY ) ( not ( = ?auto_31366 ?auto_31371 ) ) ( not ( = ?auto_31367 ?auto_31371 ) ) ( not ( = ?auto_31368 ?auto_31371 ) ) ( not ( = ?auto_31370 ?auto_31371 ) ) ( not ( = ?auto_31369 ?auto_31371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31366 ?auto_31371 )
      ( MAKE-3PILE ?auto_31366 ?auto_31367 ?auto_31368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31372 - BLOCK
      ?auto_31373 - BLOCK
      ?auto_31374 - BLOCK
    )
    :vars
    (
      ?auto_31376 - BLOCK
      ?auto_31377 - BLOCK
      ?auto_31375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31372 ?auto_31373 ) ) ( not ( = ?auto_31372 ?auto_31374 ) ) ( not ( = ?auto_31373 ?auto_31374 ) ) ( ON ?auto_31374 ?auto_31376 ) ( not ( = ?auto_31372 ?auto_31376 ) ) ( not ( = ?auto_31373 ?auto_31376 ) ) ( not ( = ?auto_31374 ?auto_31376 ) ) ( ON-TABLE ?auto_31377 ) ( ON ?auto_31376 ?auto_31377 ) ( not ( = ?auto_31377 ?auto_31376 ) ) ( not ( = ?auto_31377 ?auto_31374 ) ) ( not ( = ?auto_31377 ?auto_31373 ) ) ( not ( = ?auto_31372 ?auto_31377 ) ) ( ON ?auto_31372 ?auto_31375 ) ( CLEAR ?auto_31372 ) ( not ( = ?auto_31372 ?auto_31375 ) ) ( not ( = ?auto_31373 ?auto_31375 ) ) ( not ( = ?auto_31374 ?auto_31375 ) ) ( not ( = ?auto_31376 ?auto_31375 ) ) ( not ( = ?auto_31377 ?auto_31375 ) ) ( HOLDING ?auto_31373 ) ( CLEAR ?auto_31374 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31377 ?auto_31376 ?auto_31374 ?auto_31373 )
      ( MAKE-3PILE ?auto_31372 ?auto_31373 ?auto_31374 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31378 - BLOCK
      ?auto_31379 - BLOCK
      ?auto_31380 - BLOCK
    )
    :vars
    (
      ?auto_31383 - BLOCK
      ?auto_31382 - BLOCK
      ?auto_31381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31378 ?auto_31379 ) ) ( not ( = ?auto_31378 ?auto_31380 ) ) ( not ( = ?auto_31379 ?auto_31380 ) ) ( ON ?auto_31380 ?auto_31383 ) ( not ( = ?auto_31378 ?auto_31383 ) ) ( not ( = ?auto_31379 ?auto_31383 ) ) ( not ( = ?auto_31380 ?auto_31383 ) ) ( ON-TABLE ?auto_31382 ) ( ON ?auto_31383 ?auto_31382 ) ( not ( = ?auto_31382 ?auto_31383 ) ) ( not ( = ?auto_31382 ?auto_31380 ) ) ( not ( = ?auto_31382 ?auto_31379 ) ) ( not ( = ?auto_31378 ?auto_31382 ) ) ( ON ?auto_31378 ?auto_31381 ) ( not ( = ?auto_31378 ?auto_31381 ) ) ( not ( = ?auto_31379 ?auto_31381 ) ) ( not ( = ?auto_31380 ?auto_31381 ) ) ( not ( = ?auto_31383 ?auto_31381 ) ) ( not ( = ?auto_31382 ?auto_31381 ) ) ( CLEAR ?auto_31380 ) ( ON ?auto_31379 ?auto_31378 ) ( CLEAR ?auto_31379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31381 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31381 ?auto_31378 )
      ( MAKE-3PILE ?auto_31378 ?auto_31379 ?auto_31380 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31384 - BLOCK
      ?auto_31385 - BLOCK
      ?auto_31386 - BLOCK
    )
    :vars
    (
      ?auto_31389 - BLOCK
      ?auto_31387 - BLOCK
      ?auto_31388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31384 ?auto_31385 ) ) ( not ( = ?auto_31384 ?auto_31386 ) ) ( not ( = ?auto_31385 ?auto_31386 ) ) ( not ( = ?auto_31384 ?auto_31389 ) ) ( not ( = ?auto_31385 ?auto_31389 ) ) ( not ( = ?auto_31386 ?auto_31389 ) ) ( ON-TABLE ?auto_31387 ) ( ON ?auto_31389 ?auto_31387 ) ( not ( = ?auto_31387 ?auto_31389 ) ) ( not ( = ?auto_31387 ?auto_31386 ) ) ( not ( = ?auto_31387 ?auto_31385 ) ) ( not ( = ?auto_31384 ?auto_31387 ) ) ( ON ?auto_31384 ?auto_31388 ) ( not ( = ?auto_31384 ?auto_31388 ) ) ( not ( = ?auto_31385 ?auto_31388 ) ) ( not ( = ?auto_31386 ?auto_31388 ) ) ( not ( = ?auto_31389 ?auto_31388 ) ) ( not ( = ?auto_31387 ?auto_31388 ) ) ( ON ?auto_31385 ?auto_31384 ) ( CLEAR ?auto_31385 ) ( ON-TABLE ?auto_31388 ) ( HOLDING ?auto_31386 ) ( CLEAR ?auto_31389 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31387 ?auto_31389 ?auto_31386 )
      ( MAKE-3PILE ?auto_31384 ?auto_31385 ?auto_31386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31390 - BLOCK
      ?auto_31391 - BLOCK
      ?auto_31392 - BLOCK
    )
    :vars
    (
      ?auto_31394 - BLOCK
      ?auto_31393 - BLOCK
      ?auto_31395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31390 ?auto_31391 ) ) ( not ( = ?auto_31390 ?auto_31392 ) ) ( not ( = ?auto_31391 ?auto_31392 ) ) ( not ( = ?auto_31390 ?auto_31394 ) ) ( not ( = ?auto_31391 ?auto_31394 ) ) ( not ( = ?auto_31392 ?auto_31394 ) ) ( ON-TABLE ?auto_31393 ) ( ON ?auto_31394 ?auto_31393 ) ( not ( = ?auto_31393 ?auto_31394 ) ) ( not ( = ?auto_31393 ?auto_31392 ) ) ( not ( = ?auto_31393 ?auto_31391 ) ) ( not ( = ?auto_31390 ?auto_31393 ) ) ( ON ?auto_31390 ?auto_31395 ) ( not ( = ?auto_31390 ?auto_31395 ) ) ( not ( = ?auto_31391 ?auto_31395 ) ) ( not ( = ?auto_31392 ?auto_31395 ) ) ( not ( = ?auto_31394 ?auto_31395 ) ) ( not ( = ?auto_31393 ?auto_31395 ) ) ( ON ?auto_31391 ?auto_31390 ) ( ON-TABLE ?auto_31395 ) ( CLEAR ?auto_31394 ) ( ON ?auto_31392 ?auto_31391 ) ( CLEAR ?auto_31392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31395 ?auto_31390 ?auto_31391 )
      ( MAKE-3PILE ?auto_31390 ?auto_31391 ?auto_31392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31396 - BLOCK
      ?auto_31397 - BLOCK
      ?auto_31398 - BLOCK
    )
    :vars
    (
      ?auto_31399 - BLOCK
      ?auto_31401 - BLOCK
      ?auto_31400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31396 ?auto_31397 ) ) ( not ( = ?auto_31396 ?auto_31398 ) ) ( not ( = ?auto_31397 ?auto_31398 ) ) ( not ( = ?auto_31396 ?auto_31399 ) ) ( not ( = ?auto_31397 ?auto_31399 ) ) ( not ( = ?auto_31398 ?auto_31399 ) ) ( ON-TABLE ?auto_31401 ) ( not ( = ?auto_31401 ?auto_31399 ) ) ( not ( = ?auto_31401 ?auto_31398 ) ) ( not ( = ?auto_31401 ?auto_31397 ) ) ( not ( = ?auto_31396 ?auto_31401 ) ) ( ON ?auto_31396 ?auto_31400 ) ( not ( = ?auto_31396 ?auto_31400 ) ) ( not ( = ?auto_31397 ?auto_31400 ) ) ( not ( = ?auto_31398 ?auto_31400 ) ) ( not ( = ?auto_31399 ?auto_31400 ) ) ( not ( = ?auto_31401 ?auto_31400 ) ) ( ON ?auto_31397 ?auto_31396 ) ( ON-TABLE ?auto_31400 ) ( ON ?auto_31398 ?auto_31397 ) ( CLEAR ?auto_31398 ) ( HOLDING ?auto_31399 ) ( CLEAR ?auto_31401 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31401 ?auto_31399 )
      ( MAKE-3PILE ?auto_31396 ?auto_31397 ?auto_31398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31402 - BLOCK
      ?auto_31403 - BLOCK
      ?auto_31404 - BLOCK
    )
    :vars
    (
      ?auto_31407 - BLOCK
      ?auto_31406 - BLOCK
      ?auto_31405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31402 ?auto_31403 ) ) ( not ( = ?auto_31402 ?auto_31404 ) ) ( not ( = ?auto_31403 ?auto_31404 ) ) ( not ( = ?auto_31402 ?auto_31407 ) ) ( not ( = ?auto_31403 ?auto_31407 ) ) ( not ( = ?auto_31404 ?auto_31407 ) ) ( ON-TABLE ?auto_31406 ) ( not ( = ?auto_31406 ?auto_31407 ) ) ( not ( = ?auto_31406 ?auto_31404 ) ) ( not ( = ?auto_31406 ?auto_31403 ) ) ( not ( = ?auto_31402 ?auto_31406 ) ) ( ON ?auto_31402 ?auto_31405 ) ( not ( = ?auto_31402 ?auto_31405 ) ) ( not ( = ?auto_31403 ?auto_31405 ) ) ( not ( = ?auto_31404 ?auto_31405 ) ) ( not ( = ?auto_31407 ?auto_31405 ) ) ( not ( = ?auto_31406 ?auto_31405 ) ) ( ON ?auto_31403 ?auto_31402 ) ( ON-TABLE ?auto_31405 ) ( ON ?auto_31404 ?auto_31403 ) ( CLEAR ?auto_31406 ) ( ON ?auto_31407 ?auto_31404 ) ( CLEAR ?auto_31407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31405 ?auto_31402 ?auto_31403 ?auto_31404 )
      ( MAKE-3PILE ?auto_31402 ?auto_31403 ?auto_31404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31408 - BLOCK
      ?auto_31409 - BLOCK
      ?auto_31410 - BLOCK
    )
    :vars
    (
      ?auto_31412 - BLOCK
      ?auto_31411 - BLOCK
      ?auto_31413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31408 ?auto_31409 ) ) ( not ( = ?auto_31408 ?auto_31410 ) ) ( not ( = ?auto_31409 ?auto_31410 ) ) ( not ( = ?auto_31408 ?auto_31412 ) ) ( not ( = ?auto_31409 ?auto_31412 ) ) ( not ( = ?auto_31410 ?auto_31412 ) ) ( not ( = ?auto_31411 ?auto_31412 ) ) ( not ( = ?auto_31411 ?auto_31410 ) ) ( not ( = ?auto_31411 ?auto_31409 ) ) ( not ( = ?auto_31408 ?auto_31411 ) ) ( ON ?auto_31408 ?auto_31413 ) ( not ( = ?auto_31408 ?auto_31413 ) ) ( not ( = ?auto_31409 ?auto_31413 ) ) ( not ( = ?auto_31410 ?auto_31413 ) ) ( not ( = ?auto_31412 ?auto_31413 ) ) ( not ( = ?auto_31411 ?auto_31413 ) ) ( ON ?auto_31409 ?auto_31408 ) ( ON-TABLE ?auto_31413 ) ( ON ?auto_31410 ?auto_31409 ) ( ON ?auto_31412 ?auto_31410 ) ( CLEAR ?auto_31412 ) ( HOLDING ?auto_31411 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31411 )
      ( MAKE-3PILE ?auto_31408 ?auto_31409 ?auto_31410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31414 - BLOCK
      ?auto_31415 - BLOCK
      ?auto_31416 - BLOCK
    )
    :vars
    (
      ?auto_31419 - BLOCK
      ?auto_31417 - BLOCK
      ?auto_31418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31414 ?auto_31415 ) ) ( not ( = ?auto_31414 ?auto_31416 ) ) ( not ( = ?auto_31415 ?auto_31416 ) ) ( not ( = ?auto_31414 ?auto_31419 ) ) ( not ( = ?auto_31415 ?auto_31419 ) ) ( not ( = ?auto_31416 ?auto_31419 ) ) ( not ( = ?auto_31417 ?auto_31419 ) ) ( not ( = ?auto_31417 ?auto_31416 ) ) ( not ( = ?auto_31417 ?auto_31415 ) ) ( not ( = ?auto_31414 ?auto_31417 ) ) ( ON ?auto_31414 ?auto_31418 ) ( not ( = ?auto_31414 ?auto_31418 ) ) ( not ( = ?auto_31415 ?auto_31418 ) ) ( not ( = ?auto_31416 ?auto_31418 ) ) ( not ( = ?auto_31419 ?auto_31418 ) ) ( not ( = ?auto_31417 ?auto_31418 ) ) ( ON ?auto_31415 ?auto_31414 ) ( ON-TABLE ?auto_31418 ) ( ON ?auto_31416 ?auto_31415 ) ( ON ?auto_31419 ?auto_31416 ) ( ON ?auto_31417 ?auto_31419 ) ( CLEAR ?auto_31417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31418 ?auto_31414 ?auto_31415 ?auto_31416 ?auto_31419 )
      ( MAKE-3PILE ?auto_31414 ?auto_31415 ?auto_31416 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31431 - BLOCK
    )
    :vars
    (
      ?auto_31433 - BLOCK
      ?auto_31434 - BLOCK
      ?auto_31432 - BLOCK
      ?auto_31435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31433 ?auto_31431 ) ( ON-TABLE ?auto_31431 ) ( not ( = ?auto_31431 ?auto_31433 ) ) ( not ( = ?auto_31431 ?auto_31434 ) ) ( not ( = ?auto_31431 ?auto_31432 ) ) ( not ( = ?auto_31433 ?auto_31434 ) ) ( not ( = ?auto_31433 ?auto_31432 ) ) ( not ( = ?auto_31434 ?auto_31432 ) ) ( ON ?auto_31434 ?auto_31433 ) ( CLEAR ?auto_31434 ) ( HOLDING ?auto_31432 ) ( CLEAR ?auto_31435 ) ( ON-TABLE ?auto_31435 ) ( not ( = ?auto_31435 ?auto_31432 ) ) ( not ( = ?auto_31431 ?auto_31435 ) ) ( not ( = ?auto_31433 ?auto_31435 ) ) ( not ( = ?auto_31434 ?auto_31435 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31435 ?auto_31432 )
      ( MAKE-1PILE ?auto_31431 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31436 - BLOCK
    )
    :vars
    (
      ?auto_31438 - BLOCK
      ?auto_31439 - BLOCK
      ?auto_31440 - BLOCK
      ?auto_31437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31438 ?auto_31436 ) ( ON-TABLE ?auto_31436 ) ( not ( = ?auto_31436 ?auto_31438 ) ) ( not ( = ?auto_31436 ?auto_31439 ) ) ( not ( = ?auto_31436 ?auto_31440 ) ) ( not ( = ?auto_31438 ?auto_31439 ) ) ( not ( = ?auto_31438 ?auto_31440 ) ) ( not ( = ?auto_31439 ?auto_31440 ) ) ( ON ?auto_31439 ?auto_31438 ) ( CLEAR ?auto_31437 ) ( ON-TABLE ?auto_31437 ) ( not ( = ?auto_31437 ?auto_31440 ) ) ( not ( = ?auto_31436 ?auto_31437 ) ) ( not ( = ?auto_31438 ?auto_31437 ) ) ( not ( = ?auto_31439 ?auto_31437 ) ) ( ON ?auto_31440 ?auto_31439 ) ( CLEAR ?auto_31440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31436 ?auto_31438 ?auto_31439 )
      ( MAKE-1PILE ?auto_31436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31441 - BLOCK
    )
    :vars
    (
      ?auto_31445 - BLOCK
      ?auto_31443 - BLOCK
      ?auto_31442 - BLOCK
      ?auto_31444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31445 ?auto_31441 ) ( ON-TABLE ?auto_31441 ) ( not ( = ?auto_31441 ?auto_31445 ) ) ( not ( = ?auto_31441 ?auto_31443 ) ) ( not ( = ?auto_31441 ?auto_31442 ) ) ( not ( = ?auto_31445 ?auto_31443 ) ) ( not ( = ?auto_31445 ?auto_31442 ) ) ( not ( = ?auto_31443 ?auto_31442 ) ) ( ON ?auto_31443 ?auto_31445 ) ( not ( = ?auto_31444 ?auto_31442 ) ) ( not ( = ?auto_31441 ?auto_31444 ) ) ( not ( = ?auto_31445 ?auto_31444 ) ) ( not ( = ?auto_31443 ?auto_31444 ) ) ( ON ?auto_31442 ?auto_31443 ) ( CLEAR ?auto_31442 ) ( HOLDING ?auto_31444 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31444 )
      ( MAKE-1PILE ?auto_31441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31452 - BLOCK
    )
    :vars
    (
      ?auto_31455 - BLOCK
      ?auto_31456 - BLOCK
      ?auto_31453 - BLOCK
      ?auto_31454 - BLOCK
      ?auto_31457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31455 ?auto_31452 ) ( ON-TABLE ?auto_31452 ) ( not ( = ?auto_31452 ?auto_31455 ) ) ( not ( = ?auto_31452 ?auto_31456 ) ) ( not ( = ?auto_31452 ?auto_31453 ) ) ( not ( = ?auto_31455 ?auto_31456 ) ) ( not ( = ?auto_31455 ?auto_31453 ) ) ( not ( = ?auto_31456 ?auto_31453 ) ) ( ON ?auto_31456 ?auto_31455 ) ( not ( = ?auto_31454 ?auto_31453 ) ) ( not ( = ?auto_31452 ?auto_31454 ) ) ( not ( = ?auto_31455 ?auto_31454 ) ) ( not ( = ?auto_31456 ?auto_31454 ) ) ( ON ?auto_31453 ?auto_31456 ) ( CLEAR ?auto_31453 ) ( ON ?auto_31454 ?auto_31457 ) ( CLEAR ?auto_31454 ) ( HAND-EMPTY ) ( not ( = ?auto_31452 ?auto_31457 ) ) ( not ( = ?auto_31455 ?auto_31457 ) ) ( not ( = ?auto_31456 ?auto_31457 ) ) ( not ( = ?auto_31453 ?auto_31457 ) ) ( not ( = ?auto_31454 ?auto_31457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31454 ?auto_31457 )
      ( MAKE-1PILE ?auto_31452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31458 - BLOCK
    )
    :vars
    (
      ?auto_31462 - BLOCK
      ?auto_31460 - BLOCK
      ?auto_31459 - BLOCK
      ?auto_31461 - BLOCK
      ?auto_31463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31462 ?auto_31458 ) ( ON-TABLE ?auto_31458 ) ( not ( = ?auto_31458 ?auto_31462 ) ) ( not ( = ?auto_31458 ?auto_31460 ) ) ( not ( = ?auto_31458 ?auto_31459 ) ) ( not ( = ?auto_31462 ?auto_31460 ) ) ( not ( = ?auto_31462 ?auto_31459 ) ) ( not ( = ?auto_31460 ?auto_31459 ) ) ( ON ?auto_31460 ?auto_31462 ) ( not ( = ?auto_31461 ?auto_31459 ) ) ( not ( = ?auto_31458 ?auto_31461 ) ) ( not ( = ?auto_31462 ?auto_31461 ) ) ( not ( = ?auto_31460 ?auto_31461 ) ) ( ON ?auto_31461 ?auto_31463 ) ( CLEAR ?auto_31461 ) ( not ( = ?auto_31458 ?auto_31463 ) ) ( not ( = ?auto_31462 ?auto_31463 ) ) ( not ( = ?auto_31460 ?auto_31463 ) ) ( not ( = ?auto_31459 ?auto_31463 ) ) ( not ( = ?auto_31461 ?auto_31463 ) ) ( HOLDING ?auto_31459 ) ( CLEAR ?auto_31460 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31458 ?auto_31462 ?auto_31460 ?auto_31459 )
      ( MAKE-1PILE ?auto_31458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31492 - BLOCK
      ?auto_31493 - BLOCK
      ?auto_31494 - BLOCK
      ?auto_31495 - BLOCK
    )
    :vars
    (
      ?auto_31496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31492 ) ( ON ?auto_31493 ?auto_31492 ) ( not ( = ?auto_31492 ?auto_31493 ) ) ( not ( = ?auto_31492 ?auto_31494 ) ) ( not ( = ?auto_31492 ?auto_31495 ) ) ( not ( = ?auto_31493 ?auto_31494 ) ) ( not ( = ?auto_31493 ?auto_31495 ) ) ( not ( = ?auto_31494 ?auto_31495 ) ) ( ON ?auto_31495 ?auto_31496 ) ( not ( = ?auto_31492 ?auto_31496 ) ) ( not ( = ?auto_31493 ?auto_31496 ) ) ( not ( = ?auto_31494 ?auto_31496 ) ) ( not ( = ?auto_31495 ?auto_31496 ) ) ( CLEAR ?auto_31493 ) ( ON ?auto_31494 ?auto_31495 ) ( CLEAR ?auto_31494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31496 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31496 ?auto_31495 )
      ( MAKE-4PILE ?auto_31492 ?auto_31493 ?auto_31494 ?auto_31495 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31497 - BLOCK
      ?auto_31498 - BLOCK
      ?auto_31499 - BLOCK
      ?auto_31500 - BLOCK
    )
    :vars
    (
      ?auto_31501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31497 ) ( not ( = ?auto_31497 ?auto_31498 ) ) ( not ( = ?auto_31497 ?auto_31499 ) ) ( not ( = ?auto_31497 ?auto_31500 ) ) ( not ( = ?auto_31498 ?auto_31499 ) ) ( not ( = ?auto_31498 ?auto_31500 ) ) ( not ( = ?auto_31499 ?auto_31500 ) ) ( ON ?auto_31500 ?auto_31501 ) ( not ( = ?auto_31497 ?auto_31501 ) ) ( not ( = ?auto_31498 ?auto_31501 ) ) ( not ( = ?auto_31499 ?auto_31501 ) ) ( not ( = ?auto_31500 ?auto_31501 ) ) ( ON ?auto_31499 ?auto_31500 ) ( CLEAR ?auto_31499 ) ( ON-TABLE ?auto_31501 ) ( HOLDING ?auto_31498 ) ( CLEAR ?auto_31497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31497 ?auto_31498 )
      ( MAKE-4PILE ?auto_31497 ?auto_31498 ?auto_31499 ?auto_31500 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31502 - BLOCK
      ?auto_31503 - BLOCK
      ?auto_31504 - BLOCK
      ?auto_31505 - BLOCK
    )
    :vars
    (
      ?auto_31506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31502 ) ( not ( = ?auto_31502 ?auto_31503 ) ) ( not ( = ?auto_31502 ?auto_31504 ) ) ( not ( = ?auto_31502 ?auto_31505 ) ) ( not ( = ?auto_31503 ?auto_31504 ) ) ( not ( = ?auto_31503 ?auto_31505 ) ) ( not ( = ?auto_31504 ?auto_31505 ) ) ( ON ?auto_31505 ?auto_31506 ) ( not ( = ?auto_31502 ?auto_31506 ) ) ( not ( = ?auto_31503 ?auto_31506 ) ) ( not ( = ?auto_31504 ?auto_31506 ) ) ( not ( = ?auto_31505 ?auto_31506 ) ) ( ON ?auto_31504 ?auto_31505 ) ( ON-TABLE ?auto_31506 ) ( CLEAR ?auto_31502 ) ( ON ?auto_31503 ?auto_31504 ) ( CLEAR ?auto_31503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31506 ?auto_31505 ?auto_31504 )
      ( MAKE-4PILE ?auto_31502 ?auto_31503 ?auto_31504 ?auto_31505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31507 - BLOCK
      ?auto_31508 - BLOCK
      ?auto_31509 - BLOCK
      ?auto_31510 - BLOCK
    )
    :vars
    (
      ?auto_31511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31507 ?auto_31508 ) ) ( not ( = ?auto_31507 ?auto_31509 ) ) ( not ( = ?auto_31507 ?auto_31510 ) ) ( not ( = ?auto_31508 ?auto_31509 ) ) ( not ( = ?auto_31508 ?auto_31510 ) ) ( not ( = ?auto_31509 ?auto_31510 ) ) ( ON ?auto_31510 ?auto_31511 ) ( not ( = ?auto_31507 ?auto_31511 ) ) ( not ( = ?auto_31508 ?auto_31511 ) ) ( not ( = ?auto_31509 ?auto_31511 ) ) ( not ( = ?auto_31510 ?auto_31511 ) ) ( ON ?auto_31509 ?auto_31510 ) ( ON-TABLE ?auto_31511 ) ( ON ?auto_31508 ?auto_31509 ) ( CLEAR ?auto_31508 ) ( HOLDING ?auto_31507 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31507 )
      ( MAKE-4PILE ?auto_31507 ?auto_31508 ?auto_31509 ?auto_31510 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31512 - BLOCK
      ?auto_31513 - BLOCK
      ?auto_31514 - BLOCK
      ?auto_31515 - BLOCK
    )
    :vars
    (
      ?auto_31516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31512 ?auto_31513 ) ) ( not ( = ?auto_31512 ?auto_31514 ) ) ( not ( = ?auto_31512 ?auto_31515 ) ) ( not ( = ?auto_31513 ?auto_31514 ) ) ( not ( = ?auto_31513 ?auto_31515 ) ) ( not ( = ?auto_31514 ?auto_31515 ) ) ( ON ?auto_31515 ?auto_31516 ) ( not ( = ?auto_31512 ?auto_31516 ) ) ( not ( = ?auto_31513 ?auto_31516 ) ) ( not ( = ?auto_31514 ?auto_31516 ) ) ( not ( = ?auto_31515 ?auto_31516 ) ) ( ON ?auto_31514 ?auto_31515 ) ( ON-TABLE ?auto_31516 ) ( ON ?auto_31513 ?auto_31514 ) ( ON ?auto_31512 ?auto_31513 ) ( CLEAR ?auto_31512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31516 ?auto_31515 ?auto_31514 ?auto_31513 )
      ( MAKE-4PILE ?auto_31512 ?auto_31513 ?auto_31514 ?auto_31515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31521 - BLOCK
      ?auto_31522 - BLOCK
      ?auto_31523 - BLOCK
      ?auto_31524 - BLOCK
    )
    :vars
    (
      ?auto_31525 - BLOCK
      ?auto_31526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31521 ?auto_31522 ) ) ( not ( = ?auto_31521 ?auto_31523 ) ) ( not ( = ?auto_31521 ?auto_31524 ) ) ( not ( = ?auto_31522 ?auto_31523 ) ) ( not ( = ?auto_31522 ?auto_31524 ) ) ( not ( = ?auto_31523 ?auto_31524 ) ) ( ON ?auto_31524 ?auto_31525 ) ( not ( = ?auto_31521 ?auto_31525 ) ) ( not ( = ?auto_31522 ?auto_31525 ) ) ( not ( = ?auto_31523 ?auto_31525 ) ) ( not ( = ?auto_31524 ?auto_31525 ) ) ( ON ?auto_31523 ?auto_31524 ) ( ON-TABLE ?auto_31525 ) ( ON ?auto_31522 ?auto_31523 ) ( CLEAR ?auto_31522 ) ( ON ?auto_31521 ?auto_31526 ) ( CLEAR ?auto_31521 ) ( HAND-EMPTY ) ( not ( = ?auto_31521 ?auto_31526 ) ) ( not ( = ?auto_31522 ?auto_31526 ) ) ( not ( = ?auto_31523 ?auto_31526 ) ) ( not ( = ?auto_31524 ?auto_31526 ) ) ( not ( = ?auto_31525 ?auto_31526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31521 ?auto_31526 )
      ( MAKE-4PILE ?auto_31521 ?auto_31522 ?auto_31523 ?auto_31524 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31527 - BLOCK
      ?auto_31528 - BLOCK
      ?auto_31529 - BLOCK
      ?auto_31530 - BLOCK
    )
    :vars
    (
      ?auto_31531 - BLOCK
      ?auto_31532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31527 ?auto_31528 ) ) ( not ( = ?auto_31527 ?auto_31529 ) ) ( not ( = ?auto_31527 ?auto_31530 ) ) ( not ( = ?auto_31528 ?auto_31529 ) ) ( not ( = ?auto_31528 ?auto_31530 ) ) ( not ( = ?auto_31529 ?auto_31530 ) ) ( ON ?auto_31530 ?auto_31531 ) ( not ( = ?auto_31527 ?auto_31531 ) ) ( not ( = ?auto_31528 ?auto_31531 ) ) ( not ( = ?auto_31529 ?auto_31531 ) ) ( not ( = ?auto_31530 ?auto_31531 ) ) ( ON ?auto_31529 ?auto_31530 ) ( ON-TABLE ?auto_31531 ) ( ON ?auto_31527 ?auto_31532 ) ( CLEAR ?auto_31527 ) ( not ( = ?auto_31527 ?auto_31532 ) ) ( not ( = ?auto_31528 ?auto_31532 ) ) ( not ( = ?auto_31529 ?auto_31532 ) ) ( not ( = ?auto_31530 ?auto_31532 ) ) ( not ( = ?auto_31531 ?auto_31532 ) ) ( HOLDING ?auto_31528 ) ( CLEAR ?auto_31529 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31531 ?auto_31530 ?auto_31529 ?auto_31528 )
      ( MAKE-4PILE ?auto_31527 ?auto_31528 ?auto_31529 ?auto_31530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31533 - BLOCK
      ?auto_31534 - BLOCK
      ?auto_31535 - BLOCK
      ?auto_31536 - BLOCK
    )
    :vars
    (
      ?auto_31538 - BLOCK
      ?auto_31537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31533 ?auto_31534 ) ) ( not ( = ?auto_31533 ?auto_31535 ) ) ( not ( = ?auto_31533 ?auto_31536 ) ) ( not ( = ?auto_31534 ?auto_31535 ) ) ( not ( = ?auto_31534 ?auto_31536 ) ) ( not ( = ?auto_31535 ?auto_31536 ) ) ( ON ?auto_31536 ?auto_31538 ) ( not ( = ?auto_31533 ?auto_31538 ) ) ( not ( = ?auto_31534 ?auto_31538 ) ) ( not ( = ?auto_31535 ?auto_31538 ) ) ( not ( = ?auto_31536 ?auto_31538 ) ) ( ON ?auto_31535 ?auto_31536 ) ( ON-TABLE ?auto_31538 ) ( ON ?auto_31533 ?auto_31537 ) ( not ( = ?auto_31533 ?auto_31537 ) ) ( not ( = ?auto_31534 ?auto_31537 ) ) ( not ( = ?auto_31535 ?auto_31537 ) ) ( not ( = ?auto_31536 ?auto_31537 ) ) ( not ( = ?auto_31538 ?auto_31537 ) ) ( CLEAR ?auto_31535 ) ( ON ?auto_31534 ?auto_31533 ) ( CLEAR ?auto_31534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31537 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31537 ?auto_31533 )
      ( MAKE-4PILE ?auto_31533 ?auto_31534 ?auto_31535 ?auto_31536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31539 - BLOCK
      ?auto_31540 - BLOCK
      ?auto_31541 - BLOCK
      ?auto_31542 - BLOCK
    )
    :vars
    (
      ?auto_31544 - BLOCK
      ?auto_31543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31539 ?auto_31540 ) ) ( not ( = ?auto_31539 ?auto_31541 ) ) ( not ( = ?auto_31539 ?auto_31542 ) ) ( not ( = ?auto_31540 ?auto_31541 ) ) ( not ( = ?auto_31540 ?auto_31542 ) ) ( not ( = ?auto_31541 ?auto_31542 ) ) ( ON ?auto_31542 ?auto_31544 ) ( not ( = ?auto_31539 ?auto_31544 ) ) ( not ( = ?auto_31540 ?auto_31544 ) ) ( not ( = ?auto_31541 ?auto_31544 ) ) ( not ( = ?auto_31542 ?auto_31544 ) ) ( ON-TABLE ?auto_31544 ) ( ON ?auto_31539 ?auto_31543 ) ( not ( = ?auto_31539 ?auto_31543 ) ) ( not ( = ?auto_31540 ?auto_31543 ) ) ( not ( = ?auto_31541 ?auto_31543 ) ) ( not ( = ?auto_31542 ?auto_31543 ) ) ( not ( = ?auto_31544 ?auto_31543 ) ) ( ON ?auto_31540 ?auto_31539 ) ( CLEAR ?auto_31540 ) ( ON-TABLE ?auto_31543 ) ( HOLDING ?auto_31541 ) ( CLEAR ?auto_31542 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31544 ?auto_31542 ?auto_31541 )
      ( MAKE-4PILE ?auto_31539 ?auto_31540 ?auto_31541 ?auto_31542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31545 - BLOCK
      ?auto_31546 - BLOCK
      ?auto_31547 - BLOCK
      ?auto_31548 - BLOCK
    )
    :vars
    (
      ?auto_31549 - BLOCK
      ?auto_31550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31545 ?auto_31546 ) ) ( not ( = ?auto_31545 ?auto_31547 ) ) ( not ( = ?auto_31545 ?auto_31548 ) ) ( not ( = ?auto_31546 ?auto_31547 ) ) ( not ( = ?auto_31546 ?auto_31548 ) ) ( not ( = ?auto_31547 ?auto_31548 ) ) ( ON ?auto_31548 ?auto_31549 ) ( not ( = ?auto_31545 ?auto_31549 ) ) ( not ( = ?auto_31546 ?auto_31549 ) ) ( not ( = ?auto_31547 ?auto_31549 ) ) ( not ( = ?auto_31548 ?auto_31549 ) ) ( ON-TABLE ?auto_31549 ) ( ON ?auto_31545 ?auto_31550 ) ( not ( = ?auto_31545 ?auto_31550 ) ) ( not ( = ?auto_31546 ?auto_31550 ) ) ( not ( = ?auto_31547 ?auto_31550 ) ) ( not ( = ?auto_31548 ?auto_31550 ) ) ( not ( = ?auto_31549 ?auto_31550 ) ) ( ON ?auto_31546 ?auto_31545 ) ( ON-TABLE ?auto_31550 ) ( CLEAR ?auto_31548 ) ( ON ?auto_31547 ?auto_31546 ) ( CLEAR ?auto_31547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31550 ?auto_31545 ?auto_31546 )
      ( MAKE-4PILE ?auto_31545 ?auto_31546 ?auto_31547 ?auto_31548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31551 - BLOCK
      ?auto_31552 - BLOCK
      ?auto_31553 - BLOCK
      ?auto_31554 - BLOCK
    )
    :vars
    (
      ?auto_31555 - BLOCK
      ?auto_31556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31551 ?auto_31552 ) ) ( not ( = ?auto_31551 ?auto_31553 ) ) ( not ( = ?auto_31551 ?auto_31554 ) ) ( not ( = ?auto_31552 ?auto_31553 ) ) ( not ( = ?auto_31552 ?auto_31554 ) ) ( not ( = ?auto_31553 ?auto_31554 ) ) ( not ( = ?auto_31551 ?auto_31555 ) ) ( not ( = ?auto_31552 ?auto_31555 ) ) ( not ( = ?auto_31553 ?auto_31555 ) ) ( not ( = ?auto_31554 ?auto_31555 ) ) ( ON-TABLE ?auto_31555 ) ( ON ?auto_31551 ?auto_31556 ) ( not ( = ?auto_31551 ?auto_31556 ) ) ( not ( = ?auto_31552 ?auto_31556 ) ) ( not ( = ?auto_31553 ?auto_31556 ) ) ( not ( = ?auto_31554 ?auto_31556 ) ) ( not ( = ?auto_31555 ?auto_31556 ) ) ( ON ?auto_31552 ?auto_31551 ) ( ON-TABLE ?auto_31556 ) ( ON ?auto_31553 ?auto_31552 ) ( CLEAR ?auto_31553 ) ( HOLDING ?auto_31554 ) ( CLEAR ?auto_31555 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31555 ?auto_31554 )
      ( MAKE-4PILE ?auto_31551 ?auto_31552 ?auto_31553 ?auto_31554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31557 - BLOCK
      ?auto_31558 - BLOCK
      ?auto_31559 - BLOCK
      ?auto_31560 - BLOCK
    )
    :vars
    (
      ?auto_31561 - BLOCK
      ?auto_31562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31557 ?auto_31558 ) ) ( not ( = ?auto_31557 ?auto_31559 ) ) ( not ( = ?auto_31557 ?auto_31560 ) ) ( not ( = ?auto_31558 ?auto_31559 ) ) ( not ( = ?auto_31558 ?auto_31560 ) ) ( not ( = ?auto_31559 ?auto_31560 ) ) ( not ( = ?auto_31557 ?auto_31561 ) ) ( not ( = ?auto_31558 ?auto_31561 ) ) ( not ( = ?auto_31559 ?auto_31561 ) ) ( not ( = ?auto_31560 ?auto_31561 ) ) ( ON-TABLE ?auto_31561 ) ( ON ?auto_31557 ?auto_31562 ) ( not ( = ?auto_31557 ?auto_31562 ) ) ( not ( = ?auto_31558 ?auto_31562 ) ) ( not ( = ?auto_31559 ?auto_31562 ) ) ( not ( = ?auto_31560 ?auto_31562 ) ) ( not ( = ?auto_31561 ?auto_31562 ) ) ( ON ?auto_31558 ?auto_31557 ) ( ON-TABLE ?auto_31562 ) ( ON ?auto_31559 ?auto_31558 ) ( CLEAR ?auto_31561 ) ( ON ?auto_31560 ?auto_31559 ) ( CLEAR ?auto_31560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31562 ?auto_31557 ?auto_31558 ?auto_31559 )
      ( MAKE-4PILE ?auto_31557 ?auto_31558 ?auto_31559 ?auto_31560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31563 - BLOCK
      ?auto_31564 - BLOCK
      ?auto_31565 - BLOCK
      ?auto_31566 - BLOCK
    )
    :vars
    (
      ?auto_31567 - BLOCK
      ?auto_31568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31563 ?auto_31564 ) ) ( not ( = ?auto_31563 ?auto_31565 ) ) ( not ( = ?auto_31563 ?auto_31566 ) ) ( not ( = ?auto_31564 ?auto_31565 ) ) ( not ( = ?auto_31564 ?auto_31566 ) ) ( not ( = ?auto_31565 ?auto_31566 ) ) ( not ( = ?auto_31563 ?auto_31567 ) ) ( not ( = ?auto_31564 ?auto_31567 ) ) ( not ( = ?auto_31565 ?auto_31567 ) ) ( not ( = ?auto_31566 ?auto_31567 ) ) ( ON ?auto_31563 ?auto_31568 ) ( not ( = ?auto_31563 ?auto_31568 ) ) ( not ( = ?auto_31564 ?auto_31568 ) ) ( not ( = ?auto_31565 ?auto_31568 ) ) ( not ( = ?auto_31566 ?auto_31568 ) ) ( not ( = ?auto_31567 ?auto_31568 ) ) ( ON ?auto_31564 ?auto_31563 ) ( ON-TABLE ?auto_31568 ) ( ON ?auto_31565 ?auto_31564 ) ( ON ?auto_31566 ?auto_31565 ) ( CLEAR ?auto_31566 ) ( HOLDING ?auto_31567 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31567 )
      ( MAKE-4PILE ?auto_31563 ?auto_31564 ?auto_31565 ?auto_31566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31569 - BLOCK
      ?auto_31570 - BLOCK
      ?auto_31571 - BLOCK
      ?auto_31572 - BLOCK
    )
    :vars
    (
      ?auto_31573 - BLOCK
      ?auto_31574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31569 ?auto_31570 ) ) ( not ( = ?auto_31569 ?auto_31571 ) ) ( not ( = ?auto_31569 ?auto_31572 ) ) ( not ( = ?auto_31570 ?auto_31571 ) ) ( not ( = ?auto_31570 ?auto_31572 ) ) ( not ( = ?auto_31571 ?auto_31572 ) ) ( not ( = ?auto_31569 ?auto_31573 ) ) ( not ( = ?auto_31570 ?auto_31573 ) ) ( not ( = ?auto_31571 ?auto_31573 ) ) ( not ( = ?auto_31572 ?auto_31573 ) ) ( ON ?auto_31569 ?auto_31574 ) ( not ( = ?auto_31569 ?auto_31574 ) ) ( not ( = ?auto_31570 ?auto_31574 ) ) ( not ( = ?auto_31571 ?auto_31574 ) ) ( not ( = ?auto_31572 ?auto_31574 ) ) ( not ( = ?auto_31573 ?auto_31574 ) ) ( ON ?auto_31570 ?auto_31569 ) ( ON-TABLE ?auto_31574 ) ( ON ?auto_31571 ?auto_31570 ) ( ON ?auto_31572 ?auto_31571 ) ( ON ?auto_31573 ?auto_31572 ) ( CLEAR ?auto_31573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31574 ?auto_31569 ?auto_31570 ?auto_31571 ?auto_31572 )
      ( MAKE-4PILE ?auto_31569 ?auto_31570 ?auto_31571 ?auto_31572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31585 - BLOCK
      ?auto_31586 - BLOCK
      ?auto_31587 - BLOCK
      ?auto_31588 - BLOCK
      ?auto_31589 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31588 ) ( ON-TABLE ?auto_31585 ) ( ON ?auto_31586 ?auto_31585 ) ( ON ?auto_31587 ?auto_31586 ) ( ON ?auto_31588 ?auto_31587 ) ( not ( = ?auto_31585 ?auto_31586 ) ) ( not ( = ?auto_31585 ?auto_31587 ) ) ( not ( = ?auto_31585 ?auto_31588 ) ) ( not ( = ?auto_31585 ?auto_31589 ) ) ( not ( = ?auto_31586 ?auto_31587 ) ) ( not ( = ?auto_31586 ?auto_31588 ) ) ( not ( = ?auto_31586 ?auto_31589 ) ) ( not ( = ?auto_31587 ?auto_31588 ) ) ( not ( = ?auto_31587 ?auto_31589 ) ) ( not ( = ?auto_31588 ?auto_31589 ) ) ( ON-TABLE ?auto_31589 ) ( CLEAR ?auto_31589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_31589 )
      ( MAKE-5PILE ?auto_31585 ?auto_31586 ?auto_31587 ?auto_31588 ?auto_31589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31590 - BLOCK
      ?auto_31591 - BLOCK
      ?auto_31592 - BLOCK
      ?auto_31593 - BLOCK
      ?auto_31594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31590 ) ( ON ?auto_31591 ?auto_31590 ) ( ON ?auto_31592 ?auto_31591 ) ( not ( = ?auto_31590 ?auto_31591 ) ) ( not ( = ?auto_31590 ?auto_31592 ) ) ( not ( = ?auto_31590 ?auto_31593 ) ) ( not ( = ?auto_31590 ?auto_31594 ) ) ( not ( = ?auto_31591 ?auto_31592 ) ) ( not ( = ?auto_31591 ?auto_31593 ) ) ( not ( = ?auto_31591 ?auto_31594 ) ) ( not ( = ?auto_31592 ?auto_31593 ) ) ( not ( = ?auto_31592 ?auto_31594 ) ) ( not ( = ?auto_31593 ?auto_31594 ) ) ( ON-TABLE ?auto_31594 ) ( CLEAR ?auto_31594 ) ( HOLDING ?auto_31593 ) ( CLEAR ?auto_31592 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31590 ?auto_31591 ?auto_31592 ?auto_31593 )
      ( MAKE-5PILE ?auto_31590 ?auto_31591 ?auto_31592 ?auto_31593 ?auto_31594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31595 - BLOCK
      ?auto_31596 - BLOCK
      ?auto_31597 - BLOCK
      ?auto_31598 - BLOCK
      ?auto_31599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31595 ) ( ON ?auto_31596 ?auto_31595 ) ( ON ?auto_31597 ?auto_31596 ) ( not ( = ?auto_31595 ?auto_31596 ) ) ( not ( = ?auto_31595 ?auto_31597 ) ) ( not ( = ?auto_31595 ?auto_31598 ) ) ( not ( = ?auto_31595 ?auto_31599 ) ) ( not ( = ?auto_31596 ?auto_31597 ) ) ( not ( = ?auto_31596 ?auto_31598 ) ) ( not ( = ?auto_31596 ?auto_31599 ) ) ( not ( = ?auto_31597 ?auto_31598 ) ) ( not ( = ?auto_31597 ?auto_31599 ) ) ( not ( = ?auto_31598 ?auto_31599 ) ) ( ON-TABLE ?auto_31599 ) ( CLEAR ?auto_31597 ) ( ON ?auto_31598 ?auto_31599 ) ( CLEAR ?auto_31598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31599 )
      ( MAKE-5PILE ?auto_31595 ?auto_31596 ?auto_31597 ?auto_31598 ?auto_31599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31600 - BLOCK
      ?auto_31601 - BLOCK
      ?auto_31602 - BLOCK
      ?auto_31603 - BLOCK
      ?auto_31604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31600 ) ( ON ?auto_31601 ?auto_31600 ) ( not ( = ?auto_31600 ?auto_31601 ) ) ( not ( = ?auto_31600 ?auto_31602 ) ) ( not ( = ?auto_31600 ?auto_31603 ) ) ( not ( = ?auto_31600 ?auto_31604 ) ) ( not ( = ?auto_31601 ?auto_31602 ) ) ( not ( = ?auto_31601 ?auto_31603 ) ) ( not ( = ?auto_31601 ?auto_31604 ) ) ( not ( = ?auto_31602 ?auto_31603 ) ) ( not ( = ?auto_31602 ?auto_31604 ) ) ( not ( = ?auto_31603 ?auto_31604 ) ) ( ON-TABLE ?auto_31604 ) ( ON ?auto_31603 ?auto_31604 ) ( CLEAR ?auto_31603 ) ( HOLDING ?auto_31602 ) ( CLEAR ?auto_31601 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31600 ?auto_31601 ?auto_31602 )
      ( MAKE-5PILE ?auto_31600 ?auto_31601 ?auto_31602 ?auto_31603 ?auto_31604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31605 - BLOCK
      ?auto_31606 - BLOCK
      ?auto_31607 - BLOCK
      ?auto_31608 - BLOCK
      ?auto_31609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31605 ) ( ON ?auto_31606 ?auto_31605 ) ( not ( = ?auto_31605 ?auto_31606 ) ) ( not ( = ?auto_31605 ?auto_31607 ) ) ( not ( = ?auto_31605 ?auto_31608 ) ) ( not ( = ?auto_31605 ?auto_31609 ) ) ( not ( = ?auto_31606 ?auto_31607 ) ) ( not ( = ?auto_31606 ?auto_31608 ) ) ( not ( = ?auto_31606 ?auto_31609 ) ) ( not ( = ?auto_31607 ?auto_31608 ) ) ( not ( = ?auto_31607 ?auto_31609 ) ) ( not ( = ?auto_31608 ?auto_31609 ) ) ( ON-TABLE ?auto_31609 ) ( ON ?auto_31608 ?auto_31609 ) ( CLEAR ?auto_31606 ) ( ON ?auto_31607 ?auto_31608 ) ( CLEAR ?auto_31607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31609 ?auto_31608 )
      ( MAKE-5PILE ?auto_31605 ?auto_31606 ?auto_31607 ?auto_31608 ?auto_31609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31610 - BLOCK
      ?auto_31611 - BLOCK
      ?auto_31612 - BLOCK
      ?auto_31613 - BLOCK
      ?auto_31614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31610 ) ( not ( = ?auto_31610 ?auto_31611 ) ) ( not ( = ?auto_31610 ?auto_31612 ) ) ( not ( = ?auto_31610 ?auto_31613 ) ) ( not ( = ?auto_31610 ?auto_31614 ) ) ( not ( = ?auto_31611 ?auto_31612 ) ) ( not ( = ?auto_31611 ?auto_31613 ) ) ( not ( = ?auto_31611 ?auto_31614 ) ) ( not ( = ?auto_31612 ?auto_31613 ) ) ( not ( = ?auto_31612 ?auto_31614 ) ) ( not ( = ?auto_31613 ?auto_31614 ) ) ( ON-TABLE ?auto_31614 ) ( ON ?auto_31613 ?auto_31614 ) ( ON ?auto_31612 ?auto_31613 ) ( CLEAR ?auto_31612 ) ( HOLDING ?auto_31611 ) ( CLEAR ?auto_31610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31610 ?auto_31611 )
      ( MAKE-5PILE ?auto_31610 ?auto_31611 ?auto_31612 ?auto_31613 ?auto_31614 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31615 - BLOCK
      ?auto_31616 - BLOCK
      ?auto_31617 - BLOCK
      ?auto_31618 - BLOCK
      ?auto_31619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31615 ) ( not ( = ?auto_31615 ?auto_31616 ) ) ( not ( = ?auto_31615 ?auto_31617 ) ) ( not ( = ?auto_31615 ?auto_31618 ) ) ( not ( = ?auto_31615 ?auto_31619 ) ) ( not ( = ?auto_31616 ?auto_31617 ) ) ( not ( = ?auto_31616 ?auto_31618 ) ) ( not ( = ?auto_31616 ?auto_31619 ) ) ( not ( = ?auto_31617 ?auto_31618 ) ) ( not ( = ?auto_31617 ?auto_31619 ) ) ( not ( = ?auto_31618 ?auto_31619 ) ) ( ON-TABLE ?auto_31619 ) ( ON ?auto_31618 ?auto_31619 ) ( ON ?auto_31617 ?auto_31618 ) ( CLEAR ?auto_31615 ) ( ON ?auto_31616 ?auto_31617 ) ( CLEAR ?auto_31616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31619 ?auto_31618 ?auto_31617 )
      ( MAKE-5PILE ?auto_31615 ?auto_31616 ?auto_31617 ?auto_31618 ?auto_31619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31620 - BLOCK
      ?auto_31621 - BLOCK
      ?auto_31622 - BLOCK
      ?auto_31623 - BLOCK
      ?auto_31624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31620 ?auto_31621 ) ) ( not ( = ?auto_31620 ?auto_31622 ) ) ( not ( = ?auto_31620 ?auto_31623 ) ) ( not ( = ?auto_31620 ?auto_31624 ) ) ( not ( = ?auto_31621 ?auto_31622 ) ) ( not ( = ?auto_31621 ?auto_31623 ) ) ( not ( = ?auto_31621 ?auto_31624 ) ) ( not ( = ?auto_31622 ?auto_31623 ) ) ( not ( = ?auto_31622 ?auto_31624 ) ) ( not ( = ?auto_31623 ?auto_31624 ) ) ( ON-TABLE ?auto_31624 ) ( ON ?auto_31623 ?auto_31624 ) ( ON ?auto_31622 ?auto_31623 ) ( ON ?auto_31621 ?auto_31622 ) ( CLEAR ?auto_31621 ) ( HOLDING ?auto_31620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31620 )
      ( MAKE-5PILE ?auto_31620 ?auto_31621 ?auto_31622 ?auto_31623 ?auto_31624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31625 - BLOCK
      ?auto_31626 - BLOCK
      ?auto_31627 - BLOCK
      ?auto_31628 - BLOCK
      ?auto_31629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31625 ?auto_31626 ) ) ( not ( = ?auto_31625 ?auto_31627 ) ) ( not ( = ?auto_31625 ?auto_31628 ) ) ( not ( = ?auto_31625 ?auto_31629 ) ) ( not ( = ?auto_31626 ?auto_31627 ) ) ( not ( = ?auto_31626 ?auto_31628 ) ) ( not ( = ?auto_31626 ?auto_31629 ) ) ( not ( = ?auto_31627 ?auto_31628 ) ) ( not ( = ?auto_31627 ?auto_31629 ) ) ( not ( = ?auto_31628 ?auto_31629 ) ) ( ON-TABLE ?auto_31629 ) ( ON ?auto_31628 ?auto_31629 ) ( ON ?auto_31627 ?auto_31628 ) ( ON ?auto_31626 ?auto_31627 ) ( ON ?auto_31625 ?auto_31626 ) ( CLEAR ?auto_31625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31629 ?auto_31628 ?auto_31627 ?auto_31626 )
      ( MAKE-5PILE ?auto_31625 ?auto_31626 ?auto_31627 ?auto_31628 ?auto_31629 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31635 - BLOCK
      ?auto_31636 - BLOCK
      ?auto_31637 - BLOCK
      ?auto_31638 - BLOCK
      ?auto_31639 - BLOCK
    )
    :vars
    (
      ?auto_31640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31635 ?auto_31636 ) ) ( not ( = ?auto_31635 ?auto_31637 ) ) ( not ( = ?auto_31635 ?auto_31638 ) ) ( not ( = ?auto_31635 ?auto_31639 ) ) ( not ( = ?auto_31636 ?auto_31637 ) ) ( not ( = ?auto_31636 ?auto_31638 ) ) ( not ( = ?auto_31636 ?auto_31639 ) ) ( not ( = ?auto_31637 ?auto_31638 ) ) ( not ( = ?auto_31637 ?auto_31639 ) ) ( not ( = ?auto_31638 ?auto_31639 ) ) ( ON-TABLE ?auto_31639 ) ( ON ?auto_31638 ?auto_31639 ) ( ON ?auto_31637 ?auto_31638 ) ( ON ?auto_31636 ?auto_31637 ) ( CLEAR ?auto_31636 ) ( ON ?auto_31635 ?auto_31640 ) ( CLEAR ?auto_31635 ) ( HAND-EMPTY ) ( not ( = ?auto_31635 ?auto_31640 ) ) ( not ( = ?auto_31636 ?auto_31640 ) ) ( not ( = ?auto_31637 ?auto_31640 ) ) ( not ( = ?auto_31638 ?auto_31640 ) ) ( not ( = ?auto_31639 ?auto_31640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31635 ?auto_31640 )
      ( MAKE-5PILE ?auto_31635 ?auto_31636 ?auto_31637 ?auto_31638 ?auto_31639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31641 - BLOCK
      ?auto_31642 - BLOCK
      ?auto_31643 - BLOCK
      ?auto_31644 - BLOCK
      ?auto_31645 - BLOCK
    )
    :vars
    (
      ?auto_31646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31641 ?auto_31642 ) ) ( not ( = ?auto_31641 ?auto_31643 ) ) ( not ( = ?auto_31641 ?auto_31644 ) ) ( not ( = ?auto_31641 ?auto_31645 ) ) ( not ( = ?auto_31642 ?auto_31643 ) ) ( not ( = ?auto_31642 ?auto_31644 ) ) ( not ( = ?auto_31642 ?auto_31645 ) ) ( not ( = ?auto_31643 ?auto_31644 ) ) ( not ( = ?auto_31643 ?auto_31645 ) ) ( not ( = ?auto_31644 ?auto_31645 ) ) ( ON-TABLE ?auto_31645 ) ( ON ?auto_31644 ?auto_31645 ) ( ON ?auto_31643 ?auto_31644 ) ( ON ?auto_31641 ?auto_31646 ) ( CLEAR ?auto_31641 ) ( not ( = ?auto_31641 ?auto_31646 ) ) ( not ( = ?auto_31642 ?auto_31646 ) ) ( not ( = ?auto_31643 ?auto_31646 ) ) ( not ( = ?auto_31644 ?auto_31646 ) ) ( not ( = ?auto_31645 ?auto_31646 ) ) ( HOLDING ?auto_31642 ) ( CLEAR ?auto_31643 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31645 ?auto_31644 ?auto_31643 ?auto_31642 )
      ( MAKE-5PILE ?auto_31641 ?auto_31642 ?auto_31643 ?auto_31644 ?auto_31645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31647 - BLOCK
      ?auto_31648 - BLOCK
      ?auto_31649 - BLOCK
      ?auto_31650 - BLOCK
      ?auto_31651 - BLOCK
    )
    :vars
    (
      ?auto_31652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31647 ?auto_31648 ) ) ( not ( = ?auto_31647 ?auto_31649 ) ) ( not ( = ?auto_31647 ?auto_31650 ) ) ( not ( = ?auto_31647 ?auto_31651 ) ) ( not ( = ?auto_31648 ?auto_31649 ) ) ( not ( = ?auto_31648 ?auto_31650 ) ) ( not ( = ?auto_31648 ?auto_31651 ) ) ( not ( = ?auto_31649 ?auto_31650 ) ) ( not ( = ?auto_31649 ?auto_31651 ) ) ( not ( = ?auto_31650 ?auto_31651 ) ) ( ON-TABLE ?auto_31651 ) ( ON ?auto_31650 ?auto_31651 ) ( ON ?auto_31649 ?auto_31650 ) ( ON ?auto_31647 ?auto_31652 ) ( not ( = ?auto_31647 ?auto_31652 ) ) ( not ( = ?auto_31648 ?auto_31652 ) ) ( not ( = ?auto_31649 ?auto_31652 ) ) ( not ( = ?auto_31650 ?auto_31652 ) ) ( not ( = ?auto_31651 ?auto_31652 ) ) ( CLEAR ?auto_31649 ) ( ON ?auto_31648 ?auto_31647 ) ( CLEAR ?auto_31648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31652 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31652 ?auto_31647 )
      ( MAKE-5PILE ?auto_31647 ?auto_31648 ?auto_31649 ?auto_31650 ?auto_31651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31653 - BLOCK
      ?auto_31654 - BLOCK
      ?auto_31655 - BLOCK
      ?auto_31656 - BLOCK
      ?auto_31657 - BLOCK
    )
    :vars
    (
      ?auto_31658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31653 ?auto_31654 ) ) ( not ( = ?auto_31653 ?auto_31655 ) ) ( not ( = ?auto_31653 ?auto_31656 ) ) ( not ( = ?auto_31653 ?auto_31657 ) ) ( not ( = ?auto_31654 ?auto_31655 ) ) ( not ( = ?auto_31654 ?auto_31656 ) ) ( not ( = ?auto_31654 ?auto_31657 ) ) ( not ( = ?auto_31655 ?auto_31656 ) ) ( not ( = ?auto_31655 ?auto_31657 ) ) ( not ( = ?auto_31656 ?auto_31657 ) ) ( ON-TABLE ?auto_31657 ) ( ON ?auto_31656 ?auto_31657 ) ( ON ?auto_31653 ?auto_31658 ) ( not ( = ?auto_31653 ?auto_31658 ) ) ( not ( = ?auto_31654 ?auto_31658 ) ) ( not ( = ?auto_31655 ?auto_31658 ) ) ( not ( = ?auto_31656 ?auto_31658 ) ) ( not ( = ?auto_31657 ?auto_31658 ) ) ( ON ?auto_31654 ?auto_31653 ) ( CLEAR ?auto_31654 ) ( ON-TABLE ?auto_31658 ) ( HOLDING ?auto_31655 ) ( CLEAR ?auto_31656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31657 ?auto_31656 ?auto_31655 )
      ( MAKE-5PILE ?auto_31653 ?auto_31654 ?auto_31655 ?auto_31656 ?auto_31657 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31659 - BLOCK
      ?auto_31660 - BLOCK
      ?auto_31661 - BLOCK
      ?auto_31662 - BLOCK
      ?auto_31663 - BLOCK
    )
    :vars
    (
      ?auto_31664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31659 ?auto_31660 ) ) ( not ( = ?auto_31659 ?auto_31661 ) ) ( not ( = ?auto_31659 ?auto_31662 ) ) ( not ( = ?auto_31659 ?auto_31663 ) ) ( not ( = ?auto_31660 ?auto_31661 ) ) ( not ( = ?auto_31660 ?auto_31662 ) ) ( not ( = ?auto_31660 ?auto_31663 ) ) ( not ( = ?auto_31661 ?auto_31662 ) ) ( not ( = ?auto_31661 ?auto_31663 ) ) ( not ( = ?auto_31662 ?auto_31663 ) ) ( ON-TABLE ?auto_31663 ) ( ON ?auto_31662 ?auto_31663 ) ( ON ?auto_31659 ?auto_31664 ) ( not ( = ?auto_31659 ?auto_31664 ) ) ( not ( = ?auto_31660 ?auto_31664 ) ) ( not ( = ?auto_31661 ?auto_31664 ) ) ( not ( = ?auto_31662 ?auto_31664 ) ) ( not ( = ?auto_31663 ?auto_31664 ) ) ( ON ?auto_31660 ?auto_31659 ) ( ON-TABLE ?auto_31664 ) ( CLEAR ?auto_31662 ) ( ON ?auto_31661 ?auto_31660 ) ( CLEAR ?auto_31661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31664 ?auto_31659 ?auto_31660 )
      ( MAKE-5PILE ?auto_31659 ?auto_31660 ?auto_31661 ?auto_31662 ?auto_31663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31665 - BLOCK
      ?auto_31666 - BLOCK
      ?auto_31667 - BLOCK
      ?auto_31668 - BLOCK
      ?auto_31669 - BLOCK
    )
    :vars
    (
      ?auto_31670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31665 ?auto_31666 ) ) ( not ( = ?auto_31665 ?auto_31667 ) ) ( not ( = ?auto_31665 ?auto_31668 ) ) ( not ( = ?auto_31665 ?auto_31669 ) ) ( not ( = ?auto_31666 ?auto_31667 ) ) ( not ( = ?auto_31666 ?auto_31668 ) ) ( not ( = ?auto_31666 ?auto_31669 ) ) ( not ( = ?auto_31667 ?auto_31668 ) ) ( not ( = ?auto_31667 ?auto_31669 ) ) ( not ( = ?auto_31668 ?auto_31669 ) ) ( ON-TABLE ?auto_31669 ) ( ON ?auto_31665 ?auto_31670 ) ( not ( = ?auto_31665 ?auto_31670 ) ) ( not ( = ?auto_31666 ?auto_31670 ) ) ( not ( = ?auto_31667 ?auto_31670 ) ) ( not ( = ?auto_31668 ?auto_31670 ) ) ( not ( = ?auto_31669 ?auto_31670 ) ) ( ON ?auto_31666 ?auto_31665 ) ( ON-TABLE ?auto_31670 ) ( ON ?auto_31667 ?auto_31666 ) ( CLEAR ?auto_31667 ) ( HOLDING ?auto_31668 ) ( CLEAR ?auto_31669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31669 ?auto_31668 )
      ( MAKE-5PILE ?auto_31665 ?auto_31666 ?auto_31667 ?auto_31668 ?auto_31669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31671 - BLOCK
      ?auto_31672 - BLOCK
      ?auto_31673 - BLOCK
      ?auto_31674 - BLOCK
      ?auto_31675 - BLOCK
    )
    :vars
    (
      ?auto_31676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31671 ?auto_31672 ) ) ( not ( = ?auto_31671 ?auto_31673 ) ) ( not ( = ?auto_31671 ?auto_31674 ) ) ( not ( = ?auto_31671 ?auto_31675 ) ) ( not ( = ?auto_31672 ?auto_31673 ) ) ( not ( = ?auto_31672 ?auto_31674 ) ) ( not ( = ?auto_31672 ?auto_31675 ) ) ( not ( = ?auto_31673 ?auto_31674 ) ) ( not ( = ?auto_31673 ?auto_31675 ) ) ( not ( = ?auto_31674 ?auto_31675 ) ) ( ON-TABLE ?auto_31675 ) ( ON ?auto_31671 ?auto_31676 ) ( not ( = ?auto_31671 ?auto_31676 ) ) ( not ( = ?auto_31672 ?auto_31676 ) ) ( not ( = ?auto_31673 ?auto_31676 ) ) ( not ( = ?auto_31674 ?auto_31676 ) ) ( not ( = ?auto_31675 ?auto_31676 ) ) ( ON ?auto_31672 ?auto_31671 ) ( ON-TABLE ?auto_31676 ) ( ON ?auto_31673 ?auto_31672 ) ( CLEAR ?auto_31675 ) ( ON ?auto_31674 ?auto_31673 ) ( CLEAR ?auto_31674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31676 ?auto_31671 ?auto_31672 ?auto_31673 )
      ( MAKE-5PILE ?auto_31671 ?auto_31672 ?auto_31673 ?auto_31674 ?auto_31675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31677 - BLOCK
      ?auto_31678 - BLOCK
      ?auto_31679 - BLOCK
      ?auto_31680 - BLOCK
      ?auto_31681 - BLOCK
    )
    :vars
    (
      ?auto_31682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31677 ?auto_31678 ) ) ( not ( = ?auto_31677 ?auto_31679 ) ) ( not ( = ?auto_31677 ?auto_31680 ) ) ( not ( = ?auto_31677 ?auto_31681 ) ) ( not ( = ?auto_31678 ?auto_31679 ) ) ( not ( = ?auto_31678 ?auto_31680 ) ) ( not ( = ?auto_31678 ?auto_31681 ) ) ( not ( = ?auto_31679 ?auto_31680 ) ) ( not ( = ?auto_31679 ?auto_31681 ) ) ( not ( = ?auto_31680 ?auto_31681 ) ) ( ON ?auto_31677 ?auto_31682 ) ( not ( = ?auto_31677 ?auto_31682 ) ) ( not ( = ?auto_31678 ?auto_31682 ) ) ( not ( = ?auto_31679 ?auto_31682 ) ) ( not ( = ?auto_31680 ?auto_31682 ) ) ( not ( = ?auto_31681 ?auto_31682 ) ) ( ON ?auto_31678 ?auto_31677 ) ( ON-TABLE ?auto_31682 ) ( ON ?auto_31679 ?auto_31678 ) ( ON ?auto_31680 ?auto_31679 ) ( CLEAR ?auto_31680 ) ( HOLDING ?auto_31681 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31681 )
      ( MAKE-5PILE ?auto_31677 ?auto_31678 ?auto_31679 ?auto_31680 ?auto_31681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31683 - BLOCK
      ?auto_31684 - BLOCK
      ?auto_31685 - BLOCK
      ?auto_31686 - BLOCK
      ?auto_31687 - BLOCK
    )
    :vars
    (
      ?auto_31688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31683 ?auto_31684 ) ) ( not ( = ?auto_31683 ?auto_31685 ) ) ( not ( = ?auto_31683 ?auto_31686 ) ) ( not ( = ?auto_31683 ?auto_31687 ) ) ( not ( = ?auto_31684 ?auto_31685 ) ) ( not ( = ?auto_31684 ?auto_31686 ) ) ( not ( = ?auto_31684 ?auto_31687 ) ) ( not ( = ?auto_31685 ?auto_31686 ) ) ( not ( = ?auto_31685 ?auto_31687 ) ) ( not ( = ?auto_31686 ?auto_31687 ) ) ( ON ?auto_31683 ?auto_31688 ) ( not ( = ?auto_31683 ?auto_31688 ) ) ( not ( = ?auto_31684 ?auto_31688 ) ) ( not ( = ?auto_31685 ?auto_31688 ) ) ( not ( = ?auto_31686 ?auto_31688 ) ) ( not ( = ?auto_31687 ?auto_31688 ) ) ( ON ?auto_31684 ?auto_31683 ) ( ON-TABLE ?auto_31688 ) ( ON ?auto_31685 ?auto_31684 ) ( ON ?auto_31686 ?auto_31685 ) ( ON ?auto_31687 ?auto_31686 ) ( CLEAR ?auto_31687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31688 ?auto_31683 ?auto_31684 ?auto_31685 ?auto_31686 )
      ( MAKE-5PILE ?auto_31683 ?auto_31684 ?auto_31685 ?auto_31686 ?auto_31687 ) )
  )

)

