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
      ?auto_229785 - BLOCK
    )
    :vars
    (
      ?auto_229786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229785 ?auto_229786 ) ( CLEAR ?auto_229785 ) ( HAND-EMPTY ) ( not ( = ?auto_229785 ?auto_229786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229785 ?auto_229786 )
      ( !PUTDOWN ?auto_229785 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_229788 - BLOCK
    )
    :vars
    (
      ?auto_229789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229788 ?auto_229789 ) ( CLEAR ?auto_229788 ) ( HAND-EMPTY ) ( not ( = ?auto_229788 ?auto_229789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229788 ?auto_229789 )
      ( !PUTDOWN ?auto_229788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_229792 - BLOCK
      ?auto_229793 - BLOCK
    )
    :vars
    (
      ?auto_229794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229792 ) ( ON ?auto_229793 ?auto_229794 ) ( CLEAR ?auto_229793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229792 ) ( not ( = ?auto_229792 ?auto_229793 ) ) ( not ( = ?auto_229792 ?auto_229794 ) ) ( not ( = ?auto_229793 ?auto_229794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229793 ?auto_229794 )
      ( !STACK ?auto_229793 ?auto_229792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_229797 - BLOCK
      ?auto_229798 - BLOCK
    )
    :vars
    (
      ?auto_229799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229797 ) ( ON ?auto_229798 ?auto_229799 ) ( CLEAR ?auto_229798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229797 ) ( not ( = ?auto_229797 ?auto_229798 ) ) ( not ( = ?auto_229797 ?auto_229799 ) ) ( not ( = ?auto_229798 ?auto_229799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229798 ?auto_229799 )
      ( !STACK ?auto_229798 ?auto_229797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_229802 - BLOCK
      ?auto_229803 - BLOCK
    )
    :vars
    (
      ?auto_229804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229803 ?auto_229804 ) ( not ( = ?auto_229802 ?auto_229803 ) ) ( not ( = ?auto_229802 ?auto_229804 ) ) ( not ( = ?auto_229803 ?auto_229804 ) ) ( ON ?auto_229802 ?auto_229803 ) ( CLEAR ?auto_229802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229802 )
      ( MAKE-2PILE ?auto_229802 ?auto_229803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_229807 - BLOCK
      ?auto_229808 - BLOCK
    )
    :vars
    (
      ?auto_229809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229808 ?auto_229809 ) ( not ( = ?auto_229807 ?auto_229808 ) ) ( not ( = ?auto_229807 ?auto_229809 ) ) ( not ( = ?auto_229808 ?auto_229809 ) ) ( ON ?auto_229807 ?auto_229808 ) ( CLEAR ?auto_229807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229807 )
      ( MAKE-2PILE ?auto_229807 ?auto_229808 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_229813 - BLOCK
      ?auto_229814 - BLOCK
      ?auto_229815 - BLOCK
    )
    :vars
    (
      ?auto_229816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229814 ) ( ON ?auto_229815 ?auto_229816 ) ( CLEAR ?auto_229815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229813 ) ( ON ?auto_229814 ?auto_229813 ) ( not ( = ?auto_229813 ?auto_229814 ) ) ( not ( = ?auto_229813 ?auto_229815 ) ) ( not ( = ?auto_229813 ?auto_229816 ) ) ( not ( = ?auto_229814 ?auto_229815 ) ) ( not ( = ?auto_229814 ?auto_229816 ) ) ( not ( = ?auto_229815 ?auto_229816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229815 ?auto_229816 )
      ( !STACK ?auto_229815 ?auto_229814 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_229820 - BLOCK
      ?auto_229821 - BLOCK
      ?auto_229822 - BLOCK
    )
    :vars
    (
      ?auto_229823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229821 ) ( ON ?auto_229822 ?auto_229823 ) ( CLEAR ?auto_229822 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229820 ) ( ON ?auto_229821 ?auto_229820 ) ( not ( = ?auto_229820 ?auto_229821 ) ) ( not ( = ?auto_229820 ?auto_229822 ) ) ( not ( = ?auto_229820 ?auto_229823 ) ) ( not ( = ?auto_229821 ?auto_229822 ) ) ( not ( = ?auto_229821 ?auto_229823 ) ) ( not ( = ?auto_229822 ?auto_229823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229822 ?auto_229823 )
      ( !STACK ?auto_229822 ?auto_229821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_229827 - BLOCK
      ?auto_229828 - BLOCK
      ?auto_229829 - BLOCK
    )
    :vars
    (
      ?auto_229830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229829 ?auto_229830 ) ( ON-TABLE ?auto_229827 ) ( not ( = ?auto_229827 ?auto_229828 ) ) ( not ( = ?auto_229827 ?auto_229829 ) ) ( not ( = ?auto_229827 ?auto_229830 ) ) ( not ( = ?auto_229828 ?auto_229829 ) ) ( not ( = ?auto_229828 ?auto_229830 ) ) ( not ( = ?auto_229829 ?auto_229830 ) ) ( CLEAR ?auto_229827 ) ( ON ?auto_229828 ?auto_229829 ) ( CLEAR ?auto_229828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229827 ?auto_229828 )
      ( MAKE-3PILE ?auto_229827 ?auto_229828 ?auto_229829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_229834 - BLOCK
      ?auto_229835 - BLOCK
      ?auto_229836 - BLOCK
    )
    :vars
    (
      ?auto_229837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229836 ?auto_229837 ) ( ON-TABLE ?auto_229834 ) ( not ( = ?auto_229834 ?auto_229835 ) ) ( not ( = ?auto_229834 ?auto_229836 ) ) ( not ( = ?auto_229834 ?auto_229837 ) ) ( not ( = ?auto_229835 ?auto_229836 ) ) ( not ( = ?auto_229835 ?auto_229837 ) ) ( not ( = ?auto_229836 ?auto_229837 ) ) ( CLEAR ?auto_229834 ) ( ON ?auto_229835 ?auto_229836 ) ( CLEAR ?auto_229835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229834 ?auto_229835 )
      ( MAKE-3PILE ?auto_229834 ?auto_229835 ?auto_229836 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_229841 - BLOCK
      ?auto_229842 - BLOCK
      ?auto_229843 - BLOCK
    )
    :vars
    (
      ?auto_229844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229843 ?auto_229844 ) ( not ( = ?auto_229841 ?auto_229842 ) ) ( not ( = ?auto_229841 ?auto_229843 ) ) ( not ( = ?auto_229841 ?auto_229844 ) ) ( not ( = ?auto_229842 ?auto_229843 ) ) ( not ( = ?auto_229842 ?auto_229844 ) ) ( not ( = ?auto_229843 ?auto_229844 ) ) ( ON ?auto_229842 ?auto_229843 ) ( ON ?auto_229841 ?auto_229842 ) ( CLEAR ?auto_229841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229841 )
      ( MAKE-3PILE ?auto_229841 ?auto_229842 ?auto_229843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_229848 - BLOCK
      ?auto_229849 - BLOCK
      ?auto_229850 - BLOCK
    )
    :vars
    (
      ?auto_229851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229850 ?auto_229851 ) ( not ( = ?auto_229848 ?auto_229849 ) ) ( not ( = ?auto_229848 ?auto_229850 ) ) ( not ( = ?auto_229848 ?auto_229851 ) ) ( not ( = ?auto_229849 ?auto_229850 ) ) ( not ( = ?auto_229849 ?auto_229851 ) ) ( not ( = ?auto_229850 ?auto_229851 ) ) ( ON ?auto_229849 ?auto_229850 ) ( ON ?auto_229848 ?auto_229849 ) ( CLEAR ?auto_229848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229848 )
      ( MAKE-3PILE ?auto_229848 ?auto_229849 ?auto_229850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229856 - BLOCK
      ?auto_229857 - BLOCK
      ?auto_229858 - BLOCK
      ?auto_229859 - BLOCK
    )
    :vars
    (
      ?auto_229860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229858 ) ( ON ?auto_229859 ?auto_229860 ) ( CLEAR ?auto_229859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229856 ) ( ON ?auto_229857 ?auto_229856 ) ( ON ?auto_229858 ?auto_229857 ) ( not ( = ?auto_229856 ?auto_229857 ) ) ( not ( = ?auto_229856 ?auto_229858 ) ) ( not ( = ?auto_229856 ?auto_229859 ) ) ( not ( = ?auto_229856 ?auto_229860 ) ) ( not ( = ?auto_229857 ?auto_229858 ) ) ( not ( = ?auto_229857 ?auto_229859 ) ) ( not ( = ?auto_229857 ?auto_229860 ) ) ( not ( = ?auto_229858 ?auto_229859 ) ) ( not ( = ?auto_229858 ?auto_229860 ) ) ( not ( = ?auto_229859 ?auto_229860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229859 ?auto_229860 )
      ( !STACK ?auto_229859 ?auto_229858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229865 - BLOCK
      ?auto_229866 - BLOCK
      ?auto_229867 - BLOCK
      ?auto_229868 - BLOCK
    )
    :vars
    (
      ?auto_229869 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229867 ) ( ON ?auto_229868 ?auto_229869 ) ( CLEAR ?auto_229868 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229865 ) ( ON ?auto_229866 ?auto_229865 ) ( ON ?auto_229867 ?auto_229866 ) ( not ( = ?auto_229865 ?auto_229866 ) ) ( not ( = ?auto_229865 ?auto_229867 ) ) ( not ( = ?auto_229865 ?auto_229868 ) ) ( not ( = ?auto_229865 ?auto_229869 ) ) ( not ( = ?auto_229866 ?auto_229867 ) ) ( not ( = ?auto_229866 ?auto_229868 ) ) ( not ( = ?auto_229866 ?auto_229869 ) ) ( not ( = ?auto_229867 ?auto_229868 ) ) ( not ( = ?auto_229867 ?auto_229869 ) ) ( not ( = ?auto_229868 ?auto_229869 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229868 ?auto_229869 )
      ( !STACK ?auto_229868 ?auto_229867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229874 - BLOCK
      ?auto_229875 - BLOCK
      ?auto_229876 - BLOCK
      ?auto_229877 - BLOCK
    )
    :vars
    (
      ?auto_229878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229877 ?auto_229878 ) ( ON-TABLE ?auto_229874 ) ( ON ?auto_229875 ?auto_229874 ) ( not ( = ?auto_229874 ?auto_229875 ) ) ( not ( = ?auto_229874 ?auto_229876 ) ) ( not ( = ?auto_229874 ?auto_229877 ) ) ( not ( = ?auto_229874 ?auto_229878 ) ) ( not ( = ?auto_229875 ?auto_229876 ) ) ( not ( = ?auto_229875 ?auto_229877 ) ) ( not ( = ?auto_229875 ?auto_229878 ) ) ( not ( = ?auto_229876 ?auto_229877 ) ) ( not ( = ?auto_229876 ?auto_229878 ) ) ( not ( = ?auto_229877 ?auto_229878 ) ) ( CLEAR ?auto_229875 ) ( ON ?auto_229876 ?auto_229877 ) ( CLEAR ?auto_229876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_229874 ?auto_229875 ?auto_229876 )
      ( MAKE-4PILE ?auto_229874 ?auto_229875 ?auto_229876 ?auto_229877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229883 - BLOCK
      ?auto_229884 - BLOCK
      ?auto_229885 - BLOCK
      ?auto_229886 - BLOCK
    )
    :vars
    (
      ?auto_229887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229886 ?auto_229887 ) ( ON-TABLE ?auto_229883 ) ( ON ?auto_229884 ?auto_229883 ) ( not ( = ?auto_229883 ?auto_229884 ) ) ( not ( = ?auto_229883 ?auto_229885 ) ) ( not ( = ?auto_229883 ?auto_229886 ) ) ( not ( = ?auto_229883 ?auto_229887 ) ) ( not ( = ?auto_229884 ?auto_229885 ) ) ( not ( = ?auto_229884 ?auto_229886 ) ) ( not ( = ?auto_229884 ?auto_229887 ) ) ( not ( = ?auto_229885 ?auto_229886 ) ) ( not ( = ?auto_229885 ?auto_229887 ) ) ( not ( = ?auto_229886 ?auto_229887 ) ) ( CLEAR ?auto_229884 ) ( ON ?auto_229885 ?auto_229886 ) ( CLEAR ?auto_229885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_229883 ?auto_229884 ?auto_229885 )
      ( MAKE-4PILE ?auto_229883 ?auto_229884 ?auto_229885 ?auto_229886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229892 - BLOCK
      ?auto_229893 - BLOCK
      ?auto_229894 - BLOCK
      ?auto_229895 - BLOCK
    )
    :vars
    (
      ?auto_229896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229895 ?auto_229896 ) ( ON-TABLE ?auto_229892 ) ( not ( = ?auto_229892 ?auto_229893 ) ) ( not ( = ?auto_229892 ?auto_229894 ) ) ( not ( = ?auto_229892 ?auto_229895 ) ) ( not ( = ?auto_229892 ?auto_229896 ) ) ( not ( = ?auto_229893 ?auto_229894 ) ) ( not ( = ?auto_229893 ?auto_229895 ) ) ( not ( = ?auto_229893 ?auto_229896 ) ) ( not ( = ?auto_229894 ?auto_229895 ) ) ( not ( = ?auto_229894 ?auto_229896 ) ) ( not ( = ?auto_229895 ?auto_229896 ) ) ( ON ?auto_229894 ?auto_229895 ) ( CLEAR ?auto_229892 ) ( ON ?auto_229893 ?auto_229894 ) ( CLEAR ?auto_229893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229892 ?auto_229893 )
      ( MAKE-4PILE ?auto_229892 ?auto_229893 ?auto_229894 ?auto_229895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229901 - BLOCK
      ?auto_229902 - BLOCK
      ?auto_229903 - BLOCK
      ?auto_229904 - BLOCK
    )
    :vars
    (
      ?auto_229905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229904 ?auto_229905 ) ( ON-TABLE ?auto_229901 ) ( not ( = ?auto_229901 ?auto_229902 ) ) ( not ( = ?auto_229901 ?auto_229903 ) ) ( not ( = ?auto_229901 ?auto_229904 ) ) ( not ( = ?auto_229901 ?auto_229905 ) ) ( not ( = ?auto_229902 ?auto_229903 ) ) ( not ( = ?auto_229902 ?auto_229904 ) ) ( not ( = ?auto_229902 ?auto_229905 ) ) ( not ( = ?auto_229903 ?auto_229904 ) ) ( not ( = ?auto_229903 ?auto_229905 ) ) ( not ( = ?auto_229904 ?auto_229905 ) ) ( ON ?auto_229903 ?auto_229904 ) ( CLEAR ?auto_229901 ) ( ON ?auto_229902 ?auto_229903 ) ( CLEAR ?auto_229902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229901 ?auto_229902 )
      ( MAKE-4PILE ?auto_229901 ?auto_229902 ?auto_229903 ?auto_229904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229910 - BLOCK
      ?auto_229911 - BLOCK
      ?auto_229912 - BLOCK
      ?auto_229913 - BLOCK
    )
    :vars
    (
      ?auto_229914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229913 ?auto_229914 ) ( not ( = ?auto_229910 ?auto_229911 ) ) ( not ( = ?auto_229910 ?auto_229912 ) ) ( not ( = ?auto_229910 ?auto_229913 ) ) ( not ( = ?auto_229910 ?auto_229914 ) ) ( not ( = ?auto_229911 ?auto_229912 ) ) ( not ( = ?auto_229911 ?auto_229913 ) ) ( not ( = ?auto_229911 ?auto_229914 ) ) ( not ( = ?auto_229912 ?auto_229913 ) ) ( not ( = ?auto_229912 ?auto_229914 ) ) ( not ( = ?auto_229913 ?auto_229914 ) ) ( ON ?auto_229912 ?auto_229913 ) ( ON ?auto_229911 ?auto_229912 ) ( ON ?auto_229910 ?auto_229911 ) ( CLEAR ?auto_229910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229910 )
      ( MAKE-4PILE ?auto_229910 ?auto_229911 ?auto_229912 ?auto_229913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_229919 - BLOCK
      ?auto_229920 - BLOCK
      ?auto_229921 - BLOCK
      ?auto_229922 - BLOCK
    )
    :vars
    (
      ?auto_229923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229922 ?auto_229923 ) ( not ( = ?auto_229919 ?auto_229920 ) ) ( not ( = ?auto_229919 ?auto_229921 ) ) ( not ( = ?auto_229919 ?auto_229922 ) ) ( not ( = ?auto_229919 ?auto_229923 ) ) ( not ( = ?auto_229920 ?auto_229921 ) ) ( not ( = ?auto_229920 ?auto_229922 ) ) ( not ( = ?auto_229920 ?auto_229923 ) ) ( not ( = ?auto_229921 ?auto_229922 ) ) ( not ( = ?auto_229921 ?auto_229923 ) ) ( not ( = ?auto_229922 ?auto_229923 ) ) ( ON ?auto_229921 ?auto_229922 ) ( ON ?auto_229920 ?auto_229921 ) ( ON ?auto_229919 ?auto_229920 ) ( CLEAR ?auto_229919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_229919 )
      ( MAKE-4PILE ?auto_229919 ?auto_229920 ?auto_229921 ?auto_229922 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_229929 - BLOCK
      ?auto_229930 - BLOCK
      ?auto_229931 - BLOCK
      ?auto_229932 - BLOCK
      ?auto_229933 - BLOCK
    )
    :vars
    (
      ?auto_229934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229932 ) ( ON ?auto_229933 ?auto_229934 ) ( CLEAR ?auto_229933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229929 ) ( ON ?auto_229930 ?auto_229929 ) ( ON ?auto_229931 ?auto_229930 ) ( ON ?auto_229932 ?auto_229931 ) ( not ( = ?auto_229929 ?auto_229930 ) ) ( not ( = ?auto_229929 ?auto_229931 ) ) ( not ( = ?auto_229929 ?auto_229932 ) ) ( not ( = ?auto_229929 ?auto_229933 ) ) ( not ( = ?auto_229929 ?auto_229934 ) ) ( not ( = ?auto_229930 ?auto_229931 ) ) ( not ( = ?auto_229930 ?auto_229932 ) ) ( not ( = ?auto_229930 ?auto_229933 ) ) ( not ( = ?auto_229930 ?auto_229934 ) ) ( not ( = ?auto_229931 ?auto_229932 ) ) ( not ( = ?auto_229931 ?auto_229933 ) ) ( not ( = ?auto_229931 ?auto_229934 ) ) ( not ( = ?auto_229932 ?auto_229933 ) ) ( not ( = ?auto_229932 ?auto_229934 ) ) ( not ( = ?auto_229933 ?auto_229934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229933 ?auto_229934 )
      ( !STACK ?auto_229933 ?auto_229932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_229940 - BLOCK
      ?auto_229941 - BLOCK
      ?auto_229942 - BLOCK
      ?auto_229943 - BLOCK
      ?auto_229944 - BLOCK
    )
    :vars
    (
      ?auto_229945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_229943 ) ( ON ?auto_229944 ?auto_229945 ) ( CLEAR ?auto_229944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_229940 ) ( ON ?auto_229941 ?auto_229940 ) ( ON ?auto_229942 ?auto_229941 ) ( ON ?auto_229943 ?auto_229942 ) ( not ( = ?auto_229940 ?auto_229941 ) ) ( not ( = ?auto_229940 ?auto_229942 ) ) ( not ( = ?auto_229940 ?auto_229943 ) ) ( not ( = ?auto_229940 ?auto_229944 ) ) ( not ( = ?auto_229940 ?auto_229945 ) ) ( not ( = ?auto_229941 ?auto_229942 ) ) ( not ( = ?auto_229941 ?auto_229943 ) ) ( not ( = ?auto_229941 ?auto_229944 ) ) ( not ( = ?auto_229941 ?auto_229945 ) ) ( not ( = ?auto_229942 ?auto_229943 ) ) ( not ( = ?auto_229942 ?auto_229944 ) ) ( not ( = ?auto_229942 ?auto_229945 ) ) ( not ( = ?auto_229943 ?auto_229944 ) ) ( not ( = ?auto_229943 ?auto_229945 ) ) ( not ( = ?auto_229944 ?auto_229945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229944 ?auto_229945 )
      ( !STACK ?auto_229944 ?auto_229943 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_229951 - BLOCK
      ?auto_229952 - BLOCK
      ?auto_229953 - BLOCK
      ?auto_229954 - BLOCK
      ?auto_229955 - BLOCK
    )
    :vars
    (
      ?auto_229956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229955 ?auto_229956 ) ( ON-TABLE ?auto_229951 ) ( ON ?auto_229952 ?auto_229951 ) ( ON ?auto_229953 ?auto_229952 ) ( not ( = ?auto_229951 ?auto_229952 ) ) ( not ( = ?auto_229951 ?auto_229953 ) ) ( not ( = ?auto_229951 ?auto_229954 ) ) ( not ( = ?auto_229951 ?auto_229955 ) ) ( not ( = ?auto_229951 ?auto_229956 ) ) ( not ( = ?auto_229952 ?auto_229953 ) ) ( not ( = ?auto_229952 ?auto_229954 ) ) ( not ( = ?auto_229952 ?auto_229955 ) ) ( not ( = ?auto_229952 ?auto_229956 ) ) ( not ( = ?auto_229953 ?auto_229954 ) ) ( not ( = ?auto_229953 ?auto_229955 ) ) ( not ( = ?auto_229953 ?auto_229956 ) ) ( not ( = ?auto_229954 ?auto_229955 ) ) ( not ( = ?auto_229954 ?auto_229956 ) ) ( not ( = ?auto_229955 ?auto_229956 ) ) ( CLEAR ?auto_229953 ) ( ON ?auto_229954 ?auto_229955 ) ( CLEAR ?auto_229954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_229951 ?auto_229952 ?auto_229953 ?auto_229954 )
      ( MAKE-5PILE ?auto_229951 ?auto_229952 ?auto_229953 ?auto_229954 ?auto_229955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_229962 - BLOCK
      ?auto_229963 - BLOCK
      ?auto_229964 - BLOCK
      ?auto_229965 - BLOCK
      ?auto_229966 - BLOCK
    )
    :vars
    (
      ?auto_229967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229966 ?auto_229967 ) ( ON-TABLE ?auto_229962 ) ( ON ?auto_229963 ?auto_229962 ) ( ON ?auto_229964 ?auto_229963 ) ( not ( = ?auto_229962 ?auto_229963 ) ) ( not ( = ?auto_229962 ?auto_229964 ) ) ( not ( = ?auto_229962 ?auto_229965 ) ) ( not ( = ?auto_229962 ?auto_229966 ) ) ( not ( = ?auto_229962 ?auto_229967 ) ) ( not ( = ?auto_229963 ?auto_229964 ) ) ( not ( = ?auto_229963 ?auto_229965 ) ) ( not ( = ?auto_229963 ?auto_229966 ) ) ( not ( = ?auto_229963 ?auto_229967 ) ) ( not ( = ?auto_229964 ?auto_229965 ) ) ( not ( = ?auto_229964 ?auto_229966 ) ) ( not ( = ?auto_229964 ?auto_229967 ) ) ( not ( = ?auto_229965 ?auto_229966 ) ) ( not ( = ?auto_229965 ?auto_229967 ) ) ( not ( = ?auto_229966 ?auto_229967 ) ) ( CLEAR ?auto_229964 ) ( ON ?auto_229965 ?auto_229966 ) ( CLEAR ?auto_229965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_229962 ?auto_229963 ?auto_229964 ?auto_229965 )
      ( MAKE-5PILE ?auto_229962 ?auto_229963 ?auto_229964 ?auto_229965 ?auto_229966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_229973 - BLOCK
      ?auto_229974 - BLOCK
      ?auto_229975 - BLOCK
      ?auto_229976 - BLOCK
      ?auto_229977 - BLOCK
    )
    :vars
    (
      ?auto_229978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229977 ?auto_229978 ) ( ON-TABLE ?auto_229973 ) ( ON ?auto_229974 ?auto_229973 ) ( not ( = ?auto_229973 ?auto_229974 ) ) ( not ( = ?auto_229973 ?auto_229975 ) ) ( not ( = ?auto_229973 ?auto_229976 ) ) ( not ( = ?auto_229973 ?auto_229977 ) ) ( not ( = ?auto_229973 ?auto_229978 ) ) ( not ( = ?auto_229974 ?auto_229975 ) ) ( not ( = ?auto_229974 ?auto_229976 ) ) ( not ( = ?auto_229974 ?auto_229977 ) ) ( not ( = ?auto_229974 ?auto_229978 ) ) ( not ( = ?auto_229975 ?auto_229976 ) ) ( not ( = ?auto_229975 ?auto_229977 ) ) ( not ( = ?auto_229975 ?auto_229978 ) ) ( not ( = ?auto_229976 ?auto_229977 ) ) ( not ( = ?auto_229976 ?auto_229978 ) ) ( not ( = ?auto_229977 ?auto_229978 ) ) ( ON ?auto_229976 ?auto_229977 ) ( CLEAR ?auto_229974 ) ( ON ?auto_229975 ?auto_229976 ) ( CLEAR ?auto_229975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_229973 ?auto_229974 ?auto_229975 )
      ( MAKE-5PILE ?auto_229973 ?auto_229974 ?auto_229975 ?auto_229976 ?auto_229977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_229984 - BLOCK
      ?auto_229985 - BLOCK
      ?auto_229986 - BLOCK
      ?auto_229987 - BLOCK
      ?auto_229988 - BLOCK
    )
    :vars
    (
      ?auto_229989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229988 ?auto_229989 ) ( ON-TABLE ?auto_229984 ) ( ON ?auto_229985 ?auto_229984 ) ( not ( = ?auto_229984 ?auto_229985 ) ) ( not ( = ?auto_229984 ?auto_229986 ) ) ( not ( = ?auto_229984 ?auto_229987 ) ) ( not ( = ?auto_229984 ?auto_229988 ) ) ( not ( = ?auto_229984 ?auto_229989 ) ) ( not ( = ?auto_229985 ?auto_229986 ) ) ( not ( = ?auto_229985 ?auto_229987 ) ) ( not ( = ?auto_229985 ?auto_229988 ) ) ( not ( = ?auto_229985 ?auto_229989 ) ) ( not ( = ?auto_229986 ?auto_229987 ) ) ( not ( = ?auto_229986 ?auto_229988 ) ) ( not ( = ?auto_229986 ?auto_229989 ) ) ( not ( = ?auto_229987 ?auto_229988 ) ) ( not ( = ?auto_229987 ?auto_229989 ) ) ( not ( = ?auto_229988 ?auto_229989 ) ) ( ON ?auto_229987 ?auto_229988 ) ( CLEAR ?auto_229985 ) ( ON ?auto_229986 ?auto_229987 ) ( CLEAR ?auto_229986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_229984 ?auto_229985 ?auto_229986 )
      ( MAKE-5PILE ?auto_229984 ?auto_229985 ?auto_229986 ?auto_229987 ?auto_229988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_229995 - BLOCK
      ?auto_229996 - BLOCK
      ?auto_229997 - BLOCK
      ?auto_229998 - BLOCK
      ?auto_229999 - BLOCK
    )
    :vars
    (
      ?auto_230000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229999 ?auto_230000 ) ( ON-TABLE ?auto_229995 ) ( not ( = ?auto_229995 ?auto_229996 ) ) ( not ( = ?auto_229995 ?auto_229997 ) ) ( not ( = ?auto_229995 ?auto_229998 ) ) ( not ( = ?auto_229995 ?auto_229999 ) ) ( not ( = ?auto_229995 ?auto_230000 ) ) ( not ( = ?auto_229996 ?auto_229997 ) ) ( not ( = ?auto_229996 ?auto_229998 ) ) ( not ( = ?auto_229996 ?auto_229999 ) ) ( not ( = ?auto_229996 ?auto_230000 ) ) ( not ( = ?auto_229997 ?auto_229998 ) ) ( not ( = ?auto_229997 ?auto_229999 ) ) ( not ( = ?auto_229997 ?auto_230000 ) ) ( not ( = ?auto_229998 ?auto_229999 ) ) ( not ( = ?auto_229998 ?auto_230000 ) ) ( not ( = ?auto_229999 ?auto_230000 ) ) ( ON ?auto_229998 ?auto_229999 ) ( ON ?auto_229997 ?auto_229998 ) ( CLEAR ?auto_229995 ) ( ON ?auto_229996 ?auto_229997 ) ( CLEAR ?auto_229996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_229995 ?auto_229996 )
      ( MAKE-5PILE ?auto_229995 ?auto_229996 ?auto_229997 ?auto_229998 ?auto_229999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_230006 - BLOCK
      ?auto_230007 - BLOCK
      ?auto_230008 - BLOCK
      ?auto_230009 - BLOCK
      ?auto_230010 - BLOCK
    )
    :vars
    (
      ?auto_230011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230010 ?auto_230011 ) ( ON-TABLE ?auto_230006 ) ( not ( = ?auto_230006 ?auto_230007 ) ) ( not ( = ?auto_230006 ?auto_230008 ) ) ( not ( = ?auto_230006 ?auto_230009 ) ) ( not ( = ?auto_230006 ?auto_230010 ) ) ( not ( = ?auto_230006 ?auto_230011 ) ) ( not ( = ?auto_230007 ?auto_230008 ) ) ( not ( = ?auto_230007 ?auto_230009 ) ) ( not ( = ?auto_230007 ?auto_230010 ) ) ( not ( = ?auto_230007 ?auto_230011 ) ) ( not ( = ?auto_230008 ?auto_230009 ) ) ( not ( = ?auto_230008 ?auto_230010 ) ) ( not ( = ?auto_230008 ?auto_230011 ) ) ( not ( = ?auto_230009 ?auto_230010 ) ) ( not ( = ?auto_230009 ?auto_230011 ) ) ( not ( = ?auto_230010 ?auto_230011 ) ) ( ON ?auto_230009 ?auto_230010 ) ( ON ?auto_230008 ?auto_230009 ) ( CLEAR ?auto_230006 ) ( ON ?auto_230007 ?auto_230008 ) ( CLEAR ?auto_230007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230006 ?auto_230007 )
      ( MAKE-5PILE ?auto_230006 ?auto_230007 ?auto_230008 ?auto_230009 ?auto_230010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_230017 - BLOCK
      ?auto_230018 - BLOCK
      ?auto_230019 - BLOCK
      ?auto_230020 - BLOCK
      ?auto_230021 - BLOCK
    )
    :vars
    (
      ?auto_230022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230021 ?auto_230022 ) ( not ( = ?auto_230017 ?auto_230018 ) ) ( not ( = ?auto_230017 ?auto_230019 ) ) ( not ( = ?auto_230017 ?auto_230020 ) ) ( not ( = ?auto_230017 ?auto_230021 ) ) ( not ( = ?auto_230017 ?auto_230022 ) ) ( not ( = ?auto_230018 ?auto_230019 ) ) ( not ( = ?auto_230018 ?auto_230020 ) ) ( not ( = ?auto_230018 ?auto_230021 ) ) ( not ( = ?auto_230018 ?auto_230022 ) ) ( not ( = ?auto_230019 ?auto_230020 ) ) ( not ( = ?auto_230019 ?auto_230021 ) ) ( not ( = ?auto_230019 ?auto_230022 ) ) ( not ( = ?auto_230020 ?auto_230021 ) ) ( not ( = ?auto_230020 ?auto_230022 ) ) ( not ( = ?auto_230021 ?auto_230022 ) ) ( ON ?auto_230020 ?auto_230021 ) ( ON ?auto_230019 ?auto_230020 ) ( ON ?auto_230018 ?auto_230019 ) ( ON ?auto_230017 ?auto_230018 ) ( CLEAR ?auto_230017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230017 )
      ( MAKE-5PILE ?auto_230017 ?auto_230018 ?auto_230019 ?auto_230020 ?auto_230021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_230028 - BLOCK
      ?auto_230029 - BLOCK
      ?auto_230030 - BLOCK
      ?auto_230031 - BLOCK
      ?auto_230032 - BLOCK
    )
    :vars
    (
      ?auto_230033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230032 ?auto_230033 ) ( not ( = ?auto_230028 ?auto_230029 ) ) ( not ( = ?auto_230028 ?auto_230030 ) ) ( not ( = ?auto_230028 ?auto_230031 ) ) ( not ( = ?auto_230028 ?auto_230032 ) ) ( not ( = ?auto_230028 ?auto_230033 ) ) ( not ( = ?auto_230029 ?auto_230030 ) ) ( not ( = ?auto_230029 ?auto_230031 ) ) ( not ( = ?auto_230029 ?auto_230032 ) ) ( not ( = ?auto_230029 ?auto_230033 ) ) ( not ( = ?auto_230030 ?auto_230031 ) ) ( not ( = ?auto_230030 ?auto_230032 ) ) ( not ( = ?auto_230030 ?auto_230033 ) ) ( not ( = ?auto_230031 ?auto_230032 ) ) ( not ( = ?auto_230031 ?auto_230033 ) ) ( not ( = ?auto_230032 ?auto_230033 ) ) ( ON ?auto_230031 ?auto_230032 ) ( ON ?auto_230030 ?auto_230031 ) ( ON ?auto_230029 ?auto_230030 ) ( ON ?auto_230028 ?auto_230029 ) ( CLEAR ?auto_230028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230028 )
      ( MAKE-5PILE ?auto_230028 ?auto_230029 ?auto_230030 ?auto_230031 ?auto_230032 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230040 - BLOCK
      ?auto_230041 - BLOCK
      ?auto_230042 - BLOCK
      ?auto_230043 - BLOCK
      ?auto_230044 - BLOCK
      ?auto_230045 - BLOCK
    )
    :vars
    (
      ?auto_230046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230044 ) ( ON ?auto_230045 ?auto_230046 ) ( CLEAR ?auto_230045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230040 ) ( ON ?auto_230041 ?auto_230040 ) ( ON ?auto_230042 ?auto_230041 ) ( ON ?auto_230043 ?auto_230042 ) ( ON ?auto_230044 ?auto_230043 ) ( not ( = ?auto_230040 ?auto_230041 ) ) ( not ( = ?auto_230040 ?auto_230042 ) ) ( not ( = ?auto_230040 ?auto_230043 ) ) ( not ( = ?auto_230040 ?auto_230044 ) ) ( not ( = ?auto_230040 ?auto_230045 ) ) ( not ( = ?auto_230040 ?auto_230046 ) ) ( not ( = ?auto_230041 ?auto_230042 ) ) ( not ( = ?auto_230041 ?auto_230043 ) ) ( not ( = ?auto_230041 ?auto_230044 ) ) ( not ( = ?auto_230041 ?auto_230045 ) ) ( not ( = ?auto_230041 ?auto_230046 ) ) ( not ( = ?auto_230042 ?auto_230043 ) ) ( not ( = ?auto_230042 ?auto_230044 ) ) ( not ( = ?auto_230042 ?auto_230045 ) ) ( not ( = ?auto_230042 ?auto_230046 ) ) ( not ( = ?auto_230043 ?auto_230044 ) ) ( not ( = ?auto_230043 ?auto_230045 ) ) ( not ( = ?auto_230043 ?auto_230046 ) ) ( not ( = ?auto_230044 ?auto_230045 ) ) ( not ( = ?auto_230044 ?auto_230046 ) ) ( not ( = ?auto_230045 ?auto_230046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230045 ?auto_230046 )
      ( !STACK ?auto_230045 ?auto_230044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230053 - BLOCK
      ?auto_230054 - BLOCK
      ?auto_230055 - BLOCK
      ?auto_230056 - BLOCK
      ?auto_230057 - BLOCK
      ?auto_230058 - BLOCK
    )
    :vars
    (
      ?auto_230059 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230057 ) ( ON ?auto_230058 ?auto_230059 ) ( CLEAR ?auto_230058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230053 ) ( ON ?auto_230054 ?auto_230053 ) ( ON ?auto_230055 ?auto_230054 ) ( ON ?auto_230056 ?auto_230055 ) ( ON ?auto_230057 ?auto_230056 ) ( not ( = ?auto_230053 ?auto_230054 ) ) ( not ( = ?auto_230053 ?auto_230055 ) ) ( not ( = ?auto_230053 ?auto_230056 ) ) ( not ( = ?auto_230053 ?auto_230057 ) ) ( not ( = ?auto_230053 ?auto_230058 ) ) ( not ( = ?auto_230053 ?auto_230059 ) ) ( not ( = ?auto_230054 ?auto_230055 ) ) ( not ( = ?auto_230054 ?auto_230056 ) ) ( not ( = ?auto_230054 ?auto_230057 ) ) ( not ( = ?auto_230054 ?auto_230058 ) ) ( not ( = ?auto_230054 ?auto_230059 ) ) ( not ( = ?auto_230055 ?auto_230056 ) ) ( not ( = ?auto_230055 ?auto_230057 ) ) ( not ( = ?auto_230055 ?auto_230058 ) ) ( not ( = ?auto_230055 ?auto_230059 ) ) ( not ( = ?auto_230056 ?auto_230057 ) ) ( not ( = ?auto_230056 ?auto_230058 ) ) ( not ( = ?auto_230056 ?auto_230059 ) ) ( not ( = ?auto_230057 ?auto_230058 ) ) ( not ( = ?auto_230057 ?auto_230059 ) ) ( not ( = ?auto_230058 ?auto_230059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230058 ?auto_230059 )
      ( !STACK ?auto_230058 ?auto_230057 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230066 - BLOCK
      ?auto_230067 - BLOCK
      ?auto_230068 - BLOCK
      ?auto_230069 - BLOCK
      ?auto_230070 - BLOCK
      ?auto_230071 - BLOCK
    )
    :vars
    (
      ?auto_230072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230071 ?auto_230072 ) ( ON-TABLE ?auto_230066 ) ( ON ?auto_230067 ?auto_230066 ) ( ON ?auto_230068 ?auto_230067 ) ( ON ?auto_230069 ?auto_230068 ) ( not ( = ?auto_230066 ?auto_230067 ) ) ( not ( = ?auto_230066 ?auto_230068 ) ) ( not ( = ?auto_230066 ?auto_230069 ) ) ( not ( = ?auto_230066 ?auto_230070 ) ) ( not ( = ?auto_230066 ?auto_230071 ) ) ( not ( = ?auto_230066 ?auto_230072 ) ) ( not ( = ?auto_230067 ?auto_230068 ) ) ( not ( = ?auto_230067 ?auto_230069 ) ) ( not ( = ?auto_230067 ?auto_230070 ) ) ( not ( = ?auto_230067 ?auto_230071 ) ) ( not ( = ?auto_230067 ?auto_230072 ) ) ( not ( = ?auto_230068 ?auto_230069 ) ) ( not ( = ?auto_230068 ?auto_230070 ) ) ( not ( = ?auto_230068 ?auto_230071 ) ) ( not ( = ?auto_230068 ?auto_230072 ) ) ( not ( = ?auto_230069 ?auto_230070 ) ) ( not ( = ?auto_230069 ?auto_230071 ) ) ( not ( = ?auto_230069 ?auto_230072 ) ) ( not ( = ?auto_230070 ?auto_230071 ) ) ( not ( = ?auto_230070 ?auto_230072 ) ) ( not ( = ?auto_230071 ?auto_230072 ) ) ( CLEAR ?auto_230069 ) ( ON ?auto_230070 ?auto_230071 ) ( CLEAR ?auto_230070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230066 ?auto_230067 ?auto_230068 ?auto_230069 ?auto_230070 )
      ( MAKE-6PILE ?auto_230066 ?auto_230067 ?auto_230068 ?auto_230069 ?auto_230070 ?auto_230071 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230079 - BLOCK
      ?auto_230080 - BLOCK
      ?auto_230081 - BLOCK
      ?auto_230082 - BLOCK
      ?auto_230083 - BLOCK
      ?auto_230084 - BLOCK
    )
    :vars
    (
      ?auto_230085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230084 ?auto_230085 ) ( ON-TABLE ?auto_230079 ) ( ON ?auto_230080 ?auto_230079 ) ( ON ?auto_230081 ?auto_230080 ) ( ON ?auto_230082 ?auto_230081 ) ( not ( = ?auto_230079 ?auto_230080 ) ) ( not ( = ?auto_230079 ?auto_230081 ) ) ( not ( = ?auto_230079 ?auto_230082 ) ) ( not ( = ?auto_230079 ?auto_230083 ) ) ( not ( = ?auto_230079 ?auto_230084 ) ) ( not ( = ?auto_230079 ?auto_230085 ) ) ( not ( = ?auto_230080 ?auto_230081 ) ) ( not ( = ?auto_230080 ?auto_230082 ) ) ( not ( = ?auto_230080 ?auto_230083 ) ) ( not ( = ?auto_230080 ?auto_230084 ) ) ( not ( = ?auto_230080 ?auto_230085 ) ) ( not ( = ?auto_230081 ?auto_230082 ) ) ( not ( = ?auto_230081 ?auto_230083 ) ) ( not ( = ?auto_230081 ?auto_230084 ) ) ( not ( = ?auto_230081 ?auto_230085 ) ) ( not ( = ?auto_230082 ?auto_230083 ) ) ( not ( = ?auto_230082 ?auto_230084 ) ) ( not ( = ?auto_230082 ?auto_230085 ) ) ( not ( = ?auto_230083 ?auto_230084 ) ) ( not ( = ?auto_230083 ?auto_230085 ) ) ( not ( = ?auto_230084 ?auto_230085 ) ) ( CLEAR ?auto_230082 ) ( ON ?auto_230083 ?auto_230084 ) ( CLEAR ?auto_230083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230079 ?auto_230080 ?auto_230081 ?auto_230082 ?auto_230083 )
      ( MAKE-6PILE ?auto_230079 ?auto_230080 ?auto_230081 ?auto_230082 ?auto_230083 ?auto_230084 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230092 - BLOCK
      ?auto_230093 - BLOCK
      ?auto_230094 - BLOCK
      ?auto_230095 - BLOCK
      ?auto_230096 - BLOCK
      ?auto_230097 - BLOCK
    )
    :vars
    (
      ?auto_230098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230097 ?auto_230098 ) ( ON-TABLE ?auto_230092 ) ( ON ?auto_230093 ?auto_230092 ) ( ON ?auto_230094 ?auto_230093 ) ( not ( = ?auto_230092 ?auto_230093 ) ) ( not ( = ?auto_230092 ?auto_230094 ) ) ( not ( = ?auto_230092 ?auto_230095 ) ) ( not ( = ?auto_230092 ?auto_230096 ) ) ( not ( = ?auto_230092 ?auto_230097 ) ) ( not ( = ?auto_230092 ?auto_230098 ) ) ( not ( = ?auto_230093 ?auto_230094 ) ) ( not ( = ?auto_230093 ?auto_230095 ) ) ( not ( = ?auto_230093 ?auto_230096 ) ) ( not ( = ?auto_230093 ?auto_230097 ) ) ( not ( = ?auto_230093 ?auto_230098 ) ) ( not ( = ?auto_230094 ?auto_230095 ) ) ( not ( = ?auto_230094 ?auto_230096 ) ) ( not ( = ?auto_230094 ?auto_230097 ) ) ( not ( = ?auto_230094 ?auto_230098 ) ) ( not ( = ?auto_230095 ?auto_230096 ) ) ( not ( = ?auto_230095 ?auto_230097 ) ) ( not ( = ?auto_230095 ?auto_230098 ) ) ( not ( = ?auto_230096 ?auto_230097 ) ) ( not ( = ?auto_230096 ?auto_230098 ) ) ( not ( = ?auto_230097 ?auto_230098 ) ) ( ON ?auto_230096 ?auto_230097 ) ( CLEAR ?auto_230094 ) ( ON ?auto_230095 ?auto_230096 ) ( CLEAR ?auto_230095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230092 ?auto_230093 ?auto_230094 ?auto_230095 )
      ( MAKE-6PILE ?auto_230092 ?auto_230093 ?auto_230094 ?auto_230095 ?auto_230096 ?auto_230097 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230105 - BLOCK
      ?auto_230106 - BLOCK
      ?auto_230107 - BLOCK
      ?auto_230108 - BLOCK
      ?auto_230109 - BLOCK
      ?auto_230110 - BLOCK
    )
    :vars
    (
      ?auto_230111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230110 ?auto_230111 ) ( ON-TABLE ?auto_230105 ) ( ON ?auto_230106 ?auto_230105 ) ( ON ?auto_230107 ?auto_230106 ) ( not ( = ?auto_230105 ?auto_230106 ) ) ( not ( = ?auto_230105 ?auto_230107 ) ) ( not ( = ?auto_230105 ?auto_230108 ) ) ( not ( = ?auto_230105 ?auto_230109 ) ) ( not ( = ?auto_230105 ?auto_230110 ) ) ( not ( = ?auto_230105 ?auto_230111 ) ) ( not ( = ?auto_230106 ?auto_230107 ) ) ( not ( = ?auto_230106 ?auto_230108 ) ) ( not ( = ?auto_230106 ?auto_230109 ) ) ( not ( = ?auto_230106 ?auto_230110 ) ) ( not ( = ?auto_230106 ?auto_230111 ) ) ( not ( = ?auto_230107 ?auto_230108 ) ) ( not ( = ?auto_230107 ?auto_230109 ) ) ( not ( = ?auto_230107 ?auto_230110 ) ) ( not ( = ?auto_230107 ?auto_230111 ) ) ( not ( = ?auto_230108 ?auto_230109 ) ) ( not ( = ?auto_230108 ?auto_230110 ) ) ( not ( = ?auto_230108 ?auto_230111 ) ) ( not ( = ?auto_230109 ?auto_230110 ) ) ( not ( = ?auto_230109 ?auto_230111 ) ) ( not ( = ?auto_230110 ?auto_230111 ) ) ( ON ?auto_230109 ?auto_230110 ) ( CLEAR ?auto_230107 ) ( ON ?auto_230108 ?auto_230109 ) ( CLEAR ?auto_230108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230105 ?auto_230106 ?auto_230107 ?auto_230108 )
      ( MAKE-6PILE ?auto_230105 ?auto_230106 ?auto_230107 ?auto_230108 ?auto_230109 ?auto_230110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230118 - BLOCK
      ?auto_230119 - BLOCK
      ?auto_230120 - BLOCK
      ?auto_230121 - BLOCK
      ?auto_230122 - BLOCK
      ?auto_230123 - BLOCK
    )
    :vars
    (
      ?auto_230124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230123 ?auto_230124 ) ( ON-TABLE ?auto_230118 ) ( ON ?auto_230119 ?auto_230118 ) ( not ( = ?auto_230118 ?auto_230119 ) ) ( not ( = ?auto_230118 ?auto_230120 ) ) ( not ( = ?auto_230118 ?auto_230121 ) ) ( not ( = ?auto_230118 ?auto_230122 ) ) ( not ( = ?auto_230118 ?auto_230123 ) ) ( not ( = ?auto_230118 ?auto_230124 ) ) ( not ( = ?auto_230119 ?auto_230120 ) ) ( not ( = ?auto_230119 ?auto_230121 ) ) ( not ( = ?auto_230119 ?auto_230122 ) ) ( not ( = ?auto_230119 ?auto_230123 ) ) ( not ( = ?auto_230119 ?auto_230124 ) ) ( not ( = ?auto_230120 ?auto_230121 ) ) ( not ( = ?auto_230120 ?auto_230122 ) ) ( not ( = ?auto_230120 ?auto_230123 ) ) ( not ( = ?auto_230120 ?auto_230124 ) ) ( not ( = ?auto_230121 ?auto_230122 ) ) ( not ( = ?auto_230121 ?auto_230123 ) ) ( not ( = ?auto_230121 ?auto_230124 ) ) ( not ( = ?auto_230122 ?auto_230123 ) ) ( not ( = ?auto_230122 ?auto_230124 ) ) ( not ( = ?auto_230123 ?auto_230124 ) ) ( ON ?auto_230122 ?auto_230123 ) ( ON ?auto_230121 ?auto_230122 ) ( CLEAR ?auto_230119 ) ( ON ?auto_230120 ?auto_230121 ) ( CLEAR ?auto_230120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230118 ?auto_230119 ?auto_230120 )
      ( MAKE-6PILE ?auto_230118 ?auto_230119 ?auto_230120 ?auto_230121 ?auto_230122 ?auto_230123 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230131 - BLOCK
      ?auto_230132 - BLOCK
      ?auto_230133 - BLOCK
      ?auto_230134 - BLOCK
      ?auto_230135 - BLOCK
      ?auto_230136 - BLOCK
    )
    :vars
    (
      ?auto_230137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230136 ?auto_230137 ) ( ON-TABLE ?auto_230131 ) ( ON ?auto_230132 ?auto_230131 ) ( not ( = ?auto_230131 ?auto_230132 ) ) ( not ( = ?auto_230131 ?auto_230133 ) ) ( not ( = ?auto_230131 ?auto_230134 ) ) ( not ( = ?auto_230131 ?auto_230135 ) ) ( not ( = ?auto_230131 ?auto_230136 ) ) ( not ( = ?auto_230131 ?auto_230137 ) ) ( not ( = ?auto_230132 ?auto_230133 ) ) ( not ( = ?auto_230132 ?auto_230134 ) ) ( not ( = ?auto_230132 ?auto_230135 ) ) ( not ( = ?auto_230132 ?auto_230136 ) ) ( not ( = ?auto_230132 ?auto_230137 ) ) ( not ( = ?auto_230133 ?auto_230134 ) ) ( not ( = ?auto_230133 ?auto_230135 ) ) ( not ( = ?auto_230133 ?auto_230136 ) ) ( not ( = ?auto_230133 ?auto_230137 ) ) ( not ( = ?auto_230134 ?auto_230135 ) ) ( not ( = ?auto_230134 ?auto_230136 ) ) ( not ( = ?auto_230134 ?auto_230137 ) ) ( not ( = ?auto_230135 ?auto_230136 ) ) ( not ( = ?auto_230135 ?auto_230137 ) ) ( not ( = ?auto_230136 ?auto_230137 ) ) ( ON ?auto_230135 ?auto_230136 ) ( ON ?auto_230134 ?auto_230135 ) ( CLEAR ?auto_230132 ) ( ON ?auto_230133 ?auto_230134 ) ( CLEAR ?auto_230133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230131 ?auto_230132 ?auto_230133 )
      ( MAKE-6PILE ?auto_230131 ?auto_230132 ?auto_230133 ?auto_230134 ?auto_230135 ?auto_230136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230144 - BLOCK
      ?auto_230145 - BLOCK
      ?auto_230146 - BLOCK
      ?auto_230147 - BLOCK
      ?auto_230148 - BLOCK
      ?auto_230149 - BLOCK
    )
    :vars
    (
      ?auto_230150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230149 ?auto_230150 ) ( ON-TABLE ?auto_230144 ) ( not ( = ?auto_230144 ?auto_230145 ) ) ( not ( = ?auto_230144 ?auto_230146 ) ) ( not ( = ?auto_230144 ?auto_230147 ) ) ( not ( = ?auto_230144 ?auto_230148 ) ) ( not ( = ?auto_230144 ?auto_230149 ) ) ( not ( = ?auto_230144 ?auto_230150 ) ) ( not ( = ?auto_230145 ?auto_230146 ) ) ( not ( = ?auto_230145 ?auto_230147 ) ) ( not ( = ?auto_230145 ?auto_230148 ) ) ( not ( = ?auto_230145 ?auto_230149 ) ) ( not ( = ?auto_230145 ?auto_230150 ) ) ( not ( = ?auto_230146 ?auto_230147 ) ) ( not ( = ?auto_230146 ?auto_230148 ) ) ( not ( = ?auto_230146 ?auto_230149 ) ) ( not ( = ?auto_230146 ?auto_230150 ) ) ( not ( = ?auto_230147 ?auto_230148 ) ) ( not ( = ?auto_230147 ?auto_230149 ) ) ( not ( = ?auto_230147 ?auto_230150 ) ) ( not ( = ?auto_230148 ?auto_230149 ) ) ( not ( = ?auto_230148 ?auto_230150 ) ) ( not ( = ?auto_230149 ?auto_230150 ) ) ( ON ?auto_230148 ?auto_230149 ) ( ON ?auto_230147 ?auto_230148 ) ( ON ?auto_230146 ?auto_230147 ) ( CLEAR ?auto_230144 ) ( ON ?auto_230145 ?auto_230146 ) ( CLEAR ?auto_230145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230144 ?auto_230145 )
      ( MAKE-6PILE ?auto_230144 ?auto_230145 ?auto_230146 ?auto_230147 ?auto_230148 ?auto_230149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230157 - BLOCK
      ?auto_230158 - BLOCK
      ?auto_230159 - BLOCK
      ?auto_230160 - BLOCK
      ?auto_230161 - BLOCK
      ?auto_230162 - BLOCK
    )
    :vars
    (
      ?auto_230163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230162 ?auto_230163 ) ( ON-TABLE ?auto_230157 ) ( not ( = ?auto_230157 ?auto_230158 ) ) ( not ( = ?auto_230157 ?auto_230159 ) ) ( not ( = ?auto_230157 ?auto_230160 ) ) ( not ( = ?auto_230157 ?auto_230161 ) ) ( not ( = ?auto_230157 ?auto_230162 ) ) ( not ( = ?auto_230157 ?auto_230163 ) ) ( not ( = ?auto_230158 ?auto_230159 ) ) ( not ( = ?auto_230158 ?auto_230160 ) ) ( not ( = ?auto_230158 ?auto_230161 ) ) ( not ( = ?auto_230158 ?auto_230162 ) ) ( not ( = ?auto_230158 ?auto_230163 ) ) ( not ( = ?auto_230159 ?auto_230160 ) ) ( not ( = ?auto_230159 ?auto_230161 ) ) ( not ( = ?auto_230159 ?auto_230162 ) ) ( not ( = ?auto_230159 ?auto_230163 ) ) ( not ( = ?auto_230160 ?auto_230161 ) ) ( not ( = ?auto_230160 ?auto_230162 ) ) ( not ( = ?auto_230160 ?auto_230163 ) ) ( not ( = ?auto_230161 ?auto_230162 ) ) ( not ( = ?auto_230161 ?auto_230163 ) ) ( not ( = ?auto_230162 ?auto_230163 ) ) ( ON ?auto_230161 ?auto_230162 ) ( ON ?auto_230160 ?auto_230161 ) ( ON ?auto_230159 ?auto_230160 ) ( CLEAR ?auto_230157 ) ( ON ?auto_230158 ?auto_230159 ) ( CLEAR ?auto_230158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230157 ?auto_230158 )
      ( MAKE-6PILE ?auto_230157 ?auto_230158 ?auto_230159 ?auto_230160 ?auto_230161 ?auto_230162 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230170 - BLOCK
      ?auto_230171 - BLOCK
      ?auto_230172 - BLOCK
      ?auto_230173 - BLOCK
      ?auto_230174 - BLOCK
      ?auto_230175 - BLOCK
    )
    :vars
    (
      ?auto_230176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230175 ?auto_230176 ) ( not ( = ?auto_230170 ?auto_230171 ) ) ( not ( = ?auto_230170 ?auto_230172 ) ) ( not ( = ?auto_230170 ?auto_230173 ) ) ( not ( = ?auto_230170 ?auto_230174 ) ) ( not ( = ?auto_230170 ?auto_230175 ) ) ( not ( = ?auto_230170 ?auto_230176 ) ) ( not ( = ?auto_230171 ?auto_230172 ) ) ( not ( = ?auto_230171 ?auto_230173 ) ) ( not ( = ?auto_230171 ?auto_230174 ) ) ( not ( = ?auto_230171 ?auto_230175 ) ) ( not ( = ?auto_230171 ?auto_230176 ) ) ( not ( = ?auto_230172 ?auto_230173 ) ) ( not ( = ?auto_230172 ?auto_230174 ) ) ( not ( = ?auto_230172 ?auto_230175 ) ) ( not ( = ?auto_230172 ?auto_230176 ) ) ( not ( = ?auto_230173 ?auto_230174 ) ) ( not ( = ?auto_230173 ?auto_230175 ) ) ( not ( = ?auto_230173 ?auto_230176 ) ) ( not ( = ?auto_230174 ?auto_230175 ) ) ( not ( = ?auto_230174 ?auto_230176 ) ) ( not ( = ?auto_230175 ?auto_230176 ) ) ( ON ?auto_230174 ?auto_230175 ) ( ON ?auto_230173 ?auto_230174 ) ( ON ?auto_230172 ?auto_230173 ) ( ON ?auto_230171 ?auto_230172 ) ( ON ?auto_230170 ?auto_230171 ) ( CLEAR ?auto_230170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230170 )
      ( MAKE-6PILE ?auto_230170 ?auto_230171 ?auto_230172 ?auto_230173 ?auto_230174 ?auto_230175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_230183 - BLOCK
      ?auto_230184 - BLOCK
      ?auto_230185 - BLOCK
      ?auto_230186 - BLOCK
      ?auto_230187 - BLOCK
      ?auto_230188 - BLOCK
    )
    :vars
    (
      ?auto_230189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230188 ?auto_230189 ) ( not ( = ?auto_230183 ?auto_230184 ) ) ( not ( = ?auto_230183 ?auto_230185 ) ) ( not ( = ?auto_230183 ?auto_230186 ) ) ( not ( = ?auto_230183 ?auto_230187 ) ) ( not ( = ?auto_230183 ?auto_230188 ) ) ( not ( = ?auto_230183 ?auto_230189 ) ) ( not ( = ?auto_230184 ?auto_230185 ) ) ( not ( = ?auto_230184 ?auto_230186 ) ) ( not ( = ?auto_230184 ?auto_230187 ) ) ( not ( = ?auto_230184 ?auto_230188 ) ) ( not ( = ?auto_230184 ?auto_230189 ) ) ( not ( = ?auto_230185 ?auto_230186 ) ) ( not ( = ?auto_230185 ?auto_230187 ) ) ( not ( = ?auto_230185 ?auto_230188 ) ) ( not ( = ?auto_230185 ?auto_230189 ) ) ( not ( = ?auto_230186 ?auto_230187 ) ) ( not ( = ?auto_230186 ?auto_230188 ) ) ( not ( = ?auto_230186 ?auto_230189 ) ) ( not ( = ?auto_230187 ?auto_230188 ) ) ( not ( = ?auto_230187 ?auto_230189 ) ) ( not ( = ?auto_230188 ?auto_230189 ) ) ( ON ?auto_230187 ?auto_230188 ) ( ON ?auto_230186 ?auto_230187 ) ( ON ?auto_230185 ?auto_230186 ) ( ON ?auto_230184 ?auto_230185 ) ( ON ?auto_230183 ?auto_230184 ) ( CLEAR ?auto_230183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230183 )
      ( MAKE-6PILE ?auto_230183 ?auto_230184 ?auto_230185 ?auto_230186 ?auto_230187 ?auto_230188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230197 - BLOCK
      ?auto_230198 - BLOCK
      ?auto_230199 - BLOCK
      ?auto_230200 - BLOCK
      ?auto_230201 - BLOCK
      ?auto_230202 - BLOCK
      ?auto_230203 - BLOCK
    )
    :vars
    (
      ?auto_230204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230202 ) ( ON ?auto_230203 ?auto_230204 ) ( CLEAR ?auto_230203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230197 ) ( ON ?auto_230198 ?auto_230197 ) ( ON ?auto_230199 ?auto_230198 ) ( ON ?auto_230200 ?auto_230199 ) ( ON ?auto_230201 ?auto_230200 ) ( ON ?auto_230202 ?auto_230201 ) ( not ( = ?auto_230197 ?auto_230198 ) ) ( not ( = ?auto_230197 ?auto_230199 ) ) ( not ( = ?auto_230197 ?auto_230200 ) ) ( not ( = ?auto_230197 ?auto_230201 ) ) ( not ( = ?auto_230197 ?auto_230202 ) ) ( not ( = ?auto_230197 ?auto_230203 ) ) ( not ( = ?auto_230197 ?auto_230204 ) ) ( not ( = ?auto_230198 ?auto_230199 ) ) ( not ( = ?auto_230198 ?auto_230200 ) ) ( not ( = ?auto_230198 ?auto_230201 ) ) ( not ( = ?auto_230198 ?auto_230202 ) ) ( not ( = ?auto_230198 ?auto_230203 ) ) ( not ( = ?auto_230198 ?auto_230204 ) ) ( not ( = ?auto_230199 ?auto_230200 ) ) ( not ( = ?auto_230199 ?auto_230201 ) ) ( not ( = ?auto_230199 ?auto_230202 ) ) ( not ( = ?auto_230199 ?auto_230203 ) ) ( not ( = ?auto_230199 ?auto_230204 ) ) ( not ( = ?auto_230200 ?auto_230201 ) ) ( not ( = ?auto_230200 ?auto_230202 ) ) ( not ( = ?auto_230200 ?auto_230203 ) ) ( not ( = ?auto_230200 ?auto_230204 ) ) ( not ( = ?auto_230201 ?auto_230202 ) ) ( not ( = ?auto_230201 ?auto_230203 ) ) ( not ( = ?auto_230201 ?auto_230204 ) ) ( not ( = ?auto_230202 ?auto_230203 ) ) ( not ( = ?auto_230202 ?auto_230204 ) ) ( not ( = ?auto_230203 ?auto_230204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230203 ?auto_230204 )
      ( !STACK ?auto_230203 ?auto_230202 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230212 - BLOCK
      ?auto_230213 - BLOCK
      ?auto_230214 - BLOCK
      ?auto_230215 - BLOCK
      ?auto_230216 - BLOCK
      ?auto_230217 - BLOCK
      ?auto_230218 - BLOCK
    )
    :vars
    (
      ?auto_230219 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230217 ) ( ON ?auto_230218 ?auto_230219 ) ( CLEAR ?auto_230218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230212 ) ( ON ?auto_230213 ?auto_230212 ) ( ON ?auto_230214 ?auto_230213 ) ( ON ?auto_230215 ?auto_230214 ) ( ON ?auto_230216 ?auto_230215 ) ( ON ?auto_230217 ?auto_230216 ) ( not ( = ?auto_230212 ?auto_230213 ) ) ( not ( = ?auto_230212 ?auto_230214 ) ) ( not ( = ?auto_230212 ?auto_230215 ) ) ( not ( = ?auto_230212 ?auto_230216 ) ) ( not ( = ?auto_230212 ?auto_230217 ) ) ( not ( = ?auto_230212 ?auto_230218 ) ) ( not ( = ?auto_230212 ?auto_230219 ) ) ( not ( = ?auto_230213 ?auto_230214 ) ) ( not ( = ?auto_230213 ?auto_230215 ) ) ( not ( = ?auto_230213 ?auto_230216 ) ) ( not ( = ?auto_230213 ?auto_230217 ) ) ( not ( = ?auto_230213 ?auto_230218 ) ) ( not ( = ?auto_230213 ?auto_230219 ) ) ( not ( = ?auto_230214 ?auto_230215 ) ) ( not ( = ?auto_230214 ?auto_230216 ) ) ( not ( = ?auto_230214 ?auto_230217 ) ) ( not ( = ?auto_230214 ?auto_230218 ) ) ( not ( = ?auto_230214 ?auto_230219 ) ) ( not ( = ?auto_230215 ?auto_230216 ) ) ( not ( = ?auto_230215 ?auto_230217 ) ) ( not ( = ?auto_230215 ?auto_230218 ) ) ( not ( = ?auto_230215 ?auto_230219 ) ) ( not ( = ?auto_230216 ?auto_230217 ) ) ( not ( = ?auto_230216 ?auto_230218 ) ) ( not ( = ?auto_230216 ?auto_230219 ) ) ( not ( = ?auto_230217 ?auto_230218 ) ) ( not ( = ?auto_230217 ?auto_230219 ) ) ( not ( = ?auto_230218 ?auto_230219 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230218 ?auto_230219 )
      ( !STACK ?auto_230218 ?auto_230217 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230227 - BLOCK
      ?auto_230228 - BLOCK
      ?auto_230229 - BLOCK
      ?auto_230230 - BLOCK
      ?auto_230231 - BLOCK
      ?auto_230232 - BLOCK
      ?auto_230233 - BLOCK
    )
    :vars
    (
      ?auto_230234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230233 ?auto_230234 ) ( ON-TABLE ?auto_230227 ) ( ON ?auto_230228 ?auto_230227 ) ( ON ?auto_230229 ?auto_230228 ) ( ON ?auto_230230 ?auto_230229 ) ( ON ?auto_230231 ?auto_230230 ) ( not ( = ?auto_230227 ?auto_230228 ) ) ( not ( = ?auto_230227 ?auto_230229 ) ) ( not ( = ?auto_230227 ?auto_230230 ) ) ( not ( = ?auto_230227 ?auto_230231 ) ) ( not ( = ?auto_230227 ?auto_230232 ) ) ( not ( = ?auto_230227 ?auto_230233 ) ) ( not ( = ?auto_230227 ?auto_230234 ) ) ( not ( = ?auto_230228 ?auto_230229 ) ) ( not ( = ?auto_230228 ?auto_230230 ) ) ( not ( = ?auto_230228 ?auto_230231 ) ) ( not ( = ?auto_230228 ?auto_230232 ) ) ( not ( = ?auto_230228 ?auto_230233 ) ) ( not ( = ?auto_230228 ?auto_230234 ) ) ( not ( = ?auto_230229 ?auto_230230 ) ) ( not ( = ?auto_230229 ?auto_230231 ) ) ( not ( = ?auto_230229 ?auto_230232 ) ) ( not ( = ?auto_230229 ?auto_230233 ) ) ( not ( = ?auto_230229 ?auto_230234 ) ) ( not ( = ?auto_230230 ?auto_230231 ) ) ( not ( = ?auto_230230 ?auto_230232 ) ) ( not ( = ?auto_230230 ?auto_230233 ) ) ( not ( = ?auto_230230 ?auto_230234 ) ) ( not ( = ?auto_230231 ?auto_230232 ) ) ( not ( = ?auto_230231 ?auto_230233 ) ) ( not ( = ?auto_230231 ?auto_230234 ) ) ( not ( = ?auto_230232 ?auto_230233 ) ) ( not ( = ?auto_230232 ?auto_230234 ) ) ( not ( = ?auto_230233 ?auto_230234 ) ) ( CLEAR ?auto_230231 ) ( ON ?auto_230232 ?auto_230233 ) ( CLEAR ?auto_230232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_230227 ?auto_230228 ?auto_230229 ?auto_230230 ?auto_230231 ?auto_230232 )
      ( MAKE-7PILE ?auto_230227 ?auto_230228 ?auto_230229 ?auto_230230 ?auto_230231 ?auto_230232 ?auto_230233 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230242 - BLOCK
      ?auto_230243 - BLOCK
      ?auto_230244 - BLOCK
      ?auto_230245 - BLOCK
      ?auto_230246 - BLOCK
      ?auto_230247 - BLOCK
      ?auto_230248 - BLOCK
    )
    :vars
    (
      ?auto_230249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230248 ?auto_230249 ) ( ON-TABLE ?auto_230242 ) ( ON ?auto_230243 ?auto_230242 ) ( ON ?auto_230244 ?auto_230243 ) ( ON ?auto_230245 ?auto_230244 ) ( ON ?auto_230246 ?auto_230245 ) ( not ( = ?auto_230242 ?auto_230243 ) ) ( not ( = ?auto_230242 ?auto_230244 ) ) ( not ( = ?auto_230242 ?auto_230245 ) ) ( not ( = ?auto_230242 ?auto_230246 ) ) ( not ( = ?auto_230242 ?auto_230247 ) ) ( not ( = ?auto_230242 ?auto_230248 ) ) ( not ( = ?auto_230242 ?auto_230249 ) ) ( not ( = ?auto_230243 ?auto_230244 ) ) ( not ( = ?auto_230243 ?auto_230245 ) ) ( not ( = ?auto_230243 ?auto_230246 ) ) ( not ( = ?auto_230243 ?auto_230247 ) ) ( not ( = ?auto_230243 ?auto_230248 ) ) ( not ( = ?auto_230243 ?auto_230249 ) ) ( not ( = ?auto_230244 ?auto_230245 ) ) ( not ( = ?auto_230244 ?auto_230246 ) ) ( not ( = ?auto_230244 ?auto_230247 ) ) ( not ( = ?auto_230244 ?auto_230248 ) ) ( not ( = ?auto_230244 ?auto_230249 ) ) ( not ( = ?auto_230245 ?auto_230246 ) ) ( not ( = ?auto_230245 ?auto_230247 ) ) ( not ( = ?auto_230245 ?auto_230248 ) ) ( not ( = ?auto_230245 ?auto_230249 ) ) ( not ( = ?auto_230246 ?auto_230247 ) ) ( not ( = ?auto_230246 ?auto_230248 ) ) ( not ( = ?auto_230246 ?auto_230249 ) ) ( not ( = ?auto_230247 ?auto_230248 ) ) ( not ( = ?auto_230247 ?auto_230249 ) ) ( not ( = ?auto_230248 ?auto_230249 ) ) ( CLEAR ?auto_230246 ) ( ON ?auto_230247 ?auto_230248 ) ( CLEAR ?auto_230247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_230242 ?auto_230243 ?auto_230244 ?auto_230245 ?auto_230246 ?auto_230247 )
      ( MAKE-7PILE ?auto_230242 ?auto_230243 ?auto_230244 ?auto_230245 ?auto_230246 ?auto_230247 ?auto_230248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230257 - BLOCK
      ?auto_230258 - BLOCK
      ?auto_230259 - BLOCK
      ?auto_230260 - BLOCK
      ?auto_230261 - BLOCK
      ?auto_230262 - BLOCK
      ?auto_230263 - BLOCK
    )
    :vars
    (
      ?auto_230264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230263 ?auto_230264 ) ( ON-TABLE ?auto_230257 ) ( ON ?auto_230258 ?auto_230257 ) ( ON ?auto_230259 ?auto_230258 ) ( ON ?auto_230260 ?auto_230259 ) ( not ( = ?auto_230257 ?auto_230258 ) ) ( not ( = ?auto_230257 ?auto_230259 ) ) ( not ( = ?auto_230257 ?auto_230260 ) ) ( not ( = ?auto_230257 ?auto_230261 ) ) ( not ( = ?auto_230257 ?auto_230262 ) ) ( not ( = ?auto_230257 ?auto_230263 ) ) ( not ( = ?auto_230257 ?auto_230264 ) ) ( not ( = ?auto_230258 ?auto_230259 ) ) ( not ( = ?auto_230258 ?auto_230260 ) ) ( not ( = ?auto_230258 ?auto_230261 ) ) ( not ( = ?auto_230258 ?auto_230262 ) ) ( not ( = ?auto_230258 ?auto_230263 ) ) ( not ( = ?auto_230258 ?auto_230264 ) ) ( not ( = ?auto_230259 ?auto_230260 ) ) ( not ( = ?auto_230259 ?auto_230261 ) ) ( not ( = ?auto_230259 ?auto_230262 ) ) ( not ( = ?auto_230259 ?auto_230263 ) ) ( not ( = ?auto_230259 ?auto_230264 ) ) ( not ( = ?auto_230260 ?auto_230261 ) ) ( not ( = ?auto_230260 ?auto_230262 ) ) ( not ( = ?auto_230260 ?auto_230263 ) ) ( not ( = ?auto_230260 ?auto_230264 ) ) ( not ( = ?auto_230261 ?auto_230262 ) ) ( not ( = ?auto_230261 ?auto_230263 ) ) ( not ( = ?auto_230261 ?auto_230264 ) ) ( not ( = ?auto_230262 ?auto_230263 ) ) ( not ( = ?auto_230262 ?auto_230264 ) ) ( not ( = ?auto_230263 ?auto_230264 ) ) ( ON ?auto_230262 ?auto_230263 ) ( CLEAR ?auto_230260 ) ( ON ?auto_230261 ?auto_230262 ) ( CLEAR ?auto_230261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230257 ?auto_230258 ?auto_230259 ?auto_230260 ?auto_230261 )
      ( MAKE-7PILE ?auto_230257 ?auto_230258 ?auto_230259 ?auto_230260 ?auto_230261 ?auto_230262 ?auto_230263 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230272 - BLOCK
      ?auto_230273 - BLOCK
      ?auto_230274 - BLOCK
      ?auto_230275 - BLOCK
      ?auto_230276 - BLOCK
      ?auto_230277 - BLOCK
      ?auto_230278 - BLOCK
    )
    :vars
    (
      ?auto_230279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230278 ?auto_230279 ) ( ON-TABLE ?auto_230272 ) ( ON ?auto_230273 ?auto_230272 ) ( ON ?auto_230274 ?auto_230273 ) ( ON ?auto_230275 ?auto_230274 ) ( not ( = ?auto_230272 ?auto_230273 ) ) ( not ( = ?auto_230272 ?auto_230274 ) ) ( not ( = ?auto_230272 ?auto_230275 ) ) ( not ( = ?auto_230272 ?auto_230276 ) ) ( not ( = ?auto_230272 ?auto_230277 ) ) ( not ( = ?auto_230272 ?auto_230278 ) ) ( not ( = ?auto_230272 ?auto_230279 ) ) ( not ( = ?auto_230273 ?auto_230274 ) ) ( not ( = ?auto_230273 ?auto_230275 ) ) ( not ( = ?auto_230273 ?auto_230276 ) ) ( not ( = ?auto_230273 ?auto_230277 ) ) ( not ( = ?auto_230273 ?auto_230278 ) ) ( not ( = ?auto_230273 ?auto_230279 ) ) ( not ( = ?auto_230274 ?auto_230275 ) ) ( not ( = ?auto_230274 ?auto_230276 ) ) ( not ( = ?auto_230274 ?auto_230277 ) ) ( not ( = ?auto_230274 ?auto_230278 ) ) ( not ( = ?auto_230274 ?auto_230279 ) ) ( not ( = ?auto_230275 ?auto_230276 ) ) ( not ( = ?auto_230275 ?auto_230277 ) ) ( not ( = ?auto_230275 ?auto_230278 ) ) ( not ( = ?auto_230275 ?auto_230279 ) ) ( not ( = ?auto_230276 ?auto_230277 ) ) ( not ( = ?auto_230276 ?auto_230278 ) ) ( not ( = ?auto_230276 ?auto_230279 ) ) ( not ( = ?auto_230277 ?auto_230278 ) ) ( not ( = ?auto_230277 ?auto_230279 ) ) ( not ( = ?auto_230278 ?auto_230279 ) ) ( ON ?auto_230277 ?auto_230278 ) ( CLEAR ?auto_230275 ) ( ON ?auto_230276 ?auto_230277 ) ( CLEAR ?auto_230276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230272 ?auto_230273 ?auto_230274 ?auto_230275 ?auto_230276 )
      ( MAKE-7PILE ?auto_230272 ?auto_230273 ?auto_230274 ?auto_230275 ?auto_230276 ?auto_230277 ?auto_230278 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230287 - BLOCK
      ?auto_230288 - BLOCK
      ?auto_230289 - BLOCK
      ?auto_230290 - BLOCK
      ?auto_230291 - BLOCK
      ?auto_230292 - BLOCK
      ?auto_230293 - BLOCK
    )
    :vars
    (
      ?auto_230294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230293 ?auto_230294 ) ( ON-TABLE ?auto_230287 ) ( ON ?auto_230288 ?auto_230287 ) ( ON ?auto_230289 ?auto_230288 ) ( not ( = ?auto_230287 ?auto_230288 ) ) ( not ( = ?auto_230287 ?auto_230289 ) ) ( not ( = ?auto_230287 ?auto_230290 ) ) ( not ( = ?auto_230287 ?auto_230291 ) ) ( not ( = ?auto_230287 ?auto_230292 ) ) ( not ( = ?auto_230287 ?auto_230293 ) ) ( not ( = ?auto_230287 ?auto_230294 ) ) ( not ( = ?auto_230288 ?auto_230289 ) ) ( not ( = ?auto_230288 ?auto_230290 ) ) ( not ( = ?auto_230288 ?auto_230291 ) ) ( not ( = ?auto_230288 ?auto_230292 ) ) ( not ( = ?auto_230288 ?auto_230293 ) ) ( not ( = ?auto_230288 ?auto_230294 ) ) ( not ( = ?auto_230289 ?auto_230290 ) ) ( not ( = ?auto_230289 ?auto_230291 ) ) ( not ( = ?auto_230289 ?auto_230292 ) ) ( not ( = ?auto_230289 ?auto_230293 ) ) ( not ( = ?auto_230289 ?auto_230294 ) ) ( not ( = ?auto_230290 ?auto_230291 ) ) ( not ( = ?auto_230290 ?auto_230292 ) ) ( not ( = ?auto_230290 ?auto_230293 ) ) ( not ( = ?auto_230290 ?auto_230294 ) ) ( not ( = ?auto_230291 ?auto_230292 ) ) ( not ( = ?auto_230291 ?auto_230293 ) ) ( not ( = ?auto_230291 ?auto_230294 ) ) ( not ( = ?auto_230292 ?auto_230293 ) ) ( not ( = ?auto_230292 ?auto_230294 ) ) ( not ( = ?auto_230293 ?auto_230294 ) ) ( ON ?auto_230292 ?auto_230293 ) ( ON ?auto_230291 ?auto_230292 ) ( CLEAR ?auto_230289 ) ( ON ?auto_230290 ?auto_230291 ) ( CLEAR ?auto_230290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230287 ?auto_230288 ?auto_230289 ?auto_230290 )
      ( MAKE-7PILE ?auto_230287 ?auto_230288 ?auto_230289 ?auto_230290 ?auto_230291 ?auto_230292 ?auto_230293 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230302 - BLOCK
      ?auto_230303 - BLOCK
      ?auto_230304 - BLOCK
      ?auto_230305 - BLOCK
      ?auto_230306 - BLOCK
      ?auto_230307 - BLOCK
      ?auto_230308 - BLOCK
    )
    :vars
    (
      ?auto_230309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230308 ?auto_230309 ) ( ON-TABLE ?auto_230302 ) ( ON ?auto_230303 ?auto_230302 ) ( ON ?auto_230304 ?auto_230303 ) ( not ( = ?auto_230302 ?auto_230303 ) ) ( not ( = ?auto_230302 ?auto_230304 ) ) ( not ( = ?auto_230302 ?auto_230305 ) ) ( not ( = ?auto_230302 ?auto_230306 ) ) ( not ( = ?auto_230302 ?auto_230307 ) ) ( not ( = ?auto_230302 ?auto_230308 ) ) ( not ( = ?auto_230302 ?auto_230309 ) ) ( not ( = ?auto_230303 ?auto_230304 ) ) ( not ( = ?auto_230303 ?auto_230305 ) ) ( not ( = ?auto_230303 ?auto_230306 ) ) ( not ( = ?auto_230303 ?auto_230307 ) ) ( not ( = ?auto_230303 ?auto_230308 ) ) ( not ( = ?auto_230303 ?auto_230309 ) ) ( not ( = ?auto_230304 ?auto_230305 ) ) ( not ( = ?auto_230304 ?auto_230306 ) ) ( not ( = ?auto_230304 ?auto_230307 ) ) ( not ( = ?auto_230304 ?auto_230308 ) ) ( not ( = ?auto_230304 ?auto_230309 ) ) ( not ( = ?auto_230305 ?auto_230306 ) ) ( not ( = ?auto_230305 ?auto_230307 ) ) ( not ( = ?auto_230305 ?auto_230308 ) ) ( not ( = ?auto_230305 ?auto_230309 ) ) ( not ( = ?auto_230306 ?auto_230307 ) ) ( not ( = ?auto_230306 ?auto_230308 ) ) ( not ( = ?auto_230306 ?auto_230309 ) ) ( not ( = ?auto_230307 ?auto_230308 ) ) ( not ( = ?auto_230307 ?auto_230309 ) ) ( not ( = ?auto_230308 ?auto_230309 ) ) ( ON ?auto_230307 ?auto_230308 ) ( ON ?auto_230306 ?auto_230307 ) ( CLEAR ?auto_230304 ) ( ON ?auto_230305 ?auto_230306 ) ( CLEAR ?auto_230305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230302 ?auto_230303 ?auto_230304 ?auto_230305 )
      ( MAKE-7PILE ?auto_230302 ?auto_230303 ?auto_230304 ?auto_230305 ?auto_230306 ?auto_230307 ?auto_230308 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230317 - BLOCK
      ?auto_230318 - BLOCK
      ?auto_230319 - BLOCK
      ?auto_230320 - BLOCK
      ?auto_230321 - BLOCK
      ?auto_230322 - BLOCK
      ?auto_230323 - BLOCK
    )
    :vars
    (
      ?auto_230324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230323 ?auto_230324 ) ( ON-TABLE ?auto_230317 ) ( ON ?auto_230318 ?auto_230317 ) ( not ( = ?auto_230317 ?auto_230318 ) ) ( not ( = ?auto_230317 ?auto_230319 ) ) ( not ( = ?auto_230317 ?auto_230320 ) ) ( not ( = ?auto_230317 ?auto_230321 ) ) ( not ( = ?auto_230317 ?auto_230322 ) ) ( not ( = ?auto_230317 ?auto_230323 ) ) ( not ( = ?auto_230317 ?auto_230324 ) ) ( not ( = ?auto_230318 ?auto_230319 ) ) ( not ( = ?auto_230318 ?auto_230320 ) ) ( not ( = ?auto_230318 ?auto_230321 ) ) ( not ( = ?auto_230318 ?auto_230322 ) ) ( not ( = ?auto_230318 ?auto_230323 ) ) ( not ( = ?auto_230318 ?auto_230324 ) ) ( not ( = ?auto_230319 ?auto_230320 ) ) ( not ( = ?auto_230319 ?auto_230321 ) ) ( not ( = ?auto_230319 ?auto_230322 ) ) ( not ( = ?auto_230319 ?auto_230323 ) ) ( not ( = ?auto_230319 ?auto_230324 ) ) ( not ( = ?auto_230320 ?auto_230321 ) ) ( not ( = ?auto_230320 ?auto_230322 ) ) ( not ( = ?auto_230320 ?auto_230323 ) ) ( not ( = ?auto_230320 ?auto_230324 ) ) ( not ( = ?auto_230321 ?auto_230322 ) ) ( not ( = ?auto_230321 ?auto_230323 ) ) ( not ( = ?auto_230321 ?auto_230324 ) ) ( not ( = ?auto_230322 ?auto_230323 ) ) ( not ( = ?auto_230322 ?auto_230324 ) ) ( not ( = ?auto_230323 ?auto_230324 ) ) ( ON ?auto_230322 ?auto_230323 ) ( ON ?auto_230321 ?auto_230322 ) ( ON ?auto_230320 ?auto_230321 ) ( CLEAR ?auto_230318 ) ( ON ?auto_230319 ?auto_230320 ) ( CLEAR ?auto_230319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230317 ?auto_230318 ?auto_230319 )
      ( MAKE-7PILE ?auto_230317 ?auto_230318 ?auto_230319 ?auto_230320 ?auto_230321 ?auto_230322 ?auto_230323 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230332 - BLOCK
      ?auto_230333 - BLOCK
      ?auto_230334 - BLOCK
      ?auto_230335 - BLOCK
      ?auto_230336 - BLOCK
      ?auto_230337 - BLOCK
      ?auto_230338 - BLOCK
    )
    :vars
    (
      ?auto_230339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230338 ?auto_230339 ) ( ON-TABLE ?auto_230332 ) ( ON ?auto_230333 ?auto_230332 ) ( not ( = ?auto_230332 ?auto_230333 ) ) ( not ( = ?auto_230332 ?auto_230334 ) ) ( not ( = ?auto_230332 ?auto_230335 ) ) ( not ( = ?auto_230332 ?auto_230336 ) ) ( not ( = ?auto_230332 ?auto_230337 ) ) ( not ( = ?auto_230332 ?auto_230338 ) ) ( not ( = ?auto_230332 ?auto_230339 ) ) ( not ( = ?auto_230333 ?auto_230334 ) ) ( not ( = ?auto_230333 ?auto_230335 ) ) ( not ( = ?auto_230333 ?auto_230336 ) ) ( not ( = ?auto_230333 ?auto_230337 ) ) ( not ( = ?auto_230333 ?auto_230338 ) ) ( not ( = ?auto_230333 ?auto_230339 ) ) ( not ( = ?auto_230334 ?auto_230335 ) ) ( not ( = ?auto_230334 ?auto_230336 ) ) ( not ( = ?auto_230334 ?auto_230337 ) ) ( not ( = ?auto_230334 ?auto_230338 ) ) ( not ( = ?auto_230334 ?auto_230339 ) ) ( not ( = ?auto_230335 ?auto_230336 ) ) ( not ( = ?auto_230335 ?auto_230337 ) ) ( not ( = ?auto_230335 ?auto_230338 ) ) ( not ( = ?auto_230335 ?auto_230339 ) ) ( not ( = ?auto_230336 ?auto_230337 ) ) ( not ( = ?auto_230336 ?auto_230338 ) ) ( not ( = ?auto_230336 ?auto_230339 ) ) ( not ( = ?auto_230337 ?auto_230338 ) ) ( not ( = ?auto_230337 ?auto_230339 ) ) ( not ( = ?auto_230338 ?auto_230339 ) ) ( ON ?auto_230337 ?auto_230338 ) ( ON ?auto_230336 ?auto_230337 ) ( ON ?auto_230335 ?auto_230336 ) ( CLEAR ?auto_230333 ) ( ON ?auto_230334 ?auto_230335 ) ( CLEAR ?auto_230334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230332 ?auto_230333 ?auto_230334 )
      ( MAKE-7PILE ?auto_230332 ?auto_230333 ?auto_230334 ?auto_230335 ?auto_230336 ?auto_230337 ?auto_230338 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230347 - BLOCK
      ?auto_230348 - BLOCK
      ?auto_230349 - BLOCK
      ?auto_230350 - BLOCK
      ?auto_230351 - BLOCK
      ?auto_230352 - BLOCK
      ?auto_230353 - BLOCK
    )
    :vars
    (
      ?auto_230354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230353 ?auto_230354 ) ( ON-TABLE ?auto_230347 ) ( not ( = ?auto_230347 ?auto_230348 ) ) ( not ( = ?auto_230347 ?auto_230349 ) ) ( not ( = ?auto_230347 ?auto_230350 ) ) ( not ( = ?auto_230347 ?auto_230351 ) ) ( not ( = ?auto_230347 ?auto_230352 ) ) ( not ( = ?auto_230347 ?auto_230353 ) ) ( not ( = ?auto_230347 ?auto_230354 ) ) ( not ( = ?auto_230348 ?auto_230349 ) ) ( not ( = ?auto_230348 ?auto_230350 ) ) ( not ( = ?auto_230348 ?auto_230351 ) ) ( not ( = ?auto_230348 ?auto_230352 ) ) ( not ( = ?auto_230348 ?auto_230353 ) ) ( not ( = ?auto_230348 ?auto_230354 ) ) ( not ( = ?auto_230349 ?auto_230350 ) ) ( not ( = ?auto_230349 ?auto_230351 ) ) ( not ( = ?auto_230349 ?auto_230352 ) ) ( not ( = ?auto_230349 ?auto_230353 ) ) ( not ( = ?auto_230349 ?auto_230354 ) ) ( not ( = ?auto_230350 ?auto_230351 ) ) ( not ( = ?auto_230350 ?auto_230352 ) ) ( not ( = ?auto_230350 ?auto_230353 ) ) ( not ( = ?auto_230350 ?auto_230354 ) ) ( not ( = ?auto_230351 ?auto_230352 ) ) ( not ( = ?auto_230351 ?auto_230353 ) ) ( not ( = ?auto_230351 ?auto_230354 ) ) ( not ( = ?auto_230352 ?auto_230353 ) ) ( not ( = ?auto_230352 ?auto_230354 ) ) ( not ( = ?auto_230353 ?auto_230354 ) ) ( ON ?auto_230352 ?auto_230353 ) ( ON ?auto_230351 ?auto_230352 ) ( ON ?auto_230350 ?auto_230351 ) ( ON ?auto_230349 ?auto_230350 ) ( CLEAR ?auto_230347 ) ( ON ?auto_230348 ?auto_230349 ) ( CLEAR ?auto_230348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230347 ?auto_230348 )
      ( MAKE-7PILE ?auto_230347 ?auto_230348 ?auto_230349 ?auto_230350 ?auto_230351 ?auto_230352 ?auto_230353 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230362 - BLOCK
      ?auto_230363 - BLOCK
      ?auto_230364 - BLOCK
      ?auto_230365 - BLOCK
      ?auto_230366 - BLOCK
      ?auto_230367 - BLOCK
      ?auto_230368 - BLOCK
    )
    :vars
    (
      ?auto_230369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230368 ?auto_230369 ) ( ON-TABLE ?auto_230362 ) ( not ( = ?auto_230362 ?auto_230363 ) ) ( not ( = ?auto_230362 ?auto_230364 ) ) ( not ( = ?auto_230362 ?auto_230365 ) ) ( not ( = ?auto_230362 ?auto_230366 ) ) ( not ( = ?auto_230362 ?auto_230367 ) ) ( not ( = ?auto_230362 ?auto_230368 ) ) ( not ( = ?auto_230362 ?auto_230369 ) ) ( not ( = ?auto_230363 ?auto_230364 ) ) ( not ( = ?auto_230363 ?auto_230365 ) ) ( not ( = ?auto_230363 ?auto_230366 ) ) ( not ( = ?auto_230363 ?auto_230367 ) ) ( not ( = ?auto_230363 ?auto_230368 ) ) ( not ( = ?auto_230363 ?auto_230369 ) ) ( not ( = ?auto_230364 ?auto_230365 ) ) ( not ( = ?auto_230364 ?auto_230366 ) ) ( not ( = ?auto_230364 ?auto_230367 ) ) ( not ( = ?auto_230364 ?auto_230368 ) ) ( not ( = ?auto_230364 ?auto_230369 ) ) ( not ( = ?auto_230365 ?auto_230366 ) ) ( not ( = ?auto_230365 ?auto_230367 ) ) ( not ( = ?auto_230365 ?auto_230368 ) ) ( not ( = ?auto_230365 ?auto_230369 ) ) ( not ( = ?auto_230366 ?auto_230367 ) ) ( not ( = ?auto_230366 ?auto_230368 ) ) ( not ( = ?auto_230366 ?auto_230369 ) ) ( not ( = ?auto_230367 ?auto_230368 ) ) ( not ( = ?auto_230367 ?auto_230369 ) ) ( not ( = ?auto_230368 ?auto_230369 ) ) ( ON ?auto_230367 ?auto_230368 ) ( ON ?auto_230366 ?auto_230367 ) ( ON ?auto_230365 ?auto_230366 ) ( ON ?auto_230364 ?auto_230365 ) ( CLEAR ?auto_230362 ) ( ON ?auto_230363 ?auto_230364 ) ( CLEAR ?auto_230363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230362 ?auto_230363 )
      ( MAKE-7PILE ?auto_230362 ?auto_230363 ?auto_230364 ?auto_230365 ?auto_230366 ?auto_230367 ?auto_230368 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230377 - BLOCK
      ?auto_230378 - BLOCK
      ?auto_230379 - BLOCK
      ?auto_230380 - BLOCK
      ?auto_230381 - BLOCK
      ?auto_230382 - BLOCK
      ?auto_230383 - BLOCK
    )
    :vars
    (
      ?auto_230384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230383 ?auto_230384 ) ( not ( = ?auto_230377 ?auto_230378 ) ) ( not ( = ?auto_230377 ?auto_230379 ) ) ( not ( = ?auto_230377 ?auto_230380 ) ) ( not ( = ?auto_230377 ?auto_230381 ) ) ( not ( = ?auto_230377 ?auto_230382 ) ) ( not ( = ?auto_230377 ?auto_230383 ) ) ( not ( = ?auto_230377 ?auto_230384 ) ) ( not ( = ?auto_230378 ?auto_230379 ) ) ( not ( = ?auto_230378 ?auto_230380 ) ) ( not ( = ?auto_230378 ?auto_230381 ) ) ( not ( = ?auto_230378 ?auto_230382 ) ) ( not ( = ?auto_230378 ?auto_230383 ) ) ( not ( = ?auto_230378 ?auto_230384 ) ) ( not ( = ?auto_230379 ?auto_230380 ) ) ( not ( = ?auto_230379 ?auto_230381 ) ) ( not ( = ?auto_230379 ?auto_230382 ) ) ( not ( = ?auto_230379 ?auto_230383 ) ) ( not ( = ?auto_230379 ?auto_230384 ) ) ( not ( = ?auto_230380 ?auto_230381 ) ) ( not ( = ?auto_230380 ?auto_230382 ) ) ( not ( = ?auto_230380 ?auto_230383 ) ) ( not ( = ?auto_230380 ?auto_230384 ) ) ( not ( = ?auto_230381 ?auto_230382 ) ) ( not ( = ?auto_230381 ?auto_230383 ) ) ( not ( = ?auto_230381 ?auto_230384 ) ) ( not ( = ?auto_230382 ?auto_230383 ) ) ( not ( = ?auto_230382 ?auto_230384 ) ) ( not ( = ?auto_230383 ?auto_230384 ) ) ( ON ?auto_230382 ?auto_230383 ) ( ON ?auto_230381 ?auto_230382 ) ( ON ?auto_230380 ?auto_230381 ) ( ON ?auto_230379 ?auto_230380 ) ( ON ?auto_230378 ?auto_230379 ) ( ON ?auto_230377 ?auto_230378 ) ( CLEAR ?auto_230377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230377 )
      ( MAKE-7PILE ?auto_230377 ?auto_230378 ?auto_230379 ?auto_230380 ?auto_230381 ?auto_230382 ?auto_230383 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_230392 - BLOCK
      ?auto_230393 - BLOCK
      ?auto_230394 - BLOCK
      ?auto_230395 - BLOCK
      ?auto_230396 - BLOCK
      ?auto_230397 - BLOCK
      ?auto_230398 - BLOCK
    )
    :vars
    (
      ?auto_230399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230398 ?auto_230399 ) ( not ( = ?auto_230392 ?auto_230393 ) ) ( not ( = ?auto_230392 ?auto_230394 ) ) ( not ( = ?auto_230392 ?auto_230395 ) ) ( not ( = ?auto_230392 ?auto_230396 ) ) ( not ( = ?auto_230392 ?auto_230397 ) ) ( not ( = ?auto_230392 ?auto_230398 ) ) ( not ( = ?auto_230392 ?auto_230399 ) ) ( not ( = ?auto_230393 ?auto_230394 ) ) ( not ( = ?auto_230393 ?auto_230395 ) ) ( not ( = ?auto_230393 ?auto_230396 ) ) ( not ( = ?auto_230393 ?auto_230397 ) ) ( not ( = ?auto_230393 ?auto_230398 ) ) ( not ( = ?auto_230393 ?auto_230399 ) ) ( not ( = ?auto_230394 ?auto_230395 ) ) ( not ( = ?auto_230394 ?auto_230396 ) ) ( not ( = ?auto_230394 ?auto_230397 ) ) ( not ( = ?auto_230394 ?auto_230398 ) ) ( not ( = ?auto_230394 ?auto_230399 ) ) ( not ( = ?auto_230395 ?auto_230396 ) ) ( not ( = ?auto_230395 ?auto_230397 ) ) ( not ( = ?auto_230395 ?auto_230398 ) ) ( not ( = ?auto_230395 ?auto_230399 ) ) ( not ( = ?auto_230396 ?auto_230397 ) ) ( not ( = ?auto_230396 ?auto_230398 ) ) ( not ( = ?auto_230396 ?auto_230399 ) ) ( not ( = ?auto_230397 ?auto_230398 ) ) ( not ( = ?auto_230397 ?auto_230399 ) ) ( not ( = ?auto_230398 ?auto_230399 ) ) ( ON ?auto_230397 ?auto_230398 ) ( ON ?auto_230396 ?auto_230397 ) ( ON ?auto_230395 ?auto_230396 ) ( ON ?auto_230394 ?auto_230395 ) ( ON ?auto_230393 ?auto_230394 ) ( ON ?auto_230392 ?auto_230393 ) ( CLEAR ?auto_230392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230392 )
      ( MAKE-7PILE ?auto_230392 ?auto_230393 ?auto_230394 ?auto_230395 ?auto_230396 ?auto_230397 ?auto_230398 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230408 - BLOCK
      ?auto_230409 - BLOCK
      ?auto_230410 - BLOCK
      ?auto_230411 - BLOCK
      ?auto_230412 - BLOCK
      ?auto_230413 - BLOCK
      ?auto_230414 - BLOCK
      ?auto_230415 - BLOCK
    )
    :vars
    (
      ?auto_230416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230414 ) ( ON ?auto_230415 ?auto_230416 ) ( CLEAR ?auto_230415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230408 ) ( ON ?auto_230409 ?auto_230408 ) ( ON ?auto_230410 ?auto_230409 ) ( ON ?auto_230411 ?auto_230410 ) ( ON ?auto_230412 ?auto_230411 ) ( ON ?auto_230413 ?auto_230412 ) ( ON ?auto_230414 ?auto_230413 ) ( not ( = ?auto_230408 ?auto_230409 ) ) ( not ( = ?auto_230408 ?auto_230410 ) ) ( not ( = ?auto_230408 ?auto_230411 ) ) ( not ( = ?auto_230408 ?auto_230412 ) ) ( not ( = ?auto_230408 ?auto_230413 ) ) ( not ( = ?auto_230408 ?auto_230414 ) ) ( not ( = ?auto_230408 ?auto_230415 ) ) ( not ( = ?auto_230408 ?auto_230416 ) ) ( not ( = ?auto_230409 ?auto_230410 ) ) ( not ( = ?auto_230409 ?auto_230411 ) ) ( not ( = ?auto_230409 ?auto_230412 ) ) ( not ( = ?auto_230409 ?auto_230413 ) ) ( not ( = ?auto_230409 ?auto_230414 ) ) ( not ( = ?auto_230409 ?auto_230415 ) ) ( not ( = ?auto_230409 ?auto_230416 ) ) ( not ( = ?auto_230410 ?auto_230411 ) ) ( not ( = ?auto_230410 ?auto_230412 ) ) ( not ( = ?auto_230410 ?auto_230413 ) ) ( not ( = ?auto_230410 ?auto_230414 ) ) ( not ( = ?auto_230410 ?auto_230415 ) ) ( not ( = ?auto_230410 ?auto_230416 ) ) ( not ( = ?auto_230411 ?auto_230412 ) ) ( not ( = ?auto_230411 ?auto_230413 ) ) ( not ( = ?auto_230411 ?auto_230414 ) ) ( not ( = ?auto_230411 ?auto_230415 ) ) ( not ( = ?auto_230411 ?auto_230416 ) ) ( not ( = ?auto_230412 ?auto_230413 ) ) ( not ( = ?auto_230412 ?auto_230414 ) ) ( not ( = ?auto_230412 ?auto_230415 ) ) ( not ( = ?auto_230412 ?auto_230416 ) ) ( not ( = ?auto_230413 ?auto_230414 ) ) ( not ( = ?auto_230413 ?auto_230415 ) ) ( not ( = ?auto_230413 ?auto_230416 ) ) ( not ( = ?auto_230414 ?auto_230415 ) ) ( not ( = ?auto_230414 ?auto_230416 ) ) ( not ( = ?auto_230415 ?auto_230416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230415 ?auto_230416 )
      ( !STACK ?auto_230415 ?auto_230414 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230425 - BLOCK
      ?auto_230426 - BLOCK
      ?auto_230427 - BLOCK
      ?auto_230428 - BLOCK
      ?auto_230429 - BLOCK
      ?auto_230430 - BLOCK
      ?auto_230431 - BLOCK
      ?auto_230432 - BLOCK
    )
    :vars
    (
      ?auto_230433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230431 ) ( ON ?auto_230432 ?auto_230433 ) ( CLEAR ?auto_230432 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230425 ) ( ON ?auto_230426 ?auto_230425 ) ( ON ?auto_230427 ?auto_230426 ) ( ON ?auto_230428 ?auto_230427 ) ( ON ?auto_230429 ?auto_230428 ) ( ON ?auto_230430 ?auto_230429 ) ( ON ?auto_230431 ?auto_230430 ) ( not ( = ?auto_230425 ?auto_230426 ) ) ( not ( = ?auto_230425 ?auto_230427 ) ) ( not ( = ?auto_230425 ?auto_230428 ) ) ( not ( = ?auto_230425 ?auto_230429 ) ) ( not ( = ?auto_230425 ?auto_230430 ) ) ( not ( = ?auto_230425 ?auto_230431 ) ) ( not ( = ?auto_230425 ?auto_230432 ) ) ( not ( = ?auto_230425 ?auto_230433 ) ) ( not ( = ?auto_230426 ?auto_230427 ) ) ( not ( = ?auto_230426 ?auto_230428 ) ) ( not ( = ?auto_230426 ?auto_230429 ) ) ( not ( = ?auto_230426 ?auto_230430 ) ) ( not ( = ?auto_230426 ?auto_230431 ) ) ( not ( = ?auto_230426 ?auto_230432 ) ) ( not ( = ?auto_230426 ?auto_230433 ) ) ( not ( = ?auto_230427 ?auto_230428 ) ) ( not ( = ?auto_230427 ?auto_230429 ) ) ( not ( = ?auto_230427 ?auto_230430 ) ) ( not ( = ?auto_230427 ?auto_230431 ) ) ( not ( = ?auto_230427 ?auto_230432 ) ) ( not ( = ?auto_230427 ?auto_230433 ) ) ( not ( = ?auto_230428 ?auto_230429 ) ) ( not ( = ?auto_230428 ?auto_230430 ) ) ( not ( = ?auto_230428 ?auto_230431 ) ) ( not ( = ?auto_230428 ?auto_230432 ) ) ( not ( = ?auto_230428 ?auto_230433 ) ) ( not ( = ?auto_230429 ?auto_230430 ) ) ( not ( = ?auto_230429 ?auto_230431 ) ) ( not ( = ?auto_230429 ?auto_230432 ) ) ( not ( = ?auto_230429 ?auto_230433 ) ) ( not ( = ?auto_230430 ?auto_230431 ) ) ( not ( = ?auto_230430 ?auto_230432 ) ) ( not ( = ?auto_230430 ?auto_230433 ) ) ( not ( = ?auto_230431 ?auto_230432 ) ) ( not ( = ?auto_230431 ?auto_230433 ) ) ( not ( = ?auto_230432 ?auto_230433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230432 ?auto_230433 )
      ( !STACK ?auto_230432 ?auto_230431 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230442 - BLOCK
      ?auto_230443 - BLOCK
      ?auto_230444 - BLOCK
      ?auto_230445 - BLOCK
      ?auto_230446 - BLOCK
      ?auto_230447 - BLOCK
      ?auto_230448 - BLOCK
      ?auto_230449 - BLOCK
    )
    :vars
    (
      ?auto_230450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230449 ?auto_230450 ) ( ON-TABLE ?auto_230442 ) ( ON ?auto_230443 ?auto_230442 ) ( ON ?auto_230444 ?auto_230443 ) ( ON ?auto_230445 ?auto_230444 ) ( ON ?auto_230446 ?auto_230445 ) ( ON ?auto_230447 ?auto_230446 ) ( not ( = ?auto_230442 ?auto_230443 ) ) ( not ( = ?auto_230442 ?auto_230444 ) ) ( not ( = ?auto_230442 ?auto_230445 ) ) ( not ( = ?auto_230442 ?auto_230446 ) ) ( not ( = ?auto_230442 ?auto_230447 ) ) ( not ( = ?auto_230442 ?auto_230448 ) ) ( not ( = ?auto_230442 ?auto_230449 ) ) ( not ( = ?auto_230442 ?auto_230450 ) ) ( not ( = ?auto_230443 ?auto_230444 ) ) ( not ( = ?auto_230443 ?auto_230445 ) ) ( not ( = ?auto_230443 ?auto_230446 ) ) ( not ( = ?auto_230443 ?auto_230447 ) ) ( not ( = ?auto_230443 ?auto_230448 ) ) ( not ( = ?auto_230443 ?auto_230449 ) ) ( not ( = ?auto_230443 ?auto_230450 ) ) ( not ( = ?auto_230444 ?auto_230445 ) ) ( not ( = ?auto_230444 ?auto_230446 ) ) ( not ( = ?auto_230444 ?auto_230447 ) ) ( not ( = ?auto_230444 ?auto_230448 ) ) ( not ( = ?auto_230444 ?auto_230449 ) ) ( not ( = ?auto_230444 ?auto_230450 ) ) ( not ( = ?auto_230445 ?auto_230446 ) ) ( not ( = ?auto_230445 ?auto_230447 ) ) ( not ( = ?auto_230445 ?auto_230448 ) ) ( not ( = ?auto_230445 ?auto_230449 ) ) ( not ( = ?auto_230445 ?auto_230450 ) ) ( not ( = ?auto_230446 ?auto_230447 ) ) ( not ( = ?auto_230446 ?auto_230448 ) ) ( not ( = ?auto_230446 ?auto_230449 ) ) ( not ( = ?auto_230446 ?auto_230450 ) ) ( not ( = ?auto_230447 ?auto_230448 ) ) ( not ( = ?auto_230447 ?auto_230449 ) ) ( not ( = ?auto_230447 ?auto_230450 ) ) ( not ( = ?auto_230448 ?auto_230449 ) ) ( not ( = ?auto_230448 ?auto_230450 ) ) ( not ( = ?auto_230449 ?auto_230450 ) ) ( CLEAR ?auto_230447 ) ( ON ?auto_230448 ?auto_230449 ) ( CLEAR ?auto_230448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_230442 ?auto_230443 ?auto_230444 ?auto_230445 ?auto_230446 ?auto_230447 ?auto_230448 )
      ( MAKE-8PILE ?auto_230442 ?auto_230443 ?auto_230444 ?auto_230445 ?auto_230446 ?auto_230447 ?auto_230448 ?auto_230449 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230459 - BLOCK
      ?auto_230460 - BLOCK
      ?auto_230461 - BLOCK
      ?auto_230462 - BLOCK
      ?auto_230463 - BLOCK
      ?auto_230464 - BLOCK
      ?auto_230465 - BLOCK
      ?auto_230466 - BLOCK
    )
    :vars
    (
      ?auto_230467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230466 ?auto_230467 ) ( ON-TABLE ?auto_230459 ) ( ON ?auto_230460 ?auto_230459 ) ( ON ?auto_230461 ?auto_230460 ) ( ON ?auto_230462 ?auto_230461 ) ( ON ?auto_230463 ?auto_230462 ) ( ON ?auto_230464 ?auto_230463 ) ( not ( = ?auto_230459 ?auto_230460 ) ) ( not ( = ?auto_230459 ?auto_230461 ) ) ( not ( = ?auto_230459 ?auto_230462 ) ) ( not ( = ?auto_230459 ?auto_230463 ) ) ( not ( = ?auto_230459 ?auto_230464 ) ) ( not ( = ?auto_230459 ?auto_230465 ) ) ( not ( = ?auto_230459 ?auto_230466 ) ) ( not ( = ?auto_230459 ?auto_230467 ) ) ( not ( = ?auto_230460 ?auto_230461 ) ) ( not ( = ?auto_230460 ?auto_230462 ) ) ( not ( = ?auto_230460 ?auto_230463 ) ) ( not ( = ?auto_230460 ?auto_230464 ) ) ( not ( = ?auto_230460 ?auto_230465 ) ) ( not ( = ?auto_230460 ?auto_230466 ) ) ( not ( = ?auto_230460 ?auto_230467 ) ) ( not ( = ?auto_230461 ?auto_230462 ) ) ( not ( = ?auto_230461 ?auto_230463 ) ) ( not ( = ?auto_230461 ?auto_230464 ) ) ( not ( = ?auto_230461 ?auto_230465 ) ) ( not ( = ?auto_230461 ?auto_230466 ) ) ( not ( = ?auto_230461 ?auto_230467 ) ) ( not ( = ?auto_230462 ?auto_230463 ) ) ( not ( = ?auto_230462 ?auto_230464 ) ) ( not ( = ?auto_230462 ?auto_230465 ) ) ( not ( = ?auto_230462 ?auto_230466 ) ) ( not ( = ?auto_230462 ?auto_230467 ) ) ( not ( = ?auto_230463 ?auto_230464 ) ) ( not ( = ?auto_230463 ?auto_230465 ) ) ( not ( = ?auto_230463 ?auto_230466 ) ) ( not ( = ?auto_230463 ?auto_230467 ) ) ( not ( = ?auto_230464 ?auto_230465 ) ) ( not ( = ?auto_230464 ?auto_230466 ) ) ( not ( = ?auto_230464 ?auto_230467 ) ) ( not ( = ?auto_230465 ?auto_230466 ) ) ( not ( = ?auto_230465 ?auto_230467 ) ) ( not ( = ?auto_230466 ?auto_230467 ) ) ( CLEAR ?auto_230464 ) ( ON ?auto_230465 ?auto_230466 ) ( CLEAR ?auto_230465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_230459 ?auto_230460 ?auto_230461 ?auto_230462 ?auto_230463 ?auto_230464 ?auto_230465 )
      ( MAKE-8PILE ?auto_230459 ?auto_230460 ?auto_230461 ?auto_230462 ?auto_230463 ?auto_230464 ?auto_230465 ?auto_230466 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230476 - BLOCK
      ?auto_230477 - BLOCK
      ?auto_230478 - BLOCK
      ?auto_230479 - BLOCK
      ?auto_230480 - BLOCK
      ?auto_230481 - BLOCK
      ?auto_230482 - BLOCK
      ?auto_230483 - BLOCK
    )
    :vars
    (
      ?auto_230484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230483 ?auto_230484 ) ( ON-TABLE ?auto_230476 ) ( ON ?auto_230477 ?auto_230476 ) ( ON ?auto_230478 ?auto_230477 ) ( ON ?auto_230479 ?auto_230478 ) ( ON ?auto_230480 ?auto_230479 ) ( not ( = ?auto_230476 ?auto_230477 ) ) ( not ( = ?auto_230476 ?auto_230478 ) ) ( not ( = ?auto_230476 ?auto_230479 ) ) ( not ( = ?auto_230476 ?auto_230480 ) ) ( not ( = ?auto_230476 ?auto_230481 ) ) ( not ( = ?auto_230476 ?auto_230482 ) ) ( not ( = ?auto_230476 ?auto_230483 ) ) ( not ( = ?auto_230476 ?auto_230484 ) ) ( not ( = ?auto_230477 ?auto_230478 ) ) ( not ( = ?auto_230477 ?auto_230479 ) ) ( not ( = ?auto_230477 ?auto_230480 ) ) ( not ( = ?auto_230477 ?auto_230481 ) ) ( not ( = ?auto_230477 ?auto_230482 ) ) ( not ( = ?auto_230477 ?auto_230483 ) ) ( not ( = ?auto_230477 ?auto_230484 ) ) ( not ( = ?auto_230478 ?auto_230479 ) ) ( not ( = ?auto_230478 ?auto_230480 ) ) ( not ( = ?auto_230478 ?auto_230481 ) ) ( not ( = ?auto_230478 ?auto_230482 ) ) ( not ( = ?auto_230478 ?auto_230483 ) ) ( not ( = ?auto_230478 ?auto_230484 ) ) ( not ( = ?auto_230479 ?auto_230480 ) ) ( not ( = ?auto_230479 ?auto_230481 ) ) ( not ( = ?auto_230479 ?auto_230482 ) ) ( not ( = ?auto_230479 ?auto_230483 ) ) ( not ( = ?auto_230479 ?auto_230484 ) ) ( not ( = ?auto_230480 ?auto_230481 ) ) ( not ( = ?auto_230480 ?auto_230482 ) ) ( not ( = ?auto_230480 ?auto_230483 ) ) ( not ( = ?auto_230480 ?auto_230484 ) ) ( not ( = ?auto_230481 ?auto_230482 ) ) ( not ( = ?auto_230481 ?auto_230483 ) ) ( not ( = ?auto_230481 ?auto_230484 ) ) ( not ( = ?auto_230482 ?auto_230483 ) ) ( not ( = ?auto_230482 ?auto_230484 ) ) ( not ( = ?auto_230483 ?auto_230484 ) ) ( ON ?auto_230482 ?auto_230483 ) ( CLEAR ?auto_230480 ) ( ON ?auto_230481 ?auto_230482 ) ( CLEAR ?auto_230481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_230476 ?auto_230477 ?auto_230478 ?auto_230479 ?auto_230480 ?auto_230481 )
      ( MAKE-8PILE ?auto_230476 ?auto_230477 ?auto_230478 ?auto_230479 ?auto_230480 ?auto_230481 ?auto_230482 ?auto_230483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230493 - BLOCK
      ?auto_230494 - BLOCK
      ?auto_230495 - BLOCK
      ?auto_230496 - BLOCK
      ?auto_230497 - BLOCK
      ?auto_230498 - BLOCK
      ?auto_230499 - BLOCK
      ?auto_230500 - BLOCK
    )
    :vars
    (
      ?auto_230501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230500 ?auto_230501 ) ( ON-TABLE ?auto_230493 ) ( ON ?auto_230494 ?auto_230493 ) ( ON ?auto_230495 ?auto_230494 ) ( ON ?auto_230496 ?auto_230495 ) ( ON ?auto_230497 ?auto_230496 ) ( not ( = ?auto_230493 ?auto_230494 ) ) ( not ( = ?auto_230493 ?auto_230495 ) ) ( not ( = ?auto_230493 ?auto_230496 ) ) ( not ( = ?auto_230493 ?auto_230497 ) ) ( not ( = ?auto_230493 ?auto_230498 ) ) ( not ( = ?auto_230493 ?auto_230499 ) ) ( not ( = ?auto_230493 ?auto_230500 ) ) ( not ( = ?auto_230493 ?auto_230501 ) ) ( not ( = ?auto_230494 ?auto_230495 ) ) ( not ( = ?auto_230494 ?auto_230496 ) ) ( not ( = ?auto_230494 ?auto_230497 ) ) ( not ( = ?auto_230494 ?auto_230498 ) ) ( not ( = ?auto_230494 ?auto_230499 ) ) ( not ( = ?auto_230494 ?auto_230500 ) ) ( not ( = ?auto_230494 ?auto_230501 ) ) ( not ( = ?auto_230495 ?auto_230496 ) ) ( not ( = ?auto_230495 ?auto_230497 ) ) ( not ( = ?auto_230495 ?auto_230498 ) ) ( not ( = ?auto_230495 ?auto_230499 ) ) ( not ( = ?auto_230495 ?auto_230500 ) ) ( not ( = ?auto_230495 ?auto_230501 ) ) ( not ( = ?auto_230496 ?auto_230497 ) ) ( not ( = ?auto_230496 ?auto_230498 ) ) ( not ( = ?auto_230496 ?auto_230499 ) ) ( not ( = ?auto_230496 ?auto_230500 ) ) ( not ( = ?auto_230496 ?auto_230501 ) ) ( not ( = ?auto_230497 ?auto_230498 ) ) ( not ( = ?auto_230497 ?auto_230499 ) ) ( not ( = ?auto_230497 ?auto_230500 ) ) ( not ( = ?auto_230497 ?auto_230501 ) ) ( not ( = ?auto_230498 ?auto_230499 ) ) ( not ( = ?auto_230498 ?auto_230500 ) ) ( not ( = ?auto_230498 ?auto_230501 ) ) ( not ( = ?auto_230499 ?auto_230500 ) ) ( not ( = ?auto_230499 ?auto_230501 ) ) ( not ( = ?auto_230500 ?auto_230501 ) ) ( ON ?auto_230499 ?auto_230500 ) ( CLEAR ?auto_230497 ) ( ON ?auto_230498 ?auto_230499 ) ( CLEAR ?auto_230498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_230493 ?auto_230494 ?auto_230495 ?auto_230496 ?auto_230497 ?auto_230498 )
      ( MAKE-8PILE ?auto_230493 ?auto_230494 ?auto_230495 ?auto_230496 ?auto_230497 ?auto_230498 ?auto_230499 ?auto_230500 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230510 - BLOCK
      ?auto_230511 - BLOCK
      ?auto_230512 - BLOCK
      ?auto_230513 - BLOCK
      ?auto_230514 - BLOCK
      ?auto_230515 - BLOCK
      ?auto_230516 - BLOCK
      ?auto_230517 - BLOCK
    )
    :vars
    (
      ?auto_230518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230517 ?auto_230518 ) ( ON-TABLE ?auto_230510 ) ( ON ?auto_230511 ?auto_230510 ) ( ON ?auto_230512 ?auto_230511 ) ( ON ?auto_230513 ?auto_230512 ) ( not ( = ?auto_230510 ?auto_230511 ) ) ( not ( = ?auto_230510 ?auto_230512 ) ) ( not ( = ?auto_230510 ?auto_230513 ) ) ( not ( = ?auto_230510 ?auto_230514 ) ) ( not ( = ?auto_230510 ?auto_230515 ) ) ( not ( = ?auto_230510 ?auto_230516 ) ) ( not ( = ?auto_230510 ?auto_230517 ) ) ( not ( = ?auto_230510 ?auto_230518 ) ) ( not ( = ?auto_230511 ?auto_230512 ) ) ( not ( = ?auto_230511 ?auto_230513 ) ) ( not ( = ?auto_230511 ?auto_230514 ) ) ( not ( = ?auto_230511 ?auto_230515 ) ) ( not ( = ?auto_230511 ?auto_230516 ) ) ( not ( = ?auto_230511 ?auto_230517 ) ) ( not ( = ?auto_230511 ?auto_230518 ) ) ( not ( = ?auto_230512 ?auto_230513 ) ) ( not ( = ?auto_230512 ?auto_230514 ) ) ( not ( = ?auto_230512 ?auto_230515 ) ) ( not ( = ?auto_230512 ?auto_230516 ) ) ( not ( = ?auto_230512 ?auto_230517 ) ) ( not ( = ?auto_230512 ?auto_230518 ) ) ( not ( = ?auto_230513 ?auto_230514 ) ) ( not ( = ?auto_230513 ?auto_230515 ) ) ( not ( = ?auto_230513 ?auto_230516 ) ) ( not ( = ?auto_230513 ?auto_230517 ) ) ( not ( = ?auto_230513 ?auto_230518 ) ) ( not ( = ?auto_230514 ?auto_230515 ) ) ( not ( = ?auto_230514 ?auto_230516 ) ) ( not ( = ?auto_230514 ?auto_230517 ) ) ( not ( = ?auto_230514 ?auto_230518 ) ) ( not ( = ?auto_230515 ?auto_230516 ) ) ( not ( = ?auto_230515 ?auto_230517 ) ) ( not ( = ?auto_230515 ?auto_230518 ) ) ( not ( = ?auto_230516 ?auto_230517 ) ) ( not ( = ?auto_230516 ?auto_230518 ) ) ( not ( = ?auto_230517 ?auto_230518 ) ) ( ON ?auto_230516 ?auto_230517 ) ( ON ?auto_230515 ?auto_230516 ) ( CLEAR ?auto_230513 ) ( ON ?auto_230514 ?auto_230515 ) ( CLEAR ?auto_230514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230510 ?auto_230511 ?auto_230512 ?auto_230513 ?auto_230514 )
      ( MAKE-8PILE ?auto_230510 ?auto_230511 ?auto_230512 ?auto_230513 ?auto_230514 ?auto_230515 ?auto_230516 ?auto_230517 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230527 - BLOCK
      ?auto_230528 - BLOCK
      ?auto_230529 - BLOCK
      ?auto_230530 - BLOCK
      ?auto_230531 - BLOCK
      ?auto_230532 - BLOCK
      ?auto_230533 - BLOCK
      ?auto_230534 - BLOCK
    )
    :vars
    (
      ?auto_230535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230534 ?auto_230535 ) ( ON-TABLE ?auto_230527 ) ( ON ?auto_230528 ?auto_230527 ) ( ON ?auto_230529 ?auto_230528 ) ( ON ?auto_230530 ?auto_230529 ) ( not ( = ?auto_230527 ?auto_230528 ) ) ( not ( = ?auto_230527 ?auto_230529 ) ) ( not ( = ?auto_230527 ?auto_230530 ) ) ( not ( = ?auto_230527 ?auto_230531 ) ) ( not ( = ?auto_230527 ?auto_230532 ) ) ( not ( = ?auto_230527 ?auto_230533 ) ) ( not ( = ?auto_230527 ?auto_230534 ) ) ( not ( = ?auto_230527 ?auto_230535 ) ) ( not ( = ?auto_230528 ?auto_230529 ) ) ( not ( = ?auto_230528 ?auto_230530 ) ) ( not ( = ?auto_230528 ?auto_230531 ) ) ( not ( = ?auto_230528 ?auto_230532 ) ) ( not ( = ?auto_230528 ?auto_230533 ) ) ( not ( = ?auto_230528 ?auto_230534 ) ) ( not ( = ?auto_230528 ?auto_230535 ) ) ( not ( = ?auto_230529 ?auto_230530 ) ) ( not ( = ?auto_230529 ?auto_230531 ) ) ( not ( = ?auto_230529 ?auto_230532 ) ) ( not ( = ?auto_230529 ?auto_230533 ) ) ( not ( = ?auto_230529 ?auto_230534 ) ) ( not ( = ?auto_230529 ?auto_230535 ) ) ( not ( = ?auto_230530 ?auto_230531 ) ) ( not ( = ?auto_230530 ?auto_230532 ) ) ( not ( = ?auto_230530 ?auto_230533 ) ) ( not ( = ?auto_230530 ?auto_230534 ) ) ( not ( = ?auto_230530 ?auto_230535 ) ) ( not ( = ?auto_230531 ?auto_230532 ) ) ( not ( = ?auto_230531 ?auto_230533 ) ) ( not ( = ?auto_230531 ?auto_230534 ) ) ( not ( = ?auto_230531 ?auto_230535 ) ) ( not ( = ?auto_230532 ?auto_230533 ) ) ( not ( = ?auto_230532 ?auto_230534 ) ) ( not ( = ?auto_230532 ?auto_230535 ) ) ( not ( = ?auto_230533 ?auto_230534 ) ) ( not ( = ?auto_230533 ?auto_230535 ) ) ( not ( = ?auto_230534 ?auto_230535 ) ) ( ON ?auto_230533 ?auto_230534 ) ( ON ?auto_230532 ?auto_230533 ) ( CLEAR ?auto_230530 ) ( ON ?auto_230531 ?auto_230532 ) ( CLEAR ?auto_230531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230527 ?auto_230528 ?auto_230529 ?auto_230530 ?auto_230531 )
      ( MAKE-8PILE ?auto_230527 ?auto_230528 ?auto_230529 ?auto_230530 ?auto_230531 ?auto_230532 ?auto_230533 ?auto_230534 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230544 - BLOCK
      ?auto_230545 - BLOCK
      ?auto_230546 - BLOCK
      ?auto_230547 - BLOCK
      ?auto_230548 - BLOCK
      ?auto_230549 - BLOCK
      ?auto_230550 - BLOCK
      ?auto_230551 - BLOCK
    )
    :vars
    (
      ?auto_230552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230551 ?auto_230552 ) ( ON-TABLE ?auto_230544 ) ( ON ?auto_230545 ?auto_230544 ) ( ON ?auto_230546 ?auto_230545 ) ( not ( = ?auto_230544 ?auto_230545 ) ) ( not ( = ?auto_230544 ?auto_230546 ) ) ( not ( = ?auto_230544 ?auto_230547 ) ) ( not ( = ?auto_230544 ?auto_230548 ) ) ( not ( = ?auto_230544 ?auto_230549 ) ) ( not ( = ?auto_230544 ?auto_230550 ) ) ( not ( = ?auto_230544 ?auto_230551 ) ) ( not ( = ?auto_230544 ?auto_230552 ) ) ( not ( = ?auto_230545 ?auto_230546 ) ) ( not ( = ?auto_230545 ?auto_230547 ) ) ( not ( = ?auto_230545 ?auto_230548 ) ) ( not ( = ?auto_230545 ?auto_230549 ) ) ( not ( = ?auto_230545 ?auto_230550 ) ) ( not ( = ?auto_230545 ?auto_230551 ) ) ( not ( = ?auto_230545 ?auto_230552 ) ) ( not ( = ?auto_230546 ?auto_230547 ) ) ( not ( = ?auto_230546 ?auto_230548 ) ) ( not ( = ?auto_230546 ?auto_230549 ) ) ( not ( = ?auto_230546 ?auto_230550 ) ) ( not ( = ?auto_230546 ?auto_230551 ) ) ( not ( = ?auto_230546 ?auto_230552 ) ) ( not ( = ?auto_230547 ?auto_230548 ) ) ( not ( = ?auto_230547 ?auto_230549 ) ) ( not ( = ?auto_230547 ?auto_230550 ) ) ( not ( = ?auto_230547 ?auto_230551 ) ) ( not ( = ?auto_230547 ?auto_230552 ) ) ( not ( = ?auto_230548 ?auto_230549 ) ) ( not ( = ?auto_230548 ?auto_230550 ) ) ( not ( = ?auto_230548 ?auto_230551 ) ) ( not ( = ?auto_230548 ?auto_230552 ) ) ( not ( = ?auto_230549 ?auto_230550 ) ) ( not ( = ?auto_230549 ?auto_230551 ) ) ( not ( = ?auto_230549 ?auto_230552 ) ) ( not ( = ?auto_230550 ?auto_230551 ) ) ( not ( = ?auto_230550 ?auto_230552 ) ) ( not ( = ?auto_230551 ?auto_230552 ) ) ( ON ?auto_230550 ?auto_230551 ) ( ON ?auto_230549 ?auto_230550 ) ( ON ?auto_230548 ?auto_230549 ) ( CLEAR ?auto_230546 ) ( ON ?auto_230547 ?auto_230548 ) ( CLEAR ?auto_230547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230544 ?auto_230545 ?auto_230546 ?auto_230547 )
      ( MAKE-8PILE ?auto_230544 ?auto_230545 ?auto_230546 ?auto_230547 ?auto_230548 ?auto_230549 ?auto_230550 ?auto_230551 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230561 - BLOCK
      ?auto_230562 - BLOCK
      ?auto_230563 - BLOCK
      ?auto_230564 - BLOCK
      ?auto_230565 - BLOCK
      ?auto_230566 - BLOCK
      ?auto_230567 - BLOCK
      ?auto_230568 - BLOCK
    )
    :vars
    (
      ?auto_230569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230568 ?auto_230569 ) ( ON-TABLE ?auto_230561 ) ( ON ?auto_230562 ?auto_230561 ) ( ON ?auto_230563 ?auto_230562 ) ( not ( = ?auto_230561 ?auto_230562 ) ) ( not ( = ?auto_230561 ?auto_230563 ) ) ( not ( = ?auto_230561 ?auto_230564 ) ) ( not ( = ?auto_230561 ?auto_230565 ) ) ( not ( = ?auto_230561 ?auto_230566 ) ) ( not ( = ?auto_230561 ?auto_230567 ) ) ( not ( = ?auto_230561 ?auto_230568 ) ) ( not ( = ?auto_230561 ?auto_230569 ) ) ( not ( = ?auto_230562 ?auto_230563 ) ) ( not ( = ?auto_230562 ?auto_230564 ) ) ( not ( = ?auto_230562 ?auto_230565 ) ) ( not ( = ?auto_230562 ?auto_230566 ) ) ( not ( = ?auto_230562 ?auto_230567 ) ) ( not ( = ?auto_230562 ?auto_230568 ) ) ( not ( = ?auto_230562 ?auto_230569 ) ) ( not ( = ?auto_230563 ?auto_230564 ) ) ( not ( = ?auto_230563 ?auto_230565 ) ) ( not ( = ?auto_230563 ?auto_230566 ) ) ( not ( = ?auto_230563 ?auto_230567 ) ) ( not ( = ?auto_230563 ?auto_230568 ) ) ( not ( = ?auto_230563 ?auto_230569 ) ) ( not ( = ?auto_230564 ?auto_230565 ) ) ( not ( = ?auto_230564 ?auto_230566 ) ) ( not ( = ?auto_230564 ?auto_230567 ) ) ( not ( = ?auto_230564 ?auto_230568 ) ) ( not ( = ?auto_230564 ?auto_230569 ) ) ( not ( = ?auto_230565 ?auto_230566 ) ) ( not ( = ?auto_230565 ?auto_230567 ) ) ( not ( = ?auto_230565 ?auto_230568 ) ) ( not ( = ?auto_230565 ?auto_230569 ) ) ( not ( = ?auto_230566 ?auto_230567 ) ) ( not ( = ?auto_230566 ?auto_230568 ) ) ( not ( = ?auto_230566 ?auto_230569 ) ) ( not ( = ?auto_230567 ?auto_230568 ) ) ( not ( = ?auto_230567 ?auto_230569 ) ) ( not ( = ?auto_230568 ?auto_230569 ) ) ( ON ?auto_230567 ?auto_230568 ) ( ON ?auto_230566 ?auto_230567 ) ( ON ?auto_230565 ?auto_230566 ) ( CLEAR ?auto_230563 ) ( ON ?auto_230564 ?auto_230565 ) ( CLEAR ?auto_230564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230561 ?auto_230562 ?auto_230563 ?auto_230564 )
      ( MAKE-8PILE ?auto_230561 ?auto_230562 ?auto_230563 ?auto_230564 ?auto_230565 ?auto_230566 ?auto_230567 ?auto_230568 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230578 - BLOCK
      ?auto_230579 - BLOCK
      ?auto_230580 - BLOCK
      ?auto_230581 - BLOCK
      ?auto_230582 - BLOCK
      ?auto_230583 - BLOCK
      ?auto_230584 - BLOCK
      ?auto_230585 - BLOCK
    )
    :vars
    (
      ?auto_230586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230585 ?auto_230586 ) ( ON-TABLE ?auto_230578 ) ( ON ?auto_230579 ?auto_230578 ) ( not ( = ?auto_230578 ?auto_230579 ) ) ( not ( = ?auto_230578 ?auto_230580 ) ) ( not ( = ?auto_230578 ?auto_230581 ) ) ( not ( = ?auto_230578 ?auto_230582 ) ) ( not ( = ?auto_230578 ?auto_230583 ) ) ( not ( = ?auto_230578 ?auto_230584 ) ) ( not ( = ?auto_230578 ?auto_230585 ) ) ( not ( = ?auto_230578 ?auto_230586 ) ) ( not ( = ?auto_230579 ?auto_230580 ) ) ( not ( = ?auto_230579 ?auto_230581 ) ) ( not ( = ?auto_230579 ?auto_230582 ) ) ( not ( = ?auto_230579 ?auto_230583 ) ) ( not ( = ?auto_230579 ?auto_230584 ) ) ( not ( = ?auto_230579 ?auto_230585 ) ) ( not ( = ?auto_230579 ?auto_230586 ) ) ( not ( = ?auto_230580 ?auto_230581 ) ) ( not ( = ?auto_230580 ?auto_230582 ) ) ( not ( = ?auto_230580 ?auto_230583 ) ) ( not ( = ?auto_230580 ?auto_230584 ) ) ( not ( = ?auto_230580 ?auto_230585 ) ) ( not ( = ?auto_230580 ?auto_230586 ) ) ( not ( = ?auto_230581 ?auto_230582 ) ) ( not ( = ?auto_230581 ?auto_230583 ) ) ( not ( = ?auto_230581 ?auto_230584 ) ) ( not ( = ?auto_230581 ?auto_230585 ) ) ( not ( = ?auto_230581 ?auto_230586 ) ) ( not ( = ?auto_230582 ?auto_230583 ) ) ( not ( = ?auto_230582 ?auto_230584 ) ) ( not ( = ?auto_230582 ?auto_230585 ) ) ( not ( = ?auto_230582 ?auto_230586 ) ) ( not ( = ?auto_230583 ?auto_230584 ) ) ( not ( = ?auto_230583 ?auto_230585 ) ) ( not ( = ?auto_230583 ?auto_230586 ) ) ( not ( = ?auto_230584 ?auto_230585 ) ) ( not ( = ?auto_230584 ?auto_230586 ) ) ( not ( = ?auto_230585 ?auto_230586 ) ) ( ON ?auto_230584 ?auto_230585 ) ( ON ?auto_230583 ?auto_230584 ) ( ON ?auto_230582 ?auto_230583 ) ( ON ?auto_230581 ?auto_230582 ) ( CLEAR ?auto_230579 ) ( ON ?auto_230580 ?auto_230581 ) ( CLEAR ?auto_230580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230578 ?auto_230579 ?auto_230580 )
      ( MAKE-8PILE ?auto_230578 ?auto_230579 ?auto_230580 ?auto_230581 ?auto_230582 ?auto_230583 ?auto_230584 ?auto_230585 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230595 - BLOCK
      ?auto_230596 - BLOCK
      ?auto_230597 - BLOCK
      ?auto_230598 - BLOCK
      ?auto_230599 - BLOCK
      ?auto_230600 - BLOCK
      ?auto_230601 - BLOCK
      ?auto_230602 - BLOCK
    )
    :vars
    (
      ?auto_230603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230602 ?auto_230603 ) ( ON-TABLE ?auto_230595 ) ( ON ?auto_230596 ?auto_230595 ) ( not ( = ?auto_230595 ?auto_230596 ) ) ( not ( = ?auto_230595 ?auto_230597 ) ) ( not ( = ?auto_230595 ?auto_230598 ) ) ( not ( = ?auto_230595 ?auto_230599 ) ) ( not ( = ?auto_230595 ?auto_230600 ) ) ( not ( = ?auto_230595 ?auto_230601 ) ) ( not ( = ?auto_230595 ?auto_230602 ) ) ( not ( = ?auto_230595 ?auto_230603 ) ) ( not ( = ?auto_230596 ?auto_230597 ) ) ( not ( = ?auto_230596 ?auto_230598 ) ) ( not ( = ?auto_230596 ?auto_230599 ) ) ( not ( = ?auto_230596 ?auto_230600 ) ) ( not ( = ?auto_230596 ?auto_230601 ) ) ( not ( = ?auto_230596 ?auto_230602 ) ) ( not ( = ?auto_230596 ?auto_230603 ) ) ( not ( = ?auto_230597 ?auto_230598 ) ) ( not ( = ?auto_230597 ?auto_230599 ) ) ( not ( = ?auto_230597 ?auto_230600 ) ) ( not ( = ?auto_230597 ?auto_230601 ) ) ( not ( = ?auto_230597 ?auto_230602 ) ) ( not ( = ?auto_230597 ?auto_230603 ) ) ( not ( = ?auto_230598 ?auto_230599 ) ) ( not ( = ?auto_230598 ?auto_230600 ) ) ( not ( = ?auto_230598 ?auto_230601 ) ) ( not ( = ?auto_230598 ?auto_230602 ) ) ( not ( = ?auto_230598 ?auto_230603 ) ) ( not ( = ?auto_230599 ?auto_230600 ) ) ( not ( = ?auto_230599 ?auto_230601 ) ) ( not ( = ?auto_230599 ?auto_230602 ) ) ( not ( = ?auto_230599 ?auto_230603 ) ) ( not ( = ?auto_230600 ?auto_230601 ) ) ( not ( = ?auto_230600 ?auto_230602 ) ) ( not ( = ?auto_230600 ?auto_230603 ) ) ( not ( = ?auto_230601 ?auto_230602 ) ) ( not ( = ?auto_230601 ?auto_230603 ) ) ( not ( = ?auto_230602 ?auto_230603 ) ) ( ON ?auto_230601 ?auto_230602 ) ( ON ?auto_230600 ?auto_230601 ) ( ON ?auto_230599 ?auto_230600 ) ( ON ?auto_230598 ?auto_230599 ) ( CLEAR ?auto_230596 ) ( ON ?auto_230597 ?auto_230598 ) ( CLEAR ?auto_230597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230595 ?auto_230596 ?auto_230597 )
      ( MAKE-8PILE ?auto_230595 ?auto_230596 ?auto_230597 ?auto_230598 ?auto_230599 ?auto_230600 ?auto_230601 ?auto_230602 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230612 - BLOCK
      ?auto_230613 - BLOCK
      ?auto_230614 - BLOCK
      ?auto_230615 - BLOCK
      ?auto_230616 - BLOCK
      ?auto_230617 - BLOCK
      ?auto_230618 - BLOCK
      ?auto_230619 - BLOCK
    )
    :vars
    (
      ?auto_230620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230619 ?auto_230620 ) ( ON-TABLE ?auto_230612 ) ( not ( = ?auto_230612 ?auto_230613 ) ) ( not ( = ?auto_230612 ?auto_230614 ) ) ( not ( = ?auto_230612 ?auto_230615 ) ) ( not ( = ?auto_230612 ?auto_230616 ) ) ( not ( = ?auto_230612 ?auto_230617 ) ) ( not ( = ?auto_230612 ?auto_230618 ) ) ( not ( = ?auto_230612 ?auto_230619 ) ) ( not ( = ?auto_230612 ?auto_230620 ) ) ( not ( = ?auto_230613 ?auto_230614 ) ) ( not ( = ?auto_230613 ?auto_230615 ) ) ( not ( = ?auto_230613 ?auto_230616 ) ) ( not ( = ?auto_230613 ?auto_230617 ) ) ( not ( = ?auto_230613 ?auto_230618 ) ) ( not ( = ?auto_230613 ?auto_230619 ) ) ( not ( = ?auto_230613 ?auto_230620 ) ) ( not ( = ?auto_230614 ?auto_230615 ) ) ( not ( = ?auto_230614 ?auto_230616 ) ) ( not ( = ?auto_230614 ?auto_230617 ) ) ( not ( = ?auto_230614 ?auto_230618 ) ) ( not ( = ?auto_230614 ?auto_230619 ) ) ( not ( = ?auto_230614 ?auto_230620 ) ) ( not ( = ?auto_230615 ?auto_230616 ) ) ( not ( = ?auto_230615 ?auto_230617 ) ) ( not ( = ?auto_230615 ?auto_230618 ) ) ( not ( = ?auto_230615 ?auto_230619 ) ) ( not ( = ?auto_230615 ?auto_230620 ) ) ( not ( = ?auto_230616 ?auto_230617 ) ) ( not ( = ?auto_230616 ?auto_230618 ) ) ( not ( = ?auto_230616 ?auto_230619 ) ) ( not ( = ?auto_230616 ?auto_230620 ) ) ( not ( = ?auto_230617 ?auto_230618 ) ) ( not ( = ?auto_230617 ?auto_230619 ) ) ( not ( = ?auto_230617 ?auto_230620 ) ) ( not ( = ?auto_230618 ?auto_230619 ) ) ( not ( = ?auto_230618 ?auto_230620 ) ) ( not ( = ?auto_230619 ?auto_230620 ) ) ( ON ?auto_230618 ?auto_230619 ) ( ON ?auto_230617 ?auto_230618 ) ( ON ?auto_230616 ?auto_230617 ) ( ON ?auto_230615 ?auto_230616 ) ( ON ?auto_230614 ?auto_230615 ) ( CLEAR ?auto_230612 ) ( ON ?auto_230613 ?auto_230614 ) ( CLEAR ?auto_230613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230612 ?auto_230613 )
      ( MAKE-8PILE ?auto_230612 ?auto_230613 ?auto_230614 ?auto_230615 ?auto_230616 ?auto_230617 ?auto_230618 ?auto_230619 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230629 - BLOCK
      ?auto_230630 - BLOCK
      ?auto_230631 - BLOCK
      ?auto_230632 - BLOCK
      ?auto_230633 - BLOCK
      ?auto_230634 - BLOCK
      ?auto_230635 - BLOCK
      ?auto_230636 - BLOCK
    )
    :vars
    (
      ?auto_230637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230636 ?auto_230637 ) ( ON-TABLE ?auto_230629 ) ( not ( = ?auto_230629 ?auto_230630 ) ) ( not ( = ?auto_230629 ?auto_230631 ) ) ( not ( = ?auto_230629 ?auto_230632 ) ) ( not ( = ?auto_230629 ?auto_230633 ) ) ( not ( = ?auto_230629 ?auto_230634 ) ) ( not ( = ?auto_230629 ?auto_230635 ) ) ( not ( = ?auto_230629 ?auto_230636 ) ) ( not ( = ?auto_230629 ?auto_230637 ) ) ( not ( = ?auto_230630 ?auto_230631 ) ) ( not ( = ?auto_230630 ?auto_230632 ) ) ( not ( = ?auto_230630 ?auto_230633 ) ) ( not ( = ?auto_230630 ?auto_230634 ) ) ( not ( = ?auto_230630 ?auto_230635 ) ) ( not ( = ?auto_230630 ?auto_230636 ) ) ( not ( = ?auto_230630 ?auto_230637 ) ) ( not ( = ?auto_230631 ?auto_230632 ) ) ( not ( = ?auto_230631 ?auto_230633 ) ) ( not ( = ?auto_230631 ?auto_230634 ) ) ( not ( = ?auto_230631 ?auto_230635 ) ) ( not ( = ?auto_230631 ?auto_230636 ) ) ( not ( = ?auto_230631 ?auto_230637 ) ) ( not ( = ?auto_230632 ?auto_230633 ) ) ( not ( = ?auto_230632 ?auto_230634 ) ) ( not ( = ?auto_230632 ?auto_230635 ) ) ( not ( = ?auto_230632 ?auto_230636 ) ) ( not ( = ?auto_230632 ?auto_230637 ) ) ( not ( = ?auto_230633 ?auto_230634 ) ) ( not ( = ?auto_230633 ?auto_230635 ) ) ( not ( = ?auto_230633 ?auto_230636 ) ) ( not ( = ?auto_230633 ?auto_230637 ) ) ( not ( = ?auto_230634 ?auto_230635 ) ) ( not ( = ?auto_230634 ?auto_230636 ) ) ( not ( = ?auto_230634 ?auto_230637 ) ) ( not ( = ?auto_230635 ?auto_230636 ) ) ( not ( = ?auto_230635 ?auto_230637 ) ) ( not ( = ?auto_230636 ?auto_230637 ) ) ( ON ?auto_230635 ?auto_230636 ) ( ON ?auto_230634 ?auto_230635 ) ( ON ?auto_230633 ?auto_230634 ) ( ON ?auto_230632 ?auto_230633 ) ( ON ?auto_230631 ?auto_230632 ) ( CLEAR ?auto_230629 ) ( ON ?auto_230630 ?auto_230631 ) ( CLEAR ?auto_230630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230629 ?auto_230630 )
      ( MAKE-8PILE ?auto_230629 ?auto_230630 ?auto_230631 ?auto_230632 ?auto_230633 ?auto_230634 ?auto_230635 ?auto_230636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230646 - BLOCK
      ?auto_230647 - BLOCK
      ?auto_230648 - BLOCK
      ?auto_230649 - BLOCK
      ?auto_230650 - BLOCK
      ?auto_230651 - BLOCK
      ?auto_230652 - BLOCK
      ?auto_230653 - BLOCK
    )
    :vars
    (
      ?auto_230654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230653 ?auto_230654 ) ( not ( = ?auto_230646 ?auto_230647 ) ) ( not ( = ?auto_230646 ?auto_230648 ) ) ( not ( = ?auto_230646 ?auto_230649 ) ) ( not ( = ?auto_230646 ?auto_230650 ) ) ( not ( = ?auto_230646 ?auto_230651 ) ) ( not ( = ?auto_230646 ?auto_230652 ) ) ( not ( = ?auto_230646 ?auto_230653 ) ) ( not ( = ?auto_230646 ?auto_230654 ) ) ( not ( = ?auto_230647 ?auto_230648 ) ) ( not ( = ?auto_230647 ?auto_230649 ) ) ( not ( = ?auto_230647 ?auto_230650 ) ) ( not ( = ?auto_230647 ?auto_230651 ) ) ( not ( = ?auto_230647 ?auto_230652 ) ) ( not ( = ?auto_230647 ?auto_230653 ) ) ( not ( = ?auto_230647 ?auto_230654 ) ) ( not ( = ?auto_230648 ?auto_230649 ) ) ( not ( = ?auto_230648 ?auto_230650 ) ) ( not ( = ?auto_230648 ?auto_230651 ) ) ( not ( = ?auto_230648 ?auto_230652 ) ) ( not ( = ?auto_230648 ?auto_230653 ) ) ( not ( = ?auto_230648 ?auto_230654 ) ) ( not ( = ?auto_230649 ?auto_230650 ) ) ( not ( = ?auto_230649 ?auto_230651 ) ) ( not ( = ?auto_230649 ?auto_230652 ) ) ( not ( = ?auto_230649 ?auto_230653 ) ) ( not ( = ?auto_230649 ?auto_230654 ) ) ( not ( = ?auto_230650 ?auto_230651 ) ) ( not ( = ?auto_230650 ?auto_230652 ) ) ( not ( = ?auto_230650 ?auto_230653 ) ) ( not ( = ?auto_230650 ?auto_230654 ) ) ( not ( = ?auto_230651 ?auto_230652 ) ) ( not ( = ?auto_230651 ?auto_230653 ) ) ( not ( = ?auto_230651 ?auto_230654 ) ) ( not ( = ?auto_230652 ?auto_230653 ) ) ( not ( = ?auto_230652 ?auto_230654 ) ) ( not ( = ?auto_230653 ?auto_230654 ) ) ( ON ?auto_230652 ?auto_230653 ) ( ON ?auto_230651 ?auto_230652 ) ( ON ?auto_230650 ?auto_230651 ) ( ON ?auto_230649 ?auto_230650 ) ( ON ?auto_230648 ?auto_230649 ) ( ON ?auto_230647 ?auto_230648 ) ( ON ?auto_230646 ?auto_230647 ) ( CLEAR ?auto_230646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230646 )
      ( MAKE-8PILE ?auto_230646 ?auto_230647 ?auto_230648 ?auto_230649 ?auto_230650 ?auto_230651 ?auto_230652 ?auto_230653 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_230663 - BLOCK
      ?auto_230664 - BLOCK
      ?auto_230665 - BLOCK
      ?auto_230666 - BLOCK
      ?auto_230667 - BLOCK
      ?auto_230668 - BLOCK
      ?auto_230669 - BLOCK
      ?auto_230670 - BLOCK
    )
    :vars
    (
      ?auto_230671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230670 ?auto_230671 ) ( not ( = ?auto_230663 ?auto_230664 ) ) ( not ( = ?auto_230663 ?auto_230665 ) ) ( not ( = ?auto_230663 ?auto_230666 ) ) ( not ( = ?auto_230663 ?auto_230667 ) ) ( not ( = ?auto_230663 ?auto_230668 ) ) ( not ( = ?auto_230663 ?auto_230669 ) ) ( not ( = ?auto_230663 ?auto_230670 ) ) ( not ( = ?auto_230663 ?auto_230671 ) ) ( not ( = ?auto_230664 ?auto_230665 ) ) ( not ( = ?auto_230664 ?auto_230666 ) ) ( not ( = ?auto_230664 ?auto_230667 ) ) ( not ( = ?auto_230664 ?auto_230668 ) ) ( not ( = ?auto_230664 ?auto_230669 ) ) ( not ( = ?auto_230664 ?auto_230670 ) ) ( not ( = ?auto_230664 ?auto_230671 ) ) ( not ( = ?auto_230665 ?auto_230666 ) ) ( not ( = ?auto_230665 ?auto_230667 ) ) ( not ( = ?auto_230665 ?auto_230668 ) ) ( not ( = ?auto_230665 ?auto_230669 ) ) ( not ( = ?auto_230665 ?auto_230670 ) ) ( not ( = ?auto_230665 ?auto_230671 ) ) ( not ( = ?auto_230666 ?auto_230667 ) ) ( not ( = ?auto_230666 ?auto_230668 ) ) ( not ( = ?auto_230666 ?auto_230669 ) ) ( not ( = ?auto_230666 ?auto_230670 ) ) ( not ( = ?auto_230666 ?auto_230671 ) ) ( not ( = ?auto_230667 ?auto_230668 ) ) ( not ( = ?auto_230667 ?auto_230669 ) ) ( not ( = ?auto_230667 ?auto_230670 ) ) ( not ( = ?auto_230667 ?auto_230671 ) ) ( not ( = ?auto_230668 ?auto_230669 ) ) ( not ( = ?auto_230668 ?auto_230670 ) ) ( not ( = ?auto_230668 ?auto_230671 ) ) ( not ( = ?auto_230669 ?auto_230670 ) ) ( not ( = ?auto_230669 ?auto_230671 ) ) ( not ( = ?auto_230670 ?auto_230671 ) ) ( ON ?auto_230669 ?auto_230670 ) ( ON ?auto_230668 ?auto_230669 ) ( ON ?auto_230667 ?auto_230668 ) ( ON ?auto_230666 ?auto_230667 ) ( ON ?auto_230665 ?auto_230666 ) ( ON ?auto_230664 ?auto_230665 ) ( ON ?auto_230663 ?auto_230664 ) ( CLEAR ?auto_230663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230663 )
      ( MAKE-8PILE ?auto_230663 ?auto_230664 ?auto_230665 ?auto_230666 ?auto_230667 ?auto_230668 ?auto_230669 ?auto_230670 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230681 - BLOCK
      ?auto_230682 - BLOCK
      ?auto_230683 - BLOCK
      ?auto_230684 - BLOCK
      ?auto_230685 - BLOCK
      ?auto_230686 - BLOCK
      ?auto_230687 - BLOCK
      ?auto_230688 - BLOCK
      ?auto_230689 - BLOCK
    )
    :vars
    (
      ?auto_230690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230688 ) ( ON ?auto_230689 ?auto_230690 ) ( CLEAR ?auto_230689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230681 ) ( ON ?auto_230682 ?auto_230681 ) ( ON ?auto_230683 ?auto_230682 ) ( ON ?auto_230684 ?auto_230683 ) ( ON ?auto_230685 ?auto_230684 ) ( ON ?auto_230686 ?auto_230685 ) ( ON ?auto_230687 ?auto_230686 ) ( ON ?auto_230688 ?auto_230687 ) ( not ( = ?auto_230681 ?auto_230682 ) ) ( not ( = ?auto_230681 ?auto_230683 ) ) ( not ( = ?auto_230681 ?auto_230684 ) ) ( not ( = ?auto_230681 ?auto_230685 ) ) ( not ( = ?auto_230681 ?auto_230686 ) ) ( not ( = ?auto_230681 ?auto_230687 ) ) ( not ( = ?auto_230681 ?auto_230688 ) ) ( not ( = ?auto_230681 ?auto_230689 ) ) ( not ( = ?auto_230681 ?auto_230690 ) ) ( not ( = ?auto_230682 ?auto_230683 ) ) ( not ( = ?auto_230682 ?auto_230684 ) ) ( not ( = ?auto_230682 ?auto_230685 ) ) ( not ( = ?auto_230682 ?auto_230686 ) ) ( not ( = ?auto_230682 ?auto_230687 ) ) ( not ( = ?auto_230682 ?auto_230688 ) ) ( not ( = ?auto_230682 ?auto_230689 ) ) ( not ( = ?auto_230682 ?auto_230690 ) ) ( not ( = ?auto_230683 ?auto_230684 ) ) ( not ( = ?auto_230683 ?auto_230685 ) ) ( not ( = ?auto_230683 ?auto_230686 ) ) ( not ( = ?auto_230683 ?auto_230687 ) ) ( not ( = ?auto_230683 ?auto_230688 ) ) ( not ( = ?auto_230683 ?auto_230689 ) ) ( not ( = ?auto_230683 ?auto_230690 ) ) ( not ( = ?auto_230684 ?auto_230685 ) ) ( not ( = ?auto_230684 ?auto_230686 ) ) ( not ( = ?auto_230684 ?auto_230687 ) ) ( not ( = ?auto_230684 ?auto_230688 ) ) ( not ( = ?auto_230684 ?auto_230689 ) ) ( not ( = ?auto_230684 ?auto_230690 ) ) ( not ( = ?auto_230685 ?auto_230686 ) ) ( not ( = ?auto_230685 ?auto_230687 ) ) ( not ( = ?auto_230685 ?auto_230688 ) ) ( not ( = ?auto_230685 ?auto_230689 ) ) ( not ( = ?auto_230685 ?auto_230690 ) ) ( not ( = ?auto_230686 ?auto_230687 ) ) ( not ( = ?auto_230686 ?auto_230688 ) ) ( not ( = ?auto_230686 ?auto_230689 ) ) ( not ( = ?auto_230686 ?auto_230690 ) ) ( not ( = ?auto_230687 ?auto_230688 ) ) ( not ( = ?auto_230687 ?auto_230689 ) ) ( not ( = ?auto_230687 ?auto_230690 ) ) ( not ( = ?auto_230688 ?auto_230689 ) ) ( not ( = ?auto_230688 ?auto_230690 ) ) ( not ( = ?auto_230689 ?auto_230690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230689 ?auto_230690 )
      ( !STACK ?auto_230689 ?auto_230688 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230700 - BLOCK
      ?auto_230701 - BLOCK
      ?auto_230702 - BLOCK
      ?auto_230703 - BLOCK
      ?auto_230704 - BLOCK
      ?auto_230705 - BLOCK
      ?auto_230706 - BLOCK
      ?auto_230707 - BLOCK
      ?auto_230708 - BLOCK
    )
    :vars
    (
      ?auto_230709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_230707 ) ( ON ?auto_230708 ?auto_230709 ) ( CLEAR ?auto_230708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_230700 ) ( ON ?auto_230701 ?auto_230700 ) ( ON ?auto_230702 ?auto_230701 ) ( ON ?auto_230703 ?auto_230702 ) ( ON ?auto_230704 ?auto_230703 ) ( ON ?auto_230705 ?auto_230704 ) ( ON ?auto_230706 ?auto_230705 ) ( ON ?auto_230707 ?auto_230706 ) ( not ( = ?auto_230700 ?auto_230701 ) ) ( not ( = ?auto_230700 ?auto_230702 ) ) ( not ( = ?auto_230700 ?auto_230703 ) ) ( not ( = ?auto_230700 ?auto_230704 ) ) ( not ( = ?auto_230700 ?auto_230705 ) ) ( not ( = ?auto_230700 ?auto_230706 ) ) ( not ( = ?auto_230700 ?auto_230707 ) ) ( not ( = ?auto_230700 ?auto_230708 ) ) ( not ( = ?auto_230700 ?auto_230709 ) ) ( not ( = ?auto_230701 ?auto_230702 ) ) ( not ( = ?auto_230701 ?auto_230703 ) ) ( not ( = ?auto_230701 ?auto_230704 ) ) ( not ( = ?auto_230701 ?auto_230705 ) ) ( not ( = ?auto_230701 ?auto_230706 ) ) ( not ( = ?auto_230701 ?auto_230707 ) ) ( not ( = ?auto_230701 ?auto_230708 ) ) ( not ( = ?auto_230701 ?auto_230709 ) ) ( not ( = ?auto_230702 ?auto_230703 ) ) ( not ( = ?auto_230702 ?auto_230704 ) ) ( not ( = ?auto_230702 ?auto_230705 ) ) ( not ( = ?auto_230702 ?auto_230706 ) ) ( not ( = ?auto_230702 ?auto_230707 ) ) ( not ( = ?auto_230702 ?auto_230708 ) ) ( not ( = ?auto_230702 ?auto_230709 ) ) ( not ( = ?auto_230703 ?auto_230704 ) ) ( not ( = ?auto_230703 ?auto_230705 ) ) ( not ( = ?auto_230703 ?auto_230706 ) ) ( not ( = ?auto_230703 ?auto_230707 ) ) ( not ( = ?auto_230703 ?auto_230708 ) ) ( not ( = ?auto_230703 ?auto_230709 ) ) ( not ( = ?auto_230704 ?auto_230705 ) ) ( not ( = ?auto_230704 ?auto_230706 ) ) ( not ( = ?auto_230704 ?auto_230707 ) ) ( not ( = ?auto_230704 ?auto_230708 ) ) ( not ( = ?auto_230704 ?auto_230709 ) ) ( not ( = ?auto_230705 ?auto_230706 ) ) ( not ( = ?auto_230705 ?auto_230707 ) ) ( not ( = ?auto_230705 ?auto_230708 ) ) ( not ( = ?auto_230705 ?auto_230709 ) ) ( not ( = ?auto_230706 ?auto_230707 ) ) ( not ( = ?auto_230706 ?auto_230708 ) ) ( not ( = ?auto_230706 ?auto_230709 ) ) ( not ( = ?auto_230707 ?auto_230708 ) ) ( not ( = ?auto_230707 ?auto_230709 ) ) ( not ( = ?auto_230708 ?auto_230709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_230708 ?auto_230709 )
      ( !STACK ?auto_230708 ?auto_230707 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230719 - BLOCK
      ?auto_230720 - BLOCK
      ?auto_230721 - BLOCK
      ?auto_230722 - BLOCK
      ?auto_230723 - BLOCK
      ?auto_230724 - BLOCK
      ?auto_230725 - BLOCK
      ?auto_230726 - BLOCK
      ?auto_230727 - BLOCK
    )
    :vars
    (
      ?auto_230728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230727 ?auto_230728 ) ( ON-TABLE ?auto_230719 ) ( ON ?auto_230720 ?auto_230719 ) ( ON ?auto_230721 ?auto_230720 ) ( ON ?auto_230722 ?auto_230721 ) ( ON ?auto_230723 ?auto_230722 ) ( ON ?auto_230724 ?auto_230723 ) ( ON ?auto_230725 ?auto_230724 ) ( not ( = ?auto_230719 ?auto_230720 ) ) ( not ( = ?auto_230719 ?auto_230721 ) ) ( not ( = ?auto_230719 ?auto_230722 ) ) ( not ( = ?auto_230719 ?auto_230723 ) ) ( not ( = ?auto_230719 ?auto_230724 ) ) ( not ( = ?auto_230719 ?auto_230725 ) ) ( not ( = ?auto_230719 ?auto_230726 ) ) ( not ( = ?auto_230719 ?auto_230727 ) ) ( not ( = ?auto_230719 ?auto_230728 ) ) ( not ( = ?auto_230720 ?auto_230721 ) ) ( not ( = ?auto_230720 ?auto_230722 ) ) ( not ( = ?auto_230720 ?auto_230723 ) ) ( not ( = ?auto_230720 ?auto_230724 ) ) ( not ( = ?auto_230720 ?auto_230725 ) ) ( not ( = ?auto_230720 ?auto_230726 ) ) ( not ( = ?auto_230720 ?auto_230727 ) ) ( not ( = ?auto_230720 ?auto_230728 ) ) ( not ( = ?auto_230721 ?auto_230722 ) ) ( not ( = ?auto_230721 ?auto_230723 ) ) ( not ( = ?auto_230721 ?auto_230724 ) ) ( not ( = ?auto_230721 ?auto_230725 ) ) ( not ( = ?auto_230721 ?auto_230726 ) ) ( not ( = ?auto_230721 ?auto_230727 ) ) ( not ( = ?auto_230721 ?auto_230728 ) ) ( not ( = ?auto_230722 ?auto_230723 ) ) ( not ( = ?auto_230722 ?auto_230724 ) ) ( not ( = ?auto_230722 ?auto_230725 ) ) ( not ( = ?auto_230722 ?auto_230726 ) ) ( not ( = ?auto_230722 ?auto_230727 ) ) ( not ( = ?auto_230722 ?auto_230728 ) ) ( not ( = ?auto_230723 ?auto_230724 ) ) ( not ( = ?auto_230723 ?auto_230725 ) ) ( not ( = ?auto_230723 ?auto_230726 ) ) ( not ( = ?auto_230723 ?auto_230727 ) ) ( not ( = ?auto_230723 ?auto_230728 ) ) ( not ( = ?auto_230724 ?auto_230725 ) ) ( not ( = ?auto_230724 ?auto_230726 ) ) ( not ( = ?auto_230724 ?auto_230727 ) ) ( not ( = ?auto_230724 ?auto_230728 ) ) ( not ( = ?auto_230725 ?auto_230726 ) ) ( not ( = ?auto_230725 ?auto_230727 ) ) ( not ( = ?auto_230725 ?auto_230728 ) ) ( not ( = ?auto_230726 ?auto_230727 ) ) ( not ( = ?auto_230726 ?auto_230728 ) ) ( not ( = ?auto_230727 ?auto_230728 ) ) ( CLEAR ?auto_230725 ) ( ON ?auto_230726 ?auto_230727 ) ( CLEAR ?auto_230726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_230719 ?auto_230720 ?auto_230721 ?auto_230722 ?auto_230723 ?auto_230724 ?auto_230725 ?auto_230726 )
      ( MAKE-9PILE ?auto_230719 ?auto_230720 ?auto_230721 ?auto_230722 ?auto_230723 ?auto_230724 ?auto_230725 ?auto_230726 ?auto_230727 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230738 - BLOCK
      ?auto_230739 - BLOCK
      ?auto_230740 - BLOCK
      ?auto_230741 - BLOCK
      ?auto_230742 - BLOCK
      ?auto_230743 - BLOCK
      ?auto_230744 - BLOCK
      ?auto_230745 - BLOCK
      ?auto_230746 - BLOCK
    )
    :vars
    (
      ?auto_230747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230746 ?auto_230747 ) ( ON-TABLE ?auto_230738 ) ( ON ?auto_230739 ?auto_230738 ) ( ON ?auto_230740 ?auto_230739 ) ( ON ?auto_230741 ?auto_230740 ) ( ON ?auto_230742 ?auto_230741 ) ( ON ?auto_230743 ?auto_230742 ) ( ON ?auto_230744 ?auto_230743 ) ( not ( = ?auto_230738 ?auto_230739 ) ) ( not ( = ?auto_230738 ?auto_230740 ) ) ( not ( = ?auto_230738 ?auto_230741 ) ) ( not ( = ?auto_230738 ?auto_230742 ) ) ( not ( = ?auto_230738 ?auto_230743 ) ) ( not ( = ?auto_230738 ?auto_230744 ) ) ( not ( = ?auto_230738 ?auto_230745 ) ) ( not ( = ?auto_230738 ?auto_230746 ) ) ( not ( = ?auto_230738 ?auto_230747 ) ) ( not ( = ?auto_230739 ?auto_230740 ) ) ( not ( = ?auto_230739 ?auto_230741 ) ) ( not ( = ?auto_230739 ?auto_230742 ) ) ( not ( = ?auto_230739 ?auto_230743 ) ) ( not ( = ?auto_230739 ?auto_230744 ) ) ( not ( = ?auto_230739 ?auto_230745 ) ) ( not ( = ?auto_230739 ?auto_230746 ) ) ( not ( = ?auto_230739 ?auto_230747 ) ) ( not ( = ?auto_230740 ?auto_230741 ) ) ( not ( = ?auto_230740 ?auto_230742 ) ) ( not ( = ?auto_230740 ?auto_230743 ) ) ( not ( = ?auto_230740 ?auto_230744 ) ) ( not ( = ?auto_230740 ?auto_230745 ) ) ( not ( = ?auto_230740 ?auto_230746 ) ) ( not ( = ?auto_230740 ?auto_230747 ) ) ( not ( = ?auto_230741 ?auto_230742 ) ) ( not ( = ?auto_230741 ?auto_230743 ) ) ( not ( = ?auto_230741 ?auto_230744 ) ) ( not ( = ?auto_230741 ?auto_230745 ) ) ( not ( = ?auto_230741 ?auto_230746 ) ) ( not ( = ?auto_230741 ?auto_230747 ) ) ( not ( = ?auto_230742 ?auto_230743 ) ) ( not ( = ?auto_230742 ?auto_230744 ) ) ( not ( = ?auto_230742 ?auto_230745 ) ) ( not ( = ?auto_230742 ?auto_230746 ) ) ( not ( = ?auto_230742 ?auto_230747 ) ) ( not ( = ?auto_230743 ?auto_230744 ) ) ( not ( = ?auto_230743 ?auto_230745 ) ) ( not ( = ?auto_230743 ?auto_230746 ) ) ( not ( = ?auto_230743 ?auto_230747 ) ) ( not ( = ?auto_230744 ?auto_230745 ) ) ( not ( = ?auto_230744 ?auto_230746 ) ) ( not ( = ?auto_230744 ?auto_230747 ) ) ( not ( = ?auto_230745 ?auto_230746 ) ) ( not ( = ?auto_230745 ?auto_230747 ) ) ( not ( = ?auto_230746 ?auto_230747 ) ) ( CLEAR ?auto_230744 ) ( ON ?auto_230745 ?auto_230746 ) ( CLEAR ?auto_230745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_230738 ?auto_230739 ?auto_230740 ?auto_230741 ?auto_230742 ?auto_230743 ?auto_230744 ?auto_230745 )
      ( MAKE-9PILE ?auto_230738 ?auto_230739 ?auto_230740 ?auto_230741 ?auto_230742 ?auto_230743 ?auto_230744 ?auto_230745 ?auto_230746 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230757 - BLOCK
      ?auto_230758 - BLOCK
      ?auto_230759 - BLOCK
      ?auto_230760 - BLOCK
      ?auto_230761 - BLOCK
      ?auto_230762 - BLOCK
      ?auto_230763 - BLOCK
      ?auto_230764 - BLOCK
      ?auto_230765 - BLOCK
    )
    :vars
    (
      ?auto_230766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230765 ?auto_230766 ) ( ON-TABLE ?auto_230757 ) ( ON ?auto_230758 ?auto_230757 ) ( ON ?auto_230759 ?auto_230758 ) ( ON ?auto_230760 ?auto_230759 ) ( ON ?auto_230761 ?auto_230760 ) ( ON ?auto_230762 ?auto_230761 ) ( not ( = ?auto_230757 ?auto_230758 ) ) ( not ( = ?auto_230757 ?auto_230759 ) ) ( not ( = ?auto_230757 ?auto_230760 ) ) ( not ( = ?auto_230757 ?auto_230761 ) ) ( not ( = ?auto_230757 ?auto_230762 ) ) ( not ( = ?auto_230757 ?auto_230763 ) ) ( not ( = ?auto_230757 ?auto_230764 ) ) ( not ( = ?auto_230757 ?auto_230765 ) ) ( not ( = ?auto_230757 ?auto_230766 ) ) ( not ( = ?auto_230758 ?auto_230759 ) ) ( not ( = ?auto_230758 ?auto_230760 ) ) ( not ( = ?auto_230758 ?auto_230761 ) ) ( not ( = ?auto_230758 ?auto_230762 ) ) ( not ( = ?auto_230758 ?auto_230763 ) ) ( not ( = ?auto_230758 ?auto_230764 ) ) ( not ( = ?auto_230758 ?auto_230765 ) ) ( not ( = ?auto_230758 ?auto_230766 ) ) ( not ( = ?auto_230759 ?auto_230760 ) ) ( not ( = ?auto_230759 ?auto_230761 ) ) ( not ( = ?auto_230759 ?auto_230762 ) ) ( not ( = ?auto_230759 ?auto_230763 ) ) ( not ( = ?auto_230759 ?auto_230764 ) ) ( not ( = ?auto_230759 ?auto_230765 ) ) ( not ( = ?auto_230759 ?auto_230766 ) ) ( not ( = ?auto_230760 ?auto_230761 ) ) ( not ( = ?auto_230760 ?auto_230762 ) ) ( not ( = ?auto_230760 ?auto_230763 ) ) ( not ( = ?auto_230760 ?auto_230764 ) ) ( not ( = ?auto_230760 ?auto_230765 ) ) ( not ( = ?auto_230760 ?auto_230766 ) ) ( not ( = ?auto_230761 ?auto_230762 ) ) ( not ( = ?auto_230761 ?auto_230763 ) ) ( not ( = ?auto_230761 ?auto_230764 ) ) ( not ( = ?auto_230761 ?auto_230765 ) ) ( not ( = ?auto_230761 ?auto_230766 ) ) ( not ( = ?auto_230762 ?auto_230763 ) ) ( not ( = ?auto_230762 ?auto_230764 ) ) ( not ( = ?auto_230762 ?auto_230765 ) ) ( not ( = ?auto_230762 ?auto_230766 ) ) ( not ( = ?auto_230763 ?auto_230764 ) ) ( not ( = ?auto_230763 ?auto_230765 ) ) ( not ( = ?auto_230763 ?auto_230766 ) ) ( not ( = ?auto_230764 ?auto_230765 ) ) ( not ( = ?auto_230764 ?auto_230766 ) ) ( not ( = ?auto_230765 ?auto_230766 ) ) ( ON ?auto_230764 ?auto_230765 ) ( CLEAR ?auto_230762 ) ( ON ?auto_230763 ?auto_230764 ) ( CLEAR ?auto_230763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_230757 ?auto_230758 ?auto_230759 ?auto_230760 ?auto_230761 ?auto_230762 ?auto_230763 )
      ( MAKE-9PILE ?auto_230757 ?auto_230758 ?auto_230759 ?auto_230760 ?auto_230761 ?auto_230762 ?auto_230763 ?auto_230764 ?auto_230765 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230776 - BLOCK
      ?auto_230777 - BLOCK
      ?auto_230778 - BLOCK
      ?auto_230779 - BLOCK
      ?auto_230780 - BLOCK
      ?auto_230781 - BLOCK
      ?auto_230782 - BLOCK
      ?auto_230783 - BLOCK
      ?auto_230784 - BLOCK
    )
    :vars
    (
      ?auto_230785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230784 ?auto_230785 ) ( ON-TABLE ?auto_230776 ) ( ON ?auto_230777 ?auto_230776 ) ( ON ?auto_230778 ?auto_230777 ) ( ON ?auto_230779 ?auto_230778 ) ( ON ?auto_230780 ?auto_230779 ) ( ON ?auto_230781 ?auto_230780 ) ( not ( = ?auto_230776 ?auto_230777 ) ) ( not ( = ?auto_230776 ?auto_230778 ) ) ( not ( = ?auto_230776 ?auto_230779 ) ) ( not ( = ?auto_230776 ?auto_230780 ) ) ( not ( = ?auto_230776 ?auto_230781 ) ) ( not ( = ?auto_230776 ?auto_230782 ) ) ( not ( = ?auto_230776 ?auto_230783 ) ) ( not ( = ?auto_230776 ?auto_230784 ) ) ( not ( = ?auto_230776 ?auto_230785 ) ) ( not ( = ?auto_230777 ?auto_230778 ) ) ( not ( = ?auto_230777 ?auto_230779 ) ) ( not ( = ?auto_230777 ?auto_230780 ) ) ( not ( = ?auto_230777 ?auto_230781 ) ) ( not ( = ?auto_230777 ?auto_230782 ) ) ( not ( = ?auto_230777 ?auto_230783 ) ) ( not ( = ?auto_230777 ?auto_230784 ) ) ( not ( = ?auto_230777 ?auto_230785 ) ) ( not ( = ?auto_230778 ?auto_230779 ) ) ( not ( = ?auto_230778 ?auto_230780 ) ) ( not ( = ?auto_230778 ?auto_230781 ) ) ( not ( = ?auto_230778 ?auto_230782 ) ) ( not ( = ?auto_230778 ?auto_230783 ) ) ( not ( = ?auto_230778 ?auto_230784 ) ) ( not ( = ?auto_230778 ?auto_230785 ) ) ( not ( = ?auto_230779 ?auto_230780 ) ) ( not ( = ?auto_230779 ?auto_230781 ) ) ( not ( = ?auto_230779 ?auto_230782 ) ) ( not ( = ?auto_230779 ?auto_230783 ) ) ( not ( = ?auto_230779 ?auto_230784 ) ) ( not ( = ?auto_230779 ?auto_230785 ) ) ( not ( = ?auto_230780 ?auto_230781 ) ) ( not ( = ?auto_230780 ?auto_230782 ) ) ( not ( = ?auto_230780 ?auto_230783 ) ) ( not ( = ?auto_230780 ?auto_230784 ) ) ( not ( = ?auto_230780 ?auto_230785 ) ) ( not ( = ?auto_230781 ?auto_230782 ) ) ( not ( = ?auto_230781 ?auto_230783 ) ) ( not ( = ?auto_230781 ?auto_230784 ) ) ( not ( = ?auto_230781 ?auto_230785 ) ) ( not ( = ?auto_230782 ?auto_230783 ) ) ( not ( = ?auto_230782 ?auto_230784 ) ) ( not ( = ?auto_230782 ?auto_230785 ) ) ( not ( = ?auto_230783 ?auto_230784 ) ) ( not ( = ?auto_230783 ?auto_230785 ) ) ( not ( = ?auto_230784 ?auto_230785 ) ) ( ON ?auto_230783 ?auto_230784 ) ( CLEAR ?auto_230781 ) ( ON ?auto_230782 ?auto_230783 ) ( CLEAR ?auto_230782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_230776 ?auto_230777 ?auto_230778 ?auto_230779 ?auto_230780 ?auto_230781 ?auto_230782 )
      ( MAKE-9PILE ?auto_230776 ?auto_230777 ?auto_230778 ?auto_230779 ?auto_230780 ?auto_230781 ?auto_230782 ?auto_230783 ?auto_230784 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230795 - BLOCK
      ?auto_230796 - BLOCK
      ?auto_230797 - BLOCK
      ?auto_230798 - BLOCK
      ?auto_230799 - BLOCK
      ?auto_230800 - BLOCK
      ?auto_230801 - BLOCK
      ?auto_230802 - BLOCK
      ?auto_230803 - BLOCK
    )
    :vars
    (
      ?auto_230804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230803 ?auto_230804 ) ( ON-TABLE ?auto_230795 ) ( ON ?auto_230796 ?auto_230795 ) ( ON ?auto_230797 ?auto_230796 ) ( ON ?auto_230798 ?auto_230797 ) ( ON ?auto_230799 ?auto_230798 ) ( not ( = ?auto_230795 ?auto_230796 ) ) ( not ( = ?auto_230795 ?auto_230797 ) ) ( not ( = ?auto_230795 ?auto_230798 ) ) ( not ( = ?auto_230795 ?auto_230799 ) ) ( not ( = ?auto_230795 ?auto_230800 ) ) ( not ( = ?auto_230795 ?auto_230801 ) ) ( not ( = ?auto_230795 ?auto_230802 ) ) ( not ( = ?auto_230795 ?auto_230803 ) ) ( not ( = ?auto_230795 ?auto_230804 ) ) ( not ( = ?auto_230796 ?auto_230797 ) ) ( not ( = ?auto_230796 ?auto_230798 ) ) ( not ( = ?auto_230796 ?auto_230799 ) ) ( not ( = ?auto_230796 ?auto_230800 ) ) ( not ( = ?auto_230796 ?auto_230801 ) ) ( not ( = ?auto_230796 ?auto_230802 ) ) ( not ( = ?auto_230796 ?auto_230803 ) ) ( not ( = ?auto_230796 ?auto_230804 ) ) ( not ( = ?auto_230797 ?auto_230798 ) ) ( not ( = ?auto_230797 ?auto_230799 ) ) ( not ( = ?auto_230797 ?auto_230800 ) ) ( not ( = ?auto_230797 ?auto_230801 ) ) ( not ( = ?auto_230797 ?auto_230802 ) ) ( not ( = ?auto_230797 ?auto_230803 ) ) ( not ( = ?auto_230797 ?auto_230804 ) ) ( not ( = ?auto_230798 ?auto_230799 ) ) ( not ( = ?auto_230798 ?auto_230800 ) ) ( not ( = ?auto_230798 ?auto_230801 ) ) ( not ( = ?auto_230798 ?auto_230802 ) ) ( not ( = ?auto_230798 ?auto_230803 ) ) ( not ( = ?auto_230798 ?auto_230804 ) ) ( not ( = ?auto_230799 ?auto_230800 ) ) ( not ( = ?auto_230799 ?auto_230801 ) ) ( not ( = ?auto_230799 ?auto_230802 ) ) ( not ( = ?auto_230799 ?auto_230803 ) ) ( not ( = ?auto_230799 ?auto_230804 ) ) ( not ( = ?auto_230800 ?auto_230801 ) ) ( not ( = ?auto_230800 ?auto_230802 ) ) ( not ( = ?auto_230800 ?auto_230803 ) ) ( not ( = ?auto_230800 ?auto_230804 ) ) ( not ( = ?auto_230801 ?auto_230802 ) ) ( not ( = ?auto_230801 ?auto_230803 ) ) ( not ( = ?auto_230801 ?auto_230804 ) ) ( not ( = ?auto_230802 ?auto_230803 ) ) ( not ( = ?auto_230802 ?auto_230804 ) ) ( not ( = ?auto_230803 ?auto_230804 ) ) ( ON ?auto_230802 ?auto_230803 ) ( ON ?auto_230801 ?auto_230802 ) ( CLEAR ?auto_230799 ) ( ON ?auto_230800 ?auto_230801 ) ( CLEAR ?auto_230800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_230795 ?auto_230796 ?auto_230797 ?auto_230798 ?auto_230799 ?auto_230800 )
      ( MAKE-9PILE ?auto_230795 ?auto_230796 ?auto_230797 ?auto_230798 ?auto_230799 ?auto_230800 ?auto_230801 ?auto_230802 ?auto_230803 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230814 - BLOCK
      ?auto_230815 - BLOCK
      ?auto_230816 - BLOCK
      ?auto_230817 - BLOCK
      ?auto_230818 - BLOCK
      ?auto_230819 - BLOCK
      ?auto_230820 - BLOCK
      ?auto_230821 - BLOCK
      ?auto_230822 - BLOCK
    )
    :vars
    (
      ?auto_230823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230822 ?auto_230823 ) ( ON-TABLE ?auto_230814 ) ( ON ?auto_230815 ?auto_230814 ) ( ON ?auto_230816 ?auto_230815 ) ( ON ?auto_230817 ?auto_230816 ) ( ON ?auto_230818 ?auto_230817 ) ( not ( = ?auto_230814 ?auto_230815 ) ) ( not ( = ?auto_230814 ?auto_230816 ) ) ( not ( = ?auto_230814 ?auto_230817 ) ) ( not ( = ?auto_230814 ?auto_230818 ) ) ( not ( = ?auto_230814 ?auto_230819 ) ) ( not ( = ?auto_230814 ?auto_230820 ) ) ( not ( = ?auto_230814 ?auto_230821 ) ) ( not ( = ?auto_230814 ?auto_230822 ) ) ( not ( = ?auto_230814 ?auto_230823 ) ) ( not ( = ?auto_230815 ?auto_230816 ) ) ( not ( = ?auto_230815 ?auto_230817 ) ) ( not ( = ?auto_230815 ?auto_230818 ) ) ( not ( = ?auto_230815 ?auto_230819 ) ) ( not ( = ?auto_230815 ?auto_230820 ) ) ( not ( = ?auto_230815 ?auto_230821 ) ) ( not ( = ?auto_230815 ?auto_230822 ) ) ( not ( = ?auto_230815 ?auto_230823 ) ) ( not ( = ?auto_230816 ?auto_230817 ) ) ( not ( = ?auto_230816 ?auto_230818 ) ) ( not ( = ?auto_230816 ?auto_230819 ) ) ( not ( = ?auto_230816 ?auto_230820 ) ) ( not ( = ?auto_230816 ?auto_230821 ) ) ( not ( = ?auto_230816 ?auto_230822 ) ) ( not ( = ?auto_230816 ?auto_230823 ) ) ( not ( = ?auto_230817 ?auto_230818 ) ) ( not ( = ?auto_230817 ?auto_230819 ) ) ( not ( = ?auto_230817 ?auto_230820 ) ) ( not ( = ?auto_230817 ?auto_230821 ) ) ( not ( = ?auto_230817 ?auto_230822 ) ) ( not ( = ?auto_230817 ?auto_230823 ) ) ( not ( = ?auto_230818 ?auto_230819 ) ) ( not ( = ?auto_230818 ?auto_230820 ) ) ( not ( = ?auto_230818 ?auto_230821 ) ) ( not ( = ?auto_230818 ?auto_230822 ) ) ( not ( = ?auto_230818 ?auto_230823 ) ) ( not ( = ?auto_230819 ?auto_230820 ) ) ( not ( = ?auto_230819 ?auto_230821 ) ) ( not ( = ?auto_230819 ?auto_230822 ) ) ( not ( = ?auto_230819 ?auto_230823 ) ) ( not ( = ?auto_230820 ?auto_230821 ) ) ( not ( = ?auto_230820 ?auto_230822 ) ) ( not ( = ?auto_230820 ?auto_230823 ) ) ( not ( = ?auto_230821 ?auto_230822 ) ) ( not ( = ?auto_230821 ?auto_230823 ) ) ( not ( = ?auto_230822 ?auto_230823 ) ) ( ON ?auto_230821 ?auto_230822 ) ( ON ?auto_230820 ?auto_230821 ) ( CLEAR ?auto_230818 ) ( ON ?auto_230819 ?auto_230820 ) ( CLEAR ?auto_230819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_230814 ?auto_230815 ?auto_230816 ?auto_230817 ?auto_230818 ?auto_230819 )
      ( MAKE-9PILE ?auto_230814 ?auto_230815 ?auto_230816 ?auto_230817 ?auto_230818 ?auto_230819 ?auto_230820 ?auto_230821 ?auto_230822 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230833 - BLOCK
      ?auto_230834 - BLOCK
      ?auto_230835 - BLOCK
      ?auto_230836 - BLOCK
      ?auto_230837 - BLOCK
      ?auto_230838 - BLOCK
      ?auto_230839 - BLOCK
      ?auto_230840 - BLOCK
      ?auto_230841 - BLOCK
    )
    :vars
    (
      ?auto_230842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230841 ?auto_230842 ) ( ON-TABLE ?auto_230833 ) ( ON ?auto_230834 ?auto_230833 ) ( ON ?auto_230835 ?auto_230834 ) ( ON ?auto_230836 ?auto_230835 ) ( not ( = ?auto_230833 ?auto_230834 ) ) ( not ( = ?auto_230833 ?auto_230835 ) ) ( not ( = ?auto_230833 ?auto_230836 ) ) ( not ( = ?auto_230833 ?auto_230837 ) ) ( not ( = ?auto_230833 ?auto_230838 ) ) ( not ( = ?auto_230833 ?auto_230839 ) ) ( not ( = ?auto_230833 ?auto_230840 ) ) ( not ( = ?auto_230833 ?auto_230841 ) ) ( not ( = ?auto_230833 ?auto_230842 ) ) ( not ( = ?auto_230834 ?auto_230835 ) ) ( not ( = ?auto_230834 ?auto_230836 ) ) ( not ( = ?auto_230834 ?auto_230837 ) ) ( not ( = ?auto_230834 ?auto_230838 ) ) ( not ( = ?auto_230834 ?auto_230839 ) ) ( not ( = ?auto_230834 ?auto_230840 ) ) ( not ( = ?auto_230834 ?auto_230841 ) ) ( not ( = ?auto_230834 ?auto_230842 ) ) ( not ( = ?auto_230835 ?auto_230836 ) ) ( not ( = ?auto_230835 ?auto_230837 ) ) ( not ( = ?auto_230835 ?auto_230838 ) ) ( not ( = ?auto_230835 ?auto_230839 ) ) ( not ( = ?auto_230835 ?auto_230840 ) ) ( not ( = ?auto_230835 ?auto_230841 ) ) ( not ( = ?auto_230835 ?auto_230842 ) ) ( not ( = ?auto_230836 ?auto_230837 ) ) ( not ( = ?auto_230836 ?auto_230838 ) ) ( not ( = ?auto_230836 ?auto_230839 ) ) ( not ( = ?auto_230836 ?auto_230840 ) ) ( not ( = ?auto_230836 ?auto_230841 ) ) ( not ( = ?auto_230836 ?auto_230842 ) ) ( not ( = ?auto_230837 ?auto_230838 ) ) ( not ( = ?auto_230837 ?auto_230839 ) ) ( not ( = ?auto_230837 ?auto_230840 ) ) ( not ( = ?auto_230837 ?auto_230841 ) ) ( not ( = ?auto_230837 ?auto_230842 ) ) ( not ( = ?auto_230838 ?auto_230839 ) ) ( not ( = ?auto_230838 ?auto_230840 ) ) ( not ( = ?auto_230838 ?auto_230841 ) ) ( not ( = ?auto_230838 ?auto_230842 ) ) ( not ( = ?auto_230839 ?auto_230840 ) ) ( not ( = ?auto_230839 ?auto_230841 ) ) ( not ( = ?auto_230839 ?auto_230842 ) ) ( not ( = ?auto_230840 ?auto_230841 ) ) ( not ( = ?auto_230840 ?auto_230842 ) ) ( not ( = ?auto_230841 ?auto_230842 ) ) ( ON ?auto_230840 ?auto_230841 ) ( ON ?auto_230839 ?auto_230840 ) ( ON ?auto_230838 ?auto_230839 ) ( CLEAR ?auto_230836 ) ( ON ?auto_230837 ?auto_230838 ) ( CLEAR ?auto_230837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230833 ?auto_230834 ?auto_230835 ?auto_230836 ?auto_230837 )
      ( MAKE-9PILE ?auto_230833 ?auto_230834 ?auto_230835 ?auto_230836 ?auto_230837 ?auto_230838 ?auto_230839 ?auto_230840 ?auto_230841 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230852 - BLOCK
      ?auto_230853 - BLOCK
      ?auto_230854 - BLOCK
      ?auto_230855 - BLOCK
      ?auto_230856 - BLOCK
      ?auto_230857 - BLOCK
      ?auto_230858 - BLOCK
      ?auto_230859 - BLOCK
      ?auto_230860 - BLOCK
    )
    :vars
    (
      ?auto_230861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230860 ?auto_230861 ) ( ON-TABLE ?auto_230852 ) ( ON ?auto_230853 ?auto_230852 ) ( ON ?auto_230854 ?auto_230853 ) ( ON ?auto_230855 ?auto_230854 ) ( not ( = ?auto_230852 ?auto_230853 ) ) ( not ( = ?auto_230852 ?auto_230854 ) ) ( not ( = ?auto_230852 ?auto_230855 ) ) ( not ( = ?auto_230852 ?auto_230856 ) ) ( not ( = ?auto_230852 ?auto_230857 ) ) ( not ( = ?auto_230852 ?auto_230858 ) ) ( not ( = ?auto_230852 ?auto_230859 ) ) ( not ( = ?auto_230852 ?auto_230860 ) ) ( not ( = ?auto_230852 ?auto_230861 ) ) ( not ( = ?auto_230853 ?auto_230854 ) ) ( not ( = ?auto_230853 ?auto_230855 ) ) ( not ( = ?auto_230853 ?auto_230856 ) ) ( not ( = ?auto_230853 ?auto_230857 ) ) ( not ( = ?auto_230853 ?auto_230858 ) ) ( not ( = ?auto_230853 ?auto_230859 ) ) ( not ( = ?auto_230853 ?auto_230860 ) ) ( not ( = ?auto_230853 ?auto_230861 ) ) ( not ( = ?auto_230854 ?auto_230855 ) ) ( not ( = ?auto_230854 ?auto_230856 ) ) ( not ( = ?auto_230854 ?auto_230857 ) ) ( not ( = ?auto_230854 ?auto_230858 ) ) ( not ( = ?auto_230854 ?auto_230859 ) ) ( not ( = ?auto_230854 ?auto_230860 ) ) ( not ( = ?auto_230854 ?auto_230861 ) ) ( not ( = ?auto_230855 ?auto_230856 ) ) ( not ( = ?auto_230855 ?auto_230857 ) ) ( not ( = ?auto_230855 ?auto_230858 ) ) ( not ( = ?auto_230855 ?auto_230859 ) ) ( not ( = ?auto_230855 ?auto_230860 ) ) ( not ( = ?auto_230855 ?auto_230861 ) ) ( not ( = ?auto_230856 ?auto_230857 ) ) ( not ( = ?auto_230856 ?auto_230858 ) ) ( not ( = ?auto_230856 ?auto_230859 ) ) ( not ( = ?auto_230856 ?auto_230860 ) ) ( not ( = ?auto_230856 ?auto_230861 ) ) ( not ( = ?auto_230857 ?auto_230858 ) ) ( not ( = ?auto_230857 ?auto_230859 ) ) ( not ( = ?auto_230857 ?auto_230860 ) ) ( not ( = ?auto_230857 ?auto_230861 ) ) ( not ( = ?auto_230858 ?auto_230859 ) ) ( not ( = ?auto_230858 ?auto_230860 ) ) ( not ( = ?auto_230858 ?auto_230861 ) ) ( not ( = ?auto_230859 ?auto_230860 ) ) ( not ( = ?auto_230859 ?auto_230861 ) ) ( not ( = ?auto_230860 ?auto_230861 ) ) ( ON ?auto_230859 ?auto_230860 ) ( ON ?auto_230858 ?auto_230859 ) ( ON ?auto_230857 ?auto_230858 ) ( CLEAR ?auto_230855 ) ( ON ?auto_230856 ?auto_230857 ) ( CLEAR ?auto_230856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_230852 ?auto_230853 ?auto_230854 ?auto_230855 ?auto_230856 )
      ( MAKE-9PILE ?auto_230852 ?auto_230853 ?auto_230854 ?auto_230855 ?auto_230856 ?auto_230857 ?auto_230858 ?auto_230859 ?auto_230860 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230871 - BLOCK
      ?auto_230872 - BLOCK
      ?auto_230873 - BLOCK
      ?auto_230874 - BLOCK
      ?auto_230875 - BLOCK
      ?auto_230876 - BLOCK
      ?auto_230877 - BLOCK
      ?auto_230878 - BLOCK
      ?auto_230879 - BLOCK
    )
    :vars
    (
      ?auto_230880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230879 ?auto_230880 ) ( ON-TABLE ?auto_230871 ) ( ON ?auto_230872 ?auto_230871 ) ( ON ?auto_230873 ?auto_230872 ) ( not ( = ?auto_230871 ?auto_230872 ) ) ( not ( = ?auto_230871 ?auto_230873 ) ) ( not ( = ?auto_230871 ?auto_230874 ) ) ( not ( = ?auto_230871 ?auto_230875 ) ) ( not ( = ?auto_230871 ?auto_230876 ) ) ( not ( = ?auto_230871 ?auto_230877 ) ) ( not ( = ?auto_230871 ?auto_230878 ) ) ( not ( = ?auto_230871 ?auto_230879 ) ) ( not ( = ?auto_230871 ?auto_230880 ) ) ( not ( = ?auto_230872 ?auto_230873 ) ) ( not ( = ?auto_230872 ?auto_230874 ) ) ( not ( = ?auto_230872 ?auto_230875 ) ) ( not ( = ?auto_230872 ?auto_230876 ) ) ( not ( = ?auto_230872 ?auto_230877 ) ) ( not ( = ?auto_230872 ?auto_230878 ) ) ( not ( = ?auto_230872 ?auto_230879 ) ) ( not ( = ?auto_230872 ?auto_230880 ) ) ( not ( = ?auto_230873 ?auto_230874 ) ) ( not ( = ?auto_230873 ?auto_230875 ) ) ( not ( = ?auto_230873 ?auto_230876 ) ) ( not ( = ?auto_230873 ?auto_230877 ) ) ( not ( = ?auto_230873 ?auto_230878 ) ) ( not ( = ?auto_230873 ?auto_230879 ) ) ( not ( = ?auto_230873 ?auto_230880 ) ) ( not ( = ?auto_230874 ?auto_230875 ) ) ( not ( = ?auto_230874 ?auto_230876 ) ) ( not ( = ?auto_230874 ?auto_230877 ) ) ( not ( = ?auto_230874 ?auto_230878 ) ) ( not ( = ?auto_230874 ?auto_230879 ) ) ( not ( = ?auto_230874 ?auto_230880 ) ) ( not ( = ?auto_230875 ?auto_230876 ) ) ( not ( = ?auto_230875 ?auto_230877 ) ) ( not ( = ?auto_230875 ?auto_230878 ) ) ( not ( = ?auto_230875 ?auto_230879 ) ) ( not ( = ?auto_230875 ?auto_230880 ) ) ( not ( = ?auto_230876 ?auto_230877 ) ) ( not ( = ?auto_230876 ?auto_230878 ) ) ( not ( = ?auto_230876 ?auto_230879 ) ) ( not ( = ?auto_230876 ?auto_230880 ) ) ( not ( = ?auto_230877 ?auto_230878 ) ) ( not ( = ?auto_230877 ?auto_230879 ) ) ( not ( = ?auto_230877 ?auto_230880 ) ) ( not ( = ?auto_230878 ?auto_230879 ) ) ( not ( = ?auto_230878 ?auto_230880 ) ) ( not ( = ?auto_230879 ?auto_230880 ) ) ( ON ?auto_230878 ?auto_230879 ) ( ON ?auto_230877 ?auto_230878 ) ( ON ?auto_230876 ?auto_230877 ) ( ON ?auto_230875 ?auto_230876 ) ( CLEAR ?auto_230873 ) ( ON ?auto_230874 ?auto_230875 ) ( CLEAR ?auto_230874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230871 ?auto_230872 ?auto_230873 ?auto_230874 )
      ( MAKE-9PILE ?auto_230871 ?auto_230872 ?auto_230873 ?auto_230874 ?auto_230875 ?auto_230876 ?auto_230877 ?auto_230878 ?auto_230879 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230890 - BLOCK
      ?auto_230891 - BLOCK
      ?auto_230892 - BLOCK
      ?auto_230893 - BLOCK
      ?auto_230894 - BLOCK
      ?auto_230895 - BLOCK
      ?auto_230896 - BLOCK
      ?auto_230897 - BLOCK
      ?auto_230898 - BLOCK
    )
    :vars
    (
      ?auto_230899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230898 ?auto_230899 ) ( ON-TABLE ?auto_230890 ) ( ON ?auto_230891 ?auto_230890 ) ( ON ?auto_230892 ?auto_230891 ) ( not ( = ?auto_230890 ?auto_230891 ) ) ( not ( = ?auto_230890 ?auto_230892 ) ) ( not ( = ?auto_230890 ?auto_230893 ) ) ( not ( = ?auto_230890 ?auto_230894 ) ) ( not ( = ?auto_230890 ?auto_230895 ) ) ( not ( = ?auto_230890 ?auto_230896 ) ) ( not ( = ?auto_230890 ?auto_230897 ) ) ( not ( = ?auto_230890 ?auto_230898 ) ) ( not ( = ?auto_230890 ?auto_230899 ) ) ( not ( = ?auto_230891 ?auto_230892 ) ) ( not ( = ?auto_230891 ?auto_230893 ) ) ( not ( = ?auto_230891 ?auto_230894 ) ) ( not ( = ?auto_230891 ?auto_230895 ) ) ( not ( = ?auto_230891 ?auto_230896 ) ) ( not ( = ?auto_230891 ?auto_230897 ) ) ( not ( = ?auto_230891 ?auto_230898 ) ) ( not ( = ?auto_230891 ?auto_230899 ) ) ( not ( = ?auto_230892 ?auto_230893 ) ) ( not ( = ?auto_230892 ?auto_230894 ) ) ( not ( = ?auto_230892 ?auto_230895 ) ) ( not ( = ?auto_230892 ?auto_230896 ) ) ( not ( = ?auto_230892 ?auto_230897 ) ) ( not ( = ?auto_230892 ?auto_230898 ) ) ( not ( = ?auto_230892 ?auto_230899 ) ) ( not ( = ?auto_230893 ?auto_230894 ) ) ( not ( = ?auto_230893 ?auto_230895 ) ) ( not ( = ?auto_230893 ?auto_230896 ) ) ( not ( = ?auto_230893 ?auto_230897 ) ) ( not ( = ?auto_230893 ?auto_230898 ) ) ( not ( = ?auto_230893 ?auto_230899 ) ) ( not ( = ?auto_230894 ?auto_230895 ) ) ( not ( = ?auto_230894 ?auto_230896 ) ) ( not ( = ?auto_230894 ?auto_230897 ) ) ( not ( = ?auto_230894 ?auto_230898 ) ) ( not ( = ?auto_230894 ?auto_230899 ) ) ( not ( = ?auto_230895 ?auto_230896 ) ) ( not ( = ?auto_230895 ?auto_230897 ) ) ( not ( = ?auto_230895 ?auto_230898 ) ) ( not ( = ?auto_230895 ?auto_230899 ) ) ( not ( = ?auto_230896 ?auto_230897 ) ) ( not ( = ?auto_230896 ?auto_230898 ) ) ( not ( = ?auto_230896 ?auto_230899 ) ) ( not ( = ?auto_230897 ?auto_230898 ) ) ( not ( = ?auto_230897 ?auto_230899 ) ) ( not ( = ?auto_230898 ?auto_230899 ) ) ( ON ?auto_230897 ?auto_230898 ) ( ON ?auto_230896 ?auto_230897 ) ( ON ?auto_230895 ?auto_230896 ) ( ON ?auto_230894 ?auto_230895 ) ( CLEAR ?auto_230892 ) ( ON ?auto_230893 ?auto_230894 ) ( CLEAR ?auto_230893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_230890 ?auto_230891 ?auto_230892 ?auto_230893 )
      ( MAKE-9PILE ?auto_230890 ?auto_230891 ?auto_230892 ?auto_230893 ?auto_230894 ?auto_230895 ?auto_230896 ?auto_230897 ?auto_230898 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230909 - BLOCK
      ?auto_230910 - BLOCK
      ?auto_230911 - BLOCK
      ?auto_230912 - BLOCK
      ?auto_230913 - BLOCK
      ?auto_230914 - BLOCK
      ?auto_230915 - BLOCK
      ?auto_230916 - BLOCK
      ?auto_230917 - BLOCK
    )
    :vars
    (
      ?auto_230918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230917 ?auto_230918 ) ( ON-TABLE ?auto_230909 ) ( ON ?auto_230910 ?auto_230909 ) ( not ( = ?auto_230909 ?auto_230910 ) ) ( not ( = ?auto_230909 ?auto_230911 ) ) ( not ( = ?auto_230909 ?auto_230912 ) ) ( not ( = ?auto_230909 ?auto_230913 ) ) ( not ( = ?auto_230909 ?auto_230914 ) ) ( not ( = ?auto_230909 ?auto_230915 ) ) ( not ( = ?auto_230909 ?auto_230916 ) ) ( not ( = ?auto_230909 ?auto_230917 ) ) ( not ( = ?auto_230909 ?auto_230918 ) ) ( not ( = ?auto_230910 ?auto_230911 ) ) ( not ( = ?auto_230910 ?auto_230912 ) ) ( not ( = ?auto_230910 ?auto_230913 ) ) ( not ( = ?auto_230910 ?auto_230914 ) ) ( not ( = ?auto_230910 ?auto_230915 ) ) ( not ( = ?auto_230910 ?auto_230916 ) ) ( not ( = ?auto_230910 ?auto_230917 ) ) ( not ( = ?auto_230910 ?auto_230918 ) ) ( not ( = ?auto_230911 ?auto_230912 ) ) ( not ( = ?auto_230911 ?auto_230913 ) ) ( not ( = ?auto_230911 ?auto_230914 ) ) ( not ( = ?auto_230911 ?auto_230915 ) ) ( not ( = ?auto_230911 ?auto_230916 ) ) ( not ( = ?auto_230911 ?auto_230917 ) ) ( not ( = ?auto_230911 ?auto_230918 ) ) ( not ( = ?auto_230912 ?auto_230913 ) ) ( not ( = ?auto_230912 ?auto_230914 ) ) ( not ( = ?auto_230912 ?auto_230915 ) ) ( not ( = ?auto_230912 ?auto_230916 ) ) ( not ( = ?auto_230912 ?auto_230917 ) ) ( not ( = ?auto_230912 ?auto_230918 ) ) ( not ( = ?auto_230913 ?auto_230914 ) ) ( not ( = ?auto_230913 ?auto_230915 ) ) ( not ( = ?auto_230913 ?auto_230916 ) ) ( not ( = ?auto_230913 ?auto_230917 ) ) ( not ( = ?auto_230913 ?auto_230918 ) ) ( not ( = ?auto_230914 ?auto_230915 ) ) ( not ( = ?auto_230914 ?auto_230916 ) ) ( not ( = ?auto_230914 ?auto_230917 ) ) ( not ( = ?auto_230914 ?auto_230918 ) ) ( not ( = ?auto_230915 ?auto_230916 ) ) ( not ( = ?auto_230915 ?auto_230917 ) ) ( not ( = ?auto_230915 ?auto_230918 ) ) ( not ( = ?auto_230916 ?auto_230917 ) ) ( not ( = ?auto_230916 ?auto_230918 ) ) ( not ( = ?auto_230917 ?auto_230918 ) ) ( ON ?auto_230916 ?auto_230917 ) ( ON ?auto_230915 ?auto_230916 ) ( ON ?auto_230914 ?auto_230915 ) ( ON ?auto_230913 ?auto_230914 ) ( ON ?auto_230912 ?auto_230913 ) ( CLEAR ?auto_230910 ) ( ON ?auto_230911 ?auto_230912 ) ( CLEAR ?auto_230911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230909 ?auto_230910 ?auto_230911 )
      ( MAKE-9PILE ?auto_230909 ?auto_230910 ?auto_230911 ?auto_230912 ?auto_230913 ?auto_230914 ?auto_230915 ?auto_230916 ?auto_230917 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230928 - BLOCK
      ?auto_230929 - BLOCK
      ?auto_230930 - BLOCK
      ?auto_230931 - BLOCK
      ?auto_230932 - BLOCK
      ?auto_230933 - BLOCK
      ?auto_230934 - BLOCK
      ?auto_230935 - BLOCK
      ?auto_230936 - BLOCK
    )
    :vars
    (
      ?auto_230937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230936 ?auto_230937 ) ( ON-TABLE ?auto_230928 ) ( ON ?auto_230929 ?auto_230928 ) ( not ( = ?auto_230928 ?auto_230929 ) ) ( not ( = ?auto_230928 ?auto_230930 ) ) ( not ( = ?auto_230928 ?auto_230931 ) ) ( not ( = ?auto_230928 ?auto_230932 ) ) ( not ( = ?auto_230928 ?auto_230933 ) ) ( not ( = ?auto_230928 ?auto_230934 ) ) ( not ( = ?auto_230928 ?auto_230935 ) ) ( not ( = ?auto_230928 ?auto_230936 ) ) ( not ( = ?auto_230928 ?auto_230937 ) ) ( not ( = ?auto_230929 ?auto_230930 ) ) ( not ( = ?auto_230929 ?auto_230931 ) ) ( not ( = ?auto_230929 ?auto_230932 ) ) ( not ( = ?auto_230929 ?auto_230933 ) ) ( not ( = ?auto_230929 ?auto_230934 ) ) ( not ( = ?auto_230929 ?auto_230935 ) ) ( not ( = ?auto_230929 ?auto_230936 ) ) ( not ( = ?auto_230929 ?auto_230937 ) ) ( not ( = ?auto_230930 ?auto_230931 ) ) ( not ( = ?auto_230930 ?auto_230932 ) ) ( not ( = ?auto_230930 ?auto_230933 ) ) ( not ( = ?auto_230930 ?auto_230934 ) ) ( not ( = ?auto_230930 ?auto_230935 ) ) ( not ( = ?auto_230930 ?auto_230936 ) ) ( not ( = ?auto_230930 ?auto_230937 ) ) ( not ( = ?auto_230931 ?auto_230932 ) ) ( not ( = ?auto_230931 ?auto_230933 ) ) ( not ( = ?auto_230931 ?auto_230934 ) ) ( not ( = ?auto_230931 ?auto_230935 ) ) ( not ( = ?auto_230931 ?auto_230936 ) ) ( not ( = ?auto_230931 ?auto_230937 ) ) ( not ( = ?auto_230932 ?auto_230933 ) ) ( not ( = ?auto_230932 ?auto_230934 ) ) ( not ( = ?auto_230932 ?auto_230935 ) ) ( not ( = ?auto_230932 ?auto_230936 ) ) ( not ( = ?auto_230932 ?auto_230937 ) ) ( not ( = ?auto_230933 ?auto_230934 ) ) ( not ( = ?auto_230933 ?auto_230935 ) ) ( not ( = ?auto_230933 ?auto_230936 ) ) ( not ( = ?auto_230933 ?auto_230937 ) ) ( not ( = ?auto_230934 ?auto_230935 ) ) ( not ( = ?auto_230934 ?auto_230936 ) ) ( not ( = ?auto_230934 ?auto_230937 ) ) ( not ( = ?auto_230935 ?auto_230936 ) ) ( not ( = ?auto_230935 ?auto_230937 ) ) ( not ( = ?auto_230936 ?auto_230937 ) ) ( ON ?auto_230935 ?auto_230936 ) ( ON ?auto_230934 ?auto_230935 ) ( ON ?auto_230933 ?auto_230934 ) ( ON ?auto_230932 ?auto_230933 ) ( ON ?auto_230931 ?auto_230932 ) ( CLEAR ?auto_230929 ) ( ON ?auto_230930 ?auto_230931 ) ( CLEAR ?auto_230930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_230928 ?auto_230929 ?auto_230930 )
      ( MAKE-9PILE ?auto_230928 ?auto_230929 ?auto_230930 ?auto_230931 ?auto_230932 ?auto_230933 ?auto_230934 ?auto_230935 ?auto_230936 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230947 - BLOCK
      ?auto_230948 - BLOCK
      ?auto_230949 - BLOCK
      ?auto_230950 - BLOCK
      ?auto_230951 - BLOCK
      ?auto_230952 - BLOCK
      ?auto_230953 - BLOCK
      ?auto_230954 - BLOCK
      ?auto_230955 - BLOCK
    )
    :vars
    (
      ?auto_230956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230955 ?auto_230956 ) ( ON-TABLE ?auto_230947 ) ( not ( = ?auto_230947 ?auto_230948 ) ) ( not ( = ?auto_230947 ?auto_230949 ) ) ( not ( = ?auto_230947 ?auto_230950 ) ) ( not ( = ?auto_230947 ?auto_230951 ) ) ( not ( = ?auto_230947 ?auto_230952 ) ) ( not ( = ?auto_230947 ?auto_230953 ) ) ( not ( = ?auto_230947 ?auto_230954 ) ) ( not ( = ?auto_230947 ?auto_230955 ) ) ( not ( = ?auto_230947 ?auto_230956 ) ) ( not ( = ?auto_230948 ?auto_230949 ) ) ( not ( = ?auto_230948 ?auto_230950 ) ) ( not ( = ?auto_230948 ?auto_230951 ) ) ( not ( = ?auto_230948 ?auto_230952 ) ) ( not ( = ?auto_230948 ?auto_230953 ) ) ( not ( = ?auto_230948 ?auto_230954 ) ) ( not ( = ?auto_230948 ?auto_230955 ) ) ( not ( = ?auto_230948 ?auto_230956 ) ) ( not ( = ?auto_230949 ?auto_230950 ) ) ( not ( = ?auto_230949 ?auto_230951 ) ) ( not ( = ?auto_230949 ?auto_230952 ) ) ( not ( = ?auto_230949 ?auto_230953 ) ) ( not ( = ?auto_230949 ?auto_230954 ) ) ( not ( = ?auto_230949 ?auto_230955 ) ) ( not ( = ?auto_230949 ?auto_230956 ) ) ( not ( = ?auto_230950 ?auto_230951 ) ) ( not ( = ?auto_230950 ?auto_230952 ) ) ( not ( = ?auto_230950 ?auto_230953 ) ) ( not ( = ?auto_230950 ?auto_230954 ) ) ( not ( = ?auto_230950 ?auto_230955 ) ) ( not ( = ?auto_230950 ?auto_230956 ) ) ( not ( = ?auto_230951 ?auto_230952 ) ) ( not ( = ?auto_230951 ?auto_230953 ) ) ( not ( = ?auto_230951 ?auto_230954 ) ) ( not ( = ?auto_230951 ?auto_230955 ) ) ( not ( = ?auto_230951 ?auto_230956 ) ) ( not ( = ?auto_230952 ?auto_230953 ) ) ( not ( = ?auto_230952 ?auto_230954 ) ) ( not ( = ?auto_230952 ?auto_230955 ) ) ( not ( = ?auto_230952 ?auto_230956 ) ) ( not ( = ?auto_230953 ?auto_230954 ) ) ( not ( = ?auto_230953 ?auto_230955 ) ) ( not ( = ?auto_230953 ?auto_230956 ) ) ( not ( = ?auto_230954 ?auto_230955 ) ) ( not ( = ?auto_230954 ?auto_230956 ) ) ( not ( = ?auto_230955 ?auto_230956 ) ) ( ON ?auto_230954 ?auto_230955 ) ( ON ?auto_230953 ?auto_230954 ) ( ON ?auto_230952 ?auto_230953 ) ( ON ?auto_230951 ?auto_230952 ) ( ON ?auto_230950 ?auto_230951 ) ( ON ?auto_230949 ?auto_230950 ) ( CLEAR ?auto_230947 ) ( ON ?auto_230948 ?auto_230949 ) ( CLEAR ?auto_230948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230947 ?auto_230948 )
      ( MAKE-9PILE ?auto_230947 ?auto_230948 ?auto_230949 ?auto_230950 ?auto_230951 ?auto_230952 ?auto_230953 ?auto_230954 ?auto_230955 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230966 - BLOCK
      ?auto_230967 - BLOCK
      ?auto_230968 - BLOCK
      ?auto_230969 - BLOCK
      ?auto_230970 - BLOCK
      ?auto_230971 - BLOCK
      ?auto_230972 - BLOCK
      ?auto_230973 - BLOCK
      ?auto_230974 - BLOCK
    )
    :vars
    (
      ?auto_230975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230974 ?auto_230975 ) ( ON-TABLE ?auto_230966 ) ( not ( = ?auto_230966 ?auto_230967 ) ) ( not ( = ?auto_230966 ?auto_230968 ) ) ( not ( = ?auto_230966 ?auto_230969 ) ) ( not ( = ?auto_230966 ?auto_230970 ) ) ( not ( = ?auto_230966 ?auto_230971 ) ) ( not ( = ?auto_230966 ?auto_230972 ) ) ( not ( = ?auto_230966 ?auto_230973 ) ) ( not ( = ?auto_230966 ?auto_230974 ) ) ( not ( = ?auto_230966 ?auto_230975 ) ) ( not ( = ?auto_230967 ?auto_230968 ) ) ( not ( = ?auto_230967 ?auto_230969 ) ) ( not ( = ?auto_230967 ?auto_230970 ) ) ( not ( = ?auto_230967 ?auto_230971 ) ) ( not ( = ?auto_230967 ?auto_230972 ) ) ( not ( = ?auto_230967 ?auto_230973 ) ) ( not ( = ?auto_230967 ?auto_230974 ) ) ( not ( = ?auto_230967 ?auto_230975 ) ) ( not ( = ?auto_230968 ?auto_230969 ) ) ( not ( = ?auto_230968 ?auto_230970 ) ) ( not ( = ?auto_230968 ?auto_230971 ) ) ( not ( = ?auto_230968 ?auto_230972 ) ) ( not ( = ?auto_230968 ?auto_230973 ) ) ( not ( = ?auto_230968 ?auto_230974 ) ) ( not ( = ?auto_230968 ?auto_230975 ) ) ( not ( = ?auto_230969 ?auto_230970 ) ) ( not ( = ?auto_230969 ?auto_230971 ) ) ( not ( = ?auto_230969 ?auto_230972 ) ) ( not ( = ?auto_230969 ?auto_230973 ) ) ( not ( = ?auto_230969 ?auto_230974 ) ) ( not ( = ?auto_230969 ?auto_230975 ) ) ( not ( = ?auto_230970 ?auto_230971 ) ) ( not ( = ?auto_230970 ?auto_230972 ) ) ( not ( = ?auto_230970 ?auto_230973 ) ) ( not ( = ?auto_230970 ?auto_230974 ) ) ( not ( = ?auto_230970 ?auto_230975 ) ) ( not ( = ?auto_230971 ?auto_230972 ) ) ( not ( = ?auto_230971 ?auto_230973 ) ) ( not ( = ?auto_230971 ?auto_230974 ) ) ( not ( = ?auto_230971 ?auto_230975 ) ) ( not ( = ?auto_230972 ?auto_230973 ) ) ( not ( = ?auto_230972 ?auto_230974 ) ) ( not ( = ?auto_230972 ?auto_230975 ) ) ( not ( = ?auto_230973 ?auto_230974 ) ) ( not ( = ?auto_230973 ?auto_230975 ) ) ( not ( = ?auto_230974 ?auto_230975 ) ) ( ON ?auto_230973 ?auto_230974 ) ( ON ?auto_230972 ?auto_230973 ) ( ON ?auto_230971 ?auto_230972 ) ( ON ?auto_230970 ?auto_230971 ) ( ON ?auto_230969 ?auto_230970 ) ( ON ?auto_230968 ?auto_230969 ) ( CLEAR ?auto_230966 ) ( ON ?auto_230967 ?auto_230968 ) ( CLEAR ?auto_230967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_230966 ?auto_230967 )
      ( MAKE-9PILE ?auto_230966 ?auto_230967 ?auto_230968 ?auto_230969 ?auto_230970 ?auto_230971 ?auto_230972 ?auto_230973 ?auto_230974 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_230985 - BLOCK
      ?auto_230986 - BLOCK
      ?auto_230987 - BLOCK
      ?auto_230988 - BLOCK
      ?auto_230989 - BLOCK
      ?auto_230990 - BLOCK
      ?auto_230991 - BLOCK
      ?auto_230992 - BLOCK
      ?auto_230993 - BLOCK
    )
    :vars
    (
      ?auto_230994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_230993 ?auto_230994 ) ( not ( = ?auto_230985 ?auto_230986 ) ) ( not ( = ?auto_230985 ?auto_230987 ) ) ( not ( = ?auto_230985 ?auto_230988 ) ) ( not ( = ?auto_230985 ?auto_230989 ) ) ( not ( = ?auto_230985 ?auto_230990 ) ) ( not ( = ?auto_230985 ?auto_230991 ) ) ( not ( = ?auto_230985 ?auto_230992 ) ) ( not ( = ?auto_230985 ?auto_230993 ) ) ( not ( = ?auto_230985 ?auto_230994 ) ) ( not ( = ?auto_230986 ?auto_230987 ) ) ( not ( = ?auto_230986 ?auto_230988 ) ) ( not ( = ?auto_230986 ?auto_230989 ) ) ( not ( = ?auto_230986 ?auto_230990 ) ) ( not ( = ?auto_230986 ?auto_230991 ) ) ( not ( = ?auto_230986 ?auto_230992 ) ) ( not ( = ?auto_230986 ?auto_230993 ) ) ( not ( = ?auto_230986 ?auto_230994 ) ) ( not ( = ?auto_230987 ?auto_230988 ) ) ( not ( = ?auto_230987 ?auto_230989 ) ) ( not ( = ?auto_230987 ?auto_230990 ) ) ( not ( = ?auto_230987 ?auto_230991 ) ) ( not ( = ?auto_230987 ?auto_230992 ) ) ( not ( = ?auto_230987 ?auto_230993 ) ) ( not ( = ?auto_230987 ?auto_230994 ) ) ( not ( = ?auto_230988 ?auto_230989 ) ) ( not ( = ?auto_230988 ?auto_230990 ) ) ( not ( = ?auto_230988 ?auto_230991 ) ) ( not ( = ?auto_230988 ?auto_230992 ) ) ( not ( = ?auto_230988 ?auto_230993 ) ) ( not ( = ?auto_230988 ?auto_230994 ) ) ( not ( = ?auto_230989 ?auto_230990 ) ) ( not ( = ?auto_230989 ?auto_230991 ) ) ( not ( = ?auto_230989 ?auto_230992 ) ) ( not ( = ?auto_230989 ?auto_230993 ) ) ( not ( = ?auto_230989 ?auto_230994 ) ) ( not ( = ?auto_230990 ?auto_230991 ) ) ( not ( = ?auto_230990 ?auto_230992 ) ) ( not ( = ?auto_230990 ?auto_230993 ) ) ( not ( = ?auto_230990 ?auto_230994 ) ) ( not ( = ?auto_230991 ?auto_230992 ) ) ( not ( = ?auto_230991 ?auto_230993 ) ) ( not ( = ?auto_230991 ?auto_230994 ) ) ( not ( = ?auto_230992 ?auto_230993 ) ) ( not ( = ?auto_230992 ?auto_230994 ) ) ( not ( = ?auto_230993 ?auto_230994 ) ) ( ON ?auto_230992 ?auto_230993 ) ( ON ?auto_230991 ?auto_230992 ) ( ON ?auto_230990 ?auto_230991 ) ( ON ?auto_230989 ?auto_230990 ) ( ON ?auto_230988 ?auto_230989 ) ( ON ?auto_230987 ?auto_230988 ) ( ON ?auto_230986 ?auto_230987 ) ( ON ?auto_230985 ?auto_230986 ) ( CLEAR ?auto_230985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_230985 )
      ( MAKE-9PILE ?auto_230985 ?auto_230986 ?auto_230987 ?auto_230988 ?auto_230989 ?auto_230990 ?auto_230991 ?auto_230992 ?auto_230993 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_231004 - BLOCK
      ?auto_231005 - BLOCK
      ?auto_231006 - BLOCK
      ?auto_231007 - BLOCK
      ?auto_231008 - BLOCK
      ?auto_231009 - BLOCK
      ?auto_231010 - BLOCK
      ?auto_231011 - BLOCK
      ?auto_231012 - BLOCK
    )
    :vars
    (
      ?auto_231013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231012 ?auto_231013 ) ( not ( = ?auto_231004 ?auto_231005 ) ) ( not ( = ?auto_231004 ?auto_231006 ) ) ( not ( = ?auto_231004 ?auto_231007 ) ) ( not ( = ?auto_231004 ?auto_231008 ) ) ( not ( = ?auto_231004 ?auto_231009 ) ) ( not ( = ?auto_231004 ?auto_231010 ) ) ( not ( = ?auto_231004 ?auto_231011 ) ) ( not ( = ?auto_231004 ?auto_231012 ) ) ( not ( = ?auto_231004 ?auto_231013 ) ) ( not ( = ?auto_231005 ?auto_231006 ) ) ( not ( = ?auto_231005 ?auto_231007 ) ) ( not ( = ?auto_231005 ?auto_231008 ) ) ( not ( = ?auto_231005 ?auto_231009 ) ) ( not ( = ?auto_231005 ?auto_231010 ) ) ( not ( = ?auto_231005 ?auto_231011 ) ) ( not ( = ?auto_231005 ?auto_231012 ) ) ( not ( = ?auto_231005 ?auto_231013 ) ) ( not ( = ?auto_231006 ?auto_231007 ) ) ( not ( = ?auto_231006 ?auto_231008 ) ) ( not ( = ?auto_231006 ?auto_231009 ) ) ( not ( = ?auto_231006 ?auto_231010 ) ) ( not ( = ?auto_231006 ?auto_231011 ) ) ( not ( = ?auto_231006 ?auto_231012 ) ) ( not ( = ?auto_231006 ?auto_231013 ) ) ( not ( = ?auto_231007 ?auto_231008 ) ) ( not ( = ?auto_231007 ?auto_231009 ) ) ( not ( = ?auto_231007 ?auto_231010 ) ) ( not ( = ?auto_231007 ?auto_231011 ) ) ( not ( = ?auto_231007 ?auto_231012 ) ) ( not ( = ?auto_231007 ?auto_231013 ) ) ( not ( = ?auto_231008 ?auto_231009 ) ) ( not ( = ?auto_231008 ?auto_231010 ) ) ( not ( = ?auto_231008 ?auto_231011 ) ) ( not ( = ?auto_231008 ?auto_231012 ) ) ( not ( = ?auto_231008 ?auto_231013 ) ) ( not ( = ?auto_231009 ?auto_231010 ) ) ( not ( = ?auto_231009 ?auto_231011 ) ) ( not ( = ?auto_231009 ?auto_231012 ) ) ( not ( = ?auto_231009 ?auto_231013 ) ) ( not ( = ?auto_231010 ?auto_231011 ) ) ( not ( = ?auto_231010 ?auto_231012 ) ) ( not ( = ?auto_231010 ?auto_231013 ) ) ( not ( = ?auto_231011 ?auto_231012 ) ) ( not ( = ?auto_231011 ?auto_231013 ) ) ( not ( = ?auto_231012 ?auto_231013 ) ) ( ON ?auto_231011 ?auto_231012 ) ( ON ?auto_231010 ?auto_231011 ) ( ON ?auto_231009 ?auto_231010 ) ( ON ?auto_231008 ?auto_231009 ) ( ON ?auto_231007 ?auto_231008 ) ( ON ?auto_231006 ?auto_231007 ) ( ON ?auto_231005 ?auto_231006 ) ( ON ?auto_231004 ?auto_231005 ) ( CLEAR ?auto_231004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_231004 )
      ( MAKE-9PILE ?auto_231004 ?auto_231005 ?auto_231006 ?auto_231007 ?auto_231008 ?auto_231009 ?auto_231010 ?auto_231011 ?auto_231012 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231024 - BLOCK
      ?auto_231025 - BLOCK
      ?auto_231026 - BLOCK
      ?auto_231027 - BLOCK
      ?auto_231028 - BLOCK
      ?auto_231029 - BLOCK
      ?auto_231030 - BLOCK
      ?auto_231031 - BLOCK
      ?auto_231032 - BLOCK
      ?auto_231033 - BLOCK
    )
    :vars
    (
      ?auto_231034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_231032 ) ( ON ?auto_231033 ?auto_231034 ) ( CLEAR ?auto_231033 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_231024 ) ( ON ?auto_231025 ?auto_231024 ) ( ON ?auto_231026 ?auto_231025 ) ( ON ?auto_231027 ?auto_231026 ) ( ON ?auto_231028 ?auto_231027 ) ( ON ?auto_231029 ?auto_231028 ) ( ON ?auto_231030 ?auto_231029 ) ( ON ?auto_231031 ?auto_231030 ) ( ON ?auto_231032 ?auto_231031 ) ( not ( = ?auto_231024 ?auto_231025 ) ) ( not ( = ?auto_231024 ?auto_231026 ) ) ( not ( = ?auto_231024 ?auto_231027 ) ) ( not ( = ?auto_231024 ?auto_231028 ) ) ( not ( = ?auto_231024 ?auto_231029 ) ) ( not ( = ?auto_231024 ?auto_231030 ) ) ( not ( = ?auto_231024 ?auto_231031 ) ) ( not ( = ?auto_231024 ?auto_231032 ) ) ( not ( = ?auto_231024 ?auto_231033 ) ) ( not ( = ?auto_231024 ?auto_231034 ) ) ( not ( = ?auto_231025 ?auto_231026 ) ) ( not ( = ?auto_231025 ?auto_231027 ) ) ( not ( = ?auto_231025 ?auto_231028 ) ) ( not ( = ?auto_231025 ?auto_231029 ) ) ( not ( = ?auto_231025 ?auto_231030 ) ) ( not ( = ?auto_231025 ?auto_231031 ) ) ( not ( = ?auto_231025 ?auto_231032 ) ) ( not ( = ?auto_231025 ?auto_231033 ) ) ( not ( = ?auto_231025 ?auto_231034 ) ) ( not ( = ?auto_231026 ?auto_231027 ) ) ( not ( = ?auto_231026 ?auto_231028 ) ) ( not ( = ?auto_231026 ?auto_231029 ) ) ( not ( = ?auto_231026 ?auto_231030 ) ) ( not ( = ?auto_231026 ?auto_231031 ) ) ( not ( = ?auto_231026 ?auto_231032 ) ) ( not ( = ?auto_231026 ?auto_231033 ) ) ( not ( = ?auto_231026 ?auto_231034 ) ) ( not ( = ?auto_231027 ?auto_231028 ) ) ( not ( = ?auto_231027 ?auto_231029 ) ) ( not ( = ?auto_231027 ?auto_231030 ) ) ( not ( = ?auto_231027 ?auto_231031 ) ) ( not ( = ?auto_231027 ?auto_231032 ) ) ( not ( = ?auto_231027 ?auto_231033 ) ) ( not ( = ?auto_231027 ?auto_231034 ) ) ( not ( = ?auto_231028 ?auto_231029 ) ) ( not ( = ?auto_231028 ?auto_231030 ) ) ( not ( = ?auto_231028 ?auto_231031 ) ) ( not ( = ?auto_231028 ?auto_231032 ) ) ( not ( = ?auto_231028 ?auto_231033 ) ) ( not ( = ?auto_231028 ?auto_231034 ) ) ( not ( = ?auto_231029 ?auto_231030 ) ) ( not ( = ?auto_231029 ?auto_231031 ) ) ( not ( = ?auto_231029 ?auto_231032 ) ) ( not ( = ?auto_231029 ?auto_231033 ) ) ( not ( = ?auto_231029 ?auto_231034 ) ) ( not ( = ?auto_231030 ?auto_231031 ) ) ( not ( = ?auto_231030 ?auto_231032 ) ) ( not ( = ?auto_231030 ?auto_231033 ) ) ( not ( = ?auto_231030 ?auto_231034 ) ) ( not ( = ?auto_231031 ?auto_231032 ) ) ( not ( = ?auto_231031 ?auto_231033 ) ) ( not ( = ?auto_231031 ?auto_231034 ) ) ( not ( = ?auto_231032 ?auto_231033 ) ) ( not ( = ?auto_231032 ?auto_231034 ) ) ( not ( = ?auto_231033 ?auto_231034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_231033 ?auto_231034 )
      ( !STACK ?auto_231033 ?auto_231032 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231045 - BLOCK
      ?auto_231046 - BLOCK
      ?auto_231047 - BLOCK
      ?auto_231048 - BLOCK
      ?auto_231049 - BLOCK
      ?auto_231050 - BLOCK
      ?auto_231051 - BLOCK
      ?auto_231052 - BLOCK
      ?auto_231053 - BLOCK
      ?auto_231054 - BLOCK
    )
    :vars
    (
      ?auto_231055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_231053 ) ( ON ?auto_231054 ?auto_231055 ) ( CLEAR ?auto_231054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_231045 ) ( ON ?auto_231046 ?auto_231045 ) ( ON ?auto_231047 ?auto_231046 ) ( ON ?auto_231048 ?auto_231047 ) ( ON ?auto_231049 ?auto_231048 ) ( ON ?auto_231050 ?auto_231049 ) ( ON ?auto_231051 ?auto_231050 ) ( ON ?auto_231052 ?auto_231051 ) ( ON ?auto_231053 ?auto_231052 ) ( not ( = ?auto_231045 ?auto_231046 ) ) ( not ( = ?auto_231045 ?auto_231047 ) ) ( not ( = ?auto_231045 ?auto_231048 ) ) ( not ( = ?auto_231045 ?auto_231049 ) ) ( not ( = ?auto_231045 ?auto_231050 ) ) ( not ( = ?auto_231045 ?auto_231051 ) ) ( not ( = ?auto_231045 ?auto_231052 ) ) ( not ( = ?auto_231045 ?auto_231053 ) ) ( not ( = ?auto_231045 ?auto_231054 ) ) ( not ( = ?auto_231045 ?auto_231055 ) ) ( not ( = ?auto_231046 ?auto_231047 ) ) ( not ( = ?auto_231046 ?auto_231048 ) ) ( not ( = ?auto_231046 ?auto_231049 ) ) ( not ( = ?auto_231046 ?auto_231050 ) ) ( not ( = ?auto_231046 ?auto_231051 ) ) ( not ( = ?auto_231046 ?auto_231052 ) ) ( not ( = ?auto_231046 ?auto_231053 ) ) ( not ( = ?auto_231046 ?auto_231054 ) ) ( not ( = ?auto_231046 ?auto_231055 ) ) ( not ( = ?auto_231047 ?auto_231048 ) ) ( not ( = ?auto_231047 ?auto_231049 ) ) ( not ( = ?auto_231047 ?auto_231050 ) ) ( not ( = ?auto_231047 ?auto_231051 ) ) ( not ( = ?auto_231047 ?auto_231052 ) ) ( not ( = ?auto_231047 ?auto_231053 ) ) ( not ( = ?auto_231047 ?auto_231054 ) ) ( not ( = ?auto_231047 ?auto_231055 ) ) ( not ( = ?auto_231048 ?auto_231049 ) ) ( not ( = ?auto_231048 ?auto_231050 ) ) ( not ( = ?auto_231048 ?auto_231051 ) ) ( not ( = ?auto_231048 ?auto_231052 ) ) ( not ( = ?auto_231048 ?auto_231053 ) ) ( not ( = ?auto_231048 ?auto_231054 ) ) ( not ( = ?auto_231048 ?auto_231055 ) ) ( not ( = ?auto_231049 ?auto_231050 ) ) ( not ( = ?auto_231049 ?auto_231051 ) ) ( not ( = ?auto_231049 ?auto_231052 ) ) ( not ( = ?auto_231049 ?auto_231053 ) ) ( not ( = ?auto_231049 ?auto_231054 ) ) ( not ( = ?auto_231049 ?auto_231055 ) ) ( not ( = ?auto_231050 ?auto_231051 ) ) ( not ( = ?auto_231050 ?auto_231052 ) ) ( not ( = ?auto_231050 ?auto_231053 ) ) ( not ( = ?auto_231050 ?auto_231054 ) ) ( not ( = ?auto_231050 ?auto_231055 ) ) ( not ( = ?auto_231051 ?auto_231052 ) ) ( not ( = ?auto_231051 ?auto_231053 ) ) ( not ( = ?auto_231051 ?auto_231054 ) ) ( not ( = ?auto_231051 ?auto_231055 ) ) ( not ( = ?auto_231052 ?auto_231053 ) ) ( not ( = ?auto_231052 ?auto_231054 ) ) ( not ( = ?auto_231052 ?auto_231055 ) ) ( not ( = ?auto_231053 ?auto_231054 ) ) ( not ( = ?auto_231053 ?auto_231055 ) ) ( not ( = ?auto_231054 ?auto_231055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_231054 ?auto_231055 )
      ( !STACK ?auto_231054 ?auto_231053 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231066 - BLOCK
      ?auto_231067 - BLOCK
      ?auto_231068 - BLOCK
      ?auto_231069 - BLOCK
      ?auto_231070 - BLOCK
      ?auto_231071 - BLOCK
      ?auto_231072 - BLOCK
      ?auto_231073 - BLOCK
      ?auto_231074 - BLOCK
      ?auto_231075 - BLOCK
    )
    :vars
    (
      ?auto_231076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231075 ?auto_231076 ) ( ON-TABLE ?auto_231066 ) ( ON ?auto_231067 ?auto_231066 ) ( ON ?auto_231068 ?auto_231067 ) ( ON ?auto_231069 ?auto_231068 ) ( ON ?auto_231070 ?auto_231069 ) ( ON ?auto_231071 ?auto_231070 ) ( ON ?auto_231072 ?auto_231071 ) ( ON ?auto_231073 ?auto_231072 ) ( not ( = ?auto_231066 ?auto_231067 ) ) ( not ( = ?auto_231066 ?auto_231068 ) ) ( not ( = ?auto_231066 ?auto_231069 ) ) ( not ( = ?auto_231066 ?auto_231070 ) ) ( not ( = ?auto_231066 ?auto_231071 ) ) ( not ( = ?auto_231066 ?auto_231072 ) ) ( not ( = ?auto_231066 ?auto_231073 ) ) ( not ( = ?auto_231066 ?auto_231074 ) ) ( not ( = ?auto_231066 ?auto_231075 ) ) ( not ( = ?auto_231066 ?auto_231076 ) ) ( not ( = ?auto_231067 ?auto_231068 ) ) ( not ( = ?auto_231067 ?auto_231069 ) ) ( not ( = ?auto_231067 ?auto_231070 ) ) ( not ( = ?auto_231067 ?auto_231071 ) ) ( not ( = ?auto_231067 ?auto_231072 ) ) ( not ( = ?auto_231067 ?auto_231073 ) ) ( not ( = ?auto_231067 ?auto_231074 ) ) ( not ( = ?auto_231067 ?auto_231075 ) ) ( not ( = ?auto_231067 ?auto_231076 ) ) ( not ( = ?auto_231068 ?auto_231069 ) ) ( not ( = ?auto_231068 ?auto_231070 ) ) ( not ( = ?auto_231068 ?auto_231071 ) ) ( not ( = ?auto_231068 ?auto_231072 ) ) ( not ( = ?auto_231068 ?auto_231073 ) ) ( not ( = ?auto_231068 ?auto_231074 ) ) ( not ( = ?auto_231068 ?auto_231075 ) ) ( not ( = ?auto_231068 ?auto_231076 ) ) ( not ( = ?auto_231069 ?auto_231070 ) ) ( not ( = ?auto_231069 ?auto_231071 ) ) ( not ( = ?auto_231069 ?auto_231072 ) ) ( not ( = ?auto_231069 ?auto_231073 ) ) ( not ( = ?auto_231069 ?auto_231074 ) ) ( not ( = ?auto_231069 ?auto_231075 ) ) ( not ( = ?auto_231069 ?auto_231076 ) ) ( not ( = ?auto_231070 ?auto_231071 ) ) ( not ( = ?auto_231070 ?auto_231072 ) ) ( not ( = ?auto_231070 ?auto_231073 ) ) ( not ( = ?auto_231070 ?auto_231074 ) ) ( not ( = ?auto_231070 ?auto_231075 ) ) ( not ( = ?auto_231070 ?auto_231076 ) ) ( not ( = ?auto_231071 ?auto_231072 ) ) ( not ( = ?auto_231071 ?auto_231073 ) ) ( not ( = ?auto_231071 ?auto_231074 ) ) ( not ( = ?auto_231071 ?auto_231075 ) ) ( not ( = ?auto_231071 ?auto_231076 ) ) ( not ( = ?auto_231072 ?auto_231073 ) ) ( not ( = ?auto_231072 ?auto_231074 ) ) ( not ( = ?auto_231072 ?auto_231075 ) ) ( not ( = ?auto_231072 ?auto_231076 ) ) ( not ( = ?auto_231073 ?auto_231074 ) ) ( not ( = ?auto_231073 ?auto_231075 ) ) ( not ( = ?auto_231073 ?auto_231076 ) ) ( not ( = ?auto_231074 ?auto_231075 ) ) ( not ( = ?auto_231074 ?auto_231076 ) ) ( not ( = ?auto_231075 ?auto_231076 ) ) ( CLEAR ?auto_231073 ) ( ON ?auto_231074 ?auto_231075 ) ( CLEAR ?auto_231074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_231066 ?auto_231067 ?auto_231068 ?auto_231069 ?auto_231070 ?auto_231071 ?auto_231072 ?auto_231073 ?auto_231074 )
      ( MAKE-10PILE ?auto_231066 ?auto_231067 ?auto_231068 ?auto_231069 ?auto_231070 ?auto_231071 ?auto_231072 ?auto_231073 ?auto_231074 ?auto_231075 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231087 - BLOCK
      ?auto_231088 - BLOCK
      ?auto_231089 - BLOCK
      ?auto_231090 - BLOCK
      ?auto_231091 - BLOCK
      ?auto_231092 - BLOCK
      ?auto_231093 - BLOCK
      ?auto_231094 - BLOCK
      ?auto_231095 - BLOCK
      ?auto_231096 - BLOCK
    )
    :vars
    (
      ?auto_231097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231096 ?auto_231097 ) ( ON-TABLE ?auto_231087 ) ( ON ?auto_231088 ?auto_231087 ) ( ON ?auto_231089 ?auto_231088 ) ( ON ?auto_231090 ?auto_231089 ) ( ON ?auto_231091 ?auto_231090 ) ( ON ?auto_231092 ?auto_231091 ) ( ON ?auto_231093 ?auto_231092 ) ( ON ?auto_231094 ?auto_231093 ) ( not ( = ?auto_231087 ?auto_231088 ) ) ( not ( = ?auto_231087 ?auto_231089 ) ) ( not ( = ?auto_231087 ?auto_231090 ) ) ( not ( = ?auto_231087 ?auto_231091 ) ) ( not ( = ?auto_231087 ?auto_231092 ) ) ( not ( = ?auto_231087 ?auto_231093 ) ) ( not ( = ?auto_231087 ?auto_231094 ) ) ( not ( = ?auto_231087 ?auto_231095 ) ) ( not ( = ?auto_231087 ?auto_231096 ) ) ( not ( = ?auto_231087 ?auto_231097 ) ) ( not ( = ?auto_231088 ?auto_231089 ) ) ( not ( = ?auto_231088 ?auto_231090 ) ) ( not ( = ?auto_231088 ?auto_231091 ) ) ( not ( = ?auto_231088 ?auto_231092 ) ) ( not ( = ?auto_231088 ?auto_231093 ) ) ( not ( = ?auto_231088 ?auto_231094 ) ) ( not ( = ?auto_231088 ?auto_231095 ) ) ( not ( = ?auto_231088 ?auto_231096 ) ) ( not ( = ?auto_231088 ?auto_231097 ) ) ( not ( = ?auto_231089 ?auto_231090 ) ) ( not ( = ?auto_231089 ?auto_231091 ) ) ( not ( = ?auto_231089 ?auto_231092 ) ) ( not ( = ?auto_231089 ?auto_231093 ) ) ( not ( = ?auto_231089 ?auto_231094 ) ) ( not ( = ?auto_231089 ?auto_231095 ) ) ( not ( = ?auto_231089 ?auto_231096 ) ) ( not ( = ?auto_231089 ?auto_231097 ) ) ( not ( = ?auto_231090 ?auto_231091 ) ) ( not ( = ?auto_231090 ?auto_231092 ) ) ( not ( = ?auto_231090 ?auto_231093 ) ) ( not ( = ?auto_231090 ?auto_231094 ) ) ( not ( = ?auto_231090 ?auto_231095 ) ) ( not ( = ?auto_231090 ?auto_231096 ) ) ( not ( = ?auto_231090 ?auto_231097 ) ) ( not ( = ?auto_231091 ?auto_231092 ) ) ( not ( = ?auto_231091 ?auto_231093 ) ) ( not ( = ?auto_231091 ?auto_231094 ) ) ( not ( = ?auto_231091 ?auto_231095 ) ) ( not ( = ?auto_231091 ?auto_231096 ) ) ( not ( = ?auto_231091 ?auto_231097 ) ) ( not ( = ?auto_231092 ?auto_231093 ) ) ( not ( = ?auto_231092 ?auto_231094 ) ) ( not ( = ?auto_231092 ?auto_231095 ) ) ( not ( = ?auto_231092 ?auto_231096 ) ) ( not ( = ?auto_231092 ?auto_231097 ) ) ( not ( = ?auto_231093 ?auto_231094 ) ) ( not ( = ?auto_231093 ?auto_231095 ) ) ( not ( = ?auto_231093 ?auto_231096 ) ) ( not ( = ?auto_231093 ?auto_231097 ) ) ( not ( = ?auto_231094 ?auto_231095 ) ) ( not ( = ?auto_231094 ?auto_231096 ) ) ( not ( = ?auto_231094 ?auto_231097 ) ) ( not ( = ?auto_231095 ?auto_231096 ) ) ( not ( = ?auto_231095 ?auto_231097 ) ) ( not ( = ?auto_231096 ?auto_231097 ) ) ( CLEAR ?auto_231094 ) ( ON ?auto_231095 ?auto_231096 ) ( CLEAR ?auto_231095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_231087 ?auto_231088 ?auto_231089 ?auto_231090 ?auto_231091 ?auto_231092 ?auto_231093 ?auto_231094 ?auto_231095 )
      ( MAKE-10PILE ?auto_231087 ?auto_231088 ?auto_231089 ?auto_231090 ?auto_231091 ?auto_231092 ?auto_231093 ?auto_231094 ?auto_231095 ?auto_231096 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231108 - BLOCK
      ?auto_231109 - BLOCK
      ?auto_231110 - BLOCK
      ?auto_231111 - BLOCK
      ?auto_231112 - BLOCK
      ?auto_231113 - BLOCK
      ?auto_231114 - BLOCK
      ?auto_231115 - BLOCK
      ?auto_231116 - BLOCK
      ?auto_231117 - BLOCK
    )
    :vars
    (
      ?auto_231118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231117 ?auto_231118 ) ( ON-TABLE ?auto_231108 ) ( ON ?auto_231109 ?auto_231108 ) ( ON ?auto_231110 ?auto_231109 ) ( ON ?auto_231111 ?auto_231110 ) ( ON ?auto_231112 ?auto_231111 ) ( ON ?auto_231113 ?auto_231112 ) ( ON ?auto_231114 ?auto_231113 ) ( not ( = ?auto_231108 ?auto_231109 ) ) ( not ( = ?auto_231108 ?auto_231110 ) ) ( not ( = ?auto_231108 ?auto_231111 ) ) ( not ( = ?auto_231108 ?auto_231112 ) ) ( not ( = ?auto_231108 ?auto_231113 ) ) ( not ( = ?auto_231108 ?auto_231114 ) ) ( not ( = ?auto_231108 ?auto_231115 ) ) ( not ( = ?auto_231108 ?auto_231116 ) ) ( not ( = ?auto_231108 ?auto_231117 ) ) ( not ( = ?auto_231108 ?auto_231118 ) ) ( not ( = ?auto_231109 ?auto_231110 ) ) ( not ( = ?auto_231109 ?auto_231111 ) ) ( not ( = ?auto_231109 ?auto_231112 ) ) ( not ( = ?auto_231109 ?auto_231113 ) ) ( not ( = ?auto_231109 ?auto_231114 ) ) ( not ( = ?auto_231109 ?auto_231115 ) ) ( not ( = ?auto_231109 ?auto_231116 ) ) ( not ( = ?auto_231109 ?auto_231117 ) ) ( not ( = ?auto_231109 ?auto_231118 ) ) ( not ( = ?auto_231110 ?auto_231111 ) ) ( not ( = ?auto_231110 ?auto_231112 ) ) ( not ( = ?auto_231110 ?auto_231113 ) ) ( not ( = ?auto_231110 ?auto_231114 ) ) ( not ( = ?auto_231110 ?auto_231115 ) ) ( not ( = ?auto_231110 ?auto_231116 ) ) ( not ( = ?auto_231110 ?auto_231117 ) ) ( not ( = ?auto_231110 ?auto_231118 ) ) ( not ( = ?auto_231111 ?auto_231112 ) ) ( not ( = ?auto_231111 ?auto_231113 ) ) ( not ( = ?auto_231111 ?auto_231114 ) ) ( not ( = ?auto_231111 ?auto_231115 ) ) ( not ( = ?auto_231111 ?auto_231116 ) ) ( not ( = ?auto_231111 ?auto_231117 ) ) ( not ( = ?auto_231111 ?auto_231118 ) ) ( not ( = ?auto_231112 ?auto_231113 ) ) ( not ( = ?auto_231112 ?auto_231114 ) ) ( not ( = ?auto_231112 ?auto_231115 ) ) ( not ( = ?auto_231112 ?auto_231116 ) ) ( not ( = ?auto_231112 ?auto_231117 ) ) ( not ( = ?auto_231112 ?auto_231118 ) ) ( not ( = ?auto_231113 ?auto_231114 ) ) ( not ( = ?auto_231113 ?auto_231115 ) ) ( not ( = ?auto_231113 ?auto_231116 ) ) ( not ( = ?auto_231113 ?auto_231117 ) ) ( not ( = ?auto_231113 ?auto_231118 ) ) ( not ( = ?auto_231114 ?auto_231115 ) ) ( not ( = ?auto_231114 ?auto_231116 ) ) ( not ( = ?auto_231114 ?auto_231117 ) ) ( not ( = ?auto_231114 ?auto_231118 ) ) ( not ( = ?auto_231115 ?auto_231116 ) ) ( not ( = ?auto_231115 ?auto_231117 ) ) ( not ( = ?auto_231115 ?auto_231118 ) ) ( not ( = ?auto_231116 ?auto_231117 ) ) ( not ( = ?auto_231116 ?auto_231118 ) ) ( not ( = ?auto_231117 ?auto_231118 ) ) ( ON ?auto_231116 ?auto_231117 ) ( CLEAR ?auto_231114 ) ( ON ?auto_231115 ?auto_231116 ) ( CLEAR ?auto_231115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_231108 ?auto_231109 ?auto_231110 ?auto_231111 ?auto_231112 ?auto_231113 ?auto_231114 ?auto_231115 )
      ( MAKE-10PILE ?auto_231108 ?auto_231109 ?auto_231110 ?auto_231111 ?auto_231112 ?auto_231113 ?auto_231114 ?auto_231115 ?auto_231116 ?auto_231117 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231129 - BLOCK
      ?auto_231130 - BLOCK
      ?auto_231131 - BLOCK
      ?auto_231132 - BLOCK
      ?auto_231133 - BLOCK
      ?auto_231134 - BLOCK
      ?auto_231135 - BLOCK
      ?auto_231136 - BLOCK
      ?auto_231137 - BLOCK
      ?auto_231138 - BLOCK
    )
    :vars
    (
      ?auto_231139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231138 ?auto_231139 ) ( ON-TABLE ?auto_231129 ) ( ON ?auto_231130 ?auto_231129 ) ( ON ?auto_231131 ?auto_231130 ) ( ON ?auto_231132 ?auto_231131 ) ( ON ?auto_231133 ?auto_231132 ) ( ON ?auto_231134 ?auto_231133 ) ( ON ?auto_231135 ?auto_231134 ) ( not ( = ?auto_231129 ?auto_231130 ) ) ( not ( = ?auto_231129 ?auto_231131 ) ) ( not ( = ?auto_231129 ?auto_231132 ) ) ( not ( = ?auto_231129 ?auto_231133 ) ) ( not ( = ?auto_231129 ?auto_231134 ) ) ( not ( = ?auto_231129 ?auto_231135 ) ) ( not ( = ?auto_231129 ?auto_231136 ) ) ( not ( = ?auto_231129 ?auto_231137 ) ) ( not ( = ?auto_231129 ?auto_231138 ) ) ( not ( = ?auto_231129 ?auto_231139 ) ) ( not ( = ?auto_231130 ?auto_231131 ) ) ( not ( = ?auto_231130 ?auto_231132 ) ) ( not ( = ?auto_231130 ?auto_231133 ) ) ( not ( = ?auto_231130 ?auto_231134 ) ) ( not ( = ?auto_231130 ?auto_231135 ) ) ( not ( = ?auto_231130 ?auto_231136 ) ) ( not ( = ?auto_231130 ?auto_231137 ) ) ( not ( = ?auto_231130 ?auto_231138 ) ) ( not ( = ?auto_231130 ?auto_231139 ) ) ( not ( = ?auto_231131 ?auto_231132 ) ) ( not ( = ?auto_231131 ?auto_231133 ) ) ( not ( = ?auto_231131 ?auto_231134 ) ) ( not ( = ?auto_231131 ?auto_231135 ) ) ( not ( = ?auto_231131 ?auto_231136 ) ) ( not ( = ?auto_231131 ?auto_231137 ) ) ( not ( = ?auto_231131 ?auto_231138 ) ) ( not ( = ?auto_231131 ?auto_231139 ) ) ( not ( = ?auto_231132 ?auto_231133 ) ) ( not ( = ?auto_231132 ?auto_231134 ) ) ( not ( = ?auto_231132 ?auto_231135 ) ) ( not ( = ?auto_231132 ?auto_231136 ) ) ( not ( = ?auto_231132 ?auto_231137 ) ) ( not ( = ?auto_231132 ?auto_231138 ) ) ( not ( = ?auto_231132 ?auto_231139 ) ) ( not ( = ?auto_231133 ?auto_231134 ) ) ( not ( = ?auto_231133 ?auto_231135 ) ) ( not ( = ?auto_231133 ?auto_231136 ) ) ( not ( = ?auto_231133 ?auto_231137 ) ) ( not ( = ?auto_231133 ?auto_231138 ) ) ( not ( = ?auto_231133 ?auto_231139 ) ) ( not ( = ?auto_231134 ?auto_231135 ) ) ( not ( = ?auto_231134 ?auto_231136 ) ) ( not ( = ?auto_231134 ?auto_231137 ) ) ( not ( = ?auto_231134 ?auto_231138 ) ) ( not ( = ?auto_231134 ?auto_231139 ) ) ( not ( = ?auto_231135 ?auto_231136 ) ) ( not ( = ?auto_231135 ?auto_231137 ) ) ( not ( = ?auto_231135 ?auto_231138 ) ) ( not ( = ?auto_231135 ?auto_231139 ) ) ( not ( = ?auto_231136 ?auto_231137 ) ) ( not ( = ?auto_231136 ?auto_231138 ) ) ( not ( = ?auto_231136 ?auto_231139 ) ) ( not ( = ?auto_231137 ?auto_231138 ) ) ( not ( = ?auto_231137 ?auto_231139 ) ) ( not ( = ?auto_231138 ?auto_231139 ) ) ( ON ?auto_231137 ?auto_231138 ) ( CLEAR ?auto_231135 ) ( ON ?auto_231136 ?auto_231137 ) ( CLEAR ?auto_231136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_231129 ?auto_231130 ?auto_231131 ?auto_231132 ?auto_231133 ?auto_231134 ?auto_231135 ?auto_231136 )
      ( MAKE-10PILE ?auto_231129 ?auto_231130 ?auto_231131 ?auto_231132 ?auto_231133 ?auto_231134 ?auto_231135 ?auto_231136 ?auto_231137 ?auto_231138 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231150 - BLOCK
      ?auto_231151 - BLOCK
      ?auto_231152 - BLOCK
      ?auto_231153 - BLOCK
      ?auto_231154 - BLOCK
      ?auto_231155 - BLOCK
      ?auto_231156 - BLOCK
      ?auto_231157 - BLOCK
      ?auto_231158 - BLOCK
      ?auto_231159 - BLOCK
    )
    :vars
    (
      ?auto_231160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231159 ?auto_231160 ) ( ON-TABLE ?auto_231150 ) ( ON ?auto_231151 ?auto_231150 ) ( ON ?auto_231152 ?auto_231151 ) ( ON ?auto_231153 ?auto_231152 ) ( ON ?auto_231154 ?auto_231153 ) ( ON ?auto_231155 ?auto_231154 ) ( not ( = ?auto_231150 ?auto_231151 ) ) ( not ( = ?auto_231150 ?auto_231152 ) ) ( not ( = ?auto_231150 ?auto_231153 ) ) ( not ( = ?auto_231150 ?auto_231154 ) ) ( not ( = ?auto_231150 ?auto_231155 ) ) ( not ( = ?auto_231150 ?auto_231156 ) ) ( not ( = ?auto_231150 ?auto_231157 ) ) ( not ( = ?auto_231150 ?auto_231158 ) ) ( not ( = ?auto_231150 ?auto_231159 ) ) ( not ( = ?auto_231150 ?auto_231160 ) ) ( not ( = ?auto_231151 ?auto_231152 ) ) ( not ( = ?auto_231151 ?auto_231153 ) ) ( not ( = ?auto_231151 ?auto_231154 ) ) ( not ( = ?auto_231151 ?auto_231155 ) ) ( not ( = ?auto_231151 ?auto_231156 ) ) ( not ( = ?auto_231151 ?auto_231157 ) ) ( not ( = ?auto_231151 ?auto_231158 ) ) ( not ( = ?auto_231151 ?auto_231159 ) ) ( not ( = ?auto_231151 ?auto_231160 ) ) ( not ( = ?auto_231152 ?auto_231153 ) ) ( not ( = ?auto_231152 ?auto_231154 ) ) ( not ( = ?auto_231152 ?auto_231155 ) ) ( not ( = ?auto_231152 ?auto_231156 ) ) ( not ( = ?auto_231152 ?auto_231157 ) ) ( not ( = ?auto_231152 ?auto_231158 ) ) ( not ( = ?auto_231152 ?auto_231159 ) ) ( not ( = ?auto_231152 ?auto_231160 ) ) ( not ( = ?auto_231153 ?auto_231154 ) ) ( not ( = ?auto_231153 ?auto_231155 ) ) ( not ( = ?auto_231153 ?auto_231156 ) ) ( not ( = ?auto_231153 ?auto_231157 ) ) ( not ( = ?auto_231153 ?auto_231158 ) ) ( not ( = ?auto_231153 ?auto_231159 ) ) ( not ( = ?auto_231153 ?auto_231160 ) ) ( not ( = ?auto_231154 ?auto_231155 ) ) ( not ( = ?auto_231154 ?auto_231156 ) ) ( not ( = ?auto_231154 ?auto_231157 ) ) ( not ( = ?auto_231154 ?auto_231158 ) ) ( not ( = ?auto_231154 ?auto_231159 ) ) ( not ( = ?auto_231154 ?auto_231160 ) ) ( not ( = ?auto_231155 ?auto_231156 ) ) ( not ( = ?auto_231155 ?auto_231157 ) ) ( not ( = ?auto_231155 ?auto_231158 ) ) ( not ( = ?auto_231155 ?auto_231159 ) ) ( not ( = ?auto_231155 ?auto_231160 ) ) ( not ( = ?auto_231156 ?auto_231157 ) ) ( not ( = ?auto_231156 ?auto_231158 ) ) ( not ( = ?auto_231156 ?auto_231159 ) ) ( not ( = ?auto_231156 ?auto_231160 ) ) ( not ( = ?auto_231157 ?auto_231158 ) ) ( not ( = ?auto_231157 ?auto_231159 ) ) ( not ( = ?auto_231157 ?auto_231160 ) ) ( not ( = ?auto_231158 ?auto_231159 ) ) ( not ( = ?auto_231158 ?auto_231160 ) ) ( not ( = ?auto_231159 ?auto_231160 ) ) ( ON ?auto_231158 ?auto_231159 ) ( ON ?auto_231157 ?auto_231158 ) ( CLEAR ?auto_231155 ) ( ON ?auto_231156 ?auto_231157 ) ( CLEAR ?auto_231156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_231150 ?auto_231151 ?auto_231152 ?auto_231153 ?auto_231154 ?auto_231155 ?auto_231156 )
      ( MAKE-10PILE ?auto_231150 ?auto_231151 ?auto_231152 ?auto_231153 ?auto_231154 ?auto_231155 ?auto_231156 ?auto_231157 ?auto_231158 ?auto_231159 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231171 - BLOCK
      ?auto_231172 - BLOCK
      ?auto_231173 - BLOCK
      ?auto_231174 - BLOCK
      ?auto_231175 - BLOCK
      ?auto_231176 - BLOCK
      ?auto_231177 - BLOCK
      ?auto_231178 - BLOCK
      ?auto_231179 - BLOCK
      ?auto_231180 - BLOCK
    )
    :vars
    (
      ?auto_231181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231180 ?auto_231181 ) ( ON-TABLE ?auto_231171 ) ( ON ?auto_231172 ?auto_231171 ) ( ON ?auto_231173 ?auto_231172 ) ( ON ?auto_231174 ?auto_231173 ) ( ON ?auto_231175 ?auto_231174 ) ( ON ?auto_231176 ?auto_231175 ) ( not ( = ?auto_231171 ?auto_231172 ) ) ( not ( = ?auto_231171 ?auto_231173 ) ) ( not ( = ?auto_231171 ?auto_231174 ) ) ( not ( = ?auto_231171 ?auto_231175 ) ) ( not ( = ?auto_231171 ?auto_231176 ) ) ( not ( = ?auto_231171 ?auto_231177 ) ) ( not ( = ?auto_231171 ?auto_231178 ) ) ( not ( = ?auto_231171 ?auto_231179 ) ) ( not ( = ?auto_231171 ?auto_231180 ) ) ( not ( = ?auto_231171 ?auto_231181 ) ) ( not ( = ?auto_231172 ?auto_231173 ) ) ( not ( = ?auto_231172 ?auto_231174 ) ) ( not ( = ?auto_231172 ?auto_231175 ) ) ( not ( = ?auto_231172 ?auto_231176 ) ) ( not ( = ?auto_231172 ?auto_231177 ) ) ( not ( = ?auto_231172 ?auto_231178 ) ) ( not ( = ?auto_231172 ?auto_231179 ) ) ( not ( = ?auto_231172 ?auto_231180 ) ) ( not ( = ?auto_231172 ?auto_231181 ) ) ( not ( = ?auto_231173 ?auto_231174 ) ) ( not ( = ?auto_231173 ?auto_231175 ) ) ( not ( = ?auto_231173 ?auto_231176 ) ) ( not ( = ?auto_231173 ?auto_231177 ) ) ( not ( = ?auto_231173 ?auto_231178 ) ) ( not ( = ?auto_231173 ?auto_231179 ) ) ( not ( = ?auto_231173 ?auto_231180 ) ) ( not ( = ?auto_231173 ?auto_231181 ) ) ( not ( = ?auto_231174 ?auto_231175 ) ) ( not ( = ?auto_231174 ?auto_231176 ) ) ( not ( = ?auto_231174 ?auto_231177 ) ) ( not ( = ?auto_231174 ?auto_231178 ) ) ( not ( = ?auto_231174 ?auto_231179 ) ) ( not ( = ?auto_231174 ?auto_231180 ) ) ( not ( = ?auto_231174 ?auto_231181 ) ) ( not ( = ?auto_231175 ?auto_231176 ) ) ( not ( = ?auto_231175 ?auto_231177 ) ) ( not ( = ?auto_231175 ?auto_231178 ) ) ( not ( = ?auto_231175 ?auto_231179 ) ) ( not ( = ?auto_231175 ?auto_231180 ) ) ( not ( = ?auto_231175 ?auto_231181 ) ) ( not ( = ?auto_231176 ?auto_231177 ) ) ( not ( = ?auto_231176 ?auto_231178 ) ) ( not ( = ?auto_231176 ?auto_231179 ) ) ( not ( = ?auto_231176 ?auto_231180 ) ) ( not ( = ?auto_231176 ?auto_231181 ) ) ( not ( = ?auto_231177 ?auto_231178 ) ) ( not ( = ?auto_231177 ?auto_231179 ) ) ( not ( = ?auto_231177 ?auto_231180 ) ) ( not ( = ?auto_231177 ?auto_231181 ) ) ( not ( = ?auto_231178 ?auto_231179 ) ) ( not ( = ?auto_231178 ?auto_231180 ) ) ( not ( = ?auto_231178 ?auto_231181 ) ) ( not ( = ?auto_231179 ?auto_231180 ) ) ( not ( = ?auto_231179 ?auto_231181 ) ) ( not ( = ?auto_231180 ?auto_231181 ) ) ( ON ?auto_231179 ?auto_231180 ) ( ON ?auto_231178 ?auto_231179 ) ( CLEAR ?auto_231176 ) ( ON ?auto_231177 ?auto_231178 ) ( CLEAR ?auto_231177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_231171 ?auto_231172 ?auto_231173 ?auto_231174 ?auto_231175 ?auto_231176 ?auto_231177 )
      ( MAKE-10PILE ?auto_231171 ?auto_231172 ?auto_231173 ?auto_231174 ?auto_231175 ?auto_231176 ?auto_231177 ?auto_231178 ?auto_231179 ?auto_231180 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231192 - BLOCK
      ?auto_231193 - BLOCK
      ?auto_231194 - BLOCK
      ?auto_231195 - BLOCK
      ?auto_231196 - BLOCK
      ?auto_231197 - BLOCK
      ?auto_231198 - BLOCK
      ?auto_231199 - BLOCK
      ?auto_231200 - BLOCK
      ?auto_231201 - BLOCK
    )
    :vars
    (
      ?auto_231202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231201 ?auto_231202 ) ( ON-TABLE ?auto_231192 ) ( ON ?auto_231193 ?auto_231192 ) ( ON ?auto_231194 ?auto_231193 ) ( ON ?auto_231195 ?auto_231194 ) ( ON ?auto_231196 ?auto_231195 ) ( not ( = ?auto_231192 ?auto_231193 ) ) ( not ( = ?auto_231192 ?auto_231194 ) ) ( not ( = ?auto_231192 ?auto_231195 ) ) ( not ( = ?auto_231192 ?auto_231196 ) ) ( not ( = ?auto_231192 ?auto_231197 ) ) ( not ( = ?auto_231192 ?auto_231198 ) ) ( not ( = ?auto_231192 ?auto_231199 ) ) ( not ( = ?auto_231192 ?auto_231200 ) ) ( not ( = ?auto_231192 ?auto_231201 ) ) ( not ( = ?auto_231192 ?auto_231202 ) ) ( not ( = ?auto_231193 ?auto_231194 ) ) ( not ( = ?auto_231193 ?auto_231195 ) ) ( not ( = ?auto_231193 ?auto_231196 ) ) ( not ( = ?auto_231193 ?auto_231197 ) ) ( not ( = ?auto_231193 ?auto_231198 ) ) ( not ( = ?auto_231193 ?auto_231199 ) ) ( not ( = ?auto_231193 ?auto_231200 ) ) ( not ( = ?auto_231193 ?auto_231201 ) ) ( not ( = ?auto_231193 ?auto_231202 ) ) ( not ( = ?auto_231194 ?auto_231195 ) ) ( not ( = ?auto_231194 ?auto_231196 ) ) ( not ( = ?auto_231194 ?auto_231197 ) ) ( not ( = ?auto_231194 ?auto_231198 ) ) ( not ( = ?auto_231194 ?auto_231199 ) ) ( not ( = ?auto_231194 ?auto_231200 ) ) ( not ( = ?auto_231194 ?auto_231201 ) ) ( not ( = ?auto_231194 ?auto_231202 ) ) ( not ( = ?auto_231195 ?auto_231196 ) ) ( not ( = ?auto_231195 ?auto_231197 ) ) ( not ( = ?auto_231195 ?auto_231198 ) ) ( not ( = ?auto_231195 ?auto_231199 ) ) ( not ( = ?auto_231195 ?auto_231200 ) ) ( not ( = ?auto_231195 ?auto_231201 ) ) ( not ( = ?auto_231195 ?auto_231202 ) ) ( not ( = ?auto_231196 ?auto_231197 ) ) ( not ( = ?auto_231196 ?auto_231198 ) ) ( not ( = ?auto_231196 ?auto_231199 ) ) ( not ( = ?auto_231196 ?auto_231200 ) ) ( not ( = ?auto_231196 ?auto_231201 ) ) ( not ( = ?auto_231196 ?auto_231202 ) ) ( not ( = ?auto_231197 ?auto_231198 ) ) ( not ( = ?auto_231197 ?auto_231199 ) ) ( not ( = ?auto_231197 ?auto_231200 ) ) ( not ( = ?auto_231197 ?auto_231201 ) ) ( not ( = ?auto_231197 ?auto_231202 ) ) ( not ( = ?auto_231198 ?auto_231199 ) ) ( not ( = ?auto_231198 ?auto_231200 ) ) ( not ( = ?auto_231198 ?auto_231201 ) ) ( not ( = ?auto_231198 ?auto_231202 ) ) ( not ( = ?auto_231199 ?auto_231200 ) ) ( not ( = ?auto_231199 ?auto_231201 ) ) ( not ( = ?auto_231199 ?auto_231202 ) ) ( not ( = ?auto_231200 ?auto_231201 ) ) ( not ( = ?auto_231200 ?auto_231202 ) ) ( not ( = ?auto_231201 ?auto_231202 ) ) ( ON ?auto_231200 ?auto_231201 ) ( ON ?auto_231199 ?auto_231200 ) ( ON ?auto_231198 ?auto_231199 ) ( CLEAR ?auto_231196 ) ( ON ?auto_231197 ?auto_231198 ) ( CLEAR ?auto_231197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_231192 ?auto_231193 ?auto_231194 ?auto_231195 ?auto_231196 ?auto_231197 )
      ( MAKE-10PILE ?auto_231192 ?auto_231193 ?auto_231194 ?auto_231195 ?auto_231196 ?auto_231197 ?auto_231198 ?auto_231199 ?auto_231200 ?auto_231201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231213 - BLOCK
      ?auto_231214 - BLOCK
      ?auto_231215 - BLOCK
      ?auto_231216 - BLOCK
      ?auto_231217 - BLOCK
      ?auto_231218 - BLOCK
      ?auto_231219 - BLOCK
      ?auto_231220 - BLOCK
      ?auto_231221 - BLOCK
      ?auto_231222 - BLOCK
    )
    :vars
    (
      ?auto_231223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231222 ?auto_231223 ) ( ON-TABLE ?auto_231213 ) ( ON ?auto_231214 ?auto_231213 ) ( ON ?auto_231215 ?auto_231214 ) ( ON ?auto_231216 ?auto_231215 ) ( ON ?auto_231217 ?auto_231216 ) ( not ( = ?auto_231213 ?auto_231214 ) ) ( not ( = ?auto_231213 ?auto_231215 ) ) ( not ( = ?auto_231213 ?auto_231216 ) ) ( not ( = ?auto_231213 ?auto_231217 ) ) ( not ( = ?auto_231213 ?auto_231218 ) ) ( not ( = ?auto_231213 ?auto_231219 ) ) ( not ( = ?auto_231213 ?auto_231220 ) ) ( not ( = ?auto_231213 ?auto_231221 ) ) ( not ( = ?auto_231213 ?auto_231222 ) ) ( not ( = ?auto_231213 ?auto_231223 ) ) ( not ( = ?auto_231214 ?auto_231215 ) ) ( not ( = ?auto_231214 ?auto_231216 ) ) ( not ( = ?auto_231214 ?auto_231217 ) ) ( not ( = ?auto_231214 ?auto_231218 ) ) ( not ( = ?auto_231214 ?auto_231219 ) ) ( not ( = ?auto_231214 ?auto_231220 ) ) ( not ( = ?auto_231214 ?auto_231221 ) ) ( not ( = ?auto_231214 ?auto_231222 ) ) ( not ( = ?auto_231214 ?auto_231223 ) ) ( not ( = ?auto_231215 ?auto_231216 ) ) ( not ( = ?auto_231215 ?auto_231217 ) ) ( not ( = ?auto_231215 ?auto_231218 ) ) ( not ( = ?auto_231215 ?auto_231219 ) ) ( not ( = ?auto_231215 ?auto_231220 ) ) ( not ( = ?auto_231215 ?auto_231221 ) ) ( not ( = ?auto_231215 ?auto_231222 ) ) ( not ( = ?auto_231215 ?auto_231223 ) ) ( not ( = ?auto_231216 ?auto_231217 ) ) ( not ( = ?auto_231216 ?auto_231218 ) ) ( not ( = ?auto_231216 ?auto_231219 ) ) ( not ( = ?auto_231216 ?auto_231220 ) ) ( not ( = ?auto_231216 ?auto_231221 ) ) ( not ( = ?auto_231216 ?auto_231222 ) ) ( not ( = ?auto_231216 ?auto_231223 ) ) ( not ( = ?auto_231217 ?auto_231218 ) ) ( not ( = ?auto_231217 ?auto_231219 ) ) ( not ( = ?auto_231217 ?auto_231220 ) ) ( not ( = ?auto_231217 ?auto_231221 ) ) ( not ( = ?auto_231217 ?auto_231222 ) ) ( not ( = ?auto_231217 ?auto_231223 ) ) ( not ( = ?auto_231218 ?auto_231219 ) ) ( not ( = ?auto_231218 ?auto_231220 ) ) ( not ( = ?auto_231218 ?auto_231221 ) ) ( not ( = ?auto_231218 ?auto_231222 ) ) ( not ( = ?auto_231218 ?auto_231223 ) ) ( not ( = ?auto_231219 ?auto_231220 ) ) ( not ( = ?auto_231219 ?auto_231221 ) ) ( not ( = ?auto_231219 ?auto_231222 ) ) ( not ( = ?auto_231219 ?auto_231223 ) ) ( not ( = ?auto_231220 ?auto_231221 ) ) ( not ( = ?auto_231220 ?auto_231222 ) ) ( not ( = ?auto_231220 ?auto_231223 ) ) ( not ( = ?auto_231221 ?auto_231222 ) ) ( not ( = ?auto_231221 ?auto_231223 ) ) ( not ( = ?auto_231222 ?auto_231223 ) ) ( ON ?auto_231221 ?auto_231222 ) ( ON ?auto_231220 ?auto_231221 ) ( ON ?auto_231219 ?auto_231220 ) ( CLEAR ?auto_231217 ) ( ON ?auto_231218 ?auto_231219 ) ( CLEAR ?auto_231218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_231213 ?auto_231214 ?auto_231215 ?auto_231216 ?auto_231217 ?auto_231218 )
      ( MAKE-10PILE ?auto_231213 ?auto_231214 ?auto_231215 ?auto_231216 ?auto_231217 ?auto_231218 ?auto_231219 ?auto_231220 ?auto_231221 ?auto_231222 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231234 - BLOCK
      ?auto_231235 - BLOCK
      ?auto_231236 - BLOCK
      ?auto_231237 - BLOCK
      ?auto_231238 - BLOCK
      ?auto_231239 - BLOCK
      ?auto_231240 - BLOCK
      ?auto_231241 - BLOCK
      ?auto_231242 - BLOCK
      ?auto_231243 - BLOCK
    )
    :vars
    (
      ?auto_231244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231243 ?auto_231244 ) ( ON-TABLE ?auto_231234 ) ( ON ?auto_231235 ?auto_231234 ) ( ON ?auto_231236 ?auto_231235 ) ( ON ?auto_231237 ?auto_231236 ) ( not ( = ?auto_231234 ?auto_231235 ) ) ( not ( = ?auto_231234 ?auto_231236 ) ) ( not ( = ?auto_231234 ?auto_231237 ) ) ( not ( = ?auto_231234 ?auto_231238 ) ) ( not ( = ?auto_231234 ?auto_231239 ) ) ( not ( = ?auto_231234 ?auto_231240 ) ) ( not ( = ?auto_231234 ?auto_231241 ) ) ( not ( = ?auto_231234 ?auto_231242 ) ) ( not ( = ?auto_231234 ?auto_231243 ) ) ( not ( = ?auto_231234 ?auto_231244 ) ) ( not ( = ?auto_231235 ?auto_231236 ) ) ( not ( = ?auto_231235 ?auto_231237 ) ) ( not ( = ?auto_231235 ?auto_231238 ) ) ( not ( = ?auto_231235 ?auto_231239 ) ) ( not ( = ?auto_231235 ?auto_231240 ) ) ( not ( = ?auto_231235 ?auto_231241 ) ) ( not ( = ?auto_231235 ?auto_231242 ) ) ( not ( = ?auto_231235 ?auto_231243 ) ) ( not ( = ?auto_231235 ?auto_231244 ) ) ( not ( = ?auto_231236 ?auto_231237 ) ) ( not ( = ?auto_231236 ?auto_231238 ) ) ( not ( = ?auto_231236 ?auto_231239 ) ) ( not ( = ?auto_231236 ?auto_231240 ) ) ( not ( = ?auto_231236 ?auto_231241 ) ) ( not ( = ?auto_231236 ?auto_231242 ) ) ( not ( = ?auto_231236 ?auto_231243 ) ) ( not ( = ?auto_231236 ?auto_231244 ) ) ( not ( = ?auto_231237 ?auto_231238 ) ) ( not ( = ?auto_231237 ?auto_231239 ) ) ( not ( = ?auto_231237 ?auto_231240 ) ) ( not ( = ?auto_231237 ?auto_231241 ) ) ( not ( = ?auto_231237 ?auto_231242 ) ) ( not ( = ?auto_231237 ?auto_231243 ) ) ( not ( = ?auto_231237 ?auto_231244 ) ) ( not ( = ?auto_231238 ?auto_231239 ) ) ( not ( = ?auto_231238 ?auto_231240 ) ) ( not ( = ?auto_231238 ?auto_231241 ) ) ( not ( = ?auto_231238 ?auto_231242 ) ) ( not ( = ?auto_231238 ?auto_231243 ) ) ( not ( = ?auto_231238 ?auto_231244 ) ) ( not ( = ?auto_231239 ?auto_231240 ) ) ( not ( = ?auto_231239 ?auto_231241 ) ) ( not ( = ?auto_231239 ?auto_231242 ) ) ( not ( = ?auto_231239 ?auto_231243 ) ) ( not ( = ?auto_231239 ?auto_231244 ) ) ( not ( = ?auto_231240 ?auto_231241 ) ) ( not ( = ?auto_231240 ?auto_231242 ) ) ( not ( = ?auto_231240 ?auto_231243 ) ) ( not ( = ?auto_231240 ?auto_231244 ) ) ( not ( = ?auto_231241 ?auto_231242 ) ) ( not ( = ?auto_231241 ?auto_231243 ) ) ( not ( = ?auto_231241 ?auto_231244 ) ) ( not ( = ?auto_231242 ?auto_231243 ) ) ( not ( = ?auto_231242 ?auto_231244 ) ) ( not ( = ?auto_231243 ?auto_231244 ) ) ( ON ?auto_231242 ?auto_231243 ) ( ON ?auto_231241 ?auto_231242 ) ( ON ?auto_231240 ?auto_231241 ) ( ON ?auto_231239 ?auto_231240 ) ( CLEAR ?auto_231237 ) ( ON ?auto_231238 ?auto_231239 ) ( CLEAR ?auto_231238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_231234 ?auto_231235 ?auto_231236 ?auto_231237 ?auto_231238 )
      ( MAKE-10PILE ?auto_231234 ?auto_231235 ?auto_231236 ?auto_231237 ?auto_231238 ?auto_231239 ?auto_231240 ?auto_231241 ?auto_231242 ?auto_231243 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231255 - BLOCK
      ?auto_231256 - BLOCK
      ?auto_231257 - BLOCK
      ?auto_231258 - BLOCK
      ?auto_231259 - BLOCK
      ?auto_231260 - BLOCK
      ?auto_231261 - BLOCK
      ?auto_231262 - BLOCK
      ?auto_231263 - BLOCK
      ?auto_231264 - BLOCK
    )
    :vars
    (
      ?auto_231265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231264 ?auto_231265 ) ( ON-TABLE ?auto_231255 ) ( ON ?auto_231256 ?auto_231255 ) ( ON ?auto_231257 ?auto_231256 ) ( ON ?auto_231258 ?auto_231257 ) ( not ( = ?auto_231255 ?auto_231256 ) ) ( not ( = ?auto_231255 ?auto_231257 ) ) ( not ( = ?auto_231255 ?auto_231258 ) ) ( not ( = ?auto_231255 ?auto_231259 ) ) ( not ( = ?auto_231255 ?auto_231260 ) ) ( not ( = ?auto_231255 ?auto_231261 ) ) ( not ( = ?auto_231255 ?auto_231262 ) ) ( not ( = ?auto_231255 ?auto_231263 ) ) ( not ( = ?auto_231255 ?auto_231264 ) ) ( not ( = ?auto_231255 ?auto_231265 ) ) ( not ( = ?auto_231256 ?auto_231257 ) ) ( not ( = ?auto_231256 ?auto_231258 ) ) ( not ( = ?auto_231256 ?auto_231259 ) ) ( not ( = ?auto_231256 ?auto_231260 ) ) ( not ( = ?auto_231256 ?auto_231261 ) ) ( not ( = ?auto_231256 ?auto_231262 ) ) ( not ( = ?auto_231256 ?auto_231263 ) ) ( not ( = ?auto_231256 ?auto_231264 ) ) ( not ( = ?auto_231256 ?auto_231265 ) ) ( not ( = ?auto_231257 ?auto_231258 ) ) ( not ( = ?auto_231257 ?auto_231259 ) ) ( not ( = ?auto_231257 ?auto_231260 ) ) ( not ( = ?auto_231257 ?auto_231261 ) ) ( not ( = ?auto_231257 ?auto_231262 ) ) ( not ( = ?auto_231257 ?auto_231263 ) ) ( not ( = ?auto_231257 ?auto_231264 ) ) ( not ( = ?auto_231257 ?auto_231265 ) ) ( not ( = ?auto_231258 ?auto_231259 ) ) ( not ( = ?auto_231258 ?auto_231260 ) ) ( not ( = ?auto_231258 ?auto_231261 ) ) ( not ( = ?auto_231258 ?auto_231262 ) ) ( not ( = ?auto_231258 ?auto_231263 ) ) ( not ( = ?auto_231258 ?auto_231264 ) ) ( not ( = ?auto_231258 ?auto_231265 ) ) ( not ( = ?auto_231259 ?auto_231260 ) ) ( not ( = ?auto_231259 ?auto_231261 ) ) ( not ( = ?auto_231259 ?auto_231262 ) ) ( not ( = ?auto_231259 ?auto_231263 ) ) ( not ( = ?auto_231259 ?auto_231264 ) ) ( not ( = ?auto_231259 ?auto_231265 ) ) ( not ( = ?auto_231260 ?auto_231261 ) ) ( not ( = ?auto_231260 ?auto_231262 ) ) ( not ( = ?auto_231260 ?auto_231263 ) ) ( not ( = ?auto_231260 ?auto_231264 ) ) ( not ( = ?auto_231260 ?auto_231265 ) ) ( not ( = ?auto_231261 ?auto_231262 ) ) ( not ( = ?auto_231261 ?auto_231263 ) ) ( not ( = ?auto_231261 ?auto_231264 ) ) ( not ( = ?auto_231261 ?auto_231265 ) ) ( not ( = ?auto_231262 ?auto_231263 ) ) ( not ( = ?auto_231262 ?auto_231264 ) ) ( not ( = ?auto_231262 ?auto_231265 ) ) ( not ( = ?auto_231263 ?auto_231264 ) ) ( not ( = ?auto_231263 ?auto_231265 ) ) ( not ( = ?auto_231264 ?auto_231265 ) ) ( ON ?auto_231263 ?auto_231264 ) ( ON ?auto_231262 ?auto_231263 ) ( ON ?auto_231261 ?auto_231262 ) ( ON ?auto_231260 ?auto_231261 ) ( CLEAR ?auto_231258 ) ( ON ?auto_231259 ?auto_231260 ) ( CLEAR ?auto_231259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_231255 ?auto_231256 ?auto_231257 ?auto_231258 ?auto_231259 )
      ( MAKE-10PILE ?auto_231255 ?auto_231256 ?auto_231257 ?auto_231258 ?auto_231259 ?auto_231260 ?auto_231261 ?auto_231262 ?auto_231263 ?auto_231264 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231276 - BLOCK
      ?auto_231277 - BLOCK
      ?auto_231278 - BLOCK
      ?auto_231279 - BLOCK
      ?auto_231280 - BLOCK
      ?auto_231281 - BLOCK
      ?auto_231282 - BLOCK
      ?auto_231283 - BLOCK
      ?auto_231284 - BLOCK
      ?auto_231285 - BLOCK
    )
    :vars
    (
      ?auto_231286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231285 ?auto_231286 ) ( ON-TABLE ?auto_231276 ) ( ON ?auto_231277 ?auto_231276 ) ( ON ?auto_231278 ?auto_231277 ) ( not ( = ?auto_231276 ?auto_231277 ) ) ( not ( = ?auto_231276 ?auto_231278 ) ) ( not ( = ?auto_231276 ?auto_231279 ) ) ( not ( = ?auto_231276 ?auto_231280 ) ) ( not ( = ?auto_231276 ?auto_231281 ) ) ( not ( = ?auto_231276 ?auto_231282 ) ) ( not ( = ?auto_231276 ?auto_231283 ) ) ( not ( = ?auto_231276 ?auto_231284 ) ) ( not ( = ?auto_231276 ?auto_231285 ) ) ( not ( = ?auto_231276 ?auto_231286 ) ) ( not ( = ?auto_231277 ?auto_231278 ) ) ( not ( = ?auto_231277 ?auto_231279 ) ) ( not ( = ?auto_231277 ?auto_231280 ) ) ( not ( = ?auto_231277 ?auto_231281 ) ) ( not ( = ?auto_231277 ?auto_231282 ) ) ( not ( = ?auto_231277 ?auto_231283 ) ) ( not ( = ?auto_231277 ?auto_231284 ) ) ( not ( = ?auto_231277 ?auto_231285 ) ) ( not ( = ?auto_231277 ?auto_231286 ) ) ( not ( = ?auto_231278 ?auto_231279 ) ) ( not ( = ?auto_231278 ?auto_231280 ) ) ( not ( = ?auto_231278 ?auto_231281 ) ) ( not ( = ?auto_231278 ?auto_231282 ) ) ( not ( = ?auto_231278 ?auto_231283 ) ) ( not ( = ?auto_231278 ?auto_231284 ) ) ( not ( = ?auto_231278 ?auto_231285 ) ) ( not ( = ?auto_231278 ?auto_231286 ) ) ( not ( = ?auto_231279 ?auto_231280 ) ) ( not ( = ?auto_231279 ?auto_231281 ) ) ( not ( = ?auto_231279 ?auto_231282 ) ) ( not ( = ?auto_231279 ?auto_231283 ) ) ( not ( = ?auto_231279 ?auto_231284 ) ) ( not ( = ?auto_231279 ?auto_231285 ) ) ( not ( = ?auto_231279 ?auto_231286 ) ) ( not ( = ?auto_231280 ?auto_231281 ) ) ( not ( = ?auto_231280 ?auto_231282 ) ) ( not ( = ?auto_231280 ?auto_231283 ) ) ( not ( = ?auto_231280 ?auto_231284 ) ) ( not ( = ?auto_231280 ?auto_231285 ) ) ( not ( = ?auto_231280 ?auto_231286 ) ) ( not ( = ?auto_231281 ?auto_231282 ) ) ( not ( = ?auto_231281 ?auto_231283 ) ) ( not ( = ?auto_231281 ?auto_231284 ) ) ( not ( = ?auto_231281 ?auto_231285 ) ) ( not ( = ?auto_231281 ?auto_231286 ) ) ( not ( = ?auto_231282 ?auto_231283 ) ) ( not ( = ?auto_231282 ?auto_231284 ) ) ( not ( = ?auto_231282 ?auto_231285 ) ) ( not ( = ?auto_231282 ?auto_231286 ) ) ( not ( = ?auto_231283 ?auto_231284 ) ) ( not ( = ?auto_231283 ?auto_231285 ) ) ( not ( = ?auto_231283 ?auto_231286 ) ) ( not ( = ?auto_231284 ?auto_231285 ) ) ( not ( = ?auto_231284 ?auto_231286 ) ) ( not ( = ?auto_231285 ?auto_231286 ) ) ( ON ?auto_231284 ?auto_231285 ) ( ON ?auto_231283 ?auto_231284 ) ( ON ?auto_231282 ?auto_231283 ) ( ON ?auto_231281 ?auto_231282 ) ( ON ?auto_231280 ?auto_231281 ) ( CLEAR ?auto_231278 ) ( ON ?auto_231279 ?auto_231280 ) ( CLEAR ?auto_231279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_231276 ?auto_231277 ?auto_231278 ?auto_231279 )
      ( MAKE-10PILE ?auto_231276 ?auto_231277 ?auto_231278 ?auto_231279 ?auto_231280 ?auto_231281 ?auto_231282 ?auto_231283 ?auto_231284 ?auto_231285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231297 - BLOCK
      ?auto_231298 - BLOCK
      ?auto_231299 - BLOCK
      ?auto_231300 - BLOCK
      ?auto_231301 - BLOCK
      ?auto_231302 - BLOCK
      ?auto_231303 - BLOCK
      ?auto_231304 - BLOCK
      ?auto_231305 - BLOCK
      ?auto_231306 - BLOCK
    )
    :vars
    (
      ?auto_231307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231306 ?auto_231307 ) ( ON-TABLE ?auto_231297 ) ( ON ?auto_231298 ?auto_231297 ) ( ON ?auto_231299 ?auto_231298 ) ( not ( = ?auto_231297 ?auto_231298 ) ) ( not ( = ?auto_231297 ?auto_231299 ) ) ( not ( = ?auto_231297 ?auto_231300 ) ) ( not ( = ?auto_231297 ?auto_231301 ) ) ( not ( = ?auto_231297 ?auto_231302 ) ) ( not ( = ?auto_231297 ?auto_231303 ) ) ( not ( = ?auto_231297 ?auto_231304 ) ) ( not ( = ?auto_231297 ?auto_231305 ) ) ( not ( = ?auto_231297 ?auto_231306 ) ) ( not ( = ?auto_231297 ?auto_231307 ) ) ( not ( = ?auto_231298 ?auto_231299 ) ) ( not ( = ?auto_231298 ?auto_231300 ) ) ( not ( = ?auto_231298 ?auto_231301 ) ) ( not ( = ?auto_231298 ?auto_231302 ) ) ( not ( = ?auto_231298 ?auto_231303 ) ) ( not ( = ?auto_231298 ?auto_231304 ) ) ( not ( = ?auto_231298 ?auto_231305 ) ) ( not ( = ?auto_231298 ?auto_231306 ) ) ( not ( = ?auto_231298 ?auto_231307 ) ) ( not ( = ?auto_231299 ?auto_231300 ) ) ( not ( = ?auto_231299 ?auto_231301 ) ) ( not ( = ?auto_231299 ?auto_231302 ) ) ( not ( = ?auto_231299 ?auto_231303 ) ) ( not ( = ?auto_231299 ?auto_231304 ) ) ( not ( = ?auto_231299 ?auto_231305 ) ) ( not ( = ?auto_231299 ?auto_231306 ) ) ( not ( = ?auto_231299 ?auto_231307 ) ) ( not ( = ?auto_231300 ?auto_231301 ) ) ( not ( = ?auto_231300 ?auto_231302 ) ) ( not ( = ?auto_231300 ?auto_231303 ) ) ( not ( = ?auto_231300 ?auto_231304 ) ) ( not ( = ?auto_231300 ?auto_231305 ) ) ( not ( = ?auto_231300 ?auto_231306 ) ) ( not ( = ?auto_231300 ?auto_231307 ) ) ( not ( = ?auto_231301 ?auto_231302 ) ) ( not ( = ?auto_231301 ?auto_231303 ) ) ( not ( = ?auto_231301 ?auto_231304 ) ) ( not ( = ?auto_231301 ?auto_231305 ) ) ( not ( = ?auto_231301 ?auto_231306 ) ) ( not ( = ?auto_231301 ?auto_231307 ) ) ( not ( = ?auto_231302 ?auto_231303 ) ) ( not ( = ?auto_231302 ?auto_231304 ) ) ( not ( = ?auto_231302 ?auto_231305 ) ) ( not ( = ?auto_231302 ?auto_231306 ) ) ( not ( = ?auto_231302 ?auto_231307 ) ) ( not ( = ?auto_231303 ?auto_231304 ) ) ( not ( = ?auto_231303 ?auto_231305 ) ) ( not ( = ?auto_231303 ?auto_231306 ) ) ( not ( = ?auto_231303 ?auto_231307 ) ) ( not ( = ?auto_231304 ?auto_231305 ) ) ( not ( = ?auto_231304 ?auto_231306 ) ) ( not ( = ?auto_231304 ?auto_231307 ) ) ( not ( = ?auto_231305 ?auto_231306 ) ) ( not ( = ?auto_231305 ?auto_231307 ) ) ( not ( = ?auto_231306 ?auto_231307 ) ) ( ON ?auto_231305 ?auto_231306 ) ( ON ?auto_231304 ?auto_231305 ) ( ON ?auto_231303 ?auto_231304 ) ( ON ?auto_231302 ?auto_231303 ) ( ON ?auto_231301 ?auto_231302 ) ( CLEAR ?auto_231299 ) ( ON ?auto_231300 ?auto_231301 ) ( CLEAR ?auto_231300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_231297 ?auto_231298 ?auto_231299 ?auto_231300 )
      ( MAKE-10PILE ?auto_231297 ?auto_231298 ?auto_231299 ?auto_231300 ?auto_231301 ?auto_231302 ?auto_231303 ?auto_231304 ?auto_231305 ?auto_231306 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231318 - BLOCK
      ?auto_231319 - BLOCK
      ?auto_231320 - BLOCK
      ?auto_231321 - BLOCK
      ?auto_231322 - BLOCK
      ?auto_231323 - BLOCK
      ?auto_231324 - BLOCK
      ?auto_231325 - BLOCK
      ?auto_231326 - BLOCK
      ?auto_231327 - BLOCK
    )
    :vars
    (
      ?auto_231328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231327 ?auto_231328 ) ( ON-TABLE ?auto_231318 ) ( ON ?auto_231319 ?auto_231318 ) ( not ( = ?auto_231318 ?auto_231319 ) ) ( not ( = ?auto_231318 ?auto_231320 ) ) ( not ( = ?auto_231318 ?auto_231321 ) ) ( not ( = ?auto_231318 ?auto_231322 ) ) ( not ( = ?auto_231318 ?auto_231323 ) ) ( not ( = ?auto_231318 ?auto_231324 ) ) ( not ( = ?auto_231318 ?auto_231325 ) ) ( not ( = ?auto_231318 ?auto_231326 ) ) ( not ( = ?auto_231318 ?auto_231327 ) ) ( not ( = ?auto_231318 ?auto_231328 ) ) ( not ( = ?auto_231319 ?auto_231320 ) ) ( not ( = ?auto_231319 ?auto_231321 ) ) ( not ( = ?auto_231319 ?auto_231322 ) ) ( not ( = ?auto_231319 ?auto_231323 ) ) ( not ( = ?auto_231319 ?auto_231324 ) ) ( not ( = ?auto_231319 ?auto_231325 ) ) ( not ( = ?auto_231319 ?auto_231326 ) ) ( not ( = ?auto_231319 ?auto_231327 ) ) ( not ( = ?auto_231319 ?auto_231328 ) ) ( not ( = ?auto_231320 ?auto_231321 ) ) ( not ( = ?auto_231320 ?auto_231322 ) ) ( not ( = ?auto_231320 ?auto_231323 ) ) ( not ( = ?auto_231320 ?auto_231324 ) ) ( not ( = ?auto_231320 ?auto_231325 ) ) ( not ( = ?auto_231320 ?auto_231326 ) ) ( not ( = ?auto_231320 ?auto_231327 ) ) ( not ( = ?auto_231320 ?auto_231328 ) ) ( not ( = ?auto_231321 ?auto_231322 ) ) ( not ( = ?auto_231321 ?auto_231323 ) ) ( not ( = ?auto_231321 ?auto_231324 ) ) ( not ( = ?auto_231321 ?auto_231325 ) ) ( not ( = ?auto_231321 ?auto_231326 ) ) ( not ( = ?auto_231321 ?auto_231327 ) ) ( not ( = ?auto_231321 ?auto_231328 ) ) ( not ( = ?auto_231322 ?auto_231323 ) ) ( not ( = ?auto_231322 ?auto_231324 ) ) ( not ( = ?auto_231322 ?auto_231325 ) ) ( not ( = ?auto_231322 ?auto_231326 ) ) ( not ( = ?auto_231322 ?auto_231327 ) ) ( not ( = ?auto_231322 ?auto_231328 ) ) ( not ( = ?auto_231323 ?auto_231324 ) ) ( not ( = ?auto_231323 ?auto_231325 ) ) ( not ( = ?auto_231323 ?auto_231326 ) ) ( not ( = ?auto_231323 ?auto_231327 ) ) ( not ( = ?auto_231323 ?auto_231328 ) ) ( not ( = ?auto_231324 ?auto_231325 ) ) ( not ( = ?auto_231324 ?auto_231326 ) ) ( not ( = ?auto_231324 ?auto_231327 ) ) ( not ( = ?auto_231324 ?auto_231328 ) ) ( not ( = ?auto_231325 ?auto_231326 ) ) ( not ( = ?auto_231325 ?auto_231327 ) ) ( not ( = ?auto_231325 ?auto_231328 ) ) ( not ( = ?auto_231326 ?auto_231327 ) ) ( not ( = ?auto_231326 ?auto_231328 ) ) ( not ( = ?auto_231327 ?auto_231328 ) ) ( ON ?auto_231326 ?auto_231327 ) ( ON ?auto_231325 ?auto_231326 ) ( ON ?auto_231324 ?auto_231325 ) ( ON ?auto_231323 ?auto_231324 ) ( ON ?auto_231322 ?auto_231323 ) ( ON ?auto_231321 ?auto_231322 ) ( CLEAR ?auto_231319 ) ( ON ?auto_231320 ?auto_231321 ) ( CLEAR ?auto_231320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_231318 ?auto_231319 ?auto_231320 )
      ( MAKE-10PILE ?auto_231318 ?auto_231319 ?auto_231320 ?auto_231321 ?auto_231322 ?auto_231323 ?auto_231324 ?auto_231325 ?auto_231326 ?auto_231327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231339 - BLOCK
      ?auto_231340 - BLOCK
      ?auto_231341 - BLOCK
      ?auto_231342 - BLOCK
      ?auto_231343 - BLOCK
      ?auto_231344 - BLOCK
      ?auto_231345 - BLOCK
      ?auto_231346 - BLOCK
      ?auto_231347 - BLOCK
      ?auto_231348 - BLOCK
    )
    :vars
    (
      ?auto_231349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231348 ?auto_231349 ) ( ON-TABLE ?auto_231339 ) ( ON ?auto_231340 ?auto_231339 ) ( not ( = ?auto_231339 ?auto_231340 ) ) ( not ( = ?auto_231339 ?auto_231341 ) ) ( not ( = ?auto_231339 ?auto_231342 ) ) ( not ( = ?auto_231339 ?auto_231343 ) ) ( not ( = ?auto_231339 ?auto_231344 ) ) ( not ( = ?auto_231339 ?auto_231345 ) ) ( not ( = ?auto_231339 ?auto_231346 ) ) ( not ( = ?auto_231339 ?auto_231347 ) ) ( not ( = ?auto_231339 ?auto_231348 ) ) ( not ( = ?auto_231339 ?auto_231349 ) ) ( not ( = ?auto_231340 ?auto_231341 ) ) ( not ( = ?auto_231340 ?auto_231342 ) ) ( not ( = ?auto_231340 ?auto_231343 ) ) ( not ( = ?auto_231340 ?auto_231344 ) ) ( not ( = ?auto_231340 ?auto_231345 ) ) ( not ( = ?auto_231340 ?auto_231346 ) ) ( not ( = ?auto_231340 ?auto_231347 ) ) ( not ( = ?auto_231340 ?auto_231348 ) ) ( not ( = ?auto_231340 ?auto_231349 ) ) ( not ( = ?auto_231341 ?auto_231342 ) ) ( not ( = ?auto_231341 ?auto_231343 ) ) ( not ( = ?auto_231341 ?auto_231344 ) ) ( not ( = ?auto_231341 ?auto_231345 ) ) ( not ( = ?auto_231341 ?auto_231346 ) ) ( not ( = ?auto_231341 ?auto_231347 ) ) ( not ( = ?auto_231341 ?auto_231348 ) ) ( not ( = ?auto_231341 ?auto_231349 ) ) ( not ( = ?auto_231342 ?auto_231343 ) ) ( not ( = ?auto_231342 ?auto_231344 ) ) ( not ( = ?auto_231342 ?auto_231345 ) ) ( not ( = ?auto_231342 ?auto_231346 ) ) ( not ( = ?auto_231342 ?auto_231347 ) ) ( not ( = ?auto_231342 ?auto_231348 ) ) ( not ( = ?auto_231342 ?auto_231349 ) ) ( not ( = ?auto_231343 ?auto_231344 ) ) ( not ( = ?auto_231343 ?auto_231345 ) ) ( not ( = ?auto_231343 ?auto_231346 ) ) ( not ( = ?auto_231343 ?auto_231347 ) ) ( not ( = ?auto_231343 ?auto_231348 ) ) ( not ( = ?auto_231343 ?auto_231349 ) ) ( not ( = ?auto_231344 ?auto_231345 ) ) ( not ( = ?auto_231344 ?auto_231346 ) ) ( not ( = ?auto_231344 ?auto_231347 ) ) ( not ( = ?auto_231344 ?auto_231348 ) ) ( not ( = ?auto_231344 ?auto_231349 ) ) ( not ( = ?auto_231345 ?auto_231346 ) ) ( not ( = ?auto_231345 ?auto_231347 ) ) ( not ( = ?auto_231345 ?auto_231348 ) ) ( not ( = ?auto_231345 ?auto_231349 ) ) ( not ( = ?auto_231346 ?auto_231347 ) ) ( not ( = ?auto_231346 ?auto_231348 ) ) ( not ( = ?auto_231346 ?auto_231349 ) ) ( not ( = ?auto_231347 ?auto_231348 ) ) ( not ( = ?auto_231347 ?auto_231349 ) ) ( not ( = ?auto_231348 ?auto_231349 ) ) ( ON ?auto_231347 ?auto_231348 ) ( ON ?auto_231346 ?auto_231347 ) ( ON ?auto_231345 ?auto_231346 ) ( ON ?auto_231344 ?auto_231345 ) ( ON ?auto_231343 ?auto_231344 ) ( ON ?auto_231342 ?auto_231343 ) ( CLEAR ?auto_231340 ) ( ON ?auto_231341 ?auto_231342 ) ( CLEAR ?auto_231341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_231339 ?auto_231340 ?auto_231341 )
      ( MAKE-10PILE ?auto_231339 ?auto_231340 ?auto_231341 ?auto_231342 ?auto_231343 ?auto_231344 ?auto_231345 ?auto_231346 ?auto_231347 ?auto_231348 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231360 - BLOCK
      ?auto_231361 - BLOCK
      ?auto_231362 - BLOCK
      ?auto_231363 - BLOCK
      ?auto_231364 - BLOCK
      ?auto_231365 - BLOCK
      ?auto_231366 - BLOCK
      ?auto_231367 - BLOCK
      ?auto_231368 - BLOCK
      ?auto_231369 - BLOCK
    )
    :vars
    (
      ?auto_231370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231369 ?auto_231370 ) ( ON-TABLE ?auto_231360 ) ( not ( = ?auto_231360 ?auto_231361 ) ) ( not ( = ?auto_231360 ?auto_231362 ) ) ( not ( = ?auto_231360 ?auto_231363 ) ) ( not ( = ?auto_231360 ?auto_231364 ) ) ( not ( = ?auto_231360 ?auto_231365 ) ) ( not ( = ?auto_231360 ?auto_231366 ) ) ( not ( = ?auto_231360 ?auto_231367 ) ) ( not ( = ?auto_231360 ?auto_231368 ) ) ( not ( = ?auto_231360 ?auto_231369 ) ) ( not ( = ?auto_231360 ?auto_231370 ) ) ( not ( = ?auto_231361 ?auto_231362 ) ) ( not ( = ?auto_231361 ?auto_231363 ) ) ( not ( = ?auto_231361 ?auto_231364 ) ) ( not ( = ?auto_231361 ?auto_231365 ) ) ( not ( = ?auto_231361 ?auto_231366 ) ) ( not ( = ?auto_231361 ?auto_231367 ) ) ( not ( = ?auto_231361 ?auto_231368 ) ) ( not ( = ?auto_231361 ?auto_231369 ) ) ( not ( = ?auto_231361 ?auto_231370 ) ) ( not ( = ?auto_231362 ?auto_231363 ) ) ( not ( = ?auto_231362 ?auto_231364 ) ) ( not ( = ?auto_231362 ?auto_231365 ) ) ( not ( = ?auto_231362 ?auto_231366 ) ) ( not ( = ?auto_231362 ?auto_231367 ) ) ( not ( = ?auto_231362 ?auto_231368 ) ) ( not ( = ?auto_231362 ?auto_231369 ) ) ( not ( = ?auto_231362 ?auto_231370 ) ) ( not ( = ?auto_231363 ?auto_231364 ) ) ( not ( = ?auto_231363 ?auto_231365 ) ) ( not ( = ?auto_231363 ?auto_231366 ) ) ( not ( = ?auto_231363 ?auto_231367 ) ) ( not ( = ?auto_231363 ?auto_231368 ) ) ( not ( = ?auto_231363 ?auto_231369 ) ) ( not ( = ?auto_231363 ?auto_231370 ) ) ( not ( = ?auto_231364 ?auto_231365 ) ) ( not ( = ?auto_231364 ?auto_231366 ) ) ( not ( = ?auto_231364 ?auto_231367 ) ) ( not ( = ?auto_231364 ?auto_231368 ) ) ( not ( = ?auto_231364 ?auto_231369 ) ) ( not ( = ?auto_231364 ?auto_231370 ) ) ( not ( = ?auto_231365 ?auto_231366 ) ) ( not ( = ?auto_231365 ?auto_231367 ) ) ( not ( = ?auto_231365 ?auto_231368 ) ) ( not ( = ?auto_231365 ?auto_231369 ) ) ( not ( = ?auto_231365 ?auto_231370 ) ) ( not ( = ?auto_231366 ?auto_231367 ) ) ( not ( = ?auto_231366 ?auto_231368 ) ) ( not ( = ?auto_231366 ?auto_231369 ) ) ( not ( = ?auto_231366 ?auto_231370 ) ) ( not ( = ?auto_231367 ?auto_231368 ) ) ( not ( = ?auto_231367 ?auto_231369 ) ) ( not ( = ?auto_231367 ?auto_231370 ) ) ( not ( = ?auto_231368 ?auto_231369 ) ) ( not ( = ?auto_231368 ?auto_231370 ) ) ( not ( = ?auto_231369 ?auto_231370 ) ) ( ON ?auto_231368 ?auto_231369 ) ( ON ?auto_231367 ?auto_231368 ) ( ON ?auto_231366 ?auto_231367 ) ( ON ?auto_231365 ?auto_231366 ) ( ON ?auto_231364 ?auto_231365 ) ( ON ?auto_231363 ?auto_231364 ) ( ON ?auto_231362 ?auto_231363 ) ( CLEAR ?auto_231360 ) ( ON ?auto_231361 ?auto_231362 ) ( CLEAR ?auto_231361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_231360 ?auto_231361 )
      ( MAKE-10PILE ?auto_231360 ?auto_231361 ?auto_231362 ?auto_231363 ?auto_231364 ?auto_231365 ?auto_231366 ?auto_231367 ?auto_231368 ?auto_231369 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231381 - BLOCK
      ?auto_231382 - BLOCK
      ?auto_231383 - BLOCK
      ?auto_231384 - BLOCK
      ?auto_231385 - BLOCK
      ?auto_231386 - BLOCK
      ?auto_231387 - BLOCK
      ?auto_231388 - BLOCK
      ?auto_231389 - BLOCK
      ?auto_231390 - BLOCK
    )
    :vars
    (
      ?auto_231391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231390 ?auto_231391 ) ( ON-TABLE ?auto_231381 ) ( not ( = ?auto_231381 ?auto_231382 ) ) ( not ( = ?auto_231381 ?auto_231383 ) ) ( not ( = ?auto_231381 ?auto_231384 ) ) ( not ( = ?auto_231381 ?auto_231385 ) ) ( not ( = ?auto_231381 ?auto_231386 ) ) ( not ( = ?auto_231381 ?auto_231387 ) ) ( not ( = ?auto_231381 ?auto_231388 ) ) ( not ( = ?auto_231381 ?auto_231389 ) ) ( not ( = ?auto_231381 ?auto_231390 ) ) ( not ( = ?auto_231381 ?auto_231391 ) ) ( not ( = ?auto_231382 ?auto_231383 ) ) ( not ( = ?auto_231382 ?auto_231384 ) ) ( not ( = ?auto_231382 ?auto_231385 ) ) ( not ( = ?auto_231382 ?auto_231386 ) ) ( not ( = ?auto_231382 ?auto_231387 ) ) ( not ( = ?auto_231382 ?auto_231388 ) ) ( not ( = ?auto_231382 ?auto_231389 ) ) ( not ( = ?auto_231382 ?auto_231390 ) ) ( not ( = ?auto_231382 ?auto_231391 ) ) ( not ( = ?auto_231383 ?auto_231384 ) ) ( not ( = ?auto_231383 ?auto_231385 ) ) ( not ( = ?auto_231383 ?auto_231386 ) ) ( not ( = ?auto_231383 ?auto_231387 ) ) ( not ( = ?auto_231383 ?auto_231388 ) ) ( not ( = ?auto_231383 ?auto_231389 ) ) ( not ( = ?auto_231383 ?auto_231390 ) ) ( not ( = ?auto_231383 ?auto_231391 ) ) ( not ( = ?auto_231384 ?auto_231385 ) ) ( not ( = ?auto_231384 ?auto_231386 ) ) ( not ( = ?auto_231384 ?auto_231387 ) ) ( not ( = ?auto_231384 ?auto_231388 ) ) ( not ( = ?auto_231384 ?auto_231389 ) ) ( not ( = ?auto_231384 ?auto_231390 ) ) ( not ( = ?auto_231384 ?auto_231391 ) ) ( not ( = ?auto_231385 ?auto_231386 ) ) ( not ( = ?auto_231385 ?auto_231387 ) ) ( not ( = ?auto_231385 ?auto_231388 ) ) ( not ( = ?auto_231385 ?auto_231389 ) ) ( not ( = ?auto_231385 ?auto_231390 ) ) ( not ( = ?auto_231385 ?auto_231391 ) ) ( not ( = ?auto_231386 ?auto_231387 ) ) ( not ( = ?auto_231386 ?auto_231388 ) ) ( not ( = ?auto_231386 ?auto_231389 ) ) ( not ( = ?auto_231386 ?auto_231390 ) ) ( not ( = ?auto_231386 ?auto_231391 ) ) ( not ( = ?auto_231387 ?auto_231388 ) ) ( not ( = ?auto_231387 ?auto_231389 ) ) ( not ( = ?auto_231387 ?auto_231390 ) ) ( not ( = ?auto_231387 ?auto_231391 ) ) ( not ( = ?auto_231388 ?auto_231389 ) ) ( not ( = ?auto_231388 ?auto_231390 ) ) ( not ( = ?auto_231388 ?auto_231391 ) ) ( not ( = ?auto_231389 ?auto_231390 ) ) ( not ( = ?auto_231389 ?auto_231391 ) ) ( not ( = ?auto_231390 ?auto_231391 ) ) ( ON ?auto_231389 ?auto_231390 ) ( ON ?auto_231388 ?auto_231389 ) ( ON ?auto_231387 ?auto_231388 ) ( ON ?auto_231386 ?auto_231387 ) ( ON ?auto_231385 ?auto_231386 ) ( ON ?auto_231384 ?auto_231385 ) ( ON ?auto_231383 ?auto_231384 ) ( CLEAR ?auto_231381 ) ( ON ?auto_231382 ?auto_231383 ) ( CLEAR ?auto_231382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_231381 ?auto_231382 )
      ( MAKE-10PILE ?auto_231381 ?auto_231382 ?auto_231383 ?auto_231384 ?auto_231385 ?auto_231386 ?auto_231387 ?auto_231388 ?auto_231389 ?auto_231390 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231402 - BLOCK
      ?auto_231403 - BLOCK
      ?auto_231404 - BLOCK
      ?auto_231405 - BLOCK
      ?auto_231406 - BLOCK
      ?auto_231407 - BLOCK
      ?auto_231408 - BLOCK
      ?auto_231409 - BLOCK
      ?auto_231410 - BLOCK
      ?auto_231411 - BLOCK
    )
    :vars
    (
      ?auto_231412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231411 ?auto_231412 ) ( not ( = ?auto_231402 ?auto_231403 ) ) ( not ( = ?auto_231402 ?auto_231404 ) ) ( not ( = ?auto_231402 ?auto_231405 ) ) ( not ( = ?auto_231402 ?auto_231406 ) ) ( not ( = ?auto_231402 ?auto_231407 ) ) ( not ( = ?auto_231402 ?auto_231408 ) ) ( not ( = ?auto_231402 ?auto_231409 ) ) ( not ( = ?auto_231402 ?auto_231410 ) ) ( not ( = ?auto_231402 ?auto_231411 ) ) ( not ( = ?auto_231402 ?auto_231412 ) ) ( not ( = ?auto_231403 ?auto_231404 ) ) ( not ( = ?auto_231403 ?auto_231405 ) ) ( not ( = ?auto_231403 ?auto_231406 ) ) ( not ( = ?auto_231403 ?auto_231407 ) ) ( not ( = ?auto_231403 ?auto_231408 ) ) ( not ( = ?auto_231403 ?auto_231409 ) ) ( not ( = ?auto_231403 ?auto_231410 ) ) ( not ( = ?auto_231403 ?auto_231411 ) ) ( not ( = ?auto_231403 ?auto_231412 ) ) ( not ( = ?auto_231404 ?auto_231405 ) ) ( not ( = ?auto_231404 ?auto_231406 ) ) ( not ( = ?auto_231404 ?auto_231407 ) ) ( not ( = ?auto_231404 ?auto_231408 ) ) ( not ( = ?auto_231404 ?auto_231409 ) ) ( not ( = ?auto_231404 ?auto_231410 ) ) ( not ( = ?auto_231404 ?auto_231411 ) ) ( not ( = ?auto_231404 ?auto_231412 ) ) ( not ( = ?auto_231405 ?auto_231406 ) ) ( not ( = ?auto_231405 ?auto_231407 ) ) ( not ( = ?auto_231405 ?auto_231408 ) ) ( not ( = ?auto_231405 ?auto_231409 ) ) ( not ( = ?auto_231405 ?auto_231410 ) ) ( not ( = ?auto_231405 ?auto_231411 ) ) ( not ( = ?auto_231405 ?auto_231412 ) ) ( not ( = ?auto_231406 ?auto_231407 ) ) ( not ( = ?auto_231406 ?auto_231408 ) ) ( not ( = ?auto_231406 ?auto_231409 ) ) ( not ( = ?auto_231406 ?auto_231410 ) ) ( not ( = ?auto_231406 ?auto_231411 ) ) ( not ( = ?auto_231406 ?auto_231412 ) ) ( not ( = ?auto_231407 ?auto_231408 ) ) ( not ( = ?auto_231407 ?auto_231409 ) ) ( not ( = ?auto_231407 ?auto_231410 ) ) ( not ( = ?auto_231407 ?auto_231411 ) ) ( not ( = ?auto_231407 ?auto_231412 ) ) ( not ( = ?auto_231408 ?auto_231409 ) ) ( not ( = ?auto_231408 ?auto_231410 ) ) ( not ( = ?auto_231408 ?auto_231411 ) ) ( not ( = ?auto_231408 ?auto_231412 ) ) ( not ( = ?auto_231409 ?auto_231410 ) ) ( not ( = ?auto_231409 ?auto_231411 ) ) ( not ( = ?auto_231409 ?auto_231412 ) ) ( not ( = ?auto_231410 ?auto_231411 ) ) ( not ( = ?auto_231410 ?auto_231412 ) ) ( not ( = ?auto_231411 ?auto_231412 ) ) ( ON ?auto_231410 ?auto_231411 ) ( ON ?auto_231409 ?auto_231410 ) ( ON ?auto_231408 ?auto_231409 ) ( ON ?auto_231407 ?auto_231408 ) ( ON ?auto_231406 ?auto_231407 ) ( ON ?auto_231405 ?auto_231406 ) ( ON ?auto_231404 ?auto_231405 ) ( ON ?auto_231403 ?auto_231404 ) ( ON ?auto_231402 ?auto_231403 ) ( CLEAR ?auto_231402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_231402 )
      ( MAKE-10PILE ?auto_231402 ?auto_231403 ?auto_231404 ?auto_231405 ?auto_231406 ?auto_231407 ?auto_231408 ?auto_231409 ?auto_231410 ?auto_231411 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_231423 - BLOCK
      ?auto_231424 - BLOCK
      ?auto_231425 - BLOCK
      ?auto_231426 - BLOCK
      ?auto_231427 - BLOCK
      ?auto_231428 - BLOCK
      ?auto_231429 - BLOCK
      ?auto_231430 - BLOCK
      ?auto_231431 - BLOCK
      ?auto_231432 - BLOCK
    )
    :vars
    (
      ?auto_231433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231432 ?auto_231433 ) ( not ( = ?auto_231423 ?auto_231424 ) ) ( not ( = ?auto_231423 ?auto_231425 ) ) ( not ( = ?auto_231423 ?auto_231426 ) ) ( not ( = ?auto_231423 ?auto_231427 ) ) ( not ( = ?auto_231423 ?auto_231428 ) ) ( not ( = ?auto_231423 ?auto_231429 ) ) ( not ( = ?auto_231423 ?auto_231430 ) ) ( not ( = ?auto_231423 ?auto_231431 ) ) ( not ( = ?auto_231423 ?auto_231432 ) ) ( not ( = ?auto_231423 ?auto_231433 ) ) ( not ( = ?auto_231424 ?auto_231425 ) ) ( not ( = ?auto_231424 ?auto_231426 ) ) ( not ( = ?auto_231424 ?auto_231427 ) ) ( not ( = ?auto_231424 ?auto_231428 ) ) ( not ( = ?auto_231424 ?auto_231429 ) ) ( not ( = ?auto_231424 ?auto_231430 ) ) ( not ( = ?auto_231424 ?auto_231431 ) ) ( not ( = ?auto_231424 ?auto_231432 ) ) ( not ( = ?auto_231424 ?auto_231433 ) ) ( not ( = ?auto_231425 ?auto_231426 ) ) ( not ( = ?auto_231425 ?auto_231427 ) ) ( not ( = ?auto_231425 ?auto_231428 ) ) ( not ( = ?auto_231425 ?auto_231429 ) ) ( not ( = ?auto_231425 ?auto_231430 ) ) ( not ( = ?auto_231425 ?auto_231431 ) ) ( not ( = ?auto_231425 ?auto_231432 ) ) ( not ( = ?auto_231425 ?auto_231433 ) ) ( not ( = ?auto_231426 ?auto_231427 ) ) ( not ( = ?auto_231426 ?auto_231428 ) ) ( not ( = ?auto_231426 ?auto_231429 ) ) ( not ( = ?auto_231426 ?auto_231430 ) ) ( not ( = ?auto_231426 ?auto_231431 ) ) ( not ( = ?auto_231426 ?auto_231432 ) ) ( not ( = ?auto_231426 ?auto_231433 ) ) ( not ( = ?auto_231427 ?auto_231428 ) ) ( not ( = ?auto_231427 ?auto_231429 ) ) ( not ( = ?auto_231427 ?auto_231430 ) ) ( not ( = ?auto_231427 ?auto_231431 ) ) ( not ( = ?auto_231427 ?auto_231432 ) ) ( not ( = ?auto_231427 ?auto_231433 ) ) ( not ( = ?auto_231428 ?auto_231429 ) ) ( not ( = ?auto_231428 ?auto_231430 ) ) ( not ( = ?auto_231428 ?auto_231431 ) ) ( not ( = ?auto_231428 ?auto_231432 ) ) ( not ( = ?auto_231428 ?auto_231433 ) ) ( not ( = ?auto_231429 ?auto_231430 ) ) ( not ( = ?auto_231429 ?auto_231431 ) ) ( not ( = ?auto_231429 ?auto_231432 ) ) ( not ( = ?auto_231429 ?auto_231433 ) ) ( not ( = ?auto_231430 ?auto_231431 ) ) ( not ( = ?auto_231430 ?auto_231432 ) ) ( not ( = ?auto_231430 ?auto_231433 ) ) ( not ( = ?auto_231431 ?auto_231432 ) ) ( not ( = ?auto_231431 ?auto_231433 ) ) ( not ( = ?auto_231432 ?auto_231433 ) ) ( ON ?auto_231431 ?auto_231432 ) ( ON ?auto_231430 ?auto_231431 ) ( ON ?auto_231429 ?auto_231430 ) ( ON ?auto_231428 ?auto_231429 ) ( ON ?auto_231427 ?auto_231428 ) ( ON ?auto_231426 ?auto_231427 ) ( ON ?auto_231425 ?auto_231426 ) ( ON ?auto_231424 ?auto_231425 ) ( ON ?auto_231423 ?auto_231424 ) ( CLEAR ?auto_231423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_231423 )
      ( MAKE-10PILE ?auto_231423 ?auto_231424 ?auto_231425 ?auto_231426 ?auto_231427 ?auto_231428 ?auto_231429 ?auto_231430 ?auto_231431 ?auto_231432 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231445 - BLOCK
      ?auto_231446 - BLOCK
      ?auto_231447 - BLOCK
      ?auto_231448 - BLOCK
      ?auto_231449 - BLOCK
      ?auto_231450 - BLOCK
      ?auto_231451 - BLOCK
      ?auto_231452 - BLOCK
      ?auto_231453 - BLOCK
      ?auto_231454 - BLOCK
      ?auto_231455 - BLOCK
    )
    :vars
    (
      ?auto_231456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_231454 ) ( ON ?auto_231455 ?auto_231456 ) ( CLEAR ?auto_231455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_231445 ) ( ON ?auto_231446 ?auto_231445 ) ( ON ?auto_231447 ?auto_231446 ) ( ON ?auto_231448 ?auto_231447 ) ( ON ?auto_231449 ?auto_231448 ) ( ON ?auto_231450 ?auto_231449 ) ( ON ?auto_231451 ?auto_231450 ) ( ON ?auto_231452 ?auto_231451 ) ( ON ?auto_231453 ?auto_231452 ) ( ON ?auto_231454 ?auto_231453 ) ( not ( = ?auto_231445 ?auto_231446 ) ) ( not ( = ?auto_231445 ?auto_231447 ) ) ( not ( = ?auto_231445 ?auto_231448 ) ) ( not ( = ?auto_231445 ?auto_231449 ) ) ( not ( = ?auto_231445 ?auto_231450 ) ) ( not ( = ?auto_231445 ?auto_231451 ) ) ( not ( = ?auto_231445 ?auto_231452 ) ) ( not ( = ?auto_231445 ?auto_231453 ) ) ( not ( = ?auto_231445 ?auto_231454 ) ) ( not ( = ?auto_231445 ?auto_231455 ) ) ( not ( = ?auto_231445 ?auto_231456 ) ) ( not ( = ?auto_231446 ?auto_231447 ) ) ( not ( = ?auto_231446 ?auto_231448 ) ) ( not ( = ?auto_231446 ?auto_231449 ) ) ( not ( = ?auto_231446 ?auto_231450 ) ) ( not ( = ?auto_231446 ?auto_231451 ) ) ( not ( = ?auto_231446 ?auto_231452 ) ) ( not ( = ?auto_231446 ?auto_231453 ) ) ( not ( = ?auto_231446 ?auto_231454 ) ) ( not ( = ?auto_231446 ?auto_231455 ) ) ( not ( = ?auto_231446 ?auto_231456 ) ) ( not ( = ?auto_231447 ?auto_231448 ) ) ( not ( = ?auto_231447 ?auto_231449 ) ) ( not ( = ?auto_231447 ?auto_231450 ) ) ( not ( = ?auto_231447 ?auto_231451 ) ) ( not ( = ?auto_231447 ?auto_231452 ) ) ( not ( = ?auto_231447 ?auto_231453 ) ) ( not ( = ?auto_231447 ?auto_231454 ) ) ( not ( = ?auto_231447 ?auto_231455 ) ) ( not ( = ?auto_231447 ?auto_231456 ) ) ( not ( = ?auto_231448 ?auto_231449 ) ) ( not ( = ?auto_231448 ?auto_231450 ) ) ( not ( = ?auto_231448 ?auto_231451 ) ) ( not ( = ?auto_231448 ?auto_231452 ) ) ( not ( = ?auto_231448 ?auto_231453 ) ) ( not ( = ?auto_231448 ?auto_231454 ) ) ( not ( = ?auto_231448 ?auto_231455 ) ) ( not ( = ?auto_231448 ?auto_231456 ) ) ( not ( = ?auto_231449 ?auto_231450 ) ) ( not ( = ?auto_231449 ?auto_231451 ) ) ( not ( = ?auto_231449 ?auto_231452 ) ) ( not ( = ?auto_231449 ?auto_231453 ) ) ( not ( = ?auto_231449 ?auto_231454 ) ) ( not ( = ?auto_231449 ?auto_231455 ) ) ( not ( = ?auto_231449 ?auto_231456 ) ) ( not ( = ?auto_231450 ?auto_231451 ) ) ( not ( = ?auto_231450 ?auto_231452 ) ) ( not ( = ?auto_231450 ?auto_231453 ) ) ( not ( = ?auto_231450 ?auto_231454 ) ) ( not ( = ?auto_231450 ?auto_231455 ) ) ( not ( = ?auto_231450 ?auto_231456 ) ) ( not ( = ?auto_231451 ?auto_231452 ) ) ( not ( = ?auto_231451 ?auto_231453 ) ) ( not ( = ?auto_231451 ?auto_231454 ) ) ( not ( = ?auto_231451 ?auto_231455 ) ) ( not ( = ?auto_231451 ?auto_231456 ) ) ( not ( = ?auto_231452 ?auto_231453 ) ) ( not ( = ?auto_231452 ?auto_231454 ) ) ( not ( = ?auto_231452 ?auto_231455 ) ) ( not ( = ?auto_231452 ?auto_231456 ) ) ( not ( = ?auto_231453 ?auto_231454 ) ) ( not ( = ?auto_231453 ?auto_231455 ) ) ( not ( = ?auto_231453 ?auto_231456 ) ) ( not ( = ?auto_231454 ?auto_231455 ) ) ( not ( = ?auto_231454 ?auto_231456 ) ) ( not ( = ?auto_231455 ?auto_231456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_231455 ?auto_231456 )
      ( !STACK ?auto_231455 ?auto_231454 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231468 - BLOCK
      ?auto_231469 - BLOCK
      ?auto_231470 - BLOCK
      ?auto_231471 - BLOCK
      ?auto_231472 - BLOCK
      ?auto_231473 - BLOCK
      ?auto_231474 - BLOCK
      ?auto_231475 - BLOCK
      ?auto_231476 - BLOCK
      ?auto_231477 - BLOCK
      ?auto_231478 - BLOCK
    )
    :vars
    (
      ?auto_231479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_231477 ) ( ON ?auto_231478 ?auto_231479 ) ( CLEAR ?auto_231478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_231468 ) ( ON ?auto_231469 ?auto_231468 ) ( ON ?auto_231470 ?auto_231469 ) ( ON ?auto_231471 ?auto_231470 ) ( ON ?auto_231472 ?auto_231471 ) ( ON ?auto_231473 ?auto_231472 ) ( ON ?auto_231474 ?auto_231473 ) ( ON ?auto_231475 ?auto_231474 ) ( ON ?auto_231476 ?auto_231475 ) ( ON ?auto_231477 ?auto_231476 ) ( not ( = ?auto_231468 ?auto_231469 ) ) ( not ( = ?auto_231468 ?auto_231470 ) ) ( not ( = ?auto_231468 ?auto_231471 ) ) ( not ( = ?auto_231468 ?auto_231472 ) ) ( not ( = ?auto_231468 ?auto_231473 ) ) ( not ( = ?auto_231468 ?auto_231474 ) ) ( not ( = ?auto_231468 ?auto_231475 ) ) ( not ( = ?auto_231468 ?auto_231476 ) ) ( not ( = ?auto_231468 ?auto_231477 ) ) ( not ( = ?auto_231468 ?auto_231478 ) ) ( not ( = ?auto_231468 ?auto_231479 ) ) ( not ( = ?auto_231469 ?auto_231470 ) ) ( not ( = ?auto_231469 ?auto_231471 ) ) ( not ( = ?auto_231469 ?auto_231472 ) ) ( not ( = ?auto_231469 ?auto_231473 ) ) ( not ( = ?auto_231469 ?auto_231474 ) ) ( not ( = ?auto_231469 ?auto_231475 ) ) ( not ( = ?auto_231469 ?auto_231476 ) ) ( not ( = ?auto_231469 ?auto_231477 ) ) ( not ( = ?auto_231469 ?auto_231478 ) ) ( not ( = ?auto_231469 ?auto_231479 ) ) ( not ( = ?auto_231470 ?auto_231471 ) ) ( not ( = ?auto_231470 ?auto_231472 ) ) ( not ( = ?auto_231470 ?auto_231473 ) ) ( not ( = ?auto_231470 ?auto_231474 ) ) ( not ( = ?auto_231470 ?auto_231475 ) ) ( not ( = ?auto_231470 ?auto_231476 ) ) ( not ( = ?auto_231470 ?auto_231477 ) ) ( not ( = ?auto_231470 ?auto_231478 ) ) ( not ( = ?auto_231470 ?auto_231479 ) ) ( not ( = ?auto_231471 ?auto_231472 ) ) ( not ( = ?auto_231471 ?auto_231473 ) ) ( not ( = ?auto_231471 ?auto_231474 ) ) ( not ( = ?auto_231471 ?auto_231475 ) ) ( not ( = ?auto_231471 ?auto_231476 ) ) ( not ( = ?auto_231471 ?auto_231477 ) ) ( not ( = ?auto_231471 ?auto_231478 ) ) ( not ( = ?auto_231471 ?auto_231479 ) ) ( not ( = ?auto_231472 ?auto_231473 ) ) ( not ( = ?auto_231472 ?auto_231474 ) ) ( not ( = ?auto_231472 ?auto_231475 ) ) ( not ( = ?auto_231472 ?auto_231476 ) ) ( not ( = ?auto_231472 ?auto_231477 ) ) ( not ( = ?auto_231472 ?auto_231478 ) ) ( not ( = ?auto_231472 ?auto_231479 ) ) ( not ( = ?auto_231473 ?auto_231474 ) ) ( not ( = ?auto_231473 ?auto_231475 ) ) ( not ( = ?auto_231473 ?auto_231476 ) ) ( not ( = ?auto_231473 ?auto_231477 ) ) ( not ( = ?auto_231473 ?auto_231478 ) ) ( not ( = ?auto_231473 ?auto_231479 ) ) ( not ( = ?auto_231474 ?auto_231475 ) ) ( not ( = ?auto_231474 ?auto_231476 ) ) ( not ( = ?auto_231474 ?auto_231477 ) ) ( not ( = ?auto_231474 ?auto_231478 ) ) ( not ( = ?auto_231474 ?auto_231479 ) ) ( not ( = ?auto_231475 ?auto_231476 ) ) ( not ( = ?auto_231475 ?auto_231477 ) ) ( not ( = ?auto_231475 ?auto_231478 ) ) ( not ( = ?auto_231475 ?auto_231479 ) ) ( not ( = ?auto_231476 ?auto_231477 ) ) ( not ( = ?auto_231476 ?auto_231478 ) ) ( not ( = ?auto_231476 ?auto_231479 ) ) ( not ( = ?auto_231477 ?auto_231478 ) ) ( not ( = ?auto_231477 ?auto_231479 ) ) ( not ( = ?auto_231478 ?auto_231479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_231478 ?auto_231479 )
      ( !STACK ?auto_231478 ?auto_231477 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231491 - BLOCK
      ?auto_231492 - BLOCK
      ?auto_231493 - BLOCK
      ?auto_231494 - BLOCK
      ?auto_231495 - BLOCK
      ?auto_231496 - BLOCK
      ?auto_231497 - BLOCK
      ?auto_231498 - BLOCK
      ?auto_231499 - BLOCK
      ?auto_231500 - BLOCK
      ?auto_231501 - BLOCK
    )
    :vars
    (
      ?auto_231502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231501 ?auto_231502 ) ( ON-TABLE ?auto_231491 ) ( ON ?auto_231492 ?auto_231491 ) ( ON ?auto_231493 ?auto_231492 ) ( ON ?auto_231494 ?auto_231493 ) ( ON ?auto_231495 ?auto_231494 ) ( ON ?auto_231496 ?auto_231495 ) ( ON ?auto_231497 ?auto_231496 ) ( ON ?auto_231498 ?auto_231497 ) ( ON ?auto_231499 ?auto_231498 ) ( not ( = ?auto_231491 ?auto_231492 ) ) ( not ( = ?auto_231491 ?auto_231493 ) ) ( not ( = ?auto_231491 ?auto_231494 ) ) ( not ( = ?auto_231491 ?auto_231495 ) ) ( not ( = ?auto_231491 ?auto_231496 ) ) ( not ( = ?auto_231491 ?auto_231497 ) ) ( not ( = ?auto_231491 ?auto_231498 ) ) ( not ( = ?auto_231491 ?auto_231499 ) ) ( not ( = ?auto_231491 ?auto_231500 ) ) ( not ( = ?auto_231491 ?auto_231501 ) ) ( not ( = ?auto_231491 ?auto_231502 ) ) ( not ( = ?auto_231492 ?auto_231493 ) ) ( not ( = ?auto_231492 ?auto_231494 ) ) ( not ( = ?auto_231492 ?auto_231495 ) ) ( not ( = ?auto_231492 ?auto_231496 ) ) ( not ( = ?auto_231492 ?auto_231497 ) ) ( not ( = ?auto_231492 ?auto_231498 ) ) ( not ( = ?auto_231492 ?auto_231499 ) ) ( not ( = ?auto_231492 ?auto_231500 ) ) ( not ( = ?auto_231492 ?auto_231501 ) ) ( not ( = ?auto_231492 ?auto_231502 ) ) ( not ( = ?auto_231493 ?auto_231494 ) ) ( not ( = ?auto_231493 ?auto_231495 ) ) ( not ( = ?auto_231493 ?auto_231496 ) ) ( not ( = ?auto_231493 ?auto_231497 ) ) ( not ( = ?auto_231493 ?auto_231498 ) ) ( not ( = ?auto_231493 ?auto_231499 ) ) ( not ( = ?auto_231493 ?auto_231500 ) ) ( not ( = ?auto_231493 ?auto_231501 ) ) ( not ( = ?auto_231493 ?auto_231502 ) ) ( not ( = ?auto_231494 ?auto_231495 ) ) ( not ( = ?auto_231494 ?auto_231496 ) ) ( not ( = ?auto_231494 ?auto_231497 ) ) ( not ( = ?auto_231494 ?auto_231498 ) ) ( not ( = ?auto_231494 ?auto_231499 ) ) ( not ( = ?auto_231494 ?auto_231500 ) ) ( not ( = ?auto_231494 ?auto_231501 ) ) ( not ( = ?auto_231494 ?auto_231502 ) ) ( not ( = ?auto_231495 ?auto_231496 ) ) ( not ( = ?auto_231495 ?auto_231497 ) ) ( not ( = ?auto_231495 ?auto_231498 ) ) ( not ( = ?auto_231495 ?auto_231499 ) ) ( not ( = ?auto_231495 ?auto_231500 ) ) ( not ( = ?auto_231495 ?auto_231501 ) ) ( not ( = ?auto_231495 ?auto_231502 ) ) ( not ( = ?auto_231496 ?auto_231497 ) ) ( not ( = ?auto_231496 ?auto_231498 ) ) ( not ( = ?auto_231496 ?auto_231499 ) ) ( not ( = ?auto_231496 ?auto_231500 ) ) ( not ( = ?auto_231496 ?auto_231501 ) ) ( not ( = ?auto_231496 ?auto_231502 ) ) ( not ( = ?auto_231497 ?auto_231498 ) ) ( not ( = ?auto_231497 ?auto_231499 ) ) ( not ( = ?auto_231497 ?auto_231500 ) ) ( not ( = ?auto_231497 ?auto_231501 ) ) ( not ( = ?auto_231497 ?auto_231502 ) ) ( not ( = ?auto_231498 ?auto_231499 ) ) ( not ( = ?auto_231498 ?auto_231500 ) ) ( not ( = ?auto_231498 ?auto_231501 ) ) ( not ( = ?auto_231498 ?auto_231502 ) ) ( not ( = ?auto_231499 ?auto_231500 ) ) ( not ( = ?auto_231499 ?auto_231501 ) ) ( not ( = ?auto_231499 ?auto_231502 ) ) ( not ( = ?auto_231500 ?auto_231501 ) ) ( not ( = ?auto_231500 ?auto_231502 ) ) ( not ( = ?auto_231501 ?auto_231502 ) ) ( CLEAR ?auto_231499 ) ( ON ?auto_231500 ?auto_231501 ) ( CLEAR ?auto_231500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_231491 ?auto_231492 ?auto_231493 ?auto_231494 ?auto_231495 ?auto_231496 ?auto_231497 ?auto_231498 ?auto_231499 ?auto_231500 )
      ( MAKE-11PILE ?auto_231491 ?auto_231492 ?auto_231493 ?auto_231494 ?auto_231495 ?auto_231496 ?auto_231497 ?auto_231498 ?auto_231499 ?auto_231500 ?auto_231501 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231514 - BLOCK
      ?auto_231515 - BLOCK
      ?auto_231516 - BLOCK
      ?auto_231517 - BLOCK
      ?auto_231518 - BLOCK
      ?auto_231519 - BLOCK
      ?auto_231520 - BLOCK
      ?auto_231521 - BLOCK
      ?auto_231522 - BLOCK
      ?auto_231523 - BLOCK
      ?auto_231524 - BLOCK
    )
    :vars
    (
      ?auto_231525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231524 ?auto_231525 ) ( ON-TABLE ?auto_231514 ) ( ON ?auto_231515 ?auto_231514 ) ( ON ?auto_231516 ?auto_231515 ) ( ON ?auto_231517 ?auto_231516 ) ( ON ?auto_231518 ?auto_231517 ) ( ON ?auto_231519 ?auto_231518 ) ( ON ?auto_231520 ?auto_231519 ) ( ON ?auto_231521 ?auto_231520 ) ( ON ?auto_231522 ?auto_231521 ) ( not ( = ?auto_231514 ?auto_231515 ) ) ( not ( = ?auto_231514 ?auto_231516 ) ) ( not ( = ?auto_231514 ?auto_231517 ) ) ( not ( = ?auto_231514 ?auto_231518 ) ) ( not ( = ?auto_231514 ?auto_231519 ) ) ( not ( = ?auto_231514 ?auto_231520 ) ) ( not ( = ?auto_231514 ?auto_231521 ) ) ( not ( = ?auto_231514 ?auto_231522 ) ) ( not ( = ?auto_231514 ?auto_231523 ) ) ( not ( = ?auto_231514 ?auto_231524 ) ) ( not ( = ?auto_231514 ?auto_231525 ) ) ( not ( = ?auto_231515 ?auto_231516 ) ) ( not ( = ?auto_231515 ?auto_231517 ) ) ( not ( = ?auto_231515 ?auto_231518 ) ) ( not ( = ?auto_231515 ?auto_231519 ) ) ( not ( = ?auto_231515 ?auto_231520 ) ) ( not ( = ?auto_231515 ?auto_231521 ) ) ( not ( = ?auto_231515 ?auto_231522 ) ) ( not ( = ?auto_231515 ?auto_231523 ) ) ( not ( = ?auto_231515 ?auto_231524 ) ) ( not ( = ?auto_231515 ?auto_231525 ) ) ( not ( = ?auto_231516 ?auto_231517 ) ) ( not ( = ?auto_231516 ?auto_231518 ) ) ( not ( = ?auto_231516 ?auto_231519 ) ) ( not ( = ?auto_231516 ?auto_231520 ) ) ( not ( = ?auto_231516 ?auto_231521 ) ) ( not ( = ?auto_231516 ?auto_231522 ) ) ( not ( = ?auto_231516 ?auto_231523 ) ) ( not ( = ?auto_231516 ?auto_231524 ) ) ( not ( = ?auto_231516 ?auto_231525 ) ) ( not ( = ?auto_231517 ?auto_231518 ) ) ( not ( = ?auto_231517 ?auto_231519 ) ) ( not ( = ?auto_231517 ?auto_231520 ) ) ( not ( = ?auto_231517 ?auto_231521 ) ) ( not ( = ?auto_231517 ?auto_231522 ) ) ( not ( = ?auto_231517 ?auto_231523 ) ) ( not ( = ?auto_231517 ?auto_231524 ) ) ( not ( = ?auto_231517 ?auto_231525 ) ) ( not ( = ?auto_231518 ?auto_231519 ) ) ( not ( = ?auto_231518 ?auto_231520 ) ) ( not ( = ?auto_231518 ?auto_231521 ) ) ( not ( = ?auto_231518 ?auto_231522 ) ) ( not ( = ?auto_231518 ?auto_231523 ) ) ( not ( = ?auto_231518 ?auto_231524 ) ) ( not ( = ?auto_231518 ?auto_231525 ) ) ( not ( = ?auto_231519 ?auto_231520 ) ) ( not ( = ?auto_231519 ?auto_231521 ) ) ( not ( = ?auto_231519 ?auto_231522 ) ) ( not ( = ?auto_231519 ?auto_231523 ) ) ( not ( = ?auto_231519 ?auto_231524 ) ) ( not ( = ?auto_231519 ?auto_231525 ) ) ( not ( = ?auto_231520 ?auto_231521 ) ) ( not ( = ?auto_231520 ?auto_231522 ) ) ( not ( = ?auto_231520 ?auto_231523 ) ) ( not ( = ?auto_231520 ?auto_231524 ) ) ( not ( = ?auto_231520 ?auto_231525 ) ) ( not ( = ?auto_231521 ?auto_231522 ) ) ( not ( = ?auto_231521 ?auto_231523 ) ) ( not ( = ?auto_231521 ?auto_231524 ) ) ( not ( = ?auto_231521 ?auto_231525 ) ) ( not ( = ?auto_231522 ?auto_231523 ) ) ( not ( = ?auto_231522 ?auto_231524 ) ) ( not ( = ?auto_231522 ?auto_231525 ) ) ( not ( = ?auto_231523 ?auto_231524 ) ) ( not ( = ?auto_231523 ?auto_231525 ) ) ( not ( = ?auto_231524 ?auto_231525 ) ) ( CLEAR ?auto_231522 ) ( ON ?auto_231523 ?auto_231524 ) ( CLEAR ?auto_231523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_231514 ?auto_231515 ?auto_231516 ?auto_231517 ?auto_231518 ?auto_231519 ?auto_231520 ?auto_231521 ?auto_231522 ?auto_231523 )
      ( MAKE-11PILE ?auto_231514 ?auto_231515 ?auto_231516 ?auto_231517 ?auto_231518 ?auto_231519 ?auto_231520 ?auto_231521 ?auto_231522 ?auto_231523 ?auto_231524 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231537 - BLOCK
      ?auto_231538 - BLOCK
      ?auto_231539 - BLOCK
      ?auto_231540 - BLOCK
      ?auto_231541 - BLOCK
      ?auto_231542 - BLOCK
      ?auto_231543 - BLOCK
      ?auto_231544 - BLOCK
      ?auto_231545 - BLOCK
      ?auto_231546 - BLOCK
      ?auto_231547 - BLOCK
    )
    :vars
    (
      ?auto_231548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231547 ?auto_231548 ) ( ON-TABLE ?auto_231537 ) ( ON ?auto_231538 ?auto_231537 ) ( ON ?auto_231539 ?auto_231538 ) ( ON ?auto_231540 ?auto_231539 ) ( ON ?auto_231541 ?auto_231540 ) ( ON ?auto_231542 ?auto_231541 ) ( ON ?auto_231543 ?auto_231542 ) ( ON ?auto_231544 ?auto_231543 ) ( not ( = ?auto_231537 ?auto_231538 ) ) ( not ( = ?auto_231537 ?auto_231539 ) ) ( not ( = ?auto_231537 ?auto_231540 ) ) ( not ( = ?auto_231537 ?auto_231541 ) ) ( not ( = ?auto_231537 ?auto_231542 ) ) ( not ( = ?auto_231537 ?auto_231543 ) ) ( not ( = ?auto_231537 ?auto_231544 ) ) ( not ( = ?auto_231537 ?auto_231545 ) ) ( not ( = ?auto_231537 ?auto_231546 ) ) ( not ( = ?auto_231537 ?auto_231547 ) ) ( not ( = ?auto_231537 ?auto_231548 ) ) ( not ( = ?auto_231538 ?auto_231539 ) ) ( not ( = ?auto_231538 ?auto_231540 ) ) ( not ( = ?auto_231538 ?auto_231541 ) ) ( not ( = ?auto_231538 ?auto_231542 ) ) ( not ( = ?auto_231538 ?auto_231543 ) ) ( not ( = ?auto_231538 ?auto_231544 ) ) ( not ( = ?auto_231538 ?auto_231545 ) ) ( not ( = ?auto_231538 ?auto_231546 ) ) ( not ( = ?auto_231538 ?auto_231547 ) ) ( not ( = ?auto_231538 ?auto_231548 ) ) ( not ( = ?auto_231539 ?auto_231540 ) ) ( not ( = ?auto_231539 ?auto_231541 ) ) ( not ( = ?auto_231539 ?auto_231542 ) ) ( not ( = ?auto_231539 ?auto_231543 ) ) ( not ( = ?auto_231539 ?auto_231544 ) ) ( not ( = ?auto_231539 ?auto_231545 ) ) ( not ( = ?auto_231539 ?auto_231546 ) ) ( not ( = ?auto_231539 ?auto_231547 ) ) ( not ( = ?auto_231539 ?auto_231548 ) ) ( not ( = ?auto_231540 ?auto_231541 ) ) ( not ( = ?auto_231540 ?auto_231542 ) ) ( not ( = ?auto_231540 ?auto_231543 ) ) ( not ( = ?auto_231540 ?auto_231544 ) ) ( not ( = ?auto_231540 ?auto_231545 ) ) ( not ( = ?auto_231540 ?auto_231546 ) ) ( not ( = ?auto_231540 ?auto_231547 ) ) ( not ( = ?auto_231540 ?auto_231548 ) ) ( not ( = ?auto_231541 ?auto_231542 ) ) ( not ( = ?auto_231541 ?auto_231543 ) ) ( not ( = ?auto_231541 ?auto_231544 ) ) ( not ( = ?auto_231541 ?auto_231545 ) ) ( not ( = ?auto_231541 ?auto_231546 ) ) ( not ( = ?auto_231541 ?auto_231547 ) ) ( not ( = ?auto_231541 ?auto_231548 ) ) ( not ( = ?auto_231542 ?auto_231543 ) ) ( not ( = ?auto_231542 ?auto_231544 ) ) ( not ( = ?auto_231542 ?auto_231545 ) ) ( not ( = ?auto_231542 ?auto_231546 ) ) ( not ( = ?auto_231542 ?auto_231547 ) ) ( not ( = ?auto_231542 ?auto_231548 ) ) ( not ( = ?auto_231543 ?auto_231544 ) ) ( not ( = ?auto_231543 ?auto_231545 ) ) ( not ( = ?auto_231543 ?auto_231546 ) ) ( not ( = ?auto_231543 ?auto_231547 ) ) ( not ( = ?auto_231543 ?auto_231548 ) ) ( not ( = ?auto_231544 ?auto_231545 ) ) ( not ( = ?auto_231544 ?auto_231546 ) ) ( not ( = ?auto_231544 ?auto_231547 ) ) ( not ( = ?auto_231544 ?auto_231548 ) ) ( not ( = ?auto_231545 ?auto_231546 ) ) ( not ( = ?auto_231545 ?auto_231547 ) ) ( not ( = ?auto_231545 ?auto_231548 ) ) ( not ( = ?auto_231546 ?auto_231547 ) ) ( not ( = ?auto_231546 ?auto_231548 ) ) ( not ( = ?auto_231547 ?auto_231548 ) ) ( ON ?auto_231546 ?auto_231547 ) ( CLEAR ?auto_231544 ) ( ON ?auto_231545 ?auto_231546 ) ( CLEAR ?auto_231545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_231537 ?auto_231538 ?auto_231539 ?auto_231540 ?auto_231541 ?auto_231542 ?auto_231543 ?auto_231544 ?auto_231545 )
      ( MAKE-11PILE ?auto_231537 ?auto_231538 ?auto_231539 ?auto_231540 ?auto_231541 ?auto_231542 ?auto_231543 ?auto_231544 ?auto_231545 ?auto_231546 ?auto_231547 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231560 - BLOCK
      ?auto_231561 - BLOCK
      ?auto_231562 - BLOCK
      ?auto_231563 - BLOCK
      ?auto_231564 - BLOCK
      ?auto_231565 - BLOCK
      ?auto_231566 - BLOCK
      ?auto_231567 - BLOCK
      ?auto_231568 - BLOCK
      ?auto_231569 - BLOCK
      ?auto_231570 - BLOCK
    )
    :vars
    (
      ?auto_231571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231570 ?auto_231571 ) ( ON-TABLE ?auto_231560 ) ( ON ?auto_231561 ?auto_231560 ) ( ON ?auto_231562 ?auto_231561 ) ( ON ?auto_231563 ?auto_231562 ) ( ON ?auto_231564 ?auto_231563 ) ( ON ?auto_231565 ?auto_231564 ) ( ON ?auto_231566 ?auto_231565 ) ( ON ?auto_231567 ?auto_231566 ) ( not ( = ?auto_231560 ?auto_231561 ) ) ( not ( = ?auto_231560 ?auto_231562 ) ) ( not ( = ?auto_231560 ?auto_231563 ) ) ( not ( = ?auto_231560 ?auto_231564 ) ) ( not ( = ?auto_231560 ?auto_231565 ) ) ( not ( = ?auto_231560 ?auto_231566 ) ) ( not ( = ?auto_231560 ?auto_231567 ) ) ( not ( = ?auto_231560 ?auto_231568 ) ) ( not ( = ?auto_231560 ?auto_231569 ) ) ( not ( = ?auto_231560 ?auto_231570 ) ) ( not ( = ?auto_231560 ?auto_231571 ) ) ( not ( = ?auto_231561 ?auto_231562 ) ) ( not ( = ?auto_231561 ?auto_231563 ) ) ( not ( = ?auto_231561 ?auto_231564 ) ) ( not ( = ?auto_231561 ?auto_231565 ) ) ( not ( = ?auto_231561 ?auto_231566 ) ) ( not ( = ?auto_231561 ?auto_231567 ) ) ( not ( = ?auto_231561 ?auto_231568 ) ) ( not ( = ?auto_231561 ?auto_231569 ) ) ( not ( = ?auto_231561 ?auto_231570 ) ) ( not ( = ?auto_231561 ?auto_231571 ) ) ( not ( = ?auto_231562 ?auto_231563 ) ) ( not ( = ?auto_231562 ?auto_231564 ) ) ( not ( = ?auto_231562 ?auto_231565 ) ) ( not ( = ?auto_231562 ?auto_231566 ) ) ( not ( = ?auto_231562 ?auto_231567 ) ) ( not ( = ?auto_231562 ?auto_231568 ) ) ( not ( = ?auto_231562 ?auto_231569 ) ) ( not ( = ?auto_231562 ?auto_231570 ) ) ( not ( = ?auto_231562 ?auto_231571 ) ) ( not ( = ?auto_231563 ?auto_231564 ) ) ( not ( = ?auto_231563 ?auto_231565 ) ) ( not ( = ?auto_231563 ?auto_231566 ) ) ( not ( = ?auto_231563 ?auto_231567 ) ) ( not ( = ?auto_231563 ?auto_231568 ) ) ( not ( = ?auto_231563 ?auto_231569 ) ) ( not ( = ?auto_231563 ?auto_231570 ) ) ( not ( = ?auto_231563 ?auto_231571 ) ) ( not ( = ?auto_231564 ?auto_231565 ) ) ( not ( = ?auto_231564 ?auto_231566 ) ) ( not ( = ?auto_231564 ?auto_231567 ) ) ( not ( = ?auto_231564 ?auto_231568 ) ) ( not ( = ?auto_231564 ?auto_231569 ) ) ( not ( = ?auto_231564 ?auto_231570 ) ) ( not ( = ?auto_231564 ?auto_231571 ) ) ( not ( = ?auto_231565 ?auto_231566 ) ) ( not ( = ?auto_231565 ?auto_231567 ) ) ( not ( = ?auto_231565 ?auto_231568 ) ) ( not ( = ?auto_231565 ?auto_231569 ) ) ( not ( = ?auto_231565 ?auto_231570 ) ) ( not ( = ?auto_231565 ?auto_231571 ) ) ( not ( = ?auto_231566 ?auto_231567 ) ) ( not ( = ?auto_231566 ?auto_231568 ) ) ( not ( = ?auto_231566 ?auto_231569 ) ) ( not ( = ?auto_231566 ?auto_231570 ) ) ( not ( = ?auto_231566 ?auto_231571 ) ) ( not ( = ?auto_231567 ?auto_231568 ) ) ( not ( = ?auto_231567 ?auto_231569 ) ) ( not ( = ?auto_231567 ?auto_231570 ) ) ( not ( = ?auto_231567 ?auto_231571 ) ) ( not ( = ?auto_231568 ?auto_231569 ) ) ( not ( = ?auto_231568 ?auto_231570 ) ) ( not ( = ?auto_231568 ?auto_231571 ) ) ( not ( = ?auto_231569 ?auto_231570 ) ) ( not ( = ?auto_231569 ?auto_231571 ) ) ( not ( = ?auto_231570 ?auto_231571 ) ) ( ON ?auto_231569 ?auto_231570 ) ( CLEAR ?auto_231567 ) ( ON ?auto_231568 ?auto_231569 ) ( CLEAR ?auto_231568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_231560 ?auto_231561 ?auto_231562 ?auto_231563 ?auto_231564 ?auto_231565 ?auto_231566 ?auto_231567 ?auto_231568 )
      ( MAKE-11PILE ?auto_231560 ?auto_231561 ?auto_231562 ?auto_231563 ?auto_231564 ?auto_231565 ?auto_231566 ?auto_231567 ?auto_231568 ?auto_231569 ?auto_231570 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231583 - BLOCK
      ?auto_231584 - BLOCK
      ?auto_231585 - BLOCK
      ?auto_231586 - BLOCK
      ?auto_231587 - BLOCK
      ?auto_231588 - BLOCK
      ?auto_231589 - BLOCK
      ?auto_231590 - BLOCK
      ?auto_231591 - BLOCK
      ?auto_231592 - BLOCK
      ?auto_231593 - BLOCK
    )
    :vars
    (
      ?auto_231594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231593 ?auto_231594 ) ( ON-TABLE ?auto_231583 ) ( ON ?auto_231584 ?auto_231583 ) ( ON ?auto_231585 ?auto_231584 ) ( ON ?auto_231586 ?auto_231585 ) ( ON ?auto_231587 ?auto_231586 ) ( ON ?auto_231588 ?auto_231587 ) ( ON ?auto_231589 ?auto_231588 ) ( not ( = ?auto_231583 ?auto_231584 ) ) ( not ( = ?auto_231583 ?auto_231585 ) ) ( not ( = ?auto_231583 ?auto_231586 ) ) ( not ( = ?auto_231583 ?auto_231587 ) ) ( not ( = ?auto_231583 ?auto_231588 ) ) ( not ( = ?auto_231583 ?auto_231589 ) ) ( not ( = ?auto_231583 ?auto_231590 ) ) ( not ( = ?auto_231583 ?auto_231591 ) ) ( not ( = ?auto_231583 ?auto_231592 ) ) ( not ( = ?auto_231583 ?auto_231593 ) ) ( not ( = ?auto_231583 ?auto_231594 ) ) ( not ( = ?auto_231584 ?auto_231585 ) ) ( not ( = ?auto_231584 ?auto_231586 ) ) ( not ( = ?auto_231584 ?auto_231587 ) ) ( not ( = ?auto_231584 ?auto_231588 ) ) ( not ( = ?auto_231584 ?auto_231589 ) ) ( not ( = ?auto_231584 ?auto_231590 ) ) ( not ( = ?auto_231584 ?auto_231591 ) ) ( not ( = ?auto_231584 ?auto_231592 ) ) ( not ( = ?auto_231584 ?auto_231593 ) ) ( not ( = ?auto_231584 ?auto_231594 ) ) ( not ( = ?auto_231585 ?auto_231586 ) ) ( not ( = ?auto_231585 ?auto_231587 ) ) ( not ( = ?auto_231585 ?auto_231588 ) ) ( not ( = ?auto_231585 ?auto_231589 ) ) ( not ( = ?auto_231585 ?auto_231590 ) ) ( not ( = ?auto_231585 ?auto_231591 ) ) ( not ( = ?auto_231585 ?auto_231592 ) ) ( not ( = ?auto_231585 ?auto_231593 ) ) ( not ( = ?auto_231585 ?auto_231594 ) ) ( not ( = ?auto_231586 ?auto_231587 ) ) ( not ( = ?auto_231586 ?auto_231588 ) ) ( not ( = ?auto_231586 ?auto_231589 ) ) ( not ( = ?auto_231586 ?auto_231590 ) ) ( not ( = ?auto_231586 ?auto_231591 ) ) ( not ( = ?auto_231586 ?auto_231592 ) ) ( not ( = ?auto_231586 ?auto_231593 ) ) ( not ( = ?auto_231586 ?auto_231594 ) ) ( not ( = ?auto_231587 ?auto_231588 ) ) ( not ( = ?auto_231587 ?auto_231589 ) ) ( not ( = ?auto_231587 ?auto_231590 ) ) ( not ( = ?auto_231587 ?auto_231591 ) ) ( not ( = ?auto_231587 ?auto_231592 ) ) ( not ( = ?auto_231587 ?auto_231593 ) ) ( not ( = ?auto_231587 ?auto_231594 ) ) ( not ( = ?auto_231588 ?auto_231589 ) ) ( not ( = ?auto_231588 ?auto_231590 ) ) ( not ( = ?auto_231588 ?auto_231591 ) ) ( not ( = ?auto_231588 ?auto_231592 ) ) ( not ( = ?auto_231588 ?auto_231593 ) ) ( not ( = ?auto_231588 ?auto_231594 ) ) ( not ( = ?auto_231589 ?auto_231590 ) ) ( not ( = ?auto_231589 ?auto_231591 ) ) ( not ( = ?auto_231589 ?auto_231592 ) ) ( not ( = ?auto_231589 ?auto_231593 ) ) ( not ( = ?auto_231589 ?auto_231594 ) ) ( not ( = ?auto_231590 ?auto_231591 ) ) ( not ( = ?auto_231590 ?auto_231592 ) ) ( not ( = ?auto_231590 ?auto_231593 ) ) ( not ( = ?auto_231590 ?auto_231594 ) ) ( not ( = ?auto_231591 ?auto_231592 ) ) ( not ( = ?auto_231591 ?auto_231593 ) ) ( not ( = ?auto_231591 ?auto_231594 ) ) ( not ( = ?auto_231592 ?auto_231593 ) ) ( not ( = ?auto_231592 ?auto_231594 ) ) ( not ( = ?auto_231593 ?auto_231594 ) ) ( ON ?auto_231592 ?auto_231593 ) ( ON ?auto_231591 ?auto_231592 ) ( CLEAR ?auto_231589 ) ( ON ?auto_231590 ?auto_231591 ) ( CLEAR ?auto_231590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_231583 ?auto_231584 ?auto_231585 ?auto_231586 ?auto_231587 ?auto_231588 ?auto_231589 ?auto_231590 )
      ( MAKE-11PILE ?auto_231583 ?auto_231584 ?auto_231585 ?auto_231586 ?auto_231587 ?auto_231588 ?auto_231589 ?auto_231590 ?auto_231591 ?auto_231592 ?auto_231593 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231606 - BLOCK
      ?auto_231607 - BLOCK
      ?auto_231608 - BLOCK
      ?auto_231609 - BLOCK
      ?auto_231610 - BLOCK
      ?auto_231611 - BLOCK
      ?auto_231612 - BLOCK
      ?auto_231613 - BLOCK
      ?auto_231614 - BLOCK
      ?auto_231615 - BLOCK
      ?auto_231616 - BLOCK
    )
    :vars
    (
      ?auto_231617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231616 ?auto_231617 ) ( ON-TABLE ?auto_231606 ) ( ON ?auto_231607 ?auto_231606 ) ( ON ?auto_231608 ?auto_231607 ) ( ON ?auto_231609 ?auto_231608 ) ( ON ?auto_231610 ?auto_231609 ) ( ON ?auto_231611 ?auto_231610 ) ( ON ?auto_231612 ?auto_231611 ) ( not ( = ?auto_231606 ?auto_231607 ) ) ( not ( = ?auto_231606 ?auto_231608 ) ) ( not ( = ?auto_231606 ?auto_231609 ) ) ( not ( = ?auto_231606 ?auto_231610 ) ) ( not ( = ?auto_231606 ?auto_231611 ) ) ( not ( = ?auto_231606 ?auto_231612 ) ) ( not ( = ?auto_231606 ?auto_231613 ) ) ( not ( = ?auto_231606 ?auto_231614 ) ) ( not ( = ?auto_231606 ?auto_231615 ) ) ( not ( = ?auto_231606 ?auto_231616 ) ) ( not ( = ?auto_231606 ?auto_231617 ) ) ( not ( = ?auto_231607 ?auto_231608 ) ) ( not ( = ?auto_231607 ?auto_231609 ) ) ( not ( = ?auto_231607 ?auto_231610 ) ) ( not ( = ?auto_231607 ?auto_231611 ) ) ( not ( = ?auto_231607 ?auto_231612 ) ) ( not ( = ?auto_231607 ?auto_231613 ) ) ( not ( = ?auto_231607 ?auto_231614 ) ) ( not ( = ?auto_231607 ?auto_231615 ) ) ( not ( = ?auto_231607 ?auto_231616 ) ) ( not ( = ?auto_231607 ?auto_231617 ) ) ( not ( = ?auto_231608 ?auto_231609 ) ) ( not ( = ?auto_231608 ?auto_231610 ) ) ( not ( = ?auto_231608 ?auto_231611 ) ) ( not ( = ?auto_231608 ?auto_231612 ) ) ( not ( = ?auto_231608 ?auto_231613 ) ) ( not ( = ?auto_231608 ?auto_231614 ) ) ( not ( = ?auto_231608 ?auto_231615 ) ) ( not ( = ?auto_231608 ?auto_231616 ) ) ( not ( = ?auto_231608 ?auto_231617 ) ) ( not ( = ?auto_231609 ?auto_231610 ) ) ( not ( = ?auto_231609 ?auto_231611 ) ) ( not ( = ?auto_231609 ?auto_231612 ) ) ( not ( = ?auto_231609 ?auto_231613 ) ) ( not ( = ?auto_231609 ?auto_231614 ) ) ( not ( = ?auto_231609 ?auto_231615 ) ) ( not ( = ?auto_231609 ?auto_231616 ) ) ( not ( = ?auto_231609 ?auto_231617 ) ) ( not ( = ?auto_231610 ?auto_231611 ) ) ( not ( = ?auto_231610 ?auto_231612 ) ) ( not ( = ?auto_231610 ?auto_231613 ) ) ( not ( = ?auto_231610 ?auto_231614 ) ) ( not ( = ?auto_231610 ?auto_231615 ) ) ( not ( = ?auto_231610 ?auto_231616 ) ) ( not ( = ?auto_231610 ?auto_231617 ) ) ( not ( = ?auto_231611 ?auto_231612 ) ) ( not ( = ?auto_231611 ?auto_231613 ) ) ( not ( = ?auto_231611 ?auto_231614 ) ) ( not ( = ?auto_231611 ?auto_231615 ) ) ( not ( = ?auto_231611 ?auto_231616 ) ) ( not ( = ?auto_231611 ?auto_231617 ) ) ( not ( = ?auto_231612 ?auto_231613 ) ) ( not ( = ?auto_231612 ?auto_231614 ) ) ( not ( = ?auto_231612 ?auto_231615 ) ) ( not ( = ?auto_231612 ?auto_231616 ) ) ( not ( = ?auto_231612 ?auto_231617 ) ) ( not ( = ?auto_231613 ?auto_231614 ) ) ( not ( = ?auto_231613 ?auto_231615 ) ) ( not ( = ?auto_231613 ?auto_231616 ) ) ( not ( = ?auto_231613 ?auto_231617 ) ) ( not ( = ?auto_231614 ?auto_231615 ) ) ( not ( = ?auto_231614 ?auto_231616 ) ) ( not ( = ?auto_231614 ?auto_231617 ) ) ( not ( = ?auto_231615 ?auto_231616 ) ) ( not ( = ?auto_231615 ?auto_231617 ) ) ( not ( = ?auto_231616 ?auto_231617 ) ) ( ON ?auto_231615 ?auto_231616 ) ( ON ?auto_231614 ?auto_231615 ) ( CLEAR ?auto_231612 ) ( ON ?auto_231613 ?auto_231614 ) ( CLEAR ?auto_231613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_231606 ?auto_231607 ?auto_231608 ?auto_231609 ?auto_231610 ?auto_231611 ?auto_231612 ?auto_231613 )
      ( MAKE-11PILE ?auto_231606 ?auto_231607 ?auto_231608 ?auto_231609 ?auto_231610 ?auto_231611 ?auto_231612 ?auto_231613 ?auto_231614 ?auto_231615 ?auto_231616 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231629 - BLOCK
      ?auto_231630 - BLOCK
      ?auto_231631 - BLOCK
      ?auto_231632 - BLOCK
      ?auto_231633 - BLOCK
      ?auto_231634 - BLOCK
      ?auto_231635 - BLOCK
      ?auto_231636 - BLOCK
      ?auto_231637 - BLOCK
      ?auto_231638 - BLOCK
      ?auto_231639 - BLOCK
    )
    :vars
    (
      ?auto_231640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231639 ?auto_231640 ) ( ON-TABLE ?auto_231629 ) ( ON ?auto_231630 ?auto_231629 ) ( ON ?auto_231631 ?auto_231630 ) ( ON ?auto_231632 ?auto_231631 ) ( ON ?auto_231633 ?auto_231632 ) ( ON ?auto_231634 ?auto_231633 ) ( not ( = ?auto_231629 ?auto_231630 ) ) ( not ( = ?auto_231629 ?auto_231631 ) ) ( not ( = ?auto_231629 ?auto_231632 ) ) ( not ( = ?auto_231629 ?auto_231633 ) ) ( not ( = ?auto_231629 ?auto_231634 ) ) ( not ( = ?auto_231629 ?auto_231635 ) ) ( not ( = ?auto_231629 ?auto_231636 ) ) ( not ( = ?auto_231629 ?auto_231637 ) ) ( not ( = ?auto_231629 ?auto_231638 ) ) ( not ( = ?auto_231629 ?auto_231639 ) ) ( not ( = ?auto_231629 ?auto_231640 ) ) ( not ( = ?auto_231630 ?auto_231631 ) ) ( not ( = ?auto_231630 ?auto_231632 ) ) ( not ( = ?auto_231630 ?auto_231633 ) ) ( not ( = ?auto_231630 ?auto_231634 ) ) ( not ( = ?auto_231630 ?auto_231635 ) ) ( not ( = ?auto_231630 ?auto_231636 ) ) ( not ( = ?auto_231630 ?auto_231637 ) ) ( not ( = ?auto_231630 ?auto_231638 ) ) ( not ( = ?auto_231630 ?auto_231639 ) ) ( not ( = ?auto_231630 ?auto_231640 ) ) ( not ( = ?auto_231631 ?auto_231632 ) ) ( not ( = ?auto_231631 ?auto_231633 ) ) ( not ( = ?auto_231631 ?auto_231634 ) ) ( not ( = ?auto_231631 ?auto_231635 ) ) ( not ( = ?auto_231631 ?auto_231636 ) ) ( not ( = ?auto_231631 ?auto_231637 ) ) ( not ( = ?auto_231631 ?auto_231638 ) ) ( not ( = ?auto_231631 ?auto_231639 ) ) ( not ( = ?auto_231631 ?auto_231640 ) ) ( not ( = ?auto_231632 ?auto_231633 ) ) ( not ( = ?auto_231632 ?auto_231634 ) ) ( not ( = ?auto_231632 ?auto_231635 ) ) ( not ( = ?auto_231632 ?auto_231636 ) ) ( not ( = ?auto_231632 ?auto_231637 ) ) ( not ( = ?auto_231632 ?auto_231638 ) ) ( not ( = ?auto_231632 ?auto_231639 ) ) ( not ( = ?auto_231632 ?auto_231640 ) ) ( not ( = ?auto_231633 ?auto_231634 ) ) ( not ( = ?auto_231633 ?auto_231635 ) ) ( not ( = ?auto_231633 ?auto_231636 ) ) ( not ( = ?auto_231633 ?auto_231637 ) ) ( not ( = ?auto_231633 ?auto_231638 ) ) ( not ( = ?auto_231633 ?auto_231639 ) ) ( not ( = ?auto_231633 ?auto_231640 ) ) ( not ( = ?auto_231634 ?auto_231635 ) ) ( not ( = ?auto_231634 ?auto_231636 ) ) ( not ( = ?auto_231634 ?auto_231637 ) ) ( not ( = ?auto_231634 ?auto_231638 ) ) ( not ( = ?auto_231634 ?auto_231639 ) ) ( not ( = ?auto_231634 ?auto_231640 ) ) ( not ( = ?auto_231635 ?auto_231636 ) ) ( not ( = ?auto_231635 ?auto_231637 ) ) ( not ( = ?auto_231635 ?auto_231638 ) ) ( not ( = ?auto_231635 ?auto_231639 ) ) ( not ( = ?auto_231635 ?auto_231640 ) ) ( not ( = ?auto_231636 ?auto_231637 ) ) ( not ( = ?auto_231636 ?auto_231638 ) ) ( not ( = ?auto_231636 ?auto_231639 ) ) ( not ( = ?auto_231636 ?auto_231640 ) ) ( not ( = ?auto_231637 ?auto_231638 ) ) ( not ( = ?auto_231637 ?auto_231639 ) ) ( not ( = ?auto_231637 ?auto_231640 ) ) ( not ( = ?auto_231638 ?auto_231639 ) ) ( not ( = ?auto_231638 ?auto_231640 ) ) ( not ( = ?auto_231639 ?auto_231640 ) ) ( ON ?auto_231638 ?auto_231639 ) ( ON ?auto_231637 ?auto_231638 ) ( ON ?auto_231636 ?auto_231637 ) ( CLEAR ?auto_231634 ) ( ON ?auto_231635 ?auto_231636 ) ( CLEAR ?auto_231635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_231629 ?auto_231630 ?auto_231631 ?auto_231632 ?auto_231633 ?auto_231634 ?auto_231635 )
      ( MAKE-11PILE ?auto_231629 ?auto_231630 ?auto_231631 ?auto_231632 ?auto_231633 ?auto_231634 ?auto_231635 ?auto_231636 ?auto_231637 ?auto_231638 ?auto_231639 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231652 - BLOCK
      ?auto_231653 - BLOCK
      ?auto_231654 - BLOCK
      ?auto_231655 - BLOCK
      ?auto_231656 - BLOCK
      ?auto_231657 - BLOCK
      ?auto_231658 - BLOCK
      ?auto_231659 - BLOCK
      ?auto_231660 - BLOCK
      ?auto_231661 - BLOCK
      ?auto_231662 - BLOCK
    )
    :vars
    (
      ?auto_231663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231662 ?auto_231663 ) ( ON-TABLE ?auto_231652 ) ( ON ?auto_231653 ?auto_231652 ) ( ON ?auto_231654 ?auto_231653 ) ( ON ?auto_231655 ?auto_231654 ) ( ON ?auto_231656 ?auto_231655 ) ( ON ?auto_231657 ?auto_231656 ) ( not ( = ?auto_231652 ?auto_231653 ) ) ( not ( = ?auto_231652 ?auto_231654 ) ) ( not ( = ?auto_231652 ?auto_231655 ) ) ( not ( = ?auto_231652 ?auto_231656 ) ) ( not ( = ?auto_231652 ?auto_231657 ) ) ( not ( = ?auto_231652 ?auto_231658 ) ) ( not ( = ?auto_231652 ?auto_231659 ) ) ( not ( = ?auto_231652 ?auto_231660 ) ) ( not ( = ?auto_231652 ?auto_231661 ) ) ( not ( = ?auto_231652 ?auto_231662 ) ) ( not ( = ?auto_231652 ?auto_231663 ) ) ( not ( = ?auto_231653 ?auto_231654 ) ) ( not ( = ?auto_231653 ?auto_231655 ) ) ( not ( = ?auto_231653 ?auto_231656 ) ) ( not ( = ?auto_231653 ?auto_231657 ) ) ( not ( = ?auto_231653 ?auto_231658 ) ) ( not ( = ?auto_231653 ?auto_231659 ) ) ( not ( = ?auto_231653 ?auto_231660 ) ) ( not ( = ?auto_231653 ?auto_231661 ) ) ( not ( = ?auto_231653 ?auto_231662 ) ) ( not ( = ?auto_231653 ?auto_231663 ) ) ( not ( = ?auto_231654 ?auto_231655 ) ) ( not ( = ?auto_231654 ?auto_231656 ) ) ( not ( = ?auto_231654 ?auto_231657 ) ) ( not ( = ?auto_231654 ?auto_231658 ) ) ( not ( = ?auto_231654 ?auto_231659 ) ) ( not ( = ?auto_231654 ?auto_231660 ) ) ( not ( = ?auto_231654 ?auto_231661 ) ) ( not ( = ?auto_231654 ?auto_231662 ) ) ( not ( = ?auto_231654 ?auto_231663 ) ) ( not ( = ?auto_231655 ?auto_231656 ) ) ( not ( = ?auto_231655 ?auto_231657 ) ) ( not ( = ?auto_231655 ?auto_231658 ) ) ( not ( = ?auto_231655 ?auto_231659 ) ) ( not ( = ?auto_231655 ?auto_231660 ) ) ( not ( = ?auto_231655 ?auto_231661 ) ) ( not ( = ?auto_231655 ?auto_231662 ) ) ( not ( = ?auto_231655 ?auto_231663 ) ) ( not ( = ?auto_231656 ?auto_231657 ) ) ( not ( = ?auto_231656 ?auto_231658 ) ) ( not ( = ?auto_231656 ?auto_231659 ) ) ( not ( = ?auto_231656 ?auto_231660 ) ) ( not ( = ?auto_231656 ?auto_231661 ) ) ( not ( = ?auto_231656 ?auto_231662 ) ) ( not ( = ?auto_231656 ?auto_231663 ) ) ( not ( = ?auto_231657 ?auto_231658 ) ) ( not ( = ?auto_231657 ?auto_231659 ) ) ( not ( = ?auto_231657 ?auto_231660 ) ) ( not ( = ?auto_231657 ?auto_231661 ) ) ( not ( = ?auto_231657 ?auto_231662 ) ) ( not ( = ?auto_231657 ?auto_231663 ) ) ( not ( = ?auto_231658 ?auto_231659 ) ) ( not ( = ?auto_231658 ?auto_231660 ) ) ( not ( = ?auto_231658 ?auto_231661 ) ) ( not ( = ?auto_231658 ?auto_231662 ) ) ( not ( = ?auto_231658 ?auto_231663 ) ) ( not ( = ?auto_231659 ?auto_231660 ) ) ( not ( = ?auto_231659 ?auto_231661 ) ) ( not ( = ?auto_231659 ?auto_231662 ) ) ( not ( = ?auto_231659 ?auto_231663 ) ) ( not ( = ?auto_231660 ?auto_231661 ) ) ( not ( = ?auto_231660 ?auto_231662 ) ) ( not ( = ?auto_231660 ?auto_231663 ) ) ( not ( = ?auto_231661 ?auto_231662 ) ) ( not ( = ?auto_231661 ?auto_231663 ) ) ( not ( = ?auto_231662 ?auto_231663 ) ) ( ON ?auto_231661 ?auto_231662 ) ( ON ?auto_231660 ?auto_231661 ) ( ON ?auto_231659 ?auto_231660 ) ( CLEAR ?auto_231657 ) ( ON ?auto_231658 ?auto_231659 ) ( CLEAR ?auto_231658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_231652 ?auto_231653 ?auto_231654 ?auto_231655 ?auto_231656 ?auto_231657 ?auto_231658 )
      ( MAKE-11PILE ?auto_231652 ?auto_231653 ?auto_231654 ?auto_231655 ?auto_231656 ?auto_231657 ?auto_231658 ?auto_231659 ?auto_231660 ?auto_231661 ?auto_231662 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231675 - BLOCK
      ?auto_231676 - BLOCK
      ?auto_231677 - BLOCK
      ?auto_231678 - BLOCK
      ?auto_231679 - BLOCK
      ?auto_231680 - BLOCK
      ?auto_231681 - BLOCK
      ?auto_231682 - BLOCK
      ?auto_231683 - BLOCK
      ?auto_231684 - BLOCK
      ?auto_231685 - BLOCK
    )
    :vars
    (
      ?auto_231686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231685 ?auto_231686 ) ( ON-TABLE ?auto_231675 ) ( ON ?auto_231676 ?auto_231675 ) ( ON ?auto_231677 ?auto_231676 ) ( ON ?auto_231678 ?auto_231677 ) ( ON ?auto_231679 ?auto_231678 ) ( not ( = ?auto_231675 ?auto_231676 ) ) ( not ( = ?auto_231675 ?auto_231677 ) ) ( not ( = ?auto_231675 ?auto_231678 ) ) ( not ( = ?auto_231675 ?auto_231679 ) ) ( not ( = ?auto_231675 ?auto_231680 ) ) ( not ( = ?auto_231675 ?auto_231681 ) ) ( not ( = ?auto_231675 ?auto_231682 ) ) ( not ( = ?auto_231675 ?auto_231683 ) ) ( not ( = ?auto_231675 ?auto_231684 ) ) ( not ( = ?auto_231675 ?auto_231685 ) ) ( not ( = ?auto_231675 ?auto_231686 ) ) ( not ( = ?auto_231676 ?auto_231677 ) ) ( not ( = ?auto_231676 ?auto_231678 ) ) ( not ( = ?auto_231676 ?auto_231679 ) ) ( not ( = ?auto_231676 ?auto_231680 ) ) ( not ( = ?auto_231676 ?auto_231681 ) ) ( not ( = ?auto_231676 ?auto_231682 ) ) ( not ( = ?auto_231676 ?auto_231683 ) ) ( not ( = ?auto_231676 ?auto_231684 ) ) ( not ( = ?auto_231676 ?auto_231685 ) ) ( not ( = ?auto_231676 ?auto_231686 ) ) ( not ( = ?auto_231677 ?auto_231678 ) ) ( not ( = ?auto_231677 ?auto_231679 ) ) ( not ( = ?auto_231677 ?auto_231680 ) ) ( not ( = ?auto_231677 ?auto_231681 ) ) ( not ( = ?auto_231677 ?auto_231682 ) ) ( not ( = ?auto_231677 ?auto_231683 ) ) ( not ( = ?auto_231677 ?auto_231684 ) ) ( not ( = ?auto_231677 ?auto_231685 ) ) ( not ( = ?auto_231677 ?auto_231686 ) ) ( not ( = ?auto_231678 ?auto_231679 ) ) ( not ( = ?auto_231678 ?auto_231680 ) ) ( not ( = ?auto_231678 ?auto_231681 ) ) ( not ( = ?auto_231678 ?auto_231682 ) ) ( not ( = ?auto_231678 ?auto_231683 ) ) ( not ( = ?auto_231678 ?auto_231684 ) ) ( not ( = ?auto_231678 ?auto_231685 ) ) ( not ( = ?auto_231678 ?auto_231686 ) ) ( not ( = ?auto_231679 ?auto_231680 ) ) ( not ( = ?auto_231679 ?auto_231681 ) ) ( not ( = ?auto_231679 ?auto_231682 ) ) ( not ( = ?auto_231679 ?auto_231683 ) ) ( not ( = ?auto_231679 ?auto_231684 ) ) ( not ( = ?auto_231679 ?auto_231685 ) ) ( not ( = ?auto_231679 ?auto_231686 ) ) ( not ( = ?auto_231680 ?auto_231681 ) ) ( not ( = ?auto_231680 ?auto_231682 ) ) ( not ( = ?auto_231680 ?auto_231683 ) ) ( not ( = ?auto_231680 ?auto_231684 ) ) ( not ( = ?auto_231680 ?auto_231685 ) ) ( not ( = ?auto_231680 ?auto_231686 ) ) ( not ( = ?auto_231681 ?auto_231682 ) ) ( not ( = ?auto_231681 ?auto_231683 ) ) ( not ( = ?auto_231681 ?auto_231684 ) ) ( not ( = ?auto_231681 ?auto_231685 ) ) ( not ( = ?auto_231681 ?auto_231686 ) ) ( not ( = ?auto_231682 ?auto_231683 ) ) ( not ( = ?auto_231682 ?auto_231684 ) ) ( not ( = ?auto_231682 ?auto_231685 ) ) ( not ( = ?auto_231682 ?auto_231686 ) ) ( not ( = ?auto_231683 ?auto_231684 ) ) ( not ( = ?auto_231683 ?auto_231685 ) ) ( not ( = ?auto_231683 ?auto_231686 ) ) ( not ( = ?auto_231684 ?auto_231685 ) ) ( not ( = ?auto_231684 ?auto_231686 ) ) ( not ( = ?auto_231685 ?auto_231686 ) ) ( ON ?auto_231684 ?auto_231685 ) ( ON ?auto_231683 ?auto_231684 ) ( ON ?auto_231682 ?auto_231683 ) ( ON ?auto_231681 ?auto_231682 ) ( CLEAR ?auto_231679 ) ( ON ?auto_231680 ?auto_231681 ) ( CLEAR ?auto_231680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_231675 ?auto_231676 ?auto_231677 ?auto_231678 ?auto_231679 ?auto_231680 )
      ( MAKE-11PILE ?auto_231675 ?auto_231676 ?auto_231677 ?auto_231678 ?auto_231679 ?auto_231680 ?auto_231681 ?auto_231682 ?auto_231683 ?auto_231684 ?auto_231685 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231698 - BLOCK
      ?auto_231699 - BLOCK
      ?auto_231700 - BLOCK
      ?auto_231701 - BLOCK
      ?auto_231702 - BLOCK
      ?auto_231703 - BLOCK
      ?auto_231704 - BLOCK
      ?auto_231705 - BLOCK
      ?auto_231706 - BLOCK
      ?auto_231707 - BLOCK
      ?auto_231708 - BLOCK
    )
    :vars
    (
      ?auto_231709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231708 ?auto_231709 ) ( ON-TABLE ?auto_231698 ) ( ON ?auto_231699 ?auto_231698 ) ( ON ?auto_231700 ?auto_231699 ) ( ON ?auto_231701 ?auto_231700 ) ( ON ?auto_231702 ?auto_231701 ) ( not ( = ?auto_231698 ?auto_231699 ) ) ( not ( = ?auto_231698 ?auto_231700 ) ) ( not ( = ?auto_231698 ?auto_231701 ) ) ( not ( = ?auto_231698 ?auto_231702 ) ) ( not ( = ?auto_231698 ?auto_231703 ) ) ( not ( = ?auto_231698 ?auto_231704 ) ) ( not ( = ?auto_231698 ?auto_231705 ) ) ( not ( = ?auto_231698 ?auto_231706 ) ) ( not ( = ?auto_231698 ?auto_231707 ) ) ( not ( = ?auto_231698 ?auto_231708 ) ) ( not ( = ?auto_231698 ?auto_231709 ) ) ( not ( = ?auto_231699 ?auto_231700 ) ) ( not ( = ?auto_231699 ?auto_231701 ) ) ( not ( = ?auto_231699 ?auto_231702 ) ) ( not ( = ?auto_231699 ?auto_231703 ) ) ( not ( = ?auto_231699 ?auto_231704 ) ) ( not ( = ?auto_231699 ?auto_231705 ) ) ( not ( = ?auto_231699 ?auto_231706 ) ) ( not ( = ?auto_231699 ?auto_231707 ) ) ( not ( = ?auto_231699 ?auto_231708 ) ) ( not ( = ?auto_231699 ?auto_231709 ) ) ( not ( = ?auto_231700 ?auto_231701 ) ) ( not ( = ?auto_231700 ?auto_231702 ) ) ( not ( = ?auto_231700 ?auto_231703 ) ) ( not ( = ?auto_231700 ?auto_231704 ) ) ( not ( = ?auto_231700 ?auto_231705 ) ) ( not ( = ?auto_231700 ?auto_231706 ) ) ( not ( = ?auto_231700 ?auto_231707 ) ) ( not ( = ?auto_231700 ?auto_231708 ) ) ( not ( = ?auto_231700 ?auto_231709 ) ) ( not ( = ?auto_231701 ?auto_231702 ) ) ( not ( = ?auto_231701 ?auto_231703 ) ) ( not ( = ?auto_231701 ?auto_231704 ) ) ( not ( = ?auto_231701 ?auto_231705 ) ) ( not ( = ?auto_231701 ?auto_231706 ) ) ( not ( = ?auto_231701 ?auto_231707 ) ) ( not ( = ?auto_231701 ?auto_231708 ) ) ( not ( = ?auto_231701 ?auto_231709 ) ) ( not ( = ?auto_231702 ?auto_231703 ) ) ( not ( = ?auto_231702 ?auto_231704 ) ) ( not ( = ?auto_231702 ?auto_231705 ) ) ( not ( = ?auto_231702 ?auto_231706 ) ) ( not ( = ?auto_231702 ?auto_231707 ) ) ( not ( = ?auto_231702 ?auto_231708 ) ) ( not ( = ?auto_231702 ?auto_231709 ) ) ( not ( = ?auto_231703 ?auto_231704 ) ) ( not ( = ?auto_231703 ?auto_231705 ) ) ( not ( = ?auto_231703 ?auto_231706 ) ) ( not ( = ?auto_231703 ?auto_231707 ) ) ( not ( = ?auto_231703 ?auto_231708 ) ) ( not ( = ?auto_231703 ?auto_231709 ) ) ( not ( = ?auto_231704 ?auto_231705 ) ) ( not ( = ?auto_231704 ?auto_231706 ) ) ( not ( = ?auto_231704 ?auto_231707 ) ) ( not ( = ?auto_231704 ?auto_231708 ) ) ( not ( = ?auto_231704 ?auto_231709 ) ) ( not ( = ?auto_231705 ?auto_231706 ) ) ( not ( = ?auto_231705 ?auto_231707 ) ) ( not ( = ?auto_231705 ?auto_231708 ) ) ( not ( = ?auto_231705 ?auto_231709 ) ) ( not ( = ?auto_231706 ?auto_231707 ) ) ( not ( = ?auto_231706 ?auto_231708 ) ) ( not ( = ?auto_231706 ?auto_231709 ) ) ( not ( = ?auto_231707 ?auto_231708 ) ) ( not ( = ?auto_231707 ?auto_231709 ) ) ( not ( = ?auto_231708 ?auto_231709 ) ) ( ON ?auto_231707 ?auto_231708 ) ( ON ?auto_231706 ?auto_231707 ) ( ON ?auto_231705 ?auto_231706 ) ( ON ?auto_231704 ?auto_231705 ) ( CLEAR ?auto_231702 ) ( ON ?auto_231703 ?auto_231704 ) ( CLEAR ?auto_231703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_231698 ?auto_231699 ?auto_231700 ?auto_231701 ?auto_231702 ?auto_231703 )
      ( MAKE-11PILE ?auto_231698 ?auto_231699 ?auto_231700 ?auto_231701 ?auto_231702 ?auto_231703 ?auto_231704 ?auto_231705 ?auto_231706 ?auto_231707 ?auto_231708 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231721 - BLOCK
      ?auto_231722 - BLOCK
      ?auto_231723 - BLOCK
      ?auto_231724 - BLOCK
      ?auto_231725 - BLOCK
      ?auto_231726 - BLOCK
      ?auto_231727 - BLOCK
      ?auto_231728 - BLOCK
      ?auto_231729 - BLOCK
      ?auto_231730 - BLOCK
      ?auto_231731 - BLOCK
    )
    :vars
    (
      ?auto_231732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231731 ?auto_231732 ) ( ON-TABLE ?auto_231721 ) ( ON ?auto_231722 ?auto_231721 ) ( ON ?auto_231723 ?auto_231722 ) ( ON ?auto_231724 ?auto_231723 ) ( not ( = ?auto_231721 ?auto_231722 ) ) ( not ( = ?auto_231721 ?auto_231723 ) ) ( not ( = ?auto_231721 ?auto_231724 ) ) ( not ( = ?auto_231721 ?auto_231725 ) ) ( not ( = ?auto_231721 ?auto_231726 ) ) ( not ( = ?auto_231721 ?auto_231727 ) ) ( not ( = ?auto_231721 ?auto_231728 ) ) ( not ( = ?auto_231721 ?auto_231729 ) ) ( not ( = ?auto_231721 ?auto_231730 ) ) ( not ( = ?auto_231721 ?auto_231731 ) ) ( not ( = ?auto_231721 ?auto_231732 ) ) ( not ( = ?auto_231722 ?auto_231723 ) ) ( not ( = ?auto_231722 ?auto_231724 ) ) ( not ( = ?auto_231722 ?auto_231725 ) ) ( not ( = ?auto_231722 ?auto_231726 ) ) ( not ( = ?auto_231722 ?auto_231727 ) ) ( not ( = ?auto_231722 ?auto_231728 ) ) ( not ( = ?auto_231722 ?auto_231729 ) ) ( not ( = ?auto_231722 ?auto_231730 ) ) ( not ( = ?auto_231722 ?auto_231731 ) ) ( not ( = ?auto_231722 ?auto_231732 ) ) ( not ( = ?auto_231723 ?auto_231724 ) ) ( not ( = ?auto_231723 ?auto_231725 ) ) ( not ( = ?auto_231723 ?auto_231726 ) ) ( not ( = ?auto_231723 ?auto_231727 ) ) ( not ( = ?auto_231723 ?auto_231728 ) ) ( not ( = ?auto_231723 ?auto_231729 ) ) ( not ( = ?auto_231723 ?auto_231730 ) ) ( not ( = ?auto_231723 ?auto_231731 ) ) ( not ( = ?auto_231723 ?auto_231732 ) ) ( not ( = ?auto_231724 ?auto_231725 ) ) ( not ( = ?auto_231724 ?auto_231726 ) ) ( not ( = ?auto_231724 ?auto_231727 ) ) ( not ( = ?auto_231724 ?auto_231728 ) ) ( not ( = ?auto_231724 ?auto_231729 ) ) ( not ( = ?auto_231724 ?auto_231730 ) ) ( not ( = ?auto_231724 ?auto_231731 ) ) ( not ( = ?auto_231724 ?auto_231732 ) ) ( not ( = ?auto_231725 ?auto_231726 ) ) ( not ( = ?auto_231725 ?auto_231727 ) ) ( not ( = ?auto_231725 ?auto_231728 ) ) ( not ( = ?auto_231725 ?auto_231729 ) ) ( not ( = ?auto_231725 ?auto_231730 ) ) ( not ( = ?auto_231725 ?auto_231731 ) ) ( not ( = ?auto_231725 ?auto_231732 ) ) ( not ( = ?auto_231726 ?auto_231727 ) ) ( not ( = ?auto_231726 ?auto_231728 ) ) ( not ( = ?auto_231726 ?auto_231729 ) ) ( not ( = ?auto_231726 ?auto_231730 ) ) ( not ( = ?auto_231726 ?auto_231731 ) ) ( not ( = ?auto_231726 ?auto_231732 ) ) ( not ( = ?auto_231727 ?auto_231728 ) ) ( not ( = ?auto_231727 ?auto_231729 ) ) ( not ( = ?auto_231727 ?auto_231730 ) ) ( not ( = ?auto_231727 ?auto_231731 ) ) ( not ( = ?auto_231727 ?auto_231732 ) ) ( not ( = ?auto_231728 ?auto_231729 ) ) ( not ( = ?auto_231728 ?auto_231730 ) ) ( not ( = ?auto_231728 ?auto_231731 ) ) ( not ( = ?auto_231728 ?auto_231732 ) ) ( not ( = ?auto_231729 ?auto_231730 ) ) ( not ( = ?auto_231729 ?auto_231731 ) ) ( not ( = ?auto_231729 ?auto_231732 ) ) ( not ( = ?auto_231730 ?auto_231731 ) ) ( not ( = ?auto_231730 ?auto_231732 ) ) ( not ( = ?auto_231731 ?auto_231732 ) ) ( ON ?auto_231730 ?auto_231731 ) ( ON ?auto_231729 ?auto_231730 ) ( ON ?auto_231728 ?auto_231729 ) ( ON ?auto_231727 ?auto_231728 ) ( ON ?auto_231726 ?auto_231727 ) ( CLEAR ?auto_231724 ) ( ON ?auto_231725 ?auto_231726 ) ( CLEAR ?auto_231725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_231721 ?auto_231722 ?auto_231723 ?auto_231724 ?auto_231725 )
      ( MAKE-11PILE ?auto_231721 ?auto_231722 ?auto_231723 ?auto_231724 ?auto_231725 ?auto_231726 ?auto_231727 ?auto_231728 ?auto_231729 ?auto_231730 ?auto_231731 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231744 - BLOCK
      ?auto_231745 - BLOCK
      ?auto_231746 - BLOCK
      ?auto_231747 - BLOCK
      ?auto_231748 - BLOCK
      ?auto_231749 - BLOCK
      ?auto_231750 - BLOCK
      ?auto_231751 - BLOCK
      ?auto_231752 - BLOCK
      ?auto_231753 - BLOCK
      ?auto_231754 - BLOCK
    )
    :vars
    (
      ?auto_231755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231754 ?auto_231755 ) ( ON-TABLE ?auto_231744 ) ( ON ?auto_231745 ?auto_231744 ) ( ON ?auto_231746 ?auto_231745 ) ( ON ?auto_231747 ?auto_231746 ) ( not ( = ?auto_231744 ?auto_231745 ) ) ( not ( = ?auto_231744 ?auto_231746 ) ) ( not ( = ?auto_231744 ?auto_231747 ) ) ( not ( = ?auto_231744 ?auto_231748 ) ) ( not ( = ?auto_231744 ?auto_231749 ) ) ( not ( = ?auto_231744 ?auto_231750 ) ) ( not ( = ?auto_231744 ?auto_231751 ) ) ( not ( = ?auto_231744 ?auto_231752 ) ) ( not ( = ?auto_231744 ?auto_231753 ) ) ( not ( = ?auto_231744 ?auto_231754 ) ) ( not ( = ?auto_231744 ?auto_231755 ) ) ( not ( = ?auto_231745 ?auto_231746 ) ) ( not ( = ?auto_231745 ?auto_231747 ) ) ( not ( = ?auto_231745 ?auto_231748 ) ) ( not ( = ?auto_231745 ?auto_231749 ) ) ( not ( = ?auto_231745 ?auto_231750 ) ) ( not ( = ?auto_231745 ?auto_231751 ) ) ( not ( = ?auto_231745 ?auto_231752 ) ) ( not ( = ?auto_231745 ?auto_231753 ) ) ( not ( = ?auto_231745 ?auto_231754 ) ) ( not ( = ?auto_231745 ?auto_231755 ) ) ( not ( = ?auto_231746 ?auto_231747 ) ) ( not ( = ?auto_231746 ?auto_231748 ) ) ( not ( = ?auto_231746 ?auto_231749 ) ) ( not ( = ?auto_231746 ?auto_231750 ) ) ( not ( = ?auto_231746 ?auto_231751 ) ) ( not ( = ?auto_231746 ?auto_231752 ) ) ( not ( = ?auto_231746 ?auto_231753 ) ) ( not ( = ?auto_231746 ?auto_231754 ) ) ( not ( = ?auto_231746 ?auto_231755 ) ) ( not ( = ?auto_231747 ?auto_231748 ) ) ( not ( = ?auto_231747 ?auto_231749 ) ) ( not ( = ?auto_231747 ?auto_231750 ) ) ( not ( = ?auto_231747 ?auto_231751 ) ) ( not ( = ?auto_231747 ?auto_231752 ) ) ( not ( = ?auto_231747 ?auto_231753 ) ) ( not ( = ?auto_231747 ?auto_231754 ) ) ( not ( = ?auto_231747 ?auto_231755 ) ) ( not ( = ?auto_231748 ?auto_231749 ) ) ( not ( = ?auto_231748 ?auto_231750 ) ) ( not ( = ?auto_231748 ?auto_231751 ) ) ( not ( = ?auto_231748 ?auto_231752 ) ) ( not ( = ?auto_231748 ?auto_231753 ) ) ( not ( = ?auto_231748 ?auto_231754 ) ) ( not ( = ?auto_231748 ?auto_231755 ) ) ( not ( = ?auto_231749 ?auto_231750 ) ) ( not ( = ?auto_231749 ?auto_231751 ) ) ( not ( = ?auto_231749 ?auto_231752 ) ) ( not ( = ?auto_231749 ?auto_231753 ) ) ( not ( = ?auto_231749 ?auto_231754 ) ) ( not ( = ?auto_231749 ?auto_231755 ) ) ( not ( = ?auto_231750 ?auto_231751 ) ) ( not ( = ?auto_231750 ?auto_231752 ) ) ( not ( = ?auto_231750 ?auto_231753 ) ) ( not ( = ?auto_231750 ?auto_231754 ) ) ( not ( = ?auto_231750 ?auto_231755 ) ) ( not ( = ?auto_231751 ?auto_231752 ) ) ( not ( = ?auto_231751 ?auto_231753 ) ) ( not ( = ?auto_231751 ?auto_231754 ) ) ( not ( = ?auto_231751 ?auto_231755 ) ) ( not ( = ?auto_231752 ?auto_231753 ) ) ( not ( = ?auto_231752 ?auto_231754 ) ) ( not ( = ?auto_231752 ?auto_231755 ) ) ( not ( = ?auto_231753 ?auto_231754 ) ) ( not ( = ?auto_231753 ?auto_231755 ) ) ( not ( = ?auto_231754 ?auto_231755 ) ) ( ON ?auto_231753 ?auto_231754 ) ( ON ?auto_231752 ?auto_231753 ) ( ON ?auto_231751 ?auto_231752 ) ( ON ?auto_231750 ?auto_231751 ) ( ON ?auto_231749 ?auto_231750 ) ( CLEAR ?auto_231747 ) ( ON ?auto_231748 ?auto_231749 ) ( CLEAR ?auto_231748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_231744 ?auto_231745 ?auto_231746 ?auto_231747 ?auto_231748 )
      ( MAKE-11PILE ?auto_231744 ?auto_231745 ?auto_231746 ?auto_231747 ?auto_231748 ?auto_231749 ?auto_231750 ?auto_231751 ?auto_231752 ?auto_231753 ?auto_231754 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231767 - BLOCK
      ?auto_231768 - BLOCK
      ?auto_231769 - BLOCK
      ?auto_231770 - BLOCK
      ?auto_231771 - BLOCK
      ?auto_231772 - BLOCK
      ?auto_231773 - BLOCK
      ?auto_231774 - BLOCK
      ?auto_231775 - BLOCK
      ?auto_231776 - BLOCK
      ?auto_231777 - BLOCK
    )
    :vars
    (
      ?auto_231778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231777 ?auto_231778 ) ( ON-TABLE ?auto_231767 ) ( ON ?auto_231768 ?auto_231767 ) ( ON ?auto_231769 ?auto_231768 ) ( not ( = ?auto_231767 ?auto_231768 ) ) ( not ( = ?auto_231767 ?auto_231769 ) ) ( not ( = ?auto_231767 ?auto_231770 ) ) ( not ( = ?auto_231767 ?auto_231771 ) ) ( not ( = ?auto_231767 ?auto_231772 ) ) ( not ( = ?auto_231767 ?auto_231773 ) ) ( not ( = ?auto_231767 ?auto_231774 ) ) ( not ( = ?auto_231767 ?auto_231775 ) ) ( not ( = ?auto_231767 ?auto_231776 ) ) ( not ( = ?auto_231767 ?auto_231777 ) ) ( not ( = ?auto_231767 ?auto_231778 ) ) ( not ( = ?auto_231768 ?auto_231769 ) ) ( not ( = ?auto_231768 ?auto_231770 ) ) ( not ( = ?auto_231768 ?auto_231771 ) ) ( not ( = ?auto_231768 ?auto_231772 ) ) ( not ( = ?auto_231768 ?auto_231773 ) ) ( not ( = ?auto_231768 ?auto_231774 ) ) ( not ( = ?auto_231768 ?auto_231775 ) ) ( not ( = ?auto_231768 ?auto_231776 ) ) ( not ( = ?auto_231768 ?auto_231777 ) ) ( not ( = ?auto_231768 ?auto_231778 ) ) ( not ( = ?auto_231769 ?auto_231770 ) ) ( not ( = ?auto_231769 ?auto_231771 ) ) ( not ( = ?auto_231769 ?auto_231772 ) ) ( not ( = ?auto_231769 ?auto_231773 ) ) ( not ( = ?auto_231769 ?auto_231774 ) ) ( not ( = ?auto_231769 ?auto_231775 ) ) ( not ( = ?auto_231769 ?auto_231776 ) ) ( not ( = ?auto_231769 ?auto_231777 ) ) ( not ( = ?auto_231769 ?auto_231778 ) ) ( not ( = ?auto_231770 ?auto_231771 ) ) ( not ( = ?auto_231770 ?auto_231772 ) ) ( not ( = ?auto_231770 ?auto_231773 ) ) ( not ( = ?auto_231770 ?auto_231774 ) ) ( not ( = ?auto_231770 ?auto_231775 ) ) ( not ( = ?auto_231770 ?auto_231776 ) ) ( not ( = ?auto_231770 ?auto_231777 ) ) ( not ( = ?auto_231770 ?auto_231778 ) ) ( not ( = ?auto_231771 ?auto_231772 ) ) ( not ( = ?auto_231771 ?auto_231773 ) ) ( not ( = ?auto_231771 ?auto_231774 ) ) ( not ( = ?auto_231771 ?auto_231775 ) ) ( not ( = ?auto_231771 ?auto_231776 ) ) ( not ( = ?auto_231771 ?auto_231777 ) ) ( not ( = ?auto_231771 ?auto_231778 ) ) ( not ( = ?auto_231772 ?auto_231773 ) ) ( not ( = ?auto_231772 ?auto_231774 ) ) ( not ( = ?auto_231772 ?auto_231775 ) ) ( not ( = ?auto_231772 ?auto_231776 ) ) ( not ( = ?auto_231772 ?auto_231777 ) ) ( not ( = ?auto_231772 ?auto_231778 ) ) ( not ( = ?auto_231773 ?auto_231774 ) ) ( not ( = ?auto_231773 ?auto_231775 ) ) ( not ( = ?auto_231773 ?auto_231776 ) ) ( not ( = ?auto_231773 ?auto_231777 ) ) ( not ( = ?auto_231773 ?auto_231778 ) ) ( not ( = ?auto_231774 ?auto_231775 ) ) ( not ( = ?auto_231774 ?auto_231776 ) ) ( not ( = ?auto_231774 ?auto_231777 ) ) ( not ( = ?auto_231774 ?auto_231778 ) ) ( not ( = ?auto_231775 ?auto_231776 ) ) ( not ( = ?auto_231775 ?auto_231777 ) ) ( not ( = ?auto_231775 ?auto_231778 ) ) ( not ( = ?auto_231776 ?auto_231777 ) ) ( not ( = ?auto_231776 ?auto_231778 ) ) ( not ( = ?auto_231777 ?auto_231778 ) ) ( ON ?auto_231776 ?auto_231777 ) ( ON ?auto_231775 ?auto_231776 ) ( ON ?auto_231774 ?auto_231775 ) ( ON ?auto_231773 ?auto_231774 ) ( ON ?auto_231772 ?auto_231773 ) ( ON ?auto_231771 ?auto_231772 ) ( CLEAR ?auto_231769 ) ( ON ?auto_231770 ?auto_231771 ) ( CLEAR ?auto_231770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_231767 ?auto_231768 ?auto_231769 ?auto_231770 )
      ( MAKE-11PILE ?auto_231767 ?auto_231768 ?auto_231769 ?auto_231770 ?auto_231771 ?auto_231772 ?auto_231773 ?auto_231774 ?auto_231775 ?auto_231776 ?auto_231777 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231790 - BLOCK
      ?auto_231791 - BLOCK
      ?auto_231792 - BLOCK
      ?auto_231793 - BLOCK
      ?auto_231794 - BLOCK
      ?auto_231795 - BLOCK
      ?auto_231796 - BLOCK
      ?auto_231797 - BLOCK
      ?auto_231798 - BLOCK
      ?auto_231799 - BLOCK
      ?auto_231800 - BLOCK
    )
    :vars
    (
      ?auto_231801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231800 ?auto_231801 ) ( ON-TABLE ?auto_231790 ) ( ON ?auto_231791 ?auto_231790 ) ( ON ?auto_231792 ?auto_231791 ) ( not ( = ?auto_231790 ?auto_231791 ) ) ( not ( = ?auto_231790 ?auto_231792 ) ) ( not ( = ?auto_231790 ?auto_231793 ) ) ( not ( = ?auto_231790 ?auto_231794 ) ) ( not ( = ?auto_231790 ?auto_231795 ) ) ( not ( = ?auto_231790 ?auto_231796 ) ) ( not ( = ?auto_231790 ?auto_231797 ) ) ( not ( = ?auto_231790 ?auto_231798 ) ) ( not ( = ?auto_231790 ?auto_231799 ) ) ( not ( = ?auto_231790 ?auto_231800 ) ) ( not ( = ?auto_231790 ?auto_231801 ) ) ( not ( = ?auto_231791 ?auto_231792 ) ) ( not ( = ?auto_231791 ?auto_231793 ) ) ( not ( = ?auto_231791 ?auto_231794 ) ) ( not ( = ?auto_231791 ?auto_231795 ) ) ( not ( = ?auto_231791 ?auto_231796 ) ) ( not ( = ?auto_231791 ?auto_231797 ) ) ( not ( = ?auto_231791 ?auto_231798 ) ) ( not ( = ?auto_231791 ?auto_231799 ) ) ( not ( = ?auto_231791 ?auto_231800 ) ) ( not ( = ?auto_231791 ?auto_231801 ) ) ( not ( = ?auto_231792 ?auto_231793 ) ) ( not ( = ?auto_231792 ?auto_231794 ) ) ( not ( = ?auto_231792 ?auto_231795 ) ) ( not ( = ?auto_231792 ?auto_231796 ) ) ( not ( = ?auto_231792 ?auto_231797 ) ) ( not ( = ?auto_231792 ?auto_231798 ) ) ( not ( = ?auto_231792 ?auto_231799 ) ) ( not ( = ?auto_231792 ?auto_231800 ) ) ( not ( = ?auto_231792 ?auto_231801 ) ) ( not ( = ?auto_231793 ?auto_231794 ) ) ( not ( = ?auto_231793 ?auto_231795 ) ) ( not ( = ?auto_231793 ?auto_231796 ) ) ( not ( = ?auto_231793 ?auto_231797 ) ) ( not ( = ?auto_231793 ?auto_231798 ) ) ( not ( = ?auto_231793 ?auto_231799 ) ) ( not ( = ?auto_231793 ?auto_231800 ) ) ( not ( = ?auto_231793 ?auto_231801 ) ) ( not ( = ?auto_231794 ?auto_231795 ) ) ( not ( = ?auto_231794 ?auto_231796 ) ) ( not ( = ?auto_231794 ?auto_231797 ) ) ( not ( = ?auto_231794 ?auto_231798 ) ) ( not ( = ?auto_231794 ?auto_231799 ) ) ( not ( = ?auto_231794 ?auto_231800 ) ) ( not ( = ?auto_231794 ?auto_231801 ) ) ( not ( = ?auto_231795 ?auto_231796 ) ) ( not ( = ?auto_231795 ?auto_231797 ) ) ( not ( = ?auto_231795 ?auto_231798 ) ) ( not ( = ?auto_231795 ?auto_231799 ) ) ( not ( = ?auto_231795 ?auto_231800 ) ) ( not ( = ?auto_231795 ?auto_231801 ) ) ( not ( = ?auto_231796 ?auto_231797 ) ) ( not ( = ?auto_231796 ?auto_231798 ) ) ( not ( = ?auto_231796 ?auto_231799 ) ) ( not ( = ?auto_231796 ?auto_231800 ) ) ( not ( = ?auto_231796 ?auto_231801 ) ) ( not ( = ?auto_231797 ?auto_231798 ) ) ( not ( = ?auto_231797 ?auto_231799 ) ) ( not ( = ?auto_231797 ?auto_231800 ) ) ( not ( = ?auto_231797 ?auto_231801 ) ) ( not ( = ?auto_231798 ?auto_231799 ) ) ( not ( = ?auto_231798 ?auto_231800 ) ) ( not ( = ?auto_231798 ?auto_231801 ) ) ( not ( = ?auto_231799 ?auto_231800 ) ) ( not ( = ?auto_231799 ?auto_231801 ) ) ( not ( = ?auto_231800 ?auto_231801 ) ) ( ON ?auto_231799 ?auto_231800 ) ( ON ?auto_231798 ?auto_231799 ) ( ON ?auto_231797 ?auto_231798 ) ( ON ?auto_231796 ?auto_231797 ) ( ON ?auto_231795 ?auto_231796 ) ( ON ?auto_231794 ?auto_231795 ) ( CLEAR ?auto_231792 ) ( ON ?auto_231793 ?auto_231794 ) ( CLEAR ?auto_231793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_231790 ?auto_231791 ?auto_231792 ?auto_231793 )
      ( MAKE-11PILE ?auto_231790 ?auto_231791 ?auto_231792 ?auto_231793 ?auto_231794 ?auto_231795 ?auto_231796 ?auto_231797 ?auto_231798 ?auto_231799 ?auto_231800 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231813 - BLOCK
      ?auto_231814 - BLOCK
      ?auto_231815 - BLOCK
      ?auto_231816 - BLOCK
      ?auto_231817 - BLOCK
      ?auto_231818 - BLOCK
      ?auto_231819 - BLOCK
      ?auto_231820 - BLOCK
      ?auto_231821 - BLOCK
      ?auto_231822 - BLOCK
      ?auto_231823 - BLOCK
    )
    :vars
    (
      ?auto_231824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231823 ?auto_231824 ) ( ON-TABLE ?auto_231813 ) ( ON ?auto_231814 ?auto_231813 ) ( not ( = ?auto_231813 ?auto_231814 ) ) ( not ( = ?auto_231813 ?auto_231815 ) ) ( not ( = ?auto_231813 ?auto_231816 ) ) ( not ( = ?auto_231813 ?auto_231817 ) ) ( not ( = ?auto_231813 ?auto_231818 ) ) ( not ( = ?auto_231813 ?auto_231819 ) ) ( not ( = ?auto_231813 ?auto_231820 ) ) ( not ( = ?auto_231813 ?auto_231821 ) ) ( not ( = ?auto_231813 ?auto_231822 ) ) ( not ( = ?auto_231813 ?auto_231823 ) ) ( not ( = ?auto_231813 ?auto_231824 ) ) ( not ( = ?auto_231814 ?auto_231815 ) ) ( not ( = ?auto_231814 ?auto_231816 ) ) ( not ( = ?auto_231814 ?auto_231817 ) ) ( not ( = ?auto_231814 ?auto_231818 ) ) ( not ( = ?auto_231814 ?auto_231819 ) ) ( not ( = ?auto_231814 ?auto_231820 ) ) ( not ( = ?auto_231814 ?auto_231821 ) ) ( not ( = ?auto_231814 ?auto_231822 ) ) ( not ( = ?auto_231814 ?auto_231823 ) ) ( not ( = ?auto_231814 ?auto_231824 ) ) ( not ( = ?auto_231815 ?auto_231816 ) ) ( not ( = ?auto_231815 ?auto_231817 ) ) ( not ( = ?auto_231815 ?auto_231818 ) ) ( not ( = ?auto_231815 ?auto_231819 ) ) ( not ( = ?auto_231815 ?auto_231820 ) ) ( not ( = ?auto_231815 ?auto_231821 ) ) ( not ( = ?auto_231815 ?auto_231822 ) ) ( not ( = ?auto_231815 ?auto_231823 ) ) ( not ( = ?auto_231815 ?auto_231824 ) ) ( not ( = ?auto_231816 ?auto_231817 ) ) ( not ( = ?auto_231816 ?auto_231818 ) ) ( not ( = ?auto_231816 ?auto_231819 ) ) ( not ( = ?auto_231816 ?auto_231820 ) ) ( not ( = ?auto_231816 ?auto_231821 ) ) ( not ( = ?auto_231816 ?auto_231822 ) ) ( not ( = ?auto_231816 ?auto_231823 ) ) ( not ( = ?auto_231816 ?auto_231824 ) ) ( not ( = ?auto_231817 ?auto_231818 ) ) ( not ( = ?auto_231817 ?auto_231819 ) ) ( not ( = ?auto_231817 ?auto_231820 ) ) ( not ( = ?auto_231817 ?auto_231821 ) ) ( not ( = ?auto_231817 ?auto_231822 ) ) ( not ( = ?auto_231817 ?auto_231823 ) ) ( not ( = ?auto_231817 ?auto_231824 ) ) ( not ( = ?auto_231818 ?auto_231819 ) ) ( not ( = ?auto_231818 ?auto_231820 ) ) ( not ( = ?auto_231818 ?auto_231821 ) ) ( not ( = ?auto_231818 ?auto_231822 ) ) ( not ( = ?auto_231818 ?auto_231823 ) ) ( not ( = ?auto_231818 ?auto_231824 ) ) ( not ( = ?auto_231819 ?auto_231820 ) ) ( not ( = ?auto_231819 ?auto_231821 ) ) ( not ( = ?auto_231819 ?auto_231822 ) ) ( not ( = ?auto_231819 ?auto_231823 ) ) ( not ( = ?auto_231819 ?auto_231824 ) ) ( not ( = ?auto_231820 ?auto_231821 ) ) ( not ( = ?auto_231820 ?auto_231822 ) ) ( not ( = ?auto_231820 ?auto_231823 ) ) ( not ( = ?auto_231820 ?auto_231824 ) ) ( not ( = ?auto_231821 ?auto_231822 ) ) ( not ( = ?auto_231821 ?auto_231823 ) ) ( not ( = ?auto_231821 ?auto_231824 ) ) ( not ( = ?auto_231822 ?auto_231823 ) ) ( not ( = ?auto_231822 ?auto_231824 ) ) ( not ( = ?auto_231823 ?auto_231824 ) ) ( ON ?auto_231822 ?auto_231823 ) ( ON ?auto_231821 ?auto_231822 ) ( ON ?auto_231820 ?auto_231821 ) ( ON ?auto_231819 ?auto_231820 ) ( ON ?auto_231818 ?auto_231819 ) ( ON ?auto_231817 ?auto_231818 ) ( ON ?auto_231816 ?auto_231817 ) ( CLEAR ?auto_231814 ) ( ON ?auto_231815 ?auto_231816 ) ( CLEAR ?auto_231815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_231813 ?auto_231814 ?auto_231815 )
      ( MAKE-11PILE ?auto_231813 ?auto_231814 ?auto_231815 ?auto_231816 ?auto_231817 ?auto_231818 ?auto_231819 ?auto_231820 ?auto_231821 ?auto_231822 ?auto_231823 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231836 - BLOCK
      ?auto_231837 - BLOCK
      ?auto_231838 - BLOCK
      ?auto_231839 - BLOCK
      ?auto_231840 - BLOCK
      ?auto_231841 - BLOCK
      ?auto_231842 - BLOCK
      ?auto_231843 - BLOCK
      ?auto_231844 - BLOCK
      ?auto_231845 - BLOCK
      ?auto_231846 - BLOCK
    )
    :vars
    (
      ?auto_231847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231846 ?auto_231847 ) ( ON-TABLE ?auto_231836 ) ( ON ?auto_231837 ?auto_231836 ) ( not ( = ?auto_231836 ?auto_231837 ) ) ( not ( = ?auto_231836 ?auto_231838 ) ) ( not ( = ?auto_231836 ?auto_231839 ) ) ( not ( = ?auto_231836 ?auto_231840 ) ) ( not ( = ?auto_231836 ?auto_231841 ) ) ( not ( = ?auto_231836 ?auto_231842 ) ) ( not ( = ?auto_231836 ?auto_231843 ) ) ( not ( = ?auto_231836 ?auto_231844 ) ) ( not ( = ?auto_231836 ?auto_231845 ) ) ( not ( = ?auto_231836 ?auto_231846 ) ) ( not ( = ?auto_231836 ?auto_231847 ) ) ( not ( = ?auto_231837 ?auto_231838 ) ) ( not ( = ?auto_231837 ?auto_231839 ) ) ( not ( = ?auto_231837 ?auto_231840 ) ) ( not ( = ?auto_231837 ?auto_231841 ) ) ( not ( = ?auto_231837 ?auto_231842 ) ) ( not ( = ?auto_231837 ?auto_231843 ) ) ( not ( = ?auto_231837 ?auto_231844 ) ) ( not ( = ?auto_231837 ?auto_231845 ) ) ( not ( = ?auto_231837 ?auto_231846 ) ) ( not ( = ?auto_231837 ?auto_231847 ) ) ( not ( = ?auto_231838 ?auto_231839 ) ) ( not ( = ?auto_231838 ?auto_231840 ) ) ( not ( = ?auto_231838 ?auto_231841 ) ) ( not ( = ?auto_231838 ?auto_231842 ) ) ( not ( = ?auto_231838 ?auto_231843 ) ) ( not ( = ?auto_231838 ?auto_231844 ) ) ( not ( = ?auto_231838 ?auto_231845 ) ) ( not ( = ?auto_231838 ?auto_231846 ) ) ( not ( = ?auto_231838 ?auto_231847 ) ) ( not ( = ?auto_231839 ?auto_231840 ) ) ( not ( = ?auto_231839 ?auto_231841 ) ) ( not ( = ?auto_231839 ?auto_231842 ) ) ( not ( = ?auto_231839 ?auto_231843 ) ) ( not ( = ?auto_231839 ?auto_231844 ) ) ( not ( = ?auto_231839 ?auto_231845 ) ) ( not ( = ?auto_231839 ?auto_231846 ) ) ( not ( = ?auto_231839 ?auto_231847 ) ) ( not ( = ?auto_231840 ?auto_231841 ) ) ( not ( = ?auto_231840 ?auto_231842 ) ) ( not ( = ?auto_231840 ?auto_231843 ) ) ( not ( = ?auto_231840 ?auto_231844 ) ) ( not ( = ?auto_231840 ?auto_231845 ) ) ( not ( = ?auto_231840 ?auto_231846 ) ) ( not ( = ?auto_231840 ?auto_231847 ) ) ( not ( = ?auto_231841 ?auto_231842 ) ) ( not ( = ?auto_231841 ?auto_231843 ) ) ( not ( = ?auto_231841 ?auto_231844 ) ) ( not ( = ?auto_231841 ?auto_231845 ) ) ( not ( = ?auto_231841 ?auto_231846 ) ) ( not ( = ?auto_231841 ?auto_231847 ) ) ( not ( = ?auto_231842 ?auto_231843 ) ) ( not ( = ?auto_231842 ?auto_231844 ) ) ( not ( = ?auto_231842 ?auto_231845 ) ) ( not ( = ?auto_231842 ?auto_231846 ) ) ( not ( = ?auto_231842 ?auto_231847 ) ) ( not ( = ?auto_231843 ?auto_231844 ) ) ( not ( = ?auto_231843 ?auto_231845 ) ) ( not ( = ?auto_231843 ?auto_231846 ) ) ( not ( = ?auto_231843 ?auto_231847 ) ) ( not ( = ?auto_231844 ?auto_231845 ) ) ( not ( = ?auto_231844 ?auto_231846 ) ) ( not ( = ?auto_231844 ?auto_231847 ) ) ( not ( = ?auto_231845 ?auto_231846 ) ) ( not ( = ?auto_231845 ?auto_231847 ) ) ( not ( = ?auto_231846 ?auto_231847 ) ) ( ON ?auto_231845 ?auto_231846 ) ( ON ?auto_231844 ?auto_231845 ) ( ON ?auto_231843 ?auto_231844 ) ( ON ?auto_231842 ?auto_231843 ) ( ON ?auto_231841 ?auto_231842 ) ( ON ?auto_231840 ?auto_231841 ) ( ON ?auto_231839 ?auto_231840 ) ( CLEAR ?auto_231837 ) ( ON ?auto_231838 ?auto_231839 ) ( CLEAR ?auto_231838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_231836 ?auto_231837 ?auto_231838 )
      ( MAKE-11PILE ?auto_231836 ?auto_231837 ?auto_231838 ?auto_231839 ?auto_231840 ?auto_231841 ?auto_231842 ?auto_231843 ?auto_231844 ?auto_231845 ?auto_231846 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231859 - BLOCK
      ?auto_231860 - BLOCK
      ?auto_231861 - BLOCK
      ?auto_231862 - BLOCK
      ?auto_231863 - BLOCK
      ?auto_231864 - BLOCK
      ?auto_231865 - BLOCK
      ?auto_231866 - BLOCK
      ?auto_231867 - BLOCK
      ?auto_231868 - BLOCK
      ?auto_231869 - BLOCK
    )
    :vars
    (
      ?auto_231870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231869 ?auto_231870 ) ( ON-TABLE ?auto_231859 ) ( not ( = ?auto_231859 ?auto_231860 ) ) ( not ( = ?auto_231859 ?auto_231861 ) ) ( not ( = ?auto_231859 ?auto_231862 ) ) ( not ( = ?auto_231859 ?auto_231863 ) ) ( not ( = ?auto_231859 ?auto_231864 ) ) ( not ( = ?auto_231859 ?auto_231865 ) ) ( not ( = ?auto_231859 ?auto_231866 ) ) ( not ( = ?auto_231859 ?auto_231867 ) ) ( not ( = ?auto_231859 ?auto_231868 ) ) ( not ( = ?auto_231859 ?auto_231869 ) ) ( not ( = ?auto_231859 ?auto_231870 ) ) ( not ( = ?auto_231860 ?auto_231861 ) ) ( not ( = ?auto_231860 ?auto_231862 ) ) ( not ( = ?auto_231860 ?auto_231863 ) ) ( not ( = ?auto_231860 ?auto_231864 ) ) ( not ( = ?auto_231860 ?auto_231865 ) ) ( not ( = ?auto_231860 ?auto_231866 ) ) ( not ( = ?auto_231860 ?auto_231867 ) ) ( not ( = ?auto_231860 ?auto_231868 ) ) ( not ( = ?auto_231860 ?auto_231869 ) ) ( not ( = ?auto_231860 ?auto_231870 ) ) ( not ( = ?auto_231861 ?auto_231862 ) ) ( not ( = ?auto_231861 ?auto_231863 ) ) ( not ( = ?auto_231861 ?auto_231864 ) ) ( not ( = ?auto_231861 ?auto_231865 ) ) ( not ( = ?auto_231861 ?auto_231866 ) ) ( not ( = ?auto_231861 ?auto_231867 ) ) ( not ( = ?auto_231861 ?auto_231868 ) ) ( not ( = ?auto_231861 ?auto_231869 ) ) ( not ( = ?auto_231861 ?auto_231870 ) ) ( not ( = ?auto_231862 ?auto_231863 ) ) ( not ( = ?auto_231862 ?auto_231864 ) ) ( not ( = ?auto_231862 ?auto_231865 ) ) ( not ( = ?auto_231862 ?auto_231866 ) ) ( not ( = ?auto_231862 ?auto_231867 ) ) ( not ( = ?auto_231862 ?auto_231868 ) ) ( not ( = ?auto_231862 ?auto_231869 ) ) ( not ( = ?auto_231862 ?auto_231870 ) ) ( not ( = ?auto_231863 ?auto_231864 ) ) ( not ( = ?auto_231863 ?auto_231865 ) ) ( not ( = ?auto_231863 ?auto_231866 ) ) ( not ( = ?auto_231863 ?auto_231867 ) ) ( not ( = ?auto_231863 ?auto_231868 ) ) ( not ( = ?auto_231863 ?auto_231869 ) ) ( not ( = ?auto_231863 ?auto_231870 ) ) ( not ( = ?auto_231864 ?auto_231865 ) ) ( not ( = ?auto_231864 ?auto_231866 ) ) ( not ( = ?auto_231864 ?auto_231867 ) ) ( not ( = ?auto_231864 ?auto_231868 ) ) ( not ( = ?auto_231864 ?auto_231869 ) ) ( not ( = ?auto_231864 ?auto_231870 ) ) ( not ( = ?auto_231865 ?auto_231866 ) ) ( not ( = ?auto_231865 ?auto_231867 ) ) ( not ( = ?auto_231865 ?auto_231868 ) ) ( not ( = ?auto_231865 ?auto_231869 ) ) ( not ( = ?auto_231865 ?auto_231870 ) ) ( not ( = ?auto_231866 ?auto_231867 ) ) ( not ( = ?auto_231866 ?auto_231868 ) ) ( not ( = ?auto_231866 ?auto_231869 ) ) ( not ( = ?auto_231866 ?auto_231870 ) ) ( not ( = ?auto_231867 ?auto_231868 ) ) ( not ( = ?auto_231867 ?auto_231869 ) ) ( not ( = ?auto_231867 ?auto_231870 ) ) ( not ( = ?auto_231868 ?auto_231869 ) ) ( not ( = ?auto_231868 ?auto_231870 ) ) ( not ( = ?auto_231869 ?auto_231870 ) ) ( ON ?auto_231868 ?auto_231869 ) ( ON ?auto_231867 ?auto_231868 ) ( ON ?auto_231866 ?auto_231867 ) ( ON ?auto_231865 ?auto_231866 ) ( ON ?auto_231864 ?auto_231865 ) ( ON ?auto_231863 ?auto_231864 ) ( ON ?auto_231862 ?auto_231863 ) ( ON ?auto_231861 ?auto_231862 ) ( CLEAR ?auto_231859 ) ( ON ?auto_231860 ?auto_231861 ) ( CLEAR ?auto_231860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_231859 ?auto_231860 )
      ( MAKE-11PILE ?auto_231859 ?auto_231860 ?auto_231861 ?auto_231862 ?auto_231863 ?auto_231864 ?auto_231865 ?auto_231866 ?auto_231867 ?auto_231868 ?auto_231869 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231882 - BLOCK
      ?auto_231883 - BLOCK
      ?auto_231884 - BLOCK
      ?auto_231885 - BLOCK
      ?auto_231886 - BLOCK
      ?auto_231887 - BLOCK
      ?auto_231888 - BLOCK
      ?auto_231889 - BLOCK
      ?auto_231890 - BLOCK
      ?auto_231891 - BLOCK
      ?auto_231892 - BLOCK
    )
    :vars
    (
      ?auto_231893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231892 ?auto_231893 ) ( ON-TABLE ?auto_231882 ) ( not ( = ?auto_231882 ?auto_231883 ) ) ( not ( = ?auto_231882 ?auto_231884 ) ) ( not ( = ?auto_231882 ?auto_231885 ) ) ( not ( = ?auto_231882 ?auto_231886 ) ) ( not ( = ?auto_231882 ?auto_231887 ) ) ( not ( = ?auto_231882 ?auto_231888 ) ) ( not ( = ?auto_231882 ?auto_231889 ) ) ( not ( = ?auto_231882 ?auto_231890 ) ) ( not ( = ?auto_231882 ?auto_231891 ) ) ( not ( = ?auto_231882 ?auto_231892 ) ) ( not ( = ?auto_231882 ?auto_231893 ) ) ( not ( = ?auto_231883 ?auto_231884 ) ) ( not ( = ?auto_231883 ?auto_231885 ) ) ( not ( = ?auto_231883 ?auto_231886 ) ) ( not ( = ?auto_231883 ?auto_231887 ) ) ( not ( = ?auto_231883 ?auto_231888 ) ) ( not ( = ?auto_231883 ?auto_231889 ) ) ( not ( = ?auto_231883 ?auto_231890 ) ) ( not ( = ?auto_231883 ?auto_231891 ) ) ( not ( = ?auto_231883 ?auto_231892 ) ) ( not ( = ?auto_231883 ?auto_231893 ) ) ( not ( = ?auto_231884 ?auto_231885 ) ) ( not ( = ?auto_231884 ?auto_231886 ) ) ( not ( = ?auto_231884 ?auto_231887 ) ) ( not ( = ?auto_231884 ?auto_231888 ) ) ( not ( = ?auto_231884 ?auto_231889 ) ) ( not ( = ?auto_231884 ?auto_231890 ) ) ( not ( = ?auto_231884 ?auto_231891 ) ) ( not ( = ?auto_231884 ?auto_231892 ) ) ( not ( = ?auto_231884 ?auto_231893 ) ) ( not ( = ?auto_231885 ?auto_231886 ) ) ( not ( = ?auto_231885 ?auto_231887 ) ) ( not ( = ?auto_231885 ?auto_231888 ) ) ( not ( = ?auto_231885 ?auto_231889 ) ) ( not ( = ?auto_231885 ?auto_231890 ) ) ( not ( = ?auto_231885 ?auto_231891 ) ) ( not ( = ?auto_231885 ?auto_231892 ) ) ( not ( = ?auto_231885 ?auto_231893 ) ) ( not ( = ?auto_231886 ?auto_231887 ) ) ( not ( = ?auto_231886 ?auto_231888 ) ) ( not ( = ?auto_231886 ?auto_231889 ) ) ( not ( = ?auto_231886 ?auto_231890 ) ) ( not ( = ?auto_231886 ?auto_231891 ) ) ( not ( = ?auto_231886 ?auto_231892 ) ) ( not ( = ?auto_231886 ?auto_231893 ) ) ( not ( = ?auto_231887 ?auto_231888 ) ) ( not ( = ?auto_231887 ?auto_231889 ) ) ( not ( = ?auto_231887 ?auto_231890 ) ) ( not ( = ?auto_231887 ?auto_231891 ) ) ( not ( = ?auto_231887 ?auto_231892 ) ) ( not ( = ?auto_231887 ?auto_231893 ) ) ( not ( = ?auto_231888 ?auto_231889 ) ) ( not ( = ?auto_231888 ?auto_231890 ) ) ( not ( = ?auto_231888 ?auto_231891 ) ) ( not ( = ?auto_231888 ?auto_231892 ) ) ( not ( = ?auto_231888 ?auto_231893 ) ) ( not ( = ?auto_231889 ?auto_231890 ) ) ( not ( = ?auto_231889 ?auto_231891 ) ) ( not ( = ?auto_231889 ?auto_231892 ) ) ( not ( = ?auto_231889 ?auto_231893 ) ) ( not ( = ?auto_231890 ?auto_231891 ) ) ( not ( = ?auto_231890 ?auto_231892 ) ) ( not ( = ?auto_231890 ?auto_231893 ) ) ( not ( = ?auto_231891 ?auto_231892 ) ) ( not ( = ?auto_231891 ?auto_231893 ) ) ( not ( = ?auto_231892 ?auto_231893 ) ) ( ON ?auto_231891 ?auto_231892 ) ( ON ?auto_231890 ?auto_231891 ) ( ON ?auto_231889 ?auto_231890 ) ( ON ?auto_231888 ?auto_231889 ) ( ON ?auto_231887 ?auto_231888 ) ( ON ?auto_231886 ?auto_231887 ) ( ON ?auto_231885 ?auto_231886 ) ( ON ?auto_231884 ?auto_231885 ) ( CLEAR ?auto_231882 ) ( ON ?auto_231883 ?auto_231884 ) ( CLEAR ?auto_231883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_231882 ?auto_231883 )
      ( MAKE-11PILE ?auto_231882 ?auto_231883 ?auto_231884 ?auto_231885 ?auto_231886 ?auto_231887 ?auto_231888 ?auto_231889 ?auto_231890 ?auto_231891 ?auto_231892 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231905 - BLOCK
      ?auto_231906 - BLOCK
      ?auto_231907 - BLOCK
      ?auto_231908 - BLOCK
      ?auto_231909 - BLOCK
      ?auto_231910 - BLOCK
      ?auto_231911 - BLOCK
      ?auto_231912 - BLOCK
      ?auto_231913 - BLOCK
      ?auto_231914 - BLOCK
      ?auto_231915 - BLOCK
    )
    :vars
    (
      ?auto_231916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231915 ?auto_231916 ) ( not ( = ?auto_231905 ?auto_231906 ) ) ( not ( = ?auto_231905 ?auto_231907 ) ) ( not ( = ?auto_231905 ?auto_231908 ) ) ( not ( = ?auto_231905 ?auto_231909 ) ) ( not ( = ?auto_231905 ?auto_231910 ) ) ( not ( = ?auto_231905 ?auto_231911 ) ) ( not ( = ?auto_231905 ?auto_231912 ) ) ( not ( = ?auto_231905 ?auto_231913 ) ) ( not ( = ?auto_231905 ?auto_231914 ) ) ( not ( = ?auto_231905 ?auto_231915 ) ) ( not ( = ?auto_231905 ?auto_231916 ) ) ( not ( = ?auto_231906 ?auto_231907 ) ) ( not ( = ?auto_231906 ?auto_231908 ) ) ( not ( = ?auto_231906 ?auto_231909 ) ) ( not ( = ?auto_231906 ?auto_231910 ) ) ( not ( = ?auto_231906 ?auto_231911 ) ) ( not ( = ?auto_231906 ?auto_231912 ) ) ( not ( = ?auto_231906 ?auto_231913 ) ) ( not ( = ?auto_231906 ?auto_231914 ) ) ( not ( = ?auto_231906 ?auto_231915 ) ) ( not ( = ?auto_231906 ?auto_231916 ) ) ( not ( = ?auto_231907 ?auto_231908 ) ) ( not ( = ?auto_231907 ?auto_231909 ) ) ( not ( = ?auto_231907 ?auto_231910 ) ) ( not ( = ?auto_231907 ?auto_231911 ) ) ( not ( = ?auto_231907 ?auto_231912 ) ) ( not ( = ?auto_231907 ?auto_231913 ) ) ( not ( = ?auto_231907 ?auto_231914 ) ) ( not ( = ?auto_231907 ?auto_231915 ) ) ( not ( = ?auto_231907 ?auto_231916 ) ) ( not ( = ?auto_231908 ?auto_231909 ) ) ( not ( = ?auto_231908 ?auto_231910 ) ) ( not ( = ?auto_231908 ?auto_231911 ) ) ( not ( = ?auto_231908 ?auto_231912 ) ) ( not ( = ?auto_231908 ?auto_231913 ) ) ( not ( = ?auto_231908 ?auto_231914 ) ) ( not ( = ?auto_231908 ?auto_231915 ) ) ( not ( = ?auto_231908 ?auto_231916 ) ) ( not ( = ?auto_231909 ?auto_231910 ) ) ( not ( = ?auto_231909 ?auto_231911 ) ) ( not ( = ?auto_231909 ?auto_231912 ) ) ( not ( = ?auto_231909 ?auto_231913 ) ) ( not ( = ?auto_231909 ?auto_231914 ) ) ( not ( = ?auto_231909 ?auto_231915 ) ) ( not ( = ?auto_231909 ?auto_231916 ) ) ( not ( = ?auto_231910 ?auto_231911 ) ) ( not ( = ?auto_231910 ?auto_231912 ) ) ( not ( = ?auto_231910 ?auto_231913 ) ) ( not ( = ?auto_231910 ?auto_231914 ) ) ( not ( = ?auto_231910 ?auto_231915 ) ) ( not ( = ?auto_231910 ?auto_231916 ) ) ( not ( = ?auto_231911 ?auto_231912 ) ) ( not ( = ?auto_231911 ?auto_231913 ) ) ( not ( = ?auto_231911 ?auto_231914 ) ) ( not ( = ?auto_231911 ?auto_231915 ) ) ( not ( = ?auto_231911 ?auto_231916 ) ) ( not ( = ?auto_231912 ?auto_231913 ) ) ( not ( = ?auto_231912 ?auto_231914 ) ) ( not ( = ?auto_231912 ?auto_231915 ) ) ( not ( = ?auto_231912 ?auto_231916 ) ) ( not ( = ?auto_231913 ?auto_231914 ) ) ( not ( = ?auto_231913 ?auto_231915 ) ) ( not ( = ?auto_231913 ?auto_231916 ) ) ( not ( = ?auto_231914 ?auto_231915 ) ) ( not ( = ?auto_231914 ?auto_231916 ) ) ( not ( = ?auto_231915 ?auto_231916 ) ) ( ON ?auto_231914 ?auto_231915 ) ( ON ?auto_231913 ?auto_231914 ) ( ON ?auto_231912 ?auto_231913 ) ( ON ?auto_231911 ?auto_231912 ) ( ON ?auto_231910 ?auto_231911 ) ( ON ?auto_231909 ?auto_231910 ) ( ON ?auto_231908 ?auto_231909 ) ( ON ?auto_231907 ?auto_231908 ) ( ON ?auto_231906 ?auto_231907 ) ( ON ?auto_231905 ?auto_231906 ) ( CLEAR ?auto_231905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_231905 )
      ( MAKE-11PILE ?auto_231905 ?auto_231906 ?auto_231907 ?auto_231908 ?auto_231909 ?auto_231910 ?auto_231911 ?auto_231912 ?auto_231913 ?auto_231914 ?auto_231915 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_231928 - BLOCK
      ?auto_231929 - BLOCK
      ?auto_231930 - BLOCK
      ?auto_231931 - BLOCK
      ?auto_231932 - BLOCK
      ?auto_231933 - BLOCK
      ?auto_231934 - BLOCK
      ?auto_231935 - BLOCK
      ?auto_231936 - BLOCK
      ?auto_231937 - BLOCK
      ?auto_231938 - BLOCK
    )
    :vars
    (
      ?auto_231939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_231938 ?auto_231939 ) ( not ( = ?auto_231928 ?auto_231929 ) ) ( not ( = ?auto_231928 ?auto_231930 ) ) ( not ( = ?auto_231928 ?auto_231931 ) ) ( not ( = ?auto_231928 ?auto_231932 ) ) ( not ( = ?auto_231928 ?auto_231933 ) ) ( not ( = ?auto_231928 ?auto_231934 ) ) ( not ( = ?auto_231928 ?auto_231935 ) ) ( not ( = ?auto_231928 ?auto_231936 ) ) ( not ( = ?auto_231928 ?auto_231937 ) ) ( not ( = ?auto_231928 ?auto_231938 ) ) ( not ( = ?auto_231928 ?auto_231939 ) ) ( not ( = ?auto_231929 ?auto_231930 ) ) ( not ( = ?auto_231929 ?auto_231931 ) ) ( not ( = ?auto_231929 ?auto_231932 ) ) ( not ( = ?auto_231929 ?auto_231933 ) ) ( not ( = ?auto_231929 ?auto_231934 ) ) ( not ( = ?auto_231929 ?auto_231935 ) ) ( not ( = ?auto_231929 ?auto_231936 ) ) ( not ( = ?auto_231929 ?auto_231937 ) ) ( not ( = ?auto_231929 ?auto_231938 ) ) ( not ( = ?auto_231929 ?auto_231939 ) ) ( not ( = ?auto_231930 ?auto_231931 ) ) ( not ( = ?auto_231930 ?auto_231932 ) ) ( not ( = ?auto_231930 ?auto_231933 ) ) ( not ( = ?auto_231930 ?auto_231934 ) ) ( not ( = ?auto_231930 ?auto_231935 ) ) ( not ( = ?auto_231930 ?auto_231936 ) ) ( not ( = ?auto_231930 ?auto_231937 ) ) ( not ( = ?auto_231930 ?auto_231938 ) ) ( not ( = ?auto_231930 ?auto_231939 ) ) ( not ( = ?auto_231931 ?auto_231932 ) ) ( not ( = ?auto_231931 ?auto_231933 ) ) ( not ( = ?auto_231931 ?auto_231934 ) ) ( not ( = ?auto_231931 ?auto_231935 ) ) ( not ( = ?auto_231931 ?auto_231936 ) ) ( not ( = ?auto_231931 ?auto_231937 ) ) ( not ( = ?auto_231931 ?auto_231938 ) ) ( not ( = ?auto_231931 ?auto_231939 ) ) ( not ( = ?auto_231932 ?auto_231933 ) ) ( not ( = ?auto_231932 ?auto_231934 ) ) ( not ( = ?auto_231932 ?auto_231935 ) ) ( not ( = ?auto_231932 ?auto_231936 ) ) ( not ( = ?auto_231932 ?auto_231937 ) ) ( not ( = ?auto_231932 ?auto_231938 ) ) ( not ( = ?auto_231932 ?auto_231939 ) ) ( not ( = ?auto_231933 ?auto_231934 ) ) ( not ( = ?auto_231933 ?auto_231935 ) ) ( not ( = ?auto_231933 ?auto_231936 ) ) ( not ( = ?auto_231933 ?auto_231937 ) ) ( not ( = ?auto_231933 ?auto_231938 ) ) ( not ( = ?auto_231933 ?auto_231939 ) ) ( not ( = ?auto_231934 ?auto_231935 ) ) ( not ( = ?auto_231934 ?auto_231936 ) ) ( not ( = ?auto_231934 ?auto_231937 ) ) ( not ( = ?auto_231934 ?auto_231938 ) ) ( not ( = ?auto_231934 ?auto_231939 ) ) ( not ( = ?auto_231935 ?auto_231936 ) ) ( not ( = ?auto_231935 ?auto_231937 ) ) ( not ( = ?auto_231935 ?auto_231938 ) ) ( not ( = ?auto_231935 ?auto_231939 ) ) ( not ( = ?auto_231936 ?auto_231937 ) ) ( not ( = ?auto_231936 ?auto_231938 ) ) ( not ( = ?auto_231936 ?auto_231939 ) ) ( not ( = ?auto_231937 ?auto_231938 ) ) ( not ( = ?auto_231937 ?auto_231939 ) ) ( not ( = ?auto_231938 ?auto_231939 ) ) ( ON ?auto_231937 ?auto_231938 ) ( ON ?auto_231936 ?auto_231937 ) ( ON ?auto_231935 ?auto_231936 ) ( ON ?auto_231934 ?auto_231935 ) ( ON ?auto_231933 ?auto_231934 ) ( ON ?auto_231932 ?auto_231933 ) ( ON ?auto_231931 ?auto_231932 ) ( ON ?auto_231930 ?auto_231931 ) ( ON ?auto_231929 ?auto_231930 ) ( ON ?auto_231928 ?auto_231929 ) ( CLEAR ?auto_231928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_231928 )
      ( MAKE-11PILE ?auto_231928 ?auto_231929 ?auto_231930 ?auto_231931 ?auto_231932 ?auto_231933 ?auto_231934 ?auto_231935 ?auto_231936 ?auto_231937 ?auto_231938 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_231952 - BLOCK
      ?auto_231953 - BLOCK
      ?auto_231954 - BLOCK
      ?auto_231955 - BLOCK
      ?auto_231956 - BLOCK
      ?auto_231957 - BLOCK
      ?auto_231958 - BLOCK
      ?auto_231959 - BLOCK
      ?auto_231960 - BLOCK
      ?auto_231961 - BLOCK
      ?auto_231962 - BLOCK
      ?auto_231963 - BLOCK
    )
    :vars
    (
      ?auto_231964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_231962 ) ( ON ?auto_231963 ?auto_231964 ) ( CLEAR ?auto_231963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_231952 ) ( ON ?auto_231953 ?auto_231952 ) ( ON ?auto_231954 ?auto_231953 ) ( ON ?auto_231955 ?auto_231954 ) ( ON ?auto_231956 ?auto_231955 ) ( ON ?auto_231957 ?auto_231956 ) ( ON ?auto_231958 ?auto_231957 ) ( ON ?auto_231959 ?auto_231958 ) ( ON ?auto_231960 ?auto_231959 ) ( ON ?auto_231961 ?auto_231960 ) ( ON ?auto_231962 ?auto_231961 ) ( not ( = ?auto_231952 ?auto_231953 ) ) ( not ( = ?auto_231952 ?auto_231954 ) ) ( not ( = ?auto_231952 ?auto_231955 ) ) ( not ( = ?auto_231952 ?auto_231956 ) ) ( not ( = ?auto_231952 ?auto_231957 ) ) ( not ( = ?auto_231952 ?auto_231958 ) ) ( not ( = ?auto_231952 ?auto_231959 ) ) ( not ( = ?auto_231952 ?auto_231960 ) ) ( not ( = ?auto_231952 ?auto_231961 ) ) ( not ( = ?auto_231952 ?auto_231962 ) ) ( not ( = ?auto_231952 ?auto_231963 ) ) ( not ( = ?auto_231952 ?auto_231964 ) ) ( not ( = ?auto_231953 ?auto_231954 ) ) ( not ( = ?auto_231953 ?auto_231955 ) ) ( not ( = ?auto_231953 ?auto_231956 ) ) ( not ( = ?auto_231953 ?auto_231957 ) ) ( not ( = ?auto_231953 ?auto_231958 ) ) ( not ( = ?auto_231953 ?auto_231959 ) ) ( not ( = ?auto_231953 ?auto_231960 ) ) ( not ( = ?auto_231953 ?auto_231961 ) ) ( not ( = ?auto_231953 ?auto_231962 ) ) ( not ( = ?auto_231953 ?auto_231963 ) ) ( not ( = ?auto_231953 ?auto_231964 ) ) ( not ( = ?auto_231954 ?auto_231955 ) ) ( not ( = ?auto_231954 ?auto_231956 ) ) ( not ( = ?auto_231954 ?auto_231957 ) ) ( not ( = ?auto_231954 ?auto_231958 ) ) ( not ( = ?auto_231954 ?auto_231959 ) ) ( not ( = ?auto_231954 ?auto_231960 ) ) ( not ( = ?auto_231954 ?auto_231961 ) ) ( not ( = ?auto_231954 ?auto_231962 ) ) ( not ( = ?auto_231954 ?auto_231963 ) ) ( not ( = ?auto_231954 ?auto_231964 ) ) ( not ( = ?auto_231955 ?auto_231956 ) ) ( not ( = ?auto_231955 ?auto_231957 ) ) ( not ( = ?auto_231955 ?auto_231958 ) ) ( not ( = ?auto_231955 ?auto_231959 ) ) ( not ( = ?auto_231955 ?auto_231960 ) ) ( not ( = ?auto_231955 ?auto_231961 ) ) ( not ( = ?auto_231955 ?auto_231962 ) ) ( not ( = ?auto_231955 ?auto_231963 ) ) ( not ( = ?auto_231955 ?auto_231964 ) ) ( not ( = ?auto_231956 ?auto_231957 ) ) ( not ( = ?auto_231956 ?auto_231958 ) ) ( not ( = ?auto_231956 ?auto_231959 ) ) ( not ( = ?auto_231956 ?auto_231960 ) ) ( not ( = ?auto_231956 ?auto_231961 ) ) ( not ( = ?auto_231956 ?auto_231962 ) ) ( not ( = ?auto_231956 ?auto_231963 ) ) ( not ( = ?auto_231956 ?auto_231964 ) ) ( not ( = ?auto_231957 ?auto_231958 ) ) ( not ( = ?auto_231957 ?auto_231959 ) ) ( not ( = ?auto_231957 ?auto_231960 ) ) ( not ( = ?auto_231957 ?auto_231961 ) ) ( not ( = ?auto_231957 ?auto_231962 ) ) ( not ( = ?auto_231957 ?auto_231963 ) ) ( not ( = ?auto_231957 ?auto_231964 ) ) ( not ( = ?auto_231958 ?auto_231959 ) ) ( not ( = ?auto_231958 ?auto_231960 ) ) ( not ( = ?auto_231958 ?auto_231961 ) ) ( not ( = ?auto_231958 ?auto_231962 ) ) ( not ( = ?auto_231958 ?auto_231963 ) ) ( not ( = ?auto_231958 ?auto_231964 ) ) ( not ( = ?auto_231959 ?auto_231960 ) ) ( not ( = ?auto_231959 ?auto_231961 ) ) ( not ( = ?auto_231959 ?auto_231962 ) ) ( not ( = ?auto_231959 ?auto_231963 ) ) ( not ( = ?auto_231959 ?auto_231964 ) ) ( not ( = ?auto_231960 ?auto_231961 ) ) ( not ( = ?auto_231960 ?auto_231962 ) ) ( not ( = ?auto_231960 ?auto_231963 ) ) ( not ( = ?auto_231960 ?auto_231964 ) ) ( not ( = ?auto_231961 ?auto_231962 ) ) ( not ( = ?auto_231961 ?auto_231963 ) ) ( not ( = ?auto_231961 ?auto_231964 ) ) ( not ( = ?auto_231962 ?auto_231963 ) ) ( not ( = ?auto_231962 ?auto_231964 ) ) ( not ( = ?auto_231963 ?auto_231964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_231963 ?auto_231964 )
      ( !STACK ?auto_231963 ?auto_231962 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_231977 - BLOCK
      ?auto_231978 - BLOCK
      ?auto_231979 - BLOCK
      ?auto_231980 - BLOCK
      ?auto_231981 - BLOCK
      ?auto_231982 - BLOCK
      ?auto_231983 - BLOCK
      ?auto_231984 - BLOCK
      ?auto_231985 - BLOCK
      ?auto_231986 - BLOCK
      ?auto_231987 - BLOCK
      ?auto_231988 - BLOCK
    )
    :vars
    (
      ?auto_231989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_231987 ) ( ON ?auto_231988 ?auto_231989 ) ( CLEAR ?auto_231988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_231977 ) ( ON ?auto_231978 ?auto_231977 ) ( ON ?auto_231979 ?auto_231978 ) ( ON ?auto_231980 ?auto_231979 ) ( ON ?auto_231981 ?auto_231980 ) ( ON ?auto_231982 ?auto_231981 ) ( ON ?auto_231983 ?auto_231982 ) ( ON ?auto_231984 ?auto_231983 ) ( ON ?auto_231985 ?auto_231984 ) ( ON ?auto_231986 ?auto_231985 ) ( ON ?auto_231987 ?auto_231986 ) ( not ( = ?auto_231977 ?auto_231978 ) ) ( not ( = ?auto_231977 ?auto_231979 ) ) ( not ( = ?auto_231977 ?auto_231980 ) ) ( not ( = ?auto_231977 ?auto_231981 ) ) ( not ( = ?auto_231977 ?auto_231982 ) ) ( not ( = ?auto_231977 ?auto_231983 ) ) ( not ( = ?auto_231977 ?auto_231984 ) ) ( not ( = ?auto_231977 ?auto_231985 ) ) ( not ( = ?auto_231977 ?auto_231986 ) ) ( not ( = ?auto_231977 ?auto_231987 ) ) ( not ( = ?auto_231977 ?auto_231988 ) ) ( not ( = ?auto_231977 ?auto_231989 ) ) ( not ( = ?auto_231978 ?auto_231979 ) ) ( not ( = ?auto_231978 ?auto_231980 ) ) ( not ( = ?auto_231978 ?auto_231981 ) ) ( not ( = ?auto_231978 ?auto_231982 ) ) ( not ( = ?auto_231978 ?auto_231983 ) ) ( not ( = ?auto_231978 ?auto_231984 ) ) ( not ( = ?auto_231978 ?auto_231985 ) ) ( not ( = ?auto_231978 ?auto_231986 ) ) ( not ( = ?auto_231978 ?auto_231987 ) ) ( not ( = ?auto_231978 ?auto_231988 ) ) ( not ( = ?auto_231978 ?auto_231989 ) ) ( not ( = ?auto_231979 ?auto_231980 ) ) ( not ( = ?auto_231979 ?auto_231981 ) ) ( not ( = ?auto_231979 ?auto_231982 ) ) ( not ( = ?auto_231979 ?auto_231983 ) ) ( not ( = ?auto_231979 ?auto_231984 ) ) ( not ( = ?auto_231979 ?auto_231985 ) ) ( not ( = ?auto_231979 ?auto_231986 ) ) ( not ( = ?auto_231979 ?auto_231987 ) ) ( not ( = ?auto_231979 ?auto_231988 ) ) ( not ( = ?auto_231979 ?auto_231989 ) ) ( not ( = ?auto_231980 ?auto_231981 ) ) ( not ( = ?auto_231980 ?auto_231982 ) ) ( not ( = ?auto_231980 ?auto_231983 ) ) ( not ( = ?auto_231980 ?auto_231984 ) ) ( not ( = ?auto_231980 ?auto_231985 ) ) ( not ( = ?auto_231980 ?auto_231986 ) ) ( not ( = ?auto_231980 ?auto_231987 ) ) ( not ( = ?auto_231980 ?auto_231988 ) ) ( not ( = ?auto_231980 ?auto_231989 ) ) ( not ( = ?auto_231981 ?auto_231982 ) ) ( not ( = ?auto_231981 ?auto_231983 ) ) ( not ( = ?auto_231981 ?auto_231984 ) ) ( not ( = ?auto_231981 ?auto_231985 ) ) ( not ( = ?auto_231981 ?auto_231986 ) ) ( not ( = ?auto_231981 ?auto_231987 ) ) ( not ( = ?auto_231981 ?auto_231988 ) ) ( not ( = ?auto_231981 ?auto_231989 ) ) ( not ( = ?auto_231982 ?auto_231983 ) ) ( not ( = ?auto_231982 ?auto_231984 ) ) ( not ( = ?auto_231982 ?auto_231985 ) ) ( not ( = ?auto_231982 ?auto_231986 ) ) ( not ( = ?auto_231982 ?auto_231987 ) ) ( not ( = ?auto_231982 ?auto_231988 ) ) ( not ( = ?auto_231982 ?auto_231989 ) ) ( not ( = ?auto_231983 ?auto_231984 ) ) ( not ( = ?auto_231983 ?auto_231985 ) ) ( not ( = ?auto_231983 ?auto_231986 ) ) ( not ( = ?auto_231983 ?auto_231987 ) ) ( not ( = ?auto_231983 ?auto_231988 ) ) ( not ( = ?auto_231983 ?auto_231989 ) ) ( not ( = ?auto_231984 ?auto_231985 ) ) ( not ( = ?auto_231984 ?auto_231986 ) ) ( not ( = ?auto_231984 ?auto_231987 ) ) ( not ( = ?auto_231984 ?auto_231988 ) ) ( not ( = ?auto_231984 ?auto_231989 ) ) ( not ( = ?auto_231985 ?auto_231986 ) ) ( not ( = ?auto_231985 ?auto_231987 ) ) ( not ( = ?auto_231985 ?auto_231988 ) ) ( not ( = ?auto_231985 ?auto_231989 ) ) ( not ( = ?auto_231986 ?auto_231987 ) ) ( not ( = ?auto_231986 ?auto_231988 ) ) ( not ( = ?auto_231986 ?auto_231989 ) ) ( not ( = ?auto_231987 ?auto_231988 ) ) ( not ( = ?auto_231987 ?auto_231989 ) ) ( not ( = ?auto_231988 ?auto_231989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_231988 ?auto_231989 )
      ( !STACK ?auto_231988 ?auto_231987 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232002 - BLOCK
      ?auto_232003 - BLOCK
      ?auto_232004 - BLOCK
      ?auto_232005 - BLOCK
      ?auto_232006 - BLOCK
      ?auto_232007 - BLOCK
      ?auto_232008 - BLOCK
      ?auto_232009 - BLOCK
      ?auto_232010 - BLOCK
      ?auto_232011 - BLOCK
      ?auto_232012 - BLOCK
      ?auto_232013 - BLOCK
    )
    :vars
    (
      ?auto_232014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232013 ?auto_232014 ) ( ON-TABLE ?auto_232002 ) ( ON ?auto_232003 ?auto_232002 ) ( ON ?auto_232004 ?auto_232003 ) ( ON ?auto_232005 ?auto_232004 ) ( ON ?auto_232006 ?auto_232005 ) ( ON ?auto_232007 ?auto_232006 ) ( ON ?auto_232008 ?auto_232007 ) ( ON ?auto_232009 ?auto_232008 ) ( ON ?auto_232010 ?auto_232009 ) ( ON ?auto_232011 ?auto_232010 ) ( not ( = ?auto_232002 ?auto_232003 ) ) ( not ( = ?auto_232002 ?auto_232004 ) ) ( not ( = ?auto_232002 ?auto_232005 ) ) ( not ( = ?auto_232002 ?auto_232006 ) ) ( not ( = ?auto_232002 ?auto_232007 ) ) ( not ( = ?auto_232002 ?auto_232008 ) ) ( not ( = ?auto_232002 ?auto_232009 ) ) ( not ( = ?auto_232002 ?auto_232010 ) ) ( not ( = ?auto_232002 ?auto_232011 ) ) ( not ( = ?auto_232002 ?auto_232012 ) ) ( not ( = ?auto_232002 ?auto_232013 ) ) ( not ( = ?auto_232002 ?auto_232014 ) ) ( not ( = ?auto_232003 ?auto_232004 ) ) ( not ( = ?auto_232003 ?auto_232005 ) ) ( not ( = ?auto_232003 ?auto_232006 ) ) ( not ( = ?auto_232003 ?auto_232007 ) ) ( not ( = ?auto_232003 ?auto_232008 ) ) ( not ( = ?auto_232003 ?auto_232009 ) ) ( not ( = ?auto_232003 ?auto_232010 ) ) ( not ( = ?auto_232003 ?auto_232011 ) ) ( not ( = ?auto_232003 ?auto_232012 ) ) ( not ( = ?auto_232003 ?auto_232013 ) ) ( not ( = ?auto_232003 ?auto_232014 ) ) ( not ( = ?auto_232004 ?auto_232005 ) ) ( not ( = ?auto_232004 ?auto_232006 ) ) ( not ( = ?auto_232004 ?auto_232007 ) ) ( not ( = ?auto_232004 ?auto_232008 ) ) ( not ( = ?auto_232004 ?auto_232009 ) ) ( not ( = ?auto_232004 ?auto_232010 ) ) ( not ( = ?auto_232004 ?auto_232011 ) ) ( not ( = ?auto_232004 ?auto_232012 ) ) ( not ( = ?auto_232004 ?auto_232013 ) ) ( not ( = ?auto_232004 ?auto_232014 ) ) ( not ( = ?auto_232005 ?auto_232006 ) ) ( not ( = ?auto_232005 ?auto_232007 ) ) ( not ( = ?auto_232005 ?auto_232008 ) ) ( not ( = ?auto_232005 ?auto_232009 ) ) ( not ( = ?auto_232005 ?auto_232010 ) ) ( not ( = ?auto_232005 ?auto_232011 ) ) ( not ( = ?auto_232005 ?auto_232012 ) ) ( not ( = ?auto_232005 ?auto_232013 ) ) ( not ( = ?auto_232005 ?auto_232014 ) ) ( not ( = ?auto_232006 ?auto_232007 ) ) ( not ( = ?auto_232006 ?auto_232008 ) ) ( not ( = ?auto_232006 ?auto_232009 ) ) ( not ( = ?auto_232006 ?auto_232010 ) ) ( not ( = ?auto_232006 ?auto_232011 ) ) ( not ( = ?auto_232006 ?auto_232012 ) ) ( not ( = ?auto_232006 ?auto_232013 ) ) ( not ( = ?auto_232006 ?auto_232014 ) ) ( not ( = ?auto_232007 ?auto_232008 ) ) ( not ( = ?auto_232007 ?auto_232009 ) ) ( not ( = ?auto_232007 ?auto_232010 ) ) ( not ( = ?auto_232007 ?auto_232011 ) ) ( not ( = ?auto_232007 ?auto_232012 ) ) ( not ( = ?auto_232007 ?auto_232013 ) ) ( not ( = ?auto_232007 ?auto_232014 ) ) ( not ( = ?auto_232008 ?auto_232009 ) ) ( not ( = ?auto_232008 ?auto_232010 ) ) ( not ( = ?auto_232008 ?auto_232011 ) ) ( not ( = ?auto_232008 ?auto_232012 ) ) ( not ( = ?auto_232008 ?auto_232013 ) ) ( not ( = ?auto_232008 ?auto_232014 ) ) ( not ( = ?auto_232009 ?auto_232010 ) ) ( not ( = ?auto_232009 ?auto_232011 ) ) ( not ( = ?auto_232009 ?auto_232012 ) ) ( not ( = ?auto_232009 ?auto_232013 ) ) ( not ( = ?auto_232009 ?auto_232014 ) ) ( not ( = ?auto_232010 ?auto_232011 ) ) ( not ( = ?auto_232010 ?auto_232012 ) ) ( not ( = ?auto_232010 ?auto_232013 ) ) ( not ( = ?auto_232010 ?auto_232014 ) ) ( not ( = ?auto_232011 ?auto_232012 ) ) ( not ( = ?auto_232011 ?auto_232013 ) ) ( not ( = ?auto_232011 ?auto_232014 ) ) ( not ( = ?auto_232012 ?auto_232013 ) ) ( not ( = ?auto_232012 ?auto_232014 ) ) ( not ( = ?auto_232013 ?auto_232014 ) ) ( CLEAR ?auto_232011 ) ( ON ?auto_232012 ?auto_232013 ) ( CLEAR ?auto_232012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_232002 ?auto_232003 ?auto_232004 ?auto_232005 ?auto_232006 ?auto_232007 ?auto_232008 ?auto_232009 ?auto_232010 ?auto_232011 ?auto_232012 )
      ( MAKE-12PILE ?auto_232002 ?auto_232003 ?auto_232004 ?auto_232005 ?auto_232006 ?auto_232007 ?auto_232008 ?auto_232009 ?auto_232010 ?auto_232011 ?auto_232012 ?auto_232013 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232027 - BLOCK
      ?auto_232028 - BLOCK
      ?auto_232029 - BLOCK
      ?auto_232030 - BLOCK
      ?auto_232031 - BLOCK
      ?auto_232032 - BLOCK
      ?auto_232033 - BLOCK
      ?auto_232034 - BLOCK
      ?auto_232035 - BLOCK
      ?auto_232036 - BLOCK
      ?auto_232037 - BLOCK
      ?auto_232038 - BLOCK
    )
    :vars
    (
      ?auto_232039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232038 ?auto_232039 ) ( ON-TABLE ?auto_232027 ) ( ON ?auto_232028 ?auto_232027 ) ( ON ?auto_232029 ?auto_232028 ) ( ON ?auto_232030 ?auto_232029 ) ( ON ?auto_232031 ?auto_232030 ) ( ON ?auto_232032 ?auto_232031 ) ( ON ?auto_232033 ?auto_232032 ) ( ON ?auto_232034 ?auto_232033 ) ( ON ?auto_232035 ?auto_232034 ) ( ON ?auto_232036 ?auto_232035 ) ( not ( = ?auto_232027 ?auto_232028 ) ) ( not ( = ?auto_232027 ?auto_232029 ) ) ( not ( = ?auto_232027 ?auto_232030 ) ) ( not ( = ?auto_232027 ?auto_232031 ) ) ( not ( = ?auto_232027 ?auto_232032 ) ) ( not ( = ?auto_232027 ?auto_232033 ) ) ( not ( = ?auto_232027 ?auto_232034 ) ) ( not ( = ?auto_232027 ?auto_232035 ) ) ( not ( = ?auto_232027 ?auto_232036 ) ) ( not ( = ?auto_232027 ?auto_232037 ) ) ( not ( = ?auto_232027 ?auto_232038 ) ) ( not ( = ?auto_232027 ?auto_232039 ) ) ( not ( = ?auto_232028 ?auto_232029 ) ) ( not ( = ?auto_232028 ?auto_232030 ) ) ( not ( = ?auto_232028 ?auto_232031 ) ) ( not ( = ?auto_232028 ?auto_232032 ) ) ( not ( = ?auto_232028 ?auto_232033 ) ) ( not ( = ?auto_232028 ?auto_232034 ) ) ( not ( = ?auto_232028 ?auto_232035 ) ) ( not ( = ?auto_232028 ?auto_232036 ) ) ( not ( = ?auto_232028 ?auto_232037 ) ) ( not ( = ?auto_232028 ?auto_232038 ) ) ( not ( = ?auto_232028 ?auto_232039 ) ) ( not ( = ?auto_232029 ?auto_232030 ) ) ( not ( = ?auto_232029 ?auto_232031 ) ) ( not ( = ?auto_232029 ?auto_232032 ) ) ( not ( = ?auto_232029 ?auto_232033 ) ) ( not ( = ?auto_232029 ?auto_232034 ) ) ( not ( = ?auto_232029 ?auto_232035 ) ) ( not ( = ?auto_232029 ?auto_232036 ) ) ( not ( = ?auto_232029 ?auto_232037 ) ) ( not ( = ?auto_232029 ?auto_232038 ) ) ( not ( = ?auto_232029 ?auto_232039 ) ) ( not ( = ?auto_232030 ?auto_232031 ) ) ( not ( = ?auto_232030 ?auto_232032 ) ) ( not ( = ?auto_232030 ?auto_232033 ) ) ( not ( = ?auto_232030 ?auto_232034 ) ) ( not ( = ?auto_232030 ?auto_232035 ) ) ( not ( = ?auto_232030 ?auto_232036 ) ) ( not ( = ?auto_232030 ?auto_232037 ) ) ( not ( = ?auto_232030 ?auto_232038 ) ) ( not ( = ?auto_232030 ?auto_232039 ) ) ( not ( = ?auto_232031 ?auto_232032 ) ) ( not ( = ?auto_232031 ?auto_232033 ) ) ( not ( = ?auto_232031 ?auto_232034 ) ) ( not ( = ?auto_232031 ?auto_232035 ) ) ( not ( = ?auto_232031 ?auto_232036 ) ) ( not ( = ?auto_232031 ?auto_232037 ) ) ( not ( = ?auto_232031 ?auto_232038 ) ) ( not ( = ?auto_232031 ?auto_232039 ) ) ( not ( = ?auto_232032 ?auto_232033 ) ) ( not ( = ?auto_232032 ?auto_232034 ) ) ( not ( = ?auto_232032 ?auto_232035 ) ) ( not ( = ?auto_232032 ?auto_232036 ) ) ( not ( = ?auto_232032 ?auto_232037 ) ) ( not ( = ?auto_232032 ?auto_232038 ) ) ( not ( = ?auto_232032 ?auto_232039 ) ) ( not ( = ?auto_232033 ?auto_232034 ) ) ( not ( = ?auto_232033 ?auto_232035 ) ) ( not ( = ?auto_232033 ?auto_232036 ) ) ( not ( = ?auto_232033 ?auto_232037 ) ) ( not ( = ?auto_232033 ?auto_232038 ) ) ( not ( = ?auto_232033 ?auto_232039 ) ) ( not ( = ?auto_232034 ?auto_232035 ) ) ( not ( = ?auto_232034 ?auto_232036 ) ) ( not ( = ?auto_232034 ?auto_232037 ) ) ( not ( = ?auto_232034 ?auto_232038 ) ) ( not ( = ?auto_232034 ?auto_232039 ) ) ( not ( = ?auto_232035 ?auto_232036 ) ) ( not ( = ?auto_232035 ?auto_232037 ) ) ( not ( = ?auto_232035 ?auto_232038 ) ) ( not ( = ?auto_232035 ?auto_232039 ) ) ( not ( = ?auto_232036 ?auto_232037 ) ) ( not ( = ?auto_232036 ?auto_232038 ) ) ( not ( = ?auto_232036 ?auto_232039 ) ) ( not ( = ?auto_232037 ?auto_232038 ) ) ( not ( = ?auto_232037 ?auto_232039 ) ) ( not ( = ?auto_232038 ?auto_232039 ) ) ( CLEAR ?auto_232036 ) ( ON ?auto_232037 ?auto_232038 ) ( CLEAR ?auto_232037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_232027 ?auto_232028 ?auto_232029 ?auto_232030 ?auto_232031 ?auto_232032 ?auto_232033 ?auto_232034 ?auto_232035 ?auto_232036 ?auto_232037 )
      ( MAKE-12PILE ?auto_232027 ?auto_232028 ?auto_232029 ?auto_232030 ?auto_232031 ?auto_232032 ?auto_232033 ?auto_232034 ?auto_232035 ?auto_232036 ?auto_232037 ?auto_232038 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232052 - BLOCK
      ?auto_232053 - BLOCK
      ?auto_232054 - BLOCK
      ?auto_232055 - BLOCK
      ?auto_232056 - BLOCK
      ?auto_232057 - BLOCK
      ?auto_232058 - BLOCK
      ?auto_232059 - BLOCK
      ?auto_232060 - BLOCK
      ?auto_232061 - BLOCK
      ?auto_232062 - BLOCK
      ?auto_232063 - BLOCK
    )
    :vars
    (
      ?auto_232064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232063 ?auto_232064 ) ( ON-TABLE ?auto_232052 ) ( ON ?auto_232053 ?auto_232052 ) ( ON ?auto_232054 ?auto_232053 ) ( ON ?auto_232055 ?auto_232054 ) ( ON ?auto_232056 ?auto_232055 ) ( ON ?auto_232057 ?auto_232056 ) ( ON ?auto_232058 ?auto_232057 ) ( ON ?auto_232059 ?auto_232058 ) ( ON ?auto_232060 ?auto_232059 ) ( not ( = ?auto_232052 ?auto_232053 ) ) ( not ( = ?auto_232052 ?auto_232054 ) ) ( not ( = ?auto_232052 ?auto_232055 ) ) ( not ( = ?auto_232052 ?auto_232056 ) ) ( not ( = ?auto_232052 ?auto_232057 ) ) ( not ( = ?auto_232052 ?auto_232058 ) ) ( not ( = ?auto_232052 ?auto_232059 ) ) ( not ( = ?auto_232052 ?auto_232060 ) ) ( not ( = ?auto_232052 ?auto_232061 ) ) ( not ( = ?auto_232052 ?auto_232062 ) ) ( not ( = ?auto_232052 ?auto_232063 ) ) ( not ( = ?auto_232052 ?auto_232064 ) ) ( not ( = ?auto_232053 ?auto_232054 ) ) ( not ( = ?auto_232053 ?auto_232055 ) ) ( not ( = ?auto_232053 ?auto_232056 ) ) ( not ( = ?auto_232053 ?auto_232057 ) ) ( not ( = ?auto_232053 ?auto_232058 ) ) ( not ( = ?auto_232053 ?auto_232059 ) ) ( not ( = ?auto_232053 ?auto_232060 ) ) ( not ( = ?auto_232053 ?auto_232061 ) ) ( not ( = ?auto_232053 ?auto_232062 ) ) ( not ( = ?auto_232053 ?auto_232063 ) ) ( not ( = ?auto_232053 ?auto_232064 ) ) ( not ( = ?auto_232054 ?auto_232055 ) ) ( not ( = ?auto_232054 ?auto_232056 ) ) ( not ( = ?auto_232054 ?auto_232057 ) ) ( not ( = ?auto_232054 ?auto_232058 ) ) ( not ( = ?auto_232054 ?auto_232059 ) ) ( not ( = ?auto_232054 ?auto_232060 ) ) ( not ( = ?auto_232054 ?auto_232061 ) ) ( not ( = ?auto_232054 ?auto_232062 ) ) ( not ( = ?auto_232054 ?auto_232063 ) ) ( not ( = ?auto_232054 ?auto_232064 ) ) ( not ( = ?auto_232055 ?auto_232056 ) ) ( not ( = ?auto_232055 ?auto_232057 ) ) ( not ( = ?auto_232055 ?auto_232058 ) ) ( not ( = ?auto_232055 ?auto_232059 ) ) ( not ( = ?auto_232055 ?auto_232060 ) ) ( not ( = ?auto_232055 ?auto_232061 ) ) ( not ( = ?auto_232055 ?auto_232062 ) ) ( not ( = ?auto_232055 ?auto_232063 ) ) ( not ( = ?auto_232055 ?auto_232064 ) ) ( not ( = ?auto_232056 ?auto_232057 ) ) ( not ( = ?auto_232056 ?auto_232058 ) ) ( not ( = ?auto_232056 ?auto_232059 ) ) ( not ( = ?auto_232056 ?auto_232060 ) ) ( not ( = ?auto_232056 ?auto_232061 ) ) ( not ( = ?auto_232056 ?auto_232062 ) ) ( not ( = ?auto_232056 ?auto_232063 ) ) ( not ( = ?auto_232056 ?auto_232064 ) ) ( not ( = ?auto_232057 ?auto_232058 ) ) ( not ( = ?auto_232057 ?auto_232059 ) ) ( not ( = ?auto_232057 ?auto_232060 ) ) ( not ( = ?auto_232057 ?auto_232061 ) ) ( not ( = ?auto_232057 ?auto_232062 ) ) ( not ( = ?auto_232057 ?auto_232063 ) ) ( not ( = ?auto_232057 ?auto_232064 ) ) ( not ( = ?auto_232058 ?auto_232059 ) ) ( not ( = ?auto_232058 ?auto_232060 ) ) ( not ( = ?auto_232058 ?auto_232061 ) ) ( not ( = ?auto_232058 ?auto_232062 ) ) ( not ( = ?auto_232058 ?auto_232063 ) ) ( not ( = ?auto_232058 ?auto_232064 ) ) ( not ( = ?auto_232059 ?auto_232060 ) ) ( not ( = ?auto_232059 ?auto_232061 ) ) ( not ( = ?auto_232059 ?auto_232062 ) ) ( not ( = ?auto_232059 ?auto_232063 ) ) ( not ( = ?auto_232059 ?auto_232064 ) ) ( not ( = ?auto_232060 ?auto_232061 ) ) ( not ( = ?auto_232060 ?auto_232062 ) ) ( not ( = ?auto_232060 ?auto_232063 ) ) ( not ( = ?auto_232060 ?auto_232064 ) ) ( not ( = ?auto_232061 ?auto_232062 ) ) ( not ( = ?auto_232061 ?auto_232063 ) ) ( not ( = ?auto_232061 ?auto_232064 ) ) ( not ( = ?auto_232062 ?auto_232063 ) ) ( not ( = ?auto_232062 ?auto_232064 ) ) ( not ( = ?auto_232063 ?auto_232064 ) ) ( ON ?auto_232062 ?auto_232063 ) ( CLEAR ?auto_232060 ) ( ON ?auto_232061 ?auto_232062 ) ( CLEAR ?auto_232061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_232052 ?auto_232053 ?auto_232054 ?auto_232055 ?auto_232056 ?auto_232057 ?auto_232058 ?auto_232059 ?auto_232060 ?auto_232061 )
      ( MAKE-12PILE ?auto_232052 ?auto_232053 ?auto_232054 ?auto_232055 ?auto_232056 ?auto_232057 ?auto_232058 ?auto_232059 ?auto_232060 ?auto_232061 ?auto_232062 ?auto_232063 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232077 - BLOCK
      ?auto_232078 - BLOCK
      ?auto_232079 - BLOCK
      ?auto_232080 - BLOCK
      ?auto_232081 - BLOCK
      ?auto_232082 - BLOCK
      ?auto_232083 - BLOCK
      ?auto_232084 - BLOCK
      ?auto_232085 - BLOCK
      ?auto_232086 - BLOCK
      ?auto_232087 - BLOCK
      ?auto_232088 - BLOCK
    )
    :vars
    (
      ?auto_232089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232088 ?auto_232089 ) ( ON-TABLE ?auto_232077 ) ( ON ?auto_232078 ?auto_232077 ) ( ON ?auto_232079 ?auto_232078 ) ( ON ?auto_232080 ?auto_232079 ) ( ON ?auto_232081 ?auto_232080 ) ( ON ?auto_232082 ?auto_232081 ) ( ON ?auto_232083 ?auto_232082 ) ( ON ?auto_232084 ?auto_232083 ) ( ON ?auto_232085 ?auto_232084 ) ( not ( = ?auto_232077 ?auto_232078 ) ) ( not ( = ?auto_232077 ?auto_232079 ) ) ( not ( = ?auto_232077 ?auto_232080 ) ) ( not ( = ?auto_232077 ?auto_232081 ) ) ( not ( = ?auto_232077 ?auto_232082 ) ) ( not ( = ?auto_232077 ?auto_232083 ) ) ( not ( = ?auto_232077 ?auto_232084 ) ) ( not ( = ?auto_232077 ?auto_232085 ) ) ( not ( = ?auto_232077 ?auto_232086 ) ) ( not ( = ?auto_232077 ?auto_232087 ) ) ( not ( = ?auto_232077 ?auto_232088 ) ) ( not ( = ?auto_232077 ?auto_232089 ) ) ( not ( = ?auto_232078 ?auto_232079 ) ) ( not ( = ?auto_232078 ?auto_232080 ) ) ( not ( = ?auto_232078 ?auto_232081 ) ) ( not ( = ?auto_232078 ?auto_232082 ) ) ( not ( = ?auto_232078 ?auto_232083 ) ) ( not ( = ?auto_232078 ?auto_232084 ) ) ( not ( = ?auto_232078 ?auto_232085 ) ) ( not ( = ?auto_232078 ?auto_232086 ) ) ( not ( = ?auto_232078 ?auto_232087 ) ) ( not ( = ?auto_232078 ?auto_232088 ) ) ( not ( = ?auto_232078 ?auto_232089 ) ) ( not ( = ?auto_232079 ?auto_232080 ) ) ( not ( = ?auto_232079 ?auto_232081 ) ) ( not ( = ?auto_232079 ?auto_232082 ) ) ( not ( = ?auto_232079 ?auto_232083 ) ) ( not ( = ?auto_232079 ?auto_232084 ) ) ( not ( = ?auto_232079 ?auto_232085 ) ) ( not ( = ?auto_232079 ?auto_232086 ) ) ( not ( = ?auto_232079 ?auto_232087 ) ) ( not ( = ?auto_232079 ?auto_232088 ) ) ( not ( = ?auto_232079 ?auto_232089 ) ) ( not ( = ?auto_232080 ?auto_232081 ) ) ( not ( = ?auto_232080 ?auto_232082 ) ) ( not ( = ?auto_232080 ?auto_232083 ) ) ( not ( = ?auto_232080 ?auto_232084 ) ) ( not ( = ?auto_232080 ?auto_232085 ) ) ( not ( = ?auto_232080 ?auto_232086 ) ) ( not ( = ?auto_232080 ?auto_232087 ) ) ( not ( = ?auto_232080 ?auto_232088 ) ) ( not ( = ?auto_232080 ?auto_232089 ) ) ( not ( = ?auto_232081 ?auto_232082 ) ) ( not ( = ?auto_232081 ?auto_232083 ) ) ( not ( = ?auto_232081 ?auto_232084 ) ) ( not ( = ?auto_232081 ?auto_232085 ) ) ( not ( = ?auto_232081 ?auto_232086 ) ) ( not ( = ?auto_232081 ?auto_232087 ) ) ( not ( = ?auto_232081 ?auto_232088 ) ) ( not ( = ?auto_232081 ?auto_232089 ) ) ( not ( = ?auto_232082 ?auto_232083 ) ) ( not ( = ?auto_232082 ?auto_232084 ) ) ( not ( = ?auto_232082 ?auto_232085 ) ) ( not ( = ?auto_232082 ?auto_232086 ) ) ( not ( = ?auto_232082 ?auto_232087 ) ) ( not ( = ?auto_232082 ?auto_232088 ) ) ( not ( = ?auto_232082 ?auto_232089 ) ) ( not ( = ?auto_232083 ?auto_232084 ) ) ( not ( = ?auto_232083 ?auto_232085 ) ) ( not ( = ?auto_232083 ?auto_232086 ) ) ( not ( = ?auto_232083 ?auto_232087 ) ) ( not ( = ?auto_232083 ?auto_232088 ) ) ( not ( = ?auto_232083 ?auto_232089 ) ) ( not ( = ?auto_232084 ?auto_232085 ) ) ( not ( = ?auto_232084 ?auto_232086 ) ) ( not ( = ?auto_232084 ?auto_232087 ) ) ( not ( = ?auto_232084 ?auto_232088 ) ) ( not ( = ?auto_232084 ?auto_232089 ) ) ( not ( = ?auto_232085 ?auto_232086 ) ) ( not ( = ?auto_232085 ?auto_232087 ) ) ( not ( = ?auto_232085 ?auto_232088 ) ) ( not ( = ?auto_232085 ?auto_232089 ) ) ( not ( = ?auto_232086 ?auto_232087 ) ) ( not ( = ?auto_232086 ?auto_232088 ) ) ( not ( = ?auto_232086 ?auto_232089 ) ) ( not ( = ?auto_232087 ?auto_232088 ) ) ( not ( = ?auto_232087 ?auto_232089 ) ) ( not ( = ?auto_232088 ?auto_232089 ) ) ( ON ?auto_232087 ?auto_232088 ) ( CLEAR ?auto_232085 ) ( ON ?auto_232086 ?auto_232087 ) ( CLEAR ?auto_232086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_232077 ?auto_232078 ?auto_232079 ?auto_232080 ?auto_232081 ?auto_232082 ?auto_232083 ?auto_232084 ?auto_232085 ?auto_232086 )
      ( MAKE-12PILE ?auto_232077 ?auto_232078 ?auto_232079 ?auto_232080 ?auto_232081 ?auto_232082 ?auto_232083 ?auto_232084 ?auto_232085 ?auto_232086 ?auto_232087 ?auto_232088 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232102 - BLOCK
      ?auto_232103 - BLOCK
      ?auto_232104 - BLOCK
      ?auto_232105 - BLOCK
      ?auto_232106 - BLOCK
      ?auto_232107 - BLOCK
      ?auto_232108 - BLOCK
      ?auto_232109 - BLOCK
      ?auto_232110 - BLOCK
      ?auto_232111 - BLOCK
      ?auto_232112 - BLOCK
      ?auto_232113 - BLOCK
    )
    :vars
    (
      ?auto_232114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232113 ?auto_232114 ) ( ON-TABLE ?auto_232102 ) ( ON ?auto_232103 ?auto_232102 ) ( ON ?auto_232104 ?auto_232103 ) ( ON ?auto_232105 ?auto_232104 ) ( ON ?auto_232106 ?auto_232105 ) ( ON ?auto_232107 ?auto_232106 ) ( ON ?auto_232108 ?auto_232107 ) ( ON ?auto_232109 ?auto_232108 ) ( not ( = ?auto_232102 ?auto_232103 ) ) ( not ( = ?auto_232102 ?auto_232104 ) ) ( not ( = ?auto_232102 ?auto_232105 ) ) ( not ( = ?auto_232102 ?auto_232106 ) ) ( not ( = ?auto_232102 ?auto_232107 ) ) ( not ( = ?auto_232102 ?auto_232108 ) ) ( not ( = ?auto_232102 ?auto_232109 ) ) ( not ( = ?auto_232102 ?auto_232110 ) ) ( not ( = ?auto_232102 ?auto_232111 ) ) ( not ( = ?auto_232102 ?auto_232112 ) ) ( not ( = ?auto_232102 ?auto_232113 ) ) ( not ( = ?auto_232102 ?auto_232114 ) ) ( not ( = ?auto_232103 ?auto_232104 ) ) ( not ( = ?auto_232103 ?auto_232105 ) ) ( not ( = ?auto_232103 ?auto_232106 ) ) ( not ( = ?auto_232103 ?auto_232107 ) ) ( not ( = ?auto_232103 ?auto_232108 ) ) ( not ( = ?auto_232103 ?auto_232109 ) ) ( not ( = ?auto_232103 ?auto_232110 ) ) ( not ( = ?auto_232103 ?auto_232111 ) ) ( not ( = ?auto_232103 ?auto_232112 ) ) ( not ( = ?auto_232103 ?auto_232113 ) ) ( not ( = ?auto_232103 ?auto_232114 ) ) ( not ( = ?auto_232104 ?auto_232105 ) ) ( not ( = ?auto_232104 ?auto_232106 ) ) ( not ( = ?auto_232104 ?auto_232107 ) ) ( not ( = ?auto_232104 ?auto_232108 ) ) ( not ( = ?auto_232104 ?auto_232109 ) ) ( not ( = ?auto_232104 ?auto_232110 ) ) ( not ( = ?auto_232104 ?auto_232111 ) ) ( not ( = ?auto_232104 ?auto_232112 ) ) ( not ( = ?auto_232104 ?auto_232113 ) ) ( not ( = ?auto_232104 ?auto_232114 ) ) ( not ( = ?auto_232105 ?auto_232106 ) ) ( not ( = ?auto_232105 ?auto_232107 ) ) ( not ( = ?auto_232105 ?auto_232108 ) ) ( not ( = ?auto_232105 ?auto_232109 ) ) ( not ( = ?auto_232105 ?auto_232110 ) ) ( not ( = ?auto_232105 ?auto_232111 ) ) ( not ( = ?auto_232105 ?auto_232112 ) ) ( not ( = ?auto_232105 ?auto_232113 ) ) ( not ( = ?auto_232105 ?auto_232114 ) ) ( not ( = ?auto_232106 ?auto_232107 ) ) ( not ( = ?auto_232106 ?auto_232108 ) ) ( not ( = ?auto_232106 ?auto_232109 ) ) ( not ( = ?auto_232106 ?auto_232110 ) ) ( not ( = ?auto_232106 ?auto_232111 ) ) ( not ( = ?auto_232106 ?auto_232112 ) ) ( not ( = ?auto_232106 ?auto_232113 ) ) ( not ( = ?auto_232106 ?auto_232114 ) ) ( not ( = ?auto_232107 ?auto_232108 ) ) ( not ( = ?auto_232107 ?auto_232109 ) ) ( not ( = ?auto_232107 ?auto_232110 ) ) ( not ( = ?auto_232107 ?auto_232111 ) ) ( not ( = ?auto_232107 ?auto_232112 ) ) ( not ( = ?auto_232107 ?auto_232113 ) ) ( not ( = ?auto_232107 ?auto_232114 ) ) ( not ( = ?auto_232108 ?auto_232109 ) ) ( not ( = ?auto_232108 ?auto_232110 ) ) ( not ( = ?auto_232108 ?auto_232111 ) ) ( not ( = ?auto_232108 ?auto_232112 ) ) ( not ( = ?auto_232108 ?auto_232113 ) ) ( not ( = ?auto_232108 ?auto_232114 ) ) ( not ( = ?auto_232109 ?auto_232110 ) ) ( not ( = ?auto_232109 ?auto_232111 ) ) ( not ( = ?auto_232109 ?auto_232112 ) ) ( not ( = ?auto_232109 ?auto_232113 ) ) ( not ( = ?auto_232109 ?auto_232114 ) ) ( not ( = ?auto_232110 ?auto_232111 ) ) ( not ( = ?auto_232110 ?auto_232112 ) ) ( not ( = ?auto_232110 ?auto_232113 ) ) ( not ( = ?auto_232110 ?auto_232114 ) ) ( not ( = ?auto_232111 ?auto_232112 ) ) ( not ( = ?auto_232111 ?auto_232113 ) ) ( not ( = ?auto_232111 ?auto_232114 ) ) ( not ( = ?auto_232112 ?auto_232113 ) ) ( not ( = ?auto_232112 ?auto_232114 ) ) ( not ( = ?auto_232113 ?auto_232114 ) ) ( ON ?auto_232112 ?auto_232113 ) ( ON ?auto_232111 ?auto_232112 ) ( CLEAR ?auto_232109 ) ( ON ?auto_232110 ?auto_232111 ) ( CLEAR ?auto_232110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_232102 ?auto_232103 ?auto_232104 ?auto_232105 ?auto_232106 ?auto_232107 ?auto_232108 ?auto_232109 ?auto_232110 )
      ( MAKE-12PILE ?auto_232102 ?auto_232103 ?auto_232104 ?auto_232105 ?auto_232106 ?auto_232107 ?auto_232108 ?auto_232109 ?auto_232110 ?auto_232111 ?auto_232112 ?auto_232113 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232127 - BLOCK
      ?auto_232128 - BLOCK
      ?auto_232129 - BLOCK
      ?auto_232130 - BLOCK
      ?auto_232131 - BLOCK
      ?auto_232132 - BLOCK
      ?auto_232133 - BLOCK
      ?auto_232134 - BLOCK
      ?auto_232135 - BLOCK
      ?auto_232136 - BLOCK
      ?auto_232137 - BLOCK
      ?auto_232138 - BLOCK
    )
    :vars
    (
      ?auto_232139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232138 ?auto_232139 ) ( ON-TABLE ?auto_232127 ) ( ON ?auto_232128 ?auto_232127 ) ( ON ?auto_232129 ?auto_232128 ) ( ON ?auto_232130 ?auto_232129 ) ( ON ?auto_232131 ?auto_232130 ) ( ON ?auto_232132 ?auto_232131 ) ( ON ?auto_232133 ?auto_232132 ) ( ON ?auto_232134 ?auto_232133 ) ( not ( = ?auto_232127 ?auto_232128 ) ) ( not ( = ?auto_232127 ?auto_232129 ) ) ( not ( = ?auto_232127 ?auto_232130 ) ) ( not ( = ?auto_232127 ?auto_232131 ) ) ( not ( = ?auto_232127 ?auto_232132 ) ) ( not ( = ?auto_232127 ?auto_232133 ) ) ( not ( = ?auto_232127 ?auto_232134 ) ) ( not ( = ?auto_232127 ?auto_232135 ) ) ( not ( = ?auto_232127 ?auto_232136 ) ) ( not ( = ?auto_232127 ?auto_232137 ) ) ( not ( = ?auto_232127 ?auto_232138 ) ) ( not ( = ?auto_232127 ?auto_232139 ) ) ( not ( = ?auto_232128 ?auto_232129 ) ) ( not ( = ?auto_232128 ?auto_232130 ) ) ( not ( = ?auto_232128 ?auto_232131 ) ) ( not ( = ?auto_232128 ?auto_232132 ) ) ( not ( = ?auto_232128 ?auto_232133 ) ) ( not ( = ?auto_232128 ?auto_232134 ) ) ( not ( = ?auto_232128 ?auto_232135 ) ) ( not ( = ?auto_232128 ?auto_232136 ) ) ( not ( = ?auto_232128 ?auto_232137 ) ) ( not ( = ?auto_232128 ?auto_232138 ) ) ( not ( = ?auto_232128 ?auto_232139 ) ) ( not ( = ?auto_232129 ?auto_232130 ) ) ( not ( = ?auto_232129 ?auto_232131 ) ) ( not ( = ?auto_232129 ?auto_232132 ) ) ( not ( = ?auto_232129 ?auto_232133 ) ) ( not ( = ?auto_232129 ?auto_232134 ) ) ( not ( = ?auto_232129 ?auto_232135 ) ) ( not ( = ?auto_232129 ?auto_232136 ) ) ( not ( = ?auto_232129 ?auto_232137 ) ) ( not ( = ?auto_232129 ?auto_232138 ) ) ( not ( = ?auto_232129 ?auto_232139 ) ) ( not ( = ?auto_232130 ?auto_232131 ) ) ( not ( = ?auto_232130 ?auto_232132 ) ) ( not ( = ?auto_232130 ?auto_232133 ) ) ( not ( = ?auto_232130 ?auto_232134 ) ) ( not ( = ?auto_232130 ?auto_232135 ) ) ( not ( = ?auto_232130 ?auto_232136 ) ) ( not ( = ?auto_232130 ?auto_232137 ) ) ( not ( = ?auto_232130 ?auto_232138 ) ) ( not ( = ?auto_232130 ?auto_232139 ) ) ( not ( = ?auto_232131 ?auto_232132 ) ) ( not ( = ?auto_232131 ?auto_232133 ) ) ( not ( = ?auto_232131 ?auto_232134 ) ) ( not ( = ?auto_232131 ?auto_232135 ) ) ( not ( = ?auto_232131 ?auto_232136 ) ) ( not ( = ?auto_232131 ?auto_232137 ) ) ( not ( = ?auto_232131 ?auto_232138 ) ) ( not ( = ?auto_232131 ?auto_232139 ) ) ( not ( = ?auto_232132 ?auto_232133 ) ) ( not ( = ?auto_232132 ?auto_232134 ) ) ( not ( = ?auto_232132 ?auto_232135 ) ) ( not ( = ?auto_232132 ?auto_232136 ) ) ( not ( = ?auto_232132 ?auto_232137 ) ) ( not ( = ?auto_232132 ?auto_232138 ) ) ( not ( = ?auto_232132 ?auto_232139 ) ) ( not ( = ?auto_232133 ?auto_232134 ) ) ( not ( = ?auto_232133 ?auto_232135 ) ) ( not ( = ?auto_232133 ?auto_232136 ) ) ( not ( = ?auto_232133 ?auto_232137 ) ) ( not ( = ?auto_232133 ?auto_232138 ) ) ( not ( = ?auto_232133 ?auto_232139 ) ) ( not ( = ?auto_232134 ?auto_232135 ) ) ( not ( = ?auto_232134 ?auto_232136 ) ) ( not ( = ?auto_232134 ?auto_232137 ) ) ( not ( = ?auto_232134 ?auto_232138 ) ) ( not ( = ?auto_232134 ?auto_232139 ) ) ( not ( = ?auto_232135 ?auto_232136 ) ) ( not ( = ?auto_232135 ?auto_232137 ) ) ( not ( = ?auto_232135 ?auto_232138 ) ) ( not ( = ?auto_232135 ?auto_232139 ) ) ( not ( = ?auto_232136 ?auto_232137 ) ) ( not ( = ?auto_232136 ?auto_232138 ) ) ( not ( = ?auto_232136 ?auto_232139 ) ) ( not ( = ?auto_232137 ?auto_232138 ) ) ( not ( = ?auto_232137 ?auto_232139 ) ) ( not ( = ?auto_232138 ?auto_232139 ) ) ( ON ?auto_232137 ?auto_232138 ) ( ON ?auto_232136 ?auto_232137 ) ( CLEAR ?auto_232134 ) ( ON ?auto_232135 ?auto_232136 ) ( CLEAR ?auto_232135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_232127 ?auto_232128 ?auto_232129 ?auto_232130 ?auto_232131 ?auto_232132 ?auto_232133 ?auto_232134 ?auto_232135 )
      ( MAKE-12PILE ?auto_232127 ?auto_232128 ?auto_232129 ?auto_232130 ?auto_232131 ?auto_232132 ?auto_232133 ?auto_232134 ?auto_232135 ?auto_232136 ?auto_232137 ?auto_232138 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232152 - BLOCK
      ?auto_232153 - BLOCK
      ?auto_232154 - BLOCK
      ?auto_232155 - BLOCK
      ?auto_232156 - BLOCK
      ?auto_232157 - BLOCK
      ?auto_232158 - BLOCK
      ?auto_232159 - BLOCK
      ?auto_232160 - BLOCK
      ?auto_232161 - BLOCK
      ?auto_232162 - BLOCK
      ?auto_232163 - BLOCK
    )
    :vars
    (
      ?auto_232164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232163 ?auto_232164 ) ( ON-TABLE ?auto_232152 ) ( ON ?auto_232153 ?auto_232152 ) ( ON ?auto_232154 ?auto_232153 ) ( ON ?auto_232155 ?auto_232154 ) ( ON ?auto_232156 ?auto_232155 ) ( ON ?auto_232157 ?auto_232156 ) ( ON ?auto_232158 ?auto_232157 ) ( not ( = ?auto_232152 ?auto_232153 ) ) ( not ( = ?auto_232152 ?auto_232154 ) ) ( not ( = ?auto_232152 ?auto_232155 ) ) ( not ( = ?auto_232152 ?auto_232156 ) ) ( not ( = ?auto_232152 ?auto_232157 ) ) ( not ( = ?auto_232152 ?auto_232158 ) ) ( not ( = ?auto_232152 ?auto_232159 ) ) ( not ( = ?auto_232152 ?auto_232160 ) ) ( not ( = ?auto_232152 ?auto_232161 ) ) ( not ( = ?auto_232152 ?auto_232162 ) ) ( not ( = ?auto_232152 ?auto_232163 ) ) ( not ( = ?auto_232152 ?auto_232164 ) ) ( not ( = ?auto_232153 ?auto_232154 ) ) ( not ( = ?auto_232153 ?auto_232155 ) ) ( not ( = ?auto_232153 ?auto_232156 ) ) ( not ( = ?auto_232153 ?auto_232157 ) ) ( not ( = ?auto_232153 ?auto_232158 ) ) ( not ( = ?auto_232153 ?auto_232159 ) ) ( not ( = ?auto_232153 ?auto_232160 ) ) ( not ( = ?auto_232153 ?auto_232161 ) ) ( not ( = ?auto_232153 ?auto_232162 ) ) ( not ( = ?auto_232153 ?auto_232163 ) ) ( not ( = ?auto_232153 ?auto_232164 ) ) ( not ( = ?auto_232154 ?auto_232155 ) ) ( not ( = ?auto_232154 ?auto_232156 ) ) ( not ( = ?auto_232154 ?auto_232157 ) ) ( not ( = ?auto_232154 ?auto_232158 ) ) ( not ( = ?auto_232154 ?auto_232159 ) ) ( not ( = ?auto_232154 ?auto_232160 ) ) ( not ( = ?auto_232154 ?auto_232161 ) ) ( not ( = ?auto_232154 ?auto_232162 ) ) ( not ( = ?auto_232154 ?auto_232163 ) ) ( not ( = ?auto_232154 ?auto_232164 ) ) ( not ( = ?auto_232155 ?auto_232156 ) ) ( not ( = ?auto_232155 ?auto_232157 ) ) ( not ( = ?auto_232155 ?auto_232158 ) ) ( not ( = ?auto_232155 ?auto_232159 ) ) ( not ( = ?auto_232155 ?auto_232160 ) ) ( not ( = ?auto_232155 ?auto_232161 ) ) ( not ( = ?auto_232155 ?auto_232162 ) ) ( not ( = ?auto_232155 ?auto_232163 ) ) ( not ( = ?auto_232155 ?auto_232164 ) ) ( not ( = ?auto_232156 ?auto_232157 ) ) ( not ( = ?auto_232156 ?auto_232158 ) ) ( not ( = ?auto_232156 ?auto_232159 ) ) ( not ( = ?auto_232156 ?auto_232160 ) ) ( not ( = ?auto_232156 ?auto_232161 ) ) ( not ( = ?auto_232156 ?auto_232162 ) ) ( not ( = ?auto_232156 ?auto_232163 ) ) ( not ( = ?auto_232156 ?auto_232164 ) ) ( not ( = ?auto_232157 ?auto_232158 ) ) ( not ( = ?auto_232157 ?auto_232159 ) ) ( not ( = ?auto_232157 ?auto_232160 ) ) ( not ( = ?auto_232157 ?auto_232161 ) ) ( not ( = ?auto_232157 ?auto_232162 ) ) ( not ( = ?auto_232157 ?auto_232163 ) ) ( not ( = ?auto_232157 ?auto_232164 ) ) ( not ( = ?auto_232158 ?auto_232159 ) ) ( not ( = ?auto_232158 ?auto_232160 ) ) ( not ( = ?auto_232158 ?auto_232161 ) ) ( not ( = ?auto_232158 ?auto_232162 ) ) ( not ( = ?auto_232158 ?auto_232163 ) ) ( not ( = ?auto_232158 ?auto_232164 ) ) ( not ( = ?auto_232159 ?auto_232160 ) ) ( not ( = ?auto_232159 ?auto_232161 ) ) ( not ( = ?auto_232159 ?auto_232162 ) ) ( not ( = ?auto_232159 ?auto_232163 ) ) ( not ( = ?auto_232159 ?auto_232164 ) ) ( not ( = ?auto_232160 ?auto_232161 ) ) ( not ( = ?auto_232160 ?auto_232162 ) ) ( not ( = ?auto_232160 ?auto_232163 ) ) ( not ( = ?auto_232160 ?auto_232164 ) ) ( not ( = ?auto_232161 ?auto_232162 ) ) ( not ( = ?auto_232161 ?auto_232163 ) ) ( not ( = ?auto_232161 ?auto_232164 ) ) ( not ( = ?auto_232162 ?auto_232163 ) ) ( not ( = ?auto_232162 ?auto_232164 ) ) ( not ( = ?auto_232163 ?auto_232164 ) ) ( ON ?auto_232162 ?auto_232163 ) ( ON ?auto_232161 ?auto_232162 ) ( ON ?auto_232160 ?auto_232161 ) ( CLEAR ?auto_232158 ) ( ON ?auto_232159 ?auto_232160 ) ( CLEAR ?auto_232159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_232152 ?auto_232153 ?auto_232154 ?auto_232155 ?auto_232156 ?auto_232157 ?auto_232158 ?auto_232159 )
      ( MAKE-12PILE ?auto_232152 ?auto_232153 ?auto_232154 ?auto_232155 ?auto_232156 ?auto_232157 ?auto_232158 ?auto_232159 ?auto_232160 ?auto_232161 ?auto_232162 ?auto_232163 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232177 - BLOCK
      ?auto_232178 - BLOCK
      ?auto_232179 - BLOCK
      ?auto_232180 - BLOCK
      ?auto_232181 - BLOCK
      ?auto_232182 - BLOCK
      ?auto_232183 - BLOCK
      ?auto_232184 - BLOCK
      ?auto_232185 - BLOCK
      ?auto_232186 - BLOCK
      ?auto_232187 - BLOCK
      ?auto_232188 - BLOCK
    )
    :vars
    (
      ?auto_232189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232188 ?auto_232189 ) ( ON-TABLE ?auto_232177 ) ( ON ?auto_232178 ?auto_232177 ) ( ON ?auto_232179 ?auto_232178 ) ( ON ?auto_232180 ?auto_232179 ) ( ON ?auto_232181 ?auto_232180 ) ( ON ?auto_232182 ?auto_232181 ) ( ON ?auto_232183 ?auto_232182 ) ( not ( = ?auto_232177 ?auto_232178 ) ) ( not ( = ?auto_232177 ?auto_232179 ) ) ( not ( = ?auto_232177 ?auto_232180 ) ) ( not ( = ?auto_232177 ?auto_232181 ) ) ( not ( = ?auto_232177 ?auto_232182 ) ) ( not ( = ?auto_232177 ?auto_232183 ) ) ( not ( = ?auto_232177 ?auto_232184 ) ) ( not ( = ?auto_232177 ?auto_232185 ) ) ( not ( = ?auto_232177 ?auto_232186 ) ) ( not ( = ?auto_232177 ?auto_232187 ) ) ( not ( = ?auto_232177 ?auto_232188 ) ) ( not ( = ?auto_232177 ?auto_232189 ) ) ( not ( = ?auto_232178 ?auto_232179 ) ) ( not ( = ?auto_232178 ?auto_232180 ) ) ( not ( = ?auto_232178 ?auto_232181 ) ) ( not ( = ?auto_232178 ?auto_232182 ) ) ( not ( = ?auto_232178 ?auto_232183 ) ) ( not ( = ?auto_232178 ?auto_232184 ) ) ( not ( = ?auto_232178 ?auto_232185 ) ) ( not ( = ?auto_232178 ?auto_232186 ) ) ( not ( = ?auto_232178 ?auto_232187 ) ) ( not ( = ?auto_232178 ?auto_232188 ) ) ( not ( = ?auto_232178 ?auto_232189 ) ) ( not ( = ?auto_232179 ?auto_232180 ) ) ( not ( = ?auto_232179 ?auto_232181 ) ) ( not ( = ?auto_232179 ?auto_232182 ) ) ( not ( = ?auto_232179 ?auto_232183 ) ) ( not ( = ?auto_232179 ?auto_232184 ) ) ( not ( = ?auto_232179 ?auto_232185 ) ) ( not ( = ?auto_232179 ?auto_232186 ) ) ( not ( = ?auto_232179 ?auto_232187 ) ) ( not ( = ?auto_232179 ?auto_232188 ) ) ( not ( = ?auto_232179 ?auto_232189 ) ) ( not ( = ?auto_232180 ?auto_232181 ) ) ( not ( = ?auto_232180 ?auto_232182 ) ) ( not ( = ?auto_232180 ?auto_232183 ) ) ( not ( = ?auto_232180 ?auto_232184 ) ) ( not ( = ?auto_232180 ?auto_232185 ) ) ( not ( = ?auto_232180 ?auto_232186 ) ) ( not ( = ?auto_232180 ?auto_232187 ) ) ( not ( = ?auto_232180 ?auto_232188 ) ) ( not ( = ?auto_232180 ?auto_232189 ) ) ( not ( = ?auto_232181 ?auto_232182 ) ) ( not ( = ?auto_232181 ?auto_232183 ) ) ( not ( = ?auto_232181 ?auto_232184 ) ) ( not ( = ?auto_232181 ?auto_232185 ) ) ( not ( = ?auto_232181 ?auto_232186 ) ) ( not ( = ?auto_232181 ?auto_232187 ) ) ( not ( = ?auto_232181 ?auto_232188 ) ) ( not ( = ?auto_232181 ?auto_232189 ) ) ( not ( = ?auto_232182 ?auto_232183 ) ) ( not ( = ?auto_232182 ?auto_232184 ) ) ( not ( = ?auto_232182 ?auto_232185 ) ) ( not ( = ?auto_232182 ?auto_232186 ) ) ( not ( = ?auto_232182 ?auto_232187 ) ) ( not ( = ?auto_232182 ?auto_232188 ) ) ( not ( = ?auto_232182 ?auto_232189 ) ) ( not ( = ?auto_232183 ?auto_232184 ) ) ( not ( = ?auto_232183 ?auto_232185 ) ) ( not ( = ?auto_232183 ?auto_232186 ) ) ( not ( = ?auto_232183 ?auto_232187 ) ) ( not ( = ?auto_232183 ?auto_232188 ) ) ( not ( = ?auto_232183 ?auto_232189 ) ) ( not ( = ?auto_232184 ?auto_232185 ) ) ( not ( = ?auto_232184 ?auto_232186 ) ) ( not ( = ?auto_232184 ?auto_232187 ) ) ( not ( = ?auto_232184 ?auto_232188 ) ) ( not ( = ?auto_232184 ?auto_232189 ) ) ( not ( = ?auto_232185 ?auto_232186 ) ) ( not ( = ?auto_232185 ?auto_232187 ) ) ( not ( = ?auto_232185 ?auto_232188 ) ) ( not ( = ?auto_232185 ?auto_232189 ) ) ( not ( = ?auto_232186 ?auto_232187 ) ) ( not ( = ?auto_232186 ?auto_232188 ) ) ( not ( = ?auto_232186 ?auto_232189 ) ) ( not ( = ?auto_232187 ?auto_232188 ) ) ( not ( = ?auto_232187 ?auto_232189 ) ) ( not ( = ?auto_232188 ?auto_232189 ) ) ( ON ?auto_232187 ?auto_232188 ) ( ON ?auto_232186 ?auto_232187 ) ( ON ?auto_232185 ?auto_232186 ) ( CLEAR ?auto_232183 ) ( ON ?auto_232184 ?auto_232185 ) ( CLEAR ?auto_232184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_232177 ?auto_232178 ?auto_232179 ?auto_232180 ?auto_232181 ?auto_232182 ?auto_232183 ?auto_232184 )
      ( MAKE-12PILE ?auto_232177 ?auto_232178 ?auto_232179 ?auto_232180 ?auto_232181 ?auto_232182 ?auto_232183 ?auto_232184 ?auto_232185 ?auto_232186 ?auto_232187 ?auto_232188 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232202 - BLOCK
      ?auto_232203 - BLOCK
      ?auto_232204 - BLOCK
      ?auto_232205 - BLOCK
      ?auto_232206 - BLOCK
      ?auto_232207 - BLOCK
      ?auto_232208 - BLOCK
      ?auto_232209 - BLOCK
      ?auto_232210 - BLOCK
      ?auto_232211 - BLOCK
      ?auto_232212 - BLOCK
      ?auto_232213 - BLOCK
    )
    :vars
    (
      ?auto_232214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232213 ?auto_232214 ) ( ON-TABLE ?auto_232202 ) ( ON ?auto_232203 ?auto_232202 ) ( ON ?auto_232204 ?auto_232203 ) ( ON ?auto_232205 ?auto_232204 ) ( ON ?auto_232206 ?auto_232205 ) ( ON ?auto_232207 ?auto_232206 ) ( not ( = ?auto_232202 ?auto_232203 ) ) ( not ( = ?auto_232202 ?auto_232204 ) ) ( not ( = ?auto_232202 ?auto_232205 ) ) ( not ( = ?auto_232202 ?auto_232206 ) ) ( not ( = ?auto_232202 ?auto_232207 ) ) ( not ( = ?auto_232202 ?auto_232208 ) ) ( not ( = ?auto_232202 ?auto_232209 ) ) ( not ( = ?auto_232202 ?auto_232210 ) ) ( not ( = ?auto_232202 ?auto_232211 ) ) ( not ( = ?auto_232202 ?auto_232212 ) ) ( not ( = ?auto_232202 ?auto_232213 ) ) ( not ( = ?auto_232202 ?auto_232214 ) ) ( not ( = ?auto_232203 ?auto_232204 ) ) ( not ( = ?auto_232203 ?auto_232205 ) ) ( not ( = ?auto_232203 ?auto_232206 ) ) ( not ( = ?auto_232203 ?auto_232207 ) ) ( not ( = ?auto_232203 ?auto_232208 ) ) ( not ( = ?auto_232203 ?auto_232209 ) ) ( not ( = ?auto_232203 ?auto_232210 ) ) ( not ( = ?auto_232203 ?auto_232211 ) ) ( not ( = ?auto_232203 ?auto_232212 ) ) ( not ( = ?auto_232203 ?auto_232213 ) ) ( not ( = ?auto_232203 ?auto_232214 ) ) ( not ( = ?auto_232204 ?auto_232205 ) ) ( not ( = ?auto_232204 ?auto_232206 ) ) ( not ( = ?auto_232204 ?auto_232207 ) ) ( not ( = ?auto_232204 ?auto_232208 ) ) ( not ( = ?auto_232204 ?auto_232209 ) ) ( not ( = ?auto_232204 ?auto_232210 ) ) ( not ( = ?auto_232204 ?auto_232211 ) ) ( not ( = ?auto_232204 ?auto_232212 ) ) ( not ( = ?auto_232204 ?auto_232213 ) ) ( not ( = ?auto_232204 ?auto_232214 ) ) ( not ( = ?auto_232205 ?auto_232206 ) ) ( not ( = ?auto_232205 ?auto_232207 ) ) ( not ( = ?auto_232205 ?auto_232208 ) ) ( not ( = ?auto_232205 ?auto_232209 ) ) ( not ( = ?auto_232205 ?auto_232210 ) ) ( not ( = ?auto_232205 ?auto_232211 ) ) ( not ( = ?auto_232205 ?auto_232212 ) ) ( not ( = ?auto_232205 ?auto_232213 ) ) ( not ( = ?auto_232205 ?auto_232214 ) ) ( not ( = ?auto_232206 ?auto_232207 ) ) ( not ( = ?auto_232206 ?auto_232208 ) ) ( not ( = ?auto_232206 ?auto_232209 ) ) ( not ( = ?auto_232206 ?auto_232210 ) ) ( not ( = ?auto_232206 ?auto_232211 ) ) ( not ( = ?auto_232206 ?auto_232212 ) ) ( not ( = ?auto_232206 ?auto_232213 ) ) ( not ( = ?auto_232206 ?auto_232214 ) ) ( not ( = ?auto_232207 ?auto_232208 ) ) ( not ( = ?auto_232207 ?auto_232209 ) ) ( not ( = ?auto_232207 ?auto_232210 ) ) ( not ( = ?auto_232207 ?auto_232211 ) ) ( not ( = ?auto_232207 ?auto_232212 ) ) ( not ( = ?auto_232207 ?auto_232213 ) ) ( not ( = ?auto_232207 ?auto_232214 ) ) ( not ( = ?auto_232208 ?auto_232209 ) ) ( not ( = ?auto_232208 ?auto_232210 ) ) ( not ( = ?auto_232208 ?auto_232211 ) ) ( not ( = ?auto_232208 ?auto_232212 ) ) ( not ( = ?auto_232208 ?auto_232213 ) ) ( not ( = ?auto_232208 ?auto_232214 ) ) ( not ( = ?auto_232209 ?auto_232210 ) ) ( not ( = ?auto_232209 ?auto_232211 ) ) ( not ( = ?auto_232209 ?auto_232212 ) ) ( not ( = ?auto_232209 ?auto_232213 ) ) ( not ( = ?auto_232209 ?auto_232214 ) ) ( not ( = ?auto_232210 ?auto_232211 ) ) ( not ( = ?auto_232210 ?auto_232212 ) ) ( not ( = ?auto_232210 ?auto_232213 ) ) ( not ( = ?auto_232210 ?auto_232214 ) ) ( not ( = ?auto_232211 ?auto_232212 ) ) ( not ( = ?auto_232211 ?auto_232213 ) ) ( not ( = ?auto_232211 ?auto_232214 ) ) ( not ( = ?auto_232212 ?auto_232213 ) ) ( not ( = ?auto_232212 ?auto_232214 ) ) ( not ( = ?auto_232213 ?auto_232214 ) ) ( ON ?auto_232212 ?auto_232213 ) ( ON ?auto_232211 ?auto_232212 ) ( ON ?auto_232210 ?auto_232211 ) ( ON ?auto_232209 ?auto_232210 ) ( CLEAR ?auto_232207 ) ( ON ?auto_232208 ?auto_232209 ) ( CLEAR ?auto_232208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_232202 ?auto_232203 ?auto_232204 ?auto_232205 ?auto_232206 ?auto_232207 ?auto_232208 )
      ( MAKE-12PILE ?auto_232202 ?auto_232203 ?auto_232204 ?auto_232205 ?auto_232206 ?auto_232207 ?auto_232208 ?auto_232209 ?auto_232210 ?auto_232211 ?auto_232212 ?auto_232213 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232227 - BLOCK
      ?auto_232228 - BLOCK
      ?auto_232229 - BLOCK
      ?auto_232230 - BLOCK
      ?auto_232231 - BLOCK
      ?auto_232232 - BLOCK
      ?auto_232233 - BLOCK
      ?auto_232234 - BLOCK
      ?auto_232235 - BLOCK
      ?auto_232236 - BLOCK
      ?auto_232237 - BLOCK
      ?auto_232238 - BLOCK
    )
    :vars
    (
      ?auto_232239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232238 ?auto_232239 ) ( ON-TABLE ?auto_232227 ) ( ON ?auto_232228 ?auto_232227 ) ( ON ?auto_232229 ?auto_232228 ) ( ON ?auto_232230 ?auto_232229 ) ( ON ?auto_232231 ?auto_232230 ) ( ON ?auto_232232 ?auto_232231 ) ( not ( = ?auto_232227 ?auto_232228 ) ) ( not ( = ?auto_232227 ?auto_232229 ) ) ( not ( = ?auto_232227 ?auto_232230 ) ) ( not ( = ?auto_232227 ?auto_232231 ) ) ( not ( = ?auto_232227 ?auto_232232 ) ) ( not ( = ?auto_232227 ?auto_232233 ) ) ( not ( = ?auto_232227 ?auto_232234 ) ) ( not ( = ?auto_232227 ?auto_232235 ) ) ( not ( = ?auto_232227 ?auto_232236 ) ) ( not ( = ?auto_232227 ?auto_232237 ) ) ( not ( = ?auto_232227 ?auto_232238 ) ) ( not ( = ?auto_232227 ?auto_232239 ) ) ( not ( = ?auto_232228 ?auto_232229 ) ) ( not ( = ?auto_232228 ?auto_232230 ) ) ( not ( = ?auto_232228 ?auto_232231 ) ) ( not ( = ?auto_232228 ?auto_232232 ) ) ( not ( = ?auto_232228 ?auto_232233 ) ) ( not ( = ?auto_232228 ?auto_232234 ) ) ( not ( = ?auto_232228 ?auto_232235 ) ) ( not ( = ?auto_232228 ?auto_232236 ) ) ( not ( = ?auto_232228 ?auto_232237 ) ) ( not ( = ?auto_232228 ?auto_232238 ) ) ( not ( = ?auto_232228 ?auto_232239 ) ) ( not ( = ?auto_232229 ?auto_232230 ) ) ( not ( = ?auto_232229 ?auto_232231 ) ) ( not ( = ?auto_232229 ?auto_232232 ) ) ( not ( = ?auto_232229 ?auto_232233 ) ) ( not ( = ?auto_232229 ?auto_232234 ) ) ( not ( = ?auto_232229 ?auto_232235 ) ) ( not ( = ?auto_232229 ?auto_232236 ) ) ( not ( = ?auto_232229 ?auto_232237 ) ) ( not ( = ?auto_232229 ?auto_232238 ) ) ( not ( = ?auto_232229 ?auto_232239 ) ) ( not ( = ?auto_232230 ?auto_232231 ) ) ( not ( = ?auto_232230 ?auto_232232 ) ) ( not ( = ?auto_232230 ?auto_232233 ) ) ( not ( = ?auto_232230 ?auto_232234 ) ) ( not ( = ?auto_232230 ?auto_232235 ) ) ( not ( = ?auto_232230 ?auto_232236 ) ) ( not ( = ?auto_232230 ?auto_232237 ) ) ( not ( = ?auto_232230 ?auto_232238 ) ) ( not ( = ?auto_232230 ?auto_232239 ) ) ( not ( = ?auto_232231 ?auto_232232 ) ) ( not ( = ?auto_232231 ?auto_232233 ) ) ( not ( = ?auto_232231 ?auto_232234 ) ) ( not ( = ?auto_232231 ?auto_232235 ) ) ( not ( = ?auto_232231 ?auto_232236 ) ) ( not ( = ?auto_232231 ?auto_232237 ) ) ( not ( = ?auto_232231 ?auto_232238 ) ) ( not ( = ?auto_232231 ?auto_232239 ) ) ( not ( = ?auto_232232 ?auto_232233 ) ) ( not ( = ?auto_232232 ?auto_232234 ) ) ( not ( = ?auto_232232 ?auto_232235 ) ) ( not ( = ?auto_232232 ?auto_232236 ) ) ( not ( = ?auto_232232 ?auto_232237 ) ) ( not ( = ?auto_232232 ?auto_232238 ) ) ( not ( = ?auto_232232 ?auto_232239 ) ) ( not ( = ?auto_232233 ?auto_232234 ) ) ( not ( = ?auto_232233 ?auto_232235 ) ) ( not ( = ?auto_232233 ?auto_232236 ) ) ( not ( = ?auto_232233 ?auto_232237 ) ) ( not ( = ?auto_232233 ?auto_232238 ) ) ( not ( = ?auto_232233 ?auto_232239 ) ) ( not ( = ?auto_232234 ?auto_232235 ) ) ( not ( = ?auto_232234 ?auto_232236 ) ) ( not ( = ?auto_232234 ?auto_232237 ) ) ( not ( = ?auto_232234 ?auto_232238 ) ) ( not ( = ?auto_232234 ?auto_232239 ) ) ( not ( = ?auto_232235 ?auto_232236 ) ) ( not ( = ?auto_232235 ?auto_232237 ) ) ( not ( = ?auto_232235 ?auto_232238 ) ) ( not ( = ?auto_232235 ?auto_232239 ) ) ( not ( = ?auto_232236 ?auto_232237 ) ) ( not ( = ?auto_232236 ?auto_232238 ) ) ( not ( = ?auto_232236 ?auto_232239 ) ) ( not ( = ?auto_232237 ?auto_232238 ) ) ( not ( = ?auto_232237 ?auto_232239 ) ) ( not ( = ?auto_232238 ?auto_232239 ) ) ( ON ?auto_232237 ?auto_232238 ) ( ON ?auto_232236 ?auto_232237 ) ( ON ?auto_232235 ?auto_232236 ) ( ON ?auto_232234 ?auto_232235 ) ( CLEAR ?auto_232232 ) ( ON ?auto_232233 ?auto_232234 ) ( CLEAR ?auto_232233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_232227 ?auto_232228 ?auto_232229 ?auto_232230 ?auto_232231 ?auto_232232 ?auto_232233 )
      ( MAKE-12PILE ?auto_232227 ?auto_232228 ?auto_232229 ?auto_232230 ?auto_232231 ?auto_232232 ?auto_232233 ?auto_232234 ?auto_232235 ?auto_232236 ?auto_232237 ?auto_232238 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232252 - BLOCK
      ?auto_232253 - BLOCK
      ?auto_232254 - BLOCK
      ?auto_232255 - BLOCK
      ?auto_232256 - BLOCK
      ?auto_232257 - BLOCK
      ?auto_232258 - BLOCK
      ?auto_232259 - BLOCK
      ?auto_232260 - BLOCK
      ?auto_232261 - BLOCK
      ?auto_232262 - BLOCK
      ?auto_232263 - BLOCK
    )
    :vars
    (
      ?auto_232264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232263 ?auto_232264 ) ( ON-TABLE ?auto_232252 ) ( ON ?auto_232253 ?auto_232252 ) ( ON ?auto_232254 ?auto_232253 ) ( ON ?auto_232255 ?auto_232254 ) ( ON ?auto_232256 ?auto_232255 ) ( not ( = ?auto_232252 ?auto_232253 ) ) ( not ( = ?auto_232252 ?auto_232254 ) ) ( not ( = ?auto_232252 ?auto_232255 ) ) ( not ( = ?auto_232252 ?auto_232256 ) ) ( not ( = ?auto_232252 ?auto_232257 ) ) ( not ( = ?auto_232252 ?auto_232258 ) ) ( not ( = ?auto_232252 ?auto_232259 ) ) ( not ( = ?auto_232252 ?auto_232260 ) ) ( not ( = ?auto_232252 ?auto_232261 ) ) ( not ( = ?auto_232252 ?auto_232262 ) ) ( not ( = ?auto_232252 ?auto_232263 ) ) ( not ( = ?auto_232252 ?auto_232264 ) ) ( not ( = ?auto_232253 ?auto_232254 ) ) ( not ( = ?auto_232253 ?auto_232255 ) ) ( not ( = ?auto_232253 ?auto_232256 ) ) ( not ( = ?auto_232253 ?auto_232257 ) ) ( not ( = ?auto_232253 ?auto_232258 ) ) ( not ( = ?auto_232253 ?auto_232259 ) ) ( not ( = ?auto_232253 ?auto_232260 ) ) ( not ( = ?auto_232253 ?auto_232261 ) ) ( not ( = ?auto_232253 ?auto_232262 ) ) ( not ( = ?auto_232253 ?auto_232263 ) ) ( not ( = ?auto_232253 ?auto_232264 ) ) ( not ( = ?auto_232254 ?auto_232255 ) ) ( not ( = ?auto_232254 ?auto_232256 ) ) ( not ( = ?auto_232254 ?auto_232257 ) ) ( not ( = ?auto_232254 ?auto_232258 ) ) ( not ( = ?auto_232254 ?auto_232259 ) ) ( not ( = ?auto_232254 ?auto_232260 ) ) ( not ( = ?auto_232254 ?auto_232261 ) ) ( not ( = ?auto_232254 ?auto_232262 ) ) ( not ( = ?auto_232254 ?auto_232263 ) ) ( not ( = ?auto_232254 ?auto_232264 ) ) ( not ( = ?auto_232255 ?auto_232256 ) ) ( not ( = ?auto_232255 ?auto_232257 ) ) ( not ( = ?auto_232255 ?auto_232258 ) ) ( not ( = ?auto_232255 ?auto_232259 ) ) ( not ( = ?auto_232255 ?auto_232260 ) ) ( not ( = ?auto_232255 ?auto_232261 ) ) ( not ( = ?auto_232255 ?auto_232262 ) ) ( not ( = ?auto_232255 ?auto_232263 ) ) ( not ( = ?auto_232255 ?auto_232264 ) ) ( not ( = ?auto_232256 ?auto_232257 ) ) ( not ( = ?auto_232256 ?auto_232258 ) ) ( not ( = ?auto_232256 ?auto_232259 ) ) ( not ( = ?auto_232256 ?auto_232260 ) ) ( not ( = ?auto_232256 ?auto_232261 ) ) ( not ( = ?auto_232256 ?auto_232262 ) ) ( not ( = ?auto_232256 ?auto_232263 ) ) ( not ( = ?auto_232256 ?auto_232264 ) ) ( not ( = ?auto_232257 ?auto_232258 ) ) ( not ( = ?auto_232257 ?auto_232259 ) ) ( not ( = ?auto_232257 ?auto_232260 ) ) ( not ( = ?auto_232257 ?auto_232261 ) ) ( not ( = ?auto_232257 ?auto_232262 ) ) ( not ( = ?auto_232257 ?auto_232263 ) ) ( not ( = ?auto_232257 ?auto_232264 ) ) ( not ( = ?auto_232258 ?auto_232259 ) ) ( not ( = ?auto_232258 ?auto_232260 ) ) ( not ( = ?auto_232258 ?auto_232261 ) ) ( not ( = ?auto_232258 ?auto_232262 ) ) ( not ( = ?auto_232258 ?auto_232263 ) ) ( not ( = ?auto_232258 ?auto_232264 ) ) ( not ( = ?auto_232259 ?auto_232260 ) ) ( not ( = ?auto_232259 ?auto_232261 ) ) ( not ( = ?auto_232259 ?auto_232262 ) ) ( not ( = ?auto_232259 ?auto_232263 ) ) ( not ( = ?auto_232259 ?auto_232264 ) ) ( not ( = ?auto_232260 ?auto_232261 ) ) ( not ( = ?auto_232260 ?auto_232262 ) ) ( not ( = ?auto_232260 ?auto_232263 ) ) ( not ( = ?auto_232260 ?auto_232264 ) ) ( not ( = ?auto_232261 ?auto_232262 ) ) ( not ( = ?auto_232261 ?auto_232263 ) ) ( not ( = ?auto_232261 ?auto_232264 ) ) ( not ( = ?auto_232262 ?auto_232263 ) ) ( not ( = ?auto_232262 ?auto_232264 ) ) ( not ( = ?auto_232263 ?auto_232264 ) ) ( ON ?auto_232262 ?auto_232263 ) ( ON ?auto_232261 ?auto_232262 ) ( ON ?auto_232260 ?auto_232261 ) ( ON ?auto_232259 ?auto_232260 ) ( ON ?auto_232258 ?auto_232259 ) ( CLEAR ?auto_232256 ) ( ON ?auto_232257 ?auto_232258 ) ( CLEAR ?auto_232257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_232252 ?auto_232253 ?auto_232254 ?auto_232255 ?auto_232256 ?auto_232257 )
      ( MAKE-12PILE ?auto_232252 ?auto_232253 ?auto_232254 ?auto_232255 ?auto_232256 ?auto_232257 ?auto_232258 ?auto_232259 ?auto_232260 ?auto_232261 ?auto_232262 ?auto_232263 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232277 - BLOCK
      ?auto_232278 - BLOCK
      ?auto_232279 - BLOCK
      ?auto_232280 - BLOCK
      ?auto_232281 - BLOCK
      ?auto_232282 - BLOCK
      ?auto_232283 - BLOCK
      ?auto_232284 - BLOCK
      ?auto_232285 - BLOCK
      ?auto_232286 - BLOCK
      ?auto_232287 - BLOCK
      ?auto_232288 - BLOCK
    )
    :vars
    (
      ?auto_232289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232288 ?auto_232289 ) ( ON-TABLE ?auto_232277 ) ( ON ?auto_232278 ?auto_232277 ) ( ON ?auto_232279 ?auto_232278 ) ( ON ?auto_232280 ?auto_232279 ) ( ON ?auto_232281 ?auto_232280 ) ( not ( = ?auto_232277 ?auto_232278 ) ) ( not ( = ?auto_232277 ?auto_232279 ) ) ( not ( = ?auto_232277 ?auto_232280 ) ) ( not ( = ?auto_232277 ?auto_232281 ) ) ( not ( = ?auto_232277 ?auto_232282 ) ) ( not ( = ?auto_232277 ?auto_232283 ) ) ( not ( = ?auto_232277 ?auto_232284 ) ) ( not ( = ?auto_232277 ?auto_232285 ) ) ( not ( = ?auto_232277 ?auto_232286 ) ) ( not ( = ?auto_232277 ?auto_232287 ) ) ( not ( = ?auto_232277 ?auto_232288 ) ) ( not ( = ?auto_232277 ?auto_232289 ) ) ( not ( = ?auto_232278 ?auto_232279 ) ) ( not ( = ?auto_232278 ?auto_232280 ) ) ( not ( = ?auto_232278 ?auto_232281 ) ) ( not ( = ?auto_232278 ?auto_232282 ) ) ( not ( = ?auto_232278 ?auto_232283 ) ) ( not ( = ?auto_232278 ?auto_232284 ) ) ( not ( = ?auto_232278 ?auto_232285 ) ) ( not ( = ?auto_232278 ?auto_232286 ) ) ( not ( = ?auto_232278 ?auto_232287 ) ) ( not ( = ?auto_232278 ?auto_232288 ) ) ( not ( = ?auto_232278 ?auto_232289 ) ) ( not ( = ?auto_232279 ?auto_232280 ) ) ( not ( = ?auto_232279 ?auto_232281 ) ) ( not ( = ?auto_232279 ?auto_232282 ) ) ( not ( = ?auto_232279 ?auto_232283 ) ) ( not ( = ?auto_232279 ?auto_232284 ) ) ( not ( = ?auto_232279 ?auto_232285 ) ) ( not ( = ?auto_232279 ?auto_232286 ) ) ( not ( = ?auto_232279 ?auto_232287 ) ) ( not ( = ?auto_232279 ?auto_232288 ) ) ( not ( = ?auto_232279 ?auto_232289 ) ) ( not ( = ?auto_232280 ?auto_232281 ) ) ( not ( = ?auto_232280 ?auto_232282 ) ) ( not ( = ?auto_232280 ?auto_232283 ) ) ( not ( = ?auto_232280 ?auto_232284 ) ) ( not ( = ?auto_232280 ?auto_232285 ) ) ( not ( = ?auto_232280 ?auto_232286 ) ) ( not ( = ?auto_232280 ?auto_232287 ) ) ( not ( = ?auto_232280 ?auto_232288 ) ) ( not ( = ?auto_232280 ?auto_232289 ) ) ( not ( = ?auto_232281 ?auto_232282 ) ) ( not ( = ?auto_232281 ?auto_232283 ) ) ( not ( = ?auto_232281 ?auto_232284 ) ) ( not ( = ?auto_232281 ?auto_232285 ) ) ( not ( = ?auto_232281 ?auto_232286 ) ) ( not ( = ?auto_232281 ?auto_232287 ) ) ( not ( = ?auto_232281 ?auto_232288 ) ) ( not ( = ?auto_232281 ?auto_232289 ) ) ( not ( = ?auto_232282 ?auto_232283 ) ) ( not ( = ?auto_232282 ?auto_232284 ) ) ( not ( = ?auto_232282 ?auto_232285 ) ) ( not ( = ?auto_232282 ?auto_232286 ) ) ( not ( = ?auto_232282 ?auto_232287 ) ) ( not ( = ?auto_232282 ?auto_232288 ) ) ( not ( = ?auto_232282 ?auto_232289 ) ) ( not ( = ?auto_232283 ?auto_232284 ) ) ( not ( = ?auto_232283 ?auto_232285 ) ) ( not ( = ?auto_232283 ?auto_232286 ) ) ( not ( = ?auto_232283 ?auto_232287 ) ) ( not ( = ?auto_232283 ?auto_232288 ) ) ( not ( = ?auto_232283 ?auto_232289 ) ) ( not ( = ?auto_232284 ?auto_232285 ) ) ( not ( = ?auto_232284 ?auto_232286 ) ) ( not ( = ?auto_232284 ?auto_232287 ) ) ( not ( = ?auto_232284 ?auto_232288 ) ) ( not ( = ?auto_232284 ?auto_232289 ) ) ( not ( = ?auto_232285 ?auto_232286 ) ) ( not ( = ?auto_232285 ?auto_232287 ) ) ( not ( = ?auto_232285 ?auto_232288 ) ) ( not ( = ?auto_232285 ?auto_232289 ) ) ( not ( = ?auto_232286 ?auto_232287 ) ) ( not ( = ?auto_232286 ?auto_232288 ) ) ( not ( = ?auto_232286 ?auto_232289 ) ) ( not ( = ?auto_232287 ?auto_232288 ) ) ( not ( = ?auto_232287 ?auto_232289 ) ) ( not ( = ?auto_232288 ?auto_232289 ) ) ( ON ?auto_232287 ?auto_232288 ) ( ON ?auto_232286 ?auto_232287 ) ( ON ?auto_232285 ?auto_232286 ) ( ON ?auto_232284 ?auto_232285 ) ( ON ?auto_232283 ?auto_232284 ) ( CLEAR ?auto_232281 ) ( ON ?auto_232282 ?auto_232283 ) ( CLEAR ?auto_232282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_232277 ?auto_232278 ?auto_232279 ?auto_232280 ?auto_232281 ?auto_232282 )
      ( MAKE-12PILE ?auto_232277 ?auto_232278 ?auto_232279 ?auto_232280 ?auto_232281 ?auto_232282 ?auto_232283 ?auto_232284 ?auto_232285 ?auto_232286 ?auto_232287 ?auto_232288 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232302 - BLOCK
      ?auto_232303 - BLOCK
      ?auto_232304 - BLOCK
      ?auto_232305 - BLOCK
      ?auto_232306 - BLOCK
      ?auto_232307 - BLOCK
      ?auto_232308 - BLOCK
      ?auto_232309 - BLOCK
      ?auto_232310 - BLOCK
      ?auto_232311 - BLOCK
      ?auto_232312 - BLOCK
      ?auto_232313 - BLOCK
    )
    :vars
    (
      ?auto_232314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232313 ?auto_232314 ) ( ON-TABLE ?auto_232302 ) ( ON ?auto_232303 ?auto_232302 ) ( ON ?auto_232304 ?auto_232303 ) ( ON ?auto_232305 ?auto_232304 ) ( not ( = ?auto_232302 ?auto_232303 ) ) ( not ( = ?auto_232302 ?auto_232304 ) ) ( not ( = ?auto_232302 ?auto_232305 ) ) ( not ( = ?auto_232302 ?auto_232306 ) ) ( not ( = ?auto_232302 ?auto_232307 ) ) ( not ( = ?auto_232302 ?auto_232308 ) ) ( not ( = ?auto_232302 ?auto_232309 ) ) ( not ( = ?auto_232302 ?auto_232310 ) ) ( not ( = ?auto_232302 ?auto_232311 ) ) ( not ( = ?auto_232302 ?auto_232312 ) ) ( not ( = ?auto_232302 ?auto_232313 ) ) ( not ( = ?auto_232302 ?auto_232314 ) ) ( not ( = ?auto_232303 ?auto_232304 ) ) ( not ( = ?auto_232303 ?auto_232305 ) ) ( not ( = ?auto_232303 ?auto_232306 ) ) ( not ( = ?auto_232303 ?auto_232307 ) ) ( not ( = ?auto_232303 ?auto_232308 ) ) ( not ( = ?auto_232303 ?auto_232309 ) ) ( not ( = ?auto_232303 ?auto_232310 ) ) ( not ( = ?auto_232303 ?auto_232311 ) ) ( not ( = ?auto_232303 ?auto_232312 ) ) ( not ( = ?auto_232303 ?auto_232313 ) ) ( not ( = ?auto_232303 ?auto_232314 ) ) ( not ( = ?auto_232304 ?auto_232305 ) ) ( not ( = ?auto_232304 ?auto_232306 ) ) ( not ( = ?auto_232304 ?auto_232307 ) ) ( not ( = ?auto_232304 ?auto_232308 ) ) ( not ( = ?auto_232304 ?auto_232309 ) ) ( not ( = ?auto_232304 ?auto_232310 ) ) ( not ( = ?auto_232304 ?auto_232311 ) ) ( not ( = ?auto_232304 ?auto_232312 ) ) ( not ( = ?auto_232304 ?auto_232313 ) ) ( not ( = ?auto_232304 ?auto_232314 ) ) ( not ( = ?auto_232305 ?auto_232306 ) ) ( not ( = ?auto_232305 ?auto_232307 ) ) ( not ( = ?auto_232305 ?auto_232308 ) ) ( not ( = ?auto_232305 ?auto_232309 ) ) ( not ( = ?auto_232305 ?auto_232310 ) ) ( not ( = ?auto_232305 ?auto_232311 ) ) ( not ( = ?auto_232305 ?auto_232312 ) ) ( not ( = ?auto_232305 ?auto_232313 ) ) ( not ( = ?auto_232305 ?auto_232314 ) ) ( not ( = ?auto_232306 ?auto_232307 ) ) ( not ( = ?auto_232306 ?auto_232308 ) ) ( not ( = ?auto_232306 ?auto_232309 ) ) ( not ( = ?auto_232306 ?auto_232310 ) ) ( not ( = ?auto_232306 ?auto_232311 ) ) ( not ( = ?auto_232306 ?auto_232312 ) ) ( not ( = ?auto_232306 ?auto_232313 ) ) ( not ( = ?auto_232306 ?auto_232314 ) ) ( not ( = ?auto_232307 ?auto_232308 ) ) ( not ( = ?auto_232307 ?auto_232309 ) ) ( not ( = ?auto_232307 ?auto_232310 ) ) ( not ( = ?auto_232307 ?auto_232311 ) ) ( not ( = ?auto_232307 ?auto_232312 ) ) ( not ( = ?auto_232307 ?auto_232313 ) ) ( not ( = ?auto_232307 ?auto_232314 ) ) ( not ( = ?auto_232308 ?auto_232309 ) ) ( not ( = ?auto_232308 ?auto_232310 ) ) ( not ( = ?auto_232308 ?auto_232311 ) ) ( not ( = ?auto_232308 ?auto_232312 ) ) ( not ( = ?auto_232308 ?auto_232313 ) ) ( not ( = ?auto_232308 ?auto_232314 ) ) ( not ( = ?auto_232309 ?auto_232310 ) ) ( not ( = ?auto_232309 ?auto_232311 ) ) ( not ( = ?auto_232309 ?auto_232312 ) ) ( not ( = ?auto_232309 ?auto_232313 ) ) ( not ( = ?auto_232309 ?auto_232314 ) ) ( not ( = ?auto_232310 ?auto_232311 ) ) ( not ( = ?auto_232310 ?auto_232312 ) ) ( not ( = ?auto_232310 ?auto_232313 ) ) ( not ( = ?auto_232310 ?auto_232314 ) ) ( not ( = ?auto_232311 ?auto_232312 ) ) ( not ( = ?auto_232311 ?auto_232313 ) ) ( not ( = ?auto_232311 ?auto_232314 ) ) ( not ( = ?auto_232312 ?auto_232313 ) ) ( not ( = ?auto_232312 ?auto_232314 ) ) ( not ( = ?auto_232313 ?auto_232314 ) ) ( ON ?auto_232312 ?auto_232313 ) ( ON ?auto_232311 ?auto_232312 ) ( ON ?auto_232310 ?auto_232311 ) ( ON ?auto_232309 ?auto_232310 ) ( ON ?auto_232308 ?auto_232309 ) ( ON ?auto_232307 ?auto_232308 ) ( CLEAR ?auto_232305 ) ( ON ?auto_232306 ?auto_232307 ) ( CLEAR ?auto_232306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_232302 ?auto_232303 ?auto_232304 ?auto_232305 ?auto_232306 )
      ( MAKE-12PILE ?auto_232302 ?auto_232303 ?auto_232304 ?auto_232305 ?auto_232306 ?auto_232307 ?auto_232308 ?auto_232309 ?auto_232310 ?auto_232311 ?auto_232312 ?auto_232313 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232327 - BLOCK
      ?auto_232328 - BLOCK
      ?auto_232329 - BLOCK
      ?auto_232330 - BLOCK
      ?auto_232331 - BLOCK
      ?auto_232332 - BLOCK
      ?auto_232333 - BLOCK
      ?auto_232334 - BLOCK
      ?auto_232335 - BLOCK
      ?auto_232336 - BLOCK
      ?auto_232337 - BLOCK
      ?auto_232338 - BLOCK
    )
    :vars
    (
      ?auto_232339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232338 ?auto_232339 ) ( ON-TABLE ?auto_232327 ) ( ON ?auto_232328 ?auto_232327 ) ( ON ?auto_232329 ?auto_232328 ) ( ON ?auto_232330 ?auto_232329 ) ( not ( = ?auto_232327 ?auto_232328 ) ) ( not ( = ?auto_232327 ?auto_232329 ) ) ( not ( = ?auto_232327 ?auto_232330 ) ) ( not ( = ?auto_232327 ?auto_232331 ) ) ( not ( = ?auto_232327 ?auto_232332 ) ) ( not ( = ?auto_232327 ?auto_232333 ) ) ( not ( = ?auto_232327 ?auto_232334 ) ) ( not ( = ?auto_232327 ?auto_232335 ) ) ( not ( = ?auto_232327 ?auto_232336 ) ) ( not ( = ?auto_232327 ?auto_232337 ) ) ( not ( = ?auto_232327 ?auto_232338 ) ) ( not ( = ?auto_232327 ?auto_232339 ) ) ( not ( = ?auto_232328 ?auto_232329 ) ) ( not ( = ?auto_232328 ?auto_232330 ) ) ( not ( = ?auto_232328 ?auto_232331 ) ) ( not ( = ?auto_232328 ?auto_232332 ) ) ( not ( = ?auto_232328 ?auto_232333 ) ) ( not ( = ?auto_232328 ?auto_232334 ) ) ( not ( = ?auto_232328 ?auto_232335 ) ) ( not ( = ?auto_232328 ?auto_232336 ) ) ( not ( = ?auto_232328 ?auto_232337 ) ) ( not ( = ?auto_232328 ?auto_232338 ) ) ( not ( = ?auto_232328 ?auto_232339 ) ) ( not ( = ?auto_232329 ?auto_232330 ) ) ( not ( = ?auto_232329 ?auto_232331 ) ) ( not ( = ?auto_232329 ?auto_232332 ) ) ( not ( = ?auto_232329 ?auto_232333 ) ) ( not ( = ?auto_232329 ?auto_232334 ) ) ( not ( = ?auto_232329 ?auto_232335 ) ) ( not ( = ?auto_232329 ?auto_232336 ) ) ( not ( = ?auto_232329 ?auto_232337 ) ) ( not ( = ?auto_232329 ?auto_232338 ) ) ( not ( = ?auto_232329 ?auto_232339 ) ) ( not ( = ?auto_232330 ?auto_232331 ) ) ( not ( = ?auto_232330 ?auto_232332 ) ) ( not ( = ?auto_232330 ?auto_232333 ) ) ( not ( = ?auto_232330 ?auto_232334 ) ) ( not ( = ?auto_232330 ?auto_232335 ) ) ( not ( = ?auto_232330 ?auto_232336 ) ) ( not ( = ?auto_232330 ?auto_232337 ) ) ( not ( = ?auto_232330 ?auto_232338 ) ) ( not ( = ?auto_232330 ?auto_232339 ) ) ( not ( = ?auto_232331 ?auto_232332 ) ) ( not ( = ?auto_232331 ?auto_232333 ) ) ( not ( = ?auto_232331 ?auto_232334 ) ) ( not ( = ?auto_232331 ?auto_232335 ) ) ( not ( = ?auto_232331 ?auto_232336 ) ) ( not ( = ?auto_232331 ?auto_232337 ) ) ( not ( = ?auto_232331 ?auto_232338 ) ) ( not ( = ?auto_232331 ?auto_232339 ) ) ( not ( = ?auto_232332 ?auto_232333 ) ) ( not ( = ?auto_232332 ?auto_232334 ) ) ( not ( = ?auto_232332 ?auto_232335 ) ) ( not ( = ?auto_232332 ?auto_232336 ) ) ( not ( = ?auto_232332 ?auto_232337 ) ) ( not ( = ?auto_232332 ?auto_232338 ) ) ( not ( = ?auto_232332 ?auto_232339 ) ) ( not ( = ?auto_232333 ?auto_232334 ) ) ( not ( = ?auto_232333 ?auto_232335 ) ) ( not ( = ?auto_232333 ?auto_232336 ) ) ( not ( = ?auto_232333 ?auto_232337 ) ) ( not ( = ?auto_232333 ?auto_232338 ) ) ( not ( = ?auto_232333 ?auto_232339 ) ) ( not ( = ?auto_232334 ?auto_232335 ) ) ( not ( = ?auto_232334 ?auto_232336 ) ) ( not ( = ?auto_232334 ?auto_232337 ) ) ( not ( = ?auto_232334 ?auto_232338 ) ) ( not ( = ?auto_232334 ?auto_232339 ) ) ( not ( = ?auto_232335 ?auto_232336 ) ) ( not ( = ?auto_232335 ?auto_232337 ) ) ( not ( = ?auto_232335 ?auto_232338 ) ) ( not ( = ?auto_232335 ?auto_232339 ) ) ( not ( = ?auto_232336 ?auto_232337 ) ) ( not ( = ?auto_232336 ?auto_232338 ) ) ( not ( = ?auto_232336 ?auto_232339 ) ) ( not ( = ?auto_232337 ?auto_232338 ) ) ( not ( = ?auto_232337 ?auto_232339 ) ) ( not ( = ?auto_232338 ?auto_232339 ) ) ( ON ?auto_232337 ?auto_232338 ) ( ON ?auto_232336 ?auto_232337 ) ( ON ?auto_232335 ?auto_232336 ) ( ON ?auto_232334 ?auto_232335 ) ( ON ?auto_232333 ?auto_232334 ) ( ON ?auto_232332 ?auto_232333 ) ( CLEAR ?auto_232330 ) ( ON ?auto_232331 ?auto_232332 ) ( CLEAR ?auto_232331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_232327 ?auto_232328 ?auto_232329 ?auto_232330 ?auto_232331 )
      ( MAKE-12PILE ?auto_232327 ?auto_232328 ?auto_232329 ?auto_232330 ?auto_232331 ?auto_232332 ?auto_232333 ?auto_232334 ?auto_232335 ?auto_232336 ?auto_232337 ?auto_232338 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232352 - BLOCK
      ?auto_232353 - BLOCK
      ?auto_232354 - BLOCK
      ?auto_232355 - BLOCK
      ?auto_232356 - BLOCK
      ?auto_232357 - BLOCK
      ?auto_232358 - BLOCK
      ?auto_232359 - BLOCK
      ?auto_232360 - BLOCK
      ?auto_232361 - BLOCK
      ?auto_232362 - BLOCK
      ?auto_232363 - BLOCK
    )
    :vars
    (
      ?auto_232364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232363 ?auto_232364 ) ( ON-TABLE ?auto_232352 ) ( ON ?auto_232353 ?auto_232352 ) ( ON ?auto_232354 ?auto_232353 ) ( not ( = ?auto_232352 ?auto_232353 ) ) ( not ( = ?auto_232352 ?auto_232354 ) ) ( not ( = ?auto_232352 ?auto_232355 ) ) ( not ( = ?auto_232352 ?auto_232356 ) ) ( not ( = ?auto_232352 ?auto_232357 ) ) ( not ( = ?auto_232352 ?auto_232358 ) ) ( not ( = ?auto_232352 ?auto_232359 ) ) ( not ( = ?auto_232352 ?auto_232360 ) ) ( not ( = ?auto_232352 ?auto_232361 ) ) ( not ( = ?auto_232352 ?auto_232362 ) ) ( not ( = ?auto_232352 ?auto_232363 ) ) ( not ( = ?auto_232352 ?auto_232364 ) ) ( not ( = ?auto_232353 ?auto_232354 ) ) ( not ( = ?auto_232353 ?auto_232355 ) ) ( not ( = ?auto_232353 ?auto_232356 ) ) ( not ( = ?auto_232353 ?auto_232357 ) ) ( not ( = ?auto_232353 ?auto_232358 ) ) ( not ( = ?auto_232353 ?auto_232359 ) ) ( not ( = ?auto_232353 ?auto_232360 ) ) ( not ( = ?auto_232353 ?auto_232361 ) ) ( not ( = ?auto_232353 ?auto_232362 ) ) ( not ( = ?auto_232353 ?auto_232363 ) ) ( not ( = ?auto_232353 ?auto_232364 ) ) ( not ( = ?auto_232354 ?auto_232355 ) ) ( not ( = ?auto_232354 ?auto_232356 ) ) ( not ( = ?auto_232354 ?auto_232357 ) ) ( not ( = ?auto_232354 ?auto_232358 ) ) ( not ( = ?auto_232354 ?auto_232359 ) ) ( not ( = ?auto_232354 ?auto_232360 ) ) ( not ( = ?auto_232354 ?auto_232361 ) ) ( not ( = ?auto_232354 ?auto_232362 ) ) ( not ( = ?auto_232354 ?auto_232363 ) ) ( not ( = ?auto_232354 ?auto_232364 ) ) ( not ( = ?auto_232355 ?auto_232356 ) ) ( not ( = ?auto_232355 ?auto_232357 ) ) ( not ( = ?auto_232355 ?auto_232358 ) ) ( not ( = ?auto_232355 ?auto_232359 ) ) ( not ( = ?auto_232355 ?auto_232360 ) ) ( not ( = ?auto_232355 ?auto_232361 ) ) ( not ( = ?auto_232355 ?auto_232362 ) ) ( not ( = ?auto_232355 ?auto_232363 ) ) ( not ( = ?auto_232355 ?auto_232364 ) ) ( not ( = ?auto_232356 ?auto_232357 ) ) ( not ( = ?auto_232356 ?auto_232358 ) ) ( not ( = ?auto_232356 ?auto_232359 ) ) ( not ( = ?auto_232356 ?auto_232360 ) ) ( not ( = ?auto_232356 ?auto_232361 ) ) ( not ( = ?auto_232356 ?auto_232362 ) ) ( not ( = ?auto_232356 ?auto_232363 ) ) ( not ( = ?auto_232356 ?auto_232364 ) ) ( not ( = ?auto_232357 ?auto_232358 ) ) ( not ( = ?auto_232357 ?auto_232359 ) ) ( not ( = ?auto_232357 ?auto_232360 ) ) ( not ( = ?auto_232357 ?auto_232361 ) ) ( not ( = ?auto_232357 ?auto_232362 ) ) ( not ( = ?auto_232357 ?auto_232363 ) ) ( not ( = ?auto_232357 ?auto_232364 ) ) ( not ( = ?auto_232358 ?auto_232359 ) ) ( not ( = ?auto_232358 ?auto_232360 ) ) ( not ( = ?auto_232358 ?auto_232361 ) ) ( not ( = ?auto_232358 ?auto_232362 ) ) ( not ( = ?auto_232358 ?auto_232363 ) ) ( not ( = ?auto_232358 ?auto_232364 ) ) ( not ( = ?auto_232359 ?auto_232360 ) ) ( not ( = ?auto_232359 ?auto_232361 ) ) ( not ( = ?auto_232359 ?auto_232362 ) ) ( not ( = ?auto_232359 ?auto_232363 ) ) ( not ( = ?auto_232359 ?auto_232364 ) ) ( not ( = ?auto_232360 ?auto_232361 ) ) ( not ( = ?auto_232360 ?auto_232362 ) ) ( not ( = ?auto_232360 ?auto_232363 ) ) ( not ( = ?auto_232360 ?auto_232364 ) ) ( not ( = ?auto_232361 ?auto_232362 ) ) ( not ( = ?auto_232361 ?auto_232363 ) ) ( not ( = ?auto_232361 ?auto_232364 ) ) ( not ( = ?auto_232362 ?auto_232363 ) ) ( not ( = ?auto_232362 ?auto_232364 ) ) ( not ( = ?auto_232363 ?auto_232364 ) ) ( ON ?auto_232362 ?auto_232363 ) ( ON ?auto_232361 ?auto_232362 ) ( ON ?auto_232360 ?auto_232361 ) ( ON ?auto_232359 ?auto_232360 ) ( ON ?auto_232358 ?auto_232359 ) ( ON ?auto_232357 ?auto_232358 ) ( ON ?auto_232356 ?auto_232357 ) ( CLEAR ?auto_232354 ) ( ON ?auto_232355 ?auto_232356 ) ( CLEAR ?auto_232355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_232352 ?auto_232353 ?auto_232354 ?auto_232355 )
      ( MAKE-12PILE ?auto_232352 ?auto_232353 ?auto_232354 ?auto_232355 ?auto_232356 ?auto_232357 ?auto_232358 ?auto_232359 ?auto_232360 ?auto_232361 ?auto_232362 ?auto_232363 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232377 - BLOCK
      ?auto_232378 - BLOCK
      ?auto_232379 - BLOCK
      ?auto_232380 - BLOCK
      ?auto_232381 - BLOCK
      ?auto_232382 - BLOCK
      ?auto_232383 - BLOCK
      ?auto_232384 - BLOCK
      ?auto_232385 - BLOCK
      ?auto_232386 - BLOCK
      ?auto_232387 - BLOCK
      ?auto_232388 - BLOCK
    )
    :vars
    (
      ?auto_232389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232388 ?auto_232389 ) ( ON-TABLE ?auto_232377 ) ( ON ?auto_232378 ?auto_232377 ) ( ON ?auto_232379 ?auto_232378 ) ( not ( = ?auto_232377 ?auto_232378 ) ) ( not ( = ?auto_232377 ?auto_232379 ) ) ( not ( = ?auto_232377 ?auto_232380 ) ) ( not ( = ?auto_232377 ?auto_232381 ) ) ( not ( = ?auto_232377 ?auto_232382 ) ) ( not ( = ?auto_232377 ?auto_232383 ) ) ( not ( = ?auto_232377 ?auto_232384 ) ) ( not ( = ?auto_232377 ?auto_232385 ) ) ( not ( = ?auto_232377 ?auto_232386 ) ) ( not ( = ?auto_232377 ?auto_232387 ) ) ( not ( = ?auto_232377 ?auto_232388 ) ) ( not ( = ?auto_232377 ?auto_232389 ) ) ( not ( = ?auto_232378 ?auto_232379 ) ) ( not ( = ?auto_232378 ?auto_232380 ) ) ( not ( = ?auto_232378 ?auto_232381 ) ) ( not ( = ?auto_232378 ?auto_232382 ) ) ( not ( = ?auto_232378 ?auto_232383 ) ) ( not ( = ?auto_232378 ?auto_232384 ) ) ( not ( = ?auto_232378 ?auto_232385 ) ) ( not ( = ?auto_232378 ?auto_232386 ) ) ( not ( = ?auto_232378 ?auto_232387 ) ) ( not ( = ?auto_232378 ?auto_232388 ) ) ( not ( = ?auto_232378 ?auto_232389 ) ) ( not ( = ?auto_232379 ?auto_232380 ) ) ( not ( = ?auto_232379 ?auto_232381 ) ) ( not ( = ?auto_232379 ?auto_232382 ) ) ( not ( = ?auto_232379 ?auto_232383 ) ) ( not ( = ?auto_232379 ?auto_232384 ) ) ( not ( = ?auto_232379 ?auto_232385 ) ) ( not ( = ?auto_232379 ?auto_232386 ) ) ( not ( = ?auto_232379 ?auto_232387 ) ) ( not ( = ?auto_232379 ?auto_232388 ) ) ( not ( = ?auto_232379 ?auto_232389 ) ) ( not ( = ?auto_232380 ?auto_232381 ) ) ( not ( = ?auto_232380 ?auto_232382 ) ) ( not ( = ?auto_232380 ?auto_232383 ) ) ( not ( = ?auto_232380 ?auto_232384 ) ) ( not ( = ?auto_232380 ?auto_232385 ) ) ( not ( = ?auto_232380 ?auto_232386 ) ) ( not ( = ?auto_232380 ?auto_232387 ) ) ( not ( = ?auto_232380 ?auto_232388 ) ) ( not ( = ?auto_232380 ?auto_232389 ) ) ( not ( = ?auto_232381 ?auto_232382 ) ) ( not ( = ?auto_232381 ?auto_232383 ) ) ( not ( = ?auto_232381 ?auto_232384 ) ) ( not ( = ?auto_232381 ?auto_232385 ) ) ( not ( = ?auto_232381 ?auto_232386 ) ) ( not ( = ?auto_232381 ?auto_232387 ) ) ( not ( = ?auto_232381 ?auto_232388 ) ) ( not ( = ?auto_232381 ?auto_232389 ) ) ( not ( = ?auto_232382 ?auto_232383 ) ) ( not ( = ?auto_232382 ?auto_232384 ) ) ( not ( = ?auto_232382 ?auto_232385 ) ) ( not ( = ?auto_232382 ?auto_232386 ) ) ( not ( = ?auto_232382 ?auto_232387 ) ) ( not ( = ?auto_232382 ?auto_232388 ) ) ( not ( = ?auto_232382 ?auto_232389 ) ) ( not ( = ?auto_232383 ?auto_232384 ) ) ( not ( = ?auto_232383 ?auto_232385 ) ) ( not ( = ?auto_232383 ?auto_232386 ) ) ( not ( = ?auto_232383 ?auto_232387 ) ) ( not ( = ?auto_232383 ?auto_232388 ) ) ( not ( = ?auto_232383 ?auto_232389 ) ) ( not ( = ?auto_232384 ?auto_232385 ) ) ( not ( = ?auto_232384 ?auto_232386 ) ) ( not ( = ?auto_232384 ?auto_232387 ) ) ( not ( = ?auto_232384 ?auto_232388 ) ) ( not ( = ?auto_232384 ?auto_232389 ) ) ( not ( = ?auto_232385 ?auto_232386 ) ) ( not ( = ?auto_232385 ?auto_232387 ) ) ( not ( = ?auto_232385 ?auto_232388 ) ) ( not ( = ?auto_232385 ?auto_232389 ) ) ( not ( = ?auto_232386 ?auto_232387 ) ) ( not ( = ?auto_232386 ?auto_232388 ) ) ( not ( = ?auto_232386 ?auto_232389 ) ) ( not ( = ?auto_232387 ?auto_232388 ) ) ( not ( = ?auto_232387 ?auto_232389 ) ) ( not ( = ?auto_232388 ?auto_232389 ) ) ( ON ?auto_232387 ?auto_232388 ) ( ON ?auto_232386 ?auto_232387 ) ( ON ?auto_232385 ?auto_232386 ) ( ON ?auto_232384 ?auto_232385 ) ( ON ?auto_232383 ?auto_232384 ) ( ON ?auto_232382 ?auto_232383 ) ( ON ?auto_232381 ?auto_232382 ) ( CLEAR ?auto_232379 ) ( ON ?auto_232380 ?auto_232381 ) ( CLEAR ?auto_232380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_232377 ?auto_232378 ?auto_232379 ?auto_232380 )
      ( MAKE-12PILE ?auto_232377 ?auto_232378 ?auto_232379 ?auto_232380 ?auto_232381 ?auto_232382 ?auto_232383 ?auto_232384 ?auto_232385 ?auto_232386 ?auto_232387 ?auto_232388 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232402 - BLOCK
      ?auto_232403 - BLOCK
      ?auto_232404 - BLOCK
      ?auto_232405 - BLOCK
      ?auto_232406 - BLOCK
      ?auto_232407 - BLOCK
      ?auto_232408 - BLOCK
      ?auto_232409 - BLOCK
      ?auto_232410 - BLOCK
      ?auto_232411 - BLOCK
      ?auto_232412 - BLOCK
      ?auto_232413 - BLOCK
    )
    :vars
    (
      ?auto_232414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232413 ?auto_232414 ) ( ON-TABLE ?auto_232402 ) ( ON ?auto_232403 ?auto_232402 ) ( not ( = ?auto_232402 ?auto_232403 ) ) ( not ( = ?auto_232402 ?auto_232404 ) ) ( not ( = ?auto_232402 ?auto_232405 ) ) ( not ( = ?auto_232402 ?auto_232406 ) ) ( not ( = ?auto_232402 ?auto_232407 ) ) ( not ( = ?auto_232402 ?auto_232408 ) ) ( not ( = ?auto_232402 ?auto_232409 ) ) ( not ( = ?auto_232402 ?auto_232410 ) ) ( not ( = ?auto_232402 ?auto_232411 ) ) ( not ( = ?auto_232402 ?auto_232412 ) ) ( not ( = ?auto_232402 ?auto_232413 ) ) ( not ( = ?auto_232402 ?auto_232414 ) ) ( not ( = ?auto_232403 ?auto_232404 ) ) ( not ( = ?auto_232403 ?auto_232405 ) ) ( not ( = ?auto_232403 ?auto_232406 ) ) ( not ( = ?auto_232403 ?auto_232407 ) ) ( not ( = ?auto_232403 ?auto_232408 ) ) ( not ( = ?auto_232403 ?auto_232409 ) ) ( not ( = ?auto_232403 ?auto_232410 ) ) ( not ( = ?auto_232403 ?auto_232411 ) ) ( not ( = ?auto_232403 ?auto_232412 ) ) ( not ( = ?auto_232403 ?auto_232413 ) ) ( not ( = ?auto_232403 ?auto_232414 ) ) ( not ( = ?auto_232404 ?auto_232405 ) ) ( not ( = ?auto_232404 ?auto_232406 ) ) ( not ( = ?auto_232404 ?auto_232407 ) ) ( not ( = ?auto_232404 ?auto_232408 ) ) ( not ( = ?auto_232404 ?auto_232409 ) ) ( not ( = ?auto_232404 ?auto_232410 ) ) ( not ( = ?auto_232404 ?auto_232411 ) ) ( not ( = ?auto_232404 ?auto_232412 ) ) ( not ( = ?auto_232404 ?auto_232413 ) ) ( not ( = ?auto_232404 ?auto_232414 ) ) ( not ( = ?auto_232405 ?auto_232406 ) ) ( not ( = ?auto_232405 ?auto_232407 ) ) ( not ( = ?auto_232405 ?auto_232408 ) ) ( not ( = ?auto_232405 ?auto_232409 ) ) ( not ( = ?auto_232405 ?auto_232410 ) ) ( not ( = ?auto_232405 ?auto_232411 ) ) ( not ( = ?auto_232405 ?auto_232412 ) ) ( not ( = ?auto_232405 ?auto_232413 ) ) ( not ( = ?auto_232405 ?auto_232414 ) ) ( not ( = ?auto_232406 ?auto_232407 ) ) ( not ( = ?auto_232406 ?auto_232408 ) ) ( not ( = ?auto_232406 ?auto_232409 ) ) ( not ( = ?auto_232406 ?auto_232410 ) ) ( not ( = ?auto_232406 ?auto_232411 ) ) ( not ( = ?auto_232406 ?auto_232412 ) ) ( not ( = ?auto_232406 ?auto_232413 ) ) ( not ( = ?auto_232406 ?auto_232414 ) ) ( not ( = ?auto_232407 ?auto_232408 ) ) ( not ( = ?auto_232407 ?auto_232409 ) ) ( not ( = ?auto_232407 ?auto_232410 ) ) ( not ( = ?auto_232407 ?auto_232411 ) ) ( not ( = ?auto_232407 ?auto_232412 ) ) ( not ( = ?auto_232407 ?auto_232413 ) ) ( not ( = ?auto_232407 ?auto_232414 ) ) ( not ( = ?auto_232408 ?auto_232409 ) ) ( not ( = ?auto_232408 ?auto_232410 ) ) ( not ( = ?auto_232408 ?auto_232411 ) ) ( not ( = ?auto_232408 ?auto_232412 ) ) ( not ( = ?auto_232408 ?auto_232413 ) ) ( not ( = ?auto_232408 ?auto_232414 ) ) ( not ( = ?auto_232409 ?auto_232410 ) ) ( not ( = ?auto_232409 ?auto_232411 ) ) ( not ( = ?auto_232409 ?auto_232412 ) ) ( not ( = ?auto_232409 ?auto_232413 ) ) ( not ( = ?auto_232409 ?auto_232414 ) ) ( not ( = ?auto_232410 ?auto_232411 ) ) ( not ( = ?auto_232410 ?auto_232412 ) ) ( not ( = ?auto_232410 ?auto_232413 ) ) ( not ( = ?auto_232410 ?auto_232414 ) ) ( not ( = ?auto_232411 ?auto_232412 ) ) ( not ( = ?auto_232411 ?auto_232413 ) ) ( not ( = ?auto_232411 ?auto_232414 ) ) ( not ( = ?auto_232412 ?auto_232413 ) ) ( not ( = ?auto_232412 ?auto_232414 ) ) ( not ( = ?auto_232413 ?auto_232414 ) ) ( ON ?auto_232412 ?auto_232413 ) ( ON ?auto_232411 ?auto_232412 ) ( ON ?auto_232410 ?auto_232411 ) ( ON ?auto_232409 ?auto_232410 ) ( ON ?auto_232408 ?auto_232409 ) ( ON ?auto_232407 ?auto_232408 ) ( ON ?auto_232406 ?auto_232407 ) ( ON ?auto_232405 ?auto_232406 ) ( CLEAR ?auto_232403 ) ( ON ?auto_232404 ?auto_232405 ) ( CLEAR ?auto_232404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_232402 ?auto_232403 ?auto_232404 )
      ( MAKE-12PILE ?auto_232402 ?auto_232403 ?auto_232404 ?auto_232405 ?auto_232406 ?auto_232407 ?auto_232408 ?auto_232409 ?auto_232410 ?auto_232411 ?auto_232412 ?auto_232413 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232427 - BLOCK
      ?auto_232428 - BLOCK
      ?auto_232429 - BLOCK
      ?auto_232430 - BLOCK
      ?auto_232431 - BLOCK
      ?auto_232432 - BLOCK
      ?auto_232433 - BLOCK
      ?auto_232434 - BLOCK
      ?auto_232435 - BLOCK
      ?auto_232436 - BLOCK
      ?auto_232437 - BLOCK
      ?auto_232438 - BLOCK
    )
    :vars
    (
      ?auto_232439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232438 ?auto_232439 ) ( ON-TABLE ?auto_232427 ) ( ON ?auto_232428 ?auto_232427 ) ( not ( = ?auto_232427 ?auto_232428 ) ) ( not ( = ?auto_232427 ?auto_232429 ) ) ( not ( = ?auto_232427 ?auto_232430 ) ) ( not ( = ?auto_232427 ?auto_232431 ) ) ( not ( = ?auto_232427 ?auto_232432 ) ) ( not ( = ?auto_232427 ?auto_232433 ) ) ( not ( = ?auto_232427 ?auto_232434 ) ) ( not ( = ?auto_232427 ?auto_232435 ) ) ( not ( = ?auto_232427 ?auto_232436 ) ) ( not ( = ?auto_232427 ?auto_232437 ) ) ( not ( = ?auto_232427 ?auto_232438 ) ) ( not ( = ?auto_232427 ?auto_232439 ) ) ( not ( = ?auto_232428 ?auto_232429 ) ) ( not ( = ?auto_232428 ?auto_232430 ) ) ( not ( = ?auto_232428 ?auto_232431 ) ) ( not ( = ?auto_232428 ?auto_232432 ) ) ( not ( = ?auto_232428 ?auto_232433 ) ) ( not ( = ?auto_232428 ?auto_232434 ) ) ( not ( = ?auto_232428 ?auto_232435 ) ) ( not ( = ?auto_232428 ?auto_232436 ) ) ( not ( = ?auto_232428 ?auto_232437 ) ) ( not ( = ?auto_232428 ?auto_232438 ) ) ( not ( = ?auto_232428 ?auto_232439 ) ) ( not ( = ?auto_232429 ?auto_232430 ) ) ( not ( = ?auto_232429 ?auto_232431 ) ) ( not ( = ?auto_232429 ?auto_232432 ) ) ( not ( = ?auto_232429 ?auto_232433 ) ) ( not ( = ?auto_232429 ?auto_232434 ) ) ( not ( = ?auto_232429 ?auto_232435 ) ) ( not ( = ?auto_232429 ?auto_232436 ) ) ( not ( = ?auto_232429 ?auto_232437 ) ) ( not ( = ?auto_232429 ?auto_232438 ) ) ( not ( = ?auto_232429 ?auto_232439 ) ) ( not ( = ?auto_232430 ?auto_232431 ) ) ( not ( = ?auto_232430 ?auto_232432 ) ) ( not ( = ?auto_232430 ?auto_232433 ) ) ( not ( = ?auto_232430 ?auto_232434 ) ) ( not ( = ?auto_232430 ?auto_232435 ) ) ( not ( = ?auto_232430 ?auto_232436 ) ) ( not ( = ?auto_232430 ?auto_232437 ) ) ( not ( = ?auto_232430 ?auto_232438 ) ) ( not ( = ?auto_232430 ?auto_232439 ) ) ( not ( = ?auto_232431 ?auto_232432 ) ) ( not ( = ?auto_232431 ?auto_232433 ) ) ( not ( = ?auto_232431 ?auto_232434 ) ) ( not ( = ?auto_232431 ?auto_232435 ) ) ( not ( = ?auto_232431 ?auto_232436 ) ) ( not ( = ?auto_232431 ?auto_232437 ) ) ( not ( = ?auto_232431 ?auto_232438 ) ) ( not ( = ?auto_232431 ?auto_232439 ) ) ( not ( = ?auto_232432 ?auto_232433 ) ) ( not ( = ?auto_232432 ?auto_232434 ) ) ( not ( = ?auto_232432 ?auto_232435 ) ) ( not ( = ?auto_232432 ?auto_232436 ) ) ( not ( = ?auto_232432 ?auto_232437 ) ) ( not ( = ?auto_232432 ?auto_232438 ) ) ( not ( = ?auto_232432 ?auto_232439 ) ) ( not ( = ?auto_232433 ?auto_232434 ) ) ( not ( = ?auto_232433 ?auto_232435 ) ) ( not ( = ?auto_232433 ?auto_232436 ) ) ( not ( = ?auto_232433 ?auto_232437 ) ) ( not ( = ?auto_232433 ?auto_232438 ) ) ( not ( = ?auto_232433 ?auto_232439 ) ) ( not ( = ?auto_232434 ?auto_232435 ) ) ( not ( = ?auto_232434 ?auto_232436 ) ) ( not ( = ?auto_232434 ?auto_232437 ) ) ( not ( = ?auto_232434 ?auto_232438 ) ) ( not ( = ?auto_232434 ?auto_232439 ) ) ( not ( = ?auto_232435 ?auto_232436 ) ) ( not ( = ?auto_232435 ?auto_232437 ) ) ( not ( = ?auto_232435 ?auto_232438 ) ) ( not ( = ?auto_232435 ?auto_232439 ) ) ( not ( = ?auto_232436 ?auto_232437 ) ) ( not ( = ?auto_232436 ?auto_232438 ) ) ( not ( = ?auto_232436 ?auto_232439 ) ) ( not ( = ?auto_232437 ?auto_232438 ) ) ( not ( = ?auto_232437 ?auto_232439 ) ) ( not ( = ?auto_232438 ?auto_232439 ) ) ( ON ?auto_232437 ?auto_232438 ) ( ON ?auto_232436 ?auto_232437 ) ( ON ?auto_232435 ?auto_232436 ) ( ON ?auto_232434 ?auto_232435 ) ( ON ?auto_232433 ?auto_232434 ) ( ON ?auto_232432 ?auto_232433 ) ( ON ?auto_232431 ?auto_232432 ) ( ON ?auto_232430 ?auto_232431 ) ( CLEAR ?auto_232428 ) ( ON ?auto_232429 ?auto_232430 ) ( CLEAR ?auto_232429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_232427 ?auto_232428 ?auto_232429 )
      ( MAKE-12PILE ?auto_232427 ?auto_232428 ?auto_232429 ?auto_232430 ?auto_232431 ?auto_232432 ?auto_232433 ?auto_232434 ?auto_232435 ?auto_232436 ?auto_232437 ?auto_232438 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232452 - BLOCK
      ?auto_232453 - BLOCK
      ?auto_232454 - BLOCK
      ?auto_232455 - BLOCK
      ?auto_232456 - BLOCK
      ?auto_232457 - BLOCK
      ?auto_232458 - BLOCK
      ?auto_232459 - BLOCK
      ?auto_232460 - BLOCK
      ?auto_232461 - BLOCK
      ?auto_232462 - BLOCK
      ?auto_232463 - BLOCK
    )
    :vars
    (
      ?auto_232464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232463 ?auto_232464 ) ( ON-TABLE ?auto_232452 ) ( not ( = ?auto_232452 ?auto_232453 ) ) ( not ( = ?auto_232452 ?auto_232454 ) ) ( not ( = ?auto_232452 ?auto_232455 ) ) ( not ( = ?auto_232452 ?auto_232456 ) ) ( not ( = ?auto_232452 ?auto_232457 ) ) ( not ( = ?auto_232452 ?auto_232458 ) ) ( not ( = ?auto_232452 ?auto_232459 ) ) ( not ( = ?auto_232452 ?auto_232460 ) ) ( not ( = ?auto_232452 ?auto_232461 ) ) ( not ( = ?auto_232452 ?auto_232462 ) ) ( not ( = ?auto_232452 ?auto_232463 ) ) ( not ( = ?auto_232452 ?auto_232464 ) ) ( not ( = ?auto_232453 ?auto_232454 ) ) ( not ( = ?auto_232453 ?auto_232455 ) ) ( not ( = ?auto_232453 ?auto_232456 ) ) ( not ( = ?auto_232453 ?auto_232457 ) ) ( not ( = ?auto_232453 ?auto_232458 ) ) ( not ( = ?auto_232453 ?auto_232459 ) ) ( not ( = ?auto_232453 ?auto_232460 ) ) ( not ( = ?auto_232453 ?auto_232461 ) ) ( not ( = ?auto_232453 ?auto_232462 ) ) ( not ( = ?auto_232453 ?auto_232463 ) ) ( not ( = ?auto_232453 ?auto_232464 ) ) ( not ( = ?auto_232454 ?auto_232455 ) ) ( not ( = ?auto_232454 ?auto_232456 ) ) ( not ( = ?auto_232454 ?auto_232457 ) ) ( not ( = ?auto_232454 ?auto_232458 ) ) ( not ( = ?auto_232454 ?auto_232459 ) ) ( not ( = ?auto_232454 ?auto_232460 ) ) ( not ( = ?auto_232454 ?auto_232461 ) ) ( not ( = ?auto_232454 ?auto_232462 ) ) ( not ( = ?auto_232454 ?auto_232463 ) ) ( not ( = ?auto_232454 ?auto_232464 ) ) ( not ( = ?auto_232455 ?auto_232456 ) ) ( not ( = ?auto_232455 ?auto_232457 ) ) ( not ( = ?auto_232455 ?auto_232458 ) ) ( not ( = ?auto_232455 ?auto_232459 ) ) ( not ( = ?auto_232455 ?auto_232460 ) ) ( not ( = ?auto_232455 ?auto_232461 ) ) ( not ( = ?auto_232455 ?auto_232462 ) ) ( not ( = ?auto_232455 ?auto_232463 ) ) ( not ( = ?auto_232455 ?auto_232464 ) ) ( not ( = ?auto_232456 ?auto_232457 ) ) ( not ( = ?auto_232456 ?auto_232458 ) ) ( not ( = ?auto_232456 ?auto_232459 ) ) ( not ( = ?auto_232456 ?auto_232460 ) ) ( not ( = ?auto_232456 ?auto_232461 ) ) ( not ( = ?auto_232456 ?auto_232462 ) ) ( not ( = ?auto_232456 ?auto_232463 ) ) ( not ( = ?auto_232456 ?auto_232464 ) ) ( not ( = ?auto_232457 ?auto_232458 ) ) ( not ( = ?auto_232457 ?auto_232459 ) ) ( not ( = ?auto_232457 ?auto_232460 ) ) ( not ( = ?auto_232457 ?auto_232461 ) ) ( not ( = ?auto_232457 ?auto_232462 ) ) ( not ( = ?auto_232457 ?auto_232463 ) ) ( not ( = ?auto_232457 ?auto_232464 ) ) ( not ( = ?auto_232458 ?auto_232459 ) ) ( not ( = ?auto_232458 ?auto_232460 ) ) ( not ( = ?auto_232458 ?auto_232461 ) ) ( not ( = ?auto_232458 ?auto_232462 ) ) ( not ( = ?auto_232458 ?auto_232463 ) ) ( not ( = ?auto_232458 ?auto_232464 ) ) ( not ( = ?auto_232459 ?auto_232460 ) ) ( not ( = ?auto_232459 ?auto_232461 ) ) ( not ( = ?auto_232459 ?auto_232462 ) ) ( not ( = ?auto_232459 ?auto_232463 ) ) ( not ( = ?auto_232459 ?auto_232464 ) ) ( not ( = ?auto_232460 ?auto_232461 ) ) ( not ( = ?auto_232460 ?auto_232462 ) ) ( not ( = ?auto_232460 ?auto_232463 ) ) ( not ( = ?auto_232460 ?auto_232464 ) ) ( not ( = ?auto_232461 ?auto_232462 ) ) ( not ( = ?auto_232461 ?auto_232463 ) ) ( not ( = ?auto_232461 ?auto_232464 ) ) ( not ( = ?auto_232462 ?auto_232463 ) ) ( not ( = ?auto_232462 ?auto_232464 ) ) ( not ( = ?auto_232463 ?auto_232464 ) ) ( ON ?auto_232462 ?auto_232463 ) ( ON ?auto_232461 ?auto_232462 ) ( ON ?auto_232460 ?auto_232461 ) ( ON ?auto_232459 ?auto_232460 ) ( ON ?auto_232458 ?auto_232459 ) ( ON ?auto_232457 ?auto_232458 ) ( ON ?auto_232456 ?auto_232457 ) ( ON ?auto_232455 ?auto_232456 ) ( ON ?auto_232454 ?auto_232455 ) ( CLEAR ?auto_232452 ) ( ON ?auto_232453 ?auto_232454 ) ( CLEAR ?auto_232453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_232452 ?auto_232453 )
      ( MAKE-12PILE ?auto_232452 ?auto_232453 ?auto_232454 ?auto_232455 ?auto_232456 ?auto_232457 ?auto_232458 ?auto_232459 ?auto_232460 ?auto_232461 ?auto_232462 ?auto_232463 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232477 - BLOCK
      ?auto_232478 - BLOCK
      ?auto_232479 - BLOCK
      ?auto_232480 - BLOCK
      ?auto_232481 - BLOCK
      ?auto_232482 - BLOCK
      ?auto_232483 - BLOCK
      ?auto_232484 - BLOCK
      ?auto_232485 - BLOCK
      ?auto_232486 - BLOCK
      ?auto_232487 - BLOCK
      ?auto_232488 - BLOCK
    )
    :vars
    (
      ?auto_232489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232488 ?auto_232489 ) ( ON-TABLE ?auto_232477 ) ( not ( = ?auto_232477 ?auto_232478 ) ) ( not ( = ?auto_232477 ?auto_232479 ) ) ( not ( = ?auto_232477 ?auto_232480 ) ) ( not ( = ?auto_232477 ?auto_232481 ) ) ( not ( = ?auto_232477 ?auto_232482 ) ) ( not ( = ?auto_232477 ?auto_232483 ) ) ( not ( = ?auto_232477 ?auto_232484 ) ) ( not ( = ?auto_232477 ?auto_232485 ) ) ( not ( = ?auto_232477 ?auto_232486 ) ) ( not ( = ?auto_232477 ?auto_232487 ) ) ( not ( = ?auto_232477 ?auto_232488 ) ) ( not ( = ?auto_232477 ?auto_232489 ) ) ( not ( = ?auto_232478 ?auto_232479 ) ) ( not ( = ?auto_232478 ?auto_232480 ) ) ( not ( = ?auto_232478 ?auto_232481 ) ) ( not ( = ?auto_232478 ?auto_232482 ) ) ( not ( = ?auto_232478 ?auto_232483 ) ) ( not ( = ?auto_232478 ?auto_232484 ) ) ( not ( = ?auto_232478 ?auto_232485 ) ) ( not ( = ?auto_232478 ?auto_232486 ) ) ( not ( = ?auto_232478 ?auto_232487 ) ) ( not ( = ?auto_232478 ?auto_232488 ) ) ( not ( = ?auto_232478 ?auto_232489 ) ) ( not ( = ?auto_232479 ?auto_232480 ) ) ( not ( = ?auto_232479 ?auto_232481 ) ) ( not ( = ?auto_232479 ?auto_232482 ) ) ( not ( = ?auto_232479 ?auto_232483 ) ) ( not ( = ?auto_232479 ?auto_232484 ) ) ( not ( = ?auto_232479 ?auto_232485 ) ) ( not ( = ?auto_232479 ?auto_232486 ) ) ( not ( = ?auto_232479 ?auto_232487 ) ) ( not ( = ?auto_232479 ?auto_232488 ) ) ( not ( = ?auto_232479 ?auto_232489 ) ) ( not ( = ?auto_232480 ?auto_232481 ) ) ( not ( = ?auto_232480 ?auto_232482 ) ) ( not ( = ?auto_232480 ?auto_232483 ) ) ( not ( = ?auto_232480 ?auto_232484 ) ) ( not ( = ?auto_232480 ?auto_232485 ) ) ( not ( = ?auto_232480 ?auto_232486 ) ) ( not ( = ?auto_232480 ?auto_232487 ) ) ( not ( = ?auto_232480 ?auto_232488 ) ) ( not ( = ?auto_232480 ?auto_232489 ) ) ( not ( = ?auto_232481 ?auto_232482 ) ) ( not ( = ?auto_232481 ?auto_232483 ) ) ( not ( = ?auto_232481 ?auto_232484 ) ) ( not ( = ?auto_232481 ?auto_232485 ) ) ( not ( = ?auto_232481 ?auto_232486 ) ) ( not ( = ?auto_232481 ?auto_232487 ) ) ( not ( = ?auto_232481 ?auto_232488 ) ) ( not ( = ?auto_232481 ?auto_232489 ) ) ( not ( = ?auto_232482 ?auto_232483 ) ) ( not ( = ?auto_232482 ?auto_232484 ) ) ( not ( = ?auto_232482 ?auto_232485 ) ) ( not ( = ?auto_232482 ?auto_232486 ) ) ( not ( = ?auto_232482 ?auto_232487 ) ) ( not ( = ?auto_232482 ?auto_232488 ) ) ( not ( = ?auto_232482 ?auto_232489 ) ) ( not ( = ?auto_232483 ?auto_232484 ) ) ( not ( = ?auto_232483 ?auto_232485 ) ) ( not ( = ?auto_232483 ?auto_232486 ) ) ( not ( = ?auto_232483 ?auto_232487 ) ) ( not ( = ?auto_232483 ?auto_232488 ) ) ( not ( = ?auto_232483 ?auto_232489 ) ) ( not ( = ?auto_232484 ?auto_232485 ) ) ( not ( = ?auto_232484 ?auto_232486 ) ) ( not ( = ?auto_232484 ?auto_232487 ) ) ( not ( = ?auto_232484 ?auto_232488 ) ) ( not ( = ?auto_232484 ?auto_232489 ) ) ( not ( = ?auto_232485 ?auto_232486 ) ) ( not ( = ?auto_232485 ?auto_232487 ) ) ( not ( = ?auto_232485 ?auto_232488 ) ) ( not ( = ?auto_232485 ?auto_232489 ) ) ( not ( = ?auto_232486 ?auto_232487 ) ) ( not ( = ?auto_232486 ?auto_232488 ) ) ( not ( = ?auto_232486 ?auto_232489 ) ) ( not ( = ?auto_232487 ?auto_232488 ) ) ( not ( = ?auto_232487 ?auto_232489 ) ) ( not ( = ?auto_232488 ?auto_232489 ) ) ( ON ?auto_232487 ?auto_232488 ) ( ON ?auto_232486 ?auto_232487 ) ( ON ?auto_232485 ?auto_232486 ) ( ON ?auto_232484 ?auto_232485 ) ( ON ?auto_232483 ?auto_232484 ) ( ON ?auto_232482 ?auto_232483 ) ( ON ?auto_232481 ?auto_232482 ) ( ON ?auto_232480 ?auto_232481 ) ( ON ?auto_232479 ?auto_232480 ) ( CLEAR ?auto_232477 ) ( ON ?auto_232478 ?auto_232479 ) ( CLEAR ?auto_232478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_232477 ?auto_232478 )
      ( MAKE-12PILE ?auto_232477 ?auto_232478 ?auto_232479 ?auto_232480 ?auto_232481 ?auto_232482 ?auto_232483 ?auto_232484 ?auto_232485 ?auto_232486 ?auto_232487 ?auto_232488 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232502 - BLOCK
      ?auto_232503 - BLOCK
      ?auto_232504 - BLOCK
      ?auto_232505 - BLOCK
      ?auto_232506 - BLOCK
      ?auto_232507 - BLOCK
      ?auto_232508 - BLOCK
      ?auto_232509 - BLOCK
      ?auto_232510 - BLOCK
      ?auto_232511 - BLOCK
      ?auto_232512 - BLOCK
      ?auto_232513 - BLOCK
    )
    :vars
    (
      ?auto_232514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232513 ?auto_232514 ) ( not ( = ?auto_232502 ?auto_232503 ) ) ( not ( = ?auto_232502 ?auto_232504 ) ) ( not ( = ?auto_232502 ?auto_232505 ) ) ( not ( = ?auto_232502 ?auto_232506 ) ) ( not ( = ?auto_232502 ?auto_232507 ) ) ( not ( = ?auto_232502 ?auto_232508 ) ) ( not ( = ?auto_232502 ?auto_232509 ) ) ( not ( = ?auto_232502 ?auto_232510 ) ) ( not ( = ?auto_232502 ?auto_232511 ) ) ( not ( = ?auto_232502 ?auto_232512 ) ) ( not ( = ?auto_232502 ?auto_232513 ) ) ( not ( = ?auto_232502 ?auto_232514 ) ) ( not ( = ?auto_232503 ?auto_232504 ) ) ( not ( = ?auto_232503 ?auto_232505 ) ) ( not ( = ?auto_232503 ?auto_232506 ) ) ( not ( = ?auto_232503 ?auto_232507 ) ) ( not ( = ?auto_232503 ?auto_232508 ) ) ( not ( = ?auto_232503 ?auto_232509 ) ) ( not ( = ?auto_232503 ?auto_232510 ) ) ( not ( = ?auto_232503 ?auto_232511 ) ) ( not ( = ?auto_232503 ?auto_232512 ) ) ( not ( = ?auto_232503 ?auto_232513 ) ) ( not ( = ?auto_232503 ?auto_232514 ) ) ( not ( = ?auto_232504 ?auto_232505 ) ) ( not ( = ?auto_232504 ?auto_232506 ) ) ( not ( = ?auto_232504 ?auto_232507 ) ) ( not ( = ?auto_232504 ?auto_232508 ) ) ( not ( = ?auto_232504 ?auto_232509 ) ) ( not ( = ?auto_232504 ?auto_232510 ) ) ( not ( = ?auto_232504 ?auto_232511 ) ) ( not ( = ?auto_232504 ?auto_232512 ) ) ( not ( = ?auto_232504 ?auto_232513 ) ) ( not ( = ?auto_232504 ?auto_232514 ) ) ( not ( = ?auto_232505 ?auto_232506 ) ) ( not ( = ?auto_232505 ?auto_232507 ) ) ( not ( = ?auto_232505 ?auto_232508 ) ) ( not ( = ?auto_232505 ?auto_232509 ) ) ( not ( = ?auto_232505 ?auto_232510 ) ) ( not ( = ?auto_232505 ?auto_232511 ) ) ( not ( = ?auto_232505 ?auto_232512 ) ) ( not ( = ?auto_232505 ?auto_232513 ) ) ( not ( = ?auto_232505 ?auto_232514 ) ) ( not ( = ?auto_232506 ?auto_232507 ) ) ( not ( = ?auto_232506 ?auto_232508 ) ) ( not ( = ?auto_232506 ?auto_232509 ) ) ( not ( = ?auto_232506 ?auto_232510 ) ) ( not ( = ?auto_232506 ?auto_232511 ) ) ( not ( = ?auto_232506 ?auto_232512 ) ) ( not ( = ?auto_232506 ?auto_232513 ) ) ( not ( = ?auto_232506 ?auto_232514 ) ) ( not ( = ?auto_232507 ?auto_232508 ) ) ( not ( = ?auto_232507 ?auto_232509 ) ) ( not ( = ?auto_232507 ?auto_232510 ) ) ( not ( = ?auto_232507 ?auto_232511 ) ) ( not ( = ?auto_232507 ?auto_232512 ) ) ( not ( = ?auto_232507 ?auto_232513 ) ) ( not ( = ?auto_232507 ?auto_232514 ) ) ( not ( = ?auto_232508 ?auto_232509 ) ) ( not ( = ?auto_232508 ?auto_232510 ) ) ( not ( = ?auto_232508 ?auto_232511 ) ) ( not ( = ?auto_232508 ?auto_232512 ) ) ( not ( = ?auto_232508 ?auto_232513 ) ) ( not ( = ?auto_232508 ?auto_232514 ) ) ( not ( = ?auto_232509 ?auto_232510 ) ) ( not ( = ?auto_232509 ?auto_232511 ) ) ( not ( = ?auto_232509 ?auto_232512 ) ) ( not ( = ?auto_232509 ?auto_232513 ) ) ( not ( = ?auto_232509 ?auto_232514 ) ) ( not ( = ?auto_232510 ?auto_232511 ) ) ( not ( = ?auto_232510 ?auto_232512 ) ) ( not ( = ?auto_232510 ?auto_232513 ) ) ( not ( = ?auto_232510 ?auto_232514 ) ) ( not ( = ?auto_232511 ?auto_232512 ) ) ( not ( = ?auto_232511 ?auto_232513 ) ) ( not ( = ?auto_232511 ?auto_232514 ) ) ( not ( = ?auto_232512 ?auto_232513 ) ) ( not ( = ?auto_232512 ?auto_232514 ) ) ( not ( = ?auto_232513 ?auto_232514 ) ) ( ON ?auto_232512 ?auto_232513 ) ( ON ?auto_232511 ?auto_232512 ) ( ON ?auto_232510 ?auto_232511 ) ( ON ?auto_232509 ?auto_232510 ) ( ON ?auto_232508 ?auto_232509 ) ( ON ?auto_232507 ?auto_232508 ) ( ON ?auto_232506 ?auto_232507 ) ( ON ?auto_232505 ?auto_232506 ) ( ON ?auto_232504 ?auto_232505 ) ( ON ?auto_232503 ?auto_232504 ) ( ON ?auto_232502 ?auto_232503 ) ( CLEAR ?auto_232502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_232502 )
      ( MAKE-12PILE ?auto_232502 ?auto_232503 ?auto_232504 ?auto_232505 ?auto_232506 ?auto_232507 ?auto_232508 ?auto_232509 ?auto_232510 ?auto_232511 ?auto_232512 ?auto_232513 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_232527 - BLOCK
      ?auto_232528 - BLOCK
      ?auto_232529 - BLOCK
      ?auto_232530 - BLOCK
      ?auto_232531 - BLOCK
      ?auto_232532 - BLOCK
      ?auto_232533 - BLOCK
      ?auto_232534 - BLOCK
      ?auto_232535 - BLOCK
      ?auto_232536 - BLOCK
      ?auto_232537 - BLOCK
      ?auto_232538 - BLOCK
    )
    :vars
    (
      ?auto_232539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232538 ?auto_232539 ) ( not ( = ?auto_232527 ?auto_232528 ) ) ( not ( = ?auto_232527 ?auto_232529 ) ) ( not ( = ?auto_232527 ?auto_232530 ) ) ( not ( = ?auto_232527 ?auto_232531 ) ) ( not ( = ?auto_232527 ?auto_232532 ) ) ( not ( = ?auto_232527 ?auto_232533 ) ) ( not ( = ?auto_232527 ?auto_232534 ) ) ( not ( = ?auto_232527 ?auto_232535 ) ) ( not ( = ?auto_232527 ?auto_232536 ) ) ( not ( = ?auto_232527 ?auto_232537 ) ) ( not ( = ?auto_232527 ?auto_232538 ) ) ( not ( = ?auto_232527 ?auto_232539 ) ) ( not ( = ?auto_232528 ?auto_232529 ) ) ( not ( = ?auto_232528 ?auto_232530 ) ) ( not ( = ?auto_232528 ?auto_232531 ) ) ( not ( = ?auto_232528 ?auto_232532 ) ) ( not ( = ?auto_232528 ?auto_232533 ) ) ( not ( = ?auto_232528 ?auto_232534 ) ) ( not ( = ?auto_232528 ?auto_232535 ) ) ( not ( = ?auto_232528 ?auto_232536 ) ) ( not ( = ?auto_232528 ?auto_232537 ) ) ( not ( = ?auto_232528 ?auto_232538 ) ) ( not ( = ?auto_232528 ?auto_232539 ) ) ( not ( = ?auto_232529 ?auto_232530 ) ) ( not ( = ?auto_232529 ?auto_232531 ) ) ( not ( = ?auto_232529 ?auto_232532 ) ) ( not ( = ?auto_232529 ?auto_232533 ) ) ( not ( = ?auto_232529 ?auto_232534 ) ) ( not ( = ?auto_232529 ?auto_232535 ) ) ( not ( = ?auto_232529 ?auto_232536 ) ) ( not ( = ?auto_232529 ?auto_232537 ) ) ( not ( = ?auto_232529 ?auto_232538 ) ) ( not ( = ?auto_232529 ?auto_232539 ) ) ( not ( = ?auto_232530 ?auto_232531 ) ) ( not ( = ?auto_232530 ?auto_232532 ) ) ( not ( = ?auto_232530 ?auto_232533 ) ) ( not ( = ?auto_232530 ?auto_232534 ) ) ( not ( = ?auto_232530 ?auto_232535 ) ) ( not ( = ?auto_232530 ?auto_232536 ) ) ( not ( = ?auto_232530 ?auto_232537 ) ) ( not ( = ?auto_232530 ?auto_232538 ) ) ( not ( = ?auto_232530 ?auto_232539 ) ) ( not ( = ?auto_232531 ?auto_232532 ) ) ( not ( = ?auto_232531 ?auto_232533 ) ) ( not ( = ?auto_232531 ?auto_232534 ) ) ( not ( = ?auto_232531 ?auto_232535 ) ) ( not ( = ?auto_232531 ?auto_232536 ) ) ( not ( = ?auto_232531 ?auto_232537 ) ) ( not ( = ?auto_232531 ?auto_232538 ) ) ( not ( = ?auto_232531 ?auto_232539 ) ) ( not ( = ?auto_232532 ?auto_232533 ) ) ( not ( = ?auto_232532 ?auto_232534 ) ) ( not ( = ?auto_232532 ?auto_232535 ) ) ( not ( = ?auto_232532 ?auto_232536 ) ) ( not ( = ?auto_232532 ?auto_232537 ) ) ( not ( = ?auto_232532 ?auto_232538 ) ) ( not ( = ?auto_232532 ?auto_232539 ) ) ( not ( = ?auto_232533 ?auto_232534 ) ) ( not ( = ?auto_232533 ?auto_232535 ) ) ( not ( = ?auto_232533 ?auto_232536 ) ) ( not ( = ?auto_232533 ?auto_232537 ) ) ( not ( = ?auto_232533 ?auto_232538 ) ) ( not ( = ?auto_232533 ?auto_232539 ) ) ( not ( = ?auto_232534 ?auto_232535 ) ) ( not ( = ?auto_232534 ?auto_232536 ) ) ( not ( = ?auto_232534 ?auto_232537 ) ) ( not ( = ?auto_232534 ?auto_232538 ) ) ( not ( = ?auto_232534 ?auto_232539 ) ) ( not ( = ?auto_232535 ?auto_232536 ) ) ( not ( = ?auto_232535 ?auto_232537 ) ) ( not ( = ?auto_232535 ?auto_232538 ) ) ( not ( = ?auto_232535 ?auto_232539 ) ) ( not ( = ?auto_232536 ?auto_232537 ) ) ( not ( = ?auto_232536 ?auto_232538 ) ) ( not ( = ?auto_232536 ?auto_232539 ) ) ( not ( = ?auto_232537 ?auto_232538 ) ) ( not ( = ?auto_232537 ?auto_232539 ) ) ( not ( = ?auto_232538 ?auto_232539 ) ) ( ON ?auto_232537 ?auto_232538 ) ( ON ?auto_232536 ?auto_232537 ) ( ON ?auto_232535 ?auto_232536 ) ( ON ?auto_232534 ?auto_232535 ) ( ON ?auto_232533 ?auto_232534 ) ( ON ?auto_232532 ?auto_232533 ) ( ON ?auto_232531 ?auto_232532 ) ( ON ?auto_232530 ?auto_232531 ) ( ON ?auto_232529 ?auto_232530 ) ( ON ?auto_232528 ?auto_232529 ) ( ON ?auto_232527 ?auto_232528 ) ( CLEAR ?auto_232527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_232527 )
      ( MAKE-12PILE ?auto_232527 ?auto_232528 ?auto_232529 ?auto_232530 ?auto_232531 ?auto_232532 ?auto_232533 ?auto_232534 ?auto_232535 ?auto_232536 ?auto_232537 ?auto_232538 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232553 - BLOCK
      ?auto_232554 - BLOCK
      ?auto_232555 - BLOCK
      ?auto_232556 - BLOCK
      ?auto_232557 - BLOCK
      ?auto_232558 - BLOCK
      ?auto_232559 - BLOCK
      ?auto_232560 - BLOCK
      ?auto_232561 - BLOCK
      ?auto_232562 - BLOCK
      ?auto_232563 - BLOCK
      ?auto_232564 - BLOCK
      ?auto_232565 - BLOCK
    )
    :vars
    (
      ?auto_232566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_232564 ) ( ON ?auto_232565 ?auto_232566 ) ( CLEAR ?auto_232565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_232553 ) ( ON ?auto_232554 ?auto_232553 ) ( ON ?auto_232555 ?auto_232554 ) ( ON ?auto_232556 ?auto_232555 ) ( ON ?auto_232557 ?auto_232556 ) ( ON ?auto_232558 ?auto_232557 ) ( ON ?auto_232559 ?auto_232558 ) ( ON ?auto_232560 ?auto_232559 ) ( ON ?auto_232561 ?auto_232560 ) ( ON ?auto_232562 ?auto_232561 ) ( ON ?auto_232563 ?auto_232562 ) ( ON ?auto_232564 ?auto_232563 ) ( not ( = ?auto_232553 ?auto_232554 ) ) ( not ( = ?auto_232553 ?auto_232555 ) ) ( not ( = ?auto_232553 ?auto_232556 ) ) ( not ( = ?auto_232553 ?auto_232557 ) ) ( not ( = ?auto_232553 ?auto_232558 ) ) ( not ( = ?auto_232553 ?auto_232559 ) ) ( not ( = ?auto_232553 ?auto_232560 ) ) ( not ( = ?auto_232553 ?auto_232561 ) ) ( not ( = ?auto_232553 ?auto_232562 ) ) ( not ( = ?auto_232553 ?auto_232563 ) ) ( not ( = ?auto_232553 ?auto_232564 ) ) ( not ( = ?auto_232553 ?auto_232565 ) ) ( not ( = ?auto_232553 ?auto_232566 ) ) ( not ( = ?auto_232554 ?auto_232555 ) ) ( not ( = ?auto_232554 ?auto_232556 ) ) ( not ( = ?auto_232554 ?auto_232557 ) ) ( not ( = ?auto_232554 ?auto_232558 ) ) ( not ( = ?auto_232554 ?auto_232559 ) ) ( not ( = ?auto_232554 ?auto_232560 ) ) ( not ( = ?auto_232554 ?auto_232561 ) ) ( not ( = ?auto_232554 ?auto_232562 ) ) ( not ( = ?auto_232554 ?auto_232563 ) ) ( not ( = ?auto_232554 ?auto_232564 ) ) ( not ( = ?auto_232554 ?auto_232565 ) ) ( not ( = ?auto_232554 ?auto_232566 ) ) ( not ( = ?auto_232555 ?auto_232556 ) ) ( not ( = ?auto_232555 ?auto_232557 ) ) ( not ( = ?auto_232555 ?auto_232558 ) ) ( not ( = ?auto_232555 ?auto_232559 ) ) ( not ( = ?auto_232555 ?auto_232560 ) ) ( not ( = ?auto_232555 ?auto_232561 ) ) ( not ( = ?auto_232555 ?auto_232562 ) ) ( not ( = ?auto_232555 ?auto_232563 ) ) ( not ( = ?auto_232555 ?auto_232564 ) ) ( not ( = ?auto_232555 ?auto_232565 ) ) ( not ( = ?auto_232555 ?auto_232566 ) ) ( not ( = ?auto_232556 ?auto_232557 ) ) ( not ( = ?auto_232556 ?auto_232558 ) ) ( not ( = ?auto_232556 ?auto_232559 ) ) ( not ( = ?auto_232556 ?auto_232560 ) ) ( not ( = ?auto_232556 ?auto_232561 ) ) ( not ( = ?auto_232556 ?auto_232562 ) ) ( not ( = ?auto_232556 ?auto_232563 ) ) ( not ( = ?auto_232556 ?auto_232564 ) ) ( not ( = ?auto_232556 ?auto_232565 ) ) ( not ( = ?auto_232556 ?auto_232566 ) ) ( not ( = ?auto_232557 ?auto_232558 ) ) ( not ( = ?auto_232557 ?auto_232559 ) ) ( not ( = ?auto_232557 ?auto_232560 ) ) ( not ( = ?auto_232557 ?auto_232561 ) ) ( not ( = ?auto_232557 ?auto_232562 ) ) ( not ( = ?auto_232557 ?auto_232563 ) ) ( not ( = ?auto_232557 ?auto_232564 ) ) ( not ( = ?auto_232557 ?auto_232565 ) ) ( not ( = ?auto_232557 ?auto_232566 ) ) ( not ( = ?auto_232558 ?auto_232559 ) ) ( not ( = ?auto_232558 ?auto_232560 ) ) ( not ( = ?auto_232558 ?auto_232561 ) ) ( not ( = ?auto_232558 ?auto_232562 ) ) ( not ( = ?auto_232558 ?auto_232563 ) ) ( not ( = ?auto_232558 ?auto_232564 ) ) ( not ( = ?auto_232558 ?auto_232565 ) ) ( not ( = ?auto_232558 ?auto_232566 ) ) ( not ( = ?auto_232559 ?auto_232560 ) ) ( not ( = ?auto_232559 ?auto_232561 ) ) ( not ( = ?auto_232559 ?auto_232562 ) ) ( not ( = ?auto_232559 ?auto_232563 ) ) ( not ( = ?auto_232559 ?auto_232564 ) ) ( not ( = ?auto_232559 ?auto_232565 ) ) ( not ( = ?auto_232559 ?auto_232566 ) ) ( not ( = ?auto_232560 ?auto_232561 ) ) ( not ( = ?auto_232560 ?auto_232562 ) ) ( not ( = ?auto_232560 ?auto_232563 ) ) ( not ( = ?auto_232560 ?auto_232564 ) ) ( not ( = ?auto_232560 ?auto_232565 ) ) ( not ( = ?auto_232560 ?auto_232566 ) ) ( not ( = ?auto_232561 ?auto_232562 ) ) ( not ( = ?auto_232561 ?auto_232563 ) ) ( not ( = ?auto_232561 ?auto_232564 ) ) ( not ( = ?auto_232561 ?auto_232565 ) ) ( not ( = ?auto_232561 ?auto_232566 ) ) ( not ( = ?auto_232562 ?auto_232563 ) ) ( not ( = ?auto_232562 ?auto_232564 ) ) ( not ( = ?auto_232562 ?auto_232565 ) ) ( not ( = ?auto_232562 ?auto_232566 ) ) ( not ( = ?auto_232563 ?auto_232564 ) ) ( not ( = ?auto_232563 ?auto_232565 ) ) ( not ( = ?auto_232563 ?auto_232566 ) ) ( not ( = ?auto_232564 ?auto_232565 ) ) ( not ( = ?auto_232564 ?auto_232566 ) ) ( not ( = ?auto_232565 ?auto_232566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_232565 ?auto_232566 )
      ( !STACK ?auto_232565 ?auto_232564 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232580 - BLOCK
      ?auto_232581 - BLOCK
      ?auto_232582 - BLOCK
      ?auto_232583 - BLOCK
      ?auto_232584 - BLOCK
      ?auto_232585 - BLOCK
      ?auto_232586 - BLOCK
      ?auto_232587 - BLOCK
      ?auto_232588 - BLOCK
      ?auto_232589 - BLOCK
      ?auto_232590 - BLOCK
      ?auto_232591 - BLOCK
      ?auto_232592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_232591 ) ( ON-TABLE ?auto_232592 ) ( CLEAR ?auto_232592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_232580 ) ( ON ?auto_232581 ?auto_232580 ) ( ON ?auto_232582 ?auto_232581 ) ( ON ?auto_232583 ?auto_232582 ) ( ON ?auto_232584 ?auto_232583 ) ( ON ?auto_232585 ?auto_232584 ) ( ON ?auto_232586 ?auto_232585 ) ( ON ?auto_232587 ?auto_232586 ) ( ON ?auto_232588 ?auto_232587 ) ( ON ?auto_232589 ?auto_232588 ) ( ON ?auto_232590 ?auto_232589 ) ( ON ?auto_232591 ?auto_232590 ) ( not ( = ?auto_232580 ?auto_232581 ) ) ( not ( = ?auto_232580 ?auto_232582 ) ) ( not ( = ?auto_232580 ?auto_232583 ) ) ( not ( = ?auto_232580 ?auto_232584 ) ) ( not ( = ?auto_232580 ?auto_232585 ) ) ( not ( = ?auto_232580 ?auto_232586 ) ) ( not ( = ?auto_232580 ?auto_232587 ) ) ( not ( = ?auto_232580 ?auto_232588 ) ) ( not ( = ?auto_232580 ?auto_232589 ) ) ( not ( = ?auto_232580 ?auto_232590 ) ) ( not ( = ?auto_232580 ?auto_232591 ) ) ( not ( = ?auto_232580 ?auto_232592 ) ) ( not ( = ?auto_232581 ?auto_232582 ) ) ( not ( = ?auto_232581 ?auto_232583 ) ) ( not ( = ?auto_232581 ?auto_232584 ) ) ( not ( = ?auto_232581 ?auto_232585 ) ) ( not ( = ?auto_232581 ?auto_232586 ) ) ( not ( = ?auto_232581 ?auto_232587 ) ) ( not ( = ?auto_232581 ?auto_232588 ) ) ( not ( = ?auto_232581 ?auto_232589 ) ) ( not ( = ?auto_232581 ?auto_232590 ) ) ( not ( = ?auto_232581 ?auto_232591 ) ) ( not ( = ?auto_232581 ?auto_232592 ) ) ( not ( = ?auto_232582 ?auto_232583 ) ) ( not ( = ?auto_232582 ?auto_232584 ) ) ( not ( = ?auto_232582 ?auto_232585 ) ) ( not ( = ?auto_232582 ?auto_232586 ) ) ( not ( = ?auto_232582 ?auto_232587 ) ) ( not ( = ?auto_232582 ?auto_232588 ) ) ( not ( = ?auto_232582 ?auto_232589 ) ) ( not ( = ?auto_232582 ?auto_232590 ) ) ( not ( = ?auto_232582 ?auto_232591 ) ) ( not ( = ?auto_232582 ?auto_232592 ) ) ( not ( = ?auto_232583 ?auto_232584 ) ) ( not ( = ?auto_232583 ?auto_232585 ) ) ( not ( = ?auto_232583 ?auto_232586 ) ) ( not ( = ?auto_232583 ?auto_232587 ) ) ( not ( = ?auto_232583 ?auto_232588 ) ) ( not ( = ?auto_232583 ?auto_232589 ) ) ( not ( = ?auto_232583 ?auto_232590 ) ) ( not ( = ?auto_232583 ?auto_232591 ) ) ( not ( = ?auto_232583 ?auto_232592 ) ) ( not ( = ?auto_232584 ?auto_232585 ) ) ( not ( = ?auto_232584 ?auto_232586 ) ) ( not ( = ?auto_232584 ?auto_232587 ) ) ( not ( = ?auto_232584 ?auto_232588 ) ) ( not ( = ?auto_232584 ?auto_232589 ) ) ( not ( = ?auto_232584 ?auto_232590 ) ) ( not ( = ?auto_232584 ?auto_232591 ) ) ( not ( = ?auto_232584 ?auto_232592 ) ) ( not ( = ?auto_232585 ?auto_232586 ) ) ( not ( = ?auto_232585 ?auto_232587 ) ) ( not ( = ?auto_232585 ?auto_232588 ) ) ( not ( = ?auto_232585 ?auto_232589 ) ) ( not ( = ?auto_232585 ?auto_232590 ) ) ( not ( = ?auto_232585 ?auto_232591 ) ) ( not ( = ?auto_232585 ?auto_232592 ) ) ( not ( = ?auto_232586 ?auto_232587 ) ) ( not ( = ?auto_232586 ?auto_232588 ) ) ( not ( = ?auto_232586 ?auto_232589 ) ) ( not ( = ?auto_232586 ?auto_232590 ) ) ( not ( = ?auto_232586 ?auto_232591 ) ) ( not ( = ?auto_232586 ?auto_232592 ) ) ( not ( = ?auto_232587 ?auto_232588 ) ) ( not ( = ?auto_232587 ?auto_232589 ) ) ( not ( = ?auto_232587 ?auto_232590 ) ) ( not ( = ?auto_232587 ?auto_232591 ) ) ( not ( = ?auto_232587 ?auto_232592 ) ) ( not ( = ?auto_232588 ?auto_232589 ) ) ( not ( = ?auto_232588 ?auto_232590 ) ) ( not ( = ?auto_232588 ?auto_232591 ) ) ( not ( = ?auto_232588 ?auto_232592 ) ) ( not ( = ?auto_232589 ?auto_232590 ) ) ( not ( = ?auto_232589 ?auto_232591 ) ) ( not ( = ?auto_232589 ?auto_232592 ) ) ( not ( = ?auto_232590 ?auto_232591 ) ) ( not ( = ?auto_232590 ?auto_232592 ) ) ( not ( = ?auto_232591 ?auto_232592 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_232592 )
      ( !STACK ?auto_232592 ?auto_232591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232606 - BLOCK
      ?auto_232607 - BLOCK
      ?auto_232608 - BLOCK
      ?auto_232609 - BLOCK
      ?auto_232610 - BLOCK
      ?auto_232611 - BLOCK
      ?auto_232612 - BLOCK
      ?auto_232613 - BLOCK
      ?auto_232614 - BLOCK
      ?auto_232615 - BLOCK
      ?auto_232616 - BLOCK
      ?auto_232617 - BLOCK
      ?auto_232618 - BLOCK
    )
    :vars
    (
      ?auto_232619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232618 ?auto_232619 ) ( ON-TABLE ?auto_232606 ) ( ON ?auto_232607 ?auto_232606 ) ( ON ?auto_232608 ?auto_232607 ) ( ON ?auto_232609 ?auto_232608 ) ( ON ?auto_232610 ?auto_232609 ) ( ON ?auto_232611 ?auto_232610 ) ( ON ?auto_232612 ?auto_232611 ) ( ON ?auto_232613 ?auto_232612 ) ( ON ?auto_232614 ?auto_232613 ) ( ON ?auto_232615 ?auto_232614 ) ( ON ?auto_232616 ?auto_232615 ) ( not ( = ?auto_232606 ?auto_232607 ) ) ( not ( = ?auto_232606 ?auto_232608 ) ) ( not ( = ?auto_232606 ?auto_232609 ) ) ( not ( = ?auto_232606 ?auto_232610 ) ) ( not ( = ?auto_232606 ?auto_232611 ) ) ( not ( = ?auto_232606 ?auto_232612 ) ) ( not ( = ?auto_232606 ?auto_232613 ) ) ( not ( = ?auto_232606 ?auto_232614 ) ) ( not ( = ?auto_232606 ?auto_232615 ) ) ( not ( = ?auto_232606 ?auto_232616 ) ) ( not ( = ?auto_232606 ?auto_232617 ) ) ( not ( = ?auto_232606 ?auto_232618 ) ) ( not ( = ?auto_232606 ?auto_232619 ) ) ( not ( = ?auto_232607 ?auto_232608 ) ) ( not ( = ?auto_232607 ?auto_232609 ) ) ( not ( = ?auto_232607 ?auto_232610 ) ) ( not ( = ?auto_232607 ?auto_232611 ) ) ( not ( = ?auto_232607 ?auto_232612 ) ) ( not ( = ?auto_232607 ?auto_232613 ) ) ( not ( = ?auto_232607 ?auto_232614 ) ) ( not ( = ?auto_232607 ?auto_232615 ) ) ( not ( = ?auto_232607 ?auto_232616 ) ) ( not ( = ?auto_232607 ?auto_232617 ) ) ( not ( = ?auto_232607 ?auto_232618 ) ) ( not ( = ?auto_232607 ?auto_232619 ) ) ( not ( = ?auto_232608 ?auto_232609 ) ) ( not ( = ?auto_232608 ?auto_232610 ) ) ( not ( = ?auto_232608 ?auto_232611 ) ) ( not ( = ?auto_232608 ?auto_232612 ) ) ( not ( = ?auto_232608 ?auto_232613 ) ) ( not ( = ?auto_232608 ?auto_232614 ) ) ( not ( = ?auto_232608 ?auto_232615 ) ) ( not ( = ?auto_232608 ?auto_232616 ) ) ( not ( = ?auto_232608 ?auto_232617 ) ) ( not ( = ?auto_232608 ?auto_232618 ) ) ( not ( = ?auto_232608 ?auto_232619 ) ) ( not ( = ?auto_232609 ?auto_232610 ) ) ( not ( = ?auto_232609 ?auto_232611 ) ) ( not ( = ?auto_232609 ?auto_232612 ) ) ( not ( = ?auto_232609 ?auto_232613 ) ) ( not ( = ?auto_232609 ?auto_232614 ) ) ( not ( = ?auto_232609 ?auto_232615 ) ) ( not ( = ?auto_232609 ?auto_232616 ) ) ( not ( = ?auto_232609 ?auto_232617 ) ) ( not ( = ?auto_232609 ?auto_232618 ) ) ( not ( = ?auto_232609 ?auto_232619 ) ) ( not ( = ?auto_232610 ?auto_232611 ) ) ( not ( = ?auto_232610 ?auto_232612 ) ) ( not ( = ?auto_232610 ?auto_232613 ) ) ( not ( = ?auto_232610 ?auto_232614 ) ) ( not ( = ?auto_232610 ?auto_232615 ) ) ( not ( = ?auto_232610 ?auto_232616 ) ) ( not ( = ?auto_232610 ?auto_232617 ) ) ( not ( = ?auto_232610 ?auto_232618 ) ) ( not ( = ?auto_232610 ?auto_232619 ) ) ( not ( = ?auto_232611 ?auto_232612 ) ) ( not ( = ?auto_232611 ?auto_232613 ) ) ( not ( = ?auto_232611 ?auto_232614 ) ) ( not ( = ?auto_232611 ?auto_232615 ) ) ( not ( = ?auto_232611 ?auto_232616 ) ) ( not ( = ?auto_232611 ?auto_232617 ) ) ( not ( = ?auto_232611 ?auto_232618 ) ) ( not ( = ?auto_232611 ?auto_232619 ) ) ( not ( = ?auto_232612 ?auto_232613 ) ) ( not ( = ?auto_232612 ?auto_232614 ) ) ( not ( = ?auto_232612 ?auto_232615 ) ) ( not ( = ?auto_232612 ?auto_232616 ) ) ( not ( = ?auto_232612 ?auto_232617 ) ) ( not ( = ?auto_232612 ?auto_232618 ) ) ( not ( = ?auto_232612 ?auto_232619 ) ) ( not ( = ?auto_232613 ?auto_232614 ) ) ( not ( = ?auto_232613 ?auto_232615 ) ) ( not ( = ?auto_232613 ?auto_232616 ) ) ( not ( = ?auto_232613 ?auto_232617 ) ) ( not ( = ?auto_232613 ?auto_232618 ) ) ( not ( = ?auto_232613 ?auto_232619 ) ) ( not ( = ?auto_232614 ?auto_232615 ) ) ( not ( = ?auto_232614 ?auto_232616 ) ) ( not ( = ?auto_232614 ?auto_232617 ) ) ( not ( = ?auto_232614 ?auto_232618 ) ) ( not ( = ?auto_232614 ?auto_232619 ) ) ( not ( = ?auto_232615 ?auto_232616 ) ) ( not ( = ?auto_232615 ?auto_232617 ) ) ( not ( = ?auto_232615 ?auto_232618 ) ) ( not ( = ?auto_232615 ?auto_232619 ) ) ( not ( = ?auto_232616 ?auto_232617 ) ) ( not ( = ?auto_232616 ?auto_232618 ) ) ( not ( = ?auto_232616 ?auto_232619 ) ) ( not ( = ?auto_232617 ?auto_232618 ) ) ( not ( = ?auto_232617 ?auto_232619 ) ) ( not ( = ?auto_232618 ?auto_232619 ) ) ( CLEAR ?auto_232616 ) ( ON ?auto_232617 ?auto_232618 ) ( CLEAR ?auto_232617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_232606 ?auto_232607 ?auto_232608 ?auto_232609 ?auto_232610 ?auto_232611 ?auto_232612 ?auto_232613 ?auto_232614 ?auto_232615 ?auto_232616 ?auto_232617 )
      ( MAKE-13PILE ?auto_232606 ?auto_232607 ?auto_232608 ?auto_232609 ?auto_232610 ?auto_232611 ?auto_232612 ?auto_232613 ?auto_232614 ?auto_232615 ?auto_232616 ?auto_232617 ?auto_232618 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232633 - BLOCK
      ?auto_232634 - BLOCK
      ?auto_232635 - BLOCK
      ?auto_232636 - BLOCK
      ?auto_232637 - BLOCK
      ?auto_232638 - BLOCK
      ?auto_232639 - BLOCK
      ?auto_232640 - BLOCK
      ?auto_232641 - BLOCK
      ?auto_232642 - BLOCK
      ?auto_232643 - BLOCK
      ?auto_232644 - BLOCK
      ?auto_232645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_232645 ) ( ON-TABLE ?auto_232633 ) ( ON ?auto_232634 ?auto_232633 ) ( ON ?auto_232635 ?auto_232634 ) ( ON ?auto_232636 ?auto_232635 ) ( ON ?auto_232637 ?auto_232636 ) ( ON ?auto_232638 ?auto_232637 ) ( ON ?auto_232639 ?auto_232638 ) ( ON ?auto_232640 ?auto_232639 ) ( ON ?auto_232641 ?auto_232640 ) ( ON ?auto_232642 ?auto_232641 ) ( ON ?auto_232643 ?auto_232642 ) ( not ( = ?auto_232633 ?auto_232634 ) ) ( not ( = ?auto_232633 ?auto_232635 ) ) ( not ( = ?auto_232633 ?auto_232636 ) ) ( not ( = ?auto_232633 ?auto_232637 ) ) ( not ( = ?auto_232633 ?auto_232638 ) ) ( not ( = ?auto_232633 ?auto_232639 ) ) ( not ( = ?auto_232633 ?auto_232640 ) ) ( not ( = ?auto_232633 ?auto_232641 ) ) ( not ( = ?auto_232633 ?auto_232642 ) ) ( not ( = ?auto_232633 ?auto_232643 ) ) ( not ( = ?auto_232633 ?auto_232644 ) ) ( not ( = ?auto_232633 ?auto_232645 ) ) ( not ( = ?auto_232634 ?auto_232635 ) ) ( not ( = ?auto_232634 ?auto_232636 ) ) ( not ( = ?auto_232634 ?auto_232637 ) ) ( not ( = ?auto_232634 ?auto_232638 ) ) ( not ( = ?auto_232634 ?auto_232639 ) ) ( not ( = ?auto_232634 ?auto_232640 ) ) ( not ( = ?auto_232634 ?auto_232641 ) ) ( not ( = ?auto_232634 ?auto_232642 ) ) ( not ( = ?auto_232634 ?auto_232643 ) ) ( not ( = ?auto_232634 ?auto_232644 ) ) ( not ( = ?auto_232634 ?auto_232645 ) ) ( not ( = ?auto_232635 ?auto_232636 ) ) ( not ( = ?auto_232635 ?auto_232637 ) ) ( not ( = ?auto_232635 ?auto_232638 ) ) ( not ( = ?auto_232635 ?auto_232639 ) ) ( not ( = ?auto_232635 ?auto_232640 ) ) ( not ( = ?auto_232635 ?auto_232641 ) ) ( not ( = ?auto_232635 ?auto_232642 ) ) ( not ( = ?auto_232635 ?auto_232643 ) ) ( not ( = ?auto_232635 ?auto_232644 ) ) ( not ( = ?auto_232635 ?auto_232645 ) ) ( not ( = ?auto_232636 ?auto_232637 ) ) ( not ( = ?auto_232636 ?auto_232638 ) ) ( not ( = ?auto_232636 ?auto_232639 ) ) ( not ( = ?auto_232636 ?auto_232640 ) ) ( not ( = ?auto_232636 ?auto_232641 ) ) ( not ( = ?auto_232636 ?auto_232642 ) ) ( not ( = ?auto_232636 ?auto_232643 ) ) ( not ( = ?auto_232636 ?auto_232644 ) ) ( not ( = ?auto_232636 ?auto_232645 ) ) ( not ( = ?auto_232637 ?auto_232638 ) ) ( not ( = ?auto_232637 ?auto_232639 ) ) ( not ( = ?auto_232637 ?auto_232640 ) ) ( not ( = ?auto_232637 ?auto_232641 ) ) ( not ( = ?auto_232637 ?auto_232642 ) ) ( not ( = ?auto_232637 ?auto_232643 ) ) ( not ( = ?auto_232637 ?auto_232644 ) ) ( not ( = ?auto_232637 ?auto_232645 ) ) ( not ( = ?auto_232638 ?auto_232639 ) ) ( not ( = ?auto_232638 ?auto_232640 ) ) ( not ( = ?auto_232638 ?auto_232641 ) ) ( not ( = ?auto_232638 ?auto_232642 ) ) ( not ( = ?auto_232638 ?auto_232643 ) ) ( not ( = ?auto_232638 ?auto_232644 ) ) ( not ( = ?auto_232638 ?auto_232645 ) ) ( not ( = ?auto_232639 ?auto_232640 ) ) ( not ( = ?auto_232639 ?auto_232641 ) ) ( not ( = ?auto_232639 ?auto_232642 ) ) ( not ( = ?auto_232639 ?auto_232643 ) ) ( not ( = ?auto_232639 ?auto_232644 ) ) ( not ( = ?auto_232639 ?auto_232645 ) ) ( not ( = ?auto_232640 ?auto_232641 ) ) ( not ( = ?auto_232640 ?auto_232642 ) ) ( not ( = ?auto_232640 ?auto_232643 ) ) ( not ( = ?auto_232640 ?auto_232644 ) ) ( not ( = ?auto_232640 ?auto_232645 ) ) ( not ( = ?auto_232641 ?auto_232642 ) ) ( not ( = ?auto_232641 ?auto_232643 ) ) ( not ( = ?auto_232641 ?auto_232644 ) ) ( not ( = ?auto_232641 ?auto_232645 ) ) ( not ( = ?auto_232642 ?auto_232643 ) ) ( not ( = ?auto_232642 ?auto_232644 ) ) ( not ( = ?auto_232642 ?auto_232645 ) ) ( not ( = ?auto_232643 ?auto_232644 ) ) ( not ( = ?auto_232643 ?auto_232645 ) ) ( not ( = ?auto_232644 ?auto_232645 ) ) ( CLEAR ?auto_232643 ) ( ON ?auto_232644 ?auto_232645 ) ( CLEAR ?auto_232644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_232633 ?auto_232634 ?auto_232635 ?auto_232636 ?auto_232637 ?auto_232638 ?auto_232639 ?auto_232640 ?auto_232641 ?auto_232642 ?auto_232643 ?auto_232644 )
      ( MAKE-13PILE ?auto_232633 ?auto_232634 ?auto_232635 ?auto_232636 ?auto_232637 ?auto_232638 ?auto_232639 ?auto_232640 ?auto_232641 ?auto_232642 ?auto_232643 ?auto_232644 ?auto_232645 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232659 - BLOCK
      ?auto_232660 - BLOCK
      ?auto_232661 - BLOCK
      ?auto_232662 - BLOCK
      ?auto_232663 - BLOCK
      ?auto_232664 - BLOCK
      ?auto_232665 - BLOCK
      ?auto_232666 - BLOCK
      ?auto_232667 - BLOCK
      ?auto_232668 - BLOCK
      ?auto_232669 - BLOCK
      ?auto_232670 - BLOCK
      ?auto_232671 - BLOCK
    )
    :vars
    (
      ?auto_232672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232671 ?auto_232672 ) ( ON-TABLE ?auto_232659 ) ( ON ?auto_232660 ?auto_232659 ) ( ON ?auto_232661 ?auto_232660 ) ( ON ?auto_232662 ?auto_232661 ) ( ON ?auto_232663 ?auto_232662 ) ( ON ?auto_232664 ?auto_232663 ) ( ON ?auto_232665 ?auto_232664 ) ( ON ?auto_232666 ?auto_232665 ) ( ON ?auto_232667 ?auto_232666 ) ( ON ?auto_232668 ?auto_232667 ) ( not ( = ?auto_232659 ?auto_232660 ) ) ( not ( = ?auto_232659 ?auto_232661 ) ) ( not ( = ?auto_232659 ?auto_232662 ) ) ( not ( = ?auto_232659 ?auto_232663 ) ) ( not ( = ?auto_232659 ?auto_232664 ) ) ( not ( = ?auto_232659 ?auto_232665 ) ) ( not ( = ?auto_232659 ?auto_232666 ) ) ( not ( = ?auto_232659 ?auto_232667 ) ) ( not ( = ?auto_232659 ?auto_232668 ) ) ( not ( = ?auto_232659 ?auto_232669 ) ) ( not ( = ?auto_232659 ?auto_232670 ) ) ( not ( = ?auto_232659 ?auto_232671 ) ) ( not ( = ?auto_232659 ?auto_232672 ) ) ( not ( = ?auto_232660 ?auto_232661 ) ) ( not ( = ?auto_232660 ?auto_232662 ) ) ( not ( = ?auto_232660 ?auto_232663 ) ) ( not ( = ?auto_232660 ?auto_232664 ) ) ( not ( = ?auto_232660 ?auto_232665 ) ) ( not ( = ?auto_232660 ?auto_232666 ) ) ( not ( = ?auto_232660 ?auto_232667 ) ) ( not ( = ?auto_232660 ?auto_232668 ) ) ( not ( = ?auto_232660 ?auto_232669 ) ) ( not ( = ?auto_232660 ?auto_232670 ) ) ( not ( = ?auto_232660 ?auto_232671 ) ) ( not ( = ?auto_232660 ?auto_232672 ) ) ( not ( = ?auto_232661 ?auto_232662 ) ) ( not ( = ?auto_232661 ?auto_232663 ) ) ( not ( = ?auto_232661 ?auto_232664 ) ) ( not ( = ?auto_232661 ?auto_232665 ) ) ( not ( = ?auto_232661 ?auto_232666 ) ) ( not ( = ?auto_232661 ?auto_232667 ) ) ( not ( = ?auto_232661 ?auto_232668 ) ) ( not ( = ?auto_232661 ?auto_232669 ) ) ( not ( = ?auto_232661 ?auto_232670 ) ) ( not ( = ?auto_232661 ?auto_232671 ) ) ( not ( = ?auto_232661 ?auto_232672 ) ) ( not ( = ?auto_232662 ?auto_232663 ) ) ( not ( = ?auto_232662 ?auto_232664 ) ) ( not ( = ?auto_232662 ?auto_232665 ) ) ( not ( = ?auto_232662 ?auto_232666 ) ) ( not ( = ?auto_232662 ?auto_232667 ) ) ( not ( = ?auto_232662 ?auto_232668 ) ) ( not ( = ?auto_232662 ?auto_232669 ) ) ( not ( = ?auto_232662 ?auto_232670 ) ) ( not ( = ?auto_232662 ?auto_232671 ) ) ( not ( = ?auto_232662 ?auto_232672 ) ) ( not ( = ?auto_232663 ?auto_232664 ) ) ( not ( = ?auto_232663 ?auto_232665 ) ) ( not ( = ?auto_232663 ?auto_232666 ) ) ( not ( = ?auto_232663 ?auto_232667 ) ) ( not ( = ?auto_232663 ?auto_232668 ) ) ( not ( = ?auto_232663 ?auto_232669 ) ) ( not ( = ?auto_232663 ?auto_232670 ) ) ( not ( = ?auto_232663 ?auto_232671 ) ) ( not ( = ?auto_232663 ?auto_232672 ) ) ( not ( = ?auto_232664 ?auto_232665 ) ) ( not ( = ?auto_232664 ?auto_232666 ) ) ( not ( = ?auto_232664 ?auto_232667 ) ) ( not ( = ?auto_232664 ?auto_232668 ) ) ( not ( = ?auto_232664 ?auto_232669 ) ) ( not ( = ?auto_232664 ?auto_232670 ) ) ( not ( = ?auto_232664 ?auto_232671 ) ) ( not ( = ?auto_232664 ?auto_232672 ) ) ( not ( = ?auto_232665 ?auto_232666 ) ) ( not ( = ?auto_232665 ?auto_232667 ) ) ( not ( = ?auto_232665 ?auto_232668 ) ) ( not ( = ?auto_232665 ?auto_232669 ) ) ( not ( = ?auto_232665 ?auto_232670 ) ) ( not ( = ?auto_232665 ?auto_232671 ) ) ( not ( = ?auto_232665 ?auto_232672 ) ) ( not ( = ?auto_232666 ?auto_232667 ) ) ( not ( = ?auto_232666 ?auto_232668 ) ) ( not ( = ?auto_232666 ?auto_232669 ) ) ( not ( = ?auto_232666 ?auto_232670 ) ) ( not ( = ?auto_232666 ?auto_232671 ) ) ( not ( = ?auto_232666 ?auto_232672 ) ) ( not ( = ?auto_232667 ?auto_232668 ) ) ( not ( = ?auto_232667 ?auto_232669 ) ) ( not ( = ?auto_232667 ?auto_232670 ) ) ( not ( = ?auto_232667 ?auto_232671 ) ) ( not ( = ?auto_232667 ?auto_232672 ) ) ( not ( = ?auto_232668 ?auto_232669 ) ) ( not ( = ?auto_232668 ?auto_232670 ) ) ( not ( = ?auto_232668 ?auto_232671 ) ) ( not ( = ?auto_232668 ?auto_232672 ) ) ( not ( = ?auto_232669 ?auto_232670 ) ) ( not ( = ?auto_232669 ?auto_232671 ) ) ( not ( = ?auto_232669 ?auto_232672 ) ) ( not ( = ?auto_232670 ?auto_232671 ) ) ( not ( = ?auto_232670 ?auto_232672 ) ) ( not ( = ?auto_232671 ?auto_232672 ) ) ( ON ?auto_232670 ?auto_232671 ) ( CLEAR ?auto_232668 ) ( ON ?auto_232669 ?auto_232670 ) ( CLEAR ?auto_232669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_232659 ?auto_232660 ?auto_232661 ?auto_232662 ?auto_232663 ?auto_232664 ?auto_232665 ?auto_232666 ?auto_232667 ?auto_232668 ?auto_232669 )
      ( MAKE-13PILE ?auto_232659 ?auto_232660 ?auto_232661 ?auto_232662 ?auto_232663 ?auto_232664 ?auto_232665 ?auto_232666 ?auto_232667 ?auto_232668 ?auto_232669 ?auto_232670 ?auto_232671 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232686 - BLOCK
      ?auto_232687 - BLOCK
      ?auto_232688 - BLOCK
      ?auto_232689 - BLOCK
      ?auto_232690 - BLOCK
      ?auto_232691 - BLOCK
      ?auto_232692 - BLOCK
      ?auto_232693 - BLOCK
      ?auto_232694 - BLOCK
      ?auto_232695 - BLOCK
      ?auto_232696 - BLOCK
      ?auto_232697 - BLOCK
      ?auto_232698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_232698 ) ( ON-TABLE ?auto_232686 ) ( ON ?auto_232687 ?auto_232686 ) ( ON ?auto_232688 ?auto_232687 ) ( ON ?auto_232689 ?auto_232688 ) ( ON ?auto_232690 ?auto_232689 ) ( ON ?auto_232691 ?auto_232690 ) ( ON ?auto_232692 ?auto_232691 ) ( ON ?auto_232693 ?auto_232692 ) ( ON ?auto_232694 ?auto_232693 ) ( ON ?auto_232695 ?auto_232694 ) ( not ( = ?auto_232686 ?auto_232687 ) ) ( not ( = ?auto_232686 ?auto_232688 ) ) ( not ( = ?auto_232686 ?auto_232689 ) ) ( not ( = ?auto_232686 ?auto_232690 ) ) ( not ( = ?auto_232686 ?auto_232691 ) ) ( not ( = ?auto_232686 ?auto_232692 ) ) ( not ( = ?auto_232686 ?auto_232693 ) ) ( not ( = ?auto_232686 ?auto_232694 ) ) ( not ( = ?auto_232686 ?auto_232695 ) ) ( not ( = ?auto_232686 ?auto_232696 ) ) ( not ( = ?auto_232686 ?auto_232697 ) ) ( not ( = ?auto_232686 ?auto_232698 ) ) ( not ( = ?auto_232687 ?auto_232688 ) ) ( not ( = ?auto_232687 ?auto_232689 ) ) ( not ( = ?auto_232687 ?auto_232690 ) ) ( not ( = ?auto_232687 ?auto_232691 ) ) ( not ( = ?auto_232687 ?auto_232692 ) ) ( not ( = ?auto_232687 ?auto_232693 ) ) ( not ( = ?auto_232687 ?auto_232694 ) ) ( not ( = ?auto_232687 ?auto_232695 ) ) ( not ( = ?auto_232687 ?auto_232696 ) ) ( not ( = ?auto_232687 ?auto_232697 ) ) ( not ( = ?auto_232687 ?auto_232698 ) ) ( not ( = ?auto_232688 ?auto_232689 ) ) ( not ( = ?auto_232688 ?auto_232690 ) ) ( not ( = ?auto_232688 ?auto_232691 ) ) ( not ( = ?auto_232688 ?auto_232692 ) ) ( not ( = ?auto_232688 ?auto_232693 ) ) ( not ( = ?auto_232688 ?auto_232694 ) ) ( not ( = ?auto_232688 ?auto_232695 ) ) ( not ( = ?auto_232688 ?auto_232696 ) ) ( not ( = ?auto_232688 ?auto_232697 ) ) ( not ( = ?auto_232688 ?auto_232698 ) ) ( not ( = ?auto_232689 ?auto_232690 ) ) ( not ( = ?auto_232689 ?auto_232691 ) ) ( not ( = ?auto_232689 ?auto_232692 ) ) ( not ( = ?auto_232689 ?auto_232693 ) ) ( not ( = ?auto_232689 ?auto_232694 ) ) ( not ( = ?auto_232689 ?auto_232695 ) ) ( not ( = ?auto_232689 ?auto_232696 ) ) ( not ( = ?auto_232689 ?auto_232697 ) ) ( not ( = ?auto_232689 ?auto_232698 ) ) ( not ( = ?auto_232690 ?auto_232691 ) ) ( not ( = ?auto_232690 ?auto_232692 ) ) ( not ( = ?auto_232690 ?auto_232693 ) ) ( not ( = ?auto_232690 ?auto_232694 ) ) ( not ( = ?auto_232690 ?auto_232695 ) ) ( not ( = ?auto_232690 ?auto_232696 ) ) ( not ( = ?auto_232690 ?auto_232697 ) ) ( not ( = ?auto_232690 ?auto_232698 ) ) ( not ( = ?auto_232691 ?auto_232692 ) ) ( not ( = ?auto_232691 ?auto_232693 ) ) ( not ( = ?auto_232691 ?auto_232694 ) ) ( not ( = ?auto_232691 ?auto_232695 ) ) ( not ( = ?auto_232691 ?auto_232696 ) ) ( not ( = ?auto_232691 ?auto_232697 ) ) ( not ( = ?auto_232691 ?auto_232698 ) ) ( not ( = ?auto_232692 ?auto_232693 ) ) ( not ( = ?auto_232692 ?auto_232694 ) ) ( not ( = ?auto_232692 ?auto_232695 ) ) ( not ( = ?auto_232692 ?auto_232696 ) ) ( not ( = ?auto_232692 ?auto_232697 ) ) ( not ( = ?auto_232692 ?auto_232698 ) ) ( not ( = ?auto_232693 ?auto_232694 ) ) ( not ( = ?auto_232693 ?auto_232695 ) ) ( not ( = ?auto_232693 ?auto_232696 ) ) ( not ( = ?auto_232693 ?auto_232697 ) ) ( not ( = ?auto_232693 ?auto_232698 ) ) ( not ( = ?auto_232694 ?auto_232695 ) ) ( not ( = ?auto_232694 ?auto_232696 ) ) ( not ( = ?auto_232694 ?auto_232697 ) ) ( not ( = ?auto_232694 ?auto_232698 ) ) ( not ( = ?auto_232695 ?auto_232696 ) ) ( not ( = ?auto_232695 ?auto_232697 ) ) ( not ( = ?auto_232695 ?auto_232698 ) ) ( not ( = ?auto_232696 ?auto_232697 ) ) ( not ( = ?auto_232696 ?auto_232698 ) ) ( not ( = ?auto_232697 ?auto_232698 ) ) ( ON ?auto_232697 ?auto_232698 ) ( CLEAR ?auto_232695 ) ( ON ?auto_232696 ?auto_232697 ) ( CLEAR ?auto_232696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_232686 ?auto_232687 ?auto_232688 ?auto_232689 ?auto_232690 ?auto_232691 ?auto_232692 ?auto_232693 ?auto_232694 ?auto_232695 ?auto_232696 )
      ( MAKE-13PILE ?auto_232686 ?auto_232687 ?auto_232688 ?auto_232689 ?auto_232690 ?auto_232691 ?auto_232692 ?auto_232693 ?auto_232694 ?auto_232695 ?auto_232696 ?auto_232697 ?auto_232698 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232712 - BLOCK
      ?auto_232713 - BLOCK
      ?auto_232714 - BLOCK
      ?auto_232715 - BLOCK
      ?auto_232716 - BLOCK
      ?auto_232717 - BLOCK
      ?auto_232718 - BLOCK
      ?auto_232719 - BLOCK
      ?auto_232720 - BLOCK
      ?auto_232721 - BLOCK
      ?auto_232722 - BLOCK
      ?auto_232723 - BLOCK
      ?auto_232724 - BLOCK
    )
    :vars
    (
      ?auto_232725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232724 ?auto_232725 ) ( ON-TABLE ?auto_232712 ) ( ON ?auto_232713 ?auto_232712 ) ( ON ?auto_232714 ?auto_232713 ) ( ON ?auto_232715 ?auto_232714 ) ( ON ?auto_232716 ?auto_232715 ) ( ON ?auto_232717 ?auto_232716 ) ( ON ?auto_232718 ?auto_232717 ) ( ON ?auto_232719 ?auto_232718 ) ( ON ?auto_232720 ?auto_232719 ) ( not ( = ?auto_232712 ?auto_232713 ) ) ( not ( = ?auto_232712 ?auto_232714 ) ) ( not ( = ?auto_232712 ?auto_232715 ) ) ( not ( = ?auto_232712 ?auto_232716 ) ) ( not ( = ?auto_232712 ?auto_232717 ) ) ( not ( = ?auto_232712 ?auto_232718 ) ) ( not ( = ?auto_232712 ?auto_232719 ) ) ( not ( = ?auto_232712 ?auto_232720 ) ) ( not ( = ?auto_232712 ?auto_232721 ) ) ( not ( = ?auto_232712 ?auto_232722 ) ) ( not ( = ?auto_232712 ?auto_232723 ) ) ( not ( = ?auto_232712 ?auto_232724 ) ) ( not ( = ?auto_232712 ?auto_232725 ) ) ( not ( = ?auto_232713 ?auto_232714 ) ) ( not ( = ?auto_232713 ?auto_232715 ) ) ( not ( = ?auto_232713 ?auto_232716 ) ) ( not ( = ?auto_232713 ?auto_232717 ) ) ( not ( = ?auto_232713 ?auto_232718 ) ) ( not ( = ?auto_232713 ?auto_232719 ) ) ( not ( = ?auto_232713 ?auto_232720 ) ) ( not ( = ?auto_232713 ?auto_232721 ) ) ( not ( = ?auto_232713 ?auto_232722 ) ) ( not ( = ?auto_232713 ?auto_232723 ) ) ( not ( = ?auto_232713 ?auto_232724 ) ) ( not ( = ?auto_232713 ?auto_232725 ) ) ( not ( = ?auto_232714 ?auto_232715 ) ) ( not ( = ?auto_232714 ?auto_232716 ) ) ( not ( = ?auto_232714 ?auto_232717 ) ) ( not ( = ?auto_232714 ?auto_232718 ) ) ( not ( = ?auto_232714 ?auto_232719 ) ) ( not ( = ?auto_232714 ?auto_232720 ) ) ( not ( = ?auto_232714 ?auto_232721 ) ) ( not ( = ?auto_232714 ?auto_232722 ) ) ( not ( = ?auto_232714 ?auto_232723 ) ) ( not ( = ?auto_232714 ?auto_232724 ) ) ( not ( = ?auto_232714 ?auto_232725 ) ) ( not ( = ?auto_232715 ?auto_232716 ) ) ( not ( = ?auto_232715 ?auto_232717 ) ) ( not ( = ?auto_232715 ?auto_232718 ) ) ( not ( = ?auto_232715 ?auto_232719 ) ) ( not ( = ?auto_232715 ?auto_232720 ) ) ( not ( = ?auto_232715 ?auto_232721 ) ) ( not ( = ?auto_232715 ?auto_232722 ) ) ( not ( = ?auto_232715 ?auto_232723 ) ) ( not ( = ?auto_232715 ?auto_232724 ) ) ( not ( = ?auto_232715 ?auto_232725 ) ) ( not ( = ?auto_232716 ?auto_232717 ) ) ( not ( = ?auto_232716 ?auto_232718 ) ) ( not ( = ?auto_232716 ?auto_232719 ) ) ( not ( = ?auto_232716 ?auto_232720 ) ) ( not ( = ?auto_232716 ?auto_232721 ) ) ( not ( = ?auto_232716 ?auto_232722 ) ) ( not ( = ?auto_232716 ?auto_232723 ) ) ( not ( = ?auto_232716 ?auto_232724 ) ) ( not ( = ?auto_232716 ?auto_232725 ) ) ( not ( = ?auto_232717 ?auto_232718 ) ) ( not ( = ?auto_232717 ?auto_232719 ) ) ( not ( = ?auto_232717 ?auto_232720 ) ) ( not ( = ?auto_232717 ?auto_232721 ) ) ( not ( = ?auto_232717 ?auto_232722 ) ) ( not ( = ?auto_232717 ?auto_232723 ) ) ( not ( = ?auto_232717 ?auto_232724 ) ) ( not ( = ?auto_232717 ?auto_232725 ) ) ( not ( = ?auto_232718 ?auto_232719 ) ) ( not ( = ?auto_232718 ?auto_232720 ) ) ( not ( = ?auto_232718 ?auto_232721 ) ) ( not ( = ?auto_232718 ?auto_232722 ) ) ( not ( = ?auto_232718 ?auto_232723 ) ) ( not ( = ?auto_232718 ?auto_232724 ) ) ( not ( = ?auto_232718 ?auto_232725 ) ) ( not ( = ?auto_232719 ?auto_232720 ) ) ( not ( = ?auto_232719 ?auto_232721 ) ) ( not ( = ?auto_232719 ?auto_232722 ) ) ( not ( = ?auto_232719 ?auto_232723 ) ) ( not ( = ?auto_232719 ?auto_232724 ) ) ( not ( = ?auto_232719 ?auto_232725 ) ) ( not ( = ?auto_232720 ?auto_232721 ) ) ( not ( = ?auto_232720 ?auto_232722 ) ) ( not ( = ?auto_232720 ?auto_232723 ) ) ( not ( = ?auto_232720 ?auto_232724 ) ) ( not ( = ?auto_232720 ?auto_232725 ) ) ( not ( = ?auto_232721 ?auto_232722 ) ) ( not ( = ?auto_232721 ?auto_232723 ) ) ( not ( = ?auto_232721 ?auto_232724 ) ) ( not ( = ?auto_232721 ?auto_232725 ) ) ( not ( = ?auto_232722 ?auto_232723 ) ) ( not ( = ?auto_232722 ?auto_232724 ) ) ( not ( = ?auto_232722 ?auto_232725 ) ) ( not ( = ?auto_232723 ?auto_232724 ) ) ( not ( = ?auto_232723 ?auto_232725 ) ) ( not ( = ?auto_232724 ?auto_232725 ) ) ( ON ?auto_232723 ?auto_232724 ) ( ON ?auto_232722 ?auto_232723 ) ( CLEAR ?auto_232720 ) ( ON ?auto_232721 ?auto_232722 ) ( CLEAR ?auto_232721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_232712 ?auto_232713 ?auto_232714 ?auto_232715 ?auto_232716 ?auto_232717 ?auto_232718 ?auto_232719 ?auto_232720 ?auto_232721 )
      ( MAKE-13PILE ?auto_232712 ?auto_232713 ?auto_232714 ?auto_232715 ?auto_232716 ?auto_232717 ?auto_232718 ?auto_232719 ?auto_232720 ?auto_232721 ?auto_232722 ?auto_232723 ?auto_232724 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232739 - BLOCK
      ?auto_232740 - BLOCK
      ?auto_232741 - BLOCK
      ?auto_232742 - BLOCK
      ?auto_232743 - BLOCK
      ?auto_232744 - BLOCK
      ?auto_232745 - BLOCK
      ?auto_232746 - BLOCK
      ?auto_232747 - BLOCK
      ?auto_232748 - BLOCK
      ?auto_232749 - BLOCK
      ?auto_232750 - BLOCK
      ?auto_232751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_232751 ) ( ON-TABLE ?auto_232739 ) ( ON ?auto_232740 ?auto_232739 ) ( ON ?auto_232741 ?auto_232740 ) ( ON ?auto_232742 ?auto_232741 ) ( ON ?auto_232743 ?auto_232742 ) ( ON ?auto_232744 ?auto_232743 ) ( ON ?auto_232745 ?auto_232744 ) ( ON ?auto_232746 ?auto_232745 ) ( ON ?auto_232747 ?auto_232746 ) ( not ( = ?auto_232739 ?auto_232740 ) ) ( not ( = ?auto_232739 ?auto_232741 ) ) ( not ( = ?auto_232739 ?auto_232742 ) ) ( not ( = ?auto_232739 ?auto_232743 ) ) ( not ( = ?auto_232739 ?auto_232744 ) ) ( not ( = ?auto_232739 ?auto_232745 ) ) ( not ( = ?auto_232739 ?auto_232746 ) ) ( not ( = ?auto_232739 ?auto_232747 ) ) ( not ( = ?auto_232739 ?auto_232748 ) ) ( not ( = ?auto_232739 ?auto_232749 ) ) ( not ( = ?auto_232739 ?auto_232750 ) ) ( not ( = ?auto_232739 ?auto_232751 ) ) ( not ( = ?auto_232740 ?auto_232741 ) ) ( not ( = ?auto_232740 ?auto_232742 ) ) ( not ( = ?auto_232740 ?auto_232743 ) ) ( not ( = ?auto_232740 ?auto_232744 ) ) ( not ( = ?auto_232740 ?auto_232745 ) ) ( not ( = ?auto_232740 ?auto_232746 ) ) ( not ( = ?auto_232740 ?auto_232747 ) ) ( not ( = ?auto_232740 ?auto_232748 ) ) ( not ( = ?auto_232740 ?auto_232749 ) ) ( not ( = ?auto_232740 ?auto_232750 ) ) ( not ( = ?auto_232740 ?auto_232751 ) ) ( not ( = ?auto_232741 ?auto_232742 ) ) ( not ( = ?auto_232741 ?auto_232743 ) ) ( not ( = ?auto_232741 ?auto_232744 ) ) ( not ( = ?auto_232741 ?auto_232745 ) ) ( not ( = ?auto_232741 ?auto_232746 ) ) ( not ( = ?auto_232741 ?auto_232747 ) ) ( not ( = ?auto_232741 ?auto_232748 ) ) ( not ( = ?auto_232741 ?auto_232749 ) ) ( not ( = ?auto_232741 ?auto_232750 ) ) ( not ( = ?auto_232741 ?auto_232751 ) ) ( not ( = ?auto_232742 ?auto_232743 ) ) ( not ( = ?auto_232742 ?auto_232744 ) ) ( not ( = ?auto_232742 ?auto_232745 ) ) ( not ( = ?auto_232742 ?auto_232746 ) ) ( not ( = ?auto_232742 ?auto_232747 ) ) ( not ( = ?auto_232742 ?auto_232748 ) ) ( not ( = ?auto_232742 ?auto_232749 ) ) ( not ( = ?auto_232742 ?auto_232750 ) ) ( not ( = ?auto_232742 ?auto_232751 ) ) ( not ( = ?auto_232743 ?auto_232744 ) ) ( not ( = ?auto_232743 ?auto_232745 ) ) ( not ( = ?auto_232743 ?auto_232746 ) ) ( not ( = ?auto_232743 ?auto_232747 ) ) ( not ( = ?auto_232743 ?auto_232748 ) ) ( not ( = ?auto_232743 ?auto_232749 ) ) ( not ( = ?auto_232743 ?auto_232750 ) ) ( not ( = ?auto_232743 ?auto_232751 ) ) ( not ( = ?auto_232744 ?auto_232745 ) ) ( not ( = ?auto_232744 ?auto_232746 ) ) ( not ( = ?auto_232744 ?auto_232747 ) ) ( not ( = ?auto_232744 ?auto_232748 ) ) ( not ( = ?auto_232744 ?auto_232749 ) ) ( not ( = ?auto_232744 ?auto_232750 ) ) ( not ( = ?auto_232744 ?auto_232751 ) ) ( not ( = ?auto_232745 ?auto_232746 ) ) ( not ( = ?auto_232745 ?auto_232747 ) ) ( not ( = ?auto_232745 ?auto_232748 ) ) ( not ( = ?auto_232745 ?auto_232749 ) ) ( not ( = ?auto_232745 ?auto_232750 ) ) ( not ( = ?auto_232745 ?auto_232751 ) ) ( not ( = ?auto_232746 ?auto_232747 ) ) ( not ( = ?auto_232746 ?auto_232748 ) ) ( not ( = ?auto_232746 ?auto_232749 ) ) ( not ( = ?auto_232746 ?auto_232750 ) ) ( not ( = ?auto_232746 ?auto_232751 ) ) ( not ( = ?auto_232747 ?auto_232748 ) ) ( not ( = ?auto_232747 ?auto_232749 ) ) ( not ( = ?auto_232747 ?auto_232750 ) ) ( not ( = ?auto_232747 ?auto_232751 ) ) ( not ( = ?auto_232748 ?auto_232749 ) ) ( not ( = ?auto_232748 ?auto_232750 ) ) ( not ( = ?auto_232748 ?auto_232751 ) ) ( not ( = ?auto_232749 ?auto_232750 ) ) ( not ( = ?auto_232749 ?auto_232751 ) ) ( not ( = ?auto_232750 ?auto_232751 ) ) ( ON ?auto_232750 ?auto_232751 ) ( ON ?auto_232749 ?auto_232750 ) ( CLEAR ?auto_232747 ) ( ON ?auto_232748 ?auto_232749 ) ( CLEAR ?auto_232748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_232739 ?auto_232740 ?auto_232741 ?auto_232742 ?auto_232743 ?auto_232744 ?auto_232745 ?auto_232746 ?auto_232747 ?auto_232748 )
      ( MAKE-13PILE ?auto_232739 ?auto_232740 ?auto_232741 ?auto_232742 ?auto_232743 ?auto_232744 ?auto_232745 ?auto_232746 ?auto_232747 ?auto_232748 ?auto_232749 ?auto_232750 ?auto_232751 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232765 - BLOCK
      ?auto_232766 - BLOCK
      ?auto_232767 - BLOCK
      ?auto_232768 - BLOCK
      ?auto_232769 - BLOCK
      ?auto_232770 - BLOCK
      ?auto_232771 - BLOCK
      ?auto_232772 - BLOCK
      ?auto_232773 - BLOCK
      ?auto_232774 - BLOCK
      ?auto_232775 - BLOCK
      ?auto_232776 - BLOCK
      ?auto_232777 - BLOCK
    )
    :vars
    (
      ?auto_232778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232777 ?auto_232778 ) ( ON-TABLE ?auto_232765 ) ( ON ?auto_232766 ?auto_232765 ) ( ON ?auto_232767 ?auto_232766 ) ( ON ?auto_232768 ?auto_232767 ) ( ON ?auto_232769 ?auto_232768 ) ( ON ?auto_232770 ?auto_232769 ) ( ON ?auto_232771 ?auto_232770 ) ( ON ?auto_232772 ?auto_232771 ) ( not ( = ?auto_232765 ?auto_232766 ) ) ( not ( = ?auto_232765 ?auto_232767 ) ) ( not ( = ?auto_232765 ?auto_232768 ) ) ( not ( = ?auto_232765 ?auto_232769 ) ) ( not ( = ?auto_232765 ?auto_232770 ) ) ( not ( = ?auto_232765 ?auto_232771 ) ) ( not ( = ?auto_232765 ?auto_232772 ) ) ( not ( = ?auto_232765 ?auto_232773 ) ) ( not ( = ?auto_232765 ?auto_232774 ) ) ( not ( = ?auto_232765 ?auto_232775 ) ) ( not ( = ?auto_232765 ?auto_232776 ) ) ( not ( = ?auto_232765 ?auto_232777 ) ) ( not ( = ?auto_232765 ?auto_232778 ) ) ( not ( = ?auto_232766 ?auto_232767 ) ) ( not ( = ?auto_232766 ?auto_232768 ) ) ( not ( = ?auto_232766 ?auto_232769 ) ) ( not ( = ?auto_232766 ?auto_232770 ) ) ( not ( = ?auto_232766 ?auto_232771 ) ) ( not ( = ?auto_232766 ?auto_232772 ) ) ( not ( = ?auto_232766 ?auto_232773 ) ) ( not ( = ?auto_232766 ?auto_232774 ) ) ( not ( = ?auto_232766 ?auto_232775 ) ) ( not ( = ?auto_232766 ?auto_232776 ) ) ( not ( = ?auto_232766 ?auto_232777 ) ) ( not ( = ?auto_232766 ?auto_232778 ) ) ( not ( = ?auto_232767 ?auto_232768 ) ) ( not ( = ?auto_232767 ?auto_232769 ) ) ( not ( = ?auto_232767 ?auto_232770 ) ) ( not ( = ?auto_232767 ?auto_232771 ) ) ( not ( = ?auto_232767 ?auto_232772 ) ) ( not ( = ?auto_232767 ?auto_232773 ) ) ( not ( = ?auto_232767 ?auto_232774 ) ) ( not ( = ?auto_232767 ?auto_232775 ) ) ( not ( = ?auto_232767 ?auto_232776 ) ) ( not ( = ?auto_232767 ?auto_232777 ) ) ( not ( = ?auto_232767 ?auto_232778 ) ) ( not ( = ?auto_232768 ?auto_232769 ) ) ( not ( = ?auto_232768 ?auto_232770 ) ) ( not ( = ?auto_232768 ?auto_232771 ) ) ( not ( = ?auto_232768 ?auto_232772 ) ) ( not ( = ?auto_232768 ?auto_232773 ) ) ( not ( = ?auto_232768 ?auto_232774 ) ) ( not ( = ?auto_232768 ?auto_232775 ) ) ( not ( = ?auto_232768 ?auto_232776 ) ) ( not ( = ?auto_232768 ?auto_232777 ) ) ( not ( = ?auto_232768 ?auto_232778 ) ) ( not ( = ?auto_232769 ?auto_232770 ) ) ( not ( = ?auto_232769 ?auto_232771 ) ) ( not ( = ?auto_232769 ?auto_232772 ) ) ( not ( = ?auto_232769 ?auto_232773 ) ) ( not ( = ?auto_232769 ?auto_232774 ) ) ( not ( = ?auto_232769 ?auto_232775 ) ) ( not ( = ?auto_232769 ?auto_232776 ) ) ( not ( = ?auto_232769 ?auto_232777 ) ) ( not ( = ?auto_232769 ?auto_232778 ) ) ( not ( = ?auto_232770 ?auto_232771 ) ) ( not ( = ?auto_232770 ?auto_232772 ) ) ( not ( = ?auto_232770 ?auto_232773 ) ) ( not ( = ?auto_232770 ?auto_232774 ) ) ( not ( = ?auto_232770 ?auto_232775 ) ) ( not ( = ?auto_232770 ?auto_232776 ) ) ( not ( = ?auto_232770 ?auto_232777 ) ) ( not ( = ?auto_232770 ?auto_232778 ) ) ( not ( = ?auto_232771 ?auto_232772 ) ) ( not ( = ?auto_232771 ?auto_232773 ) ) ( not ( = ?auto_232771 ?auto_232774 ) ) ( not ( = ?auto_232771 ?auto_232775 ) ) ( not ( = ?auto_232771 ?auto_232776 ) ) ( not ( = ?auto_232771 ?auto_232777 ) ) ( not ( = ?auto_232771 ?auto_232778 ) ) ( not ( = ?auto_232772 ?auto_232773 ) ) ( not ( = ?auto_232772 ?auto_232774 ) ) ( not ( = ?auto_232772 ?auto_232775 ) ) ( not ( = ?auto_232772 ?auto_232776 ) ) ( not ( = ?auto_232772 ?auto_232777 ) ) ( not ( = ?auto_232772 ?auto_232778 ) ) ( not ( = ?auto_232773 ?auto_232774 ) ) ( not ( = ?auto_232773 ?auto_232775 ) ) ( not ( = ?auto_232773 ?auto_232776 ) ) ( not ( = ?auto_232773 ?auto_232777 ) ) ( not ( = ?auto_232773 ?auto_232778 ) ) ( not ( = ?auto_232774 ?auto_232775 ) ) ( not ( = ?auto_232774 ?auto_232776 ) ) ( not ( = ?auto_232774 ?auto_232777 ) ) ( not ( = ?auto_232774 ?auto_232778 ) ) ( not ( = ?auto_232775 ?auto_232776 ) ) ( not ( = ?auto_232775 ?auto_232777 ) ) ( not ( = ?auto_232775 ?auto_232778 ) ) ( not ( = ?auto_232776 ?auto_232777 ) ) ( not ( = ?auto_232776 ?auto_232778 ) ) ( not ( = ?auto_232777 ?auto_232778 ) ) ( ON ?auto_232776 ?auto_232777 ) ( ON ?auto_232775 ?auto_232776 ) ( ON ?auto_232774 ?auto_232775 ) ( CLEAR ?auto_232772 ) ( ON ?auto_232773 ?auto_232774 ) ( CLEAR ?auto_232773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_232765 ?auto_232766 ?auto_232767 ?auto_232768 ?auto_232769 ?auto_232770 ?auto_232771 ?auto_232772 ?auto_232773 )
      ( MAKE-13PILE ?auto_232765 ?auto_232766 ?auto_232767 ?auto_232768 ?auto_232769 ?auto_232770 ?auto_232771 ?auto_232772 ?auto_232773 ?auto_232774 ?auto_232775 ?auto_232776 ?auto_232777 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232792 - BLOCK
      ?auto_232793 - BLOCK
      ?auto_232794 - BLOCK
      ?auto_232795 - BLOCK
      ?auto_232796 - BLOCK
      ?auto_232797 - BLOCK
      ?auto_232798 - BLOCK
      ?auto_232799 - BLOCK
      ?auto_232800 - BLOCK
      ?auto_232801 - BLOCK
      ?auto_232802 - BLOCK
      ?auto_232803 - BLOCK
      ?auto_232804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_232804 ) ( ON-TABLE ?auto_232792 ) ( ON ?auto_232793 ?auto_232792 ) ( ON ?auto_232794 ?auto_232793 ) ( ON ?auto_232795 ?auto_232794 ) ( ON ?auto_232796 ?auto_232795 ) ( ON ?auto_232797 ?auto_232796 ) ( ON ?auto_232798 ?auto_232797 ) ( ON ?auto_232799 ?auto_232798 ) ( not ( = ?auto_232792 ?auto_232793 ) ) ( not ( = ?auto_232792 ?auto_232794 ) ) ( not ( = ?auto_232792 ?auto_232795 ) ) ( not ( = ?auto_232792 ?auto_232796 ) ) ( not ( = ?auto_232792 ?auto_232797 ) ) ( not ( = ?auto_232792 ?auto_232798 ) ) ( not ( = ?auto_232792 ?auto_232799 ) ) ( not ( = ?auto_232792 ?auto_232800 ) ) ( not ( = ?auto_232792 ?auto_232801 ) ) ( not ( = ?auto_232792 ?auto_232802 ) ) ( not ( = ?auto_232792 ?auto_232803 ) ) ( not ( = ?auto_232792 ?auto_232804 ) ) ( not ( = ?auto_232793 ?auto_232794 ) ) ( not ( = ?auto_232793 ?auto_232795 ) ) ( not ( = ?auto_232793 ?auto_232796 ) ) ( not ( = ?auto_232793 ?auto_232797 ) ) ( not ( = ?auto_232793 ?auto_232798 ) ) ( not ( = ?auto_232793 ?auto_232799 ) ) ( not ( = ?auto_232793 ?auto_232800 ) ) ( not ( = ?auto_232793 ?auto_232801 ) ) ( not ( = ?auto_232793 ?auto_232802 ) ) ( not ( = ?auto_232793 ?auto_232803 ) ) ( not ( = ?auto_232793 ?auto_232804 ) ) ( not ( = ?auto_232794 ?auto_232795 ) ) ( not ( = ?auto_232794 ?auto_232796 ) ) ( not ( = ?auto_232794 ?auto_232797 ) ) ( not ( = ?auto_232794 ?auto_232798 ) ) ( not ( = ?auto_232794 ?auto_232799 ) ) ( not ( = ?auto_232794 ?auto_232800 ) ) ( not ( = ?auto_232794 ?auto_232801 ) ) ( not ( = ?auto_232794 ?auto_232802 ) ) ( not ( = ?auto_232794 ?auto_232803 ) ) ( not ( = ?auto_232794 ?auto_232804 ) ) ( not ( = ?auto_232795 ?auto_232796 ) ) ( not ( = ?auto_232795 ?auto_232797 ) ) ( not ( = ?auto_232795 ?auto_232798 ) ) ( not ( = ?auto_232795 ?auto_232799 ) ) ( not ( = ?auto_232795 ?auto_232800 ) ) ( not ( = ?auto_232795 ?auto_232801 ) ) ( not ( = ?auto_232795 ?auto_232802 ) ) ( not ( = ?auto_232795 ?auto_232803 ) ) ( not ( = ?auto_232795 ?auto_232804 ) ) ( not ( = ?auto_232796 ?auto_232797 ) ) ( not ( = ?auto_232796 ?auto_232798 ) ) ( not ( = ?auto_232796 ?auto_232799 ) ) ( not ( = ?auto_232796 ?auto_232800 ) ) ( not ( = ?auto_232796 ?auto_232801 ) ) ( not ( = ?auto_232796 ?auto_232802 ) ) ( not ( = ?auto_232796 ?auto_232803 ) ) ( not ( = ?auto_232796 ?auto_232804 ) ) ( not ( = ?auto_232797 ?auto_232798 ) ) ( not ( = ?auto_232797 ?auto_232799 ) ) ( not ( = ?auto_232797 ?auto_232800 ) ) ( not ( = ?auto_232797 ?auto_232801 ) ) ( not ( = ?auto_232797 ?auto_232802 ) ) ( not ( = ?auto_232797 ?auto_232803 ) ) ( not ( = ?auto_232797 ?auto_232804 ) ) ( not ( = ?auto_232798 ?auto_232799 ) ) ( not ( = ?auto_232798 ?auto_232800 ) ) ( not ( = ?auto_232798 ?auto_232801 ) ) ( not ( = ?auto_232798 ?auto_232802 ) ) ( not ( = ?auto_232798 ?auto_232803 ) ) ( not ( = ?auto_232798 ?auto_232804 ) ) ( not ( = ?auto_232799 ?auto_232800 ) ) ( not ( = ?auto_232799 ?auto_232801 ) ) ( not ( = ?auto_232799 ?auto_232802 ) ) ( not ( = ?auto_232799 ?auto_232803 ) ) ( not ( = ?auto_232799 ?auto_232804 ) ) ( not ( = ?auto_232800 ?auto_232801 ) ) ( not ( = ?auto_232800 ?auto_232802 ) ) ( not ( = ?auto_232800 ?auto_232803 ) ) ( not ( = ?auto_232800 ?auto_232804 ) ) ( not ( = ?auto_232801 ?auto_232802 ) ) ( not ( = ?auto_232801 ?auto_232803 ) ) ( not ( = ?auto_232801 ?auto_232804 ) ) ( not ( = ?auto_232802 ?auto_232803 ) ) ( not ( = ?auto_232802 ?auto_232804 ) ) ( not ( = ?auto_232803 ?auto_232804 ) ) ( ON ?auto_232803 ?auto_232804 ) ( ON ?auto_232802 ?auto_232803 ) ( ON ?auto_232801 ?auto_232802 ) ( CLEAR ?auto_232799 ) ( ON ?auto_232800 ?auto_232801 ) ( CLEAR ?auto_232800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_232792 ?auto_232793 ?auto_232794 ?auto_232795 ?auto_232796 ?auto_232797 ?auto_232798 ?auto_232799 ?auto_232800 )
      ( MAKE-13PILE ?auto_232792 ?auto_232793 ?auto_232794 ?auto_232795 ?auto_232796 ?auto_232797 ?auto_232798 ?auto_232799 ?auto_232800 ?auto_232801 ?auto_232802 ?auto_232803 ?auto_232804 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232818 - BLOCK
      ?auto_232819 - BLOCK
      ?auto_232820 - BLOCK
      ?auto_232821 - BLOCK
      ?auto_232822 - BLOCK
      ?auto_232823 - BLOCK
      ?auto_232824 - BLOCK
      ?auto_232825 - BLOCK
      ?auto_232826 - BLOCK
      ?auto_232827 - BLOCK
      ?auto_232828 - BLOCK
      ?auto_232829 - BLOCK
      ?auto_232830 - BLOCK
    )
    :vars
    (
      ?auto_232831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232830 ?auto_232831 ) ( ON-TABLE ?auto_232818 ) ( ON ?auto_232819 ?auto_232818 ) ( ON ?auto_232820 ?auto_232819 ) ( ON ?auto_232821 ?auto_232820 ) ( ON ?auto_232822 ?auto_232821 ) ( ON ?auto_232823 ?auto_232822 ) ( ON ?auto_232824 ?auto_232823 ) ( not ( = ?auto_232818 ?auto_232819 ) ) ( not ( = ?auto_232818 ?auto_232820 ) ) ( not ( = ?auto_232818 ?auto_232821 ) ) ( not ( = ?auto_232818 ?auto_232822 ) ) ( not ( = ?auto_232818 ?auto_232823 ) ) ( not ( = ?auto_232818 ?auto_232824 ) ) ( not ( = ?auto_232818 ?auto_232825 ) ) ( not ( = ?auto_232818 ?auto_232826 ) ) ( not ( = ?auto_232818 ?auto_232827 ) ) ( not ( = ?auto_232818 ?auto_232828 ) ) ( not ( = ?auto_232818 ?auto_232829 ) ) ( not ( = ?auto_232818 ?auto_232830 ) ) ( not ( = ?auto_232818 ?auto_232831 ) ) ( not ( = ?auto_232819 ?auto_232820 ) ) ( not ( = ?auto_232819 ?auto_232821 ) ) ( not ( = ?auto_232819 ?auto_232822 ) ) ( not ( = ?auto_232819 ?auto_232823 ) ) ( not ( = ?auto_232819 ?auto_232824 ) ) ( not ( = ?auto_232819 ?auto_232825 ) ) ( not ( = ?auto_232819 ?auto_232826 ) ) ( not ( = ?auto_232819 ?auto_232827 ) ) ( not ( = ?auto_232819 ?auto_232828 ) ) ( not ( = ?auto_232819 ?auto_232829 ) ) ( not ( = ?auto_232819 ?auto_232830 ) ) ( not ( = ?auto_232819 ?auto_232831 ) ) ( not ( = ?auto_232820 ?auto_232821 ) ) ( not ( = ?auto_232820 ?auto_232822 ) ) ( not ( = ?auto_232820 ?auto_232823 ) ) ( not ( = ?auto_232820 ?auto_232824 ) ) ( not ( = ?auto_232820 ?auto_232825 ) ) ( not ( = ?auto_232820 ?auto_232826 ) ) ( not ( = ?auto_232820 ?auto_232827 ) ) ( not ( = ?auto_232820 ?auto_232828 ) ) ( not ( = ?auto_232820 ?auto_232829 ) ) ( not ( = ?auto_232820 ?auto_232830 ) ) ( not ( = ?auto_232820 ?auto_232831 ) ) ( not ( = ?auto_232821 ?auto_232822 ) ) ( not ( = ?auto_232821 ?auto_232823 ) ) ( not ( = ?auto_232821 ?auto_232824 ) ) ( not ( = ?auto_232821 ?auto_232825 ) ) ( not ( = ?auto_232821 ?auto_232826 ) ) ( not ( = ?auto_232821 ?auto_232827 ) ) ( not ( = ?auto_232821 ?auto_232828 ) ) ( not ( = ?auto_232821 ?auto_232829 ) ) ( not ( = ?auto_232821 ?auto_232830 ) ) ( not ( = ?auto_232821 ?auto_232831 ) ) ( not ( = ?auto_232822 ?auto_232823 ) ) ( not ( = ?auto_232822 ?auto_232824 ) ) ( not ( = ?auto_232822 ?auto_232825 ) ) ( not ( = ?auto_232822 ?auto_232826 ) ) ( not ( = ?auto_232822 ?auto_232827 ) ) ( not ( = ?auto_232822 ?auto_232828 ) ) ( not ( = ?auto_232822 ?auto_232829 ) ) ( not ( = ?auto_232822 ?auto_232830 ) ) ( not ( = ?auto_232822 ?auto_232831 ) ) ( not ( = ?auto_232823 ?auto_232824 ) ) ( not ( = ?auto_232823 ?auto_232825 ) ) ( not ( = ?auto_232823 ?auto_232826 ) ) ( not ( = ?auto_232823 ?auto_232827 ) ) ( not ( = ?auto_232823 ?auto_232828 ) ) ( not ( = ?auto_232823 ?auto_232829 ) ) ( not ( = ?auto_232823 ?auto_232830 ) ) ( not ( = ?auto_232823 ?auto_232831 ) ) ( not ( = ?auto_232824 ?auto_232825 ) ) ( not ( = ?auto_232824 ?auto_232826 ) ) ( not ( = ?auto_232824 ?auto_232827 ) ) ( not ( = ?auto_232824 ?auto_232828 ) ) ( not ( = ?auto_232824 ?auto_232829 ) ) ( not ( = ?auto_232824 ?auto_232830 ) ) ( not ( = ?auto_232824 ?auto_232831 ) ) ( not ( = ?auto_232825 ?auto_232826 ) ) ( not ( = ?auto_232825 ?auto_232827 ) ) ( not ( = ?auto_232825 ?auto_232828 ) ) ( not ( = ?auto_232825 ?auto_232829 ) ) ( not ( = ?auto_232825 ?auto_232830 ) ) ( not ( = ?auto_232825 ?auto_232831 ) ) ( not ( = ?auto_232826 ?auto_232827 ) ) ( not ( = ?auto_232826 ?auto_232828 ) ) ( not ( = ?auto_232826 ?auto_232829 ) ) ( not ( = ?auto_232826 ?auto_232830 ) ) ( not ( = ?auto_232826 ?auto_232831 ) ) ( not ( = ?auto_232827 ?auto_232828 ) ) ( not ( = ?auto_232827 ?auto_232829 ) ) ( not ( = ?auto_232827 ?auto_232830 ) ) ( not ( = ?auto_232827 ?auto_232831 ) ) ( not ( = ?auto_232828 ?auto_232829 ) ) ( not ( = ?auto_232828 ?auto_232830 ) ) ( not ( = ?auto_232828 ?auto_232831 ) ) ( not ( = ?auto_232829 ?auto_232830 ) ) ( not ( = ?auto_232829 ?auto_232831 ) ) ( not ( = ?auto_232830 ?auto_232831 ) ) ( ON ?auto_232829 ?auto_232830 ) ( ON ?auto_232828 ?auto_232829 ) ( ON ?auto_232827 ?auto_232828 ) ( ON ?auto_232826 ?auto_232827 ) ( CLEAR ?auto_232824 ) ( ON ?auto_232825 ?auto_232826 ) ( CLEAR ?auto_232825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_232818 ?auto_232819 ?auto_232820 ?auto_232821 ?auto_232822 ?auto_232823 ?auto_232824 ?auto_232825 )
      ( MAKE-13PILE ?auto_232818 ?auto_232819 ?auto_232820 ?auto_232821 ?auto_232822 ?auto_232823 ?auto_232824 ?auto_232825 ?auto_232826 ?auto_232827 ?auto_232828 ?auto_232829 ?auto_232830 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232845 - BLOCK
      ?auto_232846 - BLOCK
      ?auto_232847 - BLOCK
      ?auto_232848 - BLOCK
      ?auto_232849 - BLOCK
      ?auto_232850 - BLOCK
      ?auto_232851 - BLOCK
      ?auto_232852 - BLOCK
      ?auto_232853 - BLOCK
      ?auto_232854 - BLOCK
      ?auto_232855 - BLOCK
      ?auto_232856 - BLOCK
      ?auto_232857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_232857 ) ( ON-TABLE ?auto_232845 ) ( ON ?auto_232846 ?auto_232845 ) ( ON ?auto_232847 ?auto_232846 ) ( ON ?auto_232848 ?auto_232847 ) ( ON ?auto_232849 ?auto_232848 ) ( ON ?auto_232850 ?auto_232849 ) ( ON ?auto_232851 ?auto_232850 ) ( not ( = ?auto_232845 ?auto_232846 ) ) ( not ( = ?auto_232845 ?auto_232847 ) ) ( not ( = ?auto_232845 ?auto_232848 ) ) ( not ( = ?auto_232845 ?auto_232849 ) ) ( not ( = ?auto_232845 ?auto_232850 ) ) ( not ( = ?auto_232845 ?auto_232851 ) ) ( not ( = ?auto_232845 ?auto_232852 ) ) ( not ( = ?auto_232845 ?auto_232853 ) ) ( not ( = ?auto_232845 ?auto_232854 ) ) ( not ( = ?auto_232845 ?auto_232855 ) ) ( not ( = ?auto_232845 ?auto_232856 ) ) ( not ( = ?auto_232845 ?auto_232857 ) ) ( not ( = ?auto_232846 ?auto_232847 ) ) ( not ( = ?auto_232846 ?auto_232848 ) ) ( not ( = ?auto_232846 ?auto_232849 ) ) ( not ( = ?auto_232846 ?auto_232850 ) ) ( not ( = ?auto_232846 ?auto_232851 ) ) ( not ( = ?auto_232846 ?auto_232852 ) ) ( not ( = ?auto_232846 ?auto_232853 ) ) ( not ( = ?auto_232846 ?auto_232854 ) ) ( not ( = ?auto_232846 ?auto_232855 ) ) ( not ( = ?auto_232846 ?auto_232856 ) ) ( not ( = ?auto_232846 ?auto_232857 ) ) ( not ( = ?auto_232847 ?auto_232848 ) ) ( not ( = ?auto_232847 ?auto_232849 ) ) ( not ( = ?auto_232847 ?auto_232850 ) ) ( not ( = ?auto_232847 ?auto_232851 ) ) ( not ( = ?auto_232847 ?auto_232852 ) ) ( not ( = ?auto_232847 ?auto_232853 ) ) ( not ( = ?auto_232847 ?auto_232854 ) ) ( not ( = ?auto_232847 ?auto_232855 ) ) ( not ( = ?auto_232847 ?auto_232856 ) ) ( not ( = ?auto_232847 ?auto_232857 ) ) ( not ( = ?auto_232848 ?auto_232849 ) ) ( not ( = ?auto_232848 ?auto_232850 ) ) ( not ( = ?auto_232848 ?auto_232851 ) ) ( not ( = ?auto_232848 ?auto_232852 ) ) ( not ( = ?auto_232848 ?auto_232853 ) ) ( not ( = ?auto_232848 ?auto_232854 ) ) ( not ( = ?auto_232848 ?auto_232855 ) ) ( not ( = ?auto_232848 ?auto_232856 ) ) ( not ( = ?auto_232848 ?auto_232857 ) ) ( not ( = ?auto_232849 ?auto_232850 ) ) ( not ( = ?auto_232849 ?auto_232851 ) ) ( not ( = ?auto_232849 ?auto_232852 ) ) ( not ( = ?auto_232849 ?auto_232853 ) ) ( not ( = ?auto_232849 ?auto_232854 ) ) ( not ( = ?auto_232849 ?auto_232855 ) ) ( not ( = ?auto_232849 ?auto_232856 ) ) ( not ( = ?auto_232849 ?auto_232857 ) ) ( not ( = ?auto_232850 ?auto_232851 ) ) ( not ( = ?auto_232850 ?auto_232852 ) ) ( not ( = ?auto_232850 ?auto_232853 ) ) ( not ( = ?auto_232850 ?auto_232854 ) ) ( not ( = ?auto_232850 ?auto_232855 ) ) ( not ( = ?auto_232850 ?auto_232856 ) ) ( not ( = ?auto_232850 ?auto_232857 ) ) ( not ( = ?auto_232851 ?auto_232852 ) ) ( not ( = ?auto_232851 ?auto_232853 ) ) ( not ( = ?auto_232851 ?auto_232854 ) ) ( not ( = ?auto_232851 ?auto_232855 ) ) ( not ( = ?auto_232851 ?auto_232856 ) ) ( not ( = ?auto_232851 ?auto_232857 ) ) ( not ( = ?auto_232852 ?auto_232853 ) ) ( not ( = ?auto_232852 ?auto_232854 ) ) ( not ( = ?auto_232852 ?auto_232855 ) ) ( not ( = ?auto_232852 ?auto_232856 ) ) ( not ( = ?auto_232852 ?auto_232857 ) ) ( not ( = ?auto_232853 ?auto_232854 ) ) ( not ( = ?auto_232853 ?auto_232855 ) ) ( not ( = ?auto_232853 ?auto_232856 ) ) ( not ( = ?auto_232853 ?auto_232857 ) ) ( not ( = ?auto_232854 ?auto_232855 ) ) ( not ( = ?auto_232854 ?auto_232856 ) ) ( not ( = ?auto_232854 ?auto_232857 ) ) ( not ( = ?auto_232855 ?auto_232856 ) ) ( not ( = ?auto_232855 ?auto_232857 ) ) ( not ( = ?auto_232856 ?auto_232857 ) ) ( ON ?auto_232856 ?auto_232857 ) ( ON ?auto_232855 ?auto_232856 ) ( ON ?auto_232854 ?auto_232855 ) ( ON ?auto_232853 ?auto_232854 ) ( CLEAR ?auto_232851 ) ( ON ?auto_232852 ?auto_232853 ) ( CLEAR ?auto_232852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_232845 ?auto_232846 ?auto_232847 ?auto_232848 ?auto_232849 ?auto_232850 ?auto_232851 ?auto_232852 )
      ( MAKE-13PILE ?auto_232845 ?auto_232846 ?auto_232847 ?auto_232848 ?auto_232849 ?auto_232850 ?auto_232851 ?auto_232852 ?auto_232853 ?auto_232854 ?auto_232855 ?auto_232856 ?auto_232857 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232871 - BLOCK
      ?auto_232872 - BLOCK
      ?auto_232873 - BLOCK
      ?auto_232874 - BLOCK
      ?auto_232875 - BLOCK
      ?auto_232876 - BLOCK
      ?auto_232877 - BLOCK
      ?auto_232878 - BLOCK
      ?auto_232879 - BLOCK
      ?auto_232880 - BLOCK
      ?auto_232881 - BLOCK
      ?auto_232882 - BLOCK
      ?auto_232883 - BLOCK
    )
    :vars
    (
      ?auto_232884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232883 ?auto_232884 ) ( ON-TABLE ?auto_232871 ) ( ON ?auto_232872 ?auto_232871 ) ( ON ?auto_232873 ?auto_232872 ) ( ON ?auto_232874 ?auto_232873 ) ( ON ?auto_232875 ?auto_232874 ) ( ON ?auto_232876 ?auto_232875 ) ( not ( = ?auto_232871 ?auto_232872 ) ) ( not ( = ?auto_232871 ?auto_232873 ) ) ( not ( = ?auto_232871 ?auto_232874 ) ) ( not ( = ?auto_232871 ?auto_232875 ) ) ( not ( = ?auto_232871 ?auto_232876 ) ) ( not ( = ?auto_232871 ?auto_232877 ) ) ( not ( = ?auto_232871 ?auto_232878 ) ) ( not ( = ?auto_232871 ?auto_232879 ) ) ( not ( = ?auto_232871 ?auto_232880 ) ) ( not ( = ?auto_232871 ?auto_232881 ) ) ( not ( = ?auto_232871 ?auto_232882 ) ) ( not ( = ?auto_232871 ?auto_232883 ) ) ( not ( = ?auto_232871 ?auto_232884 ) ) ( not ( = ?auto_232872 ?auto_232873 ) ) ( not ( = ?auto_232872 ?auto_232874 ) ) ( not ( = ?auto_232872 ?auto_232875 ) ) ( not ( = ?auto_232872 ?auto_232876 ) ) ( not ( = ?auto_232872 ?auto_232877 ) ) ( not ( = ?auto_232872 ?auto_232878 ) ) ( not ( = ?auto_232872 ?auto_232879 ) ) ( not ( = ?auto_232872 ?auto_232880 ) ) ( not ( = ?auto_232872 ?auto_232881 ) ) ( not ( = ?auto_232872 ?auto_232882 ) ) ( not ( = ?auto_232872 ?auto_232883 ) ) ( not ( = ?auto_232872 ?auto_232884 ) ) ( not ( = ?auto_232873 ?auto_232874 ) ) ( not ( = ?auto_232873 ?auto_232875 ) ) ( not ( = ?auto_232873 ?auto_232876 ) ) ( not ( = ?auto_232873 ?auto_232877 ) ) ( not ( = ?auto_232873 ?auto_232878 ) ) ( not ( = ?auto_232873 ?auto_232879 ) ) ( not ( = ?auto_232873 ?auto_232880 ) ) ( not ( = ?auto_232873 ?auto_232881 ) ) ( not ( = ?auto_232873 ?auto_232882 ) ) ( not ( = ?auto_232873 ?auto_232883 ) ) ( not ( = ?auto_232873 ?auto_232884 ) ) ( not ( = ?auto_232874 ?auto_232875 ) ) ( not ( = ?auto_232874 ?auto_232876 ) ) ( not ( = ?auto_232874 ?auto_232877 ) ) ( not ( = ?auto_232874 ?auto_232878 ) ) ( not ( = ?auto_232874 ?auto_232879 ) ) ( not ( = ?auto_232874 ?auto_232880 ) ) ( not ( = ?auto_232874 ?auto_232881 ) ) ( not ( = ?auto_232874 ?auto_232882 ) ) ( not ( = ?auto_232874 ?auto_232883 ) ) ( not ( = ?auto_232874 ?auto_232884 ) ) ( not ( = ?auto_232875 ?auto_232876 ) ) ( not ( = ?auto_232875 ?auto_232877 ) ) ( not ( = ?auto_232875 ?auto_232878 ) ) ( not ( = ?auto_232875 ?auto_232879 ) ) ( not ( = ?auto_232875 ?auto_232880 ) ) ( not ( = ?auto_232875 ?auto_232881 ) ) ( not ( = ?auto_232875 ?auto_232882 ) ) ( not ( = ?auto_232875 ?auto_232883 ) ) ( not ( = ?auto_232875 ?auto_232884 ) ) ( not ( = ?auto_232876 ?auto_232877 ) ) ( not ( = ?auto_232876 ?auto_232878 ) ) ( not ( = ?auto_232876 ?auto_232879 ) ) ( not ( = ?auto_232876 ?auto_232880 ) ) ( not ( = ?auto_232876 ?auto_232881 ) ) ( not ( = ?auto_232876 ?auto_232882 ) ) ( not ( = ?auto_232876 ?auto_232883 ) ) ( not ( = ?auto_232876 ?auto_232884 ) ) ( not ( = ?auto_232877 ?auto_232878 ) ) ( not ( = ?auto_232877 ?auto_232879 ) ) ( not ( = ?auto_232877 ?auto_232880 ) ) ( not ( = ?auto_232877 ?auto_232881 ) ) ( not ( = ?auto_232877 ?auto_232882 ) ) ( not ( = ?auto_232877 ?auto_232883 ) ) ( not ( = ?auto_232877 ?auto_232884 ) ) ( not ( = ?auto_232878 ?auto_232879 ) ) ( not ( = ?auto_232878 ?auto_232880 ) ) ( not ( = ?auto_232878 ?auto_232881 ) ) ( not ( = ?auto_232878 ?auto_232882 ) ) ( not ( = ?auto_232878 ?auto_232883 ) ) ( not ( = ?auto_232878 ?auto_232884 ) ) ( not ( = ?auto_232879 ?auto_232880 ) ) ( not ( = ?auto_232879 ?auto_232881 ) ) ( not ( = ?auto_232879 ?auto_232882 ) ) ( not ( = ?auto_232879 ?auto_232883 ) ) ( not ( = ?auto_232879 ?auto_232884 ) ) ( not ( = ?auto_232880 ?auto_232881 ) ) ( not ( = ?auto_232880 ?auto_232882 ) ) ( not ( = ?auto_232880 ?auto_232883 ) ) ( not ( = ?auto_232880 ?auto_232884 ) ) ( not ( = ?auto_232881 ?auto_232882 ) ) ( not ( = ?auto_232881 ?auto_232883 ) ) ( not ( = ?auto_232881 ?auto_232884 ) ) ( not ( = ?auto_232882 ?auto_232883 ) ) ( not ( = ?auto_232882 ?auto_232884 ) ) ( not ( = ?auto_232883 ?auto_232884 ) ) ( ON ?auto_232882 ?auto_232883 ) ( ON ?auto_232881 ?auto_232882 ) ( ON ?auto_232880 ?auto_232881 ) ( ON ?auto_232879 ?auto_232880 ) ( ON ?auto_232878 ?auto_232879 ) ( CLEAR ?auto_232876 ) ( ON ?auto_232877 ?auto_232878 ) ( CLEAR ?auto_232877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_232871 ?auto_232872 ?auto_232873 ?auto_232874 ?auto_232875 ?auto_232876 ?auto_232877 )
      ( MAKE-13PILE ?auto_232871 ?auto_232872 ?auto_232873 ?auto_232874 ?auto_232875 ?auto_232876 ?auto_232877 ?auto_232878 ?auto_232879 ?auto_232880 ?auto_232881 ?auto_232882 ?auto_232883 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232898 - BLOCK
      ?auto_232899 - BLOCK
      ?auto_232900 - BLOCK
      ?auto_232901 - BLOCK
      ?auto_232902 - BLOCK
      ?auto_232903 - BLOCK
      ?auto_232904 - BLOCK
      ?auto_232905 - BLOCK
      ?auto_232906 - BLOCK
      ?auto_232907 - BLOCK
      ?auto_232908 - BLOCK
      ?auto_232909 - BLOCK
      ?auto_232910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_232910 ) ( ON-TABLE ?auto_232898 ) ( ON ?auto_232899 ?auto_232898 ) ( ON ?auto_232900 ?auto_232899 ) ( ON ?auto_232901 ?auto_232900 ) ( ON ?auto_232902 ?auto_232901 ) ( ON ?auto_232903 ?auto_232902 ) ( not ( = ?auto_232898 ?auto_232899 ) ) ( not ( = ?auto_232898 ?auto_232900 ) ) ( not ( = ?auto_232898 ?auto_232901 ) ) ( not ( = ?auto_232898 ?auto_232902 ) ) ( not ( = ?auto_232898 ?auto_232903 ) ) ( not ( = ?auto_232898 ?auto_232904 ) ) ( not ( = ?auto_232898 ?auto_232905 ) ) ( not ( = ?auto_232898 ?auto_232906 ) ) ( not ( = ?auto_232898 ?auto_232907 ) ) ( not ( = ?auto_232898 ?auto_232908 ) ) ( not ( = ?auto_232898 ?auto_232909 ) ) ( not ( = ?auto_232898 ?auto_232910 ) ) ( not ( = ?auto_232899 ?auto_232900 ) ) ( not ( = ?auto_232899 ?auto_232901 ) ) ( not ( = ?auto_232899 ?auto_232902 ) ) ( not ( = ?auto_232899 ?auto_232903 ) ) ( not ( = ?auto_232899 ?auto_232904 ) ) ( not ( = ?auto_232899 ?auto_232905 ) ) ( not ( = ?auto_232899 ?auto_232906 ) ) ( not ( = ?auto_232899 ?auto_232907 ) ) ( not ( = ?auto_232899 ?auto_232908 ) ) ( not ( = ?auto_232899 ?auto_232909 ) ) ( not ( = ?auto_232899 ?auto_232910 ) ) ( not ( = ?auto_232900 ?auto_232901 ) ) ( not ( = ?auto_232900 ?auto_232902 ) ) ( not ( = ?auto_232900 ?auto_232903 ) ) ( not ( = ?auto_232900 ?auto_232904 ) ) ( not ( = ?auto_232900 ?auto_232905 ) ) ( not ( = ?auto_232900 ?auto_232906 ) ) ( not ( = ?auto_232900 ?auto_232907 ) ) ( not ( = ?auto_232900 ?auto_232908 ) ) ( not ( = ?auto_232900 ?auto_232909 ) ) ( not ( = ?auto_232900 ?auto_232910 ) ) ( not ( = ?auto_232901 ?auto_232902 ) ) ( not ( = ?auto_232901 ?auto_232903 ) ) ( not ( = ?auto_232901 ?auto_232904 ) ) ( not ( = ?auto_232901 ?auto_232905 ) ) ( not ( = ?auto_232901 ?auto_232906 ) ) ( not ( = ?auto_232901 ?auto_232907 ) ) ( not ( = ?auto_232901 ?auto_232908 ) ) ( not ( = ?auto_232901 ?auto_232909 ) ) ( not ( = ?auto_232901 ?auto_232910 ) ) ( not ( = ?auto_232902 ?auto_232903 ) ) ( not ( = ?auto_232902 ?auto_232904 ) ) ( not ( = ?auto_232902 ?auto_232905 ) ) ( not ( = ?auto_232902 ?auto_232906 ) ) ( not ( = ?auto_232902 ?auto_232907 ) ) ( not ( = ?auto_232902 ?auto_232908 ) ) ( not ( = ?auto_232902 ?auto_232909 ) ) ( not ( = ?auto_232902 ?auto_232910 ) ) ( not ( = ?auto_232903 ?auto_232904 ) ) ( not ( = ?auto_232903 ?auto_232905 ) ) ( not ( = ?auto_232903 ?auto_232906 ) ) ( not ( = ?auto_232903 ?auto_232907 ) ) ( not ( = ?auto_232903 ?auto_232908 ) ) ( not ( = ?auto_232903 ?auto_232909 ) ) ( not ( = ?auto_232903 ?auto_232910 ) ) ( not ( = ?auto_232904 ?auto_232905 ) ) ( not ( = ?auto_232904 ?auto_232906 ) ) ( not ( = ?auto_232904 ?auto_232907 ) ) ( not ( = ?auto_232904 ?auto_232908 ) ) ( not ( = ?auto_232904 ?auto_232909 ) ) ( not ( = ?auto_232904 ?auto_232910 ) ) ( not ( = ?auto_232905 ?auto_232906 ) ) ( not ( = ?auto_232905 ?auto_232907 ) ) ( not ( = ?auto_232905 ?auto_232908 ) ) ( not ( = ?auto_232905 ?auto_232909 ) ) ( not ( = ?auto_232905 ?auto_232910 ) ) ( not ( = ?auto_232906 ?auto_232907 ) ) ( not ( = ?auto_232906 ?auto_232908 ) ) ( not ( = ?auto_232906 ?auto_232909 ) ) ( not ( = ?auto_232906 ?auto_232910 ) ) ( not ( = ?auto_232907 ?auto_232908 ) ) ( not ( = ?auto_232907 ?auto_232909 ) ) ( not ( = ?auto_232907 ?auto_232910 ) ) ( not ( = ?auto_232908 ?auto_232909 ) ) ( not ( = ?auto_232908 ?auto_232910 ) ) ( not ( = ?auto_232909 ?auto_232910 ) ) ( ON ?auto_232909 ?auto_232910 ) ( ON ?auto_232908 ?auto_232909 ) ( ON ?auto_232907 ?auto_232908 ) ( ON ?auto_232906 ?auto_232907 ) ( ON ?auto_232905 ?auto_232906 ) ( CLEAR ?auto_232903 ) ( ON ?auto_232904 ?auto_232905 ) ( CLEAR ?auto_232904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_232898 ?auto_232899 ?auto_232900 ?auto_232901 ?auto_232902 ?auto_232903 ?auto_232904 )
      ( MAKE-13PILE ?auto_232898 ?auto_232899 ?auto_232900 ?auto_232901 ?auto_232902 ?auto_232903 ?auto_232904 ?auto_232905 ?auto_232906 ?auto_232907 ?auto_232908 ?auto_232909 ?auto_232910 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232924 - BLOCK
      ?auto_232925 - BLOCK
      ?auto_232926 - BLOCK
      ?auto_232927 - BLOCK
      ?auto_232928 - BLOCK
      ?auto_232929 - BLOCK
      ?auto_232930 - BLOCK
      ?auto_232931 - BLOCK
      ?auto_232932 - BLOCK
      ?auto_232933 - BLOCK
      ?auto_232934 - BLOCK
      ?auto_232935 - BLOCK
      ?auto_232936 - BLOCK
    )
    :vars
    (
      ?auto_232937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232936 ?auto_232937 ) ( ON-TABLE ?auto_232924 ) ( ON ?auto_232925 ?auto_232924 ) ( ON ?auto_232926 ?auto_232925 ) ( ON ?auto_232927 ?auto_232926 ) ( ON ?auto_232928 ?auto_232927 ) ( not ( = ?auto_232924 ?auto_232925 ) ) ( not ( = ?auto_232924 ?auto_232926 ) ) ( not ( = ?auto_232924 ?auto_232927 ) ) ( not ( = ?auto_232924 ?auto_232928 ) ) ( not ( = ?auto_232924 ?auto_232929 ) ) ( not ( = ?auto_232924 ?auto_232930 ) ) ( not ( = ?auto_232924 ?auto_232931 ) ) ( not ( = ?auto_232924 ?auto_232932 ) ) ( not ( = ?auto_232924 ?auto_232933 ) ) ( not ( = ?auto_232924 ?auto_232934 ) ) ( not ( = ?auto_232924 ?auto_232935 ) ) ( not ( = ?auto_232924 ?auto_232936 ) ) ( not ( = ?auto_232924 ?auto_232937 ) ) ( not ( = ?auto_232925 ?auto_232926 ) ) ( not ( = ?auto_232925 ?auto_232927 ) ) ( not ( = ?auto_232925 ?auto_232928 ) ) ( not ( = ?auto_232925 ?auto_232929 ) ) ( not ( = ?auto_232925 ?auto_232930 ) ) ( not ( = ?auto_232925 ?auto_232931 ) ) ( not ( = ?auto_232925 ?auto_232932 ) ) ( not ( = ?auto_232925 ?auto_232933 ) ) ( not ( = ?auto_232925 ?auto_232934 ) ) ( not ( = ?auto_232925 ?auto_232935 ) ) ( not ( = ?auto_232925 ?auto_232936 ) ) ( not ( = ?auto_232925 ?auto_232937 ) ) ( not ( = ?auto_232926 ?auto_232927 ) ) ( not ( = ?auto_232926 ?auto_232928 ) ) ( not ( = ?auto_232926 ?auto_232929 ) ) ( not ( = ?auto_232926 ?auto_232930 ) ) ( not ( = ?auto_232926 ?auto_232931 ) ) ( not ( = ?auto_232926 ?auto_232932 ) ) ( not ( = ?auto_232926 ?auto_232933 ) ) ( not ( = ?auto_232926 ?auto_232934 ) ) ( not ( = ?auto_232926 ?auto_232935 ) ) ( not ( = ?auto_232926 ?auto_232936 ) ) ( not ( = ?auto_232926 ?auto_232937 ) ) ( not ( = ?auto_232927 ?auto_232928 ) ) ( not ( = ?auto_232927 ?auto_232929 ) ) ( not ( = ?auto_232927 ?auto_232930 ) ) ( not ( = ?auto_232927 ?auto_232931 ) ) ( not ( = ?auto_232927 ?auto_232932 ) ) ( not ( = ?auto_232927 ?auto_232933 ) ) ( not ( = ?auto_232927 ?auto_232934 ) ) ( not ( = ?auto_232927 ?auto_232935 ) ) ( not ( = ?auto_232927 ?auto_232936 ) ) ( not ( = ?auto_232927 ?auto_232937 ) ) ( not ( = ?auto_232928 ?auto_232929 ) ) ( not ( = ?auto_232928 ?auto_232930 ) ) ( not ( = ?auto_232928 ?auto_232931 ) ) ( not ( = ?auto_232928 ?auto_232932 ) ) ( not ( = ?auto_232928 ?auto_232933 ) ) ( not ( = ?auto_232928 ?auto_232934 ) ) ( not ( = ?auto_232928 ?auto_232935 ) ) ( not ( = ?auto_232928 ?auto_232936 ) ) ( not ( = ?auto_232928 ?auto_232937 ) ) ( not ( = ?auto_232929 ?auto_232930 ) ) ( not ( = ?auto_232929 ?auto_232931 ) ) ( not ( = ?auto_232929 ?auto_232932 ) ) ( not ( = ?auto_232929 ?auto_232933 ) ) ( not ( = ?auto_232929 ?auto_232934 ) ) ( not ( = ?auto_232929 ?auto_232935 ) ) ( not ( = ?auto_232929 ?auto_232936 ) ) ( not ( = ?auto_232929 ?auto_232937 ) ) ( not ( = ?auto_232930 ?auto_232931 ) ) ( not ( = ?auto_232930 ?auto_232932 ) ) ( not ( = ?auto_232930 ?auto_232933 ) ) ( not ( = ?auto_232930 ?auto_232934 ) ) ( not ( = ?auto_232930 ?auto_232935 ) ) ( not ( = ?auto_232930 ?auto_232936 ) ) ( not ( = ?auto_232930 ?auto_232937 ) ) ( not ( = ?auto_232931 ?auto_232932 ) ) ( not ( = ?auto_232931 ?auto_232933 ) ) ( not ( = ?auto_232931 ?auto_232934 ) ) ( not ( = ?auto_232931 ?auto_232935 ) ) ( not ( = ?auto_232931 ?auto_232936 ) ) ( not ( = ?auto_232931 ?auto_232937 ) ) ( not ( = ?auto_232932 ?auto_232933 ) ) ( not ( = ?auto_232932 ?auto_232934 ) ) ( not ( = ?auto_232932 ?auto_232935 ) ) ( not ( = ?auto_232932 ?auto_232936 ) ) ( not ( = ?auto_232932 ?auto_232937 ) ) ( not ( = ?auto_232933 ?auto_232934 ) ) ( not ( = ?auto_232933 ?auto_232935 ) ) ( not ( = ?auto_232933 ?auto_232936 ) ) ( not ( = ?auto_232933 ?auto_232937 ) ) ( not ( = ?auto_232934 ?auto_232935 ) ) ( not ( = ?auto_232934 ?auto_232936 ) ) ( not ( = ?auto_232934 ?auto_232937 ) ) ( not ( = ?auto_232935 ?auto_232936 ) ) ( not ( = ?auto_232935 ?auto_232937 ) ) ( not ( = ?auto_232936 ?auto_232937 ) ) ( ON ?auto_232935 ?auto_232936 ) ( ON ?auto_232934 ?auto_232935 ) ( ON ?auto_232933 ?auto_232934 ) ( ON ?auto_232932 ?auto_232933 ) ( ON ?auto_232931 ?auto_232932 ) ( ON ?auto_232930 ?auto_232931 ) ( CLEAR ?auto_232928 ) ( ON ?auto_232929 ?auto_232930 ) ( CLEAR ?auto_232929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_232924 ?auto_232925 ?auto_232926 ?auto_232927 ?auto_232928 ?auto_232929 )
      ( MAKE-13PILE ?auto_232924 ?auto_232925 ?auto_232926 ?auto_232927 ?auto_232928 ?auto_232929 ?auto_232930 ?auto_232931 ?auto_232932 ?auto_232933 ?auto_232934 ?auto_232935 ?auto_232936 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232951 - BLOCK
      ?auto_232952 - BLOCK
      ?auto_232953 - BLOCK
      ?auto_232954 - BLOCK
      ?auto_232955 - BLOCK
      ?auto_232956 - BLOCK
      ?auto_232957 - BLOCK
      ?auto_232958 - BLOCK
      ?auto_232959 - BLOCK
      ?auto_232960 - BLOCK
      ?auto_232961 - BLOCK
      ?auto_232962 - BLOCK
      ?auto_232963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_232963 ) ( ON-TABLE ?auto_232951 ) ( ON ?auto_232952 ?auto_232951 ) ( ON ?auto_232953 ?auto_232952 ) ( ON ?auto_232954 ?auto_232953 ) ( ON ?auto_232955 ?auto_232954 ) ( not ( = ?auto_232951 ?auto_232952 ) ) ( not ( = ?auto_232951 ?auto_232953 ) ) ( not ( = ?auto_232951 ?auto_232954 ) ) ( not ( = ?auto_232951 ?auto_232955 ) ) ( not ( = ?auto_232951 ?auto_232956 ) ) ( not ( = ?auto_232951 ?auto_232957 ) ) ( not ( = ?auto_232951 ?auto_232958 ) ) ( not ( = ?auto_232951 ?auto_232959 ) ) ( not ( = ?auto_232951 ?auto_232960 ) ) ( not ( = ?auto_232951 ?auto_232961 ) ) ( not ( = ?auto_232951 ?auto_232962 ) ) ( not ( = ?auto_232951 ?auto_232963 ) ) ( not ( = ?auto_232952 ?auto_232953 ) ) ( not ( = ?auto_232952 ?auto_232954 ) ) ( not ( = ?auto_232952 ?auto_232955 ) ) ( not ( = ?auto_232952 ?auto_232956 ) ) ( not ( = ?auto_232952 ?auto_232957 ) ) ( not ( = ?auto_232952 ?auto_232958 ) ) ( not ( = ?auto_232952 ?auto_232959 ) ) ( not ( = ?auto_232952 ?auto_232960 ) ) ( not ( = ?auto_232952 ?auto_232961 ) ) ( not ( = ?auto_232952 ?auto_232962 ) ) ( not ( = ?auto_232952 ?auto_232963 ) ) ( not ( = ?auto_232953 ?auto_232954 ) ) ( not ( = ?auto_232953 ?auto_232955 ) ) ( not ( = ?auto_232953 ?auto_232956 ) ) ( not ( = ?auto_232953 ?auto_232957 ) ) ( not ( = ?auto_232953 ?auto_232958 ) ) ( not ( = ?auto_232953 ?auto_232959 ) ) ( not ( = ?auto_232953 ?auto_232960 ) ) ( not ( = ?auto_232953 ?auto_232961 ) ) ( not ( = ?auto_232953 ?auto_232962 ) ) ( not ( = ?auto_232953 ?auto_232963 ) ) ( not ( = ?auto_232954 ?auto_232955 ) ) ( not ( = ?auto_232954 ?auto_232956 ) ) ( not ( = ?auto_232954 ?auto_232957 ) ) ( not ( = ?auto_232954 ?auto_232958 ) ) ( not ( = ?auto_232954 ?auto_232959 ) ) ( not ( = ?auto_232954 ?auto_232960 ) ) ( not ( = ?auto_232954 ?auto_232961 ) ) ( not ( = ?auto_232954 ?auto_232962 ) ) ( not ( = ?auto_232954 ?auto_232963 ) ) ( not ( = ?auto_232955 ?auto_232956 ) ) ( not ( = ?auto_232955 ?auto_232957 ) ) ( not ( = ?auto_232955 ?auto_232958 ) ) ( not ( = ?auto_232955 ?auto_232959 ) ) ( not ( = ?auto_232955 ?auto_232960 ) ) ( not ( = ?auto_232955 ?auto_232961 ) ) ( not ( = ?auto_232955 ?auto_232962 ) ) ( not ( = ?auto_232955 ?auto_232963 ) ) ( not ( = ?auto_232956 ?auto_232957 ) ) ( not ( = ?auto_232956 ?auto_232958 ) ) ( not ( = ?auto_232956 ?auto_232959 ) ) ( not ( = ?auto_232956 ?auto_232960 ) ) ( not ( = ?auto_232956 ?auto_232961 ) ) ( not ( = ?auto_232956 ?auto_232962 ) ) ( not ( = ?auto_232956 ?auto_232963 ) ) ( not ( = ?auto_232957 ?auto_232958 ) ) ( not ( = ?auto_232957 ?auto_232959 ) ) ( not ( = ?auto_232957 ?auto_232960 ) ) ( not ( = ?auto_232957 ?auto_232961 ) ) ( not ( = ?auto_232957 ?auto_232962 ) ) ( not ( = ?auto_232957 ?auto_232963 ) ) ( not ( = ?auto_232958 ?auto_232959 ) ) ( not ( = ?auto_232958 ?auto_232960 ) ) ( not ( = ?auto_232958 ?auto_232961 ) ) ( not ( = ?auto_232958 ?auto_232962 ) ) ( not ( = ?auto_232958 ?auto_232963 ) ) ( not ( = ?auto_232959 ?auto_232960 ) ) ( not ( = ?auto_232959 ?auto_232961 ) ) ( not ( = ?auto_232959 ?auto_232962 ) ) ( not ( = ?auto_232959 ?auto_232963 ) ) ( not ( = ?auto_232960 ?auto_232961 ) ) ( not ( = ?auto_232960 ?auto_232962 ) ) ( not ( = ?auto_232960 ?auto_232963 ) ) ( not ( = ?auto_232961 ?auto_232962 ) ) ( not ( = ?auto_232961 ?auto_232963 ) ) ( not ( = ?auto_232962 ?auto_232963 ) ) ( ON ?auto_232962 ?auto_232963 ) ( ON ?auto_232961 ?auto_232962 ) ( ON ?auto_232960 ?auto_232961 ) ( ON ?auto_232959 ?auto_232960 ) ( ON ?auto_232958 ?auto_232959 ) ( ON ?auto_232957 ?auto_232958 ) ( CLEAR ?auto_232955 ) ( ON ?auto_232956 ?auto_232957 ) ( CLEAR ?auto_232956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_232951 ?auto_232952 ?auto_232953 ?auto_232954 ?auto_232955 ?auto_232956 )
      ( MAKE-13PILE ?auto_232951 ?auto_232952 ?auto_232953 ?auto_232954 ?auto_232955 ?auto_232956 ?auto_232957 ?auto_232958 ?auto_232959 ?auto_232960 ?auto_232961 ?auto_232962 ?auto_232963 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_232977 - BLOCK
      ?auto_232978 - BLOCK
      ?auto_232979 - BLOCK
      ?auto_232980 - BLOCK
      ?auto_232981 - BLOCK
      ?auto_232982 - BLOCK
      ?auto_232983 - BLOCK
      ?auto_232984 - BLOCK
      ?auto_232985 - BLOCK
      ?auto_232986 - BLOCK
      ?auto_232987 - BLOCK
      ?auto_232988 - BLOCK
      ?auto_232989 - BLOCK
    )
    :vars
    (
      ?auto_232990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_232989 ?auto_232990 ) ( ON-TABLE ?auto_232977 ) ( ON ?auto_232978 ?auto_232977 ) ( ON ?auto_232979 ?auto_232978 ) ( ON ?auto_232980 ?auto_232979 ) ( not ( = ?auto_232977 ?auto_232978 ) ) ( not ( = ?auto_232977 ?auto_232979 ) ) ( not ( = ?auto_232977 ?auto_232980 ) ) ( not ( = ?auto_232977 ?auto_232981 ) ) ( not ( = ?auto_232977 ?auto_232982 ) ) ( not ( = ?auto_232977 ?auto_232983 ) ) ( not ( = ?auto_232977 ?auto_232984 ) ) ( not ( = ?auto_232977 ?auto_232985 ) ) ( not ( = ?auto_232977 ?auto_232986 ) ) ( not ( = ?auto_232977 ?auto_232987 ) ) ( not ( = ?auto_232977 ?auto_232988 ) ) ( not ( = ?auto_232977 ?auto_232989 ) ) ( not ( = ?auto_232977 ?auto_232990 ) ) ( not ( = ?auto_232978 ?auto_232979 ) ) ( not ( = ?auto_232978 ?auto_232980 ) ) ( not ( = ?auto_232978 ?auto_232981 ) ) ( not ( = ?auto_232978 ?auto_232982 ) ) ( not ( = ?auto_232978 ?auto_232983 ) ) ( not ( = ?auto_232978 ?auto_232984 ) ) ( not ( = ?auto_232978 ?auto_232985 ) ) ( not ( = ?auto_232978 ?auto_232986 ) ) ( not ( = ?auto_232978 ?auto_232987 ) ) ( not ( = ?auto_232978 ?auto_232988 ) ) ( not ( = ?auto_232978 ?auto_232989 ) ) ( not ( = ?auto_232978 ?auto_232990 ) ) ( not ( = ?auto_232979 ?auto_232980 ) ) ( not ( = ?auto_232979 ?auto_232981 ) ) ( not ( = ?auto_232979 ?auto_232982 ) ) ( not ( = ?auto_232979 ?auto_232983 ) ) ( not ( = ?auto_232979 ?auto_232984 ) ) ( not ( = ?auto_232979 ?auto_232985 ) ) ( not ( = ?auto_232979 ?auto_232986 ) ) ( not ( = ?auto_232979 ?auto_232987 ) ) ( not ( = ?auto_232979 ?auto_232988 ) ) ( not ( = ?auto_232979 ?auto_232989 ) ) ( not ( = ?auto_232979 ?auto_232990 ) ) ( not ( = ?auto_232980 ?auto_232981 ) ) ( not ( = ?auto_232980 ?auto_232982 ) ) ( not ( = ?auto_232980 ?auto_232983 ) ) ( not ( = ?auto_232980 ?auto_232984 ) ) ( not ( = ?auto_232980 ?auto_232985 ) ) ( not ( = ?auto_232980 ?auto_232986 ) ) ( not ( = ?auto_232980 ?auto_232987 ) ) ( not ( = ?auto_232980 ?auto_232988 ) ) ( not ( = ?auto_232980 ?auto_232989 ) ) ( not ( = ?auto_232980 ?auto_232990 ) ) ( not ( = ?auto_232981 ?auto_232982 ) ) ( not ( = ?auto_232981 ?auto_232983 ) ) ( not ( = ?auto_232981 ?auto_232984 ) ) ( not ( = ?auto_232981 ?auto_232985 ) ) ( not ( = ?auto_232981 ?auto_232986 ) ) ( not ( = ?auto_232981 ?auto_232987 ) ) ( not ( = ?auto_232981 ?auto_232988 ) ) ( not ( = ?auto_232981 ?auto_232989 ) ) ( not ( = ?auto_232981 ?auto_232990 ) ) ( not ( = ?auto_232982 ?auto_232983 ) ) ( not ( = ?auto_232982 ?auto_232984 ) ) ( not ( = ?auto_232982 ?auto_232985 ) ) ( not ( = ?auto_232982 ?auto_232986 ) ) ( not ( = ?auto_232982 ?auto_232987 ) ) ( not ( = ?auto_232982 ?auto_232988 ) ) ( not ( = ?auto_232982 ?auto_232989 ) ) ( not ( = ?auto_232982 ?auto_232990 ) ) ( not ( = ?auto_232983 ?auto_232984 ) ) ( not ( = ?auto_232983 ?auto_232985 ) ) ( not ( = ?auto_232983 ?auto_232986 ) ) ( not ( = ?auto_232983 ?auto_232987 ) ) ( not ( = ?auto_232983 ?auto_232988 ) ) ( not ( = ?auto_232983 ?auto_232989 ) ) ( not ( = ?auto_232983 ?auto_232990 ) ) ( not ( = ?auto_232984 ?auto_232985 ) ) ( not ( = ?auto_232984 ?auto_232986 ) ) ( not ( = ?auto_232984 ?auto_232987 ) ) ( not ( = ?auto_232984 ?auto_232988 ) ) ( not ( = ?auto_232984 ?auto_232989 ) ) ( not ( = ?auto_232984 ?auto_232990 ) ) ( not ( = ?auto_232985 ?auto_232986 ) ) ( not ( = ?auto_232985 ?auto_232987 ) ) ( not ( = ?auto_232985 ?auto_232988 ) ) ( not ( = ?auto_232985 ?auto_232989 ) ) ( not ( = ?auto_232985 ?auto_232990 ) ) ( not ( = ?auto_232986 ?auto_232987 ) ) ( not ( = ?auto_232986 ?auto_232988 ) ) ( not ( = ?auto_232986 ?auto_232989 ) ) ( not ( = ?auto_232986 ?auto_232990 ) ) ( not ( = ?auto_232987 ?auto_232988 ) ) ( not ( = ?auto_232987 ?auto_232989 ) ) ( not ( = ?auto_232987 ?auto_232990 ) ) ( not ( = ?auto_232988 ?auto_232989 ) ) ( not ( = ?auto_232988 ?auto_232990 ) ) ( not ( = ?auto_232989 ?auto_232990 ) ) ( ON ?auto_232988 ?auto_232989 ) ( ON ?auto_232987 ?auto_232988 ) ( ON ?auto_232986 ?auto_232987 ) ( ON ?auto_232985 ?auto_232986 ) ( ON ?auto_232984 ?auto_232985 ) ( ON ?auto_232983 ?auto_232984 ) ( ON ?auto_232982 ?auto_232983 ) ( CLEAR ?auto_232980 ) ( ON ?auto_232981 ?auto_232982 ) ( CLEAR ?auto_232981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_232977 ?auto_232978 ?auto_232979 ?auto_232980 ?auto_232981 )
      ( MAKE-13PILE ?auto_232977 ?auto_232978 ?auto_232979 ?auto_232980 ?auto_232981 ?auto_232982 ?auto_232983 ?auto_232984 ?auto_232985 ?auto_232986 ?auto_232987 ?auto_232988 ?auto_232989 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233004 - BLOCK
      ?auto_233005 - BLOCK
      ?auto_233006 - BLOCK
      ?auto_233007 - BLOCK
      ?auto_233008 - BLOCK
      ?auto_233009 - BLOCK
      ?auto_233010 - BLOCK
      ?auto_233011 - BLOCK
      ?auto_233012 - BLOCK
      ?auto_233013 - BLOCK
      ?auto_233014 - BLOCK
      ?auto_233015 - BLOCK
      ?auto_233016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_233016 ) ( ON-TABLE ?auto_233004 ) ( ON ?auto_233005 ?auto_233004 ) ( ON ?auto_233006 ?auto_233005 ) ( ON ?auto_233007 ?auto_233006 ) ( not ( = ?auto_233004 ?auto_233005 ) ) ( not ( = ?auto_233004 ?auto_233006 ) ) ( not ( = ?auto_233004 ?auto_233007 ) ) ( not ( = ?auto_233004 ?auto_233008 ) ) ( not ( = ?auto_233004 ?auto_233009 ) ) ( not ( = ?auto_233004 ?auto_233010 ) ) ( not ( = ?auto_233004 ?auto_233011 ) ) ( not ( = ?auto_233004 ?auto_233012 ) ) ( not ( = ?auto_233004 ?auto_233013 ) ) ( not ( = ?auto_233004 ?auto_233014 ) ) ( not ( = ?auto_233004 ?auto_233015 ) ) ( not ( = ?auto_233004 ?auto_233016 ) ) ( not ( = ?auto_233005 ?auto_233006 ) ) ( not ( = ?auto_233005 ?auto_233007 ) ) ( not ( = ?auto_233005 ?auto_233008 ) ) ( not ( = ?auto_233005 ?auto_233009 ) ) ( not ( = ?auto_233005 ?auto_233010 ) ) ( not ( = ?auto_233005 ?auto_233011 ) ) ( not ( = ?auto_233005 ?auto_233012 ) ) ( not ( = ?auto_233005 ?auto_233013 ) ) ( not ( = ?auto_233005 ?auto_233014 ) ) ( not ( = ?auto_233005 ?auto_233015 ) ) ( not ( = ?auto_233005 ?auto_233016 ) ) ( not ( = ?auto_233006 ?auto_233007 ) ) ( not ( = ?auto_233006 ?auto_233008 ) ) ( not ( = ?auto_233006 ?auto_233009 ) ) ( not ( = ?auto_233006 ?auto_233010 ) ) ( not ( = ?auto_233006 ?auto_233011 ) ) ( not ( = ?auto_233006 ?auto_233012 ) ) ( not ( = ?auto_233006 ?auto_233013 ) ) ( not ( = ?auto_233006 ?auto_233014 ) ) ( not ( = ?auto_233006 ?auto_233015 ) ) ( not ( = ?auto_233006 ?auto_233016 ) ) ( not ( = ?auto_233007 ?auto_233008 ) ) ( not ( = ?auto_233007 ?auto_233009 ) ) ( not ( = ?auto_233007 ?auto_233010 ) ) ( not ( = ?auto_233007 ?auto_233011 ) ) ( not ( = ?auto_233007 ?auto_233012 ) ) ( not ( = ?auto_233007 ?auto_233013 ) ) ( not ( = ?auto_233007 ?auto_233014 ) ) ( not ( = ?auto_233007 ?auto_233015 ) ) ( not ( = ?auto_233007 ?auto_233016 ) ) ( not ( = ?auto_233008 ?auto_233009 ) ) ( not ( = ?auto_233008 ?auto_233010 ) ) ( not ( = ?auto_233008 ?auto_233011 ) ) ( not ( = ?auto_233008 ?auto_233012 ) ) ( not ( = ?auto_233008 ?auto_233013 ) ) ( not ( = ?auto_233008 ?auto_233014 ) ) ( not ( = ?auto_233008 ?auto_233015 ) ) ( not ( = ?auto_233008 ?auto_233016 ) ) ( not ( = ?auto_233009 ?auto_233010 ) ) ( not ( = ?auto_233009 ?auto_233011 ) ) ( not ( = ?auto_233009 ?auto_233012 ) ) ( not ( = ?auto_233009 ?auto_233013 ) ) ( not ( = ?auto_233009 ?auto_233014 ) ) ( not ( = ?auto_233009 ?auto_233015 ) ) ( not ( = ?auto_233009 ?auto_233016 ) ) ( not ( = ?auto_233010 ?auto_233011 ) ) ( not ( = ?auto_233010 ?auto_233012 ) ) ( not ( = ?auto_233010 ?auto_233013 ) ) ( not ( = ?auto_233010 ?auto_233014 ) ) ( not ( = ?auto_233010 ?auto_233015 ) ) ( not ( = ?auto_233010 ?auto_233016 ) ) ( not ( = ?auto_233011 ?auto_233012 ) ) ( not ( = ?auto_233011 ?auto_233013 ) ) ( not ( = ?auto_233011 ?auto_233014 ) ) ( not ( = ?auto_233011 ?auto_233015 ) ) ( not ( = ?auto_233011 ?auto_233016 ) ) ( not ( = ?auto_233012 ?auto_233013 ) ) ( not ( = ?auto_233012 ?auto_233014 ) ) ( not ( = ?auto_233012 ?auto_233015 ) ) ( not ( = ?auto_233012 ?auto_233016 ) ) ( not ( = ?auto_233013 ?auto_233014 ) ) ( not ( = ?auto_233013 ?auto_233015 ) ) ( not ( = ?auto_233013 ?auto_233016 ) ) ( not ( = ?auto_233014 ?auto_233015 ) ) ( not ( = ?auto_233014 ?auto_233016 ) ) ( not ( = ?auto_233015 ?auto_233016 ) ) ( ON ?auto_233015 ?auto_233016 ) ( ON ?auto_233014 ?auto_233015 ) ( ON ?auto_233013 ?auto_233014 ) ( ON ?auto_233012 ?auto_233013 ) ( ON ?auto_233011 ?auto_233012 ) ( ON ?auto_233010 ?auto_233011 ) ( ON ?auto_233009 ?auto_233010 ) ( CLEAR ?auto_233007 ) ( ON ?auto_233008 ?auto_233009 ) ( CLEAR ?auto_233008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_233004 ?auto_233005 ?auto_233006 ?auto_233007 ?auto_233008 )
      ( MAKE-13PILE ?auto_233004 ?auto_233005 ?auto_233006 ?auto_233007 ?auto_233008 ?auto_233009 ?auto_233010 ?auto_233011 ?auto_233012 ?auto_233013 ?auto_233014 ?auto_233015 ?auto_233016 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233030 - BLOCK
      ?auto_233031 - BLOCK
      ?auto_233032 - BLOCK
      ?auto_233033 - BLOCK
      ?auto_233034 - BLOCK
      ?auto_233035 - BLOCK
      ?auto_233036 - BLOCK
      ?auto_233037 - BLOCK
      ?auto_233038 - BLOCK
      ?auto_233039 - BLOCK
      ?auto_233040 - BLOCK
      ?auto_233041 - BLOCK
      ?auto_233042 - BLOCK
    )
    :vars
    (
      ?auto_233043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233042 ?auto_233043 ) ( ON-TABLE ?auto_233030 ) ( ON ?auto_233031 ?auto_233030 ) ( ON ?auto_233032 ?auto_233031 ) ( not ( = ?auto_233030 ?auto_233031 ) ) ( not ( = ?auto_233030 ?auto_233032 ) ) ( not ( = ?auto_233030 ?auto_233033 ) ) ( not ( = ?auto_233030 ?auto_233034 ) ) ( not ( = ?auto_233030 ?auto_233035 ) ) ( not ( = ?auto_233030 ?auto_233036 ) ) ( not ( = ?auto_233030 ?auto_233037 ) ) ( not ( = ?auto_233030 ?auto_233038 ) ) ( not ( = ?auto_233030 ?auto_233039 ) ) ( not ( = ?auto_233030 ?auto_233040 ) ) ( not ( = ?auto_233030 ?auto_233041 ) ) ( not ( = ?auto_233030 ?auto_233042 ) ) ( not ( = ?auto_233030 ?auto_233043 ) ) ( not ( = ?auto_233031 ?auto_233032 ) ) ( not ( = ?auto_233031 ?auto_233033 ) ) ( not ( = ?auto_233031 ?auto_233034 ) ) ( not ( = ?auto_233031 ?auto_233035 ) ) ( not ( = ?auto_233031 ?auto_233036 ) ) ( not ( = ?auto_233031 ?auto_233037 ) ) ( not ( = ?auto_233031 ?auto_233038 ) ) ( not ( = ?auto_233031 ?auto_233039 ) ) ( not ( = ?auto_233031 ?auto_233040 ) ) ( not ( = ?auto_233031 ?auto_233041 ) ) ( not ( = ?auto_233031 ?auto_233042 ) ) ( not ( = ?auto_233031 ?auto_233043 ) ) ( not ( = ?auto_233032 ?auto_233033 ) ) ( not ( = ?auto_233032 ?auto_233034 ) ) ( not ( = ?auto_233032 ?auto_233035 ) ) ( not ( = ?auto_233032 ?auto_233036 ) ) ( not ( = ?auto_233032 ?auto_233037 ) ) ( not ( = ?auto_233032 ?auto_233038 ) ) ( not ( = ?auto_233032 ?auto_233039 ) ) ( not ( = ?auto_233032 ?auto_233040 ) ) ( not ( = ?auto_233032 ?auto_233041 ) ) ( not ( = ?auto_233032 ?auto_233042 ) ) ( not ( = ?auto_233032 ?auto_233043 ) ) ( not ( = ?auto_233033 ?auto_233034 ) ) ( not ( = ?auto_233033 ?auto_233035 ) ) ( not ( = ?auto_233033 ?auto_233036 ) ) ( not ( = ?auto_233033 ?auto_233037 ) ) ( not ( = ?auto_233033 ?auto_233038 ) ) ( not ( = ?auto_233033 ?auto_233039 ) ) ( not ( = ?auto_233033 ?auto_233040 ) ) ( not ( = ?auto_233033 ?auto_233041 ) ) ( not ( = ?auto_233033 ?auto_233042 ) ) ( not ( = ?auto_233033 ?auto_233043 ) ) ( not ( = ?auto_233034 ?auto_233035 ) ) ( not ( = ?auto_233034 ?auto_233036 ) ) ( not ( = ?auto_233034 ?auto_233037 ) ) ( not ( = ?auto_233034 ?auto_233038 ) ) ( not ( = ?auto_233034 ?auto_233039 ) ) ( not ( = ?auto_233034 ?auto_233040 ) ) ( not ( = ?auto_233034 ?auto_233041 ) ) ( not ( = ?auto_233034 ?auto_233042 ) ) ( not ( = ?auto_233034 ?auto_233043 ) ) ( not ( = ?auto_233035 ?auto_233036 ) ) ( not ( = ?auto_233035 ?auto_233037 ) ) ( not ( = ?auto_233035 ?auto_233038 ) ) ( not ( = ?auto_233035 ?auto_233039 ) ) ( not ( = ?auto_233035 ?auto_233040 ) ) ( not ( = ?auto_233035 ?auto_233041 ) ) ( not ( = ?auto_233035 ?auto_233042 ) ) ( not ( = ?auto_233035 ?auto_233043 ) ) ( not ( = ?auto_233036 ?auto_233037 ) ) ( not ( = ?auto_233036 ?auto_233038 ) ) ( not ( = ?auto_233036 ?auto_233039 ) ) ( not ( = ?auto_233036 ?auto_233040 ) ) ( not ( = ?auto_233036 ?auto_233041 ) ) ( not ( = ?auto_233036 ?auto_233042 ) ) ( not ( = ?auto_233036 ?auto_233043 ) ) ( not ( = ?auto_233037 ?auto_233038 ) ) ( not ( = ?auto_233037 ?auto_233039 ) ) ( not ( = ?auto_233037 ?auto_233040 ) ) ( not ( = ?auto_233037 ?auto_233041 ) ) ( not ( = ?auto_233037 ?auto_233042 ) ) ( not ( = ?auto_233037 ?auto_233043 ) ) ( not ( = ?auto_233038 ?auto_233039 ) ) ( not ( = ?auto_233038 ?auto_233040 ) ) ( not ( = ?auto_233038 ?auto_233041 ) ) ( not ( = ?auto_233038 ?auto_233042 ) ) ( not ( = ?auto_233038 ?auto_233043 ) ) ( not ( = ?auto_233039 ?auto_233040 ) ) ( not ( = ?auto_233039 ?auto_233041 ) ) ( not ( = ?auto_233039 ?auto_233042 ) ) ( not ( = ?auto_233039 ?auto_233043 ) ) ( not ( = ?auto_233040 ?auto_233041 ) ) ( not ( = ?auto_233040 ?auto_233042 ) ) ( not ( = ?auto_233040 ?auto_233043 ) ) ( not ( = ?auto_233041 ?auto_233042 ) ) ( not ( = ?auto_233041 ?auto_233043 ) ) ( not ( = ?auto_233042 ?auto_233043 ) ) ( ON ?auto_233041 ?auto_233042 ) ( ON ?auto_233040 ?auto_233041 ) ( ON ?auto_233039 ?auto_233040 ) ( ON ?auto_233038 ?auto_233039 ) ( ON ?auto_233037 ?auto_233038 ) ( ON ?auto_233036 ?auto_233037 ) ( ON ?auto_233035 ?auto_233036 ) ( ON ?auto_233034 ?auto_233035 ) ( CLEAR ?auto_233032 ) ( ON ?auto_233033 ?auto_233034 ) ( CLEAR ?auto_233033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233030 ?auto_233031 ?auto_233032 ?auto_233033 )
      ( MAKE-13PILE ?auto_233030 ?auto_233031 ?auto_233032 ?auto_233033 ?auto_233034 ?auto_233035 ?auto_233036 ?auto_233037 ?auto_233038 ?auto_233039 ?auto_233040 ?auto_233041 ?auto_233042 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233057 - BLOCK
      ?auto_233058 - BLOCK
      ?auto_233059 - BLOCK
      ?auto_233060 - BLOCK
      ?auto_233061 - BLOCK
      ?auto_233062 - BLOCK
      ?auto_233063 - BLOCK
      ?auto_233064 - BLOCK
      ?auto_233065 - BLOCK
      ?auto_233066 - BLOCK
      ?auto_233067 - BLOCK
      ?auto_233068 - BLOCK
      ?auto_233069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_233069 ) ( ON-TABLE ?auto_233057 ) ( ON ?auto_233058 ?auto_233057 ) ( ON ?auto_233059 ?auto_233058 ) ( not ( = ?auto_233057 ?auto_233058 ) ) ( not ( = ?auto_233057 ?auto_233059 ) ) ( not ( = ?auto_233057 ?auto_233060 ) ) ( not ( = ?auto_233057 ?auto_233061 ) ) ( not ( = ?auto_233057 ?auto_233062 ) ) ( not ( = ?auto_233057 ?auto_233063 ) ) ( not ( = ?auto_233057 ?auto_233064 ) ) ( not ( = ?auto_233057 ?auto_233065 ) ) ( not ( = ?auto_233057 ?auto_233066 ) ) ( not ( = ?auto_233057 ?auto_233067 ) ) ( not ( = ?auto_233057 ?auto_233068 ) ) ( not ( = ?auto_233057 ?auto_233069 ) ) ( not ( = ?auto_233058 ?auto_233059 ) ) ( not ( = ?auto_233058 ?auto_233060 ) ) ( not ( = ?auto_233058 ?auto_233061 ) ) ( not ( = ?auto_233058 ?auto_233062 ) ) ( not ( = ?auto_233058 ?auto_233063 ) ) ( not ( = ?auto_233058 ?auto_233064 ) ) ( not ( = ?auto_233058 ?auto_233065 ) ) ( not ( = ?auto_233058 ?auto_233066 ) ) ( not ( = ?auto_233058 ?auto_233067 ) ) ( not ( = ?auto_233058 ?auto_233068 ) ) ( not ( = ?auto_233058 ?auto_233069 ) ) ( not ( = ?auto_233059 ?auto_233060 ) ) ( not ( = ?auto_233059 ?auto_233061 ) ) ( not ( = ?auto_233059 ?auto_233062 ) ) ( not ( = ?auto_233059 ?auto_233063 ) ) ( not ( = ?auto_233059 ?auto_233064 ) ) ( not ( = ?auto_233059 ?auto_233065 ) ) ( not ( = ?auto_233059 ?auto_233066 ) ) ( not ( = ?auto_233059 ?auto_233067 ) ) ( not ( = ?auto_233059 ?auto_233068 ) ) ( not ( = ?auto_233059 ?auto_233069 ) ) ( not ( = ?auto_233060 ?auto_233061 ) ) ( not ( = ?auto_233060 ?auto_233062 ) ) ( not ( = ?auto_233060 ?auto_233063 ) ) ( not ( = ?auto_233060 ?auto_233064 ) ) ( not ( = ?auto_233060 ?auto_233065 ) ) ( not ( = ?auto_233060 ?auto_233066 ) ) ( not ( = ?auto_233060 ?auto_233067 ) ) ( not ( = ?auto_233060 ?auto_233068 ) ) ( not ( = ?auto_233060 ?auto_233069 ) ) ( not ( = ?auto_233061 ?auto_233062 ) ) ( not ( = ?auto_233061 ?auto_233063 ) ) ( not ( = ?auto_233061 ?auto_233064 ) ) ( not ( = ?auto_233061 ?auto_233065 ) ) ( not ( = ?auto_233061 ?auto_233066 ) ) ( not ( = ?auto_233061 ?auto_233067 ) ) ( not ( = ?auto_233061 ?auto_233068 ) ) ( not ( = ?auto_233061 ?auto_233069 ) ) ( not ( = ?auto_233062 ?auto_233063 ) ) ( not ( = ?auto_233062 ?auto_233064 ) ) ( not ( = ?auto_233062 ?auto_233065 ) ) ( not ( = ?auto_233062 ?auto_233066 ) ) ( not ( = ?auto_233062 ?auto_233067 ) ) ( not ( = ?auto_233062 ?auto_233068 ) ) ( not ( = ?auto_233062 ?auto_233069 ) ) ( not ( = ?auto_233063 ?auto_233064 ) ) ( not ( = ?auto_233063 ?auto_233065 ) ) ( not ( = ?auto_233063 ?auto_233066 ) ) ( not ( = ?auto_233063 ?auto_233067 ) ) ( not ( = ?auto_233063 ?auto_233068 ) ) ( not ( = ?auto_233063 ?auto_233069 ) ) ( not ( = ?auto_233064 ?auto_233065 ) ) ( not ( = ?auto_233064 ?auto_233066 ) ) ( not ( = ?auto_233064 ?auto_233067 ) ) ( not ( = ?auto_233064 ?auto_233068 ) ) ( not ( = ?auto_233064 ?auto_233069 ) ) ( not ( = ?auto_233065 ?auto_233066 ) ) ( not ( = ?auto_233065 ?auto_233067 ) ) ( not ( = ?auto_233065 ?auto_233068 ) ) ( not ( = ?auto_233065 ?auto_233069 ) ) ( not ( = ?auto_233066 ?auto_233067 ) ) ( not ( = ?auto_233066 ?auto_233068 ) ) ( not ( = ?auto_233066 ?auto_233069 ) ) ( not ( = ?auto_233067 ?auto_233068 ) ) ( not ( = ?auto_233067 ?auto_233069 ) ) ( not ( = ?auto_233068 ?auto_233069 ) ) ( ON ?auto_233068 ?auto_233069 ) ( ON ?auto_233067 ?auto_233068 ) ( ON ?auto_233066 ?auto_233067 ) ( ON ?auto_233065 ?auto_233066 ) ( ON ?auto_233064 ?auto_233065 ) ( ON ?auto_233063 ?auto_233064 ) ( ON ?auto_233062 ?auto_233063 ) ( ON ?auto_233061 ?auto_233062 ) ( CLEAR ?auto_233059 ) ( ON ?auto_233060 ?auto_233061 ) ( CLEAR ?auto_233060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_233057 ?auto_233058 ?auto_233059 ?auto_233060 )
      ( MAKE-13PILE ?auto_233057 ?auto_233058 ?auto_233059 ?auto_233060 ?auto_233061 ?auto_233062 ?auto_233063 ?auto_233064 ?auto_233065 ?auto_233066 ?auto_233067 ?auto_233068 ?auto_233069 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233083 - BLOCK
      ?auto_233084 - BLOCK
      ?auto_233085 - BLOCK
      ?auto_233086 - BLOCK
      ?auto_233087 - BLOCK
      ?auto_233088 - BLOCK
      ?auto_233089 - BLOCK
      ?auto_233090 - BLOCK
      ?auto_233091 - BLOCK
      ?auto_233092 - BLOCK
      ?auto_233093 - BLOCK
      ?auto_233094 - BLOCK
      ?auto_233095 - BLOCK
    )
    :vars
    (
      ?auto_233096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233095 ?auto_233096 ) ( ON-TABLE ?auto_233083 ) ( ON ?auto_233084 ?auto_233083 ) ( not ( = ?auto_233083 ?auto_233084 ) ) ( not ( = ?auto_233083 ?auto_233085 ) ) ( not ( = ?auto_233083 ?auto_233086 ) ) ( not ( = ?auto_233083 ?auto_233087 ) ) ( not ( = ?auto_233083 ?auto_233088 ) ) ( not ( = ?auto_233083 ?auto_233089 ) ) ( not ( = ?auto_233083 ?auto_233090 ) ) ( not ( = ?auto_233083 ?auto_233091 ) ) ( not ( = ?auto_233083 ?auto_233092 ) ) ( not ( = ?auto_233083 ?auto_233093 ) ) ( not ( = ?auto_233083 ?auto_233094 ) ) ( not ( = ?auto_233083 ?auto_233095 ) ) ( not ( = ?auto_233083 ?auto_233096 ) ) ( not ( = ?auto_233084 ?auto_233085 ) ) ( not ( = ?auto_233084 ?auto_233086 ) ) ( not ( = ?auto_233084 ?auto_233087 ) ) ( not ( = ?auto_233084 ?auto_233088 ) ) ( not ( = ?auto_233084 ?auto_233089 ) ) ( not ( = ?auto_233084 ?auto_233090 ) ) ( not ( = ?auto_233084 ?auto_233091 ) ) ( not ( = ?auto_233084 ?auto_233092 ) ) ( not ( = ?auto_233084 ?auto_233093 ) ) ( not ( = ?auto_233084 ?auto_233094 ) ) ( not ( = ?auto_233084 ?auto_233095 ) ) ( not ( = ?auto_233084 ?auto_233096 ) ) ( not ( = ?auto_233085 ?auto_233086 ) ) ( not ( = ?auto_233085 ?auto_233087 ) ) ( not ( = ?auto_233085 ?auto_233088 ) ) ( not ( = ?auto_233085 ?auto_233089 ) ) ( not ( = ?auto_233085 ?auto_233090 ) ) ( not ( = ?auto_233085 ?auto_233091 ) ) ( not ( = ?auto_233085 ?auto_233092 ) ) ( not ( = ?auto_233085 ?auto_233093 ) ) ( not ( = ?auto_233085 ?auto_233094 ) ) ( not ( = ?auto_233085 ?auto_233095 ) ) ( not ( = ?auto_233085 ?auto_233096 ) ) ( not ( = ?auto_233086 ?auto_233087 ) ) ( not ( = ?auto_233086 ?auto_233088 ) ) ( not ( = ?auto_233086 ?auto_233089 ) ) ( not ( = ?auto_233086 ?auto_233090 ) ) ( not ( = ?auto_233086 ?auto_233091 ) ) ( not ( = ?auto_233086 ?auto_233092 ) ) ( not ( = ?auto_233086 ?auto_233093 ) ) ( not ( = ?auto_233086 ?auto_233094 ) ) ( not ( = ?auto_233086 ?auto_233095 ) ) ( not ( = ?auto_233086 ?auto_233096 ) ) ( not ( = ?auto_233087 ?auto_233088 ) ) ( not ( = ?auto_233087 ?auto_233089 ) ) ( not ( = ?auto_233087 ?auto_233090 ) ) ( not ( = ?auto_233087 ?auto_233091 ) ) ( not ( = ?auto_233087 ?auto_233092 ) ) ( not ( = ?auto_233087 ?auto_233093 ) ) ( not ( = ?auto_233087 ?auto_233094 ) ) ( not ( = ?auto_233087 ?auto_233095 ) ) ( not ( = ?auto_233087 ?auto_233096 ) ) ( not ( = ?auto_233088 ?auto_233089 ) ) ( not ( = ?auto_233088 ?auto_233090 ) ) ( not ( = ?auto_233088 ?auto_233091 ) ) ( not ( = ?auto_233088 ?auto_233092 ) ) ( not ( = ?auto_233088 ?auto_233093 ) ) ( not ( = ?auto_233088 ?auto_233094 ) ) ( not ( = ?auto_233088 ?auto_233095 ) ) ( not ( = ?auto_233088 ?auto_233096 ) ) ( not ( = ?auto_233089 ?auto_233090 ) ) ( not ( = ?auto_233089 ?auto_233091 ) ) ( not ( = ?auto_233089 ?auto_233092 ) ) ( not ( = ?auto_233089 ?auto_233093 ) ) ( not ( = ?auto_233089 ?auto_233094 ) ) ( not ( = ?auto_233089 ?auto_233095 ) ) ( not ( = ?auto_233089 ?auto_233096 ) ) ( not ( = ?auto_233090 ?auto_233091 ) ) ( not ( = ?auto_233090 ?auto_233092 ) ) ( not ( = ?auto_233090 ?auto_233093 ) ) ( not ( = ?auto_233090 ?auto_233094 ) ) ( not ( = ?auto_233090 ?auto_233095 ) ) ( not ( = ?auto_233090 ?auto_233096 ) ) ( not ( = ?auto_233091 ?auto_233092 ) ) ( not ( = ?auto_233091 ?auto_233093 ) ) ( not ( = ?auto_233091 ?auto_233094 ) ) ( not ( = ?auto_233091 ?auto_233095 ) ) ( not ( = ?auto_233091 ?auto_233096 ) ) ( not ( = ?auto_233092 ?auto_233093 ) ) ( not ( = ?auto_233092 ?auto_233094 ) ) ( not ( = ?auto_233092 ?auto_233095 ) ) ( not ( = ?auto_233092 ?auto_233096 ) ) ( not ( = ?auto_233093 ?auto_233094 ) ) ( not ( = ?auto_233093 ?auto_233095 ) ) ( not ( = ?auto_233093 ?auto_233096 ) ) ( not ( = ?auto_233094 ?auto_233095 ) ) ( not ( = ?auto_233094 ?auto_233096 ) ) ( not ( = ?auto_233095 ?auto_233096 ) ) ( ON ?auto_233094 ?auto_233095 ) ( ON ?auto_233093 ?auto_233094 ) ( ON ?auto_233092 ?auto_233093 ) ( ON ?auto_233091 ?auto_233092 ) ( ON ?auto_233090 ?auto_233091 ) ( ON ?auto_233089 ?auto_233090 ) ( ON ?auto_233088 ?auto_233089 ) ( ON ?auto_233087 ?auto_233088 ) ( ON ?auto_233086 ?auto_233087 ) ( CLEAR ?auto_233084 ) ( ON ?auto_233085 ?auto_233086 ) ( CLEAR ?auto_233085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233083 ?auto_233084 ?auto_233085 )
      ( MAKE-13PILE ?auto_233083 ?auto_233084 ?auto_233085 ?auto_233086 ?auto_233087 ?auto_233088 ?auto_233089 ?auto_233090 ?auto_233091 ?auto_233092 ?auto_233093 ?auto_233094 ?auto_233095 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233110 - BLOCK
      ?auto_233111 - BLOCK
      ?auto_233112 - BLOCK
      ?auto_233113 - BLOCK
      ?auto_233114 - BLOCK
      ?auto_233115 - BLOCK
      ?auto_233116 - BLOCK
      ?auto_233117 - BLOCK
      ?auto_233118 - BLOCK
      ?auto_233119 - BLOCK
      ?auto_233120 - BLOCK
      ?auto_233121 - BLOCK
      ?auto_233122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_233122 ) ( ON-TABLE ?auto_233110 ) ( ON ?auto_233111 ?auto_233110 ) ( not ( = ?auto_233110 ?auto_233111 ) ) ( not ( = ?auto_233110 ?auto_233112 ) ) ( not ( = ?auto_233110 ?auto_233113 ) ) ( not ( = ?auto_233110 ?auto_233114 ) ) ( not ( = ?auto_233110 ?auto_233115 ) ) ( not ( = ?auto_233110 ?auto_233116 ) ) ( not ( = ?auto_233110 ?auto_233117 ) ) ( not ( = ?auto_233110 ?auto_233118 ) ) ( not ( = ?auto_233110 ?auto_233119 ) ) ( not ( = ?auto_233110 ?auto_233120 ) ) ( not ( = ?auto_233110 ?auto_233121 ) ) ( not ( = ?auto_233110 ?auto_233122 ) ) ( not ( = ?auto_233111 ?auto_233112 ) ) ( not ( = ?auto_233111 ?auto_233113 ) ) ( not ( = ?auto_233111 ?auto_233114 ) ) ( not ( = ?auto_233111 ?auto_233115 ) ) ( not ( = ?auto_233111 ?auto_233116 ) ) ( not ( = ?auto_233111 ?auto_233117 ) ) ( not ( = ?auto_233111 ?auto_233118 ) ) ( not ( = ?auto_233111 ?auto_233119 ) ) ( not ( = ?auto_233111 ?auto_233120 ) ) ( not ( = ?auto_233111 ?auto_233121 ) ) ( not ( = ?auto_233111 ?auto_233122 ) ) ( not ( = ?auto_233112 ?auto_233113 ) ) ( not ( = ?auto_233112 ?auto_233114 ) ) ( not ( = ?auto_233112 ?auto_233115 ) ) ( not ( = ?auto_233112 ?auto_233116 ) ) ( not ( = ?auto_233112 ?auto_233117 ) ) ( not ( = ?auto_233112 ?auto_233118 ) ) ( not ( = ?auto_233112 ?auto_233119 ) ) ( not ( = ?auto_233112 ?auto_233120 ) ) ( not ( = ?auto_233112 ?auto_233121 ) ) ( not ( = ?auto_233112 ?auto_233122 ) ) ( not ( = ?auto_233113 ?auto_233114 ) ) ( not ( = ?auto_233113 ?auto_233115 ) ) ( not ( = ?auto_233113 ?auto_233116 ) ) ( not ( = ?auto_233113 ?auto_233117 ) ) ( not ( = ?auto_233113 ?auto_233118 ) ) ( not ( = ?auto_233113 ?auto_233119 ) ) ( not ( = ?auto_233113 ?auto_233120 ) ) ( not ( = ?auto_233113 ?auto_233121 ) ) ( not ( = ?auto_233113 ?auto_233122 ) ) ( not ( = ?auto_233114 ?auto_233115 ) ) ( not ( = ?auto_233114 ?auto_233116 ) ) ( not ( = ?auto_233114 ?auto_233117 ) ) ( not ( = ?auto_233114 ?auto_233118 ) ) ( not ( = ?auto_233114 ?auto_233119 ) ) ( not ( = ?auto_233114 ?auto_233120 ) ) ( not ( = ?auto_233114 ?auto_233121 ) ) ( not ( = ?auto_233114 ?auto_233122 ) ) ( not ( = ?auto_233115 ?auto_233116 ) ) ( not ( = ?auto_233115 ?auto_233117 ) ) ( not ( = ?auto_233115 ?auto_233118 ) ) ( not ( = ?auto_233115 ?auto_233119 ) ) ( not ( = ?auto_233115 ?auto_233120 ) ) ( not ( = ?auto_233115 ?auto_233121 ) ) ( not ( = ?auto_233115 ?auto_233122 ) ) ( not ( = ?auto_233116 ?auto_233117 ) ) ( not ( = ?auto_233116 ?auto_233118 ) ) ( not ( = ?auto_233116 ?auto_233119 ) ) ( not ( = ?auto_233116 ?auto_233120 ) ) ( not ( = ?auto_233116 ?auto_233121 ) ) ( not ( = ?auto_233116 ?auto_233122 ) ) ( not ( = ?auto_233117 ?auto_233118 ) ) ( not ( = ?auto_233117 ?auto_233119 ) ) ( not ( = ?auto_233117 ?auto_233120 ) ) ( not ( = ?auto_233117 ?auto_233121 ) ) ( not ( = ?auto_233117 ?auto_233122 ) ) ( not ( = ?auto_233118 ?auto_233119 ) ) ( not ( = ?auto_233118 ?auto_233120 ) ) ( not ( = ?auto_233118 ?auto_233121 ) ) ( not ( = ?auto_233118 ?auto_233122 ) ) ( not ( = ?auto_233119 ?auto_233120 ) ) ( not ( = ?auto_233119 ?auto_233121 ) ) ( not ( = ?auto_233119 ?auto_233122 ) ) ( not ( = ?auto_233120 ?auto_233121 ) ) ( not ( = ?auto_233120 ?auto_233122 ) ) ( not ( = ?auto_233121 ?auto_233122 ) ) ( ON ?auto_233121 ?auto_233122 ) ( ON ?auto_233120 ?auto_233121 ) ( ON ?auto_233119 ?auto_233120 ) ( ON ?auto_233118 ?auto_233119 ) ( ON ?auto_233117 ?auto_233118 ) ( ON ?auto_233116 ?auto_233117 ) ( ON ?auto_233115 ?auto_233116 ) ( ON ?auto_233114 ?auto_233115 ) ( ON ?auto_233113 ?auto_233114 ) ( CLEAR ?auto_233111 ) ( ON ?auto_233112 ?auto_233113 ) ( CLEAR ?auto_233112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_233110 ?auto_233111 ?auto_233112 )
      ( MAKE-13PILE ?auto_233110 ?auto_233111 ?auto_233112 ?auto_233113 ?auto_233114 ?auto_233115 ?auto_233116 ?auto_233117 ?auto_233118 ?auto_233119 ?auto_233120 ?auto_233121 ?auto_233122 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233136 - BLOCK
      ?auto_233137 - BLOCK
      ?auto_233138 - BLOCK
      ?auto_233139 - BLOCK
      ?auto_233140 - BLOCK
      ?auto_233141 - BLOCK
      ?auto_233142 - BLOCK
      ?auto_233143 - BLOCK
      ?auto_233144 - BLOCK
      ?auto_233145 - BLOCK
      ?auto_233146 - BLOCK
      ?auto_233147 - BLOCK
      ?auto_233148 - BLOCK
    )
    :vars
    (
      ?auto_233149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233148 ?auto_233149 ) ( ON-TABLE ?auto_233136 ) ( not ( = ?auto_233136 ?auto_233137 ) ) ( not ( = ?auto_233136 ?auto_233138 ) ) ( not ( = ?auto_233136 ?auto_233139 ) ) ( not ( = ?auto_233136 ?auto_233140 ) ) ( not ( = ?auto_233136 ?auto_233141 ) ) ( not ( = ?auto_233136 ?auto_233142 ) ) ( not ( = ?auto_233136 ?auto_233143 ) ) ( not ( = ?auto_233136 ?auto_233144 ) ) ( not ( = ?auto_233136 ?auto_233145 ) ) ( not ( = ?auto_233136 ?auto_233146 ) ) ( not ( = ?auto_233136 ?auto_233147 ) ) ( not ( = ?auto_233136 ?auto_233148 ) ) ( not ( = ?auto_233136 ?auto_233149 ) ) ( not ( = ?auto_233137 ?auto_233138 ) ) ( not ( = ?auto_233137 ?auto_233139 ) ) ( not ( = ?auto_233137 ?auto_233140 ) ) ( not ( = ?auto_233137 ?auto_233141 ) ) ( not ( = ?auto_233137 ?auto_233142 ) ) ( not ( = ?auto_233137 ?auto_233143 ) ) ( not ( = ?auto_233137 ?auto_233144 ) ) ( not ( = ?auto_233137 ?auto_233145 ) ) ( not ( = ?auto_233137 ?auto_233146 ) ) ( not ( = ?auto_233137 ?auto_233147 ) ) ( not ( = ?auto_233137 ?auto_233148 ) ) ( not ( = ?auto_233137 ?auto_233149 ) ) ( not ( = ?auto_233138 ?auto_233139 ) ) ( not ( = ?auto_233138 ?auto_233140 ) ) ( not ( = ?auto_233138 ?auto_233141 ) ) ( not ( = ?auto_233138 ?auto_233142 ) ) ( not ( = ?auto_233138 ?auto_233143 ) ) ( not ( = ?auto_233138 ?auto_233144 ) ) ( not ( = ?auto_233138 ?auto_233145 ) ) ( not ( = ?auto_233138 ?auto_233146 ) ) ( not ( = ?auto_233138 ?auto_233147 ) ) ( not ( = ?auto_233138 ?auto_233148 ) ) ( not ( = ?auto_233138 ?auto_233149 ) ) ( not ( = ?auto_233139 ?auto_233140 ) ) ( not ( = ?auto_233139 ?auto_233141 ) ) ( not ( = ?auto_233139 ?auto_233142 ) ) ( not ( = ?auto_233139 ?auto_233143 ) ) ( not ( = ?auto_233139 ?auto_233144 ) ) ( not ( = ?auto_233139 ?auto_233145 ) ) ( not ( = ?auto_233139 ?auto_233146 ) ) ( not ( = ?auto_233139 ?auto_233147 ) ) ( not ( = ?auto_233139 ?auto_233148 ) ) ( not ( = ?auto_233139 ?auto_233149 ) ) ( not ( = ?auto_233140 ?auto_233141 ) ) ( not ( = ?auto_233140 ?auto_233142 ) ) ( not ( = ?auto_233140 ?auto_233143 ) ) ( not ( = ?auto_233140 ?auto_233144 ) ) ( not ( = ?auto_233140 ?auto_233145 ) ) ( not ( = ?auto_233140 ?auto_233146 ) ) ( not ( = ?auto_233140 ?auto_233147 ) ) ( not ( = ?auto_233140 ?auto_233148 ) ) ( not ( = ?auto_233140 ?auto_233149 ) ) ( not ( = ?auto_233141 ?auto_233142 ) ) ( not ( = ?auto_233141 ?auto_233143 ) ) ( not ( = ?auto_233141 ?auto_233144 ) ) ( not ( = ?auto_233141 ?auto_233145 ) ) ( not ( = ?auto_233141 ?auto_233146 ) ) ( not ( = ?auto_233141 ?auto_233147 ) ) ( not ( = ?auto_233141 ?auto_233148 ) ) ( not ( = ?auto_233141 ?auto_233149 ) ) ( not ( = ?auto_233142 ?auto_233143 ) ) ( not ( = ?auto_233142 ?auto_233144 ) ) ( not ( = ?auto_233142 ?auto_233145 ) ) ( not ( = ?auto_233142 ?auto_233146 ) ) ( not ( = ?auto_233142 ?auto_233147 ) ) ( not ( = ?auto_233142 ?auto_233148 ) ) ( not ( = ?auto_233142 ?auto_233149 ) ) ( not ( = ?auto_233143 ?auto_233144 ) ) ( not ( = ?auto_233143 ?auto_233145 ) ) ( not ( = ?auto_233143 ?auto_233146 ) ) ( not ( = ?auto_233143 ?auto_233147 ) ) ( not ( = ?auto_233143 ?auto_233148 ) ) ( not ( = ?auto_233143 ?auto_233149 ) ) ( not ( = ?auto_233144 ?auto_233145 ) ) ( not ( = ?auto_233144 ?auto_233146 ) ) ( not ( = ?auto_233144 ?auto_233147 ) ) ( not ( = ?auto_233144 ?auto_233148 ) ) ( not ( = ?auto_233144 ?auto_233149 ) ) ( not ( = ?auto_233145 ?auto_233146 ) ) ( not ( = ?auto_233145 ?auto_233147 ) ) ( not ( = ?auto_233145 ?auto_233148 ) ) ( not ( = ?auto_233145 ?auto_233149 ) ) ( not ( = ?auto_233146 ?auto_233147 ) ) ( not ( = ?auto_233146 ?auto_233148 ) ) ( not ( = ?auto_233146 ?auto_233149 ) ) ( not ( = ?auto_233147 ?auto_233148 ) ) ( not ( = ?auto_233147 ?auto_233149 ) ) ( not ( = ?auto_233148 ?auto_233149 ) ) ( ON ?auto_233147 ?auto_233148 ) ( ON ?auto_233146 ?auto_233147 ) ( ON ?auto_233145 ?auto_233146 ) ( ON ?auto_233144 ?auto_233145 ) ( ON ?auto_233143 ?auto_233144 ) ( ON ?auto_233142 ?auto_233143 ) ( ON ?auto_233141 ?auto_233142 ) ( ON ?auto_233140 ?auto_233141 ) ( ON ?auto_233139 ?auto_233140 ) ( ON ?auto_233138 ?auto_233139 ) ( CLEAR ?auto_233136 ) ( ON ?auto_233137 ?auto_233138 ) ( CLEAR ?auto_233137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233136 ?auto_233137 )
      ( MAKE-13PILE ?auto_233136 ?auto_233137 ?auto_233138 ?auto_233139 ?auto_233140 ?auto_233141 ?auto_233142 ?auto_233143 ?auto_233144 ?auto_233145 ?auto_233146 ?auto_233147 ?auto_233148 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233163 - BLOCK
      ?auto_233164 - BLOCK
      ?auto_233165 - BLOCK
      ?auto_233166 - BLOCK
      ?auto_233167 - BLOCK
      ?auto_233168 - BLOCK
      ?auto_233169 - BLOCK
      ?auto_233170 - BLOCK
      ?auto_233171 - BLOCK
      ?auto_233172 - BLOCK
      ?auto_233173 - BLOCK
      ?auto_233174 - BLOCK
      ?auto_233175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_233175 ) ( ON-TABLE ?auto_233163 ) ( not ( = ?auto_233163 ?auto_233164 ) ) ( not ( = ?auto_233163 ?auto_233165 ) ) ( not ( = ?auto_233163 ?auto_233166 ) ) ( not ( = ?auto_233163 ?auto_233167 ) ) ( not ( = ?auto_233163 ?auto_233168 ) ) ( not ( = ?auto_233163 ?auto_233169 ) ) ( not ( = ?auto_233163 ?auto_233170 ) ) ( not ( = ?auto_233163 ?auto_233171 ) ) ( not ( = ?auto_233163 ?auto_233172 ) ) ( not ( = ?auto_233163 ?auto_233173 ) ) ( not ( = ?auto_233163 ?auto_233174 ) ) ( not ( = ?auto_233163 ?auto_233175 ) ) ( not ( = ?auto_233164 ?auto_233165 ) ) ( not ( = ?auto_233164 ?auto_233166 ) ) ( not ( = ?auto_233164 ?auto_233167 ) ) ( not ( = ?auto_233164 ?auto_233168 ) ) ( not ( = ?auto_233164 ?auto_233169 ) ) ( not ( = ?auto_233164 ?auto_233170 ) ) ( not ( = ?auto_233164 ?auto_233171 ) ) ( not ( = ?auto_233164 ?auto_233172 ) ) ( not ( = ?auto_233164 ?auto_233173 ) ) ( not ( = ?auto_233164 ?auto_233174 ) ) ( not ( = ?auto_233164 ?auto_233175 ) ) ( not ( = ?auto_233165 ?auto_233166 ) ) ( not ( = ?auto_233165 ?auto_233167 ) ) ( not ( = ?auto_233165 ?auto_233168 ) ) ( not ( = ?auto_233165 ?auto_233169 ) ) ( not ( = ?auto_233165 ?auto_233170 ) ) ( not ( = ?auto_233165 ?auto_233171 ) ) ( not ( = ?auto_233165 ?auto_233172 ) ) ( not ( = ?auto_233165 ?auto_233173 ) ) ( not ( = ?auto_233165 ?auto_233174 ) ) ( not ( = ?auto_233165 ?auto_233175 ) ) ( not ( = ?auto_233166 ?auto_233167 ) ) ( not ( = ?auto_233166 ?auto_233168 ) ) ( not ( = ?auto_233166 ?auto_233169 ) ) ( not ( = ?auto_233166 ?auto_233170 ) ) ( not ( = ?auto_233166 ?auto_233171 ) ) ( not ( = ?auto_233166 ?auto_233172 ) ) ( not ( = ?auto_233166 ?auto_233173 ) ) ( not ( = ?auto_233166 ?auto_233174 ) ) ( not ( = ?auto_233166 ?auto_233175 ) ) ( not ( = ?auto_233167 ?auto_233168 ) ) ( not ( = ?auto_233167 ?auto_233169 ) ) ( not ( = ?auto_233167 ?auto_233170 ) ) ( not ( = ?auto_233167 ?auto_233171 ) ) ( not ( = ?auto_233167 ?auto_233172 ) ) ( not ( = ?auto_233167 ?auto_233173 ) ) ( not ( = ?auto_233167 ?auto_233174 ) ) ( not ( = ?auto_233167 ?auto_233175 ) ) ( not ( = ?auto_233168 ?auto_233169 ) ) ( not ( = ?auto_233168 ?auto_233170 ) ) ( not ( = ?auto_233168 ?auto_233171 ) ) ( not ( = ?auto_233168 ?auto_233172 ) ) ( not ( = ?auto_233168 ?auto_233173 ) ) ( not ( = ?auto_233168 ?auto_233174 ) ) ( not ( = ?auto_233168 ?auto_233175 ) ) ( not ( = ?auto_233169 ?auto_233170 ) ) ( not ( = ?auto_233169 ?auto_233171 ) ) ( not ( = ?auto_233169 ?auto_233172 ) ) ( not ( = ?auto_233169 ?auto_233173 ) ) ( not ( = ?auto_233169 ?auto_233174 ) ) ( not ( = ?auto_233169 ?auto_233175 ) ) ( not ( = ?auto_233170 ?auto_233171 ) ) ( not ( = ?auto_233170 ?auto_233172 ) ) ( not ( = ?auto_233170 ?auto_233173 ) ) ( not ( = ?auto_233170 ?auto_233174 ) ) ( not ( = ?auto_233170 ?auto_233175 ) ) ( not ( = ?auto_233171 ?auto_233172 ) ) ( not ( = ?auto_233171 ?auto_233173 ) ) ( not ( = ?auto_233171 ?auto_233174 ) ) ( not ( = ?auto_233171 ?auto_233175 ) ) ( not ( = ?auto_233172 ?auto_233173 ) ) ( not ( = ?auto_233172 ?auto_233174 ) ) ( not ( = ?auto_233172 ?auto_233175 ) ) ( not ( = ?auto_233173 ?auto_233174 ) ) ( not ( = ?auto_233173 ?auto_233175 ) ) ( not ( = ?auto_233174 ?auto_233175 ) ) ( ON ?auto_233174 ?auto_233175 ) ( ON ?auto_233173 ?auto_233174 ) ( ON ?auto_233172 ?auto_233173 ) ( ON ?auto_233171 ?auto_233172 ) ( ON ?auto_233170 ?auto_233171 ) ( ON ?auto_233169 ?auto_233170 ) ( ON ?auto_233168 ?auto_233169 ) ( ON ?auto_233167 ?auto_233168 ) ( ON ?auto_233166 ?auto_233167 ) ( ON ?auto_233165 ?auto_233166 ) ( CLEAR ?auto_233163 ) ( ON ?auto_233164 ?auto_233165 ) ( CLEAR ?auto_233164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233163 ?auto_233164 )
      ( MAKE-13PILE ?auto_233163 ?auto_233164 ?auto_233165 ?auto_233166 ?auto_233167 ?auto_233168 ?auto_233169 ?auto_233170 ?auto_233171 ?auto_233172 ?auto_233173 ?auto_233174 ?auto_233175 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233189 - BLOCK
      ?auto_233190 - BLOCK
      ?auto_233191 - BLOCK
      ?auto_233192 - BLOCK
      ?auto_233193 - BLOCK
      ?auto_233194 - BLOCK
      ?auto_233195 - BLOCK
      ?auto_233196 - BLOCK
      ?auto_233197 - BLOCK
      ?auto_233198 - BLOCK
      ?auto_233199 - BLOCK
      ?auto_233200 - BLOCK
      ?auto_233201 - BLOCK
    )
    :vars
    (
      ?auto_233202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233201 ?auto_233202 ) ( not ( = ?auto_233189 ?auto_233190 ) ) ( not ( = ?auto_233189 ?auto_233191 ) ) ( not ( = ?auto_233189 ?auto_233192 ) ) ( not ( = ?auto_233189 ?auto_233193 ) ) ( not ( = ?auto_233189 ?auto_233194 ) ) ( not ( = ?auto_233189 ?auto_233195 ) ) ( not ( = ?auto_233189 ?auto_233196 ) ) ( not ( = ?auto_233189 ?auto_233197 ) ) ( not ( = ?auto_233189 ?auto_233198 ) ) ( not ( = ?auto_233189 ?auto_233199 ) ) ( not ( = ?auto_233189 ?auto_233200 ) ) ( not ( = ?auto_233189 ?auto_233201 ) ) ( not ( = ?auto_233189 ?auto_233202 ) ) ( not ( = ?auto_233190 ?auto_233191 ) ) ( not ( = ?auto_233190 ?auto_233192 ) ) ( not ( = ?auto_233190 ?auto_233193 ) ) ( not ( = ?auto_233190 ?auto_233194 ) ) ( not ( = ?auto_233190 ?auto_233195 ) ) ( not ( = ?auto_233190 ?auto_233196 ) ) ( not ( = ?auto_233190 ?auto_233197 ) ) ( not ( = ?auto_233190 ?auto_233198 ) ) ( not ( = ?auto_233190 ?auto_233199 ) ) ( not ( = ?auto_233190 ?auto_233200 ) ) ( not ( = ?auto_233190 ?auto_233201 ) ) ( not ( = ?auto_233190 ?auto_233202 ) ) ( not ( = ?auto_233191 ?auto_233192 ) ) ( not ( = ?auto_233191 ?auto_233193 ) ) ( not ( = ?auto_233191 ?auto_233194 ) ) ( not ( = ?auto_233191 ?auto_233195 ) ) ( not ( = ?auto_233191 ?auto_233196 ) ) ( not ( = ?auto_233191 ?auto_233197 ) ) ( not ( = ?auto_233191 ?auto_233198 ) ) ( not ( = ?auto_233191 ?auto_233199 ) ) ( not ( = ?auto_233191 ?auto_233200 ) ) ( not ( = ?auto_233191 ?auto_233201 ) ) ( not ( = ?auto_233191 ?auto_233202 ) ) ( not ( = ?auto_233192 ?auto_233193 ) ) ( not ( = ?auto_233192 ?auto_233194 ) ) ( not ( = ?auto_233192 ?auto_233195 ) ) ( not ( = ?auto_233192 ?auto_233196 ) ) ( not ( = ?auto_233192 ?auto_233197 ) ) ( not ( = ?auto_233192 ?auto_233198 ) ) ( not ( = ?auto_233192 ?auto_233199 ) ) ( not ( = ?auto_233192 ?auto_233200 ) ) ( not ( = ?auto_233192 ?auto_233201 ) ) ( not ( = ?auto_233192 ?auto_233202 ) ) ( not ( = ?auto_233193 ?auto_233194 ) ) ( not ( = ?auto_233193 ?auto_233195 ) ) ( not ( = ?auto_233193 ?auto_233196 ) ) ( not ( = ?auto_233193 ?auto_233197 ) ) ( not ( = ?auto_233193 ?auto_233198 ) ) ( not ( = ?auto_233193 ?auto_233199 ) ) ( not ( = ?auto_233193 ?auto_233200 ) ) ( not ( = ?auto_233193 ?auto_233201 ) ) ( not ( = ?auto_233193 ?auto_233202 ) ) ( not ( = ?auto_233194 ?auto_233195 ) ) ( not ( = ?auto_233194 ?auto_233196 ) ) ( not ( = ?auto_233194 ?auto_233197 ) ) ( not ( = ?auto_233194 ?auto_233198 ) ) ( not ( = ?auto_233194 ?auto_233199 ) ) ( not ( = ?auto_233194 ?auto_233200 ) ) ( not ( = ?auto_233194 ?auto_233201 ) ) ( not ( = ?auto_233194 ?auto_233202 ) ) ( not ( = ?auto_233195 ?auto_233196 ) ) ( not ( = ?auto_233195 ?auto_233197 ) ) ( not ( = ?auto_233195 ?auto_233198 ) ) ( not ( = ?auto_233195 ?auto_233199 ) ) ( not ( = ?auto_233195 ?auto_233200 ) ) ( not ( = ?auto_233195 ?auto_233201 ) ) ( not ( = ?auto_233195 ?auto_233202 ) ) ( not ( = ?auto_233196 ?auto_233197 ) ) ( not ( = ?auto_233196 ?auto_233198 ) ) ( not ( = ?auto_233196 ?auto_233199 ) ) ( not ( = ?auto_233196 ?auto_233200 ) ) ( not ( = ?auto_233196 ?auto_233201 ) ) ( not ( = ?auto_233196 ?auto_233202 ) ) ( not ( = ?auto_233197 ?auto_233198 ) ) ( not ( = ?auto_233197 ?auto_233199 ) ) ( not ( = ?auto_233197 ?auto_233200 ) ) ( not ( = ?auto_233197 ?auto_233201 ) ) ( not ( = ?auto_233197 ?auto_233202 ) ) ( not ( = ?auto_233198 ?auto_233199 ) ) ( not ( = ?auto_233198 ?auto_233200 ) ) ( not ( = ?auto_233198 ?auto_233201 ) ) ( not ( = ?auto_233198 ?auto_233202 ) ) ( not ( = ?auto_233199 ?auto_233200 ) ) ( not ( = ?auto_233199 ?auto_233201 ) ) ( not ( = ?auto_233199 ?auto_233202 ) ) ( not ( = ?auto_233200 ?auto_233201 ) ) ( not ( = ?auto_233200 ?auto_233202 ) ) ( not ( = ?auto_233201 ?auto_233202 ) ) ( ON ?auto_233200 ?auto_233201 ) ( ON ?auto_233199 ?auto_233200 ) ( ON ?auto_233198 ?auto_233199 ) ( ON ?auto_233197 ?auto_233198 ) ( ON ?auto_233196 ?auto_233197 ) ( ON ?auto_233195 ?auto_233196 ) ( ON ?auto_233194 ?auto_233195 ) ( ON ?auto_233193 ?auto_233194 ) ( ON ?auto_233192 ?auto_233193 ) ( ON ?auto_233191 ?auto_233192 ) ( ON ?auto_233190 ?auto_233191 ) ( ON ?auto_233189 ?auto_233190 ) ( CLEAR ?auto_233189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233189 )
      ( MAKE-13PILE ?auto_233189 ?auto_233190 ?auto_233191 ?auto_233192 ?auto_233193 ?auto_233194 ?auto_233195 ?auto_233196 ?auto_233197 ?auto_233198 ?auto_233199 ?auto_233200 ?auto_233201 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233216 - BLOCK
      ?auto_233217 - BLOCK
      ?auto_233218 - BLOCK
      ?auto_233219 - BLOCK
      ?auto_233220 - BLOCK
      ?auto_233221 - BLOCK
      ?auto_233222 - BLOCK
      ?auto_233223 - BLOCK
      ?auto_233224 - BLOCK
      ?auto_233225 - BLOCK
      ?auto_233226 - BLOCK
      ?auto_233227 - BLOCK
      ?auto_233228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_233228 ) ( not ( = ?auto_233216 ?auto_233217 ) ) ( not ( = ?auto_233216 ?auto_233218 ) ) ( not ( = ?auto_233216 ?auto_233219 ) ) ( not ( = ?auto_233216 ?auto_233220 ) ) ( not ( = ?auto_233216 ?auto_233221 ) ) ( not ( = ?auto_233216 ?auto_233222 ) ) ( not ( = ?auto_233216 ?auto_233223 ) ) ( not ( = ?auto_233216 ?auto_233224 ) ) ( not ( = ?auto_233216 ?auto_233225 ) ) ( not ( = ?auto_233216 ?auto_233226 ) ) ( not ( = ?auto_233216 ?auto_233227 ) ) ( not ( = ?auto_233216 ?auto_233228 ) ) ( not ( = ?auto_233217 ?auto_233218 ) ) ( not ( = ?auto_233217 ?auto_233219 ) ) ( not ( = ?auto_233217 ?auto_233220 ) ) ( not ( = ?auto_233217 ?auto_233221 ) ) ( not ( = ?auto_233217 ?auto_233222 ) ) ( not ( = ?auto_233217 ?auto_233223 ) ) ( not ( = ?auto_233217 ?auto_233224 ) ) ( not ( = ?auto_233217 ?auto_233225 ) ) ( not ( = ?auto_233217 ?auto_233226 ) ) ( not ( = ?auto_233217 ?auto_233227 ) ) ( not ( = ?auto_233217 ?auto_233228 ) ) ( not ( = ?auto_233218 ?auto_233219 ) ) ( not ( = ?auto_233218 ?auto_233220 ) ) ( not ( = ?auto_233218 ?auto_233221 ) ) ( not ( = ?auto_233218 ?auto_233222 ) ) ( not ( = ?auto_233218 ?auto_233223 ) ) ( not ( = ?auto_233218 ?auto_233224 ) ) ( not ( = ?auto_233218 ?auto_233225 ) ) ( not ( = ?auto_233218 ?auto_233226 ) ) ( not ( = ?auto_233218 ?auto_233227 ) ) ( not ( = ?auto_233218 ?auto_233228 ) ) ( not ( = ?auto_233219 ?auto_233220 ) ) ( not ( = ?auto_233219 ?auto_233221 ) ) ( not ( = ?auto_233219 ?auto_233222 ) ) ( not ( = ?auto_233219 ?auto_233223 ) ) ( not ( = ?auto_233219 ?auto_233224 ) ) ( not ( = ?auto_233219 ?auto_233225 ) ) ( not ( = ?auto_233219 ?auto_233226 ) ) ( not ( = ?auto_233219 ?auto_233227 ) ) ( not ( = ?auto_233219 ?auto_233228 ) ) ( not ( = ?auto_233220 ?auto_233221 ) ) ( not ( = ?auto_233220 ?auto_233222 ) ) ( not ( = ?auto_233220 ?auto_233223 ) ) ( not ( = ?auto_233220 ?auto_233224 ) ) ( not ( = ?auto_233220 ?auto_233225 ) ) ( not ( = ?auto_233220 ?auto_233226 ) ) ( not ( = ?auto_233220 ?auto_233227 ) ) ( not ( = ?auto_233220 ?auto_233228 ) ) ( not ( = ?auto_233221 ?auto_233222 ) ) ( not ( = ?auto_233221 ?auto_233223 ) ) ( not ( = ?auto_233221 ?auto_233224 ) ) ( not ( = ?auto_233221 ?auto_233225 ) ) ( not ( = ?auto_233221 ?auto_233226 ) ) ( not ( = ?auto_233221 ?auto_233227 ) ) ( not ( = ?auto_233221 ?auto_233228 ) ) ( not ( = ?auto_233222 ?auto_233223 ) ) ( not ( = ?auto_233222 ?auto_233224 ) ) ( not ( = ?auto_233222 ?auto_233225 ) ) ( not ( = ?auto_233222 ?auto_233226 ) ) ( not ( = ?auto_233222 ?auto_233227 ) ) ( not ( = ?auto_233222 ?auto_233228 ) ) ( not ( = ?auto_233223 ?auto_233224 ) ) ( not ( = ?auto_233223 ?auto_233225 ) ) ( not ( = ?auto_233223 ?auto_233226 ) ) ( not ( = ?auto_233223 ?auto_233227 ) ) ( not ( = ?auto_233223 ?auto_233228 ) ) ( not ( = ?auto_233224 ?auto_233225 ) ) ( not ( = ?auto_233224 ?auto_233226 ) ) ( not ( = ?auto_233224 ?auto_233227 ) ) ( not ( = ?auto_233224 ?auto_233228 ) ) ( not ( = ?auto_233225 ?auto_233226 ) ) ( not ( = ?auto_233225 ?auto_233227 ) ) ( not ( = ?auto_233225 ?auto_233228 ) ) ( not ( = ?auto_233226 ?auto_233227 ) ) ( not ( = ?auto_233226 ?auto_233228 ) ) ( not ( = ?auto_233227 ?auto_233228 ) ) ( ON ?auto_233227 ?auto_233228 ) ( ON ?auto_233226 ?auto_233227 ) ( ON ?auto_233225 ?auto_233226 ) ( ON ?auto_233224 ?auto_233225 ) ( ON ?auto_233223 ?auto_233224 ) ( ON ?auto_233222 ?auto_233223 ) ( ON ?auto_233221 ?auto_233222 ) ( ON ?auto_233220 ?auto_233221 ) ( ON ?auto_233219 ?auto_233220 ) ( ON ?auto_233218 ?auto_233219 ) ( ON ?auto_233217 ?auto_233218 ) ( ON ?auto_233216 ?auto_233217 ) ( CLEAR ?auto_233216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_233216 )
      ( MAKE-13PILE ?auto_233216 ?auto_233217 ?auto_233218 ?auto_233219 ?auto_233220 ?auto_233221 ?auto_233222 ?auto_233223 ?auto_233224 ?auto_233225 ?auto_233226 ?auto_233227 ?auto_233228 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_233242 - BLOCK
      ?auto_233243 - BLOCK
      ?auto_233244 - BLOCK
      ?auto_233245 - BLOCK
      ?auto_233246 - BLOCK
      ?auto_233247 - BLOCK
      ?auto_233248 - BLOCK
      ?auto_233249 - BLOCK
      ?auto_233250 - BLOCK
      ?auto_233251 - BLOCK
      ?auto_233252 - BLOCK
      ?auto_233253 - BLOCK
      ?auto_233254 - BLOCK
    )
    :vars
    (
      ?auto_233255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_233242 ?auto_233243 ) ) ( not ( = ?auto_233242 ?auto_233244 ) ) ( not ( = ?auto_233242 ?auto_233245 ) ) ( not ( = ?auto_233242 ?auto_233246 ) ) ( not ( = ?auto_233242 ?auto_233247 ) ) ( not ( = ?auto_233242 ?auto_233248 ) ) ( not ( = ?auto_233242 ?auto_233249 ) ) ( not ( = ?auto_233242 ?auto_233250 ) ) ( not ( = ?auto_233242 ?auto_233251 ) ) ( not ( = ?auto_233242 ?auto_233252 ) ) ( not ( = ?auto_233242 ?auto_233253 ) ) ( not ( = ?auto_233242 ?auto_233254 ) ) ( not ( = ?auto_233243 ?auto_233244 ) ) ( not ( = ?auto_233243 ?auto_233245 ) ) ( not ( = ?auto_233243 ?auto_233246 ) ) ( not ( = ?auto_233243 ?auto_233247 ) ) ( not ( = ?auto_233243 ?auto_233248 ) ) ( not ( = ?auto_233243 ?auto_233249 ) ) ( not ( = ?auto_233243 ?auto_233250 ) ) ( not ( = ?auto_233243 ?auto_233251 ) ) ( not ( = ?auto_233243 ?auto_233252 ) ) ( not ( = ?auto_233243 ?auto_233253 ) ) ( not ( = ?auto_233243 ?auto_233254 ) ) ( not ( = ?auto_233244 ?auto_233245 ) ) ( not ( = ?auto_233244 ?auto_233246 ) ) ( not ( = ?auto_233244 ?auto_233247 ) ) ( not ( = ?auto_233244 ?auto_233248 ) ) ( not ( = ?auto_233244 ?auto_233249 ) ) ( not ( = ?auto_233244 ?auto_233250 ) ) ( not ( = ?auto_233244 ?auto_233251 ) ) ( not ( = ?auto_233244 ?auto_233252 ) ) ( not ( = ?auto_233244 ?auto_233253 ) ) ( not ( = ?auto_233244 ?auto_233254 ) ) ( not ( = ?auto_233245 ?auto_233246 ) ) ( not ( = ?auto_233245 ?auto_233247 ) ) ( not ( = ?auto_233245 ?auto_233248 ) ) ( not ( = ?auto_233245 ?auto_233249 ) ) ( not ( = ?auto_233245 ?auto_233250 ) ) ( not ( = ?auto_233245 ?auto_233251 ) ) ( not ( = ?auto_233245 ?auto_233252 ) ) ( not ( = ?auto_233245 ?auto_233253 ) ) ( not ( = ?auto_233245 ?auto_233254 ) ) ( not ( = ?auto_233246 ?auto_233247 ) ) ( not ( = ?auto_233246 ?auto_233248 ) ) ( not ( = ?auto_233246 ?auto_233249 ) ) ( not ( = ?auto_233246 ?auto_233250 ) ) ( not ( = ?auto_233246 ?auto_233251 ) ) ( not ( = ?auto_233246 ?auto_233252 ) ) ( not ( = ?auto_233246 ?auto_233253 ) ) ( not ( = ?auto_233246 ?auto_233254 ) ) ( not ( = ?auto_233247 ?auto_233248 ) ) ( not ( = ?auto_233247 ?auto_233249 ) ) ( not ( = ?auto_233247 ?auto_233250 ) ) ( not ( = ?auto_233247 ?auto_233251 ) ) ( not ( = ?auto_233247 ?auto_233252 ) ) ( not ( = ?auto_233247 ?auto_233253 ) ) ( not ( = ?auto_233247 ?auto_233254 ) ) ( not ( = ?auto_233248 ?auto_233249 ) ) ( not ( = ?auto_233248 ?auto_233250 ) ) ( not ( = ?auto_233248 ?auto_233251 ) ) ( not ( = ?auto_233248 ?auto_233252 ) ) ( not ( = ?auto_233248 ?auto_233253 ) ) ( not ( = ?auto_233248 ?auto_233254 ) ) ( not ( = ?auto_233249 ?auto_233250 ) ) ( not ( = ?auto_233249 ?auto_233251 ) ) ( not ( = ?auto_233249 ?auto_233252 ) ) ( not ( = ?auto_233249 ?auto_233253 ) ) ( not ( = ?auto_233249 ?auto_233254 ) ) ( not ( = ?auto_233250 ?auto_233251 ) ) ( not ( = ?auto_233250 ?auto_233252 ) ) ( not ( = ?auto_233250 ?auto_233253 ) ) ( not ( = ?auto_233250 ?auto_233254 ) ) ( not ( = ?auto_233251 ?auto_233252 ) ) ( not ( = ?auto_233251 ?auto_233253 ) ) ( not ( = ?auto_233251 ?auto_233254 ) ) ( not ( = ?auto_233252 ?auto_233253 ) ) ( not ( = ?auto_233252 ?auto_233254 ) ) ( not ( = ?auto_233253 ?auto_233254 ) ) ( ON ?auto_233242 ?auto_233255 ) ( not ( = ?auto_233254 ?auto_233255 ) ) ( not ( = ?auto_233253 ?auto_233255 ) ) ( not ( = ?auto_233252 ?auto_233255 ) ) ( not ( = ?auto_233251 ?auto_233255 ) ) ( not ( = ?auto_233250 ?auto_233255 ) ) ( not ( = ?auto_233249 ?auto_233255 ) ) ( not ( = ?auto_233248 ?auto_233255 ) ) ( not ( = ?auto_233247 ?auto_233255 ) ) ( not ( = ?auto_233246 ?auto_233255 ) ) ( not ( = ?auto_233245 ?auto_233255 ) ) ( not ( = ?auto_233244 ?auto_233255 ) ) ( not ( = ?auto_233243 ?auto_233255 ) ) ( not ( = ?auto_233242 ?auto_233255 ) ) ( ON ?auto_233243 ?auto_233242 ) ( ON ?auto_233244 ?auto_233243 ) ( ON ?auto_233245 ?auto_233244 ) ( ON ?auto_233246 ?auto_233245 ) ( ON ?auto_233247 ?auto_233246 ) ( ON ?auto_233248 ?auto_233247 ) ( ON ?auto_233249 ?auto_233248 ) ( ON ?auto_233250 ?auto_233249 ) ( ON ?auto_233251 ?auto_233250 ) ( ON ?auto_233252 ?auto_233251 ) ( ON ?auto_233253 ?auto_233252 ) ( ON ?auto_233254 ?auto_233253 ) ( CLEAR ?auto_233254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_233254 ?auto_233253 ?auto_233252 ?auto_233251 ?auto_233250 ?auto_233249 ?auto_233248 ?auto_233247 ?auto_233246 ?auto_233245 ?auto_233244 ?auto_233243 ?auto_233242 )
      ( MAKE-13PILE ?auto_233242 ?auto_233243 ?auto_233244 ?auto_233245 ?auto_233246 ?auto_233247 ?auto_233248 ?auto_233249 ?auto_233250 ?auto_233251 ?auto_233252 ?auto_233253 ?auto_233254 ) )
  )

)

