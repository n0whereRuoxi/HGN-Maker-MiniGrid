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
      ?auto_30789 - BLOCK
      ?auto_30790 - BLOCK
      ?auto_30791 - BLOCK
      ?auto_30792 - BLOCK
      ?auto_30793 - BLOCK
    )
    :vars
    (
      ?auto_30794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30794 ?auto_30793 ) ( CLEAR ?auto_30794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30789 ) ( ON ?auto_30790 ?auto_30789 ) ( ON ?auto_30791 ?auto_30790 ) ( ON ?auto_30792 ?auto_30791 ) ( ON ?auto_30793 ?auto_30792 ) ( not ( = ?auto_30789 ?auto_30790 ) ) ( not ( = ?auto_30789 ?auto_30791 ) ) ( not ( = ?auto_30789 ?auto_30792 ) ) ( not ( = ?auto_30789 ?auto_30793 ) ) ( not ( = ?auto_30789 ?auto_30794 ) ) ( not ( = ?auto_30790 ?auto_30791 ) ) ( not ( = ?auto_30790 ?auto_30792 ) ) ( not ( = ?auto_30790 ?auto_30793 ) ) ( not ( = ?auto_30790 ?auto_30794 ) ) ( not ( = ?auto_30791 ?auto_30792 ) ) ( not ( = ?auto_30791 ?auto_30793 ) ) ( not ( = ?auto_30791 ?auto_30794 ) ) ( not ( = ?auto_30792 ?auto_30793 ) ) ( not ( = ?auto_30792 ?auto_30794 ) ) ( not ( = ?auto_30793 ?auto_30794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30794 ?auto_30793 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30796 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30796 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_30796 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30797 - BLOCK
    )
    :vars
    (
      ?auto_30798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30797 ?auto_30798 ) ( CLEAR ?auto_30797 ) ( HAND-EMPTY ) ( not ( = ?auto_30797 ?auto_30798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30797 ?auto_30798 )
      ( MAKE-1PILE ?auto_30797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30803 - BLOCK
      ?auto_30804 - BLOCK
      ?auto_30805 - BLOCK
      ?auto_30806 - BLOCK
    )
    :vars
    (
      ?auto_30807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30807 ?auto_30806 ) ( CLEAR ?auto_30807 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30803 ) ( ON ?auto_30804 ?auto_30803 ) ( ON ?auto_30805 ?auto_30804 ) ( ON ?auto_30806 ?auto_30805 ) ( not ( = ?auto_30803 ?auto_30804 ) ) ( not ( = ?auto_30803 ?auto_30805 ) ) ( not ( = ?auto_30803 ?auto_30806 ) ) ( not ( = ?auto_30803 ?auto_30807 ) ) ( not ( = ?auto_30804 ?auto_30805 ) ) ( not ( = ?auto_30804 ?auto_30806 ) ) ( not ( = ?auto_30804 ?auto_30807 ) ) ( not ( = ?auto_30805 ?auto_30806 ) ) ( not ( = ?auto_30805 ?auto_30807 ) ) ( not ( = ?auto_30806 ?auto_30807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30807 ?auto_30806 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30808 - BLOCK
      ?auto_30809 - BLOCK
      ?auto_30810 - BLOCK
      ?auto_30811 - BLOCK
    )
    :vars
    (
      ?auto_30812 - BLOCK
      ?auto_30813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30812 ?auto_30811 ) ( CLEAR ?auto_30812 ) ( ON-TABLE ?auto_30808 ) ( ON ?auto_30809 ?auto_30808 ) ( ON ?auto_30810 ?auto_30809 ) ( ON ?auto_30811 ?auto_30810 ) ( not ( = ?auto_30808 ?auto_30809 ) ) ( not ( = ?auto_30808 ?auto_30810 ) ) ( not ( = ?auto_30808 ?auto_30811 ) ) ( not ( = ?auto_30808 ?auto_30812 ) ) ( not ( = ?auto_30809 ?auto_30810 ) ) ( not ( = ?auto_30809 ?auto_30811 ) ) ( not ( = ?auto_30809 ?auto_30812 ) ) ( not ( = ?auto_30810 ?auto_30811 ) ) ( not ( = ?auto_30810 ?auto_30812 ) ) ( not ( = ?auto_30811 ?auto_30812 ) ) ( HOLDING ?auto_30813 ) ( not ( = ?auto_30808 ?auto_30813 ) ) ( not ( = ?auto_30809 ?auto_30813 ) ) ( not ( = ?auto_30810 ?auto_30813 ) ) ( not ( = ?auto_30811 ?auto_30813 ) ) ( not ( = ?auto_30812 ?auto_30813 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_30813 )
      ( MAKE-4PILE ?auto_30808 ?auto_30809 ?auto_30810 ?auto_30811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30814 - BLOCK
      ?auto_30815 - BLOCK
      ?auto_30816 - BLOCK
      ?auto_30817 - BLOCK
    )
    :vars
    (
      ?auto_30819 - BLOCK
      ?auto_30818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30819 ?auto_30817 ) ( ON-TABLE ?auto_30814 ) ( ON ?auto_30815 ?auto_30814 ) ( ON ?auto_30816 ?auto_30815 ) ( ON ?auto_30817 ?auto_30816 ) ( not ( = ?auto_30814 ?auto_30815 ) ) ( not ( = ?auto_30814 ?auto_30816 ) ) ( not ( = ?auto_30814 ?auto_30817 ) ) ( not ( = ?auto_30814 ?auto_30819 ) ) ( not ( = ?auto_30815 ?auto_30816 ) ) ( not ( = ?auto_30815 ?auto_30817 ) ) ( not ( = ?auto_30815 ?auto_30819 ) ) ( not ( = ?auto_30816 ?auto_30817 ) ) ( not ( = ?auto_30816 ?auto_30819 ) ) ( not ( = ?auto_30817 ?auto_30819 ) ) ( not ( = ?auto_30814 ?auto_30818 ) ) ( not ( = ?auto_30815 ?auto_30818 ) ) ( not ( = ?auto_30816 ?auto_30818 ) ) ( not ( = ?auto_30817 ?auto_30818 ) ) ( not ( = ?auto_30819 ?auto_30818 ) ) ( ON ?auto_30818 ?auto_30819 ) ( CLEAR ?auto_30818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30814 ?auto_30815 ?auto_30816 ?auto_30817 ?auto_30819 )
      ( MAKE-4PILE ?auto_30814 ?auto_30815 ?auto_30816 ?auto_30817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30822 - BLOCK
      ?auto_30823 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30823 ) ( CLEAR ?auto_30822 ) ( ON-TABLE ?auto_30822 ) ( not ( = ?auto_30822 ?auto_30823 ) ) )
    :subtasks
    ( ( !STACK ?auto_30823 ?auto_30822 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30824 - BLOCK
      ?auto_30825 - BLOCK
    )
    :vars
    (
      ?auto_30826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30824 ) ( ON-TABLE ?auto_30824 ) ( not ( = ?auto_30824 ?auto_30825 ) ) ( ON ?auto_30825 ?auto_30826 ) ( CLEAR ?auto_30825 ) ( HAND-EMPTY ) ( not ( = ?auto_30824 ?auto_30826 ) ) ( not ( = ?auto_30825 ?auto_30826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30825 ?auto_30826 )
      ( MAKE-2PILE ?auto_30824 ?auto_30825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30827 - BLOCK
      ?auto_30828 - BLOCK
    )
    :vars
    (
      ?auto_30829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30827 ?auto_30828 ) ) ( ON ?auto_30828 ?auto_30829 ) ( CLEAR ?auto_30828 ) ( not ( = ?auto_30827 ?auto_30829 ) ) ( not ( = ?auto_30828 ?auto_30829 ) ) ( HOLDING ?auto_30827 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30827 )
      ( MAKE-2PILE ?auto_30827 ?auto_30828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30830 - BLOCK
      ?auto_30831 - BLOCK
    )
    :vars
    (
      ?auto_30832 - BLOCK
      ?auto_30834 - BLOCK
      ?auto_30835 - BLOCK
      ?auto_30833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30830 ?auto_30831 ) ) ( ON ?auto_30831 ?auto_30832 ) ( not ( = ?auto_30830 ?auto_30832 ) ) ( not ( = ?auto_30831 ?auto_30832 ) ) ( ON ?auto_30830 ?auto_30831 ) ( CLEAR ?auto_30830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30834 ) ( ON ?auto_30835 ?auto_30834 ) ( ON ?auto_30833 ?auto_30835 ) ( ON ?auto_30832 ?auto_30833 ) ( not ( = ?auto_30834 ?auto_30835 ) ) ( not ( = ?auto_30834 ?auto_30833 ) ) ( not ( = ?auto_30834 ?auto_30832 ) ) ( not ( = ?auto_30834 ?auto_30831 ) ) ( not ( = ?auto_30834 ?auto_30830 ) ) ( not ( = ?auto_30835 ?auto_30833 ) ) ( not ( = ?auto_30835 ?auto_30832 ) ) ( not ( = ?auto_30835 ?auto_30831 ) ) ( not ( = ?auto_30835 ?auto_30830 ) ) ( not ( = ?auto_30833 ?auto_30832 ) ) ( not ( = ?auto_30833 ?auto_30831 ) ) ( not ( = ?auto_30833 ?auto_30830 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30834 ?auto_30835 ?auto_30833 ?auto_30832 ?auto_30831 )
      ( MAKE-2PILE ?auto_30830 ?auto_30831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30839 - BLOCK
      ?auto_30840 - BLOCK
      ?auto_30841 - BLOCK
    )
    :vars
    (
      ?auto_30842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30842 ?auto_30841 ) ( CLEAR ?auto_30842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30839 ) ( ON ?auto_30840 ?auto_30839 ) ( ON ?auto_30841 ?auto_30840 ) ( not ( = ?auto_30839 ?auto_30840 ) ) ( not ( = ?auto_30839 ?auto_30841 ) ) ( not ( = ?auto_30839 ?auto_30842 ) ) ( not ( = ?auto_30840 ?auto_30841 ) ) ( not ( = ?auto_30840 ?auto_30842 ) ) ( not ( = ?auto_30841 ?auto_30842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30842 ?auto_30841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30843 - BLOCK
      ?auto_30844 - BLOCK
      ?auto_30845 - BLOCK
    )
    :vars
    (
      ?auto_30846 - BLOCK
      ?auto_30847 - BLOCK
      ?auto_30848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30846 ?auto_30845 ) ( CLEAR ?auto_30846 ) ( ON-TABLE ?auto_30843 ) ( ON ?auto_30844 ?auto_30843 ) ( ON ?auto_30845 ?auto_30844 ) ( not ( = ?auto_30843 ?auto_30844 ) ) ( not ( = ?auto_30843 ?auto_30845 ) ) ( not ( = ?auto_30843 ?auto_30846 ) ) ( not ( = ?auto_30844 ?auto_30845 ) ) ( not ( = ?auto_30844 ?auto_30846 ) ) ( not ( = ?auto_30845 ?auto_30846 ) ) ( HOLDING ?auto_30847 ) ( CLEAR ?auto_30848 ) ( not ( = ?auto_30843 ?auto_30847 ) ) ( not ( = ?auto_30843 ?auto_30848 ) ) ( not ( = ?auto_30844 ?auto_30847 ) ) ( not ( = ?auto_30844 ?auto_30848 ) ) ( not ( = ?auto_30845 ?auto_30847 ) ) ( not ( = ?auto_30845 ?auto_30848 ) ) ( not ( = ?auto_30846 ?auto_30847 ) ) ( not ( = ?auto_30846 ?auto_30848 ) ) ( not ( = ?auto_30847 ?auto_30848 ) ) )
    :subtasks
    ( ( !STACK ?auto_30847 ?auto_30848 )
      ( MAKE-3PILE ?auto_30843 ?auto_30844 ?auto_30845 ) )
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
      ?auto_30854 - BLOCK
      ?auto_30852 - BLOCK
      ?auto_30853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30854 ?auto_30851 ) ( ON-TABLE ?auto_30849 ) ( ON ?auto_30850 ?auto_30849 ) ( ON ?auto_30851 ?auto_30850 ) ( not ( = ?auto_30849 ?auto_30850 ) ) ( not ( = ?auto_30849 ?auto_30851 ) ) ( not ( = ?auto_30849 ?auto_30854 ) ) ( not ( = ?auto_30850 ?auto_30851 ) ) ( not ( = ?auto_30850 ?auto_30854 ) ) ( not ( = ?auto_30851 ?auto_30854 ) ) ( CLEAR ?auto_30852 ) ( not ( = ?auto_30849 ?auto_30853 ) ) ( not ( = ?auto_30849 ?auto_30852 ) ) ( not ( = ?auto_30850 ?auto_30853 ) ) ( not ( = ?auto_30850 ?auto_30852 ) ) ( not ( = ?auto_30851 ?auto_30853 ) ) ( not ( = ?auto_30851 ?auto_30852 ) ) ( not ( = ?auto_30854 ?auto_30853 ) ) ( not ( = ?auto_30854 ?auto_30852 ) ) ( not ( = ?auto_30853 ?auto_30852 ) ) ( ON ?auto_30853 ?auto_30854 ) ( CLEAR ?auto_30853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30849 ?auto_30850 ?auto_30851 ?auto_30854 )
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
    ( and ( ON ?auto_30858 ?auto_30857 ) ( ON-TABLE ?auto_30855 ) ( ON ?auto_30856 ?auto_30855 ) ( ON ?auto_30857 ?auto_30856 ) ( not ( = ?auto_30855 ?auto_30856 ) ) ( not ( = ?auto_30855 ?auto_30857 ) ) ( not ( = ?auto_30855 ?auto_30858 ) ) ( not ( = ?auto_30856 ?auto_30857 ) ) ( not ( = ?auto_30856 ?auto_30858 ) ) ( not ( = ?auto_30857 ?auto_30858 ) ) ( not ( = ?auto_30855 ?auto_30860 ) ) ( not ( = ?auto_30855 ?auto_30859 ) ) ( not ( = ?auto_30856 ?auto_30860 ) ) ( not ( = ?auto_30856 ?auto_30859 ) ) ( not ( = ?auto_30857 ?auto_30860 ) ) ( not ( = ?auto_30857 ?auto_30859 ) ) ( not ( = ?auto_30858 ?auto_30860 ) ) ( not ( = ?auto_30858 ?auto_30859 ) ) ( not ( = ?auto_30860 ?auto_30859 ) ) ( ON ?auto_30860 ?auto_30858 ) ( CLEAR ?auto_30860 ) ( HOLDING ?auto_30859 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30859 )
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
      ?auto_30865 - BLOCK
      ?auto_30866 - BLOCK
      ?auto_30864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30865 ?auto_30863 ) ( ON-TABLE ?auto_30861 ) ( ON ?auto_30862 ?auto_30861 ) ( ON ?auto_30863 ?auto_30862 ) ( not ( = ?auto_30861 ?auto_30862 ) ) ( not ( = ?auto_30861 ?auto_30863 ) ) ( not ( = ?auto_30861 ?auto_30865 ) ) ( not ( = ?auto_30862 ?auto_30863 ) ) ( not ( = ?auto_30862 ?auto_30865 ) ) ( not ( = ?auto_30863 ?auto_30865 ) ) ( not ( = ?auto_30861 ?auto_30866 ) ) ( not ( = ?auto_30861 ?auto_30864 ) ) ( not ( = ?auto_30862 ?auto_30866 ) ) ( not ( = ?auto_30862 ?auto_30864 ) ) ( not ( = ?auto_30863 ?auto_30866 ) ) ( not ( = ?auto_30863 ?auto_30864 ) ) ( not ( = ?auto_30865 ?auto_30866 ) ) ( not ( = ?auto_30865 ?auto_30864 ) ) ( not ( = ?auto_30866 ?auto_30864 ) ) ( ON ?auto_30866 ?auto_30865 ) ( ON ?auto_30864 ?auto_30866 ) ( CLEAR ?auto_30864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30861 ?auto_30862 ?auto_30863 ?auto_30865 ?auto_30866 )
      ( MAKE-3PILE ?auto_30861 ?auto_30862 ?auto_30863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30870 - BLOCK
      ?auto_30871 - BLOCK
      ?auto_30872 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30872 ) ( CLEAR ?auto_30871 ) ( ON-TABLE ?auto_30870 ) ( ON ?auto_30871 ?auto_30870 ) ( not ( = ?auto_30870 ?auto_30871 ) ) ( not ( = ?auto_30870 ?auto_30872 ) ) ( not ( = ?auto_30871 ?auto_30872 ) ) )
    :subtasks
    ( ( !STACK ?auto_30872 ?auto_30871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30873 - BLOCK
      ?auto_30874 - BLOCK
      ?auto_30875 - BLOCK
    )
    :vars
    (
      ?auto_30876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30874 ) ( ON-TABLE ?auto_30873 ) ( ON ?auto_30874 ?auto_30873 ) ( not ( = ?auto_30873 ?auto_30874 ) ) ( not ( = ?auto_30873 ?auto_30875 ) ) ( not ( = ?auto_30874 ?auto_30875 ) ) ( ON ?auto_30875 ?auto_30876 ) ( CLEAR ?auto_30875 ) ( HAND-EMPTY ) ( not ( = ?auto_30873 ?auto_30876 ) ) ( not ( = ?auto_30874 ?auto_30876 ) ) ( not ( = ?auto_30875 ?auto_30876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30875 ?auto_30876 )
      ( MAKE-3PILE ?auto_30873 ?auto_30874 ?auto_30875 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30877 - BLOCK
      ?auto_30878 - BLOCK
      ?auto_30879 - BLOCK
    )
    :vars
    (
      ?auto_30880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30877 ) ( not ( = ?auto_30877 ?auto_30878 ) ) ( not ( = ?auto_30877 ?auto_30879 ) ) ( not ( = ?auto_30878 ?auto_30879 ) ) ( ON ?auto_30879 ?auto_30880 ) ( CLEAR ?auto_30879 ) ( not ( = ?auto_30877 ?auto_30880 ) ) ( not ( = ?auto_30878 ?auto_30880 ) ) ( not ( = ?auto_30879 ?auto_30880 ) ) ( HOLDING ?auto_30878 ) ( CLEAR ?auto_30877 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30877 ?auto_30878 )
      ( MAKE-3PILE ?auto_30877 ?auto_30878 ?auto_30879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30881 - BLOCK
      ?auto_30882 - BLOCK
      ?auto_30883 - BLOCK
    )
    :vars
    (
      ?auto_30884 - BLOCK
      ?auto_30885 - BLOCK
      ?auto_30886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30881 ) ( not ( = ?auto_30881 ?auto_30882 ) ) ( not ( = ?auto_30881 ?auto_30883 ) ) ( not ( = ?auto_30882 ?auto_30883 ) ) ( ON ?auto_30883 ?auto_30884 ) ( not ( = ?auto_30881 ?auto_30884 ) ) ( not ( = ?auto_30882 ?auto_30884 ) ) ( not ( = ?auto_30883 ?auto_30884 ) ) ( CLEAR ?auto_30881 ) ( ON ?auto_30882 ?auto_30883 ) ( CLEAR ?auto_30882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30885 ) ( ON ?auto_30886 ?auto_30885 ) ( ON ?auto_30884 ?auto_30886 ) ( not ( = ?auto_30885 ?auto_30886 ) ) ( not ( = ?auto_30885 ?auto_30884 ) ) ( not ( = ?auto_30885 ?auto_30883 ) ) ( not ( = ?auto_30885 ?auto_30882 ) ) ( not ( = ?auto_30886 ?auto_30884 ) ) ( not ( = ?auto_30886 ?auto_30883 ) ) ( not ( = ?auto_30886 ?auto_30882 ) ) ( not ( = ?auto_30881 ?auto_30885 ) ) ( not ( = ?auto_30881 ?auto_30886 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30885 ?auto_30886 ?auto_30884 ?auto_30883 )
      ( MAKE-3PILE ?auto_30881 ?auto_30882 ?auto_30883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30887 - BLOCK
      ?auto_30888 - BLOCK
      ?auto_30889 - BLOCK
    )
    :vars
    (
      ?auto_30890 - BLOCK
      ?auto_30891 - BLOCK
      ?auto_30892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30887 ?auto_30888 ) ) ( not ( = ?auto_30887 ?auto_30889 ) ) ( not ( = ?auto_30888 ?auto_30889 ) ) ( ON ?auto_30889 ?auto_30890 ) ( not ( = ?auto_30887 ?auto_30890 ) ) ( not ( = ?auto_30888 ?auto_30890 ) ) ( not ( = ?auto_30889 ?auto_30890 ) ) ( ON ?auto_30888 ?auto_30889 ) ( CLEAR ?auto_30888 ) ( ON-TABLE ?auto_30891 ) ( ON ?auto_30892 ?auto_30891 ) ( ON ?auto_30890 ?auto_30892 ) ( not ( = ?auto_30891 ?auto_30892 ) ) ( not ( = ?auto_30891 ?auto_30890 ) ) ( not ( = ?auto_30891 ?auto_30889 ) ) ( not ( = ?auto_30891 ?auto_30888 ) ) ( not ( = ?auto_30892 ?auto_30890 ) ) ( not ( = ?auto_30892 ?auto_30889 ) ) ( not ( = ?auto_30892 ?auto_30888 ) ) ( not ( = ?auto_30887 ?auto_30891 ) ) ( not ( = ?auto_30887 ?auto_30892 ) ) ( HOLDING ?auto_30887 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30887 )
      ( MAKE-3PILE ?auto_30887 ?auto_30888 ?auto_30889 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30893 - BLOCK
      ?auto_30894 - BLOCK
      ?auto_30895 - BLOCK
    )
    :vars
    (
      ?auto_30898 - BLOCK
      ?auto_30897 - BLOCK
      ?auto_30896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30893 ?auto_30894 ) ) ( not ( = ?auto_30893 ?auto_30895 ) ) ( not ( = ?auto_30894 ?auto_30895 ) ) ( ON ?auto_30895 ?auto_30898 ) ( not ( = ?auto_30893 ?auto_30898 ) ) ( not ( = ?auto_30894 ?auto_30898 ) ) ( not ( = ?auto_30895 ?auto_30898 ) ) ( ON ?auto_30894 ?auto_30895 ) ( ON-TABLE ?auto_30897 ) ( ON ?auto_30896 ?auto_30897 ) ( ON ?auto_30898 ?auto_30896 ) ( not ( = ?auto_30897 ?auto_30896 ) ) ( not ( = ?auto_30897 ?auto_30898 ) ) ( not ( = ?auto_30897 ?auto_30895 ) ) ( not ( = ?auto_30897 ?auto_30894 ) ) ( not ( = ?auto_30896 ?auto_30898 ) ) ( not ( = ?auto_30896 ?auto_30895 ) ) ( not ( = ?auto_30896 ?auto_30894 ) ) ( not ( = ?auto_30893 ?auto_30897 ) ) ( not ( = ?auto_30893 ?auto_30896 ) ) ( ON ?auto_30893 ?auto_30894 ) ( CLEAR ?auto_30893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30897 ?auto_30896 ?auto_30898 ?auto_30895 ?auto_30894 )
      ( MAKE-3PILE ?auto_30893 ?auto_30894 ?auto_30895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30901 - BLOCK
      ?auto_30902 - BLOCK
    )
    :vars
    (
      ?auto_30903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30903 ?auto_30902 ) ( CLEAR ?auto_30903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30901 ) ( ON ?auto_30902 ?auto_30901 ) ( not ( = ?auto_30901 ?auto_30902 ) ) ( not ( = ?auto_30901 ?auto_30903 ) ) ( not ( = ?auto_30902 ?auto_30903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30903 ?auto_30902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30904 - BLOCK
      ?auto_30905 - BLOCK
    )
    :vars
    (
      ?auto_30906 - BLOCK
      ?auto_30907 - BLOCK
      ?auto_30908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30906 ?auto_30905 ) ( CLEAR ?auto_30906 ) ( ON-TABLE ?auto_30904 ) ( ON ?auto_30905 ?auto_30904 ) ( not ( = ?auto_30904 ?auto_30905 ) ) ( not ( = ?auto_30904 ?auto_30906 ) ) ( not ( = ?auto_30905 ?auto_30906 ) ) ( HOLDING ?auto_30907 ) ( CLEAR ?auto_30908 ) ( not ( = ?auto_30904 ?auto_30907 ) ) ( not ( = ?auto_30904 ?auto_30908 ) ) ( not ( = ?auto_30905 ?auto_30907 ) ) ( not ( = ?auto_30905 ?auto_30908 ) ) ( not ( = ?auto_30906 ?auto_30907 ) ) ( not ( = ?auto_30906 ?auto_30908 ) ) ( not ( = ?auto_30907 ?auto_30908 ) ) )
    :subtasks
    ( ( !STACK ?auto_30907 ?auto_30908 )
      ( MAKE-2PILE ?auto_30904 ?auto_30905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30909 - BLOCK
      ?auto_30910 - BLOCK
    )
    :vars
    (
      ?auto_30911 - BLOCK
      ?auto_30913 - BLOCK
      ?auto_30912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30911 ?auto_30910 ) ( ON-TABLE ?auto_30909 ) ( ON ?auto_30910 ?auto_30909 ) ( not ( = ?auto_30909 ?auto_30910 ) ) ( not ( = ?auto_30909 ?auto_30911 ) ) ( not ( = ?auto_30910 ?auto_30911 ) ) ( CLEAR ?auto_30913 ) ( not ( = ?auto_30909 ?auto_30912 ) ) ( not ( = ?auto_30909 ?auto_30913 ) ) ( not ( = ?auto_30910 ?auto_30912 ) ) ( not ( = ?auto_30910 ?auto_30913 ) ) ( not ( = ?auto_30911 ?auto_30912 ) ) ( not ( = ?auto_30911 ?auto_30913 ) ) ( not ( = ?auto_30912 ?auto_30913 ) ) ( ON ?auto_30912 ?auto_30911 ) ( CLEAR ?auto_30912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30909 ?auto_30910 ?auto_30911 )
      ( MAKE-2PILE ?auto_30909 ?auto_30910 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30914 - BLOCK
      ?auto_30915 - BLOCK
    )
    :vars
    (
      ?auto_30917 - BLOCK
      ?auto_30918 - BLOCK
      ?auto_30916 - BLOCK
      ?auto_30919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30917 ?auto_30915 ) ( ON-TABLE ?auto_30914 ) ( ON ?auto_30915 ?auto_30914 ) ( not ( = ?auto_30914 ?auto_30915 ) ) ( not ( = ?auto_30914 ?auto_30917 ) ) ( not ( = ?auto_30915 ?auto_30917 ) ) ( not ( = ?auto_30914 ?auto_30918 ) ) ( not ( = ?auto_30914 ?auto_30916 ) ) ( not ( = ?auto_30915 ?auto_30918 ) ) ( not ( = ?auto_30915 ?auto_30916 ) ) ( not ( = ?auto_30917 ?auto_30918 ) ) ( not ( = ?auto_30917 ?auto_30916 ) ) ( not ( = ?auto_30918 ?auto_30916 ) ) ( ON ?auto_30918 ?auto_30917 ) ( CLEAR ?auto_30918 ) ( HOLDING ?auto_30916 ) ( CLEAR ?auto_30919 ) ( ON-TABLE ?auto_30919 ) ( not ( = ?auto_30919 ?auto_30916 ) ) ( not ( = ?auto_30914 ?auto_30919 ) ) ( not ( = ?auto_30915 ?auto_30919 ) ) ( not ( = ?auto_30917 ?auto_30919 ) ) ( not ( = ?auto_30918 ?auto_30919 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30919 ?auto_30916 )
      ( MAKE-2PILE ?auto_30914 ?auto_30915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30920 - BLOCK
      ?auto_30921 - BLOCK
    )
    :vars
    (
      ?auto_30925 - BLOCK
      ?auto_30924 - BLOCK
      ?auto_30923 - BLOCK
      ?auto_30922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30925 ?auto_30921 ) ( ON-TABLE ?auto_30920 ) ( ON ?auto_30921 ?auto_30920 ) ( not ( = ?auto_30920 ?auto_30921 ) ) ( not ( = ?auto_30920 ?auto_30925 ) ) ( not ( = ?auto_30921 ?auto_30925 ) ) ( not ( = ?auto_30920 ?auto_30924 ) ) ( not ( = ?auto_30920 ?auto_30923 ) ) ( not ( = ?auto_30921 ?auto_30924 ) ) ( not ( = ?auto_30921 ?auto_30923 ) ) ( not ( = ?auto_30925 ?auto_30924 ) ) ( not ( = ?auto_30925 ?auto_30923 ) ) ( not ( = ?auto_30924 ?auto_30923 ) ) ( ON ?auto_30924 ?auto_30925 ) ( CLEAR ?auto_30922 ) ( ON-TABLE ?auto_30922 ) ( not ( = ?auto_30922 ?auto_30923 ) ) ( not ( = ?auto_30920 ?auto_30922 ) ) ( not ( = ?auto_30921 ?auto_30922 ) ) ( not ( = ?auto_30925 ?auto_30922 ) ) ( not ( = ?auto_30924 ?auto_30922 ) ) ( ON ?auto_30923 ?auto_30924 ) ( CLEAR ?auto_30923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30920 ?auto_30921 ?auto_30925 ?auto_30924 )
      ( MAKE-2PILE ?auto_30920 ?auto_30921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30926 - BLOCK
      ?auto_30927 - BLOCK
    )
    :vars
    (
      ?auto_30928 - BLOCK
      ?auto_30931 - BLOCK
      ?auto_30930 - BLOCK
      ?auto_30929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30928 ?auto_30927 ) ( ON-TABLE ?auto_30926 ) ( ON ?auto_30927 ?auto_30926 ) ( not ( = ?auto_30926 ?auto_30927 ) ) ( not ( = ?auto_30926 ?auto_30928 ) ) ( not ( = ?auto_30927 ?auto_30928 ) ) ( not ( = ?auto_30926 ?auto_30931 ) ) ( not ( = ?auto_30926 ?auto_30930 ) ) ( not ( = ?auto_30927 ?auto_30931 ) ) ( not ( = ?auto_30927 ?auto_30930 ) ) ( not ( = ?auto_30928 ?auto_30931 ) ) ( not ( = ?auto_30928 ?auto_30930 ) ) ( not ( = ?auto_30931 ?auto_30930 ) ) ( ON ?auto_30931 ?auto_30928 ) ( not ( = ?auto_30929 ?auto_30930 ) ) ( not ( = ?auto_30926 ?auto_30929 ) ) ( not ( = ?auto_30927 ?auto_30929 ) ) ( not ( = ?auto_30928 ?auto_30929 ) ) ( not ( = ?auto_30931 ?auto_30929 ) ) ( ON ?auto_30930 ?auto_30931 ) ( CLEAR ?auto_30930 ) ( HOLDING ?auto_30929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30929 )
      ( MAKE-2PILE ?auto_30926 ?auto_30927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30932 - BLOCK
      ?auto_30933 - BLOCK
    )
    :vars
    (
      ?auto_30934 - BLOCK
      ?auto_30935 - BLOCK
      ?auto_30937 - BLOCK
      ?auto_30936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30934 ?auto_30933 ) ( ON-TABLE ?auto_30932 ) ( ON ?auto_30933 ?auto_30932 ) ( not ( = ?auto_30932 ?auto_30933 ) ) ( not ( = ?auto_30932 ?auto_30934 ) ) ( not ( = ?auto_30933 ?auto_30934 ) ) ( not ( = ?auto_30932 ?auto_30935 ) ) ( not ( = ?auto_30932 ?auto_30937 ) ) ( not ( = ?auto_30933 ?auto_30935 ) ) ( not ( = ?auto_30933 ?auto_30937 ) ) ( not ( = ?auto_30934 ?auto_30935 ) ) ( not ( = ?auto_30934 ?auto_30937 ) ) ( not ( = ?auto_30935 ?auto_30937 ) ) ( ON ?auto_30935 ?auto_30934 ) ( not ( = ?auto_30936 ?auto_30937 ) ) ( not ( = ?auto_30932 ?auto_30936 ) ) ( not ( = ?auto_30933 ?auto_30936 ) ) ( not ( = ?auto_30934 ?auto_30936 ) ) ( not ( = ?auto_30935 ?auto_30936 ) ) ( ON ?auto_30937 ?auto_30935 ) ( ON ?auto_30936 ?auto_30937 ) ( CLEAR ?auto_30936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30932 ?auto_30933 ?auto_30934 ?auto_30935 ?auto_30937 )
      ( MAKE-2PILE ?auto_30932 ?auto_30933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30942 - BLOCK
      ?auto_30943 - BLOCK
      ?auto_30944 - BLOCK
      ?auto_30945 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30945 ) ( CLEAR ?auto_30944 ) ( ON-TABLE ?auto_30942 ) ( ON ?auto_30943 ?auto_30942 ) ( ON ?auto_30944 ?auto_30943 ) ( not ( = ?auto_30942 ?auto_30943 ) ) ( not ( = ?auto_30942 ?auto_30944 ) ) ( not ( = ?auto_30942 ?auto_30945 ) ) ( not ( = ?auto_30943 ?auto_30944 ) ) ( not ( = ?auto_30943 ?auto_30945 ) ) ( not ( = ?auto_30944 ?auto_30945 ) ) )
    :subtasks
    ( ( !STACK ?auto_30945 ?auto_30944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30946 - BLOCK
      ?auto_30947 - BLOCK
      ?auto_30948 - BLOCK
      ?auto_30949 - BLOCK
    )
    :vars
    (
      ?auto_30950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30948 ) ( ON-TABLE ?auto_30946 ) ( ON ?auto_30947 ?auto_30946 ) ( ON ?auto_30948 ?auto_30947 ) ( not ( = ?auto_30946 ?auto_30947 ) ) ( not ( = ?auto_30946 ?auto_30948 ) ) ( not ( = ?auto_30946 ?auto_30949 ) ) ( not ( = ?auto_30947 ?auto_30948 ) ) ( not ( = ?auto_30947 ?auto_30949 ) ) ( not ( = ?auto_30948 ?auto_30949 ) ) ( ON ?auto_30949 ?auto_30950 ) ( CLEAR ?auto_30949 ) ( HAND-EMPTY ) ( not ( = ?auto_30946 ?auto_30950 ) ) ( not ( = ?auto_30947 ?auto_30950 ) ) ( not ( = ?auto_30948 ?auto_30950 ) ) ( not ( = ?auto_30949 ?auto_30950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30949 ?auto_30950 )
      ( MAKE-4PILE ?auto_30946 ?auto_30947 ?auto_30948 ?auto_30949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30951 - BLOCK
      ?auto_30952 - BLOCK
      ?auto_30953 - BLOCK
      ?auto_30954 - BLOCK
    )
    :vars
    (
      ?auto_30955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30951 ) ( ON ?auto_30952 ?auto_30951 ) ( not ( = ?auto_30951 ?auto_30952 ) ) ( not ( = ?auto_30951 ?auto_30953 ) ) ( not ( = ?auto_30951 ?auto_30954 ) ) ( not ( = ?auto_30952 ?auto_30953 ) ) ( not ( = ?auto_30952 ?auto_30954 ) ) ( not ( = ?auto_30953 ?auto_30954 ) ) ( ON ?auto_30954 ?auto_30955 ) ( CLEAR ?auto_30954 ) ( not ( = ?auto_30951 ?auto_30955 ) ) ( not ( = ?auto_30952 ?auto_30955 ) ) ( not ( = ?auto_30953 ?auto_30955 ) ) ( not ( = ?auto_30954 ?auto_30955 ) ) ( HOLDING ?auto_30953 ) ( CLEAR ?auto_30952 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30951 ?auto_30952 ?auto_30953 )
      ( MAKE-4PILE ?auto_30951 ?auto_30952 ?auto_30953 ?auto_30954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30956 - BLOCK
      ?auto_30957 - BLOCK
      ?auto_30958 - BLOCK
      ?auto_30959 - BLOCK
    )
    :vars
    (
      ?auto_30960 - BLOCK
      ?auto_30961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30956 ) ( ON ?auto_30957 ?auto_30956 ) ( not ( = ?auto_30956 ?auto_30957 ) ) ( not ( = ?auto_30956 ?auto_30958 ) ) ( not ( = ?auto_30956 ?auto_30959 ) ) ( not ( = ?auto_30957 ?auto_30958 ) ) ( not ( = ?auto_30957 ?auto_30959 ) ) ( not ( = ?auto_30958 ?auto_30959 ) ) ( ON ?auto_30959 ?auto_30960 ) ( not ( = ?auto_30956 ?auto_30960 ) ) ( not ( = ?auto_30957 ?auto_30960 ) ) ( not ( = ?auto_30958 ?auto_30960 ) ) ( not ( = ?auto_30959 ?auto_30960 ) ) ( CLEAR ?auto_30957 ) ( ON ?auto_30958 ?auto_30959 ) ( CLEAR ?auto_30958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30961 ) ( ON ?auto_30960 ?auto_30961 ) ( not ( = ?auto_30961 ?auto_30960 ) ) ( not ( = ?auto_30961 ?auto_30959 ) ) ( not ( = ?auto_30961 ?auto_30958 ) ) ( not ( = ?auto_30956 ?auto_30961 ) ) ( not ( = ?auto_30957 ?auto_30961 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30961 ?auto_30960 ?auto_30959 )
      ( MAKE-4PILE ?auto_30956 ?auto_30957 ?auto_30958 ?auto_30959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30962 - BLOCK
      ?auto_30963 - BLOCK
      ?auto_30964 - BLOCK
      ?auto_30965 - BLOCK
    )
    :vars
    (
      ?auto_30967 - BLOCK
      ?auto_30966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30962 ) ( not ( = ?auto_30962 ?auto_30963 ) ) ( not ( = ?auto_30962 ?auto_30964 ) ) ( not ( = ?auto_30962 ?auto_30965 ) ) ( not ( = ?auto_30963 ?auto_30964 ) ) ( not ( = ?auto_30963 ?auto_30965 ) ) ( not ( = ?auto_30964 ?auto_30965 ) ) ( ON ?auto_30965 ?auto_30967 ) ( not ( = ?auto_30962 ?auto_30967 ) ) ( not ( = ?auto_30963 ?auto_30967 ) ) ( not ( = ?auto_30964 ?auto_30967 ) ) ( not ( = ?auto_30965 ?auto_30967 ) ) ( ON ?auto_30964 ?auto_30965 ) ( CLEAR ?auto_30964 ) ( ON-TABLE ?auto_30966 ) ( ON ?auto_30967 ?auto_30966 ) ( not ( = ?auto_30966 ?auto_30967 ) ) ( not ( = ?auto_30966 ?auto_30965 ) ) ( not ( = ?auto_30966 ?auto_30964 ) ) ( not ( = ?auto_30962 ?auto_30966 ) ) ( not ( = ?auto_30963 ?auto_30966 ) ) ( HOLDING ?auto_30963 ) ( CLEAR ?auto_30962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30962 ?auto_30963 )
      ( MAKE-4PILE ?auto_30962 ?auto_30963 ?auto_30964 ?auto_30965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30968 - BLOCK
      ?auto_30969 - BLOCK
      ?auto_30970 - BLOCK
      ?auto_30971 - BLOCK
    )
    :vars
    (
      ?auto_30972 - BLOCK
      ?auto_30973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30968 ) ( not ( = ?auto_30968 ?auto_30969 ) ) ( not ( = ?auto_30968 ?auto_30970 ) ) ( not ( = ?auto_30968 ?auto_30971 ) ) ( not ( = ?auto_30969 ?auto_30970 ) ) ( not ( = ?auto_30969 ?auto_30971 ) ) ( not ( = ?auto_30970 ?auto_30971 ) ) ( ON ?auto_30971 ?auto_30972 ) ( not ( = ?auto_30968 ?auto_30972 ) ) ( not ( = ?auto_30969 ?auto_30972 ) ) ( not ( = ?auto_30970 ?auto_30972 ) ) ( not ( = ?auto_30971 ?auto_30972 ) ) ( ON ?auto_30970 ?auto_30971 ) ( ON-TABLE ?auto_30973 ) ( ON ?auto_30972 ?auto_30973 ) ( not ( = ?auto_30973 ?auto_30972 ) ) ( not ( = ?auto_30973 ?auto_30971 ) ) ( not ( = ?auto_30973 ?auto_30970 ) ) ( not ( = ?auto_30968 ?auto_30973 ) ) ( not ( = ?auto_30969 ?auto_30973 ) ) ( CLEAR ?auto_30968 ) ( ON ?auto_30969 ?auto_30970 ) ( CLEAR ?auto_30969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30973 ?auto_30972 ?auto_30971 ?auto_30970 )
      ( MAKE-4PILE ?auto_30968 ?auto_30969 ?auto_30970 ?auto_30971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30974 - BLOCK
      ?auto_30975 - BLOCK
      ?auto_30976 - BLOCK
      ?auto_30977 - BLOCK
    )
    :vars
    (
      ?auto_30979 - BLOCK
      ?auto_30978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30974 ?auto_30975 ) ) ( not ( = ?auto_30974 ?auto_30976 ) ) ( not ( = ?auto_30974 ?auto_30977 ) ) ( not ( = ?auto_30975 ?auto_30976 ) ) ( not ( = ?auto_30975 ?auto_30977 ) ) ( not ( = ?auto_30976 ?auto_30977 ) ) ( ON ?auto_30977 ?auto_30979 ) ( not ( = ?auto_30974 ?auto_30979 ) ) ( not ( = ?auto_30975 ?auto_30979 ) ) ( not ( = ?auto_30976 ?auto_30979 ) ) ( not ( = ?auto_30977 ?auto_30979 ) ) ( ON ?auto_30976 ?auto_30977 ) ( ON-TABLE ?auto_30978 ) ( ON ?auto_30979 ?auto_30978 ) ( not ( = ?auto_30978 ?auto_30979 ) ) ( not ( = ?auto_30978 ?auto_30977 ) ) ( not ( = ?auto_30978 ?auto_30976 ) ) ( not ( = ?auto_30974 ?auto_30978 ) ) ( not ( = ?auto_30975 ?auto_30978 ) ) ( ON ?auto_30975 ?auto_30976 ) ( CLEAR ?auto_30975 ) ( HOLDING ?auto_30974 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30974 )
      ( MAKE-4PILE ?auto_30974 ?auto_30975 ?auto_30976 ?auto_30977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30980 - BLOCK
      ?auto_30981 - BLOCK
      ?auto_30982 - BLOCK
      ?auto_30983 - BLOCK
    )
    :vars
    (
      ?auto_30984 - BLOCK
      ?auto_30985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30980 ?auto_30981 ) ) ( not ( = ?auto_30980 ?auto_30982 ) ) ( not ( = ?auto_30980 ?auto_30983 ) ) ( not ( = ?auto_30981 ?auto_30982 ) ) ( not ( = ?auto_30981 ?auto_30983 ) ) ( not ( = ?auto_30982 ?auto_30983 ) ) ( ON ?auto_30983 ?auto_30984 ) ( not ( = ?auto_30980 ?auto_30984 ) ) ( not ( = ?auto_30981 ?auto_30984 ) ) ( not ( = ?auto_30982 ?auto_30984 ) ) ( not ( = ?auto_30983 ?auto_30984 ) ) ( ON ?auto_30982 ?auto_30983 ) ( ON-TABLE ?auto_30985 ) ( ON ?auto_30984 ?auto_30985 ) ( not ( = ?auto_30985 ?auto_30984 ) ) ( not ( = ?auto_30985 ?auto_30983 ) ) ( not ( = ?auto_30985 ?auto_30982 ) ) ( not ( = ?auto_30980 ?auto_30985 ) ) ( not ( = ?auto_30981 ?auto_30985 ) ) ( ON ?auto_30981 ?auto_30982 ) ( ON ?auto_30980 ?auto_30981 ) ( CLEAR ?auto_30980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30985 ?auto_30984 ?auto_30983 ?auto_30982 ?auto_30981 )
      ( MAKE-4PILE ?auto_30980 ?auto_30981 ?auto_30982 ?auto_30983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30987 - BLOCK
    )
    :vars
    (
      ?auto_30988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30988 ?auto_30987 ) ( CLEAR ?auto_30988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30987 ) ( not ( = ?auto_30987 ?auto_30988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30988 ?auto_30987 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30989 - BLOCK
    )
    :vars
    (
      ?auto_30990 - BLOCK
      ?auto_30991 - BLOCK
      ?auto_30992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30990 ?auto_30989 ) ( CLEAR ?auto_30990 ) ( ON-TABLE ?auto_30989 ) ( not ( = ?auto_30989 ?auto_30990 ) ) ( HOLDING ?auto_30991 ) ( CLEAR ?auto_30992 ) ( not ( = ?auto_30989 ?auto_30991 ) ) ( not ( = ?auto_30989 ?auto_30992 ) ) ( not ( = ?auto_30990 ?auto_30991 ) ) ( not ( = ?auto_30990 ?auto_30992 ) ) ( not ( = ?auto_30991 ?auto_30992 ) ) )
    :subtasks
    ( ( !STACK ?auto_30991 ?auto_30992 )
      ( MAKE-1PILE ?auto_30989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30993 - BLOCK
    )
    :vars
    (
      ?auto_30994 - BLOCK
      ?auto_30996 - BLOCK
      ?auto_30995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30994 ?auto_30993 ) ( ON-TABLE ?auto_30993 ) ( not ( = ?auto_30993 ?auto_30994 ) ) ( CLEAR ?auto_30996 ) ( not ( = ?auto_30993 ?auto_30995 ) ) ( not ( = ?auto_30993 ?auto_30996 ) ) ( not ( = ?auto_30994 ?auto_30995 ) ) ( not ( = ?auto_30994 ?auto_30996 ) ) ( not ( = ?auto_30995 ?auto_30996 ) ) ( ON ?auto_30995 ?auto_30994 ) ( CLEAR ?auto_30995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30993 ?auto_30994 )
      ( MAKE-1PILE ?auto_30993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30997 - BLOCK
    )
    :vars
    (
      ?auto_30999 - BLOCK
      ?auto_31000 - BLOCK
      ?auto_30998 - BLOCK
      ?auto_31001 - BLOCK
      ?auto_31002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30999 ?auto_30997 ) ( ON-TABLE ?auto_30997 ) ( not ( = ?auto_30997 ?auto_30999 ) ) ( not ( = ?auto_30997 ?auto_31000 ) ) ( not ( = ?auto_30997 ?auto_30998 ) ) ( not ( = ?auto_30999 ?auto_31000 ) ) ( not ( = ?auto_30999 ?auto_30998 ) ) ( not ( = ?auto_31000 ?auto_30998 ) ) ( ON ?auto_31000 ?auto_30999 ) ( CLEAR ?auto_31000 ) ( HOLDING ?auto_30998 ) ( CLEAR ?auto_31001 ) ( ON-TABLE ?auto_31002 ) ( ON ?auto_31001 ?auto_31002 ) ( not ( = ?auto_31002 ?auto_31001 ) ) ( not ( = ?auto_31002 ?auto_30998 ) ) ( not ( = ?auto_31001 ?auto_30998 ) ) ( not ( = ?auto_30997 ?auto_31001 ) ) ( not ( = ?auto_30997 ?auto_31002 ) ) ( not ( = ?auto_30999 ?auto_31001 ) ) ( not ( = ?auto_30999 ?auto_31002 ) ) ( not ( = ?auto_31000 ?auto_31001 ) ) ( not ( = ?auto_31000 ?auto_31002 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31002 ?auto_31001 ?auto_30998 )
      ( MAKE-1PILE ?auto_30997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31003 - BLOCK
    )
    :vars
    (
      ?auto_31006 - BLOCK
      ?auto_31007 - BLOCK
      ?auto_31005 - BLOCK
      ?auto_31004 - BLOCK
      ?auto_31008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31006 ?auto_31003 ) ( ON-TABLE ?auto_31003 ) ( not ( = ?auto_31003 ?auto_31006 ) ) ( not ( = ?auto_31003 ?auto_31007 ) ) ( not ( = ?auto_31003 ?auto_31005 ) ) ( not ( = ?auto_31006 ?auto_31007 ) ) ( not ( = ?auto_31006 ?auto_31005 ) ) ( not ( = ?auto_31007 ?auto_31005 ) ) ( ON ?auto_31007 ?auto_31006 ) ( CLEAR ?auto_31004 ) ( ON-TABLE ?auto_31008 ) ( ON ?auto_31004 ?auto_31008 ) ( not ( = ?auto_31008 ?auto_31004 ) ) ( not ( = ?auto_31008 ?auto_31005 ) ) ( not ( = ?auto_31004 ?auto_31005 ) ) ( not ( = ?auto_31003 ?auto_31004 ) ) ( not ( = ?auto_31003 ?auto_31008 ) ) ( not ( = ?auto_31006 ?auto_31004 ) ) ( not ( = ?auto_31006 ?auto_31008 ) ) ( not ( = ?auto_31007 ?auto_31004 ) ) ( not ( = ?auto_31007 ?auto_31008 ) ) ( ON ?auto_31005 ?auto_31007 ) ( CLEAR ?auto_31005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31003 ?auto_31006 ?auto_31007 )
      ( MAKE-1PILE ?auto_31003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31009 - BLOCK
    )
    :vars
    (
      ?auto_31013 - BLOCK
      ?auto_31011 - BLOCK
      ?auto_31014 - BLOCK
      ?auto_31012 - BLOCK
      ?auto_31010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31013 ?auto_31009 ) ( ON-TABLE ?auto_31009 ) ( not ( = ?auto_31009 ?auto_31013 ) ) ( not ( = ?auto_31009 ?auto_31011 ) ) ( not ( = ?auto_31009 ?auto_31014 ) ) ( not ( = ?auto_31013 ?auto_31011 ) ) ( not ( = ?auto_31013 ?auto_31014 ) ) ( not ( = ?auto_31011 ?auto_31014 ) ) ( ON ?auto_31011 ?auto_31013 ) ( ON-TABLE ?auto_31012 ) ( not ( = ?auto_31012 ?auto_31010 ) ) ( not ( = ?auto_31012 ?auto_31014 ) ) ( not ( = ?auto_31010 ?auto_31014 ) ) ( not ( = ?auto_31009 ?auto_31010 ) ) ( not ( = ?auto_31009 ?auto_31012 ) ) ( not ( = ?auto_31013 ?auto_31010 ) ) ( not ( = ?auto_31013 ?auto_31012 ) ) ( not ( = ?auto_31011 ?auto_31010 ) ) ( not ( = ?auto_31011 ?auto_31012 ) ) ( ON ?auto_31014 ?auto_31011 ) ( CLEAR ?auto_31014 ) ( HOLDING ?auto_31010 ) ( CLEAR ?auto_31012 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31012 ?auto_31010 )
      ( MAKE-1PILE ?auto_31009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31015 - BLOCK
    )
    :vars
    (
      ?auto_31017 - BLOCK
      ?auto_31020 - BLOCK
      ?auto_31019 - BLOCK
      ?auto_31018 - BLOCK
      ?auto_31016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31017 ?auto_31015 ) ( ON-TABLE ?auto_31015 ) ( not ( = ?auto_31015 ?auto_31017 ) ) ( not ( = ?auto_31015 ?auto_31020 ) ) ( not ( = ?auto_31015 ?auto_31019 ) ) ( not ( = ?auto_31017 ?auto_31020 ) ) ( not ( = ?auto_31017 ?auto_31019 ) ) ( not ( = ?auto_31020 ?auto_31019 ) ) ( ON ?auto_31020 ?auto_31017 ) ( ON-TABLE ?auto_31018 ) ( not ( = ?auto_31018 ?auto_31016 ) ) ( not ( = ?auto_31018 ?auto_31019 ) ) ( not ( = ?auto_31016 ?auto_31019 ) ) ( not ( = ?auto_31015 ?auto_31016 ) ) ( not ( = ?auto_31015 ?auto_31018 ) ) ( not ( = ?auto_31017 ?auto_31016 ) ) ( not ( = ?auto_31017 ?auto_31018 ) ) ( not ( = ?auto_31020 ?auto_31016 ) ) ( not ( = ?auto_31020 ?auto_31018 ) ) ( ON ?auto_31019 ?auto_31020 ) ( CLEAR ?auto_31018 ) ( ON ?auto_31016 ?auto_31019 ) ( CLEAR ?auto_31016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31015 ?auto_31017 ?auto_31020 ?auto_31019 )
      ( MAKE-1PILE ?auto_31015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31021 - BLOCK
    )
    :vars
    (
      ?auto_31024 - BLOCK
      ?auto_31022 - BLOCK
      ?auto_31023 - BLOCK
      ?auto_31025 - BLOCK
      ?auto_31026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31024 ?auto_31021 ) ( ON-TABLE ?auto_31021 ) ( not ( = ?auto_31021 ?auto_31024 ) ) ( not ( = ?auto_31021 ?auto_31022 ) ) ( not ( = ?auto_31021 ?auto_31023 ) ) ( not ( = ?auto_31024 ?auto_31022 ) ) ( not ( = ?auto_31024 ?auto_31023 ) ) ( not ( = ?auto_31022 ?auto_31023 ) ) ( ON ?auto_31022 ?auto_31024 ) ( not ( = ?auto_31025 ?auto_31026 ) ) ( not ( = ?auto_31025 ?auto_31023 ) ) ( not ( = ?auto_31026 ?auto_31023 ) ) ( not ( = ?auto_31021 ?auto_31026 ) ) ( not ( = ?auto_31021 ?auto_31025 ) ) ( not ( = ?auto_31024 ?auto_31026 ) ) ( not ( = ?auto_31024 ?auto_31025 ) ) ( not ( = ?auto_31022 ?auto_31026 ) ) ( not ( = ?auto_31022 ?auto_31025 ) ) ( ON ?auto_31023 ?auto_31022 ) ( ON ?auto_31026 ?auto_31023 ) ( CLEAR ?auto_31026 ) ( HOLDING ?auto_31025 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31025 )
      ( MAKE-1PILE ?auto_31021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31027 - BLOCK
    )
    :vars
    (
      ?auto_31031 - BLOCK
      ?auto_31030 - BLOCK
      ?auto_31028 - BLOCK
      ?auto_31029 - BLOCK
      ?auto_31032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31031 ?auto_31027 ) ( ON-TABLE ?auto_31027 ) ( not ( = ?auto_31027 ?auto_31031 ) ) ( not ( = ?auto_31027 ?auto_31030 ) ) ( not ( = ?auto_31027 ?auto_31028 ) ) ( not ( = ?auto_31031 ?auto_31030 ) ) ( not ( = ?auto_31031 ?auto_31028 ) ) ( not ( = ?auto_31030 ?auto_31028 ) ) ( ON ?auto_31030 ?auto_31031 ) ( not ( = ?auto_31029 ?auto_31032 ) ) ( not ( = ?auto_31029 ?auto_31028 ) ) ( not ( = ?auto_31032 ?auto_31028 ) ) ( not ( = ?auto_31027 ?auto_31032 ) ) ( not ( = ?auto_31027 ?auto_31029 ) ) ( not ( = ?auto_31031 ?auto_31032 ) ) ( not ( = ?auto_31031 ?auto_31029 ) ) ( not ( = ?auto_31030 ?auto_31032 ) ) ( not ( = ?auto_31030 ?auto_31029 ) ) ( ON ?auto_31028 ?auto_31030 ) ( ON ?auto_31032 ?auto_31028 ) ( ON ?auto_31029 ?auto_31032 ) ( CLEAR ?auto_31029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31027 ?auto_31031 ?auto_31030 ?auto_31028 ?auto_31032 )
      ( MAKE-1PILE ?auto_31027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31038 - BLOCK
      ?auto_31039 - BLOCK
      ?auto_31040 - BLOCK
      ?auto_31041 - BLOCK
      ?auto_31042 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31042 ) ( CLEAR ?auto_31041 ) ( ON-TABLE ?auto_31038 ) ( ON ?auto_31039 ?auto_31038 ) ( ON ?auto_31040 ?auto_31039 ) ( ON ?auto_31041 ?auto_31040 ) ( not ( = ?auto_31038 ?auto_31039 ) ) ( not ( = ?auto_31038 ?auto_31040 ) ) ( not ( = ?auto_31038 ?auto_31041 ) ) ( not ( = ?auto_31038 ?auto_31042 ) ) ( not ( = ?auto_31039 ?auto_31040 ) ) ( not ( = ?auto_31039 ?auto_31041 ) ) ( not ( = ?auto_31039 ?auto_31042 ) ) ( not ( = ?auto_31040 ?auto_31041 ) ) ( not ( = ?auto_31040 ?auto_31042 ) ) ( not ( = ?auto_31041 ?auto_31042 ) ) )
    :subtasks
    ( ( !STACK ?auto_31042 ?auto_31041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31043 - BLOCK
      ?auto_31044 - BLOCK
      ?auto_31045 - BLOCK
      ?auto_31046 - BLOCK
      ?auto_31047 - BLOCK
    )
    :vars
    (
      ?auto_31048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31046 ) ( ON-TABLE ?auto_31043 ) ( ON ?auto_31044 ?auto_31043 ) ( ON ?auto_31045 ?auto_31044 ) ( ON ?auto_31046 ?auto_31045 ) ( not ( = ?auto_31043 ?auto_31044 ) ) ( not ( = ?auto_31043 ?auto_31045 ) ) ( not ( = ?auto_31043 ?auto_31046 ) ) ( not ( = ?auto_31043 ?auto_31047 ) ) ( not ( = ?auto_31044 ?auto_31045 ) ) ( not ( = ?auto_31044 ?auto_31046 ) ) ( not ( = ?auto_31044 ?auto_31047 ) ) ( not ( = ?auto_31045 ?auto_31046 ) ) ( not ( = ?auto_31045 ?auto_31047 ) ) ( not ( = ?auto_31046 ?auto_31047 ) ) ( ON ?auto_31047 ?auto_31048 ) ( CLEAR ?auto_31047 ) ( HAND-EMPTY ) ( not ( = ?auto_31043 ?auto_31048 ) ) ( not ( = ?auto_31044 ?auto_31048 ) ) ( not ( = ?auto_31045 ?auto_31048 ) ) ( not ( = ?auto_31046 ?auto_31048 ) ) ( not ( = ?auto_31047 ?auto_31048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31047 ?auto_31048 )
      ( MAKE-5PILE ?auto_31043 ?auto_31044 ?auto_31045 ?auto_31046 ?auto_31047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31049 - BLOCK
      ?auto_31050 - BLOCK
      ?auto_31051 - BLOCK
      ?auto_31052 - BLOCK
      ?auto_31053 - BLOCK
    )
    :vars
    (
      ?auto_31054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31049 ) ( ON ?auto_31050 ?auto_31049 ) ( ON ?auto_31051 ?auto_31050 ) ( not ( = ?auto_31049 ?auto_31050 ) ) ( not ( = ?auto_31049 ?auto_31051 ) ) ( not ( = ?auto_31049 ?auto_31052 ) ) ( not ( = ?auto_31049 ?auto_31053 ) ) ( not ( = ?auto_31050 ?auto_31051 ) ) ( not ( = ?auto_31050 ?auto_31052 ) ) ( not ( = ?auto_31050 ?auto_31053 ) ) ( not ( = ?auto_31051 ?auto_31052 ) ) ( not ( = ?auto_31051 ?auto_31053 ) ) ( not ( = ?auto_31052 ?auto_31053 ) ) ( ON ?auto_31053 ?auto_31054 ) ( CLEAR ?auto_31053 ) ( not ( = ?auto_31049 ?auto_31054 ) ) ( not ( = ?auto_31050 ?auto_31054 ) ) ( not ( = ?auto_31051 ?auto_31054 ) ) ( not ( = ?auto_31052 ?auto_31054 ) ) ( not ( = ?auto_31053 ?auto_31054 ) ) ( HOLDING ?auto_31052 ) ( CLEAR ?auto_31051 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31049 ?auto_31050 ?auto_31051 ?auto_31052 )
      ( MAKE-5PILE ?auto_31049 ?auto_31050 ?auto_31051 ?auto_31052 ?auto_31053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31055 - BLOCK
      ?auto_31056 - BLOCK
      ?auto_31057 - BLOCK
      ?auto_31058 - BLOCK
      ?auto_31059 - BLOCK
    )
    :vars
    (
      ?auto_31060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31055 ) ( ON ?auto_31056 ?auto_31055 ) ( ON ?auto_31057 ?auto_31056 ) ( not ( = ?auto_31055 ?auto_31056 ) ) ( not ( = ?auto_31055 ?auto_31057 ) ) ( not ( = ?auto_31055 ?auto_31058 ) ) ( not ( = ?auto_31055 ?auto_31059 ) ) ( not ( = ?auto_31056 ?auto_31057 ) ) ( not ( = ?auto_31056 ?auto_31058 ) ) ( not ( = ?auto_31056 ?auto_31059 ) ) ( not ( = ?auto_31057 ?auto_31058 ) ) ( not ( = ?auto_31057 ?auto_31059 ) ) ( not ( = ?auto_31058 ?auto_31059 ) ) ( ON ?auto_31059 ?auto_31060 ) ( not ( = ?auto_31055 ?auto_31060 ) ) ( not ( = ?auto_31056 ?auto_31060 ) ) ( not ( = ?auto_31057 ?auto_31060 ) ) ( not ( = ?auto_31058 ?auto_31060 ) ) ( not ( = ?auto_31059 ?auto_31060 ) ) ( CLEAR ?auto_31057 ) ( ON ?auto_31058 ?auto_31059 ) ( CLEAR ?auto_31058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31060 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31060 ?auto_31059 )
      ( MAKE-5PILE ?auto_31055 ?auto_31056 ?auto_31057 ?auto_31058 ?auto_31059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31061 - BLOCK
      ?auto_31062 - BLOCK
      ?auto_31063 - BLOCK
      ?auto_31064 - BLOCK
      ?auto_31065 - BLOCK
    )
    :vars
    (
      ?auto_31066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31061 ) ( ON ?auto_31062 ?auto_31061 ) ( not ( = ?auto_31061 ?auto_31062 ) ) ( not ( = ?auto_31061 ?auto_31063 ) ) ( not ( = ?auto_31061 ?auto_31064 ) ) ( not ( = ?auto_31061 ?auto_31065 ) ) ( not ( = ?auto_31062 ?auto_31063 ) ) ( not ( = ?auto_31062 ?auto_31064 ) ) ( not ( = ?auto_31062 ?auto_31065 ) ) ( not ( = ?auto_31063 ?auto_31064 ) ) ( not ( = ?auto_31063 ?auto_31065 ) ) ( not ( = ?auto_31064 ?auto_31065 ) ) ( ON ?auto_31065 ?auto_31066 ) ( not ( = ?auto_31061 ?auto_31066 ) ) ( not ( = ?auto_31062 ?auto_31066 ) ) ( not ( = ?auto_31063 ?auto_31066 ) ) ( not ( = ?auto_31064 ?auto_31066 ) ) ( not ( = ?auto_31065 ?auto_31066 ) ) ( ON ?auto_31064 ?auto_31065 ) ( CLEAR ?auto_31064 ) ( ON-TABLE ?auto_31066 ) ( HOLDING ?auto_31063 ) ( CLEAR ?auto_31062 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31061 ?auto_31062 ?auto_31063 )
      ( MAKE-5PILE ?auto_31061 ?auto_31062 ?auto_31063 ?auto_31064 ?auto_31065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31067 - BLOCK
      ?auto_31068 - BLOCK
      ?auto_31069 - BLOCK
      ?auto_31070 - BLOCK
      ?auto_31071 - BLOCK
    )
    :vars
    (
      ?auto_31072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31067 ) ( ON ?auto_31068 ?auto_31067 ) ( not ( = ?auto_31067 ?auto_31068 ) ) ( not ( = ?auto_31067 ?auto_31069 ) ) ( not ( = ?auto_31067 ?auto_31070 ) ) ( not ( = ?auto_31067 ?auto_31071 ) ) ( not ( = ?auto_31068 ?auto_31069 ) ) ( not ( = ?auto_31068 ?auto_31070 ) ) ( not ( = ?auto_31068 ?auto_31071 ) ) ( not ( = ?auto_31069 ?auto_31070 ) ) ( not ( = ?auto_31069 ?auto_31071 ) ) ( not ( = ?auto_31070 ?auto_31071 ) ) ( ON ?auto_31071 ?auto_31072 ) ( not ( = ?auto_31067 ?auto_31072 ) ) ( not ( = ?auto_31068 ?auto_31072 ) ) ( not ( = ?auto_31069 ?auto_31072 ) ) ( not ( = ?auto_31070 ?auto_31072 ) ) ( not ( = ?auto_31071 ?auto_31072 ) ) ( ON ?auto_31070 ?auto_31071 ) ( ON-TABLE ?auto_31072 ) ( CLEAR ?auto_31068 ) ( ON ?auto_31069 ?auto_31070 ) ( CLEAR ?auto_31069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31072 ?auto_31071 ?auto_31070 )
      ( MAKE-5PILE ?auto_31067 ?auto_31068 ?auto_31069 ?auto_31070 ?auto_31071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31073 - BLOCK
      ?auto_31074 - BLOCK
      ?auto_31075 - BLOCK
      ?auto_31076 - BLOCK
      ?auto_31077 - BLOCK
    )
    :vars
    (
      ?auto_31078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31073 ) ( not ( = ?auto_31073 ?auto_31074 ) ) ( not ( = ?auto_31073 ?auto_31075 ) ) ( not ( = ?auto_31073 ?auto_31076 ) ) ( not ( = ?auto_31073 ?auto_31077 ) ) ( not ( = ?auto_31074 ?auto_31075 ) ) ( not ( = ?auto_31074 ?auto_31076 ) ) ( not ( = ?auto_31074 ?auto_31077 ) ) ( not ( = ?auto_31075 ?auto_31076 ) ) ( not ( = ?auto_31075 ?auto_31077 ) ) ( not ( = ?auto_31076 ?auto_31077 ) ) ( ON ?auto_31077 ?auto_31078 ) ( not ( = ?auto_31073 ?auto_31078 ) ) ( not ( = ?auto_31074 ?auto_31078 ) ) ( not ( = ?auto_31075 ?auto_31078 ) ) ( not ( = ?auto_31076 ?auto_31078 ) ) ( not ( = ?auto_31077 ?auto_31078 ) ) ( ON ?auto_31076 ?auto_31077 ) ( ON-TABLE ?auto_31078 ) ( ON ?auto_31075 ?auto_31076 ) ( CLEAR ?auto_31075 ) ( HOLDING ?auto_31074 ) ( CLEAR ?auto_31073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31073 ?auto_31074 )
      ( MAKE-5PILE ?auto_31073 ?auto_31074 ?auto_31075 ?auto_31076 ?auto_31077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31079 - BLOCK
      ?auto_31080 - BLOCK
      ?auto_31081 - BLOCK
      ?auto_31082 - BLOCK
      ?auto_31083 - BLOCK
    )
    :vars
    (
      ?auto_31084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31079 ) ( not ( = ?auto_31079 ?auto_31080 ) ) ( not ( = ?auto_31079 ?auto_31081 ) ) ( not ( = ?auto_31079 ?auto_31082 ) ) ( not ( = ?auto_31079 ?auto_31083 ) ) ( not ( = ?auto_31080 ?auto_31081 ) ) ( not ( = ?auto_31080 ?auto_31082 ) ) ( not ( = ?auto_31080 ?auto_31083 ) ) ( not ( = ?auto_31081 ?auto_31082 ) ) ( not ( = ?auto_31081 ?auto_31083 ) ) ( not ( = ?auto_31082 ?auto_31083 ) ) ( ON ?auto_31083 ?auto_31084 ) ( not ( = ?auto_31079 ?auto_31084 ) ) ( not ( = ?auto_31080 ?auto_31084 ) ) ( not ( = ?auto_31081 ?auto_31084 ) ) ( not ( = ?auto_31082 ?auto_31084 ) ) ( not ( = ?auto_31083 ?auto_31084 ) ) ( ON ?auto_31082 ?auto_31083 ) ( ON-TABLE ?auto_31084 ) ( ON ?auto_31081 ?auto_31082 ) ( CLEAR ?auto_31079 ) ( ON ?auto_31080 ?auto_31081 ) ( CLEAR ?auto_31080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31084 ?auto_31083 ?auto_31082 ?auto_31081 )
      ( MAKE-5PILE ?auto_31079 ?auto_31080 ?auto_31081 ?auto_31082 ?auto_31083 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31085 - BLOCK
      ?auto_31086 - BLOCK
      ?auto_31087 - BLOCK
      ?auto_31088 - BLOCK
      ?auto_31089 - BLOCK
    )
    :vars
    (
      ?auto_31090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31085 ?auto_31086 ) ) ( not ( = ?auto_31085 ?auto_31087 ) ) ( not ( = ?auto_31085 ?auto_31088 ) ) ( not ( = ?auto_31085 ?auto_31089 ) ) ( not ( = ?auto_31086 ?auto_31087 ) ) ( not ( = ?auto_31086 ?auto_31088 ) ) ( not ( = ?auto_31086 ?auto_31089 ) ) ( not ( = ?auto_31087 ?auto_31088 ) ) ( not ( = ?auto_31087 ?auto_31089 ) ) ( not ( = ?auto_31088 ?auto_31089 ) ) ( ON ?auto_31089 ?auto_31090 ) ( not ( = ?auto_31085 ?auto_31090 ) ) ( not ( = ?auto_31086 ?auto_31090 ) ) ( not ( = ?auto_31087 ?auto_31090 ) ) ( not ( = ?auto_31088 ?auto_31090 ) ) ( not ( = ?auto_31089 ?auto_31090 ) ) ( ON ?auto_31088 ?auto_31089 ) ( ON-TABLE ?auto_31090 ) ( ON ?auto_31087 ?auto_31088 ) ( ON ?auto_31086 ?auto_31087 ) ( CLEAR ?auto_31086 ) ( HOLDING ?auto_31085 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31085 )
      ( MAKE-5PILE ?auto_31085 ?auto_31086 ?auto_31087 ?auto_31088 ?auto_31089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31091 - BLOCK
      ?auto_31092 - BLOCK
      ?auto_31093 - BLOCK
      ?auto_31094 - BLOCK
      ?auto_31095 - BLOCK
    )
    :vars
    (
      ?auto_31096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31091 ?auto_31092 ) ) ( not ( = ?auto_31091 ?auto_31093 ) ) ( not ( = ?auto_31091 ?auto_31094 ) ) ( not ( = ?auto_31091 ?auto_31095 ) ) ( not ( = ?auto_31092 ?auto_31093 ) ) ( not ( = ?auto_31092 ?auto_31094 ) ) ( not ( = ?auto_31092 ?auto_31095 ) ) ( not ( = ?auto_31093 ?auto_31094 ) ) ( not ( = ?auto_31093 ?auto_31095 ) ) ( not ( = ?auto_31094 ?auto_31095 ) ) ( ON ?auto_31095 ?auto_31096 ) ( not ( = ?auto_31091 ?auto_31096 ) ) ( not ( = ?auto_31092 ?auto_31096 ) ) ( not ( = ?auto_31093 ?auto_31096 ) ) ( not ( = ?auto_31094 ?auto_31096 ) ) ( not ( = ?auto_31095 ?auto_31096 ) ) ( ON ?auto_31094 ?auto_31095 ) ( ON-TABLE ?auto_31096 ) ( ON ?auto_31093 ?auto_31094 ) ( ON ?auto_31092 ?auto_31093 ) ( ON ?auto_31091 ?auto_31092 ) ( CLEAR ?auto_31091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31096 ?auto_31095 ?auto_31094 ?auto_31093 ?auto_31092 )
      ( MAKE-5PILE ?auto_31091 ?auto_31092 ?auto_31093 ?auto_31094 ?auto_31095 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31101 - BLOCK
      ?auto_31102 - BLOCK
      ?auto_31103 - BLOCK
      ?auto_31104 - BLOCK
    )
    :vars
    (
      ?auto_31105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31105 ?auto_31104 ) ( CLEAR ?auto_31105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31101 ) ( ON ?auto_31102 ?auto_31101 ) ( ON ?auto_31103 ?auto_31102 ) ( ON ?auto_31104 ?auto_31103 ) ( not ( = ?auto_31101 ?auto_31102 ) ) ( not ( = ?auto_31101 ?auto_31103 ) ) ( not ( = ?auto_31101 ?auto_31104 ) ) ( not ( = ?auto_31101 ?auto_31105 ) ) ( not ( = ?auto_31102 ?auto_31103 ) ) ( not ( = ?auto_31102 ?auto_31104 ) ) ( not ( = ?auto_31102 ?auto_31105 ) ) ( not ( = ?auto_31103 ?auto_31104 ) ) ( not ( = ?auto_31103 ?auto_31105 ) ) ( not ( = ?auto_31104 ?auto_31105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31105 ?auto_31104 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31117 - BLOCK
      ?auto_31118 - BLOCK
      ?auto_31119 - BLOCK
      ?auto_31120 - BLOCK
    )
    :vars
    (
      ?auto_31121 - BLOCK
      ?auto_31122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31117 ) ( ON ?auto_31118 ?auto_31117 ) ( ON ?auto_31119 ?auto_31118 ) ( not ( = ?auto_31117 ?auto_31118 ) ) ( not ( = ?auto_31117 ?auto_31119 ) ) ( not ( = ?auto_31117 ?auto_31120 ) ) ( not ( = ?auto_31117 ?auto_31121 ) ) ( not ( = ?auto_31118 ?auto_31119 ) ) ( not ( = ?auto_31118 ?auto_31120 ) ) ( not ( = ?auto_31118 ?auto_31121 ) ) ( not ( = ?auto_31119 ?auto_31120 ) ) ( not ( = ?auto_31119 ?auto_31121 ) ) ( not ( = ?auto_31120 ?auto_31121 ) ) ( ON ?auto_31121 ?auto_31122 ) ( CLEAR ?auto_31121 ) ( not ( = ?auto_31117 ?auto_31122 ) ) ( not ( = ?auto_31118 ?auto_31122 ) ) ( not ( = ?auto_31119 ?auto_31122 ) ) ( not ( = ?auto_31120 ?auto_31122 ) ) ( not ( = ?auto_31121 ?auto_31122 ) ) ( HOLDING ?auto_31120 ) ( CLEAR ?auto_31119 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31117 ?auto_31118 ?auto_31119 ?auto_31120 ?auto_31121 )
      ( MAKE-4PILE ?auto_31117 ?auto_31118 ?auto_31119 ?auto_31120 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31123 - BLOCK
      ?auto_31124 - BLOCK
      ?auto_31125 - BLOCK
      ?auto_31126 - BLOCK
    )
    :vars
    (
      ?auto_31128 - BLOCK
      ?auto_31127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31123 ) ( ON ?auto_31124 ?auto_31123 ) ( ON ?auto_31125 ?auto_31124 ) ( not ( = ?auto_31123 ?auto_31124 ) ) ( not ( = ?auto_31123 ?auto_31125 ) ) ( not ( = ?auto_31123 ?auto_31126 ) ) ( not ( = ?auto_31123 ?auto_31128 ) ) ( not ( = ?auto_31124 ?auto_31125 ) ) ( not ( = ?auto_31124 ?auto_31126 ) ) ( not ( = ?auto_31124 ?auto_31128 ) ) ( not ( = ?auto_31125 ?auto_31126 ) ) ( not ( = ?auto_31125 ?auto_31128 ) ) ( not ( = ?auto_31126 ?auto_31128 ) ) ( ON ?auto_31128 ?auto_31127 ) ( not ( = ?auto_31123 ?auto_31127 ) ) ( not ( = ?auto_31124 ?auto_31127 ) ) ( not ( = ?auto_31125 ?auto_31127 ) ) ( not ( = ?auto_31126 ?auto_31127 ) ) ( not ( = ?auto_31128 ?auto_31127 ) ) ( CLEAR ?auto_31125 ) ( ON ?auto_31126 ?auto_31128 ) ( CLEAR ?auto_31126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31127 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31127 ?auto_31128 )
      ( MAKE-4PILE ?auto_31123 ?auto_31124 ?auto_31125 ?auto_31126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31129 - BLOCK
      ?auto_31130 - BLOCK
      ?auto_31131 - BLOCK
      ?auto_31132 - BLOCK
    )
    :vars
    (
      ?auto_31134 - BLOCK
      ?auto_31133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31129 ) ( ON ?auto_31130 ?auto_31129 ) ( not ( = ?auto_31129 ?auto_31130 ) ) ( not ( = ?auto_31129 ?auto_31131 ) ) ( not ( = ?auto_31129 ?auto_31132 ) ) ( not ( = ?auto_31129 ?auto_31134 ) ) ( not ( = ?auto_31130 ?auto_31131 ) ) ( not ( = ?auto_31130 ?auto_31132 ) ) ( not ( = ?auto_31130 ?auto_31134 ) ) ( not ( = ?auto_31131 ?auto_31132 ) ) ( not ( = ?auto_31131 ?auto_31134 ) ) ( not ( = ?auto_31132 ?auto_31134 ) ) ( ON ?auto_31134 ?auto_31133 ) ( not ( = ?auto_31129 ?auto_31133 ) ) ( not ( = ?auto_31130 ?auto_31133 ) ) ( not ( = ?auto_31131 ?auto_31133 ) ) ( not ( = ?auto_31132 ?auto_31133 ) ) ( not ( = ?auto_31134 ?auto_31133 ) ) ( ON ?auto_31132 ?auto_31134 ) ( CLEAR ?auto_31132 ) ( ON-TABLE ?auto_31133 ) ( HOLDING ?auto_31131 ) ( CLEAR ?auto_31130 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31129 ?auto_31130 ?auto_31131 )
      ( MAKE-4PILE ?auto_31129 ?auto_31130 ?auto_31131 ?auto_31132 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31135 - BLOCK
      ?auto_31136 - BLOCK
      ?auto_31137 - BLOCK
      ?auto_31138 - BLOCK
    )
    :vars
    (
      ?auto_31140 - BLOCK
      ?auto_31139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31135 ) ( ON ?auto_31136 ?auto_31135 ) ( not ( = ?auto_31135 ?auto_31136 ) ) ( not ( = ?auto_31135 ?auto_31137 ) ) ( not ( = ?auto_31135 ?auto_31138 ) ) ( not ( = ?auto_31135 ?auto_31140 ) ) ( not ( = ?auto_31136 ?auto_31137 ) ) ( not ( = ?auto_31136 ?auto_31138 ) ) ( not ( = ?auto_31136 ?auto_31140 ) ) ( not ( = ?auto_31137 ?auto_31138 ) ) ( not ( = ?auto_31137 ?auto_31140 ) ) ( not ( = ?auto_31138 ?auto_31140 ) ) ( ON ?auto_31140 ?auto_31139 ) ( not ( = ?auto_31135 ?auto_31139 ) ) ( not ( = ?auto_31136 ?auto_31139 ) ) ( not ( = ?auto_31137 ?auto_31139 ) ) ( not ( = ?auto_31138 ?auto_31139 ) ) ( not ( = ?auto_31140 ?auto_31139 ) ) ( ON ?auto_31138 ?auto_31140 ) ( ON-TABLE ?auto_31139 ) ( CLEAR ?auto_31136 ) ( ON ?auto_31137 ?auto_31138 ) ( CLEAR ?auto_31137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31139 ?auto_31140 ?auto_31138 )
      ( MAKE-4PILE ?auto_31135 ?auto_31136 ?auto_31137 ?auto_31138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31141 - BLOCK
      ?auto_31142 - BLOCK
      ?auto_31143 - BLOCK
      ?auto_31144 - BLOCK
    )
    :vars
    (
      ?auto_31145 - BLOCK
      ?auto_31146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31141 ) ( not ( = ?auto_31141 ?auto_31142 ) ) ( not ( = ?auto_31141 ?auto_31143 ) ) ( not ( = ?auto_31141 ?auto_31144 ) ) ( not ( = ?auto_31141 ?auto_31145 ) ) ( not ( = ?auto_31142 ?auto_31143 ) ) ( not ( = ?auto_31142 ?auto_31144 ) ) ( not ( = ?auto_31142 ?auto_31145 ) ) ( not ( = ?auto_31143 ?auto_31144 ) ) ( not ( = ?auto_31143 ?auto_31145 ) ) ( not ( = ?auto_31144 ?auto_31145 ) ) ( ON ?auto_31145 ?auto_31146 ) ( not ( = ?auto_31141 ?auto_31146 ) ) ( not ( = ?auto_31142 ?auto_31146 ) ) ( not ( = ?auto_31143 ?auto_31146 ) ) ( not ( = ?auto_31144 ?auto_31146 ) ) ( not ( = ?auto_31145 ?auto_31146 ) ) ( ON ?auto_31144 ?auto_31145 ) ( ON-TABLE ?auto_31146 ) ( ON ?auto_31143 ?auto_31144 ) ( CLEAR ?auto_31143 ) ( HOLDING ?auto_31142 ) ( CLEAR ?auto_31141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31141 ?auto_31142 )
      ( MAKE-4PILE ?auto_31141 ?auto_31142 ?auto_31143 ?auto_31144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31147 - BLOCK
      ?auto_31148 - BLOCK
      ?auto_31149 - BLOCK
      ?auto_31150 - BLOCK
    )
    :vars
    (
      ?auto_31152 - BLOCK
      ?auto_31151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31147 ) ( not ( = ?auto_31147 ?auto_31148 ) ) ( not ( = ?auto_31147 ?auto_31149 ) ) ( not ( = ?auto_31147 ?auto_31150 ) ) ( not ( = ?auto_31147 ?auto_31152 ) ) ( not ( = ?auto_31148 ?auto_31149 ) ) ( not ( = ?auto_31148 ?auto_31150 ) ) ( not ( = ?auto_31148 ?auto_31152 ) ) ( not ( = ?auto_31149 ?auto_31150 ) ) ( not ( = ?auto_31149 ?auto_31152 ) ) ( not ( = ?auto_31150 ?auto_31152 ) ) ( ON ?auto_31152 ?auto_31151 ) ( not ( = ?auto_31147 ?auto_31151 ) ) ( not ( = ?auto_31148 ?auto_31151 ) ) ( not ( = ?auto_31149 ?auto_31151 ) ) ( not ( = ?auto_31150 ?auto_31151 ) ) ( not ( = ?auto_31152 ?auto_31151 ) ) ( ON ?auto_31150 ?auto_31152 ) ( ON-TABLE ?auto_31151 ) ( ON ?auto_31149 ?auto_31150 ) ( CLEAR ?auto_31147 ) ( ON ?auto_31148 ?auto_31149 ) ( CLEAR ?auto_31148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31151 ?auto_31152 ?auto_31150 ?auto_31149 )
      ( MAKE-4PILE ?auto_31147 ?auto_31148 ?auto_31149 ?auto_31150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31153 - BLOCK
      ?auto_31154 - BLOCK
      ?auto_31155 - BLOCK
      ?auto_31156 - BLOCK
    )
    :vars
    (
      ?auto_31157 - BLOCK
      ?auto_31158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31153 ?auto_31154 ) ) ( not ( = ?auto_31153 ?auto_31155 ) ) ( not ( = ?auto_31153 ?auto_31156 ) ) ( not ( = ?auto_31153 ?auto_31157 ) ) ( not ( = ?auto_31154 ?auto_31155 ) ) ( not ( = ?auto_31154 ?auto_31156 ) ) ( not ( = ?auto_31154 ?auto_31157 ) ) ( not ( = ?auto_31155 ?auto_31156 ) ) ( not ( = ?auto_31155 ?auto_31157 ) ) ( not ( = ?auto_31156 ?auto_31157 ) ) ( ON ?auto_31157 ?auto_31158 ) ( not ( = ?auto_31153 ?auto_31158 ) ) ( not ( = ?auto_31154 ?auto_31158 ) ) ( not ( = ?auto_31155 ?auto_31158 ) ) ( not ( = ?auto_31156 ?auto_31158 ) ) ( not ( = ?auto_31157 ?auto_31158 ) ) ( ON ?auto_31156 ?auto_31157 ) ( ON-TABLE ?auto_31158 ) ( ON ?auto_31155 ?auto_31156 ) ( ON ?auto_31154 ?auto_31155 ) ( CLEAR ?auto_31154 ) ( HOLDING ?auto_31153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31153 )
      ( MAKE-4PILE ?auto_31153 ?auto_31154 ?auto_31155 ?auto_31156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31159 - BLOCK
      ?auto_31160 - BLOCK
      ?auto_31161 - BLOCK
      ?auto_31162 - BLOCK
    )
    :vars
    (
      ?auto_31164 - BLOCK
      ?auto_31163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31159 ?auto_31160 ) ) ( not ( = ?auto_31159 ?auto_31161 ) ) ( not ( = ?auto_31159 ?auto_31162 ) ) ( not ( = ?auto_31159 ?auto_31164 ) ) ( not ( = ?auto_31160 ?auto_31161 ) ) ( not ( = ?auto_31160 ?auto_31162 ) ) ( not ( = ?auto_31160 ?auto_31164 ) ) ( not ( = ?auto_31161 ?auto_31162 ) ) ( not ( = ?auto_31161 ?auto_31164 ) ) ( not ( = ?auto_31162 ?auto_31164 ) ) ( ON ?auto_31164 ?auto_31163 ) ( not ( = ?auto_31159 ?auto_31163 ) ) ( not ( = ?auto_31160 ?auto_31163 ) ) ( not ( = ?auto_31161 ?auto_31163 ) ) ( not ( = ?auto_31162 ?auto_31163 ) ) ( not ( = ?auto_31164 ?auto_31163 ) ) ( ON ?auto_31162 ?auto_31164 ) ( ON-TABLE ?auto_31163 ) ( ON ?auto_31161 ?auto_31162 ) ( ON ?auto_31160 ?auto_31161 ) ( ON ?auto_31159 ?auto_31160 ) ( CLEAR ?auto_31159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31163 ?auto_31164 ?auto_31162 ?auto_31161 ?auto_31160 )
      ( MAKE-4PILE ?auto_31159 ?auto_31160 ?auto_31161 ?auto_31162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31166 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31166 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_31166 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31167 - BLOCK
    )
    :vars
    (
      ?auto_31168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31167 ?auto_31168 ) ( CLEAR ?auto_31167 ) ( HAND-EMPTY ) ( not ( = ?auto_31167 ?auto_31168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31167 ?auto_31168 )
      ( MAKE-1PILE ?auto_31167 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31169 - BLOCK
    )
    :vars
    (
      ?auto_31170 - BLOCK
      ?auto_31172 - BLOCK
      ?auto_31173 - BLOCK
      ?auto_31171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31169 ?auto_31170 ) ) ( HOLDING ?auto_31169 ) ( CLEAR ?auto_31170 ) ( ON-TABLE ?auto_31172 ) ( ON ?auto_31173 ?auto_31172 ) ( ON ?auto_31171 ?auto_31173 ) ( ON ?auto_31170 ?auto_31171 ) ( not ( = ?auto_31172 ?auto_31173 ) ) ( not ( = ?auto_31172 ?auto_31171 ) ) ( not ( = ?auto_31172 ?auto_31170 ) ) ( not ( = ?auto_31172 ?auto_31169 ) ) ( not ( = ?auto_31173 ?auto_31171 ) ) ( not ( = ?auto_31173 ?auto_31170 ) ) ( not ( = ?auto_31173 ?auto_31169 ) ) ( not ( = ?auto_31171 ?auto_31170 ) ) ( not ( = ?auto_31171 ?auto_31169 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31172 ?auto_31173 ?auto_31171 ?auto_31170 ?auto_31169 )
      ( MAKE-1PILE ?auto_31169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31174 - BLOCK
    )
    :vars
    (
      ?auto_31177 - BLOCK
      ?auto_31175 - BLOCK
      ?auto_31178 - BLOCK
      ?auto_31176 - BLOCK
      ?auto_31179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31174 ?auto_31177 ) ) ( CLEAR ?auto_31177 ) ( ON-TABLE ?auto_31175 ) ( ON ?auto_31178 ?auto_31175 ) ( ON ?auto_31176 ?auto_31178 ) ( ON ?auto_31177 ?auto_31176 ) ( not ( = ?auto_31175 ?auto_31178 ) ) ( not ( = ?auto_31175 ?auto_31176 ) ) ( not ( = ?auto_31175 ?auto_31177 ) ) ( not ( = ?auto_31175 ?auto_31174 ) ) ( not ( = ?auto_31178 ?auto_31176 ) ) ( not ( = ?auto_31178 ?auto_31177 ) ) ( not ( = ?auto_31178 ?auto_31174 ) ) ( not ( = ?auto_31176 ?auto_31177 ) ) ( not ( = ?auto_31176 ?auto_31174 ) ) ( ON ?auto_31174 ?auto_31179 ) ( CLEAR ?auto_31174 ) ( HAND-EMPTY ) ( not ( = ?auto_31174 ?auto_31179 ) ) ( not ( = ?auto_31177 ?auto_31179 ) ) ( not ( = ?auto_31175 ?auto_31179 ) ) ( not ( = ?auto_31178 ?auto_31179 ) ) ( not ( = ?auto_31176 ?auto_31179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31174 ?auto_31179 )
      ( MAKE-1PILE ?auto_31174 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31180 - BLOCK
    )
    :vars
    (
      ?auto_31181 - BLOCK
      ?auto_31183 - BLOCK
      ?auto_31185 - BLOCK
      ?auto_31184 - BLOCK
      ?auto_31182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31180 ?auto_31181 ) ) ( ON-TABLE ?auto_31183 ) ( ON ?auto_31185 ?auto_31183 ) ( ON ?auto_31184 ?auto_31185 ) ( not ( = ?auto_31183 ?auto_31185 ) ) ( not ( = ?auto_31183 ?auto_31184 ) ) ( not ( = ?auto_31183 ?auto_31181 ) ) ( not ( = ?auto_31183 ?auto_31180 ) ) ( not ( = ?auto_31185 ?auto_31184 ) ) ( not ( = ?auto_31185 ?auto_31181 ) ) ( not ( = ?auto_31185 ?auto_31180 ) ) ( not ( = ?auto_31184 ?auto_31181 ) ) ( not ( = ?auto_31184 ?auto_31180 ) ) ( ON ?auto_31180 ?auto_31182 ) ( CLEAR ?auto_31180 ) ( not ( = ?auto_31180 ?auto_31182 ) ) ( not ( = ?auto_31181 ?auto_31182 ) ) ( not ( = ?auto_31183 ?auto_31182 ) ) ( not ( = ?auto_31185 ?auto_31182 ) ) ( not ( = ?auto_31184 ?auto_31182 ) ) ( HOLDING ?auto_31181 ) ( CLEAR ?auto_31184 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31183 ?auto_31185 ?auto_31184 ?auto_31181 )
      ( MAKE-1PILE ?auto_31180 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31186 - BLOCK
    )
    :vars
    (
      ?auto_31189 - BLOCK
      ?auto_31187 - BLOCK
      ?auto_31191 - BLOCK
      ?auto_31188 - BLOCK
      ?auto_31190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31186 ?auto_31189 ) ) ( ON-TABLE ?auto_31187 ) ( ON ?auto_31191 ?auto_31187 ) ( ON ?auto_31188 ?auto_31191 ) ( not ( = ?auto_31187 ?auto_31191 ) ) ( not ( = ?auto_31187 ?auto_31188 ) ) ( not ( = ?auto_31187 ?auto_31189 ) ) ( not ( = ?auto_31187 ?auto_31186 ) ) ( not ( = ?auto_31191 ?auto_31188 ) ) ( not ( = ?auto_31191 ?auto_31189 ) ) ( not ( = ?auto_31191 ?auto_31186 ) ) ( not ( = ?auto_31188 ?auto_31189 ) ) ( not ( = ?auto_31188 ?auto_31186 ) ) ( ON ?auto_31186 ?auto_31190 ) ( not ( = ?auto_31186 ?auto_31190 ) ) ( not ( = ?auto_31189 ?auto_31190 ) ) ( not ( = ?auto_31187 ?auto_31190 ) ) ( not ( = ?auto_31191 ?auto_31190 ) ) ( not ( = ?auto_31188 ?auto_31190 ) ) ( CLEAR ?auto_31188 ) ( ON ?auto_31189 ?auto_31186 ) ( CLEAR ?auto_31189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31190 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31190 ?auto_31186 )
      ( MAKE-1PILE ?auto_31186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31192 - BLOCK
    )
    :vars
    (
      ?auto_31195 - BLOCK
      ?auto_31196 - BLOCK
      ?auto_31197 - BLOCK
      ?auto_31194 - BLOCK
      ?auto_31193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31192 ?auto_31195 ) ) ( ON-TABLE ?auto_31196 ) ( ON ?auto_31197 ?auto_31196 ) ( not ( = ?auto_31196 ?auto_31197 ) ) ( not ( = ?auto_31196 ?auto_31194 ) ) ( not ( = ?auto_31196 ?auto_31195 ) ) ( not ( = ?auto_31196 ?auto_31192 ) ) ( not ( = ?auto_31197 ?auto_31194 ) ) ( not ( = ?auto_31197 ?auto_31195 ) ) ( not ( = ?auto_31197 ?auto_31192 ) ) ( not ( = ?auto_31194 ?auto_31195 ) ) ( not ( = ?auto_31194 ?auto_31192 ) ) ( ON ?auto_31192 ?auto_31193 ) ( not ( = ?auto_31192 ?auto_31193 ) ) ( not ( = ?auto_31195 ?auto_31193 ) ) ( not ( = ?auto_31196 ?auto_31193 ) ) ( not ( = ?auto_31197 ?auto_31193 ) ) ( not ( = ?auto_31194 ?auto_31193 ) ) ( ON ?auto_31195 ?auto_31192 ) ( CLEAR ?auto_31195 ) ( ON-TABLE ?auto_31193 ) ( HOLDING ?auto_31194 ) ( CLEAR ?auto_31197 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31196 ?auto_31197 ?auto_31194 )
      ( MAKE-1PILE ?auto_31192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31198 - BLOCK
    )
    :vars
    (
      ?auto_31200 - BLOCK
      ?auto_31199 - BLOCK
      ?auto_31201 - BLOCK
      ?auto_31202 - BLOCK
      ?auto_31203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31198 ?auto_31200 ) ) ( ON-TABLE ?auto_31199 ) ( ON ?auto_31201 ?auto_31199 ) ( not ( = ?auto_31199 ?auto_31201 ) ) ( not ( = ?auto_31199 ?auto_31202 ) ) ( not ( = ?auto_31199 ?auto_31200 ) ) ( not ( = ?auto_31199 ?auto_31198 ) ) ( not ( = ?auto_31201 ?auto_31202 ) ) ( not ( = ?auto_31201 ?auto_31200 ) ) ( not ( = ?auto_31201 ?auto_31198 ) ) ( not ( = ?auto_31202 ?auto_31200 ) ) ( not ( = ?auto_31202 ?auto_31198 ) ) ( ON ?auto_31198 ?auto_31203 ) ( not ( = ?auto_31198 ?auto_31203 ) ) ( not ( = ?auto_31200 ?auto_31203 ) ) ( not ( = ?auto_31199 ?auto_31203 ) ) ( not ( = ?auto_31201 ?auto_31203 ) ) ( not ( = ?auto_31202 ?auto_31203 ) ) ( ON ?auto_31200 ?auto_31198 ) ( ON-TABLE ?auto_31203 ) ( CLEAR ?auto_31201 ) ( ON ?auto_31202 ?auto_31200 ) ( CLEAR ?auto_31202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31203 ?auto_31198 ?auto_31200 )
      ( MAKE-1PILE ?auto_31198 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31204 - BLOCK
    )
    :vars
    (
      ?auto_31206 - BLOCK
      ?auto_31208 - BLOCK
      ?auto_31209 - BLOCK
      ?auto_31205 - BLOCK
      ?auto_31207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31204 ?auto_31206 ) ) ( ON-TABLE ?auto_31208 ) ( not ( = ?auto_31208 ?auto_31209 ) ) ( not ( = ?auto_31208 ?auto_31205 ) ) ( not ( = ?auto_31208 ?auto_31206 ) ) ( not ( = ?auto_31208 ?auto_31204 ) ) ( not ( = ?auto_31209 ?auto_31205 ) ) ( not ( = ?auto_31209 ?auto_31206 ) ) ( not ( = ?auto_31209 ?auto_31204 ) ) ( not ( = ?auto_31205 ?auto_31206 ) ) ( not ( = ?auto_31205 ?auto_31204 ) ) ( ON ?auto_31204 ?auto_31207 ) ( not ( = ?auto_31204 ?auto_31207 ) ) ( not ( = ?auto_31206 ?auto_31207 ) ) ( not ( = ?auto_31208 ?auto_31207 ) ) ( not ( = ?auto_31209 ?auto_31207 ) ) ( not ( = ?auto_31205 ?auto_31207 ) ) ( ON ?auto_31206 ?auto_31204 ) ( ON-TABLE ?auto_31207 ) ( ON ?auto_31205 ?auto_31206 ) ( CLEAR ?auto_31205 ) ( HOLDING ?auto_31209 ) ( CLEAR ?auto_31208 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31208 ?auto_31209 )
      ( MAKE-1PILE ?auto_31204 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31210 - BLOCK
    )
    :vars
    (
      ?auto_31215 - BLOCK
      ?auto_31214 - BLOCK
      ?auto_31213 - BLOCK
      ?auto_31211 - BLOCK
      ?auto_31212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31210 ?auto_31215 ) ) ( ON-TABLE ?auto_31214 ) ( not ( = ?auto_31214 ?auto_31213 ) ) ( not ( = ?auto_31214 ?auto_31211 ) ) ( not ( = ?auto_31214 ?auto_31215 ) ) ( not ( = ?auto_31214 ?auto_31210 ) ) ( not ( = ?auto_31213 ?auto_31211 ) ) ( not ( = ?auto_31213 ?auto_31215 ) ) ( not ( = ?auto_31213 ?auto_31210 ) ) ( not ( = ?auto_31211 ?auto_31215 ) ) ( not ( = ?auto_31211 ?auto_31210 ) ) ( ON ?auto_31210 ?auto_31212 ) ( not ( = ?auto_31210 ?auto_31212 ) ) ( not ( = ?auto_31215 ?auto_31212 ) ) ( not ( = ?auto_31214 ?auto_31212 ) ) ( not ( = ?auto_31213 ?auto_31212 ) ) ( not ( = ?auto_31211 ?auto_31212 ) ) ( ON ?auto_31215 ?auto_31210 ) ( ON-TABLE ?auto_31212 ) ( ON ?auto_31211 ?auto_31215 ) ( CLEAR ?auto_31214 ) ( ON ?auto_31213 ?auto_31211 ) ( CLEAR ?auto_31213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31212 ?auto_31210 ?auto_31215 ?auto_31211 )
      ( MAKE-1PILE ?auto_31210 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31216 - BLOCK
    )
    :vars
    (
      ?auto_31221 - BLOCK
      ?auto_31220 - BLOCK
      ?auto_31219 - BLOCK
      ?auto_31218 - BLOCK
      ?auto_31217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31216 ?auto_31221 ) ) ( not ( = ?auto_31220 ?auto_31219 ) ) ( not ( = ?auto_31220 ?auto_31218 ) ) ( not ( = ?auto_31220 ?auto_31221 ) ) ( not ( = ?auto_31220 ?auto_31216 ) ) ( not ( = ?auto_31219 ?auto_31218 ) ) ( not ( = ?auto_31219 ?auto_31221 ) ) ( not ( = ?auto_31219 ?auto_31216 ) ) ( not ( = ?auto_31218 ?auto_31221 ) ) ( not ( = ?auto_31218 ?auto_31216 ) ) ( ON ?auto_31216 ?auto_31217 ) ( not ( = ?auto_31216 ?auto_31217 ) ) ( not ( = ?auto_31221 ?auto_31217 ) ) ( not ( = ?auto_31220 ?auto_31217 ) ) ( not ( = ?auto_31219 ?auto_31217 ) ) ( not ( = ?auto_31218 ?auto_31217 ) ) ( ON ?auto_31221 ?auto_31216 ) ( ON-TABLE ?auto_31217 ) ( ON ?auto_31218 ?auto_31221 ) ( ON ?auto_31219 ?auto_31218 ) ( CLEAR ?auto_31219 ) ( HOLDING ?auto_31220 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31220 )
      ( MAKE-1PILE ?auto_31216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31222 - BLOCK
    )
    :vars
    (
      ?auto_31227 - BLOCK
      ?auto_31225 - BLOCK
      ?auto_31224 - BLOCK
      ?auto_31223 - BLOCK
      ?auto_31226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31222 ?auto_31227 ) ) ( not ( = ?auto_31225 ?auto_31224 ) ) ( not ( = ?auto_31225 ?auto_31223 ) ) ( not ( = ?auto_31225 ?auto_31227 ) ) ( not ( = ?auto_31225 ?auto_31222 ) ) ( not ( = ?auto_31224 ?auto_31223 ) ) ( not ( = ?auto_31224 ?auto_31227 ) ) ( not ( = ?auto_31224 ?auto_31222 ) ) ( not ( = ?auto_31223 ?auto_31227 ) ) ( not ( = ?auto_31223 ?auto_31222 ) ) ( ON ?auto_31222 ?auto_31226 ) ( not ( = ?auto_31222 ?auto_31226 ) ) ( not ( = ?auto_31227 ?auto_31226 ) ) ( not ( = ?auto_31225 ?auto_31226 ) ) ( not ( = ?auto_31224 ?auto_31226 ) ) ( not ( = ?auto_31223 ?auto_31226 ) ) ( ON ?auto_31227 ?auto_31222 ) ( ON-TABLE ?auto_31226 ) ( ON ?auto_31223 ?auto_31227 ) ( ON ?auto_31224 ?auto_31223 ) ( ON ?auto_31225 ?auto_31224 ) ( CLEAR ?auto_31225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31226 ?auto_31222 ?auto_31227 ?auto_31223 ?auto_31224 )
      ( MAKE-1PILE ?auto_31222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31231 - BLOCK
      ?auto_31232 - BLOCK
      ?auto_31233 - BLOCK
    )
    :vars
    (
      ?auto_31234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31234 ?auto_31233 ) ( CLEAR ?auto_31234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31231 ) ( ON ?auto_31232 ?auto_31231 ) ( ON ?auto_31233 ?auto_31232 ) ( not ( = ?auto_31231 ?auto_31232 ) ) ( not ( = ?auto_31231 ?auto_31233 ) ) ( not ( = ?auto_31231 ?auto_31234 ) ) ( not ( = ?auto_31232 ?auto_31233 ) ) ( not ( = ?auto_31232 ?auto_31234 ) ) ( not ( = ?auto_31233 ?auto_31234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31234 ?auto_31233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31235 - BLOCK
      ?auto_31236 - BLOCK
      ?auto_31237 - BLOCK
    )
    :vars
    (
      ?auto_31238 - BLOCK
      ?auto_31239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31238 ?auto_31237 ) ( CLEAR ?auto_31238 ) ( ON-TABLE ?auto_31235 ) ( ON ?auto_31236 ?auto_31235 ) ( ON ?auto_31237 ?auto_31236 ) ( not ( = ?auto_31235 ?auto_31236 ) ) ( not ( = ?auto_31235 ?auto_31237 ) ) ( not ( = ?auto_31235 ?auto_31238 ) ) ( not ( = ?auto_31236 ?auto_31237 ) ) ( not ( = ?auto_31236 ?auto_31238 ) ) ( not ( = ?auto_31237 ?auto_31238 ) ) ( HOLDING ?auto_31239 ) ( not ( = ?auto_31235 ?auto_31239 ) ) ( not ( = ?auto_31236 ?auto_31239 ) ) ( not ( = ?auto_31237 ?auto_31239 ) ) ( not ( = ?auto_31238 ?auto_31239 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_31239 )
      ( MAKE-3PILE ?auto_31235 ?auto_31236 ?auto_31237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31240 - BLOCK
      ?auto_31241 - BLOCK
      ?auto_31242 - BLOCK
    )
    :vars
    (
      ?auto_31243 - BLOCK
      ?auto_31244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31243 ?auto_31242 ) ( ON-TABLE ?auto_31240 ) ( ON ?auto_31241 ?auto_31240 ) ( ON ?auto_31242 ?auto_31241 ) ( not ( = ?auto_31240 ?auto_31241 ) ) ( not ( = ?auto_31240 ?auto_31242 ) ) ( not ( = ?auto_31240 ?auto_31243 ) ) ( not ( = ?auto_31241 ?auto_31242 ) ) ( not ( = ?auto_31241 ?auto_31243 ) ) ( not ( = ?auto_31242 ?auto_31243 ) ) ( not ( = ?auto_31240 ?auto_31244 ) ) ( not ( = ?auto_31241 ?auto_31244 ) ) ( not ( = ?auto_31242 ?auto_31244 ) ) ( not ( = ?auto_31243 ?auto_31244 ) ) ( ON ?auto_31244 ?auto_31243 ) ( CLEAR ?auto_31244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31240 ?auto_31241 ?auto_31242 ?auto_31243 )
      ( MAKE-3PILE ?auto_31240 ?auto_31241 ?auto_31242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31245 - BLOCK
      ?auto_31246 - BLOCK
      ?auto_31247 - BLOCK
    )
    :vars
    (
      ?auto_31248 - BLOCK
      ?auto_31249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31248 ?auto_31247 ) ( ON-TABLE ?auto_31245 ) ( ON ?auto_31246 ?auto_31245 ) ( ON ?auto_31247 ?auto_31246 ) ( not ( = ?auto_31245 ?auto_31246 ) ) ( not ( = ?auto_31245 ?auto_31247 ) ) ( not ( = ?auto_31245 ?auto_31248 ) ) ( not ( = ?auto_31246 ?auto_31247 ) ) ( not ( = ?auto_31246 ?auto_31248 ) ) ( not ( = ?auto_31247 ?auto_31248 ) ) ( not ( = ?auto_31245 ?auto_31249 ) ) ( not ( = ?auto_31246 ?auto_31249 ) ) ( not ( = ?auto_31247 ?auto_31249 ) ) ( not ( = ?auto_31248 ?auto_31249 ) ) ( HOLDING ?auto_31249 ) ( CLEAR ?auto_31248 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31245 ?auto_31246 ?auto_31247 ?auto_31248 ?auto_31249 )
      ( MAKE-3PILE ?auto_31245 ?auto_31246 ?auto_31247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31250 - BLOCK
      ?auto_31251 - BLOCK
      ?auto_31252 - BLOCK
    )
    :vars
    (
      ?auto_31254 - BLOCK
      ?auto_31253 - BLOCK
      ?auto_31255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31254 ?auto_31252 ) ( ON-TABLE ?auto_31250 ) ( ON ?auto_31251 ?auto_31250 ) ( ON ?auto_31252 ?auto_31251 ) ( not ( = ?auto_31250 ?auto_31251 ) ) ( not ( = ?auto_31250 ?auto_31252 ) ) ( not ( = ?auto_31250 ?auto_31254 ) ) ( not ( = ?auto_31251 ?auto_31252 ) ) ( not ( = ?auto_31251 ?auto_31254 ) ) ( not ( = ?auto_31252 ?auto_31254 ) ) ( not ( = ?auto_31250 ?auto_31253 ) ) ( not ( = ?auto_31251 ?auto_31253 ) ) ( not ( = ?auto_31252 ?auto_31253 ) ) ( not ( = ?auto_31254 ?auto_31253 ) ) ( CLEAR ?auto_31254 ) ( ON ?auto_31253 ?auto_31255 ) ( CLEAR ?auto_31253 ) ( HAND-EMPTY ) ( not ( = ?auto_31250 ?auto_31255 ) ) ( not ( = ?auto_31251 ?auto_31255 ) ) ( not ( = ?auto_31252 ?auto_31255 ) ) ( not ( = ?auto_31254 ?auto_31255 ) ) ( not ( = ?auto_31253 ?auto_31255 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31253 ?auto_31255 )
      ( MAKE-3PILE ?auto_31250 ?auto_31251 ?auto_31252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31268 - BLOCK
      ?auto_31269 - BLOCK
      ?auto_31270 - BLOCK
    )
    :vars
    (
      ?auto_31272 - BLOCK
      ?auto_31271 - BLOCK
      ?auto_31273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31268 ) ( ON ?auto_31269 ?auto_31268 ) ( not ( = ?auto_31268 ?auto_31269 ) ) ( not ( = ?auto_31268 ?auto_31270 ) ) ( not ( = ?auto_31268 ?auto_31272 ) ) ( not ( = ?auto_31269 ?auto_31270 ) ) ( not ( = ?auto_31269 ?auto_31272 ) ) ( not ( = ?auto_31270 ?auto_31272 ) ) ( not ( = ?auto_31268 ?auto_31271 ) ) ( not ( = ?auto_31269 ?auto_31271 ) ) ( not ( = ?auto_31270 ?auto_31271 ) ) ( not ( = ?auto_31272 ?auto_31271 ) ) ( ON ?auto_31271 ?auto_31273 ) ( not ( = ?auto_31268 ?auto_31273 ) ) ( not ( = ?auto_31269 ?auto_31273 ) ) ( not ( = ?auto_31270 ?auto_31273 ) ) ( not ( = ?auto_31272 ?auto_31273 ) ) ( not ( = ?auto_31271 ?auto_31273 ) ) ( ON ?auto_31272 ?auto_31271 ) ( CLEAR ?auto_31272 ) ( HOLDING ?auto_31270 ) ( CLEAR ?auto_31269 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31268 ?auto_31269 ?auto_31270 ?auto_31272 )
      ( MAKE-3PILE ?auto_31268 ?auto_31269 ?auto_31270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31274 - BLOCK
      ?auto_31275 - BLOCK
      ?auto_31276 - BLOCK
    )
    :vars
    (
      ?auto_31277 - BLOCK
      ?auto_31279 - BLOCK
      ?auto_31278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31274 ) ( ON ?auto_31275 ?auto_31274 ) ( not ( = ?auto_31274 ?auto_31275 ) ) ( not ( = ?auto_31274 ?auto_31276 ) ) ( not ( = ?auto_31274 ?auto_31277 ) ) ( not ( = ?auto_31275 ?auto_31276 ) ) ( not ( = ?auto_31275 ?auto_31277 ) ) ( not ( = ?auto_31276 ?auto_31277 ) ) ( not ( = ?auto_31274 ?auto_31279 ) ) ( not ( = ?auto_31275 ?auto_31279 ) ) ( not ( = ?auto_31276 ?auto_31279 ) ) ( not ( = ?auto_31277 ?auto_31279 ) ) ( ON ?auto_31279 ?auto_31278 ) ( not ( = ?auto_31274 ?auto_31278 ) ) ( not ( = ?auto_31275 ?auto_31278 ) ) ( not ( = ?auto_31276 ?auto_31278 ) ) ( not ( = ?auto_31277 ?auto_31278 ) ) ( not ( = ?auto_31279 ?auto_31278 ) ) ( ON ?auto_31277 ?auto_31279 ) ( CLEAR ?auto_31275 ) ( ON ?auto_31276 ?auto_31277 ) ( CLEAR ?auto_31276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31278 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31278 ?auto_31279 ?auto_31277 )
      ( MAKE-3PILE ?auto_31274 ?auto_31275 ?auto_31276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31280 - BLOCK
      ?auto_31281 - BLOCK
      ?auto_31282 - BLOCK
    )
    :vars
    (
      ?auto_31285 - BLOCK
      ?auto_31283 - BLOCK
      ?auto_31284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31280 ) ( not ( = ?auto_31280 ?auto_31281 ) ) ( not ( = ?auto_31280 ?auto_31282 ) ) ( not ( = ?auto_31280 ?auto_31285 ) ) ( not ( = ?auto_31281 ?auto_31282 ) ) ( not ( = ?auto_31281 ?auto_31285 ) ) ( not ( = ?auto_31282 ?auto_31285 ) ) ( not ( = ?auto_31280 ?auto_31283 ) ) ( not ( = ?auto_31281 ?auto_31283 ) ) ( not ( = ?auto_31282 ?auto_31283 ) ) ( not ( = ?auto_31285 ?auto_31283 ) ) ( ON ?auto_31283 ?auto_31284 ) ( not ( = ?auto_31280 ?auto_31284 ) ) ( not ( = ?auto_31281 ?auto_31284 ) ) ( not ( = ?auto_31282 ?auto_31284 ) ) ( not ( = ?auto_31285 ?auto_31284 ) ) ( not ( = ?auto_31283 ?auto_31284 ) ) ( ON ?auto_31285 ?auto_31283 ) ( ON ?auto_31282 ?auto_31285 ) ( CLEAR ?auto_31282 ) ( ON-TABLE ?auto_31284 ) ( HOLDING ?auto_31281 ) ( CLEAR ?auto_31280 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31280 ?auto_31281 )
      ( MAKE-3PILE ?auto_31280 ?auto_31281 ?auto_31282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31286 - BLOCK
      ?auto_31287 - BLOCK
      ?auto_31288 - BLOCK
    )
    :vars
    (
      ?auto_31289 - BLOCK
      ?auto_31290 - BLOCK
      ?auto_31291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31286 ) ( not ( = ?auto_31286 ?auto_31287 ) ) ( not ( = ?auto_31286 ?auto_31288 ) ) ( not ( = ?auto_31286 ?auto_31289 ) ) ( not ( = ?auto_31287 ?auto_31288 ) ) ( not ( = ?auto_31287 ?auto_31289 ) ) ( not ( = ?auto_31288 ?auto_31289 ) ) ( not ( = ?auto_31286 ?auto_31290 ) ) ( not ( = ?auto_31287 ?auto_31290 ) ) ( not ( = ?auto_31288 ?auto_31290 ) ) ( not ( = ?auto_31289 ?auto_31290 ) ) ( ON ?auto_31290 ?auto_31291 ) ( not ( = ?auto_31286 ?auto_31291 ) ) ( not ( = ?auto_31287 ?auto_31291 ) ) ( not ( = ?auto_31288 ?auto_31291 ) ) ( not ( = ?auto_31289 ?auto_31291 ) ) ( not ( = ?auto_31290 ?auto_31291 ) ) ( ON ?auto_31289 ?auto_31290 ) ( ON ?auto_31288 ?auto_31289 ) ( ON-TABLE ?auto_31291 ) ( CLEAR ?auto_31286 ) ( ON ?auto_31287 ?auto_31288 ) ( CLEAR ?auto_31287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31291 ?auto_31290 ?auto_31289 ?auto_31288 )
      ( MAKE-3PILE ?auto_31286 ?auto_31287 ?auto_31288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31292 - BLOCK
      ?auto_31293 - BLOCK
      ?auto_31294 - BLOCK
    )
    :vars
    (
      ?auto_31295 - BLOCK
      ?auto_31296 - BLOCK
      ?auto_31297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31292 ?auto_31293 ) ) ( not ( = ?auto_31292 ?auto_31294 ) ) ( not ( = ?auto_31292 ?auto_31295 ) ) ( not ( = ?auto_31293 ?auto_31294 ) ) ( not ( = ?auto_31293 ?auto_31295 ) ) ( not ( = ?auto_31294 ?auto_31295 ) ) ( not ( = ?auto_31292 ?auto_31296 ) ) ( not ( = ?auto_31293 ?auto_31296 ) ) ( not ( = ?auto_31294 ?auto_31296 ) ) ( not ( = ?auto_31295 ?auto_31296 ) ) ( ON ?auto_31296 ?auto_31297 ) ( not ( = ?auto_31292 ?auto_31297 ) ) ( not ( = ?auto_31293 ?auto_31297 ) ) ( not ( = ?auto_31294 ?auto_31297 ) ) ( not ( = ?auto_31295 ?auto_31297 ) ) ( not ( = ?auto_31296 ?auto_31297 ) ) ( ON ?auto_31295 ?auto_31296 ) ( ON ?auto_31294 ?auto_31295 ) ( ON-TABLE ?auto_31297 ) ( ON ?auto_31293 ?auto_31294 ) ( CLEAR ?auto_31293 ) ( HOLDING ?auto_31292 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31292 )
      ( MAKE-3PILE ?auto_31292 ?auto_31293 ?auto_31294 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31298 - BLOCK
      ?auto_31299 - BLOCK
      ?auto_31300 - BLOCK
    )
    :vars
    (
      ?auto_31302 - BLOCK
      ?auto_31303 - BLOCK
      ?auto_31301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31298 ?auto_31299 ) ) ( not ( = ?auto_31298 ?auto_31300 ) ) ( not ( = ?auto_31298 ?auto_31302 ) ) ( not ( = ?auto_31299 ?auto_31300 ) ) ( not ( = ?auto_31299 ?auto_31302 ) ) ( not ( = ?auto_31300 ?auto_31302 ) ) ( not ( = ?auto_31298 ?auto_31303 ) ) ( not ( = ?auto_31299 ?auto_31303 ) ) ( not ( = ?auto_31300 ?auto_31303 ) ) ( not ( = ?auto_31302 ?auto_31303 ) ) ( ON ?auto_31303 ?auto_31301 ) ( not ( = ?auto_31298 ?auto_31301 ) ) ( not ( = ?auto_31299 ?auto_31301 ) ) ( not ( = ?auto_31300 ?auto_31301 ) ) ( not ( = ?auto_31302 ?auto_31301 ) ) ( not ( = ?auto_31303 ?auto_31301 ) ) ( ON ?auto_31302 ?auto_31303 ) ( ON ?auto_31300 ?auto_31302 ) ( ON-TABLE ?auto_31301 ) ( ON ?auto_31299 ?auto_31300 ) ( ON ?auto_31298 ?auto_31299 ) ( CLEAR ?auto_31298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31301 ?auto_31303 ?auto_31302 ?auto_31300 ?auto_31299 )
      ( MAKE-3PILE ?auto_31298 ?auto_31299 ?auto_31300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31306 - BLOCK
      ?auto_31307 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31307 ) ( CLEAR ?auto_31306 ) ( ON-TABLE ?auto_31306 ) ( not ( = ?auto_31306 ?auto_31307 ) ) )
    :subtasks
    ( ( !STACK ?auto_31307 ?auto_31306 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31308 - BLOCK
      ?auto_31309 - BLOCK
    )
    :vars
    (
      ?auto_31310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31308 ) ( ON-TABLE ?auto_31308 ) ( not ( = ?auto_31308 ?auto_31309 ) ) ( ON ?auto_31309 ?auto_31310 ) ( CLEAR ?auto_31309 ) ( HAND-EMPTY ) ( not ( = ?auto_31308 ?auto_31310 ) ) ( not ( = ?auto_31309 ?auto_31310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31309 ?auto_31310 )
      ( MAKE-2PILE ?auto_31308 ?auto_31309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31311 - BLOCK
      ?auto_31312 - BLOCK
    )
    :vars
    (
      ?auto_31313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31311 ?auto_31312 ) ) ( ON ?auto_31312 ?auto_31313 ) ( CLEAR ?auto_31312 ) ( not ( = ?auto_31311 ?auto_31313 ) ) ( not ( = ?auto_31312 ?auto_31313 ) ) ( HOLDING ?auto_31311 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31311 )
      ( MAKE-2PILE ?auto_31311 ?auto_31312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31314 - BLOCK
      ?auto_31315 - BLOCK
    )
    :vars
    (
      ?auto_31316 - BLOCK
      ?auto_31318 - BLOCK
      ?auto_31317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31314 ?auto_31315 ) ) ( ON ?auto_31315 ?auto_31316 ) ( not ( = ?auto_31314 ?auto_31316 ) ) ( not ( = ?auto_31315 ?auto_31316 ) ) ( ON ?auto_31314 ?auto_31315 ) ( CLEAR ?auto_31314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31318 ) ( ON ?auto_31317 ?auto_31318 ) ( ON ?auto_31316 ?auto_31317 ) ( not ( = ?auto_31318 ?auto_31317 ) ) ( not ( = ?auto_31318 ?auto_31316 ) ) ( not ( = ?auto_31318 ?auto_31315 ) ) ( not ( = ?auto_31318 ?auto_31314 ) ) ( not ( = ?auto_31317 ?auto_31316 ) ) ( not ( = ?auto_31317 ?auto_31315 ) ) ( not ( = ?auto_31317 ?auto_31314 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31318 ?auto_31317 ?auto_31316 ?auto_31315 )
      ( MAKE-2PILE ?auto_31314 ?auto_31315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31319 - BLOCK
      ?auto_31320 - BLOCK
    )
    :vars
    (
      ?auto_31321 - BLOCK
      ?auto_31322 - BLOCK
      ?auto_31323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31319 ?auto_31320 ) ) ( ON ?auto_31320 ?auto_31321 ) ( not ( = ?auto_31319 ?auto_31321 ) ) ( not ( = ?auto_31320 ?auto_31321 ) ) ( ON-TABLE ?auto_31322 ) ( ON ?auto_31323 ?auto_31322 ) ( ON ?auto_31321 ?auto_31323 ) ( not ( = ?auto_31322 ?auto_31323 ) ) ( not ( = ?auto_31322 ?auto_31321 ) ) ( not ( = ?auto_31322 ?auto_31320 ) ) ( not ( = ?auto_31322 ?auto_31319 ) ) ( not ( = ?auto_31323 ?auto_31321 ) ) ( not ( = ?auto_31323 ?auto_31320 ) ) ( not ( = ?auto_31323 ?auto_31319 ) ) ( HOLDING ?auto_31319 ) ( CLEAR ?auto_31320 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31322 ?auto_31323 ?auto_31321 ?auto_31320 ?auto_31319 )
      ( MAKE-2PILE ?auto_31319 ?auto_31320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31324 - BLOCK
      ?auto_31325 - BLOCK
    )
    :vars
    (
      ?auto_31328 - BLOCK
      ?auto_31327 - BLOCK
      ?auto_31326 - BLOCK
      ?auto_31329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31324 ?auto_31325 ) ) ( ON ?auto_31325 ?auto_31328 ) ( not ( = ?auto_31324 ?auto_31328 ) ) ( not ( = ?auto_31325 ?auto_31328 ) ) ( ON-TABLE ?auto_31327 ) ( ON ?auto_31326 ?auto_31327 ) ( ON ?auto_31328 ?auto_31326 ) ( not ( = ?auto_31327 ?auto_31326 ) ) ( not ( = ?auto_31327 ?auto_31328 ) ) ( not ( = ?auto_31327 ?auto_31325 ) ) ( not ( = ?auto_31327 ?auto_31324 ) ) ( not ( = ?auto_31326 ?auto_31328 ) ) ( not ( = ?auto_31326 ?auto_31325 ) ) ( not ( = ?auto_31326 ?auto_31324 ) ) ( CLEAR ?auto_31325 ) ( ON ?auto_31324 ?auto_31329 ) ( CLEAR ?auto_31324 ) ( HAND-EMPTY ) ( not ( = ?auto_31324 ?auto_31329 ) ) ( not ( = ?auto_31325 ?auto_31329 ) ) ( not ( = ?auto_31328 ?auto_31329 ) ) ( not ( = ?auto_31327 ?auto_31329 ) ) ( not ( = ?auto_31326 ?auto_31329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31324 ?auto_31329 )
      ( MAKE-2PILE ?auto_31324 ?auto_31325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31330 - BLOCK
      ?auto_31331 - BLOCK
    )
    :vars
    (
      ?auto_31332 - BLOCK
      ?auto_31335 - BLOCK
      ?auto_31334 - BLOCK
      ?auto_31333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31330 ?auto_31331 ) ) ( not ( = ?auto_31330 ?auto_31332 ) ) ( not ( = ?auto_31331 ?auto_31332 ) ) ( ON-TABLE ?auto_31335 ) ( ON ?auto_31334 ?auto_31335 ) ( ON ?auto_31332 ?auto_31334 ) ( not ( = ?auto_31335 ?auto_31334 ) ) ( not ( = ?auto_31335 ?auto_31332 ) ) ( not ( = ?auto_31335 ?auto_31331 ) ) ( not ( = ?auto_31335 ?auto_31330 ) ) ( not ( = ?auto_31334 ?auto_31332 ) ) ( not ( = ?auto_31334 ?auto_31331 ) ) ( not ( = ?auto_31334 ?auto_31330 ) ) ( ON ?auto_31330 ?auto_31333 ) ( CLEAR ?auto_31330 ) ( not ( = ?auto_31330 ?auto_31333 ) ) ( not ( = ?auto_31331 ?auto_31333 ) ) ( not ( = ?auto_31332 ?auto_31333 ) ) ( not ( = ?auto_31335 ?auto_31333 ) ) ( not ( = ?auto_31334 ?auto_31333 ) ) ( HOLDING ?auto_31331 ) ( CLEAR ?auto_31332 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31335 ?auto_31334 ?auto_31332 ?auto_31331 )
      ( MAKE-2PILE ?auto_31330 ?auto_31331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31336 - BLOCK
      ?auto_31337 - BLOCK
    )
    :vars
    (
      ?auto_31340 - BLOCK
      ?auto_31338 - BLOCK
      ?auto_31341 - BLOCK
      ?auto_31339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31336 ?auto_31337 ) ) ( not ( = ?auto_31336 ?auto_31340 ) ) ( not ( = ?auto_31337 ?auto_31340 ) ) ( ON-TABLE ?auto_31338 ) ( ON ?auto_31341 ?auto_31338 ) ( ON ?auto_31340 ?auto_31341 ) ( not ( = ?auto_31338 ?auto_31341 ) ) ( not ( = ?auto_31338 ?auto_31340 ) ) ( not ( = ?auto_31338 ?auto_31337 ) ) ( not ( = ?auto_31338 ?auto_31336 ) ) ( not ( = ?auto_31341 ?auto_31340 ) ) ( not ( = ?auto_31341 ?auto_31337 ) ) ( not ( = ?auto_31341 ?auto_31336 ) ) ( ON ?auto_31336 ?auto_31339 ) ( not ( = ?auto_31336 ?auto_31339 ) ) ( not ( = ?auto_31337 ?auto_31339 ) ) ( not ( = ?auto_31340 ?auto_31339 ) ) ( not ( = ?auto_31338 ?auto_31339 ) ) ( not ( = ?auto_31341 ?auto_31339 ) ) ( CLEAR ?auto_31340 ) ( ON ?auto_31337 ?auto_31336 ) ( CLEAR ?auto_31337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31339 ?auto_31336 )
      ( MAKE-2PILE ?auto_31336 ?auto_31337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31342 - BLOCK
      ?auto_31343 - BLOCK
    )
    :vars
    (
      ?auto_31346 - BLOCK
      ?auto_31345 - BLOCK
      ?auto_31344 - BLOCK
      ?auto_31347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31342 ?auto_31343 ) ) ( not ( = ?auto_31342 ?auto_31346 ) ) ( not ( = ?auto_31343 ?auto_31346 ) ) ( ON-TABLE ?auto_31345 ) ( ON ?auto_31344 ?auto_31345 ) ( not ( = ?auto_31345 ?auto_31344 ) ) ( not ( = ?auto_31345 ?auto_31346 ) ) ( not ( = ?auto_31345 ?auto_31343 ) ) ( not ( = ?auto_31345 ?auto_31342 ) ) ( not ( = ?auto_31344 ?auto_31346 ) ) ( not ( = ?auto_31344 ?auto_31343 ) ) ( not ( = ?auto_31344 ?auto_31342 ) ) ( ON ?auto_31342 ?auto_31347 ) ( not ( = ?auto_31342 ?auto_31347 ) ) ( not ( = ?auto_31343 ?auto_31347 ) ) ( not ( = ?auto_31346 ?auto_31347 ) ) ( not ( = ?auto_31345 ?auto_31347 ) ) ( not ( = ?auto_31344 ?auto_31347 ) ) ( ON ?auto_31343 ?auto_31342 ) ( CLEAR ?auto_31343 ) ( ON-TABLE ?auto_31347 ) ( HOLDING ?auto_31346 ) ( CLEAR ?auto_31344 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31345 ?auto_31344 ?auto_31346 )
      ( MAKE-2PILE ?auto_31342 ?auto_31343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31348 - BLOCK
      ?auto_31349 - BLOCK
    )
    :vars
    (
      ?auto_31353 - BLOCK
      ?auto_31352 - BLOCK
      ?auto_31351 - BLOCK
      ?auto_31350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31348 ?auto_31349 ) ) ( not ( = ?auto_31348 ?auto_31353 ) ) ( not ( = ?auto_31349 ?auto_31353 ) ) ( ON-TABLE ?auto_31352 ) ( ON ?auto_31351 ?auto_31352 ) ( not ( = ?auto_31352 ?auto_31351 ) ) ( not ( = ?auto_31352 ?auto_31353 ) ) ( not ( = ?auto_31352 ?auto_31349 ) ) ( not ( = ?auto_31352 ?auto_31348 ) ) ( not ( = ?auto_31351 ?auto_31353 ) ) ( not ( = ?auto_31351 ?auto_31349 ) ) ( not ( = ?auto_31351 ?auto_31348 ) ) ( ON ?auto_31348 ?auto_31350 ) ( not ( = ?auto_31348 ?auto_31350 ) ) ( not ( = ?auto_31349 ?auto_31350 ) ) ( not ( = ?auto_31353 ?auto_31350 ) ) ( not ( = ?auto_31352 ?auto_31350 ) ) ( not ( = ?auto_31351 ?auto_31350 ) ) ( ON ?auto_31349 ?auto_31348 ) ( ON-TABLE ?auto_31350 ) ( CLEAR ?auto_31351 ) ( ON ?auto_31353 ?auto_31349 ) ( CLEAR ?auto_31353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31350 ?auto_31348 ?auto_31349 )
      ( MAKE-2PILE ?auto_31348 ?auto_31349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31354 - BLOCK
      ?auto_31355 - BLOCK
    )
    :vars
    (
      ?auto_31356 - BLOCK
      ?auto_31358 - BLOCK
      ?auto_31357 - BLOCK
      ?auto_31359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31354 ?auto_31355 ) ) ( not ( = ?auto_31354 ?auto_31356 ) ) ( not ( = ?auto_31355 ?auto_31356 ) ) ( ON-TABLE ?auto_31358 ) ( not ( = ?auto_31358 ?auto_31357 ) ) ( not ( = ?auto_31358 ?auto_31356 ) ) ( not ( = ?auto_31358 ?auto_31355 ) ) ( not ( = ?auto_31358 ?auto_31354 ) ) ( not ( = ?auto_31357 ?auto_31356 ) ) ( not ( = ?auto_31357 ?auto_31355 ) ) ( not ( = ?auto_31357 ?auto_31354 ) ) ( ON ?auto_31354 ?auto_31359 ) ( not ( = ?auto_31354 ?auto_31359 ) ) ( not ( = ?auto_31355 ?auto_31359 ) ) ( not ( = ?auto_31356 ?auto_31359 ) ) ( not ( = ?auto_31358 ?auto_31359 ) ) ( not ( = ?auto_31357 ?auto_31359 ) ) ( ON ?auto_31355 ?auto_31354 ) ( ON-TABLE ?auto_31359 ) ( ON ?auto_31356 ?auto_31355 ) ( CLEAR ?auto_31356 ) ( HOLDING ?auto_31357 ) ( CLEAR ?auto_31358 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31358 ?auto_31357 )
      ( MAKE-2PILE ?auto_31354 ?auto_31355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31360 - BLOCK
      ?auto_31361 - BLOCK
    )
    :vars
    (
      ?auto_31364 - BLOCK
      ?auto_31362 - BLOCK
      ?auto_31363 - BLOCK
      ?auto_31365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31360 ?auto_31361 ) ) ( not ( = ?auto_31360 ?auto_31364 ) ) ( not ( = ?auto_31361 ?auto_31364 ) ) ( ON-TABLE ?auto_31362 ) ( not ( = ?auto_31362 ?auto_31363 ) ) ( not ( = ?auto_31362 ?auto_31364 ) ) ( not ( = ?auto_31362 ?auto_31361 ) ) ( not ( = ?auto_31362 ?auto_31360 ) ) ( not ( = ?auto_31363 ?auto_31364 ) ) ( not ( = ?auto_31363 ?auto_31361 ) ) ( not ( = ?auto_31363 ?auto_31360 ) ) ( ON ?auto_31360 ?auto_31365 ) ( not ( = ?auto_31360 ?auto_31365 ) ) ( not ( = ?auto_31361 ?auto_31365 ) ) ( not ( = ?auto_31364 ?auto_31365 ) ) ( not ( = ?auto_31362 ?auto_31365 ) ) ( not ( = ?auto_31363 ?auto_31365 ) ) ( ON ?auto_31361 ?auto_31360 ) ( ON-TABLE ?auto_31365 ) ( ON ?auto_31364 ?auto_31361 ) ( CLEAR ?auto_31362 ) ( ON ?auto_31363 ?auto_31364 ) ( CLEAR ?auto_31363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31365 ?auto_31360 ?auto_31361 ?auto_31364 )
      ( MAKE-2PILE ?auto_31360 ?auto_31361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31366 - BLOCK
      ?auto_31367 - BLOCK
    )
    :vars
    (
      ?auto_31369 - BLOCK
      ?auto_31370 - BLOCK
      ?auto_31368 - BLOCK
      ?auto_31371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31366 ?auto_31367 ) ) ( not ( = ?auto_31366 ?auto_31369 ) ) ( not ( = ?auto_31367 ?auto_31369 ) ) ( not ( = ?auto_31370 ?auto_31368 ) ) ( not ( = ?auto_31370 ?auto_31369 ) ) ( not ( = ?auto_31370 ?auto_31367 ) ) ( not ( = ?auto_31370 ?auto_31366 ) ) ( not ( = ?auto_31368 ?auto_31369 ) ) ( not ( = ?auto_31368 ?auto_31367 ) ) ( not ( = ?auto_31368 ?auto_31366 ) ) ( ON ?auto_31366 ?auto_31371 ) ( not ( = ?auto_31366 ?auto_31371 ) ) ( not ( = ?auto_31367 ?auto_31371 ) ) ( not ( = ?auto_31369 ?auto_31371 ) ) ( not ( = ?auto_31370 ?auto_31371 ) ) ( not ( = ?auto_31368 ?auto_31371 ) ) ( ON ?auto_31367 ?auto_31366 ) ( ON-TABLE ?auto_31371 ) ( ON ?auto_31369 ?auto_31367 ) ( ON ?auto_31368 ?auto_31369 ) ( CLEAR ?auto_31368 ) ( HOLDING ?auto_31370 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31370 )
      ( MAKE-2PILE ?auto_31366 ?auto_31367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31372 - BLOCK
      ?auto_31373 - BLOCK
    )
    :vars
    (
      ?auto_31376 - BLOCK
      ?auto_31374 - BLOCK
      ?auto_31375 - BLOCK
      ?auto_31377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31372 ?auto_31373 ) ) ( not ( = ?auto_31372 ?auto_31376 ) ) ( not ( = ?auto_31373 ?auto_31376 ) ) ( not ( = ?auto_31374 ?auto_31375 ) ) ( not ( = ?auto_31374 ?auto_31376 ) ) ( not ( = ?auto_31374 ?auto_31373 ) ) ( not ( = ?auto_31374 ?auto_31372 ) ) ( not ( = ?auto_31375 ?auto_31376 ) ) ( not ( = ?auto_31375 ?auto_31373 ) ) ( not ( = ?auto_31375 ?auto_31372 ) ) ( ON ?auto_31372 ?auto_31377 ) ( not ( = ?auto_31372 ?auto_31377 ) ) ( not ( = ?auto_31373 ?auto_31377 ) ) ( not ( = ?auto_31376 ?auto_31377 ) ) ( not ( = ?auto_31374 ?auto_31377 ) ) ( not ( = ?auto_31375 ?auto_31377 ) ) ( ON ?auto_31373 ?auto_31372 ) ( ON-TABLE ?auto_31377 ) ( ON ?auto_31376 ?auto_31373 ) ( ON ?auto_31375 ?auto_31376 ) ( ON ?auto_31374 ?auto_31375 ) ( CLEAR ?auto_31374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31377 ?auto_31372 ?auto_31373 ?auto_31376 ?auto_31375 )
      ( MAKE-2PILE ?auto_31372 ?auto_31373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31380 - BLOCK
      ?auto_31381 - BLOCK
    )
    :vars
    (
      ?auto_31382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31382 ?auto_31381 ) ( CLEAR ?auto_31382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31380 ) ( ON ?auto_31381 ?auto_31380 ) ( not ( = ?auto_31380 ?auto_31381 ) ) ( not ( = ?auto_31380 ?auto_31382 ) ) ( not ( = ?auto_31381 ?auto_31382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31382 ?auto_31381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31383 - BLOCK
      ?auto_31384 - BLOCK
    )
    :vars
    (
      ?auto_31385 - BLOCK
      ?auto_31386 - BLOCK
      ?auto_31387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31385 ?auto_31384 ) ( CLEAR ?auto_31385 ) ( ON-TABLE ?auto_31383 ) ( ON ?auto_31384 ?auto_31383 ) ( not ( = ?auto_31383 ?auto_31384 ) ) ( not ( = ?auto_31383 ?auto_31385 ) ) ( not ( = ?auto_31384 ?auto_31385 ) ) ( HOLDING ?auto_31386 ) ( CLEAR ?auto_31387 ) ( not ( = ?auto_31383 ?auto_31386 ) ) ( not ( = ?auto_31383 ?auto_31387 ) ) ( not ( = ?auto_31384 ?auto_31386 ) ) ( not ( = ?auto_31384 ?auto_31387 ) ) ( not ( = ?auto_31385 ?auto_31386 ) ) ( not ( = ?auto_31385 ?auto_31387 ) ) ( not ( = ?auto_31386 ?auto_31387 ) ) )
    :subtasks
    ( ( !STACK ?auto_31386 ?auto_31387 )
      ( MAKE-2PILE ?auto_31383 ?auto_31384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31388 - BLOCK
      ?auto_31389 - BLOCK
    )
    :vars
    (
      ?auto_31391 - BLOCK
      ?auto_31392 - BLOCK
      ?auto_31390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31391 ?auto_31389 ) ( ON-TABLE ?auto_31388 ) ( ON ?auto_31389 ?auto_31388 ) ( not ( = ?auto_31388 ?auto_31389 ) ) ( not ( = ?auto_31388 ?auto_31391 ) ) ( not ( = ?auto_31389 ?auto_31391 ) ) ( CLEAR ?auto_31392 ) ( not ( = ?auto_31388 ?auto_31390 ) ) ( not ( = ?auto_31388 ?auto_31392 ) ) ( not ( = ?auto_31389 ?auto_31390 ) ) ( not ( = ?auto_31389 ?auto_31392 ) ) ( not ( = ?auto_31391 ?auto_31390 ) ) ( not ( = ?auto_31391 ?auto_31392 ) ) ( not ( = ?auto_31390 ?auto_31392 ) ) ( ON ?auto_31390 ?auto_31391 ) ( CLEAR ?auto_31390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31388 ?auto_31389 ?auto_31391 )
      ( MAKE-2PILE ?auto_31388 ?auto_31389 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31393 - BLOCK
      ?auto_31394 - BLOCK
    )
    :vars
    (
      ?auto_31396 - BLOCK
      ?auto_31397 - BLOCK
      ?auto_31395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31396 ?auto_31394 ) ( ON-TABLE ?auto_31393 ) ( ON ?auto_31394 ?auto_31393 ) ( not ( = ?auto_31393 ?auto_31394 ) ) ( not ( = ?auto_31393 ?auto_31396 ) ) ( not ( = ?auto_31394 ?auto_31396 ) ) ( not ( = ?auto_31393 ?auto_31397 ) ) ( not ( = ?auto_31393 ?auto_31395 ) ) ( not ( = ?auto_31394 ?auto_31397 ) ) ( not ( = ?auto_31394 ?auto_31395 ) ) ( not ( = ?auto_31396 ?auto_31397 ) ) ( not ( = ?auto_31396 ?auto_31395 ) ) ( not ( = ?auto_31397 ?auto_31395 ) ) ( ON ?auto_31397 ?auto_31396 ) ( CLEAR ?auto_31397 ) ( HOLDING ?auto_31395 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31395 )
      ( MAKE-2PILE ?auto_31393 ?auto_31394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31398 - BLOCK
      ?auto_31399 - BLOCK
    )
    :vars
    (
      ?auto_31402 - BLOCK
      ?auto_31400 - BLOCK
      ?auto_31401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31402 ?auto_31399 ) ( ON-TABLE ?auto_31398 ) ( ON ?auto_31399 ?auto_31398 ) ( not ( = ?auto_31398 ?auto_31399 ) ) ( not ( = ?auto_31398 ?auto_31402 ) ) ( not ( = ?auto_31399 ?auto_31402 ) ) ( not ( = ?auto_31398 ?auto_31400 ) ) ( not ( = ?auto_31398 ?auto_31401 ) ) ( not ( = ?auto_31399 ?auto_31400 ) ) ( not ( = ?auto_31399 ?auto_31401 ) ) ( not ( = ?auto_31402 ?auto_31400 ) ) ( not ( = ?auto_31402 ?auto_31401 ) ) ( not ( = ?auto_31400 ?auto_31401 ) ) ( ON ?auto_31400 ?auto_31402 ) ( ON ?auto_31401 ?auto_31400 ) ( CLEAR ?auto_31401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31398 ?auto_31399 ?auto_31402 ?auto_31400 )
      ( MAKE-2PILE ?auto_31398 ?auto_31399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31403 - BLOCK
      ?auto_31404 - BLOCK
    )
    :vars
    (
      ?auto_31406 - BLOCK
      ?auto_31405 - BLOCK
      ?auto_31407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31406 ?auto_31404 ) ( ON-TABLE ?auto_31403 ) ( ON ?auto_31404 ?auto_31403 ) ( not ( = ?auto_31403 ?auto_31404 ) ) ( not ( = ?auto_31403 ?auto_31406 ) ) ( not ( = ?auto_31404 ?auto_31406 ) ) ( not ( = ?auto_31403 ?auto_31405 ) ) ( not ( = ?auto_31403 ?auto_31407 ) ) ( not ( = ?auto_31404 ?auto_31405 ) ) ( not ( = ?auto_31404 ?auto_31407 ) ) ( not ( = ?auto_31406 ?auto_31405 ) ) ( not ( = ?auto_31406 ?auto_31407 ) ) ( not ( = ?auto_31405 ?auto_31407 ) ) ( ON ?auto_31405 ?auto_31406 ) ( HOLDING ?auto_31407 ) ( CLEAR ?auto_31405 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31403 ?auto_31404 ?auto_31406 ?auto_31405 ?auto_31407 )
      ( MAKE-2PILE ?auto_31403 ?auto_31404 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31408 - BLOCK
      ?auto_31409 - BLOCK
    )
    :vars
    (
      ?auto_31412 - BLOCK
      ?auto_31410 - BLOCK
      ?auto_31411 - BLOCK
      ?auto_31413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31412 ?auto_31409 ) ( ON-TABLE ?auto_31408 ) ( ON ?auto_31409 ?auto_31408 ) ( not ( = ?auto_31408 ?auto_31409 ) ) ( not ( = ?auto_31408 ?auto_31412 ) ) ( not ( = ?auto_31409 ?auto_31412 ) ) ( not ( = ?auto_31408 ?auto_31410 ) ) ( not ( = ?auto_31408 ?auto_31411 ) ) ( not ( = ?auto_31409 ?auto_31410 ) ) ( not ( = ?auto_31409 ?auto_31411 ) ) ( not ( = ?auto_31412 ?auto_31410 ) ) ( not ( = ?auto_31412 ?auto_31411 ) ) ( not ( = ?auto_31410 ?auto_31411 ) ) ( ON ?auto_31410 ?auto_31412 ) ( CLEAR ?auto_31410 ) ( ON ?auto_31411 ?auto_31413 ) ( CLEAR ?auto_31411 ) ( HAND-EMPTY ) ( not ( = ?auto_31408 ?auto_31413 ) ) ( not ( = ?auto_31409 ?auto_31413 ) ) ( not ( = ?auto_31412 ?auto_31413 ) ) ( not ( = ?auto_31410 ?auto_31413 ) ) ( not ( = ?auto_31411 ?auto_31413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31411 ?auto_31413 )
      ( MAKE-2PILE ?auto_31408 ?auto_31409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31414 - BLOCK
      ?auto_31415 - BLOCK
    )
    :vars
    (
      ?auto_31417 - BLOCK
      ?auto_31416 - BLOCK
      ?auto_31418 - BLOCK
      ?auto_31419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31417 ?auto_31415 ) ( ON-TABLE ?auto_31414 ) ( ON ?auto_31415 ?auto_31414 ) ( not ( = ?auto_31414 ?auto_31415 ) ) ( not ( = ?auto_31414 ?auto_31417 ) ) ( not ( = ?auto_31415 ?auto_31417 ) ) ( not ( = ?auto_31414 ?auto_31416 ) ) ( not ( = ?auto_31414 ?auto_31418 ) ) ( not ( = ?auto_31415 ?auto_31416 ) ) ( not ( = ?auto_31415 ?auto_31418 ) ) ( not ( = ?auto_31417 ?auto_31416 ) ) ( not ( = ?auto_31417 ?auto_31418 ) ) ( not ( = ?auto_31416 ?auto_31418 ) ) ( ON ?auto_31418 ?auto_31419 ) ( CLEAR ?auto_31418 ) ( not ( = ?auto_31414 ?auto_31419 ) ) ( not ( = ?auto_31415 ?auto_31419 ) ) ( not ( = ?auto_31417 ?auto_31419 ) ) ( not ( = ?auto_31416 ?auto_31419 ) ) ( not ( = ?auto_31418 ?auto_31419 ) ) ( HOLDING ?auto_31416 ) ( CLEAR ?auto_31417 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31414 ?auto_31415 ?auto_31417 ?auto_31416 )
      ( MAKE-2PILE ?auto_31414 ?auto_31415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31420 - BLOCK
      ?auto_31421 - BLOCK
    )
    :vars
    (
      ?auto_31422 - BLOCK
      ?auto_31423 - BLOCK
      ?auto_31424 - BLOCK
      ?auto_31425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31422 ?auto_31421 ) ( ON-TABLE ?auto_31420 ) ( ON ?auto_31421 ?auto_31420 ) ( not ( = ?auto_31420 ?auto_31421 ) ) ( not ( = ?auto_31420 ?auto_31422 ) ) ( not ( = ?auto_31421 ?auto_31422 ) ) ( not ( = ?auto_31420 ?auto_31423 ) ) ( not ( = ?auto_31420 ?auto_31424 ) ) ( not ( = ?auto_31421 ?auto_31423 ) ) ( not ( = ?auto_31421 ?auto_31424 ) ) ( not ( = ?auto_31422 ?auto_31423 ) ) ( not ( = ?auto_31422 ?auto_31424 ) ) ( not ( = ?auto_31423 ?auto_31424 ) ) ( ON ?auto_31424 ?auto_31425 ) ( not ( = ?auto_31420 ?auto_31425 ) ) ( not ( = ?auto_31421 ?auto_31425 ) ) ( not ( = ?auto_31422 ?auto_31425 ) ) ( not ( = ?auto_31423 ?auto_31425 ) ) ( not ( = ?auto_31424 ?auto_31425 ) ) ( CLEAR ?auto_31422 ) ( ON ?auto_31423 ?auto_31424 ) ( CLEAR ?auto_31423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31425 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31425 ?auto_31424 )
      ( MAKE-2PILE ?auto_31420 ?auto_31421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31438 - BLOCK
      ?auto_31439 - BLOCK
    )
    :vars
    (
      ?auto_31440 - BLOCK
      ?auto_31442 - BLOCK
      ?auto_31441 - BLOCK
      ?auto_31443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31438 ) ( not ( = ?auto_31438 ?auto_31439 ) ) ( not ( = ?auto_31438 ?auto_31440 ) ) ( not ( = ?auto_31439 ?auto_31440 ) ) ( not ( = ?auto_31438 ?auto_31442 ) ) ( not ( = ?auto_31438 ?auto_31441 ) ) ( not ( = ?auto_31439 ?auto_31442 ) ) ( not ( = ?auto_31439 ?auto_31441 ) ) ( not ( = ?auto_31440 ?auto_31442 ) ) ( not ( = ?auto_31440 ?auto_31441 ) ) ( not ( = ?auto_31442 ?auto_31441 ) ) ( ON ?auto_31441 ?auto_31443 ) ( not ( = ?auto_31438 ?auto_31443 ) ) ( not ( = ?auto_31439 ?auto_31443 ) ) ( not ( = ?auto_31440 ?auto_31443 ) ) ( not ( = ?auto_31442 ?auto_31443 ) ) ( not ( = ?auto_31441 ?auto_31443 ) ) ( ON ?auto_31442 ?auto_31441 ) ( ON-TABLE ?auto_31443 ) ( ON ?auto_31440 ?auto_31442 ) ( CLEAR ?auto_31440 ) ( HOLDING ?auto_31439 ) ( CLEAR ?auto_31438 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31438 ?auto_31439 ?auto_31440 )
      ( MAKE-2PILE ?auto_31438 ?auto_31439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31444 - BLOCK
      ?auto_31445 - BLOCK
    )
    :vars
    (
      ?auto_31446 - BLOCK
      ?auto_31449 - BLOCK
      ?auto_31448 - BLOCK
      ?auto_31447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31444 ) ( not ( = ?auto_31444 ?auto_31445 ) ) ( not ( = ?auto_31444 ?auto_31446 ) ) ( not ( = ?auto_31445 ?auto_31446 ) ) ( not ( = ?auto_31444 ?auto_31449 ) ) ( not ( = ?auto_31444 ?auto_31448 ) ) ( not ( = ?auto_31445 ?auto_31449 ) ) ( not ( = ?auto_31445 ?auto_31448 ) ) ( not ( = ?auto_31446 ?auto_31449 ) ) ( not ( = ?auto_31446 ?auto_31448 ) ) ( not ( = ?auto_31449 ?auto_31448 ) ) ( ON ?auto_31448 ?auto_31447 ) ( not ( = ?auto_31444 ?auto_31447 ) ) ( not ( = ?auto_31445 ?auto_31447 ) ) ( not ( = ?auto_31446 ?auto_31447 ) ) ( not ( = ?auto_31449 ?auto_31447 ) ) ( not ( = ?auto_31448 ?auto_31447 ) ) ( ON ?auto_31449 ?auto_31448 ) ( ON-TABLE ?auto_31447 ) ( ON ?auto_31446 ?auto_31449 ) ( CLEAR ?auto_31444 ) ( ON ?auto_31445 ?auto_31446 ) ( CLEAR ?auto_31445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31447 ?auto_31448 ?auto_31449 ?auto_31446 )
      ( MAKE-2PILE ?auto_31444 ?auto_31445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31450 - BLOCK
      ?auto_31451 - BLOCK
    )
    :vars
    (
      ?auto_31453 - BLOCK
      ?auto_31454 - BLOCK
      ?auto_31452 - BLOCK
      ?auto_31455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31450 ?auto_31451 ) ) ( not ( = ?auto_31450 ?auto_31453 ) ) ( not ( = ?auto_31451 ?auto_31453 ) ) ( not ( = ?auto_31450 ?auto_31454 ) ) ( not ( = ?auto_31450 ?auto_31452 ) ) ( not ( = ?auto_31451 ?auto_31454 ) ) ( not ( = ?auto_31451 ?auto_31452 ) ) ( not ( = ?auto_31453 ?auto_31454 ) ) ( not ( = ?auto_31453 ?auto_31452 ) ) ( not ( = ?auto_31454 ?auto_31452 ) ) ( ON ?auto_31452 ?auto_31455 ) ( not ( = ?auto_31450 ?auto_31455 ) ) ( not ( = ?auto_31451 ?auto_31455 ) ) ( not ( = ?auto_31453 ?auto_31455 ) ) ( not ( = ?auto_31454 ?auto_31455 ) ) ( not ( = ?auto_31452 ?auto_31455 ) ) ( ON ?auto_31454 ?auto_31452 ) ( ON-TABLE ?auto_31455 ) ( ON ?auto_31453 ?auto_31454 ) ( ON ?auto_31451 ?auto_31453 ) ( CLEAR ?auto_31451 ) ( HOLDING ?auto_31450 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31450 )
      ( MAKE-2PILE ?auto_31450 ?auto_31451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31456 - BLOCK
      ?auto_31457 - BLOCK
    )
    :vars
    (
      ?auto_31461 - BLOCK
      ?auto_31460 - BLOCK
      ?auto_31459 - BLOCK
      ?auto_31458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31456 ?auto_31457 ) ) ( not ( = ?auto_31456 ?auto_31461 ) ) ( not ( = ?auto_31457 ?auto_31461 ) ) ( not ( = ?auto_31456 ?auto_31460 ) ) ( not ( = ?auto_31456 ?auto_31459 ) ) ( not ( = ?auto_31457 ?auto_31460 ) ) ( not ( = ?auto_31457 ?auto_31459 ) ) ( not ( = ?auto_31461 ?auto_31460 ) ) ( not ( = ?auto_31461 ?auto_31459 ) ) ( not ( = ?auto_31460 ?auto_31459 ) ) ( ON ?auto_31459 ?auto_31458 ) ( not ( = ?auto_31456 ?auto_31458 ) ) ( not ( = ?auto_31457 ?auto_31458 ) ) ( not ( = ?auto_31461 ?auto_31458 ) ) ( not ( = ?auto_31460 ?auto_31458 ) ) ( not ( = ?auto_31459 ?auto_31458 ) ) ( ON ?auto_31460 ?auto_31459 ) ( ON-TABLE ?auto_31458 ) ( ON ?auto_31461 ?auto_31460 ) ( ON ?auto_31457 ?auto_31461 ) ( ON ?auto_31456 ?auto_31457 ) ( CLEAR ?auto_31456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31458 ?auto_31459 ?auto_31460 ?auto_31461 ?auto_31457 )
      ( MAKE-2PILE ?auto_31456 ?auto_31457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31465 - BLOCK
      ?auto_31466 - BLOCK
      ?auto_31467 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31467 ) ( CLEAR ?auto_31466 ) ( ON-TABLE ?auto_31465 ) ( ON ?auto_31466 ?auto_31465 ) ( not ( = ?auto_31465 ?auto_31466 ) ) ( not ( = ?auto_31465 ?auto_31467 ) ) ( not ( = ?auto_31466 ?auto_31467 ) ) )
    :subtasks
    ( ( !STACK ?auto_31467 ?auto_31466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31468 - BLOCK
      ?auto_31469 - BLOCK
      ?auto_31470 - BLOCK
    )
    :vars
    (
      ?auto_31471 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31469 ) ( ON-TABLE ?auto_31468 ) ( ON ?auto_31469 ?auto_31468 ) ( not ( = ?auto_31468 ?auto_31469 ) ) ( not ( = ?auto_31468 ?auto_31470 ) ) ( not ( = ?auto_31469 ?auto_31470 ) ) ( ON ?auto_31470 ?auto_31471 ) ( CLEAR ?auto_31470 ) ( HAND-EMPTY ) ( not ( = ?auto_31468 ?auto_31471 ) ) ( not ( = ?auto_31469 ?auto_31471 ) ) ( not ( = ?auto_31470 ?auto_31471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31470 ?auto_31471 )
      ( MAKE-3PILE ?auto_31468 ?auto_31469 ?auto_31470 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31472 - BLOCK
      ?auto_31473 - BLOCK
      ?auto_31474 - BLOCK
    )
    :vars
    (
      ?auto_31475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31472 ) ( not ( = ?auto_31472 ?auto_31473 ) ) ( not ( = ?auto_31472 ?auto_31474 ) ) ( not ( = ?auto_31473 ?auto_31474 ) ) ( ON ?auto_31474 ?auto_31475 ) ( CLEAR ?auto_31474 ) ( not ( = ?auto_31472 ?auto_31475 ) ) ( not ( = ?auto_31473 ?auto_31475 ) ) ( not ( = ?auto_31474 ?auto_31475 ) ) ( HOLDING ?auto_31473 ) ( CLEAR ?auto_31472 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31472 ?auto_31473 )
      ( MAKE-3PILE ?auto_31472 ?auto_31473 ?auto_31474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31476 - BLOCK
      ?auto_31477 - BLOCK
      ?auto_31478 - BLOCK
    )
    :vars
    (
      ?auto_31479 - BLOCK
      ?auto_31480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31476 ) ( not ( = ?auto_31476 ?auto_31477 ) ) ( not ( = ?auto_31476 ?auto_31478 ) ) ( not ( = ?auto_31477 ?auto_31478 ) ) ( ON ?auto_31478 ?auto_31479 ) ( not ( = ?auto_31476 ?auto_31479 ) ) ( not ( = ?auto_31477 ?auto_31479 ) ) ( not ( = ?auto_31478 ?auto_31479 ) ) ( CLEAR ?auto_31476 ) ( ON ?auto_31477 ?auto_31478 ) ( CLEAR ?auto_31477 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31480 ) ( ON ?auto_31479 ?auto_31480 ) ( not ( = ?auto_31480 ?auto_31479 ) ) ( not ( = ?auto_31480 ?auto_31478 ) ) ( not ( = ?auto_31480 ?auto_31477 ) ) ( not ( = ?auto_31476 ?auto_31480 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31480 ?auto_31479 ?auto_31478 )
      ( MAKE-3PILE ?auto_31476 ?auto_31477 ?auto_31478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31481 - BLOCK
      ?auto_31482 - BLOCK
      ?auto_31483 - BLOCK
    )
    :vars
    (
      ?auto_31484 - BLOCK
      ?auto_31485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31481 ?auto_31482 ) ) ( not ( = ?auto_31481 ?auto_31483 ) ) ( not ( = ?auto_31482 ?auto_31483 ) ) ( ON ?auto_31483 ?auto_31484 ) ( not ( = ?auto_31481 ?auto_31484 ) ) ( not ( = ?auto_31482 ?auto_31484 ) ) ( not ( = ?auto_31483 ?auto_31484 ) ) ( ON ?auto_31482 ?auto_31483 ) ( CLEAR ?auto_31482 ) ( ON-TABLE ?auto_31485 ) ( ON ?auto_31484 ?auto_31485 ) ( not ( = ?auto_31485 ?auto_31484 ) ) ( not ( = ?auto_31485 ?auto_31483 ) ) ( not ( = ?auto_31485 ?auto_31482 ) ) ( not ( = ?auto_31481 ?auto_31485 ) ) ( HOLDING ?auto_31481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31481 )
      ( MAKE-3PILE ?auto_31481 ?auto_31482 ?auto_31483 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31486 - BLOCK
      ?auto_31487 - BLOCK
      ?auto_31488 - BLOCK
    )
    :vars
    (
      ?auto_31489 - BLOCK
      ?auto_31490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31486 ?auto_31487 ) ) ( not ( = ?auto_31486 ?auto_31488 ) ) ( not ( = ?auto_31487 ?auto_31488 ) ) ( ON ?auto_31488 ?auto_31489 ) ( not ( = ?auto_31486 ?auto_31489 ) ) ( not ( = ?auto_31487 ?auto_31489 ) ) ( not ( = ?auto_31488 ?auto_31489 ) ) ( ON ?auto_31487 ?auto_31488 ) ( ON-TABLE ?auto_31490 ) ( ON ?auto_31489 ?auto_31490 ) ( not ( = ?auto_31490 ?auto_31489 ) ) ( not ( = ?auto_31490 ?auto_31488 ) ) ( not ( = ?auto_31490 ?auto_31487 ) ) ( not ( = ?auto_31486 ?auto_31490 ) ) ( ON ?auto_31486 ?auto_31487 ) ( CLEAR ?auto_31486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31490 ?auto_31489 ?auto_31488 ?auto_31487 )
      ( MAKE-3PILE ?auto_31486 ?auto_31487 ?auto_31488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31491 - BLOCK
      ?auto_31492 - BLOCK
      ?auto_31493 - BLOCK
    )
    :vars
    (
      ?auto_31494 - BLOCK
      ?auto_31495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31491 ?auto_31492 ) ) ( not ( = ?auto_31491 ?auto_31493 ) ) ( not ( = ?auto_31492 ?auto_31493 ) ) ( ON ?auto_31493 ?auto_31494 ) ( not ( = ?auto_31491 ?auto_31494 ) ) ( not ( = ?auto_31492 ?auto_31494 ) ) ( not ( = ?auto_31493 ?auto_31494 ) ) ( ON ?auto_31492 ?auto_31493 ) ( ON-TABLE ?auto_31495 ) ( ON ?auto_31494 ?auto_31495 ) ( not ( = ?auto_31495 ?auto_31494 ) ) ( not ( = ?auto_31495 ?auto_31493 ) ) ( not ( = ?auto_31495 ?auto_31492 ) ) ( not ( = ?auto_31491 ?auto_31495 ) ) ( HOLDING ?auto_31491 ) ( CLEAR ?auto_31492 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31495 ?auto_31494 ?auto_31493 ?auto_31492 ?auto_31491 )
      ( MAKE-3PILE ?auto_31491 ?auto_31492 ?auto_31493 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31496 - BLOCK
      ?auto_31497 - BLOCK
      ?auto_31498 - BLOCK
    )
    :vars
    (
      ?auto_31500 - BLOCK
      ?auto_31499 - BLOCK
      ?auto_31501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31496 ?auto_31497 ) ) ( not ( = ?auto_31496 ?auto_31498 ) ) ( not ( = ?auto_31497 ?auto_31498 ) ) ( ON ?auto_31498 ?auto_31500 ) ( not ( = ?auto_31496 ?auto_31500 ) ) ( not ( = ?auto_31497 ?auto_31500 ) ) ( not ( = ?auto_31498 ?auto_31500 ) ) ( ON ?auto_31497 ?auto_31498 ) ( ON-TABLE ?auto_31499 ) ( ON ?auto_31500 ?auto_31499 ) ( not ( = ?auto_31499 ?auto_31500 ) ) ( not ( = ?auto_31499 ?auto_31498 ) ) ( not ( = ?auto_31499 ?auto_31497 ) ) ( not ( = ?auto_31496 ?auto_31499 ) ) ( CLEAR ?auto_31497 ) ( ON ?auto_31496 ?auto_31501 ) ( CLEAR ?auto_31496 ) ( HAND-EMPTY ) ( not ( = ?auto_31496 ?auto_31501 ) ) ( not ( = ?auto_31497 ?auto_31501 ) ) ( not ( = ?auto_31498 ?auto_31501 ) ) ( not ( = ?auto_31500 ?auto_31501 ) ) ( not ( = ?auto_31499 ?auto_31501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31496 ?auto_31501 )
      ( MAKE-3PILE ?auto_31496 ?auto_31497 ?auto_31498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31502 - BLOCK
      ?auto_31503 - BLOCK
      ?auto_31504 - BLOCK
    )
    :vars
    (
      ?auto_31505 - BLOCK
      ?auto_31507 - BLOCK
      ?auto_31506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31502 ?auto_31503 ) ) ( not ( = ?auto_31502 ?auto_31504 ) ) ( not ( = ?auto_31503 ?auto_31504 ) ) ( ON ?auto_31504 ?auto_31505 ) ( not ( = ?auto_31502 ?auto_31505 ) ) ( not ( = ?auto_31503 ?auto_31505 ) ) ( not ( = ?auto_31504 ?auto_31505 ) ) ( ON-TABLE ?auto_31507 ) ( ON ?auto_31505 ?auto_31507 ) ( not ( = ?auto_31507 ?auto_31505 ) ) ( not ( = ?auto_31507 ?auto_31504 ) ) ( not ( = ?auto_31507 ?auto_31503 ) ) ( not ( = ?auto_31502 ?auto_31507 ) ) ( ON ?auto_31502 ?auto_31506 ) ( CLEAR ?auto_31502 ) ( not ( = ?auto_31502 ?auto_31506 ) ) ( not ( = ?auto_31503 ?auto_31506 ) ) ( not ( = ?auto_31504 ?auto_31506 ) ) ( not ( = ?auto_31505 ?auto_31506 ) ) ( not ( = ?auto_31507 ?auto_31506 ) ) ( HOLDING ?auto_31503 ) ( CLEAR ?auto_31504 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31507 ?auto_31505 ?auto_31504 ?auto_31503 )
      ( MAKE-3PILE ?auto_31502 ?auto_31503 ?auto_31504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31508 - BLOCK
      ?auto_31509 - BLOCK
      ?auto_31510 - BLOCK
    )
    :vars
    (
      ?auto_31512 - BLOCK
      ?auto_31511 - BLOCK
      ?auto_31513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31508 ?auto_31509 ) ) ( not ( = ?auto_31508 ?auto_31510 ) ) ( not ( = ?auto_31509 ?auto_31510 ) ) ( ON ?auto_31510 ?auto_31512 ) ( not ( = ?auto_31508 ?auto_31512 ) ) ( not ( = ?auto_31509 ?auto_31512 ) ) ( not ( = ?auto_31510 ?auto_31512 ) ) ( ON-TABLE ?auto_31511 ) ( ON ?auto_31512 ?auto_31511 ) ( not ( = ?auto_31511 ?auto_31512 ) ) ( not ( = ?auto_31511 ?auto_31510 ) ) ( not ( = ?auto_31511 ?auto_31509 ) ) ( not ( = ?auto_31508 ?auto_31511 ) ) ( ON ?auto_31508 ?auto_31513 ) ( not ( = ?auto_31508 ?auto_31513 ) ) ( not ( = ?auto_31509 ?auto_31513 ) ) ( not ( = ?auto_31510 ?auto_31513 ) ) ( not ( = ?auto_31512 ?auto_31513 ) ) ( not ( = ?auto_31511 ?auto_31513 ) ) ( CLEAR ?auto_31510 ) ( ON ?auto_31509 ?auto_31508 ) ( CLEAR ?auto_31509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31513 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31513 ?auto_31508 )
      ( MAKE-3PILE ?auto_31508 ?auto_31509 ?auto_31510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31514 - BLOCK
      ?auto_31515 - BLOCK
      ?auto_31516 - BLOCK
    )
    :vars
    (
      ?auto_31517 - BLOCK
      ?auto_31518 - BLOCK
      ?auto_31519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31514 ?auto_31515 ) ) ( not ( = ?auto_31514 ?auto_31516 ) ) ( not ( = ?auto_31515 ?auto_31516 ) ) ( not ( = ?auto_31514 ?auto_31517 ) ) ( not ( = ?auto_31515 ?auto_31517 ) ) ( not ( = ?auto_31516 ?auto_31517 ) ) ( ON-TABLE ?auto_31518 ) ( ON ?auto_31517 ?auto_31518 ) ( not ( = ?auto_31518 ?auto_31517 ) ) ( not ( = ?auto_31518 ?auto_31516 ) ) ( not ( = ?auto_31518 ?auto_31515 ) ) ( not ( = ?auto_31514 ?auto_31518 ) ) ( ON ?auto_31514 ?auto_31519 ) ( not ( = ?auto_31514 ?auto_31519 ) ) ( not ( = ?auto_31515 ?auto_31519 ) ) ( not ( = ?auto_31516 ?auto_31519 ) ) ( not ( = ?auto_31517 ?auto_31519 ) ) ( not ( = ?auto_31518 ?auto_31519 ) ) ( ON ?auto_31515 ?auto_31514 ) ( CLEAR ?auto_31515 ) ( ON-TABLE ?auto_31519 ) ( HOLDING ?auto_31516 ) ( CLEAR ?auto_31517 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31518 ?auto_31517 ?auto_31516 )
      ( MAKE-3PILE ?auto_31514 ?auto_31515 ?auto_31516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31520 - BLOCK
      ?auto_31521 - BLOCK
      ?auto_31522 - BLOCK
    )
    :vars
    (
      ?auto_31523 - BLOCK
      ?auto_31525 - BLOCK
      ?auto_31524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31520 ?auto_31521 ) ) ( not ( = ?auto_31520 ?auto_31522 ) ) ( not ( = ?auto_31521 ?auto_31522 ) ) ( not ( = ?auto_31520 ?auto_31523 ) ) ( not ( = ?auto_31521 ?auto_31523 ) ) ( not ( = ?auto_31522 ?auto_31523 ) ) ( ON-TABLE ?auto_31525 ) ( ON ?auto_31523 ?auto_31525 ) ( not ( = ?auto_31525 ?auto_31523 ) ) ( not ( = ?auto_31525 ?auto_31522 ) ) ( not ( = ?auto_31525 ?auto_31521 ) ) ( not ( = ?auto_31520 ?auto_31525 ) ) ( ON ?auto_31520 ?auto_31524 ) ( not ( = ?auto_31520 ?auto_31524 ) ) ( not ( = ?auto_31521 ?auto_31524 ) ) ( not ( = ?auto_31522 ?auto_31524 ) ) ( not ( = ?auto_31523 ?auto_31524 ) ) ( not ( = ?auto_31525 ?auto_31524 ) ) ( ON ?auto_31521 ?auto_31520 ) ( ON-TABLE ?auto_31524 ) ( CLEAR ?auto_31523 ) ( ON ?auto_31522 ?auto_31521 ) ( CLEAR ?auto_31522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31524 ?auto_31520 ?auto_31521 )
      ( MAKE-3PILE ?auto_31520 ?auto_31521 ?auto_31522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31526 - BLOCK
      ?auto_31527 - BLOCK
      ?auto_31528 - BLOCK
    )
    :vars
    (
      ?auto_31529 - BLOCK
      ?auto_31530 - BLOCK
      ?auto_31531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31526 ?auto_31527 ) ) ( not ( = ?auto_31526 ?auto_31528 ) ) ( not ( = ?auto_31527 ?auto_31528 ) ) ( not ( = ?auto_31526 ?auto_31529 ) ) ( not ( = ?auto_31527 ?auto_31529 ) ) ( not ( = ?auto_31528 ?auto_31529 ) ) ( ON-TABLE ?auto_31530 ) ( not ( = ?auto_31530 ?auto_31529 ) ) ( not ( = ?auto_31530 ?auto_31528 ) ) ( not ( = ?auto_31530 ?auto_31527 ) ) ( not ( = ?auto_31526 ?auto_31530 ) ) ( ON ?auto_31526 ?auto_31531 ) ( not ( = ?auto_31526 ?auto_31531 ) ) ( not ( = ?auto_31527 ?auto_31531 ) ) ( not ( = ?auto_31528 ?auto_31531 ) ) ( not ( = ?auto_31529 ?auto_31531 ) ) ( not ( = ?auto_31530 ?auto_31531 ) ) ( ON ?auto_31527 ?auto_31526 ) ( ON-TABLE ?auto_31531 ) ( ON ?auto_31528 ?auto_31527 ) ( CLEAR ?auto_31528 ) ( HOLDING ?auto_31529 ) ( CLEAR ?auto_31530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31530 ?auto_31529 )
      ( MAKE-3PILE ?auto_31526 ?auto_31527 ?auto_31528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31532 - BLOCK
      ?auto_31533 - BLOCK
      ?auto_31534 - BLOCK
    )
    :vars
    (
      ?auto_31536 - BLOCK
      ?auto_31537 - BLOCK
      ?auto_31535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31532 ?auto_31533 ) ) ( not ( = ?auto_31532 ?auto_31534 ) ) ( not ( = ?auto_31533 ?auto_31534 ) ) ( not ( = ?auto_31532 ?auto_31536 ) ) ( not ( = ?auto_31533 ?auto_31536 ) ) ( not ( = ?auto_31534 ?auto_31536 ) ) ( ON-TABLE ?auto_31537 ) ( not ( = ?auto_31537 ?auto_31536 ) ) ( not ( = ?auto_31537 ?auto_31534 ) ) ( not ( = ?auto_31537 ?auto_31533 ) ) ( not ( = ?auto_31532 ?auto_31537 ) ) ( ON ?auto_31532 ?auto_31535 ) ( not ( = ?auto_31532 ?auto_31535 ) ) ( not ( = ?auto_31533 ?auto_31535 ) ) ( not ( = ?auto_31534 ?auto_31535 ) ) ( not ( = ?auto_31536 ?auto_31535 ) ) ( not ( = ?auto_31537 ?auto_31535 ) ) ( ON ?auto_31533 ?auto_31532 ) ( ON-TABLE ?auto_31535 ) ( ON ?auto_31534 ?auto_31533 ) ( CLEAR ?auto_31537 ) ( ON ?auto_31536 ?auto_31534 ) ( CLEAR ?auto_31536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31535 ?auto_31532 ?auto_31533 ?auto_31534 )
      ( MAKE-3PILE ?auto_31532 ?auto_31533 ?auto_31534 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31538 - BLOCK
      ?auto_31539 - BLOCK
      ?auto_31540 - BLOCK
    )
    :vars
    (
      ?auto_31543 - BLOCK
      ?auto_31541 - BLOCK
      ?auto_31542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31538 ?auto_31539 ) ) ( not ( = ?auto_31538 ?auto_31540 ) ) ( not ( = ?auto_31539 ?auto_31540 ) ) ( not ( = ?auto_31538 ?auto_31543 ) ) ( not ( = ?auto_31539 ?auto_31543 ) ) ( not ( = ?auto_31540 ?auto_31543 ) ) ( not ( = ?auto_31541 ?auto_31543 ) ) ( not ( = ?auto_31541 ?auto_31540 ) ) ( not ( = ?auto_31541 ?auto_31539 ) ) ( not ( = ?auto_31538 ?auto_31541 ) ) ( ON ?auto_31538 ?auto_31542 ) ( not ( = ?auto_31538 ?auto_31542 ) ) ( not ( = ?auto_31539 ?auto_31542 ) ) ( not ( = ?auto_31540 ?auto_31542 ) ) ( not ( = ?auto_31543 ?auto_31542 ) ) ( not ( = ?auto_31541 ?auto_31542 ) ) ( ON ?auto_31539 ?auto_31538 ) ( ON-TABLE ?auto_31542 ) ( ON ?auto_31540 ?auto_31539 ) ( ON ?auto_31543 ?auto_31540 ) ( CLEAR ?auto_31543 ) ( HOLDING ?auto_31541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31541 )
      ( MAKE-3PILE ?auto_31538 ?auto_31539 ?auto_31540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31544 - BLOCK
      ?auto_31545 - BLOCK
      ?auto_31546 - BLOCK
    )
    :vars
    (
      ?auto_31548 - BLOCK
      ?auto_31549 - BLOCK
      ?auto_31547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31544 ?auto_31545 ) ) ( not ( = ?auto_31544 ?auto_31546 ) ) ( not ( = ?auto_31545 ?auto_31546 ) ) ( not ( = ?auto_31544 ?auto_31548 ) ) ( not ( = ?auto_31545 ?auto_31548 ) ) ( not ( = ?auto_31546 ?auto_31548 ) ) ( not ( = ?auto_31549 ?auto_31548 ) ) ( not ( = ?auto_31549 ?auto_31546 ) ) ( not ( = ?auto_31549 ?auto_31545 ) ) ( not ( = ?auto_31544 ?auto_31549 ) ) ( ON ?auto_31544 ?auto_31547 ) ( not ( = ?auto_31544 ?auto_31547 ) ) ( not ( = ?auto_31545 ?auto_31547 ) ) ( not ( = ?auto_31546 ?auto_31547 ) ) ( not ( = ?auto_31548 ?auto_31547 ) ) ( not ( = ?auto_31549 ?auto_31547 ) ) ( ON ?auto_31545 ?auto_31544 ) ( ON-TABLE ?auto_31547 ) ( ON ?auto_31546 ?auto_31545 ) ( ON ?auto_31548 ?auto_31546 ) ( ON ?auto_31549 ?auto_31548 ) ( CLEAR ?auto_31549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31547 ?auto_31544 ?auto_31545 ?auto_31546 ?auto_31548 )
      ( MAKE-3PILE ?auto_31544 ?auto_31545 ?auto_31546 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31551 - BLOCK
    )
    :vars
    (
      ?auto_31552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31552 ?auto_31551 ) ( CLEAR ?auto_31552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31551 ) ( not ( = ?auto_31551 ?auto_31552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31552 ?auto_31551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31553 - BLOCK
    )
    :vars
    (
      ?auto_31554 - BLOCK
      ?auto_31555 - BLOCK
      ?auto_31556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31554 ?auto_31553 ) ( CLEAR ?auto_31554 ) ( ON-TABLE ?auto_31553 ) ( not ( = ?auto_31553 ?auto_31554 ) ) ( HOLDING ?auto_31555 ) ( CLEAR ?auto_31556 ) ( not ( = ?auto_31553 ?auto_31555 ) ) ( not ( = ?auto_31553 ?auto_31556 ) ) ( not ( = ?auto_31554 ?auto_31555 ) ) ( not ( = ?auto_31554 ?auto_31556 ) ) ( not ( = ?auto_31555 ?auto_31556 ) ) )
    :subtasks
    ( ( !STACK ?auto_31555 ?auto_31556 )
      ( MAKE-1PILE ?auto_31553 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31557 - BLOCK
    )
    :vars
    (
      ?auto_31558 - BLOCK
      ?auto_31560 - BLOCK
      ?auto_31559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31558 ?auto_31557 ) ( ON-TABLE ?auto_31557 ) ( not ( = ?auto_31557 ?auto_31558 ) ) ( CLEAR ?auto_31560 ) ( not ( = ?auto_31557 ?auto_31559 ) ) ( not ( = ?auto_31557 ?auto_31560 ) ) ( not ( = ?auto_31558 ?auto_31559 ) ) ( not ( = ?auto_31558 ?auto_31560 ) ) ( not ( = ?auto_31559 ?auto_31560 ) ) ( ON ?auto_31559 ?auto_31558 ) ( CLEAR ?auto_31559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31557 ?auto_31558 )
      ( MAKE-1PILE ?auto_31557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31561 - BLOCK
    )
    :vars
    (
      ?auto_31564 - BLOCK
      ?auto_31562 - BLOCK
      ?auto_31563 - BLOCK
      ?auto_31565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31564 ?auto_31561 ) ( ON-TABLE ?auto_31561 ) ( not ( = ?auto_31561 ?auto_31564 ) ) ( not ( = ?auto_31561 ?auto_31562 ) ) ( not ( = ?auto_31561 ?auto_31563 ) ) ( not ( = ?auto_31564 ?auto_31562 ) ) ( not ( = ?auto_31564 ?auto_31563 ) ) ( not ( = ?auto_31562 ?auto_31563 ) ) ( ON ?auto_31562 ?auto_31564 ) ( CLEAR ?auto_31562 ) ( HOLDING ?auto_31563 ) ( CLEAR ?auto_31565 ) ( ON-TABLE ?auto_31565 ) ( not ( = ?auto_31565 ?auto_31563 ) ) ( not ( = ?auto_31561 ?auto_31565 ) ) ( not ( = ?auto_31564 ?auto_31565 ) ) ( not ( = ?auto_31562 ?auto_31565 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31565 ?auto_31563 )
      ( MAKE-1PILE ?auto_31561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31566 - BLOCK
    )
    :vars
    (
      ?auto_31568 - BLOCK
      ?auto_31569 - BLOCK
      ?auto_31567 - BLOCK
      ?auto_31570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31568 ?auto_31566 ) ( ON-TABLE ?auto_31566 ) ( not ( = ?auto_31566 ?auto_31568 ) ) ( not ( = ?auto_31566 ?auto_31569 ) ) ( not ( = ?auto_31566 ?auto_31567 ) ) ( not ( = ?auto_31568 ?auto_31569 ) ) ( not ( = ?auto_31568 ?auto_31567 ) ) ( not ( = ?auto_31569 ?auto_31567 ) ) ( ON ?auto_31569 ?auto_31568 ) ( CLEAR ?auto_31570 ) ( ON-TABLE ?auto_31570 ) ( not ( = ?auto_31570 ?auto_31567 ) ) ( not ( = ?auto_31566 ?auto_31570 ) ) ( not ( = ?auto_31568 ?auto_31570 ) ) ( not ( = ?auto_31569 ?auto_31570 ) ) ( ON ?auto_31567 ?auto_31569 ) ( CLEAR ?auto_31567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31566 ?auto_31568 ?auto_31569 )
      ( MAKE-1PILE ?auto_31566 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31571 - BLOCK
    )
    :vars
    (
      ?auto_31575 - BLOCK
      ?auto_31573 - BLOCK
      ?auto_31574 - BLOCK
      ?auto_31572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31575 ?auto_31571 ) ( ON-TABLE ?auto_31571 ) ( not ( = ?auto_31571 ?auto_31575 ) ) ( not ( = ?auto_31571 ?auto_31573 ) ) ( not ( = ?auto_31571 ?auto_31574 ) ) ( not ( = ?auto_31575 ?auto_31573 ) ) ( not ( = ?auto_31575 ?auto_31574 ) ) ( not ( = ?auto_31573 ?auto_31574 ) ) ( ON ?auto_31573 ?auto_31575 ) ( not ( = ?auto_31572 ?auto_31574 ) ) ( not ( = ?auto_31571 ?auto_31572 ) ) ( not ( = ?auto_31575 ?auto_31572 ) ) ( not ( = ?auto_31573 ?auto_31572 ) ) ( ON ?auto_31574 ?auto_31573 ) ( CLEAR ?auto_31574 ) ( HOLDING ?auto_31572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31572 )
      ( MAKE-1PILE ?auto_31571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31576 - BLOCK
    )
    :vars
    (
      ?auto_31579 - BLOCK
      ?auto_31577 - BLOCK
      ?auto_31578 - BLOCK
      ?auto_31580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31579 ?auto_31576 ) ( ON-TABLE ?auto_31576 ) ( not ( = ?auto_31576 ?auto_31579 ) ) ( not ( = ?auto_31576 ?auto_31577 ) ) ( not ( = ?auto_31576 ?auto_31578 ) ) ( not ( = ?auto_31579 ?auto_31577 ) ) ( not ( = ?auto_31579 ?auto_31578 ) ) ( not ( = ?auto_31577 ?auto_31578 ) ) ( ON ?auto_31577 ?auto_31579 ) ( not ( = ?auto_31580 ?auto_31578 ) ) ( not ( = ?auto_31576 ?auto_31580 ) ) ( not ( = ?auto_31579 ?auto_31580 ) ) ( not ( = ?auto_31577 ?auto_31580 ) ) ( ON ?auto_31578 ?auto_31577 ) ( ON ?auto_31580 ?auto_31578 ) ( CLEAR ?auto_31580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31576 ?auto_31579 ?auto_31577 ?auto_31578 )
      ( MAKE-1PILE ?auto_31576 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31581 - BLOCK
    )
    :vars
    (
      ?auto_31584 - BLOCK
      ?auto_31582 - BLOCK
      ?auto_31583 - BLOCK
      ?auto_31585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31584 ?auto_31581 ) ( ON-TABLE ?auto_31581 ) ( not ( = ?auto_31581 ?auto_31584 ) ) ( not ( = ?auto_31581 ?auto_31582 ) ) ( not ( = ?auto_31581 ?auto_31583 ) ) ( not ( = ?auto_31584 ?auto_31582 ) ) ( not ( = ?auto_31584 ?auto_31583 ) ) ( not ( = ?auto_31582 ?auto_31583 ) ) ( ON ?auto_31582 ?auto_31584 ) ( not ( = ?auto_31585 ?auto_31583 ) ) ( not ( = ?auto_31581 ?auto_31585 ) ) ( not ( = ?auto_31584 ?auto_31585 ) ) ( not ( = ?auto_31582 ?auto_31585 ) ) ( ON ?auto_31583 ?auto_31582 ) ( HOLDING ?auto_31585 ) ( CLEAR ?auto_31583 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31581 ?auto_31584 ?auto_31582 ?auto_31583 ?auto_31585 )
      ( MAKE-1PILE ?auto_31581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31586 - BLOCK
    )
    :vars
    (
      ?auto_31589 - BLOCK
      ?auto_31587 - BLOCK
      ?auto_31590 - BLOCK
      ?auto_31588 - BLOCK
      ?auto_31591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31589 ?auto_31586 ) ( ON-TABLE ?auto_31586 ) ( not ( = ?auto_31586 ?auto_31589 ) ) ( not ( = ?auto_31586 ?auto_31587 ) ) ( not ( = ?auto_31586 ?auto_31590 ) ) ( not ( = ?auto_31589 ?auto_31587 ) ) ( not ( = ?auto_31589 ?auto_31590 ) ) ( not ( = ?auto_31587 ?auto_31590 ) ) ( ON ?auto_31587 ?auto_31589 ) ( not ( = ?auto_31588 ?auto_31590 ) ) ( not ( = ?auto_31586 ?auto_31588 ) ) ( not ( = ?auto_31589 ?auto_31588 ) ) ( not ( = ?auto_31587 ?auto_31588 ) ) ( ON ?auto_31590 ?auto_31587 ) ( CLEAR ?auto_31590 ) ( ON ?auto_31588 ?auto_31591 ) ( CLEAR ?auto_31588 ) ( HAND-EMPTY ) ( not ( = ?auto_31586 ?auto_31591 ) ) ( not ( = ?auto_31589 ?auto_31591 ) ) ( not ( = ?auto_31587 ?auto_31591 ) ) ( not ( = ?auto_31590 ?auto_31591 ) ) ( not ( = ?auto_31588 ?auto_31591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31588 ?auto_31591 )
      ( MAKE-1PILE ?auto_31586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31592 - BLOCK
    )
    :vars
    (
      ?auto_31593 - BLOCK
      ?auto_31594 - BLOCK
      ?auto_31597 - BLOCK
      ?auto_31596 - BLOCK
      ?auto_31595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31593 ?auto_31592 ) ( ON-TABLE ?auto_31592 ) ( not ( = ?auto_31592 ?auto_31593 ) ) ( not ( = ?auto_31592 ?auto_31594 ) ) ( not ( = ?auto_31592 ?auto_31597 ) ) ( not ( = ?auto_31593 ?auto_31594 ) ) ( not ( = ?auto_31593 ?auto_31597 ) ) ( not ( = ?auto_31594 ?auto_31597 ) ) ( ON ?auto_31594 ?auto_31593 ) ( not ( = ?auto_31596 ?auto_31597 ) ) ( not ( = ?auto_31592 ?auto_31596 ) ) ( not ( = ?auto_31593 ?auto_31596 ) ) ( not ( = ?auto_31594 ?auto_31596 ) ) ( ON ?auto_31596 ?auto_31595 ) ( CLEAR ?auto_31596 ) ( not ( = ?auto_31592 ?auto_31595 ) ) ( not ( = ?auto_31593 ?auto_31595 ) ) ( not ( = ?auto_31594 ?auto_31595 ) ) ( not ( = ?auto_31597 ?auto_31595 ) ) ( not ( = ?auto_31596 ?auto_31595 ) ) ( HOLDING ?auto_31597 ) ( CLEAR ?auto_31594 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31592 ?auto_31593 ?auto_31594 ?auto_31597 )
      ( MAKE-1PILE ?auto_31592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31598 - BLOCK
    )
    :vars
    (
      ?auto_31602 - BLOCK
      ?auto_31603 - BLOCK
      ?auto_31600 - BLOCK
      ?auto_31599 - BLOCK
      ?auto_31601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31602 ?auto_31598 ) ( ON-TABLE ?auto_31598 ) ( not ( = ?auto_31598 ?auto_31602 ) ) ( not ( = ?auto_31598 ?auto_31603 ) ) ( not ( = ?auto_31598 ?auto_31600 ) ) ( not ( = ?auto_31602 ?auto_31603 ) ) ( not ( = ?auto_31602 ?auto_31600 ) ) ( not ( = ?auto_31603 ?auto_31600 ) ) ( ON ?auto_31603 ?auto_31602 ) ( not ( = ?auto_31599 ?auto_31600 ) ) ( not ( = ?auto_31598 ?auto_31599 ) ) ( not ( = ?auto_31602 ?auto_31599 ) ) ( not ( = ?auto_31603 ?auto_31599 ) ) ( ON ?auto_31599 ?auto_31601 ) ( not ( = ?auto_31598 ?auto_31601 ) ) ( not ( = ?auto_31602 ?auto_31601 ) ) ( not ( = ?auto_31603 ?auto_31601 ) ) ( not ( = ?auto_31600 ?auto_31601 ) ) ( not ( = ?auto_31599 ?auto_31601 ) ) ( CLEAR ?auto_31603 ) ( ON ?auto_31600 ?auto_31599 ) ( CLEAR ?auto_31600 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31601 ?auto_31599 )
      ( MAKE-1PILE ?auto_31598 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31604 - BLOCK
    )
    :vars
    (
      ?auto_31606 - BLOCK
      ?auto_31605 - BLOCK
      ?auto_31607 - BLOCK
      ?auto_31609 - BLOCK
      ?auto_31608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31606 ?auto_31604 ) ( ON-TABLE ?auto_31604 ) ( not ( = ?auto_31604 ?auto_31606 ) ) ( not ( = ?auto_31604 ?auto_31605 ) ) ( not ( = ?auto_31604 ?auto_31607 ) ) ( not ( = ?auto_31606 ?auto_31605 ) ) ( not ( = ?auto_31606 ?auto_31607 ) ) ( not ( = ?auto_31605 ?auto_31607 ) ) ( not ( = ?auto_31609 ?auto_31607 ) ) ( not ( = ?auto_31604 ?auto_31609 ) ) ( not ( = ?auto_31606 ?auto_31609 ) ) ( not ( = ?auto_31605 ?auto_31609 ) ) ( ON ?auto_31609 ?auto_31608 ) ( not ( = ?auto_31604 ?auto_31608 ) ) ( not ( = ?auto_31606 ?auto_31608 ) ) ( not ( = ?auto_31605 ?auto_31608 ) ) ( not ( = ?auto_31607 ?auto_31608 ) ) ( not ( = ?auto_31609 ?auto_31608 ) ) ( ON ?auto_31607 ?auto_31609 ) ( CLEAR ?auto_31607 ) ( ON-TABLE ?auto_31608 ) ( HOLDING ?auto_31605 ) ( CLEAR ?auto_31606 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31604 ?auto_31606 ?auto_31605 )
      ( MAKE-1PILE ?auto_31604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31610 - BLOCK
    )
    :vars
    (
      ?auto_31614 - BLOCK
      ?auto_31612 - BLOCK
      ?auto_31615 - BLOCK
      ?auto_31611 - BLOCK
      ?auto_31613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31614 ?auto_31610 ) ( ON-TABLE ?auto_31610 ) ( not ( = ?auto_31610 ?auto_31614 ) ) ( not ( = ?auto_31610 ?auto_31612 ) ) ( not ( = ?auto_31610 ?auto_31615 ) ) ( not ( = ?auto_31614 ?auto_31612 ) ) ( not ( = ?auto_31614 ?auto_31615 ) ) ( not ( = ?auto_31612 ?auto_31615 ) ) ( not ( = ?auto_31611 ?auto_31615 ) ) ( not ( = ?auto_31610 ?auto_31611 ) ) ( not ( = ?auto_31614 ?auto_31611 ) ) ( not ( = ?auto_31612 ?auto_31611 ) ) ( ON ?auto_31611 ?auto_31613 ) ( not ( = ?auto_31610 ?auto_31613 ) ) ( not ( = ?auto_31614 ?auto_31613 ) ) ( not ( = ?auto_31612 ?auto_31613 ) ) ( not ( = ?auto_31615 ?auto_31613 ) ) ( not ( = ?auto_31611 ?auto_31613 ) ) ( ON ?auto_31615 ?auto_31611 ) ( ON-TABLE ?auto_31613 ) ( CLEAR ?auto_31614 ) ( ON ?auto_31612 ?auto_31615 ) ( CLEAR ?auto_31612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31613 ?auto_31611 ?auto_31615 )
      ( MAKE-1PILE ?auto_31610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31628 - BLOCK
    )
    :vars
    (
      ?auto_31629 - BLOCK
      ?auto_31631 - BLOCK
      ?auto_31633 - BLOCK
      ?auto_31632 - BLOCK
      ?auto_31630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31628 ?auto_31629 ) ) ( not ( = ?auto_31628 ?auto_31631 ) ) ( not ( = ?auto_31628 ?auto_31633 ) ) ( not ( = ?auto_31629 ?auto_31631 ) ) ( not ( = ?auto_31629 ?auto_31633 ) ) ( not ( = ?auto_31631 ?auto_31633 ) ) ( not ( = ?auto_31632 ?auto_31633 ) ) ( not ( = ?auto_31628 ?auto_31632 ) ) ( not ( = ?auto_31629 ?auto_31632 ) ) ( not ( = ?auto_31631 ?auto_31632 ) ) ( ON ?auto_31632 ?auto_31630 ) ( not ( = ?auto_31628 ?auto_31630 ) ) ( not ( = ?auto_31629 ?auto_31630 ) ) ( not ( = ?auto_31631 ?auto_31630 ) ) ( not ( = ?auto_31633 ?auto_31630 ) ) ( not ( = ?auto_31632 ?auto_31630 ) ) ( ON ?auto_31633 ?auto_31632 ) ( ON-TABLE ?auto_31630 ) ( ON ?auto_31631 ?auto_31633 ) ( ON ?auto_31629 ?auto_31631 ) ( CLEAR ?auto_31629 ) ( HOLDING ?auto_31628 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31628 ?auto_31629 )
      ( MAKE-1PILE ?auto_31628 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31634 - BLOCK
    )
    :vars
    (
      ?auto_31638 - BLOCK
      ?auto_31635 - BLOCK
      ?auto_31637 - BLOCK
      ?auto_31636 - BLOCK
      ?auto_31639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31634 ?auto_31638 ) ) ( not ( = ?auto_31634 ?auto_31635 ) ) ( not ( = ?auto_31634 ?auto_31637 ) ) ( not ( = ?auto_31638 ?auto_31635 ) ) ( not ( = ?auto_31638 ?auto_31637 ) ) ( not ( = ?auto_31635 ?auto_31637 ) ) ( not ( = ?auto_31636 ?auto_31637 ) ) ( not ( = ?auto_31634 ?auto_31636 ) ) ( not ( = ?auto_31638 ?auto_31636 ) ) ( not ( = ?auto_31635 ?auto_31636 ) ) ( ON ?auto_31636 ?auto_31639 ) ( not ( = ?auto_31634 ?auto_31639 ) ) ( not ( = ?auto_31638 ?auto_31639 ) ) ( not ( = ?auto_31635 ?auto_31639 ) ) ( not ( = ?auto_31637 ?auto_31639 ) ) ( not ( = ?auto_31636 ?auto_31639 ) ) ( ON ?auto_31637 ?auto_31636 ) ( ON-TABLE ?auto_31639 ) ( ON ?auto_31635 ?auto_31637 ) ( ON ?auto_31638 ?auto_31635 ) ( ON ?auto_31634 ?auto_31638 ) ( CLEAR ?auto_31634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31639 ?auto_31636 ?auto_31637 ?auto_31635 ?auto_31638 )
      ( MAKE-1PILE ?auto_31634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31644 - BLOCK
      ?auto_31645 - BLOCK
      ?auto_31646 - BLOCK
      ?auto_31647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31647 ) ( CLEAR ?auto_31646 ) ( ON-TABLE ?auto_31644 ) ( ON ?auto_31645 ?auto_31644 ) ( ON ?auto_31646 ?auto_31645 ) ( not ( = ?auto_31644 ?auto_31645 ) ) ( not ( = ?auto_31644 ?auto_31646 ) ) ( not ( = ?auto_31644 ?auto_31647 ) ) ( not ( = ?auto_31645 ?auto_31646 ) ) ( not ( = ?auto_31645 ?auto_31647 ) ) ( not ( = ?auto_31646 ?auto_31647 ) ) )
    :subtasks
    ( ( !STACK ?auto_31647 ?auto_31646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
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
    ( and ( CLEAR ?auto_31650 ) ( ON-TABLE ?auto_31648 ) ( ON ?auto_31649 ?auto_31648 ) ( ON ?auto_31650 ?auto_31649 ) ( not ( = ?auto_31648 ?auto_31649 ) ) ( not ( = ?auto_31648 ?auto_31650 ) ) ( not ( = ?auto_31648 ?auto_31651 ) ) ( not ( = ?auto_31649 ?auto_31650 ) ) ( not ( = ?auto_31649 ?auto_31651 ) ) ( not ( = ?auto_31650 ?auto_31651 ) ) ( ON ?auto_31651 ?auto_31652 ) ( CLEAR ?auto_31651 ) ( HAND-EMPTY ) ( not ( = ?auto_31648 ?auto_31652 ) ) ( not ( = ?auto_31649 ?auto_31652 ) ) ( not ( = ?auto_31650 ?auto_31652 ) ) ( not ( = ?auto_31651 ?auto_31652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31651 ?auto_31652 )
      ( MAKE-4PILE ?auto_31648 ?auto_31649 ?auto_31650 ?auto_31651 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31653 - BLOCK
      ?auto_31654 - BLOCK
      ?auto_31655 - BLOCK
      ?auto_31656 - BLOCK
    )
    :vars
    (
      ?auto_31657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31653 ) ( ON ?auto_31654 ?auto_31653 ) ( not ( = ?auto_31653 ?auto_31654 ) ) ( not ( = ?auto_31653 ?auto_31655 ) ) ( not ( = ?auto_31653 ?auto_31656 ) ) ( not ( = ?auto_31654 ?auto_31655 ) ) ( not ( = ?auto_31654 ?auto_31656 ) ) ( not ( = ?auto_31655 ?auto_31656 ) ) ( ON ?auto_31656 ?auto_31657 ) ( CLEAR ?auto_31656 ) ( not ( = ?auto_31653 ?auto_31657 ) ) ( not ( = ?auto_31654 ?auto_31657 ) ) ( not ( = ?auto_31655 ?auto_31657 ) ) ( not ( = ?auto_31656 ?auto_31657 ) ) ( HOLDING ?auto_31655 ) ( CLEAR ?auto_31654 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31653 ?auto_31654 ?auto_31655 )
      ( MAKE-4PILE ?auto_31653 ?auto_31654 ?auto_31655 ?auto_31656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31658 - BLOCK
      ?auto_31659 - BLOCK
      ?auto_31660 - BLOCK
      ?auto_31661 - BLOCK
    )
    :vars
    (
      ?auto_31662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31658 ) ( ON ?auto_31659 ?auto_31658 ) ( not ( = ?auto_31658 ?auto_31659 ) ) ( not ( = ?auto_31658 ?auto_31660 ) ) ( not ( = ?auto_31658 ?auto_31661 ) ) ( not ( = ?auto_31659 ?auto_31660 ) ) ( not ( = ?auto_31659 ?auto_31661 ) ) ( not ( = ?auto_31660 ?auto_31661 ) ) ( ON ?auto_31661 ?auto_31662 ) ( not ( = ?auto_31658 ?auto_31662 ) ) ( not ( = ?auto_31659 ?auto_31662 ) ) ( not ( = ?auto_31660 ?auto_31662 ) ) ( not ( = ?auto_31661 ?auto_31662 ) ) ( CLEAR ?auto_31659 ) ( ON ?auto_31660 ?auto_31661 ) ( CLEAR ?auto_31660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31662 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31662 ?auto_31661 )
      ( MAKE-4PILE ?auto_31658 ?auto_31659 ?auto_31660 ?auto_31661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31663 - BLOCK
      ?auto_31664 - BLOCK
      ?auto_31665 - BLOCK
      ?auto_31666 - BLOCK
    )
    :vars
    (
      ?auto_31667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31663 ) ( not ( = ?auto_31663 ?auto_31664 ) ) ( not ( = ?auto_31663 ?auto_31665 ) ) ( not ( = ?auto_31663 ?auto_31666 ) ) ( not ( = ?auto_31664 ?auto_31665 ) ) ( not ( = ?auto_31664 ?auto_31666 ) ) ( not ( = ?auto_31665 ?auto_31666 ) ) ( ON ?auto_31666 ?auto_31667 ) ( not ( = ?auto_31663 ?auto_31667 ) ) ( not ( = ?auto_31664 ?auto_31667 ) ) ( not ( = ?auto_31665 ?auto_31667 ) ) ( not ( = ?auto_31666 ?auto_31667 ) ) ( ON ?auto_31665 ?auto_31666 ) ( CLEAR ?auto_31665 ) ( ON-TABLE ?auto_31667 ) ( HOLDING ?auto_31664 ) ( CLEAR ?auto_31663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31663 ?auto_31664 )
      ( MAKE-4PILE ?auto_31663 ?auto_31664 ?auto_31665 ?auto_31666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31668 - BLOCK
      ?auto_31669 - BLOCK
      ?auto_31670 - BLOCK
      ?auto_31671 - BLOCK
    )
    :vars
    (
      ?auto_31672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31668 ) ( not ( = ?auto_31668 ?auto_31669 ) ) ( not ( = ?auto_31668 ?auto_31670 ) ) ( not ( = ?auto_31668 ?auto_31671 ) ) ( not ( = ?auto_31669 ?auto_31670 ) ) ( not ( = ?auto_31669 ?auto_31671 ) ) ( not ( = ?auto_31670 ?auto_31671 ) ) ( ON ?auto_31671 ?auto_31672 ) ( not ( = ?auto_31668 ?auto_31672 ) ) ( not ( = ?auto_31669 ?auto_31672 ) ) ( not ( = ?auto_31670 ?auto_31672 ) ) ( not ( = ?auto_31671 ?auto_31672 ) ) ( ON ?auto_31670 ?auto_31671 ) ( ON-TABLE ?auto_31672 ) ( CLEAR ?auto_31668 ) ( ON ?auto_31669 ?auto_31670 ) ( CLEAR ?auto_31669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31672 ?auto_31671 ?auto_31670 )
      ( MAKE-4PILE ?auto_31668 ?auto_31669 ?auto_31670 ?auto_31671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31673 - BLOCK
      ?auto_31674 - BLOCK
      ?auto_31675 - BLOCK
      ?auto_31676 - BLOCK
    )
    :vars
    (
      ?auto_31677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31673 ?auto_31674 ) ) ( not ( = ?auto_31673 ?auto_31675 ) ) ( not ( = ?auto_31673 ?auto_31676 ) ) ( not ( = ?auto_31674 ?auto_31675 ) ) ( not ( = ?auto_31674 ?auto_31676 ) ) ( not ( = ?auto_31675 ?auto_31676 ) ) ( ON ?auto_31676 ?auto_31677 ) ( not ( = ?auto_31673 ?auto_31677 ) ) ( not ( = ?auto_31674 ?auto_31677 ) ) ( not ( = ?auto_31675 ?auto_31677 ) ) ( not ( = ?auto_31676 ?auto_31677 ) ) ( ON ?auto_31675 ?auto_31676 ) ( ON-TABLE ?auto_31677 ) ( ON ?auto_31674 ?auto_31675 ) ( CLEAR ?auto_31674 ) ( HOLDING ?auto_31673 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31673 )
      ( MAKE-4PILE ?auto_31673 ?auto_31674 ?auto_31675 ?auto_31676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
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
    ( and ( not ( = ?auto_31678 ?auto_31679 ) ) ( not ( = ?auto_31678 ?auto_31680 ) ) ( not ( = ?auto_31678 ?auto_31681 ) ) ( not ( = ?auto_31679 ?auto_31680 ) ) ( not ( = ?auto_31679 ?auto_31681 ) ) ( not ( = ?auto_31680 ?auto_31681 ) ) ( ON ?auto_31681 ?auto_31682 ) ( not ( = ?auto_31678 ?auto_31682 ) ) ( not ( = ?auto_31679 ?auto_31682 ) ) ( not ( = ?auto_31680 ?auto_31682 ) ) ( not ( = ?auto_31681 ?auto_31682 ) ) ( ON ?auto_31680 ?auto_31681 ) ( ON-TABLE ?auto_31682 ) ( ON ?auto_31679 ?auto_31680 ) ( ON ?auto_31678 ?auto_31679 ) ( CLEAR ?auto_31678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31682 ?auto_31681 ?auto_31680 ?auto_31679 )
      ( MAKE-4PILE ?auto_31678 ?auto_31679 ?auto_31680 ?auto_31681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31683 - BLOCK
      ?auto_31684 - BLOCK
      ?auto_31685 - BLOCK
      ?auto_31686 - BLOCK
    )
    :vars
    (
      ?auto_31687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31683 ?auto_31684 ) ) ( not ( = ?auto_31683 ?auto_31685 ) ) ( not ( = ?auto_31683 ?auto_31686 ) ) ( not ( = ?auto_31684 ?auto_31685 ) ) ( not ( = ?auto_31684 ?auto_31686 ) ) ( not ( = ?auto_31685 ?auto_31686 ) ) ( ON ?auto_31686 ?auto_31687 ) ( not ( = ?auto_31683 ?auto_31687 ) ) ( not ( = ?auto_31684 ?auto_31687 ) ) ( not ( = ?auto_31685 ?auto_31687 ) ) ( not ( = ?auto_31686 ?auto_31687 ) ) ( ON ?auto_31685 ?auto_31686 ) ( ON-TABLE ?auto_31687 ) ( ON ?auto_31684 ?auto_31685 ) ( HOLDING ?auto_31683 ) ( CLEAR ?auto_31684 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31687 ?auto_31686 ?auto_31685 ?auto_31684 ?auto_31683 )
      ( MAKE-4PILE ?auto_31683 ?auto_31684 ?auto_31685 ?auto_31686 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31688 - BLOCK
      ?auto_31689 - BLOCK
      ?auto_31690 - BLOCK
      ?auto_31691 - BLOCK
    )
    :vars
    (
      ?auto_31692 - BLOCK
      ?auto_31693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31688 ?auto_31689 ) ) ( not ( = ?auto_31688 ?auto_31690 ) ) ( not ( = ?auto_31688 ?auto_31691 ) ) ( not ( = ?auto_31689 ?auto_31690 ) ) ( not ( = ?auto_31689 ?auto_31691 ) ) ( not ( = ?auto_31690 ?auto_31691 ) ) ( ON ?auto_31691 ?auto_31692 ) ( not ( = ?auto_31688 ?auto_31692 ) ) ( not ( = ?auto_31689 ?auto_31692 ) ) ( not ( = ?auto_31690 ?auto_31692 ) ) ( not ( = ?auto_31691 ?auto_31692 ) ) ( ON ?auto_31690 ?auto_31691 ) ( ON-TABLE ?auto_31692 ) ( ON ?auto_31689 ?auto_31690 ) ( CLEAR ?auto_31689 ) ( ON ?auto_31688 ?auto_31693 ) ( CLEAR ?auto_31688 ) ( HAND-EMPTY ) ( not ( = ?auto_31688 ?auto_31693 ) ) ( not ( = ?auto_31689 ?auto_31693 ) ) ( not ( = ?auto_31690 ?auto_31693 ) ) ( not ( = ?auto_31691 ?auto_31693 ) ) ( not ( = ?auto_31692 ?auto_31693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31688 ?auto_31693 )
      ( MAKE-4PILE ?auto_31688 ?auto_31689 ?auto_31690 ?auto_31691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31694 - BLOCK
      ?auto_31695 - BLOCK
      ?auto_31696 - BLOCK
      ?auto_31697 - BLOCK
    )
    :vars
    (
      ?auto_31699 - BLOCK
      ?auto_31698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31694 ?auto_31695 ) ) ( not ( = ?auto_31694 ?auto_31696 ) ) ( not ( = ?auto_31694 ?auto_31697 ) ) ( not ( = ?auto_31695 ?auto_31696 ) ) ( not ( = ?auto_31695 ?auto_31697 ) ) ( not ( = ?auto_31696 ?auto_31697 ) ) ( ON ?auto_31697 ?auto_31699 ) ( not ( = ?auto_31694 ?auto_31699 ) ) ( not ( = ?auto_31695 ?auto_31699 ) ) ( not ( = ?auto_31696 ?auto_31699 ) ) ( not ( = ?auto_31697 ?auto_31699 ) ) ( ON ?auto_31696 ?auto_31697 ) ( ON-TABLE ?auto_31699 ) ( ON ?auto_31694 ?auto_31698 ) ( CLEAR ?auto_31694 ) ( not ( = ?auto_31694 ?auto_31698 ) ) ( not ( = ?auto_31695 ?auto_31698 ) ) ( not ( = ?auto_31696 ?auto_31698 ) ) ( not ( = ?auto_31697 ?auto_31698 ) ) ( not ( = ?auto_31699 ?auto_31698 ) ) ( HOLDING ?auto_31695 ) ( CLEAR ?auto_31696 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31699 ?auto_31697 ?auto_31696 ?auto_31695 )
      ( MAKE-4PILE ?auto_31694 ?auto_31695 ?auto_31696 ?auto_31697 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31700 - BLOCK
      ?auto_31701 - BLOCK
      ?auto_31702 - BLOCK
      ?auto_31703 - BLOCK
    )
    :vars
    (
      ?auto_31704 - BLOCK
      ?auto_31705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31700 ?auto_31701 ) ) ( not ( = ?auto_31700 ?auto_31702 ) ) ( not ( = ?auto_31700 ?auto_31703 ) ) ( not ( = ?auto_31701 ?auto_31702 ) ) ( not ( = ?auto_31701 ?auto_31703 ) ) ( not ( = ?auto_31702 ?auto_31703 ) ) ( ON ?auto_31703 ?auto_31704 ) ( not ( = ?auto_31700 ?auto_31704 ) ) ( not ( = ?auto_31701 ?auto_31704 ) ) ( not ( = ?auto_31702 ?auto_31704 ) ) ( not ( = ?auto_31703 ?auto_31704 ) ) ( ON ?auto_31702 ?auto_31703 ) ( ON-TABLE ?auto_31704 ) ( ON ?auto_31700 ?auto_31705 ) ( not ( = ?auto_31700 ?auto_31705 ) ) ( not ( = ?auto_31701 ?auto_31705 ) ) ( not ( = ?auto_31702 ?auto_31705 ) ) ( not ( = ?auto_31703 ?auto_31705 ) ) ( not ( = ?auto_31704 ?auto_31705 ) ) ( CLEAR ?auto_31702 ) ( ON ?auto_31701 ?auto_31700 ) ( CLEAR ?auto_31701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31705 ?auto_31700 )
      ( MAKE-4PILE ?auto_31700 ?auto_31701 ?auto_31702 ?auto_31703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31706 - BLOCK
      ?auto_31707 - BLOCK
      ?auto_31708 - BLOCK
      ?auto_31709 - BLOCK
    )
    :vars
    (
      ?auto_31710 - BLOCK
      ?auto_31711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31706 ?auto_31707 ) ) ( not ( = ?auto_31706 ?auto_31708 ) ) ( not ( = ?auto_31706 ?auto_31709 ) ) ( not ( = ?auto_31707 ?auto_31708 ) ) ( not ( = ?auto_31707 ?auto_31709 ) ) ( not ( = ?auto_31708 ?auto_31709 ) ) ( ON ?auto_31709 ?auto_31710 ) ( not ( = ?auto_31706 ?auto_31710 ) ) ( not ( = ?auto_31707 ?auto_31710 ) ) ( not ( = ?auto_31708 ?auto_31710 ) ) ( not ( = ?auto_31709 ?auto_31710 ) ) ( ON-TABLE ?auto_31710 ) ( ON ?auto_31706 ?auto_31711 ) ( not ( = ?auto_31706 ?auto_31711 ) ) ( not ( = ?auto_31707 ?auto_31711 ) ) ( not ( = ?auto_31708 ?auto_31711 ) ) ( not ( = ?auto_31709 ?auto_31711 ) ) ( not ( = ?auto_31710 ?auto_31711 ) ) ( ON ?auto_31707 ?auto_31706 ) ( CLEAR ?auto_31707 ) ( ON-TABLE ?auto_31711 ) ( HOLDING ?auto_31708 ) ( CLEAR ?auto_31709 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31710 ?auto_31709 ?auto_31708 )
      ( MAKE-4PILE ?auto_31706 ?auto_31707 ?auto_31708 ?auto_31709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31712 - BLOCK
      ?auto_31713 - BLOCK
      ?auto_31714 - BLOCK
      ?auto_31715 - BLOCK
    )
    :vars
    (
      ?auto_31716 - BLOCK
      ?auto_31717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31712 ?auto_31713 ) ) ( not ( = ?auto_31712 ?auto_31714 ) ) ( not ( = ?auto_31712 ?auto_31715 ) ) ( not ( = ?auto_31713 ?auto_31714 ) ) ( not ( = ?auto_31713 ?auto_31715 ) ) ( not ( = ?auto_31714 ?auto_31715 ) ) ( ON ?auto_31715 ?auto_31716 ) ( not ( = ?auto_31712 ?auto_31716 ) ) ( not ( = ?auto_31713 ?auto_31716 ) ) ( not ( = ?auto_31714 ?auto_31716 ) ) ( not ( = ?auto_31715 ?auto_31716 ) ) ( ON-TABLE ?auto_31716 ) ( ON ?auto_31712 ?auto_31717 ) ( not ( = ?auto_31712 ?auto_31717 ) ) ( not ( = ?auto_31713 ?auto_31717 ) ) ( not ( = ?auto_31714 ?auto_31717 ) ) ( not ( = ?auto_31715 ?auto_31717 ) ) ( not ( = ?auto_31716 ?auto_31717 ) ) ( ON ?auto_31713 ?auto_31712 ) ( ON-TABLE ?auto_31717 ) ( CLEAR ?auto_31715 ) ( ON ?auto_31714 ?auto_31713 ) ( CLEAR ?auto_31714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31717 ?auto_31712 ?auto_31713 )
      ( MAKE-4PILE ?auto_31712 ?auto_31713 ?auto_31714 ?auto_31715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31718 - BLOCK
      ?auto_31719 - BLOCK
      ?auto_31720 - BLOCK
      ?auto_31721 - BLOCK
    )
    :vars
    (
      ?auto_31723 - BLOCK
      ?auto_31722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31718 ?auto_31719 ) ) ( not ( = ?auto_31718 ?auto_31720 ) ) ( not ( = ?auto_31718 ?auto_31721 ) ) ( not ( = ?auto_31719 ?auto_31720 ) ) ( not ( = ?auto_31719 ?auto_31721 ) ) ( not ( = ?auto_31720 ?auto_31721 ) ) ( not ( = ?auto_31718 ?auto_31723 ) ) ( not ( = ?auto_31719 ?auto_31723 ) ) ( not ( = ?auto_31720 ?auto_31723 ) ) ( not ( = ?auto_31721 ?auto_31723 ) ) ( ON-TABLE ?auto_31723 ) ( ON ?auto_31718 ?auto_31722 ) ( not ( = ?auto_31718 ?auto_31722 ) ) ( not ( = ?auto_31719 ?auto_31722 ) ) ( not ( = ?auto_31720 ?auto_31722 ) ) ( not ( = ?auto_31721 ?auto_31722 ) ) ( not ( = ?auto_31723 ?auto_31722 ) ) ( ON ?auto_31719 ?auto_31718 ) ( ON-TABLE ?auto_31722 ) ( ON ?auto_31720 ?auto_31719 ) ( CLEAR ?auto_31720 ) ( HOLDING ?auto_31721 ) ( CLEAR ?auto_31723 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31723 ?auto_31721 )
      ( MAKE-4PILE ?auto_31718 ?auto_31719 ?auto_31720 ?auto_31721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31724 - BLOCK
      ?auto_31725 - BLOCK
      ?auto_31726 - BLOCK
      ?auto_31727 - BLOCK
    )
    :vars
    (
      ?auto_31728 - BLOCK
      ?auto_31729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31724 ?auto_31725 ) ) ( not ( = ?auto_31724 ?auto_31726 ) ) ( not ( = ?auto_31724 ?auto_31727 ) ) ( not ( = ?auto_31725 ?auto_31726 ) ) ( not ( = ?auto_31725 ?auto_31727 ) ) ( not ( = ?auto_31726 ?auto_31727 ) ) ( not ( = ?auto_31724 ?auto_31728 ) ) ( not ( = ?auto_31725 ?auto_31728 ) ) ( not ( = ?auto_31726 ?auto_31728 ) ) ( not ( = ?auto_31727 ?auto_31728 ) ) ( ON-TABLE ?auto_31728 ) ( ON ?auto_31724 ?auto_31729 ) ( not ( = ?auto_31724 ?auto_31729 ) ) ( not ( = ?auto_31725 ?auto_31729 ) ) ( not ( = ?auto_31726 ?auto_31729 ) ) ( not ( = ?auto_31727 ?auto_31729 ) ) ( not ( = ?auto_31728 ?auto_31729 ) ) ( ON ?auto_31725 ?auto_31724 ) ( ON-TABLE ?auto_31729 ) ( ON ?auto_31726 ?auto_31725 ) ( CLEAR ?auto_31728 ) ( ON ?auto_31727 ?auto_31726 ) ( CLEAR ?auto_31727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31729 ?auto_31724 ?auto_31725 ?auto_31726 )
      ( MAKE-4PILE ?auto_31724 ?auto_31725 ?auto_31726 ?auto_31727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31730 - BLOCK
      ?auto_31731 - BLOCK
      ?auto_31732 - BLOCK
      ?auto_31733 - BLOCK
    )
    :vars
    (
      ?auto_31734 - BLOCK
      ?auto_31735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31730 ?auto_31731 ) ) ( not ( = ?auto_31730 ?auto_31732 ) ) ( not ( = ?auto_31730 ?auto_31733 ) ) ( not ( = ?auto_31731 ?auto_31732 ) ) ( not ( = ?auto_31731 ?auto_31733 ) ) ( not ( = ?auto_31732 ?auto_31733 ) ) ( not ( = ?auto_31730 ?auto_31734 ) ) ( not ( = ?auto_31731 ?auto_31734 ) ) ( not ( = ?auto_31732 ?auto_31734 ) ) ( not ( = ?auto_31733 ?auto_31734 ) ) ( ON ?auto_31730 ?auto_31735 ) ( not ( = ?auto_31730 ?auto_31735 ) ) ( not ( = ?auto_31731 ?auto_31735 ) ) ( not ( = ?auto_31732 ?auto_31735 ) ) ( not ( = ?auto_31733 ?auto_31735 ) ) ( not ( = ?auto_31734 ?auto_31735 ) ) ( ON ?auto_31731 ?auto_31730 ) ( ON-TABLE ?auto_31735 ) ( ON ?auto_31732 ?auto_31731 ) ( ON ?auto_31733 ?auto_31732 ) ( CLEAR ?auto_31733 ) ( HOLDING ?auto_31734 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31734 )
      ( MAKE-4PILE ?auto_31730 ?auto_31731 ?auto_31732 ?auto_31733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31736 - BLOCK
      ?auto_31737 - BLOCK
      ?auto_31738 - BLOCK
      ?auto_31739 - BLOCK
    )
    :vars
    (
      ?auto_31740 - BLOCK
      ?auto_31741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31736 ?auto_31737 ) ) ( not ( = ?auto_31736 ?auto_31738 ) ) ( not ( = ?auto_31736 ?auto_31739 ) ) ( not ( = ?auto_31737 ?auto_31738 ) ) ( not ( = ?auto_31737 ?auto_31739 ) ) ( not ( = ?auto_31738 ?auto_31739 ) ) ( not ( = ?auto_31736 ?auto_31740 ) ) ( not ( = ?auto_31737 ?auto_31740 ) ) ( not ( = ?auto_31738 ?auto_31740 ) ) ( not ( = ?auto_31739 ?auto_31740 ) ) ( ON ?auto_31736 ?auto_31741 ) ( not ( = ?auto_31736 ?auto_31741 ) ) ( not ( = ?auto_31737 ?auto_31741 ) ) ( not ( = ?auto_31738 ?auto_31741 ) ) ( not ( = ?auto_31739 ?auto_31741 ) ) ( not ( = ?auto_31740 ?auto_31741 ) ) ( ON ?auto_31737 ?auto_31736 ) ( ON-TABLE ?auto_31741 ) ( ON ?auto_31738 ?auto_31737 ) ( ON ?auto_31739 ?auto_31738 ) ( ON ?auto_31740 ?auto_31739 ) ( CLEAR ?auto_31740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31741 ?auto_31736 ?auto_31737 ?auto_31738 ?auto_31739 )
      ( MAKE-4PILE ?auto_31736 ?auto_31737 ?auto_31738 ?auto_31739 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31747 - BLOCK
      ?auto_31748 - BLOCK
      ?auto_31749 - BLOCK
      ?auto_31750 - BLOCK
      ?auto_31751 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31751 ) ( CLEAR ?auto_31750 ) ( ON-TABLE ?auto_31747 ) ( ON ?auto_31748 ?auto_31747 ) ( ON ?auto_31749 ?auto_31748 ) ( ON ?auto_31750 ?auto_31749 ) ( not ( = ?auto_31747 ?auto_31748 ) ) ( not ( = ?auto_31747 ?auto_31749 ) ) ( not ( = ?auto_31747 ?auto_31750 ) ) ( not ( = ?auto_31747 ?auto_31751 ) ) ( not ( = ?auto_31748 ?auto_31749 ) ) ( not ( = ?auto_31748 ?auto_31750 ) ) ( not ( = ?auto_31748 ?auto_31751 ) ) ( not ( = ?auto_31749 ?auto_31750 ) ) ( not ( = ?auto_31749 ?auto_31751 ) ) ( not ( = ?auto_31750 ?auto_31751 ) ) )
    :subtasks
    ( ( !STACK ?auto_31751 ?auto_31750 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31752 - BLOCK
      ?auto_31753 - BLOCK
      ?auto_31754 - BLOCK
      ?auto_31755 - BLOCK
      ?auto_31756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31755 ) ( ON-TABLE ?auto_31752 ) ( ON ?auto_31753 ?auto_31752 ) ( ON ?auto_31754 ?auto_31753 ) ( ON ?auto_31755 ?auto_31754 ) ( not ( = ?auto_31752 ?auto_31753 ) ) ( not ( = ?auto_31752 ?auto_31754 ) ) ( not ( = ?auto_31752 ?auto_31755 ) ) ( not ( = ?auto_31752 ?auto_31756 ) ) ( not ( = ?auto_31753 ?auto_31754 ) ) ( not ( = ?auto_31753 ?auto_31755 ) ) ( not ( = ?auto_31753 ?auto_31756 ) ) ( not ( = ?auto_31754 ?auto_31755 ) ) ( not ( = ?auto_31754 ?auto_31756 ) ) ( not ( = ?auto_31755 ?auto_31756 ) ) ( ON-TABLE ?auto_31756 ) ( CLEAR ?auto_31756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_31756 )
      ( MAKE-5PILE ?auto_31752 ?auto_31753 ?auto_31754 ?auto_31755 ?auto_31756 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31757 - BLOCK
      ?auto_31758 - BLOCK
      ?auto_31759 - BLOCK
      ?auto_31760 - BLOCK
      ?auto_31761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31757 ) ( ON ?auto_31758 ?auto_31757 ) ( ON ?auto_31759 ?auto_31758 ) ( not ( = ?auto_31757 ?auto_31758 ) ) ( not ( = ?auto_31757 ?auto_31759 ) ) ( not ( = ?auto_31757 ?auto_31760 ) ) ( not ( = ?auto_31757 ?auto_31761 ) ) ( not ( = ?auto_31758 ?auto_31759 ) ) ( not ( = ?auto_31758 ?auto_31760 ) ) ( not ( = ?auto_31758 ?auto_31761 ) ) ( not ( = ?auto_31759 ?auto_31760 ) ) ( not ( = ?auto_31759 ?auto_31761 ) ) ( not ( = ?auto_31760 ?auto_31761 ) ) ( ON-TABLE ?auto_31761 ) ( CLEAR ?auto_31761 ) ( HOLDING ?auto_31760 ) ( CLEAR ?auto_31759 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31757 ?auto_31758 ?auto_31759 ?auto_31760 )
      ( MAKE-5PILE ?auto_31757 ?auto_31758 ?auto_31759 ?auto_31760 ?auto_31761 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31762 - BLOCK
      ?auto_31763 - BLOCK
      ?auto_31764 - BLOCK
      ?auto_31765 - BLOCK
      ?auto_31766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31762 ) ( ON ?auto_31763 ?auto_31762 ) ( ON ?auto_31764 ?auto_31763 ) ( not ( = ?auto_31762 ?auto_31763 ) ) ( not ( = ?auto_31762 ?auto_31764 ) ) ( not ( = ?auto_31762 ?auto_31765 ) ) ( not ( = ?auto_31762 ?auto_31766 ) ) ( not ( = ?auto_31763 ?auto_31764 ) ) ( not ( = ?auto_31763 ?auto_31765 ) ) ( not ( = ?auto_31763 ?auto_31766 ) ) ( not ( = ?auto_31764 ?auto_31765 ) ) ( not ( = ?auto_31764 ?auto_31766 ) ) ( not ( = ?auto_31765 ?auto_31766 ) ) ( ON-TABLE ?auto_31766 ) ( CLEAR ?auto_31764 ) ( ON ?auto_31765 ?auto_31766 ) ( CLEAR ?auto_31765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31766 )
      ( MAKE-5PILE ?auto_31762 ?auto_31763 ?auto_31764 ?auto_31765 ?auto_31766 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31767 - BLOCK
      ?auto_31768 - BLOCK
      ?auto_31769 - BLOCK
      ?auto_31770 - BLOCK
      ?auto_31771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31767 ) ( ON ?auto_31768 ?auto_31767 ) ( not ( = ?auto_31767 ?auto_31768 ) ) ( not ( = ?auto_31767 ?auto_31769 ) ) ( not ( = ?auto_31767 ?auto_31770 ) ) ( not ( = ?auto_31767 ?auto_31771 ) ) ( not ( = ?auto_31768 ?auto_31769 ) ) ( not ( = ?auto_31768 ?auto_31770 ) ) ( not ( = ?auto_31768 ?auto_31771 ) ) ( not ( = ?auto_31769 ?auto_31770 ) ) ( not ( = ?auto_31769 ?auto_31771 ) ) ( not ( = ?auto_31770 ?auto_31771 ) ) ( ON-TABLE ?auto_31771 ) ( ON ?auto_31770 ?auto_31771 ) ( CLEAR ?auto_31770 ) ( HOLDING ?auto_31769 ) ( CLEAR ?auto_31768 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31767 ?auto_31768 ?auto_31769 )
      ( MAKE-5PILE ?auto_31767 ?auto_31768 ?auto_31769 ?auto_31770 ?auto_31771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31772 - BLOCK
      ?auto_31773 - BLOCK
      ?auto_31774 - BLOCK
      ?auto_31775 - BLOCK
      ?auto_31776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31772 ) ( ON ?auto_31773 ?auto_31772 ) ( not ( = ?auto_31772 ?auto_31773 ) ) ( not ( = ?auto_31772 ?auto_31774 ) ) ( not ( = ?auto_31772 ?auto_31775 ) ) ( not ( = ?auto_31772 ?auto_31776 ) ) ( not ( = ?auto_31773 ?auto_31774 ) ) ( not ( = ?auto_31773 ?auto_31775 ) ) ( not ( = ?auto_31773 ?auto_31776 ) ) ( not ( = ?auto_31774 ?auto_31775 ) ) ( not ( = ?auto_31774 ?auto_31776 ) ) ( not ( = ?auto_31775 ?auto_31776 ) ) ( ON-TABLE ?auto_31776 ) ( ON ?auto_31775 ?auto_31776 ) ( CLEAR ?auto_31773 ) ( ON ?auto_31774 ?auto_31775 ) ( CLEAR ?auto_31774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31776 ?auto_31775 )
      ( MAKE-5PILE ?auto_31772 ?auto_31773 ?auto_31774 ?auto_31775 ?auto_31776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31777 - BLOCK
      ?auto_31778 - BLOCK
      ?auto_31779 - BLOCK
      ?auto_31780 - BLOCK
      ?auto_31781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31777 ) ( not ( = ?auto_31777 ?auto_31778 ) ) ( not ( = ?auto_31777 ?auto_31779 ) ) ( not ( = ?auto_31777 ?auto_31780 ) ) ( not ( = ?auto_31777 ?auto_31781 ) ) ( not ( = ?auto_31778 ?auto_31779 ) ) ( not ( = ?auto_31778 ?auto_31780 ) ) ( not ( = ?auto_31778 ?auto_31781 ) ) ( not ( = ?auto_31779 ?auto_31780 ) ) ( not ( = ?auto_31779 ?auto_31781 ) ) ( not ( = ?auto_31780 ?auto_31781 ) ) ( ON-TABLE ?auto_31781 ) ( ON ?auto_31780 ?auto_31781 ) ( ON ?auto_31779 ?auto_31780 ) ( CLEAR ?auto_31779 ) ( HOLDING ?auto_31778 ) ( CLEAR ?auto_31777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31777 ?auto_31778 )
      ( MAKE-5PILE ?auto_31777 ?auto_31778 ?auto_31779 ?auto_31780 ?auto_31781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31782 - BLOCK
      ?auto_31783 - BLOCK
      ?auto_31784 - BLOCK
      ?auto_31785 - BLOCK
      ?auto_31786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31782 ) ( not ( = ?auto_31782 ?auto_31783 ) ) ( not ( = ?auto_31782 ?auto_31784 ) ) ( not ( = ?auto_31782 ?auto_31785 ) ) ( not ( = ?auto_31782 ?auto_31786 ) ) ( not ( = ?auto_31783 ?auto_31784 ) ) ( not ( = ?auto_31783 ?auto_31785 ) ) ( not ( = ?auto_31783 ?auto_31786 ) ) ( not ( = ?auto_31784 ?auto_31785 ) ) ( not ( = ?auto_31784 ?auto_31786 ) ) ( not ( = ?auto_31785 ?auto_31786 ) ) ( ON-TABLE ?auto_31786 ) ( ON ?auto_31785 ?auto_31786 ) ( ON ?auto_31784 ?auto_31785 ) ( CLEAR ?auto_31782 ) ( ON ?auto_31783 ?auto_31784 ) ( CLEAR ?auto_31783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31786 ?auto_31785 ?auto_31784 )
      ( MAKE-5PILE ?auto_31782 ?auto_31783 ?auto_31784 ?auto_31785 ?auto_31786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31787 - BLOCK
      ?auto_31788 - BLOCK
      ?auto_31789 - BLOCK
      ?auto_31790 - BLOCK
      ?auto_31791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31787 ?auto_31788 ) ) ( not ( = ?auto_31787 ?auto_31789 ) ) ( not ( = ?auto_31787 ?auto_31790 ) ) ( not ( = ?auto_31787 ?auto_31791 ) ) ( not ( = ?auto_31788 ?auto_31789 ) ) ( not ( = ?auto_31788 ?auto_31790 ) ) ( not ( = ?auto_31788 ?auto_31791 ) ) ( not ( = ?auto_31789 ?auto_31790 ) ) ( not ( = ?auto_31789 ?auto_31791 ) ) ( not ( = ?auto_31790 ?auto_31791 ) ) ( ON-TABLE ?auto_31791 ) ( ON ?auto_31790 ?auto_31791 ) ( ON ?auto_31789 ?auto_31790 ) ( ON ?auto_31788 ?auto_31789 ) ( CLEAR ?auto_31788 ) ( HOLDING ?auto_31787 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31787 )
      ( MAKE-5PILE ?auto_31787 ?auto_31788 ?auto_31789 ?auto_31790 ?auto_31791 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31792 - BLOCK
      ?auto_31793 - BLOCK
      ?auto_31794 - BLOCK
      ?auto_31795 - BLOCK
      ?auto_31796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31792 ?auto_31793 ) ) ( not ( = ?auto_31792 ?auto_31794 ) ) ( not ( = ?auto_31792 ?auto_31795 ) ) ( not ( = ?auto_31792 ?auto_31796 ) ) ( not ( = ?auto_31793 ?auto_31794 ) ) ( not ( = ?auto_31793 ?auto_31795 ) ) ( not ( = ?auto_31793 ?auto_31796 ) ) ( not ( = ?auto_31794 ?auto_31795 ) ) ( not ( = ?auto_31794 ?auto_31796 ) ) ( not ( = ?auto_31795 ?auto_31796 ) ) ( ON-TABLE ?auto_31796 ) ( ON ?auto_31795 ?auto_31796 ) ( ON ?auto_31794 ?auto_31795 ) ( ON ?auto_31793 ?auto_31794 ) ( ON ?auto_31792 ?auto_31793 ) ( CLEAR ?auto_31792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31796 ?auto_31795 ?auto_31794 ?auto_31793 )
      ( MAKE-5PILE ?auto_31792 ?auto_31793 ?auto_31794 ?auto_31795 ?auto_31796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31797 - BLOCK
      ?auto_31798 - BLOCK
      ?auto_31799 - BLOCK
      ?auto_31800 - BLOCK
      ?auto_31801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31797 ?auto_31798 ) ) ( not ( = ?auto_31797 ?auto_31799 ) ) ( not ( = ?auto_31797 ?auto_31800 ) ) ( not ( = ?auto_31797 ?auto_31801 ) ) ( not ( = ?auto_31798 ?auto_31799 ) ) ( not ( = ?auto_31798 ?auto_31800 ) ) ( not ( = ?auto_31798 ?auto_31801 ) ) ( not ( = ?auto_31799 ?auto_31800 ) ) ( not ( = ?auto_31799 ?auto_31801 ) ) ( not ( = ?auto_31800 ?auto_31801 ) ) ( ON-TABLE ?auto_31801 ) ( ON ?auto_31800 ?auto_31801 ) ( ON ?auto_31799 ?auto_31800 ) ( ON ?auto_31798 ?auto_31799 ) ( HOLDING ?auto_31797 ) ( CLEAR ?auto_31798 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31801 ?auto_31800 ?auto_31799 ?auto_31798 ?auto_31797 )
      ( MAKE-5PILE ?auto_31797 ?auto_31798 ?auto_31799 ?auto_31800 ?auto_31801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31802 - BLOCK
      ?auto_31803 - BLOCK
      ?auto_31804 - BLOCK
      ?auto_31805 - BLOCK
      ?auto_31806 - BLOCK
    )
    :vars
    (
      ?auto_31807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31802 ?auto_31803 ) ) ( not ( = ?auto_31802 ?auto_31804 ) ) ( not ( = ?auto_31802 ?auto_31805 ) ) ( not ( = ?auto_31802 ?auto_31806 ) ) ( not ( = ?auto_31803 ?auto_31804 ) ) ( not ( = ?auto_31803 ?auto_31805 ) ) ( not ( = ?auto_31803 ?auto_31806 ) ) ( not ( = ?auto_31804 ?auto_31805 ) ) ( not ( = ?auto_31804 ?auto_31806 ) ) ( not ( = ?auto_31805 ?auto_31806 ) ) ( ON-TABLE ?auto_31806 ) ( ON ?auto_31805 ?auto_31806 ) ( ON ?auto_31804 ?auto_31805 ) ( ON ?auto_31803 ?auto_31804 ) ( CLEAR ?auto_31803 ) ( ON ?auto_31802 ?auto_31807 ) ( CLEAR ?auto_31802 ) ( HAND-EMPTY ) ( not ( = ?auto_31802 ?auto_31807 ) ) ( not ( = ?auto_31803 ?auto_31807 ) ) ( not ( = ?auto_31804 ?auto_31807 ) ) ( not ( = ?auto_31805 ?auto_31807 ) ) ( not ( = ?auto_31806 ?auto_31807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31802 ?auto_31807 )
      ( MAKE-5PILE ?auto_31802 ?auto_31803 ?auto_31804 ?auto_31805 ?auto_31806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31808 - BLOCK
      ?auto_31809 - BLOCK
      ?auto_31810 - BLOCK
      ?auto_31811 - BLOCK
      ?auto_31812 - BLOCK
    )
    :vars
    (
      ?auto_31813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31808 ?auto_31809 ) ) ( not ( = ?auto_31808 ?auto_31810 ) ) ( not ( = ?auto_31808 ?auto_31811 ) ) ( not ( = ?auto_31808 ?auto_31812 ) ) ( not ( = ?auto_31809 ?auto_31810 ) ) ( not ( = ?auto_31809 ?auto_31811 ) ) ( not ( = ?auto_31809 ?auto_31812 ) ) ( not ( = ?auto_31810 ?auto_31811 ) ) ( not ( = ?auto_31810 ?auto_31812 ) ) ( not ( = ?auto_31811 ?auto_31812 ) ) ( ON-TABLE ?auto_31812 ) ( ON ?auto_31811 ?auto_31812 ) ( ON ?auto_31810 ?auto_31811 ) ( ON ?auto_31808 ?auto_31813 ) ( CLEAR ?auto_31808 ) ( not ( = ?auto_31808 ?auto_31813 ) ) ( not ( = ?auto_31809 ?auto_31813 ) ) ( not ( = ?auto_31810 ?auto_31813 ) ) ( not ( = ?auto_31811 ?auto_31813 ) ) ( not ( = ?auto_31812 ?auto_31813 ) ) ( HOLDING ?auto_31809 ) ( CLEAR ?auto_31810 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31812 ?auto_31811 ?auto_31810 ?auto_31809 )
      ( MAKE-5PILE ?auto_31808 ?auto_31809 ?auto_31810 ?auto_31811 ?auto_31812 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31814 - BLOCK
      ?auto_31815 - BLOCK
      ?auto_31816 - BLOCK
      ?auto_31817 - BLOCK
      ?auto_31818 - BLOCK
    )
    :vars
    (
      ?auto_31819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31814 ?auto_31815 ) ) ( not ( = ?auto_31814 ?auto_31816 ) ) ( not ( = ?auto_31814 ?auto_31817 ) ) ( not ( = ?auto_31814 ?auto_31818 ) ) ( not ( = ?auto_31815 ?auto_31816 ) ) ( not ( = ?auto_31815 ?auto_31817 ) ) ( not ( = ?auto_31815 ?auto_31818 ) ) ( not ( = ?auto_31816 ?auto_31817 ) ) ( not ( = ?auto_31816 ?auto_31818 ) ) ( not ( = ?auto_31817 ?auto_31818 ) ) ( ON-TABLE ?auto_31818 ) ( ON ?auto_31817 ?auto_31818 ) ( ON ?auto_31816 ?auto_31817 ) ( ON ?auto_31814 ?auto_31819 ) ( not ( = ?auto_31814 ?auto_31819 ) ) ( not ( = ?auto_31815 ?auto_31819 ) ) ( not ( = ?auto_31816 ?auto_31819 ) ) ( not ( = ?auto_31817 ?auto_31819 ) ) ( not ( = ?auto_31818 ?auto_31819 ) ) ( CLEAR ?auto_31816 ) ( ON ?auto_31815 ?auto_31814 ) ( CLEAR ?auto_31815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31819 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31819 ?auto_31814 )
      ( MAKE-5PILE ?auto_31814 ?auto_31815 ?auto_31816 ?auto_31817 ?auto_31818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31820 - BLOCK
      ?auto_31821 - BLOCK
      ?auto_31822 - BLOCK
      ?auto_31823 - BLOCK
      ?auto_31824 - BLOCK
    )
    :vars
    (
      ?auto_31825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31820 ?auto_31821 ) ) ( not ( = ?auto_31820 ?auto_31822 ) ) ( not ( = ?auto_31820 ?auto_31823 ) ) ( not ( = ?auto_31820 ?auto_31824 ) ) ( not ( = ?auto_31821 ?auto_31822 ) ) ( not ( = ?auto_31821 ?auto_31823 ) ) ( not ( = ?auto_31821 ?auto_31824 ) ) ( not ( = ?auto_31822 ?auto_31823 ) ) ( not ( = ?auto_31822 ?auto_31824 ) ) ( not ( = ?auto_31823 ?auto_31824 ) ) ( ON-TABLE ?auto_31824 ) ( ON ?auto_31823 ?auto_31824 ) ( ON ?auto_31820 ?auto_31825 ) ( not ( = ?auto_31820 ?auto_31825 ) ) ( not ( = ?auto_31821 ?auto_31825 ) ) ( not ( = ?auto_31822 ?auto_31825 ) ) ( not ( = ?auto_31823 ?auto_31825 ) ) ( not ( = ?auto_31824 ?auto_31825 ) ) ( ON ?auto_31821 ?auto_31820 ) ( CLEAR ?auto_31821 ) ( ON-TABLE ?auto_31825 ) ( HOLDING ?auto_31822 ) ( CLEAR ?auto_31823 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31824 ?auto_31823 ?auto_31822 )
      ( MAKE-5PILE ?auto_31820 ?auto_31821 ?auto_31822 ?auto_31823 ?auto_31824 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31826 - BLOCK
      ?auto_31827 - BLOCK
      ?auto_31828 - BLOCK
      ?auto_31829 - BLOCK
      ?auto_31830 - BLOCK
    )
    :vars
    (
      ?auto_31831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31826 ?auto_31827 ) ) ( not ( = ?auto_31826 ?auto_31828 ) ) ( not ( = ?auto_31826 ?auto_31829 ) ) ( not ( = ?auto_31826 ?auto_31830 ) ) ( not ( = ?auto_31827 ?auto_31828 ) ) ( not ( = ?auto_31827 ?auto_31829 ) ) ( not ( = ?auto_31827 ?auto_31830 ) ) ( not ( = ?auto_31828 ?auto_31829 ) ) ( not ( = ?auto_31828 ?auto_31830 ) ) ( not ( = ?auto_31829 ?auto_31830 ) ) ( ON-TABLE ?auto_31830 ) ( ON ?auto_31829 ?auto_31830 ) ( ON ?auto_31826 ?auto_31831 ) ( not ( = ?auto_31826 ?auto_31831 ) ) ( not ( = ?auto_31827 ?auto_31831 ) ) ( not ( = ?auto_31828 ?auto_31831 ) ) ( not ( = ?auto_31829 ?auto_31831 ) ) ( not ( = ?auto_31830 ?auto_31831 ) ) ( ON ?auto_31827 ?auto_31826 ) ( ON-TABLE ?auto_31831 ) ( CLEAR ?auto_31829 ) ( ON ?auto_31828 ?auto_31827 ) ( CLEAR ?auto_31828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31831 ?auto_31826 ?auto_31827 )
      ( MAKE-5PILE ?auto_31826 ?auto_31827 ?auto_31828 ?auto_31829 ?auto_31830 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31832 - BLOCK
      ?auto_31833 - BLOCK
      ?auto_31834 - BLOCK
      ?auto_31835 - BLOCK
      ?auto_31836 - BLOCK
    )
    :vars
    (
      ?auto_31837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31832 ?auto_31833 ) ) ( not ( = ?auto_31832 ?auto_31834 ) ) ( not ( = ?auto_31832 ?auto_31835 ) ) ( not ( = ?auto_31832 ?auto_31836 ) ) ( not ( = ?auto_31833 ?auto_31834 ) ) ( not ( = ?auto_31833 ?auto_31835 ) ) ( not ( = ?auto_31833 ?auto_31836 ) ) ( not ( = ?auto_31834 ?auto_31835 ) ) ( not ( = ?auto_31834 ?auto_31836 ) ) ( not ( = ?auto_31835 ?auto_31836 ) ) ( ON-TABLE ?auto_31836 ) ( ON ?auto_31832 ?auto_31837 ) ( not ( = ?auto_31832 ?auto_31837 ) ) ( not ( = ?auto_31833 ?auto_31837 ) ) ( not ( = ?auto_31834 ?auto_31837 ) ) ( not ( = ?auto_31835 ?auto_31837 ) ) ( not ( = ?auto_31836 ?auto_31837 ) ) ( ON ?auto_31833 ?auto_31832 ) ( ON-TABLE ?auto_31837 ) ( ON ?auto_31834 ?auto_31833 ) ( CLEAR ?auto_31834 ) ( HOLDING ?auto_31835 ) ( CLEAR ?auto_31836 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31836 ?auto_31835 )
      ( MAKE-5PILE ?auto_31832 ?auto_31833 ?auto_31834 ?auto_31835 ?auto_31836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31838 - BLOCK
      ?auto_31839 - BLOCK
      ?auto_31840 - BLOCK
      ?auto_31841 - BLOCK
      ?auto_31842 - BLOCK
    )
    :vars
    (
      ?auto_31843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31838 ?auto_31839 ) ) ( not ( = ?auto_31838 ?auto_31840 ) ) ( not ( = ?auto_31838 ?auto_31841 ) ) ( not ( = ?auto_31838 ?auto_31842 ) ) ( not ( = ?auto_31839 ?auto_31840 ) ) ( not ( = ?auto_31839 ?auto_31841 ) ) ( not ( = ?auto_31839 ?auto_31842 ) ) ( not ( = ?auto_31840 ?auto_31841 ) ) ( not ( = ?auto_31840 ?auto_31842 ) ) ( not ( = ?auto_31841 ?auto_31842 ) ) ( ON-TABLE ?auto_31842 ) ( ON ?auto_31838 ?auto_31843 ) ( not ( = ?auto_31838 ?auto_31843 ) ) ( not ( = ?auto_31839 ?auto_31843 ) ) ( not ( = ?auto_31840 ?auto_31843 ) ) ( not ( = ?auto_31841 ?auto_31843 ) ) ( not ( = ?auto_31842 ?auto_31843 ) ) ( ON ?auto_31839 ?auto_31838 ) ( ON-TABLE ?auto_31843 ) ( ON ?auto_31840 ?auto_31839 ) ( CLEAR ?auto_31842 ) ( ON ?auto_31841 ?auto_31840 ) ( CLEAR ?auto_31841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31843 ?auto_31838 ?auto_31839 ?auto_31840 )
      ( MAKE-5PILE ?auto_31838 ?auto_31839 ?auto_31840 ?auto_31841 ?auto_31842 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31844 - BLOCK
      ?auto_31845 - BLOCK
      ?auto_31846 - BLOCK
      ?auto_31847 - BLOCK
      ?auto_31848 - BLOCK
    )
    :vars
    (
      ?auto_31849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31844 ?auto_31845 ) ) ( not ( = ?auto_31844 ?auto_31846 ) ) ( not ( = ?auto_31844 ?auto_31847 ) ) ( not ( = ?auto_31844 ?auto_31848 ) ) ( not ( = ?auto_31845 ?auto_31846 ) ) ( not ( = ?auto_31845 ?auto_31847 ) ) ( not ( = ?auto_31845 ?auto_31848 ) ) ( not ( = ?auto_31846 ?auto_31847 ) ) ( not ( = ?auto_31846 ?auto_31848 ) ) ( not ( = ?auto_31847 ?auto_31848 ) ) ( ON ?auto_31844 ?auto_31849 ) ( not ( = ?auto_31844 ?auto_31849 ) ) ( not ( = ?auto_31845 ?auto_31849 ) ) ( not ( = ?auto_31846 ?auto_31849 ) ) ( not ( = ?auto_31847 ?auto_31849 ) ) ( not ( = ?auto_31848 ?auto_31849 ) ) ( ON ?auto_31845 ?auto_31844 ) ( ON-TABLE ?auto_31849 ) ( ON ?auto_31846 ?auto_31845 ) ( ON ?auto_31847 ?auto_31846 ) ( CLEAR ?auto_31847 ) ( HOLDING ?auto_31848 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31848 )
      ( MAKE-5PILE ?auto_31844 ?auto_31845 ?auto_31846 ?auto_31847 ?auto_31848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31850 - BLOCK
      ?auto_31851 - BLOCK
      ?auto_31852 - BLOCK
      ?auto_31853 - BLOCK
      ?auto_31854 - BLOCK
    )
    :vars
    (
      ?auto_31855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31850 ?auto_31851 ) ) ( not ( = ?auto_31850 ?auto_31852 ) ) ( not ( = ?auto_31850 ?auto_31853 ) ) ( not ( = ?auto_31850 ?auto_31854 ) ) ( not ( = ?auto_31851 ?auto_31852 ) ) ( not ( = ?auto_31851 ?auto_31853 ) ) ( not ( = ?auto_31851 ?auto_31854 ) ) ( not ( = ?auto_31852 ?auto_31853 ) ) ( not ( = ?auto_31852 ?auto_31854 ) ) ( not ( = ?auto_31853 ?auto_31854 ) ) ( ON ?auto_31850 ?auto_31855 ) ( not ( = ?auto_31850 ?auto_31855 ) ) ( not ( = ?auto_31851 ?auto_31855 ) ) ( not ( = ?auto_31852 ?auto_31855 ) ) ( not ( = ?auto_31853 ?auto_31855 ) ) ( not ( = ?auto_31854 ?auto_31855 ) ) ( ON ?auto_31851 ?auto_31850 ) ( ON-TABLE ?auto_31855 ) ( ON ?auto_31852 ?auto_31851 ) ( ON ?auto_31853 ?auto_31852 ) ( ON ?auto_31854 ?auto_31853 ) ( CLEAR ?auto_31854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31855 ?auto_31850 ?auto_31851 ?auto_31852 ?auto_31853 )
      ( MAKE-5PILE ?auto_31850 ?auto_31851 ?auto_31852 ?auto_31853 ?auto_31854 ) )
  )

)

