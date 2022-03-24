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
      ?auto_86809 - BLOCK
    )
    :vars
    (
      ?auto_86810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86809 ?auto_86810 ) ( CLEAR ?auto_86809 ) ( HAND-EMPTY ) ( not ( = ?auto_86809 ?auto_86810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86809 ?auto_86810 )
      ( !PUTDOWN ?auto_86809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86816 - BLOCK
      ?auto_86817 - BLOCK
    )
    :vars
    (
      ?auto_86818 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86816 ) ( ON ?auto_86817 ?auto_86818 ) ( CLEAR ?auto_86817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86816 ) ( not ( = ?auto_86816 ?auto_86817 ) ) ( not ( = ?auto_86816 ?auto_86818 ) ) ( not ( = ?auto_86817 ?auto_86818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86817 ?auto_86818 )
      ( !STACK ?auto_86817 ?auto_86816 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_86826 - BLOCK
      ?auto_86827 - BLOCK
    )
    :vars
    (
      ?auto_86828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86827 ?auto_86828 ) ( not ( = ?auto_86826 ?auto_86827 ) ) ( not ( = ?auto_86826 ?auto_86828 ) ) ( not ( = ?auto_86827 ?auto_86828 ) ) ( ON ?auto_86826 ?auto_86827 ) ( CLEAR ?auto_86826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86826 )
      ( MAKE-2PILE ?auto_86826 ?auto_86827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86837 - BLOCK
      ?auto_86838 - BLOCK
      ?auto_86839 - BLOCK
    )
    :vars
    (
      ?auto_86840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86838 ) ( ON ?auto_86839 ?auto_86840 ) ( CLEAR ?auto_86839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86837 ) ( ON ?auto_86838 ?auto_86837 ) ( not ( = ?auto_86837 ?auto_86838 ) ) ( not ( = ?auto_86837 ?auto_86839 ) ) ( not ( = ?auto_86837 ?auto_86840 ) ) ( not ( = ?auto_86838 ?auto_86839 ) ) ( not ( = ?auto_86838 ?auto_86840 ) ) ( not ( = ?auto_86839 ?auto_86840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86839 ?auto_86840 )
      ( !STACK ?auto_86839 ?auto_86838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86851 - BLOCK
      ?auto_86852 - BLOCK
      ?auto_86853 - BLOCK
    )
    :vars
    (
      ?auto_86854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86853 ?auto_86854 ) ( ON-TABLE ?auto_86851 ) ( not ( = ?auto_86851 ?auto_86852 ) ) ( not ( = ?auto_86851 ?auto_86853 ) ) ( not ( = ?auto_86851 ?auto_86854 ) ) ( not ( = ?auto_86852 ?auto_86853 ) ) ( not ( = ?auto_86852 ?auto_86854 ) ) ( not ( = ?auto_86853 ?auto_86854 ) ) ( CLEAR ?auto_86851 ) ( ON ?auto_86852 ?auto_86853 ) ( CLEAR ?auto_86852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86851 ?auto_86852 )
      ( MAKE-3PILE ?auto_86851 ?auto_86852 ?auto_86853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_86865 - BLOCK
      ?auto_86866 - BLOCK
      ?auto_86867 - BLOCK
    )
    :vars
    (
      ?auto_86868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86867 ?auto_86868 ) ( not ( = ?auto_86865 ?auto_86866 ) ) ( not ( = ?auto_86865 ?auto_86867 ) ) ( not ( = ?auto_86865 ?auto_86868 ) ) ( not ( = ?auto_86866 ?auto_86867 ) ) ( not ( = ?auto_86866 ?auto_86868 ) ) ( not ( = ?auto_86867 ?auto_86868 ) ) ( ON ?auto_86866 ?auto_86867 ) ( ON ?auto_86865 ?auto_86866 ) ( CLEAR ?auto_86865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86865 )
      ( MAKE-3PILE ?auto_86865 ?auto_86866 ?auto_86867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86880 - BLOCK
      ?auto_86881 - BLOCK
      ?auto_86882 - BLOCK
      ?auto_86883 - BLOCK
    )
    :vars
    (
      ?auto_86884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86882 ) ( ON ?auto_86883 ?auto_86884 ) ( CLEAR ?auto_86883 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86880 ) ( ON ?auto_86881 ?auto_86880 ) ( ON ?auto_86882 ?auto_86881 ) ( not ( = ?auto_86880 ?auto_86881 ) ) ( not ( = ?auto_86880 ?auto_86882 ) ) ( not ( = ?auto_86880 ?auto_86883 ) ) ( not ( = ?auto_86880 ?auto_86884 ) ) ( not ( = ?auto_86881 ?auto_86882 ) ) ( not ( = ?auto_86881 ?auto_86883 ) ) ( not ( = ?auto_86881 ?auto_86884 ) ) ( not ( = ?auto_86882 ?auto_86883 ) ) ( not ( = ?auto_86882 ?auto_86884 ) ) ( not ( = ?auto_86883 ?auto_86884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86883 ?auto_86884 )
      ( !STACK ?auto_86883 ?auto_86882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86898 - BLOCK
      ?auto_86899 - BLOCK
      ?auto_86900 - BLOCK
      ?auto_86901 - BLOCK
    )
    :vars
    (
      ?auto_86902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86901 ?auto_86902 ) ( ON-TABLE ?auto_86898 ) ( ON ?auto_86899 ?auto_86898 ) ( not ( = ?auto_86898 ?auto_86899 ) ) ( not ( = ?auto_86898 ?auto_86900 ) ) ( not ( = ?auto_86898 ?auto_86901 ) ) ( not ( = ?auto_86898 ?auto_86902 ) ) ( not ( = ?auto_86899 ?auto_86900 ) ) ( not ( = ?auto_86899 ?auto_86901 ) ) ( not ( = ?auto_86899 ?auto_86902 ) ) ( not ( = ?auto_86900 ?auto_86901 ) ) ( not ( = ?auto_86900 ?auto_86902 ) ) ( not ( = ?auto_86901 ?auto_86902 ) ) ( CLEAR ?auto_86899 ) ( ON ?auto_86900 ?auto_86901 ) ( CLEAR ?auto_86900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86898 ?auto_86899 ?auto_86900 )
      ( MAKE-4PILE ?auto_86898 ?auto_86899 ?auto_86900 ?auto_86901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86916 - BLOCK
      ?auto_86917 - BLOCK
      ?auto_86918 - BLOCK
      ?auto_86919 - BLOCK
    )
    :vars
    (
      ?auto_86920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86919 ?auto_86920 ) ( ON-TABLE ?auto_86916 ) ( not ( = ?auto_86916 ?auto_86917 ) ) ( not ( = ?auto_86916 ?auto_86918 ) ) ( not ( = ?auto_86916 ?auto_86919 ) ) ( not ( = ?auto_86916 ?auto_86920 ) ) ( not ( = ?auto_86917 ?auto_86918 ) ) ( not ( = ?auto_86917 ?auto_86919 ) ) ( not ( = ?auto_86917 ?auto_86920 ) ) ( not ( = ?auto_86918 ?auto_86919 ) ) ( not ( = ?auto_86918 ?auto_86920 ) ) ( not ( = ?auto_86919 ?auto_86920 ) ) ( ON ?auto_86918 ?auto_86919 ) ( CLEAR ?auto_86916 ) ( ON ?auto_86917 ?auto_86918 ) ( CLEAR ?auto_86917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86916 ?auto_86917 )
      ( MAKE-4PILE ?auto_86916 ?auto_86917 ?auto_86918 ?auto_86919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_86934 - BLOCK
      ?auto_86935 - BLOCK
      ?auto_86936 - BLOCK
      ?auto_86937 - BLOCK
    )
    :vars
    (
      ?auto_86938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86937 ?auto_86938 ) ( not ( = ?auto_86934 ?auto_86935 ) ) ( not ( = ?auto_86934 ?auto_86936 ) ) ( not ( = ?auto_86934 ?auto_86937 ) ) ( not ( = ?auto_86934 ?auto_86938 ) ) ( not ( = ?auto_86935 ?auto_86936 ) ) ( not ( = ?auto_86935 ?auto_86937 ) ) ( not ( = ?auto_86935 ?auto_86938 ) ) ( not ( = ?auto_86936 ?auto_86937 ) ) ( not ( = ?auto_86936 ?auto_86938 ) ) ( not ( = ?auto_86937 ?auto_86938 ) ) ( ON ?auto_86936 ?auto_86937 ) ( ON ?auto_86935 ?auto_86936 ) ( ON ?auto_86934 ?auto_86935 ) ( CLEAR ?auto_86934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86934 )
      ( MAKE-4PILE ?auto_86934 ?auto_86935 ?auto_86936 ?auto_86937 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86953 - BLOCK
      ?auto_86954 - BLOCK
      ?auto_86955 - BLOCK
      ?auto_86956 - BLOCK
      ?auto_86957 - BLOCK
    )
    :vars
    (
      ?auto_86958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86956 ) ( ON ?auto_86957 ?auto_86958 ) ( CLEAR ?auto_86957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86953 ) ( ON ?auto_86954 ?auto_86953 ) ( ON ?auto_86955 ?auto_86954 ) ( ON ?auto_86956 ?auto_86955 ) ( not ( = ?auto_86953 ?auto_86954 ) ) ( not ( = ?auto_86953 ?auto_86955 ) ) ( not ( = ?auto_86953 ?auto_86956 ) ) ( not ( = ?auto_86953 ?auto_86957 ) ) ( not ( = ?auto_86953 ?auto_86958 ) ) ( not ( = ?auto_86954 ?auto_86955 ) ) ( not ( = ?auto_86954 ?auto_86956 ) ) ( not ( = ?auto_86954 ?auto_86957 ) ) ( not ( = ?auto_86954 ?auto_86958 ) ) ( not ( = ?auto_86955 ?auto_86956 ) ) ( not ( = ?auto_86955 ?auto_86957 ) ) ( not ( = ?auto_86955 ?auto_86958 ) ) ( not ( = ?auto_86956 ?auto_86957 ) ) ( not ( = ?auto_86956 ?auto_86958 ) ) ( not ( = ?auto_86957 ?auto_86958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86957 ?auto_86958 )
      ( !STACK ?auto_86957 ?auto_86956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86975 - BLOCK
      ?auto_86976 - BLOCK
      ?auto_86977 - BLOCK
      ?auto_86978 - BLOCK
      ?auto_86979 - BLOCK
    )
    :vars
    (
      ?auto_86980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86979 ?auto_86980 ) ( ON-TABLE ?auto_86975 ) ( ON ?auto_86976 ?auto_86975 ) ( ON ?auto_86977 ?auto_86976 ) ( not ( = ?auto_86975 ?auto_86976 ) ) ( not ( = ?auto_86975 ?auto_86977 ) ) ( not ( = ?auto_86975 ?auto_86978 ) ) ( not ( = ?auto_86975 ?auto_86979 ) ) ( not ( = ?auto_86975 ?auto_86980 ) ) ( not ( = ?auto_86976 ?auto_86977 ) ) ( not ( = ?auto_86976 ?auto_86978 ) ) ( not ( = ?auto_86976 ?auto_86979 ) ) ( not ( = ?auto_86976 ?auto_86980 ) ) ( not ( = ?auto_86977 ?auto_86978 ) ) ( not ( = ?auto_86977 ?auto_86979 ) ) ( not ( = ?auto_86977 ?auto_86980 ) ) ( not ( = ?auto_86978 ?auto_86979 ) ) ( not ( = ?auto_86978 ?auto_86980 ) ) ( not ( = ?auto_86979 ?auto_86980 ) ) ( CLEAR ?auto_86977 ) ( ON ?auto_86978 ?auto_86979 ) ( CLEAR ?auto_86978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86975 ?auto_86976 ?auto_86977 ?auto_86978 )
      ( MAKE-5PILE ?auto_86975 ?auto_86976 ?auto_86977 ?auto_86978 ?auto_86979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86997 - BLOCK
      ?auto_86998 - BLOCK
      ?auto_86999 - BLOCK
      ?auto_87000 - BLOCK
      ?auto_87001 - BLOCK
    )
    :vars
    (
      ?auto_87002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87001 ?auto_87002 ) ( ON-TABLE ?auto_86997 ) ( ON ?auto_86998 ?auto_86997 ) ( not ( = ?auto_86997 ?auto_86998 ) ) ( not ( = ?auto_86997 ?auto_86999 ) ) ( not ( = ?auto_86997 ?auto_87000 ) ) ( not ( = ?auto_86997 ?auto_87001 ) ) ( not ( = ?auto_86997 ?auto_87002 ) ) ( not ( = ?auto_86998 ?auto_86999 ) ) ( not ( = ?auto_86998 ?auto_87000 ) ) ( not ( = ?auto_86998 ?auto_87001 ) ) ( not ( = ?auto_86998 ?auto_87002 ) ) ( not ( = ?auto_86999 ?auto_87000 ) ) ( not ( = ?auto_86999 ?auto_87001 ) ) ( not ( = ?auto_86999 ?auto_87002 ) ) ( not ( = ?auto_87000 ?auto_87001 ) ) ( not ( = ?auto_87000 ?auto_87002 ) ) ( not ( = ?auto_87001 ?auto_87002 ) ) ( ON ?auto_87000 ?auto_87001 ) ( CLEAR ?auto_86998 ) ( ON ?auto_86999 ?auto_87000 ) ( CLEAR ?auto_86999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86997 ?auto_86998 ?auto_86999 )
      ( MAKE-5PILE ?auto_86997 ?auto_86998 ?auto_86999 ?auto_87000 ?auto_87001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87019 - BLOCK
      ?auto_87020 - BLOCK
      ?auto_87021 - BLOCK
      ?auto_87022 - BLOCK
      ?auto_87023 - BLOCK
    )
    :vars
    (
      ?auto_87024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87023 ?auto_87024 ) ( ON-TABLE ?auto_87019 ) ( not ( = ?auto_87019 ?auto_87020 ) ) ( not ( = ?auto_87019 ?auto_87021 ) ) ( not ( = ?auto_87019 ?auto_87022 ) ) ( not ( = ?auto_87019 ?auto_87023 ) ) ( not ( = ?auto_87019 ?auto_87024 ) ) ( not ( = ?auto_87020 ?auto_87021 ) ) ( not ( = ?auto_87020 ?auto_87022 ) ) ( not ( = ?auto_87020 ?auto_87023 ) ) ( not ( = ?auto_87020 ?auto_87024 ) ) ( not ( = ?auto_87021 ?auto_87022 ) ) ( not ( = ?auto_87021 ?auto_87023 ) ) ( not ( = ?auto_87021 ?auto_87024 ) ) ( not ( = ?auto_87022 ?auto_87023 ) ) ( not ( = ?auto_87022 ?auto_87024 ) ) ( not ( = ?auto_87023 ?auto_87024 ) ) ( ON ?auto_87022 ?auto_87023 ) ( ON ?auto_87021 ?auto_87022 ) ( CLEAR ?auto_87019 ) ( ON ?auto_87020 ?auto_87021 ) ( CLEAR ?auto_87020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87019 ?auto_87020 )
      ( MAKE-5PILE ?auto_87019 ?auto_87020 ?auto_87021 ?auto_87022 ?auto_87023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_87041 - BLOCK
      ?auto_87042 - BLOCK
      ?auto_87043 - BLOCK
      ?auto_87044 - BLOCK
      ?auto_87045 - BLOCK
    )
    :vars
    (
      ?auto_87046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87045 ?auto_87046 ) ( not ( = ?auto_87041 ?auto_87042 ) ) ( not ( = ?auto_87041 ?auto_87043 ) ) ( not ( = ?auto_87041 ?auto_87044 ) ) ( not ( = ?auto_87041 ?auto_87045 ) ) ( not ( = ?auto_87041 ?auto_87046 ) ) ( not ( = ?auto_87042 ?auto_87043 ) ) ( not ( = ?auto_87042 ?auto_87044 ) ) ( not ( = ?auto_87042 ?auto_87045 ) ) ( not ( = ?auto_87042 ?auto_87046 ) ) ( not ( = ?auto_87043 ?auto_87044 ) ) ( not ( = ?auto_87043 ?auto_87045 ) ) ( not ( = ?auto_87043 ?auto_87046 ) ) ( not ( = ?auto_87044 ?auto_87045 ) ) ( not ( = ?auto_87044 ?auto_87046 ) ) ( not ( = ?auto_87045 ?auto_87046 ) ) ( ON ?auto_87044 ?auto_87045 ) ( ON ?auto_87043 ?auto_87044 ) ( ON ?auto_87042 ?auto_87043 ) ( ON ?auto_87041 ?auto_87042 ) ( CLEAR ?auto_87041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87041 )
      ( MAKE-5PILE ?auto_87041 ?auto_87042 ?auto_87043 ?auto_87044 ?auto_87045 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87064 - BLOCK
      ?auto_87065 - BLOCK
      ?auto_87066 - BLOCK
      ?auto_87067 - BLOCK
      ?auto_87068 - BLOCK
      ?auto_87069 - BLOCK
    )
    :vars
    (
      ?auto_87070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87068 ) ( ON ?auto_87069 ?auto_87070 ) ( CLEAR ?auto_87069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87064 ) ( ON ?auto_87065 ?auto_87064 ) ( ON ?auto_87066 ?auto_87065 ) ( ON ?auto_87067 ?auto_87066 ) ( ON ?auto_87068 ?auto_87067 ) ( not ( = ?auto_87064 ?auto_87065 ) ) ( not ( = ?auto_87064 ?auto_87066 ) ) ( not ( = ?auto_87064 ?auto_87067 ) ) ( not ( = ?auto_87064 ?auto_87068 ) ) ( not ( = ?auto_87064 ?auto_87069 ) ) ( not ( = ?auto_87064 ?auto_87070 ) ) ( not ( = ?auto_87065 ?auto_87066 ) ) ( not ( = ?auto_87065 ?auto_87067 ) ) ( not ( = ?auto_87065 ?auto_87068 ) ) ( not ( = ?auto_87065 ?auto_87069 ) ) ( not ( = ?auto_87065 ?auto_87070 ) ) ( not ( = ?auto_87066 ?auto_87067 ) ) ( not ( = ?auto_87066 ?auto_87068 ) ) ( not ( = ?auto_87066 ?auto_87069 ) ) ( not ( = ?auto_87066 ?auto_87070 ) ) ( not ( = ?auto_87067 ?auto_87068 ) ) ( not ( = ?auto_87067 ?auto_87069 ) ) ( not ( = ?auto_87067 ?auto_87070 ) ) ( not ( = ?auto_87068 ?auto_87069 ) ) ( not ( = ?auto_87068 ?auto_87070 ) ) ( not ( = ?auto_87069 ?auto_87070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87069 ?auto_87070 )
      ( !STACK ?auto_87069 ?auto_87068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87090 - BLOCK
      ?auto_87091 - BLOCK
      ?auto_87092 - BLOCK
      ?auto_87093 - BLOCK
      ?auto_87094 - BLOCK
      ?auto_87095 - BLOCK
    )
    :vars
    (
      ?auto_87096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87095 ?auto_87096 ) ( ON-TABLE ?auto_87090 ) ( ON ?auto_87091 ?auto_87090 ) ( ON ?auto_87092 ?auto_87091 ) ( ON ?auto_87093 ?auto_87092 ) ( not ( = ?auto_87090 ?auto_87091 ) ) ( not ( = ?auto_87090 ?auto_87092 ) ) ( not ( = ?auto_87090 ?auto_87093 ) ) ( not ( = ?auto_87090 ?auto_87094 ) ) ( not ( = ?auto_87090 ?auto_87095 ) ) ( not ( = ?auto_87090 ?auto_87096 ) ) ( not ( = ?auto_87091 ?auto_87092 ) ) ( not ( = ?auto_87091 ?auto_87093 ) ) ( not ( = ?auto_87091 ?auto_87094 ) ) ( not ( = ?auto_87091 ?auto_87095 ) ) ( not ( = ?auto_87091 ?auto_87096 ) ) ( not ( = ?auto_87092 ?auto_87093 ) ) ( not ( = ?auto_87092 ?auto_87094 ) ) ( not ( = ?auto_87092 ?auto_87095 ) ) ( not ( = ?auto_87092 ?auto_87096 ) ) ( not ( = ?auto_87093 ?auto_87094 ) ) ( not ( = ?auto_87093 ?auto_87095 ) ) ( not ( = ?auto_87093 ?auto_87096 ) ) ( not ( = ?auto_87094 ?auto_87095 ) ) ( not ( = ?auto_87094 ?auto_87096 ) ) ( not ( = ?auto_87095 ?auto_87096 ) ) ( CLEAR ?auto_87093 ) ( ON ?auto_87094 ?auto_87095 ) ( CLEAR ?auto_87094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87090 ?auto_87091 ?auto_87092 ?auto_87093 ?auto_87094 )
      ( MAKE-6PILE ?auto_87090 ?auto_87091 ?auto_87092 ?auto_87093 ?auto_87094 ?auto_87095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87116 - BLOCK
      ?auto_87117 - BLOCK
      ?auto_87118 - BLOCK
      ?auto_87119 - BLOCK
      ?auto_87120 - BLOCK
      ?auto_87121 - BLOCK
    )
    :vars
    (
      ?auto_87122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87121 ?auto_87122 ) ( ON-TABLE ?auto_87116 ) ( ON ?auto_87117 ?auto_87116 ) ( ON ?auto_87118 ?auto_87117 ) ( not ( = ?auto_87116 ?auto_87117 ) ) ( not ( = ?auto_87116 ?auto_87118 ) ) ( not ( = ?auto_87116 ?auto_87119 ) ) ( not ( = ?auto_87116 ?auto_87120 ) ) ( not ( = ?auto_87116 ?auto_87121 ) ) ( not ( = ?auto_87116 ?auto_87122 ) ) ( not ( = ?auto_87117 ?auto_87118 ) ) ( not ( = ?auto_87117 ?auto_87119 ) ) ( not ( = ?auto_87117 ?auto_87120 ) ) ( not ( = ?auto_87117 ?auto_87121 ) ) ( not ( = ?auto_87117 ?auto_87122 ) ) ( not ( = ?auto_87118 ?auto_87119 ) ) ( not ( = ?auto_87118 ?auto_87120 ) ) ( not ( = ?auto_87118 ?auto_87121 ) ) ( not ( = ?auto_87118 ?auto_87122 ) ) ( not ( = ?auto_87119 ?auto_87120 ) ) ( not ( = ?auto_87119 ?auto_87121 ) ) ( not ( = ?auto_87119 ?auto_87122 ) ) ( not ( = ?auto_87120 ?auto_87121 ) ) ( not ( = ?auto_87120 ?auto_87122 ) ) ( not ( = ?auto_87121 ?auto_87122 ) ) ( ON ?auto_87120 ?auto_87121 ) ( CLEAR ?auto_87118 ) ( ON ?auto_87119 ?auto_87120 ) ( CLEAR ?auto_87119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87116 ?auto_87117 ?auto_87118 ?auto_87119 )
      ( MAKE-6PILE ?auto_87116 ?auto_87117 ?auto_87118 ?auto_87119 ?auto_87120 ?auto_87121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87142 - BLOCK
      ?auto_87143 - BLOCK
      ?auto_87144 - BLOCK
      ?auto_87145 - BLOCK
      ?auto_87146 - BLOCK
      ?auto_87147 - BLOCK
    )
    :vars
    (
      ?auto_87148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87147 ?auto_87148 ) ( ON-TABLE ?auto_87142 ) ( ON ?auto_87143 ?auto_87142 ) ( not ( = ?auto_87142 ?auto_87143 ) ) ( not ( = ?auto_87142 ?auto_87144 ) ) ( not ( = ?auto_87142 ?auto_87145 ) ) ( not ( = ?auto_87142 ?auto_87146 ) ) ( not ( = ?auto_87142 ?auto_87147 ) ) ( not ( = ?auto_87142 ?auto_87148 ) ) ( not ( = ?auto_87143 ?auto_87144 ) ) ( not ( = ?auto_87143 ?auto_87145 ) ) ( not ( = ?auto_87143 ?auto_87146 ) ) ( not ( = ?auto_87143 ?auto_87147 ) ) ( not ( = ?auto_87143 ?auto_87148 ) ) ( not ( = ?auto_87144 ?auto_87145 ) ) ( not ( = ?auto_87144 ?auto_87146 ) ) ( not ( = ?auto_87144 ?auto_87147 ) ) ( not ( = ?auto_87144 ?auto_87148 ) ) ( not ( = ?auto_87145 ?auto_87146 ) ) ( not ( = ?auto_87145 ?auto_87147 ) ) ( not ( = ?auto_87145 ?auto_87148 ) ) ( not ( = ?auto_87146 ?auto_87147 ) ) ( not ( = ?auto_87146 ?auto_87148 ) ) ( not ( = ?auto_87147 ?auto_87148 ) ) ( ON ?auto_87146 ?auto_87147 ) ( ON ?auto_87145 ?auto_87146 ) ( CLEAR ?auto_87143 ) ( ON ?auto_87144 ?auto_87145 ) ( CLEAR ?auto_87144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87142 ?auto_87143 ?auto_87144 )
      ( MAKE-6PILE ?auto_87142 ?auto_87143 ?auto_87144 ?auto_87145 ?auto_87146 ?auto_87147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87168 - BLOCK
      ?auto_87169 - BLOCK
      ?auto_87170 - BLOCK
      ?auto_87171 - BLOCK
      ?auto_87172 - BLOCK
      ?auto_87173 - BLOCK
    )
    :vars
    (
      ?auto_87174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87173 ?auto_87174 ) ( ON-TABLE ?auto_87168 ) ( not ( = ?auto_87168 ?auto_87169 ) ) ( not ( = ?auto_87168 ?auto_87170 ) ) ( not ( = ?auto_87168 ?auto_87171 ) ) ( not ( = ?auto_87168 ?auto_87172 ) ) ( not ( = ?auto_87168 ?auto_87173 ) ) ( not ( = ?auto_87168 ?auto_87174 ) ) ( not ( = ?auto_87169 ?auto_87170 ) ) ( not ( = ?auto_87169 ?auto_87171 ) ) ( not ( = ?auto_87169 ?auto_87172 ) ) ( not ( = ?auto_87169 ?auto_87173 ) ) ( not ( = ?auto_87169 ?auto_87174 ) ) ( not ( = ?auto_87170 ?auto_87171 ) ) ( not ( = ?auto_87170 ?auto_87172 ) ) ( not ( = ?auto_87170 ?auto_87173 ) ) ( not ( = ?auto_87170 ?auto_87174 ) ) ( not ( = ?auto_87171 ?auto_87172 ) ) ( not ( = ?auto_87171 ?auto_87173 ) ) ( not ( = ?auto_87171 ?auto_87174 ) ) ( not ( = ?auto_87172 ?auto_87173 ) ) ( not ( = ?auto_87172 ?auto_87174 ) ) ( not ( = ?auto_87173 ?auto_87174 ) ) ( ON ?auto_87172 ?auto_87173 ) ( ON ?auto_87171 ?auto_87172 ) ( ON ?auto_87170 ?auto_87171 ) ( CLEAR ?auto_87168 ) ( ON ?auto_87169 ?auto_87170 ) ( CLEAR ?auto_87169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87168 ?auto_87169 )
      ( MAKE-6PILE ?auto_87168 ?auto_87169 ?auto_87170 ?auto_87171 ?auto_87172 ?auto_87173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_87194 - BLOCK
      ?auto_87195 - BLOCK
      ?auto_87196 - BLOCK
      ?auto_87197 - BLOCK
      ?auto_87198 - BLOCK
      ?auto_87199 - BLOCK
    )
    :vars
    (
      ?auto_87200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87199 ?auto_87200 ) ( not ( = ?auto_87194 ?auto_87195 ) ) ( not ( = ?auto_87194 ?auto_87196 ) ) ( not ( = ?auto_87194 ?auto_87197 ) ) ( not ( = ?auto_87194 ?auto_87198 ) ) ( not ( = ?auto_87194 ?auto_87199 ) ) ( not ( = ?auto_87194 ?auto_87200 ) ) ( not ( = ?auto_87195 ?auto_87196 ) ) ( not ( = ?auto_87195 ?auto_87197 ) ) ( not ( = ?auto_87195 ?auto_87198 ) ) ( not ( = ?auto_87195 ?auto_87199 ) ) ( not ( = ?auto_87195 ?auto_87200 ) ) ( not ( = ?auto_87196 ?auto_87197 ) ) ( not ( = ?auto_87196 ?auto_87198 ) ) ( not ( = ?auto_87196 ?auto_87199 ) ) ( not ( = ?auto_87196 ?auto_87200 ) ) ( not ( = ?auto_87197 ?auto_87198 ) ) ( not ( = ?auto_87197 ?auto_87199 ) ) ( not ( = ?auto_87197 ?auto_87200 ) ) ( not ( = ?auto_87198 ?auto_87199 ) ) ( not ( = ?auto_87198 ?auto_87200 ) ) ( not ( = ?auto_87199 ?auto_87200 ) ) ( ON ?auto_87198 ?auto_87199 ) ( ON ?auto_87197 ?auto_87198 ) ( ON ?auto_87196 ?auto_87197 ) ( ON ?auto_87195 ?auto_87196 ) ( ON ?auto_87194 ?auto_87195 ) ( CLEAR ?auto_87194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87194 )
      ( MAKE-6PILE ?auto_87194 ?auto_87195 ?auto_87196 ?auto_87197 ?auto_87198 ?auto_87199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87221 - BLOCK
      ?auto_87222 - BLOCK
      ?auto_87223 - BLOCK
      ?auto_87224 - BLOCK
      ?auto_87225 - BLOCK
      ?auto_87226 - BLOCK
      ?auto_87227 - BLOCK
    )
    :vars
    (
      ?auto_87228 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87226 ) ( ON ?auto_87227 ?auto_87228 ) ( CLEAR ?auto_87227 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87221 ) ( ON ?auto_87222 ?auto_87221 ) ( ON ?auto_87223 ?auto_87222 ) ( ON ?auto_87224 ?auto_87223 ) ( ON ?auto_87225 ?auto_87224 ) ( ON ?auto_87226 ?auto_87225 ) ( not ( = ?auto_87221 ?auto_87222 ) ) ( not ( = ?auto_87221 ?auto_87223 ) ) ( not ( = ?auto_87221 ?auto_87224 ) ) ( not ( = ?auto_87221 ?auto_87225 ) ) ( not ( = ?auto_87221 ?auto_87226 ) ) ( not ( = ?auto_87221 ?auto_87227 ) ) ( not ( = ?auto_87221 ?auto_87228 ) ) ( not ( = ?auto_87222 ?auto_87223 ) ) ( not ( = ?auto_87222 ?auto_87224 ) ) ( not ( = ?auto_87222 ?auto_87225 ) ) ( not ( = ?auto_87222 ?auto_87226 ) ) ( not ( = ?auto_87222 ?auto_87227 ) ) ( not ( = ?auto_87222 ?auto_87228 ) ) ( not ( = ?auto_87223 ?auto_87224 ) ) ( not ( = ?auto_87223 ?auto_87225 ) ) ( not ( = ?auto_87223 ?auto_87226 ) ) ( not ( = ?auto_87223 ?auto_87227 ) ) ( not ( = ?auto_87223 ?auto_87228 ) ) ( not ( = ?auto_87224 ?auto_87225 ) ) ( not ( = ?auto_87224 ?auto_87226 ) ) ( not ( = ?auto_87224 ?auto_87227 ) ) ( not ( = ?auto_87224 ?auto_87228 ) ) ( not ( = ?auto_87225 ?auto_87226 ) ) ( not ( = ?auto_87225 ?auto_87227 ) ) ( not ( = ?auto_87225 ?auto_87228 ) ) ( not ( = ?auto_87226 ?auto_87227 ) ) ( not ( = ?auto_87226 ?auto_87228 ) ) ( not ( = ?auto_87227 ?auto_87228 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87227 ?auto_87228 )
      ( !STACK ?auto_87227 ?auto_87226 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87251 - BLOCK
      ?auto_87252 - BLOCK
      ?auto_87253 - BLOCK
      ?auto_87254 - BLOCK
      ?auto_87255 - BLOCK
      ?auto_87256 - BLOCK
      ?auto_87257 - BLOCK
    )
    :vars
    (
      ?auto_87258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87257 ?auto_87258 ) ( ON-TABLE ?auto_87251 ) ( ON ?auto_87252 ?auto_87251 ) ( ON ?auto_87253 ?auto_87252 ) ( ON ?auto_87254 ?auto_87253 ) ( ON ?auto_87255 ?auto_87254 ) ( not ( = ?auto_87251 ?auto_87252 ) ) ( not ( = ?auto_87251 ?auto_87253 ) ) ( not ( = ?auto_87251 ?auto_87254 ) ) ( not ( = ?auto_87251 ?auto_87255 ) ) ( not ( = ?auto_87251 ?auto_87256 ) ) ( not ( = ?auto_87251 ?auto_87257 ) ) ( not ( = ?auto_87251 ?auto_87258 ) ) ( not ( = ?auto_87252 ?auto_87253 ) ) ( not ( = ?auto_87252 ?auto_87254 ) ) ( not ( = ?auto_87252 ?auto_87255 ) ) ( not ( = ?auto_87252 ?auto_87256 ) ) ( not ( = ?auto_87252 ?auto_87257 ) ) ( not ( = ?auto_87252 ?auto_87258 ) ) ( not ( = ?auto_87253 ?auto_87254 ) ) ( not ( = ?auto_87253 ?auto_87255 ) ) ( not ( = ?auto_87253 ?auto_87256 ) ) ( not ( = ?auto_87253 ?auto_87257 ) ) ( not ( = ?auto_87253 ?auto_87258 ) ) ( not ( = ?auto_87254 ?auto_87255 ) ) ( not ( = ?auto_87254 ?auto_87256 ) ) ( not ( = ?auto_87254 ?auto_87257 ) ) ( not ( = ?auto_87254 ?auto_87258 ) ) ( not ( = ?auto_87255 ?auto_87256 ) ) ( not ( = ?auto_87255 ?auto_87257 ) ) ( not ( = ?auto_87255 ?auto_87258 ) ) ( not ( = ?auto_87256 ?auto_87257 ) ) ( not ( = ?auto_87256 ?auto_87258 ) ) ( not ( = ?auto_87257 ?auto_87258 ) ) ( CLEAR ?auto_87255 ) ( ON ?auto_87256 ?auto_87257 ) ( CLEAR ?auto_87256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87251 ?auto_87252 ?auto_87253 ?auto_87254 ?auto_87255 ?auto_87256 )
      ( MAKE-7PILE ?auto_87251 ?auto_87252 ?auto_87253 ?auto_87254 ?auto_87255 ?auto_87256 ?auto_87257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87281 - BLOCK
      ?auto_87282 - BLOCK
      ?auto_87283 - BLOCK
      ?auto_87284 - BLOCK
      ?auto_87285 - BLOCK
      ?auto_87286 - BLOCK
      ?auto_87287 - BLOCK
    )
    :vars
    (
      ?auto_87288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87287 ?auto_87288 ) ( ON-TABLE ?auto_87281 ) ( ON ?auto_87282 ?auto_87281 ) ( ON ?auto_87283 ?auto_87282 ) ( ON ?auto_87284 ?auto_87283 ) ( not ( = ?auto_87281 ?auto_87282 ) ) ( not ( = ?auto_87281 ?auto_87283 ) ) ( not ( = ?auto_87281 ?auto_87284 ) ) ( not ( = ?auto_87281 ?auto_87285 ) ) ( not ( = ?auto_87281 ?auto_87286 ) ) ( not ( = ?auto_87281 ?auto_87287 ) ) ( not ( = ?auto_87281 ?auto_87288 ) ) ( not ( = ?auto_87282 ?auto_87283 ) ) ( not ( = ?auto_87282 ?auto_87284 ) ) ( not ( = ?auto_87282 ?auto_87285 ) ) ( not ( = ?auto_87282 ?auto_87286 ) ) ( not ( = ?auto_87282 ?auto_87287 ) ) ( not ( = ?auto_87282 ?auto_87288 ) ) ( not ( = ?auto_87283 ?auto_87284 ) ) ( not ( = ?auto_87283 ?auto_87285 ) ) ( not ( = ?auto_87283 ?auto_87286 ) ) ( not ( = ?auto_87283 ?auto_87287 ) ) ( not ( = ?auto_87283 ?auto_87288 ) ) ( not ( = ?auto_87284 ?auto_87285 ) ) ( not ( = ?auto_87284 ?auto_87286 ) ) ( not ( = ?auto_87284 ?auto_87287 ) ) ( not ( = ?auto_87284 ?auto_87288 ) ) ( not ( = ?auto_87285 ?auto_87286 ) ) ( not ( = ?auto_87285 ?auto_87287 ) ) ( not ( = ?auto_87285 ?auto_87288 ) ) ( not ( = ?auto_87286 ?auto_87287 ) ) ( not ( = ?auto_87286 ?auto_87288 ) ) ( not ( = ?auto_87287 ?auto_87288 ) ) ( ON ?auto_87286 ?auto_87287 ) ( CLEAR ?auto_87284 ) ( ON ?auto_87285 ?auto_87286 ) ( CLEAR ?auto_87285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87281 ?auto_87282 ?auto_87283 ?auto_87284 ?auto_87285 )
      ( MAKE-7PILE ?auto_87281 ?auto_87282 ?auto_87283 ?auto_87284 ?auto_87285 ?auto_87286 ?auto_87287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87311 - BLOCK
      ?auto_87312 - BLOCK
      ?auto_87313 - BLOCK
      ?auto_87314 - BLOCK
      ?auto_87315 - BLOCK
      ?auto_87316 - BLOCK
      ?auto_87317 - BLOCK
    )
    :vars
    (
      ?auto_87318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87317 ?auto_87318 ) ( ON-TABLE ?auto_87311 ) ( ON ?auto_87312 ?auto_87311 ) ( ON ?auto_87313 ?auto_87312 ) ( not ( = ?auto_87311 ?auto_87312 ) ) ( not ( = ?auto_87311 ?auto_87313 ) ) ( not ( = ?auto_87311 ?auto_87314 ) ) ( not ( = ?auto_87311 ?auto_87315 ) ) ( not ( = ?auto_87311 ?auto_87316 ) ) ( not ( = ?auto_87311 ?auto_87317 ) ) ( not ( = ?auto_87311 ?auto_87318 ) ) ( not ( = ?auto_87312 ?auto_87313 ) ) ( not ( = ?auto_87312 ?auto_87314 ) ) ( not ( = ?auto_87312 ?auto_87315 ) ) ( not ( = ?auto_87312 ?auto_87316 ) ) ( not ( = ?auto_87312 ?auto_87317 ) ) ( not ( = ?auto_87312 ?auto_87318 ) ) ( not ( = ?auto_87313 ?auto_87314 ) ) ( not ( = ?auto_87313 ?auto_87315 ) ) ( not ( = ?auto_87313 ?auto_87316 ) ) ( not ( = ?auto_87313 ?auto_87317 ) ) ( not ( = ?auto_87313 ?auto_87318 ) ) ( not ( = ?auto_87314 ?auto_87315 ) ) ( not ( = ?auto_87314 ?auto_87316 ) ) ( not ( = ?auto_87314 ?auto_87317 ) ) ( not ( = ?auto_87314 ?auto_87318 ) ) ( not ( = ?auto_87315 ?auto_87316 ) ) ( not ( = ?auto_87315 ?auto_87317 ) ) ( not ( = ?auto_87315 ?auto_87318 ) ) ( not ( = ?auto_87316 ?auto_87317 ) ) ( not ( = ?auto_87316 ?auto_87318 ) ) ( not ( = ?auto_87317 ?auto_87318 ) ) ( ON ?auto_87316 ?auto_87317 ) ( ON ?auto_87315 ?auto_87316 ) ( CLEAR ?auto_87313 ) ( ON ?auto_87314 ?auto_87315 ) ( CLEAR ?auto_87314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87311 ?auto_87312 ?auto_87313 ?auto_87314 )
      ( MAKE-7PILE ?auto_87311 ?auto_87312 ?auto_87313 ?auto_87314 ?auto_87315 ?auto_87316 ?auto_87317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87341 - BLOCK
      ?auto_87342 - BLOCK
      ?auto_87343 - BLOCK
      ?auto_87344 - BLOCK
      ?auto_87345 - BLOCK
      ?auto_87346 - BLOCK
      ?auto_87347 - BLOCK
    )
    :vars
    (
      ?auto_87348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87347 ?auto_87348 ) ( ON-TABLE ?auto_87341 ) ( ON ?auto_87342 ?auto_87341 ) ( not ( = ?auto_87341 ?auto_87342 ) ) ( not ( = ?auto_87341 ?auto_87343 ) ) ( not ( = ?auto_87341 ?auto_87344 ) ) ( not ( = ?auto_87341 ?auto_87345 ) ) ( not ( = ?auto_87341 ?auto_87346 ) ) ( not ( = ?auto_87341 ?auto_87347 ) ) ( not ( = ?auto_87341 ?auto_87348 ) ) ( not ( = ?auto_87342 ?auto_87343 ) ) ( not ( = ?auto_87342 ?auto_87344 ) ) ( not ( = ?auto_87342 ?auto_87345 ) ) ( not ( = ?auto_87342 ?auto_87346 ) ) ( not ( = ?auto_87342 ?auto_87347 ) ) ( not ( = ?auto_87342 ?auto_87348 ) ) ( not ( = ?auto_87343 ?auto_87344 ) ) ( not ( = ?auto_87343 ?auto_87345 ) ) ( not ( = ?auto_87343 ?auto_87346 ) ) ( not ( = ?auto_87343 ?auto_87347 ) ) ( not ( = ?auto_87343 ?auto_87348 ) ) ( not ( = ?auto_87344 ?auto_87345 ) ) ( not ( = ?auto_87344 ?auto_87346 ) ) ( not ( = ?auto_87344 ?auto_87347 ) ) ( not ( = ?auto_87344 ?auto_87348 ) ) ( not ( = ?auto_87345 ?auto_87346 ) ) ( not ( = ?auto_87345 ?auto_87347 ) ) ( not ( = ?auto_87345 ?auto_87348 ) ) ( not ( = ?auto_87346 ?auto_87347 ) ) ( not ( = ?auto_87346 ?auto_87348 ) ) ( not ( = ?auto_87347 ?auto_87348 ) ) ( ON ?auto_87346 ?auto_87347 ) ( ON ?auto_87345 ?auto_87346 ) ( ON ?auto_87344 ?auto_87345 ) ( CLEAR ?auto_87342 ) ( ON ?auto_87343 ?auto_87344 ) ( CLEAR ?auto_87343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87341 ?auto_87342 ?auto_87343 )
      ( MAKE-7PILE ?auto_87341 ?auto_87342 ?auto_87343 ?auto_87344 ?auto_87345 ?auto_87346 ?auto_87347 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87371 - BLOCK
      ?auto_87372 - BLOCK
      ?auto_87373 - BLOCK
      ?auto_87374 - BLOCK
      ?auto_87375 - BLOCK
      ?auto_87376 - BLOCK
      ?auto_87377 - BLOCK
    )
    :vars
    (
      ?auto_87378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87377 ?auto_87378 ) ( ON-TABLE ?auto_87371 ) ( not ( = ?auto_87371 ?auto_87372 ) ) ( not ( = ?auto_87371 ?auto_87373 ) ) ( not ( = ?auto_87371 ?auto_87374 ) ) ( not ( = ?auto_87371 ?auto_87375 ) ) ( not ( = ?auto_87371 ?auto_87376 ) ) ( not ( = ?auto_87371 ?auto_87377 ) ) ( not ( = ?auto_87371 ?auto_87378 ) ) ( not ( = ?auto_87372 ?auto_87373 ) ) ( not ( = ?auto_87372 ?auto_87374 ) ) ( not ( = ?auto_87372 ?auto_87375 ) ) ( not ( = ?auto_87372 ?auto_87376 ) ) ( not ( = ?auto_87372 ?auto_87377 ) ) ( not ( = ?auto_87372 ?auto_87378 ) ) ( not ( = ?auto_87373 ?auto_87374 ) ) ( not ( = ?auto_87373 ?auto_87375 ) ) ( not ( = ?auto_87373 ?auto_87376 ) ) ( not ( = ?auto_87373 ?auto_87377 ) ) ( not ( = ?auto_87373 ?auto_87378 ) ) ( not ( = ?auto_87374 ?auto_87375 ) ) ( not ( = ?auto_87374 ?auto_87376 ) ) ( not ( = ?auto_87374 ?auto_87377 ) ) ( not ( = ?auto_87374 ?auto_87378 ) ) ( not ( = ?auto_87375 ?auto_87376 ) ) ( not ( = ?auto_87375 ?auto_87377 ) ) ( not ( = ?auto_87375 ?auto_87378 ) ) ( not ( = ?auto_87376 ?auto_87377 ) ) ( not ( = ?auto_87376 ?auto_87378 ) ) ( not ( = ?auto_87377 ?auto_87378 ) ) ( ON ?auto_87376 ?auto_87377 ) ( ON ?auto_87375 ?auto_87376 ) ( ON ?auto_87374 ?auto_87375 ) ( ON ?auto_87373 ?auto_87374 ) ( CLEAR ?auto_87371 ) ( ON ?auto_87372 ?auto_87373 ) ( CLEAR ?auto_87372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87371 ?auto_87372 )
      ( MAKE-7PILE ?auto_87371 ?auto_87372 ?auto_87373 ?auto_87374 ?auto_87375 ?auto_87376 ?auto_87377 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_87401 - BLOCK
      ?auto_87402 - BLOCK
      ?auto_87403 - BLOCK
      ?auto_87404 - BLOCK
      ?auto_87405 - BLOCK
      ?auto_87406 - BLOCK
      ?auto_87407 - BLOCK
    )
    :vars
    (
      ?auto_87408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87407 ?auto_87408 ) ( not ( = ?auto_87401 ?auto_87402 ) ) ( not ( = ?auto_87401 ?auto_87403 ) ) ( not ( = ?auto_87401 ?auto_87404 ) ) ( not ( = ?auto_87401 ?auto_87405 ) ) ( not ( = ?auto_87401 ?auto_87406 ) ) ( not ( = ?auto_87401 ?auto_87407 ) ) ( not ( = ?auto_87401 ?auto_87408 ) ) ( not ( = ?auto_87402 ?auto_87403 ) ) ( not ( = ?auto_87402 ?auto_87404 ) ) ( not ( = ?auto_87402 ?auto_87405 ) ) ( not ( = ?auto_87402 ?auto_87406 ) ) ( not ( = ?auto_87402 ?auto_87407 ) ) ( not ( = ?auto_87402 ?auto_87408 ) ) ( not ( = ?auto_87403 ?auto_87404 ) ) ( not ( = ?auto_87403 ?auto_87405 ) ) ( not ( = ?auto_87403 ?auto_87406 ) ) ( not ( = ?auto_87403 ?auto_87407 ) ) ( not ( = ?auto_87403 ?auto_87408 ) ) ( not ( = ?auto_87404 ?auto_87405 ) ) ( not ( = ?auto_87404 ?auto_87406 ) ) ( not ( = ?auto_87404 ?auto_87407 ) ) ( not ( = ?auto_87404 ?auto_87408 ) ) ( not ( = ?auto_87405 ?auto_87406 ) ) ( not ( = ?auto_87405 ?auto_87407 ) ) ( not ( = ?auto_87405 ?auto_87408 ) ) ( not ( = ?auto_87406 ?auto_87407 ) ) ( not ( = ?auto_87406 ?auto_87408 ) ) ( not ( = ?auto_87407 ?auto_87408 ) ) ( ON ?auto_87406 ?auto_87407 ) ( ON ?auto_87405 ?auto_87406 ) ( ON ?auto_87404 ?auto_87405 ) ( ON ?auto_87403 ?auto_87404 ) ( ON ?auto_87402 ?auto_87403 ) ( ON ?auto_87401 ?auto_87402 ) ( CLEAR ?auto_87401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87401 )
      ( MAKE-7PILE ?auto_87401 ?auto_87402 ?auto_87403 ?auto_87404 ?auto_87405 ?auto_87406 ?auto_87407 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87432 - BLOCK
      ?auto_87433 - BLOCK
      ?auto_87434 - BLOCK
      ?auto_87435 - BLOCK
      ?auto_87436 - BLOCK
      ?auto_87437 - BLOCK
      ?auto_87438 - BLOCK
      ?auto_87439 - BLOCK
    )
    :vars
    (
      ?auto_87440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87438 ) ( ON ?auto_87439 ?auto_87440 ) ( CLEAR ?auto_87439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87432 ) ( ON ?auto_87433 ?auto_87432 ) ( ON ?auto_87434 ?auto_87433 ) ( ON ?auto_87435 ?auto_87434 ) ( ON ?auto_87436 ?auto_87435 ) ( ON ?auto_87437 ?auto_87436 ) ( ON ?auto_87438 ?auto_87437 ) ( not ( = ?auto_87432 ?auto_87433 ) ) ( not ( = ?auto_87432 ?auto_87434 ) ) ( not ( = ?auto_87432 ?auto_87435 ) ) ( not ( = ?auto_87432 ?auto_87436 ) ) ( not ( = ?auto_87432 ?auto_87437 ) ) ( not ( = ?auto_87432 ?auto_87438 ) ) ( not ( = ?auto_87432 ?auto_87439 ) ) ( not ( = ?auto_87432 ?auto_87440 ) ) ( not ( = ?auto_87433 ?auto_87434 ) ) ( not ( = ?auto_87433 ?auto_87435 ) ) ( not ( = ?auto_87433 ?auto_87436 ) ) ( not ( = ?auto_87433 ?auto_87437 ) ) ( not ( = ?auto_87433 ?auto_87438 ) ) ( not ( = ?auto_87433 ?auto_87439 ) ) ( not ( = ?auto_87433 ?auto_87440 ) ) ( not ( = ?auto_87434 ?auto_87435 ) ) ( not ( = ?auto_87434 ?auto_87436 ) ) ( not ( = ?auto_87434 ?auto_87437 ) ) ( not ( = ?auto_87434 ?auto_87438 ) ) ( not ( = ?auto_87434 ?auto_87439 ) ) ( not ( = ?auto_87434 ?auto_87440 ) ) ( not ( = ?auto_87435 ?auto_87436 ) ) ( not ( = ?auto_87435 ?auto_87437 ) ) ( not ( = ?auto_87435 ?auto_87438 ) ) ( not ( = ?auto_87435 ?auto_87439 ) ) ( not ( = ?auto_87435 ?auto_87440 ) ) ( not ( = ?auto_87436 ?auto_87437 ) ) ( not ( = ?auto_87436 ?auto_87438 ) ) ( not ( = ?auto_87436 ?auto_87439 ) ) ( not ( = ?auto_87436 ?auto_87440 ) ) ( not ( = ?auto_87437 ?auto_87438 ) ) ( not ( = ?auto_87437 ?auto_87439 ) ) ( not ( = ?auto_87437 ?auto_87440 ) ) ( not ( = ?auto_87438 ?auto_87439 ) ) ( not ( = ?auto_87438 ?auto_87440 ) ) ( not ( = ?auto_87439 ?auto_87440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87439 ?auto_87440 )
      ( !STACK ?auto_87439 ?auto_87438 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87466 - BLOCK
      ?auto_87467 - BLOCK
      ?auto_87468 - BLOCK
      ?auto_87469 - BLOCK
      ?auto_87470 - BLOCK
      ?auto_87471 - BLOCK
      ?auto_87472 - BLOCK
      ?auto_87473 - BLOCK
    )
    :vars
    (
      ?auto_87474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87473 ?auto_87474 ) ( ON-TABLE ?auto_87466 ) ( ON ?auto_87467 ?auto_87466 ) ( ON ?auto_87468 ?auto_87467 ) ( ON ?auto_87469 ?auto_87468 ) ( ON ?auto_87470 ?auto_87469 ) ( ON ?auto_87471 ?auto_87470 ) ( not ( = ?auto_87466 ?auto_87467 ) ) ( not ( = ?auto_87466 ?auto_87468 ) ) ( not ( = ?auto_87466 ?auto_87469 ) ) ( not ( = ?auto_87466 ?auto_87470 ) ) ( not ( = ?auto_87466 ?auto_87471 ) ) ( not ( = ?auto_87466 ?auto_87472 ) ) ( not ( = ?auto_87466 ?auto_87473 ) ) ( not ( = ?auto_87466 ?auto_87474 ) ) ( not ( = ?auto_87467 ?auto_87468 ) ) ( not ( = ?auto_87467 ?auto_87469 ) ) ( not ( = ?auto_87467 ?auto_87470 ) ) ( not ( = ?auto_87467 ?auto_87471 ) ) ( not ( = ?auto_87467 ?auto_87472 ) ) ( not ( = ?auto_87467 ?auto_87473 ) ) ( not ( = ?auto_87467 ?auto_87474 ) ) ( not ( = ?auto_87468 ?auto_87469 ) ) ( not ( = ?auto_87468 ?auto_87470 ) ) ( not ( = ?auto_87468 ?auto_87471 ) ) ( not ( = ?auto_87468 ?auto_87472 ) ) ( not ( = ?auto_87468 ?auto_87473 ) ) ( not ( = ?auto_87468 ?auto_87474 ) ) ( not ( = ?auto_87469 ?auto_87470 ) ) ( not ( = ?auto_87469 ?auto_87471 ) ) ( not ( = ?auto_87469 ?auto_87472 ) ) ( not ( = ?auto_87469 ?auto_87473 ) ) ( not ( = ?auto_87469 ?auto_87474 ) ) ( not ( = ?auto_87470 ?auto_87471 ) ) ( not ( = ?auto_87470 ?auto_87472 ) ) ( not ( = ?auto_87470 ?auto_87473 ) ) ( not ( = ?auto_87470 ?auto_87474 ) ) ( not ( = ?auto_87471 ?auto_87472 ) ) ( not ( = ?auto_87471 ?auto_87473 ) ) ( not ( = ?auto_87471 ?auto_87474 ) ) ( not ( = ?auto_87472 ?auto_87473 ) ) ( not ( = ?auto_87472 ?auto_87474 ) ) ( not ( = ?auto_87473 ?auto_87474 ) ) ( CLEAR ?auto_87471 ) ( ON ?auto_87472 ?auto_87473 ) ( CLEAR ?auto_87472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87466 ?auto_87467 ?auto_87468 ?auto_87469 ?auto_87470 ?auto_87471 ?auto_87472 )
      ( MAKE-8PILE ?auto_87466 ?auto_87467 ?auto_87468 ?auto_87469 ?auto_87470 ?auto_87471 ?auto_87472 ?auto_87473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87500 - BLOCK
      ?auto_87501 - BLOCK
      ?auto_87502 - BLOCK
      ?auto_87503 - BLOCK
      ?auto_87504 - BLOCK
      ?auto_87505 - BLOCK
      ?auto_87506 - BLOCK
      ?auto_87507 - BLOCK
    )
    :vars
    (
      ?auto_87508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87507 ?auto_87508 ) ( ON-TABLE ?auto_87500 ) ( ON ?auto_87501 ?auto_87500 ) ( ON ?auto_87502 ?auto_87501 ) ( ON ?auto_87503 ?auto_87502 ) ( ON ?auto_87504 ?auto_87503 ) ( not ( = ?auto_87500 ?auto_87501 ) ) ( not ( = ?auto_87500 ?auto_87502 ) ) ( not ( = ?auto_87500 ?auto_87503 ) ) ( not ( = ?auto_87500 ?auto_87504 ) ) ( not ( = ?auto_87500 ?auto_87505 ) ) ( not ( = ?auto_87500 ?auto_87506 ) ) ( not ( = ?auto_87500 ?auto_87507 ) ) ( not ( = ?auto_87500 ?auto_87508 ) ) ( not ( = ?auto_87501 ?auto_87502 ) ) ( not ( = ?auto_87501 ?auto_87503 ) ) ( not ( = ?auto_87501 ?auto_87504 ) ) ( not ( = ?auto_87501 ?auto_87505 ) ) ( not ( = ?auto_87501 ?auto_87506 ) ) ( not ( = ?auto_87501 ?auto_87507 ) ) ( not ( = ?auto_87501 ?auto_87508 ) ) ( not ( = ?auto_87502 ?auto_87503 ) ) ( not ( = ?auto_87502 ?auto_87504 ) ) ( not ( = ?auto_87502 ?auto_87505 ) ) ( not ( = ?auto_87502 ?auto_87506 ) ) ( not ( = ?auto_87502 ?auto_87507 ) ) ( not ( = ?auto_87502 ?auto_87508 ) ) ( not ( = ?auto_87503 ?auto_87504 ) ) ( not ( = ?auto_87503 ?auto_87505 ) ) ( not ( = ?auto_87503 ?auto_87506 ) ) ( not ( = ?auto_87503 ?auto_87507 ) ) ( not ( = ?auto_87503 ?auto_87508 ) ) ( not ( = ?auto_87504 ?auto_87505 ) ) ( not ( = ?auto_87504 ?auto_87506 ) ) ( not ( = ?auto_87504 ?auto_87507 ) ) ( not ( = ?auto_87504 ?auto_87508 ) ) ( not ( = ?auto_87505 ?auto_87506 ) ) ( not ( = ?auto_87505 ?auto_87507 ) ) ( not ( = ?auto_87505 ?auto_87508 ) ) ( not ( = ?auto_87506 ?auto_87507 ) ) ( not ( = ?auto_87506 ?auto_87508 ) ) ( not ( = ?auto_87507 ?auto_87508 ) ) ( ON ?auto_87506 ?auto_87507 ) ( CLEAR ?auto_87504 ) ( ON ?auto_87505 ?auto_87506 ) ( CLEAR ?auto_87505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87500 ?auto_87501 ?auto_87502 ?auto_87503 ?auto_87504 ?auto_87505 )
      ( MAKE-8PILE ?auto_87500 ?auto_87501 ?auto_87502 ?auto_87503 ?auto_87504 ?auto_87505 ?auto_87506 ?auto_87507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87534 - BLOCK
      ?auto_87535 - BLOCK
      ?auto_87536 - BLOCK
      ?auto_87537 - BLOCK
      ?auto_87538 - BLOCK
      ?auto_87539 - BLOCK
      ?auto_87540 - BLOCK
      ?auto_87541 - BLOCK
    )
    :vars
    (
      ?auto_87542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87541 ?auto_87542 ) ( ON-TABLE ?auto_87534 ) ( ON ?auto_87535 ?auto_87534 ) ( ON ?auto_87536 ?auto_87535 ) ( ON ?auto_87537 ?auto_87536 ) ( not ( = ?auto_87534 ?auto_87535 ) ) ( not ( = ?auto_87534 ?auto_87536 ) ) ( not ( = ?auto_87534 ?auto_87537 ) ) ( not ( = ?auto_87534 ?auto_87538 ) ) ( not ( = ?auto_87534 ?auto_87539 ) ) ( not ( = ?auto_87534 ?auto_87540 ) ) ( not ( = ?auto_87534 ?auto_87541 ) ) ( not ( = ?auto_87534 ?auto_87542 ) ) ( not ( = ?auto_87535 ?auto_87536 ) ) ( not ( = ?auto_87535 ?auto_87537 ) ) ( not ( = ?auto_87535 ?auto_87538 ) ) ( not ( = ?auto_87535 ?auto_87539 ) ) ( not ( = ?auto_87535 ?auto_87540 ) ) ( not ( = ?auto_87535 ?auto_87541 ) ) ( not ( = ?auto_87535 ?auto_87542 ) ) ( not ( = ?auto_87536 ?auto_87537 ) ) ( not ( = ?auto_87536 ?auto_87538 ) ) ( not ( = ?auto_87536 ?auto_87539 ) ) ( not ( = ?auto_87536 ?auto_87540 ) ) ( not ( = ?auto_87536 ?auto_87541 ) ) ( not ( = ?auto_87536 ?auto_87542 ) ) ( not ( = ?auto_87537 ?auto_87538 ) ) ( not ( = ?auto_87537 ?auto_87539 ) ) ( not ( = ?auto_87537 ?auto_87540 ) ) ( not ( = ?auto_87537 ?auto_87541 ) ) ( not ( = ?auto_87537 ?auto_87542 ) ) ( not ( = ?auto_87538 ?auto_87539 ) ) ( not ( = ?auto_87538 ?auto_87540 ) ) ( not ( = ?auto_87538 ?auto_87541 ) ) ( not ( = ?auto_87538 ?auto_87542 ) ) ( not ( = ?auto_87539 ?auto_87540 ) ) ( not ( = ?auto_87539 ?auto_87541 ) ) ( not ( = ?auto_87539 ?auto_87542 ) ) ( not ( = ?auto_87540 ?auto_87541 ) ) ( not ( = ?auto_87540 ?auto_87542 ) ) ( not ( = ?auto_87541 ?auto_87542 ) ) ( ON ?auto_87540 ?auto_87541 ) ( ON ?auto_87539 ?auto_87540 ) ( CLEAR ?auto_87537 ) ( ON ?auto_87538 ?auto_87539 ) ( CLEAR ?auto_87538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87534 ?auto_87535 ?auto_87536 ?auto_87537 ?auto_87538 )
      ( MAKE-8PILE ?auto_87534 ?auto_87535 ?auto_87536 ?auto_87537 ?auto_87538 ?auto_87539 ?auto_87540 ?auto_87541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87568 - BLOCK
      ?auto_87569 - BLOCK
      ?auto_87570 - BLOCK
      ?auto_87571 - BLOCK
      ?auto_87572 - BLOCK
      ?auto_87573 - BLOCK
      ?auto_87574 - BLOCK
      ?auto_87575 - BLOCK
    )
    :vars
    (
      ?auto_87576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87575 ?auto_87576 ) ( ON-TABLE ?auto_87568 ) ( ON ?auto_87569 ?auto_87568 ) ( ON ?auto_87570 ?auto_87569 ) ( not ( = ?auto_87568 ?auto_87569 ) ) ( not ( = ?auto_87568 ?auto_87570 ) ) ( not ( = ?auto_87568 ?auto_87571 ) ) ( not ( = ?auto_87568 ?auto_87572 ) ) ( not ( = ?auto_87568 ?auto_87573 ) ) ( not ( = ?auto_87568 ?auto_87574 ) ) ( not ( = ?auto_87568 ?auto_87575 ) ) ( not ( = ?auto_87568 ?auto_87576 ) ) ( not ( = ?auto_87569 ?auto_87570 ) ) ( not ( = ?auto_87569 ?auto_87571 ) ) ( not ( = ?auto_87569 ?auto_87572 ) ) ( not ( = ?auto_87569 ?auto_87573 ) ) ( not ( = ?auto_87569 ?auto_87574 ) ) ( not ( = ?auto_87569 ?auto_87575 ) ) ( not ( = ?auto_87569 ?auto_87576 ) ) ( not ( = ?auto_87570 ?auto_87571 ) ) ( not ( = ?auto_87570 ?auto_87572 ) ) ( not ( = ?auto_87570 ?auto_87573 ) ) ( not ( = ?auto_87570 ?auto_87574 ) ) ( not ( = ?auto_87570 ?auto_87575 ) ) ( not ( = ?auto_87570 ?auto_87576 ) ) ( not ( = ?auto_87571 ?auto_87572 ) ) ( not ( = ?auto_87571 ?auto_87573 ) ) ( not ( = ?auto_87571 ?auto_87574 ) ) ( not ( = ?auto_87571 ?auto_87575 ) ) ( not ( = ?auto_87571 ?auto_87576 ) ) ( not ( = ?auto_87572 ?auto_87573 ) ) ( not ( = ?auto_87572 ?auto_87574 ) ) ( not ( = ?auto_87572 ?auto_87575 ) ) ( not ( = ?auto_87572 ?auto_87576 ) ) ( not ( = ?auto_87573 ?auto_87574 ) ) ( not ( = ?auto_87573 ?auto_87575 ) ) ( not ( = ?auto_87573 ?auto_87576 ) ) ( not ( = ?auto_87574 ?auto_87575 ) ) ( not ( = ?auto_87574 ?auto_87576 ) ) ( not ( = ?auto_87575 ?auto_87576 ) ) ( ON ?auto_87574 ?auto_87575 ) ( ON ?auto_87573 ?auto_87574 ) ( ON ?auto_87572 ?auto_87573 ) ( CLEAR ?auto_87570 ) ( ON ?auto_87571 ?auto_87572 ) ( CLEAR ?auto_87571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87568 ?auto_87569 ?auto_87570 ?auto_87571 )
      ( MAKE-8PILE ?auto_87568 ?auto_87569 ?auto_87570 ?auto_87571 ?auto_87572 ?auto_87573 ?auto_87574 ?auto_87575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87602 - BLOCK
      ?auto_87603 - BLOCK
      ?auto_87604 - BLOCK
      ?auto_87605 - BLOCK
      ?auto_87606 - BLOCK
      ?auto_87607 - BLOCK
      ?auto_87608 - BLOCK
      ?auto_87609 - BLOCK
    )
    :vars
    (
      ?auto_87610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87609 ?auto_87610 ) ( ON-TABLE ?auto_87602 ) ( ON ?auto_87603 ?auto_87602 ) ( not ( = ?auto_87602 ?auto_87603 ) ) ( not ( = ?auto_87602 ?auto_87604 ) ) ( not ( = ?auto_87602 ?auto_87605 ) ) ( not ( = ?auto_87602 ?auto_87606 ) ) ( not ( = ?auto_87602 ?auto_87607 ) ) ( not ( = ?auto_87602 ?auto_87608 ) ) ( not ( = ?auto_87602 ?auto_87609 ) ) ( not ( = ?auto_87602 ?auto_87610 ) ) ( not ( = ?auto_87603 ?auto_87604 ) ) ( not ( = ?auto_87603 ?auto_87605 ) ) ( not ( = ?auto_87603 ?auto_87606 ) ) ( not ( = ?auto_87603 ?auto_87607 ) ) ( not ( = ?auto_87603 ?auto_87608 ) ) ( not ( = ?auto_87603 ?auto_87609 ) ) ( not ( = ?auto_87603 ?auto_87610 ) ) ( not ( = ?auto_87604 ?auto_87605 ) ) ( not ( = ?auto_87604 ?auto_87606 ) ) ( not ( = ?auto_87604 ?auto_87607 ) ) ( not ( = ?auto_87604 ?auto_87608 ) ) ( not ( = ?auto_87604 ?auto_87609 ) ) ( not ( = ?auto_87604 ?auto_87610 ) ) ( not ( = ?auto_87605 ?auto_87606 ) ) ( not ( = ?auto_87605 ?auto_87607 ) ) ( not ( = ?auto_87605 ?auto_87608 ) ) ( not ( = ?auto_87605 ?auto_87609 ) ) ( not ( = ?auto_87605 ?auto_87610 ) ) ( not ( = ?auto_87606 ?auto_87607 ) ) ( not ( = ?auto_87606 ?auto_87608 ) ) ( not ( = ?auto_87606 ?auto_87609 ) ) ( not ( = ?auto_87606 ?auto_87610 ) ) ( not ( = ?auto_87607 ?auto_87608 ) ) ( not ( = ?auto_87607 ?auto_87609 ) ) ( not ( = ?auto_87607 ?auto_87610 ) ) ( not ( = ?auto_87608 ?auto_87609 ) ) ( not ( = ?auto_87608 ?auto_87610 ) ) ( not ( = ?auto_87609 ?auto_87610 ) ) ( ON ?auto_87608 ?auto_87609 ) ( ON ?auto_87607 ?auto_87608 ) ( ON ?auto_87606 ?auto_87607 ) ( ON ?auto_87605 ?auto_87606 ) ( CLEAR ?auto_87603 ) ( ON ?auto_87604 ?auto_87605 ) ( CLEAR ?auto_87604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87602 ?auto_87603 ?auto_87604 )
      ( MAKE-8PILE ?auto_87602 ?auto_87603 ?auto_87604 ?auto_87605 ?auto_87606 ?auto_87607 ?auto_87608 ?auto_87609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87636 - BLOCK
      ?auto_87637 - BLOCK
      ?auto_87638 - BLOCK
      ?auto_87639 - BLOCK
      ?auto_87640 - BLOCK
      ?auto_87641 - BLOCK
      ?auto_87642 - BLOCK
      ?auto_87643 - BLOCK
    )
    :vars
    (
      ?auto_87644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87643 ?auto_87644 ) ( ON-TABLE ?auto_87636 ) ( not ( = ?auto_87636 ?auto_87637 ) ) ( not ( = ?auto_87636 ?auto_87638 ) ) ( not ( = ?auto_87636 ?auto_87639 ) ) ( not ( = ?auto_87636 ?auto_87640 ) ) ( not ( = ?auto_87636 ?auto_87641 ) ) ( not ( = ?auto_87636 ?auto_87642 ) ) ( not ( = ?auto_87636 ?auto_87643 ) ) ( not ( = ?auto_87636 ?auto_87644 ) ) ( not ( = ?auto_87637 ?auto_87638 ) ) ( not ( = ?auto_87637 ?auto_87639 ) ) ( not ( = ?auto_87637 ?auto_87640 ) ) ( not ( = ?auto_87637 ?auto_87641 ) ) ( not ( = ?auto_87637 ?auto_87642 ) ) ( not ( = ?auto_87637 ?auto_87643 ) ) ( not ( = ?auto_87637 ?auto_87644 ) ) ( not ( = ?auto_87638 ?auto_87639 ) ) ( not ( = ?auto_87638 ?auto_87640 ) ) ( not ( = ?auto_87638 ?auto_87641 ) ) ( not ( = ?auto_87638 ?auto_87642 ) ) ( not ( = ?auto_87638 ?auto_87643 ) ) ( not ( = ?auto_87638 ?auto_87644 ) ) ( not ( = ?auto_87639 ?auto_87640 ) ) ( not ( = ?auto_87639 ?auto_87641 ) ) ( not ( = ?auto_87639 ?auto_87642 ) ) ( not ( = ?auto_87639 ?auto_87643 ) ) ( not ( = ?auto_87639 ?auto_87644 ) ) ( not ( = ?auto_87640 ?auto_87641 ) ) ( not ( = ?auto_87640 ?auto_87642 ) ) ( not ( = ?auto_87640 ?auto_87643 ) ) ( not ( = ?auto_87640 ?auto_87644 ) ) ( not ( = ?auto_87641 ?auto_87642 ) ) ( not ( = ?auto_87641 ?auto_87643 ) ) ( not ( = ?auto_87641 ?auto_87644 ) ) ( not ( = ?auto_87642 ?auto_87643 ) ) ( not ( = ?auto_87642 ?auto_87644 ) ) ( not ( = ?auto_87643 ?auto_87644 ) ) ( ON ?auto_87642 ?auto_87643 ) ( ON ?auto_87641 ?auto_87642 ) ( ON ?auto_87640 ?auto_87641 ) ( ON ?auto_87639 ?auto_87640 ) ( ON ?auto_87638 ?auto_87639 ) ( CLEAR ?auto_87636 ) ( ON ?auto_87637 ?auto_87638 ) ( CLEAR ?auto_87637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87636 ?auto_87637 )
      ( MAKE-8PILE ?auto_87636 ?auto_87637 ?auto_87638 ?auto_87639 ?auto_87640 ?auto_87641 ?auto_87642 ?auto_87643 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_87670 - BLOCK
      ?auto_87671 - BLOCK
      ?auto_87672 - BLOCK
      ?auto_87673 - BLOCK
      ?auto_87674 - BLOCK
      ?auto_87675 - BLOCK
      ?auto_87676 - BLOCK
      ?auto_87677 - BLOCK
    )
    :vars
    (
      ?auto_87678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87677 ?auto_87678 ) ( not ( = ?auto_87670 ?auto_87671 ) ) ( not ( = ?auto_87670 ?auto_87672 ) ) ( not ( = ?auto_87670 ?auto_87673 ) ) ( not ( = ?auto_87670 ?auto_87674 ) ) ( not ( = ?auto_87670 ?auto_87675 ) ) ( not ( = ?auto_87670 ?auto_87676 ) ) ( not ( = ?auto_87670 ?auto_87677 ) ) ( not ( = ?auto_87670 ?auto_87678 ) ) ( not ( = ?auto_87671 ?auto_87672 ) ) ( not ( = ?auto_87671 ?auto_87673 ) ) ( not ( = ?auto_87671 ?auto_87674 ) ) ( not ( = ?auto_87671 ?auto_87675 ) ) ( not ( = ?auto_87671 ?auto_87676 ) ) ( not ( = ?auto_87671 ?auto_87677 ) ) ( not ( = ?auto_87671 ?auto_87678 ) ) ( not ( = ?auto_87672 ?auto_87673 ) ) ( not ( = ?auto_87672 ?auto_87674 ) ) ( not ( = ?auto_87672 ?auto_87675 ) ) ( not ( = ?auto_87672 ?auto_87676 ) ) ( not ( = ?auto_87672 ?auto_87677 ) ) ( not ( = ?auto_87672 ?auto_87678 ) ) ( not ( = ?auto_87673 ?auto_87674 ) ) ( not ( = ?auto_87673 ?auto_87675 ) ) ( not ( = ?auto_87673 ?auto_87676 ) ) ( not ( = ?auto_87673 ?auto_87677 ) ) ( not ( = ?auto_87673 ?auto_87678 ) ) ( not ( = ?auto_87674 ?auto_87675 ) ) ( not ( = ?auto_87674 ?auto_87676 ) ) ( not ( = ?auto_87674 ?auto_87677 ) ) ( not ( = ?auto_87674 ?auto_87678 ) ) ( not ( = ?auto_87675 ?auto_87676 ) ) ( not ( = ?auto_87675 ?auto_87677 ) ) ( not ( = ?auto_87675 ?auto_87678 ) ) ( not ( = ?auto_87676 ?auto_87677 ) ) ( not ( = ?auto_87676 ?auto_87678 ) ) ( not ( = ?auto_87677 ?auto_87678 ) ) ( ON ?auto_87676 ?auto_87677 ) ( ON ?auto_87675 ?auto_87676 ) ( ON ?auto_87674 ?auto_87675 ) ( ON ?auto_87673 ?auto_87674 ) ( ON ?auto_87672 ?auto_87673 ) ( ON ?auto_87671 ?auto_87672 ) ( ON ?auto_87670 ?auto_87671 ) ( CLEAR ?auto_87670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_87670 )
      ( MAKE-8PILE ?auto_87670 ?auto_87671 ?auto_87672 ?auto_87673 ?auto_87674 ?auto_87675 ?auto_87676 ?auto_87677 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87705 - BLOCK
      ?auto_87706 - BLOCK
      ?auto_87707 - BLOCK
      ?auto_87708 - BLOCK
      ?auto_87709 - BLOCK
      ?auto_87710 - BLOCK
      ?auto_87711 - BLOCK
      ?auto_87712 - BLOCK
      ?auto_87713 - BLOCK
    )
    :vars
    (
      ?auto_87714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_87712 ) ( ON ?auto_87713 ?auto_87714 ) ( CLEAR ?auto_87713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_87705 ) ( ON ?auto_87706 ?auto_87705 ) ( ON ?auto_87707 ?auto_87706 ) ( ON ?auto_87708 ?auto_87707 ) ( ON ?auto_87709 ?auto_87708 ) ( ON ?auto_87710 ?auto_87709 ) ( ON ?auto_87711 ?auto_87710 ) ( ON ?auto_87712 ?auto_87711 ) ( not ( = ?auto_87705 ?auto_87706 ) ) ( not ( = ?auto_87705 ?auto_87707 ) ) ( not ( = ?auto_87705 ?auto_87708 ) ) ( not ( = ?auto_87705 ?auto_87709 ) ) ( not ( = ?auto_87705 ?auto_87710 ) ) ( not ( = ?auto_87705 ?auto_87711 ) ) ( not ( = ?auto_87705 ?auto_87712 ) ) ( not ( = ?auto_87705 ?auto_87713 ) ) ( not ( = ?auto_87705 ?auto_87714 ) ) ( not ( = ?auto_87706 ?auto_87707 ) ) ( not ( = ?auto_87706 ?auto_87708 ) ) ( not ( = ?auto_87706 ?auto_87709 ) ) ( not ( = ?auto_87706 ?auto_87710 ) ) ( not ( = ?auto_87706 ?auto_87711 ) ) ( not ( = ?auto_87706 ?auto_87712 ) ) ( not ( = ?auto_87706 ?auto_87713 ) ) ( not ( = ?auto_87706 ?auto_87714 ) ) ( not ( = ?auto_87707 ?auto_87708 ) ) ( not ( = ?auto_87707 ?auto_87709 ) ) ( not ( = ?auto_87707 ?auto_87710 ) ) ( not ( = ?auto_87707 ?auto_87711 ) ) ( not ( = ?auto_87707 ?auto_87712 ) ) ( not ( = ?auto_87707 ?auto_87713 ) ) ( not ( = ?auto_87707 ?auto_87714 ) ) ( not ( = ?auto_87708 ?auto_87709 ) ) ( not ( = ?auto_87708 ?auto_87710 ) ) ( not ( = ?auto_87708 ?auto_87711 ) ) ( not ( = ?auto_87708 ?auto_87712 ) ) ( not ( = ?auto_87708 ?auto_87713 ) ) ( not ( = ?auto_87708 ?auto_87714 ) ) ( not ( = ?auto_87709 ?auto_87710 ) ) ( not ( = ?auto_87709 ?auto_87711 ) ) ( not ( = ?auto_87709 ?auto_87712 ) ) ( not ( = ?auto_87709 ?auto_87713 ) ) ( not ( = ?auto_87709 ?auto_87714 ) ) ( not ( = ?auto_87710 ?auto_87711 ) ) ( not ( = ?auto_87710 ?auto_87712 ) ) ( not ( = ?auto_87710 ?auto_87713 ) ) ( not ( = ?auto_87710 ?auto_87714 ) ) ( not ( = ?auto_87711 ?auto_87712 ) ) ( not ( = ?auto_87711 ?auto_87713 ) ) ( not ( = ?auto_87711 ?auto_87714 ) ) ( not ( = ?auto_87712 ?auto_87713 ) ) ( not ( = ?auto_87712 ?auto_87714 ) ) ( not ( = ?auto_87713 ?auto_87714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_87713 ?auto_87714 )
      ( !STACK ?auto_87713 ?auto_87712 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87743 - BLOCK
      ?auto_87744 - BLOCK
      ?auto_87745 - BLOCK
      ?auto_87746 - BLOCK
      ?auto_87747 - BLOCK
      ?auto_87748 - BLOCK
      ?auto_87749 - BLOCK
      ?auto_87750 - BLOCK
      ?auto_87751 - BLOCK
    )
    :vars
    (
      ?auto_87752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87751 ?auto_87752 ) ( ON-TABLE ?auto_87743 ) ( ON ?auto_87744 ?auto_87743 ) ( ON ?auto_87745 ?auto_87744 ) ( ON ?auto_87746 ?auto_87745 ) ( ON ?auto_87747 ?auto_87746 ) ( ON ?auto_87748 ?auto_87747 ) ( ON ?auto_87749 ?auto_87748 ) ( not ( = ?auto_87743 ?auto_87744 ) ) ( not ( = ?auto_87743 ?auto_87745 ) ) ( not ( = ?auto_87743 ?auto_87746 ) ) ( not ( = ?auto_87743 ?auto_87747 ) ) ( not ( = ?auto_87743 ?auto_87748 ) ) ( not ( = ?auto_87743 ?auto_87749 ) ) ( not ( = ?auto_87743 ?auto_87750 ) ) ( not ( = ?auto_87743 ?auto_87751 ) ) ( not ( = ?auto_87743 ?auto_87752 ) ) ( not ( = ?auto_87744 ?auto_87745 ) ) ( not ( = ?auto_87744 ?auto_87746 ) ) ( not ( = ?auto_87744 ?auto_87747 ) ) ( not ( = ?auto_87744 ?auto_87748 ) ) ( not ( = ?auto_87744 ?auto_87749 ) ) ( not ( = ?auto_87744 ?auto_87750 ) ) ( not ( = ?auto_87744 ?auto_87751 ) ) ( not ( = ?auto_87744 ?auto_87752 ) ) ( not ( = ?auto_87745 ?auto_87746 ) ) ( not ( = ?auto_87745 ?auto_87747 ) ) ( not ( = ?auto_87745 ?auto_87748 ) ) ( not ( = ?auto_87745 ?auto_87749 ) ) ( not ( = ?auto_87745 ?auto_87750 ) ) ( not ( = ?auto_87745 ?auto_87751 ) ) ( not ( = ?auto_87745 ?auto_87752 ) ) ( not ( = ?auto_87746 ?auto_87747 ) ) ( not ( = ?auto_87746 ?auto_87748 ) ) ( not ( = ?auto_87746 ?auto_87749 ) ) ( not ( = ?auto_87746 ?auto_87750 ) ) ( not ( = ?auto_87746 ?auto_87751 ) ) ( not ( = ?auto_87746 ?auto_87752 ) ) ( not ( = ?auto_87747 ?auto_87748 ) ) ( not ( = ?auto_87747 ?auto_87749 ) ) ( not ( = ?auto_87747 ?auto_87750 ) ) ( not ( = ?auto_87747 ?auto_87751 ) ) ( not ( = ?auto_87747 ?auto_87752 ) ) ( not ( = ?auto_87748 ?auto_87749 ) ) ( not ( = ?auto_87748 ?auto_87750 ) ) ( not ( = ?auto_87748 ?auto_87751 ) ) ( not ( = ?auto_87748 ?auto_87752 ) ) ( not ( = ?auto_87749 ?auto_87750 ) ) ( not ( = ?auto_87749 ?auto_87751 ) ) ( not ( = ?auto_87749 ?auto_87752 ) ) ( not ( = ?auto_87750 ?auto_87751 ) ) ( not ( = ?auto_87750 ?auto_87752 ) ) ( not ( = ?auto_87751 ?auto_87752 ) ) ( CLEAR ?auto_87749 ) ( ON ?auto_87750 ?auto_87751 ) ( CLEAR ?auto_87750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_87743 ?auto_87744 ?auto_87745 ?auto_87746 ?auto_87747 ?auto_87748 ?auto_87749 ?auto_87750 )
      ( MAKE-9PILE ?auto_87743 ?auto_87744 ?auto_87745 ?auto_87746 ?auto_87747 ?auto_87748 ?auto_87749 ?auto_87750 ?auto_87751 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87781 - BLOCK
      ?auto_87782 - BLOCK
      ?auto_87783 - BLOCK
      ?auto_87784 - BLOCK
      ?auto_87785 - BLOCK
      ?auto_87786 - BLOCK
      ?auto_87787 - BLOCK
      ?auto_87788 - BLOCK
      ?auto_87789 - BLOCK
    )
    :vars
    (
      ?auto_87790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87789 ?auto_87790 ) ( ON-TABLE ?auto_87781 ) ( ON ?auto_87782 ?auto_87781 ) ( ON ?auto_87783 ?auto_87782 ) ( ON ?auto_87784 ?auto_87783 ) ( ON ?auto_87785 ?auto_87784 ) ( ON ?auto_87786 ?auto_87785 ) ( not ( = ?auto_87781 ?auto_87782 ) ) ( not ( = ?auto_87781 ?auto_87783 ) ) ( not ( = ?auto_87781 ?auto_87784 ) ) ( not ( = ?auto_87781 ?auto_87785 ) ) ( not ( = ?auto_87781 ?auto_87786 ) ) ( not ( = ?auto_87781 ?auto_87787 ) ) ( not ( = ?auto_87781 ?auto_87788 ) ) ( not ( = ?auto_87781 ?auto_87789 ) ) ( not ( = ?auto_87781 ?auto_87790 ) ) ( not ( = ?auto_87782 ?auto_87783 ) ) ( not ( = ?auto_87782 ?auto_87784 ) ) ( not ( = ?auto_87782 ?auto_87785 ) ) ( not ( = ?auto_87782 ?auto_87786 ) ) ( not ( = ?auto_87782 ?auto_87787 ) ) ( not ( = ?auto_87782 ?auto_87788 ) ) ( not ( = ?auto_87782 ?auto_87789 ) ) ( not ( = ?auto_87782 ?auto_87790 ) ) ( not ( = ?auto_87783 ?auto_87784 ) ) ( not ( = ?auto_87783 ?auto_87785 ) ) ( not ( = ?auto_87783 ?auto_87786 ) ) ( not ( = ?auto_87783 ?auto_87787 ) ) ( not ( = ?auto_87783 ?auto_87788 ) ) ( not ( = ?auto_87783 ?auto_87789 ) ) ( not ( = ?auto_87783 ?auto_87790 ) ) ( not ( = ?auto_87784 ?auto_87785 ) ) ( not ( = ?auto_87784 ?auto_87786 ) ) ( not ( = ?auto_87784 ?auto_87787 ) ) ( not ( = ?auto_87784 ?auto_87788 ) ) ( not ( = ?auto_87784 ?auto_87789 ) ) ( not ( = ?auto_87784 ?auto_87790 ) ) ( not ( = ?auto_87785 ?auto_87786 ) ) ( not ( = ?auto_87785 ?auto_87787 ) ) ( not ( = ?auto_87785 ?auto_87788 ) ) ( not ( = ?auto_87785 ?auto_87789 ) ) ( not ( = ?auto_87785 ?auto_87790 ) ) ( not ( = ?auto_87786 ?auto_87787 ) ) ( not ( = ?auto_87786 ?auto_87788 ) ) ( not ( = ?auto_87786 ?auto_87789 ) ) ( not ( = ?auto_87786 ?auto_87790 ) ) ( not ( = ?auto_87787 ?auto_87788 ) ) ( not ( = ?auto_87787 ?auto_87789 ) ) ( not ( = ?auto_87787 ?auto_87790 ) ) ( not ( = ?auto_87788 ?auto_87789 ) ) ( not ( = ?auto_87788 ?auto_87790 ) ) ( not ( = ?auto_87789 ?auto_87790 ) ) ( ON ?auto_87788 ?auto_87789 ) ( CLEAR ?auto_87786 ) ( ON ?auto_87787 ?auto_87788 ) ( CLEAR ?auto_87787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_87781 ?auto_87782 ?auto_87783 ?auto_87784 ?auto_87785 ?auto_87786 ?auto_87787 )
      ( MAKE-9PILE ?auto_87781 ?auto_87782 ?auto_87783 ?auto_87784 ?auto_87785 ?auto_87786 ?auto_87787 ?auto_87788 ?auto_87789 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87819 - BLOCK
      ?auto_87820 - BLOCK
      ?auto_87821 - BLOCK
      ?auto_87822 - BLOCK
      ?auto_87823 - BLOCK
      ?auto_87824 - BLOCK
      ?auto_87825 - BLOCK
      ?auto_87826 - BLOCK
      ?auto_87827 - BLOCK
    )
    :vars
    (
      ?auto_87828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87827 ?auto_87828 ) ( ON-TABLE ?auto_87819 ) ( ON ?auto_87820 ?auto_87819 ) ( ON ?auto_87821 ?auto_87820 ) ( ON ?auto_87822 ?auto_87821 ) ( ON ?auto_87823 ?auto_87822 ) ( not ( = ?auto_87819 ?auto_87820 ) ) ( not ( = ?auto_87819 ?auto_87821 ) ) ( not ( = ?auto_87819 ?auto_87822 ) ) ( not ( = ?auto_87819 ?auto_87823 ) ) ( not ( = ?auto_87819 ?auto_87824 ) ) ( not ( = ?auto_87819 ?auto_87825 ) ) ( not ( = ?auto_87819 ?auto_87826 ) ) ( not ( = ?auto_87819 ?auto_87827 ) ) ( not ( = ?auto_87819 ?auto_87828 ) ) ( not ( = ?auto_87820 ?auto_87821 ) ) ( not ( = ?auto_87820 ?auto_87822 ) ) ( not ( = ?auto_87820 ?auto_87823 ) ) ( not ( = ?auto_87820 ?auto_87824 ) ) ( not ( = ?auto_87820 ?auto_87825 ) ) ( not ( = ?auto_87820 ?auto_87826 ) ) ( not ( = ?auto_87820 ?auto_87827 ) ) ( not ( = ?auto_87820 ?auto_87828 ) ) ( not ( = ?auto_87821 ?auto_87822 ) ) ( not ( = ?auto_87821 ?auto_87823 ) ) ( not ( = ?auto_87821 ?auto_87824 ) ) ( not ( = ?auto_87821 ?auto_87825 ) ) ( not ( = ?auto_87821 ?auto_87826 ) ) ( not ( = ?auto_87821 ?auto_87827 ) ) ( not ( = ?auto_87821 ?auto_87828 ) ) ( not ( = ?auto_87822 ?auto_87823 ) ) ( not ( = ?auto_87822 ?auto_87824 ) ) ( not ( = ?auto_87822 ?auto_87825 ) ) ( not ( = ?auto_87822 ?auto_87826 ) ) ( not ( = ?auto_87822 ?auto_87827 ) ) ( not ( = ?auto_87822 ?auto_87828 ) ) ( not ( = ?auto_87823 ?auto_87824 ) ) ( not ( = ?auto_87823 ?auto_87825 ) ) ( not ( = ?auto_87823 ?auto_87826 ) ) ( not ( = ?auto_87823 ?auto_87827 ) ) ( not ( = ?auto_87823 ?auto_87828 ) ) ( not ( = ?auto_87824 ?auto_87825 ) ) ( not ( = ?auto_87824 ?auto_87826 ) ) ( not ( = ?auto_87824 ?auto_87827 ) ) ( not ( = ?auto_87824 ?auto_87828 ) ) ( not ( = ?auto_87825 ?auto_87826 ) ) ( not ( = ?auto_87825 ?auto_87827 ) ) ( not ( = ?auto_87825 ?auto_87828 ) ) ( not ( = ?auto_87826 ?auto_87827 ) ) ( not ( = ?auto_87826 ?auto_87828 ) ) ( not ( = ?auto_87827 ?auto_87828 ) ) ( ON ?auto_87826 ?auto_87827 ) ( ON ?auto_87825 ?auto_87826 ) ( CLEAR ?auto_87823 ) ( ON ?auto_87824 ?auto_87825 ) ( CLEAR ?auto_87824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_87819 ?auto_87820 ?auto_87821 ?auto_87822 ?auto_87823 ?auto_87824 )
      ( MAKE-9PILE ?auto_87819 ?auto_87820 ?auto_87821 ?auto_87822 ?auto_87823 ?auto_87824 ?auto_87825 ?auto_87826 ?auto_87827 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87857 - BLOCK
      ?auto_87858 - BLOCK
      ?auto_87859 - BLOCK
      ?auto_87860 - BLOCK
      ?auto_87861 - BLOCK
      ?auto_87862 - BLOCK
      ?auto_87863 - BLOCK
      ?auto_87864 - BLOCK
      ?auto_87865 - BLOCK
    )
    :vars
    (
      ?auto_87866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87865 ?auto_87866 ) ( ON-TABLE ?auto_87857 ) ( ON ?auto_87858 ?auto_87857 ) ( ON ?auto_87859 ?auto_87858 ) ( ON ?auto_87860 ?auto_87859 ) ( not ( = ?auto_87857 ?auto_87858 ) ) ( not ( = ?auto_87857 ?auto_87859 ) ) ( not ( = ?auto_87857 ?auto_87860 ) ) ( not ( = ?auto_87857 ?auto_87861 ) ) ( not ( = ?auto_87857 ?auto_87862 ) ) ( not ( = ?auto_87857 ?auto_87863 ) ) ( not ( = ?auto_87857 ?auto_87864 ) ) ( not ( = ?auto_87857 ?auto_87865 ) ) ( not ( = ?auto_87857 ?auto_87866 ) ) ( not ( = ?auto_87858 ?auto_87859 ) ) ( not ( = ?auto_87858 ?auto_87860 ) ) ( not ( = ?auto_87858 ?auto_87861 ) ) ( not ( = ?auto_87858 ?auto_87862 ) ) ( not ( = ?auto_87858 ?auto_87863 ) ) ( not ( = ?auto_87858 ?auto_87864 ) ) ( not ( = ?auto_87858 ?auto_87865 ) ) ( not ( = ?auto_87858 ?auto_87866 ) ) ( not ( = ?auto_87859 ?auto_87860 ) ) ( not ( = ?auto_87859 ?auto_87861 ) ) ( not ( = ?auto_87859 ?auto_87862 ) ) ( not ( = ?auto_87859 ?auto_87863 ) ) ( not ( = ?auto_87859 ?auto_87864 ) ) ( not ( = ?auto_87859 ?auto_87865 ) ) ( not ( = ?auto_87859 ?auto_87866 ) ) ( not ( = ?auto_87860 ?auto_87861 ) ) ( not ( = ?auto_87860 ?auto_87862 ) ) ( not ( = ?auto_87860 ?auto_87863 ) ) ( not ( = ?auto_87860 ?auto_87864 ) ) ( not ( = ?auto_87860 ?auto_87865 ) ) ( not ( = ?auto_87860 ?auto_87866 ) ) ( not ( = ?auto_87861 ?auto_87862 ) ) ( not ( = ?auto_87861 ?auto_87863 ) ) ( not ( = ?auto_87861 ?auto_87864 ) ) ( not ( = ?auto_87861 ?auto_87865 ) ) ( not ( = ?auto_87861 ?auto_87866 ) ) ( not ( = ?auto_87862 ?auto_87863 ) ) ( not ( = ?auto_87862 ?auto_87864 ) ) ( not ( = ?auto_87862 ?auto_87865 ) ) ( not ( = ?auto_87862 ?auto_87866 ) ) ( not ( = ?auto_87863 ?auto_87864 ) ) ( not ( = ?auto_87863 ?auto_87865 ) ) ( not ( = ?auto_87863 ?auto_87866 ) ) ( not ( = ?auto_87864 ?auto_87865 ) ) ( not ( = ?auto_87864 ?auto_87866 ) ) ( not ( = ?auto_87865 ?auto_87866 ) ) ( ON ?auto_87864 ?auto_87865 ) ( ON ?auto_87863 ?auto_87864 ) ( ON ?auto_87862 ?auto_87863 ) ( CLEAR ?auto_87860 ) ( ON ?auto_87861 ?auto_87862 ) ( CLEAR ?auto_87861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_87857 ?auto_87858 ?auto_87859 ?auto_87860 ?auto_87861 )
      ( MAKE-9PILE ?auto_87857 ?auto_87858 ?auto_87859 ?auto_87860 ?auto_87861 ?auto_87862 ?auto_87863 ?auto_87864 ?auto_87865 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87895 - BLOCK
      ?auto_87896 - BLOCK
      ?auto_87897 - BLOCK
      ?auto_87898 - BLOCK
      ?auto_87899 - BLOCK
      ?auto_87900 - BLOCK
      ?auto_87901 - BLOCK
      ?auto_87902 - BLOCK
      ?auto_87903 - BLOCK
    )
    :vars
    (
      ?auto_87904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87903 ?auto_87904 ) ( ON-TABLE ?auto_87895 ) ( ON ?auto_87896 ?auto_87895 ) ( ON ?auto_87897 ?auto_87896 ) ( not ( = ?auto_87895 ?auto_87896 ) ) ( not ( = ?auto_87895 ?auto_87897 ) ) ( not ( = ?auto_87895 ?auto_87898 ) ) ( not ( = ?auto_87895 ?auto_87899 ) ) ( not ( = ?auto_87895 ?auto_87900 ) ) ( not ( = ?auto_87895 ?auto_87901 ) ) ( not ( = ?auto_87895 ?auto_87902 ) ) ( not ( = ?auto_87895 ?auto_87903 ) ) ( not ( = ?auto_87895 ?auto_87904 ) ) ( not ( = ?auto_87896 ?auto_87897 ) ) ( not ( = ?auto_87896 ?auto_87898 ) ) ( not ( = ?auto_87896 ?auto_87899 ) ) ( not ( = ?auto_87896 ?auto_87900 ) ) ( not ( = ?auto_87896 ?auto_87901 ) ) ( not ( = ?auto_87896 ?auto_87902 ) ) ( not ( = ?auto_87896 ?auto_87903 ) ) ( not ( = ?auto_87896 ?auto_87904 ) ) ( not ( = ?auto_87897 ?auto_87898 ) ) ( not ( = ?auto_87897 ?auto_87899 ) ) ( not ( = ?auto_87897 ?auto_87900 ) ) ( not ( = ?auto_87897 ?auto_87901 ) ) ( not ( = ?auto_87897 ?auto_87902 ) ) ( not ( = ?auto_87897 ?auto_87903 ) ) ( not ( = ?auto_87897 ?auto_87904 ) ) ( not ( = ?auto_87898 ?auto_87899 ) ) ( not ( = ?auto_87898 ?auto_87900 ) ) ( not ( = ?auto_87898 ?auto_87901 ) ) ( not ( = ?auto_87898 ?auto_87902 ) ) ( not ( = ?auto_87898 ?auto_87903 ) ) ( not ( = ?auto_87898 ?auto_87904 ) ) ( not ( = ?auto_87899 ?auto_87900 ) ) ( not ( = ?auto_87899 ?auto_87901 ) ) ( not ( = ?auto_87899 ?auto_87902 ) ) ( not ( = ?auto_87899 ?auto_87903 ) ) ( not ( = ?auto_87899 ?auto_87904 ) ) ( not ( = ?auto_87900 ?auto_87901 ) ) ( not ( = ?auto_87900 ?auto_87902 ) ) ( not ( = ?auto_87900 ?auto_87903 ) ) ( not ( = ?auto_87900 ?auto_87904 ) ) ( not ( = ?auto_87901 ?auto_87902 ) ) ( not ( = ?auto_87901 ?auto_87903 ) ) ( not ( = ?auto_87901 ?auto_87904 ) ) ( not ( = ?auto_87902 ?auto_87903 ) ) ( not ( = ?auto_87902 ?auto_87904 ) ) ( not ( = ?auto_87903 ?auto_87904 ) ) ( ON ?auto_87902 ?auto_87903 ) ( ON ?auto_87901 ?auto_87902 ) ( ON ?auto_87900 ?auto_87901 ) ( ON ?auto_87899 ?auto_87900 ) ( CLEAR ?auto_87897 ) ( ON ?auto_87898 ?auto_87899 ) ( CLEAR ?auto_87898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_87895 ?auto_87896 ?auto_87897 ?auto_87898 )
      ( MAKE-9PILE ?auto_87895 ?auto_87896 ?auto_87897 ?auto_87898 ?auto_87899 ?auto_87900 ?auto_87901 ?auto_87902 ?auto_87903 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87933 - BLOCK
      ?auto_87934 - BLOCK
      ?auto_87935 - BLOCK
      ?auto_87936 - BLOCK
      ?auto_87937 - BLOCK
      ?auto_87938 - BLOCK
      ?auto_87939 - BLOCK
      ?auto_87940 - BLOCK
      ?auto_87941 - BLOCK
    )
    :vars
    (
      ?auto_87942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87941 ?auto_87942 ) ( ON-TABLE ?auto_87933 ) ( ON ?auto_87934 ?auto_87933 ) ( not ( = ?auto_87933 ?auto_87934 ) ) ( not ( = ?auto_87933 ?auto_87935 ) ) ( not ( = ?auto_87933 ?auto_87936 ) ) ( not ( = ?auto_87933 ?auto_87937 ) ) ( not ( = ?auto_87933 ?auto_87938 ) ) ( not ( = ?auto_87933 ?auto_87939 ) ) ( not ( = ?auto_87933 ?auto_87940 ) ) ( not ( = ?auto_87933 ?auto_87941 ) ) ( not ( = ?auto_87933 ?auto_87942 ) ) ( not ( = ?auto_87934 ?auto_87935 ) ) ( not ( = ?auto_87934 ?auto_87936 ) ) ( not ( = ?auto_87934 ?auto_87937 ) ) ( not ( = ?auto_87934 ?auto_87938 ) ) ( not ( = ?auto_87934 ?auto_87939 ) ) ( not ( = ?auto_87934 ?auto_87940 ) ) ( not ( = ?auto_87934 ?auto_87941 ) ) ( not ( = ?auto_87934 ?auto_87942 ) ) ( not ( = ?auto_87935 ?auto_87936 ) ) ( not ( = ?auto_87935 ?auto_87937 ) ) ( not ( = ?auto_87935 ?auto_87938 ) ) ( not ( = ?auto_87935 ?auto_87939 ) ) ( not ( = ?auto_87935 ?auto_87940 ) ) ( not ( = ?auto_87935 ?auto_87941 ) ) ( not ( = ?auto_87935 ?auto_87942 ) ) ( not ( = ?auto_87936 ?auto_87937 ) ) ( not ( = ?auto_87936 ?auto_87938 ) ) ( not ( = ?auto_87936 ?auto_87939 ) ) ( not ( = ?auto_87936 ?auto_87940 ) ) ( not ( = ?auto_87936 ?auto_87941 ) ) ( not ( = ?auto_87936 ?auto_87942 ) ) ( not ( = ?auto_87937 ?auto_87938 ) ) ( not ( = ?auto_87937 ?auto_87939 ) ) ( not ( = ?auto_87937 ?auto_87940 ) ) ( not ( = ?auto_87937 ?auto_87941 ) ) ( not ( = ?auto_87937 ?auto_87942 ) ) ( not ( = ?auto_87938 ?auto_87939 ) ) ( not ( = ?auto_87938 ?auto_87940 ) ) ( not ( = ?auto_87938 ?auto_87941 ) ) ( not ( = ?auto_87938 ?auto_87942 ) ) ( not ( = ?auto_87939 ?auto_87940 ) ) ( not ( = ?auto_87939 ?auto_87941 ) ) ( not ( = ?auto_87939 ?auto_87942 ) ) ( not ( = ?auto_87940 ?auto_87941 ) ) ( not ( = ?auto_87940 ?auto_87942 ) ) ( not ( = ?auto_87941 ?auto_87942 ) ) ( ON ?auto_87940 ?auto_87941 ) ( ON ?auto_87939 ?auto_87940 ) ( ON ?auto_87938 ?auto_87939 ) ( ON ?auto_87937 ?auto_87938 ) ( ON ?auto_87936 ?auto_87937 ) ( CLEAR ?auto_87934 ) ( ON ?auto_87935 ?auto_87936 ) ( CLEAR ?auto_87935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_87933 ?auto_87934 ?auto_87935 )
      ( MAKE-9PILE ?auto_87933 ?auto_87934 ?auto_87935 ?auto_87936 ?auto_87937 ?auto_87938 ?auto_87939 ?auto_87940 ?auto_87941 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_87971 - BLOCK
      ?auto_87972 - BLOCK
      ?auto_87973 - BLOCK
      ?auto_87974 - BLOCK
      ?auto_87975 - BLOCK
      ?auto_87976 - BLOCK
      ?auto_87977 - BLOCK
      ?auto_87978 - BLOCK
      ?auto_87979 - BLOCK
    )
    :vars
    (
      ?auto_87980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_87979 ?auto_87980 ) ( ON-TABLE ?auto_87971 ) ( not ( = ?auto_87971 ?auto_87972 ) ) ( not ( = ?auto_87971 ?auto_87973 ) ) ( not ( = ?auto_87971 ?auto_87974 ) ) ( not ( = ?auto_87971 ?auto_87975 ) ) ( not ( = ?auto_87971 ?auto_87976 ) ) ( not ( = ?auto_87971 ?auto_87977 ) ) ( not ( = ?auto_87971 ?auto_87978 ) ) ( not ( = ?auto_87971 ?auto_87979 ) ) ( not ( = ?auto_87971 ?auto_87980 ) ) ( not ( = ?auto_87972 ?auto_87973 ) ) ( not ( = ?auto_87972 ?auto_87974 ) ) ( not ( = ?auto_87972 ?auto_87975 ) ) ( not ( = ?auto_87972 ?auto_87976 ) ) ( not ( = ?auto_87972 ?auto_87977 ) ) ( not ( = ?auto_87972 ?auto_87978 ) ) ( not ( = ?auto_87972 ?auto_87979 ) ) ( not ( = ?auto_87972 ?auto_87980 ) ) ( not ( = ?auto_87973 ?auto_87974 ) ) ( not ( = ?auto_87973 ?auto_87975 ) ) ( not ( = ?auto_87973 ?auto_87976 ) ) ( not ( = ?auto_87973 ?auto_87977 ) ) ( not ( = ?auto_87973 ?auto_87978 ) ) ( not ( = ?auto_87973 ?auto_87979 ) ) ( not ( = ?auto_87973 ?auto_87980 ) ) ( not ( = ?auto_87974 ?auto_87975 ) ) ( not ( = ?auto_87974 ?auto_87976 ) ) ( not ( = ?auto_87974 ?auto_87977 ) ) ( not ( = ?auto_87974 ?auto_87978 ) ) ( not ( = ?auto_87974 ?auto_87979 ) ) ( not ( = ?auto_87974 ?auto_87980 ) ) ( not ( = ?auto_87975 ?auto_87976 ) ) ( not ( = ?auto_87975 ?auto_87977 ) ) ( not ( = ?auto_87975 ?auto_87978 ) ) ( not ( = ?auto_87975 ?auto_87979 ) ) ( not ( = ?auto_87975 ?auto_87980 ) ) ( not ( = ?auto_87976 ?auto_87977 ) ) ( not ( = ?auto_87976 ?auto_87978 ) ) ( not ( = ?auto_87976 ?auto_87979 ) ) ( not ( = ?auto_87976 ?auto_87980 ) ) ( not ( = ?auto_87977 ?auto_87978 ) ) ( not ( = ?auto_87977 ?auto_87979 ) ) ( not ( = ?auto_87977 ?auto_87980 ) ) ( not ( = ?auto_87978 ?auto_87979 ) ) ( not ( = ?auto_87978 ?auto_87980 ) ) ( not ( = ?auto_87979 ?auto_87980 ) ) ( ON ?auto_87978 ?auto_87979 ) ( ON ?auto_87977 ?auto_87978 ) ( ON ?auto_87976 ?auto_87977 ) ( ON ?auto_87975 ?auto_87976 ) ( ON ?auto_87974 ?auto_87975 ) ( ON ?auto_87973 ?auto_87974 ) ( CLEAR ?auto_87971 ) ( ON ?auto_87972 ?auto_87973 ) ( CLEAR ?auto_87972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_87971 ?auto_87972 )
      ( MAKE-9PILE ?auto_87971 ?auto_87972 ?auto_87973 ?auto_87974 ?auto_87975 ?auto_87976 ?auto_87977 ?auto_87978 ?auto_87979 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_88009 - BLOCK
      ?auto_88010 - BLOCK
      ?auto_88011 - BLOCK
      ?auto_88012 - BLOCK
      ?auto_88013 - BLOCK
      ?auto_88014 - BLOCK
      ?auto_88015 - BLOCK
      ?auto_88016 - BLOCK
      ?auto_88017 - BLOCK
    )
    :vars
    (
      ?auto_88018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88017 ?auto_88018 ) ( not ( = ?auto_88009 ?auto_88010 ) ) ( not ( = ?auto_88009 ?auto_88011 ) ) ( not ( = ?auto_88009 ?auto_88012 ) ) ( not ( = ?auto_88009 ?auto_88013 ) ) ( not ( = ?auto_88009 ?auto_88014 ) ) ( not ( = ?auto_88009 ?auto_88015 ) ) ( not ( = ?auto_88009 ?auto_88016 ) ) ( not ( = ?auto_88009 ?auto_88017 ) ) ( not ( = ?auto_88009 ?auto_88018 ) ) ( not ( = ?auto_88010 ?auto_88011 ) ) ( not ( = ?auto_88010 ?auto_88012 ) ) ( not ( = ?auto_88010 ?auto_88013 ) ) ( not ( = ?auto_88010 ?auto_88014 ) ) ( not ( = ?auto_88010 ?auto_88015 ) ) ( not ( = ?auto_88010 ?auto_88016 ) ) ( not ( = ?auto_88010 ?auto_88017 ) ) ( not ( = ?auto_88010 ?auto_88018 ) ) ( not ( = ?auto_88011 ?auto_88012 ) ) ( not ( = ?auto_88011 ?auto_88013 ) ) ( not ( = ?auto_88011 ?auto_88014 ) ) ( not ( = ?auto_88011 ?auto_88015 ) ) ( not ( = ?auto_88011 ?auto_88016 ) ) ( not ( = ?auto_88011 ?auto_88017 ) ) ( not ( = ?auto_88011 ?auto_88018 ) ) ( not ( = ?auto_88012 ?auto_88013 ) ) ( not ( = ?auto_88012 ?auto_88014 ) ) ( not ( = ?auto_88012 ?auto_88015 ) ) ( not ( = ?auto_88012 ?auto_88016 ) ) ( not ( = ?auto_88012 ?auto_88017 ) ) ( not ( = ?auto_88012 ?auto_88018 ) ) ( not ( = ?auto_88013 ?auto_88014 ) ) ( not ( = ?auto_88013 ?auto_88015 ) ) ( not ( = ?auto_88013 ?auto_88016 ) ) ( not ( = ?auto_88013 ?auto_88017 ) ) ( not ( = ?auto_88013 ?auto_88018 ) ) ( not ( = ?auto_88014 ?auto_88015 ) ) ( not ( = ?auto_88014 ?auto_88016 ) ) ( not ( = ?auto_88014 ?auto_88017 ) ) ( not ( = ?auto_88014 ?auto_88018 ) ) ( not ( = ?auto_88015 ?auto_88016 ) ) ( not ( = ?auto_88015 ?auto_88017 ) ) ( not ( = ?auto_88015 ?auto_88018 ) ) ( not ( = ?auto_88016 ?auto_88017 ) ) ( not ( = ?auto_88016 ?auto_88018 ) ) ( not ( = ?auto_88017 ?auto_88018 ) ) ( ON ?auto_88016 ?auto_88017 ) ( ON ?auto_88015 ?auto_88016 ) ( ON ?auto_88014 ?auto_88015 ) ( ON ?auto_88013 ?auto_88014 ) ( ON ?auto_88012 ?auto_88013 ) ( ON ?auto_88011 ?auto_88012 ) ( ON ?auto_88010 ?auto_88011 ) ( ON ?auto_88009 ?auto_88010 ) ( CLEAR ?auto_88009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88009 )
      ( MAKE-9PILE ?auto_88009 ?auto_88010 ?auto_88011 ?auto_88012 ?auto_88013 ?auto_88014 ?auto_88015 ?auto_88016 ?auto_88017 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88048 - BLOCK
      ?auto_88049 - BLOCK
      ?auto_88050 - BLOCK
      ?auto_88051 - BLOCK
      ?auto_88052 - BLOCK
      ?auto_88053 - BLOCK
      ?auto_88054 - BLOCK
      ?auto_88055 - BLOCK
      ?auto_88056 - BLOCK
      ?auto_88057 - BLOCK
    )
    :vars
    (
      ?auto_88058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88056 ) ( ON ?auto_88057 ?auto_88058 ) ( CLEAR ?auto_88057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88048 ) ( ON ?auto_88049 ?auto_88048 ) ( ON ?auto_88050 ?auto_88049 ) ( ON ?auto_88051 ?auto_88050 ) ( ON ?auto_88052 ?auto_88051 ) ( ON ?auto_88053 ?auto_88052 ) ( ON ?auto_88054 ?auto_88053 ) ( ON ?auto_88055 ?auto_88054 ) ( ON ?auto_88056 ?auto_88055 ) ( not ( = ?auto_88048 ?auto_88049 ) ) ( not ( = ?auto_88048 ?auto_88050 ) ) ( not ( = ?auto_88048 ?auto_88051 ) ) ( not ( = ?auto_88048 ?auto_88052 ) ) ( not ( = ?auto_88048 ?auto_88053 ) ) ( not ( = ?auto_88048 ?auto_88054 ) ) ( not ( = ?auto_88048 ?auto_88055 ) ) ( not ( = ?auto_88048 ?auto_88056 ) ) ( not ( = ?auto_88048 ?auto_88057 ) ) ( not ( = ?auto_88048 ?auto_88058 ) ) ( not ( = ?auto_88049 ?auto_88050 ) ) ( not ( = ?auto_88049 ?auto_88051 ) ) ( not ( = ?auto_88049 ?auto_88052 ) ) ( not ( = ?auto_88049 ?auto_88053 ) ) ( not ( = ?auto_88049 ?auto_88054 ) ) ( not ( = ?auto_88049 ?auto_88055 ) ) ( not ( = ?auto_88049 ?auto_88056 ) ) ( not ( = ?auto_88049 ?auto_88057 ) ) ( not ( = ?auto_88049 ?auto_88058 ) ) ( not ( = ?auto_88050 ?auto_88051 ) ) ( not ( = ?auto_88050 ?auto_88052 ) ) ( not ( = ?auto_88050 ?auto_88053 ) ) ( not ( = ?auto_88050 ?auto_88054 ) ) ( not ( = ?auto_88050 ?auto_88055 ) ) ( not ( = ?auto_88050 ?auto_88056 ) ) ( not ( = ?auto_88050 ?auto_88057 ) ) ( not ( = ?auto_88050 ?auto_88058 ) ) ( not ( = ?auto_88051 ?auto_88052 ) ) ( not ( = ?auto_88051 ?auto_88053 ) ) ( not ( = ?auto_88051 ?auto_88054 ) ) ( not ( = ?auto_88051 ?auto_88055 ) ) ( not ( = ?auto_88051 ?auto_88056 ) ) ( not ( = ?auto_88051 ?auto_88057 ) ) ( not ( = ?auto_88051 ?auto_88058 ) ) ( not ( = ?auto_88052 ?auto_88053 ) ) ( not ( = ?auto_88052 ?auto_88054 ) ) ( not ( = ?auto_88052 ?auto_88055 ) ) ( not ( = ?auto_88052 ?auto_88056 ) ) ( not ( = ?auto_88052 ?auto_88057 ) ) ( not ( = ?auto_88052 ?auto_88058 ) ) ( not ( = ?auto_88053 ?auto_88054 ) ) ( not ( = ?auto_88053 ?auto_88055 ) ) ( not ( = ?auto_88053 ?auto_88056 ) ) ( not ( = ?auto_88053 ?auto_88057 ) ) ( not ( = ?auto_88053 ?auto_88058 ) ) ( not ( = ?auto_88054 ?auto_88055 ) ) ( not ( = ?auto_88054 ?auto_88056 ) ) ( not ( = ?auto_88054 ?auto_88057 ) ) ( not ( = ?auto_88054 ?auto_88058 ) ) ( not ( = ?auto_88055 ?auto_88056 ) ) ( not ( = ?auto_88055 ?auto_88057 ) ) ( not ( = ?auto_88055 ?auto_88058 ) ) ( not ( = ?auto_88056 ?auto_88057 ) ) ( not ( = ?auto_88056 ?auto_88058 ) ) ( not ( = ?auto_88057 ?auto_88058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88057 ?auto_88058 )
      ( !STACK ?auto_88057 ?auto_88056 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88069 - BLOCK
      ?auto_88070 - BLOCK
      ?auto_88071 - BLOCK
      ?auto_88072 - BLOCK
      ?auto_88073 - BLOCK
      ?auto_88074 - BLOCK
      ?auto_88075 - BLOCK
      ?auto_88076 - BLOCK
      ?auto_88077 - BLOCK
      ?auto_88078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_88077 ) ( ON-TABLE ?auto_88078 ) ( CLEAR ?auto_88078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_88069 ) ( ON ?auto_88070 ?auto_88069 ) ( ON ?auto_88071 ?auto_88070 ) ( ON ?auto_88072 ?auto_88071 ) ( ON ?auto_88073 ?auto_88072 ) ( ON ?auto_88074 ?auto_88073 ) ( ON ?auto_88075 ?auto_88074 ) ( ON ?auto_88076 ?auto_88075 ) ( ON ?auto_88077 ?auto_88076 ) ( not ( = ?auto_88069 ?auto_88070 ) ) ( not ( = ?auto_88069 ?auto_88071 ) ) ( not ( = ?auto_88069 ?auto_88072 ) ) ( not ( = ?auto_88069 ?auto_88073 ) ) ( not ( = ?auto_88069 ?auto_88074 ) ) ( not ( = ?auto_88069 ?auto_88075 ) ) ( not ( = ?auto_88069 ?auto_88076 ) ) ( not ( = ?auto_88069 ?auto_88077 ) ) ( not ( = ?auto_88069 ?auto_88078 ) ) ( not ( = ?auto_88070 ?auto_88071 ) ) ( not ( = ?auto_88070 ?auto_88072 ) ) ( not ( = ?auto_88070 ?auto_88073 ) ) ( not ( = ?auto_88070 ?auto_88074 ) ) ( not ( = ?auto_88070 ?auto_88075 ) ) ( not ( = ?auto_88070 ?auto_88076 ) ) ( not ( = ?auto_88070 ?auto_88077 ) ) ( not ( = ?auto_88070 ?auto_88078 ) ) ( not ( = ?auto_88071 ?auto_88072 ) ) ( not ( = ?auto_88071 ?auto_88073 ) ) ( not ( = ?auto_88071 ?auto_88074 ) ) ( not ( = ?auto_88071 ?auto_88075 ) ) ( not ( = ?auto_88071 ?auto_88076 ) ) ( not ( = ?auto_88071 ?auto_88077 ) ) ( not ( = ?auto_88071 ?auto_88078 ) ) ( not ( = ?auto_88072 ?auto_88073 ) ) ( not ( = ?auto_88072 ?auto_88074 ) ) ( not ( = ?auto_88072 ?auto_88075 ) ) ( not ( = ?auto_88072 ?auto_88076 ) ) ( not ( = ?auto_88072 ?auto_88077 ) ) ( not ( = ?auto_88072 ?auto_88078 ) ) ( not ( = ?auto_88073 ?auto_88074 ) ) ( not ( = ?auto_88073 ?auto_88075 ) ) ( not ( = ?auto_88073 ?auto_88076 ) ) ( not ( = ?auto_88073 ?auto_88077 ) ) ( not ( = ?auto_88073 ?auto_88078 ) ) ( not ( = ?auto_88074 ?auto_88075 ) ) ( not ( = ?auto_88074 ?auto_88076 ) ) ( not ( = ?auto_88074 ?auto_88077 ) ) ( not ( = ?auto_88074 ?auto_88078 ) ) ( not ( = ?auto_88075 ?auto_88076 ) ) ( not ( = ?auto_88075 ?auto_88077 ) ) ( not ( = ?auto_88075 ?auto_88078 ) ) ( not ( = ?auto_88076 ?auto_88077 ) ) ( not ( = ?auto_88076 ?auto_88078 ) ) ( not ( = ?auto_88077 ?auto_88078 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_88078 )
      ( !STACK ?auto_88078 ?auto_88077 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88089 - BLOCK
      ?auto_88090 - BLOCK
      ?auto_88091 - BLOCK
      ?auto_88092 - BLOCK
      ?auto_88093 - BLOCK
      ?auto_88094 - BLOCK
      ?auto_88095 - BLOCK
      ?auto_88096 - BLOCK
      ?auto_88097 - BLOCK
      ?auto_88098 - BLOCK
    )
    :vars
    (
      ?auto_88099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88098 ?auto_88099 ) ( ON-TABLE ?auto_88089 ) ( ON ?auto_88090 ?auto_88089 ) ( ON ?auto_88091 ?auto_88090 ) ( ON ?auto_88092 ?auto_88091 ) ( ON ?auto_88093 ?auto_88092 ) ( ON ?auto_88094 ?auto_88093 ) ( ON ?auto_88095 ?auto_88094 ) ( ON ?auto_88096 ?auto_88095 ) ( not ( = ?auto_88089 ?auto_88090 ) ) ( not ( = ?auto_88089 ?auto_88091 ) ) ( not ( = ?auto_88089 ?auto_88092 ) ) ( not ( = ?auto_88089 ?auto_88093 ) ) ( not ( = ?auto_88089 ?auto_88094 ) ) ( not ( = ?auto_88089 ?auto_88095 ) ) ( not ( = ?auto_88089 ?auto_88096 ) ) ( not ( = ?auto_88089 ?auto_88097 ) ) ( not ( = ?auto_88089 ?auto_88098 ) ) ( not ( = ?auto_88089 ?auto_88099 ) ) ( not ( = ?auto_88090 ?auto_88091 ) ) ( not ( = ?auto_88090 ?auto_88092 ) ) ( not ( = ?auto_88090 ?auto_88093 ) ) ( not ( = ?auto_88090 ?auto_88094 ) ) ( not ( = ?auto_88090 ?auto_88095 ) ) ( not ( = ?auto_88090 ?auto_88096 ) ) ( not ( = ?auto_88090 ?auto_88097 ) ) ( not ( = ?auto_88090 ?auto_88098 ) ) ( not ( = ?auto_88090 ?auto_88099 ) ) ( not ( = ?auto_88091 ?auto_88092 ) ) ( not ( = ?auto_88091 ?auto_88093 ) ) ( not ( = ?auto_88091 ?auto_88094 ) ) ( not ( = ?auto_88091 ?auto_88095 ) ) ( not ( = ?auto_88091 ?auto_88096 ) ) ( not ( = ?auto_88091 ?auto_88097 ) ) ( not ( = ?auto_88091 ?auto_88098 ) ) ( not ( = ?auto_88091 ?auto_88099 ) ) ( not ( = ?auto_88092 ?auto_88093 ) ) ( not ( = ?auto_88092 ?auto_88094 ) ) ( not ( = ?auto_88092 ?auto_88095 ) ) ( not ( = ?auto_88092 ?auto_88096 ) ) ( not ( = ?auto_88092 ?auto_88097 ) ) ( not ( = ?auto_88092 ?auto_88098 ) ) ( not ( = ?auto_88092 ?auto_88099 ) ) ( not ( = ?auto_88093 ?auto_88094 ) ) ( not ( = ?auto_88093 ?auto_88095 ) ) ( not ( = ?auto_88093 ?auto_88096 ) ) ( not ( = ?auto_88093 ?auto_88097 ) ) ( not ( = ?auto_88093 ?auto_88098 ) ) ( not ( = ?auto_88093 ?auto_88099 ) ) ( not ( = ?auto_88094 ?auto_88095 ) ) ( not ( = ?auto_88094 ?auto_88096 ) ) ( not ( = ?auto_88094 ?auto_88097 ) ) ( not ( = ?auto_88094 ?auto_88098 ) ) ( not ( = ?auto_88094 ?auto_88099 ) ) ( not ( = ?auto_88095 ?auto_88096 ) ) ( not ( = ?auto_88095 ?auto_88097 ) ) ( not ( = ?auto_88095 ?auto_88098 ) ) ( not ( = ?auto_88095 ?auto_88099 ) ) ( not ( = ?auto_88096 ?auto_88097 ) ) ( not ( = ?auto_88096 ?auto_88098 ) ) ( not ( = ?auto_88096 ?auto_88099 ) ) ( not ( = ?auto_88097 ?auto_88098 ) ) ( not ( = ?auto_88097 ?auto_88099 ) ) ( not ( = ?auto_88098 ?auto_88099 ) ) ( CLEAR ?auto_88096 ) ( ON ?auto_88097 ?auto_88098 ) ( CLEAR ?auto_88097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_88089 ?auto_88090 ?auto_88091 ?auto_88092 ?auto_88093 ?auto_88094 ?auto_88095 ?auto_88096 ?auto_88097 )
      ( MAKE-10PILE ?auto_88089 ?auto_88090 ?auto_88091 ?auto_88092 ?auto_88093 ?auto_88094 ?auto_88095 ?auto_88096 ?auto_88097 ?auto_88098 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88110 - BLOCK
      ?auto_88111 - BLOCK
      ?auto_88112 - BLOCK
      ?auto_88113 - BLOCK
      ?auto_88114 - BLOCK
      ?auto_88115 - BLOCK
      ?auto_88116 - BLOCK
      ?auto_88117 - BLOCK
      ?auto_88118 - BLOCK
      ?auto_88119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88119 ) ( ON-TABLE ?auto_88110 ) ( ON ?auto_88111 ?auto_88110 ) ( ON ?auto_88112 ?auto_88111 ) ( ON ?auto_88113 ?auto_88112 ) ( ON ?auto_88114 ?auto_88113 ) ( ON ?auto_88115 ?auto_88114 ) ( ON ?auto_88116 ?auto_88115 ) ( ON ?auto_88117 ?auto_88116 ) ( not ( = ?auto_88110 ?auto_88111 ) ) ( not ( = ?auto_88110 ?auto_88112 ) ) ( not ( = ?auto_88110 ?auto_88113 ) ) ( not ( = ?auto_88110 ?auto_88114 ) ) ( not ( = ?auto_88110 ?auto_88115 ) ) ( not ( = ?auto_88110 ?auto_88116 ) ) ( not ( = ?auto_88110 ?auto_88117 ) ) ( not ( = ?auto_88110 ?auto_88118 ) ) ( not ( = ?auto_88110 ?auto_88119 ) ) ( not ( = ?auto_88111 ?auto_88112 ) ) ( not ( = ?auto_88111 ?auto_88113 ) ) ( not ( = ?auto_88111 ?auto_88114 ) ) ( not ( = ?auto_88111 ?auto_88115 ) ) ( not ( = ?auto_88111 ?auto_88116 ) ) ( not ( = ?auto_88111 ?auto_88117 ) ) ( not ( = ?auto_88111 ?auto_88118 ) ) ( not ( = ?auto_88111 ?auto_88119 ) ) ( not ( = ?auto_88112 ?auto_88113 ) ) ( not ( = ?auto_88112 ?auto_88114 ) ) ( not ( = ?auto_88112 ?auto_88115 ) ) ( not ( = ?auto_88112 ?auto_88116 ) ) ( not ( = ?auto_88112 ?auto_88117 ) ) ( not ( = ?auto_88112 ?auto_88118 ) ) ( not ( = ?auto_88112 ?auto_88119 ) ) ( not ( = ?auto_88113 ?auto_88114 ) ) ( not ( = ?auto_88113 ?auto_88115 ) ) ( not ( = ?auto_88113 ?auto_88116 ) ) ( not ( = ?auto_88113 ?auto_88117 ) ) ( not ( = ?auto_88113 ?auto_88118 ) ) ( not ( = ?auto_88113 ?auto_88119 ) ) ( not ( = ?auto_88114 ?auto_88115 ) ) ( not ( = ?auto_88114 ?auto_88116 ) ) ( not ( = ?auto_88114 ?auto_88117 ) ) ( not ( = ?auto_88114 ?auto_88118 ) ) ( not ( = ?auto_88114 ?auto_88119 ) ) ( not ( = ?auto_88115 ?auto_88116 ) ) ( not ( = ?auto_88115 ?auto_88117 ) ) ( not ( = ?auto_88115 ?auto_88118 ) ) ( not ( = ?auto_88115 ?auto_88119 ) ) ( not ( = ?auto_88116 ?auto_88117 ) ) ( not ( = ?auto_88116 ?auto_88118 ) ) ( not ( = ?auto_88116 ?auto_88119 ) ) ( not ( = ?auto_88117 ?auto_88118 ) ) ( not ( = ?auto_88117 ?auto_88119 ) ) ( not ( = ?auto_88118 ?auto_88119 ) ) ( CLEAR ?auto_88117 ) ( ON ?auto_88118 ?auto_88119 ) ( CLEAR ?auto_88118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_88110 ?auto_88111 ?auto_88112 ?auto_88113 ?auto_88114 ?auto_88115 ?auto_88116 ?auto_88117 ?auto_88118 )
      ( MAKE-10PILE ?auto_88110 ?auto_88111 ?auto_88112 ?auto_88113 ?auto_88114 ?auto_88115 ?auto_88116 ?auto_88117 ?auto_88118 ?auto_88119 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88130 - BLOCK
      ?auto_88131 - BLOCK
      ?auto_88132 - BLOCK
      ?auto_88133 - BLOCK
      ?auto_88134 - BLOCK
      ?auto_88135 - BLOCK
      ?auto_88136 - BLOCK
      ?auto_88137 - BLOCK
      ?auto_88138 - BLOCK
      ?auto_88139 - BLOCK
    )
    :vars
    (
      ?auto_88140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88139 ?auto_88140 ) ( ON-TABLE ?auto_88130 ) ( ON ?auto_88131 ?auto_88130 ) ( ON ?auto_88132 ?auto_88131 ) ( ON ?auto_88133 ?auto_88132 ) ( ON ?auto_88134 ?auto_88133 ) ( ON ?auto_88135 ?auto_88134 ) ( ON ?auto_88136 ?auto_88135 ) ( not ( = ?auto_88130 ?auto_88131 ) ) ( not ( = ?auto_88130 ?auto_88132 ) ) ( not ( = ?auto_88130 ?auto_88133 ) ) ( not ( = ?auto_88130 ?auto_88134 ) ) ( not ( = ?auto_88130 ?auto_88135 ) ) ( not ( = ?auto_88130 ?auto_88136 ) ) ( not ( = ?auto_88130 ?auto_88137 ) ) ( not ( = ?auto_88130 ?auto_88138 ) ) ( not ( = ?auto_88130 ?auto_88139 ) ) ( not ( = ?auto_88130 ?auto_88140 ) ) ( not ( = ?auto_88131 ?auto_88132 ) ) ( not ( = ?auto_88131 ?auto_88133 ) ) ( not ( = ?auto_88131 ?auto_88134 ) ) ( not ( = ?auto_88131 ?auto_88135 ) ) ( not ( = ?auto_88131 ?auto_88136 ) ) ( not ( = ?auto_88131 ?auto_88137 ) ) ( not ( = ?auto_88131 ?auto_88138 ) ) ( not ( = ?auto_88131 ?auto_88139 ) ) ( not ( = ?auto_88131 ?auto_88140 ) ) ( not ( = ?auto_88132 ?auto_88133 ) ) ( not ( = ?auto_88132 ?auto_88134 ) ) ( not ( = ?auto_88132 ?auto_88135 ) ) ( not ( = ?auto_88132 ?auto_88136 ) ) ( not ( = ?auto_88132 ?auto_88137 ) ) ( not ( = ?auto_88132 ?auto_88138 ) ) ( not ( = ?auto_88132 ?auto_88139 ) ) ( not ( = ?auto_88132 ?auto_88140 ) ) ( not ( = ?auto_88133 ?auto_88134 ) ) ( not ( = ?auto_88133 ?auto_88135 ) ) ( not ( = ?auto_88133 ?auto_88136 ) ) ( not ( = ?auto_88133 ?auto_88137 ) ) ( not ( = ?auto_88133 ?auto_88138 ) ) ( not ( = ?auto_88133 ?auto_88139 ) ) ( not ( = ?auto_88133 ?auto_88140 ) ) ( not ( = ?auto_88134 ?auto_88135 ) ) ( not ( = ?auto_88134 ?auto_88136 ) ) ( not ( = ?auto_88134 ?auto_88137 ) ) ( not ( = ?auto_88134 ?auto_88138 ) ) ( not ( = ?auto_88134 ?auto_88139 ) ) ( not ( = ?auto_88134 ?auto_88140 ) ) ( not ( = ?auto_88135 ?auto_88136 ) ) ( not ( = ?auto_88135 ?auto_88137 ) ) ( not ( = ?auto_88135 ?auto_88138 ) ) ( not ( = ?auto_88135 ?auto_88139 ) ) ( not ( = ?auto_88135 ?auto_88140 ) ) ( not ( = ?auto_88136 ?auto_88137 ) ) ( not ( = ?auto_88136 ?auto_88138 ) ) ( not ( = ?auto_88136 ?auto_88139 ) ) ( not ( = ?auto_88136 ?auto_88140 ) ) ( not ( = ?auto_88137 ?auto_88138 ) ) ( not ( = ?auto_88137 ?auto_88139 ) ) ( not ( = ?auto_88137 ?auto_88140 ) ) ( not ( = ?auto_88138 ?auto_88139 ) ) ( not ( = ?auto_88138 ?auto_88140 ) ) ( not ( = ?auto_88139 ?auto_88140 ) ) ( ON ?auto_88138 ?auto_88139 ) ( CLEAR ?auto_88136 ) ( ON ?auto_88137 ?auto_88138 ) ( CLEAR ?auto_88137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_88130 ?auto_88131 ?auto_88132 ?auto_88133 ?auto_88134 ?auto_88135 ?auto_88136 ?auto_88137 )
      ( MAKE-10PILE ?auto_88130 ?auto_88131 ?auto_88132 ?auto_88133 ?auto_88134 ?auto_88135 ?auto_88136 ?auto_88137 ?auto_88138 ?auto_88139 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88151 - BLOCK
      ?auto_88152 - BLOCK
      ?auto_88153 - BLOCK
      ?auto_88154 - BLOCK
      ?auto_88155 - BLOCK
      ?auto_88156 - BLOCK
      ?auto_88157 - BLOCK
      ?auto_88158 - BLOCK
      ?auto_88159 - BLOCK
      ?auto_88160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88160 ) ( ON-TABLE ?auto_88151 ) ( ON ?auto_88152 ?auto_88151 ) ( ON ?auto_88153 ?auto_88152 ) ( ON ?auto_88154 ?auto_88153 ) ( ON ?auto_88155 ?auto_88154 ) ( ON ?auto_88156 ?auto_88155 ) ( ON ?auto_88157 ?auto_88156 ) ( not ( = ?auto_88151 ?auto_88152 ) ) ( not ( = ?auto_88151 ?auto_88153 ) ) ( not ( = ?auto_88151 ?auto_88154 ) ) ( not ( = ?auto_88151 ?auto_88155 ) ) ( not ( = ?auto_88151 ?auto_88156 ) ) ( not ( = ?auto_88151 ?auto_88157 ) ) ( not ( = ?auto_88151 ?auto_88158 ) ) ( not ( = ?auto_88151 ?auto_88159 ) ) ( not ( = ?auto_88151 ?auto_88160 ) ) ( not ( = ?auto_88152 ?auto_88153 ) ) ( not ( = ?auto_88152 ?auto_88154 ) ) ( not ( = ?auto_88152 ?auto_88155 ) ) ( not ( = ?auto_88152 ?auto_88156 ) ) ( not ( = ?auto_88152 ?auto_88157 ) ) ( not ( = ?auto_88152 ?auto_88158 ) ) ( not ( = ?auto_88152 ?auto_88159 ) ) ( not ( = ?auto_88152 ?auto_88160 ) ) ( not ( = ?auto_88153 ?auto_88154 ) ) ( not ( = ?auto_88153 ?auto_88155 ) ) ( not ( = ?auto_88153 ?auto_88156 ) ) ( not ( = ?auto_88153 ?auto_88157 ) ) ( not ( = ?auto_88153 ?auto_88158 ) ) ( not ( = ?auto_88153 ?auto_88159 ) ) ( not ( = ?auto_88153 ?auto_88160 ) ) ( not ( = ?auto_88154 ?auto_88155 ) ) ( not ( = ?auto_88154 ?auto_88156 ) ) ( not ( = ?auto_88154 ?auto_88157 ) ) ( not ( = ?auto_88154 ?auto_88158 ) ) ( not ( = ?auto_88154 ?auto_88159 ) ) ( not ( = ?auto_88154 ?auto_88160 ) ) ( not ( = ?auto_88155 ?auto_88156 ) ) ( not ( = ?auto_88155 ?auto_88157 ) ) ( not ( = ?auto_88155 ?auto_88158 ) ) ( not ( = ?auto_88155 ?auto_88159 ) ) ( not ( = ?auto_88155 ?auto_88160 ) ) ( not ( = ?auto_88156 ?auto_88157 ) ) ( not ( = ?auto_88156 ?auto_88158 ) ) ( not ( = ?auto_88156 ?auto_88159 ) ) ( not ( = ?auto_88156 ?auto_88160 ) ) ( not ( = ?auto_88157 ?auto_88158 ) ) ( not ( = ?auto_88157 ?auto_88159 ) ) ( not ( = ?auto_88157 ?auto_88160 ) ) ( not ( = ?auto_88158 ?auto_88159 ) ) ( not ( = ?auto_88158 ?auto_88160 ) ) ( not ( = ?auto_88159 ?auto_88160 ) ) ( ON ?auto_88159 ?auto_88160 ) ( CLEAR ?auto_88157 ) ( ON ?auto_88158 ?auto_88159 ) ( CLEAR ?auto_88158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_88151 ?auto_88152 ?auto_88153 ?auto_88154 ?auto_88155 ?auto_88156 ?auto_88157 ?auto_88158 )
      ( MAKE-10PILE ?auto_88151 ?auto_88152 ?auto_88153 ?auto_88154 ?auto_88155 ?auto_88156 ?auto_88157 ?auto_88158 ?auto_88159 ?auto_88160 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88171 - BLOCK
      ?auto_88172 - BLOCK
      ?auto_88173 - BLOCK
      ?auto_88174 - BLOCK
      ?auto_88175 - BLOCK
      ?auto_88176 - BLOCK
      ?auto_88177 - BLOCK
      ?auto_88178 - BLOCK
      ?auto_88179 - BLOCK
      ?auto_88180 - BLOCK
    )
    :vars
    (
      ?auto_88181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88180 ?auto_88181 ) ( ON-TABLE ?auto_88171 ) ( ON ?auto_88172 ?auto_88171 ) ( ON ?auto_88173 ?auto_88172 ) ( ON ?auto_88174 ?auto_88173 ) ( ON ?auto_88175 ?auto_88174 ) ( ON ?auto_88176 ?auto_88175 ) ( not ( = ?auto_88171 ?auto_88172 ) ) ( not ( = ?auto_88171 ?auto_88173 ) ) ( not ( = ?auto_88171 ?auto_88174 ) ) ( not ( = ?auto_88171 ?auto_88175 ) ) ( not ( = ?auto_88171 ?auto_88176 ) ) ( not ( = ?auto_88171 ?auto_88177 ) ) ( not ( = ?auto_88171 ?auto_88178 ) ) ( not ( = ?auto_88171 ?auto_88179 ) ) ( not ( = ?auto_88171 ?auto_88180 ) ) ( not ( = ?auto_88171 ?auto_88181 ) ) ( not ( = ?auto_88172 ?auto_88173 ) ) ( not ( = ?auto_88172 ?auto_88174 ) ) ( not ( = ?auto_88172 ?auto_88175 ) ) ( not ( = ?auto_88172 ?auto_88176 ) ) ( not ( = ?auto_88172 ?auto_88177 ) ) ( not ( = ?auto_88172 ?auto_88178 ) ) ( not ( = ?auto_88172 ?auto_88179 ) ) ( not ( = ?auto_88172 ?auto_88180 ) ) ( not ( = ?auto_88172 ?auto_88181 ) ) ( not ( = ?auto_88173 ?auto_88174 ) ) ( not ( = ?auto_88173 ?auto_88175 ) ) ( not ( = ?auto_88173 ?auto_88176 ) ) ( not ( = ?auto_88173 ?auto_88177 ) ) ( not ( = ?auto_88173 ?auto_88178 ) ) ( not ( = ?auto_88173 ?auto_88179 ) ) ( not ( = ?auto_88173 ?auto_88180 ) ) ( not ( = ?auto_88173 ?auto_88181 ) ) ( not ( = ?auto_88174 ?auto_88175 ) ) ( not ( = ?auto_88174 ?auto_88176 ) ) ( not ( = ?auto_88174 ?auto_88177 ) ) ( not ( = ?auto_88174 ?auto_88178 ) ) ( not ( = ?auto_88174 ?auto_88179 ) ) ( not ( = ?auto_88174 ?auto_88180 ) ) ( not ( = ?auto_88174 ?auto_88181 ) ) ( not ( = ?auto_88175 ?auto_88176 ) ) ( not ( = ?auto_88175 ?auto_88177 ) ) ( not ( = ?auto_88175 ?auto_88178 ) ) ( not ( = ?auto_88175 ?auto_88179 ) ) ( not ( = ?auto_88175 ?auto_88180 ) ) ( not ( = ?auto_88175 ?auto_88181 ) ) ( not ( = ?auto_88176 ?auto_88177 ) ) ( not ( = ?auto_88176 ?auto_88178 ) ) ( not ( = ?auto_88176 ?auto_88179 ) ) ( not ( = ?auto_88176 ?auto_88180 ) ) ( not ( = ?auto_88176 ?auto_88181 ) ) ( not ( = ?auto_88177 ?auto_88178 ) ) ( not ( = ?auto_88177 ?auto_88179 ) ) ( not ( = ?auto_88177 ?auto_88180 ) ) ( not ( = ?auto_88177 ?auto_88181 ) ) ( not ( = ?auto_88178 ?auto_88179 ) ) ( not ( = ?auto_88178 ?auto_88180 ) ) ( not ( = ?auto_88178 ?auto_88181 ) ) ( not ( = ?auto_88179 ?auto_88180 ) ) ( not ( = ?auto_88179 ?auto_88181 ) ) ( not ( = ?auto_88180 ?auto_88181 ) ) ( ON ?auto_88179 ?auto_88180 ) ( ON ?auto_88178 ?auto_88179 ) ( CLEAR ?auto_88176 ) ( ON ?auto_88177 ?auto_88178 ) ( CLEAR ?auto_88177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88171 ?auto_88172 ?auto_88173 ?auto_88174 ?auto_88175 ?auto_88176 ?auto_88177 )
      ( MAKE-10PILE ?auto_88171 ?auto_88172 ?auto_88173 ?auto_88174 ?auto_88175 ?auto_88176 ?auto_88177 ?auto_88178 ?auto_88179 ?auto_88180 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88192 - BLOCK
      ?auto_88193 - BLOCK
      ?auto_88194 - BLOCK
      ?auto_88195 - BLOCK
      ?auto_88196 - BLOCK
      ?auto_88197 - BLOCK
      ?auto_88198 - BLOCK
      ?auto_88199 - BLOCK
      ?auto_88200 - BLOCK
      ?auto_88201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88201 ) ( ON-TABLE ?auto_88192 ) ( ON ?auto_88193 ?auto_88192 ) ( ON ?auto_88194 ?auto_88193 ) ( ON ?auto_88195 ?auto_88194 ) ( ON ?auto_88196 ?auto_88195 ) ( ON ?auto_88197 ?auto_88196 ) ( not ( = ?auto_88192 ?auto_88193 ) ) ( not ( = ?auto_88192 ?auto_88194 ) ) ( not ( = ?auto_88192 ?auto_88195 ) ) ( not ( = ?auto_88192 ?auto_88196 ) ) ( not ( = ?auto_88192 ?auto_88197 ) ) ( not ( = ?auto_88192 ?auto_88198 ) ) ( not ( = ?auto_88192 ?auto_88199 ) ) ( not ( = ?auto_88192 ?auto_88200 ) ) ( not ( = ?auto_88192 ?auto_88201 ) ) ( not ( = ?auto_88193 ?auto_88194 ) ) ( not ( = ?auto_88193 ?auto_88195 ) ) ( not ( = ?auto_88193 ?auto_88196 ) ) ( not ( = ?auto_88193 ?auto_88197 ) ) ( not ( = ?auto_88193 ?auto_88198 ) ) ( not ( = ?auto_88193 ?auto_88199 ) ) ( not ( = ?auto_88193 ?auto_88200 ) ) ( not ( = ?auto_88193 ?auto_88201 ) ) ( not ( = ?auto_88194 ?auto_88195 ) ) ( not ( = ?auto_88194 ?auto_88196 ) ) ( not ( = ?auto_88194 ?auto_88197 ) ) ( not ( = ?auto_88194 ?auto_88198 ) ) ( not ( = ?auto_88194 ?auto_88199 ) ) ( not ( = ?auto_88194 ?auto_88200 ) ) ( not ( = ?auto_88194 ?auto_88201 ) ) ( not ( = ?auto_88195 ?auto_88196 ) ) ( not ( = ?auto_88195 ?auto_88197 ) ) ( not ( = ?auto_88195 ?auto_88198 ) ) ( not ( = ?auto_88195 ?auto_88199 ) ) ( not ( = ?auto_88195 ?auto_88200 ) ) ( not ( = ?auto_88195 ?auto_88201 ) ) ( not ( = ?auto_88196 ?auto_88197 ) ) ( not ( = ?auto_88196 ?auto_88198 ) ) ( not ( = ?auto_88196 ?auto_88199 ) ) ( not ( = ?auto_88196 ?auto_88200 ) ) ( not ( = ?auto_88196 ?auto_88201 ) ) ( not ( = ?auto_88197 ?auto_88198 ) ) ( not ( = ?auto_88197 ?auto_88199 ) ) ( not ( = ?auto_88197 ?auto_88200 ) ) ( not ( = ?auto_88197 ?auto_88201 ) ) ( not ( = ?auto_88198 ?auto_88199 ) ) ( not ( = ?auto_88198 ?auto_88200 ) ) ( not ( = ?auto_88198 ?auto_88201 ) ) ( not ( = ?auto_88199 ?auto_88200 ) ) ( not ( = ?auto_88199 ?auto_88201 ) ) ( not ( = ?auto_88200 ?auto_88201 ) ) ( ON ?auto_88200 ?auto_88201 ) ( ON ?auto_88199 ?auto_88200 ) ( CLEAR ?auto_88197 ) ( ON ?auto_88198 ?auto_88199 ) ( CLEAR ?auto_88198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_88192 ?auto_88193 ?auto_88194 ?auto_88195 ?auto_88196 ?auto_88197 ?auto_88198 )
      ( MAKE-10PILE ?auto_88192 ?auto_88193 ?auto_88194 ?auto_88195 ?auto_88196 ?auto_88197 ?auto_88198 ?auto_88199 ?auto_88200 ?auto_88201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88212 - BLOCK
      ?auto_88213 - BLOCK
      ?auto_88214 - BLOCK
      ?auto_88215 - BLOCK
      ?auto_88216 - BLOCK
      ?auto_88217 - BLOCK
      ?auto_88218 - BLOCK
      ?auto_88219 - BLOCK
      ?auto_88220 - BLOCK
      ?auto_88221 - BLOCK
    )
    :vars
    (
      ?auto_88222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88221 ?auto_88222 ) ( ON-TABLE ?auto_88212 ) ( ON ?auto_88213 ?auto_88212 ) ( ON ?auto_88214 ?auto_88213 ) ( ON ?auto_88215 ?auto_88214 ) ( ON ?auto_88216 ?auto_88215 ) ( not ( = ?auto_88212 ?auto_88213 ) ) ( not ( = ?auto_88212 ?auto_88214 ) ) ( not ( = ?auto_88212 ?auto_88215 ) ) ( not ( = ?auto_88212 ?auto_88216 ) ) ( not ( = ?auto_88212 ?auto_88217 ) ) ( not ( = ?auto_88212 ?auto_88218 ) ) ( not ( = ?auto_88212 ?auto_88219 ) ) ( not ( = ?auto_88212 ?auto_88220 ) ) ( not ( = ?auto_88212 ?auto_88221 ) ) ( not ( = ?auto_88212 ?auto_88222 ) ) ( not ( = ?auto_88213 ?auto_88214 ) ) ( not ( = ?auto_88213 ?auto_88215 ) ) ( not ( = ?auto_88213 ?auto_88216 ) ) ( not ( = ?auto_88213 ?auto_88217 ) ) ( not ( = ?auto_88213 ?auto_88218 ) ) ( not ( = ?auto_88213 ?auto_88219 ) ) ( not ( = ?auto_88213 ?auto_88220 ) ) ( not ( = ?auto_88213 ?auto_88221 ) ) ( not ( = ?auto_88213 ?auto_88222 ) ) ( not ( = ?auto_88214 ?auto_88215 ) ) ( not ( = ?auto_88214 ?auto_88216 ) ) ( not ( = ?auto_88214 ?auto_88217 ) ) ( not ( = ?auto_88214 ?auto_88218 ) ) ( not ( = ?auto_88214 ?auto_88219 ) ) ( not ( = ?auto_88214 ?auto_88220 ) ) ( not ( = ?auto_88214 ?auto_88221 ) ) ( not ( = ?auto_88214 ?auto_88222 ) ) ( not ( = ?auto_88215 ?auto_88216 ) ) ( not ( = ?auto_88215 ?auto_88217 ) ) ( not ( = ?auto_88215 ?auto_88218 ) ) ( not ( = ?auto_88215 ?auto_88219 ) ) ( not ( = ?auto_88215 ?auto_88220 ) ) ( not ( = ?auto_88215 ?auto_88221 ) ) ( not ( = ?auto_88215 ?auto_88222 ) ) ( not ( = ?auto_88216 ?auto_88217 ) ) ( not ( = ?auto_88216 ?auto_88218 ) ) ( not ( = ?auto_88216 ?auto_88219 ) ) ( not ( = ?auto_88216 ?auto_88220 ) ) ( not ( = ?auto_88216 ?auto_88221 ) ) ( not ( = ?auto_88216 ?auto_88222 ) ) ( not ( = ?auto_88217 ?auto_88218 ) ) ( not ( = ?auto_88217 ?auto_88219 ) ) ( not ( = ?auto_88217 ?auto_88220 ) ) ( not ( = ?auto_88217 ?auto_88221 ) ) ( not ( = ?auto_88217 ?auto_88222 ) ) ( not ( = ?auto_88218 ?auto_88219 ) ) ( not ( = ?auto_88218 ?auto_88220 ) ) ( not ( = ?auto_88218 ?auto_88221 ) ) ( not ( = ?auto_88218 ?auto_88222 ) ) ( not ( = ?auto_88219 ?auto_88220 ) ) ( not ( = ?auto_88219 ?auto_88221 ) ) ( not ( = ?auto_88219 ?auto_88222 ) ) ( not ( = ?auto_88220 ?auto_88221 ) ) ( not ( = ?auto_88220 ?auto_88222 ) ) ( not ( = ?auto_88221 ?auto_88222 ) ) ( ON ?auto_88220 ?auto_88221 ) ( ON ?auto_88219 ?auto_88220 ) ( ON ?auto_88218 ?auto_88219 ) ( CLEAR ?auto_88216 ) ( ON ?auto_88217 ?auto_88218 ) ( CLEAR ?auto_88217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88212 ?auto_88213 ?auto_88214 ?auto_88215 ?auto_88216 ?auto_88217 )
      ( MAKE-10PILE ?auto_88212 ?auto_88213 ?auto_88214 ?auto_88215 ?auto_88216 ?auto_88217 ?auto_88218 ?auto_88219 ?auto_88220 ?auto_88221 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88233 - BLOCK
      ?auto_88234 - BLOCK
      ?auto_88235 - BLOCK
      ?auto_88236 - BLOCK
      ?auto_88237 - BLOCK
      ?auto_88238 - BLOCK
      ?auto_88239 - BLOCK
      ?auto_88240 - BLOCK
      ?auto_88241 - BLOCK
      ?auto_88242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88242 ) ( ON-TABLE ?auto_88233 ) ( ON ?auto_88234 ?auto_88233 ) ( ON ?auto_88235 ?auto_88234 ) ( ON ?auto_88236 ?auto_88235 ) ( ON ?auto_88237 ?auto_88236 ) ( not ( = ?auto_88233 ?auto_88234 ) ) ( not ( = ?auto_88233 ?auto_88235 ) ) ( not ( = ?auto_88233 ?auto_88236 ) ) ( not ( = ?auto_88233 ?auto_88237 ) ) ( not ( = ?auto_88233 ?auto_88238 ) ) ( not ( = ?auto_88233 ?auto_88239 ) ) ( not ( = ?auto_88233 ?auto_88240 ) ) ( not ( = ?auto_88233 ?auto_88241 ) ) ( not ( = ?auto_88233 ?auto_88242 ) ) ( not ( = ?auto_88234 ?auto_88235 ) ) ( not ( = ?auto_88234 ?auto_88236 ) ) ( not ( = ?auto_88234 ?auto_88237 ) ) ( not ( = ?auto_88234 ?auto_88238 ) ) ( not ( = ?auto_88234 ?auto_88239 ) ) ( not ( = ?auto_88234 ?auto_88240 ) ) ( not ( = ?auto_88234 ?auto_88241 ) ) ( not ( = ?auto_88234 ?auto_88242 ) ) ( not ( = ?auto_88235 ?auto_88236 ) ) ( not ( = ?auto_88235 ?auto_88237 ) ) ( not ( = ?auto_88235 ?auto_88238 ) ) ( not ( = ?auto_88235 ?auto_88239 ) ) ( not ( = ?auto_88235 ?auto_88240 ) ) ( not ( = ?auto_88235 ?auto_88241 ) ) ( not ( = ?auto_88235 ?auto_88242 ) ) ( not ( = ?auto_88236 ?auto_88237 ) ) ( not ( = ?auto_88236 ?auto_88238 ) ) ( not ( = ?auto_88236 ?auto_88239 ) ) ( not ( = ?auto_88236 ?auto_88240 ) ) ( not ( = ?auto_88236 ?auto_88241 ) ) ( not ( = ?auto_88236 ?auto_88242 ) ) ( not ( = ?auto_88237 ?auto_88238 ) ) ( not ( = ?auto_88237 ?auto_88239 ) ) ( not ( = ?auto_88237 ?auto_88240 ) ) ( not ( = ?auto_88237 ?auto_88241 ) ) ( not ( = ?auto_88237 ?auto_88242 ) ) ( not ( = ?auto_88238 ?auto_88239 ) ) ( not ( = ?auto_88238 ?auto_88240 ) ) ( not ( = ?auto_88238 ?auto_88241 ) ) ( not ( = ?auto_88238 ?auto_88242 ) ) ( not ( = ?auto_88239 ?auto_88240 ) ) ( not ( = ?auto_88239 ?auto_88241 ) ) ( not ( = ?auto_88239 ?auto_88242 ) ) ( not ( = ?auto_88240 ?auto_88241 ) ) ( not ( = ?auto_88240 ?auto_88242 ) ) ( not ( = ?auto_88241 ?auto_88242 ) ) ( ON ?auto_88241 ?auto_88242 ) ( ON ?auto_88240 ?auto_88241 ) ( ON ?auto_88239 ?auto_88240 ) ( CLEAR ?auto_88237 ) ( ON ?auto_88238 ?auto_88239 ) ( CLEAR ?auto_88238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_88233 ?auto_88234 ?auto_88235 ?auto_88236 ?auto_88237 ?auto_88238 )
      ( MAKE-10PILE ?auto_88233 ?auto_88234 ?auto_88235 ?auto_88236 ?auto_88237 ?auto_88238 ?auto_88239 ?auto_88240 ?auto_88241 ?auto_88242 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88253 - BLOCK
      ?auto_88254 - BLOCK
      ?auto_88255 - BLOCK
      ?auto_88256 - BLOCK
      ?auto_88257 - BLOCK
      ?auto_88258 - BLOCK
      ?auto_88259 - BLOCK
      ?auto_88260 - BLOCK
      ?auto_88261 - BLOCK
      ?auto_88262 - BLOCK
    )
    :vars
    (
      ?auto_88263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88262 ?auto_88263 ) ( ON-TABLE ?auto_88253 ) ( ON ?auto_88254 ?auto_88253 ) ( ON ?auto_88255 ?auto_88254 ) ( ON ?auto_88256 ?auto_88255 ) ( not ( = ?auto_88253 ?auto_88254 ) ) ( not ( = ?auto_88253 ?auto_88255 ) ) ( not ( = ?auto_88253 ?auto_88256 ) ) ( not ( = ?auto_88253 ?auto_88257 ) ) ( not ( = ?auto_88253 ?auto_88258 ) ) ( not ( = ?auto_88253 ?auto_88259 ) ) ( not ( = ?auto_88253 ?auto_88260 ) ) ( not ( = ?auto_88253 ?auto_88261 ) ) ( not ( = ?auto_88253 ?auto_88262 ) ) ( not ( = ?auto_88253 ?auto_88263 ) ) ( not ( = ?auto_88254 ?auto_88255 ) ) ( not ( = ?auto_88254 ?auto_88256 ) ) ( not ( = ?auto_88254 ?auto_88257 ) ) ( not ( = ?auto_88254 ?auto_88258 ) ) ( not ( = ?auto_88254 ?auto_88259 ) ) ( not ( = ?auto_88254 ?auto_88260 ) ) ( not ( = ?auto_88254 ?auto_88261 ) ) ( not ( = ?auto_88254 ?auto_88262 ) ) ( not ( = ?auto_88254 ?auto_88263 ) ) ( not ( = ?auto_88255 ?auto_88256 ) ) ( not ( = ?auto_88255 ?auto_88257 ) ) ( not ( = ?auto_88255 ?auto_88258 ) ) ( not ( = ?auto_88255 ?auto_88259 ) ) ( not ( = ?auto_88255 ?auto_88260 ) ) ( not ( = ?auto_88255 ?auto_88261 ) ) ( not ( = ?auto_88255 ?auto_88262 ) ) ( not ( = ?auto_88255 ?auto_88263 ) ) ( not ( = ?auto_88256 ?auto_88257 ) ) ( not ( = ?auto_88256 ?auto_88258 ) ) ( not ( = ?auto_88256 ?auto_88259 ) ) ( not ( = ?auto_88256 ?auto_88260 ) ) ( not ( = ?auto_88256 ?auto_88261 ) ) ( not ( = ?auto_88256 ?auto_88262 ) ) ( not ( = ?auto_88256 ?auto_88263 ) ) ( not ( = ?auto_88257 ?auto_88258 ) ) ( not ( = ?auto_88257 ?auto_88259 ) ) ( not ( = ?auto_88257 ?auto_88260 ) ) ( not ( = ?auto_88257 ?auto_88261 ) ) ( not ( = ?auto_88257 ?auto_88262 ) ) ( not ( = ?auto_88257 ?auto_88263 ) ) ( not ( = ?auto_88258 ?auto_88259 ) ) ( not ( = ?auto_88258 ?auto_88260 ) ) ( not ( = ?auto_88258 ?auto_88261 ) ) ( not ( = ?auto_88258 ?auto_88262 ) ) ( not ( = ?auto_88258 ?auto_88263 ) ) ( not ( = ?auto_88259 ?auto_88260 ) ) ( not ( = ?auto_88259 ?auto_88261 ) ) ( not ( = ?auto_88259 ?auto_88262 ) ) ( not ( = ?auto_88259 ?auto_88263 ) ) ( not ( = ?auto_88260 ?auto_88261 ) ) ( not ( = ?auto_88260 ?auto_88262 ) ) ( not ( = ?auto_88260 ?auto_88263 ) ) ( not ( = ?auto_88261 ?auto_88262 ) ) ( not ( = ?auto_88261 ?auto_88263 ) ) ( not ( = ?auto_88262 ?auto_88263 ) ) ( ON ?auto_88261 ?auto_88262 ) ( ON ?auto_88260 ?auto_88261 ) ( ON ?auto_88259 ?auto_88260 ) ( ON ?auto_88258 ?auto_88259 ) ( CLEAR ?auto_88256 ) ( ON ?auto_88257 ?auto_88258 ) ( CLEAR ?auto_88257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88253 ?auto_88254 ?auto_88255 ?auto_88256 ?auto_88257 )
      ( MAKE-10PILE ?auto_88253 ?auto_88254 ?auto_88255 ?auto_88256 ?auto_88257 ?auto_88258 ?auto_88259 ?auto_88260 ?auto_88261 ?auto_88262 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88274 - BLOCK
      ?auto_88275 - BLOCK
      ?auto_88276 - BLOCK
      ?auto_88277 - BLOCK
      ?auto_88278 - BLOCK
      ?auto_88279 - BLOCK
      ?auto_88280 - BLOCK
      ?auto_88281 - BLOCK
      ?auto_88282 - BLOCK
      ?auto_88283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88283 ) ( ON-TABLE ?auto_88274 ) ( ON ?auto_88275 ?auto_88274 ) ( ON ?auto_88276 ?auto_88275 ) ( ON ?auto_88277 ?auto_88276 ) ( not ( = ?auto_88274 ?auto_88275 ) ) ( not ( = ?auto_88274 ?auto_88276 ) ) ( not ( = ?auto_88274 ?auto_88277 ) ) ( not ( = ?auto_88274 ?auto_88278 ) ) ( not ( = ?auto_88274 ?auto_88279 ) ) ( not ( = ?auto_88274 ?auto_88280 ) ) ( not ( = ?auto_88274 ?auto_88281 ) ) ( not ( = ?auto_88274 ?auto_88282 ) ) ( not ( = ?auto_88274 ?auto_88283 ) ) ( not ( = ?auto_88275 ?auto_88276 ) ) ( not ( = ?auto_88275 ?auto_88277 ) ) ( not ( = ?auto_88275 ?auto_88278 ) ) ( not ( = ?auto_88275 ?auto_88279 ) ) ( not ( = ?auto_88275 ?auto_88280 ) ) ( not ( = ?auto_88275 ?auto_88281 ) ) ( not ( = ?auto_88275 ?auto_88282 ) ) ( not ( = ?auto_88275 ?auto_88283 ) ) ( not ( = ?auto_88276 ?auto_88277 ) ) ( not ( = ?auto_88276 ?auto_88278 ) ) ( not ( = ?auto_88276 ?auto_88279 ) ) ( not ( = ?auto_88276 ?auto_88280 ) ) ( not ( = ?auto_88276 ?auto_88281 ) ) ( not ( = ?auto_88276 ?auto_88282 ) ) ( not ( = ?auto_88276 ?auto_88283 ) ) ( not ( = ?auto_88277 ?auto_88278 ) ) ( not ( = ?auto_88277 ?auto_88279 ) ) ( not ( = ?auto_88277 ?auto_88280 ) ) ( not ( = ?auto_88277 ?auto_88281 ) ) ( not ( = ?auto_88277 ?auto_88282 ) ) ( not ( = ?auto_88277 ?auto_88283 ) ) ( not ( = ?auto_88278 ?auto_88279 ) ) ( not ( = ?auto_88278 ?auto_88280 ) ) ( not ( = ?auto_88278 ?auto_88281 ) ) ( not ( = ?auto_88278 ?auto_88282 ) ) ( not ( = ?auto_88278 ?auto_88283 ) ) ( not ( = ?auto_88279 ?auto_88280 ) ) ( not ( = ?auto_88279 ?auto_88281 ) ) ( not ( = ?auto_88279 ?auto_88282 ) ) ( not ( = ?auto_88279 ?auto_88283 ) ) ( not ( = ?auto_88280 ?auto_88281 ) ) ( not ( = ?auto_88280 ?auto_88282 ) ) ( not ( = ?auto_88280 ?auto_88283 ) ) ( not ( = ?auto_88281 ?auto_88282 ) ) ( not ( = ?auto_88281 ?auto_88283 ) ) ( not ( = ?auto_88282 ?auto_88283 ) ) ( ON ?auto_88282 ?auto_88283 ) ( ON ?auto_88281 ?auto_88282 ) ( ON ?auto_88280 ?auto_88281 ) ( ON ?auto_88279 ?auto_88280 ) ( CLEAR ?auto_88277 ) ( ON ?auto_88278 ?auto_88279 ) ( CLEAR ?auto_88278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_88274 ?auto_88275 ?auto_88276 ?auto_88277 ?auto_88278 )
      ( MAKE-10PILE ?auto_88274 ?auto_88275 ?auto_88276 ?auto_88277 ?auto_88278 ?auto_88279 ?auto_88280 ?auto_88281 ?auto_88282 ?auto_88283 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88294 - BLOCK
      ?auto_88295 - BLOCK
      ?auto_88296 - BLOCK
      ?auto_88297 - BLOCK
      ?auto_88298 - BLOCK
      ?auto_88299 - BLOCK
      ?auto_88300 - BLOCK
      ?auto_88301 - BLOCK
      ?auto_88302 - BLOCK
      ?auto_88303 - BLOCK
    )
    :vars
    (
      ?auto_88304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88303 ?auto_88304 ) ( ON-TABLE ?auto_88294 ) ( ON ?auto_88295 ?auto_88294 ) ( ON ?auto_88296 ?auto_88295 ) ( not ( = ?auto_88294 ?auto_88295 ) ) ( not ( = ?auto_88294 ?auto_88296 ) ) ( not ( = ?auto_88294 ?auto_88297 ) ) ( not ( = ?auto_88294 ?auto_88298 ) ) ( not ( = ?auto_88294 ?auto_88299 ) ) ( not ( = ?auto_88294 ?auto_88300 ) ) ( not ( = ?auto_88294 ?auto_88301 ) ) ( not ( = ?auto_88294 ?auto_88302 ) ) ( not ( = ?auto_88294 ?auto_88303 ) ) ( not ( = ?auto_88294 ?auto_88304 ) ) ( not ( = ?auto_88295 ?auto_88296 ) ) ( not ( = ?auto_88295 ?auto_88297 ) ) ( not ( = ?auto_88295 ?auto_88298 ) ) ( not ( = ?auto_88295 ?auto_88299 ) ) ( not ( = ?auto_88295 ?auto_88300 ) ) ( not ( = ?auto_88295 ?auto_88301 ) ) ( not ( = ?auto_88295 ?auto_88302 ) ) ( not ( = ?auto_88295 ?auto_88303 ) ) ( not ( = ?auto_88295 ?auto_88304 ) ) ( not ( = ?auto_88296 ?auto_88297 ) ) ( not ( = ?auto_88296 ?auto_88298 ) ) ( not ( = ?auto_88296 ?auto_88299 ) ) ( not ( = ?auto_88296 ?auto_88300 ) ) ( not ( = ?auto_88296 ?auto_88301 ) ) ( not ( = ?auto_88296 ?auto_88302 ) ) ( not ( = ?auto_88296 ?auto_88303 ) ) ( not ( = ?auto_88296 ?auto_88304 ) ) ( not ( = ?auto_88297 ?auto_88298 ) ) ( not ( = ?auto_88297 ?auto_88299 ) ) ( not ( = ?auto_88297 ?auto_88300 ) ) ( not ( = ?auto_88297 ?auto_88301 ) ) ( not ( = ?auto_88297 ?auto_88302 ) ) ( not ( = ?auto_88297 ?auto_88303 ) ) ( not ( = ?auto_88297 ?auto_88304 ) ) ( not ( = ?auto_88298 ?auto_88299 ) ) ( not ( = ?auto_88298 ?auto_88300 ) ) ( not ( = ?auto_88298 ?auto_88301 ) ) ( not ( = ?auto_88298 ?auto_88302 ) ) ( not ( = ?auto_88298 ?auto_88303 ) ) ( not ( = ?auto_88298 ?auto_88304 ) ) ( not ( = ?auto_88299 ?auto_88300 ) ) ( not ( = ?auto_88299 ?auto_88301 ) ) ( not ( = ?auto_88299 ?auto_88302 ) ) ( not ( = ?auto_88299 ?auto_88303 ) ) ( not ( = ?auto_88299 ?auto_88304 ) ) ( not ( = ?auto_88300 ?auto_88301 ) ) ( not ( = ?auto_88300 ?auto_88302 ) ) ( not ( = ?auto_88300 ?auto_88303 ) ) ( not ( = ?auto_88300 ?auto_88304 ) ) ( not ( = ?auto_88301 ?auto_88302 ) ) ( not ( = ?auto_88301 ?auto_88303 ) ) ( not ( = ?auto_88301 ?auto_88304 ) ) ( not ( = ?auto_88302 ?auto_88303 ) ) ( not ( = ?auto_88302 ?auto_88304 ) ) ( not ( = ?auto_88303 ?auto_88304 ) ) ( ON ?auto_88302 ?auto_88303 ) ( ON ?auto_88301 ?auto_88302 ) ( ON ?auto_88300 ?auto_88301 ) ( ON ?auto_88299 ?auto_88300 ) ( ON ?auto_88298 ?auto_88299 ) ( CLEAR ?auto_88296 ) ( ON ?auto_88297 ?auto_88298 ) ( CLEAR ?auto_88297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88294 ?auto_88295 ?auto_88296 ?auto_88297 )
      ( MAKE-10PILE ?auto_88294 ?auto_88295 ?auto_88296 ?auto_88297 ?auto_88298 ?auto_88299 ?auto_88300 ?auto_88301 ?auto_88302 ?auto_88303 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88315 - BLOCK
      ?auto_88316 - BLOCK
      ?auto_88317 - BLOCK
      ?auto_88318 - BLOCK
      ?auto_88319 - BLOCK
      ?auto_88320 - BLOCK
      ?auto_88321 - BLOCK
      ?auto_88322 - BLOCK
      ?auto_88323 - BLOCK
      ?auto_88324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88324 ) ( ON-TABLE ?auto_88315 ) ( ON ?auto_88316 ?auto_88315 ) ( ON ?auto_88317 ?auto_88316 ) ( not ( = ?auto_88315 ?auto_88316 ) ) ( not ( = ?auto_88315 ?auto_88317 ) ) ( not ( = ?auto_88315 ?auto_88318 ) ) ( not ( = ?auto_88315 ?auto_88319 ) ) ( not ( = ?auto_88315 ?auto_88320 ) ) ( not ( = ?auto_88315 ?auto_88321 ) ) ( not ( = ?auto_88315 ?auto_88322 ) ) ( not ( = ?auto_88315 ?auto_88323 ) ) ( not ( = ?auto_88315 ?auto_88324 ) ) ( not ( = ?auto_88316 ?auto_88317 ) ) ( not ( = ?auto_88316 ?auto_88318 ) ) ( not ( = ?auto_88316 ?auto_88319 ) ) ( not ( = ?auto_88316 ?auto_88320 ) ) ( not ( = ?auto_88316 ?auto_88321 ) ) ( not ( = ?auto_88316 ?auto_88322 ) ) ( not ( = ?auto_88316 ?auto_88323 ) ) ( not ( = ?auto_88316 ?auto_88324 ) ) ( not ( = ?auto_88317 ?auto_88318 ) ) ( not ( = ?auto_88317 ?auto_88319 ) ) ( not ( = ?auto_88317 ?auto_88320 ) ) ( not ( = ?auto_88317 ?auto_88321 ) ) ( not ( = ?auto_88317 ?auto_88322 ) ) ( not ( = ?auto_88317 ?auto_88323 ) ) ( not ( = ?auto_88317 ?auto_88324 ) ) ( not ( = ?auto_88318 ?auto_88319 ) ) ( not ( = ?auto_88318 ?auto_88320 ) ) ( not ( = ?auto_88318 ?auto_88321 ) ) ( not ( = ?auto_88318 ?auto_88322 ) ) ( not ( = ?auto_88318 ?auto_88323 ) ) ( not ( = ?auto_88318 ?auto_88324 ) ) ( not ( = ?auto_88319 ?auto_88320 ) ) ( not ( = ?auto_88319 ?auto_88321 ) ) ( not ( = ?auto_88319 ?auto_88322 ) ) ( not ( = ?auto_88319 ?auto_88323 ) ) ( not ( = ?auto_88319 ?auto_88324 ) ) ( not ( = ?auto_88320 ?auto_88321 ) ) ( not ( = ?auto_88320 ?auto_88322 ) ) ( not ( = ?auto_88320 ?auto_88323 ) ) ( not ( = ?auto_88320 ?auto_88324 ) ) ( not ( = ?auto_88321 ?auto_88322 ) ) ( not ( = ?auto_88321 ?auto_88323 ) ) ( not ( = ?auto_88321 ?auto_88324 ) ) ( not ( = ?auto_88322 ?auto_88323 ) ) ( not ( = ?auto_88322 ?auto_88324 ) ) ( not ( = ?auto_88323 ?auto_88324 ) ) ( ON ?auto_88323 ?auto_88324 ) ( ON ?auto_88322 ?auto_88323 ) ( ON ?auto_88321 ?auto_88322 ) ( ON ?auto_88320 ?auto_88321 ) ( ON ?auto_88319 ?auto_88320 ) ( CLEAR ?auto_88317 ) ( ON ?auto_88318 ?auto_88319 ) ( CLEAR ?auto_88318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_88315 ?auto_88316 ?auto_88317 ?auto_88318 )
      ( MAKE-10PILE ?auto_88315 ?auto_88316 ?auto_88317 ?auto_88318 ?auto_88319 ?auto_88320 ?auto_88321 ?auto_88322 ?auto_88323 ?auto_88324 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88335 - BLOCK
      ?auto_88336 - BLOCK
      ?auto_88337 - BLOCK
      ?auto_88338 - BLOCK
      ?auto_88339 - BLOCK
      ?auto_88340 - BLOCK
      ?auto_88341 - BLOCK
      ?auto_88342 - BLOCK
      ?auto_88343 - BLOCK
      ?auto_88344 - BLOCK
    )
    :vars
    (
      ?auto_88345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88344 ?auto_88345 ) ( ON-TABLE ?auto_88335 ) ( ON ?auto_88336 ?auto_88335 ) ( not ( = ?auto_88335 ?auto_88336 ) ) ( not ( = ?auto_88335 ?auto_88337 ) ) ( not ( = ?auto_88335 ?auto_88338 ) ) ( not ( = ?auto_88335 ?auto_88339 ) ) ( not ( = ?auto_88335 ?auto_88340 ) ) ( not ( = ?auto_88335 ?auto_88341 ) ) ( not ( = ?auto_88335 ?auto_88342 ) ) ( not ( = ?auto_88335 ?auto_88343 ) ) ( not ( = ?auto_88335 ?auto_88344 ) ) ( not ( = ?auto_88335 ?auto_88345 ) ) ( not ( = ?auto_88336 ?auto_88337 ) ) ( not ( = ?auto_88336 ?auto_88338 ) ) ( not ( = ?auto_88336 ?auto_88339 ) ) ( not ( = ?auto_88336 ?auto_88340 ) ) ( not ( = ?auto_88336 ?auto_88341 ) ) ( not ( = ?auto_88336 ?auto_88342 ) ) ( not ( = ?auto_88336 ?auto_88343 ) ) ( not ( = ?auto_88336 ?auto_88344 ) ) ( not ( = ?auto_88336 ?auto_88345 ) ) ( not ( = ?auto_88337 ?auto_88338 ) ) ( not ( = ?auto_88337 ?auto_88339 ) ) ( not ( = ?auto_88337 ?auto_88340 ) ) ( not ( = ?auto_88337 ?auto_88341 ) ) ( not ( = ?auto_88337 ?auto_88342 ) ) ( not ( = ?auto_88337 ?auto_88343 ) ) ( not ( = ?auto_88337 ?auto_88344 ) ) ( not ( = ?auto_88337 ?auto_88345 ) ) ( not ( = ?auto_88338 ?auto_88339 ) ) ( not ( = ?auto_88338 ?auto_88340 ) ) ( not ( = ?auto_88338 ?auto_88341 ) ) ( not ( = ?auto_88338 ?auto_88342 ) ) ( not ( = ?auto_88338 ?auto_88343 ) ) ( not ( = ?auto_88338 ?auto_88344 ) ) ( not ( = ?auto_88338 ?auto_88345 ) ) ( not ( = ?auto_88339 ?auto_88340 ) ) ( not ( = ?auto_88339 ?auto_88341 ) ) ( not ( = ?auto_88339 ?auto_88342 ) ) ( not ( = ?auto_88339 ?auto_88343 ) ) ( not ( = ?auto_88339 ?auto_88344 ) ) ( not ( = ?auto_88339 ?auto_88345 ) ) ( not ( = ?auto_88340 ?auto_88341 ) ) ( not ( = ?auto_88340 ?auto_88342 ) ) ( not ( = ?auto_88340 ?auto_88343 ) ) ( not ( = ?auto_88340 ?auto_88344 ) ) ( not ( = ?auto_88340 ?auto_88345 ) ) ( not ( = ?auto_88341 ?auto_88342 ) ) ( not ( = ?auto_88341 ?auto_88343 ) ) ( not ( = ?auto_88341 ?auto_88344 ) ) ( not ( = ?auto_88341 ?auto_88345 ) ) ( not ( = ?auto_88342 ?auto_88343 ) ) ( not ( = ?auto_88342 ?auto_88344 ) ) ( not ( = ?auto_88342 ?auto_88345 ) ) ( not ( = ?auto_88343 ?auto_88344 ) ) ( not ( = ?auto_88343 ?auto_88345 ) ) ( not ( = ?auto_88344 ?auto_88345 ) ) ( ON ?auto_88343 ?auto_88344 ) ( ON ?auto_88342 ?auto_88343 ) ( ON ?auto_88341 ?auto_88342 ) ( ON ?auto_88340 ?auto_88341 ) ( ON ?auto_88339 ?auto_88340 ) ( ON ?auto_88338 ?auto_88339 ) ( CLEAR ?auto_88336 ) ( ON ?auto_88337 ?auto_88338 ) ( CLEAR ?auto_88337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88335 ?auto_88336 ?auto_88337 )
      ( MAKE-10PILE ?auto_88335 ?auto_88336 ?auto_88337 ?auto_88338 ?auto_88339 ?auto_88340 ?auto_88341 ?auto_88342 ?auto_88343 ?auto_88344 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88356 - BLOCK
      ?auto_88357 - BLOCK
      ?auto_88358 - BLOCK
      ?auto_88359 - BLOCK
      ?auto_88360 - BLOCK
      ?auto_88361 - BLOCK
      ?auto_88362 - BLOCK
      ?auto_88363 - BLOCK
      ?auto_88364 - BLOCK
      ?auto_88365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88365 ) ( ON-TABLE ?auto_88356 ) ( ON ?auto_88357 ?auto_88356 ) ( not ( = ?auto_88356 ?auto_88357 ) ) ( not ( = ?auto_88356 ?auto_88358 ) ) ( not ( = ?auto_88356 ?auto_88359 ) ) ( not ( = ?auto_88356 ?auto_88360 ) ) ( not ( = ?auto_88356 ?auto_88361 ) ) ( not ( = ?auto_88356 ?auto_88362 ) ) ( not ( = ?auto_88356 ?auto_88363 ) ) ( not ( = ?auto_88356 ?auto_88364 ) ) ( not ( = ?auto_88356 ?auto_88365 ) ) ( not ( = ?auto_88357 ?auto_88358 ) ) ( not ( = ?auto_88357 ?auto_88359 ) ) ( not ( = ?auto_88357 ?auto_88360 ) ) ( not ( = ?auto_88357 ?auto_88361 ) ) ( not ( = ?auto_88357 ?auto_88362 ) ) ( not ( = ?auto_88357 ?auto_88363 ) ) ( not ( = ?auto_88357 ?auto_88364 ) ) ( not ( = ?auto_88357 ?auto_88365 ) ) ( not ( = ?auto_88358 ?auto_88359 ) ) ( not ( = ?auto_88358 ?auto_88360 ) ) ( not ( = ?auto_88358 ?auto_88361 ) ) ( not ( = ?auto_88358 ?auto_88362 ) ) ( not ( = ?auto_88358 ?auto_88363 ) ) ( not ( = ?auto_88358 ?auto_88364 ) ) ( not ( = ?auto_88358 ?auto_88365 ) ) ( not ( = ?auto_88359 ?auto_88360 ) ) ( not ( = ?auto_88359 ?auto_88361 ) ) ( not ( = ?auto_88359 ?auto_88362 ) ) ( not ( = ?auto_88359 ?auto_88363 ) ) ( not ( = ?auto_88359 ?auto_88364 ) ) ( not ( = ?auto_88359 ?auto_88365 ) ) ( not ( = ?auto_88360 ?auto_88361 ) ) ( not ( = ?auto_88360 ?auto_88362 ) ) ( not ( = ?auto_88360 ?auto_88363 ) ) ( not ( = ?auto_88360 ?auto_88364 ) ) ( not ( = ?auto_88360 ?auto_88365 ) ) ( not ( = ?auto_88361 ?auto_88362 ) ) ( not ( = ?auto_88361 ?auto_88363 ) ) ( not ( = ?auto_88361 ?auto_88364 ) ) ( not ( = ?auto_88361 ?auto_88365 ) ) ( not ( = ?auto_88362 ?auto_88363 ) ) ( not ( = ?auto_88362 ?auto_88364 ) ) ( not ( = ?auto_88362 ?auto_88365 ) ) ( not ( = ?auto_88363 ?auto_88364 ) ) ( not ( = ?auto_88363 ?auto_88365 ) ) ( not ( = ?auto_88364 ?auto_88365 ) ) ( ON ?auto_88364 ?auto_88365 ) ( ON ?auto_88363 ?auto_88364 ) ( ON ?auto_88362 ?auto_88363 ) ( ON ?auto_88361 ?auto_88362 ) ( ON ?auto_88360 ?auto_88361 ) ( ON ?auto_88359 ?auto_88360 ) ( CLEAR ?auto_88357 ) ( ON ?auto_88358 ?auto_88359 ) ( CLEAR ?auto_88358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_88356 ?auto_88357 ?auto_88358 )
      ( MAKE-10PILE ?auto_88356 ?auto_88357 ?auto_88358 ?auto_88359 ?auto_88360 ?auto_88361 ?auto_88362 ?auto_88363 ?auto_88364 ?auto_88365 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88376 - BLOCK
      ?auto_88377 - BLOCK
      ?auto_88378 - BLOCK
      ?auto_88379 - BLOCK
      ?auto_88380 - BLOCK
      ?auto_88381 - BLOCK
      ?auto_88382 - BLOCK
      ?auto_88383 - BLOCK
      ?auto_88384 - BLOCK
      ?auto_88385 - BLOCK
    )
    :vars
    (
      ?auto_88386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88385 ?auto_88386 ) ( ON-TABLE ?auto_88376 ) ( not ( = ?auto_88376 ?auto_88377 ) ) ( not ( = ?auto_88376 ?auto_88378 ) ) ( not ( = ?auto_88376 ?auto_88379 ) ) ( not ( = ?auto_88376 ?auto_88380 ) ) ( not ( = ?auto_88376 ?auto_88381 ) ) ( not ( = ?auto_88376 ?auto_88382 ) ) ( not ( = ?auto_88376 ?auto_88383 ) ) ( not ( = ?auto_88376 ?auto_88384 ) ) ( not ( = ?auto_88376 ?auto_88385 ) ) ( not ( = ?auto_88376 ?auto_88386 ) ) ( not ( = ?auto_88377 ?auto_88378 ) ) ( not ( = ?auto_88377 ?auto_88379 ) ) ( not ( = ?auto_88377 ?auto_88380 ) ) ( not ( = ?auto_88377 ?auto_88381 ) ) ( not ( = ?auto_88377 ?auto_88382 ) ) ( not ( = ?auto_88377 ?auto_88383 ) ) ( not ( = ?auto_88377 ?auto_88384 ) ) ( not ( = ?auto_88377 ?auto_88385 ) ) ( not ( = ?auto_88377 ?auto_88386 ) ) ( not ( = ?auto_88378 ?auto_88379 ) ) ( not ( = ?auto_88378 ?auto_88380 ) ) ( not ( = ?auto_88378 ?auto_88381 ) ) ( not ( = ?auto_88378 ?auto_88382 ) ) ( not ( = ?auto_88378 ?auto_88383 ) ) ( not ( = ?auto_88378 ?auto_88384 ) ) ( not ( = ?auto_88378 ?auto_88385 ) ) ( not ( = ?auto_88378 ?auto_88386 ) ) ( not ( = ?auto_88379 ?auto_88380 ) ) ( not ( = ?auto_88379 ?auto_88381 ) ) ( not ( = ?auto_88379 ?auto_88382 ) ) ( not ( = ?auto_88379 ?auto_88383 ) ) ( not ( = ?auto_88379 ?auto_88384 ) ) ( not ( = ?auto_88379 ?auto_88385 ) ) ( not ( = ?auto_88379 ?auto_88386 ) ) ( not ( = ?auto_88380 ?auto_88381 ) ) ( not ( = ?auto_88380 ?auto_88382 ) ) ( not ( = ?auto_88380 ?auto_88383 ) ) ( not ( = ?auto_88380 ?auto_88384 ) ) ( not ( = ?auto_88380 ?auto_88385 ) ) ( not ( = ?auto_88380 ?auto_88386 ) ) ( not ( = ?auto_88381 ?auto_88382 ) ) ( not ( = ?auto_88381 ?auto_88383 ) ) ( not ( = ?auto_88381 ?auto_88384 ) ) ( not ( = ?auto_88381 ?auto_88385 ) ) ( not ( = ?auto_88381 ?auto_88386 ) ) ( not ( = ?auto_88382 ?auto_88383 ) ) ( not ( = ?auto_88382 ?auto_88384 ) ) ( not ( = ?auto_88382 ?auto_88385 ) ) ( not ( = ?auto_88382 ?auto_88386 ) ) ( not ( = ?auto_88383 ?auto_88384 ) ) ( not ( = ?auto_88383 ?auto_88385 ) ) ( not ( = ?auto_88383 ?auto_88386 ) ) ( not ( = ?auto_88384 ?auto_88385 ) ) ( not ( = ?auto_88384 ?auto_88386 ) ) ( not ( = ?auto_88385 ?auto_88386 ) ) ( ON ?auto_88384 ?auto_88385 ) ( ON ?auto_88383 ?auto_88384 ) ( ON ?auto_88382 ?auto_88383 ) ( ON ?auto_88381 ?auto_88382 ) ( ON ?auto_88380 ?auto_88381 ) ( ON ?auto_88379 ?auto_88380 ) ( ON ?auto_88378 ?auto_88379 ) ( CLEAR ?auto_88376 ) ( ON ?auto_88377 ?auto_88378 ) ( CLEAR ?auto_88377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88376 ?auto_88377 )
      ( MAKE-10PILE ?auto_88376 ?auto_88377 ?auto_88378 ?auto_88379 ?auto_88380 ?auto_88381 ?auto_88382 ?auto_88383 ?auto_88384 ?auto_88385 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88397 - BLOCK
      ?auto_88398 - BLOCK
      ?auto_88399 - BLOCK
      ?auto_88400 - BLOCK
      ?auto_88401 - BLOCK
      ?auto_88402 - BLOCK
      ?auto_88403 - BLOCK
      ?auto_88404 - BLOCK
      ?auto_88405 - BLOCK
      ?auto_88406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88406 ) ( ON-TABLE ?auto_88397 ) ( not ( = ?auto_88397 ?auto_88398 ) ) ( not ( = ?auto_88397 ?auto_88399 ) ) ( not ( = ?auto_88397 ?auto_88400 ) ) ( not ( = ?auto_88397 ?auto_88401 ) ) ( not ( = ?auto_88397 ?auto_88402 ) ) ( not ( = ?auto_88397 ?auto_88403 ) ) ( not ( = ?auto_88397 ?auto_88404 ) ) ( not ( = ?auto_88397 ?auto_88405 ) ) ( not ( = ?auto_88397 ?auto_88406 ) ) ( not ( = ?auto_88398 ?auto_88399 ) ) ( not ( = ?auto_88398 ?auto_88400 ) ) ( not ( = ?auto_88398 ?auto_88401 ) ) ( not ( = ?auto_88398 ?auto_88402 ) ) ( not ( = ?auto_88398 ?auto_88403 ) ) ( not ( = ?auto_88398 ?auto_88404 ) ) ( not ( = ?auto_88398 ?auto_88405 ) ) ( not ( = ?auto_88398 ?auto_88406 ) ) ( not ( = ?auto_88399 ?auto_88400 ) ) ( not ( = ?auto_88399 ?auto_88401 ) ) ( not ( = ?auto_88399 ?auto_88402 ) ) ( not ( = ?auto_88399 ?auto_88403 ) ) ( not ( = ?auto_88399 ?auto_88404 ) ) ( not ( = ?auto_88399 ?auto_88405 ) ) ( not ( = ?auto_88399 ?auto_88406 ) ) ( not ( = ?auto_88400 ?auto_88401 ) ) ( not ( = ?auto_88400 ?auto_88402 ) ) ( not ( = ?auto_88400 ?auto_88403 ) ) ( not ( = ?auto_88400 ?auto_88404 ) ) ( not ( = ?auto_88400 ?auto_88405 ) ) ( not ( = ?auto_88400 ?auto_88406 ) ) ( not ( = ?auto_88401 ?auto_88402 ) ) ( not ( = ?auto_88401 ?auto_88403 ) ) ( not ( = ?auto_88401 ?auto_88404 ) ) ( not ( = ?auto_88401 ?auto_88405 ) ) ( not ( = ?auto_88401 ?auto_88406 ) ) ( not ( = ?auto_88402 ?auto_88403 ) ) ( not ( = ?auto_88402 ?auto_88404 ) ) ( not ( = ?auto_88402 ?auto_88405 ) ) ( not ( = ?auto_88402 ?auto_88406 ) ) ( not ( = ?auto_88403 ?auto_88404 ) ) ( not ( = ?auto_88403 ?auto_88405 ) ) ( not ( = ?auto_88403 ?auto_88406 ) ) ( not ( = ?auto_88404 ?auto_88405 ) ) ( not ( = ?auto_88404 ?auto_88406 ) ) ( not ( = ?auto_88405 ?auto_88406 ) ) ( ON ?auto_88405 ?auto_88406 ) ( ON ?auto_88404 ?auto_88405 ) ( ON ?auto_88403 ?auto_88404 ) ( ON ?auto_88402 ?auto_88403 ) ( ON ?auto_88401 ?auto_88402 ) ( ON ?auto_88400 ?auto_88401 ) ( ON ?auto_88399 ?auto_88400 ) ( CLEAR ?auto_88397 ) ( ON ?auto_88398 ?auto_88399 ) ( CLEAR ?auto_88398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_88397 ?auto_88398 )
      ( MAKE-10PILE ?auto_88397 ?auto_88398 ?auto_88399 ?auto_88400 ?auto_88401 ?auto_88402 ?auto_88403 ?auto_88404 ?auto_88405 ?auto_88406 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88417 - BLOCK
      ?auto_88418 - BLOCK
      ?auto_88419 - BLOCK
      ?auto_88420 - BLOCK
      ?auto_88421 - BLOCK
      ?auto_88422 - BLOCK
      ?auto_88423 - BLOCK
      ?auto_88424 - BLOCK
      ?auto_88425 - BLOCK
      ?auto_88426 - BLOCK
    )
    :vars
    (
      ?auto_88427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88426 ?auto_88427 ) ( not ( = ?auto_88417 ?auto_88418 ) ) ( not ( = ?auto_88417 ?auto_88419 ) ) ( not ( = ?auto_88417 ?auto_88420 ) ) ( not ( = ?auto_88417 ?auto_88421 ) ) ( not ( = ?auto_88417 ?auto_88422 ) ) ( not ( = ?auto_88417 ?auto_88423 ) ) ( not ( = ?auto_88417 ?auto_88424 ) ) ( not ( = ?auto_88417 ?auto_88425 ) ) ( not ( = ?auto_88417 ?auto_88426 ) ) ( not ( = ?auto_88417 ?auto_88427 ) ) ( not ( = ?auto_88418 ?auto_88419 ) ) ( not ( = ?auto_88418 ?auto_88420 ) ) ( not ( = ?auto_88418 ?auto_88421 ) ) ( not ( = ?auto_88418 ?auto_88422 ) ) ( not ( = ?auto_88418 ?auto_88423 ) ) ( not ( = ?auto_88418 ?auto_88424 ) ) ( not ( = ?auto_88418 ?auto_88425 ) ) ( not ( = ?auto_88418 ?auto_88426 ) ) ( not ( = ?auto_88418 ?auto_88427 ) ) ( not ( = ?auto_88419 ?auto_88420 ) ) ( not ( = ?auto_88419 ?auto_88421 ) ) ( not ( = ?auto_88419 ?auto_88422 ) ) ( not ( = ?auto_88419 ?auto_88423 ) ) ( not ( = ?auto_88419 ?auto_88424 ) ) ( not ( = ?auto_88419 ?auto_88425 ) ) ( not ( = ?auto_88419 ?auto_88426 ) ) ( not ( = ?auto_88419 ?auto_88427 ) ) ( not ( = ?auto_88420 ?auto_88421 ) ) ( not ( = ?auto_88420 ?auto_88422 ) ) ( not ( = ?auto_88420 ?auto_88423 ) ) ( not ( = ?auto_88420 ?auto_88424 ) ) ( not ( = ?auto_88420 ?auto_88425 ) ) ( not ( = ?auto_88420 ?auto_88426 ) ) ( not ( = ?auto_88420 ?auto_88427 ) ) ( not ( = ?auto_88421 ?auto_88422 ) ) ( not ( = ?auto_88421 ?auto_88423 ) ) ( not ( = ?auto_88421 ?auto_88424 ) ) ( not ( = ?auto_88421 ?auto_88425 ) ) ( not ( = ?auto_88421 ?auto_88426 ) ) ( not ( = ?auto_88421 ?auto_88427 ) ) ( not ( = ?auto_88422 ?auto_88423 ) ) ( not ( = ?auto_88422 ?auto_88424 ) ) ( not ( = ?auto_88422 ?auto_88425 ) ) ( not ( = ?auto_88422 ?auto_88426 ) ) ( not ( = ?auto_88422 ?auto_88427 ) ) ( not ( = ?auto_88423 ?auto_88424 ) ) ( not ( = ?auto_88423 ?auto_88425 ) ) ( not ( = ?auto_88423 ?auto_88426 ) ) ( not ( = ?auto_88423 ?auto_88427 ) ) ( not ( = ?auto_88424 ?auto_88425 ) ) ( not ( = ?auto_88424 ?auto_88426 ) ) ( not ( = ?auto_88424 ?auto_88427 ) ) ( not ( = ?auto_88425 ?auto_88426 ) ) ( not ( = ?auto_88425 ?auto_88427 ) ) ( not ( = ?auto_88426 ?auto_88427 ) ) ( ON ?auto_88425 ?auto_88426 ) ( ON ?auto_88424 ?auto_88425 ) ( ON ?auto_88423 ?auto_88424 ) ( ON ?auto_88422 ?auto_88423 ) ( ON ?auto_88421 ?auto_88422 ) ( ON ?auto_88420 ?auto_88421 ) ( ON ?auto_88419 ?auto_88420 ) ( ON ?auto_88418 ?auto_88419 ) ( ON ?auto_88417 ?auto_88418 ) ( CLEAR ?auto_88417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88417 )
      ( MAKE-10PILE ?auto_88417 ?auto_88418 ?auto_88419 ?auto_88420 ?auto_88421 ?auto_88422 ?auto_88423 ?auto_88424 ?auto_88425 ?auto_88426 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88438 - BLOCK
      ?auto_88439 - BLOCK
      ?auto_88440 - BLOCK
      ?auto_88441 - BLOCK
      ?auto_88442 - BLOCK
      ?auto_88443 - BLOCK
      ?auto_88444 - BLOCK
      ?auto_88445 - BLOCK
      ?auto_88446 - BLOCK
      ?auto_88447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_88447 ) ( not ( = ?auto_88438 ?auto_88439 ) ) ( not ( = ?auto_88438 ?auto_88440 ) ) ( not ( = ?auto_88438 ?auto_88441 ) ) ( not ( = ?auto_88438 ?auto_88442 ) ) ( not ( = ?auto_88438 ?auto_88443 ) ) ( not ( = ?auto_88438 ?auto_88444 ) ) ( not ( = ?auto_88438 ?auto_88445 ) ) ( not ( = ?auto_88438 ?auto_88446 ) ) ( not ( = ?auto_88438 ?auto_88447 ) ) ( not ( = ?auto_88439 ?auto_88440 ) ) ( not ( = ?auto_88439 ?auto_88441 ) ) ( not ( = ?auto_88439 ?auto_88442 ) ) ( not ( = ?auto_88439 ?auto_88443 ) ) ( not ( = ?auto_88439 ?auto_88444 ) ) ( not ( = ?auto_88439 ?auto_88445 ) ) ( not ( = ?auto_88439 ?auto_88446 ) ) ( not ( = ?auto_88439 ?auto_88447 ) ) ( not ( = ?auto_88440 ?auto_88441 ) ) ( not ( = ?auto_88440 ?auto_88442 ) ) ( not ( = ?auto_88440 ?auto_88443 ) ) ( not ( = ?auto_88440 ?auto_88444 ) ) ( not ( = ?auto_88440 ?auto_88445 ) ) ( not ( = ?auto_88440 ?auto_88446 ) ) ( not ( = ?auto_88440 ?auto_88447 ) ) ( not ( = ?auto_88441 ?auto_88442 ) ) ( not ( = ?auto_88441 ?auto_88443 ) ) ( not ( = ?auto_88441 ?auto_88444 ) ) ( not ( = ?auto_88441 ?auto_88445 ) ) ( not ( = ?auto_88441 ?auto_88446 ) ) ( not ( = ?auto_88441 ?auto_88447 ) ) ( not ( = ?auto_88442 ?auto_88443 ) ) ( not ( = ?auto_88442 ?auto_88444 ) ) ( not ( = ?auto_88442 ?auto_88445 ) ) ( not ( = ?auto_88442 ?auto_88446 ) ) ( not ( = ?auto_88442 ?auto_88447 ) ) ( not ( = ?auto_88443 ?auto_88444 ) ) ( not ( = ?auto_88443 ?auto_88445 ) ) ( not ( = ?auto_88443 ?auto_88446 ) ) ( not ( = ?auto_88443 ?auto_88447 ) ) ( not ( = ?auto_88444 ?auto_88445 ) ) ( not ( = ?auto_88444 ?auto_88446 ) ) ( not ( = ?auto_88444 ?auto_88447 ) ) ( not ( = ?auto_88445 ?auto_88446 ) ) ( not ( = ?auto_88445 ?auto_88447 ) ) ( not ( = ?auto_88446 ?auto_88447 ) ) ( ON ?auto_88446 ?auto_88447 ) ( ON ?auto_88445 ?auto_88446 ) ( ON ?auto_88444 ?auto_88445 ) ( ON ?auto_88443 ?auto_88444 ) ( ON ?auto_88442 ?auto_88443 ) ( ON ?auto_88441 ?auto_88442 ) ( ON ?auto_88440 ?auto_88441 ) ( ON ?auto_88439 ?auto_88440 ) ( ON ?auto_88438 ?auto_88439 ) ( CLEAR ?auto_88438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_88438 )
      ( MAKE-10PILE ?auto_88438 ?auto_88439 ?auto_88440 ?auto_88441 ?auto_88442 ?auto_88443 ?auto_88444 ?auto_88445 ?auto_88446 ?auto_88447 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_88458 - BLOCK
      ?auto_88459 - BLOCK
      ?auto_88460 - BLOCK
      ?auto_88461 - BLOCK
      ?auto_88462 - BLOCK
      ?auto_88463 - BLOCK
      ?auto_88464 - BLOCK
      ?auto_88465 - BLOCK
      ?auto_88466 - BLOCK
      ?auto_88467 - BLOCK
    )
    :vars
    (
      ?auto_88468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_88458 ?auto_88459 ) ) ( not ( = ?auto_88458 ?auto_88460 ) ) ( not ( = ?auto_88458 ?auto_88461 ) ) ( not ( = ?auto_88458 ?auto_88462 ) ) ( not ( = ?auto_88458 ?auto_88463 ) ) ( not ( = ?auto_88458 ?auto_88464 ) ) ( not ( = ?auto_88458 ?auto_88465 ) ) ( not ( = ?auto_88458 ?auto_88466 ) ) ( not ( = ?auto_88458 ?auto_88467 ) ) ( not ( = ?auto_88459 ?auto_88460 ) ) ( not ( = ?auto_88459 ?auto_88461 ) ) ( not ( = ?auto_88459 ?auto_88462 ) ) ( not ( = ?auto_88459 ?auto_88463 ) ) ( not ( = ?auto_88459 ?auto_88464 ) ) ( not ( = ?auto_88459 ?auto_88465 ) ) ( not ( = ?auto_88459 ?auto_88466 ) ) ( not ( = ?auto_88459 ?auto_88467 ) ) ( not ( = ?auto_88460 ?auto_88461 ) ) ( not ( = ?auto_88460 ?auto_88462 ) ) ( not ( = ?auto_88460 ?auto_88463 ) ) ( not ( = ?auto_88460 ?auto_88464 ) ) ( not ( = ?auto_88460 ?auto_88465 ) ) ( not ( = ?auto_88460 ?auto_88466 ) ) ( not ( = ?auto_88460 ?auto_88467 ) ) ( not ( = ?auto_88461 ?auto_88462 ) ) ( not ( = ?auto_88461 ?auto_88463 ) ) ( not ( = ?auto_88461 ?auto_88464 ) ) ( not ( = ?auto_88461 ?auto_88465 ) ) ( not ( = ?auto_88461 ?auto_88466 ) ) ( not ( = ?auto_88461 ?auto_88467 ) ) ( not ( = ?auto_88462 ?auto_88463 ) ) ( not ( = ?auto_88462 ?auto_88464 ) ) ( not ( = ?auto_88462 ?auto_88465 ) ) ( not ( = ?auto_88462 ?auto_88466 ) ) ( not ( = ?auto_88462 ?auto_88467 ) ) ( not ( = ?auto_88463 ?auto_88464 ) ) ( not ( = ?auto_88463 ?auto_88465 ) ) ( not ( = ?auto_88463 ?auto_88466 ) ) ( not ( = ?auto_88463 ?auto_88467 ) ) ( not ( = ?auto_88464 ?auto_88465 ) ) ( not ( = ?auto_88464 ?auto_88466 ) ) ( not ( = ?auto_88464 ?auto_88467 ) ) ( not ( = ?auto_88465 ?auto_88466 ) ) ( not ( = ?auto_88465 ?auto_88467 ) ) ( not ( = ?auto_88466 ?auto_88467 ) ) ( ON ?auto_88458 ?auto_88468 ) ( not ( = ?auto_88467 ?auto_88468 ) ) ( not ( = ?auto_88466 ?auto_88468 ) ) ( not ( = ?auto_88465 ?auto_88468 ) ) ( not ( = ?auto_88464 ?auto_88468 ) ) ( not ( = ?auto_88463 ?auto_88468 ) ) ( not ( = ?auto_88462 ?auto_88468 ) ) ( not ( = ?auto_88461 ?auto_88468 ) ) ( not ( = ?auto_88460 ?auto_88468 ) ) ( not ( = ?auto_88459 ?auto_88468 ) ) ( not ( = ?auto_88458 ?auto_88468 ) ) ( ON ?auto_88459 ?auto_88458 ) ( ON ?auto_88460 ?auto_88459 ) ( ON ?auto_88461 ?auto_88460 ) ( ON ?auto_88462 ?auto_88461 ) ( ON ?auto_88463 ?auto_88462 ) ( ON ?auto_88464 ?auto_88463 ) ( ON ?auto_88465 ?auto_88464 ) ( ON ?auto_88466 ?auto_88465 ) ( ON ?auto_88467 ?auto_88466 ) ( CLEAR ?auto_88467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_88467 ?auto_88466 ?auto_88465 ?auto_88464 ?auto_88463 ?auto_88462 ?auto_88461 ?auto_88460 ?auto_88459 ?auto_88458 )
      ( MAKE-10PILE ?auto_88458 ?auto_88459 ?auto_88460 ?auto_88461 ?auto_88462 ?auto_88463 ?auto_88464 ?auto_88465 ?auto_88466 ?auto_88467 ) )
  )

)

